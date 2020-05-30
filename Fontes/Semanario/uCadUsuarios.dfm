object frmCadUsuarios: TfrmCadUsuarios
  Tag = 1
  Left = 236
  Top = 84
  Caption = 'Cadastro de Usu'#225'rios'
  ClientHeight = 578
  ClientWidth = 970
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlManutencao: TPanel
    Left = 0
    Top = 0
    Width = 970
    Height = 578
    Align = alClient
    Color = clWindow
    ParentBackground = False
    TabOrder = 1
    object Panel2: TPanel
      Left = 1
      Top = 536
      Width = 968
      Height = 41
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 0
      DesignSize = (
        968
        41)
      object Label29: TLabel
        Left = 811
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
        ExplicitLeft = 700
      end
      object btnSalvar: TJvImgBtn
        Left = 40
        Top = 8
        Width = 75
        Height = 25
        Default = True
        ModalResult = 1
        TabOrder = 0
        OnClick = btnSalvarClick
        Kind = bkOK
      end
      object btnCancelar: TJvImgBtn
        Left = 121
        Top = 8
        Width = 75
        Height = 25
        Cancel = True
        Caption = 'Cancelar'
        ModalResult = 2
        TabOrder = 1
        OnClick = btnCancelarClick
        Kind = bkCancel
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 968
      Height = 535
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel3'
      Padding.Left = 5
      Padding.Top = 5
      Padding.Right = 5
      Padding.Bottom = 5
      TabOrder = 1
      object GroupBox3: TGroupBox
        Left = 5
        Top = 5
        Width = 424
        Height = 525
        Align = alLeft
        Caption = 'Dados do usu'#225'rio'
        TabOrder = 0
        object Label5: TLabel
          Left = 407
          Top = 121
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
        object Label6: TLabel
          Left = 239
          Top = 81
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
          Left = 13
          Top = 43
          Width = 37
          Height = 13
          Caption = 'C'#243'digo:'
          FocusControl = DBEdit1
        end
        object Label2: TLabel
          Left = 13
          Top = 83
          Width = 29
          Height = 13
          Caption = 'Login:'
          FocusControl = dbedtUsulogin
        end
        object Label4: TLabel
          Left = 13
          Top = 123
          Width = 31
          Height = 13
          Caption = 'Nome:'
          FocusControl = DBEdit4
        end
        object Label3: TLabel
          Left = 13
          Top = 160
          Width = 34
          Height = 13
          Caption = 'Senha:'
        end
        object Label7: TLabel
          Left = 13
          Top = 200
          Width = 39
          Height = 13
          Caption = 'Repetir:'
        end
        object Label8: TLabel
          Left = 192
          Top = 158
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
        object Label9: TLabel
          Left = 192
          Top = 198
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
        object DBEdit1: TDBEdit
          Left = 56
          Top = 40
          Width = 81
          Height = 21
          TabStop = False
          Color = clBtnFace
          DataField = 'usucod'
          DataSource = dsTblusu
          ReadOnly = True
          TabOrder = 0
        end
        object dbedtUsulogin: TDBEdit
          Left = 56
          Top = 80
          Width = 177
          Height = 21
          CharCase = ecLowerCase
          DataField = 'usulogin'
          DataSource = dsTblusu
          TabOrder = 1
        end
        object DBEdit4: TDBEdit
          Left = 56
          Top = 120
          Width = 345
          Height = 21
          CharCase = ecUpperCase
          DataField = 'usunome'
          DataSource = dsTblusu
          TabOrder = 2
        end
        object DBCheckBox1: TDBCheckBox
          Left = 324
          Top = 42
          Width = 86
          Height = 17
          TabStop = False
          Caption = 'Usu'#225'rio Ativo'
          DataField = 'usuativo'
          DataSource = dsTblusu
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbedtSenha: TDBEdit
          Left = 56
          Top = 157
          Width = 130
          Height = 21
          DataField = 'CalcSenha'
          DataSource = dsTblusu
          PasswordChar = '*'
          TabOrder = 3
        end
        object dbedtSenhaRepetir: TDBEdit
          Left = 56
          Top = 197
          Width = 130
          Height = 21
          DataField = 'CalcSenhaRepetir'
          DataSource = dsTblusu
          PasswordChar = '*'
          TabOrder = 4
        end
      end
      object GroupBox4: TGroupBox
        Left = 429
        Top = 5
        Width = 534
        Height = 525
        Align = alClient
        Caption = 'Permiss'#245'es do usu'#225'rio'
        Padding.Left = 5
        Padding.Top = 5
        Padding.Right = 5
        Padding.Bottom = 5
        TabOrder = 1
        object TreeViewPermissao: TTreeView
          Left = 7
          Top = 20
          Width = 520
          Height = 498
          Align = alClient
          AutoExpand = True
          Images = ImageListPermissao
          Indent = 19
          PopupMenu = PopupMenu
          TabOrder = 0
          OnCollapsing = TreeViewPermissaoCollapsing
          OnCustomDrawItem = TreeViewPermissaoCustomDrawItem
          OnDblClick = TreeViewPermissaoDblClick
        end
      end
    end
  end
  object pnlConsulta: TPanel
    Left = 0
    Top = 0
    Width = 970
    Height = 578
    Align = alClient
    Color = clWindow
    Padding.Left = 5
    Padding.Top = 5
    Padding.Right = 5
    Padding.Bottom = 5
    ParentBackground = False
    TabOrder = 0
    object GroupBox2: TGroupBox
      Left = 6
      Top = 62
      Width = 958
      Height = 479
      Align = alClient
      Caption = 'Resultado da pesquisa'
      TabOrder = 1
      object dbGrid: TDBGrid
        Left = 2
        Top = 15
        Width = 954
        Height = 462
        Align = alClient
        DataSource = dsTblusu
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
            FieldName = 'usucod'
            Title.Caption = 'C'#243'digo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'usulogin'
            Title.Caption = 'Login'
            Width = 134
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'usunome'
            Title.Caption = 'Nome completo'
            Width = 424
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CalcDescrUsuativo'
            Title.Alignment = taCenter
            Title.Caption = 'Ativo'
            Width = 48
            Visible = True
          end>
      end
    end
    object GroupBox1: TGroupBox
      Left = 6
      Top = 6
      Width = 958
      Height = 56
      Align = alTop
      Caption = 'Filtros'
      TabOrder = 0
      object edtNome: TLabeledEdit
        Left = 276
        Top = 19
        Width = 261
        Height = 21
        CharCase = ecUpperCase
        EditLabel.Width = 31
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome:'
        LabelPosition = lpLeft
        TabOrder = 1
      end
      object btnFiltrar: TJvImgBtn
        Left = 636
        Top = 17
        Width = 75
        Height = 25
        Caption = 'Filtrar'
        ImageIndex = 3
        Images = frmPrincipal.ImageList16
        TabOrder = 2
        OnClick = btnFiltrarClick
      end
      object edtLogin: TLabeledEdit
        Left = 49
        Top = 19
        Width = 147
        Height = 21
        CharCase = ecLowerCase
        EditLabel.Width = 29
        EditLabel.Height = 13
        EditLabel.Caption = 'Login:'
        LabelPosition = lpLeft
        TabOrder = 0
      end
    end
    object Panel1: TPanel
      Left = 6
      Top = 541
      Width = 958
      Height = 31
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object btnNovo: TJvImgBtn
        Tag = 60
        Left = 0
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Novo'
        ImageIndex = 0
        Images = frmPrincipal.ImageList16
        TabOrder = 0
        OnClick = btnNovoClick
      end
      object btnEditar: TJvImgBtn
        Tag = 61
        Left = 81
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Editar'
        ImageIndex = 1
        Images = frmPrincipal.ImageList16
        TabOrder = 1
        OnClick = btnEditarClick
      end
      object btnExcluir: TJvImgBtn
        Tag = 62
        Left = 162
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Excluir'
        ImageIndex = 2
        Images = frmPrincipal.ImageList16
        TabOrder = 2
        OnClick = btnExcluirClick
      end
    end
  end
  object dsTblusu: TDataSource
    DataSet = dmUsuario.cdsTblusu
    Left = 625
    Top = 289
  end
  object ImageListPermissao: TImageList
    ColorDepth = cd32Bit
    Left = 712
    Top = 288
    Bitmap = {
      494C010103000800040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000508
      09360D16185100010116000000000000000000000000000000001D343F8D0710
      1346000000000000000000000000000000000000000000000000000000000000
      00000605062A3F3E3F848C8B8BC2B0B4B1DCB0B4B1DC8B8A8BC23F3D3E840505
      052A000000000000000000000000000000000000000000000000000000000000
      00000606052A40403E84888B8BC2A5ACB5DCA5ACB5DC87898AC23F3F3D840505
      052A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000006090A3E89D9
      F0FA88E1FCFF70C1DBEF447D8FC21D363E83080F1248000000052C505FAB69D8
      FDFF0912154C0000000000000000000000000000000000000000000000033F3E
      3F84D4E0DBF5A1E3C4FF66D3A4FF4ECD97FF4ECD97FF67D3A3FFA2E3C3FFD3DF
      D9F53E3C3D840000000300000000000000000000000000000000000000034040
      3E84C4CDE2F57796EEFF3B5FE6FF264BE2FF264AE2FF3B5FE6FF7796EEFFC3CC
      E1F53E3E3C840000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000010181C6392E7
      FFFF88E0FBFF80DDFAFF77DAFAFF6FCFEEFF69C4E2FF5199B1E959A6C2EE70D8
      FDFF6BCEF0FA070E1042000000000000000000000000000000046A6769A8C1EB
      D5FF47C990FF1DBF7CFF19BF7CFF13BD78FF1CC081FF1BC07DFF1CBF7BFF48C9
      8EFFC0EAD3FF676465A8000000040000000000000000000000046B6A67A8A2B3
      F3FF1D3DDFFF0623DBFF132EDCFF1633DCFF1633DCFF132DDBFF0622DAFF1E3C
      E0FFA2B2F3FF676764A800000004000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000111B1F6891E6
      FEFF87E0FBFF7EDDFAFF77DAF9FF6FCFEEFF69C4E2FF60B6D2FF69C1DFFF76DC
      FDFF75D9FAFF213E48890000000000000000000000003F3D3E84BDE9CEFF2CC1
      7EFF1CC080FF1EC182FF28C489FF7CD097FF2ABB6EFF23C388FF23C284FF1CC0
      80FF2DC07BFFBCE8CCFF3C3B3C840000000000000000403F3D84A2B0F3FF0D27
      DBFF112DDCFF2D49D5FF113DDBFF1848E0FF1847DFFF113FDEFF2D4BD9FF1128
      D3FF0D27DDFFA2AEF3FF3D3D3A84000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000141E226D91E6
      FEFF87E0FBFF7EDDFAFF77DAF9FF6FCEEDFF69C4E2FF5FB6D2FF6CC2DFFF7EE0
      FEFF7CDDFBFF233F4889000000000000000005050528D6E2D8F83DC380FF1DC1
      82FF1FC182FF21C181FFB1E9D1FFFFFFFDFF6AC275FF18BF7CFF24C285FF24C2
      84FF1DC081FF3EC27DFFD2DFD4F80505052805050528CBCEE8F81F32DDFF112E
      DBFF8297EDFFE4E5F2FF4B65CEFF0747DDFF0749E0FF4974E6FFE4E8F6FF838C
      D5FF1129D4FF2032DFFFC7CAE4F8050505280000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000121B206992E9
      FFFF86E0FBFF7DDDFAFF77D9F9FF6ECEECFF68C3E1FF5DB4D0FF70C4DFFF85E2
      FEFF83DFFBFF254048890000000000000000413F418693DAABFF1BBD78FF1EC1
      82FF22C182FFB4E9D2FFFFFFFFFFFFFFFFFFD9E9CAFF29B662FF1EC387FF24C2
      84FF23C285FF1ABD76FF92D9A9FF3E3C3E8642423F867C84ECFF081FD9FF2B4E
      E0FFEEF2FCFFFFFFFFFFEEECF4FF4064CEFF3D76E4FFEDF2FCFFFFFFFFFFEEF0
      F9FF2B49D8FF081EDAFF7D83ECFF3F3E3C860000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000001154F7E
      8DCB88E3FEFF7DDDFAFF76D9F8FF6ECDECFF66C2E0FF67BAD6FF88DEF6FF8AE4
      FCFF8AE3FBFF2741488900000000000000008E8F8DC65CCA8AFF31C78DFF28C3
      86FFB8EAD4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8FCC8AFF28BE79FF23C3
      87FF20C183FF34C78EFF5CCA88FF888A88C68D8D90C64B53E2FF2B45E0FF0E3C
      DDFF4876E7FFEDF2FDFFFFFFFFFFEDEDF6FFEDEFF8FFFFFFFFFFEDF2FDFF4874
      E6FF0E3BDEFF2B43E0FF4C54E3FF88888BC60000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2C
      328289E5FFFF7EDDFAFF76D9F8FF6ECDECFF65C1DFFF6EC0DAFF94E7FEFF91E5
      FCFF91E5FCFF294148890000000000000000AAB2A9DE48C47DFF41CC99FF96E2
      C4FFFFFFFFFFFFFFFFFFA3DFBDFFC1EBD5FFFFFFFFFFF1F5E7FF6BBD6AFF44C1
      80FF35C68AFF4CD0A0FF4AC47BFFA5ADA4DEA8A9B6DE3A46DDFF4660E5FF2750
      E1FF0733DCFF4263E4FFE8EDFCFFFFFFFFFFFFFFFFFFE9EBF8FF4361E1FF0832
      DDFF274FE1FF465EE4FF3B46DDFFA3A3B0DE0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2C
      338288E4FFFF7DDDFAFF76D8F8FF6ECCEBFF65C0DEFF6FBFD9FF9AE9FDFF98E8
      FCFF98E8FCFF2B4248890000000000000000AAB2A7DE47C278FF4ACE9AFF80D1
      9BFFF0F9F1FF96D7A9FF4FBE77FF6CCA90FFF0FAF4FFFFFFFFFFC3DEB2FF55B6
      5CFF65C888FF4FD09EFF49C275FFA5ACA2DEA8A8B5DE3A46DBFF475EE5FF4854
      E2FF2332DDFF445CE2FFE8ECFBFFFFFFFFFFFFFFFFFFE9EAF5FF4353CBFF2230
      DBFF4955E3FF475DE4FF3B46DCFFA3A3B0DE0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2C
      338288E4FFFF7DDDFAFF76D8F8FF6ECCEBFF64C0DEFF70C0D9FFA1EDFEFF9FEC
      FDFF9FECFDFF2D43498900000000000000008D8D8AC657C173FF51C278FF60C0
      6FFF76CB8AFF63C37CFF62C37DFF55BF74FFA0DBB1FFFFFFFFFFFFFFFFFF94C9
      81FF54B95DFF52C278FF59C170FF888885C68C8C8EC64953DBFF424DDAFF4449
      D9FF7175E5FFF0F1FCFFFFFFFFFFF0F1FCFFF1F2FDFFFFFFFFFFEDECF4FF6166
      CEFF4248D6FF434DDBFF4A53DCFF878789C60000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2C
      338288E4FFFF7DDDFAFF76D8F8FF6DCCEAFF64BFDEFF72C1D9FFA9F0FEFFA6EF
      FDFFA6EFFDFF2F4549890000000000000000403F41868BC878FF48AA36FF5DBA
      62FF58BD69FF60C274FF64C47AFF65C47BFF60C376FFCFEDD7FFFFFFFFFFF4F8
      EEFF76BC63FF43A72FFF8BC876FF3D3C3E8641413E867C83DEFF2E36C8FF595F
      D8FFF1F2FCFFFFFFFFFFF0F1FCFF696EE3FF6A6FE4FFF1F2FDFFFFFFFFFFECEC
      F5FF5258CEFF2F37C9FF7C82DDFF3E3D3B860000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2C
      338288E4FFFF7DDDFAFF76D8F8FF6DCCEAFF64BFDEFF74C2D9FFB0F4FFFFADF2
      FEFFADF2FEFF31464989000000000000000005050528CCDAC2F847A017FF5AAF
      3EFF5DB653FF5BB95DFF5BBB63FF5CBC66FF56BA61FF6AC070FFEFF8F0FFFFFF
      FFFF8CC46EFF419D0EFFC7D6BEF80504052805050528C8C9E0F82F37C3FF434A
      CBFF9DA1E6FFEAEAFAFF7075DDFF3E46D4FF3F46D4FF7176DEFFEAEBFAFF9DA1
      E5FF444BCBFF3038C3FFC3C4DCF8050504280000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001D2D
      348387E3FFFF7CDCFAFF75D7F7FF6CCBE9FF62BEDCFF77C2D9FFBAF7FFFFB6F5
      FEFFB6F5FEFF344749890000000000000000000000003E3C3F84ACD296FF3F97
      08FF5BAA30FF5FB03EFF5DB143FF5DB246FF5DB246FF56AD39FF89C46EFF8EC3
      6DFF389401FFABD196FF3B393C8400000000000000003E3E3C84A1A5E3FF252C
      BBFF434AC8FF5A60D1FF434ACCFF4950CEFF4950CEFF434ACCFF5A60D1FF4349
      C7FF252DBBFFA0A4E1FF3B3B3984000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001C2D
      338289E7FFFF7DDFFDFF75D8F8FF6CCBEAFF63BEDCFF75C0D8FFC4FCFFFFC1FC
      FFFFBDF8FFFF3647498900000000000000000000000000000004676569A8ACD0
      96FF489917FF4A9A18FF58A429FF5DA82EFF5DA82FFF59A42AFF459813FF4396
      10FFABD096FF636165A800000004000000000000000000000004676765A8A1A4
      E1FF2F37BBFF2F36BCFF4349C4FF484EC6FF484EC6FF4349C3FF2E36BBFF3038
      BCFFA0A4E0FF646361A800000004000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000090E
      104D558EA2D560A9C1E56CC4E1F76CCAE8FF65C1DFFF5FB6D2FF7DC9DDFFAEEC
      F6FFC5FEFFFF3848498900000000000000000000000000000000000000033D3C
      3E84C5D1BDF58BBC6EFF5FA337FF529B24FF529B24FF5FA337FF8BBC6EFFC3CF
      BBF53B3A3C840000000300000000000000000000000000000000000000033E3D
      3B84C0C2D8F57A81D2FF4950C2FF3B42BCFF3B42BCFF4950C2FF7A81D2FFBEC0
      D6F53B3B39840000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000010000000D0102032205080A3C0B12165815232A791E3741982F54
      62B85E8F9EDF242F307200000000000000000000000000000000000000000000
      00000505052A3D3B3D84838483C2A2A89FDCA2A89FDC828381C23B3A3C840505
      052A000000000000000000000000000000000000000000000000000000000000
      00000505052A3D3D3B84838385C29FA0ABDC9FA0ABDC818184C23C3C3A840505
      052A000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object TimerInicio: TTimer
    Enabled = False
    Interval = 50
    OnTimer = TimerInicioTimer
    Left = 550
    Top = 294
  end
  object PopupMenu: TPopupMenu
    Left = 702
    Top = 174
    object Permissototal: TMenuItem
      Caption = 'Marcar todas as permiss'#227'o'
      OnClick = PermissototalClick
    end
    object Desmarcartodasaspermisses1: TMenuItem
      Caption = 'Desmarcar todas as permiss'#245'es'
      OnClick = Desmarcartodasaspermisses1Click
    end
  end
end
