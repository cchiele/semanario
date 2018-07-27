object dmDadosCep: TdmDadosCep
  OldCreateOrder = False
  Height = 322
  Width = 487
  object sqlTblcep: TSQLDataSet
    CommandText = 'select * from tblcep'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 176
    Top = 32
  end
  object dspTblcep: TDataSetProvider
    DataSet = sqlTblcep
    OnUpdateError = dspTblcepUpdateError
    Left = 176
    Top = 88
  end
  object cdsTblcep: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblcep'
    AfterInsert = cdsTblcepAfterInsert
    Left = 176
    Top = 144
    object cdsTblcepcepcep: TStringField
      FieldName = 'cepcep'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      OnValidate = cdsTblcepcepcepValidate
      EditMask = '#####-###;1;_'
      Size = 9
    end
    object cdsTblcepcepmunicipio: TStringField
      FieldName = 'cepmunicipio'
      Required = True
      OnValidate = cdsTblcepcepmunicipioValidate
      Size = 60
    end
    object cdsTblcepcepeuf: TStringField
      FieldName = 'cepeuf'
      Required = True
      OnValidate = cdsTblcepcepeufValidate
      Size = 2
    end
  end
end
