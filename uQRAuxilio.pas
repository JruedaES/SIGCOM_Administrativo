unit uQRAuxilio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, DBTables, Db, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TfQRAuxilio = class(TForm)                    
    tEmpresaLogo: TTable;
    tEmpresaLogoCODIGOEMPRESA: TStringField;
    tEmpresaLogoCONSECUTIVO: TStringField;
    tEmpresaLogoLOGOEMPRESA: TBlobField;
    dsEmpresaLogo: TDataSource;
    qEmpresa: TQuery;
    qEmpleadosAuxilio: TQuery;
    qEmpleadosAuxilioCODIGOEMPLEADO: TFloatField;
    qEmpleadosAuxilioNOMBREEMPLEADO: TStringField;
    qDesayuno: TQuery;
    qAlmuerzo: TQuery;
    qComida: TQuery;
    qDesayunoCODIGOODT: TFloatField;
    qDesayunoCODIGOEMPLEADO: TFloatField;
    qDesayunoNOMBREEMPLEADO: TStringField;
    qDesayunoCANTIDADDESAYUNOS: TFloatField;
    qDesayunoCANTIDADALMUERZOS: TFloatField;
    qDesayunoCANTIDADCOMIDAS: TFloatField;
    qDesayunoCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qDesayunoVALORIMPUTACION: TFloatField;
    qAlmuerzoCODIGOODT: TFloatField;
    qAlmuerzoCODIGOEMPLEADO: TFloatField;
    qAlmuerzoNOMBREEMPLEADO: TStringField;
    qAlmuerzoCANTIDADDESAYUNOS: TFloatField;
    qAlmuerzoCANTIDADALMUERZOS: TFloatField;
    qAlmuerzoCANTIDADCOMIDAS: TFloatField;
    qAlmuerzoCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qAlmuerzoVALORIMPUTACION: TFloatField;
    qComidaCODIGOODT: TFloatField;
    qComidaCODIGOEMPLEADO: TFloatField;
    qComidaNOMBREEMPLEADO: TStringField;
    qComidaCANTIDADDESAYUNOS: TFloatField;
    qComidaCANTIDADALMUERZOS: TFloatField;
    qComidaCANTIDADCOMIDAS: TFloatField;
    qComidaCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qComidaVALORIMPUTACION: TFloatField;
    qrAuxilio: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRShape28: TQRShape;
    qrdbCodigoOdt: TQRDBText;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    qrdbNombreEmpleado: TQRDBText;
    qrdbCedula: TQRDBText;
    QRLabel78: TQRLabel;
    QRShape42: TQRShape;
    QRDBImage1: TQRDBImage;
    QRImage2: TQRImage;
    QRLabel82: TQRLabel;
    qrlCopia2: TQRLabel;
    qrlCopia1: TQRLabel;
    QRDBText2: TQRDBText;
    qrdbCia: TQRDBText;
    QRBand2: TQRBand;
    QRShape29: TQRShape;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    qrdbTotalAlimentacion: TQRDBText;
    QRLabel55: TQRLabel;
    QRShape27: TQRShape;
    qrdbAnhoAlmuerzo: TQRDBText;
    qrdbAnhoComida: TQRDBText;
    qrdbMesHastaComida: TQRDBText;
    qrdbMesHastaAlmuerzo: TQRDBText;
    qrdbMesHastaDesayuno: TQRDBText;
    qrdbDiaHastaDesayuno: TQRDBText;
    qrdbDiaHastaAlmuerzo: TQRDBText;
    qrdbDiaHastaComida: TQRDBText;
    qrdbMesDesdeComida: TQRDBText;
    qrdbMesDesdeAlmuerzo: TQRDBText;
    qrdbMesdesdeDesayuno: TQRDBText;
    qrdbDiaDesdeDesayuno: TQRDBText;
    qrdbDiaDesdeAlmuerzo: TQRDBText;
    qrdbDiaDesdeComida: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    qrlDesayuno: TQRLabel;
    qrlAlmuerzo: TQRLabel;
    qrlComida: TQRLabel;
    qrdbAnhoDesayuno: TQRDBText;
    qrdbCantidadAlmuerzo: TQRDBText;
    qrdbCantidadComida: TQRDBText;
    qrdbCantidadDesayuno: TQRDBText;
    qrdbValorComida: TQRDBText;
    qrdbValorAlmuerzo: TQRDBText;
    qrdbValorDesayuno: TQRDBText;
    QRLabel79: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    qrexpSubtotal: TQRExpr;
    QRLabel2: TQRLabel;
    qImputaciones: TQuery;
    qrImputaciones: TQuickRep;
    QRBand5: TQRBand;
    QRShape19: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRBand6: TQRBand;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape4: TQRShape;
    QRDBText3: TQRDBText;
    QRShape8: TQRShape;
    QRLabel5: TQRLabel;
    qCIA: TQuery;
    QRBand7: TQRBand;
    QRShape9: TQRShape;
    QRLabel26: TQRLabel;
    QRExpr1: TQRExpr;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape11: TQRShape;
    qImputacionesNUMEROIMPUTACION: TFloatField;
    qImputacionesAUXILIAR: TFloatField;
    qImputacionesDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qImputacionesCODIGOCENTROCOSTO: TFloatField;
    qImputacionesCODIGOAREARESPONSABILIDAD: TFloatField;
    qImputacionesVALORIMPUTACION: TFloatField;
    dsEmpleadoAuxilio: TDataSource;
    qEmpleadosAuxilioValorDesayuno: TIntegerField;
    qEmpleadosAuxilioCantidadAlmuerzo: TIntegerField;
    qEmpleadosAuxilioValorAlmuerzo: TIntegerField;
    qEmpleadosAuxilioCantidadComida: TIntegerField;
    qEmpleadosAuxilioValorComida: TIntegerField;
    qrlFechaInicio: TQRLabel;
    ChildBand1: TQRChildBand;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRShape20: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel14: TQRLabel;
    QRDBText5: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape13: TQRShape;
    QRLabelVehiculos: TQRLabel;
    qrlVehiculos: TQRLabel;
    qPagado: TQuery;
    qVehiculos: TQuery;
    ChildBand2: TQRChildBand;
    QRLabel15: TQRLabel;
    QRDBText6: TQRDBText;
    qEmpleadosAuxilioCODIGOODT: TFloatField;
    qDesayunoDIAINICIO: TFloatField;
    qDesayunoDIAFIN: TFloatField;
    qDesayunoANHO: TFloatField;
    qDesayunoCODIGOAUXILIO: TFloatField;
    qComidaCODIGOAUXILIO: TFloatField;
    qComidaDIAINICIO: TFloatField;
    qComidaDIAFIN: TFloatField;
    qComidaANHO: TFloatField;
    qAlmuerzoCODIGOAUXILIO: TFloatField;
    qAlmuerzoDIAINICIO: TFloatField;
    qAlmuerzoDIAFIN: TFloatField;
    qAlmuerzoANHO: TFloatField;
    qEmpleadosAuxilioCODIGOAUXILIO: TFloatField;
    qEmpleadosAuxilioCantidadDesayuno: TIntegerField;
    qEmpleadosAuxilioMESINICIO: TStringField;
    qEmpleadosAuxilioMESFIN: TStringField;
    qEmpleadosAuxilioDIAINICIO: TStringField;
    qEmpleadosAuxilioDIAFIN: TStringField;
    qEmpleadosAuxilioANHO: TStringField;
    qrlNumeroImpresion: TQRLabel;
    qrlCodigoBarra: TQRLabel;
    PageFooterBand1: TQRBand;
    QRShape14: TQRShape;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape15: TQRShape;
    qrlusuariobd: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrlDesayunoPrint(sender: TObject; var Value: String);
    procedure qrlAlmuerzoPrint(sender: TObject; var Value: String);
    procedure qrlComidaPrint(sender: TObject; var Value: String);
    procedure qrdbDiaDesdeDesayunoPrint(sender: TObject;
      var Value: String);
    procedure qrdbDiaDesdeAlmuerzoPrint(sender: TObject;
      var Value: String);
    procedure qrdbDiaDesdeComidaPrint(sender: TObject; var Value: String);
    procedure qrdbValorDesayunoPrint(sender: TObject; var Value: String);
    procedure qEmpleadosAuxilioCalcFields(DataSet: TDataSet);
    procedure qrAuxilioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure qrlCodigoBarraPrint(sender: TObject; var Value: String);
    procedure qrlNumeroImpresionPrint(sender: TObject; var Value: String);
  private
  public
    numeroimpresion:double;
    copia:boolean;
  end;

