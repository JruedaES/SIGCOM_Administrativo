unit uQrViaticosEstimados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, Qrctrls, QuickRpt, ExtCtrls, Db, DBTables, ufuncionsgd, StdCtrls;

type
  TFQrViaticosEstimados = class(TForm)
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
    QRLabel2: TQRLabel;
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
    QRShape6: TQRShape;
    QRLabel1: TQRLabel;
    qAreaInfluencia: TQuery;
    qAreaInfluenciaCODIGOAREAINFLUENCIA: TStringField;
    qAreaInfluenciaDESCRIPCION: TStringField;
    qrdbMunicipioDestino: TQRDBText;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
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
    qrdbValorTotal: TQRDBText;
    tEmpresaLogo: TTable;
    tEmpresaLogoCODIGOEMPRESA: TStringField;
    tEmpresaLogoCONSECUTIVO: TStringField;
    tEmpresaLogoLOGOEMPRESA: TBlobField;
    qrdbCIA: TQRDBText;
    qrdbCodigoODTLetra: TQRDBText;
    QRShape59: TQRShape;
    QRLabel6: TQRLabel;
    QRLFechaimpresion: TQRLabel;
    QRLCompania: TQRLabel;
    QRShape37: TQRShape;
    QRLabel31: TQRLabel;
    QRDBMunicipioOrigen1: TQRDBText;
    QRBand4: TQRBand;
    QRShape30: TQRShape;
    QRShape36: TQRShape;
    QRShape38: TQRShape;
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
    QRLabel29: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel45: TQRLabel;
    procedure FormCreate(Sender: TObject);
    procedure qrViaticoAfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrViaticoAfterPrint(Sender: TObject);

  private
    { Private declarations }
    impresion: boolean;
    dblinkOW: String;
  public
    { Public declarations }
  end;

var
  FQrViaticosEstimados: TFQrViaticosEstimados;

implementation

uses uViatico, uODTPadre;

{$R *.DFM}

procedure TFQrViaticosEstimados.FormCreate(Sender: TObject);
var 
qconsulta:tquery;
begin
  //dblinkOW := '@migr_mat_ow';
  dblinkOW := DBLINKDEPENDENCIAS;
  qConsulta:= TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qconsulta.sql.text:= 'select upper(user||''@''||SYS_CONTEXT (''USERENV'', ''db_name'')) as usuario, sysdate from dual';
  qconsulta.open;
  qrlusuariobd.Caption:= qconsulta.FieldByName('usuario').asstring;

  QRLFechaimpresion.Caption:=  fviatico.qodtFechainicio.asstring ;

  qconsulta.close;
  qconsulta.sql.text:= 'select compania from v0006e'+dblinkOW+' where codigo_centro_respon = '''+ fviatico.qCia.fieldbyname('codigoadministrativo').asstring+'''';
  qconsulta.open;
  QRLCompania.Caption:= qconsulta.FieldByName('compania').asstring;

  qconsulta.free;
end;

procedure TFQrViaticosEstimados.qrViaticoAfterPreview(Sender: TObject);
begin
  //
end;

procedure TFQrViaticosEstimados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin 
  If impresion = true then
    FodtPadre.guardarTransaccion;
end;

procedure TFQrViaticosEstimados.qrViaticoAfterPrint(Sender: TObject);
begin
  impresion:= true;
  Close;
end;

end.



