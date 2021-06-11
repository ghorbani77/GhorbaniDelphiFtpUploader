unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdHTTP, ComCtrls, idUri, IdExplicitTLSClientServerBase, IdFTP, idFTPCommon,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Button5: TButton;
    GroupBox2: TGroupBox;
    Memo1: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    ProgressBar2: TProgressBar;
    Button3: TButton;
    Button4: TButton;
    Button2: TButton;
    Button1: TButton;
    Edit4: TEdit;
    Label8: TLabel;
    Edit3: TEdit;
    Label10: TLabel;
    Label9: TLabel;
    Edit2: TEdit;
    Edit1: TEdit;
    Label7: TLabel;
    Label1: TLabel;
    IdFTP1: TIdFTP;
    Label2: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: string);
    procedure Button4Click(Sender: TObject);
    procedure IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCount: Int64);
    procedure IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
      AWorkCountMax: Int64);
    procedure IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
    procedure Button1Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    fDownloadBytes: Int64;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  IdFTP1.Host := Edit1.Text;
  IdFTP1.Username := Edit2.Text;
  IdFTP1.Password := Edit3.Text;
  IdFTP1.Connect;
  if Edit4.Text <> '' then
    IdFTP1.ChangeDir(Edit4.Text);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if IdFTP1.Connected then
    IdFTP1.Disconnect;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  // Choose file to upload
  if OpenDialog1.Execute then
  begin
    Label1.Caption := OpenDialog1.FileName;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  URI: TidUri;
begin
  if IdFTP1.Connected then
  begin
    Memo1.Clear;
    URI := TidUri.Create(OpenDialog1.FileName); // Get file name
    IdFTP1.TransferType := ftBinary;
    IdFTP1.Put(OpenDialog1.FileName, URI.Document); // Upload file
    URI.Free; // Free Uri component
  end
  else
    ShowMessage('Not connected');
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.IdFTP1Status(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: string);
begin
  Memo1.Lines.Add(AStatusText); // Status of upload
end;

procedure TForm1.IdFTP1Work(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
var
  tempbar: TProgressBar;
begin
  Memo1.Lines.Add('Uploading... ' + IntToStr(Integer(AWorkMode)) +
    IntToStr(AWorkCount));
  tempbar := ProgressBar2;
  if AWorkMode = wmRead then
    tempbar := ProgressBar2;
  tempbar.Position := AWorkCount;
  Application.ProcessMessages;
end;

procedure TForm1.IdFTP1WorkBegin(ASender: TObject; AWorkMode: TWorkMode;
  AWorkCountMax: Int64);
var
  tempbar: TProgressBar;
  aMax: Integer;
begin
  tempbar := ProgressBar2;
  aMax := AWorkCountMax;
  if AWorkMode = wmRead then
  begin
    tempbar := ProgressBar2;
    aMax := fDownloadBytes;
  end;
  tempbar.Position := 0;
  tempbar.Max := aMax;
end;

procedure TForm1.IdFTP1WorkEnd(ASender: TObject; AWorkMode: TWorkMode);
var
  tempbar: TProgressBar;
begin
  tempbar := ProgressBar2;
  if AWorkMode = wmRead then
    tempbar := ProgressBar2;
  tempbar.Position := tempbar.Max;
end;

end.
