object frmAlterarSenha: TfrmAlterarSenha
  Left = 412
  Top = 177
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Alterar senha do usu'#225'rio'
  ClientHeight = 189
  ClientWidth = 342
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object edtSenhaAtual: TLabeledEdit
    Left = 128
    Top = 16
    Width = 185
    Height = 21
    EditLabel.Width = 61
    EditLabel.Height = 13
    EditLabel.Caption = 'Senha atual:'
    LabelPosition = lpLeft
    PasswordChar = '*'
    TabOrder = 0
  end
  object edtNovaSenha: TLabeledEdit
    Left = 128
    Top = 64
    Width = 185
    Height = 21
    EditLabel.Width = 61
    EditLabel.Height = 13
    EditLabel.Caption = 'Nova senha:'
    LabelPosition = lpLeft
    PasswordChar = '*'
    TabOrder = 1
  end
  object edtNovaSenhaRepetir: TLabeledEdit
    Left = 128
    Top = 112
    Width = 185
    Height = 21
    EditLabel.Width = 98
    EditLabel.Height = 13
    EditLabel.Caption = 'Repetir nova senha:'
    LabelPosition = lpLeft
    PasswordChar = '*'
    TabOrder = 2
  end
  object btnOk: TJvImgBtn
    Left = 157
    Top = 156
    Width = 75
    Height = 25
    ModalResult = 1
    TabOrder = 3
    OnClick = btnOkClick
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    Kind = bkOK
  end
  object btnCancelar: TJvImgBtn
    Left = 238
    Top = 156
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    ModalResult = 2
    TabOrder = 4
    HotTrackFont.Charset = DEFAULT_CHARSET
    HotTrackFont.Color = clWindowText
    HotTrackFont.Height = -11
    HotTrackFont.Name = 'Tahoma'
    HotTrackFont.Style = []
    Kind = bkCancel
  end
  object JvEnterAsTab: TJvEnterAsTab
    Left = 24
    Top = 24
  end
end
