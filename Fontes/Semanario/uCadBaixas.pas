unit uCadBaixas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.UITypes,
  JvExStdCtrls, JvButton, JvCtrls, Vcl.Grids, Vcl.DBGrids, Data.DB, JvEdit,
  JvValidateEdit, Vcl.Mask, JvExMask, JvToolEdit, uDadosAssinantes, uDadosGlobal;

type
  TfrmCadBaixas = class(TForm)
    GroupBox1: TGroupBox;
    edtAssinante: TLabeledEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    dbGridAss: TDBGrid;
    btnBaixarValor: TJvImgBtn;
    TimerInicio: TTimer;
    dsBaixaRapida: TDataSource;
    edtDataBaixa: TJvDateEdit;
    edtValorBaixa: TJvValidateEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure TimerInicioTimer(Sender: TObject);
    procedure edtAssinanteChange(Sender: TObject);
    procedure btnBaixarValorClick(Sender: TObject);
    procedure edtAssinanteKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAssinanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FDadosAssinantes: TdmDadosAssinantes;

    procedure ControlaTela;
    procedure RealizarNovaBaixa;
  public
    { Public declarations }
  end;

var
  frmCadBaixas: TfrmCadBaixas;

implementation

{$R *.dfm}

procedure TfrmCadBaixas.btnBaixarValorClick(Sender: TObject);
begin
  try
    FDadosAssinantes.AdicionarBaixa(FDadosAssinantes.cdsBaixaRapidaasscod.AsInteger, FDadosAssinantes.cdsBaixaRapidaadacod.AsInteger, edtDataBaixa.Date, edtValorBaixa.AsFloat);

    RealizarNovaBaixa;
  except
    on E: Exception do
    begin
      MessageDlg(e.Message, TMsgDlgType.mtError, [TMsgDlgBtn.mbOK], 0);
      edtValorBaixa.SetFocus;
    end;
  end;
end;

procedure TfrmCadBaixas.ControlaTela;
begin
  btnBaixarValor.Enabled := false;

  if FDadosAssinantes.cdsBaixaRapida.Active then
    if FDadosAssinantes.cdsBaixaRapida.RecordCount > 0 then
      btnBaixarValor.Enabled := true;
end;

procedure TfrmCadBaixas.edtAssinanteChange(Sender: TObject);
begin
  FDadosAssinantes.FiltrarAssinantesBaixaRapida(edtAssinante.Text);

  ControlaTela;
end;

procedure TfrmCadBaixas.edtAssinanteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_up then
    key := 0;
  if key = vk_Down then
    key := 0;
end;

procedure TfrmCadBaixas.edtAssinanteKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if dbGridAss.DataSource.DataSet.Active then
  begin
    if key = VK_UP then
      dbGridAss.DataSource.DataSet.Prior
    else if key = VK_DOWN then
      dbGridAss.DataSource.DataSet.Next;
  end;
end;

procedure TfrmCadBaixas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FDadosAssinantes) then
    FreeAndNil(FDadosAssinantes);
end;

procedure TfrmCadBaixas.FormCreate(Sender: TObject);
begin
  FDadosAssinantes := TdmDadosAssinantes.Create(self);

  dsBaixaRapida.DataSet := FDadosAssinantes.cdsBaixaRapida;

  TimerInicio.Enabled := true;
end;

procedure TfrmCadBaixas.RealizarNovaBaixa;
begin
  edtAssinante.Text := '';
  edtDataBaixa.Date := dmDadosGlobal.GetDataHoraBanco;
  edtValorBaixa.AsFloat := 0;

  FDadosAssinantes.FiltrarAssinantesBaixaRapida;

  ControlaTela;

  edtAssinante.SetFocus;
end;

procedure TfrmCadBaixas.TimerInicioTimer(Sender: TObject);
begin
  TimerInicio.Enabled := false;

  RealizarNovaBaixa;
end;

end.
