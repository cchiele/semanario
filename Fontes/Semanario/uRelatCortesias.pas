unit uRelatCortesias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvButton,
  JvCtrls, uDadosRelat, Vcl.ExtCtrls, JvExControls, JvInstallLabel;

type
  TfrmRelatCortesias = class(TForm)
    btnOk: TJvImgBtn;
    JvInstallLabel1: TJvInstallLabel;
    Bevel1: TBevel;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatCortesias: TfrmRelatCortesias;

implementation

{$R *.dfm}

procedure TfrmRelatCortesias.btnOkClick(Sender: TObject);
var
  lModuloRelat: TdmDadosRelat;
begin
  lModuloRelat := TdmDadosRelat.Create(self);
  try
    lModuloRelat.ShowReportCortesias;
  finally
    FreeAndNil(lModuloRelat);
  end;

end;

end.
