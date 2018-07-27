object frmRelatAssPendentes: TfrmRelatAssPendentes
  Tag = 1
  Left = 314
  Top = 92
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat. Assinaturas Pendentes'
  ClientHeight = 396
  ClientWidth = 1074
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 7
    Width = 257
    Height = 57
    Caption = 'Informe o per'#237'odo de vencimento das assinaturas'
    TabOrder = 0
    object Label1: TLabel
      Left = 118
      Top = 24
      Width = 16
      Height = 13
      Caption = 'at'#233
    end
    object edtDataFim: TJvDateEdit
      Left = 151
      Top = 21
      Width = 94
      Height = 21
      CheckOnExit = True
      ShowNullDate = False
      TabOrder = 1
    end
    object edtDataIni: TJvDateEdit
      Left = 7
      Top = 21
      Width = 93
      Height = 21
      CheckOnExit = True
      ShowNullDate = False
      TabOrder = 0
    end
  end
  object GroupBoxLista: TGroupBox
    Left = 272
    Top = 7
    Width = 369
    Height = 351
    Caption = 'Selecione...'
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 1
    object dbgGrid: TDBGrid
      Left = 7
      Top = 56
      Width = 355
      Height = 288
      Align = alClient
      DataSource = DataSource
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgGridCellClick
      OnDrawColumnCell = dbgGridDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'CalcSelecionado'
          Title.Caption = ' '
          Width = 17
          Visible = True
        end
        item
          Expanded = False
          ReadOnly = True
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          ReadOnly = True
          Width = 273
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 7
      Top = 20
      Width = 355
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 451
      object btnMarcarDesmarcar: TBitBtn
        Left = 209
        Top = 5
        Width = 145
        Height = 25
        Caption = 'Marcar / desmarcar todos'
        TabOrder = 0
        OnClick = btnMarcarDesmarcarClick
      end
      object edtFiltro: TLabeledEdit
        Left = 34
        Top = 9
        Width = 169
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'Filtro:'
        LabelPosition = lpLeft
        TabOrder = 1
        OnChange = edtFiltroChange
      end
    end
  end
  object btnOkAssinante: TJvImgBtn
    Left = 9
    Top = 363
    Width = 75
    Height = 25
    Caption = 'OK'
    ImageIndex = 9
    Images = frmPrincipal.ImageList16
    TabOrder = 2
    OnClick = btnOkAssinanteClick
  end
  object rgAgrupar: TRadioGroup
    Left = 9
    Top = 70
    Width = 257
    Height = 288
    Caption = 'Agrupado por...'
    ItemIndex = 0
    Items.Strings = (
      'Vendedor'
      'Grupo de Vendedor'
      'Cobrador')
    TabOrder = 3
    OnClick = rgAgruparClick
  end
  object GroupBox2: TGroupBox
    Left = 647
    Top = 7
    Width = 418
    Height = 351
    Caption = 'Selecione as zonas desejadas'
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 4
    object dbgZonas: TDBGrid
      Left = 7
      Top = 52
      Width = 404
      Height = 292
      Align = alClient
      DataSource = dsZonas
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgZonasCellClick
      OnDrawColumnCell = dbgZonasDrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'CalcSelecionado'
          Title.Caption = ' '
          Width = 17
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'zoncod'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'zondescr'
          ReadOnly = True
          Title.Caption = 'Zona'
          Width = 322
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 7
      Top = 20
      Width = 404
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 451
      object btnMarcarDesmarcarZonas: TBitBtn
        Left = 256
        Top = 1
        Width = 149
        Height = 25
        Caption = 'Marcar / desmarcar todas'
        TabOrder = 1
        OnClick = btnMarcarDesmarcarZonasClick
      end
      object edtFiltroZonas: TLabeledEdit
        Left = 33
        Top = 5
        Width = 217
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'Filtro:'
        LabelPosition = lpLeft
        TabOrder = 0
        OnChange = edtFiltroZonasChange
      end
    end
  end
  object JvEnterAsTab: TJvEnterAsTab
    Left = 480
    Top = 264
  end
  object DataSource: TDataSource
    DataSet = dmDadosRelat.cdsZonas
    Left = 480
    Top = 199
  end
  object dsZonas: TDataSource
    DataSet = dmDadosRelat.cdsZonas
    Left = 815
    Top = 162
  end
end
