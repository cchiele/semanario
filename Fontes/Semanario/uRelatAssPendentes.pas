unit uRelatAssPendentes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvButton,
  JvCtrls, JvComponentBase, JvEnterTab, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, JvExMask, JvToolEdit, Vcl.ExtCtrls, Data.DB, uDadosRelat;

type
  TfrmRelatAssPendentes = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDataFim: TJvDateEdit;
    edtDataIni: TJvDateEdit;
    GroupBoxLista: TGroupBox;
    dbgGrid: TDBGrid;
    JvEnterAsTab: TJvEnterAsTab;
    btnOkAssinante: TJvImgBtn;
    rgAgrupar: TRadioGroup;
    DataSource: TDataSource;
    Panel1: TPanel;
    btnMarcarDesmarcar: TBitBtn;
    edtFiltro: TLabeledEdit;
    GroupBox2: TGroupBox;
    dbgZonas: TDBGrid;
    Panel2: TPanel;
    btnMarcarDesmarcarZonas: TBitBtn;
    edtFiltroZonas: TLabeledEdit;
    dsZonas: TDataSource;
    procedure btnOkAssinanteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgGridCellClick(Column: TColumn);
    procedure btnMarcarDesmarcarClick(Sender: TObject);
    procedure rgAgruparClick(Sender: TObject);
    procedure edtFiltroChange(Sender: TObject);
    procedure dbgZonasCellClick(Column: TColumn);
    procedure dbgZonasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnMarcarDesmarcarZonasClick(Sender: TObject);
    procedure edtFiltroZonasChange(Sender: TObject);
  private
    { Private declarations }
    FModuloRelat: TdmDadosRelat;

    procedure ControlaTela;
  public
    { Public declarations }
  end;

var
  frmRelatAssPendentes: TfrmRelatAssPendentes;

implementation

{$R *.dfm}

procedure TfrmRelatAssPendentes.btnMarcarDesmarcarClick(Sender: TObject);
begin
  case rgAgrupar.ItemIndex of
    0:  // Vendedore
    begin
      if btnMarcarDesmarcar.Tag = 0 then
      begin
        FModuloRelat.MarcarDesmarcarVendedores(true);
        btnMarcarDesmarcar.Tag := 1;
      end
      else
      begin
        FModuloRelat.MarcarDesmarcarVendedores(false);
        btnMarcarDesmarcar.Tag := 0;
      end;
    end;
    1:  // Grupo de vendedores
    begin
      if btnMarcarDesmarcar.Tag = 0 then
      begin
        FModuloRelat.MarcarDesmarcarGruposVendedores(true);
        btnMarcarDesmarcar.Tag := 1;
      end
      else
      begin
        FModuloRelat.MarcarDesmarcarGruposVendedores(false);
        btnMarcarDesmarcar.Tag := 0;
      end;
    end;
    2:  // Cobrador
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
  end;
end;

procedure TfrmRelatAssPendentes.btnMarcarDesmarcarZonasClick(Sender: TObject);
begin
  if btnMarcarDesmarcarZonas.Tag = 0 then
  begin
    FModuloRelat.MarcarDesmarcarZonas(true);
    btnMarcarDesmarcarZonas.Tag := 1;
  end
  else
  begin
    FModuloRelat.MarcarDesmarcarZonas(false);
    btnMarcarDesmarcarZonas.Tag := 0;
  end;
end;

procedure TfrmRelatAssPendentes.btnOkAssinanteClick(Sender: TObject);
begin
  FModuloRelat.ShowReportAssinaturasPendentes(rgAgrupar.ItemIndex, edtDataIni.Date, edtDataFim.Date);
end;

procedure TfrmRelatAssPendentes.ControlaTela;
begin
  btnMarcarDesmarcar.Tag := 0;
  edtFiltro.Text := '';

  case rgAgrupar.ItemIndex of
    0:  // Vendedor
    begin
      GroupBoxLista.Caption := 'Selecione os vendedores desejados';

      FModuloRelat.CarregarVendedores;

      DataSource.DataSet := FModuloRelat.cdsVendedores;

      dbgGrid.Columns[1].FieldName := 'vencod';
      dbgGrid.Columns[2].FieldName := 'vennome';
    end;
    1:  // Grupo de vendedores
    begin
      GroupBoxLista.Caption := 'Selecione os grupos de vendedores desejados';

      FModuloRelat.CarregarGruposVendedores;

      DataSource.DataSet := FModuloRelat.cdsGruposVendedores;

      dbgGrid.Columns[1].FieldName := 'gdvcod';
      dbgGrid.Columns[2].FieldName := 'gdvdescr';
    end;
    2:  // Cobrador
    begin
      GroupBoxLista.Caption := 'Selecione os cobradores desejados';

      FModuloRelat.CarregarCobradores;

      DataSource.DataSet := FModuloRelat.cdsCobradores;

      dbgGrid.Columns[1].FieldName := 'cobcod';
      dbgGrid.Columns[2].FieldName := 'cobnome';
    end;
  end;

end;

procedure TfrmRelatAssPendentes.dbgGridCellClick(Column: TColumn);
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

procedure TfrmRelatAssPendentes.dbgGridDrawColumnCell(Sender: TObject;
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

procedure TfrmRelatAssPendentes.dbgZonasCellClick(Column: TColumn);
begin
  if Column.FieldName = 'CalcSelecionado' then
  begin
    if dbgZonas.DataSource.DataSet.RecordCount > 0 then
    begin
      dbgZonas.DataSource.DataSet.edit;
      dbgZonas.DataSource.DataSet.FieldByName('CalcSelecionado').Value := not dbgZonas.DataSource.DataSet.FieldByName('CalcSelecionado').AsBoolean;
      dbgZonas.DataSource.DataSet.Post;
    end;
  end;
end;

procedure TfrmRelatAssPendentes.dbgZonasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
const
  IS_CHECK : Array[Boolean] of Integer = (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  Check : Integer;
  R     : TRect;
begin
  with dbgZonas do
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

procedure TfrmRelatAssPendentes.edtFiltroChange(Sender: TObject);
var
  Filter: String;
begin
  Filter := dbgGrid.Columns[2].FieldName + ' like ''%' + edtFiltro.Text + '%''';

  DataSource.DataSet.Filtered := false;
  DataSource.DataSet.Filter := Filter;
  DataSource.DataSet.Filtered := True;
end;

procedure TfrmRelatAssPendentes.edtFiltroZonasChange(Sender: TObject);
var
  Filter: String;
begin
  Filter := dbgZonas.Columns[2].FieldName + ' like ''%' + edtFiltroZonas.Text + '%''';

  dsZonas.DataSet.Filtered := false;
  dsZonas.DataSet.Filter := Filter;
  dsZonas.DataSet.Filtered := True;
end;

procedure TfrmRelatAssPendentes.FormCreate(Sender: TObject);
begin
  FModuloRelat := TdmDadosRelat.Create(self);

  DataSource.DataSet := FModuloRelat.cdsCobradores;
  dsZonas.DataSet := FModuloRelat.cdsZonas;

  FModuloRelat.CarregarZonas;
  FModuloRelat.MarcarDesmarcarZonas(true);

  ControlaTela;
end;

procedure TfrmRelatAssPendentes.rgAgruparClick(Sender: TObject);
begin
  ControlaTela;
end;

end.
