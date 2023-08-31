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
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    png: TPngImage;
    // procedure OnAppMessage(var Msg: TMsg; var Handled: boolean);
    procedure wmSysCommand(var Msg: TMessage); message WM_SYSCOMMAND;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
  WM_ABOUT = WM_USER + 1;

procedure TForm1.FormCreate(Sender: TObject);
var
  sysMenu: THandle;
begin
  // Member 초기화
  png:= TPngImage.Create;

  // WinPE에서 Dialog를 띄울수 있게 해준다
  UseLatestCommonDialogs:= False;

  // System 메뉴에 About 추가
  // http://www.scalabium.com/faq/dct0030.htm
  sysMenu:= GetSystemMenu(Handle, False);
  // AppendMenu(sysMenu, MF_SEPARATOR, 0, '');
  InsertMenu(sysMenu, 0, MF_STRING, WM_ABOUT, 'About..');

  // http://edn.embarcadero.com/br/article/10432
  // Assign the application's OnMessage event to my own procedure
  // so I can check for the hidden window's WM_SYSCOMMAND message.
  // Application.OnMessage:= OnAppMessage;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  // Member 정리
  png.Free;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if ssCtrl in Shift then
  begin
    // Ctrl-V 누르면 Paste
    if Key = Ord('V') then Button1Click(Sender);
    // Ctrl-S 누르면 Save
    if Key = Ord('S') then Button2Click(Sender);
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  if ClientWidth  < 770 then ClientWidth := 770;
  if ClientHeight < 340 then ClientHeight:= 340;
end;

procedure TForm1.wmSysCommand(var Msg: TMessage);
begin
  Inherited;

  // System Menu의 About을 클릭하면 실행
  if Msg.WParam = WM_ABOUT then
  begin
    ShowMessage('SaveToPng v1.4, Made by 이경백, 2018.07');
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  // 이미지가 클립보드에 있는지 확인
  if not ClipBoard.HasFormat(CF_PICTURE) then exit;
  // 이미지를 화면에 그린다
  Image1.Picture.Assign(ClipBoard);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  fn: string;
begin
  // Empty하면 Save할때 Error난다
  if Image1.Picture.Bitmap.Empty then
  begin
    ShowMessage('이미지가 비어 있습니다. Ctrl+V 눌러 Paste 해주세요.');
    exit;
  end;

  // 파일이름을 입력받는다. 취소하면 저장않음
  if not SavePictureDialog1.Execute then exit;

  // 여기서부터 파일이름 입력받았음
  fn:= SavePictureDialog1.FileName;
  if fn = '' then
  begin
    // 여기는 들어올 일이 없다
    ShowMessage('파일 이름을 입력해 주세요.');
    exit;
  end;

  // 파일이 이미 존재하는지 검사
  if FileExists(fn) then
  if MessageDlg('파일이 이미 있습니다. 덮어 쓸까요?', mtConfirmation, mbOkCancel, 0) = mrCancel then exit;


  // 이미지를 파일로 저장한다
  // Image1.Picture.SaveToFile(fn); 이렇게 하면 bmp로 저장됨

  // png 파일로 저장한다
  try
    // png.Assign(ClipBoard); => 오류남
    png.Assign(Image1.Picture.Bitmap);
    png.SaveToFile(fn);
  except
    exit;
  end;

  // 화면에 결과 출력
  Label1.Caption:= 'Successfully saved to ' + ExtractFileName(fn);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Close;
end;

end.

