unit uRelatCondicoesPagto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvComponentBase, JvEnterTab, Data.DB,
  Vcl.StdCtrls, JvExStdCtrls, JvButton, JvCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.Mask, JvExMask, JvToolEdit, uDadosRelat,
  System.DateUtils;

type
  TfrmRelatCondicoesPagto = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDataFim: TJvDateEdit;
    edtDataIni: TJvDateEdit;
    GroupBoxLista: TGroupBox;
    dbgGrid: TDBGrid;
    Panel1: TPanel;
    btnMarcarDesmarcar: TBitBtn;
    btnOkAssinante: TJvImgBtn;
    DataSource: TDataSource;
    JvEnterAsTab: TJvEnterAsTab;
    procedure btnMarcarDesmarcarClick(Sender: TObject);
    procedure dbgGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgGridCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOkAssinanteClick(Sender: TObject);
  private
    { Private declarations }
    FModuloRelat: TdmDadosRelat;
  public
    { Public declarations }
  end;

var
  frmRelatCondicoesPagto: TfrmRelatCondicoesPagto;

implementation

{$R *.dfm}

procedure TfrmRelatCondicoesPagto.btnMarcarDesmarcarClick(Sender: TObject);
begin
  if btnMarcarDesmarcar.Tag = 0 then
  begin
    FModuloRelat.MarcarDesmarcarCobradores(true);
    btnMarcarDesmarcar.Tag := 1;
  end
  else
  begin
    FModuloRelat.MarcarDesmarcarCobradores(false);
    btnMarcarDesmarcar.Tag := 0;
  end;
end;

procedure TfrmRelatCondicoesPagto.btnOkAssinanteClick(Sender: TObject);
begin
  FModuloRelat.ShowReportCondicoesPagto(edtDataIni.Date, edtDataFim.Date);
end;

procedure TfrmRelatCondicoesPagto.dbgGridCellClick(Column: TColumn);
begin
  if Column.FieldName = 'CalcSelecionado' then
  begin
    if dbgGrid.DataSource.DataSet.RecordCount > 0 then
    begin
      dbgGrid.DataSource.DataSet.edit;
      dbgGrid.DataSource.DataSet.FieldByName('CalcSelecionado').Value := not dbgGrid.DataSource.DataSet.FieldByName('CalcSelecionado').AsBoolean;
      dbgGrid.DataSource.DataSet.Post;
    end;
  end;
end;

procedure TfrmRelatCondicoesPagto.dbgGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  IS_CHECK : Array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  Check : Integer;
  R     : TRect;
begin
  with dbgGrid do
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

procedure TfrmRelatCondicoesPagto.FormCreate(Sender: TObject);
begin
  FModuloRelat := TdmDadosRelat.Create(self);

  DataSource.DataSet := FModuloRelat.cdsCobradores;

  //dmDadosRelat.CarregarCobradores;
  FModuloRelat.CarregarCobradores;

  // Data de início e fim Defaults
  edtDataIni.Date := EncodeDate(YearOf(now), MonthOf(now), 1);
  edtDataFim.Date := EncodeDate(YearOf(now), MonthOf(now), DayOf(EndOfTheMonth(now)));
end;

procedure TfrmRelatCondicoesPagto.FormDestroy(Sender: TObject);
begin
  if Assigned(FModuloRelat) then
    FreeAndNil(FModuloRelat);
end;

end.
