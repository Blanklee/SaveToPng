object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Paste image & Save to png'
  ClientHeight = 340
  ClientWidth = 770
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  DesignSize = (
    770
    340)
  PixelsPerInch = 96
  TextHeight = 20
  object Shape1: TShape
    Left = 24
    Top = 24
    Width = 345
    Height = 265
    Anchors = [akLeft, akTop, akRight, akBottom]
    Brush.Color = clBtnFace
  end
  object Image1: TImage
    Left = 32
    Top = 32
    Width = 329
    Height = 249
    Anchors = [akLeft, akTop, akRight, akBottom]
    Stretch = True
  end
  object Label1: TLabel
    Left = 400
    Top = 245
    Width = 59
    Height = 20
    Anchors = [akTop, akRight]
    Caption = 'Saved to'
  end
  object Button1: TButton
    Left = 400
    Top = 64
    Width = 322
    Height = 65
    Anchors = [akTop, akRight]
    Caption = 'Paste image from Clipboard (Ctrl+V)'
    TabOrder = 0
    OnClick = Button1Click
    OnKeyDown = FormKeyDown
  end
  object Button2: TButton
    Left = 400
    Top = 170
    Width = 185
    Height = 55
    Anchors = [akTop, akRight]
    Caption = 'Save image (Ctrl+S)'
    TabOrder = 1
    OnClick = Button2Click
    OnKeyDown = FormKeyDown
  end
  object Button3: TButton
    Left = 600
    Top = 170
    Width = 122
    Height = 55
    Anchors = [akTop, akRight]
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
