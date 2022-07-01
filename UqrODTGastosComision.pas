unit UqrODTGastosComision;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, ufuncionsgd;

type
  TFqrODTGastosComision = class(TForm)
    qrViatico: TQuickRep;
    QRBand2: TQRBand;
    QRLabel12: TQRLabel;
    QRShape124: TQRShape;
    QRDBImage2: TQRDBImage;
    QRImage1: TQRImage;
    qrlNumeroImpresion: TQRLabel;
    qrlusuariobd: TQRLabel;
    QRBand1: TQRBand;
    QRShape12: TQRShape;
    QRShape8: TQRShape;
    QRShape1: TQRShape;
    QRLabel2: TQRLabel;
    qrdbCodigoodtletra: TQRDBText;
    QRLabel8: TQRLabel;
    qrdbDependencia: TQRDBText;
    qrdbViaticoDiario: TQRDBText;
    QRLabel11: TQRLabel;
    qrdbCodigoODT: TQRDBText;
    QRLabel16: TQRLabel;
    QRShape4: TQRShape;
    QRShape3: TQRShape;
    QRShape2: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    qrdbNombreEmpleado: TQRDBText;
    qrdbCedula: TQRDBText;
    QRLabel4: TQRLabel;
    qrdbSalario: TQRDBText;
    qrlTitulo: TQRLabel;
    qDetalleVehiculo: TQuery;
    qViaticoDetalle: TQRSubDetail;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qDetalleVehiculoTIPO: TStringField;
    qDetalleVehiculoVALORIMPUTACION: TFloatField;
    tEmpresaLogo: TTable;
    tEmpresaLogoCODIGOEMPRESA: TStringField;
    tEmpresaLogoCONSECUTIVO: TStringField;
    tEmpresaLogoLOGOEMPRESA: TBlobField;
    dsEmpresaLogo: TDataSource;
    QRLabel1: TQRLabel;
    qrViaticoTiquete: TQRSubDetail;
    GroupHeaderBand1: TQRBand;
    qTiquete: TQuery;
    qTiqueteDESCRIPCION: TStringField;
    qTiqueteNUMEROTIQUETE: TStringField;
    qTiqueteVALORTIQUETE: TFloatField;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel14: TQRLabel;
    QRBand3: TQRBand;
    QRLabel15: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    qrAuxilio: TQRSubDetail;
    qAuxilio: TQuery;
    QRDBText6: TQRDBText;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    qrlDestino: TQRLabel;
    QRShape10: TQRShape;
    QRShape21: TQRShape;
    qAuxilioTIPO: TStringField;
    qAuxilioVALORIMPUTACION: TFloatField;
    QRBand6: TQRBand;
    QRLabel22: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRShape30: TQRShape;
    QRLabel28: TQRLabel;
    qrlAuxilio: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    qrlTranspporte: TQRLabel;
    qTotal: TQuery;
    qrlPasajes: TQRLabel;
    qrlTotal: TQRLabel;
    qrdbCIA: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel19: TQRLabel;
    qrdbMunicipioOrigen: TQRDBText;
    qrdbMunicipioDestino: TQRDBText;
    QRLabel9: TQRLabel;
    qrFechaFinODT: TQRLabel;
    QRLabel32: TQRLabel;
    QRLFechaimpresion: TQRLabel;
    QRLCompania: TQRLabel;
    QRBand4: TQRBand;
    QRShape9: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape39: TQRShape;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel45: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure qrViaticoAfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qDetalleVehiculoCalcFields(DataSet: TDataSet);
    procedure qrViaticoAfterPrint(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    TTransporte,TTiquete,TAuxilio:double;
    dblinkOW: String;
  end;

var
  FqrODTGastosComision: TFqrODTGastosComision;

implementation

uses uODTGastosComision, uODTPadre;

{$R *.DFM}

procedure TFqrODTGastosComision.FormCreate(Sender: TObject);
var
qconsulta:tquery;
begin
  //dblinkOW := '@migr_mat_ow';
  dblinkOW := DBLINKDEPENDENCIAS ;
  qConsulta:= TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qconsulta.sql.text:= 'select upper(user||''@''||SYS_CONTEXT (''USERENV'', ''db_name'')) as usuario, sysdate from dual';
  qconsulta.open;
  qrlusuariobd.Caption:= qconsulta.FieldByName('usuario').asstring;
  QRLFechaimpresion.Caption:= fodtgastoscomision.qOdtFECHAFINAL.asstring;

  qconsulta.close;
  qconsulta.sql.text:= 'select compania from v0006e'+dblinkOW+' where codigo_centro_respon =  '''+ fodtgastoscomision.qCia.fieldbyname('codigoadministrativo').asstring+'''';
  qconsulta.open;
  QRLCompania.Caption:= qconsulta.FieldByName('compania').asstring;

  qconsulta.free;
  TTransporte:=0;
  TTiquete:=0;
  TAuxilio:=0;
end;

procedure TFqrODTGastosComision.qrViaticoAfterPreview(
  Sender: TObject);
begin
  Close;
end;

procedure TFqrODTGastosComision.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFqrODTGastosComision.qDetalleVehiculoCalcFields(
  DataSet: TDataSet);
begin
  TTransporte:= TTransporte+Dataset.fieldbyname('VALORIMPUTACION').asFloat;
end;

procedure TFqrODTGastosComision.qrViaticoAfterPrint(Sender: TObject);
var
  qDatos:tquery;
begin
   {qDatos:=TQuery.Create(Application);
   qDatos.DatabaseName:='BaseDato';
   qDatos.SQL.Add('update odtviatico set IMPRESOGASTOS = ''S''');
   qDatos.SQL.Add('where codigoviatico = '+FODTGastosComision.qViaticoCODIGOVIATICO.AsString);
   qDatos.ExecSQL;
   qdatos.free;  }
   FodtPadre.guardarTransaccion;
   FODTGastosComision.sbImprimir.Enabled := false;
   FODTGastosComision.bbCancelar.Enabled := false;
end;

end.