var
  fQRAuxilio: TfQRAuxilio;

implementation

uses uComunesAdministrativo;

{$R *.DFM}

procedure TfQRAuxilio.FormClose(Sender: TObject; var Action: TCloseAction);
var ruta:string;
begin
  copia:=false;
  numeroimpresion:=0;
    ruta := ExtractFilePath(ParamStr(0));
      if ruta[Length(ruta)] <> '\' then
        ruta := ruta + '\';
  RemoveFontResource(pchar(ruta+'3_of.ttf'));
  SendMessage(HWND_BROADCAST,WM_FONTCHANGE,0,0);
  Action:=caFree;
end;

procedure TfQRAuxilio.qrlDesayunoPrint(sender: TObject; var Value: String);
begin
  if qEmpleadosAuxilioCantidadDesayuno.AsInteger>0 then
    Value:='X'
  else
    Value:=' ';
end;

procedure TfQRAuxilio.qrlAlmuerzoPrint(sender: TObject; var Value: String);
begin
  if qEmpleadosAuxilioCantidadAlmuerzo.AsInteger>0 then
    Value:='X'
  else
    Value:=' ';
end;

procedure TfQRAuxilio.qrlComidaPrint(sender: TObject; var Value: String);
begin
  if qEmpleadosAuxilioCantidadComida.AsInteger>0 then
    Value:='X'
  else
    Value:=' ';
