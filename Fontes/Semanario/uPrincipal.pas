unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, System.UITypes,
  Vcl.RibbonLunaStyleActnCtrls, Vcl.Ribbon, Vcl.ExtCtrls, JvComponentBase,
  JvEnterTab, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnList, Vcl.ActnMan,
  Vcl.ScreenTips, Vcl.ImgList, Vcl.Menus, JvExControls, JvPageList, JvTabBar,
  Data.FMTBcd, Data.DB, Data.SqlExpr, System.Actions, System.ImageList,
  midaslib;

type
  TfrmPrincipal = class(TForm)
    RibbonPrincipal: TRibbon;
    StatusBar: TStatusBar;
    TimerInicio: TTimer;
    JvEnterAsTab: TJvEnterAsTab;
    ActionManager: TActionManager;
    ImageList32: TImageList;
    ImageList16: TImageList;
    ScreenTipsManager: TScreenTipsManager;
    ActionCadastroAssinantes: TAction;
    ActionCadastroUsuarios: TAction;
    ActionAlterarSenha: TAction;
    ActionCadastroZonas: TAction;
    JvTabBar: TJvTabBar;
    JvModernTabBarPainter: TJvModernTabBarPainter;
    JvPageList: TJvPageList;
    PopupMenu: TPopupMenu;
    mnuFechar: TMenuItem;
    mnuFecharTodasExcetoEssa: TMenuItem;
    ActionCadastroCeps: TAction;
    ActionCadastroEmpresa: TAction;
    ActionCadastroCobradores: TAction;
    ActionCadastroGruposVendedores: TAction;
    ActionCadastroVendedores: TAction;
    ActionCadastroRuas: TAction;
    ActionRenovacaoAuto: TAction;
    ActionRelatBaixas: TAction;
    ActionRelatAssCanceladas: TAction;
    ActionRelatAssPendentes: TAction;
    ActionRelatRecibos: TAction;
    ActionRelatEtiquetas: TAction;
    ActionRelatAssinantes: TAction;
    ActionBaixaPagtos: TAction;
    ActionRelatAltCad: TAction;
    ActionRelatCondicoesPagto: TAction;
    ActionRelatDescontos: TAction;
    ActionRelatCortesias: TAction;
    procedure FormCreate(Sender: TObject);
    procedure TimerInicioTimer(Sender: TObject);
    procedure ActionCadastroUsuariosExecute(Sender: TObject);
    procedure JvPageListChange(Sender: TObject);
    procedure JvTabBarTabClosing(Sender: TObject; Item: TJvTabBarItem;
      var AllowClose: Boolean);
    procedure mnuFecharClick(Sender: TObject);
    procedure mnuFecharTodasExcetoEssaClick(Sender: TObject);
    procedure ActionCadastroCepsExecute(Sender: TObject);
    procedure ActionCadastroEmpresaExecute(Sender: TObject);
    procedure ActionCadastroCobradoresExecute(Sender: TObject);
    procedure ActionCadastroGruposVendedoresExecute(Sender: TObject);
    procedure ActionAlterarSenhaExecute(Sender: TObject);
    procedure ActionCadastroVendedoresExecute(Sender: TObject);
    procedure ActionCadastroZonasExecute(Sender: TObject);
    procedure ActionCadastroRuasExecute(Sender: TObject);
    procedure ActionCadastroAssinantesExecute(Sender: TObject);
    procedure ActionRenovacaoAutoExecute(Sender: TObject);
    procedure ActionRelatBaixasExecute(Sender: TObject);
    procedure ActionRelatAssCanceladasExecute(Sender: TObject);
    procedure ActionRelatAssPendentesExecute(Sender: TObject);
    procedure ActionRelatRecibosExecute(Sender: TObject);
    procedure ActionRelatEtiquetasExecute(Sender: TObject);
    procedure ActionRelatAssinantesExecute(Sender: TObject);
    procedure ActionBaixaPagtosExecute(Sender: TObject);
    procedure ActionRelatAltCadExecute(Sender: TObject);
    procedure ActionRelatCondicoesPagtoExecute(Sender: TObject);
    procedure ActionRelatDescontosExecute(Sender: TObject);
    procedure ActionRelatCortesiasExecute(Sender: TObject);
  private
    { Private declarations }
    procedure CarregarRibbonPrincipal;
    procedure CarregarRibbon(APai: Integer; ATipo: String; ADescr: String; ARibbonPage: TCustomRibbonPage; ARibbonGroup: TRibbonGroup);
    procedure NovaPagina(ClasseForm: TFormClass; IndiceImagem: Integer);
    procedure AjustarCaptionAbas(ClasseForm: TFormClass);

    function TemAcessoTipoActionPrincipal(APai: Integer; ATipo:String): Boolean;
    function PodeAbrirFormulario(ClasseForm: TFormClass; var Pagina: TJvCustomPage): Boolean;
    function ObterAba(Pagina: TJvCustomPage): TJvTabBarItem;
    function TotalFormsAbertos(ClasseForm: TFormClass): Integer;
    function FecharPagina(Pagina: TJvCustomPage; TodasExcetoEssa: Boolean): Boolean; overload;
    function ObterPagina(Aba: TJvTabBarItem): TJvCustomPage;

  public
    { Public declarations }
    function GetVersaoPrograma: string;
    function ObterIndexFormulario(ClasseForm: TFormClass): Integer;
    function FecharPagina(Pagina: TJvCustomPage): Boolean; overload;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uRibbonDynamic, uConexao, uUsuario, uCadZonas, uCadCeps, uDadosGlobal,
  uDadosCep, uCadUsuarios, uDadosEmpresa, uEmpresa, uCadCobradores,
  uDadosCobradores, uDadosVendedores, uCadGruposVendedores, uAlterarSenha,
  uCadVendedores, uDadosZonasRuas, uCadRuas, uDadosAssinantes,
  uCadAssinantes, uMensagem, uRenovarAssinaturasAuto, uRelatBaixas, uDadosRelat,
  uRelatAssCanceladas, uRelatAssPendentes, uRelatRecibos, uRelatEtiquetas,
  uRelatAssinantes, uCadBaixas, uRelatAltCad, uRelatCondicoesPagto,
  uRelatDescontos, uRelatCortesias;

