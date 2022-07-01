unit uQRODTUrbanaRuralAdc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, StdCtrls, ComCtrls;

type
  TfQRODTUrbanaRuralAdc = class(TForm)
    QuickRep1: TQuickRep;
    qODTPadre: TQuery;
    qODTHija: TQuery;
    dsODTPadre: TDataSource;
    qODTPadreCODIGOODT: TFloatField;
    qODTPadreFECHAEMISION: TDateTimeField;
    qODTPadreCODIGOADMINISTRATIVO: TFloatField;
    qODTPadreCODIGOPRIORIDAD: TStringField;
    qODTPadreCODIGOTIPOTAREA: TFloatField;
    qODTPadreCODIGOAPROBADO: TFloatField;
    qODTPadreCODIGOREVISADO: TFloatField;
    qODTPadreCODIGOODTTIPOMANOOBRA: TFloatField;
    qODTPadreCODIGOEJECUTOR: TFloatField;
    qODTPadreCODIGOFIRMANTE: TFloatField;
    qODTPadreEQUIPOENERGIZADO: TStringField;
    qODTPadreFECHAAPROBACION: TDateTimeField;
    qODTPadreFECHAASIGNACION: TDateTimeField;
    qODTPadreIMPUTACIONMATERIAL: TStringField;
    qODTPadreCOSTOMATERIAL: TFloatField;
    qODTPadreCOSTOMANOOBRA: TFloatField;
    qODTPadreCOSTOTRANSPORTE: TFloatField;
    qODTPadreCOSTOEQUIPO: TFloatField;
    qODTPadreCODIGOALMACEN: TStringField;
    qODTPadreCODIGOESTADOODT: TStringField;
    qPresmano: TQuery;
    dsODTHija: TDataSource;
    qPresmate: TQuery;
    qReportes: TQuery;
    QRBand1: TQRBand;
    QRDBText2: TQRDBText;
    GroupHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    GroupHeaderBand2: TQRBand;
    QRLabel3: TQRLabel;
    GroupHeaderBand3: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel2: TQRLabel;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    qODTHijaCODIGOODT: TFloatField;
    qODTHijaCONSECUTIVO: TFloatField;
    qODTHijaIMPRESOODT: TStringField;
    qODTHijaCODIGOGRUPOTRABAJO: TFloatField;
    qODTHijaCODIGOGEOGRAFICO: TFloatField;
    qODTHijaCODIGOTIPOVIA: TFloatField;
    qODTHijaCODIGONOMBREVIA: TFloatField;
    qODTHijaMODIFICADORVIA: TStringField;
    qODTHijaDUPLICADOR: TFloatField;
    qODTHijaMODIFICADORDUPLICADOR: TStringField;
    qODTHijaNUMEROPUERTA: TFloatField;
    qODTHijaCODIGOSUBESTACION: TStringField;
    qODTHijaCODIGOCIRCUITO: TStringField;
    qODTHijaCODIGOTIPOELEMENTO: TStringField;
    qODTHijaCODIGOEQUIPO: TStringField;
    qODTHijaFECHAINICIOTRABAJO: TDateTimeField;
    qODTHijaFECHAFINALTRABAJO: TDateTimeField;
    qODTHijaTIEMPOUTIL: TFloatField;
    qODTHijaHORASHOMBRE: TFloatField;
    qODTHijaCOSTOMATERIAL: TFloatField;
    qODTHijaCOSTOMANOOBRA: TFloatField;
    qODTHijaCOSTOTRANSPORTE: TFloatField;
    qODTHijaCOSTOEQUIPO: TFloatField;
    qODTHijaOBSERVACION1: TStringField;
    qODTHijaOBSERVACION2: TStringField;
    qODTHijaOBSERVACION3: TStringField;
    qODTHijaDIRECCION: TStringField;
    QRDBText1: TQRDBText;
    qDireccion: TQuery;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    qCIG: TQuery;
    QRDBText7: TQRDBText;
    QRShape3: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape4: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    qSubestacion: TQuery;
    QRDBText10: TQRDBText;
    qTipoElemento: TQuery;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRShape24: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape44: TQRShape;
    QRShape41: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape25: TQRShape;
    qrdbCodigoEmpleado: TQRDBText;
    qrdbNombreEmpleado: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText17: TQRDBText;
    QRLabel33: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRLabel34: TQRLabel;
    QRDBText20: TQRDBText;
    qrdbExtrasDiurnas: TQRDBText;
    QRDBText21: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText22: TQRDBText;
    qrdbExtrasNocturnas: TQRDBText;
    QRDBText23: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    qrdbDesayuno: TQRDBText;
    qrdbAlmuerzo: TQRDBText;
    qrdbComida: TQRDBText;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape46: TQRShape;
    QRShape42: TQRShape;
    QRShape49: TQRShape;
    QRShape28: TQRShape;
    QRShape50: TQRShape;
    QRShape29: TQRShape;
    QRShape43: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    qPresmanoCODIGOEMPLEADO: TFloatField;
    qPresmanoNOMBREEMPLEADO: TStringField;
    qPresmanoVIATICOS: TFloatField;
    qPresmanoEXTRASDIURNAS: TFloatField;
    qPresmanoEXTRASNOCTURNAS: TFloatField;
    qPresmanoDESAYUNO: TFloatField;
    qPresmanoALMUERZO: TFloatField;
    qPresmanoCOMIDA: TFloatField;
    QRLabel26: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape45: TQRShape;
    QRShape47: TQRShape;
    qrdbCodigoMaterial: TQRDBText;
    qrdbNombreMaterial: TQRDBText;
    qrdbUnidad: TQRDBText;
    qrdbSolicitado: TQRDBText;
    qrdbEntregado: TQRDBText;
    qrdbConsumido: TQRDBText;
    qrdbReintegrado: TQRDBText;
    qrdbRetBueno: TQRDBText;
    qrdbRetMalo: TQRDBText;
    QRShape48: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRBand2: TQRBand;
    ShTitulo: TQRShape;
    QRDBImage1: TQRDBImage;
    qrdbNombreEmpresa: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    qrdbCodigoODT: TQRDBText;
    qrdbFechaEmision: TQRDBText;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    qEmpresa: TQuery;
    QRLabel54: TQRLabel;
    qrdbMotivos: TQRDBText;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    qrlEnergizado: TQRLabel;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    qrlNormal: TQRLabel;
    QRLabel57: TQRLabel;
    qrlVehiculos: TQRLabel;
    QRShape65: TQRShape;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    qrlUrgente: TQRLabel;
    qrlEmergencia: TQRLabel;
    QRShape66: TQRShape;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    qrlDesenergizado: TQRLabel;
    QRShape67: TQRShape;
    QRLabel65: TQRLabel;
    qrlLabor: TQRLabel;
    QRLabel66: TQRLabel;
    qrlTarea: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    qrdbFechaAprobacion: TQRDBText;
    qrdbFechaAsignacion: TQRDBText;
    qrdbFechaInicioTrabajo: TQRDBText;
    qrdbFechaFinalTrabajo: TQRDBText;
    QRLabel72: TQRLabel;
    QRShape58: TQRShape;
    QRLabel73: TQRLabel;
    qrlAdministrativo: TQRLabel;
    QRLabel74: TQRLabel;
    qrlTipoManoObra: TQRLabel;
    QRLabel75: TQRLabel;
    qrlGrupoTrabajo: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    qrlAprobado: TQRLabel;
    qrlRevisado: TQRLabel;
    qrlEjecutado: TQRLabel;
    QRLabel79: TQRLabel;
    QRShape70: TQRShape;
    ChildBand1: TQRChildBand;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRLabel55: TQRLabel;
    qODTHijaMEDIDAS1: TStringField;
    qODTHijaMEDIDAS2: TStringField;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    qODTHijaSIMBOLOS1: TStringField;
    QRDBText31: TQRDBText;
    qODTHijaSIMBOLOS2: TStringField;
    QRBand3: TQRBand;
    QRLabel56: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel83: TQRLabel;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    qFechaInicio: TQuery;
    qFechaFinal: TQuery;
    qODTPadreCODIGOLABOR: TStringField;
    tEmpresaLogo: TTable;
    qODTPadreMOTIVOS: TMemoField;
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure qrdbFechaAprobacionPrint(sender: TObject; var Value: String);
    procedure qrdbFechaAsignacionPrint(sender: TObject; var Value: String);
    procedure qrdbFechaInicioTrabajoPrint(sender: TObject;
      var Value: String);
    procedure qrdbFechaFinalTrabajoPrint(sender: TObject;
      var Value: String);
    procedure qODTHijaCalcFields(DataSet: TDataSet);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure QuickRep1AfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRODTUrbanaRuralAdc: TfQRODTUrbanaRuralAdc;

