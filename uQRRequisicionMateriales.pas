unit uQRRequisicionMateriales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, DBTables, Qrctrls, Db, jpeg;

  
type
  TfQRRequisicionMateriales = class(TForm)
    qrRequisicionMateriales: TQuickRep;
    QRBand1: TQRBand;
    tEmpresaLogo: TTable;
    tEmpresaLogoCODIGOEMPRESA: TStringField;
    tEmpresaLogoCONSECUTIVO: TStringField;
    tEmpresaLogoLOGOEMPRESA: TBlobField;
    dsEmpresaLogo: TDataSource;
    qCOM_M_REQUISICION: TQuery;
    qCOM_M_RESERVA_INVENTARIO: TQuery;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    qrNoOdt: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText23: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText26: TQRDBText;
    QRDBText27: TQRDBText;
    QRDBText28: TQRDBText;
    QRDBText29: TQRDBText;
    QRDBText30: TQRDBText;
    QRDBText31: TQRDBText;
    QRBand2: TQRBand;
    qreTotalReservada: TQRExpr;
    QRLabel21: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape6: TQRShape;
    QRLabel25: TQRLabel;
    QRShape5: TQRShape;
    QRLabel26: TQRLabel;
    QRShape7: TQRShape;
    QRLabel29: TQRLabel;
    qReserva: TQuery;
    QRShape8: TQRShape;
    QRExpr3: TQRExpr;
    qReservaCIAS_CIAS: TFloatField;
    qReservaCOD_ALMACEN_INVEN: TStringField;
    qReservaALMACEN_DESCRI: TStringField;
    qReservaCIAS_DESCRI: TStringField;
    qALMACEN: TQuery;
    qALMACENCOD_ALMACEN_INVEN: TStringField;
    qALMACENALMACEN_DESCRI: TStringField;
    qrContrato: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel35: TQRLabel;
    QRDBText34: TQRDBText;
    QRDBText35: TQRDBText;
    qrNitContratista: TQRLabel;
    QRDBText32: TQRDBText;
    QRDBText4: TQRDBText;
    qActivo: TQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    qrCodigoActivo: TQRLabel;
    qrNombreActivo: TQRLabel;
    QRBand4: TQRBand;
    qlPagina: TQRSysData;
    QRSysData1: TQRSysData;
    QRLabel20: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText33: TQRDBText;
    qCOM_M_REQUISICIONCIAS_CIAS: TFloatField;
    qCOM_M_REQUISICIONCIAS_DESCRI: TStringField;
    qCOM_M_REQUISICIONNEGO_NEGO: TStringField;
    qCOM_M_REQUISICIONCECO_CECO_EJE: TStringField;
    qCOM_M_REQUISICIONNEGO_DESCRI: TStringField;
    qCOM_M_REQUISICIONAREA_AREA: TStringField;
    qCOM_M_REQUISICIONAREA_DESCRI: TStringField;
    qCOM_M_REQUISICIONAUXI_DESCRI: TMemoField;
    qCOM_M_REQUISICIONAUXI_DESCRI_1: TMemoField;
    qCOM_M_REQUISICIONAUXI_NIT: TFloatField;
    qCOM_M_REQUISICIONCIAS_CIAS_EJE: TFloatField;
    qCOM_M_REQUISICIONCIAS_DESCRI_1: TStringField;
    qCOM_M_REQUISICIONNEGO_NEGO_EJE: TStringField;
    qCOM_M_REQUISICIONNEGO_DESCRI_1: TStringField;
    qCOM_M_REQUISICIONAREA_AREA_EJE: TStringField;
    qCOM_M_REQUISICIONAREA_DESCRI_1: TStringField;
    qCOM_M_REQUISICIONMOTIVO: TMemoField;
    qCOM_M_REQUISICIONNUMERO_ODM: TStringField;
    qCOM_M_REQUISICIONCECO_DESCRI: TStringField;
    qCOM_M_REQUISICIONFECHA: TStringField;
    qCOM_M_REQUISICIONFECHAORIG: TDateTimeField;
    qCOM_M_REQUISICIONFECHA_AUTO_JEFE: TDateTimeField;
    qContratista: TQuery;
    qContratistaCODIGOCONTRATISTA: TStringField;
    qContratistaNOMBRECONTRATISTA: TStringField;
    TitleBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    qrdbNombreEmpresa: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBText36: TQRDBText;
    QRLabel50: TQRLabel;
    QRShape4: TQRShape;
    qrsDatosFiltro: TQRShape;
    qrmRotulos1: TQRMemo;
    qrsFiltrodatos: TQRShape;
    qrlFiltroDatos: TQRLabel;
    qrmDatos1: TQRMemo;
    qrmPuntos1: TQRMemo;
    qrmRotulos2: TQRMemo;
    qrmPuntos2: TQRMemo;
    qrmDatos2: TQRMemo;
    qEmpresa: TQuery;
    qEmpresaNOMBREEMPRESA: TStringField;
    qEmpresaNITEMPRESA: TStringField;
    qrRequisicion: TQRLabel;
    qrlCodigoODt: TQRLabel;
    QRImage2: TQRImage;
    QRLabel34: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel27: TQRLabel;
    qrlNombreGrupTrabajo: TQRLabel;
    qrlCodigoGrupTrabajo: TQRLabel;
    QRLlabelmovimiento: TQRLabel;
    qrlMovimiento: TQRLabel;
    QRDBText22: TQRDBText;
    qCOM_M_REQUISICIONAUTORIZA_JEFESN: TStringField;
    QRLabel33: TQRLabel;
    qReservaTIPO_CUENTA: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrRequisicionMaterialesAfterPreview(Sender: TObject);
    procedure qCOM_M_RESERVA_INVENTARIOBeforeOpen(DataSet: TDataSet);
    procedure qCOM_M_REQUISICIONBeforeOpen(DataSet: TDataSet);
    procedure qALMACENBeforeOpen(DataSet: TDataSet);
    procedure qReservaBeforeOpen(DataSet: TDataSet);
    procedure qActivoBeforeOpen(DataSet: TDataSet);
    procedure qCOM_M_REQUISICIONCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codigoodt,consecutivo:string;
  end;

