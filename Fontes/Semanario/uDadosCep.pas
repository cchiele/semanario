unit uDadosCep;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, Vcl.Dialogs, System.UITypes,
  Data.DBXCommon;

type
  TdmDadosCep = class(TDataModule)
    sqlTblcep: TSQLDataSet;
    dspTblcep: TDataSetProvider;
    cdsTblcep: TClientDataSet;
    cdsTblcepcepcep: TStringField;
    cdsTblcepcepmunicipio: TStringField;
    cdsTblcepcepeuf: TStringField;
    procedure dspTblcepUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure cdsTblcepAfterInsert(DataSet: TDataSet);
    procedure cdsTblcepcepcepValidate(Sender: TField);
    procedure cdsTblcepcepmunicipioValidate(Sender: TField);
    procedure cdsTblcepcepeufValidate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FiltrarCeps(ACep: String = ''; AMunicipio: String = ''; AUf: String = '');
    procedure PosicionarCep(ACEP: String);
    procedure AdicionarCep;
    procedure EditarCep;
    procedure ExcluirCep;
    procedure SalvarCep;
    procedure CalcelarCep;

    // Método específico para o cadastro de um novo CEP a partir da tela de
    // cadastro de assinante, quando já tem uma transação em aberto.
    // Este método instacia uma nova conexao e transação exclusiva para este método.
    procedure AdicionarNovoCep(ACep: String; AMunicipio: String; AUf: String);
  end;

var
  dmDadosCep: TdmDadosCep;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses uConexao, uDadosGlobal;

{$R *.dfm}

{ TdmDadosCep }

procedure TdmDadosCep.AdicionarCep;
begin
  if not cdsTblcep.Active then
    FiltrarCeps;

  CalcelarCep;

  cdsTblcep.Append;
end;

procedure TdmDadosCep.AdicionarNovoCep(ACep, AMunicipio, AUf: String);
var
  lTransaction: TDBXTransaction;
begin
  // Verifica se o CEP já existe.
  FiltrarCeps(ACep);

  // Se já existe, não precisa fazer nada
  if cdsTblcep.RecordCount > 0 then
    exit;

  // Adiciona uma nova linha no ClientDataSet
  AdicionarCep;

  cdsTblcepcepcep.Value := ACep;
  cdsTblcepcepmunicipio.Value := AMunicipio;
  cdsTblcepcepeuf.Value := AUf;

  lTransaction := nil;
  try
    lTransaction := dmConexao.SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);

    // Salva o ClientDataSet no banco
    SalvarCep;

    // Finaliza a transação
    dmConexao.SQLConnection.CommitFreeAndNil(lTransaction);
  finally
    if Assigned(lTransaction) then
      if dmConexao.SQLConnection.InTransaction then
        dmConexao.SQLConnection.RollbackFreeAndNil(lTransaction);
  end;
end;

procedure TdmDadosCep.CalcelarCep;
begin
  if not cdsTblcep.Active then
    exit;

  if cdsTblcep.State in [dsEdit, dsInsert] then
    cdsTblcep.Cancel;

  if cdsTblcep.ChangeCount > 0 then
    cdsTblcep.CancelUpdates;
end;

procedure TdmDadosCep.cdsTblcepAfterInsert(DataSet: TDataSet);
begin
  cdsTblcep.Tag := 1;
  try
    cdsTblcepcepeuf.Value := 'RS';
  finally
    cdsTblcep.Tag := 0;
  end;
end;

procedure TdmDadosCep.cdsTblcepcepcepValidate(Sender: TField);
begin
  if cdsTblcep.Tag = 1 then
    exit;

  if trim(cdsTblcepcepcep.AsString) = EmptyStr then
    raise Exception.Create('CEP não pode ser nulo.');

end;

procedure TdmDadosCep.cdsTblcepcepeufValidate(Sender: TField);
begin
  if cdsTblcep.Tag = 1 then
    exit;

  if trim(cdsTblcepcepeuf.AsString) = EmptyStr then
    raise Exception.Create('UF não pode ser nulo.');
end;

procedure TdmDadosCep.cdsTblcepcepmunicipioValidate(Sender: TField);
begin
  if cdsTblcep.Tag = 1 then
    exit;

  if trim(cdsTblcepcepmunicipio.AsString) = EmptyStr then
    raise Exception.Create('Município não pode ser nulo.');
