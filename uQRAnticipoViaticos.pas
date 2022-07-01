unit uQRAnticipoViaticos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, Db, DBTables, jpeg;

type
  TFQRAnticipoViaticos = class(TForm)
    QuickRep: TQuickRep;
    tEmpresaLogo: TTable;
    tEmpresaLogoCODIGOEMPRESA: TStringField;
    tEmpresaLogoCONSECUTIVO: TStringField;
    tEmpresaLogoLOGOEMPRESA: TBlobField;
    dsEmpresaLogo: TDataSource;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    QRBand1: TQRBand;
    QRLabel2: TQRLabel;
    qrdbComision: TQRDBText;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    qrdbNombreEmpleado: TQRDBText;
    qrdbCedula: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel8: TQRLabel;
    qrdbDependencia: TQRDBText;
    QRLabel9: TQRLabel;
    qrdbViaticoDiario: TQRDBText;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel10: TQRLabel;
    qrdbMotivoViaje: TQRDBText;
    QRShape10: TQRShape;
    QRLabel11: TQRLabel;
    qrdbCodigoODT: TQRDBText;
    qrlZonaOrigen: TQRLabel;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel13: TQRLabel;
    qrdbMunicipioDestino: TQRDBText;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel14: TQRLabel;
    qrdbDias: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape19: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRLabel22: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape29: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    qrdbMunicipioDestino2: TQRDBText;
    qrdbMunicipioDestino3: TQRDBText;
    QRLabel26: TQRLabel;
    qrdbDiasPagados: TQRDBText;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRLabel30: TQRLabel;
    qrdbPlacaVehiculo: TQRDBText;
    QRShape37: TQRShape;
    QRLabel31: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRLabel32: TQRLabel;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRShape66: TQRShape;
    QRShape67: TQRShape;
    QRShape68: TQRShape;
    QRShape69: TQRShape;
    QRShape70: TQRShape;
    QRShape71: TQRShape;
    QRShape72: TQRShape;
    QRShape73: TQRShape;
    QRShape74: TQRShape;
    QRShape75: TQRShape;
    QRShape76: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    QRShape79: TQRShape;
    QRShape80: TQRShape;
    QRShape81: TQRShape;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape84: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRShape87: TQRShape;
    QRShape88: TQRShape;
    QRShape89: TQRShape;
    QRShape90: TQRShape;
    QRShape91: TQRShape;
    QRShape92: TQRShape;
    QRShape93: TQRShape;
    QRShape94: TQRShape;
    QRShape95: TQRShape;
    QRShape96: TQRShape;
    QRShape97: TQRShape;
    QRShape98: TQRShape;
    QRShape99: TQRShape;
    QRShape100: TQRShape;
    QRShape101: TQRShape;
    QRShape102: TQRShape;
    QRShape103: TQRShape;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRShape106: TQRShape;
    QRShape108: TQRShape;
    QRLabel49: TQRLabel;
    QRShape110: TQRShape;
    QRShape111: TQRShape;
    QRLabel56: TQRLabel;
    qrlAereo: TQRLabel;
    qrlTerrestre: TQRLabel;
    qrlFluvial: TQRLabel;
    qrlParqueo: TQRLabel;
    qrlPeaje: TQRLabel;
    qrlGasolina: TQRLabel;
    qrlVehiculoParticular: TQRLabel;
    qrlVehiculoOficial: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    qrlUsoPasaje: TQRLabel;
    qrlUsoVehiculo: TQRLabel;
    QRShape17: TQRShape;
    qrdbCuentaViatico: TQRDBText;
    qrdbCuentaParqueo: TQRDBText;
    qrdbCuentaPeaje: TQRDBText;
    qrdbCuentaGasolina: TQRDBText;
    qrdbCuentaPasaje: TQRDBText;
    qrdbAuxiliarViatico: TQRDBText;
    qrdbAuxiliarPasaje: TQRDBText;
    qrdbAuxiliarParqueo: TQRDBText;
    qrdbAuxiliarPeaje: TQRDBText;
    qrdbAuxiliarGasolina: TQRDBText;
    qrdbCentroCosto: TQRDBText;
    qrdbCentroCosto2: TQRDBText;
    qrdbCentroCosto3: TQRDBText;
    qrdbCentroCosto4: TQRDBText;
    qrdbCentroCosto5: TQRDBText;
    qrdbAreaResponsable: TQRDBText;
    qrdbAreaResponsable2: TQRDBText;
    qrdbAreaResponsable3: TQRDBText;
    qrdbAreaResponsable4: TQRDBText;
    qrdbAreaResponsable5: TQRDBText;
    qrdbViatico: TQRDBText;
    qrdbPasaje: TQRDBText;
    qrdbParqueo: TQRDBText;
    qrdbPeaje: TQRDBText;
    qrdbGasolina: TQRDBText;
    qrlFueraZona: TQRLabel;
    qrdbAnoInicio: TQRDBText;
    qrdbAnoFin: TQRDBText;
    qrdbMesInicio: TQRDBText;
    qrdbDiaInicio: TQRDBText;
    qrdbMesFin: TQRDBText;
    qrdbDiaFin: TQRDBText;
    qrdbNombreViatico: TQRDBText;
    qrdbNombrePasaje: TQRDBText;
    qrdbNombreParqueo: TQRDBText;
    qrdbNombrePeaje: TQRDBText;
    qrdbNombreGasolina: TQRDBText;
    qrlTotalComision: TQRLabel;
    qrlSaldoGirar: TQRLabel;
    qrdbZonaOrigen1: TQRDBText;
    qrdbZonaOrigen2: TQRDBText;
    QRShape30: TQRShape;
    QRShape38: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape45: TQRShape;
    QRShape54: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel38: TQRLabel;
    qrdbCuentaAuxilioViaje: TQRDBText;
    qrdbAuxiliarAuxilioViaje: TQRDBText;
    qrdbCentroCosto6: TQRDBText;
    qrdbAreaResponsable6: TQRDBText;
    qrdbNombreAuxilioViaje: TQRDBText;
    qrdbAuxilioViaje: TQRDBText;
    qrdbTiquetes1: TQRDBText;
    qrdbTiquetes2: TQRDBText;
    qTiquetes: TQuery;
    qTiquetesCODIGOVIATICO: TFloatField;
    qTiquetesTiquetes1: TStringField;
    qTiquetesTiquetes2: TStringField;
    QRShape18: TQRShape;
    QRLabel6: TQRLabel;
    QRShape20: TQRShape;
    QRLabel7: TQRLabel;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape61: TQRShape;
    qrdbImputacionAnticipo: TQRDBText;
    qrdbCedulaAnticipo: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape104: TQRShape;
    qrdbValorAnticipo: TQRDBText;
    qImputacionAnticipo: TQuery;
    qrdbSalario: TQRDBText;
    QRLabel29: TQRLabel;
    qrdbCedulaAnticipo1: TQRDBText;
    qlNombreEmpresa: TQRLabel;
    QRShape5: TQRShape;
    QRDBImage1: TQRDBImage;
    qrdbGerencia: TQRDBText;
    QRImage2: TQRImage;
    qrlNumeroImpresion: TQRLabel;
    qrlCodigoBarra: TQRLabel;
    QRLabel1: TQRLabel;
    qrlusuariobd: TQRLabel;
    QRShape105: TQRShape;
    QRLabel39: TQRLabel;
    qrdbMunicipioOrigen: TQRDBText;
    QRShape107: TQRShape;
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qTiquetesCalcFields(DataSet: TDataSet);
    procedure QuickRepAfterPrint(Sender: TObject);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrlCodigoBarraPrint(sender: TObject; var Value: String);
    procedure qrlNumeroImpresionPrint(sender: TObject; var Value: String);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    numeroimpresion:double;    
  end;

