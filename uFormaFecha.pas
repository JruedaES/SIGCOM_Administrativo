unit uFormaFecha;

interface

uses Windows, Messages, Classes, Graphics, Forms, Controls, Buttons,
  SysUtils, StdCtrls, Grids, ExtCtrls, Calendar, DBTables,
  Menus, Spin, ComCtrls, utnNewCalendar, ImgList;

type
  TFFormaFecha = class(TForm)
    ImageList1: TImageList;
    pmMeses: TPopupMenu;
    Enero1: TMenuItem;
    Febrero1: TMenuItem;
    Marzo1: TMenuItem;
    Abril1: TMenuItem;
    Mayo1: TMenuItem;
    Junio1: TMenuItem;
    Julio1: TMenuItem;
    Agosto1: TMenuItem;
    Septiembre1: TMenuItem;
    Octubre1: TMenuItem;
    Noviembre1: TMenuItem;
    Diciembre1: TMenuItem;
    Panel1: TPanel;
    TitleLabel: TPanel;
    iAgnos: TImage;
    lMedidaTitulo: TLabel;
    iMeses: TImage;
    seAgnos: TSpinEdit;
    Calendar1: TNewCalendar;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    seSegundos: TSpinEdit;
    Label5: TLabel;
    seMinutos: TSpinEdit;
    Label4: TLabel;
    seHora: TSpinEdit;
    Label3: TLabel;
    procedure PrevMonthBtnClick(Sender: TObject);
    procedure NextMonthBtnClick(Sender: TObject);
    procedure Calendar1Change(Sender: TObject);
    procedure Calendar1DblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure iMesesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MesClic(Sender: TObject);
    procedure seAgnosExit(Sender: TObject);
    procedure iAgnosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure seAgnosChange(Sender: TObject);
    procedure Calendar1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure seSegundosChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    procedure SetDate(Date: TDateTime);
    function GetDate: TDateTime;
  public
    fTime: TDateTime;
    property Date: TDateTime read GetDate write SetDate;
  end;
var
  FFormaFecha: TFFormaFecha;
  sFecha: string;

implementation
uses dialogs;
{$R *.DFM}

procedure TFFormaFecha.SetDate(Date: TDateTime);
begin
  Calendar1.CalendarDate := Date;
end;

function TFFormaFecha.GetDate: TDateTime;
begin
  Result := Calendar1.CalendarDate;
end;

procedure TFFormaFecha.PrevMonthBtnClick(Sender: TObject);
begin
  Calendar1.PrevYear;
end;

procedure TFFormaFecha.NextMonthBtnClick(Sender: TObject);
begin
  Calendar1.NextYear;
end;

procedure TFFormaFecha.Calendar1Change(Sender: TObject);
var cadena:string;
begin
  try
   cadena := FormatDateTime('MMMM dd "de" YYYY ', Calendar1.CalendarDate);
   cadena[1] := UpperCase(cadena[1])[1];
   TitleLabel.Caption := cadena; // UpperCase(cadena[1]) + Copy(cadena, 2 length(cadena)-1);
   except
  end;
  lMedidaTitulo.Caption := TitleLabel.Caption;
  seAgnos.Left:=Trunc((2*TitleLabel.Left+TitleLabel.Width+lMedidaTitulo.Width)/2-seAgnos.Width+9);
  iAgnos.Left:=seAgnos.Left;
  iMeses.Left:= TitleLabel.Left+ (TitleLabel.Width-lMedidaTitulo.Width) div 2
end;

procedure TFFormaFecha.Calendar1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TFFormaFecha.FormActivate(Sender: TObject);
var Hour, Min, Sec, MSec: Word;
begin
 try
   if sFecha='' then
      Calendar1.CalendarDate:=date
   else
      Calendar1.CalendarDate:=int(strtodatetime(sFecha));
   Calendar1Change(nil);
   TitleLabel.Font.Color:=clCaptionText;
   seAgnos.Font.Color:=clCaptionText;

   if sFecha='' then
      fTime:=Time
   else
      fTime := frac(strtodatetime(sFecha));
   DecodeTime(fTime, Hour, Min, Sec, MSec);
   seHora.value := Hour;
   seMinutos.value := Min;
   seSegundos.value := Sec;
 except
 end;
{ if sFecha='' then
    seSegundos.value := 0  //
 else
    seSegundos.value := Sec;}
