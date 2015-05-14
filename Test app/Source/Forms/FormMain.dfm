object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'My Test App'
  ClientHeight = 301
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    598
    301)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 159
    Top = 13
    Width = 415
    Height = 13
    Caption = 
      'This requires admin rights. Typically called once-off during the' +
      ' application'#39's installation.'
  end
  object Label2: TLabel
    Left = 159
    Top = 44
    Width = 376
    Height = 13
    Caption = 
      'Write information, warning and error test message to the Windows' +
      ' Event Log.'
  end
  object Label3: TLabel
    Left = 318
    Top = 75
    Width = 217
    Height = 13
    Caption = 'Compare performance of 3 different versions'
  end
  object Label4: TLabel
    Left = 232
    Top = 75
    Width = 45
    Height = 13
    Caption = 'iterations'
  end
  object WriteToEventLogButton: TButton
    Left = 8
    Top = 39
    Width = 145
    Height = 25
    Caption = 'Write to Event Log'
    TabOrder = 0
    OnClick = WriteToEventLogButtonClick
  end
  object RegisterEventSourceButton: TButton
    Left = 8
    Top = 8
    Width = 145
    Height = 25
    Caption = 'Register Event Source'
    ElevationRequired = True
    TabOrder = 1
    OnClick = RegisterEventSourceButtonClick
  end
  object Memo: TMemo
    Left = 8
    Top = 101
    Width = 582
    Height = 187
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 2
  end
  object TimeTestButton: TButton
    Left = 8
    Top = 70
    Width = 145
    Height = 25
    Caption = 'Time Test'
    TabOrder = 3
    OnClick = TimeTestButtonClick
  end
  object IterationsCountEdit: TSpinEdit
    Left = 159
    Top = 72
    Width = 66
    Height = 22
    Increment = 1000
    MaxValue = 0
    MinValue = 0
    TabOrder = 4
    Value = 5000
  end
end
