object frmLocalizarEndereco: TfrmLocalizarEndereco
  Left = 264
  Top = 110
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Localizar endere'#231'o'
  ClientHeight = 435
  ClientWidth = 876
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Padding.Left = 5
  Padding.Top = 5
  Padding.Right = 5
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 5
    Top = 5
    Width = 866
    Height = 61
    Align = alTop
    Caption = 'Pesquisar por endere'#231'o, c'#243'digo de zonas ou descri'#231#227'o de zona'
    TabOrder = 0
    object edtPesquisa: TEdit
      Left = 16
      Top = 24
      Width = 825
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = edtPesquisaChange
      OnKeyDown = edtPesquisaKeyDown
    end
  end
  object GroupBox2: TGroupBox
    Left = 5
    Top = 66
    Width = 866
    Height = 334
    Align = alClient
    Caption = 'Lista de endere'#231'os'
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    TabOrder = 1
    object lblTotalRegistros: TLabel
      Left = 7
      Top = 314
      Width = 852
      Height = 13
      Align = alBottom
      Caption = '0 endere'#231'o(s) encontrado(s)'
      ExplicitWidth = 138
    end
    object DBGrid1: TDBGrid
      Left = 7
      Top = 20
      Width = 852
      Height = 294
      Align = alClient
      DataSource = dsPesquisaEndereco
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'rdzcod'
          Title.Caption = 'C'#243'digo'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'rdzender'
          Title.Caption = 'Endere'#231'o'
          Width = 454
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'zoncod'
          Title.Caption = 'Zona'
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'zondescr'
          Title.Caption = 'Descri'#231#227'o da Zona'
          Width = 279
          Visible = True
        end>
    end
  end
  object Panel1: TPanel
    Left = 5
    Top = 400
    Width = 866
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object btnOk: TJvImgBtn
      Left = 710
      Top = 6
      Width = 75
      Height = 25
      Default = True
      Enabled = False
      ImageIndex = 9
      Images = frmPrincipal.ImageList16
      ModalResult = 1
      TabOrder = 0
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Kind = bkOK
    end
    object btnCancelarAssinante: TJvImgBtn
      Left = 791
      Top = 6
      Width = 75
      Height = 25
      Cancel = True
      ImageIndex = 8
      Images = frmPrincipal.ImageList16
      ModalResult = 2
      TabOrder = 1
      HotTrackFont.Charset = DEFAULT_CHARSET
      HotTrackFont.Color = clWindowText
      HotTrackFont.Height = -11
      HotTrackFont.Name = 'Tahoma'
      HotTrackFont.Style = []
      Kind = bkCancel
    end
  end
  object dsPesquisaEndereco: TDataSource
    DataSet = dmDadosAssinantes.cdsPesquisaEndereco
    Left = 333
    Top = 194
  end
end
