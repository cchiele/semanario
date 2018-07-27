unit uRelatBaixas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvButton,
  JvCtrls, frxExportCSV, frxExportRTF, frxClass, frxExportPDF, frxDBSet,
  Vcl.Mask, JvExMask, JvToolEdit, JvgListBox, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.CheckLst, Data.DB, JvDBUltimGrid, Vcl.Buttons,
  System.DateUtils, JvComponentBase, JvEnterTab;

type
  TfrmRelatBaixas = class(TForm)
    btnOkAssinante: TJvImgBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDataFim: TJvDateEdit;
    edtDataIni: TJvDateEdit;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    dsGruposVendedores: TDataSource;
    btnMarcarDesmarcar: TBitBtn;
    JvEnterAsTab: TJvEnterAsTab;
    procedure btnOkAssinanteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnMarcarDesmarcarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatBaixas: TfrmRelatBaixas;

implementation

{$R *.dfm}

uses uDadosRelat;

procedure TfrmRelatBaixas.btnMarcarDesmarcarClick(Sender: TObject);
begin
  if btnMarcarDesmarcar.Tag = 0 then
  begin
    dmDadosRelat.MarcarDesmarcarGruposVendedores(true);
    btnMarcarDesmarcar.Tag := 1;
  end
  else
  begin
    dmDadosRelat.MarcarDesmarcarGruposVendedores(false);
    btnMarcarDesmarcar.Tag := 0;
  end;
end;

procedure TfrmRelatBaixas.btnOkAssinanteClick(Sender: TObject);
begin
  dmDadosRelat.ShowReportBaixas(edtDataIni.Date, edtDataFim.Date);
end;

procedure TfrmRelatBaixas.DBGrid1CellClick(Column: TColumn);
begin
  if Column.FieldName = 'CalcSelecionado' then
  begin
    if DBGrid1.DataSource.DataSet.RecordCount > 0 then
    begin
      DBGrid1.DataSource.DataSet.edit;
      DBGrid1.DataSource.DataSet.FieldByName('CalcSelecionado').Value := not DBGrid1.DataSource.DataSet.FieldByName('CalcSelecionado').AsBoolean;
      DBGrid1.DataSource.DataSet.Post;
    end;
  end;
end;

procedure TfrmRelatBaixas.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  IS_CHECK : Array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  Check : Integer;
  R     : TRect;
begin
  with DBGrid1 do
  begin
    if Column.FieldName = 'CalcSelecionado' then
    begin
      Canvas.FillRect(Rect);
      Check := IS_CHECK[Column.Field.AsBoolean];
      R := Rect;
      InflateRect(R,-2,-2); //aqui manipula o tamanho do checkBox
      DrawFrameControl(Canvas.Handle,rect,DFC_BUTTON,Check)
    end;
  end;
end;

procedure TfrmRelatBaixas.FormCreate(Sender: TObject);
begin
  dmDadosRelat.CarregarGruposVendedores;

  // Data de início e fim Defaults
  edtDataIni.Date := EncodeDate(YearOf(now), MonthOf(now), 1);
  edtDataFim.Date := EncodeDate(YearOf(now), MonthOf(now), DayOf(EndOfTheMonth(now)));
end;

end.
