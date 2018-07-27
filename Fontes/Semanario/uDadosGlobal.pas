unit uDadosGlobal;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient, ACBrBase,
  ACBrValidador, Vcl.Dialogs, Data.FMTBcd, Data.SqlExpr, Vcl.Controls,
  Winapi.Windows, Vcl.Forms, Datasnap.Provider, ACBrExtenso, System.UITypes;

type
  TdmDadosGlobal = class(TDataModule)
    cdsUf: TClientDataSet;
    cdsUfufdescr: TStringField;
    cdsUfuf: TStringField;
    dsUf: TDataSource;
    ACBrValidador: TACBrValidador;
    cdsStatusAssinante: TClientDataSet;
    cdsStatusAssinanteCodigo: TIntegerField;
    cdsStatusAssinanteDescr: TStringField;
    sqlTblsen: TSQLDataSet;
    sqlTblsensensenha: TStringField;
    cdsLookupSimNao: TClientDataSet;
    cdsLookupSimNaoCodigo: TStringField;
    cdsLookupSimNaoDescr: TStringField;
    cdsStatusAssinante2: TClientDataSet;
    cdsStatusAssinante2Codigo: TIntegerField;
    cdsStatusAssinante2Descr: TStringField;
    sqlDataHoraBanco: TSQLDataSet;
    sqlDataHoraBancodatahora: TSQLTimeStampField;
    ACBrExtenso: TACBrExtenso;
    cdsLookupSimNao2: TClientDataSet;
    cdsLookupSimNao2Descr: TStringField;
    cdsLookupSimNao2Codigo: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dspLookupZonasUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidarEmail(AEmail: string): Boolean;
    function ValidarCNPJ(ACNPJ: String): Boolean;
    function ValidarCPF(ACPF: String): Boolean;
    function ValidarCEP(ACEP: String): Boolean;
    function GetDataHoraBanco: TDateTime;
    function GetMesPorExtenso(AMes: Integer): String;
    function ConvertePrimeiraLetraMaiuscula(AStr: String): String;
    function FormataEndereco(AEndereco: String = ''; ANro: String = ''; AComplemento: String = ''): String;
    function ValorPorExtenso(AValor: Double): String;
    function PadL(const S: string; const ComprimentoFinal: integer; const Complemento: string): string;
    function PadR(const S: string; const ComprimentoFinal: integer; const Complemento: string = ' '): string;
    function GetSoNumeros(const Str: String; const ReturnIfNull: String = ''): String;
    function GetSoLetras(const Str: String; const ReturnIfNull: String = ''): String;
    function GetPrimeirosNumeroComplementoEndereco(const Str: String; const ReturnIfNull: String = ''): String;
    function FormatDateTimeToString(const Format: string; DateTime: TDateTime): String;
    function GetDescricaoSimNao(Aindicador: String): String;
  end;

var
  dmDadosGlobal: TdmDadosGlobal;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses uConexao;

{$R *.dfm}

function TdmDadosGlobal.PadL(const S: string; const ComprimentoFinal: integer;
  const Complemento: string): string;
var
Texto: string;
begin
  Texto := S;
  while Length(Texto) < ComprimentoFinal do
    Texto := Texto + Complemento;
  Result := Copy(Texto, 1, ComprimentoFinal);
end;

function TdmDadosGlobal.PadR(const S: string; const ComprimentoFinal: integer;
  const Complemento: string = ' '): string;
var
Texto: string;
begin
  Texto := S;
  while Length(Texto) < ComprimentoFinal do
    Texto := Complemento + Texto;
  Result := Copy(Texto, 1, ComprimentoFinal);
end;

function TdmDadosGlobal.ConvertePrimeiraLetraMaiuscula(AStr: String): String;
var
  i: integer;
  esp: boolean;
begin
  AStr := LowerCase(Trim(AStr));
  for i := 1 to Length(AStr) do
  begin
    if i = 1 then
      AStr[i] := UpCase(AStr[i])
    else
      begin
        if i <> Length(AStr) then
        begin
          esp := (AStr[i] = ' ');
          if esp then
            AStr[i+1] := UpCase(AStr[i+1]);
        end;
      end;
  end;
  Result := AStr;
end;

