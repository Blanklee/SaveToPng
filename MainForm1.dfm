object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Paste image & Save to png'
  ClientHeight = 312
  ClientWidth = 744
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
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
    Top = 112
    Width = 164
    Height = 20
    Caption = 'File name to save (.png)'
  end
  object Label2: TLabel
    Left = 384
    Top = 253
    Width = 59
    Height = 20
    Caption = 'Saved to'
  end
  object Button1: TButton
    Left = 384
    Top = 24
    Width = 322
    Height = 65
    Caption = 'Paste image from Clipboard'
    TabOrder = 0
    OnClick = Button1Click
    OnKeyDown = FormKeyDown
  end
  object Button3: TButton
    Left = 384
    Top = 178
    Width = 185
    Height = 55
    Caption = 'Save image'
    TabOrder = 3
    OnClick = Button3Click
    OnKeyDown = FormKeyDown
  end
  object Edit1: TEdit
    Left = 384
    Top = 136
    Width = 241
    Height = 28
    TabOrder = 1
  end
  object Button2: TButton
    Left = 631
    Top = 136
    Width = 75
    Height = 28
    Caption = 'File..'
    TabOrder = 2
    OnClick = Button2Click
    OnKeyDown = FormKeyDown
  end
  object Button4: TButton
    Left = 584
    Top = 178
    Width = 122
    Height = 55
    Caption = 'Exit'
    TabOrder = 4
    OnClick = Button4Click
    OnKeyDown = FormKeyDown
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = '.png'
    Filter = 'PNG image file (*.png)|*.png'
    Left = 120
    Top = 104
  end
end
