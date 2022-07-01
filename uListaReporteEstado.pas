unit uListaReporteEstado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, Series, DBCtrls, Grids, DBGrids, RXDBCtrl,
  TeEngine, TeeProcs, Chart, DBChart, ComCtrls, RXClock, Menus, uFIMPComunes;

type
  TFListaReporteEstado = class(TFdSgdListaBase)
    SBBitacoraMovil: TSpeedButton;
    SBOrdenTrabajo: TSpeedButton;
    Bevel5: TBevel;
    SBDESCCliente: TSpeedButton;
    SBDESCReporte: TSpeedButton;
    SBActualizaTiempos: TSpeedButton;
    SBCartografia: TSpeedButton;
    SBSeleccionarMovil: TSpeedButton;
    BitBtnOrdenar: TSpeedButton;
    BitBtnBuscar: TSpeedButton;
    BitBtnFiltrar: TSpeedButton;
    SBFiltroCartografia: TSpeedButton;
    Bevel4: TBevel;
    qRecibidos: TQuery;
    dsRecibidos: TDataSource;
    qClienteDesc: TQuery;
    lFecha: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    RxClock2: TRxClock;
    PCLibro: TPageControl;
    tsRecibidos: TTabSheet;
    Panel4: TPanel;
    Panel9: TPanel;
    Panel5: TPanel;
    Shape25: TShape;
    Shape31: TShape;
    Shape30: TShape;
    Shape29: TShape;
    Label39: TLabel;
    Label38: TLabel;
    Shape28: TShape;
    Shape27: TShape;
    Label36: TLabel;
    Label35: TLabel;
    Label34: TLabel;
    Label15: TLabel;
    DBText24: TDBText;
    DBText25: TDBText;
    DBText26: TDBText;
    DBText27: TDBText;
    DBText28: TDBText;
    Shape38: TShape;
    Label42: TLabel;
    DBText32: TDBText;
    tsDictados: TTabSheet;
    Panel6: TPanel;
    Shape1: TShape;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    DBText14: TDBText;
    Label8: TLabel;
    Label9: TLabel;
    DBText15: TDBText;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape39: TShape;
    Label43: TLabel;
    DBText33: TDBText;
    Panel7: TPanel;
    Panel10: TPanel;
    PCDictados: TPageControl;
    TSTiempo: TTabSheet;
    DBCTiemposDictados: TDBChart;
    HBSDictadosDictado: THorizBarSeries;                           
    HBSDictadosTranscurrido: THorizBarSeries;
    TSMovil: TTabSheet;
    DBCMovilReporteDictados: TDBChart;
    BSMovilDictados: TBarSeries;
    BSMovilEjecucion: TBarSeries;
    BSMovilTerminados: TBarSeries;
    tsEjecucion: TTabSheet;
    Panel12: TPanel;
    PCReporteAtendidos: TPageControl;
    tsTiempoAtendidos: TTabSheet;
    DBCReporteAtendidosTiempo: TDBChart;
    HBSEjecucionLlegada: THorizBarSeries;
    HBSEjecucionTranscurrido: THorizBarSeries;
    tsMovilReportesAtendidos: TTabSheet;
    DBCMovilReporteAtendidos: TDBChart;
    Panel13: TPanel;
    Shape16: TShape;
    Shape32: TShape;
    Shape26: TShape;
    Shape20: TShape;
    Label32: TLabel;
    Label31: TLabel;
    Shape19: TShape;
    Shape18: TShape;
    Shape17: TShape;
    Label29: TLabel;
    Label28: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    Label30: TLabel;
    DBText18: TDBText;
    DBText19: TDBText;
    DBText20: TDBText;
    DBText21: TDBText;
    DBText22: TDBText;
    DBText23: TDBText;
    DBText29: TDBText;
    Label37: TLabel;
    Shape33: TShape;
    Label45: TLabel;
    DBText35: TDBText;
    tsTerminado: TTabSheet;
    Panel11: TPanel;
    Panel14: TPanel;
    PCTerminados: TPageControl;
    TSTiempos: TTabSheet;
    DBCTiemposReportesTerminados: TDBChart;
    LReporteTerminados: TLabel;
    HBSTerminadosDictado: THorizBarSeries;
    HBSTerminadosLlegada: THorizBarSeries;
    HBSTerminadosAtencion: THorizBarSeries;
    TSmoviles: TTabSheet;
    DBCMovilReportesTerminados: TDBChart;
    sbODTDomiciliario: TSpeedButton;
    qDictados: TQuery;
    dsDictados: TDataSource;
    qEjecucion: TQuery;
    dsEjecucion: TDataSource;
    qTerminados: TQuery;
    dsTerminados: TDataSource;
    qMovilDictados: TQuery;
    dsMovilDictados: TDataSource;
    qMovilAtendidos: TQuery;
    dsMovilAtendidos: TDataSource;
    qMovilTerminados: TQuery;
    dsMovilTerminados: TDataSource;
    qFechaReferencia: TQuery;
    pFiltroCalendario: TPanel;
    sbDia: TSpeedButton;
    sbSemana: TSpeedButton;
    sbMes: TSpeedButton;
    sbFiltroCalendario: TSpeedButton;
    dbgRecibidos: TRxDBGrid;
    TSPendientes: TTabSheet;
    Panel15: TPanel;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Shape13: TShape;
    Shape14: TShape;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label13: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText9: TDBText;
    DBText12: TDBText;
    Shape24: TShape;
    Label23: TLabel;
    DBText13: TDBText;
    qPendientes: TQuery;
    dsPendientes: TDataSource;
    dbgPendientes: TRxDBGrid;
    dbgDictados: TRxDBGrid;
    dbgEjecucion: TRxDBGrid;
    dbgTerminados: TRxDBGrid;
    dsFechaReferencia: TDataSource;
    qFechaReferenciaFECHA: TDateTimeField;
    qRecibidosCODIGOREPORTE: TFloatField;
    qRecibidosNOMBRECIG: TStringField;
    qRecibidosNOMBRETIPODANO: TStringField;
    qRecibidosNOMBREINFORMANTE: TStringField;
    qRecibidosTIEMPODICTADO: TFloatField;
    qRecibidosTIEMPOLLEGADA: TFloatField;
    qRecibidosTIEMPOATENCION: TFloatField;
    qRecibidosCIGINFORMANTE: TFloatField;
    qRecibidosTELEFONO: TStringField;
    qRecibidosCIGDANO: TFloatField;
    qRecibidosDIRECCIONDANO: TStringField;
    qRecibidosCODIGOADMINISTRATIVO: TFloatField;
    qRecibidosCODIGOTIPOREPORTE: TStringField;
    qRecibidosCODIGOCLASEREPORTE: TStringField;
    qRecibidosCODIGOTIPODANO: TFloatField;
    qRecibidosCODIGOPRIORIDAD: TStringField;
    qRecibidosCODIGOESTADOREPORTE: TStringField;
    qRecibidosNUMEROCARTA: TStringField;
    qRecibidosCODIGOESTADOCARTA: TFloatField;
    qRecibidosREGISTROS: TFloatField;
    qRecibidosDESCRIPCION: TMemoField;
    qRecibidosOBSERVACION: TMemoField;
    qRecibidosFECHAHORA: TDateTimeField;
    qRecibidosFECHAULTIMOREGISTRO: TDateTimeField;
    qRecibidosFECHAHORADICTADO: TDateTimeField;
    qRecibidosFECHAHORALLEGADA: TDateTimeField;
    qRecibidosFECHAHORAATENCION: TDateTimeField;
    qRecibidosX: TFloatField;
    qRecibidosY: TFloatField;
    qRecibidosORIGENREPORTE: TStringField;
    qRecibidosCODIGOTIPOELEMENTO: TStringField;
    qRecibidosCODIGOELEMENTO: TStringField;
    qRecibidosCODIGOSUBESTACION: TStringField;
    qRecibidosCODIGOCIRCUITO: TStringField;
    qRecibidosCODIGOTRAFODIS: TFloatField;
    qRecibidosCODIGOAPOYO: TFloatField;
    qRecibidosCODIGOCLIENTESGD: TFloatField;
    qRecibidosCODIGOCLIENTECOM: TFloatField;
    qRecibidosREPORTEPADRE: TFloatField;
    qRecibidosCODIGOODT: TFloatField;
    qRecibidosPINTADOAPOYO: TStringField;
    qRecibidosNOMBRETIPOINFORMANTE: TStringField;
    qRecibidosNOMBREADMINISTRATIVO: TStringField;
    qRecibidosNOMBRETIPOREPORTE: TStringField;
    qRecibidosNOMBRECLASEREPORTE: TStringField;
    qRecibidosNOMBRESUBESTACION: TStringField;
    qRecibidosCODIGOCOMUNA: TFloatField;
    qRecibidosNOMBRECIRCUITO: TStringField;
    qRecibidosCOLOR: TFloatField;
    qRecibidosNOMBREESTADOREPORTE: TStringField;
    qRecibidosPRIORIDADDANO: TFloatField;
    qRecibidosCIAINFORMANTE: TFloatField;
    qRecibidosNOMBREGRUPOTRABAJO: TStringField;
    qPendientesCODIGOREPORTE: TFloatField;
    qPendientesNOMBRECIG: TStringField;
    qPendientesNOMBRETIPODANO: TStringField;
    qPendientesNOMBREINFORMANTE: TStringField;
    qPendientesTIEMPODICTADO: TFloatField;
    qPendientesTIEMPOLLEGADA: TFloatField;
    qPendientesTIEMPOATENCION: TFloatField;
    qPendientesCIGINFORMANTE: TFloatField;
    qPendientesTELEFONO: TStringField;
    qPendientesCIGDANO: TFloatField;
    qPendientesDIRECCIONDANO: TStringField;
    qPendientesCODIGOADMINISTRATIVO: TFloatField;
    qPendientesCODIGOTIPOREPORTE: TStringField;
    qPendientesCODIGOCLASEREPORTE: TStringField;
    qPendientesCODIGOTIPODANO: TFloatField;
    qPendientesCODIGOPRIORIDAD: TStringField;
    qPendientesCODIGOESTADOREPORTE: TStringField;
    qPendientesNUMEROCARTA: TStringField;
    qPendientesCODIGOESTADOCARTA: TFloatField;
    qPendientesREGISTROS: TFloatField;
    qPendientesDESCRIPCION: TMemoField;
    qPendientesOBSERVACION: TMemoField;
    qPendientesFECHAHORA: TDateTimeField;
    qPendientesFECHAULTIMOREGISTRO: TDateTimeField;
    qPendientesFECHAHORADICTADO: TDateTimeField;
    qPendientesFECHAHORALLEGADA: TDateTimeField;
    qPendientesFECHAHORAATENCION: TDateTimeField;
    qPendientesX: TFloatField;
    qPendientesY: TFloatField;
    qPendientesORIGENREPORTE: TStringField;
    qPendientesCODIGOTIPOELEMENTO: TStringField;
    qPendientesCODIGOELEMENTO: TStringField;
    qPendientesCODIGOSUBESTACION: TStringField;
    qPendientesCODIGOCIRCUITO: TStringField;
    qPendientesCODIGOTRAFODIS: TFloatField;
    qPendientesCODIGOAPOYO: TFloatField;
    qPendientesCODIGOCLIENTESGD: TFloatField;
    qPendientesCODIGOCLIENTECOM: TFloatField;
    qPendientesREPORTEPADRE: TFloatField;
    qPendientesCODIGOODT: TFloatField;
    qPendientesPINTADOAPOYO: TStringField;
    qPendientesNOMBRETIPOINFORMANTE: TStringField;
    qPendientesNOMBREADMINISTRATIVO: TStringField;
    qPendientesNOMBRETIPOREPORTE: TStringField;
    qPendientesNOMBRECLASEREPORTE: TStringField;
    qPendientesNOMBRESUBESTACION: TStringField;
    qPendientesCODIGOCOMUNA: TFloatField;
    qPendientesNOMBRECIRCUITO: TStringField;
    qPendientesCOLOR: TFloatField;
    qPendientesNOMBREESTADOREPORTE: TStringField;
    qPendientesPRIORIDADDANO: TFloatField;
    qPendientesCIAINFORMANTE: TFloatField;
    qPendientesNOMBREGRUPOTRABAJO: TStringField;
    qDictadosCODIGOREPORTE: TFloatField;
    qDictadosNOMBRECIG: TStringField;
    qDictadosNOMBRETIPODANO: TStringField;
    qDictadosNOMBREINFORMANTE: TStringField;
    qDictadosTIEMPODICTADO: TFloatField;
    qDictadosTIEMPOLLEGADA: TFloatField;
    qDictadosTIEMPOATENCION: TFloatField;
    qDictadosCIGINFORMANTE: TFloatField;
    qDictadosTELEFONO: TStringField;
    qDictadosCIGDANO: TFloatField;
    qDictadosDIRECCIONDANO: TStringField;
    qDictadosCODIGOADMINISTRATIVO: TFloatField;
    qDictadosCODIGOTIPOREPORTE: TStringField;
    qDictadosCODIGOCLASEREPORTE: TStringField;
    qDictadosCODIGOTIPODANO: TFloatField;
    qDictadosCODIGOPRIORIDAD: TStringField;
    qDictadosCODIGOESTADOREPORTE: TStringField;
    qDictadosNUMEROCARTA: TStringField;
    qDictadosCODIGOESTADOCARTA: TFloatField;
    qDictadosREGISTROS: TFloatField;
    qDictadosDESCRIPCION: TMemoField;
    qDictadosOBSERVACION: TMemoField;
    qDictadosFECHAHORA: TDateTimeField;
    qDictadosFECHAULTIMOREGISTRO: TDateTimeField;
    qDictadosFECHAHORADICTADO: TDateTimeField;
    qDictadosFECHAHORALLEGADA: TDateTimeField;
    qDictadosFECHAHORAATENCION: TDateTimeField;
    qDictadosX: TFloatField;
    qDictadosY: TFloatField;
    qDictadosORIGENREPORTE: TStringField;
    qDictadosCODIGOTIPOELEMENTO: TStringField;
    qDictadosCODIGOELEMENTO: TStringField;
    qDictadosCODIGOSUBESTACION: TStringField;
    qDictadosCODIGOCIRCUITO: TStringField;
    qDictadosCODIGOTRAFODIS: TFloatField;
    qDictadosCODIGOAPOYO: TFloatField;
    qDictadosCODIGOCLIENTESGD: TFloatField;
    qDictadosCODIGOCLIENTECOM: TFloatField;
    qDictadosREPORTEPADRE: TFloatField;
    qDictadosCODIGOODT: TFloatField;
    qDictadosPINTADOAPOYO: TStringField;
    qDictadosNOMBRETIPOINFORMANTE: TStringField;
    qDictadosNOMBREADMINISTRATIVO: TStringField;
    qDictadosNOMBRETIPOREPORTE: TStringField;
    qDictadosNOMBRECLASEREPORTE: TStringField;
    qDictadosNOMBRESUBESTACION: TStringField;
    qDictadosCODIGOCOMUNA: TFloatField;
    qDictadosNOMBRECIRCUITO: TStringField;
    qDictadosCOLOR: TFloatField;
    qDictadosNOMBREESTADOREPORTE: TStringField;
    qDictadosPRIORIDADDANO: TFloatField;
    qDictadosCIAINFORMANTE: TFloatField;
    qDictadosNOMBREGRUPOTRABAJO: TStringField;
    qEjecucionCODIGOREPORTE: TFloatField;
    qEjecucionNOMBRECIG: TStringField;
    qEjecucionNOMBRETIPODANO: TStringField;
    qEjecucionNOMBREINFORMANTE: TStringField;
    qEjecucionTIEMPODICTADO: TFloatField;
    qEjecucionTIEMPOLLEGADA: TFloatField;
    qEjecucionTIEMPOATENCION: TFloatField;
    qEjecucionCIGINFORMANTE: TFloatField;
    qEjecucionTELEFONO: TStringField;
    qEjecucionCIGDANO: TFloatField;
    qEjecucionDIRECCIONDANO: TStringField;
    qEjecucionCODIGOADMINISTRATIVO: TFloatField;
    qEjecucionCODIGOTIPOREPORTE: TStringField;
    qEjecucionCODIGOCLASEREPORTE: TStringField;
    qEjecucionCODIGOTIPODANO: TFloatField;
    qEjecucionCODIGOPRIORIDAD: TStringField;
    qEjecucionCODIGOESTADOREPORTE: TStringField;
    qEjecucionNUMEROCARTA: TStringField;
    qEjecucionCODIGOESTADOCARTA: TFloatField;
    qEjecucionREGISTROS: TFloatField;
    qEjecucionDESCRIPCION: TMemoField;
    qEjecucionOBSERVACION: TMemoField;
    qEjecucionFECHAHORA: TDateTimeField;
    qEjecucionFECHAULTIMOREGISTRO: TDateTimeField;
    qEjecucionFECHAHORADICTADO: TDateTimeField;
    qEjecucionFECHAHORALLEGADA: TDateTimeField;
    qEjecucionFECHAHORAATENCION: TDateTimeField;
    qEjecucionX: TFloatField;
    qEjecucionY: TFloatField;
    qEjecucionORIGENREPORTE: TStringField;
    qEjecucionCODIGOTIPOELEMENTO: TStringField;
    qEjecucionCODIGOELEMENTO: TStringField;
    qEjecucionCODIGOSUBESTACION: TStringField;
    qEjecucionCODIGOCIRCUITO: TStringField;
    qEjecucionCODIGOTRAFODIS: TFloatField;
    qEjecucionCODIGOAPOYO: TFloatField;
    qEjecucionCODIGOCLIENTESGD: TFloatField;
    qEjecucionCODIGOCLIENTECOM: TFloatField;
    qEjecucionREPORTEPADRE: TFloatField;
    qEjecucionCODIGOODT: TFloatField;
    qEjecucionPINTADOAPOYO: TStringField;
    qEjecucionNOMBRETIPOINFORMANTE: TStringField;
    qEjecucionNOMBREADMINISTRATIVO: TStringField;
    qEjecucionNOMBRETIPOREPORTE: TStringField;
    qEjecucionNOMBRECLASEREPORTE: TStringField;
    qEjecucionNOMBRESUBESTACION: TStringField;
    qEjecucionCODIGOCOMUNA: TFloatField;
    qEjecucionNOMBRECIRCUITO: TStringField;
    qEjecucionCOLOR: TFloatField;
    qEjecucionNOMBREESTADOREPORTE: TStringField;
    qEjecucionPRIORIDADDANO: TFloatField;
    qEjecucionCIAINFORMANTE: TFloatField;
    qEjecucionNOMBREGRUPOTRABAJO: TStringField;
    qTerminadosCODIGOREPORTE: TFloatField;
    qTerminadosNOMBRECIG: TStringField;
    qTerminadosNOMBRETIPODANO: TStringField;
    qTerminadosNOMBREINFORMANTE: TStringField;
    qTerminadosTIEMPODICTADO: TFloatField;
    qTerminadosTIEMPOLLEGADA: TFloatField;
    qTerminadosTIEMPOATENCION: TFloatField;
    qTerminadosCIGINFORMANTE: TFloatField;
    qTerminadosTELEFONO: TStringField;
    qTerminadosCIGDANO: TFloatField;
    qTerminadosDIRECCIONDANO: TStringField;
    qTerminadosCODIGOADMINISTRATIVO: TFloatField;
    qTerminadosCODIGOTIPOREPORTE: TStringField;
    qTerminadosCODIGOCLASEREPORTE: TStringField;
    qTerminadosCODIGOTIPODANO: TFloatField;
    qTerminadosCODIGOPRIORIDAD: TStringField;
    qTerminadosCODIGOESTADOREPORTE: TStringField;
    qTerminadosNUMEROCARTA: TStringField;
    qTerminadosCODIGOESTADOCARTA: TFloatField;
    qTerminadosREGISTROS: TFloatField;
    qTerminadosDESCRIPCION: TMemoField;
    qTerminadosOBSERVACION: TMemoField;
    qTerminadosFECHAHORA: TDateTimeField;
    qTerminadosFECHAULTIMOREGISTRO: TDateTimeField;
    qTerminadosFECHAHORADICTADO: TDateTimeField;
    qTerminadosFECHAHORALLEGADA: TDateTimeField;
    qTerminadosFECHAHORAATENCION: TDateTimeField;
    qTerminadosX: TFloatField;
    qTerminadosY: TFloatField;
    qTerminadosORIGENREPORTE: TStringField;
    qTerminadosCODIGOTIPOELEMENTO: TStringField;
    qTerminadosCODIGOELEMENTO: TStringField;
    qTerminadosCODIGOSUBESTACION: TStringField;
    qTerminadosCODIGOCIRCUITO: TStringField;
    qTerminadosCODIGOTRAFODIS: TFloatField;
    qTerminadosCODIGOAPOYO: TFloatField;
    qTerminadosCODIGOCLIENTESGD: TFloatField;
    qTerminadosCODIGOCLIENTECOM: TFloatField;
    qTerminadosREPORTEPADRE: TFloatField;
    qTerminadosCODIGOODT: TFloatField;
    qTerminadosPINTADOAPOYO: TStringField;
    qTerminadosNOMBRETIPOINFORMANTE: TStringField;
    qTerminadosNOMBREADMINISTRATIVO: TStringField;
    qTerminadosNOMBRETIPOREPORTE: TStringField;
    qTerminadosNOMBRECLASEREPORTE: TStringField;
    qTerminadosNOMBRESUBESTACION: TStringField;
    qTerminadosCODIGOCOMUNA: TFloatField;
    qTerminadosNOMBRECIRCUITO: TStringField;
    qTerminadosCOLOR: TFloatField;
    qTerminadosNOMBREESTADOREPORTE: TStringField;
    qTerminadosPRIORIDADDANO: TFloatField;
    qTerminadosCIAINFORMANTE: TFloatField;
    qTerminadosNOMBREGRUPOTRABAJO: TStringField;
    qMovilAtendidosCODIGOADMINISTRATIVO: TFloatField;
    qMovilAtendidosCODIGOGRUPOTRABAJO: TFloatField;
    qMovilAtendidosTIEMPOLLEGADA: TFloatField;
    qMovilTerminadosCODIGOADMINISTRATIVO: TFloatField;
    qMovilTerminadosCODIGOGRUPOTRABAJO: TFloatField;
    qMovilTerminadosTIEMPOATENCION: TFloatField;
    qMovilDictadosCODIGOADMINISTRATIVO: TFloatField;
    qMovilDictadosCODIGOGRUPOTRABAJO: TFloatField;
    qMovilDictadosTIEMPODICTADO: TFloatField;
    qMovilDictadosNOMBREGRUPOTRABAJO: TStringField;
    qMovilAtendidosNOMBREGRUPOTRABAJO: TStringField;
    qMovilTerminadosNOMBREGRUPOTRABAJO: TStringField;
    HBSEjecucionDictado: THorizBarSeries;
    qRecibidosTiempoTranscurrido: TTimeField;
    qPendientesTiempoTranscurrido: TTimeField;
    qDictadosTiempoTranscurrido: TTimeField;
    qEjecucionTiempoTranscurrido: TTimeField;
    qTerminadosTiempoTranscurrido: TTimeField;
    qTipoReporteRecibidos: TQuery;
    pcClasificacionReportes: TPageControl;
    tsTipoReporte: TTabSheet;
    tsTipocliente: TTabSheet;
    pcTipoDanoRecibidos: TPageControl;
    tsTiempoRecibidos: TTabSheet;
    tsPrioridadRecibidos: TTabSheet;
    di: TDBChart;
    HBSRecibidos: THorizBarSeries;
    DBCRecibidosClasificacion: TDBChart;
    BarSeries1: TPieSeries;
    qTipoClienteRecibidos: TQuery;
    DBCRecibidos: TDBChart;
    Series1: TBarSeries;
    qRecibidosPRIORIDADESTIMADA: TFloatField;
    DBChart2: TDBChart;
    PieSeries1: TPieSeries;
    qRecibidosCOLORCELDA: TFloatField;
    qPendientesCOLORCELDA: TFloatField;
    qPendientesPRIORIDADESTIMADA: TFloatField;
    qDictadosCOLORCELDA: TFloatField;
    qDictadosPRIORIDADESTIMADA: TFloatField;
    qEjecucionCOLORCELDA: TFloatField;
    qEjecucionPRIORIDADESTIMADA: TFloatField;
    qTerminadosCOLORCELDA: TFloatField;
    qTerminadosPRIORIDADESTIMADA: TFloatField;
    Shape37: TShape;
    Label24: TLabel;
    DBText31: TDBText;
    Shape40: TShape;
    Label25: TLabel;
    DBText36: TDBText;
    Shape41: TShape;
    Label33: TLabel;
    DBText37: TDBText;
    qRecibidosTiempoTranscurridoCadena: TStringField;
    qPendientesTiempoTranscurridoCadena: TStringField;
    qDictadosTiempoTranscurridoCadena: TStringField;
    qEjecucionTiempoTranscurridoCadena: TStringField;
    qTerminadosTiempoTranscurridoCadena: TStringField;
    qMovilDictadosTiempoCadena: TStringField;
    qMovilAtendidosTiempoCadena: TStringField;
    qMovilTerminadosTiempoCadena: TStringField;
    Shape42: TShape;
    Shape43: TShape;
    Label40: TLabel;
    DBText38: TDBText;
    Panel8: TPanel;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Label10: TLabel;
    Label11: TLabel;
    Shape15: TShape;
    Shape34: TShape;
    Shape35: TShape;
    Label12: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label22: TLabel;
    Label41: TLabel;
    DBText8: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText16: TDBText;
    DBText17: TDBText;
    DBText30: TDBText;
    DBText34: TDBText;
    Label44: TLabel;
    Shape36: TShape;
    Label46: TLabel;
    DBText39: TDBText;
    Shape44: TShape;
    Shape45: TShape;
    Label47: TLabel;
    DBText40: TDBText;
    qTipoDanoPendientes: TQuery;
    qTipoReportePendientes: TQuery;
    qTipoClientePendientes: TQuery;
    Panel16: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBChart3: TDBChart;
    PieSeries2: TPieSeries;
    TabSheet2: TTabSheet;
    DBChart4: TDBChart;
    PieSeries3: TPieSeries;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    DBChart1: TDBChart;
    HBSPendientes: THorizBarSeries;
    TabSheet4: TTabSheet;
    DBChart5: TDBChart;
    BarSeries2: TBarSeries;
    procedure SBFiltroCartografiaClick(Sender: TObject);
    procedure SBSeleccionarMovilClick(Sender: TObject);
    procedure SBCartografiaClick(Sender: TObject);
    procedure SBActualizaTiemposClick(Sender: TObject);
    procedure SBBitacoraMovilClick(Sender: TObject);
    procedure SBImprimirClick(Sender: TObject);
    procedure qRecibidosCalcFields(DataSet: TDataSet);
    procedure qDictadosCalcFields(DataSet: TDataSet);
    procedure ActualizaListaReportes;
    procedure Ordenar(sCriterio: String);
    procedure DBGTerminadosDblClick(Sender: TObject);
    procedure DBGRecibidosDblClick(Sender: TObject);
    procedure PCLibroChange(Sender: TObject);
    procedure DBGDictadosDblClick(Sender: TObject);
    procedure dbgEjecucionDblClick(Sender: TObject);
    procedure AdicionarReportes;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PCReporteAtendidosChange(Sender: TObject);
    procedure PCTerminadosChange(Sender: TObject);
    procedure PCDictadosChange(Sender: TObject);
    procedure sbAutomaticoClick(Sender: TObject);
    procedure CrearGrupos(ListaTemp:TStringList);
    procedure sbFiltroCalendarioClick(Sender: TObject);
    procedure DBGRecibidosMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgRecibidosTitleClick(Column: TColumn);
    procedure dbgPendientesTitleClick(Column: TColumn);
    procedure DBGDictadosTitleClick(Column: TColumn);
    procedure dbgEjecucionTitleClick(Column: TColumn);
    procedure dbgTerminadosTitleClick(Column: TColumn);
    procedure sbDiaClick(Sender: TObject);
    procedure sbSemanaClick(Sender: TObject);
    procedure sbMesClick(Sender: TObject);
    procedure BitBtnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgPendientesDblClick(Sender: TObject);
    procedure qFechaReferenciaAfterOpen(DataSet: TDataSet);
    procedure dbgRecibidosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgPendientesGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgDictadosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgEjecucionGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgTerminadosGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure qMovilDictadosCalcFields(DataSet: TDataSet);
    procedure qMovilAtendidosCalcFields(DataSet: TDataSet);
    procedure qMovilTerminadosCalcFields(DataSet: TDataSet);
  private
    TeclaShift:Boolean;
    ListaOrden:TStringList;
    CodReporte:String;
    procedure LimpiarFiltro(Query:TQuery);
    procedure LimpiarFiltroMovil(Query:TQuery);    
    procedure Filtrar;
    procedure FiltroReporteEstado(Query,QMovil:TQuery);
  public
    Bitacora,Cuadrilla : String;
    Lista,ListaFrom:tstringlist;
  end;

