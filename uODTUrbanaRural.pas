//******************************************************************************
//                    Módulo de ODT
//              - Principal - ODT Hija
//          Registro de órdenes de Trabajo Hijas
//   Que Corresponden a los trabajos que se realizan dentro de una ODT Padre
//******************************************************************************
unit uODTUrbanaRural;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, DBTables, Db, ExtCtrls, Buttons, ComCtrls,
  ImgList, Menus, utMenuArbol,Grids, DBGrids, RXDBCtrl, RXCtrls, QuickRpt, Qrctrls,
  utdMenuEstruct,Math, Psock, NMFtp, utnZommer, dxDbZipImage, uThumbs,
  utnToolbar, UEditPaint, UPaintVistaApoyo, ToolWin, registry,
  CheckLst, RXSpin,Series,  FileCtrl,ComObj, Digisoft, ZipForge, Inifiles;

type
  DatosEmpleado = record
    ExtrasDiurnas, ExtrasNocturnas:Integer;
    Viaticos, Desayuno, Almuerzo, Comida: Double;
  end;
  TDatoAP=record
    CodigoAlumbradoPublico:String;
    CodigoLuminaria:string;
    CodigoEstructura:double;
    CodigoApoyo:double;
    CodigoNodoBT:string;
    CodigoCuenta:double;
  end;
  type TTipoFoto = (tfApoyos, tfClientes, tfSubestaciones);
  TTipoAsignacion =(ExpApoyo, ExpTrafo, ExpCircuito, ExpMixtoTA, ExpMixtoTP, ExpMixtoAP, ExpMixtoTAP, ExpVacia, ExpPlancha);
  TTipoVisualizacion=(mvNinguno,mvCartografia,mvVistaLateral);
  TFOdtUrbanaRural = class(TForm)
    d: TPanel;
    Label4: TLabel;
    dbeFechaEmision: TDBEdit;
    Label5: TLabel;
    dbMotivos: TDBMemo;
    DBEdit3: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    sbFechaEmision: TSpeedButton;
    pInferior: TPanel;
    pIzquierdo: TPanel;
    Arbol: TTreeView;
    ImageList1: TImageList;
    dMenuCIG: TdMenuArbol;
    qCIG: TQuery;
    qODTVehiculo: TQuery;
    dsODTVehiculo: TDataSource;
    UpdODTVehiculo: TUpdateSQL;
    dMenuCIA: TdMenuArbol;
    qCIA: TQuery;
    qTipoTarea: TQuery;
    dsTipoTarea: TDataSource;
    qGrupoTrabajo: TQuery;
    dsGrupoTrabajo: TDataSource;
    qMedidaSeguridad: TQuery;
    dsMedidaSeguridad: TDataSource;
    qReporte: TQuery;
    qReporteCODIGOREPORTE: TFloatField;
    qReporteNOMBREINFORMANTE: TStringField;
    qReporteCODIGOESTADOREPORTE: TStringField;
    qReporteNOMBREESTADOREPORTE: TStringField;
    qReporteDIRECCIONDANO: TStringField;
    qReporteNOMBRECLASEREPORTE: TStringField;
    qReporteNOMBRETIPOREPORTE: TStringField;
    qReporteTIPOINFORMANTE: TStringField;
    qReporteFECHAHORADICTADO: TDateTimeField;
    qReporteFECHAHORALLEGADA: TDateTimeField;
    qReporteFECHAHORAATENCION: TDateTimeField;
    qReporteCODIGOADMINISTRATIVO: TFloatField;
    UpdReporte: TUpdateSQL;
    dsReporte: TDataSource;
    qAlmacen: TQuery;
    dsAlmacen: TDataSource;
    qEmpleado: TQuery;
    qReporteCODIGOODT: TFloatField;
    qReporteCODIGOREPORTE_1: TFloatField;
    qReporteCONSECUTIVO: TFloatField;
    qPresMano: TQuery;
    qPresManoCODIGOEMPLEADO: TFloatField;
    qEmpleado2: TQuery;
    dsPresMano: TDataSource;
    qPresManoCODIGOODT: TFloatField;
    qPresManoCONSECUTIVO: TFloatField;
    qPresManoFECHADIAODT: TDateTimeField;
    UpdPresMano: TUpdateSQL;
    qPresManoCOSTOS: TFloatField;
    qPresMate: TQuery;
    dsPresMate: TDataSource;
    UpdPresMate: TUpdateSQL;
    qPresMateCODIGOODT: TFloatField;
    qPresMateCONSECUTIVO: TFloatField;
    qPresMateCODIGOMATERIAL: TFloatField;
    qPresMateCANTIDADSOLICITADA: TFloatField;
    qPresMateCANTIDADENTREGADA: TFloatField;
    qPresMateCANTIDADCONSUMIDA: TFloatField;
    qPresMateCANTIDADREINTEGRADABUENA: TFloatField;
    qPresMateCANTIDADREINTEGRADAMALA: TFloatField;
    qPresMateCANTIDADRETIRADABUENA: TFloatField;
    qPresMateCANTIDADRETIRADAMALA: TFloatField;
    qPresMateVALORPRESUPUESTADO: TFloatField;
    qPresMateVALORLIQUIDADO: TFloatField;
    qMaterial: TQuery;
    qUnidad: TQuery;
    qPrecioMaterial: TQuery;
    qPresMateCantidadStock: TFloatField;
    bbCancelar: TBitBtn;
    bbAceptar: TBitBtn;
    bbImprimir: TBitBtn;
    qODTHija: TQuery;
    dsODTHija: TDataSource;
    UpdODTHija: TUpdateSQL;
    qODTHijaCODIGOODT: TFloatField;
    qODTHijaCONSECUTIVO: TFloatField;
    qODTHijaIMPRESOODT: TStringField;
    qODTHijaCOSTOMATERIAL: TFloatField;
    qODTHijaCOSTOMANOOBRA: TFloatField;
    qODTHijaCOSTOTRANSPORTE: TFloatField;
    qODTHijaCOSTOEQUIPO: TFloatField;
    qODTHijaCODIGOGRUPOTRABAJO: TFloatField;
    qODTHijaCODIGOGEOGRAFICO: TFloatField;
    qODTHijaCODIGOTIPOVIA: TFloatField;
    qODTHijaCODIGONOMBREVIA: TFloatField;
    qODTHijaMODIFICADORVIA: TStringField;
    qODTHijaDUPLICADOR: TFloatField;
    qODTHijaMODIFICADORDUPLICADOR: TStringField;
    qODTHijaNUMEROPUERTA: TFloatField;
    qODTHijaCostoTotalODT: TFloatField;
    qODTVehiculoCODIGOODT: TFloatField;
    qODTVehiculoCONSECUTIVO: TFloatField;
    qODTVehiculoCODIGOVEHICULO: TStringField;
    qODTHijaOBSERVACION3: TStringField;
    qStock: TQuery;
    UpdStock: TUpdateSQL;
    qODTHijaCODIGOSUBESTACION: TStringField;
    qODTHijaCODIGOTIPOELEMENTO: TStringField;
    qODTHijaNombreSubestacion: TStringField;
    qODTHijaNombreTipoElemento: TStringField;
    pmImprimir: TPopupMenu;
    menuFormatoActual1: TMenuItem;
    FormatoAnterior1: TMenuItem;
    qODTHijaDireccionCalculada: TStringField;
    qPresMateNUMEROVALE: TFloatField;
    qReporteNOMBREFUNCIONARIO: TStringField;
    qStockCODIGOADMINISTRATIVO: TFloatField;
    qStockCODIGOGRUPOTRABAJO: TFloatField;
    qStockCODIGOMATERIAL: TFloatField;
    qStockCANTIDADMINIMA: TFloatField;
    qStockCANTIDADACTUAL: TFloatField;
    qStockCANTIDADINICIAL: TFloatField;
    qODTActividad: TQuery;
    dsODTActividad: TDataSource;
    qODTActividadCODIGOODT: TFloatField;
    qODTActividadCONSECUTIVO: TFloatField;
    qODTActividadCODIGONIVELTENSION: TFloatField;
    qODTActividadCODIGOODTOPERA: TFloatField;
    qODTActividadCODIGOODTACTIVIDAD: TFloatField;
    qODTActividadCodigoCalculado: TStringField;
    UpdODTActividad: TUpdateSQL;
    qActividad: TQuery;
    qODTActividadNombreActividad: TStringField;
    UpdMedidaSeguridad: TUpdateSQL;
    qMedidaSeguridadNOMBREMEDIDASEGURIDAD: TStringField;
    qMedidaSeguridadCODIGOMEDIDASEGURIDAD: TFloatField;
    qMedidaSeguridadESTADO: TFloatField;
    qMedidaSeguridadCODIGOODT: TFloatField;
    qMedidaSeguridadCONSECUTIVO: TFloatField;
    qODTHijaCODIGOTIPOPREDIO: TStringField;
    BitBtn1: TBitBtn;
    qODTApoyo: TQuery;
    dsODTApoyo: TDataSource;
    UpdApoyo: TUpdateSQL;
    qODTApoyoPINTADOAPOYO: TFloatField;
    qODTApoyoCODIGOODT: TFloatField;
    qODTApoyoCONSECUTIVO: TFloatField;
    qGeografico: TQuery;
    dsGeografico: TDataSource;
    qODTHijaGENERAINDICE: TStringField;
    pmTraslado: TPopupMenu;
    TrasladarReporte1: TMenuItem;
    qCodigoReporte: TQuery;
    qODTSobreTiempo: TQuery;
    qAuxilio: TQuery;
    qViatico: TQuery;
    qODTHijaFECHAFINALTRABAJO: TDateTimeField;
    qODTHijaFECHAINICIOTRABAJO: TDateTimeField;
    qEmpleado2CODIGOEMPLEADO: TFloatField;
    qEmpleado2NOMBREEMPLEADO: TStringField;
    qVehiculos: TQuery;
    qVehiculosCODIGOVEHICULO: TStringField;
    qVehiculosCOSTOVEHICULO: TFloatField;
    qCostoActividad: TQuery;
    qCostoActividadCOSTOACTIVIDAD: TFloatField;
    qSubestacion: TQuery;
    dsSubestacion: TDataSource;
    qCircuito: TQuery;
    qTipoElemento: TQuery;
    qODTHijaCODIGOCIRCUITO: TStringField;
    qODTHijaNombreCircuito: TStringField;
    pCentral: TPanel;
    Notebook: TNotebook;
    DBGridReportes: TRxDBGrid;
    Panel1: TPanel;
    Label16: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBNavigator4: TDBNavigator;
    DBCheckBox1: TDBCheckBox;
    Panel7: TPanel;
    Label62: TLabel;
    DBEditCOSTOMANOOBRA: TDBEdit;
    DBGridManoObra: TDBGrid;
    DBGridMaterial: TRxDBGrid;
    Label69: TLabel;
    Label73: TLabel;
    DBMemoCausasRetrasos: TDBMemo;
    DBMemoDanos: TDBMemo;
    dbrgGeneraIndice: TDBRadioGroup;
    Label55: TLabel;
    Label25: TLabel;
    DBEdCodigoOdtOpera: TDBEdit;
    dblkCodigoOdtOpera: TDBLookupComboBox;
    DBEdCodigoNivelTension: TDBEdit;
    dblkCodigoNivelTension: TDBLookupComboBox;
    gbCostos: TGroupBox;
    Label21: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label20: TLabel;
    Label37: TLabel;
    Label19: TLabel;
    Label22: TLabel;
    Label38: TLabel;
    Label41: TLabel;
    Bevel7: TBevel;
    Label23: TLabel;
    DBEditMaterial: TDBEdit;
    DBEditTransporte: TDBEdit;
    DBEditEquipo: TDBEdit;
    DBEditManoObra: TDBEdit;
    DBEditCostoTotalOdt: TDBEdit;
    qLinea: TQuery;
    qNivelTension: TQuery;
    Label30: TLabel;
    DBEdCodigoTipoElemento: TDBEdit;
    dblkCodigoTipoElemento: TDBLookupComboBox;
    qODTHijaCODIGOLINEA: TStringField;
    qODTHijaCODIGOODTOPERA: TFloatField;
    qODTHijaCODIGONIVELTENSION: TStringField;
    qODTHijaNivelTension: TFloatField;
    qOdtOpera: TQuery;
    qODTHijaNombreLinea: TStringField;
    qODTHijaNombreOdtOpera: TStringField;
    qODTHijaNombreTipoTrabajo: TStringField;
    qTipoTrabajo: TQuery;
    qTipoActivo: TQuery;
    qODTHijaCODIGOTIPOACTIVO: TFloatField;
    qODTHijaNombreTipoActivo: TStringField;
    qODTHijaCODIGOTIPOINTERVENCION: TFloatField;
    qODTHijaNombreTipoIntervencion: TStringField;
    qTipoIntervencion: TQuery;
    Panel8: TPanel;
    qODTHijaCODIGOEQUIPO2: TStringField;
    qODTPadre: TQuery;
    qODTPadreCODIGOODT: TFloatField;
    qODTPadreFECHAEMISION: TDateTimeField;
    qODTPadreCODIGOADMINISTRATIVO: TFloatField;
    qODTPadreCODIGOPRIORIDAD: TStringField;
    qODTPadreCODIGOTIPOTAREA: TFloatField;
    qODTPadreCODIGOAPROBADO: TFloatField;
    qODTPadreCODIGOREVISADO: TFloatField;
    qODTPadreCODIGOEJECUTOR: TFloatField;
    qODTPadreCODIGOODTTIPOMANOOBRA: TFloatField;
    qODTPadreCODIGOFIRMANTE: TFloatField;
    qODTPadreFECHAAPROBACION: TDateTimeField;
    qODTPadreFECHAASIGNACION: TDateTimeField;
    qODTPadreEQUIPOENERGIZADO: TStringField;
    qODTPadreCODIGOALMACEN: TStringField;
    qODTPadreCODIGOESTADOODT: TStringField;
    qODTPadreCOSTOMATERIAL: TFloatField;
    qODTPadreCOSTOTRANSPORTE: TFloatField;
    qODTPadreCOSTOMANOOBRA: TFloatField;
    qODTPadreCOSTOEQUIPO: TFloatField;
    qODTPadreCODIGOLABOR: TStringField;
    qODTPadreMOTIVOS: TMemoField;
    qODTPadreCODIGOCONTRATISTA: TStringField;
    qODTPadreCODIGOZONAORIGEN: TFloatField;
    dsODTPadre: TDataSource;
    UpdODTPadre: TUpdateSQL;
    gbInformacionElemento: TGroupBox;
    qPresMateCANTIDADRESERVADA: TFloatField;
    qODTPadreNUMEROCONTRATO: TStringField;
    qTipoIntervencionCODIGOTIPOINTERVENCION: TFloatField;
    qTipoIntervencionDESCRIPCION: TStringField;
    qTipoIntervencionCODIGOESSA: TStringField;
    qSubactividadesOdt: TQuery;
    qSubactividadesOdtCOUNT: TFloatField;
    dsSubactividadesOdt: TDataSource;
    qPorcentajeRealizadas: TQuery;
    qPorcentajeRealizadasCOUNT: TFloatField;
    dsPorcentajeRealizadas: TDataSource;
    qFormatosPruebas: TQuery;
    qFormatosPruebasCODIGOFORMATOMTTODATOS: TFloatField;
    qFormatosPruebasCODIGOFORMATOMTTO: TFloatField;
    qFormatosPruebasCODIGOADMINISTRATIVO: TFloatField;
    qFormatosPruebasCODIGOUSUARIOCREACION: TFloatField;
    qFormatosPruebasFECHACREACION: TDateTimeField;
    qFormatosPruebasCODIGOUSUARIOMODIFICACION: TFloatField;
    qFormatosPruebasFECHAULTIMAMODIFICACION: TDateTimeField;
    qFormatosPruebasCODIGOAMBITO: TFloatField;
    qFormatosPruebasCODIGOSUBESTACION: TStringField;
    qFormatosPruebasCODIGOCOORDINACION: TFloatField;
    qFormatosPruebasCODIGOTIPOMTTO: TFloatField;
    qFormatosPruebasCODIGOTIPOELEMENTO: TFloatField;
    qFormatosPruebasCODIGOELEMENTO: TStringField;
    qFormatosPruebasCODIGOCIRCUITO: TStringField;
    qFormatosPruebasFECHAPRUEBA: TDateTimeField;
    qFormatosPruebasCLELEMENTO1: TStringField;
    qFormatosPruebasCLELEMENTO2: TStringField;
    qFormatosPruebasCODIGOODT: TFloatField;
    qFormatosPruebasCONSECUTIVOODT: TFloatField;
    dsFormatosPruebas: TDataSource;
    qdatosSubactividad: TQuery;
    qdatosSubactividadCODIGOODTSUBACTIVIDADDATOS: TFloatField;
    qdatosSubactividadPROGRAMADA: TStringField;
    qdatosSubactividadEJECUTADA: TStringField;
    dsDatosSubactividad: TDataSource;
    qMantenimientoODT: TQuery;
    dsMantenimientoODT: TDataSource;
    updPorcentajeRealizadas: TUpdateSQL;
    updDatosSubactividad: TUpdateSQL;
    qMantenimiento: TQuery;
    qMantenimientoCODIGOMANTENIMIENTO: TFloatField;
    qMantenimientoFECHAINICIOEJEC: TDateTimeField;
    qMantenimientoFECHAFINEJEC: TDateTimeField;
    qSeccionesPruebas: TQuery;
    qSeccionesPruebasCODIGOSECCIONFORMATODATOS: TFloatField;
    qSeccionesPruebasCODIGOFORMATOMTTODATOS: TFloatField;
    qSeccionesPruebasCODIGOSECCIONFORMATO: TFloatField;
    qSeccionesPruebasCODIGOODT: TFloatField;
    qSeccionesPruebasSUBACTIVIDADODT: TFloatField;
    qSeccionesPruebasESTADOTERMINADO: TStringField;
    qSeccionesPruebasFECHAREGISTRO: TDateTimeField;
    qSeccionesPruebasFECHAMODIFICACION: TDateTimeField;
    qSeccionesPruebasFECHAPRUEBA: TDateTimeField;
    qSeccionesPruebasCODIGOUSUARIOCREACION: TFloatField;
    qSeccionesPruebasCODIGOUSUARIOMODIFICACION: TFloatField;
    dsMantenimiento: TDataSource;
    dsSeccionesPruebas: TDataSource;
    qSubactividad: TQuery;
    qSubactividadCODIGOSUBACTIVIDADAREAODT: TFloatField;
    qOdtSubactividadDatos: TQuery;
    qOdtSubactividadDatosCODIGOMANTENIMIENTO: TFloatField;
    qOdtSubactividadDatosCODIGOSUBACTIVIDADAREAODT: TFloatField;
    qOdtSubactividadDatosNOMBRESUBACTIVIDADAREAODT: TStringField;
    qOdtSubactividadDatosPROGRAMADA: TStringField;
    qOdtSubactividadDatosEJECUTADA: TStringField;
    qOdtSubactividadDatosCODIGOODTSUBACTIVIDADDATOS: TFloatField;
    qOdtSubactividadDatosCODIGOODT: TFloatField;
    qOdtSubactividadDatosCONSECUTIVO: TFloatField;
    dsSubactividad: TDataSource;
    dsOdtSubactividadDatos: TDataSource;
    updodtsubactividaddatos: TUpdateSQL;
    updMantenimiento: TUpdateSQL;
    qFormato: TQuery;
    qFormatoCODIGOFORMATOMTTO: TFloatField;
    qFormatoNOMBREFORMATOMTTO: TStringField;
    dsFormato: TDataSource;
    qPruebasProgramadas: TQuery;
    qPruebasProgramadasCODIGOSUBACTIVIDADPRUEBA: TFloatField;
    qPruebasProgramadasCODIGOSECCIONFORMATO: TFloatField;
    qPruebasProgramadasNOMBRESECCIONFORMATO: TStringField;
    qPruebasProgramadasCODIGOFORMATOMTTO: TFloatField;
    qPruebasProgramadasNOMBREFORMATOMTTO: TStringField;
    dsPruebasProgramadas: TDataSource;
    DBETipoElementoMtto: TDBEdit;
    qTipoElementoMtto: TQuery;
    qODTHijaNombreTipoElementoMtto: TStringField;
    dsTipoElementoMtto: TDataSource;
    qODTHijaODTGENERADA: TStringField;
    Edit4: TEdit;
    qTipoElementoMttoCODIGOELEMENTO: TFloatField;
    qTipoElementoMttoNOMBRETIPOELEMENTO: TStringField;
    qODTINTERVENCION: TQuery;
    qODTINTERVENCIONCODIGOODT: TFloatField;
    qODTINTERVENCIONCONSECUTIVO: TFloatField;
    qODTINTERVENCIONCODIGOINTERVENCION: TFloatField;
    dsODTIntervencion: TDataSource;
    UpdODTINTERVENCION: TUpdateSQL;
    qRequisiciones: TQuery;
    qRequisicionesCODIGOODT: TFloatField;
    qRequisicionesCONSECUTIVO: TFloatField;
    qRequisicionesCODIGOREQUISICION: TFloatField;
    qRequisicionesFECHAREQUISICION: TDateTimeField;
    qRequisicionesESTADO: TStringField;
    qRequisicionesFECHAMODIFICACION: TDateTimeField;
    qRequisicionesEMPRESA: TFloatField;
    qRequisicionesNEGOCIO: TFloatField;
    qRequisicionesVIGENCIA: TFloatField;
    qRequisicionesCODIGOTIPOODM: TStringField;
    qRequisicionesCODIGODOCUMENTOODM: TFloatField;
    dsRequisiciones: TDataSource;
    qTraslados: TQuery;
    qTrasladosCODIGOADMINISTRATIVOORIGEN: TFloatField;
    qTrasladosCODIGOGRUPOTRABAJOORIGEN: TFloatField;
    qTrasladosCODIGOADMINISTRATIVODESTINO: TFloatField;
    qTrasladosCODIGOGRUPOTRABAJODESTINO: TFloatField;
    qTrasladosFECHATRASLADO: TDateTimeField;
    qTrasladosCODIGOTRASLADO: TFloatField;
    qTrasladosCODIGOODT: TFloatField;
    qTrasladosCONSECUTIVO: TFloatField;
    dsTraslados: TDataSource;
    qStockMaterial: TQuery;
    qStockMaterialCODIGOADMINISTRATIVO: TFloatField;
    qStockMaterialCODIGOGRUPOTRABAJO: TFloatField;
    qStockMaterialCODIGOMATERIAL: TFloatField;
    qStockMaterialCANTIDADMINIMA: TFloatField;
    qStockMaterialCANTIDADACTUAL: TFloatField;
    qStockMaterialCANTIDADINICIAL: TFloatField;
    qStockMaterialNombreMaterial: TStringField;
    qStockMaterialFECHAULTIMOINVENTARIO: TDateTimeField;
    qStockMaterialCODIGOSTOCKGRUPOTRABAJO: TFloatField;
    qStockMaterialCANTIDADACTUALDESMANTELADABUEN: TFloatField;
    qStockMaterialCANTIDADACTUALDESMANTELADAMALA: TFloatField;
    dsStockMaterial: TDataSource;
    qStockGrupotrabajo: TQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    StringField2: TStringField;
    FloatField5: TFloatField;
    dsStockGrupotrabajo: TDataSource;
    updStockGrupotrabajo: TUpdateSQL;
    qPresMateNUEVO: TStringField;
    qPresMateCANTIDADCONSUMIDADESMANTELADA: TFloatField;
    qPresMateCANTIDADREINTEGRADABUENADESMAN: TFloatField;
    qPresMateCANTIDADREINTEGRADAMALADESMAN: TFloatField;
    qPresMateCANTIDADTRASLADONUEVA: TFloatField;
    qPresMateCANTIDADTRASLADODESMAN: TFloatField;
    qGrupoTrabajoCODIGOGRUPOTRABAJO: TFloatField;
    qGrupoTrabajoNOMBREGRUPOTRABAJO: TStringField;
    qGrupoTrabajoCODIGOADMINISTRATIVO: TFloatField;
    qODTHijaCODIGOTIPOTRABAJOODT: TFloatField;
    qGrupoTrabajo2: TQuery;
    FloatField6: TFloatField;
    StringField3: TStringField;
    FloatField7: TFloatField;
    dsGrupoTrabajo2: TDataSource;
    qAdministrativo: TQuery;
    dsAdministrativo: TDataSource;
    qAdministrativoCODIGOADMINISTRATIVO: TFloatField;
    qAdministrativoNOMBRECATEGORIA: TStringField;
    qODTHijaMATERIALREINTEGRADO: TStringField;
    qZona: TQuery;
    qZonaCODIGOZONA: TFloatField;
    qZonaNOMBREZONA: TStringField;
    qZonaCODIGOZONAESSA: TFloatField;
    dsZona: TDataSource;
    qODTPadreCodigoZonaEssa: TIntegerField;
    gbObjetoTrabajo: TGroupBox;
    Label24: TLabel;
    Label28: TLabel;
    Label31: TLabel;
    dbEdCodigoTipoTrabajo: TDBEdit;
    dblkCodigoTipoTrabajo: TDBLookupComboBox;
    dbEdCodigoTipoActivo: TDBEdit;
    dblkCodigoTipoActivo: TDBLookupComboBox;
    dbEdCodigoTipoIntervencion: TDBEdit;
    dblkCodigoTipoIntervencion: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    DBGridVehiculos: TRxDBGrid;
    DBNavigator1: TDBNavigator;
    GroupBox4: TGroupBox;
    Label11: TLabel;
    dbeCIA: TDBEdit;
    GroupBox2: TGroupBox;
    Label13: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label7: TLabel;
    dbePrioridad: TDBEdit;
    dbeLabor: TDBEdit;
    dbeTarea: TDBEdit;
    dbeEstadoODT: TDBEdit;
    pcMaterial: TPageControl;
    tsMaterialPrincipal: TTabSheet;
    PanelMaterial: TPanel;
    PanelVales: TPanel;
    sbCierreStock: TRxSpeedButton;
    RxSpeedButton10: TRxSpeedButton;
    RxSpeedButton11: TRxSpeedButton;
    Label142: TLabel;
    eAgregarCodigo: TEdit;
    tsMaterialRequisicion: TTabSheet;
    Panel31: TPanel;
    Panel32: TPanel;
    dbgRequisiciones: TDBGrid;
    Panel33: TPanel;
    sbAgregarRequisicion: TSpeedButton;
    sbEditarRequisicion: TSpeedButton;
    sbImprimirRequisicion: TSpeedButton;
    sbEliminarRequisicion: TSpeedButton;
    tsMaterialTraslado: TTabSheet;
    Panel34: TPanel;
    DBGrid3: TDBGrid;
    Panel35: TPanel;
    sbAgregarTraslado: TSpeedButton;
    sbEditarTraslado: TSpeedButton;
    sbImprimirTraslado: TSpeedButton;
    sbEliminarTraslado: TSpeedButton;
    tsMaterialDesmantelado: TTabSheet;
    dbgMaterialesDesmantelados: TDBGrid;
    tsMaterialConsumo: TTabSheet;
    Panel36: TPanel;
    RxDBGrid17: TRxDBGrid;
    panelMaterialIntervencion: TPanel;
    Label139: TLabel;
    sbCrearIntervencion: TSpeedButton;
    sbEditarIntervencion: TSpeedButton;
    tsMaterialReintegro: TTabSheet;
    PanelMaterialReintegro: TPanel;
    sbDevoluciones: TSpeedButton;
    tsMaterialStock: TTabSheet;
    Panel41: TPanel;
    dbgStockGrupoTrabajo: TDBGrid;
    Panel42: TPanel;
    Label140: TLabel;
    Label141: TLabel;
    dbeAdministrativo: TDBEdit;
    dbeGrupoTrabajo2: TDBEdit;
    dblcbGrupoTrabajo2: TDBLookupComboBox;
    dblcAdministrativo: TDBLookupComboBox;
    panel24: TPanel;
    Panel23: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel25: TPanel;
    qEventoAP: TQuery;
    dsEventoAP: TDataSource;
    GroupBox7: TGroupBox;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label39: TLabel;
    LabelR: TLabel;
    LabelS: TLabel;
    LabelT: TLabel;
    Label40: TLabel;
    LabelN: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    dbCIE: TDBEdit;
    dbApoyo1: TDBEdit;
    dbCodigo: TDBEdit;
    dbObservacion: TDBEdit;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBCheckBox5: TDBCheckBox;
    DBCheckBox6: TDBCheckBox;
    dbNodo1: TDBEdit;
    DBLCBUsoAlumbrado: TDBLookupComboBox;
    DBCuenta: TDBEdit;
    dsUsoAlumbrado: TDataSource;
    qUsoAlumbrado: TQuery;
    GroupBox6: TGroupBox;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    qValidacion: TQuery;
    GroupBox9: TGroupBox;
    qTipoActividadAP: TQuery;
    dsTipoActividadAP: TDataSource;
    gbTipoActividadAP: TGroupBox;
    GroupBox10: TGroupBox;
    dbgLamparaAP: TDBGrid;
    DBNavigator2: TDBNavigator;
    qActividadAP: TQuery;
    dsActividadAP: TDataSource;
    Label44: TLabel;
    Label56: TLabel;
    upEventoAP: TUpdateSQL;
    qAlumbradoPublico: TQuery;
    dsAlumbradoPublico: TDataSource;
    updAlumbradoPublico: TUpdateSQL;
    qEventoAPCODIGOEVENTOAP: TFloatField;
    qEventoAPCODIGOALUMBRADOPUBLICO: TFloatField;
    qEventoAPCODIGOACTIVIDAD: TFloatField;
    qEventoAPCODIGOTIPOACTIVIDAD: TFloatField;
    qEventoAPFECHA: TDateTimeField;
    qEventoAPPINTADOAPOYO: TStringField;
    qEventoAPCODIGOAPOYO: TFloatField;
    qEventoAPCODIGOESTRUCTURA: TFloatField;
    qEventoAPCODIGOLUMINARIA: TStringField;
    qEventoAPCODIGOALUMBRADOPUBLICOANTERIOR: TFloatField;
    qEventoAPCODIGOESTRUCTURAANTERIOR: TFloatField;
    qEventoAPCODIGOLUMINARIAANTERIOR: TStringField;
    qEventoAPCODIGOCUENTA: TFloatField;
    qEventoAPCODIGOCUENTAANTERIOR: TFloatField;
    qEventoAPCODIGOAPOYOANTERIOR: TFloatField;
    qEventoAPCODIGONODOBT: TStringField;
    qEventoAPCODIGONODOBTANTERIOR: TStringField;
    qEventoAPR: TStringField;
    qEventoAPS: TStringField;
    qEventoAPT: TStringField;
    qEventoAPN: TStringField;
    qEventoAPCODIGOOBSERVACION: TFloatField;
    qEventoAPCODIGOTIPOFUENTE: TStringField;
    qEventoAPCODIGOTIPOLUMINARIA: TStringField;
    qEventoAPCODIGOUSUARIO: TFloatField;
    qEventoAPCODIGOODT: TFloatField;
    qEventoAPCONSECUTIVO: TFloatField;
    qEventoAPCODIGOACTUAL: TStringField;
    qEventoAPCODIGOUSOALUMBRADO: TStringField;
    DBLookupComboBox8: TDBLookupComboBox;
    DBLookupComboBox9: TDBLookupComboBox;
    lbTipoFuente: TLabel;
    lbTipoLuminaria: TLabel;
    lbLamparaTipica: TLabel;
    lbobservacion: TLabel;
    lbEstructura: TLabel;
    qEventoAPCODIGOLAMPARATIPICA: TStringField;
    dMenuEstructura: TdMenuStruct;
    dMenuObservacion: TdMenuObservacion;
    qAlumbradoPublicoCODIGOALUMBRADOPUBLICO: TFloatField;
    qAlumbradoPublicoCODIGOAPOYO: TFloatField;
    qAlumbradoPublicoCODIGONODOBT: TStringField;
    qAlumbradoPublicoCODIGOUSOALUMBRADO: TStringField;
    qAlumbradoPublicoR: TStringField;
    qAlumbradoPublicoS: TStringField;
    qAlumbradoPublicoT: TStringField;
    qAlumbradoPublicoN: TStringField;
    qAlumbradoPublicoCODIGOESTRUCTURA: TFloatField;
    qAlumbradoPublicoCODIGOOBSERVACION: TFloatField;
    qAlumbradoPublicoCODIGO_CUENTA: TFloatField;
    qODTPadreCODIGOMUNICIPIO: TFloatField;
    qCIANOMBREADMINISTRATIVO: TStringField;
    qCIANOMBRECATEGORIA: TStringField;
    TrabajosAPRealizados1: TMenuItem;
    FormatoAP1: TMenuItem;
    qMunicipio: TQuery;
    qMunicipioCODIGOMUNICIPIO: TFloatField;
    qMunicipioNOMBREMUNICIPIO: TStringField;
    PartePosteriorFormatoAnterior1: TMenuItem;
    qODTApoyoCodigoApoyo: TIntegerField;
    qOdtTrafodis: TQuery;
    qOdtTrafodisCODIGOODT: TFloatField;
    qOdtTrafodisCONSECUTIVO: TFloatField;
    qOdtTrafodisPINTADOTRAFODIS: TStringField;
    dsOdtTrafodis: TDataSource;
    updOdtTrafodis: TUpdateSQL;
    qOdtTrafodisCodigoTrafodis: TFloatField;
    qContratistaIntervenido: TQuery;
    dsContratistaIntervenido: TDataSource;
    qContratoIntervenido: TQuery;
    dsContratoIntervenido: TDataSource;
    qODTHijaNUMEROCONTRATOINTERVENIDO: TStringField;
    qODTHijaCODIGOCONTRATISTAINTERVENIDO: TStringField;
    qContratistaIntervenidoCODIGOCONTRATISTA: TStringField;
    qContratistaIntervenidoNOMBRECONTRATISTA: TStringField;
    qContratistaIntervenidoREPRESENTANTE: TStringField;
    qContratistaIntervenidoDIRECCION: TStringField;
    qContratistaIntervenidoCIUDAD: TStringField;
    qContratistaIntervenidoTELEFONO: TStringField;
    qContratistaIntervenidoRETENEDORIVA: TStringField;
    qContratistaIntervenidoCEDULACONTRATISTA: TFloatField;
    qODTPadreCODIGOTIPOTURNO: TFloatField;
    qODTPadreCODIGOTURNO: TFloatField;
    DBNavigatorManoObra: TDBNavigator;
    GroupBox5: TGroupBox;
    lCuadrilla: TLabel;
    Label8: TLabel;
    SpeedButton22: TSpeedButton;
    dbeTipoManoObra: TDBEdit;
    dbeGrupoTrabajo: TDBEdit;
    sbCostoManoObra: TRxSpeedButton;
    qOdtClienteSgd: TQuery;
    dsOdtClienteSgd: TDataSource;
    updOdtClienteSgd: TUpdateSQL;
    qOdtClienteSgdCODIGOODT: TFloatField;
    qOdtClienteSgdCONSECUTIVO: TFloatField;
    qOdtClienteSgdCODIGOCLIENTESGD: TFloatField;
    qOdtClienteSgdCODIGOCUENTA: TFloatField;
    RxDBGrid4: TRxDBGrid;
    qPresManoNombreEmpleado: TStringField;
    qODTPadreNombrePrioridad: TStringField;
    qODTPadreNombreLabor: TStringField;
    qODTPadreNombreTipoManoObra: TStringField;
    qODTPadreNombreEstadoOdt: TStringField;
    qODTPadreNombreContratista: TStringField;
    qODTPadreNombreTipoTarea: TStringField;
    dbeNombreTipoManoObra: TDBEdit;
    dblcbGrupoTrabajo: TDBLookupComboBox;
    dbeNombrePrioridad: TDBEdit;
    dbeNombreLabor: TDBEdit;
    dbeTipoTarea: TDBEdit;
    dbeNombreEstadoOdt: TDBEdit;
    qPresManoSueldoEmpleado: TFloatField;
    qEmpleado2SUELDO: TFloatField;
    qPresMateNombreMaterial: TStringField;
    qPresMateNombreUnidad: TStringField;
    qPresMateCANTIDADMODIFICADANUEVA: TFloatField;
    qPresMateCANTIDADMODIFICADADESMBUENA: TFloatField;
    qPresMateCANTIDADMODIFICADADESMMALA: TFloatField;
    qPresMateMOTIVOMODIFICACIONSTOCK: TStringField;
    qApoyoElemento: TQuery;
    qApoyoElementoCODIGOAPOYO: TFloatField;
    qGestionInfraestructura: TQuery;
    qGestionInfraestructuraNOMBRETIPOACTIVIDAD: TStringField;
    qGestionInfraestructuraNOMBREESTRUCTURA: TStringField;
    qGestionInfraestructuraIDGESTIONINFRAESTRUCTURA: TFloatField;
    qGestionInfraestructuraCODIGOTIPOELEMENTO: TStringField;
    qGestionInfraestructuraCODIGOINFRAESTRUCTURAUNICO: TFloatField;
    qGestionInfraestructuracodigointerno: TStringField;
    qGestionInfraestructuracodigofisico: TStringField;
    qGestionInfraestructuraCODIGOACTIVIDAD: TFloatField;
    qGestionInfraestructuraCODIGOESTRUCTURA: TFloatField;
    qGestionInfraestructuraCOSTO: TFloatField;
    qGestionInfraestructuraACCION: TStringField;
    qGestionInfraestructuraNOMBREUSUARIO: TStringField;
    qGestionInfraestructuraREFERENCIA: TStringField;
    dsGestionInfraestructura: TDataSource;
    qObservacion: TQuery;
    qObservacionCODIGOOBSERVACION: TFloatField;
    qObservacionNOMBREOBSERVACION: TStringField;
    qObservacionCODIGOTIPOESTRUCTURA: TStringField;
    qObservacionCODIGOESTADOINVENTARIO: TStringField;
    qImagenes: TQuery;
    qImagenesGRAFICO: TBlobField;
    dsimagenes: TDataSource;
    Zommer1: TZommer;
    qEstructura: TQuery;
    qEstructuraCODIGOESTRUCTURA: TFloatField;
    qEstructuraNOMBREESTRUCTURA: TStringField;
    qEstructuraCODIGOUSO: TStringField;
    qEstructuraCODIGOUNIDAD: TStringField;
    qEstructuraREFERENCIA: TStringField;
    dsEstructura: TDataSource;
    ilToolbars: TImageList;
    pmVerInfraestructura: TPopupMenu;
    Verelementoactual1: TMenuItem;
    Verelementosseleccionados1: TMenuItem;
    Vertodosloselementos1: TMenuItem;
    tPerfilVL: TTable;
    tPerfilVLCODIGOPERFILVL: TFloatField;
    tPerfilVLNOMBREPERFILVL: TStringField;
    tPerfilVLCODIGOUSUARIO: TFloatField;
    tPerfilVLDESCRIPCION: TBlobField;
    qGestionInfraestructuraTIPOGESTION: TStringField;
    qGestionInfraestructuraCLAVE1: TFloatField;
    qGestionInfraestructuraCLAVE2: TFloatField;
    qGestionInfraestructuraCODIGOUSUARIO: TFloatField;
    qGestionInfraestructuraFECHA: TDateTimeField;
    qGestionInfraestructuraNOMBRETIPOELEMENTO: TStringField;
    qApoyoElementoPINTADOAPOYO: TStringField;
    pmExportarEMG: TPopupMenu;
    ExportarDatosdeCircuito1: TMenuItem;
    ExportarDatosdeTrafosasociados1: TMenuItem;
    ExportarDatosdeapoyosrelacionados1: TMenuItem;
    procExportarEMG: TStoredProc;
    qPresMateCodigoMaterialEssa: TFloatField;
    pmApoyo: TPopupMenu;
    qODTPadreNombreAdministrativo: TStringField;
    lbCIA: TLabel;
    qEquipo: TQuery;
    dsEquipo: TDataSource;
    dbgEquipo: TRxDBGrid;
    qPresEquipo: TQuery;
    qPresEquipoCODIGOODT: TFloatField;
    qPresEquipoCONSECUTIVO: TFloatField;
    qPresEquipoCODIGOEQUIPO: TFloatField;
    qPresEquipoCANTIDAD: TFloatField;
    qPresEquipoNombreEquipo: TStringField;
    dsPresEquipo: TDataSource;
    updPresEquipo: TUpdateSQL;
    AbrirCartografaVistaLateral1: TMenuItem;
    qNombreEquipo: TQuery;
    qNombreEquipoCODIGOEQUIPO: TFloatField;
    qNombreEquipoNOMBREEQUIPO: TStringField;
    Label57: TLabel;
    DBEdit22: TDBEdit;
    Bevel2: TBevel;
    Label58: TLabel;
    qODTHijaCOSTOACTIVIDAD: TFloatField;
    DBNavigator3: TDBNavigator;
    Panel2: TPanel;
    DBNavigator6: TDBNavigator;
    qPresEquipoCOSTOUNITARIO: TFloatField;
    qPresEquipoCostoTotal: TFloatField;
    Panel14: TPanel;
    PanelTituloActividad: TPanel;
    DBGrid1: TDBGrid;
    ExportarDatosdeTrafosyapoyosrelacionados1: TMenuItem;
    qODTPadreFECHAINICIO: TDateTimeField;
    qODTPadreFECHAFINAL: TDateTimeField;
    qPresManoEXTRASDIURNAS: TFloatField;
    qPresManoEXTRASNOCTURNAS: TFloatField;
    qPresManoDESAYUNO: TFloatField;
    qPresManoALMUERZO: TFloatField;
    qPresManoCOMIDA: TFloatField;
    qPresManoCOSTOREAL: TFloatField;
    qPresManoHORASDIURNAS: TFloatField;
    qPresManoHORASNOCTURNAS: TFloatField;
    qPresManoEXTRASDIURNASDOMFESTIVO: TFloatField;
    qPresManoEXTRASNOCTURNASDOMFESTIVO: TFloatField;
    StoredProc1: TStoredProc;
    qPresManoHORASDIURNASDOMINGO: TFloatField;
    qPresManoHORASNOCTURNASDOMINGO: TFloatField;
    qPresManoHORASDIURNASFESTIVO: TFloatField;
    qPresManoHORASNOCTURNASFESTIVO: TFloatField;
    qPresManoVIATICOS: TFloatField;
    qODTHijaCostoCalculadoManoobra: TFloatField;
    qPresManoValorHora: TFloatField;
    Label59: TLabel;
    PanelExtraRecargo: TPanel;
    SCuadradoActividad: TShape;
    Label70: TLabel;
    Label71: TLabel;
    Label74: TLabel;
    SVerticalActivida1: TShape;
    SVerticalActivida2: TShape;
    SLineaVActividad1: TShape;
    SHorizontalActividad1: TShape;
    SHorizontalActividad2: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Shape13: TShape;
    lbRDO: TLabel;
    Label72: TLabel;
    Label75: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    lbRNO: TLabel;
    lbEDO: TLabel;
    lbENO: TLabel;
    lbRDD: TLabel;
    lbRND: TLabel;
    lbEDD: TLabel;
    lbEND: TLabel;
    lbRDF: TLabel;
    lbRNF: TLabel;
    lbEDF: TLabel;
    lbENF: TLabel;
    Label82: TLabel;
    qODTHijaCodAsignacionImportacion: TFloatField;
    qODTHijaCodAsignacionExportacion: TFloatField;
    qODTPadreCODIGOMODOODT: TFloatField;
    gbUbicacion: TGroupBox;
    nbUbicacion: TNotebook;
    SpeedButton1: TSpeedButton;
    Label10: TLabel;
    sbBuscarCIG: TSpeedButton;
    DBText3: TDBText;
    DBEdit5: TDBEdit;
    dbeDireccion: TDBEdit;
    nbActivo: TNotebook;
    Label54: TLabel;
    DBEdit7: TDBEdit;
    dblcbSubestacion: TDBLookupComboBox;
    Label6: TLabel;
    DBEdit17: TDBEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    Label26: TLabel;
    DBEdit20: TDBEdit;
    DBLookupComboBox6: TDBLookupComboBox;
    pcInfraestructura: TPageControl;
    tsInfraestructuraElementos: TTabSheet;
    tsInfraestructuraGestion: TTabSheet;
    tsAsignacionMovil: TTabSheet;
    PanelVerInfraestructura: TToolBar;
    tbVerPanelInfraestructura: TToolButton;
    tbVerCartografia: TToolButton;
    tbVerVistalateral: TToolButton;
    PanelInfraestructura: TPanel;
    PanelBase: TPanel;
    CoolBar3: TCoolBar;
    Panel17: TPanel;
    DPaint1: TdPaintVistaApoyo;
    Piconos: TToolPanel;
    sbShowPanelEstructuras: TSpeedButton;
    sbShowHintOnly: TSpeedButton;
    Shape11: TShape;
    Shape12: TShape;
    sbShowFasesTramos: TSpeedButton;
    sbObservacion: TSpeedButton;
    sbFrezze: TSpeedButton;
    pHint: TPanel;
    lbHint: TLabel;
    Panel9: TPanel;
    dbgElementoGestion: TDBGrid;
    Panel10: TPanel;
    Shape14: TShape;
    DBText9: TDBText;
    Label60: TLabel;
    Label61: TLabel;
    Shape15: TShape;
    Shape16: TShape;
    DBText11: TDBText;
    DBText12: TDBText;
    DBText13: TDBText;
    Label63: TLabel;
    Label64: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    DBText10: TDBText;
    DBText14: TDBText;
    Label68: TLabel;
    Shape1: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    dDbzImage1: TdDbzImage;
    qODTPadreNombreAprobado: TStringField;
    qODTPadreNombreEjecutado: TStringField;
    qODTPadreNombreRevisado: TStringField;
    qODTHijaFechaAsignacionImportacion: TDateField;
    qODTHijaFechaAsignacionExportacion: TDateField;
    qODTHijaEstadoAsignacionExportacion: TStringField;
    qODTHijaEstadoAsignacionImportacion: TStringField;
    pcAsignacionMovil: TPageControl;
    tsMovilExportacion: TTabSheet;
    tsMovilImportacion: TTabSheet;
    GroupBox12: TGroupBox;
    Label83: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit27: TDBEdit;
    Panel3: TPanel;
    tvElementosExportacion: TTreeView;
    nbElementosExportacion: TNotebook;
    RxDBGrid1: TRxDBGrid;
    Panel15: TPanel;
    RxDBGrid5: TRxDBGrid;
    Panel16: TPanel;
    RxDBGrid6: TRxDBGrid;
    Panel29: TPanel;
    RxDBGrid7: TRxDBGrid;
    Panel37: TPanel;
    RxDBGrid8: TRxDBGrid;
    Panel39: TPanel;
    RxDBGrid9: TRxDBGrid;
    Panel40: TPanel;
    RxDBGrid15: TRxDBGrid;
    Panel43: TPanel;
    Panel44: TPanel;
    RxDBGrid19: TRxDBGrid;
    Panel45: TPanel;
    RxDBGrid20: TRxDBGrid;
    Panel46: TPanel;
    RxDBGrid21: TRxDBGrid;
    Panel47: TPanel;
    RxDBGrid22: TRxDBGrid;
    Panel48: TPanel;
    RxDBGrid23: TRxDBGrid;
    Panel49: TPanel;
    RxDBGrid24: TRxDBGrid;
    Panel50: TPanel;
    RxDBGrid25: TRxDBGrid;
    RxDBGrid26: TRxDBGrid;
    Panel51: TPanel;
    Panel52: TPanel;
    RxDBGrid27: TRxDBGrid;
    Panel53: TPanel;
    RxDBGrid28: TRxDBGrid;
    RxDBGrid29: TRxDBGrid;
    Panel54: TPanel;
    Panel55: TPanel;
    TreeView1: TTreeView;
    nbElementosImportacion: TNotebook;
    RxDBGrid30: TRxDBGrid;
    Panel56: TPanel;
    RxDBGrid31: TRxDBGrid;
    Panel57: TPanel;
    RxDBGrid32: TRxDBGrid;
    Panel58: TPanel;
    RxDBGrid33: TRxDBGrid;
    Panel59: TPanel;
    RxDBGrid34: TRxDBGrid;
    Panel60: TPanel;
    RxDBGrid35: TRxDBGrid;
    Panel61: TPanel;
    RxDBGrid36: TRxDBGrid;
    Panel62: TPanel;
    Panel63: TPanel;
    RxDBGrid37: TRxDBGrid;
    Panel64: TPanel;
    RxDBGrid38: TRxDBGrid;
    Panel65: TPanel;
    RxDBGrid39: TRxDBGrid;
    Panel66: TPanel;
    RxDBGrid40: TRxDBGrid;
    Panel67: TPanel;
    RxDBGrid41: TRxDBGrid;
    Panel68: TPanel;
    RxDBGrid42: TRxDBGrid;
    Panel69: TPanel;
    RxDBGrid43: TRxDBGrid;
    RxDBGrid44: TRxDBGrid;
    Panel70: TPanel;
    Panel71: TPanel;
    RxDBGrid45: TRxDBGrid;
    Panel72: TPanel;
    RxDBGrid46: TRxDBGrid;
    RxDBGrid47: TRxDBGrid;
    Panel73: TPanel;
    dsTAdministrativo: TDataSource;
    tAdministrativo: tdMemTable;
    tAdministrativoCODIGOADMINISTRATIVO: TIntegerField;
    tAdministrativoCODIGOGRUPOTRABAJO: TIntegerField;
    qImagenesTrafo: TQuery;
    dsImagenesTrafo: TDataSource;
    qImagenesApoyo: TQuery;
    dsImagenesApoyo: TDataSource;
    qOdtTrafodisreferencia: TStringField;
    qODTApoyoReferencia: TStringField;
    qODTApoyoCodigoEstructura: TFloatField;
    qOdtTrafodisCodigoEstructura: TFloatField;
    SeleccionarApoyosdeListado1: TMenuItem;
    qODTVehiculoNombreTipoVehiculo: TStringField;
    ListadodeNodosdeMediaTensin1: TMenuItem;
    ListadodeNodosdeBajaTensin1: TMenuItem;
    ListadodeDetalledeApoyos1: TMenuItem;
    ListadodeTramosdeMediaTensin1: TMenuItem;
    ListadodeTransformadoresdeDistribucin1: TMenuItem;
    ListadodeInterruptoresdeDistribucin1: TMenuItem;
    ListadodePararrayosdeDistribucin1: TMenuItem;
    ListadodeTramosdeBajaTensin1: TMenuItem;
    ListadodeLamparas1: TMenuItem;
    ListasdeExcavacionesdeDistribucin1: TMenuItem;
    ListasdeDuctosdeExcavaciones1: TMenuItem;
    ListadodeCondensadores1: TMenuItem;
    SpeedButton3: TSpeedButton;
    bExportarAsignacionEMG: TBitBtn;
    GroupBox8: TGroupBox;
    Label85: TLabel;
    Label86: TLabel;
    Label88: TLabel;
    DBEdit31: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    BitBtn3: TBitBtn;
    DBNavigator5: TDBNavigator;
    DBNavigator9: TDBNavigator;
    PopupMenu1: TPopupMenu;
    MaterialesdelApoyo1: TMenuItem;
    MaterialesdelaLuminaria1: TMenuItem;
    RxDBGrid3: TRxDBGrid;
    qOdtFormato: TQuery;
    qOdtFormatoCODIGOFORMATOMTTODATOS: TFloatField;
    qOdtFormatoCODIGOFORMATOMTTO: TFloatField;
    qOdtFormatoCODIGOADMINISTRATIVO: TFloatField;
    qOdtFormatoCODIGOUSUARIOCREACION: TFloatField;
    qOdtFormatoFECHACREACION: TDateTimeField;
    qOdtFormatoCODIGOUSUARIOMODIFICACION: TFloatField;
    qOdtFormatoFECHAULTIMAMODIFICACION: TDateTimeField;
    qOdtFormatoCODIGOAMBITO: TFloatField;
    qOdtFormatoCODIGOSUBESTACION: TStringField;
    qOdtFormatoCODIGOCOORDINACION: TFloatField;
    qOdtFormatoCODIGOTIPOMTTO: TFloatField;
    qOdtFormatoCODIGOTIPOELEMENTO: TFloatField;
    qOdtFormatoCODIGOELEMENTO: TStringField;
    qOdtFormatoCODIGOCIRCUITO: TStringField;
    qOdtFormatoFECHAPRUEBA: TDateTimeField;
    qOdtFormatoCLELEMENTO1: TStringField;
    qOdtFormatoCLELEMENTO2: TStringField;
    qOdtFormatoCODIGOODT: TFloatField;
    qOdtFormatoCONSECUTIVOODT: TFloatField;
    qOdtFormatoCODIGOHOJAVIDAEQUIPO: TFloatField;
    qOdtFormatoCODIGOMANTENIMIENTO: TFloatField;
    qOdtFormatoNombreFormato: TStringField;
    updOdtFormato: TUpdateSQL;
    dsOdtFormato: TDataSource;
    qOdtSeccion: TQuery;
    qOdtSeccionCODIGOSECCIONFORMATODATOS: TFloatField;
    qOdtSeccionCODIGOFORMATOMTTODATOS: TFloatField;
    qOdtSeccionCODIGOSECCIONFORMATO: TFloatField;
    qOdtSeccionCODIGOODT: TFloatField;
    qOdtSeccionSUBACTIVIDADODT: TFloatField;
    qOdtSeccionESTADOTERMINADO: TStringField;
    qOdtSeccionFECHAREGISTRO: TDateTimeField;
    qOdtSeccionFECHAMODIFICACION: TDateTimeField;
    qOdtSeccionFECHAPRUEBA: TDateTimeField;
    qOdtSeccionCODIGOUSUARIOCREACION: TFloatField;
    qOdtSeccionCODIGOUSUARIOMODIFICACION: TFloatField;
    qOdtSeccionCODIGOHOJAVIDAEQUIPO: TFloatField;
    qOdtSeccionNombreSeccion: TStringField;
    dsOdtSeccion: TDataSource;
    updOdtSeccion: TUpdateSQL;
    RxDBGrid2: TRxDBGrid;
    DBNavigator10: TDBNavigator;
    DBNavigator11: TDBNavigator;
    ToolBar2: TToolBar;
    ToolButton5: TToolButton;
    tbGenerarAsignacionMovil: TToolButton;
    tbtbCopiarAsignacionMovil: TToolButton;
    tbCopiarAsignacionEquipo: TToolButton;
    tbImportarAsignacion: TToolButton;
    ToolButton7: TToolButton;
    ToolButton6: TToolButton;
    GroupBox3: TGroupBox;
    SpeedButtonFechaInicio: TSpeedButton;
    LFechaInicioTrbajo: TLabel;
    LFechaFinalTrabajo: TLabel;
    SpeedButtonFechaTerminacion: TSpeedButton;
    dbeFechaFinal: TDBEdit;
    dbeFechaInicio: TDBEdit;
    Label14: TLabel;
    DBEdit23: TDBEdit;
    DBLookupComboBox10: TDBLookupComboBox;
    dbrgEnergizado: TDBRadioGroup;
    qODTHijaCODIGOESTADOODTDIA: TStringField;
    bAprobacionCire: TRxSpeedButton;
    qEstadoODT: TQuery;
    dsEstadoODT: TDataSource;
    dbgMateriales: TRxDBGrid;
    DBNavigatorMaterial: TDBNavigator;
    lbAprobacionCire: TLabel;
    bCerrar: TBitBtn;
    qODTHijaOBSERVACION1: TMemoField;
    qODTHijaOBSERVACION2: TMemoField;
    qODTHijaREVISIONCOORDINADOR: TStringField;
    DBRevisionCoordinador: TDBCheckBox;
    DBEdit4: TDBEdit;
    Exportarasignacinvaca1: TMenuItem;
    pcElementosTrabajo: TPageControl;
    tsElementosDistribucion: TTabSheet;
    tsElementosComercial: TTabSheet;
    Panel90: TPanel;
    PanelTituloPlancha: TPanel;
    Panel92: TPanel;
    SpeedButton24: TSpeedButton;
    SpeedButton25: TSpeedButton;
    SpeedButton26: TSpeedButton;
    SpeedButton27: TSpeedButton;
    SpeedButton28: TSpeedButton;
    SpeedButton29: TSpeedButton;
    RxDBGrid10: TRxDBGrid;
    DBNavigator12: TDBNavigator;
    Panel76: TPanel;
    Panel77: TPanel;
    Panel78: TPanel;
    sbImagenTrafo: TSpeedButton;
    sbTrafoVistalateral: TSpeedButton;
    sbTrafoCartografia: TSpeedButton;
    sbBuscarTrafodis: TSpeedButton;
    sbBuscarTrafodisCartografia: TSpeedButton;
    sbBuscarTrafodisLista: TSpeedButton;
    dbgTrafoDis: TRxDBGrid;
    DBNavigator8: TDBNavigator;
    Panel11: TPanel;
    Panel74: TPanel;
    sbImagenApoyo: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    sbBuscarApoyo: TSpeedButton;
    sbBuscarApoyoCartografia: TSpeedButton;
    sbSeleccionarApoyosTopologia: TSpeedButton;
    SpeedButton2: TSpeedButton;
    dbgApoyo: TRxDBGrid;
    DBNavigator7: TDBNavigator;
    pImagenTrafo: TPanel;
    pTitulo: TPanel;
    DBEdit29: TDBEdit;
    Panel12: TPanel;
    RxSpinButton1: TRxSpinButton;
    clbFases: TCheckListBox;
    Panel75: TPanel;
    Panel80: TPanel;
    sbVerMaterialesTrafo: TSpeedButton;
    SpeedButton7: TSpeedButton;
    Panel81: TPanel;
    DbzImage1: TdDbzImage;
    PImagenApoyo: TPanel;
    Panel83: TPanel;
    DBEdit30: TDBEdit;
    Panel84: TPanel;
    RxSpinButton2: TRxSpinButton;
    CheckListBox1: TCheckListBox;
    Panel85: TPanel;
    Panel86: TPanel;
    bVerMaterialesApoyo: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Panel87: TPanel;
    dDbzImage2: TdDbzImage;
    qOdtPlancha: TQuery;
    qOdtPlanchaCODIGOODT: TFloatField;
    qOdtPlanchaCONSECUTIVO: TFloatField;
    qOdtPlanchaCODIGOPLANCHA: TStringField;
    dsOdtPlancha: TDataSource;
    UpdateSQL1: TUpdateSQL;
    panel79: TPanel;
    ExportarDatosdetrafosyplanchas1: TMenuItem;
    ExportardatosdeApoyosyplanchas1: TMenuItem;
    Exportardatosdetrafosapoyosyplanchas1: TMenuItem;
    Exportardatosdeplanchasrelacionadas1: TMenuItem;
    rsbOW: TRxSpeedButton;
    qPresMateCodigoMaterialOW: TStringField;
    sbCancelarODTHija: TSpeedButton;
    bbBorrarAsignExp: TBitBtn;
    BitBtn2: TBitBtn;
    spF3: TSpeedButton;
    spf4: TSpeedButton;
    gnGestionTransformadores: TGroupBox;
    dbcbf3: TDBCheckBox;
    dbcbf4: TDBCheckBox;
    qF3: TQuery;
    dsf3: TDataSource;
    qF3CODIGOODT: TFloatField;
    qF3CONSECUTIVO: TFloatField;
    qF3CODIGOGESTIONADMINISTRATIVA: TFloatField;
    qF4: TQuery;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    dsF4: TDataSource;
    qF4ESTADO: TStringField;
    qF3ESTADO: TStringField;
    usqlF3: TUpdateSQL;
    usqlF4: TUpdateSQL;
    DBCheckBox3: TDBCheckBox;
    qInfraestructura: TQuery;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    StringField4: TStringField;
    dsInfraestructura: TDataSource;
    usqlInfraestructura: TUpdateSQL;
    qOdtTrafodisf3: TStringField;
    qOdtTrafodisf4: TStringField;
    dbcbEquipos: TDBCheckBox;
    qUtilizaEquipos: TQuery;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    StringField5: TStringField;
    dsUtilizaEquipos: TDataSource;
    usqlUtilizaEquipos: TUpdateSQL;
    qReintegros: TQuery;
    qReintegrosCODIGOODT: TFloatField;
    qReintegrosCONSECUTIVO: TFloatField;
    qReintegrosCIAS_CIAS: TFloatField;
    qReintegrosCOD_ALMACEN: TStringField;
    qReintegrosCOD_BODEGA: TStringField;
    qReintegrosCODIGOREINTEGRO: TFloatField;
    qReintegrosESTADO: TStringField;
    qReintegrosCIAS_DESCRI: TStringField;
    qReintegrosALMACEN_DESCRI: TStringField;
    qReintegrosBODEGA_DESCRI: TStringField;
    dsReintegros: TDataSource;
    Panel4: TPanel;
    DBGrid2: TDBGrid;
    Panel5: TPanel;
    sbAgregarReintegro: TSpeedButton;
    sbEditarReintegro: TSpeedButton;
    sbImprimirReintegro: TSpeedButton;
    sbEliminarReintegro: TSpeedButton;
    tsComercial: TTabSheet;
    TabSheet1: TTabSheet;
    qODTAlumbradoPublico: TQuery;
    qODTAlumbradoPublicoCODIGOODT: TFloatField;
    qODTAlumbradoPublicoCONSECUTIVO: TFloatField;
    qODTAlumbradoPublicoCODIGOALUMBRADOPUBLICO: TFloatField;
    qODTAlumbradoPublicoPintadoApoyo: TStringField;
    qODTAlumbradoPublicoCodigoActual: TStringField;
    qODTAlumbradoPublicoCodigoApoyo: TIntegerField;
    dsODTAlumbradoPublico: TDataSource;
    UpdODTAlumbradoPublico: TUpdateSQL;
    qOdtClieentesgd: TQuery;
    StringField6: TStringField;
    IntegerField1: TIntegerField;
    dsOdtClieentesgd: TDataSource;
    UpdOdtClieentesgd: TUpdateSQL;
    Panel21: TPanel;
    pLuminarias: TPanel;
    Panel6: TPanel;
    SpeedButton5: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    RxDBGrid11: TRxDBGrid;
    DBNavigator13: TDBNavigator;
    Panel13: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    SpeedButton23: TSpeedButton;
    SpeedButton30: TSpeedButton;
    SpeedButton31: TSpeedButton;
    SpeedButton32: TSpeedButton;
    RxDBGrid12: TRxDBGrid;
    DBNavigator14: TDBNavigator;
    qOdtClieentesgdCODIGOODT: TFloatField;
    qOdtClieentesgdCONSECUTIVO: TFloatField;
    qOdtClieentesgdCODIGOCLIENTESGD: TFloatField;
    qOdtClieentesgdCODIGOCUENTA: TFloatField;
    qSerial: TQuery;
    dsSerial: TDataSource;
    usqlSerial: TUpdateSQL;
    Panel20: TPanel;
    dbgSerial: TRxDBGrid;
    DBNavigator15: TDBNavigator;
    qAlmSerial: TQuery;
    qAlmSerialCODIGOMATERIAL: TFloatField;
    qAlmSerialSERIAL: TStringField;
    qAlmSerialCIAS_CIAS: TFloatField;
    qAlmSerialCOD_ALMACEN: TStringField;
    qAlmSerialCOD_BODEGA: TStringField;
    qAlmSerialCODIGOADMINISTRATIVO: TFloatField;
    qAlmSerialCODIGOGRUPOTRABAJO: TFloatField;
    qAlmSerialCODIGOCOMPRA: TFloatField;
    qAlmSerialCODIGOTIPOELEMENTO: TStringField;
    qAlmSerialCODIGOAPOYO: TFloatField;
    qAlmSerialCODIGOELEMENTO: TFloatField;
    qAlmSerialACTIVO: TStringField;
    qAlmSerialCODIGOSERIALTERCERO: TFloatField;
    qAlmSerialESTADO: TStringField;
    qAlmSerialCODIGOEMPLEADO: TFloatField;
    qAlmSerialCODIGOESTADOSERIAL: TFloatField;
    UpdAlmSerial: TUpdateSQL;
    qSerialCODIGOODT: TFloatField;
    qSerialCONSECUTIVO: TFloatField;
    qSerialCOD_CATALOGO: TFloatField;
    qSerialCODIGOTIPOELEMENTO: TStringField;
    qSerialCODIGOELEMENTO: TFloatField;
    qSerialSERIAL: TStringField;
    qSerialESTADO: TStringField;
    ImageList2: TImageList;
    ImageList3: TImageList;
    qRequisicionesPROCESO: TStringField;
    qODTHijaDESCRIPCIONTIPOPREDIO: TMemoField;
    Zip: TZipForge;
    procedure FormCreate(Sender: TObject);
    procedure qODTCODIGOGEOGRAFICOValidate(Sender: TField);
    procedure dMenuCIGSelectID(Sender: tnMenuItem; ID: Integer;
      MenuEstructura: tMenuEs);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ArbolChange(Sender: TObject; Node: TTreeNode);
    procedure DBGridMedidasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure sbFechaEmisionClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sbAprobadoClick(Sender: TObject);
    procedure sbRevisadoClick(Sender: TObject);
    procedure sbEjecutadoClick(Sender: TObject);
    procedure qODTVehiculoAfterPost(DataSet: TDataSet);
    procedure qODTAfterInsert(DataSet: TDataSet);
    procedure qODTVehiculoAfterInsert(DataSet: TDataSet);
    procedure DBGridReportesEditButtonClick(Sender: TObject);
    procedure qReporteAfterInsert(DataSet: TDataSet);
    procedure qReporteAfterPost(DataSet: TDataSet);
    procedure qReporteAfterDelete(DataSet: TDataSet);
    procedure qPresManoAfterInsert(DataSet: TDataSet);
    procedure DBGridManoObraEditButtonClick(Sender: TObject);
    procedure SpeedButtonFechaInicioClick(Sender: TObject);
    procedure SpeedButtonFechaTerminacionClick(Sender: TObject);
    procedure qPresManoAfterPost(DataSet: TDataSet);
    procedure qPresManoAfterDelete(DataSet: TDataSet);
    procedure qPresMateAfterInsert(DataSet: TDataSet);
    procedure DBGridMaterialEditButtonClick(Sender: TObject);
    procedure qPresMateAfterPost(DataSet: TDataSet);
    procedure qPresMateAfterDelete(DataSet: TDataSet);
    procedure sbModificarStockClick(Sender: TObject);
    procedure DBGridMaterialDblClick(Sender: TObject);
    procedure qPresMateUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qPresMateCalcFields(DataSet: TDataSet);
    procedure sbCostoManoObraClick(Sender: TObject);
    procedure qPresManoUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qPresManoHORASNORMALESValidate(Sender: TField);
    procedure qPresManoEXTRASDIURNASValidate(Sender: TField);
    procedure qPresManoEXTRASNOCTURNASValidate(Sender: TField);
    procedure qODTFECHAINICIOTRABAJOChange(Sender: TField);
    procedure ArbolChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure RxSpeedButton3Click(Sender: TObject);
    procedure qODTFECHAFINALTRABAJOChange(Sender: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbCancelarClick(Sender: TObject);
    procedure bbAceptarClick(Sender: TObject);
    procedure qODTHijaCODIGOGEOGRAFICOValidate(Sender: TField);
    procedure qODTHijaCalcFields(DataSet: TDataSet);
    procedure qODTPadreFECHAASIGNACIONValidate(Sender: TField);
    procedure qODTFECHAAPROBACIONValidate(Sender: TField);
    procedure qODTHijaFECHAINICIOTRABAJOValidate(Sender: TField);
    procedure qODTHijaFECHAFINALTRABAJOValidate(Sender: TField);
    procedure qODTHijaCOSTOMATERIALValidate(Sender: TField);
    procedure qODTHijaCOSTOMANOOBRAValidate(Sender: TField);
    procedure qODTHijaCOSTOTRANSPORTEValidate(Sender: TField);
    procedure qODTHijaCOSTOEQUIPOValidate(Sender: TField);
    procedure qODTPadreCODIGOADMINISTRATIVOChange(Sender: TField);
    procedure qODTHijaAfterInsert(DataSet: TDataSet);
    procedure DBGridVehiculosEditButtonClick(Sender: TObject);
    procedure DBGridReportesDblClick(Sender: TObject);
    procedure qODTPadreCODIGOESTADOODTChange(Sender: TField);
    procedure qStockAfterPost(DataSet: TDataSet);
    procedure dblcbTipoElementoCloseUp(Sender: TObject);
    procedure dblcbTipoElementoDropDown(Sender: TObject);
    procedure dblcbSubestacionCloseUp(Sender: TObject);
    procedure bbImprimirClick(Sender: TObject);
    procedure GroupBox3DblClick(Sender: TObject);
    procedure menuFormatoActual1Click(Sender: TObject);
    procedure FormatoAnterior1Click(Sender: TObject);
    procedure qStockCANTIDADACTUALValidate(Sender: TField);
    procedure qODTActividadAfterInsert(DataSet: TDataSet);
    procedure qODTActividadCalcFields(DataSet: TDataSet);
    procedure qODTActividadAfterPost(DataSet: TDataSet);
    procedure qODTActividadUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    function EditarODT:Boolean;
    procedure FormShow(Sender: TObject);
    procedure qODTActividadAfterDelete(DataSet: TDataSet);
    procedure qODTHijaCODIGOGRUPOTRABAJOChange(Sender: TField);
    procedure qMedidaSeguridadAfterPost(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure qODTApoyoAfterPost(DataSet: TDataSet);
    procedure qODTApoyoAfterDelete(DataSet: TDataSet);
    procedure qODTApoyoAfterInsert(DataSet: TDataSet);
    procedure qODTApoyoPINTADOAPOYOValidate(Sender: TField);
    procedure qODTApoyoUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure sbBuscarCIGClick(Sender: TObject);
    procedure DBEdit5Change(Sender: TObject);
    procedure DBEdit5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TrasladarReporte1Click(Sender: TObject);
    procedure qReporteCODIGOREPORTEValidate(Sender: TField);
    procedure qPresManoBeforeDelete(DataSet: TDataSet);
    procedure qODTPadreCODIGOODTTIPOMANOOBRAValidate(Sender: TField);
    procedure qPresManoCODIGOEMPLEADOValidate(Sender: TField);
    //procedure btnRequisicionClick(Sender: TObject);
    procedure sbAgregarRequisicionClick(Sender: TObject);
    procedure sbEditarRequisicionClick(Sender: TObject);
    procedure sbImprimirRequisicionClick(Sender: TObject);
    procedure qODTHijaCODIGOTIPOACTIVOValidate(Sender: TField);
    procedure qODTHijaCODIGOTIPOTRABAJOODTValidate(Sender: TField);
    procedure qODTHijaCODIGOGEOGRAFICOChange(Sender: TField);
    procedure sbDevolucionesClick(Sender: TObject);
    procedure sbCrearIntervencionClick(Sender: TObject);
    procedure sbEditarIntervencionClick(Sender: TObject);
    procedure sbEliminarRequisicionClick(Sender: TObject);
    procedure qPresMateCANTIDADREINTEGRADAMALAValidate(Sender: TField);
    procedure qPresMateCANTIDADREINTEGRADABUENAValidate(Sender: TField);
    procedure qODTHijaCODIGOLINEAValidate(Sender: TField);
    procedure DBLookupComboBox3Click(Sender: TObject);
    procedure qODTHijaCODIGOCIRCUITOValidate(Sender: TField);
    procedure qODTHijaCODIGOSUBESTACIONValidate(Sender: TField);
    procedure dblcbSubestacionClick(Sender: TObject);
    procedure DBLookupComboBox6Click(Sender: TObject);
    procedure qODTHijaCODIGOTIPOINTERVENCIONValidate(Sender: TField);
    procedure qOdtSubactividadDatosPROGRAMADAChange(Sender: TField);
    procedure qOdtSubactividadDatosEJECUTADAChange(Sender: TField);
    procedure qOdtSubactividadDatosAfterDelete(DataSet: TDataSet);
    procedure qOdtSubactividadDatosAfterPost(DataSet: TDataSet);
    procedure qdatosSubactividadAfterDelete(DataSet: TDataSet);
    procedure qdatosSubactividadAfterPost(DataSet: TDataSet);
    procedure CalcularPorcentajes;
    procedure dbgMaterialesDblClick(Sender: TObject);
    procedure dbgMaterialesEditButtonClick(Sender: TObject);
    procedure qPresMateAfterScroll(DataSet: TDataSet);
    procedure qPresMateBeforeDelete(DataSet: TDataSet);
    procedure qPresMateCANTIDADCONSUMIDAValidate(Sender: TField);
    procedure qPresMateCANTIDADCONSUMIDADESMANTELADAValidate(
      Sender: TField);
    procedure qPresMateCANTIDADREINTEGRADABUENADESMANValidate(
      Sender: TField);
    procedure qPresMateCANTIDADREINTEGRADAMALADESMANValidate(
      Sender: TField);
    procedure sbAgregarTrasladoClick(Sender: TObject);
    procedure sbEliminarTrasladoClick(Sender: TObject);
    procedure sbEditarTrasladoClick(Sender: TObject);
    procedure sbImprimirTrasladoClick(Sender: TObject);
    procedure pcMaterialChange(Sender: TObject);
    procedure RxSpeedButton10Click(Sender: TObject);
    procedure qPresMateCANTIDADRETIRADABUENAValidate(Sender: TField);
    procedure qPresMateCANTIDADRETIRADAMALAValidate(Sender: TField);
    procedure qAdministrativoAfterScroll(DataSet: TDataSet);
    procedure RxSpeedButton11Click(Sender: TObject);
    procedure qEventoAPCODIGOAPOYOValidate(Sender: TField);
    procedure qEventoAPCODIGONODOBTValidate(Sender: TField);
    procedure qEventoAPCODIGOOBSERVACIONValidate(Sender: TField);
    procedure dbgLamparaAPEditButtonClick(Sender: TObject);
    procedure dbgLamparaAPDblClick(Sender: TObject);
    procedure qEventoAPAfterPost(DataSet: TDataSet);
    procedure qAlumbradoPublicoAfterPost(DataSet: TDataSet);
    procedure qAlumbradoPublicoAfterDelete(DataSet: TDataSet);
    procedure qEventoAPAfterDelete(DataSet: TDataSet);
    procedure qEventoAPCODIGOACTIVIDADChange(Sender: TField);
    procedure qEventoAPCODIGOTIPOACTIVIDADChange(Sender: TField);
    procedure qEventoAPCODIGOESTRUCTURAValidate(Sender: TField);
    procedure qEventoAPBeforePost(DataSet: TDataSet);
    procedure dMenuEstructuraSelectCIE(Sender: tnMenuItem; CIE: Integer;
      MenuEstructura: tMenuEs);
    procedure dMenuObservacionSelectCIE(Sender: tnMenuItem; CIE: Integer;
      MenuEstructura: tMenuEs);
    procedure sbVistaLateralOdtClick(Sender: TObject);
    procedure sbBuscarApoyoCartografiaClick(Sender: TObject);
    procedure sbVerCartografiaClick(Sender: TObject);
    procedure qODTApoyoCalcFields(DataSet: TDataSet);
    procedure FormatoAP1Click(Sender: TObject);
    procedure TrabajosAPRealizados1Click(Sender: TObject);
    procedure PartePosteriorFormatoAnterior1Click(Sender: TObject);
    procedure qOdtTrafodisAfterDelete(DataSet: TDataSet);
    procedure qOdtTrafodisAfterPost(DataSet: TDataSet);
    procedure qOdtTrafodisAfterInsert(DataSet: TDataSet);
    procedure qOdtTrafodisCalcFields(DataSet: TDataSet);
    procedure qOdtTrafodisUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qOdtTrafodisPINTADOTRAFODISValidate(Sender: TField);
    procedure qODTHijaCODIGOCONTRATISTAINTERVENIDOChange(Sender: TField);
    procedure qPresMateAfterEdit(DataSet: TDataSet);
    procedure qContratoIntervenidoBeforeOpen(DataSet: TDataSet);
    procedure qOdtClienteSgdAfterPost(DataSet: TDataSet);
    procedure qOdtClienteSgdAfterDelete(DataSet: TDataSet);
    procedure qOdtClienteSgdAfterInsert(DataSet: TDataSet);
    procedure qMedidaSeguridadESTADOSetText(Sender: TField;
      const Text: String);
    procedure qMedidaSeguridadESTADOGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qPresManoBeforeInsert(DataSet: TDataSet);
    procedure SpeedButton22Click(Sender: TObject);
    procedure qPresManoCalcFields(DataSet: TDataSet);
    procedure qODTPadreCalcFields(DataSet: TDataSet);
    procedure sbCierreStockClick(Sender: TObject);
    procedure qODTHijaAfterPost(DataSet: TDataSet);
    procedure qPresMateCODIGOMATERIALValidate(Sender: TField);
    procedure qPresMateBeforeInsert(DataSet: TDataSet);
    procedure qPresMateBeforePost(DataSet: TDataSet);
    procedure qODTVehiculoUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qReporteUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure DBEdDatoNumericoKeyPress(Sender: TObject; var Key: Char);
    procedure qODTHijaCODIGOODTOPERAValidate(Sender: TField);
    procedure qODTHijaCODIGOTIPOELEMENTOValidate(Sender: TField);
    procedure qODTHijaCODIGONIVELTENSIONValidate(Sender: TField);
    procedure tbVerPanelInfraestructuraClick(Sender: TObject);
    procedure tbVerCartografiaClick(Sender: TObject);
    procedure tbVerVistalateralClick(Sender: TObject);
    procedure Verelementoactual1Click(Sender: TObject);
    procedure Verelementosseleccionados1Click(Sender: TObject);
    procedure Vertodosloselementos1Click(Sender: TObject);
    procedure qGestionInfraestructuraAfterScroll(DataSet: TDataSet);
    procedure qGestionInfraestructuraAfterOpen(DataSet: TDataSet);
    procedure qGestionInfraestructuraCalcFields(DataSet: TDataSet);
    procedure qApoyoElementoCalcFields(DataSet: TDataSet);
    procedure qImagenesAfterOpen(DataSet: TDataSet);
    procedure DBMemoDanosKeyPress(Sender: TObject; var Key: Char);
    procedure sbVistaLateralTrafosClick(Sender: TObject);
    procedure ValidarInformacin1Click(Sender: TObject);
    procedure RxDBGrid1EditButtonClick(Sender: TObject);
    procedure dbgEquipoEditButtonClick(Sender: TObject);
    procedure dbgEquipoDblClick(Sender: TObject);
    procedure AbrirCartografaVistaLateral1Click(Sender: TObject);
    procedure qPresEquipoAfterPost(DataSet: TDataSet);
    procedure qPresEquipoAfterDelete(DataSet: TDataSet);
    procedure qPresEquipoAfterInsert(DataSet: TDataSet);
    procedure qPresEquipoCalcFields(DataSet: TDataSet);
    procedure qPresEquipoCODIGOEQUIPOChange(Sender: TField);
    procedure qODTHijaFECHAINICIOTRABAJOChange(Sender: TField);
    procedure qODTHijaFECHAFINALTRABAJOChange(Sender: TField);
    procedure qODTHijaCODIGOTIPOTRABAJOODTSetText(Sender: TField;
      const Text: String);
    procedure DBGrid1EditButtonClick(Sender: TObject);
    procedure qODTVehiculoAfterDelete(DataSet: TDataSet);
    procedure qODTPadreCODIGOMODOODTValidate(Sender: TField);
    procedure tbMovilCancelarClick(Sender: TObject);
    procedure tbMovilCartografiaClick(Sender: TObject);
    procedure tvElementosExportacionChange(Sender: TObject; Node: TTreeNode);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure FormDestroy(Sender: TObject);
    procedure tsMovilExportacionShow(Sender: TObject);
    procedure tsMovilImportacionShow(Sender: TObject);
    procedure qPresMateCANTIDADSOLICITADAValidate(Sender: TField);
    procedure qODTPadreAfterOpen(DataSet: TDataSet);
    procedure qEventoAPAfterScroll(DataSet: TDataSet);
    procedure sbVerTrafoCartografiaClick(Sender: TObject);
    procedure sbImagenTrafoClick(Sender: TObject);
    procedure dbgTrafoDisDblClick(Sender: TObject);
    procedure dbgTrafoDisEditButtonClick(Sender: TObject);
    procedure dbgApoyoEditButtonClick(Sender: TObject);
    procedure sbImagenApoyoClick(Sender: TObject);
    procedure sbVerMaterialesTrafoClick(Sender: TObject);
    procedure SeleccionarApoyosdeListado1Click(Sender: TObject);
    procedure qODTVehiculoCalcFields(DataSet: TDataSet);
    procedure sbBuscarTrafodisClick(Sender: TObject);
    procedure sbBuscarTrafodisCartografiaClick(Sender: TObject);
    procedure sbBuscarTrafodisListaClick(Sender: TObject);
    procedure sbBuscarApoyoClick(Sender: TObject);
    procedure sbSeleccionarApoyosTopologiaClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ListadodeNodosdeMediaTensin1Click(Sender: TObject);
    procedure ListadodeNodosdeBajaTensin1Click(Sender: TObject);
    procedure ListadodeDetalledeApoyos1Click(Sender: TObject);
    procedure ListadodeTempletesdeApoyo1Click(Sender: TObject);
    procedure ListadodeTramosdeMediaTensin1Click(Sender: TObject);
    procedure ListadodeTransformadoresdeDistribucin1Click(Sender: TObject);
    procedure ListadodeInterruptoresdeDistribucin1Click(Sender: TObject);
    procedure ListadodePararrayosdeDistribucin1Click(Sender: TObject);
    procedure ListadodeTramosdeBajaTensin1Click(Sender: TObject);
    procedure ListadodeLamparas1Click(Sender: TObject);
    procedure ListasdeExcavacionesdeDistribucin1Click(Sender: TObject);
    procedure ListasdeDuctosdeExcavaciones1Click(Sender: TObject);
    procedure ListadodeCondensadores1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ExportarDatosdeCircuito1Click(Sender: TObject);
    procedure ExportarDatosdeTrafosasociados1Click(Sender: TObject);
    procedure ExportarDatosdeapoyosrelacionados1Click(Sender: TObject);
    procedure ExportarDatosdeTrafosyapoyosrelacionados1Click(
      Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure bExportarAsignacionEMGClick(Sender: TObject);
    procedure qCircuitoBeforeOpen(DataSet: TDataSet);
    procedure MaterialesdelApoyo1Click(Sender: TObject);
    procedure MaterialesdelaLuminaria1Click(Sender: TObject);
    procedure bVerMaterialesApoyoClick(Sender: TObject);
    procedure qODTHijaCODIGOGRUPOTRABAJOValidate(Sender: TField);
    procedure RxDBGrid3DblClick(Sender: TObject);
    procedure RxDBGrid3EditButtonClick(Sender: TObject);
    procedure qOdtFormatoAfterDelete(DataSet: TDataSet);
    procedure qOdtFormatoAfterEdit(DataSet: TDataSet);
    procedure qOdtFormatoAfterInsert(DataSet: TDataSet);
    procedure qOdtFormatoAfterPost(DataSet: TDataSet);
    procedure qOdtFormatoCalcFields(DataSet: TDataSet);
    procedure qOdtSeccionAfterDelete(DataSet: TDataSet);
    procedure qOdtSeccionAfterEdit(DataSet: TDataSet);
    procedure qOdtSeccionAfterInsert(DataSet: TDataSet);
    procedure qOdtSeccionAfterPost(DataSet: TDataSet);
    procedure qOdtSeccionCalcFields(DataSet: TDataSet);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid2EditButtonClick(Sender: TObject);
    procedure tbGenerarAsignacionMovilClick(Sender: TObject);
    procedure tbtbCopiarAsignacionMovilClick(Sender: TObject);
    procedure tbCopiarAsignacionEquipoClick(Sender: TObject);
    procedure tbImportarAsignacionClick(Sender: TObject);
    procedure pmExportarEMGChange(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure qODTHijaCODIGOESTADOODTDIAChange(Sender: TField);
    procedure qODTHijaCODIGOESTADOODTDIAValidate(Sender: TField);
    procedure bAprobacionCireClick(Sender: TObject);
    procedure qODTHijaAfterOpen(DataSet: TDataSet);
    procedure bCerrarClick(Sender: TObject);
    procedure Exportarasignacinvaca1Click(Sender: TObject);
    procedure SpeedButton27Click(Sender: TObject);
    procedure SpeedButton28Click(Sender: TObject);
    procedure qOdtPlanchaAfterDelete(DataSet: TDataSet);
    procedure qOdtPlanchaAfterInsert(DataSet: TDataSet);
    procedure qOdtPlanchaAfterOpen(DataSet: TDataSet);
    procedure qOdtPlanchaAfterPost(DataSet: TDataSet);
    procedure Exportardatosdeplanchasrelacionadas1Click(Sender: TObject);
    procedure ExportarDatosdetrafosyplanchas1Click(Sender: TObject);
    procedure Exportardatosdetrafosapoyosyplanchas1Click(Sender: TObject);
    procedure ExportardatosdeApoyosyplanchas1Click(Sender: TObject);
    procedure rsbOWClick(Sender: TObject);
    procedure sbCancelarODTHijaClick(Sender: TObject);
    procedure bbBorrarAsignExpClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure spF3Click(Sender: TObject);
    procedure spf4Click(Sender: TObject);
    procedure qF3AfterPost(DataSet: TDataSet);
    procedure qF4AfterPost(DataSet: TDataSet);
    procedure qInfraestructuraAfterPost(DataSet: TDataSet);
    procedure qUtilizaEquiposAfterPost(DataSet: TDataSet);
    procedure qOdtTrafodisBeforeInsert(DataSet: TDataSet);
    procedure qF3ESTADOValidate(Sender: TField);
    procedure qF4ESTADOValidate(Sender: TField);
    procedure qF3ESTADOChange(Sender: TField);
    procedure qF4ESTADOChange(Sender: TField);
    procedure qF3AfterOpen(DataSet: TDataSet);
    procedure qF4AfterOpen(DataSet: TDataSet);
    procedure qOdtTrafodisBeforeDelete(DataSet: TDataSet);
    procedure qOdtTrafodisBeforeEdit(DataSet: TDataSet);
    procedure sbAgregarReintegroClick(Sender: TObject);
    procedure sbEliminarReintegroClick(Sender: TObject);
    procedure sbEditarReintegroClick(Sender: TObject);
    procedure sbImprimirReintegroClick(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure SpeedButton14Click(Sender: TObject);
    procedure SpeedButton15Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure qOdtClieentesgdAfterDelete(DataSet: TDataSet);
    procedure qOdtClieentesgdAfterInsert(DataSet: TDataSet);
    procedure qOdtClieentesgdAfterPost(DataSet: TDataSet);
    procedure qOdtClieentesgdCalcFields(DataSet: TDataSet);
    procedure qOdtClieentesgdUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure SpeedButton20Click(Sender: TObject);
    procedure dbgSerialEditButtonClick(Sender: TObject);
    procedure qSerialAfterDelete(DataSet: TDataSet);
    procedure qSerialAfterPost(DataSet: TDataSet);
    procedure qSerialBeforeDelete(DataSet: TDataSet);
    procedure qAlmSerialAfterPost(DataSet: TDataSet);

  private
    { Private declarations }
    bInsertandoMateriales, bPermiteGestionMATERIALES: Boolean;
    DatoAnterior:TDatoAP;
    Codigoestadoanterior, dblinkOW :string;
  // nuevo infraestructura   --Paola
    ListaTrafodis,PosicionApoyos,ListaTmpApoyos,ListaApoyos, ListaTramos, ListaNodos, ListaNodosBT, ListaElementos,
    ListaColores,ListaClientes: Tstringlist;
    EstiloDibujado  : Integer;
    LoadNodoMT, LoadNodoBT, LoadTramoMT, LoadTramoBT, LoadTrafoDis,
    LoadInterruptor, LoadCondensador, LoadPararrayoDis,  LoadLamparaAP, LoadCliente,
    LoadDetalleApoyo, LoadExcavacion, GrafoActivo, InicioODTHija: Boolean;
    insertandorequisicion,aprobarcire :boolean; //Indica si se esta agregando una nueva requisicion, solo es true en este caso.
    DirectorioFoto,FDirectorioFoto: string;
    codtipotrabajoanterior:string;
    slArbol:TStringList;
    ExportacionExitosa:boolean;
    ActivarValidacionGrupotrabajo:boolean;
    fechaservidoractual:tdatetime;
    procedure GuardarTransaccion;
    Function RutaAsignacionMovil:string;
    Function DirectorioAsignacionMovil:string;
    procedure CalcularCostos;
    function FechaServidor: string;
    procedure GuardarDatosActuales;
    procedure HabilitarControles(codigo,nodo,uso,conexiones,cie,observacion,cuenta:boolean);
    function ValorAuxiliosEmpleadoOdt(CodigoEmpleado,CodigoOdt:string): double;
    function ValorViaticosEmpleadoOdt(CodigoEmpleado,CodigoOdt:string): double;
    function ListarApoyosVer(Modo:integer):tstringlist;
    procedure VisualizarApoyos(ListaApoyosVisualizar:tstringlist);
    procedure MinimizarOdtHija;
    procedure GenerarShapes;
    function GenerarAsignacionOracle(tipo,strafos:string):boolean;
    function ValidarExisteRequisicionMaterial:boolean;
    procedure ActualizarOdtDesdeMovil;
    procedure ActualizarMaterialDesdeMovil;
    procedure VisualizarMaterialAlmacen(ver:boolean);
    procedure ValidacionesExportacionMovil;
    procedure VisualizarModoOdt(modo:integer);
    procedure VisualizacionEventoAP;
    procedure ValidarCambioMateriales;
    function MensajeEstadoCire(mostrar:boolean=true):string;
    function VERIFICARODTPERMISOSEDITAR(PERMISO:string): Boolean;
    function booltostr(A: boolean):string;
    function ValidarCancelacionODTHija(nombreTabla, nombreMostrar : String; tipo : Integer) : Boolean;
    procedure ValidarExisteF3F4;
    function ExisteF3(codTrafo : String = '') : Boolean;
    function ExisteF4(codTrafo : String = '') : Boolean;
    procedure IngresarMaterialAjuste;
    Function  ValidarAjusteStock:boolean;
    function BorrarODTHija(pCodigoODT, pConsecutivo: string): Boolean;
    procedure PermitirGestionarMATERIALES(pEstado: Boolean);
    procedure ActualizarCantidadReservada;
  public
    { Public declarations }
    bEsHijaNueva: Boolean;
    IdSesion:double;
    ConsumoAnterior, Reintegrodesmanteladobueno, Reintegrodesmanteladomalo: double; // variable para almacenar el valor anterior en el consumo
    consumidonuevo, consumidodesmantelado, Reintegronuevobueno, Reintegronuevomalo: double;
    CANTIDADRETIRADAMALA, CANTIDADRETIRADABUENA, CantidadMaterialStockDB, RETIRADABUENA, RETIRADAMALA, CantidadMaterialStockDM: DOUBLE;
    NombreUsuario: string;
    qtrans: TQuery;
    CopiarADispositivo: boolean;
    Crearintervencion,registrarMaterialesAP: boolean;
    sFecha, Fecha:string;
    Contratista: Boolean;
    GuardarEmpleado: Boolean;
    Empleado:DatosEmpleado;
    bDatosIncompletos, bCancelando: Boolean;
    NumeroVale:Integer;
    IntervencionCreada,MaterialModificado: boolean;
    permiso:boolean;
    TipoVisualizacion:TTipoVisualizacion;
    VistaInicio:boolean;
    BanderaStock:boolean;
    function GenerarAsignacionSdf:Boolean;
    procedure ActualizarStock;
    function  GenerarImpreso:string;
    function  GetFecha(Tipo:Boolean): String;
    procedure DatosIniciales;
    procedure CargarDatosEmpleados;
    procedure FormatoAnterior;
    procedure FormatoActual;
    procedure FormatoActualAP;
    procedure ActividadesODT;
    procedure VehiculosAnteriores;
    procedure PersonalAnterior;
    procedure MovilAnterior;
    function ValidacionActivo:boolean;
    procedure RegistrarDllImportar;
    function EditarMantenimiento:Boolean;
    function imprimirNotaIngenieria:Boolean;
    function  AnoActual:integer;
    function InsertarDetalleMaterial(codEvento,CodigoEstructura: double): boolean;
    function ValidarTipoAuditoriaStock(var mensaje:string):boolean;
    function ValidarTipoModificacionStock(tipotrabajo:string;var mensaje:string):boolean;
    procedure VisualizarModificacionStock(Visualiza:boolean);
    function ValidarPermisoModificacionStock(var mensaje:string):boolean;
// nuevo infraestructura
    procedure VerPanelEstructura(Nodo: tdPaintNode);
    Procedure OcultarPanelEstructura;
    Procedure MostrarVestido;
    Procedure VerFotosApoyo(Codigo: string);
    procedure CargarValoresPredeterminados;
    procedure VistaPreviaElementoActual;
    procedure CancelarAsignacionEMG;
    procedure AbrirConsultas;
    procedure llenarGestionAdministrativa;
//nuevo costos manoobra
    function ValidarFechasHija(Fecha:TDateTime):String;
    procedure ImportarAsignacionEMG;
    procedure ImportarAsignacionSdf;
    procedure GenerarAsignacionMovil(tipo:TTipoAsignacion);
    procedure VerMaterialesLuminaria;
    procedure verMaterialesApoyo;
    procedure ExportarAsignacionEMG(CopiarADispositivo:boolean);

  end;


const
   edLibre    = 0;
   edLineal   = 1;
   edDiagonal = 2;
   edRandom   = 3;

var
  FOdtUrbanaRural: TFOdtUrbanaRural;
implementation

uses uFuncionSGD, uBuscarEmpleado, uFormaFecha, uListaReportesODT,
  uBuscarMaterial, uListaODTUrbanaRural, uVehiculo, uReporte,
  uStockGrupoTrabajo, uQRODTUrbanaRural, uQRODTUrbanaRuralAdc,
  uActividadODT, ConsDll, uFiltroEmpleado, uCuentaCobro, uCIATraslado,
  uBuscarEmpleadoContratista, uRequisicionMateriales,uFIMPComunes,
  uQRRequisicionMateriales, uIntervencion, uQRODTDevoluciones,
  UFormatoMttoDatosODT, USeccionFormatoDatosODT, uCantidadesExistentes,
  uTraslado, uQRTraslado, uBuscarMaterialReintegro, uGrupoTrabajo,
  uLamparaAPODT,uComunesAdministrativo, uQRODTHijaAP, uQRODTTrabajosAP,
  uQRODTPadreAtras, uListaClienteSgdOdt, uSeleccionarGrupoTrabajo,
  uInformacionOdtHija, uListaStock, uFormaEspere, Interfaz_XML_TLB,
  uBuscarApoyo, uBuscarTrafoDis, uBuscarActividadOdt,
  uBuscarEquipo, udmTablasEMG, uMaterialesEstructura, uListaReportes, uSeleccionarSeccionMantenimiento,
  uSeleccionarFormatoMantenimiento, uInterfacesMovil, uInterfazOW, uFIMPAdministrativo,
  uReintegro, uBuscarClientes, uBuscarSerialMaterial;

{$R *.DFM}

procedure TFOdtUrbanaRural.FormCreate(Sender: TObject);
var
  i:integer;
  nodo:ttreenode;
  query: TQuery;
  sql:String;
begin
  //dblinkOW := '@DESA_APP_OW';
  bPermiteGestionMATERIALES:= True;
  bEsHijaNueva:= False;
  bInsertandoMateriales:= False;
  Qtrans:=TQuery.Create(nil);
  Qtrans.databasename:='BaseDato';
  Qtrans.sql.Clear;
  sql:='Select * from soe_evento where codigoevento=-1';
  Qtrans.sql.add(sql);
  Qtrans.Open;

  dblinkOW := DBLINKMATERIALES;
  VistaInicio:=true;
  EstiloDibujado  := edLineal;
  ListaTrafodis := TStringList.Create;
  PosicionApoyos:= TStringList.Create;
  ListaTmpApoyos:= TStringList.create;
  ListaApoyos:= TStringList.Create;
  ListaNodos:= TStringList.Create;
  ListaTramos:= TStringList.Create;
  ListaElementos:= TStringList.Create;
  ListaColores:= TStringList.Create;
  ListaNodosBT:= TStringList.Create;
  ListaClientes:=TstringList.create;
  Notebook.PageIndex:=0;
  slArbol:=TStringList.create;
  nodo:=Arbol.Items.GetFirstNode;
  for i := 0 to Arbol.Items.Count-1 do
  begin
    slArbol.Add(nodo.Text);
    nodo:=nodo.getNextSibling;
  end;
  GuardarEmpleado   := False;
  bCancelando       := False;
  NumeroVale        :=0;
  with Empleado do
  begin
    ExtrasDiurnas:=0;
    ExtrasNocturnas:=0;
    Viaticos:=0;
    Desayuno:=0;
    Almuerzo:=0;
    Comida:=0;
  end;
  RegistrarMaterialesAP:=False;
  dbCodigo.Color := clBtnFace;
  dbCodigo.Enabled := False;
  dbapoyo1.Color := clBtnFace;
  dbnodo1.Color := clBtnFace;
  dbapoyo1.Enabled := False;
  dbnodo1.Enabled := False;
  DBLCBUsoAlumbrado.Color := clBtnFace;
  DBLCBUsoAlumbrado.Enabled := False;
  DBCheckBox2.Enabled := False;
  DBCheckBox4.Enabled := False;
  DBCheckBox5.Enabled := False;
  DBCheckBox6.Enabled := False;
  dbCIE.Color := clBtnFace;
  dbCIE.Enabled := false;
  dbObservacion.Color := clBtnFace;
  dbObservacion.Enabled := false;
  dbCuenta.Color := clBtnFace;
  dbCuenta.Enabled := false;
  TipoVisualizacion:=mvNinguno;
  Arbol.Items[0].Selected:=true;
  AbrirConsultas;
  tbVerPanelInfraestructuraClick(nil);
  BanderaStock:=False;
  
 if qODTHijaCONSECUTIVO.AsFloat <> 0 then
 for i:=0 to ComponentCount - 1 do
 begin
  if  (Components[i] as TComponent).Tag = 9 then
    begin
       if  (Components[i] is TDBLookupComboBox) then
           TDBLookupComboBox(Components[i]).Color:=clSilver;
       if  (Components[i] is TEdit) then
           TEdit(Components[i]).Color:=clSilver;
       if  (Components[i] is TDBEdit) then
           TDBEdit(Components[i]).Color:=clSilver;

       (Components[i] as TControl).enabled:=False;
    end;
 end;
  dmTablasEMG:=TdmTablasEMG.Create(self);
  tadministrativo.Close;
  tadministrativo.StoreDefs:=false;
  tadministrativo.DatabaseName:=GetTemporalPath;
  tadministrativo.open;
  tadministrativo.Insert;
{  qEventoAP.close;
  qEventoAP.open;}

  RefrescarVariables;
  aprobarcire:=False;

  if (ProcManager.CanProcExecute('_Aprobar ODT hija CIRE'))or (VarCodigoUsuario =0) then
    aprobarcire:=true;

  ExportacionExitosa:= False;

  query:=TQuery.Create(nil);
  query.DatabaseName:='BaseDato';
  query.SQL.Text:= 'SELECT VALOR FROM PARAMETRO WHERE CODIGOPARAMETRO=''IPM''';
  query.Open;
  Host_SFTP := query.FieldByName('VALOR').AsString;
  query.Close;
  query.Free;
end;

procedure TFOdtUrbanaRural.qODTCODIGOGEOGRAFICOValidate(Sender: TField);
begin
  if Sender.Text <> '' then
  begin
    qCIG.Close;
    qCIG.Params[0].AsString:=Sender.Text;
    qCIG.Open;
    if qCIG.RecordCount = 0 then
      raise Exception.Create('Este Código Geográfico No Existe.')
  end;
end;

procedure TFOdtUrbanaRural.dMenuCIGSelectID(Sender: tnMenuItem;
  ID: Integer; MenuEstructura: tMenuEs);
begin
  qODTHija.FieldByName('CODIGOGEOGRAFICO').AsInteger:=ID;
end;

procedure TFOdtUrbanaRural.SpeedButton1Click(Sender: TObject);
begin
//  CapturarDireccion(qODTHija,dbeDireccion, False);
  DescripcionDireccion(qODTHija,dbeDireccion);
end;

procedure TFOdtUrbanaRural.ArbolChange(Sender: TObject; Node: TTreeNode);
begin
// Notebook.PageIndex:=node.index;
  if Node.Text='Información' then
    Notebook.PageIndex:=0
  else if Node.Text='Reportes' then
    Notebook.PageIndex:=1
  else if Node.Text='Programación' then
    Notebook.PageIndex:=2
  else if Node.Text='Mano Obra' then
    Notebook.PageIndex:=3
  else if Node.Text='Infraestructura' then
    Notebook.PageIndex:=4
  else if Node.Text='Materiales' then
    Notebook.PageIndex:=5
  else if Node.Text='Equipo' then
    Notebook.PageIndex:=6
  else if Node.Text='Actividades' then
    Notebook.PageIndex:=7
  else if Node.Text='Actividades AP' then
    Notebook.PageIndex:=8
  else if Node.Text='Observaciones' then
    Notebook.PageIndex:=9
  else if Node.Text='Pruebas' then
    Notebook.PageIndex:=10;
end;

procedure TFOdtUrbanaRural.DBGridMedidasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const IsChecked : array[Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin

end;

procedure TFOdtUrbanaRural.FormActivate(Sender: TObject);
begin
  pcMaterial.ActivePage:=tsMaterialPrincipal;
end;

function TFOdtUrbanaRural.GenerarImpreso: string;
var
  s1:string;
begin
  s1:=copy(qODTPadreCODIGOODT.AsString,7,5);
  Result:='';
  Result:=s1 + '-' + qODTHijaCONSECUTIVO.AsString;
end;

procedure TFOdtUrbanaRural.sbFechaEmisionClick(Sender: TObject);
begin
  dbeFechaEmision.Setfocus;
  sFecha := dbeFechaEmision.Text;
  Fecha := GetFecha(False);
  if Fecha <> '' then dbeFechaEmision.Text := Fecha;
end;

procedure TFOdtUrbanaRural.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
     if (ActiveControl is TDBLookupComboBox) then
     begin
       if not (ActiveControl as TDBLookupComboBox).ListVisible then
          Perform(wm_NextDLGCTL, 0, 0);
     end
     else
     begin
       Perform(wm_NextDLGCTL, 0, 0);
       key := #0;
     end;
end;

procedure TFOdtUrbanaRural.sbAprobadoClick(Sender: TObject);
begin
 fBuscarEmpleado:=TfBuscarEmpleado.Create(Application);
 try
  if fBuscarEmpleado.ShowModal=MrOK then
  begin
    dsODTPadre.DataSet.FieldByName('CODIGOAPROBADO').AsString:=fBuscarEmpleado.qListaEmpleado.FieldByName('CODIGOEMPLEADO').AsString;
  end;
 finally
   fBuscarEmpleado.Free;
   fBuscarEmpleado:=nil;
 end;
end;

procedure TFOdtUrbanaRural.sbRevisadoClick(Sender: TObject);
begin
 fBuscarEmpleado:=TfBuscarEmpleado.Create(Application);
 try
  if fBuscarEmpleado.ShowModal=MrOK then
  begin
    dsODTPadre.DataSet.FieldByName('CODIGOREVISADO').AsString:=fBuscarEmpleado.qListaEmpleado.FieldByName('CODIGOEMPLEADO').AsString;
  end;
 finally
   fBuscarEmpleado.Free;
   fBuscarEmpleado:=nil;
 end;
end;

procedure TFOdtUrbanaRural.sbEjecutadoClick(Sender: TObject);
begin
   fBuscarEmpleado:=TfBuscarEmpleado.Create(Application);
   try
    if fBuscarEmpleado.ShowModal=MrOK then
    begin
      dsODTPadre.DataSet.FieldByName('CODIGOEJECUTOR').AsString:=
      fBuscarEmpleado.qListaEmpleado.FieldByName('CODIGOEMPLEADO').AsString;
    end;
   finally
     fBuscarEmpleado.Free;
     fBuscarEmpleado:=nil;
   end;
end;

function TFOdtUrbanaRural.GetFecha(Tipo:Boolean): String;
begin
  fFormaFecha := TfFormaFecha.Create(Application);
  uFormaFecha.sFecha := sFecha;
  fFormaFecha.height:=291;
  if FFormaFecha.ShowModal = mrOk then
  begin
    if Tipo then
       Result := DateTimetoStr(FFormaFecha.Date+FFormaFecha.fTime)
    else
       Result := DateTimetoStr(FFormaFecha.Date);
  end
  else
  begin
    Result := '';
  end;
  fFormaFecha.Free;
end;

procedure TFOdtUrbanaRural.qODTVehiculoAfterPost(DataSet: TDataSet);
begin
  try
    qODTVehiculo.ApplyUpdates;
    qODTVehiculo.CommitUpdates;
  except
  end;
end;

procedure TFOdtUrbanaRural.DatosIniciales;
begin

end;

procedure TFOdtUrbanaRural.qODTAfterInsert(DataSet: TDataSet);
begin
  DatosIniciales;
end;

procedure TFOdtUrbanaRural.qODTVehiculoAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('CODIGOODT').AsString   := qODTHijaCODIGOODT.AsString;
  DataSet.FieldByName('CONSECUTIVO').AsString := qODTHijaCONSECUTIVO.AsString;
end;

procedure TFOdtUrbanaRural.DBGridReportesEditButtonClick(Sender: TObject);
var i:Integer;
begin
try
 fListaReportesODT:=TfListaReportesODT.Create(Application);
 fListaReportesODT.qListaReporte.Params[0].AsString:=qODTPadreCODIGOADMINISTRATIVO.AsString;
 fListaReportesODT.qListaReporte.Open;
 if fListaReportesODT.ShowModal=mrOK then
 begin
   try
       if fListaReportesODT.DBGrid1.SelectedRows.Count > 0 then
          for i:=0 to fListaReportesODT.DBGrid1.SelectedRows.Count-1 do
             begin
               fListaReportesODT.qListaReporte.BookMark:=fListaReportesODT.DBGrid1.SelectedRows.Items[i];
               if (DBGridReportes.Fields[0].text<>'') then
                   qReporte.Edit
               else
               begin
                 if qReporte.State in [dsInsert] then
                    qReporte.Cancel;
                 qReporte.Insert;
               end;
               qReporteCODIGOREPORTE.AsString:=fListaReportesODT.qListaReporteCODIGOREPORTE.AsString;
               qReporte.Post;
               qReporte.Insert;
            end;
     except
        On E:Exception do
        begin
          ShowMessage(E.Message);
          qReporte.Cancel;
        end;
  end;
   if qReporte.State in [dsInsert] then qReporte.Cancel;
    qReporte.Close;
    qReporte.Open;
    if (not qReporte.IsEmpty) and (qReporteCODIGOREPORTE.AsString = '') then
     qReporte.Delete;
 end;

finally
  fListaReportesODT.Free;
end;
{
try
 fListaReportes:=TfListaReportes.Create(Application);
 fListaReportes.FormStyle:=fsNormal;
 fListaReportes.visible:=false;
 fListaReportes.qListaReporte.Open;
 if fListaReportes.ShowModal=mrOK then
 begin
   try
       if fListaReportes.dbgListaReportes.SelectedRows.Count > 0 then
          for i:=0 to fListaReportes.dbgListaReportes.SelectedRows.Count-1 do
             begin
               fListaReportes.qListaReporte.BookMark:=fListaReportes.dbgListaReportes.SelectedRows.Items[i];
               if (DBGridReportes.Fields[0].text<>'') then
                   qReporte.Edit
               else
               begin
                 if qReporte.State in [dsInsert] then
                    qReporte.Cancel;
                 qReporte.Insert;
               end;
               qReporteCODIGOREPORTE.AsString:=fListaReportesODT.qListaReporteCODIGOREPORTE.AsString;
               qReporte.Post;
               qReporte.Insert;
            end;
     except
        On E:Exception do
        begin
          ShowMessage(E.Message);
          qReporte.Cancel;
        end;
  end;
   if qReporte.State in [dsInsert] then qReporte.Cancel;
    qReporte.Close;
    qReporte.Open;
    if (not qReporte.IsEmpty) and (qReporteCODIGOREPORTE.AsString = '') then
     qReporte.Delete;
 end;

finally
  fListaReportesODT.Free;
end;
 }
end;

procedure TFOdtUrbanaRural.qReporteAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('CODIGOODT').AsString   :=qODTHijaCODIGOODT.AsString;
  DataSet.FieldByName('CONSECUTIVO').AsString :=qODTHijaCONSECUTIVO.AsString;
end;

procedure TFOdtUrbanaRural.qReporteAfterPost(DataSet: TDataSet);

//Cargar datos previamente del reporte.
procedure CargarDatosReporte;
var
    qDatos:TQuery;
    FechaInicioTrabajo, FechaFinalTrabajo:TDateTime;
    CIG,CodigoTipoVia, CodigoNombreVia,ModificadorVia,Duplicador,
    ModificadorDuplicador, NumeroPuerta, CodigoGrupoTrabajo,Pintadoapoyo:string;
    CodigoApoyo:integer;
begin
  qDatos:=TQuery.Create(Application);
  qDatos.DataBaseName:='BaseDato';
  qDatos.Close;
  qDatos.SQL.Clear;
  with qDatos.SQL do
  begin
    Add('SELECT  R.CODIGOGRUPOTRABAJO, R.CIGDANO, R.CODIGOTIPOVIA, R.CODIGONOMBREVIA, R.MODIFICADORVIA, R.DUPLICADOR, R.MODIFICADORDUPLICADOR, R.NUMEROPUERTA,R.CODIGOAPOYO FROM');
    Add('ODTREPORTE O, REPORTE R');
    Add('WHERE (O.CODIGOODT = ' + qODTHijaCODIGOODT.AsString + ') AND (O.CONSECUTIVO = ' + qODTHijaCONSECUTIVO.AsString + ')');
    Add('AND (O.CODIGOREPORTE = R.CODIGOREPORTE)');
  end;
  qDatos.Open;
  CIG            :=qDatos.FieldByName('CIGDANO').AsString;
  CodigoTipoVia  :=qDatos.FieldByName('CODIGOTIPOVIA').AsString;
  CodigoNombreVia:=qDatos.FieldByName('CODIGONOMBREVIA').AsString;
  ModificadorVia :=qDatos.FieldByName('MODIFICADORVIA').AsString;
  Duplicador     :=qDatos.FieldByName('DUPLICADOR').AsString;
  ModificadorDuplicador :=qDatos.FieldByName('MODIFICADORDUPLICADOR').AsString;
  NumeroPuerta   :=qDatos.FieldByName('NUMEROPUERTA').AsString;
  CodigoGrupoTrabajo:=qDatos.FieldByName('CODIGOGRUPOTRABAJO').AsString;
  CodigoApoyo:=qDatos.FieldByName('CODIGOAPOYO').Asinteger;

  pintadoapoyo:='';
  if (CodigoApoyo>0) then
  begin
    qDatos.Close;
    qDatos.SQL.Clear;
    with qDatos.SQL do
    begin
      Add('SELECT PINTADOAPOYO FROM APOYO WHERE CODIGOAPOYO='+ inttostr(codigoapoyo));
    end;
    qDatos.open;
    Pintadoapoyo:=qDatos.fieldbyname('PINTADOAPOYO').asstring;
  end;
  qDatos.SQL.Clear;
  with qDatos.SQL do
  begin
    Add('SELECT  MIN(R.FECHAHORALLEGADA) FROM');
    Add('ODTREPORTE O, REPORTE R');
    Add('WHERE (O.CODIGOODT = ' + qODTHijaCODIGOODT.AsString + ') AND (O.CONSECUTIVO = ' + qODTHijaCONSECUTIVO.AsString + ')');
    Add('AND (O.CODIGOREPORTE = R.CODIGOREPORTE)');
  end;
  qDatos.Open;
  FechaInicioTrabajo:=qDatos.Fields[0].AsDateTime;
  qDatos.Close;
  qDatos.SQL.Clear;
  with qDatos.SQL do
  begin
    Add('SELECT  MIN(R.FECHAHORAATENCION) FROM');
    Add('ODTREPORTE O, REPORTE R');
    Add('WHERE (O.CODIGOODT = ' + qODTHijaCODIGOODT.AsString + ') AND (O.CONSECUTIVO = ' + qODTHijaCONSECUTIVO.AsString + ')');
    Add('AND (O.CODIGOREPORTE = R.CODIGOREPORTE)');
  end;
  qDatos.Open;
  FechaFinalTrabajo:=qDatos.Fields[0].AsDateTime;
   if (Application.MessageBox('Desea cargar algunos datos de la ODT, a partir de los reportes?',PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes) then
//   if MessageDlg('Desea cargar algunos datos de la ODT, a partir de los reportes?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
      if FechaInicioTrabajo <> 0 then
         qODTHijaFECHAINICIOTRABAJO.AsDateTime :=FechaInicioTrabajo;
      if FechaFinalTrabajo <> 0 then
        qODTHijaFECHAFINALTRABAJO.AsDateTime  :=FechaFinalTrabajo;

      qODTHijaCODIGOGEOGRAFICO.AsString:=CIG;
      qODTHijaCODIGOTIPOVIA.AsString:=CodigoTipoVia;
      qODTHijaCODIGONOMBREVIA.AsString:=CodigoNombreVia;
      qODTHijaMODIFICADORVIA.AsString:=ModificadorVia;
      qODTHijaDUPLICADOR.AsString:=Duplicador;
      qODTHijaMODIFICADORDUPLICADOR.AsString:=ModificadorDuplicador;
      qODTHijaNUMEROPUERTA.AsString:=NumeroPuerta;
      if qODTPadreCODIGOODTTIPOMANOOBRA.AsString = '1' then
        qODTHijaCODIGOGRUPOTRABAJO.AsString:=CodigoGrupoTrabajo;
      if (Pintadoapoyo<>'')then
      begin
        try
          qDatos.SQL.Clear;
          qDatos.sql.Add('INSERT INTO ODTAPOYO(CODIGOODT,CONSECUTIVO,PINTADOAPOYO)');
          qDatos.sql.Add('VALUES ('+qODTHijaCODIGOODT.AsString+','+qODTHijaCONSECUTIVO.AsString+','''+Pintadoapoyo +''')');

          qDatos.ExecSQL;
        except
        end;
        qODTApoyo.close;
        qODTApoyo.open;
      end;
    end;

   qDatos.SQL.Clear;
   qDatos.SQL.Add('UPDATE REPORTE SET FECHAHORADICTADO =  TO_DATE('''+FormatDateTime('dd/mm/yyyy h:mm:s',qODTPadreFECHAASIGNACION.AsDateTime)+''',''DD/MM/YYYY HH24:MI:SS'')');
   qDatos.SQL.Add('WHERE CODIGOREPORTE =:CODIGOREPORTE');
   qReporte.First;
   while not qReporte.Eof do
   begin
     if qReporteFECHAHORADICTADO.AsString = '' then
     begin
       qDatos.Close;
       qDatos.Params[0].AsString:=qReporteCODIGOREPORTE.AsString;
       qDatos.ExecSQL;
     end;
     qReporte.Next;
   end;
   qDatos.Close;
   qDatos.Free;
   qReporte.Close;
   qReporte.Open;
end;
//Fin Cargar datos del reporte.

begin
  try
    qReporte.ApplyUpdates;
    qReporte.CommitUpdates;
    CargarDatosReporte;
  except
    qReporte.Cancel;
    qReporte.CancelUpdates;
  end;
end;

procedure TFOdtUrbanaRural.qReporteAfterDelete(DataSet: TDataSet);
begin
  try
    qReporte.ApplyUpdates;
    qReporte.CommitUpdates;
  except
    qReporte.Cancel;
    qReporte.CancelUpdates;
  end;
end;

procedure TFOdtUrbanaRural.qPresManoAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('CODIGOODT').AsString   := qODTHijaCODIGOODT.AsString;
  DataSet.FieldByName('CONSECUTIVO').AsString := qODTHijaCONSECUTIVO.AsString;
  if qODTHijaFECHAINICIOTRABAJO.AsFloat = 0 then
    DataSet.FieldByName('FECHADIAODT').AsString   := qODTPadreFECHAEMISION.AsString
  else
    DataSet.FieldByName('FECHADIAODT').AsDateTime := Int(qODTHijaFECHAINICIOTRABAJO.AsFloat);

  if GuardarEmpleado then
     begin
      if Empleado.ExtrasDiurnas <> 0 then
        qPresMano.FieldByName('EXTRASDIURNAS').AsInteger:=Empleado.ExtrasDiurnas;
      if Empleado.ExtrasNocturnas <> 0 then
        qPresMano.FieldByName('EXTRASNOCTURNAS').AsInteger:=Empleado.ExtrasNocturnas;

      if Empleado.Viaticos <> 0 then
        qPresMano.FieldByName('VIATICOS').AsFloat:=Empleado.Viaticos;
      if Empleado.Desayuno <> 0 then
        qPresMano.FieldByName('DESAYUNO').AsFloat:=Empleado.Desayuno;
      if Empleado.Almuerzo <> 0 then
        qPresMano.FieldByName('ALMUERZO').AsFloat:=Empleado.Almuerzo;
      if Empleado.Comida <> 0 then
        qPresMano.FieldByName('COMIDA').AsFloat:=Empleado.Comida;
     end;

end;

procedure TFOdtUrbanaRural.DBGridManoObraEditButtonClick(Sender: TObject);
var i:Integer;
begin
  if not Contratista then
  begin
    FBuscarEmpleado := TFBuscarEmpleado.Create(Application);
    try
      if qODTPadreCODIGOADMINISTRATIVO.AsString <> '' then
      begin
        FFiltroEmpleado.LimpiarFiltro;
        FFiltroEmpleado.tdFiltroEmpleadoCODIGOADMINISTRATIVO.AsString:=qODTPadreCODIGOADMINISTRATIVO.AsString;
        FFiltroEmpleado.BitBtnFiltrarClick(nil);
        fBuscarEmpleado.filtrar(false);
      end;

      if FBuscarEmpleado.ShowModal = mrOk then
      begin
        try
          if FBuscarEmpleado.DBGrid1.SelectedRows.Count > 0 then
          begin
            for i:=0 to FBuscarEmpleado.DBGrid1.SelectedRows.Count-1 do
            begin
              FBuscarEmpleado.qListaEmpleado.BookMark:=FBuscarEmpleado.DBGrid1.SelectedRows.Items[i];
              if qPresManoCODIGOEMPLEADO.AsFloat <> 0 then qPresMano.Edit
              else
              begin
                if (qPresMano.State in [dsInsert]) then
                  qPresMano.Cancel;
                qPresMano.Insert;
              end;
              qPresMano.FieldbyName('CodigoEmpleado').AsString := FBuscarEmpleado.qListaEmpleado.fieldbyName('CodigoEmpleado').asstring;
              if Empleado.ExtrasDiurnas <> 0 then
                qPresMano.FieldByName('EXTRASDIURNAS').AsInteger:=Empleado.ExtrasDiurnas;
              if Empleado.ExtrasNocturnas <> 0 then
                qPresMano.FieldByName('EXTRASNOCTURNAS').AsInteger:=Empleado.ExtrasNocturnas;

              if Empleado.Viaticos <> 0 then
                qPresMano.FieldByName('VIATICOS').AsFloat:=Empleado.Viaticos;
              if Empleado.Desayuno <> 0 then
                qPresMano.FieldByName('DESAYUNO').AsFloat:=Empleado.Desayuno;
              if Empleado.Almuerzo <> 0 then
                qPresMano.FieldByName('ALMUERZO').AsFloat:=Empleado.Almuerzo;
              if Empleado.Comida <> 0 then
                qPresMano.FieldByName('COMIDA').AsFloat:=Empleado.Comida;
              qPresMano.Post;
              qPresMano.Insert;
            end;
          end;
        except
          qPresMano.Cancel;
           //qPresMano.CancelUpdates;
        end;
      end;
      if qPresMano.State in [dsInsert] then qPresMano.Cancel;
      qPresMano.Active := False;
      qPresMano.Active := True;
      if (not qPresMano.IsEmpty) and (qPresManoCODIGOEMPLEADO.AsFloat = 0) then
         qPresMano.Delete;
    finally
      FBuscarEmpleado.Free;
    end;
  end
  else
  begin
    fBuscarEmpleadoContratista := TfBuscarEmpleadoContratista.Create(Application);
    try
      fBuscarEmpleadoContratista.qEmpleadoContratista.Close;
      fBuscarEmpleadoContratista.qEmpleadoContratista.DataSource := dsOdtPadre;
      fBuscarEmpleadoContratista.qEmpleadoContratista.Open;
      if fBuscarEmpleadoContratista.ShowModal = mrOK then
      begin
        if fBuscarEmpleadoContratista.dbgEmpleadoContratista.SelectedRows.Count > 0 then
        begin
          for I := 0 to fBuscarEmpleadoContratista.dbgEmpleadoContratista.SelectedRows.Count - 1 do
          begin
            fBuscarEmpleadoContratista.qEmpleadoContratista.BookMark := fBuscarEmpleadoContratista.dbgEmpleadoContratista.SelectedRows.Items[I];
            if qPresManoCODIGOEMPLEADO.AsFloat <> 0 then
              qPresMano.Edit
            else begin
              if (qPresMano.State in [dsInsert]) then
                qPresMano.Cancel;
              qPresMano.Insert;
            end;
            qPresMano.FieldbyName('CODIGOEMPLEADO').AsString := fBuscarEmpleadoContratista.qEmpleadoContratista.FieldByName('CODIGOEMPLEADO').AsString;
            qPresMano.Post;
            qPresMano.Insert;
          end;
        end;
      end;
    finally
      fBuscarEmpleadoContratista.Free;
    end;
  end;
end;

procedure TFOdtUrbanaRural.SpeedButtonFechaInicioClick(Sender: TObject);
begin
  try
    fechaservidoractual:= strtodatetime(fechaservidor);
    dbeFechaInicio.Setfocus;
    sFecha := dbeFechaInicio.Text;
    if sFecha = '' then
      sFecha := FechaServidor;
    Fecha := GetFecha(True);
    if Fecha <> '' then  qODTHijaFECHAINICIOTRABAJO.AsDateTime:=StrToDateTime(fecha);
  except
  end;
end;

procedure TFOdtUrbanaRural.SpeedButtonFechaTerminacionClick(
  Sender: TObject);
begin
  try
    dbeFechaFinal.Setfocus;
    sFecha := dbeFechaFinal.Text;
    Fecha := GetFecha(True);
    if Fecha <> '' then
      qODTHijaFECHAFINALTRABAJO.AsDateTime:=StrToDateTime(fecha);
  except
  end;
end;

procedure TFOdtUrbanaRural.qPresManoAfterPost(DataSet: TDataSet);
begin
// try
  if qPresManoCODIGOEMPLEADO.AsString = '' then
    qPresMano.Delete;
  qPresMano.ApplyUpdates;
  qPresMano.CommitUpdates;
// except
//   ShowMessage('Error');
// end;
end;



procedure TFOdtUrbanaRural.qPresManoAfterDelete(DataSet: TDataSet);
begin
  qPresMano.ApplyUpdates;
  qPresMano.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qPresMateAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('CODIGOODT').AsString   := qODTHijaCODIGOODT.AsString;
  DataSet.FieldByName('CONSECUTIVO').AsString := qODTHijaCONSECUTIVO.AsString;
  if NumeroVale <> 0 then
    DataSet.FieldByName('NUMEROVALE').AsInteger:=NumeroVale;
  MaterialModificado:= true;
end;

procedure TFOdtUrbanaRural.DBGridMaterialEditButtonClick(Sender: TObject);
var i:integer;
begin
try
  fBuscarMaterial := tfBuscarMaterial.Create(Application);
    if fBuscarMaterial.ShowModal = mrOk then
    begin
      if fBuscarMaterial.DBGridBuscarMaterial.SelectedRows.Count>0 then
      begin
        for i:=0 to fBuscarMaterial.DBGridBuscarMaterial.SelectedRows.Count-1 do
        begin
          fBuscarMaterial.qMaterial.BookMark:=fBuscarMaterial.DBGridBuscarMaterial.SelectedRows.Items[i];
          try
            if (i=0) and (DBGridMaterial.Fields[0].text<>'')
            then qPresMate.Edit
            else
            begin
              if qPresMate.State in [dsInsert] then
              qPresMate.Cancel;
              qPresMate.Insert;
            end;
            qPresMate.FieldbyName('CodigoMaterial').AsString := fBuscarMaterial.qMaterial.FieldByName('CodigoMaterial').AsString;
            qPresMate.Post;
            qPresMate.Insert;
          except
          on E:Exception do
          begin
            qPresMate.Cancel;
          end;
        end;
      end;
      if qPresMate.State in [dsInsert] then
        qPresMate.Cancel;
      qPresMate.Active := False;
      qPresMate.Active := True;
      if (not qPresMate.IsEmpty) and (qPresMateCODIGOMATERIAL.AsFloat = 0) then
        qPresMate.Delete;
    end;
  end;
finally
  fBuscarMaterial.free;
end;

end;


procedure TFOdtUrbanaRural.qPresMateAfterPost(DataSet: TDataSet);
begin
  if qPresMateCODIGOMATERIAL.AsString = '' then
    qPresMate.Delete;
  qPresMate.ApplyUpdates;
  qPresMate.CommitUpdates;
  NumeroVale:=qPresMateNUMEROVALE.AsInteger;
end;

procedure TFOdtUrbanaRural.qPresMateAfterDelete(DataSet: TDataSet);
begin
  qPresMate.ApplyUpdates;
  qPresMate.CommitUpdates;
  pcMaterial.activepage:= tsMaterialConsumo;
  pcMaterial.activepage:= tsMaterialPrincipal;
  MaterialModificado:= true;
end;

procedure TFOdtUrbanaRural.sbModificarStockClick(Sender: TObject);
var qBitacoraMaterial:TQuery;
begin
  if (Application.MessageBox('Desea Modificar el Stock de Materiales?',PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes) then
//  if MessageDlg('Desea Modificar el Stock de Materiales?',mtConfirmation,[mbYes, mbNo],0) = mrYes then
  begin
     if qODTHijaCODIGOGRUPOTRABAJO.AsString <> '' then
     begin
       qStock.Close;
       qPresMate.First;
       while not qPresMate.Eof do
       begin
        qStock.Close;
        qStock.ParamByName('CODIGOADMINISTRATIVO').AsString :=qODTPadreCODIGOADMINISTRATIVO.AsString;
        qStock.ParamByName('CODIGOGRUPOTRABAJO').AsString   :=qODTHijaCODIGOGRUPOTRABAJO.AsString;
        qStock.ParamByName('CODIGOMATERIAL').AsString        :=qPresMateCODIGOMATERIAL.AsString;
        qStock.Open;
        if qPresMateCantidadStock.AsFloat <> 0 then
         begin
            if qStock.RecordCount = 0 then
            begin
              if (Application.MessageBox(pchar('Desea Crear Una Entrada En El Stock Para El Material ' + qPresMateNombreMaterial.AsString + '?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes) then
            //  if MessageDlg('Desea Crear Una Entrada En El Stock Para El Material ' + qPresMateNombreMaterial.AsString + '?',
//                            mtConfirmation,[mbYes, mbNo],0) = mrYes then
                begin
                   fStockGrupoTrabajo:=TfStockGrupoTrabajo.Create(Application);
                   with fStockGrupoTrabajo do
                   begin
                     qStockGrupoTrabajo.Insert;
                     qStockGrupoTrabajo.FieldByName('CODIGOADMINISTRATIVO').AsString :=qODTPadreCODIGOADMINISTRATIVO.AsString;
                     qStockGrupoTrabajo.FieldByName('CODIGOGRUPOTRABAJO').AsString   :=qODTHijaCODIGOGRUPOTRABAJO.AsString;
                     qStockGrupoTrabajo.FieldByName('CODIGOMATERIAL').AsString       :=qPresMateCODIGOMATERIAL.AsString;
                     qStockGrupoTrabajo.FieldByName('CANTIDADACTUAL').AsFloat:=qPresMateCantidadStock.AsFloat;
                     qStockGrupoTrabajo.FieldByName('CANTIDADINICIAL').AsFloat:=qPresMateCantidadStock.AsFloat;
                     ShowModal;
                   end;

                end;
            end//End RecordCount
            else
            begin
              qBitacoraMaterial:=TQuery.Create(Application);
              qBitacoraMaterial.DatabaseName:='BaseDato';
              qBitacoraMaterial.SQL.Add('SELECT CANTIDADSTOCK FROM ODTBITACORAMATERIAL');
              qBitacoraMaterial.SQL.Add('WHERE CODIGOODT = '+ qODTPadreCODIGOODT.AsString);
              qBitacoraMaterial.SQL.Add('AND CONSECUTIVO = '+ qODTHijaCONSECUTIVO.AsString);
              qBitacoraMaterial.SQL.Add('AND CODIGOMATERIAL = '+ qPresMateCODIGOMATERIAL.AsString);
              qBitacoraMaterial.Open;
              qStock.Edit;
              qStock.FieldByName('CANTIDADACTUAL').AsFloat :=qStock.FieldByName('CANTIDADACTUAL').AsFloat - qBitacoraMaterial.FieldByName('CANTIDADSTOCK').AsFloat + qPresMateCantidadStock.AsFloat;
              qStock.Post;
              qBitacoraMaterial.Close;
              qBitacoraMaterial.SQL.Clear;
              qBitacoraMaterial.SQL.Add('DELETE FROM ODTBITACORAMATERIAL');
              qBitacoraMaterial.SQL.Add('WHERE CODIGOODT = '+ qODTPadreCODIGOODT.AsString);
              qBitacoraMaterial.SQL.Add('AND CONSECUTIVO = '+ qODTHijaCONSECUTIVO.AsString);
              qBitacoraMaterial.SQL.Add('AND CODIGOMATERIAL = '+ qPresMateCODIGOMATERIAL.AsString);
              qBitacoraMaterial.ExecSQL;
              qBitacoraMaterial.Close;
              qBitacoraMaterial.SQL.Clear;
              qBitacoraMaterial.SQL.Add('INSERT INTO ODTBITACORAMATERIAL');
              qBitacoraMaterial.SQL.Add('VALUES('+qODTPadreCODIGOODT.AsString+','+qODTHijaCONSECUTIVO.AsString);
              qBitacoraMaterial.SQL.Add(','+qPresMateCODIGOMATERIAL.AsString+','+qPresMateCantidadStock.AsString+',' +
                                        qStock.FieldByName('CANTIDADACTUAL').AsString+')');
              qBitacoraMaterial.ExecSQL;
              qBitacoraMaterial.Free;
            end;
         end;
        qPresMate.Next;
       end;
     end
     else
      (Application.MessageBox('Debe seleccionar primero un Grupo de Trabajo para realizar'+Chr(13)+'el cálculo del Stock de Materiales.',
               PChar('Información'),MB_ICONINFORMATION +MB_OK));
     //       MessageDlg('Debe seleccionar primero un Grupo de Trabajo para realizar'+Chr(13)
     //               +'el cálculo del Stock de Materiales.', mtInformation,[mbYes],0);
  end;
end;

procedure TFOdtUrbanaRural.DBGridMaterialDblClick(Sender: TObject);
begin
  qPresMate.Edit;
end;

procedure TFOdtUrbanaRural.qPresMateUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  showmessage(e.message);
  case UpdateKind of
    ukInsert:
    begin
      qPresMate.Cancel;
      if (Application.MessageBox(pchar('Datos Incompletos o Erróneos al Insertar un Nuevo Material en la ODT.'+Chr(13)+
      'Desea Eliminar Registro Erróneo?.'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes) then
      begin
        UpdateAction:=uaAbort;
      end;
    end;
    ukModify:
    begin
      MessageDlg('Error al editar un material, posiblemente duplicado o datos erróneos.',
      mtWarning,[mbOk],0);
      UpdateAction:=uaAbort;
    end;
  end;
  
  // UpdateAction:=uaAbort;
end;

procedure TFOdtUrbanaRural.qPresMateCalcFields(DataSet: TDataSet);
var Cantidad1,Cantidad2:Double;
  query:tquery;
begin
  if (qPresMateCODIGOMATERIAL.AsString<>'') then
  begin
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('select nombrematerial,codigounidad,codigomaterialessa,codigomaterialow from materialessa');
    query.sql.add('where ACTIVO = ''S'' AND codigomaterial= '+qPresMateCODIGOMATERIAL.AsString);
    query.open;
    qPresMateNombreMaterial.Asstring:=query.fieldbyname('nombrematerial').AsString;
    qPresMateNombreUnidad.AsString:=query.fieldbyname('codigounidad').AsString;
      Cantidad1:=(qPresMateCANTIDADENTREGADA.AsFloat - qPresMateCANTIDADCONSUMIDA.AsFloat);
      Cantidad2:= (qPresMateCANTIDADRETIRADABUENA.AsFloat + qPresMateCANTIDADRETIRADAMALA.AsFloat)
                - (qPresMateCANTIDADREINTEGRADABUENA.AsFloat + qPresMateCANTIDADREINTEGRADAMALA.AsFloat);
    qPresMate.FieldByName('CANTIDADSTOCK').AsFloat:=Cantidad1 + Cantidad2;
    qPresMateCodigoMaterialEssa.AsFloat:=query.fieldbyname('codigomaterialessa').AsFloat;
    qPresMateCodigoMaterialOW.AsString:=query.fieldbyname('codigomaterialow').AsString;
    query.Close;
    query.free;
  end;
end;

procedure TFOdtUrbanaRural.sbCostoManoObraClick(Sender: TObject);
var mensaje:string;
begin
  if (qODTHija.State in [dsedit,dsInsert]) and (qODTHija.UpdateObject<>nil)then
  try
    qODTHija.Post;
    qODTHija.Edit;
  except
  end;
//  CostoManoObraHija(qODTHijaCODIGOODT.Asfloat,qODTHijaCONSECUTIVO.AsInteger,mensaje);
  CostoManoObraHijaIntegrado(qODTHijaCODIGOODT.Asfloat,qODTHijaCONSECUTIVO.AsInteger,
  qODTHijaFECHAINICIOTRABAJO.AsDateTime,qODTHijaFECHAFINALTRABAJO.AsDateTime);
  qODTHijaCalcFields(qODTHija);

  if qODThija.UpdateObject<>nil then
    qODThija.Edit;
  qPresMano.close;
  qPresMano.open;
  qODTHijaCalcFields(qODTHija);
  if mensaje<>'' then showmessage(mensaje);
end;

procedure TFOdtUrbanaRural.CargarDatosEmpleados;
begin

end;


procedure TFOdtUrbanaRural.qPresManoUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  if UpdateKind = ukInsert then
  begin
    if (Application.MessageBox('Datos Incompletos o Erróneos al Insertar un Nuevo Empleado en la ODT.'+Chr(13)+
               'Desea Eliminar Registro Erróneo?.',PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes) then
    {if MessageDlg('Datos Incompletos o Erróneos al Insertar un Nuevo Empleado en la ODT.'+Chr(13)+
               'Desea Eliminar Registro Erróneo?.'
    ,mtWarning,[mbYes, mbNo],0) = mrYes then}
    begin
      qPresMano.Delete;
      UpdateAction:=uaSkip;
    end
    else
      UpdateAction:=uaAbort;
  end;
end;


procedure TFOdtUrbanaRural.qPresManoHORASNORMALESValidate(Sender: TField);
var Hora:Integer;
begin
 if Sender.Text<>'' then
 begin
    try
      Hora:=StrToInt(Sender.Text);
    except
      raise Exception.Create('Valor Inválido en Horas Normales');
    end;
    if not ((Hora>=0) and (Hora<=8)) then
      raise Exception.Create('Rango Inválido en Horas Normales.');
 end;
end;

procedure TFOdtUrbanaRural.qPresManoEXTRASDIURNASValidate(Sender: TField);
var Hora:Integer;
begin
 if Sender.Text<>'' then
 begin
    try
      Hora:=StrToInt(Sender.Text);
    except
      raise Exception.Create('Valor Inválido en Horas Extras Diurnas.');
    end;
    if not (Hora>=0) then
      raise Exception.Create('Rango Inválido en Horas Extras Diurnas.');
 end;

end;

procedure TFOdtUrbanaRural.qPresManoEXTRASNOCTURNASValidate(Sender: TField);
var Hora:Integer;
begin
 if Sender.Text<>'' then
 begin
    try
      Hora:=StrToInt(Sender.Text);
    except
      raise Exception.Create('Valor Inválido en Horas Extras Nocturnas.');
    end;
    if not (Hora>=0) then
      raise Exception.Create('Rango Inválido en Horas Extras Nocturnas.');
 end;

end;

procedure TFOdtUrbanaRural.qODTFECHAINICIOTRABAJOChange(Sender: TField);
var qDatos:TQuery;
begin
   qPresMano.First;
   while not qPresMano.Eof do
   begin
    try
      qPresMano.Edit;
      qPresManoFECHADIAODT.AsFloat := Int(Sender.AsDateTime);
      qPresMano.Post;
      qPresMano.Next;
    except
    end;
   end;
  qDatos:=TQuery.Create(Application);
  try
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Add('UPDATE REPORTE SET FECHAHORALLEGADA = TO_DATE('''+FormatDateTime('dd/mm/yyyy h:mm:s',Sender.AsDateTime)+''',''DD/MM/YYYY HH24:MI:SS'')');
    qDatos.SQL.Add('WHERE CODIGOREPORTE=:CODIGOREPORTE');
    qReporte.First;
    while not qReporte.Eof do
    begin
     qDatos.Close;
     qDatos.Params[0].AsString:=qReporte.FieldByName('CODIGOREPORTE').AsString;
     qDatos.ExecSQL;
     qReporte.Next;
    end;
  finally
    qDatos.Close;
    qDatos.Free;
    qReporte.Close;
    qReporte.Open;
  end;

end;

procedure TFOdtUrbanaRural.qODTFECHAFINALTRABAJOChange(Sender: TField);
var qDatos:TQuery;
begin
  qDatos:=TQuery.Create(Application);
  try
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Add('UPDATE REPORTE SET FECHAHORAATENCION = TO_DATE('''+FormatDateTime('dd/mm/yyyy h:mm:s',Sender.AsDateTime)+''',''DD/MM/YYYY HH24:MI:SS'')');
    qDatos.SQL.Add('WHERE CODIGOREPORTE=:CODIGOREPORTE');
    qReporte.First;
    while not qReporte.Eof do
    begin
     qDatos.Close;
     qDatos.Params[0].AsString:=qReporte.FieldByName('CODIGOREPORTE').AsString;
     qDatos.ExecSQL;
     qReporte.Next;
    end;
  finally
   qDatos.Close;
    qDatos.Free;
    qReporte.Close;
    qReporte.Open;
  end;
end;

procedure TFOdtUrbanaRural.ArbolChanging(Sender: TObject; Node: TTreeNode;
  var AllowChange: Boolean);
begin
  try
  if qPresMano.State in [dsInsert, dsEdit] then
     qPresMano.Cancel;
  except
    AllowChange:=False;
  end;

  try
  if qPresMate.State in [dsInsert, dsEdit] then
     qPresMate.Cancel;
  except
    AllowChange:=False;
  end;

end;

procedure TFOdtUrbanaRural.RxSpeedButton3Click(Sender: TObject);
var qDatos:TQuery;

begin
  if qODTHijaCODIGOGRUPOTRABAJO.AsInteger = 0 then
  begin
    (Application.MessageBox(pchar('Debe seleccionar un Grupo de Trabajo en la sección Ejecución.'),PChar('Advertencia'),MB_ICONINFORMATION+MB_OK));
//     MessageDlg('Debe seleccionar un Grupo de Trabajo en la sección Ejecución.',             mtWarning,[mbOK],0);
     Exit;
  end;
  if qODTHijaFECHAINICIOTRABAJO.AsFloat = 0 then
  begin
    (Application.MessageBox(pchar('Debe seleccionar una Fecha de Inicio de Trabajo en la sección Programación.'),PChar('Advertencia'),MB_ICONINFORMATION+MB_OK));

//     MessageDlg('Debe seleccionar una Fecha de Inicio de Trabajo en la sección Programación.',  mtWarning,[mbOK],0);
     Exit;
  end;
  if qPresMano.State in [dsInsert, dsEdit] then
     qPresMano.Cancel;
  qDatos     :=TQuery.Create(Application);
  try
    qDatos.DataBaseName      :='BaseDato';
    qDatos.SQL.Add('SELECT C.CODIGOEMPLEADO FROM');
    qDatos.SQL.Add('(SELECT C.CODIGOEMPLEADO,P.CODIGOTIPOTURNOPROGRAMACION,C.D'+FormatDateTime('D',qODTHijaFECHAINICIOTRABAJO.AsDateTime)+' AS DIA');
    qDatos.SQL.Add('FROM PROGRAMACION P,CALENDARIOPROGRAMACION C,PROGRAMACIONEMPLEADO PE');
    qDatos.SQL.Add('WHERE P.CODIGOPROGRAMACION=C.CODIGOPROGRAMACION');
    qDatos.SQL.Add('AND C.CODIGOPROGRAMACION=PE.CODIGOPROGRAMACION');
    qDatos.SQL.Add('AND C.CODIGOEMPLEADO=PE.CODIGOEMPLEADO');
    qDatos.SQL.Add('AND C.FECHA=TO_DATE('''+FormatDateTime('01/mm/yyyy',qODTHijaFECHAINICIOTRABAJO.AsDateTime)+''', ''DD/MM/YYYY'')');
    qDatos.SQL.Add('AND PE.CODIGOGRUPOTRABAJO='+qODTHijaCODIGOGRUPOTRABAJO.AsString);
    qDatos.SQL.Add('AND PE.CODIGOADMINISTRATIVO='+qODTPadreCODIGOADMINISTRATIVO.AsString+') C, TIPOTURNODETALLE TD');
    qDatos.SQL.Add('WHERE C.CODIGOTIPOTURNOPROGRAMACION=TD.CODIGOTIPOTURNO');
    qDatos.SQL.Add('AND C.DIA=TD.CODIGOTURNO');
    qDatos.SQL.Add('AND TD.FECHADESDE<=TO_DATE('''+FormatDateTime('dd/mm/yyyy hh:nn:ss',qODTHijaFECHAINICIOTRABAJO.AsDateTime)+''', ''DD/MM/YYYY HH24:MI:SS'')');
    qDatos.SQL.Add('AND TD.FECHAHASTA>=TO_DATE('''+FormatDateTime('dd/mm/yyyy hh:nn:ss',qODTHijaFECHAFINALTRABAJO.AsDateTime)+''', ''DD/MM/YYYY HH24:MI:SS'')');  ;
    qDatos.Open;
    if qDatos.RecordCount > 0 then
    begin
      while not qDatos.Eof do
      begin
       try
        qPresMano.Insert;
        qPresMano.FieldByName('CODIGOEMPLEADO').AsString:=qDatos.Fields[0].AsString;
        qPresMano.Post;
        qDatos.Next;
       except
        qPresMano.Cancel;
       end;
      end;
    end
    else
    (Application.MessageBox(pchar('No se Encontró Ningún Registro Dentro de La Bitácora, Para El Grupo'+Chr(13)+
                 'De Trabajo: '+qODTHijaCODIGOGRUPOTRABAJO.AsString+ ' , En La Fecha: '+FormatDateTime('mmmm dd yyyy hh:mm am/pm',qODTHijaFECHAINICIOTRABAJO.AsDateTime)+'.'),PChar('Advertencia'),MB_ICONINFORMATION+MB_OK))

{      MessageDlg('No se Encontró Ningún Registro Dentro de La Bitácora, Para El Grupo'+Chr(13)+
                 'De Trabajo: '+qODTHijaCODIGOGRUPOTRABAJO.AsString+ ' , En La Fecha: '+FormatDateTime('mmmm dd yyyy hh:mm am/pm',qODTHijaFECHAINICIOTRABAJO.AsDateTime)+'.'
                 ,mtInformation,[mbOK],0);
}  finally
   qDatos.Close;
    qDatos.Free;
  end;
end;

procedure TFOdtUrbanaRural.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i,iContCampos :integer;
  bm,bm2:TBookmark;
  qConsulta:TQuery;
  sSQL:string;
begin
  Action:=caFree;
  sSQL:='';
  if not bCancelando then
  begin
    if bDatosIncompletos then
    begin
      if Application.MessageBox(PChar('Hay datos incompletos.Desea completar los datos?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
      begin
        ModalResult := 0;
        bDatosIncompletos := false;
        //Action:=caNone;
      end
      else
      begin
        try
          qODTPadre.Cancel;
          qODTPadre.CancelUpdates;
          qODTHija.Cancel;
          qODTHija.CancelUpdates;
          if qtrans.Database.InTransaction then qtrans.Database.Rollback;
          Action:=caFree;
        except
        end;
      end;
    end
    else
    begin
      if (ModalResult = mrOK) then
      begin
        if qtrans.Database.InTransaction then
          qtrans.Database.Commit;
        Action:=caFree;
      end
      else
      begin
        try
          qODTPadre.Cancel;
          qODTPadre.CancelUpdates;
          qODTHija.Cancel;
          qODTHija.CancelUpdates;
          if qtrans.Database.InTransaction then
            qtrans.Database.Rollback;
          Action:=caFree;
        except
        end;
      end;
    end
  end
  else
  begin
    try
      qODTPadre.Cancel;
      qODTPadre.CancelUpdates;
      qODTHija.Cancel;
      qODTHija.CancelUpdates;
      if qtrans.Database.InTransaction then
        qtrans.Database.Rollback;
      if bEsHijaNueva then
        BorrarOdtHija(qODTHijaCODIGOODT.AsString,qODTHijaCONSECUTIVO.AsString);
      Action:=caFree;
    except
    end;
  end;
  Qtrans.Close;
  Qtrans.Free;
  TerminarSesionGestionOdtHija(qODTHijaCODIGOODT.AsFloat,qODTHijaCONSECUTIVO.AsFloat);
  //Cierra todos los querys
  if (Action=CaFree) then
  begin
    if ModalResult = mrOK then
    begin
      iContCampos:=0;
      qConsulta:= TQuery.Create(nil);
      qConsulta.DatabaseName := 'BaseDato';
      qconsulta.SQL.Text:= 'UPDATE ODTDIA SET';
      if qODTHijaCODIGOESTADOODTDIA.AsString <> '' then
      begin
        inc(iContCampos);
        qconsulta.SQL.Text:= qconsulta.SQL.Text+' CODIGOESTADOODTDIA='+qODTHijaCODIGOESTADOODTDIA.AsString+',';
      end;

      if qODTHijaFECHAINICIOTRABAJO.AsString <> '' then
      begin
        inc(iContCampos);
        qconsulta.SQL.Text:= qconsulta.SQL.Text+' FECHAINICIOTRABAJO=TO_DATE('''+FormatDateTime('dd/mm/yyyy h:mm:s',qODTHijaFECHAINICIOTRABAJO.AsDateTime)+''',''DD/MM/YYYY HH24:MI:SS''),';
      end;

      if qODTHijaFECHAFINALTRABAJO.AsString <> '' then
      begin
        inc(iContCampos);
        qconsulta.SQL.Text:= qconsulta.SQL.Text+' FECHAFINALTRABAJO=TO_DATE('''+FormatDateTime('dd/mm/yyyy h:mm:s',qODTHijaFECHAFINALTRABAJO.AsDateTime)+''',''DD/MM/YYYY HH24:MI:SS''),';
      end;

      if qODTHijaCODIGOTIPOTRABAJOODT.AsString <> '' then
      begin
        inc(iContCampos);
        qconsulta.SQL.Text:= qconsulta.SQL.Text+' CODIGOTIPOTRABAJOODT='+qODTHijaCODIGOTIPOTRABAJOODT.AsString+',';
      end;

      if qODTHijaCODIGOTIPOACTIVO.AsString <> '' then
      begin
        inc(iContCampos);
        qconsulta.SQL.Text:= qconsulta.SQL.Text+' CODIGOTIPOACTIVO='+qODTHijaCODIGOTIPOACTIVO.AsString+',';
      end;

      if qODTHijaCODIGOTIPOINTERVENCION.AsString <> '' then
      begin
        inc(iContCampos);
        qconsulta.SQL.Text:= qconsulta.SQL.Text+' CODIGOTIPOINTERVENCION = '+qODTHijaCODIGOTIPOINTERVENCION.AsString+',';
      end;

      sSQL:= Copy (Trim(qConsulta.SQL.Text), 0, Length(Trim(qConsulta.SQL.Text))-1);
      qConsulta.SQL.Text:= sSQL;
      qconsulta.SQL.Add('WHERE CODIGOODT = '+qODTHijaCODIGOODT.AsString+ ' AND CONSECUTIVO =  '+qODTHijaCONSECUTIVO.AsString);

      if iContCampos > 0 then
        qconsulta.ExecSQL;
      qConsulta.Close;
      qconsulta.Free;
    end;
    
    if Assigned(Application.FindComponent('fListaODTUrbanaRural') as TForm) then
    begin
      bm:=fListaODTUrbanaRural.qListaODTPadre.GetBookmark;
      bm2:=fListaODTUrbanaRural.qListaODTHija.GetBookmark;
      fListaODTUrbanaRural.qListaODTPadre.Close;
      fListaODTUrbanaRural.qListaODTHija.Close;
      fListaODTUrbanaRural.qListaODTHija.Open;
      fListaODTUrbanaRural.qListaODTPadre.Open;
      fListaODTUrbanaRural.qListaODTPadre.GotoBookmark(bm);
      fListaODTUrbanaRural.qListaODTHija.GotoBookmark(bm2);
    end;
    try
      for i:=0 to ComponentCount - 1 do
      begin
        if (Components[i] is TQuery) then
        begin
         if (TQuery(Components[i])).Active then
            (TQuery(Components[i])).Close;
        end;
      end;
    except
      on e:exception do
      begin
        showmessage(e.message);
      end;
    end;
  end;
end;

procedure TFOdtUrbanaRural.bbCancelarClick(Sender: TObject);
var
  RutaFullArchivoSFTP, NombreODT: string;
begin
  if Application.MessageBox(PChar('Perderá los cambios realizados.Esta seguro de Cancelar?'),
  PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
     begin
      try
         if qODTApoyo.State in [dsInsert] then qODTApoyo.Cancel;
           qODTPadre.Cancel;

         if qOdtTrafodis.State in [dsInsert] then qOdtTrafodis.Cancel;
           qOdtTrafodis.Cancel;

         if qOdtClientesgd.State in [dsInsert] then qOdtClientesgd.Cancel;
            qOdtClientesgd.Cancel;

         if qOdtPlancha.State in [dsInsert] then qOdtPlancha.Cancel;
           qOdtPlancha.Cancel;

         if qAlumbradopublico.State in [dsInsert] then qAlumbradopublico.Cancel;
         qODTPadre.Cancel;
         if qEventoAP.State in [dsInsert] then qEventoAP.Cancel;
         qODTPadre.Cancel;

         if qODTPadre.UpdatesPending then
          qODTPadre.CancelUpdates;
         qODTHija.Cancel;

         if qODTHija.UpdatesPending then
          qODTHija.CancelUpdates;

         if ExportacionExitosa then
         begin
            if ConectarA_SFTP(Host_SFTP, Port_SFTP, UserID_SFTP, Password_SFTP) then
            begin
              NombreODT := DirectorioAsignacionMovil;
              RutaFullArchivoSFTP:= DirRaiz_SFTP+qODTPadreCODIGOADMINISTRATIVO.AsString+'\'
                                    +qODTHijaCODIGOGRUPOTRABAJO.AsString+'\'+CarpetaExportadas+'\'
                                    +NombreODT+'.zip';
              if ExisteArchivo_SFTP(RutaFullArchivoSFTP) then
                BorrarArchivo_SFTP(RutaFullArchivoSFTP);
            end;
         end;
       finally
         bDatosIncompletos := true;
         bCancelando := true;
         Close;
       end;
     end
  else
     begin
        ModalResult := 0;
        bDatosIncompletos := false;
        //dbeFechaEmision.SetFocus;
     end;
end;

procedure TFOdtUrbanaRural.bbAceptarClick(Sender: TObject);
begin
  ModalResult:=MrOk;
  //validaciones intervenciones
  if qAlumbradopublico.State in [dsInsert] then qAlumbradopublico.Cancel;

  if qEventoAP.State in [dsInsert] then qEventoAP.Cancel;
  if (qODTHijaCODIGOTIPOTRABAJOODT.AsFloat = 1) or (qODTHijaCODIGOTIPOTRABAJOODT.AsFloat = 2) then
  begin
    if qODTHijaNombreTipoIntervencion.AsString = '' then
    begin
      Application.MessageBox('Se necesita el tipo de Intervención','Error',Mb_Iconerror);
      ModalResult:=0;
      Exit;
    end;
    if qODTHijaCODIGOTIPOACTIVO.asstring = '' then
    begin
      Application.MessageBox('Se necesita el tipo de activo','Error',Mb_Iconerror);
      ModalResult:=0;
      Exit;
    end;
  end;

  if insertandorequisicion = false then
  begin
    if qPresMano.RecordCount = 0 then
      if (Application.MessageBox('No se ha insertado ninguna mano de obra, esta seguro de continuar?',PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idNo) then
      begin
        ModalResult:=0;
        Exit;
      end;
  end;

  if qODTApoyo.State in [dsInsert] then qODTApoyo.Cancel;
    bDatosIncompletos := False;

  if qOdtTrafodis.State in [dsInsert] then qOdtTrafodis.Cancel;
    bDatosIncompletos := False;

  if qOdtclientesgd.State in [dsInsert] then qOdtclientesgd.Cancel;

  if qOdtPlancha.State in [dsInsert] then qOdtPlancha.Cancel;
    bDatosIncompletos := False;

  try
    CalcularCostos;

    qODTPadre.Post;
    if qODTPadre.UpdatesPending then
      qODTPadre.ApplyUpdates;

    qODTHija.Post;
    if qODTHija.UpdatesPending then
      qODTHija.ApplyUpdates;

    if qODTActividad.UpdatesPending then
      qODTActividad.ApplyUpdates;

     Close;
  except
     on E:Exception do
     begin
       ShowMessage(E.Message);
       bDatosIncompletos := True;
       qODTPadre.Edit;
       qODTHija.Edit;
       ModalResult:=MrCancel;
       Close;
     end;
  end;
end;

procedure TFOdtUrbanaRural.qODTHijaCODIGOGEOGRAFICOValidate(
  Sender: TField);
begin
  if Sender.Text <> '' then
  begin
    qCIG.Close;
    qCIG.Params[0].AsString:=Sender.Text;
    qCIG.Open;
    if qCIG.RecordCount = 0 then
      raise Exception.Create('Este Código Geográfico No Existe.')
  end;
end;

procedure TFOdtUrbanaRural.qODTHijaCalcFields(DataSet: TDataSet);
var
  qDatos:TQuery;
  Direccion:string;
begin
  if (qODTHijaCODIGOODT.AsString<>'') and (qODTHijaCONSECUTIVO.AsString<>'')then
  begin
    if (qODTPadreCODIGOODTTIPOMANOOBRA.AsInteger=1) then
      DataSet. FieldByName('COSTOTOTALODT').AsFloat:=qODTHijaCOSTOMATERIAL.AsFloat + qODTHijaCOSTOTRANSPORTE.AsFloat +
                              qODTHijaCOSTOEQUIPO.AsFloat   + qODTHijaCOSTOMANOOBRA.AsFloat
    else
      DataSet. FieldByName('COSTOTOTALODT').AsFloat:=qODTHijaCOSTOACTIVIDAD.AsFloat;

    Direccion:='';
    qDatos:=TQuery.Create(nil);
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
    DataSet.FieldByName('DIRECCIONCALCULADA').AsString:=TrimLeft(Direccion);
    //Para evitar cerrar y abrir qodthija para refrescar costos
    qDatos.Close;
    qdatos.sql.clear;
    qdatos.sql.add('SELECT COSTOMANOOBRA FROM ODTDIA WHERE CODIGOODT='+qODTHijaCODIGOODT.AsString );
    qdatos.sql.add('AND CONSECUTIVO ='+qODTHijaCONSECUTIVO.AsString );
    qDatos.Open;
    qODTHijaCostoCalculadoManoobra.AsFloat:=qDatos.fieldbyname('COSTOMANOOBRA').AsFloat;

    qDatos.Close;
    qdatos.sql.clear;
    qdatos.sql.add('SELECT A.CODIGOASIGNACIONEMG,A.FECHAPROCESO,E.NOMBREESTADOASIGNACION FROM EMG_ODTASIGNACION A,EMG_ESTADOASIGNACION E');
    qdatos.sql.add('WHERE A.CODIGOODT='+qODTHijaCODIGOODT.AsString);
    qdatos.sql.add('AND A.CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString);
    qdatos.sql.add('AND A.CODIGOESTADOASIGNACION=E.CODIGOESTADOASIGNACION');
    qdatos.sql.add('AND A.TIPODATOORIGEN=''E''');
    qdatos.open;
    if qDatos.fieldbyname('CODIGOASIGNACIONEMG').AsFloat>0 then
    begin
      qODTHijaCodAsignacionExportacion.AsFloat:=qDatos.fieldbyname('CODIGOASIGNACIONEMG').AsFloat;
      qODTHijaFechaAsignacionExportacion.AsDateTime:=qDatos.fieldbyname('FECHAPROCESO').AsDateTime;
      qODTHijaEstadoAsignacionExportacion.AsString :=qDatos.fieldbyname('NOMBREESTADOASIGNACION').AsString;
    end;
    qDatos.Close;
    qdatos.sql.clear;
    qdatos.sql.add('SELECT A.CODIGOASIGNACIONEMG,A.FECHAPROCESO,E.NOMBREESTADOASIGNACION FROM EMG_ODTASIGNACION A,EMG_ESTADOASIGNACION E');
    qdatos.sql.add('WHERE A.CODIGOODT='+qODTHijaCODIGOODT.AsString);
    qdatos.sql.add('AND A.CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString);
    qdatos.sql.add('AND A.CODIGOESTADOASIGNACION=E.CODIGOESTADOASIGNACION');
    qdatos.sql.add('AND A.TIPODATOORIGEN=''I''');
    qdatos.open;
    if qDatos.fieldbyname('CODIGOASIGNACIONEMG').AsFloat>0 then
    begin
      qODTHijaCodAsignacionImportacion.AsFloat:=qDatos.fieldbyname('CODIGOASIGNACIONEMG').AsFloat;
      qODTHijaFechaAsignacionImportacion.AsDateTime:=qDatos.fieldbyname('FECHAPROCESO').AsDateTime;
      qODTHijaEstadoAsignacionImportacion.AsString :=qDatos.fieldbyname('NOMBREESTADOASIGNACION').AsString;
    end;
    qDatos.Free;
  end;
end;

procedure TFOdtUrbanaRural.qODTFECHAAPROBACIONValidate(Sender: TField);
begin
if Sender.AsDateTime < qODTPadre.FieldByName('FECHAEMISION').AsDateTime then
   raise Exception.Create('La Fecha de Aprobación No Puede Ser Menor que La Fecha de Emisión.');
end;

procedure TFOdtUrbanaRural.qODTPadreFECHAASIGNACIONValidate(
  Sender: TField);
begin
if Sender.AsDateTime <  qODTPadre.FieldByName('FECHAAPROBACION').AsDateTime then
   raise Exception.Create('La Fecha de Asignación No Puede Ser Menor que La Fecha de Aprobación.');
end;


procedure TFOdtUrbanaRural.qODTHijaFECHAINICIOTRABAJOValidate(
  Sender: TField);
var
  qDatos,query,qTiempo:TQuery;
  esperado,maximo,temp:Double;
  OdtHijaCruzada: string;
begin
  query:=TQuery.Create(Application);
  qDatos:=TQuery.Create(Application);
  try
    if (Sender.Text <> '' ) then
    begin
      if (Sender.AsDateTime < qODTPadre.FieldByName('FECHAASIGNACION').AsDateTime) then
        raise Exception.Create('La Fecha de Inicio de Trabajo No Puede Ser Menor que La Fecha de Asignación.');
      if (qODTHijaFECHAFINALTRABAJO.AsString <> '' )then
      begin
        if (Sender.AsDateTime > qODTHijaFECHAFINALTRABAJO.AsDateTime) then
          raise Exception.Create('La Fecha de Inicio de Trabajo No Puede Ser Mayor que La Fecha de final del trabajo.');
      end;
      if (qODTPadreFECHAINICIO.AsString<>'')then
      begin
        if (Sender.AsDateTime < qODTPadreFECHAINICIO.AsDateTime) then
          raise Exception.Create('La Fecha de inicio de Trabajo No Puede Ser Menor que La Fecha de inicial de la ODT padre.');
      end;
      if (qODTPadreFECHAFINAL.AsString <>'')then
      begin
        if (Sender.AsDateTime > qODTPadreFECHAFINAL.AsDateTime) then
          raise Exception.Create('La Fecha de inicio de Trabajo No Puede Ser Mayor que La Fecha de final de la ODT padre.');
      end;

      OdtHijaCruzada:= ValidarFechasHija(sender.AsDateTime);
      if OdtHijaCruzada <>  '' then
         raise Exception.Create('La Fecha de Inicio de Trabajo está dentro del intervalo de fechas de la ODT Hija No. '+OdtHijaCruzada);

      if  fechaservidoractual = 0 then  fechaservidoractual:= strtodatetime(fechaservidor);
      if (Sender.AsDateTime < fechaservidoractual) and (VERIFICARODTPERMISOSEDITAR('ODTFECHAANTERIOR') = false) then
        raise Exception.Create('La Fecha de Inicio de Trabajo ('+ Sender.Text +') No Puede Ser Menor que La Fecha actual del sistema ('+fechaservidor+').');

    end;

    esperado:=0;
    maximo:=0;
    qReporte.First;
    qTiempo:=TQuery.Create(Application);
    qTiempo.DatabaseName:='BaseDato';
    if qODTPadreCODIGOADMINISTRATIVO.AsString<>'' then
    begin
      qTiempo.sql.add('SELECT tiempoatencion,tiempomaximo FROM PLANTILLAREPORTE');
      qTiempo.sql.add('WHERE codigoadministrativo='+qODTPadreCODIGOADMINISTRATIVO.AsString);
      qTiempo.open;
    if qTiempo.RecordCount>0 then
    begin
      if (qTiempo.FieldByName('tiempoatencion').AsString<>'') then
        esperado:=qTiempo.FieldByName('tiempoatencion').AsFloat;
      if (qTiempo.FieldByName('tiempomaximo').AsString<>'') then
        maximo:=qTiempo.FieldByName('tiempomaximo').AsFloat;
      end;
    end;

    qTiempo.free;

    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT FECHAHORADICTADO FROM REPORTE WHERE CODIGOREPORTE=:CODIGOREPORTE');

    qDatos.DatabaseName:='BaseDato';
    if Sender.AsFloat <> 0 then
    begin
      qDatos.SQL.Add('UPDATE REPORTE SET FECHAHORALLEGADA = TO_DATE('''+FormatDateTime('dd/mm/yyyy h:mm:s',Sender.AsDateTime)+''',''DD/MM/YYYY HH24:MI:SS'')');
    end
    else
    begin
      qDatos.SQL.Add('UPDATE REPORTE SET FECHAHORALLEGADA = NULL');
    end;
    qDatos.SQL.Add('WHERE CODIGOREPORTE=:CODIGOREPORTE');
    while not qReporte.Eof do
    begin
      query.Close;
      query.Params[0].AsString:=qReporte.FieldByName('CODIGOREPORTE').AsString;
      query.Open;
      if (query.fieldbyname('FECHAHORADICTADO').AsDateTime>0) then
      begin
        if query.fieldbyname('FECHAHORADICTADO').AsDateTime>Sender.AsDateTime then
         raise exception.create('La fecha de inicio del trabajo no puede ser anterior a la hora de dictado del reporte');
        if (maximo>0) then
        begin
          temp:=(Sender.AsDateTime - query.fieldbyname('FECHAHORADICTADO').AsDateTime)*24*60;
          if (temp>maximo) then
          begin
          // tiempo de atencion mayor de atencion máximo permitido
              raise exception.create('El tiempo de dictado supera el tiempo máximo permitido.');
          end;
        end;
        if (esperado>0) then
        begin
          temp:=(Sender.AsDateTime - query.fieldbyname('FECHAHORADICTADO').AsDateTime)*24*60 ;
          if (temp>esperado) then  // tiempo de atencion mayor de atencion máximo esperado
          begin
            if (Application.MessageBox('El tiempo de llegada supera el tiempo máximo esperado.  Desea conservarlo?',PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idNo) then
            begin
              raise Exception.Create('La fecha inicial se descartó por superar el tiempo esperado');
            end;
          end;
        end;
        qDatos.Close;
        qDatos.Params[0].AsString:=qReporte.FieldByName('CODIGOREPORTE').AsString;
        qDatos.ExecSQL;
        qReporte.Next;
      end
      else
      begin
        raise Exception.Create('Debe ingresar la fecha de dictado del reporte '+qReporteCODIGOREPORTE.AsString+' antes de llenar la fecha de inicio del trabajo');
      end;
    end;
    qPresMano.First;
    while not qPresMano.Eof do
    begin
      try
        qPresMano.Edit;
        qPresManoFECHADIAODT.AsFloat := Int(Sender.AsDateTime);
        qPresMano.Post;
        qPresMano.Next;
      except
      end;
    end;
  except
  on e:exception do
    begin
      showmessage(e.message);
      qDatos.Close;
      qDatos.Free;
      query.Close;
      query.Free;
      qReporte.Close;
      qReporte.Open;
      raise;
    end;
  end;
end;

procedure TFOdtUrbanaRural.qODTHijaFECHAFINALTRABAJOValidate(
  Sender: TField);
var qDatos,query,qTiempo,qtemp,qConsulta:TQuery;
  esperado,maximo,temp:double;
begin
  qDatos:=TQuery.Create(Application);
  query:=TQuery.Create(Application);
  try
    if qODTHijaFECHAINICIOTRABAJO.Asstring<>'' then
    begin
      if (Sender.Text <> '' ) and (Sender.AsDateTime < qODTHija.FieldByName('FECHAINICIOTRABAJO').AsDateTime) then
        raise Exception.Create('La Fecha Final de Trabajo no puede ser anterior a la Fecha de Inicio de Trabajo.');
    end
    else
      raise Exception.Create('Debe ingresar la Fecha de Inicio de Trabajo antes de ingresar la Fecha de Final de Trabajo.');

    if (Sender.Text <> '' ) and (qODTHijaFECHAFINALTRABAJO.AsString<>'')then
    begin
      if (Sender.AsDateTime > qODTHijaFECHAFINALTRABAJO.AsDateTime) then
        raise Exception.Create('La Fecha Final de Trabajo no puede ser posterior a la Fecha Final de la ODT Padre.');
    end;
          
    esperado:=0;
    maximo:=0;
    qReporte.First;
    qTiempo:=TQuery.Create(Application);
    qTiempo.DatabaseName:='BaseDato';
    if qODTPadreCODIGOADMINISTRATIVO.AsString<>'' then
    begin
      qTiempo.sql.add('SELECT tiempoatencion,tiempomaximo FROM PLANTILLAREPORTE');
      qTiempo.sql.add('WHERE codigoadministrativo='+qODTPadreCODIGOADMINISTRATIVO.AsString);
      qTiempo.open;
      if qTiempo.RecordCount>0 then
      begin
        if (qTiempo.FieldByName('tiempoatencion').AsString<>'') then
          esperado:=qTiempo.FieldByName('tiempoatencion').AsFloat;
        if (qTiempo.FieldByName('tiempomaximo').AsString<>'') then
          maximo:=qTiempo.FieldByName('tiempomaximo').AsFloat;
      end;
    end;
    qTiempo.free;

    qDatos.DatabaseName:='BaseDato';
    if Sender.AsFloat <> 0 then
    begin
      qDatos.SQL.Add('UPDATE REPORTE SET FECHAHORAATENCION = TO_DATE('''+FormatDateTime('dd/mm/yyyy h:mm:s',Sender.AsDateTime)+''',''DD/MM/YYYY HH24:MI:SS'')');
    end
    else
      qDatos.SQL.Add('UPDATE REPORTE SET FECHAHORAATENCION = NULL');
    qDatos.SQL.Add('WHERE CODIGOREPORTE=:CODIGOREPORTE');
    qReporte.First;

    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT FECHAHORALLEGADA FROM REPORTE WHERE CODIGOREPORTE=:CODIGOREPORTE');
    while not qReporte.Eof do
    begin
      query.Close;
      query.Params[0].AsString:=qReporte.FieldByName('CODIGOREPORTE').AsString;
      query.Open;
      if (query.fieldbyname('FECHAHORALLEGADA').AsDateTime>0) then
      begin
        if Sender.AsDateTime >0 then
        begin
          if query.fieldbyname('FECHAHORALLEGADA').AsDateTime>Sender.AsDateTime then
            raise exception.create('La fecha final del trabajo no puede ser anterior a la hora de llegada del reporte');
        end;
        if (maximo>0) then
        begin
          temp:=(Sender.AsDateTime - query.fieldbyname('FECHAHORALLEGADA').AsDateTime)*24*60;
          if (temp>maximo) then
          begin
          // tiempo de atencion mayor de atencion máximo permitido
              raise exception.create('El tiempo de atención supera el tiempo máximo permitido.');
          end;
        end;
        if (esperado>0) then
        begin
          temp:=(Sender.AsDateTime - query.fieldbyname('FECHAHORALLEGADA').AsDateTime)*24*60 ;
          if (temp>esperado) then
          // tiempo de atencion mayor de atencion máximo esperado
          begin
            if (Application.MessageBox('El tiempo de dictado supera el tiempo máximo esperado.  Desea conservarlo?',PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idNo) then
            begin
              raise Exception.Create('La fecha inicial se descartó por superar el tiempo esperado');
            end;
          end;
        end;
        qDatos.Close;
        qDatos.Params[0].AsString:=qReporte.FieldByName('CODIGOREPORTE').AsString;
        qDatos.ExecSQL;

        qTemp:=TQuery.Create(Application);
        qTemp.DatabaseName:='BaseDato';
        qTemp.SQL.Add('UPDATE REPORTE SET CODIGOESTADOREPORTE = ''4''');
        qTemp.SQL.Add('WHERE CODIGOREPORTE = ' + qReporte.FieldByName('CODIGOREPORTE').AsString);
        qTemp.SQL.Add('AND (FECHAHORADICTADO IS NOT NULL)');
        qTemp.SQL.Add('AND (FECHAHORALLEGADA IS NOT NULL)');
        qTemp.SQL.Add('AND (FECHAHORAATENCION IS NOT NULL)');
        qTemp.ExecSQL;
        qtemp.sql.clear;
        qTemp.SQL.Add('UPDATE REPORTE SET CODIGOESTADOREPORTE = ''3''');
        qTemp.SQL.Add('WHERE CODIGOREPORTE = ' + qReporte.FieldByName('CODIGOREPORTE').AsString);
        qTemp.SQL.Add('AND (FECHAHORADICTADO IS NOT NULL)');
        qTemp.SQL.Add('AND (FECHAHORALLEGADA IS NOT NULL)');
        qTemp.SQL.Add('AND (FECHAHORAATENCION IS  NULL)');
        qTemp.ExecSQL;
        qTemp.Free;
        qReporte.Next;
      end
      else
      begin
        raise Exception.Create('Debe ingresar la fecha de llegada del reporte '+qReporteCODIGOREPORTE.AsString+' antes de llenar la fecha final del trabajo');
      end;
    end;

    //********************************++++MODULO MANTENIMIENTOS+++++****************************************
    //------------------------------------------------------------------------------------------------------

    qConsulta:= TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qconsulta.sql.text:= 'SELECT COUNT(*) AS cuenta FROM hve_seccionformatodatos s, hve_formatomttodatos f  '+
                         ' WHERE f.CODIGOFORMATOMTTODATOS = s.CODIGOFORMATOMTTODATOS AND s.codigoodt = '+qodthijacodigoodt.asstring+ ' and f.consecutivoodt =  '+qodthijaconsecutivo.asstring+ 'and s.fechaprueba is null';
    qconsulta.open;
    if qconsulta.FieldByName('cuenta').asinteger > 0 then
    Begin
      qconsulta.free;
      raise Exception.Create('Debe Registrar todas las pruebas asociadas antes de llenar la fecha final del trabajo');
    end
    else
    Begin
      qconsulta.close;
      qconsulta.sql.text:= 'update pm_tarea set codigoestadotarea = 2 where codigotarea = (select codigomantenimiento from hve_formatomttodatos '+
                           '   where codigoodt='+ qodthijacodigoodt.asstring +' AND consecutivoodt='+ qodthijaconsecutivo.asstring +') ';
      qconsulta.ExecSQL;
      qconsulta.sql.text:= 'update pm_mantenimiento  set FECHAFINEJEC = TO_DATE('''+FormatDateTime('dd/mm/yyyy h:mm:s',Sender.AsDateTime)+''',''DD/MM/YYYY HH24:MI:SS'') where codigomantenimiento = (select codigomantenimiento from hve_formatomttodatos '+
                           '   where codigoodt='+ qodthijacodigoodt.asstring +' AND consecutivoodt='+ qodthijaconsecutivo.asstring +') ';
      qconsulta.ExecSQL;
      qconsulta.free;
    end;
//********************************++++FIN  MODULO MANTENIMIENTOS+++++****************************************


  except
    on e:exception do
    begin
      showmessage(e.message);
      qDatos.Close;
      qDatos.Free;

      query.Close;
      query.Free;
      qReporte.Close;
      qReporte.Open;
      raise;
    end;
  end;
end;

procedure TFOdtUrbanaRural.qODTHijaCOSTOMATERIALValidate(Sender: TField);
begin
  if (Sender.Text <> '' ) and (qODTHijaCOSTOMATERIAL.AsFloat < 0) then
    raise Exception.Create('El Costo del Material No Puede Ser Negativo.');
end;

procedure TFOdtUrbanaRural.qODTHijaCOSTOMANOOBRAValidate(Sender: TField);
begin
  if (Sender.Text <> '' ) and (qODTHijaCOSTOMANOOBRA.AsFloat < 0) then
    raise Exception.Create('El Costo de Mano de Obra No Puede Ser Negativo.');
end;

procedure TFOdtUrbanaRural.qODTHijaCOSTOTRANSPORTEValidate(Sender: TField);
begin
 if (Sender.Text <> '' ) and (qODTHijaCOSTOTRANSPORTE.AsFloat < 0) then
   raise Exception.Create('El Costo de Transporte No Puede Ser Negativo.');
end;

procedure TFOdtUrbanaRural.qODTHijaCOSTOEQUIPOValidate(Sender: TField);
begin
 if (Sender.Text <> '' ) and (qODTHijaCOSTOEQUIPO.AsFloat < 0) then
   raise Exception.Create('El Costo de Equipo No Puede Ser Negativo.');
end;

procedure TFOdtUrbanaRural.qODTPadreCODIGOADMINISTRATIVOChange(
  Sender: TField);
var qDatos, qTemp:TQuery;
begin
  qDatos    :=TQuery.Create(Application);
  qTemp     :=TQuery.Create(Application);
  try
    qDatos.DataBaseName  :='BaseDato';
    qTemp.DataBaseName   :='BaseDato';
    qDatos.SQL.Text:='SELECT CODIGOMEDIDASEGURIDAD FROM MEDIDASEGURIDAD WHERE '+
                     'CODIGOADMINISTRATIVO = ' + Sender.AsString + ' ORDER BY ORDEN';
    qDatos.Open;
    qTemp.SQL.Text:='DELETE FROM ODTMEDIDASEGURIDAD WHERE (CODIGOODT='+qODTPadreCODIGOODT.AsString + ')' +
                      ' AND (CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString + ')';
    qTemp.ExecSQL;
    while not qDatos.Eof do
    begin
      qTemp.Close;
      qTemp.SQL.Text:='INSERT INTO ODTMEDIDASEGURIDAD VALUES('+qODTHijaCODIGOODT.AsString+','+
                       qODTHijaCONSECUTIVO.AsString+','+qDatos.Fields[0].AsString+','+ '1)';
      qTemp.ExecSQL;
      qDatos.Next;
    end;
  finally
    qDatos.Close;
    qDatos.Free;
    qTemp.Free;
    qMedidaSeguridad.Close;
    qMedidaSeguridad.Open;
    qGrupoTrabajo.Close;
    qGrupoTrabajo.Open;
  end;

end;

//Insertar Vehiculos Anteriores.
procedure TFOdtUrbanaRural.VehiculosAnteriores;
var qDatos:TQuery;
begin
  qDatos:=TQuery.Create(Application);
  qDatos.DataBaseName:='BaseDato';
  qDatos.SQL.Add('SELECT CODIGOVEHICULO FROM ODTVEHICULO WHERE CODIGOODT = ' + qODTPadreCODIGOODT.AsString);
  qDatos.SQL.Add('AND CONSECUTIVO = ' + IntToStr(qODTHijaCONSECUTIVO.AsInteger - 1));
  qDatos.Open;
  qODTVehiculo.Open;
  while not qDatos.Eof do
  begin
    qODTVehiculo.Insert;
    qODTVehiculoCODIGOVEHICULO.AsString:=qDatos.FieldByName('CODIGOVEHICULO').AsString;
    qODTVehiculo.Post;
    qDatos.Next;
  end;
  qDatos.Close;
  qDatos.Free;
end;

//Insertar el Personal de la ODT hija Anterior.
procedure TFOdtUrbanaRural.PersonalAnterior;
var
  qDatos: TQuery;
  Encontrado: boolean;
begin
  Encontrado:=false;
  qDatos:=TQuery.Create(Application);
  qDatos.DataBaseName:='BaseDato';
  qDatos.SQL.Add('SELECT CODIGOEMPLEADO FROM ODTPRESMANO WHERE CODIGOODT = ' + qODTPadreCODIGOODT.AsString);
  qDatos.SQL.Add('AND CONSECUTIVO = ' + IntToStr(qODTHijaCONSECUTIVO.AsInteger - 1));
  qDatos.Open;
  qPresMano.Open;
  while not qDatos.Eof do
  begin
    qPresMano.Insert;
    qPresManoCODIGOEMPLEADO.AsString:=qDatos.FieldByName('CODIGOEMPLEADO').AsString;
    qPresMano.Post;
    if (qDatos.FieldByName('CODIGOEMPLEADO').AsString=qODTPadreCODIGOEJECUTOR.AsString) then
      encontrado := true;
    qDatos.Next;
  end;
  qDatos.Close;
  qDatos.Free;
  if qODTPadreCODIGOEJECUTOR.AsString<>'' then
  begin
    if not(encontrado) then
    begin
      qPresMano.Insert;
      qPresManoCODIGOEMPLEADO.AsString:= qODTPadreCODIGOEJECUTOR.AsString;
      qPresMano.Post;
    end;
  end;
end;

//Insertar el Móvil Anterior.
procedure TFOdtUrbanaRural.MovilAnterior;
var qDatos: TQuery;
begin
  qDatos:=TQuery.Create(Application);
  qDatos.DataBaseName:='BaseDato';
  qDatos.SQL.Add('SELECT OD.CODIGOGRUPOTRABAJO FROM ODTDIA OD, GRUPOTRABAJO G, ODT O WHERE OD.CODIGOODT = ' + qODTPadreCODIGOODT.AsString);
  qDatos.SQL.Add(' AND OD.CONSECUTIVO = ' + IntToStr(qODTHijaCONSECUTIVO.AsInteger - 1));
  qDatos.SQL.Add(' AND O.CODIGOODT = OD.CODIGOODT AND OD.CODIGOGRUPOTRABAJO = G.CODIGOGRUPOTRABAJO AND O.CODIGOADMINISTRATIVO = G.CODIGOADMINISTRATIVO AND G.ACTIVO = ''S''');
  qDatos.Open;
  qODTHijaCODIGOGRUPOTRABAJO.AsString := qDatos.FieldByName('CODIGOGRUPOTRABAJO').AsString;
  qDatos.Close;
  qDatos.Free;
end;

procedure TFOdtUrbanaRural.qODTHijaAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('COSTOMANOOBRA').AsFloat          := 0;
    FieldByName('COSTOMATERIAL').AsFloat          := 0;
    FieldByName('COSTOTRANSPORTE').AsFloat        := 0;
    FieldByName('COSTOEQUIPO').AsFloat            := 0;
  end;
end;

procedure TFOdtUrbanaRural.DBGridVehiculosEditButtonClick(Sender: TObject);
var i:Integer;
begin
try
 fVehiculo:=TfVehiculo.Create(Application);
 if fVehiculo.ShowModal=mrOK then
 begin
   try
       if fVehiculo.DBGrid1.SelectedRows.Count > 0 then
          for i:=0 to fVehiculo.DBGrid1.SelectedRows.Count-1 do
             begin
               fVehiculo.qVehiculo.BookMark:=fVehiculo.DBGrid1.SelectedRows.Items[i];
               if (DBGridVehiculos.Fields[0].Text<>'') then qODTVehiculo.Edit
               else
               begin
                if (qODTVehiculo.State in [dsInsert]) then
                      qODTVehiculo.Cancel;
                 qODTVehiculo.Insert;
               end;
               qODTVehiculoCODIGOVEHICULO.AsString:=fVehiculo.qVehiculoCODIGOVEHICULO.AsString;
               qODTVehiculo.Post;
               qODTVehiculo.Insert;
            end;
     except
        On E:Exception do
        begin
          ShowMessage(E.Message);
          qODTVehiculo.Cancel;
        end;
     end;
   if qODTVehiculo.State in [dsInsert] then qODTVehiculo.Cancel;
   qODTVehiculo.Close;
   qODTVehiculo.Open;
  if (not qODTVehiculo.IsEmpty) and (qODTVehiculoCODIGOVEHICULO.AsString = '') then
     qODTVehiculo.Delete;

end;
finally
  fVehiculo.Free;
end;
end;

procedure TFOdtUrbanaRural.DBGridReportesDblClick(Sender: TObject);
begin
If qReporteCODIGOREPORTE.AsString <> '' then
begin
     fReporte:=TfReporte.Create(Application);
     fReporte.qReporte.Close;
     fReporte.qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE='+qReporteCODIGOREPORTE.AsString;
     fReporte.qReporte.Open;
     fReporte.qReporte.Edit;
     fReporte.Visible:=false;
     if fReporte.ShowModal = mrOk then
     begin
       qReporte.Close;
       qReporte.Open;
     end;
     fReporte.Free;
//   end;
end;
end;

procedure TFOdtUrbanaRural.qODTPadreCODIGOESTADOODTChange(Sender: TField);
var Error:Boolean;
begin
  Error:=False;
  if Sender.Text = '6' then //Terminada
  begin
    if qODTPadreFECHAASIGNACION.AsFloat = 0 then
      Error:=True;
    if qODTPadreFECHAAPROBACION.AsFloat = 0 then
      Error:=True;
    if qODTHijaFECHAINICIOTRABAJO.AsFloat = 0 then
      Error:=True;
    if qODTHijaFECHAFINALTRABAJO.AsFloat = 0 then
      Error:=True;
  end;
  if Error then
    raise Exception.Create('No Puede Asignar El Estado de Teminada a La ODT, Sin Primero Definir'+Chr(13)+
                           'Todas Las Fechas En La Sección Programación.');
end;

procedure TFOdtUrbanaRural.qStockAfterPost(DataSet: TDataSet);
begin
   qStock.ApplyUpdates;
   qStock.CommitUpdates;
end;

procedure TFOdtUrbanaRural.dblcbTipoElementoCloseUp(Sender: TObject);
begin
 if qODTHijaCODIGOSUBESTACION.AsString ='' then
   raise Exception.Create('Debe primero escoger una Subestación.');

 if qODTHijaCODIGOTIPOELEMENTO.AsString = '' then Exit;

 qEquipo.Close;
 qEquipo.SQL.Clear;
 case qODTHijaCODIGOTIPOELEMENTO.AsInteger of
   //Barraje
   30:qEquipo.SQL.Text:='SELECT CODIGOBARRAJE AS CODIGOEQUIPO FROM BARRAJE WHERE CODIGOSUBESTACION='''
                        +qODTHijaCODIGOSUBESTACION.AsString+'''';
   //Transformador Auxiliar
   31:qEquipo.SQL.Text:='SELECT CODIGOTRAFOAUXILIAR AS CODIGOEQUIPO FROM TRAFOAUXILIAR WHERE CODIGOSUBESTACION='''
                        +qODTHijaCODIGOSUBESTACION.AsString+'''';
   //Transformador de Corriente
   32:qEquipo.SQL.Text:='SELECT CODIGOTRAFOCORRIENTE AS CODIGOEQUIPO FROM TRAFOCORRIENTE WHERE CODIGOSUBESTACION='''
                        +qODTHijaCODIGOSUBESTACION.AsString+'''';
   //Transformador de Potencial
   33:qEquipo.SQL.Text:='SELECT CODIGOTRAFOPOTENCIAL AS CODIGOEQUIPO FROM TRAFOPOTENCIAL WHERE CODIGOSUBESTACION='''
                        +qODTHijaCODIGOSUBESTACION.AsString+'''';
   //Transformador de Subestacion
   34:qEquipo.SQL.Text:='SELECT CODIGOTRAFOSUB AS CODIGOEQUIPO FROM TRAFOSUB WHERE CODIGOSUBESTACION='''
                        +qODTHijaCODIGOSUBESTACION.AsString+'''';
   //Circuito
   35:qEquipo.SQL.Text:='SELECT CODIGOCIRCUITO AS CODIGOEQUIPO FROM CIRCUITO WHERE CODIGOCIRCUITO LIKE '''
                        +qODTHijaCODIGOSUBESTACION.AsString+'%''';
   //Interruptor Subestacion
   37:qEquipo.SQL.Text:='SELECT CODIGOINTERRUPTORSUB AS CODIGOEQUIPO FROM INTERRUPTORSUB WHERE CODIGOSUBESTACION='''
                        +qODTHijaCODIGOSUBESTACION.AsString+'''';
   //Seccionador
   38:qEquipo.SQL.Text:='SELECT CODIGOSECCIONADOR AS CODIGOEQUIPO FROM SECCIONADOR WHERE CODIGOSUBESTACION='''
                        +qODTHijaCODIGOSUBESTACION.AsString+'''';
   //Generador
   39:qEquipo.SQL.Text:='SELECT CODIGOGENERADOR AS CODIGOEQUIPO FROM GENERADOR WHERE CODIGOSUBESTACION='''
                        +qODTHijaCODIGOSUBESTACION.AsString+'''';
   //Pararrayo
   40:qEquipo.SQL.Text:='SELECT CODIGOGENERADOR AS CODIGOEQUIPO FROM GENERADOR WHERE CODIGOSUBESTACION='''
                        +qODTHijaCODIGOSUBESTACION.AsString+'''';
   //Condensador Subestacion
   41:qEquipo.SQL.Text:='SELECT CODIGOCONDENSADORSUB AS CODIGOEQUIPO FROM CONDENSADORSUB WHERE CODIGOSUBESTACION='''
                        +qODTHijaCODIGOSUBESTACION.AsString+'''';
   //Trampa de Onda
   42:qEquipo.SQL.Text:='SELECT CODIGOTRAMPAONDA AS CODIGOEQUIPO FROM TRAMPAONDA WHERE CODIGOTRAMPAONDA='''
                        +qODTHijaCODIGOSUBESTACION.AsString+'''';
   //Banco de Baterias
   43:qEquipo.SQL.Text:='SELECT CODIGOBANCOBATERIA AS CODIGOEQUIPO FROM BANCOBATERIA WHERE CODIGOTRAMPAONDA='''
                        +qODTHijaCODIGOSUBESTACION.AsString+'''';
   //Cargador de Baterias
   44:qEquipo.SQL.Text:='SELECT CODIGOCARGADORBATERIA AS CODIGOEQUIPO FROM CARGADORBATERIA WHERE CODIGOTRAMPAONDA='''
                        +qODTHijaCODIGOSUBESTACION.AsString+'''';
 end;
 qEquipo.Open;
end;

procedure TFOdtUrbanaRural.dblcbTipoElementoDropDown(Sender: TObject);
begin
 if qODTHijaCODIGOSUBESTACION.AsString ='' then
   raise Exception.Create('Debe primero escoger una Subestación.');
end;


procedure TFOdtUrbanaRural.dblcbSubestacionCloseUp(Sender: TObject);
begin
 dblcbTipoElementoCloseUp(nil);
end;

procedure TFOdtUrbanaRural.bbImprimirClick(Sender: TObject);
var punto:TPoint;
begin
  punto:=pInferior.ClientToScreen(Classes.Point(bbImprimir.Left, bbImprimir.top));
  pmImprimir.Popup(punto.x+10, punto.y+10);
end;

procedure TFOdtUrbanaRural.GroupBox3DblClick(Sender: TObject);
begin
 if nbUbicacion.PageIndex = 0 then
    nbUbicacion.PageIndex:=1
 else
    nbUbicacion.PageIndex:=0;
end;

procedure TFOdtUrbanaRural.FormatoAnterior;
var qDatos, qTemp, qMedidasSeguridad:TQuery;
    Encontrado:Integer;
    s:string;
begin
   qDatos:=TQuery.Create(Application);
   qTemp :=TQuery.Create(Application);
   qMedidasSeguridad:=TQuery.Create(Application);
   qDatos.DatabaseName:='BaseDato';
   qTemp.DatabaseName :='BaseDato';
   qMedidasSeguridad.DatabaseName:='BaseDato';
   qDatos.SQL.Text:='SELECT * FROM ODTDIA WHERE CODIGOODT = '+qODTPadreCODIGOODT.AsString +
                    ' ORDER BY CONSECUTIVO';
   qDatos.Open;

   if ((qodthijaMODIFICADORVIA.asstring <> '') or (qodthijaMODIFICADORDUPLICADOR.asstring <> '') or  (qodthijaNUMEROPUERTA.asstring <> '') or  (qodthijaCODIGOTIPOPREDIO.asstring <> '') or  (qodthijaDESCRIPCIONTIPOPREDIO.asstring <> '')) then
   Begin
     qTemp.SQL.Text:='SELECT DIR_ODT('+qODTPadreCODIGOODT.AsString+',0) FROM DUAL';
     qTemp.Open;
   end;

   qCIG.Close;
   qCIG.Params[0].AsString:=qDatos.FieldByName('CODIGOGEOGRAFICO').AsString;
   qCIG.Open;

   fQRODTUrbanaRural:=TfQRODTUrbanaRural.Create(Application);
   try
    with fQRODTUrbanaRural do
    begin
     qrdbFechaEmision.DataSet:=qODTPadre;
     qrdbCodigoODT.DataSet   :=qDatos;

     if ((qodthijaMODIFICADORVIA.asstring <> '') or (qodthijaMODIFICADORDUPLICADOR.asstring <> '') or  (qodthijaNUMEROPUERTA.asstring <> '') or  (qodthijaCODIGOTIPOPREDIO.asstring <> '') or  (qodthijaDESCRIPCIONTIPOPREDIO.asstring <> '')) then
     Begin
       qrlDireccion.Caption    :=qTemp.Fields[0].AsString;
     end;

     qrlCIG.Caption          :=qCIG.Fields[0].AsString;

     qTemp.Close;
     qTemp.SQL.Text:='SELECT NOMBRESUBESTACION FROM SUBESTACION WHERE CODIGOSUBESTACION = '''+qDatos.FieldByName('CODIGOSUBESTACION').AsString+'''';
     qTemp.Open;
     qrlSubestacion.Caption:=qTemp.Fields[0].AsString;

     qTemp.Close;
     qTemp.SQL.Text:='SELECT NOMBRETIPOELEMENTO FROM TIPOELEMENTO WHERE CODIGOTIPOELEMENTO = '''+qDatos.FieldByName('CODIGOTIPOELEMENTO').AsString+'''';
     qTemp.Open;
     qrlTipoElemento.Caption:=qTemp.Fields[0].AsString;

     qrlEquipo.Caption:=qDatos.FieldByName('CODIGOEQUIPO').AsString;

     qTemp.Close;
     qTemp.SQL.Text:='SELECT CODIGOVEHICULO FROM ODTVEHICULO WHERE CODIGOODT='+qDatos.FieldByName('CODIGOODT').AsString+
                     ' AND CONSECUTIVO = 0';
     qTemp.Open;
     s:='';
     while not qTemp.Eof do
     begin
        s:=s + qTemp.Fields[0].AsString + ' - ';
        qTemp.Next;
     end;
     if s <> '' then Delete(s,Length(s)-2,2);
     qrlVehiculos.Caption:=s;

     qrlNormal.Caption:='';
     qrlUrgente.Caption:='';
     qrlEmergencia.Caption:='';
     case qODTPadreCODIGOPRIORIDAD.AsInteger of
       1:qrlNormal.Caption     :='Ö';
       2:qrlUrgente.Caption    :='Ö';
       3:qrlEmergencia.Caption :='Ö';
     end;
     qrlEnergizado.Caption    :='';
     qrlDesenergizado.Caption :='';
     if qODTPadreEQUIPOENERGIZADO.AsString = 'S' then
        qrlEnergizado.Caption :='Ö';
     if qODTPadreEQUIPOENERGIZADO.AsString = 'N' then
        qrlDesenergizado.Caption :='Ö';

     qrlLabor.Caption:=dbeNombreLabor.Text;
     qrlTarea.Caption:=dbeTipoTarea.Text;

     if qODTPadreFECHAASIGNACION.AsFloat <> 0 then
        qrdbFechaAsignacion.DataSet    :=qODTPadre;
     if qODTPadreFECHAAPROBACION.AsFloat <> 0 then
        qrdbFechaAprobacion.DataSet    :=qODTPadre;
     if qDatos.FieldByName('FECHAINICIOTRABAJO').AsFloat <> 0 then
        qrdbFechaInicioTrabajo.DataSet :=qDatos;
     if qDatos.FieldByName('FECHAFINALTRABAJO').AsFloat <> 0 then
        qrdbFechaFinalTrabajo.DataSet  :=qDatos;

     qrdbMotivos.DataSet:=qODTPadre;
     qrlAdministrativo.Caption :=qODTPadreNombreAdministrativo.AsString;
     qrlTipoManoObra.Caption   :=dbeTipoManoObra.Text;
     qrlGrupoTrabajo.Caption   :=dblcbGrupoTrabajo.Text;
     qrlAprobado.Caption       := qODTPadreNombreAprobado.AsString;
     qrlRevisado.Caption       := qODTPadreNombreRevisado.AsString;
     qrlEjecutado.Caption      := qODTPadreNombreEjecutado.AsString;

     qMedidasSeguridad.SQL.Add('SELECT M.NOMBREMEDIDASEGURIDAD, OM.ESTADO, LENGTH(M.NOMBREMEDIDASEGURIDAD) FROM');
     qMedidasSeguridad.SQL.Add('MEDIDASEGURIDAD M, ODTMEDIDASEGURIDAD OM');
     qMedidasSeguridad.SQL.Add('WHERE (M.CODIGOMEDIDASEGURIDAD = OM.CODIGOMEDIDASEGURIDAD)');
     qMedidasSeguridad.SQL.Add('AND (OM.CODIGOODT=:CODIGOODT) AND (OM.CONSECUTIVO=:CONSECUTIVO)');
     qMedidasSeguridad.ParamByName('CODIGOODT').AsString:=qODTPadreCODIGOODT.AsString;
     qMedidasSeguridad.ParamByName('CONSECUTIVO').AsString:='0';
     qMedidasSeguridad.Open;

     qTemp.Close;
     qTemp.SQL.Clear;
     qTemp.SQL.Add('SELECT MAX (LENGTH(M.NOMBREMEDIDASEGURIDAD)) FROM');
     qTemp.SQL.Add('MEDIDASEGURIDAD M, ODTMEDIDASEGURIDAD OM');
     qTemp.SQL.Add('WHERE (M.CODIGOMEDIDASEGURIDAD = OM.CODIGOMEDIDASEGURIDAD)');
     qTemp.SQL.Add('AND (OM.CODIGOODT=:CODIGOODT) AND (OM.CONSECUTIVO=:CONSECUTIVO)');
     qTemp.ParamByName('CODIGOODT').AsString:=qODTPadreCODIGOODT.AsString;
     qTemp.ParamByName('CONSECUTIVO').AsString:='0';
     qTemp.Open;

     while not qMedidasSeguridad.Eof do
     begin
         if qMedidasSeguridad.FieldByName('ESTADO').AsInteger = 1 then
             QRedMedidas1.ParentRichEdit.Lines.Add('Ö ' + qMedidasSeguridad.FieldByName('NOMBREMEDIDASEGURIDAD').AsString);
       qMedidasSeguridad.Next;
     end;


     with QRedMedidas1 do
     begin
        Encontrado:=ParentRichEdit.FindText('Ö', 0, Length(Text), [stMatchCase]);
        while (Encontrado <> -1) do
        begin
         ParentRichEdit.SelStart:=Encontrado;
         ParentRichEdit.SelLength:=1;
         ParentRichEdit.SelAttributes.Name:='Symbol';
         Encontrado:=ParentRichEdit.FindText('Ö', Encontrado + 1, Length(ParentRichEdit.Text), [stWholeWord]);
        end;
     end;

     qrdbCostoManoObra.DataSet:=qODTPadre;
     qrdbCostoMaterial.DataSet:=qODTPadre;
     qrdbCostoTransporte.DataSet:=qODTPadre;
     qrdbCostoEquipo.DataSet:=qODTPadre;

     qrdbCostoManoObraP.DataSet:=qDatos;
     qrdbCostoMaterialP.DataSet:=qDatos;
     qrdbCostoTransporteP.DataSet:=qDatos;
     qrdbCostoEquipoP.DataSet:=qDatos;

     qrdbObservacion2.DataSet:=qDatos;
     qrdbObservacion3.DataSet:=qDatos;

     QuickRep.Preview;
     Application.ProcessMessages;
    end;
   finally
    qDatos.Close;
     qDatos.Free;
     qTemp.Free;
     qMedidasSeguridad.Free;
   end;
end;

procedure TFOdtUrbanaRural.FormatoActual;
function VehiculosAsociados:string;
var qTemp:TQuery;
    ListaTemp:TStringList;
    I,J:Integer;
begin
  qTemp:=TQuery.Create(Application);
  ListaTemp:=TStringList.Create;
  try
    qTemp.DatabaseName:='BaseDato';

    ListaTemp.Duplicates:=dupIgnore;
    ListaTemp.Sorted:=True;

    qTemp.SQL.Text:='SELECT CODIGOVEHICULO FROM ODTVEHICULO WHERE CODIGOODT='+qODTPadreCODIGOODT.AsString;
    qTemp.Open;
    while not qTemp.Eof do
    begin
     ListaTemp.Add(qTemp.Fields[0].AsString);
     qTemp.Next;
    end;
    Result:='';
    J:=ListaTemp.Count - 1;
    for I:=0 to J do
     if I <> J then
        Result:= Result + ListaTemp[I] + ','
     else
        Result:= Result + ListaTemp[I];
  except
    qTemp.Free;
    ListaTemp.Free;
    Result:='';
  end;

end;
//Fin Funcion

var qTemp:TQuery;
begin
  qTemp:=TQuery.Create(Application);
  fQRODTUrbanaRuralAdc:= TfQRODTUrbanaRuralAdc.Create(Application);
  try
   with fQRODTUrbanaRuralAdc do
   begin
     qTemp.DatabaseName:='BaseDato';

     qODTPadre.Close;
     qODTPadre.Open;
     //EQUIPO ENERGIZADO
     if ((qodthijaMODIFICADORVIA.asstring <> '') or (qodthijaMODIFICADORDUPLICADOR.asstring <> '') or  (qodthijaNUMEROPUERTA.asstring <> '') or  (qodthijaCODIGOTIPOPREDIO.asstring <> '') or  (qodthijaDESCRIPCIONTIPOPREDIO.asstring <> '')) then
     Begin
       qDireccion.open;
     end;
     qrlEnergizado.Caption    :='';
     qrlDesenergizado.Caption :='';
     if qODTPadreEQUIPOENERGIZADO.AsString = 'S' then
        qrlEnergizado.Caption :='Ö';
     if qODTPadreEQUIPOENERGIZADO.AsString = 'N' then
        qrlDesenergizado.Caption :='Ö';

     //VEHICULOS
     qrlVehiculos.Caption:=VehiculosAsociados();

     //PRIORIDAD DEL TRABAJO
     qrlNormal.Caption:='';
     qrlUrgente.Caption:='';
     qrlEmergencia.Caption:='';
     case qODTPadreCODIGOPRIORIDAD.AsInteger of
       1:qrlNormal.Caption     :='Ö';
       2:qrlUrgente.Caption    :='Ö';
       3:qrlEmergencia.Caption :='Ö';
     end;

     //LABOR Y TAREA
     qrlLabor.Caption:=dbeNombreLabor.Text;
     qrlTarea.Caption:=dbeTipoTarea.Text;

     //ASIGNACION
     qrlAdministrativo.Caption :=qODTPadreNombreAdministrativo.AsString;
     qrlTipoManoObra.Caption   :=dbeTipoManoObra.Text;
     qrlGrupoTrabajo.Caption   :=dblcbGrupoTrabajo.Text;
     qrlAprobado.Caption       :=qODTPadreNombreAprobado.AsString;
     qrlRevisado.Caption       :=qODTPadreNombreRevisado.AsString;
     qrlEjecutado.Caption      :=qODTPadreNombreEjecutado.AsString;
     QuickRep1.Preview;
   end;
  finally
   qTemp.Free;
  end;
end;

procedure TFOdtUrbanaRural.menuFormatoActual1Click(Sender: TObject);
begin
  FormatoActual;
end;

procedure TFOdtUrbanaRural.FormatoAnterior1Click(Sender: TObject);
begin
  FormatoAnterior;
end;

procedure TFOdtUrbanaRural.qStockCANTIDADACTUALValidate(Sender: TField);
begin
  if Sender.Text <> '' then
  begin
  if (qStock.FieldByName('CANTIDADACTUAL').AsFloat + qPresMateCantidadStock.AsFloat)  < qStock.FieldByName('CANTIDADMINIMA').AsFloat then

    MessageDlg('La cantidad actual del material: '+ Chr(13) + qPresMateNombreMaterial.AsString +
                           Chr(13)+ 'esta por debajo de la cantidad minima definida.', mtInformation,[mbOk],0);
  end;
end;

procedure TFOdtUrbanaRural.qODTActividadAfterInsert(DataSet: TDataSet);
begin
  qODTActividadCODIGOODT.AsString:=qODTHijaCODIGOODT.AsString;
  qODTActividadCONSECUTIVO.AsString:=qODTHijaCONSECUTIVO.AsString;
end;

procedure TFOdtUrbanaRural.qODTActividadCalcFields(DataSet: TDataSet);

function CompletarCero(Valor :string):string;
begin
  if Length(Valor) = 1 then
    Result:='0' + Valor;
end;


begin
  with DataSet do
  begin
    FieldByName('CodigoCalculado').AsString:=FieldByName('CODIGONIVELTENSION').AsString +
                                             CompletarCero(FieldByName('CODIGOODTOPERA').AsString) +
                                             CompletarCero(FieldByName('CODIGOODTACTIVIDAD').AsString);
    qActividad.Close;
    qActividad.ParamByName('CODIGONIVELTENSION').AsString:=FieldByName('CODIGONIVELTENSION').AsString;
    qActividad.ParamByName('CODIGOODTOPERA').AsString:=FieldByName('CODIGOODTOPERA').AsString;
    qActividad.ParamByName('CODIGOODTACTIVIDAD').AsString:=FieldByName('CODIGOODTACTIVIDAD').AsString;
    qActividad.Open;
    FieldByName('NombreActividad').AsString:=qActividad.Fields[0].AsString;
  end;
end;

procedure TFOdtUrbanaRural.qODTActividadAfterPost(DataSet: TDataSet);
begin
  qODTActividad.ApplyUpdates;
  qODTActividad.CommitUpdates;
end;

procedure TFOdtUrbanaRural.ActividadesODT;
var i:integer;
begin
  fBuscarActividadOdt:=tfBuscarActividadOdt.Create(Application);
  try
    if fBuscarActividadOdt.showmodal=mrok then
    begin
      try
        if fBuscarActividadOdt.dbgactividad.SelectedRows.Count > 0 then
        begin
          for i:=0 to fBuscarActividadOdt.dbgactividad.SelectedRows.Count-1 do
          begin
            fBuscarActividadOdt.qOdtActividad.BookMark:=fBuscarActividadOdt.dbgactividad.SelectedRows.Items[i];
            if qODTActividadCODIGOODTACTIVIDAD.AsFloat <> 0 then qODTActividad.Edit
            else
            begin
              if (qODTActividad.State in [dsInsert]) then
                qODTActividad.Cancel;
              qODTActividad.Insert;
            end;
            qODTActividadCODIGONIVELTENSION.AsString := fBuscarActividadOdt.qOdtActividadCODIGONIVELTENSION.AsString;
            qODTActividadCODIGOODTOPERA.AsString :=fBuscarActividadOdt.qOdtActividadCODIGOODTOPERA.AsString;
            qODTActividadCODIGOODTACTIVIDAD.AsString :=fBuscarActividadOdt.qOdtActividadCODIGOODTACTIVIDAD.AsString;
            qODTActividad.Post;
            qODTActividad.Insert;
          end;
        end;
      except
        qODTActividad.Cancel;
      end;
      if (not qODTActividad.IsEmpty) and (qODTActividadCODIGOODTACTIVIDAD.AsString = '') then
         qODTActividad.Delete;
    end;
  except
  end;
  fBuscarActividadOdt.free;
end;

procedure TFOdtUrbanaRural.qODTActividadUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  MessageDlg('Datos Incompletos o Erróneos.',mtWarning,[mbOk],0);
  UpdateAction:=uaAbort;
end;

function TFOdtUrbanaRural.EditarODT: Boolean;
var qDatos:TQuery;
begin
  Result:=False;
  try
    ConsDll.RefrescarVariables;
  except
  end;
  if VarCodigoUsuario = 0 then //Es Admin ?
  begin
    Result:=True;
    Exit;
  end;
  qDatos:=TQuery.Create(Application);
  try
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Add('SELECT EDITAR FROM ODTPERMISOS WHERE NOMBRETABLA = ''ODT''');
    qDatos.SQL.Add('AND CODIGOUSUARIO = ' + IntToStr(VarCodigoUsuario));
    qDatos.SQL.Add('AND CODIGOADMINISTRATIVO = ' + qODTPadreCODIGOADMINISTRATIVO.AsString);
    qDatos.Open;
    if qDatos.Fields[0].AsString = 'S' then
      Result:=True;
  finally
    qDatos.Free;
  end;
end;


function TFOdtUrbanaRural.imprimirNotaIngenieria: Boolean;
var qDatos:TQuery;
begin
  Result:=False;
  try
    ConsDll.RefrescarVariables;
  except
  end;
  if VarCodigoUsuario = 0 then //Es Admin ?
  begin
    Result:=True;
    Exit;
  end;
  qDatos:=TQuery.Create(Application);
  try
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Add('SELECT REABRIR FROM ODTPERMISOS WHERE NOMBRETABLA = ''ODT''');
    qDatos.SQL.Add('AND CODIGOUSUARIO = ' + IntToStr(VarCodigoUsuario));
    qDatos.SQL.Add('AND CODIGOADMINISTRATIVO = ' + qODTPadreCODIGOADMINISTRATIVO.AsString);
    qDatos.Open;
    if qDatos.Fields[0].AsString = 'S' then
      Result:=True;
  finally
    qDatos.Free;
  end;
end;


function TFOdtUrbanaRural.EditarMantenimiento: Boolean;
var qDatos:TQuery;
begin
  Result:=False;
  try
    ConsDll.RefrescarVariables;
  except
  end;
  if VarCodigoUsuario = 0 then //Es Admin ?
  begin
    Result:=True;
    Exit;
  end;
  qDatos:=TQuery.Create(Application);
  try
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Add('SELECT EDITAR FROM ODTPERMISOS WHERE NOMBRETABLA = ''MANTENIMIENTO''');
    qDatos.SQL.Add('AND CODIGOUSUARIO = ' + IntToStr(VarCodigoUsuario));
    qDatos.SQL.Add('AND CODIGOADMINISTRATIVO = ' + qODTPadreCODIGOADMINISTRATIVO.AsString);
    qDatos.Open;
    if qDatos.Fields[0].AsString = 'S' then
      Result:=True;
  finally
    qDatos.Close;
    qDatos.Free;
  end;
end;

procedure TFOdtUrbanaRural.FormShow(Sender: TObject);
var i:Integer;
  qconsulta,qconsultaodt:tquery;
  mantenimiento:boolean;
  mensaje:string;
begin
  Application.ProcessMessages;
  qODTPadre.Tag:=99;
  qODTHija.Tag:=99;

  Permiso:=imprimirNotaIngenieria;
  MaterialModificado:= false;
  if qODTHijaODTGENERADA.AsString<>'SI' then
  begin
    Edit4.Visible:=false;
    DBETipoElementoMtto.Visible:=false;
    dblkCodigoTipoElemento.BringToFront;
    DBEdCodigoTipoElemento.BringToFront;
  end
  else
  begin
    if qTipoElementoMtto.Active then
      qTipoElementoMtto.Close;
    qTipoElementoMtto.ParamByName('CODIGOELEMENTO').AsInteger:=qODTHijaCODIGOTIPOELEMENTO.AsInteger;
    qTipoElementoMtto.Open;
    Edit4.Text:=qTipoElementoMtto.Fields[1].AsString;
    Edit4.Visible:=true;
    DBETipoElementoMtto.Visible:=true;
    dblkCodigoTipoElemento.Enabled:=false;
    dblkCodigoTipoElemento.SendToBack;
    DBEdCodigoTipoElemento.SendToBack;
  end;
  qConsulta := TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.SQL.Add('SELECT LOGINUSUARIO FROM USUARIO');
  qConsulta.SQL.Add('WHERE CODIGOUSUARIO = ' + IntToStr(VarCodigoUsuario));
  qConsulta.Open;
  NombreUsuario := qConsulta.Fields[0].AsString;
  qConsulta.Close;
  qConsulta.FREE;
  llenarGestionAdministrativa;
  //if qODTHija.State in [dsInsert] then


  //*******************Impresion Requisicion Inicio *****************************
  //Interfaz OW

  if ((qODTPADRECODIGOTIPOTAREA.asInteger=128) OR (qODTPADRECODIGOTIPOTAREA.asInteger=129) OR (qODTPADRECODIGOTIPOTAREA.asInteger=130)) then
  begin
    if (ValidarAjusteStock)and(qPresMate.RecordCount=0)
      and(qPresMano.RecordCount > 0)and (qODtHIJACODIGOGRUPOTRABAJO.asString<>'') then
        IngresarMaterialAjuste;
  end;

  if bPermiteGestionMATERIALES then
  begin
    sbEditarRequisicion.Enabled := qRequisiciones.RecordCount <> 0;
    sbImprimirRequisicion.Enabled := sbEditarRequisicion.Enabled;
    sbEliminarRequisicion.enabled := sbEditarRequisicion.Enabled;

    sbEditarTraslado.Enabled:= qtraslados.RecordCount <> 0;
    sbEliminartraslado.Enabled:= sbEditarTraslado.Enabled;
    sbimprimirtraslado.Enabled:= sbEditarTraslado.Enabled;

    sbEditarReintegro.Enabled:= qReintegros.RecordCount <> 0;
    sbEliminarReintegro.Enabled:= sbEditarReintegro.Enabled;
    sbImprimirReintegro.Enabled:= sbEditarReintegro.Enabled;
  end;

  if qODTHija.State in [dsEdit] then
  begin
    qConsulta := TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.SQL.Add('update odtrequisicion set IMPRESOREQUISICION = ''S'' ');
    qConsulta.SQL.Add('where codigoodt = '+qODTPadreCODIGOODT.AsString + ' and consecutivo = '+qODTHijaCONSECUTIVO.AsString);
    qConsulta.ExecSQL;
    qConsulta.FREE;
    if not EditarODT then
    Begin
      sbDevoluciones.enabled:= false;
      sbImprimirRequisicion.enabled:= false;
      sbImprimirTraslado.enabled:= false;
    end;
  end; 
//******************* Impresion Requisicion Fin *********************************


  Caption:='Orden de Trabajo Hija No ' + qODTPadreCODIGOODT.AsString + '-'+qODTHijaCONSECUTIVO.AsString;
  if qODTHija.State in [dsEdit] then
  begin
    if not EditarODT then
    begin
//      mantenimiento:=EditarMantenimiento;
//      if not mantenimiento then
        bbAceptar.Enabled:=False;
        bbCancelar.Enabled:=false;
        bCerrar.Visible:=true;
        sbCancelarODTHija.Enabled:= False;
      try
        for i:=0 to ComponentCount - 1 do
        begin
          if (Components[i] is TQuery) then
          begin
            if (not mantenimiento) or ((TQuery(Components[i])).Tag<>99) then
            begin
              (TQuery(Components[i])).CachedUpdates:=false;
              (TQuery(Components[i])).UpdateObject:=nil;
            end;
          end
          else
          begin
            if (Components[i] is Twincontrol) then
            begin
              if ((TWinControl(Components[i])).Tag=21) then
              begin
                (TWinControl(Components[i])).Enabled:=false;
              end;
              if (Components[i] is TDBNavigator) then
              begin
                (TDBNavigator(Components[i])).VisibleButtons:=[nbFirst, nbPrior, nbNext, nbLast];
              end;
            end;
          end;
        end;
      except
      end;
      Caption:= Caption + ' (Modo Solo Lectura).';
    end
  //****************** Verificacion si la ODT Hija corresponde a un mantenimiento programado *****************
    else
    begin
      qconsultaodt:= Tquery.Create(application);
      qconsultaodt.DatabaseName:='BaseDato';
      qconsultaodt.Tag:=99;
      qconsultaodt.SQL.Append('select count(codigomantenimiento) as numero from pm_mantenimientoodt where consecutivo =:consecutivo and codigoodt =:codigoodt');
      qconsultaodt.ParamByName('CONSECUTIVO').asinteger:= qODTHijaCONSECUTIVO.asinteger;
      qconsultaodt.ParamByName('CODIGOODT').asfloat:= qODTPadreCODIGOODT.Asfloat;
      qconsultaodt.Open;
    end;
  end;
  if (qODTHija.State in [dsInsert]) then
    Caption:=Caption + ' (Insertando).';
  if (qODTPadreCODIGOESTADOODT.AsString = '6') or (qODTPadreCODIGOESTADOODT.AsString = '7') then //ODT Terminada o Cancelada
  begin
    bbAceptar.Enabled:=False;
    bbCancelar.Enabled:=false;
    bCerrar.Visible:=true;
    sbCancelarODTHija.Enabled:= False;
   for i:=0 to ComponentCount - 1 do
   begin
     try
       if (Components[i] is TQuery) then
       begin
         (TQuery(Components[i])).CachedUpdates:=false;
         (TQuery(Components[i])).UpdateObject:=nil;
       end;
     except
     end;
      if (Components[i] is TDBNavigator) then
      begin
       (TDBNavigator(Components[i])).VisibleButtons:=[nbFirst, nbPrior, nbNext, nbLast];
      end;
   end;
   Caption:=Caption +  ' **Terminada**';
   sbCierreStock.Enabled:=false;
   //Actualiza el inventario.
  end;
  VisualizarMaterialAlmacen(not(ProcManager.CanProcExecute('_Ocultar Odt Almacen'))or( varcodigousuario=0));
  qODTPadreCODIGOODTTIPOMANOOBRAValidate(qODTPadreCODIGOODTTIPOMANOOBRA);
  codtipotrabajoanterior:=qODTHijaCODIGOTIPOTRABAJOODT.AsString;
  qODTHijaCODIGOTIPOTRABAJOODTValidate(qODTHijaCODIGOTIPOTRABAJOODT);
  //Validación Auditoría Stock a cuadrillas
  if ValidarTipoAuditoriaStock(mensaje) then
  begin
    sbCierreStock.Visible:=true;
    VisualizarModificacionStock(true);
  end
  else
  begin
    sbCierreStock.Visible:=false;
  end;

  // Los querys cuyos datos pueden cambiar desde afuera
  qGestionInfraestructura.close;
  qGestionInfraestructura.open;
  TipoVisualizacion:=mvNinguno;
  qODTApoyo.close;
  qODTApoyo.open;
  qOdtTrafodis.close;
  qOdtTrafodis.open;
  qOdtPlancha.close;
  qOdtPlancha.open;
  qOdtClienteSgd.close;
  qOdtClienteSgd.Open;
  qPresMate.close;
  qPresMate.open;
  if ((EditarODT = true) or (qODTHija.State in [dsInsert])) then
    sbImprimirReintegro.Enabled := qReintegros.RecordCount <> 0;
  if VistaInicio then
  begin
    Arbol.Items.GetFirstNode.Selected:=true;
    pcInfraestructura.ActivePage:=tsInfraestructuraElementos;
    pcAsignacionMovil.ActivePage:=tsMovilExportacion;
    pcMaterial.ActivePage:=tsMaterialPrincipal;
  end;
  VistaInicio:=false;
  ActivarValidacionGrupotrabajo:= true;
  if (qODTHijaCODIGOESTADOODTDIA.asstring = '6') and (VERIFICARODTPERMISOSEDITAR('REVISIONCOORDINADOR') = TRUE) then DBRevisionCoordinador.visible:= true else DBRevisionCoordinador.visible:= false;
  InicioODTHija:= true;

  if (qODTHijaREVISIONCOORDINADOR.AsString = 'S') and (qODTHijaCODIGOESTADOODTDIA.asstring = '6')then
  Begin
     GroupBox3.Enabled:= false;
     DBNavigatorManoObra.Enabled:= false;
     DBGridManoObra.ReadOnly:= true;
     dbgridmanoobra.columns[0].buttonStyle:= cbsNone;
  end;

  if (qODTHijaCODIGOESTADOODTDIA.AsString = '6') or (qODTHijaCODIGOESTADOODTDIA.AsString = '7') then
    sbCancelarODTHija.Enabled:= False;
end;

procedure TFOdtUrbanaRural.qODTActividadAfterDelete(DataSet: TDataSet);
begin
  qODTActividad.ApplyUpdates;
  qODTActividad.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qODTHijaCODIGOGRUPOTRABAJOChange(
  Sender: TField);
var qDatos : TQuery;
    qVerificar : TQuery;
begin
  if (Sender.AsString <> '') then
  begin
    qVerificar := TQuery.Create(Application);
    qVerificar.DataBaseName := 'BaseDato';
    qVerificar.SQL.Add('SELECT CODIGOGRUPOTRABAJO FROM ODTDIA');
    qVerificar.SQL.Add('WHERE CODIGOODT = ' + qODTHijaCODIGOODT.AsString);
    qVerificar.SQL.Add('AND CONSECUTIVO = ' + IntToStr(qODTHijaCONSECUTIVO.AsInteger - 1));
    qVerificar.Open;
    if (qVerificar.FieldByName('CODIGOGRUPOTRABAJO').AsString <> '')
       and (qVerificar.FieldByName('CODIGOGRUPOTRABAJO').AsString <> Sender.Text) then
    begin
      if MessageDlg('La orden de trabajo anterior tiene asignado otro móvil diferente ' + Chr(13) +
                 'al que se quiere asignar. Desea asignarlo?',mtConfirmation,[mbYes, mbNo],0) = mrNo then
      begin
        qVerificar.Free;
        qODTHijaCODIGOGRUPOTRABAJO.AsString := '';
        Exit;
      end;
    end;

    if (qPresMano.RecordCount=0) then
    begin
      if (qODTPadreCODIGOADMINISTRATIVO.AsString<>'') and ( Sender.AsString<>'') then
      begin
        qVerificar.SQL.clear;
        qVerificar.sql.Add('SELECT CODIGOEMPLEADO FROM EMPLEADO WHERE CODIGOADMINISTRATIVO='+qODTPadreCODIGOADMINISTRATIVO.AsString);
        qVerificar.sql.Add('AND CODIGOGRUPOTRABAJO='+Sender.AsString+'AND CODIGOEMPLEADO NOT IN ');
        qVerificar.sql.Add('(SELECT CODIGOEMPLEADO FROM ODTPRESMANO WHERE CODIGOODT='+qODTHijaCODIGOODT.AsString+' AND CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString+')');
        qVerificar.open;
        while not(qVerificar.eof) do
        begin
          qPresMano.Insert;
          qPresMano.FieldbyName('CodigoEmpleado').AsString := qVerificar.fieldbyName('CodigoEmpleado').asstring;
          qPresMano.Post;
          qVerificar.next;
        end;
      end;
    end;
    if (qODTPadreCODIGOADMINISTRATIVO.AsString<>'') and ( Sender.AsString<>'') then
    begin
      qVerificar.SQL.clear;
      qVerificar.sql.Add('SELECT CODIGOVEHICULO FROM GRUPOTRABAJO WHERE CODIGOADMINISTRATIVO='+qODTPadreCODIGOADMINISTRATIVO.AsString);
      qVerificar.sql.Add('AND CODIGOGRUPOTRABAJO='+Sender.AsString+'AND CODIGOVEHICULO NOT IN ');
      qVerificar.sql.Add('(SELECT CODIGOVEHICULO FROM ODTVEHICULO WHERE CODIGOODT='+qODTHijaCODIGOODT.AsString+' AND CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString+')');
      qVerificar.open;
      while not(qVerificar.eof) do
      begin
        if qVerificar.fieldbyName('CODIGOVEHICULO').asstring<>'' then
        begin
          qODTVehiculo.Insert;
          qODTVehiculo.FieldbyName('CODIGOVEHICULO').AsString := qVerificar.fieldbyName('CODIGOVEHICULO').asstring;
          qODTVehiculo.Post;
        end;
        qVerificar.next;
      end;
    end;
    qVerificar.Free;

    qDatos:=TQuery.Create(Application);
    qDatos.DatabaseName:='BaseDato';
    try
      qDatos.SQL.Add('UPDATE REPORTE SET CODIGOGRUPOTRABAJO = ' + Sender.Text);
      qDatos.SQL.Add('WHERE CODIGOREPORTE = :CODIGOREPORTE');
      qReporte.First;
      while not qReporte.Eof do
      begin
       qDatos.Close;
       qDatos.Params[0].AsString:=qReporte.FieldByName('CODIGOREPORTE').AsString;
       qDatos.ExecSQL;
       qReporte.Next;
      end;
    finally
      qDatos.Free;
      qReporte.Close;
      qReporte.Open;
    end;
  end;
end;

procedure TFOdtUrbanaRural.qMedidaSeguridadAfterPost(DataSet: TDataSet);
begin
  qMedidaSeguridad.ApplyUpdates;
  qMedidaSeguridad.CommitUpdates;
end;

procedure TFOdtUrbanaRural.BitBtn1Click(Sender: TObject);
begin
  fCuentaCobro:=TfCuentaCobro.Create(Application);
  try
    //Inicialize la forma
    fCuentaCobro.qODTCobro.DataSource:=dsODTHija;
    fCuentaCobro.qODTCobro.Close;
    fCuentaCobro.qODTCobro.Open;
    fCuentaCobro.CodigoOdt:=qODTHijaCODIGOODT.AsString;
    fCuentaCobro.Consecutivo:=qODTHijaCONSECUTIVO.AsString;
    fCuentaCobro.CodigoAdministrativo:=qODTPadreCODIGOADMINISTRATIVO.AsString;
    fCuentaCobro.qDetalleActividad.Open;
    fCuentaCobro.GrabarDireccion(qODTHija);

    //Filtre la lista de actividades
    fCuentaCobro.qODTActividadCobro.ParamByName('CodigoAdministrativo').AsInteger := qODTPadreCODIGOADMINISTRATIVO.AsInteger;
    fCuentaCobro.qReporte.DataSource:=dsODTHija;
    //Inserte una cuenta de cobro
    //fCuentaCobro.qODTCobro.Insert;
    fCuentaCobro.ShowModal;
  finally
    fCuentaCobro.Free;
  end;
end;

procedure TFOdtUrbanaRural.qODTApoyoAfterPost(DataSet: TDataSet);
begin
  qODTApoyo.ApplyUpdates;
  qODTApoyo.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qODTApoyoAfterDelete(DataSet: TDataSet);
begin
  qODTApoyo.ApplyUpdates;
  qODTApoyo.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qODTApoyoAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('CODIGOODT').AsFloat  := qODTHijaCODIGOODT.AsFloat;
    FieldByName('CONSECUTIVO').AsFloat:= qODTHijaCONSECUTIVO.AsFloat;
  end;
end;

procedure TFOdtUrbanaRural.qODTApoyoPINTADOAPOYOValidate(Sender: TField);
var qDatos:TQuery;
begin
  if Sender.Text <> '' then
  begin
    qDatos:=TQuery.Create(Application);
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Text:='SELECT CODIGOAPOYO FROM APOYO WHERE PINTADOAPOYO='''+Sender.Text+'''';
    qDatos.Open;
    if qDatos.Fields[0].AsString = '' then
    begin
      qDatos.Close;
      qDatos.Free;
      raise Exception.Create('Este pintado apoyo no existe. Por favor verifíquelo.');
    end;
    qDatos.Close;
    qDatos.Free;
  end;
end;

procedure TFOdtUrbanaRural.qODTApoyoUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
case UpdateKind of
    ukInsert:
    begin
      qPresMate.Cancel;
      if MessageDlg('Datos Incompletos o Erróneos al Insertar un Apoyo.'+Chr(13)+
               'Desea Eliminar Registro Erróneo?.'
      ,mtWarning,[mbYes, mbNo],0) = mrYes then
      begin
      UpdateAction:=uaAbort;
      end;
    end;
    ukModify:
    begin
      MessageDlg('Error al editar un apoyo, posiblemente duplicado o datos erróneos.',
      mtWarning,[mbOk],0);
      UpdateAction:=uaAbort;
    end;
  end;
end;

procedure TFOdtUrbanaRural.sbBuscarCIGClick(Sender: TObject);
var CIG:INTEGER;
begin
  CIG := CapturarCIG;
  if CIG<>0 then dsODTHija.DataSet.FieldByName('CODIGOGEOGRAFICO').AsInteger:=CIG;
end;

procedure TFOdtUrbanaRural.DBEdit5Change(Sender: TObject);
begin
  qGeografico.Close;
  qGeografico.Open;
end;

procedure TFOdtUrbanaRural.DBEdit5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if  Key = VK_F3 then
    sbBuscarCIGClick(nil);
end;


procedure TFOdtUrbanaRural.TrasladarReporte1Click(Sender: TObject);
var Query, qDatos, qVerificar, qUsuario: TQuery;
    ValidarCodigo, I: Integer;
    Campo: string;
begin
  if qReporteCODIGOREPORTE.AsString <> '' then
  begin
    fCIATraslado := TfCIATraslado.Create(Application);
    try
      if fCIATraslado.ShowModal = mrOk then
      begin
        qDatos := TQuery.Create(Application);
        qDatos.DatabaseName := 'BaseDato';
        qDatos.SQL.Text := 'SELECT * FROM REPORTE WHERE CODIGOREPORTE = ' + qReporteCODIGOREPORTE.AsString;
        qDatos.Open;
        Query := TQuery.Create(Application);
        Query.DatabaseName := 'BaseDato';
        Query.RequestLive := True;
        Query.SQL.Text := 'SELECT * FROM REPORTE WHERE CODIGOREPORTE = -1';
        Query.Open;
        Query.Insert;
        for I := 0 to qDatos.FieldCount - 1 do
        begin
          Campo := qDatos.Fields[I].FieldName;
          Query.FieldByName(Campo).AsString := qDatos.Fields[I].AsString;
        end;
        qDatos.Free;
        Query.FieldByName('REPORTEPADRE').AsFloat:=Query.FieldByName('CODIGOREPORTE').AsFloat;
        Query.FieldByName('FECHAHORA').AsString:=FechaServidor;
        Query.FieldByName('CODIGOGRUPOTRABAJO').AsString:='';
        Query.FieldByName('FECHAHORADICTADO').AsString:='';
        Query.FieldByName('FECHAHORALLEGADA').AsString:='';
        Query.FieldByName('FECHAHORAATENCION').Asstring:='';
        Query.FieldByName('CODIGOESTADOREPORTE').AsString:='1';
        Query.FieldByName('CODIGOADMINISTRATIVO').AsString := fCIATraslado.edCIA.Text;
        Query.FieldByName('OBSERVACION').AsString := Query.FieldByName('OBSERVACION').AsString + Chr(13) + Chr(10) +
                                                     'DATOS ODT ' + qODTHijaIMPRESOODT.AsString + Chr(13) + Chr(10) +
                                                     qODTHijaOBSERVACION1.AsString + Chr(13) + Chr(10) + qODTHijaOBSERVACION2.AsString;

        ConsDll.RefrescarVariables;
        qUsuario := TQuery.Create(Application);
        qUsuario.DatabaseName := 'BaseDato';
        qUsuario.SQL.Text := 'SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO = ' + IntToStr(VarCodigoUsuario);
        qUsuario.Open;
        Query.FieldByName('NOMBREINFORMANTE').AsString := qUsuario.FieldByName('NOMBREUSUARIO').AsString;
        qUsuario.Free;
        while True do
        begin
         qCodigoReporte.Close;
         qCodigoReporte.Open;
         Query.FieldByName('CODIGOREPORTE').AsFloat:=qCodigoReporte.Fields[0].AsFloat + 1;
         qVerificar:=TQuery.Create(Application);
         qVerificar.DatabaseName:='BaseDato';
         qVerificar.SQL.Add('SELECT COUNT(*) FROM REPORTE WHERE CODIGOREPORTE = ' + Query.FieldByName('CODIGOREPORTE').AsString);
         qVerificar.Open;
         ValidarCodigo := qVerificar.Fields[0].AsInteger;
         qVerificar.Free;
         if ValidarCodigo = 0 then
          Break;
        end;
        Query.Post;
      end;
    finally
      fCIATraslado.Free;
    end;
  end;
end;

procedure TFOdtUrbanaRural.qReporteCODIGOREPORTEValidate(Sender: TField);
var Query: TQuery;
    Impreso: string;
begin
  if Sender.Text <> '' then
  begin
    Query := TQuery.Create(Application);
    Query.DataBaseName := 'BaseDato';
    Query.SQL.Add('SELECT CODIGOODT, CONSECUTIVO FROM ODTREPORTE WHERE CODIGOREPORTE = ' + Sender.Text);
    Query.Open;
    if Query.FieldByName('CODIGOODT').AsString <> '' then
    begin
      Impreso := Query.FieldByName('CODIGOODT').AsString + '-' + Query.FieldByName('CONSECUTIVO').AsString;
      Query.Close;
      Query.Free;
      raise Exception.Create('No es posible asignar este reporte a la ODT ya que fué asignado' + Chr(13) +
                             'a la ODT: ' + Impreso);
    end;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT COUNT(*) AS TOTAL FROM REPORTE WHERE CODIGOREPORTE = ' + Sender.Text);
    Query.Open;
    if Query.FieldByName('TOTAL').AsInteger = 0 then
    begin
      Query.Close;
      Query.Free;
      raise Exception.Create('Este código de reporte ' + Sender.Text + ' no existe por favor revise sus datos');
    end;
    Query.Close;
    Query.Free;
  end;
end;

function TFOdtUrbanaRural.FechaServidor: string;
var qFecha: TQuery;
begin
  Result := '';
  qFecha := TQuery.Create(Application);
  qFecha.DatabaseName := 'BaseDato';
  qFecha.SQL.Text := 'SELECT SYSDATE FROM DUAL';
  qFecha.Open;
  Result := qFecha.Fields[0].AsString;
  qFecha.Free;
end;

procedure TFOdtUrbanaRural.qPresManoBeforeDelete(DataSet: TDataSet);
begin
    if (qODTSobreTiempo.RecordCount>0) then
    begin
      raise Exception.Create('No puede eliminar este empleado puesto que tiene horas extras asociadas ');
    end;
    if (qViatico.RecordCount>0) then
    begin
      raise Exception.Create('No puede eliminar este empleado puesto que tiene viáticos asociados ');
    end;
    if (qAuxilio.RecordCount>0) then
    begin
      raise Exception.Create('No puede eliminar este empleado puesto que tiene auxilios asociados ');
    end;
end;

procedure TFOdtUrbanaRural.qODTPadreCODIGOODTTIPOMANOOBRAValidate(
  Sender: TField);
var porcentajes:PorcentajeHorasConcepto;
begin
 qGrupoTrabajo.Close;
 qGrupoTrabajo.Open;
  if qODTPadreCODIGOODTTIPOMANOOBRA.AsInteger=2 then
  begin
    Contratista := True;
  end;
  panelExtrarecargo.Visible:=true;
  porcentajes:=ConsultarConceptosExtrasRecargos;
  lbRDO.Caption:=floattostr(porcentajes.DiurnaOrdinaria);
  lbRNO.Caption:=floattostr(porcentajes.NocturnaOrdinaria);
  lbRDD.Caption:=floattostr(porcentajes.DiurnaDomingo);
  lbRND.Caption:=floattostr(porcentajes.NocturnaDomingo);
  lbRDF.Caption:=floattostr(porcentajes.DiurnaFestivo);
  lbRNF.Caption:=floattostr(porcentajes.NocturnaFestivo);
  lbEDO.Caption:=floattostr(porcentajes.ExtraDiurnaOrdinaria);
  lbENO.Caption:=floattostr(porcentajes.ExtraNocturnaOrdinaria);
  lbEDD.Caption:=floattostr(porcentajes.ExtraDiurnaDomFestivo);
  lbEND.Caption:=floattostr(porcentajes.ExtraNocturnaDomFestivo);
  lbEDF.Caption:=floattostr(porcentajes.ExtraDiurnaDomFestivo);
  lbENF.Caption:=floattostr(porcentajes.ExtraNocturnaDomFestivo);
end;

procedure TFOdtUrbanaRural.qPresManoCODIGOEMPLEADOValidate(Sender: TField);
begin
  if (qODTSobreTiempo.RecordCount>0) then
  begin
    raise Exception.Create('No puede eliminar este empleado puesto que tiene horas extras asociadas ');
  end;
  if (qViatico.RecordCount>0) then
  begin
    raise Exception.Create('No puede eliminar este empleado puesto que tiene viáticos asociados ');
  end;
  if (qAuxilio.RecordCount>0) then
  begin
    raise Exception.Create('No puede eliminar este empleado puesto que tiene auxilios asociados ');
  end;
end;

{procedure TFOdtUrbanaRural.btnRequisicionClick(Sender: TObject);
begin
  with qPresMate do
  begin
    Close;
    Filtered := True;
    Filter := 'CANTIDADSOLICITADA > 0';
    Open;
  end;
  if qPresMate.RecordCount > 0 then
  begin
    fRequisicionMateriales := TfRequisicionMateriales.Create(Application);
    with fRequisicionMateriales do
    begin
      fRequisicionMateriales.qPresMate.DataSource := dsODTHija;
      fRequisicionMateriales.qPresMate.Open;
      ShowModal;
      Free;
    end;
  end;
end;}

procedure TFOdtUrbanaRural.sbAgregarRequisicionClick(Sender: TObject);
var
  qConsulta, qConsulta2: TQuery;
  devolucion: string;
begin
  if Application.MessageBox('Para agregar una nueva requisición se almacenará la información actual de la ODT Hija. Desea realizar la operación?',
                             PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
  begin
    insertandorequisicion:= True;
    if qPresMate.RecordCount > 0 then
    begin
      if qODTHijaCODIGOGRUPOTRABAJO.AsString = '' then
        raise Exception.Create('Se necesita el Grupo de Trabajo, por favor agréguelo para continuar.');

      fRequisicionMateriales := TfRequisicionMateriales.Create(Application);
      fRequisicionMateriales.btnAceptar.Visible:= FALSE;
      //try
      fRequisicionMateriales.qRequisicionMateriales.Open;
      fRequisicionMateriales.qRequisicionMateriales.Insert;
      fRequisicionMateriales.qRequisicionMaterialesCODIGOODT.AsFloat := qODTHijaCODIGOODT.AsFloat;
      fRequisicionMateriales.qRequisicionMaterialesCONSECUTIVO.AsInteger := qODTHijaCONSECUTIVO.AsInteger;
      fRequisicionMateriales.CodigoZona := qODTPadreCODIGOZONAORIGEN.AsInteger;
      fRequisicionMateriales.CodigoEjecutor := qODTPadreCODIGOEJECUTOR.AsFloat;
      {Llenar los datos básicos de la requisición.}
      fRequisicionMateriales.qCOM_M_REQUISICION.Open;
      fRequisicionMateriales.qCOM_M_REQUISICION.Insert;
      fRequisicionMateriales.qZona.ParamByName('CODIGOZONA').AsInteger := fRequisicionMateriales.CodigoZona;
      fRequisicionMateriales.qZona.Open;

      fRequisicionMateriales.qCOM_M_REQUISICIONGRCIAS_GRCIAS.AsInteger := 1;
      qConsulta2 := TQuery.Create(nil);
      qConsulta2.DatabaseName := 'BaseDato';
      qConsulta2.SQL.Add('SELECT TO_NUMBER((TO_CHAR(SYSDATE,''yyyy'')),''9999.99'') FROM dual');
      qConsulta2.Open;
      fRequisicionMateriales.qCOM_M_REQUISICIONVIGENCIA.AsInteger:= qConsulta2.Fields[0].AsINTEGER;
      qConsulta2.Close;
      qConsulta2.Free;

      //fRequisicionMateriales.qCOM_M_REQUISICIONFECHA.AsDateTime := qODTPadreFECHAASIGNACION.AsDateTime;
      fRequisicionMateriales.qCOM_M_REQUISICIONFECHA.AsDateTime := now;

      fRequisicionMateriales.qCOM_M_REQUISICIONCOD_ODM.AsFloat := strtofloat(copy(qODTPadreCODIGOODT.Asstring,7,length(qODTPadreCODIGOODT.Asstring)));
      {En las siguientes líneas se empieza a llenar el listado de materiales de la
      requisición.}
      fRequisicionMateriales.Creacion := True;
      fRequisicionMateriales.qGE_TCIAS.Close;
      fRequisicionMateriales.qGE_TCIAS.ParamByName('CIAS_CIAS').AsFloat := fRequisicionMateriales.qZonaCODIGOZONAESSA.AsFloat;
      fRequisicionMateriales.qGE_TCIAS.Open;
      fRequisicionMateriales.qGE_TCIASEJE.Close;
      fRequisicionMateriales.qGE_TCIASEJE.ParamByName('CIAS_CIAS_EJE').AsFloat := fRequisicionMateriales.qZonaCODIGOZONAESSA.ASFLOAT;
      fRequisicionMateriales.qGE_TCIASEJE.Open;

      fRequisicionMateriales.dbmMotivo.Text:= qODTPadreMOTIVOS.AsString;

      //*********************************************************************************
      qConsulta := TQuery.Create(nil);
      qConsulta.DatabaseName := 'BaseDato';
      qConsulta.SQL.Clear;
      qConsulta.SQL.Add('SELECT G.AREA_AREA, I.NEGO_NEGO, G.AREA_CECOS FROM ADMINISTRATIVO A, '+EsquemaContable+'GE_TAREA'+DBLink+' G, '+EsquemaAlmacen+'INV_S_NEGO_X_AREA'+DBLink+' I, '+EsquemaContable+'GE_TCECOS'+DBLink+' C');
      qConsulta.SQL.Add('WHERE A.CODIGOADMINISTRATIVO =' + qODTPadreCODIGOADMINISTRATIVO.AsString);
      qConsulta.SQL.Add('AND A.CODIGOAREARESPONSABILIDAD = G.AREA_AREA');
      qConsulta.SQL.Add('AND G.AREA_AREA = I.AREA_AREA AND G.AREA_CECOS = C.CECO_CECO');
      qConsulta.Open;
      fRequisicionMateriales.qCOM_M_REQUISICION_MOVI.Open;
      fRequisicionMateriales.qCOM_M_REQUISICIONNEGO_NEGO.AsFloat:= qConsulta.Fields[1].AsFloat;
      fRequisicionMateriales.qAreaSolicitante.CLOSE;
      fRequisicionMateriales.qAreaSolicitante.ParamByName('NEGO_NEGO').AsFloat:= qConsulta.Fields[1].AsFloat;
      fRequisicionMateriales.qAreaSolicitante.ParamByName('AREA_CIAS').AsFloat:= qODTPadreCodigoZonaEssa.ASFLOAT;
      fRequisicionMateriales.qAreaSolicitante.Open;
      fRequisicionMateriales.QueryAlmacen:= fRequisicionMateriales.qAlmacen.SQL.Text;
      fRequisicionMateriales.dblcAreaSolicitanteClick(NIL);
      fRequisicionMateriales.qCOM_M_REQUISICIONAREA_AREA.AsFloat:= qConsulta.Fields[0].AsFloat;
      fRequisicionMateriales.qCOM_M_REQUISICIONCECO_CECO_EJE.AsFloat:=qConsulta.Fields[2].AsFloat;
      fRequisicionMateriales.qCOM_M_REQUISICIONNEGO_NEGO_EJE.AsFloat:= qConsulta.Fields[1].AsFloat;
      fRequisicionMateriales.QAreaEjecutora.CLOSE;
      fRequisicionMateriales.QAreaEjecutora.ParamByName('NEGO_NEGO').AsFloat:= qConsulta.Fields[1].AsFloat;
      //fRequisicionMateriales.QAreaEjecutora.ParamByName('AREA_CIAS').AsFloat:= qODTPadreCodigoZonaEssa.ASFLOAT;
      fRequisicionMateriales.qAreaEjecutora.Open;
      fRequisicionMateriales.dbeAreaSolicitante.TEXT:= qConsulta.Fields[0].AsString;
      fRequisicionMateriales.qCOM_M_REQUISICIONAREA_AREA_EJE.AsFloat:= qConsulta.Fields[0].AsFloat;
      qConsulta.Close;
      qConsulta.Free;
      //*******************************************************************************

      fRequisicionMateriales.qCOM_M_REQUISICION_MOVI.Open;
      fRequisicionMateriales.qCOM_M_RESERVA_INVENTARIO.CLOSE;
      fRequisicionMateriales.qCOM_M_RESERVA_INVENTARIO.Open;
      fRequisicionMateriales.qCOM_M_RESERVA_INVENTARIO.Insert;
      fRequisicionMateriales.dbgCantidadDisponible.Columns[6].ReadOnly:= TRUE;
      if fRequisicionMateriales.ShowModal = mrOK then
      begin
        fRequisicionMateriales.Free;
        qRequisiciones.Close;
        qRequisiciones.Open;
        sbEditarRequisicion.Enabled := qRequisiciones.RecordCount <> 0;
        sbImprimirRequisicion.Enabled := qRequisiciones.RecordCount <> 0;
        ActualizarCantidadReservada;
        InsertandoRequisicion:= True;
        bbAceptar.Click();
      end
      else
        fRequisicionMateriales.Free;
    end;
  end;
end;

procedure TFOdtUrbanaRural.sbEditarRequisicionClick(Sender: TObject);
VAR
  qConsulta : TQuery;
  devolucion, proceso: string;
begin
  fRequisicionMateriales := TfRequisicionMateriales.Create(Application);
  try
    qConsulta := TQuery.Create(nil);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.SQL.Add('select proceso from '+EsquemaAlmacen+'com_m_requisicion'+DBLink+' where cod_requisicion = ' + qRequisicionesCODIGOREQUISICION.AsString + ' and vigencia = '+ qRequisicionesVIGENCIA.asstring + ' and cias_cias = '+qRequisicionesEMPRESA.asstring);
    qConsulta.Open;
    Proceso:= qConsulta.FieldByName('proceso').AsString;
    qConsulta.Close;
    qConsulta.Free;

    if (qRequisicionesESTADO.asstring = 'ANULADO') or (Proceso = 'FINALIZADA') then
       fRequisicionMateriales.btnAceptar.Enabled:= false;
    fRequisicionMateriales.qRequisicionMateriales.ParamByName('CODIGOODT').AsFloat := qRequisicionesCODIGOODT.AsFloat;
    fRequisicionMateriales.qRequisicionMateriales.ParamByName('CONSECUTIVO').AsFloat := qRequisicionesCONSECUTIVO.AsFloat;
    fRequisicionMateriales.qRequisicionMateriales.ParamByName('CODIGOREQUISICION').AsFloat := qRequisicionesCODIGOREQUISICION.AsFloat;
    fRequisicionMateriales.pnlRequisicion.Caption := 'Requisición No. ' +  qRequisicionesCODIGOREQUISICION.AsString;
    fRequisicionMateriales.qRequisicionMateriales.Open;
    fRequisicionMateriales.qRequisicionMateriales.Edit;

    fRequisicionMateriales.CodigoZona := qODTPadreCODIGOZONAORIGEN.AsInteger;
    fRequisicionMateriales.CodigoEjecutor := qODTPadreCODIGOEJECUTOR.AsFloat;

    fRequisicionMateriales.Creacion := False;
    fRequisicionMateriales.qCOM_M_REQUISICION.ParamByName('CIAS_CIAS').AsFloat := qRequisicionesEMPRESA.AsFloat;
    fRequisicionMateriales.qCOM_M_REQUISICION.ParamByName('VIGENCIA').AsFloat := qRequisicionesVIGENCIA.AsFloat;
    fRequisicionMateriales.qCOM_M_REQUISICION.ParamByName('COD_REQUISICION').AsFloat := qRequisicionesCODIGOREQUISICION.AsFloat;
    fRequisicionMateriales.qCOM_M_REQUISICION.Open;

    {if  (qODTPadreCODIGOMODOODT.Asinteger = 2) then
    Begin
      fRequisicionMateriales.DBLCBAuxContable.visible:= true;
      fRequisicionMateriales.dbeAuxContable.visible:= true;
      fRequisicionMateriales.lAuxContable.visible:= true;
    End;}

    fRequisicionMateriales.cmbResponsable.ItemIndex := fRequisicionMateriales.cmbResponsable.Items.IndexOf(fRequisicionMateriales.qCOM_M_REQUISICIONCLASE_RESPONSABLE.AsString);
    fRequisicionMateriales.qCOM_M_REQUISICION.Edit;
    fRequisicionMateriales.QueryAlmacen:= fRequisicionMateriales.qAlmacen.SQL.Text;

    qConsulta := TQuery.Create(nil);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.SQL.Add('SELECT AUXI_NIT,AUXI_DESCRI FROM '+EsquemaContable+'GE_TAUXIL'+DBLink);
    qConsulta.SQL.Add('WHERE AUXI_AUXI = :CODIGOEMPLEADO');
    qConsulta.ParamByName('CODIGOEMPLEADO').AsFloat := fRequisicionMateriales.qCOM_M_REQUISICIONSOLICITA_AUXI.ASFLOAT;
    qConsulta.Open;
    fRequisicionMateriales.qCOM_M_REQUISICIONSOLICITA_AUXI.AsFloat := qConsulta.Fields[0].AsFloat;
    //fRequisicionMateriales.eEmpleado.TEXT := qConsulta.Fields[1].AssTRING;
    qConsulta.Close;
    qConsulta.Free;

    {Averiguar LA CEDULA del solicitante de la requisicion.}
   { if qODTPadreCODIGOODTTIPOMANOOBRA.AsFloat= 1 then
    begin   }
      qConsulta := TQuery.Create(nil);
      qConsulta.DatabaseName := 'BaseDato';
      qConsulta.SQL.Add('SELECT AUXI_NIT FROM '+EsquemaContable+'GE_TAUXIL'+DBLink);
      qConsulta.SQL.Add('WHERE AUXI_AUXI = :CODIGOEMPLEADO');
      qConsulta.ParamByName('CODIGOEMPLEADO').AsFloat := fRequisicionMateriales.qCOM_M_REQUISICIONRESPONSABLE_AUXI.AsFloat;
      qConsulta.Open;
      fRequisicionMateriales.qCOM_M_REQUISICIONRESPONSABLE_AUXI.AsFloat := qConsulta.Fields[0].AsFloat;
      qConsulta.Close;
      qConsulta.Free;
   // end;

    fRequisicionMateriales.qZona.ParamByName('CODIGOZONA').AsInteger := fRequisicionMateriales.CodigoZona;
    fRequisicionMateriales.qZona.Open;

    fRequisicionMateriales.qGE_TCIAS.CLOSE;
    fRequisicionMateriales.qGE_TCIAS.ParamByName('CIAS_CIAS').AsFloat:=qRequisicionesEMPRESA.AsFloat;
    fRequisicionMateriales.qGE_TCIAS.OPEN;

    fRequisicionMateriales.qGE_TCIASEJE.CLOSE;
    fRequisicionMateriales.qGE_TCIASEJE.ParamByName('CIAS_CIAS_EJE').AsFloat:=qRequisicionesEMPRESA.AsFloat;
    fRequisicionMateriales.qGE_TCIASEJE.OPEN;

    {En las siguientes líneas se empieza a llenar el listado de materiales de la
    requisición.}
    fRequisicionMateriales.qCOM_M_REQUISICION_MOVI.ParamByName('CIAS_CIAS').AsFloat := qRequisicionesEMPRESA.AsFloat;
    fRequisicionMateriales.qCOM_M_REQUISICION_MOVI.ParamByName('VIGENCIA').AsFloat := qRequisicionesVIGENCIA.AsFloat;
    fRequisicionMateriales.qCOM_M_REQUISICION_MOVI.ParamByName('CODIGOODT').AsFloat := qODTHijaCODIGOODT.AsFloat;
    fRequisicionMateriales.qCOM_M_REQUISICION_MOVI.ParamByName('CONSECUTIVO').AsFloat := qODTHijaCONSECUTIVO.AsFloat;
    fRequisicionMateriales.qCOM_M_REQUISICION_MOVI.ParamByName('COD_REQUISICION').AsFloat := qRequisicionesCODIGOREQUISICION.AsFloat;
    fRequisicionMateriales.qCOM_M_REQUISICION_MOVI.Open;
    fRequisicionMateriales.qCOM_M_REQUISICION_MOVI.Edit;

    fRequisicionMateriales.qCOM_M_RESERVA_INVENTARIO.ParamByName('CIAS_CIAS').AsFloat := qRequisicionesEMPRESA.AsFloat;
    fRequisicionMateriales.qCOM_M_RESERVA_INVENTARIO.ParamByName('VIGENCIA').AsFloat := qRequisicionesVIGENCIA.AsFloat;
    fRequisicionMateriales.qCOM_M_RESERVA_INVENTARIO.ParamByName('COD_REQUISICION').AsFloat := qRequisicionesCODIGOREQUISICION.AsFloat;

    fRequisicionMateriales.qCOM_M_RESERVA_INVENTARIO.close;
    fRequisicionMateriales.qCOM_M_RESERVA_INVENTARIO.Open;
    fRequisicionMateriales.qCOM_M_RESERVA_INVENTARIO.Edit;

    fRequisicionMateriales.qAlmacenReserva.ParamByName('CIAS_CIAS').AsFloat := qRequisicionesEMPRESA.AsFloat;
    fRequisicionMateriales.qAlmacenReserva.ParamByName('VIGENCIA').AsFloat := qRequisicionesVIGENCIA.AsFloat;
    fRequisicionMateriales.qAlmacenReserva.ParamByName('COD_REQUISICION').AsFloat := qRequisicionesCODIGOREQUISICION.AsFloat;
    fRequisicionMateriales.qAlmacenReserva.Open;

    fRequisicionMateriales.qAreaSolicitante.ParamByName('NEGO_NEGO').AsFloat:= fRequisicionMateriales.qCOM_M_REQUISICIONNEGO_NEGO.AsFloat;
    //fRequisicionMateriales.qAreaSolicitante.ParamByName('AREA_CIAS').AsFloat:= fRequisicionMateriales.qCOM_M_REQUISICIONCIAS_CIAS.AsFloat;
    fRequisicionMateriales.qAreaSolicitante.Open;

    fRequisicionMateriales.QAreaEjecutora.ParamByName('NEGO_NEGO').AsFloat:= fRequisicionMateriales.qCOM_M_REQUISICIONNEGO_NEGO_EJE.AsFloat;
    //fRequisicionMateriales.QAreaEjecutora.ParamByName('AREA_CIAS').AsFloat:= fRequisicionMateriales.qCOM_M_REQUISICIONCIAS_CIAS_EJE.AsFloat;
    fRequisicionMateriales.qAreaEjecutora.Open;

    fRequisicionMateriales.QueryAlmacen:= fRequisicionMateriales.qAlmacen.SQL.Text;
    fRequisicionMateriales.dblcAreaSolicitanteClick(NIL);

    fRequisicionMateriales.dbgCantidadDisponible.Columns[6].ReadOnly:= fALSE;
    if fRequisicionMateriales.ShowModal = mrOK then
    begin
      fRequisicionMateriales.Free;
      qRequisiciones.Close;
      qRequisiciones.Open;
      ActualizarCantidadReservada;
    end
    else
      fRequisicionMateriales.Free;
  except
    on e:Exception do
    begin
      Application.MessageBox(PChar('Error en la transacción, Intentelo de nuevo y si el error persiste consulte con el administrador de Energis:'+chr(13)+chr(13)+e.message), 'Advertencia', MB_OK + MB_ICONWARNING);
      fRequisicionMateriales.Free;
    end;
  end;
end;

procedure TFOdtUrbanaRural.sbImprimirRequisicionClick(Sender: TObject);
var
  qConsulta2: TQuery;
  codigo_requisicion: Integer;
begin
  codigo_requisicion:= qRequisicionesCODIGOREQUISICION.AsInteger;

  if qRequisicionesESTADO.asstring = 'ANULADO' THEN
    raise Exception.Create('Esta requisición no se puede imprimir porque esta Anulada.');

  MinimizarOdtHija;
  fQRRequisicionMateriales := TfQRRequisicionMateriales.Create(Application);
  fQRRequisicionMateriales.qReserva.ParamByName('VIGENCIA').AsFloat := qRequisicionesVIGENCIA.AsFloat;
  fQRRequisicionMateriales.qReserva.ParamByName('COD_REQUISICION').AsFloat := codigo_requisicion;
  fQRRequisicionMateriales.qReserva.ParamByName('CIAS_CIAS').AsFloat := qRequisicionesEMPRESA.AsFloat;
  fQRRequisicionMateriales.qReserva.Open;
  fQRRequisicionMateriales.codigoodt:=qOdtHijaCODIGOODT.asString;
  fQRRequisicionMateriales.consecutivo:=qOdtHijaCONSECUTIVO.asString;
  fQRRequisicionMateriales.qrlCodigoGrupTrabajo.Caption:= qGrupoTrabajoCODIGOGRUPOTRABAJO.AsString;
  fQRRequisicionMateriales.qrlNombreGrupTrabajo.Caption:= qGrupoTrabajoNOMBREGRUPOTRABAJO.AsString;
  fQRRequisicionMateriales.qrlCodigoODt.Caption:=fQRRequisicionMateriales.codigoodt+'-'+fQRRequisicionMateriales.consecutivo;
  fQRRequisicionMateriales.qrlMovimiento.Caption:= fQRRequisicionMateriales.qReservaTIPO_CUENTA.asstring;
  //Modo Alumbrado Público
 { if (qODTPadreCODIGOMODOODT.AsInteger = 2) then
  Begin
    fQRRequisicionMateriales.qrimage2.visible:= true;
    fQRRequisicionMateriales.qrimage1.visible:= false;
  End
  else
  Begin
    fQRRequisicionMateriales.qrimage2.visible:= false;
    fQRRequisicionMateriales.qrimage1.visible:= true;
  end; }

  fQRRequisicionMateriales.qALMACEN.ParamByName('COD_REQUISICION').ASFLOAT:= codigo_requisicion;
  fQRRequisicionMateriales.qALMACEN.ParamByName('CIAS_CIAS').ASFLOAT:= qRequisicionesempresa.asfloat;
  fQRRequisicionMateriales.qALMACEN.ParamByName('VIGENCIA').ASFLOAT:= qRequisicionesVIGENCIA.asfloat;

  fQRRequisicionMateriales.qALMACEN.OPEN;

  fQRRequisicionMateriales.qCOM_M_REQUISICION.ParamByName('CIAS_CIAS').AsFloat := qRequisicionesEMPRESA.AsFloat;
  fQRRequisicionMateriales.qCOM_M_REQUISICION.ParamByName('VIGENCIA').AsFloat := qRequisicionesVIGENCIA.AsFloat;
  fQRRequisicionMateriales.qCOM_M_REQUISICION.ParamByName('COD_REQUISICION').AsFloat := codigo_requisicion;
  fQRRequisicionMateriales.qCOM_M_REQUISICION.Open;
  fQRRequisicionMateriales.qCOM_M_RESERVA_INVENTARIO.ParamByName('CIAS_CIAS').AsFloat := qRequisicionesEMPRESA.AsFloat;
  fQRRequisicionMateriales.qCOM_M_RESERVA_INVENTARIO.ParamByName('VIGENCIA').AsFloat := qRequisicionesVIGENCIA.AsFloat;
  fQRRequisicionMateriales.qCOM_M_RESERVA_INVENTARIO.ParamByName('COD_REQUISICION').AsFloat := codigo_requisicion;
  fQRRequisicionMateriales.qCOM_M_RESERVA_INVENTARIO.Open;
  fQRRequisicionMateriales.qrRequisicion.Caption:= '#  '+  inttostr(codigo_requisicion);
  if qODTPadreNUMEROCONTRATO.ASSTRING = '' then
  begin
    fQRRequisicionMateriales.qrcontrato.Caption:= '';
    fQRRequisicionMateriales.qrNitContratista.caption:= '';
    fQRRequisicionMateriales.QRDBText32.dataset:=nil;
    fQRRequisicionMateriales.QRDBText32.dataset:=nil;
    fQRRequisicionMateriales.QRDBText21.dataset:=nil;
  end
  else
  begin
    fQRRequisicionMateriales.qContratista.ParamByName('codigocontratista').asstring:= qODTPadreCODIGOCONTRATISTA.asstring;
    fQRRequisicionMateriales.qContratista.open;
    {fQRRequisicionMateriales.qrcontrato.Caption:= fQRRequisicionMateriales.qrcontrato.Caption + '  '+qODTPadreNUMEROCONTRATO.ASSTRING;
    fQRRequisicionMateriales.qrNitContratista.caption:= fQRRequisicionMateriales.qrNitContratista.caption+ '  '+qODTPadreCODIGOCONTRATISTA.asstring;}
  end;
  qConsulta2 := TQuery.Create(nil);
  try
    qConsulta2.DatabaseName := 'BaseDato';
    if qodthijaCODIGOTIPOACTIVO.ASINTEGER = 1 then
    begin
       qConsulta2.SQL.Add('SELECT A.CODIGOACTIVO, S.NOMBRESUBESTACION FROM ACTIVOSUBESTACION A, SUBESTACION S');
       qConsulta2.SQL.Add('WHERE A.CODIGOSUBESTACION = S.CODIGOSUBESTACION AND A.CODIGOSUBESTACION = ''' + qodthijaCODIGOSUBESTACION.AsString + '''' );
    end;
    if qodthijaCODIGOTIPOACTIVO.ASINTEGER = 2 then
    begin
       qConsulta2.SQL.Add('SELECT A.CODIGOACTIVO, L.nombreLINEA FROM ACTIVOLINEA A, LINEA L');
       qConsulta2.SQL.Add('WHERE A.CODIGOLINEA = L.CODIGOLINEA AND A.CODIGOLINEA = ''' + qodthijaCODIGOLINEA.AsString + '''' );
    end;
    if qodthijaCODIGOTIPOACTIVO.ASINTEGER = 3 then
    begin
       qConsulta2.SQL.Add('SELECT A.CODIGOACTIVO, C.nombrecircuito FROM ACTIVOCIRCUITO A, circuito C');
       qConsulta2.SQL.Add('WHERE A.CODIGOCIRCUITO = C.CODIGOCIRCUITO AND A.CODIGOCIRCUITO = ''' + qodthijaCODIGOCIRCUITO.AsString + '''' );
    end;
    qConsulta2.Open;
    if (qConsulta2.Fields[0].AsString <> '') or (qConsulta2.RecordCount = 0) then
      fQRRequisicionMateriales.qrCodigoActivo.Caption:= qConsulta2.Fields[0].AsString
    else
      fQRRequisicionMateriales.qrCodigoActivo.Caption:=  ' ';
    if (qConsulta2.Fields[1].AsString <> '') or (qConsulta2.RecordCount = 0)then
      fQRRequisicionMateriales.qrNombreActivo.Caption:= qConsulta2.Fields[1].AsString
    else
      fQRRequisicionMateriales.qrNombreActivo.Caption:= ' ';
    qConsulta2.Close;
    qConsulta2.Free;
  except
    qConsulta2.Close;
    qConsulta2.Free;
  end;

  fQRRequisicionMateriales.ShowModal;
  if qODTPadreCODIGOODTTIPOMANOOBRA.ASfloat = 1 then
  begin
    fQRRequisicionMateriales.qrNitContratista.Visible:= false;
    fQRRequisicionMateriales.qrContrato.visible:= false;
  end;
  fQRRequisicionMateriales.Free;
end;

procedure TFOdtUrbanaRural.qODTHijaCODIGOTIPOACTIVOValidate(
  Sender: TField);
begin
  if sender.AsString<>'' then
  begin
    dbEdCodigoTipoIntervencion.Enabled:=true;
    dblkCodigoTipoIntervencion.Enabled:=true;
    nbActivo.PageIndex:=sender.AsInteger;
    if (qODTHija.State in [dsedit,dsInsert])and (qODTHija.UpdateObject<>nil) then
    begin
      case sender.AsInteger of
        1:
        begin
          qSubestacion.open;
          qODTHijaCODIGOLINEA.AsString:='';
          qODTHijaCODIGOCIRCUITO.AsString:='';
        end;
        2:
        begin
          qLinea.open;
          qODTHijaCODIGOSUBESTACION.AsString:='';
          qODTHijaCODIGOCIRCUITO.AsString:='';
        end;
        3:
        begin
          qCircuito.open;
          qODTHijaCODIGOSUBESTACION.AsString:='';
          qODTHijaCODIGOLINEA.AsString:='';
        end;
      end;
    end;
  end
  else
  begin
    dbEdCodigoTipoIntervencion.Enabled:=false;
    dblkCodigoTipoIntervencion.Enabled:=false;
    nbActivo.PageIndex:=0;
  end;
end;

function TFOdtUrbanaRural.ValidacionActivo:boolean;
begin
  // omar hacer aqui la consulta de la validacion
  result:=false;
end;

procedure TFOdtUrbanaRural.qODTHijaCODIGOTIPOTRABAJOODTValidate(
  Sender: TField);
  var
  qconsulta2,query: tquery;
  mensaje:string;
begin
  nbActivo.PageIndex:=0;
  if (sender.AsInteger=1) or (sender.AsInteger=2) or (sender.AsInteger=5) or (sender.asInteger=4) then
  begin
    dbEdCodigoTipoActivo.Enabled:=true;
    dblkCodigoTipoActivo.Enabled:=true;
    gbInformacionElemento.Enabled:=true;
  end
  else
  begin
    qConsulta2 := TQuery.Create(Application);
    Try
      //Interfaz OW
      {qConsulta2.DatabaseName := 'BaseDato';
      qConsulta2.SQL.Add('select * from odtintervencion');
      qConsulta2.SQL.Add('where codigoodt = ' + qODTHijaCODIGOODT.asstring + ' and consecutivo = '+ qODTHijaCONSECUTIVO.AsString);

      qConsulta2.Open;
      if qconsulta2.RecordCount > 0 then
        raise Exception.Create('No puede cambiar el tipo de Trabajo de esta ODT porque posee una intervencion creada');  }
      //qConsulta2.Close;
      dbEdCodigoTipoActivo.Enabled:=false;
      dblkCodigoTipoActivo.Enabled:=false;
      gbInformacionElemento.Enabled:=false;
      if (qODTHija.state in [dsEdit,dsInsert])and (qODTHija.UpdateObject<>nil) then
      begin
        qODTHijaCODIGOTIPOACTIVO.AsString:='';
        qODTHijaCODIGOTIPOINTERVENCION.AsString:='';
        qODTHijaCODIGOODTOPERA.AsString:='';
        qODTHijaCODIGONIVELTENSION.AsString:='';
      end;
      //qODTHijaCODIGOTIPOELEMENTO.AsString:='';
    finally
      qConsulta2.Close;
      qConsulta2.Free;
    end;
  end;
  if ValidarTipoModificacionStock(sender.AsString, mensaje) then
  begin
    if ValidarPermisoModificacionStock(mensaje) then
    begin
      VisualizarModificacionStock(true);
    end
    else
    begin
      VisualizarModificacionStock(false);
      raise exception.Create(mensaje);
    end;
  end
  else
  begin
    if ValidarTipoModificacionStock(qODTHijaCODIGOTIPOTRABAJOODT.AsString, mensaje) then
    begin
      if qPresMate.recordcount>0 then
      begin
        VisualizarModificacionStock(true);
        raise exception.create('No puede cambiar este tipo de trabajo, porque ya hay materiales asociados');
      end
      else
        VisualizarModificacionStock(false);
    end
    else
      VisualizarModificacionStock(false);
  end;
  qODTHijaCODIGOTIPOACTIVOValidate(qODTHijaCODIGOTIPOACTIVO);
end;

procedure TFOdtUrbanaRural.qODTHijaCODIGOGEOGRAFICOChange(Sender: TField);
begin
  qGeografico.Close;
  qGeografico.Open;
  qCircuito.Close;
  qCircuito.Open;
end;

procedure TFOdtUrbanaRural.sbDevolucionesClick(Sender: TObject);
var
  qConsulta:Tquery;
begin
{  //if qODTPadreCODIGOESTADOODT.asstring = '6' then
  If MaterialModificado = true then
     raise Exception.Create('El listado de material a sido modificado. Guarde la información de la Odt Hija e intentelo nuevamente...');
  if (qODTHijaMATERIALREINTEGRADO.asstring <> 'S') or (permiso = true) then
  begin
    if Application.MessageBox(PChar('Si imprime esta nota se bloqueará y no permitira imprimirla nuevamente. Esta seguro que desea hacerlo?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idNo then
      raise Exception.Create('Operacion Cancelada...');
    try
      minimizarodthija;
      fInformacionOdthija.BorderIcons:= [];
      fQRodtDevoluciones := TfQRODTDevoluciones.Create(Application);
      fQRodtDevoluciones.qCliente.ParamByName('codigoejecutor').asfloat := qODTPadreCODIGOEJECUTOR.asfloat;
      fQRodtDevoluciones.qCliente.open;
      fQRodtDevoluciones.qmaterial.open;
      fQRodtDevoluciones.qunidad.open;
      fQRodtDevoluciones.qPresMate.ParamByName('codigoodt').asfloat:= qODTHijaCODIGOODT.asfloat;
      fQRodtDevoluciones.qPresMate.ParamByName('consecutivo').asinteger:= qODTHijaCONSECUTIVO.asInteger;
      fQRodtDevoluciones.qPresMate.Open;
      fQRodtDevoluciones.qrlLocalizacion.Caption := qODTHijaDireccionCalculada.asstring;
      fQRodtDevoluciones.qrlNumeroContrato.Caption := qODTPadreNUMEROCONTRATO.asstring;
      fQRodtDevoluciones.qrlImpresoODT.Caption := qODTHijaCODIGOODT.asstring + ' - '+qODTHijaCONSECUTIVO.asstring ;
      //Si Modo Alumbrado Público
      if  ( qODTPadreCODIGOMODOODT.AsInteger = 2 ) then
      Begin
        fQRodtDevoluciones.qrimage2.visible:= true;
        fQRodtDevoluciones.qrimage1.visible:= false;
      End else
      Begin
        fQRodtDevoluciones.qrimage2.visible:= false;
        fQRodtDevoluciones.qrimage1.visible:= true;
      end;

      if qODTPadreCODIGOCONTRATISTA.asstring = '' then
      Begin
         fQRodtDevoluciones.qrdbcodigoc.Visible:= true;
         fQRodtDevoluciones.qrdbnombrec.Visible:= true;
         fQRodtDevoluciones.qrdbCodigoCliente.Visible:= false;
         fQRodtDevoluciones.QRDBNombreCliente.Visible:= False;
      end
      else
      Begin
         fQRodtDevoluciones.qrdbcodigoc.Visible:= False;
         fQRodtDevoluciones.qrdbnombrec.Visible:= False;
         fQRodtDevoluciones.qrdbCodigoCliente.Visible:= true;
         fQRodtDevoluciones.QRDBNombreCliente.Visible:= true;
      end;
      //qpresmate.Open;
      fQRodtDevoluciones.QRDevoluciones.Preview;

      Notebook.ActivePage := 'MATERIALES';
      if fQRODTDevoluciones.GeneroImpresion = true then
        qODTHijaMATERIALREINTEGRADO.asstring := 'S';
    except
      fQRodtDevoluciones.free;
    end;
  end
  else
    //Application.MessageBox('Esta ODT no esta finalizada.', 'Advertencia', MB_OK + MB_ICONWARNING);
    Application.MessageBox('La Nota de Ingeniería de esta ODT ya fue Impresa.', 'Advertencia', MB_OK + MB_ICONWARNING); }
end;

procedure TFOdtUrbanaRural.sbCrearIntervencionClick(Sender: TObject);
{var
  qconsulta2: tquery;
  qconsulta3: tquery;
  qconsulta: tquery;
  activo: integer;
  EjecutorCreado: integer;
  ManoObra:Integer;}
begin

{  if  (qODTHijaCODIGOTIPOTRABAJOODT.ASSTRING = '') or (qODTHijaCODIGOTIPOTRABAJOODT.ASFLOAT > 2) then
      raise Exception.Create('La Odt Hija no tiene ningun activo a intervenir');
  if (qODTHijaCODIGOCIRCUITO.asstring = '')   and (qODTHijaCODIGOLINEA.asstring = '') and (qODTHijaCODIGOSUBESTACION.asstring = '') then
      raise Exception.Create('Debe escoger un Activo a intervenir');

  fIntervencion := tfIntervencion.Create(Application);
  if Crearintervencion = true then
     fintervencion.BitBtnCerrar.Enabled:= FALSE;

  fintervencion.qSAF_M_EJECUTORES.OPEN;
  fintervencion.qSAF_M_EJECUTORES.Insert;

  qConsulta2 := TQuery.Create(Application);
  qConsulta2.DatabaseName := 'BaseDato';
  if qodthijaCODIGOTIPOACTIVO.ASINTEGER = 1 THEN
  BEGIN
       fintervencion.Notebook1.ActivePage:= 'Subestaciones';
       qConsulta2.SQL.Add('SELECT CODIGOACTIVO FROM ACTIVOSUBESTACION');
       qConsulta2.SQL.Add('WHERE ACTIVO = ''S'' AND CODIGOSUBESTACION = ''' + qodthijaCODIGOSUBESTACION.AsString + '''');
  END;
  if qodthijaCODIGOTIPOACTIVO.ASINTEGER = 2 THEN
  BEGIN
       fintervencion.Notebook1.ActivePage:= 'Lineas';
       qConsulta2.SQL.Add('SELECT CODIGOACTIVO FROM ACTIVOLINEA');
       qConsulta2.SQL.Add('WHERE ACTIVO = ''S'' AND CODIGOLINEA = ''' + qodthijaCODIGOLINEA.AsString + '''');
  END;
  if qodthijaCODIGOTIPOACTIVO.ASINTEGER = 3 THEN
  BEGIN
       fintervencion.Notebook1.ActivePage:= 'Circuitos';
       qConsulta2.SQL.Add('SELECT CODIGOACTIVO FROM ACTIVOCIRCUITO');
       qConsulta2.SQL.Add('WHERE ACTIVO = ''S'' AND CODIGOCIRCUITO = ''' + qodthijaCODIGOCIRCUITO.AsString + '''' );
  END;


  qConsulta2.Open;
  IF  (qConsulta2.RecordCount= 0)  THEN
  begin
      qconsulta2.close;
      qconsulta2.free;
      raise Exception.Create('El activo sobre el cual se trabajará no pertenece a la empresa.');
  end;
  qconsulta2.Close;
  qconsulta2.free;
  qConsulta3 := TQuery.Create(Application);
  qConsulta3.DatabaseName := 'BaseDato';
  qConsulta3.SQL.Add('SELECT CODIGOODTTIPOMANOOBRA FROM ODT');
  qConsulta3.SQL.Add('WHERE CODIGOODT = ' + qODTHijaCODIGOODT.ASSTRING);
  qConsulta3.Open;
  manoObra:= qConsulta3.Fields[0].Asinteger;
  qConsulta3.Close;
  qConsulta3.FREE;
  fIntervencion.qSAF_M_INTERVENCIONES.open;
  fIntervencion.qSAF_M_INTERVENCIONES.insert;
  fIntervencion.qSAF_M_INTERVENCIONES.FieldByName('COD_INTERVENCION').ASinteger :=  strtoint(copy(qODTHijaCODIGOODT.Asstring,7,length(qODTPadreCODIGOODT.Asstring)) + qODTHijaCONSECUTIVO.ASSTRING);  //STRTOINT(qODTHijaCODIGOODT.ASSTRING + qODTHijaCONSECUTIVO.ASSTRING);
  fIntervencion.qSAF_M_INTERVENCIONES.FieldByName('COD_ORIGEN').ASstring := 'ODTA';
  IF  MANOOBRA = 1 THEN
    fIntervencion.qSAF_M_INTERVENCIONES.FieldByName('COD_EJECUTOR').asstring:= ('EJEC'+ qODTHijaCODIGOODT.ASSTRING + qODTHijaCONSECUTIVO.ASSTRING)
  ELSE
    fIntervencion.qSAF_M_INTERVENCIONES.FieldByName('COD_EJECUTOR').asstring:= qODTPadreNUMEROCONTRATO.ASSTRING; //  HijaCODIGOODT.ASSTRING;
    fIntervencion.qSAF_M_INTERVENCIONES.FieldByName('VIGENCIA').ASFLOAT:= anoactual;
  //Zona de la intervencion
  qConsulta2 := TQuery.Create(Application);
  qConsulta2.DatabaseName := 'BaseDato';
  if qodthijaCODIGOTIPOACTIVO.ASINTEGER = 1 THEN
    qConsulta2.SQL.Add('SELECT ZONA_ADMINISTRATIVA FROM SAF_ACTIVOS'+DBLink+' WHERE CODIGO_ACTIVO = (SELECT CODIGOACTIVO FROM ACTIVOSUBESTACION WHERE CODIGOSUBESTACION = ''' + qODTHijaCODIGOSUBESTACION.ASSTRING + ''')' );
  if qodthijaCODIGOTIPOACTIVO.ASINTEGER = 2 THEN
    qConsulta2.SQL.Add('SELECT ZONA_ADMINISTRATIVA FROM SAF_ACTIVOS'+DBLink+' WHERE CODIGO_ACTIVO = (SELECT CODIGOACTIVO FROM ACTIVOLINEA WHERE CODIGOLINEA = ''' + qODTHijaCODIGOLINEA.ASSTRING + ''')' );
  if qodthijaCODIGOTIPOACTIVO.ASINTEGER = 3 THEN
    qConsulta2.SQL.Add('SELECT ZONA_ADMINISTRATIVA FROM SAF_ACTIVOS'+DBLink+' WHERE CODIGO_ACTIVO = (SELECT CODIGOACTIVO FROM ACTIVOCIRCUITO WHERE CODIGOCIRCUITO = ''' + qODTHijaCODIGOCIRCUITO.ASSTRING + ''')' );

  qConsulta2.Open;
  fIntervencion.qSAF_M_INTERVENCIONES.FieldByName('COD_ZONA').ASFLOAT:= qConsulta2.Fields[0].AsFLOAT;
  qConsulta2.Close;
  qConsulta2.Free;
  qConsulta2 := TQuery.Create(Application);
  qConsulta2.DatabaseName := 'BaseDato';
  qConsulta2.SQL.Add('SELECT CODIGOESSA FROM TIPOINTERVENCION');
  qConsulta2.SQL.Add('WHERE CODIGOTIPOINTERVENCION = ' + qodthijaCODIGOTIPOINTERVENCION.AsString);
  qConsulta2.Open;
  fIntervencion.qSAF_M_INTERVENCIONES.FieldByName('COD_TIPO_INTERVENCION').ASstring := qConsulta2.Fields[0].AsString;
  qConsulta2.Close;
  qConsulta2.Free;

  qConsulta2 := TQuery.Create(Application);
  qConsulta2.DatabaseName := 'BaseDato';
  if qodthijaCODIGOTIPOACTIVO.ASINTEGER = 1 THEN
  BEGIN
       fintervencion.Notebook1.ActivePage:= 'Subestaciones';
       qConsulta2.SQL.Add('SELECT CODIGOACTIVO FROM ACTIVOSUBESTACION');
       qConsulta2.SQL.Add('WHERE ACTIVO = ''S'' AND CODIGOSUBESTACION = ''' + qodthijaCODIGOSUBESTACION.AsString + '''');
  END;
  if qodthijaCODIGOTIPOACTIVO.ASINTEGER = 2 THEN
  BEGIN
       fintervencion.Notebook1.ActivePage:= 'Lineas';
       qConsulta2.SQL.Add('SELECT CODIGOACTIVO FROM ACTIVOLINEA');
       qConsulta2.SQL.Add('WHERE ACTIVO = ''S'' AND CODIGOLINEA = ''' + qodthijaCODIGOLINEA.AsString + '''');
  END;
  if qodthijaCODIGOTIPOACTIVO.ASINTEGER = 3 THEN
  BEGIN
       fintervencion.Notebook1.ActivePage:= 'Circuitos';
       qConsulta2.SQL.Add('SELECT CODIGOACTIVO FROM ACTIVOCIRCUITO');
       qConsulta2.SQL.Add('WHERE ACTIVO = ''S'' AND CODIGOCIRCUITO = ''' + qodthijaCODIGOCIRCUITO.AsString + '''' );
  END;

  qConsulta2.Open;
  ACTIVO := qConsulta2.Fields[0].AsiNTEGER;
  qConsulta2.Close;
  qConsulta2.Free;
  fintervencion.qSAF_M_INTERVENCIONES.FieldByName('COD_ACTIVO').AsFloat := ACTIVO;
  if fintervencion.ShowModal = mrOk then
  begin
  qConsulta2 := TQuery.Create(Application);
  qConsulta2.DatabaseName := 'BaseDato';
  if ManoObra = 1 then
   qConsulta2.SQL.Add('SELECT * from '+EsquemaAlmacen+'saf_m_ejecutores'+DBLink+' where COD_EJECUTOR = ''EJEC'+ qODTHijaCODIGOODT.ASSTRING + qODTHijaCONSECUTIVO.ASSTRING + ''' AND COD_ORIGEN= ''ODTA'' AND VIGENCIA =' + inttostr(anoactual) )
  ELSE
   qConsulta2.SQL.Add('SELECT * from '+EsquemaAlmacen+'saf_m_ejecutores'+DBLink+' where COD_EJECUTOR = '''+ qODTPadreNUMEROCONTRATO.ASSTRING + ''' AND COD_ORIGEN= ''ODTA''AND VIGENCIA =' + inttostr(anoactual) );

  qConsulta2.Open;
  EjecutorCreado:= qConsulta2.RECORDCOUNT;
  qConsulta2.Close;
  qConsulta2.Free;
  IF  EjecutorCreado = 0 THEN
  BEGIN
    if ManoObra = 1 then
    fintervencion.qSAF_M_EJECUTORES.FieldByName('COD_EJECUTOR').asstring:= ('EJEC'+ qODTHijaCODIGOODT.ASSTRING + qODTHijaCONSECUTIVO.ASSTRING)
    ELSE
    fintervencion.qSAF_M_EJECUTORES.FieldByName('COD_EJECUTOR').asstring:= qODTPadreNUMEROCONTRATO.ASSTRING;   //qODTHijaCODIGOODT.ASSTRING;
    fintervencion.qSAF_M_EJECUTORES.FieldByName('USUARIO_CREA').asstring:= NombreUsuario;
    fintervencion.qSAF_M_EJECUTORES.FieldByName('FECHA_CREA').VALUE:= NOW;
    fintervencion.qSAF_M_EJECUTORES.FieldByName('VIGENCIA').ASFLOAT:= anoactual;
    fintervencion.qSAF_M_EJECUTORES.FieldByName('COD_ORIGEN').ASSTRING :='ODTA';
    fintervencion.QSAF_M_EJECUTORES.Post;
    fintervencion.QSAF_M_EJECUTORES.ApplyUpdates;
    fintervencion.QSAF_M_EJECUTORES.CommitUpdates;
  end;
  //Averiguar el nombre del usuario activo para actualizar los campos FECHA_CREA
  //  y USUARIO_CREA en caso de inserción, o los campos FECHA_MOD y USUARIO_MOD en
  //  caso de modificación.
  IF fintervencion.qSAF_M_INTERVENCIONES.State = dsInsert THEN
   fintervencion.qSAF_M_INTERVENCIONESCOD_INTERVENCION.ASinteger := strtoint(copy(qODTHijaCODIGOODT.Asstring,7,length(qODTHijaCODIGOODT.Asstring)) + qODTHijaCONSECUTIVO.ASSTRING);  //STRTOINT(qODTHijaCODIGOODT.ASSTRING + qODTHijaCONSECUTIVO.ASSTRING);
  if fintervencion.qSAF_M_INTERVENCIONES.State = dsInsert then
  begin
    fintervencion.qSAF_M_INTERVENCIONESUSUARIO_CREA.ASSTRING := NombreUsuario;
    fintervencion.qSAF_M_INTERVENCIONESFECHA_CREA.Value := Now;
  end
  else
  begin
    fintervencion.qSAF_M_INTERVENCIONESUSUARIO_MOD.AsString := NombreUsuario;
    fintervencion.qSAF_M_INTERVENCIONESFECHA_MOD.Value := Now;
  end;
  fintervencion.qSAF_M_INTERVENCIONES.Post;
  fintervencion.qSAF_M_INTERVENCIONES.ApplyUpdates;
  fintervencion.qSAF_M_INTERVENCIONES.CommitUpdates;
  //aQUI SE LLENA LOS VALORES DE LA INTERVENCION PARA LAS REQUISICIONES YA CREADAS
  if Crearintervencion = true then
  begin
    qConsulta := TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.SQL.Add('update '+EsquemaAlmacen+'com_m_requisicion'+DBLink+' set COD_INTERVENCION= '''', COD_TIPO_INTERVENCION = '''', COD_ORIGEN = '''', COD_EJECUTOR= '''', VIGENCIA_intervencion= '''', FECHA_MOD = (SELECT SYSDATE FROM DUAL), USUARIO_MOD = '''+ NombreUsuario +'''  where cod_intervencion = ' + copy(qODTHijaCODIGOODT.Asstring,7,length(qODTHijaCODIGOODT.Asstring)) + qODTHijaCONSECUTIVO.AsString);
    qConsulta.execsql;
    qConsulta.Free;
  end;
  fODTUrbanaRural.sbEditarIntervencion.Enabled := true;
  fODTUrbanaRural.sbCrearIntervencion.Enabled := false;
  IntervencionCreada:= true;
  sbAgregarRequisicion.Enabled := true;
  sbEditarRequisicion.Enabled := true;
  sbImprimirRequisicion.Enabled := true;
  qodthija.Post;
  qODTHija.ApplyUpdates;
  qODTHija.CommitUpdates;
  IF  (IntervencionCreada = true) THEN
  BEGIN
    qODTINTERVENCION.OPEN;
    qODTINTERVENCION.Insert;
    qODTINTERVENCIONCODIGOODT.asFloat := qodthijaCODIGOODT.AsFloat;
    qODTINTERVENCIONconsecutivo.AsFLOAT:= qODTHijaCONSECUTIVO.AsFloat;
    qODTINTERVENCIONCODIGOINTERVENCION.ASFLOAT:= STRTOFLOAT(copy(qODTHijaCODIGOODT.Asstring,7,length(qODTHijaCODIGOODT.Asstring)) + qODTHijaCONSECUTIVO.AsSTRING);
    qODTINTERVENCION.Post;
    qODTINTERVENCION.ApplyUpdates;
    qODTINTERVENCION.CommitUpdates;
  END;
    qodthija.Edit;
  end;
  //***********************************intervenciones fin*************************************
  fIntervencion.free;  }
end;

procedure TFOdtUrbanaRural.sbEditarIntervencionClick(Sender: TObject);
begin
//Interfaz OW
{
fIntervencion := tfIntervencion.Create(Application);
fIntervencion.qSAF_M_INTERVENCIONES.close;
fIntervencion.qSAF_M_INTERVENCIONES.paramByName('CODINTERVENCION').ASFLOAT := strtofloat(copy(qODTHijaCODIGOODT.Asstring,7,length(qODTPadreCODIGOODT.Asstring)) + qODTHijaCONSECUTIVO.ASSTRING);  //STRTOINT(qODTHijaCODIGOODT.ASSTRING + qODTHijaCONSECUTIVO.ASSTRING);
fIntervencion.qSAF_M_INTERVENCIONES.open;
fIntervencion.qSAF_M_INTERVENCIONES.edit;
case qodthijaCODIGOTIPOACTIVO.ASINTEGER of
1:fintervencion.Notebook1.ActivePage:= 'Subestaciones';
2:fintervencion.Notebook1.ActivePage:= 'Lineas';
3:fintervencion.Notebook1.ActivePage:= 'Circuitos';
end;
if fintervencion.ShowModal = mrOk then
begin
fintervencion.qSAF_M_INTERVENCIONES.Post;
fintervencion.qSAF_M_INTERVENCIONES.ApplyUpdates;
fintervencion.qSAF_M_INTERVENCIONES.CommitUpdates;
end;
fIntervencion.free;}
end;

procedure TFOdtUrbanaRural.sbEliminarRequisicionClick(Sender: TObject);
var
  qConsulta: TQuery;
  devolucion: string;
  CantidadEntregada: Boolean;
  proceso: string;  // proceso de la requisicion
begin
  Cantidadentregada:= False;
  if qRequisicionesESTADO.AsString = 'ANULADO' then
    raise Exception.Create('La requisición No. '+qRequisicionesCODIGOREQUISICION.AsString+' ya se encuentra ANULADA.');

  if Application.MessageBox(PChar('Esta seguro de Anular la requisicion No. '+qRequisicionesCODIGOREQUISICION.AsString),
                                        'Confirmación', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)= mrYes then
  begin
    fRequisicionMateriales := TfRequisicionMateriales.Create(Application);
    //Eliminar el registro en la tabla OdtRequisicion
    qConsulta := TQuery.Create(nil);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.SQL.Add('select sum(nvl(cantidad_inven_alma_eje,0)) as suma from '+EsquemaAlmacen+'com_m_requisicion_movi'+DBLink+' where cod_requisicion = ' + qRequisicionesCODIGOREQUISICION.AsString + ' and vigencia = '+ qRequisicionesVIGENCIA.asstring + ' and cias_cias = '+qRequisicionesEMPRESA.asstring);
    qConsulta.Open;

    if qConsulta.FieldByName('suma').AsInteger > 0 then
      Cantidadentregada:= True;

    qConsulta.Close;
    qConsulta.SQL.Clear;
    qConsulta.SQL.Add('select proceso from '+EsquemaAlmacen+'com_m_requisicion'+DBLink+' where cod_requisicion = ' + qRequisicionesCODIGOREQUISICION.AsString + ' and vigencia = '+ qRequisicionesVIGENCIA.asstring + ' and cias_cias = '+qRequisicionesEMPRESA.asstring);
    qConsulta.Open;
    Proceso:= qConsulta.FieldByName('proceso').AsString;
    qConsulta.Close;
    qConsulta.Free;

    if (CantidadEntregada = True) or (Proceso = 'FINALIZADA') then
      raise Exception.Create('Esta requisición no se puede anular pues ya hubo entrega de Material.');

    qConsulta := TQuery.Create(nil);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.SQL.Add('update odtrequisicion set estado = ''ANULADO'' where codigoodt = '+ qRequisicionesCODIGOODT.ASSTRING  + ' and consecutivo = '+ qRequisicionesCONSECUTIVO.AsString + ' and codigorequisicion = ' + qRequisicionesCODIGOREQUISICION.AsString + ' and vigencia = '+ qRequisicionesVIGENCIA.asstring);
    qConsulta.ExecSQL;
    qConsulta.Close;

    //Eliminar el registro en la tabla com_m_reserva_inventario
    qConsulta.SQL.Clear;
    qConsulta.SQL.Add('update '+EsquemaAlmacen+'com_m_reserva_inventario'+DBLink+' set cantidad_reservada = 0 where cias_cias = '+ qRequisicionesEMPRESA.ASSTRING  + ' and vigencia = '+ qRequisicionesVIGENCIA.AsString  + ' and cod_requisicion = ' + qRequisicionesCODIGOREQUISICION.AsString);
    qConsulta.ExecSQL;
    qConsulta.Close;

    qConsulta.SQL.Clear;
    qConsulta.SQL.Add('delete from '+EsquemaAlmacen+'com_m_reserva_inventario'+DBLink+' where cias_cias = '+ qRequisicionesEMPRESA.ASSTRING  + ' and vigencia = '+ qRequisicionesVIGENCIA.AsString  + ' and cod_requisicion = ' + qRequisicionesCODIGOREQUISICION.AsString);
    qConsulta.ExecSQL;
    qConsulta.Close;

    //Eliminar el registro en la tabla com_m_requisicion_movi

    qConsulta.SQL.Clear;
    qConsulta.SQL.Add('delete from '+EsquemaAlmacen+'com_m_requisicion_movi'+DBLink+' where CIAS_CIAS = '+ qRequisicionesEMPRESA.ASSTRING  + 'and vigencia = '+ qRequisicionesVIGENCIA.AsString  + 'and cod_requisicion = ' + qRequisicionesCODIGOREQUISICION.AsString);
    qConsulta.ExecSQL;
    qConsulta.Close;

    qConsulta.SQL.Clear;
    qConsulta.SQL.Add('UPDATE '+EsquemaAlmacen+'com_m_requisicion'+DBLink+' SET estado = ''ANULADO'', USUARIO_MOD = ''' + NombreUsuario + ''', FECHA_MOD = (SELECT SYSDATE FROM DUAL) where CIAS_CIAS = '+ qRequisicionesEMPRESA.ASSTRING  + ' and vigencia = '+ qRequisicionesVIGENCIA.AsString  + ' and cod_requisicion = ' + qRequisicionesCODIGOREQUISICION.AsString);
    qConsulta.ExecSQL;
    qConsulta.Close;
    qConsulta.Free;

    //Cambio del estado del registro de la requisicion a "ANULADO".
    fRequisicionMateriales.qCOM_M_REQUISICION.ParamByName('CIAS_CIAS').AsFloat := qRequisicionesEMPRESA.AsFloat;
    fRequisicionMateriales.qCOM_M_REQUISICION.ParamByName('VIGENCIA').AsFloat := qRequisicionesVIGENCIA.AsFloat;
    fRequisicionMateriales.qCOM_M_REQUISICION.ParamByName('COD_REQUISICION').AsFloat := qRequisicionesCODIGOREQUISICION.AsFloat;
    fRequisicionMateriales.qCOM_M_REQUISICION.Open;
    fRequisicionMateriales.qCOM_M_REQUISICION.Edit;
    fRequisicionMateriales.qCOM_M_REQUISICIONESTADO.ASSTRING:= 'ANULADO';
    fRequisicionMateriales.qCOM_M_REQUISICION.Post;
    fRequisicionMateriales.qCOM_M_REQUISICION.CommitUpdates;
    fRequisicionMateriales.qCOM_M_REQUISICION.ApplyUpdates;
    fRequisicionMateriales.Free;
    qRequisiciones.Close;
    qRequisiciones.Open;
    ActualizarCantidadReservada;
  end;
end;


procedure TFOdtUrbanaRural.qODTHijaCODIGOLINEAValidate(Sender: TField);
var
  qConsulta: Tquery;
  qConsulta2: Tquery;
  Activo: Integer;
  RequisicionesCreadas: integer;
  cont:integer;
  query:tquery;
begin
  if Sender.AsString<>'' then
  begin
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT COUNT(*) FROM LINEA WHERE CODIGOLINEA='''+qODTHijaCODIGOLINEA.AsString+'''');
    query.Open;
    cont:=query.fields[0].AsInteger;
    query.close;
    query.free;
    if (cont=0) then raise exception.create('Este código de línea no existe por favor verifique.');
    //Interfaz OW
    {Crearintervencion:= false;
    if IntervencionCreada then
    begin
      qConsulta2 := TQuery.Create(Application);
      qConsulta2.DatabaseName := 'BaseDato';
      qConsulta2.SQL.Add('SELECT CODIGOACTIVO FROM ACTIVOLINEA');
      qConsulta2.SQL.Add('WHERE ACTIVO = ''S'' AND CODIGOLINEA = ''' + qodthijaCODIGOLINEA.AsString + '''');
      qConsulta2.Open;
      ACTIVO := qConsulta2.Fields[0].AsiNTEGER;
      qConsulta2.Close;
      qConsulta2.Free;
      if Activo = 0 then
      begin

        if MessageDlg('Este Activo No Pertenece a la Empresa, Desea eliminar la Intervencion sobre este?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin
            qConsulta := TQuery.Create(Application);
            qConsulta.DatabaseName := 'BaseDato';
            qConsulta.SQL.Add('update '+EsquemaAlmacen+'com_m_requisicion'+DBLink+' set COD_INTERVENCION= '''', COD_TIPO_INTERVENCION = '''', COD_ORIGEN = '''', COD_EJECUTOR= '''', VIGENCIA_intervencion= '''', FECHA_MOD = (SELECT SYSDATE FROM DUAL), USUARIO_MOD= '''+ NombreUsuario +'''  where cod_intervencion = ' + qODTHijaCODIGOODT.asstring + qODTHijaCONSECUTIVO.AsString);

            qConsulta.execsql;
            qConsulta.Free;

             //Eliminar la Intervencion...
            qConsulta := TQuery.Create(Application);
            qConsulta.DatabaseName := 'BaseDato';
            qConsulta.SQL.Add('delete from '+EsquemaAlmacen+'SAF_M_INTERVENCIONES'+DBLink+' where COD_INTERVENCION = '+ qODTHijaCODIGOODT.ASSTRING + qODTHijaCONSECUTIVO.ASSTRING);

            qConsulta.execsql;
            qConsulta.Free;

            qConsulta := TQuery.Create(Application);
            qConsulta.DatabaseName := 'BaseDato';
            qConsulta.SQL.Add('delete from ODTINTERVENCION where CODIGOINTERVENCION = '+ qODTHijaCODIGOODT.ASSTRING + qODTHijaCONSECUTIVO.ASSTRING);
            qConsulta.execsql;
            qConsulta.Free;

            IntervencionCreada:= false;
            sbCrearIntervencion.enabled:= true;
            sbeditarIntervencion.enabled:= false;
        end
        else
            exit;
            //raise Exception.Create('Intervencion Eliminada');
      end
      else
      begin
           if MessageDlg('Modificar el Codigo del Activo de la Intervencion?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
           begin
             qConsulta := TQuery.Create(Application);
             qConsulta.DatabaseName := 'BaseDato';
             qConsulta.SQL.Add('update '+EsquemaAlmacen+'saf_m_intervenciones'+DBLink+' set cod_activo = '+ IntToStr(Activo) + ', USUARIO_MOD = ''' + NombreUsuario + ''', FECHA_MOD = (SELECT SYSDATE FROM DUAL) where Cod_intervencion = '+ qODTHijaCODIGOODT.asstring + qODTHijaCONSECUTIVO.AsString);
             qConsulta.execsql;
             qConsulta.Free;
           end;
      end;
    end
    else
    begin
      qConsulta2 := TQuery.Create(Application);
      qConsulta2.DatabaseName := 'BaseDato';
      qConsulta2.SQL.Add('SELECT CODIGOACTIVO FROM ACTIVOLINEA');
      qConsulta2.SQL.Add('WHERE ACTIVO = ''S'' AND CODIGOLINEA = ''' + qodthijaCODIGOLINEA.AsString + '''');
      qConsulta2.Open;
      ACTIVO := qConsulta2.Fields[0].AsiNTEGER;
      qConsulta2.Close;
      qConsulta2.Free;
      if Activo > 0 then
      //Aqui va el codigo para generar la intervencion y modificar las requisiciones existentes con los valores de dicha intervancion.
      begin
        qConsulta2 := TQuery.Create(Application);
        qConsulta2.DatabaseName := 'BaseDato';
        qConsulta2.SQL.Add('select * from odtrequisicion');
        qConsulta2.SQL.Add('where codigoodt = ' + qODTHijaCODIGOODT.asstring + ' and consecutivo = '+ qODTHijaCONSECUTIVO.AsString);
        qConsulta2.Open;
        RequisicionesCreadas:= qConsulta2.Fields[0].AsiNTEGER;
        qConsulta2.Close;
        qConsulta2.Free;
        if RequisicionesCreadas > 0 then
        begin
             Crearintervencion:= true;
        end;
      end;
    end;}

  end;
end;

procedure TFOdtUrbanaRural.DBLookupComboBox3Click(Sender: TObject);
begin
if Crearintervencion= true then
   sbCrearIntervencionClick(nil);
end;

procedure TFOdtUrbanaRural.qODTHijaCODIGOCIRCUITOValidate(Sender: TField);
var
  qConsulta: Tquery;
  qConsulta2: Tquery;
  Activo: Integer;
  RequisicionesCreadas: integer;
  cont:integer;
  query:tquery;
begin
  if Sender.AsString<>'' then
  begin
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT COUNT(*) FROM CIRCUITO WHERE CODIGOCIRCUITO='''+qODTHijaCODIGOCIRCUITO.AsString+'''');
    query.Open;
    cont:=query.fields[0].AsInteger;
    query.close;
    query.free;
    if (cont=0) then raise exception.create('Este código de circuito no existe por favor verifique.');
    //Interfaz OW
    {Crearintervencion:= false;
    if IntervencionCreada  = TRUE then
    begin
      qConsulta2 := TQuery.Create(Application);
      qConsulta2.DatabaseName := 'BaseDato';
      qConsulta2.SQL.Add('SELECT CODIGOACTIVO FROM ACTIVOCIRCUITO');
      qConsulta2.SQL.Add('WHERE CODIGOCIRCUITO = ''' + qodthijaCODIGOCIRCUITO.AsString + '''');
      qConsulta2.Open;
      ACTIVO := qConsulta2.Fields[0].AsiNTEGER;
      qConsulta2.Close;
      qConsulta2.Free;
      if Activo = 0 then
      begin
        if MessageDlg('Este Activo No Pertenece a la Empresa, Desea eliminar la Intervencion sobre este?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
        begin

            qConsulta := TQuery.Create(Application);
            qConsulta.DatabaseName := 'BaseDato';
            qConsulta.SQL.Add('update '+EsquemaAlmacen+'com_m_requisicion'+DBLink+' set COD_INTERVENCION= '''', COD_TIPO_INTERVENCION = '''', COD_ORIGEN = '''', COD_EJECUTOR= '''', VIGENCIA_intervencion= '''', FECHA_MOD = (SELECT SYSDATE FROM DUAL), USUARIO_MOD= '''+NombreUsuario+ '''  where cod_intervencion = ' + qODTHijaCODIGOODT.asstring + qODTHijaCONSECUTIVO.AsString);
            qConsulta.execsql;
            qConsulta.Free;

             //Eliminar la Intervencion...
            qConsulta := TQuery.Create(Application);
            qConsulta.DatabaseName := 'BaseDato';
            qConsulta.SQL.Add('delete from '+EsquemaAlmacen+'SAF_M_INTERVENCIONES'+DBLink+' where COD_INTERVENCION = '+ qODTHijaCODIGOODT.ASSTRING + qODTHijaCONSECUTIVO.ASSTRING);
            qConsulta.execsql;
            qConsulta.Free;

            qConsulta := TQuery.Create(Application);
            qConsulta.DatabaseName := 'BaseDato';
            qConsulta.SQL.Add('delete from ODTINTERVENCION where CODIGOINTERVENCION = '+ qODTHijaCODIGOODT.ASSTRING + qODTHijaCONSECUTIVO.ASSTRING);
            qConsulta.execsql;
            qConsulta.Free;

            IntervencionCreada:= false;
            sbCrearIntervencion.enabled:= true;
            sbeditarIntervencion.enabled:= false;
        end
        else
            exit;
            //raise Exception.Create('Intervencion Eliminada');
      end
      else
      begin
           if MessageDlg('Modificar el Codigo del Activo de la Intervencion?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
           begin
             qConsulta := TQuery.Create(Application);
             qConsulta.DatabaseName := 'BaseDato';
             qConsulta.SQL.Add('update '+EsquemaAlmacen+'saf_m_intervenciones'+DBLink+' set cod_activo = '+ IntToStr(Activo) + ', USUARIO_MOD = ''' + NombreUsuario + ''', FECHA_MOD = (SELECT SYSDATE FROM DUAL) where Cod_intervencion = '+ qODTHijaCODIGOODT.asstring + qODTHijaCONSECUTIVO.AsString);
             qConsulta.execsql;
             qConsulta.Free;
           end;
      end;
    end
    else
    begin
      qConsulta2 := TQuery.Create(Application);
      qConsulta2.DatabaseName := 'BaseDato';
      qConsulta2.SQL.Add('SELECT CODIGOACTIVO FROM ACTIVOCIRCUITO');
      qConsulta2.SQL.Add('WHERE CODIGOCIRCUITO = ''' + qodthijaCODIGOCIRCUITO.AsString + '''');
      qConsulta2.Open;
      ACTIVO := qConsulta2.Fields[0].AsiNTEGER;
      qConsulta2.Close;
      qConsulta2.Free;
      if Activo > 0 then
      //Aqui va el codigo para generar la intervencion y modificar las requisiciones existentes con los valores de dicha intervancion.
      begin
        qConsulta2 := TQuery.Create(Application);
        qConsulta2.DatabaseName := 'BaseDato';
        qConsulta2.SQL.Add('select * from odtrequisicion');
        qConsulta2.SQL.Add('where codigoodt = ' + qODTHijaCODIGOODT.asstring + ' and consecutivo = '+ qODTHijaCONSECUTIVO.AsString);
        qConsulta2.Open;
        RequisicionesCreadas:= qConsulta2.Fields[0].AsiNTEGER;
        qConsulta2.Close;
        qConsulta2.Free;
        if RequisicionesCreadas > 0 then
        begin
             Crearintervencion:= true;
        end;
      end;
    end;}

  end;
end;

procedure TFOdtUrbanaRural.qODTHijaCODIGOSUBESTACIONValidate(
  Sender: TField);
var
  qConsulta,query: Tquery;
  qConsulta2: Tquery;
  Activo: Integer;
  RequisicionesCreadas: integer;
  cont:integer;
begin
  if Sender.AsString<>'' then
  begin
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT COUNT(*) FROM SUBESTACION WHERE CODIGOSUBESTACION='''+qODTHijaCODIGOSUBESTACION.AsString+'''');
    query.Open;
    cont:=query.fields[0].AsInteger;
    query.close;
    query.free;
    if (cont=0) then raise exception.create('Este código de subestación no existe por favor verifique.');
    //Interfaz OW
    {
    Crearintervencion:= false;
    if (IntervencionCreada ) then
    begin
      qConsulta2 := TQuery.Create(Application);
      qConsulta2.DatabaseName := 'BaseDato';
      qConsulta2.SQL.Add('SELECT CODIGOACTIVO FROM ACTIVOSUBESTACION');
      qConsulta2.SQL.Add('WHERE CODIGOSUBESTACION = ''' + qodthijaCODIGOSUBESTACION.AsString + '''');
      qConsulta2.Open;
      ACTIVO := qConsulta2.Fields[0].asInteger;
      qConsulta2.Close;
      qConsulta2.Free;
      if Activo = 0 then
      begin
        if (MessageDlg('Este Activo No Pertenece a la Empresa, Desea eliminar la Intervencion sobre este?',mtConfirmation,[mbYes,mbNo],0) = mrYes) then
        begin
            qConsulta := TQuery.Create(Application);
            qConsulta.DatabaseName := 'BaseDato';
            qConsulta.SQL.Add('update '+EsquemaAlmacen+'com_m_requisicion'+DBLink+' set COD_INTERVENCION= '''', COD_TIPO_INTERVENCION = '''', COD_ORIGEN = '''', COD_EJECUTOR= '''', VIGENCIA_intervencion= '''', FECHA_MOD = (SELECT SYSDATE FROM DUAL), USUARIO_MOD= '''+ NombreUsuario + '''  where cod_intervencion = ' + qODTHijaCODIGOODT.asstring + qODTHijaCONSECUTIVO.AsString);
            qConsulta.execsql;
            qConsulta.Free;

             //Eliminar la Intervencion...
            qConsulta := TQuery.Create(Application);
            qConsulta.DatabaseName := 'BaseDato';
            qConsulta.SQL.Add('delete from '+EsquemaAlmacen+'SAF_M_INTERVENCIONES'+DBLink+' where COD_INTERVENCION = '+ qODTHijaCODIGOODT.ASSTRING + qODTHijaCONSECUTIVO.ASSTRING);
            qConsulta.execsql;
            qConsulta.Free;

            qConsulta := TQuery.Create(Application);
            qConsulta.DatabaseName := 'BaseDato';
            qConsulta.SQL.Add('delete from ODTINTERVENCION where CODIGOINTERVENCION = '+ qODTHijaCODIGOODT.ASSTRING + qODTHijaCONSECUTIVO.ASSTRING);
            qConsulta.execsql;
            qConsulta.Free;

            IntervencionCreada:= false;
            sbCrearIntervencion.enabled:= true;
            sbeditarIntervencion.enabled:= false;
        end
        else
            exit;
            //raise Exception.Create('Intervencion Eliminada');
      end
      else
      begin
           if MessageDlg('Modificar el Codigo del Activo de la Intervencion?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
           begin
             qConsulta := TQuery.Create(Application);
             qConsulta.DatabaseName := 'BaseDato';
             qConsulta.SQL.Add('update '+EsquemaAlmacen+'saf_m_intervenciones'+DBLink+' set cod_activo = '+ IntToStr(Activo) + ', USUARIO_MOD = ''' + NombreUsuario + ''', FECHA_MOD = (SELECT SYSDATE FROM DUAL) where Cod_intervencion = '+ qODTHijaCODIGOODT.asstring + qODTHijaCONSECUTIVO.AsString);
             qConsulta.execsql;
             qConsulta.Free;
           end;
      end;
    end
    else
    begin
      qConsulta2 := TQuery.Create(Application);
      qConsulta2.DatabaseName := 'BaseDato';
      qConsulta2.SQL.Add('SELECT CODIGOACTIVO FROM ACTIVOSUBESTACION');
      qConsulta2.SQL.Add('WHERE CODIGOSUBESTACION = ''' + qodthijaCODIGOSUBESTACION.AsString + '''');
      qConsulta2.Open;
      ACTIVO := qConsulta2.Fields[0].AsiNTEGER;
      qConsulta2.Close;
      qConsulta2.Free;
      if Activo > 0 then
      //Aqui va el codigo para generar la intervencion y modificar las requisiciones existentes con los valores de dicha intervancion.
      begin
        qConsulta2 := TQuery.Create(Application);
        qConsulta2.DatabaseName := 'BaseDato';
        qConsulta2.SQL.Add('select * from odtrequisicion');
        qConsulta2.SQL.Add('where codigoodt = ' + qODTHijaCODIGOODT.asstring + ' and consecutivo = '+ qODTHijaCONSECUTIVO.AsString);
        qConsulta2.Open;
        RequisicionesCreadas:= qConsulta2.Fields[0].AsiNTEGER;
        qConsulta2.Close;
        qConsulta2.Free;
        if RequisicionesCreadas > 0 then
        begin
             Crearintervencion:= true;
        end;
      end;
    end;}
  end;
end;

procedure TFOdtUrbanaRural.dblcbSubestacionClick(Sender: TObject);
begin
if Crearintervencion= true then
   sbCrearIntervencionClick(nil);
end;

procedure TFOdtUrbanaRural.DBLookupComboBox6Click(Sender: TObject);
begin
if Crearintervencion= true then
   sbCrearIntervencionClick(nil);
end;

procedure TFOdtUrbanaRural.qODTHijaCODIGOTIPOINTERVENCIONValidate(
  Sender: TField);
{  var
  qconsulta: tquery;
  requisicionescreadas:integer;  }
begin
//Interfaz OW
{iF IntervencionCreada  = TRUE THEN
begin
  //Aqui va el codigo para modificar el tipo de intervencion en la intervencion y sus requisiciones asociados.
  if MessageDlg('Modificar el Tipo de labor sobre el Activo?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    qConsulta := TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.SQL.Add('select count(*) from '+EsquemaAlmacen+'com_m_requisicion'+DBLink);
    qConsulta.SQL.Add('where Cod_intervencion = '+ qODTHijaCODIGOODT.asstring + qODTHijaCONSECUTIVO.AsString); // + ' and estado = ''VIGENTE'''
    qConsulta.Open;
    requisicionescreadas:= qConsulta.Fields[0].AsiNTEGER;
    qConsulta.close;
    qConsulta.free;
    if requisicionescreadas >0 then
      raise Exception.Create('El Tipo de Labor no Puede Cambiar pues ya existen reservas asociadas a esta ODT.')
    else
    begin
    qConsulta := TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.SQL.Add('update '+EsquemaAlmacen+'com_m_requisicion'+DBLink+' set cod_tipo_intervencion = '''+ qTipoIntervencioncodigoessa.Asstring  + ''', USUARIO_MOD = ''' + NombreUsuario + ''', FECHA_MOD = (SELECT SYSDATE FROM DUAL) where Cod_intervencion = '+ qODTHijaCODIGOODT.asstring + qODTHijaCONSECUTIVO.AsString);

    qConsulta.execsql;
    qConsulta.Free;

    qConsulta := TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.SQL.Add('update '+EsquemaAlmacen+'saf_m_intervenciones'+DBLink+' set cod_tipo_intervencion = '''+ qTipoIntervencioncodigoessa.Asstring + ''', USUARIO_MOD = ''' + NombreUsuario + ''', FECHA_MOD = (SELECT SYSDATE FROM DUAL) where Cod_intervencion = '+ qODTHijaCODIGOODT.asstring + qODTHijaCONSECUTIVO.AsString);
    qConsulta.execsql;
    qConsulta.Free;
    end;
  end
  else
    raise Exception.Create('El Tipo de Labor no Puede Cambiar pues ya existen reservas asociadas a esta ODT.');
end; }
end;

procedure TFOdtUrbanaRural.qOdtSubactividadDatosPROGRAMADAChange(
  Sender: TField);
var query1:TQuery;
    estado:string;
    porcentajeprogramadas,porcentajerealizadas,totalactividades:double;
begin
  estado:=DBGrid1.Columns[3].Picklist.GetText;
  query1:=TQuery.Create(application);
  query1.DatabaseName:='Basedato';
  query1.SQL.Add('UPDATE ODTSUBACTIVIDADDATOS SET PROGRAMADA='+estado +'WHERE CODIGOODTSUBACTIVIDADDATOS='+ qOdtSubactividadDatosCODIGOODTSUBACTIVIDADDATOS.asstring);
  qSubactividadesOdt.close;

end;
procedure TFOdtUrbanaRural.qOdtSubactividadDatosEJECUTADAChange(
  Sender: TField);
var query1:TQuery;
 {   estado:string;
    porcentajeprogramadas,porcentajerealizadas,totalactividades:double;}
begin
//calcularporcentajes;
{  qSubactividadesOdt.Close;
  qSubactividadesOdt.ParamByName('CODIGOODT').AsInteger:=qODTHijaCODIGOODT.AsInteger;
  qSubactividadesOdt.ParamByName('CONSECUTIVO').AsInteger:=qODTHijaCONSECUTIVO.AsInteger;
  qSubactividadesOdt.Open;

//  qPorcentajeRealizadas.ParamByName('CODIGOODT').AsInteger:=qODTHijaCODIGOODT.AsInteger;
//  qPorcentajeRealizadas.ParamByName('CONSECUTIVO').AsInteger:=qODTHijaCONSECUTIVO.AsInteger;

  ShowMessage('qOdtSubactividadDatosEJECUTADA '+qOdtSubactividadDatosEJECUTADA.asstring );

  qPorcentajeRealizadas.close;
  qPorcentajeRealizadas.Open;
  ShowMessage('qPorcentajeRealizadasCOUNT '+qPorcentajeRealizadasCOUNT.asstring );

  totalactividades:=qSubactividadesOdtCOUNT.AsInteger;

  DBETotal.Text:=FloatToStr(qSubactividadesOdtCOUNT.asfloat);
  porcentajerealizadas:=((qPorcentajeRealizadasCOUNT.AsInteger*100)/totalactividades);

  ERealizadas.Text:=FloatToStr(porcentajerealizadas);
  qODTHijaACTIVIDADREALIZADAS.AsFloat:=strtofloat(ERealizadas.Text);
  EPendientes.Text:=FloatToStr(100 - (porcentajerealizadas));
 }
end;
procedure TFOdtUrbanaRural.qOdtSubactividadDatosAfterDelete(
  DataSet: TDataSet);
begin
  qOdtSubactividadDatos.ApplyUpdates;
  qOdtSubactividadDatos.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qOdtSubactividadDatosAfterPost(
  DataSet: TDataSet);
begin
  qOdtSubactividadDatos.ApplyUpdates;
  qOdtSubactividadDatos.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qdatosSubactividadAfterDelete(
  DataSet: TDataSet);
begin
  qdatosSubactividad.ApplyUpdates;
  qdatosSubactividad.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qdatosSubactividadAfterPost(DataSet: TDataSet);
begin
  qdatosSubactividad.ApplyUpdates;
  qdatosSubactividad.CommitUpdates;
end;

procedure TFOdtUrbanaRural.CalcularPorcentajes;
var query1:TQuery;
    estado:string;
    porcentajeprogramadas,porcentajerealizadas,totalactividades:double;
    si,total,pendientes:integer;
    realizadasp,pendientesp:integer;

begin
  si:=0;
  total:=0;
  pendientes:=0;
  realizadasp:=0;
  pendientesp:=0;
  qSubactividadesOdt.Close;
  qSubactividadesOdt.ParamByName('CODIGOODT').AsInteger:=qODTHijaCODIGOODT.AsInteger;
  qSubactividadesOdt.ParamByName('CONSECUTIVO').AsInteger:=qODTHijaCONSECUTIVO.AsInteger;
  qSubactividadesOdt.Open;

  while not(qOdtSubactividadDatos.eof) do
  begin
//  qOdtSubactividadDatos.Open;
    if(qOdtSubactividadDatosEJECUTADA.AsString='SI')then
    begin
      si:=si+1;
    end;
    qOdtSubactividadDatos.Next;
  end;
end;
procedure TFOdtUrbanaRural.dbgMaterialesDblClick(Sender: TObject);
begin
  fCantidadesExistentes := tfCantidadesExistentes.Create(Application);
  fCantidadesExistentes.qAlmacen.CLOSE;
  fCantidadesExistentes.qAlmacen.ParamByName('catalogo').asinteger:= qPresMateCODIGOMATERIAL.asinteger;
  fCantidadesExistentes.lnombrematerial.Caption:= qPresMateNombreMaterial.asstring;

  fCantidadesExistentes.qAlmacen.open;
  fCantidadesExistentes.qGruposTrabajo.ParamByName('CodigoMaterial').asfloat:= qPresMateCODIGOMATERIAL.asinteger;
  fCantidadesExistentes.qGruposTrabajo.ParamByName('Codigoadministrativo').asfloat:= qODTPadreCODIGOADMINISTRATIVO.asfloat;

  fCantidadesExistentes.infoSap(qPresMateCODIGOMATERIAL.AsString);

  fCantidadesExistentes.qGruposTrabajo.open;
  fCantidadesExistentes.panel1.Caption:= fCantidadesExistentes.panel1.Caption + qPresMateCODIGOMATERIAL.asstring;
  fCantidadesExistentes.ShowModal;
  fCantidadesExistentes.free;
  qPresMate.Edit;
end;

procedure TFOdtUrbanaRural.dbgMaterialesEditButtonClick(Sender: TObject);
var i:integer;
begin
try
  fBuscarMaterial := tfBuscarMaterial.Create(Application);
    if fBuscarMaterial.ShowModal = mrOk then
    begin
      if fBuscarMaterial.DBGridBuscarMaterial.SelectedRows.Count>0 then
      begin
        for i:=0 to fBuscarMaterial.DBGridBuscarMaterial.SelectedRows.Count-1 do
        begin
          fBuscarMaterial.qMaterial.BookMark:=fBuscarMaterial.DBGridBuscarMaterial.SelectedRows.Items[i];
          try
            if i > 0 then
              bInsertandoMateriales:= True;

            if (i=0) and (dbgMateriales.Fields[0].text<>'') then
              qPresMate.Edit
            else
            begin
              if qPresMate.State in [dsInsert] then
              qPresMate.Cancel;
              qPresMate.Insert;
            end;
            qPresMate.FieldbyName('CodigoMaterial').asstring := fBuscarMaterial.qMaterial.fieldbyName('CodigoMaterial').asstring;
            qPresMate.FieldbyName('cantidadsolicitada').asfloat:= 0;

            qPresMate.Post;
            qPresMate.Insert;
          except
          on E:Exception do
          begin
            qPresMate.Cancel;
          end;
        end;
      end;
      if qPresMate.State in [dsInsert] then
        qPresMate.Cancel;
      qPresMate.Active := False;
      qPresMate.Active := True;
      if (not qPresMate.IsEmpty) and (qPresMateCODIGOMATERIAL.AsFloat = 0) then
        qPresMate.Delete;
    end;
  end;
finally
  fBuscarMaterial.Free;
  bInsertandoMateriales:=False;
end;
end;

procedure TFOdtUrbanaRural.qPresMateAfterScroll(DataSet: TDataSet);
begin
if qPresMateCANTIDADRETIRADABUENA.asstring = '' then
  RETIRADABUENA:= 0
else
  RETIRADABUENA:= qPresMateCANTIDADRETIRADABUENA.asfloat;

if qPresMateCANTIDADRETIRADAMALA.asstring = '' then
  RETIRADAMALA:= 0
else
  RETIRADAMALA:= qPresMateCANTIDADRETIRADAMALA.asfloat;

if qPresMateCANTIDADCONSUMIDA.asstring = '' then
  consumidonuevo:= 0
else
  consumidonuevo:= qPresMateCANTIDADCONSUMIDA.asfloat;

if qPresMateCANTIDADCONSUMIDADESMANTELADA.asstring = '' then
  consumidodesmantelado := 0
else
  consumidodesmantelado:= qPresMateCANTIDADCONSUMIDADESMANTELADA.asfloat;

if qPresMateCANTIDADREINTEGRADABUENA.asstring = '' then
  Reintegronuevobueno:= 0
else
  Reintegronuevobueno:= qPresMateCANTIDADREINTEGRADABUENA.asfloat;

if qPresMateCANTIDADREINTEGRADAMALA.asstring = '' then
  Reintegronuevomalo := 0
else
  Reintegronuevomalo:= qPresMateCANTIDADREINTEGRADAMALA.asfloat;

if qPresMateCANTIDADREintegradabuenadesman.asstring = '' then
  Reintegrodesmanteladobueno  := 0
else
  Reintegrodesmanteladobueno:= qPresMateCANTIDADREintegradabuenadesman.asfloat;

if qPresMateCANTIDADREintegradamaladesman.asstring = '' then
  Reintegrodesmanteladomalo   := 0
else
  Reintegrodesmanteladomalo:= qPresMateCANTIDADREintegradamaladesman.asfloat;
end;

procedure TFOdtUrbanaRural.qPresMateBeforeDelete(DataSet: TDataSet);
var
  qConsulta: TQuery;
  REINTEGRADAMALA,RETIRADAMALA,REINTEGRADABUENADESMAN,REINTEGRADAMALADESMAN, CONSUMIDADESMANTELADA,RETIRADABUENA: Double;
  REINTEGRADABUENA, CANTIDADCONSUMIDA: Double;
  cantidad:Double;
begin
  if (qPresMateCANTIDADENTREGADA.AsFloat > 0) then
    raise Exception.Create('No se puede eliminar este elemento porque ya se hizo entrega del material.');

  if (qPresMateCODIGOMATERIAL.AsString <> '') then
  begin
    qConsulta:=TQuery.create(nil);
    qConsulta.DatabaseName:='BaseDato';
    qConsulta.sql.add('select count(*) from trasladomaterialdetalle');
    qConsulta.sql.add('where codigoodt= '+qPresMateCODIGOODT.AsString);
    qConsulta.sql.add('and consecutivo='+qPresMateCONSECUTIVO.AsString);
    qConsulta.sql.add('and codigomaterial='+qPresMateCODIGOMATERIAL.AsString);
    qConsulta.sql.add('and ((cantidad>0) or (cantidaddesmantelada>0))');
    qConsulta.open;
    cantidad:=qConsulta.fields[0].AsFloat;
    qConsulta.close;
    qConsulta.free;
    if cantidad>0 then
      raise Exception.Create('No se puede eliminar este elemento porque se han registrado traslados de material.');
    if not (ValidarExisteRequisicionMaterial) then
      raise Exception.Create('No se puede eliminar este elemento porque existen requisiciones de material.');
    //******************Validacion de OT - OW**********************
    if  qPresMateCANTIDADCONSUMIDA.AsFloat > 0 THEN
      raise Exception.Create('No se puede eliminar este elemento porque se esta asociado a una OT de OW.');
    //************Fin Validacion OT - OW****************************
  end;
end;


procedure TFOdtUrbanaRural.sbAgregarTrasladoClick(Sender: TObject);
var
  qconsulta, qconsulta2:TQuery;
  CodigoTraslado,i,j: integer;
  CodigoTraslado2:string;
begin
  qConsulta := TQuery.Create(nil);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.SQL.Add('SELECT SQ_CODTRASLADOGTS.NEXTVAL FROM DUAL');
  qConsulta.Open;
  CodigoTraslado := qConsulta.Fields[0].AsInteger;
  qConsulta.Close;
  qConsulta.Free;

  fTraslado := tfTraslado.Create(Application);
  ftraslado.Caption := ftraslado.Caption+' No. '+IntToStr(CodigoTraslado)+'  [Insertando]';

  fTraslado.codigotraslado:= CodigoTraslado;
  fTraslado.qTrasladomaterial.Close;
  ftraslado.qTrasladoMaterial.ParamByName('codigotraslado').AsInteger := fTraslado.codigotraslado;
  ftraslado.qTrasladoMaterial.ParamByName('codigoodt').AsFloat := qODTHijaCODIGOODT.asfloat;
  ftraslado.qTrasladoMaterial.ParamByName('consecutivo').AsInteger := qODTHijaCONSECUTIVO.AsInteger;
  fTraslado.qTrasladomaterial.Open;
  fTraslado.qTrasladomaterial.Insert;
  fTraslado.qTrasladoMaterialCODIGOADMINISTRATIVODESTINO.AsFloat:= qODTPadreCODIGOADMINISTRATIVO.AsFloat;
  fTraslado.qTrasladoMaterialCODIGOADMINISTRATIVOORIGEN.AsFloat:= qODTPadreCODIGOADMINISTRATIVO.AsFloat;
  fTraslado.qTrasladoMaterialCODIGOGRUPOTRABAJODESTINO.AsFloat:= qGrupoTrabajoCODIGOGRUPOTRABAJO.AsFloat;
  fTraslado.qTrasladoMaterialCODIGOTRASLADO.AsInteger:= fTraslado.codigotraslado;
  ftraslado.qTrasladoMaterialCODIGOODT.AsFloat := qODTHijaCODIGOODT.AsFloat;
  ftraslado.qTrasladoMaterialCONSECUTIVO.AsInteger := qODTHijaCONSECUTIVO.AsInteger;

  fTraslado.codigoodt:= qODTHijaCODIGOODT.AsFloat;
  fTraslado.consecutivo:= qODTHijaCONSECUTIVO.AsInteger;

  fTraslado.qTrasladomaterialDetalle.Close;
  fTraslado.qTrasladoMaterialDetalle.Open;
  fTraslado.qTrasladoMaterialDetalle.Insert;
  if fTraslado.ShowModal = mrOk then
  begin
    if not(fTraslado.qTrasladoMaterial.State  in[dsInsert,dsEdit]) then
      fTraslado.qTrasladoMaterial.Edit;

    fTraslado.qTrasladoMaterialFECHATRASLADO.ASDATETIME:= fTraslado.dtpFechaTraslado.DateTime;
    fTraslado.qTrasladoMaterial.Post;

    if fTraslado.qTrasladoMaterialDetalle.State in[dsInsert,dsEdit] then
      fTraslado.qTrasladoMaterialDetalle.Post;

    fTraslado.qTrasladoMaterialDetalle.First;

    qPresMate.Close;
    qPresMate.Open;
  end
  //German cc8310 20160219
  else
  begin
      //Validaciones de cierre
      if(not fTraslado.qTrasladoMaterialDetalle.IsEmpty) then
      begin
      fTraslado.qTrasladoMaterialDetalle.First;
      for i:=0 to fTraslado.qTrasladoMaterialDetalle.RecordCount-1 do
      begin
       //revertir cambios en tabla Alm_SerialMaterial
       fTraslado.qSerial.First;
       for j:=0 to fTraslado.qSerial.RecordCount-1 do
           begin
           fTraslado.qAlmSerial.Close;
           fTraslado.qAlmSerial.Open;
           fTraslado.qAlmSerial.Edit;
           fTraslado.qAlmSerialCODIGOMATERIAL.AsFloat:=fTraslado.qTrasladoMaterialDetalleCODIGOMATERIAL.AsFloat;
           fTraslado.qAlmSerialSERIAL.AsString:=fTraslado.qSerialSERIAL.AsString;
           fTraslado.qAlmSerialCODIGOADMINISTRATIVO.AsFloat:=fTraslado.qTrasladoMaterialCODIGOADMINISTRATIVOORIGEN.AsFloat;
           fTraslado.qAlmSerialCODIGOGRUPOTRABAJO.AsFloat:=fTraslado.qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsFloat;
           fTraslado.qAlmSerial.Post;
           fTraslado.qSerial.Next;
           end;
      fTraslado.qTrasladoMaterialDetalle.Next;
      end;
      end;

      //Código Traslado
      CodigoTraslado2:=fTraslado.qTrasladoMaterialCODIGOTRASLADO.AsString;

      //Eliminar cambios en COM_TRASLADOSERIAL
      if (not fTraslado.qSerial.IsEmpty) then
      begin
        qConsulta := TQuery.Create(nil);
        qConsulta.DatabaseName := 'BaseDato';
        qConsulta.SQL.Add('delete from COM_trasladoSerial where CODIGOTRASLADO = ' + CodigoTraslado2);
        qConsulta.ExecSQL;
        qConsulta.Close;
        qConsulta.Free;
      end;

      //Eliminar cambios en TRASLADOMATERIALDETALLE
      if (not fTraslado.qTrasladoMaterialDetalle.IsEmpty) then
      begin
        qConsulta := TQuery.Create(nil);
        qConsulta.DatabaseName := 'BaseDato';
        //qConsulta.SQL.Add('delete from TRASLADOMATERIALDETALLE where CODIGOTRASLADO = ' + fTraslado.qTrasladoMaterialCODIGOTRASLADO.AsString);
        qConsulta.SQL.Add('delete from TRASLADOMATERIALDETALLE where CODIGOTRASLADO = ' + CodigoTraslado2);
        qConsulta.ExecSQL;
        qConsulta.Close;
        qConsulta.Free;

        //German cc8310 20160222
        if fTraslado.qSerial.UpdatesPending then
        begin
          fTraslado.qSerial.ApplyUpdates;
          fTraslado.qSerial.CommitUpdates;
        end;

        if fTraslado.qTrasladoMaterialDetalle.UpdatesPending then
        begin
          fTraslado.qTrasladoMaterialDetalle.ApplyUpdates;
          fTraslado.qTrasladoMaterialDetalle.CommitUpdates;
        end;
      end;

      qConsulta := TQuery.Create(nil);
      qConsulta.DatabaseName := 'BaseDato';
      qConsulta.SQL.Add('delete from TRASLADOMATERIAL where CODIGOTRASLADO = '+CodigoTraslado2);
      //qConsulta.SQL.Add('delete from TRASLADOMATERIAL where CODIGOTRASLADO = '+intToStr(fTraslado.codigotrasladoCreacion));
      qConsulta.ExecSQL;
      qConsulta.Close;
      qConsulta.Free;
  end;

  fTraslado.Free;
  qTraslados.Close;
  qTraslados.Open;
  sbEditarTraslado.Enabled := qTraslados.RecordCount <> 0;
  sbEliminarTraslado.Enabled := qTraslados.RecordCount <> 0;
  if ((EditarODT = True) or (qODTHija.State in [dsInsert])) then
    sbImprimirTraslado.Enabled := qTraslados.RecordCount <> 0;
end;

procedure TFOdtUrbanaRural.sbEliminarTrasladoClick(Sender: TObject);
var
  qConsulta: TQuery;
  cod_odt, consecutivo: string;
begin
  if Application.MessageBox(PChar('Esta seguro de eliminar el Traslado No. '+qTrasladosCODIGOTRASLADO.AsString+'?'),
                                  'Confirmación',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)= mrYes then
  begin
    fTraslado := tfTraslado.Create(Application);
    cod_odt:=  qTrasladosCODIGOODT.Asstring;
    consecutivo:= qTrasladosCOnsecutivo.Asstring;

    ftraslado.qTrasladoMaterialDetalle.ParamByName('codigotraslado').AsInteger := qTrasladosCODIGOTRASLADO.AsInteger;
    ftraslado.qTrasladoMaterialDetalle.ParamByName('codigoodt').AsFloat := qTrasladosCODIGOODT.AsFloat;
    ftraslado.qTrasladoMaterialDetalle.ParamByName('consecutivo').AsInteger := qTrasladosCOnsecutivo.AsINTEGER;
    ftraslado.qTrasladoMaterialDetalle.open;

    fTraslado.qTrasladoMaterialDetalle.First;

    qConsulta := TQuery.Create(nil);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.SQL.Add('DELETE FROM TRASLADOMATERIALDETALLE WHERE CODIGOODT = '+qTrasladosCODIGOODT.AsString);
    qconsulta.SQL.Add('AND CONSECUTIVO = '+qTrasladosCONSECUTIVO.AsString);
    qConsulta.SQL.Add('AND CODIGOTRASLADO = '+ qTrasladosCODIGOTRASLADO.AsString);
    qConsulta.ExecSQL;
    qConsulta.Close;
    qConsulta.SQL.Clear;
    qConsulta.SQL.Add('DELETE FROM TRASLADOMATERIAL WHERE CODIGOODT = '+qTrasladosCODIGOODT.AsString);
    qconsulta.SQL.Add('AND CONSECUTIVO = '+qTrasladosCONSECUTIVO.AsString);
    qConsulta.SQL.Add('AND CODIGOTRASLADO = '+ qTrasladosCODIGOTRASLADO.AsString);
    qConsulta.ExecSQL;
    qConsulta.Close;
    qConsulta.Free;
    qTraslados.Close;
    qTraslados.Open;
    fTraslado.Free;
  end;
  qPresMate.Close;
  qPresMate.Open;
end;

procedure TFOdtUrbanaRural.sbEditarTrasladoClick(Sender: TObject);
begin
  fTraslado := tfTraslado.Create(Application);
  ftraslado.Caption := ftraslado.Caption+' No. '+qTrasladosCODIGOTRASLADO.AsString+'  [Editando]';
  ftraslado.DBNavigator2.VisibleButtons:= [nbPrior, nbNext, nbInsert, nbEdit, nbPost, nbCancel];
  ftraslado.qTrasladoMaterial.ParamByName('codigotraslado').asinteger := qTrasladosCODIGOTRASLADO.AsInteger;
  ftraslado.qTrasladoMaterial.ParamByName('codigoodt').asfloat := qTrasladosCODIGOODT.AsFloat;
  ftraslado.qTrasladoMaterial.ParamByName('consecutivo').asINTEGER := qTrasladosCOnsecutivo.AsINTEGER;
  ftraslado.qTrasladoMaterial.Open;

  ftraslado.qTrasladoMaterialDetalle.ParamByName('codigotraslado').asinteger := qTrasladosCODIGOTRASLADO.AsInteger;
  ftraslado.qTrasladoMaterialDetalle.ParamByName('codigoodt').asfloat := qTrasladosCODIGOODT.AsFloat;
  ftraslado.qTrasladoMaterialDetalle.ParamByName('consecutivo').asINTEGER := qTrasladosCOnsecutivo.AsINTEGER;
  ftraslado.qTrasladoMaterialDetalle.Open;

  ftraslado.qTrasladoMaterialdetalleInicial.ParamByName('codigotraslado').asinteger := qTrasladosCODIGOTRASLADO.AsInteger;
  ftraslado.qTrasladoMaterialDetalleInicial.ParamByName('codigoodt').asfloat := qTrasladosCODIGOODT.AsFloat;
  ftraslado.qTrasladoMaterialDetalleInicial.ParamByName('consecutivo').asINTEGER := qTrasladosCOnsecutivo.AsINTEGER;
  ftraslado.qTrasladoMaterialdetalleInicial.open;

  fTraslado.codigoodt:= qODTHijaCODIGOODT.AsFloat;
  fTraslado.consecutivo:= qODTHijaCONSECUTIVO.AsInteger;

  ftraslado.qTrasladoMaterialDetalle.Edit;
  fTraslado.codigotraslado:= qTrasladosCODIGOTRASLADO.AsInteger;
  if fTraslado.ShowModal = mrOk then
  begin
    fTraslado.qTrasladoMaterialDetalle.ApplyUpdates;
    fTraslado.qTrasladoMaterialDetalle.CommitUpdates;
  end;
  qPresMate.Close;
  qPresMate.Open;
  fTraslado.Free;
end;

procedure TFOdtUrbanaRural.sbImprimirTrasladoClick(Sender: TObject);
var
  codigo_traslado: integer;
begin
  //Impresion del vale de Traslado.
  if qTrasladosCODIGOTRASLADO.AsString <> '' then
  begin
    codigo_traslado:= qTrasladosCodigotraslado.AsInteger;
    minimizarodthija;
    fQRTraslado := TfQRTraslado.Create(Application);
    fQRTraslado.qTrasladodetalle.ParamByName('codigoodt').AsFloat:=qTrasladosCODIGOODT.AsFloat;
    fQRTraslado.qTrasladodetalle.ParamByName('consecutivo').AsInteger:=qTrasladosconsecutivo.AsInteger;
    fQRTraslado.qTrasladodetalle.ParamByName('codigotraslado').AsFloat:=codigo_traslado;
    fQRTraslado.qTrasladodetalle.Open;

    //Si Modo Alumbrado Público
    if  ( qODTPadreCODIGOMODOODT.AsInteger = 2 ) then
    begin
      fQRTraslado.qrimage2.visible:= True;
      fQRTraslado.qrimage1.visible:= False;
    end
    else
    begin
      fQRTraslado.qrimage2.visible:= False;
      fQRTraslado.qrimage1.visible:= True;
    end;

    fQRTraslado.qTraslados.ParamByName('codigoodt').AsFloat:=qTrasladosCODIGOODT.AsFloat;
    fQRTraslado.qTraslados.ParamByName('consecutivo').AsInteger:=qTrasladosconsecutivo.AsInteger;
    fQRTraslado.qTraslados.ParamByName('codigotraslado').AsFloat:=codigo_traslado;
    fQRTraslado.qTrasladoDestino.ParamByName('codigoodt').AsFloat:=qTrasladosCODIGOODT.AsFloat;
    fQRTraslado.qTrasladoDestino.ParamByName('consecutivo').AsInteger:=qTrasladosconsecutivo.AsInteger;
    fQRTraslado.qTrasladoDestino.ParamByName('codigotraslado').AsFloat:= codigo_traslado;
    fQRTraslado.QRNumeroTraslado.Caption:= fQRTraslado.QRNumeroTraslado.Caption +' '+ IntToStr(codigo_traslado);
    fQRTraslado.qTraslados.Open;
    fQRTraslado.qTrasladodestino.Open;
    fQRTraslado.qrTraslado.Preview;
  end;
end;

procedure TFOdtUrbanaRural.pcMaterialChange(Sender: TObject);
begin
  qPresMate.First;
  if pcMaterial.activepage= tsMaterialstock then
  Begin
    if qStockMaterial.active then qStockMaterial.close;
    qStockMaterial.Open;
  end;
end;

procedure TFOdtUrbanaRural.RxSpeedButton10Click(Sender: TObject);
Var
qConsulta:tquery;
begin
{qConsulta := TQuery.Create(Application);
qConsulta.DatabaseName := 'BaseDato';
//Interfaz OW
{
qConsulta.SQL.Add('UPDATE materialessa m SET '+
'm.VALORUNITARIO = (SELECT  DECODE (SUM (i.saldo_cantidad),0, 0,(SUM (i.saldo_valor) / SUM (i.saldo_cantidad))) AS valorunitario '+
'FROM '+EsquemaAlmacen+'inv_m_inventario_real'+DBLink+' i '+
'WHERE m.codigomaterial = i. cod_catalogo	) '+
'WHERE EXISTS '+
'(SELECT  DECODE (SUM (i.saldo_cantidad), '+
'                 0, 0, '+
'                 (SUM (i.saldo_valor) / SUM (i.saldo_cantidad)) '+
'                ) AS valorunitario '+
'    FROM '+EsquemaAlmacen+'inv_m_inventario_real'+DBLink+' i '+
'	WHERE m.codigomaterial = i. cod_catalogo	)');
qconsulta.ExecSQL;
qconsulta.sql.clear;
qConsulta.SQL.Add('INSERT INTO materialessa (CODIGOMATERIAL, NOMBREMATERIAL, CODIGOUNIDAD, VALORUNITARIO, CODIGOMATERIALESSA, TIPO) '+
'SELECT c.COD_CATALOGO AS CODIGOMATERIAL, SUBSTR(c.CATALOGO_DESCRI,0,100) AS NOMBREMATERIAL, SUBSTR(c.COD_UNIDAD_INVENTARIO,0,2) AS CODIGOUNIDAD, '+
'DECODE(SUM(nvl(i.SALDO_CANTIDAD,0)),0,0, (SUM(nvl(i.SALDO_VALOR,0))/SUM(nvl(i.SALDO_CANTIDAD,0)))) AS VALORUNITARIO, c.COD_CATALOGO AS CODIGOMATERIALESSA, c.COD_TIPO AS TIPO FROM  '+EsquemaAlmacen+'com_s_catalogo'+DBLink+' c, '+EsquemaAlmacen+'INV_M_INVENTARIO_REAL'+DBLink+' i '+
'WHERE c.cod_catalogo = i.Cod_catalogo '+
'AND C.COD_TIPO = 01 '+
'AND c.COD_CATALOGO NOT IN (SELECT CODIGOMATERIALESSA FROM materialESSA ) '+
'GROUP BY c.COD_CATALOGO, c.CATALOGO_DESCRI, c.COD_TIPO, c.COD_UNIDAD_INVENTARIO');
qconsulta.ExecSQL;
qconsulta.free;}

{qConsulta.SQL.Add('UPDATE materialessa m SET '+
'm.VALORUNITARIO = (SELECT  AS valorunitario '+
'FROM '+EsquemaAlmacen+'inv_m_inventario_real'+DBLink+' i '+
'WHERE m.codigomaterial = i. cod_catalogo	) '+
'WHERE EXISTS '+
'(SELECT  DECODE (SUM (i.saldo_cantidad), '+
'                 0, 0, '+
'                 (SUM (i.saldo_valor) / SUM (i.saldo_cantidad)) '+
'                ) AS valorunitario '+
'    FROM '+EsquemaAlmacen+'inv_m_inventario_real'+DBLink+' i '+
'	WHERE m.codigomaterial = i. cod_catalogo	)'); }

{qConsulta.SQL.Add('UPDATE materialessa m SET M.VALORUNITARIO = '+
                  '(SELECT valor_ultima_compra AS valorunitario FROM  (SELECT DISTINCT CODIGO_MATERIAL, valor_ultima_compra FROM V4101A'+dblinkOW+') i WHERE m.codigomaterialOW = i. CODIGO_MATERIAL) '+
                  'WHERE EXISTS '+
                  '(SELECT *  FROM V4101A'+dblinkOW+' i WHERE m.codigomaterialOW = i.codigo_material)');
qconsulta.ExecSQL;

qconsulta.sql.clear;
qconsulta.sql.Add ('INSERT INTO MATERIALESSA (CODIGOMATERIAL, NOMBREMATERIAL, CODIGOUNIDAD, VALORUNITARIO, CODIGOMATERIALESSA, TIPO) '+
                        ' SELECT DISTINCT c.CODIGO_MATERIAL AS CODIGOMATERIAL, SUBSTR(c.DESCRIPCION,0,100) AS NOMBREMATERIAL, SUBSTR(c.UNIDAD,0,2) AS CODIGOUNIDAD, '+
                        ' c.valor_ultima_compra AS VALORUNITARIO, c.CODIGO_MATERIAL AS CODIGOMATERIALOW, NULL AS TIPO from  V4101A'+dblinkOW+' C '+
                        ' AND C.CODIGO_MATERIAL NOT IN (SELECT NVL(CODIGOMATERIALOW,0) FROM MATERIALESSA )');
qconsulta.ExecSQL;
qconsulta.free; }

end;


procedure TFOdtUrbanaRural.qAdministrativoAfterScroll(DataSet: TDataSet);
begin
qGrupoTrabajo2.Close;
qGrupoTrabajo2.open;
end;

procedure TFOdtUrbanaRural.RxSpeedButton11Click(Sender: TObject);
var
qconsulta, qConsulta2:tquery;
cuentacatalogo: Integer;
materialmaximo: integer;
begin
if eAgregarCodigo.Text <> '' then
Begin
  //try
  //Interfaz OW
    {qConsulta := TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qconsulta.sql.Add ('select count(*) as A from  '+EsquemaAlmacen+'com_s_catalogo'+DBLink+'  '+
                      'WHERE COD_CATALOGO = '+ eAgregarCodigo.Text );
    qconsulta.open;
    cuentacatalogo:=  qconsulta.fieldbyname('A').asfloat;
    qconsulta.close;
    qconsulta.free;
    if cuentacatalogo > 0 then
    Begin
      //Codigo para agregar codigos de materiales.
      qConsulta2 := TQuery.Create(Application);
      qConsulta2.DatabaseName := 'BaseDato';
      qconsulta2.sql.Add ('INSERT INTO MATERIALESSA (CODIGOMATERIAL, NOMBREMATERIAL, CODIGOUNIDAD, VALORUNITARIO, CODIGOMATERIALESSA, TIPO) '+
                        'SELECT c.COD_CATALOGO AS CODIGOMATERIAL, SUBSTR(c.CATALOGO_DESCRI,0,100) AS NOMBREMATERIAL, SUBSTR(c.COD_UNIDAD_INVENTARIO,0,2) AS CODIGOUNIDAD, '+
                        'DECODE(SUM(nvl(i.SALDO_CANTIDAD,0)),0,0, (SUM(nvl(i.SALDO_VALOR,0))/SUM(nvl(i.SALDO_CANTIDAD,0)))) AS VALORUNITARIO, c.COD_CATALOGO AS CODIGOMATERIALESSA, c.COD_TIPO AS TIPO FROM  '+EsquemaAlmacen+'com_s_catalogo'+DBLink+' c, '+EsquemaAlmacen+'INV_M_INVENTARIO_REAL'+DBLink+' i '+
                        'WHERE c.cod_catalogo = i.Cod_catalogo '+
                        'AND C.COD_CATALOGO = '+ eAgregarCodigo.Text +
                        ' AND c.COD_CATALOGO NOT IN (SELECT CODIGOMATERIALESSA FROM MATERIALESSA ) '+
                        'GROUP BY c.COD_CATALOGO, c.CATALOGO_DESCRI, c.COD_TIPO, c.COD_UNIDAD_INVENTARIO');
      qconsulta2.ExecSQL;
      qConsulta2.free;
      showmessage('El código fue ingresado con éxito.');
      qMaterial.close;
      qMaterial.open;
    end
    else
    begin
      raise Exception.Create('Este Código no existe.')
    end;}
{    qConsulta := TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qconsulta.sql.Add ('select count(*) as Cuenta from V4101A'+dblinkOW+' '+
                      ' WHERE CODIGO_MATERIAL = '+ eAgregarCodigo.Text );
    //qconsulta.sql.savetofile('c:\insertmaterial1.txt');
    qconsulta.open;
    cuentacatalogo:=  qconsulta.fieldbyname('Cuenta').asInteger;
    qconsulta.close;
    qconsulta.free;
    if cuentacatalogo > 0 then
    Begin
      //Codigo para agregar codigos de materiales.
      qConsulta2 := TQuery.Create(Application);
      qConsulta2.DatabaseName := 'BaseDato';
      qconsulta2.sql.Add ('select max(codigomaterial) + 1 as maximo from materialessa');
      qconsulta2.open;
      materialmaximo:=  qconsulta2.FieldByName('maximo').asinteger;
      qconsulta2.Close;
      qconsulta2.sql.clear;
      qconsulta2.sql.Add ('INSERT INTO MATERIALESSA (CODIGOMATERIAL, NOMBREMATERIAL, CODIGOUNIDAD, VALORUNITARIO, CODIGOMATERIALOW, TIPO) '+
                         ' select DISTINCT  '+inttostr(materialmaximo) +' as CODIGOMATERIAL, SUBSTR(m.DESCRIPCION,0,100) AS NOMBREMATERIAL, SUBSTR(m.UNIDAD,0,2) AS CODIGOUNIDAD, '+
                         ' p.VALOR_ULTIMA_COMPRA AS VALORUNITARIO, m.CODIGO_MATERIAL AS CODIGOMATERIALOW, NULL AS TIPO '+
                         ' from V4101A'+dblinkOW+' M, V4101B'+dblinkOW+' P  '+
                         ' WHERE M.CODIGO_MATERIAL = P.CODIGO_MATERIAL(+)  '+
                         ' and m.CODIGO_MATERIAL = '+ eAgregarCodigo.Text +
                        ' AND m.CODIGO_MATERIAL NOT IN (SELECT NVL(CODIGOMATERIALOW,0) FROM MATERIALESSA )');
      //qConsulta2.sql.savetofile('c:\INSERTMATERIAL2.txt');
      qconsulta2.ExecSQL;
      qConsulta2.free;
      showmessage('El código fue ingresado con éxito.');
      qMaterial.close;
      qMaterial.open;
    end
    else
    begin
      raise Exception.Create('Este Código no existe.')
    end;
 { except
    showmessage('El código ingresado no es válido o no existe.');
  end; }
end;
end;

function TFOdtUrbanaRural.Anoactual: integer;
var i:Integer;
    s1:string;
    qconsulta2: tquery;
begin
    qConsulta2 := TQuery.Create(Application);
    qConsulta2.DatabaseName := 'BaseDato';
    qConsulta2.SQL.Add('SELECT TO_NUMBER((TO_CHAR(SYSDATE,''yyyy'')),''9999.99'') FROM dual');
    qConsulta2.Open;
    result:=  qConsulta2.Fields[0].asinteger;
    qConsulta2.Close;
    qConsulta2.Free;
end;

procedure TFOdtUrbanaRural.qEventoAPCODIGOAPOYOValidate(Sender: TField);
begin
  qValidacion.Close;
  qValidacion.SQL.Clear;
  qValidacion.SQL.Add('SELECT CodigoApoyo FROM Apoyo WHERE CodigoApoyo = '+Sender.AsString);
  qValidacion.Open;
  if qValidacion.RecordCount = 0 then
     raise Exception.Create('Este Apoyo no existe...')
end;

procedure TFOdtUrbanaRural.qEventoAPCODIGONODOBTValidate(Sender: TField);
begin
  qValidacion.Close;
  qValidacion.SQL.Clear;
  qValidacion.SQL.Add('SELECT CodigoApoyo, CodigoNodoBT FROM NodoBT');
  qValidacion.SQL.Add('WHERE CodigoApoyo = '+qEventoAP.FieldByName('CodigoApoyo').asstring+' And CodigoNodoBT = '''+Sender.Asstring+'''');
  qValidacion.Open;
  if qValidacion.RecordCount = 0 then
     raise Exception.Create('Este Nodo BT no existe...')
end;

procedure TFOdtUrbanaRural.qEventoAPCODIGOOBSERVACIONValidate(
  Sender: TField);
begin
  qValidacion.Close;
  qValidacion.SQL.Clear;
  qValidacion.SQL.Add('SELECT NombreObservacion, codigoobservacion, codigoTipoEstructura FROM observacion WHERE codigoobservacion = '+Sender.AsString);
  qValidacion.Open;
  if qValidacion.RecordCount = 0 then
     raise Exception.Create('Esta observación no existe...')
  else
  begin
    if (qValidacion.FieldByName('CodigoObservacion').AsInteger <> 0) and
       (qValidacion.FieldByName('CodigoTipoEstructura').AsString <> '02')
    then raise Exception.Create('La observación no corresponde a Alumbrado Público');
    lbObservacion.caption := qValidacion.FieldByName('NombreObservacion').AsString;
  end;
end;

procedure TFOdtUrbanaRural.dbgLamparaAPEditButtonClick(Sender: TObject);
var i:Integer;
qry:Tquery;
begin
  try
   fLamparaAPODT:=TfLamparaAPODT.Create(Application);
   fLamparaAPODT.qLamparaAP.DataSource:=dsOdtHija;
   fLamparaAPODT.qLamparaAP.Params[0].AsString:=qODTHijaCODIGOODT.AsString;
   fLamparaAPODT.qLamparaAP.Params[1].AsString:=qODTHijaCONSECUTIVO.AsString;
   fLamparaAPODT.qLamparaAP.Open;
   if fLamparaAPODT.ShowModal=mrOK then
   begin
     try
         if fLamparaAPODT.DBGrid1.SelectedRows.Count > 0 then
            for i:=0 to fLamparaAPODT.DBGrid1.SelectedRows.Count-1 do
               begin
                 fLamparaAPODT.qLamparaAP.BookMark:=fLamparaAPODT.DBGrid1.SelectedRows.Items[i];
                 if (dbgLamparaAP.Fields[0].text<>'') then
                     qEventoAP.Edit
                 else
                 begin
                   if qEventoAP.State in [dsInsert] then
                      qEventoAP.Cancel;
                   qEventoAP.Insert;
                 end;
                 qry:=Tquery.Create(nil);
                 qry.DatabaseName:='BaseDato';
                 qry.SQL.clear;
                 qry.SQL.Add('SELECT MAX(CODIGOEVENTOAP)+1 FROM AP_EVENTO');
                 qry.open;
                 qEventoAPCODIGOEVENTOAP.AsString:=qry.Fields[0].asString;//fListaReportesODT.qListaReporteCODIGOREPORTE.AsString;
                 qEventoAPCODIGOUSUARIO.AsString:=inttostr(varcodigousuario);
                 qEventoAPPINTADOAPOYO.AsString:=fLamparaAPODT.qLamparaAPPINTADOAPOYO.AsString;
                 qEventoAPCODIGOAPOYO.AsString:=fLamparaAPODT.qLamparaAPCODIGOAPOYO.AsString;
                 qEventoAPCODIGOALUMBRADOPUBLICO.AsString:=fLamparaAPODT.qLamparaAPCODIGOALUMBRADOPUBLICO.AsString;
                 qEventoAPCODIGOODT.AsString:=fLamparaAPODT.qLamparaAPCODIGOODT.AsString;
                 qEventoAPCONSECUTIVO.AsString:=fLamparaAPODT.qLamparaAPCONSECUTIVO.AsString;
                 qEventoAPCODIGOLUMINARIA.AsString:=fLamparaAPODT.qLamparaAPCODIGOACTUAL.AsString;
                 qEventoAPCODIGONODOBT.AsString:=fLamparaAPODT.qLamparaAPCODIGONODOBT.AsString;
                 qEventoAPCODIGOESTRUCTURA.AsString:=fLamparaAPODT.qLamparaAPCODIGOESTRUCTURA.AsString;
                 qEventoAPCODIGOCUENTA.AsString:=fLamparaAPODT.qLamparaAPCODIGOCUENTA.AsString;
                 qEventoAPCODIGOOBSERVACION.AsString:=fLamparaAPODT.qLamparaAPCODIGOOBSERVACION.AsString;
                 qEventoAPCODIGOUSOALUMBRADO.AsString:=fLamparaAPODT.qLamparaAPCODIGOUSOALUMBRADO.AsString;
                 qEventoAPR.AsString:=fLamparaAPODT.qLamparaAPR.AsString;
                 qEventoAPN.AsString:=fLamparaAPODT.qLamparaAPN.AsString;
                 qEventoAPS.AsString:=fLamparaAPODT.qLamparaAPS.AsString;
                 qEventoAPT.AsString:=fLamparaAPODT.qLamparaAPT.AsString;
                 GuardarDatosActuales;
                 qry.free;
                // qEventoAP.Post;
                 //qEventoAP.Insert;
              end;

       except
          On E:Exception do
          begin
            ShowMessage(E.Message);
            qReporte.Cancel;
          end;
    end;

      if (not qEventoAP.IsEmpty) and (qEventoAPCODIGOEVENTOAP.AsString = '') then
       qEventoAP.Delete;
   end;

  finally
    fLamparaAPODT.Free;
  end;
end;

procedure TFOdtUrbanaRural.dbgLamparaAPDblClick(Sender: TObject);
begin
 inherited;
   qEventoAP.Edit;
end;

procedure TFOdtUrbanaRural.qEventoAPAfterPost(DataSet: TDataSet);
var
 qry:Tquery;
begin
  if (qEventoAPCODIGOEVENTOAP.AsString<>'') then
  begin
    qEventoAP.ApplyUpdates;
    qEventoAP.CommitUpdates;

    if RegistrarMaterialesAP then InsertarDetalleMaterial(qEventoAPcodIGOEventoaP.ASfLOAT,qEventoAPCodigoEstructura.ASfLOAT);
    qry:=Tquery.Create(nil);
    qry.DatabaseName:='BaseDato';
    qry.SQL.clear;
    qry.SQL.Add('UPDATE AP_EVENTO SET FECHA=SYSDATE WHERE CODIGOEVENTOAP='+qEventoAPCODIGOEVENTOAP.AsString);
    qry.ExecSQL;
    qry.Free;
  end;
  qEventoAp.Close;
  qEventoAP.open;
end;

procedure TFOdtUrbanaRural.HabilitarControles(codigo, nodo, uso, conexiones,
  cie, observacion, cuenta: boolean);
begin
  if codigo then
  begin
    dbCodigo.Color := clWindow;
    dbCodigo.Enabled := true;
  end
  else
  begin
    dbCodigo.Color := clBtnFace;
    dbCodigo.Enabled := False;
  end;
  if nodo then
  begin
    dbapoyo1.Color := clWindow;
    dbnodo1.Color := clWindow;
    dbapoyo1.Enabled := true;
    dbnodo1.Enabled := true;
  end
  else
  begin
    dbapoyo1.Color := clBtnFace;
    dbnodo1.Color := clBtnFace;
    dbapoyo1.Enabled := False;
    dbnodo1.Enabled := False;
  end;

  if uso then
  begin
    DBLCBUsoAlumbrado.Color := clWindow;
    DBLCBUsoAlumbrado.Enabled := true;
  end
  else
  begin
    DBLCBUsoAlumbrado.Color := clBtnFace;
    DBLCBUsoAlumbrado.Enabled := False;
  end;
  if conexiones then
  begin
    DBCheckBox2.Enabled := true;
    DBCheckBox4.Enabled := true;
    DBCheckBox5.Enabled := true;
    DBCheckBox6.Enabled := true;
  end
  else
  begin
    DBCheckBox2.Enabled := False;
    DBCheckBox4.Enabled := False;
    DBCheckBox5.Enabled := False;
    DBCheckBox6.Enabled := False;
  end;
  if cie then
  begin
    dbCIE.Color := clWindow;
    dbCIE.Enabled := true;
  end
  else
  begin
    dbCIE.Color := clBtnFace;
    dbCIE.Enabled := false;
  end;
  if observacion then
  begin
    dbObservacion.Color := clWindow;
    dbObservacion.Enabled := true;
  end
  else
  begin
    dbObservacion.Color := clBtnFace;
    dbObservacion.Enabled := false;
  end;
  if  cuenta then
  begin
    dbCuenta.Color := clWindow;
    dbCuenta.Enabled := true;
  end
  else
  begin
    dbCuenta.Color := clBtnFace;
    dbCuenta.Enabled := false;
  end;
end;

procedure TFOdtUrbanaRural.qAlumbradoPublicoAfterPost(DataSet: TDataSet);
begin
  qAlumbradoPublico.ApplyUpdates;
  qAlumbradoPublico.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qAlumbradoPublicoAfterDelete(DataSet: TDataSet);
begin
  qAlumbradoPublico.ApplyUpdates;
  qAlumbradoPublico.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qEventoAPAfterDelete(DataSet: TDataSet);
begin
  qEventoAP.ApplyUpdates;
  qEventoAP.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qEventoAPCODIGOACTIVIDADChange(Sender: TField);
begin
  RegistrarMaterialesAP:=True;
  if ((qEventoAPCODIGOACTIVIDAD.AsString='0') and  (qEventoAPCODIGOtipoACTIVIDAD.AsString='0')) then
  begin
    HabilitarControles(false,false,false,false,false,false,false);
    RegistrarMaterialesAP:=False;
  end;

  if ((qEventoAPCODIGOACTIVIDAD.AsString='0') and  (qEventoAPCODIGOtipoACTIVIDAD.AsString='2')) then
    HabilitarControles(false,false,false,false,true,true,false);

  if ((qEventoAPCODIGOACTIVIDAD.AsString='1') and  (qEventoAPCODIGOtipoACTIVIDAD.AsString='2')) then
    HabilitarControles(false,false,false,false,false,true,false);

  if ((qEventoAPCODIGOACTIVIDAD.AsString='0') and  (qEventoAPCODIGOtipoACTIVIDAD.AsString='1')) then
  begin
    HabilitarControles(true,true,false,false,false,true,false);
    RegistrarMaterialesAP:=False;
  end;

  if ((qEventoAPCODIGOACTIVIDAD.AsString='2') and  (qEventoAPCODIGOtipoACTIVIDAD.AsString='2')) then
    HabilitarControles(false,false,false,false,false,true,false);

  if ((qEventoAPCODIGOACTIVIDAD.AsString='0') and  (qEventoAPCODIGOtipoACTIVIDAD.AsString='3')) then
    HabilitarControles(true,false,true,true,true,true,true);;

  if ((qEventoAPCODIGOACTIVIDAD.AsString='1') and  (qEventoAPCODIGOtipoACTIVIDAD.AsString='1')) then
  begin
    HabilitarControles(true,true,true,true,true,true,true);
    dbcuenta.Text:='487979';
    dbcie.Text:='12000';
    dbobservacion.Text:='0';
    qEventoAp.FieldbyName('R').asstring:='N';
    qEventoAp.FieldbyName('S').asstring:='N';
    qEventoAp.FieldbyName('T').asstring:='N';
    qEventoAp.FieldbyName('N').asstring:='N';
  end;

end;

procedure TFOdtUrbanaRural.qEventoAPCODIGOTIPOACTIVIDADChange(
  Sender: TField);
begin
  RegistrarMaterialesAP:=True;
  if ((qEventoAPCODIGOACTIVIDAD.AsString='0') and  (qEventoAPCODIGOtipoACTIVIDAD.AsString='0')) then
  begin
    HabilitarControles(false,false,false,false,false,false,false);
    RegistrarMaterialesAP:=False;
  end;

  if ((qEventoAPCODIGOACTIVIDAD.AsString='0') and  (qEventoAPCODIGOtipoACTIVIDAD.AsString='2')) then
    HabilitarControles(false,false,false,false,true,true,false);

  if ((qEventoAPCODIGOACTIVIDAD.AsString='1') and  (qEventoAPCODIGOtipoACTIVIDAD.AsString='2')) then
    HabilitarControles(false,false,false,false,false,true,false);

  if ((qEventoAPCODIGOACTIVIDAD.AsString='0') and  (qEventoAPCODIGOtipoACTIVIDAD.AsString='1')) then
  begin
    HabilitarControles(true,true,false,false,false,true,false);
    RegistrarMaterialesAP:=False;
  end;

  if ((qEventoAPCODIGOACTIVIDAD.AsString='2') and  (qEventoAPCODIGOtipoACTIVIDAD.AsString='2')) then
    HabilitarControles(false,false,false,false,false,true,false);

  if ((qEventoAPCODIGOACTIVIDAD.AsString='0') and  (qEventoAPCODIGOtipoACTIVIDAD.AsString='3')) then
    HabilitarControles(true,false,true,true,true,true,true);

  if ((qEventoAPCODIGOACTIVIDAD.AsString='1') and  (qEventoAPCODIGOtipoACTIVIDAD.AsString='1')) then
  begin
    HabilitarControles(true,true,true,true,true,true,true);
    dbcuenta.Text:='487979';
    dbcie.Text:='12000';
    dbobservacion.Text:='0';
    qEventoAp.FieldbyName('R').asstring:='N';
    qEventoAp.FieldbyName('S').asstring:='N';
    qEventoAp.FieldbyName('T').asstring:='N';
    qEventoAp.FieldbyName('N').asstring:='N';
  end;

end;

procedure TFOdtUrbanaRural.qEventoAPCODIGOESTRUCTURAValidate(
  Sender: TField);
begin
  if (Sender.AsString<>'') then
  begin
    qValidacion.Close;
    qValidacion.SQL.Clear;
    qValidacion.SQL.Add('SELECT DISTINCT E.CODIGOESTRUCTURA, E.NOMBREESTRUCTURA, T.NOMBRETIPOFUENTE,');
    qValidacion.SQL.Add('T1.NOMBRETIPOLUMINARIA, L.POTENCIA, L.NOMBRELAMPARATIPICA, E.CODIGOTIPOESTRUCTURA,');
    qValidacion.SQL.Add('T.CODIGOTIPOFUENTE, T1.CODIGOTIPOLUMINARIA, L.CODIGOLAMPARATIPICA');
    qValidacion.SQL.Add('FROM ESTRUCTURA E, TIPOFUENTE T,');
    qValidacion.SQL.Add(' TIPOLUMINARIA T1, LAMPARATIPICA L');
    qValidacion.SQL.Add('WHERE (E.CODIGOESTRUCTURA = '+Sender.AsString+')');
    qValidacion.SQL.Add(' AND (T.CODIGOTIPOFUENTE = E.CODIGOTIPOFUENTE)');
    qValidacion.SQL.Add(' AND (T1.CODIGOTIPOLUMINARIA = E.CODIGOTIPOLUMINARIA)');
    qValidacion.SQL.Add(' AND (L.CODIGOLAMPARATIPICA = E.CODIGOLAMPARATIPICA)');
    qValidacion.Open;
    if qValidacion.RecordCount = 0 then
       raise Exception.Create('Esta estructura no existe...')
    else
    begin
      if (qValidacion.FieldByName('CodigoEstructura').asinteger <> 0) and
         (qValidacion.FieldByName('CodigoTipoEstructura').asstring <> '02')
      then raise Exception.Create('La estructura no corresponde a una Lámpara de AP');

      qEventoAP.FieldByName('CodigoTipoFuente').asstring := qValidacion.FieldByName('CodigoTipoFuente').AsString;
      qEventoAP.FieldByName('CodigoTipoLuminaria').asstring := qValidacion.FieldByName('CodigoTipoLuminaria').AsString;
      qEventoAP.FieldByName('CodigoLamparaTipica').asstring := qValidacion.FieldByName('CodigoLamparaTipica').AsString;
      lbEstructura.caption := qValidacion.FieldByName('NombreEstructura').AsString;
      lbTipoFuente.caption := qValidacion.FieldByName('CodigoTipoFuente').AsString+'-'+qValidacion.FieldByName('NombreTipoFuente').AsString;
      lbTipoLuminaria.caption := qValidacion.FieldByName('CodigoTipoLuminaria').AsString+'-'+qValidacion.FieldByName('NombreTipoLuminaria').AsString;
      lbLamparaTipica.caption := qValidacion.FieldByName('CodigoLamparaTipica').AsString+'-'+qValidacion.FieldByName('NombreLamparaTipica').AsString;
    end;
  end;
end;

function TFOdtUrbanaRural.InsertarDetalleMaterial(codEvento,
  CodigoEstructura: double): boolean;
var qConsulta,qInserta:tquery;
  codigoactividad,codigoTipoActividad:string;
  CodMaterial:double;
  Cantidad:integer;
begin
  qConsulta := TQuery.Create(Application);
  qConsulta.DataBaseName := 'BaseDato';


  qInserta := TQuery.Create(Application);
  qInserta.DataBaseName := 'BaseDato';


  with qConsulta.sql do
  begin
    Add('SELECT  M.CODIGOMATERIAL,DE.CANTIDAD ');
    Add('FROM ESTRUCTURA E, DETALLEESTRUCTURA DE, MATERIAL M ');
    Add('WHERE E.CODIGOESTRUCTURA = DE.CODIGOESTRUCTURA ');
    Add('AND DE.CODIGOMATERIAL = M.CODIGOMATERIAL ');
    Add('AND E.CODIGOESTRUCTURA = '+ FloatToStr(CodigoEstructura));
    Add('AND DE.CANTIDAD >0');
  end;
  qConsulta.open;

  qConsulta.First;
  cantidad:=0;
  while (not qConsulta.Eof) do
  begin
    CodMaterial := qConsulta.Fieldbyname('CODIGOMATERIAL').AsFloat;
    cantidad:=0;
    while not(cantidad=qConsulta.Fieldbyname('CANTIDAD').asinteger) do
    begin
      inc(cantidad);
      qInserta.Close;
      qInserta.SQL.Clear;
      qInserta.SQL.add('INSERT INTO AP_DETALLEMATERIAL (CODIGOEVENTOAP,CODIGOMATERIAL,CODIGOESTADOMATERIALAP) ');
      qInserta.SQL.add('VALUES ('+FloatToStr(CodEvento)+','+FloatToStr(CodMaterial)+',1)');
      Try
        qInserta.ExecSQL;
      except
        on e:exception do
        begin
          showmessage(e.Message);
        end;
      end;
    end;
    qConsulta.next;
  end;

  qConsulta.Free;
  qInserta.Free;
end;

procedure TFOdtUrbanaRural.qEventoAPBeforePost(DataSet: TDataSet);
var
 qry:Tquery;
begin
  try
    qAlumbradoPublico.close;
    qAlumbradoPublico.open;
    if not (qAlumbradoPublico.State in [dsEdit,dsInsert]) then
      qAlumbradoPublico.edit;

    if ((qEventoApCODIGOACTIVIDAD.AsString='0') and (qEventoApCODIGOTIPOACTIVIDAD.AsString='0')) then
    begin
      qEventoApCODIGOAPOYO.AsString:='0';
      qEventoApCODIGONODOBT.AsString:='a';
    end;
    qAlumbradoPublicoCODIGOAPOYO.AsString:=qEventoApCODIGOAPOYO.AsString;
    qAlumbradoPublicoCODIGONODOBT.AsString:=qEventoApCODIGONODOBT.AsString;
    qAlumbradoPublicoCODIGOUSOALUMBRADO.AsString:=qEventoApCODIGOUSOALUMBRADO.AsString;
    qAlumbradoPublicoR.AsString:=qEventoApR.AsString;
    qAlumbradoPublicoS.AsString:=qEventoApS.AsString;
    qAlumbradoPublicoT.AsString:=qEventoApT.AsString;
    qAlumbradoPublicoN.AsString:=qEventoApN.AsString;
    qAlumbradoPublicoCODIGOESTRUCTURA.AsString:=qEventoApCODIGOESTRUCTURA.AsString;
    qAlumbradoPublicoCODIGOOBSERVACION.AsString:=qEventoApCODIGOOBSERVACION.AsString;
    qAlumbradoPublicoCODIGO_CUENTA.AsString:=qEventoApCODIGOCUENTA.AsString;
    qAlumbradoPublico.Post;

  with DatoAnterior do
  begin
    qEventoAPCodigoLuminariaAnterior.Asstring:=CodigoLuminaria;
    qEventoAPCodigoEstructuraAnterior.Asstring:=floattostr(CodigoEstructura);
    qEventoAPCodigoApoyoAnterior.Asstring:=floattostr(CodigoApoyo);
    qEventoAPCodigoNodoBTAnterior.Asstring:=CodigoNodoBt;
    qEventoAPCodigoCuentaAnterior.Asstring:=FloatTostr(CodigoCuenta);
  end;

  //si es reubicacion o retiro agregar el apoyo  odtapoyo
  if ((qEventoApCODIGOACTIVIDAD.AsString='0') and (qEventoApCODIGOTIPOACTIVIDAD.AsString='1'))
   or ((qEventoApCODIGOACTIVIDAD.AsString='0') and (qEventoApCODIGOTIPOACTIVIDAD.AsString='0'))then
    begin
      qry:=Tquery.Create(nil);
      qry.DatabaseName:='BaseDato';
      qry.SQL.Clear;
      qry.SQL.add('INSERT INTO ODTAPOYO (CODIGOODT,CONSECUTIVO,PINTADOAPOYO) VALUES');
      qry.SQL.add('('+qEventoAPCODIGOODT.ASsTRING+','+qEventoAPCONSECUTIVO.ASsTRING+',');
      qry.SQL.add('(select pintadoapoyo from apoyo where codigoapoyo='+qEventoAPCODIGOAPOYO.ASsTRING+'))');
      qry.ExecSQL;
      qry.Free;
      qodtApoyo.close;
      qodtApoyo.Open;
    end;
  except
  end;
end;
procedure TFOdtUrbanaRural.GuardarDatosActuales;
begin
  with DatoAnterior do
  begin
    if qEventoAPCODIGOALUMBRADOPUBLICO.Asstring<>'' then
      CodigoAlumbradoPublico:=qEventoAPCODIGOALUMBRADOPUBLICO.AsString
    else
      CodigoAlumbradoPublico:='';
    CodigoLuminaria:=qEventoAPCODIGOACTUAL.AsString;
    CodigoEstructura:=qEventoAPCODIGOESTRUCTURA.Asfloat;
    CodigoApoyo:=qEventoAPCODIGOAPOYO.Asfloat;
    CodigoNodoBT:=qEventoAPCODIGONODOBT.Asstring;
    CodigoCuenta:=qEventoAPCODIGOCUENTA.AsFloat;
  end;
end;

procedure TFOdtUrbanaRural.dMenuEstructuraSelectCIE(Sender: tnMenuItem;
  CIE: Integer; MenuEstructura: tMenuEs);
begin
  if qEventoAP.State in [dsInsert, dsEdit] then qEventoAP.FieldByName('CodigoEstructura').asInteger := CIE
  else ShowMessage('La tabla no está en modo de Edición');
end;

procedure TFOdtUrbanaRural.dMenuObservacionSelectCIE(Sender: tnMenuItem;
  CIE: Integer; MenuEstructura: tMenuEs);
begin
 if qEventoAP.State in [dsInsert, dsEdit] then qEventoAP.FieldByName('CodigoObservacion').asInteger := CIE
  else ShowMessage('La tabla no está en modo de Edición');
end;
{
Mirar para ver si se crear la Luminaria
NodoBTEnOperacion(IntToStr(Nodo.NodoIni.TagApoyo), Nodo.NodoIni.Codigo, true);
SetVariables(tAlumbradoPublico);
SetVariablesEdicion(tAlumbradoPublico);
}
procedure TFOdtUrbanaRural.sbVistaLateralOdtClick(Sender: TObject);
var Lista : TStringList;
qry:Tquery;
x:integer;
begin
  Lista := TStringList.Create;
  qry:=Tquery.Create(nil);
  qry.DatabaseName:='BaseDato';
  qry.SQL.Clear;
  qry.SQL.Add('SELECT A.CODIGOAPOYO,A.X,A.Y FROM APOYO A, ODTAPOYO OA ');
  qry.SQL.Add('WHERE OA.PINTADOAPOYO=A.PINTADOAPOYO AND OA.PINTADOAPOYO<>00');
  qry.SQL.Add('AND OA.CODIGOODT=:CODIGOODT AND OA.CONSECUTIVO=:CONSECUTIVO');
  qry.DataSource:=dsOdtHija;
  qry.Open;
  if qry.RecordCount>0 then
  begin
    qry.First;
    x:=0;
    while not qry.Eof do
    begin
      Lista.Add(qry.Fields[0].asString+','+inttostr(x)+',0');
      x:=x+20;
      qry.Next;
    end;
    MinimizarOdtHija;
    MostrarVistaLateralApoyosOdt(Lista,qODTHijaCODIGOODT.asfloat,qODTHijaCONSECUTIVO.asfloat);
//    MostrarVistaLateralApoyos(Lista);
    Lista.Free;
  end
  else
    ShowMessage('No hay apoyos Asociados a la ODT');
end;

procedure TFOdtUrbanaRural.sbBuscarApoyoCartografiaClick(Sender: TObject);
begin
  MinimizarOdtHija;
  MostrarMapa;
  SetElementoOdt('A2');
end;

procedure TFOdtUrbanaRural.CalcularCostos;
var mensaje:string;
begin
  if (qODTHija.State in [dsedit,dsInsert])and (qODTHija.UpdateObject<>nil) then
  try
    //qODTHija.Post;
    CostoMaterialHija(qODTHijaCODIGOODT.Asfloat,qODTHijaCONSECUTIVO.AsInteger);
    if (qODTPadreCODIGOODTTIPOMANOOBRA.asfloat = 1) then
    begin
      if (qODTHijaFECHAFINALTRABAJO.AsString<>'') and  (qODTHijaFECHAINICIOTRABAJO.asstring<>'')then
      begin
        CostoEquipoHija(qODTHijaCODIGOODT.Asfloat,qODTHijaCONSECUTIVO.AsInteger);

  //      CostoManoObraHija(qODTHijaCODIGOODT.Asfloat,qODTHijaCONSECUTIVO.AsInteger,mensaje);


        CostoManoObraHijaIntegrado(qODTHijaCODIGOODT.Asfloat,qODTHijaCONSECUTIVO.AsInteger,
        qODTHijaFECHAINICIOTRABAJO.AsDateTime,qODTHijaFECHAFINALTRABAJO.AsDateTime);

        CostoTransporteHija(qODTHijaCODIGOODT.Asfloat,qODTHijaCONSECUTIVO.AsInteger);
      end;
    end;
    qPresMano.close;
    qPresMano.open;
    //qODTHija.Edit;
    CostosActividadOdtHija(qODTHijaCODIGOODT.Asfloat,qODTHijaCONSECUTIVO.AsInteger,mensaje);
  except
  end;
end;


procedure TFOdtUrbanaRural.sbVerCartografiaClick(Sender: TObject);
var Lista : TStringList;
  qry:Tquery;
  s:string;
begin
  if not(qODTApoyo.IsEmpty) then
  begin
    MinimizarOdtHija;
    qODTApoyo.First;
    s:='';
    if qODTApoyo.RecordCount<>1 then
    begin
      while not(qODTApoyo.Eof) do
      begin
        if (qODTApoyoPINTADOAPOYO.AsString<>'')then
          s:=s+','+qODTApoyoPINTADOAPOYO.AsString;
        qODTApoyo.Next;
      end;
      if (s<>'') then
      begin
        s:='('+copy(s,2,length(s)-1)+')';

        Lista := TStringList.Create;
        qry:=Tquery.Create(nil);
        qry.DatabaseName:='BaseDato';
        qry.SQL.Clear;
        qry.SQL.Add('SELECT A.CODIGOAPOYO FROM APOYO A');
        qry.SQL.Add('WHERE PINTADOAPOYO in'+s);
        qry.DataSource:=dsOdtHija;
        qry.Open;
        if qry.RecordCount>0 then
        begin
          qry.First;
          while not qry.Eof do
          begin
            Lista.Add(qry.Fields[0].asString);
            qry.Next;
          end;
          MostrarMapa;
          MarcarApoyos(Lista);
          Lista.Free;
        end;
      end;
    end
    else
    begin
      if not(Buscarapoyo(qODTApoyoCodigoApoyo.AsString,true)) then
        showmessage('No se encontró el apoyo.');
    end;
  end
  else
    ShowMessage('No hay apoyos Asociados a la ODT');
end;

procedure TFOdtUrbanaRural.qODTApoyoCalcFields(DataSet: TDataSet);
var qcodigo:tquery;
begin
  qcodigo:=TQuery.Create(self);
  qcodigo.DatabaseName:='BaseDato';
  qcodigo.sql.add('SELECT CODIGOAPOYO FROM APOYO WHERE PINTADOAPOYO='''+qODTApoyoPintadoApoyo.asstring+'''');
  qcodigo.open;
  qODTApoyoCodigoApoyo.AsInteger:=qcodigo.fields[0].AsInteger;
  qcodigo.close;
  qcodigo.sql.clear;
  qcodigo.sql.Add('select e.referencia,e.codigoestructura from estructura e,apoyo a');
  qcodigo.sql.Add('where e.codigoestructura=a.codigoestructura');
  qcodigo.sql.Add('and a.codigoapoyo='+qODTApoyoCodigoApoyo.asstring);
  qcodigo.open;
  qODTApoyoReferencia.AsString:=qcodigo.fieldbyname('referencia').AsString;
  qODTApoyoCodigoEstructura.AsString:=qcodigo.fieldbyname('codigoestructura').AsString;
  qcodigo.free;
end;

procedure TFOdtUrbanaRural.FormatoActualAP;
function VehiculosAsociados:string;
var qTemp:TQuery;
    ListaTemp:TStringList;
    I,J:Integer;
begin
  qTemp:=TQuery.Create(Application);
  ListaTemp:=TStringList.Create;
  try
    qTemp.DatabaseName:='BaseDato';
    ListaTemp.Duplicates:=dupIgnore;
    ListaTemp.Sorted:=True;

    qTemp.SQL.Text:='SELECT DISTINCT CODIGOVEHICULO FROM ODTVEHICULO WHERE CODIGOODT='+qODTHijaCODIGOODT.AsString;
    qTemp.Open;
    while not qTemp.Eof do
    begin
     ListaTemp.Add(qTemp.Fields[0].AsString);
     qTemp.Next;
    end;
    Result:='';
    J:=ListaTemp.Count - 1;
    for I:=0 to J do
     if I <> J then
        Result:= Result + ListaTemp[I] + ','
     else
        Result:= Result + ListaTemp[I];

    qTemp.Free;
    ListaTemp.Free;
  except
    qTemp.Free;
    ListaTemp.Free;
    Result:='';
  end;

end;
//Fin Funcion

function GrupoTrabajo:string;
var  qTemp:TQuery;
begin
  qTemp := TQuery.Create(Application);
  try
    Result:='';
    qTemp.DatabaseName := 'BaseDato';
    qTemp.SQL.Add('SELECT DISTINCT G.NOMBREGRUPOTRABAJO FROM ODTDIA D, GRUPOTRABAJO G');
    qTemp.SQL.Add('WHERE G.CODIGOGRUPOTRABAJO = D.CODIGOGRUPOTRABAJO');
    qTemp.SQL.Add('AND   D.CODIGOODT = ' + qODTHijaCODIGOODT.AsString);
    qTemp.SQL.Add('AND   G.CODIGOADMINISTRATIVO = ' + qODTPadreCODIGOADMINISTRATIVO.AsString);
    qTemp.Open;
    while not qTemp.Eof do
    begin
      Result:=Result + qTemp.Fields[0].AsString;
      qTemp.Next;
      if not qTemp.Eof then
        Result:=Result + ',';
    end;
  finally
    qTemp.Free;
  end;
end;
//Fin funcion

procedure AjustarQRLabel(var qrLabel:TQRLabel);
begin
  qrLabel.AutoSize := False;
  qrLabel.WordWrap := False;
  qrLabel.Height := 12;
  qrLabel.Font.Size := 7;
  qrLabel.Font.Name := 'Arial';
  qrLabel.Alignment:= taLeftJustify;
  qrLabel.SendToBack;
  qrLabel.Caption:='';
  qrLabel.OnPrint:=fQRODTHijaAP.QRLabelPrint;
end;

var qDatos:TQuery;
    qrLabel:TQRLabel;
    I:Integer;
    Inicio,alto:integer;
begin
  try
    fQRODTHijaAP:= TfQRODTHijaAP.Create(Application);
    fQRODTHijaAP.qODTPadre.Close;
    fQRODTHijaAP.qODTPadre.Params[0].AsString:=self.qODTHijaCODIGOODT.AsString;
    fQRODTHijaAP.qODTPadre.Open;

    fQRODTHijaAP.qODTHija.Close;
    fQRODTHijaAP.qODTHija.Params[0].AsString:=qODTHijaCODIGOODT.AsString;
    fQRODTHijaAP.qODTHija.Params[1].AsString:=qODTHijaCONSECUTIVO.AsString;
    fQRODTHijaAP.qODTHija.Open;

    with fQRODTHijaAP do
    begin

      //EQUIPO ENERGIZADO
      qrlEnergizado.Caption    :='';
      qrlDesenergizado.Caption :='';
      if qODTPadreEQUIPOENERGIZADO.AsString = 'S' then
        qrlEnergizado.Caption :='Ö';
      if qODTPadreEQUIPOENERGIZADO.AsString = 'N' then
        qrlDesenergizado.Caption :='Ö';

      //VEHICULOS
      qrlVehiculos.Caption := '';
      qrlVehiculos.Caption:=VehiculosAsociados();

      //GRUPO DE TRABAJO
      qrlGrupoTrabajo.Caption   :='';
      qrlGrupoTrabajo.Caption := GrupoTrabajo();
      //PRIORIDAD DEL TRABAJO
      qrlNormal.Caption:='';
      qrlUrgente.Caption:='';
      qrlEmergencia.Caption:='';
      if qODTPadreCODIGOPRIORIDAD.AsString<>'' then
      begin
        case qODTPadreCODIGOPRIORIDAD.AsInteger of
          1:qrlNormal.Caption     :='Ö';
          2:qrlUrgente.Caption    :='Ö';
          3:qrlEmergencia.Caption :='Ö';
        end;
      end;
      qrlImpresoOdt.Caption:=GenerarImpreso;
      //LABOR Y TAREA
      qrlLabor.Caption:=dbeNombreLabor.Text;
      qrlTarea.Caption:=dbeTipoTarea.Text;
      qrlZona.Caption:= qZonaNOMBREZONA.AsString;
      qrlMunicipio.Caption:= qMunicipioNOMBREMUNICIPIO.AsString;

      //ASIGNACION
      qrlAdministrativo.Caption :=qCIA.fieldbyname('NOMBRECATEGORIA').AsString;
      qrlTipoManoObra.Caption   :=dbeNombreTipoManoObra.Text;
      qrlAprobado.Caption       :=qODTPadreNombreAprobado.AsString;
      qrlRevisado.Caption       :=qODTPadreNombreRevisado.AsString;
      qrlEjecutado.Caption      :=qODTPadreNombreEjecutado.AsString;

      qrlAprobado2.Caption       :=qODTPadreNombreAprobado.AsString;
      qrlEjecutado2.Caption      :=qODTPadreNombreEjecutado.AsString;
      //CEDULAS
      qDatos := TQuery.Create(Application);
      qDatos.DatabaseName := 'BaseDato';
      with qDatos.SQL do
      begin
        Add('select p.codigoempleado, e.nombreempleado');
        Add('from odtpresmano p, empleado e');
        Add('where e.codigoempleado = p.codigoempleado');
        Add('and codigoodt = ' + qODTHijaCODIGOODT.AsString);
        Add('and consecutivo = ' + qODTHijaCONSECUTIVO.AsString);
        Add('group by p.codigoempleado, e.nombreempleado');
        Add('Order by e.nombreempleado');
      end;
      qDatos.Open;
      I:=0;
      while not qDatos.Eof do
      begin

        Inicio:=564;
        alto:=20;
        //Cedula
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := Inicio + I*alto;
        qrLabel.Left := 4;
        qrLabel.Width := 70;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatos.FieldByName('CodigoEmpleado').AsString;
        //Nombres
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := Inicio + I*alto;
        qrLabel.Left := 84;
        qrLabel.Width := 185;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatos.FieldByName('NombreEmpleado') .AsString;
        Inc(I);
        if I > 9 then Break;
        qDatos.Next;
      end;
      qDatos.Free;
      QRShape80.SendToBack;
      qPresMate.Close;
      qPresMate.Open;
      qPresMano.Close;
      qPresMano.Open;
    end;
    try
      fQRODTHijaAP.QuickRep1.Preview;
    except
      on  e:exception do
      begin
        showmessage(e.Message);
        fQRODTHIjaAP.Free;
      end;
    end;
  finally
    Application.ProcessMessages;
  end;
end;

procedure TFOdtUrbanaRural.FormatoAP1Click(Sender: TObject);
begin
  FormatoActualAP;
end;

procedure TFOdtUrbanaRural.TrabajosAPRealizados1Click(Sender: TObject);
begin
  try
    fQRODTTrabajosAP:= tfQRODTTrabajosAP.Create(Application);
    fQRODTTrabajosAP.Caption:=GenerarImpreso;
  try
    fQRODTTrabajosAP.QuickRep1.Preview;
  except
    fQRODTTrabajosAP.Free;
  end;
  finally
    Application.ProcessMessages;
  end;
end;

procedure TFOdtUrbanaRural.PartePosteriorFormatoAnterior1Click(
  Sender: TObject);
begin
  fQRODTPadreAtras:=TfQRODTPadreAtras.Create(Application);
  try
    fQRODTPadreAtras.QuickRep1.Preview;
  except
    fQRODTPadreAtras.Free;
  end;
end;

procedure TFOdtUrbanaRural.qOdtTrafodisAfterDelete(DataSet: TDataSet);
begin
  qOdtTrafodis.ApplyUpdates;
  qOdtTrafodis.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qOdtTrafodisAfterPost(DataSet: TDataSet);
begin
  qOdtTrafodis.ApplyUpdates;
  qOdtTrafodis.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qOdtTrafodisAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('CODIGOODT').AsFloat  := qODTHijaCODIGOODT.AsFloat;
    FieldByName('CONSECUTIVO').AsFloat:= qODTHijaCONSECUTIVO.AsFloat;
  end;
end;

procedure TFOdtUrbanaRural.qOdtTrafodisCalcFields(DataSet: TDataSet);
var qcodigo, query:tquery;
CuentaF3,CuentaF4: Integer;
begin
  qcodigo:=TQuery.Create(self);
  qcodigo.DatabaseName:='BaseDato';
  qcodigo.sql.add('SELECT CODIGOTRAFODIS FROM TRAFODIS WHERE PINTADOTRAFODIS='''+qOdtTrafodisPINTADOTRAFODIS.asstring+'''');
  qcodigo.open;
  qOdtTrafodisCodigoTrafodis.Asfloat:=qcodigo.fields[0].Asfloat;
  qcodigo.sql.clear;
  qcodigo.sql.Add('select e.referencia,e.codigoestructura from estructura e,trafodis t');
  qcodigo.sql.Add('where e.codigoestructura=t.codigoestructura');
  qcodigo.sql.Add('and t.codigotrafodis='+qOdtTrafodisCodigoTrafodis.asstring);
  qcodigo.open;
  qOdtTrafodisreferencia.AsString:=qcodigo.fieldbyname('referencia').AsString;
  qOdtTrafodisCodigoEstructura.AsString:=qcodigo.fieldbyname('codigoestructura').AsString;
  qcodigo.free;



  query := TQuery.create(self);
  query.databasename:='BaseDato';

  query.sql.add('SELECT COUNT(*) AS CUENTA FROM RT_REINTEGROTRAFO WHERE CODIGOODT = '+qodthijacodigoodt.asstring + 'AND CONSECUTIVO = '+qodthijaconsecutivo.asstring +
                        ' and CODIGOTRAFODIS = '+qOdtTrafodisCodigoTrafodis.AsString);
  query.OPEN;
  CuentaF3:= query.fieldbyname('Cuenta').asinteger;
  query.close;
  if  CuentaF3 >0 then
    qOdtTrafodisf3.asstring:= 'Si'
  else
    qOdtTrafodisf3.asstring:= 'No';

  query.sql.Clear;
  query.sql.add('SELECT COUNT(*) AS CUENTA FROM RT_INSTALACIONTRAFO WHERE CODIGOODT = '+qodthijacodigoodt.asstring + 'AND CONSECUTIVO = '+qodthijaconsecutivo.asstring +
                        ' and CODIGOTRAFODIS = '+qOdtTrafodisCodigoTrafodis.AsString);
  query.OPEN;
  CuentaF4:= query.fieldbyname('Cuenta').asinteger;
  query.close;
  query.free;
  if  CuentaF4 >0 then
    qOdtTrafodisf4.asstring:= 'Si'
  else
    qOdtTrafodisf4.asstring:= 'No';


end;

procedure TFOdtUrbanaRural.qOdtTrafodisUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
case UpdateKind of
    ukInsert:
    begin
      qPresMate.Cancel;
      if(Application.MessageBox(pchar('Datos Incompletos o Erróneos al Insertar un Transformador.'+Chr(13)+
             'Desea Eliminar Registro Erróneo?.'),PChar('Advertencia'),MB_ICONINFORMATION+MB_OK)=IdYes)then

  //    if MessageDlg('Datos Incompletos o Erróneos al Insertar un Transformador.'+Chr(13)+
  //             'Desea Eliminar Registro Erróneo?.'
//      ,mtWarning,[mbYes, mbNo],0) = mrYes then
      begin
      UpdateAction:=uaAbort;
      end;
    end;
    ukModify:
    begin
      if(Application.MessageBox(pchar('Error al editar un transformador, posiblemente duplicado o datos erróneos.'),PChar('Advertencia'),MB_ICONINFORMATION+MB_OK)=IdYes)then

//      MessageDlg('Error al editar un transformador, posiblemente duplicado o datos erróneos.',
//      mtWarning,[mbOk],0);
      UpdateAction:=uaAbort;
    end;
  end;
end;

procedure TFOdtUrbanaRural.qODTTrafodisPINTADOTRAFODISValidate(Sender: TField);
var qDatos:TQuery;
begin
  if Sender.Text <> '' then
  begin
    qDatos:=TQuery.Create(Application);
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Text:='SELECT CODIGOTRAFODIS FROM TRAFODIS WHERE PINTADOTRAFODIS='''+Sender.Text+'''';
    qDatos.Open;
    if qDatos.Fields[0].AsString = '' then
    begin
      qDatos.Free;
      raise Exception.Create('Este pintado de transformador no existe. Por favor verífiquelo.');
    end;
    qDatos.Close;
    qDatos.Free;
  end;
end;

procedure TFOdtUrbanaRural.qODTHijaCODIGOCONTRATISTAINTERVENIDOChange(
  Sender: TField);
begin
  qContratoIntervenido.Close;
  qContratoIntervenido.ParamByName('CEDULACONTRATISTA').AsString:=qContratistaIntervenidoCEDULACONTRATISTA.AsString;
  qContratoIntervenido.Open;
end;

procedure TFOdtUrbanaRural.qPresMateAfterEdit(DataSet: TDataSet);
begin
MaterialModificado:= true;
end;

procedure TFOdtUrbanaRural.qContratoIntervenidoBeforeOpen(
  DataSet: TDataSet);
begin
  qContratoIntervenido.sql.text:= 'SELECT * FROM '+EsquemaContratos+'SIO_CONTRATOS'+ DBLink+' WHERE control_contrato = ''EN'' AND CEDULA_CONTRATISTA =:CEDULACONTRATISTA ';
end;


function TFOdtUrbanaRural.ValorAuxiliosEmpleadoOdt(CodigoEmpleado,
  CodigoOdt:string): double;
var query:tquery;
begin
  query:=tquery.create(self);
  query.databasename:='BaseDato';
  query.sql.Add('select  oad.codigoauxiliodetalle,oad.codigoimputacionmanoobra,oad.valorimputacion from odtauxiliodetalle oad,odtauxilio oa,imputacionmanoobra i');
  query.sql.Add('where oa.codigoauxilio=oad.codigoauxilio');
  query.sql.Add('and oad.codigoimputacionmanoobra=i.codigoimputacionmanoobra');
  query.sql.Add('and codigosubtipoimputacionodt in (''DES'',''ALM'',''COM'') ');
  query.sql.Add('and valorimputacion is not null');
  query.sql.Add('and codigoodt='+codigoodt);
  query.sql.Add('and codigoempleado='+codigoempleado);
  query.open;
  result:=query.fieldbyname('valorimputacion').AsFloat;
  Query.Close;
  query.free;
end;

function TFOdtUrbanaRural.ValorViaticosEmpleadoOdt(CodigoEmpleado,
  CodigoOdt: string): double;
var query:tquery;
begin
  query:=tquery.create(self);
  query.databasename:='BaseDato';
  query.sql.Add('select  oav.codigoviaticodetalle,oav.codigoimputacionmanoobra,oav.valorimputacion from odtviaticodetalle oav,odtviatico oa,imputacionmanoobra i');
  query.sql.Add('where oa.codigoviatico=oav.codigoviatico');
  query.sql.Add('and oav.codigoimputacionmanoobra=i.codigoimputacionmanoobra');
  query.sql.Add('and codigosubtipoimputacionodt in (''ANT'',''AUX'',''VIA'')');
  query.sql.Add('and valorimputacion is not null');
  query.sql.Add('and codigoodt='+codigoodt);
  query.sql.Add('and codigoempleado='+codigoempleado);
  query.open;
  result:=query.fieldbyname('valorimputacion').AsFloat;
  query.free;
end;


procedure TFOdtUrbanaRural.qOdtClienteSgdAfterPost(DataSet: TDataSet);
begin
  qOdtClienteSgd.ApplyUpdates;
  qOdtClienteSgd.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qOdtClienteSgdAfterDelete(DataSet: TDataSet);
begin
  qOdtClienteSgd.ApplyUpdates;
  qOdtClienteSgd.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qOdtClienteSgdAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('CODIGOODT').AsFloat  := qODTHijaCODIGOODT.AsFloat;
    FieldByName('CONSECUTIVO').AsFloat:= qODTHijaCONSECUTIVO.AsFloat;
  end;
end;


procedure TFOdtUrbanaRural.qMedidaSeguridadESTADOSetText(Sender: TField;
  const Text: String);
begin
  if (text='X')then Sender.AsString:='1'
  else Sender.AsString:='0';
end;

procedure TFOdtUrbanaRural.qMedidaSeguridadESTADOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if (sender.asstring='1') then text:='X'
  else text:='_';
end;

procedure TFOdtUrbanaRural.qPresManoBeforeInsert(DataSet: TDataSet);
var query:tquery;
begin
  if (qPresManoCODIGOEMPLEADO.AsString<>'') then
  begin
    query:=tquery.create(self);
    query.databasename:='BaseDato';
    query.sql.add('SELECT COUNT(*)cont FROM EMPLEADO');
    query.sql.add('WHERE (ESTADO <>''RE'' OR ESTADO IS NULL)');
    query.sql.add('AND CODIGOEMPLEADO='+qPresManoCODIGOEMPLEADO.AsString);
    query.open;
    if (query.FieldByName('cont').Asinteger=0)then
      raise Exception.Create('No puede insertar este empleado porque no Existe.');
    Query.Close;
    query.free;
  end;
end;

procedure TFOdtUrbanaRural.SpeedButton22Click(Sender: TObject);
var codigogrupo,cia:integer;
begin
  cia:=qODTPadreCODIGOADMINISTRATIVO.AsInteger;
  SeleccionarGrupoTrabajo(cia,codigogrupo);
  if (cia=qODTPadreCODIGOADMINISTRATIVO.AsInteger) then
    qODTHijaCODIGOGRUPOTRABAJO.AsInteger:=codigogrupo
  else
    raise Exception.Create('Debe seleccionar un grupo trabajo del área que genera la ODT.');
end;

procedure TFOdtUrbanaRural.qPresManoCalcFields(DataSet: TDataSet);
begin
  qEmpleado2.close;
  qEmpleado2.open;
  qPresManoNombreEmpleado.AsString:=qEmpleado2NOMBREEMPLEADO.AsString;
  qPresManoSueldoEmpleado.AsFloat:=qEmpleado2SUELDO.AsFloat;
  qPresManoValorHora.AsFloat:=(qPresManoSueldoEmpleado.AsFloat/240);
end;

procedure TFOdtUrbanaRural.qODTPadreCalcFields(DataSet: TDataSet);
var query:tquery;
begin
  query:=TQuery.Create(self);
  query.DatabaseName:='BaseDato';
  query.sql.clear;
  query.sql.add('SELECT NOMBREPRIORIDAD FROM PRIORIDAD WHERE CODIGOPRIORIDAD='''+qODTPadreCODIGOPRIORIDAD.AsString+'''');
  query.open;
  qODTPadreNombrePrioridad.AsString:=query.Fieldbyname('NOMBREPRIORIDAD').asstring;
  query.sql.clear;
  query.sql.add('SELECT NOMBRELABOR FROM LABOR WHERE CODIGOLABOR='''+qODTPadreCODIGOLABOR.AsString+'''');
  query.open;
  qODTPadreNombreLabor.AsString:=query.Fieldbyname('NOMBRELABOR').asstring;
  query.sql.clear;
  query.sql.add('SELECT NOMBRETIPOTAREA FROM TIPOTAREA WHERE CODIGOTIPOTAREA='''+qODTPadreCODIGOTIPOTAREA.AsString+'''');
  query.open;
  qODTPadreNombreTipoTarea.AsString:=query.Fieldbyname('NOMBRETIPOTAREA').asstring;
  query.sql.clear;
  query.sql.add('SELECT NOMBREESTADOODT FROM ESTADOODT WHERE CODIGOESTADOODT='''+qODTPadreCODIGOESTADOODT.AsString+'''');
  query.open;
  qODTPadreNombreEstadoOdt.AsString:=query.Fieldbyname('NOMBREESTADOODT').asstring;
  query.sql.clear;
  query.sql.add('SELECT NOMBREODTTIPOMANOOBRA FROM ODTTIPOMANOOBRA WHERE CODIGOODTTIPOMANOOBRA='''+qODTPadreCODIGOODTTIPOMANOOBRA.AsString+'''');
  query.open;
  qODTPadreNombreTipoManoObra.AsString:=query.Fieldbyname('NOMBREODTTIPOMANOOBRA').asstring;
  query.sql.clear;
  query.sql.add('SELECT NOMBRECONTRATISTA FROM CONTRATISTA WHERE CODIGOCONTRATISTA='''+qODTPadreCODIGOCONTRATISTA.AsString+'''');
  query.open;
  qODTPadreNombreContratista.AsString:=query.Fieldbyname('NOMBRECONTRATISTA').asstring;
  Query.Close;
  query.sql.clear;
  query.sql.add('SELECT NOMBREADMINISTRATIVO FROM ADMINISTRATIVO WHERE CODIGOADMINISTRATIVO='''+qODTPadreCODIGOADMINISTRATIVO.AsString+'''');
  query.open;
  qODTPadreNombreAdministrativo.AsString:=query.Fieldbyname('NOMBREADMINISTRATIVO').asstring;
  Query.Close;
  query.free;
  lbCIA.Caption:=qODTPadreNombreAdministrativo.AsString;
  if qODTPadreCODIGOAPROBADO.AsString<>'' then
  begin
    qEmpleado.Close;
    qEmpleado.Params[0].AsString:=qODTPadreCODIGOAPROBADO.AsString;
    qEmpleado.Open;
    qODTPadreNombreAprobado.AsString:=qEmpleado.Fields[0].AsString
  end;
  if qODTPadreCODIGOEJECUTOR.AsString<>'' then
  begin
    qEmpleado.Close;
    qEmpleado.Params[0].AsString:=qODTPadreCODIGOEJECUTOR.AsString;
    qEmpleado.Open;
    qODTPadreNombreEjecutado.AsString:=qEmpleado.Fields[0].AsString
  end;
  if qODTPadreCODIGOREVISADO.AsString<>'' then
  begin
    qEmpleado.Close;
    qEmpleado.Params[0].AsString:=qODTPadreCODIGOREVISADO.AsString;
    qEmpleado.Open;
    qODTPadreNombreRevisado.AsString:=qEmpleado.Fields[0].AsString
  end;  
end;



procedure TFOdtUrbanaRural.sbCierreStockClick(Sender: TObject);
var sl:tStringlist;
begin
  if qODTHijaCODIGOGRUPOTRABAJO.AsString<>'' then
  begin
    //Mostrar Ventana Lista Stock Materiales
    if (qODTHija.State in [dsEdit,dsInsert])and (qODTHija.UpdateObject<>nil) then
    begin
      qODTHija.Post;
      qODTHija.edit;
      BanderaStock:=true;
      MinimizarOdtHija;

      //filtro de la lista stock
      sl:=TStringList.create;
      sl.add('CODIGOADMINISTRATIVO='+qODTPadreCODIGOADMINISTRATIVO.Asstring );
      sl.add('CODIGODESDE='+qODTHijaCODIGOGRUPOTRABAJO.Asstring+'-');
      sl.add('CODIGOHASTA='+qODTHijaCODIGOGRUPOTRABAJO.Asstring+'-');
      sl.add('cfg_VisualizarFiltro=N');
      fListaStock:=TfListaStock.CreateByParametros(Application,sl);
      sl.free;
      fListaStock.AuditoriaStockCuadrilla(qODTHijaCODIGOODT.AsFloat,qODTPadreCODIGOADMINISTRATIVO.AsFloat,
      qODTHijaCONSECUTIVO.AsInteger,qODTHijaCODIGOGRUPOTRABAJO.AsInteger);
      fListaStock.Show;
    end;
  end
  else
    raise Exception.Create('Debe seleccionar un Grupo de Trabajo para realizar el Cierre de Stock.');
end;

function TFOdtUrbanaRural.ValidarTipoAuditoriaStock(var mensaje:string): boolean;
var qconsulta:tquery;
begin
  if (qODTPadreCODIGOLABOR.AsString<>'') then
  begin
    mensaje:='';
    qconsulta:=TQuery.Create(self);
    qconsulta.DatabaseName:='BaseDato';
    qConsulta.SQL.clear;
    qconsulta.sql.add('select count(*)');
    qconsulta.sql.add('from labor');
    qconsulta.sql.add('where nombrelabor like ''%STOCK%MATERIALES%''');
    qconsulta.sql.add('and codigolabor='+qODTPadreCODIGOLABOR.AsString);
    qconsulta.open;

    if (qconsulta.fields[0].asinteger=0) then
      mensaje:='Labor diferente a Stock de Materiales';
  end;
  if (qODTPadreCODIGOTIPOTAREA.AsString <>'')then
  begin
    qConsulta.SQL.clear;
    qconsulta.sql.add('select count(*)');
    qconsulta.sql.add('from tipotarea');
    qconsulta.sql.add('where nombretipotarea like ''%STOCK%MATERIALES%''');
    qconsulta.sql.add('and codigotipotarea='+qODTPadreCODIGOTIPOTAREA.AsString);
    qconsulta.open;
    if (qconsulta.fields[0].asinteger=0) then
      mensaje:=mensaje+'/'+'tipo de tarea diferente a auditoria de materiales';
  end;

  if mensaje<>'' then result:=false
  else result:=true;
  qconsulta.free;
  dbEdCodigoTipoTrabajo.Enabled:=not(result);
  dblkCodigoTipoTrabajo.Enabled:=not(result);
end;

procedure TFOdtUrbanaRural.qODTHijaAfterPost(DataSet: TDataSet);
begin
  qODTHija.ApplyUpdates;
  qODTHija.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qPresMateCANTIDADRETIRADABUENAValidate(
  Sender: TField);
begin
  if qPresMateCANTIDADRETIRADABUENA.AsString = '' then
    qPresMateCANTIDADRETIRADABUENA.AsFloat:= 0;

  if qPresMateCANTIDADRETIRADABUENA.AsFloat < 0 then
    raise Exception.Create('La cantidad debe ser positiva.');

  if qPresMateCANTIDADRETIRADAMALA.AsString = '' then
    qPresMateCANTIDADRETIRADAMALA.AsFloat := 0;

  if qPresMateCANTIDADCONSUMIDADESMANTELADA.AsString = '' then
    qPresMateCANTIDADCONSUMIDADESMANTELADA.AsFloat := 0;

  if qPresMateCANTIDADCONSUMIDA.AsString = '' then
    qPresMateCANTIDADCONSUMIDA.AsFloat := 0;

end;

procedure TFOdtUrbanaRural.qPresMateCANTIDADRETIRADAMALAValidate(
  Sender: TField);
begin
  if qPresMateCANTIDADRETIRADAMALA.AsString = '' then
    qPresMateCANTIDADRETIRADAMALA.AsFloat:= 0;

  if qPresMateCANTIDADRETIRADAMALA.AsFloat < 0 then
    raise Exception.Create('La cantidad debe ser positiva.');

  if qPresMateCANTIDADRETIRADABUENA.AsString = '' then
    qPresMateCANTIDADRETIRADABUENA.AsFloat := 0;

  if qPresMateCANTIDADCONSUMIDADESMANTELADA.AsString = '' then
    qPresMateCANTIDADCONSUMIDADESMANTELADA.AsFloat := 0;

  if qPresMateCANTIDADCONSUMIDA.AsString = '' then
    qPresMateCANTIDADCONSUMIDA.AsFloat := 0;
end;

procedure TFOdtUrbanaRural.qPresMateCANTIDADCONSUMIDAValidate(
  Sender: TField);
var
  qConsulta: TQuery;
begin
  if (qPresMateCANTIDADCONSUMIDA.AsString = '') then
    qPresMateCANTIDADCONSUMIDA.AsFloat:= 0;

  if qPresMateCANTIDADCONSUMIDA.AsFloat < 0 then
    raise Exception.Create('La cantidad debe ser positiva.');

  //Consulta al stock de materiales y Validacion sobre la cantidad consumida.
  qConsulta := TQuery.Create(nil);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.SQL.Add('SELECT CANTIDADACTUAL FROM STOCKGRUPOTRABAJO WHERE CODIGOGRUPOTRABAJO = '+qODTHijaCODIGOGRUPOTRABAJO.AsString);
  qConsulta.SQL.Add('AND CODIGOADMINISTRATIVO = '+qODTPadreCODIGOADMINISTRATIVO.AsString);
  qConsulta.SQL.Add('AND CODIGOMATERIAL = '+qPresMateCODIGOMATERIAL.AsString);
  qConsulta.Open;
  if (qPresMateCANTIDADCONSUMIDA.AsFloat > (qConsulta.Fields[0].AsFloat+consumidonuevo)) or (qConsulta.RecordCount < 1) then
  begin
    qConsulta.Close;
    qConsulta.Free;
    raise Exception.Create('La cantidad disponible en Stock de este material nuevo es inferior a la que intenta registrar.')
  end;
  qConsulta.Close;
  qConsulta.Free;

  if qPresMateCANTIDADCONSUMIDA.AsString = '0' then
    consumidonuevo:= 0
  else
    consumidonuevo:= qPresMateCANTIDADCONSUMIDA.AsFloat;

  if qPresMateCANTIDADCONSUMIDADESMANTELADA.AsString = '' then
    qPresMateCANTIDADCONSUMIDADESMANTELADA.AsFloat := 0;

  if qPresMateCANTIDADRETIRADABUENA.AsString = '' then
    qPresMateCANTIDADRETIRADABUENA.AsFloat := 0;

  if qPresMateCANTIDADRETIRADAMALA.AsString = '' then
    qPresMateCANTIDADRETIRADAMALA.AsFloat := 0;
end;

procedure TFOdtUrbanaRural.qPresMateCANTIDADCONSUMIDADESMANTELADAValidate(
  Sender: TField);
var
  qConsulta: TQuery;
begin
  //Consulta al stock de materiales y Validacion sobre la cantidad consumida desmantelada.
  if (qPresMateCANTIDADCONSUMIDADESMANTELADA.AsString = '') then
    qPresMateCANTIDADCONSUMIDADESMANTELADA.AsFloat:= 0;

  if qPresMateCANTIDADCONSUMIDADESMANTELADA.AsFloat < 0 then
    raise Exception.Create('La cantidad debe ser positiva.');

  qConsulta := TQuery.Create(nil);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.SQL.Add('SELECT CANTIDADACTUALDESMANTELADABUEN FROM STOCKGRUPOTRABAJO WHERE CODIGOGRUPOTRABAJO = '+qODTHijaCODIGOGRUPOTRABAJO.AsString);
  qConsulta.SQL.Add('AND CODIGOADMINISTRATIVO = '+qODTPadreCODIGOADMINISTRATIVO.AsString);
  qConsulta.SQL.Add('AND CODIGOMATERIAL = '+qPresMateCODIGOMATERIAL.AsString);
  qConsulta.Open;
  if (qPresMateCANTIDADCONSUMIDADESMANTELADA.AsFloat > (qConsulta.Fields[0].AsFloat+consumidodesmantelado)) or (qConsulta.RecordCount = 0) then
  begin
    qConsulta.Close;
    qConsulta.Free;
    raise Exception.Create('La cantidad disponible en Stock de este material nuevo es inferior a la que intenta registrar.')
  end;
  qConsulta.Close;
  qConsulta.Free;

  if qPresMateCANTIDADCONSUMIDADESMANTELADA.AsString = '0' then
    consumidodesmantelado := 0
  else
    consumidodesmantelado := qPresMateCANTIDADCONSUMIDADESMANTELADA.AsFloat;

  if qPresMateCANTIDADCONSUMIDA.AsString = '' then
    qPresMateCANTIDADCONSUMIDA.AsFloat := 0;

  if qPresMateCANTIDADRETIRADABUENA.AsString = '' then
    qPresMateCANTIDADRETIRADABUENA.AsFloat := 0;

  if qPresMateCANTIDADRETIRADAMALA.AsString = '' then
    qPresMateCANTIDADRETIRADAMALA.AsFloat := 0;
end;


procedure TFOdtUrbanaRural.qPresMateCANTIDADREINTEGRADAMALAValidate(
  Sender: TField);
var
  qconsulta:tquery;
begin
  //Interfaz OW
if (qPresMateCANTIDADREINTEGRADAMALA.asstring = '') then   qPresMateCANTIDADREINTEGRADAMALA.asFLOAT:= 0;
  if qPresMateCANTIDADREINTEGRADAMALA.asfloat < 0 then  raise Exception.Create('La cantidad debe ser positiva.');
    //Consulta al stock de materiales y Validacion sobre la cantidad consumida.
{  qConsulta := TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.SQL.Add('select cantidadactual from stockgrupotrabajo where codigogrupotrabajo= '+ qodthijaCODIGOGRUPOTRABAJO.asstring );
  qConsulta.SQL.Add('and codigoadministrativo= '+qodtpadreCODIGOADMINISTRATIVO.asstring);
  qConsulta.SQL.Add('and codigomaterial = '+qpresmateCODIGOMATERIAL.asstring);
  qConsulta.Open;
  if (qPresMateCANTIDADREINTEGRADAMALA.asFloat > (qConsulta.Fields[0].AsFloat+ Reintegronuevomalo)) or (qConsulta.RecordCount <1) then
  begin
    qConsulta.Free;
    raise Exception.Create('La cantidad disponible en Stock de este material es menor a la Existente en Bodega.')
  end;
  if qPresMateCANTIDADREINTEGRADAMALA.asstring = '0' then
    Reintegronuevomalo := 0
  else
    Reintegronuevomalo := qPresMateCANTIDADREINTEGRADAMALA.asfloat; }
end;


procedure TFOdtUrbanaRural.qPresMateCANTIDADREINTEGRADABUENAValidate(
  Sender: TField);
var
qconsulta:tquery;
begin
//Interfaz OW
if (qPresMateCANTIDADREINTEGRADABUENA.asstring = '') then qPresMateCANTIDADREINTEGRADABUENA.asFloat:= 0;
if qPresMateCANTIDADREINTEGRADABUENA.asfloat < 0 then  raise Exception.Create('La cantidad debe ser positiva.');
//Consulta al stock de materiales y Validacion sobre la cantidad consumida.
{qConsulta := TQuery.Create(Application);
qConsulta.DatabaseName := 'BaseDato';
qConsulta.SQL.Add('select cantidadactual from stockgrupotrabajo where codigogrupotrabajo= '+ qodthijaCODIGOGRUPOTRABAJO.asstring );
qConsulta.SQL.Add('and codigoadministrativo= '+qodtpadreCODIGOADMINISTRATIVO.asstring);
qConsulta.SQL.Add('and codigomaterial = '+qpresmateCODIGOMATERIAL.asstring);
qConsulta.Open;
if (qPresMateCANTIDADREINTEGRADABUENA.asFloat > (qConsulta.Fields[0].AsFloat+ Reintegronuevobueno)) or (qConsulta.RecordCount <1) then
begin
  qConsulta.Free;
  raise Exception.Create('La cantidad disponible en Stock de este material es menor a la Existente en Bodega.')
end;
if qPresMateCANTIDADREINTEGRADABUENA.asstring = '0' then
  Reintegronuevobueno:= 0
else
  Reintegronuevobueno:= qPresMateCANTIDADREINTEGRADABUENA.asfloat;}
end;


procedure TFOdtUrbanaRural.qPresMateCANTIDADREINTEGRADABUENADESMANValidate(
  Sender: TField);
var
qconsulta:tquery;
begin
//Interfaz OW
if (qPresMateCANTIDADREINTEGRADABUENADESMAN.asstring = '') then qPresMateCANTIDADREINTEGRADABUENADESMAN.asfloat:= 0;
if qPresMateCANTIDADREINTEGRADABUENADESMAN.asfloat < 0 then  raise Exception.Create('La cantidad debe ser positiva.');
//Consulta al stock de materiales y Validacion sobre la cantidad consumida.
{qConsulta := TQuery.Create(Application);
qConsulta.DatabaseName := 'BaseDato';
qConsulta.SQL.Add('select cantidadactualdesmanteladabuen from stockgrupotrabajo where codigogrupotrabajo= '+ qodthijaCODIGOGRUPOTRABAJO.asstring );
qConsulta.SQL.Add('and codigoadministrativo= '+qodtpadreCODIGOADMINISTRATIVO.asstring);
qConsulta.SQL.Add('and codigomaterial = '+qpresmateCODIGOMATERIAL.asstring);
qConsulta.Open;
if (qPresMateCANTIDADREINTEGRADABUENADESMAN.asFloat > (qConsulta.Fields[0].AsFloat+ Reintegrodesmanteladobueno)) or (qConsulta.RecordCount <1) then
begin
  qConsulta.Free;
  raise Exception.Create('La cantidad disponible en Stock de este material es menor a la Existente en Bodega.')
end;
if qPresMateCANTIDADREINTEGRADABUENADESMAN.asstring = '0' then
  Reintegrodesmanteladobueno := 0
else
  Reintegrodesmanteladobueno := qPresMateCANTIDADREINTEGRADABUENADESMAN.asfloat;}
end;


procedure TFOdtUrbanaRural.qPresMateCANTIDADREINTEGRADAMALADESMANValidate(
  Sender: TField);
var
qconsulta:tquery;
begin
//Interfaz OW
if (qPresMateCANTIDADREINTEGRADAMALADESMAN.asstring = '') then  qPresMateCANTIDADREINTEGRADAMALADESMAN.asfloat:= 0;
if qPresMateCANTIDADREINTEGRADAMALADESMAN.asfloat < 0 then  raise Exception.Create('La cantidad debe ser positiva.');
//Consulta al stock de materiales y Validacion sobre la cantidad consumida.
{qConsulta := TQuery.Create(Application);
qConsulta.DatabaseName := 'BaseDato';
qConsulta.SQL.Add('select cantidadactualdesmanteladamala from stockgrupotrabajo where codigogrupotrabajo= '+ qodthijaCODIGOGRUPOTRABAJO.asstring );
qConsulta.SQL.Add('and codigoadministrativo= '+qodtpadreCODIGOADMINISTRATIVO.asstring);
qConsulta.SQL.Add('and codigomaterial = '+qpresmateCODIGOMATERIAL.asstring);
qConsulta.Open;
if (qPresMateCANTIDADREINTEGRADAMALADESMAN.asFloat > (qConsulta.Fields[0].AsFloat+ Reintegrodesmanteladomalo)) or (qConsulta.RecordCount <1) then
begin
  qConsulta.Free;
  raise Exception.Create('La cantidad disponible en Stock de este material es menor a la Exixtente en Bodega.')
end;
if qPresMateCANTIDADREINTEGRADAMALADESMAN.asstring = '0' then
  Reintegrodesmanteladomalo  := 0
else
  Reintegrodesmanteladomalo := qPresMateCANTIDADREINTEGRADAMALADESMAN.asfloat;}
end;


procedure TFOdtUrbanaRural.qPresMateCODIGOMATERIALValidate(Sender: TField);
begin
if NOT ((qpresmatecantidadconsumida.asfloat = 0) and (qpresmatecantidadconsumidadesmantelada.asfloat = 0) and(qpresmatecantidadretiradabuena.asfloat = 0) and
(qpresmatecantidadretiradamala.asfloat = 0) and(qpresmateCANTIDADREINTEGRADAMALA.asfloat = 0) and(qpresmateCANTIDADREINTEGRADABuena.asfloat = 0) and
(qPresMateCANTIDADREINTEGRADABUENADESMAN.asfloat = 0) and(qPresMateCANTIDADREINTEGRADAMALADESMAN.asfloat = 0) AND (qPresMateCANTIDADENTREGADA.asfloat = 0) ) then
Begin
 raise Exception.Create('Existen cantidades relacionadas con este material. Elimine el registro y Agregue uno nuevo. ')
end;
end;

function TFOdtUrbanaRural.ValidarTipoModificacionStock(tipotrabajo:string;
  var mensaje: string): boolean;
var query:tquery;
begin
  mensaje:='';
  result:=false;
  if (tipotrabajo<>'') then
  begin
    query:=TQuery.create(self);
    query.databasename:='BaseDato';
    query.sql.add('select count(*) from tipotrabajoodt');
    query.sql.add('where descripcion like ''%STOCK%MATERIALES%''');
    query.sql.add('and codigotipotrabajoodt='+tipotrabajo);
    query.open;
    if (query.fields[0].asinteger>0) then
    begin
      result:=true
    end
    else
      Mensaje:='El tipo de trabajo no permite modificar el stock.';
    query.close;
    query.free;
  end
  else
    mensaje:='Debe ingresar el Tipo de Trabajo';

end;

procedure TFOdtUrbanaRural.VisualizarModificacionStock(Visualiza:boolean);
var i:integer;
begin
//Interfaz OW
  dbgMateriales.Columns[0].Visible:=true;
  //dbgMateriales.Columns[1].Visible:=true;
  for i := 2 to 17 do
    dbgMateriales.Columns[i].Visible:=not(visualiza);
  for i := 18 to 21 do
    dbgMateriales.Columns[i].Visible:=visualiza;
  DBNavigatorMaterial.VisibleButtons:= [nbFirst,nbPrior,nbNext,nbLast,nbInsert,nbDelete,nbEdit,nbPost,nbCancel];
  if visualiza then
    DBNavigatorMaterial.VisibleButtons:= [nbFirst,nbPrior,nbNext,nbLast,nbEdit,nbPost];
  tsMaterialRequisicion.TabVisible:=not(visualiza);
  tsMaterialTraslado.TabVisible:=not(visualiza);
  tsMaterialDesmantelado.TabVisible:=not(visualiza);
  tsMaterialConsumo.TabVisible:=not(visualiza);
  tsMaterialReintegro.TabVisible:=not(visualiza);
  tsMaterialStock.TabVisible:=not(visualiza);
end;

function TFOdtUrbanaRural.ValidarPermisoModificacionStock(
  var mensaje: string): boolean;
var query:tquery;
begin
  result:=false;
  query:=TQuery.create(self);
  query.databasename:='BaseDato';

  query.sql.add('SELECT EDITAR FROM ODTPERMISOS');
  query.sql.add('WHERE CODIGOUSUARIO='+inttostr(varcodigousuario));
  query.sql.add('AND CODIGOADMINISTRATIVO='+qODTPadreCODIGOADMINISTRATIVO.AsString);
  query.sql.add('AND NOMBRETABLA=''STOCKMATERIALES''');
  query.open;
  if (varcodigousuario=0) or (query.fieldbyname('EDITAR').asstring='S')  then
    result:=true
  else
    mensaje:= mensaje + char(13)+ 'Este usuario no tiene permisos de edición del Stock';

  query.close;
  query.free;
end;

procedure TFOdtUrbanaRural.qPresMateBeforeInsert(DataSet: TDataSet);
begin
  if (qODTHija.State in [dsEdit,dsInsert]) and (qODTHija.UpdateObject<>nil) and (not bInsertandoMateriales) then
  begin
    qODTHija.Post;
    qODTHija.Edit;
  end;
  if qODTHijaCODIGOGRUPOTRABAJO.AsString='' then
    raise exception.Create('Debe ingresar el Grupo de Trabajo antes de ingresar material');
end;

procedure TFOdtUrbanaRural.qPresMateBeforePost(DataSet: TDataSet);
begin
  if ((qPresMateCANTIDADMODIFICADANUEVA.AsString<>'') or
     (qPresMateCANTIDADMODIFICADADESMBUENA.AsString<>'') or
     (qPresMateCANTIDADMODIFICADADESMMALA.AsString<>'') )and (qPresMateMOTIVOMODIFICACIONSTOCK.AsString='') then
    raise Exception.create('Debe ingresar el motivo de la modificación del Stock');
end;

procedure TFOdtUrbanaRural.qODTVehiculoUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  if UpdateKind = ukInsert then
  begin
    (Application.MessageBox('Ocurrió un error al tratar de insertar el vehículo.'+Chr(13)+
               'El registro será eliminado.',PChar('Advertencia'),MB_ICONINFORMATION+MB_ok));

//    MessageDlg('Ocurrió un error al tratar de insertar el vehículo.'+Chr(13)+
//               'El registro será eliminado.',mtWarning,[mbok],0);
    qODTVehiculo.Delete;
    UpdateAction:=uaSkip;
  end
  else
  begin
    (Application.MessageBox('Ocurrió un error al tratar de actualizar el vehículo.'+Chr(13)+
               'Los cambios no se guardarán.',PChar('Advertencia'),MB_ICONINFORMATION+MB_ok));
{    MessageDlg('Ocurrió un error al tratar de actualizar el vehículo.'+Chr(13)+
               'Los cambios no se guardarán.',mtWarning,[mbok],0);}
    UpdateAction:=uaAbort;
  end;
end;

procedure TFOdtUrbanaRural.qReporteUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  if UpdateKind = ukInsert then
  begin
    (Application.MessageBox('Ocurrió un error al tratar de insertar el reporte.'+Chr(13)+
               'El registro será eliminado.',PChar('Advertencia'),MB_ICONINFORMATION+MB_ok));

//    MessageDlg('Ocurrió un error al tratar de insertar el reporte.'+Chr(13)+
//               'El registro será eliminado.',mtWarning,[mbok],0);
    qReporte.Delete;
    UpdateAction:=uaAbort;
  end
  else
  begin
    (Application.MessageBox('Ocurrió un error al tratar de actualizar el reporte.'+Chr(13)+
               'Los cambios no se guardarán.',PChar('Advertencia'),MB_ICONINFORMATION+MB_ok));
//    MessageDlg('Ocurrió un error al tratar de actualizar el reporte.'+Chr(13)+
//               'Los cambios no se guardarán.',mtWarning,[mbok],0);
    UpdateAction:=uaAbort;
  end;
end;

procedure TFOdtUrbanaRural.DBEdDatoNumericoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
     if (ActiveControl is TDBLookupComboBox) then
     begin
       if not (ActiveControl as TDBLookupComboBox).ListVisible then
          Perform(wm_NextDLGCTL, 0, 0);
     end
     else
     begin
       Perform(wm_NextDLGCTL, 0, 0);
       key := #0;
     end;
  end
  else
  begin
    if not (key  in ['1','2','3','4','5','6','7','8','9','0'])
      then raise exception.create('Este dato debe ser numérico.');
      Application.ProcessMessages;  end;
end;

procedure TFOdtUrbanaRural.qODTHijaCODIGOODTOPERAValidate(Sender: TField);
var
  cont:integer;
  query:tquery;
begin
  if Sender.AsString<>'' then
  begin
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT COUNT(*) FROM ODTOPERA WHERE CODIGOODTOPERA='+qODTHijaCODIGOODTOPERA.Asstring);
    query.Open;
    cont:=query.fields[0].AsInteger;
    query.close;
    query.free;
    if (cont=0) then raise exception.create('Este código de tipo ubicación no existe por favor verifique.');
  end;
end;

procedure TFOdtUrbanaRural.qODTHijaCODIGOTIPOELEMENTOValidate(
  Sender: TField);
var
  cont:integer;
  query:tquery;
begin
  if Sender.AsString<>'' then
  begin
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT COUNT(*) FROM TIPOELEMENTO WHERE CODIGOTIPOELEMENTO='''+qODTHijaCODIGOTIPOELEMENTO.Asstring+'''');
    query.Open;
    cont:=query.fields[0].AsInteger;
    query.close;
    query.free;
    if (cont=0) then raise exception.create('Este código de tipo elemento no existe por favor verifique.');
  end;
end;

procedure TFOdtUrbanaRural.qODTHijaCODIGONIVELTENSIONValidate(
  Sender: TField);
var
  cont:integer;
  query:tquery;
begin
  if Sender.AsString<>'' then
  begin
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT COUNT(*) FROM NIVELTENSION WHERE CODIGONIVELTENSION='''+qODTHijaCODIGONIVELTENSION.Asstring+'''');
    query.Open;
    cont:=query.fields[0].AsInteger;
    query.close;
    query.free;
    if (cont=0) then raise exception.create('Este código de nivel tensión no existe por favor verifique.');
  end;
end;

procedure TFOdtUrbanaRural.tbVerPanelInfraestructuraClick(Sender: TObject);
begin
  PanelInfraestructura.Visible:= not PanelInfraestructura.Visible;
  if (not PanelInfraestructura.Visible) then
  begin
    OcultarPanelEstructura;
    dbgElementoGestion.width:=Notebook.Width-6;
  end
  else
  begin
    dbgElementoGestion.Width:=round(Notebook.Width*0.56);
    TipoVisualizacion:=mvNinguno;
    VistaPreviaElementoActual;
  end;
end;

procedure TFOdtUrbanaRural.tbVerCartografiaClick(Sender: TObject);
var punto:TPoint;
  ListaApoyosVisualizar,sl:tstringlist;
  i:integer;
begin
  TipoVisualizacion:=mvCartografia;
  punto:=PanelVerInfraestructura.ClientToScreen(Classes.Point(tbutton(sender).Left, tbutton(sender).top));
  pmVerInfraestructura.Items[0].Caption:='Abrir Cartografía';
  pmVerInfraestructura.Items[1].Caption:='Ver elemento actual en Cartografía';
  pmVerInfraestructura.Items[2].Caption:='Ver elementos seleccionados en Cartografía';
  pmVerInfraestructura.Items[3].Caption:='Ver todos los elemento de la lista en Cartografía';
  pmVerInfraestructura.Popup(punto.x+10, punto.y+10);
end;

procedure TFOdtUrbanaRural.tbVerVistalateralClick(Sender: TObject);
var punto:TPoint;
 i,x:integer;
 ListaApoyosVisualizar,sl:tstringlist;
begin
  TipoVisualizacion:=mvVistaLateral;
  punto:=PanelVerInfraestructura.ClientToScreen(Classes.Point(tbutton(sender).Left, tbutton(sender).top));
  pmVerInfraestructura.Items[0].Caption:='Abrir Vista Lateral';
  pmVerInfraestructura.Items[1].Caption:='Ver elemento actual en Vista Lateral';
  pmVerInfraestructura.Items[2].Caption:='Ver elementos seleccionados en Vista Lateral';
  pmVerInfraestructura.Items[3].Caption:='Ver todos los elemento de la lista en Vista Lateral';
  pmVerInfraestructura.Popup(punto.x+10, punto.y+10);
end;

procedure TFOdtUrbanaRural.Verelementoactual1Click(Sender: TObject);
var
  ListaApoyosVisualizar:tstringlist;
begin
  ListaApoyosVisualizar:=ListarApoyosVer(1);
  VisualizarApoyos(ListaApoyosVisualizar);
end;

procedure TFOdtUrbanaRural.Verelementosseleccionados1Click(
  Sender: TObject);
var ListaApoyosVisualizar,sl:tstringlist;
  x,i:integer;
begin
  ListaApoyosVisualizar:=ListarApoyosVer(2);
  VisualizarApoyos(ListaApoyosVisualizar);
end;

procedure TFOdtUrbanaRural.Vertodosloselementos1Click(Sender: TObject);
var ListaApoyosVisualizar,sl:tstringlist;
begin
  ListaApoyosVisualizar:=ListarApoyosVer(3);
  VisualizarApoyos(ListaApoyosVisualizar);
end;

function TFOdtUrbanaRural.ListarApoyosVer(Modo: integer): tstringlist;
var
  i:integer;
begin
  qApoyoElemento.close;
  qApoyoElemento.open;
  Result:=TStringList.create;
  case Modo of
    1: //actual
    begin
      while not qApoyoElemento.eof do
      begin
        Result.Add(qApoyoElementoCODIGOAPOYO.asString);
        qApoyoElemento.Next;
      end;
    end;
    2: //Seleccionados
    begin
      for i:=0 to dbgElementoGestion.SelectedRows.Count-1 do
      begin
        qGestionInfraestructura.BookMark:=dbgElementoGestion.SelectedRows.Items[i];
        while not qApoyoElemento.eof do
        begin
          Result.Add(qApoyoElementoCODIGOAPOYO.asString);
          qApoyoElemento.Next;
        end;
        qGestionInfraestructura.next;
      end;
    end;
    3: //Todos
    begin
     qGestionInfraestructura.First;
      while not qGestionInfraestructura.eof do
      begin
        while not qApoyoElemento.eof do
        begin
          Result.Add(qApoyoElementoCODIGOAPOYO.asString);
          qApoyoElemento.Next;
        end;
        qGestionInfraestructura.next;
      end;
    end;
  end;
end;

procedure TFOdtUrbanaRural.VisualizarApoyos(
  ListaApoyosVisualizar: tstringlist);
var  x,i:integer;
  sl:tstringlist;
begin
  MinimizarOdtHija;

  if (TipoVisualizacion=mvCartografia) then
  begin
    MostrarMapa;
    if ListaApoyosVisualizar.Count>0 then
      MarcarApoyos(ListaApoyosVisualizar);
  end
  else
  begin
    if (TipoVisualizacion=mvVistaLateral) then
    begin
      x:=0;
      sl:=TStringList.create;
      for i:=0 to ListaApoyosVisualizar.count -1 do
      begin
        sl.Add(ListaApoyosVisualizar[i]+','+inttostr(x)+',0');
        x:=x+20;
      end;
      MostrarVistaLateralApoyos(sl);
    end;
  end;
//  TipoVisualizacion:=mvNinguno;
end;

procedure TFOdtUrbanaRural.MinimizarOdtHija;
var sl:tstringlist;
begin
  if (qODTHija.State in [dsEdit,dsInsert]) and (qODTHija.UpdateObject<>nil) then
  begin
    qODTHija.Post;
    qODTHija.edit;
  end;
  //Ocultar Ventana  ODT
  self.BorderStyle := bsToolWindow;
//  self.FormStyle := fsStayOnTop;
  self.WindowState := wsMinimized;
  self.Visible := False;
  //Mostrar Ventana información ODT
  fInformacionOdthija := tfInformacionOdthija.CreateByParametros(Application,
                         qODTHijaCODIGOODT.AsFloat,qODTHijaCONSECUTIVO.AsInteger);
  fInformacionOdthija.Caption := 'Información ODT';
  fInformacionOdthija.Top := screen.Height - fInformacionOdthija.height-20;
  fInformacionOdthija.left :=30;

  fInformacionOdthija.Show;
  Application.ProcessMessages;
end;

procedure TFOdtUrbanaRural.MostrarVestido;
var n,i, MinX, MinY, MaxX, MaxY, DeltaY : Integer;
    Series1 : TLineSeries;
    slTempo : TStringList;
    TextoApoyos : string;
    ppx, ppy,CodApoyo,PreviewCodApoyo : Integer;
    p : TdPaintNode;
    qDatos:tquery;
begin
  Refresh;

  if PosicionApoyos.count > 0 then
  begin
    if PosicionApoyos.count > 100 then
    begin
      ShowMessage('Número de apoyos seleccionados excede el valor limite');
      if Application.MessageBox(PCHAR('Esta seguro de graficar la Vista Lateral de '+IntToStr(PosicionApoyos.count)+' apoyos'), 'Confirmacion', MB_YESNO + MB_DEFBUTTON1) <> IDYES then
         Exit;
    end;

    Series1 := TLineSeries.Create(self);
    n       := PosicionApoyos.count;

    slTempo := TStringList.create;
    for i:=1 to n do
    begin
      slTempo.Clear;
      slTempo.CommaText := PosicionApoyos[i-1];
      Series1.AddXY(Round(StrToFloat(slTempo[1])), Round(StrToFloat(slTempo[2])), slTempo[0], clBlack);
    end;
    slTempo.Free;

    MinX   := Round(Series1.MinXValue);
    MinY   := Round(Series1.MinYValue);
    MaxX   := Round(Series1.MaxXValue);
    MaxY   := Round(Series1.MaxYValue);
    DeltaY := MaxY - MinY;

    for i:=0 to n-1 do
    begin
      Series1.XValues[i] := Series1.XValues[i]-MinX;
      Series1.YValues[i] := Series1.YValues[i]-MinY;
    end;

    CodApoyo := StrToInt(Series1.XLabel[n-1]);
    if n > 1 then
       PreviewCodApoyo := StrToInt(Series1.XLabel[n-2]);

    PosicionApoyos.Clear;
    ListaTmpApoyos.Clear;

    TextoApoyos := '';
    ppX := MaxX;
    ppy := 0;

    Randomize;
    for i:=0 to n-1 do
    begin
      TextoApoyos := TextoApoyos + ',' + Series1.XLabel[i];
      if (Series1.XValues[i] = 0) and (Series1.YValues[i] = 0) and (EstiloDibujado <> edLibre) then
      begin
        ppx := ppx + 8;
        case EstiloDibujado of
          edLineal   : ppy := MaxY;           // Recto
          edDiagonal : ppy := ppy+10;        // Diagonal
          edRandom   : ppy := random(MaxY);   // Aleatorio
        end;
        PosicionApoyos.Add(Series1.XLabel[i]+','+IntToStr(ppx)+','+IntToStr(ppy));
      end
      else PosicionApoyos.Add(Series1.XLabel[i]+','+FloatToStr(Series1.XValues[i])+','+FloatToStr(Series1.YValues[i]));
      ListaTmpApoyos.Add(Series1.XLabel[i]);
    end;
    Delete(TextoApoyos,1,1);
    Series1.Free;

    caption := 'Vista lateral de '+IntToStr(PosicionApoyos.count)+' apoyos';



    // Ver conectividad de los apoyos seleccionados
    ListaApoyos.Clear;
    ListaNodos.Clear;
    ListaTramos.Clear;
    ListaElementos.Clear;
    ListaColores.Clear;
    ListaNodosBT.Clear;

    CargarValoresPredeterminados;

    fFormaEspere := TfFormaEspere.Create(Application);
    fFormaEspere.ProgressBar1.Max := 15;
    fFormaEspere.lbMotivo.Caption := 'Consultando...';
    fFormaEspere.Show;
    fFormaEspere.ProgressBar1.Position := 1;
    fFormaEspere.Refresh;

    qDatos:=TQuery.Create(self);
    qDatos.DatabaseName:='BaseDato';

    if LoadTramoMT then
    begin
      qDatos.SQL.Clear;
      qDatos.SQL.Add('SELECT codigoapoyo1, codigonodomt1, codigoapoyo2, codigonodomt2, codigotipotramo, codigotramomt');
      qDatos.SQL.Add('FROM tramomt');
      qDatos.SQL.Add('WHERE codigoapoyo1 IN ('+TextoApoyos+')');
      qDatos.SQL.Add('   OR codigoapoyo2 IN ('+TextoApoyos+')');
      qDatos.Open;
      QueryToListExt(qDatos, ListaTramos, ListaApoyos);
    end;
    fFormaEspere.Incremente(1);

    if LoadTramoBT then
    begin
      qDatos.SQL.Clear;
      qDatos.SQL.Add('SELECT codigoapoyo1, codigonodobt1, codigoapoyo2, codigonodobt2, codigotipotramo, codigotramobt');
      qDatos.SQL.Add('FROM tramobt');
      qDatos.SQL.Add('WHERE codigoapoyo1 IN ('+TextoApoyos+')');
      qDatos.SQL.Add('   OR codigoapoyo2 IN ('+TextoApoyos+')');
      qDatos.Open;
      QueryToListExt(qDatos, ListaTramos, ListaApoyos);
    end;
    fFormaEspere.Incremente(1);

    if LoadNodoMT then
    begin
      qDatos.SQL.Clear;
      qDatos.SQL.Add('select distinct c.codigocircuito, c.color, c.nombrecircuito');
      qDatos.SQL.Add('from nodomt n, circuito c');
      qDatos.SQL.Add('where n.codigoapoyo IN ('+TextoApoyos+')');
      qDatos.SQL.Add('  and c.codigocircuito = n.codigocircuito');
      qDatos.Open;
      QueryToListAdd(qDatos, ListaColores, 5, '');
    end;

    fFormaEspere.Incremente(1);

    ListaApoyos.Clear;
    qDatos.SQL.Clear;
    qDatos.SQL.add('SELECT codigoapoyo, codigotipoapoyo');
    qDatos.SQL.add('FROM apoyo');
    qDatos.SQL.add('WHERE codigoapoyo IN ('+TextoApoyos+')');
    qDatos.Open;
    QueryToListAdd(qDatos, ListaApoyos, 1, '');
    fFormaEspere.Incremente(1);

    if LoadNodoMT then
    begin
      qDatos.SQL.Clear;
      qDatos.SQL.add('SELECT nivel, codigoapoyo, codigonodomt, codigocircuito');
      qDatos.SQL.add('FROM nodomt');
      qDatos.SQL.add('WHERE codigoapoyo IN ('+TextoApoyos+')');
      qDatos.SQL.add('ORDER BY CodigoNodomt DESC');
      qDatos.Open;
      QueryToListAdd(qDatos, ListaNodos, 4, '');
    end;
    fFormaEspere.Incremente(1);

    if LoadNodoBT then
    begin
      qDatos.SQL.Clear;
      qDatos.SQL.add('SELECT nivel, codigoapoyo, codigonodobt, codigotrafodis');
      qDatos.SQL.add('FROM nodobt');
      qDatos.SQL.add('WHERE codigoapoyo IN ('+TextoApoyos+')');
      qDatos.SQL.add('ORDER BY CodigoNodobt DESC');
      qDatos.Open;
      QueryToListAdd(qDatos, ListaNodos, 2, '');
      QueryToListAdd(qDatos, ListaNodosBT, 6, '');
    end;
    fFormaEspere.Incremente(1);

    if LoadNodoMT and LoadInterruptor then
    begin
      qDatos.SQL.Clear;
      qDatos.SQL.Add('SELECT codigoapoyo1, codigonodomt1, codigoapoyo2, codigonodomt2, normalidad, codigointerruptordis');
      qDatos.SQL.Add('FROM interruptordis');
      qDatos.SQL.Add('WHERE codigoapoyo1 IN ('+TextoApoyos+')');
      qDatos.SQL.Add('   OR codigoapoyo2 IN ('+TextoApoyos+')');
      qDatos.Open;
      QueryToListAdd(qDatos, ListaElementos, 3, '1');
    end;
    fFormaEspere.Incremente(1);

    if LoadNodoMT and LoadNodoBT and LoadTrafoDis then
    begin
      qDatos.SQL.Clear;
      qDatos.SQL.Add('SELECT codigoapoyo1, codigonodomt, codigoapoyo2, codigonodobt, codigotipoconexiontrafo, codigotrafodis');
      qDatos.SQL.Add('FROM trafodis');
      qDatos.SQL.Add('WHERE codigoapoyo1 IN ('+TextoApoyos+')');
      qDatos.SQL.Add('   OR codigoapoyo2 IN ('+TextoApoyos+')');
      qDatos.Open;
      QueryToListAdd(qDatos, ListaElementos, 3, '2');
    end;
    fFormaEspere.Incremente(1);

    if LoadNodoMT and LoadCondensador then
    begin
      qDatos.SQL.Clear;
      qDatos.SQL.Add('SELECT codigoapoyo, codigonodomt, codigoapoyo, codigonodomt, normalidad, codigoCondensador');
      qDatos.SQL.Add('FROM Condensador');
      qDatos.SQL.Add('WHERE codigoapoyo IN ('+TextoApoyos+')');
      qDatos.Open;
      QueryToListAdd(qDatos, ListaElementos, 3, '3');
    end;
    fFormaEspere.Incremente(1);

    if LoadNodoMT and LoadPararrayoDis then
    begin
      qDatos.SQL.Clear;
      qDatos.SQL.Add('SELECT codigoapoyo, codigonodomt, codigoapoyo, codigonodomt, 1 as normalidad, codigoPararrayoDis');
      qDatos.SQL.Add('FROM PararrayoDis');
      qDatos.SQL.Add('WHERE codigoapoyo IN ('+TextoApoyos+')');
      qDatos.Open;
      QueryToListAdd(qDatos, ListaElementos, 3, '7');
    end;
    fFormaEspere.Incremente(1);

    if LoadNodoBT and LoadLamparaAP then
    begin
      qDatos.SQL.Clear;
      qDatos.SQL.Add('SELECT codigoapoyo, codigonodobt, codigoapoyo, codigonodobt, CodigoTipoFuente, codigoAlumbradoPublico');
      qDatos.SQL.Add('FROM AlumbradoPublico');
      qDatos.SQL.Add('WHERE codigoapoyo IN ('+TextoApoyos+')');
      qDatos.Open;
      QueryToListAdd(qDatos, ListaElementos, 3, '4');
    end;
    fFormaEspere.Incremente(1);

    if LoadDetalleApoyo then
    begin
      qDatos.SQL.Clear;
      qDatos.SQL.Add('SELECT DISTINCT D.CODIGOAPOYO, D.NOCONSECUTIVO, 0, ''1'', D.NIVEL, D.CODIGOESTRUCTURA');
      qDatos.SQL.Add('FROM DETALLEAPOYO D');
      qDatos.SQL.Add('WHERE D.codigoapoyo IN ('+TextoApoyos+')');
      qDatos.Open;
      QueryToListAdd(qDatos, ListaElementos, 3, '5');
    end;
    fFormaEspere.Incremente(1);

    if LoadExcavacion then
    begin
      qDatos.SQL.Clear;
      qDatos.SQL.Add('SELECT codigoApoyo1, codigoApoyo1, codigoapoyo2, codigoApoyo1, codigoEstructura, codigoexcavacion');
      qDatos.SQL.Add('FROM Excavacion');
      qDatos.SQL.Add('WHERE codigoapoyo1 IN ('+TextoApoyos+')');
      qDatos.Open;
      QueryToListAdd(qDatos, ListaElementos, 3, '6');
    end;
    fFormaEspere.Incremente(1);

    if LoadNodoBT and LoadCliente then
    begin
      qDatos.SQL.Clear;
      qDatos.SQL.Add('SELECT codigoapoyo, codigonodobt, count(*)');
      qDatos.SQL.Add('FROM clientesgd');
      qDatos.SQL.Add('WHERE codigoapoyo IN ('+TextoApoyos+')');
      qDatos.SQL.Add('GROUP BY codigoapoyo, codigonodobt');
      qDatos.Open;
      QueryToListAdd(qDatos, ListaClientes, 7, '');
    end;
    fFormaEspere.Incremente(1);

    fFormaEspere.Free;

    DPaint1.Apoyos.Assign(ListaApoyos);
    DPaint1.Nodos.Assign(ListaNodos);
    DPaint1.Tramos.Assign(ListaTramos);
    DPaint1.Elementos.Assign(ListaElementos);
    DPaint1.Clientes.Assign(ListaClientes);

    DPaint1.Colores.Assign(ListaColores);
    DPaint1.PosApoyos.Assign(PosicionApoyos);
    DPaint1.MaximaY := DeltaY;

    DPaint1.CrearDibujo;
    Dpaint1.FPaintLista.FindNodeByCodigo(IntToStr(CodApoyo), dPaintApoyo, p);

    if p <> nil then
    begin
      p.marcado := true;
      DPaint1.SelNode := p;
      DPaint1.SelNodeMenu := p;
    end;
    DPaint1.Paint;
  end
  else Caption := 'Vista Lateral';
end;

procedure TFOdtUrbanaRural.OcultarPanelEstructura;
begin
//  pImagen.Visible := False;
  pHint.Visible:=false;
end;

procedure TFOdtUrbanaRural.VerFotosApoyo(Codigo: string);
var cod : string;
    i: integer;
    NombreFoto, Usuario : string;
    qUsuario: TQuery;
    Registro : TRegIniFile;
    ListaFotos: TStringList;
    TipoFoto : TTipoFoto;
    qFotos: TQuery;
    //**************************
    procedure SetDirectorioFoto(aValor: string);
    begin
      if Trim(aValor) = '' then
        FDirectorioFoto := GetCurrentDir
      else
        FDirectorioFoto := aValor;

      if FDirectorioFoto[Length(FDirectorioFoto)] <> '\' then
        FDirectorioFoto := FDirectorioFoto + '\';
    end;
    function GetDirectorioFoto: string;
      var S: string;
      begin
        if FDirectorioFoto = '' then
          SetDirectorioFoto('');
        Result := FDirectorioFoto;
      end;

begin
end;

procedure TFOdtUrbanaRural.VerPanelEstructura(Nodo: tdPaintNode);
begin

end;

procedure TFOdtUrbanaRural.CargarValoresPredeterminados;
var Registro : TRegIniFile;
    i, CodPerfil : Integer;
begin
  Registro := TRegIniFile.Create('SGD');
  LoadNodoMT       := Registro.ReadBool('VistaLateral','LoadNodoMT',True);
  LoadNodoBT       := Registro.ReadBool('VistaLateral','LoadNodoBT',True);
  LoadTramoMT      := Registro.ReadBool('VistaLateral','LoadTramoMT',True);
  LoadTramoBT      := Registro.ReadBool('VistaLateral','LoadTramoBT',True);
  LoadTrafoDis     := Registro.ReadBool('VistaLateral','LoadTrafoDis',True);
  LoadInterruptor  := Registro.ReadBool('VistaLateral','LoadInterruptor',True);
  LoadCondensador  := Registro.ReadBool('VistaLateral','LoadCondensador',True);
  LoadPararrayoDis := Registro.ReadBool('VistaLateral','LoadPararrayoDis',True);
  LoadLamparaAP    := Registro.ReadBool('VistaLateral','LoadLamparaAP',True);
  LoadCliente      := Registro.ReadBool('VistaLateral','LoadCliente',True);
  LoadDetalleApoyo := Registro.ReadBool('VistaLateral','LoadDetalleApoyo',True);
  LoadExcavacion   := Registro.ReadBool('VistaLateral','LoadExcavacion',True);
  CodPerfil        := StrToInt(Registro.ReadString('VistaLateral','CodigoPerfilVL','0'));
  Registro.Free;

  tPerfilVL.Open;
  tPerfilVL.FindKey([CodPerfil]);

end;

procedure TFOdtUrbanaRural.ActualizarStock;
var query:tquery;
begin
  if Assigned(Application.FindComponent('fListaStock') as TForm) then
  begin
    if (fListaStock.codigoodt=qODTHijaCODIGOODT.AsFloat) and (fListaStock.consecutivo=qODTHijaCONSECUTIVO.AsInteger) then
    begin
      fListaStock.qDiferenciasAuditoria.close;
      fListaStock.qDiferenciasAuditoria.open;
      while not fListaStock.qDiferenciasAuditoria.Eof  do
      begin
        if  qPresMate.locate('CODIGOMATERIAL',fListaStock.qDiferenciasAuditoriaCODIGOMATERIAL.asfloat,[]) then
         qPresMate.Edit
        else
        begin
          qPresMate.Insert;
          qPresMateCODIGOMATERIAL.AsFloat:=fListaStock.qDiferenciasAuditoriaCODIGOMATERIAL.asfloat;
        end;
        qPresMateCANTIDADMODIFICADANUEVA.asfloat:=fListaStock.qDiferenciasAuditoriaDIFERENCIAACTUAL.asfloat;
        qPresMateCANTIDADMODIFICADADESMBUENA.asfloat:=fListaStock.qDiferenciasAuditoriaDIFERENCIADESMBUENA.asfloat;
        qPresMateCANTIDADMODIFICADADESMMALA.asfloat:=fListaStock.qDiferenciasAuditoriaDIFERENCIADESMALA.asfloat;
        qPresMateMOTIVOMODIFICACIONSTOCK.AsString:='Auditoría Stock de Materiales a '+FOdtUrbanaRural.qGrupoTrabajoNOMBREGRUPOTRABAJO.AsString;
        qPresMate.post;
        fListaStock.qDiferenciasAuditoria.next;
      end;
      query:=TQuery.create(self);
      query.DatabaseName:='BaseDato';
      query.sql.add('UPDATE STOCKGRUPOTRABAJO SET CANTIDADINICIAL=CANTIDADACTUAL,FECHAULTIMOINVENTARIO=TRUNC(SYSDATE)');
      query.sql.add('WHERE CODIGOADMINISTRATIVO='+ fListaStock.qListaStockCODIGOADMINISTRATIVO.AsString);
      query.sql.add('AND CODIGOGRUPOTRABAJO='+ fListaStock.qListaStockCODIGOGRUPOTRABAJO.AsString);
      try
        query.ExecSQL;
      except
      end;
      fListaStock.Close;
    end;
  end;
  BanderaStock:=false;
end;

procedure TFOdtUrbanaRural.qGestionInfraestructuraAfterScroll(
  DataSet: TDataSet);
begin
  VistaPreviaElementoActual;
end;

procedure TFOdtUrbanaRural.qGestionInfraestructuraAfterOpen(
  DataSet: TDataSet);
begin
 { qApoyoElemento.close;
  qApoyoElemento.open; }
  VistaPreviaElementoActual;
end;

procedure TFOdtUrbanaRural.VistaPreviaElementoActual;
begin
  if TipoVisualizacion=mvNinguno then
  begin
    if PanelInfraestructura.Visible then
    begin
      if (qGestionInfraestructura.RecordCount>0) then
      begin
        try
          qApoyoElemento.close;
          qApoyoElemento.open;
          PosicionApoyos.clear;
          PosicionApoyos.Add(qApoyoElementoCODIGOAPOYO.AsString +',0,2');
          MostrarVestido;
          VerFotosApoyo(qApoyoElementoPINTADOAPOYO.AsString);
        except
          on e:exception do
          begin
            showmessage(e.message);
          end;
        end;
      end;
    end
    else
    begin
      qImagenes.Close;
      qImagenes.Open;
    end;
  end;
end;

procedure TFOdtUrbanaRural.qGestionInfraestructuraCalcFields(
  DataSet: TDataSet);
var query:tquery;
begin
  query:=TQuery.create(self);
  try
    query.DatabaseName:='BaseDato';
    query.sql.add('select f_codigointernoelemento(:codigoinfraestructuraunico,:codigotipoelemento) codigointerno,');
    query.sql.add('f_codigofisicoelemento(:codigoinfraestructuraunico,:codigotipoelemento) codigofisico');
    query.sql.add('from dual');
    query.DataSource:=dsGestionInfraestructura;
    query.open;
    qGestionInfraestructuracodigointerno.AsString:=query.fieldbyname('codigointerno').AsString;
    qGestionInfraestructuracodigofisico.AsString:=query.fieldbyname('codigofisico').AsString;
    query.close;
  except
  end;
  query.free;
end;

procedure TFOdtUrbanaRural.qApoyoElementoCalcFields(DataSet: TDataSet);
var query:tquery;
begin
{  query:=TQuery.create(self);
  query.databasename:='BaseDato';
  if (qApoyoElementoCODIGOAPOYO.AsString<>'')then
  begin
    query.sql.add('SELECT PINTADOAPOYO FROM APOYO WHERE CODIGOAPOYO='+qApoyoElementoCODIGOAPOYO.AsString);
    query.open;
    qApoyoElementoPintadoapoyo.asstring:=query.fields[0].asstring;
  end;
  query.free;   }
end;

procedure TFOdtUrbanaRural.qImagenesAfterOpen(DataSet: TDataSet);
begin
  if qImagenes.IsEmpty then
    dDbzImage1.Visible:=false
  else
    dDbzImage1.Visible:=true;
end;

procedure TFOdtUrbanaRural.DBMemoDanosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if length(tdbmemo(sender).Text)>=500 then
    raise exception.Create('La descripción excede la longitud permitida.');
end;

procedure TFOdtUrbanaRural.RegistrarDllImportar;
 var reg: TRegistry;
begin
  reg:= TRegistry.Create;
  reg.RootKey := HKEY_CLASSES_ROOT;
  reg.OpenKey('CLSID\',false);
  if not reg.KeyExists('{421D1C8C-057F-41E0-9F8D-7AF1C2F96F92}') then
    reg.CreateKey('{421D1C8C-057F-41E0-9F8D-7AF1C2F96F92}');

  reg.OpenKey('{421D1C8C-057F-41E0-9F8D-7AF1C2F96F92}\',false);
  reg.WriteString('','Interfaz_XML.Cl_Importar_XML');

  if not reg.KeyExists('InprocServer32') then
    reg.CreateKey('InprocServer32');

  reg.OpenKey('InprocServer32\',false);
  reg.WriteString('','mscoree.dll');
  reg.WriteString('Class','Interfaz_XML.Cl_Importar_XML');
  reg.WriteString('Assembly','Interfaz_XML, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null');

  reg.CloseKey;

  reg.RootKey := HKEY_CLASSES_ROOT;
  reg.OpenKey('CLSID\',false);
  if not reg.KeyExists('{421D1C8C-057F-41E0-9F8D-7AF1C2F96F93}') then
    reg.CreateKey('{421D1C8C-057F-41E0-9F8D-7AF1C2F96F93}');

  reg.OpenKey('{421D1C8C-057F-41E0-9F8D-7AF1C2F96F93}\',false);
  reg.WriteString('','Interfaz_XML.Cl_Exportar_XML');

  if not reg.KeyExists('InprocServer32') then
    reg.CreateKey('InprocServer32');

  reg.OpenKey('InprocServer32\',false);
  reg.WriteString('','mscoree.dll');
  reg.WriteString('Class','Interfaz_XML.Cl_Exportar_XML');
  reg.WriteString('Assembly','Interfaz_XML, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null');

  reg.CloseKey;
  reg.Free;
end;

procedure TFOdtUrbanaRural.GenerarShapes;
var
  query:TQuery;
  ruta:string;
  lista, listaPlanchas: TStringList;
begin
  qODTHijaCalcFields(qODTHija);
  if (qODTHijaCodAsignacionExportacion.asfloat>0) then
  begin
    lista:=TStringlist.Create;
    listaPlanchas:=TStringlist.Create;
    query:=TQuery.create(nil);
    query.DatabaseName:='BaseDato';
    query.sql.add('select codigoapoyo from apoyo a');
    query.sql.add('where exists');
    query.sql.add('(select null from EMG_APOYO e');
    query.sql.add('where e.CODIGOAPOYO=a.CODIGOAPOYO');
    query.sql.add('and e.codigoasignacionemg='+qODTHijaCodAsignacionExportacion.AsString+')');
    query.open;
    ruta := ExtractFilePath(ParamStr(0));
      if ruta[Length(ruta)] <> '\' then
        ruta := ruta + '\';
    ruta:=ruta+'Datos EnerGis Movil\ODT'+qODTHijaCODIGOODT.AsString+'_'+completarcadenaizquierda(qODTHijaCONSECUTIVO.AsString,'0',2);
    ruta:=ruta+'\SHAPES\';
    ForceDirectories(ruta);

    if query.RecordCount>0 then
    begin
      query.First;
      while not query.Eof do
      begin
        Lista.Add(query.Fields[0].asString);
        query.Next;
      end;
    end;
    query.Close;
    query.Free;

    qOdtPlancha.close;
    qOdtPlancha.open;
    if qOdtPlancha.RecordCount>0 then
    begin
      while not qOdtPlancha.Eof do
      begin
        listaplanchas.Add(qOdtPlancha.Fieldbyname('CODIGOPLANCHA').asString);
        qOdtPlancha.Next;
      end;
    end;
    Application.NormalizeTopMosts;
    MostrarMapa;
    BringToFront;
    EMovilExportarCartografiaApoyosPlanchas(Lista,ListaPlanchas,Ruta);
    Application.RestoreTopMosts;
    Lista.Free;
    ListaPlanchas.Free;
  end;
end;

function TFOdtUrbanaRural.GenerarAsignacionOracle(tipo,strafos:string): boolean;
var
  Query:TQuery;
begin
  try
    if (qODTHija.State in [dsEdit,dsInsert])and (qODTHija.UpdateObject<>nil) then
    begin
      qODTHija.Post;
      qODTHija.Edit;
    end;
    Query:=TQuery.Create(nil);
    Query.DatabaseName:='BaseDato';

    procExportarEMG.Prepare;
    procExportarEMG.ExecProc;

    Query.sql.clear;
    Query.sql.Add('UPDATE EMG_ODTASIGNACION');
    Query.sql.Add('SET TIPOEXPORTACION='''+tipo+''',');
    Query.sql.Add('CODIGOESTADOASIGNACION=1,');
    Query.sql.Add('FECHAPROCESO=SYSDATE');
    Query.sql.Add('WHERE CODIGOODT='+qODTHijaCODIGOODT.AsString);
    Query.sql.Add('AND CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString);
    Query.sql.Add('AND TIPODATOORIGEN=''E''');
    Query.ExecSQL;
    Query.Close;

    if ((tipo ='T') or (tipo='B') or (tipo ='X') or (tipo='Z') )and (strafos<>'') then
    begin
      query.sql.clear;
      query.sql.Add('UPDATE EMG_TRAFODIS T ');
      query.sql.Add('SET TIPOEXPORTACION=''T''');
      query.sql.Add('WHERE EXISTS');
      query.sql.Add('(SELECT NULL FROM EMG_ODTASIGNACION O');
      query.sql.Add('WHERE T.CODIGOASIGNACIONEMG=O.CODIGOASIGNACIONEMG');
      query.sql.Add('AND O.CODIGOODT='+qODTHijaCODIGOODT.AsString);
      query.sql.Add('AND O.CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString+')');
      query.sql.Add('AND T.CODIGOTRAFODIS IN('+strafos+')');
      query.ExecSQL;
      query.Close;
      query.sql.clear;
      query.sql.Add('UPDATE TRAFODIS T ');
      query.sql.Add('SET CODIGOESTADOINVENTARIO=''3''');
      query.sql.Add('WHERE T.CODIGOTRAFODIS IN('+strafos+')');
      query.ExecSQL;
    end;
    Query.free;
    Application.ProcessMessages;
    Application.NormalizeTopMosts;
    Application.MessageBox(PChar('Se ha generado la Asignación en la Base de Datos.'+#13+'Se guardarán los cambios de la ODT.'),PChar('Energis'),MB_ICONINFORMATION+MB_OK);
    Application.RestoreTopMosts;
    bbCancelar.Enabled:=false;
    if qtrans.Database.InTransaction then
    begin
      qtrans.Database.Commit;
      qtrans.Database.StartTransaction;
    end;
  except
    on e:exception do
    begin
      showmessage(e.message);
      Application.ProcessMessages;
    end;
  end;

  Application.ProcessMessages;
end;

{procedure TFOdtUrbanaRural.borrarAsignacionEMG(tipo: string);
var query:tquery;
  sl:tstringlist;
  asignacion:double;
begin
  query:=TQuery.create(application);
  query.DatabaseName:='BaseDato';

  query.sql.add('SELECT CODIGOASIGNACIONEMG FROM EMG_ODTASIGNACION');
  query.sql.add('WHERE CODIGOODT='+qODTHijaCODIGOODT.AsString);
  query.sql.add('AND CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString);
  query.sql.add('AND TIPODATOORIGEN='''+tipo+'''');
  query.open;

  asignacion:=0;

  if query.Fields[0].AsString<>'' then
   asignacion:=query.fields[0].AsFloat;

  query.sql.clear;
  query.sql.add('UPDATE APOYO A SET ENREVISIONMOVIL=0');
  query.sql.add('WHERE EXISTS');
  query.sql.add('(SELECT NULL FROM EMG_APOYO E');
  query.sql.add('WHERE CODIGOASIGNACIONEMG='+floattostr(asignacion));
  query.sql.add('AND A.CODIGOAPOYO=E.CODIGOAPOYO)');
  query.ExecSQL;

  sl:=TStringList.create;
  sl.add('WHERE CODIGOASIGNACIONEMG='+ floattostr(asignacion));

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_ODTPRESMATE');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_STOCKGRUPOTRABAJO');
  query.sql.Add(sl.text);
  query.ExecSQL;


  query.sql.clear;
  query.sql.add('DELETE FROM EMG_MATERIALENCAMPO');
  query.sql.Add(sl.text);
  query.ExecSQL;


  query.sql.clear;
  query.sql.add('DELETE FROM EMG_ELEMENTOSELIMINADOS');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_ALUMBRADOPUBLICO');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_DIRECCIONCLIENTESGD');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_FOTOCLIENTE');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_CONDENSADOR');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_TEMPLETEPOSTE');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_DETALLEAPOYO');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_DIRECCIONAPOYO');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_INCIDENTALDUCTO');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_DUCTOEXCAVACION');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_EXCAVACION');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_INCIDENTALAPOYO');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_INTERRUPTORDIS');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_CLIENTEOBSERVACION');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_CLIENTESGD');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_PARARRAYODIS');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_TRAFODISOBSERVACION');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_TRAFODIS');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_TRAMOBT');
  query.sql.Add(sl.text);
  query.ExecSQL;
  query.sql.clear;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_TRAMOMT');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_NODOMT');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_NODOBT');
  query.sql.Add(sl.text);
  query.ExecSQL;


  query.sql.clear;
  query.sql.add('DELETE FROM EMG_APOYO');
  query.sql.Add(sl.text);
  query.ExecSQL;

  query.sql.clear;
  query.sql.add('DELETE FROM EMG_ODTASIGNACION');
  query.sql.Add(sl.text);
  query.ExecSQL;
  Query.Close;
  query.free;
end;}

procedure TFOdtUrbanaRural.sbVistaLateralTrafosClick(Sender: TObject);
var Lista : TStringList;
  qry:Tquery;
  x:integer;
begin
  MinimizarOdtHija;
  Lista := TStringList.Create;
  qry:=Tquery.Create(nil);
  qry.DatabaseName:='BaseDato';
  qOdtTrafodis.close;
  qOdtTrafodis.open;
  while not(qOdtTrafodis.eof) do
  begin
    x:=0;
    qry.SQL.Clear;
    qry.SQL.Add('select DISTINCT N.CODIGOAPOYO FROM NODOBT N');
    qry.SQL.Add('where N.codigoTRAFODIS='+qOdtTrafodisCodigoTrafodis.AsString );
    qry.Open;
    if qry.RecordCount>0 then
    begin
      qry.First;
      while not qry.Eof do
      begin
        Lista.Add(qry.Fields[0].asString+','+inttostr(x)+',0');
        x:=x+20;
        qry.Next;
      end;
    end;
    qOdtTrafodis.next;
  end;
  if Lista.Count>0 then
    MostrarVistaLateralApoyosOdt(Lista,qODTHijaCODIGOODT.asfloat,qODTHijaCONSECUTIVO.asfloat);
  qry.close;
  Lista.Free;
end;



procedure TFOdtUrbanaRural.AbrirConsultas;
begin
  qODTVehiculo.Open;

  qTipoElemento.Open;
  qNivelTension.Open;
  qOdtOpera.Open;
  qTipoTrabajo.Open;
  qTipoActivo.Open;
  qTipoIntervencion.Open;
  qGrupoTrabajo.Open;
  qMedidaSeguridad.Open;
  qf3.open;
  qf4.open;
  qInfraestructura.open;
  qUtilizaEquipos.open;
  qReporte.Open;
  qPresMano.Open;
  qPresMate.Open;
  qMaterial.Open;
  qUnidad.Open;
  qODTHija.Open;
  qODTPadre.Open;
  qODTActividad.Open;
  //Interfaz OW
  qRequisiciones.open;
  qTraslados.open;
  qReintegros.Open;
  qODTApoyo.Open;
  qOdtClienteSgd.Open;
  qODTSobreTiempo.Open;
  qAuxilio.Open;
  qViatico.Open;
  qAdministrativo.open;
  qOdtTrafodis.Open;
  qOdtPlancha.open;
  qMedidaSeguridad.Close;
  qMedidaSeguridad.Open;
  qf3.Close;
  qf3.open;
  qf4.Close;
  qf4.open;
  qInfraestructura.Close;
  qInfraestructura.open;
  qUtilizaEquipos.Close;
  qUtilizaEquipos.open;
  qSerial.close;
  qSerial.open;

  qContratistaIntervenido.Open;
  qEstadoODT.open;
 // qContratoIntervenido.Open;

  ///***Inicio ELP
{  qFormatosPruebas.Open;
  qSeccionesPruebas.Open;
  qSubactividad.Open;
  qPruebasProgramadas.Open;
  ///***Fin ELP
  qSubactividadesOdt.Open;
  qPorcentajeRealizadas.Open;
  qOdtSubactividadDatos.close;
  qOdtSubactividadDatos.open;

  qFormato.Open;
  qPruebasProgramadas.Open;   }
  qGeografico.Open;
  qPresEquipo.Open;
  qOdtFormato.Open;
  qOdtSeccion.Open;
end;

function TFOdtUrbanaRural.ValidarExisteRequisicionMaterial: boolean;
var query:tquery;
begin
  result:=true;
  if qPresMate.Active then
  begin
    if (qPresMateCodigoMaterialEssa.AsString<>'') then
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('select count(*) from odtrequisicion o, '+EsquemaAlmacen+'com_m_requisicion_movi r');
    query.sql.add('where o.codigoodt='+qPresMateCODIGOODT.AsString);
    query.sql.add('and o.consecutivo='+qPresMateCONSECUTIVO.AsString);
    query.sql.add('and o.codigorequisicion=r.COD_REQUISICION');
    query.sql.add('and o.empresa=r.cias_cias');
    query.sql.add('and o.vigencia=r.vigencia');
    query.sql.add('and r.cod_catalogo='+qPresMateCodigoMaterialEssa.AsString);
    query.open;
    if query.Fields[0].AsInteger>0 then
      result:=false;
    query.close;
    query.free;
  end;
end;

procedure TFOdtUrbanaRural.ActualizarOdtDesdeMovil;
var query:tquery;
begin
  if (qODTHija.UpdateObject<>nil)then
  begin
    query:=TQuery.Create(self);
    query.DatabaseName:='BaseDato';
    query.sql.Add('SELECT FECHAINICIOTRABAJO,FECHAFINTRABAJO,OBSERVACION1,OBSERVACION2');
    query.sql.Add('FROM EMG_ODTASIGNACION A');
    query.sql.Add('WHERE A.CODIGOODT='+qODTHijaCODIGOODT.AsString);
    query.sql.Add('AND A.CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString);
    query.sql.Add('AND A.TIPODATOORIGEN=''I''');
    query.open;
    if (query.FieldByName('FECHAINICIOTRABAJO').AsString<>'') then
      qODTHijaFECHAINICIOTRABAJO.AsDateTime:=query.FieldByName('FECHAINICIOTRABAJO').AsDateTime;
    if (query.FieldByName('FECHAFINTRABAJO').AsString<>'') then
      qODTHijaFECHAFINALTRABAJO.AsDateTime:=query.FieldByName('FECHAFINTRABAJO').AsDateTime;
    if (query.FieldByName('OBSERVACION1').AsString<>'') then
      qODTHijaOBSERVACION1.AsString:=query.FieldByName('OBSERVACION1').AsString;
    if (query.FieldByName('OBSERVACION2').AsString<>'') then
      qODTHijaOBSERVACION2.AsString:=query.FieldByName('OBSERVACION2').AsString;
    query.close;
    query.free;
  end;
end;

procedure TFOdtUrbanaRural.ActualizarMaterialDesdeMovil;
var query:tquery;
  ErrorMateriales:string;
begin
  if (qPresMate.UpdateObject<>nil)then
  begin
    query:=TQuery.Create(self);
    query.DatabaseName:='BaseDato';
    query.sql.Add('SELECT CODIGOMATERIAL,CANTIDADCONSUMIDA,CANTIDADRETIRADABUENA,CANTIDADRETIRADAMALA,NOMBREMATERIAL');
    query.sql.Add('FROM EMG_ODTPRESMATE M,EMG_ODTASIGNACION A');
    query.sql.Add('WHERE M.CODIGOASIGNACIONEMG=A.CODIGOASIGNACIONEMG');
    query.sql.Add('AND A.CODIGOODT=:CODIGOODT');
    query.sql.Add('AND A.CONSECUTIVO=:CONSECUTIVO');
    query.sql.Add('AND A.TIPODATOORIGEN=''I''');
    query.open;
    ErrorMateriales:='';
    try
      while not query.Eof do
      begin
        if qPresMate.Locate('CODIGOMATERIAL',VarArrayOf([query.fieldbyname('CODIGOMATERIAL').AsString]),[loCaseInsensitive]) then
          qPresMate.edit
        else
        begin
          qPresMate.insert;
          qPresMateCODIGOMATERIAL.AsFloat:=query.fieldbyname('CODIGOMATERIAL').AsFloat;
        end;
        qPresMateCANTIDADCONSUMIDA.AsFloat:=query.fieldbyname('CANTIDADCONSUMIDA').AsFloat;
        qPresMateCANTIDADRETIRADABUENA.AsFloat:=query.fieldbyname('CANTIDADRETIRADABUENA').AsFloat;
        qPresMateCANTIDADRETIRADAMALA.AsFloat:=query.fieldbyname('CANTIDADRETIRADAMALA').AsFloat;
      end;
    except
      ErrorMateriales:=ErrorMateriales+', '+query.fieldbyname('NOMBREMATERIAL').AsString;
    end;
    ErrorMateriales:=copy(ErrorMateriales,3,length(ErrorMateriales)-2);
  end;
end;

procedure TFOdtUrbanaRural.ValidarInformacin1Click(Sender: TObject);
begin
  ValidarMovil(qODTHijaCODIGOODT.AsFloat,qODTHijaCONSECUTIVO.AsFloat);
end;

procedure TFOdtUrbanaRural.RxDBGrid1EditButtonClick(Sender: TObject);
begin
  ActividadesODT;
end;

procedure TFOdtUrbanaRural.dbgEquipoEditButtonClick(Sender: TObject);
var i:integer;
begin
  try
    fBuscarEquipo:= tfBuscarEquipo.Create(Application);
    if fBuscarEquipo.ShowModal = mrOk then
    begin
      if fBuscarEquipo.dbgEquipo.SelectedRows.Count>0 then
      begin
        for i:=0 to fBuscarEquipo.dbgEquipo.SelectedRows.Count-1 do
        begin
          fBuscarEquipo.qEquipo.BookMark:=fBuscarEquipo.dbgEquipo.SelectedRows.Items[i];
          try
            if (i=0) and (dbgEquipo.Fields[0].text<>'') then
              qPresEquipo.Edit
            else
            begin
              if qPresEquipo.State in [dsInsert] then
              qPresEquipo.Cancel;
              qPresEquipo.Insert;
            end;
            qPresEquipo.FieldbyName('CodigoEquipo').asfloat := fBuscarEquipo.qEquipo.fieldbyName('CodigoEquipo').asfloat;
            qPresEquipo.Post;
            qPresEquipo.Insert;
          except
          on E:Exception do
          begin
            qPresEquipo.Cancel;
          end;
        end;
      end;
      if qPresEquipo.State in [dsInsert] then
        qPresEquipo.Cancel;
      qPresEquipo.Active := False;
      qPresEquipo.Active := True;
      if (not qPresEquipo.IsEmpty) and (qPresEquipoCODIGOEQUIPO.AsFloat = 0) then
        qPresEquipo.Delete;
    end;
  end;
  finally
  fBuscarEquipo.free;
  end;
end;

procedure TFOdtUrbanaRural.dbgEquipoDblClick(Sender: TObject);
begin
  qPresEquipo.Edit;
end;

procedure TFOdtUrbanaRural.AbrirCartografaVistaLateral1Click(
  Sender: TObject);
var
  ListaApoyosVisualizar:tstringlist;
begin
  ListaApoyosVisualizar:=ListarApoyosVer(1);
  VisualizarApoyos(ListaApoyosVisualizar);
end;

procedure TFOdtUrbanaRural.qPresEquipoAfterPost(DataSet: TDataSet);
begin
  qPresEquipo.ApplyUpdates;
  qPresEquipo.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qPresEquipoAfterDelete(DataSet: TDataSet);
begin
  qPresEquipo.ApplyUpdates;
  qPresEquipo.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qPresEquipoAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('CODIGOODT').AsString   := qODTHijaCODIGOODT.AsString;
  DataSet.FieldByName('CONSECUTIVO').AsString := qODTHijaCONSECUTIVO.AsString;
end;

procedure TFOdtUrbanaRural.qPresEquipoCalcFields(DataSet: TDataSet);
begin
  if (qPresEquipoCANTIDAD.Asstring<>'')and(qPresEquipoCOSTOUNITARIO.asstring<>'')then
    qPresEquipoCostoTotal.AsFloat:=qPresEquipoCANTIDAD.AsFloat*qPresEquipoCOSTOUNITARIO.AsFloat;
end;

procedure TFOdtUrbanaRural.VisualizarMaterialAlmacen(ver: boolean);
begin
//Interfaz OW
  {tsMaterialRequisicion.TabVisible:=ver;
  panelMaterialIntervencion.Visible:=ver;
  PanelMaterialReintegro.Visible:=ver;}
end;

procedure TFOdtUrbanaRural.qPresEquipoCODIGOEQUIPOChange(Sender: TField);
var query:tquery;
begin
  if (Sender.AsString<>'') then
  begin
    qPresEquipo.FieldbyName('Cantidad').asinteger := 1;
    query:=TQuery.Create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('select valorhora from equipo');
    query.sql.add('where codigoequipo='+Sender.asstring);
    query.open;
    qPresEquipo.FieldbyName('CostoUnitario').asfloat := query.fieldbyName('ValorHora').asfloat;
    query.free;
  end;
end;

procedure TFOdtUrbanaRural.qODTHijaFECHAINICIOTRABAJOChange(
  Sender: TField);
begin
  if qODTHijaFECHAFINALTRABAJO.AsString <> '' then
  Begin
    CalcularCostos;
  End;
end;

procedure TFOdtUrbanaRural.qODTHijaFECHAFINALTRABAJOChange(Sender: TField);
begin
  if qODTHijaFECHAINICIOTRABAJO.AsString <> '' then
  Begin
    CalcularCostos;
    qODTHijaCODIGOESTADOODTDIA.Asstring:= '6';
  End;
end;

procedure TFOdtUrbanaRural.qODTHijaCODIGOTIPOTRABAJOODTSetText(
  Sender: TField; const Text: String);
begin
  codtipotrabajoanterior:=sender.asstring;
  sender.AsString:=text;
end;

procedure TFOdtUrbanaRural.DBGrid1EditButtonClick(Sender: TObject);
begin
  ActividadesODT;
end;

procedure TFOdtUrbanaRural.CancelarAsignacionEMG;
var query:tquery;
  sl:tstringlist;
  asignacion:double;
  asignacionimportacion:string;
begin
  query:=TQuery.create(application);
  query.DatabaseName:='BaseDato';

  query.sql.add('SELECT CODIGOASIGNACIONEMG FROM EMG_ODTASIGNACION');
  query.sql.add('WHERE CODIGOODT='+qODTHijaCODIGOODT.AsString);
  query.sql.add('AND CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString);
  query.sql.add('AND TIPODATOORIGEN=''E''');
  query.open;
  if query.recordcount>0 then
  begin
    asignacion:=query.FieldByName('CODIGOASIGNACIONEMG').Asfloat;

    query.sql.clear;
    query.sql.add('SELECT CODIGOASIGNACIONEMG FROM EMG_ODTASIGNACION');
    query.sql.add('WHERE CODIGOODT='+qODTHijaCODIGOODT.AsString);
    query.sql.add('AND CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString);
    query.sql.add('AND TIPODATOORIGEN=''I''');
    query.open;
    if query.recordcount>0 then
    begin
      if (query.FieldByName('CODIGOASIGNACIONEMG').AsString<>'') then
      begin
        asignacionimportacion:= query.FieldByName('CODIGOASIGNACIONEMG').AsString;
        query.sql.clear;
        query.sql.add('SELECT CODIGOESTADOASIGNACION,CODIGOASIGNACIONEMG');
        query.sql.add('FROM EMG_ODTASIGNACION');
        query.sql.add('WHERE CODIGOASIGNACIONEMG='+asignacionimportacion);
        query.open;
        if (query.FieldByName('CODIGOESTADOASIGNACION').AsString='3')or
          (query.FieldByName('CODIGOESTADOASIGNACION').AsString='10') then
          raise exception.create('Esta asignación no puede ser cancelada.');
      end;
    end;

    query.sql.clear;
    query.sql.add('UPDATE APOYO A SET ENREVISIONMOVIL=0');
    query.sql.add('WHERE EXISTS');
    query.sql.add('(SELECT NULL FROM EMG_APOYO E');
    query.sql.add('WHERE CODIGOASIGNACIONEMG='+floattostr(asignacion));
    query.sql.add('AND A.CODIGOAPOYO=E.CODIGOAPOYO)');
    query.ExecSQL;

    query.sql.clear;
    query.sql.add('UPDATE EMG_ODTASIGNACION');
    query.sql.add('SET CODIGOESTADOASIGNACION=4');
    query.sql.add('WHERE CODIGOODT='+qODTHijaCODIGOODT.AsString);
    query.sql.add('AND CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString);
    query.ExecSQL;
    showmessage('Asignación cancelada.');
  end
  else
    raise exception.create('No existe una asignación para esta odt hija.');
  query.free;

end;

procedure TFOdtUrbanaRural.ValidacionesExportacionMovil;
var
  query:TQuery;
begin
  if (qODTHijaCODIGOGRUPOTRABAJO.AsString='') then
     raise exception.create('No se puede realizar la exportación hasta que no seleccione un grupo de trabajo.');
  if (qODTPadreCODIGOEJECUTOR.AsString='') then
     raise exception.create('No se puede realizar la exportación hasta que no seleccione quien ejecuta el trabajo en la Odt Padre.');

  query:=TQuery.Create(nil);
  query.DatabaseName:='BaseDato';
  Query.sql.add('SELECT CODIGOASIGNACIONEMG');
  Query.sql.add('FROM EMG_ODTASIGNACION');
  Query.sql.add('WHERE CODIGOODT='+qODTHijaCODIGOODT.AsString);
  Query.sql.add('AND CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString);
  Query.Open;

  if (Query.fieldbyname('CODIGOASIGNACIONEMG').AsString<>'') then
  begin
    query.Close;
    query.Free;
    raise exception.create('No se puede Generar otra asignación porque ya existe una asignación para esta Odt Hija.');
  end;

  query.Close;
  query.Free;
end;

function TFOdtUrbanaRural.ValidarFechasHija(Fecha: TDateTime): String;
var
  query:TQuery;
begin
  result:='';
  query:=TQuery.Create(nil);
  query.DatabaseName:='BaseDato';
  query.sql.Add('select CONSECUTIVO from odtdia');
  query.sql.Add('where codigoodt=:codigooodt');
  query.sql.Add('and consecutivo<>:consecutivo');
  query.sql.Add('and codigogrupotrabajo = :codigoGT');
  query.sql.Add('and fechainiciotrabajo<:fecha');
  query.sql.Add('and fechafinaltrabajo>:fecha');
  query.ParamByName('codigooodt').AsFloat:=qODTHijaCODIGOODT.AsFloat;
  query.ParamByName('consecutivo').AsInteger:=qODTHijaCONSECUTIVO.AsInteger;
  query.ParamByName('codigoGT').AsInteger:=qODTHijaCODIGOGRUPOTRABAJO.AsInteger;
  query.ParamByName('fecha').AsDateTime:=fecha;
  query.Open;
  if not query.IsEmpty then
    result:= query.FieldByname('CONSECUTIVO').AsString;
  query.Close;
  query.Free;
end;

procedure TFOdtUrbanaRural.qODTVehiculoAfterDelete(DataSet: TDataSet);
begin
  qODTVehiculo.ApplyUpdates;
  qODTVehiculo.CommitUpdates;
end;

procedure TFOdtUrbanaRural.VisualizarModoOdt(modo: integer);
var i:integer;
  nodo:TTreeNode;
begin
  Arbol.Items.Clear;
  for i := 0 to slArbol.Count-1 do
  begin
    nodo:=Arbol.Items.AddChild(nil,slArbol[i]);
    nodo.ImageIndex:=0;
    nodo.SelectedIndex:=1;
    nodo.StateIndex:=-1;
  end;
  Arbol.Items[10].Delete;
  case modo of
    1: //Mantenimiento y Operación  / Pérdidas
    begin
      for i := 0 to pmImprimir.Items.Count-1 do
      begin
        if (pmImprimir.Items[i].tag=2) then
          pmImprimir.Items[i].Visible:=false;
      end;
     Arbol.Items[8].Delete;
    end;
    2: //Alumbrado Público
    begin
      Arbol.Items[7].Delete;
      for i := 0 to pmImprimir.Items.Count-1 do
      begin
        if (pmImprimir.Items[i].tag=1) then
          pmImprimir.Items[i].Visible:=false;
      end;
      qUsoAlumbrado.Open;
      qTipoActividadAp.Open;
      qActividadAp.Open;
      qAlumbradoPublico.Open;
      qEventoAP.Open;
    end;
    3: // Pérdidas
    begin
      for i := 0 to pmImprimir.Items.Count-1 do
      begin
        if (pmImprimir.Items[i].tag=2) then
          pmImprimir.Items[i].Visible:=false;
      end;
      Arbol.Items[8].Delete;
    end;
    4: // Pérdidas
    begin
      for i := 0 to pmImprimir.Items.Count-1 do
      begin
        if (pmImprimir.Items[i].tag=2) then
          pmImprimir.Items[i].Visible:=false;
      end;
      Arbol.Items[8].Delete;
    end;
    //Modo Administrativo
    5:
    begin
      Arbol.Items[8].Delete;//Actividades AP
      Arbol.Items[6].Delete;//Infraestructura
      //Arbol.Items[5].Delete;//Equipo
      Arbol.Items[4].Delete;//Materiales
      Arbol.Items[1].Delete;//Reportes
    end;
    else
    begin

    end;
  end;
  Notebook.ActivePage:='INFORMACION';
end;

procedure TFOdtUrbanaRural.qODTPadreCODIGOMODOODTValidate(Sender: TField);
begin
  if Sender.AsString<>'' then
    VisualizarModoOdt(sender.AsInteger);
end;

procedure TFOdtUrbanaRural.tbMovilCancelarClick(Sender: TObject);
begin
  CancelarAsignacionEMG;
end;

procedure TFOdtUrbanaRural.tbMovilCartografiaClick(Sender: TObject);
var Lista : TStringList;
  qry:Tquery;
begin
  Lista := TStringList.Create;
  qry:=Tquery.Create(nil);
  qry.DatabaseName:='BaseDato';
  qry.SQL.Clear;
  qry.sql.add('SELECT CODIGOASIGNACIONEMG FROM EMG_ODTASIGNACION');
  qry.sql.add('WHERE CODIGOODT='+qODTHijaCODIGOODT.AsString);
  qry.sql.add('AND CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString);
  qry.sql.add('AND TIPODATOORIGEN=''E''');
  qry.open;
  if (qry.RecordCount>0) then
  begin
    qry.SQL.Clear;
    qry.SQL.Add('select codigoapoyo from emg_apoyo a,emg_odtasignacion o');
    qry.SQL.Add('where a.codigoasignacionemg=o.codigoasignacionemg');
    qry.SQL.Add('and o.codigoodt='+qODTHijaCODIGOODT.AsString);
    qry.SQL.Add('and o.consecutivo='+qODTHijaCONSECUTIVO.AsString);
    qry.SQL.Add('and o.TIPODATOORIGEN=''E'' ');
    qry.Open;
    if qry.RecordCount>0 then
    begin
      qry.First;
      while not qry.Eof do
      begin
        Lista.Add(qry.Fields[0].asString);
        qry.Next;
      end;
      MinimizarOdtHija;
      MostrarMapa;
      MarcarApoyos(Lista);
    end;
  end
  else
    showmessage('No existe una asignación de EnerGis Móvil para esta Odt Hija.');
  qry.close;
  qry.free;
  Lista.Free;
end;

procedure TFOdtUrbanaRural.tvElementosExportacionChange(Sender: TObject;
  Node: TTreeNode);
begin
 nbElementosExportacion.PageIndex:=node.index;
end;

procedure TFOdtUrbanaRural.TreeView1Change(Sender: TObject;
  Node: TTreeNode);
begin
 nbElementosImportacion.PageIndex:=node.index;
end;

procedure TFOdtUrbanaRural.FormDestroy(Sender: TObject);
begin
  dmTablasEMG.free;
end;

procedure TFOdtUrbanaRural.tsMovilExportacionShow(Sender: TObject);
begin
  dmTablasEMG.FiltrarDatos(qODTHijaCodAsignacionExportacion.AsFloat);
end;

procedure TFOdtUrbanaRural.tsMovilImportacionShow(Sender: TObject);
begin
  dmTablasEMG.FiltrarDatos(qODTHijaCodAsignacionImportacion.AsFloat);
end;

procedure TFOdtUrbanaRural.qPresMateCANTIDADSOLICITADAValidate(
  Sender: TField);
begin
  if qPresMateCANTIDADSOLICITADA.asfloat < 0 then  raise Exception.Create('La cantidad debe ser positiva.');
end;

procedure TFOdtUrbanaRural.qODTPadreAfterOpen(DataSet: TDataSet);
begin
  VisualizarModoOdt(qODTPadreCODIGOMODOODT.AsInteger);
end;

procedure TFOdtUrbanaRural.VisualizacionEventoAP;
var qValidacion: tquery;
begin
  qValidacion:=TQuery.create(self);
  qValidacion.DatabaseName:='BaseDato';
  if qEventoAP.recordcount > 0 then
  begin
    if (qEventoAPCODIGOESTRUCTURA.ASSTRING<>'') then
    begin
      qValidacion.Close;
      qValidacion.SQL.Clear;
      qValidacion.SQL.Add('SELECT DISTINCT E.CODIGOESTRUCTURA, E.NOMBREESTRUCTURA, T.NOMBRETIPOFUENTE,');
      qValidacion.SQL.Add('T1.NOMBRETIPOLUMINARIA, L.POTENCIA, L.NOMBRELAMPARATIPICA, E.CODIGOTIPOESTRUCTURA,');
      qValidacion.SQL.Add('T.CODIGOTIPOFUENTE, T1.CODIGOTIPOLUMINARIA, L.CODIGOLAMPARATIPICA');
      qValidacion.SQL.Add('FROM ESTRUCTURA E, TIPOFUENTE T,');
      qValidacion.SQL.Add(' TIPOLUMINARIA T1, LAMPARATIPICA L');
      qValidacion.SQL.Add('WHERE (E.CODIGOESTRUCTURA = '+qEventoAPCODIGOESTRUCTURA.ASSTRING+')');
      qValidacion.SQL.Add(' AND (T.CODIGOTIPOFUENTE = E.CODIGOTIPOFUENTE)');
      qValidacion.SQL.Add(' AND (T1.CODIGOTIPOLUMINARIA = E.CODIGOTIPOLUMINARIA)');
      qValidacion.SQL.Add(' AND (L.CODIGOLAMPARATIPICA = E.CODIGOLAMPARATIPICA)');
      qValidacion.Open;
      if qValidacion.RecordCount = 0 then
        raise Exception.Create('Esta estructura no existe...')
      else
      begin
        if (qValidacion.FieldByName('CodigoEstructura').asinteger <> 0) and
         (qValidacion.FieldByName('CodigoTipoEstructura').asstring <> '02')
        then raise Exception.Create('La estructura no corresponde a una Lámpara de AP');

        lbEstructura.caption := qValidacion.FieldByName('NombreEstructura').AsString;
        lbTipoFuente.caption := qValidacion.FieldByName('CodigoTipoFuente').AsString+'-'+qValidacion.FieldByName('NombreTipoFuente').AsString;
        lbTipoLuminaria.caption := qValidacion.FieldByName('CodigoTipoLuminaria').AsString+'-'+qValidacion.FieldByName('NombreTipoLuminaria').AsString;
        lbLamparaTipica.caption := qValidacion.FieldByName('CodigoLamparaTipica').AsString+'-'+qValidacion.FieldByName('NombreLamparaTipica').AsString;
      end;
   end;
   if (qEventoAPCODIGOOBSERVACION.AsString<>'') then
   begin
      qValidacion.sql.clear;
      qValidacion.sql.Add('SELECT NOMBREOBSERVACION FROM OBSERVACION WHERE CODIGOOBSERVACION='+qEventoAPCODIGOOBSERVACION.AsString);
      qValidacion.Open;
      lbobservacion.Caption:=qValidacion.FieldByName('NOMBREOBSERVACION').AsString;
   end;
  end;
  qValidacion.free;
end;

procedure TFOdtUrbanaRural.qEventoAPAfterScroll(DataSet: TDataSet);
begin
  VisualizacionEventoAP;
end;

procedure TFOdtUrbanaRural.sbVerTrafoCartografiaClick(Sender: TObject);
var Lista : TStringList;
  qry:Tquery;
begin
  Lista := TStringList.Create;
  qry:=Tquery.Create(nil);
  qry.DatabaseName:='BaseDato';
  qOdtTrafodis.close;
  qOdtTrafodis.open;
  while not(qOdtTrafodis.eof) do
  begin
    qry.SQL.Clear;
    qry.SQL.Add('select DISTINCT N.CODIGOAPOYO FROM NODOBT N');
    qry.SQL.Add('where N.codigoTRAFODIS='+qOdtTrafodisCodigoTrafodis.AsString );
    qry.Open;
    if qry.RecordCount>0 then
    begin
      qry.First;
      while not qry.Eof do
      begin
        Lista.Add(qry.Fields[0].asString);
        qry.Next;
      end;
    end;
    qOdtTrafodis.next;
  end;
  qry.close;
  MinimizarOdtHija;
  MostrarMapa;
  if lista.Count>0 then
    MarcarApoyos(Lista);
  Lista.Free;
end;

procedure TFOdtUrbanaRural.sbImagenTrafoClick(Sender: TObject);
begin
  if not qImagenesTrafo.Active then
  begin
     qImagenesTrafo.Active := True;
     pImagenTrafo.Visible:=true;
  end
  else
  begin
     qImagenesTrafo.Active := false;
     pImagenTrafo.Visible:=false;
  end;
end;

procedure TFOdtUrbanaRural.dbgTrafoDisDblClick(Sender: TObject);
begin
  //si está en modo edición la odt hija
  if qOdtTrafodis.UpdateObject<>nil then
    qOdtTrafodis.Edit
  else
    showmessage('Esta Odt hija no se encuentra en modo edición.');
end;

procedure TFOdtUrbanaRural.dbgTrafoDisEditButtonClick(Sender: TObject);
var punto:TPoint;
begin

end;

procedure TFOdtUrbanaRural.dbgApoyoEditButtonClick(Sender: TObject);
var punto:TPoint;
begin

end;

procedure TFOdtUrbanaRural.sbImagenApoyoClick(Sender: TObject);
begin
  if not qImagenesApoyo.Active then
  begin
     qImagenesApoyo.Active := True;
     PImagenApoyo.Visible:=true;
  end
  else
  begin
     qImagenesApoyo.Active := false;
     PImagenApoyo.Visible:=false;
  end;
end;

procedure TFOdtUrbanaRural.sbVerMaterialesTrafoClick(Sender: TObject);
var i:integer;
  cadena,cadena2:string;
begin
  cadena:='';
  cadena2:='';
  fMaterialesEstructura := TfMaterialesEstructura.Create(Application);
  fMaterialesEstructura.qMaterialesEstructura.Close;
  fMaterialesEstructura.qMaterialesEstructura.Params[0].asinteger := qOdtTrafodisCodigoEstructura.AsInteger;
  fMaterialesEstructura.qMaterialesEstructura.Open;
  try
    if fMaterialesEstructura.ShowModal = mrOk then
    begin
      if fMaterialesEstructura.DBGridBuscarMaterial.SelectedRows.Count>0 then
      begin
        for i:=0 to fMaterialesEstructura.DBGridBuscarMaterial.SelectedRows.Count-1 do
        begin
          if fMaterialesEstructura.qMaterialesEstructura.fieldbyName('CodigoMaterialEssa').asstring<>'' then
          begin
            fMaterialesEstructura.qMaterialesEstructura.BookMark:=fMaterialesEstructura.DBGridBuscarMaterial.SelectedRows.Items[i];
            try
              if not (qPresMate.Locate('CODIGOMATERIAL',fMaterialesEstructura.qMaterialesEstructura.fieldbyName('CodigoMaterialEssa').asstring,[])) then
              begin
                qPresMate.Insert;
                qPresMate.FieldbyName('CodigoMaterial').asstring :=fMaterialesEstructura.qMaterialesEstructura.fieldbyName('CodigoMaterialEssa').asstring;
                qPresMate.FieldbyName('cantidadsolicitada').asfloat:= 1;
                qPresMate.Post;
              end
              else
              begin
                qPresMate.Edit;
                qPresMate.FieldbyName('cantidadsolicitada').asfloat:= qPresMate.FieldbyName('cantidadsolicitada').asfloat+1;
                qPresMate.Post;
//                cadena2:=cadena2 +fMaterialesEstructura.qMaterialesEstructuraNOMBREMATERIAL.AsString + Chr(13);
              end;
            except
              on E:Exception do
              begin
                showmessage(e.message);
                qPresMate.Cancel;
              end;
            end;
          end
          else
          begin
            cadena:=cadena +fMaterialesEstructura.qMaterialesEstructuraNOMBREMATERIAL.AsString + Chr(13);
          end;
        end;
        if qPresMate.State in [dsInsert] then
          qPresMate.Cancel;
        qPresMate.Active := False;
        qPresMate.Active := True;
        if (not qPresMate.IsEmpty) and (qPresMateCODIGOMATERIAL.AsFloat = 0) then
          qPresMate.Delete;
      end;
    end;
    if cadena<>'' then
      showmessage('No se encontraron los siguientes materiales :'+ chr(13)+cadena);
    if cadena2<>'' then
      showmessage('Los siguientes materiales ya se encontraban agregados :'+ chr(13)+cadena2);
  finally
    fMaterialesEstructura.free;
  end;
end;

procedure TFOdtUrbanaRural.SeleccionarApoyosdeListado1Click(
  Sender: TObject);
begin
  MinimizarOdtHija;
  SeleccionarApoyoLista;
end;

procedure TFOdtUrbanaRural.qODTVehiculoCalcFields(DataSet: TDataSet);
var query:tquery;
begin
 if qODTVehiculoCODIGOVEHICULO.AsString<>'' then
  begin
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.Add('SELECT T.NOMBRETIPOVEHICULO FROM VEHICULO V,TIPOVEHICULO T');
    query.sql.Add('WHERE V.CODIGOTIPOVEHICULO=T.CODIGOTIPOVEHICULO');
    query.sql.Add('AND V.CODIGOVEHICULO='''+qODTVehiculoCODIGOVEHICULO.AsString+'''');
    query.open;
    qODTVehiculoNombreTipoVehiculo.AsString:=query.fieldbyname('NOMBRETIPOVEHICULO').AsString;
    query.free;
  end;
end;

procedure TFOdtUrbanaRural.sbBuscarTrafodisClick(Sender: TObject);
begin
  if qOdtTrafodis.UpdateObject<>nil then
  begin
    if not (qOdtTrafodis.State in [dsEdit,dsInsert]) then
      qOdtTrafodis.edit;
    fBuscarTrafoDis := tfBuscarTrafoDis.Create(Application);
    try
      if fBuscarTrafoDis.ShowModal=mrok then
        qOdtTrafodisPINTADOTRAFODIS.AsString:=fBuscarTrafoDis.qTrafodisPINTADOTRAFODIS.AsString
      else
        qOdtTrafodis.Cancel;
    finally
      fBuscarApoyo.Free;
    end;
  end;
end;

procedure TFOdtUrbanaRural.sbBuscarTrafodisCartografiaClick(
  Sender: TObject);
begin
  MinimizarOdtHija;
  MostrarMapa;
  if (qODTHijaCODIGOGEOGRAFICO.AsString<>'') then
    BuscarBarrio(qODTHijaCODIGOGEOGRAFICO.AsString,true);
  SetElementoOdt('T2');
end;

procedure TFOdtUrbanaRural.sbBuscarTrafodisListaClick(Sender: TObject);
begin
  MinimizarOdtHija;
  SeleccionarTrafoDisLista;
end;

procedure TFOdtUrbanaRural.sbBuscarApoyoClick(Sender: TObject);
begin
  if qODTApoyo.UpdateObject<>nil then
  begin
    if not (qODTApoyo.State in [dsEdit,dsInsert]) then
      qODTApoyo.edit;
    fBuscarApoyo := TfBuscarApoyo.Create(Application);
    if fBuscarApoyo.ShowModal=mrok then
      qODTApoyoPINTADOAPOYO.AsString:=fBuscarApoyo.qApoyoPINTADOAPOYO.AsString
    else
      qOdtTrafodis.Cancel;
    fBuscarApoyo.Free;
  end;
end;

procedure TFOdtUrbanaRural.sbSeleccionarApoyosTopologiaClick(
  Sender: TObject);
begin
  if (qODTHijaCODIGOCIRCUITO.AsString='')then
    raise Exception.Create('Debe ingresar el código del Circuito');
  MinimizarOdtHija;
  SeleccionarRamalCircuito(qODTHijaCODIGOCIRCUITO.AsString);
end;

procedure TFOdtUrbanaRural.SpeedButton2Click(Sender: TObject);
var punto:tpoint;
begin
  punto:= panel79.ClientToScreen(Classes.Point(tbutton(Sender).Left,tbutton(Sender).top));
  pmApoyo.Popup(punto.x+10, punto.y+10);
end;

procedure TFOdtUrbanaRural.ListadodeNodosdeMediaTensin1Click(
  Sender: TObject);
begin
  MinimizarOdtHija;
  SeleccionarNodoMtLista;
end;

procedure TFOdtUrbanaRural.ListadodeNodosdeBajaTensin1Click(
  Sender: TObject);
begin
  MinimizarOdtHija;
  SeleccionarNodoBTLista;
end;

procedure TFOdtUrbanaRural.ListadodeDetalledeApoyos1Click(Sender: TObject);
begin
  MinimizarOdtHija;
  SeleccionarDetalleApoyoLista;
end;

procedure TFOdtUrbanaRural.ListadodeTempletesdeApoyo1Click(
  Sender: TObject);
begin
  MinimizarOdtHija;
//  SeleccionarTempleteApoyoLista;
end;

procedure TFOdtUrbanaRural.ListadodeTramosdeMediaTensin1Click(
  Sender: TObject);
begin
  MinimizarOdtHija;
  SeleccionarTramoMTLista;
end;

procedure TFOdtUrbanaRural.ListadodeTransformadoresdeDistribucin1Click(
  Sender: TObject);
begin
  MinimizarOdtHija;
  SeleccionarTrafoDisLista;
end;

procedure TFOdtUrbanaRural.ListadodeInterruptoresdeDistribucin1Click(
  Sender: TObject);
begin
  MinimizarOdtHija;
  SeleccionarInterruptorDisLista;
end;

procedure TFOdtUrbanaRural.ListadodePararrayosdeDistribucin1Click(
  Sender: TObject);
begin
  MinimizarOdtHija;
  SeleccionarPararrayoLista;
end;

procedure TFOdtUrbanaRural.ListadodeTramosdeBajaTensin1Click(
  Sender: TObject);
begin
  MinimizarOdtHija;
  SeleccionarTramoBTLista;
end;

procedure TFOdtUrbanaRural.ListadodeLamparas1Click(Sender: TObject);
begin
  MinimizarOdtHija;
  SeleccionarLamparaAPLista;
end;

procedure TFOdtUrbanaRural.ListasdeExcavacionesdeDistribucin1Click(
  Sender: TObject);
begin
  MinimizarOdtHija;
  SeleccionarExcavacionLista;
end;

procedure TFOdtUrbanaRural.ListasdeDuctosdeExcavaciones1Click(
  Sender: TObject);
begin
  MinimizarOdtHija;
  SeleccionarDuctoExcavacionLista;
end;

procedure TFOdtUrbanaRural.ListadodeCondensadores1Click(Sender: TObject);
begin
  MinimizarOdtHija;
  SeleccionarCondensadorLista;
end;

procedure TFOdtUrbanaRural.SpeedButton3Click(Sender: TObject);
begin
  MinimizarOdtHija;
end;

function TFOdtUrbanaRural.GenerarAsignacionSdf: Boolean;
var
  query:TQuery;
  Servidor,Usuario,ClaveUsuario,Esquema:string;
  ruta,carpeta:string;
begin
  try
    ruta := RutaAsignacionMovil;
    carpeta := DirectorioAsignacionMovil;
    Servidor:=qODTHija.Database.Params.Values['SERVER NAME'];

    Usuario:=qODTHija.Database.Params.Values['USER NAME'];
    ClaveUsuario:=qODTHija.Database.Params.Values['PASSWORD'];
    query:=TQuery.Create(nil);
    query.DatabaseName:='BaseDato';
    query.sql.text:='SELECT sys_context(''USERENV'', ''CURRENT_SCHEMA'') FROM dual';
    query.open;
    esquema:=Query.fields[0].AsString;
    query.Close;
    query.Free;

    // llamado a dll de Eddie López Exportar a archivos Sdf
    Application.NormalizeTopMosts;
    Result:= Exportar(ruta+'\'+carpeta+'\',Servidor,usuario,ClaveUsuario,esquema,qODTHijaCODIGOODT.AsString,qODTHijaCONSECUTIVO.AsString);
    Application.RestoreTopMosts;
    Application.ProcessMessages;
  except
    on e:Exception do
    begin
      Result:= False;
      showmessage(e.message);
    end;
  end;
end;

procedure TFOdtUrbanaRural.ToolButton1Click(Sender: TObject);
begin
  if VerificarConexionDispositivoMovil then
    showmessage('El Dispositivo se encuentra conectado.')
  else
    showmessage('El Dispositivo No se encuentra conectado.')  
end;

procedure TFOdtUrbanaRural.ToolButton2Click(Sender: TObject);
begin
  CancelarAsignacionEMG;
end;


procedure TFOdtUrbanaRural.ImportarAsignacionEMG;
begin
  MinimizarOdtHija;
  if Application.MessageBox('Desea Importar la asignación desde el dispositivo móvil?','Confirmación',MB_YESNO)=idYes then
  begin
    if not(ImportarAsignacionMovil(RutaAsignacionMovil,DirectorioAsignacionMovil)) then
      exit;
  end;
  ImportarAsignacionSdf;
end;

procedure TFOdtUrbanaRural.GenerarAsignacionMovil(tipo: TTipoAsignacion);
  procedure InsertarApoyosPlanchasOdt;
  var
    query:TQuery;
  begin
    query:=TQuery.create(nil);
    query.DatabaseName:='BaseDato';
    qOdtPlancha.close;
    qOdtPlancha.open;
    while not(qOdtPlancha.eof) do
    begin
      query.Close;
      query.sql.clear;
      query.sql.Add('INSERT INTO EMG_INDICEELEMENTO1');
      query.sql.Add(' select DISTINCT A.CODIGOINFRAESTRUCTURAUNICO,''01'',A.CODIGOESTRUCTURA from APOYO A');
      query.sql.Add(' where A.codigoplancha='''+qOdtPlanchaCODIGOPLANCHA.AsString+'''');
      query.ExecSQL;
      qOdtPlancha.Next;
    end;
    query.Close;
    query.Free;
  end;
var
  query:TQuery;
  i:integer;
  ruta,carpeta,sApoyosEnRevision,sOdts,sTrafos,tipoA:string;
  RutaCarpetaDestinoSFTP: String;
  sCodTrafoDis, sNomSDF: string;
begin
  sCodTrafoDis:='';
  If tipo <> ExpVacia then  MinimizarOdtHija;
  ExportacionExitosa:=false;
  ValidacionesExportacionMovil;

  query:=TQuery.Create(nil);
  query.DatabaseName:='BaseDato';
  query.sql.clear;
  query.sql.Add('delete from EMG_INDICEELEMENTO1');
  query.ExecSQL;
  query.Close;

  case tipo of
    ExpVacia:  //Vacia
    Begin
      Tipoa := 'V';
    end;
    ExpApoyo:  //Apoyo
    begin
      tipoa:='A';
      qODTApoyo.close;
      qODTApoyo.open;
      while not(qODTApoyo.eof) do
      begin
        query.Close;
        query.sql.clear;
        query.sql.Add('INSERT INTO EMG_INDICEELEMENTO1');
        query.sql.Add('(select A.CODIGOINFRAESTRUCTURAUNICO,''01'',A.CODIGOESTRUCTURA from APOYO A');
        query.sql.Add(' WHERE A.PINTADOAPOYO='''+ qODTApoyoPINTADOAPOYO.AsString+''')');
        query.ExecSQL;
        qODTApoyo.Next;
      end;

      Query.Close;
      query.sql.clear;
      query.sql.add('select a.codigoapoyo');
      query.sql.add('from emg_indiceelemento1 i,apoyo a');
      query.sql.add('where a.codigoinfraestructuraunico=i.codigoinfraestructuraunico');
      query.sql.add('and a.enrevisionmovil=1');
      query.open;
      sApoyosEnRevision:='';
      while not(query.eof) do
      begin
        sApoyosEnRevision:= sApoyosEnRevision + ','+query.fieldbyname('codigoapoyo').AsString ;
        query.next;
      end;
      query.Close;

      if sApoyosEnRevision<>'' then
      begin
        sApoyosEnRevision:=copy(sApoyosEnRevision,2,length(sApoyosEnRevision));
        query.sql.clear;
        query.sql.add('select distinct codigoodt from emg_odtasignacion o');
        query.sql.add('where exists');
        query.sql.add('(select null from emg_apoyo a');
        query.sql.add('where codigoapoyo in ('+sApoyosEnRevision+')');
        query.sql.add('and a.codigoasignacionemg=o.codigoasignacionemg');
        query.sql.add('and o.codigoestadoasignacion<>10)');
        query.open;
        sOdts:='';
        while not(query.eof) do
        begin
          sOdts:= sOdts + ','+query.fieldbyname('codigoodt').AsString ;
          query.next;
        end;
        query.Close;
        query.Free;

        if (sOdts<>'') then
          sOdts:= 'En las Odts '+copy(sOdts,2,length(sOdts))+'.';

        raise exception.create('Esta asignación no puede ser generada porque contiene '+#13+
        'los siguientes apoyos que se encuentran en Revisión por EnerGis Móvil: '+#13+sApoyosEnRevision+#13+sOdts);
      end;
    end;
    ExpTrafo://Trafos
    begin
      tipoa:='T';
      qOdtTrafodis.close;
      qOdtTrafodis.open;
      strafos :='';
      while not(qOdtTrafodis.eof) do
      begin
        query.Close;
        query.sql.clear;
        query.sql.Add('INSERT INTO EMG_INDICEELEMENTO1');
        query.sql.Add(' select DISTINCT A.CODIGOINFRAESTRUCTURAUNICO,''01'',A.CODIGOESTRUCTURA from APOYO A');
        query.sql.Add(' WHERE EXISTS');
        query.sql.Add(' (SELECT NULL FROM NODOBT N');
        query.sql.Add(' where N.codigoTRAFODIS='+qOdtTrafodisCodigoTrafodis.AsString);
        query.sql.Add(' AND N.CODIGOAPOYO=A.CODIGOAPOYO)');
        query.ExecSQL;
        strafos := sTrafos +','+qOdtTrafodisCodigoTrafodis.AsString ;
        qOdtTrafodis.Next;
      end;
      query.Close;

      if (strafos<>'') then
      begin
        strafos:= copy(strafos,2,length(strafos));

        query.sql.clear;
        Query.sql.add('SELECT CODIGOTRAFODIS');
        Query.sql.add('FROM TRAFODIS ');
        Query.sql.add('WHERE CODIGOTRAFODIS IN ('+strafos+')');
        Query.sql.add('AND CODIGOESTADOINVENTARIO<>4');
        Query.Open;
        if (Query.fieldbyname('CODIGOTRAFODIS').AsString<>'') then
        begin
          sCodTrafoDis := Query.fieldbyname('CODIGOTRAFODIS').AsString;
          query.Close;
          query.Free;
          raise Exception.Create('Esta asignación no puede ser exportada porque el trafodis '
                                       +sCodTrafoDis+char(13)+'No se encuentra en operación.');
        end;

        Query.Close;
        query.sql.clear;
        query.sql.add('select a.codigoapoyo');
        query.sql.add('from emg_indiceelemento1 i,apoyo a');
        query.sql.add('where a.codigoinfraestructuraunico=i.codigoinfraestructuraunico');
        query.sql.add('and a.enrevisionmovil=1');
        query.open;
        sApoyosEnRevision:='';
        while not(query.eof) do
        begin
          sApoyosEnRevision:= sApoyosEnRevision + ','+query.fieldbyname('codigoapoyo').AsString ;
          query.next;
        end;
        query.Close;

        if sApoyosEnRevision<>'' then
        begin
          sApoyosEnRevision:=copy(sApoyosEnRevision,2,length(sApoyosEnRevision));
          query.sql.clear;
          query.sql.add('select distinct codigoodt from emg_odtasignacion o');
          query.sql.add('where exists');
          query.sql.add('(select null from emg_apoyo a');
          query.sql.add('where codigoapoyo in ('+sApoyosEnRevision+')');
          query.sql.add('and a.codigoasignacionemg=o.codigoasignacionemg');
          query.sql.add('and o.codigoestadoasignacion<>10)');
          query.open;
          sOdts:='';
          while not(query.eof) do
          begin
            sOdts:= sOdts + ','+query.fieldbyname('codigoodt').AsString ;
            query.next;
          end;
          query.Close;
          query.Free;

          if (sOdts<>'') then
            sOdts:= 'En las Odts '+copy(sOdts,2,length(sOdts))+'.';

          raise exception.create('Esta asignación no puede ser generada porque contiene '+#13+
          'los siguientes apoyos que se encuentran en Revisión por EnerGis Móvil: '+#13+sApoyosEnRevision+#13+sOdts);
        end;
      end;
    end;
    ExpPlancha:
    begin
      tipoa:='P';
      InsertarApoyosPlanchasOdt; 
      Query.Close;
      query.sql.clear;
      query.sql.add('select a.codigoapoyo');
      query.sql.add('from emg_indiceelemento1 i,apoyo a');
      query.sql.add('where a.codigoinfraestructuraunico=i.codigoinfraestructuraunico');
      query.sql.add('and a.enrevisionmovil=1');
      query.open;
      sApoyosEnRevision:='';
      while not(query.eof) do
      begin
        sApoyosEnRevision:= sApoyosEnRevision + ','+query.fieldbyname('codigoapoyo').AsString ;
        query.next;
      end;
      query.Close;

      if sApoyosEnRevision<>'' then
      begin
        sApoyosEnRevision:=copy(sApoyosEnRevision,2,length(sApoyosEnRevision));
        query.sql.clear;
        query.sql.add('select distinct codigoodt from emg_odtasignacion o');
        query.sql.add('where exists');
        query.sql.add('(select null from emg_apoyo a');
        query.sql.add('where codigoapoyo in ('+sApoyosEnRevision+')');
        query.sql.add('and a.codigoasignacionemg=o.codigoasignacionemg');
        query.sql.add('and o.codigoestadoasignacion<>10)');
        query.open;
        sOdts:='';
        while not(query.eof) do
        begin
          sOdts:= sOdts + ','+query.fieldbyname('codigoodt').AsString ;
          query.next;
        end;
        query.Close;
        query.Free;

        if (sOdts<>'') then
          sOdts:= 'En las Odts '+copy(sOdts,2,length(sOdts))+'.';

        raise exception.create('Esta asignación no puede ser generada porque contiene '+#13+
        'los siguientes apoyos que se encuentran en Revisión por EnerGis Móvil: '+#13+sApoyosEnRevision+#13+sOdts);
      end;
    End;
    ExpCircuito://Circuito
    begin
      tipoa:='C';
      if qODTHijaCODIGOCIRCUITO.AsString<>'' then
      begin
        query.Close;
        query.sql.clear;
        query.sql.Add('INSERT INTO EMG_INDICEELEMENTO1');
        query.sql.Add(' select DISTINCT A.CODIGOINFRAESTRUCTURAUNICO,''01'',A.CODIGOESTRUCTURA from APOYO A');
        query.sql.Add(' WHERE EXISTS');
        query.sql.Add(' (SELECT NULL FROM NODOMT N');
        query.sql.Add(' where N.CODIGOCIRCUITO='''+qODTHijaCODIGOCIRCUITO.AsString+'''');
        query.sql.Add(' AND N.CODIGOAPOYO=A.CODIGOAPOYO)');
        query.ExecSQL;
        Query.Close;
      end
      else
      begin
        Query.Close;
        query.free;
        raise Exception.Create('Debe ingresar el código del circuito.');
      end;
    end;
    ExpMixtoTA:
    begin
      tipoa:='W';
      qOdtTrafodis.close;
      qOdtTrafodis.open;
      strafos :='';
      while not(qOdtTrafodis.eof) do
      begin
        query.Close;
        query.sql.clear;
        query.sql.Add('INSERT INTO EMG_INDICEELEMENTO1');
        query.sql.Add(' select DISTINCT A.CODIGOINFRAESTRUCTURAUNICO,''01'',A.CODIGOESTRUCTURA from APOYO A');
        query.sql.Add(' WHERE EXISTS');
        query.sql.Add(' (SELECT NULL FROM NODOBT N');
        query.sql.Add(' where N.codigoTRAFODIS='+qOdtTrafodisCodigoTrafodis.AsString);
        query.sql.Add(' AND N.CODIGOAPOYO=A.CODIGOAPOYO)');
        query.ExecSQL;
        strafos := sTrafos +','+qOdtTrafodisCodigoTrafodis.AsString ;
        qOdtTrafodis.Next;
      end;
      query.Close;

      if (strafos<>'') then
      begin
        strafos:= copy(strafos,2,length(strafos));

        query.sql.clear;
        Query.sql.add('SELECT CODIGOTRAFODIS');
        Query.sql.add('FROM TRAFODIS ');
        Query.sql.add('WHERE CODIGOTRAFODIS IN ('+strafos+')');
        Query.sql.add('AND CODIGOESTADOINVENTARIO<>4');
        Query.Open;
        if (Query.fieldbyname('CODIGOTRAFODIS').AsString<>'') then
        begin
          sCodTrafoDis := Query.fieldbyname('CODIGOTRAFODIS').AsString;
          query.Close;
          query.Free;
          raise Exception.Create('Esta asignación no puede ser exportada porque el trafodis '
                                       +sCodTrafoDis+char(13)+'No se encuentra en operación.');
        end;
        query.Close;

        qODTApoyo.close;
        qODTApoyo.open;
        while not(qODTApoyo.eof) do
        begin
          query.Close;
          query.sql.clear;
          query.sql.Add('INSERT INTO EMG_INDICEELEMENTO1');
          query.sql.Add('(select A.CODIGOINFRAESTRUCTURAUNICO,''01'',A.CODIGOESTRUCTURA from APOYO A');
          query.sql.Add(' WHERE A.PINTADOAPOYO='''+ qODTApoyoPINTADOAPOYO.AsString+''')');
          query.ExecSQL;
          qODTApoyo.Next;
        end;

        Query.Close;
        query.sql.clear;
        query.sql.add('select a.codigoapoyo');
        query.sql.add('from emg_indiceelemento1 i,apoyo a');
        query.sql.add('where a.codigoinfraestructuraunico=i.codigoinfraestructuraunico');
        query.sql.add('and a.enrevisionmovil=1');
        query.open;
        sApoyosEnRevision:='';
        while not(query.eof) do
        begin
          sApoyosEnRevision:= sApoyosEnRevision + ','+query.fieldbyname('codigoapoyo').AsString ;
          query.next;
        end;
        query.Close;

        if sApoyosEnRevision<>'' then
        begin
          sApoyosEnRevision:=copy(sApoyosEnRevision,2,length(sApoyosEnRevision));
          query.sql.clear;
          query.sql.add('select distinct codigoodt from emg_odtasignacion o');
          query.sql.add('where exists');
          query.sql.add('(select null from emg_apoyo a');
          query.sql.add('where codigoapoyo in ('+sApoyosEnRevision+')');
          query.sql.add('and a.codigoasignacionemg=o.codigoasignacionemg');
          query.sql.add('and o.codigoestadoasignacion<>10)');
          query.open;
          sOdts:='';
          while not(query.eof) do
          begin
            sOdts:= sOdts + ','+query.fieldbyname('codigoodt').AsString ;
            query.next;
          end;
          query.Close;
          query.Free;

          if (sOdts<>'') then
            sOdts:= 'En las Odts '+copy(sOdts,2,length(sOdts))+'.';

          raise exception.create('Esta asignación no puede ser generada porque contiene '+#13+
          'los siguientes apoyos que se encuentran en Revisión por EnerGis Móvil: '+#13+sApoyosEnRevision+#13+sOdts);
        end;
      end
      else
        raise exception.create('No existen trafos para realizar una asignación de este tipo.');
    end;

    ExpMixtoTP:
    begin
      tipoa:='X';
      qOdtTrafodis.close;
      qOdtTrafodis.open;
      strafos :='';
      while not(qOdtTrafodis.eof) do
      begin
        query.Close;
        query.sql.clear;
        query.sql.Add('INSERT INTO EMG_INDICEELEMENTO1');
        query.sql.Add(' select DISTINCT A.CODIGOINFRAESTRUCTURAUNICO,''01'',A.CODIGOESTRUCTURA from APOYO A');
        query.sql.Add(' WHERE EXISTS');
        query.sql.Add(' (SELECT NULL FROM NODOBT N');
        query.sql.Add(' where N.codigoTRAFODIS='+qOdtTrafodisCodigoTrafodis.AsString);
        query.sql.Add(' AND N.CODIGOAPOYO=A.CODIGOAPOYO)');
        query.ExecSQL;
        strafos := sTrafos +','+qOdtTrafodisCodigoTrafodis.AsString ;
        qOdtTrafodis.Next;
      end;
      query.Close;

      if (strafos<>'') then
      begin
        strafos:= copy(strafos,2,length(strafos));

        query.sql.clear;
        Query.sql.add('SELECT CODIGOTRAFODIS');
        Query.sql.add('FROM TRAFODIS ');
        Query.sql.add('WHERE CODIGOTRAFODIS IN ('+strafos+')');
        Query.sql.add('AND CODIGOESTADOINVENTARIO<>4');
        Query.Open;
        if (Query.fieldbyname('CODIGOTRAFODIS').AsString<>'') then
        begin
          sCodTrafoDis := Query.fieldbyname('CODIGOTRAFODIS').AsString;
          query.Close;
          query.Free;
          raise Exception.Create('Esta asignación no puede ser exportada porque el trafodis '
                                       +sCodTrafoDis+char(13)+'No se encuentra en operación.');
        end;
        query.Close;

        {qODTApoyo.close;
        qODTApoyo.open;
        while not(qODTApoyo.eof) do
        begin
          query.sql.clear;
          query.sql.Add('INSERT INTO EMG_INDICEELEMENTO1');
          query.sql.Add('(select A.CODIGOINFRAESTRUCTURAUNICO,''01'',A.CODIGOESTRUCTURA from APOYO A');
          query.sql.Add(' WHERE A.PINTADOAPOYO='''+ qODTApoyoPINTADOAPOYO.AsString+''')');
          query.ExecSQL;
          qODTApoyo.Next;
        end;}

        InsertarApoyosPlanchasOdt;

        Query.Close;
        query.sql.clear;
        query.sql.add('select a.codigoapoyo');
        query.sql.add('from emg_indiceelemento1 i,apoyo a');
        query.sql.add('where a.codigoinfraestructuraunico=i.codigoinfraestructuraunico');
        query.sql.add('and a.enrevisionmovil=1');
        query.open;
        sApoyosEnRevision:='';
        while not(query.eof) do
        begin
          sApoyosEnRevision:= sApoyosEnRevision + ','+query.fieldbyname('codigoapoyo').AsString ;
          query.next;
        end;
        query.Close;

        if sApoyosEnRevision<>'' then
        begin
          sApoyosEnRevision:=copy(sApoyosEnRevision,2,length(sApoyosEnRevision));
          query.sql.clear;
          query.sql.add('select distinct codigoodt from emg_odtasignacion o');
          query.sql.add('where exists');
          query.sql.add('(select null from emg_apoyo a');
          query.sql.add('where codigoapoyo in ('+sApoyosEnRevision+')');
          query.sql.add('and a.codigoasignacionemg=o.codigoasignacionemg');
          query.sql.add('and o.codigoestadoasignacion<>10)');
          query.open;
          sOdts:='';
          while not(query.eof) do
          begin
            sOdts:= sOdts + ','+query.fieldbyname('codigoodt').AsString ;
            query.next;
          end;
          query.Close;
          query.Free;

          if (sOdts<>'') then
            sOdts:= 'En las Odts '+copy(sOdts,2,length(sOdts))+'.';

          raise exception.create('Esta asignación no puede ser generada porque contiene '+#13+
          'los siguientes apoyos que se encuentran en Revisión por EnerGis Móvil: '+#13+sApoyosEnRevision+#13+sOdts);
        end;
      end
      else
        raise exception.create('No existen trafos para realizar una asignación de este tipo.');
    end;
    ExpMixtoAP:
    begin
      tipoa:='Y';
      qODTApoyo.close;
      qODTApoyo.open;
      while not(qODTApoyo.eof) do
      begin
        query.Close;
        query.sql.clear;
        query.sql.Add('INSERT INTO EMG_INDICEELEMENTO1');
        query.sql.Add('(select A.CODIGOINFRAESTRUCTURAUNICO,''01'',A.CODIGOESTRUCTURA from APOYO A');
        query.sql.Add(' WHERE A.PINTADOAPOYO='''+ qODTApoyoPINTADOAPOYO.AsString+''')');
        query.ExecSQL;
        qODTApoyo.Next;
      end;
      query.Close;

      InsertarApoyosPlanchasOdt;

      Query.Close;
      query.sql.clear;
      query.sql.add('select a.codigoapoyo');
      query.sql.add('from emg_indiceelemento1 i,apoyo a');
      query.sql.add('where a.codigoinfraestructuraunico=i.codigoinfraestructuraunico');
      query.sql.add('and a.enrevisionmovil=1');
      query.open;
      sApoyosEnRevision:='';
      while not(query.eof) do
      begin
        sApoyosEnRevision:= sApoyosEnRevision + ','+query.fieldbyname('codigoapoyo').AsString ;
        query.next;
      end;
      query.Close;

      if sApoyosEnRevision<>'' then
      begin
        sApoyosEnRevision:=copy(sApoyosEnRevision,2,length(sApoyosEnRevision));
        query.sql.clear;
        query.sql.add('select distinct codigoodt from emg_odtasignacion o');
        query.sql.add('where exists');
        query.sql.add('(select null from emg_apoyo a');
        query.sql.add('where codigoapoyo in ('+sApoyosEnRevision+')');
        query.sql.add('and a.codigoasignacionemg=o.codigoasignacionemg');
        query.sql.add('and o.codigoestadoasignacion<>10)');
        query.open;
        sOdts:='';
        while not(query.eof) do
        begin
          sOdts:= sOdts + ','+query.fieldbyname('codigoodt').AsString ;
          query.next;
        end;
        query.Close;
        query.Free;

        if (sOdts<>'') then
          sOdts:= 'En las Odts '+copy(sOdts,2,length(sOdts))+'.';

        raise exception.create('Esta asignación no puede ser generada porque contiene '+#13+
        'los siguientes apoyos que se encuentran en Revisión por EnerGis Móvil: '+#13+sApoyosEnRevision+#13+sOdts);
      end;
    end;
    ExpMixtoTAP:
    begin
      tipoa:='Z';
      qOdtTrafodis.close;
      qOdtTrafodis.open;
      strafos :='';
      while not(qOdtTrafodis.eof) do
      begin
        query.Close;
        query.sql.clear;
        query.sql.Add('INSERT INTO EMG_INDICEELEMENTO1');
        query.sql.Add(' select DISTINCT A.CODIGOINFRAESTRUCTURAUNICO,''01'',A.CODIGOESTRUCTURA from APOYO A');
        query.sql.Add(' WHERE EXISTS');
        query.sql.Add(' (SELECT NULL FROM NODOBT N');
        query.sql.Add(' where N.codigoTRAFODIS='+qOdtTrafodisCodigoTrafodis.AsString);
        query.sql.Add(' AND N.CODIGOAPOYO=A.CODIGOAPOYO)');
        query.ExecSQL;
        strafos := sTrafos +','+qOdtTrafodisCodigoTrafodis.AsString ;
        qOdtTrafodis.Next;
      end;
      query.Close;

      if (strafos<>'') then
      begin
        strafos:= copy(strafos,2,length(strafos));

        query.sql.clear;
        Query.sql.add('SELECT CODIGOTRAFODIS');
        Query.sql.add('FROM TRAFODIS ');
        Query.sql.add('WHERE CODIGOTRAFODIS IN ('+strafos+')');
        Query.sql.add('AND CODIGOESTADOINVENTARIO<>4');
        Query.Open;
        if (Query.fieldbyname('CODIGOTRAFODIS').AsString<>'') then
        begin
          sCodTrafoDis := Query.fieldbyname('CODIGOTRAFODIS').AsString;
          query.Close;
          query.Free;
          raise Exception.Create('Esta asignación no puede ser exportada porque el trafodis '
                                       +sCodTrafoDis+char(13)+'No se encuentra en operación.');
        end;

        qODTApoyo.close;
        qODTApoyo.open;
        while not(qODTApoyo.eof) do
        begin
          query.Close;
          query.sql.clear;
          query.sql.Add('INSERT INTO EMG_INDICEELEMENTO1');
          query.sql.Add('(select A.CODIGOINFRAESTRUCTURAUNICO,''01'',A.CODIGOESTRUCTURA from APOYO A');
          query.sql.Add(' WHERE A.PINTADOAPOYO='''+ qODTApoyoPINTADOAPOYO.AsString+''')');
          query.ExecSQL;
          qODTApoyo.Next;
        end;
        query.Close;

        InsertarApoyosPlanchasOdt;

        Query.Close;
        query.sql.clear;
        query.sql.add('select a.codigoapoyo');
        query.sql.add('from emg_indiceelemento1 i,apoyo a');
        query.sql.add('where a.codigoinfraestructuraunico=i.codigoinfraestructuraunico');
        query.sql.add('and a.enrevisionmovil=1');
        query.open;
        sApoyosEnRevision:='';
        while not(query.eof) do
        begin
          sApoyosEnRevision:= sApoyosEnRevision + ','+query.fieldbyname('codigoapoyo').AsString ;
          query.next;
        end;
        query.Close;

        if sApoyosEnRevision<>'' then
        begin
          sApoyosEnRevision:=copy(sApoyosEnRevision,2,length(sApoyosEnRevision));
          query.sql.clear;
          query.sql.add('select distinct codigoodt from emg_odtasignacion o');
          query.sql.add('where exists');
          query.sql.add('(select null from emg_apoyo a');
          query.sql.add('where codigoapoyo in ('+sApoyosEnRevision+')');
          query.sql.add('and a.codigoasignacionemg=o.codigoasignacionemg');
          query.sql.add('and o.codigoestadoasignacion<>10)');
          query.open;
          sOdts:='';
          while not(query.eof) do
          begin
            sOdts:= sOdts + ','+query.fieldbyname('codigoodt').AsString ;
            query.next;
          end;
          query.Close;
          query.Free;

          if (sOdts<>'') then
            sOdts:= 'En las Odts '+copy(sOdts,2,length(sOdts))+'.';

          raise exception.create('Esta asignación no puede ser generada porque contiene '+#13+
          'los siguientes apoyos que se encuentran en Revisión por EnerGis Móvil: '+#13+sApoyosEnRevision+#13+sOdts);
        end;
      end
      else
        raise exception.create('No existen trafos para realizar una asignación de este tipo.');
    end;

  end;

  query.Close;
  query.Free;

  If tipo <> ExpVacia then  MostrarMapa;
  ruta := RutaAsignacionMovil;
  carpeta:=DirectorioAsignacionMovil;
  ForceDirectories(ruta+'\'+carpeta+'\');
  ExportacionExitosa:=true;

  try
    GenerarAsignacionOracle(tipoa,strafos);
  except
    on e:exception do
    begin
      showmessage(e.message);
      ExportacionExitosa:=false;
    end;
  end;

  ExportacionExitosa:= GenerarAsignacionSdf;

  sNomSDF := ruta+'\'+carpeta+'\EnerGisMóvil.sdf';
  if ExportacionExitosa and (FileExists(sNomSDF)) then
  begin
  
    try
      GenerarShapes;
    except
      on e:exception do
      begin
         showmessage(e.message);
         ExportacionExitosa:=false;
      end;
    end;

    //Aqui Exportacion al SFTP
    With Zip do
    begin
      FileName := ruta+'\'+carpeta+'.zip';
      OpenArchive( fmCreate );
      BaseDir := ruta+'\';
      TempDir := ruta+'\';
      AddFiles( carpeta );
      CloseArchive;
    end;

    Application.NormalizeTopMosts;
    if ConectarA_SFTP(Host_SFTP, Port_SFTP, UserID_SFTP, Password_SFTP) then
    begin
      RutaCarpetaDestinoSFTP:= DirRaiz_SFTP+qODTPadreCODIGOADMINISTRATIVO.AsString+'\'
                            +qODTHijaCODIGOGRUPOTRABAJO.AsString+'\'+CarpetaExportadas+'\';
      if SubirArchivo_SFTP(ruta+'\'+carpeta+'.zip', RutaCarpetaDestinoSFTP) then
      begin
        Application.MessageBox(PChar('Asignación móvil subida con éxito al servidor FTP: '+Host_SFTP),PChar('EnerGis'),MB_ICONINFORMATION+MB_OK);
        if FileExists(ruta+'\'+carpeta+'.zip') then DeleteFile(ruta+'\'+carpeta+'.zip');
        RenameFile(ruta+'\'+carpeta, ruta+'\'+carpeta+'_EXP');
      end
      else
        Application.MessageBox(PChar('No se pudo subir la asignación móvil al servidor FTP: '+Host_SFTP),PChar('EnerGis'),MB_ICONERROR+MB_OK);
    end
    else
      Application.MessageBox(PChar('No se pudo conectar al servidor FTP: '+Host_SFTP),PChar('EnerGis'),MB_ICONERROR+MB_OK);
    Application.RestoreTopMosts;
  end
  else
    Application.MessageBox(PChar('No se generó correctamente la asignación móvil. Borre la exportación y vuelva a intentarlo.'),PChar('EnerGis'),MB_ICONERROR+MB_OK);

  qODTHijaCalcFields(qODTHija);
  dmTablasEMG.FiltrarDatos(qODTHijaCodAsignacionExportacion.AsFloat);
end;

procedure TFOdtUrbanaRural.ExportarDatosdeCircuito1Click(Sender: TObject);
begin
  GenerarAsignacionMovil(ExpCircuito);
end;

procedure TFOdtUrbanaRural.ExportarDatosdeTrafosasociados1Click(
  Sender: TObject);
begin
  GenerarAsignacionMovil(ExpTrafo);
end;

procedure TFOdtUrbanaRural.ExportarDatosdeapoyosrelacionados1Click(
  Sender: TObject);
begin
  GenerarAsignacionMovil(ExpApoyo);
end;

procedure TFOdtUrbanaRural.ExportarDatosdeTrafosyapoyosrelacionados1Click(
  Sender: TObject);
begin
  GenerarAsignacionMovil(ExpMixtoTA);
end;

procedure TFOdtUrbanaRural.BitBtn3Click(Sender: TObject);
var
  RutaODTsEscritorio, NombreODT, RutaFullArchivoSFTP, DirDestino :String;
begin
  // ****************** Descargar Asignacion SFTP  ****************************//

  RutaODTsEscritorio := RutaAsignacionMovil;
  NombreODT := DirectorioAsignacionMovil;
  DirDestino:= RutaODTsEscritorio;

  Application.NormalizeTopMosts;
  if ConectarA_SFTP(Host_SFTP, Port_SFTP, UserID_SFTP, Password_SFTP) then
  begin
    RutaFullArchivoSFTP:= DirRaiz_SFTP+qODTPadreCODIGOADMINISTRATIVO.AsString+'\'
                          +qODTHijaCODIGOGRUPOTRABAJO.AsString+'\'+CarpetaImportadas+'\'
                          +NombreODT+'.zip';
    if BajarArchivo_SFTP(RutaFullArchivoSFTP, DirDestino, False) then
    begin
      With Zip do
      begin
        FileName := RutaODTsEscritorio+'\'+NombreODT+'.zip';
        OpenArchive( fmOpenRead );
        BaseDir := RutaODTsEscritorio+'\';
        TempDir := RutaODTsEscritorio+'\';
        ExtractFiles( '*.*' );
        CloseArchive;
      end;
      BuscarYRenombrarSDF(RutaODTsEscritorio+'\'+NombreODT+'\');
      Application.MessageBox(PChar('Asignación móvil descargada con éxito del servidor FTP: '+Host_SFTP),PChar('Energis'),MB_ICONINFORMATION+MB_OK);
      if FileExists(RutaODTsEscritorio+'\'+NombreODT+'.zip') then DeleteFile(RutaODTsEscritorio+'\'+NombreODT+'.zip');
    end
    else
      Application.MessageBox(PChar('No se pudo descargar la asignación móvil del servidor FTP: '+Host_SFTP+chr(13)+chr(13)+'Importación Cancelada.'),PChar('Energis'),MB_ICONERROR+MB_OK);
  end
  else
    Application.MessageBox(PChar('No se pudo conectar al servidor FTP: '+Host_SFTP+chr(13)+chr(13)+''),PChar('Energis'),MB_ICONERROR+MB_OK);

  Application.RestoreTopMosts;
  ImportarAsignacionEMG;
end;

procedure TFOdtUrbanaRural.bExportarAsignacionEMGClick(Sender: TObject);
var punto:TPoint;
begin
   CopiarADispositivo:=true;
   punto:=GroupBox12.ClientToScreen(Classes.Point(bExportarAsignacionEMG.Left, bExportarAsignacionEMG.top));
   pmExportarEMG.Popup(punto.x+10, punto.y+10);
   CopiarADispositivo:=false;
end;

procedure TFOdtUrbanaRural.qCircuitoBeforeOpen(DataSet: TDataSet);
begin
  with tquery(dataset) do
  begin
    sql.clear;
    sql.add('SELECT CODIGOCIRCUITO, NOMBRECIRCUITO');
    sql.add('FROM CIRCUITO C');
    if (qODTHijaCODIGOGEOGRAFICO.AsString<>'') then
    begin
      sql.add('where exists');
      sql.add('(SELECT null');
      sql.add('  FROM geografico B,NODOMT N,APOYO A');
      sql.add(' WHERE EXISTS (');
      sql.add('          SELECT null');
      sql.add('            FROM (SELECT m.codigoarbol, LENGTH (m.codigoarbol) longitud');
      sql.add('                    FROM geografico m, geografico g');
      sql.add('                   WHERE SUBSTR (m.codigoarbol, 1, LENGTH (g.codigoarbol) - 3) =');
      sql.add('                            SUBSTR (g.codigoarbol,');
      sql.add('                                    1,');
      sql.add('                                    LENGTH (g.codigoarbol) - 3');
      sql.add('                                   )');
      sql.add('                     AND g.codigogeografico = :CODIGOGEOGRAFICO');
      sql.add('                     AND g.nombrecategoria = m.nombrecategoria');
      sql.add('                     AND LENGTH (m.codigoarbol) = LENGTH (g.codigoarbol)');
      sql.add('                     AND m.codigogeografico < 0) m');
      sql.add('           WHERE SUBSTR (B.codigoarbol, 1,m.longitud) =');
      sql.add('                                                                 m.codigoarbol)');
      sql.add('   AND B.codigogeografico > 0');
      sql.add('   AND N.CODIGOCIRCUITO=C.CODIGOCIRCUITO');
      sql.add('   AND A.CODIGOGEOGRAFICO=B.CODIGOGEOGRAFICO');
      sql.add('   AND N.CODIGOAPOYO=A.CODIGOAPOYO)');
      sql.add('UNION');
      sql.add('SELECT CODIGOCIRCUITO, NOMBRECIRCUITO');
      sql.add('FROM CIRCUITO C');
      sql.add('where exists');
      sql.add(' (SELECT NULL FROM NODOMT N,APOYO A');
      sql.add(' where N.CODIGOCIRCUITO=C.CODIGOCIRCUITO');
      sql.add(' AND A.CODIGOGEOGRAFICO=:CODIGOGEOGRAFICO');
      sql.add(' AND N.CODIGOAPOYO=A.CODIGOAPOYO)');
    end;
    sql.add(' ORDER BY NOMBRECIRCUITO');
  end;
end;

procedure TFOdtUrbanaRural.VerMaterialesLuminaria;
var i:integer;
  cadena, cadena2:string;
  query:tquery;
begin
  cadena:='';
  cadena2:='';
  query:=TQuery.create(self);
  query.DatabaseName:='BaseDato';
  query.sql.Add('select codigoestructura from alumbradopublico ap');
  query.sql.Add('where ap.codigoapoyo='+qODTApoyoCodigoApoyo.AsString);
  query.open;
  if query.FieldByName('codigoestructura').AsString<>'' then
  begin
    fMaterialesEstructura := TfMaterialesEstructura.Create(Application);
    fMaterialesEstructura.qMaterialesEstructura.Close;
    fMaterialesEstructura.qMaterialesEstructura.Params[0].asinteger := query.FieldByName('codigoestructura').AsInteger;
    fMaterialesEstructura.qMaterialesEstructura.Open;
    try
      if fMaterialesEstructura.ShowModal = mrOk then
      begin
        if fMaterialesEstructura.DBGridBuscarMaterial.SelectedRows.Count>0 then
        begin
          for i:=0 to fMaterialesEstructura.DBGridBuscarMaterial.SelectedRows.Count-1 do
          begin
            if fMaterialesEstructura.qMaterialesEstructura.fieldbyName('CodigoMaterialEssa').asstring<>'' then
            begin
              fMaterialesEstructura.qMaterialesEstructura.BookMark:=fMaterialesEstructura.DBGridBuscarMaterial.SelectedRows.Items[i];
              try

                if not (qPresMate.Locate('CODIGOMATERIAL',fMaterialesEstructura.qMaterialesEstructura.fieldbyName('CodigoMaterialEssa').asstring,[])) then
                begin
                  qPresMate.Insert;
                  qPresMate.FieldbyName('CodigoMaterial').asstring :=fMaterialesEstructura.qMaterialesEstructura.fieldbyName('CodigoMaterialEssa').asstring;
                  qPresMate.FieldbyName('cantidadsolicitada').asfloat:= 1;
                  qPresMate.Post;
                end
                else
                begin
                  qPresMate.Edit;
                  qPresMate.FieldbyName('cantidadsolicitada').asfloat:=qPresMate.FieldbyName('cantidadsolicitada').asfloat+1 ;
                  qPresMate.Post;
  //                cadena2:=cadena2 +fMaterialesEstructura.qMaterialesEstructuraNOMBREMATERIAL.AsString + Chr(13);
                end;
              except
                on E:Exception do
                begin
                  showmessage(e.message);
                  qPresMate.Cancel;
                end;
              end;
            end
            else
            begin
              cadena:=cadena +fMaterialesEstructura.qMaterialesEstructuraNOMBREMATERIAL.AsString + Chr(13);
            end;
          end;
          if qPresMate.State in [dsInsert] then
            qPresMate.Cancel;
          qPresMate.Active := False;
          qPresMate.Active := True;
          if (not qPresMate.IsEmpty) and (qPresMateCODIGOMATERIAL.AsFloat = 0) then
            qPresMate.Delete;
        end;
      end;
      if cadena<>'' then
        showmessage('No se encontraron los siguientes materiales :'+ chr(13)+cadena);
      if cadena2<>'' then
        showmessage('Los siguientes materiales ya se encontraban agregados :'+ chr(13)+cadena2);
    finally
      fMaterialesEstructura.free;
    end;
  end;
  query.free;
end;

procedure TFOdtUrbanaRural.verMaterialesApoyo;
var i:integer;
  cadena, cadena2:string;
begin
  cadena:='';
  cadena2:='';
  fMaterialesEstructura := TfMaterialesEstructura.Create(Application);
  fMaterialesEstructura.qMaterialesEstructura.Close;
  fMaterialesEstructura.qMaterialesEstructura.Params[0].asinteger := qODTApoyoCodigoEstructura.AsInteger;
  fMaterialesEstructura.qMaterialesEstructura.Open;
  try
    if fMaterialesEstructura.ShowModal = mrOk then
    begin
      if fMaterialesEstructura.DBGridBuscarMaterial.SelectedRows.Count>0 then
      begin
        for i:=0 to fMaterialesEstructura.DBGridBuscarMaterial.SelectedRows.Count-1 do
        begin
          if fMaterialesEstructura.qMaterialesEstructura.fieldbyName('CodigoMaterialEssa').asstring<>'' then
          begin
            fMaterialesEstructura.qMaterialesEstructura.BookMark:=fMaterialesEstructura.DBGridBuscarMaterial.SelectedRows.Items[i];
            try
              if not (qPresMate.Locate('CODIGOMATERIAL',fMaterialesEstructura.qMaterialesEstructura.fieldbyName('CodigoMaterialEssa').asstring,[])) then
              begin
                qPresMate.Insert;
                qPresMate.FieldbyName('CodigoMaterial').asstring :=fMaterialesEstructura.qMaterialesEstructura.fieldbyName('CodigoMaterialEssa').asstring;
                qPresMate.FieldbyName('cantidadsolicitada').asfloat:= 1;
                qPresMate.Post;
              end
              else
              begin
                qPresMate.Edit;
                qPresMate.FieldbyName('cantidadsolicitada').asfloat:=qPresMate.FieldbyName('cantidadsolicitada').asfloat+1 ;
                qPresMate.Post;
//                cadena2:=cadena2 +fMaterialesEstructura.qMaterialesEstructuraNOMBREMATERIAL.AsString + Chr(13);
              end;
            except
              on E:Exception do
              begin
                showmessage(e.message);
                qPresMate.Cancel;
              end;
            end;
          end
          else
          begin
            cadena:=cadena +fMaterialesEstructura.qMaterialesEstructuraNOMBREMATERIAL.AsString + Chr(13);
          end;
        end;
        if qPresMate.State in [dsInsert] then
          qPresMate.Cancel;
        qPresMate.Active := False;
        qPresMate.Active := True;
        if (not qPresMate.IsEmpty) and (qPresMateCODIGOMATERIAL.AsFloat = 0) then
          qPresMate.Delete;
      end;
    end;
    if cadena<>'' then
      showmessage('No se encontraron los siguientes materiales :'+ chr(13)+cadena);
    if cadena2<>'' then
      showmessage('Los siguientes materiales ya se encontraban agregados :'+ chr(13)+cadena2);
  finally
    fMaterialesEstructura.free;
  end;
end;

procedure TFOdtUrbanaRural.MaterialesdelApoyo1Click(Sender: TObject);
begin
  verMaterialesApoyo;
end;

procedure TFOdtUrbanaRural.MaterialesdelaLuminaria1Click(Sender: TObject);
begin
  VerMaterialesLuminaria;
end;

procedure TFOdtUrbanaRural.bVerMaterialesApoyoClick(Sender: TObject);
var punto:TPoint;
begin
 if (qODTPadreCODIGOMODOODT.AsString='2') then
 begin
   punto:=panel86.ClientToScreen(Classes.Point(bVerMaterialesApoyo.Left, bVerMaterialesApoyo.top));
   popupmenu1.Popup(punto.x+10, punto.y+10);
 end
 else
   verMaterialesApoyo;
end;

procedure TFOdtUrbanaRural.qODTHijaCODIGOGRUPOTRABAJOValidate(
  Sender: TField);
var qDatos,qry,qry1,qry2,qry3:TQuery;

GrupoActivo,texto:string;
begin
  //Interfaz OW
  ValidarCambioMateriales;
  if ActivarValidacionGrupotrabajo then
  Begin
    qDatos:=TQuery.Create(self);
    qDatos.DatabaseName:='BaseDato';
    qDatos.sql.text:='SELECT ACTIVO FROM GRUPOTRABAJO WHERE CODIGOADMINISTRATIVO = '+ qODTPadreCODIGOADMINISTRATIVO.asstring+ ' and codigogrupotrabajo = '+ qODTHijaCODIGOGRUPOTRABAJO.asstring;
    qDatos.Open;
    GrupoActivo:= qDatos.FieldByName('activo').asstring;
    qDatos.Close;
    qDatos.free;
    If GrupoActivo<> 'S' then
      raise Exception.Create('Grupo de trabajo inexistente o inactivo');
  end;
  if ((qODTPADRECODIGOTIPOTAREA.asInteger=128) OR (qODTPADRECODIGOTIPOTAREA.asInteger=129) OR (qODTPADRECODIGOTIPOTAREA.asInteger=130)) then
  begin
    if (ValidarAjusteStock)and(qPresMate.RecordCount=0) and(qPresMano.RecordCount > 0)and (qODtHIJACODIGOGRUPOTRABAJO.asString<>'') then
    Begin
      IngresarMaterialAjuste;
    End;
  end;


  qry:= TQuery.Create(nil);
  qry.DatabaseName := 'BaseDato';
  qry.SQL.Clear;
  qry1:= TQuery.Create(nil);
  qry1.DatabaseName := 'BaseDato';
  qry1.SQL.Clear;
  qry1.SQL.Add('select codigoreporte from odtreporte where codigoodt = '''+qODTHijaCODIGOODT.AsString+''' and consecutivo = '''+qODTHijaCONSECUTIVO.AsString+''' ');
  qry1.open;
  Texto := qry1.Fields[0].asSTring;
  qry1.Free;

  qry.SQL.Add('UPDATE SIGCOM_GESTION ');
  qry.SQL.Add(' SET (CODIGOODT, CONSECUTIVO,CODIGOADMINISTRATIVO, DESCRIPCIONODT, NOMBREEMPLEADO )=   ');
  qry.SQL.Add(' (SELECT ORE.CODIGOODT, ORE.CONSECUTIVO, O.CODIGOADMINISTRATIVO, O.MOTIVOS , E.NOMBREEMPLEADO ');
  qry.SQL.Add(' FROM ODTREPORTE ORE, ODT O, ODTDIA OD, EMPLEADO E      ');
  qry.SQL.Add(' WHERE CODIGOREPORTE = :CODIGOREPORTE     ');
  qry.SQL.Add(' AND ORE.CODIGOODT = OD.CODIGOODT      ');
  qry.SQL.Add(' AND ORE.CONSECUTIVO = OD.CONSECUTIVO   ');
  qry.SQL.Add('  AND OD.CODIGOODT = O.CODIGOODT        ');
  qry.SQL.Add(' AND O.CODIGOEJECUTOR = E.CODIGOEMPLEADO(+))');
  qry.SQL.Add(' WHERE CODIGOREPORTE = :CODIGOREPORTE');
  qry.ParamByName('CODIGOREPORTE').AsString:=Texto;

  qry.ExecSQL;
  qry.Close;
  qry.Free;


  qry2:= TQuery.Create(nil);
  qry2.DatabaseName := 'BaseDato';
  qry2.SQL.Clear;
  qry2.SQL.Add( 'update SIGCOM_GESTION set CODIGOGRUPOTRABAJO='''+qODTHijaCODIGOGRUPOTRABAJO.aSString+''' WHERE CODIGOREPORTE = :CODIGOREPORTE ');
  qry2.ParamByName('CODIGOREPORTE').AsString:=Texto;
  qry2.ExecSQL;

  qry2.Close;
  qry2.Free;


  qry3:= TQuery.Create(nil);
  qry3.DatabaseName := 'BaseDato';
  qry3.SQL.Clear;
  qry3.SQL.Add('UPDATE REPORTE SET CODIGOESTADOREPORTE=''2'',FECHAHORADICTADO=SYSDATE,FECHAHORADESCARGA=SYSDATE WHERE CODIGOREPORTE = :CODIGOREPORTE ');
  qry3.ParamByName('CODIGOREPORTE').AsString:=Texto;
  qry3.ExecSQL;

  qry3.Close;
  qry3.Free;


end;


procedure TFOdtUrbanaRural.ValidarCambioMateriales;
Begin
//***********Revision de Requisiciones ********************+
qrequisiciones.First;
while not qrequisiciones.eof do
Begin
  If qrequisiciones.FieldByName('ESTADO').asstring <> 'ANULADO' THEN
    raise Exception.Create('Existen Requisiciones asociadas a este grupo de trabajo que no estan anuladas.');
  qrequisiciones.Next;
End;

//***********  Revision de Traslados ********************+
if qtraslados.recordcount > 0 then
  raise Exception.Create('Existen traslados asociadas a este grupo de trabajo');

//***********Revision de consumos, desmantelamientos, reintegros ********************+

qpresmate.First;
while not qpresmate.eof do
Begin
  if NOT ((qpresmatecantidadconsumida.asfloat = 0) and (qpresmatecantidadconsumidadesmantelada.asfloat = 0) and(qpresmatecantidadretiradabuena.asfloat = 0) and
    (qpresmatecantidadretiradamala.asfloat = 0) and(qpresmateCANTIDADREINTEGRADAMALA.asfloat = 0) and(qpresmateCANTIDADREINTEGRADABuena.asfloat = 0) and
    (qPresMateCANTIDADREINTEGRADABUENADESMAN.asfloat = 0) and(qPresMateCANTIDADREINTEGRADAMALADESMAN.asfloat = 0) AND (qPresMateCANTIDADENTREGADA.asfloat = 0) ) then
  Begin
    raise Exception.Create('Existen cantidades de material relacionadas con este grupo de trabajo.');
  end;
  qpresmate.Next;
End;


End;


procedure TFOdtUrbanaRural.RxDBGrid3DblClick(Sender: TObject);
var qrDatos:tquery;
begin
  if qodtformato.FieldByName('fechaultimamodificacion').asstring = '' then
  Begin
       raise Exception.Create('Debe llenar primero la informacion general de la prueba.');
  end
  else
  Begin
    if qOdtSeccionCODIGOSECCIONFORMATODATOS.AsString <>'' then
    begin
      FSeccionFormatoDatosODT:=TFSeccionFormatoDatosODT.Create(Application);
      qFormatosPruebas.Open;

      FSeccionFormatoDatosODT.EFormato.text:=qOdtFormatoNombreFormato.AsString;
      try
        FSeccionFormatoDatosODT.qSeccionDatos.Close;
        FSeccionFormatoDatosODT.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS='+qOdtSeccionCODIGOSECCIONFORMATODATOS.AsString;
        FSeccionFormatoDatosODT.qSeccionDatos.Open;

        qrDatos:=TQuery.Create(Application);
        qrDatos.DatabaseName:='BaseDato';
      //  qrDatos.Tag:=99;
        qrDatos.SQL.Add('SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO ='+ FSeccionFormatoDatosODT.qSeccionDatosCODIGOUSUARIOCREACION.AsString);
        qrDatos.Open;
        FSeccionFormatoDatosODT.Edit4.text:=qrDatos.Fields[0].AsString;
        qrDatos.SQL.Clear;
        FSeccionFormatoDatosODT.CrearTablaTemporalMedidas;
        FSeccionFormatoDatosODT.CargarTablaTemporalMedidas;
        FSeccionFormatoDatosODT.qSeccionDatos.Edit;
  //      FSeccionFormatoDatosODT.qEncabezadoSeccionDatos.Edit;
        FSeccionFormatoDatosODT.TMedidas.Edit;
        FSeccionFormatoDatosODT.ShowModal;
        qOdtSeccion.close;
        qOdtSeccion.open;

      finally
         //FSeccionFormatoDatosODT.Free;
      end;
    end;
  end;

end;

procedure TFOdtUrbanaRural.RxDBGrid3EditButtonClick(Sender: TObject);
var i:integer;
begin
  fSeleccionarSeccionMantenimiento:=tfSeleccionarSeccionMantenimiento.Create(Application);
  try
    fSeleccionarSeccionMantenimiento.qdatos.close;
    fSeleccionarSeccionMantenimiento.qdatos.ParamByName('CODIGOODT').AsFloat:=qODTHijaCODIGOODT.AsFloat;
    fSeleccionarSeccionMantenimiento.qdatos.ParamByName('CONSECUTIVO').AsFloat:=qODTHijaCONSECUTIVO.AsFloat;
    fSeleccionarSeccionMantenimiento.qdatos.ParamByName('codigoformatomtto').AsFloat:=qOdtFormatoCODIGOFORMATOMTTO.AsFloat;
    fSeleccionarSeccionMantenimiento.qdatos.open;
    if fSeleccionarSeccionMantenimiento.ShowModal=MrOK then
    begin
      for i:=0 to fSeleccionarSeccionMantenimiento.dbGrid1.SelectedRows.Count-1 do
      begin
        fSeleccionarSeccionMantenimiento.qDatos.BookMark:=fSeleccionarSeccionMantenimiento.DBGrid1.SelectedRows.Items[i];
        if qOdtSeccionCODIGOSECCIONFORMATO.AsFloat <> 0 then qOdtSeccion.Edit
        else
        begin
          if (qOdtSeccion.State in [dsInsert]) then
            qOdtSeccion.Cancel;
          qOdtSeccion.Insert;
        end;
        qOdtSeccionCODIGOSECCIONFORMATO.Asinteger:=fSeleccionarSeccionMantenimiento.qDatosCODIGOSECCIONFORMATO.AsInteger;
      end;
    end;
  finally
    fSeleccionarSeccionMantenimiento.Free;
    fSeleccionarSeccionMantenimiento:=nil;
  end;

end;

procedure TFOdtUrbanaRural.qOdtFormatoAfterDelete(DataSet: TDataSet);
begin
  qOdtFormato.ApplyUpdates;
  qOdtFormato.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qOdtFormatoAfterEdit(DataSet: TDataSet);
begin
 RxDBGrid2DblClick(nil);
end;

procedure TFOdtUrbanaRural.qOdtFormatoAfterInsert(DataSet: TDataSet);
var qDatos:TQuery;
begin
  qDatos:=TQuery.Create(self);
  qDatos.DatabaseName:='BaseDato';
  qDatos.sql.text:='SELECT SQ_HVEFORMATO.NEXTVAL FROM DUAL';
  qDatos.Open;
 // qFormatoDatosCODIGOMANTENIMIENTO.AsString:=qMantenimientoDatosCODIGOMANTENIMIENTO.AsString;
  qOdtFormatoCODIGOFORMATOMTTODATOS.AsString:=qDatos.Fields[0].AsString;
  qOdtFormatoFECHACREACION.AsString:= DateTimeToStr(Now);
  qOdtFormatoCODIGOUSUARIOCREACION.AsFloat:= VarCodigoUsuario;
  qOdtFormatoCODIGOODT.asfloat:=qODTHijaCODIGOODT.AsFloat;
  qOdtFormatoCONSECUTIVOODT.asfloat:=qODTHijaCONSECUTIVO.AsFloat;
  qDatos.free;
end;

procedure TFOdtUrbanaRural.qOdtFormatoAfterPost(DataSet: TDataSet);
begin
  qOdtFormato.ApplyUpdates;
  qOdtFormato.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qOdtFormatoCalcFields(DataSet: TDataSet);
var query:tquery;
begin
  if qOdtFormatoCODIGOFORMATOMTTO.AsString<>'' then
  begin
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('select  NOMBREFORMATOMTTO from hve_formatomtto');
    query.sql.add('where CODIGOFORMATOMTTO='+qOdtFormatoCODIGOFORMATOMTTO.AsString);
    query.open;
    qOdtFormatoNombreFormato.AsString:=query.fields[0].AsString;
    query.free;
  end;
end;

procedure TFOdtUrbanaRural.qOdtSeccionAfterDelete(DataSet: TDataSet);
begin
  qOdtSeccion.ApplyUpdates;
  qOdtSeccion.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qOdtSeccionAfterEdit(DataSet: TDataSet);
begin
  RxDBGrid3DblClick(nil);
end;

procedure TFOdtUrbanaRural.qOdtSeccionAfterInsert(DataSet: TDataSet);
var qDatos:TQuery;
begin
  RefrescarVariables;
  qDatos:=TQuery.Create(self);
  qDatos.DatabaseName:='BaseDato';
  qDatos.sql.text:='SELECT SQ_HVESECCION.NEXTVAL FROM DUAL';
  qDatos.Open;

  qOdtSeccionCODIGOSECCIONFORMATODATOS.AsString:=qDatos.Fields[0].AsString;
  qOdtSeccionCODIGOFORMATOMTTODATOS.AsString:=qOdtFormatoCODIGOFORMATOMTTODATOS.AsString;
  qOdtSeccionFECHAREGISTRO.AsString:= DateTimeToStr(Now);
  qOdtSeccionFECHAMODIFICACION.AsString:= DateTimeToStr(Now);
  qOdtSeccionCODIGOUSUARIOCREACION.AsFloat:= VarCodigoUsuario;
  qDatos.Free;
end;

procedure TFOdtUrbanaRural.qOdtSeccionAfterPost(DataSet: TDataSet);
begin
  qOdtSeccion.ApplyUpdates;
  qOdtSeccion.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qOdtSeccionCalcFields(DataSet: TDataSet);
var query:tquery;
begin
  if qOdtSeccionCODIGOSECCIONFORMATO.AsString<>'' then
  begin
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('select NOMBRESECCIONFORMATO  from hve_seccionformato');
    query.sql.add('where CODIGOSECCIONFORMATO='+qOdtSeccionCODIGOSECCIONFORMATO.AsString);
    query.open;
    qOdtSeccionNombreSeccion.AsString:=query.fields[0].AsString;
    query.free;
  end;
end;

procedure TFOdtUrbanaRural.RxDBGrid2DblClick(Sender: TObject);
begin
  if qOdtFormatoCODIGOFORMATOMTTODATOS.AsString <>'' then
  begin
    FFormatoMttoDatosODT:=TFFormatoMttoDatosODT.Create(Application);
    FFormatoMttoDatosODT.mttoanterior:=false;
    qFormatosPruebas.Open;
    if FFormatoMttoDatosODT.qMantenimientoDatos.Active then
      FFormatoMttoDatosODT.qMantenimientoDatos.close;
    FFormatoMttoDatosODT.qMantenimientoDatos.ParamByName('CODIGOMANTENIMIENTO').AsFloat:= qOdtFormatoCODIGOMANTENIMIENTO.AsFloat;
    FFormatoMttoDatosODT.qMantenimientoDatos.Open;
      ////  ELEMENTO
    if FFormatoMttoDatosODT.qPmelemento.Active then
      FFormatoMttoDatosODT.qPmelemento.Close;
    FFormatoMttoDatosODT.qPmelemento.ParamByName('CODIGOELEMENTOMANTENIMIENTO').AsFloat:= qOdtFormatoCODIGOMANTENIMIENTO.AsFloat;
    FFormatoMttoDatosODT.qPmelemento.Open;
    try
      FFormatoMttoDatosODT.qFormatoDatos.Close;
      FFormatoMttoDatosODT.qFormatoDatos.SQL.Text:='SELECT * FROM HVE_FORMATOMTTODATOS WHERE CODIGOFORMATOMTTODATOS = ' + qOdtFormatoCODIGOFORMATOMTTODATOS.AsString;
      FFormatoMttoDatosODT.qFormatoDatos.Open;
      FFormatoMttoDatosODT.qFormatoDatos.Edit;
      FFormatoMttoDatosODT.CODIGOFORMATOMANTENIMIENTO:=  qOdtFormatoCODIGOFORMATOMTTO.AsString;
      FFormatoMttoDatosODT.CODIGO_ADMINISTRATIVO:= qodtpadrecodigoadministrativo.asinteger;
      if FFormatoMttoDatosODT.ShowModal=MrOK then
      begin
        qOdtFormato.close;
        qOdtFormato.open;
      end
    finally
      FFormatoMttoDatosODT.Free;
    end;
  end

end;

procedure TFOdtUrbanaRural.RxDBGrid2EditButtonClick(Sender: TObject);
var i:integer;
begin
  fseleccionarFormatoMantenimiento:=tfseleccionarFormatoMantenimiento.Create(Application);
  try
    fSeleccionarFormatoMantenimiento.qdatos.close;
    fSeleccionarFormatoMantenimiento.qdatos.ParamByName('CODIGOODT').AsFloat:=qODTHijaCODIGOODT.AsFloat;
    fSeleccionarFormatoMantenimiento.qdatos.ParamByName('CONSECUTIVO').AsFloat:=qODTHijaCONSECUTIVO.AsFloat;
    fSeleccionarFormatoMantenimiento.qdatos.open;
    if fseleccionarFormatoMantenimiento.ShowModal=MrOK then
    begin
      for i:=0 to fseleccionarFormatoMantenimiento.dbGrid1.SelectedRows.Count-1 do
      begin
        fseleccionarFormatoMantenimiento.qDatos.BookMark:=fseleccionarFormatoMantenimiento.DBGrid1.SelectedRows.Items[i];
        if qOdtFormatoCODIGOFORMATOMTTO.AsFloat <> 0 then qOdtFormato.Edit
        else
        begin
          if (qOdtFormato.State in [dsInsert]) then
            qOdtFormato.Cancel;
          qOdtFormato.Insert;
        end;
        qOdtFormatoCODIGOFORMATOMTTO.Asinteger:=fseleccionarFormatoMantenimiento.qDatosCODIGOFORMATOMTTO.AsInteger;
        qOdtFormatoCODIGOMANTENIMIENTO.AsInteger:=fseleccionarFormatoMantenimiento.qDatosCODIGOMANTENIMIENTO.AsInteger;
      end;
    end;
  finally
    fseleccionarFormatoMantenimiento.Free;
    fseleccionarFormatoMantenimiento:=nil;
  end;

end;

function TFOdtUrbanaRural.DirectorioAsignacionMovil: string;
begin
  result:='ODT'+qODTHijaCODIGOODT.AsString+'_'+completarcadenaizquierda(qODTHijaCONSECUTIVO.AsString,'0',2);
end;

function TFOdtUrbanaRural.RutaAsignacionMovil: string;
begin
  result := ExtractFilePath(ParamStr(0));
  if result[Length(result)] <> '\' then
     result := result + '\';
  result:=result+'Datos EnerGis Movil';
end;

procedure TFOdtUrbanaRural.tbGenerarAsignacionMovilClick(Sender: TObject);
var punto:TPoint;
begin
   CopiarADispositivo:=false;
   punto:=ToolBar2.ClientToScreen(Classes.Point(tbGenerarAsignacionMovil.Left, tbGenerarAsignacionMovil.top));
   pmExportarEMG.Popup(punto.x+10, punto.y+10);
end;

procedure TFOdtUrbanaRural.ImportarAsignacionSdf;
var query:tquery;
 i:integer;
 Servidor,Usuario,ClaveUsuario,esquema,asignacion:string;
 ruta,carpeta:string;
begin
  query:=TQuery.Create(self);
  query.DatabaseName:='BaseDato';

  Query.sql.add('SELECT COUNT(*)');
  Query.sql.add('FROM EMG_ODTASIGNACION');
  Query.sql.add('WHERE CODIGOODT='+qODTHijaCODIGOODT.AsString);
  Query.sql.add('AND CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString);
  Query.sql.Add('AND TIPODATOORIGEN=''E''');
  Query.Open;

  if (query.fields[0].AsInteger=0) then
    raise exception.Create('No se puede realizar la importación, porque no se existe una asignación exportada para esta Odt hija.');

  query.sql.clear;
  Query.sql.add('SELECT COUNT(*)');
  Query.sql.add('FROM EMG_ODTASIGNACION');
  Query.sql.add('WHERE CODIGOODT='+qODTHijaCODIGOODT.AsString);
  Query.sql.add('AND CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString);
  Query.sql.Add('AND CODIGOESTADOASIGNACION=4');
  Query.Open;
  if (query.fields[0].AsInteger>0) then
    raise exception.Create('No se puede realizar la importación, porque esta asignación ha sido cancelada.');


  query.sql.clear;
  Query.sql.add('SELECT COUNT(*)');
  Query.sql.add('FROM EMG_ODTASIGNACION');
  Query.sql.add('WHERE CODIGOODT='+qODTHijaCODIGOODT.AsString);
  Query.sql.add('AND CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString);
  Query.sql.Add('AND TIPODATOORIGEN=''I''');
  Query.Open;

  if (query.fields[0].AsInteger>0) then
    raise exception.Create('No se puede realizar la importación, porque ya existe una asignación importada para esta Odt hija.');


  ruta := RutaAsignacionMovil;
  carpeta := DirectorioAsignacionMovil;

  Servidor:=qODTHija.Database.Params.Values['SERVER NAME'];

  Usuario:=qODTHija.Database.Params.Values['USER NAME'];
  ClaveUsuario:=qODTHija.Database.Params.Values['PASSWORD'];

  query.sql.clear;
  query.sql.text:='SELECT sys_context(''USERENV'', ''CURRENT_SCHEMA'') FROM dual';
  query.open;
  esquema:=Query.fields[0].AsString;

  query.sql.clear;
  query.sql.text:='SELECT SQ_CODIGOASIGNACIONEMG.NEXTVAL FROM DUAL';
  query.open;
  asignacion:=Query.fields[0].AsString;

  try
// llamado a dll de Eddie López Exportar a archivos Sdf
  Importar(ruta+'\'+carpeta+'\',Servidor,usuario,ClaveUsuario,esquema,qODTHijaCODIGOODT.AsString,qODTHijaCONSECUTIVO.AsString,asignacion);
  Application.ProcessMessages;
  except
    on e:exception do
    begin
       showmessage(e.message);
    end;
//     showmessage('No se pudo realizar las tablas de infraestructura.');
  end;
  query.sql.clear;
  Query.sql.Add('UPDATE EMG_ODTASIGNACION');
  Query.sql.Add('SET CODIGOESTADOASIGNACION=2');
  Query.sql.Add('WHERE CODIGOODT='+qODTHijaCODIGOODT.AsString);
  Query.sql.Add('AND CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString);
  Query.ExecSQL;
  query.sql.clear;
  Query.sql.Add('UPDATE EMG_ODTASIGNACION');
  Query.sql.Add('SET FECHAPROCESO=SYSDATE');
  Query.sql.Add('WHERE CODIGOODT='+qODTHijaCODIGOODT.AsString);
  Query.sql.Add('AND CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString);
  Query.sql.Add('AND TIPODATOORIGEN=''I''');
  Query.ExecSQL;
  Query.free;
  dmTablasEMG.FiltrarDatos(qODTHijaCodAsignacionImportacion.AsFloat);
  bbCancelar.Enabled:=false;
end;

procedure TFOdtUrbanaRural.tbtbCopiarAsignacionMovilClick(Sender: TObject);
begin
  MinimizarOdtHija;
  ExportarAsignacionMovil(RutaAsignacionMovil,DirectorioAsignacionMovil);
end;

procedure TFOdtUrbanaRural.tbCopiarAsignacionEquipoClick(Sender: TObject);
begin
  MinimizarOdtHija;
  ImportarAsignacionMovil(RutaAsignacionMovil,DirectorioAsignacionMovil);
end;

procedure TFOdtUrbanaRural.tbImportarAsignacionClick(Sender: TObject);
begin
  MinimizarOdtHija;
  ImportarAsignacionSdf;
end;

procedure TFOdtUrbanaRural.pmExportarEMGChange(Sender: TObject;
  Source: TMenuItem; Rebuild: Boolean);
begin
  if qODTHijaCODIGOCIRCUITO.AsString='' then
    pmExportarEMG.items[0].Visible:=false
  else
    pmExportarEMG.Items[0].Visible:=true;

  if qOdtTrafodis.IsEmpty then
    pmExportarEMG.Items[1].Visible:=false
  else
    pmExportarEMG.Items[1].Visible:=true;

  if qODTApoyo.IsEmpty then
    pmExportarEMG.Items[2].Visible:=false
  else
    pmExportarEMG.Items[2].Visible:=true;

  if qODTPlancha.IsEmpty then
    pmExportarEMG.Items[3].Visible:=false
  else
    pmExportarEMG.Items[3].Visible:=true;

  if (qODTApoyo.IsEmpty or qOdtTrafodis.IsEmpty)then
    pmExportarEMG.Items[4].Visible:=false
  else
    pmExportarEMG.Items[4].Visible:=true;

  if (qODTPlancha.IsEmpty or qOdtTrafodis.IsEmpty)then
    pmExportarEMG.Items[5].Visible:=false
  else
    pmExportarEMG.Items[5].Visible:=true;

  if (qODTApoyo.IsEmpty or qODTPlancha.IsEmpty)then
    pmExportarEMG.Items[6].Visible:=false
  else
    pmExportarEMG.Items[6].Visible:=true;

  if (qODTApoyo.IsEmpty or qOdtTrafodis.IsEmpty or qODTPlancha.IsEmpty )then
    pmExportarEMG.Items[7].Visible:=false
  else
    pmExportarEMG.Items[7].Visible:=true;


  if (qODTApoyo.IsEmpty and qOdtTrafodis.IsEmpty and qodtplancha.isempty)then
    pmExportarEMG.Items[8].Visible:=true
  else
    pmExportarEMG.Items[8].Visible:=false;
end;

procedure TFOdtUrbanaRural.ExportarAsignacionEMG(CopiarADispositivo:boolean);
var punto:TPoint;
begin
   punto:=GroupBox12.ClientToScreen(Classes.Point(bExportarAsignacionEMG.Left, bExportarAsignacionEMG.top));
   pmExportarEMG.Popup(punto.x+10, punto.y+10);
end;

procedure TFOdtUrbanaRural.qODTHijaCODIGOESTADOODTDIAChange(
  Sender: TField);
var query:tquery;
  cont,i : integer;
begin
  if sender.AsString<>'' then
  begin
    case sender.asinteger of
      0:
      begin
        query := TQuery.create(self);
        query.Databasename:='BaseDato';
          query.sql.clear;
          query.sql.add('select count(*) from odtdiarevision o');
          query.sql.add('  where o.codigoodt='+qODTHijaCODIGOODT.AsString);
          query.sql.add('  and o.consecutivo='+qODTHijaCONSECUTIVO.AsString);
          query.open;
          cont:=query.Fields[0].AsInteger;
          query.close;
          if cont=0 then
          begin
            query.sql.clear;
            query.sql.add('insert into odtdiarevision(codigoodt,consecutivo,');
            query.sql.add('codigoestado,fechainicio) values(:codigoodt,:consecutivo,');
            query.sql.add('0,sysdate)');
            query.ParamByName('codigoodt').AsString:=qODTHijaCODIGOODT.AsString;
            query.ParamByName('consecutivo').AsString:=qODTHijaCONSECUTIVO.AsString;
            query.ExecSQL;
          end;
          qODTPadreCODIGOESTADOODT.Asinteger:=0;
          query.free;
          MensajeEstadoCire(true);
          PermitirGestionarMATERIALES(False);
          PanelMaterial.Enabled := False;
          bAprobacionCire.Enabled:=false;
      end;
      6:
      begin
        if qODTHijaFECHAFINALTRABAJO.AsString='' then
          qODTHijaFECHAFINALTRABAJO.AsDateTime:=ObtenerFechaServidor;
        PermitirGestionarMATERIALES(False);
        PanelMaterial.Enabled := False;
        bAprobacionCire.Enabled:=false;
      end;
      7:
      begin
        PermitirGestionarMATERIALES(False);
        sbEditarRequisicion.Enabled:= True;
      end;
    end;
  end;
  Codigoestadoanterior:=Sender.AsString;
end;

procedure TFOdtUrbanaRural.qODTHijaCODIGOESTADOODTDIAValidate(
  Sender: TField);
var query:tquery;
 cont:integer;
 i, Cuentaow, CuentaReportesAbiertos, CuentainfraestructuraEditada, CuentaF3, CuentaF4, CuentaUtilizaEquipos:integer;
 s, ots:string;
begin
  TRY
  query := TQuery.create(self);
  query.Databasename:='BaseDato';
  if (((Codigoestadoanterior='0') or(Codigoestadoanterior='6'))
       and ((sender.asstring<>'0') and(sender.asstring<>'6')))then
  begin
    query.sql.clear;
    query.sql.add('select count(*) from odtdiarevision o');
    query.sql.add('  where o.codigoodt='+qODTHijaCODIGOODT.AsString);
    query.sql.add('  and o.consecutivo='+qODTHijaCONSECUTIVO.AsString);
    query.sql.add('  and o.codigoestado = 1');
    query.open;
    cont:=query.Fields[0].AsInteger;
    query.close;
    if cont>0 then raise exception.create('No puede cambiar este estado porque ya pasó por Revisión CIRE.');
  end;
  query.free;
  if Sender.AsString<>'' then
  begin
    case Sender.AsInteger of
      0:
      begin
        if qODTHijaFECHAINICIOTRABAJO.AsString='' then
          raise exception.create('Debe ingresar la Fecha de inicio del trabajo.');
        query := TQuery.create(self);
        query.databasename:='BaseDato';
        query.sql.add('select count(*) from odtpresmate om');
        query.sql.add('  where om.codigoodt='+qODTHijaCODIGOODT.AsString);
        query.sql.add('  and om.consecutivo='+qODTHijaCONSECUTIVO.AsString);
        query.sql.add('  and ((nvl(cantidadconsumida,0)>0)');
        query.sql.add('        or (nvl(cantidadretiradabuena,0)>0)');
        query.sql.add('        or (nvl(cantidadconsumidadesmantelada,0)>0)');
        query.sql.add('        or (nvl(cantidadretiradamala,0)>0))');
        query.open;
        cont:=query.Fields[0].AsInteger;
        query.close;
        query.free;
        if cont=0 then
        begin
          raise exception.create('Esta Odt no cumple las condiciones para pasar a revisión por el grupo CIRE');
        end;
        PermitirGestionarMATERIALES(False);
        PanelMaterial.Enabled := False;
        // Cambios EEH
       { if EditarProcesoArea('CIRE',qODTPadreCODIGOADMINISTRATIVO.AsInteger) then
          bAprobacionCire.Enabled:=true;  }

        if AprobarCire then
          bAprobacionCire.Enabled:=true;

        MensajeEstadoCire;
      end;
      2:
      begin
        if qODTHijaFECHAINICIOTRABAJO.AsString='' then
          raise exception.create('Debe ingresar la Fecha de inicio del trabajo.');
      end;
      6:
      begin
        if qODTHijaFECHAINICIOTRABAJO.AsString='' then
          raise exception.create('Debe ingresar la Fecha de inicio del trabajo.');

        query := TQuery.create(self);
        query.databasename:='BaseDato';
        query.sql.add('SELECT count(*) as Cuenta from odtreporte ore, reporte r where ore.codigoodt = '+qodthijacodigoodt.asstring +
                              ' AND ore.consecutivo = '+qodthijaconsecutivo.asstring+ ' and ore.codigoreporte = r.codigoreporte '+
                              ' AND CODIGOESTADOREPORTE NOT IN ( 4,5,9) ');
        query.OPEN;
        CuentaReportesAbiertos:= query.fieldbyname('Cuenta').asinteger;
        query.close;
        query.free;
        if CuentaReportesAbiertos > 0 then
          raise exception.create('Debe cerrar los reportes asignados a esta ODT hija.');

        if qInfraestructura.FieldByName('estado').asstring = '1' then
        Begin
          query := TQuery.create(self);
          query.databasename:='BaseDato';
          query.sql.add('SELECT COUNT(*) AS Cuenta FROM GESTIONINFRAESTRUCTURA WHERE CLAVE1 = '+qodthijacodigoodt.asstring + 'AND CLAVE2 = '+qodthijaconsecutivo.asstring);
          query.OPEN;
          CuentainfraestructuraEditada:= query.fieldbyname('Cuenta').asinteger;
          query.close;
          query.free;
          if CuentainfraestructuraEditada = 0 then
            raise exception.create('No se ha registrado ningun cambio en la infraestructura asociada a esta ODT hija.');
        End;

        if qF3.FieldByName('estado').asstring = '1' then
        Begin
          query := TQuery.create(self);
          query.databasename:='BaseDato';
          query.sql.add('SELECT COUNT(*) AS CUENTA FROM RT_REINTEGROTRAFO WHERE CODIGOODT = '+qodthijacodigoodt.asstring + 'AND CONSECUTIVO = '+qodthijaconsecutivo.asstring);
          query.Open;
          CuentaF3:= query.fieldbyname('Cuenta').AsInteger;
          query.close;
          query.free;
          if CuentaF3 = 0 then
            raise exception.create('No se ha registrado ningun formato F3 asociado a esta ODT hija.');
        End;

        if qF4.FieldByName('estado').asstring = '1' then
        Begin
          query := TQuery.create(self);
          query.databasename:='BaseDato';
          query.sql.add('SELECT COUNT(*) AS CUENTA FROM RT_INSTALACIONTRAFO WHERE CODIGOODT = '+qodthijacodigoodt.asstring + 'AND CONSECUTIVO = '+qodthijaconsecutivo.asstring);
          query.Open;
          CuentaF4:= query.fieldbyname('Cuenta').AsInteger;
          query.close;
          query.free;
          if CuentaF4 = 0 then
            raise exception.create('No se ha registrado ningun formato F4 asociado a esta ODT hija.');
        End;

        if qUtilizaEquipos.FieldByName('estado').asstring = '1' then
        Begin
          query := TQuery.create(self);
          query.databasename:='BaseDato';
          query.sql.add('SELECT COUNT(*) AS CUENTA FROM ODTPRESEQUIPO WHERE CODIGOODT = '+qodthijacodigoodt.asstring + 'AND CONSECUTIVO = '+qodthijaconsecutivo.asstring);
          query.OPEN;
          CuentaUtilizaEquipos:= query.fieldbyname('Cuenta').asinteger;
          query.close;
          query.free;
          if CuentaUtilizaEquipos = 0 then
            raise exception.create('No se ha registrado ningun equipo asociado a esta ODT hija.');
        End;


{
        //Interfaz OW
        //vALIDAR QUE NO EXISTAN OTS ASOCIADAS A ODT QUE NO ESTEN TERMINADAS = 99 O CANCELADAS = 98 Y QUE NO SE LES
        // HALLA ASOCIADO EL MATERIAL.
        query := TQuery.create(self);
        query.databasename:='BaseDato';
        query.sql.add('SELECT codigo_ot FROM v4801a'+dblinkOW+' ot '+
        ' WHERE NOT EXISTS (SELECT * FROM inventario.ow_odtot od WHERE od.codigo_ot = ot.codigo_ot AND  materialrelacionado = ''S'') '+
        ' AND ((estado <> ''98'') OR ( (es                    tado = ''99'') AND (codigo_ot IN ( '+
        ' SELECT codigo_ot FROM ow_odtot WHERE codigoodt = '+qodthijacodigoodt.asstring +
        ' AND consecutivo = '+qodthijaconsecutivo.asstring +' AND materialrelacionado <> ''S'')))) '+
        ' AND codigo_documento_externo = '+qodthijacodigoodt.asstring +'||''-''||'+qodthijaconsecutivo.asstring);
        query.OPEN;
        Cuentaow:= query.RecordCount;
        query.First;
        while not query.eof do
        Begin
          ots:= ots +  query.fieldbyname('CODIGO_OT').asstring + ',';
          query.Next;
        end;
        Delete(ots, Length(ots), 1);
        query.close;
        query.free;
        If Cuentaow > 0 then
        Begin
           showmessage('las siguientes OT de OW aun no se an terminado de tramitar o no se les ha relacionado el material en la ODT actual: '+ots+'.');
           raise exception.create('');
        end;
        //SHOWMESSAGE('14 CASE 6 VALIDATE CODIGOESTADO ');
        //**********************************************************************************

 }

        query := TQuery.create(self);
        query.databasename:='BaseDato';
        query.sql.add('select count(*) from odtpresmate om');
        query.sql.add('  where om.codigoodt='+qODTHijaCODIGOODT.AsString);
        query.sql.add('  and om.consecutivo='+qODTHijaCONSECUTIVO.AsString);
        query.sql.add('  and ((nvl(cantidadconsumida,0)>0)');
        query.sql.add('        or (nvl(cantidadretiradabuena,0)>0)');
        query.sql.add('        or (nvl(cantidadconsumidadesmantelada,0)>0)');
        query.sql.add('        or (nvl(cantidadretiradamala,0)>0))');
        query.open;
        cont:=query.Fields[0].AsInteger;
        query.close;
        if cont>0 then
        begin
          query.sql.clear;
          query.sql.add('select count(*) from odtdiarevision o');
          query.sql.add('  where o.codigoodt='+qODTHijaCODIGOODT.AsString);
          query.sql.add('  and o.consecutivo='+qODTHijaCONSECUTIVO.AsString);
          query.sql.add('  and o.codigoestado=1');
          query.open;
          cont:=query.Fields[0].AsInteger;
          query.close;
          // Cambios EEH
          {if cont=0 then
          begin
            Sender.AsInteger:=0;
            Application.ProcessMessages;
            raise exception.create('Esta Odt Hija tiene materiales que han sido consumidos o desmantelados y por esto se pasará a revisión por el grupo CIRE.');
            Application.ProcessMessages;
          end;}
          PermitirGestionarMATERIALES(False);
          PanelMaterial.Enabled := False;
          bAprobacionCire.Enabled:=false;
        end;
        query.free;
      end;
      7:
      begin
        PermitirGestionarMATERIALES(False);
        sbEditarRequisicion.Enabled:= True;
      end;
    end;
  end;
  except
    on e:exception do
    begin
      Application.MessageBox(PCHAR(e.message),'Error',MB_OK+MB_DEFBUTTON1 + MB_ICONERROR);
      abort;
    end;
  end;
end;

procedure TFOdtUrbanaRural.bAprobacionCireClick(Sender: TObject);
var query : tquery;
  TerminarRevision:boolean;
begin
  if (Application.MessageBox('Está seguro de aprobar está ODT hija ?',PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes) then
  begin
    if (qODTHijaCODIGOODT.asstring<>'')and
       (qODTHijaCONSECUTIVO.asstring<>'')then
    begin
      TerminarRevision:=false;
      query := TQuery.create(self);
      query.DatabaseName := 'BaseDato';
      query.sql.add('update odtdiarevision set codigoestado=1,fechafin=sysdate');
      query.sql.add('where codigoodt='+qODTHijaCODIGOODT.asstring);
      query.sql.add('and consecutivo='+qODTHijaCONSECUTIVO.asstring);
      query.ExecSQL;
      query.sql.clear;
      query.sql.add('select count(*) from odtdiarevision');
      query.sql.add('where codigoodt='+qODTHijaCODIGOODT.asstring);
      query.sql.add('and consecutivo='+qODTHijaCONSECUTIVO.asstring);
      query.sql.add('and (codigoestado=0 or codigoestado is null)');
      query.open;
      if (query.fields[0].AsInteger=0) then TerminarRevision:=true;
      if (qODTHija.State in [dsEdit,dsInsert])and (qODTHija.UpdateObject<>nil)  then
      begin
        qODTHijaCODIGOESTADOODTDIA.AsString:='6';
        if TerminarRevision then
          qODTPadreCODIGOESTADOODT.AsString:='2';
      end
      else
      begin
        query.sql.clear;
        query.sql.add('update odtdia set codigoestadoodtdia=''6''');
        query.sql.add('where codigoodt='+qODTHijaCODIGOODT.asstring);
        query.sql.add('and consecutivo='+qODTHijaCONSECUTIVO.asstring);
        query.ExecSQL;
        if TerminarRevision then
        begin
          query.sql.clear;
          query.sql.add('update odt set codigoestadoodt=''2''');
          query.sql.add('where codigoodt='+qODTHijaCODIGOODT.asstring);
          query.ExecSQL;
        end;
        qODTHija.close;
        qODTHija.open;
        qODTPadre.close;
        qODTPadre.open;
      end;
      GuardarTransaccion;
      query.close;
      query.free;
    end;
    bAprobacionCire.Enabled:=false;
    MensajeEstadoCire(true);
  end;
end;

procedure TFOdtUrbanaRural.qODTHijaAfterOpen(DataSet: TDataSet);
var i:integer;
begin
  bAprobacionCire.Enabled:=False;
  PermitirGestionarMATERIALES(True);
  PanelMaterial.Enabled := True;
  if (qODTHijaCODIGOESTADOODTDIA.AsString<>'') then
  begin
    case qODTHijaCODIGOESTADOODTDIA.AsInteger of
      0:
      begin
        PermitirGestionarMATERIALES(False);
        PanelMaterial.Enabled := False;
        {if EditarProcesoArea('CIRE',qODTPadreCODIGOADMINISTRATIVO.AsInteger) then
          bAprobacionCire.Enabled:=true;   }

        if AprobarCire then
          bAprobacionCire.Enabled:= True;
      end;
      6:
      begin
        PermitirGestionarMATERIALES(False);
        PanelMaterial.Enabled := False;
      end;
      7:
      begin
        PermitirGestionarMATERIALES(False);
        PanelMaterial.Enabled := False;
        sbEditarRequisicion.Enabled:= True;
      end;
    end;
  end;
  MensajeEstadoCire;
  Codigoestadoanterior:=qODTHijaCODIGOESTADOODTDIA.AsString;
end;

function TFOdtUrbanaRural.MensajeEstadoCire(mostrar:boolean=true): string;
var query:tquery;
begin
  result:='';
  if  (qODTHijaCODIGOODT.AsString<>'') and (qODTHijaCONSECUTIVO.AsString<>'') then
  begin
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('select codigoestado,fechainicio,fechafin from odtdiarevision');
    query.sql.add('where codigoodt='+qODTHijaCODIGOODT.AsString);
    query.sql.add('and consecutivo='+qODTHijaCONSECUTIVO.AsString);
    query.open;
    if not (query.IsEmpty)and (query.fieldbyname('codigoestado').AsString<>'') then
    begin
      case query.fieldbyname('codigoestado').Asinteger of
        0: if query.fieldbyname('fechainicio').AsString <>'' then
             Result:=' En Aprobación Cire desde '+query.fieldbyname('fechainicio').AsString;
        1: if query.fieldbyname('fechafin').AsString <>'' then
             Result:=' Aprobado CIRE '+query.fieldbyname('fechafin').AsString;
      end;
    end;
    query.close;
    query.free;
  end;
  if (result<>'') and mostrar then
  begin
    lbAprobacionCire.Caption:=result;
  end
  else
    lbAprobacionCire.Caption:='Aprobación Cire';
end;

procedure TFOdtUrbanaRural.GuardarTransaccion;
var Editar:boolean;
begin
  Editar:=false;
  if (qODTHija.State in [dsEdit,dsInsert]) then
  begin
    Editar:=true;
    try
      qODTHija.post;
      qODTPadre.Post;
    except
    end;
  end;
  if qtrans.Database.InTransaction then
  begin
    qtrans.Database.commit;
    qtrans.Database.StartTransaction;
  end;
  if Editar then
  begin
    qODTHija.Edit;
    qODTPadre.Edit;
  end;
end;

procedure TFOdtUrbanaRural.bCerrarClick(Sender: TObject);
begin
  bCancelando := true;
  bDatosIncompletos := false;
  Close;
end;

function TFOdtUrbanaRural.VERIFICARODTPERMISOSEDITAR(PERMISO:string): Boolean;
var qDatos:TQuery;
begin
  Result:=false;
  ConsDll.RefrescarVariables;
  if VarCodigoUsuario = 0 then //Es Admin ?
  begin
    Result:=true;
    Exit;
  end;
  qDatos:=TQuery.Create(Application);
  try
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Add('SELECT EDITAR FROM ODTPERMISOS WHERE NOMBRETABLA = '''+permiso+'''');
    qDatos.SQL.Add('AND CODIGOUSUARIO = ' + IntToStr(VarCodigoUsuario));
    if qODTPADRECODIGOADMINISTRATIVO.AsString<>'' then
      qDatos.SQL.Add('AND CODIGOADMINISTRATIVO = ' + qODTPADRECODIGOADMINISTRATIVO.AsString);
    qDatos.Open;
    if qDatos.Fields[0].AsString = 'S' then
      Result:=true;
  finally
    qDatos.Free;
  end;
end;


function TFOdtUrbanaRural.booltostr(A: boolean):string;
begin
  if A=True then Result:='Verdadero'
  else Result:='Falso';
end;


procedure TFOdtUrbanaRural.Exportarasignacinvaca1Click(Sender: TObject);
begin
  GenerarAsignacionMovil(ExpVacia);
end;

procedure TFOdtUrbanaRural.SpeedButton27Click(Sender: TObject);
begin
  if qOdtTrafodis.UpdateObject<>nil then
  begin
    if not (qOdtTrafodis.State in [dsEdit,dsInsert]) then
      qOdtTrafodis.edit;
    fBuscarTrafoDis := tfBuscarTrafoDis.Create(Application);
    try
      if fBuscarTrafoDis.ShowModal=mrok then
        qOdtTrafodisCODIGOTRAFODIS.AsString:=fBuscarTrafoDis.qTrafodisCODIGOTRAFODIS.AsString
      else
        qOdtTrafodis.Cancel;
    finally
      fBuscarApoyo.Free;
    end;
  end;
end;

procedure TFOdtUrbanaRural.SpeedButton28Click(Sender: TObject);
begin
  MinimizarOdtHija;
  MostrarMapa;
  if (qODTHijaCODIGOGEOGRAFICO.AsString<>'') then
    BuscarBarrio(qODTHijaCODIGOGEOGRAFICO.AsString,true);
  SetElementoOdt('P2');
end;

procedure TFOdtUrbanaRural.qOdtPlanchaAfterDelete(DataSet: TDataSet);
var s:string;
begin
  qOdtPlancha.ApplyUpdates;
  qOdtPlancha.CommitUpdates;
  s:='Planchas';
  if (qOdtPlancha.recordcount>0) then
    s:= s+' ('+ inttostr(qOdtPlancha.recordcount)+'  Registros)';
  PanelTituloPlancha.Caption:= s;
end;

procedure TFOdtUrbanaRural.qOdtPlanchaAfterInsert(DataSet: TDataSet);
begin
  qOdtPlancha.FieldByName('CODIGOODT').AsFloat:=qODTHijaCODIGOODT.AsFloat;
  qOdtPlancha.FieldByName('CONSECUTIVO').AsInteger:=qODTHijaCONSECUTIVO.AsInteger;
end;

procedure TFOdtUrbanaRural.qOdtPlanchaAfterOpen(DataSet: TDataSet);
var s:string;
begin
  s:='Planchas';
  if (qOdtPlancha.recordcount>0) then
    s:= s+' ('+ inttostr(qOdtPlancha.recordcount)+'  Registros)';
  PanelTituloPlancha.Caption:= s;
end;

procedure TFOdtUrbanaRural.qOdtPlanchaAfterPost(DataSet: TDataSet);
var s:string;
begin
  qOdtPlancha.ApplyUpdates;
  qOdtPlancha.CommitUpdates;
  s:='Planchas';
  if (qOdtPlancha.recordcount>0) then
    s:= s+' ('+ inttostr(qOdtPlancha.recordcount)+'  Registros)';
  PanelTituloPlancha.Caption:= s;
end;

procedure TFOdtUrbanaRural.Exportardatosdeplanchasrelacionadas1Click(
  Sender: TObject);
begin
GenerarAsignacionMovil(ExpPlancha);
end;

procedure TFOdtUrbanaRural.ExportarDatosdetrafosyplanchas1Click(
  Sender: TObject);
begin
  GenerarAsignacionMovil(ExpMixtoTP);
end;

procedure TFOdtUrbanaRural.Exportardatosdetrafosapoyosyplanchas1Click(
  Sender: TObject);
begin
  GenerarAsignacionMovil(ExpMixtoTAP);
end;

procedure TFOdtUrbanaRural.ExportardatosdeApoyosyplanchas1Click(
  Sender: TObject);
begin
  GenerarAsignacionMovil(ExpMixtoAP);
end;

procedure TFOdtUrbanaRural.rsbOWClick(Sender: TObject);
begin
// Llamado a formulario para asociar las OT de OW.
  if qODTHijaCODIGOGRUPOTRABAJO.AsString = '' then
  Begin
    raise Exception.Create('Se necesita El grupo de Trabajo de la ODT hija, por favor Agreguelo par continuar.');
  end;
  fInterfazOW:=TfInterfazOW.Create(Application);
  fInterfazOW.qODT_OT.ParamByName('codigoodt').asfloat:= qODTHijacodigoodt.asfloat;
  fInterfazOW.qODT_OT.ParamByName('consecutivo').asinteger:= qODTHijaconsecutivo.asinteger;
  fInterfazOW.qODT_OT.open;
  fInterfazOW.codigoodt:=  qODTHijacodigoodt.asfloat;
  fInterfazOW.consecutivo:= qODTHijaconsecutivo.asinteger;
  if fInterfazOW.ShowModal = mrOk then
  begin
    qpresmate.close;
    qpresmate.open;
  end;
qpresmate.close;
qpresmate.open;

end;

procedure TFOdtUrbanaRural.sbCancelarODTHijaClick(Sender: TObject);
begin
  if ValidarCancelacionODTHija('ODTPRESMANO','EMPLEADOS',1) then exit;
  if ValidarCancelacionODTHija('ODTPRESMATE','MATERIALES',1) then exit;
  if ValidarCancelacionODTHija('EMG_ODTASIGNACION','Asignaciones Moviles',1) then exit;
  if ValidarCancelacionODTHija('ODTAPOYO','Infraestructura (APOYOS)',1) then exit;
  if ValidarCancelacionODTHija('ODTTRAFODIS','Infraestructura (TRAFOS de Distribución)',1) then exit;
  if ValidarCancelacionODTHija('ODTPLANCHA','Infraestructura (PLANCHAS)',1) then exit;
  if ValidarCancelacionODTHija('ODTREPORTE','REPORTES',1) then exit;
  if ValidarCancelacionODTHija('ODTCOBRO','Cuentas de Cobro',2) then exit;
  if ValidarCancelacionODTHija('OW_ODTOT','OTs de OW',1) then exit;
  qODTHijaCODIGOESTADOODTDIA.AsString:= '7';
end;

function TFOdtUrbanaRural.ValidarCancelacionODTHija(nombreTabla, nombreMostrar : String; tipo : Integer) : Boolean;
{tipo: identifica si la odt se puede Cancelar o no. -> 1 : Se deben borrar datos para cancelar. -> 2 : No se puede Cancelar porque no se pueden borrar los datos asociados }
var
  qConsulta : TQuery;
  textoTipo :String;
begin
  Result:= False;
  case tipo of
    1 : textoTipo:= 'Para poder cancelarla se deben borrar estos datos.';
    2 : textoTipo:= 'No se puede cancelar.';
  end;
  qConsulta:= TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.SQL.Clear;
  qConsulta.SQL.Text:= 'SELECT COUNT(*) '+
                         'FROM '+nombreTabla+' '+
                        'WHERE CODIGOODT = '+qODTHijaCODIGOODT.AsString+' '+
                          'AND CONSECUTIVO = '+qODTHijaCONSECUTIVO.AsString;
  qConsulta.Open;
  if qConsulta.Fields[0].AsInteger > 0 then
    begin
      Application.MessageBox(Pchar('Existen registros de '+nombreMostrar+' asociados a esta ODT hija... '+Chr(13)+textoTipo),'Advertencia',MB_OK+MB_DEFBUTTON1 + MB_ICONWARNING);
      Result:= True;
    end;
  qConsulta.Close;
  qConsulta.Free;
end;

procedure TFOdtUrbanaRural.bbBorrarAsignExpClick(Sender: TObject);
begin
  if (Application.MessageBox('Desea Eliminar la asignación de exportación de esta ODT hija?',PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes) then
  Begin
    borrarAsignacionEMG(qODTHijaCODIGOODT.AsString, qODTHijaCONSECUTIVO.AsString, 'E');
    GuardarTransaccion;
    qODTHijaCalcFields(qODTHija);
    dmTablasEMG.FiltrarDatos(qODTHijaCodAsignacionExportacion.AsFloat);
  End;
end;

procedure TFOdtUrbanaRural.BitBtn2Click(Sender: TObject);
begin
  if (Application.MessageBox('Desea Eliminar la asignación de importación de esta ODT hija?',PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes) then
  Begin
    borrarAsignacionEMG(qODTHijaCODIGOODT.AsString, qODTHijaCONSECUTIVO.AsString, 'I');
    GuardarTransaccion;
    qODTHijaCalcFields(qODTHija);
    dmTablasEMG.FiltrarDatos(qODTHijaCodAsignacionImportacion.AsFloat);
  end;
end;

procedure TFOdtUrbanaRural.spF3Click(Sender: TObject);
begin
//funcion F3
  If qOdtTrafodis.FieldByName('CODIGOTRAFODIS').asstring = '' then
    raise Exception.Create('Debe seleccionar un trandformador.');
  if FuncionGestionF3(qODTHijaCODIGOODT.asfloat, qODTHijaCONSECUTIVO.asfloat, qOdtTrafodisCodigoTrafodis.asfloat) then
    MinimizarOdtHija;
end;

procedure TFOdtUrbanaRural.spf4Click(Sender: TObject);
begin
//Funcion F4
  If qOdtTrafodis.FieldByName('CODIGOTRAFODIS').asstring = '' then
    raise Exception.Create('Debe seleccionar un trandformador.');
  if FuncionGestionF4(qODTHijaCODIGOODT.asfloat, qODTHijaCONSECUTIVO.asfloat, qOdtTrafodiscodigotrafodis.asfloat) then
    MinimizarOdtHija;
end;

procedure TFOdtUrbanaRural.qF3AfterPost(DataSet: TDataSet);
begin
  qF3.CommitUpdates;
  qF3.ApplyUpdates;
end;


procedure TFOdtUrbanaRural.llenarGestionAdministrativa;
var qDatos, qTemp:TQuery;
Begin

// ***********LLENAR LISTA DE CHEQUEO VACIA...

  qDatos    :=TQuery.Create(Application);
  qTemp     :=TQuery.Create(Application);
  try
    qDatos.DataBaseName  :='BaseDato';
    qTemp.DataBaseName   :='BaseDato';
    qDatos.SQL.Text:='select codigoGestionadministrativa from GESTIONADMINISTRATIVA WHERE CODIGOGESTIONADMINISTRATIVA NOT IN (SELECT CODIGOGESTIONADMINISTRATIVA   '+
                             'FROM  ODTGESTIONADMINISTRATIVA WHERE  CODIGOODT='+qODTPadreCODIGOODT.AsString + ' AND CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString+ ')';
    qDatos.Open;

    {qTemp.SQL.Text:='DELETE FROM ODTGESTIONADMINISTRATIVA WHERE (CODIGOODT='+qODTPadreCODIGOODT.AsString + ')' +
                      ' AND (CONSECUTIVO='+qODTHijaCONSECUTIVO.AsString + ')';
    qTemp.ExecSQL;}

    while not qDatos.Eof do
    begin
      qTemp.Close;
      qTemp.SQL.Text:='INSERT INTO ODTGESTIONADMINISTRATIVA (CODIGOODT, CONSECUTIVO,CODIGOGESTIONADMINISTRATIVA, ESTADO)  VALUES('+qODTHijaCODIGOODT.AsString+','+
                       qODTHijaCONSECUTIVO.AsString+','+qDatos.Fields[0].AsString+',''0'')';
      qTemp.ExecSQL;
      qDatos.Next;
    end;
  finally
    qDatos.Close;
    qDatos.Free;
    qTemp.Free;
    qF3.Close;
    qF3.Open;
    qF4.Close;
    qF4.Open;
    qInfraestructura.Close;
    qInfraestructura.Open;
    qUtilizaEquipos.Close;
    qUtilizaEquipos.open;
  end;
End;

procedure TFOdtUrbanaRural.qF4AfterPost(DataSet: TDataSet);
begin
 qF4.CommitUpdates;
 qF4.ApplyUpdates;
end;

procedure TFOdtUrbanaRural.qInfraestructuraAfterPost(DataSet: TDataSet);
begin
 qInfraestructura.CommitUpdates;
 qInfraestructura.ApplyUpdates;
end;

procedure TFOdtUrbanaRural.qUtilizaEquiposAfterPost(DataSet: TDataSet);
begin
 qUtilizaEquipos.CommitUpdates;
 qUtilizaEquipos.ApplyUpdates;
end;

procedure TFOdtUrbanaRural.qOdtTrafodisBeforeInsert(DataSet: TDataSet);
begin
If ((qOdtTrafodis.RecordCount > 0) and (((qF3ESTADO.AsString = '1') or (qF4ESTADO.AsString = '1')))) then
   raise Exception.Create('No puede existir mas de un Transformador en una Odt Hija que tenga F3 o F4.')
end;

procedure TFOdtUrbanaRural.qF3ESTADOValidate(Sender: TField);
begin
  if ((qF3ESTADO.AsString = '1') and (qodttrafodis.recordcount >= 2)) then
    raise Exception.Create('No puede existir más de un Transformador en una Odt Hija que tenga F3 o F4.');
  if (Sender.Text = '0') and ExisteF3 then
    raise Exception.Create('No se puede desmarcar la gestión de información del formato F3 en esta ODT hija debido a que existe asociado registro de F3 generado.');
end;

procedure TFOdtUrbanaRural.qF4ESTADOValidate(Sender: TField);
begin
  if ((qF4ESTADO.AsString = '1') and (qodttrafodis.recordcount >= 2)) then
    raise Exception.Create('No puede existir más de un Transformador en una Odt Hija que tenga F3 o F4.');
  if (Sender.Text = '0') and ExisteF4 then
    raise Exception.Create('No se puede desmarcar la gestión de información del formato F4 en esta ODT hija debido a que existe asociado registro de F4 generado.');
end;

procedure TFOdtUrbanaRural.qF3ESTADOChange(Sender: TField);
begin
  if qF3ESTADO.AsString = '1' then
    spF3.Enabled:= True
  else
    spF3.Enabled:= False;
  if (qF3ESTADO.AsString = '1') and ExisteF3 then
    dbcbf3.ReadOnly:= True
  else
    dbcbf3.ReadOnly:= False;
end;

procedure TFOdtUrbanaRural.qF4ESTADOChange(Sender: TField);
begin
  if qF4ESTADO.AsString = '1' then
    spF4.Enabled:= True
  else
    spF4.Enabled:= False;
  if (qF4ESTADO.AsString = '1') and ExisteF4 then
    dbcbf4.ReadOnly:= True
  else
    dbcbf4.ReadOnly:= False;
end;

procedure TFOdtUrbanaRural.qF3AfterOpen(DataSet: TDataSet);
begin
  if qF3ESTADO.AsString = '1' then
    spF3.Enabled:= True
  else
    spF3.Enabled:= False;
  if (qF3ESTADO.AsString = '1') and ExisteF3 then
    dbcbf3.ReadOnly:= True
  else
    dbcbf3.ReadOnly:= False;
end;

procedure TFOdtUrbanaRural.qF4AfterOpen(DataSet: TDataSet);
begin
  if qF4ESTADO.AsString = '1' then
    spF4.Enabled:= True
  else
    spF4.Enabled:= False;
  if (qF4ESTADO.AsString = '1') and ExisteF4 then
    dbcbf4.ReadOnly:= True
  else
    dbcbf4.ReadOnly:= False;
end;

procedure TFOdtUrbanaRural.qOdtTrafodisBeforeDelete(DataSet: TDataSet);
begin
  ValidarExisteF3F4;
end;

procedure TFOdtUrbanaRural.qOdtTrafodisBeforeEdit(DataSet: TDataSet);
begin
  ValidarExisteF3F4;
end;

procedure TFOdtUrbanaRural.ValidarExisteF3F4;
begin
  if ExisteF3(qOdtTrafodisCodigoTrafodis.AsString) and ExisteF4(qOdtTrafodisCodigoTrafodis.AsString) then
    raise Exception.Create('No se puede editar o eliminar el transformador porque existen Formatos F3 y F4 asociados en esta ODT.')
  else if ExisteF3(qOdtTrafodisCodigoTrafodis.AsString) then
    raise Exception.Create('No se puede editar o eliminar el transformador porque existe Formato F3 asociado en esta ODT.')
  else if ExisteF4(qOdtTrafodisCodigoTrafodis.AsString) then
    raise Exception.Create('No se puede editar o eliminar el transformador porque existe Formato F4 asociado en esta ODT.');
end;

function TFOdtUrbanaRural.ExisteF3(codTrafo : String = '') : Boolean;
var
  qF3F4: TQuery;
begin
  Result:= False;
  qF3F4:= TQuery.Create(Application);
  qF3F4.DatabaseName:='BaseDato';
  qF3F4.SQL.Text:='SELECT COUNT(*) TOTAL '+
                  '  FROM RT_REINTEGROTRAFO R, TRAFODIS T, ODTTRAFODIS O '+
                  ' WHERE R.CODIGOODT = '+qODTHijaCODIGOODT.AsString+' '+
                  '   AND R.CONSECUTIVO = '+qODTHijaCONSECUTIVO.AsString+' '+
                  '   AND R.CODIGOTRAFODIS = T.CODIGOTRAFODIS '+
                  '   AND T.PINTADOTRAFODIS = O.PINTADOTRAFODIS ';
  if codTrafo <> '' then
    qF3F4.SQL.Add('   AND R.CODIGOTRAFODIS = '+codTrafo);
  qF3F4.Open;
  if qF3F4.Fields[0].AsInteger > 0 then
    Result:= True;
  qF3F4.Close;
  qF3F4.Free;
end;

function TFOdtUrbanaRural.ExisteF4(codTrafo : String = '') : Boolean;
var
  qF3F4: TQuery;
begin
  Result:= False;
  qF3F4:= TQuery.Create(Application);
  qF3F4.DatabaseName:='BaseDato';
  qF3F4.SQL.Text:='SELECT COUNT(*) TOTAL '+
                  '  FROM RT_INSTALACIONTRAFO I, TRAFODIS T, ODTTRAFODIS O '+
                  ' WHERE I.CODIGOODT = '+qODTHijaCODIGOODT.AsString+' '+
                  '   AND I.CONSECUTIVO = '+qODTHijaCONSECUTIVO.AsString+' '+
                  '   AND I.CODIGOTRAFODIS = T.CODIGOTRAFODIS '+
                  '   AND T.PINTADOTRAFODIS = O.PINTADOTRAFODIS ';
  if codTrafo <> '' then
    qF3F4.SQL.Add('   AND I.CODIGOTRAFODIS = '+codTrafo);
  qF3F4.Open;
  if qF3F4.Fields[0].AsInteger > 0 then
    Result:= True;
  qF3F4.Close;
  qF3F4.Free;
end;

procedure TFOdtUrbanaRural.sbAgregarReintegroClick(Sender: TObject);
var
  qconsulta, qconsulta2: TQuery;
  CodigoReintegro: Integer;
begin
  qConsulta := TQuery.Create(nil);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.SQL.Add('SELECT SQ_CODREINTEGROBOD.NEXTVAL FROM DUAL');
  qConsulta.Open;
  CodigoReintegro := qConsulta.Fields[0].AsInteger;
  qConsulta.Close;
  qConsulta.Free;

  fReintegro := TfReintegro.Create(Application);
  fReintegro.Caption := fReintegro.Caption+' No. '+IntToStr(CodigoReintegro)+'  [Insertando]';
  fReintegro.Estado:= 'Insert';

  fReintegro.codigoReintegro:= CodigoReintegro;
  fReintegro.qCIAS.Close;
  fReintegro.qCIAS.ParamByName('CIAS_CIAS').AsFloat:= qODTPadreCODIGOZONAORIGEN.AsFloat;
  fReintegro.qCIAS.Open;
  fReintegro.qReintegromaterial.Close;
  fReintegro.qReintegromaterial.ParamByName('codigoReintegro').asinteger := fReintegro.codigoReintegro;
  fReintegro.qReintegromaterial.Open;
  fReintegro.qReintegromaterial.Insert;
  fReintegro.qReintegromaterialCODIGOREINTEGRO.AsInteger:= fReintegro.CodigoReintegro;
  fReintegro.qReintegromaterialCODIGOODT.AsFloat := qODTHijaCODIGOODT.AsFloat;
  fReintegro.qReintegromaterialCONSECUTIVO.asINTEGER := qODTHijaCONSECUTIVO.AsInteger;
  fReintegro.qReintegromaterialcias_cias.AsFloat:= qODTPadreCODIGOZONAORIGEN.AsFloat;
  fReintegro.qReintegroMaterialFECHAREINTEGRO.AsDateTime:= Now;

  fReintegro.codigoodt:= qODTHijaCODIGOODT.AsFloat;
  fReintegro.consecutivo:= qODTHijaCONSECUTIVO.AsInteger;

  fReintegro.qReintegroMaterialDetalle.Close;
  fReintegro.qReintegroMaterialDetalle.Open;
  fReintegro.qReintegroMaterialDetalle.Insert;
  if fReintegro.ShowModal = mrOk then
  begin
    if not(fReintegro.qReintegromaterial.State  in[dsInsert,dsEdit]) then
      fReintegro.qReintegromaterial.Edit;

    //fReintegro.qTrasladoMaterialFECHATRASLADO.ASDATETIME:= fTraslado.dtpFechaTraslado.DateTime;
    fReintegro.qReintegroMaterial.Post;

    if fReintegro.qReintegroMaterialDetalle.State in[dsInsert,dsEdit] then
      fReintegro.qReintegroMaterialDetalle.Post;

    fReintegro.qReintegroMaterialDetalle.First;

    qPresMate.Close;
    qPresMate.Open;
  end
  else
  begin
    qConsulta := TQuery.Create(nil);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.SQL.Clear;
    qConsulta.SQL.Add('DELETE FROM ODTREINTEGRODETALLE WHERE CODIGOREINTEGRO = '+IntToStr(CodigoReintegro));
    qConsulta.ExecSQL;
    qConsulta.Close;

    qConsulta.SQL.Clear;
    qConsulta.SQL.Add('DELETE FROM ODTREINTEGRO WHERE CODIGOREINTEGRO = '+IntToStr(CodigoReintegro));
    qConsulta.ExecSQL;
    qConsulta.Close;
    qConsulta.Free;
  end;

  fReintegro.Free;
  qReintegros.Close;
  qReintegros.Open;
  sbEditarReintegro.Enabled := qReintegros.RecordCount <> 0;
  sbEliminarReintegro.Enabled := qReintegros.RecordCount <> 0;
  if ((EditarODT = true) or (qODTHija.State in [dsInsert])) then
    sbImprimirReintegro.Enabled := qReintegros.RecordCount <> 0;

end;

procedure TFOdtUrbanaRural.sbEliminarReintegroClick(Sender: TObject);
var
  qConsulta: TQuery;
begin
  if ((qReintegrosESTADO.asstring = 'A') or (qReintegrosESTADO.asstring = 'P')) THEN
      raise Exception.Create('El reintegro se encuentra en estado Anulado o Procesado.');

  if Application.MessageBox('Esta seguro de eliminar este registro? ','Advertencia!', mb_yesNoCancel)=mrYes then
  begin
    qConsulta := TQuery.Create(nil);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.SQL.Clear;
    qConsulta.SQL.Add('DELETE FROM ODTREINTEGRODETALLE WHERE CODIGOREINTEGRO = '+qReintegrosCODIGOREINTEGRO.AsString);
    qConsulta.ExecSQL;
    qConsulta.Close;
    qConsulta.SQL.Clear;
    qConsulta.SQL.Add('UPDATE ODTREINTEGRO SET ESTADO = ''A'' WHERE CODIGOREINTEGRO = '+qReintegrosCODIGOREINTEGRO.AsString);
    qConsulta.ExecSQL;
    qConsulta.Close;
    qConsulta.Free;
    
    qReintegros.Close;
    qReintegros.Open;
  end;
end;

procedure TFOdtUrbanaRural.sbEditarReintegroClick(Sender: TObject);
begin
  if ((qReintegrosESTADO.asstring = 'A') or (qReintegrosESTADO.asstring = 'P')) THEN
      raise Exception.Create('El reintegro se encuentra en estado Anulado o Procesado  y no puede ser editado.');

  fReintegro := tfReintegro.Create(Application);
  fReintegro.Estado:= 'Edit';
  fReintegro.Caption := fReintegro.Caption+' No. '+qReintegrosCODIGOREINTEGRO.AsString+'  [Editando]';
  fReintegro.DBNavigator2.VisibleButtons:= [nbPrior,nbNext,nbInsert,nbEdit,nbPost,nbCancel];

  fReintegro.qCIAS.Close;
  fReintegro.qCIAS.ParamByName('CIAS_CIAS').asfloat:= qODTPadreCODIGOZONAORIGEN.AsFloat;
  fReintegro.qCIAS.Open;

  fReintegro.qReintegroMaterial.ParamByName('codigoreintegro').AsInteger := qReintegrosCODIGOREINTEGRO.AsInteger;
  fReintegro.qReintegroMaterial.Open;

  fReintegro.qReintegroMaterialDetalle.ParamByName('codigoreintegro').AsInteger := qReintegrosCODIGOREINTEGRO.AsInteger;
  fReintegro.qReintegroMaterialDetalle.Open;

  fReintegro.qreintegroMaterialdetalleInicial.ParamByName('codigoreintegro').AsInteger := qReintegrosCODIGOREINTEGRO.AsInteger;
  fReintegro.qreintegroMaterialdetalleInicial.Open;

  fReintegro.codigoodt:= qODTHijaCODIGOODT.AsFloat;
  fReintegro.consecutivo:= qODTHijaCONSECUTIVO.AsInteger;

  fReintegro.qReintegroMaterialDetalle.Edit;
  fReintegro.codigoreintegro:= qReintegrosCODIGOREINTEGRO.AsInteger;
  if fReintegro.ShowModal = mrOk then
  begin
    fReintegro.qReintegroMaterialDetalle.ApplyUpdates;
    fReintegro.qReintegroMaterialDetalle.CommitUpdates;
  end;
  qPresMate.Close;
  qPresMate.Open;
  fReintegro.Free;
end;

procedure TFOdtUrbanaRural.sbImprimirReintegroClick(Sender: TObject);
var
  sCodReintegro: string;
begin
  if ((qReintegrosESTADO.AsString = 'A') or (qReintegrosESTADO.AsString = 'P')) then
    raise Exception.Create('El reintegro se encuentra en estado Anulado o Procesado y no puede ser impreso.');

  if MaterialModificado = True then
     raise Exception.Create('El listado de material ha sido modificado. Guarde la información de la ODT Hija e intentelo nuevamente.');

  if (qODTHijaMATERIALREINTEGRADO.asstring <> 'S') or (permiso = true) then
  begin
   { if Application.MessageBox(PChar('Si imprime esta nota se bloqueará y no permitira imprimirla nuevamente. Esta seguro que desea hacerlo?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idNo then
      raise Exception.Create('Operacion Cancelada...');       }
    try
      sCodReintegro:= qReintegrosCODIGOREINTEGRO.AsString;
      minimizarodthija;
      fQRodtDevoluciones := TfQRODTDevoluciones.Create(Application);
      fQRodtDevoluciones.qempresa.Open;
      fQRodtDevoluciones.qempresa2.Open;
      fQRodtDevoluciones.qlNombreEmpresa.caption:= fQRodtDevoluciones.qEmpresa2NOMBREEMPRESA.asstring;
      fQRodtDevoluciones.qrlNumeroReintegro.caption:=  'Reintegro #  '+sCodReintegro;
      fQRodtDevoluciones.qCia.Open;
      fQRodtDevoluciones.qCliente.open;
      fQRodtDevoluciones.qmaterial.open;
      fQRodtDevoluciones.qunidad.open;
      fQRodtDevoluciones.qEncabezado.Close;
      fQRodtDevoluciones.qEncabezado.ParamByName('codigoreintegro').AsString:= sCodReintegro;
      fQRodtDevoluciones.qEncabezado.Open;
      fQRodtDevoluciones.qReintegro.Close;
      fQRodtDevoluciones.qReintegro.ParamByName('codigoreintegro').AsString:= sCodReintegro;
      fQRodtDevoluciones.qReintegro.Open;
      //fQRodtDevoluciones.qrimage1.visible:= true;

      fQRodtDevoluciones.QRDevoluciones.Preview;
      fQRodtDevoluciones.qempresa.close;
      fQRodtDevoluciones.qCia.close;
      fQRodtDevoluciones.qMaterial.close;
      fQRodtDevoluciones.qUnidad.close;
      fQRodtDevoluciones.qReintegro.Close;
      //Notebook.ActivePage :=tsMaterial;
    except
      fQRodtDevoluciones.free;
    end;
  end
  else
    //Application.MessageBox('Esta ODT no esta finalizada.', 'Advertencia', MB_OK + MB_ICONWARNING);
    Application.MessageBox('La Nota de Ingeniería de esta ODT ya fue Impresa.', 'Advertencia', MB_OK + MB_ICONWARNING);
end;

procedure TFOdtUrbanaRural.SpeedButton11Click(Sender: TObject);
begin
  {if qODTCliente.UpdateObject<>nil then
  begin
    if not (qODTApoyo.State in [dsEdit,dsInsert]) then
      qODTApoyo.edit;
    fBuscarApoyo := TfBuscarApoyo.Create(Application);
    if fBuscarApoyo.ShowModal=mrok then
    begin
      case fBuscarApoyo.OrderCombo.ItemIndex of
       0:begin
           //qODTApoyoPINTADOAPOYO.AsString:=fBuscarApoyo.qApoyo.FIELDBYNAME('PINTADOAPOYO').AsString;
           qODTApoyoCODIGOAPOYO.AsString:=fBuscarApoyo.qApoyo.FIELDBYNAME('CODIGOAPOYO').AsString;
           qODTApoyoCODIGOACTUAL.AsString:=fBuscarApoyo.qApoyo.FIELDBYNAME('CODIGOACTUAL').AsString;
           qODTApoyoCODIGOALUMBRADOPUBLICO.AsString:=fBuscarApoyo.qApoyo.FIELDBYNAME('CODIGOALUMBRADOPUBLICO').AsString;
         end;
       //1:qODTApoyoPINTADOAPOYO.AsString:=fBuscarApoyo.qApoyo.FIELDBYNAME('PINTADOAPOYO').AsString;
       1:qODTApoyoCODIGOAPOYO.AsString:=fBuscarApoyo.qApoyo.FIELDBYNAME('CODIGOAPOYO').AsString;
      end;
    end
    else
      qOdtTrafodis.Cancel;
    fBuscarApoyo.Free;
  end; }
end;

procedure TFOdtUrbanaRural.SpeedButton14Click(Sender: TObject);
var punto:tpoint;
begin
{  punto:= pOdtApoyos.ClientToScreen(Classes.Point(tbutton(Sender).Left,tbutton(Sender).top));
  pmApoyo.Popup(punto.x+10, punto.y+10);  }
end;

procedure TFOdtUrbanaRural.SpeedButton15Click(Sender: TObject);
begin
 { if (qODTApoyo.FieldByName('PINTADOAPOYO').AsString <> '') then
  begin
    if not ProcManager.CanProcExecute('Agregar Fotos a ODT') then
    begin
      Application.MessageBox('No tiene derechos para este proceso.', 'Informacion', MB_ICONINFORMATION+MB_OK);
      Exit;
    end;
    FCargarFotosFTP:=TFCargarFotosFTP.Create(Application);
    FCargarFotosFTP.bODTFoto:= True;
    FCargarFotosFTP.CodigoODT:= qODTApoyo.FieldByName('CODIGOODT').AsString;
    FCargarFotosFTP.ConsecutivoODT:= qODTApoyo.FieldByName('CONSECUTIVO').AsString;
    FCargarFotosFTP.Cargar(qODTApoyo.FieldByName('PINTADOAPOYO').AsString,1);//1-Foto de Apoyo
  end;   }
end;

procedure TFOdtUrbanaRural.SpeedButton8Click(Sender: TObject);
var Lista : TStringList;
qry:Tquery;
x:integer;
begin
{  Lista := TStringList.Create;
  qry:=Tquery.Create(nil);
  qry.DatabaseName:='BaseDato';
  qry.SQL.Clear;

  If ParametroPintado = 'S' then
  Begin
    qry.SQL.Add('SELECT A.CODIGOAPOYO,A.X,A.Y FROM APOYO A, ODTAPOYO OA ');
    qry.SQL.Add('WHERE OA.PINTADOAPOYO=A.PINTADOAPOYO AND OA.PINTADOAPOYO<>00');
    qry.SQL.Add('AND OA.CODIGOODT=:CODIGOODT AND OA.CONSECUTIVO=:CONSECUTIVO');
  end
  else
  Begin
    qry.SQL.Add('SELECT A.CODIGOAPOYO,A.X,A.Y FROM APOYO A, ODTAPOYO OA ');
    qry.SQL.Add('WHERE OA.CODIGOAPOYO=A.CODIGOAPOYO');
    qry.SQL.Add('AND OA.CODIGOODT=:CODIGOODT AND OA.CONSECUTIVO=:CONSECUTIVO');
  End;

  qry.DataSource:=dsOdtHija;
  qry.Open;
  if qry.RecordCount>0 then
  begin
    qry.First;
    x:=0;
    while not qry.Eof do
    begin
      Lista.Add(qry.Fields[0].asString+','+inttostr(x)+',0');
      x:=x+20;
      qry.Next;
    end;
    MinimizarOdtHija;
    MostrarVistaLateralApoyosOdt(Lista,qODTHijaCODIGOODT.asfloat,qODTHijaCONSECUTIVO.asfloat);
//    MostrarVistaLateralApoyos(Lista);
    Lista.Free;
  end
  else
    ShowMessage('No hay apoyos Asociados a la ODT'); }
end;

procedure TFOdtUrbanaRural.SpeedButton10Click(Sender: TObject);
var Lista : TStringList;
  qry:Tquery;
  s:string;
begin
 { if not(qODTApoyo.IsEmpty) then
  begin
    MinimizarOdtHija;
    qODTApoyo.First;
    s:='';
    if qODTApoyo.RecordCount<>1 then
    begin
      while not(qODTApoyo.Eof) do
      begin
        if (qODTApoyoCODIGOAPOYO.AsString<>'')then
          s:=s+','+qODTApoyoCODIGOAPOYO.AsString;
        qODTApoyo.Next;
      end;
      if (s<>'') then
      begin
        s:='('+copy(s,2,length(s)-1)+')';
                                                                                     
        Lista := TStringList.Create;
        qry:=Tquery.Create(nil);
        qry.DatabaseName:='BaseDato';
        qry.SQL.Clear;
        qry.SQL.Add('SELECT A.CODIGOAPOYO FROM APOYO A');
        qry.SQL.Add('WHERE CODIGOAPOYO in'+s);
        qry.DataSource:=dsOdtHija;
        qry.Open;
        if qry.RecordCount>0 then
        begin
          qry.First;
          while not qry.Eof do
          begin
            Lista.Add(qry.Fields[0].asString);
            qry.Next;
          end;
          MostrarMapa;
          MarcarApoyos(Lista);
          Lista.Free;
        end;
      end;
    end
    else
    begin
      if not(Buscarapoyo(qODTApoyoCodigoApoyo1.AsString,true)) then
        showmessage('No se encontró el apoyo.');
    end;
  end
  else
    ShowMessage('No hay apoyos Asociados a la ODT');  }
end;

procedure TFOdtUrbanaRural.qOdtClieentesgdAfterDelete(DataSet: TDataSet);
begin
  qOdtClieentesgd.ApplyUpdates;
  qOdtClieentesgd.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qOdtClieentesgdAfterInsert(DataSet: TDataSet);
begin
  with DataSet do
  begin
    FieldByName('CODIGOODT').AsFloat  := qODTHijaCODIGOODT.AsFloat;
    FieldByName('CONSECUTIVO').AsFloat:= qODTHijaCONSECUTIVO.AsFloat;
  end;
end;

procedure TFOdtUrbanaRural.qOdtClieentesgdAfterPost(DataSet: TDataSet);
begin
  qOdtClieentesgd.ApplyUpdates;
  qOdtClieentesgd.CommitUpdates
end;

procedure TFOdtUrbanaRural.qOdtClieentesgdCalcFields(DataSet: TDataSet);
var qcodigo:tquery;
begin
  qcodigo:=TQuery.Create(self);
  qcodigo.DatabaseName:='BaseDato';
  qcodigo.sql.add('SELECT CODIGOCUENTA FROM CLIENTESGD WHERE CODIGOCLIENTESGD ='''+qOdtClienteSgdCODIGOCLIENTESGD.asstring+'''');
  qcodigo.open;
  qOdtClienteSgdCODIGOCUENTA.AsInteger:=qcodigo.fields[0].AsInteger;
  qcodigo.close;
  qcodigo.sql.clear;
  qcodigo.free;
end;

procedure TFOdtUrbanaRural.qOdtClieentesgdUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
{case UpdateKind of
    ukInsert:
    begin
      qPresMate.Cancel;
      if MessageDlg('Datos Incompletos o Erróneos al Insertar un Apoyo.'+Chr(13)+
               'Desea Eliminar Registro Erróneo?.'
      ,mtWarning,[mbYes, mbNo],0) = mrYes then
      begin
      UpdateAction:=uaAbort;
      end;
    end;
    ukModify:
    begin
      MessageDlg('Error al editar un apoyo, posiblemente duplicado o datos erróneos.',
      mtWarning,[mbOk],0);
      UpdateAction:=uaAbort;
    end;
  end;  }
end;

procedure TFOdtUrbanaRural.SpeedButton20Click(Sender: TObject);
begin
  if qODTClientesgd.UpdateObject<>nil then
  begin
    if not (qODTClientesgd.State in [dsEdit,dsInsert]) then
      qODTClientesgd.edit;
    fBuscarClientes := TfBuscarClientes.Create(Application);
    if fBuscarClientes.ShowModal=mrok then
      qOdtClienteSgdCODIGOCLIENTESGD.AsString:=fBuscarClientes.qClientesCODIGOCLIENTESGD.AsString
    else
      qOdtClienteSgd.Cancel;
    fBuscarClientes.Free;
  end;
end;

procedure TFOdtUrbanaRural.dbgSerialEditButtonClick(Sender: TObject);
var
i,Materiales,SerialesSeleccionados,SerialesqSerial:integer;
//CodigosMateriales: TStringList;
begin
 (* if ((qTrasladoMaterialCIAS_CIAS.asstring = '') or (qTrasladoMaterialCOD_ALMACEN.asstring = '') or (qTrasladoMaterialCOD_BODEGA.asstring = '')) then
    raise Exception.Create('Debe seleccionar el area, almacen y bodega del Traslado.');*)
  {if qpresmate.State in[dsInsert] then
    qpresmate.post;}
  //Pasar parámetros de busqueda a formulario fBuscarSerialMaterial
  fBuscarSerialMaterial := tfBuscarSerialMaterial.Create(Application);
  //  fBuscarSerialMaterial.qSerialcuadrilla.ParamByName('codigoGrupoTrabajo').asfloat:= fOdturbanarural.qodthijacodigogrupotrabajo.AsFloat; //Grupo de trabajo ODT Destino
  //  fBuscarSerialMaterial.qSerialcuadrilla.ParamByName('codigoAdministrativo').asfloat:= fOdturbanarural.qodtpadreCODIGOADMINISTRATIVO.asfloat; //codigo Adminsitrativo ODT Destino
  fBuscarSerialMaterial.qSerialcuadrilla.ParamByName('codigoGrupoTrabajo').asfloat:= qODTHijaCODIGOGRUPOTRABAJO.AsFloat; //
  fBuscarSerialMaterial.qSerialcuadrilla.ParamByName('codigoAdministrativo').asfloat:= qodtpadreCODIGOADMINISTRATIVO.AsFloat;
  fBuscarSerialMaterial.qSerialcuadrilla.ParamByName('codigoMaterial').asfloat:= qpresmateCODIGOMATERIAL.AsFloat;
  fBuscarSerialMaterial.qSerialcuadrilla.open;


  SerialesqSerial:=qSerial.RecordCount;
  Materiales:=qPresMateCANTIDADCONSUMIDA.AsInteger + qPresMateCANTIDADCONSUMIDADESMANTELADA.AsInteger;

  if(Materiales<=0) then raise Exception.Create('Por favor primero indique la cantidad de materiales');
  if(SerialesqSerial<Materiales) then
  begin
  if fBuscarSerialMaterial.ShowModal = mrOk then
  begin
    if fBuscarSerialMaterial.DBGridBuscarSerial.SelectedRows.Count>0 then
    begin
   //Registrar seriales en ALM_SerialMaterial
    qAlmSerial.Close;
    qAlmSerial.Open;

      //Seriales Seleccionados
      SerialesSeleccionados:=fBuscarSerialMaterial.DBGridBuscarSerial.SelectedRows.Count+SerialesqSerial;

     if(SerialesSeleccionados=Materiales) then
     begin
       for i:=0 to fBuscarSerialMaterial.DBGridBuscarSerial.SelectedRows.Count-1 do
       begin
          fBuscarSerialMaterial.qSerialcuadrilla.BookMark:=fBuscarSerialMaterial.DBGridBuscarSerial.SelectedRows.Items[i];
          //Registro de movimiento en COM_TRASLADOSERIAL
          qSerial.insert;
          qSerialCODIGOODT.asfloat:=   qODTHijaCODIGOODT.asfloat;
          qSerialCONSECUTIVO.AsInteger:=  qODTHijaCONSECUTIVO.asinteger;
          qSerialCOD_CATALOGO.AsFloat:=qPresmateCODIGOMATERIAL.AsFloat;
          qSerialSERIAL.AsString:=fBuscarSerialMaterial.qSerialCuadrillaSERIAL.AsString;
          qSerial.post;
          //Registro de moviemento en ALM_SERIALMATERIAL del destino
          qAlmSerial.Edit;

          //Arreglar EEH

          qAlmSerialCODIGOMATERIAL.AsFloat:=qpresmateCODIGOMATERIAL.AsFloat;
          qAlmSerialSERIAL.AsString:=fBuscarSerialMaterial.qSerialCuadrillaSERIAL.AsString;


          {qAlmSerialCODIGOADMINISTRATIVO.AsFloat:=qodtpadreCODIGOADMINISTRATIVO.AsFloat;
          qAlmSerialCODIGOGRUPOTRABAJO.AsFloat:=qODTHijaCODIGOGRUPOTRABAJO.AsFloat; }
          qAlmSerialCODIGOADMINISTRATIVO.AsFloat:=0;
          qAlmSerialCODIGOGRUPOTRABAJO.AsFloat:=0;

          qAlmSerial.Post;
       end;
     end
     else showmessage('La cantidad de seriales seleccionados es diferente a la cantidad de materiales indicados');
    end;
  end;
  fBuscarSerialMaterial.free;
  end else showmessage('Hay más seriales que cantidad de materiales');
end;

procedure TFOdtUrbanaRural.qSerialAfterDelete(DataSet: TDataSet);
begin
   if qSerial.UpdatesPending then
   begin
   qSerial.ApplyUpdates;
   qSerial.CommitUpdates;
   end;

   if qAlmSerial.UpdatesPending then
   begin
   qAlmSerial.ApplyUpdates;
   qAlmSerial.CommitUpdates;
   end;
end;

procedure TFOdtUrbanaRural.qSerialAfterPost(DataSet: TDataSet);
begin
  qSerial.ApplyUpdates;
  qSerial.CommitUpdates;
end;

procedure TFOdtUrbanaRural.qSerialBeforeDelete(DataSet: TDataSet);
begin
     qAlmSerial.Close;
     qAlmSerial.Open;
     qAlmSerial.Edit;
     qAlmSerialCODIGOMATERIAL.AsFloat:=qPresMateCODIGOMATERIAL.AsFloat;
     qAlmSerialSERIAL.AsString:=qSerialSERIAL.AsString;
     qAlmSerialCODIGOADMINISTRATIVO.AsFloat:=qodtpadreCODIGOADMINISTRATIVO.AsFloat;
     qAlmSerialCODIGOGRUPOTRABAJO.AsFloat:=qodthijaCODIGOGRUPOTRABAJO.AsFloat;
     qAlmSerial.Post;
end;

procedure TFOdtUrbanaRural.qAlmSerialAfterPost(DataSet: TDataSet);
begin
   qAlmSerial.ApplyUpdates;
   qAlmSerial.CommitUpdates;
end;


procedure TFOdtUrbanaRural.IngresarMaterialAjuste;
var
 qry,qry2:Tquery;
 sql:string;
 can:integer;
begin
  qry:=Tquery.Create(Application);
  qry.databasename:='BaseDato';
  qry2:=Tquery.Create(Application);
  qry2.databasename:='BaseDato';

  sql:='Select sm.CODIGOMATERIAL,sm.CANTIDAD from STOCKMINIMOLABOR sm where sm.codigolabor='''+qODTPADRECODIGOLABOR.asString+'''';
  qry.sql.Text:=sql;
  qry.Open;
  while not qry.eof do
  begin
    can:=0;
    sql:='Select m.CODIGOMATERIAL,nvl(cantidadactual, 0)+nvl(cantidadactualdesmanteladabuen, 0) total '+
         'from STOCKGRUPOTRABAJO sg,materialessa m where sg.codigomaterial=m.CODIGOMATERIAL '+
         'and m.CODIGOMATERIAL='+qry.Fields[0].AsString+
         ' and sg.codigogrupotrabajo ='+qODTHIJACODIGOGRUPOTRABAJO.AsString +
         ' and sg.codigoADMINISTRATIVO ='+qODTPadreCODIGOADMINISTRATIVO.AsString;
    qry2.SQL.Clear;
    qry2.SQL.Text:=sql;
    qry2.Open;
    if not qry2.isempty then
    begin
      if qry.Fields[1].asInteger>qry2.Fields[1].asInteger then
        can:=qry.Fields[1].asInteger-qry2.Fields[1].asInteger;
    end
    else
      can:=qry.Fields[1].asInteger;

    if can>0 then
    begin
      qPRESMATE.close;
      qPRESMATE.open;
      qPRESMATE.insert;
      qPRESMATECODIGOMATERIAl.AsString:=qry.Fields[0].AsString;
      qPRESMATECANTIDADSOLICITADA.AsInteger:=can;

      qPresmate.Post;
    end;

    qPRESMATE.close;
    qPRESMATE.open;

    qry.Next;
  end;
  qry2.close;
  qry2.free;
  qry.close;
  qry.free;
end;

Function  TFOdtUrbanaRural.ValidarAjusteStock:boolean;
var
 qry:Tquery;
 sql:string;
begin
  Result:=False;
  qry:=Tquery.Create(Application);
  qry.databasename:='BaseDato';
  sql:='Select * from STOCKMINIMOLABOR where codigolabor='''+qODTPADRECODIGOLABOR.asString+'''';
  qry.sql.Text:=sql;
  qry.Open;
  if not qry.IsEmpty then
    Result:=True
  else
  //  Application.MessageBox('No existe Stock Mínimo definido para esta labor.', 'Advertencia', MB_OK + MB_ICONWARNING);

  qry.Close;
  qry.free;
end;

function TFOdtUrbanaRural.BorrarODTHija(pCodigoODT, pConsecutivo: string): Boolean;
var
  qry: TQuery;
begin
  try
    result:= True;
    qry:= TQuery.Create(nil);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Clear;
    qry.SQL.Add('DELETE FROM ODTDIA WHERE CODIGOODT = '+pCodigoODT);
    qry.SQL.Add('AND CONSECUTIVO = '+pConsecutivo);
    qry.ExecSQL;
    qry.Close;
    qry.Free;
  except
    on e: Exception do
    begin
      result:= False;
      qry.Close;
      qry.Free;
    end;
  end;
end;

procedure TFOdtUrbanaRural.PermitirGestionarMATERIALES(pEstado: Boolean);
var
  i: integer;
begin
  bPermiteGestionMATERIALES:= pEstado;

  for i := 1 to pcMaterial.PageCount-1 do
  begin
    if pcMaterial.Pages[i]=tsMaterialRequisicion then
    begin
      dbgRequisiciones.ReadOnly:= pEstado;
      sbAgregarRequisicion.Enabled:= pEstado;
      sbEliminarRequisicion.Enabled:= pEstado;
      sbEditarRequisicion.Enabled:= pEstado;
    end
    else if pcMaterial.Pages[i]=tsMaterialTraslado then
    begin
      DBGrid3.ReadOnly:= pEstado;
      sbAgregarTraslado.Enabled:= pEstado;
      sbEliminarTraslado.Enabled:= pEstado;
      sbEditarTraslado.Enabled:= pEstado;
    end
    else if pcMaterial.Pages[i]=tsMaterialReintegro then
    begin
      DBGrid2.ReadOnly:= pEstado;
      sbAgregarReintegro.Enabled:= pEstado;
      sbEliminarReintegro.Enabled:= pEstado;
      sbEditarReintegro.Enabled:= pEstado;
    end
    else
      pcMaterial.Pages[i].Enabled:=pEstado;
  end;
end;

procedure TFOdtUrbanaRural.ActualizarCantidadReservada;
var
  qry: TQuery;
begin
  try
    qry:= TQuery.Create(nil);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Clear;
    qry.SQL.Add('UPDATE ODTPRESMATE OP');
    qry.SQL.Add('  SET (OP.CANTIDADENTREGADA, OP.CANTIDADRESERVADA) =');
    qry.SQL.Add('         (SELECT SUM(NVL(R.CANTIDAD_ENTREGADA,0)), SUM(NVL(R.CANTIDAD_RESERVADA,0)) FROM');
    qry.SQL.Add('             '+EsquemaAlmacen+'COM_M_RESERVA_INVENTARIO'+DBLink+' R,');
    qry.SQL.Add('             '+EsquemaAlmacen+'COM_M_REQUISICION_MOVI'+DBLink+' M,');
    qry.SQL.Add('             '+EsquemaAlmacen+'COM_M_REQUISICION'+DBLink+' C,');
    qry.SQL.Add('             ODTREQUISICION I');
    qry.SQL.Add('            WHERE I.CODIGOREQUISICION = C.COD_REQUISICION');
    qry.SQL.Add('                 AND I.VIGENCIA=C.VIGENCIA');
    qry.SQL.Add('                 AND I.EMPRESA = C.CIAS_CIAS');
    qry.SQL.Add('                 AND C.COD_REQUISICION=M.COD_REQUISICION');
    qry.SQL.Add('                 AND C.VIGENCIA = M.VIGENCIA');
    qry.SQL.Add('                 AND C.CIAS_CIAS = M.CIAS_CIAS');
    qry.SQL.Add('                 AND M.COD_REQUISICION =R.COD_REQUISICION');
    qry.SQL.Add('                 AND M.VIGENCIA = R.VIGENCIA');
    qry.SQL.Add('                 AND M.CIAS_CIAS = R.CIAS_CIAS');
    qry.SQL.Add('                 AND M.RENGLON = R.RENGLON');
    qry.SQL.Add('                 AND R.COD_CATALOGO = OP.CODIGOMATERIAL');
    qry.SQL.Add('                 AND I.CODIGOODT = :CODIGOODT');
    qry.SQL.Add('                 AND I.CONSECUTIVO = :CONSECUTIVO');
    qry.SQL.Add('                 AND C.APROBADASN = ''SI'' ');
    qry.SQL.Add('                 AND C.ESTADO  = ''VIGENTE'') ');
    qry.SQL.Add('WHERE OP.CODIGOODT = :CODIGOODT');
    qry.SQL.Add(' AND OP.CONSECUTIVO = :CONSECUTIVO');
    qry.SQL.Add(' AND EXISTS');
    qry.SQL.Add('       (SELECT NULL FROM');
    qry.SQL.Add('             '+EsquemaAlmacen+'COM_M_RESERVA_INVENTARIO'+DBLink+' R,');
    qry.SQL.Add('             '+EsquemaAlmacen+'COM_M_REQUISICION_MOVI'+DBLink+' M,');
    qry.SQL.Add('             '+EsquemaAlmacen+'COM_M_REQUISICION'+DBLink+' C,');
    qry.SQL.Add('             ODTREQUISICION I');
    qry.SQL.Add('             WHERE I.CODIGOREQUISICION = C.COD_REQUISICION');
    qry.SQL.Add('                 AND I.VIGENCIA=C.VIGENCIA');
    qry.SQL.Add('                 AND I.EMPRESA = C.CIAS_CIAS');
    qry.SQL.Add('                 AND C.COD_REQUISICION=M.COD_REQUISICION');
    qry.SQL.Add('                 AND C.VIGENCIA = M.VIGENCIA');
    qry.SQL.Add('                 AND C.CIAS_CIAS = M.CIAS_CIAS');
    qry.SQL.Add('                 AND M.COD_REQUISICION =R.COD_REQUISICION');
    qry.SQL.Add('                 AND M.VIGENCIA = R.VIGENCIA');
    qry.SQL.Add('                 AND M.CIAS_CIAS = R.CIAS_CIAS');
    qry.SQL.Add('                 AND M.RENGLON = R.RENGLON');
    qry.SQL.Add('                 AND R.COD_CATALOGO = OP.CODIGOMATERIAL');
    qry.SQL.Add('                 AND I.CODIGOODT = :CODIGOODT');
    qry.SQL.Add('                 AND I.CONSECUTIVO = :CONSECUTIVO');
    qry.SQL.Add('                 AND C.APROBADASN = ''SI'' ');
    qry.SQL.Add('                 AND C.ESTADO  = ''VIGENTE'')');
    qry.ParamByName('CODIGOODT').AsString:= qODTHijaCODIGOODT.AsString;
    qry.ParamByName('CONSECUTIVO').AsString:= qODTHijaCONSECUTIVO.AsString;
    qry.ExecSQL;
    qry.Close;
    qry.Free;
  except
    on e: Exception do
    begin
      qry.Close;
      qry.Free;
    end;
  end;
end;

end.


