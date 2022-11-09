unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, SynEdit, SynHighlighterAny,
  Forms, Controls, Graphics, Dialogs, LCLTranslator, DefaultTranslator,
  StdCtrls, IniPropStorage, ExtCtrls, ComCtrls, Menus, Process;

type

  { TMainForm }

  TMainForm = class(TForm)
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Panel1: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    PopupMenu1: TPopupMenu;
    ProgressBar1: TProgressBar;
    SaveDialog1: TSaveDialog;
    MainFormStorage: TIniPropStorage;
    Splitter1: TSplitter;
    Splitter10: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    Splitter5: TSplitter;
    Splitter6: TSplitter;
    Splitter7: TSplitter;
    Splitter8: TSplitter;
    Splitter9: TSplitter;
    SynAnySyn1: TSynAnySyn;
    SynAnySyn2: TSynAnySyn;
    SynEdit1: TSynEdit;
    SynEdit10: TSynEdit;
    SynEdit11: TSynEdit;
    SynEdit2: TSynEdit;
    SynEdit3: TSynEdit;
    SynEdit4: TSynEdit;
    SynEdit5: TSynEdit;
    SynEdit6: TSynEdit;
    SynEdit7: TSynEdit;
    SynEdit8: TSynEdit;
    SynEdit9: TSynEdit;
    Timer1: TTimer;
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure StartBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ChangeTwoColor(Pan1FontColor, Pan2FontColor: TColor);
    procedure Zebra;

  private

  public

  end;

var
  MainForm: TMainForm;

implementation

uses SysTRD, Unit2;

{$R *.lfm}

{ TMainForm }


//Зебра
procedure TMainForm.Zebra;
begin
  if MenuItem10.Checked then
  begin
    SynEdit1.Color := RGBToColor(252, 255, 221);
    SynEdit3.Color := SynEdit1.Color;
    SynEdit5.Color := SynEdit1.Color;
    SynEdit7.Color := SynEdit1.Color;
    SynEdit9.Color := SynEdit1.Color;
    SynEdit11.Color := SynEdit1.Color;
  end
  else
  begin
    SynEdit1.Color := clWhite;
    SynEdit3.Color := clWhite;
    SynEdit5.Color := clWhite;
    SynEdit7.Color := clWhite;
    SynEdit9.Color := clWhite;
    SynEdit11.Color := clWhite;
  end;
end;


//Двухцветная раскраска
procedure TMainForm.ChangeTwoColor(Pan1FontColor, Pan2FontColor: TColor);
begin
  Panel1.Font.Color := Pan1FontColor;
  SynAnySyn1.KeyAttri.Foreground := Panel1.Font.Color;

  Panel2.Font.Color := Pan2FontColor;
  SynAnySyn2.KeyAttri.Foreground := Panel2.Font.Color;

  Panel3.Font.Color := Pan1FontColor;
  Panel4.Font.Color := Pan2FontColor;
  Panel5.Font.Color := Pan1FontColor;
  Panel6.Font.Color := Pan2FontColor;
  Panel7.Font.Color := Pan1FontColor;
  Panel8.Font.Color := Pan2FontColor;
  Panel9.Font.Color := Pan1FontColor;
  Panel10.Font.Color := Pan2FontColor;
  Panel11.Font.Color := Pan1FontColor;
end;


procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  if ProgressBar1.Position = ProgressBar1.Max then
    ProgressBar1.Position := 0
  else
    ProgressBar1.StepIt;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  MainForm.Caption := Application.Title;

  //Директория конфигов в профиле (в root может отсутствовать)
  if not DirectoryExists(GetUserDir + '.config') then MkDir(GetUserDir + '.config');

  SaveDialog1.InitialDir := GetUserDir;
  MainFormStorage.IniFileName := GetUserDir + '.config/ginxi.ini';
end;

procedure TMainForm.FormShow(Sender: TObject);
var
  FStartSysThread: TThread;
begin
  //Plasma Scaling
  MainFormStorage.Restore;

  //Установка словарей и цветов
  SynAnySyn2.KeyWords.Assign(SynAnySyn1.KeyWords);

  if MenuItem10.Checked then
    Zebra;

  if MenuItem14.Checked then
    MenuItem14.Click;
  if MenuItem15.Checked then
    MenuItem15.Click;
  if MenuItem11.Checked then
    MenuItem11.Click;
  if MenuItem16.Checked then
    MenuItem16.Click;
  if MenuItem17.Checked then
    MenuItem17.Click;
  if MenuItem9.Checked then
    MenuItem9.Click;

  //Запуск потока...
  FStartSysThread := StartSysTRD.Create(False);
  FStartSysThread.Priority := tpLowest;
end;

procedure TMainForm.StartBtnClick(Sender: TObject);
var
  FStartSysThread: TThread;