procedure TfrmPrincipal.ActionAlterarSenhaExecute(Sender: TObject);
begin
  try
    frmAlterarSenha := TfrmAlterarSenha.Create(self);
    frmAlterarSenha.ShowModal;
  finally
    FreeAndNil(frmAlterarSenha);
  end;
end;

procedure TfrmPrincipal.ActionBaixaPagtosExecute(Sender: TObject);
begin
  NovaPagina(TfrmCadBaixas, -1);
end;

procedure TfrmPrincipal.ActionCadastroAssinantesExecute(Sender: TObject);
begin
  NovaPagina(TfrmCadAssinantes, -1);
end;

procedure TfrmPrincipal.ActionCadastroCepsExecute(Sender: TObject);
begin
  NovaPagina(TfrmCadCeps, -1);
end;

procedure TfrmPrincipal.ActionCadastroCobradoresExecute(Sender: TObject);
begin
  NovaPagina(TfrmCadCobradores, -1);
end;

procedure TfrmPrincipal.ActionCadastroEmpresaExecute(Sender: TObject);
begin
  NovaPagina(TfrmEmpresa, -1);
  {
  try
    frmEmpresa := TfrmEmpresa.Create(self);
    frmEmpresa.ShowModal;
  finally
    FreeAndNil(frmEmpresa);
  end;
  }
end;

procedure TfrmPrincipal.ActionCadastroGruposVendedoresExecute(Sender: TObject);
begin
  NovaPagina(TfrmCadGruposVendedores, -1);
end;

procedure TfrmPrincipal.ActionCadastroRuasExecute(Sender: TObject);
begin
  NovaPagina(TfrmCadRuas, -1);
end;

procedure TfrmPrincipal.ActionCadastroUsuariosExecute(Sender: TObject);
begin
  NovaPagina(TfrmCadUsuarios, -1);
