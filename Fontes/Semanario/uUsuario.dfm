object dmUsuario: TdmUsuario
  OldCreateOrder = False
  Left = 421
  Top = 152
  Height = 448
  Width = 651
  object sqlUsuario: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select *'#13#10'from tblusu'#13#10'where usulogin = :usulogin'#13#10'and ususenha ' +
      '= :ususenha'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'usulogin'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ususenha'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 32
    Top = 24
  end
  object sqlTblusu: TSQLDataSet
    CommandText = 'select * from tblusu'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 264
    Top = 24
  end
  object dspTblusu: TDataSetProvider
    DataSet = sqlTblusu
    Options = [poCascadeDeletes, poCascadeUpdates, poUseQuoteChar]
    OnUpdateError = dspMenuUpdateError
    Left = 264
    Top = 80
  end
  object cdsTblusu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblusu'
    BeforeOpen = cdsTblusuBeforeOpen
    AfterScroll = cdsTblusuAfterScroll
    OnCalcFields = cdsTblusuCalcFields
    OnNewRecord = cdsTblusuNewRecord
    Left = 264
    Top = 136
    object cdsTblusuusucod: TIntegerField
      FieldName = 'usucod'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsTblusuusulogin: TStringField
      FieldName = 'usulogin'
      Required = True
      OnValidate = cdsTblusuusuloginValidate
      Size = 15
    end
    object cdsTblusuususenha: TStringField
      FieldName = 'ususenha'
      Required = True
      OnValidate = cdsTblusuususenhaValidate
      Size = 32
    end
    object cdsTblusuusunome: TStringField
      FieldName = 'usunome'
      Required = True
      OnValidate = cdsTblusuusunomeValidate
      Size = 60
    end
    object cdsTblusuusuativo: TShortintField
      FieldName = 'usuativo'
      Required = True
    end
    object cdsTblusuCalcDescrUsuativo: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'CalcDescrUsuativo'
      Size = 5
    end
    object cdsTblusuCalcSenha: TStringField
      DisplayWidth = 32
      FieldKind = fkInternalCalc
      FieldName = 'CalcSenha'
      Size = 32
    end
    object cdsTblusuCalcSenhaRepetir: TStringField
      DisplayWidth = 32
      FieldKind = fkInternalCalc
      FieldName = 'CalcSenhaRepetir'
      Size = 32
    end
  end
  object sqlTblads: TSQLDataSet
    CommandText = 
      'select adscod, adscodpai, adsordem, adsdescr, adstipo'#13#10'from tbla' +
      'ds'#13#10'order by adsordem'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 552
    Top = 24
  end
  object dspTblads: TDataSetProvider
    DataSet = sqlTblads
    OnUpdateError = dspMenuUpdateError
    Left = 552
    Top = 80
  end
  object cdsTblads: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblads'
    Left = 552
    Top = 136
    object cdsTbladsadscod: TIntegerField
      FieldName = 'adscod'
      Required = True
    end
    object cdsTbladsadscodpai: TIntegerField
      FieldName = 'adscodpai'
    end
    object cdsTbladsadsordem: TIntegerField
      FieldName = 'adsordem'
      Required = True
    end
    object cdsTbladsadsdescr: TStringField
      FieldName = 'adsdescr'
      Required = True
      Size = 50
    end
    object cdsTbladsadstipo: TIntegerField
      FieldName = 'adstipo'
      Required = True
    end
  end
  object cdsTreeView: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 552
    Top = 192
    object cdsTreeViewadscod: TIntegerField
      FieldName = 'adscod'
    end
    object cdsTreeViewadstipo: TIntegerField
      FieldName = 'adstipo'
    end
    object cdsTreeViewadsdescr: TStringField
      FieldName = 'adsdescr'
      Size = 50
    end
    object cdsTreeViewmarcado: TStringField
      FieldName = 'marcado'
      Size = 1
    end
    object cdsTreeViewposicao: TIntegerField
      FieldName = 'posicao'
    end
  end
  object sqlTblpdu: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select *'#13#10'from tblpdu'#13#10'where usucod = :usucod'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'usucod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 328
    Top = 24
  end
  object cdsTblpdu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblpdu'
    Left = 328
    Top = 136
    object cdsTblpduusucod: TIntegerField
      FieldName = 'usucod'
      Required = True
    end
    object cdsTblpduadscod: TIntegerField
      FieldName = 'adscod'
      Required = True
    end
  end
  object sqlNovoUsucod: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select COALESCE(max(usucod),0) + 1 as usucod'#13#10'from tblusu'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmConexao.SQLConnection
    Left = 384
    Top = 352
    object sqlNovoUsucodusucod: TLargeintField
      FieldName = 'usucod'
    end
  end
  object dspUsuario: TDataSetProvider
    DataSet = sqlUsuario
    OnUpdateError = dspMenuUpdateError
    Left = 32
    Top = 80
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuario'
    Left = 32
    Top = 136
    object cdsUsuariousucod: TIntegerField
      FieldName = 'usucod'
      Required = True
    end
    object cdsUsuariousulogin: TStringField
      FieldName = 'usulogin'
      Required = True
      Size = 15
    end
    object cdsUsuarioususenha: TStringField
      FieldName = 'ususenha'
      Required = True
      Size = 32
    end
    object cdsUsuariousunome: TStringField
      FieldName = 'usunome'
      Required = True
      Size = 60
    end
    object cdsUsuariousuativo: TShortintField
      FieldName = 'usuativo'
      Required = True
    end
  end
  object sqlVerificaPermiss: TSQLDataSet
    CommandText = 
      'select count(*) as qtdepermiss'#13#10'from tblpdu'#13#10'where usucod = :usu' +
      'cod'#13#10'and adscod = :adscod'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'usucod'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'adscod'
        ParamType = ptInput
      end>
    SQLConnection = dmConexao.SQLConnection
    Left = 480
    Top = 352
    object sqlVerificaPermissqtdepermiss: TLargeintField
      FieldName = 'qtdepermiss'
      Required = True
    end
  end
  object dspTblpdu: TDataSetProvider
    DataSet = sqlTblpdu
    OnUpdateError = dspTblpduUpdateError
    Left = 328
    Top = 80
  end
end
