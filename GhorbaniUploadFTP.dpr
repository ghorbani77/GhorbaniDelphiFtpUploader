program GhorbaniUploadFTP;

uses
  Forms,
  Unit1 in 'G:\Del123 Collection of Delphi Example with Source Code\Demos\11\Source\XE\Unit1.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Upload files using FTP';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
