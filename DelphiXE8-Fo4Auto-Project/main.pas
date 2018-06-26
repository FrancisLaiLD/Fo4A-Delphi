unit main;

interface

uses
  Management,HandleGame,
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
    Label1: TLabel;
    lblStopAutoByMatch: TLabel;
    cbxStopAutoByMatch: TCheckBox;
    tedStopAutoByMatch: TEdit;
    lblStopAutoByMin: TLabel;
    cbxOutGarena: TCheckBox;
    cbxShutdownComputer: TCheckBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cbxStopAutoByMin: TCheckBox;
    tedStopAutoByMin: TEdit;
    cbxOutGame: TCheckBox;
    procedure btnQuickOutGameClick(Sender: TObject);

    // interface

    procedure updateTimeToGui();
    procedure FormCreate(Sender: TObject);
    function MessageDlgCenter1(const Msg: string; DlgType: TMsgDlgType;Buttons: TMsgDlgButtons): Integer;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbxStopAutoByMinClick(Sender: TObject);
    procedure cbxStopAutoByMatchClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
    m_WorkerThread : WorkerThread;
  end;

var
  Form1: TForm1;
  // define variables
  GAME_TITLE: string = 'FIFA Online4 - Developed by SPEARHEAD';
  GARENA_SIGNOUT_TITLE: string = 'Garena - Your Ultimate Game Platform';
  GARENA_SIGNIN_TITLE: string = 'Garena - Game Center';

  // button click
    POSCLICK_SIGNIN_X: integer = 578;
    POSCLICK_SIGNIN_Y: integer = 434;

implementation

{$R *.dfm}

procedure TForm1.btnQuickOutGameClick(Sender: TObject);
var
    m_Hwnd: Hwnd;

begin
    m_Hwnd := HandleGame.getWindowHandle(GARENA_SIGNOUT_TITLE);
    HandleGame.leftMouseClick(m_Hwnd, POSCLICK_SIGNIN_X, POSCLICK_SIGNIN_Y);
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
  msg:='You have not saved. Do you really want to close?';
  if MessageDlgCenter1(msg, mtConfirmation, [mbOk, mbCancel]) = mrCancel then
    CanClose := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//    m_WorkerThread := WorkerThread.Create(false);
end;

//***************************   INTERFACE   **********************************

procedure TForm1.updateTimeToGui();
var
    l_DateTime : TDateTime;
begin
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
    // check RadioButton group

    Form1.lblGameStatus.Caption := IntToStr(m_countSecond);

//    if m_countSecond = 6 then
//        m_countSecond := 0;
    end;

end;

end.
