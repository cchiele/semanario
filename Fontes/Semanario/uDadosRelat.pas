unit uDadosRelat;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient, Data.DB,
  Data.SqlExpr, frxDBSet, frxClass, Datasnap.Provider, frxExportCSV,
  frxExportRTF, frxExportPDF, Vcl.Dialogs, System.DateUtils, System.UITypes;

type
  TdmDadosRelat = class(TDataModule)
    sqlBaixas: TSQLDataSet;
    cdsCabecalhoRodape: TClientDataSet;
    cdsCabecalhoRodapeEmpresa: TStringField;
    cdsCabecalhoRodapeTitulo: TStringField;
    cdsCabecalhoRodapeSubTitulo: TStringField;
    cdsCabecalhoRodapeUsuario: TStringField;
    cdsCabecalhoRodapeVersao: TStringField;
    sqlGruposVendedores: TSQLDataSet;
    dspGruposVendedores: TDataSetProvider;
    cdsGruposVendedores: TClientDataSet;
    cdsGruposVendedoresgdvcod: TIntegerField;
    cdsGruposVendedoresgdvdescr: TStringField;
    cdsGruposVendedoresCalcSelecionado: TBooleanField;
    frxDsCabecalhoRodape: TfrxDBDataset;
    frxPDFExport: TfrxPDFExport;
    frxRTFExport: TfrxRTFExport;
    frxCSVExport: TfrxCSVExport;
    frxDsBaixas: TfrxDBDataset;
    frxBaixas: TfrxReport;
    dspBaixas: TDataSetProvider;
    cdsBaixas: TClientDataSet;
    cdsBaixasgdvcod: TIntegerField;
    cdsBaixasgdvdescr: TStringField;
    cdsBaixasasscod: TIntegerField;
    cdsBaixasassnome: TStringField;
    cdsBaixasbdadt: TDateField;
    cdsBaixasbdavl: TFloatField;
    sqlAssCanceladas: TSQLDataSet;
    dspAssCanceladas: TDataSetProvider;
    cdsAssCanceladas: TClientDataSet;
    frxDsAssCanceladas: TfrxDBDataset;
    frxAssCanceladas: TfrxReport;
    cdsAssCanceladasCalcEndereco: TStringField;
    sqlZonas: TSQLDataSet;
    dspZonas: TDataSetProvider;
    cdsZonas: TClientDataSet;
    cdsZonaszoncod: TStringField;
    cdsZonaszondescr: TStringField;
    cdsZonasCalcSelecionado: TBooleanField;
    cdsAssCanceladaszoncod: TStringField;
    cdsAssCanceladaszondescr: TStringField;
    cdsAssCanceladasasscod: TIntegerField;
    cdsAssCanceladasassnome: TStringField;
    cdsAssCanceladasadacod: TIntegerField;
    cdsAssCanceladasrdzender: TStringField;
    cdsAssCanceladasassnroent: TStringField;
    cdsAssCanceladasasscomplent: TStringField;
    cdsAssCanceladasadadtcancel: TDateField;
    cdsAssCanceladasadadtvenc: TDateField;
    cdsAssCanceladasadavlpend: TFloatField;
    sqlAssPendentes: TSQLDataSet;
    cdsBaixasadacod: TIntegerField;
    cdsAssPendentes: TClientDataSet;
    cdsAssPendentesasscod: TIntegerField;
    cdsAssPendentesassnome: TStringField;
    cdsAssPendentesadadtvenc: TDateField;
    cdsAssPendentesadavlpend: TFloatField;
    frxDsAssPendentes: TfrxDBDataset;
    frxAssPendentes: TfrxReport;
    cdsAssPendentesEndereco: TStringField;
    sqlVendedores: TSQLDataSet;
    dspVendedores: TDataSetProvider;
    cdsVendedores: TClientDataSet;
    cdsVendedoresvencod: TIntegerField;
    cdsVendedoresvennome: TStringField;
    cdsVendedoresCalcSelecionado: TBooleanField;
    sqlCobradores: TSQLDataSet;
    dspCobradores: TDataSetProvider;
    cdsCobradores: TClientDataSet;
    cdsCobradorescobcod: TIntegerField;
    cdsCobradorescobnome: TStringField;
    cdsCobradoresCalcSelecionado: TBooleanField;
    sqlAssRenovar: TSQLDataSet;
    dspAssRenovar: TDataSetProvider;
    cdsAssRenovar: TClientDataSet;
    cdsAssRenovarzoncod: TStringField;
    cdsAssRenovarzondescr: TStringField;
    cdsAssRenovarasscod: TIntegerField;
    cdsAssRenovarassnome: TStringField;
    cdsAssRenovarrdzender: TStringField;
    cdsAssRenovarassnroent: TStringField;
    cdsAssRenovaradadtvenc: TDateField;
    cdsAssRenovaradavl: TFloatField;
    frxDsAssRenovar: TfrxDBDataset;
    frxAssRenovar: TfrxReport;
    sqlUltRenovacaoAuto: TSQLDataSet;
    sqlUltRenovacaoAutogaaanomes: TDateField;
    sqlExisteRenovacao: TSQLDataSet;
    sqlExisteRenovacaonroreg: TLargeintField;
    frxRecibos: TfrxReport;
    cdsCabecalhoRodapeEndereco: TStringField;
    cdsCabecalhoRodapeCidadeEstado: TStringField;
    cdsCabecalhoRodapeCNPJ: TStringField;
    cdsAssRenovarasscomplent: TStringField;
    cdsAssRenovarcepmunicipio: TStringField;
    cdsAssRenovarcepeuf: TStringField;
    cdsAssRenovaradadtini: TDateField;
    cdsCabecalhoRodapeCidade: TStringField;
    sqlEtiquetasSql: TSQLDataSet;
    cdsEtiquetas: TClientDataSet;
    cdsEtiquetaszoncod: TStringField;
    cdsEtiquetasassnome: TStringField;
    cdsEtiquetasasscomplent: TStringField;
    frxDsEtiquetas: TfrxDBDataset;
    cdsAssCanceladasassfoneresid: TStringField;
    cdsAssCanceladasassfonecelul: TStringField;
    cdsAssCanceladasassfonecomer: TStringField;
    cdsAssCanceladasCalcTelefone: TStringField;
    cdsAssRenovarassfoneresid: TStringField;
    cdsAssRenovarassfonecelul: TStringField;
    cdsAssRenovarassfonecomer: TStringField;
    cdsAssRenovarCalcEnderecoCompleto: TStringField;
    cdsAssRenovarCalcTelefones: TStringField;
    sqlAssinantes: TSQLDataSet;
    cdsAssinantes: TClientDataSet;
    cdsAssinantestitulo_agrupador: TStringField;
    cdsAssinantescod_agrupador: TStringField;
    cdsAssinantesdescr_agrupador: TStringField;
    cdsAssinantesasscod: TIntegerField;
    cdsAssinantesassnome: TStringField;
    cdsAssinantesEnderecoCompleto: TStringField;
    frxDsAssinantes: TfrxDBDataset;
    frxAssinantes: TfrxReport;
    frxEtiquetaJato: TfrxReport;
    sqlUltAssinatura: TSQLDataSet;
    sqlUltAssinaturaadadtvenc: TDateField;
    sqlQtdeAssAtivos: TSQLDataSet;
    sqlQtdeAssAtivosQtdeAssAtivos: TLargeintField;
    cdsEtiquetasEndereco: TStringField;
    cdsEtiquetasAdadtvenc: TStringField;
    cdsEtiquetasPinta: TIntegerField;
    dspEtiquetasSql: TDataSetProvider;
    cdsEtiquetasSql: TClientDataSet;
    sqlCountAssAtivosZona: TSQLDataSet;
    sqlCountAssAtivosZonaQtdeAtivos: TLargeintField;
    cdsEtiquetasSqlasscod: TIntegerField;
    cdsEtiquetasSqlzoncod: TStringField;
    cdsEtiquetasSqlzondescr: TStringField;
    cdsEtiquetasSqlzonentregador: TStringField;
    cdsEtiquetasSqlassnome: TStringField;
    cdsEtiquetasSqlrdzender: TStringField;
    cdsEtiquetasSqlassnroent: TStringField;
    cdsEtiquetasSqlasscomplent: TStringField;
    cdsAssPendentesChave: TStringField;
    cdsAssPendenteszoncod: TStringField;
    cdsAssPendenteszondescr: TStringField;
    cdsCabecalhoRodapeFoneEmpresa: TStringField;
    cdsAssRenovarasscpf: TStringField;
    cdsAssRenovarasscnpj: TStringField;
    cdsAssRenovarassemail: TStringField;
    cdsAssRenovarCalcNomeCpf: TStringField;
    cdsAssRenovarCalcValorPorExtenso: TStringField;
    cdsAssRenovarCalcImpLinhaSep: TIntegerField;
    cdsBaixasadadtvenc: TDateField;
    frxEtiquetaArgox: TfrxReport;
    cdsAssRenovarassfonecomerramal: TStringField;
    cdsAssRenovarassbairroent: TStringField;
    cdsAssinantesrdzender: TStringField;
    cdsAssinantesassnroent_Inteiro: TIntegerField;
    cdsAssinantesassnroent_String: TStringField;
    cdsEtiquetasassnroent_Inteiro: TIntegerField;
    cdsEtiquetasassnroent_String: TStringField;
    cdsEtiquetasrdzender: TStringField;
    cdsEtiquetaszoncod_Ordem: TStringField;
    sqlAltCad: TSQLDataSet;
    dspAltCad: TDataSetProvider;
    cdsAltCad: TClientDataSet;
    frxDsAltCad: TfrxDBDataset;
    sqlUsuarios: TSQLDataSet;
    dspUsuarios: TDataSetProvider;
    cdsUsuarios: TClientDataSet;
    cdsUsuariosusunome: TStringField;
    sqlLotes: TSQLDataSet;
    dspLotes: TDataSetProvider;
    cdsLotes: TClientDataSet;
    cdsLotesCalcAnoMes: TStringField;
    cdsLotesCalcSelecionado: TBooleanField;
    cdsLotesgaacod: TIntegerField;
    cdsLotesgaadtgerauto: TDateField;
    cdsLotesgaaanomes: TDateField;
    cdsLotesgaavlass: TFloatField;
    cdsLotesgaanromes: TIntegerField;
    cdsLotesgaavennome: TStringField;
    cdsAssRenovaradavldesc: TFloatField;
    sqlCondPagto: TSQLDataSet;
    dspCondPagto: TDataSetProvider;
    cdsCondPagto: TClientDataSet;
    cdsCondPagtocobcod: TIntegerField;
    cdsCondPagtocobnome: TStringField;
    cdsCondPagtozoncod: TStringField;
    cdsCondPagtozondescr: TStringField;
    cdsCondPagtoasscod: TIntegerField;
    cdsCondPagtoassnome: TStringField;
    cdsCondPagtocpadtvenc: TDateField;
    cdsCondPagtoadavlpend: TFloatField;
    frxDsCondPagto: TfrxDBDataset;
    frxCondPagto: TfrxReport;
    cdsCondPagtocpavl: TFloatField;
    cdsCondPagtoAux: TClientDataSet;
    cdsCondPagtoAuxcobcod: TIntegerField;
    cdsCondPagtoAuxcobnome: TStringField;
    cdsCondPagtoAuxzondescr: TStringField;
    cdsCondPagtoAuxasscod: TIntegerField;
    cdsCondPagtoAuxassnome: TStringField;
    cdsCondPagtoAuxcpadtvenc: TDateField;
    cdsCondPagtoAuxcpavl: TFloatField;
    cdsCondPagtoAuxadavlpend: TFloatField;
    cdsCondPagtoAuxzoncod: TStringField;
    cdsEtiquetasasscomplent_Inteiro: TIntegerField;
    sqlHistAltAss: TSQLDataSet;
    dspHistAltAss: TDataSetProvider;
    cdsHistAltAss: TClientDataSet;
    cdsHistAltAsshmadthr: TSQLTimeStampField;
    cdsHistAltAssusunome: TStringField;
    cdsHistAltAsshmadescr: TMemoField;
    frxDsHistAltAss: TfrxDBDataset;
    frxHistAltAss: TfrxReport;
    cdsHistAltAssasscod: TIntegerField;
    cdsHistAltAssassnome: TStringField;
    cdsAltCadhmadthr: TSQLTimeStampField;
    cdsAltCadusunome: TStringField;
    cdsAltCadasscod: TIntegerField;
    cdsAltCadassnome: TStringField;
    cdsAltCadhmadescr: TMemoField;
    frxAltCad: TfrxReport;
    cdsUsuariosusucod: TLargeintField;
    cdsAltCadhmaseq: TIntegerField;
    cdsHistAltAsshmaseq: TIntegerField;
    cdsCondPagtoAuxadavldesc: TFloatField;
    cdsCondPagtoAuxcpanroparc: TIntegerField;
    cdsCondPagtoadavldesc: TFloatField;
    cdsCondPagtocpanroparc: TIntegerField;
    sqlDescontos: TSQLDataSet;
    dspDescontos: TDataSetProvider;
    cdsDescontos: TClientDataSet;
    frxDsDescontos: TfrxDBDataset;
    cdsDescontosasscod: TIntegerField;
    cdsDescontosassnome: TStringField;
    cdsDescontosadacod: TIntegerField;
    cdsDescontosadadtini: TDateField;
    cdsDescontosadadtvenc: TDateField;
    cdsDescontosadavl: TFloatField;
    cdsDescontosadavldesc: TFloatField;
    frxDescontos: TfrxReport;
    sqlCortesias: TSQLDataSet;
    dspCortesias: TDataSetProvider;
    cdsCortesias: TClientDataSet;
    frxDsCortesias: TfrxDBDataset;
    cdsCortesiasasscod: TIntegerField;
    cdsCortesiasassnome: TStringField;
    cdsCortesiasadacod: TIntegerField;
    cdsCortesiasadadtini: TDateField;
    cdsCortesiasadadtvenc: TDateField;
    cdsCortesiasadavl: TFloatField;
    frxCortesias: TfrxReport;
    procedure cdsAssCanceladasCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure cdsAssRenovarCalcFields(DataSet: TDataSet);
    procedure cdsEtiquetasCalcFields(DataSet: TDataSet);
    procedure cdsLotesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    function GetSqlWhereGruposVendedores: String;
    function GetSqlWhereZonas: String;
    function GetSqlWhereVendedores: String;
    function GetSqlWhereCobradores: String;

  public
    { Public declarations }
    Year: array[0..5] of integer;

    procedure MarcarDesmarcarGruposVendedores(AMarcar: Boolean);
    procedure MarcarDesmarcarZonas(AMarcar: Boolean);
    procedure MarcarDesmarcarVendedores(AMarcar: Boolean);
    procedure MarcarDesmarcarCobradores(AMarcar: Boolean);

    procedure CarregarUsuarios(AUsucodDefault: Integer; APermitirSelecaoNula: Boolean);
    procedure CarregarGruposVendedores;
    procedure CarregarVendedores;
    procedure CarregarCobradores;
    procedure CarregarZonas;
    procedure ConfigurarCabecalhoRodape(ATitulo, ASubTitulo: String);
    procedure CarregarLotesRenovacaoAuto;

    procedure ShowReportBaixas(ADataInicialBaixa, ADataFinalBaixa: TDateTime);
    procedure ShowReportAssinaturasCanceladas(ADataInicialCancel, ADataFinalCancel: TDateTime);
    procedure ShowReportAssinaturasRenovar(ATipoRelat: integer; ADataInicialVenc, ADataFinalVenc: TDateTime; ATipoSelecao: Integer; AGaacod: Integer; AGaaanomes: TDateTime; AGaanromes: Integer);
    procedure ShowReportAssinaturasPendentes(AAgrupamento: Integer; ADataInicialBaixa, ADataFinalBaixa: TDateTime);
    procedure ShowReportAssinantes(AAgrupamento: Integer);
    procedure ShowReportEtiquetas(ATipoImpressora: Integer; AConsideraImprimirEtiqueta: Boolean; ASomenteAssinatesAtivos: Boolean);
    procedure ShowReportAlteracaoCadastro(AUsucod: Integer; ADataInicialAlt, ADataFinalAlt: TDate);
    procedure ShowReportCondicoesPagto(ADataInicial, ADataFinal: TDate);
    procedure ShowReportAlteracoesAssinante(AAsscod: Integer; ADataInicialAlt, ADataFinalAlt: TDate);
    procedure ShowReportDescontos(ADataInicial, ADataFinal: TDate);
    procedure ShowReportCortesias;

    function GetUltAnoMesRenovacaoAuto: TDate;
  end;

