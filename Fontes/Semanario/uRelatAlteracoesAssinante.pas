unit uRelatAlteracoesAssinante;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvButton,
  JvCtrls, JvComponentBase, JvEnterTab, Vcl.Mask, JvExMask, JvToolEdit;

type
  TfrmRelatAlteracoesAssinante = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDataFim: TJvDateEdit;
    edtDataIni: TJvDateEdit;
    JvEnterAsTab: TJvEnterAsTab;
    btnOk: TJvImgBtn;
    btnCancelar: TJvImgBtn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function GetDataInicial: TDate;
    function GetDataFinal: TDate;
  public
    { Public declarations }
    property DataInicial: TDate read GetDataInicial;
    property DataFinal: TDate read GetDataFinal;
  end;

var
  frmRelatAlteracoesAssinante: TfrmRelatAlteracoesAssinante;

implementation

{$R *.dfm}

uses uPrincipal, uDadosGlobal;

procedure TfrmRelatAlteracoesAssinante.FormCreate(Sender: TObject);
begin
  edtDataFim.Date := dmDadosGlobal.GetDataHoraBanco;
  edtDataIni.Date := IncMonth(dmDadosGlobal.GetDataHoraBanco, -12);
end;

function TfrmRelatAlteracoesAssinante.GetDataFinal: TDate;
begin
  Result := edtDataFim.Date;
end;

function TfrmRelatAlteracoesAssinante.GetDataInicial: TDate;
begin
  Result := edtDataIni.Date;
end;

end.
