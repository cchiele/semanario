unit uDadosVendedores;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, Vcl.Dialogs, System.UITypes;

const
  NENHUM_GRUPO_SELECIONADO = 'Nenhum grupo está selecionado.';
  NENHUM_VENDEDOR_SELECIONADO = 'Nenhum vendedor está selecionado.';

type
  TdmDadosVendedores = class(TDataModule)
    sqlTblgdv: TSQLDataSet;
    dspTblgdv: TDataSetProvider;
    cdsTblgdv: TClientDataSet;
    cdsTblgdvgdvcod: TIntegerField;
    cdsTblgdvgdvdescr: TStringField;
    sqlTblven: TSQLDataSet;
    dspTblven: TDataSetProvider;
    cdsTblven: TClientDataSet;
    cdsTblvenvencod: TIntegerField;
    cdsTblvenvennome: TStringField;
    cdsTblvengdvcod: TIntegerField;
    cdsTblvenvenfone: TStringField;
    cdsTblvenLookupGdvdescr: TStringField;
    sqlLookupGrupos: TSQLDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    dsplLookupGrupos: TDataSetProvider;
    cdslLookupGrupos: TClientDataSet;
    cdslLookupGruposgdvcod: TIntegerField;
    cdslLookupGruposgdvdescr: TStringField;
    sqlFiltroGrupos: TSQLDataSet;
    dspFiltroGrupos: TDataSetProvider;
    cdsFiltroGrupos: TClientDataSet;
    cdsFiltroGruposgdvcod: TLargeintField;
    cdsFiltroGruposgdvdescr: TStringField;
    sqlListaVendedores: TSQLDataSet;
    dspListaVendedores: TDataSetProvider;
    cdsListaVendedores: TClientDataSet;
    cdsListaVendedoresvencod: TIntegerField;
    cdsListaVendedoresvennome: TStringField;
    procedure dspTblgdvUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure cdsTblgdvNewRecord(DataSet: TDataSet);
    procedure cdsTblgdvgdvdescrValidate(Sender: TField);
    procedure cdsTblvenNewRecord(DataSet: TDataSet);
    procedure cdsTblvenBeforePost(DataSet: TDataSet);
    procedure cdsTblvenvennomeValidate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CarregarListaVendedores;

    procedure FiltrarVendedores(ACodigoVendedor: Integer = 0; ANome: String = ''; ACodigoGrupo: integer = 0);
    procedure PosicionarVendedor(ACodigo: integer);
    procedure AdicionarVendedor;
    procedure EditarVendedor;
    procedure ExcluirVendedor;
    procedure SalvarVendedor;
    procedure CalcelarManutencaoVendedor;

    procedure FiltrarGrupos(ACodigo: Integer = 0; ADescr: String = '');
    procedure PosicionarGrupo(ACodigo: integer);
    procedure AdicionarGrupo;
    procedure EditarGrupo;
    procedure ExcluirGrupo;
    procedure SalvarGrupo;
    procedure CalcelarManutencaoGrupo;

    procedure CarregarFiltroGrupos;

    function GetNomeVendedor(Avencod: Integer): String;
  end;

var
  dmDadosVendedores: TdmDadosVendedores;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses uConexao;

{$R *.dfm}

procedure TdmDadosVendedores.AdicionarGrupo;
begin
  if not cdsTblgdv.Active then
    FiltrarGrupos;

  CalcelarManutencaoGrupo;

  cdsTblgdv.Append;
end;

procedure TdmDadosVendedores.AdicionarVendedor;
begin
  if not cdsTblven.Active then
    FiltrarVendedores;

  CalcelarManutencaoVendedor;

  cdsTblven.Append;
end;

procedure TdmDadosVendedores.CalcelarManutencaoGrupo;
begin
  if not cdsTblgdv.Active then
    exit;

  if cdsTblgdv.State in [dsEdit, dsInsert] then
    cdsTblgdv.Cancel;

  if cdsTblgdv.ChangeCount > 0 then
    cdsTblgdv.CancelUpdates;
end;

procedure TdmDadosVendedores.CalcelarManutencaoVendedor;
begin
  if not cdsTblven.Active then
    exit;

  if cdsTblven.State in [dsEdit, dsInsert] then
    cdsTblven.Cancel;

  if cdsTblven.ChangeCount > 0 then
    cdsTblven.CancelUpdates;
end;

procedure TdmDadosVendedores.CarregarFiltroGrupos;
begin
  dmDadosVendedores.cdsFiltroGrupos.Close;
  dmDadosVendedores.cdsFiltroGrupos.open;
end;

procedure TdmDadosVendedores.CarregarListaVendedores;
begin
  // Função utilizada na tela de Renovação Automática de Assinaturas.
  cdsListaVendedores.Close;
  cdsListaVendedores.Open;

  cdsListaVendedores.First;