implementation

uses uODTUrbanaRural;

{$R *.DFM}

procedure TfQRODTUrbanaRuralAdc.QRDBText9Print(sender: TObject;
  var Value: String);
begin
    if Trim(Value) = '30    12    1899      00 : 00' then
      Value:='';
end;

procedure TfQRODTUrbanaRuralAdc.qrdbFechaAprobacionPrint(sender: TObject;
  var Value: String);
begin
    if Trim(Value) = '30    12    1899      00 : 00' then
      Value:='';
end;

procedure TfQRODTUrbanaRuralAdc.qrdbFechaAsignacionPrint(sender: TObject;
  var Value: String);
begin
    if Trim(Value) = '30    12    1899      00 : 00' then
      Value:='';
end;

procedure TfQRODTUrbanaRuralAdc.qrdbFechaInicioTrabajoPrint(
  sender: TObject; var Value: String);
begin
   if Trim(Value) = '30    12    1899      00 : 00' then
      Value:='';
end;

procedure TfQRODTUrbanaRuralAdc.qrdbFechaFinalTrabajoPrint(sender: TObject;
  var Value: String);
begin
   if Trim(Value) = '30    12    1899      00 : 00' then
      Value:='';
end;

procedure TfQRODTUrbanaRuralAdc.QRDBText8Print(sender: TObject;
  var Value: String);
