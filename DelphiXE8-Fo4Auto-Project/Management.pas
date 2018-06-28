unit Management;

interface

uses
    idSNTP,
    Winapi.Windows, Winapi.WinSock2, System.SysUtils;

  function getInternetDateTime: TDateTime;
Var
  WSAData: TWSAData;
  SNTPClient : TIdSNTP;
implementation


procedure Startup;
begin
  if WSAStartup($0101, WSAData) <> 0
  then raise Exception.Create('WSAStartup');
end;

procedure Cleanup;
begin
    if WSACleanup() <> 0then
        raise Exception.Create('WSACleanup');
end;

function getInternetDateTime : TDateTime;
var
  SNTPClient: TIdSNTP;
begin
    Result := 0;
    SNTPClient := TIdSNTP.Create();
    Startup();
    try
        SNTPClient.Host := 'time.windows.com';
        Result := SNTPClient.DateTime;
    finally
        SNTPClient.Free;
    end;
    Cleanup();
end;

end.
