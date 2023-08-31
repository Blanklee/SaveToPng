unit MainForm1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Vcl.Clipbrd, Vcl.Dialogs, Vcl.ExtDlgs;

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
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    png: TPngImage;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Member �ʱ�ȭ
  png:= TPngImage.Create;

  // WinPE���� Dialog�� ���� �ְ� ���ش�
  UseLatestCommonDialogs:= False;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  // Member ����
  png.Free;
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
  if ClientWidth  < 770 then ClientWidth := 770;
  if ClientHeight < 340 then ClientHeight:= 340;
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
  fn: string;
begin
  // Empty�ϸ� Save�Ҷ� Error����
  if Image1.Picture.Bitmap.Empty then
  begin
    ShowMessage('�̹����� ��� �ֽ��ϴ�. Ctrl+V ���� Paste ���ּ���.');
    exit;
  end;

  // �����̸��� �Է¹޴´�. ����ϸ� �������
  if not SavePictureDialog1.Execute then exit;

  // ���⼭���� �����̸� �Է¹޾���
  fn:= SavePictureDialog1.FileName;
  if fn = '' then
  begin
    // ����� ���� ���� ����
    ShowMessage('���� �̸��� �Է��� �ּ���.');
    exit;
  end;

  // ������ �̹� �����ϴ��� �˻�
  if FileExists(fn) then
  if MessageDlg('������ �̹� �ֽ��ϴ�. ���� �����?', mtConfirmation, mbOkCancel, 0) = mrCancel then exit;


  // �̹����� ���Ϸ� �����Ѵ�
  // Image1.Picture.SaveToFile(fn); �̷��� �ϸ� bmp�� �����

  // png ���Ϸ� �����Ѵ�
  try
    // png.Assign(ClipBoard); => ������
    png.Assign(Image1.Picture.Bitmap);
    png.SaveToFile(fn);
  except
    exit;
  end;

  // ȭ�鿡 ��� ���
  Label1.Caption:= 'Successfully saved to ' + ExtractFileName(fn);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Close;
end;

end.