var
  FListaReporteEstado: TFListaReporteEstado;
  Segundos,Minutos,Horas,TiempoFinal : Real;
  sCriterio: string;
  Cadena,Cadena1 : String;
  Tiempo,Tiempo1 : TDateTime;
  sCodReporte : Integer;

implementation

uses
   uReporte, uFormaHora, uFormaFecha, uFuncionSGD;

{$R *.DFM}

procedure TFListaReporteEstado.SBFiltroCartografiaClick(Sender: TObject);
begin
{
  FReporteMovil.WindowState := wsMinimized;
  If PCLibro.ActivePage = tsRecibidos
   then
    begin
    fPlancha.ListaRotulos.Clear;
    fPlancha.ListaDatos.Clear;
    fPlancha.ListaRotulos.add('Estado del Reporte');
    fPlancha.ListaDatos.add('Recibido');
    try _MapLayer(fPlancha.Map1.Layers.Item(fPlancha.LayerOnRelate)).RemoveRelates; except end;
    fPlancha.LayerOnRelate := 'reporte';
    try
    fPlancha.RelateRecs := fPlancha.Map1.SelectFromQuery('reporte', 'REPORTE', qRecibidos, 'CODIGOREPORTE');
    if (fPlancha.RelateRecs.eof)
       then Showmessage('No Encontrado');
    fPlancha.EncajarPanelFiltro;
    fPlancha.pTipoFiltro.Caption := 'Filtro de Reporte de Daños';
    fPlancha.Map1.Refresh;
    except
    ShowMessage('Error');
    end;
    end
  else  If PCLibro.ActivePage = tsDictados
   then
    begin
    try _MapLayer(fPlancha.Map1.Layers.Item(fPlancha.LayerOnRelate)).RemoveRelates; except end;
    fPlancha.LayerOnRelate := 'reporte';
    try
    fPlancha.ListaRotulos.Clear;
    fPlancha.ListaDatos.Clear;
    fPlancha.ListaRotulos.add('Estado del Reporte');
    fPlancha.ListaDatos.add('Dictados');
    fPlancha.RelateRecs := fPlancha.Map1.SelectFromQuery('reporte', 'REPORTE', qDictados, 'CODIGOREPORTE');
    if (fPlancha.RelateRecs.eof)
       then Showmessage('No Encontrado');
    fPlancha.EncajarPanelFiltro;
    fPlancha.pTipoFiltro.Caption := 'Filtro de Reporte de Daños';
    fPlancha.Map1.Refresh;
    except
    ShowMessage('Error');
    end;
    end
  else  If PCLibro.ActivePage = tsAtendidos
   then
    begin
    fPlancha.ListaRotulos.Clear;
    fPlancha.ListaDatos.Clear;
    fPlancha.ListaRotulos.add('Estado del Reporte');
    fPlancha.ListaDatos.add('Atendidos');
    try _MapLayer(fPlancha.Map1.Layers.Item(fPlancha.LayerOnRelate)).RemoveRelates; except end;
    fPlancha.LayerOnRelate := 'reporte';
    try
    fPlancha.RelateRecs := fPlancha.Map1.SelectFromQuery('reporte', 'REPORTE', qAtendido, 'CODIGOREPORTE');
    if (fPlancha.RelateRecs.eof)
       then Showmessage('No Encontrado');
    fPlancha.EncajarPanelFiltro;
    fPlancha.pTipoFiltro.Caption := 'Filtro de Reporte de Daños';
    fPlancha.Map1.Refresh;
    except
    ShowMessage('Error');
    end;
    end;
    }
