unit uSeleccionarTipoPresupuesto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, RXCtrls;

type
  TfSeleccionarTipoPresupuesto = class(TForm)
    rxTipos: TRxCheckListBox;
    SBAceptar: TSpeedButton;
    sbCancelar: TSpeedButton;
    procedure SBAceptarClick(Sender: TObject);
    procedure sbCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoTipoPresupuesto : Integer;
  end;

var
  fSeleccionarTipoPresupuesto: TfSeleccionarTipoPresupuesto;

implementation

{$R *.DFM}

procedure TfSeleccionarTipoPresupuesto.SBAceptarClick(Sender: TObject);
var valor : Integer;
begin
   CodigoTipoPresupuesto := -1;
   valor := 0;
   if rxTipos.Checked[0] then valor := Valor+1;    // Material
   if rxTipos.Checked[1] then valor := Valor+10;   // Mano de Obra
   if rxTipos.Checked[2] then valor := Valor+100;  // Transporte
   if rxTipos.Checked[3] then valor := Valor+1000; // Equipo
   case valor of
     10   : CodigoTipoPresupuesto := 0;  //Mano de Obra 0
     1    : CodigoTipoPresupuesto := 1;  //MATERIAL 1
     1000 : CodigoTipoPresupuesto := 2;  //EQUIPO  2
     100  : CodigoTipoPresupuesto := 3;  //TRANSPORTE  3
     11   : CodigoTipoPresupuesto := 4;  //MANO DE OBRA Y MATERIAL 4
     1010 : CodigoTipoPresupuesto := 5;  //Mano de Obra y Equipo 5
     110  : CodigoTipoPresupuesto := 6;  //Mano de Obra y Transporte 6
     1001 : CodigoTipoPresupuesto := 7;  //MATERIAL Y EQUIPOS 7
     101  : CodigoTipoPresupuesto := 8;  //MATERIAL Y TRANSPORTE 8
     1100 : CodigoTipoPresupuesto := 9;  //EQUIPO Y TRANSPORTE 9
     1011 : CodigoTipoPresupuesto := 10; //MANO OBRA, MATERIAL Y EQUIPO 10
     111  : CodigoTipoPresupuesto := 11; //MANO OBRA, MATERIAL, Y TRANSPORTE 11
     1110 : CodigoTipoPresupuesto := 12; //MANO OBRA, EQUIPO Y TRANSPORTE 12
     1101 : CodigoTipoPresupuesto := 13; //MATERIAL, EQUIPO Y TRANSPORTE 13
     1111 : CodigoTipoPresupuesto := 14; //MANO OBRA, MATERIAL, EQUIPOS Y TRANSPORTE
   end;
   modalResult := mrOK;
end;

procedure TfSeleccionarTipoPresupuesto.sbCancelarClick(Sender: TObject);
begin
   CodigoTipoPresupuesto := -1;
   modalResult := mrCancel;
   Close;
end;

procedure TfSeleccionarTipoPresupuesto.FormActivate(Sender: TObject);
var valor, i : Integer;
begin
   Valor := 0;
   case CodigoTipoPresupuesto of
     0 : Valor := 10;
     1 : Valor := 1;
     2 : Valor := 1000;
     3 : Valor := 100;
     4 : Valor := 11;
     5 : Valor := 1010;
     6 : Valor := 110;
     7 : Valor := 1001;
     8 : Valor := 101;
     9 : Valor := 1100;
     10: Valor := 1011;
     11: Valor := 111;
     12: Valor := 1110;
     13: Valor := 1101;
     14: Valor := 1111;
   end;
   for i:=0 to 3 do rxTipos.Checked[i] := False;
   if valor >= 1000 then
   begin
     rxTipos.Checked[3] := True;
     valor := valor-1000;
   end;
   if valor >= 100 then
   begin
     rxTipos.Checked[2] := True;
     valor := valor-100;
   end;
   if valor >= 10 then
   begin
     rxTipos.Checked[1] := True;
     valor := valor-10;
   end;
   if valor >= 1 then
      rxTipos.Checked[0] := True;
end;

end.
