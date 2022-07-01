unit UqrViaticoConciliacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, jpeg, QuickRpt, ExtCtrls, Db, DBTables, ufuncionsgd;

type
  TFqrViaticoConciliacion = class(TForm)
    tEmpresaLogo: TTable;
    tEmpresaLogoCODIGOEMPRESA: TStringField;
    tEmpresaLogoCONSECUTIVO: TStringField;
    tEmpresaLogoLOGOEMPRESA: TBlobField;
    qrViatico: TQuickRep;
    PageHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    qlNombreEmpresa: TQRLabel;
    QRShape5: TQRShape;
    QRDBImage1: TQRDBImage;
    QRImage2: TQRImage;
    qrlNumeroImpresion: TQRLabel;
    qrlusuariobd: TQRLabel;
    QRBand1: TQRBand;
    QRShape11: TQRShape;
    QRShape7: TQRShape;
    QRShape6: TQRShape;
    QRShape123: TQRShape;
    QRShape9: TQRShape;
    QRShape31: TQRShape;
    QRShape29: TQRShape;
    QRShape34: TQRShape;
    QRShape33: TQRShape;
    QRShape32: TQRShape;
    QRShape28: TQRShape;
    QRShape27: TQRShape;
    QRShape24: TQRShape;
    QRShape23: TQRShape;
    QRShape22: TQRShape;
    QRShape21: TQRShape;
    QRShape19: TQRShape;
    QRShape14: TQRShape;
    QRShape10: TQRShape;
    QRShape8: TQRShape;
    QRShape1: TQRShape;
    qrlCuentaCobro: TQRLabel;
    qrdbcodigoodtLetra: TQRDBText;
    QRLabel8: TQRLabel;
    qrdbDependencia: TQRDBText;
    QRLabel9: TQRLabel;
    qrdbViaticoDiario: TQRDBText;
    QRLabel10: TQRLabel;
    qrdbMotivoViaje: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRShape26: TQRShape;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    qrdbMunicipioDestino2: TQRDBText;
    qrdbMunicipioDestino3: TQRDBText;
    QRLabel26: TQRLabel;
    qrdbDiasPagados: TQRDBText;
    qrdbAnoInicio: TQRDBText;
    qrdbAnoFin: TQRDBText;
    qrdbMesInicio: TQRDBText;
    qrdbDiaInicio: TQRDBText;
    qrdbMesFin: TQRDBText;
    qrdbDiaFin: TQRDBText;
    qrdbZonaOrigen1: TQRDBText;
    qrdbZonaOrigen2: TQRDBText;
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
    qrdbTipoUbicacion: TQRDBText;
    QRLabel11: TQRLabel;
    qrdbCodigoODT: TQRDBText;
    QRLabel1: TQRLabel;
    qrdbMunicipioDestino: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel12: TQRLabel;
    qrdbMunicipioOrigen: TQRDBText;
    QRShape13: TQRShape;
    QRLabel13: TQRLabel;
    QRShape12: TQRShape;
    QRLabel14: TQRLabel;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRLabel15: TQRLabel;
    QRShape20: TQRShape;
    QRShape25: TQRShape;
    QRShape35: TQRShape;
    QRLabel17: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel27: TQRLabel;
    qrdbDias: TQRDBText;
    qrdbValorUnitario: TQRDBText;
    qAreaInfluencia: TQuery;
    qAreaInfluenciaCODIGOAREAINFLUENCIA: TStringField;
    qAreaInfluenciaDESCRIPCION: TStringField;
    QRLabel31: TQRLabel;
    QRLabel40: TQRLabel;
    qrdbZonaOrigen3: TQRDBText;
    qrdbMunicipioDestino5: TQRDBText;
    qrdbMunicipioDestino4: TQRDBText;
    qrdbZonaOrigen4: TQRDBText;
    QRLabel32: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel33: TQRLabel;
    qrdbAnoInicioE: TQRDBText;
    qrdbAnoFinE: TQRDBText;
    qrdbMesFinE: TQRDBText;
    qrdbMesInicioE: TQRDBText;
    QRLabel34: TQRLabel;
    QRLabel36: TQRLabel;
    qrdbDiaInicioE: TQRDBText;
    qrdbDiaFinE: TQRDBText;
    qrdbDiasPagadosE: TQRDBText;
    QRLabel37: TQRLabel;
    QRShape37: TQRShape;
    QRLabel6: TQRLabel;
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
    QRShape57: TQRShape;
    QRLabel41: TQRLabel;
    qrdbDiasDiferencia: TQRDBText;
    QRLabel42: TQRLabel;
    QRShape58: TQRShape;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    qrdbValorConciliacion: TQRDBText;
    qrdValorAConciliar: TQRDBText;
    qrdbCIA: TQRDBText;
    QRLabel2: TQRLabel;
    QRLFechaimpresion: TQRLabel;
    QRShape59: TQRShape;
    QRLCompania: TQRLabel;
    QRBand4: TQRBand;
    QRShape30: TQRShape;
    QRShape36: TQRShape;
    QRShape38: TQRShape;
    QRShape41: TQRShape;
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
    QRLabel29: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel45: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrViaticoAfterPreview(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qrViaticoAfterPrint(Sender: TObject);
  private
    { Private declarations }
    dblinkOW: String;
  public
    { Public declarations }
  end;

var
  FqrViaticoConciliacion: TFqrViaticoConciliacion;

implementation

uses uViaticoConciliacion, uODTPadre, uViatico;

{$R *.DFM}

procedure TFqrViaticoConciliacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFqrViaticoConciliacion.qrViaticoAfterPreview(Sender: TObject);
begin
  Close;
end;

procedure TFqrViaticoConciliacion.FormCreate(Sender: TObject);
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
  QRLFechaimpresion.Caption:= fviaticoconciliacion.qOdtFECHAFINAL.asstring;

  qconsulta.close;
  qconsulta.sql.text:= 'select compania from v0006e'+dblinkOW+' where codigo_centro_respon = '''+ fviaticoconciliacion.qCia.fieldbyname('codigoadministrativo').asstring+'''';
  qconsulta.open;
  QRLCompania.Caption:= qconsulta.FieldByName('compania').asstring;

  qconsulta.free;
end;

procedure TFqrViaticoConciliacion.qrViaticoAfterPrint(Sender: TObject);
var
  qDatos:tquery;
begin
   {qDatos:=TQuery.Create(Application);
   qDatos.DatabaseName:='BaseDato';
   qDatos.SQL.Add('update odtviatico set IMPRESOCONCILIACION = ''S''');
   qDatos.SQL.Add('where codigoviatico = '+FViaticoConciliacion.qViaticoCODIGOVIATICO.AsString);
   qDatos.ExecSQL;
   qdatos.free;}
   FodtPadre.guardarTransaccion;
   FViaticoConciliacion.sbImprimir.Enabled := false;
   FViaticoConciliacion.bbCancelar.Enabled := false;
end;

end.