end;

procedure TFListaReporteEstado.SBSeleccionarMovilClick(Sender: TObject);
begin
  Bitacora := '';
  Cuadrilla := '';
{  FSeleccionaMovil := TFSeleccionaMovil.Create(Application);
  FSeleccionaMovil.qMoviles.Close;
  FSeleccionaMovil.qMoviles.ParamByName('Fecha').AsDateTime:= Now;
  FSeleccionaMovil.qMoviles.Open;
  if FSeleccionaMovil.qMoviles.RecordCount > 0
  then if FSeleccionaMovil.ShowModal = mrOk
    then
     begin
       Bitacora := FSeleccionaMovil.qMovilesCODIGOBITACORAMOVIL.AsString;
       Cuadrilla := FSeleccionaMovil.qMovilesCODIGOCUADRILLA.AsString;
       If (Bitacora<>'') and (Cuadrilla<>'')
       then AdicionarReportes;
     end;
  FSeleccionaMovil.Free;
  ActualizaReportes;
}
end;

procedure TFListaReporteEstado.SBCartografiaClick(Sender: TObject);
var CodigoReporte : Integer;
begin
{  FInformacionReporteMovil := TFInformacionReporteMovil.Create(Application);
  FInformacionReporteMovil.Top := screen.Height - FInformacionReporteMovil.height;
  If PCLibro.ActivePage = tsRecibidos
   then
    begin
     FInformacionReporteMovil.dsReporteMovil.DataSet := qRecibidos;
     FInformacionReporteMovil.Caption := 'Reporte Número '+qRecibidosCODIGOREPORTE.AsString;
     CodigoReporte := qRecibidosCODIGOREPORTE.AsInteger;
    end
  else  If PCLibro.ActivePage = tsDictados
   then
    begin
      FInformacionReporteMovil.dsReporteMovil.DataSet := qDictados;
      FInformacionReporteMovil.Caption := 'Reporte Número '+qDictadosCODIGOREPORTE.AsString;
      CodigoReporte := qDictadosCODIGOREPORTE.AsInteger;
    end
  else  If PCLibro.ActivePage = tsAtendidos
   then
    begin
      FInformacionReporteMovil.dsReporteMovil.DataSet := qAtendido;
      FInformacionReporteMovil.Caption := 'Reporte Número '+qAtendidoCODIGOREPORTE.AsString;
      CodigoReporte := qAtendidoCODIGOREPORTE.AsInteger;
    end
  else  If PCLibro.ActivePage = tsTerminado
   then
    begin
     FInformacionReporteMovil.dsReporteMovil.DataSet := qTerminados;
     FInformacionReporteMovil.Caption := 'Reporte Número '+qTerminadosCODIGOREPORTE.AsString;
     CodigoReporte := qTerminadosCODIGOREPORTE.AsInteger;
    end;
  FInformacionReporteMovil.Show;
  BuscarReporte(CodigoReporte, True);
}
  If PCLibro.ActivePage = TSPendientes
   then
    begin
      if not (qPendientesX.IsNull or qPendientesY.IsNull) then
      begin
        BuscarCoordenada(qPendientesX.AsFloat, qPendientesY.AsFloat);
      end;
    end
  else  If PCLibro.ActivePage = tsDictados
   then
    begin
      if not (qDictadosX.IsNull or qDictadosY.IsNull) then
      begin
        BuscarCoordenada(qDictadosX.AsFloat, qDictadosY.AsFloat);
      end;
    end
  else  If PCLibro.ActivePage = tsEjecucion
   then
    begin
      if not (qEjecucionX.IsNull or qEjecucionY.IsNull) then
      begin
        BuscarCoordenada(qEjecucionX.AsFloat, qEjecucionY.AsFloat);
      end;
    end
  else  If PCLibro.ActivePage = tsTerminado
   then
      if not (qTerminadosX.IsNull or qTerminadosY.IsNull) then
      begin
        BuscarCoordenada(qTerminadosX.AsFloat, qTerminadosY.AsFloat);
      end;
