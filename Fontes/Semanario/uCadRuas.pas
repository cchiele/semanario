unit uCadRuas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, JvExStdCtrls,
  JvCombobox, JvDBSearchComboBox, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, JvButton, JvCtrls, Vcl.Buttons, Vcl.ActnList,
  JvExControls, JvSpeedButton, System.Actions;

type
   TTela = (Consulta, Manutencao);

type
  TfrmCadRuas = class(TForm)
    pnlManutencao: TPanel;
    Panel2: TPanel;
    Label29: TLabel;
    btnOk: TJvImgBtn;
    btnCancelar: TJvImgBtn;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    dbedtCodigo: TDBEdit;
    pnlConsulta: TPanel;
    GroupBox2: TGroupBox;
    dbGrid: TDBGrid;
    GroupBox1: TGroupBox;
    edtRua: TLabeledEdit;
    btnFiltrar: TJvImgBtn;
    Panel1: TPanel;
    btnNovo: TJvImgBtn;
    btnEditar: TJvImgBtn;
    btnExcluir: TJvImgBtn;
    dsTblrdz: TDataSource;
    TimerInicio: TTimer;
    Label3: TLabel;
    dbedtRua: TDBEdit;
    Label8: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    ActionList: TActionList;
    ActionAtualizarFiltroZonas: TAction;
    ActionNovo: TAction;
    ActionEditar: TAction;
    ActionExcluir: TAction;
    ActionFiltrar: TAction;
    SpeedButton1: TSpeedButton;
    ActionOk: TAction;
    ActionCancelar: TAction;
    ActionAtualizaCampoZonas: TAction;
    edtCodigoZona: TLabeledEdit;
    edtDescrZona: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TimerInicioTimer(Sender: TObject);
    procedure ActionNovoExecute(Sender: TObject);
    procedure ActionEditarExecute(Sender: TObject);
    procedure ActionExcluirExecute(Sender: TObject);
    procedure ActionFiltrarExecute(Sender: TObject);
    procedure ActionOkExecute(Sender: TObject);
    procedure ActionCancelarExecute(Sender: TObject);
    procedure ActionAtualizaCampoZonasExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ControlarTela(ATela: TTela);

  public
    { Public declarations }
  end;

var
  frmCadRuas: TfrmCadRuas;

implementation

{$R *.dfm}

uses uDadosZonasRuas, uPrincipal, uAlterarSenha, uUsuario, uDadosGlobal;

{ TfrmCadRuas }

procedure TfrmCadRuas.ActionAtualizaCampoZonasExecute(Sender: TObject);
begin
  dmDadosZonasRuas.cdsLookupZonas.Refresh;
  dmDadosZonasRuas.cdsLookupZonas.First;
  DBLookupComboBox1.KeyValue := dmDadosZonasRuas.cdsLookupZonaszoncod.AsString;
end;

procedure TfrmCadRuas.ActionCancelarExecute(Sender: TObject);
begin
  dmDadosZonasRuas.CalcelarManutencaoRua;
  ControlarTela(Consulta);
end;

procedure TfrmCadRuas.ActionEditarExecute(Sender: TObject);
begin
  dmDadosZonasRuas.EditarRua;
  ControlarTela(Manutencao);
end;

procedure TfrmCadRuas.ActionExcluirExecute(Sender: TObject);
begin
  try
    dmDadosZonasRuas.ExcluirRua;
  except
    on E: Exception do
    begin
      MessageDlg(e.Message, mtError,[mbOK],0);
      ActionFiltrar.Execute;
    end;
  end;
end;

procedure TfrmCadRuas.ActionFiltrarExecute(Sender: TObject);
begin
  dmDadosZonasRuas.FiltrarRuas(0, edtRua.Text, edtCodigoZona.Text, edtDescrZona.Text);
end;

procedure TfrmCadRuas.ActionNovoExecute(Sender: TObject);
begin
  dmDadosZonasRuas.AdicionarRua;
  ControlarTela(Manutencao);
end;

procedure TfrmCadRuas.ActionOkExecute(Sender: TObject);
begin
  dmDadosZonasRuas.SalvarRua;

  ControlarTela(Consulta);

  ActionFiltrar.Execute;
end;

procedure TfrmCadRuas.ControlarTela(ATela: TTela);
begin
  if ATela = Consulta then
  begin
    // Muda para a tela de Consulta
    pnlConsulta.Visible := true;
    pnlManutencao.Visible := false;

    edtRua.SetFocus;
  end
  else
  begin
    // Muda para a tela de Manutenção
    pnlConsulta.Visible := false;
    pnlManutencao.Visible := true;

    dbedtRua.SetFocus;
  end;
end;

procedure TfrmCadRuas.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  dmDadosZonasRuas.CalcelarManutencaoRua;
end;

procedure TfrmCadRuas.FormShow(Sender: TObject);
begin
  TimerInicio.Enabled := true;
end;

procedure TfrmCadRuas.TimerInicioTimer(Sender: TObject);
begin
  TimerInicio.Enabled := false;

  //dmDadosZonasRuas.CarregarFiltroZonas;

  ControlarTela(Consulta);

  dmUsuario.ValidarPermissaoActionList(ActionList);

  ActionFiltrar.Execute;

  edtRua.SetFocus;
end;

end.
