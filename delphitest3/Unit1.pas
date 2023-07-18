unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Bt8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Bt8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
Function calulate_equal(num1,num3:String;symbal:char):char;
Function Clicknum(text,send:String):String;
Procedure click_operation(check_num1:String);
Function change_operation(check_operation_bool:boolean;check_num2:String;check_operation:char):char;

var
  Form1: TForm1;
  operation: char;
  btnnum,num1,num2,tNum3,total: String;
  num3:String; // ��=�Ȧs
  numbool,operation_bool: Boolean;

implementation

{$R *.dfm}



procedure TForm1.Button12Click(Sender: TObject);  //��*
begin
  click_operation(num1);
  operation:=change_operation(operation_bool,num2,operation);
  operation:='*';
end;

procedure TForm1.Button13Click(Sender: TObject);  //��/
begin
  click_operation(num1);
  operation:=change_operation(operation_bool,num2,operation);
  operation:='/';
end;

procedure TForm1.Button14Click(Sender: TObject);  //��+
begin
  click_operation(num1);
  operation:=change_operation(operation_bool,num2,operation);
  operation:='+';
end;

procedure TForm1.Button15Click(Sender: TObject);  //��-
begin
  click_operation(num1);
  operation:=change_operation(operation_bool,num2,operation);
  operation:='-';
end;

//�P�_�p����}�Ү�num1�S���x�s��
Procedure click_operation(check_num1:String);
begin
  if check_num1='' then begin
    num1 := Form1.edit1.text;
    Form1.edit1.text := '0';
    num3:='';
    exit;
  end;
  num2 := Form1.edit1.text;
  num3 :='';
  numbool := true;
end;

Function change_operation(check_operation_bool:boolean;check_num2:String;check_operation:char):char;
begin
  if (check_operation_bool=true) and (check_num2<>'') and (check_operation<>'') then begin
    calulate_equal(num1,num2,operation);
    Form1.edit1.text := total;
    num1 := form1.edit1.text;
    num3 := '';
    result := operation;
  end;
end;

procedure TForm1.Button16Click(Sender: TObject);  //��.
begin
  if (POS('.',edit1.Text)<>0) then begin
    exit;
  end;
  edit1.Text := edit1.Text + '.';
end;

procedure TForm1.Button17Click(Sender: TObject);  //��C
begin
  edit1.text:='0';
  num1:='';
  num2:='';
  num3:='';
  operation:=#0
end;

procedure TForm1.Button18Click(Sender: TObject);  //��CE
begin
  edit1.text :='0';
  num3 := '';
end;

procedure TForm1.Button1Click(Sender: TObject);  //��0
begin
  btnnum:='0';
  edit1.text := Clicknum(edit1.text,btnnum);
end;

procedure TForm1.Button2Click(Sender: TObject);  //��1
begin
  btnnum:='1';
  edit1.text := Clicknum(edit1.text,btnnum);
end;

procedure TForm1.Button3Click(Sender: TObject);  //��2
begin
  btnnum:='2';
  edit1.text := Clicknum(edit1.text,btnnum);
end;

procedure TForm1.Button4Click(Sender: TObject);  //��3
begin
  btnnum:='3';
  edit1.text := Clicknum(edit1.text,btnnum);
end;

procedure TForm1.Button5Click(Sender: TObject);  //��4
begin
  btnnum:='4';
  edit1.text := Clicknum(edit1.text,btnnum);
end;

procedure TForm1.Button6Click(Sender: TObject);  //��5
begin
  btnnum:='5';
  edit1.text := Clicknum(edit1.text,btnnum);
end;

procedure TForm1.Button7Click(Sender: TObject);  //��6
begin
  btnnum:='6';
  edit1.text := Clicknum(edit1.text,btnnum);
end;

procedure TForm1.Bt8Click(Sender: TObject);  //��7
begin
  btnnum:='7';
  edit1.text := Clicknum(edit1.text,btnnum);
end;

procedure TForm1.Button9Click(Sender: TObject);  //��8
begin
  btnnum:='8';
  edit1.text := Clicknum(edit1.text,btnnum);
end;

procedure TForm1.Button10Click(Sender: TObject);  //��9
begin
  btnnum:='9';
  edit1.text := Clicknum(edit1.text,btnnum);
end;

procedure TForm1.Button11Click(Sender: TObject);  //��=
begin
  if num3='' then begin
    num3 := edit1.text;
  end;

  operation := calulate_equal(num1,num3,operation);
  edit1.text := total;
  num1 := edit1.text;
end;

Function clicknum(text,send:String):String;
begin
  operation_bool := true;
  if(text = '0') or (numbool = true) then begin
    numbool := false;
    result := send;
    exit;
  end;
  result := text + send;
end;

Function calulate_equal(num1,num3:String;symbal :char):char;
begin
  if symbal = '+' then begin
    total:= FloatToStr(StrToFloat(num1)+StrToFloat(num3));
    operation_bool:=false;
    Result:='+';
    exit;
  end;
  if symbal = '-' then begin
    total:= FloatToStr(StrToFloat(num1)-StrToFloat(num3));
    operation_bool:=false;
    Result:='-';
    exit;
  end;
  if symbal = '*' then begin
    total:= FloatToStr(StrToFloat(num1)*StrToFloat(num3));
    operation_bool:=false;
    Result:='*';
    exit;
  end;
  if symbal = '/' then begin
    total:= FloatToStr(StrToFloat(num1)/StrToFloat(num3));
    operation_bool:=false;
    Result:='/';
    exit;
  end;
end;
end.