var
  dmDadosRelat: TdmDadosRelat;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uConexao, uDadosEmpresa, uPrincipal, uUsuario, uDadosGlobal, uMensagem;

{$R *.dfm}

{ TdmDadosRelat }

procedure TdmDadosRelat.CarregarCobradores;
begin
  cdsCobradores.Close;
  cdsCobradores.Open;
  cdsCobradores.Filtered := false;
end;

procedure TdmDadosRelat.CarregarGruposVendedores;
begin
  cdsGruposVendedores.Close;
  cdsGruposVendedores.Open;
  cdsGruposVendedores.Filtered := false;
end;

procedure TdmDadosRelat.CarregarLotesRenovacaoAuto;
begin
  cdsLotes.Close;
  cdsLotes.Open;

  cdsLotes.First;

  // Por default deixa marcado sempre a última geração automáca realizada.
  cdsLotes.Edit;
  cdsLotesCalcSelecionado.Value := true;
  cdsLotes.Post;
end;

procedure TdmDadosRelat.CarregarUsuarios(AUsucodDefault: Integer; APermitirSelecaoNula: Boolean);
var
  SQL: String;
begin
  SQL :=
    'select usucod, usunome ' +
    '  from tblusu ' +
    ' UNION ' +
    'select distinct 0 as usucod, '' '' as usunome ' +
    '  from tblusu ';

  if APermitirSelecaoNula then
    SQL := SQL + ' where 1=1 '
  else
    SQL := SQL + ' where 1=2 ';

  SQL := SQL + ' order by usunome ';

  sqlUsuarios.Close;
  sqlUsuarios.CommandText := SQL;

  cdsUsuarios.Close;
  cdsUsuarios.Open;

  if not cdsUsuarios.Locate('usucod', AUsucodDefault, []) then
    cdsUsuarios.First;

end;

procedure TdmDadosRelat.CarregarVendedores;
begin
  cdsVendedores.Close;
  cdsVendedores.Open;
  cdsVendedores.Filtered := false;
end;

