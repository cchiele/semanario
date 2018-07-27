unit uCadCobradores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, JvExStdCtrls,
  JvButton, JvCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB;

type
   TTela = (Consulta, Manutencao);

type
  TfrmCadCobradores = class(TForm)
    pnlConsulta: TPanel;
    GroupBox2: TGroupBox;
    dbGrid: TDBGrid;
    GroupBox1: TGroupBox;
    edtCobrador: TLabeledEdit;
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
    Label3: TLabel;
    Label5: TLabel;
    dsTblcob: TDataSource;
    DBEdit1: TDBEdit;
    dbEdtNome: TDBEdit;
    TimerInicio: TTimer;
    procedure btnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure TimerInicioTimer(Sender: TObject);
  private
    { Private declarations }
    procedure ControlarTela(ATela: TTela);

  public
    { Public declarations }
  end;

var
  frmCadCobradores: TfrmCadCobradores;

implementation

{$R *.dfm}

uses uDadosCobradores, uUsuario;

procedure TfrmCadCobradores.btnCancelarClick(Sender: TObject);
begin
  dmDadosCobradores.CalcelarManutencaoCobrador;

  ControlarTela(Consulta);
end;

procedure TfrmCadCobradores.btnEditarClick(Sender: TObject);
begin
  dmDadosCobradores.EditarCobrador;
  ControlarTela(Manutencao);
end;

procedure TfrmCadCobradores.btnExcluirClick(Sender: TObject);
begin
  try
    dmDadosCobradores.ExcluirCobrador;
  except
    on E: Exception do
    begin
      MessageDlg(e.Message, mtError,[mbOK],0);
      btnFiltrarClick(btnFiltrar);
    end;
  end;
end;

procedure TfrmCadCobradores.btnFiltrarClick(Sender: TObject);
begin
  dmDadosCobradores.FiltrarCobradores(0, edtCobrador.Text);
end;

procedure TfrmCadCobradores.btnNovoClick(Sender: TObject);
begin
  dmDadosCobradores.AdicionarCobrador;
  ControlarTela(Manutencao);
end;

procedure TfrmCadCobradores.btnOkClick(Sender: TObject);
begin
  dmDadosCobradores.SalvarCobrador;

  ControlarTela(Consulta);

  btnFiltrarClick(btnFiltrar);
end;

procedure TfrmCadCobradores.ControlarTela(ATela: TTela);
begin
  if ATela = Consulta then
  begin
    // Muda para a tela de Consulta
    pnlConsulta.Visible := true;
    pnlManutencao.Visible := false;

    edtCobrador.SetFocus;
  end
  else
  begin
    // Muda para a tela de Manutenção
    pnlConsulta.Visible := false;
    pnlManutencao.Visible := true;

    dbEdtNome.SetFocus;
  end;
end;

procedure TfrmCadCobradores.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dmDadosCobradores.CalcelarManutencaoCobrador;
end;

procedure TfrmCadCobradores.FormShow(Sender: TObject);
begin
  TimerInicio.Enabled := true;
end;

procedure TfrmCadCobradores.TimerInicioTimer(Sender: TObject);
begin
  TimerInicio.Enabled := false;

  // Verifica as permissões do usuário
  btnNovo.Enabled := dmUsuario.TemPermissaoAcesso(24);
  btnEditar.Enabled := dmUsuario.TemPermissaoAcesso(25);
  btnExcluir.Enabled := dmUsuario.TemPermissaoAcesso(26);

  ControlarTela(Consulta);
end;

end.
