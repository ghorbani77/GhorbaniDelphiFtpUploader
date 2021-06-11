object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Ftp Manager - Ghorbani77@gmail.com'
  ClientHeight = 423
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 22
    Top = 237
    Width = 68
    Height = 13
    Caption = 'File to upload:'
  end
  object Label5: TLabel
    Left = 45
    Top = 312
    Width = 46
    Height = 13
    Caption = 'Progress:'
  end
  object Label8: TLabel
    Left = 18
    Top = 160
    Width = 72
    Height = 13
    Caption = 'Remote folder:'
  end
  object Label10: TLabel
    Left = 40
    Top = 121
    Width = 50
    Height = 13
    Caption = 'Password:'
  end
  object Label9: TLabel
    Left = 38
    Top = 82
    Width = 52
    Height = 13
    Caption = 'Username:'
  end
  object Label7: TLabel
    Left = 46
    Top = 44
    Width = 44
    Height = 13
    Caption = 'Ftp host:'
  end
  object Label1: TLabel
    Left = 45
    Top = 351
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 18
    Top = 402
    Width = 225
    Height = 13
    Caption = 'Ghorbani77@gmail.com       +98-919-143-7539'
  end
  object Button5: TButton
    Left = 628
    Top = 355
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 8
    OnClick = Button5Click
  end
  object GroupBox2: TGroupBox
    Left = 296
    Top = 26
    Width = 410
    Height = 323
    Caption = 'Status:'
    TabOrder = 9
    object Memo1: TMemo
      Left = 3
      Top = 15
      Width = 404
      Height = 298
      ReadOnly = True
      TabOrder = 0
    end
  end
  object ProgressBar2: TProgressBar
    Left = 97
    Top = 312
    Width = 160
    Height = 17
    TabOrder = 10
  end
  object Button3: TButton
    Left = 96
    Top = 234
    Width = 67
    Height = 25
    Caption = '2. Choose'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 97
    Top = 273
    Width = 66
    Height = 25
    Caption = '3. Upload'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button2: TButton
    Left = 169
    Top = 195
    Width = 66
    Height = 25
    Caption = 'Disconnect'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 96
    Top = 195
    Width = 67
    Height = 25
    Caption = '1. Connect'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Edit4: TEdit
    Left = 96
    Top = 157
    Width = 153
    Height = 21
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 96
    Top = 118
    Width = 153
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 96
    Top = 79
    Width = 153
    Height = 21
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 96
    Top = 41
    Width = 153
    Height = 21
    TabOrder = 0
    Text = 'ftp.ghorbani.dev'
  end
  object OpenDialog1: TOpenDialog
    Left = 520
  end
  object IdFTP1: TIdFTP
    OnStatus = IdFTP1Status
    OnWork = IdFTP1Work
    OnWorkBegin = IdFTP1WorkBegin
    OnWorkEnd = IdFTP1WorkEnd
    ConnectTimeout = 0
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 576
  end
end