procedure TdmDadosRelat.CarregarZonas;
begin
  cdsZonas.Close;
  cdsZonas.Open;
  cdsZonas.Filtered := false;
end;

procedure TdmDadosRelat.cdsAssCanceladasCalcFields(DataSet: TDataSet);
begin
  // Faz a montagem do endereço completo do assinante
  cdsAssCanceladasCalcEndereco.AsString := dmDadosGlobal.FormataEndereco(cdsAssCanceladasrdzender.AsString, cdsAssCanceladasassnroent.AsString, cdsAssCanceladasasscomplent.AsString);

  // Telefone
  if (trim(cdsAssCanceladasCalcTelefone.AsString) = EmptyStr) and (trim(cdsAssCanceladasassfoneresid.AsString) <> EmptyStr) then
    cdsAssCanceladasCalcTelefone.AsString := trim(cdsAssCanceladasassfoneresid.AsString);

  if (trim(cdsAssCanceladasCalcTelefone.AsString) = EmptyStr) and (trim(cdsAssCanceladasassfonecelul.AsString) <> EmptyStr) then
    cdsAssCanceladasCalcTelefone.AsString := trim(cdsAssCanceladasassfonecelul.AsString);

  if (trim(cdsAssCanceladasCalcTelefone.AsString) = EmptyStr) and (trim(cdsAssCanceladasassfonecomer.AsString) <> EmptyStr) then
    cdsAssCanceladasCalcTelefone.AsString := trim(cdsAssCanceladasassfonecomer.AsString);

end;

procedure TdmDadosRelat.cdsAssRenovarCalcFields(DataSet: TDataSet);
var
  Telefones: String;
begin
  // Nome do assinante + Código Assinante + CPF ou CNPF
  cdsAssRenovarCalcNomeCpf.AsString := trim(cdsAssRenovarasscod.AsString);
  cdsAssRenovarCalcNomeCpf.AsString := cdsAssRenovarCalcNomeCpf.AsString + ' - ' + trim(cdsAssRenovarassnome.AsString);

  if ((cdsAssRenovarasscpf.AsString) <> EmptyStr) or ((cdsAssRenovarasscnpj.AsString) <> EmptyStr) then
  begin
    if trim(cdsAssRenovarasscnpj.AsString) <> EmptyStr then
      cdsAssRenovarCalcNomeCpf.AsString := cdsAssRenovarCalcNomeCpf.AsString + ' - CNPJ: ' + cdsAssRenovarasscnpj.AsString
    else
      if trim(cdsAssRenovarasscpf.AsString) <> EmptyStr then
        cdsAssRenovarCalcNomeCpf.AsString := cdsAssRenovarCalcNomeCpf.AsString + ' - CPF: ' + cdsAssRenovarasscpf.AsString;
  end;

  // Endereço completo
  cdsAssRenovarCalcEnderecoCompleto.AsString := dmDadosGlobal.FormataEndereco(cdsAssRenovarrdzender.AsString, cdsAssRenovarassnroent.AsString, cdsAssRenovarasscomplent.AsString);

  // ---------------------------------------------------------------------------
  // Concatena os telfones residencial e celular do assinante para mostrar no recibo.
  // ---------------------------------------------------------------------------

  if trim(cdsAssRenovarassfoneresid.AsString) <> EmptyStr then
    Telefones := trim(cdsAssRenovarassfoneresid.AsString);

  if trim(cdsAssRenovarassfonecelul.AsString) <> EmptyStr then
    if Telefones = EmptyStr then
      Telefones := trim(cdsAssRenovarassfonecelul.AsString)
    else
      Telefones := Telefones + ', ' + trim(cdsAssRenovarassfonecelul.AsString);

  if trim(cdsAssRenovarassfonecomer.AsString) <> EmptyStr then
  begin
    if Telefones = EmptyStr then
      Telefones := trim(cdsAssRenovarassfonecomer.AsString)
    else
      Telefones := Telefones + ', ' + trim(cdsAssRenovarassfonecomer.AsString);

    if trim(cdsAssRenovarassfonecomerramal.AsString) <> EmptyStr then
      Telefones := Telefones + ' r.' + trim(cdsAssRenovarassfonecomerramal.AsString);
  end;

  cdsAssRenovarCalcTelefones.AsString := Telefones;

  // Valor por extenso da assinatura
  cdsAssRenovarCalcValorPorExtenso.AsString := dmDadosGlobal.PadL(dmDadosGlobal.ValorPorExtenso(cdsAssRenovaradavl.Value), 150, '*');
end;

procedure TdmDadosRelat.cdsEtiquetasCalcFields(DataSet: TDataSet);
begin
  // Os campos calculados estão no while do CDS dentro da função mesmo.
end;

procedure TdmDadosRelat.cdsLotesCalcFields(DataSet: TDataSet);
begin
  cdsLotesCalcAnoMes.AsString := FormatDateTime('mm', cdsLotesgaaanomes.Value) +
    ' / ' + FormatDateTime('yyyy', cdsLotesgaaanomes.Value);
end;

procedure TdmDadosRelat.ConfigurarCabecalhoRodape(ATitulo, ASubTitulo: String);
begin
  cdsCabecalhoRodape.Close;
  cdsCabecalhoRodape.CreateDataSet;
  cdsCabecalhoRodape.Open;

  cdsCabecalhoRodape.Append;
  cdsCabecalhoRodapeCNPJ.AsString := trim(dmDadosEmpresa.cdsTblempempcnpj.AsString);
  cdsCabecalhoRodapeEmpresa.AsString := trim(dmDadosEmpresa.cdsTblempemprazaosocial.AsString);

  // Endereço completo
  cdsCabecalhoRodapeEndereco.AsString := dmDadosGlobal.FormataEndereco(dmDadosEmpresa.cdsTblempempender.AsString, dmDadosEmpresa.cdsTblempempnro.AsString);

  // Apenas a Cidade
  cdsCabecalhoRodapeCidade.AsString := dmDadosGlobal.ConvertePrimeiraLetraMaiuscula(trim(dmDadosEmpresa.sqlTblcepcepmunicipio.AsString));

  // Bairro, Cidade e Estado
  cdsCabecalhoRodapeCidadeEstado.AsString := dmDadosGlobal.ConvertePrimeiraLetraMaiuscula(trim(dmDadosEmpresa.sqlTblcepcepmunicipio.AsString)) + ' - ' + trim(dmDadosEmpresa.sqlTblcepcepeuf.AsString);

  if (trim(dmDadosEmpresa.cdsTblempempbairro.AsString) <> EmptyStr) and (trim(dmDadosEmpresa.cdsTblempempbairro.AsString) <> '.') then
    cdsCabecalhoRodapeCidadeEstado.AsString := 'Bairro ' + trim(dmDadosEmpresa.cdsTblempempbairro.AsString) + ' - ' + cdsCabecalhoRodapeCidadeEstado.AsString;

  // Telefone da empresa
  cdsCabecalhoRodapeFoneEmpresa.AsString := trim(dmDadosEmpresa.cdsTblempempfone.AsString);

  cdsCabecalhoRodapeTitulo.AsString := ATitulo;
  cdsCabecalhoRodapeSubTitulo.AsString := ASubTitulo;
  cdsCabecalhoRodapeUsuario.AsString := 'Usuário: ' + trim(dmUsuario.cdsUsuariousunome.AsString);
  cdsCabecalhoRodapeVersao.AsString := 'Versão ' + frmPrincipal.GetVersaoPrograma;
  cdsCabecalhoRodape.Post;

end;

procedure TdmDadosRelat.DataModuleCreate(Sender: TObject);
var
  I, x: Integer;
  AnoAtual: integer;
  AnoInicial: integer;
  AnoFinal: integer;
begin
  AnoAtual := YearOf(dmDadosGlobal.GetDataHoraBanco);
  AnoInicial := AnoAtual - 1;
  AnoFinal := AnoInicial + 5;
  x := 0;

  for I := AnoInicial to AnoFinal do
  begin
    Year[x] := i;
    Inc(x);
  end;
end;

function TdmDadosRelat.GetSqlWhereCobradores: String;
begin
  Result := '';

  cdsCobradores.Filtered := false;
  cdsCobradores.DisableControls;
  try
    cdsCobradores.First;
    while not cdsCobradores.Eof do
    begin
      if cdsCobradoresCalcSelecionado.Value = true then
      begin
        if Result = EmptyStr then
          Result := IntToStr(cdsCobradorescobcod.AsInteger)
        else
          Result := Result + ', ' + IntToStr(cdsCobradorescobcod.AsInteger);
      end;

      cdsCobradores.Next;
    end;
  finally
    cdsCobradores.First;
    cdsCobradores.EnableControls;
  end;
end;

function TdmDadosRelat.GetSqlWhereGruposVendedores: String;
begin
  Result := '';

  cdsGruposVendedores.Filtered := false;
  cdsGruposVendedores.DisableControls;
  try
    cdsGruposVendedores.First;
    while not cdsGruposVendedores.Eof do
    begin
      if cdsGruposVendedoresCalcSelecionado.Value = true then
      begin
        if Result = EmptyStr then
          Result := IntToStr(cdsGruposVendedoresgdvcod.AsInteger)
        else
          Result := Result + ', ' + IntToStr(cdsGruposVendedoresgdvcod.AsInteger);
      end;

      cdsGruposVendedores.Next;
    end;
  finally
    cdsGruposVendedores.First;
    cdsGruposVendedores.EnableControls;
  end;
end;

