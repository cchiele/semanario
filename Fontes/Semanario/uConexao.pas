unit uConexao;

interface

uses
  Winapi.Windows, Vcl.Forms, System.SysUtils, System.Classes, Data.DB, Data.SqlExpr,
  Data.DBXMySQL, IniFiles;

type
  TdmConexao = class(TDataModule)
    SQLConnection: TSQLConnection;
    procedure DataModuleCreate(Sender: TObject);
    procedure SQLConnectionBeforeConnect(Sender: TObject);
  private
    { Private declarations }
    FSenha: string;
    FDataBase: string;
    FHost: string;
    FUser: string;

    procedure CarregarConfig;

  public
    { Public declarations }
    property Host: string read FHost;
    property User: string read FUser;
    property Senha: string read FSenha;
    property DataBase: string read FDataBase;
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TdmConexao.CarregarConfig;
var
  ArqINI: TIniFile;
  ArqConfigDB: String;
begin
  ArqConfigDB := ExtractFilePath(Application.ExeName) + 'ConfigDB.ini';

  if not FileExists(ArqConfigDB) then
  begin
    ArqIni := TIniFile.Create(ArqConfigDB);
    try
      ArqINI.WriteString('MySQL', 'Host', 'localhost');
      ArqINI.WriteString('MySQL', 'User', 'usuario');
      ArqINI.WriteString('MySQL', 'Senha', 'senha');
      ArqINI.WriteString('MySQL', 'DataBase', 'banco_de_dados');
    finally
      FreeAndNil(ArqIni);
    end;
  end;

  ArqIni := TIniFile.Create(ArqConfigDB);
  try
    FHost := ArqINI.ReadString('MySQL', 'Host', '');
    FUser := ArqINI.ReadString('MySQL', 'User', '');
    FSenha := ArqINI.ReadString('MySQL', 'Senha', '');
    FDataBase := ArqINI.ReadString('MySQL', 'DataBase', '');
  finally
    FreeAndNil(ArqIni);
  end;

end;

procedure TdmConexao.DataModuleCreate(Sender: TObject);
begin
  CarregarConfig;
end;

procedure TdmConexao.SQLConnectionBeforeConnect(Sender: TObject);
begin
  if SQLConnection.Connected then
    SQLConnection.Close;

  if Host = EmptyStr then
    CarregarConfig;

  SQLConnection.Params.Values['HostName'] := Host;
  SQLConnection.Params.Values['Database'] := DataBase;
  SQLConnection.Params.Values['User_Name'] := User;
  SQLConnection.Params.Values['Password'] := Senha;
end;

end.
