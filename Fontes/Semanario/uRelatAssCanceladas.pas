unit uRelatAssCanceladas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvButton,
  JvCtrls, JvComponentBase, JvEnterTab, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, JvExMask, JvToolEdit, Data.DB, Vcl.ExtCtrls;

type
  TfrmRelatAssCanceladas = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDataFim: TJvDateEdit;
    edtDataIni: TJvDateEdit;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    JvEnterAsTab: TJvEnterAsTab;
    btnOkAssinante: TJvImgBtn;
    dsZonas: TDataSource;
    Panel1: TPanel;
    btnMarcarDesmarcar: TBitBtn;
    edtFiltro: TLabeledEdit;
    procedure btnOkAssinanteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnMarcarDesmarcarClick(Sender: TObject);
    procedure edtFiltroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatAssCanceladas: TfrmRelatAssCanceladas;

implementation

{$R *.dfm}

uses uDadosRelat;

procedure TfrmRelatAssCanceladas.btnMarcarDesmarcarClick(Sender: TObject);
begin
  if btnMarcarDesmarcar.Tag = 0 then
  begin
    dmDadosRelat.MarcarDesmarcarZonas(true);
    btnMarcarDesmarcar.Tag := 1;
  end
  else
  begin
    dmDadosRelat.MarcarDesmarcarZonas(false);
    btnMarcarDesmarcar.Tag := 0;
  end;
end;

procedure TfrmRelatAssCanceladas.btnOkAssinanteClick(Sender: TObject);
begin
  dmDadosRelat.ShowReportAssinaturasCanceladas(edtDataIni.Date, edtDataFim.Date);
end;

procedure TfrmRelatAssCanceladas.DBGrid1CellClick(Column: TColumn);
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

procedure TfrmRelatAssCanceladas.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmRelatAssCanceladas.edtFiltroChange(Sender: TObject);
var
  Filter: String;
begin
  Filter :=
    '(' + DBGrid1.Columns[2].FieldName + ' like ''%' + edtFiltro.Text + '%''' + ' or ' +
    DBGrid1.Columns[1].FieldName + ' like ''%' + edtFiltro.Text + '%'')';

  dsZonas.DataSet.Filtered := false;
  dsZonas.DataSet.Filter := Filter;
  dsZonas.DataSet.Filtered := True;
end;

procedure TfrmRelatAssCanceladas.FormCreate(Sender: TObject);
begin
  dmDadosRelat.CarregarZonas;
end;

end.