end;

procedure TfrmPrincipal.ActionCadastroVendedoresExecute(Sender: TObject);
begin
  NovaPagina(TfrmCadVendedores, -1);
end;

procedure TfrmPrincipal.ActionCadastroZonasExecute(Sender: TObject);
begin
  NovaPagina(TfrmCadZonas, -1);
end;

procedure TfrmPrincipal.ActionRelatAltCadExecute(Sender: TObject);
begin
  NovaPagina(TfrmRelatAltCad, -1);
end;

procedure TfrmPrincipal.ActionRelatAssCanceladasExecute(Sender: TObject);
begin
  NovaPagina(TfrmRelatAssCanceladas, -1);
  {
  frmRelatAssCanceladas := TfrmRelatAssCanceladas.Create(self);
  try
    frmRelatAssCanceladas.ShowModal;
  finally
    FreeAndNil(frmRelatAssCanceladas);
  end;
  }
end;

procedure TfrmPrincipal.ActionRelatAssinantesExecute(Sender: TObject);
begin
  NovaPagina(TfrmRelatAssinantes, -1);
end;

procedure TfrmPrincipal.ActionRelatAssPendentesExecute(Sender: TObject);
begin
  NovaPagina(TfrmRelatAssPendentes, -1);
  {
  frmRelatAssPendentes := TfrmRelatAssPendentes.Create(self);
  try
    frmRelatAssPendentes.ShowModal;
  finally
    FreeAndNil(frmRelatAssPendentes);
  end;
  }
end;

procedure TfrmPrincipal.ActionRelatBaixasExecute(Sender: TObject);
begin
  NovaPagina(TfrmRelatBaixas, -1);
  {
  frmRelatBaixas := TfrmRelatBaixas.Create(self);
  try
    frmRelatBaixas.ShowModal;
  finally
    FreeAndNil(frmRelatBaixas);
  end;
  }
end;

procedure TfrmPrincipal.ActionRelatCondicoesPagtoExecute(Sender: TObject);
begin
  NovaPagina(TfrmRelatCondicoesPagto, -1);
end;

procedure TfrmPrincipal.ActionRelatCortesiasExecute(Sender: TObject);
begin
  NovaPagina(TfrmRelatCortesias, -1);
end;

procedure TfrmPrincipal.ActionRelatDescontosExecute(Sender: TObject);
begin
  NovaPagina(TfrmRelatDescontos, -1);
end;

procedure TfrmPrincipal.ActionRelatEtiquetasExecute(Sender: TObject);
begin
  NovaPagina(TfrmRelatEtiquetas, -1);
  {
  frmRelatEtiquetas := TfrmRelatEtiquetas.Create(self);
  try
    frmRelatEtiquetas.ShowModal;
  finally
    FreeAndNil(frmRelatEtiquetas);
  end;
  }
end;

procedure TfrmPrincipal.ActionRelatRecibosExecute(Sender: TObject);
begin
  NovaPagina(TfrmRelatRecibos, -1);
  {
  frmRelatRecibos := TfrmRelatRecibos.Create(self);
  try
    frmRelatRecibos.ShowModal;
  finally
    FreeAndNil(frmRelatRecibos);
  end;
  }
end;

procedure TfrmPrincipal.ActionRenovacaoAutoExecute(Sender: TObject);
begin
  frmRenovarAssinaturasAuto := TfrmRenovarAssinaturasAuto.Create(self);
  try
    frmRenovarAssinaturasAuto.ShowModal;
  finally
    FreeAndNil(frmRenovarAssinaturasAuto);
  end;
end;

procedure TfrmPrincipal.AjustarCaptionAbas(ClasseForm: TFormClass);
var
  I, Indice, TotalForms: Integer;
  NovoCaption: string;
