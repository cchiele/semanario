unit uCadCeps;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvButton,
  JvCtrls, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, JvExControls, JvSpeedButton, uLocalizarCep, uPrincipal;

type
   TManutencao = (Consultar, Manutencao);

type
  TfrmCadCeps = class(TForm)
    pnlManutencao: TPanel;
    pnlConsulta: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    btnNovo: TJvImgBtn;
    btnEditar: TJvImgBtn;
    btnExcluir: TJvImgBtn;
    edtMunicipio: TLabeledEdit;
    edtCep: TMaskEdit;
    Label1: TLabel;
    EdtUf: TLabeledEdit;
    btnFiltrar: TJvImgBtn;
    dbGridCeps: TDBGrid;
    dsTblcep: TDataSource;
    Label2: TLabel;
    dbedtCep: TDBEdit;
    Label3: TLabel;
    dbedtMunicipio: TDBEdit;
    Label4: TLabel;
    DBLCBXUF: TDBLookupComboBox;
    Panel2: TPanel;
    Label28: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox3: TGroupBox;
    Label29: TLabel;
    JvImgBtn1: TJvImgBtn;
    JvImgBtn2: TJvImgBtn;
    TimerInicio: TTimer;
    btnConsultaCep: TJvImgBtn;
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure JvImgBtn1Click(Sender: TObject);
    procedure JvImgBtn2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TimerInicioTimer(Sender: TObject);
    procedure btnConsultaCepClick(Sender: TObject);
  private
    { Private declarations }
    procedure ControlarTela(AManutencao: TManutencao);

  public
    { Public declarations }
  end;

var
  frmCadCeps: TfrmCadCeps;

implementation

{$R *.dfm}

uses uDadosCep, uDadosGlobal, uUsuario;

procedure TfrmCadCeps.btnConsultaCepClick(Sender: TObject);
begin
  frmLocalizarCep := TfrmLocalizarCep.Create(self);
  try
    if frmLocalizarCep.ShowModal = mrOk then  // Significa que selecionou um CEP
    begin
      if frmLocalizarCep.CepSelecionado <> EmptyStr then
      begin
        dbedtCep.DataSource.DataSet.FieldByName('cepcep').AsString := frmLocalizarCep.CepSelecionado;
        dbedtMunicipio.DataSource.DataSet.FieldByName('cepmunicipio').AsString := frmLocalizarCep.Cidade;
        DBLCBXUF.DataSource.DataSet.FieldByName('cepeuf').AsString := frmLocalizarCep.UF;
      end;
    end;

    dbedtCep.SetFocus;
  finally
    FreeAndNil(frmLocalizarCep);
  end;
end;

procedure TfrmCadCeps.btnEditarClick(Sender: TObject);
begin
  dmDadosCep.EditarCep;
  ControlarTela(Manutencao);
end;

procedure TfrmCadCeps.btnExcluirClick(Sender: TObject);
begin
  try
    dmDadosCep.ExcluirCep;
  except
    on E: Exception do
    begin
      MessageDlg(e.Message, mtError,[mbOK],0);
      btnFiltrarClick(btnFiltrar);
    end;
  end;
end;

procedure TfrmCadCeps.btnFiltrarClick(Sender: TObject);
begin
  dmDadosCep.FiltrarCeps(edtCep.Text, edtMunicipio.Text, EdtUf.Text);
end;

procedure TfrmCadCeps.btnNovoClick(Sender: TObject);
begin
  dmDadosCep.AdicionarCep;
  ControlarTela(Manutencao);
end;

procedure TfrmCadCeps.ControlarTela(AManutencao: TManutencao);
begin
  if AManutencao = Consultar then
  begin
    // Muda para a tela de Consulta
    pnlConsulta.Visible := true;
    pnlManutencao.Visible := false;

    edtCep.SetFocus;
  end
  else
  begin
    // Muda para a tela de Manutenção
    pnlConsulta.Visible := false;
    pnlManutencao.Visible := true;

    if dmDadosCep.cdsTblcep.State = dsEdit then
    begin
      btnConsultaCep.Visible := false;

      dbedtCep.ReadOnly := true;
      dbedtCep.Color := clBtnFace;
      dbedtCep.TabStop := false;

      dbedtMunicipio.SetFocus;
    end
    else if dmDadosCep.cdsTblcep.State = dsInsert then
    begin
      btnConsultaCep.Visible := true;

      dbedtCep.ReadOnly := false;
      dbedtCep.Color := clWindow;
      dbedtCep.TabStop := true;

      dbedtCep.SetFocus;
    end;
  end;
end;

procedure TfrmCadCeps.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  dmDadosCep.CalcelarCep;
end;

procedure TfrmCadCeps.FormShow(Sender: TObject);
begin
  TimerInicio.Enabled := true;
end;

procedure TfrmCadCeps.JvImgBtn1Click(Sender: TObject);
begin
  dmDadosCep.SalvarCep;

  ControlarTela(Consultar);

  btnFiltrar.Click;
end;

procedure TfrmCadCeps.JvImgBtn2Click(Sender: TObject);
begin
  dmDadosCep.CalcelarCep;

  ControlarTela(Consultar);
end;

procedure TfrmCadCeps.TimerInicioTimer(Sender: TObject);
begin
  TimerInicio.Enabled := false;

  // Verifica as permissões do usuário
  btnNovo.Enabled := dmUsuario.TemPermissaoAcesso(29);
  btnEditar.Enabled := dmUsuario.TemPermissaoAcesso(30);
  btnExcluir.Enabled := dmUsuario.TemPermissaoAcesso(31);

  ControlarTela(Consultar);
end;

end.