function TdmDadosRelat.GetSqlWhereVendedores: String;
begin
  Result := '';

  cdsVendedores.Filtered := false;
  cdsVendedores.DisableControls;
  try
    cdsVendedores.First;
    while not cdsVendedores.Eof do
    begin
      if cdsVendedoresCalcSelecionado.Value = true then
      begin
        if Result = EmptyStr then
          Result := IntToStr(cdsVendedoresvencod.AsInteger)
        else
          Result := Result + ', ' + IntToStr(cdsVendedoresvencod.AsInteger);
      end;

      cdsVendedores.Next;
    end;
  finally
    cdsVendedores.First;
    cdsVendedores.EnableControls;
  end;
end;

function TdmDadosRelat.GetSqlWhereZonas: String;
begin
  Result := '';

  cdsZonas.Filtered := false;
  cdsZonas.DisableControls;
  try
    cdsZonas.First;
    while not cdsZonas.Eof do
    begin
      if cdsZonasCalcSelecionado.Value = true then
      begin
        if Result = EmptyStr then
          Result := '"' + trim(cdsZonaszoncod.AsString) + '"'
        else
          Result := Result + ', "' + trim(cdsZonaszoncod.AsString) + '"'
      end;

      cdsZonas.Next;
    end;
  finally
    cdsZonas.First;
    cdsZonas.EnableControls;
  end;
end;

function TdmDadosRelat.GetUltAnoMesRenovacaoAuto: TDate;
begin
  sqlUltRenovacaoAuto.Close;
  sqlUltRenovacaoAuto.Open;

  try
    if sqlUltRenovacaoAuto.Eof then
      Result := 0
    else
      Result := sqlUltRenovacaoAutogaaanomes.AsDateTime;
  finally
    sqlUltRenovacaoAuto.Close;
  end;
end;

procedure TdmDadosRelat.MarcarDesmarcarCobradores(AMarcar: Boolean);
begin
  cdsCobradores.DisableControls;
  try
    cdsCobradores.First;
    while not cdsCobradores.Eof do
    begin
      cdsCobradores.Edit;
      cdsCobradoresCalcSelecionado.Value := AMarcar;
      cdsCobradores.Post;

      cdsCobradores.Next;
    end;
  finally
    cdsCobradores.First;
    cdsCobradores.EnableControls;
  end;
end;

procedure TdmDadosRelat.MarcarDesmarcarGruposVendedores(AMarcar: Boolean);
begin
  cdsGruposVendedores.DisableControls;
  try
    cdsGruposVendedores.First;
    while not cdsGruposVendedores.Eof do
    begin
      cdsGruposVendedores.Edit;
      cdsGruposVendedoresCalcSelecionado.Value := AMarcar;
      cdsGruposVendedores.Post;

      cdsGruposVendedores.Next;
    end;
  finally
    cdsGruposVendedores.First;
    cdsGruposVendedores.EnableControls;
  end;
end;

procedure TdmDadosRelat.MarcarDesmarcarVendedores(AMarcar: Boolean);
begin
  cdsVendedores.DisableControls;
  try
    cdsVendedores.First;
    while not cdsVendedores.Eof do
    begin
      cdsVendedores.Edit;
      cdsVendedoresCalcSelecionado.Value := AMarcar;
      cdsVendedores.Post;

      cdsVendedores.Next;
    end;
  finally
    cdsVendedores.First;
    cdsVendedores.EnableControls;
  end;
end;

procedure TdmDadosRelat.MarcarDesmarcarZonas(AMarcar: Boolean);
begin
  cdsZonas.DisableControls;
  try
    cdsZonas.First;
    while not cdsZonas.Eof do
    begin
      cdsZonas.Edit;
      cdsZonasCalcSelecionado.Value := AMarcar;
      cdsZonas.Post;

      cdsZonas.Next;
    end;
  finally
    cdsZonas.First;
    cdsZonas.EnableControls;
  end;
end;

procedure TdmDadosRelat.ShowReportAlteracaoCadastro(AUsucod: Integer; ADataInicialAlt, ADataFinalAlt: TDate);
var
  SubTitulo: String;
  Titulo: String;

  DataHoraIni: String;
  DataHoraFim: String;
begin

  // ---------------------------------------------------------------------------
  // Validações
  // ---------------------------------------------------------------------------

  if AUsucod = 0 then
    raise Exception.Create('Usuário não foi selecionado.');

  if ADataInicialAlt = 0 then
    raise Exception.Create('Data inicial não é válida.');

  if ADataFinalAlt = 0 then
    raise Exception.Create('Data final não é válida.');

  if ADataInicialAlt > ADataFinalAlt then
    raise Exception.Create('Data inicial não pode ser maior que data final.');

  // Tenho que fazer esta jogada pois a coluna do banco de dados é um DateTime,
  // e nãso apenas Date.
  DataHoraIni := FormatDateTime('yyyy-mm-dd', ADataInicialAlt) + ' 00:00:00';
  DataHoraFim := FormatDateTime('yyyy-mm-dd', ADataFinalAlt) + ' 23:59:59';

  sqlAltCad.Close;
  sqlAltCad.ParamByName('usucod').AsInteger := AUsucod;
  sqlAltCad.ParamByName('hmadthrini').AsString := DataHoraIni;
  sqlAltCad.ParamByName('hmadthrfim').AsString := DataHoraFim;

  cdsAltCad.Close;
  cdsAltCad.Open;

  if cdsAltCad.RecordCount = 0 then
  begin
    MessageDlg('Não existem resultados para serem mostrados.', mtInformation, [mbok], 0);
    exit;
  end;

  // ---------------------------------------------------------------------------
  // Configuração do Cabeçalho e rodapé
  // ---------------------------------------------------------------------------

  Titulo := 'Histórico de Alterações de Cadastros';

  SubTitulo := 'Usuário: ' + trim(cdsAltCadusunome.Value) + ' - Período: ' + FormatDateTime('dd/mm/yyyy', ADataInicialAlt) + ' até ' + FormatDateTime('dd/mm/yyyy', ADataFinalAlt);

  ConfigurarCabecalhoRodape(Titulo, SubTitulo);

  // ---------------------------------------------------------------------------
  // Mostra o relatório na tela
  // ---------------------------------------------------------------------------

  frxAltCad.ShowReport;

end;

procedure TdmDadosRelat.ShowReportAlteracoesAssinante(AAsscod: Integer;
  ADataInicialAlt, ADataFinalAlt: TDate);
var
  SubTitulo: String;
  Titulo: String;

  DataHoraIni: String;
  DataHoraFim: String;
begin
  // ---------------------------------------------------------------------------
  // Validações
  // ---------------------------------------------------------------------------

  if AAsscod = 0 then
    raise Exception.Create('Assinante não foi selecionado.');

  if ADataInicialAlt = 0 then
    raise Exception.Create('Data inicial não é válida.');

  if ADataFinalAlt = 0 then
    raise Exception.Create('Data final não é válida.');

  if ADataInicialAlt > ADataFinalAlt then
    raise Exception.Create('Data inicial não pode ser maior que data final.');

  // Tenho que fazer esta jogada pois a coluna do banco de dados é um DateTime,
  // e nãso apenas Date.
  DataHoraIni := FormatDateTime('yyyy-mm-dd', ADataInicialAlt) + ' 00:00:00';
  DataHoraFim := FormatDateTime('yyyy-mm-dd', ADataFinalAlt) + ' 23:59:59';

  sqlHistAltAss.Close;
  sqlHistAltAss.ParamByName('asscod').AsInteger := AAsscod;
  sqlHistAltAss.ParamByName('hmadthrini').AsString := DataHoraIni;
  sqlHistAltAss.ParamByName('hmadthrfim').AsString := DataHoraFim;

  cdsHistAltAss.Close;
  cdsHistAltAss.Open;

  if cdsHistAltAss.RecordCount = 0 then
  begin
    MessageDlg('Não existem resultados para serem mostrados.', mtInformation, [mbok], 0);
    exit;
  end;

  // ---------------------------------------------------------------------------
  // Configuração do Cabeçalho e rodapé
  // ---------------------------------------------------------------------------
  Titulo := 'Histórico de Alterações do Assinante';

  SubTitulo := 'Assinante: ' + trim(cdsHistAltAssasscod.AsString) + '-' + trim(cdsHistAltAssassnome.AsString) + ' - Período: ' + FormatDateTime('dd/mm/yyyy', ADataInicialAlt) + ' até ' + FormatDateTime('dd/mm/yyyy', ADataFinalAlt);

  ConfigurarCabecalhoRodape(Titulo, SubTitulo);

  // ---------------------------------------------------------------------------
  // Mostra o relatório na tela
  // ---------------------------------------------------------------------------

  frxHistAltAss.ShowReport;

end;

procedure TdmDadosRelat.ShowReportAssinantes(AAgrupamento: Integer);
var
  SQL: String;
  Where: String;
  TituloSeparador: String;
  SubTitulo: String;

  FieldNameCodigo: String;
  FieldNameDescr: String;
