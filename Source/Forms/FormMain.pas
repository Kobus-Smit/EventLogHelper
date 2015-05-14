unit FormMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls;

type
  TMainForm = class(TForm)
    WriteToEventLogButton: TButton;
    RegisterEventSourceButton: TButton;
    Label1: TLabel;
    Memo: TMemo;
    Label2: TLabel;
    procedure WriteToEventLogButtonClick(Sender: TObject);
    procedure RegisterEventSourceButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  public
  end;

var
  MainForm: TMainForm;

implementation
{$R *.dfm}

uses
  EventLog, Registry;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  TEventLog.Source := 'My Test App Name';
end;

procedure TMainForm.RegisterEventSourceButtonClick(Sender: TObject);
begin
  try
    TEventLog.AddEventSourceToRegistry;
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
  TEventLog.WriteInfo('This is information.');
  TEventLog.WriteWarning('This is a warning.');
  TEventLog.WriteError('This is an error.');
  Memo.Lines.Add('Test messages were written to the Windows Event Log.');
end;

end.
