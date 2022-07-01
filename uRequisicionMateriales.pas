{ UNIDAD EN DONDE SE DESARROLLA TODO EL MODULO DE REQUISICIONES AGREGAR, EDITAR, VALIDAR INFORMACION ETC
  TIENE SU LLAMADO DESDE LA UNIDAD UODTURBANARURAL EN LOS BOTONES "AGREGAR","EDITAR".}
unit uRequisicionMateriales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, ExtCtrls, StdCtrls, DBCtrls, Mask, Buttons,
  ComCtrls, ImgList, ConsDll, QuickRpt, Qrctrls;

type
  TfRequisicionMateriales = class(TForm)
    pnlRequisicion: TPanel;
    Panel3: TPanel;
    qZona: TQuery;
    dsZona: TDataSource;
    qMaterial: TQuery;
    qUnidad: TQuery;
    Panel7: TPanel;
    btnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    qRequisicionMateriales: TQuery;
    updRequisicionMateriales: TUpdateSQL;
    qRequisicionMaterialesCODIGOODT: TFloatField;
    qRequisicionMaterialesCONSECUTIVO: TFloatField;
    qRequisicionMaterialesCODIGOREQUISICION: TFloatField;
    qRequisicionMaterialesFECHAREQUISICION: TDateTimeField;
    qRequisicionMaterialesESTADO: TStringField;
    qRequisicionMaterialesFECHAMODIFICACION: TDateTimeField;
    qNovedad: TQuery;
    qEmpresaSolicitante: TQuery;
    qNegocioSolicitante: TQuery;
    qAreaSolicitante: TQuery;
    dsNovedad: TDataSource;
    dsEmpresaSolicitante: TDataSource;
    qEmpresaEjecutora: TQuery;
    dsEmpresaEjecutora: TDataSource;
    dsAreaSolicitante: TDataSource;
    qAreaEjecutora: TQuery;
    dsAreaEjecutora: TDataSource;
    dsNegocioSolicitante: TDataSource;
    qNegocioEjecutora: TQuery;
    dsNegocioEjecutora: TDataSource;
    Panel8: TPanel;
    Notebook: TNotebook;
    Arbol: TTreeView;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbeEmpresaSolicitante: TDBEdit;
    dblcEmpresaSolicitante: TDBLookupComboBox;
    dbeAreaSolicitante: TDBEdit;
    dblcAreaSolicitante: TDBLookupComboBox;
    dbeNegocioSolicitante: TDBEdit;
    dblcNegocioSolicitante: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbeEmpresaDestino: TDBEdit;
    dblcEmpresaDestino: TDBLookupComboBox;
    dbeAreaDestino: TDBEdit;
    dblcAreaEjecutora: TDBLookupComboBox;
    dbeNegocioDestino: TDBEdit;
    dblcNegocioEjecutora: TDBLookupComboBox;
    ImageList1: TImageList;
    Panel2: TPanel;
    dbgMateriales: TDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    Label9: TLabel;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    dbmMotivo: TDBMemo;
    Label1: TLabel;
    dblcNovedad: TDBLookupComboBox;
    dbeNovedad: TDBEdit;
    Label10: TLabel;
    cmbResponsable: TComboBox;
    qCOM_M_REQUISICION: TQuery;
    dsCOM_M_REQUISICION: TDataSource;
    updCOM_M_REQUISICION: TUpdateSQL;
    qCOM_M_REQUISICION_MOVI: TQuery;
    dsCOM_M_REQUISICION_MOVI: TDataSource;
    updCOM_M_REQUISICION_MOVI: TUpdateSQL;
    qZonaCODIGOZONA: TFloatField;
    qZonaNOMBREZONA: TStringField;
    qZonaCODIGOZONAESSA: TFloatField;
    qNovedadCOD_NOVEDAD: TFloatField;
    qNovedadNOVEDAD_DESCRI: TStringField;
    Label11: TLabel;
    dbeVigencia: TDBEdit;
    qRequisicionMaterialesEMPRESA: TFloatField;
    qRequisicionMaterialesNEGOCIO: TFloatField;
    qRequisicionMaterialesVIGENCIA: TFloatField;
    qRequisicionMaterialesCODIGOTIPOODM: TStringField;
    qRequisicionMaterialesCODIGODOCUMENTOODM: TFloatField;
    qUtilizacion: TQuery;
    qMaterialCODIGOMATERIAL: TFloatField;
    qMaterialNOMBREMATERIAL: TStringField;
    qMaterialCODIGOMATERIALESSA: TFloatField;
    qCOM_M_RESERVA_INVENTARIO: TQuery;
    dsCOM_M_RESERVA_INVENTARIO: TDataSource;
    updCOM_M_RESERVA_INVENTARIO: TUpdateSQL;
    dbeNombreEmpresaSolicitante: TDBEdit;
    dsGE_TCIAS: TDataSource;
    qGE_TCIAS: TQuery;
    dbeNombreEmpresaDestino: TDBEdit;
    dsGE_TCIASEJE: TDataSource;
    qGE_TCIASEJE: TQuery;
    Panel6: TPanel;
    Label12: TLabel;
    dbeCIAS: TDBEdit;
    dblcCIAS: TDBLookupComboBox;
    Label14: TLabel;
    dsCIAS: TDataSource;
    qCIAS: TQuery;
    dsAlmacen: TDataSource;
    qAlmacen: TQuery;
    qCIASCIAS_CIAS: TFloatField;
    qCIASCIAS_DESCRI: TStringField;
    qAlmacenCOD_ALMACEN: TStringField;
    qAlmacenUPPERALMACEN_DESCRI: TStringField;
    dsAlmacenReserva: TDataSource;
    qAlmacenReserva: TQuery;
    dsTemporal: TDataSource;
    dbgCantidadDisponible: TDBGrid;
    qSAF_M_INTERVENCIONES: TQuery;                                     
    dsSAF_M_INTERVENCIONES: TDataSource;
    updSAF_M_INTERVENCIONES: TUpdateSQL;
    qSAF_M_INTERVENCIONEScod_intervencion: TFloatField;
    qSAF_M_INTERVENCIONESCOD_ORIGEN: TStringField;
    qSAF_M_INTERVENCIONESVIGENCIA: TFloatField;
    qSAF_M_INTERVENCIONESCOD_ZONA: TFloatField;
    qSAF_M_INTERVENCIONESIMPU_PROG_CONVENIO: TStringField;
    qSAF_M_INTERVENCIONESCOD_ACTIVO: TFloatField;
    qSAF_M_INTERVENCIONESFECHA_CREA: TDateTimeField;
    qSAF_M_INTERVENCIONESFECHA_MOD: TDateTimeField;
    qSAF_M_INTERVENCIONESUSUARIO_MOD: TStringField;
    qSAF_M_INTERVENCIONESCOD_EJECUTOR: TStringField;
    qSAF_M_INTERVENCIONESUSUARIO_CREA: TStringField;
    qSAF_M_INTERVENCIONESCOD_TIPO_INTERVENCION: TStringField;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBNavigator2: TDBNavigator;
    qCOM_M_REQUISICIONCIAS_CIAS: TFloatField;
    qCOM_M_REQUISICIONVIGENCIA: TFloatField;
    qCOM_M_REQUISICIONCOD_REQUISICION: TFloatField;
    qCOM_M_REQUISICIONGRCIAS_GRCIAS: TFloatField;
    qCOM_M_REQUISICIONNEGO_NEGO: TStringField;
    qCOM_M_REQUISICIONESTRUCTURA_AREA: TFloatField;
    qCOM_M_REQUISICIONAREA_AREA: TStringField;
    qCOM_M_REQUISICIONESTRUCTURA_CECO: TFloatField;
    qCOM_M_REQUISICIONCECO_CECO: TStringField;
    qCOM_M_REQUISICIONCOD_NOVEDAD: TStringField;
    qCOM_M_REQUISICIONSOLICITA_AUXI: TFloatField;
    qCOM_M_REQUISICIONMOTIVO: TMemoField;
    qCOM_M_REQUISICIONFECHA: TDateTimeField;
    qCOM_M_REQUISICIONCIAS_CIAS_EJE: TFloatField;
    qCOM_M_REQUISICIONNEGO_NEGO_EJE: TStringField;
    qCOM_M_REQUISICIONESTRUCTURA_AREA_EJE: TFloatField;
    qCOM_M_REQUISICIONAREA_AREA_EJE: TStringField;
    qCOM_M_REQUISICIONESTRUCTURA_CECO_EJE: TFloatField;
    qCOM_M_REQUISICIONCECO_CECO_EJE: TStringField;
    qCOM_M_REQUISICIONVIGENCIA_ODM: TFloatField;
    qCOM_M_REQUISICIONCOD_ODM: TFloatField;
    qCOM_M_REQUISICIONNUMERO_ODM: TStringField;
    qCOM_M_REQUISICIONOBRA_OBRA: TFloatField;
    qCOM_M_REQUISICIONCOD_ACTIVO: TFloatField;
    qCOM_M_REQUISICIONCOD_BODEGA_VIRTUAL: TFloatField;
    qCOM_M_REQUISICIONCLASE_RESPONSABLE: TStringField;
    qCOM_M_REQUISICIONRESPONSABLE_AUXI: TFloatField;
    qCOM_M_REQUISICIONCLASE_PRESTAMO: TStringField;
    qCOM_M_REQUISICIONTIPO: TStringField;
    qCOM_M_REQUISICIONPROPOSITO: TStringField;
    qCOM_M_REQUISICIONTIPO_DOC_ASOCIADO: TStringField;
    qCOM_M_REQUISICIONVIGENCIA_LOTE: TFloatField;
    qCOM_M_REQUISICIONCOD_LOTE: TFloatField;
    qCOM_M_REQUISICIONVIGENCIA_SOLICITUD: TFloatField;
    qCOM_M_REQUISICIONCOD_SOLICITUD: TFloatField;
    qCOM_M_REQUISICIONAPROBADASN: TStringField;
    qCOM_M_REQUISICIONAUTORIZA_JEFESN: TStringField;
    qCOM_M_REQUISICIONESTRUCTURA_AREA_JEFE: TFloatField;
    qCOM_M_REQUISICIONAREA_AREA_JEFE: TStringField;
    qCOM_M_REQUISICIONAUXI_JEFE: TFloatField;
    qCOM_M_REQUISICIONCARG_CARG_JEFE: TStringField;
    qCOM_M_REQUISICIONAUTORIZA_COMPRASN: TStringField;
    qCOM_M_REQUISICIONCOD_AUTO_COMPRA: TFloatField;
    qCOM_M_REQUISICIONESTRUCTURA_AREA_COMPRA: TFloatField;
    qCOM_M_REQUISICIONAREA_AREA_COMPRA: TStringField;
    qCOM_M_REQUISICIONAUXI_COMPRA: TFloatField;
    qCOM_M_REQUISICIONCARG_CARG_COMPRA: TStringField;
    qCOM_M_REQUISICIONCOD_AUTO_COMPRA_ADICION: TFloatField;
    qCOM_M_REQUISICIONCTRL_INVENTARIOSN: TStringField;
    qCOM_M_REQUISICIONCAUSAL_ANULADO: TMemoField;
    qCOM_M_REQUISICIONPROCESO: TStringField;
    qCOM_M_REQUISICIONESTADO: TStringField;
    qCOM_M_REQUISICIONFECHA_CREA: TDateTimeField;
    qCOM_M_REQUISICIONUSUARIO_CREA: TStringField;
    qCOM_M_REQUISICIONFECHA_MOD: TDateTimeField;
    qCOM_M_REQUISICIONUSUARIO_MOD: TStringField;
    qCOM_M_REQUISICIONCONTRATO_SIO: TStringField;
    qCOM_M_REQUISICIONCLASE_REQU: TStringField;
    qCOM_M_REQUISICIONTIPO_CUENTA: TStringField;
    qCOM_M_REQUISICIONVIGENCIA_SOLICITUD_GLOB: TFloatField;
    qCOM_M_REQUISICIONCOD_SOLICITUD_GLOB: TFloatField;
    qCOM_M_REQUISICIONFECHA_AUTO_JEFE: TDateTimeField;
    qCOM_M_REQUISICIONFECHA_AUTO_COMPRA: TDateTimeField;
    qCOM_M_REQUISICIONCIUD_CIUD_ALUMBRADO: TFloatField;
    qCOM_M_REQUISICIONCONTAB_AUXI: TFloatField;
    qCOM_M_REQUISICIONPROYECTOSN: TStringField;
    qCOM_M_REQUISICIONESTRUCTURA_IMPU: TFloatField;
    qCOM_M_REQUISICIONIMPU_IMPU: TStringField;
    qCOM_M_REQUISICIONCIAS_CIAS_ODM: TFloatField;
    qCOM_M_REQUISICIONCOD_TIPO_ODM: TStringField;
    qCOM_M_REQUISICIONCOD_DOCUMENTO_ODM: TFloatField;
    qCOM_M_REQUISICIONCOD_INTERV: TFloatField;
    qCOM_M_REQUISICIONCOD_INTERVENCION: TFloatField;
    qCOM_M_REQUISICIONCOD_TIPO_INTERVENCION: TStringField;
    qCOM_M_REQUISICIONCOD_ORIGEN: TStringField;
    qCOM_M_REQUISICIONCOD_EJECUTOR: TStringField;
    qCOM_M_REQUISICIONVIGENCIA_INTERVENCION: TFloatField;
    qCOM_M_REQUISICION_MOVICIAS_CIAS: TFloatField;
    qCOM_M_REQUISICION_MOVIVIGENCIA: TFloatField;
    qCOM_M_REQUISICION_MOVICOD_REQUISICION: TFloatField;
    qCOM_M_REQUISICION_MOVICOD_CATALOGO: TFloatField;
    qCOM_M_REQUISICION_MOVIACLARACIONES: TMemoField;
    qCOM_M_REQUISICION_MOVICANTIDAD_SOLI: TFloatField;
    qCOM_M_REQUISICION_MOVICANTIDAD_SOLI_AUTO: TFloatField;
    qCOM_M_REQUISICION_MOVIAUTORIZA_JEFESN: TStringField;
    qCOM_M_REQUISICION_MOVIAUTORIZA_COMPRASN: TStringField;
    qCOM_M_REQUISICION_MOVICANTIDAD_INVEN_ALMA_RES: TFloatField;
    qCOM_M_REQUISICION_MOVICANTIDAD_INVEN_CONTR_RES: TFloatField;
    qCOM_M_REQUISICION_MOVICANTIDAD_COMPRA: TFloatField;
    qCOM_M_REQUISICION_MOVICANTIDAD_INVEN_ALMA_EJE: TFloatField;
    qCOM_M_REQUISICION_MOVICANTIDAD_INVEN_CONTR_EJE: TFloatField;
    qCOM_M_REQUISICION_MOVICANTIDAD_COMPRA_EJE: TFloatField;
    qCOM_M_REQUISICION_MOVIENRUTADA_COMPRASN: TStringField;
    qCOM_M_REQUISICION_MOVIESTADO: TStringField;
    qCOM_M_REQUISICION_MOVIFECHA_CREA: TDateTimeField;
    qCOM_M_REQUISICION_MOVIUSUARIO_CREA: TStringField;
    qCOM_M_REQUISICION_MOVIFECHA_MOD: TDateTimeField;
    qCOM_M_REQUISICION_MOVIUSUARIO_MOD: TStringField;
    qCOM_M_REQUISICION_MOVIRENGLON: TFloatField;
    qCOM_M_REQUISICION_MOVICODIGOMATERIAL: TFloatField;
    qCOM_M_REQUISICION_MOVINOMBREMATERIAL: TStringField;
    qCOM_M_REQUISICION_MOVINOMBREUNIDAD: TStringField;
    qCOM_M_RESERVA_INVENTARIOCIAS_CIAS: TFloatField;
    qCOM_M_RESERVA_INVENTARIOVIGENCIA: TFloatField;
    qCOM_M_RESERVA_INVENTARIOCOD_REQUISICION: TFloatField;
    qCOM_M_RESERVA_INVENTARIOCOD_CATALOGO: TFloatField;
    qCOM_M_RESERVA_INVENTARIOCIAS_CIAS_INVEN: TFloatField;
    qCOM_M_RESERVA_INVENTARIOCOD_ALMACEN_INVEN: TStringField;
    qCOM_M_RESERVA_INVENTARIONEGO_NEGO_INVEN: TStringField;
    qCOM_M_RESERVA_INVENTARIOCOD_BODEGA_INVEN: TStringField;
    qCOM_M_RESERVA_INVENTARIOCANTIDAD_RESERVADA: TFloatField;
    qCOM_M_RESERVA_INVENTARIOCANTIDAD_ENTREGADA: TFloatField;
    qCOM_M_RESERVA_INVENTARIOESTADO: TStringField;
    qCOM_M_RESERVA_INVENTARIOFECHA_CREA: TDateTimeField;
    qCOM_M_RESERVA_INVENTARIOUSUARIO_CREA: TStringField;
    qCOM_M_RESERVA_INVENTARIOFECHA_MOD: TDateTimeField;
    qCOM_M_RESERVA_INVENTARIOUSUARIO_MOD: TStringField;
    qCOM_M_RESERVA_INVENTARIOOPERACION: TStringField;
    qCOM_M_RESERVA_INVENTARIORENGLON: TFloatField;
    qCOM_M_RESERVA_INVENTARIOCANTIDAD_DEVUELTA: TFloatField;
    qCOM_M_RESERVA_INVENTARIOACTUALIZA_RESERVASN: TStringField;
    Label13: TLabel;
    dbeAlmacen: TDBEdit;
    dblcAlmacen: TDBLookupComboBox;
    Label16: TLabel;
    dsBodega: TDataSource;
    qBodega: TQuery;
    qBodegaCOD_BODEGA: TStringField;
    qBodegaUPPERBODEGA_DESCRI: TStringField;
    Label17: TLabel;
    Label18: TLabel;
    dbeCecos: TDBEdit;
    Label19: TLabel;
    qCeco: TQuery;
    dsCeco: TDataSource;
    dblcCeCos: TDBLookupComboBox;
    LContrato: TLabel;
    dblcResponsable: TDBLookupComboBox;
    dbeResponsable: TDBEdit;
    dbeNitEmpleado: TDBEdit;
    qResponsable: TQuery;
    dsResponsable: TDataSource;
    qEmpleado: TQuery;
    dsEmpleado: TDataSource;
    eContrato: TEdit;
    dblcEmpleado: TDBLookupComboBox;
    qEmpleadoCODIGOEMPLEADO: TFloatField;
    qEmpleadoNOMBREEMPLEADO: TStringField;
    qResponsableCODIGOEMPLEADO: TFloatField;
    qResponsableNOMBREEMPLEADO: TStringField;
    eNitContratista: TEdit;
    qCecoCECO_CECO: TStringField;
    qCecoCECO_DESCRI: TStringField;
    eNombreContratista: TEdit;
    qCOM_M_REQUISICION_MOVICANTIDAD_FALTANTE: TFloatField;
    TTEMPORAL: TTable;
    qCOM_M_REQUISICION_MOVICOD_UTILIZACION: TFloatField;
    qRequisicionMaterialesIMPRESOREQUISICION: TStringField;
    dbeBodega: TDBEdit;
    dblcBodega: TDBLookupComboBox;
    qAlmacenCIAS_CIAS: TFloatField;
    dsGE_TAUXIL: TDataSource;
    qGE_TAUXIL: TQuery;
    qGE_TAUXILAUXI_AUXI: TFloatField;
    qGE_TAUXILAUXI_DESCRI: TStringField;
    Label15: TLabel;
    Label20: TLabel;
    dsMovimiento: TDataSource;
    qMovimiento: TQuery;
    qMovimientoNOMBREMOVIMIENTOPRESUPUESTO: TStringField;
    qMovimientoCODIGOMOVIMIENTOPRESUPUESTO: TStringField;
    DBEdit7: TDBEdit;
    dblcMovimiento: TDBLookupComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnAceptarClick(Sender: TObject);
    procedure ArbolChange(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure qCOM_M_REQUISICION_MOVIAfterScroll(DataSet: TDataSet);
    procedure CrearTablaReserva;
    procedure llenarTablaReserva;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qAlmacenAfterScroll(DataSet: TDataSet);
    procedure qCIASAfterScroll(DataSet: TDataSet);
    procedure ValidarDatos;
    procedure btnCancelarClick(Sender: TObject);
    procedure dbgMaterialesEditButtonClick(Sender: TObject);
    procedure VerificarAutorizacion;
    procedure dblcNegocioSolicitanteClick(Sender: TObject);
    procedure dblcNegocioEjecutoraClick(Sender: TObject);
    procedure dblcAreaSolicitanteClick(Sender: TObject);
    procedure dbeNegocioSolicitanteExit(Sender: TObject);
    procedure dbeNegocioDestinoExit(Sender: TObject);
    procedure qNegocioSolicitanteAfterInsert(DataSet: TDataSet);
    procedure dbeAreaSolicitanteExit(Sender: TObject);
    procedure NotebookPageChanged(Sender: TObject);
    procedure dbgCantidadDisponibleExit(Sender: TObject);
    procedure tTemporalAfterScroll(DataSet: TDataSet);
    procedure dblcAlmacenClick(Sender: TObject);
    procedure dblcAlmacenEnter(Sender: TObject);
    procedure dbgMaterialesExit(Sender: TObject);
    procedure qCOM_M_REQUISICION_MOVIBeforeScroll(DataSet: TDataSet);
    procedure qNovedadAfterScroll(DataSet: TDataSet);
    procedure qAreaEjecutoraBeforeScroll(DataSet: TDataSet);
    procedure qNegocioEjecutoraAfterScroll(DataSet: TDataSet);
    procedure dblcAreaEjecutoraEnter(Sender: TObject);
    procedure qCOM_M_REQUISICION_MOVIBeforeDelete(DataSet: TDataSet);
    procedure Table1AfterScroll(DataSet: TDataSet);
    procedure eContratoExit(Sender: TObject);
    procedure qGE_TAUXILCalcFields(DataSet: TDataSet);
    procedure qCOM_M_REQUISICION_MOVIBeforeOpen(DataSet: TDataSet);
    procedure qCOM_M_RESERVA_INVENTARIOBeforeOpen(DataSet: TDataSet);
    procedure qCOM_M_REQUISICIONBeforeOpen(DataSet: TDataSet);
    procedure qSAF_M_INTERVENCIONESBeforeOpen(DataSet: TDataSet);
    procedure qUtilizacionBeforeOpen(DataSet: TDataSet);
    procedure qEmpresaSolicitanteBeforeOpen(DataSet: TDataSet);
    procedure qEmpresaEjecutoraBeforeOpen(DataSet: TDataSet);
    procedure qAreaSolicitanteBeforeOpen(DataSet: TDataSet);
    procedure qAreaEjecutoraBeforeOpen(DataSet: TDataSet);
    procedure qNegocioSolicitanteBeforeOpen(DataSet: TDataSet);
    procedure qNegocioEjecutoraBeforeOpen(DataSet: TDataSet);
    procedure qCecoBeforeOpen(DataSet: TDataSet);
    procedure qAlmacenReservaBeforeOpen(DataSet: TDataSet);
    procedure qGE_TCIASBeforeOpen(DataSet: TDataSet);
    procedure qCIASBeforeOpen(DataSet: TDataSet);
    procedure qAlmacenBeforeOpen(DataSet: TDataSet);
    procedure qBodegaBeforeOpen(DataSet: TDataSet);
    procedure qBodegaAfterScroll(DataSet: TDataSet);
    procedure dblcBodegaClick(Sender: TObject);
    procedure dblcBodegaEnter(Sender: TObject);
    procedure qGE_TCIASEJEBeforeOpen(DataSet: TDataSet);
    procedure qGE_TAUXILBeforeOpen(DataSet: TDataSet);
    procedure qCOM_M_REQUISICIONAfterInsert(DataSet: TDataSet);
    procedure qCOM_M_REQUISICIONNEGO_NEGO_EJEChange(Sender: TField);
    procedure qCOM_M_REQUISICIONAREA_AREA_EJEChange(Sender: TField);
  private
    { Private declarations }
    //reserva_Bodega_inicial: integer;   //Cantidad de elementos reservados por bodega
    //Reserva_odthija: integer;          // cantidad reservada por toda la odt hija indiferente de la requisicion
    valor_reserva_actual:integer;
    VALOR_CAMBIO_Reserva:integer;
    VALOR_CAMBIO_dispon:integer;
    inicio:boolean;
    Devoluciones_Activo: boolean;
    AGREGARMATERIAL: BOOLEAN;
    MARCA: BOOLEAN;
    ALMACENESCOGIDO:BOOLEAN;
    BodegaEscogida: BOOLEAN;
    oldReserva: integer;
    MoviendoFila: Boolean;  //Variable para indicar que la tabla ttemporal esta cambiando de fila
    AceptarRequisicion: boolean;  //Variable que nos indca que la requisicion esta aceptandoce.
    Cambiar_Area:boolean; // Variable que me identifica si el area a cambiado o no.
  public
    { Public declarations }
    CodigoZona, Consecutivo: Integer;
    CodigoEjecutor: Extended;
    Creacion, CancelarCierre: Boolean; //Variable para determinar si se está creando o editando una requisicion.
    CodigosMateriales: TStringList; // Variable lista que me indica los codigos de los elementos solicitados en la odt
    QueryAlmacen: string;
    ReservasActuales: array of array of double
    //Function LiberarReserva;
  end;

var
  fRequisicionMateriales: TfRequisicionMateriales;

implementation

uses  uBuscaMaterialRequisicion, ufuncionsgd, uOdturbanarural;

{$R *.DFM}

procedure TfRequisicionMateriales.FormShow(Sender: TObject);
var
  qConsulta: TQuery;
begin
  qNegocioSolicitante.open;
  qGE_TAUXIL.OPEN;
  qNegocioEjecutora.open;
  qCeco.open;
  CodigosMateriales := TStringList.Create();
  AGREGARMATERIAL:= FALSE;
  Devoluciones_Activo:= False;
  qMovimiento.open;

  //Aqui se toma una variable lista y se llena co los codigos de  catalogos que se pidieron para la odt
  qCOM_M_REQUISICION_MOVI.First;
  while not qCOM_M_REQUISICION_MOVI.Eof do
  begin
    CodigosMateriales.Add(qCOM_M_REQUISICION_MOVICOD_CATALOGO.AsString);
    qCOM_M_REQUISICION_MOVI.Next;
  end;
  qCOM_M_REQUISICION_MOVI.First;
  IF QCOM_M_REQUISICION_MOVI.RecordCount>0 THEN BodegaEscogida:= TRUE;

  qZona.ParamByName('CODIGOZONA').AsInteger := CodigoZona;
  qZona.Open;
  //si el trabajo es INTERNO PARA TOMAR LAS NOVEDADES ASOCIADAS AL NEGOCIO
 { if fOdtHijaAP.qODTPadreCODIGOODTTIPOMANOOBRA.asfloat = 1 then
  BEGIN  }
    QNOVEDAD.CLOSE;
    QNOVEDAD.SQL.Clear;
    QNOVEDAD.sql.Add('SELECT TO_NUMBER(COD_NOVEDAD) COD_NOVEDAD, NOVEDAD_DESCRI FROM '+EsquemaAlmacen+'INV_S_NOVEDAD'+ DBLink);
    QNOVEDAD.sql.Add('WHERE (pide_odmsn = ''SI'' OR PIDE_SIOSN = ''SI'')AND (novedad_descri NOT LIKE ''%REINTEGRO%'')');
    QNOVEDAD.sql.Add('AND (novedad_descri NOT LIKE ''%RECUPERACION%'') AND ESTADO = ''ACTIVO''');
    //QNOVEDAD.sql.Add('AND novedad_descri LIKE ''%CUADRILLA%''');
    QNOVEDAD.Open;
    cmbResponsable.ItemIndex:= 1;
 { END;
  //Si el trabajo es EXTERNO PARA TOMAR LAS NOVEDADES ASOCIADAS AL NEGOCIO
  if fOdtHijaAP.qODTPadreCODIGOODTTIPOMANOOBRA.asfloat = 2 then
  BEGIN
    QNOVEDAD.CLOSE;
    QNOVEDAD.SQL.Clear;
    QNOVEDAD.sql.Add('SELECT TO_NUMBER(COD_NOVEDAD) COD_NOVEDAD, NOVEDAD_DESCRI FROM '+EsquemaAlmacen+'INV_S_NOVEDAD'+DBLink);
    QNOVEDAD.sql.Add('WHERE (pide_odmsn = ''SI'' OR PIDE_SIOSN = ''SI'')AND (novedad_descri NOT LIKE ''%REINTEGRO%'')');
    QNOVEDAD.sql.Add('AND (novedad_descri NOT LIKE ''%RECUPERACION%'') AND ESTADO = ''ACTIVO''');
    QNOVEDAD.sql.Add('AND novedad_descri LIKE ''%CONTRATO%''');
    QNOVEDAD.Open;
    cmbResponsable.ItemIndex:= 0;
  END;      }
  //cmbResponsable.enabled:= false;
  qResponsable.Close;
  qResponsable.sql.Clear;
  //VERIFICO QUE SI SON EMPLEADOS EXTERNOS(CONTRATISTA) O INTERNOS.
 { if  cmbResponsable.ItemIndex = 0 then
  begin  
     qResponsable.sql.Add('select * from empleado where codigosueldo =''CONT'' order by NOMBREEMPLEADO');   }
  {end;  }
  if cmbResponsable.ItemIndex = 1 then
  begin
     qResponsable.sql.Add('select * from empleado where codigosueldo <>''CONT'' or codigosueldo is null order by NOMBREEMPLEADO');
  end;
  qResponsable.OPEN;
  {if fOdturbanarural.qODTPadreCODIGOODTTIPOMANOOBRA.AsFloat= 2 then
  begin
    fRequisicionMateriales.eContrato.Visible:= true;
    fRequisicionMateriales.LContrato.Visible:= true;
    if qCOM_M_REQUISICION.State = dsInsert then
      fRequisicionMateriales.eContrato.text:=  fOdturbanarural.qODTPadreNUMEROCONTRATO.ASSTRING
    else
      fRequisicionMateriales.econtrato.Text:=   qCOM_M_REQUISICIONCONTRATO_SIO.asstring;
    fRequisicionMateriales.eNitContratista.Visible:= true;
    fRequisicionMateriales.eNitContratista.text := fOdturbanarural.qODTPadreCODIGOCONTRATISTA.ASSTRING;
    eNombreContratista.VISIBLE:= TRUE;
    eNombreContratista.Text:=fOdturbanarural.qODTPadreNOMBRECONTRATISTA.ASSTRING;
    dblcResponsable.VISIBLE:= FALSE;
    dbeResponsable.Visible:= false;

  end; }
  if Creacion = True then
  begin
    fRequisicionMateriales.qCOM_M_REQUISICIONCIAS_CIAS.AsFloat := qZonaCODIGOZONAESSA.AsFloat;
    fRequisicionMateriales.qCOM_M_REQUISICIONCIAS_CIAS_EJE.AsFloat := qZonaCODIGOZONAESSA.AsFloat;

    {//Obtener el último código de la requisicón por vigencia y por zona.
    qConsulta := TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.SQL.Add('SELECT MAX(COD_REQUISICION) FROM '+EsquemaAlmacen+'COM_M_REQUISICION'+DBLink);
    qConsulta.SQL.Add('WHERE VIGENCIA = ' + qCOM_M_REQUISICIONVIGENCIA.AsString);
    qConsulta.SQL.Add('AND CIAS_CIAS = ' + qZonaCODIGOZONAESSA.AsString);
    qConsulta.Open;
    qRequisicionMaterialesCODIGOREQUISICION.AsFloat := qConsulta.Fields[0].AsFloat + 1;
    qCOM_M_REQUISICIONCOD_REQUISICION.AsFloat := qConsulta.Fields[0].AsFloat + 1;
    pnlRequisicion.Caption := 'Requisición No. ' +  qRequisicionMaterialesCODIGOREQUISICION.AsString;
    qConsulta.Close;
    qConsulta.Free; }

    dbeNovedad.Text := '';
    dbeAreaSolicitante.Text := '';
    dbeAreaDestino.Text := '';
    dbeNegocioSolicitante.Text := '';
    dbeNegocioDestino.Text := '';
    dbeNITEmpleado.Text := '';
    dbeCIAS.Text := '';
    dbeAlmacen.Text := '';
  end;
  dbeNegocioSolicitante.SetFocus;
  dbeAreaSolicitante.SetFocus;
  dbeNegocioDestino.SetFocus;
  dbeAreaDestino.SetFocus;
  dbmMotivo.SetFocus;
  CrearTablaReserva;
  llenarTablaReserva;
  qResponsable.open;
  qEmpleado.open;
end;

procedure TfRequisicionMateriales.btnAceptarClick(Sender: TObject);
{AQUI SE GENERA TODO EL PROCESO DE ALMACENAMIENTO Y EDICION DE LA INFORMACION REFERENTA A
REQUISICIONES, OJO SE DEBE MEJORAR Y DIVIDIRLO EN VARIOS PROCEDIMIENTOS Y FUNCIONES,"PENDIENTE"}
var
  qConsulta: TQuery;
  NombreUsuario: String;
  Cambios, bVacio: Boolean;
  Renglon,i,renglonmaximo: Integer;
  Year, Month, Day: Word;
  CodigosMaterialesttemporal: TStringList;
  cadenattemporal: string;
begin
  qCOM_M_REQUISICION_MOVI.Edit;
  cadenattemporal:= '';
  CodigosMaterialesttemporal := TStringList.Create();
  qCOM_M_REQUISICION_MOVI.First;
  while not qCOM_M_REQUISICION_MOVI.Eof do
  begin
    CodigosMaterialesttemporal.Add(qCOM_M_REQUISICION_MOVICOD_CATALOGO.AsString);
    qCOM_M_REQUISICION_MOVI.Next;
  end;
  if  CodigosMaterialesttemporal.Count >0 then
  Begin
    for I := 0 to CodigosMaterialesttemporal.Count - 1 do
      cadenattemporal := cadenattemporal + ' cod_catalogo = '+CodigosMaterialesttemporal[I] + '  or ';
    Delete(cadenattemporal, Length(cadenattemporal)-3, 3);
  end;
  AceptarRequisicion:= true;
  inicio:= false;
  BodegaEscogida:= False;
//PRIMERO VERIFICO QUE LA INFORMACION REQUERIDA SE ENCUENTRE LISTA
  if  (dblcNegocioSolicitante.Text = '') or
  (dblcAreaSolicitante.Text = '') or (dblcEmpleado.Text = '') or
  (dblcNegocioEjecutora.Text = '') or
  (dblcAreaEjecutora.Text = '') or (dblcNovedad.Text = '') or  (dbeCecos.Text='')
  or (dbmMotivo.Text = '') or (dbeVigencia.Text = '') or (dblcMovimiento.Text = '') then
  begin
    Notebook.ActivePage := 'Información';
    Application.MessageBox('Todos los valores son requeridos', 'Advertencia', MB_OK + MB_ICONWARNING);
    CancelarCierre := True;
    Exit;
  end; 
  If (dbeNovedad.Text = '52') and (econtrato.Text = '') then
  begin
    Notebook.PageIndex := 0;
    Application.MessageBox('Para la novedad 52 es necesario tener el numero de contrato.', 'Advertencia', MB_OK + MB_ICONWARNING);
    CancelarCierre := True;
    Exit;
  end;
  if fOdturbanarural.qODTPadreCODIGOODTTIPOMANOOBRA.AsFloat = 1 then
  begin
    if (dbeResponsable.Text ='') OR  (cmbResponsable.Text = '') then
    begin
      Notebook.ActivePage := 'Información';
      Application.MessageBox('Todos los valores son requeridos', 'Advertencia', MB_OK + MB_ICONWARNING);
      CancelarCierre := True;
    end;
  end;

  try
    bVacio:= False;
    if tTemporal.Active then
      if (tTemporal.RecordCount = 0) then
        bVacio:= True;

    if bVacio or ((tTemporal.State = dsInactive) and Creacion)
       or ((qCOM_M_REQUISICION_MOVI.RecordCount = 0) and not Creacion)then
    begin
      Notebook.ActivePage := 'Materiales';
      Application.MessageBox('Se requiere hacer la reserva de los materiales.', 'Advertencia', MB_OK + MB_ICONWARNING);
      CancelarCierre := True;
      Exit;
    end;
  except
    on e:Exception do
    begin
      Application.MessageBox(PChar('Ocurrió un error guardando los cambios:'+chr(13)+chr(13)+e.message), 'Error', MB_ICONERROR+MB_OK);
      CancelarCierre := True;
      Exit;
    end;
  end;

  if tTemporal.UpdatesPending then
  begin
    tTemporal.Post;
    tTemporal.ApplyUpdates;
    tTemporal.CommitUpdates;
  end;
    {Averiguar el nombre del usuario activo para actualizar los campos FECHA_CREA
  y USUARIO_CREA en caso de inserción, o los campos FECHA_MOD y USUARIO_MOD en
  caso de modificación.}
  qConsulta := TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';

  qConsulta.SQL.Add('insert into GE_TAUXIL select (select nvl(max(auxi_auxi),0) from GE_TAUXIL)+ rownum, nombreempleado, codigoempleado from empleado where codigoempleado not in ( ');
  qConsulta.SQL.Add('Select auxi_nit from GE_TAUXIL)');
  qConsulta.ExecSQL;

  qConsulta.SQL.Clear;
  qConsulta.SQL.Add('SELECT LOGINUSUARIO FROM USUARIO');
  qConsulta.SQL.Add('WHERE CODIGOUSUARIO = ' + IntToStr(VarCodigoUsuario));
  qConsulta.Open;
  NombreUsuario := qConsulta.Fields[0].AsString;
  qConsulta.Close;
  {*****************************COM_M_REQUISICION*******************************}
  {Llenar el resto de datos de la requisición en la tabla COM_M_REQUISICION}

  //Obtener el último código de la requisicón por vigencia y por zona.
  if creacion = true then
  Begin
    {qConsulta := TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato'; }
    qConsulta.sql.clear;
    qConsulta.SQL.Add('SELECT MAX(COD_REQUISICION) FROM '+EsquemaAlmacen+'COM_M_REQUISICION'+DBLink);
    qConsulta.SQL.Add('WHERE VIGENCIA = ' + qCOM_M_REQUISICIONVIGENCIA.AsString);
    qConsulta.SQL.Add('AND CIAS_CIAS = ' + qZonaCODIGOZONAESSA.AsString);
    qConsulta.Open;
    qRequisicionMaterialesCODIGOREQUISICION.AsFloat := qConsulta.Fields[0].AsFloat + 1;
    qCOM_M_REQUISICIONCOD_REQUISICION.AsFloat := qConsulta.Fields[0].AsFloat + 1;
    pnlRequisicion.Caption := 'Requisición No. ' +  qRequisicionMaterialesCODIGOREQUISICION.AsString;
    qConsulta.Close;
    //qConsulta.Free;
  end;
  //***********************Hasta Aqui se Genera el codigo de la requisicion.***************************+//

  qCOM_M_REQUISICIONCOD_NOVEDAD.AsString := qNovedadCOD_NOVEDAD.AsString;
  if qCOM_M_REQUISICIONCOD_NOVEDAD.asstring = '52' then qCOM_M_REQUISICIONCONTRATO_SIO.asstring:=   econtrato.Text;
  qCOM_M_REQUISICIONESTRUCTURA_AREA.AsInteger := qAreaSolicitante.fieldbyname('AREA_ETCT').AsInteger;
  qCOM_M_REQUISICIONESTRUCTURA_AREA_EJE.AsInteger := qAreaEjecutora.fieldbyname('AREA_ETCT').AsInteger;
  qCOM_M_REQUISICIONESTRUCTURA_CECO.AsInteger := qAreaSolicitante.fieldbyname('CECO_ETCT').AsInteger;
  qCOM_M_REQUISICIONESTRUCTURA_CECO_EJE.AsInteger := qAreaEjecutora.fieldbyname('CECO_ETCT').AsInteger;
  qCOM_M_REQUISICIONCECO_CECO_EJE.Value := qCecoCECO_CECO.Value;
  qCOM_M_REQUISICIONCLASE_RESPONSABLE.AsString := cmbResponsable.Text;
  qCOM_M_REQUISICIONGRCIAS_GRCIAS.ASFLOAT:= 1;
  qCOM_M_REQUISICIONTIPO.AsString := 'CANTIDADES';
  qCOM_M_REQUISICIONESTADO.AsString := 'VIGENTE';
  qCOM_M_REQUISICIONCTRL_INVENTARIOSN.AsString := 'SI';
  if qCOM_M_REQUISICIONCOD_NOVEDAD.asstring = '52' then qCOM_M_REQUISICIONCONTRATO_SIO.asstring:=   econtrato.Text;
  qCOM_M_REQUISICIONAUTORIZA_JEFESN.ASSTRING:= '';
  {if (FOdtUrbanaRural.qODTPadreCODIGOMODOODT.AsInteger = 2) then
  Begin
    qCOM_M_REQUISICIONclase_requ.asstring:= 'ALUMBRADO.PUB.' ;
    qConsulta.SQL.Clear;
    qConsulta.SQL.text:= 'SELECT codigomunicipioessa FROM municipio WHERE codigomunicipio = ' + FOdtUrbanaRuraL.qODTPadreCODIGOMUNICIPIO.AsString;
    qConsulta.open;
    qCOM_M_REQUISICIONCIUD_CIUD_ALUMBRADO.ASINTEGER:= qConsulta.fieldbyname('codigomunicipioessa').asinteger;
    qConsulta.close;
  End; }
  DecodeDate(now, Year, Month, Day);
  qCOM_M_REQUISICIONVIGENCIA_ODM.Asfloat :=year;

  qCOM_M_REQUISICIONNUMERO_ODM.AsString := 'ODT-0' + qCOM_M_REQUISICIONCIAS_CIAS.AsString + '-0' +
  qCOM_M_REQUISICIONNEGO_NEGO.AsString + '-' + qCOM_M_REQUISICIONAREA_AREA.AsString + '-' +
  copy(qRequisicionMaterialesCODIGOODT.Asstring,7,length(qRequisicionMaterialesCODIGOODT.Asstring)) + '-' + qRequisicionMaterialesCONSECUTIVO.AsString;
  qCOM_M_REQUISICIONAPROBADASN.AsString := 'NO';
  qCOM_M_REQUISICIONPROCESO.AsString := 'GRABADA';
  //Campos de la requisicion Asociados a la intervencion
  {Averiguar el código auxiliar del responsable de la ODT.}
  qConsulta.SQL.Clear;
  qConsulta.SQL.Add('SELECT AUXI_AUXI FROM GE_TAUXIL'+DBLink);
  if fOdturbanarural.qODTPadreCODIGOODTTIPOMANOOBRA.AsFloat= 2 then
  qConsulta.SQL.Add('WHERE AUXI_NIT =  TRUNC(TO_NUMBER(REPLACE('''+ fOdturbanarural.qODTPadreCODIGOCONTRATISTA.ASstring +''',''-'',''.'')))')
  else
  qConsulta.SQL.Add('WHERE AUXI_NIT = '+qResponsableCODIGOEMPLEADO.Asstring);
  qConsulta.Open;
  qCOM_M_REQUISICIONRESPONSABLE_AUXI.AsFloat := qConsulta.Fields[0].AsFloat;
  qConsulta.Close;

  {Averiguar el código auxiliar del solicitante de la requisicion.}
  qConsulta.SQL.Clear;
  qConsulta.SQL.Add('SELECT AUXI_AUXI FROM GE_TAUXIL'+DBLink);
  qConsulta.SQL.Add('WHERE AUXI_NIT = '''+qCOM_M_REQUISICIONSOLICITA_AUXI.AsString+'''');
  qConsulta.Open;
  qCOM_M_REQUISICIONSOLICITA_AUXI.AsFloat := qConsulta.Fields[0].AsFloat;
  qConsulta.Close;
  qConsulta.Free; 

  if qCOM_M_REQUISICION.State = dsInsert then
  begin
    qCOM_M_REQUISICIONUSUARIO_CREA.AsString := NombreUsuario;
    qCOM_M_REQUISICIONFECHA_CREA.Value := Now;
  end
  else begin
    qCOM_M_REQUISICIONUSUARIO_MOD.AsString := NombreUsuario;
    qCOM_M_REQUISICIONFECHA_MOD.Value := Now;
  end;
  if qCOM_M_REQUISICION.State in [dsInsert, dsEdit] then


  qCOM_M_REQUISICION.Post;
  qCOM_M_REQUISICION.ApplyUpdates;
  qCOM_M_REQUISICION.CommitUpdates;

  {***************************COM_M_REQUISICION_MOVI****************************}
  {Actualizar el listado completo de materiales de la requisición escribiendo en la
  tabla COM_M_REQUISICION_MOVI}
  tTemporal.Close;
  tTemporal.DatabaseName := 'Temp';
  tTemporal.TableName := 'RESERVA';
  tTemporal.Filtered := True;
  tTemporal.Filter := 'CANTIDAD_RESERVADA > 0';
  tTemporal.Open;
  tTemporal.first;
  Renglon:= 0;
    qCOM_M_REQUISICION_MOVI.edit;
  IF Creacion = TRUE THEN
  Begin
    qcom_m_requisicion_movi.first;
    while not qcom_m_requisicion_movi.eof do
    Begin
    qCOM_M_REQUISICION_MOVI.Edit;
    qcom_m_requisicion_movicod_requisicion.asfloat:= qCOM_M_REQUISICIONCOD_REQUISICION.AsFloat;
    qcom_m_requisicion_movi.next;
    End;
    while not tTemporal.Eof do
    begin
      IF ttemporal.fieldbyname('cod_catalogo').asString<> '' then
      begin
        qcom_m_requisicion_movi.Locate('COD_CATALOGO', ttemporal.fieldbyname('cod_catalogo').asfloat, [loCaseInsensitive]);
        renglon:= renglon +1;
        qCOM_M_REQUISICION_MOVI.Edit;
        tTemporal.Edit;
        qMaterial.Locate('CODIGOMATERIAL', qCOM_M_REQUISICION_MOVICODIGOMATERIAL.AsString, [loCaseInsensitive]);
        qCOM_M_REQUISICION_MOVICOD_CATALOGO.AsFloat := qMaterialCODIGOMATERIAL.AsFloat;
        qCOM_M_REQUISICION_MOVICIAS_CIAS.AsInteger := qCOM_M_REQUISICIONCIAS_CIAS.AsInteger;
        qCOM_M_REQUISICION_MOVIVIGENCIA.AsInteger := qCOM_M_REQUISICIONVIGENCIA.AsInteger;
        //qCOM_M_REQUISICION_MOVICOD_REQUISICION.AsFloat := qCOM_M_REQUISICIONCOD_REQUISICION.AsFloat;
        qCOM_M_REQUISICION_MOVIESTADO.AsString := 'VIGENTE';
        qCOM_M_REQUISICION_MOVIUSUARIO_CREA.AsString := NombreUsuario;
        qCOM_M_REQUISICION_MOVIFECHA_CREA.Value := Now;
      end;
      ttemporal.next
    end;
      qCOM_M_REQUISICION_MOVI.edit;
    qCOM_M_REQUISICION_MOVI.Post;
    qCOM_M_REQUISICION_MOVI.ApplyUpdates;
    qCOM_M_REQUISICION_MOVI.CommitUpdates;
  end
  else
  Begin
    qConsulta := TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.SQL.Add('SELECT MAX(renglon) as maximo FROM '+EsquemaAlmacen+'com_m_requisicion_movi'+DBLink);
    qConsulta.SQL.Add('WHERE cod_requisicion  = '+qcom_m_requisicion_movicod_requisicion.asstring);
    qConsulta.SQL.Add('AND cias_cias = '+ qcom_m_requisicion_movicias_cias.asstring);
    qConsulta.SQL.Add('AND vigencia = '+qcom_m_requisicion_movivigencia.asstring);
    qConsulta.open;
    renglonmaximo := qconsulta.fieldbyname('maximo').asinteger;
    qConsulta.free;
    renglon:= renglonmaximo +1;
    tTemporal.first;
    while not tTemporal.Eof do
    begin
      if qcom_m_requisicion_movi.Locate('COD_CATALOGO', ttemporal.fieldbyname('cod_catalogo').asfloat, [loCaseInsensitive]) = True then    //qCOM_M_REQUISICION_MOVICOD_CATALOGO.AsFloat
      begin
        qCOM_M_REQUISICION_MOVI.Edit;
        tTemporal.Edit;
        qMaterial.Locate('CODIGOMATERIAL', qCOM_M_REQUISICION_MOVICODIGOMATERIAL.AsString, [loCaseInsensitive]);
        qCOM_M_REQUISICION_MOVICOD_CATALOGO.AsFloat := qMaterialCODIGOMATERIAL.AsFloat;
        qCOM_M_REQUISICION_MOVICIAS_CIAS.AsInteger := qCOM_M_REQUISICIONCIAS_CIAS.AsInteger;
        qCOM_M_REQUISICION_MOVIVIGENCIA.AsInteger := qCOM_M_REQUISICIONVIGENCIA.AsInteger;
        qCOM_M_REQUISICION_MOVICOD_REQUISICION.AsFloat := qCOM_M_REQUISICIONCOD_REQUISICION.AsFloat;
        if qCOM_M_REQUISICION_MOVIRENGLON.Asstring = '' then
        Begin
          qCOM_M_REQUISICION_MOVIRENGLON.AsInteger := Renglon;
          renglon:= renglon +1;
        end;
        qCOM_M_REQUISICION_MOVIESTADO.AsString := 'VIGENTE';
        qCOM_M_REQUISICION_MOVIUSUARIO_MOD.AsString := NombreUsuario;
        qCOM_M_REQUISICION_MOVIFECHA_MOD.Value := Now;
      end;
      ttemporal.next
    end;
    qcom_m_requisicion_movi.first;
    while not qcom_m_requisicion_movi.Eof do
    Begin
      if qCOM_M_REQUISICION_MOVIRENGLON.Asstring = '' then
        qcom_m_requisicion_movi.delete;
      qcom_m_requisicion_movi.next;
    end;
  end;
  qcom_m_requisicion_movi.edit;
  if qCOM_M_REQUISICION_MOVI.State in [dsInsert, dsEdit] then
  Begin
    qCOM_M_REQUISICION_MOVI.Post;
    qCOM_M_REQUISICION_MOVI.ApplyUpdates;
    qCOM_M_REQUISICION_MOVI.CommitUpdates;
  end;
  {***************************COM_M_RESERVA_INVENTARIO***************************}
  tTemporal.Filtered := False;
  tTemporal.Filter := '';
  tTemporal.Close;
  tTemporal.DatabaseName := 'Temp';
  tTemporal.TableName := 'RESERVA';
  tTemporal.Filtered := True;
  Cambios := False;
  qCOM_M_RESERVA_INVENTARIO.Close;
  qCOM_M_RESERVA_INVENTARIO.Open ;
  qCOM_M_RESERVA_INVENTARIO.Insert;
  if creacion = true then
  begin
  //********************************agregar****************************
    tTemporal.Filter := 'CANTIDAD_RESERVADA > 0';
    tTemporal.Open;
    tTemporal.First;
    with tTemporal do
    begin
      while not Eof do
      begin
        if FieldByName('CANTIDAD_RESERVADA').AsFloat > 0 then
        begin
          Cambios := True;
          qCOM_M_RESERVA_INVENTARIO.Insert;
          if qcom_m_requisicion_movi.Locate('COD_CATALOGO', fieldbyname('cod_catalogo').asfloat, [loCaseInsensitive]) = True then
          Begin
            qCOM_M_RESERVA_INVENTARIORENGLON.AsFloat := qCOM_M_REQUISICION_MOVIRENGLON.asfloat;    //FieldByName('RENGLON').AsFloat;
            qCOM_M_RESERVA_INVENTARIOCIAS_CIAS.AsFloat := qCOM_M_REQUISICIONCIAS_CIAS.AsInteger;
            qCOM_M_RESERVA_INVENTARIOVIGENCIA.AsFloat := FieldByName('VIGENCIA').AsFloat;
            //qCOM_M_RESERVA_INVENTARIOCOD_REQUISICION.AsFloat := FieldByName('COD_REQUISICION').AsFloat;
            qCOM_M_RESERVA_INVENTARIOCOD_REQUISICION.AsFloat := qcom_m_requisicion.FieldByName('COD_REQUISICION').AsFloat;
            qCOM_M_RESERVA_INVENTARIOCOD_CATALOGO.AsFloat := FieldByName('COD_CATALOGO').AsFloat;
            qCOM_M_RESERVA_INVENTARIOCIAS_CIAS_INVEN.AsFloat := FieldByName('CIAS_CIAS').AsFloat;
            qCOM_M_RESERVA_INVENTARIOCOD_ALMACEN_INVEN.AsString := FieldByName('COD_ALMACEN').AsString;
            qCOM_M_RESERVA_INVENTARIONEGO_NEGO_INVEN.AsString := FieldByName('NEGO_NEGO').AsString;
            qCOM_M_RESERVA_INVENTARIOCOD_BODEGA_INVEN.AsString := FieldByName('COD_BODEGA').AsString;
            qCOM_M_RESERVA_INVENTARIOCANTIDAD_RESERVADA.AsFloat := FieldByName('CANTIDAD_RESERVADA').AsFloat;
            qCOM_M_RESERVA_INVENTARIOFECHA_CREA.AsDateTime := Now;
            qCOM_M_RESERVA_INVENTARIOUSUARIO_CREA.AsString := NombreUsuario;
            qCOM_M_RESERVA_INVENTARIOOPERACION.AsString := 'RESERVA';
            qCOM_M_RESERVA_INVENTARIOESTADO.AsString := 'VIGENTE';
            qCOM_M_RESERVA_INVENTARIOACTUALIZA_RESERVASN.AsString := 'SI';
            qCOM_M_RESERVA_INVENTARIOCANTIDAD_DEVUELTA.ASFLOAT:= FieldByName('CANTIDAD_DEVUELTA').AsFloat;
          end;
        end;
        Next;
      end;
      qCOM_M_RESERVA_INVENTARIO.Post;
      qCOM_M_RESERVA_INVENTARIO.ApplyUpdates;
      qCOM_M_RESERVA_INVENTARIO.CommitUpdates;
      Close;
    end;
  end
  else begin
  //********************************Editar**********************************************
    tTemporal.Filter := 'CANTIDAD_RESERVADA > 0 and (' + cadenattemporal + ')';
    tTemporal.Open;
    qCOM_M_RESERVA_INVENTARIO.Close;
    qCOM_M_RESERVA_INVENTARIO.Open;
    with tTemporal do
    begin
      while not Eof do
      begin
        if qCOM_M_RESERVA_INVENTARIO.Locate('CIAS_CIAS;VIGENCIA;COD_REQUISICION;COD_CATALOGO;CIAS_CIAS_INVEN;' +
        'COD_ALMACEN_INVEN;NEGO_NEGO_INVEN;COD_BODEGA_INVEN', VarArrayOf([FieldByName('ZONA').AsFloat,
        FieldByName('VIGENCIA').AsFloat, qcom_m_requisicion.FieldByName('COD_REQUISICION').AsFloat,
        FieldByName('COD_CATALOGO').AsFloat, FieldByName('CIAS_CIAS').AsFloat,
        FieldByName('COD_ALMACEN').AsString, FieldByName('NEGO_NEGO').AsString,
        FieldByName('COD_BODEGA').AsString]), []) = True then
        begin
          if ((FieldByName('CANTIDAD_RESERVADA').Asstring <> '') and (FieldByName('CANTIDAD_RESERVADA').Asstring <> '0')) then
          begin
            Cambios := True;
            qCOM_M_RESERVA_INVENTARIO.Edit;
            qCOM_M_RESERVA_INVENTARIOCANTIDAD_RESERVADA.AsFloat := tTemporal.FieldByName('CANTIDAD_RESERVADA').AsFloat;
            qCOM_M_RESERVA_INVENTARIOCANTIDAD_DEVUELTA.AsFloat := tTemporal.FieldByName('CANTIDAD_DEVUELTA').AsFloat;
            qCOM_M_RESERVA_INVENTARIOFECHA_MOD.AsDateTime := Now;
            qCOM_M_RESERVA_INVENTARIOUSUARIO_MOD.AsString := NombreUsuario;
          end
          else begin
            qCOM_M_RESERVA_INVENTARIO.Edit;
            qCOM_M_RESERVA_INVENTARIO.Delete;
            qCOM_M_RESERVA_INVENTARIO.Next;
            qCOM_M_RESERVA_INVENTARIO.ApplyUpdates;
            qCOM_M_RESERVA_INVENTARIO.CommitUpdates;
            Continue;
          end;
          qCOM_M_RESERVA_INVENTARIO.Post;
          qCOM_M_RESERVA_INVENTARIO.ApplyUpdates;
          qCOM_M_RESERVA_INVENTARIO.CommitUpdates;
        end
        else begin
          if FieldByName('CANTIDAD_RESERVADA').AsFloat > 0 then
          begin
            Cambios := True;
            qCOM_M_RESERVA_INVENTARIO.Insert;
            qCOM_M_RESERVA_INVENTARIOCIAS_CIAS.AsFloat := FieldByName('ZONA').AsFloat;
            qCOM_M_RESERVA_INVENTARIOVIGENCIA.AsFloat := FieldByName('VIGENCIA').AsFloat;
            //qCOM_M_RESERVA_INVENTARIOCOD_REQUISICION.AsFloat := FieldByName('COD_REQUISICION').AsFloat;
            qCOM_M_RESERVA_INVENTARIOCOD_REQUISICION.AsFloat := qcom_m_requisicion.FieldByName('COD_REQUISICION').AsFloat;
            qCOM_M_RESERVA_INVENTARIORENGLON.AsFloat := FieldByName('RENGLON').AsFloat;
            qCOM_M_RESERVA_INVENTARIOCOD_CATALOGO.AsFloat := FieldByName('COD_CATALOGO').AsFloat;
            qCOM_M_RESERVA_INVENTARIOCIAS_CIAS_INVEN.AsFloat := FieldByName('CIAS_CIAS').AsFloat;
            qCOM_M_RESERVA_INVENTARIOCOD_ALMACEN_INVEN.AsString := FieldByName('COD_ALMACEN').AsString;
            qCOM_M_RESERVA_INVENTARIONEGO_NEGO_INVEN.AsString := FieldByName('NEGO_NEGO').AsString;
            qCOM_M_RESERVA_INVENTARIOCOD_BODEGA_INVEN.AsString := FieldByName('COD_BODEGA').AsString;
            qCOM_M_RESERVA_INVENTARIOCANTIDAD_RESERVADA.AsFloat := FieldByName('CANTIDAD_RESERVADA').AsFloat;
            qCOM_M_RESERVA_INVENTARIOCANTIDAD_DEVUELTA.AsFloat := FieldByName('CANTIDAD_DEVUELTA').AsFloat;
            qCOM_M_RESERVA_INVENTARIOFECHA_CREA.AsDateTime := Now;
            qCOM_M_RESERVA_INVENTARIOUSUARIO_CREA.AsString := NombreUsuario;
            qCOM_M_RESERVA_INVENTARIOOPERACION.AsString := 'RESERVA';
            qCOM_M_RESERVA_INVENTARIOESTADO.AsString := 'VIGENTE';
            qCOM_M_RESERVA_INVENTARIOACTUALIZA_RESERVASN.AsString := 'SI';

            qCOM_M_RESERVA_INVENTARIO.Post;
            qCOM_M_RESERVA_INVENTARIO.ApplyUpdates;
            qCOM_M_RESERVA_INVENTARIO.CommitUpdates;
          end;
        end;
        Next;
      end;
      Close;
    end;
  end;

  qCOM_M_RESERVA_INVENTARIO.Close;
  qCOM_M_REQUISICION.Edit;
  qCOM_M_REQUISICIONAPROBADASN.AsString := 'SI';
 // qCOM_M_REQUISICIONPROCESO.AsString := 'APROBADA';
  qCOM_M_REQUISICION.Post;
  qCOM_M_REQUISICION.ApplyUpdates;
  qCOM_M_REQUISICION.CommitUpdates;


  {********************************ODTREQUISICION********************************}
  {Escribiendo en la tabla ODTREQUISICION, que relaciona las requisiciones con
  las ordenes de trabajo.}
  qRequisicionMaterialesFECHAREQUISICION.Value := Date;
  qRequisicionMaterialesIMPRESOREQUISICION.ASSTRING:=  'N';
  if Cambios = True then
    qRequisicionMaterialesESTADO.AsString := 'APROBADA'
  else
    qRequisicionMaterialesESTADO.AsString := 'VIGENTE';

  qRequisicionMaterialesEMPRESA.Value := qCOM_M_REQUISICIONCIAS_CIAS.Value;
  qRequisicionMaterialesNEGOCIO.Value := qCOM_M_REQUISICIONNEGO_NEGO.AsFloat;
  qRequisicionMaterialesVIGENCIA.Value := qCOM_M_REQUISICIONVIGENCIA.Value;
  qRequisicionMaterialesCODIGODOCUMENTOODM.Value := qCOM_M_REQUISICIONCOD_ODM.value;  //   qRequisicionMaterialesCODIGOODT.Value;

  if Creacion = False then
    qRequisicionMaterialesFECHAMODIFICACION.Value := Date;

  if qRequisicionMateriales.State in [dsInsert, dsEdit] then
    qRequisicionMateriales.Post;

  qRequisicionMateriales.ApplyUpdates;
  qRequisicionMateriales.CommitUpdates;
end;

procedure TfRequisicionMateriales.ArbolChange(Sender: TObject;
  Node: TTreeNode);
begin
  Notebook.PageIndex := Arbol.Selected.Index;
end;

procedure TfRequisicionMateriales.FormCreate(Sender: TObject);
begin
  Notebook.PageIndex := 0;
end;

procedure TfRequisicionMateriales.qCOM_M_REQUISICION_MOVIAfterScroll(
  DataSet: TDataSet);
var
filtro:string;
  begin
  if dbgMateriales.Focused then
  begin
    if tTemporal.Active = True then
    begin
      if dbgMateriales.columns[0].Field.AsString <> '' then
      Begin
        filtro:= dbgMateriales.columns[0].Field.AsString;
        dbgCantidadDisponible.Enabled := True;
        if tTemporal.FieldByName('COD_CATALOGO').AsString = '' then
        begin
          tTemporal.Close;
          tTemporal.Filtered := True;
          tTemporal.Filter := 'COD_CATALOGO = ' + filtro;
          tTemporal.Open;
          tTemporal.Edit;
          Exit;
        end;

        if (not qCOM_M_REQUISICION_MOVI.Eof) then
        begin
          with tTemporal do
          begin
            EDIT;
            Post;
            ApplyUpdates;
            CommitUpdates;
            Close;
            DatabaseName := 'Temp';
            TableName := 'RESERVA';
            dbgCantidadDisponible.DataSource := dsTemporal;

            Filtered := True;
            Filter := 'COD_CATALOGO = ' + filtro;
            Open;
            Edit;
          end;
        end
        else begin
          tTemporal.Close;
          tTemporal.Open;
          tTemporal.Edit;
        end;
      END;
    end
    else

      dbgCantidadDisponible.Enabled := False;
   end;
end;

procedure TfRequisicionMateriales.CrearTablaReserva;
{PROCEDIMIENTO PARA LLENAR LA TABLA DE RESERVA DE MATERIALES ESTO SE HACE CUANDO AGREGUEN LOS ELEMENTOS A REQUERIR
INICIALMENTE TAN PRONTO SE DISPONE EL ALMACEN SE LLENA POR DEFECTO Y SE PUEDE CAMBIAR}

var
  qConsulta: TQuery;
  Cadena: String;
  CodigoMaterial: Extended;
  Renglon, I: Integer;
  ValorAprobado:integer;
  ValorReservado:integer;

begin
  with tTemporal do
  begin
    Active := False;
    DatabaseName := 'Temp';
    TableType := ttParadox;
    TableName := 'RESERVA';
    with FieldDefs do
    begin
      Clear;
      Add('COD_CATALOGO', ftFloat, 0, True);
      Add('CIAS_CIAS', ftFloat, 0, True);
      Add('COD_ALMACEN', ftString, 5, True);
      Add('COD_BODEGA', ftString, 5, True);
      Add('NEGO_NEGO', ftString, 5, True);
      Add('SALDO_CANTIDAD', ftFloat, 0, True);
      Add('CANTIDAD_RESERVADA', ftFloat, 0, False);
      Add('CANTIDAD_DEVUELTA', ftFloat, 0, False);
      Add('ZONA', ftFloat, 0, True);
      Add('VIGENCIA', ftFloat, 0, True);
      Add('COD_REQUISICION', ftFloat, 0, false);
      Add('RENGLON', ftFloat, 0, True);
      Add('FECHA_CREA', ftDateTime, 0, False);
      Add('USUARIO_CREA', ftString, 16, False);
    end;
    with IndexDefs do
    begin
      Clear;
      Add('', 'COD_CATALOGO;CIAS_CIAS;COD_ALMACEN;COD_BODEGA;NEGO_NEGO', [ixPrimary, ixUnique]);
    end;
    CreateTable;
  end;
end;



procedure TfRequisicionMateriales.llenarTablaReserva;
{PROCEDIMIENTO PARA LLENAR LA TABLA DE RESERVA DE MATERIALES ESTO SE HACE CUANDO AGREGUEN LOS ELEMENTOS A REQUERIR
INICIALMENTE TAN PRONTO SE DISPONE EL ALMACEN SE LLENA POR DEFECTO Y SE PUEDE CAMBIAR}
var
  qConsulta, qAgregarMaterialBodega: TQuery;
  Cadena: String;
  CodigoMaterial: Extended;
  Renglon, I: Integer;
  ValorAprobado:integer;
  ValorReservado, MaterialExistenteBodega:integer;
begin
tTemporal.Open;
  if CodigosMateriales.Count > 0 then
  begin
    If ((qCOM_M_REQUISICIONCIAS_CIAS.ASSTRING <> '') AND (qAlmacenCOD_ALMACEN.AsString <> '') AND (qBodegaCOD_BODEGA.AsString<> '' )) then
    Begin
      for I := 0 to CodigosMateriales.Count - 1 do
      Begin
        qAgregarMaterialBodega := TQuery.Create(Application);
        qAgregarMaterialBodega.DatabaseName := 'BaseDato';
        qAgregarMaterialBodega.SQL.Add('select count(*) as cuenta from inv_m_inventario_real where cias_cias =  '+qCOM_M_REQUISICIONCIAS_CIAS.ASSTRING);
        qAgregarMaterialBodega.SQL.Add('and cod_almacen =  '+qAlmacenCOD_ALMACEN.AsString);
        qAgregarMaterialBodega.SQL.Add('and cod_bodega =  '+qBodegaCOD_BODEGA.AsString);
        qAgregarMaterialBodega.SQL.Add('and cod_catalogo =  '+CodigosMateriales[I]);
        qAgregarMaterialBodega.open;
        MaterialExistenteBodega := qAgregarMaterialBodega.FieldByName('cuenta').asinteger;
        qAgregarMaterialBodega.close;
        If  MaterialExistenteBodega = 0 then
        Begin
          qAgregarMaterialBodega.sql.Clear;
          qAgregarMaterialBodega.SQL.Add('Insert into INV_M_INVENTARIO_REAL (CIAS_CIAS, COD_ALMACEN, COD_BODEGA, NEGO_NEGO, COD_CATALOGO, ');
          qAgregarMaterialBodega.SQL.Add(' GRCIAS_GRCIAS, SALDO_CANTIDAD, SALDO_VALOR, COSTO_PROMEDIO, ACUM_CANTI_RESERVA, CTRL_INDIVIDUALSN, FECHA_CREA, USUARIO_CREA, FECHA_MOD, USUARIO_MOD)');
          qAgregarMaterialBodega.SQL.Add('Values ('+qCOM_M_REQUISICIONCIAS_CIAS.ASSTRING+', '''+qAlmacenCOD_ALMACEN.AsString+''', ');
          qAgregarMaterialBodega.SQL.Add(''''+qBodegaCOD_BODEGA.AsString+''', '''+qCOM_M_REQUISICIONNEGO_NEGO.ASSTRING+''', ');
          qAgregarMaterialBodega.SQL.Add( CodigosMateriales[I]+',   1, 0, 0, 0, 0,  ''SI'', sysdate, ''ADMIN'', sysdate, ''ADMIN'')' );
          //qAgregarMaterialBodega.SQL.SaveToFile('c:\prueba.txt');
          qAgregarMaterialBodega.ExecSQL;
        End;
        qAgregarMaterialBodega.free;
      End;
    End;
  End;
  qConsulta := TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.SQL.Clear;
  qConsulta.SQL.Add('SELECT COD_CATALOGO, CIAS_CIAS, COD_ALMACEN, COD_BODEGA, NEGO_NEGO, SALDO_CANTIDAD, Acum_Canti_Reserva');
  qConsulta.SQL.Add('FROM '+EsquemaAlmacen+'INV_M_INVENTARIO_REAL'+DBLink);
  qConsulta.SQL.Add('WHERE CIAS_CIAS = :CIAS_CIAS');
  qConsulta.SQL.Add('AND COD_ALMACEN = :COD_ALMACEN');
  qConsulta.SQL.Add('AND NEGO_NEGO = :NEGO_NEGO');
  qConsulta.SQL.Add('AND COD_BODEGA = :COD_BODEGA');
  if CodigosMateriales.Count > 0 then
  begin
    Cadena := ' IN (';
    for I := 0 to CodigosMateriales.Count - 1 do
      Cadena := Cadena + CodigosMateriales[I] + ',';
    Delete(Cadena, Length(Cadena), 1);
    Cadena := Cadena + ')';
    qConsulta.SQL.Add('AND COD_CATALOGO' + Cadena);
  end;
  //qConsulta.SQL.Add('AND SALDO_CANTIDAD > 0');
  qConsulta.SQL.Add('ORDER BY COD_CATALOGO, CIAS_CIAS, COD_ALMACEN, COD_BODEGA');

  qConsulta.ParamByName('CIAS_CIAS').AsFloat := qCOM_M_REQUISICIONCIAS_CIAS.AsFloat;
  qConsulta.ParamByName('COD_ALMACEN').AsString := qAlmacenCOD_ALMACEN.asstring;  //qCOM_M_RESERVA_INVENTARIOCOD_ALMACEN_INVEN.AsString;
  qConsulta.ParamByName('COD_BODEGA').AsString := qBodegaCOD_BODEGA.asstring;   //qCOM_M_RESERVA_INVENTARIOCOD_BODEGA_INVEN.AsString;
  qConsulta.ParamByName('NEGO_NEGO').AsString := qCOM_M_REQUISICIONNEGO_NEGO.AsString;         //dbeNegocioSolicitante.Text;


  qConsulta.Open;
  if qConsulta.RecordCount = 0 then
  begin
    tTemporal.Close;
    qConsulta.Close;
    Exit;
  end;
  dbgCantidadDisponible.Enabled := True;
  CodigoMaterial := qConsulta.FieldByName('COD_CATALOGO').AsFloat;
  while not qConsulta.Eof do
  begin
    tTemporal.Insert;
//****CODIGO PARA HACER LA RESERVA POR DEFECTO****************************************************
    qcom_m_requisicion_movi.Locate('COD_CATALOGO', qConsulta.FieldByName('COD_CATALOGO').AsFloat, [loCaseInsensitive]);
    ValorAprobado:=dbgMateriales.Columns[4].Field.asinteger;
    ValorReservado:=dbgMateriales.Columns[5].Field.asinteger;
//********************************************************************
    tTemporal.FieldByName('ZONA').AsFloat := qCOM_M_REQUISICIONCIAS_CIAS.AsFloat;
    tTemporal.FieldByName('VIGENCIA').AsFloat := qCOM_M_REQUISICIONVIGENCIA.AsFloat;
    { Cambio Error del codigo por concurrencia
    tTemporal.FieldByName('COD_REQUISICION').AsFloat := qCOM_M_REQUISICIONCOD_REQUISICION.AsFloat; }
    if creacion = false then  tTemporal.FieldByName('COD_REQUISICION').AsFloat := qCOM_M_REQUISICIONCOD_REQUISICION.AsFloat;
    tTemporal.FieldByName('RENGLON').AsFloat := qCOM_M_REQUISICION_MOVIRENGLON.asfloat;
    tTemporal.FieldByName('COD_CATALOGO').AsFloat := qConsulta.FieldByName('COD_CATALOGO').AsFloat;
    tTemporal.FieldByName('CIAS_CIAS').AsFloat := qConsulta.FieldByName('CIAS_CIAS').AsFloat;
    tTemporal.FieldByName('COD_ALMACEN').AsString := qConsulta.FieldByName('COD_ALMACEN').AsString;
    tTemporal.FieldByName('COD_BODEGA').AsString := qConsulta.FieldByName('COD_BODEGA').AsString;
    tTemporal.FieldByName('NEGO_NEGO').AsString := qConsulta.FieldByName('NEGO_NEGO').AsString;

    
    tTemporal.FieldByName('SALDO_CANTIDAD').AsFloat := qConsulta.FieldByName('SALDO_CANTIDAD').AsFloat - qConsulta.FieldByName('Acum_Canti_Reserva').AsFloat;

    if qCOM_M_RESERVA_INVENTARIO.RecordCount > 0 then
    begin
      { Cambio Error del codigo por concurrencia
      if qCOM_M_RESERVA_INVENTARIO.Locate('CIAS_CIAS;VIGENCIA;COD_REQUISICION;COD_CATALOGO;CIAS_CIAS_INVEN;' + }
      if qCOM_M_RESERVA_INVENTARIO.Locate('CIAS_CIAS;VIGENCIA;COD_CATALOGO;CIAS_CIAS_INVEN;' +
      'COD_ALMACEN_INVEN;NEGO_NEGO_INVEN;COD_BODEGA_INVEN', VarArrayOf([qCOM_M_REQUISICIONCIAS_CIAS.AsFloat,
      { Cambio Error del codigo por concurrencia
      qCOM_M_REQUISICIONVIGENCIA.AsFloat, qCOM_M_REQUISICIONCOD_REQUISICION.AsFloat,  }
      qCOM_M_REQUISICIONVIGENCIA.AsFloat,
      qConsulta.FieldByName('COD_CATALOGO').AsFloat,
      qConsulta.FieldByName('CIAS_CIAS').AsFloat, qConsulta.FieldByName('COD_ALMACEN').AsString,
      qConsulta.FieldByName('NEGO_NEGO').AsString, qConsulta.FieldByName('COD_BODEGA').AsString]), []) = True then
      begin
        tTemporal.FieldByName('CANTIDAD_RESERVADA').AsFloat := qCOM_M_RESERVA_INVENTARIOCANTIDAD_RESERVADA.AsFloat;
        tTemporal.FieldByName('SALDO_CANTIDAD').AsFloat := qConsulta.FieldByName('SALDO_CANTIDAD').AsFloat - qConsulta.FieldByName('Acum_Canti_Reserva').AsFloat + qCOM_M_RESERVA_INVENTARIOCANTIDAD_RESERVADA.AsFloat;
        tTemporal.FieldByName('CANTIDAD_DEVUELTA').AsFloat := qCOM_M_RESERVA_INVENTARIOCANTIDAD_DEVUELTA.AsFloat;
        tTemporal.FieldByName('FECHA_CREA').AsDateTime := qCOM_M_RESERVA_INVENTARIOFECHA_CREA.AsDateTime;
        tTemporal.FieldByName('USUARIO_CREA').AsString := qCOM_M_RESERVA_INVENTARIOUSUARIO_CREA.AsString;
      end
      else begin
        tTemporal.FieldByName('CANTIDAD_RESERVADA').AsFloat := 0;
      end;
    end
    else
 //*****************RESERVA POR DEFECTO***********************
    begin

      // Cambios EEH

     { iF (ValorAprobado - ValorReservado) <= tTemporal.FieldByName('SALDO_CANTIDAD').AsFloat then
      begin
        tTemporal.FieldByName('CANTIDAD_RESERVADA').AsFloat := (ValorAprobado -ValorReservado);
      end
      else
      begin
        tTemporal.FieldByName('CANTIDAD_RESERVADA').AsFloat := tTemporal.FieldByName('SALDO_CANTIDAD').AsFloat;
      end;}

      tTemporal.FieldByName('CANTIDAD_RESERVADA').AsFloat := ValorAprobado;

      qcom_m_requisicion_movi.edit;
      dbgMateriales.Columns[5].Field.asfloat := dbgMateriales.Columns[5].Field.asfloat+ tTemporal.FieldByName('CANTIDAD_RESERVADA').Asfloat;
    end;
    CodigoMaterial := qConsulta.FieldByName('COD_CATALOGO').AsFloat;
    qConsulta.Next;
  end;
  tTemporal.Post;
  tTemporal.ApplyUpdates;
  tTemporal.CommitUpdates;
  qConsulta.Close;
  with tTemporal do
  begin
    Close;
    DatabaseName := 'Temp';
    TableName := 'RESERVA';
    dbgCantidadDisponible.DataSource := dsTemporal;
    Filtered := True;
    Filter := 'COD_CATALOGO = ' + dbgMateriales.columns[0].Field.AsString;
    Open;
    Edit;
  end;
end;





procedure TfRequisicionMateriales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if CancelarCierre = True then
  begin
    Action := caNone;
    CancelarCierre := False;
  end
  else begin
    tTemporal.Close;
    tTemporal.Free;
  end;
end;

procedure TfRequisicionMateriales.qAlmacenAfterScroll(DataSet: TDataSet);
// AL CAMBIAR DE ALMACEN
begin
if qBodega.Active then qBodega.close;

qBodega.open;

  if dblcAlmacen.Focused then
  Begin
    qCOM_M_REQUISICION_MOVI.First;
    while not qCOM_M_REQUISICION_MOVI.Eof do
    begin
      CodigosMateriales.Add(qCOM_M_REQUISICION_MOVICOD_CATALOGO.AsString);
      qCOM_M_REQUISICION_MOVI.Next;
    end;
    CrearTablaReserva;
    llenarTablareserva;
  end;
end;

procedure TfRequisicionMateriales.qCIASAfterScroll(DataSet: TDataSet);
begin
  if dblcCIAS.Focused then
  Begin
    qCOM_M_REQUISICION_MOVI.First;
    while not qCOM_M_REQUISICION_MOVI.Eof do
    begin
      CodigosMateriales.Add(qCOM_M_REQUISICION_MOVICOD_CATALOGO.AsString);
      qCOM_M_REQUISICION_MOVI.Next;
    end;
    CrearTablaReserva;
    llenarTablareserva;
  end;
end;


//**********************Validacion de Datos*************************************
procedure  TfRequisicionMateriales.ValidarDatos;
VAR
Error: boolean;
Begin
error:= False;
begin
VALOR_CAMBIO_Reserva:= dbgCantidadDisponible.Columns[5].Field.Asinteger;
VALOR_CAMBIO_dispon:=  dbgCantidadDisponible.Columns[4].Field.Asinteger;

end;
if VALOR_CAMBIO_Reserva > VALOR_CAMBIO_dispon THEN
   begin
   error:=true;
   tTemporal.Edit;
   dbgCantidadDisponible.Columns[5].Field.Asinteger:= valor_reserva_actual;
   dbgCantidadDisponible.REFRESH;
   raise Exception.Create('La cantidad reservada no puede superar la cantidad disponible en la bodega');
   end;
if  (valor_reserva_actual - VALOR_CAMBIO_Reserva)>qCOM_M_REQUISICION_MOVI.FieldByName('CANTIDAD_SOLI_AUTO').AsInteger-qCOM_M_REQUISICION_MOVI.FieldByName('CANTIDAD_INVEN_ALMA_RES').AsInteger then
    begin
    error:= true;
    tTemporal.Edit;
    dbgCantidadDisponible.Columns[5].Field.Asinteger:= valor_reserva_actual;
    dbgCantidadDisponible.REFRESH;
    raise Exception.Create('La cantidad reservada no puede superar la cantidad solicitada por la odt hija');
end;
    IF error = false THEN
    begin
         dbgCantidadDisponible.Columns[5].Field.Asinteger:= (dbgCantidadDisponible.Columns[5].Field.Asinteger + valor_reserva_actual - oldReserva);
    end;
end;


procedure TfRequisicionMateriales.btnCancelarClick(Sender: TObject);
//CANCELA LA REQUISICION
begin
 close;
end;

procedure TfRequisicionMateriales.dbgMaterialesEditButtonClick(
  Sender: TObject);

// ESTE ES EL PROCEDIMIENTO PARA AGREGAR ELEMENTOS A LA REQUISICION, SE GENERA CUANDO DAMOS + EN EL  TDBNAVIGATOR
var i:integer;
QCONSULTA:TQUERY;
contador: integer;
consulta: string;
NombreUsuario: STRING;
RENG:INTEGER;
HAYTRANSFORMADOR:BOOLEAN;
CONCRETO:BOOLEAN;
METALICO:BOOLEAN;
MADERA: BOOLEAN;
AceiteDielectrico: boolean;

begin
try

  fBuscaMaterialRequisicion := tfBuscaMaterialRequisicion.Create(Application);
  fBuscaMaterialRequisicion.qPresMate.CLOSE;
  fOdturbanarural.qPresMate.first;
  contador := 0;
  consulta := 'WHERE CODIGOMATERIAL IN (';
  while not fOdturbanarural.qPresMate.Eof do
  begin
    if (fOdturbanarural.qPresMateCANTIDADSOLICITADA.AsFloat > 0) and (qCOM_M_REQUISICION_MOVI.Locate('CODIGOMATERIAL',fOdturbanarural.qPresMateCODIGOMATERIAL.AsFloat,[loCaseInsensitive]) = FALSE)  then
    begin
      consulta:= consulta + fOdturbanarural.qPresMateCODIGOMATERIAL.AsSTRING + ',';
      contador:=contador + 1
    END;
    fOdturbanarural.qPresMate.Next;
  end;
  If contador <> 0 then
  begin
    qAlmacen.close;
    qAlmacen.open;
    consulta := (copy(consulta,1,(length(consulta) -1)))+ ')';
    fBuscaMaterialRequisicion.qPresMate.SQL.Add(consulta);
    fBuscaMaterialRequisicion.qPresMate.SQL.Add(' ORDER BY CODIGOMATERIAL');
    fBuscaMaterialRequisicion.qPresMate.Open;
    if fBuscaMaterialRequisicion.ShowModal = mrOk then
    begin
       if fBuscaMaterialRequisicion.DBGridBuscarMaterial.SelectedRows.Count>0 then
       begin
         AGREGARMATERIAL:= TRUE;
         Madera:=false;
         Metalico:=false;
         Concreto:=false;
         HAYTRANSFORMADOR:= FALSE;
         for i:=0 to fBuscaMaterialRequisicion.DBGridBuscarMaterial.SelectedRows.Count-1 do
         BEGIN
           fBuscaMaterialRequisicion.qPresmate.BookMark:=fBuscaMaterialRequisicion.DBGridBuscarMaterial.SelectedRows.Items[i];
           qConsulta := TQuery.Create(Application);
           qConsulta.DatabaseName := 'BaseDato';
           qConsulta.SQL.Add('SELECT COD_TIPO, COD_GRUPO, COD_SUBGRUPO, CATALOGO_DESCRI FROM '+EsquemaAlmacen+'com_s_Catalogo'+DBLink+' WHERE COD_CATALOGO = ' + fBuscaMaterialRequisicion.qPresMateCODIGOMATERIAL.ASSTRING );
           qConsulta.Open;
           IF (qConsulta.Fields[0].AsSTRING ='01') AND (qConsulta.Fields[1].AsSTRING ='070') THEN
              HAYTRANSFORMADOR:= TRUE;
           IF ((qConsulta.Fields[0].AsSTRING ='01') AND (qConsulta.Fields[1].AsSTRING ='025') AND (qConsulta.Fields[2].AsSTRING ='05'))
              OR ((qConsulta.Fields[0].AsSTRING ='02') AND (qConsulta.Fields[1].AsSTRING ='105') AND (qConsulta.Fields[2].AsSTRING ='02')) THEN
              CONCRETO :=TRUE;
           IF ((qConsulta.Fields[0].AsSTRING ='01') AND (qConsulta.Fields[1].AsSTRING ='025') AND (qConsulta.Fields[2].AsSTRING ='10'))
              OR ((qConsulta.Fields[0].AsSTRING ='02') AND (qConsulta.Fields[1].AsSTRING ='105') AND (qConsulta.Fields[2].AsSTRING ='04')) THEN
              MADERA :=TRUE;
           IF ((qConsulta.Fields[0].AsSTRING ='01') AND (qConsulta.Fields[1].AsSTRING ='025') AND (qConsulta.Fields[2].AsSTRING ='15')) THEN
              METALICO :=TRUE;
           IF ((qConsulta.Fields[0].AsSTRING ='01') AND (qConsulta.Fields[1].AsSTRING ='080') AND (qConsulta.Fields[2].AsSTRING ='01') AND (AnsiPos('ACEITE', qConsulta.Fields[3].AsSTRING) >0)) THEN
              AceiteDielectrico:= TRUE;
           QCONSULTA.CLOSE;
           QCONSULTA.FREE;
         END;

         qcom_m_requisicion_movi.First;
         while not qcom_m_requisicion_movi.Eof do
         BEGIN
           qConsulta := TQuery.Create(Application);
           qConsulta.DatabaseName := 'BaseDato';
           qConsulta.SQL.Add('SELECT COD_TIPO, COD_GRUPO, COD_SUBGRUPO,CATALOGO_DESCRI FROM '+EsquemaAlmacen+'com_s_Catalogo'+DBLink+' WHERE COD_CATALOGO = ' + qCOM_M_REQUISICION_MOVICOD_CATALOGO.asstring);
           qConsulta.Open;
           IF (qConsulta.Fields[0].AsSTRING ='01') AND (qConsulta.Fields[1].AsSTRING ='070') THEN
              HAYTRANSFORMADOR:= TRUE;
           IF ((qConsulta.Fields[0].AsSTRING ='01') AND (qConsulta.Fields[1].AsSTRING ='025') AND (qConsulta.Fields[2].AsSTRING ='05'))
              OR ((qConsulta.Fields[0].AsSTRING ='02') AND (qConsulta.Fields[1].AsSTRING ='105') AND (qConsulta.Fields[2].AsSTRING ='02')) THEN
              CONCRETO :=TRUE;
           IF ((qConsulta.Fields[0].AsSTRING ='01') AND (qConsulta.Fields[1].AsSTRING ='025') AND (qConsulta.Fields[2].AsSTRING ='10'))
              OR ((qConsulta.Fields[0].AsSTRING ='02') AND (qConsulta.Fields[1].AsSTRING ='105') AND (qConsulta.Fields[2].AsSTRING ='04')) THEN
              MADERA :=TRUE;
           IF ((qConsulta.Fields[0].AsSTRING ='01') AND (qConsulta.Fields[1].AsSTRING ='025') AND (qConsulta.Fields[2].AsSTRING ='15')) THEN
              METALICO :=TRUE;
           IF ((qConsulta.Fields[0].AsSTRING ='01') AND (qConsulta.Fields[1].AsSTRING ='080') AND (qConsulta.Fields[2].AsSTRING ='01') AND (AnsiPos('ACEITE', qConsulta.Fields[3].AsSTRING) >0)) THEN
              AceiteDielectrico:= TRUE;
           QCONSULTA.CLOSE;
           QCONSULTA.FREE;
           qcom_m_requisicion_movi.Next;
         END;
         IF (fBuscaMaterialRequisicion.DBGridBuscarMaterial.SelectedRows.Count>1) AND (HAYTRANSFORMADOR =TRUE)  THEN
         BEGIN
              Application.MessageBox('Debe realizar la requisición del transformador por separado.', 'Advertencia', MB_OK + MB_ICONWARNING);
              EXIT;
         END
         else
         begin
           IF ((MADERA=TRUE) AND (CONCRETO=TRUE)) OR ((MADERA =TRUE) AND (METALICO= TRUE)) OR ((CONCRETO =TRUE) AND (METALICO= TRUE)) OR ((MADERA =TRUE) AND (METALICO= TRUE) AND (CONCRETO = TRUE))  THEN
           BEGIN
             Application.MessageBox('No se puede hacer una requisicion con postes de diferente Material.', 'Advertencia', MB_OK + MB_ICONWARNING);
             EXIT;
           END
           else
           begin
             IF (fBuscaMaterialRequisicion.DBGridBuscarMaterial.SelectedRows.Count>1) AND (AceiteDielectrico =TRUE)  THEN
             BEGIN
               Application.MessageBox('Debe realizar la requisición de Aceite Dielectrico por separado.', 'Advertencia', MB_OK + MB_ICONWARNING);
               EXIT;
             END
             else
             begin
               if creacion = false then
               Begin
                 qConsulta := TQuery.Create(Application);
                 qConsulta.DatabaseName := 'BaseDato';
                 qConsulta.SQL.Add('SELECT MAX(RENGLON) FROM '+EsquemaAlmacen+'COM_M_REQUISICION_MOVI'+DBLink);
                 qConsulta.SQL.Add('WHERE CIAS_CIAS = ' + qCOM_M_REQUISICIONCIAS_CIAS.AsString);     //FODTURBANARURAL.qRequisicionesEMPRESA.AsSTRING);
                 qConsulta.SQL.Add('AND VIGENCIA = ' + qCOM_M_REQUISICIONVIGENCIA.ASSTRING);   //FODTURBANARURAL.qRequisicionesVIGENCIA.AsSTRING);
                 qConsulta.SQL.Add('AND COD_REQUISICION = ' + qCOM_M_REQUISICIONCOD_REQUISICION.ASSTRING); //FODTURBANARURAL.qRequisicionesCODIGOREQUISICION.AsSTRING);
                 qConsulta.Open;
                 RENG:= qConsulta.Fields[0].AsINTEGER;
                 qConsulta.Close;
                 QCONSULTA.FREE;
               end
               else
               Begin
                 qcom_m_requisicion_movi.First;
                 while not  qcom_m_requisicion_movi.Eof do
                 Begin
                   if qcom_m_requisicion_movi.FieldByName('renglon').asinteger > reng then
                     reng:= qcom_m_requisicion_movi.FieldByName('renglon').asinteger;
                   qcom_m_requisicion_movi.next
                 End;
               End;
               for i:=0 to fBuscaMaterialRequisicion.DBGridBuscarMaterial.SelectedRows.Count-1 do
               begin
                 fBuscaMaterialRequisicion.qPresmate.BookMark:=fBuscaMaterialRequisicion.DBGridBuscarMaterial.SelectedRows.Items[i];
                 CodigosMateriales.Add(fBuscaMaterialRequisicion.qPresMateCODIGOMATERIAL.Asstring);
                 qcom_m_requisicion_movi.insert;
                 qCOM_M_REQUISICION_MOVICIAS_CIAS.AsInteger := qCOM_M_REQUISICIONCIAS_CIAS.AsInteger;
                 qCOM_M_REQUISICION_MOVIVIGENCIA.AsInteger := qCOM_M_REQUISICIONVIGENCIA.AsInteger;
                 { Cambio Error del codigo por concurrencia
                 //qCOM_M_REQUISICION_MOVICOD_REQUISICION.AsFloat := qCOM_M_REQUISICIONCOD_REQUISICION.AsFloat;  }
                 if creacion = false then qCOM_M_REQUISICION_MOVICOD_REQUISICION.AsFloat := qCOM_M_REQUISICIONCOD_REQUISICION.AsFloat;
                 qCOM_M_REQUISICION_MOVICOD_CATALOGO.ASFLOAT:= fBuscaMaterialRequisicion.qPresMateCODIGOMATERIAL.AsFloat;
                 qcom_m_requisicion_movicodigomaterial.asfloat:= fBuscaMaterialRequisicion.qPresMateCODIGOMATERIAL.AsFloat;
                 qcom_m_requisicion_moviNOMBREMATERIAL.ASSTRING:= fBuscaMaterialRequisicion.qPresMateNOMBREMATERIAL.AssTRING;
                 qcom_m_requisicion_movinombreUNIDAD.ASSTRING:= fBuscaMaterialRequisicion.qPresMateCODIGOUNIDAD.AssTRING;
                 fOdturbanarural.qPresMate.Locate('CODIGOMATERIAL',fBuscaMaterialRequisicion.qPresMateCODIGOMATERIAL.AsFloat,[loCaseInsensitive]);
                 qCOM_M_REQUISICION_MOVICANTIDAD_SOLI.asfloat:=fOdturbanarural.qPresMateCANTIDADSOLICITADA.asfloat - fOdturbanarural.qPresMateCANTIDADRESERVADA.ASFLOAT;
                 qCOM_M_REQUISICION_MOVICANTIDAD_SOLI_AUTO.asfloat:= fOdturbanarural.qPresMateCANTIDADSOLICITADA.asfloat - fOdturbanarural.qPresMateCANTIDADRESERVADA.ASFLOAT;
                 qCOM_M_REQUISICION_MOVIAUTORIZA_JEFESN.Asstring:= '';
                 qCOM_M_REQUISICION_MOVIRENGLON.ASINTEGER:= RENG + 1;
                 qCOM_M_REQUISICION_MOVIESTADO.ASSTRING := 'VIGENTE';
                 qConsulta := TQuery.Create(Application);
                 qConsulta.DatabaseName := 'BaseDato';
                 qConsulta.SQL.Add('SELECT LOGINUSUARIO FROM USUARIO');
                 qConsulta.SQL.Add('WHERE CODIGOUSUARIO = ' + IntToStr(VarCodigoUsuario));
                 qConsulta.Open;
                 NombreUsuario := qConsulta.Fields[0].AsString;
                 qConsulta.Close;
                 QCONSULTA.FREE;
                 qCOM_M_REQUISICION_MOVIUSUARIO_CREA.AsString := NombreUsuario;
                 qCOM_M_REQUISICION_MOVIFECHA_CREA.Value := Now;
                 RENG:= RENG+1;
               end;
             end;
             IF  CREACION=FALSE THEN
             BEGIN
               qCOM_M_REQUISICION_MOVI.Post;
               qCOM_M_REQUISICION_MOVI.ApplyUpdates;
               qCOM_M_REQUISICION_MOVI.CommitUpdates;
               qCOM_M_REQUISICION_MOVI.CLOSE;
               qCOM_M_REQUISICION_MOVI.ParamByName('CIAS_CIAS').AsFloat := fOdturbanarural.qRequisicionesEMPRESA.AsFloat;
               qCOM_M_REQUISICION_MOVI.ParamByName('VIGENCIA').AsFloat := fOdturbanarural.qRequisicionesVIGENCIA.AsFloat;
               qCOM_M_REQUISICION_MOVI.ParamByName('CODIGOODT').AsFloat := fOdturbanarural.qODTHijaCODIGOODT.AsFloat;
               qCOM_M_REQUISICION_MOVI.ParamByName('CONSECUTIVO').AsFloat := fOdturbanarural.qODTHijaCONSECUTIVO.AsFloat;
               qCOM_M_REQUISICION_MOVI.ParamByName('COD_REQUISICION').AsFloat := fOdturbanarural.qRequisicionesCODIGOREQUISICION.AsFloat;
               qCOM_M_REQUISICION_MOVI.Open;
               qCOM_M_REQUISICION_MOVI.Edit;
             END;
             qCOM_M_REQUISICION_MOVI.FIRST;
             dblcAlmacen.SetFocus;
             IF BodegaEscogida = TRUE THEN
             BEGIN
               if dblcBodega.Focused then
               BEGIN
                 qcom_m_requisicion_movi.first;
                 while not qcom_m_requisicion_movi.eof do
                 begin
                   qcom_m_requisicion_movi.edit;
                   qcom_m_requisicion_movi.FieldByName('CANTIDAD_INVEN_ALMA_RES').asfloat:= 0;
                   qcom_m_requisicion_movi.next;
                 end;
                 marca:= false;
               END;
               if ttemporal.Active = false then
               Begin
                 CrearTablaReserva;
               end
               else
               Begin
                 codigosMateriales.clear;
                 qCOM_M_REQUISICION_MOVI.First;
                 while not qCOM_M_REQUISICION_MOVI.Eof do
                 begin
                   if not ttemporal.locate('COD_CATALOGO', qCOM_M_REQUISICION_MOVICOD_CATALOGO.ASFLOAT, [loCaseInsensitive])  then
                      codigosMateriales.Add(qCOM_M_REQUISICION_MOVICOD_CATALOGO.AsString);
                   qCOM_M_REQUISICION_MOVI.Next;
                 end;
               end;
               CrearTablaReserva;
               llenarTablaReserva;
             END;
           end;
         end;
       end;
    end;
  end
  else
  begin
    Application.MessageBox('No se pueden Agregar mas Elementos', 'Advertencia', MB_OK + MB_ICONWARNING);
  end;
  Except
    fBuscaMaterialRequisicion.free;
end;
fBuscaMaterialRequisicion.free;
end;


procedure TfRequisicionMateriales.dblcNegocioSolicitanteClick(
  Sender: TObject);
begin
qAreaSolicitante.Close;
qAreaSolicitante.ParamByName('NEGO_NEGO').AsFloat:= qCOM_M_REQUISICIONNEGO_NEGO.AsFloat;
//qAreaSolicitante.ParamByName('AREA_CIAS').AsFloat:= qCOM_M_REQUISICIONCIAS_CIAS.AsFloat;
dbeAreaSolicitante.Text:= '';
qAreaSolicitante.Open;
end;

procedure TfRequisicionMateriales.dblcNegocioEjecutoraClick(
  Sender: TObject);
begin
qAreaEjecutora.Close;
QAreaEjecutora.ParamByName('NEGO_NEGO').AsFloat:= qCOM_M_REQUISICIONNEGO_NEGO_EJE.AsFloat;
//QAreaEjecutora.ParamByName('AREA_CIAS').AsFloat:= qCOM_M_REQUISICIONCIAS_CIAS_EJE.AsFloat;
dbeAreaDestino.Text:= '';
qAreaEjecutora.Open;
qceco.close;
QAreaEjecutora.ParamByName('NEGO_NEGO').AsFloat:=  qCOM_M_REQUISICIONNEGO_NEGO_EJE.AsFloat;
qceco.open;
end;

procedure TfRequisicionMateriales.dblcAreaSolicitanteClick(
  Sender: TObject);
VAR
QCONSULTA: TQUERY;
CONTA: INTEGER;
begin
  qConsulta := TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.SQL.Clear;
  qConsulta.SQL.Add('SELECT area_area');
  qConsulta.SQL.Add('FROM '+EsquemaAlmacen+'INV_S_ALMACEN'+DBLink);
  qConsulta.SQL.Add('WHERE area_area is not null');
  qConsulta.Open;
  qconsulta.first;
  QALMACEN.SQL.Clear;
  qalmacen.sql.add(QueryAlmacen);
  CONTA:= 0;
  while not qconsulta.Eof do
  begin
      if qCOM_M_REQUISICIONAREA_AREA.AsString = qconsulta.fields[0].asstring then
      begin
        qalmacen.sql.add('and area_area = ' + qCOM_M_REQUISICIONAREA_AREA.AsString);
        CONTA:= CONTA +1;
      end;
      qconsulta.Next;
  end;
  IF CONTA = 0 THEN
  qalmacen.sql.add('and area_area IS NULL');
  QALMACEN.ParamByName('CIAS_CIAS').AsFloat:= qCOM_M_REQUISICIONCIAS_CIAS.ASFLOAT;     //FOdtUrbanaRural.qRequisicionesEMPRESA.AsFloat;
  QALMACEN.OPEN;
  QALMACEN.close;
  qConsulta.Close;
  QCONSULTA.Free;
end;

procedure TfRequisicionMateriales.dbeNegocioSolicitanteExit(
  Sender: TObject);
begin
qAreaSolicitante.Close;
qAreaSolicitante.ParamByName('NEGO_NEGO').AsFloat:= qCOM_M_REQUISICIONNEGO_NEGO.AsFloat;
//qAreaSolicitante.ParamByName('AREA_CIAS').AsFloat:= qCOM_M_REQUISICIONCIAS_CIAS.AsFloat;
dbeAreaSolicitante.Text:= '';
qAreaSolicitante.Open;
end;

procedure TfRequisicionMateriales.dbeNegocioDestinoExit(Sender: TObject);
begin
qAreaEjecutora.Close;
QAreaEjecutora.ParamByName('NEGO_NEGO').AsFloat:= qCOM_M_REQUISICIONNEGO_NEGO_EJE.AsFloat;
//QAreaEjecutora.ParamByName('AREA_CIAS').AsFloat:= qCOM_M_REQUISICIONCIAS_CIAS_EJE.AsFloat;
dbeAreaDestino.Text:= '';
qAreaEjecutora.Open;
end;

procedure TfRequisicionMateriales.qNegocioSolicitanteAfterInsert(
  DataSet: TDataSet);
begin
qAreaSolicitante.Close;
qAreaSolicitante.ParamByName('NEGO_NEGO').AsFloat:= qCOM_M_REQUISICIONNEGO_NEGO.AsFloat;
//qAreaSolicitante.ParamByName('AREA_CIAS').AsFloat:= qCOM_M_REQUISICIONCIAS_CIAS.AsFloat;
dbeAreaSolicitante.Text:= '';
qAreaSolicitante.Open;
end;

procedure TfRequisicionMateriales.dbeAreaSolicitanteExit(Sender: TObject);
begin
 dblcAreaSolicitanteClick(NIL);
end;

procedure TfRequisicionMateriales.NotebookPageChanged(Sender: TObject);
begin
  if Notebook.PageIndex = 1 then
  begin
    if  (dblcNegocioSolicitante.Text = '') or
    (dblcAreaSolicitante.Text = '') or   //(dblcEmpleado.Text = '') or
     (dblcNegocioEjecutora.Text = '') or
    (dblcAreaEjecutora.Text = '') or (dblcNovedad.Text = '') or
    (cmbResponsable.Text = '') or (dbmMotivo.Text = '') or (dbeVigencia.Text = '') then
    begin
      Notebook.PageIndex := 0;
      Application.MessageBox('Todos los valores son requeridos', 'Advertencia', MB_OK + MB_ICONWARNING);
      CancelarCierre := True;
      Exit;
    end
    else
    Begin
      If (dbeNovedad.Text = '52') and (econtrato.Text = '') then
      begin
        Notebook.PageIndex := 0;
        Application.MessageBox('Para la novedad 52 es necesario tener el numero de contrato.', 'Advertencia', MB_OK + MB_ICONWARNING);
        CancelarCierre := True;
        Exit;
      end;
      btnAceptar.Visible:= true;
    end;
  end;
end;


procedure TfRequisicionMateriales.dbgCantidadDisponibleExit(
  Sender: TObject);
// AL SALIR DE LA TABLA DE RESERVA SE HACE LA VALIDACION DE LA INFORMACION SUMINISTRADA
var
NumeroRegistro:integer;
valorRESERVA : integer;
VALORBODEGA: INTEGER;
qconsulta: tquery;
qconsulta2: tquery;
ValorAutorizado: integer;
catal:string;
SumaReserva:integer;
begin
  MoviendoFila:= true;
  ValorAutorizado:= dbgMateriales.Columns[4].Field.Asinteger;
  ttemporal.Post;
  ttemporal.ApplyUpdates;
  ttemporal.CommitUpdates;
  NumeroRegistro:= ttemporal.RecNo;
  catal:= qCOM_M_REQUISICION_MOVICOD_CATALOGO.AsString;
  valorRESERVA:= dbgCantidadDisponible.Columns[5].Field.AsInteger;
  valorBODEGA:= dbgCantidadDisponible.Columns[4].Field.AsInteger;
  qConsulta := TQuery.Create(Application);
  qConsulta.DatabaseName := 'Temp';
  qConsulta.SQL.Clear;
  qConsulta.SQL.Add('SELECT sum(CANTIDAD_RESERVADA)');
  qConsulta.SQL.Add('FROM RESERVA');
  qConsulta.SQL.Add('WHERE COD_CATALOGO = ' + catal );
  qConsulta.Open;
  SumaReserva:=  qconsulta.fields[0].asinteger ;
  qConsulta.Close;
  Ttemporal.first;

  tTEMPORAL.MoveBy(NumeroRegistro-1);
  if valorBODEGA < valorRESERVA THEN
  begin
     tTemporal.Edit;
     dbgMateriales.Columns[5].Field.AsFloat:= qconsulta.fields[0].asFloat;
     dbgCantidadDisponible.Columns[5].Field.Asinteger:= 0;
     ttemporal.Post;
     ttemporal.ApplyUpdates;
     ttemporal.CommitUpdates;
     qCOM_M_REQUISICION_MOVI.edit;
     qConsulta2 := TQuery.Create(Application);
     qConsulta2.DatabaseName := 'Temp';
     qConsulta2.SQL.Clear;
     qConsulta2.SQL.Add('SELECT sum(CANTIDAD_RESERVADA)');
     qConsulta2.SQL.Add('FROM RESERVA');
     qConsulta2.SQL.Add('WHERE COD_CATALOGO = ' + catal );
     qConsulta2.Open;
     dbgMateriales.Columns[5].Field.asfloat:= qconsulta2.fields[0].asFloat;
     dbgCantidadDisponible.REFRESH;
     QCONSULTA.Free;
     MoviendoFila:= false;
     Application.MessageBox('La cantidad reservada no puede superar la cantidad disponible en la bodega.', 'Advertencia', MB_OK + MB_ICONWARNING);
     raise Exception.Create('La cantidad reservada no puede superar la cantidad disponible en la bodega');
  end;
  if SumaReserva > ValorAutorizado then
  begin
      tTemporal.Edit;
      dbgCantidadDisponible.Columns[5].Field.Asinteger:= 0;
      ttemporal.Post;
      ttemporal.ApplyUpdates;
      ttemporal.CommitUpdates;
      qCOM_M_REQUISICION_MOVI.edit;
      qConsulta2 := TQuery.Create(Application);
      qConsulta2.DatabaseName := 'Temp';
      qConsulta2.SQL.Clear;
      qConsulta2.SQL.Add('SELECT sum(CANTIDAD_RESERVADA)');
      qConsulta2.SQL.Add('FROM RESERVA');
      qConsulta2.SQL.Add('WHERE COD_CATALOGO = ' + catal );
      qConsulta2.Open;
      dbgMateriales.Columns[5].Field.asfloat:= qconsulta2.fields[0].asFloat;
      dbgCantidadDisponible.REFRESH;
      QCONSULTA.Free;
      MoviendoFila:= false;
      Application.MessageBox('La cantidad reservada no puede superar la cantidad solicitada por la odt hija.', 'Advertencia', MB_OK + MB_ICONWARNING);
      raise Exception.Create('La cantidad reservada no puede superar la cantidad solicitada por la odt hija');
  end;
  qCOM_M_REQUISICION_MOVI.edit;
  qConsulta.Open;
  dbgMateriales.Columns[5].Field.AsFloat:= qconsulta.fields[0].asFloat;
  QCONSULTA.Free;
  ttemporal.edit;
  MoviendoFila:= false;
end;


procedure TfRequisicionMateriales.tTemporalAfterScroll(DataSet: TDataSet);
var
qconsultaR: tquery;
begin
if AceptarRequisicion = false then
begin
  if marca = true then
  BEGIN
    if MoviendoFila= false then
      dbgCantidadDisponibleExit(nil);
  END;
end;
end;

procedure TfRequisicionMateriales.dblcAlmacenClick(Sender: TObject);
begin
ALMACENESCOGIDO:= TRUE;
dblcAlmacen.Hint:= dblcAlmacen.Text;
end;


procedure TfRequisicionMateriales.dblcAlmacenEnter(Sender: TObject);
begin
ALMACENESCOGIDO:= TRUE;
end;

procedure TfRequisicionMateriales.VerificarAutorizacion;
begin
   if qCOM_M_REQUISICION_MOVICANTIDAD_SOLI.asfloat < qCOM_M_REQUISICION_MOVICANTIDAD_SOLI_AUTO.asfloat then
   begin
     qCOM_M_REQUISICION_MOVI.edit;
     dbgMateriales.Columns[4].Field.asfloat:= 0;
     dbgMateriales.Columns[5].Field.asfloat:= 0;
     raise Exception.Create('La cantidad Autorizada no puede ser mayor que la cantidad Solicitada');
   end;
end;


procedure TfRequisicionMateriales.dbgMaterialesExit(Sender: TObject);
begin
VerificarAutorizacion;
end;

procedure TfRequisicionMateriales.qCOM_M_REQUISICION_MOVIBeforeScroll(
  DataSet: TDataSet);
begin
VerificarAutorizacion;
end;

procedure TfRequisicionMateriales.qNovedadAfterScroll(DataSet: TDataSet);
begin
 dblcNovedad.Hint:=   qNovedadNOVEDAD_DESCRI.asstring;
end;



procedure TfRequisicionMateriales.qAreaEjecutoraBeforeScroll(
  DataSet: TDataSet);
begin
  if Cambiar_Area = true then
  qCOM_M_REQUISICIONCECO_CECO_EJE.ASSTRING:= qAreaEjecutora.fieldbyname('AREA_CECOS').ASSTRING;
end;

procedure TfRequisicionMateriales.qNegocioEjecutoraAfterScroll(
  DataSet: TDataSet);
begin
qceco.close;
QAreaEjecutora.ParamByName('NEGO_NEGO').Asstring:=  qCOM_M_REQUISICIONNEGO_NEGO_EJE.Asstring;
qceco.open;
end;

procedure TfRequisicionMateriales.dblcAreaEjecutoraEnter(Sender: TObject);
begin
  Cambiar_Area:= true;
end;

procedure TfRequisicionMateriales.qCOM_M_REQUISICION_MOVIBeforeDelete(
  DataSet: TDataSet);
Var
qConsulta:Tquery;
valor: integer;
begin
if creacion = false then
Begin
  qConsulta := TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.SQL.Add('SELECT count(*) FROM '+EsquemaAlmacen+'COM_M_reserva_inventario'+DBLink);
  qConsulta.SQL.Add('WHERE VIGENCIA = ' + qCOM_M_REQUISICIONVIGENCIA.AsString);
  qConsulta.SQL.Add('AND COD_REQUISICION = ' + qCOM_M_REQUISICION_MOVICOD_REQUISICION.ASSTRING);
  qConsulta.SQL.Add('AND COD_CATALOGO = ' + qCOM_M_REQUISICION_MOVICOD_CATALOGO.AsString);
  qConsulta.SQL.Add('AND RENGLON = ' + qCOM_M_REQUISICION_MOVIRENGLON.AsString);
  qConsulta.Open;
  valor:= qConsulta.fields[0].asinteger;
  qConsulta.free;
  If VAlor >0 then
  Begin
    qConsulta := TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.SQL.Add('delete FROM '+EsquemaAlmacen+'COM_M_reserva_inventario'+DBLink);
    qConsulta.SQL.Add('WHERE VIGENCIA = ' + qCOM_M_REQUISICIONVIGENCIA.AsString);
    qConsulta.SQL.Add('AND COD_REQUISICION = ' + qCOM_M_REQUISICION_MOVICOD_REQUISICION.ASSTRING);
    qConsulta.SQL.Add('AND COD_CATALOGO = ' + qCOM_M_REQUISICION_MOVICOD_CATALOGO.AsString);
    qConsulta.SQL.Add('AND RENGLON = ' + qCOM_M_REQUISICION_MOVIRENGLON.AsString);
    qConsulta.ExecSQL;
  End;
end
else
Begin
  if qCOM_M_RESERVA_INVENTARIO.Locate('cod_catalogo', qCOM_M_REQUISICION_MOVICOD_CATALOGO.AsFloat, [loCaseInsensitive]) = True then
     qCOM_M_RESERVA_INVENTARIO.delete;
   {
  qCOM_M_RESERVA_INVENTARIO.First
  while not qCOM_M_RESERVA_INVENTARIO.Eof then
  Begin

    qCOM_M_RESERVA_INVENTARIO.next;
  End;}
End;
end;


procedure TfRequisicionMateriales.Table1AfterScroll(DataSet: TDataSet);
var
qconsultaR: tquery;
begin
if AceptarRequisicion = false then
begin
  if marca = true then
  BEGIN
    if MoviendoFila= false then
      dbgCantidadDisponibleExit(nil);
  END;
end;
end;

procedure TfRequisicionMateriales.eContratoExit(Sender: TObject);
var
qconsulta:tquery;
begin
  if eContrato.Text <> '' then
  Begin
    qConsulta := TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qconsulta.sql.Add('select count(*) as contrato from '+EsquemaContratos+'SIO_CONTRATOS'+DBLink+' where codigo_contrato ='''+eContrato.Text+''' and  control_contrato = ''EN''');
    qconsulta.open;
    if qconsulta.FieldByName('contrato').asinteger= 0 then
    Begin
      qconsulta.free;
      eContrato.SetFocus;
      raise Exception.Create('El numero del contrato no es valido.');
    end
    else
    begin
      qconsulta.free;
    end;
  end;
end;

procedure TfRequisicionMateriales.qGE_TAUXILCalcFields(DataSet: TDataSet);
var
qConsulta:tquery;
begin
qConsulta := TQuery.Create(Application);
qConsulta.DatabaseName := 'BaseDato';
qconsulta.sql.Add('SELECT SUBSTR(AUXI_DESCRI,1,50) AS AUXI_DESCRI FROM GE_TAUXIL WHERE AUXI_AUXI = '+qGE_TAUXIL.fieldbyname('AUXI_AUXI').asstring );
qconsulta.open;
qGE_TAUXIL.fieldbyname('AUXI_DESCRI').asstring := qConsulta.fieldbyname('AUXI_DESCRI').asstring;
qconsulta.close;
qConsulta.free;
end;


//Desde Aqui Modificaciones para Zonas++++++++++++++++++++++++++++++++++++++++++++++++
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

procedure TfRequisicionMateriales.qCOM_M_REQUISICION_MOVIBeforeOpen(
  DataSet: TDataSet);
begin
qCOM_M_REQUISICION_MOVI.SQL.TEXT:=  'SELECT C.*, M.CODIGOMATERIAL FROM '+
                                    'ODTPRESMATE O, '+EsquemaAlmacen+'COM_M_REQUISICION_MOVI'+ DBLink+' C, MATERIALESSA M '+
                                    'WHERE C.CIAS_CIAS = :CIAS_CIAS '+
                                    'AND C.VIGENCIA = :VIGENCIA '+
                                    'AND C.COD_REQUISICION = :COD_REQUISICION '+
                                    'AND C.COD_CATALOGO = M.CODIGOMATERIALESSA '+
                                    'AND C.COD_CATALOGO = O.CODIGOMATERIAL '+
                                    'AND O.CODIGOODT = :CODIGOODT '+
                                    'AND O.CONSECUTIVO = :CONSECUTIVO '+
                                    'ORDER BY C.RENGLON ';

updCOM_M_REQUISICION_MOVI.ModifySQL.TEXT := 'update '+EsquemaAlmacen+'COM_M_REQUISICION_MOVI'+ DBLink+'  '+
                                      'set '+
                                      '  CIAS_CIAS = :CIAS_CIAS, '+
                                      '  VIGENCIA = :VIGENCIA, '+
                                      '  COD_REQUISICION = :COD_REQUISICION, '+
                                      '  COD_CATALOGO = :COD_CATALOGO, '+
                                      '  ACLARACIONES = :ACLARACIONES, '+
                                      '  CANTIDAD_SOLI = :CANTIDAD_SOLI, '+
                                      '  CANTIDAD_SOLI_AUTO = :CANTIDAD_SOLI_AUTO, '+
                                      '  AUTORIZA_JEFESN = :AUTORIZA_JEFESN, '+
                                      '  AUTORIZA_COMPRASN = :AUTORIZA_COMPRASN, '+
                                      '  CANTIDAD_INVEN_ALMA_RES = :CANTIDAD_INVEN_ALMA_RES, '+
                                      '  CANTIDAD_INVEN_CONTR_RES = :CANTIDAD_INVEN_CONTR_RES, '+
                                      '  CANTIDAD_COMPRA = :CANTIDAD_COMPRA, '+
                                      '  CANTIDAD_INVEN_ALMA_EJE = :CANTIDAD_INVEN_ALMA_EJE, '+
                                      '  CANTIDAD_INVEN_CONTR_EJE = :CANTIDAD_INVEN_CONTR_EJE, '+
                                      '  CANTIDAD_COMPRA_EJE = :CANTIDAD_COMPRA_EJE, '+
                                      '  ENRUTADA_COMPRASN = :ENRUTADA_COMPRASN, '+
                                      '  ESTADO = :ESTADO, '+
                                      '  FECHA_CREA = :FECHA_CREA, '+
                                      '  USUARIO_CREA = :USUARIO_CREA, '+
                                      '  FECHA_MOD = :FECHA_MOD, '+
                                      '  USUARIO_MOD = :USUARIO_MOD, '+
                                      '  RENGLON = :RENGLON, '+
                                      '  CANTIDAD_FALTANTE = :CANTIDAD_FALTANTE, '+
                                      '  COD_UTILIZACION = :COD_UTILIZACION '+
                                      ' where '+
                                      '  CIAS_CIAS = :OLD_CIAS_CIAS and '+
                                      '  VIGENCIA = :OLD_VIGENCIA and '+
                                      '  COD_REQUISICION = :OLD_COD_REQUISICION and '+
                                      '  RENGLON = :OLD_RENGLON ';

updCOM_M_REQUISICION_MOVI.InsertSQL.Text:= 'insert into '+EsquemaAlmacen+'COM_M_REQUISICION_MOVI'+ DBLink+'  '+
                                           '   (CIAS_CIAS, VIGENCIA, COD_REQUISICION, COD_CATALOGO, ACLARACIONES, CANTIDAD_SOLI, '+
                                           '    CANTIDAD_SOLI_AUTO, AUTORIZA_JEFESN, AUTORIZA_COMPRASN, CANTIDAD_INVEN_ALMA_RES, '+
                                           '    CANTIDAD_INVEN_CONTR_RES, CANTIDAD_COMPRA, CANTIDAD_INVEN_ALMA_EJE, '+
                                           '    CANTIDAD_INVEN_CONTR_EJE, CANTIDAD_COMPRA_EJE, ENRUTADA_COMPRASN, ESTADO, '+
                                           '    FECHA_CREA, USUARIO_CREA, FECHA_MOD, USUARIO_MOD, RENGLON, CANTIDAD_FALTANTE, '+
                                           '    COD_UTILIZACION) '+
                                           ' values '+
                                           '   (:CIAS_CIAS, :VIGENCIA, :COD_REQUISICION, :COD_CATALOGO, :ACLARACIONES, '+
                                           '    :CANTIDAD_SOLI, :CANTIDAD_SOLI_AUTO, :AUTORIZA_JEFESN, :AUTORIZA_COMPRASN, '+
                                           '    :CANTIDAD_INVEN_ALMA_RES, :CANTIDAD_INVEN_CONTR_RES, :CANTIDAD_COMPRA, '+
                                           '    :CANTIDAD_INVEN_ALMA_EJE, :CANTIDAD_INVEN_CONTR_EJE, :CANTIDAD_COMPRA_EJE, '+
                                           '    :ENRUTADA_COMPRASN, :ESTADO, :FECHA_CREA, :USUARIO_CREA, :FECHA_MOD, '+
                                           '    :USUARIO_MOD, :RENGLON, :CANTIDAD_FALTANTE, :COD_UTILIZACION) ';

updCOM_M_REQUISICION_MOVI.DeleteSQL.Text:=  'delete from '+EsquemaAlmacen+'COM_M_REQUISICION_MOVI'+ DBLink+' '+
                                            'where '+
                                            '  CIAS_CIAS = :OLD_CIAS_CIAS and '+
                                            '  VIGENCIA = :OLD_VIGENCIA and '+
                                            '  COD_REQUISICION = :OLD_COD_REQUISICION and  '+
                                            '  RENGLON = :OLD_RENGLON ';
end;




procedure TfRequisicionMateriales.qCOM_M_RESERVA_INVENTARIOBeforeOpen(
  DataSet: TDataSet);
begin
qCOM_M_RESERVA_INVENTARIO.SQL.Text:=  'SELECT *   '+
                                      'FROM '+EsquemaAlmacen+'COM_M_RESERVA_INVENTARIO'+ DBLink+'  '+
                                      'WHERE CIAS_CIAS = :CIAS_CIAS  '+
                                      'AND VIGENCIA = :VIGENCIA  '+
                                      'AND COD_REQUISICION = :COD_REQUISICION  ';

updCOM_M_RESERVA_INVENTARIO.ModifySQL.text:=  'update '+EsquemaAlmacen+'COM_M_RESERVA_INVENTARIO'+ DBLink+'   '+
                                              'set  '+
                                              '  CIAS_CIAS = :CIAS_CIAS,  '+
                                              '  VIGENCIA = :VIGENCIA,  '+
                                              '  COD_REQUISICION = :COD_REQUISICION,  '+
                                              '  COD_CATALOGO = :COD_CATALOGO,  '+
                                              '  CIAS_CIAS_INVEN = :CIAS_CIAS_INVEN,  '+
                                              '  COD_ALMACEN_INVEN = :COD_ALMACEN_INVEN,  '+
                                              '  NEGO_NEGO_INVEN = :NEGO_NEGO_INVEN,  '+
                                              '  COD_BODEGA_INVEN = :COD_BODEGA_INVEN,  '+
                                              '  CANTIDAD_RESERVADA = :CANTIDAD_RESERVADA,  '+
                                              '  CANTIDAD_ENTREGADA = :CANTIDAD_ENTREGADA,  '+
                                              '  ESTADO = :ESTADO,  '+
                                              '  FECHA_CREA = :FECHA_CREA,  '+
                                              '  USUARIO_CREA = :USUARIO_CREA,  '+
                                              '  FECHA_MOD = :FECHA_MOD,  '+
                                              '  USUARIO_MOD = :USUARIO_MOD,  '+
                                              '  OPERACION = :OPERACION,  '+
                                              '  RENGLON = :RENGLON,  '+
                                              '  CANTIDAD_DEVUELTA = :CANTIDAD_DEVUELTA,  '+
                                              '  ACTUALIZA_RESERVASN = :ACTUALIZA_RESERVASN  '+
                                              'where  '+
                                              '  CIAS_CIAS = :OLD_CIAS_CIAS and  '+
                                              '  VIGENCIA = :OLD_VIGENCIA and  '+
                                              '  COD_REQUISICION = :OLD_COD_REQUISICION and  '+
                                              '  CIAS_CIAS_INVEN = :OLD_CIAS_CIAS_INVEN and  '+
                                              '  COD_ALMACEN_INVEN = :OLD_COD_ALMACEN_INVEN and  '+
                                              '  NEGO_NEGO_INVEN = :OLD_NEGO_NEGO_INVEN and  '+
                                              '  COD_BODEGA_INVEN = :OLD_COD_BODEGA_INVEN and  '+
                                              '  RENGLON = :OLD_RENGLON  ';

updCOM_M_RESERVA_INVENTARIO.InsertSQL.Text:=  'insert into '+EsquemaAlmacen+'COM_M_RESERVA_INVENTARIO'+ DBLink+'  '+
                                              '  (CIAS_CIAS, VIGENCIA, COD_REQUISICION, COD_CATALOGO, CIAS_CIAS_INVEN,  '+
                                              '   COD_ALMACEN_INVEN, NEGO_NEGO_INVEN, COD_BODEGA_INVEN, CANTIDAD_RESERVADA,  '+
                                              '   CANTIDAD_ENTREGADA, ESTADO, FECHA_CREA, USUARIO_CREA, FECHA_MOD, USUARIO_MOD,  '+
                                              '   OPERACION, RENGLON, CANTIDAD_DEVUELTA, ACTUALIZA_RESERVASN)  '+
                                              'values  '+
                                              '  (:CIAS_CIAS, :VIGENCIA, :COD_REQUISICION, :COD_CATALOGO, :CIAS_CIAS_INVEN,  '+
                                              '   :COD_ALMACEN_INVEN, :NEGO_NEGO_INVEN, :COD_BODEGA_INVEN, :CANTIDAD_RESERVADA,  '+
                                              '   :CANTIDAD_ENTREGADA, :ESTADO, :FECHA_CREA, :USUARIO_CREA, :FECHA_MOD,  '+
                                              '   :USUARIO_MOD, :OPERACION, :RENGLON, :CANTIDAD_DEVUELTA, :ACTUALIZA_RESERVASN)  ';

updCOM_M_RESERVA_INVENTARIO.DeleteSQL.Text:=  ' delete from '+EsquemaAlmacen+'COM_M_RESERVA_INVENTARIO'+ DBLink+'  '+
                                              '  where  '+
                                              '    CIAS_CIAS = :OLD_CIAS_CIAS and  '+
                                              '    VIGENCIA = :OLD_VIGENCIA and  '+
                                              '    COD_REQUISICION = :OLD_COD_REQUISICION and  '+
                                              '    CIAS_CIAS_INVEN = :OLD_CIAS_CIAS_INVEN and  '+
                                              '    COD_ALMACEN_INVEN = :OLD_COD_ALMACEN_INVEN and  '+
                                              '    NEGO_NEGO_INVEN = :OLD_NEGO_NEGO_INVEN and  '+
                                              '    COD_BODEGA_INVEN = :COD_BODEGA_INVEN and  '+
                                              '    RENGLON = :OLD_RENGLON  ';
end;



procedure TfRequisicionMateriales.qCOM_M_REQUISICIONBeforeOpen(
  DataSet: TDataSet);
begin
qCOM_M_REQUISICION.sql.Text:= 'SELECT *  '+
                              'FROM '+EsquemaAlmacen+'COM_M_REQUISICION'+ DBLink+'  '+
                              'WHERE CIAS_CIAS = :CIAS_CIAS  '+
                              'AND VIGENCIA = :VIGENCIA  '+
                              'AND COD_REQUISICION = :COD_REQUISICION  ';

updCOM_M_REQUISICION.ModifySQL.text:= 'update '+EsquemaAlmacen+'COM_M_REQUISICION'+ DBLink+'  '+
                                      'set  '+
                                      '  CIAS_CIAS = :CIAS_CIAS,  '+
                                      '  VIGENCIA = :VIGENCIA,  '+
                                      '  COD_REQUISICION = :COD_REQUISICION,  '+
                                      '  GRCIAS_GRCIAS = :GRCIAS_GRCIAS,  '+
                                      '  NEGO_NEGO = :NEGO_NEGO,  '+
                                      '  ESTRUCTURA_AREA = :ESTRUCTURA_AREA,  '+
                                      '  AREA_AREA = :AREA_AREA,  '+
                                      '  ESTRUCTURA_CECO = :ESTRUCTURA_CECO,  '+
                                      '  CECO_CECO = :CECO_CECO,  '+
                                      '  COD_NOVEDAD = :COD_NOVEDAD,  '+
                                      '  SOLICITA_AUXI = :SOLICITA_AUXI,  '+
                                      '  MOTIVO = :MOTIVO,  '+
                                      '  FECHA = :FECHA,  '+
                                      '  CIAS_CIAS_EJE = :CIAS_CIAS_EJE,  '+
                                      '  NEGO_NEGO_EJE = :NEGO_NEGO_EJE,  '+
                                      '  ESTRUCTURA_AREA_EJE = :ESTRUCTURA_AREA_EJE,  '+
                                      '  AREA_AREA_EJE = :AREA_AREA_EJE,  '+
                                      '  ESTRUCTURA_CECO_EJE = :ESTRUCTURA_CECO_EJE,  '+
                                      '  CECO_CECO_EJE = :CECO_CECO_EJE,  '+
                                      '  VIGENCIA_ODM = :VIGENCIA_ODM,  '+
                                      '  COD_ODM = :COD_ODM,  '+
                                      '  NUMERO_ODM = :NUMERO_ODM,  '+
                                      '  OBRA_OBRA = :OBRA_OBRA,  '+
                                      '  COD_ACTIVO = :COD_ACTIVO,  '+
                                      '  COD_BODEGA_VIRTUAL = :COD_BODEGA_VIRTUAL,  '+
                                      '  CLASE_RESPONSABLE = :CLASE_RESPONSABLE,  '+
                                      '  RESPONSABLE_AUXI = :RESPONSABLE_AUXI,  '+
                                      '  CLASE_PRESTAMO = :CLASE_PRESTAMO,  '+
                                      '  TIPO = :TIPO,  '+
                                      '  PROPOSITO = :PROPOSITO,  '+
                                      '  TIPO_DOC_ASOCIADO = :TIPO_DOC_ASOCIADO,  '+
                                      '  VIGENCIA_LOTE = :VIGENCIA_LOTE,  '+
                                      '  COD_LOTE = :COD_LOTE,  '+
                                      '  VIGENCIA_SOLICITUD = :VIGENCIA_SOLICITUD,  '+
                                      '  COD_SOLICITUD = :COD_SOLICITUD,  '+
                                      '  APROBADASN = :APROBADASN,  '+
                                      '  AUTORIZA_JEFESN = :AUTORIZA_JEFESN,  '+
                                      '  ESTRUCTURA_AREA_JEFE = :ESTRUCTURA_AREA_JEFE,  '+
                                      '  AREA_AREA_JEFE = :AREA_AREA_JEFE,  '+
                                      '  AUXI_JEFE = :AUXI_JEFE,  '+
                                      '  CARG_CARG_JEFE = :CARG_CARG_JEFE,  '+
                                      '  AUTORIZA_COMPRASN = :AUTORIZA_COMPRASN,  '+
                                      '  COD_AUTO_COMPRA = :COD_AUTO_COMPRA,  '+
                                      '  ESTRUCTURA_AREA_COMPRA = :ESTRUCTURA_AREA_COMPRA,  '+
                                      '  AREA_AREA_COMPRA = :AREA_AREA_COMPRA,  '+
                                      '  AUXI_COMPRA = :AUXI_COMPRA,  '+
                                      '  CARG_CARG_COMPRA = :CARG_CARG_COMPRA,  '+
                                      '  COD_AUTO_COMPRA_ADICION = :COD_AUTO_COMPRA_ADICION,  '+
                                      '  CTRL_INVENTARIOSN = :CTRL_INVENTARIOSN,  '+
                                      '  CAUSAL_ANULADO = :CAUSAL_ANULADO,  '+
                                      '  PROCESO = :PROCESO,  '+
                                      '  ESTADO = :ESTADO,  '+
                                      '  FECHA_CREA = :FECHA_CREA,  '+
                                      '  USUARIO_CREA = :USUARIO_CREA,  '+
                                      '  FECHA_MOD = :FECHA_MOD,  '+
                                      '  USUARIO_MOD = :USUARIO_MOD,  '+
                                      '  CONTRATO_SIO = :CONTRATO_SIO,  '+
                                      '  CLASE_REQU = :CLASE_REQU,  '+
                                      '  TIPO_CUENTA = :TIPO_CUENTA,  '+
                                      '  VIGENCIA_SOLICITUD_GLOB = :VIGENCIA_SOLICITUD_GLOB,  '+
                                      '  COD_SOLICITUD_GLOB = :COD_SOLICITUD_GLOB,  '+
                                      '  FECHA_AUTO_JEFE = :FECHA_AUTO_JEFE,  '+
                                      '  FECHA_AUTO_COMPRA = :FECHA_AUTO_COMPRA,  '+
                                      '  CIUD_CIUD_ALUMBRADO = :CIUD_CIUD_ALUMBRADO,  '+
                                      '  CONTAB_AUXI = :CONTAB_AUXI,  '+
                                      '  PROYECTOSN = :PROYECTOSN,  '+
                                      '  ESTRUCTURA_IMPU = :ESTRUCTURA_IMPU,  '+
                                      '  IMPU_IMPU = :IMPU_IMPU,  '+
                                      '  CIAS_CIAS_ODM = :CIAS_CIAS_ODM,  '+
                                      '  COD_TIPO_ODM = :COD_TIPO_ODM,  '+
                                      '  COD_DOCUMENTO_ODM = :COD_DOCUMENTO_ODM,  '+
                                      '  COD_INTERV = :COD_INTERV,  '+
                                      '  COD_INTERVENCION = :COD_INTERVENCION,  '+
                                      '  COD_TIPO_INTERVENCION = :COD_TIPO_INTERVENCION,  '+
                                      '  COD_ORIGEN = :COD_ORIGEN,  '+
                                      '  COD_EJECUTOR = :COD_EJECUTOR,  '+
                                      '  VIGENCIA_INTERVENCION = :VIGENCIA_INTERVENCION  '+
                                      'where  '+
                                      '  CIAS_CIAS = :OLD_CIAS_CIAS and  '+
                                      '  VIGENCIA = :OLD_VIGENCIA and  '+
                                      '  COD_REQUISICION = :OLD_COD_REQUISICION  ';

updCOM_M_REQUISICION.InsertSQL.text:= 'insert into '+EsquemaAlmacen+'COM_M_REQUISICION'+ DBLink+'  '+
                                      '(CIAS_CIAS, VIGENCIA, COD_REQUISICION, GRCIAS_GRCIAS, NEGO_NEGO, ESTRUCTURA_AREA,  '+
                                      ' AREA_AREA, ESTRUCTURA_CECO, CECO_CECO, COD_NOVEDAD, SOLICITA_AUXI, MOTIVO,  '+
                                      ' FECHA, CIAS_CIAS_EJE, NEGO_NEGO_EJE, ESTRUCTURA_AREA_EJE, AREA_AREA_EJE,  '+
                                      ' ESTRUCTURA_CECO_EJE, CECO_CECO_EJE, VIGENCIA_ODM, COD_ODM, NUMERO_ODM,  '+
                                      ' OBRA_OBRA, COD_ACTIVO, COD_BODEGA_VIRTUAL, CLASE_RESPONSABLE, RESPONSABLE_AUXI,  '+
                                      ' CLASE_PRESTAMO, TIPO, PROPOSITO, TIPO_DOC_ASOCIADO, VIGENCIA_LOTE, COD_LOTE,  '+
                                      ' VIGENCIA_SOLICITUD, COD_SOLICITUD, APROBADASN, AUTORIZA_JEFESN, ESTRUCTURA_AREA_JEFE,  '+
                                      ' AREA_AREA_JEFE, AUXI_JEFE, CARG_CARG_JEFE, AUTORIZA_COMPRASN, COD_AUTO_COMPRA,  '+
                                      ' ESTRUCTURA_AREA_COMPRA, AREA_AREA_COMPRA, AUXI_COMPRA, CARG_CARG_COMPRA,  '+
                                      ' COD_AUTO_COMPRA_ADICION, CTRL_INVENTARIOSN, CAUSAL_ANULADO, PROCESO,  '+
                                      ' ESTADO, FECHA_CREA, USUARIO_CREA, FECHA_MOD, USUARIO_MOD, CONTRATO_SIO,  '+
                                      ' CLASE_REQU, TIPO_CUENTA, VIGENCIA_SOLICITUD_GLOB, COD_SOLICITUD_GLOB,  '+
                                      '  FECHA_AUTO_JEFE, FECHA_AUTO_COMPRA, CIUD_CIUD_ALUMBRADO, CONTAB_AUXI,  '+
                                      '  PROYECTOSN, ESTRUCTURA_IMPU, IMPU_IMPU, CIAS_CIAS_ODM, COD_TIPO_ODM,  '+
                                      ' COD_DOCUMENTO_ODM, COD_INTERV, COD_INTERVENCION, COD_TIPO_INTERVENCION,  '+
                                      ' COD_ORIGEN, COD_EJECUTOR, VIGENCIA_INTERVENCION)  '+
                                      'values  '+
                                      '(:CIAS_CIAS, :VIGENCIA, :COD_REQUISICION, :GRCIAS_GRCIAS, :NEGO_NEGO,  '+
                                      ' :ESTRUCTURA_AREA, :AREA_AREA, :ESTRUCTURA_CECO, :CECO_CECO, :COD_NOVEDAD,  '+
                                      ' :SOLICITA_AUXI, :MOTIVO, :FECHA, :CIAS_CIAS_EJE, :NEGO_NEGO_EJE, :ESTRUCTURA_AREA_EJE,  '+
                                      ' :AREA_AREA_EJE, :ESTRUCTURA_CECO_EJE, :CECO_CECO_EJE, :VIGENCIA_ODM,  '+
                                      ' :COD_ODM, :NUMERO_ODM, :OBRA_OBRA, :COD_ACTIVO, :COD_BODEGA_VIRTUAL,  '+
                                      ' :CLASE_RESPONSABLE, :RESPONSABLE_AUXI, :CLASE_PRESTAMO, :TIPO, :PROPOSITO,  '+
                                      ' :TIPO_DOC_ASOCIADO, :VIGENCIA_LOTE, :COD_LOTE, :VIGENCIA_SOLICITUD,  '+
                                      ' :COD_SOLICITUD, :APROBADASN, :AUTORIZA_JEFESN, :ESTRUCTURA_AREA_JEFE,  '+
                                      ' :AREA_AREA_JEFE, :AUXI_JEFE, :CARG_CARG_JEFE, :AUTORIZA_COMPRASN, :COD_AUTO_COMPRA,  '+
                                      ' :ESTRUCTURA_AREA_COMPRA, :AREA_AREA_COMPRA, :AUXI_COMPRA, :CARG_CARG_COMPRA,  '+
                                      ' :COD_AUTO_COMPRA_ADICION, :CTRL_INVENTARIOSN, :CAUSAL_ANULADO, :PROCESO,  '+
                                      ' :ESTADO, :FECHA_CREA, :USUARIO_CREA, :FECHA_MOD, :USUARIO_MOD, :CONTRATO_SIO,  '+
                                      ' :CLASE_REQU, :TIPO_CUENTA, :VIGENCIA_SOLICITUD_GLOB, :COD_SOLICITUD_GLOB,  '+
                                      ' :FECHA_AUTO_JEFE, :FECHA_AUTO_COMPRA, :CIUD_CIUD_ALUMBRADO, :CONTAB_AUXI,  '+
                                      ' :PROYECTOSN, :ESTRUCTURA_IMPU, :IMPU_IMPU, :CIAS_CIAS_ODM, :COD_TIPO_ODM,  '+
                                      ' :COD_DOCUMENTO_ODM, :COD_INTERV, :COD_INTERVENCION, :COD_TIPO_INTERVENCION,  '+
                                      ' :COD_ORIGEN, :COD_EJECUTOR, :VIGENCIA_INTERVENCION)  ';


updCOM_M_REQUISICION.DeleteSQL.text:= 'delete from '+EsquemaAlmacen+'COM_M_RESERVA_INVENTARIO'+ DBLink+'  '+
                                      'where  '+
                                      '  CIAS_CIAS = :OLD_CIAS_CIAS and  '+
                                      '  VIGENCIA = :OLD_VIGENCIA and  '+
                                      '  COD_REQUISICION = :OLD_COD_REQUISICION and  '+
                                      '  CIAS_CIAS_INVEN = :OLD_CIAS_CIAS_INVEN and  '+
                                      '  COD_ALMACEN_INVEN = :OLD_COD_ALMACEN_INVEN and  '+
                                      '  NEGO_NEGO_INVEN = :OLD_NEGO_NEGO_INVEN and  '+
                                      '  COD_BODEGA_INVEN = :OLD_COD_BODEGA_INVEN and  '+
                                      '  RENGLON = :OLD_RENGLON  ';


end;

procedure TfRequisicionMateriales.qSAF_M_INTERVENCIONESBeforeOpen(
  DataSet: TDataSet);
begin
qSAF_M_INTERVENCIONES.sql.Text:= ' SELECT * FROM '+EsquemaAlmacen+'SAF_M_INTERVENCIONES'+ DBLink+'  WHERE COD_INTERVENCION = :COD_INTERVENCION '+
                                 ' AND VIGENCIA = :VIGENCIA';

updSAF_M_INTERVENCIONES.ModifySQL.text:= 'update '+EsquemaAlmacen+'SAF_M_INTERVENCIONES'+ DBLink+' '+
                                         ' set '+
                                         '   COD_INTERVENCION = :COD_INTERVENCION, '+
                                         '   COD_TIPO_INTERVENCION = :COD_TIPO_INTERVENCION, '+
                                         '   COD_ORIGEN = :COD_ORIGEN, '+
                                         '   COD_EJECUTOR = :COD_EJECUTOR, '+
                                         '   VIGENCIA = :VIGENCIA, '+
                                         '   COD_ZONA = :COD_ZONA, '+
                                         '   IMPU_PROG_CONVENIO = :IMPU_PROG_CONVENIO, '+
                                         '   COD_ACTIVO = :COD_ACTIVO, '+
                                         '   FECHA_CREA = :FECHA_CREA, '+
                                         '   USUARIO_CREA = :USUARIO_CREA, '+
                                         '   FECHA_MOD = :FECHA_MOD, '+
                                         '   USUARIO_MOD = :USUARIO_MOD '+
                                         ' where '+
                                         '   COD_INTERVENCION = :OLD_COD_INTERVENCION ';

updSAF_M_INTERVENCIONES.InsertSQL.text:=  'insert into '+EsquemaAlmacen+'SAF_M_INTERVENCIONES'+ DBLink+' '+
                                          '(COD_INTERVENCION, COD_TIPO_INTERVENCION, COD_ORIGEN, COD_EJECUTOR, VIGENCIA, '+
                                          ' COD_ZONA, IMPU_PROG_CONVENIO, COD_ACTIVO, FECHA_CREA, USUARIO_CREA, '+
                                          ' FECHA_MOD, USUARIO_MOD) '+
                                          'values '+
                                          '  (:COD_INTERVENCION, :COD_TIPO_INTERVENCION, :COD_ORIGEN, :COD_EJECUTOR, '+
                                          '   :VIGENCIA, :COD_ZONA, :IMPU_PROG_CONVENIO, :COD_ACTIVO, :FECHA_CREA, '+
                                          '   :USUARIO_CREA, :FECHA_MOD, :USUARIO_MOD) ';

updSAF_M_INTERVENCIONES.DeleteSQL.Text:= 'delete from '+EsquemaAlmacen+'SAF_M_INTERVENCIONES'+ DBLink+' where '+
                                         'COD_INTERVENCION = :OLD_COD_INTERVENCION';

end;



procedure TfRequisicionMateriales.qUtilizacionBeforeOpen(
  DataSet: TDataSet);
begin
qUtilizacion.sql.text:= 'SELECT UTILIZACION, DESCRIPCION FROM '+EsquemaContratos+'SIO_UTILIZACION'+ DBLink+'';
end;

procedure TfRequisicionMateriales.qEmpresaSolicitanteBeforeOpen(
  DataSet: TDataSet);
begin
qEmpresaSolicitante.sql.text:= 'SELECT CIAS_CIAS, CIAS_DESCRI FROM '+EsquemaContable+'GE_TCIAS'+ DBLink+' ORDER BY CIAS_CIAS';
end;

procedure TfRequisicionMateriales.qEmpresaEjecutoraBeforeOpen(
  DataSet: TDataSet);
begin
qEmpresaEjecutora.sql.text:= 'SELECT CIAS_CIAS, CIAS_DESCRI FROM '+EsquemaContable+'GE_TCIAS'+ DBLink+' ORDER BY CIAS_CIAS';
end;

procedure TfRequisicionMateriales.qAreaSolicitanteBeforeOpen(
  DataSet: TDataSet);
begin
qAreaSolicitante.sql.text:= 'SELECT DISTINCT A.AREA_ETCT, TO_NUMBER(A.AREA_AREA) AREA_AREA, A.AREA_DESCRI,substr(A.AREA_CECOS,1,8) AREA_CECOS, C.CECO_ETCT '+
                            'FROM '+EsquemaContable+'GE_TAREA'+ DBLink+' A, '+EsquemaAlmacen+'INV_S_NEGO_X_AREA'+ DBLink+' I, '+
                            ''+EsquemaContable+'GE_TCECOS'+ DBLink+'  C WHERE '+
                            'A.AREA_AREA= I.AREA_AREA '+
                            //'AND A.AREA_CECOS = C.CECO_CECO '+
                            'AND I.NEGO_NEGO= :NEGO_NEGO ';

end;

procedure TfRequisicionMateriales.qAreaEjecutoraBeforeOpen(
  DataSet: TDataSet);
begin
qAreaEjecutora.sql.text:= 'SELECT DISTINCT A.AREA_ETCT, TO_NUMBER(A.AREA_AREA) AREA_AREA, A.AREA_DESCRI, A.AREA_CECOS, C.CECO_ETCT '+
                          'FROM '+EsquemaContable+'GE_TAREA'+ DBLink+' A, '+EsquemaAlmacen+'INV_S_NEGO_X_AREA'+ DBLink+' I, '+EsquemaContable+'GE_TCECOS'+ DBLink+' C WHERE  '+
                          'A.AREA_AREA= I.AREA_AREA  '+
                          //'AND A.AREA_CECOS = C.CECO_CECO '+
                          'AND I.NEGO_NEGO= :NEGO_NEGO  ';
end;

procedure TfRequisicionMateriales.qNegocioSolicitanteBeforeOpen(
  DataSet: TDataSet);
begin
qNegocioSolicitante.sql.text:= 'SELECT TO_NUMBER(NEGO_NEGO) NEGO_NEGO, NEGO_DESCRI FROM '+EsquemaAlmacen+'GE_TNEGO'+ DBLink+' ORDER BY TO_NUMBER(NEGO_NEGO)'
end;

procedure TfRequisicionMateriales.qNegocioEjecutoraBeforeOpen(
  DataSet: TDataSet);
begin
qNegocioEjecutora.sql.text:= 'SELECT TO_NUMBER(NEGO_NEGO) NEGO_NEGO, NEGO_DESCRI FROM '+EsquemaAlmacen+'GE_TNEGO'+ DBLink+' ORDER BY TO_NUMBER(NEGO_NEGO)';
end;

procedure TfRequisicionMateriales.qCecoBeforeOpen(DataSet: TDataSet);
begin
qCeco.sql.text:= 'SELECT DISTINCT(C.CECO_CECO), C.CECO_DESCRI FROM GE_TAREA'+ DBLink+' A, GE_TCECOS'+ DBLink+'  C WHERE AREA_AREA IN '+
                       ' (SELECT AREA_AREA FROM '+EsquemaAlmacen+'INV_S_NEGO_X_AREA'+ DBLink+'  '+
                       ' WHERE NEGO_NEGO = :NEGO_NEGO) '+
                       ' AND A.AREA_CECOS = C.CECO_CECO AND AREA_AREA = '+qCOM_M_REQUISICIONAREA_AREA.AsString;


end;

procedure TfRequisicionMateriales.qAlmacenReservaBeforeOpen(
  DataSet: TDataSet);
begin
qAlmacenReserva.sql.text:= 'SELECT DISTINCT CIAS_CIAS_INVEN, COD_ALMACEN_INVEN FROM '+EsquemaAlmacen+'COM_M_RESERVA_INVENTARIO'+ DBLink+' '+
                           ' WHERE CIAS_CIAS = :CIAS_CIAS AND VIGENCIA = :VIGENCIA AND COD_REQUISICION = :COD_REQUISICION';
end;

procedure TfRequisicionMateriales.qGE_TCIASBeforeOpen(DataSet: TDataSet);
begin
qGE_TCIAS.sql.text:= 'SELECT CIAS_DESCRI FROM '+EsquemaContable+'GE_TCIAS'+ DBLink+' WHERE CIAS_CIAS = :CIAS_CIAS';
end;

procedure TfRequisicionMateriales.qCIASBeforeOpen(DataSet: TDataSet);
begin
qCIAS.sql.text:= 'SELECT CIAS_CIAS, CIAS_DESCRI FROM '+EsquemaContable+'GE_TCIAS'+ DBLink+'';
end;

procedure TfRequisicionMateriales.qAlmacenBeforeOpen(DataSet: TDataSet);
begin
qAlmacen.sql.text:= 'SELECT COD_ALMACEN, UPPER(ALMACEN_DESCRI),CIAS_CIAS FROM '+EsquemaAlmacen+'INV_S_ALMACEN'+ DBLink+' '+
                    ' WHERE CIAS_CIAS = :CIAS_CIAS AND ESTADO = ''ACTIVO''';
end;

procedure TfRequisicionMateriales.qBodegaBeforeOpen(DataSet: TDataSet);
begin
qBodega.sql.text:= 'SELECT COD_BODEGA, UPPER(BODEGA_DESCRI) FROM '+EsquemaAlmacen+'INV_S_BODEGA'+ DBLink+' WHERE CIAS_CIAS = :CIAS_CIAS '+
                   ' AND COD_ALMACEN = :COD_ALMACEN AND ESTADO = ''ACTIVO'' '+
                   ' AND COD_BODEGA IN (SELECT COD_BODEGA FROM '+EsquemaAlmacen+'INV_S_NOVEDAD_BODEGA'+DBLink+' where cod_bodega not in (500000) '+
                   ' AND COD_BODEGA NOT IN (SELECT COD_BODEGA FROM RestriccionBodegaArea WHERE AREA_AREA = :AREA_AREA and cod_almacen = :cod_almacen) '+
                   ' and CIAS_CIAS = :CIAS_CIAS '+
                   ' AND NEGO_NEGO=:NEGO_NEGO '+
                   ' AND COD_ALMACEN = :COD_ALMACEN '+
                   ' AND COD_NOVEDAD = :COD_NOVEDAD )';
qBodega.ParamByName('AREA_AREA').AsString :=qCOM_M_REQUISICIONAREA_AREA_EJE.asstring;
qBodega.ParamByName('CIAS_CIAS').AsFloat := qAlmacenCIAS_CIAS.AsFloat;
qBodega.ParamByName('COD_ALMACEN').AsString := qAlmacenCOD_ALMACEN.AsString;
qBodega.ParamByName('COD_NOVEDAD').AsString := qCOM_M_REQUISICIONCOD_NOVEDAD.AsString;
qBodega.ParamByName('NEGO_NEGO').AsString := qCOM_M_REQUISICIONNEGO_NEGO.AsString;
end;

procedure TfRequisicionMateriales.qBodegaAfterScroll(DataSet: TDataSet);
begin
  IF qCOM_M_REQUISICION_MOVI.RecordCount>0  THEN
  BEGIN
    IF BodegaEscogida = TRUE THEN
    BEGIN
      if dblcBodega.Focused then
      BEGIN
        qcom_m_requisicion_movi.first;
        while not qcom_m_requisicion_movi.eof do
        begin
          qcom_m_requisicion_movi.edit;
          qcom_m_requisicion_movi.FieldByName('CANTIDAD_INVEN_ALMA_RES').asfloat:= 0;
          qcom_m_requisicion_movi.next;
        end;
        marca:= false;
      END;
      qCOM_M_REQUISICION_MOVI.First;
      while not qCOM_M_REQUISICION_MOVI.Eof do
      begin
        CodigosMateriales.Add(qCOM_M_REQUISICION_MOVICOD_CATALOGO.AsString);
        qCOM_M_REQUISICION_MOVI.Next;
      end;

      CrearTablaReserva;

      llenartablareserva;
    END;
  END;
end;

procedure TfRequisicionMateriales.dblcBodegaClick(Sender: TObject);
begin
BodegaEscogida:= TRUE;
end;

procedure TfRequisicionMateriales.dblcBodegaEnter(Sender: TObject);
begin
BodegaEscogida:= TRUE;
end;

procedure TfRequisicionMateriales.qGE_TCIASEJEBeforeOpen(
  DataSet: TDataSet);
begin
qGE_TCIASEJE.sql.text:= 'SELECT CIAS_DESCRI FROM '+EsquemaContable+'GE_TCIAS'+ DBLink+' WHERE CIAS_CIAS = :CIAS_CIAS_EJE';
end;

procedure TfRequisicionMateriales.qGE_TAUXILBeforeOpen(DataSet: TDataSet);
begin
qGE_TAUXIL.sql.Text:= 'SELECT AUXI_AUXI FROM GE_TAUXIL'+ DBLink+' WHERE AUXI_AUXI IN(24452,24609,24699)';
end;

procedure TfRequisicionMateriales.qCOM_M_REQUISICIONAfterInsert(
  DataSet: TDataSet);
begin
  Dataset.FieldByName('CIAS_CIAS').asString:='1';
end;

procedure TfRequisicionMateriales.qCOM_M_REQUISICIONNEGO_NEGO_EJEChange(
  Sender: TField);
begin
  qCOM_M_REQUISICIONNEGO_NEGO.AsString:=Sender.Text;
  dblcNegocioSolicitanteClick(self);

  if TTemporal.Active then
  begin
    TTemporal.active:=false;
    tTemporal.DeleteTable;
    {qAlmacen.close;
    qAlmacen.open; }
  end;

end;

procedure TfRequisicionMateriales.qCOM_M_REQUISICIONAREA_AREA_EJEChange(
  Sender: TField);
begin
  qCOM_M_REQUISICIONAREA_AREA.AsString:=Sender.Text;
end;

END.