begin
  // ---------------------------------------------------------------------------
  // Montagem e execução do SQL
  // ---------------------------------------------------------------------------

  case AAgrupamento of
    0:  // Zona
    begin
      SubTitulo := 'Relação de todos os assinantes ativos separado por zonas';

      TituloSeparador := 'Zona';

      FieldNameCodigo := 'zoncod';
      FieldNameDescr := 'zondescr';

      SQL :=
        'select tblzon.zoncod, ' +
        '       tblzon.zondescr, ';

      Where := GetSqlWhereZonas;

      if Where = EmptyStr then
        raise Exception.Create('Pelo menos uma zona deve ser selecionada.');

      Where := ' and tblzon.zoncod in (' + Where + ')';
    end;
    1:  // Vendedor
    begin
      SubTitulo := 'Relação de todos os assinantes ativos separado por vendedores';

      TituloSeparador := 'Vendedor';

      FieldNameCodigo := 'vencod';
      FieldNameDescr := 'vennome';

      SQL :=
        'select tblven.vencod, ' +
        '       tblven.vennome, ';

      Where := GetSqlWhereVendedores;

      if Where = EmptyStr then
        raise Exception.Create('Pelo menos um vendedor deve ser selecionado.');

      Where := ' and tblven.vencod in (' + Where + ')';
    end;
    2:  // Grupo Vendedor
    begin
      SubTitulo := 'Relação de todos os assinantes ativos separado por Grupos de Vendedores';

      TituloSeparador := 'Grupo Vendedor';

      FieldNameCodigo := 'gdvcod';
      FieldNameDescr := 'gdvdescr';

      SQL :=
        'select tblgdv.gdvcod, ' +
        '       tblgdv.gdvdescr, ';

      Where := GetSqlWhereGruposVendedores;

      if Where = EmptyStr then
        raise Exception.Create('Pelo menos um grupo de vendedores deve ser selecionado.');

      Where := ' and tblgdv.gdvcod in (' + Where + ')';
    end;
    3:  // Cobrador
    begin
      SubTitulo := 'Relação de todos os assinantes ativos separado por Cobradores';

      TituloSeparador := 'Cobrador';

      FieldNameCodigo := 'cobcod';
      FieldNameDescr := 'cobnome';

      SQL :=
        'select tblcob.cobcod, ' +
        '       tblcob.cobnome, ';

      Where := GetSqlWhereCobradores;

      if Where = EmptyStr then
        raise Exception.Create('Pelo menos um cobrador deve ser selecionado.');

      Where := ' and tblcob.cobcod in (' + Where + ')';
    end;
  end;

  SQL := SQL +
    '      tblass.asscod, tblass.assnome, tblass.rdzcod, tblrdz.rdzender, tblass.assnroent, ' +
    '      tblass.asscomplent ' +
    ' from tblass, tblven, tblgdv, tblcob, tblrdz, tblzon ' +
    'where tblass.vencod = tblven.vencod ' +
    '  and tblven.gdvcod = tblgdv.gdvcod ' +
    '  and tblass.cobcod = tblcob.cobcod ' +
    '  and tblass.rdzcod = tblrdz.rdzcod ' +
    '  and tblrdz.zoncod = tblzon.zoncod ' +
    '  and tblass.assstatus = 0 ' +
    Where;

  cdsAssinantes.Close;
  cdsAssinantes.CreateDataSet;
  cdsAssinantes.Open;

  sqlAssinantes.Close;
  sqlAssinantes.CommandText := SQL;
  sqlAssinantes.Open;

  while not sqlAssinantes.Eof do
  begin
    cdsAssinantes.Append;
    cdsAssinantestitulo_agrupador.AsString := TituloSeparador;
    cdsAssinantescod_agrupador.AsString := sqlAssinantes.FieldByName(FieldNameCodigo).AsString;
    cdsAssinantesdescr_agrupador.AsString := trim(cdsAssinantescod_agrupador.AsString) + ' - ' + trim(sqlAssinantes.FieldByName(FieldNameDescr).AsString);

    cdsAssinantesasscod.AsInteger := sqlAssinantes.FieldByName('asscod').AsInteger;
    cdsAssinantesassnome.AsString := sqlAssinantes.FieldByName('assnome').AsString;
    cdsAssinantesrdzender.AsString := sqlAssinantes.FieldByName('rdzender').AsString;
    cdsAssinantesassnroent_Inteiro.AsInteger := StrToInt(dmDadosGlobal.GetSoNumeros(sqlAssinantes.FieldByName('assnroent').AsString, '0'));
    cdsAssinantesassnroent_String.AsString := dmDadosGlobal.GetSoLetras(sqlAssinantes.FieldByName('assnroent').AsString);

    // Monta o endereço completo
    cdsAssinantesEnderecoCompleto.AsString := dmDadosGlobal.FormataEndereco(sqlAssinantes.FieldByName('rdzender').AsString, sqlAssinantes.FieldByName('assnroent').AsString, sqlAssinantes.FieldByName('asscomplent').AsString);

    cdsAssinantes.Post;

    sqlAssinantes.Next;
  end;
  cdsAssinantes.First;

  // Ordenação do ClientDataSet
  cdsAssinantes.IndexFieldNames := 'titulo_agrupador;cod_agrupador;rdzender;assnroent_Inteiro;assnroent_String;assnome';

  // ---------------------------------------------------------------------------
  // Configuração do Cabeçalho e rodapé
  // ---------------------------------------------------------------------------

  ConfigurarCabecalhoRodape('Relação de Assinaturas', SubTitulo);


  // ---------------------------------------------------------------------------
  // Mostra o relatório na tela
  // ---------------------------------------------------------------------------

  frxAssinantes.ShowReport;
end;

procedure TdmDadosRelat.ShowReportAssinaturasCanceladas(ADataInicialCancel,
  ADataFinalCancel: TDateTime);
var
  SQL: String;
  Where: String;
  SubTitulo: String;
begin
  // ---------------------------------------------------------------------------
  // Validações
  // ---------------------------------------------------------------------------

  if ADataInicialCancel = 0 then
    raise Exception.Create('Data inicial não é válida.');

  if ADataFinalCancel = 0 then
    raise Exception.Create('Data final não é válida.');

  if ADataInicialCancel > ADataFinalCancel then
    raise Exception.Create('Data inicial não pode ser maior que data final.');


  // ---------------------------------------------------------------------------
  // Montagem e execução do SQL
  // ---------------------------------------------------------------------------

  SQL :=
    'select tblzon.zoncod, tblzon.zondescr, tblass.asscod, tblass.assnome, ' +
    '       tblass.assfoneresid, tblass.assfonecelul, tblass.assfonecomer, ' +
    '       tblada.adacod, tblrdz.rdzender, tblass.assnroent, tblass.asscomplent, ' +
    '       tblada.adadtcancel, tblada.adadtvenc, tblada.adavlpend ' +
    '  from tblass, tblada, tblrdz, tblzon ' +
    ' where tblass.asscod = tblada.asscod ' +
    '   and tblass.rdzcod = tblrdz.rdzcod ' +
    '   and tblrdz.zoncod = tblzon.zoncod ' +
    '   and tblada.adacancel = "S" ' +
    '   and tblada.adadtcancel between "' + FormatDateTime('yyyy-mm-dd', ADataInicialCancel) + '" and "' + FormatDateTime('yyyy-mm-dd', ADataFinalCancel) + '" ';

  Where := GetSqlWhereZonas;

  if Where = EmptyStr then
    raise Exception.Create('Pelo menos uma zona deve ser selecionada.');

  SQL := SQL +
    ' and tblzon.zoncod in (' + Where + ')' +
    ' order by tblzon.zoncod, tblass.assnome';

  sqlAssCanceladas.Close;
  sqlAssCanceladas.CommandText := SQL;

  cdsAssCanceladas.Close;
  cdsAssCanceladas.Open;

  if cdsAssCanceladas.RecordCount = 0 then
  begin
    MessageDlg('Não existem resultados para serem mostrados.', mtInformation, [mbok], 0);
    exit;
  end;

  // ---------------------------------------------------------------------------
  // Configuração do Cabeçalho e rodapé
  // ---------------------------------------------------------------------------

  SubTitulo := 'Período de cancelamento das assinaturas: ' + FormatDateTime('dd/mm/yyyy', ADataInicialCancel) + ' até ' + FormatDateTime('dd/mm/yyyy', ADataFinalCancel);

  ConfigurarCabecalhoRodape('Assinaturas Canceladas', SubTitulo);


  // ---------------------------------------------------------------------------
  // Mostra o relatório na tela
  // ---------------------------------------------------------------------------

  frxAssCanceladas.ShowReport;
end;

procedure TdmDadosRelat.ShowReportAssinaturasPendentes(AAgrupamento: Integer;
  ADataInicialBaixa, ADataFinalBaixa: TDateTime);
var
  SQL: String;
  Where: String;
  WhereZonas: String;
  SubTitulo: String;
  TituloSeparador: String;

  FieldNameCodigo: String;
  FieldNameDescr: String;
