object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Kontrol Paneli'
  ClientHeight = 553
  ClientWidth = 582
  Color = clBtnFace
  Constraints.MaxHeight = 600
  Constraints.MaxWidth = 600
  Constraints.MinHeight = 600
  Constraints.MinWidth = 600
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  TextHeight = 15
  object Label3: TLabel
    Left = 256
    Top = 167
    Width = 54
    Height = 25
    Caption = #220'yeler'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -18
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 232
    Top = 386
    Width = 104
    Height = 23
    Caption = 'Kart Tan'#305'mla'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -17
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 8
    Top = 415
    Width = 55
    Height = 23
    Caption = 'Kart ID'
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 160
    Top = 415
    Width = 96
    Height = 23
    Caption = #304'sim Soyisim'
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 312
    Top = 415
    Width = 28
    Height = 23
    Caption = 'Ki'#351'i'
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 464
    Top = 415
    Width = 41
    Height = 23
    Caption = #220'cret'
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label16: TLabel
    Left = 55
    Top = 129
    Width = 5
    Height = 23
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 568
    Height = 169
    Caption = 'Ba'#287'lant'#305
    TabOrder = 0
    object Label1: TLabel
      Left = 448
      Top = 22
      Width = 51
      Height = 20
      Caption = 'Ba'#287'lan'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 24
      Top = 19
      Width = 89
      Height = 23
      Caption = 'PORT Girin'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 24
      Top = 77
      Width = 108
      Height = 23
      Caption = #214'rnek: COM5'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object CheckBox1: TCheckBox
      Left = 425
      Top = 22
      Width = 17
      Height = 23
      TabOrder = 0
      OnClick = CheckBox1Click
    end
  end
  object Edit1: TEdit
    Left = 8
    Top = 444
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 160
    Top = 444
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 312
    Top = 444
    Width = 121
    Height = 23
    TabOrder = 3
  end
  object Edit4: TEdit
    Left = 462
    Top = 444
    Width = 112
    Height = 23
    TabOrder = 4
  end
  object Button1: TButton
    Left = 200
    Top = 488
    Width = 176
    Height = 65
    Caption = #220'ye Ekle'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 5
    OnClick = Button1Click
  end
  object Edit5: TEdit
    Left = 32
    Top = 48
    Width = 121
    Height = 23
    TabOrder = 6
  end
  object Button2: TButton
    Left = 416
    Top = 506
    Width = 105
    Height = 40
    Caption = #220'ye D'#252'zenle'
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 7
    OnClick = Button2Click
  end
  object CheckBox2: TCheckBox
    Left = 32
    Top = 129
    Width = 17
    Height = 27
    TabOrder = 8
    OnClick = CheckBox2Click
  end
  object ListView1: TListView
    Left = 8
    Top = 198
    Width = 569
    Height = 179
    Columns = <
      item
        Caption = '#'
        Width = 22
      end
      item
        Caption = 'Kart ID'
        Width = 150
      end
      item
        Caption = #304'sim Soyisim'
        Width = 120
      end
      item
        Caption = 'Ki'#351'i'
        Width = 100
      end
      item
        Caption = #220'cret'
      end
      item
        Caption = 'Bakiye'
        Width = 70
      end
      item
        Caption = 'Okutma'
      end>
    GridLines = True
    HideSelection = False
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    TabOrder = 9
    ViewStyle = vsReport
  end
  object ButtonTopluSil: TButton
    Left = 55
    Top = 507
    Width = 105
    Height = 38
    Caption = 'Toplu Sil'
    Font.Charset = TURKISH_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = ButtonTopluSilClick
  end
  object ComPort1: TComPort
    BaudRate = br9600
    Port = 'COM3'
    Parity.Bits = prNone
    StopBits = sbOneStopBit
    DataBits = dbEight
    Events = [evRxChar, evTxEmpty, evRxFlag, evRing, evBreak, evCTS, evDSR, evError, evRLSD, evRx80Full]
    FlowControl.OutCTSFlow = False
    FlowControl.OutDSRFlow = False
    FlowControl.ControlDTR = dtrDisable
    FlowControl.ControlRTS = rtsDisable
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    StoredProps = [spBasic]
    TriggersOnRxChar = True
    Left = 472
    Top = 104
  end
  object TimerJSON: TTimer
    OnTimer = TimerJSONTimer
    Left = 448
    Top = 104
  end
end
