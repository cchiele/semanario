object frmCadBaixas: TfrmCadBaixas
  Tag = 1
  Left = 233
  Top = 94
  Caption = 'Baixas de Pagamentos'
  ClientHeight = 357
  ClientWidth = 520
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 16
    Top = 8
    Width = 489
    Height = 65
    Caption = 'Filtro'
    TabOrder = 0
    object edtAssinante: TLabeledEdit
      Left = 64
      Top = 24
      Width = 393
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 51
      EditLabel.Height = 13
      EditLabel.Caption = 'Assinante:'
      LabelPosition = lpLeft
      TabOrder = 0
      OnChange = edtAssinanteChange
      OnKeyDown = edtAssinanteKeyDown
      OnKeyUp = edtAssinanteKeyUp
    end
  end
  object GroupBox2: TGroupBox
    Left = 16
    Top = 79
    Width = 489
    Height = 138
    Caption = 'Assinante/Assinatura localizadas'
    Padding.Left = 5
    Padding.Top = 2
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 1
    object dbGridAss: TDBGrid
      Left = 7
      Top = 17
      Width = 475
      Height = 114
      TabStop = False
      Align = alClient
      DataSource = dsBaixaRapida
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'assnome'
          Title.Caption = 'Assinante'
          Width = 266
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'adacod'
          Title.Alignment = taCenter
          Title.Caption = 'Ass.'
          Width = 32
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'adadtvenc'
          Title.Alignment = taCenter
          Title.Caption = 'Data Venc.'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'adavlpend'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor Pend.'
          Width = 70
          Visible = True
        end>
    end
  end
  object GroupBox3: TGroupBox
    Left = 16
    Top = 223
    Width = 489
    Height = 82
    Caption = 'Baixa'
    TabOrder = 2
    object Label1: TLabel
      Left = 128
      Top = 21
      Width = 67
      Height = 13
      Caption = 'Data da Baixa'
    end
    object Label2: TLabel
      Left = 264
      Top = 21
      Width = 68
      Height = 13
      Caption = 'Valor da Baixa'
    end
    object edtDataBaixa: TJvDateEdit
      Left = 128
      Top = 40
      Width = 88
      Height = 21
      TabStop = False
      Color = clBtnFace
      ReadOnly = True
      ShowNullDate = False
      TabOrder = 0
    end
    object edtValorBaixa: TJvValidateEdit
      Left = 264
      Top = 40
      Width = 81
      Height = 21
      CriticalPoints.MaxValueIncluded = False
      CriticalPoints.MinValueIncluded = False
      DisplayFormat = dfFloat
      DecimalPlaces = 2
      TabOrder = 1
    end
  end
  object btnBaixarValor: TJvImgBtn
    Left = 424
    Top = 311
    Width = 81
    Height = 25
    Caption = 'Baixar'
    ImageIndex = 9
    Images = frmPrincipal.ImageList16
    TabOrder = 3
    OnClick = btnBaixarValorClick
  end
  object TimerInicio: TTimer
    Enabled = False
    Interval = 30
    OnTimer = TimerInicioTimer
    Left = 360
    Top = 144
  end
  object dsBaixaRapida: TDataSource
    DataSet = dmDadosAssinantes.cdsBaixaRapida
    Left = 240
    Top = 143
  end
end