var
  fQRRequisicionMateriales: TfQRRequisicionMateriales;

implementation

uses  uIntervencion,ufuncionsgd, uConsultaAuditoria,uInformacionOdtHija;

{$R *.DFM}

procedure TfQRRequisicionMateriales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fInformacionOdtHija.close;
  tEmpresaLogo.Close;
  qEmpresa.Close;
  Action := caFree;
end;

procedure TfQRRequisicionMateriales.qrRequisicionMaterialesAfterPreview(
  Sender: TObject);
begin
  close;
  beep;
end;

procedure TfQRRequisicionMateriales.qCOM_M_RESERVA_INVENTARIOBeforeOpen(
  DataSet: TDataSet);
begin
qCOM_M_RESERVA_INVENTARIO.sql.text:= 'SELECT DISTINCT R.RENGLON, R.COD_CATALOGO, SUBSTR(C.CATALOGO_DESCRI,0,40) AS CATALOGO_DESCRI, RM.ACLARACIONES, '+
                                     ' C.COD_UNIDAD_INVENTARIO, '+
                                     ' R.COD_BODEGA_INVEN, B.BODEGA_DESCRI, '+
                                     ' R.CANTIDAD_RESERVADA, '+
                                     ' R.CANTIDAD_ENTREGADA '+
                                     ' FROM '+EsquemaAlmacen+'COM_M_RESERVA_INVENTARIO'+ DBLink+' R, '+
                                     ' '+EsquemaAlmacen+'COM_M_REQUISICION_MOVI'+ DBLink+' RM, '+
                                     ' '+EsquemaAlmacen+'COM_S_CATALOGO'+ DBLink+' C, '+EsquemaAlmacen+'INV_S_BODEGA'+ DBLink+' B '+
                                     ' WHERE R.CIAS_CIAS = RM.CIAS_CIAS '+
                                     ' AND R.VIGENCIA = RM.VIGENCIA '+
                                     ' AND R.COD_REQUISICION = RM.COD_REQUISICION '+
                                     ' AND R.COD_CATALOGO = RM.COD_CATALOGO '+
                                     ' AND B.CIAS_CIAS = R.CIAS_CIAS '+
                                     ' AND R.COD_BODEGA_INVEN = B.COD_BODEGA '+
                                     ' AND R.CIAS_CIAS = :CIAS_CIAS '+
                                     ' AND R.VIGENCIA = :VIGENCIA '+
                                     ' AND R.COD_REQUISICION = :COD_REQUISICION '+
                                     ' AND R.COD_CATALOGO = C.COD_CATALOGO '+
                                     ' AND R.CANTIDAD_RESERVADA >0 '+
                                     ' ORDER BY R.RENGLON ';

