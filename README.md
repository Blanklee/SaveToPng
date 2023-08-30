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

