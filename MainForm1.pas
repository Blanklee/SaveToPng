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
    Image1: TImage;
    Shape1: TShape;
    SavePictureDialog1: TSavePictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  begin
    // Ctrl-V ������ Paste
    if Key = Ord('V') then Button1Click(Sender);
    // Ctrl-S ������ Save
    if Key = Ord('S') then Button2Click(Sender);
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  if ClientHeight < 312 then ClientHeight:= 312;
  if ClientWidth < 744 then ClientWidth:= 744;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  // �̹����� Ŭ�����忡 �ִ��� Ȯ��
  if not ClipBoard.HasFormat(CF_PICTURE) then exit;
  // �̹����� ȭ�鿡 �׸���
  Image1.Picture.Assign(ClipBoard);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  png: TPngImage;
begin
  // �����̸��� �Է¹޴´�. ����ϸ� �������
  if not SavePictureDialog1.Execute then exit;

  // ���⼭���� �����̸� �Է¹޾���
  fn:= SavePictureDialog1.FileName;
  Label1.Caption:= 'File name : ' + ExtractFileName(fn);
  if fn = '' then exit;

  // �̹����� ���Ϸ� �����Ѵ�
  // Image1.Picture.SaveToFile(fn); �̷��� �ϸ� bmp�� �����

  // png ���Ϸ� �����Ѵ�
  png:= TPngImage.Create;
  try
    png.Assign(Image1.Picture.Bitmap);
    // png.Assign(ClipBoard); => ������
    png.SaveToFile(fn);
  finally
    png.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Close;
end;

end.

