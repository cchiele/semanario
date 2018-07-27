unit uAlterarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvButton,
  JvCtrls, Vcl.ExtCtrls, JvComponentBase, JvEnterTab;

type
  TfrmAlterarSenha = class(TForm)
    edtSenhaAtual: TLabeledEdit;
    edtNovaSenha: TLabeledEdit;
    edtNovaSenhaRepetir: TLabeledEdit;
    btnOk: TJvImgBtn;
    btnCancelar: TJvImgBtn;
    JvEnterAsTab: TJvEnterAsTab;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlterarSenha: TfrmAlterarSenha;

implementation

{$R *.dfm}

uses uCadCeps, uUsuario;

procedure TfrmAlterarSenha.btnOkClick(Sender: TObject);
begin
  ModalResult := mrNone;

  dmUsuario.AlterarSenhaUsuario(edtSenhaAtual.Text, edtNovaSenha.Text, edtNovaSenhaRepetir.Text);

  ModalResult := mrOk;
end;

end.
