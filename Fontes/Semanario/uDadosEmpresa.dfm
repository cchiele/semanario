object dmDadosEmpresa: TdmDadosEmpresa
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 354
  Width = 525
  object sqlTblemp: TSQLDataSet
    CommandText = 'select *'#13#10'from tblemp'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 176
    Top = 16
  end
  object dspTblemp: TDataSetProvider
    DataSet = sqlTblemp
    UpdateMode = upWhereKeyOnly
    OnUpdateError = dspTblempUpdateError
    Left = 176
    Top = 72
  end
  object cdsTblemp: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblemp'
    AfterOpen = cdsTblempAfterOpen
    BeforePost = cdsTblempBeforePost
    Left = 176
    Top = 128
    object cdsTblempempcnpj: TStringField
      FieldName = 'empcnpj'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      OnValidate = cdsTblempempcnpjValidate
      EditMask = '99.999.999\/9999-99;1;_'
      Size = 18
    end
    object cdsTblempemprazaosocial: TStringField
      FieldName = 'emprazaosocial'
      Required = True
      OnValidate = cdsTblempemprazaosocialValidate
      Size = 50
    end
    object cdsTblempempie: TStringField
      FieldName = 'empie'
      Required = True
      OnValidate = cdsTblempempieValidate
      Size = 15
    end
    object cdsTblempempender: TStringField
      FieldName = 'empender'
      Required = True
      OnValidate = cdsTblempempenderValidate
      Size = 50
    end
    object cdsTblempempnro: TStringField
      FieldName = 'empnro'
      Required = True
      OnValidate = cdsTblempempnroValidate
      Size = 5
    end
    object cdsTblempempcompl: TStringField
      FieldName = 'empcompl'
      Size = 35
    end
    object cdsTblempempbairro: TStringField
      FieldName = 'empbairro'
      Size = 30
    end
    object cdsTblempcepcep: TStringField
      FieldName = 'cepcep'
      Required = True
      OnValidate = cdsTblempcepcepValidate
      EditMask = '99999\-999;1;_'
      Size = 9
    end
    object cdsTblempempfone: TStringField
      FieldName = 'empfone'
      EditMask = '\(99\)999999999;1;_'
      Size = 15
    end
  end
  object sqlTblcep: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select cepcep, cepmunicipio, cepeuf'#13#10'from tblcep'#13#10'where cepcep =' +
      ' :cepcep'
    DataSource = dsTblcep
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'cepcep'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 328
    Top = 128
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
  object dsTblcep: TDataSource
    DataSet = cdsTblemp
    Left = 256
    Top = 128
  end
end
