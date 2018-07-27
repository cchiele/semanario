object frmRenovarAssinaturasAuto: TfrmRenovarAssinaturasAuto
  Left = 445
  Top = 171
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Renova'#231#227'o autom'#225'tica de assinaturas'
  ClientHeight = 323
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
  object JvInstallLabel1: TJvInstallLabel
    Left = 8
    Top = 8
    Width = 325
    Height = 65
    Lines.Strings = (
      'Ir'#225' renovar a assinatura para todos os assinantes ativos,'
      'com assinaturas com vencimento no per'#237'odo informado e'
      'que a assinatura n'#227'o esteja cancelada.')
    LineSpacing = 5
  end
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 325
    Height = 65
  end
  object btnOkAssinante: TJvImgBtn
    Left = 178
    Top = 287
    Width = 75
    Height = 25
    Default = True
    ImageIndex = 9
    Images = frmPrincipal.ImageList16
    ModalResult = 1
    TabOrder = 2
    OnClick = btnOkAssinanteClick
    Kind = bkOK
  end
  object btnCancelarAssinante: TJvImgBtn
    Left = 259
    Top = 287
    Width = 75
    Height = 25
    Cancel = True
    ImageIndex = 8
    Images = frmPrincipal.ImageList16
    ModalResult = 2
    TabOrder = 3
    Kind = bkCancel
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 79
    Width = 325
    Height = 74
    Caption = 'Informe o per'#237'odo de vencimento'
    TabOrder = 0
    object Label1: TLabel
      Left = 64
      Top = 21
      Width = 19
      Height = 13
      Caption = 'M'#234's'
    end
    object Label2: TLabel
      Left = 192
      Top = 21
      Width = 19
      Height = 13
      Caption = 'Ano'
    end
    object Label3: TLabel
      Left = 170
      Top = 43
      Width = 4
      Height = 13
      Caption = '/'
    end
    object cbxMeses: TComboBox
      Left = 64
      Top = 40
      Width = 89
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Mar'#231'o'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
    object cbxAno: TComboBox
      Left = 191
      Top = 40
      Width = 60
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 159
    Width = 326
    Height = 114
    TabOrder = 1
    object Label4: TLabel
      Left = 16
      Top = 50
      Width = 97
      Height = 13
      Caption = 'Valor da renova'#231#227'o:'
    end
    object Label5: TLabel
      Left = 16
      Top = 77
      Width = 89
      Height = 13
      Caption = 'N'#250'mero de meses:'
    end
    object Label6: TLabel
      Left = 16
      Top = 23
      Width = 50
      Height = 13
      Caption = 'Vendedor:'
    end
    object edtValor: TEdit
      Left = 119
      Top = 47
      Width = 81
      Height = 21
      TabOrder = 1
      Text = '0'
    end
    object edtNroMeses: TSpinEdit
      Left = 119
      Top = 74
      Width = 81
      Height = 22
      MaxValue = 99
      MinValue = 1
      TabOrder = 2
      Value = 12
    end
    object chkVendedor: TJvDBSearchComboBox
      Left = 119
      Top = 20
      Width = 194
      Height = 21
      DataField = 'vennome'
      DataSource = dsVendedores
      Style = csDropDownList
      TabOrder = 0
      Text = ''
    end
  end
  object JvEnterAsTab: TJvEnterAsTab
    Left = 40
    Top = 272
  end
  object dsVendedores: TDataSource
    DataSet = dmDadosVendedores.cdsListaVendedores
    Left = 272
    Top = 215
  end
end
