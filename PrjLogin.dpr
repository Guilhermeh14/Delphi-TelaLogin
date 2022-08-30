program PrjLogin;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  UntLogin in 'UntLogin.pas' {Frmlogin},
  Uprincipal in 'Uprincipal.pas' {frmprincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmlogin, Frmlogin);
  Application.CreateForm(Tfrmprincipal, frmprincipal);
  TStyleManager.TrySetStyle('Turquoise Gray');
  Application.Run;
end.
