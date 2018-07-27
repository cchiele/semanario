object frmCadVendedores: TfrmCadVendedores
  Tag = 1
  Left = 235
  Top = 91
  Caption = 'Cadastro de Vendedores'
  ClientHeight = 568
  ClientWidth = 866
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
    Width = 866
    Height = 568
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = -46
    ExplicitTop = -21
    ExplicitWidth = 912
    ExplicitHeight = 589
    object Panel2: TPanel
      Left = 1
      Top = 526
      Width = 864
      Height = 41
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
      DesignSize = (
        864
        41)
      object Label29: TLabel
        Left = 707
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
        Kind = bkCancel
      end
    end
    object GroupBox3: TGroupBox
      Left = 41
      Top = 34
      Width = 600
      Height = 183
      Caption = 'Dados do vendedor'
      TabOrder = 0
      object Label2: TLabel
        Left = 21
        Top = 32
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label5: TLabel
        Left = 551
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
      object Label1: TLabel
        Left = 21
        Top = 64
        Width = 31
        Height = 13
        Caption = 'Nome:'
        FocusControl = dbedtNome
      end
      object Label4: TLabel
        Left = 21
        Top = 99
        Width = 46
        Height = 13
        Caption = 'Telefone:'
        FocusControl = DBEdit4
      end
      object Label3: TLabel
        Left = 21
        Top = 134
        Width = 33
        Height = 13
        Caption = 'Grupo:'
        FocusControl = DBEdit4
      end
      object Label6: TLabel
        Left = 351
        Top = 132
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
        Left = 77
        Top = 29
        Width = 84
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'vencod'
        DataSource = dsTblven
        ReadOnly = True
        TabOrder = 0
      end
      object dbedtNome: TDBEdit
        Left = 77
        Top = 61
        Width = 468
        Height = 21
        CharCase = ecUpperCase
        DataField = 'vennome'
        DataSource = dsTblven
        TabOrder = 1
      end
      object DBEdit4: TDBEdit
        Left = 77
        Top = 96
        Width = 83
        Height = 21
        CharCase = ecUpperCase
        DataField = 'venfone'
        DataSource = dsTblven
        TabOrder = 2
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 77
        Top = 131
        Width = 268
        Height = 21
        DataField = 'gdvcod'
        DataSource = dsTblven
        KeyField = 'gdvcod'
        ListField = 'gdvdescr'
        ListSource = dsLookup
        TabOrder = 3
      end
    end
  end
  object pnlConsulta: TPanel
    Left = 0
    Top = 0
    Width = 866
    Height = 568
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
      Width = 854
      Height = 469
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
        Width = 840
        Height = 442
        Align = alClient
        DataSource = dsTblven
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
            FieldName = 'vencod'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vennome'
            Title.Caption = 'Vendedor'
            Width = 312
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'venfone'
            Title.Caption = 'Telefone'
            Width = 107
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LookupGdvdescr'
            Title.Caption = 'Grupo'
            Width = 297
            Visible = True
          end>
      end
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 6
      Width = 854
      Height = 56
      Align = alTop
      Caption = 'Filtros'
      TabOrder = 0
      object Label7: TLabel
        Left = 336
        Top = 22
        Width = 33
        Height = 13
        Caption = 'Grupo:'
      end
      object edtNome: TLabeledEdit
        Left = 71
        Top = 19
        Width = 201
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 50
        EditLabel.Height = 13
        EditLabel.Caption = 'Vendedor:'
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
        TabOrder = 2
        OnClick = btnFiltrarClick
      end
      object JvDBSearchComboBox1: TJvDBSearchComboBox
        Left = 375
        Top = 19
        Width = 145
        Height = 21
        DataField = 'gdvdescr'
        DataSource = dsFiltroGrupos
        Style = csDropDownList
        TabOrder = 1
        Text = ''
      end
    end
    object Panel1: TPanel
      Left = 6
      Top = 531
      Width = 854
      Height = 31
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object btnNovo: TJvImgBtn
        Tag = 14
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
        Tag = 15
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
        Tag = 16
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
  object TimerInicio: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerInicioTimer
    Left = 278
    Top = 270
  end
  object dsTblven: TDataSource
    DataSet = dmDadosVendedores.cdsTblven
    Left = 438
    Top = 270
  end
  object dsLookup: TDataSource
    DataSet = dmDadosVendedores.cdslLookupGrupos
    Left = 513
    Top = 270
  end
  object dsFiltroGrupos: TDataSource
    DataSet = dmDadosVendedores.cdsFiltroGrupos
    Left = 358
    Top = 270
  end
end
