unit uDadosEmpresa;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr;

type
  TdmDadosEmpresa = class(TDataModule)
    sqlTblemp: TSQLDataSet;
    dspTblemp: TDataSetProvider;
    cdsTblemp: TClientDataSet;
    cdsTblempempcnpj: TStringField;
    cdsTblempemprazaosocial: TStringField;
    cdsTblempempie: TStringField;
    cdsTblempempender: TStringField;
    cdsTblempempnro: TStringField;
    cdsTblempempcompl: TStringField;
    cdsTblempempbairro: TStringField;
    cdsTblempcepcep: TStringField;
    sqlTblcep: TSQLDataSet;
    dsTblcep: TDataSource;
    sqlTblcepcepcep: TStringField;
    sqlTblcepcepmunicipio: TStringField;
    sqlTblcepcepeuf: TStringField;
    cdsTblempempfone: TStringField;
    procedure dspTblempUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure cdsTblempempcnpjValidate(Sender: TField);
    procedure cdsTblempemprazaosocialValidate(Sender: TField);
    procedure cdsTblempempieValidate(Sender: TField);
    procedure cdsTblempempenderValidate(Sender: TField);
    procedure cdsTblempempnroValidate(Sender: TField);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsTblempcepcepValidate(Sender: TField);
    procedure cdsTblempAfterOpen(DataSet: TDataSet);
    procedure cdsTblempBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FiltrarEmpresas;
    procedure EditarEmpresa;
    procedure SalvarManutencao;
    procedure CalcelarManutencao;
  end;

var
  dmDadosEmpresa: TdmDadosEmpresa;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses uConexao, uDadosGlobal;

{$R *.dfm}

procedure TdmDadosEmpresa.CalcelarManutencao;
begin
  if not cdsTblemp.Active then
    abort;

  if cdsTblemp.State in [dsEdit, dsInsert] then
    cdsTblemp.Cancel;

  if cdsTblemp.ChangeCount > 0 then
    cdsTblemp.CancelUpdates;
end;

procedure TdmDadosEmpresa.cdsTblempAfterOpen(DataSet: TDataSet);
begin
  sqlTblcep.Open;
end;

procedure TdmDadosEmpresa.cdsTblempBeforePost(DataSet: TDataSet);
begin
  // Faço isso para que, caso não seja informado os telefones,
  // para não gravar na base de dados apenas os "(  )"

  if trim(cdsTblempempfone.AsString) = '(  )' then
    cdsTblempempfone.AsString := '';
end;

procedure TdmDadosEmpresa.cdsTblempcepcepValidate(Sender: TField);
begin
  sqlTblcep.Close;
  sqlTblcep.ParamByName('cepcep').AsString := cdsTblempcepcep.AsString;
  sqlTblcep.Open;

  if sqlTblcep.Eof then
    raise Exception.Create('CEP informado não está cadastrado.');
end;

procedure TdmDadosEmpresa.cdsTblempempcnpjValidate(Sender: TField);
begin
  // Validar CNPJ
  if not dmDadosGlobal.ValidarCNPJ(cdsTblempempcnpj.Value) then
    raise Exception.Create('CNPJ inválido.');
end;

procedure TdmDadosEmpresa.cdsTblempempenderValidate(Sender: TField);
begin
  if trim(cdsTblempempender.Value) = EmptyStr then
    raise Exception.Create('Endereço não pode ser nulo.');
end;

procedure TdmDadosEmpresa.cdsTblempempieValidate(Sender: TField);
begin
  if trim(cdsTblempempie.Value) = EmptyStr then
    raise Exception.Create('Inscrição Estatual não pode ser nula.');
end;

procedure TdmDadosEmpresa.cdsTblempempnroValidate(Sender: TField);
begin
  if trim(cdsTblempempnro.Value) = EmptyStr then
    raise Exception.Create('Número da rua não pode ser nulo.');
end;

procedure TdmDadosEmpresa.cdsTblempemprazaosocialValidate(Sender: TField);
begin
  if trim(cdsTblempemprazaosocial.Value) = EmptyStr then
    raise Exception.Create('Razão Social não pode ser nula.');
end;

procedure TdmDadosEmpresa.DataModuleCreate(Sender: TObject);
begin
  FiltrarEmpresas;
end;

procedure TdmDadosEmpresa.dspTblempUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(e.Message);
end;

procedure TdmDadosEmpresa.EditarEmpresa;
begin
  if not cdsTblemp.Active then
    cdsTblemp.Open;

  if cdsTblemp.RecordCount = 0 then
    cdsTblemp.Append
  else
    cdsTblemp.Edit;
end;

procedure TdmDadosEmpresa.FiltrarEmpresas;
begin
  cdsTblemp.Close;
  cdsTblemp.Open;
end;

procedure TdmDadosEmpresa.SalvarManutencao;
begin
  if not cdsTblemp.Active then
    abort;

  // Força novamente a validação do campos
  cdsTblempempcnpj.OnValidate(cdsTblempempcnpj);
  cdsTblempemprazaosocial.OnValidate(cdsTblempemprazaosocial);
  cdsTblempempie.OnValidate(cdsTblempempie);
  cdsTblempempender.OnValidate(cdsTblempempender);
  cdsTblempempnro.OnValidate(cdsTblempempnro);
  cdsTblempcepcep.OnValidate(cdsTblempcepcep);

  try
    if cdsTblemp.State in [dsEdit, dsInsert] then
      cdsTblemp.Post;

    cdsTblemp.ApplyUpdates(0);
  except
    on E: Exception do
    begin
      if cdsTblemp.ChangeCount > 0 then
        cdsTblemp.Cancel;

      if pos('key violation', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Empresa informado já está cadastrado.')
      else if pos('duplicate entry', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Empresa informado já está cadastrado.')
      else if pos('foreign key constraint fails', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Não é possível excluir esta empresa, pois esta empresa está relacionada a outras tabelas.')
      else if pos('changed by another user', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Atenção:' + chr(10) + 'O registro que você está tentando modificar acaba de ser modificado por outro usuário.' + chr(10) + 'Cancele a operação e realize uma nova filtragem.')
      else
        raise Exception.Create(e.Message);
    end;
  end;
end;

end.