begin
  TotalForms := TotalFormsAbertos(ClasseForm);

  if TotalForms > 1 then
  begin
    Indice := 1;
    for I := 0 to JvPageList.PageCount - 1 do
    begin
      with JvPageList do
      begin
        if Pages[I].Components[0].ClassType = ClasseForm then
        begin
          NovoCaption := (Pages[I].Components[0] as TForm).Caption + ' (' + IntToStr(Indice) + ')';
          (Pages[I] as TJvStandardPage).Caption := NovoCaption;
          ObterAba(Pages[I]).Caption := NovoCaption;

          Inc(Indice);
        end;
      end;
    end;
  end;
end;

procedure TfrmPrincipal.CarregarRibbon(APai: Integer; ATipo: String;
  ADescr: String; ARibbonPage: TCustomRibbonPage; ARibbonGroup: TRibbonGroup);
var
  sqlDataSet: TSQLDataSet;
  SQL: String;
  i: integer;
begin
  if ARibbonPage = nil then
  begin
    // Adiciona a TAB
    if TemAcessoTipoActionPrincipal(APai, ATipo) then
      ARibbonPage := AddPage(RibbonPrincipal, ADescr);
  end
  else
  begin
    if ATipo = '3' then  // Action Principal
    begin
      for I := 0 to ActionManager.ActionCount -1 do
        if ActionManager.Actions[i].Tag = APai then
          AddItem(i, i, ARibbonGroup, ActionManager, 0, 1, 0);
    end
    else
      if TemAcessoTipoActionPrincipal(APai, ATipo) then
        ARibbonGroup := AddGroup(ARibbonPage, ActionManager, ADescr);
  end;

  sqlDataSet := TSQLDataSet.Create(nil);
  try
    if ATipo = '1' then
    begin
      // Seleciono os Ribbon Groups
      SQL :=
        'select tblads.* ' +
        '  from tblads ' +
        ' where adscodpai = ' + IntToStr(APai) +
        '   and adstipo <> 4 ' +
        ' order by adsordem';
    end
    else
    begin
      // Seleciona os Actions Principais
      SQL :=
        'select tblads.* ' +
        '  from tblads, tblpdu ' +
        ' where tblads.adscod = tblpdu.adscod ' +
        '   and tblads.adscodpai = ' + IntToStr(APai) +
        '   and tblads.adstipo = 3 ' +
        '   and tblpdu.usucod = ' + IntToStr(dmUsuario.cdsUsuariousucod.Value) +
        ' order by tblads.adsordem';
    end;

    sqlDataSet.CommandText := SQL;
    sqlDataSet.SQLConnection := dmConexao.SQLConnection;
    sqlDataSet.Close;
    sqlDataSet.Open;

    while not sqlDataSet.Eof do
    begin
      CarregarRibbon(sqlDataSet.FieldByName('adscod').AsInteger, sqlDataSet.FieldByName('adstipo').AsString, sqlDataSet.FieldByName('adsdescr').AsString, ARibbonPage, ARibbonGroup);

      sqlDataSet.Next;
    end;
  finally
    FreeAndNil(sqlDataSet);
  end;
end;

procedure TfrmPrincipal.CarregarRibbonPrincipal;
var
  sqlDataSet: TSQLDataSet;
begin
  TfrmMensagem.MostrarMesagem('Aguarde, carregando menus...');
  try
    sqlDataSet := TSQLDataSet.Create(nil);
    try
      try
        sqlDataSet.CommandText := 'select * from tblads where adstipo = 1 order by adsordem';
        sqlDataSet.SQLConnection := dmConexao.SQLConnection;

        sqlDataSet.Close;
        sqlDataSet.Open;

        while not sqlDataSet.Eof do
        begin
          CarregarRibbon(sqlDataSet.FieldByName('adscod').AsInteger, sqlDataSet.FieldByName('adstipo').AsString, sqlDataSet.FieldByName('adsdescr').AsString, nil, nil);

          sqlDataSet.Next;
        end;
      except
        on E: Exception do
        begin
          MessageDlg('Ocorreu um problema ao montar o menu do usuário.' + chr(10) + chr(10) + 'Erro: ' + e.Message, mtWarning,[mbOK],0);
          close;
        end;
      end;
    finally
      FreeAndNil(sqlDataSet);
    end;

    if RibbonPrincipal.Tabs.Count = 0 then
    begin
      MessageDlg('Usuário não tem nenhuma permissão para acessar este programa.' + chr(10) + 'Fale com o administrador para que ele cadastre permissões.', mtWarning,[mbOK],0);
      close;
      exit;
    end;

    // Gambiarra
    try
      RibbonPrincipal.TabIndex := 1;
      RibbonPrincipal.TabIndex := 0;
    except
    end;
    
  finally
    TfrmMensagem.MostrarMesagem;
  end;
