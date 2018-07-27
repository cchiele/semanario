unit uCadGruposVendedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, JvExStdCtrls,
  JvButton, JvCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB;

type
   TTela = (Consulta, Manutencao);

type
  TfrmCadGruposVendedores = class(TForm)
    pnlConsulta: TPanel;
    GroupBox2: TGroupBox;
    dbGrid: TDBGrid;
    GroupBox1: TGroupBox;
    edtGrupo: TLabeledEdit;
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
    dsTblgdv: TDataSource;
    DBEdit1: TDBEdit;
    dbEdtDescr: TDBEdit;
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
  frmCadGruposVendedores: TfrmCadGruposVendedores;

implementation

{$R *.dfm}

uses uDadosVendedores, uUsuario;

procedure TfrmCadGruposVendedores.btnCancelarClick(Sender: TObject);
begin
  dmDadosVendedores.CalcelarManutencaoGrupo;

  ControlarTela(Consulta);
end;

procedure TfrmCadGruposVendedores.btnEditarClick(Sender: TObject);
begin
  dmDadosVendedores.EditarGrupo;
  ControlarTela(Manutencao);
end;

procedure TfrmCadGruposVendedores.btnExcluirClick(Sender: TObject);
begin
  try
    dmDadosVendedores.ExcluirGrupo;
  except
    on E: Exception do
    begin
      MessageDlg(e.Message, mtError,[mbOK],0);
      btnFiltrarClick(btnFiltrar);
    end;
  end;
end;

procedure TfrmCadGruposVendedores.btnFiltrarClick(Sender: TObject);
begin
  dmDadosVendedores.FiltrarGrupos(0, edtGrupo.Text);
end;

procedure TfrmCadGruposVendedores.btnNovoClick(Sender: TObject);
begin
  dmDadosVendedores.AdicionarGrupo;
  ControlarTela(Manutencao);
end;

procedure TfrmCadGruposVendedores.btnOkClick(Sender: TObject);
begin
  dmDadosVendedores.SalvarGrupo;

  ControlarTela(Consulta);

  btnFiltrarClick(btnFiltrar);
end;

procedure TfrmCadGruposVendedores.ControlarTela(ATela: TTela);
begin
  if ATela = Consulta then
  begin
    // Muda para a tela de Consulta
    pnlConsulta.Visible := true;
    pnlManutencao.Visible := false;

    edtGrupo.SetFocus;
  end
  else
  begin
    // Muda para a tela de Manutenção
    pnlConsulta.Visible := false;
    pnlManutencao.Visible := true;

    dbEdtDescr.SetFocus;
  end;
end;

procedure TfrmCadGruposVendedores.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  dmDadosVendedores.CalcelarManutencaoGrupo;
end;

procedure TfrmCadGruposVendedores.FormShow(Sender: TObject);
begin
  TimerInicio.Enabled := true;
end;

procedure TfrmCadGruposVendedores.TimerInicioTimer(Sender: TObject);
begin
  TimerInicio.Enabled := false;

  // Verifica as permissões do usuário
  btnNovo.Enabled := dmUsuario.TemPermissaoAcesso(19);
  btnEditar.Enabled := dmUsuario.TemPermissaoAcesso(20);
  btnExcluir.Enabled := dmUsuario.TemPermissaoAcesso(21);

  ControlarTela(Consulta);
end;

end.
