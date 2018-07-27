object frmRelatAssinantes: TfrmRelatAssinantes
  Tag = 1
  Left = 233
  Top = 94
  Caption = 'Relat'#243'rio de Assinantes'
  ClientHeight = 395
  ClientWidth = 657
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
  object GroupBoxLista: TGroupBox
    Left = 183
    Top = 8
    Width = 465
    Height = 351
    Caption = 'Selecione...'
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 0
    object dbgGrid: TDBGrid
      Left = 7
      Top = 56
      Width = 451
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
          Width = 363
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 7
      Top = 20
      Width = 451
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object btnMarcarDesmarcar: TBitBtn
        Left = 305
        Top = 5
        Width = 145
        Height = 25
        Caption = 'Marcar / desmarcar todos'
        TabOrder = 0
        OnClick = btnMarcarDesmarcarClick
      end
      object edtFiltro: TLabeledEdit
        Left = 40
        Top = 8
        Width = 217
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
  object rgAgrupar: TRadioGroup
    Left = 8
    Top = 8
    Width = 169
    Height = 350
    Caption = 'Selecione o agrupamento'
    ItemIndex = 0
    Items.Strings = (
      'Zona'
      'Vendedor'
      'Grupo de Vendedor'
      'Cobrador')
    TabOrder = 1
    OnClick = rgAgruparClick
  end
  object btnOkAssinante: TJvImgBtn
    Left = 8
    Top = 364
    Width = 75
    Height = 25
    Caption = 'OK'
    ImageIndex = 9
    Images = frmPrincipal.ImageList16
    TabOrder = 2
    OnClick = btnOkAssinanteClick
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
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
end
