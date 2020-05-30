object frmCadAssinantes: TfrmCadAssinantes
  Tag = 1
  Left = 244
  Top = 110
  Caption = 'Cadastro de Assinantes'
  ClientHeight = 579
  ClientWidth = 1030
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object pnlManutencaoAssinante: TPanel
    Left = 0
    Top = 0
    Width = 1030
    Height = 579
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 1010
    object Label21: TLabel
      Left = 41
      Top = 23
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
      FocusControl = DBEdit20
    end
    object Label22: TLabel
      Left = 41
      Top = 50
      Width = 31
      Height = 13
      Caption = 'Nome:'
      FocusControl = DBEditNome
    end
    object Label23: TLabel
      Left = 713
      Top = 50
      Width = 23
      Height = 13
      Caption = 'CPF:'
      FocusControl = DBEdit22
    end
    object Label24: TLabel
      Left = 41
      Top = 77
      Width = 64
      Height = 13
      Caption = 'Raz'#227'o Social:'
      FocusControl = DBEdit23
    end
    object Label25: TLabel
      Left = 713
      Top = 77
      Width = 29
      Height = 13
      Caption = 'CNPJ:'
      FocusControl = DBEdit24
    end
    object Label27: TLabel
      Left = 41
      Top = 105
      Width = 35
      Height = 13
      Caption = 'Status:'
      FocusControl = DBLookupComboBox1
    end
    object Label28: TLabel
      Left = 241
      Top = 104
      Width = 62
      Height = 13
      Caption = 'Data inativo:'
      FocusControl = DBEdtDataInativo
    end
    object Label30: TLabel
      Left = 434
      Top = 104
      Width = 84
      Height = 13
      Caption = 'Data nascimento:'
      FocusControl = JvDBDateEdit1
    end
    object Label26: TLabel
      Left = 658
      Top = 104
      Width = 85
      Height = 13
      Caption = 'Imprimir etiqueta:'
      FocusControl = DBLookupComboBox2
    end
    object Label36: TLabel
      Left = 41
      Top = 132
      Width = 49
      Height = 13
      Caption = 'Cobrador:'
      FocusControl = DBLookupComboBox3
    end
    object Label37: TLabel
      Left = 503
      Top = 132
      Width = 50
      Height = 13
      Caption = 'Vendedor:'
      FocusControl = DBLookupComboBox4
    end
    object Label41: TLabel
      Left = 41
      Top = 321
      Width = 117
      Height = 13
      Caption = 'Endere'#231'o para cobran'#231'a'
      FocusControl = DBEdit35
    end
    object Label42: TLabel
      Left = 41
      Top = 369
      Width = 28
      Height = 13
      Caption = 'E-mail'
      FocusControl = DBEdit36
    end
    object Label43: TLabel
      Left = 41
      Top = 417
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
      FocusControl = DBEdit37
    end
    object Label49: TLabel
      Left = 677
      Top = 48
      Width = 15
      Height = 16
      AutoSize = False
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label50: TLabel
      Left = 212
      Top = 104
      Width = 15
      Height = 16
      AutoSize = False
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label51: TLabel
      Left = 807
      Top = 104
      Width = 15
      Height = 16
      AutoSize = False
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label52: TLabel
      Left = 472
      Top = 131
      Width = 15
      Height = 16
      AutoSize = False
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label53: TLabel
      Left = 924
      Top = 131
      Width = 15
      Height = 16
      AutoSize = False
      Caption = '*'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object SpeedButton2: TSpeedButton
      Left = 449
      Top = 128
      Width = 23
      Height = 22
      Action = ActionAtualizarCampoCobrador
      Flat = True
      ParentShowHint = False
      ShowHint = True
    end
    object SpeedButton3: TSpeedButton
      Left = 901
      Top = 127
      Width = 23
      Height = 22
      Action = ActionAtualizarCampoVendedor
      Flat = True
      ParentShowHint = False
      ShowHint = True
    end
    object Panel6: TPanel
      Left = 1
      Top = 537
      Width = 1028
      Height = 41
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 16
      ExplicitWidth = 1008
      DesignSize = (
        1028
        41)
      object Label29: TLabel
        Left = 874
        Top = 11
        Width = 145
        Height = 16
        Anchors = [akTop, akRight]
        Caption = '* Campos obrigat'#243'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 819
      end
      object btnOkAssinante: TJvImgBtn
        Left = 40
        Top = 8
        Width = 75
        Height = 25
        Action = ActionOkAssinante
        Default = True
        ImageIndex = 9
        Images = frmPrincipal.ImageList16
        ModalResult = 1
        TabOrder = 0
        Kind = bkOK
      end
      object btnCancelarAssinante: TJvImgBtn
        Left = 121
        Top = 8
        Width = 75
        Height = 25
        Action = ActionCancelarAssinante
        Cancel = True
        ImageIndex = 8
        Images = frmPrincipal.ImageList16
        ModalResult = 2
        TabOrder = 1
        Kind = bkCancel
      end
    end
    object DBEdit20: TDBEdit
      Left = 108
      Top = 20
      Width = 81
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'asscod'
      DataSource = dsTblass
      ReadOnly = True
      TabOrder = 0
    end
    object DBEditNome: TDBEdit
      Left = 108
      Top = 47
      Width = 565
      Height = 21
      CharCase = ecUpperCase
      DataField = 'assnome'
      DataSource = dsTblass
      TabOrder = 1
    end
    object DBEdit22: TDBEdit
      Left = 748
      Top = 47
      Width = 89
      Height = 21
      DataField = 'asscpf'
      DataSource = dsTblass
      TabOrder = 2
    end
    object DBEdit23: TDBEdit
      Left = 108
      Top = 74
      Width = 565
      Height = 21
      CharCase = ecUpperCase
      DataField = 'assrazaosocial'
      DataSource = dsTblass
      TabOrder = 3
    end
    object DBEdit24: TDBEdit
      Left = 748
      Top = 74
      Width = 106
      Height = 21
      DataField = 'asscnpj'
      DataSource = dsTblass
      TabOrder = 4
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 108
      Top = 101
      Width = 101
      Height = 21
      DataField = 'LookupStatus'
      DataSource = dsTblass
      TabOrder = 5
      OnClick = DBLookupComboBox1Click
    end
    object JvDBDateEdit1: TJvDBDateEdit
      Left = 524
      Top = 101
      Width = 97
      Height = 21
      DataField = 'assdtnasc'
      DataSource = dsTblass
      CheckOnExit = True
      ShowNullDate = False
      TabOrder = 7
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 748
      Top = 101
      Width = 55
      Height = 21
      DataField = 'LookupImpretiq'
      DataSource = dsTblass
      TabOrder = 8
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 108
      Top = 128
      Width = 341
      Height = 21
      DataField = 'LookupCobcod'
      DataSource = dsTblass
      TabOrder = 9
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 559
      Top = 128
      Width = 341
      Height = 21
      DataField = 'LookupVencod'
      DataSource = dsTblass
      TabOrder = 10
    end
    object GroupBox4: TGroupBox
      Left = 41
      Top = 163
      Width = 896
      Height = 139
      Caption = 'Endere'#231'o para entrega'
      TabOrder = 11
      object Label31: TLabel
        Left = 15
        Top = 28
        Width = 49
        Height = 13
        Caption = 'Endere'#231'o:'
        FocusControl = dbedtRdzcod
      end
      object btnPesquisarEndereco: TSpeedButton
        Left = 132
        Top = 24
        Width = 23
        Height = 22
        Hint = 'Clique aqui ou pressione F3 para pesquisar endere'#231'os.'
        Caption = '...'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnPesquisarEnderecoClick
      end
      object Label39: TLabel
        Left = 15
        Top = 55
        Width = 28
        Height = 13
        Caption = 'Zona:'
        FocusControl = DBEdit27
      end
      object Label32: TLabel
        Left = 755
        Top = 28
        Width = 41
        Height = 13
        Caption = 'N'#250'mero:'
        FocusControl = DBEdit29
      end
      object Label34: TLabel
        Left = 399
        Top = 80
        Width = 32
        Height = 13
        Caption = 'Bairro:'
        FocusControl = DBEdit31
      end
      object Label33: TLabel
        Left = 15
        Top = 79
        Width = 69
        Height = 13
        Caption = 'Complemento:'
        FocusControl = DBEdit30
      end
      object Label35: TLabel
        Left = 15
        Top = 107
        Width = 23
        Height = 13
        Caption = 'CEP:'
        FocusControl = DBEditCEP
      end
      object Label38: TLabel
        Left = 384
        Top = 107
        Width = 47
        Height = 13
        Caption = 'Munic'#237'pio:'
        FocusControl = DBEditMunicipio
      end
      object Label40: TLabel
        Left = 779
        Top = 107
        Width = 17
        Height = 13
        Caption = 'UF:'
        FocusControl = DBEditUF
      end
      object Label54: TLabel
        Left = 725
        Top = 28
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label55: TLabel
        Left = 872
        Top = 27
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label57: TLabel
        Left = 152
        Top = 107
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedtRdzcod: TDBEdit
        Left = 87
        Top = 25
        Width = 46
        Height = 21
        DataField = 'rdzcod'
        DataSource = dsTblass
        TabOrder = 0
        OnKeyDown = dbedtRdzcodKeyDown
      end
      object DBEditEndereco: TDBEdit
        Left = 159
        Top = 25
        Width = 562
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'rdzender'
        DataSource = dsRuaZona
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit27: TDBEdit
        Left = 128
        Top = 52
        Width = 743
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'zondescr'
        DataSource = dsRuaZona
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit29: TDBEdit
        Left = 802
        Top = 25
        Width = 69
        Height = 21
        CharCase = ecUpperCase
        DataField = 'assnroent'
        DataSource = dsTblass
        TabOrder = 2
      end
      object DBEdit31: TDBEdit
        Left = 437
        Top = 77
        Width = 361
        Height = 21
        CharCase = ecUpperCase
        DataField = 'assbairroent'
        DataSource = dsTblass
        TabOrder = 5
      end
      object DBEdit30: TDBEdit
        Left = 87
        Top = 77
        Width = 281
        Height = 21
        CharCase = ecUpperCase
        DataField = 'asscomplent'
        DataSource = dsTblass
        TabOrder = 4
      end
      object DBEditCEP: TDBEdit
        Left = 87
        Top = 104
        Width = 63
        Height = 21
        DataField = 'cepcepent'
        DataSource = dsTblass
        TabOrder = 6
      end
      object DBEditMunicipio: TDBEdit
        Left = 437
        Top = 104
        Width = 325
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'cepmunicipio'
        DataSource = dsTblcep
        ReadOnly = True
        TabOrder = 7
      end
      object DBEditUF: TDBEdit
        Left = 802
        Top = 104
        Width = 30
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'cepeuf'
        DataSource = dsTblcep
        ReadOnly = True
        TabOrder = 8
      end
      object DBEdit1: TDBEdit
        Left = 87
        Top = 52
        Width = 35
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'zoncod'
        DataSource = dsRuaZona
        ReadOnly = True
        TabOrder = 9
      end
      object btnConsultaCep: TJvImgBtn
        Left = 169
        Top = 103
        Width = 167
        Height = 24
        Hint = 
          'Clique aqui para encontrar o CEP atrav'#233's do endere'#231'o do assinant' +
          'e'
        Caption = 'Buscar CEP pelo Endere'#231'o'
        ImageIndex = 3
        Images = frmPrincipal.ImageList16
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        TabStop = False
        OnClick = btnConsultaCepClick
      end
    end
    object DBEdit35: TDBEdit
      Left = 41
      Top = 337
      Width = 600
      Height = 21
      CharCase = ecUpperCase
      DataField = 'assendercobr'
      DataSource = dsTblass
      TabOrder = 12
    end
    object DBEdit36: TDBEdit
      Left = 41
      Top = 385
      Width = 600
      Height = 21
      CharCase = ecLowerCase
      DataField = 'assemail'
      DataSource = dsTblass
      TabOrder = 13
    end
    object DBEdit37: TDBEdit
      Left = 41
      Top = 432
      Width = 600
      Height = 21
      CharCase = ecUpperCase
      DataField = 'assobs'
      DataSource = dsTblass
      TabOrder = 14
    end
    object GroupBox5: TGroupBox
      Left = 652
      Top = 321
      Width = 285
      Height = 134
      Caption = 'Telefones'
      TabOrder = 15
      object Label44: TLabel
        Left = 16
        Top = 23
        Width = 50
        Height = 13
        Caption = 'Comercial:'
        FocusControl = DBEdit38
      end
      object Label45: TLabel
        Left = 16
        Top = 50
        Width = 57
        Height = 13
        Caption = 'Residencial:'
        FocusControl = DBEdit40
      end
      object Label46: TLabel
        Left = 16
        Top = 77
        Width = 22
        Height = 13
        Caption = 'Fax:'
        FocusControl = DBEdit40
      end
      object Label47: TLabel
        Left = 16
        Top = 104
        Width = 37
        Height = 13
        Caption = 'Celular:'
        FocusControl = DBEdit42
      end
      object Label48: TLabel
        Left = 171
        Top = 23
        Width = 33
        Height = 13
        Caption = 'Ramal:'
        FocusControl = DBEdit42
      end
      object DBEdit38: TDBEdit
        Left = 75
        Top = 20
        Width = 86
        Height = 21
        DataField = 'assfonecomer'
        DataSource = dsTblass
        TabOrder = 0
      end
      object DBEdit39: TDBEdit
        Left = 210
        Top = 20
        Width = 58
        Height = 21
        DataField = 'assfonecomerramal'
        DataSource = dsTblass
        TabOrder = 1
      end
      object DBEdit40: TDBEdit
        Left = 75
        Top = 47
        Width = 86
        Height = 21
        DataField = 'assfoneresid'
        DataSource = dsTblass
        TabOrder = 2
      end
      object DBEdit41: TDBEdit
        Left = 75
        Top = 74
        Width = 86
        Height = 21
        DataField = 'assfonefax'
        DataSource = dsTblass
        TabOrder = 3
      end
      object DBEdit42: TDBEdit
        Left = 75
        Top = 101
        Width = 86
        Height = 21
        DataField = 'assfonecelul'
        DataSource = dsTblass
        TabOrder = 4
      end
    end
    object DBEdtDataInativo: TJvDBDateEdit
      Left = 307
      Top = 101
      Width = 97
      Height = 21
      DataField = 'assdtinativo'
      DataSource = dsTblass
      CheckOnExit = True
      ShowNullDate = False
      TabOrder = 6
    end
  end
  object pnlManutencaoAssinatura: TPanel
    Left = 0
    Top = 0
    Width = 1030
    Height = 579
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 2
    ExplicitWidth = 1010
    object Panel7: TPanel
      Left = 1
      Top = 537
      Width = 1028
      Height = 41
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 4
      ExplicitWidth = 1008
      DesignSize = (
        1028
        41)
      object Label58: TLabel
        Left = 1047
        Top = 11
        Width = 145
        Height = 16
        Anchors = [akTop, akRight]
        Caption = '* Campos obrigat'#243'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 819
      end
      object Label59: TLabel
        Left = 869
        Top = 11
        Width = 145
        Height = 16
        Anchors = [akTop, akRight]
        Caption = '* Campos obrigat'#243'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 732
      end
      object JvImgBtn7: TJvImgBtn
        Left = 40
        Top = 8
        Width = 75
        Height = 25
        Action = ActionOkAssinatura
        Default = True
        ImageIndex = 9
        Images = frmPrincipal.ImageList16
        ModalResult = 1
        TabOrder = 0
        Kind = bkOK
      end
      object JvImgBtn8: TJvImgBtn
        Left = 121
        Top = 8
        Width = 75
        Height = 25
        Action = ActionCancelarAssinatura
        Cancel = True
        ImageIndex = 8
        Images = frmPrincipal.ImageList16
        ModalResult = 2
        TabOrder = 1
        Kind = bkCancel
      end
    end
    object GroupBox6: TGroupBox
      Left = 41
      Top = 19
      Width = 776
      Height = 86
      Caption = 'Assinante'
      TabOrder = 0
      object Label60: TLabel
        Left = 15
        Top = 26
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
        FocusControl = DBEdit21
      end
      object Label61: TLabel
        Left = 15
        Top = 52
        Width = 31
        Height = 13
        Caption = 'Nome:'
        FocusControl = DBEdit43
      end
      object DBEdit21: TDBEdit
        Left = 58
        Top = 22
        Width = 74
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'asscod'
        DataSource = dsTblass
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit43: TDBEdit
        Left = 58
        Top = 49
        Width = 626
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'assnome'
        DataSource = dsTblass
        ReadOnly = True
        TabOrder = 1
      end
    end
    object GroupBox7: TGroupBox
      Left = 41
      Top = 111
      Width = 456
      Height = 281
      Caption = 'Assinatura'
      TabOrder = 1
      object Label62: TLabel
        Left = 15
        Top = 28
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
        FocusControl = DBEdit44
      end
      object Label65: TLabel
        Left = 15
        Top = 82
        Width = 81
        Height = 13
        Caption = 'Data Assinatura:'
        FocusControl = JvDBDateEdit2
      end
      object Label66: TLabel
        Left = 15
        Top = 109
        Width = 85
        Height = 13
        Caption = 'Data Vencimento:'
        FocusControl = JvDBDateEdit3
      end
      object Label67: TLabel
        Left = 15
        Top = 140
        Width = 82
        Height = 13
        Caption = 'Valor Assinatura:'
        FocusControl = DBEdit48
      end
      object Label68: TLabel
        Left = 15
        Top = 195
        Width = 77
        Height = 13
        Caption = 'Valor Pendente:'
        FocusControl = DBEdit49
      end
      object Label71: TLabel
        Left = 15
        Top = 223
        Width = 54
        Height = 13
        Caption = 'Cancelada:'
        FocusControl = DBLookupComboBox6
      end
      object Label64: TLabel
        Left = 15
        Top = 54
        Width = 93
        Height = 13
        Caption = 'Tipo de Assinatura:'
        FocusControl = DBLookupComboBoxTipo
      end
      object Label63: TLabel
        Left = 256
        Top = 57
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label69: TLabel
        Left = 218
        Top = 84
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label70: TLabel
        Left = 218
        Top = 109
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label72: TLabel
        Left = 218
        Top = 142
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label73: TLabel
        Left = 185
        Top = 224
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 225
        Top = 223
        Width = 111
        Height = 13
        Caption = 'Data de cancelamento:'
        FocusControl = DBLookupComboBox6
      end
      object Label9: TLabel
        Left = 15
        Top = 167
        Width = 76
        Height = 13
        Caption = 'Valor Desconto:'
        FocusControl = DBEdit4
      end
      object Label10: TLabel
        Left = 218
        Top = 169
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 15
        Top = 249
        Width = 44
        Height = 13
        Caption = 'Cortesia:'
        FocusControl = DBLookupComboBox6
      end
      object Label14: TLabel
        Left = 185
        Top = 251
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit44: TDBEdit
        Left = 115
        Top = 25
        Width = 61
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'adacod'
        DataSource = dsTblada
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit48: TDBEdit
        Left = 115
        Top = 137
        Width = 97
        Height = 21
        DataField = 'adavl'
        DataSource = dsTblada
        TabOrder = 4
      end
      object DBEdit49: TDBEdit
        Left = 115
        Top = 192
        Width = 97
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'adavlpend'
        DataSource = dsTblada
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object DBLookupComboBox6: TDBLookupComboBox
        Left = 115
        Top = 219
        Width = 64
        Height = 21
        DataField = 'LookupAdacancel'
        DataSource = dsTblada
        TabOrder = 7
        OnClick = DBLookupComboBox6Click
      end
      object DBLookupComboBoxTipo: TDBLookupComboBox
        Left = 115
        Top = 52
        Width = 135
        Height = 21
        DataField = 'LookupAdatipo'
        DataSource = dsTblada
        TabOrder = 1
      end
      object JvDBDateEdit2: TJvDBDateEdit
        Left = 115
        Top = 79
        Width = 97
        Height = 21
        DataField = 'adadtini'
        DataSource = dsTblada
        CheckOnExit = True
        ShowNullDate = False
        TabOrder = 2
      end
      object JvDBDateEdit3: TJvDBDateEdit
        Left = 115
        Top = 106
        Width = 97
        Height = 21
        DataField = 'adadtvenc'
        DataSource = dsTblada
        CheckOnExit = True
        ShowNullDate = False
        TabOrder = 3
      end
      object JvDBedtDataCancelamento: TJvDBDateEdit
        Left = 341
        Top = 219
        Width = 97
        Height = 21
        DataField = 'adadtcancel'
        DataSource = dsTblada
        CheckOnExit = True
        ShowNullDate = False
        TabOrder = 8
      end
      object DBEdit4: TDBEdit
        Left = 115
        Top = 164
        Width = 97
        Height = 21
        DataField = 'adavldesc'
        DataSource = dsTblada
        TabOrder = 5
      end
      object DBLookupComboBox5: TDBLookupComboBox
        Left = 115
        Top = 246
        Width = 64
        Height = 21
        DataField = 'LookupAdacortesia'
        DataSource = dsTblada
        TabOrder = 9
      end
    end
    object GroupBox8: TGroupBox
      Left = 41
      Top = 398
      Width = 776
      Height = 56
      Caption = 'Observa'#231#227'o'
      TabOrder = 2
      object DBEdit50: TDBEdit
        Left = 12
        Top = 21
        Width = 749
        Height = 21
        DataField = 'adaobs'
        DataSource = dsTblada
        TabOrder = 0
      end
    end
    object GroupBox17: TGroupBox
      Left = 503
      Top = 111
      Width = 314
      Height = 281
      Caption = 'Condi'#231#245'es de Pagamento'
      Padding.Left = 5
      Padding.Right = 5
      Padding.Bottom = 5
      TabOrder = 3
      object Label12: TLabel
        Left = 8
        Top = 28
        Width = 71
        Height = 13
        Caption = 'Qtde Parcelas:'
        FocusControl = DBEdit44
      end
      object Label13: TLabel
        Left = 8
        Top = 55
        Width = 73
        Height = 13
        Caption = '1'#186' Vencimento:'
        FocusControl = DBEdit44
      end
      object edtPrimeiroVenc: TJvDateEdit
        Left = 85
        Top = 52
        Width = 97
        Height = 21
        ShowNullDate = False
        TabOrder = 1
      end
      object btnGerarParcelas: TJvImgBtn
        Left = 201
        Top = 21
        Width = 105
        Height = 52
        Caption = 'Gerar Parcelas'
        ImageIndex = 2
        Images = ImageListGrid
        TabOrder = 2
        OnClick = btnGerarParcelasClick
      end
      object DBGridParcelas: TDBGrid
        Left = 7
        Top = 109
        Width = 300
        Height = 165
        Align = alBottom
        DataSource = dsTblcpa
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'cpanroparc'
            ReadOnly = True
            Title.Caption = 'Parc.'
            Width = 29
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'cpadtvenc'
            Title.Alignment = taCenter
            Title.Caption = 'Data Vencimento'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cpavl'
            Title.Alignment = taRightJustify
            Title.Caption = 'Valor da Parcela'
            Width = 118
            Visible = True
          end>
      end
      object edtQtdeParcelas: TJvSpinEdit
        Left = 85
        Top = 24
        Width = 41
        Height = 21
        MaxValue = 5.000000000000000000
        Value = 4.000000000000000000
        TabOrder = 0
      end
    end
  end
  object pnlManutencaoBaixa: TPanel
    Left = 0
    Top = 0
    Width = 1030
    Height = 579
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 3
    ExplicitWidth = 1010
    object Panel9: TPanel
      Left = 1
      Top = 537
      Width = 1028
      Height = 41
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 3
      ExplicitWidth = 1008
      DesignSize = (
        1028
        41)
      object Label74: TLabel
        Left = 1047
        Top = 11
        Width = 145
        Height = 16
        Anchors = [akTop, akRight]
        Caption = '* Campos obrigat'#243'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 819
      end
      object Label75: TLabel
        Left = 869
        Top = 11
        Width = 145
        Height = 16
        Anchors = [akTop, akRight]
        Caption = '* Campos obrigat'#243'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 732
      end
      object JvImgBtn9: TJvImgBtn
        Left = 40
        Top = 8
        Width = 75
        Height = 25
        Action = ActionOkBaixa
        Default = True
        ImageIndex = 9
        Images = frmPrincipal.ImageList16
        ModalResult = 1
        TabOrder = 0
        Kind = bkOK
      end
      object JvImgBtn10: TJvImgBtn
        Left = 121
        Top = 8
        Width = 75
        Height = 25
        Action = ActionCancelarBaixa
        Cancel = True
        ImageIndex = 8
        Images = frmPrincipal.ImageList16
        ModalResult = 2
        TabOrder = 1
        Kind = bkCancel
      end
    end
    object GroupBox9: TGroupBox
      Left = 41
      Top = 19
      Width = 704
      Height = 86
      Caption = 'Assinante'
      TabOrder = 0
      object Label76: TLabel
        Left = 15
        Top = 26
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
        FocusControl = DBEdit45
      end
      object Label77: TLabel
        Left = 15
        Top = 52
        Width = 31
        Height = 13
        Caption = 'Nome:'
        FocusControl = DBEdit46
      end
      object DBEdit45: TDBEdit
        Left = 58
        Top = 22
        Width = 74
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'asscod'
        DataSource = dsTblass
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit46: TDBEdit
        Left = 58
        Top = 49
        Width = 626
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'assnome'
        DataSource = dsTblass
        ReadOnly = True
        TabOrder = 1
      end
    end
    object GroupBox10: TGroupBox
      Left = 41
      Top = 111
      Width = 704
      Height = 117
      Caption = 'Assinatura'
      TabOrder = 1
      object Label78: TLabel
        Left = 15
        Top = 28
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
        FocusControl = DBEdit47
      end
      object Label79: TLabel
        Left = 15
        Top = 56
        Width = 81
        Height = 13
        Caption = 'Data Assinatura:'
      end
      object Label80: TLabel
        Left = 229
        Top = 55
        Width = 85
        Height = 13
        Caption = 'Data Vencimento:'
      end
      object Label81: TLabel
        Left = 14
        Top = 84
        Width = 82
        Height = 13
        Caption = 'Valor Assinatura:'
        FocusControl = DBEdit51
      end
      object Label82: TLabel
        Left = 229
        Top = 83
        Width = 77
        Height = 13
        Caption = 'Valor Pendente:'
        FocusControl = DBEdit52
      end
      object Label84: TLabel
        Left = 229
        Top = 28
        Width = 24
        Height = 13
        Caption = 'Tipo:'
      end
      object DBEdit47: TDBEdit
        Left = 106
        Top = 25
        Width = 61
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'adacod'
        DataSource = dsTblada
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit51: TDBEdit
        Left = 106
        Top = 81
        Width = 97
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'adavl'
        DataSource = dsTblada
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit52: TDBEdit
        Left = 320
        Top = 80
        Width = 97
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'adavlpend'
        DataSource = dsTblada
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit53: TDBEdit
        Left = 320
        Top = 25
        Width = 119
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'CalcAdatipo'
        DataSource = dsTblada
        ReadOnly = True
        TabOrder = 3
      end
      object DBEdit54: TDBEdit
        Left = 106
        Top = 53
        Width = 68
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'adadtini'
        DataSource = dsTblada
        ReadOnly = True
        TabOrder = 4
      end
      object DBEdit55: TDBEdit
        Left = 320
        Top = 53
        Width = 68
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'adadtvenc'
        DataSource = dsTblada
        ReadOnly = True
        TabOrder = 5
      end
    end
    object GroupBox11: TGroupBox
      Left = 41
      Top = 234
      Width = 704
      Height = 98
      Caption = 'Baixa'
      TabOrder = 2
      object Label86: TLabel
        Left = 196
        Top = 55
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label83: TLabel
        Left = 15
        Top = 27
        Width = 71
        Height = 13
        Caption = 'Data da Baixa:'
      end
      object Label85: TLabel
        Left = 15
        Top = 56
        Width = 72
        Height = 13
        Caption = 'Valor da Baixa:'
        FocusControl = dbedtValorBaixa
      end
      object dbedtValorBaixa: TDBEdit
        Left = 94
        Top = 53
        Width = 96
        Height = 21
        DataField = 'bdavl'
        DataSource = dsTblbda
        TabOrder = 1
      end
      object dbedtDataBaixa: TJvDBDateEdit
        Left = 93
        Top = 25
        Width = 97
        Height = 21
        TabStop = False
        DataField = 'bdadt'
        DataSource = dsTblbda
        ReadOnly = True
        CheckOnExit = True
        Color = clBtnFace
        ShowNullDate = False
        TabOrder = 0
      end
    end
  end
  object pnlManutencaoHistorico: TPanel
    Left = 0
    Top = 0
    Width = 1030
    Height = 579
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 4
    ExplicitWidth = 1010
    object GroupBox12: TGroupBox
      Left = 49
      Top = 27
      Width = 704
      Height = 86
      Caption = 'Assinante'
      TabOrder = 0
      object Label2: TLabel
        Left = 15
        Top = 26
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 15
        Top = 52
        Width = 31
        Height = 13
        Caption = 'Nome:'
        FocusControl = DBEdit3
      end
      object DBEdit2: TDBEdit
        Left = 58
        Top = 22
        Width = 74
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'asscod'
        DataSource = dsTblass
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit3: TDBEdit
        Left = 58
        Top = 49
        Width = 626
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'assnome'
        DataSource = dsTblass
        ReadOnly = True
        TabOrder = 1
      end
    end
    object Panel12: TPanel
      Left = 1
      Top = 537
      Width = 1028
      Height = 41
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
      ExplicitWidth = 1008
      DesignSize = (
        1028
        41)
      object Label4: TLabel
        Left = 1047
        Top = 11
        Width = 145
        Height = 16
        Anchors = [akTop, akRight]
        Caption = '* Campos obrigat'#243'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 819
      end
      object Label5: TLabel
        Left = 869
        Top = 11
        Width = 145
        Height = 16
        Anchors = [akTop, akRight]
        Caption = '* Campos obrigat'#243'rios'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = 732
      end
      object JvImgBtn14: TJvImgBtn
        Left = 40
        Top = 8
        Width = 75
        Height = 25
        Action = ActionOkHistorico
        Default = True
        ImageIndex = 9
        Images = frmPrincipal.ImageList16
        ModalResult = 1
        TabOrder = 0
        Kind = bkOK
      end
      object JvImgBtn15: TJvImgBtn
        Left = 121
        Top = 8
        Width = 75
        Height = 25
        Action = ActionCancelarHistorico
        Cancel = True
        ImageIndex = 8
        Images = frmPrincipal.ImageList16
        ModalResult = 2
        TabOrder = 1
        Kind = bkCancel
      end
    end
    object GroupBox13: TGroupBox
      Left = 49
      Top = 126
      Width = 704
      Height = 228
      Caption = 'Hist'#243'rico / Anota'#231#227'o'
      TabOrder = 2
      object Label6: TLabel
        Left = 26
        Top = 35
        Width = 27
        Height = 13
        Caption = 'Data:'
        FocusControl = JvDBDateEdit4
      end
      object Label7: TLabel
        Left = 162
        Top = 36
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 686
        Top = 67
        Width = 15
        Height = 16
        AutoSize = False
        Caption = '*'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object JvDBDateEdit4: TJvDBDateEdit
        Left = 59
        Top = 33
        Width = 97
        Height = 21
        DataField = 'hasdt'
        DataSource = dsTblhas
        CheckOnExit = True
        ShowNullDate = False
        TabOrder = 0
      end
      object DBMemoHasdescr: TDBMemo
        Left = 26
        Top = 70
        Width = 655
        Height = 131
        DataField = 'hasdescr'
        DataSource = dsTblhas
        TabOrder = 1
      end
    end
  end
  object pnlConsulta: TPanel
    Left = 0
    Top = 0
    Width = 1030
    Height = 579
    Align = alClient
    Color = clWindow
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 1010
    object GroupBox2: TGroupBox
      Left = 6
      Top = 62
      Width = 1018
      Height = 511
      Align = alClient
      Caption = 'Resultado da pesquisa'
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      TabOrder = 1
      ExplicitWidth = 998
      object dbGridAssinantes: TDBGrid
        Left = 7
        Top = 20
        Width = 1004
        Height = 216
        Align = alClient
        DataSource = dsTblass
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDrawColumnCell = dbGridAssinantesDrawColumnCell
        OnDblClick = dbGridAssinantesDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'asscod'
            Title.Caption = 'C'#243'digo'
            Width = 56
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'assnome'
            Title.Caption = 'Nome'
            Width = 371
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'assfonecelul'
            Title.Caption = 'Fone Celular'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'assfoneresid'
            Title.Caption = 'Fone Residencial'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CalcFonecomerCompleto'
            Title.Caption = 'Fone Comercial'
            Width = 119
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CalcDescrStatus'
            Title.Caption = 'Status'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CalcCodigoDescrZona'
            Title.Caption = 'Zona'
            Width = 217
            Visible = True
          end>
      end
      object PageControl: TPageControl
        Left = 7
        Top = 267
        Width = 1004
        Height = 237
        ActivePage = TabSheetAssinaturas
        Align = alBottom
        TabOrder = 1
        ExplicitWidth = 984
        object TabSheetAssinaturas: TTabSheet
          Caption = 'Assinaturas'
          ImageIndex = 1
          ExplicitWidth = 976
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 692
            Height = 209
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            ExplicitWidth = 672
            object Panel3: TPanel
              Left = 0
              Top = 180
              Width = 692
              Height = 29
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 0
              ExplicitWidth = 672
              object JvImgBtn1: TJvImgBtn
                Left = 0
                Top = 3
                Width = 75
                Height = 25
                Action = ActionNovaAssinatura
                ImageIndex = 0
                Images = frmPrincipal.ImageList16
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
              end
              object JvImgBtn2: TJvImgBtn
                Left = 81
                Top = 3
                Width = 75
                Height = 25
                Action = ActionEditarAssinatura
                ImageIndex = 1
                Images = frmPrincipal.ImageList16
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
              end
              object JvImgBtn3: TJvImgBtn
                Left = 162
                Top = 3
                Width = 75
                Height = 25
                Action = ActionExcluirAssinatura
                ImageIndex = 2
                Images = frmPrincipal.ImageList16
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
              end
            end
            object GroupBox14: TGroupBox
              Left = 488
              Top = 0
              Width = 204
              Height = 180
              Align = alRight
              Caption = 'Condi'#231#245'es de Pagamento'
              TabOrder = 1
              ExplicitLeft = 468
              object DBGridCondicoes: TDBGrid
                Left = 2
                Top = 15
                Width = 200
                Height = 163
                Align = alClient
                DataSource = dsTblcpa
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'cpanroparc'
                    Title.Caption = ' '
                    Width = 16
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'cpadtvenc'
                    Title.Alignment = taCenter
                    Title.Caption = 'Data Venci.'
                    Width = 67
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'cpavl'
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Valor Parcela'
                    Width = 76
                    Visible = True
                  end>
              end
            end
            object GroupBox16: TGroupBox
              Left = 0
              Top = 0
              Width = 488
              Height = 180
              Align = alClient
              Caption = 'Assinaturas'
              TabOrder = 2
              ExplicitWidth = 468
              object DBGridAssinaturas: TDBGrid
                Left = 2
                Top = 15
                Width = 484
                Height = 163
                Align = alClient
                DataSource = dsTblada
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                OnDrawColumnCell = DBGridAssinaturasDrawColumnCell
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'adacod'
                    Title.Caption = 'Nro.'
                    Width = 30
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CalcAdatipo'
                    Title.Caption = 'Tipo'
                    Width = 74
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'adadtini'
                    Title.Alignment = taCenter
                    Title.Caption = 'Data In'#237'cio'
                    Width = 67
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'adadtvenc'
                    Title.Alignment = taCenter
                    Title.Caption = 'Data Venci.'
                    Width = 67
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'adavl'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clBlue
                    Font.Height = -11
                    Font.Name = 'Tahoma'
                    Font.Style = []
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Vl.Assinatura'
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'adavldesc'
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Vl.Desc.'
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'adavlpend'
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Vl.Pendente'
                    Width = 70
                    Visible = True
                  end
                  item
                    Alignment = taCenter
                    Expanded = False
                    FieldName = 'CalcAdacancel'
                    Title.Alignment = taCenter
                    Title.Caption = 'Cancelada'
                    Width = 59
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'adadtcancel'
                    Title.Caption = 'Dt.Cancel.'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'adaobs'
                    Title.Caption = 'Observa'#231#227'o'
                    Width = 400
                    Visible = True
                  end>
              end
            end
          end
          object Panel4: TPanel
            Left = 692
            Top = 0
            Width = 304
            Height = 209
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            ExplicitLeft = 672
            object Panel5: TPanel
              Left = 0
              Top = 179
              Width = 304
              Height = 30
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 0
              object JvImgBtn4: TJvImgBtn
                Left = 1
                Top = 4
                Width = 75
                Height = 25
                Action = ActionNovaBaixa
                ImageIndex = 0
                Images = frmPrincipal.ImageList16
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
              end
              object JvImgBtn5: TJvImgBtn
                Left = 82
                Top = 4
                Width = 75
                Height = 25
                Action = ActionEditarBaixa
                ImageIndex = 1
                Images = frmPrincipal.ImageList16
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
              end
              object JvImgBtn6: TJvImgBtn
                Left = 163
                Top = 4
                Width = 75
                Height = 25
                Action = ActionExcluirBaixa
                ImageIndex = 2
                Images = frmPrincipal.ImageList16
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
              end
            end
            object GroupBox15: TGroupBox
              Left = 0
              Top = 0
              Width = 304
              Height = 179
              Align = alClient
              Caption = 'Baixas'
              TabOrder = 1
              object DBGridBaixas: TDBGrid
                Left = 2
                Top = 15
                Width = 300
                Height = 162
                Align = alClient
                DataSource = dsTblbda
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'Tahoma'
                TitleFont.Style = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'bdacod'
                    Title.Caption = 'Cod.'
                    Width = 28
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'bdadt'
                    Title.Caption = 'Data Baixa'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'bdavl'
                    Title.Alignment = taRightJustify
                    Title.Caption = 'Valor Baixa'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'usunome'
                    Title.Caption = 'Usu'#225'rio da baixa'
                    Width = 100
                    Visible = True
                  end>
              end
            end
          end
        end
        object TabSheetHistorico: TTabSheet
          Caption = 'Hist'#243'rico do Assinante'
          ImageIndex = 1
          ExplicitWidth = 976
          object Splitter2: TSplitter
            Left = 696
            Top = 0
            Height = 209
            Align = alRight
            ExplicitLeft = 749
            ExplicitTop = -18
          end
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 209
            Align = alClient
            BevelOuter = bvNone
            Caption = 'Panel8'
            TabOrder = 0
            ExplicitWidth = 676
            object Panel11: TPanel
              Left = 0
              Top = 180
              Width = 696
              Height = 29
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 0
              ExplicitWidth = 676
              object JvImgBtn11: TJvImgBtn
                Left = 0
                Top = 3
                Width = 75
                Height = 25
                Action = ActionNovoHistorico
                ImageIndex = 0
                Images = frmPrincipal.ImageList16
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
              end
              object JvImgBtn12: TJvImgBtn
                Left = 81
                Top = 3
                Width = 75
                Height = 25
                Action = ActionEditarHistorico
                ImageIndex = 1
                Images = frmPrincipal.ImageList16
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
              end
              object JvImgBtn13: TJvImgBtn
                Left = 162
                Top = 3
                Width = 75
                Height = 25
                Action = ActionExcluirHistorico
                ImageIndex = 2
                Images = frmPrincipal.ImageList16
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
              end
            end
            object DBGridHistoricos: TDBGrid
              Left = 0
              Top = 0
              Width = 696
              Height = 180
              Align = alClient
              DataSource = dsTblhas
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'Tahoma'
              TitleFont.Style = []
              Columns = <
                item
                  Alignment = taCenter
                  Expanded = False
                  FieldName = 'hasdt'
                  Title.Alignment = taCenter
                  Title.Caption = 'Data'
                  Width = 69
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CalcHasdescr'
                  Title.Caption = 'Descri'#231#227'o / Anota'#231#227'o'
                  Width = 574
                  Visible = True
                end>
            end
          end
          object Panel10: TPanel
            Left = 699
            Top = 0
            Width = 297
            Height = 209
            Align = alRight
            BevelOuter = bvNone
            Padding.Left = 5
            Padding.Right = 5
            Padding.Bottom = 5
            TabOrder = 1
            ExplicitLeft = 679
            object GroupBox3: TGroupBox
              Left = 5
              Top = 0
              Width = 287
              Height = 175
              Align = alClient
              Caption = 'Descri'#231#227'o Completa'
              Padding.Left = 5
              Padding.Right = 5
              Padding.Bottom = 5
              TabOrder = 0
              object DBMemo1: TDBMemo
                Left = 7
                Top = 15
                Width = 273
                Height = 153
                TabStop = False
                Align = alClient
                Color = clBtnFace
                DataField = 'hasdescr'
                DataSource = dsTblhas
                ReadOnly = True
                ScrollBars = ssVertical
                TabOrder = 0
              end
            end
            object Panel13: TPanel
              Left = 5
              Top = 175
              Width = 287
              Height = 29
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 1
            end
          end
        end
      end
      object Panel2: TPanel
        Left = 7
        Top = 236
        Width = 1004
        Height = 31
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        ExplicitWidth = 984
        DesignSize = (
          1004
          31)
        object lblTotalAssinantes: TLabel
          Left = 793
          Top = 4
          Width = 211
          Height = 13
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          AutoSize = False
          Caption = '0 assinante(s) encontrado(s)'
          ExplicitLeft = 773
        end
        object btnNovoAssinante: TJvImgBtn
          Left = 4
          Top = 3
          Width = 75
          Height = 25
          Action = ActionNovoAssinante
          ImageIndex = 0
          Images = frmPrincipal.ImageList16
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object btnEditarAssinante: TJvImgBtn
          Left = 85
          Top = 3
          Width = 75
          Height = 25
          Action = ActionEditarAssinante
          ImageIndex = 1
          Images = frmPrincipal.ImageList16
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object btnExcluirAssinante: TJvImgBtn
          Left = 166
          Top = 3
          Width = 75
          Height = 25
          Action = ActionExcluirAssinante
          ImageIndex = 2
          Images = frmPrincipal.ImageList16
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object btnHistoricoAlteracoes: TJvImgBtn
          Left = 284
          Top = 3
          Width = 152
          Height = 25
          Action = ActionHistoricoAlteracoes
          ImageIndex = 10
          Images = frmPrincipal.ImageList16
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
      end
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 6
      Width = 1018
      Height = 56
      Align = alTop
      Caption = 'Filtros'
      TabOrder = 0
      ExplicitWidth = 998
      object edtNomeAssinante: TLabeledEdit
        Left = 142
        Top = 21
        Width = 155
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome:'
        LabelPosition = lpLeft
        TabOrder = 1
      end
      object edtCodigo: TLabeledEdit
        Left = 50
        Top = 21
        Width = 46
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 37
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo:'
        LabelPosition = lpLeft
        TabOrder = 0
        Text = '0'
        OnExit = edtCodigoExit
        OnKeyPress = edtCodigoKeyPress
      end
      object edtEndereco: TLabeledEdit
        Left = 365
        Top = 21
        Width = 141
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 49
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o:'
        LabelPosition = lpLeft
        TabOrder = 2
      end
      object edtNroEndereco: TLabeledEdit
        Left = 557
        Top = 21
        Width = 41
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 25
        EditLabel.Height = 13
        EditLabel.Caption = 'Nro.:'
        LabelPosition = lpLeft
        TabOrder = 3
      end
      object edtCodigoZona: TLabeledEdit
        Left = 656
        Top = 21
        Width = 36
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'Zona:'
        LabelPosition = lpLeft
        TabOrder = 4
      end
      object edtDescrZona: TEdit
        Left = 694
        Top = 21
        Width = 111
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 5
      end
      object Panel14: TPanel
        Left = 929
        Top = 15
        Width = 87
        Height = 39
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 6
        ExplicitLeft = 928
        object btnFiltrar: TJvImgBtn
          Left = 6
          Top = 4
          Width = 75
          Height = 25
          Action = ActionFiltrar
          ImageIndex = 3
          Images = frmPrincipal.ImageList16
          TabOrder = 0
        end
      end
    end
  end
  object ActionList: TActionList
    Images = frmPrincipal.ImageList16
    Left = 238
    Top = 142
    object ActionAtualizarCampoCobrador: TAction
      Hint = 'Atualizar lista de cobradores'
      ImageIndex = 7
      OnExecute = ActionAtualizarCampoCobradorExecute
    end
    object ActionAtualizarCampoVendedor: TAction
      Hint = 'Atualiza a lista de vendedores'
      ImageIndex = 7
      OnExecute = ActionAtualizarCampoVendedorExecute
    end
    object ActionFiltrar: TAction
      Caption = 'Filtrar'
      ImageIndex = 3
      OnExecute = ActionFiltrarExecute
    end
    object ActionNovoAssinante: TAction
      Tag = 4
      Caption = 'Novo'
      Hint = 'Adicionar um novo assinante'
      ImageIndex = 0
      OnExecute = ActionNovoAssinanteExecute
    end
    object ActionEditarAssinante: TAction
      Tag = 5
      Caption = 'Editar'
      Hint = 'Alterar os dados do assinante selecionado'
      ImageIndex = 1
      OnExecute = ActionEditarAssinanteExecute
    end
    object ActionExcluirAssinante: TAction
      Tag = 6
      Caption = 'Excluir'
      Hint = 'Excluir o assinante selecionado'
      ImageIndex = 2
      OnExecute = ActionExcluirAssinanteExecute
    end
    object ActionOkAssinante: TAction
      Caption = 'OK'
      ImageIndex = 9
      OnExecute = ActionOkAssinanteExecute
    end
    object ActionCancelarAssinante: TAction
      Caption = 'Cancelar'
      ImageIndex = 8
      OnExecute = ActionCancelarAssinanteExecute
    end
    object ActionNovaAssinatura: TAction
      Tag = 70
      Caption = 'Nova'
      Hint = 'Adicionar uma nova assinatura para o assinante selecionado'
      ImageIndex = 0
      OnExecute = ActionNovaAssinaturaExecute
    end
    object ActionEditarAssinatura: TAction
      Tag = 71
      Caption = 'Editar'
      Hint = 'Alterar os dados da assinatura selecionada'
      ImageIndex = 1
      OnExecute = ActionEditarAssinaturaExecute
    end
    object ActionExcluirAssinatura: TAction
      Tag = 72
      Caption = 'Excluir'
      Hint = 'Excluir a assinatura selecionada'
      ImageIndex = 2
      OnExecute = ActionExcluirAssinaturaExecute
    end
    object ActionOkAssinatura: TAction
      Caption = 'OK'
      ImageIndex = 9
      OnExecute = ActionOkAssinaturaExecute
    end
    object ActionCancelarAssinatura: TAction
      Caption = 'Cancelar'
      ImageIndex = 8
      OnExecute = ActionCancelarAssinaturaExecute
    end
    object ActionNovaBaixa: TAction
      Tag = 73
      Caption = 'Nova'
      Hint = 'Adiconar uma nova baixa para a assinatura selecionada'
      ImageIndex = 0
      OnExecute = ActionNovaBaixaExecute
    end
    object ActionEditarBaixa: TAction
      Tag = 74
      Caption = 'Editar'
      Hint = 'Alterar os dados da baixa selecionada'
      ImageIndex = 1
      OnExecute = ActionEditarBaixaExecute
    end
    object ActionExcluirBaixa: TAction
      Tag = 75
      Caption = 'Excluir'
      Hint = 'Excluir a baixa selecionada'
      ImageIndex = 2
      OnExecute = ActionExcluirBaixaExecute
    end
    object ActionOkBaixa: TAction
      Caption = 'OK'
      ImageIndex = 9
      OnExecute = ActionOkBaixaExecute
    end
    object ActionCancelarBaixa: TAction
      Caption = 'Cancelar'
      ImageIndex = 8
      OnExecute = ActionCancelarBaixaExecute
    end
    object ActionConsultarAssinante: TAction
      Caption = 'Consultar'
      OnExecute = ActionConsultarAssinanteExecute
    end
    object ActionNovoHistorico: TAction
      Tag = 84
      Caption = 'Novo'
      Hint = 'Adicionar um novo hist'#243'rico'
      ImageIndex = 0
      OnExecute = ActionNovoHistoricoExecute
    end
    object ActionEditarHistorico: TAction
      Tag = 85
      Caption = 'Editar'
      Hint = 'Alterar o hist'#243'rico selecionado'
      ImageIndex = 1
      OnExecute = ActionEditarHistoricoExecute
    end
    object ActionExcluirHistorico: TAction
      Tag = 86
      Caption = 'Excluir'
      Hint = 'Excluir o hist'#243'rico selecionado'
      ImageIndex = 2
      OnExecute = ActionExcluirHistoricoExecute
    end
    object ActionOkHistorico: TAction
      Caption = 'Ok'
      ImageIndex = 9
      OnExecute = ActionOkHistoricoExecute
    end
    object ActionCancelarHistorico: TAction
      Caption = 'Cancelar'
      ImageIndex = 8
      OnExecute = ActionCancelarHistoricoExecute
    end
    object ActionHistoricoAlteracoes: TAction
      Caption = 'Hist'#243'rico de Altera'#231#245'es'
      Hint = 'Mostra o hist'#243'rico de altera'#231#245'es do assinante selecionado.'
      ImageIndex = 10
      OnExecute = ActionHistoricoAlteracoesExecute
    end
  end
  object TimerInicio: TTimer
    Interval = 50
    OnTimer = TimerInicioTimer
    Left = 326
    Top = 142
  end
  object dsTblass: TDataSource
    DataSet = dmDadosAssinantes.cdsTblass
    Left = 406
    Top = 142
  end
  object dsTblcep: TDataSource
    DataSet = dmDadosAssinantes.sqlTblcep
    Left = 568
    Top = 48
  end
  object dsRuaZona: TDataSource
    DataSet = dmDadosAssinantes.sqlRuaZona
    Left = 496
    Top = 48
  end
  object dsTblada: TDataSource
    DataSet = dmDadosAssinantes.cdsTblada
    Left = 785
    Top = 46
  end
  object dsTblbda: TDataSource
    DataSet = dmDadosAssinantes.cdsTblbda
    Left = 849
    Top = 46
  end
  object ImageListGrid: TImageList
    Left = 102
    Top = 142
    Bitmap = {
      494C010103000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F5F5F50AE7E7E718E5E5E51AE5E5
      E51AE5E5E51AE5E5E51AE5E5E51AE5E5E51AE5E5E51AE5E5E51AE5E5E51AE6E6
      E619F4F4F40BFFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      93FF000093FF0000000000000000000000000000000000000000000000000000
      93FF000093FF000000000000000000000000EBEBEB145F9FA9A038A1B2C738A1
      B2C738A1B2C738A1B2C738A1B2C738A1B2C738A1B2C738A1B2C738A1B2C75E9E
      A9A1E9E9E916FFFFFF00FFFFFF00FFFFFF000000000000000000909090D38887
      87F5878686FF878787FF888887FF898988FF898888FF888888FF888887FF8786
      86FF878685F8979797C700000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000009BFF0033
      FFFF0033FFFF000093FF00000000000000000000000000000000000093FF0033
      FFFF0033FFFF000093FF0000000000000000FFFFFF0041B0C1BEABF3FFFF9FF1
      FEFF9FF1FEFF9FF1FEFF9FF1FEFF9FF1FEFF9FF1FEFF9FF1FEFFABF3FFFF41B0
      C1BEFFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000878787FBC2C2
      C1FEBCBCBCFFBCBCBCFFBCBCBBFFBCBCBBFFBCBCBBFFBCBCBBFFBCBCBBFFBCBC
      BBFFC2C2C1FE8B8B8AF600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000093FF0029FFFF0029
      FFFF0033FFFF0033FFFF000093FF0000000000000000000093FF0033FFFF0033
      FFFF0033FFFF0033FFFF000093FF00000000FFFFFF0045B6C8BA99EFFDFF82EA
      FBFF82EAFBFF82EAFBFF82EAFBFF82EAFBFF82EAFBFF82EAFBFF99EFFDFF45B6
      C8BAFFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000008C8C8BFFFFFF
      FFFFEBEBEBFFEBEBEBFFE9E9E9FFE8E8E8FFE7E7E7FFE7E7E7FFE6E6E6FFE6E6
      E6FFFFFFFFFF8E8D8CFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000029CAFFFFCCFFFF0029
      FFFF0029FFFF0033FFFF0033FFFF000093FF000093FF0033FFFF0033FFFF0033
      FFFF0029FFFFFFCCFFFF0029CAFF00000000FFFFFF0048BACCB792ECFAFF7EE6
      F7FF7EE6F7FF7EE6F7FF7EE6F7FF7EE6F7FF7EE6F7FF7EE6F7FF92ECFAFF40B3
      C4BFE5E5E51AE5E5E51AE6E6E619F4F4F40B0000000000000000929191FFFFFF
      FFFFB4B4B4FF949494FFE7E7E7FFB2B2B2FF939393FFE3E3E3FFB0B0B0FF9191
      91FFFBFBFBFF929291FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000029CAFFFFCC
      FFFF0029FFFF0033FFFF0033FFFF0033FFFF0033FFFF0033FFFF0033FFFF0029
      FFFFFFCCFFFF0029CAFF0000000000000000FFFFFF004ABECFB58AE8F7FF79E2
      F3FF79E2F3FF79E2F3FF79E2F3FF79E2F3FF79E2F3FF79E2F3FF8AE8F7FF10A3
      B9EF38A1B2C738A1B2C75E9EA9A1E9E9E9160000000000000000959595FFFFFF
      FFFFE8E8E8FFE7E7E7FFE5E5E5FFE3E3E3FFE2E2E2FFE0E0E0FFDFDFDFFFDCDC
      DCFFFFFFFFFF959595FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000029
      CAFFFFCCFFFF0033FFFF0033FFFF0033FFFF0033FFFF0033FFFF0033FFFFFFCC
      FFFF0029CAFF000000000000000000000000FFFFFF004CC1D2B383E5F5FF73DE
      EFFF73DEEFFF73DEEFFF73DEEFFF73DEEFFF73DEEFFF73DEEFFF83E5F5FF31BE
      D3FF9FF1FEFFABF3FFFF41B0C1BEFFFFFF0000000000000000009A9A99FFFFFF
      FFFFB1B1B1FF919191FFE2E2E2FFADADADFF8F8F8FFFDCDCDCFFA9A9A9FF8D8D
      8DFFFBFBFBFF9A9999FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000029CAFF023AFFFF023AFFFF023AFFFF023AFFFF023AFFFF023AFFFF0029
      CAFF00000000000000000000000000000000FFFFFF004EC4D6B17BE2F2FF6CD5
      E5FF66CADAFF63C5D4FF63C5D4FF6EDAEBFF6EDAEBFF6EDAEBFF7BE2F2FF29BF
      D5FF82EAFBFF99EFFDFF45B6C8BAFFFFFF0000000000000000009E9D9DFFFFFF
      FFFFE3E3E3FFE1E1E1FFDCDCDCFFDBDBDBFFD7D7D7FFD3D3D3FFD3D3D3FFD1D1
      D1FFFFFFFFFF9E9D9CFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000093FF0C4CFFFF0C4CFFFF0C4CFFFF0C4CFFFF0C4CFFFF0C4CFFFF0000
      93FF00000000000000000000000000000000FFFFFF0050C7D8AF75DFF0FF68D2
      E2FF63C8D7FF62B6C3FF6F979DFF6AD7E8FF6AD7E8FF6AD7E8FF75DFF0FF29C0
      D6FF7EE6F7FF92ECFAFF48BACCB7FFFFFF000000000000000000A0A0A0FFFFFF
      FFFFADADADFF8E8E8EFFD8D8D8FFA5A5A5FF8A8A8AFFCECECEFF7374E8FF5258
      DBFFFBFBFBFF9E9E9EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      93FF1560FFFF1560FFFF0B5AFFFF0B5AFFFF0B5AFFFF0B5AFFFF1560FFFF1560
      FFFF000093FF000000000000000000000000FFFFFF0052CADBAD74E2F2FF539A
      DBFF1F1FB8FF5D73A4FF71D2E0FF6FDDEEFF6FDDEEFF6FDDEEFF74E2F2FF28C1
      D7FF79E2F3FF8AE8F7FF4ABECFB5FFFFFF000000000000000000A3A3A3FFFCFC
      FCFFDADADAFFD7D7D7FFD2D2D2FFCECECEFFC9C9C9FFC5C5C5FFC2C2C2FFBFBF
      BFFFFFFFFFFFA0A0A0FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000093FF1E73
      FFFF1E73FFFF146CFFFF146CFFFFFFCCFFFFFFCCFFFF146CFFFF146CFFFF1E73
      FFFF1E73FFFF000093FF0000000000000000FFFFFF007ED8E58153CBDCAC3343
      DBCC6666F7FF1C41DAFF26C1D7FF26C1D7FF26C1D7FF26C1D7FF26C1D7FF39C8
      DDFF73DEEFFF83E5F5FF4CC1D2B3FFFFFF000000000000000000A3A3A3FFFFFF
      FFFFB07B56FFC38D67FFC58F68FFC69069FFC8926BFFCA946CFFCA956EFFB07B
      56FFFFFFFFFFA1A09FFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000093FF2083FFFF2083
      FFFF1C7EFFFF1C7EFFFFFFCCFFFF0029CAFF0029CAFFFFCCFFFF1C7EFFFF1C7E
      FFFF2083FFFF2083FFFF000093FF00000000FFFFFF00FFFFFF00FFFFFF00C2C2
      F83D1940DEE65CABEDFF6EDAEBFF6EDAEBFF6CD5E5FF66CADAFF63C5D4FF63C5
      D4FF6EDAEBFF7BE2F2FF4EC4D6B1FFFFFF000000000000000000A4A4A4FFFFFF
      FFFFB07B56FFC18B64FFC38D66FFC58F67FFC69069FFC8926BFFCA946CFFB07B
      56FFFFFFFFFFA0A0A0FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000029CAFFFFCCFFFF2083
      FFFF2083FFFFFFCCFFFF0029CAFF00000000000000000029CAFFFFCCFFFF2083
      FFFF2083FFFFFFCCFFFF0029CAFF00000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0050C7D8AF75DFF0FF6AD7E8FF6AD7E8FF68D2E2FF63C8D7FF62B6C3FF6F97
      9DFF6AD7E8FF75DFF0FF50C7D8AFFFFFFF000000000000000000A3A3A3FBFFFF
      FFFEA7724DFFA7724DFFA7724DFFA7724DFFA7724DFFA7724DFFA7724DFFA772
      4DFFFFFFFFFF9E9E9EFF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000029CAFFFFCC
      FFFFFFCCFFFF0029CAFF000000000000000000000000000000000029CAFFFFCC
      FFFFFFCCFFFF0029CAFF0000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0052CADBAD74E2F2FF6FDDEEFF6FDDEEFF539ADBFF1F1FB8FF5D73A4FF71D2
      E0FF6FDDEEFF74E2F2FF52CADBADFFFFFF000000000000000000A9A9A9D1FFFF
      FFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFF9A3A3A3E600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000029
      CAFF0029CAFF0000000000000000000000000000000000000000000000000029
      CAFF0029CAFF000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007ED8E58153CBDCAC53CBDCAC53CBDCAC3343DBCC6666F7FF3343DBCC53CB
      DCAC53CBDCAC53CBDCAC7ED8E581FFFFFF000000000000000000B2B2B28AA8A8
      A8E3A8A8A8FFABABABFFACACACFFADADADFFACACACFFABABABFFA8A8A8FFA4A4
      A4FFA2A2A2EBB5B5B59200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C2C2F83D5353ECACC2C2F83DFFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF0000FFFF0000E7E70000C0030000
      C3C30000C003000081810000C003000080010000C0030000C0030000C0030000
      E0070000C0030000F00F0000C0030000F00F0000C0030000E0070000C0030000
      C0030000C003000080010000C003000081810000C0030000C3C30000C0030000
      E7E70000C0030000FFFF0000FFFF000000000000000000000000000000000000
      000000000000}
  end
  object dsTblhas: TDataSource
    DataSet = dmDadosAssinantes.cdsTblhas
    Left = 638
    Top = 54
  end
  object dsTblcpa: TDataSource
    DataSet = dmDadosAssinantes.cdsTblcpa
    Left = 702
    Top = 46
  end
end