end;

procedure TdmDadosVendedores.cdsTblgdvgdvdescrValidate(Sender: TField);
begin
  if cdsTblgdv.Tag = 1 then
    exit;

  if trim(cdsTblgdvgdvdescr.AsString) = EmptyStr then
    raise Exception.Create('Descrição do grupo não pode ser nula.');
end;

procedure TdmDadosVendedores.cdsTblgdvNewRecord(DataSet: TDataSet);
begin
  cdsTblgdv.Tag := 1;
  try
    cdsTblgdvgdvcod.Value := 0; // campo auto-incremento
  finally
    cdsTblgdv.Tag := 0;
  end;
end;

procedure TdmDadosVendedores.cdsTblvenBeforePost(DataSet: TDataSet);
begin
  // Faço isso para que, caso não seja informado os telefones,
  // para não gravar na base de dados apenas os "(  )"

  if trim(cdsTblvenvenfone.AsString) = '(  )' then
    cdsTblvenvenfone.AsString := '';
end;

procedure TdmDadosVendedores.cdsTblvenNewRecord(DataSet: TDataSet);
begin
  cdsTblven.Tag := 1;
  try
    cdsTblvenvencod.Value := 0; // campo auto-incremento
    cdsTblvengdvcod.Value := cdslLookupGruposgdvcod.AsInteger;
  finally
    cdsTblven.Tag := 0;
  end;
end;

procedure TdmDadosVendedores.cdsTblvenvennomeValidate(Sender: TField);
begin
  if cdsTblven.Tag = 1 then
    exit;

  if trim(cdsTblvenvennome.AsString) = EmptyStr then
    raise Exception.Create('Nome do vendedor não pode ser nulo.');
end;

procedure TdmDadosVendedores.dspTblgdvUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(e.Message);
end;

procedure TdmDadosVendedores.EditarGrupo;
begin
  if not cdsTblgdv.Active then
    raise Exception.Create(NENHUM_GRUPO_SELECIONADO);

  if cdsTblgdv.RecordCount = 0 then
    raise Exception.Create(NENHUM_GRUPO_SELECIONADO);

  cdsTblgdv.Edit;
end;

procedure TdmDadosVendedores.EditarVendedor;
begin
  if not cdsTblven.Active then
    raise Exception.Create(NENHUM_VENDEDOR_SELECIONADO);

  if cdsTblven.RecordCount = 0 then
    raise Exception.Create(NENHUM_VENDEDOR_SELECIONADO);

  cdsTblven.Edit;
end;

