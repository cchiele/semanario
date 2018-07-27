unit uRelatAltCad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvComponentBase, JvEnterTab,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, JvExMask, JvToolEdit, JvExStdCtrls,
  JvCombobox, JvDBSearchComboBox, Data.DB, JvButton, JvCtrls;

type
  TfrmRelatAltCad = class(TForm)
    JvEnterAsTab: TJvEnterAsTab;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDataFim: TJvDateEdit;
    edtDataIni: TJvDateEdit;
    dsListaUsuarios: TDataSource;
    GroupBox2: TGroupBox;
    chkUsuario: TJvDBSearchComboBox;
    btnOk: TJvImgBtn;
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatAltCad: TfrmRelatAltCad;

implementation

{$R *.dfm}

uses uDadosRelat, uUsuario, uPrincipal, uDadosGlobal;

procedure TfrmRelatAltCad.btnOkClick(Sender: TObject);
begin
  dmDadosRelat.ShowReportAlteracaoCadastro(chkUsuario.DataSource.DataSet.FieldByName('usucod').AsInteger, edtDataIni.Date, edtDataFim.Date);
end;

procedure TfrmRelatAltCad.FormCreate(Sender: TObject);
begin
  dmDadosRelat.CarregarUsuarios(dmUsuario.cdsUsuariousucod.Value, false);

  edtDataFim.Date := dmDadosGlobal.GetDataHoraBanco;
  edtDataIni.Date := IncMonth(dmDadosGlobal.GetDataHoraBanco, -12);
end;

procedure TfrmRelatAltCad.FormShow(Sender: TObject);
begin
  edtDataIni.SetFocus;
end;

end.
