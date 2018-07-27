object frmCadCobradores: TfrmCadCobradores
  Tag = 1
  Left = 233
  Top = 94
  Caption = 'Cadastro de Cobradores'
  ClientHeight = 589
  ClientWidth = 912
  Color = clWindow
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
    Width = 912
    Height = 589
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 547
      Width = 910
      Height = 41
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
      DesignSize = (
        910
        41)
      object Label29: TLabel
        Left = 753
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
      Width = 648
      Height = 127
      Caption = 'Dados do cobrador'
      TabOrder = 0
      object Label2: TLabel
        Left = 21
        Top = 32
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label3: TLabel
        Left = 21
        Top = 72
        Width = 31
        Height = 13
        Caption = 'Nome:'
      end
      object Label5: TLabel
        Left = 588
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
      object DBEdit1: TDBEdit
        Left = 66
        Top = 29
        Width = 84
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'cobcod'
        DataSource = dsTblcob
        ReadOnly = True
        TabOrder = 0
      end
      object dbEdtNome: TDBEdit
        Left = 66
        Top = 69
        Width = 516
        Height = 21
        CharCase = ecUpperCase
        DataField = 'cobnome'
        DataSource = dsTblcob
        TabOrder = 1
      end
    end
  end
  object pnlConsulta: TPanel
    Left = 0
    Top = 0
    Width = 912
    Height = 589
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
      Width = 900
      Height = 490
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
        Width = 886
        Height = 463
        Align = alClient
        DataSource = dsTblcob
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
            FieldName = 'cobcod'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cobnome'
            Title.Caption = 'Nome do cobrador'
            Visible = True
          end>
      end
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 6
      Width = 900
      Height = 56
      Align = alTop
      Caption = 'Filtros'
      TabOrder = 0
      object edtCobrador: TLabeledEdit
        Left = 79
        Top = 19
        Width = 201
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 49
        EditLabel.Height = 13
        EditLabel.Caption = 'Cobrador:'
        LabelPosition = lpLeft
        TabOrder = 0
      end
      object btnFiltrar: TJvImgBtn
        Left = 424
        Top = 17
        Width = 75
        Height = 25
        Caption = 'Filtrar'
        ImageIndex = 3
        Images = frmPrincipal.ImageList16
        TabOrder = 1
        OnClick = btnFiltrarClick
        HotTrackFont.Charset = DEFAULT_CHARSET
        HotTrackFont.Color = clWindowText
        HotTrackFont.Height = -11
        HotTrackFont.Name = 'Tahoma'
        HotTrackFont.Style = []
      end
    end
    object Panel1: TPanel
      Left = 6
      Top = 552
      Width = 900
      Height = 31
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object btnNovo: TJvImgBtn
        Tag = 24
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
        Tag = 25
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
        Tag = 26
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
  object dsTblcob: TDataSource
    DataSet = dmDadosCobradores.cdsTblcob
    Left = 385
    Top = 265
  end
  object TimerInicio: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerInicioTimer
    Left = 262
    Top = 270
  end
end