end;

procedure TfQRRequisicionMateriales.qCOM_M_REQUISICIONBeforeOpen(
  DataSet: TDataSet);
begin
qCOM_M_REQUISICION.sql.text:= 'SELECT R.CIAS_CIAS, T.CIAS_DESCRI, R.NEGO_NEGO,R.CECO_CECO_EJE, '+
                              'N.NEGO_DESCRI, R.AREA_AREA, A.AREA_DESCRI, TA.AUXI_DESCRI, TA2.AUXI_DESCRI, '+
                              'TA.AUXI_NIT, R.CIAS_CIAS_EJE, T1.CIAS_DESCRI, R.NEGO_NEGO_EJE, '+
                              'N1.NEGO_DESCRI, R.AREA_AREA_EJE, A1.AREA_DESCRI, '+
                              'R.MOTIVO, R.FECHA as FECHAORIG, '+
                              'R.FECHA_AUTO_JEFE FECHA_AUTO_JEFE, '+
                              'R.NUMERO_ODM, CC.CECO_DESCRI, DECODE(R.AUTORIZA_JEFESN, ''SI'', ''APROBADA'', ''NO'', ''RECHAZADA'', ''PENDIENTE'') AS AUTORIZA_JEFESN '+
                              'FROM '+EsquemaAlmacen+'COM_M_REQUISICION'+ DBLink+' R, GE_TCIAS'+ DBLink+' T, '+
                              'GE_TCIAS'+ DBLink+' T1, GE_TNEGO'+ DBLink+' N, GE_TNEGO'+ DBLink+' N1, '+
                              'GE_TAREA'+ DBLink+' A, GE_TAREA'+ DBLink+' A1, GE_TAUXIL'+ DBLink+' TA, GE_TAUXIL'+ DBLink+' TA2, '+
                              'GE_TCECOS'+ DBLink+' CC '+
                              'WHERE R.CIAS_CIAS = T.CIAS_CIAS '+
                              'AND R.CIAS_CIAS_EJE = T1.CIAS_CIAS '+
                              'AND R.CECO_CECO_EJE = CC.CECO_CECO '+
                              'AND R.NEGO_NEGO = N.NEGO_NEGO '+
                              'AND R.NEGO_NEGO = N1.NEGO_NEGO '+
                              'AND R.AREA_AREA = A.AREA_AREA '+
                              'AND R.AREA_AREA_EJE = A1.AREA_AREA '+
                              'AND R.SOLICITA_AUXI = TA.AUXI_AUXI '+
                              'AND R.RESPONSABLE_AUXI = TA2.AUXI_AUXI (+) '+
                              'AND R.CIAS_CIAS = :CIAS_CIAS '+
                              'AND R.VIGENCIA = :VIGENCIA '+
                              'AND R.COD_REQUISICION = :COD_REQUISICION ';

end;

procedure TfQRRequisicionMateriales.qALMACENBeforeOpen(DataSet: TDataSet);
begin
qALMACEN.sql.text:= 'SELECT DISTINCT(R.COD_ALMACEN_INVEN), A.ALMACEN_DESCRI '+
                    'FROM '+EsquemaAlmacen+'COM_M_RESERVA_INVENTARIO'+ DBLink+' R, '+EsquemaAlmacen+'INV_S_ALMACEN'+ DBLink+' A '+
                    'WHERE '+
                    'R.COD_ALMACEN_INVEN = A.COD_ALMACEN '+
                    'AND R.CIAS_CIAS = :CIAS_CIAS '+
                    'AND R.VIGENCIA = :VIGENCIA '+
                    'AND R.COD_REQUISICION = :COD_REQUISICION ';

end;

