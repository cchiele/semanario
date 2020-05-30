unit uDadosAssinantes;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Data.DB, Datasnap.DBClient,
  Datasnap.Provider, Data.SqlExpr, Vcl.Dialogs, System.UITypes,
  System.DateUtils, Data.DBXCommon, Math, System.Variants;

const
  NENHUM_ASSINANTE_SELECIONADA = 'Nenhum assinante está selecionado.';
  NENHUMA_ASSINATURA_SELECIONADA = 'Nenhuma assinatura está selecionada.';
  NENHUM_HISTORICO_SELECIONADO = 'Nenhum histórico está selecionado.';
  NENHUMA_BAIXA_SELECIONADA = 'Nenhuma baixa está selecionada.';

type
  TOperacao = (oNone, oInsert, oUpdate, oDelete);

type
  TdmDadosAssinantes = class(TDataModule)
    sqlTblass: TSQLDataSet;
    dspTblass: TDataSetProvider;
    cdsTblass: TClientDataSet;
    cdsTblassasscod: TIntegerField;
    cdsTblassasscpf: TStringField;
    cdsTblassassrazaosocial: TStringField;
    cdsTblassasscnpj: TStringField;
    cdsTblassassstatus: TIntegerField;
    cdsTblassassdtinativo: TDateField;
    cdsTblassassdtnasc: TDateField;
    cdsTblassrdzcod: TIntegerField;
    cdsTblassassnroent: TStringField;
    cdsTblassasscomplent: TStringField;
    cdsTblassassbairroent: TStringField;
    cdsTblasscepcepent: TStringField;
    cdsTblassassendercobr: TStringField;
    cdsTblassassfonecomer: TStringField;
    cdsTblassassfonecomerramal: TStringField;
    cdsTblassassfoneresid: TStringField;
    cdsTblassassfonefax: TStringField;
    cdsTblassassfonecelul: TStringField;
    cdsTblassvencod: TIntegerField;
    cdsTblasscobcod: TIntegerField;
    cdsTblassassimpretiq: TStringField;
    cdsTblassassemail: TStringField;
    cdsTblassassobs: TStringField;
    cdsTblassLookupStatus: TStringField;
    cdsTblassLookupImpretiq: TStringField;
    sqlTblcep: TSQLDataSet;
    sqlTblcepcepcep: TStringField;
    sqlTblcepcepmunicipio: TStringField;
    sqlTblcepcepeuf: TStringField;
    sqlRuaZona: TSQLDataSet;
    sqlRuaZonardzcod: TIntegerField;
    sqlRuaZonardzender: TStringField;
    sqlRuaZonazondescr: TStringField;
    sqlLookupVendedores: TSQLDataSet;
    dspLookupVendedores: TDataSetProvider;
    cdsLookupVendedores: TClientDataSet;
    cdsLookupVendedoresvencod: TIntegerField;
    cdsLookupVendedoresvennome: TStringField;
    cdsTblassLookupVencod: TStringField;
    sqlLookupCobradores: TSQLDataSet;
    dspLookupCobradores: TDataSetProvider;
    cdsLookupCobradores: TClientDataSet;
    cdsLookupCobradorescobcod: TIntegerField;
    cdsLookupCobradorescobnome: TStringField;
    cdsTblassLookupCobcod: TStringField;
    cdsTblassCalcFonecomerCompleto: TStringField;
    cdsTblassCalcImpretiq: TStringField;
    sqlTblada: TSQLDataSet;
    cdsTblada: TClientDataSet;
    cdsTbladaasscod: TIntegerField;
    cdsTbladaadacod: TIntegerField;
    cdsTbladaadatipo: TStringField;
    cdsTbladaadadtini: TDateField;
    cdsTbladaadadtvenc: TDateField;
    cdsTbladaadavl: TFloatField;
    cdsTbladaadavlpend: TFloatField;
    cdsTbladaadaobs: TStringField;
    cdsTbladaadacancel: TStringField;
    cdsTbladaCalcAdatipo: TStringField;
    cdsTbladaCalcAdacancel: TStringField;
    sqlTblbda: TSQLDataSet;
    cdsTblbda: TClientDataSet;
    cdsTblbdaasscod: TIntegerField;
    cdsTblbdaadacod: TIntegerField;
    cdsTblbdabdacod: TIntegerField;
    cdsTblbdausucod: TIntegerField;
    cdsTblbdabdadt: TDateField;
    cdsTblbdabdavl: TFloatField;
    sqlExisteCnpj: TSQLDataSet;
    sqlExisteCnpjasscnpj: TStringField;
    sqlExisteCnpjassnome: TStringField;
    sqlExisteCpf: TSQLDataSet;
    sqlExisteCpfasscpf: TStringField;
    sqlExisteCpfassnome: TStringField;
    sqlExisteCnpjasscod: TIntegerField;
    sqlExisteCpfasscod: TIntegerField;
    cdsTbladaLookupAdacancel: TStringField;
    cdsLookupTipoAssinatura: TClientDataSet;
    cdsLookupTipoAssinaturaCodigo: TStringField;
    cdsLookupTipoAssinaturaDescr: TStringField;
    cdsTbladaLookupAdatipo: TStringField;
    sqlMaxAdacod: TSQLDataSet;
    sqlMaxAdacodadacod: TIntegerField;
    sqlAssinaturaAnterior: TSQLDataSet;
    sqlAssinaturaAnteriorasscod: TIntegerField;
    sqlAssinaturaAnterioradacod: TIntegerField;
    sqlAssinaturaAnterioradatipo: TStringField;
    sqlAssinaturaAnterioradadtini: TDateField;
    sqlAssinaturaAnterioradadtvenc: TDateField;
    sqlAssinaturaAnterioradavl: TFloatField;
    sqlAssinaturaAnterioradavlpend: TFloatField;
    sqlAssinaturaAnterioradaobs: TStringField;
    sqlAssinaturaAnterioradacancel: TStringField;
    sqlTotalBaixas: TSQLDataSet;
    sqlTotalBaixasvltotbaixas: TFloatField;
    sqlMaxBdacod: TSQLDataSet;
    sqlMaxBdacodbdacod: TIntegerField;
    sqlPesquisaEndereco: TSQLDataSet;
    dspPesquisaEndereco: TDataSetProvider;
    cdsPesquisaEndereco: TClientDataSet;
    cdsPesquisaEnderecordzcod: TIntegerField;
    cdsPesquisaEnderecordzender: TStringField;
    cdsPesquisaEnderecozoncod: TStringField;
    cdsPesquisaEnderecozondescr: TStringField;
    sqlAssinaturasAuto: TSQLDataSet;
    dspAssinaturasAuto: TDataSetProvider;
    cdsAssinaturasAuto: TClientDataSet;
    cdsAssinaturasAutoasscod: TIntegerField;
    cdsAssinaturasAutoassnome: TStringField;
    cdsAssinaturasAutoadadtini: TDateField;
    cdsAssinaturasAutoadadtvenc: TDateField;
    sqlTblgaa: TSQLDataSet;
    dspTblgaa: TDataSetProvider;
    cdsTblgaa: TClientDataSet;
    cdsTblgaagaaanomes: TDateField;
    cdsTblgaagaadtgerauto: TDateField;
    cdsTblgaausucod: TIntegerField;
    dspTblada: TDataSetProvider;
    dspTblbda: TDataSetProvider;
    sqlTblbdaasscod: TIntegerField;
    sqlTblbdaadacod: TIntegerField;
    sqlTblbdabdacod: TIntegerField;
    sqlTblbdausucod: TIntegerField;
    sqlTblbdabdadt: TDateField;
    sqlTblbdabdavl: TFloatField;
    sqlTblbdausunome: TStringField;
    cdsTblbdausunome: TStringField;
    sqlFiltroZona: TSQLDataSet;
    dspFiltroZona: TDataSetProvider;
    cdsFiltroZona: TClientDataSet;
    cdsFiltroZonazoncod: TStringField;
    cdsFiltroZonazondescr: TStringField;
    cdsTblasszondescr: TStringField;
    sqlTblassasscod: TIntegerField;
    sqlTblassassnome: TStringField;
    sqlTblassasscpf: TStringField;
    sqlTblassassrazaosocial: TStringField;
    sqlTblassasscnpj: TStringField;
    sqlTblassassstatus: TIntegerField;
    sqlTblassassdtinativo: TDateField;
    sqlTblassassdtnasc: TDateField;
    sqlTblassrdzcod: TIntegerField;
    sqlTblassassnroent: TStringField;
    sqlTblassasscomplent: TStringField;
    sqlTblassassbairroent: TStringField;
    sqlTblasscepcepent: TStringField;
    sqlTblassassendercobr: TStringField;
    sqlTblassassfonecomer: TStringField;
    sqlTblassassfonecomerramal: TStringField;
    sqlTblassassfoneresid: TStringField;
    sqlTblassassfonefax: TStringField;
    sqlTblassassfonecelul: TStringField;
    sqlTblassvencod: TIntegerField;
    sqlTblasscobcod: TIntegerField;
    sqlTblassassimpretiq: TStringField;
    sqlTblassassemail: TStringField;
    sqlTblassassobs: TStringField;
    sqlTblasszondescr: TStringField;
    sqlExisteEndereco: TSQLDataSet;
    sqlExisteEnderecoasscod: TIntegerField;
    sqlExisteEnderecoassnome: TStringField;
    cdsTbladaadadtcancel: TDateField;
    sqlExisteProxAss: TSQLDataSet;
    sqlExisteProxAssnroreg: TLargeintField;
    sqlTblasszoncod: TStringField;
    cdsTblasszoncod: TStringField;
    cdsTblassCalcCodigoDescrZona: TStringField;
    sqlRuaZonazoncod: TStringField;
    cdsTblassCalcDescrStatus: TStringField;
    sqlBaixaRapida: TSQLDataSet;
    dspBaixaRapida: TDataSetProvider;
    cdsBaixaRapida: TClientDataSet;
    cdsBaixaRapidaasscod: TIntegerField;
    cdsBaixaRapidaassnome: TStringField;
    cdsBaixaRapidaadacod: TIntegerField;
    cdsBaixaRapidaadadtvenc: TDateField;
    cdsBaixaRapidaadavlpend: TFloatField;
    sqlTblassassdtalt: TDateField;
    sqlTblassusucodalt: TIntegerField;
    cdsTblassassdtalt: TDateField;
    cdsTblassusucodalt: TIntegerField;
    cdsTbladaadadtalt: TDateField;
    cdsTbladausucodalt: TIntegerField;
    cdsTblgaagaavlass: TFloatField;
    cdsTblgaagaanromes: TIntegerField;
    cdsTblgaagaacod: TIntegerField;
    sqlMaxGaacod: TSQLDataSet;
    sqlMaxGaacodgaacod: TLargeintField;
    cdsTbladagaacod: TIntegerField;
    cdsTblgaagaavennome: TStringField;
    sqlTblhas: TSQLDataSet;
    dspTblhas: TDataSetProvider;
    cdsTblhas: TClientDataSet;
    cdsTblhasasscod: TIntegerField;
    cdsTblhashasseg: TIntegerField;
    cdsTblhashasdt: TDateField;
    cdsTblhashasdescr: TMemoField;
    sqlMaxHasseg: TSQLDataSet;
    sqlMaxHasseghasseg: TIntegerField;
    cdsTblhasCalcHasdescr: TStringField;
    cdsTblassassnome: TStringField;
    cdsTbladaadavldesc: TFloatField;
    sqlTblcpa: TSQLDataSet;
    dspTblcpa: TDataSetProvider;
    cdsTblcpa: TClientDataSet;
    cdsTblcpaasscod: TIntegerField;
    cdsTblcpaadacod: TIntegerField;
    cdsTblcpacpadtvenc: TDateField;
    cdsTblcpacpadtemis: TDateField;
    cdsTblcpacpavl: TFloatField;
    sqlUpdateTblada: TSQLDataSet;
    sqlInsertTblada: TSQLDataSet;
    sqlDeleteTblcpa: TSQLDataSet;
    sqlInsertTblcpa: TSQLDataSet;
    sqlDeleteTblada: TSQLDataSet;
    sqlDeleteTblbda: TSQLDataSet;
    sqlUpdateTblbda: TSQLDataSet;
    sqlInsertTblbda: TSQLDataSet;
    sqlInsertTblgaa: TSQLDataSet;
    sqlInsertTblass: TSQLDataSet;
    sqlUpdateTblass: TSQLDataSet;
    sqlDeleteTblass: TSQLDataSet;
    sqlMaxGaaanomes: TSQLDataSet;
    sqlMaxGaaanomesgaaanomes: TDateField;
    sqlInsertTblhma: TSQLDataSet;
    sqlMaxAsscod: TSQLDataSet;
    sqlMaxAsscodasscod: TIntegerField;
    cdsTblcpaBkp: TClientDataSet;
    cdsTblcpaBkpcpadtvenc: TDateField;
    cdsTblcpaBkpcpavl: TFloatField;
    cdsTblcpacpanroparc: TIntegerField;
    cdsTbladaadacortesia: TStringField;
    cdsTbladaLookupAdacortesia: TStringField;
    cdsAssinaturasAutoadacortesia: TStringField;
    procedure cdsTblassNewRecord(DataSet: TDataSet);
    procedure cdsTblassCalcFields(DataSet: TDataSet);
    procedure cdsTbladaCalcFields(DataSet: TDataSet);
    procedure dspTblassUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure cdsTblasscepcepentValidate(Sender: TField);
    procedure cdsTblassBeforePost(DataSet: TDataSet);
    procedure cdsTblassAfterScroll(DataSet: TDataSet);
    procedure cdsTblassassnomeValidate(Sender: TField);
    procedure cdsTblassasscnpjValidate(Sender: TField);
    procedure cdsTblassasscpfValidate(Sender: TField);
    procedure cdsTblassassnroentValidate(Sender: TField);
    procedure cdsTblassassemailValidate(Sender: TField);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsTblassassstatusValidate(Sender: TField);
    procedure cdsTbladaNewRecord(DataSet: TDataSet);
    procedure cdsTbladaadadtvencValidate(Sender: TField);
    procedure cdsTbladaadavlValidate(Sender: TField);
    procedure cdsTblbdaNewRecord(DataSet: TDataSet);
    procedure cdsTblbdabdadtValidate(Sender: TField);
    procedure cdsTblbdabdavlValidate(Sender: TField);
    procedure cdsTblassrdzcodValidate(Sender: TField);
    procedure dspAssinaturasAutoUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspTblgaaUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspTbladaUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure dspTblbdaUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure cdsTbladaAfterScroll(DataSet: TDataSet);
    procedure cdsTblassBeforeOpen(DataSet: TDataSet);
    procedure cdsTbladaadacancelValidate(Sender: TField);
    procedure cdsTblbdaBeforePost(DataSet: TDataSet);
    procedure cdsTbladaadadtcancelValidate(Sender: TField);
    procedure cdsTblassassdtinativoValidate(Sender: TField);
    procedure dspTblhasUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure cdsTblhasNewRecord(DataSet: TDataSet);
    procedure cdsTblhashasdtValidate(Sender: TField);
    procedure cdsTblhashasdescrValidate(Sender: TField);
    procedure cdsTblhasCalcFields(DataSet: TDataSet);
    procedure cdsTbladaadavldescValidate(Sender: TField);
    procedure dspTblcpaUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure cdsTblcpacpavlValidate(Sender: TField);
    procedure cdsTblcpaNewRecord(DataSet: TDataSet);
    procedure cdsTbladaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    FOperacao: TOperacao;

    procedure AtualizarDadosAssinante(AOperacao: TOperacao; AAtualizarHistorico: Boolean);
    procedure AtualizarMudancaDadosAssinante(AOperacao: TOperacao);

    procedure AtualizarDadosAssinatura(AOperacao: TOperacao; AAtualizarHistorico: Boolean);
    procedure AtualizarMudancaDadosAssinatura(AOperacao: TOperacao);

    procedure AtualizarDadosBaixa(AOperacao: TOperacao; AAtualizarHistorico: Boolean);
    procedure AtualizarMudancaDadosBaixa(AOperacao: TOperacao);

    procedure AtualizarDadosHistorico(AOperacao: TOperacao);

    procedure AtualizarValorPendenteAssinatura(ANovoValorPendente: Double); overload;
    procedure AtualizarValorPendenteAssinatura; overload;
    procedure PosicionarAssinante(ACodigoAssinante: Integer; ACodigoAssinatura: Integer);
    procedure AtualizarTabelaTblhma(AAsscod, AUsucod: Integer; AHmadescr: String);

    function GetValorTotalBaixas(Aasscod, Aadacod: Integer; Abdacod: Integer = 0): Double;
    function GetDescricaoStatusAssinante(Aassstatus: Integer): String;

  public
    { Public declarations }
    procedure FiltrarEnderecos(AEnderecoZona: String);
    procedure FiltrarAssinantes(ACodigo: Integer = 0; ANomeAssinante: String = ''; AEndereco: String = ''; ANroEndereco: String = ''; ACodigoZona: String = ''; ADescrZona: String = ''; AStatus: Integer = -1);

    // Métodos referente ao Assinante
    procedure AdicionarAssinante;
    procedure EditarAssinante;
    procedure ExcluirAssinante;
    procedure CancelarManutencaoAssinante;
    procedure SalvarAssinante(AValidarDados: Boolean = true);

    // Métodos referente a Assinatura
    procedure AdicionarAssinatura;
    procedure EditarAssinatura;
    procedure ExcluirAssinatura;
    procedure CancelarManutencaoAssinatura;
    procedure SalvarAssinatura(AValidarDados: Boolean = true);
    procedure GerarCondicoesParcelas(AQtdeParcelas: Integer; APrimeiroVenc: TDate; AValorPagar: Double);

    // Métodos referente ao Histórico do Assinante
    procedure AdicionarHistorico;
    procedure EditarHistorico;
    procedure ExcluirHistorico;
    procedure CancelarManutencaoHistorico;
    procedure SalvarHistorico(AValidarDados: Boolean = true);

    // Métodos referente a Baixa da assinatura
    procedure AdicionarBaixa; overload;
    procedure AdicionarBaixa(ACodigoAssinante: integer; ACodigoAssinatura: Integer; ADataBaixa: TDate; AValorBaixa: Double); overload;
    procedure EditarBaixa;
    procedure ExcluirBaixa;
    procedure CancelarManutencaoBaixa;
    procedure SalvarBaixa(AValidarDados: Boolean = true);
    procedure FiltrarAssinantesBaixaRapida(ANomeAssinante: String = '');

    // Métodos referente a Renovação automática
    procedure RenovarAssinaturasAutomaticamente(AMes, AAno: Integer; AValorAssinatura: Double; ANroMesesAssinatura: Integer; AVencod: Integer; AVennome: String);

    function RetornaDataUltimaRenovacaoAuto: TDate;
    function GetDescricaoTipoAssinatura(Aadatipo: String): String;
  end;