procedure TdmDadosVendedores.ExcluirGrupo;
begin
  if not cdsTblgdv.Active then
    raise Exception.Create(NENHUM_GRUPO_SELECIONADO);

  if cdsTblgdv.RecordCount = 0 then
    raise Exception.Create(NENHUM_GRUPO_SELECIONADO);

  if MessageDlg('Deseja realmente excluir o grupo selecionado?', mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    exit;

  cdsTblgdv.Delete;

  try
    cdsTblgdv.Tag := 1;

    SalvarGrupo;
  finally
    cdsTblgdv.Tag := 0;
  end;
end;

procedure TdmDadosVendedores.ExcluirVendedor;
begin
  if not cdsTblven.Active then
    raise Exception.Create(NENHUM_VENDEDOR_SELECIONADO);

  if cdsTblven.RecordCount = 0 then
    raise Exception.Create(NENHUM_VENDEDOR_SELECIONADO);

  if MessageDlg('Deseja realmente excluir o vendedor selecionado?', mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    exit;

  cdsTblven.Delete;

  try
    cdsTblven.Tag := 1;

    SalvarVendedor;
  finally
    cdsTblven.Tag := 0;
  end;
end;

procedure TdmDadosVendedores.FiltrarGrupos(ACodigo: Integer; ADescr: String);
var
  SQL: String;
  CodigoGrupo: integer;
begin
  // Será utilizado para posicionar na lista
  if cdsTblgdv.Active then
    CodigoGrupo := cdsTblgdvgdvcod.AsInteger
  else
    CodigoGrupo := -1;

  ADescr := trim(ADescr);

  SQL := 'select * from tblgdv';

  if (ACodigo = 0) and (ADescr = EmptyStr) then
  begin
    SQL := SQL + ' where 1 = 2';
  end
  else
  begin
    SQL := SQL + ' where 1 = 1';

    if ACodigo > 0 then
      SQL := SQL + ' and gdvcod = ' + IntToStr(ACodigo);

    if ADescr <> EmptyStr then
      SQL := SQL + ' and gdvdescr like "%' + ADescr + '%"';
  end;

  SQL := SQL + ' order by gdvdescr';

  sqlTblgdv.Close;
  sqlTblgdv.CommandText := SQL;

  cdsTblgdv.DisableControls;
  try
    cdsTblgdv.Close;
    cdsTblgdv.Open;

    PosicionarGrupo(CodigoGrupo);
  finally
    cdsTblgdv.EnableControls;
  end;
end;

procedure TdmDadosVendedores.FiltrarVendedores(ACodigoVendedor: Integer; ANome: String;
  ACodigoGrupo: integer);
var
  SQL: String;
  CodigoVendedor: integer;
begin
  if ACodigoVendedor = 0 then
  begin
    // Será utilizado para posicionar na lista
    if cdsTblven.Active then
      CodigoVendedor := cdsTblvenvencod.AsInteger
    else
      CodigoVendedor := -1;
  end
  else
    CodigoVendedor := ACodigoVendedor;

  ANome := trim(ANome);

  SQL := 'select * from tblven';

  if (ACodigoVendedor = 0) and (ACodigoGrupo = 0) and (ANome = EmptyStr) then
  begin
    SQL := SQL + ' where 1 = 2';
  end
  else
  begin
    SQL := SQL + ' where 1 = 1';

    if ACodigoVendedor > 0 then
      SQL := SQL + ' and vencod = ' + IntToStr(ACodigoVendedor);

    if ACodigoGrupo > 0 then
      SQL := SQL + ' and gdvcod = ' + IntToStr(ACodigoGrupo);

    if ANome <> EmptyStr then
      SQL := SQL + ' and vennome like "%' + ANome + '%"';
  end;

  SQL := SQL + ' order by vennome';

  sqlTblven.Close;
  sqlTblven.CommandText := SQL;

  cdsTblven.DisableControls;
  try
    cdsTblven.Close;
    cdsTblven.Open;

    PosicionarVendedor(CodigoVendedor);
  finally
    cdsTblven.EnableControls;
  end;

end;

function TdmDadosVendedores.GetNomeVendedor(Avencod: Integer): String;
begin
  FiltrarVendedores(Avencod, '', 0);

  if cdsTblven.RecordCount > 0 then
    Result := trim(cdsTblvenvennome.Value)
  else
    Result := '';
end;

procedure TdmDadosVendedores.PosicionarGrupo(ACodigo: integer);
begin
  if not cdsTblgdv.Active then
    exit;

  if cdsTblgdv.RecordCount = 0 then
    exit;

  if ACodigo = -1 then
    exit;

  cdsTblgdv.Locate('gdvcod', ACodigo, []);
end;

procedure TdmDadosVendedores.PosicionarVendedor(ACodigo: integer);
begin
  if not cdsTblven.Active then
    exit;

  if cdsTblven.RecordCount = 0 then
    exit;

  if ACodigo = -1 then
    exit;

  cdsTblven.Locate('vencod', ACodigo, []);
end;

procedure TdmDadosVendedores.SalvarGrupo;
begin
  if not cdsTblgdv.Active then
    raise Exception.Create(NENHUM_GRUPO_SELECIONADO);

  // ---------------------------------------------------------------------------
  // Aplica mais uma vez os métodos de validação
  // ---------------------------------------------------------------------------

  cdsTblgdvgdvdescrValidate(cdsTblgdvgdvdescr);

  try
    if cdsTblgdv.State in [dsEdit, dsInsert] then
      cdsTblgdv.Post;

    cdsTblgdv.ApplyUpdates(0);
  except
    on E: Exception do
    begin
      if cdsTblgdv.ChangeCount > 0 then
        cdsTblgdv.Cancel;

      if pos('key violation', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Grupo informado já está cadastrado.')
      else if pos('duplicate entry', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Grupo informado já está cadastrado.')
      else if pos('foreign key constraint fails', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Não é possível excluir este grupo, pois existem vendedores cadastrados com este mesmo grupo.')
      else
        raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TdmDadosVendedores.SalvarVendedor;
begin
  if not cdsTblven.Active then
    raise Exception.Create(NENHUM_VENDEDOR_SELECIONADO);

  // ---------------------------------------------------------------------------
  // Aplica mais uma vez os métodos de validação
  // ---------------------------------------------------------------------------

  cdsTblvenvennomeValidate(cdsTblvenvennome);

  try
    if cdsTblven.State in [dsEdit, dsInsert] then
      cdsTblven.Post;

    cdsTblven.ApplyUpdates(0);
  except
    on E: Exception do
    begin
      if cdsTblven.ChangeCount > 0 then
        cdsTblven.Cancel;

      if pos('key violation', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Vendedor informado já está cadastrado.')
      else if pos('duplicate entry', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Vendedor informado já está cadastrado.')
      else if pos('foreign key constraint fails', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Não é possível excluir este vendedor, pois existem assinantes cadastrados com este mesmo vendedor.')
      else
        raise Exception.Create(e.Message);
    end;
  end;
end;

end.
