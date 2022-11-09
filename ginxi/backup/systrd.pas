unit SysTRD;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Process;

type
  StartSysTRD = class(TThread)
  private

    { Private declarations }
  protected
  var
    S: TStringList; //Ловим пайп в список

    procedure Execute; override;
    procedure ShowSystem;
    procedure ShowMachine;
    procedure ShowCPU;
    procedure ShowGraphics;
    procedure ShowAudio;
    procedure ShowNetwork;
    procedure ShowDrives;
    procedure ShowPartition;
    procedure ShowRAID;
    procedure ShowSensors;
    procedure ShowInfo;

  end;

implementation

uses unit1;

{ TRD }

procedure StartSysTRD.Execute;
var
  ExProcess: TProcess;
  i: integer;
begin
  MainForm.Timer1.Enabled := True;

  FreeOnTerminate := True;

  S := TStringList.Create;
  ExProcess := TProcess.Create(nil);

  try
    ExProcess.Executable := 'bash';
    ExProcess.Parameters.Add('-c');
    ExProcess.Options := ExProcess.Options + [poUsePipes,
      poStderrToOutPut, ponoConsole];

    //System
    ExProcess.Parameters.Add('inxi -S -c0 | cut -d" " -f2- | grep -v ^System:$');
    ExProcess.Execute;
    S.LoadFromStream(ExProcess.Output);
    for i := 0 to S.Count - 1 do
      S[i] := Trim(S[i]);
    Synchronize(@ShowSystem);

    //Machine
    ExProcess.Parameters.Delete(1);
    ExProcess.Parameters.Add('inxi -M -c0 | cut -d" " -f2- | grep -v ^Machine:$');
    ExProcess.Execute;
    S.LoadFromStream(ExProcess.Output);
    for i := 0 to S.Count - 1 do
      S[i] := Trim(S[i]);
    Synchronize(@ShowMachine);

    //CPU
    ExProcess.Parameters.Delete(1);
    ExProcess.Parameters.Add('inxi -C -c0 | cut -d" " -f2- | grep -v ^CPU:$');
    ExProcess.Execute;
    S.LoadFromStream(ExProcess.Output);
    for i := 0 to S.Count - 1 do
      S[i] := Trim(S[i]);
    Synchronize(@ShowCPU);

    //Graphics
    ExProcess.Parameters.Delete(1);
    ExProcess.Parameters.Add('inxi -G -c0 | cut -d" " -f2- | grep -v ^Graphics:$');
    ExProcess.Execute;
    S.LoadFromStream(ExProcess.Output);
    for i := 0 to S.Count - 1 do
      S[i] := Trim(S[i]);
    Synchronize(@ShowGraphics);

    //Audio
    ExProcess.Parameters.Delete(1);
    ExProcess.Parameters.Add('inxi -A -c0 | cut -d" " -f2- | grep -v ^Audio:$');
    ExProcess.Execute;
    S.LoadFromStream(ExProcess.Output);
    for i := 0 to S.Count - 1 do
      S[i] := Trim(S[i]);
    Synchronize(@ShowAudio);

    //Network
    ExProcess.Parameters.Delete(1);
    ExProcess.Parameters.Add('inxi -n -c0 | cut -d" " -f2- | grep -v ^Network:$');
    ExProcess.Execute;
    S.LoadFromStream(ExProcess.Output);
    for i := 0 to S.Count - 1 do
      S[i] := Trim(S[i]);
    Synchronize(@ShowNetwork);

    //Drives
    ExProcess.Parameters.Delete(1);
    ExProcess.Parameters.Add('inxi -D -c0 | cut -d" " -f2- | grep -v ^Drives:$');
    ExProcess.Execute;
    S.LoadFromStream(ExProcess.Output);
    for i := 0 to S.Count - 1 do
      S[i] := Trim(S[i]);
    Synchronize(@ShowDrives);

    //Partition
    ExProcess.Parameters.Delete(1);
    ExProcess.Parameters.Add('inxi -p -c0 | cut -d" " -f2- | grep -v ^Partition:$');
    ExProcess.Execute;
    S.LoadFromStream(ExProcess.Output);
    for i := 0 to S.Count - 1 do
      S[i] := Trim(S[i]);
    Synchronize(@ShowPartition);

    //RAID
    ExProcess.Parameters.Delete(1);
    ExProcess.Parameters.Add('inxi -R -c0 | cut -d" " -f2- | grep -v ^RAID:$');
    ExProcess.Execute;
    S.LoadFromStream(ExProcess.Output);
    for i := 0 to S.Count - 1 do
      S[i] := Trim(S[i]);
    Synchronize(@ShowRAID);

    //Sensors
    ExProcess.Parameters.Delete(1);
    ExProcess.Parameters.Add('inxi -s -c0 | cut -d" " -f2- | grep -v ^Sensors:$');
    ExProcess.Execute;
    S.LoadFromStream(ExProcess.Output);
    for i := 0 to S.Count - 1 do
      S[i] := Trim(S[i]);
    Synchronize(@ShowSensors);

    //Info
    ExProcess.Parameters.Delete(1);
    ExProcess.Parameters.Add('inxi -I -c0 | cut -d" " -f2- | grep -v ^Info:$');
    ExProcess.Execute;
    S.LoadFromStream(ExProcess.Output);
    for i := 0 to S.Count - 1 do
      S[i] := Trim(S[i]);
    Synchronize(@ShowInfo);

  finally
    S.Free;
    ExProcess.Free;
    Terminate;
  end;
end;

procedure StartSysTRD.ShowSystem;
begin
  MainForm.SynEdit1.Lines.Assign(S);
end;

procedure StartSysTRD.ShowMachine;
begin
  MainForm.SynEdit2.Lines.Assign(S);
end;

procedure StartSysTRD.ShowCPU;
begin
  MainForm.SynEdit3.Lines.Assign(S);
end;

procedure StartSysTRD.ShowGraphics;
begin
  MainForm.SynEdit4.Lines.Assign(S);
end;

procedure StartSysTRD.ShowAudio;
begin
  MainForm.SynEdit5.Lines.Assign(S);
end;

procedure StartSysTRD.ShowNetwork;
begin
  MainForm.SynEdit6.Lines.Assign(S);
end;

procedure StartSysTRD.ShowDrives;
begin
  MainForm.SynEdit7.Lines.Assign(S);
end;

procedure StartSysTRD.ShowPartition;
begin
  MainForm.SynEdit8.Lines.Assign(S);
end;

procedure StartSysTRD.ShowRAID;
begin
  MainForm.SynEdit9.Lines.Assign(S);
end;

procedure StartSysTRD.ShowSensors;
begin
  MainForm.SynEdit10.Lines.Assign(S);
end;

procedure StartSysTRD.ShowInfo;
begin
  MainForm.SynEdit11.Lines.Assign(S);
  MainForm.Timer1.Enabled := False;
  MainForm.ProgressBar1.Position := 0;
end;

end.
