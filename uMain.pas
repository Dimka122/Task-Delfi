unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    lvContacts: TListView;
    edtFirstName: TEdit;
    edtLastName: TEdit;
    edtPhone: TEdit;
    edtEmail: TEdit;
    lblFirstName: TLabel;
    lblLastName: TLabel;
    lblPhone: TLabel;
    lblEmail: TLabel;
    btnAdd: TButton;
    btnDelete: TButton;
    btnSave: TButton;
    btnLoad: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure edtPhoneKeyPress(Sender: TObject; var Key: Char);
  private
     procedure InitializeListView;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.btnAddClick(Sender: TObject);
begin
if Trim(edtFirstName.Text) = '' then
  begin
    ShowMessage('First name is required!');
    edtFirstName.SetFocus;
    Exit;
  end;

  with lvContacts.Items.Add do
  begin
    Caption := edtFirstName.Text;
    SubItems.Add(edtLastName.Text);
    SubItems.Add(edtPhone.Text);
    SubItems.Add(edtEmail.Text);
  end;

  // Clear inputs
  edtFirstName.Clear;
  edtLastName.Clear;
  edtPhone.Clear;
  edtEmail.Clear;
  edtFirstName.SetFocus;
end;

procedure TMainForm.btnDeleteClick(Sender: TObject);
begin
if Assigned(lvContacts.Selected) then
    lvContacts.Items.Delete(lvContacts.Selected.Index);
end;

procedure TMainForm.btnLoadClick(Sender: TObject);
var
  OpenDialog: TOpenDialog;
  sl: TStringList;
  I: Integer;
  Parts: TArray<string>;
begin
  OpenDialog := TOpenDialog.Create(nil);
  try
    OpenDialog.Filter := 'CSV files (*.csv)|*.csv|All files (*.*)|*.*';
    if OpenDialog.Execute then
    begin
      sl := TStringList.Create;
      try
        sl.LoadFromFile(OpenDialog.FileName);
        lvContacts.Items.BeginUpdate;
        try
          lvContacts.Items.Clear;
          for I := 0 to sl.Count - 1 do
          begin
            Parts := sl[I].Split([',']);
            if Length(Parts) >= 4 then
              with lvContacts.Items.Add do
              begin
                Caption := Parts[0].Trim(['"', ' ']);
                SubItems.Add(Parts[1].Trim(['"', ' ']));
                SubItems.Add(Parts[2].Trim(['"', ' ']));
                SubItems.Add(Parts[3].Trim(['"', ' ']));
              end;
          end;
        finally
          lvContacts.Items.EndUpdate;
        end;
      finally
        sl.Free;
      end;
    end;
  finally
    OpenDialog.Free;
  end;
end;

procedure TMainForm.btnSaveClick(Sender: TObject);
var
  SaveDialog: TSaveDialog;
  sl: TStringList;
  I: Integer;
begin
   SaveDialog := TSaveDialog.Create(nil);
  try
    SaveDialog.Filter := 'CSV files (*.csv)|*.csv|All files (*.*)|*.*';
    SaveDialog.DefaultExt := 'csv';
    if SaveDialog.Execute then
    begin
      sl := TStringList.Create;
      try
        for I := 0 to lvContacts.Items.Count - 1 do
          sl.Add(Format('"%s","%s","%s","%s"', [
            lvContacts.Items[I].Caption,
            lvContacts.Items[I].SubItems[0],
            lvContacts.Items[I].SubItems[1],
            lvContacts.Items[I].SubItems[2]]));
        sl.SaveToFile(SaveDialog.FileName);
      finally
        sl.Free;
      end;
    end;
  finally
    SaveDialog.Free;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Caption := 'Contact Manager';
  InitializeListView;
end;


procedure TMainForm.InitializeListView; // ← НЕ добавлять точку с запятой перед begin
begin
  lvContacts.Columns.Clear;
  with lvContacts do
  begin
    ViewStyle := vsReport;
    GridLines := True;
    RowSelect := True;
    ReadOnly := True;
    HideSelection := False;
    Font.Name := 'Segoe UI';
    Font.Size := 9;
  end;

  with lvContacts.Columns.Add do
  begin
    Caption := 'First Name';
    Width := 120;
    Alignment := taLeftJustify;
  end;

  with lvContacts.Columns.Add do
  begin
    Caption := 'Last Name';
    Width := 120;
    Alignment := taLeftJustify;
  end;

    with lvContacts.Columns.Add do
  begin
    Caption := 'Phone';
    Width := 150;
    Alignment := taLeftJustify;
  end;

  with lvContacts.Columns.Add do
  begin
    Caption := 'Email';
    Width := 200;
    Alignment := taLeftJustify;
  end;
end;

procedure TMainForm.edtPhoneKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', '+', '-', ' ', #8]) then
    Key := #0;
end;

end.


