object dmDadosCobradores: TdmDadosCobradores
  OldCreateOrder = False
  Height = 306
  Width = 483
  object sqlTblcob: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select * from tblcob'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 192
    Top = 16
  end
  object dspTblcob: TDataSetProvider
    DataSet = sqlTblcob
    OnUpdateError = dspTblcobUpdateError
    Left = 192
    Top = 72
  end
  object cdsTblcob: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblcob'
    OnNewRecord = cdsTblcobNewRecord
    Left = 192
    Top = 128
    object cdsTblcobcobcod: TIntegerField
      FieldName = 'cobcod'
      Required = True
    end
    object cdsTblcobcobnome: TStringField
      FieldName = 'cobnome'
      Required = True
      OnValidate = cdsTblcobcobnomeValidate
      Size = 60
    end
  end
end