begin
  // ---------------------------------------------------------------------------
  // Validações
  // ---------------------------------------------------------------------------

  if ADataInicialBaixa = 0 then
    raise Exception.Create('Data inicial não é válida.');

  if ADataFinalBaixa = 0 then
    raise Exception.Create('Data final não é válida.');

  if ADataInicialBaixa > ADataFinalBaixa then
    raise Exception.Create('Data inicial não pode ser maior que data final.');

  // ---------------------------------------------------------------------------
  // Montagem e execução do SQL
  // ---------------------------------------------------------------------------

  case AAgrupamento of
    0:  // Vendedor
    begin
      TituloSeparador := 'Vendedor:';

      FieldNameCodigo := 'vencod';
      FieldNameDescr := 'vennome';

      SQL :=
        'select tblven.vencod, ' +
        '       tblven.vennome, ';

      Where := GetSqlWhereVendedores;

      if Where = EmptyStr then
        raise Exception.Create('Pelo menos um vendedor deve ser selecionado.');

      Where := ' and tblven.vencod in (' + Where + ')';
    end;
    1:  // Grupo Vendedor
    begin
      TituloSeparador := 'Grupo Vendedor:';

      FieldNameCodigo := 'gdvcod';
      FieldNameDescr := 'gdvdescr';

      SQL :=
        'select tblgdv.gdvcod, ' +
        '       tblgdv.gdvdescr, ';

      Where := GetSqlWhereGruposVendedores;

      if Where = EmptyStr then
        raise Exception.Create('Pelo menos um grupo de vendedores deve ser selecionado.');

      Where := ' and tblgdv.gdvcod in (' + Where + ')';
    end;
    2:  // Cobrador
    begin
      TituloSeparador := 'Cobrador:';

      FieldNameCodigo := 'cobcod';
      FieldNameDescr := 'cobnome';

      SQL :=
        'select tblcob.cobcod, ' +
        '       tblcob.cobnome, ';

      Where := GetSqlWhereCobradores;

      if Where = EmptyStr then
        raise Exception.Create('Pelo menos um cobrador deve ser selecionado.');

      Where := ' and tblcob.cobcod in (' + Where + ')';
    end;
  end;

  WhereZonas := GetSqlWhereZonas;

  if WhereZonas = EmptyStr then
    raise Exception.Create('Pelo menos um zona deve ser selecionada.');

  WhereZonas := ' and tblzon.zoncod in (' + WhereZonas + ')';

  SQL := SQL +
    '      tblzon.zoncod, tblzon.zondescr, ' +
    '      tblass.asscod, tblass.assnome, tblrdz.rdzender, tblass.assnroent, ' +
    '      tblada.adadtvenc, tblada.adavlpend ' +
    ' from tblass, tblada, tblven, tblgdv, tblcob, tblrdz, tblzon ' +
    'where tblass.asscod = tblada.asscod ' +
    '  and tblass.vencod = tblven.vencod ' +
    '  and tblven.gdvcod = tblgdv.gdvcod ' +
    '  and tblass.cobcod = tblcob.cobcod ' +
    '  and tblass.rdzcod = tblrdz.rdzcod ' +
    '  and tblrdz.zoncod = tblzon.zoncod ' +
    '  and tblada.adadtvenc between "' + FormatDateTime('yyyy-mm-dd', ADataInicialBaixa) + '" and "' + FormatDateTime('yyyy-mm-dd', ADataFinalBaixa) + '" ' +
    '  and tblass.assstatus = 0 ' +
    '  and tblada.adavlpend > 0 ' +
    '  and tblada.adacancel = ' + QuotedStr('N') +
    '  and tblada.adacortesia = ' + QuotedStr('N') +
    Where +
    WhereZonas +
    ' order by 1, tblzon.zoncod, tblass.assnome ';


  cdsAssPendentes.Close;
  cdsAssPendentes.CreateDataSet;
  cdsAssPendentes.Open;

  sqlAssPendentes.Close;
  sqlAssPendentes.CommandText := SQL;
  sqlAssPendentes.Open;

  while not sqlAssPendentes.Eof do
  begin
    cdsAssPendentes.Append;
    cdsAssPendentesChave.AsString := TituloSeparador + ' ' + trim(sqlAssPendentes.FieldByName(FieldNameCodigo).AsString) + ' - ' + trim(sqlAssPendentes.FieldByName(FieldNameDescr).AsString);
    cdsAssPendenteszoncod.AsString := sqlAssPendentes.FieldByName('zoncod').AsString;
    cdsAssPendenteszondescr.AsString := sqlAssPendentes.FieldByName('zondescr').AsString;
    cdsAssPendentesasscod.AsInteger := sqlAssPendentes.FieldByName('asscod').AsInteger;
    cdsAssPendentesassnome.AsString := sqlAssPendentes.FieldByName('assnome').AsString;
    // Monta o endereço completo
    cdsAssPendentesEndereco.AsString := dmDadosGlobal.FormataEndereco(sqlAssPendentes.FieldByName('rdzender').AsString, sqlAssPendentes.FieldByName('assnroent').AsString);
    cdsAssPendentesadadtvenc.AsDateTime := sqlAssPendentes.FieldByName('adadtvenc').AsDateTime;
    cdsAssPendentesadavlpend.AsFloat := sqlAssPendentes.FieldByName('adavlpend').AsFloat;
    cdsAssPendentes.Post;

    sqlAssPendentes.Next;
  end;
  cdsAssPendentes.First;


  // ---------------------------------------------------------------------------
  // Configuração do Cabeçalho e rodapé
  // ---------------------------------------------------------------------------

  SubTitulo := 'Período de vencimento: ' + FormatDateTime('dd/mm/yyyy', ADataInicialBaixa) + ' até ' + FormatDateTime('dd/mm/yyyy', ADataFinalBaixa);

  ConfigurarCabecalhoRodape('Assinaturas Pendentes', SubTitulo);


  // ---------------------------------------------------------------------------
  // Mostra o relatório na tela
  // ---------------------------------------------------------------------------

  frxAssPendentes.ShowReport;
end;

procedure TdmDadosRelat.ShowReportAssinaturasRenovar(ATipoRelat: integer; ADataInicialVenc, ADataFinalVenc: TDateTime; ATipoSelecao: Integer; AGaacod: Integer; AGaaanomes: TDateTime; AGaanromes: Integer);
var
  SQL: String;
  SubTitulo: String;
  i: integer;
begin
  // ---------------------------------------------------------------------------
  // Validações
  // ---------------------------------------------------------------------------

  if ATipoSelecao = 1 then
  begin
    if ADataInicialVenc = 0 then
      raise Exception.Create('Data inicial não é válida.');

    if ADataFinalVenc = 0 then
      raise Exception.Create('Data final não é válida.');

    if ADataInicialVenc > ADataFinalVenc then
      raise Exception.Create('Data inicial não pode ser maior que data final.');
  end;


  // ---------------------------------------------------------------------------
  // Montagem do SQL
  // ---------------------------------------------------------------------------

  SQL :=
    'select tblzon.zoncod, tblzon.zondescr, tblass.asscod, tblass.assnome, ' +
    '       tblass.asscpf, tblass.asscnpj,  tblass.assemail, ' +
    '       tblass.assfoneresid, tblass.assfonecelul, tblass.assfonecomer, ' +
    '       tblass.assfonecomerramal, tblrdz.rdzender, tblass.assnroent, ' +
    '       tblass.asscomplent, tblass.assbairroent, tblcep.cepmunicipio, tblcep.cepeuf, ' +
    '       tblada.adadtini, tblada.adadtvenc, tblada.adavl, tblada.adavl, tblada.adavldesc ' +
    '  from tblass, tblcep, tblrdz, tblzon, tblada ' +
    ' where tblass.rdzcod = tblrdz.rdzcod ' +
    '   and tblrdz.zoncod = tblzon.zoncod ' +
    '   and tblass.asscod= tblada.asscod  ' +
    '   and tblass.cepcepent = tblcep.cepcep ' +
    '   and tblass.assstatus = 0 ' +
    '   and tblada.adacancel = "N" ';

  if ATipoSelecao = 0 then
    SQL := SQL + ' and tblada.gaacod = ' + IntToStr(AGaacod)
  else
    SQL := SQL + ' and tblada.adadtvenc between "' + FormatDateTime('yyyy-mm-dd', ADataInicialVenc) + '" and "' + FormatDateTime('yyyy-mm-dd', ADataFinalVenc) + '" ';

  SQL := SQL +
    ' order by tblzon.zoncod, tblada.adadtvenc, tblass.assnome ';
      // and tblass.asscod = 1

  sqlAssRenovar.Close;
  sqlAssRenovar.CommandText := SQL;

  cdsAssRenovar.Close;
  cdsAssRenovar.Open;

  i := 0;
  while not cdsAssRenovar.Eof do
  begin
    inc(i);

    cdsAssRenovar.Edit;

    if ((i mod 2) = 0) then
     cdsAssRenovarCalcImpLinhaSep.Value := 0
    else
     cdsAssRenovarCalcImpLinhaSep.Value := 1;

    cdsAssRenovar.Post;


    cdsAssRenovar.Next;
  end;

  cdsAssRenovar.First;

  if cdsAssRenovar.RecordCount = 0 then
  begin
    MessageDlg('Não existem resultados para serem mostrados.', mtInformation, [mbok], 0);
    exit;
  end;


  // ---------------------------------------------------------------------------
  // Configuração do Cabeçalho e rodapé
  // ---------------------------------------------------------------------------

  SubTitulo := '';

  if ATipoSelecao = 0 then
  begin
    SubTitulo := 'Lote nro.: ' + IntToStr(AGaacod) + ' - ';

    ADataInicialVenc := IncMonth(AGaaanomes, AGaanromes);
    ADataInicialVenc := EncodeDate(YearOf(ADataInicialVenc), MonthOf(ADataInicialVenc), DayOf(ADataInicialVenc));
    ADataFinalVenc := EncodeDate(YearOf(ADataInicialVenc), MonthOf(ADataInicialVenc), DayOf(EndOfTheMonth(ADataInicialVenc)));
  end;

  SubTitulo := SubTitulo + 'Período de vencimento: ' + FormatDateTime('dd/mm/yyyy', ADataInicialVenc) + ' até ' + FormatDateTime('dd/mm/yyyy', ADataFinalVenc);

  ConfigurarCabecalhoRodape('Assinaturas à Renovar', SubTitulo);


  // ---------------------------------------------------------------------------
  // Mostra o relatório na tela
  // ---------------------------------------------------------------------------
  if ATipoRelat = 0 then
    frxRecibos.ShowReport
  else
    frxAssRenovar.ShowReport;

