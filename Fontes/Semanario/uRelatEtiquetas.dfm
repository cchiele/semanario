object frmRelatEtiquetas: TfrmRelatEtiquetas
  Tag = 1
  Left = 405
  Top = 95
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Etiquetas'
  ClientHeight = 459
  ClientWidth = 485
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
    Top = 8
    Width = 225
    Height = 57
    Caption = 'Op'#231#245'es'
    TabOrder = 0
    object chkImprimirEtiquetas: TCheckBox
      Left = 16
      Top = 23
      Width = 196
      Height = 17
      Caption = 'Considera atributo Imprimir etiqueta'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 71
    Width = 465
    Height = 351
    Caption = 'Selecione as zonas desejadas'
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 7
      Top = 52
      Width = 451
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
      OnCellClick = DBGrid1CellClick
      OnDrawColumnCell = DBGrid1DrawColumnCell
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
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 7
      Top = 20
      Width = 451
      Height = 32
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object btnMarcarDesmarcar: TBitBtn
        Left = 301
        Top = 3
        Width = 149
        Height = 25
        Caption = 'Marcar / desmarcar todas'
        TabOrder = 1
        OnClick = btnMarcarDesmarcarClick
      end
      object edtFiltro: TLabeledEdit
        Left = 32
        Top = 5
        Width = 241
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'Filtro:'
        LabelPosition = lpLeft
        TabOrder = 0
        OnChange = edtFiltroChange
      end
    end
  end
  object btnOkAssinante: TJvImgBtn
    Left = 8
    Top = 426
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
  object rgTipoImpressora: TRadioGroup
    Left = 239
    Top = 8
    Width = 234
    Height = 57
    Caption = 'Tipo da Impressora'
    Columns = 2
    ItemIndex = 1
    Items.Strings = (
      'Jato de tinta'
      'Argox')
    TabOrder = 3
  end
  object JvEnterAsTab: TJvEnterAsTab
    Left = 216
    Top = 264
  end
  object dsZonas: TDataSource
    DataSet = dmDadosRelat.cdsZonas
    Left = 216
    Top = 199
  end
end
