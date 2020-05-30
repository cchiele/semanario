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
    object lblAjuda: TLabel
      Left = 591
      Top = 16
      Width = 148
      Height = 13
      Cursor = crHandPoint
      Caption = 'Veja como melhorar a pesquisa'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      OnClick = lblAjudaClick
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
    SecureProtocols = [TLS12]
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
  object BalloonHint1: TBalloonHint
    Delay = 100
    Left = 672
    Top = 160
  end
end
