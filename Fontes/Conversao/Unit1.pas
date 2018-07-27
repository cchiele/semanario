unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DBXMySQL, Data.DB, Data.SqlExpr,
  Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Vcl.StdCtrls, IdHashMessageDigest,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    SQLConnAssinates: TSQLConnection;
    SQLConnSemanario: TSQLConnection;
    sqlUsuario: TSQLDataSet;
    dspUsuario: TDataSetProvider;
    cdsUsuario: TClientDataSet;
    cdsUsuarioid: TIntegerField;
    cdsUsuariologin: TStringField;
    cdsUsuariosenha: TStringField;
    cdsUsuariodescricao: TStringField;
    cdsUsuarioativo: TShortintField;
    cdsUsuarioidPerfil: TIntegerField;
    sqlTblusu: TSQLDataSet;
    dspTblusu: TDataSetProvider;
    cdsTblusu: TClientDataSet;
    cdsTblusuusucod: TIntegerField;
    cdsTblusuusulogin: TStringField;
    cdsTblusuususenha: TStringField;
    cdsTblusuusunome: TStringField;
    cdsTblusuusuativo: TShortintField;
    Button1: TButton;
    chkUsuario: TCheckBox;
    chkVendedor: TCheckBox;
    sqlVendedor: TSQLDataSet;
    dspVendedor: TDataSetProvider;
    cdsVendedor: TClientDataSet;
    cdsVendedorid: TIntegerField;
    cdsVendedordescricao: TStringField;
    cdsVendedoridGrupoVendedor: TIntegerField;
    cdsVendedorfoneContato: TStringField;
    cdsVendedorloginAlt: TStringField;
    cdsVendedordataAlt: TSQLTimeStampField;
    sqlTblven: TSQLDataSet;
    dspTblven: TDataSetProvider;
    cdsTblven: TClientDataSet;
    sqlGrupoVen: TSQLDataSet;
    dspGrupoVen: TDataSetProvider;
    cdsGrupoVen: TClientDataSet;
    cdsGrupoVenid: TIntegerField;
    cdsGrupoVendescricao: TStringField;
    cdsGrupoVenloginAlt: TStringField;
    cdsGrupoVendataAlt: TSQLTimeStampField;
    sqlTblgrv: TSQLDataSet;
    dspTblgrv: TDataSetProvider;
    cdsTblgrv: TClientDataSet;
    chkGrupoVen: TCheckBox;
    cdsTblgrvgdvcod: TIntegerField;
    cdsTblgrvgdvdescr: TStringField;
    cdsTblvenvencod: TIntegerField;
    cdsTblvenvennome: TStringField;
    cdsTblvengdvcod: TIntegerField;
    cdsTblvenvenfone: TStringField;
    Button2: TButton;
    sqlCobrador: TSQLDataSet;
    dspCobrador: TDataSetProvider;
    cdsCobrador: TClientDataSet;
    cdsCobradorid: TIntegerField;
    cdsCobradordescricao: TStringField;
    cdsCobradorloginAlt: TStringField;
    cdsCobradordataAlt: TSQLTimeStampField;
    chkCobrador: TCheckBox;
    sqlTblcob: TSQLDataSet;
    dspTblcob: TDataSetProvider;
    cdsTblcob: TClientDataSet;
    cdsTblcobcobcod: TIntegerField;
    cdsTblcobcobnome: TStringField;
    chkZona: TCheckBox;
    sqlZona: TSQLDataSet;
    dspZona: TDataSetProvider;
    cdsZona: TClientDataSet;
    cdsZonaid: TStringField;
    cdsZonadescricao: TStringField;
    cdsZonaentregador: TStringField;
    cdsZonaloginAlt: TStringField;
    cdsZonadataAlt: TSQLTimeStampField;
    sqlTblzon: TSQLDataSet;
    dspTblzon: TDataSetProvider;
    cdsTblzon: TClientDataSet;
    cdsTblzonzoncod: TStringField;
    cdsTblzonzondescr: TStringField;
    cdsTblzonzonentregador: TStringField;
    chkRuaZona: TCheckBox;
    sqlRuazona: TSQLDataSet;
    dspRuazona: TDataSetProvider;
    cdsRuazona: TClientDataSet;
    cdsRuazonaid: TIntegerField;
    cdsRuazonaidZona: TStringField;
    cdsRuazonadescricao: TStringField;
    cdsRuazonaloginAlt: TStringField;
    cdsRuazonadataAlt: TSQLTimeStampField;
    sqlTblrdz: TSQLDataSet;
    dspTblrdz: TDataSetProvider;
    cdsTblrdz: TClientDataSet;
    cdsTblrdzrdzcod: TIntegerField;
    cdsTblrdzzoncod: TStringField;
    cdsTblrdzrdzender: TStringField;
    sqlMunicipio: TSQLDataSet;
    dspMunicipio: TDataSetProvider;
    cdsMunicipio: TClientDataSet;
    cdsMunicipioid: TIntegerField;
    cdsMunicipiodescricao: TStringField;
    cdsMunicipiouf: TStringField;
    cdsMunicipiocep: TStringField;
    cdsMunicipiologinAlt: TStringField;
    cdsMunicipiodataAlt: TSQLTimeStampField;
    sqltblcep: TSQLDataSet;
    dspTblcep: TDataSetProvider;
    cdsTblcep: TClientDataSet;
    cdsTblcepcepcep: TStringField;
    cdsTblcepcepmunicipio: TStringField;
    cdsTblcepcepeuf: TStringField;
    chkMunicipio: TCheckBox;
    sqlAssinante: TSQLDataSet;
    dspAssinante: TDataSetProvider;
    cdsAssinante: TClientDataSet;
    cdsAssinanteid: TIntegerField;
    cdsAssinantedescricao: TStringField;
    cdsAssinanteidZona: TStringField;
    cdsAssinanteidRuaZona: TIntegerField;
    cdsAssinantenumero: TIntegerField;
    cdsAssinantebairro: TStringField;
    cdsAssinantecomplemento: TStringField;
    cdsAssinantedataNascimento: TSQLTimeStampField;
    cdsAssinanteidMunicipio: TIntegerField;
    cdsAssinanteenderecoCobranca: TStringField;
    cdsAssinantefoneComercial: TStringField;
    cdsAssinantefoneResidencial: TStringField;
    cdsAssinantefoneFax: TStringField;
    cdsAssinantefoneCelular: TStringField;
    cdsAssinanteemail: TStringField;
    cdsAssinanteidVendedor: TIntegerField;
    cdsAssinanteidCobrador: TIntegerField;
    cdsAssinanteinativo: TShortintField;
    cdsAssinantedataInativo: TSQLTimeStampField;
    cdsAssinanteimprimeEtiqueta: TStringField;
    cdsAssinanteobs: TStringField;
    cdsAssinanterazaoSocial: TStringField;
    cdsAssinantecpf: TStringField;
    cdsAssinantecnpj: TStringField;
    cdsAssinanteloginAlt: TStringField;
    cdsAssinantedataAlt: TSQLTimeStampField;
    chkAssinante: TCheckBox;
    sqlBuscaCep: TSQLDataSet;
    sqlBuscaCepid: TIntegerField;
    sqlBuscaCepdescricao: TStringField;
    sqlBuscaCepuf: TStringField;
    sqlBuscaCepcep: TStringField;
    sqlBuscaCeploginAlt: TStringField;
    sqlBuscaCepdataAlt: TSQLTimeStampField;
    sqlAssinatura: TSQLDataSet;
    dspAssinatura: TDataSetProvider;
    cdsAssinatura: TClientDataSet;
    cdsAssinaturaid: TIntegerField;
    cdsAssinaturaidAssinante: TIntegerField;
    cdsAssinaturanumero: TIntegerField;
    cdsAssinaturatipo: TStringField;
    cdsAssinaturadata: TSQLTimeStampField;
    cdsAssinaturadataVencimento: TSQLTimeStampField;
    cdsAssinaturavalor: TFloatField;
    cdsAssinaturavalorPendente: TFloatField;
    cdsAssinaturaobs: TStringField;
    cdsAssinaturacancelada: TStringField;
    cdsAssinaturaloginAlt: TStringField;
    cdsAssinaturadataAlt: TSQLTimeStampField;
    chkAssinatura: TCheckBox;
    sqlBaixa: TSQLDataSet;
    dspBaixa: TDataSetProvider;
    cdsBaixa: TClientDataSet;
    cdsBaixaid: TIntegerField;
    cdsBaixaidAssinante: TIntegerField;
    cdsBaixanumeroAssinatura: TIntegerField;
    cdsBaixatipoAssinatura: TStringField;
    cdsBaixadata: TSQLTimeStampField;
    cdsBaixavalor: TFloatField;
    cdsBaixaloginAlt: TStringField;
    cdsBaixadataAlt: TSQLTimeStampField;
    chkBaixa: TCheckBox;
    sqlBuscaUsu: TSQLDataSet;
    sqlBuscaUsuid: TIntegerField;
    sqlBuscaUsulogin: TStringField;
    sqlBuscaUsusenha: TStringField;
    sqlBuscaUsudescricao: TStringField;
    sqlBuscaUsuativo: TShortintField;
    sqlBuscaUsuidPerfil: TIntegerField;
    sqlRuaNaoEncontrada: TSQLDataSet;
    sqlRuaNaoEncontradardzcod: TIntegerField;
    sqlRuaNaoEncontradazoncod: TStringField;
    sqlRuaNaoEncontradardzender: TStringField;
    sqlMaxRdzcod: TSQLDataSet;
    sqlMaxRdzcodrdzcod: TIntegerField;
    edtSenha: TLabeledEdit;
    sqlUltBaixa: TSQLDataSet;
    sqlUltBaixadata: TSQLTimeStampField;
    edtHost: TLabeledEdit;
    Button3: TButton;
    sqlSelTodasParcelas: TSQLDataSet;
    sqlSelTodasParcelasasscod: TIntegerField;
    sqlSelTodasParcelasadacod: TIntegerField;
    sqlSelTblcpa: TSQLDataSet;
    sqlSelTblcpaasscod: TIntegerField;
    sqlSelTblcpaadacod: TIntegerField;
    sqlSelTblcpacpadtvenc: TDateField;
    sqlUpdTblcpa: TSQLDataSet;
    Label1: TLabel;
    procedure dspUsuarioUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SQLConnSemanarioBeforeConnect(Sender: TObject);
    procedure SQLConnAssinatesBeforeConnect(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    procedure UsuarioToTblusu;
    procedure VendedorToTblven;
    procedure GrupoVendedorToTblgrv;
    procedure CobradorToTblcob;
    procedure ZonaToTblzon;
    procedure RuazonaToTblrdz;
    procedure MunicipioToTblcep;
    procedure AssinanteToTblass;
    procedure AssinaturaToTblada;
    procedure BaixaToTblbda;

    function AjustarFone(AFone: String): String;
    function GetIdRuaNaoEncontrada(IdZona: string): integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function MD5(const texto:string):string;
var
  idmd5 : TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    result := idmd5.HashStringAsHex(texto);
  finally
    idmd5.Free;
  end;
end;

function TForm1.AjustarFone(AFone: String): String;
var
  i: integer;
  x: integer;
begin
  Result := '';

  AFone := trim(AFone);
  AFone := LowerCase(AFone);

  x := Pos('r', AFone);

  if x > 0 then
    AFone := trim(copy(AFone, 1, x -1));

  for I := 1 to Length(AFone) do
    if (AFone[i] in ['0'..'9']) or (AFone[i] = '(') or (AFone[i] = ')') then
      Result := Result + AFone[i];
end;

procedure TForm1.AssinanteToTblass;
var
  Linha: String;
  Instrucao: String;
  MyText: TStringlist;
  i: integer;
begin
  SQLConnAssinates.Close;
  SQLConnSemanario.Close;


  MyText:= TStringlist.create;
  try
    i := 0;
    Linha := '';
    Instrucao :=
      'INSERT INTO `tblass` (`asscod`, `assnome`, `asscpf`, `assrazaosocial`, `asscnpj`, ' +
        '`assstatus`, `assdtinativo`, `assdtnasc`, `rdzcod`, `assnroent`, `asscomplent`, ' +
        '`assbairroent`, `cepcepent`, `assendercobr`, `assfonecomer`, `assfonecomerramal`, ' +
        '`assfoneresid`, `assfonefax`, `assfonecelul`, `vencod`, `cobcod`, `assimpretiq`, ' +
        '`assemail`, `assobs`) VALUES';

    MyText.Add('/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;');
    MyText.Add('/*!40101 SET NAMES utf8 */;');
    MyText.Add('/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;');
    MyText.Add('/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=''NO_AUTO_VALUE_ON_ZERO'' */;');
    MyText.Add('/*!40000 ALTER TABLE `tblass` DISABLE KEYS */;');

    cdsAssinante.Close;
    cdsAssinante.Open;

    while not cdsAssinante.Eof do
    begin
      if i = 0 then
      begin
        Linha := Instrucao;
      end;

      if i = 4500 then
      begin
        i := 1;
        Linha := '; ' + Instrucao;
      end
      else
      begin
        if i > 0 then
          Linha := ', ';
      end;

      Linha := Linha + '(' +
        trim(cdsAssinanteid.AsString) + ', ' +
        '"' + trim(StringReplace(cdsAssinantedescricao.AsString, '"', '', [rfReplaceAll])) + '", ' +
        '"' + trim(cdsAssinantecpf.AsString) + '", ' +
        '"' + trim(StringReplace(cdsAssinanterazaoSocial.AsString, '"', '', [rfReplaceAll])) + '", ' +
        '"' + trim(cdsAssinantecnpj.AsString) + '", ' +
        trim(cdsAssinanteinativo.AsString) + ', ';

      if cdsAssinanteinativo.AsInteger = 1 then
        if cdsAssinantedataInativo.AsString <> '' then // 30/12/1899
          Linha := Linha + '"' + FormatDateTime('yyyy-mm-dd', cdsAssinantedataInativo.AsDateTime) + '", '
        else
          Linha := Linha + 'NULL, '
      else
        Linha := Linha + 'NULL, ';

      if cdsAssinantedataNascimento.AsString <> '' then
        Linha := Linha + '"' + FormatDateTime('yyyy-mm-dd', cdsAssinantedataNascimento.AsDateTime) + '", '
      else
        Linha := Linha + 'NULL, ';

      if cdsAssinanteidRuaZona.AsInteger = -1 then
        Linha := Linha + IntToStr(GetIdRuaNaoEncontrada(cdsAssinanteidZona.AsString)) + ', '
      else
        Linha := Linha + IntToStr(cdsAssinanteidRuaZona.AsInteger) + ', ';


      Linha := Linha +
        '"' + trim(StringReplace(cdsAssinantenumero.AsString, '"', '', [rfReplaceAll])) + '", ' +
        '"' + trim(StringReplace(cdsAssinantecomplemento.AsString, '"', '', [rfReplaceAll])) + '", ';

      if trim(cdsAssinantebairro.AsString) = '' then
        Linha := Linha + '"", '
      else
        Linha := Linha +
          '"' + trim(StringReplace(cdsAssinantebairro.AsString, '"', '', [rfReplaceAll])) + '", ';

      sqlBuscaCep.Close;
      sqlBuscaCep.ParamByName('id').AsInteger := cdsAssinanteidMunicipio.AsInteger;
      sqlBuscaCep.Open;

      if sqlBuscaCep.Eof then
        raise Exception.Create('Município ' + IntToStr(cdsAssinanteidMunicipio.AsInteger) + ' não encontrado')
      else
        Linha := Linha + '"' + trim(sqlBuscaCepcep.AsString) + '", ';


      Linha := Linha +
        '"' + trim(StringReplace(cdsAssinanteenderecoCobranca.AsString, '"', '', [rfReplaceAll])) + '", ' +
        '"' + AjustarFone(cdsAssinantefoneComercial.AsString) + '", ' +
        '"", ' +
        '"' + AjustarFone(cdsAssinantefoneResidencial.AsString) + '", ' +
        '"' + AjustarFone(cdsAssinantefoneFax.AsString) + '", ' +
        '"' + AjustarFone(cdsAssinantefoneCelular.AsString) + '", ';

      if cdsAssinanteidVendedor.AsInteger = -1 then
        Linha := Linha + '22, '
      else
        Linha := Linha + trim(cdsAssinanteidVendedor.AsString) + ', ';

      if cdsAssinanteidCobrador.AsInteger = -1 then
        Linha := Linha + '3, ' // Balcão
      else
        Linha := Linha + trim(cdsAssinanteidCobrador.AsString) + ', ';

      if cdsAssinanteimprimeEtiqueta.AsInteger = 0 then
        Linha := Linha + '"N", '
      else
        Linha := Linha + '"S", ';

      Linha := Linha +
        '"' + trim(StringReplace(LowerCase(cdsAssinanteemail.AsString), '"', '', [rfReplaceAll])) + '", ' +
        '"' + trim(StringReplace(cdsAssinanteobs.AsString, '"', '', [rfReplaceAll])) + '")';

      if cdsAssinante.RecordCount = cdsAssinante.RecNo then
        Linha := Linha + ';';

      MyText.Add(Linha);

      Inc(i);

      cdsAssinante.Next;
    end;

    MyText.Add('/*!40000 ALTER TABLE `tblass` ENABLE KEYS */;');
    MyText.Add('/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '''') */;');
    MyText.Add('/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;');
    MyText.Add('/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;');

    MyText.SaveToFile(ExtractFilePath(ParamStr(0)) + 'tblass.sql');
  finally
    FreeAndNil(MyText);
  end;

  chkAssinante.Checked := false;

end;

procedure TForm1.AssinaturaToTblada;
var
  Linha: String;
  MyText: TStringlist;
  i: integer;
  Instrucao: String;
begin
  SQLConnAssinates.Close;
  SQLConnSemanario.Close;


  MyText:= TStringlist.create;
  try
    MyText.Add('/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;');
    MyText.Add('/*!40101 SET NAMES utf8 */;');
    MyText.Add('/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;');
    MyText.Add('/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=''NO_AUTO_VALUE_ON_ZERO'' */;');
    MyText.Add('/*!40000 ALTER TABLE `tblada` DISABLE KEYS */;');

    cdsAssinatura.Close;
    cdsAssinatura.Open;

    i := 0;
    Linha := '';
    Instrucao := 'INSERT INTO `tblada` (`asscod`, `adacod`, `adatipo`, `adadtini`, `adadtvenc`, `adavl`, `adavlpend`, `adaobs`, `adacancel`, `adadtcancel`, `adadtgerauto`) VALUES';

    while not cdsAssinatura.Eof do
    begin
      if i = 0 then
      begin
        Linha := Instrucao;
      end;

      if i = 12500 then
      begin
        i := 1;
        Linha := '; ' + Instrucao;
      end
      else
      begin
        if i > 0 then
          Linha := ', ';
      end;

      Linha := Linha + '(' +
        trim(cdsAssinaturaidAssinante.AsString) + ', ' +
        trim(cdsAssinaturanumero.AsString) + ', ' +
        '"' + trim(cdsAssinaturatipo.AsString) + '", ' +
        '"' + FormatDateTime('yyyy-mm-dd', cdsAssinaturadata.AsDateTime) + '", ' +
        '"' + FormatDateTime('yyyy-mm-dd', cdsAssinaturadataVencimento.AsDateTime) + '", ';

      FormatSettings.DecimalSeparator := '.';
      try
        Linha := linha +
          FloatToStr(cdsAssinaturavalor.Value) + ', ' +
          FloatToStr(cdsAssinaturavalorPendente.Value) + ', '
      finally
        FormatSettings.DecimalSeparator := ',';
      end;

      Linha := linha +
        '"' + trim(StringReplace(cdsAssinaturaobs.AsString, '"', '', [rfReplaceAll])) + '", ';

      if cdsAssinaturacancelada.AsString = '0' then
      begin
        Linha := linha + '"N", NULL';
      end
      else if cdsAssinaturacancelada.AsString = '1' then
      begin
        Linha := linha + '"S", ';

        // Tenta descobrir a data de cancelamento
        if cdsAssinaturadataAlt.AsDateTime > 0 then
        begin
          Linha := linha + '"' + FormatDateTime('yyyy-mm-dd', cdsAssinaturadataAlt.AsDateTime) + '"';
        end
        else
        begin
          sqlUltBaixa.Close;
          sqlUltBaixa.ParamByName('idAssinante').AsInteger := cdsAssinaturaidAssinante.AsInteger;
          sqlUltBaixa.ParamByName('numeroAssinatura').AsInteger := cdsAssinaturanumero.AsInteger;
          sqlUltBaixa.Open;

          if not sqlUltBaixa.Eof then
          begin
            Linha := linha + '"' + FormatDateTime('yyyy-mm-dd', sqlUltBaixadata.AsDateTime) + '"';
          end
          else
          begin
            Linha := linha + '"' + FormatDateTime('yyyy-mm-dd', cdsAssinaturadata.AsDateTime) + '"';
          end;
        end;
      end;

      Linha := linha + ', NULL)';

      MyText.Add(Linha);

      Inc(i);

      cdsAssinatura.Next;
    end;

    MyText.Add(';/*!40000 ALTER TABLE `tblada` ENABLE KEYS */;');
    MyText.Add('/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '''') */;');
    MyText.Add('/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;');
    MyText.Add('/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;');

    MyText.SaveToFile(ExtractFilePath(ParamStr(0)) + 'tblada.sql');
  finally
    FreeAndNil(MyText);
  end;

  chkAssinatura.Checked := false;
end;

procedure TForm1.BaixaToTblbda;
var
  Linha: String;
  Instrucao: String;
  i: integer;
  bdacod: integer;
  MyText: TStringlist;

  idAssinanteAnt, numeroAssinaturaAnt: integer;
begin
  SQLConnAssinates.Close;
  SQLConnSemanario.Close;


  MyText:= TStringlist.create;
  try

    idAssinanteAnt := 0;
    numeroAssinaturaAnt := 0;
    bdacod := 0;

    i := 0;
    Linha := '';
    Instrucao := 'INSERT INTO `tblbda` (`asscod`, `adacod`, `bdacod`, `usucod`, `bdadt`, `bdavl`) VALUES';

    MyText.Add('/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;');
    MyText.Add('/*!40101 SET NAMES utf8 */;');
    MyText.Add('/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;');
    MyText.Add('/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=''NO_AUTO_VALUE_ON_ZERO'' */;');
    MyText.Add('/*!40000 ALTER TABLE `tblbda` DISABLE KEYS */;');

    cdsBaixa.Close;
    cdsBaixa.Open;

    while not cdsBaixa.Eof do
    begin
      if i = 0 then
      begin
        Linha := Instrucao;
      end;

      if i = 15000 then
      begin
        i := 1;
        Linha := '; ' + Instrucao;
      end
      else
      begin
        if i > 0 then
          Linha := ', ';
      end;

      Linha := Linha + '(' +
        trim(cdsBaixaidAssinante.AsString) + ', ' +
        trim(cdsBaixanumeroAssinatura.AsString) + ', ';

      if (cdsBaixaidAssinante.AsInteger <> idAssinanteAnt) or (cdsBaixanumeroAssinatura.AsInteger <> numeroAssinaturaAnt) then
      begin
        idAssinanteAnt := cdsBaixaidAssinante.AsInteger;
        numeroAssinaturaAnt := cdsBaixanumeroAssinatura.AsInteger;

        bdacod := 1;
      end
      else
        Inc(bdacod);

      Linha := Linha + IntToStr(bdacod) + ', ';

      sqlBuscaUsu.Close;
      sqlBuscaUsu.ParamByName('login').AsString := cdsBaixaloginAlt.AsString;
      sqlBuscaUsu.Open;

      if sqlBuscaUsu.Eof then
        Linha := Linha + '1' + ', '
      else
        Linha := Linha + trim(sqlBuscaUsuid.AsString) + ', ';

      Linha := Linha + '"' + FormatDateTime('yyyy-mm-dd', cdsBaixadata.AsDateTime) + '", ';

      FormatSettings.DecimalSeparator := '.';
      try
        Linha := Linha + FloatToStr(cdsBaixavalor.Value) + ')';
      finally
        FormatSettings.DecimalSeparator := ',';
      end;

      MyText.Add(Linha);

      Inc(i);

      cdsBaixa.Next;
    end;

    MyText.Add(';/*!40000 ALTER TABLE `tblbda` ENABLE KEYS */;');
    MyText.Add('/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '''') */;');
    MyText.Add('/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;');
    MyText.Add('/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;');

    MyText.SaveToFile(ExtractFilePath(ParamStr(0)) + 'tblbda.sql');
  finally
    FreeAndNil(MyText);
  end;

  chkBaixa.Checked := false;

end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if chkUsuario.Checked then
    UsuarioToTblusu;

  Application.ProcessMessages;

  if chkGrupoVen.Checked then
    GrupoVendedorToTblgrv;

  Application.ProcessMessages;

  if chkVendedor.Checked then
    VendedorToTblven;

  Application.ProcessMessages;

  if chkCobrador.Checked then
    CobradorToTblcob;

  Application.ProcessMessages;

  if chkZona.Checked then
    ZonaToTblzon;

  Application.ProcessMessages;

  if chkRuaZona.Checked then
    RuazonaToTblrdz;

  Application.ProcessMessages;

  if chkMunicipio.Checked then
    MunicipioToTblcep ;

  Application.ProcessMessages;

  if chkAssinante.Checked then
    AssinanteToTblass ;

  Application.ProcessMessages;

  if chkAssinatura.Checked then
    AssinaturaToTblada ;

  Application.ProcessMessages;

  if chkBaixa.Checked then
    BaixaToTblbda ;

  ShowMessage('Ok, registros caregados');

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SQLConnSemanario.ExecuteDirect('delete from tblbda');
  SQLConnSemanario.ExecuteDirect('delete from tblada');
  SQLConnSemanario.ExecuteDirect('delete from tblass');

  //SQLConnSemanario.ExecuteDirect('delete from tblusu');

  SQLConnSemanario.ExecuteDirect('delete from tblven');
  SQLConnSemanario.ExecuteDirect('delete from tblgdv');

  SQLConnSemanario.ExecuteDirect('delete from tblcob');

  SQLConnSemanario.ExecuteDirect('delete from tblrdz');
  SQLConnSemanario.ExecuteDirect('delete from tblzon');

  SQLConnSemanario.ExecuteDirect('delete from tblcep');

  ShowMessage('OK, registros deletados.');
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i: integer;
begin
  Label1.Caption := '0';

  sqlSelTodasParcelas.Close;
  sqlSelTodasParcelas.Open;

  while not sqlSelTodasParcelas.Eof do
  begin
    sqlSelTblcpa.Close;
    sqlSelTblcpa.ParamByName('asscod').AsInteger := sqlSelTodasParcelasasscod.Value;
    sqlSelTblcpa.ParamByName('adacod').AsInteger := sqlSelTodasParcelasadacod.Value;
    sqlSelTblcpa.Open;

    i := 0;

    while not sqlSelTblcpa.Eof do
    begin
      inc(i);

      sqlUpdTblcpa.Close;
      sqlUpdTblcpa.ParamByName('cpanroparc').AsInteger := i;
      sqlUpdTblcpa.ParamByName('asscod').AsInteger := sqlSelTblcpaasscod.AsInteger;
      sqlUpdTblcpa.ParamByName('adacod').AsInteger := sqlSelTblcpaadacod.Value;
      sqlUpdTblcpa.ParamByName('cpadtvenc').AsDate := sqlSelTblcpacpadtvenc.Value;
      sqlUpdTblcpa.ExecSQL;

      sqlSelTblcpa.Next;
    end;

    Label1.Caption := inttostr( strtoint(Label1.Caption) + 1);
    Application.ProcessMessages;

    sqlSelTodasParcelas.Next;
  end;

  ShowMessage('fim');
end;

procedure TForm1.CobradorToTblcob;
begin
  SQLConnAssinates.Close;
  SQLConnSemanario.Close;

  cdsTblcob.Close;
  cdsTblcob.Open;

  cdsCobrador.Close;
  cdsCobrador.Open;

  while not cdsCobrador.Eof do
  begin
    cdsTblcob.Append;
    cdsTblcobcobcod.AsInteger := cdsCobradorid.AsInteger;
    cdsTblcobcobnome.AsString := cdsCobradordescricao.AsString;
    cdsTblcob.Post;

    cdsTblcob.ApplyUpdates(0);


    cdsCobrador.Next;
  end;

  chkCobrador.Checked := false;
end;

procedure TForm1.dspUsuarioUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(e.Message);
end;

function TForm1.GetIdRuaNaoEncontrada(IdZona: string): integer;
var
  SQL: String;
  rdzcod: Integer;
begin

  sqlRuaNaoEncontrada.Close;
  sqlRuaNaoEncontrada.ParamByName('zoncod').AsString := IdZona;
  sqlRuaNaoEncontrada.Open;

  if not sqlRuaNaoEncontrada.Eof then
  begin
    Result := sqlRuaNaoEncontradardzcod.AsInteger;
    exit;
  end;

  // se não encontrou registro, cria o registro.
  sqlMaxRdzcod.Close;
  sqlMaxRdzcod.Open;

  rdzcod := sqlMaxRdzcodrdzcod.AsInteger + 1;

  SQL := 'insert into tblrdz values (' + IntToStr(rdzcod) + ', "' + IdZona + '", "RUA NAO ENCONTRADA")';

  SQLConnSemanario.ExecuteDirect(SQL);

  Result := rdzcod;

end;

procedure TForm1.GrupoVendedorToTblgrv;
begin
  SQLConnAssinates.Close;
  SQLConnSemanario.Close;

  cdsTblgrv.Close;
  cdsTblgrv.Open;

  cdsGrupoVen.Close;
  cdsGrupoVen.Open;

  while not cdsGrupoVen.Eof do
  begin
    cdsTblgrv.Append;
    cdsTblgrvgdvcod.AsInteger := cdsGrupoVenid.AsInteger;
    cdsTblgrvgdvdescr.AsString := cdsGrupoVendescricao.AsString;
    cdsTblgrv.Post;

    cdsTblgrv.ApplyUpdates(0);


    cdsGrupoVen.Next;
  end;

  chkGrupoVen.Checked := false;

end;

procedure TForm1.MunicipioToTblcep;
begin
  SQLConnAssinates.Close;
  SQLConnSemanario.Close;

  cdsTblcep.Close;
  cdsTblcep.Open;

  cdsMunicipio.Close;
  cdsMunicipio.Open;

  while not cdsMunicipio.Eof do
  begin
    cdsTblcep.Append;
    cdsTblcepcepcep.AsString := cdsMunicipiocep.AsString;
    cdsTblcepcepmunicipio.AsString := cdsMunicipiodescricao.AsString;
    cdsTblcepcepeuf.AsString := cdsMunicipiouf.AsString;
    cdsTblcep.Post;

    cdsTblcep.ApplyUpdates(0);

    cdsMunicipio.Next;
  end;

  chkMunicipio.Checked := false;
end;

procedure TForm1.RuazonaToTblrdz;
begin
  SQLConnAssinates.Close;
  SQLConnSemanario.Close;

  cdsTblrdz.Close;
  cdsTblrdz.Open;

  cdsRuazona.Close;
  cdsRuazona.Open;

  while not cdsRuazona.Eof do
  begin
    cdsTblrdz.Append;
    cdsTblrdzrdzcod.AsInteger := cdsRuazonaid.AsInteger;
    cdsTblrdzzoncod.AsString := cdsRuazonaidZona.AsString;
    cdsTblrdzrdzender.AsString := cdsRuazonadescricao.AsString;
    cdsTblrdz.Post;

    cdsTblrdz.ApplyUpdates(0);

    cdsRuazona.Next;
  end;

  chkRuaZona.Checked := false;

end;

procedure TForm1.SQLConnAssinatesBeforeConnect(Sender: TObject);
begin
  SQLConnAssinates.Params.Values['Password'] := edtSenha.Text;
  SQLConnAssinates.Params.Values['HostName'] := edtHost.Text;
end;

procedure TForm1.SQLConnSemanarioBeforeConnect(Sender: TObject);
begin
  SQLConnSemanario.Params.Values['Password'] := edtSenha.Text;
  SQLConnSemanario.Params.Values['HostName'] := edtHost.Text;
end;

procedure TForm1.UsuarioToTblusu;
begin
  SQLConnAssinates.Close;
  SQLConnSemanario.Close;

  cdsTblusu.Close;
  cdsTblusu.Open;

  cdsUsuario.Close;
  cdsUsuario.Open;

  while not cdsUsuario.Eof do
  begin
    cdsTblusu.Append;
    cdsTblusuusucod.AsInteger := cdsUsuarioid.AsInteger;
    cdsTblusuusulogin.AsString := LowerCase(cdsUsuariologin.AsString);
    cdsTblusuususenha.AsString := MD5('123');
    cdsTblusuusunome.AsString := cdsUsuariodescricao.AsString;
    cdsTblusuusuativo.AsInteger := cdsUsuarioativo.AsInteger;
    cdsTblusu.Post;

    cdsTblusu.ApplyUpdates(0);


    cdsUsuario.Next;
  end;

  chkUsuario.Checked := false;
end;

procedure TForm1.VendedorToTblven;
begin
  SQLConnAssinates.Close;
  SQLConnSemanario.Close;

  cdsTblven.Close;
  cdsTblven.Open;

  cdsVendedor.Close;
  cdsVendedor.Open;

  while not cdsVendedor.Eof do
  begin
    cdsTblven.Append;
    cdsTblvenvencod.AsInteger := cdsVendedorid.AsInteger;
    cdsTblvenvennome.AsString := cdsVendedordescricao.AsString;
    cdsTblvengdvcod.AsInteger := cdsVendedoridGrupoVendedor.AsInteger;
    cdsTblvenvenfone.AsString := AjustarFone(cdsVendedorfoneContato.AsString);
    cdsTblven.Post;

    cdsTblven.ApplyUpdates(0);


    cdsVendedor.Next;
  end;

  chkVendedor.Checked := false;

end;

procedure TForm1.ZonaToTblzon;
begin
  SQLConnAssinates.Close;
  SQLConnSemanario.Close;

  cdsTblzon.Close;
  cdsTblzon.Open;

  cdsZona.Close;
  cdsZona.Open;

  while not cdsZona.Eof do
  begin
    cdsTblzon.Append;
    cdsTblzonzoncod.AsString := cdsZonaid.AsString;
    cdsTblzonzondescr.AsString := cdsZonadescricao.AsString;
    cdsTblzonzonentregador.AsString := cdsZonaentregador.AsString;
    cdsTblzon.Post;

    cdsTblzon.ApplyUpdates(0);


    cdsZona.Next;
  end;

  chkZona.Checked := false;
end;

end.
