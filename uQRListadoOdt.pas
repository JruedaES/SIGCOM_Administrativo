unit uQRListadoODT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, DBTables, Db;

type
  TFQRListadoODT = class(TForm)
    QuickRep: TQuickRep;
    BandaTitulo: TQRBand;
    QRDBImage1: TQRDBImage;
    qrdbNombreEmpresa: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel50: TQRLabel;
    QRShape5: TQRShape;
    qrlProyectoEnergis: TQRLabel;
    qrsDatosFiltro: TQRShape;
    qrmRotulos1: TQRMemo;
    qrsFiltrodatos: TQRShape;
    qrlFiltroDatos: TQRLabel;
    qrmDatos1: TQRMemo;
    qrmPuntos1: TQRMemo;
    qrmRotulos2: TQRMemo;
    qrmPuntos2: TQRMemo;
    qrmDatos2: TQRMemo;
    qrTitulo: TQRLabel;
    qEmpresa: TQuery;
    qrbDetalle: TQRBand;
    qrdbCodigoOdt: TQRDBText;
    qrdbCodigoAdministrativo: TQRDBText;
    qrdbCodigoRevisado: TQRDBText;
    qrdbNombreLabor: TQRDBText;
    qrdbCodigoAprobado: TQRDBText;
    qrdbFechaEmision: TQRDBText;
    qrdbCodigoEjecutor: TQRDBText;
    qrdbFechaAsignacion: TQRDBText;
    qrdbFechaAprobacion: TQRDBText;
    qrdbNombreTipoTarea: TQRDBText;
    qrdbNombrePrioridad: TQRDBText;
    qrdbCodigoEstadoODT: TQRDBText;
    qODTDia: TQuery;
    qODTDiaCODIGOODT: TFloatField;
    qODTDiaCONSECUTIVO: TFloatField;
    qODTDiaIMPRESOODT: TStringField;
    qODTDiaCODIGOREPORTE: TFloatField;
    qODTDiaNOMBREGRUPOTRABAJO: TStringField;
    qODTDiaCOSTOMATERIAL: TFloatField;
    qODTDiaCOSTOMANOOBRA: TFloatField;
    qODTDiaCOSTOTRANSPORTE: TFloatField;
    qODTDiaCOSTOEQUIPO: TFloatField;
    qODTDiaFECHAINICIOTRABAJO: TDateTimeField;
    qODTDiaFECHAFINALTRABAJO: TDateTimeField;
    qODTDiaCODIGOADMINISTRATIVO: TFloatField;
    dsODT: TDataSource;
    BandaFooterSubDetalle: TQRChildBand;
    QRSubDetail1: TQRSubDetail;
    qrdbConsecutivo: TQRDBText;
    qrdbCodigoReporte: TQRDBText;
    qrdbNombreGrupoTrabajo: TQRDBText;
    qrdbObservacion1: TQRDBText;
    qrdbObservacion2: TQRDBText;
    BandaHeaderSubDetalle: TQRChildBand;
    qrlConsecutivo: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    ShapeFondoSubDetalle: TQRShape;
    ChildBand1: TQRChildBand;
    SeparadorSubdetalle: TQRChildBand;
    qDir_Reporte: TQuery;
    qCIG: TQuery;
    dsODTDia: TDataSource;
    qODTDiaCODIGOGEOGRAFICO: TFloatField;
    QRLabel1: TQRLabel;
    qrdbDireccion: TQRDBText;
    qCIGGEOGRAFICO: TStringField;
    qODTDiaCODIGOTIPOVIA: TFloatField;
    qODTDiaCODIGONOMBREVIA: TFloatField;
    qODTDiaMODIFICADORVIA: TStringField;
    qODTDiaDUPLICADOR: TFloatField;
    qODTDiaMODIFICADORDUPLICADOR: TStringField;
    qODTDiaNUMEROPUERTA: TFloatField;
    qODTDiaCODIGOTIPOPREDIO: TStringField;
    qODTDiaDESCRIPCIONTIPOPREDIO: TStringField;
    qODTDiaDireccionCalculada: TStringField;
    qNombresEmpleados: TQuery;
    qNombresEmpleadosNOMBREAPROBADO: TStringField;
    qNombresEmpleadosNOMBREEJECUTADO: TStringField;
    qNombresEmpleadosNOMBREREVISADO: TStringField;
    qrlFechaInicio: TQRLabel;
    qrlFechaFinal: TQRLabel;
    qrdbFechaInicio: TQRDBText;
    qrdbFechaFinal: TQRDBText;
    BandaEncabezadoDetalle: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape14: TQRShape;
    QRLabel4: TQRLabel;
    QRShape15: TQRShape;
    QRLabel9: TQRLabel;
    QRShape16: TQRShape;
    QRLabel10: TQRLabel;
    QRShape17: TQRShape;
    QRLabel11: TQRLabel;
    QRShape18: TQRShape;
    QRLabel12: TQRLabel;
    QRShape19: TQRShape;
    QRLabel13: TQRLabel;
    QRShape20: TQRShape;
    QRLabel14: TQRLabel;
    QRShape21: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape22: TQRShape;
    QRLabel17: TQRLabel;
    QRShape23: TQRShape;
    tEmpresaLogo: TTable;
    qDir_ReporteDIRECCION: TMemoField;
    qODTDiaOBSERVACION1: TMemoField;
    qODTDiaOBSERVACION2: TMemoField;
    qODTDiaOBSERVACION3: TStringField;
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrdbHoraFinPrint(sender: TObject; var Value: String);
    procedure qODTDiaCalcFields(DataSet: TDataSet);
    procedure qrdbFechaEmisionPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
    ListaRotulos, ListaDatos : TStringList;
  end;