end;

procedure TFListaReporteEstado.SBActualizaTiemposClick(Sender: TObject);
begin
  ActualizaListaReportes;
  lFecha.Caption:=FormatDateTime('mmmm dd "de" yyyy ',Date);
  lfecha.Refresh;
  try
    ActualizarReportes;
  except
  end;  
end;

procedure TFListaReporteEstado.SBBitacoraMovilClick(Sender: TObject);
begin
{  FBListadoBitacoraMovil := TFBListadoBitacoraMovil.Create(Application);
  FBListadoBitacoraMovil.ShowModal;
  FBListadoBitacoraMovil.Free;}
end;

procedure TFListaReporteEstado.SBImprimirClick(Sender: TObject);
begin
  self.WindowState := wsMinimized;
  If PCLibro.ActivePage = tsRecibidos
   then
    begin
{
     fQRReporteDiarioRecibidos := TfQRReporteDiarioRecibidos.Create(Application);
     fQRReporteDiarioRecibidos.QuickReport.ReportTitle := 'Informe de los reportes recibidos del '+Cadena1;
     fQRReporteDiarioRecibidos.QuickReport.Preview;
     fQRReporteDiarioRecibidos.Free;
}
    end
  else  If PCLibro.ActivePage = tsDictados
   then
    begin
{
     fQRReporteDiarioDictados := TfQRReporteDiarioDictados.Create(Application);
     fQRReporteDiarioDictados.QuickReport.ReportTitle := 'Informe de los reportes dictados del '+Cadena1;
     fQRReporteDiarioDictados.QuickReport.Preview;
     fQRReporteDiarioDictados.Free;
}
    end
  else  If PCLibro.ActivePage = tsEjecucion
   then
    begin
{     fQRReporteDiarioAtendidos := TfQRReporteDiarioAtendidos.Create(Application);
     fQRReporteDiarioAtendidos.QuickReport.ReportTitle := 'Informe de los reportes Atendidos del '+Cadena1;
     fQRReporteDiarioAtendidos.QuickReport.Preview;
     fQRReporteDiarioAtendidos.Free;}
    end
  else  If PCLibro.ActivePage = tsTerminado
   then
    begin
{
     fQRReporteDiarioTerminados := TfQRReporteDiarioTerminados.Create(Application);
     fQRReporteDiarioTerminados.QuickReport.ReportTitle := 'Informe de los reportes terminados del '+Cadena1;
     fQRReporteDiarioTerminados.QuickReport.Preview;
     fQRReporteDiarioTerminados.Free;
     }
    end;
  self.WindowState := wsNormal;

end;

procedure TFListaReporteEstado.qRecibidosCalcFields(DataSet: TDataSet);
var t:double;
 dias:integer;
 cadena:string;
begin
  if (DataSet.FieldByName('FECHAHORAATENCION').AsString<>'') then
    t :=DataSet.FieldByName('FECHAHORAATENCION').asdatetime-DataSet.FieldByName('FECHAHORA').asdatetime
  else
    t:=ObtenerFechaservidor-DataSet.FieldByName('FECHAHORA').asdatetime;
  dias:=trunc(t);
  t:=t-dias;
  Horas := Int(t*24);
  Minutos := InT((t*24-Horas)*60);
  Segundos := Int( (((t*24-Horas)*60)-Minutos)*60);
  Dataset.FieldByName('TiempoTranscurrido').AsFloat :=t;
  cadena:='';
  if dias>0 then cadena:=  intToStr(dias)+' Dias ';
  Dataset.FieldByName('TiempoTranscurridoCadena').AsString :=cadena+FloatToStr(Horas)+' horas  '+FloatToStr(Minutos)+' min  '+FloatToStr(Segundos)+' Seg';
end;

procedure TFListaReporteEstado.qDictadosCalcFields(DataSet: TDataSet);
begin
{ if Now > qDictados.FieldByName('FechaHora').AsDateTime
 then
  begin
    TiempoFinal := Now - qDictados.FieldByName('FECHAHORA').AsDateTime;
    Horas := Int(TiempoFinal*24);
    Minutos := InT((TiempoFinal*24-Horas)*60);
    Segundos := Int( (((TiempoFinal*24-Horas)*60)-Minutos)*60);
    qDictados.FieldByName('TiempoTranscurrido').AsString := (FloatToStr(Horas)+':'+FloatToStr(Minutos)+':'+FloatToStr(Segundos));
    qDictados.FieldByName('TiempoEnEspera').AsDateTime := Now-qDictados.FieldByName('FechaHoraDictado').AsDateTime;
    qDictados.FieldByName('TiempoDictadoReporte').AsString := FormatDateTime('hh:mm:ss',qDictados.FieldByName('FechaHoraDictado').AsDateTime - qDictados.FieldByName('FECHAHORA').AsDateTime);
    qDictados.FieldByName('TiempoEnLlegar').AsString := FormatDateTime('hh:mm:ss',Now - qDictados.FieldByName('FechaHoraDictado').AsDateTime);
    TiempoFinal := qDictados.FieldByName('DESCPROMEDIO').AsFloat;
    Horas := Int(TiempoFinal*24);
    Minutos := InT((TiempoFinal*24-Horas)*60);
    Segundos := Int( (((TiempoFinal*24-Horas)*60)-Minutos)*60);
    qDictadosValorDesc.AsString := (FloatToStr(Horas)+':'+FloatToStr(Minutos)+':'+FloatToStr(Segundos));

    TiempoFinal := qDictados.FieldByName('PROMEDIOTIEMPODANO').AsFloat;
    Horas := Int(TiempoFinal*24);
    Minutos := InT((TiempoFinal*24-Horas)*60);
    Segundos := Int( (((TiempoFinal*24-Horas)*60)-Minutos)*60);
    qDictados.FieldByName('TiempoDano').AsString := (FloatToStr(Horas)+':'+FloatToStr(Minutos)+':'+FloatToStr(Segundos));
  end;
         }
