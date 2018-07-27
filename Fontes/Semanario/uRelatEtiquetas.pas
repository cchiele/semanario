unit uRelatEtiquetas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, JvComponentBase, JvEnterTab,
  Vcl.StdCtrls, JvExStdCtrls, JvButton, JvCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids;

type
  TfrmRelatEtiquetas = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnMarcarDesmarcar: TBitBtn;
    edtFiltro: TLabeledEdit;
    btnOkAssinante: TJvImgBtn;
    JvEnterAsTab: TJvEnterAsTab;
    dsZonas: TDataSource;
    chkImprimirEtiquetas: TCheckBox;
    rgTipoImpressora: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure btnOkAssinanteClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnMarcarDesmarcarClick(Sender: TObject);
    procedure edtFiltroChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatEtiquetas: TfrmRelatEtiquetas;

implementation

{$R *.dfm}

uses uDadosRelat;

procedure TfrmRelatEtiquetas.btnMarcarDesmarcarClick(Sender: TObject);
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

procedure TfrmRelatEtiquetas.btnOkAssinanteClick(Sender: TObject);
begin
  dmDadosRelat.ShowReportEtiquetas(rgTipoImpressora.ItemIndex, chkImprimirEtiquetas.Checked, true);
end;

procedure TfrmRelatEtiquetas.DBGrid1CellClick(Column: TColumn);
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

procedure TfrmRelatEtiquetas.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmRelatEtiquetas.edtFiltroChange(Sender: TObject);
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

procedure TfrmRelatEtiquetas.FormCreate(Sender: TObject);
begin
  dmDadosRelat.CarregarZonas;
end;

end.
