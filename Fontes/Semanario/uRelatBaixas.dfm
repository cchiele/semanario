object frmRelatBaixas: TfrmRelatBaixas
  Tag = 1
  Left = 439
  Top = 148
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Baixas'
  ClientHeight = 405
  ClientWidth = 387
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
    Top = 372
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 371
    Height = 57
    Caption = 'Informe o per'#237'odo das baixas realizadas'
    TabOrder = 0
    object Label1: TLabel
      Left = 179
      Top = 24
      Width = 16
      Height = 13
      Caption = 'at'#233
    end
    object edtDataFim: TJvDateEdit
      Left = 212
      Top = 21
      Width = 94
      Height = 21
      CheckOnExit = True
      TabOrder = 1
    end
    object edtDataIni: TJvDateEdit
      Left = 68
      Top = 21
      Width = 93
      Height = 21
      CheckOnExit = True
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 71
    Width = 371
    Height = 295
    Caption = 'Selecione os grupos de vendedores desejados'
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 7
      Top = 45
      Width = 357
      Height = 243
      Align = alClient
      DataSource = dsGruposVendedores
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
          FieldName = 'gdvcod'
          ReadOnly = True
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'gdvdescr'
          ReadOnly = True
          Width = 275
          Visible = True
        end>
    end
    object btnMarcarDesmarcar: TBitBtn
      Left = 7
      Top = 20
      Width = 357
      Height = 25
      Align = alTop
      Caption = 'Marcar / desmarcar todos grupos'
      TabOrder = 0
      OnClick = btnMarcarDesmarcarClick
    end
  end
  object dsGruposVendedores: TDataSource
    DataSet = dmDadosRelat.cdsGruposVendedores
    Left = 144
    Top = 191
  end
  object JvEnterAsTab: TJvEnterAsTab
    Left = 144
    Top = 248
  end
end
