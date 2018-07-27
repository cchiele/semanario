unit uCadVendedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, JvExStdCtrls, JvButton, JvCtrls, Data.DB,
  JvExMask, JvToolEdit, JvDBControls, JvCombobox, JvDBCombobox,
  JvDBSearchComboBox;

type
   TTela = (Consulta, Manutencao);

type
  TfrmCadVendedores = class(TForm)
    pnlManutencao: TPanel;
    Panel2: TPanel;
    Label29: TLabel;
    btnOk: TJvImgBtn;
    btnCancelar: TJvImgBtn;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    pnlConsulta: TPanel;
    GroupBox2: TGroupBox;
    dbGrid: TDBGrid;
    GroupBox1: TGroupBox;
    edtNome: TLabeledEdit;
    btnFiltrar: TJvImgBtn;
    Panel1: TPanel;
    btnNovo: TJvImgBtn;
    btnEditar: TJvImgBtn;
    btnExcluir: TJvImgBtn;
    TimerInicio: TTimer;
    dsTblven: TDataSource;
    Label1: TLabel;
    dbedtNome: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    dsLookup: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label3: TLabel;
    Label6: TLabel;
    dsFiltroGrupos: TDataSource;
    JvDBSearchComboBox1: TJvDBSearchComboBox;
    Label7: TLabel;
    procedure TimerInicioTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnNovoClick(Sender: TObject);
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
  frmCadVendedores: TfrmCadVendedores;

implementation

{$R *.dfm}

uses uDadosVendedores, uUsuario;

{ TfrmCadVendedores }

procedure TfrmCadVendedores.btnCancelarClick(Sender: TObject);
begin
  dmDadosVendedores.CalcelarManutencaoVendedor;

  ControlarTela(Consulta);
end;

procedure TfrmCadVendedores.btnEditarClick(Sender: TObject);
begin
  dmDadosVendedores.EditarVendedor;
  ControlarTela(Manutencao);
end;

procedure TfrmCadVendedores.btnExcluirClick(Sender: TObject);
begin
  try
    dmDadosVendedores.ExcluirVendedor;
  except
    on E: Exception do
    begin
      MessageDlg(e.Message, mtError,[mbOK],0);
      btnFiltrarClick(btnFiltrar);
    end;
  end;
end;

procedure TfrmCadVendedores.btnFiltrarClick(Sender: TObject);
begin
  dmDadosVendedores.FiltrarVendedores(0, edtNome.Text, dmDadosVendedores.cdsFiltroGruposgdvcod.AsInteger);
end;

procedure TfrmCadVendedores.btnNovoClick(Sender: TObject);
begin
  dmDadosVendedores.AdicionarVendedor;
  ControlarTela(Manutencao);
end;

procedure TfrmCadVendedores.btnOkClick(Sender: TObject);
begin
  dmDadosVendedores.SalvarVendedor;

  ControlarTela(Consulta);

  btnFiltrarClick(btnFiltrar);
end;

procedure TfrmCadVendedores.ControlarTela(ATela: TTela);
begin
  if ATela = Consulta then
  begin
    // Muda para a tela de Consulta
    pnlConsulta.Visible := true;
    pnlManutencao.Visible := false;

    edtNome.SetFocus;
  end
  else
  begin
    // Muda para a tela de Manutenção
    pnlConsulta.Visible := false;
    pnlManutencao.Visible := true;

    dbedtNome.SetFocus;
  end;
end;

procedure TfrmCadVendedores.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dmDadosVendedores.CalcelarManutencaoVendedor;
end;

procedure TfrmCadVendedores.FormShow(Sender: TObject);
begin
  TimerInicio.Enabled := true;
end;

procedure TfrmCadVendedores.TimerInicioTimer(Sender: TObject);
begin
  TimerInicio.Enabled := false;

  // Verifica as permissões do usuário
  btnNovo.Enabled := dmUsuario.TemPermissaoAcesso(14);
  btnEditar.Enabled := dmUsuario.TemPermissaoAcesso(15);
  btnExcluir.Enabled := dmUsuario.TemPermissaoAcesso(16);

  dmDadosVendedores.CarregarFiltroGrupos;

  ControlarTela(Consulta);

  btnFiltrarClick(btnFiltrar);
end;

end.
