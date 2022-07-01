unit uQRODTPadre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, StdCtrls, ComCtrls, DBCtrls, QRPrntr,
  jpeg;

type
  TfQRODTPadre = class(TForm)
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
    qrlMoviles1: TQRLabel;
    QRLabel61: TQRLabel;
    qrlMoviles: TQRLabel;
    qrlContratista: TQRLabel;
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
    QRShape68: TQRShape;
    qFechaInicio: TQuery;
    qFechaFinal: TQuery;
    qODTPadreMEDIDAS1: TStringField;
    qODTPadreMEDIDAS2: TStringField;
    qODTPadreSIMBOLOS1: TStringField;
    qODTPadreSIMBOLOS2: TStringField;
    QRDBText28: TQRDBText;
    QRLabel55: TQRLabel;
    QRDBText29: TQRDBText;
    QRBand1: TQRBand;
    QRShape26: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape27: TQRShape;
    QRLabel2: TQRLabel;
    QRShape28: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape2: TQRShape;
    QRShape24: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape4: TQRShape;
    qODTPadreImpresoODT: TStringField;
    QRLabel5: TQRLabel;
    QRShape1: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape25: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRShape36: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape37: TQRShape;
    qrdbNombreHorario: TQRDBText;
    qODTPadreHORARIONORMALDESDE: TDateTimeField;
    qODTPadreHORARIONORMALHASTA: TDateTimeField;
    qrlDescripcionHorario: TQRLabel;
    qODTPadreCODIGOLABOR: TStringField;
    tEmpresaLogo: TTable;
    qODTPadreMOTIVOS: TMemoField;
    QRImage2: TQRImage;
    QRShape38: TQRShape;
    QRLabel26: TQRLabel;
    QRDBText4: TQRDBText;
    qODTPadreCODIGOTURNOGRUPO: TFloatField;
    qODTPadreCODIGOZONATRABAJO: TFloatField;
    qODTPadreCODIGOIMPUTACIONMATERIAL: TFloatField;
    qODTPadreSECUENCIA: TStringField;
    qODTPadreCODIGOMUNICIPIO: TFloatField;
    qODTPadreFECHAINICIO: TDateTimeField;
    qODTPadreFECHAFINAL: TDateTimeField;
    qODTPadreCODIGOAREAINFLUENCIA: TStringField;
    qODTPadreCODIGOZONAORIGEN: TFloatField;
    qODTPadreCODIGOCONTRATISTA: TStringField;
    QRLabel10: TQRLabel;
    QRShape14: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape21: TQRShape;
    QRLabel27: TQRLabel;
    qrlZonaOrigen: TQRLabel;
    QRLabel28: TQRLabel;
    qrlMunicipioTrabajo: TQRLabel;
    QRShape39: TQRShape;
    QRShape42: TQRShape;
    QRLabel30: TQRLabel;
    qrlOpSubestacion: TQRLabel;
    QRShape43: TQRShape;
    QRLabel32: TQRLabel;
    QRShape47: TQRShape;
    qrlusuariobd: TQRLabel;
    qODTPadreNOTAS: TMemoField;
    QRShape40: TQRShape;
    procedure QRDBText9Print(sender: TObject; var Value: String);
    procedure qrdbFechaAprobacionPrint(sender: TObject; var Value: String);
    procedure qrdbFechaAsignacionPrint(sender: TObject; var Value: String);
    procedure qrdbFechaInicioTrabajoPrint(sender: TObject;
      var Value: String);
    procedure qrdbFechaFinalTrabajoPrint(sender: TObject;
      var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
    procedure qODTPadreCalcFields(DataSet: TDataSet);
    procedure qrdbNombreHorarioPrint(sender: TObject; var Value: String);
    procedure qrdbHorarioHastaPrint(sender: TObject; var Value: String);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRep1AfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DescripcionHorario:String;
    liberar:boolean;
  end;

var
  fQRODTPadre: TfQRODTPadre;

implementation

{$R *.DFM}

procedure TfQRODTPadre.QRDBText9Print(sender: TObject;
  var Value: String);
begin
  if Trim(Value) = '30    12    1899      00 : 00' then
    Value:='';
end;

procedure TfQRODTPadre.qrdbFechaAprobacionPrint(sender: TObject;
  var Value: String);
begin
  if Trim(Value) = '30    12    1899' then
    Value:='';
end;

procedure TfQRODTPadre.qrdbFechaAsignacionPrint(sender: TObject;
  var Value: String);
begin
  if Trim(Value) = '30    12    1899      00 : 00' then
    Value:='';
end;

procedure TfQRODTPadre.qrdbFechaInicioTrabajoPrint(
  sender: TObject; var Value: String);
begin
  if Trim(Value) = '30    12    1899      00 : 00' then
    Value:='';
  if (Value='') and (qODTPadreFECHAINICIO.AsString<>'') then
    Value:=qODTPadreFECHAINICIO.AsString;
end;

procedure TfQRODTPadre.qrdbFechaFinalTrabajoPrint(sender: TObject;
  var Value: String);
begin
  if Trim(Value) = '30    12    1899      00 : 00' then
    Value:='';
  if (Value='') and (qODTPadreFECHAFINAL.AsString<>'') then
    Value:=qODTPadreFECHAFINAL.AsString;
end;

procedure TfQRODTPadre.QRDBText8Print(sender: TObject;
  var Value: String);
begin
  if Trim(Value) = '30    12    1899      00 : 00' then
    Value:='';
end;

procedure TfQRODTPadre.qODTPadreCalcFields(DataSet: TDataSet);
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
     if Cont < 6 then
     begin
       DataSet.FieldByName('MEDIDAS1').AsString:= DataSet.FieldByName('MEDIDAS1').AsString + Chr(13) +
                                                  GenerarNumero(qMedidasSeguridad.FieldByName('ORDEN').AsInteger) +
                                                  qMedidasSeguridad.FieldByName('NOMBREMEDIDASEGURIDAD').AsString;
       DataSet.FieldByName('SIMBOLOS1').AsString:=DataSet.FieldByName('SIMBOLOS1').AsString + Chr(13) + 'Ö';
     end
     else
     begin
       if Cont < 12 then
       begin
         DataSet.FieldByName('MEDIDAS2').AsString:=DataSet.FieldByName('MEDIDAS2').AsString + Chr(13) +
                                                   GenerarNumero(qMedidasSeguridad.FieldByName('ORDEN').AsInteger) +
                                                   qMedidasSeguridad.FieldByName('NOMBREMEDIDASEGURIDAD').AsString;
         DataSet.FieldByName('SIMBOLOS2').AsString:=DataSet.FieldByName('SIMBOLOS2').AsString + Chr(13) + 'Ö';
       end;
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
end;

procedure TfQRODTPadre.qrdbNombreHorarioPrint(sender: TObject;
  var Value: String);
begin
 if Trim(Value) = '30/12/1899  00:00' then
   Value:='';
end;

procedure TfQRODTPadre.qrdbHorarioHastaPrint(sender: TObject;
  var Value: String);
begin
  if Trim(Value) = '30/12/1899  00:00' then
    Value:='';
end;

procedure TfQRODTPadre.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var I: Integer;  
begin
  if Sender.QRPrinter.Destination =  QRPrntr.qrdPrinter then
  begin
    for I:=0 to Self.ComponentCount - 1 do
      if (Self.Components[i] is TQRShape) then
         TQRShape(Components[i]).Pen.Width := 8;
  end;       
end;

procedure TfQRODTPadre.QuickRep1AfterPreview(Sender: TObject);
begin
  Close;
end;

procedure TfQRODTPadre.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if liberar then
    Action:=caFree;
end;

procedure TfQRODTPadre.FormCreate(Sender: TObject);
var
qconsulta: tquery;
begin
    qConsulta:= TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qconsulta.sql.text:= 'select upper(user||''@''||SYS_CONTEXT (''USERENV'', ''db_name'')) as usuario from dual';
    qconsulta.open;
    qrlusuariobd.Caption:= qconsulta.FieldByName('usuario').asstring;
    qconsulta.free;
  liberar:=true;
end;

end.
