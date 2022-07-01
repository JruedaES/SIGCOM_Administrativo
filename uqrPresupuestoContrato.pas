unit uqrPresupuestoContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, TParser, Db, DBTables, jpeg;

type
  TfqrPresupuestoContrato = class(TForm)
    QuickReport: TQuickRep;
    qContrato: TQuery;
    qContratoValorIVA2: TFloatField;
    qContratoCostoDirecto2: TFloatField;
    qContratoCostoTotal2: TFloatField;
    qContratoValorMaterial2: TFloatField;
    qContratoValorManoObra2: TFloatField;
    qContratoValorEquipo2: TFloatField;
    qContratoValorTransporte2: TFloatField;
    qContratoAIU2: TFloatField;
    qContratoCODIGOCONTRATO: TFloatField;
    qContratoSECUENCIA: TFloatField;
    qContratoANO: TStringField;
    qContratoCODIGOESTADOCONTRATO: TStringField;
    qContratoCODIGOTIPOCONTRATO: TStringField;
    qContratoCODIGOCONTRATISTA: TStringField;
    qContratoCODIGOGEOGRAFICO: TFloatField;
    qContratoOBJETO: TBlobField;
    qContratoFECHAASIGNACION: TDateTimeField;
    qContratoFECHAINICIO: TDateTimeField;
    qContratoFECHAENTREGA: TDateTimeField;
    qContratoFECHACERTIFICADO: TDateTimeField;
    qContratoFECHALIQUIDACION: TDateTimeField;
    qContratoADMINISTRACION: TFloatField;
    qContratoIMPREVISTOS: TFloatField;
    qContratoUTILIDADES: TFloatField;
    qContratoIVA: TFloatField;
    qContratoCODIGOINTERVENTOR: TFloatField;
    tEmpresaLogo: TTable;
    tEmpresaLogoCODIGOEMPRESA: TStringField;
    tEmpresaLogoCONSECUTIVO: TStringField;
    tEmpresaLogoLOGOEMPRESA: TBlobField;
    dsEmpresaLogo: TDataSource;
    DParser1: TDParser;
    TitleBand1: TQRBand;
    QRDBImage2: TQRDBImage;
    QRImage1: TQRImage;
    QRDBText15: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText16: TQRDBText;
    qlFecha: TQRLabel;
    QRShape5: TQRShape;
    QRLContratista: TQRLabel;
    QRDBTNombreContratista: TQRDBText;
    QRDBTInterventor: TQRDBText;
    QRLInterventor: TQRLabel;
    QRDBTFechaPresupuesto: TQRDBText;
    QRLFechaPresupuesto: TQRLabel;
    QRSLineaTitulo1: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLObjeto: TQRLabel;
    QRDBTObjetoContrato: TQRDBText;
    QRLabel3: TQRLabel;
    ColumnHeaderBand1: TQRBand;
    QRLabel6: TQRLabel;
    QRShape11: TQRShape;
    QRLUnidadesConstructivas: TQRLabel;
    QRLCantidadPresupuestada: TQRLabel;
    QRLCodigo: TQRLabel;
    QRLDescripcion: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape14: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape20: TQRShape;
    DetailBand1: TQRBand;
    QRShape22: TQRShape;
    QRShape24: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRDBTNombreActivida: TQRDBText;
    QRDBTCodigoActivida: TQRDBText;
    QRDBTCantidaPresupuestado: TQRDBText;
    QREValorTotalManoEquipoTransporte: TQRExpr;
    QREValorTotal: TQRExpr;
    SummaryBand1: TQRBand;
    QRLCostosDirectos: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRDBTPorcentajeAdministracion: TQRDBText;
    QRDBTPorcentajeImprevistos: TQRDBText;
    QRDBTPorcentajeUtilidades: TQRDBText;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRETotalAdministracion: TQRExpr;
    QRETotalImprevistos: TQRExpr;
    QRETotalUtilidades: TQRExpr;
    QRETotalAIU: TQRExpr;
    QRShape38: TQRShape;
    QRLabel28: TQRLabel;
    QRShape39: TQRShape;
    QRLSon: TQRLabel;
    QRDBTPorcentajeIVA: TQRDBText;
    QRETotalSubtotal1: TQRExpr;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape42: TQRShape;
    QRLabel33: TQRLabel;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRExpr3: TQRExpr;
    QRLabel1: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    qrlIvaSobre: TQRLabel;
    QRLabelNombrefirmante: TQRLabel;
    QRLabelCargoFirmante: TQRLabel;
    QRLabelCargoFirmante2: TQRLabel;
    QRLabelNombrefirmante2: TQRLabel;
    QRLabelCargoFirmante1: TQRLabel;
    QRLabelNombrefirmante1: TQRLabel;
    PageFooterBand1: TQRBand;
    qlPagina: TQRSysData;
    QRShape1: TQRShape;
    QLSGD: TQRLabel;
    QRILogoElectros: TQRImage;
    QRILogoPrograma: TQRImage;
    qEmpresa: TQuery;
    qContratoCOSTODIRECTOSINAIU: TFloatField;
    qContratoValorAIU: TFloatField;
    qCia: TQuery;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    qContratoCODIGOADMINISTRATIVO: TFloatField;
    QRLabel4: TQRLabel;
    QRDBText9: TQRDBText;
    qContratoNUMEROCONTRATO: TStringField;
    qContratoMATERIALPRESUPUESTADO: TFloatField;
    qContratoTRANSPORTEPRESUPUESTADO: TFloatField;
    qContratoEQUIPOPRESUPUESTADO: TFloatField;
    qContratoMANOOBRAPRESUPUESTADO: TFloatField;
    qContratoCODIGOPRESUPUESTO: TFloatField;
    qContratoMONTOTOTAL: TFloatField;
    qContratoREPRESENTANTECONTRATISTA: TStringField;
    qActividadContrato: TQuery;
    qActividadContratoCODIGOCONTRATO: TFloatField;
    qActividadContratoCODIGOTIPOPRESUPUESTO: TStringField;
    qActividadContratoCANTIDADPRESUPUESTADA: TFloatField;
    qActividadContratoCANTIDADEJECUTADA: TFloatField;
    qActividadContratoCODIGOCONTRATOOBRA: TFloatField;
    qActividadContratoCONSECUTIVO: TFloatField;
    qActividadContratoVALORUNITARIOMATERIAL: TFloatField;
    qActividadContratoVALORUNITARIOMANOOBRA: TFloatField;
    qActividadContratoVALORUNITARIOEQUIPO: TFloatField;
    qActividadContratoVALORUNITARIOTRANSPORTE: TFloatField;
    qActividadContratoMATERIALPRESUPUESTADO: TFloatField;
    qActividadContratoTRANSPORTEPRESUPUESTADO: TFloatField;
    qActividadContratoEQUIPOPRESUPUESTADO: TFloatField;
    qActividadContratoMANOOBRAPRESUPUESTADO: TFloatField;
    dscontrato: TDataSource;
    qActividadContratoCODIGOACTIVIDADCONTRATOOBRA: TFloatField;
    QRLabel5: TQRLabel;
    QRShape2: TQRShape;
    QRDBText10: TQRDBText;
    QRShape3: TQRShape;
    qActividadContratoNombreActividadContrato: TStringField;
    qActividadContratoMATERIALEJECUTADO: TFloatField;
    qActividadContratoTRANSPORTEEJECUTADO: TFloatField;
    qActividadContratoEQUIPOEJECUTADO: TFloatField;
    qActividadContratoMANOOBRAEJECUTADO: TFloatField;
    qContratoMATERIALEJECUTADO: TFloatField;
    qContratoMANOOBRAEJECUTADO: TFloatField;
    qContratoEQUIPOEJECUTADO: TFloatField;
    qContratoTRANSPORTEEJECUTADO: TFloatField;
    qContratoVALORMATERIALSOLICITADO: TFloatField;
    qContratoVALORMATERIALENTREGADO: TFloatField;
    qContratoVALORMATERIALCONSUMIDO: TFloatField;
    qContratoVALORMATERIALREINTEGRADO: TFloatField;
    QRShape4: TQRShape;
    QRShape41: TQRShape;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    qActividadContratoCODIGOACTIVIDAD: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickReportAfterPreview(Sender: TObject);
    procedure qContratoCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure qContratoAfterOpen(DataSet: TDataSet);
    procedure qActividadContratoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fqrPresupuestoContrato: TfqrPresupuestoContrato;