end;

procedure TFFormaFecha.SpeedButton2Click(Sender: TObject);
begin
  Calendar1.PrevMonth;
end;

procedure TFFormaFecha.SpeedButton3Click(Sender: TObject);
begin
  Calendar1.NextMonth;
end;

procedure TFFormaFecha.iMesesMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  pmMeses.Popup(left+iMeses.left+5+x,
              Top+iMeses.top+25);
  seAgnos.Hide;
end;

procedure TFFormaFecha.MesClic(Sender: TObject);
begin
Calendar1.Month:=(Sender as TMenuItem).Tag;
end;

procedure TFFormaFecha.seAgnosExit(Sender: TObject);
begin
  seAgnos.Hide;
end;

procedure TFFormaFecha.iAgnosMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  seAgnos.value:= Calendar1.Year;
  seAgnos.Show;
end;

procedure TFFormaFecha.seAgnosChange(Sender: TObject);
begin
  Calendar1.Year:=seAgnos.Value;
end;

procedure TFFormaFecha.Calendar1Click(Sender: TObject);
begin
  seAgnos.Hide;
end;

procedure TFFormaFecha.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var todobien:boolean;
    fechatem:TDateTime;
    ADay, AMonth, AYear :word;
begin
todobien:=false;
if Key =  vk_Prior then
     begin
     if ssCtrl in Shift
     then Calendar1.Year:=Calendar1.Year-1
     else repeat
      Try
      if Calendar1.Month=1
      then begin
           Calendar1.Month:=12;
           Calendar1.Year:=Calendar1.Year-1;
           end
      else Calendar1.Month:=Calendar1.Month-1;
      todobien:=true;
      except Calendar1.Day:=Calendar1.Day-1;
      end;//try
      until todobien;
     Key:=0;
     end
  else if Key =  vk_Next then
     begin
     if ssCtrl in Shift
     then Calendar1.Year:=Calendar1.Year+1
     else repeat
      Try
      if Calendar1.Month=12
      then begin
           Calendar1.Month:=1;
           Calendar1.Year:=Calendar1.Year+1;
           end
      else Calendar1.Month:=Calendar1.Month+1;
      todobien:=true;
      except Calendar1.Day:=Calendar1.Day-1;
      end;//try
      until todobien;
     Key:=0;
     end
  else if Key =  vk_Left then
     begin
     fechaTem:=EncodeDate(Calendar1.Year, Calendar1.Month, Calendar1.Day);
     fechatem:=fechaTem-1;
     DecodeDate(fechatem, AYear, AMonth, ADay);
     Calendar1.Day:=ADay;
     Calendar1.Month:=AMonth;
     Calendar1.Year:=AYear;
     Key:=0;
     end
  else if Key =  vk_Right then
     begin
     fechaTem:=EncodeDate(Calendar1.Year, Calendar1.Month, Calendar1.Day);
     fechatem:=fechaTem+1;
     DecodeDate(fechatem, AYear, AMonth, ADay);
     Calendar1.Day:=ADay;
     Calendar1.Month:=AMonth;
     Calendar1.Year:=AYear;
     Key:=0;
     end
end;

procedure TFFormaFecha.FormCreate(Sender: TObject);
begin
 height:=250;
end;

procedure TFFormaFecha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFFormaFecha.seSegundosChange(Sender: TObject);
var Tiempo:TDateTime;
begin
 try
  Tiempo:=EncodeTime(seHora.value, seMinutos.value, seSegundos.value, 0);
  fTime:=Tiempo;
 except
 end;
end;

procedure TFFormaFecha.BitBtn1Click(Sender: TObject);
var Tiempo:TDateTime;
begin
  Tiempo:=EncodeTime(seHora.value, seMinutos.value, seSegundos.value, 0);
  fTime:=Tiempo;
end;

procedure TFFormaFecha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
     Perform(wm_NextDLGCTL, 0, 0);
end;

end.
