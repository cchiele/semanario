unit uLocalizarEndereco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
  JvExStdCtrls, JvButton, JvCtrls, Vcl.ExtCtrls, Data.DB;

type
  TfrmLocalizarEndereco = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    btnOk: TJvImgBtn;
    btnCancelarAssinante: TJvImgBtn;
    edtPesquisa: TEdit;
    DBGrid1: TDBGrid;
    dsPesquisaEndereco: TDataSource;
    lblTotalRegistros: TLabel;
    procedure edtPesquisaChange(Sender: TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLocalizarEndereco: TfrmLocalizarEndereco;

implementation

{$R *.dfm}

uses uPrincipal, uDadosAssinantes;

procedure TfrmLocalizarEndereco.DBGrid1DblClick(Sender: TObject);
begin
  if not dmDadosAssinantes.cdsPesquisaEndereco.Active then
    exit;

  if dmDadosAssinantes.cdsPesquisaEndereco.RecordCount = 0 then
    exit;

  btnOk.Click;
end;

procedure TfrmLocalizarEndereco.edtPesquisaChange(Sender: TObject);
begin
  dmDadosAssinantes.FiltrarEnderecos(edtPesquisa.Text);

  if dmDadosAssinantes.cdsPesquisaEndereco.Active then
  begin
    lblTotalRegistros.Caption := FormatFloat('#,###,##0', dmDadosAssinantes.cdsPesquisaEndereco.RecordCount) + ' endereço(s) encontrado(s)';

    if dmDadosAssinantes.cdsPesquisaEndereco.RecordCount > 0 then
      btnOk.Enabled := true
    else
      btnOk.Enabled := false;
  end
  else
  begin
    btnOk.Enabled := false;
    lblTotalRegistros.Caption := '0 endereço(s) encontrado(s)';
  end;
end;

procedure TfrmLocalizarEndereco.edtPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if not dmDadosAssinantes.cdsPesquisaEndereco.Active then
    exit;

  if dmDadosAssinantes.cdsPesquisaEndereco.RecordCount = 0 then
    exit;

  if Key = VK_UP then
  begin
    dmDadosAssinantes.cdsPesquisaEndereco.Prior;
    abort;
  end;

  if Key = VK_DOWN then
  begin
    dmDadosAssinantes.cdsPesquisaEndereco.Next;
    abort;
  end;
end;

end.