var
  FQRAnticipoViaticos: TFQRAnticipoViaticos;

implementation
uses uanticipoviatico, uComunesAdministrativo, uODTPadre;
{$R *.DFM}

procedure TFQRAnticipoViaticos.QuickRepAfterPreview(Sender: TObject);
begin
  Close;
end;

procedure TFQRAnticipoViaticos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFQRAnticipoViaticos.qTiquetesCalcFields(DataSet: TDataSet);
var qDatos:TQuery;
    Cont,m:Integer;
begin
   qDatos:=TQuery.Create(Application);
   qDatos.DatabaseName:='BaseDato';
   qDatos.SQL.Add('SELECT NUMEROTIQUETE FROM ODTVIATICODETALLETIQUETE');
   qDatos.SQL.Add('WHERE CODIGOVIATICO = ' + qTiquetesCODIGOVIATICO.AsString);
   qDatos.Open;
   Cont:=0;
   m:=trunc(qDatos.RecordCount/2);
   while not qDatos.Eof do
   begin
     if Cont < m then
     begin
       DataSet.FieldByName('Tiquetes1').AsString:= DataSet.FieldByName('Tiquetes1').AsString +
                                                   qDatos.FieldByName('NUMEROTIQUETE').AsString +#13;
     end
     else
     begin
       DataSet.FieldByName('Tiquetes2').AsString:= DataSet.FieldByName('Tiquetes2').AsString+
                                                   qDatos.FieldByName('NUMEROTIQUETE').AsString +#13;
     end;
     qDatos.Next;
     inc(cont)
   end;
