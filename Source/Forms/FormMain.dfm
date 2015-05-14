object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'My Test App'
  ClientHeight = 265
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
    265)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 170
    Top = 21
    Width = 415
    Height = 13
    Caption = 
      'This requires admin rights. Typically called once-off during the' +
      ' application'#39's installation.'
  end
  object Label2: TLabel
    Left = 170
    Top = 52
    Width = 376
    Height = 13
    Caption = 
      'Write information, warning and error test message to the Windows' +
      ' Event Log.'
  end
  object WriteToEventLogButton: TButton
    Left = 16
    Top = 47
    Width = 145
    Height = 25
    Caption = 'Write to Event Log'
    TabOrder = 0
    OnClick = WriteToEventLogButtonClick
  end
  object RegisterEventSourceButton: TButton
    Left = 16
    Top = 16
    Width = 145
    Height = 25
    Caption = 'Register Event Source'
    ElevationRequired = True
    TabOrder = 1
    OnClick = RegisterEventSourceButtonClick
  end
  object Memo: TMemo
    Left = 16
    Top = 88
    Width = 565
    Height = 153
    Anchors = [akLeft, akTop, akRight, akBottom]
    ScrollBars = ssVertical
    TabOrder = 2
    ExplicitWidth = 562
  end
end