end;

procedure TFListaReporteEstado.ActualizaListaReportes;
begin
  HBSPendientes.DataSource:=nil;
  HBSRecibidos.DataSource:=nil;
  HBSDictadosDictado.DataSource:=nil;
  HBSDictadosTranscurrido.DataSource:=nil;
  HBSEjecucionDictado.DataSource:=nil;
  HBSEjecucionLlegada.DataSource:=nil;
  HBSEjecucionTranscurrido.DataSource:=nil;
  HBSTerminadosDictado.DataSource:=nil;
  HBSTerminadosLlegada.DataSource:=nil;
  HBSTerminadosAtencion.DataSource:=nil;
  BSMovilDictados.DataSource:=nil;
  BSMovilEjecucion.DataSource:=nil;
  BSMovilTerminados.DataSource:=nil;

  HBSPendientes.clear;
  HBSRecibidos.clear;
  HBSDictadosDictado.clear;
  HBSDictadosTranscurrido.clear;
  HBSEjecucionDictado.clear;
  HBSEjecucionLlegada.clear;
  HBSEjecucionTranscurrido.clear;
  HBSTerminadosDictado.clear;
  HBSTerminadosLlegada.clear;
  HBSTerminadosAtencion.clear;
  BSMovilDictados.clear;
  BSMovilEjecucion.clear;
  BSMovilTerminados.clear;

  qRecibidos.close;
  qRecibidos.open;
  qPendientes.close;
  qPendientes.open;
  qDictados.close;
  qDictados.open;
  qEjecucion.close;
  qEjecucion.open;
  qTerminados.close;
  qTerminados.open;
  
  qMovilDictados.Close;
  qMovilDictados.Open;
  qMovilAtendidos.close;
  qMovilAtendidos.open;
  qMovilTerminados.close;
  qMovilTerminados.open;

  qTotales.Close;
  qTotales.Open;
  qTipoReporteRecibidos.Close;
  qTipoReporteRecibidos.Open;
  qTipoClienteRecibidos.Close;
  qTipoClienteRecibidos.Open;

  qTipoDanoPendientes.Close;
  qTipoDanoPendientes.Open;
  qTipoReportePendientes.Close;
  qTipoReportePendientes.Open;
  qTipoClientePendientes.Close;
  qTipoClientePendientes.Open;


  HBSPendientes.DataSource:=qPendientes;
  HBSRecibidos.DataSource:=qRecibidos;
  HBSDictadosDictado.DataSource:=qDictados;
  HBSDictadosTranscurrido.DataSource:=qDictados;
  HBSEjecucionDictado.DataSource:=qEjecucion;
  HBSEjecucionLlegada.DataSource:=qEjecucion;
  HBSEjecucionTranscurrido.DataSource:=qEjecucion;
  HBSTerminadosDictado.DataSource:=qTerminados;
  HBSTerminadosLlegada.DataSource:=qTerminados;
  HBSTerminadosAtencion.DataSource:=qTerminados;
  BSMovilDictados.DataSource:=qMovilDictados;
  BSMovilEjecucion.DataSource:=qMovilAtendidos;
  BSMovilTerminados.DataSource:=qMovilTerminados;

  HBSPendientes.Repaint;
  HBSRecibidos.Repaint;
  HBSDictadosDictado.Repaint;
  HBSDictadosTranscurrido.Repaint;
  HBSEjecucionDictado.Repaint;
  HBSEjecucionLlegada.Repaint;
  HBSEjecucionTranscurrido.Repaint;
  HBSTerminadosDictado.Repaint;
  HBSTerminadosLlegada.Repaint;
  HBSTerminadosAtencion.Repaint;
  BSMovilDictados.Repaint;
  BSMovilEjecucion.Repaint;
  BSMovilTerminados.Repaint;
end;

procedure TFListaReporteEstado.Ordenar(sCriterio: String);
begin
  If PCLibro.ActivePage = tsRecibidos
   then
    begin
      qRecibidos.Active := False;
      qRecibidos.SQL.Delete(qRecibidos.SQL.Count - 1);
      qRecibidos.SQL.Add(sCriterio);
      qRecibidos.Active := True;
    end
  else  If PCLibro.ActivePage = tsDictados
   then
    begin
      qDictados.Active := False;
      qDictados.SQL.Delete(qDictados.SQL.Count - 1);
      qDictados.SQL.Add(sCriterio);
      qDictados.Active := True;
    end
  else  If PCLibro.ActivePage = tsEjecucion
   then
    begin
      qEjecucion.Active := False;
      qEjecucion.SQL.Delete(qEjecucion.SQL.Count - 1);
      qEjecucion.SQL.Add(sCriterio);
      qEjecucion.Active := True;
    end
  else  If PCLibro.ActivePage = tsTerminado
   then
    begin
      qTerminados.Active := False;
      qTerminados.SQL.Delete(qTerminados.SQL.Count - 1);
      qTerminados.SQL.Add(sCriterio);
      qTerminados.Active := True;
    end;
end;

procedure TFListaReporteEstado.DBGTerminadosDblClick(Sender: TObject);
begin
  if qTerminadosCODIGOREPORTE.AsString <> '' then
  begin
    sCodReporte := qTerminados.FieldByName('CODIGOREPORTE').AsInteger;
    if not (Assigned(Application.FindComponent('fReporte') as TForm)) then
      fReporte:=TfReporte.Create(Application);
    fReporte.qReporte.Active:=False;
    fReporte.qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE='+
                                qTerminadosCODIGOREPORTE.AsString;
    fReporte.qReporte.Active:=True;
    fReporte.qReporte.Edit;
    fReporte.Show;
  end;
end;

procedure TFListaReporteEstado.DBGRecibidosDblClick(Sender: TObject);
begin
  if qRecibidosCODIGOREPORTE.AsString <> '' then
  begin
    sCodReporte := qRecibidos.FieldByName('CODIGOREPORTE').AsInteger;  
    if not (Assigned(Application.FindComponent('fReporte') as TForm)) then
      fReporte:=TfReporte.Create(Application);
    fReporte.qReporte.Active:=False;
    fReporte.qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE='+
                                qRecibidosCODIGOREPORTE.AsString;
    fReporte.qReporte.Active:=True;
    fReporte.qReporte.Edit;
    fReporte.Show;
  end;
end;

procedure TFListaReporteEstado.PCLibroChange(Sender: TObject);
begin
  inherited;
  If PCLibro.ActivePage = tsRecibidos then
  begin
     if qRecibidos.Recordcount > 1  then
       lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + inttostr(qRecibidos.Recordcount)+' Registros Encontrados >>'
     else
       lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + inttostr(qRecibidos.Recordcount)+' Registro Encontrado >>';
  end;
  If PCLibro.ActivePage = tsPendientes then
  begin
     if qPendientes.Recordcount > 1  then
       lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + inttostr(qPendientes.Recordcount)+' Registros Encontrados >>'
     else
       lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + inttostr(qPendientes.Recordcount)+' Registro Encontrado >>';
  end;
  If PCLibro.ActivePage = tsEjecucion then
  begin
    PCReporteAtendidos.ActivePage := tsTiempoAtendidos;
    if qEjecucion.Recordcount > 1  then
     lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + inttostr(qEjecucion.Recordcount)+' Registros Encontrados >>'
    else
     lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + inttostr(qEjecucion.Recordcount)+' Registro Encontrado >>';
  end;
  If PCLibro.ActivePage = tsTerminado then
  begin
    PCTerminados.ActivePage := TSTiempos;
    if qTerminados.Recordcount > 1  then
     lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + inttostr(qTerminados.Recordcount)+' Registros Encontrados >>'
    else
     lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + inttostr(qTerminados.Recordcount)+' Registro Encontrado >>';
  end;
end;

procedure TFListaReporteEstado.DBGDictadosDblClick(Sender: TObject);
begin
  if qDictadosCODIGOREPORTE.AsString <> '' then
  begin
    sCodReporte := qDictados.FieldByName('CODIGOREPORTE').AsInteger;
    if not (Assigned(Application.FindComponent('fReporte') as TForm)) then
      fReporte:=TfReporte.Create(Application);
    fReporte.qReporte.Active:=False;
    fReporte.qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE='+
                                qDictadosCODIGOREPORTE.AsString;
    fReporte.qReporte.Active:=True;
    fReporte.qReporte.Edit;
    fReporte.Show;
  end;
end;

procedure TFListaReporteEstado.dbgEjecucionDblClick(Sender: TObject);
begin
  if qEjecucionCODIGOREPORTE.AsString <> '' then
  begin
    sCodReporte := qEjecucion.FieldByName('CODIGOREPORTE').AsInteger;
    if not (Assigned(Application.FindComponent('fReporte') as TForm)) then
      fReporte:=TfReporte.Create(Application);
    fReporte.qReporte.Active:=False;
    fReporte.qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE='+
                                qEjecucionCODIGOREPORTE.AsString;
    fReporte.qReporte.Active:=True;
    fReporte.qReporte.Edit;
    fReporte.Show;
  end;
end;