end;

function TfrmPrincipal.FecharPagina(Pagina: TJvCustomPage): Boolean;
var
  Form: TForm;
  PaginaEsquerda: TJvCustomPage;
begin
  PaginaEsquerda := nil;
  Form := Pagina.Components[0] as TForm;

  Result := Form.CloseQuery;

  if Result then
  begin
    if Pagina.PageIndex > 0 then
      PaginaEsquerda := JvPageList.Pages[Pagina.PageIndex - 1];

    Form.Close;
    ObterAba(Pagina).Free;
    Pagina.Free;

    JvPageList.ActivePage := PaginaEsquerda;
  end;

  if JvTabBar.Tabs.Count = 0 then
    JvTabBar.Visible := false;
end;

function TfrmPrincipal.FecharPagina(Pagina: TJvCustomPage;
  TodasExcetoEssa: Boolean): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := JvPageList.PageCount - 1 downto 0 do
    if JvPageList.Pages[I] <> Pagina then
    begin
      Result := FecharPagina(JvPageList.Pages[I]);
      if not Result then
        Exit;
    end;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  // Instancia o módulo de conexão
  try
    dmConexao := TdmConexao.Create(self);
  except
    on E: Exception do
    begin
      MessageDlg('Módulo de Conexão' + chr(10) + 'Erro: ' + e.Message, mtError,[mbOK],0);
      Application.Terminate;
      exit;
    end;
  end;

  // Instancia o módulo de usuáro
  try
    dmUsuario := TdmUsuario.Create(self);
  except
    on E: Exception do
    begin
      MessageDlg('Módulo de Usuário' + chr(10) + 'Erro: ' + e.Message, mtError,[mbOK],0);
      Application.Terminate;
      exit;
    end;
  end;

  try
    dmDadosGlobal := TdmDadosGlobal.Create(self);
  except
    on E: Exception do
    begin
      MessageDlg('Módulo Global' + chr(10) + 'Erro: ' + e.Message, mtError,[mbOK],0);
      Application.Terminate;
      exit;
    end;
  end;

  try
    dmDadosCep := TdmDadosCep.Create(self);
  except
    on E: Exception do
    begin
      MessageDlg('Módulo CEPs' + chr(10) + 'Erro: ' + e.Message, mtError,[mbOK],0);
      Application.Terminate;
      exit;
    end;
  end;

  try
    dmDadosEmpresa := TdmDadosEmpresa.Create(self);
  except
    on E: Exception do
    begin
      MessageDlg('Módulo Empresa' + chr(10) + 'Erro: ' + e.Message, mtError,[mbOK],0);
      Application.Terminate;
      exit;
    end;
  end;

  try
    dmDadosCobradores := TdmDadosCobradores.Create(self);
  except
    on E: Exception do
    begin
      MessageDlg('Módulo Cobradores' + chr(10) + 'Erro: ' + e.Message, mtError,[mbOK],0);
      Application.Terminate;
      exit;
    end;
  end;

  try
    dmDadosVendedores := TdmDadosVendedores.Create(self);
  except
    on E: Exception do
    begin
      MessageDlg('Módulo Grupos de Vendedores' + chr(10) + 'Erro: ' + e.Message, mtError,[mbOK],0);
      Application.Terminate;
      exit;
    end;
  end;

  try
    dmDadosZonasRuas := TdmDadosZonasRuas.Create(self);
  except
    on E: Exception do
    begin
      MessageDlg('Módulo Zonas e Ruas' + chr(10) + 'Erro: ' + e.Message, mtError,[mbOK],0);
      Application.Terminate;
      exit;
    end;
  end;

  try
    dmDadosAssinantes := TdmDadosAssinantes.Create(self);
  except
    on E: Exception do
    begin
      MessageDlg('Módulo Assinantes' + chr(10) + 'Erro: ' + e.Message, mtError,[mbOK],0);
      Application.Terminate;
      exit;
    end;
  end;

  try
    dmDadosRelat := TdmDadosRelat.Create(self);
  except
    on E: Exception do
    begin
      MessageDlg('Módulo Relatórios' + chr(10) + 'Erro: ' + e.Message, mtError,[mbOK],0);
      Application.Terminate;
      exit;
    end;
  end;



  frmPrincipal.Caption := frmPrincipal.Caption + ' - Versão ' + GetVersaoPrograma;
  RibbonPrincipal.Caption := frmPrincipal.Caption;

  TimerInicio.Enabled := true;
