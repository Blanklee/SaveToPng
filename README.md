# SaveToPng
- ClipBoard에 있는 Image를 .png로 Save하는 Program
- WinPE 64bit 상에서 Screen을 Capture하는 것이 목적임
- 32bit로도 실행 가능한 exe 제공
- PrtScr키 누르고 SaveToPng에 붙여넣은 후 Save 하면 됨
- 배포: WinPE 상에서 실행할 때는 shfolder.dll를 함께 배포할 것

# Release Note
-ver 1.0 / 2018.05.10 밤 (Design)
 . Delphi VCL Form으로 App 개발 시작 \
 . 화면 Design만 하고 실제 동작은 아직 안됨 \
 . 32bit로 Build되어 WinPE 에서는 실행되지 않음

-ver 1.1 / 2018.05.10 밤 (Drop)
 . v1.0과 같은 기능을 하지만 cmd 프로그램으로 Build \
 . WinPE에서 GUI가 안되어 이걸로 실행하기 위함 \
 . Parameter로 FileName을 주면 그걸로 Save되고, 안하면 yyyymmdd_hhnnss.png로 Save됨 \
 . 근데 이렇게 할 필요는 없음, Console이나 GUI나 64bit에서만 실행됨

-ver 1.2 / 2018.05.11 밤 (Incomplete) \
 . v1.0을 64bit로 Build한 것 \
 . Ctrl-V 누르면 Paste 기능 동작 \
 . File 버튼 클릭시 FileName 입력가능 (WinPE에서 동작안됨) \
 . WinPE는 64bit로 동작하며, shfolder.dll가 함께 있어야 함

-ver 1.2a / 2018.05.12 밤 (Incomplete) \
 . SavePictureDialog1을 SaveDialog1로 변경 \
 . Dialog는 어차피 안되므로 FileName을 Edit로 직접 입력받음 \
 . Save시 File이 이미 있으면 Overwrite할지 물어봄 \
 . Save가 완료됐으면 다됐다고 화면에 표시해 준다

-ver 1.2b / 2018.05.12 밤, 05.13 오전 (★Good) \
 . Dialog 안뜨는 현상은 UseLatestCommonDialogs:= False; 로 해결 \
 . SaveDialog1을 다시 SavePictureDialog1로 변경 \
 . Edit1은 ReadOnly로, FileName 입력은 File.. 버튼을 통해서 받음 \
 . Save 전에 FileName이 Empty한지, Image가 Empty한지 Check \
 . Save시 File이 이미 있으면 Overwrite할지 물어봄

-ver 1.3 / 2018.05.11 밤 (Incomplete) \
 . UI 개선: File 버튼 삭제, Save 클릭시 무조건 Save As로 동작 \
 . Edit1 삭제, 대신 FileName을 Label로 보여줌 \
 . Ctrl-S 누르면 Save As 동작 \
 . 문제점: WinPE에서 Save As 등 Dialog가 뜨지 않음

-ver 1.3a / 2018.05.11 밤, 05.12 오전, 05.13 오전 (Test) \
 . 1) Delphi의 SaveDialog 안쓰고 Windows 기본제공 함수 GetSaveFileName 사용해봄
 
    https://msdn.microsoft.com/en-us/library/windows/desktop/ms646960(v=vs.85).aspx
    Open and Save As Dialog Boxes
    결과: Dialog 실행이 잘 됨

 . 2) UseLatestCommonDialogs:= False; 후에 Delphi의 기본 TSaveDialog.Execute 해봄

    결과: 한번 False해 주니 그후 TSaveDialog.Execute 실행이 계속 잘됨

-ver 1.3b / 2018.05.13 오전 (Good) \
 . v1.3을 가져와 v1.2b의 최신 변경사항 적용 \
 . Dialog 잘뜸, Edit 삭제, Save 완료시 Label로 결과 보여줌 \
 . Save 전에 FileName이 Empty한지, Image가 Empty한지 Check \
 . Save시 File이 이미 있으면 Overwrite할지 물어봄

-v1.3c / 2018.05.13 오전 오후 (★Good) \
 . Show Image Preview: 가로세로 비율 찌그러뜨리지 않음

    Stretch=False;
    Proportional=True;
    Center=True;

 . 펭귄 Icon 작성, 적용 \
 . System Menu에 About Menu 추가 - 'Made by Blanklee'

    참고: http://www.scalabium.com/faq/dct0030.htm
    참고: http://edn.embarcadero.com/br/article/10432

