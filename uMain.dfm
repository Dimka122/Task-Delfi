object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'MainForm'
  ClientHeight = 507
  ClientWidth = 893
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object lblFirstName: TLabel
    Left = 152
    Top = 203
    Width = 54
    Height = 15
    Caption = 'FirstName'
  end
  object lblLastName: TLabel
    Left = 152
    Top = 243
    Width = 56
    Height = 15
    Caption = 'Last Name'
  end
  object lblPhone: TLabel
    Left = 152
    Top = 283
    Width = 34
    Height = 15
    Caption = 'Phone'
  end
  object lblEmail: TLabel
    Left = 152
    Top = 323
    Width = 29
    Height = 15
    Caption = 'Email'
  end
  object lvContacts: TListView
    Left = 152
    Top = 24
    Width = 593
    Height = 150
    Columns = <
      item
        Caption = 'First Name'
        Width = 120
      end
      item
        Caption = 'Last Name'
        Width = 120
      end
      item
        Caption = 'Phone'
        Width = 150
      end
      item
        Caption = 'Email'
        Width = 200
      end>
    TabOrder = 0
    ViewStyle = vsReport
  end
  object edtFirstName: TEdit
    Left = 248
    Top = 200
    Width = 297
    Height = 23
    TabOrder = 1
    Text = 'FirstName'
  end
  object edtLastName: TEdit
    Left = 248
    Top = 240
    Width = 297
    Height = 23
    TabOrder = 2
    Text = 'LastName'
  end
  object edtPhone: TEdit
    Left = 248
    Top = 280
    Width = 297
    Height = 23
    TabOrder = 3
    Text = 'Phone'
  end
  object edtEmail: TEdit
    Left = 248
    Top = 320
    Width = 297
    Height = 23
    TabOrder = 4
    Text = 'Email'
  end
  object btnAdd: TButton
    Left = 248
    Top = 408
    Width = 75
    Height = 25
    Caption = 'Add'
    TabOrder = 5
    OnClick = btnAddClick
  end
  object btnDelete: TButton
    Left = 384
    Top = 408
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 6
    OnClick = btnDeleteClick
  end
  object btnSave: TButton
    Left = 520
    Top = 408
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 7
    OnClick = btnSaveClick
  end
  object btnLoad: TButton
    Left = 656
    Top = 408
    Width = 75
    Height = 25
    Caption = 'Load'
    TabOrder = 8
    OnClick = btnLoadClick
  end
end