end;

function TfrmPrincipal.GetVersaoPrograma: string;
var
  l_VerInfoSize: DWORD;
  l_VerInfo: Pointer;
  l_VerValueSize: DWORD;
  l_VerValue: PVSFixedFileInfo;
  l_Dummy: DWORD;
  l_V1, l_V2, l_V3{, l_V4}: Word;
begin
  result := '0';

  try
    // Se o arquivo não existir
    if FileExists(Application.ExeName) = false then
      exit;

    l_VerInfoSize := GetFileVersionInfoSize(PChar(Application.ExeName), l_Dummy);

    GetMem(l_VerInfo, l_VerInfoSize);
    GetFileVersionInfo(PChar(Application.ExeName), 0, l_VerInfoSize, l_VerInfo);
    VerQueryValue(l_VerInfo, '\', Pointer(l_VerValue), l_VerValueSize);

    with l_VerValue^ do
    begin
      l_V1 := dwFileVersionMS shr 16;
      l_V2 := dwFileVersionMS and $FFFF;
      l_V3 := dwFileVersionLS shr 16;
  //    l_V4 := dwFileVersionLS and $FFFF;
    end;

    FreeMem(l_VerInfo, l_VerInfoSize);

    Result := inttostr(l_v1) + '.' + inttostr(l_v2) + '.' + inttostr(l_v3); { + '.' + inttostr(l_v4)}
  except
    result := '0';
  end;
end;

procedure TfrmPrincipal.JvPageListChange(Sender: TObject);
begin
  ObterAba(JvPageList.ActivePage).Selected := True;
end;

procedure TfrmPrincipal.JvTabBarTabClosing(Sender: TObject; Item: TJvTabBarItem;
  var AllowClose: Boolean);
begin
  AllowClose := FecharPagina(ObterPagina(Item));
end;

procedure TfrmPrincipal.mnuFecharClick(Sender: TObject);
begin
  FecharPagina(JvPageList.ActivePage);
end;

procedure TfrmPrincipal.mnuFecharTodasExcetoEssaClick(Sender: TObject);
begin
  FecharPagina(JvPageList.ActivePage, True);
end;

procedure TfrmPrincipal.NovaPagina(ClasseForm: TFormClass;
  IndiceImagem: Integer);
var
  Aba    : TJvTabBarItem;
  Pagina : TJvCustomPage;
  Form   : TForm;
begin
  if not PodeAbrirFormulario(ClasseForm, Pagina) then
  begin
    JvPageList.ActivePage := Pagina;
    Exit;
  end;

  JvTabBar.Visible := true;

  Aba := JvTabBar.AddTab('');

  Pagina := TJvStandardPage.Create(Self);
  Pagina.PageList := JvPageList;

  Form := ClasseForm.Create(Pagina);
  with Form do
  begin
    Align       := alClient;
    BorderStyle := bsNone;
    Parent      := Pagina;
  end;

  with Aba do
  begin
    Caption := Form.Caption;
    if ImageIndex > -1 then
      ImageIndex := IndiceImagem;
    PopupMenu := Self.PopupMenu;
  end;

  AjustarCaptionAbas(ClasseForm);

  Form.Show;

  JvPageList.ActivePage := Pagina;
end;

function TfrmPrincipal.ObterAba(Pagina: TJvCustomPage): TJvTabBarItem;
begin
  Result := nil;

  if Assigned(Pagina) then
    Result := JvTabBar.Tabs[Pagina.PageIndex];
end;

function TfrmPrincipal.ObterIndexFormulario(ClasseForm: TFormClass): Integer;
var
  I: Integer;
begin
  Result := -1;

  for I := 0 to JvPageList.PageCount - 1 do
  begin
    if JvPageList.Pages[I].Components[0].ClassType = ClasseForm then
    begin
      Result := I;
      Break;
    end;
  end;
end;

function TfrmPrincipal.ObterPagina(Aba: TJvTabBarItem): TJvCustomPage;
begin
  Result := JvPageList.Pages[Aba.Index];
end;

function TfrmPrincipal.PodeAbrirFormulario(ClasseForm: TFormClass;
  var Pagina: TJvCustomPage): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to JvPageList.PageCount - 1 do
  begin
    if JvPageList.Pages[I].Components[0].ClassType = ClasseForm then
    begin
      Pagina := JvPageList.Pages[I];
      Result := (Pagina.Components[0] as TForm).Tag = 0;
      Break;
    end;
  end;
end;

function TfrmPrincipal.TemAcessoTipoActionPrincipal(APai: Integer;
  ATipo: String): Boolean;
var
  sqlDataSet: TSQLDataSet;
  SQL: String;
begin
  Result := false;

  sqlDataSet := TSQLDataSet.Create(nil);
  try
    if ATipo = '1' then
    begin
      SQL :=
        'select tblads.* ' +
        '  from tblads ' +
        ' where adscodpai = ' + IntToStr(APai) +
        '   and adstipo <> 4 ' +
        ' order by adsordem';
    end
    else
    begin
      SQL :=
        'select tblads.* ' +
        '  from tblads, tblpdu ' +
        ' where tblads.adscod = tblpdu.adscod ' +
        '   and tblads.adscodpai = ' + IntToStr(APai) +
        '   and tblads.adstipo = 3 ' +
        '   and tblpdu.usucod = ' + IntToStr(dmUsuario.cdsUsuariousucod.Value) +
        ' order by tblads.adsordem';
    end;

    sqlDataSet.CommandText := SQL;
    sqlDataSet.SQLConnection := dmConexao.SQLConnection;
    sqlDataSet.Close;
    sqlDataSet.Open;

    while not sqlDataSet.Eof do
    begin
      if sqlDataSet.FieldByName('adstipo').AsString = '3' then  // Action Principal
      begin
        Result := true;
        Break;
      end;

      Result := TemAcessoTipoActionPrincipal(sqlDataSet.FieldByName('adscod').AsInteger, sqlDataSet.FieldByName('adstipo').AsString);

      if Result then
        Break;

      sqlDataSet.Next;
    end;
  finally
    FreeAndNil(sqlDataSet);
  end;
end;

procedure TfrmPrincipal.TimerInicioTimer(Sender: TObject);
begin
  TimerInicio.Enabled := false;

  frmPrincipal.WindowState := wsMaximized;

  // Solicita o login para o usuário
  if not dmUsuario.SolicitarLogin then
  begin
    Application.Terminate;
    exit;
  end;

  StatusBar.Panels.Items[0].Text := 'Usuário: ' + dmUsuario.cdsUsuariousulogin.AsString;

  CarregarRibbonPrincipal;
end;

function TfrmPrincipal.TotalFormsAbertos(ClasseForm: TFormClass): Integer;
var
  I: Integer;
begin
  Result := 0;

  for I := 0 to JvPageList.PageCount - 1 do
    if JvPageList.Pages[I].Components[0].ClassType = ClasseForm then
      Inc(Result);
end;

//initialization
//  ReportMemoryLeaksOnShutdown:=True;

end.
