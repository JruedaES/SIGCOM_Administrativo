unit uQRLiquidObra2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uQRBase, Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, TParser, jpeg;

type
  TfQRLiquidObra2 = class(TFQRBase)
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText5: TQRDBText;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRDBText6: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText10: TQRDBText;
    QRShape14: TQRShape;
    QRLabel12: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel74: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabelAdmon: TQRLabel;
    QRLabeImprev: TQRLabel;
    QRLabelUtil: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLSon: TQRLabel;
    QRLabelTotalEquipo: TQRLabel;
    QRLabelTotalTransporte: TQRLabel;
    QRLabelTotalMO: TQRLabel;
    QRLabelTotalMaterial: TQRLabel;
    QRLabelTotal: TQRLabel;
    QRLMasiva: TQRLabel;
    QRLGrantotal: TQRLabel;
    QRLabelTotalMayor: TQRLabel;
    QRLabel92: TQRLabel;
    QRLabelSumEquipoAIU: TQRLabel;
    QRLabelSumTransporteAIU: TQRLabel;
    QRLabelSumMOAIU: TQRLabel;
    QRLabelSumMaterialAIU: TQRLabel;
    QRLabelSumAIU: TQRLabel;
    QRShape20: TQRShape;
    QRLabel98: TQRLabel;
    QRLabelIVA: TQRLabel;
    QRLabelTexto: TQRLabel;
    QRLabelValorIVA: TQRLabel;
    QRLabelValidez: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabelNombrefirmante: TQRLabel;
    QRLabelCargoFirmante: TQRLabel;
    QRLabelNombrefirmante1: TQRLabel;
    QRLabelNombrefirmante2: TQRLabel;
    QRLabelNombrefirmante3: TQRLabel;
    QRLabelCargoFirmante1: TQRLabel;
    QRLabelCargoFirmante3: TQRLabel;
    QRLabelCargoFirmante2: TQRLabel;
    QRShape17: TQRShape;
    QRLabelSumEquipo: TQRLabel;
    QRLabelSumTransporte: TQRLabel;
    QRLabelSumMO: TQRLabel;
    QRLabelSumMaterial: TQRLabel;
    QRLabelTotalSinAIU: TQRLabel;
    QRLabelSumEquipoAdmon: TQRLabel;
    QRLabelSumEquipoImprev: TQRLabel;
    QRLabelSumEquipoUtilid: TQRLabel;
    QRLabelSumTransporteAdmon: TQRLabel;
    QRLabelSumTrasnporteImprev: TQRLabel;
    QRLabelSumTransporteUtilid: TQRLabel;
    QRLabelSumMOAdmon: TQRLabel;
    QRLabelSumMOImprev: TQRLabel;
    QRLabelSumMOUtilid: TQRLabel;
    QRLabelSumMaterialAdmon: TQRLabel;
    QRLabelSumMaterialImprev: TQRLabel;
    QRLabelSumMaterialUtilid: TQRLabel;
    QRLabelTotalAdmon: TQRLabel;
    QRLabelTotalImprev: TQRLabel;
    QRLabelTotalUtilid: TQRLabel;
    QRLabelTotalLetras: TQRLabel;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRLabel80: TQRLabel;
    QRShape32: TQRShape;
    QRShape30: TQRShape;
    QRShape29: TQRShape;
    QRShape25: TQRShape;
    QRShape24: TQRShape;
    QRShape23: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRShape26: TQRShape;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRShape28: TQRShape;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRShape27: TQRShape;
    QRLabel68: TQRLabel;
    QRLabelGranTotal: TQRLabel;
    QRShape39: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRShape40: TQRShape;
    QRLabel35: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr10: TQRExpr;
    QRLabelTotalIva: TQRLabel;
    QRLabel25: TQRLabel;
    DParser: TDParser;
    procedure QuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRLiquidObra2: TfQRLiquidObra2;
  FactorDificultad: String;
  Dificultad:Double;
  ValorIndice:String;
  ValAdmon:String;
  ValImprevistos:String;
  ValUtilidades:String;
  EsRetenedor:String;
  ValorIVA:String;
  CODIGOCONTRATO:STRING;


implementation

uses uContrato;

{$R *.DFM}

