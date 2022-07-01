unit uQRLiquidarExtrasRecargos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, DBTables, Db, Digisoft, jpeg;

type
  TFQRLiquidarExtrasRecargos = class(TForm)
    tEmpresaLogo: TTable;
    qEmpresa: TQuery;
    QuickRep: TQuickRep;
    BandaTitulo2: TQRBand;
    BandaTitulo: TQRBand;
    QRDBImage1: TQRDBImage;
    qrdbNombreEmpresa: TQRDBText;
    qlAreaFuncional: TQRLabel;
    qrdbNIT: TQRDBText;
    qrlSeccion: TQRLabel;
    qrlCargo: TQRLabel;
    DetailBand1: TQRBand;
    qrlNombreEmpleado: TQRLabel;
    qrlCedula: TQRLabel;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape7: TQRShape;
    qrdbNombreCia: TQRDBText;
    qrdbCedulaEmpleado: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    qrlDias: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    qrlhd: TQRLabel;
    qrlhn: TQRLabel;
    qrlDeaDiurno: TQRLabel;
    qrlDeaNocturno: TQRLabel;
    qrdbCargoEmpleado: TQRDBText;
    qrdbNombreEmpleado: TQRDBText;
    qrlObservacion: TQRLabel;
    qrlTurnos: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    qrdbDia: TQRDBText;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    qrdbCantidadDiurna: TQRDBText;
    qrdbCantidadNocturna: TQRDBText;
    qrdbDeaDiurno: TQRDBText;
    qrdbDeaNocturno: TQRDBText;
    qrdbObservacion: TQRDBText;
    qrdbCantidadExtraDiurna: TQRDBText;
    qrdbCantidadExtraNocturna: TQRDBText;
    qrdbDeaExtraDiurno: TQRDBText;
    qrdbDeaExtraNocturno: TQRDBText;
    qrdbObservacionExtra: TQRDBText;
    QRShape8: TQRShape;
    ChildBand1: TQRChildBand;
    qrdbSRNocturnoOrdinario: TQRDBText;
    QRShape45: TQRShape;
    qrdbSRDiurnoDomingo: TQRDBText;
    QRShape46: TQRShape;
    qrdbSRNocturnoDomingo: TQRDBText;
    QRShape47: TQRShape;
    qrdbSRDiurnoFestivo: TQRDBText;
    QRShape48: TQRShape;
    qrdbSRNocturnoFestivo: TQRDBText;
    QRShape49: TQRShape;
    qrdbSTDiurnoOrdinarioConv: TQRDBText;
    QRShape50: TQRShape;
    qrdbSTNocturnoOrdinario: TQRDBText;
    qrdbSTDiurnoDomingoFestivo: TQRDBText;
    QRShape52: TQRShape;
    qrdbSTDiurnoDomingoFestivoAdicional: TQRDBText;
    QRShape53: TQRShape;
    qrdbSTNocturnoDomingoFestivo: TQRDBText;
    QRShape54: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape57: TQRShape;
    qrlSobreremuneracion: TQRLabel;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRLabel10: TQRLabel;
    QRShape74: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    qrdbDia2: TQRDBText;
    QRImage2: TQRImage;
    qCargo: TQuery;
    qCargoNOMBRECARGO: TStringField;
    QRShape9: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape99: TQRShape;
    qrdbSTDiurnoOrdinario: TQRDBText;
    qrdbSTNocturnoOrdinarioConv: TQRDBText;
    qrdbSTDiurnoDomingoFestivoConv: TQRDBText;
    qrdbSTNocturnoDomingoFestivoConv: TQRDBText;
    QRShape93: TQRShape;
    QRShape51: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    qrdbFecha: TQRDBText;
    QRShape11: TQRShape;
    ChildBand3: TQRChildBand;
    qrdbPSRNocturnoOrdinario: TQRDBText;
    QRShape14: TQRShape;
    qrdbPSRDiurnoDomingo: TQRDBText;
    QRShape55: TQRShape;
    qrdbPSRNocturnoDomingo: TQRDBText;
    QRShape56: TQRShape;
    qrdbPSRDiurnoFestivo: TQRDBText;
    QRShape63: TQRShape;
    qrdbPSRNocturnoFestivo: TQRDBText;
    QRShape64: TQRShape;
    qrdbPSTDiurnoOrdinarioConv: TQRDBText;
    QRShape65: TQRShape;
    qrdbPSTNocturnoOrdinario: TQRDBText;
    qrdbPSTDiurnoDomingoFestivo: TQRDBText;
    QRShape66: TQRShape;
    qrdbPSTDiurnoDomingoFestivoAdicional: TQRDBText;
    QRShape67: TQRShape;
    qrdbPSTNocturnoDomingoFestivo: TQRDBText;
    QRShape68: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape84: TQRShape;
    qrdbPSTDiurnoOrdinario: TQRDBText;
    qrdbPSTNocturnoOrdinarioConv: TQRDBText;
    qrdbPSTDiurnoDomingoFestivoConv: TQRDBText;
    qrdbPSTNocturnoDomingoFestivoConv: TQRDBText;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRBand2: TQRBand;
    QRShape2: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape10: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    ChildBand2: TQRChildBand;
    qrdbDisponibilidad: TQRDBText;
    QRShape79: TQRShape;
    QRLabel13: TQRLabel;
    QRShape90: TQRShape;
    QRLabel20: TQRLabel;
    qrdbPSTDisponibilidadSabado: TQRDBText;
    qrdbPSTDisponibilidadDomingo: TQRDBText;
    QRShape91: TQRShape;
    QRShape94: TQRShape;
    qrdbSTDisponibilidadSabado: TQRDBText;
    QRShape95: TQRShape;
    qrdbSTDisponibilidadDomingo: TQRDBText;
    QRShape100: TQRShape;
    qZonaESSA: TQuery;
    QRDBText1: TQRDBText;
    qZonaESSANOMBRE_EMPRESA: TStringField;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape85: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel14: TQRLabel;
    procedure qrdbNombreCiaPrint(sender: TObject; var Value: String);
    procedure qrdbFechaPrint(sender: TObject; var Value: String);
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrdbCantidadDiurnaPrint(sender: TObject; var Value: String);
    procedure qrdbDeaDiurnoPrint(sender: TObject; var Value: String);
    procedure qrdbDiaPrint(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
    procedure qrdbDisponibilidadPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    ListaDomingos,ListaFestivos :TStringList;
    { Public declarations }
  end;

var
  FQRLiquidarExtrasRecargos: TFQRLiquidarExtrasRecargos;

implementation

{$R *.DFM}

procedure TFQRLiquidarExtrasRecargos.qrdbNombreCiaPrint(sender: TObject;
  var Value: String);
begin
  Value:=UpperCase(Value);
end;

procedure TFQRLiquidarExtrasRecargos.qrdbFechaPrint(sender: TObject;
  var Value: String);
begin
  Value:=UpperCase(Value);
end;

procedure TFQRLiquidarExtrasRecargos.QuickRepAfterPreview(Sender: TObject);
begin
  Close;
end;

procedure TFQRLiquidarExtrasRecargos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFQRLiquidarExtrasRecargos.qrdbCantidadDiurnaPrint(
  sender: TObject; var Value: String);
begin
  if Value='0' then Value:='---';
end;

procedure TFQRLiquidarExtrasRecargos.qrdbDeaDiurnoPrint(sender: TObject;
  var Value: String);
begin
  if length(value)>=20 then (sender as TQRDBText).Font.Size:=4
  else if length(value)>=14 then (sender as TQRDBText).Font.Size:=5
       else (sender as TQRDBText).Font.Size:=6;
  if Value='' then Value:='-----';
end;

procedure TFQRLiquidarExtrasRecargos.qrdbDiaPrint(sender: TObject;
  var Value: String);
var i:integer;
    encontrado:boolean;
begin
   encontrado:=false;
   for i:=0 to ListaDomingos.Count-1 do
   begin
     if ListaDomingos[i]=Value then
     begin
      (sender as TQRDBText).Color:=clRed;
      encontrado:=true;
      break;
     end;
   end;
   for i:=0 to ListaFestivos.Count-1 do
   begin
     if ListaFestivos[i]=Value then
     begin
      (sender as TQRDBText).Color:=clAqua;
      encontrado:=true;
      break;
     end;
   end;
   if not encontrado then
    (sender as TQRDBText).Color:=clWhite;   
end;

procedure TFQRLiquidarExtrasRecargos.FormCreate(Sender: TObject);
begin
  ListaDomingos:=TStringList.Create;
  ListaFestivos:=TStringList.Create;
end;

procedure TFQRLiquidarExtrasRecargos.qrdbDisponibilidadPrint(
  sender: TObject; var Value: String);
begin
  if value='0' then value:='';
end;

end.
 