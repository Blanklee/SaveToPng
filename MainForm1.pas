unit MainForm1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Clipbrd, Vcl.ExtDlgs;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Image1: TImage;
    Shape1: TShape;
    SavePictureDialog1: TSavePictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
    fn: string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  fn:= '';
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ssCtrl in Shift then
  if Key = Ord('V') then
  Button1Click(Sender);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  if ClientHeight < 312 then ClientHeight:= 312;
  if ClientWidth < 744 then ClientWidth:= 744;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  // 이미지가 클립보드에 있는지 확인
  if not ClipBoard.HasFormat(CF_PICTURE) then exit;
  // 이미지를 화면에 그린다
  Image1.Picture.Assign(ClipBoard);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
  begin
    fn:= SavePictureDialog1.FileName;
    Edit1.Text:= ExtractFileName(fn);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  png: TPngImage;
begin
  // Image1.Picture.SaveToFile('R:\Test.png');
  if fn = '' then exit;

  png:= TPngImage.Create;
  try
    png.Assign(Image1.Picture.Bitmap);
    // png.Assign(ClipBoard); => 오류남
    png.SaveToFile(fn);
  finally
    png.Free;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Close;
end;

end.

