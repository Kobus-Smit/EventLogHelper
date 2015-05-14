unit FormMain;

{$IF CompilerVersion >= 28} {$DEFINE DELPHI_XE7_AND_UP} {$IFEND}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Spin;

type
  TMainForm = class(TForm)
    WriteToEventLogButton: TButton;
    RegisterEventSourceButton: TButton;
    Label1: TLabel;
    Memo: TMemo;
    Label2: TLabel;
    TimeTestButton: TButton;
    Label3: TLabel;
    IterationsCountEdit: TSpinEdit;
    Label4: TLabel;
    procedure WriteToEventLogButtonClick(Sender: TObject);
    procedure RegisterEventSourceButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimeTestButtonClick(Sender: TObject);
  private
  public
  end;

var
  MainForm: TMainForm;

implementation
{$R *.dfm}

uses
  EventLog, Registry, Diagnostics, EventLogTest, EventLogOld
  {$IFDEF DELPHI_XE7_AND_UP}, System.Threading{$ENDIF};

procedure TMainForm.TimeTestButtonClick(Sender: TObject);
var
  i: Integer;
  sw: TStopWatch;
  eventLogTest: TEventLogTest;
begin
  Memo.Lines.Add('Starting...');

  sw := TStopwatch.Create;
  sw.Start;
  for i := 1 to IterationsCountEdit.Value do
  begin
    TEventLogOld.WriteInfo('Test');
  end;
  sw.Stop;
  Memo.Lines.Add(IntToStr(IterationsCountEdit.Value)+'x TEventLogOld.WriteInfo: ' + IntToStr(sw.ElapsedMilliseconds) + ' ms ' + IntToStr(sw.ElapsedTicks) + ' ticks');

  sw := sw.StartNew;
  eventLogTest := TEventLogTest.Create('My Test App Name');
  for i := 1 to IterationsCountEdit.Value do
  begin
    eventLogTest.WriteInfo('Test');
  end;
  eventLogTest.Free;
  sw.Stop;
  Memo.Lines.Add(IntToStr(IterationsCountEdit.Value)+'x TEventLogTest.WriteInfo: ' + IntToStr(sw.ElapsedMilliseconds) + ' ms ' + IntToStr(sw.ElapsedTicks) + ' ticks');

  sw := sw.StartNew;
  for i := 1 to IterationsCountEdit.Value do
  begin
    TEventLog.WriteInfo('Test');
  end;
  sw.Stop;
  Memo.Lines.Add(IntToStr(IterationsCountEdit.Value)+'x TEventLog.WriteInfo: ' + IntToStr(sw.ElapsedMilliseconds) + ' ms ' + IntToStr(sw.ElapsedTicks) + ' ticks');

  Memo.Lines.Add('');

 {$IFDEF DELPHI_XE7_AND_UP}
  sw := TStopwatch.Create;
  sw.Start;
  TParallel.For(1, IterationsCountEdit.Value, procedure (I: Integer)
  begin
    TEventLogOld.WriteInfo('Test');
  end);
  sw.Stop;
  Memo.Lines.Add(IterationsCountEdit.Value.ToString+'x Parallel TEventLogOld.WriteInfo: ' + sw.ElapsedMilliseconds.ToString + ' ms ' + sw.ElapsedTicks.ToString + ' ticks');

  sw := sw.StartNew;
  eventLogTest := TEventLogTest.Create('My Test App Name');
  TParallel.For(1, IterationsCountEdit.Value, procedure (I: Integer)
  begin
    eventLogTest.WriteInfo('Test');
  end);
  eventLogTest.Free;
  sw.Stop;
  Memo.Lines.Add(IterationsCountEdit.Value.ToString+'x Parallel TEventLogTest.WriteInfo: ' + sw.ElapsedMilliseconds.ToString + ' ms ' + sw.ElapsedTicks.ToString + ' ticks');

  sw := sw.StartNew;
  TParallel.For(1, IterationsCountEdit.Value, procedure (I: Integer)
  begin
    TEventLog.WriteInfo('Test');
  end);
  sw.Stop;
  Memo.Lines.Add(IterationsCountEdit.Value.ToString+'x Parallel TEventLog.WriteInfo: ' + sw.ElapsedMilliseconds.ToString + ' ms ' + sw.ElapsedTicks.ToString + ' ticks');

{$ENDIF};
  Memo.Lines.Add('Done.');
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  TEventLogOld.Source := 'My Test App Name';
end;

procedure TMainForm.RegisterEventSourceButtonClick(Sender: TObject);
begin
  try
    TEventLogOld.AddEventSourceToRegistry;
    Memo.Lines.Add('Registration succeeded.');
  except
    on E: Exception do
    begin
      Memo.Lines.Add('Registration error:');
      Memo.Lines.Add(E.ToString);
    end;
  end;
end;

procedure TMainForm.WriteToEventLogButtonClick(Sender: TObject);
begin
  TEventLogOld.WriteInfo('This is information.');
  TEventLogOld.WriteWarning('This is a warning.');
  TEventLogOld.WriteError('This is an error.');
  Memo.Lines.Add('Test messages were written to the Windows Event Log.');
end;

end.
