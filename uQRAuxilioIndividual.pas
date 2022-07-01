unit uQRAuxilioIndividual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, DBTables, Db, Qrctrls, QuickRpt, ExtCtrls, jpeg, ufuncionsgd;

type
  TfQRAuxilioIndividual = class(TForm)
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
    QRShape42: TQRShape;
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
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRLabel10: TQRLabel;
    QRBand6: TQRBand;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
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
    dsEmpleadoAuxilio: TDataSource;
    qEmpleadosAuxilioValorDesayuno: TIntegerField;
    qEmpleadosAuxilioCantidadAlmuerzo: TIntegerField;
    qEmpleadosAuxilioValorAlmuerzo: TIntegerField;
    qEmpleadosAuxilioCantidadComida: TIntegerField;
    qEmpleadosAuxilioValorComida: TIntegerField;
    SummaryBand1: TQRBand;
    qPagado: TQuery;
    qVehiculos: TQuery;
    ChildBand2: TQRChildBand;
    QRLabel15: TQRLabel;
    QRDBText6: TQRDBText;
    qEmpleadosAuxilioCODIGOODT: TFloatField;
    qDesayunoCODIGOAUXILIO: TFloatField;
    qComidaCODIGOAUXILIO: TFloatField;
    qAlmuerzoCODIGOAUXILIO: TFloatField;
    qAlmuerzoANHO: TFloatField;
    qEmpleadosAuxilioCODIGOAUXILIO: TFloatField;
    qEmpleadosAuxilioCantidadDesayuno: TIntegerField;
    PageFooterBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    qEmpleadosAuxilioMESINICIO: TStringField;
    qEmpleadosAuxilioMESFIN: TStringField;
    qEmpleadosAuxilioDIAINICIO: TStringField;
    qEmpleadosAuxilioDIAFIN: TStringField;
    qEmpleadosAuxilioANHO: TStringField;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    ChildBand1: TQRChildBand;
    qrdbCodigoOdt: TQRDBText;
    QRLabel78: TQRLabel;
    qrlFechaInicio: TQRLabel;
    qrlCodigoBarra: TQRLabel;
    qrlusuariobd2: TQRLabel;
    QRDBImage1: TQRDBImage;
    qlNombreEmpresa: TQRLabel;
    QRImage2: TQRImage;
    qrlTitulo: TQRLabel;
    qrlusuariobd: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText5: TQRDBText;
    qrdbSalario: TQRDBText;
    QRLabel13: TQRLabel;
    qrdbViaticoDiario: TQRDBText;
    QRLabel14: TQRLabel;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRLabel18: TQRLabel;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    qrdbDependencia: TQRDBText;
    QRShape18: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    qImputacionesNUMEROIMPUTACION: TFloatField;
    qImputacionesAUXILIAR: TFloatField;
    qImputacionesDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qImputacionesCODIGOCENTROCOSTO: TFloatField;
    qImputacionesCODIGOAREARESPONSABILIDAD: TFloatField;
    qImputacionesTIPO: TStringField;
    qImputacionesCANTIDAD: TFloatField;
    QRDBText8: TQRDBText;
    qValorDesayuno: TQuery;
    qValorAlmuerzo: TQuery;
    qValorComida: TQuery;
    qImputacionesVALORUNITARIO: TFloatField;
    qImputacionesVALORIMPUTACION: TFloatField;
    qEmpleadosAuxilioCODIGOODTLETRA: TStringField;
    QRDBText9: TQRDBText;
    qValorDesayunoVALORAUXILIOALIMENTACION: TFloatField;
    qValorComidaVALORAUXILIOALIMENTACION: TFloatField;
    qValorAlmuerzoVALORAUXILIOALIMENTACION: TFloatField;
    QRSysData3: TQRSysData;
    QRLFechaimpresion: TQRLabel;
    QRLabel32: TQRLabel;
    QRLCompania: TQRLabel;
    qCIACODIGOADMINISTRATIVO: TFloatField;
    qCIANOMBRECATEGORIA: TStringField;
    QRLabel21: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel27: TQRLabel;
    QRDBText15: TQRDBText;
    QRSysData4: TQRSysData;
    QRLabel54: TQRLabel;
    QRShape41: TQRShape;
    QRShape38: TQRShape;
    QRShape36: TQRShape;
    QRShape1: TQRShape;
    QRLabel53: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel65: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrAuxilioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
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
    procedure FormCreate(Sender: TObject);
    procedure qrlCodigoBarraPrint(sender: TObject; var Value: String);
    procedure qrlNumeroImpresionPrint(sender: TObject; var Value: String);
    procedure qImputacionesCalcFields(DataSet: TDataSet);
  private
    dblinkOW: String;
    function SiguientePagina (valor : Integer) : Boolean;
  public
    numeroimpresion:double;  
    copia:boolean;
  end;

