unit uDadosCobradores;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, Vcl.Dialogs, System.UITypes;

const
  NENHUM_COBRADOR_SELECIONADO = 'Nenhum cobrador está selecionado.';

type
  TdmDadosCobradores = class(TDataModule)
    sqlTblcob: TSQLDataSet;
    dspTblcob: TDataSetProvider;
    cdsTblcob: TClientDataSet;
    cdsTblcobcobcod: TIntegerField;
    cdsTblcobcobnome: TStringField;
    procedure dspTblcobUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure cdsTblcobNewRecord(DataSet: TDataSet);
    procedure cdsTblcobcobnomeValidate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FiltrarCobradores(ACodigo: Integer = 0; ANome: String = '');
    procedure PosicionarCobrador(ACodigo: integer);
    procedure AdicionarCobrador;
    procedure EditarCobrador;
    procedure ExcluirCobrador;
    procedure SalvarCobrador;
    procedure CalcelarManutencaoCobrador;

    function GetNomeCobrador(Acobcod: Integer): String;
  end;

var
  dmDadosCobradores: TdmDadosCobradores;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses uConexao;

{$R *.dfm}

procedure TdmDadosCobradores.AdicionarCobrador;
begin
  if not cdsTblcob.Active then
    FiltrarCobradores;

  CalcelarManutencaoCobrador;

  cdsTblcob.Append;
end;

procedure TdmDadosCobradores.CalcelarManutencaoCobrador;
begin
  if not cdsTblcob.Active then
    exit;

  if cdsTblcob.State in [dsEdit, dsInsert] then
    cdsTblcob.Cancel;

  if cdsTblcob.ChangeCount > 0 then
    cdsTblcob.CancelUpdates;
end;

procedure TdmDadosCobradores.cdsTblcobcobnomeValidate(Sender: TField);
begin
  if trim(cdsTblcobcobnome.AsString) = EmptyStr then
    raise Exception.Create('Nome do cobrador não pode ser nulo.');
end;

procedure TdmDadosCobradores.cdsTblcobNewRecord(DataSet: TDataSet);
begin
  cdsTblcob.Tag := 1;
  try
    cdsTblcobcobcod.Value := 0; // campo auto-incremento
  finally
    cdsTblcob.Tag := 0;
  end;
end;

procedure TdmDadosCobradores.dspTblcobUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(e.Message);
end;

procedure TdmDadosCobradores.EditarCobrador;
begin
  if not cdsTblcob.Active then
    raise Exception.Create(NENHUM_COBRADOR_SELECIONADO);

  if cdsTblcob.RecordCount = 0 then
    raise Exception.Create(NENHUM_COBRADOR_SELECIONADO);

  cdsTblcob.Edit;
end;

procedure TdmDadosCobradores.ExcluirCobrador;
begin
  if not cdsTblcob.Active then
    raise Exception.Create(NENHUM_COBRADOR_SELECIONADO);

  if cdsTblcob.RecordCount = 0 then
    raise Exception.Create(NENHUM_COBRADOR_SELECIONADO);

  if MessageDlg('Deseja realmente excluir o cobrador selecionado?', mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    exit;

  cdsTblcob.Delete;

  try
    cdsTblcob.Tag := 1;

    SalvarCobrador;
  finally
    cdsTblcob.Tag := 0;
  end;
end;

procedure TdmDadosCobradores.FiltrarCobradores(ACodigo: Integer; ANome: String);
var
  SQL: String;
  CodigoCobrador: integer;
begin
  // Será utilizado para posicionar na lista
  if cdsTblcob.Active then
    CodigoCobrador := cdsTblcobcobcod.AsInteger
  else
    CodigoCobrador := -1;

  ANome:= trim(ANome);

  SQL := 'select * from tblcob';

  if (ACodigo = 0) and (ANome = EmptyStr) then
  begin
    SQL := SQL + ' where 1 = 2';
  end
  else
  begin
    SQL := SQL + ' where 1 = 1';

    if ACodigo > 0 then
      SQL := SQL + ' and cobcod = ' + IntToStr(ACodigo);

    if ANome <> EmptyStr then
      SQL := SQL + ' and cobnome like "%' + ANome + '%"';
  end;

  SQL := SQL + ' order by cobnome';

  sqlTblcob.Close;
  sqlTblcob.CommandText := SQL;

  cdsTblcob.DisableControls;
  try
    cdsTblcob.Close;
    cdsTblcob.Open;

    PosicionarCobrador(CodigoCobrador);
  finally
    cdsTblcob.EnableControls;
  end;
end;

function TdmDadosCobradores.GetNomeCobrador(Acobcod: Integer): String;
begin
  FiltrarCobradores(Acobcod, '');

  if cdsTblcob.RecordCount > 0 then
    Result := trim(cdsTblcobcobnome.Value)
  else
    Result := '';
end;

procedure TdmDadosCobradores.PosicionarCobrador(ACodigo: integer);
begin
  if not cdsTblcob.Active then
    exit;

  if cdsTblcob.RecordCount = 0 then
    exit;

  if ACodigo = -1 then
    exit;

  cdsTblcob.Locate('cobcod', ACodigo, []);
end;

procedure TdmDadosCobradores.SalvarCobrador;
begin
  if not cdsTblcob.Active then
    raise Exception.Create(NENHUM_COBRADOR_SELECIONADO);

  // ---------------------------------------------------------------------------
  // Aplica mais uma vez os métodos de validação
  // ---------------------------------------------------------------------------

  cdsTblcobcobnomeValidate(cdsTblcobcobnome);

  try
    if cdsTblcob.State in [dsEdit, dsInsert] then
      cdsTblcob.Post;

    cdsTblcob.ApplyUpdates(0);
  except
    on E: Exception do
    begin
      if cdsTblcob.ChangeCount > 0 then
        cdsTblcob.Cancel;

      if pos('key violation', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Cobrador informado já está cadastrado.')
      else if pos('duplicate entry', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Cobrador informado já está cadastrado.')
      else if pos('foreign key constraint fails', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Não é possível excluir este cobrador, pois existem assinantes que estão ligados a este cobrador.')
      else
        raise Exception.Create(e.Message);
    end;
  end;
end;

end.