end;

procedure TFQRAnticipoViaticos.QuickRepAfterPrint(Sender: TObject);
var
  qDatos:tquery;
begin
   qDatos:=TQuery.Create(Application);
   qDatos.DatabaseName:='BaseDato';
   qDatos.SQL.Add('update odtviatico set impresoanticipo = ''S'', numeroimpresion='+floatToStr(numeroimpresion));
   qDatos.SQL.Add('where codigoviatico = '+FAnticipoViatico.qViaticoCODIGOVIATICO.AsString);
   qDatos.ExecSQL;
   qdatos.free;
   FAnticipoViatico.sbImprimir.Enabled := false;
   FAnticipoViatico.PanelEncabezado.Enabled:=false;
   FAnticipoViatico.bbCancelar.Enabled := false;
   FAnticipoViatico.Imprimio:=true;
   FODtPadre.GuardarTransaccion;
   Application.ProcessMessages;
end;

procedure TFQRAnticipoViaticos.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var  query:tquery;
begin
  query:=TQuery.create(self);
  query.DatabaseName:='BaseDato';
  query.sql.add('select numeroimpresion,impresoanticipo from odtviatico ');
  query.sql.add('where codigoviatico='+inttostr(FAnticipoViatico.qviaticocodigoviatico.AsInteger));
  query.open;
  numeroimpresion:=query.fieldbyname('numeroimpresion').asfloat;
  if (query.fieldbyname('impresoanticipo').AsString<>'') then
    raise Exception.Create('Este reporte ya fue impreso. No se puede volver a imprimir.');
  query.free;
  if MessageDlg('Este Reporte solo se podrá imprimir una vez. Está seguro de imprimirlo?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
  begin
    raise Exception.Create('Operacion Cancelada.');
  end
  else
  begin
    numeroimpresion:=RegistrarImpresionViatico(0,FAnticipoViatico.qViaticoVALORANTICIPO.AsFloat,FAnticipoViatico.qViaticoCODIGOODT.AsFloat);
  end;
end;

procedure TFQRAnticipoViaticos.qrlCodigoBarraPrint(sender: TObject;
  var Value: String);
begin
//  value:='*'+floattostr(numeroimpresion)+'*';
  value:='';
end;

procedure TFQRAnticipoViaticos.qrlNumeroImpresionPrint(sender: TObject;
  var Value: String);
begin
//  value:=floattostr(numeroimpresion);
  value:='';
end;

procedure TFQRAnticipoViaticos.FormCreate(Sender: TObject);
var
qconsulta: tquery;
begin
    qConsulta:= TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qconsulta.sql.text:= 'select upper(user||''@''||SYS_CONTEXT (''USERENV'', ''db_name'')) as usuario from dual';
    qconsulta.open;
    qrlusuariobd.Caption:= qconsulta.FieldByName('usuario').asstring;
    qconsulta.free;
end;

end.
