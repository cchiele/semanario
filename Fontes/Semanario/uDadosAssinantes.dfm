object dmDadosAssinantes: TdmDadosAssinantes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 691
  Width = 1100
  object sqlTblass: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      '/*SQL ESTA NO CODIGO FONTE*/'#13#10#13#10'select tblass.*, tblzon.zoncod, ' +
      'tblzon.zondescr'#13#10'  from tblass, tblrdz, tblzon'#13#10'where tblass.rdz' +
      'cod = tblrdz.rdzcod'#13#10'    and tblrdz.zoncod = tblzon.zoncod'#13#10'    ' +
      'and 1 = 2'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 88
    Top = 16
    object sqlTblassasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object sqlTblassassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
    object sqlTblassasscpf: TStringField
      FieldName = 'asscpf'
      Size = 14
    end
    object sqlTblassassrazaosocial: TStringField
      FieldName = 'assrazaosocial'
      Size = 60
    end
    object sqlTblassasscnpj: TStringField
      FieldName = 'asscnpj'
      Size = 18
    end
    object sqlTblassassstatus: TIntegerField
      FieldName = 'assstatus'
      Required = True
    end
    object sqlTblassassdtinativo: TDateField
      FieldName = 'assdtinativo'
    end
    object sqlTblassassdtnasc: TDateField
      FieldName = 'assdtnasc'
    end
    object sqlTblassrdzcod: TIntegerField
      FieldName = 'rdzcod'
      Required = True
    end
    object sqlTblassassnroent: TStringField
      FieldName = 'assnroent'
      Required = True
      Size = 5
    end
    object sqlTblassasscomplent: TStringField
      FieldName = 'asscomplent'
      Size = 60
    end
    object sqlTblassassbairroent: TStringField
      FieldName = 'assbairroent'
      Size = 45
    end
    object sqlTblasscepcepent: TStringField
      FieldName = 'cepcepent'
      Required = True
      Size = 9
    end
    object sqlTblassassendercobr: TStringField
      FieldName = 'assendercobr'
      Size = 60
    end
    object sqlTblassassfonecomer: TStringField
      FieldName = 'assfonecomer'
      Size = 15
    end
    object sqlTblassassfonecomerramal: TStringField
      FieldName = 'assfonecomerramal'
      Size = 5
    end
    object sqlTblassassfoneresid: TStringField
      FieldName = 'assfoneresid'
      Size = 15
    end
    object sqlTblassassfonefax: TStringField
      FieldName = 'assfonefax'
      Size = 15
    end
    object sqlTblassassfonecelul: TStringField
      FieldName = 'assfonecelul'
      Size = 15
    end
    object sqlTblassvencod: TIntegerField
      FieldName = 'vencod'
      Required = True
    end
    object sqlTblasscobcod: TIntegerField
      FieldName = 'cobcod'
      Required = True
    end
    object sqlTblassassimpretiq: TStringField
      FieldName = 'assimpretiq'
      Required = True
      Size = 1
    end
    object sqlTblassassemail: TStringField
      FieldName = 'assemail'
      Size = 60
    end
    object sqlTblassassobs: TStringField
      FieldName = 'assobs'
      Size = 100
    end
    object sqlTblasszoncod: TStringField
      FieldName = 'zoncod'
      ProviderFlags = []
      Size = 3
    end
    object sqlTblasszondescr: TStringField
      FieldName = 'zondescr'
      ProviderFlags = []
      Size = 60
    end
    object sqlTblassassdtalt: TDateField
      FieldName = 'assdtalt'
      Required = True
    end
    object sqlTblassusucodalt: TIntegerField
      FieldName = 'usucodalt'
      Required = True
    end
  end
  object dspTblass: TDataSetProvider
    DataSet = sqlTblass
    OnUpdateError = dspTblassUpdateError
    Left = 88
    Top = 64
  end
  object cdsTblass: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblass'
    BeforeOpen = cdsTblassBeforeOpen
    BeforePost = cdsTblassBeforePost
    AfterScroll = cdsTblassAfterScroll
    OnCalcFields = cdsTblassCalcFields
    OnNewRecord = cdsTblassNewRecord
    Left = 88
    Top = 112
    object cdsTblassasscod: TIntegerField
      FieldName = 'asscod'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTblassassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
    object cdsTblassasscpf: TStringField
      FieldName = 'asscpf'
      OnValidate = cdsTblassasscpfValidate
      EditMask = '999.999.999-99;1;_'
      Size = 14
    end
    object cdsTblassassrazaosocial: TStringField
      FieldName = 'assrazaosocial'
      Size = 60
    end
    object cdsTblassasscnpj: TStringField
      FieldName = 'asscnpj'
      OnValidate = cdsTblassasscnpjValidate
      EditMask = '99.999.999/9999-99;1;_'
      Size = 18
    end
    object cdsTblassassstatus: TIntegerField
      FieldName = 'assstatus'
      Required = True
      OnValidate = cdsTblassassstatusValidate
    end
    object cdsTblassLookupStatus: TStringField
      FieldKind = fkLookup
      FieldName = 'LookupStatus'
      LookupDataSet = dmDadosGlobal.cdsStatusAssinante2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descr'
      KeyFields = 'assstatus'
      Size = 15
      Lookup = True
    end
    object cdsTblassassdtinativo: TDateField
      FieldName = 'assdtinativo'
      OnValidate = cdsTblassassdtinativoValidate
    end
    object cdsTblassassdtnasc: TDateField
      FieldName = 'assdtnasc'
    end
    object cdsTblassrdzcod: TIntegerField
      FieldName = 'rdzcod'
      Required = True
      OnValidate = cdsTblassrdzcodValidate
    end
    object cdsTblassassnroent: TStringField
      FieldName = 'assnroent'
      Required = True
      OnValidate = cdsTblassassnroentValidate
      Size = 5
    end
    object cdsTblassasscomplent: TStringField
      FieldName = 'asscomplent'
      Size = 60
    end
    object cdsTblassassbairroent: TStringField
      FieldName = 'assbairroent'
      Size = 60
    end
    object cdsTblasscepcepent: TStringField
      FieldName = 'cepcepent'
      Required = True
      OnValidate = cdsTblasscepcepentValidate
      EditMask = '99999\-999;1;_'
      Size = 9
    end
    object cdsTblassassendercobr: TStringField
      FieldName = 'assendercobr'
      Size = 60
    end
    object cdsTblassassfonecomer: TStringField
      FieldName = 'assfonecomer'
      EditMask = '\(99\)999999999;1;_'
      Size = 15
    end
    object cdsTblassassfonecomerramal: TStringField
      FieldName = 'assfonecomerramal'
      Size = 5
    end
    object cdsTblassassfoneresid: TStringField
      FieldName = 'assfoneresid'
      EditMask = '\(99\)999999999;1;_'
      Size = 15
    end
    object cdsTblassassfonefax: TStringField
      FieldName = 'assfonefax'
      EditMask = '\(99\)999999999;1;_'
      Size = 15
    end
    object cdsTblassassfonecelul: TStringField
      FieldName = 'assfonecelul'
      EditMask = '\(99\)999999999;1;_'
      Size = 15
    end
    object cdsTblassvencod: TIntegerField
      FieldName = 'vencod'
      Required = True
    end
    object cdsTblassLookupVencod: TStringField
      FieldKind = fkLookup
      FieldName = 'LookupVencod'
      LookupDataSet = cdsLookupVendedores
      LookupKeyFields = 'vencod'
      LookupResultField = 'vennome'
      KeyFields = 'vencod'
      Size = 60
      Lookup = True
    end
    object cdsTblasscobcod: TIntegerField
      FieldName = 'cobcod'
      Required = True
    end
    object cdsTblassLookupCobcod: TStringField
      FieldKind = fkLookup
      FieldName = 'LookupCobcod'
      LookupDataSet = cdsLookupCobradores
      LookupKeyFields = 'cobcod'
      LookupResultField = 'cobnome'
      KeyFields = 'cobcod'
      Size = 60
      Lookup = True
    end
    object cdsTblassassimpretiq: TStringField
      FieldName = 'assimpretiq'
      Required = True
      Size = 1
    end
    object cdsTblassLookupImpretiq: TStringField
      FieldKind = fkLookup
      FieldName = 'LookupImpretiq'
      LookupDataSet = dmDadosGlobal.cdsLookupSimNao
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descr'
      KeyFields = 'assimpretiq'
      Size = 3
      Lookup = True
    end
    object cdsTblassassemail: TStringField
      FieldName = 'assemail'
      OnValidate = cdsTblassassemailValidate
      Size = 60
    end
    object cdsTblassassobs: TStringField
      FieldName = 'assobs'
      Size = 100
    end
    object cdsTblasszoncod: TStringField
      FieldName = 'zoncod'
      ProviderFlags = []
      Size = 3
    end
    object cdsTblasszondescr: TStringField
      FieldName = 'zondescr'
      ProviderFlags = []
      Size = 60
    end
    object cdsTblassassdtalt: TDateField
      FieldName = 'assdtalt'
      Required = True
    end
    object cdsTblassusucodalt: TIntegerField
      FieldName = 'usucodalt'
      Required = True
    end
    object cdsTblassCalcFonecomerCompleto: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CalcFonecomerCompleto'
      ProviderFlags = []
      Size = 30
    end
    object cdsTblassCalcImpretiq: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CalcImpretiq'
      ProviderFlags = []
      Size = 3
    end
    object cdsTblassCalcCodigoDescrZona: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CalcCodigoDescrZona'
      ProviderFlags = []
      Size = 60
    end
    object cdsTblassCalcDescrStatus: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CalcDescrStatus'
      ProviderFlags = []
    end
  end
  object sqlTblcep: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select cepcep, cepmunicipio, cepeuf'#13#10'from tblcep'#13#10'where cepcep =' +
      ' :cepcepent'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'cepcepent'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 24
    Top = 16
    object sqlTblcepcepcep: TStringField
      FieldName = 'cepcep'
      Required = True
      Size = 9
    end
    object sqlTblcepcepmunicipio: TStringField
      FieldName = 'cepmunicipio'
      Required = True
      Size = 60
    end
    object sqlTblcepcepeuf: TStringField
      FieldName = 'cepeuf'
      Required = True
      Size = 2
    end
  end
  object sqlRuaZona: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select tblrdz.rdzcod, tblrdz.rdzender,'#13#10'           tblzon.zoncod' +
      ', tblzon.zondescr'#13#10'  from tblzon, tblrdz'#13#10'where tblzon.zoncod = ' +
      'tblrdz.zoncod'#13#10'    and tblrdz.rdzcod = :rdzcod'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'rdzcod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 152
    Top = 16
    object sqlRuaZonardzcod: TIntegerField
      FieldName = 'rdzcod'
      Required = True
    end
    object sqlRuaZonardzender: TStringField
      FieldName = 'rdzender'
      Required = True
      Size = 60
    end
    object sqlRuaZonazoncod: TStringField
      FieldName = 'zoncod'
      Required = True
      Size = 3
    end
    object sqlRuaZonazondescr: TStringField
      FieldName = 'zondescr'
      Required = True
      Size = 60
    end
  end
  object sqlLookupVendedores: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select vencod, vennome'#13#10'from tblven'#13#10'order by vennome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 592
    Top = 16
  end
  object dspLookupVendedores: TDataSetProvider
    DataSet = sqlLookupVendedores
    Left = 592
    Top = 72
  end
  object cdsLookupVendedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLookupVendedores'
    Left = 592
    Top = 128
    object cdsLookupVendedoresvencod: TIntegerField
      FieldName = 'vencod'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLookupVendedoresvennome: TStringField
      FieldName = 'vennome'
      Required = True
      Size = 60
    end
  end
  object sqlLookupCobradores: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select cobcod, cobnome'#13#10'from tblcob'#13#10'order by cobnome'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 712
    Top = 16
  end
  object dspLookupCobradores: TDataSetProvider
    DataSet = sqlLookupCobradores
    Left = 712
    Top = 72
  end
  object cdsLookupCobradores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLookupCobradores'
    Left = 712
    Top = 128
    object cdsLookupCobradorescobcod: TIntegerField
      FieldName = 'cobcod'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsLookupCobradorescobnome: TStringField
      FieldName = 'cobnome'
      Required = True
      Size = 60
    end
  end
  object sqlTblada: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select *'#13#10'from tblada'#13#10'where asscod = :asscod'#13#10'order by adacod d' +
      'esc'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 56
    Top = 160
  end
  object cdsTblada: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblada'
    BeforePost = cdsTbladaBeforePost
    AfterScroll = cdsTbladaAfterScroll
    OnCalcFields = cdsTbladaCalcFields
    OnNewRecord = cdsTbladaNewRecord
    Left = 56
    Top = 256
    object cdsTbladaasscod: TIntegerField
      FieldName = 'asscod'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTbladaadacod: TIntegerField
      FieldName = 'adacod'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTbladaadatipo: TStringField
      FieldName = 'adatipo'
      Required = True
      Size = 1
    end
    object cdsTbladaLookupAdatipo: TStringField
      FieldKind = fkLookup
      FieldName = 'LookupAdatipo'
      LookupDataSet = cdsLookupTipoAssinatura
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descr'
      KeyFields = 'adatipo'
      Lookup = True
    end
    object cdsTbladaadadtini: TDateField
      FieldName = 'adadtini'
      Required = True
    end
    object cdsTbladaadadtvenc: TDateField
      FieldName = 'adadtvenc'
      Required = True
      OnValidate = cdsTbladaadadtvencValidate
    end
    object cdsTbladaadavl: TFloatField
      FieldName = 'adavl'
      Required = True
      OnValidate = cdsTbladaadavlValidate
      DisplayFormat = '#,##0.00'
    end
    object cdsTbladaadavldesc: TFloatField
      FieldName = 'adavldesc'
      Required = True
      OnValidate = cdsTbladaadavldescValidate
      DisplayFormat = '#,##0.00'
    end
    object cdsTbladaadavlpend: TFloatField
      FieldName = 'adavlpend'
      Required = True
      DisplayFormat = '#,##0.00'
    end
    object cdsTbladaadaobs: TStringField
      FieldName = 'adaobs'
      Size = 100
    end
    object cdsTbladaadacancel: TStringField
      FieldName = 'adacancel'
      Required = True
      OnValidate = cdsTbladaadacancelValidate
      Size = 1
    end
    object cdsTbladaadadtcancel: TDateField
      FieldName = 'adadtcancel'
      OnValidate = cdsTbladaadadtcancelValidate
    end
    object cdsTbladaadacortesia: TStringField
      FieldName = 'adacortesia'
      Size = 1
    end
    object cdsTbladaLookupAdacortesia: TStringField
      FieldKind = fkLookup
      FieldName = 'LookupAdacortesia'
      LookupDataSet = dmDadosGlobal.cdsLookupSimNao2
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descr'
      KeyFields = 'adacortesia'
      Size = 1
      Lookup = True
    end
    object cdsTbladagaacod: TIntegerField
      FieldName = 'gaacod'
    end
    object cdsTbladaLookupAdacancel: TStringField
      FieldKind = fkLookup
      FieldName = 'LookupAdacancel'
      LookupDataSet = dmDadosGlobal.cdsLookupSimNao
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Descr'
      KeyFields = 'adacancel'
      Size = 3
      Lookup = True
    end
    object cdsTbladaadadtalt: TDateField
      FieldName = 'adadtalt'
      Required = True
    end
    object cdsTbladausucodalt: TIntegerField
      FieldName = 'usucodalt'
      Required = True
    end
    object cdsTbladaCalcAdatipo: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CalcAdatipo'
      Size = 15
    end
    object cdsTbladaCalcAdacancel: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CalcAdacancel'
      Size = 3
    end
  end
  object sqlTblbda: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select tblbda.*, tblusu.usunome'#13#10'  from tblbda, tblusu'#13#10'where tb' +
      'lbda.usucod = tblusu.usucod'#13#10'    and tblbda.asscod = :asscod'#13#10'  ' +
      '  and tblbda.adacod = :adacod'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'adacod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 120
    Top = 160
    object sqlTblbdaasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object sqlTblbdaadacod: TIntegerField
      FieldName = 'adacod'
      Required = True
    end
    object sqlTblbdabdacod: TIntegerField
      FieldName = 'bdacod'
      Required = True
    end
    object sqlTblbdausucod: TIntegerField
      FieldName = 'usucod'
      Required = True
    end
    object sqlTblbdabdadt: TDateField
      FieldName = 'bdadt'
      Required = True
    end
    object sqlTblbdabdavl: TFloatField
      FieldName = 'bdavl'
      Required = True
    end
    object sqlTblbdausunome: TStringField
      FieldName = 'usunome'
      ProviderFlags = []
      Size = 60
    end
  end
  object cdsTblbda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblbda'
    BeforePost = cdsTblbdaBeforePost
    OnNewRecord = cdsTblbdaNewRecord
    Left = 120
    Top = 256
    object cdsTblbdaasscod: TIntegerField
      FieldName = 'asscod'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTblbdaadacod: TIntegerField
      FieldName = 'adacod'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTblbdabdacod: TIntegerField
      FieldName = 'bdacod'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTblbdausucod: TIntegerField
      FieldName = 'usucod'
      Required = True
    end
    object cdsTblbdabdadt: TDateField
      FieldName = 'bdadt'
      Required = True
      OnValidate = cdsTblbdabdadtValidate
    end
    object cdsTblbdabdavl: TFloatField
      FieldName = 'bdavl'
      Required = True
      OnValidate = cdsTblbdabdavlValidate
      DisplayFormat = '#,##0.00'
    end
    object cdsTblbdausunome: TStringField
      FieldName = 'usunome'
      ProviderFlags = []
      Size = 60
    end
  end
  object sqlExisteCnpj: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select asscod, asscnpj, assnome'#13#10'from tblass'#13#10'where asscnpj = :a' +
      'sscnpj'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'asscnpj'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 720
    Top = 344
    object sqlExisteCnpjasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object sqlExisteCnpjasscnpj: TStringField
      FieldName = 'asscnpj'
      Size = 18
    end
    object sqlExisteCnpjassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
  end
  object sqlExisteCpf: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select asscod, asscpf, assnome'#13#10'from tblass'#13#10'where asscpf = :ass' +
      'cpf'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'asscpf'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 824
    Top = 344
    object sqlExisteCpfasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object sqlExisteCpfasscpf: TStringField
      FieldName = 'asscpf'
      Size = 14
    end
    object sqlExisteCpfassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
  end
  object cdsLookupTipoAssinatura: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 976
    Top = 16
    object cdsLookupTipoAssinaturaCodigo: TStringField
      FieldName = 'Codigo'
      Size = 1
    end
    object cdsLookupTipoAssinaturaDescr: TStringField
      FieldName = 'Descr'
    end
  end
  object sqlMaxAdacod: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select max(adacod) as adacod'#13#10'from tblada'#13#10'where asscod = :assco' +
      'd'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 904
    Top = 344
    object sqlMaxAdacodadacod: TIntegerField
      FieldName = 'adacod'
    end
  end
  object sqlAssinaturaAnterior: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select *'#13#10'  from tblada'#13#10'where asscod = :asscod'#13#10'    and adacod ' +
      '= :adacod'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'adacod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 720
    Top = 400
    object sqlAssinaturaAnteriorasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object sqlAssinaturaAnterioradacod: TIntegerField
      FieldName = 'adacod'
      Required = True
    end
    object sqlAssinaturaAnterioradatipo: TStringField
      FieldName = 'adatipo'
      Required = True
      Size = 1
    end
    object sqlAssinaturaAnterioradadtini: TDateField
      FieldName = 'adadtini'
      Required = True
    end
    object sqlAssinaturaAnterioradadtvenc: TDateField
      FieldName = 'adadtvenc'
      Required = True
    end
    object sqlAssinaturaAnterioradavl: TFloatField
      FieldName = 'adavl'
      Required = True
    end
    object sqlAssinaturaAnterioradavlpend: TFloatField
      FieldName = 'adavlpend'
      Required = True
    end
    object sqlAssinaturaAnterioradaobs: TStringField
      FieldName = 'adaobs'
      Size = 100
    end
    object sqlAssinaturaAnterioradacancel: TStringField
      FieldName = 'adacancel'
      Required = True
      Size = 1
    end
  end
  object sqlTotalBaixas: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      '/* SQL ESTA NO CODIGO FONTE*/'#13#10'select sum(bdavl) as vltotbaixas'#13 +
      #10'  from tblbda'#13#10'where asscod = :asscod'#13#10'    and adacod = :adacod'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'asscod'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'adacod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 824
    Top = 400
    object sqlTotalBaixasvltotbaixas: TFloatField
      FieldName = 'vltotbaixas'
    end
  end
  object sqlMaxBdacod: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select max(bdacod) as bdacod'#13#10'from tblbda'#13#10'where asscod = :assco' +
      'd'#13#10'and adacod = :adacod'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'adacod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 904
    Top = 400
    object sqlMaxBdacodbdacod: TIntegerField
      FieldName = 'bdacod'
    end
  end
  object sqlPesquisaEndereco: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      '/*SQL EST'#193' NO C'#211'DIGO FONTE*/'#13#10#13#10'select tblrdz.rdzcod, tblrdz.rdz' +
      'ender, tblzon.zoncod, tblzon.zondescr'#13#10'  from tblrdz, tblzon'#13#10'wh' +
      'ere tblrdz.zoncod = tblzon.zoncod'#13#10'order by tblrdz.rdzender'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 832
    Top = 16
  end
  object dspPesquisaEndereco: TDataSetProvider
    DataSet = sqlPesquisaEndereco
    Left = 832
    Top = 72
  end
  object cdsPesquisaEndereco: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesquisaEndereco'
    Left = 832
    Top = 128
    object cdsPesquisaEnderecordzcod: TIntegerField
      FieldName = 'rdzcod'
      Required = True
    end
    object cdsPesquisaEnderecordzender: TStringField
      FieldName = 'rdzender'
      Required = True
      Size = 60
    end
    object cdsPesquisaEnderecozoncod: TStringField
      FieldName = 'zoncod'
      Required = True
      Size = 3
    end
    object cdsPesquisaEnderecozondescr: TStringField
      FieldName = 'zondescr'
      Required = True
      Size = 60
    end
  end
  object sqlAssinaturasAuto: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select tblass.asscod, tblass.assnome, tblada.adadtini, tblada.ad' +
      'adtvenc, tblada.adacortesia'#13#10'from tblass, tblada'#13#10'where tblass.a' +
      'sscod = tblada.asscod'#13#10'and tblass.assstatus = 0'#13#10'and tblada.adad' +
      'tvenc between :adadtini and :adadtfim'#13#10'and tblada.adacancel = '#39'N' +
      #39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'adadtini'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'adadtfim'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 368
    Top = 16
  end
  object dspAssinaturasAuto: TDataSetProvider
    DataSet = sqlAssinaturasAuto
    OnUpdateError = dspAssinaturasAutoUpdateError
    Left = 368
    Top = 64
  end
  object cdsAssinaturasAuto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAssinaturasAuto'
    Left = 368
    Top = 112
    object cdsAssinaturasAutoasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object cdsAssinaturasAutoassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
    object cdsAssinaturasAutoadadtini: TDateField
      FieldName = 'adadtini'
      Required = True
    end
    object cdsAssinaturasAutoadadtvenc: TDateField
      FieldName = 'adadtvenc'
      Required = True
    end
    object cdsAssinaturasAutoadacortesia: TStringField
      FieldName = 'adacortesia'
      Size = 1
    end
  end
  object sqlTblgaa: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select *'#13#10'from tblgaa'#13#10'where gaaanomes = :gaaanomes'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'gaaanomes'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 368
    Top = 208
  end
  object dspTblgaa: TDataSetProvider
    DataSet = sqlTblgaa
    OnUpdateError = dspTblgaaUpdateError
    Left = 368
    Top = 256
  end
  object cdsTblgaa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblgaa'
    Left = 368
    Top = 304
    object cdsTblgaagaacod: TIntegerField
      FieldName = 'gaacod'
      Required = True
    end
    object cdsTblgaagaaanomes: TDateField
      FieldName = 'gaaanomes'
      Required = True
    end
    object cdsTblgaagaadtgerauto: TDateField
      FieldName = 'gaadtgerauto'
      Required = True
    end
    object cdsTblgaagaavennome: TStringField
      FieldName = 'gaavennome'
      Size = 60
    end
    object cdsTblgaagaavlass: TFloatField
      FieldName = 'gaavlass'
      Required = True
    end
    object cdsTblgaagaanromes: TIntegerField
      FieldName = 'gaanromes'
      Required = True
    end
    object cdsTblgaausucod: TIntegerField
      FieldName = 'usucod'
      Required = True
    end
  end
  object dspTblada: TDataSetProvider
    DataSet = sqlTblada
    OnUpdateError = dspTbladaUpdateError
    Left = 56
    Top = 208
  end
  object dspTblbda: TDataSetProvider
    DataSet = sqlTblbda
    OnUpdateError = dspTblbdaUpdateError
    Left = 120
    Top = 208
  end
  object sqlFiltroZona: TSQLDataSet
    CommandText = 
      'select '#39#39' as zoncod, '#39#39' as zondescr'#13#10'from tblemp'#13#10'union '#13#10'select' +
      ' zoncod, zondescr'#13#10'from tblzon'#13#10'order by zondescr'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 496
    Top = 16
  end
  object dspFiltroZona: TDataSetProvider
    DataSet = sqlFiltroZona
    Left = 496
    Top = 72
  end
  object cdsFiltroZona: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFiltroZona'
    Left = 496
    Top = 128
    object cdsFiltroZonazoncod: TStringField
      FieldName = 'zoncod'
      Required = True
      Size = 3
    end
    object cdsFiltroZonazondescr: TStringField
      FieldName = 'zondescr'
      Required = True
      Size = 60
    end
  end
  object sqlExisteEndereco: TSQLDataSet
    CommandText = 
      'select asscod, assnome'#13#10'from tblass'#13#10'where rdzcod = :rdzcod'#13#10'and' +
      ' assnroent = :assnroent'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'rdzcod'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assnroent'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 624
    Top = 344
    object sqlExisteEnderecoasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object sqlExisteEnderecoassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
  end
  object sqlExisteProxAss: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select count(*) as nroreg'#13#10'from tblada'#13#10'where tblada.asscod = :a' +
      'sscod'#13#10'and tblada.adadtvenc between :adadtvencini and :adadtvenc' +
      'fim'#13#10'and tblada.adacancel = '#39'N'#39
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'adadtvencini'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'adadtvencfim'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 368
    Top = 160
    object sqlExisteProxAssnroreg: TLargeintField
      FieldName = 'nroreg'
      Required = True
    end
  end
  object sqlBaixaRapida: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      '/*SQL EST'#193' NO C'#211'DIGO FONTE*/'#13#10#13#10'select tblass.asscod, tblass.ass' +
      'nome,'#13#10'       tblada.adacod, tblada.adadtvenc, tblada.adavlpend'#13 +
      #10'from tblass, tblada'#13#10'where tblass.asscod = tblada.asscod'#13#10'and t' +
      'blada.adacancel = '#39'N'#39#13#10'and tblada.adavlpend > 0'#13#10'and tblass.assn' +
      'ome like '#39'%CRISTIANO ch%'#39#13#10'order by tblass.asscod, tblada.adacod' +
      ' desc'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 248
    Top = 312
  end
  object dspBaixaRapida: TDataSetProvider
    DataSet = sqlBaixaRapida
    Left = 248
    Top = 360
  end
  object cdsBaixaRapida: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBaixaRapida'
    Left = 248
    Top = 408
    object cdsBaixaRapidaasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object cdsBaixaRapidaassnome: TStringField
      FieldName = 'assnome'
      Required = True
      Size = 60
    end
    object cdsBaixaRapidaadacod: TIntegerField
      FieldName = 'adacod'
      Required = True
    end
    object cdsBaixaRapidaadadtvenc: TDateField
      FieldName = 'adadtvenc'
      Required = True
    end
    object cdsBaixaRapidaadavlpend: TFloatField
      FieldName = 'adavlpend'
      Required = True
      DisplayFormat = '#,##0.00'
    end
  end
  object sqlMaxGaacod: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select max(gaacod) + 1 as gaacod'#13#10'from tblgaa'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 624
    Top = 400
    object sqlMaxGaacodgaacod: TLargeintField
      FieldName = 'gaacod'
    end
  end
  object sqlTblhas: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select *'#13#10'from tblhas'#13#10'where asscod = :asscod'#13#10'order by hasseg'
    MaxBlobSize = 1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 248
    Top = 16
  end
  object dspTblhas: TDataSetProvider
    DataSet = sqlTblhas
    OnUpdateError = dspTblhasUpdateError
    Left = 248
    Top = 64
  end
  object cdsTblhas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblhas'
    OnCalcFields = cdsTblhasCalcFields
    OnNewRecord = cdsTblhasNewRecord
    Left = 248
    Top = 112
    object cdsTblhasasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object cdsTblhashasseg: TIntegerField
      FieldName = 'hasseg'
      Required = True
    end
    object cdsTblhashasdt: TDateField
      FieldName = 'hasdt'
      Required = True
      OnValidate = cdsTblhashasdtValidate
    end
    object cdsTblhashasdescr: TMemoField
      FieldName = 'hasdescr'
      Required = True
      OnValidate = cdsTblhashasdescrValidate
      BlobType = ftMemo
      Size = 1
    end
    object cdsTblhasCalcHasdescr: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CalcHasdescr'
      Size = 255
    end
  end
  object sqlMaxHasseg: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select max(hasseg) as hasseg'#13#10'from tblhas'#13#10'where asscod = :assco' +
      'd'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 248
    Top = 160
    object sqlMaxHasseghasseg: TIntegerField
      FieldName = 'hasseg'
    end
  end
  object sqlTblcpa: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select *'#13#10'from tblcpa'#13#10'where asscod = :asscod'#13#10'and adacod = :ada' +
      'cod'#13#10'order by cpadtvenc'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'adacod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 40
    Top = 312
  end
  object dspTblcpa: TDataSetProvider
    DataSet = sqlTblcpa
    OnUpdateError = dspTblcpaUpdateError
    Left = 40
    Top = 360
  end
  object cdsTblcpa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblcpa'
    OnNewRecord = cdsTblcpaNewRecord
    Left = 40
    Top = 408
    object cdsTblcpaasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object cdsTblcpaadacod: TIntegerField
      FieldName = 'adacod'
      Required = True
    end
    object cdsTblcpacpadtvenc: TDateField
      FieldName = 'cpadtvenc'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object cdsTblcpacpadtemis: TDateField
      FieldName = 'cpadtemis'
      Required = True
    end
    object cdsTblcpacpanroparc: TIntegerField
      FieldName = 'cpanroparc'
    end
    object cdsTblcpacpavl: TFloatField
      FieldName = 'cpavl'
      Required = True
      OnValidate = cdsTblcpacpavlValidate
      DisplayFormat = '#,##0.00'
    end
  end
  object sqlUpdateTblada: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'update tblada set adatipo=:adatipo, adadtini=:adadtini, adadtven' +
      'c=:adadtvenc, adavl=:adavl, adavldesc=:adavldesc, adavlpend=:ada' +
      'vlpend, adaobs=:adaobs, adacancel=:adacancel, adadtcancel=:adadt' +
      'cancel, adacortesia = :adacortesia, gaacod=:gaacod, adadtalt=:ad' +
      'adtalt, usucodalt=:usucodalt'#13#10'where asscod = :asscod'#13#10'and adacod' +
      ' = :adacod'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'adatipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'adadtini'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'adadtvenc'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'adavl'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'adavldesc'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'adavlpend'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'adaobs'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'adacancel'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'adadtcancel'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'adacortesia'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'gaacod'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'adadtalt'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'usucodalt'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'adacod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 40
    Top = 536
  end
  object sqlInsertTblada: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'insert into tblada values (:asscod, :adacod, :adatipo, :adadtini' +
      ', :adadtvenc, :adavl, :adavldesc, '#13#10':adavlpend, :adaobs, :adacan' +
      'cel, :adadtcancel, :adacortesia, :gaacod, :adadtalt, :usucodalt)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'adacod'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'adatipo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'adadtini'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'adadtvenc'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'adavl'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'adavldesc'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'adavlpend'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'adaobs'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'adacancel'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'adadtcancel'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'adacortesia'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'gaacod'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'adadtalt'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'usucodalt'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 40
    Top = 584
  end
  object sqlDeleteTblcpa: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'delete from tblcpa'#13#10'where asscod = :asscod'#13#10'and adacod = :adacod'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'adacod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 224
    Top = 536
  end
  object sqlInsertTblcpa: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'insert into tblcpa values (:asscod, :adacod, :cpadtvenc, :cpadte' +
      'mis, :cpanroparc, :cpavl)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'adacod'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'cpadtvenc'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'cpadtemis'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'cpanroparc'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'cpavl'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 224
    Top = 584
  end
  object sqlDeleteTblada: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'delete from tblada'#13#10'where asscod = :asscod'#13#10'and adacod = :adacod'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'adacod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 40
    Top = 632
  end
  object sqlDeleteTblbda: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'delete from tblbda'#13#10'where asscod = :asscod'#13#10'and adacod = :adacod' +
      #13#10'and bdacod = :bdacod'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'adacod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'bdacod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 136
    Top = 632
  end
  object sqlUpdateTblbda: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'update tblbda set usucod = :usucod, bdadt = :bdadt, bdavl = :bda' +
      'vl'#13#10'where asscod = :asscod'#13#10'and adacod = :adacod'#13#10'and bdacod = :' +
      'bdacod'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'usucod'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'bdadt'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'bdavl'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'adacod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'bdacod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 136
    Top = 536
  end
  object sqlInsertTblbda: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'insert into tblbda values (:asscod, :adacod, :bdacod, :usucod, :' +
      'bdadt, :bdavl)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'adacod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'bdacod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'usucod'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'bdadt'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'bdavl'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 136
    Top = 584
  end
  object sqlInsertTblgaa: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'insert into tblgaa values (:gaacod, :gaaanomes, :gaadtgerauto, :' +
      'gaavennome, :gaavlass, :gaanromes, :usucod)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'gaacod'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'gaaanomes'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'gaadtgerauto'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'gaavennome'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'gaavlass'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'gaanromes'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'usucod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 368
    Top = 352
  end
  object sqlInsertTblass: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'insert into tblass values (:asscod, :assnome, :asscpf, :assrazao' +
      'social, :asscnpj, :assstatus, :assdtinativo,'#13#10':assdtnasc, :rdzco' +
      'd, :assnroent, :asscomplent, :assbairroent, :cepcepent, :assende' +
      'rcobr,'#13#10':assfonecomer, :assfonecomerramal, :assfoneresid, :assfo' +
      'nefax, :assfonecelul, :vencod,'#13#10':cobcod, :assimpretiq, :assemail' +
      ', :assobs, :assdtalt, :usucodalt)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assnome'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'asscpf'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assrazaosocial'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'asscnpj'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'assstatus'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'assdtinativo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'assdtnasc'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'rdzcod'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assnroent'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'asscomplent'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assbairroent'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cepcepent'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assendercobr'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assfonecomer'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assfonecomerramal'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assfoneresid'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assfonefax'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assfonecelul'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'vencod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'cobcod'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assimpretiq'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assemail'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assobs'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'assdtalt'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'usucodalt'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 312
    Top = 584
  end
  object sqlUpdateTblass: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'update tblass set'#13#10'assnome = :assnome,'#13#10'asscpf = :asscpf,'#13#10'assra' +
      'zaosocial = :assrazaosocial,'#13#10'asscnpj = :asscnpj,'#13#10'assstatus = :' +
      'assstatus,'#13#10'assdtinativo = :assdtinativo,'#13#10'assdtnasc = :assdtnas' +
      'c,'#13#10'rdzcod = :rdzcod,'#13#10'assnroent = :assnroent,'#13#10'asscomplent = :a' +
      'sscomplent,'#13#10'assbairroent = :assbairroent,'#13#10'cepcepent = :cepcepe' +
      'nt,'#13#10'assendercobr = :assendercobr,'#13#10'assfonecomer = :assfonecomer' +
      ','#13#10'assfonecomerramal = :assfonecomerramal,'#13#10'assfoneresid = :assf' +
      'oneresid,'#13#10'assfonefax = :assfonefax,'#13#10'assfonecelul = :assfonecel' +
      'ul,'#13#10'vencod = :vencod,'#13#10'cobcod = :cobcod,'#13#10'assimpretiq = :assimp' +
      'retiq,'#13#10'assemail = :assemail,'#13#10'assobs = :assobs,'#13#10'assdtalt = :as' +
      'sdtalt,'#13#10'usucodalt = :usucodalt'#13#10'where asscod = :asscod'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'assnome'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'asscpf'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assrazaosocial'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'asscnpj'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'assstatus'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'assdtinativo'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'assdtnasc'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'rdzcod'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assnroent'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'asscomplent'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assbairroent'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'cepcepent'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assendercobr'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assfonecomer'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assfonecomerramal'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assfoneresid'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assfonefax'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assfonecelul'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'vencod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'cobcod'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assimpretiq'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assemail'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'assobs'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'assdtalt'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'usucodalt'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 312
    Top = 536
  end
  object sqlDeleteTblass: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'delete from tblass'#13#10'where asscod = :asscod'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 312
    Top = 632
  end
  object sqlMaxGaaanomes: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select max(gaaanomes) as gaaanomes'#13#10'from tblgaa'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 992
    Top = 344
    object sqlMaxGaaanomesgaaanomes: TDateField
      FieldName = 'gaaanomes'
    end
  end
  object sqlInsertTblhma: TSQLDataSet
    CommandText = 
      'insert into tblhma values (:asscod, now(), :hmaseq, :usucod, :hm' +
      'adescr)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'asscod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'hmaseq'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'usucod'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'hmadescr'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 400
    Top = 536
  end
  object sqlMaxAsscod: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select max(asscod) as asscod'#13#10'from tblass'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 992
    Top = 400
    object sqlMaxAsscodasscod: TIntegerField
      FieldName = 'asscod'
    end
  end
  object cdsTblcpaBkp: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 408
    object cdsTblcpaBkpcpadtvenc: TDateField
      FieldName = 'cpadtvenc'
    end
    object cdsTblcpaBkpcpavl: TFloatField
      FieldName = 'cpavl'
    end
  end
end
