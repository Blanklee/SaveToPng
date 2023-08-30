program SaveToPng;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.Clipbrd;

var
  Image1: TImage;
  Png: TPngImage;
  fn: string;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    Image1:= nil;
    Png:= nil;

    // ������ �����̸�
    fn:= ParamStr(1);
    FormatSettings.ShortDateFormat:= 'yyyymmdd_hhnnss';
    if fn = '' then fn:= DateToStr(Now) + '.png';

    // �̹����� Ŭ�����忡 �ִ��� Ȯ��
    if not ClipBoard.HasFormat(CF_PICTURE) then
    begin
      Writeln('No image in the Clipboard');
      exit;
    end;

    try
      // �̹����� �����´�
      Image1:= TImage.Create(nil);
      Image1.Stretch:= True;
      Image1.Picture.Assign(ClipBoard);

      try
        // png �̹����� �����´�
        Png:= TPngImage.Create;
        png.Assign(Image1.Picture.Bitmap);
        png.SaveToFile(fn);
        Writeln('Successfully saved to ' + fn);
      finally
        png.Free;
      end;

    finally
      Image1.Free;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