var
  fQRAuxilioIndividual: TfQRAuxilioIndividual;

implementation

uses uComunesAdministrativo, uODTPadre;

{$R *.DFM}

procedure TfQRAuxilioIndividual.FormClose(Sender: TObject; var Action: TCloseAction);
var ruta:string;
begin
  copia:=false;
    ruta := ExtractFilePath(ParamStr(0));
      if ruta[Length(ruta)] <> '\' then
        ruta := ruta + '\';
  RemoveFontResource(pchar(ruta+'3_of.ttf'));
  SendMessage(HWND_BROADCAST,WM_FONTCHANGE,0,0);
  Action:=caFree;
end;

procedure TfQRAuxilioIndividual.qrAuxilioBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  qDatos,qValor:tquery;
  valor:integer;
begin
  {if not copia then
  begin
    if MessageDlg('Este Reporte solo se podrá imprimir una vez. Está seguro de imprimirlo?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
      raise Exception.Create('Operacion Cancelada.');
  end
  else
  begin
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
    numeroimpresion:=RegistrarImpresionAuxilios(valor,qEmpleadosAuxilioCODIGOODT.AsFloat);
    qValor.free;
  end;
   qDatos:=TQuery.Create(Application);
   qDatos.DatabaseName:='BaseDato';
   qDatos.SQL.Add('update odtauxilio set impreso = ''S'', numeroimpresion='+floatToStr(numeroimpresion));
   qDatos.SQL.Add('where codigoauxilio in ');
   qDatos.SQL.Add('(SELECT OA.CODIGOAUXILIO FROM ODTAUXILIO OA, EMPLEADO E');
   qDatos.SQL.Add('WHERE OA.CODIGOEMPLEADO = E.CODIGOEMPLEADO');
   qDatos.SQL.Add('AND (OA.COBROINDIVIDUAL=''S'')');
   qDatos.SQL.Add('AND OA.CODIGOODT=:CODIGOODT   AND OA.CODIGOEMPLEADO=:CODIGOEMPLEADO)');
   qDatos.DataSource:=dsEmpleadoAuxilio;
   qDatos.ExecSQL;
   qdatos.free;}

  if  qEmpleadosAuxilio.RecordCount< 5 then QRSysData3.Visible:= false;

  SummaryBand1.ForceNewPage:=  SiguientePagina(qEmpleadosAuxilio.RecordCount);
  {if qEmpleadosAuxilio.RecordCount in [5,6,13,14,22,23,31,32,40,41,49,50,58,59,67,68,76,77,86] then
    SummaryBand1.ForceNewPage:= True
  else
    SummaryBand1.ForceNewPage:=false;}

  qrlFechaInicio.Caption:=FormatDateTime('dddddd',Now);
end;

function TfQRAuxilioIndividual.SiguientePagina (valor : Integer) : Boolean;
begin
  Result:= False;
  if valor in [5,6,13,14] then
    Result:= True
  else
    begin
      if (valor > 14) and (((valor - 13) mod 9 = 0) or ((valor - 14) mod 9 = 0)) then
        Result:= True;
    end;
end;

procedure TfQRAuxilioIndividual.qrlDesayunoPrint(sender: TObject; var Value: String);
begin
  if qEmpleadosAuxilioCantidadDesayuno.AsInteger>0 then
    Value:='X'
  else
    Value:=' ';
end;

procedure TfQRAuxilioIndividual.qrlAlmuerzoPrint(sender: TObject; var Value: String);
begin
  if qEmpleadosAuxilioCantidadAlmuerzo.AsInteger>0 then
    Value:='X'
  else
    Value:=' ';
end;

procedure TfQRAuxilioIndividual.qrlComidaPrint(sender: TObject; var Value: String);
begin
  if qEmpleadosAuxilioCantidadComida.AsInteger>0 then
    Value:='X'
  else
    Value:=' ';
end;

procedure TfQRAuxilioIndividual.qrdbDiaDesdeDesayunoPrint(sender: TObject;
  var Value: String);
begin
  if not (qEmpleadosAuxilioCantidadDesayuno.AsInteger>0 )then
    Value:=' ';
end;

procedure TfQRAuxilioIndividual.qrdbDiaDesdeAlmuerzoPrint(sender: TObject;
  var Value: String);
begin
  if not (qEmpleadosAuxilioCantidadAlmuerzo.AsInteger>0 )then
    Value:=' ';
end;

procedure TfQRAuxilioIndividual.qrdbDiaDesdeComidaPrint(sender: TObject;
  var Value: String);
begin
  if not (qEmpleadosAuxilioCantidadComida.AsInteger>0 )then
    Value:=' ';
end;

procedure TfQRAuxilioIndividual.qrdbValorDesayunoPrint(sender: TObject;
  var Value: String);
begin
  if Value='$' then Value:=' ';
end;

procedure TfQRAuxilioIndividual.qEmpleadosAuxilioCalcFields(DataSet: TDataSet);
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
  qEmpleadosAuxilioCODIGOODTLETRA.AsString:=  qEmpleadosAuxilioCODIGOODT.AsString +'-B';
end;

procedure TfQRAuxilioIndividual.FormCreate(Sender: TObject);
var ruta:string;
qconsulta:tquery;
begin
  //dblinkOW := '@migr_mat_ow';
  dblinkOW := DBLINKDEPENDENCIAS ;
  qConsulta:= TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qconsulta.sql.text:= 'select upper(user||''@''||SYS_CONTEXT (''USERENV'', ''db_name'')) as usuario, sysdate from dual';
  qconsulta.open;
  qrlusuariobd.Caption:= qconsulta.FieldByName('usuario').asstring;
  qrlusuariobd2.Caption:= qconsulta.FieldByName('usuario').asstring;

  QRLFechaimpresion.Caption:= fodtpadre.qOdtFECHAFINAL.asstring;

  qconsulta.close;
  qconsulta.sql.text:= 'select compania from v0006e'+dblinkOW+' where codigo_centro_respon =  '''+ fodtpadre.qODTCODIGOADMINISTRATIVO.AsString+'''';
  qconsulta.open;
  QRLCompania.Caption:= qconsulta.FieldByName('compania').asstring;

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

procedure TfQRAuxilioIndividual.qrlCodigoBarraPrint(sender: TObject;
  var Value: String);
begin
  value:='*'+floattostr(numeroimpresion)+'*';
//  value:='';
end;

procedure TfQRAuxilioIndividual.qrlNumeroImpresionPrint(sender: TObject;
  var Value: String);
begin
  value:=floattostr(numeroimpresion);
//  value:='';
end;

procedure TfQRAuxilioIndividual.qImputacionesCalcFields(DataSet: TDataSet);
begin
If  qImputacionesTIPO.asstring = 'DESAYUNOS' THEN
  qImputaciones.FieldByName('valorunitario').asfloat:= qValorDesayunoVALORAUXILIOALIMENTACION.asfloat;
If  qImputacionesTIPO.asstring = 'ALMUERZOS' THEN
  qImputaciones.FieldByName('valorunitario').asfloat:= qValorAlmuerzoVALORAUXILIOALIMENTACION.ASFLOAT;
If  qImputacionesTIPO.asstring = 'COMIDAS' THEN
  qImputaciones.FieldByName('valorunitario').asfloat:= qValorComidaVALORAUXILIOALIMENTACION.ASFLOAT;
end;

end.
