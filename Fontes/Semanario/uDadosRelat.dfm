object dmDadosRelat: TdmDadosRelat
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 623
  Width = 1523
  object sqlBaixas: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      '/*SQL EST'#193' NO C'#211'DIGO FONTE*/'#13#10#13#10'select tblgdv.gdvcod, tblgdv.gdv' +
      'descr, tblass.asscod, tblass.assnome,     '#13#10'          tblbda.ada' +
      'cod, tblbda.bdadt, tblada.adadtvenc, tblbda.bdavl   '#13#10'  from tbl' +
      'ass, tblven, tblgdv, tblada, tblbda  '#13#10'where tblass.vencod = tbl' +
      'ven.vencod   '#13#10'   and tblven.gdvcod = tblgdv.gdvcod   '#13#10'   and t' +
      'blass.asscod = tblada.asscod  '#13#10'   '#13#10'   and tblada.asscod = tblb' +
      'da.asscod'#13#10'   and tblada.adacod = tblbda.adacod'#13#10'   '#13#10'   and tbl' +
      'bda.bdadt between "2013-09-01" and "2013-09-30" '#13#10'   and tblgdv.' +
      'gdvcod in (6, 5, 2, 11, 1, 10, 12, 3, 9, 4, 13, 7, 8)'#13#10'order by ' +
      'tblgdv.gdvcod, tblbda.bdadt, tblass.assnome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 176
    Top = 8
  end
  object cdsCabecalhoRodape: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 56
    Top = 8
    object cdsCabecalhoRodapeCNPJ: TStringField
      FieldName = 'CNPJ'
      Size = 18
    end
    object cdsCabecalhoRodapeEmpresa: TStringField
      FieldName = 'Empresa'
      Size = 200
    end
    object cdsCabecalhoRodapeEndereco: TStringField
      FieldName = 'Endereco'
      Size = 255
    end
    object cdsCabecalhoRodapeCidade: TStringField
      FieldName = 'Cidade'
      Size = 60
    end
    object cdsCabecalhoRodapeCidadeEstado: TStringField
      FieldName = 'CidadeEstado'
      Size = 100
    end
    object cdsCabecalhoRodapeFoneEmpresa: TStringField
      FieldName = 'FoneEmpresa'
      Size = 15
    end
    object cdsCabecalhoRodapeTitulo: TStringField
      FieldName = 'Titulo'
      Size = 200
    end
    object cdsCabecalhoRodapeSubTitulo: TStringField
      FieldName = 'SubTitulo'
      Size = 200
    end
    object cdsCabecalhoRodapeUsuario: TStringField
      FieldName = 'Usuario'
      Size = 100
    end
    object cdsCabecalhoRodapeVersao: TStringField
      FieldName = 'Versao'
      Size = 100
    end
  end
  object sqlGruposVendedores: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select gdvcod, gdvdescr'#13#10'from tblgdv'#13#10'order by 2'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 128
    Top = 352
  end
  object dspGruposVendedores: TDataSetProvider
    DataSet = sqlGruposVendedores
    Left = 128
    Top = 400
  end
  object cdsGruposVendedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGruposVendedores'
    Left = 128
    Top = 448
    object cdsGruposVendedoresCalcSelecionado: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'CalcSelecionado'
    end
    object cdsGruposVendedoresgdvcod: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'gdvcod'
      Required = True
    end
    object cdsGruposVendedoresgdvdescr: TStringField
      DisplayLabel = 'Descri'#231#227'o do grupo'
      FieldName = 'gdvdescr'
      Required = True
      Size = 60
    end
  end
  object frxDsCabecalhoRodape: TfrxDBDataset
    UserName = 'dsCabecalhoRodape'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CNPJ=CNPJ'
      'Empresa=Empresa'
      'Endereco=Endereco'
      'Cidade=Cidade'
      'CidadeEstado=CidadeEstado'
      'FoneEmpresa=FoneEmpresa'
      'Titulo=Titulo'
      'SubTitulo=SubTitulo'
      'Usuario=Usuario'
      'Versao=Versao')
    DataSet = cdsCabecalhoRodape
    BCDToCurrency = False
    Left = 56
    Top = 56
  end
  object frxPDFExport: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    Left = 56
    Top = 184
  end
  object frxRTFExport: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PictureType = gpPNG
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 56
    Top = 232
  end
  object frxCSVExport: TfrxCSVExport
    FileName = 'D:\Usuarios\Cristiano\Downloads\Baixas.csv'
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    CreationTime = 41482.981353900460000000
    DataOnly = False
    Separator = ';'
    OEMCodepage = False
    UTF8 = False
    OpenAfterExport = True
    NoSysSymbols = True
    ForcedQuotes = False
    Left = 56
    Top = 136
  end
  object frxDsBaixas: TfrxDBDataset
    UserName = 'dsBaixas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'gdvcod=gdvcod'
      'gdvdescr=gdvdescr'
      'asscod=asscod'
      'assnome=assnome'
      'adacod=adacod'
      'bdadt=bdadt'
      'adadtvenc=adadtvenc'
      'bdavl=bdavl')
    DataSet = cdsBaixas
    BCDToCurrency = False
    Left = 176
    Top = 152
  end
  object frxBaixas: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41479.950144166700000000
    ReportOptions.LastChange = 41545.400310231480000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 176
    Top = 200
    Datasets = <
      item
        DataSet = frxDsBaixas
        DataSetName = 'dsBaixas'
      end
      item
        DataSet = frxDsCabecalhoRodape
        DataSetName = 'dsCabecalhoRodape'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Baixas: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 25.677180000000000000
        Top = 389.291590000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Align = baWidth
          Top = 0.094310000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object dsCabecalhoRodapeUsuario: TfrxMemoView
          Align = baLeft
          Top = 3.897340000000000000
          Width = 377.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Usuario'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Usuario"]')
        end
        object dsCabecalhoRodapeVersao: TfrxMemoView
          Align = baRight
          Left = 518.480520000000000000
          Top = 3.897340000000000000
          Width = 199.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Versao'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Versao"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 76.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object dsCabecalhoEmpresa: TfrxMemoView
          Align = baLeft
          Top = 1.377860000000000000
          Width = 503.016080000000000000
          Height = 18.897650000000000000
          DataField = 'Empresa'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Empresa"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 598.666666670000000000
          Top = 23.146876670000000000
          Width = 75.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
        end
        object Memo2: TfrxMemoView
          Align = baRight
          Left = 676.622450000000000000
          Top = 23.146876660000000000
          Width = 41.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          HAlign = haRight
          Memo.UTF8W = (
            '[Time]')
        end
        object Memo3: TfrxMemoView
          Align = baRight
          Left = 513.913730000000000000
          Top = 1.480210000000000000
          Width = 204.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] de [TotalPages#]')
          ParentFont = False
        end
        object dsCabecalhoRodapeTitulo: TfrxMemoView
          Left = 128.000000000000000000
          Top = 23.480210000000000000
          Width = 465.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Titulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Titulo"]')
          ParentFont = False
        end
        object dsCabecalhoRodapeSubTitulo: TfrxMemoView
          Align = baWidth
          Top = 48.480210000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataField = 'SubTitulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."SubTitulo"]')
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 72.480210000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 29.236240000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        Condition = 'dsBaixas."gdvdescr"'
        object dsBaixasgdvdescr: TfrxMemoView
          Left = 52.000000000000000000
          Top = 8.000000000000000000
          Width = 575.850650000000000000
          Height = 18.897650000000000000
          DataSet = frxDsBaixas
          DataSetName = 'dsBaixas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dsBaixas."gdvcod"] - [dsBaixas."gdvdescr"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Top = 8.000000000000000000
          Width = 49.133858270000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Grupo:')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.897650000000000000
        Top = 257.008040000000000000
        Width = 718.110700000000000000
        DataSet = frxDsBaixas
        DataSetName = 'dsBaixas'
        RowCount = 0
        object dsBaixasassnome: TfrxMemoView
          Left = 53.000000000000000000
          Top = 1.889763780000000000
          Width = 482.630180000000000000
          Height = 18.897650000000000000
          DataField = 'assnome'
          DataSet = frxDsBaixas
          DataSetName = 'dsBaixas'
          Memo.UTF8W = (
            '[dsBaixas."assnome"]')
        end
        object dsBaixasasscod: TfrxMemoView
          Align = baLeft
          Top = 1.991960000000000000
          Width = 50.267716540000000000
          Height = 18.897637800000000000
          DataField = 'asscod'
          DataSet = frxDsBaixas
          DataSetName = 'dsBaixas'
          Memo.UTF8W = (
            '[dsBaixas."asscod"]')
        end
        object dsBaixasbdavl: TfrxMemoView
          Align = baRight
          Left = 634.740570000000000000
          Top = 1.991960000000000000
          Width = 83.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDsBaixas
          DataSetName = 'dsBaixas'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[dsBaixas."bdavl"]')
        end
        object dsBaixasadadtvenc: TfrxMemoView
          Left = 546.000000000000000000
          Top = 1.991960000000000000
          Width = 84.370130000000000000
          Height = 18.897650000000000000
          DataField = 'adadtvenc'
          DataSet = frxDsBaixas
          DataSetName = 'dsBaixas'
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsBaixas."adadtvenc"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 25.834570000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Align = baLeft
          Width = 50.267716540000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'C'#243'digo')
        end
        object Line3: TfrxLineView
          Align = baWidth
          Top = 22.055040000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 52.913385830000000000
          Width = 76.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Assinante')
        end
        object Memo8: TfrxMemoView
          Align = baRight
          Left = 642.622450000000000000
          Width = 75.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Baixa')
        end
        object Memo7: TfrxMemoView
          Left = 546.141732280000000000
          Top = 0.834570000000000000
          Width = 84.283464570000000000
          Height = 18.897650000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            'Dt.Venc.Ass.')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 26.897650000000000000
        ParentFont = False
        Top = 340.157700000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Align = baRight
          Left = 623.622450000000000000
          Top = 5.590290000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dsBaixas."bdavl">,MasterData1)]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Align = baWidth
          Top = 1.708410000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo12: TfrxMemoView
          Left = 507.000000000000000000
          Top = 5.708410000000000000
          Width = 110.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL GERAL:')
          ParentFont = False
        end
      end
    end
  end
  object dspBaixas: TDataSetProvider
    DataSet = sqlBaixas
    Left = 176
    Top = 56
  end
  object cdsBaixas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBaixas'
    Left = 176
    Top = 104
    object cdsBaixasgdvcod: TIntegerField
      FieldName = 'gdvcod'
      Required = True
    end
    object cdsBaixasgdvdescr: TStringField
      FieldName = 'gdvdescr'
      Required = True
      Size = 60
    end
    object cdsBaixasasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object cdsBaixasassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
    object cdsBaixasadacod: TIntegerField
      FieldName = 'adacod'
      Required = True
    end
    object cdsBaixasbdadt: TDateField
      FieldName = 'bdadt'
      Required = True
    end
    object cdsBaixasadadtvenc: TDateField
      FieldName = 'adadtvenc'
      Required = True
    end
    object cdsBaixasbdavl: TFloatField
      FieldName = 'bdavl'
      Required = True
    end
  end
  object sqlAssCanceladas: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      '/*SQL EST'#193' NO C'#211'DIGO FONTE*/'#13#10#13#10'select tblzon.zoncod, tblzon.zon' +
      'descr, tblass.asscod, tblass.assnome,'#13#10'      tblass.assfoneresid' +
      ', tblass.assfonecelul, tblass.assfonecomer,'#13#10'      tblada.adacod' +
      ', tblrdz.rdzender, tblass.assnroent, tblass.asscomplent,'#13#10'      ' +
      ' tblada.adadtcancel, tblada.adadtvenc, tblada.adavlpend'#13#10'from tb' +
      'lass, tblada, tblrdz, tblzon'#13#10'where tblass.asscod = tblada.assco' +
      'd'#13#10'and tblass.rdzcod = tblrdz.rdzcod'#13#10'and tblrdz.zoncod = tblzon' +
      '.zoncod'#13#10'and tblada.adacancel = '#39'S'#39#13#10'and tblada.adadtcancel betw' +
      'een '#39'2013-07-01'#39' and '#39'2013-07-20'#39#13#10'order by tblzon.zoncod, tblad' +
      'a.adadtvenc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 288
    Top = 8
  end
  object dspAssCanceladas: TDataSetProvider
    DataSet = sqlAssCanceladas
    Left = 288
    Top = 56
  end
  object cdsAssCanceladas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAssCanceladas'
    OnCalcFields = cdsAssCanceladasCalcFields
    Left = 290
    Top = 104
    object cdsAssCanceladaszoncod: TStringField
      FieldName = 'zoncod'
      Required = True
      Size = 3
    end
    object cdsAssCanceladaszondescr: TStringField
      FieldName = 'zondescr'
      Required = True
      Size = 60
    end
    object cdsAssCanceladasasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object cdsAssCanceladasassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
    object cdsAssCanceladasassfoneresid: TStringField
      FieldName = 'assfoneresid'
      Size = 15
    end
    object cdsAssCanceladasassfonecelul: TStringField
      FieldName = 'assfonecelul'
      Size = 15
    end
    object cdsAssCanceladasassfonecomer: TStringField
      FieldName = 'assfonecomer'
      Size = 15
    end
    object cdsAssCanceladasadacod: TIntegerField
      FieldName = 'adacod'
      Required = True
    end
    object cdsAssCanceladasrdzender: TStringField
      FieldName = 'rdzender'
      Required = True
      Size = 60
    end
    object cdsAssCanceladasassnroent: TStringField
      FieldName = 'assnroent'
      Required = True
      Size = 5
    end
    object cdsAssCanceladasasscomplent: TStringField
      FieldName = 'asscomplent'
      Size = 60
    end
    object cdsAssCanceladasadadtcancel: TDateField
      FieldName = 'adadtcancel'
    end
    object cdsAssCanceladasadadtvenc: TDateField
      FieldName = 'adadtvenc'
      Required = True
    end
    object cdsAssCanceladasadavlpend: TFloatField
      FieldName = 'adavlpend'
      Required = True
    end
    object cdsAssCanceladasCalcEndereco: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CalcEndereco'
      Size = 255
    end
    object cdsAssCanceladasCalcTelefone: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcTelefone'
      Size = 15
      Calculated = True
    end
  end
  object frxDsAssCanceladas: TfrxDBDataset
    UserName = 'dsAssCanceladas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'zoncod=zoncod'
      'zondescr=zondescr'
      'asscod=asscod'
      'assnome=assnome'
      'assfoneresid=assfoneresid'
      'assfonecelul=assfonecelul'
      'assfonecomer=assfonecomer'
      'adacod=adacod'
      'rdzender=rdzender'
      'assnroent=assnroent'
      'asscomplent=asscomplent'
      'adadtcancel=adadtcancel'
      'adadtvenc=adadtvenc'
      'adavlpend=adavlpend'
      'CalcEndereco=CalcEndereco'
      'CalcTelefone=CalcTelefone')
    DataSet = cdsAssCanceladas
    BCDToCurrency = True
    Left = 288
    Top = 152
  end
  object frxAssCanceladas: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41479.950144166700000000
    ReportOptions.LastChange = 41501.895397037030000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 288
    Top = 200
    Datasets = <
      item
        DataSet = frxDsAssCanceladas
        DataSetName = 'dsAssCanceladas'
      end
      item
        DataSet = frxDsCabecalhoRodape
        DataSetName = 'dsCabecalhoRodape'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Baixas: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 25.677180000000000000
        Top = 389.291590000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Align = baWidth
          Top = 0.094310000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object dsCabecalhoRodapeUsuario: TfrxMemoView
          Align = baLeft
          Top = 3.897340000000000000
          Width = 377.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Usuario'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Usuario"]')
        end
        object dsCabecalhoRodapeVersao: TfrxMemoView
          Align = baRight
          Left = 518.480520000000000000
          Top = 3.897340000000000000
          Width = 199.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Versao'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Versao"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 76.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object dsCabecalhoEmpresa: TfrxMemoView
          Align = baLeft
          Top = 1.377860000000000000
          Width = 503.016080000000000000
          Height = 18.897650000000000000
          DataField = 'Empresa'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Empresa"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 598.666666670000000000
          Top = 23.146876670000000000
          Width = 75.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
        end
        object Memo2: TfrxMemoView
          Align = baRight
          Left = 676.622450000000000000
          Top = 23.146876660000000000
          Width = 41.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          HAlign = haRight
          Memo.UTF8W = (
            '[Time]')
        end
        object Memo3: TfrxMemoView
          Align = baRight
          Left = 513.913730000000000000
          Top = 1.480210000000000000
          Width = 204.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] de [TotalPages#]')
          ParentFont = False
        end
        object dsCabecalhoRodapeTitulo: TfrxMemoView
          Left = 128.000000000000000000
          Top = 23.480210000000000000
          Width = 465.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Titulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Titulo"]')
          ParentFont = False
        end
        object dsCabecalhoRodapeSubTitulo: TfrxMemoView
          Align = baWidth
          Top = 48.480210000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataField = 'SubTitulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."SubTitulo"]')
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 72.480210000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 29.102362200000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        Condition = 'dsAssCanceladas."zoncod"'
        object dsBaixasgdvdescr: TfrxMemoView
          Left = 44.000000000000000000
          Top = 8.000000000000000000
          Width = 575.850650000000000000
          Height = 18.897650000000000000
          DataSet = frxDsBaixas
          DataSetName = 'dsBaixas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dsAssCanceladas."zoncod"] - [dsAssCanceladas."zondescr"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Top = 8.000000000000000000
          Width = 41.133858270000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Zona:')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.897650000000000000
        Top = 257.008040000000000000
        Width = 718.110700000000000000
        DataSet = frxDsAssCanceladas
        DataSetName = 'dsAssCanceladas'
        RowCount = 0
        Stretched = True
        object dsBaixasassnome: TfrxMemoView
          Left = 45.000000000000000000
          Top = 1.889763780000000000
          Width = 170.850650000000000000
          Height = 18.897650000000000000
          DataSet = frxDsBaixas
          DataSetName = 'dsBaixas'
          Memo.UTF8W = (
            '[dsAssCanceladas."assnome"]')
          WordWrap = False
        end
        object dsBaixasasscod: TfrxMemoView
          Align = baLeft
          Top = 1.991960000000000000
          Width = 42.708656540000000000
          Height = 18.897637800000000000
          DataSet = frxDsBaixas
          DataSetName = 'dsBaixas'
          Memo.UTF8W = (
            '[dsAssCanceladas."asscod"]')
        end
        object dsBaixasbdadt: TfrxMemoView
          Left = 585.000000000000000000
          Top = 1.991960000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataField = 'adadtvenc'
          DataSet = frxDsAssCanceladas
          DataSetName = 'dsAssCanceladas'
          Memo.UTF8W = (
            '[dsAssCanceladas."adadtvenc"]')
        end
        object dsBaixasbdavl: TfrxMemoView
          Align = baRight
          Left = 665.197314173228400000
          Top = 1.991960000000000000
          Width = 52.913385826771650000
          Height = 18.897650000000000000
          DataSet = frxDsBaixas
          DataSetName = 'dsBaixas'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[dsAssCanceladas."adavlpend"]')
        end
        object Memo13: TfrxMemoView
          Left = 222.000000000000000000
          Top = 1.889763780000000000
          Width = 265.409710000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'CalcEndereco'
          DataSet = frxDsAssCanceladas
          DataSetName = 'dsAssCanceladas'
          Memo.UTF8W = (
            '[dsAssCanceladas."CalcEndereco"]')
        end
        object dsAssCanceladasadacod: TfrxMemoView
          Left = 491.000000000000000000
          Top = 1.889763780000000000
          Width = 89.370078740000000000
          Height = 18.897650000000000000
          DataField = 'CalcTelefone'
          DataSet = frxDsAssCanceladas
          DataSetName = 'dsAssCanceladas'
          HAlign = haRight
          Memo.UTF8W = (
            '[dsAssCanceladas."CalcTelefone"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 25.834570000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Align = baLeft
          Width = 42.708661420000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'C'#243'd.')
        end
        object Line3: TfrxLineView
          Align = baWidth
          Top = 22.055040000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 44.976377950000000000
          Width = 76.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Assinante')
        end
        object Memo7: TfrxMemoView
          Left = 585.937007870000000000
          Width = 75.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Data Venc.')
        end
        object Memo8: TfrxMemoView
          Align = baRight
          Left = 665.197314173228400000
          Width = 52.913385826771650000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Vl.Pend.')
        end
        object Memo14: TfrxMemoView
          Left = 221.858267720000000000
          Width = 144.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Endere'#231'o de entrega')
        end
        object Memo9: TfrxMemoView
          Left = 490.960629921259800000
          Width = 89.196850390000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Telefone')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 26.897650000000000000
        ParentFont = False
        Top = 340.157700000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Align = baRight
          Left = 623.622450000000000000
          Top = 5.590290000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dsAssCanceladas."adavlpend">,MasterData1)]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Align = baWidth
          Top = 1.708410000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo12: TfrxMemoView
          Left = 507.000000000000000000
          Top = 5.708410000000000000
          Width = 110.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL GERAL:')
          ParentFont = False
        end
      end
    end
  end
  object sqlZonas: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select zoncod, zondescr'#13#10'from tblzon'#13#10'order by zondescr'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 232
    Top = 352
  end
  object dspZonas: TDataSetProvider
    DataSet = sqlZonas
    Left = 232
    Top = 400
  end
  object cdsZonas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspZonas'
    Left = 232
    Top = 448
    object cdsZonasCalcSelecionado: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'CalcSelecionado'
    end
    object cdsZonaszoncod: TStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'zoncod'
      Required = True
      Size = 3
    end
    object cdsZonaszondescr: TStringField
      DisplayLabel = 'Descri'#231#227'o da zona'
      FieldName = 'zondescr'
      Required = True
      Size = 60
    end
  end
  object sqlAssPendentes: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      '/*SQL EST'#193' NO C'#211'DIGO FONTE*/'#13#10#13#10'SELECT '#39#39' as codigo, '#39#39' as descr' +
      ','#13#10'       tblzon.zoncod, tblzon.zondescr,'#13#10'       tblass.asscod,' +
      ' tblass.assnome, tblrdz.rdzender, tblass.assnroent,'#13#10'       tbla' +
      'da.adadtvenc, tblada.adavlpend'#13#10'FROM tblass, tblada, tblven, tbl' +
      'gdv, tblcob, tblrdz, tblzon'#13#10'WHERE tblass.asscod = tblada.asscod' +
      ' '#13#10'AND tblass.vencod = tblven.vencod '#13#10'AND tblven.gdvcod = tblgd' +
      'v.gdvcod '#13#10'AND tblass.cobcod = tblcob.cobcod '#13#10'AND tblass.rdzcod' +
      ' = tblrdz.rdzcod '#13#10'AND tblrdz.zoncod = tblzon.zoncod '#13#10'AND tblad' +
      'a.adadtvenc BETWEEN '#39'2013-01-01'#39' AND '#39'2013-05-18'#39' '#13#10'AND tblass.a' +
      'ssstatus = 0'#13#10'AND tblada.adavlpend > 0'#13#10'AND tblada.adacancel = '#39 +
      'N'#39#13#10'ORDER BY 1, tblzon.zoncod, tblada.adadtvenc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 416
    Top = 8
  end
  object cdsAssPendentes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 416
    Top = 104
    object cdsAssPendentesChave: TStringField
      FieldName = 'Chave'
      Size = 100
    end
    object cdsAssPendenteszoncod: TStringField
      FieldName = 'zoncod'
      Size = 5
    end
    object cdsAssPendenteszondescr: TStringField
      FieldName = 'zondescr'
      Size = 60
    end
    object cdsAssPendentesasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object cdsAssPendentesassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
    object cdsAssPendentesEndereco: TStringField
      FieldName = 'Endereco'
      Size = 255
    end
    object cdsAssPendentesadadtvenc: TDateField
      FieldName = 'adadtvenc'
      Required = True
    end
    object cdsAssPendentesadavlpend: TFloatField
      FieldName = 'adavlpend'
      Required = True
    end
  end
  object frxDsAssPendentes: TfrxDBDataset
    UserName = 'dsAssPendentes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Chave=Chave'
      'zoncod=zoncod'
      'zondescr=zondescr'
      'asscod=asscod'
      'assnome=assnome'
      'Endereco=Endereco'
      'adadtvenc=adadtvenc'
      'adavlpend=adavlpend')
    DataSet = cdsAssPendentes
    BCDToCurrency = False
    Left = 416
    Top = 152
  end
  object frxAssPendentes: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41479.950144166700000000
    ReportOptions.LastChange = 41514.900135879630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 416
    Top = 200
    Datasets = <
      item
        DataSet = frxDsAssPendentes
        DataSetName = 'dsAssPendentes'
      end
      item
        DataSet = frxDsCabecalhoRodape
        DataSetName = 'dsCabecalhoRodape'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Baixas: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 25.677180000000000000
        Top = 434.645950000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Align = baWidth
          Top = 0.094310000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object dsCabecalhoRodapeUsuario: TfrxMemoView
          Align = baLeft
          Top = 3.897340000000000000
          Width = 377.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Usuario'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Usuario"]')
        end
        object dsCabecalhoRodapeVersao: TfrxMemoView
          Align = baRight
          Left = 518.480520000000000000
          Top = 3.897340000000000000
          Width = 199.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Versao'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Versao"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 76.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object dsCabecalhoEmpresa: TfrxMemoView
          Align = baLeft
          Top = 1.377860000000000000
          Width = 503.016080000000000000
          Height = 18.897650000000000000
          DataField = 'Empresa'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Empresa"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 598.666666670000000000
          Top = 23.146876670000000000
          Width = 75.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
        end
        object Memo2: TfrxMemoView
          Align = baRight
          Left = 676.622450000000000000
          Top = 23.146876660000000000
          Width = 41.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          HAlign = haRight
          Memo.UTF8W = (
            '[Time]')
        end
        object Memo3: TfrxMemoView
          Align = baRight
          Left = 513.913730000000000000
          Top = 1.480210000000000000
          Width = 204.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] de [TotalPages#]')
          ParentFont = False
        end
        object dsCabecalhoRodapeTitulo: TfrxMemoView
          Left = 128.000000000000000000
          Top = 23.480210000000000000
          Width = 465.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Titulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Titulo"]')
          ParentFont = False
        end
        object dsCabecalhoRodapeSubTitulo: TfrxMemoView
          Align = baRight
          Left = 365.000000000000000000
          Top = 48.480210000000000000
          Width = 353.110700000000000000
          Height = 18.897650000000000000
          DataField = 'SubTitulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCabecalhoRodape."SubTitulo"]')
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 72.480210000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Top = 48.102350000000000000
          Width = 354.110700000000000000
          Height = 18.897650000000000000
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Memo.UTF8W = (
            '[dsAssPendentes."Chave"]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 29.102362200000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        Condition = 'dsAssPendentes."zoncod"'
        object dsBaixasgdvdescr: TfrxMemoView
          Align = baLeft
          Top = 9.000000000000000000
          Width = 682.850650000000000000
          Height = 18.897650000000000000
          DataSet = frxDsBaixas
          DataSetName = 'dsBaixas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Zona: [dsAssPendentes."zoncod"] - [dsAssPendentes."zondescr"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.897650000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        DataSet = frxDsAssPendentes
        DataSetName = 'dsAssPendentes'
        RowCount = 0
        Stretched = True
        object dsBaixasassnome: TfrxMemoView
          Left = 45.000000000000000000
          Top = 1.889763780000000000
          Width = 186.850650000000000000
          Height = 18.897650000000000000
          DataField = 'assnome'
          DataSet = frxDsAssPendentes
          DataSetName = 'dsAssPendentes'
          Memo.UTF8W = (
            '[dsAssPendentes."assnome"]')
          WordWrap = False
        end
        object dsBaixasasscod: TfrxMemoView
          Align = baLeft
          Top = 1.991960000000000000
          Width = 42.708656540000000000
          Height = 18.897637800000000000
          DataField = 'asscod'
          DataSet = frxDsAssPendentes
          DataSetName = 'dsAssPendentes'
          Memo.UTF8W = (
            '[dsAssPendentes."asscod"]')
        end
        object dsBaixasbdadt: TfrxMemoView
          Left = 567.000000000000000000
          Top = 1.991960000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataField = 'adadtvenc'
          DataSet = frxDsAssPendentes
          DataSetName = 'dsAssPendentes'
          Memo.UTF8W = (
            '[dsAssPendentes."adadtvenc"]')
        end
        object dsBaixasbdavl: TfrxMemoView
          Align = baRight
          Left = 642.520148820000000000
          Top = 1.991960000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataField = 'adavlpend'
          DataSet = frxDsAssPendentes
          DataSetName = 'dsAssPendentes'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[dsAssPendentes."adavlpend"]')
        end
        object Memo13: TfrxMemoView
          Left = 236.000000000000000000
          Top = 1.889763780000000000
          Width = 323.630180000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'Endereco'
          DataSet = frxDsAssPendentes
          DataSetName = 'dsAssPendentes'
          Memo.UTF8W = (
            '[dsAssPendentes."Endereco"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 25.834570000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Align = baLeft
          Width = 42.708661420000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'C'#243'd.')
        end
        object Line3: TfrxLineView
          Align = baWidth
          Top = 22.055040000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 44.976377950000000000
          Width = 76.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Assinante')
        end
        object Memo7: TfrxMemoView
          Left = 566.937007870000000000
          Width = 75.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Data Venc.')
        end
        object Memo8: TfrxMemoView
          Align = baRight
          Left = 642.520148818897600000
          Width = 75.590551181102400000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Pend.')
        end
        object Memo14: TfrxMemoView
          Left = 235.842519690000000000
          Width = 144.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Endere'#231'o de entrega')
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Height = 1.322820000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        Condition = 'dsAssPendentes."Chave"'
        StartNewPage = True
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 0.165354330000000000
        Top = 325.039580000000000000
        Width = 718.110700000000000000
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Height = 26.834645670000000000
        Top = 347.716760000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          Align = baRight
          Left = 623.622450000000000000
          Top = 4.708410000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dsAssPendentes."adavlpend">,MasterData1)]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Align = baWidth
          Top = 0.826530000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Left = 508.000000000000000000
          Top = 4.826530000000000000
          Width = 110.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL GERAL:')
          ParentFont = False
        end
      end
    end
  end
  object sqlVendedores: TSQLDataSet
    CommandText = 'select vencod, vennome'#13#10'from tblven'#13#10'order by vennome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 336
    Top = 352
  end
  object dspVendedores: TDataSetProvider
    DataSet = sqlVendedores
    Left = 336
    Top = 400
  end
  object cdsVendedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendedores'
    Left = 336
    Top = 448
    object cdsVendedoresCalcSelecionado: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'CalcSelecionado'
    end
    object cdsVendedoresvencod: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'vencod'
      Required = True
    end
    object cdsVendedoresvennome: TStringField
      DisplayLabel = 'Nome vendedor'
      FieldName = 'vennome'
      Required = True
      Size = 60
    end
  end
  object sqlCobradores: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select cobcod, cobnome'#13#10'from tblcob'#13#10'order by cobnome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 448
    Top = 352
  end
  object dspCobradores: TDataSetProvider
    DataSet = sqlCobradores
    Left = 448
    Top = 400
  end
  object cdsCobradores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCobradores'
    Left = 448
    Top = 448
    object cdsCobradoresCalcSelecionado: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'CalcSelecionado'
    end
    object cdsCobradorescobcod: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'cobcod'
      Required = True
    end
    object cdsCobradorescobnome: TStringField
      DisplayLabel = 'Nome do cobrador'
      FieldName = 'cobnome'
      Required = True
      Size = 60
    end
  end
  object sqlAssRenovar: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      '/*SQL EST'#193' NO C'#211'DIGO FONTE*/'#13#10#13#10'select tblzon.zoncod, tblzon.zon' +
      'descr, tblass.asscod, tblass.assnome,'#13#10'          tblass.asscpf, ' +
      'tblass.asscnpj,  tblass.assemail,'#13#10'          tblass.assfoneresid' +
      ', tblass.assfonecelul, tblass.assfonecomer, tblass.assfonecomerr' +
      'amal,'#13#10'          tblrdz.rdzender, tblass.assnroent,'#13#10'          t' +
      'blass.asscomplent, tblass.assbairroent, tblcep.cepmunicipio, tbl' +
      'cep.cepeuf,'#13#10'          tblada.adadtini, tblada.adadtvenc, tblada' +
      '.adavl, tblada.adavldesc'#13#10'from tblass, tblcep, tblrdz, tblzon, t' +
      'blada'#13#10'where tblass.rdzcod = tblrdz.rdzcod'#13#10'and tblrdz.zoncod = ' +
      'tblzon.zoncod'#13#10'and tblass.asscod= tblada.asscod'#13#10'and tblass.cepc' +
      'epent = tblcep.cepcep'#13#10'and tblass.assstatus = 0'#13#10'and tblada.adac' +
      'ancel = "N"'#13#10'and tblada.adavlpend > 0'#13#10'and tblada.adadtvenc betw' +
      'een "2014-08-01" and "2014-08-31"'#13#10'order by tblzon.zoncod, tblad' +
      'a.adadtvenc, tblass.assnome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 664
    Top = 8
  end
  object dspAssRenovar: TDataSetProvider
    DataSet = sqlAssRenovar
    Left = 664
    Top = 56
  end
  object cdsAssRenovar: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAssRenovar'
    OnCalcFields = cdsAssRenovarCalcFields
    Left = 664
    Top = 104
    object cdsAssRenovarzoncod: TStringField
      FieldName = 'zoncod'
      Required = True
      Size = 3
    end
    object cdsAssRenovarzondescr: TStringField
      FieldName = 'zondescr'
      Required = True
      Size = 60
    end
    object cdsAssRenovarasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object cdsAssRenovarassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
    object cdsAssRenovarasscpf: TStringField
      FieldName = 'asscpf'
      Size = 14
    end
    object cdsAssRenovarasscnpj: TStringField
      FieldName = 'asscnpj'
      Size = 18
    end
    object cdsAssRenovarassemail: TStringField
      FieldName = 'assemail'
      Size = 60
    end
    object cdsAssRenovarassfoneresid: TStringField
      FieldName = 'assfoneresid'
      Size = 15
    end
    object cdsAssRenovarassfonecelul: TStringField
      FieldName = 'assfonecelul'
      Size = 15
    end
    object cdsAssRenovarassfonecomer: TStringField
      FieldName = 'assfonecomer'
      Size = 15
    end
    object cdsAssRenovarassfonecomerramal: TStringField
      FieldName = 'assfonecomerramal'
      Size = 5
    end
    object cdsAssRenovarrdzender: TStringField
      FieldName = 'rdzender'
      Required = True
      Size = 60
    end
    object cdsAssRenovarassnroent: TStringField
      FieldName = 'assnroent'
      Required = True
      Size = 5
    end
    object cdsAssRenovarasscomplent: TStringField
      FieldName = 'asscomplent'
      Size = 60
    end
    object cdsAssRenovarassbairroent: TStringField
      FieldName = 'assbairroent'
      Size = 45
    end
    object cdsAssRenovarcepmunicipio: TStringField
      FieldName = 'cepmunicipio'
      Required = True
      Size = 60
    end
    object cdsAssRenovarcepeuf: TStringField
      FieldName = 'cepeuf'
      Required = True
      Size = 2
    end
    object cdsAssRenovaradadtini: TDateField
      FieldName = 'adadtini'
      Required = True
    end
    object cdsAssRenovaradadtvenc: TDateField
      FieldName = 'adadtvenc'
      Required = True
    end
    object cdsAssRenovaradavl: TFloatField
      FieldName = 'adavl'
      Required = True
    end
    object cdsAssRenovaradavldesc: TFloatField
      FieldName = 'adavldesc'
      Required = True
    end
    object cdsAssRenovarCalcEnderecoCompleto: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CalcEnderecoCompleto'
      Size = 255
    end
    object cdsAssRenovarCalcTelefones: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CalcTelefones'
      Size = 100
    end
    object cdsAssRenovarCalcNomeCpf: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CalcNomeCpf'
      Size = 100
    end
    object cdsAssRenovarCalcValorPorExtenso: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CalcValorPorExtenso'
      Size = 255
    end
    object cdsAssRenovarCalcImpLinhaSep: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'CalcImpLinhaSep'
    end
  end
  object frxDsAssRenovar: TfrxDBDataset
    UserName = 'dsAssRenovar'
    CloseDataSource = False
    FieldAliases.Strings = (
      'zoncod=zoncod'
      'zondescr=zondescr'
      'asscod=asscod'
      'assnome=assnome'
      'asscpf=asscpf'
      'asscnpj=asscnpj'
      'assemail=assemail'
      'assfoneresid=assfoneresid'
      'assfonecelul=assfonecelul'
      'assfonecomer=assfonecomer'
      'assfonecomerramal=assfonecomerramal'
      'rdzender=rdzender'
      'assnroent=assnroent'
      'asscomplent=asscomplent'
      'assbairroent=assbairroent'
      'cepmunicipio=cepmunicipio'
      'cepeuf=cepeuf'
      'adadtini=adadtini'
      'adadtvenc=adadtvenc'
      'adavl=adavl'
      'adavldesc=adavldesc'
      'CalcEnderecoCompleto=CalcEnderecoCompleto'
      'CalcTelefones=CalcTelefones'
      'CalcNomeCpf=CalcNomeCpf'
      'CalcValorPorExtenso=CalcValorPorExtenso'
      'CalcImpLinhaSep=CalcImpLinhaSep')
    DataSet = cdsAssRenovar
    BCDToCurrency = False
    Left = 664
    Top = 152
  end
  object frxAssRenovar: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41479.950144166700000000
    ReportOptions.LastChange = 42167.945449351850000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 624
    Top = 200
    Datasets = <
      item
        DataSet = frxDsAssRenovar
        DataSetName = 'dsAssRenovar'
      end
      item
        DataSet = frxDsCabecalhoRodape
        DataSetName = 'dsCabecalhoRodape'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Baixas: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 25.677180000000000000
        Top = 389.291590000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Align = baWidth
          Top = 0.094310000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object dsCabecalhoRodapeUsuario: TfrxMemoView
          Align = baLeft
          Top = 3.897340000000000000
          Width = 377.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Usuario'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Usuario"]')
        end
        object dsCabecalhoRodapeVersao: TfrxMemoView
          Align = baRight
          Left = 518.480520000000000000
          Top = 3.897340000000000000
          Width = 199.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Versao'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Versao"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 76.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object dsCabecalhoEmpresa: TfrxMemoView
          Align = baLeft
          Top = 1.377860000000000000
          Width = 503.016080000000000000
          Height = 18.897650000000000000
          DataField = 'Empresa'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Empresa"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 598.666666670000000000
          Top = 23.146876670000000000
          Width = 75.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
        end
        object Memo2: TfrxMemoView
          Align = baRight
          Left = 676.622450000000000000
          Top = 23.146876660000000000
          Width = 41.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          HAlign = haRight
          Memo.UTF8W = (
            '[Time]')
        end
        object Memo3: TfrxMemoView
          Align = baRight
          Left = 513.913730000000000000
          Top = 1.480210000000000000
          Width = 204.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] de [TotalPages#]')
          ParentFont = False
        end
        object dsCabecalhoRodapeTitulo: TfrxMemoView
          Left = 128.000000000000000000
          Top = 23.480210000000000000
          Width = 465.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Titulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Titulo"]')
          ParentFont = False
        end
        object dsCabecalhoRodapeSubTitulo: TfrxMemoView
          Align = baWidth
          Top = 48.480210000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataField = 'SubTitulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."SubTitulo"]')
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 72.480210000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 29.102362200000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        Condition = 'dsAssRenovar."zoncod"'
        object dsBaixasgdvdescr: TfrxMemoView
          Align = baLeft
          Top = 10.000000000000000000
          Width = 682.850650000000000000
          Height = 18.897650000000000000
          DataSet = frxDsBaixas
          DataSetName = 'dsBaixas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Zona: [dsAssRenovar."zoncod"] - [dsAssRenovar."zondescr"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.897650000000000000
        Top = 257.008040000000000000
        Width = 718.110700000000000000
        DataSet = frxDsAssRenovar
        DataSetName = 'dsAssRenovar'
        RowCount = 0
        Stretched = True
        object dsBaixasassnome: TfrxMemoView
          Left = 45.000000000000000000
          Top = 1.889763780000000000
          Width = 221.850650000000000000
          Height = 18.897650000000000000
          DataField = 'assnome'
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            '[dsAssRenovar."assnome"]')
          WordWrap = False
        end
        object dsBaixasasscod: TfrxMemoView
          Align = baLeft
          Top = 1.991960000000000000
          Width = 42.708656540000000000
          Height = 18.897637800000000000
          DataField = 'asscod'
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            '[dsAssRenovar."asscod"]')
        end
        object dsBaixasbdadt: TfrxMemoView
          Left = 567.000000000000000000
          Top = 1.991960000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataField = 'adadtvenc'
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            '[dsAssRenovar."adadtvenc"]')
        end
        object dsBaixasbdavl: TfrxMemoView
          Align = baRight
          Left = 642.520148820000000000
          Top = 1.991960000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataField = 'adavl'
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[dsAssRenovar."adavl"]')
        end
        object Memo4: TfrxMemoView
          Left = 274.842519690000000000
          Top = 1.889763780000000000
          Width = 287.630180000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'CalcEnderecoCompleto'
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            '[dsAssRenovar."CalcEnderecoCompleto"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 25.834570000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Align = baLeft
          Width = 42.708661420000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'C'#243'd.')
        end
        object Line3: TfrxLineView
          Align = baWidth
          Top = 22.055040000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 44.976377950000000000
          Width = 76.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Assinante')
        end
        object Memo7: TfrxMemoView
          Left = 566.937007870000000000
          Width = 75.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Data Venc.')
        end
        object Memo8: TfrxMemoView
          Align = baRight
          Left = 642.520148820000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Ass.')
        end
        object Memo14: TfrxMemoView
          Left = 274.842519690000000000
          Width = 144.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Endere'#231'o de entrega')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 26.897650000000000000
        ParentFont = False
        Top = 340.157700000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Align = baRight
          Left = 623.622450000000000000
          Top = 5.590290000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dsAssRenovar."adavl">,MasterData1)]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Align = baWidth
          Top = 1.708410000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo12: TfrxMemoView
          Left = 507.000000000000000000
          Top = 5.708410000000000000
          Width = 110.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL GERAL:')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 179.000000000000000000
          Top = 4.267470000000000000
          Width = 91.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Align = baLeft
          Top = 4.267470000000000000
          Width = 176.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'TOTAL DE RENOVA'#199#213'ES:')
          ParentFont = False
        end
      end
    end
  end
  object sqlUltRenovacaoAuto: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select gaaanomes'#13#10'from tblgaa'#13#10'order by gaaanomes desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 576
    Top = 448
    object sqlUltRenovacaoAutogaaanomes: TDateField
      FieldName = 'gaaanomes'
      Required = True
    end
  end
  object sqlExisteRenovacao: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select count(*) as nroreg'#13#10'from tblgaa'#13#10'where gaaanomes = :gaaan' +
      'omes'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'gaaanomes'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 688
    Top = 448
    object sqlExisteRenovacaonroreg: TLargeintField
      FieldName = 'nroreg'
      Required = True
    end
  end
  object frxRecibos: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41491.888230544000000000
    ReportOptions.LastChange = 42167.933173888890000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 704
    Top = 200
    Datasets = <
      item
        DataSet = frxDsAssRenovar
        DataSetName = 'dsAssRenovar'
      end
      item
        DataSet = frxDsCabecalhoRodape
        DataSetName = 'dsCabecalhoRodape'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 5.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 523.464566930000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        DataSet = frxDsAssRenovar
        DataSetName = 'dsAssRenovar'
        RowCount = 0
        object Shape1: TfrxShapeView
          Top = 21.000000000000000000
          Width = 755.906000000000000000
          Height = 467.677180000000000000
        end
        object dsCabecalhoRodapeEndereco: TfrxMemoView
          Left = 11.338582680000000000
          Top = 44.102350000000000000
          Width = 473.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Endereco'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Endereco"]')
        end
        object dsCabecalhoRodapeEmpresa: TfrxMemoView
          Left = 11.338582680000000000
          Top = 22.102350000000000000
          Width = 473.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Empresa'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Empresa"]')
          ParentFont = False
        end
        object dsAssRenovaradavl: TfrxMemoView
          Left = 603.000000000000000000
          Top = 64.102350000000000000
          Width = 98.370130000000000000
          Height = 26.897650000000000000
          DataField = 'adavl'
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[dsAssRenovar."adavl"]')
          ParentFont = False
        end
        object dsAssRenovarassnome: TfrxMemoView
          Left = 113.000000000000000000
          Top = 116.102350000000000000
          Width = 637.968770000000000000
          Height = 18.897650000000000000
          DataField = 'CalcNomeCpf'
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dsAssRenovar."CalcNomeCpf"]')
          ParentFont = False
        end
        object dsCabecalhoRodapeCNPJ: TfrxMemoView
          Left = 11.338582680000000000
          Top = 86.102350000000000000
          Width = 252.622140000000000000
          Height = 18.897650000000000000
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Memo.UTF8W = (
            'CNPJ: [dsCabecalhoRodape."CNPJ"]')
        end
        object dsCabecalhoRodapeCidadeEstado: TfrxMemoView
          Left = 11.338582680000000000
          Top = 65.102350000000000000
          Width = 473.630180000000000000
          Height = 18.897650000000000000
          DataField = 'CidadeEstado'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Memo.UTF8W = (
            '[dsCabecalhoRodape."CidadeEstado"]')
        end
        object Line1: TfrxLineView
          Top = 107.102350000000000000
          Width = 757.338590000000000000
          Color = clBlack
          Diagonal = True
        end
        object Line2: TfrxLineView
          Left = 505.000000000000000000
          Top = 21.102350000000000000
          Height = 86.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo1: TfrxMemoView
          Left = 517.000000000000000000
          Top = 31.102350000000000000
          Width = 227.000000000000000000
          Height = 24.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'R E C I B O')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 562.000000000000000000
          Top = 64.102350000000000000
          Width = 36.370130000000000000
          Height = 26.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'R$')
          ParentFont = False
        end
        object dsAssRenovarzondescr: TfrxMemoView
          Left = 11.338582680000000000
          Top = 116.102350000000000000
          Width = 98.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            'Recebemos de:')
        end
        object Memo3: TfrxMemoView
          Left = 11.338582680000000000
          Top = 141.102350000000000000
          Width = 131.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            'Endere'#231'o de entrega:')
        end
        object dsAssRenovarrdzender: TfrxMemoView
          Left = 147.000000000000000000
          Top = 141.102350000000000000
          Width = 603.189240000000000000
          Height = 18.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            '[dsAssRenovar."CalcEnderecoCompleto"]')
        end
        object Memo5: TfrxMemoView
          Left = 11.338582680000000000
          Top = 189.102350000000000000
          Width = 47.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            'E-mail:')
        end
        object dsAssRenovarassbairroent: TfrxMemoView
          Left = 63.000000000000000000
          Top = 189.102350000000000000
          Width = 348.630180000000000000
          Height = 18.897650000000000000
          DataField = 'assemail'
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            '[dsAssRenovar."assemail"]')
        end
        object Memo6: TfrxMemoView
          Left = 11.000000000000000000
          Top = 164.102350000000000000
          Width = 52.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            'Cidade:')
        end
        object dsAssRenovarcepmunicipio: TfrxMemoView
          Left = 68.000000000000000000
          Top = 164.102350000000000000
          Width = 296.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            '[dsAssRenovar."cepmunicipio"] - [dsAssRenovar."cepeuf"]')
          WordWrap = False
        end
        object Memo8: TfrxMemoView
          Left = 12.000000000000000000
          Top = 237.102350000000000000
          Width = 510.669291340000000000
          Height = 18.897637800000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            
              'Referente a pagamento renova'#231#227'o assinatura no per'#237'odo de [dsAssR' +
              'enovar."adadtini"] a [dsAssRenovar."adadtvenc"]')
          WordWrap = False
        end
        object dsAssRenovarzoncod: TfrxMemoView
          Left = 529.000000000000000000
          Top = 237.102350000000000000
          Width = 225.015770000000000000
          Height = 18.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dsAssRenovar."zoncod"] - [dsAssRenovar."zondescr"]')
          ParentFont = False
          WordWrap = False
        end
        object Shape2: TfrxShapeView
          Left = 11.000000000000000000
          Top = 270.102350000000000000
          Width = 380.000000000000000000
          Height = 204.000000000000000000
        end
        object Line3: TfrxLineView
          Left = 417.000000000000000000
          Top = 435.102350000000000000
          Width = 322.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo10: TfrxMemoView
          Left = 417.000000000000000000
          Top = 443.102350000000000000
          Width = 321.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          HAlign = haCenter
          Memo.UTF8W = (
            'Assinatura do agente Seman'#225'rio')
        end
        object Line4: TfrxLineView
          Left = 11.000000000000000000
          Top = 305.102350000000000000
          Width = 380.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object dsCabecalhoRodapeCidade: TfrxMemoView
          Left = 417.000000000000000000
          Top = 321.102350000000000000
          Width = 322.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Cidade"], ______ / ______ / ______')
        end
        object Line5: TfrxLineView
          Left = 301.000000000000000000
          Top = 271.102350000000000000
          Height = 203.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          Left = 11.000000000000000000
          Top = 339.102350000000000000
          Width = 380.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line7: TfrxLineView
          Left = 12.000000000000000000
          Top = 372.102350000000000000
          Width = 380.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          Left = 11.000000000000000000
          Top = 407.102350000000000000
          Width = 380.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Left = 16.000000000000000000
          Top = 277.102350000000000000
          Width = 279.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          HAlign = haCenter
          Memo.UTF8W = (
            'Condi'#231#245'es de Pagamento')
        end
        object Memo12: TfrxMemoView
          Left = 306.000000000000000000
          Top = 277.102350000000000000
          Width = 81.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          HAlign = haCenter
          Memo.UTF8W = (
            'Quita'#231#227'o')
        end
        object Memo13: TfrxMemoView
          Left = 16.000000000000000000
          Top = 312.102350000000000000
          Width = 279.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            #192' vista R$')
        end
        object Memo14: TfrxMemoView
          Left = 16.000000000000000000
          Top = 346.102350000000000000
          Width = 279.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            'Dia                                 R$')
        end
        object Memo15: TfrxMemoView
          Left = 16.000000000000000000
          Top = 379.102350000000000000
          Width = 279.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            'Dia                                 R$')
        end
        object Memo16: TfrxMemoView
          Left = 16.000000000000000000
          Top = 415.102350000000000000
          Width = 279.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            'Dia                                 R$')
        end
        object Line9: TfrxLineView
          Left = 11.000000000000000000
          Top = 440.102350000000000000
          Width = 380.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo17: TfrxMemoView
          Left = 16.000000000000000000
          Top = 447.102350000000000000
          Width = 279.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            'Dia                                 R$')
        end
        object Memo18: TfrxMemoView
          Left = 374.000000000000000000
          Top = 164.102350000000000000
          Width = 45.850650000000000000
          Height = 18.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            'Fones:')
        end
        object Memo19: TfrxMemoView
          Left = 423.000000000000000000
          Top = 164.102350000000000000
          Width = 328.968770000000000000
          Height = 18.897650000000000000
          DataField = 'CalcTelefones'
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            '[dsAssRenovar."CalcTelefones"]')
          WordWrap = False
        end
        object Memo20: TfrxMemoView
          Left = 270.000000000000000000
          Top = 86.102350000000000000
          Width = 214.622140000000000000
          Height = 18.897650000000000000
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Memo.UTF8W = (
            'Telefone: [dsCabecalhoRodape."FoneEmpresa"]')
          WordWrap = False
        end
        object dsAssRenovarCalcValorPorExtenso: TfrxMemoView
          Left = 92.000000000000000000
          Top = 213.102350000000000000
          Width = 658.189240000000000000
          Height = 18.897650000000000000
          DataField = 'CalcValorPorExtenso'
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[dsAssRenovar."CalcValorPorExtenso"]')
          ParentFont = False
          WordWrap = False
        end
        object Memo4: TfrxMemoView
          Left = 12.000000000000000000
          Top = 213.102350000000000000
          Width = 78.630180000000000000
          Height = 18.897650000000000000
          DataSet = frxDsAssRenovar
          DataSetName = 'dsAssRenovar'
          Memo.UTF8W = (
            'A quantia de')
          WordWrap = False
        end
        object Memo7: TfrxMemoView
          Left = 2.000000000000000000
          Top = 512.102350000000000000
          Width = 753.000000000000000000
          Height = 17.000000000000000000
          HAlign = haCenter
          Memo.UTF8W = (
            
              '[IIF(<dsAssRenovar."CalcImpLinhaSep">=1,'#39'-----------------------' +
              '----------------------------------------------------------------' +
              '-----------------------------------------'#39','#39#39')]')
        end
      end
    end
  end
  object sqlEtiquetasSql: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      '/*SQL EST'#193' NO C'#211'DIGO FONTE*/'#13#10#13#10'select tblass.asscod, tblzon.zon' +
      'cod, tblzon.zondescr,'#13#10'           tblzon.zonentregador, tblass.a' +
      'ssnome,'#13#10'          tblrdz.rdzender, tblass.assnroent, tblass.ass' +
      'complent'#13#10'from tblass, tblrdz, tblzon'#13#10'where tblass.rdzcod = tbl' +
      'rdz.rdzcod'#13#10'and tblrdz.zoncod = tblzon.zoncod'#13#10'and tblass.assimp' +
      'retiq = '#39'S'#39#13#10#13#10'and tblass.asscod in ( 9514, 1255)'#13#10'order by tblz' +
      'on.zoncod, tblass.assnome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 1120
    Top = 8
  end
  object cdsEtiquetas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEtiquetas'
    OnCalcFields = cdsEtiquetasCalcFields
    Left = 1120
    Top = 152
    object cdsEtiquetasPinta: TIntegerField
      FieldName = 'Pinta'
    end
    object cdsEtiquetaszoncod: TStringField
      FieldName = 'zoncod'
      Size = 3
    end
    object cdsEtiquetaszoncod_Ordem: TStringField
      FieldName = 'zoncod_Ordem'
      Size = 3
    end
    object cdsEtiquetasassnome: TStringField
      FieldName = 'assnome'
      Size = 60
    end
    object cdsEtiquetasEndereco: TStringField
      FieldName = 'Endereco'
      Size = 150
    end
    object cdsEtiquetasasscomplent: TStringField
      FieldName = 'asscomplent'
      Size = 60
    end
    object cdsEtiquetasAdadtvenc: TStringField
      FieldName = 'Adadtvenc'
    end
    object cdsEtiquetasrdzender: TStringField
      FieldName = 'rdzender'
      Size = 60
    end
    object cdsEtiquetasassnroent_Inteiro: TIntegerField
      FieldName = 'assnroent_Inteiro'
    end
    object cdsEtiquetasassnroent_String: TStringField
      FieldName = 'assnroent_String'
      Size = 10
    end
    object cdsEtiquetasasscomplent_Inteiro: TIntegerField
      FieldName = 'asscomplent_Inteiro'
    end
  end
  object frxDsEtiquetas: TfrxDBDataset
    UserName = 'dsEtiquetas'
    CloseDataSource = False
    FieldAliases.Strings = (
      'Pinta=Pinta'
      'zoncod=zoncod'
      'assnome=assnome'
      'Endereco=Endereco'
      'asscomplent=asscomplent'
      'Adadtvenc=Adadtvenc')
    DataSet = cdsEtiquetas
    BCDToCurrency = False
    Left = 1120
    Top = 296
  end
  object sqlAssinantes: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      '/*SQL EST'#193' NO C'#211'DIGO FONTE*/'#13#10#13#10'select tblzon.zoncod,'#13#10'       tb' +
      'lzon.zondescr,'#13#10'       tblass.asscod, tblass.assnome, tblass.rdz' +
      'cod, tblrdz.rdzender, tblass.assnroent,'#13#10'       tblass.asscomple' +
      'nt'#13#10'from tblass, tblven, tblgdv, tblcob, tblrdz, tblzon'#13#10'where t' +
      'blass.vencod = tblven.vencod'#13#10'and tblven.gdvcod = tblgdv.gdvcod'#13 +
      #10'and tblass.cobcod = tblcob.cobcod'#13#10'and tblass.rdzcod = tblrdz.r' +
      'dzcod'#13#10'and tblrdz.zoncod = tblzon.zoncod'#13#10'and tblass.assstatus =' +
      ' 0'#13#10'order by tblzon.zoncod'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 520
    Top = 8
  end
  object cdsAssinantes: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 104
    object cdsAssinantestitulo_agrupador: TStringField
      FieldName = 'titulo_agrupador'
      Required = True
      Size = 50
    end
    object cdsAssinantescod_agrupador: TStringField
      FieldName = 'cod_agrupador'
    end
    object cdsAssinantesdescr_agrupador: TStringField
      FieldName = 'descr_agrupador'
      Required = True
      Size = 60
    end
    object cdsAssinantesasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object cdsAssinantesassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
    object cdsAssinantesrdzender: TStringField
      FieldName = 'rdzender'
      Size = 60
    end
    object cdsAssinantesassnroent_Inteiro: TIntegerField
      FieldName = 'assnroent_Inteiro'
    end
    object cdsAssinantesassnroent_String: TStringField
      FieldName = 'assnroent_String'
      Size = 5
    end
    object cdsAssinantesEnderecoCompleto: TStringField
      FieldName = 'EnderecoCompleto'
      Size = 255
    end
  end
  object frxDsAssinantes: TfrxDBDataset
    UserName = 'dsAssinantes'
    CloseDataSource = False
    FieldAliases.Strings = (
      'titulo_agrupador=titulo_agrupador'
      'cod_agrupador=cod_agrupador'
      'descr_agrupador=descr_agrupador'
      'asscod=asscod'
      'assnome=assnome'
      'rdzender=rdzender'
      'assnroent_Inteiro=assnroent_Inteiro'
      'assnroent_String=assnroent_String'
      'EnderecoCompleto=EnderecoCompleto')
    DataSet = cdsAssinantes
    BCDToCurrency = False
    Left = 520
    Top = 152
  end
  object frxAssinantes: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41479.950144166700000000
    ReportOptions.LastChange = 41507.897972384300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 520
    Top = 200
    Datasets = <
      item
        DataSet = frxDsAssinantes
        DataSetName = 'dsAssinantes'
      end
      item
        DataSet = frxDsCabecalhoRodape
        DataSetName = 'dsCabecalhoRodape'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Baixas: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 25.677180000000000000
        Top = 389.291590000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Align = baWidth
          Top = 0.094310000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object dsCabecalhoRodapeUsuario: TfrxMemoView
          Align = baLeft
          Top = 3.897340000000000000
          Width = 377.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Usuario'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Usuario"]')
        end
        object dsCabecalhoRodapeVersao: TfrxMemoView
          Align = baRight
          Left = 518.480520000000000000
          Top = 3.897340000000000000
          Width = 199.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Versao'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Versao"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 76.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object dsCabecalhoEmpresa: TfrxMemoView
          Align = baLeft
          Top = 1.377860000000000000
          Width = 503.016080000000000000
          Height = 18.897650000000000000
          DataField = 'Empresa'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Empresa"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 598.666666670000000000
          Top = 23.146876670000000000
          Width = 75.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
        end
        object Memo2: TfrxMemoView
          Align = baRight
          Left = 676.622450000000000000
          Top = 23.146876660000000000
          Width = 41.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          HAlign = haRight
          Memo.UTF8W = (
            '[Time]')
        end
        object Memo3: TfrxMemoView
          Align = baRight
          Left = 513.913730000000000000
          Top = 1.480210000000000000
          Width = 204.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] de [TotalPages#]')
          ParentFont = False
        end
        object dsCabecalhoRodapeTitulo: TfrxMemoView
          Left = 128.000000000000000000
          Top = 23.480210000000000000
          Width = 465.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Titulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Titulo"]')
          ParentFont = False
        end
        object dsCabecalhoRodapeSubTitulo: TfrxMemoView
          Align = baWidth
          Top = 48.480210000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataField = 'SubTitulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."SubTitulo"]')
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 72.480210000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 29.102362200000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        Condition = 'dsAssinantes."cod_agrupador"'
        object dsBaixasgdvdescr: TfrxMemoView
          Align = baLeft
          Top = 9.000000000000000000
          Width = 682.850650000000000000
          Height = 18.897650000000000000
          DataSet = frxDsBaixas
          DataSetName = 'dsBaixas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            
              '[dsAssinantes."titulo_agrupador"]: [dsAssinantes."descr_agrupado' +
              'r"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.897650000000000000
        Top = 257.008040000000000000
        Width = 718.110700000000000000
        DataSet = frxDsAssinantes
        DataSetName = 'dsAssinantes'
        RowCount = 0
        Stretched = True
        object dsBaixasassnome: TfrxMemoView
          Left = 45.000000000000000000
          Top = 1.889763780000000000
          Width = 272.850650000000000000
          Height = 18.897650000000000000
          DataField = 'assnome'
          DataSet = frxDsAssinantes
          DataSetName = 'dsAssinantes'
          Memo.UTF8W = (
            '[dsAssinantes."assnome"]')
          WordWrap = False
        end
        object dsBaixasasscod: TfrxMemoView
          Align = baLeft
          Top = 1.991960000000000000
          Width = 42.708656540000000000
          Height = 18.897637800000000000
          DataField = 'asscod'
          DataSet = frxDsAssinantes
          DataSetName = 'dsAssinantes'
          Memo.UTF8W = (
            '[dsAssinantes."asscod"]')
        end
        object Memo13: TfrxMemoView
          Left = 332.000000000000000000
          Top = 1.889763780000000000
          Width = 380.630180000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'EnderecoCompleto'
          DataSet = frxDsAssinantes
          DataSetName = 'dsAssinantes'
          Memo.UTF8W = (
            '[dsAssinantes."EnderecoCompleto"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 25.834570000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Align = baLeft
          Width = 42.708661420000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'C'#243'd.')
        end
        object Line3: TfrxLineView
          Align = baWidth
          Top = 22.055040000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 44.976377950000000000
          Width = 76.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Assinante')
        end
        object Memo14: TfrxMemoView
          Left = 331.842519685039000000
          Width = 144.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Endere'#231'o de entrega')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 26.897650000000000000
        ParentFont = False
        Top = 340.157700000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Align = baRight
          Left = 623.622450000000000000
          Top = 5.590290000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.0n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Align = baWidth
          Top = 1.708410000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo12: TfrxMemoView
          Left = 447.000000000000000000
          Top = 5.708410000000000000
          Width = 170.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL DE ASSINANTES:')
          ParentFont = False
        end
      end
    end
  end
  object frxEtiquetaJato: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41508.304251469890000000
    ReportOptions.LastChange = 41545.385631747680000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 1168
    Top = 344
    Datasets = <
      item
        DataSet = frxDsEtiquetas
        DataSetName = 'dsEtiquetas'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 216.000000000000000000
      PaperHeight = 280.000000000000000000
      PaperSize = 256
      TopMargin = 13.000000000000000000
      BottomMargin = 13.000000000000000000
      Columns = 2
      ColumnWidth = 108.000000000000000000
      ColumnPositions.Strings = (
        '0'
        '108')
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 95.244094490000000000
        Top = 18.897650000000000000
        Width = 408.189240000000000000
        Columns = 1
        ColumnWidth = 408.188976377953000000
        DataSet = frxDsEtiquetas
        DataSetName = 'dsEtiquetas'
        RowCount = 0
        object frxDBDataset1nome: TfrxMemoView
          Left = 22.677165350000000000
          Top = 18.559060000000000000
          Width = 361.834880000000000000
          Height = 18.897650000000000000
          DataSet = frxDsEtiquetas
          DataSetName = 'dsEtiquetas'
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clBlack
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<dsEtiquetas."Pinta">=1'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            '[dsEtiquetas."assnome"]')
        end
        object frxDBDataset1endereco: TfrxMemoView
          Left = 22.677165350000000000
          Top = 43.015770000000000000
          Width = 361.834880000000000000
          Height = 18.897650000000000000
          DataSet = frxDsEtiquetas
          DataSetName = 'dsEtiquetas'
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = -1
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<dsEtiquetas."Pinta">=1'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            '[dsEtiquetas."Endereco"]')
        end
        object frxDBDataset1compl: TfrxMemoView
          Left = 22.677165350000000000
          Top = 68.472480000000000000
          Width = 362.464750000000000000
          Height = 18.897650000000000000
          DataSet = frxDsEtiquetas
          DataSetName = 'dsEtiquetas'
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clBlack
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<dsEtiquetas."Pinta">=1'
          Highlight.FillType = ftBrush
          Highlight.Fill.BackColor = clSilver
          Memo.UTF8W = (
            '[dsEtiquetas."asscomplent"]')
          WordWrap = False
        end
        object frxDBDataset1zona: TfrxMemoView
          Left = 349.157700000000000000
          Top = 68.252010000000000000
          Width = 35.574830000000000000
          Height = 18.897650000000000000
          DataField = 'zoncod'
          DataSet = frxDsEtiquetas
          DataSetName = 'dsEtiquetas'
          HAlign = haRight
          Memo.UTF8W = (
            '[dsEtiquetas."zoncod"]')
        end
        object dsEtiquetasCalcAdadtvenc: TfrxMemoView
          Left = 214.000000000000000000
          Top = 68.102350000000000000
          Width = 116.740260000000000000
          Height = 18.897650000000000000
          DataField = 'Adadtvenc'
          DataSet = frxDsEtiquetas
          DataSetName = 'dsEtiquetas'
          HAlign = haRight
          Memo.UTF8W = (
            '[dsEtiquetas."Adadtvenc"]')
        end
      end
    end
  end
  object sqlUltAssinatura: TSQLDataSet
    CommandText = 
      'select adadtvenc'#13#10'from tblada'#13#10'where tblada.asscod = :asscod'#13#10'an' +
      'd adacod = (select max(adacod)'#13#10'from tblada ada'#13#10'where ada.assco' +
      'd = tblada.asscod)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 1120
    Top = 200
    object sqlUltAssinaturaadadtvenc: TDateField
      FieldName = 'adadtvenc'
      Required = True
    end
  end
  object sqlQtdeAssAtivos: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select count(*) QtdeAssAtivos'#13#10'from tblass, tblrdz'#13#10'where tblass' +
      '.rdzcod = tblrdz.rdzcod'#13#10'and tblrdz.zoncod = :zoncod'#13#10'and tblass' +
      '.assstatus = 0'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'zoncod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 1120
    Top = 248
    object sqlQtdeAssAtivosQtdeAssAtivos: TLargeintField
      FieldName = 'QtdeAssAtivos'
      Required = True
    end
  end
  object dspEtiquetasSql: TDataSetProvider
    DataSet = sqlEtiquetasSql
    Left = 1120
    Top = 56
  end
  object cdsEtiquetasSql: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEtiquetasSql'
    Left = 1120
    Top = 104
    object cdsEtiquetasSqlasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object cdsEtiquetasSqlzoncod: TStringField
      FieldName = 'zoncod'
      Required = True
      Size = 3
    end
    object cdsEtiquetasSqlzondescr: TStringField
      FieldName = 'zondescr'
      Required = True
      Size = 60
    end
    object cdsEtiquetasSqlzonentregador: TStringField
      FieldName = 'zonentregador'
      Size = 60
    end
    object cdsEtiquetasSqlassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
    object cdsEtiquetasSqlrdzender: TStringField
      FieldName = 'rdzender'
      Required = True
      Size = 60
    end
    object cdsEtiquetasSqlassnroent: TStringField
      FieldName = 'assnroent'
      Required = True
      Size = 5
    end
    object cdsEtiquetasSqlasscomplent: TStringField
      FieldName = 'asscomplent'
      Size = 60
    end
  end
  object sqlCountAssAtivosZona: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select count(*) as QtdeAtivos'#13#10'from tblass, tblrdz'#13#10'where tblass' +
      '.rdzcod = tblrdz.rdzcod'#13#10'and tblass.assstatus = 0'#13#10'and tblrdz.zo' +
      'ncod = :zoncod'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'zoncod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 576
    Top = 392
    object sqlCountAssAtivosZonaQtdeAtivos: TLargeintField
      FieldName = 'QtdeAtivos'
      Required = True
    end
  end
  object frxEtiquetaArgox: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41508.304251469890000000
    ReportOptions.LastChange = 41559.457532743060000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 1080
    Top = 344
    Datasets = <
      item
        DataSet = frxDsEtiquetas
        DataSetName = 'dsEtiquetas'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 100.000000000000000000
      PaperHeight = 23.000000000000000000
      PaperSize = 256
      Columns = 1
      ColumnWidth = 216.000000000000000000
      ColumnPositions.Strings = (
        '0')
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 68.409448820000000000
        Top = 18.897650000000000000
        Width = 377.953000000000000000
        Columns = 1
        ColumnWidth = 408.188976377953000000
        DataSet = frxDsEtiquetas
        DataSetName = 'dsEtiquetas'
        RowCount = 0
        object frxDBDataset1nome: TfrxMemoView
          Left = 6.677165350000000000
          Top = 12.559060000000000000
          Width = 361.834880000000000000
          Height = 18.897650000000000000
          DataSet = frxDsEtiquetas
          DataSetName = 'dsEtiquetas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clBlack
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<dsEtiquetas."Pinta">=1'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            '[dsEtiquetas."assnome"]')
          ParentFont = False
          WordWrap = False
        end
        object frxDBDataset1endereco: TfrxMemoView
          Left = 6.677165350000000000
          Top = 32.015770000000000000
          Width = 361.834880000000000000
          Height = 18.897650000000000000
          DataSet = frxDsEtiquetas
          DataSetName = 'dsEtiquetas'
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = -1
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<dsEtiquetas."Pinta">=1'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            '[dsEtiquetas."Endereco"]')
          WordWrap = False
        end
        object frxDBDataset1compl: TfrxMemoView
          Left = 6.677165350000000000
          Top = 51.472480000000000000
          Width = 189.464750000000000000
          Height = 18.897650000000000000
          DataSet = frxDsEtiquetas
          DataSetName = 'dsEtiquetas'
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = clBlack
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<dsEtiquetas."Pinta">=1'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            '[dsEtiquetas."asscomplent"]')
          WordWrap = False
        end
        object frxDBDataset1zona: TfrxMemoView
          Left = 333.157700000000000000
          Top = 51.472480000000000000
          Width = 35.574830000000000000
          Height = 18.897650000000000000
          DataSet = frxDsEtiquetas
          DataSetName = 'dsEtiquetas'
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = -1
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<dsEtiquetas."Pinta">=1'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            '[dsEtiquetas."zoncod"]')
        end
        object dsEtiquetasCalcAdadtvenc: TfrxMemoView
          Left = 198.000000000000000000
          Top = 51.472480000000000000
          Width = 116.740260000000000000
          Height = 18.897650000000000000
          DataSet = frxDsEtiquetas
          DataSetName = 'dsEtiquetas'
          HAlign = haRight
          Highlight.Font.Charset = DEFAULT_CHARSET
          Highlight.Font.Color = -1
          Highlight.Font.Height = -13
          Highlight.Font.Name = 'Arial'
          Highlight.Font.Style = [fsBold]
          Highlight.Condition = '<dsEtiquetas."Pinta">=1'
          Highlight.FillType = ftBrush
          Memo.UTF8W = (
            '[dsEtiquetas."Adadtvenc"]')
        end
      end
    end
  end
  object sqlAltCad: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select tblhma.hmadthr, tblhma.hmaseq, tblusu.usunome,'#13#10'         ' +
      ' tblhma.asscod, tblass.assnome,'#13#10'          tblhma.hmadescr'#13#10'from' +
      ' tblhma, tblass, tblusu'#13#10'where tblhma.usucod = tblusu.usucod'#13#10'an' +
      'd tblhma.asscod = tblass.asscod'#13#10'and tblhma.usucod = :usucod'#13#10'an' +
      'd tblhma.hmadthr between :hmadthrini and :hmadthrfim'#13#10'order by t' +
      'blhma.hmadthr desc, tblhma.hmaseq desc'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'usucod'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'hmadthrini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'hmadthrfim'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 792
    Top = 8
  end
  object dspAltCad: TDataSetProvider
    DataSet = sqlAltCad
    Left = 792
    Top = 56
  end
  object cdsAltCad: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAltCad'
    Left = 792
    Top = 104
    object cdsAltCadhmadthr: TSQLTimeStampField
      FieldName = 'hmadthr'
      Required = True
    end
    object cdsAltCadhmaseq: TIntegerField
      FieldName = 'hmaseq'
      Required = True
    end
    object cdsAltCadusunome: TStringField
      FieldName = 'usunome'
      Required = True
      Size = 60
    end
    object cdsAltCadasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object cdsAltCadassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
    object cdsAltCadhmadescr: TMemoField
      FieldName = 'hmadescr'
      Required = True
      BlobType = ftMemo
      Size = 1
    end
  end
  object frxDsAltCad: TfrxDBDataset
    UserName = 'dsAltCad'
    CloseDataSource = False
    FieldAliases.Strings = (
      'hmadthr=hmadthr'
      'hmaseq=hmaseq'
      'usunome=usunome'
      'asscod=asscod'
      'assnome=assnome'
      'hmadescr=hmadescr')
    DataSet = cdsAltCad
    BCDToCurrency = False
    Left = 792
    Top = 152
  end
  object sqlUsuarios: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      '/*SQL EST'#193' NO C'#211'DIGO FONTE*/'#13#10#13#10'select usucod, usunome'#13#10'from tbl' +
      'usu'#13#10'UNION'#13#10'select distinct 0 as usucod, '#39' '#39' as usunome'#13#10'from tb' +
      'lusu'#13#10'where 1=1'#13#10'order by usunome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 32
    Top = 352
  end
  object dspUsuarios: TDataSetProvider
    DataSet = sqlUsuarios
    Left = 32
    Top = 400
  end
  object cdsUsuarios: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuarios'
    Left = 32
    Top = 448
    object cdsUsuariosusucod: TLargeintField
      FieldName = 'usucod'
    end
    object cdsUsuariosusunome: TStringField
      FieldName = 'usunome'
      Required = True
      Size = 60
    end
  end
  object sqlLotes: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select gaacod, gaadtgerauto, gaaanomes, gaavennome,'#13#10'gaavlass, g' +
      'aanromes'#13#10'from tblgaa'#13#10'order by gaacod desc'#13#10'limit 12'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 832
    Top = 416
  end
  object dspLotes: TDataSetProvider
    DataSet = sqlLotes
    Left = 832
    Top = 464
  end
  object cdsLotes: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLotes'
    OnCalcFields = cdsLotesCalcFields
    Left = 832
    Top = 512
    object cdsLotesCalcSelecionado: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'CalcSelecionado'
    end
    object cdsLotesgaacod: TIntegerField
      FieldName = 'gaacod'
      Required = True
    end
    object cdsLotesgaadtgerauto: TDateField
      FieldName = 'gaadtgerauto'
      Required = True
    end
    object cdsLotesgaaanomes: TDateField
      FieldName = 'gaaanomes'
      Required = True
    end
    object cdsLotesgaavlass: TFloatField
      FieldName = 'gaavlass'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object cdsLotesgaavennome: TStringField
      FieldName = 'gaavennome'
      Size = 60
    end
    object cdsLotesgaanromes: TIntegerField
      FieldName = 'gaanromes'
      Required = True
    end
    object cdsLotesCalcAnoMes: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CalcAnoMes'
      Size = 10
    end
  end
  object sqlCondPagto: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      '/*SQL EST'#193' NO C'#211'DIGO FONTE*/'#13#10#13#10'select tblass.cobcod, tblcob.cob' +
      'nome, tblrdz.zoncod, tblzon.zondescr,'#13#10'       tblass.asscod, tbl' +
      'ass.assnome, tblcpa.cpadtvenc, tblcpa.cpavl, tblada.adavlpend'#13#10'f' +
      'rom tblass, tblcob, tblrdz, tblzon, tblada, tblcpa'#13#10'where tblass' +
      '.cobcod = tblcob.cobcod'#13#10'and tblass.rdzcod = tblrdz.rdzcod'#13#10'and ' +
      'tblrdz.zoncod = tblzon.zoncod'#13#10'and tblass.asscod = tblada.asscod' +
      #13#10'and tblada.asscod = tblcpa.asscod'#13#10'and tblada.adacod= tblcpa.a' +
      'dacod'#13#10'and tblada.adacancel = '#39'N'#39#13#10'and tblada.adavlpend > 0'#13#10'and' +
      ' tblcpa.cpadtvenc between '#39'2015-03-01'#39' and '#39'2015-03-31'#39#13#10'and tbl' +
      'ass.cobcod in (2)'#13#10'order by tblcob.cobnome, tblrdz.zoncod, tblas' +
      's.assnome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 992
    Top = 8
  end
  object dspCondPagto: TDataSetProvider
    DataSet = sqlCondPagto
    Left = 992
    Top = 56
  end
  object cdsCondPagto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCondPagto'
    Left = 992
    Top = 104
    object cdsCondPagtocobcod: TIntegerField
      FieldName = 'cobcod'
      Required = True
    end
    object cdsCondPagtocobnome: TStringField
      FieldName = 'cobnome'
      Required = True
      Size = 60
    end
    object cdsCondPagtozoncod: TStringField
      FieldName = 'zoncod'
      Required = True
      Size = 3
    end
    object cdsCondPagtozondescr: TStringField
      FieldName = 'zondescr'
      Required = True
      Size = 60
    end
    object cdsCondPagtoasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object cdsCondPagtoassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
    object cdsCondPagtoadavldesc: TFloatField
      FieldName = 'adavldesc'
    end
    object cdsCondPagtocpanroparc: TIntegerField
      FieldName = 'cpanroparc'
    end
    object cdsCondPagtocpadtvenc: TDateField
      FieldName = 'cpadtvenc'
      Required = True
    end
    object cdsCondPagtocpavl: TFloatField
      FieldName = 'cpavl'
      Required = True
    end
    object cdsCondPagtoadavlpend: TFloatField
      FieldName = 'adavlpend'
      Required = True
    end
  end
  object frxDsCondPagto: TfrxDBDataset
    UserName = 'dsCondPagto'
    CloseDataSource = False
    FieldAliases.Strings = (
      'cobcod=cobcod'
      'cobnome=cobnome'
      'zoncod=zoncod'
      'zondescr=zondescr'
      'asscod=asscod'
      'assnome=assnome'
      'adavldesc=adavldesc'
      'cpanroparc=cpanroparc'
      'cpadtvenc=cpadtvenc'
      'cpavl=cpavl'
      'adavlpend=adavlpend')
    DataSet = cdsCondPagtoAux
    BCDToCurrency = False
    Left = 992
    Top = 200
  end
  object frxCondPagto: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41479.950144166700000000
    ReportOptions.LastChange = 42322.752274143500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 992
    Top = 248
    Datasets = <
      item
        DataSet = frxDsCabecalhoRodape
        DataSetName = 'dsCabecalhoRodape'
      end
      item
        DataSet = frxDsCondPagto
        DataSetName = 'dsCondPagto'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Baixas: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 25.677180000000000000
        Top = 434.645950000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Align = baWidth
          Top = 0.094310000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object dsCabecalhoRodapeUsuario: TfrxMemoView
          Align = baLeft
          Top = 3.897340000000000000
          Width = 377.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Usuario'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Usuario"]')
        end
        object dsCabecalhoRodapeVersao: TfrxMemoView
          Align = baRight
          Left = 518.480520000000000000
          Top = 3.897340000000000000
          Width = 199.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Versao'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Versao"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 76.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object dsCabecalhoEmpresa: TfrxMemoView
          Align = baLeft
          Top = 1.377860000000000000
          Width = 503.016080000000000000
          Height = 18.897650000000000000
          DataField = 'Empresa'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Empresa"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 598.666666670000000000
          Top = 23.146876670000000000
          Width = 75.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
        end
        object Memo2: TfrxMemoView
          Align = baRight
          Left = 676.622450000000000000
          Top = 23.146876660000000000
          Width = 41.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          HAlign = haRight
          Memo.UTF8W = (
            '[Time]')
        end
        object Memo3: TfrxMemoView
          Align = baRight
          Left = 513.913730000000000000
          Top = 1.480210000000000000
          Width = 204.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] de [TotalPages#]')
          ParentFont = False
        end
        object dsCabecalhoRodapeTitulo: TfrxMemoView
          Left = 128.000000000000000000
          Top = 23.480210000000000000
          Width = 465.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Titulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Titulo"]')
          ParentFont = False
        end
        object dsCabecalhoRodapeSubTitulo: TfrxMemoView
          Align = baRight
          Left = 365.000000000000000000
          Top = 48.480210000000000000
          Width = 353.110700000000000000
          Height = 18.897650000000000000
          DataField = 'SubTitulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCabecalhoRodape."SubTitulo"]')
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 72.480210000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          Align = baLeft
          Top = 48.102350000000000000
          Width = 354.110700000000000000
          Height = 18.897650000000000000
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Cobrador: [dsCondPagto."cobcod"] - [dsCondPagto."cobnome"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 29.102362200000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        Condition = '<dsCondPagto."zoncod">'
        object dsBaixasgdvdescr: TfrxMemoView
          Align = baLeft
          Top = 7.000000000000000000
          Width = 699.850650000000000000
          Height = 18.897650000000000000
          DataSet = frxDsBaixas
          DataSetName = 'dsBaixas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'Zona: [dsCondPagto."zoncod"] - [dsCondPagto."zondescr"]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.897650000000000000
        Top = 279.685220000000000000
        Width = 718.110700000000000000
        DataSet = frxDsCondPagto
        DataSetName = 'dsCondPagto'
        RowCount = 0
        Stretched = True
        object dsBaixasassnome: TfrxMemoView
          Left = 45.000000000000000000
          Top = 1.889763780000000000
          Width = 347.378170000000000000
          Height = 18.897650000000000000
          DataField = 'assnome'
          DataSet = frxDsCondPagto
          DataSetName = 'dsCondPagto'
          Memo.UTF8W = (
            '[dsCondPagto."assnome"]')
          WordWrap = False
        end
        object dsBaixasasscod: TfrxMemoView
          Align = baLeft
          Top = 1.991960000000000000
          Width = 42.708656540000000000
          Height = 18.897637800000000000
          DataField = 'asscod'
          DataSet = frxDsCondPagto
          DataSetName = 'dsCondPagto'
          Memo.UTF8W = (
            '[dsCondPagto."asscod"]')
        end
        object dsBaixasbdadt: TfrxMemoView
          Left = 396.496116690000000000
          Top = 1.991960000000000000
          Width = 86.929141180000000000
          Height = 18.897650000000000000
          DataSet = frxDsCondPagto
          DataSetName = 'dsCondPagto'
          Memo.UTF8W = (
            
              '[IntToStr(<dsCondPagto."cpanroparc">)+'#39#186' '#39'+DateToStr(<dsCondPagt' +
              'o."cpadtvenc">)]')
        end
        object dsBaixasbdavl: TfrxMemoView
          Left = 487.079203940000000000
          Top = 1.889763780000000000
          Width = 88.440944880000000000
          Height = 18.897650000000000000
          DataField = 'cpavl'
          DataSet = frxDsCondPagto
          DataSetName = 'dsCondPagto'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCondPagto."cpavl"]')
        end
        object Memo10: TfrxMemoView
          Align = baRight
          Left = 642.520148820000000000
          Top = 2.314780000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataField = 'adavlpend'
          DataSet = frxDsCondPagto
          DataSetName = 'dsCondPagto'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCondPagto."adavlpend"]')
        end
        object dsCondPagtoadavldesc: TfrxMemoView
          Left = 580.291590000000000000
          Top = 1.991960000000000000
          Width = 58.252010000000000000
          Height = 18.897650000000000000
          DataField = 'adavldesc'
          DataSet = frxDsCondPagto
          DataSetName = 'dsCondPagto'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCondPagto."adavldesc"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 25.834570000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Align = baLeft
          Width = 42.708661420000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'C'#243'd.')
        end
        object Line3: TfrxLineView
          Align = baWidth
          Top = 22.055040000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 44.976377950000000000
          Width = 76.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Assinante')
        end
        object Memo7: TfrxMemoView
          Left = 394.937007870000000000
          Width = 88.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Dt.Venc.Parc.')
        end
        object Memo8: TfrxMemoView
          Align = baRight
          Left = 642.520148820000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Pend.')
        end
        object Memo12: TfrxMemoView
          Left = 486.929597640000000000
          Width = 88.590551180000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Parcela')
        end
        object Memo14: TfrxMemoView
          Left = 580.291590000000000000
          Width = 58.252010000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Vl.Desc.')
        end
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Height = 1.322820000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        Condition = '<dsCondPagto."cobcod">'
        StartNewPage = True
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 0.165354330000000000
        Top = 325.039580000000000000
        Width = 718.110700000000000000
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Height = 26.834645670000000000
        Top = 347.716760000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          Align = baRight
          Left = 642.520148818897700000
          Top = 4.708410000000000000
          Width = 75.590551181102400000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dsCondPagto."adavlpend">,MasterData1)]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Align = baWidth
          Top = 0.826530000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Left = 354.000000000000000000
          Top = 3.826530000000000000
          Width = 110.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL GERAL:')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 487.079203940000000000
          Top = 4.283240000000000000
          Width = 88.440944880000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dsCondPagto."cpavl">,MasterData1)]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 580.291590000000000000
          Top = 4.283240000000000000
          Width = 58.252010000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dsCondPagto."adavldesc">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object cdsCondPagtoAux: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 992
    Top = 152
    object cdsCondPagtoAuxcobcod: TIntegerField
      FieldName = 'cobcod'
    end
    object cdsCondPagtoAuxcobnome: TStringField
      FieldName = 'cobnome'
      Size = 60
    end
    object cdsCondPagtoAuxzoncod: TStringField
      FieldName = 'zoncod'
      Size = 3
    end
    object cdsCondPagtoAuxzondescr: TStringField
      FieldName = 'zondescr'
      Size = 60
    end
    object cdsCondPagtoAuxasscod: TIntegerField
      FieldName = 'asscod'
    end
    object cdsCondPagtoAuxassnome: TStringField
      FieldName = 'assnome'
      Size = 60
    end
    object cdsCondPagtoAuxadavldesc: TFloatField
      FieldName = 'adavldesc'
    end
    object cdsCondPagtoAuxcpanroparc: TIntegerField
      FieldName = 'cpanroparc'
    end
    object cdsCondPagtoAuxcpadtvenc: TDateField
      FieldName = 'cpadtvenc'
    end
    object cdsCondPagtoAuxcpavl: TFloatField
      FieldName = 'cpavl'
    end
    object cdsCondPagtoAuxadavlpend: TFloatField
      FieldName = 'adavlpend'
    end
  end
  object sqlHistAltAss: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select tblhma.hmadthr, tblhma.hmaseq, tblusu.usunome,'#13#10'         ' +
      ' tblhma.asscod,'#13#10'          tblass.assnome, tblhma.hmadescr'#13#10'from' +
      ' tblhma, tblass, tblusu'#13#10'where tblhma.usucod = tblusu.usucod'#13#10'an' +
      'd tblhma.asscod = tblass.asscod'#13#10'and tblhma.asscod = :asscod'#13#10'an' +
      'd tblhma.hmadthr between :hmadthrini and :hmadthrfim'#13#10'order by t' +
      'blhma.hmadthr desc, tblhma.hmaseq desc'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'hmadthrini'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'hmadthrfim'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 888
    Top = 8
  end
  object dspHistAltAss: TDataSetProvider
    DataSet = sqlHistAltAss
    Left = 888
    Top = 56
  end
  object cdsHistAltAss: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHistAltAss'
    Left = 888
    Top = 104
    object cdsHistAltAsshmadthr: TSQLTimeStampField
      FieldName = 'hmadthr'
      Required = True
    end
    object cdsHistAltAsshmaseq: TIntegerField
      FieldName = 'hmaseq'
      Required = True
    end
    object cdsHistAltAssusunome: TStringField
      FieldName = 'usunome'
      Required = True
      Size = 60
    end
    object cdsHistAltAssasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object cdsHistAltAssassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
    object cdsHistAltAsshmadescr: TMemoField
      FieldName = 'hmadescr'
      Required = True
      BlobType = ftMemo
      Size = 1
    end
  end
  object frxDsHistAltAss: TfrxDBDataset
    UserName = 'dsHistAltAss'
    CloseDataSource = False
    FieldAliases.Strings = (
      'hmadthr=hmadthr'
      'hmaseq=hmaseq'
      'usunome=usunome'
      'asscod=asscod'
      'assnome=assnome'
      'hmadescr=hmadescr')
    DataSet = cdsHistAltAss
    BCDToCurrency = False
    Left = 888
    Top = 152
  end
  object frxHistAltAss: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41479.950144166700000000
    ReportOptions.LastChange = 42266.629301250000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 888
    Top = 200
    Datasets = <
      item
        DataSet = frxDsCabecalhoRodape
        DataSetName = 'dsCabecalhoRodape'
      end
      item
        DataSet = frxDsHistAltAss
        DataSetName = 'dsHistAltAss'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Baixas: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 25.677180000000000000
        Top = 325.039580000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Align = baWidth
          Top = 0.094310000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object dsCabecalhoRodapeUsuario: TfrxMemoView
          Align = baLeft
          Top = 3.897340000000000000
          Width = 377.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Usuario'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Usuario"]')
        end
        object dsCabecalhoRodapeVersao: TfrxMemoView
          Align = baRight
          Left = 518.480520000000000000
          Top = 3.897340000000000000
          Width = 199.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Versao'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Versao"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 76.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object dsCabecalhoEmpresa: TfrxMemoView
          Align = baLeft
          Top = 1.377860000000000000
          Width = 503.016080000000000000
          Height = 18.897650000000000000
          DataField = 'Empresa'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Empresa"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 598.666666670000000000
          Top = 23.146876670000000000
          Width = 75.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
        end
        object Memo2: TfrxMemoView
          Align = baRight
          Left = 676.622450000000000000
          Top = 23.146876660000000000
          Width = 41.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          HAlign = haRight
          Memo.UTF8W = (
            '[Time]')
        end
        object Memo3: TfrxMemoView
          Align = baRight
          Left = 513.913730000000000000
          Top = 1.480210000000000000
          Width = 204.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] de [TotalPages#]')
          ParentFont = False
        end
        object dsCabecalhoRodapeTitulo: TfrxMemoView
          Left = 128.000000000000000000
          Top = 23.480210000000000000
          Width = 465.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Titulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Titulo"]')
          ParentFont = False
        end
        object dsCabecalhoRodapeSubTitulo: TfrxMemoView
          Align = baWidth
          Top = 48.480210000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataField = 'SubTitulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."SubTitulo"]')
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 72.480210000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 42.354360000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        DataSet = frxDsHistAltAss
        DataSetName = 'dsHistAltAss'
        RowCount = 0
        Stretched = True
        object dsBaixasassnome: TfrxMemoView
          Top = 21.566943780000000000
          Width = 136.834880000000000000
          Height = 18.897650000000000000
          DataField = 'usunome'
          DataSet = frxDsHistAltAss
          DataSetName = 'dsHistAltAss'
          Memo.UTF8W = (
            '[dsHistAltAss."usunome"]')
          WordWrap = False
        end
        object dsBaixasasscod: TfrxMemoView
          Align = baLeft
          Top = 1.991960000000000000
          Width = 137.196906540000000000
          Height = 18.897637800000000000
          DataField = 'hmadthr'
          DataSet = frxDsHistAltAss
          DataSetName = 'dsHistAltAss'
          Memo.UTF8W = (
            '[dsHistAltAss."hmadthr"]')
        end
        object Memo13: TfrxMemoView
          Left = 142.629870000000000000
          Top = 1.889763780000000000
          Width = 571.551640000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          DataField = 'hmadescr'
          DataSet = frxDsHistAltAss
          DataSetName = 'dsHistAltAss'
          Memo.UTF8W = (
            '[dsHistAltAss."hmadescr"]')
        end
        object Line4: TfrxLineView
          Align = baWidth
          Top = 42.354360000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 44.732220000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Align = baLeft
          Width = 80.503961420000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Data e Hora')
        end
        object Line3: TfrxLineView
          Align = baWidth
          Top = 40.952690000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Top = 18.897650000000000000
          Width = 80.267780000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Usu'#225'rio')
        end
        object Memo14: TfrxMemoView
          Left = 142.488188976378000000
          Top = 18.897650000000000000
          Width = 170.944960000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Descri'#231#227'o das Altera'#231#245'es')
        end
      end
    end
  end
  object frxAltCad: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41479.950144166700000000
    ReportOptions.LastChange = 42266.651670578710000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 792
    Top = 200
    Datasets = <
      item
        DataSet = frxDsAltCad
        DataSetName = 'dsAltCad'
      end
      item
        DataSet = frxDsCabecalhoRodape
        DataSetName = 'dsCabecalhoRodape'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Baixas: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 25.677180000000000000
        Top = 325.039580000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Align = baWidth
          Top = 0.094310000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object dsCabecalhoRodapeUsuario: TfrxMemoView
          Align = baLeft
          Top = 3.897340000000000000
          Width = 377.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Usuario'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Usuario"]')
        end
        object dsCabecalhoRodapeVersao: TfrxMemoView
          Align = baRight
          Left = 518.480520000000000000
          Top = 3.897340000000000000
          Width = 199.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Versao'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Versao"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 76.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object dsCabecalhoEmpresa: TfrxMemoView
          Align = baLeft
          Top = 1.377860000000000000
          Width = 503.016080000000000000
          Height = 18.897650000000000000
          DataField = 'Empresa'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Empresa"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 598.666666670000000000
          Top = 23.146876670000000000
          Width = 75.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
        end
        object Memo2: TfrxMemoView
          Align = baRight
          Left = 676.622450000000000000
          Top = 23.146876660000000000
          Width = 41.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          HAlign = haRight
          Memo.UTF8W = (
            '[Time]')
        end
        object Memo3: TfrxMemoView
          Align = baRight
          Left = 513.913730000000000000
          Top = 1.480210000000000000
          Width = 204.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] de [TotalPages#]')
          ParentFont = False
        end
        object dsCabecalhoRodapeTitulo: TfrxMemoView
          Left = 128.000000000000000000
          Top = 23.480210000000000000
          Width = 465.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Titulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Titulo"]')
          ParentFont = False
        end
        object dsCabecalhoRodapeSubTitulo: TfrxMemoView
          Align = baWidth
          Top = 48.480210000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataField = 'SubTitulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."SubTitulo"]')
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 72.480210000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 42.354360000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        DataSet = frxDsAltCad
        DataSetName = 'dsAltCad'
        RowCount = 0
        Stretched = True
        object dsBaixasassnome: TfrxMemoView
          Top = 21.566943780000000000
          Width = 136.834880000000000000
          Height = 18.897650000000000000
          DataField = 'assnome'
          DataSet = frxDsAltCad
          DataSetName = 'dsAltCad'
          Memo.UTF8W = (
            '[dsAltCad."assnome"]')
          WordWrap = False
        end
        object dsBaixasasscod: TfrxMemoView
          Align = baLeft
          Top = 1.991960000000000000
          Width = 137.196906540000000000
          Height = 18.897637800000000000
          DataField = 'hmadthr'
          DataSet = frxDsAltCad
          DataSetName = 'dsAltCad'
          Memo.UTF8W = (
            '[dsAltCad."hmadthr"]')
        end
        object Memo13: TfrxMemoView
          Left = 142.629870000000000000
          Top = 1.889763780000000000
          Width = 571.551640000000000000
          Height = 37.795300000000000000
          StretchMode = smMaxHeight
          DataField = 'hmadescr'
          DataSet = frxDsAltCad
          DataSetName = 'dsAltCad'
          Memo.UTF8W = (
            '[dsAltCad."hmadescr"]')
        end
        object Line4: TfrxLineView
          Align = baWidth
          Top = 42.354360000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 44.732220000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Align = baLeft
          Width = 80.503961420000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Data e Hora')
        end
        object Line3: TfrxLineView
          Align = baWidth
          Top = 40.952690000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Top = 18.897650000000000000
          Width = 80.267780000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Assinante')
        end
        object Memo14: TfrxMemoView
          Left = 142.488188976378000000
          Top = 18.897650000000000000
          Width = 170.944960000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Descri'#231#227'o das Altera'#231#245'es')
        end
      end
    end
  end
  object sqlDescontos: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select tblass.asscod, tblass.assnome, tblada.adacod, tblada.adad' +
      'tini, tblada.adadtvenc,'#13#10'       tblada.adavl, tblada.adavldesc'#13#10 +
      'from tblass, tblada'#13#10'where tblass.asscod = tblada.asscod'#13#10'and tb' +
      'lada.adavldesc > 0'#13#10'and tblada.adacancel = '#39'N'#39#13#10'and tblass.assst' +
      'atus = 0'#13#10'and tblada.adadtini between :adadtini1 and :adadtini2'#13 +
      #10'order by tblass.assnome, tblada.adadtini'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'adadtini1'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'adadtini2'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 1256
    Top = 8
  end
  object dspDescontos: TDataSetProvider
    DataSet = sqlDescontos
    Left = 1256
    Top = 56
  end
  object cdsDescontos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDescontos'
    Left = 1256
    Top = 104
    object cdsDescontosasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object cdsDescontosassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
    object cdsDescontosadacod: TIntegerField
      FieldName = 'adacod'
      Required = True
    end
    object cdsDescontosadadtini: TDateField
      FieldName = 'adadtini'
      Required = True
    end
    object cdsDescontosadadtvenc: TDateField
      FieldName = 'adadtvenc'
      Required = True
    end
    object cdsDescontosadavl: TFloatField
      FieldName = 'adavl'
      Required = True
    end
    object cdsDescontosadavldesc: TFloatField
      FieldName = 'adavldesc'
      Required = True
    end
  end
  object frxDsDescontos: TfrxDBDataset
    UserName = 'dsDescontos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'asscod=asscod'
      'assnome=assnome'
      'adacod=adacod'
      'adadtini=adadtini'
      'adadtvenc=adadtvenc'
      'adavl=adavl'
      'adavldesc=adavldesc')
    DataSet = cdsDescontos
    BCDToCurrency = False
    Left = 1256
    Top = 152
  end
  object frxDescontos: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41479.950144166700000000
    ReportOptions.LastChange = 42322.975781157410000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 1256
    Top = 200
    Datasets = <
      item
        DataSet = frxDsCabecalhoRodape
        DataSetName = 'dsCabecalhoRodape'
      end
      item
        DataSet = frxDsDescontos
        DataSetName = 'dsDescontos'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Baixas: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 25.677180000000000000
        Top = 340.157700000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Align = baWidth
          Top = 0.094310000000007220
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object dsCabecalhoRodapeUsuario: TfrxMemoView
          Align = baLeft
          Top = 3.897339999999985000
          Width = 377.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Usuario'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Usuario"]')
        end
        object dsCabecalhoRodapeVersao: TfrxMemoView
          Align = baRight
          Left = 518.480519999999900000
          Top = 3.897339999999985000
          Width = 199.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Versao'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Versao"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 76.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object dsCabecalhoEmpresa: TfrxMemoView
          Align = baLeft
          Top = 1.377859999999998000
          Width = 503.016080000000000000
          Height = 18.897650000000000000
          DataField = 'Empresa'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Empresa"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 598.666666670000000000
          Top = 23.146876670000000000
          Width = 75.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
        end
        object Memo2: TfrxMemoView
          Align = baRight
          Left = 676.622450000000000000
          Top = 23.146876660000000000
          Width = 41.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          HAlign = haRight
          Memo.UTF8W = (
            '[Time]')
        end
        object Memo3: TfrxMemoView
          Align = baRight
          Left = 513.913730000000000000
          Top = 1.480210000000000000
          Width = 204.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] de [TotalPages#]')
          ParentFont = False
        end
        object dsCabecalhoRodapeTitulo: TfrxMemoView
          Left = 128.000000000000000000
          Top = 23.480210000000000000
          Width = 465.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Titulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Titulo"]')
          ParentFont = False
        end
        object dsCabecalhoRodapeSubTitulo: TfrxMemoView
          Align = baRight
          Left = 2.165119999999952000
          Top = 48.480210000000000000
          Width = 715.945580000000000000
          Height = 18.897650000000000000
          DataField = 'SubTitulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."SubTitulo"]')
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 72.480210000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.897650000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        DataSet = frxDsDescontos
        DataSetName = 'dsDescontos'
        RowCount = 0
        Stretched = True
        object dsBaixasassnome: TfrxMemoView
          Left = 45.000000000000000000
          Top = 1.889763780000010000
          Width = 347.378170000000000000
          Height = 18.897650000000000000
          DataField = 'assnome'
          DataSet = frxDsDescontos
          DataSetName = 'dsDescontos'
          Memo.UTF8W = (
            '[dsDescontos."assnome"]')
          WordWrap = False
        end
        object dsBaixasasscod: TfrxMemoView
          Align = baLeft
          Top = 1.991960000000006000
          Width = 42.708656540000000000
          Height = 18.897637800000000000
          DataField = 'asscod'
          DataSet = frxDsDescontos
          DataSetName = 'dsDescontos'
          Memo.UTF8W = (
            '[dsDescontos."asscod"]')
        end
        object dsBaixasbdadt: TfrxMemoView
          Left = 396.496116690000000000
          Top = 1.991960000000006000
          Width = 86.929141180000000000
          Height = 18.897650000000000000
          DataField = 'adadtini'
          DataSet = frxDsDescontos
          DataSetName = 'dsDescontos'
          Memo.UTF8W = (
            '[dsDescontos."adadtini"]')
        end
        object dsBaixasbdavl: TfrxMemoView
          Left = 487.079203940000000000
          Top = 1.889763780000010000
          Width = 88.440944880000000000
          Height = 18.897650000000000000
          DataSet = frxDsDescontos
          DataSetName = 'dsDescontos'
          Memo.UTF8W = (
            '[dsDescontos."adadtvenc"]')
        end
        object Memo10: TfrxMemoView
          Align = baRight
          Left = 642.520148819999900000
          Top = 2.314780000000013000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataField = 'adavl'
          DataSet = frxDsDescontos
          DataSetName = 'dsDescontos'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[dsDescontos."adavl"]')
        end
        object dsCondPagtoadavldesc: TfrxMemoView
          Left = 580.291590000000000000
          Top = 1.991960000000006000
          Width = 58.252010000000000000
          Height = 18.897650000000000000
          DataSet = frxDsDescontos
          DataSetName = 'dsDescontos'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[dsDescontos."adavldesc"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 25.834570000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Align = baLeft
          Width = 42.708661420000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'C'#243'd.')
        end
        object Line3: TfrxLineView
          Align = baWidth
          Top = 22.055040000000010000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 44.976377950000000000
          Width = 76.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Assinante')
        end
        object Memo7: TfrxMemoView
          Left = 487.937007870000000000
          Width = 88.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Dt.Venci.Ass.')
        end
        object Memo8: TfrxMemoView
          Align = baRight
          Left = 642.520148819999900000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Ass.')
        end
        object Memo14: TfrxMemoView
          Left = 580.291590000000000000
          Width = 58.252010000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Vl.Desc.')
        end
        object Memo4: TfrxMemoView
          Left = 395.362400000000000000
          Width = 88.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Dt.In'#237'cio Ass.')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        object Memo9: TfrxMemoView
          Align = baRight
          Left = 642.520148819999900000
          Top = 7.236240000000009000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataSet = frxDsDescontos
          DataSetName = 'dsDescontos'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dsDescontos."adavl">,MasterData1)]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Align = baWidth
          Top = 3.779530000000022000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Left = 431.000000000000000000
          Top = 6.779530000000023000
          Width = 110.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL GERAL:')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 580.291590000000000000
          Top = 7.236240000000009000
          Width = 58.252010000000000000
          Height = 18.897650000000000000
          DataSet = frxDsDescontos
          DataSetName = 'dsDescontos'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dsDescontos."adavldesc">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object sqlCortesias: TSQLDataSet
    CommandText = 
      'select tblass.asscod, tblass.assnome, tblada.adacod, tblada.adad' +
      'tini, tblada.adadtvenc, tblada.adavl'#13#10'from tblass, tblada'#13#10'where' +
      ' tblass.asscod = tblada.asscod'#13#10'and tblass.assstatus = 0'#13#10'and tb' +
      'lada.adacancel = '#39'N'#39#13#10'and tblada.adacortesia = '#39'S'#39#13#10'and tblada.a' +
      'dacod = (select max(ada.adacod)'#13#10'                               ' +
      '      from tblada ada'#13#10'                                   where ' +
      'ada.asscod = tblada.asscod)'#13#10'order by tblass.assnome, tblada.ada' +
      'cod desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 1352
    Top = 8
  end
  object dspCortesias: TDataSetProvider
    DataSet = sqlCortesias
    Left = 1352
    Top = 56
  end
  object cdsCortesias: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCortesias'
    Left = 1352
    Top = 104
    object cdsCortesiasasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object cdsCortesiasassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
    object cdsCortesiasadacod: TIntegerField
      FieldName = 'adacod'
      Required = True
    end
    object cdsCortesiasadadtini: TDateField
      FieldName = 'adadtini'
      Required = True
    end
    object cdsCortesiasadadtvenc: TDateField
      FieldName = 'adadtvenc'
      Required = True
    end
    object cdsCortesiasadavl: TFloatField
      FieldName = 'adavl'
      Required = True
    end
  end
  object frxDsCortesias: TfrxDBDataset
    UserName = 'dsCortesias'
    CloseDataSource = False
    FieldAliases.Strings = (
      'asscod=asscod'
      'assnome=assnome'
      'adacod=adacod'
      'adadtini=adadtini'
      'adadtvenc=adadtvenc'
      'adavl=adavl')
    DataSet = cdsCortesias
    BCDToCurrency = False
    Left = 1352
    Top = 152
  end
  object frxCortesias: TfrxReport
    Version = '5.1.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 41479.950144166700000000
    ReportOptions.LastChange = 42402.932834490740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 1352
    Top = 200
    Datasets = <
      item
        DataSet = frxDsCabecalhoRodape
        DataSetName = 'dsCabecalhoRodape'
      end
      item
        DataSet = frxDsCortesias
        DataSetName = 'dsCortesias'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Baixas: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 25.677180000000000000
        Top = 336.378170000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Align = baWidth
          Top = 0.094310000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object dsCabecalhoRodapeUsuario: TfrxMemoView
          Align = baLeft
          Top = 3.897340000000000000
          Width = 377.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Usuario'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Usuario"]')
        end
        object dsCabecalhoRodapeVersao: TfrxMemoView
          Align = baRight
          Left = 518.480520000000000000
          Top = 3.897340000000000000
          Width = 199.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Versao'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Versao"]')
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 76.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object dsCabecalhoEmpresa: TfrxMemoView
          Align = baLeft
          Top = 1.377860000000000000
          Width = 503.016080000000000000
          Height = 18.897650000000000000
          DataField = 'Empresa'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Empresa"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          Left = 598.666666670000000000
          Top = 23.146876670000000000
          Width = 75.488250000000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            '[Date]')
        end
        object Memo2: TfrxMemoView
          Align = baRight
          Left = 676.622450000000000000
          Top = 23.146876660000000000
          Width = 41.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          HAlign = haRight
          Memo.UTF8W = (
            '[Time]')
        end
        object Memo3: TfrxMemoView
          Align = baRight
          Left = 513.913730000000000000
          Top = 1.480210000000000000
          Width = 204.196970000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#] de [TotalPages#]')
          ParentFont = False
        end
        object dsCabecalhoRodapeTitulo: TfrxMemoView
          Left = 128.000000000000000000
          Top = 23.480210000000000000
          Width = 465.630180000000000000
          Height = 18.897650000000000000
          DataField = 'Titulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."Titulo"]')
          ParentFont = False
        end
        object dsCabecalhoRodapeSubTitulo: TfrxMemoView
          Align = baWidth
          Top = 48.480210000000000000
          Width = 718.110700000000000000
          Height = 18.897650000000000000
          DataField = 'SubTitulo'
          DataSet = frxDsCabecalhoRodape
          DataSetName = 'dsCabecalhoRodape'
          HAlign = haCenter
          Memo.UTF8W = (
            '[dsCabecalhoRodape."SubTitulo"]')
        end
        object Line1: TfrxLineView
          Align = baWidth
          Top = 72.480210000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 22.897650000000000000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        DataSet = frxDsCortesias
        DataSetName = 'dsCortesias'
        RowCount = 0
        Stretched = True
        object dsBaixasassnome: TfrxMemoView
          Left = 45.000000000000000000
          Top = 1.889763780000000000
          Width = 320.118430000000000000
          Height = 18.897650000000000000
          DataField = 'assnome'
          DataSet = frxDsCortesias
          DataSetName = 'dsCortesias'
          Memo.UTF8W = (
            '[dsCortesias."assnome"]')
          WordWrap = False
        end
        object dsBaixasasscod: TfrxMemoView
          Align = baLeft
          Top = 1.991960000000000000
          Width = 42.708656540000000000
          Height = 18.897637800000000000
          DataField = 'asscod'
          DataSet = frxDsCortesias
          DataSetName = 'dsCortesias'
          Memo.UTF8W = (
            '[dsCortesias."asscod"]')
        end
        object dsBaixasbdadt: TfrxMemoView
          Left = 567.000000000000000000
          Top = 1.991960000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataField = 'adadtvenc'
          DataSet = frxDsCortesias
          DataSetName = 'dsCortesias'
          Memo.UTF8W = (
            '[dsCortesias."adadtvenc"]')
        end
        object dsBaixasbdavl: TfrxMemoView
          Align = baRight
          Left = 642.520148820000000000
          Top = 1.991960000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataField = 'adavl'
          DataSet = frxDsCortesias
          DataSetName = 'dsCortesias'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCortesias."adavl"]')
        end
        object Memo4: TfrxMemoView
          Left = 374.669359690000000000
          Top = 2.000000000000000000
          Width = 102.913420000000000000
          Height = 18.897650000000000000
          StretchMode = smMaxHeight
          DataField = 'adacod'
          DataSet = frxDsCortesias
          DataSetName = 'dsCortesias'
          HAlign = haRight
          Memo.UTF8W = (
            '[dsCortesias."adacod"]')
        end
        object Memo11: TfrxMemoView
          Left = 487.559370000000000000
          Top = 1.779530000000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          DataField = 'adadtini'
          DataSet = frxDsCortesias
          DataSetName = 'dsCortesias'
          Memo.UTF8W = (
            '[dsCortesias."adadtini"]')
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        Height = 25.834570000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          Align = baLeft
          Width = 42.708661420000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'C'#243'd.')
        end
        object Line3: TfrxLineView
          Align = baWidth
          Top = 22.055040000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          Left = 44.976377950000000000
          Width = 76.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Assinante')
        end
        object Memo7: TfrxMemoView
          Left = 566.937007870000000000
          Width = 75.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Data Venc.')
        end
        object Memo8: TfrxMemoView
          Align = baRight
          Left = 642.520148820000000000
          Width = 75.590551180000000000
          Height = 18.897650000000000000
          HAlign = haRight
          Memo.UTF8W = (
            'Valor Ass.')
        end
        object Memo9: TfrxMemoView
          Left = 487.559370000000000000
          Width = 75.488250000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Data In'#237'cio')
        end
        object Memo13: TfrxMemoView
          Left = 374.669359690000000000
          Width = 102.913420000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            'Cod. Assinatura')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Height = 26.897650000000000000
        ParentFont = False
        Top = 287.244280000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          Align = baRight
          Left = 623.622450000000000000
          Top = 5.590290000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<dsCortesias."adavl">,MasterData1)]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          Align = baWidth
          Top = 1.708410000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo12: TfrxMemoView
          Left = 507.000000000000000000
          Top = 5.708410000000000000
          Width = 110.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL GERAL:')
          ParentFont = False
        end
      end
    end
  end
end
