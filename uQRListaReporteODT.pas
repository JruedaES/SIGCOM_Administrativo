unit uQRListaReporteODT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, DBTables, Db;

type
  TfQRListaReporteODT = class(TForm)
    QuickRep: TQuickRep;
    QRBand1: TQRBand;
    qEmpresa: TQuery;
    QRDBImage1: TQRDBImage;
    qrdbNombreEmpresa: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    qrdbFechaEmision: TQRDBText;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRBand2: TQRBand;
    qReportes: TQuery;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    qReportesCODIGOREPORTE: TFloatField;
    qReportesCODIGOINFORMANTE: TStringField;
    qReportesDIRECCIONINFORMANTE: TStringField;
    qReportesNOMBREINFORMANTE: TStringField;
    qReportesNOMBREFUNCIONARIO: TStringField;
    qReportesCODIGOTIPOPREDIO: TStringField;
    qReportesDESCRIPCIONTIPOPREDIO: TStringField;
    qReportesCIGINFORMANTE: TFloatField;
    qReportesTELEFONO: TStringField;
    qReportesCIGDANO: TFloatField;
    qReportesDIRECCIONDANO: TStringField;
    qReportesCODIGOADMINISTRATIVO: TFloatField;
    qReportesCODIGOTIPOREPORTE: TStringField;
    qReportesCODIGOCLASEREPORTE: TStringField;
    qReportesCODIGOTIPODANO: TFloatField;
    qReportesCODIGOPRIORIDAD: TStringField;
    qReportesCODIGOESTADOREPORTE: TStringField;
    qReportesNUMEROCARTA: TStringField;
    qReportesCODIGOESTADOCARTA: TFloatField;
    qReportesREGISTROS: TFloatField;
    qReportesFECHAHORA: TDateTimeField;
    qReportesFECHAULTIMOREGISTRO: TDateTimeField;
    qReportesFECHAHORADICTADO: TDateTimeField;
    qReportesFECHAHORALLEGADA: TDateTimeField;
    qReportesFECHAHORAATENCION: TDateTimeField;
    qReportesX: TFloatField;
    qReportesY: TFloatField;
    qReportesORIGENREPORTE: TStringField;
    qReportesCODIGOTIPOELEMENTO: TStringField;
    qReportesCODIGOELEMENTO: TStringField;
    qReportesCODIGOSUBESTACION: TStringField;
    qReportesCODIGOCIRCUITO: TStringField;
    qReportesCODIGOTRAFODIS: TFloatField;
    qReportesCODIGOAPOYO: TFloatField;
    qReportesCODIGOCLIENTESGD: TFloatField;
    qReportesCODIGOCLIENTECOM: TFloatField;
    qReportesREPORTEPADRE: TFloatField;
    qReportesCODIGOODT: TFloatField;
    qReportesPINTADOAPOYO: TStringField;
    qReportesNOMBREINFORMANTE_1: TStringField;
    qReportesNOMBREADMINISTRATIVO: TStringField;
    qReportesNOMBRETIPOREPORTE: TStringField;
    qReportesNOMBRECLASEREPORTE: TStringField;
    qReportesNOMBRESUBESTACION: TStringField;
    qReportesCODIGOTIPODANO_1: TFloatField;
    qReportesNOMBRECIRCUITO: TStringField;
    qReportesCOLOR: TFloatField;
    qReportesNOMBREESTADOREPORTE: TStringField;
    qReportesPRIORIDADDANO: TFloatField;
    qReportesCIAINFORMANTE: TFloatField;
    qReportesNOMBREGRUPOTRABAJO: TStringField;
    qReportesNOMBRECIAINFORMANTE: TStringField;
    qReportesCODIGOTIPOVIA: TFloatField;
    qReportesCODIGONOMBREVIA: TFloatField;
    qReportesMODIFICADORVIA: TStringField;
    qReportesDUPLICADOR: TFloatField;
    qReportesMODIFICADORDUPLICADOR: TStringField;
    qReportesNUMEROPUERTA: TFloatField;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText7: TQRDBText;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape3: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText10: TQRDBText;
    qReportesDireccionCalculada: TStringField;
    QRLabel9: TQRLabel;
    QRDBText11: TQRDBText;
    qReportesNOMBRETIPODANO: TStringField;
    QRShape4: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRBand3: TQRBand;
    QRLabel12: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    qrlImpreso: TQRLabel;
    qrlImpresoInferior: TQRLabel;
    tEmpresaLogo: TTable;
    qReportesDESCRIPCION: TMemoField;
    qReportesOBSERVACION: TMemoField;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    qReportesCONSECUTIVO: TFloatField;
    qReportesImpresoHija: TStringField;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText17: TQRDBText;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    qReportesDescripcion1: TStringField;
    qReportesObservacion1: TStringField;
    procedure qReportesCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRepAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRListaReporteODT: TfQRListaReporteODT;

implementation

{$R *.DFM}

procedure TfQRListaReporteODT.qReportesCalcFields(DataSet: TDataSet);
var qDatos:TQuery;
    Direccion:string;
    s1,s2:string;
    i:Integer;
begin
  Direccion:='';
  qDatos:=TQuery.Create(Application);
  qDatos.DatabaseName:='BaseDato';
  if DataSet.FieldByName('CODIGOTIPOVIA').AsString <> '' then
  begin
    qDatos.Close;
    qDatos.SQL.Text:='SELECT ABREVIATURA FROM DIR_TIPOVIA WHERE CODIGOTIPOVIA = ' +
                     DataSet.FieldByName('CODIGOTIPOVIA').AsString;
    qDatos.Open;
    Direccion:=Direccion + qDatos.Fields[0].AsString;
  end;
  if DataSet.FieldByName('CODIGONOMBREVIA').AsString <> '' then
  begin
    qDatos.Close;
    qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                     DataSet.FieldByName('CODIGONOMBREVIA').AsString;
    qDatos.Open;
    Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
  end;
  Direccion:=Direccion + DataSet.FieldByName('MODIFICADORVIA').AsString;

  if DataSet.FieldByName('DUPLICADOR').AsString <> '' then
  begin
    qDatos.Close;
    qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                     DataSet.FieldByName('DUPLICADOR').AsString;
    qDatos.Open;
    Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
  end;
  Direccion:=Direccion + DataSet.FieldByName('MODIFICADORDUPLICADOR').AsString +
             ' ' + DataSet.FieldByName('NUMEROPUERTA').AsString;

  Direccion:=Direccion + ' ' + DataSet.FieldByName('CODIGOTIPOPREDIO').AsString + ' ' +
             DataSet.FieldByName('DESCRIPCIONTIPOPREDIO').AsString;
  DataSet.FieldByName('DIRECCIONCALCULADA').AsString:=TrimLeft(Direccion);
  qDatos.Free;

  DataSet.FieldbyName('ImpresoHija').AsString:='';
  s1:=qReportesCODIGOODT.AsString;
  s2:=qReportesCONSECUTIVO.AsString;
  //for i:=5 downto Length(qReportesCODIGOODT.AsString) do
  //  s1:='0' + s1;
  DataSet.FieldbyName('ImpresoHija').AsString:= s1+ '-'+s2;
  DataSet.FieldByName('Descripcion1').asstring:=trim(qReportesDESCRIPCION.AsString);
  DataSet.FieldByName('Observacion1').asstring:=trim(qReportesOBSERVACION.AsString);
end;

procedure TfQRListaReporteODT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfQRListaReporteODT.QuickRepAfterPreview(Sender: TObject);
begin
  Close;
end;

end.
