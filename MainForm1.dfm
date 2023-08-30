object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 311
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 20
  object Shape1: TShape
    Left = 8
    Top = 16
    Width = 345
    Height = 265
    Brush.Color = clBtnFace
  end
  object Image1: TImage
    Left = 16
    Top = 24
    Width = 329
    Height = 249
    Stretch = True
  end
  object Label1: TLabel
    Left = 384
    Top = 120
    Width = 165
    Height = 20
    Caption = 'File name to save (.png)'
  end
  object Button1: TButton
    Left = 384
    Top = 64
    Width = 241
    Height = 25
    Caption = 'Paste image from Clipboard'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 384
    Top = 186
    Width = 241
    Height = 25
    Caption = 'Save image to .png file'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 384
    Top = 144
    Width = 241
    Height = 28
    TabOrder = 1
  end
end