var
  dmDadosAssinantes: TdmDadosAssinantes;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses uConexao, uDadosGlobal, uUsuario, uMensagem, uDadosCobradores, uDadosVendedores,
  uDadosZonasRuas;

{$R *.dfm}

procedure TdmDadosAssinantes.AdicionarAssinante;
begin
  if not cdsTblass.Active then
    FiltrarAssinantes;

  CancelarManutencaoAssinante;

  cdsTblass.Append;

  FOperacao := oInsert;
end;

procedure TdmDadosAssinantes.AdicionarAssinatura;
begin
  if not cdsTblass.Active then
    raise Exception.Create(NENHUM_ASSINANTE_SELECIONADA);

  if cdsTblass.RecordCount = 0 then
    raise Exception.Create(NENHUM_ASSINANTE_SELECIONADA);

  if not cdsTblada.Active then
    cdsTblada.Open;

  if not cdsTblcpa.Active then
    cdsTblcpa.Open;

  CancelarManutencaoAssinatura;

  cdsTblada.Insert;

  FOperacao := oInsert;
end;

procedure TdmDadosAssinantes.AdicionarBaixa(ACodigoAssinante,
  ACodigoAssinatura: Integer; ADataBaixa: TDate; AValorBaixa: Double);
begin
  FiltrarAssinantes(ACodigoAssinante);

  if cdsTblass.RecordCount = 0 then
    raise Exception.Create(NENHUM_ASSINANTE_SELECIONADA);

  PosicionarAssinante(ACodigoAssinante, ACodigoAssinatura);

  if cdsTblada.RecordCount = 0 then
    raise Exception.Create(NENHUMA_ASSINATURA_SELECIONADA);

  AdicionarBaixa;

  cdsTblbdabdadt.Value := ADataBaixa;
  cdsTblbdabdavl.Value := AValorBaixa;

  SalvarBaixa(true);
end;

procedure TdmDadosAssinantes.AdicionarHistorico;
begin
  if not cdsTblass.Active then
    raise Exception.Create(NENHUM_ASSINANTE_SELECIONADA);

  if cdsTblass.RecordCount = 0 then
    raise Exception.Create(NENHUM_ASSINANTE_SELECIONADA);

  if not cdsTblhas.Active then
    cdsTblhas.Open;

  CancelarManutencaoHistorico;

  cdsTblhas.Insert;

  FOperacao := oInsert;
end;

procedure TdmDadosAssinantes.AdicionarBaixa;
begin
  if not cdsTblada.Active then
    raise Exception.Create(NENHUMA_ASSINATURA_SELECIONADA);

  if cdsTblada.RecordCount = 0 then
    raise Exception.Create(NENHUMA_ASSINATURA_SELECIONADA);

  if not cdsTblbda.Active then
    cdsTblbda.Open;

  CancelarManutencaoBaixa;

  cdsTblbda.Insert;

  FOperacao := oInsert;
end;

procedure TdmDadosAssinantes.AtualizarValorPendenteAssinatura(
  ANovoValorPendente: Double);
begin
  // Coloca em estado de Edição caso não esteja.
  if cdsTblada.State in [dsBrowse] then
    cdsTblada.Edit;

  cdsTbladaadavlpend.Value := ANovoValorPendente;
end;

procedure TdmDadosAssinantes.AtualizarDadosAssinante(AOperacao: TOperacao; AAtualizarHistorico: Boolean);
var
  lAsscodNovo: Integer;
