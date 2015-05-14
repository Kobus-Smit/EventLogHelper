program MyTestApp;

uses
  Forms,
  FormMain in 'Forms\FormMain.pas' {MainForm},
  EventLog in 'Units\EventLog.pas';

{$R *.res}
{$R MessageFile\MessageFile.res}

begin
  Application.Initialize;

  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
