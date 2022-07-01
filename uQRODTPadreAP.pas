unit uQRODTPadreAP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, ExtCtrls,Db, DBCtrls, DBTables, Registry, uFuncionSgd,
  StdCtrls, printers;
type
  TfQRODTPadreAP = class(TForm)
    QuickRep1: TQuickRep;
    qODTPadre: TQuery;
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
    dsODTHija: TDataSource;
    qDireccion: TQuery;
    qCIG: TQuery;
    qSubestacion: TQuery;
    qTipoElemento: TQuery;
    tEmpresaLogo: TTable;
    qEmpresa: TQuery;
    qFechaInicio: TQuery;
    qFechaFinal: TQuery;
    qODTPadreMEDIDAS1: TStringField;
    qODTPadreMEDIDAS2: TStringField;
    qODTPadreSIMBOLOS1: TStringField;
    qODTPadreSIMBOLOS2: TStringField;
    QRBand1: TQRBand;
    QRShape26: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape27: TQRShape;
    QRLabel2: TQRLabel;
    QRShape28: TQRShape;
    qODTPadreImpresoODT: TStringField;
    QRShape25: TQRShape;
    QRLabel21: TQRLabel;
    QRBand2: TQRBand;
    QRLabel62: TQRLabel;
    QRLabel54: TQRLabel;
    qrdbMotivos: TQRDBText;
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
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    qrlDesenergizado: TQRLabel;
    QRLabel65: TQRLabel;
    qrlLabor: TQRLabel;
    QRLabel66: TQRLabel;
    qrlTarea: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    qrdbFechaAprobacion: TQRDBText;
    qrdbFechaAsignacion: TQRDBText;
    qrdbFechaInicioTrabajo: TQRDBText;
    qrdbFechaFinalTrabajo: TQRDBText;
    qrlTipoManoObra: TQRLabel;
    QRDBText28: TQRDBText;
    QRLabel55: TQRLabel;
    QRDBText29: TQRDBText;
    QRLabel4: TQRLabel;
    qrlGrupoTrabajo: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    qODTPadreHORARIONORMALDESDE: TDateTimeField;
    qODTPadreHORARIONORMALHASTA: TDateTimeField;
    qODTPadreCODIGOTURNOGRUPO: TFloatField;
    qODTPadreCODIGOZONATRABAJO: TFloatField;
    qODTPadreCODIGOIMPUTACIONMATERIAL: TFloatField;
    qODTPadreSECUENCIA: TStringField;
    PageHeaderBand1: TQRBand;
    QLSGD: TQRLabel;
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
    QRDBText1: TQRDBText;
    qrlAprobado: TQRLabel;
    QRDBText2: TQRDBText;
    qrlRevisado: TQRLabel;
    QRDBText3: TQRDBText;
    qrlEjecutado: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    qODTLaborDetalle: TQuery;
    qODTLaborDetalleCODIGOODTLABORDETALLE: TFloatField;
    qODTLaborDetalleCODIGOODT: TFloatField;
    qODTLaborDetalleCODIGOLABORDETALLE: TFloatField;
    qODTLaborDetalleESTADO: TFloatField;
    qODTLaborDetalleNOMBRELABORDETALLE: TStringField;
    QRDBText12: TQRDBText;
    qODTPadreLABORDETALLE: TStringField;
    qODTPadreLABORDETALLECHECK: TStringField;
    QRDBText13: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRShape2: TQRShape;
    QRShape13: TQRShape;
    qODTPadreCODIGOLABOR: TStringField;
    QRLabel26: TQRLabel;
    QRShape58: TQRShape;
    qODTPadreFECHAINICIO: TDateTimeField;
    qODTPadreFECHAFINAL: TDateTimeField;
    QRShape68: TQRShape;
    QRShape74: TQRShape;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRShape75: TQRShape;
    qrlAdministrativo: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape21: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape14: TQRShape;
    QRShape22: TQRShape;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRLabel83: TQRLabel;
    QRShape23: TQRShape;
    QRShape33: TQRShape;
    QRShape24: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText16: TQRDBText;
    qrlAprobado2: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel72: TQRLabel;
    QRDBText17: TQRDBText;
    qrlEjecutado2: TQRLabel;
    QRLabel84: TQRLabel;
    QRLabel85: TQRLabel;
    QRShape29: TQRShape;
    qODTPadreLABORDETALLE2: TStringField;
    qODTPadreLABORDETALLECHECK2: TStringField;
    qODTPadreMOTIVOS: TMemoField;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRLabel94: TQRLabel;
    QRShape53: TQRShape;
    QRLabel95: TQRLabel;
    QRLabel96: TQRLabel;
    QRLabel97: TQRLabel;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRLabel23: TQRLabel;
    qrlZona: TQRLabel;
    QRLabel25: TQRLabel;
    qrlMunicipio: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRImage2: TQRImage;
    qODTPadreNOTAS: TMemoField;
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure qrdbFechaAprobacionPrint(sender: TObject; var Value: String);
    procedure qrdbFechaAsignacionPrint(sender: TObject; var Value: String);
    procedure qrdbFechaInicioTrabajoPrint(sender: TObject;
      var Value: String);
    procedure qrdbFechaFinalTrabajoPrint(sender: TObject;
      var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure qODTPadreCalcFields(DataSet: TDataSet);
    procedure QuickRep1AfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRLabelPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRODTPadreAP: TfQRODTPadreAP;

implementation
uses uODTPadre;

{$R *.DFM}

procedure TfQRODTPadreAP.QRDBText9Print(sender: TObject;
  var Value: String);
begin
    if Trim(Value) = '30    12    1899      00 : 00' then
      Value:='';
end;

procedure TfQRODTPadreAP.qrdbFechaAprobacionPrint(sender: TObject;
  var Value: String);
begin
    if Trim(Value) = '30    12    1899' then
      Value:='';
end;

procedure TfQRODTPadreAP.qrdbFechaAsignacionPrint(sender: TObject;
  var Value: String);
begin
    if Trim(Value) = '30    12    1899' then
      Value:='';
end;

procedure TfQRODTPadreAP.qrdbFechaInicioTrabajoPrint(
  sender: TObject; var Value: String);
begin
   if Trim(Value) = '30    12    1899      00 : 00' then
      Value:='';
end;

procedure TfQRODTPadreAP.qrdbFechaFinalTrabajoPrint(sender: TObject;
  var Value: String);
begin
   if Trim(Value) = '30    12    1899      00 : 00' then
      Value:='';
end;

procedure TfQRODTPadreAP.QRDBText8Print(sender: TObject;
  var Value: String);
begin
   if Trim(Value) = '30    12    1899      00 : 00' then
      Value:='';
end;

procedure TfQRODTPadreAP.qODTPadreCalcFields(DataSet: TDataSet);
function GenerarNumero(Numero:Integer):string;
begin
  Result:=IntToStr(Numero) + ' ';
  if Numero < 10 then
    Result:= '0' + IntToStr(Numero) + ' ';
end;
var qMedidasSeguridad:TQuery;
    I,Cont,MaxCadena,Encontrado:Integer;
    s1,s2:string;
    Direccion:string;
    checked:string;
begin
   qMedidasSeguridad:=TQuery.Create(Application);
   qMedidasSeguridad.DatabaseName:='BaseDato';
   qMedidasSeguridad.SQL.Add('SELECT M.ORDEN, M.NOMBREMEDIDASEGURIDAD, LENGTH(M.NOMBREMEDIDASEGURIDAD) FROM');
   qMedidasSeguridad.SQL.Add('MEDIDASEGURIDAD M');
   qMedidasSeguridad.SQL.Add('WHERE M.CODIGOADMINISTRATIVO = ' + qODTPadreCODIGOADMINISTRATIVO.AsString);
   qMedidasSeguridad.SQL.Add('ORDER BY ORDEN');
   qMedidasSeguridad.Open;
   Cont:=0;
   while not qMedidasSeguridad.Eof do
   begin
     if Cont < 4 then
     begin
       DataSet.FieldByName('MEDIDAS1').AsString:= DataSet.FieldByName('MEDIDAS1').AsString + Chr(13) +
                                                  GenerarNumero(qMedidasSeguridad.FieldByName('ORDEN').AsInteger) +
                                                  qMedidasSeguridad.FieldByName('NOMBREMEDIDASEGURIDAD').AsString;
       DataSet.FieldByName('SIMBOLOS1').AsString:=DataSet.FieldByName('SIMBOLOS1').AsString + Chr(13) + 'Ö';
     end
     else
     begin
       DataSet.FieldByName('MEDIDAS2').AsString:=DataSet.FieldByName('MEDIDAS2').AsString + Chr(13) +
                                                 GenerarNumero(qMedidasSeguridad.FieldByName('ORDEN').AsInteger) +
                                                 qMedidasSeguridad.FieldByName('NOMBREMEDIDASEGURIDAD').AsString;
       DataSet.FieldByName('SIMBOLOS2').AsString:=DataSet.FieldByName('SIMBOLOS2').AsString + Chr(13) + 'Ö';
     end;
     Inc(Cont);
     qMedidasSeguridad.Next;
   end;
   qMedidasSeguridad.Free;

   DataSet.FieldbyName('ImpresoODT').AsString:='';
   s1:=qODTPadreCODIGOODT.AsString;
   s2:='';
   for i:=5 downto Length(s1) do
    s2:='0' + s2;
   DataSet.FieldbyName('ImpresoODT').AsString:=s2 + s1 + '-0';

   qODTLaborDetalle.Close;
   qODTLaborDetalle.Open;
   cont:=0;
   while not qODTLaborDetalle.Eof do
   begin
     checked:='____';
     if Cont < 5 then
     begin
       if qODTLaborDetalle.FieldByName('ESTADO').AsString='1' then checked:='  Ö   ';
       DataSet.FieldByName('LABORDETALLE').AsString:= DataSet.FieldByName('LABORDETALLE').AsString + Chr(13) +
                                                  qODTLaborDetalle.FieldByName('NOMBRELABORDETALLE').AsString;
       DataSet.FieldByName('LABORDETALLECHECK').AsString:= DataSet.FieldByName('LABORDETALLECHECK').AsString + Chr(13) + checked;
     end
     else
     begin
       if qODTLaborDetalle.FieldByName('ESTADO').AsString='1' then checked:='  Ö   ';
       DataSet.FieldByName('LABORDETALLE2').AsString:= DataSet.FieldByName('LABORDETALLE2').AsString + Chr(13) +
                                                  qODTLaborDetalle.FieldByName('NOMBRELABORDETALLE').AsString;
       DataSet.FieldByName('LABORDETALLECHECK2').AsString:= DataSet.FieldByName('LABORDETALLECHECK2').AsString + Chr(13) + checked;
     end;
     inc(cont);
     qODTLaborDetalle.Next;
   end;
end;

procedure TfQRODTPadreAP.QuickRep1AfterPreview(Sender: TObject);
begin
  close;
end;

procedure TfQRODTPadreAP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=CaFree;
end;

procedure TfQRODTPadreAP.QRLabelPrint(sender: TObject; var Value: String);
begin
  if value='0' then value:=' ';
end;

end.
