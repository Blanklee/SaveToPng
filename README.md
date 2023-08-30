# SaveToPng
- 클립보드에 있는 이미지를 .png로 저장하는 프로그램
- SRS7 등의 WinPE 64bit 상에서 화면을 캡처하는 것이 목적임
- WinClon, SRS5 에서도 32bit로 실행 가능
- PrtScr키 누르고 SaveToPng에 붙여넣은 후 저장하면 됨
- 배포: WinPE 상에서 실행할때 shfolder.dll를 함께 배포할 것

# Release Note
-ver 1.0 / 2018.05.10 밤 (Design)
 . Delphi VCL Form으로 App 개발 시작 \
 . 화면 디자인만 하고 실제 동작은 아직 안됨 \
 . 32bit로 Build되어 WinPE 에서는 실행되지 않음

-ver 1.1 / 2018.05.10 밤 (Drop)
 . v1.0과 같은 기능을 하지만 cmd 프로그램으로 Build \
 . WinPE에서 GUI가 안되어 이걸로 실행하기 위함 \
 . Parameter로 파일이름을 주면 그걸로 저장되고, 안하면 yyyymmdd_hhnnss.png로 저장됨 \
 . 근데 이렇게 할 필요는 없음, Console이나 GUI나 64bit에서만 실행됨

-ver 1.2 / 2018.05.11 밤 (Incomplete) \
 . v1.0을 64bit로 컴파일한 것 \
 . Ctrl-V 누르면 Paste 기능 동작 \
 . File 버튼 클릭시 FileName 입력가능 (PE에서 동작안됨) \
 . WinPE는 64bit로 동작하며, shfolder.dll가 함께 있어야 함

-ver 1.2a / 2018.05.12 밤 (Incomplete) \
 . SavePictureDialog1을 SaveDialog1로 변경 \
 . Dialog는 어차피 안되므로 파일이름을 Edit로 직접 입력받음 \
 . Save시 동일파일 있으면 덮어쓸지 물어본다 \
 . Save가 완료됐으면 다됐다고 화면에 표시해 준다

-ver 1.2b / 2018.05.12 밤, 05.13 오전 (★Good) \
 . Dialog 안뜨는 현상은 UseLatestCommonDialogs:= False; 로 해결 \
 . SaveDialog1을 다시 SavePictureDialog1로 변경 \
 . Edit1은 ReadOnly로, 파일이름은 File.. 버튼을 통해서 입력받음 \
 . 저장전에 File이름이 Empty한지, Image가 Empty한지 Check \
 . 파일이 이미 있으면 덮어쓸지 물어봄