procedure TFListaReporteEstado.AdicionarReportes;
var i,DatoBuscar : Integer;
begin
{  if DBGRecibidos.SelectedRows.Count>0
   then
    for i:=0 to DBGRecibidos.SelectedRows.Count-1 do
     begin// Inicio For
       qRecibidos.BookMark:=DBGRecibidos.SelectedRows.Items[i];
       DatoBuscar:= qRecibidos.FieldbyName('CODIGOREPORTE').asInteger;
       tReporte.Open;
       tReporte.SetKey;
       If tReporte.FindKey([DatoBuscar])
        then
          begin // inicio if 2
            if (i=0) or (DBGRecibidos.Fields[0].text<>'') // if 1
            then
             begin // inicio if 1
              try// Inicio Try
                tReporte.Edit;
//                tReporte.FieldByName('CodigoTurno').AsString := Turno;
                tReporte.FieldByName('CodigoBitacoraMovil').AsString := Bitacora;
                tReporte.FieldbyName('CODIGOCUADRILLA').asString     := Cuadrilla;
                tReporte.FieldbyName('FechaHoraDictado').AsDateTime  := Now;
                tReporte.FieldbyName('CODIGOESTADOREPORTE').asString :='2';
                tReporte.Post;
                MoverMovilAReporte(Cuadrilla,DatoBuscar);
              except
                tReporte.Cancel;
                tReporte.Refresh;
              end;// Fin Try
             end;// Fin if 1
          end; // Fin if 2
     end; // Fin For           }
end;


procedure TFListaReporteEstado.FormActivate(Sender: TObject);
begin
  inherited;
//  ActualizaReportes;
  lFecha.Caption:=FormatDateTime('mmmm dd "de" yyyy ',Date);
  lfecha.Refresh;
end;

procedure TFListaReporteEstado.FormCreate(Sender: TObject);
begin
  PCLibro.ActivePage := tsRecibidos;
  lista:=TStringList.create;
  ListaOrden := TStringList.Create;
  ListaFrom := TStringList.Create;
  qClienteDesc.Open;
  inherited;
end;

procedure TFListaReporteEstado.PCReporteAtendidosChange(Sender: TObject);
begin
  inherited;
 if PCTerminados.ActivePage = TSmoviles
 then
  begin
   FormActivate(Self);
  end;

end;

procedure TFListaReporteEstado.PCTerminadosChange(Sender: TObject);
begin
  inherited;
 if PCTerminados.ActivePage = TSmoviles
 then
  begin
   FormActivate(Self);
  end;

end;

procedure TFListaReporteEstado.PCDictadosChange(Sender: TObject);
begin
  inherited;
 if PCDictados.ActivePage = TSMovil
 then
  begin
   FormActivate(Self);
  end;
end;

procedure TFListaReporteEstado.sbAutomaticoClick(Sender: TObject);
var
  Lista, ListaTemp:TStringList;
  Cadena, NombreBarrio:String;
  i:Integer;
begin
  Lista     := TStringList.Create;
  ListaTemp := TStringList.Create;
  qRecibidos.Close;
  qRecibidos.SQL.Delete(qRecibidos.SQL.Count-1);
  qRecibidos.SQL.Add('Order By B.NombreBarrio');
  qRecibidos.Open;
  qRecibidos.First;
  NombreBarrio := '"'+qRecibidos.FieldByName('NombreBarrio').AsString+'"';
  Cadena:=NombreBarrio+','+qRecibidos.FieldByName('CodigoReporte').AsString;
      while not qRecibidos.Eof do
        begin
           qRecibidos.Next;
           if not (qRecibidos.Eof) then
           if qRecibidos.FieldByName('NOMBRECLASEREPORTE').AsString='SECTOR' then
              begin
                 if NombreBarrio = '"'+qRecibidos.FieldByName('NombreBarrio').AsString+'"' then
                     begin
                        Cadena:=Cadena+','+qRecibidos.FieldByName('CodigoReporte').AsString;
                     end
                 else
                   begin
                     Lista.Add(Cadena);
                     NombreBarrio := '"'+qRecibidos.FieldByName('NombreBarrio').AsString+'"';
                     Cadena:=NombreBarrio+','+qRecibidos.FieldByName('CodigoReporte').AsString;
                   end;
              end;
        end;
      Lista.Add(Cadena);
      //Lista.SaveToFile('C:\a.txt');
      for i:=0 to Lista.Count - 1 do
        begin
           ListaTemp.Clear;
           ListaTemp.CommaText:=Lista[i];
           if ListaTemp.Count > 2 then
              CrearGrupos(ListaTemp);
        end;
      Lista.Free;
      ListaTemp.Free;
      qRecibidos.Close;
      qRecibidos.Open;
end;

procedure TFListaReporteEstado.CrearGrupos(ListaTemp: TStringList);
var qTemp, qInsertar,  qDatos:TQuery;
    Codigo,Cadena:string;
    i:Integer;
    Padre:Double;
begin
   Padre:=StrToInt(ListaTemp[1]);
   for i:=2 to ListaTemp.Count-1 do
     begin
       if StrToFloat(ListaTemp[i]) < Padre then
          Padre:=StrToFloat(ListaTemp[i]);
     end;
   qTemp:=Tquery.Create(Application);
   qTemp.DatabaseName:='BaseDato';
   qDatos:=TQuery.Create(Application);
   qDatos.DataBaseName:='BaseDato';
   qInsertar := TQuery.Create(Application);
   qInsertar.DataBaseName:='BaseDato';

   qInsertar.SQL.Text:='Update Reporte Set CodigoClaseReporte=3 Where CodigoReporte = :Codigo';
   for i:=1 to ListaTemp.Count-1 do
     begin
       qTemp.Close;
       qTemp.SQL.Clear;
       qTemp.SQL.Add('Update Reporte Set CODIGOPADRE = '+FloatToStr(Padre));
       qTemp.SQL.Add('Where CodigoReporte='+ListaTemp[i]);
       if FloatToStr(Padre) = ListaTemp[i] then
         begin
            qInsertar.ParamByName('Codigo').AsString:=ListaTemp[i];
            qInsertar.ExecSQL;
         end;
       qTemp.ExecSQL;
     end;

   qInsertar.Free;
   qDatos.Free;
   qTemp.Free;

end;

procedure TFListaReporteEstado.LimpiarFiltro(Query:TQuery);
var
 nLineasExtra,i: Byte;
begin
 nLineasExtra := Query.SQL.Count-19;
 if nLineasExtra > 0 then
    for i:=1 to nLineasExtra do
     begin
      Query.SQL.Delete(18);
     end;
end;

procedure TFListaReporteEstado.sbFiltroCalendarioClick(Sender: TObject);
begin
  if sbFiltroCalendario.Down then
  begin
    pFiltroCalendario.Visible:=true;
    sbDiaClick(sbDia);
  end
  else
  begin
    pFiltroCalendario.Visible:=false;
    sbDia.Down:=false;
    sbMes.Down:=false;
    sbSemana.Down:=false;
    qFechaReferencia.sql.clear;
    qFechaReferencia.sql.add('SELECT MIN(FECHAHORA) AS FECHA FROM REPORTE');
    qfechaReferencia.close;
    qFechaReferencia.open;
  end;
end;

procedure TFListaReporteEstado.DBGRecibidosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
begin
  pt:=(sender as TRxDBGrid).MouseCoord(x, y);

  if pt.y=0 then
   begin
      (sender as TRxDBGrid).Cursor:=crHandPoint;
      if Shift = [ssShift] then
          TeclaShift:=True
      else
          TeclaShift:=False;
    end
  else
    (sender as TRxDBGrid).Cursor:=crDefault;
end;

procedure TFListaReporteEstado.dbgRecibidosTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if qRecibidos.FieldByName(Columna).Lookup  then
    Result := qRecibidos.FieldByName(Columna).KeyFields
  else
    if qRecibidos.FieldByName(Columna).Calculated then
    begin
      Result := '1';
      MessageDlg('Imposible ordenar por este campo calculado.' + Chr(13) +
                 'Se ordenara por el primer campo.', mtInformation, [mbOk], 0 );
    end
    else
      Result := Columna;
end;

var
  ListaTemp:TStringList;
  i,j:Integer;
  Encontrado:Boolean;
  Sort:String;
begin

  with dbgRecibidos.DataSource.DataSet do
  begin
    try
      dbgRecibidos.Columns[PreviousColumnIndex].title.Font.Style :=
      dbgRecibidos.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
    except
    end;
    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];

    Encontrado:=False;
    if PreviousColumnIndex = Column.Index then
       begin
         Encontrado:=True;
         ListaTemp:=TStringList.Create;
         for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
              end;
          end;
          ListaTemp.Free;
        end
    else
      begin
          if (not TeclaShift) then
             ListaOrden.Clear;
      end;

    PreviousColumnIndex := Column.Index;
    if (ListaOrden.Count > 0) and (not Encontrado) then
     begin
        ListaTemp:=TStringList.Create;
        Encontrado:=False;
        for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
                Encontrado:=True;
              end;
          end;
        if (not Encontrado) then
          if NombreColumna(Column.Field.FieldName) <> '' then
            ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');
        ListaTemp.Free;
     end;

     if (ListaOrden.Count = 0) then
       if NombreColumna(Column.Field.FieldName) <> '' then
        ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');

     qRecibidos.SQl.Delete(qRecibidos.SQl.Count - 1);
     Sort:='Order By ';
     for i:=0 to ListaOrden.Count - 1 do
     begin
       ListaTemp:=TStringList.Create;
       ListaTemp.CommaText:=ListaOrden[i];
       if i <> ListaOrden.Count - 1 then
         Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1] + ','
       else
         Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1];
       ListaTemp.Free;
     end;

     qRecibidos.Sql.Add(Sort);
     qRecibidos.Close;
     qRecibidos.Open;
  end;
end;

procedure TFListaReporteEstado.dbgPendientesTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if qPendientes.FieldByName(Columna).Lookup  then
    Result := qPendientes.FieldByName(Columna).KeyFields
  else
    if qPendientes.FieldByName(Columna).Calculated then
    begin
      Result := '1';
      MessageDlg('Imposible ordenar por este campo calculado.' + Chr(13) +
                 'Se ordenara por el primer campo.', mtInformation, [mbOk], 0 );
    end
    else
      Result := Columna;
end;

var
  ListaTemp:TStringList;
  i,j:Integer;
  Encontrado:Boolean;
  Sort:String;