end;

procedure TdmDadosRelat.ShowReportBaixas(ADataInicialBaixa,
  ADataFinalBaixa: TDateTime);
var
  SQL: String;
  Where: String;
  SubTitulo: String;
begin
  // ---------------------------------------------------------------------------
  // Validações
  // ---------------------------------------------------------------------------

  if ADataInicialBaixa = 0 then
    raise Exception.Create('Data inicial não é válida.');

  if ADataFinalBaixa = 0 then
    raise Exception.Create('Data final não é válida.');

  if ADataInicialBaixa > ADataFinalBaixa then
    raise Exception.Create('Data inicial não pode ser maior que data final.');

  // ---------------------------------------------------------------------------
  // Montagem e execução do SQL
  // ---------------------------------------------------------------------------

  SQL :=
    'select tblgdv.gdvcod, tblgdv.gdvdescr, tblass.asscod, tblass.assnome, ' +
    '       tblbda.adacod, tblbda.bdadt, tblada.adadtvenc, tblbda.bdavl ' +
    '  from tblass, tblven, tblgdv, tblada, tblbda ' +
    ' where tblass.vencod = tblven.vencod ' +
    '   and tblven.gdvcod = tblgdv.gdvcod ' +
    '   and tblass.asscod = tblada.asscod ' +
    '   and tblada.asscod = tblbda.asscod ' +
    '   and tblada.adacod = tblbda.adacod ' +
    '   and tblbda.bdadt between "' + FormatDateTime('yyyy-mm-dd', ADataInicialBaixa) + '" and "' + FormatDateTime('yyyy-mm-dd', ADataFinalBaixa) + '" ';

  Where := GetSqlWhereGruposVendedores;

  if Where = EmptyStr then
    raise Exception.Create('Pelo menos um grupo de vendedores deve ser selecionado.');

  SQL := SQL + ' and tblgdv.gdvcod in (' + Where + ')';

  SQL := SQL + ' order by tblgdv.gdvcod, tblbda.bdadt, tblass.assnome';

  sqlBaixas.Close;
  sqlBaixas.CommandText := SQL;

  cdsBaixas.Close;
  cdsBaixas.Open;

  if cdsBaixas.RecordCount = 0 then
  begin
    MessageDlg('Não existem resultados para serem mostrados.', mtInformation, [mbok], 0);
    exit;
  end;

  // ---------------------------------------------------------------------------
  // Configuração do Cabeçalho e rodapé
  // ---------------------------------------------------------------------------

  SubTitulo := 'Período das baixas: ' + FormatDateTime('dd/mm/yyyy', ADataInicialBaixa) + ' até ' + FormatDateTime('dd/mm/yyyy', ADataFinalBaixa);

  ConfigurarCabecalhoRodape('Baixas Realizadas', SubTitulo);


  // ---------------------------------------------------------------------------
  // Mostra o relatório na tela
  // ---------------------------------------------------------------------------

  frxBaixas.ShowReport;
end;

procedure TdmDadosRelat.ShowReportCondicoesPagto(ADataInicial,
  ADataFinal: TDate);
var
  SQL: String;
  Where: String;
  SubTitulo: String;
  ChaveAtual, ChaveAnterior: string;
begin
  // ---------------------------------------------------------------------------
  // Validações
  // ---------------------------------------------------------------------------

  if ADataInicial = 0 then
    raise Exception.Create('Data inicial não é válida.');

  if ADataFinal = 0 then
    raise Exception.Create('Data final não é válida.');

  if ADataInicial > ADataFinal then
    raise Exception.Create('Data inicial não pode ser maior que data final.');

  Where := GetSqlWhereCobradores;

  if Where = EmptyStr then
    raise Exception.Create('Pelo menos um cobrador deve ser selecionado.');

  // ---------------------------------------------------------------------------
  // Montagem e execução do SQL
  // ---------------------------------------------------------------------------

  SQL :=
    'select tblass.cobcod, tblcob.cobnome, tblrdz.zoncod, tblzon.zondescr, ' +
    '       tblass.asscod, tblass.assnome, tblada.adavldesc, tblcpa.cpanroparc, ' +
    '       tblcpa.cpadtvenc, tblcpa.cpavl, tblada.adavlpend ' +
    '  from tblass, tblcob, tblrdz, tblzon, tblada, tblcpa ' +
    ' where tblass.cobcod = tblcob.cobcod ' +
    '   and tblass.rdzcod = tblrdz.rdzcod ' +
    '   and tblrdz.zoncod = tblzon.zoncod ' +
    '   and tblass.asscod = tblada.asscod ' +
    '   and tblada.asscod = tblcpa.asscod ' +
    '   and tblada.adacod= tblcpa.adacod ' +
    '   and tblada.adacancel = ' + QuotedStr('N') +
    '   and tblada.adacortesia = ' + QuotedStr('N') +
    '   and tblada.adavlpend > 0 ' +
    '   and tblcpa.cpadtvenc between "' + FormatDateTime('yyyy-mm-dd', ADataInicial) + '" and "' + FormatDateTime('yyyy-mm-dd', ADataFinal) + '" ';

  SQL := SQL +
    ' and tblcob.cobcod in (' + Where + ') ' +
    ' order by tblcob.cobnome, tblrdz.zoncod, tblass.assnome, tblcpa.cpadtvenc ';

  sqlCondPagto.Close;
  sqlCondPagto.CommandText := SQL;

  cdsCondPagto.Close;
  cdsCondPagto.Open;

  if cdsCondPagto.RecordCount = 0 then
  begin
    MessageDlg('Não existem resultados para serem mostrados.', mtInformation, [mbok], 0);
    exit;
  end;

  cdsCondPagtoAux.Close;
  cdsCondPagtoAux.CreateDataSet;
  cdsCondPagtoAux.Open;

  ChaveAnterior := '';

  cdsCondPagto.First;
  while not cdsCondPagto.Eof do
  begin
    ChaveAtual := cdsCondPagtocobcod.AsString + cdsCondPagtozoncod.AsString + cdsCondPagtoasscod.AsString;

    if ChaveAnterior = ChaveAtual then
    begin
      cdsCondPagtoAux.AppendRecord([
        cdsCondPagtocobcod.Value,
        cdsCondPagtocobnome.Value,
        cdsCondPagtozoncod.Value,
        cdsCondPagtozondescr.Value,
        '',
        '',
        '',
        cdsCondPagtocpanroparc.Value,
        cdsCondPagtocpadtvenc.Value,
        cdsCondPagtocpavl.Value,
        '']);
    end
    else
    begin
      cdsCondPagtoAux.AppendRecord([
        cdsCondPagtocobcod.Value,
        cdsCondPagtocobnome.Value,
        cdsCondPagtozoncod.Value,
        cdsCondPagtozondescr.Value,
        cdsCondPagtoasscod.Value,
        cdsCondPagtoassnome.Value,
        cdsCondPagtoadavldesc.Value,
        cdsCondPagtocpanroparc.Value,
        cdsCondPagtocpadtvenc.Value,
        cdsCondPagtocpavl.Value,
        cdsCondPagtoadavlpend.Value]);
    end;

    ChaveAnterior := cdsCondPagtocobcod.AsString + cdsCondPagtozoncod.AsString + cdsCondPagtoasscod.AsString;

    cdsCondPagto.Next;
  end;

  cdsCondPagtoAux.First;


  // ---------------------------------------------------------------------------
  // Configuração do Cabeçalho e rodapé
  // ---------------------------------------------------------------------------

  SubTitulo := 'Período de vencimento das parcelas: ' + FormatDateTime('dd/mm/yyyy', ADataInicial) + ' até ' + FormatDateTime('dd/mm/yyyy', ADataFinal);

  ConfigurarCabecalhoRodape('Condições de Pagamento', SubTitulo);

  // ---------------------------------------------------------------------------
  // Mostra o relatório na tela
  // ---------------------------------------------------------------------------

  frxCondPagto.ShowReport;
end;

procedure TdmDadosRelat.ShowReportCortesias;
begin
  cdsCortesias.Close;
  cdsCortesias.Open;

  if cdsCortesias.RecordCount = 0 then
  begin
    MessageDlg('Não existem resultados para serem mostrados.', mtInformation, [mbok], 0);
    exit;
  end;

  // ---------------------------------------------------------------------------
  // Configuração do Cabeçalho e rodapé
  // ---------------------------------------------------------------------------

  ConfigurarCabecalhoRodape('Assinaturas Cortesias', '');

  // ---------------------------------------------------------------------------
  // Mostra o relatório na tela
  // ---------------------------------------------------------------------------

  frxCortesias.ShowReport;

end;

procedure TdmDadosRelat.ShowReportDescontos(ADataInicial, ADataFinal: TDate);
var
  SubTitulo: String;
