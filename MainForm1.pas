unit MainForm1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, Clipbrd, Vcl.ExtDlgs, Commdlg;

type
  TMainForm = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Image1: TImage;
    Shape1: TShape;
    SaveDialog1: TSaveDialog;
    SavePictureDialog1: TSavePictureDialog;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
    fn: string;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
begin
  fn:= '';
end;

procedure TMainForm.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ssCtrl in Shift then
  begin
    // Ctrl-V 누르면 Paste
    if Key = Ord('V') then Button1Click(Sender);
    // Ctrl-S 누르면 Save
    if Key = Ord('S') then Button2Click(Sender);
  end;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  if ClientHeight < 312 then ClientHeight:= 312;
  if ClientWidth < 744 then ClientWidth:= 744;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  // 이미지가 클립보드에 있는지 확인
  if not ClipBoard.HasFormat(CF_PICTURE) then exit;
  // 이미지를 화면에 그린다
  Image1.Picture.Assign(ClipBoard);
end;

procedure TMainForm.Button2Click(Sender: TObject);
var
  png: TPngImage;
begin
  // ShowMessage('여기1');
  // 파일이름을 입력받는다. 취소하면 저장않음
  // 문제점: SavePictureDialog1 또는 SaveDialog1은 WinPE에서 동작않음
  if not SavePictureDialog1.Execute then exit;
  // ShowMessage('여기2 ' + SavePictureDialog1.FileName);

  // 여기서부터 파일이름 입력받았음
  fn:= SavePictureDialog1.FileName;
  Label1.Caption:= 'File name : ' + ExtractFileName(fn);
  if fn = '' then exit;

  // 이미지를 파일로 저장한다
  // Image1.Picture.SaveToFile(fn); 이렇게 하면 bmp로 저장됨

  // png 파일로 저장한다
  png:= TPngImage.Create;
  try
    png.Assign(Image1.Picture.Bitmap);
    // png.Assign(ClipBoard); => 오류남
    png.SaveToFile(fn);
  finally
    png.Free;
  end;
end;

procedure TMainForm.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.Button4Click(Sender: TObject);
var
  ofn: TOpenFilename;
  buf: array[0..MAX_PATH] of char;
begin
  // 파일이름을 입력받는다. 취소하면 저장않음

  // 문제점 : 아래와 같이 하면 아예 동작않고 아래 오류 뜸
  // Access violation at address 0040A28F, Read of address 00000020.
  // GetSaveFileName(ofn);
  // ShowMessage(ofn.lpstrFile);

  // 아래와 같이 해야 함
  // 참고: https://www.remkoweijnen.nl/blog/2011/06/21/delphi-tsavedialog-doesnt-work-on-windows-pe/
  ZeroMemory(@ofn, sizeof(ofn));
  ofn.lStructSize:= sizeof(ofn);
  ofn.hWndOwner:= Self.Handle;
  ofn.lpstrFile:= @Buf[0];
  ofn.nMaxFile:= Length(buf);
  ofn.lpstrInitialDir:= PChar(GetCurrentDir);
  ofn.lpstrFilter:= 'PNG image file (*.png)'#0'*.png'#0#0;
  ofn.nFilterIndex:= 0;
  ZeroMemory(@buf, sizeof(buf));

  if GetSaveFileName(ofn) then
  begin
    ShowMessage(ofn.lpstrFile);
  end;
end;

procedure TMainForm.Button5Click(Sender: TObject);
begin
  UseLatestCommonDialogs:= False;
  if not SavePictureDialog1.Execute then exit;
end;

end.

