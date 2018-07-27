object frmRelatAlteracoesAssinante: TfrmRelatAlteracoesAssinante
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Hist'#243'rico de Altera'#231#245'es do Assinante'
  ClientHeight = 128
  ClientWidth = 342
  Color = clBtnFace
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
    Width = 321
    Height = 57
    Caption = 'Informe o per'#237'odo de altera'#231#245'es'
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
    Left = 173
    Top = 95
    Width = 75
    Height = 25
    Default = True
    ImageIndex = 9
    Images = frmPrincipal.ImageList16
    ModalResult = 1
    TabOrder = 1
    Kind = bkOK
  end
  object btnCancelar: TJvImgBtn
    Left = 254
    Top = 95
    Width = 75
    Height = 25
    Cancel = True
    ImageIndex = 8
    Images = frmPrincipal.ImageList16
    ModalResult = 2
    TabOrder = 2
    Kind = bkCancel
  end
  object JvEnterAsTab: TJvEnterAsTab
    Left = 64
    Top = 72
  end
end