end;

procedure TfQRAuxilio.qrdbDiaDesdeDesayunoPrint(sender: TObject;
  var Value: String);
begin
  if not (qEmpleadosAuxilioCantidadDesayuno.AsInteger>0 )then
    Value:=' ';
end;

procedure TfQRAuxilio.qrdbDiaDesdeAlmuerzoPrint(sender: TObject;
  var Value: String);
begin
  if not (qEmpleadosAuxilioCantidadAlmuerzo.AsInteger>0 )then
    Value:=' ';
end;

procedure TfQRAuxilio.qrdbDiaDesdeComidaPrint(sender: TObject;
  var Value: String);
begin
  if not (qEmpleadosAuxilioCantidadComida.AsInteger>0 )then
    Value:=' ';
end;

procedure TfQRAuxilio.qrdbValorDesayunoPrint(sender: TObject;
  var Value: String);
begin
  if Value='$' then Value:=' ';
end;

procedure TfQRAuxilio.qEmpleadosAuxilioCalcFields(DataSet: TDataSet);
var query:tquery;
begin
  qDesayuno.Close;
  qDesayuno.Open;
  if qDesayuno.RecordCount>0 then
  begin
    qEmpleadosAuxilioCantidadDesayuno.AsInteger:=qDesayunoCANTIDADDESAYUNOS.AsInteger;
    qEmpleadosAuxilioValorDesayuno.AsFloat:=qDesayunoVALORIMPUTACION.AsFloat;
  end
  else
  begin
    qEmpleadosAuxilioCantidadDesayuno.AsInteger:=0;
    qEmpleadosAuxilioValorDesayuno.AsFloat:=0;
  end;
  qAlmuerzo.Close;
  qAlmuerzo.Open;
  if qAlmuerzo.RecordCount>0 then
  begin
    qEmpleadosAuxilioCantidadAlmuerzo.AsInteger:=qAlmuerzoCANTIDADALMUERZOS.AsInteger;
    qEmpleadosAuxilioValorAlmuerzo.AsFloat:=qAlmuerzoVALORIMPUTACION.AsFloat;
  end
  else
  begin
    qEmpleadosAuxilioCantidadAlmuerzo.AsInteger:=0;
    qEmpleadosAuxilioValorAlmuerzo.AsFloat:=0;
  end;
  qComida.Close;
  qComida.Open;
  if qComida.RecordCount>0 then
  begin
    qEmpleadosAuxilioCantidadComida.AsInteger:=qComidaCANTIDADCOMIDAS.AsInteger;
    qEmpleadosAuxilioValorComida.AsFloat:=qComidaVALORIMPUTACION.AsFloat;
  end
  else
  begin
    qEmpleadosAuxilioCantidadComida.AsInteger:=0;
    qEmpleadosAuxilioValorComida.AsFloat:=0;
  end;
  query:=TQuery.create(self);
  query.databasename:='BaseDato';
  query.sql.Add('SELECT EXTRACT(DAY FROM FECHAINICIO) AS DIAINICIO,');
  query.sql.Add('TO_CHAR(TO_DATE(EXTRACT(MONTH FROM FECHAINICIO), ''MM''), ''Month'') AS MESINICIO,');
  query.sql.Add('EXTRACT(DAY FROM FECHAFIN) AS DIAFIN,');
  query.sql.Add('TO_CHAR(TO_DATE(EXTRACT(MONTH FROM FECHAFIN), ''MM''), ''Month'') AS MESFIN,');
  query.sql.Add('EXTRACT(YEAR FROM FECHAFIN) AS ANHO');
  query.sql.Add('FROM ODTAUXILIO WHERE CODIGOAUXILIO='+qEmpleadosAuxilioCodigoAuxilio.asstring);
  query.open;
  qEmpleadosAuxilioDIAINICIO.AsString:=query.fieldbyname('DIAINICIO').AsString;
  qEmpleadosAuxilioMESINICIO.AsString:=query.fieldbyname('MESINICIO').AsString;
  qEmpleadosAuxilioDIAFIN.AsString:=query.fieldbyname('DIAFIN').AsString;
  qEmpleadosAuxilioMESFIN.AsString:=query.fieldbyname('MESFIN').AsString;
  qEmpleadosAuxilioANHO.AsString:=query.fieldbyname('ANHO').AsString;
  query.free;
