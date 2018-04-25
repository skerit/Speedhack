unit ui;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,speedhackunit, ulkJSON;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure CreateParams(Var params: TCreateParams); override;
  private
    procedure WMCopyData(var Msg : TWMCopyData); message WM_COPYDATA;
  public
    { Public declarations }
  end;

type
  TUI = class(tthread)
  public
    procedure execute; override;
  end;


var
  Form1: TForm1;
  sui: tui;

implementation

{$R *.dfm}

procedure TUI.execute;
begin
  form1:=tform1.Create(nil);

  // Hide the form
  form1.Left := -500;

  SetWindowLong(form1.Handle, GWL_EXSTYLE,
    GetWindowLong(form1.Handle, GWL_EXSTYLE)
    or WS_EX_TOOLWINDOW);

  form1.ShowModal;
end;

// Change form parameters
procedure TForm1.CreateParams( Var params: TCreateParams );
begin
   inherited CreateParams(params);
   params.Style := params.Style or WS_POPUP;
   params.ExStyle := params.ExStyle or WS_EX_TOOLWINDOW and not
                     WS_EX_APPWINDOW;
end;

// Click on button
procedure TForm1.Button1Click(Sender: TObject);
var a: single;
    s: dword;
begin
  s:=strtoint(edit2.text);
  a:=strtofloat(edit1.Text);

  sleeptime:=s;
  acceleration:=a;
end;

// Struct definition
type
 TCopyDataStruct = packed record
 dwData: DWORD; //up to 32 bits of data to be passed to the receiving application
 cbData: DWORD; //the size, in bytes, of the data pointed to by the lpData member
 lpData: Pointer; //Points to data to be passed to the receiving application. This member can be nil.
end;

// Copy data
procedure TForm1.WMCopyData(var Msg: TWMCopyData);
var
  s : string;
  js, Items, Item: TlkJSONbase;
begin
  s := PChar(Msg.CopyDataStruct.lpData) ;

  // Yes, we sent it as JSON. Parse it now
  js := TlkJSON.ParseText(s);

  if js.Field['type'].Value = 'setspeed' then begin
    sleeptime:=js.Field['sleeptime'].Value;
    acceleration:=js.Field['acceleration'].Value;

    edit2.text := inttostr(sleeptime);
    edit1.text := floattostr(acceleration);
  end;

  edit3.text := js.Field['type'].Value;
end;

end.
