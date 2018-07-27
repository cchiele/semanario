unit uCadZonas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.DBCtrls, Vcl.StdCtrls, JvExStdCtrls, JvButton, JvCtrls, Vcl.Mask,
  JvCombobox, JvDBSearchComboBox, Vcl.Grids, Vcl.DBGrids, Data.DB;

type
   TTela = (Consulta, Manutencao);

type
  TfrmCadZonas = class(TForm)
    pnlConsulta: TPanel;
    GroupBox2: TGroupBox;
    dbGrid: TDBGrid;
    GroupBox1: TGroupBox;
    edtCodigoZona: TLabeledEdit;
    btnFiltrar: TJvImgBtn;
    Panel1: TPanel;
    btnNovo: TJvImgBtn;
    btnEditar: TJvImgBtn;
    btnExcluir: TJvImgBtn;
    pnlManutencao: TPanel;
    Panel2: TPanel;
    Label29: TLabel;
    btnOk: TJvImgBtn;
    btnCancelar: TJvImgBtn;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbedtCodigo: TDBEdit;
    TimerInicio: TTimer;
    dsTblzon: TDataSource;
    Label1: TLabel;
    dbedtDescr: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    edtEntregador: TLabeledEdit;
    edtDescr: TEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure TimerInicioTimer(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ControlarTela(ATela: TTela);

  public
    { Public declarations }
  end;

var
  frmCadZonas: TfrmCadZonas;

implementation

{$R *.dfm}

uses uPrincipal, uDadosZonasRuas, uUsuario;

{ TfrmCadZonas }

procedure TfrmCadZonas.btnCancelarClick(Sender: TObject);
begin
  dmDadosZonasRuas.CalcelarManutencaoZona;

  ControlarTela(Consulta);
end;

procedure TfrmCadZonas.btnEditarClick(Sender: TObject);
begin
  dmDadosZonasRuas.EditarZona;
  ControlarTela(Manutencao);
end;

procedure TfrmCadZonas.btnExcluirClick(Sender: TObject);
begin
  try
    dmDadosZonasRuas.ExcluirZona;
  except
    on E: Exception do
    begin
      MessageDlg(e.Message, mtError,[mbOK],0);
      btnFiltrarClick(btnFiltrar);
    end;
  end;
end;

procedure TfrmCadZonas.btnFiltrarClick(Sender: TObject);
begin
  dmDadosZonasRuas.FiltrarZonas(edtCodigoZona.Text, edtDescr.Text, edtEntregador.Text);
end;

procedure TfrmCadZonas.btnNovoClick(Sender: TObject);
begin
  dmDadosZonasRuas.AdicionarZona;
  ControlarTela(Manutencao);
end;

procedure TfrmCadZonas.btnOkClick(Sender: TObject);
begin
  dmDadosZonasRuas.SalvarZona;

  ControlarTela(Consulta);

  btnFiltrarClick(btnFiltrar);
end;

procedure TfrmCadZonas.ControlarTela(ATela: TTela);
begin
  if ATela = Consulta then
  begin
    // Muda para a tela de Consulta
    pnlConsulta.Visible := true;
    pnlManutencao.Visible := false;

    edtDescr.SetFocus;
  end
  else
  begin
    // Muda para a tela de Manutenção
    pnlConsulta.Visible := false;
    pnlManutencao.Visible := true;

    if dmDadosZonasRuas.cdsTblzon.State = dsEdit then
    begin
      dbedtCodigo.ReadOnly := true;
      dbedtCodigo.Color := clBtnFace;
      dbedtCodigo.TabStop := false;

      dbedtDescr.SetFocus;
    end
    else if dmDadosZonasRuas.cdsTblzon.State = dsInsert then
    begin
      dbedtCodigo.ReadOnly := false;
      dbedtCodigo.Color := clWindow;
      dbedtCodigo.TabStop := true;

      dbedtCodigo.SetFocus;
    end;
  end;
end;

procedure TfrmCadZonas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  dmDadosZonasRuas.CalcelarManutencaoZona;
end;

procedure TfrmCadZonas.FormShow(Sender: TObject);
begin
  TimerInicio.Enabled := true;
end;

procedure TfrmCadZonas.TimerInicioTimer(Sender: TObject);
begin
  TimerInicio.Enabled := false;

  ControlarTela(Consulta);

  // Verifica as permissões do usuário
  btnNovo.Enabled := dmUsuario.TemPermissaoAcesso(9);
  btnEditar.Enabled := dmUsuario.TemPermissaoAcesso(10);
  btnExcluir.Enabled := dmUsuario.TemPermissaoAcesso(11);

  btnFiltrarClick(btnFiltrar);

  edtCodigoZona.SetFocus;
end;

end.
