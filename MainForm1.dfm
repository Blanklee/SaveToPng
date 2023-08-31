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
    Top = 151
    Width = 74
    Height = 20
    Caption = 'File name :'
  end
  object Button1: TButton
    Left = 384
    Top = 40
    Width = 322
    Height = 65
    Caption = 'Paste image from Clipboard (Ctrl+V)'
    TabOrder = 0
    OnClick = Button1Click
    OnKeyDown = FormKeyDown
  end
  object Button2: TButton
    Left = 384
    Top = 194
    Width = 185
    Height = 55
    Caption = 'Save image (Ctrl+S)'
    TabOrder = 1
    OnClick = Button2Click
    OnKeyDown = FormKeyDown
  end
  object Button3: TButton
    Left = 584
    Top = 194
    Width = 122
    Height = 55
    Caption = 'Exit'
    TabOrder = 2
    OnClick = Button3Click
    OnKeyDown = FormKeyDown
  end
  object SavePictureDialog1: TSavePictureDialog
    DefaultExt = '.png'
    Filter = 'PNG image file (*.png)|*.png'
    Left = 104
    Top = 104
  end
end