procedure TfQRRequisicionMateriales.qReservaBeforeOpen(DataSet: TDataSet);
begin
qReserva.sql.text:= 'SELECT DISTINCT R.CIAS_CIAS, R.COD_ALMACEN_INVEN, '+
                    'A.ALMACEN_DESCRI, T.CIAS_DESCRI, MP.NOMBREMOVIMIENTOPRESUPUESTO AS TIPO_CUENTA '+
                    'FROM '+EsquemaAlmacen+'COM_M_RESERVA_INVENTARIO'+ DBLink+' R, '+
                    ''+EsquemaAlmacen+'COM_M_REQUISICION_MOVI'+ DBLink+' RM, '+
                    ''+EsquemaAlmacen+'COM_M_REQUISICION'+ DBLink+' RQ, '+
                    'GE_TCIAS'+ DBLink+' T, '+
                    ''+EsquemaAlmacen+'INV_S_BODEGA'+ DBLink+' B, '+EsquemaAlmacen+'INV_S_ALMACEN'+ DBLink+' A, '+
                    ' MOVIMIENTOPRESUPUESTO MP '+
                    'WHERE R.VIGENCIA = :VIGENCIA '+
                    'AND R.COD_REQUISICION = :COD_REQUISICION '+
                    'AND R.CIAS_CIAS = :CIAS_CIAS '+
                    'AND R.COD_ALMACEN_INVEN = B.COD_ALMACEN '+
                    'AND R.cias_cias = B.CIAS_CIAS '+
                    'AND R.COD_BODEGA_INVEN = B.COD_BODEGA '+
                    'AND B.COD_ALMACEN = A.COD_ALMACEN '+
                    'AND B.CIAS_CIAS = A.CIAS_CIAS '+
                    'AND R.CIAS_CIAS= RM.CIAS_CIAS '+
                    'AND R.VIGENCIA= RM.VIGENCIA '+
                    'AND R.COD_REQUISICION= RM.COD_REQUISICION '+
                    'AND R.COD_REQUISICION= RQ.COD_REQUISICION '+
                    'AND R.RENGLON= RM.RENGLON '+
                    'AND RM.CIAS_CIAS = RQ.CIAS_CIAS '+
                    'AND RQ.CIAS_CIAS = T.CIAS_CIAS '+
                    'AND RQ.TIPO_CUENTA = MP.CODIGOMOVIMIENTOPRESUPUESTO ';

end;

procedure TfQRRequisicionMateriales.qActivoBeforeOpen(DataSet: TDataSet);
begin
qActivo.sql.text:=  'SELECT DISTINCT R.CIAS_CIAS, R.COD_ALMACEN_INVEN, '+
                    'A.ALMACEN_DESCRI, T.CIAS_DESCRI '+
                    'FROM '+EsquemaAlmacen+'COM_M_RESERVA_INVENTARIO'+ DBLink+' R, '+
                    ''+EsquemaAlmacen+'COM_M_REQUISICION_MOVI'+ DBLink+' RM, '+
                    ''+EsquemaAlmacen+'COM_M_REQUISICION'+ DBLink+' RQ, '+
                    'GE_TCIAS'+ DBLink+' T, '+
                    ''+EsquemaAlmacen+'INV_S_BODEGA'+ DBLink+' B, '+EsquemaAlmacen+'INV_S_ALMACEN'+ DBLink+' A '+
                    'WHERE R.VIGENCIA = :VIGENCIA '+
                    'AND R.COD_REQUISICION = :COD_REQUISICION '+
                    'AND R.CIAS_CIAS = :CIAS_CIAS '+
                    'AND R.COD_ALMACEN_INVEN = B.COD_ALMACEN '+
                    'AND R.cias_cias = B.CIAS_CIAS '+
                    'AND R.COD_BODEGA_INVEN = B.COD_BODEGA '+
                    'AND B.COD_ALMACEN = A.COD_ALMACEN '+
                    'AND B.CIAS_CIAS = A.CIAS_CIAS '+
                    'AND R.CIAS_CIAS= RM.CIAS_CIAS '+
                    'AND R.VIGENCIA= RM.VIGENCIA '+
                    'AND R.COD_REQUISICION= RM.COD_REQUISICION '+
                    'AND R.RENGLON= RM.RENGLON '+
                    'AND RM.CIAS_CIAS = RQ.CIAS_CIAS '+
                    'AND RQ.CIAS_CIAS = T.CIAS_CIAS ';

end;

procedure TfQRRequisicionMateriales.qCOM_M_REQUISICIONCalcFields(
  DataSet: TDataSet);
var qConsulta:TQuery;
begin
  qCom_m_requisicion.fieldbyname('FECHA').asstring:= formatdatetime('dd-mm-yyyy',qCom_m_requisicion.fieldbyname('fechaORIG').asdatetime);
end;

procedure TfQRRequisicionMateriales.FormShow(Sender: TObject);
begin
  qEmpresa.Close;
  qEmpresa.Open;

  qrRequisicionMateriales.Preview;
end;

end.

