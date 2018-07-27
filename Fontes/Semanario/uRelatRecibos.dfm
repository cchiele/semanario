object frmRelatRecibos: TfrmRelatRecibos
  Tag = 1
  Left = 444
  Top = 191
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Recibos'
  ClientHeight = 382
  ClientWidth = 714
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
  object btnOkAssinante: TJvImgBtn
    Left = 8
    Top = 311
    Width = 75
    Height = 25
    Caption = 'OK'
    ImageIndex = 9
    Images = frmPrincipal.ImageList16
    TabOrder = 2
    OnClick = btnOkAssinanteClick
  end
  object rgTipoRelat: TRadioGroup
    Left = 8
    Top = 8
    Width = 321
    Height = 58
    Caption = 'Tipo de relat'#243'rio'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Recibos'
      'Assinaturas '#224' renovar')
    TabOrder = 1
  end
  object gbPeriodo: TGroupBox
    Left = 8
    Top = 142
    Width = 321
    Height = 57
    Caption = 'Informe o per'#237'odo de vencimento das assinaturas'
    TabOrder = 0
    object Label1: TLabel
      Left = 142
      Top = 25
      Width = 16
      Height = 13
      Caption = 'at'#233
    end
    object edtDataFim: TJvDateEdit
      Left = 175
      Top = 22
      Width = 94
      Height = 21
      CheckOnExit = True
      ShowNullDate = False
      TabOrder = 1
    end
    object edtDataIni: TJvDateEdit
      Left = 31
      Top = 22
      Width = 93
      Height = 21
      CheckOnExit = True
      ShowNullDate = False
      TabOrder = 0
    end
  end
  object rgAssinatura: TRadioGroup
    Left = 8
    Top = 72
    Width = 321
    Height = 57
    Caption = 'Selecionar assinaturas por...'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Lote'
      'Per'#237'odo de vencimento')
    TabOrder = 3
    OnClick = rgAssinaturaClick
  end
  object gbLotes: TGroupBox
    Left = 8
    Top = 142
    Width = 569
    Height = 163
    Caption = 'Selecione um Lote'
    Padding.Left = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 4
    object DBGrid1: TDBGrid
      Left = 7
      Top = 15
      Width = 555
      Height = 141
      Align = alClient
      DataSource = dsLote
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
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
          FieldName = 'gaacod'
          Title.Caption = 'Lote'
          Width = 43
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'gaadtgerauto'
          Title.Alignment = taCenter
          Title.Caption = 'Data Gera'#231#227'o'
          Width = 77
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'CalcAnoMes'
          Title.Alignment = taCenter
          Title.Caption = 'Ano e M'#234's Informado'
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'gaavennome'
          Title.Caption = 'Vendedor'
          Width = 145
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'gaavlass'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor Ass.'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'gaanromes'
          Title.Alignment = taRightJustify
          Title.Caption = 'Nro.Meses'
          Width = 61
          Visible = True
        end>
    end
  end
  object JvEnterAsTab: TJvEnterAsTab
    Left = 352
    Top = 96
  end
  object dsLote: TDataSource
    DataSet = dmDadosRelat.cdsLotes
    Left = 200
    Top = 214
  end
end
