program Desafio;

uses
  Vcl.Forms,
  View.Main in 'src\View.Main.pas' {Form1},
  Regra.Interfaces in 'src\Regra.Interfaces.pas',
  Regra.Parametros in 'src\Regra.Parametros.pas',
  Regra.Operacoes in 'src\Regra.Operacoes.pas',
  Regra.Controller in 'src\Regra.Controller.pas',
  Regra.PrecoFeriado in 'src\Regra.PrecoFeriado.pas',
  Regra.Tipo in 'src\Regra.Tipo.pas',
  Regra.PrecoAtacado in 'src\Regra.PrecoAtacado.pas',
  Regra.PrecoVarejo in 'src\Regra.PrecoVarejo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