implementation

uses uContrato;

{$R *.DFM}

procedure TfqrPresupuestoContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfqrPresupuestoContrato.QuickReportAfterPreview(Sender: TObject);
begin
  Close;
end;

procedure TfqrPresupuestoContrato.qContratoCalcFields(DataSet: TDataSet);
var
  IVA,AIU,Material,ManoObra,Equipo,Transporte,Utilidades,Administracion,Imprevistos,
  ValorTotal,Suma,SumaAIU,SumaIVA:Double;
begin
  DataSet.FieldByName('AIU').AsFloat:=DataSet.FieldByName('ADMINISTRACION').AsFloat+ DataSet.FieldByName('IMPREVISTOS').ASFloat
  +DataSet.FieldByName('UTILIDADES').AsFloat;
  AIU := DataSet.FieldByName('AIU').AsFloat/100;
  IVA := DataSet.FieldByName('IVA').AsFloat/100;
  Material := qContratoMATERIALPRESUPUESTADO.AsFloat;
  ManoObra := qContratoMANOOBRAPRESUPUESTADO.ASFloat;
  Transporte :=qContratoTRANSPORTEPRESUPUESTADO.AsFloat;
  Equipo := qContratoEQUIPOPRESUPUESTADO.AsFloat;
  Utilidades := DataSet.FieldByName('UTILIDADES').AsFloat/100;
  Administracion := DataSet.FieldByName('ADMINISTRACION').AsFloat/100;
  Imprevistos := DataSet.FieldByName('IMPREVISTOS').AsFloat/100;
  Suma:= Material+ManoObra+ Transporte+ Equipo ;
  SumaAIU := Suma*AIU;
  SumaIVA:=0;
  if fcontrato.qTipoContrato.FieldByName('IVAUTILIDAD').AsString='S' then
  begin
    SumaIVA := (Suma*Utilidades)*IVA;
    qrlIvaSobre.Caption:='SOBRE UTILIDAD';
  end;
  if fcontrato.qTipoContrato.FieldByName('IVAADMINISTRACION').AsString='S' then
  begin
    if SumaIVA>0 then qrlIvaSobre.Caption:=qrlIvaSobre.Caption + ', ADMINISTRACIÓN'
    else  qrlIvaSobre.Caption:='SOBRE ADMINISTRACIÓN';
    SumaIVA := SumaIVA+(Suma*Administracion)*IVA;
  end;
  if fcontrato.qTipoContrato.FieldByName('IVAIMPREVISTOS').AsString='S' then
  begin
    if SumaIVA>0 then qrlIvaSobre.Caption:=qrlIvaSobre.Caption + 'E IMPREVISTOS'
    else  qrlIvaSobre.Caption:='SOBRE IMPREVISTOS';
    SumaIVA := SumaIVA+(Suma*Imprevistos)*IVA;
  end;
  ValorTotal := Suma +SumaAIU+SumaIVA;
  DataSet.FieldByName('ValorIVA').AsFloat := SumaIVA;
  DataSet.FieldByName('ValorAIU').AsFloat := SumaAIU;
  DataSet.FieldByName('COSTODIRECTOSINAIU').AsFloat := SUMA;
  DataSet.FieldByName('COSTODIRECTO').AsFloat := SUMA+SUMAAIU;
  DataSet.FieldByName('COSTOTOTAL').AsFloat:= ValorTotal;
  DataSet.FieldByName('ValorMaterial').AsFloat:= Material*(1+AIU);
  DataSet.FieldByName('ValorManoObra').AsFloat:= MANOOBRA*(1+AIU);
  DataSet.FieldByName('ValorEquipo').AsFloat:= EQUIPO*(1+AIU);
  DataSet.FieldByName('ValorTransporte').AsFloat:= TRANSPORTE*(1+AIU);
