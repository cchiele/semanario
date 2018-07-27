object frmEmpresa: TfrmEmpresa
  Tag = 1
  Left = 356
  Top = 170
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Dados da empresa'
  ClientHeight = 447
  ClientWidth = 624
  Color = clWindow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 30
    Height = 13
    Caption = 'CMPJ:'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 16
    Top = 51
    Width = 64
    Height = 13
    Caption = 'Raz'#227'o Social:'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 16
    Top = 78
    Width = 14
    Height = 13
    Caption = 'IE:'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 16
    Top = 105
    Width = 49
    Height = 13
    Caption = 'Endere'#231'o:'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 16
    Top = 132
    Width = 21
    Height = 13
    Caption = 'Nro:'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 16
    Top = 159
    Width = 69
    Height = 13
    Caption = 'Complemento:'
    FocusControl = DBEdit6
  end
  object Label7: TLabel
    Left = 16
    Top = 186
    Width = 32
    Height = 13
    Caption = 'Bairro:'
    FocusControl = DBEdit7
  end
  object Label8: TLabel
    Left = 16
    Top = 213
    Width = 23
    Height = 13
    Caption = 'CEP:'
    FocusControl = DBEdit8
  end
  object Label9: TLabel
    Left = 16
    Top = 240
    Width = 37
    Height = 13
    Caption = 'Cidade:'
  end
  object Label10: TLabel
    Left = 16
    Top = 267
    Width = 17
    Height = 13
    Caption = 'UF:'
  end
  object Label11: TLabel
    Left = 16
    Top = 294
    Width = 46
    Height = 13
    Caption = 'Telefone:'
    FocusControl = DBEdit11
  end
  object DBEdit1: TDBEdit
    Left = 91
    Top = 21
    Width = 113
    Height = 21
    DataField = 'empcnpj'
    DataSource = dsTblemp
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 91
    Top = 48
    Width = 524
    Height = 21
    DataField = 'emprazaosocial'
    DataSource = dsTblemp
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 91
    Top = 75
    Width = 102
    Height = 21
    DataField = 'empie'
    DataSource = dsTblemp
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 91
    Top = 102
    Width = 524
    Height = 21
    DataField = 'empender'
    DataSource = dsTblemp
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 91
    Top = 129
    Width = 69
    Height = 21
    DataField = 'empnro'
    DataSource = dsTblemp
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 91
    Top = 156
    Width = 199
    Height = 21
    DataField = 'empcompl'
    DataSource = dsTblemp
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 91
    Top = 183
    Width = 394
    Height = 21
    DataField = 'empbairro'
    DataSource = dsTblemp
    TabOrder = 6
  end
  object DBEdit8: TDBEdit
    Left = 91
    Top = 210
    Width = 62
    Height = 21
    DataField = 'cepcep'
    DataSource = dsTblemp
    TabOrder = 7
  end
  object DBEdit9: TDBEdit
    Left = 91
    Top = 237
    Width = 394
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'cepmunicipio'
    DataSource = dsTblcep
    ReadOnly = True
    TabOrder = 8
  end
  object DBEdit10: TDBEdit
    Left = 91
    Top = 264
    Width = 30
    Height = 21
    TabStop = False
    Color = clBtnFace
    DataField = 'cepeuf'
    DataSource = dsTblcep
    ReadOnly = True
    TabOrder = 9
  end
  object DBEdit11: TDBEdit
    Left = 91
    Top = 291
    Width = 85
    Height = 21
    DataField = 'empfone'
    DataSource = dsTblemp
    TabOrder = 10
  end
  object Panel1: TPanel
    Left = 0
    Top = 408
    Width = 624
    Height = 39
    Align = alBottom
    TabOrder = 11
    object btnOk: TBitBtn
      Tag = 56
      Left = 19
      Top = 4
      Width = 75
      Height = 25
      Caption = 'OK'
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333330000333333333333333333333333F33333333333
        00003333344333333333333333388F3333333333000033334224333333333333
        338338F3333333330000333422224333333333333833338F3333333300003342
        222224333333333383333338F3333333000034222A22224333333338F338F333
        8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
        33333338F83338F338F33333000033A33333A222433333338333338F338F3333
        0000333333333A222433333333333338F338F33300003333333333A222433333
        333333338F338F33000033333333333A222433333333333338F338F300003333
        33333333A222433333333333338F338F00003333333333333A22433333333333
        3338F38F000033333333333333A223333333333333338F830000333333333333
        333A333333333333333338330000333333333333333333333333333333333333
        0000}
      ModalResult = 1
      NumGlyphs = 2
      TabOrder = 0
      OnClick = btnOkClick
    end
    object btnCancelar: TBitBtn
      Left = 100
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Kind = bkCancel
      NumGlyphs = 2
      TabOrder = 1
      OnClick = btnCancelarClick
    end
  end
  object dsTblemp: TDataSource
    DataSet = dmDadosEmpresa.cdsTblemp
    Left = 536
    Top = 131
  end
  object dsTblcep: TDataSource
    DataSet = dmDadosEmpresa.sqlTblcep
    Left = 400
    Top = 136
  end
  object TimerInicio: TTimer
    Enabled = False
    Interval = 30
    OnTimer = TimerInicioTimer
    Left = 288
    Top = 280
  end
end
