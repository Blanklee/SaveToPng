unit MainForm1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Vcl.Clipbrd, Vcl.Dialogs;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Image1: TImage;
    Shape1: TShape;
    SaveDialog1: TSaveDialog;
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
  begin
    if Key = Ord('V') then Button1Click(Sender);
    if Key = Ord('S') then Button3Click(Sender);
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
begin
  if SaveDialog1.Execute then
  begin
    fn:= SaveDialog1.FileName;
    Edit1.Text:= ExtractFileName(fn);
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  png: TPngImage;
begin
  // Image1.Picture.SaveToFile('R:\Test.png');
  if fn = '' then fn:= Edit1.Text;
  if fn = '' then
  begin
    ShowMessage('���� �̸��� �Է��� �ּ���.');
    Edit1.SetFocus;
    exit;
  end;

  // ������ �̹� �����ϴ��� �˻�
  if FileExists(fn) then
  if MessageDlg('������ �̹� �ֽ��ϴ�. ���� �����', mtConfirmation, mbOkCancel, 0) = mrCancel then exit;

  // ���� ������ �����Ѵ�
  png:= TPngImage.Create;
  try
    png.Assign(Image1.Picture.Bitmap);
    // png.Assign(ClipBoard); => ������
    png.SaveToFile(fn);
  finally
    png.Free;
  end;

  // ȭ�鿡 ��� ���
  Label2.Caption:= 'Successfully saved to ' + ExtractFileName(fn);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Close;
end;

end.

