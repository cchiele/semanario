object frmCadRuas: TfrmCadRuas
  Tag = 1
  Left = 233
  Top = 94
  Caption = 'Cadastro de Ruas'
  ClientHeight = 580
  ClientWidth = 873
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlManutencao: TPanel
    Left = 0
    Top = 0
    Width = 873
    Height = 580
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = -2
    ExplicitWidth = 867
    ExplicitHeight = 582
    object Panel2: TPanel
      Left = 1
      Top = 538
      Width = 871
      Height = 41
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
      DesignSize = (
        871
        41)
      object Label29: TLabel
        Left = 714
        Top = 11
        Width = 145
        Height = 16
        Anchors = [akTop, akRight]
        Caption = '* Campos obrigat'#243'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 700
      end
      object btnOk: TJvImgBtn
        Left = 40
        Top = 8
        Width = 75
        Height = 25
        Action = ActionOk
        Default = True
        ImageIndex = 9
        Images = frmPrincipal.ImageList16
        ModalResult = 1
        TabOrder = 0
        Kind = bkOK
      end
      object btnCancelar: TJvImgBtn
        Left = 121
        Top = 8
        Width = 75
        Height = 25
        Action = ActionCancelar
        Cancel = True
        ImageIndex = 8
        Images = frmPrincipal.ImageList16
        ModalResult = 2
        TabOrder = 1
        Kind = bkCancel
      end
    end
    object GroupBox3: TGroupBox
      Left = 41
      Top = 34
      Width = 600
      Height = 159
      Caption = 'Dados da rua'
      TabOrder = 0
      object Label2: TLabel
        Left = 21
        Top = 32
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label5: TLabel
        Left = 519
        Top = 62
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 120
        Top = 30
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 519
        Top = 96
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 21
        Top = 64
        Width = 23
        Height = 13
        Caption = 'Rua:'
        FocusControl = dbedtRua
      end
      object Label8: TLabel
        Left = 21
        Top = 96
        Width = 28
        Height = 13
        Caption = 'Zona:'
        FocusControl = DBLookupComboBox1
      end
      object SpeedButton1: TSpeedButton
        Left = 490
        Top = 94
        Width = 23
        Height = 22
        Action = ActionAtualizaCampoZonas
        Flat = True
        ParentShowHint = False
        ShowHint = True
      end
      object dbedtCodigo: TDBEdit
        Left = 69
        Top = 29
        Width = 45
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clBtnFace
        DataField = 'rdzcod'
        DataSource = dsTblrdz
        MaxLength = 3
        ReadOnly = True
        TabOrder = 0
      end
      object dbedtRua: TDBEdit
        Left = 69
        Top = 61
        Width = 444
        Height = 21
        CharCase = ecUpperCase
        DataField = 'rdzender'
        DataSource = dsTblrdz
        TabOrder = 1
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 69
        Top = 94
        Width = 420
        Height = 21
        DataField = 'LookupZondescr'
        DataSource = dsTblrdz
        TabOrder = 2
      end
    end
  end
  object pnlConsulta: TPanel
    Left = 0
    Top = 0
    Width = 873
    Height = 580
    Align = alClient
    Color = clWindow
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 1
    object GroupBox2: TGroupBox
      Left = 6
      Top = 62
      Width = 861
      Height = 481
      Align = alClient
      Caption = 'Resultado da pesquisa'
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      TabOrder = 1
      object dbGrid: TDBGrid
        Left = 7
        Top = 20
        Width = 847
        Height = 454
        Align = alClient
        DataSource = dsTblrdz
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
            FieldName = 'rdzcod'
            Title.Caption = 'C'#243'digo'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'rdzender'
            Title.Caption = 'Rua'
            Width = 423
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'zoncod'
            Title.Caption = 'Zona'
            Width = 32
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookupZondescr'
            Title.Caption = 'Descri'#231#227'o da Zona'
            Width = 332
            Visible = True
          end>
      end
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 6
      Width = 861
      Height = 56
      Align = alTop
      Caption = 'Filtros'
      TabOrder = 0
      object edtRua: TLabeledEdit
        Left = 64
        Top = 19
        Width = 201
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 23
        EditLabel.Height = 13
        EditLabel.Caption = 'Rua:'
        LabelPosition = lpLeft
        TabOrder = 0
      end
      object btnFiltrar: TJvImgBtn
        Left = 641
        Top = 17
        Width = 75
        Height = 25
        Action = ActionFiltrar
        ImageIndex = 3
        Images = frmPrincipal.ImageList16
        TabOrder = 3
      end
      object edtCodigoZona: TLabeledEdit
        Left = 347
        Top = 19
        Width = 30
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'Zona:'
        LabelPosition = lpLeft
        TabOrder = 1
      end
      object edtDescrZona: TEdit
        Left = 380
        Top = 19
        Width = 213
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
      end
    end
    object Panel1: TPanel
      Left = 6
      Top = 543
      Width = 861
      Height = 31
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object btnNovo: TJvImgBtn
        Left = 0
        Top = 3
        Width = 75
        Height = 25
        Action = ActionNovo
        ImageIndex = 0
        Images = frmPrincipal.ImageList16
        TabOrder = 0
      end
      object btnEditar: TJvImgBtn
        Left = 81
        Top = 3
        Width = 75
        Height = 25
        Action = ActionEditar
        ImageIndex = 1
        Images = frmPrincipal.ImageList16
        TabOrder = 1
      end
      object btnExcluir: TJvImgBtn
        Left = 162
        Top = 3
        Width = 75
        Height = 25
        Action = ActionExcluir
        ImageIndex = 2
        Images = frmPrincipal.ImageList16
        TabOrder = 2
      end
    end
  end
  object dsTblrdz: TDataSource
    DataSet = dmDadosZonasRuas.cdsTblrdz
    Left = 390
    Top = 262
  end
  object TimerInicio: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerInicioTimer
    Left = 294
    Top = 262
  end
  object ActionList: TActionList
    Images = frmPrincipal.ImageList16
    Left = 206
    Top = 262
    object ActionAtualizarFiltroZonas: TAction
      Hint = 'Atualizar lista de zonas'
      ImageIndex = 7
    end
    object ActionNovo: TAction
      Tag = 67
      Caption = 'Novo'
      ImageIndex = 0
      OnExecute = ActionNovoExecute
    end
    object ActionEditar: TAction
      Tag = 68
      Caption = 'Editar'
      ImageIndex = 1
      OnExecute = ActionEditarExecute
    end
    object ActionExcluir: TAction
      Tag = 69
      Caption = 'Excluir'
      ImageIndex = 2
      OnExecute = ActionExcluirExecute
    end
    object ActionFiltrar: TAction
      Caption = 'Filtrar'
      ImageIndex = 3
      OnExecute = ActionFiltrarExecute
    end
    object ActionOk: TAction
      Caption = 'OK'
      ImageIndex = 9
      OnExecute = ActionOkExecute
    end
    object ActionCancelar: TAction
      Caption = 'Cancelar'
      ImageIndex = 8
      OnExecute = ActionCancelarExecute
    end
    object ActionAtualizaCampoZonas: TAction
      Hint = 'Atualiza a lista de zonas'
      ImageIndex = 7
      OnExecute = ActionAtualizaCampoZonasExecute
    end
  end
end
