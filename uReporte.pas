unit uReporte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, dbctrls, Db, DBTables, Mask, ComCtrls,
  Menus, utMenuArbol, ImgList, Grids, DBGrids, RXDBCtrl, ToolEdit, Digisoft,
  FileCtrl, ZipForge, Spin;

type
  TTipoLabor = (tlRamal, tlTrafo);

  TDatosCorreo = record
    servidor: string;
    login: string;
    psswd: string;
    Destino: string;
  end;

  TfReporte = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    qReporte: TQuery;
    UpdSQLReporte: TUpdateSQL;
    lbCodigo: TLabel;
    dsReporte: TDataSource;
    Label2: TLabel;
    dbeCodigoReporte: TDBText;
    qTipoInformante: TQuery;
    qReporteNombreTipoInformante: TStringField;
    Label3: TLabel;
    dMenuArbol1: TdMenuArbol;
    qSubestacion: TQuery;
    qReporteNombreSubestacion: TStringField;
    qCircuito: TQuery;
    dsSubestacion: TDataSource;
    qReporteNombreCircuito: TStringField;
    qEstadoReporte: TQuery;
    qReporteNombreEstadoReporte: TStringField;
    pcDatos: TPageControl;
    tsInformante: TTabSheet;
    rgClaseReporte: TDBRadioGroup;
    tsFechas: TTabSheet;
    tsObservaciones: TTabSheet;
    Label21: TLabel;
    Label22: TLabel;
    dbmDescripcion: TDBMemo;
    DBMemo1: TDBMemo;
    Panel2: TPanel;
    Panel3: TPanel;
    bbCancelar: TBitBtn;
    bbAceptar: TBitBtn;
    qSuscriptor: TQuery;
    dsSuscriptor: TDataSource;
    qCodigoReporte: TQuery;
    pTipoReporte: TPanel;
    sbInterrupcion: TSpeedButton;
    sbSolicitud: TSpeedButton;
    sbDano: TSpeedButton;
    sbEmergencia: TSpeedButton;
    qDatosElectricos: TQuery;
    qTipoElemento: TQuery;
    qReporteElemento: TQuery;
    qReporteElementoCODIGOREPORTE: TFloatField;
    qReporteElementoCODIGOTIPOELEMENTO: TStringField;
    qReporteElementoCLAVE1: TStringField;
    qReporteElementoCLAVE2: TStringField;
    qReporteElementoNOMBRETIPOELEMENTO: TStringField;
    dsReporteElemento: TDataSource;
    UpdSQLReporteElemento: TUpdateSQL;
    qReporteElementoCODIGOESTRUCTURA: TFloatField;
    qEstructura: TQuery;
    dsEstructura: TDataSource;
    qCIA: TQuery;
    qReporteElementoCODIGOREPORTEELEMENTO: TFloatField;
    qCodigoReporteElemento: TQuery;
    qCodigoReporteElementoNEXTVAL: TFloatField;
    bbImprimir: TBitBtn;
    qClaseReporte: TQuery;
    qTipoReporte: TQuery;
    qAdministrativo: TQuery;
    pmImprimir: TPopupMenu;
    Reporte1: TMenuItem;
    ElementosAsociados1: TMenuItem;
    qReporteElementoNOMBREESTRUCTURA: TStringField;
    gbInformante: TGroupBox;
    dblcbTipoInformante: TDBLookupComboBox;
    Label4: TLabel;
    Label23: TLabel;
    dbeComercial: TDBEdit;
    sbBuscarComercial: TSpeedButton;
    sbBuscarNodoFisico: TSpeedButton;
    dbeNodoFisico: TDBEdit;
    Label16: TLabel;
    Label10: TLabel;
    dbeMedidor: TDBEdit;
    sbBuscarMedidor: TSpeedButton;
    gbDireccion: TGroupBox;
    dbeCIG: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    dbeDireccionDano: TDBEdit;
    sbEditarDireccion: TSpeedButton;
    DBText3: TDBText;
    SpeedButton5: TSpeedButton;
    dMenuArbol2: TdMenuArbol;
    qReporteDireccionCalculada: TStringField;
    gbFechas: TGroupBox;
    lbFecha1: TLabel;
    lbFecha2: TLabel;
    lbFecha3: TLabel;
    dbeFechaAtencion: TDBEdit;
    dbeFechaLlegada: TDBEdit;
    dbeFechaDictado: TDBEdit;
    sbFechaDictado: TSpeedButton;
    sbFechaLlegada: TSpeedButton;
    sbFechaAtencion: TSpeedButton;
    Label20: TLabel;
    dblcbEstadoReporte: TDBLookupComboBox;
    gbEstadoReporte: TGroupBox;
    pmPrioridad: TPopupMenu;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    lbFecha4: TLabel;
    dbeFechaLimite: TDBEdit;
    sbFechaLimite: TSpeedButton;
    gbVarios: TGroupBox;
    Label28: TLabel;
    sbInfoElectrica: TSpeedButton;
    Label24: TLabel;
    SpeedButton4: TSpeedButton;
    sbElementosElectricos: TSpeedButton;
    Label13: TLabel;
    Label9: TLabel;
    qGrupoTrabajo: TQuery;
    dblcbGrupoTrabajo: TDBLookupComboBox;
    dsGrupoTrabajo: TDataSource;
    dsCircuito: TDataSource;
    dMenuCIG: TdMenuArbol;
    qTipoDano: TQuery;
    dsTipoDano: TDataSource;
    qGeografico: TQuery;
    lbFechaSad: TLabel;
    dbeFechaSAD: TDBEdit;
    sbFechaSAD: TSpeedButton;
    DBEdit2: TDBEdit;
    sbBuscarCIG: TSpeedButton;
    dsGeografico: TDataSource;
    sbAsignarODT: TSpeedButton;
    sbUbicarNodoFisico: TSpeedButton;
    sbUbicarMedidor: TSpeedButton;
    sbUbicarComercial: TSpeedButton;
    DBEdit3: TDBEdit;
    LbCia1: TLabel;
    lbCia2: TLabel;
    DBEdit1: TDBEdit;
    dblcbTipoDano: TDBLookupComboBox;
    Label1: TLabel;
    SpBUSCARDIR: TSpeedButton;
    Label8: TLabel;
    DBText1: TDBText;
    dbEdFechaHora: TDBEdit;
    sbFechaRegistro: TSpeedButton;
    qTiempo: TQuery;
    qTiempoTIEMPOATENCION: TFloatField;
    qReporteCODIGOREPORTE: TFloatField;
    qReporteCODIGOINFORMANTE: TStringField;
    qReporteDIRECCIONINFORMANTE: TStringField;
    qReporteNOMBREINFORMANTE: TStringField;
    qReporteCIGINFORMANTE: TFloatField;
    qReporteCIGDANO: TFloatField;
    qReporteDIRECCIONDANO: TStringField;
    qReporteCODIGOADMINISTRATIVO: TFloatField;
    qReporteCODIGOTIPOREPORTE: TStringField;
    qReporteCODIGOCLASEREPORTE: TStringField;
    qReporteCODIGOTIPODANO: TFloatField;
    qReporteCODIGOPRIORIDAD: TStringField;
    qReporteCODIGOESTADOREPORTE: TStringField;
    qReporteNUMEROCARTA: TStringField;
    qReporteCODIGOESTADOCARTA: TFloatField;
    qReporteREGISTROS: TFloatField;
    qReporteFECHAHORA: TDateTimeField;
    qReporteFECHAULTIMOREGISTRO: TDateTimeField;
    qReporteFECHAHORADICTADO: TDateTimeField;
    qReporteFECHAHORALLEGADA: TDateTimeField;
    qReporteFECHAHORAATENCION: TDateTimeField;
    qReporteX: TFloatField;
    qReporteY: TFloatField;
    qReporteORIGENREPORTE: TStringField;
    qReporteCODIGOTIPOELEMENTO: TStringField;
    qReporteCODIGOELEMENTO: TStringField;
    qReporteCODIGOSUBESTACION: TStringField;
    qReporteCODIGOCIRCUITO: TStringField;
    qReporteCODIGOTRAFODIS: TFloatField;
    qReporteCODIGOAPOYO: TFloatField;
    qReporteCODIGOCLIENTESGD: TFloatField;
    qReporteCODIGOCLIENTECOM: TFloatField;
    qReporteREPORTEPADRE: TFloatField;
    qReportePINTADOAPOYO: TStringField;
    qReporteCODIGOTIPOVIA: TFloatField;
    qReporteCODIGONOMBREVIA: TFloatField;
    qReporteMODIFICADORVIA: TStringField;
    qReporteDUPLICADOR: TFloatField;
    qReporteMODIFICADORDUPLICADOR: TStringField;
    qReporteNUMEROPUERTA: TFloatField;
    qReporteCODIGOODT: TFloatField;
    qReporteCONSECUTIVO: TFloatField;
    qReporteCIAINFORMANTE: TFloatField;
    qReporteCODIGOCONTADOR: TStringField;
    qReportePRIORIDADDANO: TFloatField;
    qReporteNUMEROSAT: TFloatField;
    qReporteFECHALIMITERESPUESTA: TDateTimeField;
    qReporteNOMBREFUNCIONARIO: TStringField;
    qReporteCODIGOGRUPOTRABAJO: TFloatField;
    qReporteCODIGONODOBT: TStringField;
    qReporteCODIGOINTERRUPTORDIS: TFloatField;
    qReporteCODIGOTIPOPREDIO: TStringField;
    qReporteFECHAHORASAD: TDateTimeField;
    qReporteCODIGOUSUARIOCREACION: TFloatField;
    sbCliente: TSpeedButton;
    Label12: TLabel;
    dbeLuminaria: TDBEdit;
    sbBuscarLuminaria: TSpeedButton;
    SpeedButton1: TSpeedButton;
    sbAlumbrado: TSpeedButton;
    SpeedButton3: TSpeedButton;
    sbBorrar: TSpeedButton;
    Bevel1: TBevel;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    qReporteDESCRIPCION: TMemoField;
    qReporteCOLORCELDA: TFloatField;
    qReporteOBSERVACION: TMemoField;
    StatusBar1: TStatusBar;
    qReporteFECHACREACION: TDateTimeField;
    nbInformante: TNotebook;
    Label5: TLabel;
    dbeNombreInformante: TDBEdit;
    sbBuscarNombre: TSpeedButton;
    Label6: TLabel;
    dbeTelefono: TDBEdit;
    sbBuscarTelefono: TSpeedButton;
    lbCIAInformante: TLabel;
    lbFuncionario: TLabel;
    dbeCIAInformante: TDBEdit;
    dbeFuncionario: TDBEdit;
    Label7: TLabel;
    qTelefonoRecibe: TQuery;
    DBLookupComboBox1: TDBLookupComboBox;
    dsTelefonoRecibe: TDataSource;
    Label17: TLabel;
    dbeSat: TDBEdit;
    Label18: TLabel;
    qReporteTIPOCLIENTE: TStringField;
    qReportePRIORIDADESTIMADA: TFloatField;
    qTelefonoRecibeCODIGOADMINISTRATIVO: TFloatField;
    qTelefonoRecibeEXCLUSIVOVIP: TStringField;
    sbMail: TSpeedButton;
    qReporteNombreClienteSgd: TStringField;
    qReporteTipoClienteSgd: TStringField;
    DBLookupComboBox2: TDBLookupComboBox;
    dsTipoCliente: TDataSource;
    qTipoCliente: TQuery;
    stbMensaje: TStatusBar;
    Timer1: TTimer;
    qSuscriptorCODIGOBARRIO: TStringField;
    qSuscriptorCODIGOZONA: TStringField;
    qSuscriptorCODIGOCIUDAD: TStringField;
    qSuscriptorDIRECCIONSUSCRIPTOR: TStringField;
    qSuscriptorNOMBRESUSCRIPTOR: TStringField;
    qSuscriptorCODIGOAPOYO: TFloatField;
    qSuscriptorCODIGOCLIENTESGD: TFloatField;
    qSuscriptorCODIGOCLIENTECOM: TStringField;
    qSuscriptorCODIGOCIRCUITO: TStringField;
    qSuscriptorCODIGOTRAFODIS: TFloatField;
    Label19: TLabel;
    sbUbicarReporte: TSpeedButton;
    SpeedButton2: TSpeedButton;
    bbtnAuditoria: TBitBtn;
    qReporteCODIGOINFRAESTRUCTURAUNICO: TFloatField;
    qReporteTELEFONO: TStringField;
    dblcbClaseCliente: TDBLookupComboBox;
    Label11: TLabel;
    dsClaseCliente: TDataSource;
    qClaseCliente: TQuery;
    qClaseClienteCODIGOCLASECLIENTE: TFloatField;
    qClaseClienteNOMBRECLASECLIENTE: TStringField;
    qReporteCODIGOCLASECLIENTE: TFloatField;
    qReporteCODIGOTIPOVERTICAL: TFloatField;
    qReporteVERTICAL: TStringField;
    qReporteCODIGOTIPOINTERIOR: TFloatField;
    qReportePISO: TStringField;
    qReporteINTERIOR: TStringField;
    qTelefonoRecibeTELEFONO: TStringField;
    qTelefonoRecibeACTIVO: TStringField;
    qReporteTELEFONORECIBE: TStringField;
    gbInfoEvento: TGroupBox;
    Label25: TLabel;
    Label27: TLabel;
    SpeedButton6: TSpeedButton;
    tcodigocausa: TEdit;
    lTipoLabor: TLabel;
    fTipoLaborReporte: TDBLookupComboBox;
    qTipoLaborReporte: TQuery;
    dsTipoLaborReporte: TDataSource;
    qReporteCODIGOTIPOLABORREPORTE: TFloatField;
    tCausaSub: TEdit;
    Label29: TLabel;
    pintadoapoyoevento: TEdit;
    lanzavistaevento: TSpeedButton;
    Label30: TLabel;
    eCodigoFalla: TEdit;
    eNodoFalla: TEdit;
    qReporteCODIGOEVENTO: TFloatField;
    qReporteCODIGOEVENTORESTABLECIMIENTO: TFloatField;
    Label26: TLabel;
    eCodElementoOperacion: TEdit;
    qNodo: TQuery;
    qHallarInterruptor: TQuery;
    sbubicarencartografia: TSpeedButton;
    qReporteXLLEGADA: TFloatField;
    qReporteYLLEGADA: TFloatField;
    qReporteXATENCION: TFloatField;
    qReporteYATENCION: TFloatField;
    SpeedButton9: TSpeedButton;
    qReporteDESCRIPCIONTIPOPREDIO: TMemoField;
    procExportarEMG: TStoredProc;
    Zip: TZipForge;
    qReporteFECHAHORADESCARGA: TDateTimeField;
    Label31: TLabel;
    dbeFechaDescarga: TDBEdit;
    Label32: TLabel;
    speBufferApoyos: TSpinEdit;
    Label33: TLabel;
    SpeedButton10: TSpeedButton;
    sbGestionarOdt: TSpeedButton;
    pmGestionOdt: TPopupMenu;
    IraODT1: TMenuItem;
    Label34: TLabel;
    DBEdit5: TDBEdit;
    DBEdit8: TDBEdit;
    qOdt: TQuery;
    dsOdt: TDataSource;
    pro_cargar_Info_OS: TStoredProc;
    pro_Actualizar_rep: TStoredProc;
    procedure ValidarContenidoNumerosLetras(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure qReporteAfterInsert(DataSet: TDataSet);
    procedure dMenuArbol1SelectID(Sender: tnMenuItem; ID: Integer;
      MenuEstructura: tMenuEs);
    procedure FormCreate(Sender: TObject);
    procedure sbFechaDictadoClick(Sender: TObject);
    procedure sbFechaLlegadaClick(Sender: TObject);
    procedure sbFechaAtencionClick(Sender: TObject);
    procedure qReporteFECHAHORADICTADOValidate(Sender: TField);
    procedure qReporteFECHAHORALLEGADAValidate(Sender: TField);
    procedure qReporteFECHAHORAATENCIONValidate(Sender: TField);
    procedure sbBuscarNombreClick(Sender: TObject);
    procedure sbBuscarTelefonoClick(Sender: TObject);
    procedure sbBuscarNodoFisicoClick(Sender: TObject);
    procedure sbBuscarComercialClick(Sender: TObject);
    procedure qReporteCODIGOESTADOREPORTEValidate(Sender: TField);
    procedure bbAceptarClick(Sender: TObject);
    procedure bbCancelarClick(Sender: TObject);
    procedure qReporteUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure sbDanoClick(Sender: TObject);
    procedure sbInterrupcionClick(Sender: TObject);
    procedure sbEmergenciaClick(Sender: TObject);
    procedure sbSolicitudClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure sbInfoElectricaClick(Sender: TObject);
    procedure qReporteElementoAfterInsert(DataSet: TDataSet);
    procedure qReporteElementoUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qReporteElementoAfterPost(DataSet: TDataSet);
    procedure qReporteElementoAfterDelete(DataSet: TDataSet);
    procedure qReporteCODIGOADMINISTRATIVOValidate(Sender: TField);
    procedure bbImprimirClick(Sender: TObject);
    procedure Reporte1Click(Sender: TObject);
    procedure ElementosAsociados1Click(Sender: TObject);
    procedure sbEditarDireccionClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbElementosElectricosClick(Sender: TObject);
    procedure dMenuArbol2SelectID(Sender: tnMenuItem; ID: Integer;
      MenuEstructura: tMenuEs);
    procedure qReporteCIAINFORMANTEValidate(Sender: TField);
    procedure qReporteCODIGOTIPOREPORTEValidate(Sender: TField);
    procedure SpeedButton5Click(Sender: TObject);
    procedure qReporteCalcFields(DataSet: TDataSet);
    procedure N11Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure qReportePRIORIDADDANOValidate(Sender: TField);
    procedure sbFechaLimiteClick(Sender: TObject);
    procedure qReporteFECHALIMITERESPUESTAValidate(Sender: TField);
    procedure qReporteCODIGOTRAFODISValidate(Sender: TField);
    procedure Panel2Click(Sender: TObject);
    procedure qReporteCODIGOTRAFODISChange(Sender: TField);
    procedure Label21DblClick(Sender: TObject);
    procedure lbCodigoDblClick(Sender: TObject);
    procedure dMenuCIGSelectID(Sender: tnMenuItem; ID: Integer;
      MenuEstructura: tMenuEs);
    procedure dbeDireccionDanoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure sbFechaSADClick(Sender: TObject);
    procedure sbBuscarCIGClick(Sender: TObject);
    procedure dbeCIGKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbeCIGChange(Sender: TObject);
    procedure sbAsignarODTClick(Sender: TObject);
    procedure qReporteAfterClose(DataSet: TDataSet);
    procedure sbUbicarNodoFisicoClick(Sender: TObject);
    procedure sbUbicarComercialClick(Sender: TObject);
    procedure sbUbicarMedidorClick(Sender: TObject);
    procedure qReportePINTADOAPOYOValidate(Sender: TField);
    procedure qReporteCODIGOCLIENTECOMValidate(Sender: TField);
    procedure qReporteCODIGOCONTADORValidate(Sender: TField);
    procedure qReporteTELEFONOValidate(Sender: TField);
    procedure qReporteDIRECCIONINFORMANTEValidate(Sender: TField);
    procedure SpBUSCARDIRClick(Sender: TObject);
    procedure sbFechaRegistroClick(Sender: TObject);
    procedure qReporteFECHAHORAValidate(Sender: TField);
    procedure sbClienteClick(Sender: TObject);
    procedure sbAlumbradoClick(Sender: TObject);
    procedure sbBuscarLuminariaClick(Sender: TObject);
    procedure qReporteAfterPost(DataSet: TDataSet);
    procedure qReporteCODIGOTIPOREPORTEChange(Sender: TField);
    procedure SpeedButton3Click(Sender: TObject);
    procedure qReportePINTADOAPOYOChange(Sender: TField);
    procedure sbBorrarClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure qReporteCODIGOESTADOREPORTEChange(Sender: TField);
    procedure qReporteXChange(Sender: TField);
    procedure qReporteYChange(Sender: TField);
    procedure qReporteCODIGOAPOYOChange(Sender: TField);
    procedure qReporteCODIGOCLIENTESGDChange(Sender: TField);
    procedure qReporteBeforePost(DataSet: TDataSet);
    procedure qReporteTIPOCLIENTEChange(Sender: TField);
    procedure qReporteTELEFONORECIBEChange(Sender: TField);
    procedure sbMailClick(Sender: TObject);
    procedure qReporteCODIGOCLIENTESGDValidate(Sender: TField);
    procedure qReporteCODIGOINFORMANTEValidate(Sender: TField);
    procedure qReporteTIPOCLIENTEValidate(Sender: TField);
    procedure Timer1Timer(Sender: TObject);
    procedure sbUbicarReporteClick(Sender: TObject);
    procedure dbeNodoFisicoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeTelefonoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeComercialKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure qReporteCODIGOCLASEREPORTEChange(Sender: TField);
    procedure bbtnAuditoriaClick(Sender: TObject);
    procedure dblcbTipoDanoKeyPress(Sender: TObject; var Key: Char);
    procedure qReporteCODIGOADMINISTRATIVOChange(Sender: TField);
    procedure qReporteCIAINFORMANTEChange(Sender: TField);
    procedure qReporteCODIGOINFORMANTEChange(Sender: TField);
    procedure qReporteCODIGOGRUPOTRABAJOValidate(Sender: TField);
    procedure SpeedButton6Click(Sender: TObject);
    procedure fTipoLaborReporteClick(Sender: TObject);
    procedure qReporteAfterOpen(DataSet: TDataSet);
    procedure lanzavistaeventoClick(Sender: TObject);
    procedure dbeFechaAtencionChange(Sender: TObject);
    procedure eCodElementoOperacionKeyPress(Sender: TObject; var Key: Char);
    procedure tcodigocausaExit(Sender: TObject);
    procedure tcodigocausaKeyPress(Sender: TObject; var Key: Char);
    procedure pintadoapoyoeventoKeyPress(Sender: TObject; var Key: Char);
    procedure sbubicarencartografiaClick(Sender: TObject);
    procedure eCodElementoOperacionChange(Sender: TObject);
    procedure qReporteCODIGOCIRCUITOChange(Sender: TField);
    procedure qReporteFECHAHORAATENCIONChange(Sender: TField);
    procedure qReporteFECHAHORAChange(Sender: TField);
    procedure qReporteOBSERVACIONChange(Sender: TField);
    procedure SpeedButton9Click(Sender: TObject);
    procedure qReporteFECHAHORADICTADOChange(Sender: TField);
    procedure sbBuscarMedidorClick(Sender: TObject);
    procedure qReporteCODIGOCLASECLIENTEChange(Sender: TField);
    procedure sbGestionarOdtClick(Sender: TObject);
    procedure IraODT1Click(Sender: TObject);
    procedure pcDatosChange(Sender: TObject);
  private
    NumeroODT: double;
    TiempoMaximoAtencion: double;
    MensajeEstado: string;
    bConectoASFTP: Boolean;
    procedure DatosIniciales;
    function BuscaDatos(BuscaCliente: Integer): Boolean;
    procedure CambiarEstadoEdit(Edit: TDBEdit; Estado: Boolean);
    procedure CargarBarraTipoReporte;
    function GetFechaHora: String;
    function GetFecha: String;
    // Verifica que el usuario actual puede editar un reporte
    function EditarReporte: Integer;
    function FechaServidor: string;
    // procedure ActualizarReportesHijos;
    procedure LimpiarDireccion;
    procedure ActualizarEstadoRecibido;
    procedure ValidarTipoCliente;
    function ReportePadre(sql: String): String;
    Function EncontrarInterruptorEvento(TipoLabor: TTipoLabor): String;
    Function EncontrarPintadoApoyoEvento(CodigoInterruptor: String): String;
    Function ExisteEventoReporte(CodigoReporte: String): Boolean;
    function evento_apertura(codigocierre: Integer): Integer;
    Function ValidarReporteAbiertoCliente(CodCuenta: String;
      var sReportesAbiertos: String): Boolean;
    procedure LimpiarDatosCliente();
    function DescripcionDireccion(ds: TDataSet; Control: TControl): String;
    function GenerarAsignacionMovil(pCodigoODT, pConsecutivo: string): Boolean;
    procedure MostrarListaReportes;
  public
    CodigoCausaInicial: String;
    CambioElementoEvento, CertificadoLAC, cambiarElementoOperacion: Boolean;
    ContadorArray: Integer;
    ArraySL: array of TStringList;
    InterruptorEvento, PintadoApoyoTrafoEvento, TipoObjetoEvento: String;
    codigoevento: Integer;
    BitacoraProceso: TStringList; // OJORITOQUITAR
    BitacoraReporte: TStringList;
    UbicacionElectrica, UbicadoEnCartografia: Boolean;
    bDatosIncompletos, bCancelando, InsertarReporte: Boolean;
    ModoInsercion: Boolean;
    Fecha: string;
    Correo: TDatosCorreo;
    Procedure VerificarReporte(codigocliente: string);
    Procedure EnlazarSoereporte();
    function EstimarPrioridad(TipoReporte, TipoCliente: string): Integer;
    function VerificarSeguimiento: Boolean;
    function getDatosCorreo: TDatosCorreo;
    procedure ActualizarBarraEstado;
    function existenodo(pintadoapoyo: string): Integer;
    procedure MostrarVistaLateral(CodigoApoyo: Extended);
    function EncontrarInterruptorComun: String;
    Function HallarInterruptorRamalUnico(Codigocircuito, Codigotrafodis
      : String): String;
    Function HallarInterruptorRamalVarios(CodigoReporte: String): String;
    function QuitarEventoReporte(CodigoReporte: String): Boolean;
    procedure EditarODTHija;
    function ExisteTransaccionActual: boolean;
  end;

var
  fReporte: TfReporte;
  Duplicado: Boolean;

implementation

uses uFormaFecha, uDatosComercial, uFIMPComunes, uListaReportes,
  uInfoElectricoCliente, uQRReporte, uQRElementoReporte, uFuncionSGD,
  uInformacionReporte, uElementosElectricos, uReporteSimilar,
  uArbolInterruptores, uBuscarTipoDano, ConsDll, uAsignarODT,
  uComunesAdministrativo, uListaLamparaAP, ulistareportesasociados,
  ulista_soe_causaevento, uFIMPAdministrativo, uDescripcionDireccion,
  uODTUrbanaRural;

{$R *.DFM}

procedure TfReporte.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    if (ActiveControl is TDBLookupComboBox) then
    begin
      if not(ActiveControl as TDBLookupComboBox).ListVisible then
        Perform(wm_NextDLGCTL, 0, 0);
    end
    else
    begin
      Perform(wm_NextDLGCTL, 0, 0);
      Key := #0;
    end
  end;
end;

procedure TfReporte.FormActivate(Sender: TObject);
begin
  if qReporte.State in [dsInsert] then // Insertando un Nuevo Registro
  begin
    CambiarEstadoEdit(dbeFechaLlegada, False);
    sbFechaLlegada.Enabled := False;
    CambiarEstadoEdit(dbeFechaAtencion, False);
    sbFechaAtencion.Enabled := False;
    CargarBarraTipoReporte;
  end;
  if qReporteCODIGOADMINISTRATIVO.AsString <> '' then
    qReporteCODIGOADMINISTRATIVOValidate(qReporteCODIGOADMINISTRATIVO);
  if qReporteCODIGOTIPOREPORTE.AsString <> '' then
    qReporteCODIGOTIPOREPORTEValidate(qReporteCODIGOTIPOREPORTE);

  if qReporteCODIGOINFORMANTE.AsString <> '' then
    qReporteCODIGOINFORMANTEValidate(qReporteCODIGOINFORMANTE);
end;

procedure TfReporte.DatosIniciales;
var
  qFecha: TQuery;
begin
  UbicadoEnCartografia := False;
  RefrescarVariables;
  with qReporte do
  begin
    qFecha := TQuery.Create(Application);
    qFecha.DataBaseName := 'BaseDato';
    qFecha.sql.Text := 'SELECT SYSDATE FROM DUAL';
    qFecha.Open;
    // FieldByName('FECHAHORA').AsDateTime:=Now;
    FieldByName('FECHAHORA').AsDateTime := qFecha.Fields[0].AsDateTime;
    qFecha.Free;
    FieldByName('CODIGOINFORMANTE').AsString := '01'; // Telefono / Cliente
    FieldByName('CODIGOCLASEREPORTE').AsString := '1'; // Sin Definir
    if (UpperCase(nombreAplicativo) = 'ENERGISAP') then
      FieldByName('CODIGOTIPOREPORTE').AsString := 'A' // AP
    else
      FieldByName('CODIGOTIPOREPORTE').AsString := 'D'; // Daño
    FieldByName('CODIGOESTADOREPORTE').AsString := '1'; // Recibido
    FieldByName('ORIGENREPORTE').AsString := 'D'; // Pendiente
    FieldByName('CIGDANO').AsString := '1'; // Pendiente
    FieldByName('PRIORIDADDANO').AsString := '3'; // Prioridad de daño 3
    FieldByName('REGISTROS').AsString := '1';
    FieldByName('CODIGOUSUARIOCREACION').AsInteger := VarCodigoUsuario;
    // Usuario Creacion
    FieldByName('TIPOCLIENTE').AsString := 'N'; // Usuario Creacion
    FieldByName('TELEFONORECIBE').AsString := '118';
  end;
end;

procedure TfReporte.qReporteAfterInsert(DataSet: TDataSet);
begin
  DatosIniciales;
  qReporteFECHACREACION.AsString := FechaServidor;
end;

procedure TfReporte.dMenuArbol1SelectID(Sender: tnMenuItem; ID: Integer;
  MenuEstructura: tMenuEs);
begin
  dsReporte.DataSet.FieldByName('CODIGOADMINISTRATIVO').AsInteger := ID;
  LbCia1.Caption := Sender.Caption;
  lbCia2.Caption := Sender.Caption;
end;

procedure TfReporte.FormCreate(Sender: TObject);
var
  query: TQuery;
begin
  SetEsquemaEnerGis;
  UbicacionElectrica := False;
  UbicadoEnCartografia := False;
  bCancelando := False;
  fInfoElectricoCliente := TfInfoElectricoCliente.Create(Application);
  FElementosElectricos := TFElementosElectricos.Create(Application);
  FArbolInterruptores := TFArbolInterruptores.Create(Application);
  ModoInsercion := False;
  NumeroODT := 0;
  TiempoMaximoAtencion := 0;
  qTipoDano.Open;
  if (UpperCase(nombreAplicativo) = 'ENERGISAP') then
  begin
    pTipoReporte.Visible := False;
    rgClaseReporte.Visible := False;
  end;
  nbInformante.Visible := False;
  qTipoCliente.Open;
  Correo := getDatosCorreo;
  MensajeEstado := '';
  Timer1.Interval := 20000;
  Timer1.Enabled := true;
  Duplicado := False;

  qReporteElemento.Open;
  qTipoCliente.Open;
  qClaseCliente.Open;
  qAdministrativo.Open;
  qClaseReporte.Open;
  qTipoReporte.Open;
  qGeografico.Open;
  qEstructura.Open;
  qSubestacion.Open;
  qCircuito.Open;
  qTiempo.Open;
  qTelefonoRecibe.Open;
  qEstadoReporte.Open;
  qTipoInformante.Open;
  qClaseCliente.Open;
  qTipoLaborReporte.Open;
  InterruptorEvento := '';
  CambioElementoEvento := False;
  CertificadoLAC := False;
  cambiarElementoOperacion := true;

  query := TQuery.Create(nil);
  query.DataBaseName := 'BaseDato';
  query.sql.Text := 'SELECT VALOR FROM PARAMETRO WHERE CODIGOPARAMETRO=''IPM''';
  query.Open;
  Host_SFTP := query.FieldByName('VALOR').AsString;
  query.Close;
  query.Free;
end;

procedure TfReporte.CambiarEstadoEdit(Edit: TDBEdit; Estado: Boolean);
begin
  if not Estado then
  begin
    Edit.Color := clSilver;
    Edit.Enabled := False;
  end
  else
  begin
    Edit.Color := clWindow;
    Edit.Enabled := true;
  end;
end;

function TfReporte.GetFechaHora: String;
begin
  fFormaFecha := TfFormaFecha.Create(Application);
  uFormaFecha.sFecha := Fecha;
  fFormaFecha.height := 291;
  if fFormaFecha.ShowModal = mrOk then
    Result := DateTimetoStr(fFormaFecha.Date + fFormaFecha.fTime)
  else
    Result := sFecha;
  fFormaFecha.Free;
end;

procedure TfReporte.sbFechaDictadoClick(Sender: TObject);
var
  sFecha: string;
begin
  sFecha := '';
  Fecha := '';
  dbeFechaDictado.Setfocus;
  Fecha := qReporteFECHAHORADICTADO.AsString;
  if Fecha = '' then
    Fecha := FechaServidor;

  sFecha := GetFechaHora;
  if sFecha <> '' then
  begin
    if (StrToDateTime(sFecha) <= now) then
    begin
      qReporte.FieldByName('FECHAHORADICTADO').AsString := sFecha;
      qReporte.FieldByName('FECHAHORADESCARGA').AsString := sFecha;
      qReporte.FieldByName('CODIGOESTADOREPORTE').AsString := '2'; // Asignado
      if qReporte.FieldByName('FECHAHORALLEGADA').AsString <> '' then
        qReporte.FieldByName('CODIGOESTADOREPORTE').AsString := '3';
      // Ejecucion
      if qReporte.FieldByName('FECHAHORAATENCION').AsString <> '' then
        qReporte.FieldByName('CODIGOESTADOREPORTE').AsString := '4'; // Reparado

      dblcbEstadoReporte.Refresh;
      CambiarEstadoEdit(dbeFechaLlegada, true);
      sbFechaLlegada.Enabled := true;
    end
    else
      raise Exception.Create
        ('La fecha no puede ser mayor que la fecha del sistema.');
  end;
end;

procedure TfReporte.sbFechaLlegadaClick(Sender: TObject);
var
  sFecha: string;
begin
  sFecha := '';
  Fecha := '';
  // dbeFechaDictado.Setfocus;
  Fecha := qReporteFECHAHORALLEGADA.AsString;
  if Fecha = '' then
    Fecha := FechaServidor;
  sFecha := GetFechaHora;
  if sFecha <> '' then
  begin
    if (StrToDateTime(sFecha) <= now) then
    begin
      qReporte.FieldByName('FECHAHORALLEGADA').AsString := sFecha;
      qReporte.FieldByName('CODIGOESTADOREPORTE').AsString := '3';
      // En ejecución
      if qReporte.FieldByName('FECHAHORAATENCION').AsString <> '' then
        qReporte.FieldByName('CODIGOESTADOREPORTE').AsString := '4'; // Reparado
      CambiarEstadoEdit(dbeFechaAtencion, true);
      sbFechaAtencion.Enabled := true;
    end
    else
      raise Exception.Create
        ('La fecha no puede ser mayor que la fecha del sistema.');
  end;
end;

procedure TfReporte.sbFechaAtencionClick(Sender: TObject);
var
  sFecha: string;
begin
  sFecha := '';
  Fecha := '';
  dbeFechaLlegada.Setfocus;
  Fecha := qReporteFECHAHORAATENCION.AsString;
  if Fecha = '' then
    Fecha := FechaServidor;
  sFecha := GetFechaHora;
  if sFecha <> '' then
  begin
    if (StrToDateTime(sFecha) <= now) then
    begin
      qReporte.FieldByName('FECHAHORAATENCION').AsString := sFecha;
      qReporte.FieldByName('CODIGOESTADOREPORTE').AsString := '4'; // Reparado
    end
    else
      raise Exception.Create
        ('La fecha no puede ser mayor que la fecha del sistema.');
  end;
end;

procedure TfReporte.qReporteFECHAHORADICTADOValidate(Sender: TField);
begin
  Application.ProcessMessages;
  if Sender.Text <> '' then
  begin
    if (Sender.AsDateTime > now) then
      raise Exception.Create
        ('La fecha de dictado no puede ser mayor que la fecha del sistema.');

    if (qReporteFECHAHORA.AsString <> '') then
    begin
      if (Sender.AsDateTime < qReporteFECHAHORA.AsDateTime) then
        raise Exception.Create
          ('La fecha de dictado no puede ser menor que la fecha de recepción del reporte.')
      else if (TiempoMaximoAtencion > 0) then
        if (((Sender.AsDateTime - qReporteFECHAHORA.AsDateTime) * 24 * 60) >
          TiempoMaximoAtencion) then
        // tiempo de atencion mayor de atencion máximo esperado
          if Application.MessageBox
            ('El tiempo de dictado supera el tiempo esperado.  Desea conservarlo?',
            PChar('Confirmación'), MB_ICONQUESTION + MB_YESNO) = idNo then
            abort;
    end
    else
      raise Exception.Create
        ('La fecha de recepción del reporte no puede estar vacía.');
    if (qReporteFECHAHORALLEGADA.AsString <> '') then
    begin
      if (Sender.AsDateTime > qReporteFECHAHORALLEGADA.AsDateTime) then
        raise Exception.Create
          ('La fecha de dictado no puede ser mayor que la fecha de llegada al sitio de trabajo.');
    end;
    if (qReporteFECHAHORAATENCION.AsString <> '') then
    begin
      if (Sender.AsDateTime > qReporteFECHAHORAATENCION.AsDateTime) then
        raise Exception.Create
          ('La fecha de dictado no puede ser mayor que la fecha de atención del reporte.');
    end;
  end;
end;

procedure TfReporte.qReporteFECHAHORALLEGADAValidate(Sender: TField);
begin
  if Sender.Text <> '' then
  begin
    if (Sender.AsDateTime > now) then
      raise Exception.Create
        ('La fecha de llegada no puede ser mayor que la fecha del sistema.');

    if (qReporteFECHAHORA.AsString <> '') then
    begin
      if (Sender.AsDateTime < qReporteFECHAHORA.AsDateTime) then
        raise Exception.Create
          ('La fecha de llegada al sitio de trabajo no puede ser menor' +
          Chr(13) + 'que la fecha de recepción del reporte.');
    end
    else
      raise Exception.Create
        ('La fecha de recepción del reporte no puede estar vacía.');
    if (qReporteFECHAHORADICTADO.AsString <> '') then
    begin
      if (Sender.AsDateTime < qReporteFECHAHORADICTADO.AsDateTime) then
        raise Exception.Create
          ('La fecha de llegada al sitio de trabajo no puede ser menor' +
          Chr(13) + 'que la fecha de dictado del reporte a la cuadrilla.')
      else if (TiempoMaximoAtencion > 0) then
        if (((Sender.AsDateTime - qReporteFECHAHORADICTADO.AsDateTime) * 24 *
          60) > TiempoMaximoAtencion) then
        // tiempo de atencion mayor de atencion máximo esperado
          if Application.MessageBox
            ('El tiempo de llegada supera el tiempo esperado.  Desea conservarlo?',
            PChar('Confirmación'), MB_ICONQUESTION + MB_YESNO) = idNo then
            abort;
    end
    else
      raise Exception.Create
        ('La fecha de dictado del reporte no puede estar vacía.');
    if (qReporteFECHAHORAATENCION.AsString <> '') then
    begin
      if (Sender.AsDateTime > qReporteFECHAHORAATENCION.AsDateTime) then
        raise Exception.Create
          ('La fecha de dictado no puede ser mayor que la fecha de atención del reporte.');
    end;
  end;
end;

procedure TfReporte.qReporteFECHAHORAATENCIONValidate(Sender: TField);
begin
  if Sender.Text <> '' then
  begin
    if (Sender.AsDateTime > now) then
      raise Exception.Create
        ('La fecha de atención no puede ser mayor que la fecha del sistema.');

    if (qReporteFECHAHORA.AsString <> '') then
    begin
      if (Sender.AsDateTime < qReporteFECHAHORA.AsDateTime) then
        raise Exception.Create
          ('La fecha de atención del reporte no puede ser menor' + Chr(13) +
          'que la fecha de recepción del reporte.');
    end
    else
      raise Exception.Create
        ('La fecha de recepción del reporte no puede estar vacía.');
    if (qReporteFECHAHORADICTADO.AsString <> '') then
    begin
      if (Sender.AsDateTime < qReporteFECHAHORADICTADO.AsDateTime) then
        raise Exception.Create
          ('La fecha de atención del reporte no puede ser menor' + Chr(13) +
          'que la fecha de dictado del reporte a la cuadrilla.');
    end
    else
      raise Exception.Create
        ('La fecha de dictado del reporte no puede estar vacía.');
    if (qReporteFECHAHORALLEGADA.AsString <> '') then
    begin
      if (Sender.AsDateTime < qReporteFECHAHORALLEGADA.AsDateTime) then
        raise Exception.Create
          ('La fecha de atención del reporte no puede ser menor' + Chr(13) +
          'que la fecha de llegada al sitio de trabajo.')
      else if (TiempoMaximoAtencion > 0) then
        if ((((Sender.AsDateTime - qReporteFECHAHORALLEGADA.AsDateTime) / 24) *
          60) > TiempoMaximoAtencion) then
        // tiempo de atencion mayor de atencion máximo esperado
          if Application.MessageBox
            ('El tiempo de atención supera el tiempo esperado.  Desea conservarlo?',
            PChar('Confirmación'), MB_ICONQUESTION + MB_YESNO) = idNo then
            abort;
    end
    else
      raise Exception.Create
        ('La fecha de llegada al sitio de trabajo del reporte no puede estar vacía.');
  end;
end;

function TfReporte.BuscaDatos(BuscaCliente: Integer): Boolean;
var
  VerDatos, Entro: Boolean;
  qDatos: TQuery;
  qDireccion: TQuery;
begin
  Result := False;
  VerDatos := False;
  Entro := False;
  qSuscriptor.Close;
  qSuscriptor.sql.Clear;
  qSuscriptor.sql.Add
    ('Select A.codigobarrio, A.codigozona, A.codigociudad, C.direccionsuscriptor,');
  qSuscriptor.sql.Add
    ('c.nombresuscriptor, A.CodigoApoyo, C.codigoCLIENTEsgd,  C.CodigoClienteCOM,');
  qSuscriptor.sql.Add
    ('C.CODIGOCIRCUITO, C.CODIGOTRAFODIS, A.PintadoApoyo, C.CodigoContador');
  qSuscriptor.sql.Add('from Apoyo A, Clientesgd C');
  qSuscriptor.sql.Add
    ('where (a.codigoapoyo = c.codigoapoyo) and c.codigoestadoinfraestructura <> 3 ');
  case BuscaCliente of
    0:
      begin // Nombre
        if dbeNombreInformante.Text <> '' then
        begin
          qSuscriptor.sql.Add('And (C.NombreSuscriptor LIKE ''%' +
            dbeNombreInformante.Text + '%'')');
          Entro := true;
        end;
      end;
    1:
      begin // Telefono
        if dbeTelefono.Text <> '' then
        begin
          qSuscriptor.sql.Add('And (C.TelefonoSuscriptorSGD = ''' +
            dbeTelefono.Text + ''')');
          Entro := true;
        end;
      end;
    2:
      begin // Nodo Fisico Apoyo
        if dbeNodoFisico.Text <> '' then
        begin
          qSuscriptor.sql.Add('And (A.PINTADOAPOYO = ''' +
            dbeNodoFisico.Text + ''')');
          Entro := true;
        end;
      end;
    3:
      begin // Suscriptor Comercial
        if (dbeComercial.Text <> '') then
        begin
          qSuscriptor.sql.Add
            ('And ( SGC_FUN_CONVERTIR_CLAVE(C.codigo_cuenta) = SGC_FUN_CONVERTIR_CLAVE('''
            + dbeComercial.Text + '''))');
          Entro := true;
        end;
      end;
    4:
      begin // Codigo Contador
        if dbeMedidor.Text <> '' then
        begin
          qSuscriptor.sql.Add('And (C.CODIGOCONTADOR = ''' +
            dbeMedidor.Text + ''')');
          Entro := true;
        end;
      end;
    5:
      begin // Codigo Contador
        if dbeDireccionDano.Text <> '' then
        begin
          qSuscriptor.sql.Add('AND ((c.CODIGOTIPOVIA= ' +
            qReporteCODIGOTIPOVIA.AsString + ') AND ( c.CODIGONOMBREVIA = ' +
            qReporteCODIGONOMBREVIA.AsString + ') AND (c.DUPLICADOR =' +
            qReporteDUPLICADOR.AsString + ')AND (c.NUMEROPUERTA =' +
            qReporteNUMEROPUERTA.AsString + '   ))');
          Entro := true;
        end;
      end;
  end;
  if Entro then
  begin
    qSuscriptor.Open;
    if not(qSuscriptor.IsEmpty) then
    begin
      fDatosComercial := TfDatosComercial.Create(Application);
      try
        fDatosComercial.tComercializador.Open;
        fDatosComercial.qClienteComercial.Open;
        if (fDatosComercial.qClienteComercial.RecordCount > 0) then
        begin
          fDatosComercial.dsClienteComercial.DataSet :=
            fDatosComercial.qClienteComercial;
          try
            fDatosComercial.lbTotal.Caption :=
              IntToSTr(qSuscriptor.RecordCount);
            if fDatosComercial.ShowModal = mrOk then
            begin
              Result := true;
              // Se trae los datos
              with fDatosComercial.qClienteComercial do
              begin
                // if (qReporte.FieldByName('NOMBREINFORMANTE').AsString='') then
                qReporte.FieldByName('NOMBREINFORMANTE').AsString :=
                  FieldByName('NOMBRESUSCRIPTOR').AsString;
                // if (qReporte.FieldByName('TELEFONO').AsString='') then
                qReporte.FieldByName('TELEFONO').AsString :=
                  FieldByName('TELEFONOSUSCRIPTORSGD').AsString;
                // if (qReporte.FieldByName('DIRECCIONDANO').AsString='') then
                qReporte.FieldByName('DIRECCIONDANO').AsString :=
                  FieldByName('DIRECCIONSUSCRIPTOR').AsString;
                // if (qReporte.FieldByName('CODIGOAPOYO').AsString='') then
                qReporte.FieldByName('CODIGOAPOYO').AsString :=
                  FieldByName('CODIGOAPOYO').AsString;
                // if (qReporte.FieldByName('PINTADOAPOYO').AsString='') then
                qReporte.FieldByName('PINTADOAPOYO').AsString :=
                  FieldByName('PINTADOAPOYO').AsString;

                // if (qReporte.FieldByName('CIGDANO').AsString='') then
                qReporte.FieldByName('CIGDANO').AsString :=
                  FieldByName('CODIGOGEOGRAFICO').AsString;

                qDireccion := TQuery.Create(self);
                qDireccion.DataBaseName := 'BaseDato';
                qDireccion.sql.Add('SELECT CODIGOTIPOVIA,CODIGONOMBREVIA,');
                qDireccion.sql.Add
                  ('MODIFICADORVIA, DUPLICADOR, MODIFICADORDUPLICADOR,');
                qDireccion.sql.Add
                  ('NUMEROPUERTA, CODIGOTIPOPREDIO, DESCRIPCIONTIPOPREDIO');
                if (qReporteCODIGOTIPOREPORTE.AsString = 'C') or
                  (qReporteCODIGOTIPOREPORTE.AsString = 'D') then
                begin
                  qDireccion.sql.Add
                    (', CODIGOTIPOVERTICAL, VERTICAL, CODIGOTIPOINTERIOR, PISO, INTERIOR ');
                  qDireccion.sql.Add('FROM CLIENTESGD WHERE CODIGOCLIENTESGD=' +
                    FieldByName('CODIGOCLIENTESGD').AsString);
                  qDireccion.Open;
                  // if (dbeDireccionDano.Text='') then
                  // begin
                  qReporte.FieldByName('CODIGOTIPOVIA').AsString :=
                    qDireccion.FieldByName('CODIGOTIPOVIA').AsString;
                  qReporte.FieldByName('CODIGONOMBREVIA').AsString :=
                    qDireccion.FieldByName('CODIGONOMBREVIA').AsString;
                  qReporte.FieldByName('MODIFICADORVIA').AsString :=
                    qDireccion.FieldByName('MODIFICADORVIA').AsString;
                  qReporte.FieldByName('DUPLICADOR').AsString :=
                    qDireccion.FieldByName('DUPLICADOR').AsString;
                  qReporte.FieldByName('MODIFICADORDUPLICADOR').AsString :=
                    qDireccion.FieldByName('MODIFICADORDUPLICADOR').AsString;
                  qReporte.FieldByName('NUMEROPUERTA').AsString :=
                    qDireccion.FieldByName('NUMEROPUERTA').AsString;
                  qReporte.FieldByName('CODIGOTIPOVERTICAL').AsString :=
                    qDireccion.FieldByName('CODIGOTIPOVERTICAL').AsString;
                  qReporte.FieldByName('VERTICAL').AsString :=
                    qDireccion.FieldByName('VERTICAL').AsString;
                  qReporte.FieldByName('CODIGOTIPOINTERIOR').AsString :=
                    qDireccion.FieldByName('CODIGOTIPOINTERIOR').AsString;
                  qReporte.FieldByName('PISO').AsString :=
                    qDireccion.FieldByName('PISO').AsString;
                  qReporte.FieldByName('INTERIOR').AsString :=
                    qDireccion.FieldByName('INTERIOR').AsString;
                  qReporte.FieldByName('CODIGOTIPOPREDIO').AsString :=
                    qDireccion.FieldByName('CODIGOTIPOPREDIO').AsString;
                  qReporte.FieldByName('DESCRIPCIONTIPOPREDIO').AsString :=
                    qDireccion.FieldByName('DESCRIPCIONTIPOPREDIO').AsString +
                    ' - ' + FieldByName('DIRECCIONSUSCRIPTOR').AsString;
                  qReporte.FieldByName('CODIGOCONTADOR').AsString :=
                    FieldByName('CODIGOCONTADOR').AsString;
                  qReporte.FieldByName('CODIGOCLIENTESGD').AsString :=
                    FieldByName('CODIGOCLIENTESGD').AsString;
                  qReporte.FieldByName('CODIGOCLIENTECOM').AsString :=
                    FieldByName('CODIGOCLIENTECOM').AsString;

                  // end;
                end;
                if (qReporteCODIGOTIPOREPORTE.AsString = 'A') then
                begin
                  if (dbeDireccionDano.Text = '') then
                  begin
                    qDireccion.sql.Add('FROM APOYO WHERE CODIGOAPOYO=' +
                      FieldByName('CODIGOAPOYO').AsString);
                    qDireccion.Open;
                    qReporte.FieldByName('CODIGOTIPOVIA').AsString :=
                      qDireccion.FieldByName('CODIGOTIPOVIA').AsString;
                    qReporte.FieldByName('CODIGONOMBREVIA').AsString :=
                      qDireccion.FieldByName('CODIGONOMBREVIA').AsString;
                    qReporte.FieldByName('MODIFICADORVIA').AsString :=
                      qDireccion.FieldByName('MODIFICADORVIA').AsString;
                    qReporte.FieldByName('DUPLICADOR').AsString :=
                      qDireccion.FieldByName('DUPLICADOR').AsString;
                    qReporte.FieldByName('MODIFICADORDUPLICADOR').AsString :=
                      qDireccion.FieldByName('MODIFICADORDUPLICADOR').AsString;
                    qReporte.FieldByName('NUMEROPUERTA').AsString :=
                      qDireccion.FieldByName('NUMEROPUERTA').AsString;
                    qReporte.FieldByName('CODIGOTIPOPREDIO').AsString :=
                      qDireccion.FieldByName('CODIGOTIPOPREDIO').AsString;
                    qReporte.FieldByName('DESCRIPCIONTIPOPREDIO').AsString :=
                      qDireccion.FieldByName('DESCRIPCIONTIPOPREDIO').AsString;
                  end;
                end;
                qDireccion.Free;

              end;

            end
            else
              Result := False;

          except
            on E: Exception do
              ShowMessage(E.Message);
          end;

        end
        else
          MessageDlg('No Existe este código de Suscriptor ' + Chr(13) +
            'Dentro de la Base de Datos de Comercial.', mtInformation,
            [mbOK], 0);
      finally
        fDatosComercial.Free;
      end;
      if (qSuscriptor.FieldByName('CODIGOCLIENTESGD').AsString <> '') then
        VerDatos := true;
    end;

  end;

  if not VerDatos then
  begin
    Result := False;
    raise Exception.Create('No Existe este código de Suscriptor ' + Chr(13) +
      'Dentro de la Base de Datos de Comercial.');
  end;

end;

procedure TfReporte.sbBuscarNombreClick(Sender: TObject);
var
  sReportesAbiertos: String;
begin

  if not  (trim(dbeNombreInformante.Text) = EmptyStr) then
  begin
    BuscaDatos(0);
    if not  (trim(qReporteCODIGOCLIENTECOM.AsString) = EmptyStr) then
    begin
    if ValidarReporteAbiertoCliente(qReporteCODIGOCLIENTECOM.AsString,
      sReportesAbiertos) then
    begin
      LimpiarDatosCliente();
      Application.MessageBox(PChar('No puede seleccionar ese cliente ' + Chr(13)
        + 'por que tiene los siguientes reportes abiertos:' + Chr(13) +
        sReportesAbiertos), PChar('Información'), mb_ok + MB_ICONINFORMATION);
    end;

    end;

  end
  else
    Application.MessageBox
      (PChar('El nombre no es valido, escriba uno e intente nuevamente.'),
      PChar('Información'), mb_ok + mb_iconerror);
end;

procedure TfReporte.sbBuscarTelefonoClick(Sender: TObject);
var
  sReportesAbiertos: String;
begin
  if (trim(dbeTelefono.Text) <> '') then
  begin
    if BuscaDatos(1) then
    begin
      if ValidarReporteAbiertoCliente(qReporteCODIGOCLIENTECOM.AsString,
        sReportesAbiertos) then
      begin
        LimpiarDatosCliente();
        Application.MessageBox(PChar('No puede seleccionar ese cliente ' +
          Chr(13) + 'por que tiene los siguientes reportes abiertos:' + Chr(13)
          + sReportesAbiertos), PChar('Información'),
          mb_ok + MB_ICONINFORMATION);
      end;
    end;
  end
  else
    Application.MessageBox
      (PChar('El numero de cliente de comercial no es valido, escriba uno e intente nuevamente.'),
      PChar('Información'), mb_ok + mb_iconerror);

end;

procedure TfReporte.sbBuscarNodoFisicoClick(Sender: TObject);
var
  sReportesAbiertos: String;
begin
  BuscaDatos(2);
  if ValidarReporteAbiertoCliente(qReporteCODIGOCLIENTECOM.AsString,
    sReportesAbiertos) then
  begin
    LimpiarDatosCliente();
    Application.MessageBox(PChar('No puede seleccionar ese cliente ' + Chr(13) +
      'por que tiene los siguientes reportes abiertos:' + Chr(13) +
      sReportesAbiertos), PChar('Información'), mb_ok + MB_ICONINFORMATION);
  end;
end;

procedure TfReporte.sbBuscarComercialClick(Sender: TObject);
var
  sReportesAbiertos: String;
  Mensaje: String;
begin
  if not(trim(dbeComercial.Text) = EmptyStr) then
  begin
    if BuscaDatos(3) then
    begin
      if ValidarReporteAbiertoCliente(qReporteCODIGOCLIENTECOM.AsString,
        sReportesAbiertos) then
      begin
        LimpiarDatosCliente();
        Application.MessageBox(PChar('No puede seleccionar ese cliente ' +
          Chr(13) + 'por que tiene los siguientes reportes abiertos:' + Chr(13)
          + sReportesAbiertos), PChar('Información'),
          mb_ok + MB_ICONINFORMATION);
      end;
    end;
  end
  else
    Application.MessageBox
      (PChar('El numero de cliente de comercial no es valido, escriba uno e intente nuevamente.'),
      PChar('Información'), mb_ok + mb_iconerror);
end;

procedure TfReporte.qReporteCODIGOESTADOREPORTEValidate(Sender: TField);
begin
  if Sender.Text <> '' then
  begin
    if (Sender.Text = '2') and (dbeFechaDictado.Text = '') then
      raise Exception.Create
        ('Para Cambiar el Estado del Reporte a Asignado, Debe' + Chr(13) +
        'Llenar la Fecha de Dictado.');
    if (Sender.Text = '3') and (dbeFechaDictado.Text = '') then
      raise Exception.Create
        ('Para Cambiar el Estado del Reporte a En Ejecución, Debe' + Chr(13) +
        'Llenar la Fecha de Dictado.');
    if (Sender.Text = '3') and (dbeFechaLlegada.Text = '') then
      raise Exception.Create
        ('Para Cambiar el Estado del Reporte a En Ejecución, Debe' + Chr(13) +
        'Llenar la Fecha de Llegada.');
    if (Sender.Text = '4') and (dbeFechaAtencion.Text = '') then
      raise Exception.Create
        ('Para Cambiar el Estado del Reporte a Reparado, Debe' + Chr(13) +
        'Llenar la Fecha de Atención.');
  end;
end;

procedure TfReporte.bbAceptarClick(Sender: TObject);

  procedure GenerarCodigoReporte;
  var
    qVerificar: TQuery;
    ValidarCodigo: Integer;
  begin
    qCodigoReporte.Close;
    qCodigoReporte.Open;
    qReporte.FieldByName('CODIGOREPORTE').AsFloat := qCodigoReporte.Fields
      [0].AsFloat;
  end;

var
  Insertando, Transaccion: Boolean;
  ListaError: TStringList;
  ODTHija: TODTHija;
  CodigoEventoApertura, CodigoEventoCierre, NodoFalla, EditarEventoCierre,
    EditarEventoApertura: String;
  lista: TStringList;
  evento, usuario: String;
  qry, qDatos: TQuery;
  ConsecutivoODT: Integer;
  bGeneracionAM, bRespuestaCrearAM: Boolean;
  sMensaje, sMensajeGeneracionAM: string;
begin
  // Validación CIG diferente de 1
  if qReporteCIGDANO.AsInteger = 1 then
  begin
    if Application.MessageBox
      (PChar('Desea dejar el codigo geográfico por defecto?'),
      PChar('Confirmación'), MB_ICONQUESTION + MB_YESNO) = idNo then
      raise Exception.Create('Por favor cambie el código geográfico');
  end;
  // pcDatos.ActivePage:=tsInformante;
  lista := TStringList.Create;        
  bDatosIncompletos := False;
  Transaccion := False;
  bGeneracionAM := False;                 
  bRespuestaCrearAM := true;
  try
    if (qReporteCODIGOADMINISTRATIVO.AsString = '') then
      raise Exception.Create
        ('Debe ingresar el código administrativo en la pestaña Descripción y Observaciones.');
    if (qReporteCODIGOCLASECLIENTE.AsString = '') then
      raise Exception.Create
        ('Debe ingresar la Clase de Cliente en la pestaña General.');
    if qReporte.State in [dsInsert] then
    begin
      // rgClaseReporte.ItemIndex:=2;
      Insertando := true;
      GenerarCodigoReporte();

    end
    else
      Insertando := False;
    if qReporte.State in [dsBrowse] then
    begin
      qReporte.Edit;
    end;

    if ((qReporte.FieldByName('CODIGOESTADOREPORTE').AsString = '4') and
      (fTipoLaborReporte.Text = '')) or
      ((gbInfoEvento.Visible) and (fTipoLaborReporte.Text = '')) then
    begin
      Application.MessageBox('Como el reporte esta en estado reparado,' +
        Chr(13) + 'debe ingresar tipo labor atención en la pestaña Descripción y Observaciones.',
        PChar('Información'), mb_ok + MB_ICONINFORMATION);
      exit;
    end;

    evento := qReporteCODIGOEVENTO.AsString;
    if (evento = '') and (gbInfoEvento.Visible) then
    begin
      usuario := VerificarBloqueoReporteLAC
        (DateToStr(qReporteFECHAHORA.AsDateTime));
      if usuario = '' then
      begin
        if (tcodigocausa.Text <> '') and (eCodigoFalla.Text <> '') and
          (pintadoapoyoevento.Text <> '') and
          (qReporteOBSERVACION.AsString <> '') and
          (eCodElementoOperacion.Text <> '') then
        begin
          PintadoApoyoTrafoEvento := EncontrarPintadoApoyoEvento
            (InterruptorEvento);
          CodigoEventoApertura := CrearEventoDistribucionReporte(1, 7,
            PintadoApoyoTrafoEvento, eCodElementoOperacion.Text, '0',
            FormatDateTime('dd/mm/yyyy HH:mm:ss',
            qReporteFECHAHORA.AsDateTime));
          if (Pos('||', CodigoEventoApertura) = 0) and
            (CodigoEventoApertura <> '') then
          begin
            if eNodoFalla.Text = '' then
              NodoFalla := '0'
            else
              NodoFalla := eNodoFalla.Text;
            CodigoEventoCierre := CrearEventoCierreDistribucionReporte
              (CodigoEventoApertura, 2, 7, PintadoApoyoTrafoEvento,
              eCodElementoOperacion.Text, '0', TipoObjetoEvento,
              tcodigocausa.Text, DBMemo1.Text, pintadoapoyoevento.Text,
              eCodigoFalla.Text, NodoFalla,
              FormatDateTime('dd/mm/yyyy HH:mm:ss',
              qReporteFECHAHORAATENCION.AsDateTime));
            if Pos('||', CodigoEventoCierre) > 0 then
            begin
              delete(CodigoEventoCierre, 1, 1);
              delete(CodigoEventoCierre, 1, 1);
              if CodigoEventoCierre <> '' then
                raise Exception.Create(CodigoEventoCierre)
              else
                exit;
            end;
            qReporteCODIGOEVENTO.AsString := CodigoEventoApertura;
            qReporteCODIGOEVENTORESTABLECIMIENTO.AsString := CodigoEventoCierre;
          end
          else
          begin
            delete(CodigoEventoApertura, 1, 1);
            delete(CodigoEventoApertura, 1, 1);
            if CodigoEventoApertura <> '' then
              raise Exception.Create(CodigoEventoApertura)
            else
              exit;
          end;
        end
        else
        begin
          // raise exception.create('Hace falta información para crear un evento.'+CHR(13)+'Revise los campos de:'+CHR(13)+'Observacion, Causa, Elemento de Operación y Elemento de Falla');
          Application.MessageBox('Hace falta información para crear un evento.'
            + Chr(13) + 'Revise los campos de:' + Chr(13) +
            'Observacion, Causa, Elemento de Operación y Elemento de Falla',
            PChar('Información'), mb_ok + MB_ICONINFORMATION);
          exit;
        end;
      end
      else
      begin
        Application.MessageBox(PChar('No es posible seleccionar esa fecha.' +
          Chr(13) + 'El usuario ' + UpperCase(usuario) + ' se encuentra ' +
          Chr(13) + 'realizando el reporte al LAC.'), 'Atención',
          mb_iconerror + mb_ok);
        exit;
      end;
    end;

    if (evento <> '') and (gbInfoEvento.Visible) and (not Insertando) then
    begin
      usuario := VerificarBloqueoReporteLAC
        (DateToStr(qReporteFECHAHORA.AsDateTime));
      if usuario = '' then
      begin
        qry := TQuery.Create(nil);
        qry.DataBaseName := 'BaseDato';
        qry.sql.Add('select * from soe_interrupciondis where codigoevento=' +
          IntToSTr(evento_apertura(qReporteCODIGOEVENTORESTABLECIMIENTO.
          AsInteger)));
        // qry.sql.SaveToFile('c:\eventoreporte.txt');
        qry.Open;
        if not qry.FieldByName('codigoelemento').isnull then
          TipoObjetoEvento := qry.FieldByName('codigotipoelemento').AsString;
        qry.Close;
        qry.Free;
        if ((CambioElementoEvento) or (CodigoCausaInicial <> tcodigocausa.Text))
          and (TipoObjetoEvento <> '') then
        begin
          if (tcodigocausa.Text <> '') and (eCodigoFalla.Text <> '') and
            (pintadoapoyoevento.Text <> '') and
            (qReporteOBSERVACION.AsString <> '') and
            (eCodElementoOperacion.Text <> '') then
          begin
            if not CertificadoLAC then
            begin
              if QuitarEventoReporte(qReporteCODIGOREPORTE.AsString) then
              begin
                if BorrarEventoAdmin(qReporteCODIGOEVENTO.AsString) then
                begin
                  if BorrarEventoAdmin
                    (qReporteCODIGOEVENTORESTABLECIMIENTO.AsString) then
                  begin
                    PintadoApoyoTrafoEvento := EncontrarPintadoApoyoEvento
                      (InterruptorEvento);
                    CodigoEventoApertura := CrearEventoDistribucionReporte(1, 7,
                      PintadoApoyoTrafoEvento, eCodElementoOperacion.Text, '0',
                      FormatDateTime('dd/mm/yyyy HH:mm:ss',
                      qReporteFECHAHORA.AsDateTime));
                    if (Pos('||', CodigoEventoApertura) = 0) and
                      (CodigoEventoApertura <> '') then
                    begin
                      if eNodoFalla.Text = '' then
                        NodoFalla := '0'
                      else
                        NodoFalla := eNodoFalla.Text;
                      CodigoEventoCierre := CrearEventoCierreDistribucionReporte
                        (CodigoEventoApertura, 2, 7, PintadoApoyoTrafoEvento,
                        eCodElementoOperacion.Text, '0', TipoObjetoEvento,
                        tcodigocausa.Text, DBMemo1.Text,
                        pintadoapoyoevento.Text, eCodigoFalla.Text, NodoFalla,
                        FormatDateTime('dd/mm/yyyy HH:mm:ss',
                        qReporteFECHAHORAATENCION.AsDateTime));
                      if Pos('||', CodigoEventoCierre) > 0 then
                      begin
                        delete(CodigoEventoCierre, 1, 1);
                        delete(CodigoEventoCierre, 1, 1);
                        if CodigoEventoCierre <> '' then
                          raise Exception.Create(CodigoEventoCierre)
                        else
                          exit;
                      end;
                      qReporteCODIGOEVENTO.AsString := CodigoEventoApertura;
                      qReporteCODIGOEVENTORESTABLECIMIENTO.AsString :=
                        CodigoEventoCierre;
                    end
                    else
                    begin
                      delete(CodigoEventoApertura, 1, 1);
                      delete(CodigoEventoApertura, 1, 1);
                      if CodigoEventoApertura <> '' then
                        raise Exception.Create(CodigoEventoApertura)
                      else
                        exit;
                    end
                  end
                  else
                    raise Exception.Create
                      ('No se pudieron eliminar los eventos asociados al reporte');
                end
                else
                  raise Exception.Create
                    ('No se pudieron eliminar los eventos asociados al reporte');
              end
              else
              begin
                Application.MessageBox
                  ('No se pudieron eliminar los eventos asociados al reporte',
                  PChar('Información'), mb_ok + MB_ICONINFORMATION);
                exit;
              end;
            end
            else
              EditarCierreDistribucionReporte
                (qReporteCODIGOEVENTORESTABLECIMIENTO.AsInteger,
                tcodigocausa.Text, DBMemo1.Text);;
          end
          else
          begin
            Application.MessageBox
              ('Hace falta información para crear un evento.' + Chr(13) +
              'Revise los campos de:' + Chr(13) +
              'Observacion, Causa, Elemento de Operación y Elemento de Falla',
              PChar('Información'), mb_ok + MB_ICONINFORMATION);
            exit;
          end;
        end;
      end
      else
      begin
        Application.MessageBox(PChar('No es posible seleccionar esa fecha.' +
          Chr(13) + 'El usuario ' + UpperCase(usuario) + ' se encuentra ' +
          Chr(13) + 'realizando el reporte al LAC.'), 'Atención',
          mb_iconerror + mb_ok);
        exit;
      end;
    end;

    qReporte.Post;
    if qReporte.UpdatesPending then
    begin
      qReporte.ApplyUpdates;
      qReporte.CommitUpdates; // OJO no estaba
      try
        EnlazarSoereporte;
      except
      end;
    end;
    if qReporteElemento.UpdatesPending then
      qReporteElemento.ApplyUpdates;

    bbAceptar.Enabled := False;
    bbCancelar.Enabled := False;

    if (NumeroODT > 0) then
    begin
      if (qReporteCODIGOADMINISTRATIVO.AsString <> '') and
        (qReporteFECHAHORADICTADO.AsString <> '') and
        (qReporteCODIGOGRUPOTRABAJO.AsString <> '') and
        (qReporteCODIGOTIPODANO.AsString <> '') then
      begin
        if not qReporte.Database.InTransaction then
        begin
          qReporte.Database.StartTransaction;
          Transaccion := true;
        end;
        ODTHija := TODTHija.Create(NumeroODT,
          qReporteCODIGOADMINISTRATIVO.AsInteger);
        ConsecutivoODT := ODTHija.CrearODTHija;
        if qReporteCODIGOGRUPOTRABAJO.AsString <> '' then
          ODTHija.AsignarGrupoTrabajo(qReporteCODIGOGRUPOTRABAJO.AsInteger);
        if qReporteCODIGOREPORTE.AsString <> '' then
          ODTHija.AsignarReporte(qReporteCODIGOREPORTE.AsFloat);
        ODTHija.AsignarDireccion(qReporte);
        ODTHija.InsertarInfraestructura(qReportePINTADOAPOYO.AsString,
          qReporteCODIGOCLIENTESGD.AsString, qReporteCODIGOAPOYO.AsString,
          qReporteCODIGOCLIENTECOM.AsString);
        ODTHija.AsignarFechas(qReporteFECHAHORADICTADO,
          qReporteFECHAHORAATENCION);
        ODTHija.InsertarManoObraDelGT(qReporteCODIGOGRUPOTRABAJO.AsString);
        ODTHija.AsignarApoyosProximidad(qReporteX.AsString, qReporteY.AsString,
          IntToSTr(speBufferApoyos.Value));
        ODTHija.AsignarObjetoDelTrabajo;

        // NO BORRAR: TECMOVIL
        if ConsecutivoODT <> -1 then
        begin
          Application.NormalizeTopMosts;
          if FALSE
          then
          begin
            Application.RestoreTopMosts;
            ODTHija.IdSesion := IniciarSesionGestionOdtHija(NumeroODT,
              ConsecutivoODT);
            bGeneracionAM := GenerarAsignacionMovil(FloatToStr(NumeroODT),
              IntToSTr(ConsecutivoODT));
            qReporte.Edit;
            if not bGeneracionAM then
            begin
              bRespuestaCrearAM := False;
              if bConectoASFTP then
                BorrarAsignacionEMG(FloatToStr(NumeroODT),
                  IntToSTr(ConsecutivoODT), 'E')
              else
                BorrarAsignacionEMG(FloatToStr(NumeroODT),
                  IntToSTr(ConsecutivoODT), 'E', False);
              qReporte.FieldByName('CODIGOESTADOREPORTE').AsString := '1';
            end
            else
              qReporte.FieldByName('CODIGOESTADOREPORTE').AsString := '2';
            dblcbEstadoReporte.Refresh;
            qReporte.Post;
            qReporte.ApplyUpdates;
            qReporte.CommitUpdates;
            TerminarSesionGestionOdtHija(NumeroODT, ConsecutivoODT);
          end
          else
            bRespuestaCrearAM := False;
          Application.RestoreTopMosts;
        end;

        ODTHija.Free;

        qDatos := TQuery.Create(Application);
        qDatos.DataBaseName := 'BaseDato';
        qDatos.Close;
        qDatos.sql.Clear;
        qDatos.sql.Add
          ('UPDATE SIGCOM_GESTION SET (CODIGOODT, CONSECUTIVO,CODIGOADMINISTRATIVO,CODIGOGRUPOTRABAJO, DESCRIPCIONODT, NOMBREEMPLEADO )= ');
        qDatos.sql.Add
          (' (SELECT ORE.CODIGOODT, ORE.CONSECUTIVO, O.CODIGOADMINISTRATIVO, OD.CODIGOGRUPOTRABAJO, O.MOTIVOS , E.NOMBREEMPLEADO ');
        qDatos.sql.Add
          (' FROM ODTREPORTE ORE, ODT O, ODTDIA OD, EMPLEADO E WHERE CODIGOREPORTE = :CODIGOREPORTE ');
        qDatos.sql.Add
          (' AND ORE.CODIGOODT = OD.CODIGOODT AND ORE.CONSECUTIVO = OD.CONSECUTIVO AND OD.CODIGOODT = O.CODIGOODT ');
        qDatos.sql.Add(' AND O.CODIGOEJECUTOR = E.CODIGOEMPLEADO) ');
        qDatos.sql.Add(' WHERE CODIGOREPORTE = :CODIGOREPORTE ');
        qDatos.ParamByName('CODIGOREPORTE').AsFloat :=
          qReporteCODIGOREPORTE.AsFloat;
        qDatos.ExecSQL;
        qDatos.Close;
        qDatos.Free;

        if Transaccion then
          qReporte.Database.Commit;
      end
      else
      begin
        qReporte.Edit;
        qReporte.FieldByName('CODIGOESTADOREPORTE').AsString := '1';
        qReporte.Post;
        qReporte.ApplyUpdates;
        qReporte.CommitUpdates;
        sMensaje :=
          'No se generará la asignación móvil porque falta uno o más de los siguientes datos: '
          + Chr(13) + Chr(13) + '1. CIA (Pestaña Descripción y Observaciones)' +
          Chr(13) + '2. Tipo de Daño (Pestaña Descripción y Observaciones)' +
          Chr(13) + '3. Fecha y Hora de Dictado (Pestaña Fechas y Asignación)' +
          Chr(13) + '4. Grupo de Trabajo (Pestaña Fechas y Asignación)';
        Application.MessageBox(PChar(sMensaje), 'EnerGis',
          MB_ICONWARNING + mb_ok);
      end;
    end;

    // NO BORRAR: TECMOVIL

    // Si el Reporte esta relacionado a una ODT y ésta no tiene una asignacion movil
    // pregunto si la quiere generar y exportar
    if bRespuestaCrearAM then
    begin
      qDatos := TQuery.Create(nil);
      qDatos.DataBaseName := 'BaseDato';
      qDatos.Close;
      qDatos.sql.Clear;
      qDatos.sql.Add('SELECT DISTINCT OA.CODIGOASIGNACIONEMG');
      qDatos.sql.Add('FROM ODTREPORTE O, EMG_ODTASIGNACION OA');
      qDatos.sql.Add('WHERE O.CODIGOODT= OA.CODIGOODT');
      qDatos.sql.Add('AND O.CONSECUTIVO = OA.CONSECUTIVO');
      qDatos.sql.Add('AND OA.TIPODATOORIGEN = ''E'' ');
      qDatos.sql.Add('AND O.CODIGOREPORTE = :CODIGOREPORTE');
      qDatos.ParamByName('CODIGOREPORTE').AsFloat :=
        qReporteCODIGOREPORTE.AsFloat;
      qDatos.Open;
      if qDatos.IsEmpty then
      begin
        qDatos.Close;
        qDatos.sql.Clear;
        qDatos.sql.Add('SELECT DISTINCT O.CODIGOODT, O.CONSECUTIVO');
        qDatos.sql.Add('FROM ODTREPORTE O, REPORTE R');
        qDatos.sql.Add('WHERE O.CODIGOREPORTE = R.CODIGOREPORTE');
        qDatos.sql.Add('AND R.CODIGOESTADOREPORTE IN (''1'',''2'')');
        qDatos.sql.Add('AND O.CODIGOREPORTE = :CODIGOREPORTE');
        qDatos.ParamByName('CODIGOREPORTE').AsFloat :=
          qReporteCODIGOREPORTE.AsFloat;
        qDatos.Open;
        if not qDatos.IsEmpty then
        begin
          NumeroODT := qDatos.FieldByName('CODIGOODT').AsFloat;
          ConsecutivoODT := qDatos.FieldByName('CONSECUTIVO').AsInteger;

          Application.NormalizeTopMosts;
          if false
          then
          begin
            Application.RestoreTopMosts;
            IniciarSesionGestionOdtHija(NumeroODT, ConsecutivoODT);
            bGeneracionAM := GenerarAsignacionMovil(FloatToStr(NumeroODT),
              IntToSTr(ConsecutivoODT));
            qReporte.Edit;
            if not bGeneracionAM then
            begin
              if bConectoASFTP then
                BorrarAsignacionEMG(FloatToStr(NumeroODT),
                  IntToSTr(ConsecutivoODT), 'E')
              else
                BorrarAsignacionEMG(FloatToStr(NumeroODT),
                  IntToSTr(ConsecutivoODT), 'E', False);
              qReporte.FieldByName('CODIGOESTADOREPORTE').AsString := '1';
            end
            else
              qReporte.FieldByName('CODIGOESTADOREPORTE').AsString := '2';
            dblcbEstadoReporte.Refresh;
            qReporte.Post;
            qReporte.ApplyUpdates;
            qReporte.CommitUpdates;
            TerminarSesionGestionOdtHija(NumeroODT, ConsecutivoODT);
          end;
          Application.RestoreTopMosts;
        end;
      end;
      qDatos.Close;
      qDatos.Free;
    end;

    if Insertando then
    begin
      Application.NormalizeTopMosts;
      MessageDlg('El reporte ingresado será guardado con el código: ' +
        qReporte.FieldByName('CODIGOREPORTE').AsString, mtInformation,
        [mbOK], 0);
      Application.RestoreTopMosts;
      if (qReporte.FieldByName('CODIGOCLIENTESGD').AsString <> '') then
      // if ((rgClaseReporte.ItemIndex=2) and (qReporte.FieldByName('CODIGOCLIENTESGD').AsString<>'')) then
      begin
        VerificarReporte(qReporte.FieldByName('CODIGOCLIENTESGD').AsString);
      end;
          pro_cargar_Info_OS.close;
          pro_cargar_Info_OS.ParamByName('VAR_CODIGOREPORTE').asinteger :=
          qReporte.FieldByName('CODIGOREPORTE').AsInteger;
          pro_cargar_Info_OS.Prepare;
          pro_cargar_Info_OS.ExecProc;

    end
    else
    begin
      ActualizarReportesHijos(qReporteCODIGOREPORTE.AsString);
      pro_Actualizar_rep.close;
          pro_Actualizar_rep.ParamByName('VAR_CODIGOREPORTE').asinteger :=
          qReporte.FieldByName('CODIGOREPORTE').AsInteger;
          pro_Actualizar_rep.Prepare;
          pro_Actualizar_rep.ExecProc;


    end;
    try
      if Assigned(Application.FindComponent('fPlancha') as TForm) and
        (UbicadoEnCartografia) then
        CrearReporte(qReporte.FieldByName('CODIGOREPORTE').AsInteger,
          qReporte.FieldByName('X').AsFloat, qReporte.FieldByName('Y').AsFloat);

    finally
      Close;
      ModalResult := mrOk;
    end;

    bbAceptar.Enabled := true;
    bbCancelar.Enabled := true;
  except
    on E: Exception do
    begin
      bbAceptar.Enabled := true;
      bbCancelar.Enabled := true;
      ShowMessage(E.Message);
      // Verificar Nuevamente que el codigo no este repetido
      // Miro que los campos requeridos no sean nulos y que este en insercion
      if (qReporte.FieldByName('CODIGOINFORMANTE').AsString <> '') and
        (qReporte.FieldByName('CODIGOADMINISTRATIVO').AsString <> '') and
        (qReporte.FieldByName('CODIGOTIPOREPORTE').AsString <> '') and
        (qReporte.FieldByName('CODIGOCLASEREPORTE').AsString <> '') and
        (qReporte.FieldByName('CODIGOESTADOREPORTE').AsString <> '') and
        (qReporte.FieldByName('ORIGENREPORTE').AsString <> '') and ModoInsercion
      then
      begin
        GenerarCodigoReporte();
      end;
      if Transaccion then
      begin
        qReporte.Database.Rollback;
      end;
      ListaError := TStringList.Create;
      ListaError.Add(E.Message);
      ListaError.SaveToFile(GetTemporalPath + 'error reporte.txt');
      ListaError.Free;
      bDatosIncompletos := true;
      qReporte.Edit;
      ModalResult := MrCancel;
      Close;
    end;
  end;
end;

procedure TfReporte.bbCancelarClick(Sender: TObject);
begin
  Application.NormalizeTopMosts;
  if Application.MessageBox
    (PChar('Perderá los cambios realizados. Esta seguro de Cancelar?'),
    PChar('Confirmación'), MB_ICONQUESTION + MB_YESNO) = idYes then
  begin
    Application.RestoreTopMosts;
    try
      qReporte.Cancel;
      if (qReporte as TDBDataSet).UpdatesPending then
        (qReporte as TDBDataSet).CancelUpdates;
    finally
      bDatosIncompletos := true;
      bCancelando := true;
      Close;
    end;
  end
  else
  begin
    Application.RestoreTopMosts;
    ModalResult := 0;
    bDatosIncompletos := False;
    // dblcbTipoInformante.SetFocus;
  end;
end;

procedure TfReporte.FormClose(Sender: TObject; var Action: TCloseAction);
var
  PuedoCerrar: Boolean;
  bm2: TBookmark;
begin
  PuedoCerrar := true;
  if not bCancelando then
  begin
    if bDatosIncompletos then
    begin
      Application.NormalizeTopMosts;
      if Application.MessageBox
        (PChar('Hay datos incompletos. Desea completar los datos?'),
        PChar('Confirmación'), MB_ICONQUESTION + MB_YESNO) = idYes then
      begin
        Application.RestoreTopMosts;
        ModalResult := 0;
        bDatosIncompletos := False;
        // dblcbTipoInformante.SetFocus;
        Action := Forms.caNone;
        PuedoCerrar := False;
      end
      else
      begin
        Application.RestoreTopMosts;
        qReporte.Cancel;
        (qReporte as TDBDataSet).CancelUpdates;
        SetCodigoReporte(-1);
        // if FormStyle = fsStayOnTop then
        Action := caFree;
        // freporte.free;
        // freporte:=nil;
      end;
    end
    else if (ModalResult <> MrCancel) and (ModalResult <> 0) then
    begin
      ModalResult := mrOk;
      SetCodigoReporte(-1);
      // if FormStyle = fsStayOnTop then
      Action := caFree;
      // freporte.free;
      // freporte:=nil;
      if Assigned(Application.FindComponent('fListaReportes') as TForm) then
      begin
        bm2 := flistareportes.qListaReportes.GetBookmark;
        flistareportes.qListaReportes.Close;
        flistareportes.qListaReportes.Open;
        flistareportes.qListaReportes.GotoBookmark(bm2);
      end;

    end;
  end;

  if (ModalResult = 2) or ((PuedoCerrar) and (ModalResult = 0)) then
  begin
    try
      qReporte.Cancel;
      (qReporte as TDBDataSet).CancelUpdates;
      SetCodigoReporte(-1);
      // if FormStyle = fsStayOnTop then
      Action := caFree;
      // freporte.free;
      // freporte:=nil;
    except
    end;
  end;
end;

procedure TfReporte.qReporteUpdateError(DataSet: TDataSet; E: EDatabaseError;
  UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  try
  finally
  end;
end;

procedure TfReporte.sbDanoClick(Sender: TObject);
var
  Punto: TPoint;
begin
  qReporte.FieldByName('CODIGOTIPOREPORTE').AsString := 'D';
  Punto := pTipoReporte.ClientToScreen(Classes.Point(sbDano.Left, sbDano.top));
  pmPrioridad.Popup(Punto.x + 10, Punto.y + 10);
end;

procedure TfReporte.sbInterrupcionClick(Sender: TObject);
begin
  qReporte.FieldByName('CODIGOTIPOREPORTE').AsString := 'I';
end;

procedure TfReporte.sbEmergenciaClick(Sender: TObject);
begin
  qReporte.FieldByName('CODIGOTIPOREPORTE').AsString := 'E';
  qReporte.FieldByName('PRIORIDADDANO').AsString := '0';
end;

procedure TfReporte.sbSolicitudClick(Sender: TObject);
begin
  qReporte.FieldByName('CODIGOTIPOREPORTE').AsString := 'S';
  qReporte.FieldByName('PRIORIDADDANO').AsString := '';
end;

procedure TfReporte.CargarBarraTipoReporte;
var
  s: string;
begin
  s := qReporte.FieldByName('CODIGOTIPOREPORTE').AsString;
  if s <> '' then
    case s[1] of
      'D':
        sbDano.Down := true;
      'I':
        sbInterrupcion.Down := true;
      'E':
        sbEmergencia.Down := true;
      'C':
        sbCliente.Down := true;
      'S':
        sbSolicitud.Down := true;
    end;
end;

procedure TfReporte.SpeedButton4Click(Sender: TObject);
begin
  MostrarMapa;
  SpeedButton7Click(nil);
  UbicarReporte;
end;

procedure TfReporte.sbInfoElectricaClick(Sender: TObject);
begin
  with qDatosElectricos do
  begin
    Active := False;
    Active := true;
    sbInfoElectrica.Enabled := False;
  end;
  fInfoElectricoCliente.Show;
end;

procedure TfReporte.qReporteElementoAfterInsert(DataSet: TDataSet);
begin
  qCodigoReporteElemento.Close;
  qCodigoReporteElemento.Open;
  DataSet.FieldByName('CODIGOREPORTEELEMENTO').AsString :=
    qCodigoReporteElementoNEXTVAL.AsString;
end;

procedure TfReporte.qReporteElementoUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
begin
  try
  finally
  end;
end;

procedure TfReporte.qReporteElementoAfterPost(DataSet: TDataSet);
begin
  try
    qReporteElemento.ApplyUpdates;
    qReporteElemento.CommitUpdates;
  except
    qReporteElemento.CancelUpdates;
  end;
end;

procedure TfReporte.qReporteElementoAfterDelete(DataSet: TDataSet);
begin
  try
    qReporteElemento.ApplyUpdates;
    qReporteElemento.CommitUpdates;
  except
    qReporteElemento.CancelUpdates;
  end;
end;

procedure TfReporte.qReporteCODIGOADMINISTRATIVOValidate(Sender: TField);
begin
  if Sender.Text <> '' then
  begin
    qCIA.Close;
    qCIA.Params[0].AsString := Sender.Text;
    qCIA.Open;
    if qCIA.RecordCount > 0 then
    begin
      LbCia1.Caption := qCIA.Fields[0].AsString;
      lbCia2.Caption := qCIA.Fields[0].AsString;
    end
    else
      raise Exception.Create('Este Código Administrativo No Existe.');
   { qGrupoTrabajo.Close;
    qGrupoTrabajo.Open;
    if qGrupoTrabajo.RecordCount = 0 then
    Begin
      qGrupoTrabajo.Close;
      qGrupoTrabajo.sql.Text :=
        'SELECT CODIGOGRUPOTRABAJO, NOMBREGRUPOTRABAJO FROM GRUPOTRABAJO  ' +
        ' WHERE CODIGOADMINISTRATIVO=:CODIGOADMINISTRATIVO AND ACTIVO = ''S''';

      qGrupoTrabajo.Open;
    End; }
    dblcbGrupoTrabajo.Refresh;
    qTiempo.Close;
    qTiempo.Open;
    if (qTiempo.RecordCount > 0) then
      TiempoMaximoAtencion := qTiempoTIEMPOATENCION.AsFloat;
    qTiempo.Close;
  end
  else
  begin
    LbCia1.Caption := '';
    lbCia2.Caption := '';
  end;
end;

procedure TfReporte.bbImprimirClick(Sender: TObject);
var
  Punto: TPoint;
begin
  Punto := Panel2.ClientToScreen(Classes.Point(bbImprimir.Left,
    bbImprimir.top));
  pmImprimir.Popup(Punto.x + 10, Punto.y + 10);
end;

procedure TfReporte.Reporte1Click(Sender: TObject);
begin
  if qReporte.FieldByName('CODIGOREPORTE').AsString = '' then
    MessageDlg('Para Imprimir el Reporte, Este Debe Ser Guardado.',
      mtInformation, [mbOK], 0)
  else
  begin
    try
      fQRReporte := TfQRReporte.Create(Application);
      with fQRReporte do
      begin
        qrdbCodigoReporte.DataSet := qReporte;
        qrdbFechaCreacion.DataSet := qReporte;
        qrdbTipoInformante.DataSet := qReporte;
        qrdbNombreInformante.DataSet := qReporte;
        qrdbTelefono.DataSet := qReporte;
        qrdbNodofisico.DataSet := qReporte;
        qrdbDireccionDano.DataSet := qReporte;
        qrdbNombreClaseReporte.DataSet := qReporte;
        qrdbNombreTipoReporte.DataSet := qReporte;
        qrdbDireccionDano.DataSet := qReporte;
        qrdbNombreAdministrativo.DataSet := qReporte;
        qrdbFechaDictado.DataSet := qReporte;
        qrdbFechaLlegada.DataSet := qReporte;
        qrdbFechaAtencion.DataSet := qReporte;
        qrdbEstadoReporte.DataSet := qReporte;
        qrdbDescripcion.DataSet := qReporte;
        qrdbObservacion.DataSet := qReporte;
        QuickReport.DataSet := qReporte;
        fReporte.Hide;
        QuickReport.Preview;
      end;
    finally
      fQRReporte.Free;
      fQRReporte := nil;
      fReporte.Show;
    end;
  end;
end;

procedure TfReporte.ElementosAsociados1Click(Sender: TObject);
begin
  if qReporte.FieldByName('CODIGOREPORTE').AsString = '' then
    MessageDlg
      ('Para Imprimir Los Elementos Asociados al Reporte, Este Debe Ser Guardado.',
      mtInformation, [mbOK], 0)
  else
  begin
    try
      fQRElementoReporte := TfQRElementoReporte.Create(Application);
      with fQRElementoReporte do
      begin
        qrdbTipoElemento.DataSet := qReporteElemento;
        qrdbClave1.DataSet := qReporteElemento;
        qrdbClave2.DataSet := qReporteElemento;
        qrdbNombreEstructura.DataSet := qReporteElemento;
        qrdbCodigoReporte.DataSet := qReporteElemento;
        QuickReport.DataSet := qReporteElemento;
        fReporte.Hide;
        QuickReport.Preview;
      end;
    finally
      fQRElementoReporte.Free;
      fQRElementoReporte := nil;
      fReporte.Show;
    end;
  end;
end;

procedure TfReporte.sbEditarDireccionClick(Sender: TObject);
var
  Dir: string;
begin
  // Dir:=CapturarDireccion(qReporte,dbeDireccionDano, True);
  Dir := DescripcionDireccion(qReporte, dbeDireccionDano);
  if Dir <> '' then
    dbeDireccionDano.Text := Dir;
end;

procedure TfReporte.FormDestroy(Sender: TObject);
begin
  fInfoElectricoCliente.Free;
  FElementosElectricos.Free;
  FArbolInterruptores.Free;
end;

procedure TfReporte.SpeedButton2Click(Sender: TObject);
begin
  fReporte.Hide;
  fInformacionReporte := TfInformacionReporte.Create(Application);
  fInformacionReporte.Show;
end;

procedure TfReporte.sbElementosElectricosClick(Sender: TObject);
begin
  FElementosElectricos.Show;
end;

procedure TfReporte.dMenuArbol2SelectID(Sender: tnMenuItem; ID: Integer;
  MenuEstructura: tMenuEs);
begin
  dsReporte.DataSet.FieldByName('CIAINFORMANTE').AsInteger := ID;
  qCIA.Close;
  qCIA.Params[0].AsInteger := ID;
  qCIA.Open;
  if qCIA.RecordCount > 0 then
    dbeCIAInformante.Hint := qCIA.Fields[0].AsString;
end;

procedure TfReporte.qReporteCIAINFORMANTEValidate(Sender: TField);
begin
  if Sender.Text <> '' then
  begin
    qCIA.Close;
    qCIA.Params[0].AsString := Sender.Text;
    qCIA.Open;
    if qCIA.RecordCount > 0 then
      dbeCIAInformante.Hint := qCIA.Fields[0].AsString
    else
      raise Exception.Create('El Código Administrativo ' + Sender.Text +
        ' No Existe.');
  end;
end;

procedure TfReporte.qReporteCODIGOTIPOREPORTEValidate(Sender: TField);
begin
  if Sender.Text <> '' then
  begin
    sbDano.Caption := 'Daño';
    if qReporte.State in [dsEdit, dsInsert] then
      dsReporte.DataSet.FieldByName('PRIORIDADDANO').AsString := '';
    case Sender.Text[1] of
      'D':
        sbDano.Down := true;
      'I':
        sbInterrupcion.Down := true;
      'E':
        sbEmergencia.Down := true;
      'S':
        sbSolicitud.Down := true;
      'C':
        sbCliente.Down := true;
      'A':
        sbAlumbrado.Down := true;
    end;
  end;

end;

procedure TfReporte.SpeedButton5Click(Sender: TObject);
var
  lista: TStringList;
  x, y: double;
  Cig: Integer;
  qDatos: TQuery;
  procedure LlenarLista(lista: TStringList; Campo: String);
  begin
    if dsReporte.DataSet.FieldByName(Campo).AsString <> '' then
      lista.Add(Campo + '=' + dsReporte.DataSet.FieldByName(Campo).AsString);
  end;

begin
  lista := TStringList.Create;
  LlenarLista(lista, 'CODIGOTIPOVIA');
  LlenarLista(lista, 'CODIGONOMBREVIA');
  LlenarLista(lista, 'MODIFICADORVIA');
  LlenarLista(lista, 'DUPLICADOR');
  LlenarLista(lista, 'MODIFICADORDUPLICADOR');
  LlenarLista(lista, 'NUMEROPUERTA');
  if dbeCIG.Text <> '' then
  Begin
    qDatos := TQuery.Create(Application);
    qDatos.DataBaseName := 'BaseDato';
    qDatos.sql.Add('SELECT GETCODIGOLOCALIDAD(' + dbeCIG.Text +
      ') AS LOCALIDAD FROM DUAL');
    qDatos.Open;
    lista.Add('CODIGOLOCALIDAD=' + qDatos.FieldByName('LOCALIDAD').AsString);
    qDatos.Free;
  end;
  // Lista.Add('CIG='+dbeCIG.Text);
  // MostrarMapa;
  BuscarGeocodigoCig(lista, x, y, Cig);
  lista.Free;
  if (Cig > 0) then
  begin
    qReporteCIGDANO.AsInteger := Cig;
  end;
end;

procedure TfReporte.qReporteCalcFields(DataSet: TDataSet);
var
  qDatos: TQuery;
  Direccion: string;
begin
  try
    Direccion := '';
    qDatos := TQuery.Create(Application);
    qDatos.DataBaseName := 'BaseDato';
    if dsReporte.DataSet.FieldByName('CODIGOTIPOVIA').AsString <> '' then
    begin
      qDatos.Close;
      qDatos.sql.Text :=
        'SELECT ABREVIATURA FROM DIR_TIPOVIA WHERE CODIGOTIPOVIA = ' +
        dsReporte.DataSet.FieldByName('CODIGOTIPOVIA').AsString;
      qDatos.Open;
      Direccion := Direccion + qDatos.Fields[0].AsString;
    end;
    if dsReporte.DataSet.FieldByName('CODIGONOMBREVIA').AsString <> '' then
    begin
      qDatos.Close;
      qDatos.sql.Text :=
        'SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
        dsReporte.DataSet.FieldByName('CODIGONOMBREVIA').AsString;
      qDatos.Open;
      Direccion := Direccion + ' ' + qDatos.Fields[0].AsString;
    end;
    Direccion := Direccion + dsReporte.DataSet.FieldByName
      ('MODIFICADORVIA').AsString;

    if dsReporte.DataSet.FieldByName('DUPLICADOR').AsString <> '' then
    begin
      qDatos.Close;
      qDatos.sql.Text :=
        'SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
        dsReporte.DataSet.FieldByName('DUPLICADOR').AsString;
      qDatos.Open;
      Direccion := Direccion + ' ' + qDatos.Fields[0].AsString;
    end;
    Direccion := Direccion + dsReporte.DataSet.FieldByName
      ('MODIFICADORDUPLICADOR').AsString + ' ' + dsReporte.DataSet.FieldByName
      ('NUMEROPUERTA').AsString;

    if DataSet.FieldByName('CODIGOTIPOVERTICAL').AsString <> '' then
    begin
      qDatos.Close;
      qDatos.sql.Text :=
        'SELECT ABREVIATURA FROM DIR_TIPOVERTICAL WHERE CODIGOTIPOVERTICAL = ' +
        DataSet.FieldByName('CODIGOTIPOVERTICAL').AsString;
      qDatos.Open;
      Direccion := Direccion + ' ' + qDatos.Fields[0].AsString;
    end;

    Direccion := Direccion + DataSet.FieldByName('VERTICAL').AsString;

    if DataSet.FieldByName('CODIGOTIPOINTERIOR').AsString <> '' then
    begin
      qDatos.Close;
      qDatos.sql.Text :=
        'SELECT ABREVIATURA FROM DIR_TIPOINTERIOR WHERE CODIGOTIPOINTERIOR = ' +
        DataSet.FieldByName('CODIGOTIPOINTERIOR').AsString;
      qDatos.Open;
      Direccion := Direccion + ' ' + qDatos.Fields[0].AsString;
    end;

    Direccion := Direccion + ' ' + DataSet.FieldByName('PISO').AsString;
    Direccion := Direccion + DataSet.FieldByName('INTERIOR').AsString;

    Direccion := Direccion + ' ' + dsReporte.DataSet.FieldByName
      ('CODIGOTIPOPREDIO').AsString + ' ' + dsReporte.DataSet.FieldByName
      ('DESCRIPCIONTIPOPREDIO').AsString;
    DataSet.FieldByName('DIRECCIONCALCULADA').AsString := TrimLeft(Direccion);
    if (qReporteCODIGOCLIENTESGD.AsString <> '') then
    begin
      qDatos.sql.Clear;
      qDatos.sql.Add
        ('SELECT NOMBRESUSCRIPTOR,TIPOCLIENTE FROM CLIENTESGD WHERE CODIGOCLIENTESGD='
        + qReporteCODIGOCLIENTESGD.AsString);
      qDatos.Open;
      qReporteNombreClienteSgd.AsString :=
        qDatos.FieldByName('NOMBRESUSCRIPTOR').AsString;
      if (qDatos.FieldByName('TIPOCLIENTE').AsString <> '') then
        qReporteTipoClienteSgd.AsString :=
          qDatos.FieldByName('TIPOCLIENTE').AsString
      else
        qReporteTipoClienteSgd.AsString := 'N';
    end
    else
    begin
      qReporteNombreClienteSgd.AsString := '';
      qReporteTipoClienteSgd.AsString := 'N';
    end;

    qDatos.Free;
    // application.ProcessMessages;
  except
  end;
end;

procedure TfReporte.N11Click(Sender: TObject);
begin
  N11.Checked := true;
  dsReporte.DataSet.FieldByName('PRIORIDADDANO').AsInteger := 1;
end;

procedure TfReporte.N21Click(Sender: TObject);
begin
  N21.Checked := true;
  dsReporte.DataSet.FieldByName('PRIORIDADDANO').AsInteger := 2;
end;

procedure TfReporte.N31Click(Sender: TObject);
begin
  N31.Checked := true;
  dsReporte.DataSet.FieldByName('PRIORIDADDANO').AsInteger := 3;
end;

procedure TfReporte.N41Click(Sender: TObject);
begin
  N41.Checked := true;
  dsReporte.DataSet.FieldByName('PRIORIDADDANO').AsInteger := 4;
end;

procedure TfReporte.N51Click(Sender: TObject);
begin
  N51.Checked := true;
  dsReporte.DataSet.FieldByName('PRIORIDADDANO').AsInteger := 5;
end;

procedure TfReporte.qReportePRIORIDADDANOValidate(Sender: TField);
begin
  if Sender.Text <> '' then
    sbDano.Caption := 'Daño-' + Sender.Text;
  if qReporte.State in [dsEdit, dsInsert] then
    qReportePRIORIDADESTIMADA.AsInteger :=
      EstimarPrioridad(qReporteCODIGOTIPOREPORTE.AsString,
      qReporteTIPOCLIENTE.AsString);
end;

procedure TfReporte.sbFechaLimiteClick(Sender: TObject);
var
  sFecha: string;
begin
  sFecha := '';
  Fecha := qReporteFECHALIMITERESPUESTA.AsString;
  sFecha := GetFecha;
  if sFecha <> '' then
  begin
    qReporte.FieldByName('FECHALIMITERESPUESTA').AsString := sFecha;
  end;
end;

function TfReporte.GetFecha: String;
begin
  fFormaFecha := TfFormaFecha.Create(Application);
  fFormaFecha.height := 291;
  if fFormaFecha.ShowModal = mrOk then
    Result := DateTimetoStr(fFormaFecha.Date + StrToTime('11:59:59 pm'))
  else
    Result := sFecha;
  fFormaFecha.Free;
end;

procedure TfReporte.qReporteFECHALIMITERESPUESTAValidate(Sender: TField);
begin
  if Sender.Text <> '' then
  begin
    if qReporte.FieldByName('FECHAHORASAD').AsString = '' then
    begin
      if (dbeCIAInformante.Visible) and
        (dbeCIAInformante.DataField = 'NUMEROSAT') then
        raise Exception.Create('Para Introducir La Fecha Limite de Respuesta,' +
          Chr(13) + 'La Fecha del SAD No Debe Ser Vacia.')
    end
    else if (Sender.AsDateTime) < (qReporte.FieldByName('FECHAHORASAD')
      .AsDateTime) then
      raise Exception.Create('La Fecha Limite de Respuesta,' + Chr(13) +
        'No Debe Ser Menor que La Fecha del SAD.')
  end;
end;

procedure TfReporte.qReporteCODIGOTRAFODISValidate(Sender: TField);
var
  qDatos: TQuery;
  qActualizar: TQuery;
begin
  if (Sender.Text <> '') and (qReporte.State in [dsInsert]) then
  begin
    qDatos := TQuery.Create(Application);
    qDatos.DataBaseName := 'BaseDato';
    qDatos.sql.Add('SELECT CODIGOREPORTE, FECHAHORA, NOMBREINFORMANTE,');
    qDatos.sql.Add('FECHAHORADICTADO, FECHAHORALLEGADA, FECHAHORAATENCION,');
    qDatos.sql.Add('DIRECCIONDANO, TELEFONO, PINTADOAPOYO, REGISTROS');
    qDatos.sql.Add('FROM REPORTE WHERE');
    qDatos.sql.Add('CODIGOTRAFODIS = ' + Sender.Text);
    qDatos.sql.Add('AND CODIGOESTADOREPORTE IN (''1'',''2'',''3'')');
    qDatos.Open;
    if qDatos.RecordCount > 0 then
    begin
      FReporteSimilar := TFReporteSimilar.Create(Application);
      FReporteSimilar.dsDatos.DataSet := qDatos;
      FReporteSimilar.Query1.Close;
      FReporteSimilar.Query1.Open;
      FReporteSimilar.lTitulo.Caption :=
        'Existen Reportes Similares registrados:';
      if FReporteSimilar.ShowModal = mrYes then
      begin
        qActualizar := TQuery.Create(Application);
        qActualizar.DataBaseName := 'BaseDato';
        qActualizar.sql.Add
          ('UPDATE REPORTE SET REGISTROS = REGISTROS + 1 WHERE');
        qActualizar.sql.Add('CODIGOREPORTE = ' + qDatos.Fields[0].AsString);
        qActualizar.ExecSQL;
        qActualizar.Free;
        qReporte.Cancel;
        qReporte.Close;
        qReporte.sql.Text := 'SELECT * FROM REPORTE WHERE CODIGOREPORTE=' +
          qDatos.FieldByName('CODIGOREPORTE').AsString;
        qReporte.Open;
        qReporte.Edit;
      end;
      FReporteSimilar.Free;
      // ShowMessage('Este Reporte Parece Similar al Reporte ' + qDatos.Fields[0].AsString);
    end;
    qDatos.Free;
  end;
end;

procedure TfReporte.Panel2Click(Sender: TObject);
begin

  { FReporteSimilar:=TFReporteSimilar.Create(Application);
    //FReporteSimilar.dsRepetidos.DataSet := qTelefono;
    FReporteSimilar.Query1.Close;
    FReporteSimilar.Query1.Open;
    //FReporteSimilar.Series2.DataSource  := qDatos;
    FReporteSimilar.ShowModal;
    FReporteSimilar.Free;
  }
end;

procedure TfReporte.qReporteCODIGOTRAFODISChange(Sender: TField);
var
  qDatos, qInterruptor: TQuery;
  codInterruptor: string;
begin
  qDatos := TQuery.Create(Application);
  qDatos.DataBaseName := 'BaseDato';
  qDatos.sql.Add
    ('SELECT SUBSTR(PAPA.NOMBRE,5) FROM TREENODES PAPA, TREENODES NODO');
  qDatos.sql.Add('WHERE');
  qDatos.sql.Add('(PAPA.IZQUIERDA <= NODO.DERECHA) AND');
  qDatos.sql.Add('(PAPA.DERECHA >= NODO.IZQUIERDA) AND');
  qDatos.sql.Add('(NODO.CODIGOCIRCUITO = ''' + qReporte.FieldByName
    ('CODIGOCIRCUITO').AsString + ''') AND');
  qDatos.sql.Add('(NODO.TIPO = ''TF'') AND');
  qDatos.sql.Add('(PAPA.CODIGOCIRCUITO = ''' + qReporte.FieldByName
    ('CODIGOCIRCUITO').AsString + ''') AND');
  qDatos.sql.Add('(PAPA.TIPO = ''TF'') AND');
  qDatos.sql.Add('(NODO.NOMBRE = ''TF: ' + qReporte.FieldByName
    ('CODIGOTRAFODIS').AsString + ''') AND');
  qDatos.sql.Add('(PAPA.NOMBRE LIKE ''SW%'') AND');
  qDatos.sql.Add('(PAPA.NIVEL <= NODO.NIVEL)');
  qDatos.sql.Add('ORDER BY PAPA.IZQUIERDA DESC');
  qDatos.Open;
  qDatos.first;
  while not qDatos.Eof do
  begin
    qInterruptor := TQuery.Create(Application);
    qInterruptor.DataBaseName := 'BaseDato';
    qInterruptor.sql.Add
      ('SELECT CODIGOUSOINTERRUPTOR FROM INTERRUPTORDIS WHERE');
    qInterruptor.sql.Add('CODIGOINTERRUPTORDIS = ' + qDatos.Fields[0].AsString);
    qInterruptor.Open;
    if (qInterruptor.Fields[0].AsString <> '') then
    begin
      qReporte.FieldByName('CODIGOINTERRUPTORDIS').AsString :=
        qDatos.Fields[0].AsString;
      qInterruptor.Free;
      Break;
    end;
    qInterruptor.Free;
    qDatos.Next;
  end;
  qDatos.Free;
  ActualizarEstadoRecibido;
  CambioElementoEvento := true;
  ActualizarBarraEstado;
end;

procedure TfReporte.Label21DblClick(Sender: TObject);
begin
  FBuscarTipoDano := TFBuscarTipoDano.Create(Application);
  if FBuscarTipoDano.ShowModal = mrOk then
  begin
    qReporteDESCRIPCION.AsString := FBuscarTipoDano.qTipoDano.FieldByName
      ('NOMBRETIPODANO').AsString;
  end;
  FBuscarTipoDano.Free;
end;

procedure TfReporte.lbCodigoDblClick(Sender: TObject);
var
  qDatos: TQuery;
  i: Integer;
  s: String;
  f: String;
begin
  if qReporteCODIGOESTADOREPORTE.AsString = '4' then
  begin
    if qReporteCODIGOREPORTE.AsString = '' then
    begin
      Application.NormalizeTopMosts;
      Application.MessageBox
        (PChar('Para crear un nuevo reporte a partir de otro, debe guardar este primero.'),
        PChar('EnerGis'), mb_iconerror + mb_ok);
      Application.RestoreTopMosts;
      exit;
    end;
    Application.NormalizeTopMosts;

    if Application.MessageBox('Desea crear un nuevo reporte a partir de este?',
      PChar('Confirmación'), MB_ICONQUESTION + MB_YESNO) = idYes then
    begin
      Duplicado := true;

      if VarCodigoUsuario <> 0 then
      begin
        if not ProcManager.CanProcExecute('_Permitir editar reportes reparados')
        then
        begin
          DeshabilitarControles(self, true);
          fReporte.lbCodigo.Enabled := true;
        end;
      end;

      Application.RestoreTopMosts;
      qDatos := TQuery.Create(nil);
      qDatos.DataBaseName := 'BaseDato';
      qDatos.sql.Text := 'SELECT     ' +

        ' CODIGOREPORTE, CODIGOINFORMANTE, DIRECCIONINFORMANTE, ' +
        'NOMBREINFORMANTE, CIGINFORMANTE, TELEFONO,      ' +
        'CIGDANO, DIRECCIONDANO, CODIGOADMINISTRATIVO,' +
        'CODIGOTIPOREPORTE, CODIGOCLASEREPORTE, CODIGOTIPODANO,    ' +
        'CODIGOPRIORIDAD, CODIGOESTADOREPORTE, NUMEROCARTA,   ' +
        'CODIGOESTADOCARTA, REGISTROS, DESCRIPCION,     ' +
        'OBSERVACION, FECHAHORA, FECHAULTIMOREGISTRO,   ' +
        'FECHAHORADICTADO, FECHAHORALLEGADA, FECHAHORAATENCION,    ' +
        'X, Y, ORIGENREPORTE,                            ' +
        'CODIGOTIPOELEMENTO, CODIGOELEMENTO, CODIGOSUBESTACION, ' +
        'CODIGOCIRCUITO, CODIGOTRAFODIS, CODIGOAPOYO,            ' +
        'CODIGOCLIENTESGD, CODIGOCLIENTECOM, REPORTEPADRE,        ' +
        'PINTADOAPOYO, CODIGOTIPOVIA, CODIGONOMBREVIA,             ' +
        'MODIFICADORVIA, DUPLICADOR, MODIFICADORDUPLICADOR,         ' +
        'NUMEROPUERTA, CODIGOODT, CONSECUTIVO,                       ' +
        'CIAINFORMANTE, CODIGOCONTADOR, PRIORIDADDANO,                ' +
        'NUMEROSAT, FECHALIMITERESPUESTA, NOMBREFUNCIONARIO,           ' +
        'CODIGOGRUPOTRABAJO, CODIGONODOBT, CODIGOINTERRUPTORDIS,        ' +
        'CODIGOTIPOPREDIO, DESCRIPCIONTIPOPREDIO, FECHAHORASAD,          ' +
        'CODIGOUSUARIOCREACION, COLORCELDA, FECHACREACION,                ' +
        'TELEFONORECIBE, TIPOCLIENTE, PRIORIDADESTIMADA,CODIGOCLASECLIENTE, CODIGOTIPOVERTICAL,'
        + 'VERTICAL, CODIGOTIPOINTERIOR, PISO,                                                    '
        + 'INTERIOR, CODIGOTIPOLABORREPORTE, CODIGOEVENTO,                                         '
        + 'CODIGOEVENTORESTABLECIMIENTO,FECHAHORADESCARGA                                           '
        + ' FROM REPORTE WHERE CODIGOREPORTE = ' +
        qReporteCODIGOREPORTE.AsString;
      qDatos.Open;
      qReporte.Post;
      if qReporte.UpdatesPending then
        qReporte.ApplyUpdates;

      qReporteFECHAHORADICTADO.OnValidate := nil;
      qReporteFECHAHORAATENCION.OnValidate := nil;
      qReporteFECHAHORALLEGADA.OnValidate := nil;
      qReporteCODIGOESTADOREPORTE.OnValidate := nil;

      qReporte.Close;
      qReporte.sql.Clear;
      qReporte.sql.Text := 'SELECT  * FROM REPORTE WHERE CODIGOREPORTE= - 1';
      qReporte.Open;
      qReporte.Insert;

      // dbeFechaDictado.Text :='';
      // dbeFechaLlegada.Text :='';
      // dbeFechaAtencion.Text :='';
      // DBEdit2.Text := '';

      for i := 0 to qDatos.FieldCount - 1 do
      begin
        if (qDatos.Fields[i].FieldName <> 'CODIGOREPORTE') and
          (qDatos.Fields[i].FieldName <> 'CODIGOUSUARIOCREACION') then
          qReporte.FieldByName(qDatos.Fields[i].FieldName).AsString :=
            qDatos.Fields[i].AsString;
      end;

      qReporteCODIGOGRUPOTRABAJO.AsString := '';
      qReporteFECHAHORADICTADO.AsString := '';
      qReporteFECHAHORALLEGADA.AsString := '';
      qReporteFECHAHORAATENCION.AsString := '';
      qReporteCODIGOESTADOREPORTE.AsString := '1';
      qReporte.FieldByName('CODIGOUSUARIOCREACION').AsInteger :=
        VarCodigoUsuario; // Usuario Creacion

      // qReporteFECHAHORA.AsString := FechaServidor;
      qReporteFECHAHORADICTADO.OnValidate := qReporteFECHAHORADICTADOValidate;
      qReporteFECHAHORAATENCION.OnValidate := qReporteFECHAHORAATENCIONValidate;
      qReporteFECHAHORALLEGADA.OnValidate := qReporteFECHAHORALLEGADAValidate;
      qReporteCODIGOESTADOREPORTE.OnValidate :=
        qReporteCODIGOESTADOREPORTEValidate;

      if Application.MessageBox
        ('Desea utilizar la copia para el traslado a otra dependencia?.',
        PChar('Confirmación'), MB_ICONQUESTION + MB_YESNO) = idYes then
      begin
        qReporteCODIGOGRUPOTRABAJO.AsString := '';
        qReporteFECHAHORADICTADO.AsString := '';
        qReporteFECHAHORALLEGADA.AsString := '';
        qReporteFECHAHORAATENCION.AsString := '';
        qReporteCODIGOESTADOREPORTE.AsString := '1';
      end;
      qDatos.Close;
      qDatos.Free;
    end;
    Application.RestoreTopMosts;
    Duplicado := False;
  end
  else
    Application.MessageBox
      (PChar('Para crear un nuevo reporte a partir de otro,el reporte debe estar en estado REPARADO.'),
      PChar('EnerGis'), mb_iconerror + mb_ok);

end;

procedure TfReporte.dMenuCIGSelectID(Sender: tnMenuItem; ID: Integer;
  MenuEstructura: tMenuEs);
begin
  dsReporte.DataSet.FieldByName('CIGDANO').AsInteger := ID;
end;

procedure TfReporte.dbeDireccionDanoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
    sbEditarDireccionClick(nil);
end;

procedure TfReporte.FormShow(Sender: TObject);
var
  Permiso: Integer;
begin
  ConsDll.RefrescarVariables;
  pcDatos.ActivePage := tsInformante;

  if qReporte.State in [dsInsert] then
  begin
    Caption := 'Reporte de Daños (Insertando).';
  end
  else
  begin
    if qReporte.State in [dsEdit] then
    begin
      case EditarReporte of
        0:
          begin
            bbtnAuditoria.Visible := False;
            bbAceptar.Enabled := False;
            qReporte.UpdateObject := nil;
            Caption := 'Reporte de Daños (Modo Solo Lectura).';
            sbFechaRegistro.Enabled := False;
          end;
        1:
          begin
            bbtnAuditoria.Visible := False;
            bbAceptar.Enabled := true;
            Caption := 'Reporte de Daños (Modo Edición).';
            sbFechaRegistro.Enabled := False;
          end;
        2:
          begin
            bbtnAuditoria.Visible := true;
            bbAceptar.Enabled := true;
            Caption := 'Reporte de Daños (Modo Edición++).';
            sbFechaRegistro.Enabled := true;
          end;
      end;
    end;
  end;
  { if (qReporteCODIGOESTADOREPORTE.AsString = '4') then //Reporte Reparado
    begin
    Caption:=Caption +  ' **Reparado**';
    bbAceptar.Enabled:=False;
    qReporte.UpdateObject:=nil;
    end; }
  qTipoDano.Open;
  qGrupoTrabajo.Open;
  if qGrupoTrabajo.RecordCount = 0 then
  Begin
    qGrupoTrabajo.Close;
    qGrupoTrabajo.sql.Text :=
      'SELECT CODIGOGRUPOTRABAJO, NOMBREGRUPOTRABAJO FROM GRUPOTRABAJO  ' +
      ' WHERE CODIGOADMINISTRATIVO=:CODIGOADMINISTRATIVO  AND ACTIVO = ''S''' +
     ' AND codigosedeoperativa = (select c.codigosedeoperativa    '+
     'from c_grupoaol c,apoyo a, reporte r where a.grupoaol= c.codigogrupoaol '+
    ' and r.codigoapoyo=a.codigoapoyo AND R.CODIGOREPORTE =:CODIGOREPORTE)';

    qGrupoTrabajo.Open; 
  End;
  pcDatos.ActivePage := tsInformante;
  // ActualizarBarraEstado;
  Application.ProcessMessages;
  // qReporteTIPOCLIENTEValidate(qReporteTIPOCLIENTE);
  qReporteCODIGOINFORMANTEValidate(qReporteCODIGOINFORMANTE);
  qOdt.close;
  qOdt.open;
  if (ProcManager.CanProcExecute('_Bloquear edicion de reportes') and
    (VarCodigoUsuario <> 0)) then
    DeshabilitarControles(self, False);
end;

function TfReporte.EditarReporte: Integer;
var
  qDatos: TQuery;
begin
  Result := 0;
  ConsDll.RefrescarVariables;
  if VarCodigoUsuario = 0 then // Es Admin ?
  begin
    Result := 2;
    exit;
  end;
  qDatos := TQuery.Create(Application);
  try
    qDatos.DataBaseName := 'BaseDato';
    qDatos.sql.Add
      ('SELECT EDITAR,REABRIR FROM ODTPERMISOS WHERE NOMBRETABLA = ''REPORTE''');
    qDatos.sql.Add('AND CODIGOUSUARIO = ' + IntToSTr(VarCodigoUsuario));
    if qReporteCODIGOADMINISTRATIVO.AsString <> '' then
      qDatos.sql.Add('AND CODIGOADMINISTRATIVO = ' +
        qReporteCODIGOADMINISTRATIVO.AsString);
    qDatos.Open;
    if qDatos.Fields[0].AsString = 'S' then
      Result := 1;
    if qDatos.Fields[1].AsString = 'S' then
      Result := 2;
  finally
    qDatos.Free;
  end;
end;

procedure TfReporte.sbFechaSADClick(Sender: TObject);
var
  sFecha: string;
begin
  sFecha := '';
  Fecha := qReporteFECHAHORASAD.AsString;
  if Fecha = '' then
    Fecha := FechaServidor;
  dbeFechaSAD.Setfocus;
  sFecha := GetFechaHora;
  if sFecha <> '' then
    qReporte.FieldByName('FECHAHORASAD').AsString := sFecha;
end;

procedure TfReporte.sbBuscarCIGClick(Sender: TObject);
var
  Cig: Integer;
  qDatos: TQuery;
  nivelgeografico: Integer;
begin
  Cig := CapturarCIG;
  qDatos := TQuery.Create(Application);
  qDatos.DataBaseName := 'BaseDato';
  qDatos.sql.Add('SELECT NIVEL FROM GEOGRAFICO WHERE CODIGOGEOGRAFICO = ' +
    IntToSTr(Cig));
  qDatos.Open;
  nivelgeografico := qDatos.FieldByName('NIVEL').AsInteger;
  qDatos.Free;
  if nivelgeografico < 3 THEN
    raise Exception.Create
      ('Debe seleccionar un CIG correspondiente a un barrio o por lo menos un municipio.');
  if Cig <> 0 then
    dsReporte.DataSet.FieldByName('CIGDANO').AsInteger := Cig;
  { CIG := CapturarCIG;
    if CIG<>0 then dsReporte.DataSet.FieldByName('CIGDANO').AsInteger:=CIG; }
end;

procedure TfReporte.dbeCIGKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F3 then
    sbBuscarCIGClick(nil);
end;

procedure TfReporte.dbeCIGChange(Sender: TObject);
begin
  qGeografico.Close;
  qGeografico.Open;
end;

procedure TfReporte.sbAsignarODTClick(Sender: TObject);
var
  ODT, FiltroCodCoordGT: string;
  qDatos: TQuery;
  Consecutivo: Integer;
  Repetir: Boolean;
  ODTHija: TODTHija;
  qFechazona: TQuery;
begin
  FiltroCodCoordGT := '';

  if qReporteCODIGOREPORTE.AsString = '' then
    raise Exception.Create('Para asignar este reporte a una orden de trabajo, '
      + Chr(13) + 'este debe ser guardado primero.');

  if qReporteCODIGOTIPODANO.AsString = '' then
    raise Exception.Create
      ('Debe seleccionar el Tipo de Daño en la pestaña Descripción y Observaciones.');

  if (qReporteX.AsString = '') and (qReporteY.AsString = '') then
    raise Exception.Create('Debe asignar coordenadas en la pestana General.');

  if (qReporteCODIGOADMINISTRATIVO.AsString <> '') and
    (qReporteFECHAHORADICTADO.AsString <> '') then
  begin
    if qReporteCODIGOGRUPOTRABAJO.AsString = '' then
      raise Exception.Create('Falta seleccionar el Grupo de Trabajo.');

    qDatos := TQuery.Create(nil);
    qDatos.DataBaseName := 'BaseDato';
    qDatos.sql.Add('SELECT GT.CODIGOCOORDINACIONGRUPOTRABAJO');
    qDatos.sql.Add('FROM GRUPOTRABAJO GT');
    qDatos.sql.Add('WHERE GT.CODIGOADMINISTRATIVO = :CIA');
    qDatos.sql.Add('AND GT.CODIGOGRUPOTRABAJO= :GT');
    qDatos.ParamByName('CIA').AsString := qReporteCODIGOADMINISTRATIVO.AsString;
    qDatos.ParamByName('GT').AsString := qReporteCODIGOGRUPOTRABAJO.AsString;
    qDatos.Open;
    if qDatos.Fields[0].AsString <> '' then
      FiltroCodCoordGT := ' AND CODIGOCOORDINACIONGRUPOTRABAJO = ' +
        qDatos.Fields[0].AsString;
    qDatos.Close;
    qDatos.Free;

    FAsignarODT := TFAsignarODT.Create(Application);
    FAsignarODT.Position := poScreenCenter;
    FAsignarODT.CodigoAdministrativo := qReporteCODIGOADMINISTRATIVO.AsFloat;
    FAsignarODT.Filtro := 'ASOCIARREPORTESDANO = ' + QuotedStr('T') +
      FiltroCodCoordGT;
    qFechazona := TQuery.Create(Application);
    qFechazona.DataBaseName := 'BaseDato';
    qFechazona.sql.Add('select codigosecuencia from odtplantilla');
    qFechazona.sql.Add('where codigoadministrativo=' +
      qReporteCODIGOADMINISTRATIVO.AsString);
    qFechazona.Open;
    ODT := qFechazona.Fields[0].AsString;
    qFechazona.Free;
    NumeroODT := 0;
    try
      FAsignarODT.EdNumeroODT.Text := ODT;
      if FAsignarODT.ShowModal = mrOk then
      begin
        ODT := FAsignarODT.qOdtCODIGOODT.AsString;
        if ODT <> '' then
        begin
          qDatos := TQuery.Create(nil);
          qDatos.DataBaseName := 'BaseDato';
          qDatos.sql.Add('SELECT CODIGOODT FROM ODTREPORTE');
          qDatos.sql.Add('WHERE CODIGOREPORTE = ' +
            qReporteCODIGOREPORTE.AsString);
          qDatos.Open;
          if qDatos.RecordCount > 0 then
          begin
            Application.NormalizeTopMosts;
            MessageDlg
              ('No es posible asignar este reporte a la orden de trabajo # ' +
              ODT + Chr(13) + 'ya que fué asignado a la orden de trabajo #  ' +
              qDatos.Fields[0].AsString, mtError, [mbOK], 0);
            Application.RestoreTopMosts;
          end
          else
          begin
            NumeroODT := StrTofloat(ODT);
            Application.NormalizeTopMosts;
            Application.MessageBox
              (PChar('Al aceptar esta transacción se creará una nueva ODT Hija para dar solución a este reporte en la ODT Padre: '
              + ODT), 'EnerGis', MB_ICONINFORMATION + mb_ok);
            Application.RestoreTopMosts;
            qOdt.Close;
            qOdt.open;
          end;
          qDatos.Close;
          qDatos.Free;
        end;
      end;
    finally
      FAsignarODT.Free;
    end;
  end
  else
  begin
    Application.NormalizeTopMosts;
    Application.MessageBox
      (PChar('Falta por digitar el CIA ó la Fecha y Hora de Dictado del reporte.'),
      'EnerGis', mb_iconerror + mb_ok);
    Application.RestoreTopMosts;
  end;
end;

procedure TfReporte.qReporteAfterClose(DataSet: TDataSet);
begin
  NumeroODT := 0;
end;

function TfReporte.FechaServidor: string;
var
  qFecha: TQuery;
begin
  Result := '';
  qFecha := TQuery.Create(Application);
  qFecha.DataBaseName := 'BaseDato';
  qFecha.sql.Text := 'SELECT SYSDATE FROM DUAL';
  qFecha.Open;
  Result := qFecha.Fields[0].AsString;
  qFecha.Free;
end;

procedure TfReporte.sbUbicarNodoFisicoClick(Sender: TObject);
Var
  qBuscarApoyo: TQuery;
begin
  if (qReporteCODIGOAPOYO.AsString <> '') then
  begin
    MostrarMapa;
    BuscarApoyo(qReporteCODIGOAPOYO.AsString, true);
  end
  else
  begin
    MostrarMapa;
    qBuscarApoyo := TQuery.Create(Application);
    qBuscarApoyo.DataBaseName := qReporte.DataBaseName;
    qBuscarApoyo.Close;
    qBuscarApoyo.sql.Add('Select CodigoApoyo From Apoyo where PintadoApoyo=''' +
      qReporte.FieldByName('PINTADOAPOYO').AsString + '''');
    qBuscarApoyo.Open;
    try
      BuscarApoyo(qBuscarApoyo.FieldByName('CodigoApoyo').AsString, true);
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
    qBuscarApoyo.Free;
  end;
end;

procedure TfReporte.sbUbicarComercialClick(Sender: TObject);
Var
  qBuscarComercial: TQuery;
begin

  if not(trim(dbeComercial.Text) = EmptyStr) then
  begin

    qBuscarComercial := TQuery.Create(Application);
    qBuscarComercial.DataBaseName := qReporte.DataBaseName;
    qBuscarComercial.Close;
    qBuscarComercial.sql.Clear;
    MostrarMapa;
    if (qReporteCODIGOTIPOREPORTE.AsString = 'A') then
    begin
      if (dbeLuminaria.Text <> '') then
      begin
        qBuscarComercial.sql.Add
          ('SELECT A.CODIGOAPOYO FROM APOYO A,ALUMBRADOPUBLICO AP');
        qBuscarComercial.sql.Add
          ('WHERE AP.CODIGOAPOYO=A.CODIGOAPOYO AND AP.CODIGOACTUAL=''' +
          dbeLuminaria.Text + '''');
        qBuscarComercial.Open;
        self.Position := poDesigned;
        BuscarApoyo(qBuscarComercial.FieldByName('CodigoApoyo').AsString, true);
      end;
    end
    else
    begin
      if (dbeComercial.Text <> '') then
      begin
        if (dbeComercial.Text <> '') then
        begin
          qBuscarComercial.sql.Add
            ('SELECT C.CODIGOCLIENTESGD FROM CLIENTESGD C');
          qBuscarComercial.sql.Add
            ('WHERE C.CODIGOESTADOINFRAESTRUCTURA <> 3 AND C.CODIGO_CUENTA=''' +
            dbeComercial.Text + '''');
          qBuscarComercial.Open;
          self.Position := poDesigned;
          BuscarCliente(qReporteCODIGOCLIENTESGD.AsString, true);
        end;
      end;
    end;
    // BuscaDatos(2);
    qBuscarComercial.Free;

  end
  else
    Application.MessageBox
      (PChar('El numero de cliente de comercial no es valido, escriba uno e intente nuevamente.'),
      PChar('Información'), mb_ok + mb_iconerror);

end;

procedure TfReporte.sbUbicarMedidorClick(Sender: TObject);
Var
  qBuscarCliente: TQuery;
begin

  if not(trim(dbeMedidor.Text) = EmptyStr) then
  begin

    qBuscarCliente := TQuery.Create(Application);
    qBuscarCliente.DataBaseName := qReporte.DataBaseName;
    qBuscarCliente.Close;
    qBuscarCliente.sql.Add
      ('Select CodigoClientesgd FROM Clientesgd where Codigoestadoinfraestructura <> 3 and CodigoContador='''
      + qReporte.FieldByName('CodigoContador').AsString + '''');
    qBuscarCliente.Open;
    self.Position := poDesigned;
    BuscarCliente(qBuscarCliente.FieldByName('CodigoClientesgd')
      .AsString, true);
    qBuscarCliente.Free;
  end
  else
    Application.MessageBox
      (PChar('El numero del medidor no es valido, escriba uno e intente nuevamente.'),
      PChar('Información'), mb_ok + mb_iconerror);

end;

procedure TfReporte.qReportePINTADOAPOYOValidate(Sender: TField);
var
  qDatos: TQuery;
  Cantidad: Integer;
  qActualizar: TQuery;
  query: TQuery;
begin
  { if (Sender.Text <> '') and (qReporte.State in [dsInsert]) then
    begin
    qDatos:=TQuery.Create(Application);
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Add('SELECT CODIGOREPORTE, FECHAHORA, NOMBREINFORMANTE,');
    qDatos.SQL.Add('FECHAHORADICTADO, FECHAHORALLEGADA, FECHAHORAATENCION,');
    qDatos.SQL.Add('DIRECCIONDANO, TELEFONO, PINTADOAPOYO, CODIGOELEMENTO, REGISTROS');
    qDatos.SQL.Add('FROM REPORTE WHERE');
    qDatos.SQL.Add('PINTADOAPOYO = ' + Sender.Text);
    qDatos.SQL.Add('AND CODIGOESTADOREPORTE IN (''1'',''2'',''3'')');
    qDatos.Open;
    if qDatos.RecordCount > 0 then
    begin
    FReporteSimilar:=TFReporteSimilar.Create(Application);
    FReporteSimilar.dsDatos.DataSet:=qDatos;
    FReporteSimilar.Query1.Close;
    FReporteSimilar.Query1.Open;
    FReporteSimilar.lTitulo.Caption:='Existen Reportes Similares registrados:';
    if FReporteSimilar.ShowModal = mrYes then
    begin
    qActualizar:=TQuery.Create(Application);
    qActualizar.DatabaseName:='BaseDato';
    qActualizar.SQL.Add('UPDATE REPORTE SET REGISTROS = REGISTROS + 1 WHERE');
    qActualizar.SQL.Add('CODIGOREPORTE = '+qDatos.Fields[0].AsString);
    qActualizar.ExecSQL;
    qActualizar.Free;
    qReporte.Cancel;
    qReporte.Close;
    qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE='+
    qDatos.FieldByName('CODIGOREPORTE').AsString;
    qReporte.Open;
    qReporte.Edit;
    end;
    FReporteSimilar.Free;
    //ShowMessage('Este Reporte Parece Similar al Reporte ' + qDatos.Fields[0].AsString);
    end
    else
    begin


    end;
    qDatos.Free;
    end; }
  if Sender.AsString <> '' then
  begin
    query := TQuery.Create(Application);
    query.DataBaseName := 'BaseDato';
    query.sql.Text := 'SELECT CODIGOAPOYO FROM APOYO WHERE PINTADOAPOYO=''' +
      qReportePINTADOAPOYO.AsString + '''';
    query.Open;
    if (query.RecordCount > 0) then
    begin
      qReporteCODIGOAPOYO.AsString := query.FieldByName('CODIGOAPOYO').AsString;
      query.Close;
      query.Free;
    end
    else
    begin
      query.Close;
      query.Free;
      raise Exception.Create
        ('Este código pintado de apoyo no existe, Por favor verifique.');
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfReporte.qReporteCODIGOCLIENTECOMValidate(Sender: TField);
var
  qDatos: TQuery;
  Cantidad: Integer;
  qActualizar: TQuery;
begin
  if (Sender.Text <> '') and (qReporte.State in [dsInsert]) then
  begin
    qDatos := TQuery.Create(Application);
    qDatos.DataBaseName := 'BaseDato';
    qDatos.sql.Add('SELECT CODIGOREPORTE, FECHAHORA, NOMBREINFORMANTE,');
    qDatos.sql.Add('FECHAHORADICTADO, FECHAHORALLEGADA, FECHAHORAATENCION,');
    qDatos.sql.Add
      ('DIRECCIONDANO, TELEFONO, PINTADOAPOYO, CODIGOELEMENTO, REGISTROS');
    qDatos.sql.Add('FROM REPORTE WHERE');
    qDatos.sql.Add('CODIGOCLIENTECOM = ' + Sender.Text);
    qDatos.sql.Add('AND CODIGOESTADOREPORTE IN (''1'',''2'',''3'')');
    qDatos.Open;
    if qDatos.RecordCount > 0 then
    begin
      FReporteSimilar := TFReporteSimilar.Create(Application);
      FReporteSimilar.dsDatos.DataSet := qDatos;
      FReporteSimilar.Query1.Close;
      FReporteSimilar.Query1.Open;
      FReporteSimilar.lTitulo.Caption :=
        'Existen Reportes Similares registrados:';
      if FReporteSimilar.ShowModal = mrYes then
      begin
        qActualizar := TQuery.Create(Application);
        qActualizar.DataBaseName := 'BaseDato';
        qActualizar.sql.Add
          ('UPDATE REPORTE SET REGISTROS = REGISTROS + 1 WHERE');
        qActualizar.sql.Add('CODIGOREPORTE = ' + qDatos.Fields[0].AsString);
        qActualizar.ExecSQL;
        qActualizar.Free;
        qReporte.Cancel;
        qReporte.Close;
        qReporte.sql.Text := 'SELECT * FROM REPORTE WHERE CODIGOREPORTE=' +
          qDatos.FieldByName('CODIGOREPORTE').AsString;
        qReporte.Open;
        qReporte.Edit;
      end;
      FReporteSimilar.Free;
      // ShowMessage('Este Reporte Parece Similar al Reporte ' + qDatos.Fields[0].AsString);
    end
    else
    begin
    end;
    qDatos.Free;
  end;
end;

procedure TfReporte.qReporteCODIGOCONTADORValidate(Sender: TField);
var
  qDatos: TQuery;
  Cantidad: Integer;
  qActualizar: TQuery;
begin
  try
    if (Sender.Text <> '') and (qReporte.State in [dsInsert]) then
    begin
      qDatos := TQuery.Create(Application);
      qDatos.DataBaseName := 'BaseDato';
      qDatos.sql.Add('SELECT CODIGOREPORTE, FECHAHORA, NOMBREINFORMANTE,');
      qDatos.sql.Add('FECHAHORADICTADO, FECHAHORALLEGADA, FECHAHORAATENCION,');
      qDatos.sql.Add
        ('DIRECCIONDANO, TELEFONO, PINTADOAPOYO, CODIGOELEMENTO, REGISTROS');
      qDatos.sql.Add('FROM REPORTE WHERE');
      qDatos.sql.Add('CODIGOCONTADOR = ' + Sender.Text);
      qDatos.sql.Add('AND CODIGOESTADOREPORTE IN (''1'',''2'',''3'')');
      qDatos.Open;
      if qDatos.RecordCount > 0 then
      begin
        FReporteSimilar := TFReporteSimilar.Create(Application);
        FReporteSimilar.dsDatos.DataSet := qDatos;
        FReporteSimilar.Query1.Close;
        FReporteSimilar.Query1.Open;
        FReporteSimilar.lTitulo.Caption :=
          'Existen Reportes Similares registrados:';
        if FReporteSimilar.ShowModal = mrYes then
        begin
          qActualizar := TQuery.Create(Application);
          qActualizar.DataBaseName := 'BaseDato';
          qActualizar.sql.Add
            ('UPDATE REPORTE SET REGISTROS = REGISTROS + 1 WHERE');
          qActualizar.sql.Add('CODIGOREPORTE = ' + qDatos.Fields[0].AsString);
          qActualizar.ExecSQL;
          qActualizar.Free;
          qReporte.Cancel;
          qReporte.Close;
          qReporte.sql.Text := 'SELECT * FROM REPORTE WHERE CODIGOREPORTE=' +
            qDatos.FieldByName('CODIGOREPORTE').AsString;
          qReporte.Open;
          qReporte.Edit;
        end;
        FReporteSimilar.Free;
        // ShowMessage('Este Reporte Parece Similar al Reporte ' + qDatos.Fields[0].AsString);
      end
      else
      begin
      end;
      qDatos.Free;
    end;
  except
  end;
end;

procedure TfReporte.qReporteTELEFONOValidate(Sender: TField);
var
  qDatos: TQuery;
  Cantidad: Integer;
  qActualizar: TQuery;
begin
  if (Sender.Text <> '') and (qReporte.State in [dsInsert]) then
  begin
    qDatos := TQuery.Create(Application);
    qDatos.DataBaseName := 'BaseDato';
    qDatos.sql.Add('SELECT CODIGOREPORTE, FECHAHORA, NOMBREINFORMANTE,');
    qDatos.sql.Add('FECHAHORADICTADO, FECHAHORALLEGADA, FECHAHORAATENCION,');
    qDatos.sql.Add
      ('DIRECCIONDANO, TELEFONO, PINTADOAPOYO, CODIGOELEMENTO, REGISTROS');
    qDatos.sql.Add('FROM REPORTE WHERE');
    qDatos.sql.Add('TELEFONO = ''' + Sender.Text + '');
    qDatos.sql.Add('AND CODIGOESTADOREPORTE IN (''1'',''2'',''3'')');
    qDatos.Open;
    if qDatos.RecordCount > 0 then
    begin
      FReporteSimilar := TFReporteSimilar.Create(Application);
      FReporteSimilar.dsDatos.DataSet := qDatos;
      FReporteSimilar.Query1.Close;
      FReporteSimilar.Query1.Open;
      FReporteSimilar.lTitulo.Caption :=
        'Existen Reportes Similares registrados:';
      if FReporteSimilar.ShowModal = mrYes then
      begin
        qActualizar := TQuery.Create(Application);
        qActualizar.DataBaseName := 'BaseDato';
        qActualizar.sql.Add
          ('UPDATE REPORTE SET REGISTROS = REGISTROS + 1 WHERE');
        qActualizar.sql.Add('CODIGOREPORTE = ' + qDatos.Fields[0].AsString);
        qActualizar.ExecSQL;
        qActualizar.Free;
        qReporte.Cancel;
        qReporte.Close;
        qReporte.sql.Text := 'SELECT * FROM REPORTE WHERE CODIGOREPORTE=' +
          qDatos.FieldByName('CODIGOREPORTE').AsString;
        qReporte.Open;
        qReporte.Edit;
      end;
      FReporteSimilar.Free;
      // ShowMessage('Este Reporte Parece Similar al Reporte ' + qDatos.Fields[0].AsString);
    end
    else
    begin
    end;
    qDatos.Free;
  end;
end;

procedure TfReporte.qReporteDIRECCIONINFORMANTEValidate(Sender: TField);
var
  qDatos: TQuery;
  qActualizar: TQuery;
begin
  if (Sender.Text <> '') and (qReporte.State in [dsInsert]) then
  begin
    qDatos := TQuery.Create(Application);
    qDatos.DataBaseName := 'BaseDato';
    qDatos.sql.Add('SELECT CODIGOREPORTE, FECHAHORA, NOMBREINFORMANTE,');
    qDatos.sql.Add('FECHAHORADICTADO, FECHAHORALLEGADA, FECHAHORAATENCION,');
    qDatos.sql.Add
      ('DIRECCIONDANO, TELEFONO, PINTADOAPOYO, CODIGOELEMENTO, REGISTROS');
    qDatos.sql.Add('FROM REPORTE WHERE');
    qDatos.sql.Add('direcciondano = ' + Sender.Text);
    qDatos.sql.Add('AND CODIGOESTADOREPORTE IN (''1'',''2'',''3'')');
    qDatos.Open;
    if qDatos.RecordCount > 0 then
    begin
      FReporteSimilar := TFReporteSimilar.Create(Application);
      FReporteSimilar.dsDatos.DataSet := qDatos;
      FReporteSimilar.Query1.Close;
      FReporteSimilar.Query1.Open;
      FReporteSimilar.lTitulo.Caption :=
        'Existen Reportes Similares registrados:';
      if FReporteSimilar.ShowModal = mrYes then
      begin
        qActualizar := TQuery.Create(Application);
        qActualizar.DataBaseName := 'BaseDato';
        qActualizar.sql.Add
          ('UPDATE REPORTE SET REGISTROS = REGISTROS + 1 WHERE');
        qActualizar.sql.Add('CODIGOREPORTE = ' + qDatos.Fields[0].AsString);
        qActualizar.ExecSQL;
        qActualizar.Free;
        qReporte.Cancel;
        qReporte.Close;
        qReporte.sql.Text := 'SELECT * FROM REPORTE WHERE CODIGOREPORTE=' +
          qDatos.FieldByName('CODIGOREPORTE').AsString;
        qReporte.Open;
        qReporte.Edit;
      end;
      FReporteSimilar.Free;
      // ShowMessage('Este Reporte Parece Similar al Reporte ' + qDatos.Fields[0].AsString);
    end;
    qDatos.Free;
  end;
end;

procedure TfReporte.SpBUSCARDIRClick(Sender: TObject);
begin
  if not(trim(dbeDireccionDano.Text) = EmptyStr) then
  begin
    BuscaDatos(5);
  end
  else
    Application.MessageBox
      (PChar('La dirección no es valida, escriba uno e intente nuevamente.'),
      PChar('Información'), mb_ok + mb_iconerror);
end;

procedure TfReporte.sbFechaRegistroClick(Sender: TObject);
begin
  inherited;
  try
    // dbEdFechaHora.Setfocus;
    sFecha := dbEdFechaHora.Text;
    Fecha := GetFechaHora;
    if Fecha <> '' then
      dbEdFechaHora.Text := Fecha;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TfReporte.qReporteFECHAHORAValidate(Sender: TField);
begin
  if (Sender.Text <> '') and (qReporteFECHAHORADICTADO.AsString <> '') then
  begin
    if (Sender.AsDateTime > qReporteFECHAHORADICTADO.AsDateTime) then
      raise Exception.Create
        ('Advertencia : La fecha de recepción del reporte no puede ser mayor que la fecha de dictado del mismo.');
  end;
  if (Sender.Text <> '') and (qReporteFECHAHORALLEGADA.AsString <> '') then
  begin
    if (Sender.AsDateTime > qReporteFECHAHORALLEGADA.AsDateTime) then
      raise Exception.Create
        ('La fecha de recepción del reporte  no puede ser mayor que la fecha de llegada al sitio de trabajo.');
  end;
  if (Sender.Text <> '') and (qReporteFECHAHORAATENCION.AsString <> '') then
  begin
    if (Sender.AsDateTime > qReporteFECHAHORAATENCION.AsDateTime) then
      raise Exception.Create
        ('La fecha de recepción del reporte  no puede ser mayor que la fecha de atención del mismo.');
  end;
end;

procedure TfReporte.sbClienteClick(Sender: TObject);
begin
  qReporte.FieldByName('CODIGOTIPOREPORTE').AsString := 'C';
  qReporte.FieldByName('PRIORIDADDANO').AsString := '';
end;

procedure TfReporte.sbAlumbradoClick(Sender: TObject);
begin
  qReporte.FieldByName('CODIGOTIPOREPORTE').AsString := 'A';
  qReporte.FieldByName('PRIORIDADDANO').AsString := '';
end;

procedure TfReporte.sbBuscarLuminariaClick(Sender: TObject);
var
  query: TQuery;
  codigocuenta: string;
begin
  if dbeLuminaria.Text <> '' then
  begin
    query := TQuery.Create(Application);
    query.DataBaseName := 'BaseDato';
    query.sql.Add
      ('SELECT PINTADOAPOYO,AP.CODIGO_CUENTA FROM APOYO A,ALUMBRADOPUBLICO AP');
    query.sql.Add('WHERE AP.CODIGOAPOYO=A.CODIGOAPOYO AND AP.CODIGOACTUAL=''' +
      dbeLuminaria.Text + '''');
    query.Open;
    qReportePINTADOAPOYO.AsString := query.FieldByName('PINTADOAPOYO').AsString;
    qReporteCODIGOCLIENTECOM.AsString :=
      query.FieldByName('CODIGO_CUENTA').AsString;
    if (query.FieldByName('CODIGO_CUENTA').AsString <> '') then
    begin
      codigocuenta := query.FieldByName('CODIGO_CUENTA').AsString;
      query.sql.Clear;
      query.sql.Add
        ('SELECT CODIGOCONTADOR,CODIGOCLIENTESGD FROM CLIENTESGD WHERE CODIGOESTADOINFRAESTRUCTURA <> 3 AND CODIGO_CUENTA='''
        + codigocuenta + '''');
      query.Open;
      qReporteCODIGOCONTADOR.AsString :=
        query.FieldByName('CODIGOCONTADOR').AsString;
      qReporteCODIGOCLIENTESGD.AsString :=
        query.FieldByName('CODIGOCLIENTESGD').AsString;
    end;
    query.Close;
    query.Free;
  end;
end;

procedure TfReporte.qReporteAfterPost(DataSet: TDataSet);
var
  query: TQuery;
  codap, codobs: Integer;
begin
  if (qReporteCODIGOTIPOREPORTE.AsString = 'A') and
    (qReporteCODIGOTIPODANO.AsString <> '') then
  begin
    if (qReporteCODIGOELEMENTO.AsString <> '') then
    begin
      query := TQuery.Create(Application);
      query.DataBaseName := 'BaseDato';
      query.sql.Add
        ('SELECT AP.CODIGOALUMBRADOPUBLICO FROM APOYO A,ALUMBRADOPUBLICO AP');
      query.sql.Add('WHERE AP.CODIGOAPOYO=A.CODIGOAPOYO AND AP.CODIGOACTUAL='''
        + qReporteCODIGOELEMENTO.AsString + '''');
      query.Open;
      codap := query.Fields[0].AsInteger;

      query.sql.Clear;
      query.sql.Add
        ('SELECT TDA.CODIGOOBSERVACION FROM TIPODANO TD,TIPODANOALUMBRADO TDA');
      query.sql.Add('WHERE TD.CODIGOTIPODANO=TDA.CODIGOTIPODANO');
      query.sql.Add('AND TD.CODIGOTIPODANO=' + qReporteCODIGOTIPODANO.AsString);
      query.Open;
      codobs := query.Fields[0].AsInteger;

      query.sql.Clear;
      query.sql.Add('UPDATE ALUMBRADOPUBLICO SET CODIGOOBSERVACION=' +
        IntToSTr(codobs));
      query.sql.Add('WHERE CODIGOALUMBRADOPUBLICO=' + IntToSTr(codap));
      query.ExecSQL;
      query.Close;
      query.Free;
    end;
  end;
end;

procedure TfReporte.qReporteCODIGOTIPOREPORTEChange(Sender: TField);
begin
  qTipoDano.Close;
  qTipoDano.Open;
end;

procedure TfReporte.SpeedButton3Click(Sender: TObject);
begin
  Flistalamparaap := TfListaLamparaAp.Create(Application);
  Flistalamparaap.qLamparaAP.DataSource := dsReporte;
  Flistalamparaap.qLamparaAP.Open;
  if Flistalamparaap.ShowModal = mrOk then
  begin
    if Flistalamparaap.DBGrid1.SelectedRows.Count > 0 then
    begin
      qReporteCODIGOELEMENTO.AsString :=
        Flistalamparaap.qLamparaAPCODIGOACTUAL.AsString;
    end;
  end;
  Flistalamparaap.Free;
end;

procedure TfReporte.qReportePINTADOAPOYOChange(Sender: TField);
var
  query: TQuery;
begin
  if Sender.AsString <> '' then
  begin
    query := TQuery.Create(Application);
    query.DataBaseName := 'BaseDato';
    if (qReporteCIGDANO.AsString = '') or (qReporteCIGDANO.AsString = '1') then
    begin
      query.sql.Text :=
        'SELECT CODIGOGEOGRAFICO FROM APOYO WHERE PINTADOAPOYO=''' +
        qReportePINTADOAPOYO.AsString + '''';
      query.Open;
      qReporteCIGDANO.AsString := query.FieldByName('CODIGOGEOGRAFICO')
        .AsString;
    end;
    query.Close;
    query.Free;
  end;
end;

procedure TfReporte.sbBorrarClick(Sender: TObject);
begin
  qReporte.Cancel;
  qReporte.Insert;
  FormShow(Sender);

  dbeNombreInformante.Text := '';
  dbeCIAInformante.Text := '';
  dbeFuncionario.Text := '';
  dbeTelefono.Text := '';
  dbeNodoFisico.Text := '';
  dbeLuminaria.Text := '';
  dbeComercial.Text := '';
  dbeMedidor.Text := '';
  dbeCIG.Text := '';
  qReporteX.AsString := '';
  qReporteY.AsString := '';
  qReporteCODIGOTRAFODIS.AsString := '';
  qReporteCODIGOCLIENTESGD.AsString := '';
  qReporteCODIGOAPOYO.AsString := '';
  qReportePINTADOAPOYO.AsString := '';
  LimpiarDireccion;
end;

procedure TfReporte.EnlazarSoereporte;
var
  sql: string;
  qry: TQuery;
begin
  if codigoevento <> -1 then
  begin
    qry := TQuery.Create(self);
    qry.DataBaseName := 'BaseDato';
    qry.sql.Clear;
    sql := 'select * from soe_reporte where codigoreporte=' +
      qReporte.FieldByName('codigoreporte').AsString + ' and codigoevento=' +
      IntToSTr(codigoevento);
    qry.sql.Add(sql);
    qry.Open;
    if qry.IsEmpty then
    begin
      qry.Close;
      qry.sql.Clear;
      sql := 'insert into soe_reporte values(' + IntToSTr(codigoevento) + ',' +
        qReporte.FieldByName('codigoreporte').AsString + ')';
      qry.sql.Add(sql);
      qry.ExecSQL;
      codigoevento := -1;
    end;
    qry.Free;
  end;
end;

procedure TfReporte.VerificarReporte(codigocliente: string);
var
  qry: TQuery;
  sql, temptrafo, tempcircuito, tempinterruptor, buscar, lineaevento: string;
  my_listareporteasociado: Tflistareportesasociados;
  interrupcion, i: Integer;
  evento: TStringList;
  ReportesTrafo: Boolean;
begin
  interrupcion := -1;
  lineaevento := '';
  codigoevento := -1;
  ReportesTrafo := False;

  qry := TQuery.Create(self);
  qry.DataBaseName := 'BaseDato';
  qry.Close;
  qry.sql.Clear;
  sql := ' select t.codigotrafodis, nm.codigocircuito ' +
    'from clientesgd c, nodobt nb, trafodis t, nodomt nm ' + 'where ' +
    'c.codigoclientesgd =' + codigocliente + 'and c.codigoapoyo=nb.codigoapoyo '
    + 'and c.codigonodobt=nb.codigonodobt ' +
    'and nb.codigotrafodis=t.codigotrafodis ' +
    'and t.codigoapoyo1=nm.codigoapoyo ' +
    'and t.codigonodomt=nm.codigonodomt ';
  qry.sql.Add(sql);
  // Sacar el trafo y el circuito de un cliente por el ClienteSGD
  qry.Open;
  if ((not(qry.IsEmpty)) and (qReporte.FieldByName('CODIGOINFORMANTE')
    .AsString = '01')) then
  begin
    temptrafo := qry.Fields[0].AsString;
    tempcircuito := qry.Fields[1].AsString;

    evento := TStringList.Create;
    evento.Assign(VerificarInterrupcion(temptrafo));
    // Verifica si existe evento abierto.

    if evento.Count = 4 then
    begin
      interrupcion := strtoint(evento[0]);
      // -1. Sin interrupcion, 0. Interrupcion Circuito , 1. Interrupcion Interruptor
      lineaevento := evento[1];
      buscar := evento[2];
      codigoevento := strtoint(evento[3]);
    end;

    evento.Free;

    sql := '';
    tempinterruptor := EncontrarInterruptorAguasArriba(tempcircuito, temptrafo);
    if tempinterruptor <> '' then
    begin
      if interrupcion = 1 then
        tempinterruptor := buscar;
      // se cambia el codigo del interruptor por el de la Interrupcion.
      sql := VerificarReportesTrafo(codigocliente, temptrafo);
    end
    else
      sql := VerificarReportesTrafo(codigocliente, temptrafo);

    if sql <> '' then
    begin
      Application.MessageBox(PChar('Se han encontrado Reportes Asociados.' +
        Chr(13) + 'El reporte padre asignado es: ' + ReportePadre(sql)),
        PChar('Reportes'), MB_ICONINFORMATION);
      if interrupcion = -1 then
      begin
        my_listareporteasociado := Tflistareportesasociados.crear(self,
          'Listado de Reportes Asociados', sql,
          qReporte.FieldByName('codigoreporte').AsString, true);
        my_listareporteasociado.height := 225;
        my_listareporteasociado.pInterrupcion.Visible := False;
        my_listareporteasociado.memo.Lines.Add(lineaevento);
        my_listareporteasociado.asociar.Visible := true;
        my_listareporteasociado.bSalir.Visible := False;
      end
      else
        my_listareporteasociado := Tflistareportesasociados.crearconevento(self,
          'Listado de Reportes Asociados', sql, lineaevento,
          qReporte.FieldByName('codigoreporte').AsString, true);

      my_listareporteasociado.ShowModal;
    end
    else
    begin
      if interrupcion <> -1 then
      begin
        my_listareporteasociado := Tflistareportesasociados.Create(Application);
        my_listareporteasociado.dbgReportesAsociados.Visible := False;
        my_listareporteasociado.height := 158;
        my_listareporteasociado.titular.Caption := 'Interrupción';
        my_listareporteasociado.Circuito(tempcircuito);
        my_listareporteasociado.memo.Lines.Add(lineaevento);
        my_listareporteasociado.asociar.Visible := False;
        my_listareporteasociado.ShowModal;
      end
    end;

  end;
end;

procedure TfReporte.SpeedButton7Click(Sender: TObject);
VAR
  qDatos: TQuery;
begin
  IF qReporteCIGDANO.AsString <> '' then
  Begin
    MostrarMapa;
    qDatos := TQuery.Create(Application);
    qDatos.DataBaseName := 'BaseDato';
    qDatos.sql.Add('SELECT NIVEL FROM GEOGRAFICO WHERE CODIGOGEOGRAFICO = ' +
      qReporteCIGDANO.AsString);
    qDatos.Open;
    if qDatos.FieldByName('nivel').AsInteger = 3 then
      BuscarCIG(qReporteCIGDANO.AsString, 3, true)
    else
      BuscarBarrio(qReporteCIGDANO.AsString, true);
    qDatos.Free;
  End;

end;

procedure TfReporte.SpeedButton8Click(Sender: TObject);
var
  CIA: Integer;
begin
  CIA := 13;
  qReporteCODIGOADMINISTRATIVO.AsInteger := CIA;
  qReporteCODIGOCLASEREPORTE.AsString := '1';
end;

procedure TfReporte.LimpiarDireccion;
begin
  qReporteCODIGOTIPOVIA.AsString := '';
  qReporteCODIGONOMBREVIA.AsString := '';
  qReporteMODIFICADORVIA.AsString := '';
  qReporteDUPLICADOR.AsString := '';
  qReporteMODIFICADORDUPLICADOR.AsString := '';
  qReporteNUMEROPUERTA.AsString := '';
  qReporteCODIGOTIPOPREDIO.AsString := '';
  qReporteDESCRIPCIONTIPOPREDIO.AsString := '';
end;

procedure TfReporte.ActualizarBarraEstado;
var
  fondo, letra: tcolor;
  i: Integer;
begin
  StatusBar1.Panels[1].Text := qReporteNombreEstadoReporte.AsString;
  StatusBar1.Panels[3].Text := qReporteX.AsString;
  StatusBar1.Panels[5].Text := qReporteY.AsString;
  StatusBar1.Panels[7].Text := qReporteCODIGOTRAFODIS.AsString;
  fondo := clBtnFace;
  letra := clBlack;
  MensajeEstado := '';
  stbMensaje.Panels[0].Text := MensajeEstado;
  stbMensaje.Color := fondo;
  // stbMensaje.Font.Color:= letra;
  try
    // if (qReporteCODIGOADMINISTRATIVO.AsString='63') then
    // begin
    if (qReporteX.AsString = '') or (qReporteY.AsString = '') then
    begin
      fondo := clred;
      letra := clwhite;
      MensajeEstado := 'Reporte sin georeferenciar';
      stbMensaje.Panels[0].Text := MensajeEstado;
    end
    else
    begin
      if (qReporteCODIGOTRAFODIS.AsString = '') then
      begin
        fondo := $000080FF;
        letra := clwhite;
        MensajeEstado := 'Reporte sin información electrica';
        stbMensaje.Panels[0].Text := MensajeEstado;
      end
      else
      begin
        if TrafoMedidaCentralizada(qReporteCODIGOTRAFODIS.AsString) then
        begin
          fondo := clYellow;
          letra := clBlack;
          MensajeEstado := 'Transformador con Medida Centralizada';
          stbMensaje.Panels[0].Text := MensajeEstado;
        end;
      end;
    end;
    stbMensaje.Color := fondo;
    // stbMensaje.Font.Color:= letra;
    // end;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TfReporte.qReporteCODIGOESTADOREPORTEChange(Sender: TField);
var
  query: TQuery;
  i: Integer;
  s: string;
begin
  query := TQuery.Create(self);
  query.DataBaseName := 'BaseDato';
  query.sql.Add('select count(*) from Estadoreporte');
  query.sql.Add('where activo=''S''');
  query.sql.Add('and codigoestadoreporte=''' + Sender.AsString + '''');
  query.Open;
  i := query.Fields[0].AsInteger;
  query.Free;
  s := qEstadoReporte.FieldByName('NombreEstadoReporte').AsString;
  if i = 0 then
    raise Exception.Create('El tipo de EstadoReporte ' + s + ' no está activo');
  ActualizarBarraEstado;
end;

procedure TfReporte.qReporteXChange(Sender: TField);
begin
  ActualizarBarraEstado;
  ActualizarEstadoRecibido;
end;

procedure TfReporte.qReporteYChange(Sender: TField);
begin
  ActualizarBarraEstado;
  ActualizarEstadoRecibido;
end;

procedure TfReporte.qReporteCODIGOAPOYOChange(Sender: TField);
var
  query: TQuery;
  x, y, Valor: String;

begin
  if (Sender.AsString <> '') and not Duplicado then
  begin
    query := TQuery.Create(self);
    query.DataBaseName := 'BaseDato';
    query.sql.Add('SELECT X,Y FROM CLIENTESGD WHERE CODIGOCLIENTESGD=' +
      Sender.AsString);
    Valor := Sender.AsString;
    query.Open;
    qReporteX.AsFloat := query.FieldByName('X').AsFloat - 1;
    x := query.FieldByName('X').AsString;
    qReporteY.AsFloat := query.FieldByName('Y').AsFloat;
    y := query.FieldByName('Y').AsString;
    query.Free;
  end;
end;

procedure TfReporte.qReporteCODIGOCLIENTESGDChange(Sender: TField);
var
  query: TQuery;
  x, y: STring;
begin
  if (Sender.AsString <> '') and not Duplicado then
  begin
    qDatosElectricos.Close;
    qDatosElectricos.Open;
    if (qReporte.FieldByName('CODIGOSUBESTACION').AsString = '') then
      qReporte.FieldByName('CODIGOSUBESTACION').AsString :=
        qDatosElectricos.FieldByName('CODIGOSUBESTACION').AsString;
    if (qReporte.FieldByName('CODIGOCIRCUITO').AsString = '') then
      qReporte.FieldByName('CODIGOCIRCUITO').AsString :=
        qDatosElectricos.FieldByName('CODIGOCIRCUITO').AsString;
    if (qReporte.FieldByName('CODIGOTRAFODIS').AsString = '') then
      qReporte.FieldByName('CODIGOTRAFODIS').AsString :=
        qDatosElectricos.FieldByName('CODIGOTRAFODIS').AsString;
    if (qReporte.FieldByName('CODIGONODOBT').AsString = '') then
      qReporte.FieldByName('CODIGONODOBT').AsString :=
        qDatosElectricos.FieldByName('CODIGONODOBT').AsString;
    query := TQuery.Create(self);
    query.DataBaseName := 'BaseDato';
    query.sql.Add('SELECT X,Y FROM CLIENTESGD WHERE CODIGOCLIENTESGD=' +
      Sender.AsString);
    query.Open;
    x := query.FieldByName('X').AsString;
    y := query.FieldByName('Y').AsString;
    qReporteX.AsFloat := query.FieldByName('X').AsFloat - 1;
    qReporteY.AsFloat := query.FieldByName('Y').AsFloat;
    query.Close;
    query.Free;
  end;
  ValidarTipoCliente;
end;

procedure TfReporte.qReporteBeforePost(DataSet: TDataSet);
var
  query: TQuery;
begin
  query := TQuery.Create(self);
  query.DataBaseName := 'BaseDato';
  if (qReporteX.AsString = '') or (qReporteY.AsString = '') then
  begin
    if (qReporteCODIGOCLIENTESGD.AsString <> '') then
    begin
      query.sql.Clear;
      query.sql.Add('SELECT X,Y FROM CLIENTESGD WHERE CODIGOCLIENTESGD=' +
        qReporteCODIGOCLIENTESGD.AsString);
      query.Open;
      qReporteX.AsFloat := query.FieldByName('X').AsFloat - 1;
      qReporteY.AsFloat := query.FieldByName('Y').AsFloat;
    end
    else
    begin
      if (qReporteCODIGOAPOYO.AsString <> '') then
      begin
        query.sql.Clear;
        query.sql.Add('SELECT X,Y FROM APOYO WHERE CODIGOAPOYO=' +
          qReporteCODIGOAPOYO.AsString);
        query.Open;
        qReporteX.AsFloat := query.FieldByName('X').AsFloat - 2;
        qReporteY.AsFloat := query.FieldByName('Y').AsFloat;
      end;
    end;
  end;
  if (qReporteCODIGOTRAFODIS.AsString = '') then
  begin
    if (qReporteCODIGOCLIENTESGD.AsString <> '') then
    begin
      qDatosElectricos.Close;
      qDatosElectricos.Open;
      if (qReporte.FieldByName('CODIGOSUBESTACION').AsString = '') then
        qReporte.FieldByName('CODIGOSUBESTACION').AsString :=
          qDatosElectricos.FieldByName('CODIGOSUBESTACION').AsString;
      if (qReporte.FieldByName('CODIGOCIRCUITO').AsString = '') then
        qReporte.FieldByName('CODIGOCIRCUITO').AsString :=
          qDatosElectricos.FieldByName('CODIGOCIRCUITO').AsString;
      if (qReporte.FieldByName('CODIGOTRAFODIS').AsString = '') then
        qReporte.FieldByName('CODIGOTRAFODIS').AsString :=
          qDatosElectricos.FieldByName('CODIGOTRAFODIS').AsString;
      if (qReporte.FieldByName('CODIGONODOBT').AsString = '') then
        qReporte.FieldByName('CODIGONODOBT').AsString :=
          qDatosElectricos.FieldByName('CODIGONODOBT').AsString;
    end;
  end;
  query.Close;
  query.Free;
  ValidarTipoCliente;
end;

procedure TfReporte.ActualizarEstadoRecibido;
begin
  if (qReporteCODIGOESTADOREPORTE.AsString = '0') then
  begin
    if (qReporteX.AsString <> '') and (qReporteY.AsString <> '') and
      (qReporteCODIGOTRAFODIS.AsString <> '') then
    begin
      qReporteCODIGOESTADOREPORTE.AsString := '1';
    end;
  end;
end;

function TfReporte.EstimarPrioridad(TipoReporte, TipoCliente: string): Integer;
begin
  // La prioridad mayor es mas alta
  Result := 0;
  if TipoReporte = 'E' then
    Result := 5
  else if TipoReporte = 'D' then
  begin
    if qReportePRIORIDADDANO.AsString <> '' then
      Result := (qReportePRIORIDADDANO.AsInteger)
    else
      Result := 4;
  end
  else if TipoReporte = 'I' then
    Result := 3
  else if TipoReporte = 'A' then
    Result := 2
  else if TipoReporte = 'C' then
    Result := 1
  else if TipoReporte = 'S' then
    Result := 1;
  if TipoCliente = 'V' then
    Result := 5
  else if TipoReporte = 'N' then
    Result := Result + 1;
  if Result > 5 then
    Result := 5;
end;

procedure TfReporte.qReporteTIPOCLIENTEChange(Sender: TField);
begin
  qReportePRIORIDADESTIMADA.AsInteger :=
    EstimarPrioridad(qReporteCODIGOTIPOREPORTE.AsString,
    qReporteTIPOCLIENTE.AsString);
  Application.ProcessMessages;
end;

procedure TfReporte.qReporteTELEFONORECIBEChange(Sender: TField);
begin
  if qTelefonoRecibeEXCLUSIVOVIP.AsString = 'S' then
    qReporteTIPOCLIENTE.AsString := 'V';
end;

function TfReporte.VerificarSeguimiento: Boolean;
var
  query: TQuery;
begin
  Result := False;
  query := TQuery.Create(self);
  query.DataBaseName := 'BaseDato';
  query.sql.Add('SELECT COUNT(*) FROM REPORTE_SEGUIMIENTO');
  query.sql.Add('WHERE CODIGOREPORTE=' + qReporteCODIGOREPORTE.AsString);
  query.sql.Add('AND CODIGOESTADOREPORTE=''' +
    qReporteCODIGOESTADOREPORTE.AsString + '''');
  query.Open;
  if (query.Fields[0].AsInteger > 0) then
    Result := true;
  query.Close;
  query.Free;
end;

procedure TfReporte.sbMailClick(Sender: TObject);
var
  asunto, Mensaje: string;
begin
  try
    if (qReporteTIPOCLIENTE.AsString = 'V') then
    begin
      if (qReporteCODIGOCLIENTESGD.AsString <> '') and
        (qReporteCODIGOCLIENTECOM.AsString <> '') then
      begin
        asunto := 'Recepcion reporte ' + qReporteCODIGOREPORTE.AsString + ':  '
          + qReporteCODIGOCLIENTECOM.AsString;
        Mensaje := 'Cuenta : ' + qReporteCODIGOCLIENTECOM.AsString +
          '.      Nombre Cliente : ' + qReporteNombreClienteSgd.AsString +
          Chr(13) + 'Informante : ' + qReporteNOMBREINFORMANTE.AsString +
          '.      Fecha y Hora de Recepción : ' + qReporteFECHAHORA.AsString +
          Chr(13) + Chr(13) + qReporteDESCRIPCION.AsString;
        try
          EnviarCorreo(PChar(Correo.servidor), PChar(Correo.login),
            PChar(Correo.psswd), PChar('Correo CDC VIP'), PChar(asunto),
            PChar(Mensaje), PChar(Correo.Destino), '', '');
          // showmessage('Se ha enviado correo a '+correo.destino);
          MensajeEstado := 'Se ha enviado correo a ' + Correo.Destino;
        except
          // showmessage('El correo no pudo ser enviado.');
          MensajeEstado := 'El correo no pudo ser enviado. ';
          beep;
        end;
      end
      else
        raise Exception.Create
          ('No se enviará un correo sin información del cliente VIP.  Por favor ingrese los datos del cliente')
    end
    else
      ShowMessage
        ('Solo se puede enviar correos para informar sobre reportes de Clientes VIP');

  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

function TfReporte.getDatosCorreo: TDatosCorreo;
var
  query: TQuery;
begin
  query := TQuery.Create(self);
  query.DataBaseName := 'BaseDato';
  query.sql.Add('SELECT VALOR FROM PARAMETRO WHERE CODIGOPARAMETRO=''SMT''');
  query.Open;
  Result.servidor := query.FieldByName('VALOR').AsString;

  query.sql.Clear;
  query.sql.Add('SELECT VALOR FROM PARAMETRO WHERE CODIGOPARAMETRO=''LMR''');
  query.Open;
  Result.login := query.FieldByName('VALOR').AsString;

  query.sql.Clear;
  query.sql.Add('SELECT VALOR FROM PARAMETRO WHERE CODIGOPARAMETRO=''PMR''');
  query.Open;
  Result.psswd := query.FieldByName('VALOR').AsString;

  query.sql.Clear;
  query.sql.Add('SELECT VALOR FROM PARAMETRO WHERE CODIGOPARAMETRO=''MRV''');
  query.Open;
  Result.Destino := query.FieldByName('VALOR').AsString;
  query.Close;
  query.Free;
end;

procedure TfReporte.qReporteCODIGOCLIENTESGDValidate(Sender: TField);
begin
  qReporteCalcFields(qReporte);
End;

procedure TfReporte.ValidarTipoCliente;
begin
  if qReporte.State in [dsEdit, dsInsert] then
  begin
    if (qReporteTIPOCLIENTE.AsString = 'V') then
    begin
      if (qReporteTipoClienteSgd.AsString <> 'V') then
      begin
        qReporteTIPOCLIENTE.AsString := 'N';
        MensajeEstado := 'Este Cliente no es VIP';
        beep;
        // showmessage('Este Cliente no es VIP');
      end
    end
    else
    begin
      if (qReporteTipoClienteSgd.AsString = 'V') then
      begin
        qReporteTIPOCLIENTE.AsString := 'V';
        MensajeEstado := 'Este Cliente es VIP';
        beep;
        // showmessage('Este Cliente es VIP');
      end;
    end;
  end;
end;

procedure TfReporte.qReporteCODIGOINFORMANTEValidate(Sender: TField);
var
  query: TQuery;
  s: string;
begin
  nbInformante.Visible := true;
  lbCIAInformante.Enabled := False;
  dbeCIAInformante.Enabled := False;
  dbeCIAInformante.Color := clBtnFace;
  dbeCIAInformante.PopupMenu := nil;
  lbFecha4.Enabled := False;
  dbeFechaLimite.Enabled := False;
  dbeFechaLimite.Color := clBtnFace;
  sbFechaLimite.Enabled := False;
  lbFuncionario.Enabled := False;
  dbeFuncionario.Enabled := False;
  dbeFuncionario.Color := clBtnFace;
  lbFechaSad.Enabled := False;
  dbeFechaSAD.Enabled := False;
  dbeFechaSAD.Color := clBtnFace;
  sbFechaSAD.Enabled := False;
  nbInformante.PageIndex := 0;
  if Sender.AsString = '01' then
  begin
    if qReporte.State in [dsInsert, dsEdit] then
    begin
      qReporteCIAINFORMANTE.AsString := '';
      qReporteNOMBREFUNCIONARIO.AsString := '';
      qReporteNUMEROCARTA.AsString := '';
    end;
  end;

  if Sender.AsString = '04' then
  begin
    nbInformante.PageIndex := 1;
    lbCIAInformante.Enabled := true;
    lbCIAInformante.Caption := 'CIA';
    dbeCIAInformante.Enabled := true;
    dbeCIAInformante.DataField := 'CIAINFORMANTE';
    dbeCIAInformante.Color := clWindow;
    dbeCIAInformante.PopupMenu := dMenuArbol2;
    lbFuncionario.Enabled := true;
    dbeFuncionario.Enabled := true;
    dbeFuncionario.Color := clWindow;
  end;

  if Sender.AsString = '02' then
  begin
    nbInformante.PageIndex := 2;

    lbFecha4.Enabled := true;
    dbeFechaLimite.Enabled := true;
    dbeFechaLimite.Color := clWindow;
    sbFechaLimite.Enabled := true;
    lbFechaSad.Enabled := true;
    dbeFechaSAD.Enabled := true;
    dbeFechaSAD.Color := clWindow;
    sbFechaSAD.Enabled := true;
  end
  else
  begin
    lbFecha1.Caption := 'Fecha y Hora de Dictado';
    lbFecha2.Caption := 'Fecha y Hora de Llegada';
    lbFecha3.Caption := 'Fecha y Hora de Atención';
  end;

  qTelefonoRecibe.Close;
  qTelefonoRecibe.Open;
end;

procedure TfReporte.qReporteTIPOCLIENTEValidate(Sender: TField);
begin
  if (Sender.AsString = 'V') then
  begin
    if (qReporteTipoClienteSgd.AsString <> 'V') then
      raise Exception.Create('Este Cliente no es VIP')
    else
      sbMail.Enabled := true
  end
  else
  begin
    if (qReporteTipoClienteSgd.AsString = 'V') then
      raise Exception.Create('Este Cliente es VIP')
    else
      sbMail.Enabled := False;
  end;
end;

procedure TfReporte.Timer1Timer(Sender: TObject);
begin
  stbMensaje.Panels[0].Text := MensajeEstado;
  MensajeEstado := '';
end;

procedure TfReporte.sbUbicarReporteClick(Sender: TObject);
begin
  MostrarMapa;
  if not(qReporteX.isnull or qReporteY.isnull) then
  begin
    BuscarCoordenada(qReporteX.AsFloat, qReporteY.AsFloat);
  end
  else
    MessageDlg('Este Reporte No Esta Ubicado En Cartografía', mtInformation,
      [mbOK], 0);
end;

procedure TfReporte.dbeNodoFisicoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    if (ActiveControl is TDBLookupComboBox) then
    begin
      if not(ActiveControl as TDBLookupComboBox).ListVisible then
        Perform(wm_NextDLGCTL, 0, 0);
    end
    else
    begin
      Perform(wm_NextDLGCTL, 0, 0);
      Key := #0;
    end
  end
  else
  begin
    if not((Key in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']) or
      (Key = #8)) then
      raise Exception.Create('El código Pintado debe ser numérico');
    Application.ProcessMessages;
  end;
end;

procedure TfReporte.dbeTelefonoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    if (ActiveControl is TDBLookupComboBox) then
    begin
      if not(ActiveControl as TDBLookupComboBox).ListVisible then
        Perform(wm_NextDLGCTL, 0, 0);
    end
    else
    begin
      Perform(wm_NextDLGCTL, 0, 0);
      Key := #0;
    end
  end
  else
  begin
    if not((Key in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']) or
      (Key = #8)) then
      raise Exception.Create('El teléfono debe ser numérico');
    Application.ProcessMessages;
  end;
end;

procedure TfReporte.dbeComercialKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    if (ActiveControl is TDBLookupComboBox) then
    begin
      if not(ActiveControl as TDBLookupComboBox).ListVisible then
        Perform(wm_NextDLGCTL, 0, 0);
    end
    else
    begin
      Perform(wm_NextDLGCTL, 0, 0);
      Key := #0;
    end
  end
  else
  begin
    if not((Key in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']) or
      (Key = #8)) then
      raise Exception.Create('El número de cuenta debe ser numérico');
    Application.ProcessMessages;
  end;
end;

procedure TfReporte.DBEdit3KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    if (ActiveControl is TDBLookupComboBox) then
    begin
      if not(ActiveControl as TDBLookupComboBox).ListVisible then
        Perform(wm_NextDLGCTL, 0, 0);
    end
    else
    begin
      Perform(wm_NextDLGCTL, 0, 0);
      Key := #0;
    end
  end
  else
  begin
    if not((Key in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']) or
      (Key = #8)) then
      raise Exception.Create('El código administrativo debe ser numérico');
    Application.ProcessMessages;
  end;
end;

procedure TfReporte.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    if (ActiveControl is TDBLookupComboBox) then
    begin
      if not(ActiveControl as TDBLookupComboBox).ListVisible then
        Perform(wm_NextDLGCTL, 0, 0);
    end
    else
    begin
      Perform(wm_NextDLGCTL, 0, 0);
      Key := #0;
    end
  end
  else
  begin
    if not((Key in ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0']) or
      (Key = #8)) then
      raise Exception.Create('El código tipo daño debe ser numérico');
    Application.ProcessMessages;
  end;
end;

procedure TfReporte.qReporteCODIGOCLASEREPORTEChange(Sender: TField);
begin
  qTipoDano.Close;
  qTipoDano.Open;
end;

procedure TfReporte.bbtnAuditoriaClick(Sender: TObject);
begin
  ConsultarAditoria('REPORTE', qReporteCODIGOREPORTE.AsString);
end;

procedure TfReporte.dblcbTipoDanoKeyPress(Sender: TObject; var Key: Char);
begin
  dblcbTipoDano.DropDown;
end;

procedure TfReporte.qReporteCODIGOADMINISTRATIVOChange(Sender: TField);
var
  i: Integer;
begin
  if (Sender.AsString <> '') then
  begin
    qReporteCODIGOGRUPOTRABAJO.Clear;
    qCIA.Close;
    qCIA.ParamByName('CODIGOADMINISTRATIVO').AsString := Sender.AsString;
    qCIA.sql.Insert(3, 'AND ESTADO=''A''');
    qCIA.Open;
    if qCIA.RecordCount > 0 then
    begin
      LbCia1.Caption := qCIA.Fields[0].AsString;
      lbCia2.Caption := qCIA.Fields[0].AsString;
    end
    else
      raise Exception.Create('Este Código Administrativo No Existe.');
    i := qCIA.RecordCount;
    qCIA.sql.delete(3);
    if (i = 0) then
      raise Exception.Create
        ('Este Código Administrativo pertenece a un Área Inactiva.');
  end;
end;

procedure TfReporte.qReporteCIAINFORMANTEChange(Sender: TField);
var
  i: Integer;
begin
  if (Sender.AsString <> '') then
  begin
    qCIA.Close;
    qCIA.ParamByName('CODIGOADMINISTRATIVO').AsString := Sender.AsString;
    qCIA.sql.Insert(3, 'AND ESTADO=''A''');
    qCIA.Open;
    i := qCIA.RecordCount;
    qCIA.sql.delete(3);
    if (i = 0) then
      raise Exception.Create
        ('Este Código Administrativo pertenece a un Área Inactiva.');
  end;
end;

procedure TfReporte.qReporteCODIGOINFORMANTEChange(Sender: TField);
var
  query: TQuery;
  i: Integer;
  s: string;
begin
  query := TQuery.Create(self);
  query.DataBaseName := 'BaseDato';
  query.sql.Add('select count(*) from informante');
  query.sql.Add('where activo=''S'' OR CODIGOINFORMANTE=''09'' ');
  query.sql.Add('and codigoinformante=''' + Sender.AsString + '''');
  query.Open;
  i := query.Fields[0].AsInteger;
  query.Free;
  s := qReporteNombreTipoInformante.AsString;
  if i = 0 then
    raise Exception.Create('El tipo de informante ' + s +
      ' no está activo, por favor verifique.');

end;

procedure TfReporte.qReporteCODIGOGRUPOTRABAJOValidate(Sender: TField);
VAR
  GrupoActivo: String;
  qDatos: TQuery;
begin
  If qReporteCODIGOGRUPOTRABAJO.AsString <> '' then
  Begin
    if qReporteCODIGOADMINISTRATIVO.AsString = '' then
      raise Exception.Create('Debe seleccionar el valor del campo CIA.');
    qDatos := TQuery.Create(self);
    qDatos.DataBaseName := 'BaseDato';
    qDatos.sql.Text :=
      'SELECT ACTIVO FROM GRUPOTRABAJO WHERE CODIGOADMINISTRATIVO = ' +
      qReporteCODIGOADMINISTRATIVO.AsString + ' and codigogrupotrabajo = ' +
      qReporteCODIGOGRUPOTRABAJO.AsString;
    qDatos.Open;
    GrupoActivo := qDatos.FieldByName('activo').AsString;
    qDatos.Close;
    qDatos.Free;
    If GrupoActivo <> 'S' then
      raise Exception.Create('Grupo de trabajo inexistente o inactivo.');
  end;
end;

function TfReporte.ReportePadre(sql: String): String;
var
  qry: TQuery;
begin
  Result := '';
  if sql = '' then
    exit;
  qry := TQuery.Create(nil);
  qry.DataBaseName := 'BaseDato';
  qry.Close;
  qry.sql.Clear;
  qry.sql.Text := 'SELECT CODIGOREPORTE, FECHAHORA FROM REPORTE ' +
    ' WHERE CODIGOREPORTE IN ( SELECT MIN("Reporte") FROM (' + sql + ') ) ';
  qry.Open;
  if not qry.IsEmpty then
  begin
    Result := 'Reporte: ' + qry.Fields[0].AsString + ', Fecha: ' + qry.Fields
      [1].AsString;
  end;
  qry.Close;
  qry.Free;
end;

procedure TfReporte.SpeedButton6Click(Sender: TObject);
var
  listacausa: Tlista_soecausaevento;
  tecla: Char;
begin
  listacausa := Tlista_soecausaevento.crear(self);
  if listacausa.ShowModal = mrOk then
  begin
    tcodigocausa.Text := listacausa.Qlistacausaevento.Fields[0].AsString;
    tCausaSub.Text := listacausa.Qlistacausaevento.Fields[1].AsString;
  end;
  listacausa.Free;
end;

procedure TfReporte.fTipoLaborReporteClick(Sender: TObject);
var
  qValidacion: TQuery;
  FechaValidacion: String;
begin
  if ((UpperCase(fTipoLaborReporte.Text) = 'INTERNO') or
    (UpperCase(fTipoLaborReporte.Text) = '')) then
    gbInfoEvento.Visible := False
  else
  begin
    FechaValidacion := SetFechaCrearEventoReporte();
    if FechaValidacion <> '' then
    begin
      if qReporteFECHAHORA.AsDateTime >= strtodate(FechaValidacion) then
      begin
        gbInfoEvento.Visible := true;
        if fTipoLaborReporte.Text = 'RAMAL' then
        begin
          sbubicarencartografia.Enabled := true;
          InterruptorEvento := EncontrarInterruptorEvento(tlRamal)
        end
        else if fTipoLaborReporte.Text = 'TRANSFORMADOR' then
        begin
          sbubicarencartografia.Enabled := False;
          qValidacion := TQuery.Create(nil);
          qValidacion.DataBaseName := 'BaseDato';
          qValidacion.sql.Add
            ('select count(codigotrafodis) as cantidad from reporte ');
          qValidacion.sql.Add('where ((reportepadre=' +
            qReporteCODIGOREPORTE.AsString + ') or (codigoreporte=' +
            qReporteCODIGOREPORTE.AsString + '))');
          qValidacion.sql.Add('group by codigotrafodis');
          qValidacion.Open;
          if qValidacion.RecordCount = 1 then
            InterruptorEvento := EncontrarInterruptorEvento(tlTrafo)
          else if qValidacion.RecordCount > 1 then
          begin
            Application.MessageBox
              ('Los trafos del reporte padre y los hijos no son iguales,' + #13
              + 'no puede escoger tipo labor atención TRANSFORMADOR.',
              PChar('Información'), mb_ok + MB_ICONINFORMATION);
            qReporteCODIGOTIPOLABORREPORTE.AsString := '';
            fTipoLaborReporte.KeyValue := -1;
          end;
          qValidacion.Close;
          qValidacion.Free;
        end;
        if cambiarElementoOperacion then
          eCodElementoOperacion.Text := InterruptorEvento;
      end
      else
      begin
        Application.MessageBox(PChar('Esta opción no se puede seleccionar' +
          Chr(13) + 'por que la fecha del registro del reporte es inferior a' +
          Chr(13) + QuotedStr(FechaValidacion + ' - DD/MM/AAAA')),
          PChar('Información'), mb_ok + MB_ICONINFORMATION);
        qReporteCODIGOTIPOLABORREPORTE.AsString := '';
        fTipoLaborReporte.KeyValue := -1;
      end;
    end
    else
      Application.MessageBox(PChar('No existe parametro de validación ' +
        Chr(13) + 'para la fecha minima del reporte en la tabla parametro'),
        PChar('Información'), mb_ok + MB_ICONINFORMATION);
  end;
end;

procedure TfReporte.qReporteAfterOpen(DataSet: TDataSet);
var
  qCausaEvento: TQuery;
begin
  if qReporte.FieldByName('codigoadministrativo').AsString <> '' then
  Begin
    qCIA.Close;
    qCIA.Params[0].AsString := qReporte.FieldByName
      ('codigoadministrativo').AsString;
    qCIA.Open;
    if qCIA.RecordCount > 0 then
    begin
      LbCia1.Caption := qCIA.Fields[0].AsString;
      lbCia2.Caption := qCIA.Fields[0].AsString;
    end;
  End;

  if (qReporte.FieldByName('CODIGOREPORTE').AsString <> '') then
  begin
    qCausaEvento := TQuery.Create(nil);
    qCausaEvento.DataBaseName := 'BaseDato';
    qCausaEvento.sql.Add
      ('select c.codigocausaevento,C.DESCRIPCIONCAUSAEVENTO,i.pintadoapoyo,i.codigoelemento,i.codigonodomt,SD.CODIGOELEMENTO as elementooperacion,sd.codigotipoelemento as codigoelementooperacion  ');
    qCausaEvento.sql.Add
      ('from soe_interrupciondis i,soe_causaevento c,soe_distribucion sd ');
    qCausaEvento.sql.Add
      ('where I.CODIGOCAUSAEVENTO=C.CODIGOCAUSAEVENTO and i.codigoevento=sd.codigoevento');
    qCausaEvento.sql.Add('and I.codigoevento=' +
      IntToSTr(evento_apertura(qReporteCODIGOEVENTORESTABLECIMIENTO.
      AsInteger)));
    qCausaEvento.Open;
    if not qCausaEvento.Eof then
    begin
      tcodigocausa.Text := qCausaEvento.FieldByName
        ('codigocausaevento').AsString;
      CodigoCausaInicial := qCausaEvento.FieldByName
        ('codigocausaevento').AsString;
      tCausaSub.Text := qCausaEvento.FieldByName
        ('DESCRIPCIONCAUSAEVENTO').AsString;
      pintadoapoyoevento.Text := qCausaEvento.FieldByName
        ('pintadoapoyo').AsString;
      eCodigoFalla.Text := qCausaEvento.FieldByName('codigoelemento').AsString;
      eNodoFalla.Text := qCausaEvento.FieldByName('codigonodomt').AsString;
      eCodElementoOperacion.Text := qCausaEvento.FieldByName
        ('elementooperacion').AsString;
      cambiarElementoOperacion := False;
    end;
    qCausaEvento.Close;
    qCausaEvento.Free;
  end;
  if ((UpperCase(fTipoLaborReporte.Text) = 'INTERNO') or
    (UpperCase(fTipoLaborReporte.Text) = '')) then
    gbInfoEvento.Visible := False
  else
  begin
    gbInfoEvento.Visible := true;
    { if eCodElementoOperacion.Text <> '' then
      cambiarElementoOperacion:=false; }
    fTipoLaborReporteClick(nil);
    cambiarElementoOperacion := true;
  end;

  if (qReporte.FieldByName('FECHAHORAATENCION').AsString <> '') then
  begin
    fTipoLaborReporte.Visible := true;
    lTipoLabor.Visible := true;
  end;
  if ((qReporteCODIGOEVENTO.AsString <> '') and
    (qReporteCODIGOEVENTORESTABLECIMIENTO.AsString <> '')) then
  begin
    if ((strtoint(VerificarCertificacionEvento(qReporteCODIGOEVENTO.AsString)) >
      0) or (strtoint(VerificarCertificacionEvento
      (qReporteCODIGOEVENTORESTABLECIMIENTO.AsString)) > 0)) then
    begin
      DeshabilitarControles(self, False);
      DBMemo1.Enabled := true;
      SpeedButton6.Enabled := true;
      tcodigocausa.Enabled := true;
      bbAceptar.Enabled := true;
      bbCancelar.Enabled := true;
      CertificadoLAC := true;
    end;
  end;

end;

procedure TfReporte.lanzavistaeventoClick(Sender: TObject);
var
  codigoapoyoevento: Integer;
begin
  codigoapoyoevento := existenodo(pintadoapoyoevento.Text);
  if codigoapoyoevento = -1 then
  begin
    Application.ProcessMessages;
    Application.NormalizeTopMosts;
    Application.MessageBox('Este nodo físico no existe', 'Error', mb_iconerror);
    Application.RestoreTopMosts;
    pintadoapoyoevento.Setfocus;
    exit;
  end
  else
  begin
    MostrarVistaLateral(codigoapoyoevento);
  end;
end;

function TfReporte.existenodo(pintadoapoyo: string): Integer;
// esta funcion valida si el pintado del apoyo corresponde a un apoyo existente
var
  qry: TQuery;
  sql: string;
begin
  qry := TQuery.Create(self);
  qry.DataBaseName := 'Basedato';
  sql := 'select codigoapoyo from apoyo where pintadoapoyo=''' +
    pintadoapoyo + '''';
  qry.sql.Clear;
  qry.sql.Add(sql);
  qry.Open;
  if not qry.IsEmpty then
    Result := qry.Fields[0].Value
  else
    Result := -1;
  qry.Free;
end;

procedure TfReporte.MostrarVistaLateral(CodigoApoyo: Extended);
{
  Deacuerdo al apoyo donde se encuentra el elemento de evento o de operación, se
  buscan los apoyos circundantes, para invocar la vista lateral a traves de unalista de
  apoyos.
}
var
  qApoyosVistaLateral: TQuery;
  ListaTemp: TStringList;
  Nivel: String;
begin
  qApoyosVistaLateral := TQuery.Create(nil);
  qApoyosVistaLateral.DataBaseName := 'BaseDato';

  qApoyosVistaLateral.sql.Add(' select a.codigoapoyo,a.x,a.y ');
  qApoyosVistaLateral.sql.Add(' from apoyo a ');
  qApoyosVistaLateral.sql.Add(' where codigoapoyo=' + FloatToStr(CodigoApoyo));
  qApoyosVistaLateral.sql.Add('  UNION');
  qApoyosVistaLateral.sql.Add(' select a.codigoapoyo,a.x,a.y ');
  qApoyosVistaLateral.sql.Add(' from tramomt t, apoyo a ');
  qApoyosVistaLateral.sql.Add(' where t.codigoapoyo2=a.codigoapoyo ');
  qApoyosVistaLateral.sql.Add(' and codigoapoyo1=' + FloatToStr(CodigoApoyo));
  qApoyosVistaLateral.sql.Add('  UNION');
  qApoyosVistaLateral.sql.Add(' select a.codigoapoyo,a.x,a.y ');
  qApoyosVistaLateral.sql.Add(' from tramomt t, apoyo a ');
  qApoyosVistaLateral.sql.Add(' where t.codigoapoyo1=a.codigoapoyo ');
  qApoyosVistaLateral.sql.Add(' and codigoapoyo2=' + FloatToStr(CodigoApoyo));
  qApoyosVistaLateral.sql.Add('  UNION');
  qApoyosVistaLateral.sql.Add(' select a.codigoapoyo,a.x,a.y ');
  qApoyosVistaLateral.sql.Add(' from tramobt t, apoyo a ');
  qApoyosVistaLateral.sql.Add(' where t.codigoapoyo2=a.codigoapoyo ');
  qApoyosVistaLateral.sql.Add(' and codigoapoyo1=' + FloatToStr(CodigoApoyo));
  qApoyosVistaLateral.sql.Add('  UNION');
  qApoyosVistaLateral.sql.Add(' select a.codigoapoyo,a.x,a.y ');
  qApoyosVistaLateral.sql.Add(' from tramobt t, apoyo a ');
  qApoyosVistaLateral.sql.Add(' where t.codigoapoyo1=a.codigoapoyo ');
  qApoyosVistaLateral.sql.Add(' and codigoapoyo2=' + FloatToStr(CodigoApoyo));
  qApoyosVistaLateral.Open;
  ListaTemp := TStringList.Create;
  while not qApoyosVistaLateral.Eof do
  begin
    ListaTemp.Add(qApoyosVistaLateral.FieldByName('CODIGOAPOYO').AsString + ','
      + qApoyosVistaLateral.FieldByName('X').AsString + ',' +
      qApoyosVistaLateral.FieldByName('Y').AsString);
    qApoyosVistaLateral.Next;
  end;

  qApoyosVistaLateral.Close;
  qApoyosVistaLateral.Free;
  MostrarVistaLateralReporte(ListaTemp);
  ListaTemp.Free;
end;

procedure TfReporte.dbeFechaAtencionChange(Sender: TObject);
begin
  if (qReporte.FieldByName('FECHAHORAATENCION').AsString <> '') then
  begin
    fTipoLaborReporte.Visible := true;
    lTipoLabor.Visible := true;
  end
  else
  begin
    fTipoLaborReporte.Visible := False;
    lTipoLabor.Visible := False;
  end;
end;

Function TfReporte.EncontrarInterruptorEvento(TipoLabor: TTipoLabor): String;
var
  qReportes: TQuery;
  codInterruptor: String;
begin
  Result := '';
  if TipoLabor = tlTrafo then
    Result := qReporte.FieldByName('CodigoInterruptorDis').AsString
  else if TipoLabor = tlRamal then
  begin
    qReportes := TQuery.Create(nil);
    qReportes.DataBaseName := 'BaseDato';
    qReportes.sql.Add('select r.codigoreporte from reporte r');
    qReportes.sql.Add('where r.reportepadre=' + qReporteCODIGOREPORTE.AsString);
    qReportes.Open;
    if qReportes.Eof then
    begin
      Result := HallarInterruptorRamalUnico
        (qReporte.FieldByName('CODIGOCIRCUITO').AsString,
        qReporte.FieldByName('CODIGOTRAFODIS').AsString);
    end
    else
    begin
      codInterruptor := HallarInterruptorRamalVarios
        (qReporteCODIGOREPORTE.AsString);
      if codInterruptor = '' then
        Result := HallarInterruptorRamalUnico
          (qReporte.FieldByName('CODIGOCIRCUITO').AsString,
          qReporte.FieldByName('CODIGOTRAFODIS').AsString)
      else
        Result := codInterruptor;
    end;
  end;
end;

function TfReporte.EncontrarPintadoApoyoEvento(CodigoInterruptor
  : String): String;
var
  qPintado: TQuery;
begin
  Result := '';
  qPintado := TQuery.Create(nil);
  qPintado.DataBaseName := 'BaseDato';
  qPintado.sql.Add
    ('Select pintadoapoyo from apoyo a,interruptordis i where a.codigoapoyo=i.codigoapoyo1');
  qPintado.sql.Add('and i.codigointerruptordis=' + CodigoInterruptor);
  qPintado.Open;
  if not qPintado.Eof then
    Result := qPintado.FieldByName('pintadoapoyo').AsString;
  qPintado.Close;
  qPintado.Free;
end;

function TfReporte.ExisteEventoReporte(CodigoReporte: String): Boolean;
var
  qSoeReporte, qInsert: TQuery;
begin
  Result := False;
  qSoeReporte := TQuery.Create(nil);
  qSoeReporte.DataBaseName := 'BaseDato';
  qSoeReporte.sql.Add('Select * from soe_reporte');
  qSoeReporte.sql.Add('where codigoreporte=' + CodigoReporte);
  qSoeReporte.Open;
  if qSoeReporte.Eof then
  begin
    if qSoeReporte.FieldByName('CODIGOEVENTO').AsInteger > 0 then
      Result := true;
  end;
  qSoeReporte.Close;
  qSoeReporte.Free;
end;

procedure TfReporte.eCodElementoOperacionKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', '.', #8]) then
  begin
    Key := #0;
  end
end;

function TfReporte.evento_apertura(codigocierre: Integer): Integer;
var
  sql: string;
  qry: TQuery;
begin
  qry := TQuery.Create(self);
  qry.DataBaseName := 'basedato';
  qry.sql.Clear;
  sql := 'select codigoevento from soe_desdistribucion where codigoeventorestablecimiento='
    + IntToSTr(codigocierre);
  qry.sql.Add(sql);
  qry.Open;
  Result := qry.Fields[0].AsInteger;
  qry.Free;
end;

procedure TfReporte.tcodigocausaExit(Sender: TObject);
var
  Qlistacausaevento: TQuery;
begin
  if tcodigocausa.Text <> '' then
  begin
    Qlistacausaevento := TQuery.Create(self);
    Qlistacausaevento.DataBaseName := 'basedato';
    Qlistacausaevento.sql.Clear;
    Qlistacausaevento.sql.Add
      ('select codigocausaevento,descripcioncausaevento from soe_causaevento ' +
      'where activa=1 and codigocausaevento=' + tcodigocausa.Text);
    Qlistacausaevento.Open;
    if not Qlistacausaevento.Eof then
      tCausaSub.Text := Qlistacausaevento.FieldByName
        ('DESCRIPCIONCAUSAEVENTO').AsString
    else
    begin
      tcodigocausa.Text := '';
      tCausaSub.Text := '';
      Application.MessageBox('El código de la causa no existe.',
        PChar('Información'), mb_ok + MB_ICONINFORMATION);
    end;
    Qlistacausaevento.Close;
    Qlistacausaevento.Free;
  end;
end;

procedure TfReporte.tcodigocausaKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', '.', #8]) then
  begin
    Key := #0;
  end
end;

procedure TfReporte.pintadoapoyoeventoKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', '.', #8]) then
  begin
    Key := #0;
  end
end;

function TfReporte.EncontrarInterruptorComun: String;
var
  j, i, z, Posicion: Integer;
  Interruptorcomun: String;
  Coincidencias: Integer;
begin
  Result := '';
  for z := 0 to ArraySL[0].Count - 1 do
  // De 0 a n posiciones del SL 1      RECORREL EL PRIMER STRINGLIST DEL ARRAY
  begin
    Coincidencias := 0;
    for i := 1 to Length(ArraySL) - 1 do // Se recorre del array 2 hasta array N
    begin
      Posicion := ArraySL[i].IndexOf(ArraySL[0].Strings[z]);
      if Posicion > -1 then
      begin
        Interruptorcomun := ArraySL[0].Strings[z];
        inc(Coincidencias);
      end
      else
      begin
        Interruptorcomun := '';
        Break;
      end;
    end;
    if Coincidencias = Length(ArraySL) - 1 then
      Break;
  end;
  Result := Interruptorcomun;
end;

function TfReporte.HallarInterruptorRamalUnico(Codigocircuito,
  Codigotrafodis: String): String;
var
  qDatos, qInterruptor: TQuery;
begin
  Result := '';
  qDatos := TQuery.Create(Application);
  qDatos.DataBaseName := 'BaseDato';
  qDatos.sql.Add
    ('SELECT SUBSTR(PAPA.NOMBRE,5) FROM TREENODES PAPA, TREENODES NODO');
  qDatos.sql.Add('WHERE');
  qDatos.sql.Add('(PAPA.IZQUIERDA <= NODO.DERECHA) AND');
  qDatos.sql.Add('(PAPA.DERECHA >= NODO.IZQUIERDA) AND');
  qDatos.sql.Add('(NODO.CODIGOCIRCUITO = ''' + qReporte.FieldByName
    ('CODIGOCIRCUITO').AsString + ''') AND');
  qDatos.sql.Add('(NODO.TIPO = ''TF'') AND');
  qDatos.sql.Add('(PAPA.CODIGOCIRCUITO = ''' + qReporte.FieldByName
    ('CODIGOCIRCUITO').AsString + ''') AND');
  qDatos.sql.Add('(PAPA.TIPO = ''TF'') AND');
  qDatos.sql.Add('(NODO.NOMBRE = ''TF: ' + qReporte.FieldByName
    ('CODIGOTRAFODIS').AsString + ''') AND');
  qDatos.sql.Add('(PAPA.NOMBRE LIKE ''SW%'') AND');
  qDatos.sql.Add('(PAPA.NIVEL <= NODO.NIVEL)');
  qDatos.sql.Add('ORDER BY PAPA.IZQUIERDA DESC');
  qDatos.Open;
  qDatos.first;
  while not qDatos.Eof do
  begin
    qInterruptor := TQuery.Create(Application);
    qInterruptor.DataBaseName := 'BaseDato';
    qInterruptor.sql.Add
      ('SELECT CODIGOUSOINTERRUPTOR FROM INTERRUPTORDIS WHERE');
    qInterruptor.sql.Add('CODIGOINTERRUPTORDIS = ' + qDatos.Fields[0].AsString);
    qInterruptor.Open;
    if (qInterruptor.Fields[0].AsString = 'D') then
    begin
      Result := qDatos.Fields[0].AsString;
      qInterruptor.Free;
      Break;
    end;
    qInterruptor.Free;
    qDatos.Next;
  end;
end;

function TfReporte.HallarInterruptorRamalVarios(CodigoReporte: String): String;
var
  qReportes, qTrafo: TQuery;
  ReportePadre: String;
begin
  Result := '';
  ReportePadre := CodigoReporte;
  qReportes := TQuery.Create(nil);
  qReportes.DataBaseName := 'BaseDato';
  qReportes.sql.Add
    ('select r.codigoreporte,r.codigointerruptordis,r.codigoclientesgd,r.codigotrafodis');
  qReportes.sql.Add('from reporte r');
  qReportes.sql.Add('where (r.reportepadre=' + ReportePadre +
    ') or (r.codigoreporte=' + ReportePadre + ')');
  qReportes.Open;

  qTrafo := TQuery.Create(nil);
  qTrafo.DataBaseName := 'BaseDato';
  SetLength(ArraySL, qReportes.RecordCount);
  ContadorArray := -1;
  while not qReportes.Eof do
  begin
    inc(ContadorArray);
    ArraySL[ContadorArray] := TStringList.Create;
    qTrafo.Close;
    qTrafo.sql.Clear;
    qTrafo.sql.Add('select codigoapoyo1,codigonodomt from trafodis');
    qTrafo.sql.Add('where codigotrafodis=' + qReportes.FieldByName
      ('CODIGOTRAFODIS').AsString);
    qTrafo.Open;
    if not qTrafo.Eof then
    begin
      qNodo.Close;
      qNodo.ParamByName('Codapoyo').AsString :=
        qTrafo.FieldByName('codigoapoyo1').AsString;
      qNodo.Open;
      while not qNodo.Eof do
      begin
        qHallarInterruptor.Close;
        qHallarInterruptor.ParamByName('Codapoyo').AsString :=
          qTrafo.FieldByName('codigoapoyo1').AsString;
        qHallarInterruptor.ParamByName('Codnodo').AsString :=
          qNodo.FieldByName('nodomt').AsString;
        qHallarInterruptor.Open;
        while not qHallarInterruptor.Eof do
        begin
          ArraySL[ContadorArray]
            .Add(qHallarInterruptor.FieldByName('codigointerruptordis')
            .AsString);
          qHallarInterruptor.Next;
        end;
        if qHallarInterruptor.RecordCount > 0 then
          Break;
        qNodo.Next;
      end;
    end;
    qReportes.Next;
  end;

  Result := EncontrarInterruptorComun();
  qTrafo.Close;
  qTrafo.Free;

  qReportes.Close;
  qReportes.Free;
end;

function TfReporte.ValidarReporteAbiertoCliente(CodCuenta: String;
  var sReportesAbiertos: String): Boolean;
var
  qValidar: TQuery;
  slReportesAbiertos: TStringList;
begin

  sReportesAbiertos := '';
  Result := False;
  slReportesAbiertos := TStringList.Create;
  slReportesAbiertos.Sorted := true;
  qValidar := TQuery.Create(nil);
  qValidar.DataBaseName := 'BaseDato';
  qValidar.sql.Add('select codigoreporte from reporte where codigoclientecom=' +
    CodCuenta);
  qValidar.sql.Add('and codigoestadoreporte not in (4,5)');
  if qReporteCODIGOREPORTE.AsString <> '' then
    qValidar.sql.Add('and codigoreporte <> ' + qReporteCODIGOREPORTE.AsString);
  qValidar.Open;

  if (qValidar.RecordCount > 0) then
  begin
    while not(qValidar.Eof) do
    begin
      slReportesAbiertos.Add(qValidar.Fields[0].AsString);
      qValidar.Next;
    end;
    sReportesAbiertos := slReportesAbiertos.CommaText;
    Result := true;
  end;

  qValidar.Close;
  qValidar.Free;
  slReportesAbiertos.Free;

end;

procedure TfReporte.LimpiarDatosCliente;
begin
  qReporte.FieldByName('NOMBREINFORMANTE').AsString := '';
  qReporte.FieldByName('TELEFONO').AsString := '';
  qReporte.FieldByName('DIRECCIONDANO').AsString := '';
  qReporte.FieldByName('CODIGOAPOYO').AsString := '';
  qReporte.FieldByName('PINTADOAPOYO').AsString := '';

  qReporte.FieldByName('CODIGOTIPOVIA').AsString := '';
  qReporte.FieldByName('CODIGONOMBREVIA').AsString := '';
  qReporte.FieldByName('MODIFICADORVIA').AsString := '';
  qReporte.FieldByName('DUPLICADOR').AsString := '';
  qReporte.FieldByName('MODIFICADORDUPLICADOR').AsString := '';
  qReporte.FieldByName('NUMEROPUERTA').AsString := '';
  qReporte.FieldByName('CODIGOTIPOPREDIO').AsString := '';
  qReporte.FieldByName('DESCRIPCIONTIPOPREDIO').AsString := '';

  qReporte.FieldByName('CODIGOTIPOVERTICAL').AsString := '';
  qReporte.FieldByName('VERTICAL').AsString := '';
  qReporte.FieldByName('CODIGOTIPOINTERIOR').AsString := '';
  qReporte.FieldByName('PISO').AsString := '';
  qReporte.FieldByName('INTERIOR').AsString := '';
  qReporte.FieldByName('CODIGOCONTADOR').AsString := '';
  qReporte.FieldByName('CODIGOCLIENTESGD').AsString := '';
  qReporte.FieldByName('CODIGOCLIENTECOM').AsString := '';
  qReporte.FieldByName('CIGDANO').AsString := '1';
end;

procedure TfReporte.ValidarContenidoNumerosLetras(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  i, a: Integer;
  aux, aux2, cad: string;
begin
  cad := '0123456789ABCDEFGHIJKLMNÑOPQRSTUVXYZ. -abcdefghijklmnñopqrstuvwxyzáéíóú_';
  // Solo se admiten estos caracteres
  aux2 := '';
  with (Sender as TDBMemo) do
  begin
    if not(Key in [8, 37, 38, 39, 40]) then
    begin
      aux := Text;
      a := -1;
      for i := 1 to Length(aux) do
        if Pos(aux[i], cad) > 0 then
          aux2 := aux2 + aux[i]
        else
          a := i;
      Text := aux2;
      if a <> -1 then
        SelStart := a - 1;
    end;
  end;
end;

procedure TfReporte.sbubicarencartografiaClick(Sender: TObject);
var
  qApoyo: TQuery;
begin
  if eCodElementoOperacion.Text <> '' then
  begin
    qApoyo := TQuery.Create(nil);
    qApoyo.DataBaseName := 'BaseDato';
    qApoyo.sql.Add
      ('select codigoapoyo1 from interruptordis where codigointerruptordis=' +
      eCodElementoOperacion.Text);
    qApoyo.Open;
    if qApoyo.FieldByName('CodigoApoyo1').AsString <> '' then
      BuscarApoyo(qApoyo.FieldByName('CodigoApoyo1').AsString, true, true);
    qApoyo.Close;
    qApoyo.Free;
    BuscarCoordenada(qReporteXATENCION.AsFloat, qReporteYATENCION.AsFloat);

    SpeedButton2Click(nil);
  end;
end;

procedure TfReporte.eCodElementoOperacionChange(Sender: TObject);
begin
  CambioElementoEvento := true;
end;

procedure TfReporte.qReporteCODIGOCIRCUITOChange(Sender: TField);
begin
  CambioElementoEvento := true;
end;

procedure TfReporte.qReporteFECHAHORAATENCIONChange(Sender: TField);
begin
  CambioElementoEvento := true
end;

procedure TfReporte.qReporteFECHAHORAChange(Sender: TField);
begin
  CambioElementoEvento := true;
end;

procedure TfReporte.qReporteOBSERVACIONChange(Sender: TField);
begin
  CambioElementoEvento := true;
end;

function TfReporte.QuitarEventoReporte(CodigoReporte: String): Boolean;
var
  qUpdate: TQuery;
begin
  Result := False;
  qUpdate := TQuery.Create(nil);
  qUpdate.DataBaseName := 'BaseDato';
  qUpdate.sql.Add
    ('update reporte set codigoevento=null,codigoeventorestablecimiento=null where codigoreporte='
    + CodigoReporte);
  qUpdate.ExecSQL;
  qUpdate.Close;
  qUpdate.Free;
  Result := true;
end;

procedure TfReporte.SpeedButton9Click(Sender: TObject);
begin
  if eCodigoFalla.Text <> '' then
  begin
    MostrarMapa;
    BuscarApoyo(eCodigoFalla.Text, true, true);
    BuscarCoordenada(qReporteXLLEGADA.AsFloat, qReporteYLLEGADA.AsFloat);
    SpeedButton2Click(nil);
  end;
end;

function TfReporte.DescripcionDireccion(ds: TDataSet;
  Control: TControl): String;
var
  p: TPoint;
begin
  fDescripcionDireccion := TfDescripcionDireccion.Create(Application);
  fDescripcionDireccion.CargarDataSet(ds);
  if Control <> nil then
  begin
    p := Control.ClientToScreen(Point(0, 0));
    fDescripcionDireccion.Left := p.x;
    fDescripcionDireccion.top := p.y;
    if fDescripcionDireccion.BoundsRect.Right > Screen.Width then
      fDescripcionDireccion.Left := p.x - fDescripcionDireccion.BoundsRect.Right
        + Screen.Width;
  end;
  fDescripcionDireccion.ShowModal;
  Result := fDescripcionDireccion.dsExterno.DataSet.FieldByName
    ('DescripcionTipoPredio').AsString;
  fDescripcionDireccion.Free;
end;

procedure TfReporte.MostrarListaReportes;
var
  i: Integer;
begin
  for i := Application.MainForm.MDIChildCount - 1 downto 0 do
    if (Application.MainForm.MDIChildren[i] is TfListaReportes) then
    begin
      Application.MainForm.MDIChildren[i].BringToFront;
      Break;
    end;
end;

function TfReporte.GenerarAsignacionMovil(pCodigoODT,
  pConsecutivo: string): Boolean;
var
  query: TQuery;
  Ruta, Carpeta, RutaCarpetaDestinoSFTP, RutaShapes: string;
  servidor, usuario, ClaveUsuario, Esquema: string;
  CodAsignacionExportacion, sCIA, sNomSDF: string;
  lista, ListaPlanchas: TStringList;
  bExpSDF: Boolean;
  sApoyosEnRevision, sOdts: string;
begin
  try
    Result := False;
    query := TQuery.Create(nil);
    query.DataBaseName := 'BaseDato';
    query.sql.Clear;
    query.sql.Add('DELETE FROM EMG_INDICEELEMENTO1');
    query.ExecSQL;
    query.Close;

    // Insertar los apoyos de ODTAPOYO que se insertaron por proximidad.
    query.sql.Clear;
    query.sql.Add('INSERT INTO EMG_INDICEELEMENTO1');
    query.sql.Add('(');
    query.sql.Add
      ('SELECT A.CODIGOINFRAESTRUCTURAUNICO,''01'',A.CODIGOESTRUCTURA FROM APOYO A, ODTAPOYO OA');
    query.sql.Add('WHERE A.PINTADOAPOYO = OA.PINTADOAPOYO');
    query.sql.Add('AND OA.CODIGOODT=:CODIGOODT');
    query.sql.Add('AND OA.CONSECUTIVO=:CONSECUTIVO');
    query.sql.Add(')');
    query.ParamByName('CODIGOODT').AsString := pCodigoODT;
    query.ParamByName('CONSECUTIVO').AsString := pConsecutivo;
    query.ExecSQL;

    query.Close;
    query.sql.Clear;
    query.sql.Add('select a.codigoapoyo');
    query.sql.Add('from emg_indiceelemento1 i,apoyo a');
    query.sql.Add
      ('where a.codigoinfraestructuraunico=i.codigoinfraestructuraunico');
    query.sql.Add('and a.enrevisionmovil=1');
    query.Open;
    sApoyosEnRevision := '';
    while not(query.Eof) do
    begin
      sApoyosEnRevision := sApoyosEnRevision + ',' +
        query.FieldByName('codigoapoyo').AsString;
      query.Next;
    end;
    query.Close;

    if sApoyosEnRevision <> '' then
    begin
      sApoyosEnRevision := copy(sApoyosEnRevision, 2,
        Length(sApoyosEnRevision));
      query.sql.Clear;
      query.sql.Add('select distinct codigoodt from emg_odtasignacion o');
      query.sql.Add('where exists');
      query.sql.Add('(select null from emg_apoyo a');
      query.sql.Add('where codigoapoyo in (' + sApoyosEnRevision + ')');
      query.sql.Add('and a.codigoasignacionemg=o.codigoasignacionemg');
      query.sql.Add('and o.codigoestadoasignacion<>10)');
      query.Open;
      sOdts := '';
      while not(query.Eof) do
      begin
        sOdts := sOdts + ',' + query.FieldByName('codigoodt').AsString;
        query.Next;
      end;
      query.Close;
      query.Free;

      if (sOdts <> '') then
        sOdts := 'En las Odts ' + copy(sOdts, 2, Length(sOdts)) + '.';

      raise Exception.Create
        ('Esta asignación no puede ser generada porque contiene ' + #13 +
        'los siguientes apoyos que se encuentran en Revisión por EnerGis Móvil: '
        + #13 + sApoyosEnRevision + #13 + sOdts);
    end;

    // Generar Asignacion Oracle
    procExportarEMG.Prepare;
    procExportarEMG.ExecProc;

    query.sql.Clear;
    query.sql.Add('UPDATE EMG_ODTASIGNACION');
    query.sql.Add('SET TIPOEXPORTACION= ''V'', ');
    query.sql.Add('CODIGOESTADOASIGNACION = 1,');
    query.sql.Add('FECHAPROCESO=SYSDATE');
    query.sql.Add('WHERE CODIGOODT= ' + pCodigoODT);
    query.sql.Add('AND CONSECUTIVO= ' + pConsecutivo);
    query.sql.Add('AND TIPODATOORIGEN = ''E'' ');
    query.ExecSQL;
    query.Close;
    Application.ProcessMessages;

    // Generar Asignacion SDF
    Ruta := RutaAsignacionMovil;
    Carpeta := 'ODT' + pCodigoODT + '_' + CompletarCadenaIzquierda
      (pConsecutivo, '0', 2);
    ForceDirectories(Ruta + '\' + Carpeta + '\');
    servidor := qReporte.Database.Params.Values['SERVER NAME'];
    usuario := qReporte.Database.Params.Values['USER NAME'];
    ClaveUsuario := qReporte.Database.Params.Values['PASSWORD'];
    query.Close;
    query.sql.Clear;
    query.sql.Text :=
      'SELECT sys_context(''USERENV'', ''CURRENT_SCHEMA'') FROM dual';
    query.Open;
    Esquema := query.Fields[0].AsString;
    query.Close;
    Application.NormalizeTopMosts;
    bExpSDF := Exportar(Ruta + '\' + Carpeta + '\', servidor, usuario,
      ClaveUsuario, Esquema, pCodigoODT, pConsecutivo, False);
    Application.RestoreTopMosts;
    Application.ProcessMessages;

    if bExpSDF then
    begin
      // Generar Shapes
      query.Close;
      query.sql.Clear;
      query.sql.Add('SELECT A.CODIGOASIGNACIONEMG');
      query.sql.Add('FROM EMG_ODTASIGNACION A, EMG_ESTADOASIGNACION E');
      query.sql.Add('WHERE A.CODIGOODT = ' + pCodigoODT);
      query.sql.Add('AND A.CONSECUTIVO = ' + pConsecutivo);
      query.sql.Add('AND A.CODIGOESTADOASIGNACION = E.CODIGOESTADOASIGNACION');
      query.sql.Add('AND A.TIPODATOORIGEN=''E''');
      query.Open;
      if not query.IsEmpty then
      begin
        CodAsignacionExportacion :=
          query.FieldByName('CODIGOASIGNACIONEMG').AsString;
        lista := TStringList.Create;
        ListaPlanchas := TStringList.Create;

        RutaShapes := ExtractFilePath(ParamStr(0));
        if RutaShapes[Length(RutaShapes)] <> '\' then
          RutaShapes := RutaShapes + '\';
        RutaShapes := RutaShapes + 'Datos EnerGis Movil\ODT' + pCodigoODT + '_'
          + CompletarCadenaIzquierda(pConsecutivo, '0', 2);
        RutaShapes := RutaShapes + '\SHAPES\';
        ForceDirectories(RutaShapes);

        query.Close;
        query.sql.Clear;
        query.sql.Add('SELECT CODIGOAPOYO FROM APOYO A');
        query.sql.Add('WHERE EXISTS');
        query.sql.Add('(SELECT NULL FROM EMG_APOYO E');
        query.sql.Add('WHERE E.CODIGOAPOYO = A.CODIGOAPOYO');
        query.sql.Add('AND E.CODIGOASIGNACIONEMG = ' +
          CodAsignacionExportacion + ')');
        query.Open;
        if not query.IsEmpty then
        begin
          query.first;
          while not query.Eof do
          begin
            lista.Add(query.Fields[0].AsString);
            query.Next;
          end;
        end;

        query.Close;
        query.sql.Clear;
        query.sql.Add('SELECT * FROM ODTPLANCHA');
        query.sql.Add('WHERE CODIGOODT = ' + pCodigoODT);
        query.sql.Add('AND CONSECUTIVO = ' + pConsecutivo);
        query.Open;
        if not query.IsEmpty then
        begin
          while not query.Eof do
          begin
            ListaPlanchas.Add(query.FieldByName('CODIGOPLANCHA').AsString);
            query.Next;
          end;
        end;
        query.Close;

        MostrarMapa;
        EMovilExportarCartografiaApoyosPlanchas(lista, ListaPlanchas,
          RutaShapes, False);
        MostrarListaReportes;

        lista.Free;
        ListaPlanchas.Free;
      end;

      sNomSDF := Ruta + '\' + Carpeta + '\EnerGisMóvil.sdf';
      if FileExists(sNomSDF) then
      begin
        // Aqui Exportacion al SFTP
        With Zip do
        begin
          FileName := Ruta + '\' + Carpeta + '.zip';
          OpenArchive(fmCreate);
          BaseDir := Ruta + '\';
          TempDir := Ruta + '\';
          AddFiles(Carpeta);
          CloseArchive;
        end;

        bConectoASFTP := ConectarA_SFTP(Host_SFTP, Port_SFTP, UserID_SFTP,
          Password_SFTP);
        if bConectoASFTP then
        begin
          query.Close;
          query.sql.Clear;
          query.sql.Add
            ('SELECT CODIGOADMINISTRATIVO FROM ODT WHERE CODIGOODT = ' +
            pCodigoODT);
          query.Open;
          sCIA := query.FieldByName('CODIGOADMINISTRATIVO').AsString;
          query.Close;
          RutaCarpetaDestinoSFTP := DirRaiz_SFTP + sCIA + '\' +
            qReporteCODIGOGRUPOTRABAJO.AsString + '\' + CarpetaExportadas + '\';
          if SubirArchivo_SFTP(Ruta + '\' + Carpeta + '.zip',
            RutaCarpetaDestinoSFTP) then
          begin
            Result := true;
            Application.MessageBox
              (PChar('Asignación móvil generada y exportada con éxito.'),
              PChar('EnerGis'), MB_ICONINFORMATION + mb_ok);
            if FileExists(Ruta + '\' + Carpeta + '.zip') then
              DeleteFile(Ruta + '\' + Carpeta + '.zip');
            RenameFile(Ruta + '\' + Carpeta, Ruta + '\' + Carpeta + '_EXP');
          end
          else
            Application.MessageBox
              (PChar('No se pudo subir la asignación móvil al servidor FTP: ' +
              Host_SFTP), PChar('EnerGis'), mb_iconerror + mb_ok);
        end
        else
          Application.MessageBox(PChar('No se pudo conectar al servidor FTP: ' +
            Host_SFTP), PChar('EnerGis'), mb_iconerror + mb_ok);
      end
      else
        Application.MessageBox
          (PChar('No se generó el archivo .SDF de la asignación móvil. Vuelva a intentarlo.'),
          PChar('EnerGis'), mb_iconerror + mb_ok);
    end
    else
      Application.MessageBox
        (PChar('No se generó correctamente la asignación móvil. Vuelva a intentarlo.'),
        PChar('EnerGis'), mb_iconerror + mb_ok);

    query.Close;
    query.Free;
  except
    on E: Exception do
    begin
      Result := False;
      Application.MessageBox
        (PChar('Ocurrió un error al exportar la asignación móvil: ' + Chr(13) +
        Chr(13) + E.Message), PChar('EnerGis'), mb_iconerror + mb_ok);
    end;
  end;
end;

procedure TfReporte.qReporteFECHAHORADICTADOChange(Sender: TField);
var
  i: Integer;
begin
  if (Sender.Text = '') and (qReporte.State in [dsEdit, dsInsert]) then
  begin
    qReporte.FieldByName('CODIGOESTADOREPORTE').AsString := '1';
    dblcbEstadoReporte.Refresh;
  end;
end;

procedure TfReporte.sbBuscarMedidorClick(Sender: TObject);
var
  sReportesAbiertos: String;
  Mensaje: String;
begin
  if not(trim(dbeMedidor.Text) = EmptyStr) then
  begin

    if BuscaDatos(4) then
    begin
      if ValidarReporteAbiertoCliente(qReporteCODIGOCLIENTECOM.AsString,
        sReportesAbiertos) then
      begin
        LimpiarDatosCliente();
        Application.MessageBox(PChar('No puede seleccionar ese medidor ' +
          Chr(13) + 'por que tiene los siguientes reportes abiertos:' + Chr(13)
          + sReportesAbiertos), PChar('Información'),
          mb_ok + MB_ICONINFORMATION);
      end;
    end;
  end
  else
    Application.MessageBox
      (PChar('El numero del medidor no es valido, escriba uno e intente nuevamente.'),
      PChar('Información'), mb_ok + mb_iconerror);
end;

procedure TfReporte.qReporteCODIGOCLASECLIENTEChange(Sender: TField);
begin
  qReporteCODIGOCLASEREPORTE.AsString := '1';
end;

procedure TfReporte.sbGestionarOdtClick(Sender: TObject);
var punto:TPoint;
begin
      punto:=tsFechas.ClientToScreen(Classes.Point(sbGestionarOdt.Left, sbGestionarOdt.top));
      pmGestionOdt.Popup(punto.x+10, punto.y+10);

end;

procedure TfReporte.IraODT1Click(Sender: TObject);
begin
     if (DBEdit5.Text <> '') and (DBEdit8.Text <> '') then
     EditarODTHija;
end;

function TfReporte.ExisteTransaccionActual: boolean;
var query:tquery;
begin
  query:=TQuery.Create(self);
  query.DatabaseName := 'BaseDato';
  query.sql.add('SELECT count(*)');
  query.sql.add('FROM sesiongestion s');
  query.sql.add('WHERE s.idsesionbd =  SYS_CONTEXT (''USERENV'', ''SESSIONID'')');
  query.sql.add('AND fechafin is null');
  query.open;
  result := false;
  if query.fields[0].AsInteger>0 then
    result := true;
end;

procedure TfReporte.EditarODTHija;
var
  qconsulta,query: tquery;
  bm1,bm2:TBookmark;
  cont: integer;
  sSID, sUsuario, sTerminalAct, sTerminalReg: string;
begin
  sSID:='';
  sUsuario:='';
  sTerminalAct:='';
  sTerminalReg:='';

  if ExisteTransaccionActual then
    raise exception.create('No puede editar una Odt hija porque tiene una Odt en transacción.');

  query := TQuery.Create(nil);
  query.DatabaseName := 'BaseDato';
  query.SQL.Clear;
  query.sql.add('select s.sid,u.codigousuario,us.loginusuario,s.osuser,s.terminal');
  query.sql.add('from v$session s,usuariots_log u,sesiongestion g, usuario us');
  query.sql.add('where s.audsid=U.idsesionbd');
  query.sql.add('and g.idsesionbd=u.idsesionbd');
  query.sql.add('and g.fechafin is null');
  query.sql.add('and g.tipogestion = ''O''');
  query.sql.add('and g.clave1 = '+ DBEdit5.Text);
  query.sql.add('and g.clave2 = '+ DBEdit8.Text);
  query.sql.add('and u.codigousuario=us.codigousuario');
  query.Open;
  cont:= query.RecordCount;
  if cont>0 then
  begin
    sSID:=query.FieldByName('SID').AsString;
    sUsuario:=query.FieldByName('loginusuario').AsString;
    sTerminalReg:=query.FieldByName('terminal').AsString;
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT V.TERMINAL FROM V$SESSION V WHERE V.AUDSID = SYS_CONTEXT (''USERENV'',''SESSIONID'')');
    query.Open;
    sTerminalAct:=query.FieldByName('TERMINAL').AsString;
    query.Close;
    if sTerminalReg <> sTerminalAct then
    begin
      query.Free;
      raise exception.create('No se puede acceder esta Orden de Trabajo porque está siendo utilizada por el siguiente usuario.'
                                 + #13 + '[SESION : '+sSID+ '] [USUARIO : '+sUsuario+'] [TERMINAL : '+sTerminalReg+']');
    end;
  end;
  query.Close;
  query.Free;


    fODTUrbanaRural:=TfODTUrbanaRural.Create(Application);
    try
      //****************ODTINTERVENCION  codigo Omar***********************************
      qConsulta := TQuery.Create(Application);
      qConsulta.DatabaseName := 'BaseDato';
      qConsulta.SQL.Add('SELECT count(*) FROM odtintervencion');
      qConsulta.SQL.Add('WHERE CODIGOODT = '+ DBEdit5.Text);
      qConsulta.SQL.Add('AND CONSECUTIVO = '+DBEdit8.Text);
      qConsulta.Open;
      
      if qConsulta.Fields[0].AsFLOAT <> 0 then
      begin
        fODTUrbanaRural.IntervencionCreada:= true;
        fODTUrbanaRural.sbEditarIntervencion.Enabled := true;
        fODTUrbanaRural.sbAgregarRequisicion.Enabled := true;
        fODTUrbanaRural.sbEditarRequisicion.Enabled := true;
        fODTUrbanaRural.sbImprimirRequisicion.Enabled := true;
      end
      else
      fODTUrbanaRural.sbCrearIntervencion.Enabled := true;
      qConsulta.Close;
      qConsulta.Free;
      //*****************************************************************************************
      fODTUrbanaRural.qODTPadre.Close;
      fODTUrbanaRural.qODTPadre.SQL.Add('WHERE CODIGOODT = '+DBEdit5.Text);
      fODTUrbanaRural.qODTPadre.Open;

      fODTUrbanaRural.qODTHija.Close;
      fODTUrbanaRural.qODTHija.SQL.Add('WHERE CODIGOODT = '+DBEdit5.Text);
      fODTUrbanaRural.qODTHija.SQL.Add('AND CONSECUTIVO = '+DBEdit8.Text);
      fODTUrbanaRural.qODTHija.Open;
      fODTUrbanaRural.IdSesion := IniciarSesionGestionOdtHija(StrToFloat(DBEdit5.Text),
                                  StrToFloat(DBEdit8.Text));

      fODTUrbanaRural.qtrans.Open;
      if not fODTUrbanaRural.qtrans.Database.InTransaction then
         fODTUrbanaRural.qtrans.Database.StartTransaction;

      if fODTUrbanaRural.qODTHijaCODIGOTIPOACTIVO.asinteger = 1 then
        fODTUrbanaRural.nbActivo.ActivePage:= 'SubEstacion';
      if fODTUrbanaRural.qODTHijaCODIGOTIPOACTIVO.asinteger = 2 then
        fODTUrbanaRural.nbActivo.ActivePage:= 'linea';
      if fODTUrbanaRural.qODTHijaCODIGOTIPOACTIVO.asinteger = 3 then
        fODTUrbanaRural.nbActivo.ActivePage:= 'circuito';
      fODTUrbanaRural.qODTPadre.Edit;
      fODTUrbanaRural.qODTHija.Edit;
      fODtUrbanaRural.Show;


    except
      on e:exception do
      begin
        showmessage(e.message);
        fODtUrbanaRural.Free;
      end;
    end;

end;

procedure TfReporte.pcDatosChange(Sender: TObject);
begin
qOdt.close;
qOdt.OPEN;
end;

end.