procedure TdmDadosGlobal.DataModuleCreate(Sender: TObject);
begin
  cdsUf.Close;
  cdsUf.CreateDataSet;
  cdsUf.Open;

  cdsUf.AppendRecord(['AC', 'Acre']);
  cdsUf.AppendRecord(['AL', 'Alagoas']);
  cdsUf.AppendRecord(['AP', 'Amapá']);
  cdsUf.AppendRecord(['AM', 'Amazonas']);
  cdsUf.AppendRecord(['BA', 'Bahia']);
  cdsUf.AppendRecord(['CE', 'Ceará']);
  cdsUf.AppendRecord(['DF', 'Distrito Federal']);
  cdsUf.AppendRecord(['ES', 'Espírito Santo']);
  cdsUf.AppendRecord(['GO', 'Goiás']);
  cdsUf.AppendRecord(['MA', 'Maranhão']);
  cdsUf.AppendRecord(['MT', 'Mato Grosso']);
  cdsUf.AppendRecord(['MS', 'Mato Grosso do Sul']);
  cdsUf.AppendRecord(['MG', 'Minas Gerais']);
  cdsUf.AppendRecord(['PA', 'Pará']);
  cdsUf.AppendRecord(['PB', 'Paraíba']);
  cdsUf.AppendRecord(['PR', 'Paraná']);
  cdsUf.AppendRecord(['PE', 'Pernambuco']);
  cdsUf.AppendRecord(['PI', 'Piauí']);
  cdsUf.AppendRecord(['RJ', 'Rio de Janeiro']);
  cdsUf.AppendRecord(['RN', 'Rio Grande do Norte']);
  cdsUf.AppendRecord(['RS', 'Rio Grande do Sul']);
  cdsUf.AppendRecord(['RO', 'Rondônia']);
  cdsUf.AppendRecord(['RR', 'Roraima']);
  cdsUf.AppendRecord(['SC', 'Santa Catarina']);
  cdsUf.AppendRecord(['SP', 'São Paulo']);
  cdsUf.AppendRecord(['SE', 'Sergipe']);
  cdsUf.AppendRecord(['TO', 'Tocantins']);
  cdsUf.First;

  // ---------------------------------------------------------------------------

  cdsStatusAssinante.Close;
  cdsStatusAssinante.CreateDataSet;
  cdsStatusAssinante.Open;

  cdsStatusAssinante.AppendRecord([-1, '']);
  cdsStatusAssinante.AppendRecord([0, 'Ativo']);
  cdsStatusAssinante.AppendRecord([1, 'Inativo']);
  cdsStatusAssinante.First;

  // ---------------------------------------------------------------------------

  cdsStatusAssinante2.Close;
  cdsStatusAssinante2.CreateDataSet;
  cdsStatusAssinante2.Open;

  cdsStatusAssinante2.AppendRecord([0, 'Ativo']);
  cdsStatusAssinante2.AppendRecord([1, 'Inativo']);
  cdsStatusAssinante2.First;

  // ---------------------------------------------------------------------------

  cdsLookupSimNao.Close;
  cdsLookupSimNao.CreateDataSet;
  cdsLookupSimNao.Open;

  cdsLookupSimNao.AppendRecord(['S', 'Sim']);
  cdsLookupSimNao.AppendRecord(['N', 'Não']);
  cdsLookupSimNao.First;

  // ---------------------------------------------------------------------------

  cdsLookupSimNao2.Close;
  cdsLookupSimNao2.CreateDataSet;
  cdsLookupSimNao2.Open;

  cdsLookupSimNao2.AppendRecord(['S', 'Sim']);
  cdsLookupSimNao2.AppendRecord(['N', 'Não']);
  cdsLookupSimNao2.First;

end;

procedure TdmDadosGlobal.dspLookupZonasUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(e.Message);
end;

function TdmDadosGlobal.FormataEndereco(AEndereco, ANro,
  AComplemento: String): String;
begin
  Result := '';

  AEndereco := trim(AEndereco);
  ANro := trim(ANro);
  AComplemento := trim(AComplemento);

  // Faz a montagem do endereço completo do assinante
  Result := AEndereco;

  if ANro <> EmptyStr then
    Result := Result + ', ' + ANro;

  if AComplemento <> EmptyStr then
    Result := Result + ' - ' + AComplemento;
end;

