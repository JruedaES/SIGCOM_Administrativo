unit uqrContratoObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Qrctrls, QuickRpt, ExtCtrls, DBTables, jpeg;

type
  TfqrContratoObra = class(TForm)
    qEmpresa: TQuery;
    tEmpresaLogo: TTable;
    tEmpresaLogoCODIGOEMPRESA: TStringField;
    tEmpresaLogoCONSECUTIVO: TStringField;
    tEmpresaLogoLOGOEMPRESA: TBlobField;
    dsEmpresaLogo: TDataSource;
    QuickReport: TQuickRep;
    TitleBand2: TQRBand;
    QRLabel1: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRImage2: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    qrlNombreContratista: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel18: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel19: TQRLabel;
    QRDBText18: TQRDBText;
    QRBand1: TQRBand;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    SummaryBand2: TQRBand;
    QRLabel6: TQRLabel;
    qrlNombreFirmante: TQRLabel;
    qrlCargoFirmante: TQRLabel;
    qrlNombreFirmante1: TQRLabel;
    qrlNombreFirmante2: TQRLabel;
    qrlNombreFirmante3: TQRLabel;
    qrlCargoFirmante1: TQRLabel;
    qrlCargoFirmante3: TQRLabel;
    qrlCargoFirmante2: TQRLabel;
    PageFooterBand2: TQRBand;
    QRSysData1: TQRSysData;
    QRShape6: TQRShape;
    QRLabel20: TQRLabel;
    QRImage3: TQRImage;
    QRImage4: TQRImage;
    qClausula: TQuery;
    qContrato: TQuery;
    qClausulaCODIGOCLAUSULACONTRATO: TFloatField;
    qClausulaCODIGOCONTRATO: TFloatField;
    qClausulaCONSECUTIVO: TFloatField;
    qClausulaTITULO: TStringField;
    qClausulaTEXTO: TBlobField;
    qClausulaEncabezado: TStringField;
    QRLabel16: TQRLabel;
    qContratoCODIGOCONTRATO: TFloatField;
    qContratoNUMEROCONTRATO: TStringField;
    qContratoCODIGOADMINISTRATIVO: TFloatField;
    qContratoCODIGOESTADOCONTRATO: TStringField;
    qContratoCODIGOTIPOCONTRATO: TStringField;
    qContratoCODIGOCONTRATISTA: TStringField;
    qContratoCODIGOINTERVENTOR: TFloatField;
    qContratoFECHAASIGNACION: TDateTimeField;
    qContratoFECHAINICIO: TDateTimeField;
    qContratoFECHAENTREGA: TDateTimeField;
    qContratoFECHACERTIFICADO: TDateTimeField;
    qContratoFECHALIQUIDACION: TDateTimeField;
    qContratoADMINISTRACION: TFloatField;
    qContratoIMPREVISTOS: TFloatField;
    qContratoUTILIDADES: TFloatField;
    qContratoIVA: TFloatField;
    qContratoMATERIALPRESUPUESTADO: TFloatField;
    qContratoTRANSPORTEPRESUPUESTADO: TFloatField;
    qContratoEQUIPOPRESUPUESTADO: TFloatField;
    qContratoMANOOBRAPRESUPUESTADO: TFloatField;
    qContratoSECUENCIA: TFloatField;
    qContratoANO: TStringField;
    qContratoCODIGOGEOGRAFICO: TFloatField;
    qContratoCODIGOPRESUPUESTO: TFloatField;
    qContratoMONTOTOTAL: TFloatField;
    qContratoMATERIALEJECUTADO: TFloatField;
    qContratoMANOOBRAEJECUTADO: TFloatField;
    qContratoEQUIPOEJECUTADO: TFloatField;
    qContratoTRANSPORTEEJECUTADO: TFloatField;
    qContratoREPRESENTANTECONTRATISTA: TStringField;
    qContratoVALORMATERIALSOLICITADO: TFloatField;
    qContratoVALORMATERIALENTREGADO: TFloatField;
    qContratoVALORMATERIALCONSUMIDO: TFloatField;
    qContratoVALORMATERIALREINTEGRADO: TFloatField;
    qContratoGARANTIA: TFloatField;
    qContratoMaterial: TFloatField;
    qContratoManoObra: TFloatField;
    qContratoTransporte: TFloatField;
    qContratoEquipo: TFloatField;
    qContratoOBJETO: TBlobField;
    qContratoValorIvaPresupuestado: TFloatField;
    qContratoCostoDirectoPresupuestado: TFloatField;
    qContratoCostoTotalPresupuestado: TFloatField;
    qContratoValorMaterialPresupuestado: TFloatField;
    qContratoValorManoObraPresupuestado: TFloatField;
    qContratoValorEquipoPresupuestado: TFloatField;
    qContratoValorTransportePresupuestado: TFloatField;
    qContratoValorAIUPresupuestado: TFloatField;
    qContratoCostoDirectoSinAIUPresupuestado: TFloatField;
    qTipoContrato: TQuery;
    qTipoContratoCODIGOTIPOCONTRATO: TStringField;
    qTipoContratoNOMBRETIPOCONTRATO: TStringField;
    qTipoContratoIVAADMINISTRACION: TStringField;
    qTipoContratoIVAIMPREVISTOS: TStringField;
    qTipoContratoIVAUTILIDAD: TStringField;
    dsContrato: TDataSource;
    qContratoIvaSobre: TStringField;
    qContratoValorIVA: TFloatField;
    qContratoCostoDirecto: TFloatField;
    qContratoCostoTotal: TFloatField;
    qContratoValorMaterial: TFloatField;
    qContratoValorManoObra: TFloatField;
    qContratoValorEquipo: TFloatField;
    qContratoValorTransporte: TFloatField;
    qContratoAIU: TFloatField;
    qContratoValorAIU: TFloatField;
    qContratoCostoDirectoSinAIU: TFloatField;
    qContratoNombreGeografico: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qClausulaCalcFields(DataSet: TDataSet);
    procedure qContratoCalcFields(DataSet: TDataSet);
    procedure QuickReportAfterPreview(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TitleBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fqrContratoObra: TfqrContratoObra;

implementation

uses  uContrato;


{$R *.DFM}

procedure TfqrContratoObra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
  inherited;
end;

procedure TfqrContratoObra.qClausulaCalcFields(DataSet: TDataSet);
begin
  qClausulaEncabezado.AsString:=inttostr(qClausulaConsecutivo.AsInteger)+'. '+ qClausulaTITULO.AsString;
end;

procedure TfqrContratoObra.qContratoCalcFields(DataSet: TDataSet);
var
  IVA,AIU,MaterialPresupuestado,ManoObraPresupuestado,EquipoPresupuestado,TransportePresupuestado,Utilidades,Administracion,Imprevistos,
  ValorTotalPresupuestado,SumaPresupuestado,SumaAIUPresupuestado,SumaIVAPresupuestado:Double;
  Material,ManoObra,Equipo,Transporte:Double;
  ValorTotal,Suma,SumaAIU,SumaIVA:Double;  
begin
  qContratoAIU.AsFloat:=qContrato.FieldByName('ADMINISTRACION').AsFloat+ qContrato.FieldByName('IMPREVISTOS').ASFloat+qContrato.FieldByName('UTILIDADES').AsFloat;
  AIU := qContratoAIU.AsFloat/100;
  IVA := qContratoIVA.AsFloat/100;
  Utilidades := qContratoUTILIDADES.AsFloat/100;
  Administracion := qContratoADMINISTRACION.AsFloat/100;
  Imprevistos := qContratoIMPREVISTOS.AsFloat/100;

  MaterialPresupuestado := qContratoMATERIALPRESUPUESTADO.AsFloat;
  ManoObraPresupuestado := qContratoMANOOBRAPresupuestado.ASFloat;
  TransportePresupuestado := qContratoTRANSPORTEPresupuestado.AsFloat;
  EquipoPresupuestado := qContratoEQUIPOPresupuestado.AsFloat;

  Material := qContratoMATERIALEJECUTADO.AsFloat;
  ManoObra := qContratoMANOOBRAEJECUTADO.ASFloat;
  Transporte := qContratoTRANSPORTEEJECUTADO.AsFloat;
  Equipo := qContratoEQUIPOEJECUTADO.AsFloat;

  SumaPresupuestado:= MaterialPresupuestado+ManoObraPresupuestado+ TransportePresupuestado+ EquipoPresupuestado ;
  SumaAIUPresupuestado := SumaPresupuestado*AIU;
  SumaIVAPresupuestado:=0;
  Suma:= Material+ManoObra+ Transporte+ Equipo ;
  SumaAIU := Suma*AIU;
  SumaIVA:=0;

  if qTipoContratoIVAUTILIDAD.AsString='S' then
  begin
    SumaIVAPresupuestado := (SumaPresupuestado*Utilidades)*IVA;
    SumaIVA := (Suma*Utilidades)*IVA;
    qContratoIvaSobre.AsString :='SOBRE UTILIDAD';
  end;
  if qTipoContratoIVAADMINISTRACION.AsString='S' then
  begin
    SumaIVAPresupuestado := SumaIVAPresupuestado+(SumaPresupuestado*Administracion)*IVA;
    SumaIVA := SumaIVA+(Suma*Administracion)*IVA;
    if qContratoIvaSobre.AsString<>'' then
      qContratoIvaSobre.AsString:=qContratoIvaSobre.AsString + ', ADMINISTRACIÓN'
    else
      qContratoIvaSobre.AsString:='SOBRE ADMINISTRACIÓN';
  end;
  if qTipoContratoIVAIMPREVISTOS.AsString='S' then
  begin
    SumaIVAPresupuestado := SumaIVAPresupuestado+(SumaPresupuestado*Imprevistos)*IVA;
    SumaIVA := SumaIVA+(Suma*Imprevistos)*IVA;
    if qContratoIvaSobre.AsString<>'' then
      qContratoIvaSobre.AsString:=qContratoIvaSobre.AsString + ', IMPREVISTOS'
    else
      qContratoIvaSobre.AsString:='SOBRE IMPREVISTOS';
  end;

  qContratoValorMaterial.AsFloat:= Material*(1+AIU);
  qContratoValorManoObra.AsFloat:= ManoObra*(1+AIU);
  qContratoValorEquipo.AsFloat:= Equipo*(1+AIU);
  qContratoValorTransporte.AsFloat:= Transporte*(1+AIU);
  qContratoValorMaterialPresupuestado.AsFloat:= MaterialPresupuestado*(1+AIU);
  qContratoValorManoObraPresupuestado.AsFloat:= ManoObraPresupuestado*(1+AIU);
  qContratoValorEquipoPresupuestado.AsFloat:= EquipoPresupuestado*(1+AIU);
  qContratoValorTransportePresupuestado.AsFloat:= TransportePresupuestado*(1+AIU);

  ValorTotal := Suma +SumaAIU+SumaIVA;
  qContratoValorIVA.AsFloat := SumaIVA;
  qContratoValorAIU.AsFloat := SumaAIU;
  qContratoCOSTODIRECTOSINAIU.AsFloat := SUMA;
  qContratoCOSTODIRECTO.AsFloat := SUMA+SUMAAIU;
  qContratoCOSTOTOTAL.AsFloat:= round(ValorTotal);

  ValorTotalPresupuestado := SumaPresupuestado +SumaAIUPresupuestado+SumaIVAPresupuestado;
  qContratoValorIvaPresupuestado.AsFloat := SumaIVAPresupuestado;
  qContratoValorAIUPresupuestado.AsFloat := SumaAIUPresupuestado;
  qContratoCostoDirectoSinAIUPresupuestado.AsFloat := SumaPresupuestado;
  qContratoCostoDirectoPresupuestado.AsFloat := SumaPresupuestado+SumaAIUPresupuestado;
  qContratoCostoTotalPresupuestado.AsFloat:= round(ValorTotalPresupuestado);

  qContratoIvaSobre.AsString:='';

end;

procedure TfqrContratoObra.QuickReportAfterPreview(Sender: TObject);
begin
  inherited;
  Beep;
  Close;
end;

procedure TfqrContratoObra.FormShow(Sender: TObject);
begin
  QuickReport.Preview;
end;

procedure TfqrContratoObra.TitleBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var h1:integer;
begin
  h1:=round(length(qContrato.fieldbyname('Objeto').AsString)/5);
  QRDBText18.Height:=h1+25;
  Sender.Height:=h1+350;
end;

procedure TfqrContratoObra.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var h1:integer;
begin
  h1:=round(length(qClausula.fieldbyname('Texto').AsString)/5);
  QRDBText20.Height:=h1;
  Sender.Height:=h1+35
end;

end.
