object frmRelatCortesias: TfrmRelatCortesias
  Tag = 1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rio de Cortesias'
  ClientHeight = 201
  ClientWidth = 447
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
  object JvInstallLabel1: TJvInstallLabel
    Left = 8
    Top = 8
    Width = 329
    Height = 65
    Lines.Strings = (
      'Ir'#225' listar todas as assinaturas que s'#227'o cortesia no momento,'
      'desconsiderando os assinantes inativos e assinaturas'
      'canceladas.')
    LineSpacing = 5
  end
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 329
    Height = 65
    Shape = bsFrame
  end
  object btnOk: TJvImgBtn
    Left = 8
    Top = 110
    Width = 75
    Height = 25
    Caption = 'OK'
    ImageIndex = 9
    Images = frmPrincipal.ImageList16
    TabOrder = 0
    OnClick = btnOkClick
  end
end
