program ginxi;

{$mode objfpc}{$H+}

uses
 {$IFDEF UNIX}
  cthreads,   {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms,
  Unit1,
  SysTRD,
  Unit2 { you can add units after this };

{$R *.res}

begin
  Application.Scaled := True;
  Application.Title := 'GINXI v1.5';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TAboutForm, AboutForm);
  Application.Run;
end.
