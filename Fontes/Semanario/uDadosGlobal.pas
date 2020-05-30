unit uDadosGlobal;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Datasnap.DBClient,
  Vcl.Dialogs, Data.FMTBcd, Data.SqlExpr, Vcl.Controls,
  Winapi.Windows, Vcl.Forms, Datasnap.Provider, System.UITypes;

type
  TdmDadosGlobal = class(TDataModule)
    cdsUf: TClientDataSet;
    cdsUfufdescr: TStringField;
    cdsUfuf: TStringField;
    dsUf: TDataSource;
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
  Result := true;
end;

function TdmDadosGlobal.ValidarCNPJ(ACNPJ: String): Boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12: Integer;
  d1, d2: Integer;
  digitado, calculado: string;
begin
  ACNPJ := GetSoNumeros(ACNPJ);

  if Length(ACNPJ) <> 14 then
  begin
    ValidarCNPJ := false;
    exit;
  end;

  n1 := StrToInt(ACNPJ[1]);
  n2 := StrToInt(ACNPJ[2]);
  n3 := StrToInt(ACNPJ[3]);
  n4 := StrToInt(ACNPJ[4]);
  n5 := StrToInt(ACNPJ[5]);
  n6 := StrToInt(ACNPJ[6]);
  n7 := StrToInt(ACNPJ[7]);
  n8 := StrToInt(ACNPJ[8]);
  n9 := StrToInt(ACNPJ[9]);
  n10 := StrToInt(ACNPJ[10]);
  n11 := StrToInt(ACNPJ[11]);
  n12 := StrToInt(ACNPJ[12]);

  d1 := n12 * 2 + n11 * 3 + n10 * 4 + n9 * 5 + n8 * 6 + n7 * 7 + n6 * 8 + n5 * 9 + n4 * 2 + n3 * 3 + n2 * 4 + n1 * 5;
  d1 := 11 - (d1 mod 11);

  if d1 >= 10 then
    d1 := 0;

  d2 := d1 * 2 + n12 * 3 + n11 * 4 + n10 * 5 + n9 * 6 + n8 * 7 + n7 * 8 + n6 * 9 + n5 * 2 + n4 * 3 + n3 * 4 + n2 * 5 + n1 * 6;
  d2 := 11 - (d2 mod 11);

  if d2 >= 10 then
    d2 := 0;

  calculado := inttostr(d1) + inttostr(d2);
  digitado := ACNPJ[13] + ACNPJ[14];

  if calculado = digitado then
    ValidarCNPJ := true
  else
    ValidarCNPJ := false;

end;

function TdmDadosGlobal.ValidarCPF(ACPF: String): Boolean;
var
  n1, n2, n3, n4, n5, n6, n7, n8, n9: Integer;
  d1, d2: Integer;
  digitado, calculado: string;
begin
  ACPF := GetSoNumeros(ACPF);

  if Length(ACPF) <> 11 then
  begin
    ValidarCPF := false;
    exit;
  end;

  // Pega os 9 primeiros números
  n1 := StrToInt(ACPF[1]);
  n2 := StrToInt(ACPF[2]);
  n3 := StrToInt(ACPF[3]);
  n4 := StrToInt(ACPF[4]);
  n5 := StrToInt(ACPF[5]);
  n6 := StrToInt(ACPF[6]);
  n7 := StrToInt(ACPF[7]);
  n8 := StrToInt(ACPF[8]);
  n9 := StrToInt(ACPF[9]);

  // Faz o cálculo do primeiro dígito
  d1 := n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9
    + n1 * 10;
  d1 := 11 - (d1 mod 11);

  if d1 >= 10 then
    d1 := 0; // Se o cálculo for igual a 10 então ele é zero

  // Faz o calculo do segundo digito
  d2 := d1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 +
    n2 * 10 + n1 * 11;
  d2 := 11 - (d2 mod 11);

  if d2 >= 10 then
    d2 := 0; // se o cálculo for igual a 10 então ele é zero

  calculado := inttostr(d1) + inttostr(d2); // Define o que foi calculado
  digitado := ACPF[10] + ACPF[11]; // Define o que foi digitado

  // Se o número que foi calculado for igual ao que foi digitado
  // a função retorna verdadeiro, senão retorna falso
  Result := (calculado = digitado);
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
const
  unidade: array [1 .. 19] of string = ('Um', 'Dois', 'Três', 'Quatro', 'Cinco',
    'Seis', 'Sete', 'Oito', 'Nove', 'Dez', 'Onze', 'Doze', 'Treze', 'Quatorze',
    'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');

  dezena: array [2 .. 9] of string = ('Vinte', 'Trinta', 'Quarenta',
    'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');

  centena: array [1 .. 9] of string = ('Cento', 'Duzentos', 'Trezentos',
    'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos',
    'Novecentos');

  qualificaS: array [0 .. 4] of string = ('', 'Mil', 'Milhão', 'Bilhão',
    'Trilhão');

  qualificaP: array [0 .. 4] of string = ('', 'Mil', 'Milhões', 'Bilhões',
    'Trilhões');