begin
  FStartSysThread := StartSysTRD.Create(False);
  FStartSysThread.Priority := tpLowest;
end;

procedure TMainForm.MenuItem1Click(Sender: TObject);
begin
  if PopUpMenu1.PopupComponent.ClassNameIs('TSynEdit') then
  begin
    (PopUpMenu1.PopupComponent as TSynEdit).SelectAll;
    (PopUpMenu1.PopupComponent as TSynEdit).CopyToClipboard;
    (PopUpMenu1.PopupComponent as TSynEdit).SelStart := 0;
    (PopUpMenu1.PopupComponent as TSynEdit).SelEnd := 0;
  end;
end;

procedure TMainForm.MenuItem10Click(Sender: TObject);
begin
  Zebra;
end;

procedure TMainForm.MenuItem11Click(Sender: TObject);
begin
  ChangeTwoColor(clRed, clBlue);
end;

procedure TMainForm.MenuItem14Click(Sender: TObject);
begin
  ChangeTwoColor(clBlack, clBlack);
end;

procedure TMainForm.MenuItem15Click(Sender: TObject);
begin
  ChangeTwoColor(clMaroon, clGreen);
end;

procedure TMainForm.MenuItem16Click(Sender: TObject);
begin
  ChangeTwoColor(clTeal, clPurple);
end;

procedure TMainForm.MenuItem17Click(Sender: TObject);
begin
  ChangeTwoColor(clBlue, clMaroon);
end;

procedure TMainForm.MenuItem3Click(Sender: TObject);
var
  L: TStringList;
  i: integer;
begin
  L := TStringList.Create;
  //Sysytem
  L.Add(Panel1.Caption);
  L.Add('---');
  for i := 0 to SynEdit1.Lines.Count - 1 do
    L.Add(SynEdit1.Lines[i]);
  L.Add('');

  //Machine
  L.Add(Panel2.Caption);
  L.Add('---');
  for i := 0 to SynEdit2.Lines.Count - 1 do
    L.Add(SynEdit2.Lines[i]);
  L.Add('');

  //CPU
  L.Add(Panel3.Caption);
  L.Add('---');
  for i := 0 to SynEdit3.Lines.Count - 1 do
    L.Add(SynEdit3.Lines[i]);
  L.Add('');

  //Graphics
  L.Add(Panel4.Caption);
  L.Add('---');
  for i := 0 to SynEdit4.Lines.Count - 1 do
    L.Add(SynEdit4.Lines[i]);
  L.Add('');

  //Audio
  L.Add(Panel5.Caption);
  L.Add('---');
  for i := 0 to SynEdit5.Lines.Count - 1 do
    L.Add(SynEdit5.Lines[i]);
  L.Add('');

  //Network
  L.Add(Panel6.Caption);
  L.Add('---');
  for i := 0 to SynEdit6.Lines.Count - 1 do
    L.Add(SynEdit6.Lines[i]);
  L.Add('');

  //Drives
  L.Add(Panel7.Caption);
  L.Add('---');
  for i := 0 to SynEdit7.Lines.Count - 1 do
    L.Add(SynEdit7.Lines[i]);
  L.Add('');

  //Partition
  L.Add(Panel8.Caption);
  L.Add('---');
  for i := 0 to SynEdit8.Lines.Count - 1 do
    L.Add(SynEdit8.Lines[i]);
  L.Add('');

  //RAID
  L.Add(Panel9.Caption);
  L.Add('---');
  for i := 0 to SynEdit9.Lines.Count - 1 do
    L.Add(SynEdit9.Lines[i]);
  L.Add('');

  //Sensors
  L.Add(Panel10.Caption);
  L.Add('---');
  for i := 0 to SynEdit10.Lines.Count - 1 do
    L.Add(SynEdit10.Lines[i]);
  L.Add('');

  //Info
  L.Add(Panel11.Caption);
  L.Add('---');
  for i := 0 to SynEdit11.Lines.Count - 1 do
    L.Add(SynEdit11.Lines[i]);
  L.Add('');

  //Сохраняем...
  if SaveDialog1.Execute then
    L.SaveToFile(SaveDialog1.FileName);
  L.Free;
end;

procedure TMainForm.MenuItem5Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.MenuItem7Click(Sender: TObject);
begin
  if not AboutForm.Visible then
    AboutForm.Show;
end;

procedure TMainForm.MenuItem9Click(Sender: TObject);
begin
  ChangeTwoColor(RGBtoColor(255, 69, 0), clTeal);
end;

procedure TMainForm.PopupMenu1Popup(Sender: TObject);
begin
  if not PopUpMenu1.PopupComponent.ClassNameIs('TSynEdit') then
    MenuItem1.Enabled := False
  else
    MenuItem1.Enabled := True;
end;

end.
