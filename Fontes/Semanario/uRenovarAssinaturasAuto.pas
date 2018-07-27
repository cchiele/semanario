unit uRenovarAssinaturasAuto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.DateUtils, system.UITypes,
  JvExStdCtrls, JvButton, JvCtrls, JvExControls, JvInstallLabel, Vcl.ExtCtrls,
  Vcl.Samples.Spin, JvComponentBase, JvEnterTab, JvCombobox, JvDBSearchComboBox,
  Data.DB;

type
  TfrmRenovarAssinaturasAuto = class(TForm)
    btnOkAssinante: TJvImgBtn;
    btnCancelarAssinante: TJvImgBtn;
    GroupBox1: TGroupBox;
    cbxMeses: TComboBox;
    cbxAno: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Bevel1: TBevel;
    JvInstallLabel1: TJvInstallLabel;
    GroupBox2: TGroupBox;
    edtValor: TEdit;
    Label4: TLabel;
    edtNroMeses: TSpinEdit;
    Label5: TLabel;
    JvEnterAsTab: TJvEnterAsTab;
    Label6: TLabel;
    chkVendedor: TJvDBSearchComboBox;
    dsVendedores: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnOkAssinanteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRenovarAssinaturasAuto: TfrmRenovarAssinaturasAuto;

implementation

{$R *.dfm}

uses uDadosAssinantes, uDadosGlobal, uCadAssinantes, uPrincipal, uDadosRelat,
  uDadosVendedores, uRelatRecibos;

procedure TfrmRenovarAssinaturasAuto.btnOkAssinanteClick(Sender: TObject);
begin
  ModalResult := mrNone;

  if MessageDlg('Deseja realmente realizar a renovação automática?', mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    exit;

  try
    dmDadosAssinantes.RenovarAssinaturasAutomaticamente(cbxMeses.ItemIndex + 1, StrToInt(cbxAno.Items[cbxAno.ItemIndex]), StrToFloat(edtValor.Text), edtNroMeses.Value, chkVendedor.DataSource.DataSet.FieldByName('vencod').AsInteger, chkVendedor.DataSource.DataSet.FieldByName('vennome').AsString);

    ModalResult := mrOk;
  except
    on E: Exception do
      raise Exception.Create(e.Message);
  end;
end;

procedure TfrmRenovarAssinaturasAuto.FormCreate(Sender: TObject);
var
  I: Integer;
  DataUltRenovacao: TDate;
  Index: Integer;
begin
  // Carrega o Combobox dos vendedores
  dmDadosVendedores.CarregarListaVendedores;

  // Fecha o formulário de cadastro de Assinantes
  Index := frmPrincipal.ObterIndexFormulario(TfrmCadAssinantes);
  if Index > -1 then
    frmPrincipal.FecharPagina(frmPrincipal.JvPageList.Pages[Index]);

  // Fecha o formulário de relatório de recibos
  Index := frmPrincipal.ObterIndexFormulario(TfrmRelatRecibos);
  if Index > -1 then
    frmPrincipal.FecharPagina(frmPrincipal.JvPageList.Pages[Index]);

  // ---------------------------------------------------------------------------

  DataUltRenovacao := dmDadosAssinantes.RetornaDataUltimaRenovacaoAuto;
  DataUltRenovacao := IncMonth(DataUltRenovacao);

  cbxAno.Clear;

  for I := low(dmDadosRelat.Year) to high(dmDadosRelat.Year) do
  begin
    cbxAno.Items.Add(IntToStr(dmDadosRelat.Year[I]));

    // Seleciona o ano corrente
    if YearOf(DataUltRenovacao) = dmDadosRelat.Year[I] then
      cbxAno.ItemIndex := (cbxAno.Items.Count-1);
  end;

  // ---------------------------------------------------------------------------

  // Seleciona o mês corrente
  cbxMeses.ItemIndex := MonthOf(DataUltRenovacao) - 1;

end;

end.
