object dmDadosVendedores: TdmDadosVendedores
  OldCreateOrder = False
  Height = 319
  Width = 693
  object sqlTblgdv: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select * from tblgdv'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 40
    Top = 16
  end
  object dspTblgdv: TDataSetProvider
    DataSet = sqlTblgdv
    OnUpdateError = dspTblgdvUpdateError
    Left = 40
    Top = 72
  end
  object cdsTblgdv: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblgdv'
    OnNewRecord = cdsTblgdvNewRecord
    Left = 40
    Top = 128
    object cdsTblgdvgdvcod: TIntegerField
      FieldName = 'gdvcod'
      Required = True
    end
    object cdsTblgdvgdvdescr: TStringField
      FieldName = 'gdvdescr'
      Required = True
      OnValidate = cdsTblgdvgdvdescrValidate
      Size = 60
    end
  end
  object sqlTblven: TSQLDataSet
    CommandText = 'select * from tblven'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 176
    Top = 16
  end
  object dspTblven: TDataSetProvider
    DataSet = sqlTblven
    OnUpdateError = dspTblgdvUpdateError
    Left = 176
    Top = 72
  end
  object cdsTblven: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblven'
    BeforePost = cdsTblvenBeforePost
    OnNewRecord = cdsTblvenNewRecord
    Left = 176
    Top = 128
    object cdsTblvenvencod: TIntegerField
      FieldName = 'vencod'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTblvenvennome: TStringField
      FieldName = 'vennome'
      Required = True
      OnValidate = cdsTblvenvennomeValidate
      Size = 60
    end
    object cdsTblvengdvcod: TIntegerField
      FieldName = 'gdvcod'
      Required = True
    end
    object cdsTblvenvenfone: TStringField
      FieldName = 'venfone'
      EditMask = '\(99\)999999999;1;_'
      Size = 15
    end
    object cdsTblvenLookupGdvdescr: TStringField
      FieldKind = fkLookup
      FieldName = 'LookupGdvdescr'
      LookupDataSet = cdslLookupGrupos
      LookupKeyFields = 'gdvcod'
      LookupResultField = 'gdvdescr'
      KeyFields = 'gdvcod'
      Size = 60
      Lookup = True
    end
  end
  object sqlLookupGrupos: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select gdvcod, gdvdescr'#13#10'from tblgdv'#13#10'order by gdvdescr'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 264
    Top = 16
    object IntegerField1: TIntegerField
      FieldName = 'gdvcod'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'gdvdescr'
      Required = True
      Size = 60
    end
  end
  object dsplLookupGrupos: TDataSetProvider
    DataSet = sqlLookupGrupos
    OnUpdateError = dspTblgdvUpdateError
    Left = 264
    Top = 72
  end
  object cdslLookupGrupos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsplLookupGrupos'
    Left = 264
    Top = 128
    object cdslLookupGruposgdvcod: TIntegerField
      FieldName = 'gdvcod'
      Required = True
    end
    object cdslLookupGruposgdvdescr: TStringField
      FieldName = 'gdvdescr'
      Required = True
      Size = 60
    end
  end
  object sqlFiltroGrupos: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select 0 as gdvcod, "" as gdvdescr'#13#10'  from tblgdv'#13#10'where 1 = 1'#13#10 +
      'union'#13#10'select gdvcod, gdvdescr'#13#10'  from tblgdv'#13#10'order by 2'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 576
    Top = 16
  end
  object dspFiltroGrupos: TDataSetProvider
    DataSet = sqlFiltroGrupos
    OnUpdateError = dspTblgdvUpdateError
    Left = 576
    Top = 72
  end
  object cdsFiltroGrupos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFiltroGrupos'
    Left = 576
    Top = 128
    object cdsFiltroGruposgdvcod: TLargeintField
      FieldName = 'gdvcod'
      Required = True
    end
    object cdsFiltroGruposgdvdescr: TStringField
      FieldName = 'gdvdescr'
      Required = True
      Size = 60
    end
  end
  object sqlListaVendedores: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select vencod, vennome'#13#10'from tblven'#13#10'order by 2'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 464
    Top = 15
  end
  object dspListaVendedores: TDataSetProvider
    DataSet = sqlListaVendedores
    Left = 464
    Top = 72
  end
  object cdsListaVendedores: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspListaVendedores'
    Left = 464
    Top = 128
    object cdsListaVendedoresvencod: TIntegerField
      FieldName = 'vencod'
      Required = True
    end
    object cdsListaVendedoresvennome: TStringField
      FieldName = 'vennome'
      Required = True
      Size = 60
    end
  end
end