begin

  with dbgPendientes.DataSource.DataSet do
  begin
    try
      dbgPendientes.Columns[PreviousColumnIndex].title.Font.Style :=
      dbgPendientes.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
    except
    end;
    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];

    Encontrado:=False;
    if PreviousColumnIndex = Column.Index then
       begin
         Encontrado:=True;
         ListaTemp:=TStringList.Create;
         for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
              end;
          end;
          ListaTemp.Free;
        end
    else
      begin
          if (not TeclaShift) then
             ListaOrden.Clear;
      end;

    PreviousColumnIndex := Column.Index;
    if (ListaOrden.Count > 0) and (not Encontrado) then
     begin
        ListaTemp:=TStringList.Create;
        Encontrado:=False;
        for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
                Encontrado:=True;
              end;
          end;
        if (not Encontrado) then
          if NombreColumna(Column.Field.FieldName) <> '' then
            ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');
        ListaTemp.Free;
     end;

     if (ListaOrden.Count = 0) then
       if NombreColumna(Column.Field.FieldName) <> '' then
        ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');

     qPendientes.SQl.Delete(qPendientes.SQl.Count - 1);
     Sort:='Order By ';
     for i:=0 to ListaOrden.Count - 1 do
     begin
       ListaTemp:=TStringList.Create;
       ListaTemp.CommaText:=ListaOrden[i];
       if i <> ListaOrden.Count - 1 then
         Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1] + ','
       else
         Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1];
       ListaTemp.Free;
     end;

     qPendientes.Sql.Add(Sort);
     //qPendientes.Sql.SaveToFile('C:\b.txt');
     qPendientes.Close;
     qPendientes.Open;
  end;
end;

procedure TFListaReporteEstado.DBGDictadosTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if qDictados.FieldByName(Columna).Lookup  then
    Result := qDictados.FieldByName(Columna).KeyFields
  else
    if qDictados.FieldByName(Columna).Calculated then
    begin
      Result := '1';
      MessageDlg('Imposible ordenar por este campo calculado.' + Chr(13) +
                 'Se ordenara por el primer campo.', mtInformation, [mbOk], 0 );
    end
    else
      Result := Columna;
end;

var
  ListaTemp:TStringList;
  i,j:Integer;
  Encontrado:Boolean;
  Sort:String;
begin

  with DBGDictados.DataSource.DataSet do
  begin
    try
      DBGDictados.Columns[PreviousColumnIndex].title.Font.Style :=
      DBGDictados.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
    except
    end;
    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];

    Encontrado:=False;
    if PreviousColumnIndex = Column.Index then
       begin
         Encontrado:=True;
         ListaTemp:=TStringList.Create;
         for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
              end;
          end;
          ListaTemp.Free;
        end
    else
      begin
          if (not TeclaShift) then
             ListaOrden.Clear;
      end;

    PreviousColumnIndex := Column.Index;
    if (ListaOrden.Count > 0) and (not Encontrado) then
     begin
        ListaTemp:=TStringList.Create;
        Encontrado:=False;
        for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
                Encontrado:=True;
              end;
          end;
        if (not Encontrado) then
          if NombreColumna(Column.Field.FieldName) <> '' then
            ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');
        ListaTemp.Free;
     end;

     if (ListaOrden.Count = 0) then
       if NombreColumna(Column.Field.FieldName) <> '' then
        ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');

     qDictados.SQl.Delete(qDictados.SQl.Count - 1);
     Sort:='Order By ';
     for i:=0 to ListaOrden.Count - 1 do
     begin
       ListaTemp:=TStringList.Create;
       ListaTemp.CommaText:=ListaOrden[i];
       if i <> ListaOrden.Count - 1 then
         Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1] + ','
       else
         Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1];
       ListaTemp.Free;
     end;

     qDictados.Sql.Add(Sort);
     qDictados.Close;
     qDictados.Open;
  end;
end;

procedure TFListaReporteEstado.dbgEjecucionTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if qEjecucion.FieldByName(Columna).Lookup  then
    Result := qEjecucion.FieldByName(Columna).KeyFields
  else
    if qEjecucion.FieldByName(Columna).Calculated then
    begin
      Result := '1';
      MessageDlg('Imposible ordenar por este campo calculado.' + Chr(13) +
                 'Se ordenara por el primer campo.', mtInformation, [mbOk], 0 );
    end
    else
      Result := Columna;
end;

var
  ListaTemp:TStringList;
  i,j:Integer;
  Encontrado:Boolean;
  Sort:String;
begin

  with dbgEjecucion.DataSource.DataSet do
  begin
    try
      dbgEjecucion.Columns[PreviousColumnIndex].title.Font.Style :=
      dbgEjecucion.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
    except
    end;
    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];

    Encontrado:=False;
    if PreviousColumnIndex = Column.Index then
       begin
         Encontrado:=True;
         ListaTemp:=TStringList.Create;
         for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
              end;
          end;
          ListaTemp.Free;
        end
    else
      begin
          if (not TeclaShift) then
             ListaOrden.Clear;
      end;

    PreviousColumnIndex := Column.Index;
    if (ListaOrden.Count > 0) and (not Encontrado) then
     begin
        ListaTemp:=TStringList.Create;
        Encontrado:=False;
        for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
                Encontrado:=True;
              end;
          end;
        if (not Encontrado) then
          if NombreColumna(Column.Field.FieldName) <> '' then
            ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');
        ListaTemp.Free;
     end;

     if (ListaOrden.Count = 0) then
       if NombreColumna(Column.Field.FieldName) <> '' then
        ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');

     qEjecucion.SQl.Delete(qEjecucion.SQl.Count - 1);
     Sort:='Order By ';
     for i:=0 to ListaOrden.Count - 1 do
     begin
       ListaTemp:=TStringList.Create;
       ListaTemp.CommaText:=ListaOrden[i];
       if i <> ListaOrden.Count - 1 then
         Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1] + ','
       else
         Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1];
       ListaTemp.Free;
     end;

     qEjecucion.Sql.Add(Sort);
     qEjecucion.Close;
     qEjecucion.Open;
  end;
end;

procedure TFListaReporteEstado.dbgTerminadosTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if qTerminados.FieldByName(Columna).Lookup  then
    Result := qEjecucion.FieldByName(Columna).KeyFields
  else
    if qTerminados.FieldByName(Columna).Calculated then
    begin
      Result := '1';
      MessageDlg('Imposible ordenar por este campo calculado.' + Chr(13) +
                 'Se ordenara por el primer campo.', mtInformation, [mbOk], 0 );
    end
    else
      Result := Columna;
end;

var
  ListaTemp:TStringList;
  i,j:Integer;
  Encontrado:Boolean;
  Sort:String;
begin

  with dbgterminados.DataSource.DataSet do
  begin
    try
      dbgterminados.Columns[PreviousColumnIndex].title.Font.Style :=
      dbgterminados.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
    except
    end;
    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];

    Encontrado:=False;
    if PreviousColumnIndex = Column.Index then
       begin
         Encontrado:=True;
         ListaTemp:=TStringList.Create;
         for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
              end;
          end;
          ListaTemp.Free;
        end
    else
      begin
          if (not TeclaShift) then
             ListaOrden.Clear;
      end;

    PreviousColumnIndex := Column.Index;
    if (ListaOrden.Count > 0) and (not Encontrado) then
     begin
        ListaTemp:=TStringList.Create;
        Encontrado:=False;
        for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
                Encontrado:=True;
              end;
          end;
        if (not Encontrado) then
          if NombreColumna(Column.Field.FieldName) <> '' then
            ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');
        ListaTemp.Free;
     end;

     if (ListaOrden.Count = 0) then
       if NombreColumna(Column.Field.FieldName) <> '' then
        ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');

     qTerminados.SQl.Delete(qTerminados.SQl.Count - 1);
     Sort:='Order By ';
     for i:=0 to ListaOrden.Count - 1 do
     begin
       ListaTemp:=TStringList.Create;
       ListaTemp.CommaText:=ListaOrden[i];
       if i <> ListaOrden.Count - 1 then
         Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1] + ','
       else
         Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1];
       ListaTemp.Free;
     end;

     qTerminados.Sql.Add(Sort);
     qTerminados.Close;
     qTerminados.Open;
  end;
end;

procedure TFListaReporteEstado.sbDiaClick(Sender: TObject);
begin
  inherited;
  qFechaReferencia.close;
  qFechaReferencia.sql.clear;
  qFechaReferencia.sql.add('SELECT TO_DATE(TO_CHAR(SYSDATE,''DD/MM/YYYY''),''DD/MM/YYYY'') FECHA FROM DUAL');
  qFechaReferencia.open;
end;

procedure TFListaReporteEstado.sbSemanaClick(Sender: TObject);
begin
  inherited;
  qFechaReferencia.close;
  qFechaReferencia.sql.clear;
  qFechaReferencia.sql.add('SELECT TO_DATE(TO_CHAR(NEXT_DAY((SYSDATE-7),''Lunes''),''DD/MM/YYYY''),''DD/MM/YYYY'')FECHA FROM DUAL');
  qFechaReferencia.open;
end;

procedure TFListaReporteEstado.sbMesClick(Sender: TObject);
begin
  inherited;
  qFechaReferencia.close;
  qFechaReferencia.sql.clear;
  qFechaReferencia.sql.add('SELECT TO_DATE(TO_CHAR(SYSDATE,''"01"/MM/YYYY''),''DD/MM/YYYY'')FECHA FROM DUAL');
  qFechaReferencia.open;
end;

procedure TFListaReporteEstado.FiltroReporteEstado(Query,QMovil:TQuery);
Var CadFrom : String;
begin
  If Lista <> Nil then
   begin
     Query.Close;
     If Query.sql.Count > 19 then LimpiarFiltro(Query);
     Query.sql.Insert(18,Lista.Text);
     CadFrom := 'FROM REPORTE R, INFORMANTE I, ADMINISTRATIVO A, TIPOREPORTE TR, CLASEREPORTE CR, ' +
                'ESTADOREPORTE ER, SUBESTACION S, CIRCUITO C, ADMINISTRATIVO AD, GRUPOTRABAJO GT,GEOGRAFICO G,TIPODANO TD';
     if ListaFrom.Count > 0 then
        CadFrom := CadFrom + ',' + ListaFrom.Text;

     Query.SQL[13]:= CadFrom;
     Query.SQL.SaveToFile(GetTemporalPath+'sqlListaReportes.txt');
     Query.Open;
     dsBase.DataSet := Query;
     if Query.Recordcount > 1
     then lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + inttostr(Query.Recordcount)+' Registros Encontrados >>'
     else lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + inttostr(Query.Recordcount)+' Registro Encontrado >>';
     //Movil
     if QMovil<>nil then
     begin
       QMovil.Close;
       If QMovil.sql.Count > 10 then LimpiarFiltroMovil(QMovil);
       QMovil.sql.Insert(8,Lista.Text);
       CadFrom := 'FROM REPORTE R, INFORMANTE I, ADMINISTRATIVO A, TIPOREPORTE TR, CLASEREPORTE CR, ' +
                  'ESTADOREPORTE ER, SUBESTACION S, CIRCUITO C, ADMINISTRATIVO AD, GRUPOTRABAJO GT,GEOGRAFICO G,TIPODANO TD';
       if ListaFrom.Count > 0 then
          CadFrom := CadFrom + ',' + ListaFrom.Text;

       QMovil.SQL[1]:= CadFrom;
       QMovil.Open;
