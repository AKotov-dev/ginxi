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
    Label1: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.lfm}

{ TAboutForm }

procedure TAboutForm.FormCreate(Sender: TObject);
begin
  Label1.Caption := Application.Title;
end;

procedure TAboutForm.FormShow(Sender: TObject);
begin
  //Авторазмер
  AboutForm.Width := Label3.Left + Label3.Width + 8;
  AboutForm.Height := BitBtn1.Top + BitBtn1.Height + 10;
end;

procedure TAboutForm.BitBtn1Click(Sender: TObject);
begin
  AboutForm.Close;
end;

end.
