unit uMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfrmMensagem = class(TForm)
    pnlMensagem: TPanel;
  private
    { Private declarations }
    function GetMesagem: string;

    procedure SetMensagem(const Value: string);

  public
    { Public declarations }
    property Mensagem: string read GetMesagem write SetMensagem;

    class procedure MostrarMesagem(AMesangem: String = '');
  end;

var
  frmMensagem: TfrmMensagem;

implementation

{$R *.dfm}

function TfrmMensagem.GetMesagem: string;
begin
  Result := pnlMensagem.Caption;
end;

class procedure TfrmMensagem.MostrarMesagem(AMesangem: String);
begin
  if AMesangem <> EmptyStr then
  begin
    if not Assigned(frmMensagem) then
      frmMensagem := TfrmMensagem.Create(Application);

    frmMensagem.Mensagem := AMesangem;

    frmMensagem.Show;

    Application.ProcessMessages;
  end
  else
  begin
    if Assigned(frmMensagem) then
    begin
      frmMensagem.Close;
      FreeAndNil(frmMensagem);
    end;
  end;

end;

procedure TfrmMensagem.SetMensagem(const Value: string);
begin
  pnlMensagem.Caption := Value;
  Application.ProcessMessages;
end;

end.