procedure TfQRLiquidObra2.QuickReportBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
 Suma1,Suma2,Suma3,Suma4,Suma5,Suma6,Suma7,Suma8,Suma9,Suma10,Suma11:Real;
  Suma12,Suma13:Real;
  SumEquipo,SumaAdmonEquipo,SumaAdmonTransporte,SumaAdmonMO:Real;
  SumaAdmonMaterial,SumaImprevEquipo,SumaImprevTransporte,SumaImprevMO,SumaImprevMaterial:Real;
  SumaUtilidEquipo,SumaUtilidTransporte,SumaUtilidMO,SumaUtilidMaterial:Real;
  TotalAdmon,TotalImprev,TotalUtilid,TotalAIUEquipo,TotalAIUTransporte:Real;
  TotalAIUMO,TotalAIUMaterial,SumaTotalAIU,TotalEquipo,TotalTransporte,TotalMO,TotalMaterial:Real;
  SumTransporte,TotalIVA,GranTotal,TotalSinIVA:Real;
  SumMO,SumaAIU:Real;
  SumMaterial:Real;
  i:integer;
begin
  SumEquipo:=0;
  SumTransporte:=0;
  SumMO:=0;
  SumMaterial:=0;
  totaliva:=0;

  CODIGOCONTRATO := FContrato.qContrato.fieldbyName('CODIGOCONTRATO').asstring;
  ValorIndice :=FormatFloat('0.00',FContrato.qGeografico.FieldByName('IndiceDificultad').AsFloat);
  if FContrato.qContratista.Locate('CodigoContratista',FContrato.qContrato.FieldByName('CodigoContratista').AsString,[loCaseInsensitive])
  then EsRetenedor:=FContrato.qContratista.FieldByName('RETENEDORIVA').AsString;

  FContrato.qActividadContrato.Open;
  FContrato.qActividadContrato.First;
  while Not FContrato.qActividadContrato.Eof do
  begin
   SumEquipo:=SumEquipo + (FContrato.qActividadContrato.FieldByName('EQUIPOLIQUIDADO').AsFloat*
    FContrato.qActividadContrato.FieldByName('CANTIDADEJECUTADA').AsFloat*FContrato.FactorDificultad);
   SumTransporte:=SumTransporte + (FContrato.qActividadContrato.FieldByName('TRANSPORTELIQUIDADO').AsFloat*
    FContrato.qActividadContrato.FieldByName('CANTIDADEJECUTADA').AsFloat*FContrato.FactorDificultad);
   SumMO:=SumMO + (FContrato.qActividadContrato.FieldByName('MANOOBRALIQUIDADA').AsFloat*
    FContrato.qActividadContrato.FieldByName('CANTIDADEJECUTADA').AsFloat*FContrato.FactorDificultad);
   SumMaterial:=SumMaterial + (FContrato.qActividadContrato.FieldByName('MATERIALLIQUIDADO').AsFloat*
    FContrato.qActividadContrato.FieldByName('CANTIDADEJECUTADA').AsFloat);
   FContrato.qActividadContrato.Next;
  end;
  Suma1:=SumEquipo+SumTransporte+SumMO+SumMaterial;
  QRLabelSumEquipo.Caption:=FormatFloat('''$'' #,##0.00',SumEquipo);
  QRLabelSumTransporte.Caption:=FormatFloat('''$'' #,##0.00',SumTransporte);
  QRLabelSumMO.Caption:=FormatFloat('''$'' #,##0.00',SumMO);
  QRLabelSumMaterial.Caption:=FormatFloat('''$'' #,##0.00',SumMaterial);
  QRLabelTotalSinAIU.Caption:=FormatFloat('''$'' #,##0.00',Suma1);
  SumaAdmonEquipo:=SumEquipo*FContrato.qContrato.FieldByName('Administracion').AsFloat/100;
  QRLabelSumEquipoAdmon.Caption:=FormatFloat('''$'' #,##0.00',SumaAdmonEquipo);
  SumaAdmonTransporte:=SumTransporte*FContrato.qContrato.FieldByName('Administracion').AsFloat/100;
  QRLabelSumTransporteAdmon.Caption:=FormatFloat('''$'' #,##0.00',SumaAdmonTransporte);
  SumaAdmonMO:=SumMO*FContrato.qContrato.FieldByName('Administracion').AsFloat/100;
  QRLabelSumMOAdmon.Caption:=FormatFloat('''$'' #,##0.00',SumaAdmonMO);
  SumaAdmonMaterial:=SumMaterial*FContrato.qContrato.FieldByName('Administracion').AsFloat/100;
  QRLabelSumMaterialAdmon.Caption:=FormatFloat('''$'' #,##0.00',SumaAdmonMaterial);
  SumaImprevEquipo:=SumEquipo*FContrato.qContrato.FieldByName('Imprevistos').AsFloat/100;
  QRLabelSumEquipoImprev.Caption:=FormatFloat('''$'' #,##0.00',SumaImprevEquipo);
  SumaImprevTransporte:=SumTransporte*FContrato.qContrato.FieldByName('Imprevistos').AsFloat/100;
  QRLabelSumTrasnporteImprev.Caption:=FormatFloat('''$'' #,##0.00',SumaImprevTransporte);
  SumaImprevMO:=SumMO*FContrato.qContrato.FieldByName('Imprevistos').AsFloat/100;
  QRLabelSumMOImprev.Caption:=FormatFloat('''$'' #,##0.00',SumaImprevMO);
  SumaImprevMaterial:=SumMaterial*FContrato.qContrato.FieldByName('Imprevistos').AsFloat/100;
  QRLabelSumMaterialImprev.Caption:=FormatFloat('''$'' #,##0.00',SumaImprevMaterial);
  SumaUtilidEquipo:=SumEquipo*FContrato.qContrato.FieldByName('Utilidades').AsFloat/100;
  QRLabelSumEquipoUtilid.Caption:=FormatFloat('''$'' #,##0.00',SumaUtilidEquipo);
  SumaUtilidTransporte:=SumTransporte*FContrato.qContrato.FieldByName('Utilidades').AsFloat/100;
  QRLabelSumTransporteUtilid.Caption:=FormatFloat('''$'' #,##0.00',SumaUtilidTransporte);
  SumaUtilidMO:=SumMO*FContrato.qContrato.FieldByName('Utilidades').AsFloat/100;
  QRLabelSumMOUtilid.Caption:=FormatFloat('''$'' #,##0.00',SumaUtilidMO);
  SumaUtilidMaterial:=SumMaterial*FContrato.qContrato.FieldByName('Utilidades').AsFloat/100;
  QRLabelSumMaterialUtilid.Caption:=FormatFloat('''$'' #,##0.00',SumaUtilidMaterial);
  TotalAdmon:=Suma1*FContrato.qContrato.FieldByName('Administracion').AsFloat/100;
  QRLabelTotalAdmon.Caption:=FormatFloat('''$'' #,##0.00',TotalAdmon);
  TotalImprev:=Suma1*FContrato.qContrato.FieldByName('Imprevistos').AsFloat/100;
  QRLabelTotalImprev.Caption:=FormatFloat('''$'' #,##0.00',TotalImprev);
  TotalUtilid:=Suma1*FContrato.qContrato.FieldByName('Utilidades').AsFloat/100;
  QRLabelTotalUtilid.Caption:=FormatFloat('''$'' #,##0.00',TotalUtilid);
  TotalAIUEquipo:=SumaAdmonEquipo+SumaImprevEquipo+SumaUtilidEquipo;
  TotalAIUTransporte:=SumaAdmonTransporte+SumaImprevTransporte+SumaUtilidTransporte;
  TotalAIUMO:=SumaAdmonMO+SumaImprevMO+SumaUtilidMO;
  TotalAIUMaterial:=SumaAdmonMaterial+SumaImprevMaterial+SumaUtilidMaterial;
  QRLabelSumEquipoAIU.Caption:=FormatFloat('''$'' #,##0.00',TotalAIUEquipo);
  QRLabelSumTransporteAIU.Caption:=FormatFloat('''$'' #,##0.00',TotalAIUTransporte);
  QRLabelSumMOAIU.Caption:=FormatFloat('''$'' #,##0.00',TotalAIUMO);
  QRLabelSumMaterialAIU.Caption:=FormatFloat('''$'' #,##0.00',TotalAIUMaterial);
  SumaTotalAIU:=TotalAIUEquipo+TotalAIUTransporte+TotalAIUMO+TotalAIUMaterial;
  QRLabelSumAIU.Caption:=FormatFloat('''$'' #,##0.00',SumaTotalAIU);
  TotalEquipo:=SumEquipo+TotalAIUEquipo;
  TotalTransporte:=SumTransporte+TotalAIUTransporte;
  TotalMO:=SumMO+TotalAIUMO;
  TotalMaterial:=SumMaterial+TotalAIUMaterial;
  QRLabelTotalEquipo.Caption:=FormatFloat('''$'' #,##0.00',TotalEquipo);
  QRLabelTotalTransporte.Caption:=FormatFloat('''$'' #,##0.00',TotalTransporte);
  QRLabelTotalMO.Caption:=FormatFloat('''$'' #,##0.00',TotalMO);
  QRLabelTotalMaterial.Caption:=FormatFloat('''$'' #,##0.00',TotalMaterial);
  TotalSinIVA:=TotalEquipo+TotalTransporte+TotalMO+TotalMaterial;
  QRLabelTotal.Caption:=FormatFloat('''$'' #,##0.00',TotalSinIVA);
  QRLabelNombreFirmante.Caption:= FContrato.NombreFirmante[0];
  QRLabelCargoFirmante.Caption:=FContrato.CargoFirmante[0];
  QRLabelNombreFirmante1.Caption:=FContrato.NombreFirmante[1];
  QRLabelCargoFirmante1.Caption:=FContrato.CargoFirmante[1];
  QRLabelNombreFirmante2.Caption:=FContrato.NombreFirmante[2];
  QRLabelCargoFirmante2.Caption:=FContrato.CargoFirmante[2];
  QRLabelNombreFirmante3.Caption:=FContrato.NombreFirmante[3];
  QRLabelCargoFirmante3.Caption:=FContrato.CargoFirmante[3];
//  NoPagina.Caption:=NumeroPagina;
  QRLabel40.Caption:=ValorIndice;
  QRLabel78.Caption:='NOTA: FACTOR '+ ValorIndice + ' se aplica sobre valores unitarios pagados en ' + FContrato.qGeografico.fieldbyname('NombreGeografico').AsString +  ' para Equipos, Transporte y Mano de Obra';
  QRLabel80.Enabled:=False;
  QRLabelAdmon.Caption:=FContrato.qContrato.fieldByName('ADMINISTRACION').AsString;
  QRLabeImprev.Caption:=FContrato.qContrato.fieldByName('IMPREVISTOS').AsString;
  QRLabelUtil.Caption:=FContrato.qContrato.fieldByName('UTILIDADES').AsString;
  If EsRetenedor<>'S' then
   Begin
//    QRLabel84.Caption:='Son';
    QRLabel80.Enabled:=True;
    QRLabel80.Caption:='';
    QRLMasiva.Enabled:=False;
    QRLabelIVA.Enabled:=False;
    QRLabelTexto.Enabled:=False;
    QRLabelValorIVA.Enabled:=False;
//    QRSLineaIva.Enabled:=False;
//    QRLabel.Top:=320;
    QRLabelTotalMayor.Caption :=FormatFloat('''$'' #,##0.00',TotalSinIVA);
    Dparser.Expresion:=Floattostr(TotalSinIVA);
    Dparser.Execute;
    QRLabelTotalLetras.Caption:=Dparser.dsEnLetras;
   End
 else
    begin
      QRLMasiva.Enabled:=True;
      QRLabelIVA.Enabled:=True;
      QRLabelTexto.Enabled:=True;
      QRLabelValorIVA.Enabled:=True;
      QRLabelIVA.Caption := ValorIVA;
      i:=0;
      if fcontrato.qTipoContrato.FieldByName('IVAUTILIDAD').AsString='S' then
      begin
        TotalIVA := TotalUtilid*FContrato.qcontrato.fieldbyname('IVA').asfloat/100;
        QRLabelTexto.Caption:='SOBRE UTILIDAD';
        inc(i);
      end;
      if fcontrato.qTipoContrato.FieldByName('IVAADMINISTRACION').AsString='S' then
      begin
        TotalIVA := TotalIVA+ TotalAdmon*FContrato.qcontrato.fieldbyname('IVA').asfloat/100;
        if i>0 then
          QRLabelTexto.Caption:=QRLabelTexto.Caption+', ADMINISTRACION'
        else
          QRLabelTexto.Caption:=QRLabelTexto.Caption+'SOBRE ADMINISTRACION';
        inc(i);
      end;
      if fcontrato.qTipoContrato.FieldByName('IVAIMPREVISTOS').AsString='S' then
      begin
        TotalIVA := TotalIVA+ TotalImprev*FContrato.qcontrato.fieldbyname('IVA').asfloat/100;
        if i>0 then
          QRLabelTexto.Caption:=QRLabelTexto.Caption+'E IMPREVISTOS'
        else
          QRLabelTexto.Caption:=QRLabelTexto.Caption+'SOBRE IMPREVISTOS';
      end;

      QRLabelValorIva.Caption :=FormatFloat('''$'' #,##0.00',TotalIVA);
      GranTotal:=TotalIVA+TotalSinIVA;
      QRLabelTotalMayor.Caption :=FormatFloat('''$'' #,##0.00',GranTotal);
      Dparser.Expresion:=Floattostr(GranTotal);
      Dparser.Execute;
      QRLabelTotalLetras.Caption:=Dparser.dsEnLetras;
    end;
end;

procedure TfQRLiquidObra2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FContrato.qContrato.LOCATE('CODIGOCONTRATO',CODIGOCONTRATO,[]);
  inherited;
end;

end.
