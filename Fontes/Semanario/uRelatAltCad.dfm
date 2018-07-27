object frmRelatAltCad: TfrmRelatAltCad
  Tag = 1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Hist'#243'rico de Altere'#231#245'es de Cadastro'
  ClientHeight = 232
  ClientWidth = 422
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnShow = FormShow
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
  object GroupBox2: TGroupBox
    Left = 8
    Top = 71
    Width = 321
    Height = 73
    Caption = 'Selecione um usu'#225'rio'
    TabOrder = 1
    object chkUsuario: TJvDBSearchComboBox
      Left = 13
      Top = 28
      Width = 292
      Height = 21
      DataField = 'usunome'
      DataSource = dsListaUsuarios
      Style = csDropDownList
      TabOrder = 0
      Text = ''
    end
  end
  object btnOk: TJvImgBtn
    Left = 8
    Top = 150
    Width = 75
    Height = 25
    Caption = 'OK'
    ImageIndex = 9
    Images = frmPrincipal.ImageList16
    TabOrder = 2
    OnClick = btnOkClick
  end
  object JvEnterAsTab: TJvEnterAsTab
    Left = 352
    Top = 56
  end
  object dsListaUsuarios: TDataSource
    DataSet = dmDadosRelat.cdsUsuarios
    Left = 152
    Top = 88
  end
end
