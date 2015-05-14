unit EventLogTest;

interface

type
  TEventLogTest = class
  private
    FEventLogHandle: THandle;
    FSource: String;
    procedure Write(AEntryType: Word; AEventId: Cardinal; AMessage: string);
    procedure CheckEventSourceHandle;
  public
    constructor Create(ASource: string);
    destructor Destroy; override;

    property Source: string read FSource write FSource;

    procedure WriteInfo(AMessage: string);
    procedure WriteWarning(AMessage: string);
    procedure WriteError(AMessage: string);

    procedure AddEventSourceToRegistry;
  end;

implementation

uses Windows, Registry, SysUtils;

constructor TEventLogTest.Create;
begin
  FSource := ASource;
  FEventLogHandle := RegisterEventSource(nil, PChar(FSource));
  CheckEventSourceHandle;
end;

destructor TEventLogTest.Destroy;
begin
  DeregisterEventSource(FEventLogHandle);
  inherited;
end;

procedure TEventLogTest.CheckEventSourceHandle;
begin
  if FEventLogHandle <= 0 then
  begin
    raise Exception.Create('Could not obtain Event Log handle.');
  end;
end;

procedure TEventLogTest.WriteInfo(AMessage: string);
begin
  Write(EVENTLOG_INFORMATION_TYPE, 2, AMessage);
end;

procedure TEventLogTest.WriteWarning(AMessage: string);
begin
  Write(EVENTLOG_WARNING_TYPE, 3, AMessage);
end;

procedure TEventLogTest.WriteError(AMessage: string);
begin
  Write(EVENTLOG_ERROR_TYPE, 4, AMessage);
end;

procedure TEventLogTest.Write(AEntryType: Word; AEventId: Cardinal; AMessage: string);
begin
  CheckEventSourceHandle;
  ReportEvent(FEventLogHandle, AEntryType, 0, AEventId, nil, 1, 0, @AMessage, nil);
end;

// This requires admin rights. Typically called once-off during the application's installation
procedure TEventLogTest.AddEventSourceToRegistry;
var
  reg: TRegistry;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_LOCAL_MACHINE;
    if reg.OpenKey('\SYSTEM\CurrentControlSet\Services\Eventlog\Application\' + Source, True) then
    begin
      reg.WriteString('EventMessageFile', ParamStr(0)); // The application exe's path
      reg.WriteInteger('TypesSupported', 7);
      reg.CloseKey;
    end
    else
    begin
      raise Exception.Create('Error updating the registry. This action requires administrative rights.');
    end;
  finally
    reg.Free;
  end;
end;

end.
