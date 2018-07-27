object dmDadosZonasRuas: TdmDadosZonasRuas
  OldCreateOrder = False
  Height = 340
  Width = 789
  object sqlTblzon: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select * from tblzon'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 56
    Top = 16
  end
  object dspTblzon: TDataSetProvider
    DataSet = sqlTblzon
    OnUpdateError = dspTblzonUpdateError
    Left = 56
    Top = 72
  end
  object cdsTblzon: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblzon'
    Left = 56
    Top = 128
    object cdsTblzonzoncod: TStringField
      FieldName = 'zoncod'
      Required = True
      OnValidate = cdsTblzonzoncodValidate
      Size = 3
    end
    object cdsTblzonzondescr: TStringField
      FieldName = 'zondescr'
      Required = True
      OnValidate = cdsTblzonzondescrValidate
      Size = 60
    end
    object cdsTblzonzonentregador: TStringField
      FieldName = 'zonentregador'
      Size = 60
    end
  end
  object sqlExisteZona: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select zoncod'#13#10'from tblzon'#13#10'where zoncod = :zoncod'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'zoncod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 656
    Top = 16
    object sqlExisteZonazoncod: TStringField
      FieldName = 'zoncod'
      Required = True
      Size = 3
    end
  end
  object sqlTblrdz: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select * from tblrdz'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 248
    Top = 16
  end
  object dspTblrdz: TDataSetProvider
    DataSet = sqlTblrdz
    OnUpdateError = dspTblzonUpdateError
    Left = 248
    Top = 72
  end
  object cdsTblrdz: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblrdz'
    OnNewRecord = cdsTblrdzNewRecord
    Left = 248
    Top = 128
    object cdsTblrdzrdzcod: TIntegerField
      FieldName = 'rdzcod'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTblrdzzoncod: TStringField
      FieldName = 'zoncod'
      Required = True
      Size = 3
    end
    object cdsTblrdzrdzender: TStringField
      FieldName = 'rdzender'
      Required = True
      OnValidate = cdsTblrdzrdzenderValidate
      Size = 60
    end
    object cdsTblrdzLookupZondescr: TStringField
      FieldKind = fkLookup
      FieldName = 'LookupZondescr'
      LookupDataSet = cdsLookupZonas
      LookupKeyFields = 'zoncod'
      LookupResultField = 'zondescr'
      KeyFields = 'zoncod'
      Size = 60
      Lookup = True
    end
  end
  object sqlLookupZonas: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select zoncod, zondescr'#13#10'from tblzon'#13#10'order by zondescr'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 344
    Top = 16
  end
  object dspLookupZonas: TDataSetProvider
    DataSet = sqlLookupZonas
    Left = 344
    Top = 72
  end
  object cdsLookupZonas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLookupZonas'
    Left = 344
    Top = 128
    object cdsLookupZonaszoncod: TStringField
      FieldName = 'zoncod'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object cdsLookupZonaszondescr: TStringField
      FieldName = 'zondescr'
      Required = True
      Size = 60
    end
  end
end