var
  inteiro: Int64;
  resto: real;
  vlrS, s, saux, vlrP, centavos: string;
  n, unid, dez, cent, tam, I: Integer;
  umReal, tem: Boolean;
begin
  if AValor = 0 then
  begin
    valorPorExtenso := 'Zero';
    exit;
  end;

  inteiro := trunc(AValor); // parte inteira do valor
  resto := AValor - inteiro; // parte fracionária do valor
  vlrS := inttostr(inteiro);
  if (length(vlrS) > 15) then
  begin
    valorPorExtenso := 'Erro: valor superior a 999 trilhões.';
    exit;
  end;

  s := '';
  centavos := inttostr(round(resto * 100));

  // definindo o extenso da parte inteira do valor
  i := 0;
  umReal := false; tem := false;

  while (vlrS <> '0') do
  begin
    tam := length(vlrS);
    // retira do valor a 1a. parte, 2a. parte, por exemplo, para 123456789:
    // 1a. parte = 789 (centena)
    // 2a. parte = 456 (mil)
    // 3a. parte = 123 (milhões)

    if (tam > 3) then
    begin
      vlrP := copy(vlrS, tam-2, tam);
      vlrS := copy(vlrS, 1, tam-3);
    end
    else
    begin // última parte do valor
      vlrP := vlrS;
      vlrS := '0';
    end;

    if (vlrP <> '000') then
    begin
      saux := '';
      if (vlrP = '100') then
        saux := 'cem'
      else
      begin
        n := strtoint(vlrP);        // para n = 371, tem-se:
        cent := n div 100;          // cent = 3 (centena trezentos)
        dez := (n mod 100) div 10;  // dez  = 7 (dezena setenta)
        unid := (n mod 100) mod 10; // unid = 1 (unidade um)

        if (cent <> 0) then
          saux := centena[cent];

        if ((dez <> 0) or (unid <> 0)) then
        begin
          if ((n mod 100) <= 19) then
          begin
            if (length(saux) <> 0) then
              saux := saux + ' e ' + unidade[n mod 100]
            else
              saux := unidade[n mod 100];
          end
          else
          begin
            if (length(saux) <> 0) then
              saux := saux + ' e ' + dezena[dez]
            else
              saux := dezena[dez];

            if (unid <> 0) then
              if (length(saux) <> 0) then
                saux := saux + ' e ' + unidade[unid]
              else
                saux := unidade[unid];
          end;
        end;
      end;

      if ((vlrP = '1') or (vlrP = '001')) then
      begin
        if (i = 0) then // 1a. parte do valor (um real)
          umReal := true
        else
          saux := saux + ' ' + qualificaS[i];
      end
      else if (i <> 0) then
        saux := saux + ' ' + qualificaP[i];

      if (length(s) <> 0) then
        s := saux + ', ' + s
      else
        s := saux;
    end;

    if (((i = 0) or (i = 1)) and (length(s) <> 0)) then
      tem := true; // tem centena ou mil no valor

    i := i + 1; // próximo qualificador: 1- mil, 2- milhão, 3- bilhão, ...
  end;

  if (length(s) <> 0) then
  begin
    if (umReal) then
      s := s + ' Real'
    else if (tem) then
      s := s + ' Reais'
    else
      s := s + ' de Reais';
  end;

  // definindo o extenso dos centavos do valor
  if (centavos <> '0') then // valor com centavos
  begin
    if (length(s) <> 0) then  // se não é valor somente com centavos
      s := s + ' e ';

    if (centavos = '1') then
      s := s + 'Um Centavo'
    else
    begin
      n := strtoint(centavos);

      if (n <= 19) then
        s := s + unidade[n]
      else
      begin                 // para n = 37, tem-se:
        unid := n mod 10;   // unid = 37 % 10 = 7 (unidade sete)
        dez := n div 10;    // dez  = 37 / 10 = 3 (dezena trinta)
        s := s + dezena[dez];
        if (unid <> 0) then
          s := s + ' e ' + unidade[unid];
      end;

      s := s + ' Centavos';
    end;
  end;

  valorPorExtenso := s;
end;

end.