//       dsBase.DataSet := Query;
     end;
   end;
end;

procedure TFListaReporteEstado.BitBtnFiltrarClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TFListaReporteEstado.Filtrar;
begin
  Lista := GetQueryFiltroReporte(ListaRotulos, ListaDatos, ListaFrom, CodReporte);
  FiltroReporteEstado(qRecibidos,nil);
  FiltroReporteEstado(qPendientes,nil);
  FiltroReporteEstado(qDictados,qMovilDictados);
  FiltroReporteEstado(qEjecucion,qMovilAtendidos);
  FiltroReporteEstado(qTerminados,qMovilTerminados);
  FiltroReporteEstado(qTotales,nil);
  FiltroReporteEstado(qTipoReporteRecibidos,nil);
  FiltroReporteEstado(qTipoClienteRecibidos,nil);
  FiltroReporteEstado(qTipoDanoPendientes,nil);
  FiltroReporteEstado(qTipoReportePendientes,nil);
  FiltroReporteEstado(qTipoClientePendientes,nil);
end;

procedure TFListaReporteEstado.FormShow(Sender: TObject);
begin
  sbFiltroCalendarioClick(sbFiltroCalendario);
  Filtrar;
  inherited;
end;

procedure TFListaReporteEstado.dbgPendientesDblClick(Sender: TObject);
begin
  if qPendientesCODIGOREPORTE.AsString <> '' then
  begin
    sCodReporte := qPendientes.FieldByName('CODIGOREPORTE').AsInteger;
    if not (Assigned(Application.FindComponent('fReporte') as TForm)) then
      fReporte:=TfReporte.Create(Application);
    fReporte.qReporte.Active:=False;
    fReporte.qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE='+
                                qPendientesCODIGOREPORTE.AsString;
    fReporte.qReporte.Active:=True;
    fReporte.qReporte.Edit;
    fReporte.Show;
  end;
end;

procedure TFListaReporteEstado.LimpiarFiltroMovil(Query: TQuery);
var
 nLineasExtra,i: Byte;
begin
  nLineasExtra := Query.SQL.Count-10;
  if nLineasExtra > 0 then
    for i:=1 to nLineasExtra do
     begin
      Query.SQL.Delete(8);
     end;
end;

procedure TFListaReporteEstado.qFechaReferenciaAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  ActualizaListaReportes;
end;

procedure TFListaReporteEstado.dbgRecibidosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if Field.FieldName='NOMBREESTADOREPORTE' then
  begin
     Background:=qRecibidosCOLOR.AsInteger;
  end;
  if (Field.FieldName='REPORTEPADRE') then
  begin
    if qRecibidosCOLORCELDA.asinteger <> 0 then
      Background:=qRecibidosCOLORCELDA.asinteger;
  end;
  if (Field.FieldName='REGISTROS') then
  begin
    if qRecibidosCOLORCELDA.asinteger <> 0 then
      if qRecibidosREGISTROS.asinteger> 0 then
        Background:=qRecibidosCOLORCELDA.asinteger;
  end;
  if (Field.FieldName='NOMBRECLASEREPORTE') then
  begin
    if (qRecibidosCODIGOCLASEREPORTE.ASSTRING='1') then
      Background:=$00E7D9AF;
    if (qRecibidosCODIGOCLASEREPORTE.ASSTRING='2') then
      Background:=$0015FAAC;
  end;
  if BackGround = 0 then BackGround := clWhite;
end;

procedure TFListaReporteEstado.dbgPendientesGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if Field.FieldName='NOMBREESTADOREPORTE' then
  begin
     Background:=qPendientesCOLOR.AsInteger;
  end;
  if (Field.FieldName='REPORTEPADRE') then
  begin
    if qPendientesCOLORCELDA.asinteger <> 0 then
      Background:=qPendientesCOLORCELDA.asinteger;
  end;
  if (Field.FieldName='REGISTROS') then
  begin
    if qPendientesCOLORCELDA.asinteger <> 0 then
      if qPendientesREGISTROS.asinteger> 0 then
        Background:=qPendientesCOLORCELDA.asinteger;
  end;
  if (Field.FieldName='NOMBRECLASEREPORTE') then
  begin
    if (qPendientesCODIGOCLASEREPORTE.ASSTRING='1') then
      Background:=$00E7D9AF;
    if (qPendientesCODIGOCLASEREPORTE.ASSTRING='2') then
      Background:=$0015FAAC;
  end;
  if BackGround = 0 then BackGround := clWhite;
end;

procedure TFListaReporteEstado.dbgDictadosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if Field.FieldName='NOMBREESTADOREPORTE' then
  begin
     Background:=qDictadosCOLOR.AsInteger;
  end;
  if (Field.FieldName='REPORTEPADRE') then
  begin
    if qDictadosCOLORCELDA.asinteger <> 0 then
      Background:=qDictadosCOLORCELDA.asinteger;
  end;
  if (Field.FieldName='REGISTROS') then
  begin
    if qDictadosCOLORCELDA.asinteger <> 0 then
      if qDictadosREGISTROS.asinteger> 0 then
        Background:=qDictadosCOLORCELDA.asinteger;
  end;
  if (Field.FieldName='NOMBRECLASEREPORTE') then
  begin
    if (qDictadosCODIGOCLASEREPORTE.ASSTRING='1') then
      Background:=$00E7D9AF;
    if (qDictadosCODIGOCLASEREPORTE.ASSTRING='2') then
      Background:=$0015FAAC;
  end;
  if BackGround = 0 then BackGround := clWhite;
end;

procedure TFListaReporteEstado.dbgEjecucionGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if Field.FieldName='NOMBREESTADOREPORTE' then
  begin
     Background:=qEjecucionCOLOR.AsInteger;
  end;
  if (Field.FieldName='REPORTEPADRE') then
  begin
    if qEjecucionCOLORCELDA.asinteger <> 0 then
      Background:=qEjecucionCOLORCELDA.asinteger;
  end;
  if (Field.FieldName='REGISTROS') then
  begin
    if qEjecucionCOLORCELDA.asinteger <> 0 then
      if qEjecucionREGISTROS.asinteger> 0 then
        Background:=qEjecucionCOLORCELDA.asinteger;
  end;
  if (Field.FieldName='NOMBRECLASEREPORTE') then
  begin
    if (qEjecucionCODIGOCLASEREPORTE.ASSTRING='1') then
      Background:=$00E7D9AF;
    if (qEjecucionCODIGOCLASEREPORTE.ASSTRING='2') then
      Background:=$0015FAAC;
  end;
  if BackGround = 0 then BackGround := clWhite;
end;

procedure TFListaReporteEstado.dbgTerminadosGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if Field.FieldName='NOMBREESTADOREPORTE' then
  begin
     Background:=qTerminadosCOLOR.AsInteger;
  end;
  if (Field.FieldName='REPORTEPADRE') then
  begin
    if qTerminadosCOLORCELDA.asinteger <> 0 then
      Background:=qTerminadosCOLORCELDA.asinteger;
  end;
  if (Field.FieldName='REGISTROS') then
  begin
    if qTerminadosCOLORCELDA.asinteger <> 0 then
      if qTerminadosREGISTROS.asinteger> 0 then
        Background:=qTerminadosCOLORCELDA.asinteger;
  end;
  if (Field.FieldName='NOMBRECLASEREPORTE') then
  begin
    if (qTerminadosCODIGOCLASEREPORTE.ASSTRING='1') then
      Background:=$00E7D9AF;
    if (qTerminadosCODIGOCLASEREPORTE.ASSTRING='2') then
      Background:=$0015FAAC;
  end;
  if BackGround = 0 then BackGround := clWhite;
end;

procedure TFListaReporteEstado.qMovilDictadosCalcFields(DataSet: TDataSet);
var t:double;
 dias:integer;
 cadena:string;
begin
  t:=qMovilDictadosTIEMPODICTADO.AsFloat;
  dias:=trunc(t);
  t:=t-dias;
  Horas := Int(t*24);
  Minutos := InT((t*24-Horas)*60);
  Segundos := Int( (((t*24-Horas)*60)-Minutos)*60);
  cadena:='';
  if dias>0 then cadena:=  intToStr(dias)+' Dias ';
  Dataset.FieldByName('TiempoCadena').AsString :=cadena+FloatToStr(Horas)+' horas  '+FloatToStr(Minutos)+' min  '+FloatToStr(Segundos)+' Seg';
end;

procedure TFListaReporteEstado.qMovilAtendidosCalcFields(
  DataSet: TDataSet);
var t:double;
 dias:integer;
 cadena:string;
begin
  t:=qMovilAtendidosTIEMPOLLEGADA.AsFloat;
  dias:=trunc(t);
  t:=t-dias;
  Horas := Int(t*24);
  Minutos := InT((t*24-Horas)*60);
  Segundos := Int( (((t*24-Horas)*60)-Minutos)*60);
  cadena:='';
  if dias>0 then cadena:=  intToStr(dias)+' Dias ';
  Dataset.FieldByName('TiempoCadena').AsString :=cadena+FloatToStr(Horas)+' horas  '+FloatToStr(Minutos)+' min  '+FloatToStr(Segundos)+' Seg';
end;

procedure TFListaReporteEstado.qMovilTerminadosCalcFields(
  DataSet: TDataSet);
var t:double;
 dias:integer;
 cadena:string;
begin
  t:=qMovilTerminadosTIEMPOATENCION.AsFloat;
  dias:=trunc(t);
  t:=t-dias;
  Horas := Int(t*24);
  Minutos := InT((t*24-Horas)*60);
  Segundos := Int( (((t*24-Horas)*60)-Minutos)*60);
  cadena:='';
  if dias>0 then cadena:=  intToStr(dias)+' Dias ';
  Dataset.FieldByName('TiempoCadena').AsString :=cadena+FloatToStr(Horas)+' horas  '+FloatToStr(Minutos)+' min  '+FloatToStr(Segundos)+' Seg';
end;

end.