function TdmDadosGlobal.FormatDateTimeToString(const Format: string;
  DateTime: TDateTime): String;
begin
  if DateTime = 0 then
    Result := ''
  else
    Result := FormatDateTime(Format, DateTime);
end;

function TdmDadosGlobal.GetDataHoraBanco: TDateTime;
begin
  try
    sqlDataHoraBanco.Close;
    sqlDataHoraBanco.Open;

    Result := sqlDataHoraBancodatahora.AsDateTime;
  finally
    sqlDataHoraBanco.Close;
  end;
end;

function TdmDadosGlobal.GetDescricaoSimNao(Aindicador: String): String;
begin
  if UpperCase(Aindicador)  = 'S' then
    Result := 'Sim'
  else if UpperCase(Aindicador)  = 'N' then
    Result := 'Não'
  else
    Result := '';
end;

function TdmDadosGlobal.GetMesPorExtenso(AMes: Integer): String;
begin
  case AMes of
    01: Result := 'Janeiro';
    02: Result := 'Fevereiro';
    03: Result := 'Março';
    04: Result := 'Abril';
    05: Result := 'Maio';
    06: Result := 'Junho';
    07: Result := 'Julho';
    08: Result := 'Agosto';
    09: Result := 'Setembro';
    10: Result := 'Outubro';
    11: Result := 'Novembro';
    12: Result := 'Dezembro';
  end;
end;

function TdmDadosGlobal.GetPrimeirosNumeroComplementoEndereco(const Str,
  ReturnIfNull: String): String;
var
  I: integer;
  S: string;
  Flag: Boolean;
begin
  S := '';
  Flag := false;

  for I := 1 To Length(Str) Do
  begin
    if CharInSet(Str[I], ['0'..'9']) then
    begin
      S := S + Copy(Str, I, 1);
      Flag := true;
    end
    else
    begin
      if Flag then
        Break;
    end;
  end;

  if S = '' then
    Result := ReturnIfNull
  else
    result := S;
end;

function TdmDadosGlobal.GetSoLetras(const Str, ReturnIfNull: String): String;
var
  I: integer;
  S: string;
begin
  S := '';

  for I := 1 To Length(Str) Do
    if not (CharInSet(Str[I], ['0'..'9'])) then
      S := S + Copy(Str, I, 1);

  if S = '' then
    Result := ReturnIfNull
  else
    result := S;
end;

function TdmDadosGlobal.GetSoNumeros(const Str: String;
  const ReturnIfNull: String = ''): String;
var
  I: integer;
  S: string;
begin
  S := '';

  for I := 1 To Length(Str) Do
    if CharInSet(Str[I], ['0'..'9']) then
      S := S + Copy(Str, I, 1);

  if S = '' then
    Result := ReturnIfNull
  else
    result := S;
end;

function TdmDadosGlobal.ValidarCEP(ACEP: String): Boolean;
begin
  ACBrValidador.TipoDocto := docCEP;
  ACBrValidador.Documento := AnsiString(ACEP);

  Result := ACBrValidador.Validar;
end;

function TdmDadosGlobal.ValidarCNPJ(ACNPJ: String): Boolean;
begin
  ACBrValidador.TipoDocto := docCNPJ;
  ACBrValidador.Documento := AnsiString(ACNPJ);

  Result := ACBrValidador.Validar;
end;

function TdmDadosGlobal.ValidarCPF(ACPF: String): Boolean;
begin
  ACBrValidador.TipoDocto := docCPF;
  ACBrValidador.Documento := AnsiString(ACPF);

  Result := ACBrValidador.Validar;
end;

function TdmDadosGlobal.ValidarEmail(AEmail: string): Boolean;
const
  l_Maiuscula = ['A'..'Z'];
  l_Letras_validas = ['0'..'9', 'a'..'z', '_', '-', '.'];

var
  l_Qtd_Arroba, l_Qtd_Espacos : smallint;
  l_i : smallint;
  l_Usuario, l_Dominio : string;
  l_char : Char;
  l_Carac_Ant : String;

