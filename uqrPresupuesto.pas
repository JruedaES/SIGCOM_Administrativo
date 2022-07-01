unit uqrPresupuesto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, TParser, Db, DBTables, jpeg;

type
  TfqrPresupuesto = class(TForm)
    qrActividad: TQuickRep;
    qPresupuesto: TQuery;
    qPresupuestoValorIVA2: TFloatField;
    qPresupuestoCostoDirecto2: TFloatField;
    qPresupuestoCostoTotal2: TFloatField;
    qPresupuestoValorMaterial2: TFloatField;
    qPresupuestoValorManoObra2: TFloatField;
    qPresupuestoValorEquipo2: TFloatField;
    qPresupuestoValorTransporte2: TFloatField;
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
    QRDBTFechaPresupuesto: TQRDBText;
    QRLFechaPresupuesto: TQRLabel;
    QRSLineaTitulo1: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLObjeto: TQRLabel;
    QRDBTObjetoContrato: TQRDBText;
    QRLabel3: TQRLabel;
    DetailBand1: TQRBand;
    QRShape22: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRDBTNombreActivida: TQRDBText;
    QRDBTCodigoActivida: TQRDBText;
    QRDBTCantidaPresupuestado: TQRDBText;
    QRDBTValorUnidadMaterial: TQRDBText;
    QREValorTotalMaterial: TQRExpr;
    QREValorUnitarioManoEquipoTranporte: TQRExpr;
    QREValorTotalManoEquipoTransporte: TQRExpr;
    QREValorTotal: TQRExpr;
    QRShRectanguloTitulo: TQRShape;
    qEmpresa: TQuery;
    qPresupuestoCOSTODIRECTOSINAIU: TFloatField;
    qPresupuestoValorAIU: TFloatField;
    qCia: TQuery;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    qTipoContrato: TQuery;
    dsPresupuesto: TDataSource;
    qPresupuestoCODIGOPRESUPUESTO: TFloatField;
    qPresupuestoNUMEROPRESUPUESTO: TStringField;
    qPresupuestoCODIGOESTADOPRESUPUESTO: TStringField;
    qPresupuestoCODIGOTIPOCONTRATO: TStringField;
    qPresupuestoOBJETO: TBlobField;
    qPresupuestoFECHAPRESUPUESTO: TDateTimeField;
    qPresupuestoFECHAASIGNACION: TDateTimeField;
    qPresupuestoADMINISTRACION: TFloatField;
    qPresupuestoIMPREVISTOS: TFloatField;
    qPresupuestoUTILIDADES: TFloatField;
    qPresupuestoIVA: TFloatField;
    qPresupuestoMATERIAL: TFloatField;
    qPresupuestoTRANSPORTE: TFloatField;
    qPresupuestoEQUIPO: TFloatField;
    qPresupuestoMANOOBRA: TFloatField;
    qPresupuestoSECUENCIA: TFloatField;
    qPresupuestoANO: TStringField;
    qPresupuestoCODIGOGEOGRAFICO: TFloatField;
    QRLabel4: TQRLabel;
    QRDBText9: TQRDBText;
    qPresupuestoIvaUtilidad: TFloatField;
    qTipoContratoCODIGOTIPOCONTRATO: TStringField;
    qTipoContratoNOMBRETIPOCONTRATO: TStringField;
    qTipoContratoIVAADMINISTRACION: TStringField;
    qTipoContratoIVAIMPREVISTOS: TStringField;
    qTipoContratoIVAUTILIDAD: TStringField;
    qrResumen: TQuickRep;
    QRBand9: TQRBand;
    QRLabel106: TQRLabel;
    QRLabel107: TQRLabel;
    QRLabel108: TQRLabel;
    QRLabel109: TQRLabel;
    QRLabel110: TQRLabel;
    QRLabel111: TQRLabel;
    QRShape96: TQRShape;
    QRLabel112: TQRLabel;
    QRLabel113: TQRLabel;
    QRLabel114: TQRLabel;
    QRLabel115: TQRLabel;
    QRLabel116: TQRLabel;
    QRShape97: TQRShape;
    QRDBText46: TQRDBText;
    QRDBText47: TQRDBText;
    QRDBText48: TQRDBText;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRExpr36: TQRExpr;
    QRExpr37: TQRExpr;
    QRExpr38: TQRExpr;
    QRExpr39: TQRExpr;
    QRExpr40: TQRExpr;
    QRExpr41: TQRExpr;
    QRExpr42: TQRExpr;
    QRExpr43: TQRExpr;
    QRExpr44: TQRExpr;
    QRExpr45: TQRExpr;
    QRExpr46: TQRExpr;
    QRExpr47: TQRExpr;
    QRExpr48: TQRExpr;
    QRExpr49: TQRExpr;
    QRExpr50: TQRExpr;
    QRExpr51: TQRExpr;
    QRExpr52: TQRExpr;
    QRExpr53: TQRExpr;
    QRExpr54: TQRExpr;
    QRExpr55: TQRExpr;
    QRShape103: TQRShape;
    QRLabel117: TQRLabel;
    QRShape104: TQRShape;
    qrlson: TQRLabel;
    QRDBText49: TQRDBText;
    QRShape105: TQRShape;
    QRExpr56: TQRExpr;
    QRExpr57: TQRExpr;
    QRExpr58: TQRExpr;
    QRExpr59: TQRExpr;
    QRExpr60: TQRExpr;
    QRLabel119: TQRLabel;
    QRLabel120: TQRLabel;
    QRShape106: TQRShape;
    QRLabel121: TQRLabel;
    QRShape107: TQRShape;
    QRShape108: TQRShape;
    QRShape109: TQRShape;
    QRShape110: TQRShape;
    QRLabel123: TQRLabel;
    QRShape111: TQRShape;
    QRDBText50: TQRDBText;
    QRDBText51: TQRDBText;
    QRDBText52: TQRDBText;
    QRDBText53: TQRDBText;
    QRExpr61: TQRExpr;
    QRLabel124: TQRLabel;
    QRLabel125: TQRLabel;
    QRLabel126: TQRLabel;
    qrlIvasobre: TQRLabel;
    qrLabelCargofirmante1: TQRLabel;
    qrLabelCargofirmante3: TQRLabel;
    qrLabelNombrefirmante3: TQRLabel;
    qrLabelCargofirmante2: TQRLabel;
    qrLabelNombrefirmante2: TQRLabel;
    QRDBText54: TQRDBText;
    QRDBText55: TQRDBText;
    QRBand10: TQRBand;
    QRSysData2: TQRSysData;
    QRShape112: TQRShape;
    QRLabel134: TQRLabel;
    QRImage6: TQRImage;
    QRImage7: TQRImage;
    qrbActitividad: TQRBand;
    QRLabel18: TQRLabel;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText6: TQRDBText;
    bfActividad: TQRBand;
    ChildBand1: TQRChildBand;
    QRShape31: TQRShape;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape32: TQRShape;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRLabel37: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel1: TQRLabel;
    QRBand12: TQRBand;
    QRExpr62: TQRExpr;
    QRLabel7: TQRLabel;
    QRShape24: TQRShape;
    qMaterialPresupuesto: TQuery;
    qPresupuestoCODIGOADMINISTRATIVO: TFloatField;
    qMaterialPresupuestoCODIGOMATERIALPRESUPUESTOOBRA: TFloatField;
    qMaterialPresupuestoCODIGOPRESUPUESTO: TFloatField;
    qMaterialPresupuestoCODIGOPRESUPUESTOOBRA: TFloatField;
    qMaterialPresupuestoCODIGOMATERIAL: TFloatField;
    qMaterialPresupuestoCANTIDADPRESUPUESTADA: TFloatField;
    qMaterialPresupuestoVALORPRESUPUESTADO: TFloatField;
    qMaterialPresupuestoCODIGOACTIVIDADPRESUPUESTOOBRA: TFloatField;
    qMaterialPresupuestoNOMBREMATERIAL: TStringField;
    qMaterialPresupuestoNOMBREUNIDAD: TStringField;
    qMaterialPresupuestoNOMBREGEOGRAFICO: TStringField;
    qMaterialPresupuestoINDICEDIFICULTAD: TFloatField;
    qActividadPresupuesto: TQuery;
    qMaterialPresupuestoCODIGOGEOGRAFICO: TFloatField;
    qPresupuestoNombreGeografico: TStringField;
    qCargo: TQuery;
    qrLabelNombrefirmante1: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    qActividadPresupuestoCODIGOACTIVIDADPRESUPUESTO: TFloatField;
    qActividadPresupuestoCODIGOACTIVIDAD: TStringField;
    qActividadPresupuestoCODIGOPRESUPUESTO: TFloatField;
    qActividadPresupuestoCODIGOPRESUPUESTOOBRA: TFloatField;
    qActividadPresupuestoCANTIDADPRESUPUESTADA: TFloatField;
    qActividadPresupuestoMATERIAL: TFloatField;
    qActividadPresupuestoTRANSPORTE: TFloatField;
    qActividadPresupuestoEQUIPO: TFloatField;
    qActividadPresupuestoMANOOBRA: TFloatField;
    qActividadPresupuestoNOMBREGEOGRAFICO: TStringField;
    qActividadPresupuestoINDICEDIFICULTAD: TFloatField;
    qActividadPresupuestoCODIGOGEOGRAFICO: TFloatField;
    qActividadPresupuestoNOMBREMUNICIPIO: TMemoField;
    qActividadPresupuestoNOMBREACTIVIDADPRESUPUESTO: TStringField;
    qPresupuestoAiu: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrActividadAfterPreview(Sender: TObject);
    procedure qPresupuestoCalcFields(DataSet: TDataSet);
    procedure qPresupuestoAfterOpen(DataSet: TDataSet);
    procedure qrbActitividadBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrbMaterialBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fqrPresupuesto: TfqrPresupuesto;

