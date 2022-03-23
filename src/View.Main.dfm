object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 139
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ComboBox1: TComboBox
    Left = 16
    Top = 16
    Width = 145
    Height = 21
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object Edit1: TEdit
    Left = 16
    Top = 56
    Width = 145
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 16
    Top = 96
    Width = 145
    Height = 25
    Caption = 'Ver Pre'#231'o'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 184
    Top = 16
    Width = 241
    Height = 105
    TabOrder = 3
  end
end
