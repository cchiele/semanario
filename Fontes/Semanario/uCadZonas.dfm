object frmCadZonas: TfrmCadZonas
  Tag = 1
  Left = 233
  Top = 86
  Caption = 'Cadastro de Zonas'
  ClientHeight = 582
  ClientWidth = 867
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
    Width = 867
    Height = 582
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 540
      Width = 865
      Height = 41
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
      DesignSize = (
        865
        41)
      object Label29: TLabel
        Left = 708
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
        Default = True
        ModalResult = 1
        TabOrder = 0
        OnClick = btnOkClick
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
        Kind = bkOK
      end
      object btnCancelar: TJvImgBtn
        Left = 121
        Top = 8
        Width = 75
        Height = 25
        Cancel = True
        Caption = 'Cancelar'
        ModalResult = 2
        TabOrder = 1
        OnClick = btnCancelarClick
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
        Kind = bkCancel
      end
    end
    object GroupBox3: TGroupBox
      Left = 41
      Top = 34
      Width = 600
      Height = 143
      Caption = 'Dados da zona'
      TabOrder = 0
      object Label2: TLabel
        Left = 21
        Top = 32
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label5: TLabel
        Left = 557
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
        Left = 139
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
      object Label1: TLabel
        Left = 21
        Top = 64
        Width = 50
        Height = 13
        Caption = 'Descri'#231#227'o:'
        FocusControl = dbedtDescr
      end
      object Label3: TLabel
        Left = 21
        Top = 96
        Width = 58
        Height = 13
        Caption = 'Entregador:'
        FocusControl = DBEdit3
      end
      object dbedtCodigo: TDBEdit
        Left = 88
        Top = 29
        Width = 45
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clBtnFace
        DataField = 'zoncod'
        DataSource = dsTblzon
        ReadOnly = True
        TabOrder = 0
      end
      object dbedtDescr: TDBEdit
        Left = 88
        Top = 61
        Width = 463
        Height = 21
        CharCase = ecUpperCase
        DataField = 'zondescr'
        DataSource = dsTblzon
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 88
        Top = 93
        Width = 463
        Height = 21
        CharCase = ecUpperCase
        DataField = 'zonentregador'
        DataSource = dsTblzon
        TabOrder = 2
      end
    end
  end
  object pnlConsulta: TPanel
    Left = 0
    Top = 0
    Width = 867
    Height = 582
    Align = alClient
    Color = clWindow
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    ParentBackground = False
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 6
      Top = 62
      Width = 855
      Height = 483
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
        Width = 841
        Height = 456
        Align = alClient
        DataSource = dsTblzon
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
            FieldName = 'zoncod'
            Title.Caption = 'C'#243'digo'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'zondescr'
            Title.Caption = 'Zona'
            Width = 356
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'zonentregador'
            Title.Caption = 'Entregador'
            Width = 313
            Visible = True
          end>
      end
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 6
      Width = 855
      Height = 56
      Align = alTop
      Caption = 'Filtros'
      TabOrder = 0
      object edtCodigoZona: TLabeledEdit
        Left = 56
        Top = 19
        Width = 37
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'Zona:'
        LabelPosition = lpLeft
        TabOrder = 0
      end
      object btnFiltrar: TJvImgBtn
        Left = 641
        Top = 17
        Width = 75
        Height = 25
        Caption = 'Filtrar'
        ImageIndex = 3
        Images = frmPrincipal.ImageList16
        TabOrder = 3
        OnClick = btnFiltrarClick
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object edtEntregador: TLabeledEdit
        Left = 406
        Top = 19
        Width = 201
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 58
        EditLabel.Height = 13
        EditLabel.Caption = 'Entregador:'
        LabelPosition = lpLeft
        TabOrder = 2
      end
      object edtDescr: TEdit
        Left = 97
        Top = 19
        Width = 208
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
    end
    object Panel1: TPanel
      Left = 6
      Top = 545
      Width = 855
      Height = 31
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object btnNovo: TJvImgBtn
        Tag = 9
        Left = 0
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Novo'
        ImageIndex = 0
        Images = frmPrincipal.ImageList16
        TabOrder = 0
        OnClick = btnNovoClick
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object btnEditar: TJvImgBtn
        Tag = 10
        Left = 81
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Editar'
        ImageIndex = 1
        Images = frmPrincipal.ImageList16
        TabOrder = 1
        OnClick = btnEditarClick
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
      object btnExcluir: TJvImgBtn
        Tag = 11
        Left = 162
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Excluir'
        ImageIndex = 2
        Images = frmPrincipal.ImageList16
        TabOrder = 2
        OnClick = btnExcluirClick
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
    end
  end
  object TimerInicio: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerInicioTimer
    Left = 278
    Top = 270
  end
  object dsTblzon: TDataSource
    DataSet = dmDadosZonasRuas.cdsTblzon
    Left = 376
    Top = 272
  end
end
