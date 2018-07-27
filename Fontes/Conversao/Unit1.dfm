object Form1: TForm1
  Left = 221
  Top = 98
  Caption = 'Form1'
  ClientHeight = 481
  ClientWidth = 1046
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 558
    Top = 359
    Width = 6
    Height = 13
    Caption = '0'
  end
  object Button1: TButton
    Left = 40
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Carregar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object chkUsuario: TCheckBox
    Left = 280
    Top = 8
    Width = 121
    Height = 17
    Caption = 'Usuarios -> Tblusu'
    TabOrder = 1
  end
  object chkVendedor: TCheckBox
    Left = 280
    Top = 54
    Width = 121
    Height = 17
    Caption = 'Vendedor -> Tblven'
    Checked = True
    State = cbChecked
    TabOrder = 2
  end
  object chkGrupoVen: TCheckBox
    Left = 280
    Top = 31
    Width = 161
    Height = 17
    Caption = 'GrupoVendedor -> Tblgrv'
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object Button2: TButton
    Left = 40
    Top = 73
    Width = 75
    Height = 25
    Caption = 'Delete tudo'
    TabOrder = 4
    OnClick = Button2Click
  end
  object chkCobrador: TCheckBox
    Left = 280
    Top = 77
    Width = 121
    Height = 17
    Caption = 'Cobrador -> Tblcob'
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object chkZona: TCheckBox
    Left = 280
    Top = 100
    Width = 121
    Height = 17
    Caption = 'Zona -> Tblzon'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object chkRuaZona: TCheckBox
    Left = 447
    Top = 8
    Width = 121
    Height = 17
    Caption = 'RuaZona -> Tblrdz'
    Checked = True
    State = cbChecked
    TabOrder = 7
  end
  object chkMunicipio: TCheckBox
    Left = 447
    Top = 31
    Width = 121
    Height = 17
    Caption = 'Municipio -> Tblcep'
    Checked = True
    State = cbChecked
    TabOrder = 8
  end
  object chkAssinante: TCheckBox
    Left = 447
    Top = 54
    Width = 121
    Height = 17
    Caption = 'Assinante -> Tblass'
    Checked = True
    State = cbChecked
    TabOrder = 9
  end
  object chkAssinatura: TCheckBox
    Left = 447
    Top = 77
    Width = 121
    Height = 17
    Caption = 'Assinatura -> Tblada'
    Checked = True
    State = cbChecked
    TabOrder = 10
  end
  object chkBaixa: TCheckBox
    Left = 447
    Top = 100
    Width = 121
    Height = 17
    Caption = 'Baixa -> Tblbda'
    Checked = True
    State = cbChecked
    TabOrder = 11
  end
  object edtSenha: TLabeledEdit
    Left = 608
    Top = 29
    Width = 209
    Height = 21
    EditLabel.Width = 34
    EditLabel.Height = 13
    EditLabel.Caption = 'Senha:'
    TabOrder = 12
    Text = 'root'
  end
  object edtHost: TLabeledEdit
    Left = 608
    Top = 75
    Width = 209
    Height = 21
    EditLabel.Width = 22
    EditLabel.Height = 13
    EditLabel.Caption = 'Host'
    TabOrder = 13
    Text = 'localhost'
  end
  object Button3: TButton
    Left = 558
    Top = 320
    Width = 163
    Height = 33
    Caption = 'Ajustar N'#250'mero das Parcelas'
    TabOrder = 14
    OnClick = Button3Click
  end
  object SQLConnAssinates: TSQLConnection
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver160.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=16.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver160.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=16.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=192.168.1.4'
      'Database=assinantes'
      'User_Name=root'
      'Password=root'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    BeforeConnect = SQLConnAssinatesBeforeConnect
    Left = 190
    Top = 64
  end
  object SQLConnSemanario: TSQLConnection
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXMySQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver160.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=16.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMySqlMetaDataCommandFactory,DbxMySQLDr' +
        'iver160.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMySqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMySQLDriver,Version=16.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMYSQL'
      'LibraryName=dbxmys.dll'
      'LibraryNameOsx=libsqlmys.dylib'
      'VendorLib=LIBMYSQL.dll'
      'VendorLibWin64=libmysql.dll'
      'VendorLibOsx=libmysqlclient.dylib'
      'HostName=localhost'
      'Database=semanario'
      'User_Name=root'
      'Password=root'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'BlobSize=-1'
      'ErrorResourceFile=')
    BeforeConnect = SQLConnSemanarioBeforeConnect
    Left = 188
    Top = 8
  end
  object sqlUsuario: TSQLDataSet
    CommandText = 'select * from usuario'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnAssinates
    Left = 32
    Top = 144
  end
  object dspUsuario: TDataSetProvider
    DataSet = sqlUsuario
    OnUpdateError = dspUsuarioUpdateError
    Left = 32
    Top = 192
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuario'
    Left = 32
    Top = 240
    object cdsUsuarioid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsUsuariologin: TStringField
      FieldName = 'login'
      Required = True
      Size = 15
    end
    object cdsUsuariosenha: TStringField
      FieldName = 'senha'
      Required = True
      Size = 128
    end
    object cdsUsuariodescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object cdsUsuarioativo: TShortintField
      FieldName = 'ativo'
      Required = True
    end
    object cdsUsuarioidPerfil: TIntegerField
      FieldName = 'idPerfil'
      Required = True
    end
  end
  object sqlTblusu: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select * from tblusu'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnSemanario
    Left = 32
    Top = 320
  end
  object dspTblusu: TDataSetProvider
    DataSet = sqlTblusu
    OnUpdateError = dspUsuarioUpdateError
    Left = 32
    Top = 368
  end
  object cdsTblusu: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblusu'
    Left = 32
    Top = 416
    object cdsTblusuusucod: TIntegerField
      FieldName = 'usucod'
      Required = True
    end
    object cdsTblusuusulogin: TStringField
      FieldName = 'usulogin'
      Required = True
      Size = 15
    end
    object cdsTblusuususenha: TStringField
      FieldName = 'ususenha'
      Required = True
      Size = 45
    end
    object cdsTblusuusunome: TStringField
      FieldName = 'usunome'
      Required = True
      Size = 60
    end
    object cdsTblusuusuativo: TShortintField
      FieldName = 'usuativo'
      Required = True
    end
  end
  object sqlVendedor: TSQLDataSet
    CommandText = 'select * from vendedor'#13#10'where id <> -1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnAssinates
    Left = 184
    Top = 144
  end
  object dspVendedor: TDataSetProvider
    DataSet = sqlVendedor
    OnUpdateError = dspUsuarioUpdateError
    Left = 184
    Top = 192
  end
  object cdsVendedor: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendedor'
    Left = 184
    Top = 240
    object cdsVendedorid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsVendedordescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 60
    end
    object cdsVendedoridGrupoVendedor: TIntegerField
      FieldName = 'idGrupoVendedor'
      Required = True
    end
    object cdsVendedorfoneContato: TStringField
      FieldName = 'foneContato'
      Size = 13
    end
    object cdsVendedorloginAlt: TStringField
      FieldName = 'loginAlt'
      Size = 15
    end
    object cdsVendedordataAlt: TSQLTimeStampField
      FieldName = 'dataAlt'
    end
  end
  object sqlTblven: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select * from tblven'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnSemanario
    Left = 184
    Top = 320
  end
  object dspTblven: TDataSetProvider
    DataSet = sqlTblven
    OnUpdateError = dspUsuarioUpdateError
    Left = 184
    Top = 368
  end
  object cdsTblven: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblven'
    Left = 184
    Top = 416
    object cdsTblvenvencod: TIntegerField
      FieldName = 'vencod'
      Required = True
    end
    object cdsTblvenvennome: TStringField
      FieldName = 'vennome'
      Required = True
      Size = 60
    end
    object cdsTblvengdvcod: TIntegerField
      FieldName = 'gdvcod'
      Required = True
    end
    object cdsTblvenvenfone: TStringField
      FieldName = 'venfone'
      Size = 15
    end
  end
  object sqlGrupoVen: TSQLDataSet
    CommandText = 'select * from grupovendedor'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnAssinates
    Left = 112
    Top = 144
  end
  object dspGrupoVen: TDataSetProvider
    DataSet = sqlGrupoVen
    OnUpdateError = dspUsuarioUpdateError
    Left = 112
    Top = 192
  end
  object cdsGrupoVen: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspGrupoVen'
    Left = 112
    Top = 240
    object cdsGrupoVenid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsGrupoVendescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 60
    end
    object cdsGrupoVenloginAlt: TStringField
      FieldName = 'loginAlt'
      Size = 15
    end
    object cdsGrupoVendataAlt: TSQLTimeStampField
      FieldName = 'dataAlt'
    end
  end
  object sqlTblgrv: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select * from tblgdv'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnSemanario
    Left = 104
    Top = 320
  end
  object dspTblgrv: TDataSetProvider
    DataSet = sqlTblgrv
    OnUpdateError = dspUsuarioUpdateError
    Left = 104
    Top = 368
  end
  object cdsTblgrv: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblgrv'
    Left = 104
    Top = 416
    object cdsTblgrvgdvcod: TIntegerField
      FieldName = 'gdvcod'
      Required = True
    end
    object cdsTblgrvgdvdescr: TStringField
      FieldName = 'gdvdescr'
      Required = True
      Size = 60
    end
  end
  object sqlCobrador: TSQLDataSet
    CommandText = 'select * from cobrador'#13#10'where id <> -1'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnAssinates
    Left = 256
    Top = 144
  end
  object dspCobrador: TDataSetProvider
    DataSet = sqlCobrador
    OnUpdateError = dspUsuarioUpdateError
    Left = 256
    Top = 192
  end
  object cdsCobrador: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCobrador'
    Left = 256
    Top = 240
    object cdsCobradorid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsCobradordescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 60
    end
    object cdsCobradorloginAlt: TStringField
      FieldName = 'loginAlt'
      Size = 15
    end
    object cdsCobradordataAlt: TSQLTimeStampField
      FieldName = 'dataAlt'
    end
  end
  object sqlTblcob: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select * from tblcob'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnSemanario
    Left = 256
    Top = 320
  end
  object dspTblcob: TDataSetProvider
    DataSet = sqlTblcob
    OnUpdateError = dspUsuarioUpdateError
    Left = 256
    Top = 368
  end
  object cdsTblcob: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblcob'
    Left = 256
    Top = 416
    object cdsTblcobcobcod: TIntegerField
      FieldName = 'cobcod'
      Required = True
    end
    object cdsTblcobcobnome: TStringField
      FieldName = 'cobnome'
      Required = True
      Size = 60
    end
  end
  object sqlZona: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select * from zona'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnAssinates
    Left = 328
    Top = 144
  end
  object dspZona: TDataSetProvider
    DataSet = sqlZona
    OnUpdateError = dspUsuarioUpdateError
    Left = 328
    Top = 192
  end
  object cdsZona: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspZona'
    Left = 328
    Top = 240
    object cdsZonaid: TStringField
      FieldName = 'id'
      Required = True
      Size = 3
    end
    object cdsZonadescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 60
    end
    object cdsZonaentregador: TStringField
      FieldName = 'entregador'
      Size = 60
    end
    object cdsZonaloginAlt: TStringField
      FieldName = 'loginAlt'
      Size = 15
    end
    object cdsZonadataAlt: TSQLTimeStampField
      FieldName = 'dataAlt'
    end
  end
  object sqlTblzon: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select * from tblzon'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnSemanario
    Left = 328
    Top = 320
  end
  object dspTblzon: TDataSetProvider
    DataSet = sqlTblzon
    OnUpdateError = dspUsuarioUpdateError
    Left = 328
    Top = 368
  end
  object cdsTblzon: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblzon'
    Left = 328
    Top = 416
    object cdsTblzonzoncod: TStringField
      FieldName = 'zoncod'
      Required = True
      Size = 3
    end
    object cdsTblzonzondescr: TStringField
      FieldName = 'zondescr'
      Required = True
      Size = 60
    end
    object cdsTblzonzonentregador: TStringField
      FieldName = 'zonentregador'
      Size = 60
    end
  end
  object sqlRuazona: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select * from ruazona'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnAssinates
    Left = 392
    Top = 144
  end
  object dspRuazona: TDataSetProvider
    DataSet = sqlRuazona
    OnUpdateError = dspUsuarioUpdateError
    Left = 392
    Top = 192
  end
  object cdsRuazona: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRuazona'
    Left = 392
    Top = 240
    object cdsRuazonaid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsRuazonaidZona: TStringField
      FieldName = 'idZona'
      Required = True
      Size = 3
    end
    object cdsRuazonadescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 60
    end
    object cdsRuazonaloginAlt: TStringField
      FieldName = 'loginAlt'
      Size = 15
    end
    object cdsRuazonadataAlt: TSQLTimeStampField
      FieldName = 'dataAlt'
    end
  end
  object sqlTblrdz: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select * from tblrdz'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnSemanario
    Left = 392
    Top = 320
  end
  object dspTblrdz: TDataSetProvider
    DataSet = sqlTblrdz
    OnUpdateError = dspUsuarioUpdateError
    Left = 392
    Top = 368
  end
  object cdsTblrdz: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblrdz'
    Left = 392
    Top = 416
    object cdsTblrdzrdzcod: TIntegerField
      FieldName = 'rdzcod'
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
      Size = 60
    end
  end
  object sqlMunicipio: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select * from municipio'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnAssinates
    Left = 472
    Top = 144
  end
  object dspMunicipio: TDataSetProvider
    DataSet = sqlMunicipio
    OnUpdateError = dspUsuarioUpdateError
    Left = 472
    Top = 192
  end
  object cdsMunicipio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMunicipio'
    Left = 472
    Top = 240
    object cdsMunicipioid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsMunicipiodescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 60
    end
    object cdsMunicipiouf: TStringField
      FieldName = 'uf'
      Required = True
      Size = 2
    end
    object cdsMunicipiocep: TStringField
      FieldName = 'cep'
      Size = 9
    end
    object cdsMunicipiologinAlt: TStringField
      FieldName = 'loginAlt'
      Size = 15
    end
    object cdsMunicipiodataAlt: TSQLTimeStampField
      FieldName = 'dataAlt'
    end
  end
  object sqltblcep: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select * from tblcep'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnSemanario
    Left = 472
    Top = 320
  end
  object dspTblcep: TDataSetProvider
    DataSet = sqltblcep
    OnUpdateError = dspUsuarioUpdateError
    Left = 472
    Top = 368
  end
  object cdsTblcep: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTblcep'
    Left = 472
    Top = 416
    object cdsTblcepcepcep: TStringField
      FieldName = 'cepcep'
      Required = True
      Size = 9
    end
    object cdsTblcepcepmunicipio: TStringField
      FieldName = 'cepmunicipio'
      Required = True
      Size = 60
    end
    object cdsTblcepcepeuf: TStringField
      FieldName = 'cepeuf'
      Required = True
      Size = 2
    end
  end
  object sqlAssinante: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select * from assinante'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnAssinates
    Left = 544
    Top = 144
  end
  object dspAssinante: TDataSetProvider
    DataSet = sqlAssinante
    OnUpdateError = dspUsuarioUpdateError
    Left = 544
    Top = 192
  end
  object cdsAssinante: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAssinante'
    Left = 544
    Top = 240
    object cdsAssinanteid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsAssinantedescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 60
    end
    object cdsAssinanteidZona: TStringField
      FieldName = 'idZona'
      Required = True
      Size = 3
    end
    object cdsAssinanteidRuaZona: TIntegerField
      FieldName = 'idRuaZona'
      Required = True
    end
    object cdsAssinantenumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object cdsAssinantebairro: TStringField
      FieldName = 'bairro'
      Size = 60
    end
    object cdsAssinantecomplemento: TStringField
      FieldName = 'complemento'
      Size = 60
    end
    object cdsAssinantedataNascimento: TSQLTimeStampField
      FieldName = 'dataNascimento'
    end
    object cdsAssinanteidMunicipio: TIntegerField
      FieldName = 'idMunicipio'
      Required = True
    end
    object cdsAssinanteenderecoCobranca: TStringField
      FieldName = 'enderecoCobranca'
      Size = 60
    end
    object cdsAssinantefoneComercial: TStringField
      FieldName = 'foneComercial'
    end
    object cdsAssinantefoneResidencial: TStringField
      FieldName = 'foneResidencial'
      Size = 13
    end
    object cdsAssinantefoneFax: TStringField
      FieldName = 'foneFax'
      Size = 13
    end
    object cdsAssinantefoneCelular: TStringField
      FieldName = 'foneCelular'
      Size = 13
    end
    object cdsAssinanteemail: TStringField
      FieldName = 'email'
      Size = 60
    end
    object cdsAssinanteidVendedor: TIntegerField
      FieldName = 'idVendedor'
      Required = True
    end
    object cdsAssinanteidCobrador: TIntegerField
      FieldName = 'idCobrador'
      Required = True
    end
    object cdsAssinanteinativo: TShortintField
      FieldName = 'inativo'
      Required = True
    end
    object cdsAssinantedataInativo: TSQLTimeStampField
      FieldName = 'dataInativo'
    end
    object cdsAssinanteimprimeEtiqueta: TStringField
      FieldName = 'imprimeEtiqueta'
      Required = True
      Size = 1
    end
    object cdsAssinanteobs: TStringField
      FieldName = 'obs'
      Size = 100
    end
    object cdsAssinanterazaoSocial: TStringField
      FieldName = 'razaoSocial'
      Size = 60
    end
    object cdsAssinantecpf: TStringField
      FieldName = 'cpf'
      Size = 14
    end
    object cdsAssinantecnpj: TStringField
      FieldName = 'cnpj'
      Size = 18
    end
    object cdsAssinanteloginAlt: TStringField
      FieldName = 'loginAlt'
      Size = 15
    end
    object cdsAssinantedataAlt: TSQLTimeStampField
      FieldName = 'dataAlt'
    end
  end
  object sqlBuscaCep: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select *'#13#10'from municipio'#13#10'where id = :id'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnAssinates
    Left = 840
    Top = 16
    object sqlBuscaCepid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object sqlBuscaCepdescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 60
    end
    object sqlBuscaCepuf: TStringField
      FieldName = 'uf'
      Required = True
      Size = 2
    end
    object sqlBuscaCepcep: TStringField
      FieldName = 'cep'
      Size = 9
    end
    object sqlBuscaCeploginAlt: TStringField
      FieldName = 'loginAlt'
      Size = 15
    end
    object sqlBuscaCepdataAlt: TSQLTimeStampField
      FieldName = 'dataAlt'
    end
  end
  object sqlAssinatura: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select * from assinatura'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnAssinates
    Left = 624
    Top = 144
  end
  object dspAssinatura: TDataSetProvider
    DataSet = sqlAssinatura
    OnUpdateError = dspUsuarioUpdateError
    Left = 624
    Top = 192
  end
  object cdsAssinatura: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspAssinatura'
    Left = 624
    Top = 240
    object cdsAssinaturaid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsAssinaturaidAssinante: TIntegerField
      FieldName = 'idAssinante'
      Required = True
    end
    object cdsAssinaturanumero: TIntegerField
      FieldName = 'numero'
      Required = True
    end
    object cdsAssinaturatipo: TStringField
      FieldName = 'tipo'
      Required = True
      Size = 1
    end
    object cdsAssinaturadata: TSQLTimeStampField
      FieldName = 'data'
      Required = True
    end
    object cdsAssinaturadataVencimento: TSQLTimeStampField
      FieldName = 'dataVencimento'
      Required = True
    end
    object cdsAssinaturavalor: TFloatField
      FieldName = 'valor'
      Required = True
    end
    object cdsAssinaturavalorPendente: TFloatField
      FieldName = 'valorPendente'
      Required = True
    end
    object cdsAssinaturaobs: TStringField
      FieldName = 'obs'
      Size = 100
    end
    object cdsAssinaturacancelada: TStringField
      FieldName = 'cancelada'
      Required = True
      Size = 1
    end
    object cdsAssinaturaloginAlt: TStringField
      FieldName = 'loginAlt'
      Size = 15
    end
    object cdsAssinaturadataAlt: TSQLTimeStampField
      FieldName = 'dataAlt'
    end
  end
  object sqlBaixa: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select * from baixa'#13#10'order by idAssinante, numeroAssinatura, dat' +
      'a'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnAssinates
    Left = 704
    Top = 144
  end
  object dspBaixa: TDataSetProvider
    DataSet = sqlBaixa
    OnUpdateError = dspUsuarioUpdateError
    Left = 704
    Top = 192
  end
  object cdsBaixa: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspBaixa'
    Left = 704
    Top = 240
    object cdsBaixaid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsBaixaidAssinante: TIntegerField
      FieldName = 'idAssinante'
      Required = True
    end
    object cdsBaixanumeroAssinatura: TIntegerField
      FieldName = 'numeroAssinatura'
      Required = True
    end
    object cdsBaixatipoAssinatura: TStringField
      FieldName = 'tipoAssinatura'
      Required = True
      Size = 1
    end
    object cdsBaixadata: TSQLTimeStampField
      FieldName = 'data'
      Required = True
    end
    object cdsBaixavalor: TFloatField
      FieldName = 'valor'
      Required = True
    end
    object cdsBaixaloginAlt: TStringField
      FieldName = 'loginAlt'
      Size = 15
    end
    object cdsBaixadataAlt: TSQLTimeStampField
      FieldName = 'dataAlt'
    end
  end
  object sqlBuscaUsu: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select * from usuario where login = :login'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'login'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnAssinates
    Left = 840
    Top = 72
    object sqlBuscaUsuid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object sqlBuscaUsulogin: TStringField
      FieldName = 'login'
      Required = True
      Size = 15
    end
    object sqlBuscaUsusenha: TStringField
      FieldName = 'senha'
      Required = True
      Size = 128
    end
    object sqlBuscaUsudescricao: TStringField
      FieldName = 'descricao'
      Required = True
      Size = 100
    end
    object sqlBuscaUsuativo: TShortintField
      FieldName = 'ativo'
      Required = True
    end
    object sqlBuscaUsuidPerfil: TIntegerField
      FieldName = 'idPerfil'
      Required = True
    end
  end
  object sqlRuaNaoEncontrada: TSQLDataSet
    SchemaName = 'root'
    CommandText = 
      'select * from tblrdz'#13#10'where rdzender = '#39'RUA NAO ENCONTRADA'#39#13#10'and' +
      ' zoncod = :zoncod'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftString
        Name = 'zoncod'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnSemanario
    Left = 824
    Top = 144
    object sqlRuaNaoEncontradardzcod: TIntegerField
      FieldName = 'rdzcod'
      Required = True
    end
    object sqlRuaNaoEncontradazoncod: TStringField
      FieldName = 'zoncod'
      Required = True
      Size = 3
    end
    object sqlRuaNaoEncontradardzender: TStringField
      FieldName = 'rdzender'
      Required = True
      Size = 60
    end
  end
  object sqlMaxRdzcod: TSQLDataSet
    SchemaName = 'root'
    CommandText = 'select max(rdzcod) as rdzcod'#13#10'from tblrdz'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnSemanario
    Left = 824
    Top = 192
    object sqlMaxRdzcodrdzcod: TIntegerField
      FieldName = 'rdzcod'
    end
  end
  object sqlUltBaixa: TSQLDataSet
    CommandText = 
      'select data'#13#10'from baixa'#13#10'where idAssinante = :idAssinante'#13#10'and n' +
      'umeroAssinatura = :numeroAssinatura'#13#10'order by data desc'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'idAssinante'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'numeroAssinatura'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnAssinates
    Left = 824
    Top = 240
    object sqlUltBaixadata: TSQLTimeStampField
      FieldName = 'data'
      Required = True
    end
  end
  object sqlSelTodasParcelas: TSQLDataSet
    CommandText = 'select distinct asscod, adacod'#13#10'from tblcpa'#13#10'order by asscod'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnSemanario
    Left = 808
    Top = 320
    object sqlSelTodasParcelasasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object sqlSelTodasParcelasadacod: TIntegerField
      FieldName = 'adacod'
      Required = True
    end
  end
  object sqlSelTblcpa: TSQLDataSet
    CommandText = 
      'select asscod, adacod, cpadtvenc'#13#10'from tblcpa'#13#10'where asscod = :a' +
      'sscod'#13#10'and adacod = :adacod'#13#10'order by cpadtvenc'
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
    SQLConnection = SQLConnSemanario
    Left = 904
    Top = 320
    object sqlSelTblcpaasscod: TIntegerField
      FieldName = 'asscod'
      Required = True
    end
    object sqlSelTblcpaadacod: TIntegerField
      FieldName = 'adacod'
      Required = True
    end
    object sqlSelTblcpacpadtvenc: TDateField
      FieldName = 'cpadtvenc'
      Required = True
    end
  end
  object sqlUpdTblcpa: TSQLDataSet
    CommandText = 
      'update tblcpa set cpanroparc = :cpanroparc'#13#10'where asscod = :assc' +
      'od'#13#10'and adacod = :adacod'#13#10'and cpadtvenc = :cpadtvenc'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'cpanroparc'
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
        DataType = ftDate
        Name = 'cpadtvenc'
        ParamType = ptInput
      end>
    SQLConnection = SQLConnSemanario
    Left = 976
    Top = 320
  end
end
