unit HandleGame;

interface
uses
    windows, Messages;
    function getWindowHandle(titleGame: string): Hwnd;
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


end.

