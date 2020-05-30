unit uLocalizarCep;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDadosGlobal, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, JvExStdCtrls, JvButton, JvCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Datasnap.DBClient, System.JSON, IPPeerClient, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, uPrincipal, JvComponentBase,
  JvEnterTab, uMensagem, REST.Types;

type
  TfrmLocalizarCep = class(TForm)
    GroupBox1: TGroupBox;
    DBLCBUf: TDBLookupComboBox;
    edtCidade: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    Label1: TLabel;
    btnPesquisarCep: TJvImgBtn;
    GroupBox2: TGroupBox;
    Panel1: TPanel;
    btnCancelar: TJvImgBtn;
    btnSelecionar: TJvImgBtn;
    DBGridCeps: TDBGrid;
    cdsResultado: TClientDataSet;
    cdsResultadocep: TStringField;
    cdsResultadologradouro: TStringField;
    cdsResultadocomplemento: TStringField;
    cdsResultadobairro: TStringField;
    cdsResultadolocalidade: TStringField;
    cdsResultadouf: TStringField;
    dsResultado: TDataSource;
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    JvEnterAsTab: TJvEnterAsTab;
    TimerInicio: TTimer;
    LinkLabel1: TLinkLabel;
    BalloonHint1: TBalloonHint;
    lblAjuda: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnPesquisarCepClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TimerInicioTimer(Sender: TObject);
    procedure DBGridCepsDblClick(Sender: TObject);
    procedure DBGridCepsKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridCepsEnter(Sender: TObject);
    procedure DBGridCepsExit(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lblAjudaClick(Sender: TObject);
  private
    { Private declarations }
    FdmDadosGlobal: TdmDadosGlobal;

    procedure SetCidade(const Value: String);
    procedure SetEndereco(const Value: String);
    procedure SetUF(const Value: String);

    function GetUF: String;
    function GetCidade: String;
    function GetCEP: String;
  public
    { Public declarations }
    property UF: String read GetUF write SetUF;
    property Cidade: String read GetCidade write SetCidade;
    property Endereco: String write SetEndereco;
    property CepSelecionado: String read GetCEP;
  end;

var
  frmLocalizarCep: TfrmLocalizarCep;

implementation

{$R *.dfm}

procedure TfrmLocalizarCep.btnPesquisarCepClick(Sender: TObject);
var
  URLResource: String;
  JSONArray: TJSONArray;
  JSONValue: TJSONValue;
  Jso : TJSONObject;
  I: Integer;
begin
  if DBLCBUf.Text = EmptyStr then
  begin
    messagedlg('O campo estado deve ser preenchido', mtWarning, [mbOK], 0);
    DBLCBUf.SetFocus;
    exit;
  end;

  if trim(edtCidade.Text) = EmptyStr then
  begin
    messagedlg('O campo cidade deve ser preenchido', mtWarning, [mbOK], 0);
    edtCidade.SetFocus;
    exit;
  end;

  if trim(edtEndereco.Text) = EmptyStr then
  begin
    messagedlg('O campo endereço deve ser preenchido', mtWarning, [mbOK], 0);
    edtEndereco.SetFocus;
    exit;
  end;

  // ---------------------------------------------------------------------------

  TfrmMensagem.MostrarMesagem('Aguarde, consultado endereço...');
  try
    cdsResultado.Close;
    cdsResultado.CreateDataSet;
    cdsResultado.Open;

    // https://viacep.com.br/ws/RS/carlos barbosa/Rua 25 de setembro/json
    URLResource := 'ws/' + DBLCBUf.KeyValue + '/' + edtCidade.Text + '/' + edtEndereco.Text + '/json/';

    RESTRequest.Resource := URLResource;

    try
      RESTRequest.Execute;
    except
      on E:Exception do
      begin
        messagedlg('Erro na execução da consulta' + sLineBreak + 'Error: ' + e.Message, mtError, [mbOK], 0);
        exit;
      end;
    end;

    if RESTResponse.StatusCode <> 200 then
    begin
      // diferente de 200 é porque deu algum problema na consulta
      messagedlg('Erro no retorno do site ViaCEP' + sLineBreak + 'Error: ' + IntToStr(RESTResponse.StatusCode) + ' - ' + RESTResponse.StatusText, mtError, [mbOK], 0);
      exit;
    end;

    {Memo1.Lines.Add(RESTResponse1.Content);
    Memo1.Lines.Add('-------');
    Memo1.Lines.Add(IntToStr( RESTResponse1.ContentLength));
    Memo1.Lines.Add('-------');
    Memo1.Lines.Add( RESTResponse1.ContentType);
    Memo1.Lines.Add('-------');
    Memo1.Lines.Add( RESTResponse1.ContentEncoding);}

    // converte o retorno em um objeto JSON
    JSONValue := nil;
    try
      JSONValue := TJSONObject.ParseJSONValue(RESTResponse.JSONValue.ToString);

      // converte o objeto JSON em um array de JSON
      JSONArray := JSONValue as TJSONArray;
      //JSONArray := RESTResponse1.JSONValue as TJSONArray;

      for I := 0 to JSONArray.Count -1 do
      begin
        // converte um determinado elemento do array em objeto JSON
        JSO := JSONArray.Items[i] as TJSONObject;

        //ShowMessage( jso.GetValue('cep').Value);

        cdsResultado.AppendRecord([
          jso.GetValue('cep').Value,
          jso.GetValue('logradouro').Value,
          jso.GetValue('complemento').Value,
          jso.GetValue('bairro').Value,
          jso.GetValue('localidade').Value,
          jso.GetValue('uf').Value
          ]);
        //cdsResultado.IndexFieldNames := 'cep';
      end;
    finally
      // Aqui vai liberar tudo, o próprio JSONValue, o JSONArray e os objetos JSO criados.
      FreeAndNil(JSONValue);
    end;
  finally
    TfrmMensagem.MostrarMesagem;

    if cdsResultado.RecordCount > 0 then
    begin
      btnSelecionar.Enabled := true;
      cdsResultado.First;
      DBGridCeps.SetFocus;
    end
    else
    begin
      btnSelecionar.Enabled := false;
      edtEndereco.SetFocus;
      messagedlg('Nenhum CEP foi encontrado para o endereço informado.', mtWarning, [mbOK], 0);
    end;
  end;

end;

procedure TfrmLocalizarCep.DBGridCepsDblClick(Sender: TObject);
begin
  if not cdsResultado.Active then
    exit;

  if cdsResultado.RecordCount = 0 then
    exit;

  btnSelecionar.Click;
end;

procedure TfrmLocalizarCep.DBGridCepsEnter(Sender: TObject);
begin
  JvEnterAsTab.EnterAsTab := false;
end;

procedure TfrmLocalizarCep.DBGridCepsExit(Sender: TObject);
begin
  JvEnterAsTab.EnterAsTab := true;
end;

procedure TfrmLocalizarCep.DBGridCepsKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    DBGridCepsDblClick(sender);
    Key := #0;
  end;
end;

procedure TfrmLocalizarCep.FormCreate(Sender: TObject);
begin
  FdmDadosGlobal := TdmDadosGlobal.Create(self);

  DBLCBUf.ListSource := FdmDadosGlobal.dsUf;

  // Valores Defaults para os campos
  Self.UF := '';
  Self.Cidade := '';
end;

procedure TfrmLocalizarCep.FormDestroy(Sender: TObject);
begin
  if Assigned(FdmDadosGlobal) then
    FreeAndNil(FdmDadosGlobal);
end;

procedure TfrmLocalizarCep.FormShow(Sender: TObject);
begin
  edtEndereco.SetFocus;

  if (trim(DBLCBUf.Text) <> EmptyStr) and (trim(edtCidade.Text) <> EmptyStr) and (trim(edtEndereco.Text) <> EmptyStr) then
    TimerInicio.Enabled := true;
end;

function TfrmLocalizarCep.GetCEP: String;
begin
  Result := '';

  if not cdsResultado.Active then
    exit;

  if cdsResultado.RecordCount = 0 then
    exit;

  Result := cdsResultadocep.Value;
end;

function TfrmLocalizarCep.GetCidade: String;
begin
  Result := '';

  if not cdsResultado.Active then
    exit;

  if cdsResultado.RecordCount = 0 then
    exit;

  Result := AnsiUpperCase(cdsResultadolocalidade.Value);
end;

function TfrmLocalizarCep.GetUF: String;
begin
  Result := '';

  if not cdsResultado.Active then
    exit;

  if cdsResultado.RecordCount = 0 then
    exit;

  Result := AnsiUpperCase(cdsResultadouf.Value);
end;

procedure TfrmLocalizarCep.lblAjudaClick(Sender: TObject);
begin
  BalloonHint1.Title := 'Dicas para melhorar a pesquisa';
  BalloonHint1.Description :=
    '1) Não é necessário preencher o endereço completo;' + sLineBreak +
    //sLineBreak +
    '2) O endereço pode ou não ser acentuado;' + sLineBreak +
    //sLineBreak +
    '3) Não informe no endereço o número da casa, apto, etc;' + sLineBreak +
    //sLineBreak +
    '4) Nomes de ruas com números, devemos substituir o número pelo extenso,' + sLineBreak +
    'exemplo: RUA 13 DE MAIO -> RUA TREZE DE MAIO;' + sLineBreak +
    //sLineBreak +
    '5) Substituir abreviaturas, conforme abaixo:' + sLineBreak +
    'DR. -> DOUTOR' + sLineBreak +
    'TV. -> TRAVESSA' + sLineBreak +
    'AV. -> AVENIDA' + sLineBreak +
    'GEN. -> GENERAL';
  BalloonHint1.HideAfter := 5000;
  BalloonHint1.ShowHint(lblAjuda);
end;

procedure TfrmLocalizarCep.SetCidade(const Value: String);
begin
  if Value = EmptyStr then
    edtCidade.Text := 'BENTO GONÇALVES'
  else
    edtCidade.Text := Value;
end;

procedure TfrmLocalizarCep.SetEndereco(const Value: String);
begin
  edtEndereco.Text := Value;
end;

procedure TfrmLocalizarCep.SetUF(const Value: String);
begin
  if Value = EmptyStr then
    DBLCBUf.KeyValue := 'RS'
  else
    DBLCBUf.KeyValue := Value;
end;

procedure TfrmLocalizarCep.TimerInicioTimer(Sender: TObject);
begin
  TimerInicio.Enabled := false;

  btnPesquisarCep.Click;
end;

end.
