program MyTestApp;

uses
  Forms,
  FormMain in 'Forms\FormMain.pas' {MainForm},
  EventLogOld in 'Units\EventLogOld.pas',
  EventLogTest in 'Units\EventLogTest.pas',
  EventLog in '..\..\EventLog.pas';

{$R *.res}
{$R MessageFile\MessageFile.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
