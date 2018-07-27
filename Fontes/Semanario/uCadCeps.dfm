object frmCadCeps: TfrmCadCeps
  Tag = 1
  Left = 233
  Top = 86
  Caption = 'Cadastro de CEPs'
  ClientHeight = 595
  ClientWidth = 870
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
  object pnlConsulta: TPanel
    Left = 0
    Top = 0
    Width = 870
    Height = 595
    Align = alClient
    Color = clWindow
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    ParentBackground = False
    TabOrder = 1
    object GroupBox2: TGroupBox
      Left = 6
      Top = 62
      Width = 858
      Height = 496
      Align = alClient
      Caption = 'Resultado da pesquisa'
      TabOrder = 1
      object dbGridCeps: TDBGrid
        Left = 2
        Top = 15
        Width = 854
        Height = 479
        Align = alClient
        DataSource = dsTblcep
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
            FieldName = 'cepcep'
            Title.Caption = 'CEP'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cepmunicipio'
            Title.Caption = 'Munic'#237'pio'
            Width = 390
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cepeuf'
            Title.Caption = 'UF'
            Width = 37
            Visible = True
          end>
      end
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 6
      Width = 858
      Height = 56
      Align = alTop
      Caption = 'Filtros'
      TabOrder = 0
      object Label1: TLabel
        Left = 27
        Top = 22
        Width = 23
        Height = 13
        Caption = 'CEP:'
      end
      object edtMunicipio: TLabeledEdit
        Left = 195
        Top = 19
        Width = 201
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 47
        EditLabel.Height = 13
        EditLabel.Caption = 'Munic'#237'pio:'
        LabelPosition = lpLeft
        TabOrder = 1
      end
      object edtCep: TMaskEdit
        Left = 56
        Top = 19
        Width = 61
        Height = 21
        EditMask = '#####-###;1;_'
        MaxLength = 9
        TabOrder = 0
        Text = '     -   '
      end
      object EdtUf: TLabeledEdit
        Left = 459
        Top = 19
        Width = 30
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 17
        EditLabel.Height = 13
        EditLabel.Caption = 'UF:'
        LabelPosition = lpLeft
        MaxLength = 2
        TabOrder = 2
      end
      object btnFiltrar: TJvImgBtn
        Left = 512
        Top = 17
        Width = 75
        Height = 25
        Caption = 'Filtrar'
        ImageIndex = 3
        Images = frmPrincipal.ImageList16
        TabOrder = 3
        OnClick = btnFiltrarClick
      end
    end
    object Panel1: TPanel
      Left = 6
      Top = 558
      Width = 858
      Height = 31
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object btnNovo: TJvImgBtn
        Tag = 29
        Left = 0
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Novo'
        ImageIndex = 0
        Images = frmPrincipal.ImageList16
        TabOrder = 0
        OnClick = btnNovoClick
      end
      object btnEditar: TJvImgBtn
        Tag = 30
        Left = 81
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Editar'
        ImageIndex = 1
        Images = frmPrincipal.ImageList16
        TabOrder = 1
        OnClick = btnEditarClick
      end
      object btnExcluir: TJvImgBtn
        Tag = 31
        Left = 162
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Excluir'
        ImageIndex = 2
        Images = frmPrincipal.ImageList16
        TabOrder = 2
        OnClick = btnExcluirClick
      end
    end
  end
  object pnlManutencao: TPanel
    Left = 0
    Top = 0
    Width = 870
    Height = 595
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      Left = 1
      Top = 553
      Width = 868
      Height = 41
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
      DesignSize = (
        868
        41)
      object Label29: TLabel
        Left = 711
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
      object JvImgBtn1: TJvImgBtn
        Left = 40
        Top = 8
        Width = 75
        Height = 25
        Default = True
        ModalResult = 1
        TabOrder = 0
        OnClick = JvImgBtn1Click
        Kind = bkOK
      end
      object JvImgBtn2: TJvImgBtn
        Left = 121
        Top = 8
        Width = 75
        Height = 25
        Cancel = True
        Caption = 'Cancelar'
        ModalResult = 2
        TabOrder = 1
        OnClick = JvImgBtn2Click
        Kind = bkCancel
      end
    end
    object GroupBox3: TGroupBox
      Left = 41
      Top = 34
      Width = 648
      Height = 167
      Caption = 'Dados do CEP'
      TabOrder = 0
      object Label2: TLabel
        Left = 21
        Top = 32
        Width = 23
        Height = 13
        Caption = 'CEP:'
        FocusControl = dbedtCep
      end
      object Label28: TLabel
        Left = 141
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
      object Label3: TLabel
        Left = 21
        Top = 66
        Width = 47
        Height = 13
        Caption = 'Munic'#237'pio:'
        FocusControl = dbedtMunicipio
      end
      object Label4: TLabel
        Left = 21
        Top = 113
        Width = 17
        Height = 13
        Caption = 'UF:'
      end
      object Label5: TLabel
        Left = 596
        Top = 70
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
        Left = 225
        Top = 111
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
      object dbedtCep: TDBEdit
        Left = 74
        Top = 29
        Width = 61
        Height = 21
        DataField = 'cepcep'
        DataSource = dsTblcep
        TabOrder = 0
      end
      object dbedtMunicipio: TDBEdit
        Left = 74
        Top = 63
        Width = 516
        Height = 21
        CharCase = ecUpperCase
        DataField = 'cepmunicipio'
        DataSource = dsTblcep
        TabOrder = 1
      end
      object DBLCBXUF: TDBLookupComboBox
        Left = 74
        Top = 107
        Width = 145
        Height = 21
        DataField = 'cepeuf'
        DataSource = dsTblcep
        KeyField = 'uf'
        ListField = 'ufdescr'
        ListSource = dmDadosGlobal.dsUf
        TabOrder = 2
      end
      object btnConsultaCep: TJvImgBtn
        Left = 162
        Top = 28
        Width = 167
        Height = 24
        Hint = 'Clique aqui para encontrar o CEP atrav'#233's do endere'#231'o'
        Caption = 'Buscar CEP pelo Endere'#231'o'
        ImageIndex = 3
        Images = frmPrincipal.ImageList16
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        TabStop = False
        OnClick = btnConsultaCepClick
      end
    end
  end
  object dsTblcep: TDataSource
    DataSet = dmDadosCep.cdsTblcep
    Left = 353
    Top = 289
  end
  object TimerInicio: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerInicioTimer
    Left = 230
    Top = 286
  end
end