implementation


{$R *.DFM}

procedure TfqrPresupuesto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfqrPresupuesto.qrActividadAfterPreview(Sender: TObject);
begin
  close;
end;

procedure TfqrPresupuesto.qPresupuestoCalcFields(DataSet: TDataSet);
var
  IVA,AIU,Material,ManoObra,Equipo,Transporte,Utilidades,Administracion,Imprevistos,
  ValorTotal,Suma,SumaAIU,SumaIVA:Double;
  qry:Tquery;i:Integer;unidad,decimal:String;
begin
  qPresupuesto.FieldByName('AIU').AsFloat:=qPresupuesto.FieldByName('ADMINISTRACION').AsFloat+ qPresupuesto.FieldByName('IMPREVISTOS').ASFloat+qPresupuesto.FieldByName('UTILIDADES').AsFloat;
  AIU := qPresupuesto.FieldByName('AIU').AsFloat/100;
  IVA := qPresupuesto.FieldByName('IVA').AsFloat/100;
  Material := qPresupuesto.FieldByName('MATERIAL').AsFloat;
  ManoObra := qPresupuesto.FieldByName('MANOOBRA').ASFloat;
  Transporte := qPresupuesto.FieldByName('TRANSPORTE').AsFloat;
  Equipo := qPresupuesto.FieldByName('EQUIPO').AsFloat;
  Utilidades := qPresupuesto.FieldByName('UTILIDADES').AsFloat/100;
  Administracion := qPresupuesto.FieldByName('ADMINISTRACION').AsFloat/100;
  Imprevistos := qPresupuesto.FieldByName('IMPREVISTOS').AsFloat/100;
  Suma:= Material+ManoObra+ Transporte+ Equipo ;
  SumaAIU := Suma*AIU;
  SumaIVA:=0;                 
  if qTipoContrato.FieldByName('IVAUTILIDAD').AsString='S' then
  begin
    SumaIVA := (Suma*Utilidades)*IVA;
    qrlIvaSobre.Caption:='SOBRE UTILIDAD';
  end;
  if qTipoContrato.FieldByName('IVAADMINISTRACION').AsString='S' then
  begin
    if SumaIVA>0 then qrlIvaSobre.Caption:=qrlIvaSobre.Caption + ', ADMINISTRACIÓN'
    else  qrlIvaSobre.Caption:='SOBRE ADMINISTRACIÓN';
    SumaIVA := SumaIVA+(Suma*Administracion)*IVA;
  end;
  if qTipoContrato.FieldByName('IVAIMPREVISTOS').AsString='S' then
  begin
    if SumaIVA>0 then qrlIvaSobre.Caption:=qrlIvaSobre.Caption + ' E IMPREVISTOS'
    else  qrlIvaSobre.Caption:='SOBRE IMPREVISTOS';
    SumaIVA := SumaIVA+(Suma*Imprevistos)*IVA;
  end;
  ValorTotal := Suma +SumaAIU+SumaIVA;
  qPresupuesto.FieldByName('ValorIVA').AsFloat := SumaIVA;
  qPresupuesto.FieldByName('ValorAIU').AsFloat := SumaAIU;
  qPresupuesto.FieldByName('COSTODIRECTOSINAIU').AsFloat := SUMA;
  qPresupuesto.FieldByName('COSTODIRECTO').AsFloat := SUMA+SUMAAIU;
  qPresupuesto.FieldByName('COSTOTOTAL').AsFloat:= ValorTotal;
  qPresupuesto.FieldByName('ValorMaterial').AsFloat:= Material*(1+AIU);
  qPresupuesto.FieldByName('ValorManoObra').AsFloat:= MANOOBRA*(1+AIU);
  qPresupuesto.FieldByName('ValorEquipo').AsFloat:= EQUIPO*(1+AIU);
  qPresupuesto.FieldByName('ValorTransporte').AsFloat:= TRANSPORTE*(1+AIU);

  qry:=Tquery.Create(nil);
  qry.DatabaseName:='BaseDato';
  qry.Close;
  qry.SQL.Clear;
  qry.sql.Add('SELECT GETMUNICIPIO(CODIGOGEOGRAFICO)||'''+'  '+'''||NOMBRECATEGORIA AS NOMBREGEOGRAFICO ');
  qry.sql.Add('FROM GEOGRAFICO WHERE CODIGOGEOGRAFICO='+qPresupuesto.FieldByName('CodigoGeografico').AsString);
  qry.Open;
  qPresupuesto.FieldByName('NombreGeografico').AsString:=qry.FieldByName('NOMBREGEOGRAFICO').AsString;

  qcargo.Close;
  qcargo.ParamByName('CodigoPresupuesto').asString:=qPresupuesto.fieldbyname('CodigoPresupuesto').AsString;
  qcargo.Open;
  if qCargo.RecordCount>0 then
    begin
      qcargo.First;
        if qCargo.RecordCount=1 then
          begin
            QRLabelNombrefirmante1.Caption :=qCargo.fieldbyname('Nombre').AsString;
            QRLabelCargoFirmante1.Caption :=qCargo.fieldbyname('Cargo').AsString;
          end;
        if qCargo.RecordCount=2 then
          begin
            QRLabelNombrefirmante1.Caption :=qCargo.fieldbyname('Nombre').AsString;
            QRLabelCargoFirmante1.Caption :=qCargo.fieldbyname('Cargo').AsString;
            qcargo.Next;
            QRLabelNombrefirmante2.Caption :=qCargo.fieldbyname('Nombre').AsString;
            QRLabelCargoFirmante2.Caption :=qCargo.fieldbyname('Cargo').AsString;
          end;
        if qCargo.RecordCount>2 then
          begin
            QRLabelNombrefirmante1.Caption :=qCargo.fieldbyname('Nombre').AsString;
            QRLabelCargoFirmante1.Caption :=qCargo.fieldbyname('Cargo').AsString;
            qcargo.Next;
            QRLabelNombrefirmante2.Caption :=qCargo.fieldbyname('Nombre').AsString;
            QRLabelCargoFirmante2.Caption :=qCargo.fieldbyname('Cargo').AsString;
            qcargo.Next;
            QRLabelNombrefirmante3.Caption :=qCargo.fieldbyname('Nombre').AsString;
            QrLabelCargoFirmante3.Caption :=qCargo.fieldbyname('Cargo').AsString;
          end;
    end;
  qCargo.close;  

 i:=Pos('.',qPresupuesto.FieldByName('COSTOTOTAL').AsString);

 if i>0 then
   begin
     Unidad:=copy(qPresupuesto.FieldByName('COSTOTOTAL').AsString,1,i-1);
     Decimal:=Copy(qPresupuesto.FieldByName('COSTOTOTAL').AsString,i+1,2);
     DParser1.dsunidades:='Pesos';  
     DParser1.Expresion :=Unidad;
     DParser1.Execute;
     Unidad:=DParser1.DsEnLetras;
     DParser1.dsunidades:='Centavos';
     DParser1.Expresion :=Decimal;
     DParser1.Execute;
     Decimal:=DParser1.DsEnLetras;
     QRLSon.Caption := 'Son : '+ unidad+' con '+decimal;
   end
 else
   begin
     DParser1.Expresion :=qPresupuesto.FieldByName('COSTOTOTAL').AsString;
     DParser1.Execute;
     QRLSon.Caption := 'Son : '+ DParser1.DsEnLetras;
   end;

end;

procedure TfqrPresupuesto.qPresupuestoAfterOpen(DataSet: TDataSet);
begin
  qTipoContrato.Open;
  qMaterialPresupuesto.close;
  qMaterialPresupuesto.open;
  qActividadPresupuesto.close;
  qActividadPresupuesto.open;
end;

procedure TfqrPresupuesto.qrbActitividadBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if not (qActividadPresupuesto.RecordCount>0) then
    PrintBand:=false;
end;

procedure TfqrPresupuesto.qrbMaterialBeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if not (qMaterialPresupuesto.RecordCount>0) then
    PrintBand:=false;
end;

end.
 