begin
  // ---------------------------------------------------------------------------
  // Validações
  // ---------------------------------------------------------------------------

  if ADataInicial = 0 then
    raise Exception.Create('Data inicial não é válida.');

  if ADataFinal = 0 then
    raise Exception.Create('Data final não é válida.');

  if ADataInicial > ADataFinal then
    raise Exception.Create('Data inicial não pode ser maior que data final.');


  sqlDescontos.Close;
  sqlDescontos.ParamByName('adadtini1').AsDate := ADataInicial;
  sqlDescontos.ParamByName('adadtini2').AsDate := ADataFinal;
  cdsDescontos.Close;
  cdsDescontos.Open;

  if cdsDescontos.RecordCount = 0 then
  begin
    MessageDlg('Não existem resultados para serem mostrados.', mtInformation, [mbok], 0);
    exit;
  end;

  // ---------------------------------------------------------------------------
  // Configuração do Cabeçalho e rodapé
  // ---------------------------------------------------------------------------

  SubTitulo := 'Assinaturas renovadas no Período de: ' + FormatDateTime('dd/mm/yyyy', ADataInicial) + ' até ' + FormatDateTime('dd/mm/yyyy', ADataFinal);

  ConfigurarCabecalhoRodape('Descontos Realizados', SubTitulo);

  // ---------------------------------------------------------------------------
  // Mostra o relatório na tela
  // ---------------------------------------------------------------------------

  frxDescontos.ShowReport;
end;

procedure TdmDadosRelat.ShowReportEtiquetas(ATipoImpressora: Integer; AConsideraImprimirEtiqueta: Boolean;
  ASomenteAssinatesAtivos: Boolean);
var
  SQL: String;
  Where: String;
  StrDataVencimentoAss: String;
  ZoncodAnt: String;
  ZondescrAnt: String;
  EntregadorAnt: String;
begin

  // ---------------------------------------------------------------------------
  // Montagem e execução do SQL
  // ---------------------------------------------------------------------------

  SQL :=
    'select tblass.asscod, tblzon.zoncod, tblzon.zondescr, tblzon.zonentregador, ' +
    '       tblass.assnome, ' +
    '       tblrdz.rdzender, tblass.assnroent, tblass.asscomplent ' +
    '  from tblass, tblrdz, tblzon ' +
    ' where tblass.rdzcod = tblrdz.rdzcod ' +
    '   and tblrdz.zoncod = tblzon.zoncod ';

  if AConsideraImprimirEtiqueta then
    SQL := SQL + ' and tblass.assimpretiq = "S" ';

  if ASomenteAssinatesAtivos then
    SQL := SQL + ' and tblass.assstatus = 0 '; // Ativos

  Where := GetSqlWhereZonas;

  if Where = EmptyStr then
    raise Exception.Create('Pelo menos uma zona deve ser selecionada.');

  SQL := SQL +
    ' and tblzon.zoncod in (' + Where + ')' +
    ' order by tblzon.zoncod, tblrdz.rdzender, tblass.assnroent, tblass.assnome';

  TfrmMensagem.MostrarMesagem('Aguarde, gerando etiquetas...');
  try
    sqlEtiquetasSql.Close;
    sqlEtiquetasSql.CommandText := SQL;

    cdsEtiquetasSql.Close;
    cdsEtiquetasSql.Open;

    if cdsEtiquetasSql.Eof then
    begin
      MessageDlg('Não existem resultados para serem mostrados.', mtInformation, [mbok], 0);
      exit;
    end;

    cdsEtiquetas.Close;
    cdsEtiquetas.CreateDataSet;
    cdsEtiquetas.Open;

    ZoncodAnt := cdsEtiquetasSqlzoncod.AsString;
    ZondescrAnt := cdsEtiquetasSqlzondescr.AsString;
    EntregadorAnt := cdsEtiquetasSqlzonentregador.AsString;

    while not cdsEtiquetasSql.Eof do
    begin
      // Faz etiqueta da zona anterior
      if ZoncodAnt <> cdsEtiquetasSqlzoncod.AsString then
      begin
        sqlCountAssAtivosZona.Close;
        sqlCountAssAtivosZona.ParamByName('zoncod').AsString := ZoncodAnt;
        sqlCountAssAtivosZona.Open;

        cdsEtiquetas.Append;
        cdsEtiquetasPinta.AsInteger := 1;
        cdsEtiquetaszoncod.AsString := '';
        cdsEtiquetaszoncod_Ordem.AsString := ZoncodAnt;
        cdsEtiquetasassnome.AsString := ZoncodAnt + ' - ' + ZondescrAnt;
        cdsEtiquetasEndereco.AsString := EntregadorAnt;
        cdsEtiquetasasscomplent.AsString := FormatFloat('0', sqlCountAssAtivosZonaQtdeAtivos.AsInteger) + ' ASSINANTES ATIVOS';
        cdsEtiquetasAdadtvenc.AsString := '';
        cdsEtiquetasrdzender.AsString := 'XXXXX';
        cdsEtiquetasassnroent_Inteiro.AsInteger := 99999;
        cdsEtiquetasassnroent_String.AsString := '99999';
        cdsEtiquetasasscomplent_Inteiro.Value := 99999;
        cdsEtiquetas.Post;

        ZoncodAnt := cdsEtiquetasSqlzoncod.AsString;
        ZondescrAnt := cdsEtiquetasSqlzondescr.AsString;
        EntregadorAnt := cdsEtiquetasSqlzonentregador.AsString;
      end;

      // Busca a data de vencimento da última assinatura do assinante.
      sqlUltAssinatura.Close;
      sqlUltAssinatura.ParamByName('asscod').AsInteger := cdsEtiquetasSqlasscod.AsInteger;
      sqlUltAssinatura.Open;

      if not sqlUltAssinatura.Eof then
        StrDataVencimentoAss := 'VENC: ' + FormatDateTime('dd/mm/yyyy', sqlUltAssinaturaadadtvenc.AsDateTime)
      else
        StrDataVencimentoAss := '';


      cdsEtiquetas.Append;
      cdsEtiquetasPinta.AsInteger := 0;
      cdsEtiquetaszoncod.AsString := cdsEtiquetasSqlzoncod.AsString;
      cdsEtiquetaszoncod_Ordem.AsString := cdsEtiquetasSqlzoncod.AsString;
      cdsEtiquetasassnome.AsString := cdsEtiquetasSqlassnome.AsString;
      cdsEtiquetasEndereco.AsString := dmDadosGlobal.FormataEndereco(cdsEtiquetasSqlrdzender.AsString, cdsEtiquetasSqlassnroent.AsString);
      cdsEtiquetasasscomplent.AsString := copy(trim(cdsEtiquetasSqlasscomplent.AsString), 1, 25);
      cdsEtiquetasAdadtvenc.AsString := StrDataVencimentoAss;
      cdsEtiquetasrdzender.AsString := trim(cdsEtiquetasSqlrdzender.AsString);
      cdsEtiquetasassnroent_Inteiro.AsInteger := StrToInt(dmDadosGlobal.GetSoNumeros(cdsEtiquetasSqlassnroent.AsString, '0'));
      cdsEtiquetasassnroent_String.AsString := dmDadosGlobal.GetSoLetras(cdsEtiquetasSqlassnroent.AsString);
      cdsEtiquetasasscomplent_Inteiro.Value := StrToInt(dmDadosGlobal.GetPrimeirosNumeroComplementoEndereco(cdsEtiquetasSqlasscomplent.AsString, '0'));
      cdsEtiquetas.Post;

      // Faz a última etiqueta da última zona
      if cdsEtiquetasSql.RecNo = cdsEtiquetasSql.RecordCount then
      begin
        sqlCountAssAtivosZona.Close;
        sqlCountAssAtivosZona.ParamByName('zoncod').AsString := cdsEtiquetasSqlzoncod.AsString;
        sqlCountAssAtivosZona.Open;

        cdsEtiquetas.Append;
        cdsEtiquetasPinta.AsInteger := 1;
        cdsEtiquetaszoncod.AsString := '';
        cdsEtiquetaszoncod_Ordem.AsString := cdsEtiquetasSqlzoncod.AsString;
        cdsEtiquetasassnome.AsString := cdsEtiquetasSqlzoncod.AsString + ' - ' + cdsEtiquetasSqlzondescr.AsString;
        cdsEtiquetasEndereco.AsString := cdsEtiquetasSqlzonentregador.AsString;
        cdsEtiquetasasscomplent.AsString := FormatFloat('0', sqlCountAssAtivosZonaQtdeAtivos.AsInteger) + ' ASSINANTES ATIVOS';
        cdsEtiquetasAdadtvenc.AsString := '';
        cdsEtiquetasrdzender.AsString := 'XXXXX';
        cdsEtiquetasassnroent_Inteiro.AsInteger := 99999;
        cdsEtiquetasassnroent_String.AsString := '99999';
        cdsEtiquetasasscomplent_Inteiro.Value := 99999;
        cdsEtiquetas.Post;
      end;

      cdsEtiquetasSql.Next;
    end;

    cdsEtiquetas.First;
  finally
    TfrmMensagem.MostrarMesagem;
  end;

  // Ordenação do ClientDataSet
  cdsEtiquetas.IndexFieldNames := 'zoncod_Ordem;rdzender;assnroent_Inteiro;assnroent_String;asscomplent_Inteiro;assnome';


  // ---------------------------------------------------------------------------
  // Mostra o relatório na tela
  // ---------------------------------------------------------------------------

  if ATipoImpressora = 0 then // Jato de tinta
    frxEtiquetaJato.ShowReport
  else
    frxEtiquetaArgox.ShowReport;

end;

end.
