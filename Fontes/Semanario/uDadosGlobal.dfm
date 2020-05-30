object dmDadosGlobal: TdmDadosGlobal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 394
  Width = 564
  object cdsUf: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 16
    object cdsUfuf: TStringField
      FieldName = 'uf'
      Size = 2
    end
    object cdsUfufdescr: TStringField
      FieldName = 'ufdescr'
      Size = 30
    end
  end
  object dsUf: TDataSource
    DataSet = cdsUf
    Left = 120
    Top = 72
  end
  object cdsStatusAssinante: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 16
    object cdsStatusAssinanteCodigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsStatusAssinanteDescr: TStringField
      FieldName = 'Descr'
      Size = 15
    end
  end
  object sqlTblsen: TSQLDataSet
    CommandText = 'select *'#13#10'from tblsen'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 32
    Top = 72
    object sqlTblsensensenha: TStringField
      FieldName = 'sensenha'
      Required = True
    end
  end
  object cdsLookupSimNao: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 16
    object cdsLookupSimNaoCodigo: TStringField
      FieldName = 'Codigo'
      Size = 1
    end
    object cdsLookupSimNaoDescr: TStringField
      FieldName = 'Descr'
      Size = 3
    end
  end
  object cdsStatusAssinante2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 328
    Top = 16
    object cdsStatusAssinante2Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object cdsStatusAssinante2Descr: TStringField
      FieldName = 'Descr'
      Size = 15
    end
  end
  object sqlDataHoraBanco: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select now() as datahora'#13#10'from tblemp'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 32
    Top = 144
    object sqlDataHoraBancodatahora: TSQLTimeStampField
      FieldName = 'datahora'
    end
  end
  object cdsLookupSimNao2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 440
    Top = 72
    object cdsLookupSimNao2Codigo: TStringField
      FieldName = 'Codigo'
      Size = 1
    end
    object cdsLookupSimNao2Descr: TStringField
      FieldName = 'Descr'
      Size = 3
    end
  end
end