end;

procedure TfqrPresupuestoContrato.FormShow(Sender: TObject);
begin
  QuickReport.Preview;
end;

procedure TfqrPresupuestoContrato.qContratoAfterOpen(DataSet: TDataSet);
begin
  qActividadContrato.Close;
  qActividadContrato.Open;
end;

procedure TfqrPresupuestoContrato.qActividadContratoCalcFields(
  DataSet: TDataSet);
var qDescripcion:TQuery;
begin  
  qDescripcion:=TQuery.Create(self);
  try
    qDescripcion.DatabaseName:='BaseDato';
    qDescripcion.sql.add('SELECT tp.nombretipopresupuesto,ta.nombretipoactividad,e.nombreestructura,a.descripcion');
    qDescripcion.sql.add('FROM tipopresupuesto tp,actividad a,estructura e,tipoactividad ta,actividadcontratoobra ac');
    qDescripcion.sql.add('WHERE tp.CODIGOTIPOPRESUPUESTO=ac.codigotipopresupuesto');
    qDescripcion.sql.add('AND ac.codigoactividad=a.codigoactividad');
    qDescripcion.sql.add('AND a.codigotipoactividad=ta.codigotipoactividad');
    qDescripcion.sql.add('AND a.codigoestructura=e.codigoestructura');
    qDescripcion.sql.add('AND ac.codigoactividadcontratoobra='+qActividadContratoCODIGOACTIVIDADCONTRATOOBRA.AsString);
    qDescripcion.Open;
    if qDescripcion.Fieldbyname('Descripcion').asstring<>'' then
    begin
      qActividadContrato.FieldByName('NombreActividadContrato').AsString:= qDescripcion.Fields[0].asstring;
    end
    else
    begin
      qActividadContrato.FieldByName('NombreActividadContrato').AsString:=
      qDescripcion.FieldByName('NombreTipoPresupuesto').AsString+' '+
      qDescripcion.FieldByName('NombreTipoActividad').AsString+' DE '+
      qDescripcion.FieldByName('NombreEstructura').AsString;
    end;
  except
  end;
  qDescripcion.Free;
end;

end.
  