begin
  l_Qtd_Arroba := 0;
  l_Qtd_Espacos := 0;
  l_Carac_Ant := '';

  result := false;

  // Verifica se existe algum coisa no parametro.
  if AEmail = '' then
  begin
    MessageDlg('E-mail nao foi informado.', mtWarning, [mbok], 0);
    exit;
  end;

  for l_i := 1 to length(AEmail) do
  begin
    if (copy(AEmail, l_i, 1) = '.') and (l_Carac_Ant = '.')  then
    begin
      MessageDlg('Existem dois ou mais pontos juntos, verifique.', mtWarning, [mbok], 0);
      exit;
    end;

    if ((copy(AEmail, l_i, 1) = '.') and (l_Carac_Ant = '@')) or ((copy(AEmail, l_i, 1) = '@') and (l_Carac_Ant = '.')) then
    begin
      MessageDlg('Nao pode haver uma arroba e um ponto juntos, verifique.', mtWarning, [mbok], 0);
      exit;
    end;

    if copy(AEmail, l_i, 1) = ' ' then
      l_Qtd_Espacos := l_Qtd_Espacos + 1;

    if l_Qtd_Espacos <> 0 then
    begin
      MessageDlg('Existem espacos em branco, verifique.', mtWarning, [mbok], 0);
      exit;
    end;

    if copy(AEmail, l_i, 1) = '@' then
      l_Qtd_Arroba := l_Qtd_Arroba + 1;

    l_Carac_Ant := copy(AEmail, l_i, 1);
  end;

  if l_Qtd_Arroba = 0 then
  begin
    MessageDlg('Deve existir uma @ (arroba) para o e-mail ser válido.', mtWarning, [mbok], 0);
    exit;
  end
  else if l_Qtd_Arroba > 1 then
  begin
    MessageDlg('Existem mais de 1 @ (arroba), verifique.', mtWarning, [mbok], 0);
    exit;
  end;

  // ---------------------------------------------------------------------------
  // Separar o usuário do dominio.
  // ---------------------------------------------------------------------------

  l_i := pos('@', AEmail);

  l_Usuario := copy(AEmail, 1, (l_i - 1));
  l_Dominio := copy(AEmail, (l_i + 1), length(AEmail));

  if l_Usuario = '' then
  begin
    MessageDlg('Nao foi informado a parte antes da @ (arroba), verifique.', mtWarning, [mbok], 0);
    exit;
  end;

  if l_Dominio = '' then
  begin
    MessageDlg('Nao foi informado a parte depois da @ (arroba), verifique.', mtWarning, [mbok], 0);
    exit;
  end;

  // ---------------------------------------------------------------------------
  // Validando a parte do usuário
  // ---------------------------------------------------------------------------
  for l_i := 1 to length(l_Usuario) do
  begin
    l_char := l_Usuario[l_i];

    if (CharInSet(l_char, l_Maiuscula)) then
    //if l_char in l_Maiuscula then
    begin
      MessageDlg('Existem letras maiúsculas antes da @ (arroba), verifique.', mtWarning, [mbok], 0);
      exit;
    end;

    if not (CharInSet(l_char, l_Letras_validas)) then
    //if not (l_char in l_Letras_validas) then
    begin
      MessageDlg('Existem caracteres invalidos antes da @ (arroba), verifique.', mtWarning, [mbok], 0);
      exit;
    end;
  end;

  //----------------------------------------------------------------------------
  // Validando a parte do domino
  //----------------------------------------------------------------------------

  for l_i := 1 to length(l_Dominio) do
  begin
    l_char := l_Dominio[l_i];

    if (CharInSet(l_char, l_Maiuscula)) then
    //if l_char in l_Maiuscula then
    begin
      MessageDlg('Existem letras maiúsculas depois da @ (arroba), verifique.', mtWarning, [mbok], 0);
      exit;
    end;

    if not (CharInSet(l_char, l_Letras_validas)) then
    //if not (l_char in l_Letras_validas) then
    begin
      MessageDlg('Existem caracteres invalidos depois da @ (arroba), verifique.', mtWarning, [mbok], 0);
      exit;
    end;

  end;

  if copy(l_Dominio, length(l_Dominio), 1) = '.' then
  begin
    MessageDlg('O último caracter do e-mail não pode ser um ponto, verifique.', mtWarning, [mbok], 0);
    exit;
  end;

  result := true;
end;

function TdmDadosGlobal.ValorPorExtenso(AValor: Double): String;
begin
  Result := ACBrExtenso.ValorToTexto(AValor);
end;

end.
