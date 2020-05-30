unit uCadAssinantes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, System.UITypes,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ActnList, Vcl.DBCtrls,
  Vcl.StdCtrls, JvExStdCtrls, JvCombobox, JvDBSearchComboBox, JvButton, JvCtrls,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Data.DB, Vcl.ComCtrls, Vcl.Mask,
  JvExMask, JvToolEdit, JvDBControls, Datasnap.DBClient, Vcl.ImgList,
  System.Actions, Vcl.Samples.Spin, JvSpin, System.ImageList, JvDBCombobox,
  uLocalizarCep, uDadosCep;

type
  TTela = (Consulta, ConsultaAssinante, ManutencaoAssinante, ManutencaoAssinatura,
    ManutencaoBaixa, ManutencaoHistorico);

type
  TfrmCadAssinantes = class(TForm)
    pnlConsulta: TPanel;
    GroupBox2: TGroupBox;
    dbGridAssinantes: TDBGrid;
    GroupBox1: TGroupBox;
    edtNomeAssinante: TLabeledEdit;
    ActionList: TActionList;
    ActionAtualizarCampoCobrador: TAction;
    ActionNovoAssinante: TAction;
    ActionEditarAssinante: TAction;
    ActionExcluirAssinante: TAction;
    ActionFiltrar: TAction;
    ActionOkAssinante: TAction;
    ActionCancelarAssinante: TAction;
    ActionAtualizarCampoVendedor: TAction;
    TimerInicio: TTimer;
    dsTblass: TDataSource;
    PageControl: TPageControl;
    TabSheetAssinaturas: TTabSheet;
    dsTblcep: TDataSource;
    dsRuaZona: TDataSource;
    dsTblada: TDataSource;
    dsTblbda: TDataSource;
    Panel1: TPanel;
    Panel3: TPanel;
    JvImgBtn1: TJvImgBtn;
    JvImgBtn2: TJvImgBtn;
    JvImgBtn3: TJvImgBtn;
    Panel4: TPanel;
    Panel5: TPanel;
    JvImgBtn4: TJvImgBtn;
    JvImgBtn5: TJvImgBtn;
    JvImgBtn6: TJvImgBtn;
    pnlManutencaoAssinante: TPanel;
    Panel6: TPanel;
    Label29: TLabel;
    btnOkAssinante: TJvImgBtn;
    btnCancelarAssinante: TJvImgBtn;
    Label21: TLabel;
    DBEdit20: TDBEdit;
    Label22: TLabel;
    DBEditNome: TDBEdit;
    Label23: TLabel;
    DBEdit22: TDBEdit;
    Label24: TLabel;
    DBEdit23: TDBEdit;
    Label25: TLabel;
    DBEdit24: TDBEdit;
    Label27: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label28: TLabel;
    Label30: TLabel;
    JvDBDateEdit1: TJvDBDateEdit;
    Label26: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label36: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label37: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    GroupBox4: TGroupBox;
    dbedtRdzcod: TDBEdit;
    Label31: TLabel;
    btnPesquisarEndereco: TSpeedButton;
    DBEditEndereco: TDBEdit;
    Label39: TLabel;
    DBEdit27: TDBEdit;
    Label32: TLabel;
    DBEdit29: TDBEdit;
    DBEdit31: TDBEdit;
    Label34: TLabel;
    Label33: TLabel;
    DBEdit30: TDBEdit;
    Label35: TLabel;
    DBEditCEP: TDBEdit;
    Label38: TLabel;
    DBEditMunicipio: TDBEdit;
    Label40: TLabel;
    DBEditUF: TDBEdit;
    Label41: TLabel;
    DBEdit35: TDBEdit;
    Label42: TLabel;
    DBEdit36: TDBEdit;
    Label43: TLabel;
    DBEdit37: TDBEdit;
    GroupBox5: TGroupBox;
    Label44: TLabel;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    Label45: TLabel;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    Label46: TLabel;
    Label47: TLabel;
    DBEdit42: TDBEdit;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label57: TLabel;
    ActionEditarAssinatura: TAction;
    pnlManutencaoAssinatura: TPanel;
    Panel7: TPanel;
    Label58: TLabel;
    JvImgBtn7: TJvImgBtn;
    JvImgBtn8: TJvImgBtn;
    Label59: TLabel;
    ActionCancelarAssinatura: TAction;
    GroupBox6: TGroupBox;
    Label60: TLabel;
    DBEdit21: TDBEdit;
    Label61: TLabel;
    DBEdit43: TDBEdit;
    GroupBox7: TGroupBox;
    Label62: TLabel;
    DBEdit44: TDBEdit;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    DBEdit48: TDBEdit;
    Label68: TLabel;
    DBEdit49: TDBEdit;
    Label71: TLabel;
    DBLookupComboBox6: TDBLookupComboBox;
    Label64: TLabel;
    DBLookupComboBoxTipo: TDBLookupComboBox;
    JvDBDateEdit2: TJvDBDateEdit;
    JvDBDateEdit3: TJvDBDateEdit;
    GroupBox8: TGroupBox;
    DBEdit50: TDBEdit;
    Label63: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    ActionNovaAssinatura: TAction;
    ActionOkAssinatura: TAction;
    ActionExcluirAssinatura: TAction;
    pnlManutencaoBaixa: TPanel;
    Panel9: TPanel;
    Label74: TLabel;
    Label75: TLabel;
    JvImgBtn9: TJvImgBtn;
    JvImgBtn10: TJvImgBtn;
    GroupBox9: TGroupBox;
    Label76: TLabel;
    Label77: TLabel;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    GroupBox10: TGroupBox;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label84: TLabel;
    DBEdit47: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    DBEdit53: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    GroupBox11: TGroupBox;
    Label86: TLabel;
    Label83: TLabel;
    Label85: TLabel;
    dbedtValorBaixa: TDBEdit;
    dbedtDataBaixa: TJvDBDateEdit;
    ActionCancelarBaixa: TAction;
    ActionOkBaixa: TAction;
    ActionEditarBaixa: TAction;
    ActionNovaBaixa: TAction;
    ActionExcluirBaixa: TAction;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    edtCodigo: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    Panel2: TPanel;
    btnNovoAssinante: TJvImgBtn;
    btnEditarAssinante: TJvImgBtn;
    btnExcluirAssinante: TJvImgBtn;
    lblTotalAssinantes: TLabel;
    DBEdit1: TDBEdit;
    edtNroEndereco: TLabeledEdit;
    edtCodigoZona: TLabeledEdit;
    edtDescrZona: TEdit;
    DBEdtDataInativo: TJvDBDateEdit;
    ImageListGrid: TImageList;
    JvDBedtDataCancelamento: TJvDBDateEdit;
    Label1: TLabel;
    ActionConsultarAssinante: TAction;
    TabSheetHistorico: TTabSheet;
    Panel8: TPanel;
    Panel10: TPanel;
    Splitter2: TSplitter;
    Panel11: TPanel;
    JvImgBtn11: TJvImgBtn;
    JvImgBtn12: TJvImgBtn;
    JvImgBtn13: TJvImgBtn;
    DBGridHistoricos: TDBGrid;
    dsTblhas: TDataSource;
    GroupBox3: TGroupBox;
    DBMemo1: TDBMemo;
    ActionNovoHistorico: TAction;
    ActionEditarHistorico: TAction;
    ActionExcluirHistorico: TAction;
    pnlManutencaoHistorico: TPanel;
    GroupBox12: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Panel12: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    JvImgBtn14: TJvImgBtn;
    JvImgBtn15: TJvImgBtn;
    ActionOkHistorico: TAction;
    ActionCancelarHistorico: TAction;
    GroupBox13: TGroupBox;
    Label6: TLabel;
    JvDBDateEdit4: TJvDBDateEdit;
    Label7: TLabel;
    DBMemoHasdescr: TDBMemo;
    Panel13: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit4: TDBEdit;
    Label10: TLabel;
    GroupBox14: TGroupBox;
    DBGridCondicoes: TDBGrid;
    dsTblcpa: TDataSource;
    GroupBox15: TGroupBox;
    DBGridBaixas: TDBGrid;
    GroupBox16: TGroupBox;
    DBGridAssinaturas: TDBGrid;
    GroupBox17: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    edtPrimeiroVenc: TJvDateEdit;
    btnGerarParcelas: TJvImgBtn;
    DBGridParcelas: TDBGrid;
    edtQtdeParcelas: TJvSpinEdit;
    btnHistoricoAlteracoes: TJvImgBtn;
    ActionHistoricoAlteracoes: TAction;
    Label11: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    Label14: TLabel;
    btnConsultaCep: TJvImgBtn;
    Panel14: TPanel;
    btnFiltrar: TJvImgBtn;
    procedure ActionFiltrarExecute(Sender: TObject);
    procedure TimerInicioTimer(Sender: TObject);
    procedure ActionEditarAssinanteExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ActionCancelarAssinanteExecute(Sender: TObject);
    procedure ActionNovoAssinanteExecute(Sender: TObject);
    procedure ActionExcluirAssinanteExecute(Sender: TObject);
    procedure ActionEditarAssinaturaExecute(Sender: TObject);
    procedure ActionCancelarAssinaturaExecute(Sender: TObject);
    procedure ActionNovaAssinaturaExecute(Sender: TObject);
    procedure ActionOkAssinaturaExecute(Sender: TObject);
    procedure ActionExcluirAssinaturaExecute(Sender: TObject);
    procedure ActionCancelarBaixaExecute(Sender: TObject);
    procedure ActionOkBaixaExecute(Sender: TObject);
    procedure ActionEditarBaixaExecute(Sender: TObject);
    procedure ActionNovaBaixaExecute(Sender: TObject);
    procedure ActionExcluirBaixaExecute(Sender: TObject);
    procedure ActionAtualizarCampoCobradorExecute(Sender: TObject);
    procedure ActionAtualizarCampoVendedorExecute(Sender: TObject);
    procedure btnPesquisarEnderecoClick(Sender: TObject);
    procedure ActionOkAssinanteExecute(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtCodigoExit(Sender: TObject);
    procedure dbedtRdzcodKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbGridAssinantesDblClick(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
    procedure dbGridAssinantesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGridAssinaturasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBLookupComboBox6Click(Sender: TObject);
    procedure ActionConsultarAssinanteExecute(Sender: TObject);
    procedure ActionNovoHistoricoExecute(Sender: TObject);
    procedure ActionEditarHistoricoExecute(Sender: TObject);
    procedure ActionExcluirHistoricoExecute(Sender: TObject);
    procedure ActionOkHistoricoExecute(Sender: TObject);
    procedure ActionCancelarHistoricoExecute(Sender: TObject);
    procedure btnGerarParcelasClick(Sender: TObject);
    procedure ActionHistoricoAlteracoesExecute(Sender: TObject);
    procedure btnConsultaCepClick(Sender: TObject);
  private
    { Private declarations }
    procedure ControlarPanel(APanel: TTela);
    procedure ControlaCamposManutencaoAssinante;
    procedure ControlaCamposManutencaoAssinatura;
  public
    { Public declarations }
  end;

var
  frmCadAssinantes: TfrmCadAssinantes;

implementation

{$R *.dfm}

uses uDadosAssinantes, uAlterarSenha, uUsuario, uPrincipal, uLocalizarEndereco,
  uDadosGlobal, uMensagem, uRelatAlteracoesAssinante, uDadosRelat;

{ TfrmAssinantes }

procedure TfrmCadAssinantes.ActionAtualizarCampoVendedorExecute
  (Sender: TObject);
begin
  dmDadosAssinantes.cdsLookupVendedores.Refresh;
  dmDadosAssinantes.cdsLookupVendedores.First;
  DBLookupComboBox4.KeyValue := dmDadosAssinantes.cdsLookupVendedoresvencod.Value;
end;

procedure TfrmCadAssinantes.ActionAtualizarCampoCobradorExecute
  (Sender: TObject);
begin
  dmDadosAssinantes.cdsLookupCobradores.Refresh;
  dmDadosAssinantes.cdsLookupCobradores.First;
  DBLookupComboBox3.KeyValue := dmDadosAssinantes.cdsLookupCobradorescobcod.Value;
end;

procedure TfrmCadAssinantes.ActionCancelarAssinanteExecute(Sender: TObject);
begin
  dmDadosAssinantes.CancelarManutencaoAssinante;
  ControlarPanel(Consulta);
end;

procedure TfrmCadAssinantes.ActionCancelarAssinaturaExecute(Sender: TObject);
begin
  dmDadosAssinantes.CancelarManutencaoAssinatura;
  ControlarPanel(Consulta);
end;

procedure TfrmCadAssinantes.ActionCancelarBaixaExecute(Sender: TObject);
begin
  dmDadosAssinantes.CancelarManutencaoBaixa;
  ControlarPanel(Consulta);
end;

procedure TfrmCadAssinantes.ActionCancelarHistoricoExecute(Sender: TObject);
begin
  dmDadosAssinantes.CancelarManutencaoHistorico;
  ControlarPanel(Consulta);
end;

procedure TfrmCadAssinantes.ActionConsultarAssinanteExecute(Sender: TObject);
begin
  ControlarPanel(ConsultaAssinante);
end;

procedure TfrmCadAssinantes.ActionEditarAssinanteExecute(Sender: TObject);
begin
  dmDadosAssinantes.EditarAssinante;
  ControlarPanel(ManutencaoAssinante);
end;

procedure TfrmCadAssinantes.ActionEditarAssinaturaExecute(Sender: TObject);
begin
  dmDadosAssinantes.EditarAssinatura;
  ControlarPanel(ManutencaoAssinatura);
end;

procedure TfrmCadAssinantes.ActionEditarBaixaExecute(Sender: TObject);
begin
  dmDadosAssinantes.EditarBaixa;
  ControlarPanel(ManutencaoBaixa);
end;

procedure TfrmCadAssinantes.ActionEditarHistoricoExecute(Sender: TObject);
begin
  dmDadosAssinantes.EditarHistorico;
  ControlarPanel(ManutencaoHistorico);
end;

procedure TfrmCadAssinantes.ActionExcluirAssinanteExecute(Sender: TObject);
begin
  dmDadosAssinantes.ExcluirAssinante;
  // Executo este Action para atualizar os dados da tela.
  ActionFiltrar.Execute;
end;

procedure TfrmCadAssinantes.ActionExcluirAssinaturaExecute(Sender: TObject);
begin
  dmDadosAssinantes.ExcluirAssinatura;
  // Executo este Action para atualizar os dados da tela.
  ActionFiltrar.Execute;
end;

procedure TfrmCadAssinantes.ActionExcluirBaixaExecute(Sender: TObject);
begin
  dmDadosAssinantes.ExcluirBaixa;
  // Executo este Action para atualizar os dados da tela.
  ActionFiltrar.Execute;
end;

procedure TfrmCadAssinantes.ActionExcluirHistoricoExecute(Sender: TObject);
begin
  try
    dmDadosAssinantes.ExcluirHistorico;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      ActionFiltrar.Execute;
    end;
  end;
end;

procedure TfrmCadAssinantes.ActionFiltrarExecute(Sender: TObject);
begin
  TfrmMensagem.MostrarMesagem('Aguarde...');
  try
    dmDadosAssinantes.FiltrarAssinantes(StrToInt(edtCodigo.Text),
      edtNomeAssinante.Text, edtEndereco.Text, edtNroEndereco.Text,
      edtCodigoZona.Text, edtDescrZona.Text, -1);
  finally
    TfrmMensagem.MostrarMesagem;
  end;

  lblTotalAssinantes.Caption := FormatFloat('###,##0',
    dmDadosAssinantes.cdsTblass.RecordCount) + ' assinante(s) encontrado(s)';
end;

procedure TfrmCadAssinantes.ActionHistoricoAlteracoesExecute(Sender: TObject);
var
  lfrmRelatAlteracoesAssinante: TfrmRelatAlteracoesAssinante;
  ldmDadosRelat: TdmDadosRelat;
begin
  if dmDadosAssinantes.cdsTblass.RecordCount = 0 then
    raise Exception.Create('Nenhum Assinante foi selecionado.');

  lfrmRelatAlteracoesAssinante := TfrmRelatAlteracoesAssinante.Create(self);
  try
    if lfrmRelatAlteracoesAssinante.ShowModal = mrOk then
    begin
      // executa o relatório
      ldmDadosRelat := TdmDadosRelat.Create(self);
      try
        ldmDadosRelat.ShowReportAlteracoesAssinante(dmDadosAssinantes.cdsTblassasscod.Value, lfrmRelatAlteracoesAssinante.DataInicial, lfrmRelatAlteracoesAssinante.DataFinal);
      finally
        FreeAndNil(ldmDadosRelat);
      end;
    end;
  finally
    FreeAndNil(lfrmRelatAlteracoesAssinante);
  end;
end;

procedure TfrmCadAssinantes.ActionNovaAssinaturaExecute(Sender: TObject);
begin
  dmDadosAssinantes.AdicionarAssinatura;
  ControlarPanel(ManutencaoAssinatura);
end;

procedure TfrmCadAssinantes.ActionNovaBaixaExecute(Sender: TObject);
begin
  dmDadosAssinantes.AdicionarBaixa;
  ControlarPanel(ManutencaoBaixa);
end;

procedure TfrmCadAssinantes.ActionNovoAssinanteExecute(Sender: TObject);
begin
  dmDadosAssinantes.AdicionarAssinante;
  ControlarPanel(ManutencaoAssinante);
end;

procedure TfrmCadAssinantes.ActionNovoHistoricoExecute(Sender: TObject);
begin
  dmDadosAssinantes.AdicionarHistorico;
  ControlarPanel(ManutencaoHistorico);
end;

procedure TfrmCadAssinantes.ActionOkAssinanteExecute(Sender: TObject);
begin
  dmDadosAssinantes.SalvarAssinante;

  ControlarPanel(Consulta);

  ActionFiltrar.Execute;
end;

procedure TfrmCadAssinantes.ActionOkAssinaturaExecute(Sender: TObject);
begin
  dmDadosAssinantes.SalvarAssinatura;

  ControlarPanel(Consulta);

  ActionFiltrar.Execute;
end;

procedure TfrmCadAssinantes.ActionOkBaixaExecute(Sender: TObject);
begin
  dmDadosAssinantes.SalvarBaixa;

  ControlarPanel(Consulta);

  ActionFiltrar.Execute;
end;

procedure TfrmCadAssinantes.ActionOkHistoricoExecute(Sender: TObject);
begin
  dmDadosAssinantes.SalvarHistorico;

  ControlarPanel(Consulta);

  ActionFiltrar.Execute;
end;

procedure TfrmCadAssinantes.ControlaCamposManutencaoAssinante;
begin
  if dmDadosAssinantes.cdsTblassassstatus.AsInteger = 0 then  // Ativo
  begin
    DBEdtDataInativo.ReadOnly := true;
    DBEdtDataInativo.Color := clBtnFace;
    DBEdtDataInativo.TabStop := false;
  end
  else
  begin
    DBEdtDataInativo.ReadOnly := False;
    DBEdtDataInativo.Color := clWindow;
    DBEdtDataInativo.TabStop := true;
  end;

end;

procedure TfrmCadAssinantes.ControlaCamposManutencaoAssinatura;
begin
  // Assinatura

  if dmDadosAssinantes.cdsTbladaadacancel.AsString = 'N' then  // Não Cancelada
  begin
    JvDBedtDataCancelamento.ReadOnly := true;
    JvDBedtDataCancelamento.Color := clBtnFace;
    JvDBedtDataCancelamento.TabStop := false;
  end
  else
  begin
    JvDBedtDataCancelamento.ReadOnly := False;
    JvDBedtDataCancelamento.Color := clWindow;
    JvDBedtDataCancelamento.TabStop := true;
  end;

  // Condições de Pagamento

  if dmDadosAssinantes.cdsTblcpa.RecordCount = 0 then
  begin
    edtQtdeParcelas.Value := 4;
    edtPrimeiroVenc.Date := IncMonth(dmDadosGlobal.GetDataHoraBanco, 1);
  end
  else
  begin
    edtQtdeParcelas.Value := dmDadosAssinantes.cdsTblcpa.RecordCount;
    dmDadosAssinantes.cdsTblcpa.First;
    edtPrimeiroVenc.Date := dmDadosAssinantes.cdsTblcpacpadtvenc.Value;
  end;
end;

procedure TfrmCadAssinantes.ControlarPanel(APanel: TTela);
begin
  if APanel = Consulta then
  begin
    // Muda para a tela de Consulta
    pnlConsulta.Visible := true;
    pnlManutencaoAssinante.Visible := false;
    pnlManutencaoAssinatura.Visible := false;
    pnlManutencaoBaixa.Visible := false;
    pnlManutencaoHistorico.Visible := false;

    edtNomeAssinante.SetFocus;
  end
  else if (APanel = ManutencaoAssinante) or (APanel = ConsultaAssinante) then
  begin
    // Muda para a tela de Manutencao de Assinante
    pnlConsulta.Visible := false;
    pnlManutencaoAssinante.Visible := true;
    pnlManutencaoAssinatura.Visible := false;
    pnlManutencaoBaixa.Visible := false;
    pnlManutencaoHistorico.Visible := false;

    ControlaCamposManutencaoAssinante;

    if APanel = ManutencaoAssinante then
    begin
      btnConsultaCep.Enabled := true;
      btnOkAssinante.Enabled := true;
    end
    else
    begin
      btnConsultaCep.Enabled := false;
      btnOkAssinante.Enabled := false;
    end;

    DBEditNome.SetFocus;
  end
  else if APanel = ManutencaoAssinatura then
  begin
    // Muda para a tela de Manutencao de Assinante
    pnlConsulta.Visible := false;
    pnlManutencaoAssinante.Visible := false;
    pnlManutencaoAssinatura.Visible := true;
    pnlManutencaoBaixa.Visible := false;
    pnlManutencaoHistorico.Visible := false;

    ControlaCamposManutencaoAssinatura;

    DBLookupComboBoxTipo.SetFocus;
  end
  else if APanel = ManutencaoBaixa then
  begin
    // Muda para a tela de Manutencao da baixa
    pnlConsulta.Visible := false;
    pnlManutencaoAssinante.Visible := false;
    pnlManutencaoAssinatura.Visible := false;
    pnlManutencaoBaixa.Visible := true;
    pnlManutencaoHistorico.Visible := false;

    dbedtValorBaixa.SetFocus;
  end
  else if APanel = ManutencaoHistorico then
  begin
    // Muda para a tela de Manutencao da baixa
    pnlConsulta.Visible := false;
    pnlManutencaoAssinante.Visible := false;
    pnlManutencaoAssinatura.Visible := false;
    pnlManutencaoBaixa.Visible := false;
    pnlManutencaoHistorico.Visible := true;

    DBMemoHasdescr.SetFocus;
  end;
end;

procedure TfrmCadAssinantes.dbedtRdzcodKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  // Pesquisa de endereço
  if Key = VK_F3 then
    if pnlManutencaoAssinante.Visible then
      btnPesquisarEnderecoClick(btnPesquisarEndereco);
end;

procedure TfrmCadAssinantes.DBGridAssinaturasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (Column.FieldName = 'CalcAdacancel') and (DBGridAssinaturas.DataSource.DataSet.FieldByName('adacancel').AsString = 'S') then
  begin
    {
    dbGridAssinantes.Canvas.Font.Color  := clRed;
    dbGridAssinantes.Canvas.Font.Style := [fsBold];

    dbGridAssinantes.Canvas.FillRect(Rect);
    dbGridAssinantes.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    }
    ImageListGrid.Draw( (Sender as TDBGrid).Canvas, Rect.Left + 1, Rect.Top +1, 0);
  end;
end;

procedure TfrmCadAssinantes.dbGridAssinantesDblClick(Sender: TObject);
begin
  if dbGridAssinantes.DataSource.DataSet.Active then
    if TClientDataSet(dbGridAssinantes.DataSource.DataSet).RecordCount > 0 then
      if ActionEditarAssinante.Enabled then
        ActionEditarAssinante.Execute
      else
        ActionConsultarAssinante.Execute;
end;

procedure TfrmCadAssinantes.dbGridAssinantesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (Column.FieldName = 'CalcDescrStatus') and (dbGridAssinantes.DataSource.DataSet.FieldByName('assstatus').AsInteger = 1) then
  begin
    ImageListGrid.Draw((Sender as TDBGrid).Canvas, Rect.Left + 1, Rect.Top +1, 0);
  end;

  {if (Column.FieldName = 'CalcNome') and (dbGridAssinantes.DataSource.DataSet.FieldByName('QtdHistoricos').AsInteger > 0) then
  begin
    ImageListGrid.Draw((Sender as TDBGrid).Canvas, Rect.Left + 1, Rect.Top +1, 1);
  end;}

end;

procedure TfrmCadAssinantes.DBLookupComboBox1Click(Sender: TObject);
begin
  ControlaCamposManutencaoAssinante;
end;

procedure TfrmCadAssinantes.DBLookupComboBox6Click(Sender: TObject);
begin
  ControlaCamposManutencaoAssinatura;
end;

procedure TfrmCadAssinantes.edtCodigoExit(Sender: TObject);
begin
  if trim(edtCodigo.Text) = EmptyStr then
    edtCodigo.Text := '0';
end;

procedure TfrmCadAssinantes.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key,['0'..'9', #8])) then
    key := #0;
end;

procedure TfrmCadAssinantes.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dmDadosAssinantes.CancelarManutencaoBaixa;
  dmDadosAssinantes.CancelarManutencaoHistorico;
  dmDadosAssinantes.CancelarManutencaoAssinatura;
  dmDadosAssinantes.CancelarManutencaoAssinante;
end;

procedure TfrmCadAssinantes.btnConsultaCepClick(Sender: TObject);
var
  ldmDadosCep: TdmDadosCep;
begin
  frmLocalizarCep := TfrmLocalizarCep.Create(self);
  try
    frmLocalizarCep.UF := DBEditUF.DataSource.DataSet.FieldByName('cepeuf').AsString;
    frmLocalizarCep.Cidade := DBEditMunicipio.DataSource.DataSet.FieldByName('cepmunicipio').AsString;
    frmLocalizarCep.Endereco := DBEditEndereco.DataSource.DataSet.FieldByName('rdzender').AsString;

    if frmLocalizarCep.ShowModal = mrOk then  // Significa que selecionou um CEP
    begin
      if frmLocalizarCep.CepSelecionado <> EmptyStr then
      begin
        // Atualizar o CEP selecionado na tabela
        ldmDadosCep := tdmDadosCep.Create(self);
        try
          ldmDadosCep.AdicionarNovoCep(frmLocalizarCep.CepSelecionado, frmLocalizarCep.Cidade, frmLocalizarCep.UF);
        finally
          FreeAndNil(ldmDadosCep);
        end;

        DBEditCEP.DataSource.DataSet.FieldByName('cepcepent').AsString := frmLocalizarCep.CepSelecionado;
      end;
    end;

    DBEditCEP.SetFocus;
  finally
    FreeAndNil(frmLocalizarCep);
  end;
end;

procedure TfrmCadAssinantes.btnGerarParcelasClick(Sender: TObject);
begin
  dmDadosAssinantes.GerarCondicoesParcelas(edtQtdeParcelas.AsInteger, edtPrimeiroVenc.Date, (dmDadosAssinantes.cdsTbladaadavl.Value - dmDadosAssinantes.cdsTbladaadavldesc.Value));
end;

procedure TfrmCadAssinantes.btnPesquisarEnderecoClick(Sender: TObject);
begin
  frmLocalizarEndereco := TfrmLocalizarEndereco.Create(Self);
  try
    if frmLocalizarEndereco.ShowModal = mrOk then
      dmDadosAssinantes.cdsTblassrdzcod.Value := dmDadosAssinantes.cdsPesquisaEnderecordzcod.Value;
  finally
    FreeAndNil(frmLocalizarEndereco);
  end;
end;

procedure TfrmCadAssinantes.TimerInicioTimer(Sender: TObject);
begin
  TimerInicio.Enabled := false;

  // Posiciona na primeira aba
  PageControl.ActivePageIndex := 0;

  ControlarPanel(Consulta);

  // Controla as permissões da tela
  dmUsuario.ValidarPermissaoActionList(ActionList);

  // Aplica o filtro
  ActionFiltrar.Execute;

  edtNomeAssinante.SetFocus;
end;

end.