begin
   if Trim(Value) = '30    12    1899      00 : 00' then
      Value:='';
end;

procedure TfQRODTUrbanaRuralAdc.qODTHijaCalcFields(DataSet: TDataSet);
var qMedidasSeguridad:TQuery;
    Cont:Integer;
begin
   qMedidasSeguridad:=TQuery.Create(Application);
   qMedidasSeguridad.DatabaseName:='BaseDato';
   qMedidasSeguridad.SQL.Add('SELECT M.NOMBREMEDIDASEGURIDAD, OM.ESTADO, LENGTH(M.NOMBREMEDIDASEGURIDAD) FROM');
   qMedidasSeguridad.SQL.Add('MEDIDASEGURIDAD M, ODTMEDIDASEGURIDAD OM');
   qMedidasSeguridad.SQL.Add('WHERE (M.CODIGOMEDIDASEGURIDAD = OM.CODIGOMEDIDASEGURIDAD)');
   qMedidasSeguridad.SQL.Add('AND (OM.CODIGOODT=:CODIGOODT) AND (OM.CONSECUTIVO=:CONSECUTIVO)');
   qMedidasSeguridad.ParamByName('CODIGOODT').AsString:=qODTHijaCODIGOODT.AsString;
   qMedidasSeguridad.ParamByName('CONSECUTIVO').AsString:=qODTHijaCONSECUTIVO.AsString;
   qMedidasSeguridad.Open;
   Cont:=0;
   while not qMedidasSeguridad.Eof do
   begin
     if Cont < 4 then
     begin
       DataSet.FieldByName('MEDIDAS1').AsString:=DataSet.FieldByName('MEDIDAS1').AsString + Chr(13) +  qMedidasSeguridad.Fields[0].AsString;
       DataSet.FieldByName('SIMBOLOS1').AsString:=DataSet.FieldByName('SIMBOLOS1').AsString + Chr(13) + 'Ö';
     end
     else
     begin
       DataSet.FieldByName('MEDIDAS2').AsString:=DataSet.FieldByName('MEDIDAS2').AsString + Chr(13) +  qMedidasSeguridad.Fields[0].AsString;
       DataSet.FieldByName('SIMBOLOS2').AsString:=DataSet.FieldByName('SIMBOLOS2').AsString + Chr(13) + 'Ö';
     end;
     Inc(Cont);
     qMedidasSeguridad.Next;
   end;
   qMedidasSeguridad.Free;
end;



procedure TfQRODTUrbanaRuralAdc.QuickRep1AfterPreview(Sender: TObject);
begin
  Close;
end;

procedure TfQRODTUrbanaRuralAdc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
