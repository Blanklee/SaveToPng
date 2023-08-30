unit MainForm1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Clipbrd;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Shape1: TShape;
    Edit1: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  // 이미지가 클립보드에 있는지 확인
  if not ClipBoard.HasFormat(CF_PICTURE) then exit;
  // 이미지를 화면에 그린다
  Image1.Picture.Assign(ClipBoard);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  png: TPngImage;
begin
  // Image1.Picture.SaveToFile('R:\Test.png');
  if Edit1.Text = '' then exit;

  png:= TPngImage.Create;
  try
    png.Assign(Image1.Picture.Bitmap);
    // png.Assign(ClipBoard); => 오류남
    png.SaveToFile(Edit1.Text);
  finally
    png.Free;
  end;
end;

end.
