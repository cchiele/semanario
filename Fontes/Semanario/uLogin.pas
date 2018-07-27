unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  JvComponentBase, JvEnterTab, Vcl.Imaging.pngimage, JvExStdCtrls, JvButton,
  JvCtrls;

type
  TfrmLogin = class(TForm)
    edtUsuario: TLabeledEdit;
    edtSenha: TLabeledEdit;
    JvEnterAsTab: TJvEnterAsTab;
    Image: TImage;
    JvImgBtn1: TJvImgBtn;
    procedure JvImgBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

uses uUsuario;

procedure TfrmLogin.JvImgBtn1Click(Sender: TObject);
begin
  ModalResult := mrNone;

  if not dmUsuario.ValidarUsuario(edtUsuario.Text, edtSenha.Text) then
  begin
    edtUsuario.SetFocus;
    exit;
  end;

  ModalResult := mrOk;
end;

end.
