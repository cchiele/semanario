unit uDadosZonasRuas;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.Provider, Data.DB,
  Data.SqlExpr, Datasnap.DBClient, Vcl.Dialogs, System.UITypes;

const
  NENHUMA_ZONA_SELECIONADA = 'Nenhuma zona está selecionada.';
  NENHUMA_RUA_SELECIONADA = 'Nenhuma rua está selecionada.';

type
  TdmDadosZonasRuas = class(TDataModule)
    sqlTblzon: TSQLDataSet;
    dspTblzon: TDataSetProvider;
    cdsTblzon: TClientDataSet;
    cdsTblzonzoncod: TStringField;
    cdsTblzonzondescr: TStringField;
    cdsTblzonzonentregador: TStringField;
    sqlExisteZona: TSQLDataSet;
    sqlExisteZonazoncod: TStringField;
    sqlTblrdz: TSQLDataSet;
    dspTblrdz: TDataSetProvider;
    cdsTblrdz: TClientDataSet;
    cdsTblrdzrdzcod: TIntegerField;
    cdsTblrdzzoncod: TStringField;
    cdsTblrdzrdzender: TStringField;
    cdsTblrdzLookupZondescr: TStringField;
    sqlLookupZonas: TSQLDataSet;
    dspLookupZonas: TDataSetProvider;
    cdsLookupZonas: TClientDataSet;
    cdsLookupZonaszoncod: TStringField;
    cdsLookupZonaszondescr: TStringField;
    procedure dspTblzonUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure cdsTblzonzoncodValidate(Sender: TField);
    procedure cdsTblzonzondescrValidate(Sender: TField);
    procedure cdsTblrdzNewRecord(DataSet: TDataSet);
    procedure cdsTblrdzrdzenderValidate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure FiltrarZonas(ACodigo: String = ''; ADescr: String = ''; AEntregador: String = '');
    procedure PosicionarZona(ACodigo: string);
    procedure AdicionarZona;
    procedure EditarZona;
    procedure ExcluirZona;
    procedure SalvarZona;
    procedure CalcelarManutencaoZona;

    procedure FiltrarRuas(ACodigoRua: Integer = 0; AEndereco: String = ''; ACodigoZona: String = ''; ADescrZona: String = '');
    procedure PosicionarRua(ACodigo: integer);
    procedure AdicionarRua;
    procedure EditarRua;
    procedure ExcluirRua;
    procedure SalvarRua;
    procedure CalcelarManutencaoRua;

    function ExisteZona(ACodigo: String): Boolean;
    function GetDescricaoRua(Ardzcod: Integer): String;
    function GetDescricaoZona(Azoncod: String; Ardzcod: Integer): String;

  end;

var
  dmDadosZonasRuas: TdmDadosZonasRuas;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses uConexao, uDadosGlobal;

{$R *.dfm}

procedure TdmDadosZonasRuas.AdicionarRua;
begin
  if not cdsTblrdz.Active then
    FiltrarRuas;

  CalcelarManutencaoRua;

  cdsTblrdz.Append;
end;

procedure TdmDadosZonasRuas.AdicionarZona;
begin
  if not cdsTblzon.Active then
    FiltrarZonas;

  CalcelarManutencaoZona;

  cdsTblzon.Append;
end;

procedure TdmDadosZonasRuas.CalcelarManutencaoRua;
begin
  if not cdsTblrdz.Active then
    exit;

  if cdsTblrdz.State in [dsEdit, dsInsert] then
    cdsTblrdz.Cancel;

  if cdsTblrdz.ChangeCount > 0 then
    cdsTblrdz.CancelUpdates;
end;

procedure TdmDadosZonasRuas.CalcelarManutencaoZona;
begin
  if not cdsTblzon.Active then
    exit;

  if cdsTblzon.State in [dsEdit, dsInsert] then
    cdsTblzon.Cancel;

  if cdsTblzon.ChangeCount > 0 then
    cdsTblzon.CancelUpdates;
end;

procedure TdmDadosZonasRuas.cdsTblrdzNewRecord(DataSet: TDataSet);
begin
  cdsTblrdz.Tag := 1;
  try
    cdsTblrdzrdzcod.Value := 0; // campo auto-incremento
    cdsTblrdzzoncod.AsString := cdsLookupZonaszoncod.AsString;
  finally
    cdsTblrdz.Tag := 0;
  end;
end;

procedure TdmDadosZonasRuas.cdsTblrdzrdzenderValidate(Sender: TField);
begin
  if cdsTblrdz.Tag = 1 then
    exit;

  if trim(cdsTblrdzrdzender.AsString) = EmptyStr then
    raise Exception.Create('Rua não pode ser nula.');
end;

procedure TdmDadosZonasRuas.cdsTblzonzoncodValidate(Sender: TField);
begin
  if cdsTblZon.Tag = 1 then
    exit;

  if trim(cdsTblZonzoncod.AsString) = EmptyStr then
    raise Exception.Create('Código da zona não pode ser nulo.');

  if ExisteZona(cdsTblzonzoncod.AsString) then
    raise Exception.Create('Código da zona informado já está cadastrado.');
