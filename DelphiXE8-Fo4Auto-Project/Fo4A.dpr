program Fo4A;

uses
  Vcl.Forms,
  main in 'main.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  Management in 'Management.pas',
  HandleGame in 'HandleGame.pas',
  afxCodeHook in 'afxCodeHook.pas',
  GlobalVars in 'GlobalVars.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Emerald Light Slate');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
