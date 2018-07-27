unit uEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Vcl.Mask, Vcl.DBCtrls, JvExMask, JvToolEdit, JvMaskEdit, JvDBControls,
  Vcl.ExtCtrls;

type
  TfrmEmpresa = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsTblemp: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    dsTblcep: TDataSource;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    TimerInicio: TTimer;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelarClick(Sender: TObject);
    procedure TimerInicioTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpresa: TfrmEmpresa;

implementation

{$R *.dfm}

uses uDadosEmpresa, uDadosGlobal, uAlterarSenha, uUsuario, uPrincipal;

procedure TfrmEmpresa.btnCancelarClick(Sender: TObject);
begin
  frmPrincipal.FecharPagina(frmPrincipal.JvPageList.ActivePage);
end;

procedure TfrmEmpresa.btnOkClick(Sender: TObject);
begin
  dmDadosEmpresa.SalvarManutencao;

  btnCancelar.Click;
end;

procedure TfrmEmpresa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  dmDadosEmpresa.CalcelarManutencao;
  dmDadosEmpresa.FiltrarEmpresas;
end;

procedure TfrmEmpresa.FormCreate(Sender: TObject);
begin
  TimerInicio.Enabled := true;
end;

procedure TfrmEmpresa.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 Then
  begin
    key := #0;
    Perform(Wm_NextDlgCtl,0,0);
  end;
end;

procedure TfrmEmpresa.FormShow(Sender: TObject);
begin
  dmDadosEmpresa.FiltrarEmpresas;
  dmDadosEmpresa.EditarEmpresa;

  // Controla as permissões da tela
  btnOk.Enabled := dmUsuario.TemPermissaoAcesso(56);
end;

procedure TfrmEmpresa.TimerInicioTimer(Sender: TObject);
begin
  TimerInicio.Enabled := false;

  DBEdit1.SetFocus;
end;

end.
