unit uUsuario;

interface

uses
  System.SysUtils, System.Classes, Vcl.Forms, Vcl.Controls, Data.FMTBcd,
  Data.DB, Data.SqlExpr, Vcl.Dialogs, IdHashMessageDigest, Datasnap.DBClient,
  Datasnap.Provider, Vcl.ComCtrls, Data.DBXCommon, Vcl.ActnList;

type
  TdmUsuario = class(TDataModule)
    sqlUsuario: TSQLDataSet;
    sqlTblusu: TSQLDataSet;
    dspTblusu: TDataSetProvider;
    cdsTblusu: TClientDataSet;
    cdsTblusuusucod: TIntegerField;
    cdsTblusuusulogin: TStringField;
    cdsTblusuususenha: TStringField;
    cdsTblusuusunome: TStringField;
    cdsTblusuusuativo: TShortintField;
    cdsTblusuCalcDescrUsuativo: TStringField;
    sqlTblads: TSQLDataSet;
    dspTblads: TDataSetProvider;
    cdsTblads: TClientDataSet;
    cdsTreeView: TClientDataSet;
    cdsTreeViewadscod: TIntegerField;
    cdsTreeViewadsdescr: TStringField;
    cdsTreeViewmarcado: TStringField;
    cdsTreeViewposicao: TIntegerField;
    sqlTblpdu: TSQLDataSet;
    cdsTblpdu: TClientDataSet;
    cdsTblpduusucod: TIntegerField;
    cdsTblpduadscod: TIntegerField;
    sqlNovoUsucod: TSQLDataSet;
    sqlNovoUsucodusucod: TLargeintField;
    cdsTblusuCalcSenha: TStringField;
    cdsTblusuCalcSenhaRepetir: TStringField;
    dspUsuario: TDataSetProvider;
    cdsUsuario: TClientDataSet;
    cdsUsuariousucod: TIntegerField;
    cdsUsuariousulogin: TStringField;
    cdsUsuarioususenha: TStringField;
    cdsUsuariousunome: TStringField;
    cdsUsuariousuativo: TShortintField;
    sqlVerificaPermiss: TSQLDataSet;
    sqlVerificaPermissqtdepermiss: TLargeintField;
    dspTblpdu: TDataSetProvider;
    cdsTbladsadscod: TIntegerField;
    cdsTbladsadscodpai: TIntegerField;
    cdsTbladsadsordem: TIntegerField;
    cdsTbladsadsdescr: TStringField;
    cdsTbladsadstipo: TIntegerField;
    cdsTreeViewadstipo: TIntegerField;
    procedure dspMenuUpdateError(Sender: TObject; DataSet: TCustomClientDataSet;
      E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure cdsTblusuCalcFields(DataSet: TDataSet);
    procedure cdsTblusuNewRecord(DataSet: TDataSet);
    procedure cdsTblusuusuloginValidate(Sender: TField);
    procedure cdsTblusuusunomeValidate(Sender: TField);
    procedure cdsTblusuususenhaValidate(Sender: TField);
    procedure dspTblpduUpdateError(Sender: TObject;
      DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
      var Response: TResolverResponse);
    procedure cdsTblusuAfterScroll(DataSet: TDataSet);
    procedure cdsTblusuBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    procedure CarregarTreeView(ATreeView: TTreeView; APai: Integer; ATipo: String; ADescr: String; ANode: TTreeNode);

    function GetSenhaMd5(ASenhaNornal: String):String;

  public
    { Public declarations }
    procedure FiltrarUsuarios(ALogin: String = ''; ANome: String = '');
    procedure PosicionarUsuario(ACodigo: integer);
    procedure AdicionarUsuario;
    procedure EditarUsuario;
    procedure ExcluirUsuario;
    procedure SalvarUsuario(AValidarDados: Boolean = true);
    procedure CalcelarManutencaoUsuario;

    procedure CarregarTreeViewPermissao(ATreeView: TTreeView);
    procedure MarcarDesmarcarPermissao(AAbsoluteIndex: Integer);
    procedure ValidarSenhas(ASenha, ASenhaRepetida: String);
    procedure AlterarSenhaUsuario(ASenhaAtual, ANovaSenha, ANovaSenhaRepetida: String);
    procedure ValidarPermissaoActionList(AActionList: TActionList);

    function SolicitarLogin: Boolean;
    function ValidarUsuario(AUsuario, ASenha: String): Boolean;
    function TemPermissaoAcesso(ACodigoPermissao: Integer): Boolean;
  end;

var
  dmUsuario: TdmUsuario;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

uses uLogin, uConexao, uMensagem;

{$R *.dfm}

{ TdmUsuario }

procedure TdmUsuario.AdicionarUsuario;
begin
  if not cdsTblusu.Active then
    FiltrarUsuarios;

  CalcelarManutencaoUsuario;

  cdsTblusu.Append;
end;

procedure TdmUsuario.AlterarSenhaUsuario(ASenhaAtual, ANovaSenha,
  ANovaSenhaRepetida: String);
var
  SenhaAtualMD5: String;
begin

  if trim(ASenhaAtual) = EmptyStr then
    raise Exception.Create('A senha atual deve ser informada.');

  if trim(ANovaSenha) = EmptyStr then
    raise Exception.Create('A nova senha deve ser informada.');

  if trim(ANovaSenhaRepetida) = EmptyStr then
    raise Exception.Create('A repetição da nova senha deve ser informada.');

  if cdsUsuarioususenha.AsString <> GetSenhaMd5(ASenhaAtual) then
    raise Exception.Create('A senha atual não é igual a senha que você utiliza hoje.');

  if ANovaSenha <> ANovaSenhaRepetida then
    raise Exception.Create('A nova senha e a repetição da nova senha não são iguais.');

  cdsUsuario.Edit;
  cdsUsuarioususenha.AsString := GetSenhaMd5(ANovaSenha);
  cdsUsuario.Post;

  cdsUsuario.ApplyUpdates(0);

  MessageDlg('Senha alterada com sucesso.', mtInformation,[mbOK],0);
end;

procedure TdmUsuario.CalcelarManutencaoUsuario;
begin
  if not cdsTblusu.Active then
    exit;

  if cdsTblusu.State in [dsEdit, dsInsert] then
    cdsTblusu.Cancel;

  if cdsTblusu.ChangeCount > 0 then
    cdsTblusu.CancelUpdates;
end;

procedure TdmUsuario.CarregarTreeView(ATreeView: TTreeView; APai: Integer;
  ATipo: String; ADescr: String; ANode: TTreeNode);
var
  sqlDataSet: TSQLDataSet;
  SQL: String;
  Marcador: String;
begin
  if ANode = nil then
    ANode := ATreeView.Items.AddChild(nil, ADescr)
  else
    ANode := ATreeView.Items.AddChild(ANode, ADescr);

  // Verifica qual imagem deve ser colocada no Node.
  if (ATipo = '1') or (ATipo = '2') then
  begin
    ANode.ImageIndex := 0;
    ANode.SelectedIndex := 0;
    Marcador := 'N';
  end
  else
  begin
    // Se o usuário tem a determinada permissão marca como S - Sim
    if cdsTblpdu.Locate('adscod', APai, []) then
    begin
      ANode.ImageIndex := 1;
      ANode.SelectedIndex := 1;
      Marcador := 'S';
    end
    else
    begin
      ANode.ImageIndex := 2;
      ANode.SelectedIndex := 2;
      Marcador := 'N';
    end;
  end;

  cdsTreeView.AppendRecord([
    APai,
    StrToInt(ATipo),
    ADescr,
    Marcador,
    anode.AbsoluteIndex]);

  sqlDataSet := TSQLDataSet.Create(nil);
  try
    SQL :=
      'select tblads.* ' +
      '  from tblads ' +
      ' where adscodpai = ' + IntToStr(APai) +
      ' order by adsordem';

    sqlDataSet.CommandText := SQL;
    sqlDataSet.SQLConnection := dmConexao.SQLConnection;
    sqlDataSet.Close;
    sqlDataSet.Open;

    while not sqlDataSet.Eof do
    begin
      CarregarTreeView(ATreeView, sqlDataSet.FieldByName('adscod').AsInteger, sqlDataSet.FieldByName('adstipo').AsString, sqlDataSet.FieldByName('adsdescr').AsString, ANode);

      sqlDataSet.Next;
    end;
  finally
    FreeAndNil(sqlDataSet);
  end;
end;

procedure TdmUsuario.CarregarTreeViewPermissao(ATreeView: TTreeView);
var
  sqlDataSet: TSQLDataSet;
  Node1, Node2, Node3: TTreeNode;
begin
  ATreeView.Items.Clear;

  TfrmMensagem.MostrarMesagem('Aguarde, carregando lista de permissões...');
  try
    cdsTreeView.Close;
    cdsTreeView.CreateDataSet;
    cdsTreeView.Open;

    sqlDataSet := TSQLDataSet.Create(nil);
    try
      sqlDataSet.CommandText := 'select * from tblads where adstipo = 1 order by adsordem';
      sqlDataSet.SQLConnection := dmConexao.SQLConnection;

      sqlDataSet.Close;
      sqlDataSet.Open;

      while not sqlDataSet.Eof do
      begin
        CarregarTreeView(ATreeView, sqlDataSet.FieldByName('adscod').AsInteger, sqlDataSet.FieldByName('adstipo').AsString, sqlDataSet.FieldByName('adsdescr').AsString, nil);

        sqlDataSet.Next;
      end;
    finally
      FreeAndNil(sqlDataSet);
    end;

    // Expandir todos os Nodes
    ATreeView.FullExpand;

    // Posiciona no primeiro item da Tree.
    ATreeView.Items[0].Selected := true;
  finally
    TfrmMensagem.MostrarMesagem;
  end;
end;

procedure TdmUsuario.cdsTblusuAfterScroll(DataSet: TDataSet);
begin
  sqlTblpdu.Close;
  sqlTblpdu.ParamByName('usucod').AsInteger := cdsTblusuusucod.AsInteger;
  cdsTblpdu.Close;
  cdsTblpdu.Open;
end;

procedure TdmUsuario.cdsTblusuBeforeOpen(DataSet: TDataSet);
begin
  cdsTblpdu.Close;
end;

procedure TdmUsuario.cdsTblusuCalcFields(DataSet: TDataSet);
begin
  if cdsTblusuusuativo.Value = 1 then
    cdsTblusuCalcDescrUsuativo.AsString := 'Sim'
  else
    cdsTblusuCalcDescrUsuativo.AsString := 'Não';
end;

procedure TdmUsuario.cdsTblusuNewRecord(DataSet: TDataSet);
begin
  cdsTblusu.Tag := 1;
  try
    // Valores defaults para um novo usuário
    cdsTblusuusucod.Value := 0;
    cdsTblusuusuativo.Value := 1; // Usuário ativo
  finally
    cdsTblusu.Tag := 0;
  end;
end;

procedure TdmUsuario.cdsTblusuusuloginValidate(Sender: TField);
begin
  if cdsTblusu.Tag = 1 then
    exit;

  if trim(cdsTblusuusulogin.AsString) = EmptyStr then
    raise Exception.Create('Login não pode ser nulo.');
end;

procedure TdmUsuario.cdsTblusuusunomeValidate(Sender: TField);
begin
  if cdsTblusu.Tag = 1 then
    exit;

  if trim(cdsTblusuusunome.AsString) = EmptyStr then
    raise Exception.Create('Nome do usuário não pode ser nulo.');
end;

procedure TdmUsuario.cdsTblusuususenhaValidate(Sender: TField);
begin
  if cdsTblusu.Tag = 1 then
    exit;

  if trim(cdsTblusuususenha.AsString) = EmptyStr then
    raise Exception.Create('Senha não pode ser nula.');
end;

procedure TdmUsuario.dspMenuUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(e.Message);
end;

procedure TdmUsuario.dspTblpduUpdateError(Sender: TObject;
  DataSet: TCustomClientDataSet; E: EUpdateError; UpdateKind: TUpdateKind;
  var Response: TResolverResponse);
begin
  raise Exception.Create(e.Message);
end;

procedure TdmUsuario.EditarUsuario;
begin
  if not cdsTblusu.Active then
    raise Exception.Create('Nenhum usuário está selecionado.');

  if cdsTblusu.RecordCount = 0 then
    raise Exception.Create('Nenhum usuário está selecionado.');

  cdsTblusu.Edit;

  cdsTblusuCalcSenha.AsString := cdsTblusuususenha.AsString;
  cdsTblusuCalcSenhaRepetir.AsString := cdsTblusuususenha.AsString;
end;

procedure TdmUsuario.ExcluirUsuario;
begin
  if not cdsTblusu.Active then
    raise Exception.Create('Nenhum usuário está selecionado.');

  if cdsTblusu.RecordCount = 0 then
    raise Exception.Create('Nenhum usuário está selecionado.');

  if MessageDlg('Deseja realmente excluir o usuário selecionado?', mtConfirmation,[mbYes, mbNo],0) <> mrYes then
    exit;

  cdsTblusu.Delete;

  SalvarUsuario(false);
end;

procedure TdmUsuario.FiltrarUsuarios(ALogin, ANome: String);
var
  SQL: String;
  UsuarioSelecionado: Integer;
begin
  // Será utilizado para posicionar na lista
  if cdsTblusu.Active then
    UsuarioSelecionado := cdsTblusuusucod.AsInteger
  else
    UsuarioSelecionado := -1;

  ALogin := trim(ALogin);
  ANome := trim(ANome);

  SQL := 'select * from tblusu';

  if (ALogin = EmptyStr) and (ANome = EmptyStr) then
  begin
    SQL := SQL + ' where 1 = 2';
  end
  else
  begin
    SQL := SQL + ' where 1 = 1';

    if ALogin <> EmptyStr then
      SQL := SQL + ' and usulogin like "%' + ALogin + '%"';

    if ANome <> EmptyStr then
      SQL := SQL + ' and usunome like "%' + ANome + '%"';
  end;

  SQL := SQL + ' order by usunome';

  sqlTblusu.Close;
  sqlTblusu.CommandText := SQL;

  cdsTblusu.DisableControls;
  try
    cdsTblusu.Close;
    cdsTblusu.Open;

    PosicionarUsuario(UsuarioSelecionado);
  finally
    cdsTblusu.EnableControls;
  end;
end;

function TdmUsuario.GetSenhaMd5(ASenhaNornal: String): String;
var
  idmd5 : TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    result := idmd5.HashStringAsHex(ASenhaNornal);
  finally
    FreeAndNil(idmd5);
  end;
end;

procedure TdmUsuario.MarcarDesmarcarPermissao(AAbsoluteIndex: Integer);
begin
  if cdsTreeView.Locate('posicao', AAbsoluteIndex, []) then
  begin
    if (cdsTreeViewadstipo.AsInteger = 1) or (cdsTreeViewadstipo.AsInteger = 2) then
      exit;

    cdsTreeView.Edit;

    if cdsTreeViewmarcado.Value = 'S' then
    begin
      cdsTreeViewmarcado.Value := 'N';

      if cdsTblpdu.Locate('adscod', cdsTreeViewadscod.Value, []) then
        cdsTblpdu.Delete;
    end
    else if cdsTreeViewmarcado.Value = 'N' then
    begin
      cdsTreeViewmarcado.Value := 'S';

      if not cdsTblpdu.Locate('adscod', cdsTreeViewadscod.Value, []) then
        cdsTblpdu.AppendRecord([cdsTblusuusucod.Value, cdsTreeViewadscod.Value]);
    end;

    cdsTreeView.Post;
  end;
end;

procedure TdmUsuario.PosicionarUsuario(ACodigo: integer);
begin
  if not cdsTblusu.Active then
    exit;

  if cdsTblusu.RecordCount = 0 then
    exit;

  if ACodigo = -1 then
    exit;

  cdsTblusu.Locate('usucod', ACodigo, []);
end;

procedure TdmUsuario.SalvarUsuario(AValidarDados: Boolean);
var
  Transaction: TDBXTransaction;
begin
  if not cdsTblusu.Active then
    raise Exception.Create('Nenhum usuário está selecionado.');

  TfrmMensagem.MostrarMesagem('Aguarde, salvando dados...');
  try
    // ---------------------------------------------------------------------------
    // Aplica mais uma vez os métodos de validação
    // ---------------------------------------------------------------------------

    if AValidarDados then
    begin
      cdsTblusuusuloginValidate(cdsTblusuusulogin);
      cdsTblusuusunomeValidate(cdsTblusuusunome);
      dmUsuario.ValidarSenhas(cdsTblusuCalcSenha.AsString, cdsTblusuCalcSenhaRepetir.AsString);
    end;

    Transaction := dmConexao.SQLConnection.BeginTransaction(TDBXIsolations.ReadCommitted);
    try
      try
        if cdsTblusu.State in [dsEdit, dsInsert] then
          cdsTblusu.Post;

        if cdsTblpdu.State in [dsEdit, dsInsert] then
          cdsTblpdu.Post;

        if AValidarDados then
        begin
          if cdsTblusuusucod.Value = 0 then
          begin
            // Busca um novo número para o usuário novo
            sqlNovoUsucod.Close;
            sqlNovoUsucod.Open;

            cdsTblusu.Edit;
            cdsTblusuusucod.Value := sqlNovoUsucodusucod.AsInteger;
            cdsTblusu.Post;

            if cdsTblpdu.RecordCount > 0 then
            begin
              cdsTblpdu.First;
              while not cdsTblpdu.Eof do
              begin
                cdsTblpdu.Edit;
                cdsTblpduusucod.Value := sqlNovoUsucodusucod.AsInteger;
                cdsTblpdu.Post;

                cdsTblpdu.Next;
              end;
            end;
          end;
        end;

        // Persiste os dados do usuário
        cdsTblusu.ApplyUpdates(0);

        // Persiste os dados das permissões que o usuário tem
        cdsTblpdu.ApplyUpdates(0);

        // Finaliza a transação
        dmConexao.SQLConnection.CommitFreeAndNil(Transaction);
      except
        on E: Exception do
        begin
          if dmConexao.SQLConnection.InTransaction then
            dmConexao.SQLConnection.RollbackFreeAndNil(Transaction);

          if cdsTblusu.ChangeCount > 0 then
            cdsTblusu.Cancel;

          if pos('key violation', LowerCase(e.Message)) > 0 then
            raise Exception.Create('Usuário informado já está cadastrado.')
          else if pos('duplicate entry', LowerCase(e.Message)) > 0 then
            raise Exception.Create('Usuário informado já está cadastrado.')
          else if pos('foreign key constraint fails', LowerCase(e.Message)) > 0 then
            raise Exception.Create('Não é possível excluir este usuário, pois este usuário já realizou baixas de pagamentos.')
          else if pos('changed by another user', LowerCase(e.Message)) > 0 then
            raise Exception.Create('Atenção:' + chr(10) + 'O registro que você está tentando modificar acaba de ser modificado por outro usuário.' + chr(10) + 'Cancele a operação e realize uma nova filtragem.')
          else
            raise Exception.Create(e.Message);
        end;
      end;
    finally
      if dmConexao.SQLConnection.InTransaction then
        dmConexao.SQLConnection.RollbackFreeAndNil(Transaction);
    end;
  finally
    TfrmMensagem.MostrarMesagem;
  end;
end;

function TdmUsuario.SolicitarLogin: Boolean;
begin
  Result := false;

  try
    frmLogin := TfrmLogin.Create(nil);

    if frmLogin.ShowModal = mrOk then
      Result := true;
  finally
    FreeAndNil(frmLogin);
  end;
end;

function TdmUsuario.TemPermissaoAcesso(ACodigoPermissao: Integer): Boolean;
begin
  Result := False;

  try
    sqlVerificaPermiss.Close;
    sqlVerificaPermiss.ParamByName('usucod').AsInteger := cdsUsuariousucod.AsInteger;
    sqlVerificaPermiss.ParamByName('adscod').AsInteger := ACodigoPermissao;
    sqlVerificaPermiss.Open;

    if sqlVerificaPermissqtdepermiss.AsInteger > 0 then
      Result := true;
  except
    on E: Exception do
      MessageDlg('Validação de permissão' + chr(10) + 'Erro: ' + e.Message, mtError,[mbOK],0);
  end;
end;

procedure TdmUsuario.ValidarPermissaoActionList(AActionList: TActionList);
var
  I: Integer;
begin
  for I := 0 to AActionList.ActionCount -1 do
    if AActionList.Actions[i].Tag > 0 then
      TAction(AActionList.Actions[i]).Enabled:= TemPermissaoAcesso(AActionList.Actions[i].Tag);
end;

procedure TdmUsuario.ValidarSenhas(ASenha, ASenhaRepetida: String);
begin
  if trim(ASenha) = EmptyStr then
    raise Exception.Create('Senha não foi informada.');

  if trim(ASenhaRepetida) = EmptyStr then
    raise Exception.Create('Repetição da senha não foi informada.');

  if ASenha <> ASenhaRepetida then
    raise Exception.Create('A repetição da senha não é igual a senha.');

  if Length(ASenha) <> 32 then // A senha não é MD5 ainda.
  begin
    if Length(ASenha) > 15 then
      raise Exception.Create('A senha deve conter no máximo 15 caracteres.');

    if not (cdsTblusu.State in [dsEdit, dsInsert]) then
      cdsTblusu.Edit;

    cdsTblusuususenha.AsString := GetSenhaMd5(ASenha);
  end;

end;

function TdmUsuario.ValidarUsuario(AUsuario, ASenha: String): Boolean;
begin
  Result := false;

  ASenha := GetSenhaMd5(ASenha);

  sqlUsuario.Close;
  sqlUsuario.ParamByName('usulogin').AsString := AUsuario;
  sqlUsuario.ParamByName('ususenha').AsString := ASenha;

  cdsUsuario.Close;
  cdsUsuario.Open;

  if cdsUsuario.RecordCount = 0 then
  begin
    MessageDlg('Usuário ou senha inválida.', mtWarning,[mbOK],0);
    exit;
  end;

  if cdsUsuariousuativo.AsInteger = 0 then
  begin
    MessageDlg('Usuário não está ativo.', mtWarning,[mbOK],0);
    exit;
  end;

  Result := true;
end;

end.
