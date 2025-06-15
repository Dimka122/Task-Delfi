program Contact_ManageR;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {MainForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Contact Manager';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