end;

procedure TdmDadosCep.dspTblcepUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(e.Message);
end;

procedure TdmDadosCep.EditarCep;
begin
  if not cdsTblcep.Active then
    raise Exception.Create('Nenhum CEP está selecionado.');

  if cdsTblcep.RecordCount = 0 then
    raise Exception.Create('Nenhum CEP está selecionado.');

  cdsTblcep.Edit;
end;

procedure TdmDadosCep.ExcluirCep;
begin
  if not cdsTblcep.Active then
    raise Exception.Create('Nenhum CEP está selecionado.');

  if cdsTblcep.RecordCount = 0 then
    raise Exception.Create('Nenhum CEP está selecionado.');

  if MessageDlg('Deseja realmente excluir o CEP selecionado?', mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    exit;

  cdsTblcep.Delete;

  try
    cdsTblcep.Tag := 1;

    SalvarCep;
  finally
    cdsTblcep.Tag := 0;
  end;
end;

procedure TdmDadosCep.FiltrarCeps(ACep, AMunicipio, AUf: String);
var
  SQL: String;
  CepSelecionado: String;
begin
  // Será utilizado para posicionar na lista
  if cdsTblcep.Active then
    CepSelecionado := cdsTblcepcepcep.AsString
  else
    CepSelecionado := '';

  ACep := trim(ACep);
  AMunicipio := trim(AMunicipio);
  AUf := trim(AUf);

  if ACep = '-' then
    ACep := '';

  SQL := 'select * from tblcep';

  if (ACep = EmptyStr) and (AMunicipio = EmptyStr) and (AUf = EmptyStr) then
  begin
    SQL := SQL + ' where 1 = 2';
  end
  else
  begin
    SQL := SQL + ' where 1 = 1';

    if ACep <> EmptyStr then
      SQL := SQL + ' and cepcep = "' + ACep + '"';

    if AMunicipio <> EmptyStr then
      SQL := SQL + ' and cepmunicipio like "%' + AMunicipio + '%"';

    if AUf <> EmptyStr then
      SQL := SQL + ' and cepeuf = "' + AUf + '"';
  end;

  SQL := SQL + ' order by cepmunicipio';

  sqlTblcep.Close;
  sqlTblcep.CommandText := SQL;

  cdsTblcep.DisableControls;
  try
    cdsTblcep.Close;
    cdsTblcep.Open;

    PosicionarCep(CepSelecionado);
  finally
    cdsTblcep.EnableControls;
  end;
end;

procedure TdmDadosCep.PosicionarCep(ACEP: String);
begin
  if not cdsTblcep.Active then
    exit;

  if cdsTblcep.RecordCount = 0 then
    exit;

  if trim(ACEP) = '-' then
    exit;

  cdsTblcep.Locate('cepcep', ACEP, []);
end;

procedure TdmDadosCep.SalvarCep;
begin
  if not cdsTblcep.Active then
    raise Exception.Create('Nenhum CEP está selecionado.');

  // ---------------------------------------------------------------------------
  // Aplica mais uma vez os métodos de validação
  // ---------------------------------------------------------------------------

  if cdsTblcep.State in [dsInsert] then
    cdsTblcepcepcepValidate(cdsTblcepcepcep);

  cdsTblcepcepmunicipioValidate(cdsTblcepcepmunicipio);
  cdsTblcepcepeufValidate(cdsTblcepcepeuf);

  try
    if cdsTblcep.State in [dsEdit, dsInsert] then
      cdsTblcep.Post;

    cdsTblcep.ApplyUpdates(0);
  except
    on E: Exception do
    begin
      if cdsTblcep.ChangeCount > 0 then
        cdsTblcep.Cancel;

      if pos('key violation', LowerCase(e.Message)) > 0 then
        raise Exception.Create('CEP informado já está cadastrado.')
      else if pos('duplicate entry', LowerCase(e.Message)) > 0 then
        raise Exception.Create('CEP informado já está cadastrado.')
      else if pos('foreign key constraint fails', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Não é possível excluir este CEP, pois existem assinantes que utilizam este CEP.')
      else
        raise Exception.Create(e.Message);
    end;
  end;
end;

end.
