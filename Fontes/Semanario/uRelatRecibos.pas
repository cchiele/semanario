unit uRelatRecibos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, JvExStdCtrls, JvButton,
  JvCtrls, Vcl.ExtCtrls, System.DateUtils, Vcl.Mask, JvExMask, JvToolEdit,
  JvComponentBase, JvEnterTab, Vcl.Grids, Vcl.DBGrids, Data.DB;

type
  TfrmRelatRecibos = class(TForm)
    btnOkAssinante: TJvImgBtn;
    rgTipoRelat: TRadioGroup;
    gbPeriodo: TGroupBox;
    Label1: TLabel;
    edtDataFim: TJvDateEdit;
    edtDataIni: TJvDateEdit;
    JvEnterAsTab: TJvEnterAsTab;
    rgAssinatura: TRadioGroup;
    gbLotes: TGroupBox;
    DBGrid1: TDBGrid;
    dsLote: TDataSource;
    procedure btnOkAssinanteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure rgAssinaturaClick(Sender: TObject);
  private
    { Private declarations }
    procedure ControlarCamposTela;
  public
    { Public declarations }
  end;

var
  frmRelatRecibos: TfrmRelatRecibos;

implementation

{$R *.dfm}

uses uDadosRelat, uDadosGlobal;

procedure TfrmRelatRecibos.btnOkAssinanteClick(Sender: TObject);
var
  Gaacod: Integer;
  Gaaanomes: TDateTime;
  Gaanromes: Integer;
begin
  Gaacod := 0;
  Gaaanomes := 0;
  Gaanromes := 0;

  if rgAssinatura.ItemIndex = 0 then
  begin
    // Verificar se tem alguma data selecionada e pega os dados
    DBGrid1.DataSource.DataSet.DisableControls;
    try
      DBGrid1.DataSource.DataSet.First;
      while not DBGrid1.DataSource.DataSet.Eof do
      begin
        if DBGrid1.DataSource.DataSet.FieldByName('CalcSelecionado').Value = true then
        begin
          Gaacod := DBGrid1.DataSource.DataSet.FieldByName('gaacod').AsInteger;
          Gaaanomes := DBGrid1.DataSource.DataSet.FieldByName('gaaanomes').AsDateTime;
          Gaanromes := DBGrid1.DataSource.DataSet.FieldByName('gaanromes').AsInteger;
          Break;
        end;
        DBGrid1.DataSource.DataSet.Next;
      end;
      DBGrid1.DataSource.DataSet.First;
    finally
      DBGrid1.DataSource.DataSet.EnableControls;
    end;

    if Gaacod = 0 then
      raise Exception.Create('Nenhum lote foi selecionado.');
  end;

  dmDadosRelat.ShowReportAssinaturasRenovar(rgTipoRelat.ItemIndex, edtDataIni.Date, edtDataFim.Date, rgAssinatura.ItemIndex, Gaacod, Gaaanomes, Gaanromes);
end;

procedure TfrmRelatRecibos.ControlarCamposTela;
begin
  if rgAssinatura.ItemIndex = 0 then
  begin
    // Por lote
    gbPeriodo.Visible := false;
    gbLotes.Visible := true;
  end
  else
  begin
    // Por período
    gbPeriodo.Visible := true;
    gbLotes.Visible := false;
    edtDataIni.SetFocus;
  end;
end;

procedure TfrmRelatRecibos.DBGrid1CellClick(Column: TColumn);
var
  RecNo: Integer;
begin
  RecNo := 0;

  if Column.FieldName = 'CalcSelecionado' then
  begin
    if DBGrid1.DataSource.DataSet.RecordCount > 0 then
    begin
      DBGrid1.DataSource.DataSet.edit;
      DBGrid1.DataSource.DataSet.FieldByName('CalcSelecionado').Value := not DBGrid1.DataSource.DataSet.FieldByName('CalcSelecionado').AsBoolean;
      DBGrid1.DataSource.DataSet.Post;

      RecNo := DBGrid1.DataSource.DataSet.RecNo;
    end;

    DBGrid1.DataSource.DataSet.DisableControls;
    try
      // Desmarca todos outros que estávam marcados
      DBGrid1.DataSource.DataSet.First;

      while not DBGrid1.DataSource.DataSet.Eof do
      begin
        if RecNo <> DBGrid1.DataSource.DataSet.RecNo then
        begin
          DBGrid1.DataSource.DataSet.Edit;
          DBGrid1.DataSource.DataSet.FieldByName('CalcSelecionado').Value := false;
          DBGrid1.DataSource.DataSet.Post;
        end;

        DBGrid1.DataSource.DataSet.Next;
      end;

      // Reposiciona o cursor naquela linha que foi clicada.
      DBGrid1.DataSource.DataSet.First;

      while not DBGrid1.DataSource.DataSet.Eof do
      begin
        if RecNo = DBGrid1.DataSource.DataSet.RecNo then
          Break;

        DBGrid1.DataSource.DataSet.Next;
      end;
    finally
      DBGrid1.DataSource.DataSet.EnableControls;
    end;

  end;
end;

procedure TfrmRelatRecibos.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TfrmRelatRecibos.FormCreate(Sender: TObject);
begin
  dmDadosRelat.CarregarLotesRenovacaoAuto;
  ControlarCamposTela;
end;

procedure TfrmRelatRecibos.rgAssinaturaClick(Sender: TObject);
begin
  ControlarCamposTela;
end;

end.
