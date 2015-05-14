# EventLogHelper
##### Simple Delphi class making it easier to write to the local machine's Windows Event Log.

```
//----------------- EXAMPLE USAGE: ---------------------------------

uses
  EventLog;

procedure TMainForm.EventLogExampleButtonClick(Sender: TObject);
begin
  TEventLog.Source := 'My Test App Name';

  TEventLog.WriteError('This is an error.');
  TEventLog.WriteInfo('This is information.');
  TEventLog.WriteWarning('This is a warning.');
end;
```

Also includes a ready to use [message file](https://github.com/Kobus-Smit/EventLogHelper/blob/master/Test%20app/Source/MessageFile/MessageFile.res)    [(More info)](https://msdn.microsoft.com/en-us/library/aa363669(v=vs.85).aspx)


and a [procedure to register your event source](https://github.com/Kobus-Smit/EventLogHelper/blob/master/EventLog.pas#L54)    [(More info)](https://msdn.microsoft.com/en-us/library/aa363634(VS.85).aspx)


```
procedure TMainForm.RegisterEventSourceButtonClick(Sender: TObject);
begin
    // This requires admin rights. Typically called once-off during the application's installation
    TEventLog.AddEventSourceToRegistry;
end;
```

See also http://stackoverflow.com/questions/30229826/writing-to-the-windows-event-log-using-delphi

Tested in Delphi XE and XE7
