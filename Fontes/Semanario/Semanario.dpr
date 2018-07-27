program Semanario;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uRibbonDynamic in 'uRibbonDynamic.pas',
  uConexao in 'uConexao.pas' {dmConexao: TDataModule},
  uUsuario in 'uUsuario.pas' {dmUsuario: TDataModule},
  uLogin in 'uLogin.pas' {frmLogin},
  uCadZonas in 'uCadZonas.pas' {frmCadZonas},
  uCadCeps in 'uCadCeps.pas' {frmCadCeps},
  uDadosGlobal in 'uDadosGlobal.pas' {dmDadosGlobal: TDataModule},
  uDadosCep in 'uDadosCep.pas' {dmDadosCep: TDataModule},
  uCadUsuarios in 'uCadUsuarios.pas' {frmCadUsuarios},
  uDadosEmpresa in 'uDadosEmpresa.pas' {dmDadosEmpresa: TDataModule},
  uEmpresa in 'uEmpresa.pas' {frmEmpresa},
  uCadCobradores in 'uCadCobradores.pas' {frmCadCobradores},
  uDadosCobradores in 'uDadosCobradores.pas' {dmDadosCobradores: TDataModule},
  uDadosVendedores in 'uDadosVendedores.pas' {dmDadosVendedores: TDataModule},
  uCadGruposVendedores in 'uCadGruposVendedores.pas' {frmCadGruposVendedores},
  uAlterarSenha in 'uAlterarSenha.pas' {frmAlterarSenha},
  uCadVendedores in 'uCadVendedores.pas' {frmCadVendedores},
  uDadosZonasRuas in 'uDadosZonasRuas.pas' {dmDadosZonasRuas: TDataModule},
  uCadRuas in 'uCadRuas.pas' {frmCadRuas},
  uDadosAssinantes in 'uDadosAssinantes.pas' {dmDadosAssinantes: TDataModule},
  uCadAssinantes in 'uCadAssinantes.pas' {frmCadAssinantes},
  uLocalizarEndereco in 'uLocalizarEndereco.pas' {frmLocalizarEndereco},
  uMensagem in 'uMensagem.pas' {frmMensagem},
  uRenovarAssinaturasAuto in 'uRenovarAssinaturasAuto.pas' {frmRenovarAssinaturasAuto},
  uRelatBaixas in 'uRelatBaixas.pas' {frmRelatBaixas},
  uDadosRelat in 'uDadosRelat.pas' {dmDadosRelat: TDataModule},
  uRelatAssCanceladas in 'uRelatAssCanceladas.pas' {frmRelatAssCanceladas},
  uRelatAssPendentes in 'uRelatAssPendentes.pas' {frmRelatAssPendentes},
  uRelatRecibos in 'uRelatRecibos.pas' {frmRelatRecibos},
  uRelatEtiquetas in 'uRelatEtiquetas.pas' {frmRelatEtiquetas},
  uRelatAssinantes in 'uRelatAssinantes.pas' {frmRelatAssinantes},
  uCadBaixas in 'uCadBaixas.pas' {frmCadBaixas},
  uRelatAltCad in 'uRelatAltCad.pas' {frmRelatAltCad},
  uRelatCondicoesPagto in 'uRelatCondicoesPagto.pas' {frmRelatCondicoesPagto},
  uRelatAlteracoesAssinante in 'uRelatAlteracoesAssinante.pas' {frmRelatAlteracoesAssinante},
  uRelatDescontos in 'uRelatDescontos.pas' {frmRelatDescontos},
  uRelatCortesias in 'uRelatCortesias.pas' {frmRelatCortesias},
  uLocalizarCep in 'uLocalizarCep.pas' {frmLocalizarCep};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Semanário';
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