end;

procedure TdmDadosZonasRuas.cdsTblzonzondescrValidate(Sender: TField);
begin
  if cdsTblZon.Tag = 1 then
    exit;

  if trim(cdsTblZonzondescr.AsString) = EmptyStr then
    raise Exception.Create('Descrição da zona não pode ser nula.');
end;

procedure TdmDadosZonasRuas.dspTblzonUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(e.Message);
end;

procedure TdmDadosZonasRuas.EditarRua;
begin
  if not cdsTblrdz.Active then
    raise Exception.Create(NENHUMA_RUA_SELECIONADA);

  if cdsTblrdz.RecordCount = 0 then
    raise Exception.Create(NENHUMA_RUA_SELECIONADA);

  cdsTblrdz.Edit;
end;

procedure TdmDadosZonasRuas.EditarZona;
begin
  if not cdsTblzon.Active then
    raise Exception.Create(NENHUMA_ZONA_SELECIONADA);

  if cdsTblzon.RecordCount = 0 then
    raise Exception.Create(NENHUMA_ZONA_SELECIONADA);

  cdsTblzon.Edit;
end;

procedure TdmDadosZonasRuas.ExcluirRua;
begin
  if not cdsTblrdz.Active then
    raise Exception.Create(NENHUMA_RUA_SELECIONADA);

  if cdsTblrdz.RecordCount = 0 then
    raise Exception.Create(NENHUMA_RUA_SELECIONADA);

  if MessageDlg('Deseja realmente excluir a rua selecionada?', mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    exit;

  cdsTblrdz.Delete;

  try
    cdsTblrdz.Tag := 1;

    SalvarRua;
  finally
    cdsTblrdz.Tag := 0;
  end;
end;

procedure TdmDadosZonasRuas.ExcluirZona;
begin
  if not cdsTblzon.Active then
    raise Exception.Create(NENHUMA_ZONA_SELECIONADA);

  if cdsTblzon.RecordCount = 0 then
    raise Exception.Create(NENHUMA_ZONA_SELECIONADA);

  if MessageDlg('Deseja realmente excluir a zona selecionada?', mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    exit;

  cdsTblzon.Delete;

  try
    cdsTblzon.Tag := 1;

    SalvarZona;
  finally
    cdsTblzon.Tag := 0;
  end;
end;

function TdmDadosZonasRuas.ExisteZona(ACodigo: String): Boolean;
begin
  Result := false;

  sqlExisteZona.Close;
  sqlExisteZona.ParamByName('zoncod').AsString := ACodigo;
  sqlExisteZona.Open;

  if not sqlExisteZona.Eof then
    Result := true;
end;

procedure TdmDadosZonasRuas.FiltrarRuas(ACodigoRua: Integer; AEndereco, ACodigoZona: String;
  ADescrZona: String);
var
  SQL: String;
  CodigoRua: integer;
begin
  if ACodigoRua > 0 then
  begin
    // Será utilizado para posicionar na lista
    if cdsTblrdz.Active then
      CodigoRua := cdsTblrdzrdzcod.AsInteger
    else
      CodigoRua := -1;
  end
  else
    CodigoRua := ACodigoRua;

  AEndereco := trim(AEndereco);
  ACodigoZona := trim(ACodigoZona);
  ADescrZona := trim(ADescrZona);

  SQL :=
    'select tblrdz.* ' +
    '  from tblrdz, tblzon ' +
    ' where tblrdz.zoncod = tblzon.zoncod ';

  if (ACodigoRua = 0) and (AEndereco = EmptyStr) and (ACodigoZona = EmptyStr) and (ADescrZona = EmptyStr) then
  begin
    SQL := SQL + ' and 1 = 2';
  end
  else
  begin
    if ACodigoRua > 0 then
      SQL := SQL + ' and tblrdz.rdzcod = ' + IntToStr(ACodigoRua);

    if AEndereco <> EmptyStr then
      SQL := SQL + ' and tblrdz.rdzender like "%' + AEndereco + '%" ';

    if ACodigoZona <> EmptyStr then
      SQL := SQL + ' and tblrdz.zoncod = "' + ACodigoZona + '" ';

    if ADescrZona <> EmptyStr then
      SQL := SQL + ' and tblzon.zondescr like "%' + ADescrZona + '%"';
  end;

  SQL := SQL + ' order by rdzender';

  sqlTblrdz.Close;
  sqlTblrdz.CommandText := SQL;

  cdsTblrdz.DisableControls;
  try
    cdsTblrdz.Close;
    cdsTblrdz.Open;

    PosicionarRua(CodigoRua);
  finally
    cdsTblrdz.EnableControls;
  end;
end;

procedure TdmDadosZonasRuas.FiltrarZonas(ACodigo: String; ADescr: String; AEntregador: String);
var
  SQL: String;
  CodigoZona: String;
begin
  // Será utilizado para posicionar na lista
  if cdsTblzon.Active then
    CodigoZona := cdsTblzonzoncod.AsString
  else
    CodigoZona := '';

  ACodigo := trim(ACodigo);
  ADescr := trim(ADescr);
  AEntregador := trim(AEntregador);

  SQL := 'select * from tblzon';

  if (ACodigo = EmptyStr) and (ADescr = EmptyStr) and (AEntregador = EmptyStr) then
  begin
    SQL := SQL + ' where 1 = 2';
  end
  else
  begin
    SQL := SQL + ' where 1 = 1';

    if ACodigo <> EmptyStr then
      SQL := SQL + ' and zoncod = "' + ACodigo + '"';

    if ADescr <> EmptyStr then
      SQL := SQL + ' and zondescr like "%' + ADescr + '%"';

    if AEntregador <> EmptyStr then
      SQL := SQL + ' and zonentregador like "%' + AEntregador + '%"';
  end;

  SQL := SQL + ' order by zondescr';

  sqlTblzon.Close;
  sqlTblzon.CommandText := SQL;

  cdsTblzon.DisableControls;
  try
    cdsTblzon.Close;
    cdsTblzon.Open;

    PosicionarZona(CodigoZona);
  finally
    cdsTblzon.EnableControls;
  end;
end;

function TdmDadosZonasRuas.GetDescricaoRua(Ardzcod: Integer): String;
begin
  FiltrarRuas(Ardzcod, '', '', '');

  if cdsTblrdz.RecordCount > 0 then
    Result := trim(cdsTblrdzrdzender.Value)
  else
    Result := '';
end;

function TdmDadosZonasRuas.GetDescricaoZona(Azoncod: String; Ardzcod: Integer): String;
begin
  // Esta função pode receber tanto o código da rua quanto o código da zona (um ou outro).

  if Azoncod <> EmptyStr then
  begin
    FiltrarZonas(Azoncod, '', '');
  end
  else
  begin
    FiltrarRuas(Ardzcod, '', '');

    if cdsTblrdz.RecordCount = 0 then
    begin
      Result := '';
      exit;
    end
    else
    begin
      FiltrarZonas(cdsTblrdzzoncod.Value, '', '');
    end;

  end;

  if cdsTblzon.RecordCount > 0 then
    Result := trim(cdsTblzonzondescr.Value)
  else
    Result := '';
end;

procedure TdmDadosZonasRuas.PosicionarRua(ACodigo: integer);
begin
  if not cdsTblrdz.Active then
    exit;

  if cdsTblrdz.RecordCount = 0 then
    exit;

  if ACodigo = -1 then
    exit;

  cdsTblrdz.Locate('rdzcod', ACodigo, []);
end;

procedure TdmDadosZonasRuas.PosicionarZona(ACodigo: string);
begin
  if not cdsTblzon.Active then
    exit;

  if cdsTblzon.RecordCount = 0 then
    exit;

  if ACodigo = EmptyStr then
    exit;

  cdsTblzon.Locate('zoncod', ACodigo, []);
end;

procedure TdmDadosZonasRuas.SalvarRua;
begin
  if not cdsTblrdz.Active then
    raise Exception.Create(NENHUMA_RUA_SELECIONADA);

  // ---------------------------------------------------------------------------
  // Aplica mais uma vez os métodos de validação
  // ---------------------------------------------------------------------------

  cdsTblrdzrdzenderValidate(cdsTblrdzrdzender);

  try
    if cdsTblrdz.State in [dsEdit, dsInsert] then
      cdsTblrdz.Post;

    cdsTblrdz.ApplyUpdates(0);
  except
    on E: Exception do
    begin
      if cdsTblrdz.ChangeCount > 0 then
        cdsTblrdz.Cancel;

      if pos('key violation', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Rua informada já está cadastrada.')
      else if pos('duplicate entry', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Rua informada já está cadastrada.')
      else if pos('foreign key constraint fails', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Não é possível excluir esta rua, pois existem assinantes/zonas cadastradas com esta mesma rua.')
      else
        raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TdmDadosZonasRuas.SalvarZona;
begin
  if not cdsTblzon.Active then
    raise Exception.Create(NENHUMA_ZONA_SELECIONADA);

  // ---------------------------------------------------------------------------
  // Aplica mais uma vez os métodos de validação
  // ---------------------------------------------------------------------------

  if cdsTblzon.State in [dsInsert] then
    cdsTblzonzoncodValidate(cdsTblzonzoncod);

  cdsTblzonzondescrValidate(cdsTblzonzondescr);

  try
    if cdsTblzon.State in [dsEdit, dsInsert] then
      cdsTblzon.Post;

    cdsTblzon.ApplyUpdates(0);
  except
    on E: Exception do
    begin
      if cdsTblzon.ChangeCount > 0 then
        cdsTblzon.Cancel;

      if pos('key violation', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Zona informada já está cadastrada.')
      else if pos('duplicate entry', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Zona informada já está cadastrada.')
      else if pos('foreign key constraint fails', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Não é possível excluir esta zona, pois existem assinantes/ruas cadastradas com esta mesma zona.')
      else
        raise Exception.Create(e.Message);
    end;
  end;
end;

end.
