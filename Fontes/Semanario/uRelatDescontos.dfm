object frmRelatDescontos: TfrmRelatDescontos
  Tag = 1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat. Descontos Realizados'
  ClientHeight = 160
  ClientWidth = 434
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 8
    Top = 80
    Width = 390
    Height = 13
    Caption = 
      '* N'#227'o ser'#227'o consideradas as assinaturas canceladas e nem os assi' +
      'nates inativos;'
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 313
    Height = 57
    Caption = 'Informe o per'#237'odo de renova'#231#227'o das assinaturas'
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
  object btnOk: TJvImgBtn
    Left = 8
    Top = 110
    Width = 75
    Height = 25
    Caption = 'OK'
    ImageIndex = 9
    Images = frmPrincipal.ImageList16
    TabOrder = 1
    OnClick = btnOkClick
  end
  object JvEnterAsTab: TJvEnterAsTab
    Left = 176
    Top = 104
  end
end
