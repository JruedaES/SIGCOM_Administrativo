unit uQRActividadContratoLiquidado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uQRBase, Qrctrls, quickrpt, ExtCtrls, Db, DBTables, jpeg;

type
  TfQRActividadContratoLiquidado = class(TFQRBase)
    QRShape8: TQRShape;
    QRLabel3: TQRLabel;
    QRShape9: TQRShape;
    QRLabel6: TQRLabel;
    QRShape10: TQRShape;
    QRLabel7: TQRLabel;
    QRShape11: TQRShape;
    QRLabel8: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel9: TQRLabel;
    qrdbCantidad: TQRDBText;
    qCia: TQuery;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText6: TQRDBText;
    bfObra: TQRBand;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel11: TQRLabel;
    QRExpr8: TQRExpr;
    qCiaNOMBRECATEGORIA: TStringField;
    ChildBand1: TQRChildBand;
    QRLabel22: TQRLabel;
    QRShape27: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape28: TQRShape;
    QRShape30: TQRShape;
    QRLabel15: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
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
    QRExpr1: TQRExpr;
    QRLabel25: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    qrlIvaSobre: TQRLabel;
    QRShape41: TQRShape;
    QRExpr2: TQRExpr;
    QRExpr5: TQRExpr;
    QREValorTotalManoEquipoTransporte: TQRExpr;
    QREValorTotal: TQRExpr;
    qContrato: TQuery;
    qContratoValorIVA2: TFloatField;
    qContratoCOSTODIRECTOSINAIU: TFloatField;
    qContratoValorAIU: TFloatField;
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
    qContratoCODIGOADMINISTRATIVO: TFloatField;
    qContratoNUMEROCONTRATO: TStringField;
    qContratoMATERIALPRESUPUESTADO: TFloatField;
    qContratoTRANSPORTEPRESUPUESTADO: TFloatField;
    qContratoEQUIPOPRESUPUESTADO: TFloatField;
    qContratoMANOOBRAPRESUPUESTADO: TFloatField;
    qContratoCODIGOPRESUPUESTO: TFloatField;
    qContratoMONTOTOTAL: TFloatField;
    qContratoREPRESENTANTECONTRATISTA: TStringField;
    qContratoMATERIALEJECUTADO: TFloatField;
    qContratoMANOOBRAEJECUTADO: TFloatField;
    qContratoEQUIPOEJECUTADO: TFloatField;
    qContratoTRANSPORTEEJECUTADO: TFloatField;
    qContratoVALORMATERIALSOLICITADO: TFloatField;
    qContratoVALORMATERIALENTREGADO: TFloatField;
    qContratoVALORMATERIALCONSUMIDO: TFloatField;
    qContratoVALORMATERIALREINTEGRADO: TFloatField;
    qActividadContrato: TQuery;
    qActividadContratoCANTIDADLIQUIDADAACTUAL: TFloatField;
    qActividadContratoMANOOBRALIQUIDADA: TFloatField;
    qActividadContratoMATERIALLIQUIDADO: TFloatField;
    qActividadContratoEQUIPOLIQUIDADO: TFloatField;
    qActividadContratoTRANSPORTELIQUIDADO: TFloatField;
    qActividadContratoNOMBREACTIVIDADCONTRATO: TMemoField;
    qActividadContratoNOMBREGEOGRAFICO: TStringField;
    qActividadContratoNOMBREMUNICIPIO: TStringField;
    qActividadContratoINDICEDIFICULTAD: TFloatField;
    qActividadContratoCODIGOCONTRATOOBRA: TFloatField;
    qActividadContratoADMINISTRACION: TFloatField;
    qActividadContratoUTILIDADES: TFloatField;
    qActividadContratoIMPREVISTOS: TFloatField;
    qActividadContratoIVA: TFloatField;
    qActividadContratoCANTIDADEJECUTADA: TFloatField;
    qActividadContratoVALORUNITARIOEQUIPO: TFloatField;
    qActividadContratoVALORUNITARIOMANOOBRA: TFloatField;
    qActividadContratoVALORUNITARIOMATERIAL: TFloatField;
    qActividadContratoVALORUNITARIOTRANSPORTE: TFloatField;
    qActividadContratoCODIGOACTIVIDAD: TFloatField;
    procedure qlAreaFuncionalPrint(sender: TObject; var Value: String);
    procedure QuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickReportAfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qContratoCalcFields(DataSet: TDataSet);
    procedure QRSysData2Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRActividadContratoLiquidado: TfQRActividadContratoLiquidado;

implementation


{$R *.DFM}

procedure TfQRActividadContratoLiquidado.qlAreaFuncionalPrint(sender: TObject;
  var Value: String);
begin
  value:=qCia.fieldbyname('nombrecategoria').AsString;
end;

procedure TfQRActividadContratoLiquidado.QuickReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
//
end;

procedure TfQRActividadContratoLiquidado.QuickReportAfterPreview(Sender: TObject);
begin
  close;
end;

procedure TfQRActividadContratoLiquidado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure TfQRActividadContratoLiquidado.qContratoCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('AIU').AsFloat:=DataSet.FieldByName('ADMINISTRACION').AsFloat+ DataSet.FieldByName('IMPREVISTOS').ASFloat
  +DataSet.FieldByName('UTILIDADES').AsFloat;
end;

procedure TfQRActividadContratoLiquidado.QRSysData2Print(sender: TObject;
  var Value: String);
begin
  inherited;
  value:='';
end;

end.
  