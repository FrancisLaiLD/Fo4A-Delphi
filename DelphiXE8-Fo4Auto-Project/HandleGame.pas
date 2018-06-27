unit HandleGame;

interface
uses
    windows,Tlhelp32,SysUtils, Messages;
    function getWindowHandle(titleGame: string): Hwnd;
    function endProcessByName(exeFileName: string;exePid:integer=0): Integer;//Kill bằng tên
    procedure leftMouseClick(gameHandle: Hwnd; x: integer; y: integer; numOfClick: integer = 1);
    procedure rightMouseClick(gameHandle: Hwnd; x: integer; y: integer ; numOfClick: integer = 1);
    procedure mouseMove(gameHandle: Hwnd; x: integer; y: integer);

implementation

function getWindowHandle(titleGame: string): Hwnd;
begin
    Result := FindWindow(nil, PChar(titleGame));
    Sleep(8);
end;

procedure mouseMove(gameHandle: Hwnd; x: integer; y: integer);
begin
    Postmessage(gameHandle, WM_MOUSEMOVE, 1, MakeLong(x, y));
end;

procedure leftMouseClick(gameHandle: Hwnd; x: integer; y: integer; numOfClick: integer = 1);
var
    i: integer;
begin
    for i := 0 to numOfClick do
    begin
        Postmessage(gameHandle, WM_LBUTTONDOWN, 1, MakeLong(x, y));
        sleep(8);
        Postmessage(gameHandle, WM_LBUTTONUP, 0, MakeLong(x, y));
        sleep(8);
    end;

end;

procedure rightMouseClick(gameHandle: Hwnd; x: integer; y: integer ; numOfClick: integer = 1);
var
    i: integer;
begin
    for i := 0 to numOfClick do
        begin
            Postmessage(gameHandle, WM_LBUTTONDOWN, 1, MakeLong(x, y));
            sleep(8);
            Postmessage(gameHandle, WM_LBUTTONUP, 0, MakeLong(x, y));
            sleep(8);
        end;
end;

//exeFileName: Tên Process, vd: chrome.exe
//exePid: mã PID của process, có thể bỏ qua.
function endProcessByName(exeFileName: string;exePid:integer=0): Integer;//Kill bằng tên
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THANDLE;
  FProcessEntry32: TProcessEntry32;
begin
  Result := 0;
if exePid=0 then
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFilename(FProcessEntry32.szExeFile))
      = UpperCase(exeFileName)) or (UpperCase(FProcessEntry32.szExeFile)
      = UpperCase(exeFileName))) then
      Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),
        FProcessEntry32.th32ProcessID), 0));
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end
else if exeFileName='' then
Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),exePid), 0))
else
begin
 FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
 FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
 ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
 while Integer(ContinueLoop) <> 0 do
 begin
 if (((UpperCase(ExtractFilename(FProcessEntry32.szExeFile))
 = UpperCase(exeFileName)) or (UpperCase(FProcessEntry32.szExeFile)
 = UpperCase(exeFileName)))) and (FProcessEntry32.th32ProcessID=exepid) then
 Result := Integer(TerminateProcess(OpenProcess(PROCESS_TERMINATE, BOOL(0),
 FProcessEntry32.th32ProcessID), 0));
 ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
 end;
 CloseHandle(FSnapshotHandle);
end;
end;


end.

