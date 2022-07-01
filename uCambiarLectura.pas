unit uCambiarLectura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Db, Buttons, Grids, DBGrids, DBTables,ConsDll,
  ComCtrls;

type
  TFCambioLectura = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    eLecturaAnterior: TEdit;
    eConsumoAnterior: TEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    eLecturaActual: TEdit;
    eConsumoActual: TEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    eLecturaNueva: TEdit;
    eConsumoNuevo: TEdit;
    GroupBox4: TGroupBox;
    Label20: TLabel;
    Label19: TLabel;
    GroupBox5: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    eLecturaAnteriorR: TEdit;
    eConsumoAnteriorR: TEdit;
    GroupBox6: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    eLecturaActualR: TEdit;
    eConsumoActualR: TEdit;
    GroupBox7: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    eLecturaNuevaR: TEdit;
    eConsumoNuevoR: TEdit;
    GroupBox8: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    GroupBox9: TGroupBox;
    Label29: TLabel;
    Label30: TLabel;
    eLecturaAnteriorD: TEdit;
    eConsumoAnteriorD: TEdit;
    GroupBox10: TGroupBox;
    Label31: TLabel;
    Label32: TLabel;
    eLecturaActualD: TEdit;
    eConsumoActualD: TEdit;
    GroupBox11: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    eLecturaNuevaD: TEdit;
    eConsumoNuevoD: TEdit;
    GroupBox12: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    procedure BitBtn3Click(Sender: TObject);
    procedure eLecturaNuevaKeyPress(Sender: TObject; var Key: Char);
    procedure eConsumoNuevoKeyPress(Sender: TObject; var Key: Char);
    procedure eConsumoNuevoRKeyPress(Sender: TObject; var Key: Char);
    procedure eLecturaNuevaRKeyPress(Sender: TObject; var Key: Char);
    procedure eLecturaNuevaDKeyPress(Sender: TObject; var Key: Char);
    procedure eConsumoNuevoDKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    CodigoBorrado: string;
    ValidarMaximoHorasExtras: boolean;

  public
    { Public declarations }
    bCancelando: Boolean;
    bDatosIncompletos : boolean;
    Fecha,Odts: string;
    Modificado:boolean;
    sFecha: TDateTime;
    AgujasGeneral : Integer;
    Function CalcularConsumo(LecturaAnterior , LecturaActual, Agujas : Integer) : Integer;
    Function Medidor(Agujas : Integer): Integer;
  end;

var
  FCambioLectura: TFCambioLectura;


implementation

uses uFormaFecha,Math, uFuncionSGD, uODTPadre;

{$R *.DFM}



procedure TFCambioLectura.BitBtn3Click(Sender: TObject);
begin

  try
  if eConsumoActual.Tag = 0 then
  eConsumoActual.Tag := 1;


  eConsumoNuevo.Text :=  FloatToStr(CalcularConsumo(StrToInt(eLecturaAnterior.Text),StrToInt(eLecturaNueva.Text),AgujasGeneral)*eConsumoActual.Tag);

 if TabSheet2.TabVisible then
 begin
  eConsumoNuevoR.Text := FloatToStr(CalcularConsumo(StrToInt(eLecturaAnteriorR.Text),StrToInt(eLecturaNuevaR.Text),AgujasGeneral)*eConsumoActual.Tag);
 end;

  if TabSheet3.TabVisible then
 begin


  eConsumoNuevoD.Text := FloatToStr(ROUND((StrToFloat(eLecturaNuevaD.Text) -StrToFloat(eLecturaAnteriorD.Text))*eConsumoActual.Tag))

 end;


 Except
 on e : Exception do
 Application.MessageBox(PChar('Alguno de los valores Para el calculo no es valído.'),'Información',MB_OK+MB_ICONERROR+MB_DEFBUTTON2);
 end;

  end;


function TFCambioLectura.CalcularConsumo(LecturaAnterior, LecturaActual,
  Agujas: Integer): Integer;
begin
Result := LecturaActual-LecturaAnterior;
 IF Result<0 then
Result:= ((Medidor(Agujas)-LecturaAnterior)+LecturaActual);
end;

function TFCambioLectura.Medidor(Agujas: Integer): Integer;
begin
   if Agujas = 3 then
   Result := 1000;
   if Agujas = 4 then
   Result := 10000;
   if Agujas = 5 then
   Result := 100000;
   if Agujas = 6 then
   Result := 10000000;
   if Agujas = 7 then
   Result := 100000000;
end;

procedure TFCambioLectura.eLecturaNuevaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', Char(VK_BACK), Char(VK_DELETE)]) then
    Key := #0;
end;

procedure TFCambioLectura.eConsumoNuevoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', Char(VK_BACK), Char(VK_DELETE)]) then
    Key := #0;
end;

procedure TFCambioLectura.eConsumoNuevoRKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', Char(VK_BACK), Char(VK_DELETE)]) then
    Key := #0;
end;

procedure TFCambioLectura.eLecturaNuevaRKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', Char(VK_BACK), Char(VK_DELETE)]) then
    Key := #0;
end;

procedure TFCambioLectura.eLecturaNuevaDKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', Char(VK_BACK), Char(VK_DELETE)]) then
    Key := #0;
end;

procedure TFCambioLectura.eConsumoNuevoDKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not(Key in ['0' .. '9', Char(VK_BACK), Char(VK_DELETE)]) then
    Key := #0;
end;

end.
