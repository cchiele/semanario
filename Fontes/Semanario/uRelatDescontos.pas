unit uRelatDescontos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvButton,
  JvCtrls, JvComponentBase, JvEnterTab, Vcl.Mask, JvExMask, JvToolEdit, uDadosRelat;

type
  TfrmRelatDescontos = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDataFim: TJvDateEdit;
    edtDataIni: TJvDateEdit;
    JvEnterAsTab: TJvEnterAsTab;
    btnOk: TJvImgBtn;
    Label2: TLabel;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatDescontos: TfrmRelatDescontos;

implementation

{$R *.dfm}

procedure TfrmRelatDescontos.btnOkClick(Sender: TObject);
var
  lModuloRelat: TdmDadosRelat;
begin
  lModuloRelat := TdmDadosRelat.Create(self);
  try
    lModuloRelat.ShowReportDescontos(edtDataIni.Date, edtDataFim.Date);
  finally
    FreeAndNil(lModuloRelat);
  end;
end;

end.
