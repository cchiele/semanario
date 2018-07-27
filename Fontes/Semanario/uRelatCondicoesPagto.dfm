object frmRelatCondicoesPagto: TfrmRelatCondicoesPagto
  Tag = 1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat. Condi'#231#245'es de Pagto'
  ClientHeight = 433
  ClientWidth = 403
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 7
    Width = 385
    Height = 57
    Caption = 'Informe o per'#237'odo de vencimento das parcelas'
    TabOrder = 0
    object Label1: TLabel
      Left = 182
      Top = 24
      Width = 16
      Height = 13
      Caption = 'at'#233
    end
    object edtDataFim: TJvDateEdit
      Left = 215
      Top = 21
      Width = 94
      Height = 21
      CheckOnExit = True
      ShowNullDate = False
      TabOrder = 1
    end
    object edtDataIni: TJvDateEdit
      Left = 71
      Top = 21
      Width = 93
      Height = 21
      CheckOnExit = True
      ShowNullDate = False
      TabOrder = 0
    end
  end
  object GroupBoxLista: TGroupBox
    Left = 10
    Top = 67
    Width = 385
    Height = 327
    Caption = 'Selecione um ou mais Cobradores'
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 1
    object dbgGrid: TDBGrid
      Left = 7
      Top = 56
      Width = 371
      Height = 264
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
          FieldName = 'cobcod'
          ReadOnly = True
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'cobnome'
          ReadOnly = True
          Width = 285
          Visible = True
        end>
    end
    object Panel1: TPanel
      Left = 7
      Top = 20
      Width = 371
      Height = 36
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object btnMarcarDesmarcar: TBitBtn
        Left = 0
        Top = 5
        Width = 145
        Height = 25
        Caption = 'Marcar / desmarcar todos'
        TabOrder = 0
        OnClick = btnMarcarDesmarcarClick
      end
    end
  end
  object btnOkAssinante: TJvImgBtn
    Left = 8
    Top = 400
    Width = 75
    Height = 25
    Caption = 'OK'
    ImageIndex = 9
    Images = frmPrincipal.ImageList16
    TabOrder = 2
    OnClick = btnOkAssinanteClick
  end
  object DataSource: TDataSource
    DataSet = dmDadosRelat.cdsCobradores
    Left = 160
    Top = 191
  end
  object JvEnterAsTab: TJvEnterAsTab
    Left = 160
    Top = 256
  end
end
