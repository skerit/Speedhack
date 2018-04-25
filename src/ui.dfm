object Form1: TForm1
  Left = 100
  Top = 100
  BorderStyle = bsSingle
  Caption = 'Skerit'#39's C2 Speedhack'
  ClientHeight = 121
  ClientWidth = 149
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 8
    Width = 31
    Height = 13
    Caption = 'Speed'
  end
  object Label2: TLabel
    Left = 91
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Sleeptime'
  end
  object Edit1: TEdit
    Left = 11
    Top = 24
    Width = 49
    Height = 21
    TabOrder = 0
    Text = '2'
  end
  object Edit2: TEdit
    Left = 91
    Top = 24
    Width = 46
    Height = 21
    TabOrder = 1
    Text = '5'
  end
  object Button1: TButton
    Left = 6
    Top = 85
    Width = 131
    Height = 25
    Caption = 'OK'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 8
    Top = 56
    Width = 129
    Height = 21
    TabOrder = 3
  end
end