var
  FQRListadoODT: TFQRListadoODT;

implementation


{$R *.DFM}

procedure TFQRListadoODT.QuickRepAfterPreview(Sender: TObject);
begin
  try
    Close;
  except
    Close;
    Application.ProcessMessages;
  end;
end;

procedure TFQRListadoODT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Beep;
end;

procedure TFQRListadoODT.FormShow(Sender: TObject);
begin
  qODTDia.Close;
  qODTDia.Open;
  QuickRep.Preview;
end;

procedure TFQRListadoODT.FormCreate(Sender: TObject);
begin
  ListaRotulos := TStringList.Create;
  ListaDatos := TStringList.Create;
end;

procedure TFQRListadoODT.FormDestroy(Sender: TObject);
begin
  ListaRotulos.Free;
  ListaDatos.Free;
end;

procedure TFQRListadoODT.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var i, n, m, alto : integer;
    Cadena :string;
begin
  if ListaDatos.Count > 0 then
  begin
     BandaTitulo.Height := 110;

     qrmRotulos1.Enabled := True;
     qrmRotulos2.Enabled := True;

     qrmDatos1.Enabled := True;
     qrmDatos2.Enabled := True;

     qrmPuntos1.Enabled := True;
     qrmPuntos2.Enabled := True;

     qrsDatosFiltro.Enabled := True;
     qrlFiltroDatos.Enabled := True;
     qrsFiltroDatos.Enabled := True;

     qrmRotulos1.Lines.Clear;
     qrmRotulos2.Lines.Clear;
     qrmDatos1.Lines.Clear;
     qrmDatos2.Lines.Clear;
     qrmPuntos1.Lines.Clear;
     qrmPuntos2.Lines.Clear;

     n := (ListaDatos.Count div 2);
     m := (ListaDatos.Count mod 2);
     for i:=0 to n+m-1 do
     begin
       qrmRotulos1.Lines.Add(ListaRotulos[i]);
       Cadena := ListaDatos[i];
       Delete(Cadena,1,Pos('=',Cadena));
       qrmDatos1.Lines.Add(Cadena);
       qrmPuntos1.Lines.Add(':');
     end;
     for i:=n+m to ListaDatos.Count-1 do
     begin
       qrmRotulos2.Lines.Add(ListaRotulos[i]);
       Cadena := ListaDatos[i];
       Delete(Cadena,1,Pos('=',Cadena));
       qrmDatos2.Lines.Add(Cadena);
       qrmPuntos2.Lines.Add(':');
     end;
     Alto := 15;
     qrmRotulos1.Height := Alto*(n+m);
     qrmRotulos2.Height := Alto*(n+m);
     qrmDatos1.Height := Alto*(n+m);
     qrmDatos2.Height := Alto*(n+m);
     qrmPuntos1.Height := Alto*(n+m);
     qrmPuntos2.Height := Alto*(n+m);
     qrsDatosFiltro.Height := Alto*(n+m)+Alto;
     BandaTitulo.Height := BandaTitulo.Height+Alto*(n+m)+5;
  end;
end;

procedure TFQRListadoODT.qrdbHoraFinPrint(sender: TObject;
  var Value: String);
begin
  if Value = '30/12/1899 00:00:00' then
    Value := '';
end;

procedure TFQRListadoODT.qODTDiaCalcFields(DataSet: TDataSet);
var qDatos:TQuery;
    Direccion:string;
begin
  Direccion:='';
  qDatos:=TQuery.Create(Application);
  try
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
    DataSet.FieldByName('DIRECCIONCALCULADA').AsString:=qCIGGEOGRAFICO.AsString + ' ' + TrimLeft(Direccion);
  finally
    qDatos.Free;
  end;
end;

procedure TFQRListadoODT.qrdbFechaEmisionPrint(sender: TObject;
  var Value: String);
begin
  if Value = '30/12/1899' then
    Value := '';
end;

end.
 