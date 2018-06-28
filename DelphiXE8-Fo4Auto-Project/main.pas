unit main;

interface

uses
  Management,HandleGame,GlobalVars,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type

PosClick = record
    x: integer;
    y: integer;
end;

WorkerThread = class(TThread)
    protected
        m_countSecond : integer;
        procedure Execute; override;
    end;

TForm1 = class(TForm)
    pagMain: TPageControl;
    tabMainUI: TTabSheet;
    tabGeneralSetup: TTabSheet;
    grpboxMoreInfo: TGroupBox;
    grpboxQuickSetup: TGroupBox;
    radgrpAutoFunc: TRadioGroup;
    grpVersionInfo: TGroupBox;
    grpRunningSetup: TGroupBox;
    lblSTTCurrentTime: TLabel;
    lblCurrentTime: TLabel;
    lblSTTGameStatus: TLabel;
    lblGameStatus: TLabel;
    btnQuickOutGame: TButton;
    lblSTTAppTitle: TLabel;
    lblStopAutoByMatch: TLabel;
    cbxStopAutoByMatch: TCheckBox;
    tedStopAutoByMatch: TEdit;
    lblStopAutoByMin: TLabel;
    cbxOutGarena: TCheckBox;
    cbxShutdownComputer: TCheckBox;
    lblSTTTimeAutoRun: TLabel;
    lblTimeAutoRun: TLabel;
    cbxStopAutoByMin: TCheckBox;
    tedStopAutoByMin: TEdit;
    cbxOutGame: TCheckBox;
    btnTestFunc: TButton;
    procedure btnQuickOutGameClick(Sender: TObject);

    // interface

    procedure updateTimeToGui();
    procedure FormCreate(Sender: TObject);
    function MessageDlgCenter1(const Msg: string; DlgType: TMsgDlgType;Buttons: TMsgDlgButtons): Integer;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbxStopAutoByMinClick(Sender: TObject);
    procedure cbxStopAutoByMatchClick(Sender: TObject);
    procedure btnTestFuncClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    m_WorkerThread : WorkerThread;
  end;

var
  Form1: TForm1;
  m_gameHWND: HWND;

implementation

{$R *.dfm}

procedure TForm1.btnQuickOutGameClick(Sender: TObject);
var
    m_Hwnd: Hwnd;

begin
    if MessageDlgCenter1(STR_CONFIRM_OUTGAME, mtConfirmation, [mbOk, mbCancel]) = mrOk then
        HandleGame.endProcessByName('fifa4zf.exe');
end;


procedure TForm1.btnTestFuncClick(Sender: TObject);
begin
    m_WorkerThread := WorkerThread.Create(false);
end;

procedure TForm1.cbxStopAutoByMatchClick(Sender: TObject);
begin
    if (cbxStopAutoByMatch.Checked = true) then
    begin
        tedStopAutoByMatch.Enabled := true;
        lblStopAutoByMatch.Enabled := true;

        if cbxStopAutoByMin.Checked = true then
        begin
            cbxStopAutoByMin.Checked := false;
            tedStopAutoByMin.Text := '';
            tedStopAutoByMin.Enabled := false;
            lblStopAutoByMin.Enabled := false;
        end;
        cbxOutGarena.Enabled := true;
        cbxOutGame.Enabled := true;
        cbxShutdownComputer.Enabled := true;
    end
    else
    begin
        tedStopAutoByMatch.Text := '';
        tedStopAutoByMatch.Enabled := false;
        lblStopAutoByMatch.Enabled := false;

        cbxOutGarena.Enabled := false;
        cbxOutGame.Enabled := false;
        cbxShutdownComputer.Enabled := false;
    end;

end;

procedure TForm1.cbxStopAutoByMinClick(Sender: TObject);
begin
    if (cbxStopAutoByMin.Checked = true) then
    begin
        if cbxStopAutoByMatch.Checked = true then
        begin
            cbxStopAutoByMatch.Checked := false;
            tedStopAutoByMatch.Text := '';
            tedStopAutoByMatch.Enabled := false;
            lblStopAutoByMatch.Enabled := false;
        end;

        tedStopAutoByMin.Enabled := true;
        lblStopAutoByMin.Enabled := true;

        cbxOutGarena.Enabled := true;
        cbxOutGame.Enabled := true;
        cbxShutdownComputer.Enabled := true;
    end
    else
    begin
        tedStopAutoByMin.Text := '';
        tedStopAutoByMin.Enabled := false;
        lblStopAutoByMin.Enabled := false;

        cbxOutGarena.Enabled := false;
        cbxOutGame.Enabled := false;
        cbxShutdownComputer.Enabled := false;
    end;

end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  msg: String;
begin
  msg:='';
  if MessageDlgCenter1(STR_CONFIRM_OUTAUTO, mtConfirmation, [mbOk, mbCancel]) = mrCancel then
    CanClose := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;

//***************************   INTERFACE   **********************************

procedure TForm1.updateTimeToGui();
var
    l_DateTime : TDateTime;
begin
//    l_DateTime := Management.getInternetDateTime();
//    l_DateTime := Time;
    l_DateTime := Management.getInternetDateTime();
    Form1.lblCurrentTime.Caption := TimeToStr(l_DateTime);
end;

function TForm1.MessageDlgCenter1(const Msg: string; DlgType: TMsgDlgType;Buttons: TMsgDlgButtons): Integer;
var R: TRect;
begin
  if not Assigned(Screen.ActiveForm) then
  begin
    Result := MessageDlg(Msg, DlgType, Buttons, 0);
  end else
  begin
    with CreateMessageDialog(Msg, DlgType, Buttons) do
    try
      GetWindowRect(Screen.ActiveForm.Handle, R);
      Left := R.Left + ((R.Right - R.Left) div 2) - (Width div 2);
      Top := R.Top + ((R.Bottom - R.Top) div 2) - (Height div 2);
      Result := ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure WorkerThread.Execute;
var
    curIndex : integer ;
begin
    while Not Terminated do
    begin
    // update Time to Gui
    Sleep(1000);
    m_countSecond := m_countSecond +1;

    Form1.updateTimeToGui();

    Form1.lblTimeAutoRun.Caption := IntToStr(m_countSecond) + ' phút';
    // Check game state
    m_gameHWND := HandleGame.getWindowHandle(GAME_TITLE);
    if (m_gameHWND <> 0) then
        begin
            Form1.btnQuickOutGame.Enabled := true;
            Form1.lblGameStatus.Caption := 'ON';
            Form1.lblGameStatus.Font.Style := [fsBold];
        end
    else
        begin
            Form1.btnQuickOutGame.Enabled := False;
            Form1.lblGameStatus.Caption := '---';
        end;

    end;

end;

end.
