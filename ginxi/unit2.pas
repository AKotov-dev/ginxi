unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons, IniPropStorage;

type

  { TAboutForm }

  TAboutForm = class(TForm)
    Bevel2: TBevel;
    BitBtn1: TBitBtn;
    Image1: TImage;
    AboutFormStorage: TIniPropStorage;
    Label1: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  AboutForm: TAboutForm;

implementation

uses Unit1;

{$R *.lfm}

{ TAboutForm }

procedure TAboutForm.FormCreate(Sender: TObject);
begin
  Label1.Caption := Application.Title;
  AboutFormStorage.IniFileName := MainForm.MainFormStorage.IniFileName;
end;

procedure TAboutForm.BitBtn1Click(Sender: TObject);
begin
  AboutForm.Close;
end;

end.
