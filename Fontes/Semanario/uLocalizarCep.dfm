object frmLocalizarCep: TfrmLocalizarCep
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Localizar CEP pelo Endere'#231'o'
  ClientHeight = 377
  ClientWidth = 748
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox2: TGroupBox
    Left = 0
    Top = 81
    Width = 748
    Height = 255
    Align = alClient
    Caption = 'CEP Encontrados'
    Padding.Left = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 1
    object DBGridCeps: TDBGrid
      Left = 7
      Top = 15
      Width = 734
      Height = 233
      Align = alClient
      DataSource = dsResultado
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGridCepsDblClick
      OnEnter = DBGridCepsEnter
      OnExit = DBGridCepsExit
      OnKeyPress = DBGridCepsKeyPress
      Columns = <
        item
          Expanded = False
          FieldName = 'cep'
          Title.Caption = 'CEP'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'logradouro'
          Title.Caption = 'Endere'#231'o'
          Width = 270
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'complemento'
          Title.Caption = 'Complemento'
          Width = 243
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'bairro'
          Title.Caption = 'Bairro'
          Width = 232
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'localidade'
          Title.Caption = 'Cidade'
          Width = 246
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'uf'
          Title.Caption = 'Estado'
          Width = 52
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 336
    Width = 748
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnCancelar: TJvImgBtn
      Left = 664
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancelar'
      ImageIndex = 8
      Images = frmPrincipal.ImageList16
      ModalResult = 2
      TabOrder = 0
      Kind = bkCancel
    end
    object btnSelecionar: TJvImgBtn
      Left = 543
      Top = 8
      Width = 115
      Height = 25
      Caption = 'Selecionar CEP'
      Default = True
      Enabled = False
      ImageIndex = 9
      Images = frmPrincipal.ImageList16
      ModalResult = 1
      TabOrder = 1
      Kind = bkOK
    end
    object LinkLabel1: TLinkLabel
      Left = 7
      Top = 16
      Width = 119
      Height = 19
      Caption = 'https://viacep.com.br'
      TabOrder = 2
      UseVisualStyle = True
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 748
    Height = 81
    Align = alTop
    Caption = 'Pesquisar CEP'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 25
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object DBLCBUf: TDBLookupComboBox
      Left = 16
      Top = 40
      Width = 65
      Height = 21
      KeyField = 'uf'
      ListField = 'uf'
      ListSource = dmDadosGlobal.dsUf
      TabOrder = 0
    end
    object edtCidade: TLabeledEdit
      Left = 96
      Top = 40
      Width = 177
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Cidade'
      TabOrder = 1
    end
    object edtEndereco: TLabeledEdit
      Left = 288
      Top = 40
      Width = 345
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 45
      EditLabel.Height = 13
      EditLabel.Caption = 'Endere'#231'o'
      TabOrder = 2
    end
    object btnPesquisarCep: TJvImgBtn
      Left = 656
      Top = 38
      Width = 83
      Height = 25
      Caption = 'Pesquisar'
      ImageIndex = 3
      Images = frmPrincipal.ImageList16
      TabOrder = 3
      OnClick = btnPesquisarCepClick
    end
    object ScreenTipsPopup1: TScreenTipsPopup
      Left = 337
      Top = 24
      Width = 14
      Height = 14
      Associate = edtEndereco
      Glyph.Data = {
        07544269746D61709E020000424D9E0200000000000036000000280000000E00
        00000E000000010018000000000068020000C40E0000C40E0000000000000000
        0000FF0099FF0099FF0099B8B8B8DADADABDAFAAC7ACA2C9AEA3C1B3ADE7E7E7
        CFCFCFFF0099FF0099FF00990000FF0099FF0099C7C7C7BDA49BA65336B85029
        BC532AC1572BC55A2CB86039CBB0A4D9D9D9FF0099FF00990000FF0099C7C7C7
        9D6B5CAE4927B24C28BC6241DCBCAFDDAF9CC2582BC5592CC4592BB37E68D9D9
        D9FF00990000C7C7C7B9A099A84426AC4727B14B28C18E7CCFCFCFE3E3E3BF55
        2AC0562BC0562BBE552AC8AEA4CFCFCF0000DCDCDCA4543AA84627AA4626AE49
        27B25231B5826FC4836BBA522ABB532ABB532ABA5229AA5636E7E7E70000BEB1
        ADB0502FB65631A84426AB4727AD5B3FA8A8A8AB9188B64F29B75029B64F29B5
        4E29B34D28BFB1AC0000C2ABA3B35633BD6138B85932A84426AB4727A2A2A2A7
        A7A7AE5C3FB24C28B24C28B14B28AF4A27C4ABA20000C8B2AAB55B37BD643BC2
        693CBE6338AF4E2CA66855A8A8A8A9A3A1B3684EAD4827AC4827AB4726C2A9A1
        0000CFC6C2B96744BC673EC06A3EC26B3EC46C3DBF6538BF907CC7C7C7CFC2BE
        AA4727AE4B29AC4929BCAFAB0000EBEBEBC89780BB6A42BE6C41C98B6ADCC1B2
        CF9474DBBAA9E8E8E8EEEEEEC06137BA5932A6553BDBDBDB0000B8B8B8EBE3E0
        C2805DBB6F45CA8F6FF4F4F4F5F5F5F5F5F5F6F6F6E5C9BCBB5E37B25230C0A7
        A0C7C7C70000FF0099CECECEDBCAC1C2835FBE7952D8AE96E9D1C4EEDACFD9AA
        93BF6C47B45936A37465C7C7C7FF00990000FF0099FF0099DCDCDCEBE4E1C9A0
        87BC7751B96F46BA6C44B96740B06B4DC1AAA2C7C7C7FF0099FF00990000FF00
        99FF0099FF0099D6D6D6ECECECD3CCC8D1BFB5CEBBB2C9BFBADEDEDEB8B8B8FF
        0099FF0099FF00990000}
      PopupType = ptCustom
      ScreenTip.Description.Strings = (
        
          '1) N'#227'o '#233' necess'#225'rio preencher o endere'#231'o completo, mas o endere'#231 +
          'o deve ter no m'#237'nimo 3 caracteres;'
        ''
        '2) O endere'#231'o pode ou n'#227'o ser acentu'#225'rio, tanto faz;'
        ''
        '3) N'#227'o informar no endere'#231'o o n'#250'mero da casa, apto, etc;'
        ''
        
          '4) Nomes de ruas com n'#250'meros, devemos substituir o n'#250'mero pelo e' +
          'xtenso, exemplo:'
        'RUA 13 DE MAIO -> RUA TREZE DE MAIO'
        ''
        '5) Substituir abreviaturas, conforme abaixo:'
        'DR. -> DOUTOR'
        'TV. -> TRAVESSA'
        'AV. -> AVENIDA'
        'GEN. -> GENERAL')
      ScreenTip.Header = 'Dicas para realizar a busca'
      ScreenTipManager = frmPrincipal.ScreenTipsManager
    end
  end
  object cdsResultado: TClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'cdsResultadoIndex1'
        Fields = 'cep'
      end>
    IndexFieldNames = 'cep'
    Params = <>
    StoreDefs = True
    Left = 448
    Top = 176
    object cdsResultadocep: TStringField
      FieldName = 'cep'
      Size = 10
    end
    object cdsResultadologradouro: TStringField
      FieldName = 'logradouro'
      Size = 255
    end
    object cdsResultadocomplemento: TStringField
      FieldName = 'complemento'
      Size = 100
    end
    object cdsResultadobairro: TStringField
      FieldName = 'bairro'
      Size = 100
    end
    object cdsResultadolocalidade: TStringField
      FieldName = 'localidade'
      Size = 255
    end
    object cdsResultadouf: TStringField
      FieldName = 'uf'
      Size = 2
    end
  end
  object dsResultado: TDataSource
    DataSet = cdsResultado
    Left = 528
    Top = 176
  end
  object RESTClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://viacep.com.br'
    Params = <>
    HandleRedirects = True
    Left = 104
    Top = 176
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Resource = 'ws/RS/carlos barbosa/Rua 25 de setembro/json'
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 200
    Top = 176
  end
  object RESTResponse: TRESTResponse
    ContentType = 'application/json'
    Left = 288
    Top = 176
  end
  object JvEnterAsTab: TJvEnterAsTab
    Left = 40
    Top = 256
  end
  object TimerInicio: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerInicioTimer
    Left = 136
    Top = 257
  end
end
