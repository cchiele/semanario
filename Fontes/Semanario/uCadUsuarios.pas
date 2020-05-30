unit uCadUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, JvExStdCtrls,
  JvButton, JvCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB,
  Vcl.ImgList, Vcl.ComCtrls, JvExControls, JvInstallLabel, Vcl.Menus,
  System.ImageList;

type
   TTela = (Consultar, Manutencao);

type
  TfrmCadUsuarios = class(TForm)
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
    pnlManutencao: TPanel;
    Panel2: TPanel;
    Label29: TLabel;
    btnSalvar: TJvImgBtn;
    btnCancelar: TJvImgBtn;
    edtLogin: TLabeledEdit;
    dsTblusu: TDataSource;
    ImageListPermissao: TImageList;
    TimerInicio: TTimer;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    dbedtUsulogin: TDBEdit;
    DBEdit4: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    dbedtSenha: TDBEdit;
    dbedtSenhaRepetir: TDBEdit;
    GroupBox4: TGroupBox;
    TreeViewPermissao: TTreeView;
    PopupMenu: TPopupMenu;
    Permissototal: TMenuItem;
    Desmarcartodasaspermisses1: TMenuItem;
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure TreeViewPermissaoCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure TreeViewPermissaoCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure TreeViewPermissaoDblClick(Sender: TObject);
    procedure TimerInicioTimer(Sender: TObject);
    procedure PermissototalClick(Sender: TObject);
    procedure Desmarcartodasaspermisses1Click(Sender: TObject);
  private
    { Private declarations }
    procedure ControlarTela(ATela: TTela);
    procedure MarcarDesmarcarTodasPermissoes(AMarcar: Boolean);

  public
    { Public declarations }
  end;

var
  frmCadUsuarios: TfrmCadUsuarios;

implementation

{$R *.dfm}

uses uUsuario, uConexao, uPrincipal;

procedure TfrmCadUsuarios.btnCancelarClick(Sender: TObject);
begin
  dmUsuario.CalcelarManutencaoUsuario;

  ControlarTela(Consultar);
end;

procedure TfrmCadUsuarios.btnEditarClick(Sender: TObject);
begin
  dmUsuario.EditarUsuario;
  ControlarTela(Manutencao);
end;

procedure TfrmCadUsuarios.btnExcluirClick(Sender: TObject);
begin
  try
    dmUsuario.ExcluirUsuario;
  except
    on E: Exception do
    begin
      MessageDlg(e.Message, mtError,[mbOK],0);
      btnFiltrarClick(btnFiltrar);
    end;
  end;
end;

procedure TfrmCadUsuarios.btnFiltrarClick(Sender: TObject);
begin
  dmUsuario.FiltrarUsuarios(edtLogin.Text, edtNome.Text);
end;

procedure TfrmCadUsuarios.btnNovoClick(Sender: TObject);
begin
  dmUsuario.AdicionarUsuario;
  ControlarTela(Manutencao);
end;

procedure TfrmCadUsuarios.btnSalvarClick(Sender: TObject);
begin
  dmUsuario.SalvarUsuario;

  ControlarTela(Consultar);

  // Atualiza o menu, pois pode ter alterado as permissões
  frmPrincipal.CarregarMenuPrincipal;
end;

procedure TfrmCadUsuarios.ControlarTela(ATela: TTela);
begin
  if ATela = Consultar then
  begin
    // Muda para a tela de Consulta
    pnlConsulta.Visible := true;
    pnlManutencao.Visible := false;

    edtLogin.SetFocus;
  end
  else
  begin
    // Muda para a tela de Manutenção
    pnlConsulta.Visible := false;
    pnlManutencao.Visible := true;

    dmUsuario.CarregarTreeViewPermissao(TreeViewPermissao);

    dbedtUsulogin.SetFocus;
  end;
end;

procedure TfrmCadUsuarios.Desmarcartodasaspermisses1Click(Sender: TObject);
begin
  MarcarDesmarcarTodasPermissoes(False);
end;

procedure TfrmCadUsuarios.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dmUsuario.CalcelarManutencaoUsuario;
end;

procedure TfrmCadUsuarios.FormShow(Sender: TObject);
begin
  TimerInicio.Enabled := true;
end;

procedure TfrmCadUsuarios.MarcarDesmarcarTodasPermissoes(AMarcar: Boolean);
var
  I: Integer;
begin
  for I := 0 to TreeViewPermissao.Items.Count - 1 do
  begin
    TreeViewPermissao.Select(TreeViewPermissao.Items.Item[i],[]);

    if AMarcar then
    begin
      if TreeViewPermissao.Selected.ImageIndex = 2 then // Não tem permissão
      begin
        TreeViewPermissao.Selected.ImageIndex := 1;
        TreeViewPermissao.Selected.SelectedIndex := 1;

        dmUsuario.MarcarDesmarcarPermissao(TreeViewPermissao.Selected.AbsoluteIndex);
      end;
    end
    else
    begin
      if TreeViewPermissao.Selected.ImageIndex = 1 then // Tem permissão
      begin
        TreeViewPermissao.Selected.ImageIndex := 2;
        TreeViewPermissao.Selected.SelectedIndex := 2;

        dmUsuario.MarcarDesmarcarPermissao(TreeViewPermissao.Selected.AbsoluteIndex);
      end;
    end;
  end;

end;

procedure TfrmCadUsuarios.PermissototalClick(Sender: TObject);
begin
  MarcarDesmarcarTodasPermissoes(true);
end;

procedure TfrmCadUsuarios.TimerInicioTimer(Sender: TObject);
begin
  TimerInicio.Enabled := false;

  ControlarTela(Consultar);

  // Controla as permissões da tela
  btnNovo.Enabled := dmUsuario.TemPermissaoAcesso(60);
  btnEditar.Enabled := dmUsuario.TemPermissaoAcesso(61);
  btnExcluir.Enabled := dmUsuario.TemPermissaoAcesso(62);

  // Aplica o filtro
  btnFiltrarClick(btnFiltrar);
end;

procedure TfrmCadUsuarios.TreeViewPermissaoCollapsing(Sender: TObject;
  Node: TTreeNode; var AllowCollapse: Boolean);
begin
  AllowCollapse := false;
end;

procedure TfrmCadUsuarios.TreeViewPermissaoCustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if node.ImageIndex = 0 then
  begin
    TreeViewPermissao.Canvas.Font.Style := [fsBold];
  end;
end;

procedure TfrmCadUsuarios.TreeViewPermissaoDblClick(Sender: TObject);
begin
  if not Assigned(TreeViewPermissao.Selected) then
    exit;

  if TreeViewPermissao.Selected.ImageIndex = 1 then
  begin
    TreeViewPermissao.Selected.ImageIndex := 2;
    TreeViewPermissao.Selected.SelectedIndex := 2;
  end
  else if TreeViewPermissao.Selected.ImageIndex = 2 then
  begin
    TreeViewPermissao.Selected.ImageIndex := 1;
    TreeViewPermissao.Selected.SelectedIndex := 1;
  end;

  dmUsuario.MarcarDesmarcarPermissao(TreeViewPermissao.Selected.AbsoluteIndex);
end;

end.
