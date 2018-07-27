unit uRelatAssinantes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, JvComponentBase, JvEnterTab,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  JvExMask, JvToolEdit, JvExStdCtrls, JvButton, JvCtrls;

type
  TfrmRelatAssinantes = class(TForm)
    GroupBoxLista: TGroupBox;
    dbgGrid: TDBGrid;
    Panel1: TPanel;
    btnMarcarDesmarcar: TBitBtn;
    edtFiltro: TLabeledEdit;
    rgAgrupar: TRadioGroup;
    JvEnterAsTab: TJvEnterAsTab;
    DataSource: TDataSource;
    btnOkAssinante: TJvImgBtn;
    procedure btnMarcarDesmarcarClick(Sender: TObject);
    procedure edtFiltroChange(Sender: TObject);
    procedure dbgGridCellClick(Column: TColumn);
    procedure dbgGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rgAgruparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkAssinanteClick(Sender: TObject);
  private
    { Private declarations }
    procedure ControlaTela;
  public
    { Public declarations }
  end;

var
  frmRelatAssinantes: TfrmRelatAssinantes;

implementation

{$R *.dfm}

uses uDadosRelat;

procedure TfrmRelatAssinantes.btnMarcarDesmarcarClick(Sender: TObject);
begin
  case rgAgrupar.ItemIndex of
    0:  // Zonas
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
    1:  // Vendedore
    begin
      if btnMarcarDesmarcar.Tag = 0 then
      begin
        dmDadosRelat.MarcarDesmarcarVendedores(true);
        btnMarcarDesmarcar.Tag := 1;
      end
      else
      begin
        dmDadosRelat.MarcarDesmarcarVendedores(false);
        btnMarcarDesmarcar.Tag := 0;
      end;
    end;
    2:  // Grupo de vendedores
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
    3:  // Cobrador
    begin
      if btnMarcarDesmarcar.Tag = 0 then
      begin
        dmDadosRelat.MarcarDesmarcarCobradores(true);
        btnMarcarDesmarcar.Tag := 1;
      end
      else
      begin
        dmDadosRelat.MarcarDesmarcarCobradores(false);
        btnMarcarDesmarcar.Tag := 0;
      end;
    end;
  end;
end;

procedure TfrmRelatAssinantes.btnOkAssinanteClick(Sender: TObject);
begin
  dmDadosRelat.ShowReportAssinantes(rgAgrupar.ItemIndex);
end;

procedure TfrmRelatAssinantes.ControlaTela;
begin
  btnMarcarDesmarcar.Tag := 0;
  edtFiltro.Text := '';

  case rgAgrupar.ItemIndex of
    0:  // Zonas
    begin
      GroupBoxLista.Caption := 'Selecione as zonas desejadas';

      dmDadosRelat.CarregarZonas;

      DataSource.DataSet := dmDadosRelat.cdsZonas;

      dbgGrid.Columns[1].FieldName := 'zoncod';
      dbgGrid.Columns[2].FieldName := 'zondescr';
    end;
    1:  // Vendedor
    begin
      GroupBoxLista.Caption := 'Selecione os vendedores desejados';

      dmDadosRelat.CarregarVendedores;

      DataSource.DataSet := dmDadosRelat.cdsVendedores;

      dbgGrid.Columns[1].FieldName := 'vencod';
      dbgGrid.Columns[2].FieldName := 'vennome';
    end;
    2:  // Grupo de vendedores
    begin
      GroupBoxLista.Caption := 'Selecione os grupos de vendedores desejados';

      dmDadosRelat.CarregarGruposVendedores;

      DataSource.DataSet := dmDadosRelat.cdsGruposVendedores;

      dbgGrid.Columns[1].FieldName := 'gdvcod';
      dbgGrid.Columns[2].FieldName := 'gdvdescr';
    end;
    3:  // Cobrador
    begin
      GroupBoxLista.Caption := 'Selecione os cobradores desejados';

      dmDadosRelat.CarregarCobradores;

      DataSource.DataSet := dmDadosRelat.cdsCobradores;

      dbgGrid.Columns[1].FieldName := 'cobcod';
      dbgGrid.Columns[2].FieldName := 'cobnome';
    end;
  end;
end;

procedure TfrmRelatAssinantes.dbgGridCellClick(Column: TColumn);
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

procedure TfrmRelatAssinantes.dbgGridDrawColumnCell(Sender: TObject;
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

procedure TfrmRelatAssinantes.edtFiltroChange(Sender: TObject);
var
  Filter: String;
begin
  if rgAgrupar.ItemIndex = 0 then // zona
    Filter :=
      '(' + dbgGrid.Columns[2].FieldName + ' like ''%' + edtFiltro.Text + '%''' + ' or ' +
      dbgGrid.Columns[1].FieldName + ' like ''%' + edtFiltro.Text + '%'')'
  else
    Filter := dbgGrid.Columns[2].FieldName + ' like ''%' + edtFiltro.Text + '%''';

  DataSource.DataSet.Filtered := false;
  DataSource.DataSet.Filter := Filter;
  DataSource.DataSet.Filtered := True;
end;

procedure TfrmRelatAssinantes.FormCreate(Sender: TObject);
begin
  ControlaTela;
end;

procedure TfrmRelatAssinantes.rgAgruparClick(Sender: TObject);
begin
  ControlaTela;
end;

end.