begin
  try
    if cdsTblass.State in [dsEdit, dsInsert] then
      cdsTblass.Post;

    case AOperacao of
      oNone:
      begin
        raise Exception.Create('Operação não definida para esta atualização.');
      end;

      oInsert:
      begin
        // Pega um novo número para o novo assinate.
        sqlMaxAsscod.Close;
        sqlMaxAsscod.Open;

        lAsscodNovo := sqlMaxAsscodasscod.Value + 1;

        // atualiza o novo número do CDS
        cdsTblass.Edit;
        cdsTblassasscod.Value := lAsscodNovo;
        cdsTblass.Post;

        sqlInsertTblass.Close;
        sqlInsertTblass.ParamByName('asscod').AsInteger := cdsTblassasscod.Value;
        sqlInsertTblass.ParamByName('assnome').AsAnsiString := cdsTblassassnome.Value;
        sqlInsertTblass.ParamByName('asscpf').AsAnsiString := cdsTblassasscpf.Value;
        sqlInsertTblass.ParamByName('assrazaosocial').AsAnsiString := cdsTblassassrazaosocial.Value;
        sqlInsertTblass.ParamByName('asscnpj').AsAnsiString := cdsTblassasscnpj.Value;
        sqlInsertTblass.ParamByName('assstatus').AsInteger := cdsTblassassstatus.Value;
        sqlInsertTblass.ParamByName('assdtinativo').AsDate := cdsTblassassdtinativo.Value;
        sqlInsertTblass.ParamByName('assdtnasc').AsDate := cdsTblassassdtnasc.Value;
        sqlInsertTblass.ParamByName('rdzcod').AsInteger := cdsTblassrdzcod.Value;
        sqlInsertTblass.ParamByName('assnroent').AsAnsiString := cdsTblassassnroent.Value;
        sqlInsertTblass.ParamByName('asscomplent').AsAnsiString := cdsTblassasscomplent.Value;
        sqlInsertTblass.ParamByName('assbairroent').AsAnsiString := cdsTblassassbairroent.Value;
        sqlInsertTblass.ParamByName('cepcepent').AsAnsiString := cdsTblasscepcepent.Value;
        sqlInsertTblass.ParamByName('assendercobr').AsAnsiString := cdsTblassassendercobr.Value;
        sqlInsertTblass.ParamByName('assfonecomer').AsAnsiString := cdsTblassassfonecomer.Value;
        sqlInsertTblass.ParamByName('assfonecomerramal').AsAnsiString := cdsTblassassfonecomerramal.Value;
        sqlInsertTblass.ParamByName('assfoneresid').AsAnsiString := cdsTblassassfoneresid.Value;
        sqlInsertTblass.ParamByName('assfonefax').AsAnsiString := cdsTblassassfonefax.Value;
        sqlInsertTblass.ParamByName('assfonecelul').AsAnsiString := cdsTblassassfonecelul.Value;
        sqlInsertTblass.ParamByName('vencod').AsInteger := cdsTblassvencod.Value;
        sqlInsertTblass.ParamByName('cobcod').AsInteger := cdsTblasscobcod.Value;
        sqlInsertTblass.ParamByName('assimpretiq').AsAnsiString := cdsTblassassimpretiq.Value;
        sqlInsertTblass.ParamByName('assemail').AsAnsiString := cdsTblassassemail.Value;
        sqlInsertTblass.ParamByName('assobs').AsAnsiString := cdsTblassassobs.Value;
        sqlInsertTblass.ParamByName('assdtalt').AsDate := cdsTblassassdtalt.Value;
        sqlInsertTblass.ParamByName('usucodalt').AsInteger := cdsTblassusucodalt.Value;
        sqlInsertTblass.ExecSQL;
      end;

      oUpdate:
      begin
        sqlUpdateTblass.Close;
        sqlUpdateTblass.ParamByName('asscod').AsInteger := cdsTblassasscod.Value;

        sqlUpdateTblass.ParamByName('assnome').AsAnsiString := cdsTblassassnome.Value;
        sqlUpdateTblass.ParamByName('asscpf').AsAnsiString := cdsTblassasscpf.Value;
        sqlUpdateTblass.ParamByName('assrazaosocial').AsAnsiString := cdsTblassassrazaosocial.Value;
        sqlUpdateTblass.ParamByName('asscnpj').AsString := cdsTblassasscnpj.Value;
        sqlUpdateTblass.ParamByName('assstatus').AsInteger := cdsTblassassstatus.Value;
        sqlUpdateTblass.ParamByName('assdtinativo').AsDate := cdsTblassassdtinativo.Value;

        if cdsTblassassdtinativo.Value = StrToDate('30/12/1899') then
          sqlUpdateTblass.ParamByName('assdtinativo').Clear
        else
          sqlUpdateTblass.ParamByName('assdtinativo').AsDate := cdsTblassassdtinativo.Value;

        sqlUpdateTblass.ParamByName('assdtnasc').AsDate := cdsTblassassdtnasc.Value;
        sqlUpdateTblass.ParamByName('rdzcod').AsInteger := cdsTblassrdzcod.Value;
        sqlUpdateTblass.ParamByName('assnroent').AsAnsiString := cdsTblassassnroent.Value;
        sqlUpdateTblass.ParamByName('asscomplent').AsAnsiString := cdsTblassasscomplent.Value;
        sqlUpdateTblass.ParamByName('assbairroent').AsAnsiString := cdsTblassassbairroent.Value;
        sqlUpdateTblass.ParamByName('cepcepent').AsAnsiString := cdsTblasscepcepent.Value;
        sqlUpdateTblass.ParamByName('assendercobr').AsAnsiString := cdsTblassassendercobr.Value;
        sqlUpdateTblass.ParamByName('assfonecomer').AsAnsiString := cdsTblassassfonecomer.Value;
        sqlUpdateTblass.ParamByName('assfonecomerramal').AsAnsiString := cdsTblassassfonecomerramal.Value;
        sqlUpdateTblass.ParamByName('assfoneresid').AsAnsiString := cdsTblassassfoneresid.Value;
        sqlUpdateTblass.ParamByName('assfonefax').AsAnsiString := cdsTblassassfonefax.Value;
        sqlUpdateTblass.ParamByName('assfonecelul').AsAnsiString := cdsTblassassfonecelul.Value;
        sqlUpdateTblass.ParamByName('vencod').AsInteger := cdsTblassvencod.Value;
        sqlUpdateTblass.ParamByName('cobcod').AsInteger := cdsTblasscobcod.Value;
        sqlUpdateTblass.ParamByName('assimpretiq').AsAnsiString := cdsTblassassimpretiq.Value;
        sqlUpdateTblass.ParamByName('assemail').AsAnsiString := cdsTblassassemail.Value;
        sqlUpdateTblass.ParamByName('assobs').AsAnsiString := cdsTblassassobs.Value;
        sqlUpdateTblass.ParamByName('assdtalt').AsDate := cdsTblassassdtalt.Value;
        sqlUpdateTblass.ParamByName('usucodalt').AsInteger := cdsTblassusucodalt.Value;
        sqlUpdateTblass.ExecSQL;
      end;

      oDelete:
      begin
        sqlDeleteTblass.Close;
        sqlDeleteTblass.ParamByName('asscod').AsInteger := cdsTblassasscod.Value;
        sqlDeleteTblass.ExecSQL;
      end;
    end;

    // Verifica se teve mudanças nos campos e atualiza a tabela de histórico de
    // mudanças do assinante
    if AAtualizarHistorico then
      AtualizarMudancaDadosAssinante(AOperacao);

  except
    on E: Exception do
    begin
      if pos('key violation', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Assinante informado já está cadastrada.')
      else if pos('duplicate entry', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Assinante informado já está cadastrada.')
      else if pos('foreign key constraint fails', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Não é possível excluir este Assinante, pois existem assinaturas/baixas cadastradas para este mesmo assinante.')
      else
        raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TdmDadosAssinantes.AtualizarDadosAssinatura(AOperacao: TOperacao; AAtualizarHistorico: Boolean);
var
  i: Integer;
begin

  try
    if cdsTblada.State in [dsEdit, dsInsert] then
      cdsTblada.Post;

    if AOperacao = oInsert then
    begin
      sqlInsertTblada.Close;
      sqlInsertTblada.ParamByName('asscod').AsInteger := cdsTbladaasscod.Value;
      sqlInsertTblada.ParamByName('adacod').AsInteger := cdsTbladaadacod.Value;
      sqlInsertTblada.ParamByName('adatipo').AsAnsiString := cdsTbladaadatipo.Value;
      sqlInsertTblada.ParamByName('adadtini').AsDate := cdsTbladaadadtini.Value;
      sqlInsertTblada.ParamByName('adadtvenc').AsDate := cdsTbladaadadtvenc.Value;
      sqlInsertTblada.ParamByName('adavl').AsFloat := cdsTbladaadavl.Value;
      sqlInsertTblada.ParamByName('adavldesc').AsFloat := cdsTbladaadavldesc.Value;
      sqlInsertTblada.ParamByName('adavlpend').AsFloat := cdsTbladaadavlpend.Value;

      if (cdsTbladaadaobs.IsNull) or (trim(cdsTbladaadaobs.Value) = '') then
        sqlInsertTblada.ParamByName('adaobs').Clear
      else
        sqlInsertTblada.ParamByName('adaobs').AsAnsiString := cdsTbladaadaobs.Value;

      sqlInsertTblada.ParamByName('adacancel').AsAnsiString := cdsTbladaadacancel.Value;

      if cdsTbladaadadtcancel.Value = StrToDate('30/12/1899') then
        sqlInsertTblada.ParamByName('adadtcancel').Clear
      else
        sqlInsertTblada.ParamByName('adadtcancel').AsDate := cdsTbladaadadtcancel.Value;

      sqlInsertTblada.ParamByName('adacortesia').AsAnsiString := cdsTbladaadacortesia.Value;

      if cdsTbladagaacod.IsNull then
        sqlInsertTblada.ParamByName('gaacod').clear
      else
        sqlInsertTblada.ParamByName('gaacod').AsInteger := cdsTbladagaacod.Value;

      sqlInsertTblada.ParamByName('adadtalt').AsDate := cdsTbladaadadtalt.Value;
      sqlInsertTblada.ParamByName('usucodalt').AsInteger := cdsTbladausucodalt.Value;
      sqlInsertTblada.ExecSQL;
    end;

    if AOperacao = oUpdate then
    begin
      sqlUpdateTblada.Close;
      sqlUpdateTblada.ParamByName('asscod').AsInteger := cdsTbladaasscod.Value;
      sqlUpdateTblada.ParamByName('adacod').AsInteger := cdsTbladaadacod.Value;

      sqlUpdateTblada.ParamByName('adatipo').AsAnsiString := cdsTbladaadatipo.Value;
      sqlUpdateTblada.ParamByName('adadtini').AsDate := cdsTbladaadadtini.Value;
      sqlUpdateTblada.ParamByName('adadtvenc').AsDate := cdsTbladaadadtvenc.Value;
      sqlUpdateTblada.ParamByName('adavl').AsFloat := cdsTbladaadavl.Value;
      sqlUpdateTblada.ParamByName('adavldesc').AsFloat := cdsTbladaadavldesc.Value;
      sqlUpdateTblada.ParamByName('adavlpend').AsFloat := cdsTbladaadavlpend.Value;

      if (cdsTbladaadaobs.IsNull) or (trim(cdsTbladaadaobs.Value) = '') then
        sqlUpdateTblada.ParamByName('adaobs').Clear
      else
        sqlUpdateTblada.ParamByName('adaobs').AsAnsiString := cdsTbladaadaobs.Value;

      sqlUpdateTblada.ParamByName('adacancel').AsAnsiString := cdsTbladaadacancel.Value;

      if cdsTbladaadadtcancel.Value = StrToDate('30/12/1899') then
        sqlUpdateTblada.ParamByName('adadtcancel').Clear
      else
        sqlUpdateTblada.ParamByName('adadtcancel').AsDate := cdsTbladaadadtcancel.Value;

      sqlUpdateTblada.ParamByName('adacortesia').AsAnsiString := cdsTbladaadacortesia.Value;

      if cdsTbladagaacod.IsNull then
        sqlUpdateTblada.ParamByName('gaacod').clear
      else
        sqlUpdateTblada.ParamByName('gaacod').AsInteger := cdsTbladagaacod.Value;

      sqlUpdateTblada.ParamByName('adadtalt').AsDate := cdsTbladaadadtalt.Value;
      sqlUpdateTblada.ParamByName('usucodalt').AsInteger := cdsTbladausucodalt.Value;
      sqlUpdateTblada.ExecSQL;
    end;

    if AOperacao = oDelete then
    begin
      sqlDeleteTblada.Close;
      sqlDeleteTblada.ParamByName('asscod').AsInteger := cdsTbladaasscod.Value;
      sqlDeleteTblada.ParamByName('adacod').AsInteger := cdsTbladaadacod.Value;
      sqlDeleteTblada.ExecSQL;
    end;

  except
    on E: Exception do
    begin
      if pos('key violation', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Assinatura informada já está cadastrada.')
      else if pos('duplicate entry', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Assinatura informada já está cadastrada.')
      else if pos('cannot delete or update a parent row: a foreign key constraint fails', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Não é possível excluir esta assinatura, pois existem baixas cadastradas para esta mesma assinatura.')
      else if pos('cannot delete master record with details', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Não é possível excluir esta assinatura, pois existem baixas cadastradas para esta mesma assinatura.')
      else
        raise Exception.Create(e.Message);
    end;
  end;

  try
    if cdsTblcpa.State in [dsEdit, dsInsert] then
      cdsTblcpa.Post;

    if AOperacao <> oDelete then
    begin
      sqlDeleteTblcpa.Close;
      sqlDeleteTblcpa.ParamByName('asscod').AsInteger := cdsTbladaasscod.Value;
      sqlDeleteTblcpa.ParamByName('adacod').AsInteger := cdsTbladaadacod.Value;
      sqlDeleteTblcpa.ExecSQL;

      i := 0;

      cdsTblcpa.First;
      while not cdsTblcpa.Eof do
      begin
        inc(i);

        sqlInsertTblcpa.Close;
        sqlInsertTblcpa.ParamByName('asscod').AsInteger := cdsTblcpaasscod.Value;
        sqlInsertTblcpa.ParamByName('adacod').AsInteger := cdsTblcpaadacod.Value;
        sqlInsertTblcpa.ParamByName('cpadtvenc').AsDate := cdsTblcpacpadtvenc.Value;
        sqlInsertTblcpa.ParamByName('cpadtemis').AsDate := cdsTblcpacpadtemis.Value;
        sqlInsertTblcpa.ParamByName('cpanroparc').AsInteger := i;
        sqlInsertTblcpa.ParamByName('cpavl').AsFloat := cdsTblcpacpavl.Value;
        sqlInsertTblcpa.ExecSQL;

        cdsTblcpa.Next;
      end;
    end;

  except
    on E: Exception do
    begin
      if pos('key violation', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Condição de pagamento já está cadastrada.')
      else if pos('duplicate entry', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Condição de pagamento já está cadastrada.')
      else if pos('cannot delete or update a parent row: a foreign key constraint fails', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Não é possível excluir esta condição de pagamento.')
      else
        raise Exception.Create(e.Message);
    end;
  end;

  if AAtualizarHistorico then
    AtualizarMudancaDadosAssinatura(AOperacao);

end;

procedure TdmDadosAssinantes.AtualizarDadosBaixa(AOperacao: TOperacao; AAtualizarHistorico: Boolean);
begin
  try
    if cdsTblbda.State in [dsEdit, dsInsert] then
      cdsTblbda.Post;

    if AOperacao = oInsert then
    begin
      sqlInsertTblbda.Close;
      sqlInsertTblbda.ParamByName('asscod').AsInteger := cdsTblbdaasscod.Value;
      sqlInsertTblbda.ParamByName('adacod').AsInteger := cdsTblbdaadacod.Value;
      sqlInsertTblbda.ParamByName('bdacod').AsInteger := cdsTblbdabdacod.Value;
      sqlInsertTblbda.ParamByName('usucod').AsInteger := cdsTblbdausucod.Value;
      sqlInsertTblbda.ParamByName('bdadt').AsDate := cdsTblbdabdadt.Value;
      sqlInsertTblbda.ParamByName('bdavl').AsFloat := cdsTblbdabdavl.Value;
      sqlInsertTblbda.ExecSQL;
    end;

    if AOperacao = oUpdate then
    begin
      sqlUpdateTblbda.Close;
      sqlUpdateTblbda.ParamByName('asscod').AsInteger := cdsTblbdaasscod.Value;
      sqlUpdateTblbda.ParamByName('adacod').AsInteger := cdsTblbdaadacod.Value;
      sqlUpdateTblbda.ParamByName('bdacod').AsInteger := cdsTblbdabdacod.Value;

      sqlUpdateTblbda.ParamByName('usucod').AsInteger := cdsTblbdausucod.Value;
      sqlUpdateTblbda.ParamByName('bdadt').AsDate := cdsTblbdabdadt.Value;
      sqlUpdateTblbda.ParamByName('bdavl').AsFloat := cdsTblbdabdavl.Value;
      sqlUpdateTblbda.ExecSQL;
    end;

    if AOperacao = oDelete then
    begin
      sqlDeleteTblbda.Close;
      sqlDeleteTblbda.ParamByName('asscod').AsInteger := cdsTblbdaasscod.Value;
      sqlDeleteTblbda.ParamByName('adacod').AsInteger := cdsTblbdaadacod.Value;
      sqlDeleteTblbda.ParamByName('bdacod').AsInteger := cdsTblbdabdacod.Value;
      sqlDeleteTblbda.ExecSQL;
    end;

    if AAtualizarHistorico then
      AtualizarMudancaDadosBaixa(AOperacao);

  except
    on E: Exception do
    begin
      if pos('key violation', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Baixa informada já está cadastrada.')
      else if pos('duplicate entry', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Baixa informada já está cadastrada.')
      else if pos('foreign key constraint fails', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Não é possível excluir esta baixa, pois esta baixa está relacionada a outras tabelas.')
      else
        raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TdmDadosAssinantes.AtualizarDadosHistorico(AOperacao: TOperacao);
begin
  try
    if cdsTblhas.State in [dsEdit, dsInsert] then
      cdsTblhas.Post;

    if AOperacao = oDelete then
      cdstblhas.Delete;

    cdsTblhas.ApplyUpdates(0);
  except
    on E: Exception do
    begin
      if pos('key violation', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Histórico digitado já está cadastrada.')
      else if pos('duplicate entry', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Histórico digitado já está cadastrada.')
      else if pos('cannot delete or update a parent row: a foreign key constraint fails', LowerCase(e.Message)) > 0 then
        raise Exception.Create('Não é possível excluir este histórico.')
      else
        raise Exception.Create(e.Message);
    end;
  end;
end;

procedure TdmDadosAssinantes.AtualizarMudancaDadosAssinante(
  AOperacao: TOperacao);
var
  Descr: String;
  cdsDelta: TClientDataSet;
  ldmDadosCobradores: TdmDadosCobradores;
  ldmDadosVendedores: TdmDadosVendedores;
  ldmDadosZonasRuas: TdmDadosZonasRuas;

  procedure AdicionarDescricao(AMsg: String);
  begin
    if Descr <> '' then
      Descr := Descr + sLineBreak;
    Descr := Descr + AMsg;
  end;

begin
  Descr := '';

  case AOperacao of
    oInsert:
    begin
      AdicionarDescricao('Novo assinante cadastrado, número ' + trim(cdsTblassasscod.AsString) + ' - ' + trim(cdsTblassassnome.AsAnsiString));
    end;

    oUpdate:
    begin
      if cdstblass.ChangeCount = 0 then
        Exit;

      cdsDelta := TClientDataSet.Create(Self);
      try
        cdsDelta.Close;
        cdsDelta.Data := cdstblass.Delta;
        cdsDelta.Open;

        // Localiza o registro original (usUnmodified) no Delta do CDS
        cdsDelta.First;
        if not cdsDelta.Locate('asscod', cdsTblassasscod.Value, []) then
          exit;

        // Inicia a comparação dos campos.
        // O cdsDelta com o registro original e o cdsTblass com o registro em
        // alteração pelo usuário.

        if cdsTblassassnome.Value <> cdsDelta.FieldByName('assnome').AsAnsiString then
          AdicionarDescricao('Alterou Nome de: ' + trim(cdsDelta.FieldByName('assnome').AsAnsiString) + ' para: ' + cdsTblassassnome.AsAnsiString);

        if cdsTblassasscpf.Value <> cdsDelta.FieldByName('asscpf').AsAnsiString then
          AdicionarDescricao('Alterou CPF de: ' + trim(cdsDelta.FieldByName('asscpf').AsAnsiString) + ' para: ' + cdsTblassasscpf.AsAnsiString);

        if cdsTblassassrazaosocial.Value <> cdsDelta.FieldByName('assrazaosocial').AsAnsiString then
          AdicionarDescricao('Alterou Razão Social de: ' + trim(cdsDelta.FieldByName('assrazaosocial').AsAnsiString) + ' para: ' + cdsTblassassrazaosocial.AsAnsiString);

        if cdsTblassasscnpj.Value <> cdsDelta.FieldByName('asscnpj').AsAnsiString then
          AdicionarDescricao('Alterou CNPJ de: ' + trim(cdsDelta.FieldByName('asscnpj').AsAnsiString) + ' para: ' + cdsTblassasscnpj.AsAnsiString);

        if cdsTblassassstatus.Value <> cdsDelta.FieldByName('assstatus').AsInteger then
          AdicionarDescricao('Alterou Status de: ' + GetDescricaoStatusAssinante(cdsDelta.FieldByName('assstatus').AsInteger) + ' para: ' + GetDescricaoStatusAssinante(cdsTblassassstatus.Value));

        if cdsTblassassdtinativo.Value <> cdsDelta.FieldByName('assdtinativo').AsDateTime then
          AdicionarDescricao('Alterou Data Inativo de: ' + dmDadosGlobal.FormatDateTimeToString('dd/mm/yyyy', cdsDelta.FieldByName('assdtinativo').AsDateTime) + ' para: ' + dmDadosGlobal.FormatDateTimeToString('dd/mm/yyyy', cdsTblassassdtinativo.Value));

        if cdsTblassassdtnasc.Value <> cdsDelta.FieldByName('assdtnasc').AsDateTime then
          AdicionarDescricao('Alterou Data de Nascimento de: ' + dmDadosGlobal.FormatDateTimeToString('dd/mm/yyyy', cdsDelta.FieldByName('assdtnasc').AsDateTime) + ' para: ' + dmDadosGlobal.FormatDateTimeToString('dd/mm/yyyy', cdsTblassassdtnasc.Value));

        if cdsTblassassimpretiq.Value <> cdsDelta.FieldByName('assimpretiq').AsAnsiString then
          AdicionarDescricao('Alterou Imprime Etiqueta de: ' + dmDadosGlobal.GetDescricaoSimNao(cdsDelta.FieldByName('assimpretiq').AsAnsiString) + ' para: ' + dmDadosGlobal.GetDescricaoSimNao(cdsTblassassimpretiq.AsAnsiString));

        if cdsTblasscobcod.Value <> cdsDelta.FieldByName('cobcod').AsInteger then
        begin
          ldmDadosCobradores := TdmDadosCobradores.Create(self);
          try
            AdicionarDescricao('Alterou Cobrador de: ' + trim(cdsDelta.FieldByName('cobcod').AsString) + '-' + ldmDadosCobradores.GetNomeCobrador(cdsDelta.FieldByName('cobcod').AsInteger) + ' para: ' + trim(cdsTblasscobcod.AsString) + '-' + ldmDadosCobradores.GetNomeCobrador(cdsTblasscobcod.Value));
          finally
            FreeAndNil(ldmDadosCobradores);
          end
        end;

        if cdsTblassvencod.Value <> cdsDelta.FieldByName('vencod').AsInteger then
        begin
          ldmDadosVendedores := TdmDadosVendedores.Create(self);
          try
            AdicionarDescricao('Alterou Vendedor de: ' + trim(cdsDelta.FieldByName('vencod').AsString) + '-' + ldmDadosVendedores.GetNomeVendedor(cdsDelta.FieldByName('vencod').AsInteger) + ' para: ' + trim(cdsTblassvencod.AsString) + '-' + ldmDadosVendedores.GetNomeVendedor(cdsTblassvencod.Value));
          finally
            FreeAndNil(ldmDadosVendedores);
          end
        end;

        // Compara a Rua e ao mesmo tempo o número da rua
        if (cdsTblassrdzcod.Value <> cdsDelta.FieldByName('rdzcod').AsInteger) or (cdsTblassassnroent.Value <> cdsDelta.FieldByName('assnroent').AsString) then
        begin
          ldmDadosZonasRuas := TdmDadosZonasRuas.Create(self);
          try
            AdicionarDescricao(
              'Alterou Endereço de: ' + ldmDadosZonasRuas.GetDescricaoRua(cdsDelta.FieldByName('rdzcod').AsInteger) +
              ', ' + trim(cdsDelta.FieldByName('assnroent').AsAnsiString) +
              ' (' + ldmDadosZonasRuas.GetDescricaoZona('', cdsDelta.FieldByName('rdzcod').AsInteger) +

              ') para: ' + ldmDadosZonasRuas.GetDescricaoRua(cdsTblassrdzcod.Value) +
              ', ' + trim(cdsTblassassnroent.Value) +
              ' (' + ldmDadosZonasRuas.GetDescricaoZona('', cdsTblassrdzcod.Value) + ')' );
          finally
            FreeAndNil(ldmDadosZonasRuas);
          end;
        end;

        if cdsTblassasscomplent.Value <> cdsDelta.FieldByName('asscomplent').AsAnsiString then
          AdicionarDescricao('Alterou Complemento do Endereço de: ' + trim(cdsDelta.FieldByName('asscomplent').AsAnsiString) + ' para: ' + trim(cdsTblassasscomplent.AsAnsiString));

        if cdsTblassassbairroent.Value <> cdsDelta.FieldByName('assbairroent').AsAnsiString then
          AdicionarDescricao('Alterou Bairro do Endereço de: ' + trim(cdsDelta.FieldByName('assbairroent').AsAnsiString) + ' para: ' + trim(cdsTblassassbairroent.AsAnsiString));

        if cdsTblasscepcepent.Value <> cdsDelta.FieldByName('cepcepent').AsAnsiString then
          AdicionarDescricao('Alterou CEP do Endereço de: ' + trim(cdsDelta.FieldByName('cepcepent').AsAnsiString) + ' para: ' + trim(cdsTblasscepcepent.AsAnsiString));

        if cdsTblassassendercobr.Value <> cdsDelta.FieldByName('assendercobr').AsAnsiString then
          AdicionarDescricao('Alterou Endereço de Cobrança de: ' + trim(cdsDelta.FieldByName('assendercobr').AsAnsiString) + ' para: ' + trim(cdsTblassassendercobr.AsAnsiString));

        if cdsTblassassemail.Value <> cdsDelta.FieldByName('assemail').AsAnsiString then
          AdicionarDescricao('Alterou E-mail de: ' + trim(cdsDelta.FieldByName('assemail').AsAnsiString) + ' para: ' + trim(cdsTblassassemail.AsAnsiString));

        if cdsTblassassobs.Value <> cdsDelta.FieldByName('assobs').AsAnsiString then
          AdicionarDescricao('Alterou Observação de: ' + trim(cdsDelta.FieldByName('assobs').AsAnsiString) + ' para: ' + trim(cdsTblassassobs.AsAnsiString));

        if (cdsTblassassfonecomer.Value <> cdsDelta.FieldByName('assfonecomer').AsAnsiString) or (cdsTblassassfonecomerramal.Value <> cdsDelta.FieldByName('assfonecomerramal').AsAnsiString) then
          AdicionarDescricao(
            'Alterou Telefone Comercial de: ' + trim(cdsDelta.FieldByName('assfonecomer').AsAnsiString) +
            '-' + trim(cdsDelta.FieldByName('assfonecomerramal').AsAnsiString) +
            ' para: ' + trim(cdsTblassassfonecomer.AsAnsiString) + '-' + trim(cdsTblassassfonecomerramal.AsAnsiString));

        if cdsTblassassfoneresid.Value <> cdsDelta.FieldByName('assfoneresid').AsAnsiString then
          AdicionarDescricao('Alterou Telefone Residencial de: ' + trim(cdsDelta.FieldByName('assfoneresid').AsAnsiString) + ' para: ' + trim(cdsTblassassfoneresid.AsAnsiString));

        if cdsTblassassfonefax.Value <> cdsDelta.FieldByName('assfonefax').AsAnsiString then
          AdicionarDescricao('Alterou Telefone Fax de: ' + trim(cdsDelta.FieldByName('assfonefax').AsAnsiString) + ' para: ' + trim(cdsTblassassfonefax.AsAnsiString));

        if cdsTblassassfonecelul.Value <> cdsDelta.FieldByName('assfonecelul').AsAnsiString then
          AdicionarDescricao('Alterou Telefone Celular de: ' + trim(cdsDelta.FieldByName('assfonecelul').AsAnsiString) + ' para: ' + trim(cdsTblassassfonecelul.AsAnsiString));

      finally
        FreeAndNil(cdsDelta);
      end;
    end;

  end;

  AtualizarTabelaTblhma(cdsTblassasscod.Value, dmUsuario.cdsUsuariousucod.Value, Descr);
end;

procedure TdmDadosAssinantes.AtualizarMudancaDadosAssinatura(
  AOperacao: TOperacao);
var
  Descr: String;
  DescrParcelas: String;
  cdsDelta: TClientDataSet;
  ParcelarAlteradas: Boolean;

  procedure AdicionarDescricao(AMsg: String);
  begin
    if Descr <> '' then
      Descr := Descr + sLineBreak;
    Descr := Descr + AMsg;
  end;

begin
  Descr := '';
  DescrParcelas := '';
  ParcelarAlteradas := false;

  case AOperacao of
    oInsert:
    begin
      AdicionarDescricao('Nova assinatura número ' + FormatFloat('00', cdsTbladaadacod.Value) + ' cadastrada.');
    end;

    oUpdate:
    begin
      if cdsTblada.ChangeCount <> 0 then
      begin
        cdsDelta := TClientDataSet.Create(Self);
        try
          cdsDelta.Close;
          cdsDelta.Data := cdsTblada.Delta;
          cdsDelta.Open;

          // Localiza o registro original (usUnmodified) no Delta do CDS
          cdsDelta.First;
          if not cdsDelta.Locate('asscod;adacod', VarArrayOf([cdsTbladaasscod.Value,cdsTbladaadacod.Value]), []) then
            exit;

          // Inicia a comparação dos campos.
          // O cdsDelta com o registro original e o cdsTblada com o registro em
          // alteração pelo usuário.

          if cdsTbladaadatipo.Value <> cdsDelta.FieldByName('adatipo').AsAnsiString then
            AdicionarDescricao('Alterou Tipo de Assinatura de: ' + GetDescricaoTipoAssinatura(cdsDelta.FieldByName('adatipo').AsAnsiString) + ' para: ' + GetDescricaoTipoAssinatura(cdsTbladaadatipo.AsAnsiString));

          if (cdsTbladaadadtini.Value <> cdsDelta.FieldByName('adadtini').AsDateTime) or (cdsTbladaadadtvenc.Value <> cdsDelta.FieldByName('adadtvenc').AsDateTime) then
            AdicionarDescricao(
              'Alterou Período da Assinatura de: ' + dmDadosGlobal.FormatDateTimeToString('dd/mm/yyyy', cdsDelta.FieldByName('adadtini').AsDateTime) +
              ' até ' + dmDadosGlobal.FormatDateTimeToString('dd/mm/yyyy', cdsDelta.FieldByName('adadtvenc').AsDateTime) +
              ' para: ' + dmDadosGlobal.FormatDateTimeToString('dd/mm/yyyy', cdsTbladaadadtini.Value) +
              ' até ' + dmDadosGlobal.FormatDateTimeToString('dd/mm/yyyy', cdsTbladaadadtvenc.Value));

          if cdsTbladaadavl.Value <> cdsDelta.FieldByName('adavl').AsFloat then
            AdicionarDescricao('Alterou Valor da Assinatura de: ' + FormatFloat('0.00', cdsDelta.FieldByName('adavl').AsFloat) + ' para: ' + FormatFloat('0.00', cdsTbladaadavl.AsFloat));

          if cdsTbladaadavldesc.Value <> cdsDelta.FieldByName('adavldesc').AsFloat then
            AdicionarDescricao('Alterou Valor de Desconto da Assinatura de: ' + FormatFloat('0.00', cdsDelta.FieldByName('adavldesc').AsFloat) + ' para: ' + FormatFloat('0.00', cdsTbladaadavldesc.AsFloat));

          if cdsTbladaadacancel.Value <> cdsDelta.FieldByName('adacancel').AsAnsiString then
            AdicionarDescricao('Alterou Indicador de Cancelamento de Assinatura de: ' + dmDadosGlobal.GetDescricaoSimNao(cdsDelta.FieldByName('adacancel').AsAnsiString) + ' para: ' + dmDadosGlobal.GetDescricaoSimNao(cdsTbladaadacancel.AsAnsiString));

          if cdsTbladaadadtcancel.Value <> cdsDelta.FieldByName('adadtcancel').AsDateTime then
            AdicionarDescricao('Alterou Data de Cancelamento da Assinatura de: ' + dmDadosGlobal.FormatDateTimeToString('dd/mm/yyyy', cdsDelta.FieldByName('adadtcancel').AsDateTime) + ' para: ' + dmDadosGlobal.FormatDateTimeToString('dd/mm/yyyy', cdsTbladaadadtcancel.Value));

          if cdsTbladaadacortesia.Value <> cdsDelta.FieldByName('adacortesia').AsAnsiString then
            AdicionarDescricao('Alterou Indicador de Cortesia de Assinatura de: ' + dmDadosGlobal.GetDescricaoSimNao(cdsDelta.FieldByName('adacortesia').AsAnsiString) + ' para: ' + dmDadosGlobal.GetDescricaoSimNao(cdsTbladaadacortesia.AsAnsiString));

          if cdsTbladaadaobs.Value <> cdsDelta.FieldByName('adaobs').AsAnsiString then
            AdicionarDescricao('Alterou Observação da Assinatura de: ' + trim(cdsDelta.FieldByName('adaobs').AsAnsiString) + ' para: ' + trim(cdsTbladaadaobs.AsAnsiString));
        finally
          FreeAndNil(cdsDelta);
        end;
      end;

      // -----------------------------------------------------------------------
      // Procedimento para verifiar se o array de parcelas também sofreu
      // alguma alteração.
      // -----------------------------------------------------------------------

      if cdsTblcpa.RecordCount <> cdsTblcpaBkp.RecordCount then
      begin
        ParcelarAlteradas := true;
      end
      else
      begin
        cdsTblcpa.First;
        cdsTblcpaBkp.First;

        while not cdsTblcpa.Eof do
        begin
          if (cdsTblcpacpadtvenc.Value <> cdsTblcpaBkpcpadtvenc.Value) or (cdsTblcpacpavl.Value <> cdsTblcpaBkpcpavl.Value) then
          begin
            ParcelarAlteradas := true;
            Break;
          end;

          cdsTblcpaBkp.Next;
          cdsTblcpa.Next;
        end;
      end;

      if ParcelarAlteradas then
      begin
        DescrParcelas := 'Alterou Condições pagto de:';

        cdsTblcpaBkp.First;
        while not cdsTblcpaBkp.Eof do
        begin
          DescrParcelas := DescrParcelas + ' ' +
            IntToStr(cdsTblcpaBkp.RecNo) + 'º-' +
            FormatDateTime('dd/mm/yyyy', cdsTblcpaBkpcpadtvenc.Value) + '-' +
            FormatFloat('0.00', cdsTblcpaBkpcpavl.Value);

          cdsTblcpaBkp.Next;
        end;

        DescrParcelas := trim(DescrParcelas) + ' para:';

        cdsTblcpa.First;
        while not cdsTblcpa.Eof do
        begin
          DescrParcelas := DescrParcelas + ' ' +
            IntToStr(cdsTblcpa.RecNo) + 'º-' +
            FormatDateTime('dd/mm/yyyy', cdsTblcpacpadtvenc.Value) + '-' +
            FormatFloat('0.00', cdsTblcpacpavl.Value);

          cdsTblcpa.Next;
        end;

        AdicionarDescricao(DescrParcelas);
      end;

      // A primeira linha sempre vai ser código da assinatura, pois a tabela tblhma
      // não tem o atributo do código da assinatura
      if Descr <> EmptyStr then
        Descr := 'Alteração referente a Assinatura Número: ' + FormatFloat('00', cdsTbladaadacod.Value)  + sLineBreak + Descr;
    end;

    oDelete:
    begin
      AdicionarDescricao('Excluída a assinatura número ' + trim(cdsTbladaadacod.AsString));
    end;

  end;

  AtualizarTabelaTblhma(cdsTblassasscod.Value, dmUsuario.cdsUsuariousucod.Value, Descr);
end;

procedure TdmDadosAssinantes.AtualizarMudancaDadosBaixa(AOperacao: TOperacao);
var
  Descr: String;
  cdsDelta: TClientDataSet;

  procedure AdicionarDescricao(AMsg: String);
  begin
    if Descr <> '' then
      Descr := Descr + sLineBreak;
    Descr := Descr + AMsg;
  end;

begin
  Descr := '';

  case AOperacao of
    oInsert:
    begin
      AdicionarDescricao(
        'Incluída Nova Baixa Código: ' + FormatFloat('00', cdsTblbdabdacod.Value) +
        ' - Data: ' + trim(cdsTblbdabdadt.AsString) +
        ' - Valor: ' + FormatFloat('#,##0.00', cdsTblbdabdavl.Value));
    end;

    oUpdate:
    begin
      if cdsTblbda.ChangeCount = 0 then
        Exit;

      cdsDelta := TClientDataSet.Create(Self);
      try
        cdsDelta.Close;
        cdsDelta.Data := cdsTblbda.Delta;
        cdsDelta.Open;

        // Localiza o registro original (usUnmodified) no Delta do CDS
        cdsDelta.First;
        if not cdsDelta.Locate('asscod;adacod;bdacod', VarArrayOf([cdsTblbdaasscod.Value, cdsTblbdaadacod.Value, cdsTblbdabdacod.Value]), []) then
          exit;

        // Inicia a comparação dos campos.
        // O cdsDelta com o registro original e o cdsTblbda com o registro em
        // alteração pelo usuário.

        if cdsTblbdabdadt.Value <> cdsDelta.FieldByName('bdadt').AsDateTime then
          AdicionarDescricao(
            'Alterou Data da Baixa de: ' + dmDadosGlobal.FormatDateTimeToString('dd/mm/yyyy', cdsDelta.FieldByName('bdadt').AsDateTime) +
            ' para: ' + dmDadosGlobal.FormatDateTimeToString('dd/mm/yyyy', cdsTblbdabdadt.Value));

        if cdsTblbdabdavl.Value <> cdsDelta.FieldByName('bdavl').AsFloat then
          AdicionarDescricao(
            'Alterou Valor da Baixa do dia ' + dmDadosGlobal.FormatDateTimeToString('dd/mm/yyyy', cdsTblbdabdadt.Value) +
            ' de: ' + FormatFloat('0.00', cdsDelta.FieldByName('bdavl').AsFloat) +
            ' para: ' + FormatFloat('0.00', cdsTblbdabdavl.AsFloat));
      finally
        FreeAndNil(cdsDelta);
      end;
    end;

    oDelete:
    begin
      AdicionarDescricao(
        'Excluída a Baixa Código: ' + FormatFloat('00', cdsTblbdabdacod.Value) +
        ' - Data: ' + trim(cdsTblbdabdadt.AsString) +
        ' - Valor: ' + FormatFloat('#,##0.00', cdsTblbdabdavl.Value));
    end;

  end;

  if Descr <> EmptyStr then
  begin
    // A primeira linha sempre vai ser código da assinatura, pois a tabela tblhma
    // não tem o atributo do código da assinatura
    Descr := 'Alteração referente a Assinatura Número: ' + FormatFloat('00', cdsTblbdaadacod.Value)  + sLineBreak + Descr;

    AtualizarTabelaTblhma(cdsTblassasscod.Value, dmUsuario.cdsUsuariousucod.Value, Descr);
  end;

end;

procedure TdmDadosAssinantes.AtualizarTabelaTblhma(AAsscod, AUsucod: Integer;
  AHmadescr: String);
var
  i: integer;
begin
  i := 0;

  if AHmadescr = EmptyStr then
    exit;

  while true do
  begin
    Inc(i);

    try
      sqlInsertTblhma.Close;
      sqlInsertTblhma.ParamByName('asscod').AsInteger := AAsscod;
      sqlInsertTblhma.ParamByName('usucod').AsInteger := AUsucod;
      sqlInsertTblhma.ParamByName('hmaseq').AsInteger := i;
      sqlInsertTblhma.ParamByName('hmadescr').AsAnsiString := AHmadescr;
      sqlInsertTblhma.ExecSQL;

      Break;
    except
      on E: Exception do
      begin
        if pos('duplicate entry', LowerCase(e.Message)) > 0 then
          Continue
        else
          raise;
      end;
    end;
  end;
end;

procedure TdmDadosAssinantes.AtualizarValorPendenteAssinatura;
begin
  // Coloca em estado de Edição caso não esteja.
  if cdsTblada.State in [dsBrowse] then
    cdsTblada.Edit;

  // Calcula o valor pendente
  cdsTbladaadavlpend.Value := cdsTbladaadavl.Value - GetValorTotalBaixas(cdsTbladaasscod.AsInteger, cdsTbladaadacod.AsInteger);

  if cdsTbladaadavlpend.Value < 0 then
    raise Exception.Create('Valor pendente não pode ser negativo.');
end;

procedure TdmDadosAssinantes.CancelarManutencaoAssinante;
begin
  if not cdsTblass.Active then
    exit;

  if cdsTblass.State in [dsEdit, dsInsert] then
    cdsTblass.Cancel;

  if cdsTblass.ChangeCount > 0 then
    cdsTblass.CancelUpdates;

  FOperacao := oNone;
end;

procedure TdmDadosAssinantes.CancelarManutencaoAssinatura;
begin
  if cdsTblcpa.State in [dsEdit, dsInsert] then
    cdsTblcpa.Cancel;

  if cdsTblcpa.ChangeCount > 0 then
    cdsTblcpa.CancelUpdates;

  // ---------------------------------------------------------------------------

  if cdsTblada.State in [dsEdit, dsInsert] then
    cdsTblada.Cancel;

  if cdsTblada.ChangeCount > 0 then
    cdsTblada.CancelUpdates;

  // ---------------------------------------------------------------------------

  CancelarManutencaoAssinante;

  FOperacao := oNone;
end;

procedure TdmDadosAssinantes.CancelarManutencaoBaixa;
begin
  if not cdsTblbda.Active then
    exit;

  if cdsTblbda.State in [dsEdit, dsInsert] then
    cdsTblbda.Cancel;

  if cdsTblbda.ChangeCount > 0 then
    cdsTblbda.CancelUpdates;

  // ---------------------------------------------------------------------------

  CancelarManutencaoAssinatura;

  FOperacao := oNone;
end;

procedure TdmDadosAssinantes.CancelarManutencaoHistorico;
begin
  if not cdsTblhas.Active then
    exit;

  if cdsTblhas.State in [dsEdit, dsInsert] then
    cdsTblhas.Cancel;

  if cdsTblhas.ChangeCount > 0 then
    cdsTblhas.CancelUpdates;

  FOperacao := oNone;
end;

procedure TdmDadosAssinantes.cdsTbladaadacancelValidate(Sender: TField);
begin
  if cdsTblada.Tag = 1 then
    exit;

  if cdsTbladaadacancel.AsString = 'S' then
    cdsTbladaadadtcancel.AsDateTime := dmDadosGlobal.GetDataHoraBanco
  else
    cdsTbladaadadtcancel.AsString := EmptyStr;
end;

procedure TdmDadosAssinantes.cdsTbladaadadtcancelValidate(Sender: TField);
begin
  if cdsTblada.Tag = 1 then
    exit;

  if cdsTbladaadacancel.AsString = 'S' then
    if cdsTbladaadadtcancel.AsDateTime = 0 then
      raise Exception.Create('Data de cancelamento da assinatura deve ser informada.');
end;

procedure TdmDadosAssinantes.cdsTbladaadadtvencValidate(Sender: TField);
begin
  if cdsTblada.Tag = 1 then
    exit;

  if cdsTbladaadadtvenc.AsDateTime <= cdsTbladaadadtini.AsDateTime then
    raise Exception.Create('Data de vencimento da assinatura não pode ser menor ou igual a data de início da assinatura.');
end;

procedure TdmDadosAssinantes.cdsTbladaadavldescValidate(Sender: TField);
begin
  if cdsTblada.Tag = 1 then
    exit;

  if cdsTbladaadavldesc.Value < 0 then
    raise Exception.Create('Valor de desconto não pode ser negativo.');
end;

procedure TdmDadosAssinantes.cdsTbladaadavlValidate(Sender: TField);
begin
  if cdsTblada.Tag = 1 then
    exit;

  if cdsTbladaadavl.Value <= 0 then
    raise Exception.Create('Valor da assinatura não pode ser menor ou igual a zero.');

  // Calcula o valor pendente
  AtualizarValorPendenteAssinatura;
end;

procedure TdmDadosAssinantes.cdsTbladaAfterScroll(DataSet: TDataSet);
begin
  sqlTblbda.Close;
  cdsTblbda.Close;
  sqlTblbda.ParamByName('asscod').AsInteger := cdsTblassasscod.Value;
  sqlTblbda.ParamByName('adacod').AsInteger := cdsTbladaadacod.Value;
  cdsTblbda.Open;

  sqlTblcpa.Close;
  cdsTblcpa.Close;
  sqlTblcpa.ParamByName('asscod').AsInteger := cdsTblassasscod.Value;
  sqlTblcpa.ParamByName('adacod').AsInteger := cdsTbladaadacod.Value;
  cdsTblcpa.Open;

  // Faz um backup do cdsTblcpa, para poder realizar comparações de mudança
  // nos campos no momento de salvar a assinatura.
  cdsTblcpaBkp.Close;
  cdsTblcpaBkp.CreateDataSet;
  cdsTblcpaBkp.Open;

  cdsTblcpa.First;
  while not cdsTblcpa.Eof do
  begin
    cdsTblcpaBkp.AppendRecord([cdsTblcpacpadtvenc.Value, cdsTblcpacpavl.Value]);

    cdsTblcpa.Next;
  end;
  cdsTblcpa.First;

end;

procedure TdmDadosAssinantes.cdsTbladaBeforePost(DataSet: TDataSet);
begin
  if cdsTbladaadavldesc.IsNull then
  cdsTbladaadavldesc.Value := 0;

  // Procedimento de gravação de Logs do último usuário que alterou o registro.
  cdsTbladaadadtalt.AsDateTime := dmDadosGlobal.GetDataHoraBanco;
  cdsTbladausucodalt.Value := dmUsuario.cdsUsuariousucod.Value;
end;

procedure TdmDadosAssinantes.cdsTbladaCalcFields(DataSet: TDataSet);
begin
  cdsTbladaCalcAdatipo.AsString := GetDescricaoTipoAssinatura(cdsTbladaadatipo.AsString);
  cdsTbladaCalcAdacancel.AsString := dmDadosGlobal.GetDescricaoSimNao(cdsTbladaadacancel.AsString);
end;

procedure TdmDadosAssinantes.cdsTbladaNewRecord(DataSet: TDataSet);
var
  CodigoAssinatura: Integer;
  NovaDataInicio: TDateTime;
  NovaDataVencimento: TDateTime;
begin
  cdsTblada.Tag := 1;
  try
    // Novo número para uma nova assinatura
    sqlMaxAdacod.Close;
    sqlMaxAdacod.ParamByName('asscod').AsInteger := cdsTblassasscod.AsInteger;
    sqlMaxAdacod.Open;

    CodigoAssinatura := sqlMaxAdacodadacod.AsInteger + 1;

    cdsTbladaasscod.AsInteger := cdsTblassasscod.AsInteger;
    cdsTbladaadacod.AsInteger := CodigoAssinatura;

    sqlAssinaturaAnterior.Close;
    sqlAssinaturaAnterior.ParamByName('asscod').AsInteger := cdsTblassasscod.AsInteger;
    sqlAssinaturaAnterior.ParamByName('adacod').AsInteger := CodigoAssinatura -1;
    sqlAssinaturaAnterior.Open;

    if not sqlAssinaturaAnterior.Eof then
    begin
      cdsTbladaadatipo.AsString := 'R';

      // Nova data de início da nova assinatura
      NovaDataInicio := sqlAssinaturaAnterioradadtvenc.AsDateTime;

      // Nova data de vencimento para a nova assinatura.
      NovaDataVencimento := IncYear(NovaDataInicio);
    end
    else
    begin
      cdsTbladaadatipo.AsString := 'A';

      // Nova data de início da nova assinatura
      NovaDataInicio := dmDadosGlobal.GetDataHoraBanco;

      // Nova data de vencimento para a nova assinatura.
      NovaDataVencimento := IncYear(NovaDataInicio);
    end;

    // Nova data de início da nova assinatura
    cdsTbladaadadtini.AsDateTime := NovaDataInicio;
    // Nova data de vencimento para a nova assinatura.
    cdsTbladaadadtvenc.AsDateTime := NovaDataVencimento;

    cdsTbladaadavl.Value := 0;
    cdsTbladaadavldesc.Value := 0;
    cdsTbladaadavlpend.Value := 0;
    cdsTbladaadacancel.AsString := 'N';
    cdsTbladaadacortesia.AsAnsiString := 'N';
  finally
    cdsTblada.Tag := 0;
  end;
end;

procedure TdmDadosAssinantes.cdsTblassAfterScroll(DataSet: TDataSet);
begin
  sqlRuaZona.Close;
  sqlRuaZona.ParamByName('rdzcod').AsInteger := cdsTblassrdzcod.AsInteger;
  sqlRuaZona.Open;

  sqlTblcep.Close;
  sqlTblcep.ParamByName('cepcepent').AsString := cdsTblasscepcepent.AsString;
  sqlTblcep.Open;

  // -------------

  sqlTblhas.Close;
  cdsTblhas.Close;
  sqlTblhas.ParamByName('asscod').AsInteger := cdsTblassasscod.Value;
  cdsTblhas.Open;

  cdsTblbda.Close;
  cdsTblcpa.Close;
  cdsTblcpaBkp.Close;

  sqlTblada.Close;
  cdsTblada.Close;
  sqlTblada.ParamByName('asscod').AsInteger := cdsTblassasscod.Value;
  cdsTblada.Open;
end;

procedure TdmDadosAssinantes.cdsTblassasscnpjValidate(Sender: TField);
begin
  if cdsTblass.Tag = 1 then
    exit;

  if (trim(cdsTblassasscnpj.Value) = '') or
    (trim(cdsTblassasscnpj.Value) = '.   .   /    -') then
  begin
    exit;
  end;

  dmDadosGlobal.ValidarCNPJ(cdsTblassasscnpj.AsString);

  sqlExisteCnpj.Close;
  sqlExisteCnpj.ParamByName('asscnpj').AsString := cdsTblassasscnpj.AsString;
  sqlExisteCnpj.Open;

  if not sqlExisteCnpj.Eof then
    if sqlExisteCnpjasscod.AsInteger <> cdsTblassasscod.AsInteger then
      raise Exception.Create('CNPJ ' + cdsTblassasscnpj.AsString + ' já cadastrado para o assinante ' + trim(sqlExisteCnpjassnome.AsString));
end;

procedure TdmDadosAssinantes.cdsTblassasscpfValidate(Sender: TField);
begin
  if cdsTblass.Tag = 1 then
    exit;

  if (trim(cdsTblassasscpf.Value) = '') or
    (trim(cdsTblassasscpf.Value) = '.   .   -') then
  begin
    exit;
  end;

  dmDadosGlobal.ValidarCPF(cdsTblassasscpf.AsString);

  sqlExisteCpf.Close;
  sqlExisteCpf.ParamByName('asscpf').AsString := cdsTblassasscpf.AsString;
  sqlExisteCpf.Open;

  if not sqlExisteCpf.Eof then
    if sqlExisteCpfasscod.AsInteger <> cdsTblassasscod.AsInteger then
      raise Exception.Create('CPF ' + cdsTblassasscpf.AsString + ' já cadastrado para o assinante ' + trim(sqlExisteCpfassnome.AsString));
end;

procedure TdmDadosAssinantes.cdsTblassassdtinativoValidate(Sender: TField);
begin
  if cdsTblass.Tag = 1 then
    exit;

  if cdsTblassassstatus.AsInteger = 1 then  // Inativo
    if cdsTblassassdtinativo.Value = 0 then
      raise Exception.Create('Data de inatividade deve ser informada.');
end;

procedure TdmDadosAssinantes.cdsTblassassemailValidate(Sender: TField);
begin
  if cdsTblass.Tag = 1 then
    exit;

  if cdsTblassassemail.AsString = EmptyStr then
    exit;

  if not dmDadosGlobal.ValidarEmail(cdsTblassassemail.AsString) then
    abort;
end;

procedure TdmDadosAssinantes.cdsTblassassnomeValidate(Sender: TField);
begin
  if cdsTblass.Tag = 1 then
    exit;

  if trim(cdsTblassassnome.AsString) = EmptyStr then
    raise Exception.Create('Nome do assinante não pode ser nulo.');
end;

procedure TdmDadosAssinantes.cdsTblassassnroentValidate(Sender: TField);
begin
  if cdsTblass.Tag = 1 then
    exit;

  if trim(cdsTblassassnroent.AsString) = EmptyStr then
    raise Exception.Create('Número do endereço de entrega não pode ser nulo.');

  if cdsTblass.Tag = 2 then
    exit;
    
  sqlExisteEndereco.Close;
  sqlExisteEndereco.ParamByName('rdzcod').AsInteger := cdsTblassrdzcod.AsInteger;
  sqlExisteEndereco.ParamByName('assnroent').AsString := trim(cdsTblassassnroent.AsString);
  sqlExisteEndereco.Open;

  if not sqlExisteEndereco.Eof then
    if MessageDlg('O endereço de entrega e número já está cadastrado para o assinante ' + trim(sqlExisteEnderecoassnome.AsString) + ', deseja cadastrar assim mesmo?', mtConfirmation,[mbYes, mbNo],0) <> mrYes then
      Abort;
end;

procedure TdmDadosAssinantes.cdsTblassassstatusValidate(Sender: TField);
begin
  if cdsTblass.Tag = 1 then
    exit;

  if cdsTblassassstatus.AsInteger = 0 then  // Ativo
    cdsTblassassdtinativo.AsString := EmptyStr
  else
    cdsTblassassdtinativo.Value := dmDadosGlobal.GetDataHoraBanco;
end;

procedure TdmDadosAssinantes.cdsTblassBeforeOpen(DataSet: TDataSet);
begin
  sqlRuaZona.Close;
  sqlTblcep.Close;

  cdsTblcpa.Close;
  cdsTblcpaBkp.Close;
  cdsTblbda.Close;
  cdsTblada.Close;
end;

procedure TdmDadosAssinantes.cdsTblassBeforePost(DataSet: TDataSet);
begin
  // Faço isso para que, caso não seja informado o CPF,
  // para não gravar na base de dados apenas os "   .   .   -  "
  if (trim(cdsTblassasscpf.AsString) = '.   .   -') then
    cdsTblassasscpf.AsString := '';

  // Faço isso para que, caso não seja informado o CNPJ,
  // para não gravar na base de dados apenas os "  .   .   /    -  "
  if (trim(cdsTblassasscnpj.AsString) = '.   .   /    -') then
    cdsTblassasscnpj.AsString := '';


  if trim(cdsTblassassdtnasc.AsString) = '/  /' then
    cdsTblassassdtnasc.AsString := '';

  // Faço isso para que, caso não seja informado os telefones,
  // para não gravar na base de dados apenas os "(  )"

  if trim(cdsTblassassfonecomer.AsString) = '(  )' then
    cdsTblassassfonecomer.AsString := '';

  if trim(cdsTblassassfoneresid.AsString) = '(  )' then
    cdsTblassassfoneresid.AsString := '';

  if trim(cdsTblassassfonefax.AsString) = '(  )' then
    cdsTblassassfonefax.AsString := '';

  if trim(cdsTblassassfonecelul.AsString) = '(  )' then
    cdsTblassassfonecelul.AsString := '';

  // Procedimento de gravação de Logs do último usuário que alterou o registro.
  cdsTblassassdtalt.AsDateTime := dmDadosGlobal.GetDataHoraBanco;
  cdsTblassusucodalt.Value := dmUsuario.cdsUsuariousucod.Value;
end;

procedure TdmDadosAssinantes.cdsTblassCalcFields(DataSet: TDataSet);
begin
  if DataSet.State <> dsInternalCalc then
    exit;

  if cdsTblassassfonecomer.AsString <> EmptyStr then
    cdsTblassCalcFonecomerCompleto.AsString := cdsTblassassfonecomer.AsString
  else
    cdsTblassCalcFonecomerCompleto.AsString := '(  )';

  if cdsTblassassfonecomerramal.AsString <> EmptyStr then
    cdsTblassCalcFonecomerCompleto.AsString := cdsTblassassfonecomer.AsString + ' R.' + trim(cdsTblassassfonecomerramal.AsString);

  if cdsTblassassimpretiq.AsString = 'S' then
    cdsTblassCalcImpretiq.AsString := 'Sim'
  else
    cdsTblassCalcImpretiq.AsString := 'Não';

  cdsTblassCalcCodigoDescrZona.AsString := trim(cdsTblasszoncod.AsString) + ' - ' + trim(cdsTblasszondescr.AsString);

  if cdsTblassassstatus.AsInteger = 0 then
    cdsTblassCalcDescrStatus.AsString := 'Ativo'
  else
    // Deixo 6 espaços em branco na frente devido a imagem que será colocada no DBGrid
    cdsTblassCalcDescrStatus.AsString := '      Inativo';

end;

procedure TdmDadosAssinantes.cdsTblasscepcepentValidate(Sender: TField);
begin
  if cdsTblass.Tag = 1 then
    exit;

  sqlTblcep.Close;

  // Validar CEP
  dmDadosGlobal.ValidarCEP(cdsTblasscepcepent.AsString);

  sqlTblcep.ParamByName('cepcepent').AsString := cdsTblasscepcepent.AsString;
  sqlTblcep.Open;

  if sqlTblcep.Eof then
    raise Exception.Create('CEP informado não está cadastrado.');
end;

procedure TdmDadosAssinantes.cdsTblassNewRecord(DataSet: TDataSet);
begin
  cdsTblass.Tag := 1;
  try
    cdsTblassasscod.Value := 0; // campo auto-incremento
    cdsTblassassstatus.AsInteger := 0;  // Ativo
    cdsTblasscepcepent.AsString := '95700-000'; // Bento

    cdsLookupVendedores.First;
    cdsTblassvencod.AsInteger := cdsLookupVendedoresvencod.AsInteger;

    cdsLookupCobradores.First;
    cdsTblasscobcod.AsInteger := cdsLookupCobradorescobcod.AsInteger;

    cdsTblassassimpretiq.AsString := 'S';
  finally
    cdsTblass.Tag := 0;
  end;
end;

procedure TdmDadosAssinantes.cdsTblassrdzcodValidate(Sender: TField);
begin
  if cdsTblass.Tag = 1 then
    exit;

  sqlRuaZona.Close;
  sqlRuaZona.ParamByName('rdzcod').AsInteger := cdsTblassrdzcod.Value;
  sqlRuaZona.Open;

  if sqlRuaZona.Eof then
    raise Exception.Create('Endereço informado não está cadastrado.');
end;

procedure TdmDadosAssinantes.cdsTblbdabdadtValidate(Sender: TField);
begin
  if cdsTblbda.Tag = 1 then
    exit;

  if cdsTblbdabdadt.AsDateTime = 0 then
    raise Exception.Create('Data da baixa deve ser informada.');
end;

procedure TdmDadosAssinantes.cdsTblbdabdavlValidate(Sender: TField);
var
  ValorPendente: Double;
  ValorTotalBaixas: Double;
begin
  if cdsTblbda.Tag = 1 then
    exit;

  ValorTotalBaixas := 0;
  ValorPendente := 0;

  if cdsTblbda.State in [dsInsert] then
  begin
    ValorTotalBaixas := GetValorTotalBaixas(cdsTblbdaasscod.AsInteger, cdsTblbdaadacod.AsInteger);

    ValorPendente := cdsTbladaadavl.Value - ValorTotalBaixas;
  end
  else
  begin
    ValorTotalBaixas := GetValorTotalBaixas(cdsTblbdaasscod.AsInteger, cdsTblbdaadacod.AsInteger, cdsTblbdabdacod.AsInteger);

    ValorTotalBaixas := ValorTotalBaixas + cdsTblbdabdavl.Value;

    ValorPendente := cdsTbladaadavl.Value - ValorTotalBaixas;
  end;

  try
    if cdsTblbdabdavl.Value <= 0 then
      raise Exception.Create('Valor da baixa não pode ser menor ou igual a zero.');

    if cdsTblbda.State in [dsInsert] then
    begin
      if cdsTblbdabdavl.Value > ValorPendente then
        raise Exception.Create('Valor da baixa não pode ser maior que o valor pendente da assinatura.');

      // Atualiza o valor pendente na assinatura
      AtualizarValorPendenteAssinatura(ValorPendente - cdsTblbdabdavl.Value);
    end
    else
    begin
      if ValorPendente < 0 then
        raise Exception.Create('Valor pendente da assinatura não pode ser negativo.');

      // Atualiza o valor pendente na assinatura
      AtualizarValorPendenteAssinatura(ValorPendente);
    end;
  except
    on E: Exception do
    begin
      AtualizarValorPendenteAssinatura(ValorPendente);
      raise;
    end;
  end;
end;

procedure TdmDadosAssinantes.cdsTblbdaBeforePost(DataSet: TDataSet);
begin
  // Grava o usuário que fez a manutenção
  cdsTblbdausucod.AsInteger := dmUsuario.cdsUsuariousucod.AsInteger;
end;

procedure TdmDadosAssinantes.cdsTblbdaNewRecord(DataSet: TDataSet);
begin
  cdsTblbda.Tag := 1;
  try
    cdsTblbdaasscod.Value := cdsTbladaasscod.Value;
    cdsTblbdaadacod.Value := cdsTbladaadacod.Value;

    sqlMaxBdacod.Close;
    sqlMaxBdacod.ParamByName('asscod').AsInteger := cdsTblbdaasscod.AsInteger;
    sqlMaxBdacod.ParamByName('adacod').AsInteger := cdsTblbdaadacod.AsInteger;
    sqlMaxBdacod.Open;

    cdsTblbdabdacod.AsInteger := sqlMaxBdacodbdacod.AsInteger + 1;
    cdsTblbdausucod.AsInteger := dmUsuario.cdsUsuariousucod.AsInteger;
    cdsTblbdabdadt.AsDateTime := dmDadosGlobal.GetDataHoraBanco;
    cdsTblbdabdavl.Value := 0;
  finally
    cdsTblbda.Tag := 0;
  end;
end;

procedure TdmDadosAssinantes.cdsTblcpacpavlValidate(Sender: TField);
begin
  if cdsTblcpa.Tag = 1 then
    exit;

  if cdsTblcpacpavl.Value <= 0 then
    raise Exception.Create('Valor da parcela não pode ser menor ou igual a zero.');
end;

procedure TdmDadosAssinantes.cdsTblcpaNewRecord(DataSet: TDataSet);
begin
  cdsTblcpa.Tag := 1;
  try
    cdsTblcpaasscod.Value := cdsTbladaasscod.Value;
    cdsTblcpaadacod.Value := cdsTbladaadacod.Value;
    cdsTblcpacpadtemis.Value := dmDadosGlobal.GetDataHoraBanco;
  finally
    cdsTblcpa.Tag := 0;
  end;
end;

procedure TdmDadosAssinantes.cdsTblhasCalcFields(DataSet: TDataSet);
begin
  cdsTblhasCalcHasdescr.Value := cdsTblhashasdescr.AsString;
end;

procedure TdmDadosAssinantes.cdsTblhashasdescrValidate(Sender: TField);
begin
  if cdsTblhas.Tag = 1 then
    exit;

  if trim(cdsTblhashasdescr.AsString) = '' then
    raise Exception.Create('Descrição deve ser informada.');
end;

procedure TdmDadosAssinantes.cdsTblhashasdtValidate(Sender: TField);
begin
  if cdsTblhas.Tag = 1 then
    exit;

  if trim(cdsTblhashasdt.AsString) = '' then
    raise Exception.Create('Data deve ser informada.');
end;

procedure TdmDadosAssinantes.cdsTblhasNewRecord(DataSet: TDataSet);
begin
  cdsTblhas.Tag := 1;
  try
    cdsTblhasasscod.Value := cdsTblassasscod.Value;

    sqlMaxHasseg.Close;
    sqlMaxHasseg.ParamByName('asscod').AsInteger := cdsTblassasscod.Value;
    sqlMaxHasseg.Open;

    cdsTblhashasseg.Value := sqlMaxHasseghasseg.AsInteger + 1;
    cdsTblhashasdt.Value := dmDadosGlobal.GetDataHoraBanco;
  finally
    cdsTblhas.Tag := 0;
  end;
end;

procedure TdmDadosAssinantes.DataModuleCreate(Sender: TObject);
begin
  FOperacao := oNone;

  cdsFiltroZona.Close;
  cdsFiltroZona.Open;
  cdsFiltroZona.First;

  cdsLookupTipoAssinatura.Close;
  cdsLookupTipoAssinatura.CreateDataSet;
  cdsLookupTipoAssinatura.Open;
  cdsLookupTipoAssinatura.AppendRecord(['A', 'Assinatura']);
  cdsLookupTipoAssinatura.AppendRecord(['R', 'Renovação']);
  cdsLookupTipoAssinatura.First;

  cdsLookupVendedores.Close;
  cdsLookupVendedores.Open;

  cdsLookupCobradores.Close;
  cdsLookupCobradores.Open;
end;

procedure TdmDadosAssinantes.dspTblhasUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(e.Message);
end;

procedure TdmDadosAssinantes.dspAssinaturasAutoUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(e.Message);
end;

procedure TdmDadosAssinantes.dspTbladaUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(e.Message);
end;

procedure TdmDadosAssinantes.dspTblassUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(e.Message);
end;

procedure TdmDadosAssinantes.dspTblbdaUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(e.Message);
end;

procedure TdmDadosAssinantes.dspTblcpaUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(e.Message);
end;

procedure TdmDadosAssinantes.dspTblgaaUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(e.Message);
end;

procedure TdmDadosAssinantes.EditarAssinante;
begin
  if not cdsTblass.Active then
    raise Exception.Create(NENHUM_ASSINANTE_SELECIONADA);

  if cdsTblass.RecordCount = 0 then
    raise Exception.Create(NENHUM_ASSINANTE_SELECIONADA);

  if cdsTblass.State in [dsBrowse] then
    cdsTblass.Edit;

  FOperacao := oUpdate;
end;

procedure TdmDadosAssinantes.EditarAssinatura;
begin
  if not cdsTblada.Active then
    raise Exception.Create(NENHUMA_ASSINATURA_SELECIONADA);

  if cdsTblada.RecordCount = 0 then
    raise Exception.Create(NENHUMA_ASSINATURA_SELECIONADA);

  CancelarManutencaoAssinatura;

  // Coloca o regitro principal em estado de edição.
  cdsTblada.Edit;

  FOperacao := oUpdate;
end;

procedure TdmDadosAssinantes.EditarBaixa;
begin
  if not cdsTblbda.Active then
    raise Exception.Create(NENHUMA_BAIXA_SELECIONADA);

  if cdsTblbda.RecordCount = 0 then
    raise Exception.Create(NENHUMA_BAIXA_SELECIONADA);

  cdsTblbda.Edit;

  FOperacao := oUpdate;
end;

procedure TdmDadosAssinantes.EditarHistorico;
begin
  if not cdsTblhas.Active then
    raise Exception.Create(NENHUM_HISTORICO_SELECIONADO);

  if cdsTblhas.RecordCount = 0 then
    raise Exception.Create(NENHUM_HISTORICO_SELECIONADO);

  if cdsTblhas.State in [dsBrowse] then
    cdsTblada.Edit;

  FOperacao := oUpdate;
end;

procedure TdmDadosAssinantes.ExcluirAssinante;
var
  Transaction: TDBXTransaction;
begin
  if not cdsTblass.Active then
    raise Exception.Create(NENHUM_ASSINANTE_SELECIONADA);

  if cdsTblass.RecordCount = 0 then
    raise Exception.Create(NENHUM_ASSINANTE_SELECIONADA);

  if MessageDlg('Deseja realmente excluir o assinante selecionada?', mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    exit;

  if dmConexao.SQLConnection.InTransaction then
    raise Exception.Create('Já existe alguma atualização de cadastro em andamento.');

  Transaction := nil;
  try
    Transaction := dmConexao.SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);

    // Grava os dados nas tabelas do Banco
    AtualizarDadosAssinante(oDelete, true);

    // Finaliza a transação
    dmConexao.SQLConnection.CommitFreeAndNil(Transaction);
  finally
    if Assigned(Transaction) then
      if dmConexao.SQLConnection.InTransaction then
        dmConexao.SQLConnection.RollbackFreeAndNil(Transaction);
  end;
end;

procedure TdmDadosAssinantes.ExcluirAssinatura;
var
  Transaction: TDBXTransaction;
begin
  if not cdsTblada.Active then
    raise Exception.Create(NENHUMA_ASSINATURA_SELECIONADA);

  if cdsTblada.RecordCount = 0 then
    raise Exception.Create(NENHUMA_ASSINATURA_SELECIONADA);

  if MessageDlg('Deseja realmente excluir a assinatura selecionada?', mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    exit;

  if dmConexao.SQLConnection.InTransaction then
    raise Exception.Create('Já existe alguma atualização de cadastro em andamento.');

  Transaction := nil;
  try
    Transaction := dmConexao.SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);

    // Grava os dados nas tabelas do Banco
    AtualizarDadosAssinatura(oDelete, true);

    // Finaliza a transação
    dmConexao.SQLConnection.CommitFreeAndNil(Transaction);
  finally
    if Assigned(Transaction) then
      if dmConexao.SQLConnection.InTransaction then
        dmConexao.SQLConnection.RollbackFreeAndNil(Transaction);
  end;
end;

procedure TdmDadosAssinantes.ExcluirBaixa;
var
  ValorPendente: Double;
  Transaction: TDBXTransaction;
begin
  if not cdsTblbda.Active then
    raise Exception.Create(NENHUMA_BAIXA_SELECIONADA);

  if cdsTblbda.RecordCount = 0 then
    raise Exception.Create(NENHUMA_BAIXA_SELECIONADA);

  if MessageDlg('Deseja realmente excluir a baixa selecionada?', mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    exit;

  if dmConexao.SQLConnection.InTransaction then
    raise Exception.Create('Já existe alguma atualização de cadastro em andamento.');

  FOperacao := oDelete;

  Transaction := nil;
  try
    Transaction := dmConexao.SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);

    // ---------------------------------------------------------------------------
    // Atualiza o novo valor pendente na assinatura do assinante
    // ---------------------------------------------------------------------------
    ValorPendente := cdsTbladaadavlpend.Value + cdsTblbdabdavl.Value;
    AtualizarValorPendenteAssinatura(ValorPendente);
    // ---------------------------------------------------------------------------

    // Grava os dados nas tabelas do Banco
    AtualizarDadosBaixa(oDelete, true);


    // Grava os dados nas tabelas do Banco
    // Chamo este método pois o valor pendente da assinatura pode ter mudado
    AtualizarDadosAssinatura(oUpdate, false);


    // Finaliza a transação
    dmConexao.SQLConnection.CommitFreeAndNil(Transaction);
  finally
    if Assigned(Transaction) then
      if dmConexao.SQLConnection.InTransaction then
        dmConexao.SQLConnection.RollbackFreeAndNil(Transaction);
  end;

end;

procedure TdmDadosAssinantes.ExcluirHistorico;
var
  Transaction: TDBXTransaction;
begin
  if not cdsTblhas.Active then
    raise Exception.Create(NENHUM_HISTORICO_SELECIONADO);

  if cdsTblhas.RecordCount = 0 then
    raise Exception.Create(NENHUM_HISTORICO_SELECIONADO);

  if MessageDlg('Deseja realmente excluir o histórico selecionado?', mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    exit;

  if dmConexao.SQLConnection.InTransaction then
    raise Exception.Create('Já existe alguma atualização de cadastro em andamento.');

  Transaction := nil;
  try
    Transaction := dmConexao.SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);

    // Grava os dados nas tabelas do Banco
    AtualizarDadosHistorico(oDelete);

    // Finaliza a transação
    dmConexao.SQLConnection.CommitFreeAndNil(Transaction);
  finally
    if Assigned(Transaction) then
      if dmConexao.SQLConnection.InTransaction then
        dmConexao.SQLConnection.RollbackFreeAndNil(Transaction);
  end;
end;

procedure TdmDadosAssinantes.FiltrarAssinantes(ACodigo: Integer; ANomeAssinante: String;
  AEndereco: String; ANroEndereco: String; ACodigoZona: String; ADescrZona: String;
  AStatus: Integer);
var
  SQL: String;
  CodigoAssinante: Integer;
  CodigoAssinatura: Integer;
begin
  CodigoAssinante := -1;
  CodigoAssinatura := -1;

  // Será utilizado para posicionar na lista
  if cdsTblass.Active then
  begin
    CodigoAssinante := cdsTblassasscod.AsInteger;

    // Será utilizado para posicionar na lista
    if cdsTblada.Active then
      CodigoAssinatura := cdsTbladaadacod.AsInteger
  end;


  // ---------------------------------------------------------------------------
  // Montagem do SQL da consulta
  // ---------------------------------------------------------------------------

  ANomeAssinante := trim(ANomeAssinante);
  AEndereco := trim(AEndereco);
  ANroEndereco := trim(ANroEndereco);
  ACodigoZona := trim(ACodigoZona);
  ADescrZona := trim(ADescrZona);

  SQL :=
    'select tblass.*, tblzon.zoncod, tblzon.zondescr ' +
    '  from tblass, tblrdz, tblzon ' +
    ' where tblass.rdzcod = tblrdz.rdzcod ' +
    '   and tblrdz.zoncod = tblzon.zoncod ';

  if (ACodigo = 0) and (ANomeAssinante = EmptyStr) and (AEndereco = EmptyStr) and (ANroEndereco = EmptyStr) and (ACodigoZona = EmptyStr) and (ADescrZona = EmptyStr) and (AStatus = -1) then
  begin
    SQL := SQL + ' and 1 = 2';
  end
  else
  begin
    if ACodigo > 0 then
      SQL := SQL + ' and tblass.asscod = ' + IntToStr(ACodigo);

    if ANomeAssinante <> EmptyStr then
      SQL := SQL + ' and tblass.assnome like "%' + ANomeAssinante + '%"';

    if AEndereco <> EmptyStr then
      SQL := SQL + ' and tblrdz.rdzender like "%' + AEndereco + '%"';

    if ANroEndereco <> EmptyStr then
      SQL := SQL + ' and tblass.assnroent like "%' + ANroEndereco + '%"';

    if ACodigoZona <> EmptyStr then
      SQL := SQL + ' and tblzon.zoncod like "%' + ACodigoZona + '%"';

    if ADescrZona <> EmptyStr then
      SQL := SQL + ' and tblzon.zondescr like "%' + ADescrZona + '%"';

    if AStatus <> -1 then
      SQL := SQL + ' and tblass.assstatus = ' + IntToStr(AStatus);
  end;

  SQL := SQL + ' order by tblass.assnome';

  sqlTblass.Close;
  sqlTblass.CommandText := SQL;

  cdsTblass.DisableControls;
  try
    cdsTblass.Close;
    cdsTblass.Open;

    // posiciona na lista
    PosicionarAssinante(CodigoAssinante, CodigoAssinatura);
  finally
    cdsTblass.EnableControls;
  end;
end;

procedure TdmDadosAssinantes.FiltrarAssinantesBaixaRapida(
  ANomeAssinante: String);
var
  SQL: String;
begin
  ANomeAssinante := trim(ANomeAssinante);

  if ANomeAssinante = EmptyStr then
  begin
    cdsBaixaRapida.Close;
    exit;
  end;

  // ---------------------------------------------------------------------------
  // Montagem do SQL
  // ---------------------------------------------------------------------------

  SQL :=
    'select tblass.asscod, tblass.assnome, ' +
    '       tblada.adacod, tblada.adadtvenc, tblada.adavlpend ' +
    '  from tblass, tblada ' +
    ' where tblass.asscod = tblada.asscod ' +
    '   and tblass.assstatus = 0 ' +
    '   and tblada.adacancel = "N" ' +
    '   and tblada.adavlpend > 0 ' +
    '   and tblass.assnome like "%' + ANomeAssinante + '%" ' +
    ' order by tblass.asscod, tblada.adacod desc ';

  sqlBaixaRapida.Close;
  sqlBaixaRapida.CommandText := SQL;
  cdsBaixaRapida.Close;
  cdsBaixaRapida.Open;
end;

procedure TdmDadosAssinantes.FiltrarEnderecos(AEnderecoZona: String);
var
  ListWord: TStringList;
  SQL: String;
  SQLWhere: String;
  i: Integer;
begin
  AEnderecoZona := trim(AEnderecoZona);

  if AEnderecoZona = EmptyStr then
  begin
    sqlPesquisaEndereco.Close;
    cdsPesquisaEndereco.Close;
    exit;
  end;

  SQLWhere := '';

  ListWord := TStringList.Create;
  try
    ExtractStrings([' '], [' '], pchar(AEnderecoZona), ListWord);

    for I := 0 to ListWord.Count -1 do
    begin
      if SQLWhere <> EmptyStr then
        SQLWhere := SQLWhere + ' and ';

      SQLWhere := SQLWhere +
        ' (tblrdz.rdzender    like ' + '''' + '%' + ListWord[i] + '%' + '''' +
        '  or tblzon.zoncod   like ' + '''' + '%' + ListWord[i] + '%' + '''' +
        '  or tblzon.zondescr like ' + '''' + '%' + ListWord[i] + '%' + '''' +
        ')';

    end;
  finally
    FreeAndNil(ListWord);
  end;

  SQL :=
    'select tblrdz.rdzcod, tblrdz.rdzender, tblzon.zoncod, tblzon.zondescr ' +
    '  from tblrdz, tblzon ' +
    ' where tblrdz.zoncod = tblzon.zoncod ' +
    '   and ' + SQLWhere +
    ' order by tblrdz.rdzender ';

  sqlPesquisaEndereco.Close;
  sqlPesquisaEndereco.CommandText := SQL;
  cdsPesquisaEndereco.Close;
  cdsPesquisaEndereco.Open;

end;

procedure TdmDadosAssinantes.RenovarAssinaturasAutomaticamente(AMes, AAno: Integer;
  AValorAssinatura: Double; ANroMesesAssinatura: Integer; AVencod: Integer; AVennome: String);
var
  DataGeracaoAuto: TDate;
  DataAtual: TDate;
  ContadorAssinaturas: Integer;

  DataIniNovoVenc: TDate;
  DataFimNovoVenc: TDate;

  DataIniNovoVencTeste: TDate;
  DataFimNovoVencTeste: TDate;

  Transaction: TDBXTransaction;
begin
  if dmConexao.SQLConnection.InTransaction then
    raise Exception.Create('Já existe alguma atualização de cadastro em andamento.');

  DataAtual := dmDadosGlobal.GetDataHoraBanco;
  DataGeracaoAuto := EncodeDate(AAno, AMes, 01);

  if AValorAssinatura <= 0 then
    raise Exception.Create('Valor da renovação não pode ser menor ou igual a zero.');

  if ANroMesesAssinatura <= 0 then
    raise Exception.Create('Número de meses não pode ser menor ou igual a zero.');

  // Verifica se já não foi realizada uma renovação automática para o período
  // informado.
  sqlTblgaa.Close;
  sqlTblgaa.ParamByName('gaaanomes').AsString := FormatDateTime('yyyy-mm-dd', DataGeracaoAuto);
  cdsTblgaa.Close;
  cdsTblgaa.Open;

  if cdsTblgaa.RecordCount > 0 then
    raise Exception.Create('Já foi gerado assinaturas automáticas para o Mês e Ano informado.');


  TfrmMensagem.MostrarMesagem('Aguarde, gerando renovação de assinaturas...');
  try
    ContadorAssinaturas := 0;

    Transaction := nil;
    try
      Transaction := dmConexao.SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);

      // Seleciona um novo número de lote da geração automática.
      sqlMaxGaacod.Close;
      sqlMaxGaacod.Open;

      // Atualiza a tabela que guarda o ano e mes da atualização automática
      sqlInsertTblgaa.Close;
      sqlInsertTblgaa.ParamByName('gaacod').AsInteger := sqlMaxGaacodgaacod.Value;
      sqlInsertTblgaa.ParamByName('gaaanomes').AsDate := DataGeracaoAuto;
      sqlInsertTblgaa.ParamByName('gaadtgerauto').AsDate := DataAtual;
      sqlInsertTblgaa.ParamByName('gaavennome').AsString := AVennome;
      sqlInsertTblgaa.ParamByName('gaavlass').AsFloat := AValorAssinatura;
      sqlInsertTblgaa.ParamByName('gaanromes').AsInteger := ANroMesesAssinatura;
      sqlInsertTblgaa.ParamByName('usucod').AsInteger := dmUsuario.cdsUsuariousucod.Value;
      sqlInsertTblgaa.ExecSQL;

      // Seleciona todas as assinaturas de assinantes ativos com o vencimento
      // no período informado e que estas assinaturas não estejam canceladas.
      sqlAssinaturasAuto.Close;
      sqlAssinaturasAuto.ParamByName('adadtini').AsString := FormatDateTime('yyyy-mm-dd', DataGeracaoAuto);
      sqlAssinaturasAuto.ParamByName('adadtfim').AsString := FormatDateTime('yyyy-mm-dd', EndOfTheMonth(DataGeracaoAuto));

      cdsAssinaturasAuto.Close;
      cdsAssinaturasAuto.Open;

      while not cdsAssinaturasAuto.Eof do
      begin
        // Nova data de vencimento da assinatura
        DataIniNovoVenc := cdsAssinaturasAutoadadtvenc.AsDateTime;
        DataFimNovoVenc := IncMonth(cdsAssinaturasAutoadadtvenc.AsDateTime, ANroMesesAssinatura);

        // Verificar se já não existe uma assinatura para o novo vencimento
        DataIniNovoVencTeste := EncodeDate(YearOf(DataFimNovoVenc), MonthOf(DataFimNovoVenc), 01);
        DataFimNovoVencTeste := EncodeDate(YearOf(DataFimNovoVenc), MonthOf(DataFimNovoVenc), DayOf(EndOfTheMonth(DataFimNovoVenc)));

        sqlExisteProxAss.Close;
        sqlExisteProxAss.ParamByName('asscod').AsInteger := cdsAssinaturasAutoasscod.AsInteger;
        sqlExisteProxAss.ParamByName('adadtvencini').AsString := FormatDateTime('yyyy-mm-dd', DataIniNovoVencTeste);
        sqlExisteProxAss.ParamByName('adadtvencfim').AsString := FormatDateTime('yyyy-mm-dd', DataFimNovoVencTeste);
        sqlExisteProxAss.Open;

        if sqlExisteProxAssnroreg.AsInteger > 0 then
        begin
          cdsAssinaturasAuto.Next;
          Continue;
        end;

        // Filtra e posiciona no assinante
        FiltrarAssinantes(cdsAssinaturasAutoasscod.Value);

        if cdsTblass.RecordCount = 0 then
        begin
          cdsAssinaturasAuto.Next;
          Continue;
        end;

        // ---------------------------------------------------------------------
        EditarAssinante;                      // Coloca o registro do Assinante em editção
        cdsTblassvencod.AsInteger := AVencod; // Altera o Vendedor com o seleciono
        AtualizarDadosAssinante(oUpdate, false);     // Salva as alterações no Assinante.
        // ---------------------------------------------------------------------

        // ---------------------------------------------------------------------
        AdicionarAssinatura;                                // Coloca a assinatura em estado de Insersão.
        cdsTbladaadadtini.AsDateTime := DataIniNovoVenc;    // Data de início da nova assinatura
        cdsTbladaadadtvenc.AsDateTime := DataFimNovoVenc;   // Data de vencimento da nova assinatura
        cdsTbladaadavl.Value := AValorAssinatura;
        cdsTbladaadavldesc.Value := 0;
        cdsTbladaadavlpend.Value := AValorAssinatura;
        cdsTbladaadacortesia.Value := cdsAssinaturasAutoadacortesia.Value;
        cdsTbladagaacod.Value := sqlMaxGaacodgaacod.Value;  // Novo nro. de lote
        cdsTbladaadadtalt.AsDateTime := dmDadosGlobal.GetDataHoraBanco;
        cdsTbladausucodalt.Value := dmUsuario.cdsUsuariousucod.Value;
        AtualizarDadosAssinatura(oInsert, False);                  // Salva a nova assinatura
        // ---------------------------------------------------------------------

        Inc(ContadorAssinaturas);

        cdsAssinaturasAuto.Next;
      end;

      // Finaliza a transação
      dmConexao.SQLConnection.CommitFreeAndNil(Transaction);

      TfrmMensagem.MostrarMesagem;

      MessageDlg('Foram geradas ' + FormatFloat('0', ContadorAssinaturas) + ' novas assinaturas para o Lote ' + sqlMaxGaacodgaacod.AsString, mtInformation, [mbOK], 0);
    except
      on E: Exception do
      begin
        TfrmMensagem.MostrarMesagem;

        if dmConexao.SQLConnection.InTransaction then
          dmConexao.SQLConnection.RollbackFreeAndNil(Transaction);

        CancelarManutencaoAssinatura;

        raise Exception.Create(e.Message);
      end;
    end;
  finally
    TfrmMensagem.MostrarMesagem;

    cdsTblgaa.Close;
    cdsAssinaturasAuto.Close;

    FiltrarAssinantes;
  end;

end;

function TdmDadosAssinantes.RetornaDataUltimaRenovacaoAuto: TDate;
begin
  sqlMaxGaaanomes.Close;
  sqlMaxGaaanomes.Open;

  Result := sqlMaxGaaanomesgaaanomes.Value;
end;

procedure TdmDadosAssinantes.GerarCondicoesParcelas(AQtdeParcelas: Integer;
  APrimeiroVenc: TDate; AValorPagar: Double);
var
  I: Integer;
  ValorParcela: Double;
  SomaParcelas: Double;
  Residuo: Double;
  DataVencimento: TDate;
begin
  i := 0;
  ValorParcela := 0;
  SomaParcelas := 0;
  Residuo := 0;
  DataVencimento := 0;

  if  AQtdeParcelas > 5 then
    raise Exception.Create('Quantidade de parcelas inválida, é permitido no máximo 5 parcelas.');

  if APrimeiroVenc = StrToDate('30/12/1899') then
    APrimeiroVenc := IncMonth(dmDadosGlobal.GetDataHoraBanco, 1);

  if AValorPagar <= 0 then
    raise Exception.Create('Valor Total da Assinatura não pode ser menor ou igual a zero.');

  if cdsTblcpa.State in [dsEdit, dsInsert] then
    cdsTblcpa.CancelUpdates;

  if cdsTblcpa.RecordCount > 0 then
  begin
    cdsTblcpa.First;
    Repeat
      cdsTblcpa.Delete;
    Until cdsTblcpa.Eof;
  end;

  if  AQtdeParcelas < 1 then
    exit;

  for I := 1 to AQtdeParcelas do
  begin
    if i = 1 then
      DataVencimento := APrimeiroVenc
    else
      DataVencimento := IncMonth(DataVencimento, 1);

    cdsTblcpa.Append;
    cdsTblcpaasscod.Value := cdsTbladaasscod.Value;
    cdsTblcpaadacod.Value := cdsTbladaadacod.Value;
    cdsTblcpacpadtvenc.Value := DataVencimento;
    cdsTblcpacpadtemis.Value := dmDadosGlobal.GetDataHoraBanco;
    cdsTblcpacpanroparc.Value := i;
    cdsTblcpacpavl.Value := SimpleRoundTo((AValorPagar / AQtdeParcelas), -2);
    cdsTblcpa.Post;

    SomaParcelas := SomaParcelas + cdsTblcpacpavl.Value;
  end;

  Residuo := AValorPagar - SomaParcelas;

  cdsTblcpa.Edit;
  cdsTblcpacpavl.Value := cdsTblcpacpavl.Value + Residuo;
  cdsTblcpa.Post;

  cdstblcpa.First;
end;

function TdmDadosAssinantes.GetDescricaoStatusAssinante(
  Aassstatus: Integer): String;
begin
  if Aassstatus = 0 then
    Result := 'Ativo'
  else
    Result := 'Inativo';
end;

function TdmDadosAssinantes.GetDescricaoTipoAssinatura(
  Aadatipo: String): String;
begin
  if UpperCase(Aadatipo) = 'A' then
    Result := 'Assinatura'
  else
    Result := 'Renovação';
end;

function TdmDadosAssinantes.GetValorTotalBaixas(Aasscod, Aadacod,
  Abdacod: Integer): Double;
var
  SQL: String;
begin
  SQL :=
    'select sum(bdavl) as vltotbaixas ' +
    '  from tblbda ' +
    ' where asscod = ' + IntToStr(Aasscod) +
    '   and adacod = ' + IntToStr(Aadacod);

  // Se for informado uma determinada baixa, isso significa que é
  // para desconsiderar a baixa informada no somatório;
  if Abdacod > 0 then
    SQL := SQL + ' and bdacod <> ' + IntToStr(Abdacod);

  sqlTotalBaixas.Close;
  sqlTotalBaixas.CommandText := SQL;
  sqlTotalBaixas.Open;

  Result := sqlTotalBaixasvltotbaixas.Value;
end;

procedure TdmDadosAssinantes.PosicionarAssinante(ACodigoAssinante: Integer; ACodigoAssinatura: Integer);
begin
  if not cdsTblass.Active then
    exit;

  if cdsTblass.RecordCount = 0 then
    exit;

  // Posicona o registro do Assinante na tela
  if not cdsTblass.Locate('asscod', ACodigoAssinante, []) then
  begin
    cdsTblass.First;
    exit;
  end;


  if not cdsTblada.Active then
    exit;

  if cdsTblada.RecordCount = 0 then
    exit;

  // Posicona o registro da Assinatura na tela
  if not cdsTblada.Locate('asscod;adacod', VarArrayOf([ACodigoAssinante,ACodigoAssinatura]), []) then
    cdsTblada.First;

  if cdsTblcpa.Active then
    cdsTblcpa.First;

  if cdsTblbda.Active then
    cdsTblbda.First;

end;

procedure TdmDadosAssinantes.SalvarAssinante(AValidarDados: Boolean);
var
  Transaction: TDBXTransaction;
begin
  if not cdsTblass.Active then
    raise Exception.Create(NENHUM_ASSINANTE_SELECIONADA);

  // ---------------------------------------------------------------------------
  // Aplica mais uma vez os métodos de validação
  // ---------------------------------------------------------------------------

  if AValidarDados then
  begin
    cdsTblasscepcepentValidate(cdsTblasscepcepent);
    cdsTblassassnomeValidate(cdsTblassassnome);
    cdsTblassasscnpjValidate(cdsTblassasscnpj);
    cdsTblassasscpfValidate(cdsTblassasscpf);
    cdsTblassassdtinativoValidate(cdsTblassassdtinativo);
    cdsTblassrdzcodValidate(cdsTblassrdzcod);

    cdsTblass.Tag := 2;
    try
      cdsTblassassnroentValidate(cdsTblassassnroent);
    finally
      cdsTblass.Tag := 0;
    end;

    cdsTblassassemailValidate(cdsTblassassemail);
  end;

  if dmConexao.SQLConnection.InTransaction then
    raise Exception.Create('Já existe alguma atualização de cadastro em andamento.');

  Transaction := nil;
  try
    Transaction := dmConexao.SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);

    // Grava os dados nas tabelas do Banco
    AtualizarDadosAssinante(FOperacao, true);

    // Finaliza a transação
    dmConexao.SQLConnection.CommitFreeAndNil(Transaction);
  finally
    if Assigned(Transaction) then
      if dmConexao.SQLConnection.InTransaction then
        dmConexao.SQLConnection.RollbackFreeAndNil(Transaction);
  end;

end;

procedure TdmDadosAssinantes.SalvarAssinatura(AValidarDados: Boolean);
var
  Transaction: TDBXTransaction;
begin
  if not cdsTblada.Active then
    raise Exception.Create(NENHUMA_ASSINATURA_SELECIONADA);

  // ---------------------------------------------------------------------------
  // Aplica mais uma vez os métodos de validação da Assinatura
  // ---------------------------------------------------------------------------
  if AValidarDados then
  begin
    cdsTbladaadadtvencValidate(cdsTbladaadadtvenc);
    cdsTbladaadavlValidate(cdsTbladaadavl);
    cdsTbladaadavldescValidate(cdsTbladaadavl);
    cdsTbladaadadtcancelValidate(cdsTbladaadadtcancel);
  end;
  // ---------------------------------------------------------------------------

  // ---------------------------------------------------------------------------
  // Procedimento de gravação de Logs do último usuário que alterou o registro.
  // ---------------------------------------------------------------------------
  if cdsTblada.State in [dsBrowse] then
    cdsTblada.Edit;

  cdsTbladaadadtalt.AsDateTime := dmDadosGlobal.GetDataHoraBanco;
  cdsTbladausucodalt.Value := dmUsuario.cdsUsuariousucod.Value;
  // ---------------------------------------------------------------------------

  if dmConexao.SQLConnection.InTransaction then
    raise Exception.Create('Já existe alguma atualização de cadastro em andamento.');

  Transaction := nil;
  try
    Transaction := dmConexao.SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);

    // Grava os dados nas tabelas do Banco
    AtualizarDadosAssinatura(FOperacao, True);

    // Finaliza a transação
    dmConexao.SQLConnection.CommitFreeAndNil(Transaction);
  finally
    if Assigned(Transaction) then
      if dmConexao.SQLConnection.InTransaction then
        dmConexao.SQLConnection.RollbackFreeAndNil(Transaction);
  end;
end;

procedure TdmDadosAssinantes.SalvarBaixa(AValidarDados: Boolean);
var
  Transaction: TDBXTransaction;
begin
  if not cdsTblbda.Active then
    raise Exception.Create(NENHUMA_BAIXA_SELECIONADA);

  // ---------------------------------------------------------------------------
  // Aplica mais uma vez os métodos de validação
  // ---------------------------------------------------------------------------
  if AValidarDados then
  begin
    cdsTblbdabdadtValidate(cdsTblbdabdadt);
    cdsTblbdabdavlValidate(cdsTblbdabdavl);
  end;

  if dmConexao.SQLConnection.InTransaction then
    raise Exception.Create('Já existe alguma atualização de cadastro em andamento.');

  Transaction := nil;
  try
    Transaction := dmConexao.SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);

    // Grava os dados nas tabelas do Banco
    AtualizarDadosBaixa(FOperacao, true);

    // Chamo este método aqui, pois o valor pendente da assinatura pode ter mudado.
    AtualizarDadosAssinatura(oUpdate, false);

    // Finaliza a transação
    dmConexao.SQLConnection.CommitFreeAndNil(Transaction);
  finally
    if Assigned(Transaction) then
      if dmConexao.SQLConnection.InTransaction then
        dmConexao.SQLConnection.RollbackFreeAndNil(Transaction);
  end;
end;

procedure TdmDadosAssinantes.SalvarHistorico(AValidarDados: Boolean);
var
  Transaction: TDBXTransaction;
begin
  if not cdsTblhas.Active then
    raise Exception.Create(NENHUM_HISTORICO_SELECIONADO);

  // ---------------------------------------------------------------------------
  // Aplica mais uma vez os métodos de validação
  // ---------------------------------------------------------------------------

  if AValidarDados then
  begin
    cdsTblhashasdtValidate(cdsTblhashasdt);
    cdsTblhashasdescrValidate(cdsTblhashasdescr);
  end;

  if dmConexao.SQLConnection.InTransaction then
    raise Exception.Create('Já existe alguma atualização de cadastro em andamento.');

  Transaction := nil;
  try
    Transaction := dmConexao.SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);

    // Grava os dados nas tabelas do Banco
    AtualizarDadosHistorico(FOperacao);

    // Finaliza a transação
    dmConexao.SQLConnection.CommitFreeAndNil(Transaction);
  finally
    if Assigned(Transaction) then
      if dmConexao.SQLConnection.InTransaction then
        dmConexao.SQLConnection.RollbackFreeAndNil(Transaction);
  end;

end;

end.