end;

procedure TfQRAuxilio.qrAuxilioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  qDatos,qValor:tquery;
  valor:integer;
begin
  if not(copia) then
  begin
    if MessageDlg('Este Reporte solo se podrá imprimir una vez. Está seguro de imprimirlo?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      raise Exception.Create('Operacion Cancelada.');
    qValor:=TQuery.Create(Application);
    qValor.DatabaseName:='BaseDato';
    qValor.sql.add('select sum(nvl(valorimputacion,0))valor');
    qValor.sql.add('FROM ODTAUXILIO OA, EMPLEADO E,ODTAUXILIODETALLE OD');
    qValor.sql.add('WHERE OA.CODIGOEMPLEADO = E.CODIGOEMPLEADO');
    qValor.sql.add('AND (OA.COBROINDIVIDUAL<>''S'' OR COBROINDIVIDUAL IS NULL)');
    qValor.sql.add('AND OA.CODIGOAUXILIO=OD.CODIGOAUXILIO');
    qValor.sql.add('AND OA.CODIGOODT='+qEmpleadosAuxilioCODIGOODT.AsString);
    qValor.open;
    valor :=qValor.fieldbyname('valor').AsInteger;
    numeroimpresion:=RegistrarImpresionAuxilios(valor,qEmpleadosAuxilioCODIGOODT.asfloat);
    qValor.free;

    qDatos:=TQuery.Create(Application);
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Add('update odtauxilio set impreso = ''S'', numeroimpresion='+floatToStr(numeroimpresion));
    qDatos.SQL.Add('where codigoauxilio in ');
    qDatos.SQL.Add('(SELECT OA.CODIGOAUXILIO FROM ODTAUXILIO OA, EMPLEADO E');
    qDatos.SQL.Add('WHERE OA.CODIGOEMPLEADO = E.CODIGOEMPLEADO ');
    qDatos.SQL.Add('AND (OA.COBROINDIVIDUAL<>''S'' OR COBROINDIVIDUAL IS NULL)');
    qDatos.SQL.Add('AND OA.CODIGOODT=:CODIGOODT)');
    qDatos.DataSource:=dsEmpleadoAuxilio;
    qDatos.ExecSQL;
    qdatos.free;
  end;
  qrlFechaInicio.Caption:=FormatDateTime('dddddd',Now);
  if qEmpleadosAuxilio.RecordCount in [6,7,14,15,22,23,30,31,38,39,46,47,54,55,62,63,70,71,78,79] then
    SummaryBand1.ForceNewPage:=true
  else
    SummaryBand1.ForceNewPage:=false;  
end;

procedure TfQRAuxilio.FormCreate(Sender: TObject);
var ruta:string;
qconsulta:tquery;
begin
  qConsulta:= TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qconsulta.sql.text:= 'select upper(user||''@''||SYS_CONTEXT (''USERENV'', ''db_name'')) as usuario from dual';  qconsulta.open;
  qrlusuariobd.Caption:= qconsulta.FieldByName('usuario').asstring;
  qconsulta.free;
  copia:=false;
  numeroimpresion:=0;
    ruta := ExtractFilePath(ParamStr(0));
      if ruta[Length(ruta)] <> '\' then
        ruta := ruta + '\';
  AddFontResource(pchar(ruta+'3_of.ttf'));
  SendMessage(HWND_BROADCAST,WM_FONTCHANGE,0,0);
  copia:=false;
  numeroimpresion:=0;
end;

procedure TfQRAuxilio.qrlCodigoBarraPrint(sender: TObject;
  var Value: String);
begin
  value:='*'+floattostr(numeroimpresion)+'*';
//  value:='';
end;

procedure TfQRAuxilio.qrlNumeroImpresionPrint(sender: TObject;
  var Value: String);
begin
  value:=floattostr(numeroimpresion);
//  value:='';
end;

end.
                                         