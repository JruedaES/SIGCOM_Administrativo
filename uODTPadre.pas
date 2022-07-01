//***************************************************************************
//                    Módulo de ODT
//              - Principal - ODT PADRE
//          Registro de órdenes de Trabajo Padre
//***************************************************************************

unit uODTPadre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, ComCtrls, ImgList, Db,
  DBTables, ToolEdit, RXDBCtrl, Menus, utMenuArbol, Grids, DBGrids, Qrctrls,
  RXSplit, QuickRpt,uQRAuxilio, Digisoft, uQRAuxilioIndividual,uQRODTPadre,
  uQRODTPadreAdc;

type
  TfODTPadre = class(TFBase)
    pSuperior: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    dbMotivos: TDBMemo;
    dbeNumero: TDBEdit;
    pInferior: TPanel;
    bbCancelar: TBitBtn;
    bbAceptar: TBitBtn;
    bbImprimir: TBitBtn;
    ImageList1: TImageList;
    pIzquierdo: TPanel;
    Arbol: TTreeView;
    qODT: TQuery;
    dsODT: TDataSource;
    Label3: TLabel;
    dbeImpreso: TDBEdit;
    qODTCODIGOODT: TFloatField;
    qODTFECHAEMISION: TDateTimeField;
    qODTCODIGOADMINISTRATIVO: TFloatField;
    qODTCODIGOPRIORIDAD: TStringField;
    qODTCODIGOTIPOTAREA: TFloatField;
    qODTCODIGOAPROBADO: TFloatField;
    qODTCODIGOREVISADO: TFloatField;
    qODTCODIGOODTTIPOMANOOBRA: TFloatField;
    qODTCODIGOEJECUTOR: TFloatField;
    qODTCODIGOFIRMANTE: TFloatField;
    qODTEQUIPOENERGIZADO: TStringField;
    qODTFECHAAPROBACION: TDateTimeField;
    qODTFECHAASIGNACION: TDateTimeField;
    qODTIMPUTACIONMATERIAL: TStringField;
    qODTCOSTOMATERIAL: TFloatField;
    qODTCOSTOMANOOBRA: TFloatField;
    qODTCOSTOTRANSPORTE: TFloatField;
    qODTCOSTOEQUIPO: TFloatField;
    qODTCODIGOALMACEN: TStringField;
    qODTCODIGOESTADOODT: TStringField;
    UpdODT: TUpdateSQL;
    qODTImpresoODT: TStringField;
    qTipoTarea: TQuery;
    dsTipoTarea: TDataSource;
    dsEstadoODT: TDataSource;
    qEstadoODT: TQuery;
    dsPrioridad: TDataSource;
    qPrioridad: TQuery;
    qLabor: TQuery;
    dsLabor: TDataSource;
    qCIA: TQuery;
    dMenuCIA: TdMenuArbol;
    qTipoManoObra: TQuery;
    dsTipoManoOBra: TDataSource;
    qEmpleado: TQuery;
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
    qReporteCODIGOODT: TFloatField;
    qReporteCODIGOREPORTE_1: TFloatField;
    qReporteCONSECUTIVO: TFloatField;
    dsReporte: TDataSource;
    qReporteNOMBREFUNCIONARIO: TStringField;
    qReporteDireccionCalculada: TStringField;
    qReporteCODIGOTIPOVIA: TFloatField;
    qReporteCODIGONOMBREVIA: TFloatField;
    qReporteMODIFICADORVIA: TStringField;
    qReporteDUPLICADOR: TFloatField;
    qReporteMODIFICADORDUPLICADOR: TStringField;
    qReporteNUMEROPUERTA: TFloatField;
    qPrecioMaterial: TQuery;
    dsPresMate: TDataSource;
    dbeFechaEmision: TDBEdit;
    pmImprimir: TPopupMenu;
    ParteAnterior1: TMenuItem;
    PartePosterior1: TMenuItem;
    Notebook: TNotebook;
    DBGridReportes: TRxDBGrid;
    PanelReporteDetalle: TPanel;
    Label16: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBGridMaterial: TRxDBGrid;
    HojaAdicional1: TMenuItem;
    ReportesAsociados: TMenuItem;
    qODTHORARIONORMALDESDE: TDateTimeField;
    qODTHORARIONORMALHASTA: TDateTimeField;
    dsTurnoGrupo: TDataSource;
    qODTSobreTiempo: TQuery;
    dsODTSobreTiempo: TDataSource;
    qODTSobreTiempoCODIGOODT: TFloatField;
    qODTSobreTiempoCODIGOEMPLEADO: TFloatField;
    qODTSobreTiempoOBSERVACION: TStringField;
    qODTSobreTiempoFECHAASIGNACION: TDateTimeField;
    qPresMano: TQuery;
    dsPresMano: TDataSource;
    qPresManoCODIGOEMPLEADO: TFloatField;
    qPresManoCODIGOODT: TFloatField;
    qPresManoNOMBREEMPLEADO: TStringField;
    qODTSobreTiempoCODIGOODTSOBRETIEMPO: TFloatField;
    qODTSobreTiempoCANTIDADDIURNA: TFloatField;
    qODTSobreTiempoCANTIDADNOCTURNA: TFloatField;
    UpdSobreTiempo: TUpdateSQL;
    qODTCODIGOTURNOGRUPO: TFloatField;
    qTurnoGrupo: TQuery;
    pmExtras: TPopupMenu;
    Copiar1: TMenuItem;
    Pegar1: TMenuItem;
    UpdODTHija: TUpdateSQL;
    qODTHija: TQuery;
    qODTHijaCODIGOODT: TFloatField;
    qODTHijaCONSECUTIVO: TFloatField;
    qODTHijaIMPRESOODT: TStringField;
    qODTHijaFECHAINICIOTRABAJO: TDateTimeField;
    qODTHijaFECHAFINALTRABAJO: TDateTimeField;
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
    qODTHijaOBSERVACION3: TStringField;
    qODTHijaCODIGOSUBESTACION: TStringField;
    qODTHijaCODIGOTIPOELEMENTO: TStringField;
    qODTHijaCODIGOEQUIPO: TStringField;
    qODTHijaDireccionCalculada: TStringField;
    qODTHijaCODIGOTIPOPREDIO: TStringField;
    dsODTHija: TDataSource;
    qODTCODIGOLABOR: TStringField;
    qTurnoGrupoCODIGOTURNOGRUPO: TFloatField;
    qTurnoGrupoNOMBRETURNO: TStringField;
    qLaborCODIGOLABOR: TStringField;
    qLaborNOMBRELABOR: TStringField;
    qODTMOTIVOS: TMemoField;
    DBGridManoObra: TDBGrid;
    PanelExtras: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    sbEditarExtras: TSpeedButton;
    sbAgregarExtras: TSpeedButton;
    sbEliminarExtras: TSpeedButton;
    DBGridSobreTiempo: TDBGrid;
    qODTCODIGOZONATRABAJO: TFloatField;
    qODTCODIGOIMPUTACIONMATERIAL: TFloatField;
    qODTSECUENCIA: TStringField;
    qODTCODIGOMUNICIPIO: TFloatField;
    qODTFECHAINICIO: TDateTimeField;
    qODTFECHAFINAL: TDateTimeField;
    qODTCODIGOZONAORIGEN: TFloatField;
    qAuxilio: TQuery;
    qAuxilioTotalAlimentacion: TFloatField;
    qAuxilioTotalOtrosGastos: TFloatField;
    qAuxilioTotalAuxilio: TFloatField;
    qAuxilioCODIGOAUXILIO: TFloatField;
    qAuxilioCODIGOEMPLEADO: TFloatField;
    qAuxilioCODIGOODT: TFloatField;
    qAuxilioFECHAINICIO: TDateTimeField;
    qAuxilioFECHAFIN: TDateTimeField;
    qAuxilioCANTIDADDESAYUNOS: TFloatField;
    qAuxilioCANTIDADALMUERZOS: TFloatField;
    qAuxilioCANTIDADCOMIDAS: TFloatField;
    dsAuxilio: TDataSource;
    updAuxilio: TUpdateSQL;
    qAuxilioResumen: TQuery;
    qAuxilioResumenCODIGOAUXILIO: TFloatField;
    dsAuxilioResumen: TDataSource;
    qViaticoResumen: TQuery;
    qViaticoResumenCODIGOCOMISION: TFloatField;
    qViaticoResumenCODIGOVIATICO: TFloatField;
    qViaticoResumenVALORCOMISION: TFloatField;
    dsViaticoResumen: TDataSource;
    qViatico: TQuery;
    qViaticoCODIGOVIATICO: TFloatField;
    qViaticoCODIGOEMPLEADO: TFloatField;
    qViaticoCODIGOODT: TFloatField;
    qViaticoCODIGOCOMISION: TFloatField;
    qViaticoCODIGOZONAORIGEN: TFloatField;
    qViaticoCODIGOMUNICIPIODESTINO: TFloatField;
    qViaticoFECHAINICIO: TDateTimeField;
    qViaticoFECHAFIN: TDateTimeField;
    qViaticoUSOVEHICULO: TStringField;
    qViaticoCODIGOVEHICULO: TStringField;
    qViaticoVEHICULOOFICIAL: TStringField;
    dsViatico: TDataSource;
    updViatico: TUpdateSQL;
    gbClasificacion: TGroupBox;
    Label13: TLabel;
    Label15: TLabel;
    Label8: TLabel;
    dbePrioridad: TDBEdit;
    dbeLabor: TDBEdit;
    dblcbPrioridad: TDBLookupComboBox;
    dblcbLabor: TDBLookupComboBox;
    dblcbTarea: TDBLookupComboBox;
    dbeTarea: TDBEdit;
    gbEjecucion: TGroupBox;
    Label9: TLabel;
    Label11: TLabel;
    sbRevisado: TSpeedButton;
    Label12: TLabel;
    sbEjecutado: TSpeedButton;
    dblcbTipoManoObra: TDBLookupComboBox;
    EdRevisado: TEdit;
    EdEjecutado: TEdit;
    GroupBox3: TGroupBox;
    qImputacion: TQuery;
    qImputacionCODIGOIMPUTACIONMATERIAL: TFloatField;
    qImputacionCODIGOMUNICIPIO: TFloatField;
    qImputacionNUMEROIMPUTACION: TFloatField;
    qImputacionAUXILIAR: TFloatField;
    qImputacionDESCRIPCIONIMPUTACIONMATERIAL: TStringField;
    qImputacionCODIGOAREA: TFloatField;
    qImputacionRURAL: TStringField;
    dsqImputacion: TDataSource;
    qMunicipio: TQuery;
    qMunicipioCODIGOMUNICIPIO: TFloatField;
    qMunicipioNOMBREMUNICIPIO: TStringField;
    qMunicipioCODIGOZONA: TFloatField;
    qMunicipioCODIGO_CUENTA: TFloatField;
    qMunicipioZONAESPECIAL: TStringField;
    dsqMunicipio: TDataSource;
    qZona: TQuery;
    qZonaCODIGOZONA: TFloatField;
    qZonaNOMBREZONA: TStringField;
    dsZona: TDataSource;
    LiquidacindeAuxilios1: TMenuItem;
    qrcAuxilioGrupo: TQRCompositeReport;
    Label28: TLabel;
    pmAuxilios: TPopupMenu;
    CopiarAuxilios: TMenuItem;
    PegarAuxilios: TMenuItem;
    pmViaticos: TPopupMenu;
    CopiarViaticos: TMenuItem;
    PegarViaticos: TMenuItem;
    qODTCODIGOCONTRATISTA: TStringField;
    qContratista: TQuery;
    dsContratista: TDataSource;
    Label21: TLabel;
    dbeContratista: TDBEdit;
    dblcContratista: TDBLookupComboBox;
    qAuxilioRESPONSABLECOBRO: TStringField;
    qAuxilioCODIGOVEHICULO: TStringField;
    qZonaCODIGOZONAESSA: TFloatField;
    qODTCodigoZonaEssa: TIntegerField;
    pmEditarViaticos: TPopupMenu;
    pmAgregarViaticos: TPopupMenu;
    EditarAnticipo1: TMenuItem;
    EditarViaticos1: TMenuItem;
    AgregarAnticipo1: TMenuItem;
    AgregarViaticos1: TMenuItem;
    qViaticoVALORANTICIPO: TFloatField;
    qViaticoFECHAPAGOANTICIPO: TDateTimeField;
    qViaticoFECHAPAGOVIATICO: TDateTimeField;
    qViaticoANTICIPO: TStringField;
    qViaticoPORCENTAJEANTICIPO: TFloatField;
    qViaticoDIASPROYECTADOS: TFloatField;
    dsAreaInfluencia: TDataSource;
    qAreaInfluencia: TQuery;
    qODTCODIGOAREAINFLUENCIA: TStringField;
    qViaticoCIUDADCAPITAL: TStringField;
    qViaticoDESTINO: TStringField;
    GroupBox1: TGroupBox;
    DBMemoDanos: TDBMemo;
    PartePosteriorFormatoAnterior: TMenuItem;
    dbeContrato: TDBEdit;
    Label30: TLabel;
    sbBuscarContrato: TSpeedButton;
    qODTNUMEROCONTRATO: TStringField;
    qMaterialesImprimir: TQuery;
    qrcMateriales: TQRCompositeReport;
    dblcbContrato: TDBLookupComboBox;
    qContrato: TQuery;
    qContratoCODIGO_CONTRATO: TStringField;
    qContratoCEDULA_CONTRATISTA: TFloatField;
    dsContrato: TDataSource;
    qAuxilioResumenFECHAINICIO: TDateTimeField;
    qAuxilioResumenCOBROINDIVIDUAL: TStringField;
    pmImprimirViaticos: TPopupMenu;
    ImprimirViatico1: TMenuItem;
    qrcAuxilioIndividual: TQRCompositeReport;
    qTipoTurno: TQuery;
    qTipoTurnoCODIGOTIPOTURNO: TFloatField;
    qTipoTurnoNOMBRETIPOTURNO: TStringField;
    dsTipoTurno: TDataSource;
    qDescripcionTurno: TQuery;
    qDescripcionTurnoCODIGOTIPOTURNO: TFloatField;
    qDescripcionTurnoCODIGOTURNO: TFloatField;
    qDescripcionTurnoDesdeHasta: TStringField;
    qODTNombreTurno2: TStringField;
    qODTNombreTurnoDetalle2: TStringField;
    qODTCODIGOTIPOTURNO: TFloatField;
    qODTCODIGOTURNO: TFloatField;
    qDescripcionTurnoDESDE: TDateTimeField;
    qDescripcionTurnoHASTA: TDateTimeField;
    qDatosExtras: TQuery;
    qDatosViaticos: TQuery;
    qDatosAuxilios: TQuery;
    qDatosExtrasCANTIDADDIURNA: TFloatField;
    qDatosExtrasCANTIDADNOCTURNA: TFloatField;
    qDatosExtrasDESDE: TDateTimeField;
    qDatosExtrasHASTA: TDateTimeField;
    qDatosViaticosDIASPAGADOS: TFloatField;
    qDatosViaticosVALOR: TFloatField;
    qDatosAuxiliosCANTIDADDESAYUNOS: TFloatField;
    qDatosAuxiliosCANTIDADALMUERZOS: TFloatField;
    qDatosAuxiliosCANTIDADCOMIDAS: TFloatField;
    qMaterialesImprimirCODIGOODT: TFloatField;
    qMaterialesImprimirCONSECUTIVO: TFloatField;
    qMaterialesImprimirCODIGOMATERIAL: TFloatField;
    qMaterialesImprimirNOMBREMATERIAL: TStringField;
    qMaterialesImprimirCODIGOUNIDAD: TStringField;
    qMaterialesImprimirCANTIDADSOLICITADA: TFloatField;
    qMaterialesImprimirCANTIDADENTREGADA: TFloatField;
    qMaterialesImprimirCANTIDADCONSUMIDA: TFloatField;
    qMaterialesImprimirCANTIDADREINTEGRADABUENA: TFloatField;
    qMaterialesImprimirCANTIDADREINTEGRADAMALA: TFloatField;
    qMaterialesImprimirCANTIDADRETIRADABUENA: TFloatField;
    qMaterialesImprimirCANTIDADRETIRADAMALA: TFloatField;
    qMaterialesImprimirVALORPRESUPUESTADO: TFloatField;
    qMaterialesImprimirVALORLIQUIDADO: TFloatField;
    qMaterialesImprimirCANTIDADTRASLADONUEVA: TFloatField;
    qMaterialesImprimirCANTIDADTRASLADODESMAN: TFloatField;
    qContratistaCODIGOCONTRATISTA: TStringField;
    qContratistaNOMBRECONTRATISTA: TStringField;
    qAnticipoViaticoInicial: TQuery;
    dsAnticipoViaticoInicial: TDataSource;
    qAnticipoViaticoInicialCODIGOVIATICO: TFloatField;
    qAnticipoViaticoInicialCODIGOEMPLEADO: TFloatField;
    qAnticipoViaticoInicialCODIGOODT: TFloatField;
    qAnticipoViaticoInicialCODIGOCOMISION: TFloatField;
    qAnticipoViaticoInicialCODIGOZONAORIGEN: TFloatField;
    qAnticipoViaticoInicialCODIGOMUNICIPIODESTINO: TFloatField;
    qAnticipoViaticoInicialFECHAINICIO: TDateTimeField;
    qAnticipoViaticoInicialFECHAFIN: TDateTimeField;
    qAnticipoViaticoInicialUSOVEHICULO: TStringField;
    qAnticipoViaticoInicialCODIGOVEHICULO: TStringField;
    qAnticipoViaticoInicialVEHICULOOFICIAL: TStringField;
    qAnticipoViaticoInicialVALORANTICIPO: TFloatField;
    qAnticipoViaticoInicialFECHAPAGOANTICIPO: TDateTimeField;
    qAnticipoViaticoInicialFECHAPAGOVIATICO: TDateTimeField;
    qAnticipoViaticoInicialANTICIPO: TStringField;
    qAnticipoViaticoInicialPORCENTAJEANTICIPO: TFloatField;
    qAnticipoViaticoInicialDIASPROYECTADOS: TFloatField;
    qAnticipoViaticoInicialCIUDADCAPITAL: TStringField;
    qAnticipoViaticoInicialDESTINO: TStringField;
    qAnticipoViaticoInicialESTADO: TStringField;
    qAnticipoViaticoInicialDIFICILACCESO: TStringField;
    qAnticipoViaticoInicialVALORDIARIO: TFloatField;
    qAnticipoViaticoInicialDIASPAGADOS: TFloatField;
    qAnticipoViaticoInicialIMPRESOANTICIPO: TStringField;
    OdtPadreAP: TMenuItem;
    RegistrodeOperacionesAP: TMenuItem;
    GroupBox4: TGroupBox;
    DBText1: TDBText;
    dbGridDetalleLabor: TRxDBGrid;
    qODTLaborDetalle: TQuery;
    qODTLaborDetalleCODIGOODTLABORDETALLE: TFloatField;
    qODTLaborDetalleCODIGOODT: TFloatField;
    qODTLaborDetalleCODIGOLABORDETALLE: TFloatField;
    qODTLaborDetalleESTADO: TFloatField;
    qODTLaborDetalleNOMBRELABORDETALLE: TStringField;
    dsODTLaborDetalle: TDataSource;
    updODTLaborDetalle: TUpdateSQL;
    DBCheckBox1: TDBCheckBox;
    qZonaCODIGOMUNICIPIOBASE: TFloatField;
    StoredProc1: TStoredProc;
    qContratistaCEDULACONTRATISTA: TFloatField;
    Visitas1: TMenuItem;
    qReporteDESCRIPCION: TMemoField;
    DBMemo1: TDBMemo;
    qPresmate: TQuery;
    qPresmateCODIGOODT: TFloatField;
    qPresmateCONSECUTIVO: TFloatField;
    qPresmateCODIGOMATERIAL: TFloatField;
    qPresmateNUMEROVALE: TFloatField;
    qPresmateCANTIDADSOLICITADA: TFloatField;
    qPresmateCANTIDADENTREGADA: TFloatField;
    qPresmateCANTIDADCONSUMIDA: TFloatField;
    qPresmateCANTIDADREINTEGRADAMALA: TFloatField;
    qPresmateCANTIDADRETIRADABUENA: TFloatField;
    qPresmateCANTIDADRETIRADAMALA: TFloatField;
    sbVerExtras: TSpeedButton;
    qPresMateNombreMaterial: TStringField;
    qPresMateNombreUnidad: TStringField;
    Label25: TLabel;
    DBEdit8: TDBEdit;
    dblcbNombreZona: TDBLookupComboBox;
    qViaticoESTADO: TStringField;
    qViaticoDIFICILACCESO: TStringField;
    qViaticoVALORDIARIO: TFloatField;
    qViaticoDIASPAGADOS: TFloatField;
    qViaticoIMPRESOANTICIPO: TStringField;
    qViaticoCODIGOGEOGRAFICO: TFloatField;
    qViaticoDEVOLUCION: TStringField;
    qViaticoIMPRESOVIATICO: TStringField;
    qViaticoNUMEROIMPRESION: TFloatField;
    qAuxilioESTADO: TStringField;
    qAuxilioCOBROINDIVIDUAL: TStringField;
    qAuxilioDEVOLUCION: TStringField;
    qAuxilioIMPRESO: TStringField;
    qAuxilioNUMEROIMPRESION: TFloatField;
    bbtnAuditoria: TBitBtn;
    PanelViaticoAuxilio: TPanel;
    PanelViaticos: TPanel;
    Panel4: TPanel;
    DBGridViaticos: TDBGrid;
    nbViaticos: TNotebook;
    Panel11: TPanel;
    sbEditarViaticos: TSpeedButton;
    sbAgregarViaticos: TSpeedButton;
    sbEliminarViaticos: TSpeedButton;
    Panel1: TPanel;
    sbVerViatico: TSpeedButton;
    PanelAuxilios: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    nbAuxilios: TNotebook;
    sbEditarAuxilios: TSpeedButton;
    sbAgregarAuxilios: TSpeedButton;
    sbEliminarAuxilios: TSpeedButton;
    sbImprimirAuxilios: TSpeedButton;
    sbVerAuxilios: TSpeedButton;
    DBGridAuxilios: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    qModoOdt: TQuery;
    qODTCODIGOMODOODT: TFloatField;
    dsModoOdt: TDataSource;
    Label14: TLabel;
    EdAprueba: TEdit;
    sbAprobado: TSpeedButton;
    Label18: TLabel;
    dbeFechaAprobacion: TDBEdit;
    sbFechaAprobacion: TSpeedButton;
    Label29: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label7: TLabel;
    Bevel1: TBevel;
    dbrgEnergizado: TDBRadioGroup;
    Bevel2: TBevel;
    gbHorarioTrabajo: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    dblcbTipoTurno: TDBLookupComboBox;
    dblcbTurno: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    sbCigMunicipio: TSpeedButton;
    qODTNombreMunicipio: TStringField;
    LFechaAsignacion: TLabel;
    dbeFechaAsignacion: TDBEdit;
    sbFechaAsignacion: TSpeedButton;
    dbEdNombreMunicipio: TDBLookupComboBox;
    qAuxilioResumenVALORALIMENTACION: TFloatField;
    qAuxilioResumenVALOROTROSGASTOS: TFloatField;
    qAuxilioResumenVALORTOTAL: TFloatField;
    Label22: TLabel;
    SpeedButton1: TSpeedButton;
    dbeCIA: TDBEdit;
    lbCIA: TLabel;
    Label24: TLabel;
    lbArea: TLabel;
    Label26: TLabel;
    lbCentroCosto: TLabel;
    GroupBox2: TGroupBox;
    Label33: TLabel;
    DBEdit7: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Bevel3: TBevel;
    Label23: TLabel;
    dbEdFechaInicio: TDBEdit;
    sbFechaInicial: TSpeedButton;
    Label27: TLabel;
    dbEdFechaFin: TDBEdit;
    sbFechaFin: TSpeedButton;
    qODTNOTAS: TMemoField;
    qODTHijaOBSERVACION1: TMemoField;
    qODTHijaOBSERVACION2: TMemoField;
    Label17: TLabel;
    dbEdFechaFinEstimada: TDBEdit;
    sbFechaFinEstimada: TSpeedButton;
    qODTFECHAFINALESTIMADA: TDateTimeField;
    AgregarGastosComision1: TMenuItem;
    EditarGastosComision1: TMenuItem;
    EditarViaticoConciliacion1: TMenuItem;
    AgregarConciliacionViaticos1: TMenuItem;
    qViaticoResumenTIPO: TStringField;
    Viaticos1: TMenuItem;
    Viatico1: TMenuItem;
    Conciliacion1: TMenuItem;
    OtrosGastos1: TMenuItem;
    qViaticoResumenCONCILIACIONREALIZADA: TStringField;
    Label31: TLabel;
    SpeedButton2: TSpeedButton;
    qODTCODIGOMUNICIPIOORIGEN: TFloatField;
    dsMunicipioOrigen: TDataSource;
    qMunicipioOrigen: TQuery;
    qODTNombreMunicipioOrigen2: TStringField;
    DBLookupComboBox4: TDBLookupComboBox;
    qMunicipioOrigenCODIGOZONA: TFloatField;
    qMunicipioOrigenCODIGOMUNICIPIO: TFloatField;
    qMunicipioOrigenNOMBREMUNICIPIO: TStringField;
    qMunicipioOrigenCODIGO_CUENTA: TFloatField;
    qMunicipioOrigenZONAESPECIAL: TStringField;
    dbcbAsociaReportes: TDBCheckBox;
    BitBtn1: TBitBtn;
    qODTASOCIARREPORTESDANO: TStringField;
    qODTCODIGOCOORDINACIONGRUPOTRABAJO: TFloatField;
    qCoordinadorMunicipio: TQuery;
    dsCoordinadorMunicipio: TDataSource;
    qCoordinadorMunicipioCODIGOCOORDINACIONGRUPOTRABAJO: TFloatField;
    qCoordinadorMunicipioNOMBRECOORDINACIONGRUPOTRABAJO: TStringField;
    qCoordinadorMunicipioACTIVO: TStringField;
    dbeCoordinador: TDBEdit;
    dbcbCoordinador: TDBLookupComboBox;
    Label32: TLabel;
    qODTHijaDESCRIPCIONTIPOPREDIO: TMemoField;
    OpenDialog1: TOpenDialog;
    BitBtn2: TBitBtn;
    Label34: TLabel;
    procedure FormShow(Sender: TObject);
    procedure qODTCalcFields(DataSet: TDataSet);
    procedure qODTCODIGOADMINISTRATIVOValidate(Sender: TField);
    procedure sbAprobadoClick(Sender: TObject);
    procedure sbRevisadoClick(Sender: TObject);
    procedure qODTCODIGOAPROBADOValidate(Sender: TField);
    procedure qODTCODIGOREVISADOValidate(Sender: TField);
    procedure EdApruebaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdRevisadoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dMenuCIASelectID(Sender: tnMenuItem; ID: Integer;
      MenuEstructura: tMenuEs);
    procedure bbAceptarClick(Sender: TObject);
    procedure bbCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ArbolChange(Sender: TObject; Node: TTreeNode);
    procedure qReporteCalcFields(DataSet: TDataSet);
    procedure DBGridMaterialDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure sbFechaEmisionClick(Sender: TObject);
    procedure dbeFechaEmisionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbFechaAprobacionClick(Sender: TObject);
    procedure dbeFechaAprobacionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbFechaAsignacionClick(Sender: TObject);
    procedure dbeFechaAsignacionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qODTAfterInsert(DataSet: TDataSet);
    procedure sbEjecutadoClick(Sender: TObject);
    procedure EdEjecutadoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qODTCODIGOEJECUTORValidate(Sender: TField);
    procedure bbImprimirClick(Sender: TObject);
    procedure qODTAfterPost(DataSet: TDataSet);
    procedure ParteAnterior1Click(Sender: TObject);
    procedure PartePosterior1Click(Sender: TObject);
    procedure qODTCODIGOESTADOODTChange(Sender: TField);
    procedure HojaAdicional1Click(Sender: TObject);
    procedure ReportesAsociadosClick(Sender: TObject);
    procedure qODTSobreTiempoAfterInsert(DataSet: TDataSet);
    procedure sbAgregarExtrasClick(Sender: TObject);
    procedure sbEditarExtrasClick(Sender: TObject);
    procedure qODTSobreTiempoAfterOpen(DataSet: TDataSet);
    procedure sbEliminarExtrasClick(Sender: TObject);
    procedure qODTSobreTiempoAfterPost(DataSet: TDataSet);
    procedure qODTCODIGOESTADOODTValidate(Sender: TField);
    procedure Copiar1Click(Sender: TObject);
    procedure Pegar1Click(Sender: TObject);
    procedure qODTCODIGOADMINISTRATIVOChange(Sender: TField);
    procedure qPresManoAfterScroll(DataSet: TDataSet);
    procedure sbEditarViaticosClick(Sender: TObject);
    procedure sbAgregarViaticosClick(Sender: TObject);
    procedure sbEliminarViaticosClick(Sender: TObject);
    procedure sbEditarAuxiliosClick(Sender: TObject);
    procedure sbAgregarAuxiliosClick(Sender: TObject);
    procedure sbEliminarAuxiliosClick(Sender: TObject);
    procedure dbMotivosExit(Sender: TObject);
    procedure dbMotivosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qViaticoResumenAfterOpen(DataSet: TDataSet);
    procedure qAuxilioResumenAfterOpen(DataSet: TDataSet);
    procedure LiquidacindeAuxilios1Click(Sender: TObject);
    procedure qrcAuxilioGrupoAddReports(Sender: TObject);
    procedure sbFechaInicialClick(Sender: TObject);
    procedure sbFechaFinClick(Sender: TObject);
    procedure CopiarAuxiliosClick(Sender: TObject);
    procedure PegarAuxiliosClick(Sender: TObject);
    procedure CopiarViaticosClick(Sender: TObject);
    procedure PegarViaticosClick(Sender: TObject);
    procedure qODTFECHAFINALValidate(Sender: TField);
    procedure qODTFECHAINICIOValidate(Sender: TField);
    procedure qODTCODIGOMUNICIPIOValidate(Sender: TField);
    procedure qODTCODIGOZONAORIGENValidate(Sender: TField);
    procedure qODTCODIGOODTTIPOMANOOBRAValidate(Sender: TField);
    procedure qODTCODIGOCONTRATISTAValidate(Sender: TField);
    procedure FormDestroy(Sender: TObject);
    procedure EditarViaticos1Click(Sender: TObject);
    procedure AgregarViaticos1Click(Sender: TObject);
    procedure EditarAnticipo1Click(Sender: TObject);
    procedure AgregarAnticipo1Click(Sender: TObject);
    procedure qODTCODIGOAREAINFLUENCIAValidate(Sender: TField);
    procedure PartePosteriorFormatoAnteriorClick(Sender: TObject);
    procedure ValeMateriales1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure qrcMaterialesAddReports(Sender: TObject);
    procedure qODTFECHAAPROBACIONValidate(Sender: TField);
    procedure qODTFECHAASIGNACIONValidate(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure sbImprimirAuxiliosClick(Sender: TObject);
    procedure ImprimirViatico1Click(Sender: TObject);
    procedure sbVerViaticoClick(Sender: TObject);
    procedure qrcAuxilioIndividualAddReports(Sender: TObject);
    procedure qODTCODIGOTIPOTURNOChange(Sender: TField);
    procedure qDescripcionTurnoCalcFields(DataSet: TDataSet);
    procedure OdtPadreAPClick(Sender: TObject);
    procedure HojaMaterialesAPClick(Sender: TObject);
    procedure RegistrodeOperacionesAPClick(Sender: TObject);
    procedure qODTCODIGOLABORChange(Sender: TField);
    procedure qODTLaborDetalleAfterPost(DataSet: TDataSet);
    procedure dbGridDetalleLaborColEnter(Sender: TObject);
    procedure dbGridDetalleLaborDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbGridDetalleLaborKeyPress(Sender: TObject; var Key: Char);
    procedure qContratistaAfterOpen(DataSet: TDataSet);
    procedure qContratoBeforeOpen(DataSet: TDataSet);
    procedure Visitas1Click(Sender: TObject);
    procedure qContratistaAfterScroll(DataSet: TDataSet);
    procedure qContratistaBeforeOpen(DataSet: TDataSet);
    procedure qPresManoAfterOpen(DataSet: TDataSet);
    procedure sbVerAuxiliosClick(Sender: TObject);
    procedure sbVerExtrasClick(Sender: TObject);
    procedure qODTCODIGOZONAORIGENChange(Sender: TField);
    procedure bbtnAuditoriaClick(Sender: TObject);
    procedure qODTCODIGOTIPOTAREAValidate(Sender: TField);
    procedure qODTCODIGOMODOODTValidate(Sender: TField);
    procedure qPresmateCalcFields(DataSet: TDataSet);
    procedure sbCigMunicipioClick(Sender: TObject);
    procedure dbeCIAKeyPress(Sender: TObject; var Key: Char);
    procedure qODTFECHAINICIOChange(Sender: TField);
    procedure qODTFECHAASIGNACIONChange(Sender: TField);
    procedure qODTCODIGOAREAINFLUENCIAChange(Sender: TField);
    procedure qODTAfterOpen(DataSet: TDataSet);
    procedure qODTHijaFECHAFINALTRABAJOChange(Sender: TField);
    procedure sbFechaFinEstimadaClick(Sender: TObject);
    procedure AgregarGastosComision1Click(Sender: TObject);
    procedure qODTFECHAFINALESTIMADAValidate(Sender: TField);
    procedure EditarViaticoConciliacion1Click(Sender: TObject);
    procedure dbEdFechaFinChange(Sender: TObject);
    procedure Viatico1Click(Sender: TObject);
    procedure Conciliacion1Click(Sender: TObject);
    procedure OtrosGastos1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure qODTCODIGOMUNICIPIOORIGENValidate(Sender: TField);
    procedure DBGridViaticosDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure BitBtn1Click(Sender: TObject);
    procedure qViaticoResumenAfterScroll(DataSet: TDataSet);
    procedure qODTNewRecord(DataSet: TDataSet);
    procedure dbcbAsociaReportesClick(Sender: TObject);
    procedure qODTASOCIARREPORTESDANOChange(Sender: TField);
    procedure BitBtn2Click(Sender: TObject);
  private
    old_areainfluencia, dblinkOW:string;
    Terminada: boolean;
    slArbol:TStringList;
    fechaservidoractual:tdatetime;
    bCambioASOCIARRPORTEDANO : Boolean;
    procedure ActualizaInventario(aOdt,aConsecutivo: string);
    function FechaServidorCad: string;
    function FechaServidor: tdatetime;
    procedure DepuracionRegistrosErroneos;
    function ValidarAnticiposSinLegalizar:boolean;
    function ValidarExistenciaExtras:boolean;
    function ValidarExistenciaViaticos:boolean;
    function ValidarExistenciaAuxilios:boolean;
    procedure VisualizarExtras(ver:boolean);
    procedure VisualizarViaticosAuxilios(ver:boolean);
    procedure VisualizarModoOdt(modo:integer);
    function VERIFICARODTPERMISOSEDITAR(PERMISO:string): Boolean;
    function booltostr(A: boolean):string;
    function GetODTS_SinConciliacionDeViaticos(CodigoEmpleado: String; var ODTS:String):Boolean;

  public
    { Public declarations }
    bLimpiarFECHAFINVIATICO: Boolean;
    anticiposimpresos: string;
    EstadoOdt1,CambioFechaFinal, odtabierta: boolean;
    listaforms:tlist;
    bDatosIncompletos, bCancelando: Boolean;
    CodigoODTSobreTiempo,CodigoODTViatico,CodigoODTAuxilio,sFecha, Fecha:string;
    Tecla: Word;
    sManoObraOdt:string;
    function GetFecha(Tipo:Boolean): String;
    function  EditarODT:Integer;
    function  GenerarImpreso:string;
    procedure CrearTablasTemporalesSobreTiempo;
    procedure PoblarTablasTemporalesSobreTiempo;
    procedure EscribirTablasTemporalesSobreTiempo;
    procedure CrearTablasTemporalesViaticos;
    procedure PoblarTablasTemporalesViaticos;
    procedure EscribirTablasTemporalesViaticos;
    procedure CrearTablasTemporalesAuxilio;
    procedure PoblarTablasTemporalesAuxilio;
    procedure EscribirTablasTemporalesAuxilio;
    procedure LiquidacionCuentasCobro;
    procedure GuardarTransaccion;
    function ValidarHijasTerminadas:boolean;
    Function ValidarViaticosEmpleado:boolean;
    Function GastosComisionEmpleado:boolean;
    Function ValidarConciliacion(ValidarEmpleado:Boolean;CodEmpleado:string):Boolean;
    Function ValidarImpresionViatico:boolean;
    Function ValidarImpresionGastosComision:boolean;
    procedure ImprimirViaticos(tipo: Integer);
    function TieneConciliacionesCeroPesosODT():Boolean;
    function TieneViaticosSinConciliacionEmpleado: Boolean;
    function CrearODTHijaComercial(codigoCuenta:String): Boolean;
  end;

var
  fODTPadre: TfODTPadre;
  fQRAuxilioCopia:TfQRAuxilio;
  fQRAuxilioIndividualCopia:TfQRAuxilioIndividual;

implementation

uses uBuscarEmpleado, uFormaFecha, ConsDll, uFiltroEmpleado,
  uQRODTPadreAdc2, uQRListaReporteODT, uQRMaterialesODT,
  uODTDetalleHorasExtras, uPreviewQuickReport, uFuncionSGD, uViatico,
  uAuxilio, uBuscarEmpleadoContratista, uAnticipoViatico, uQRODTPadreAtras,
  uQROdtValeMateriales, uQRODTPadreMateriales, uQRODTPadreAP, uQRODTTrabajosAP,
  uQRODTPadreAtrasAP,uComunesAdministrativo, UQRVisitas, uODTGastosComision,
  uViaticoConciliacion, ProcesarAsignaciones, ComObj, uFIMPAdministrativo, uFormaEspere;

{$R *.DFM}
//***************************************************************************
//       Formatea fecha mm/dd/yyyy
//***************************************************************************
function FormatoFecha(aFecha:TField; Hora:Boolean = False):string;
begin
  if not Hora then
    Result:=FormatDateTime('mm/dd/yyyy',aFecha.AsDateTime)
  else
    Result:=FormatDateTime('mm/dd/yyyy hh:mm:ss',aFecha.AsDateTime);
end;

procedure TfODTPadre.dbGridDetalleLaborKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = Chr(9)) then Exit;

  if (dbGridDetalleLabor.SelectedField.FieldName = DBCheckBox1.DataField) then
  begin
    dbGridDetalleLabor.SetFocus;
    SendMessage(dbGridDetalleLabor.Handle, WM_Char, word(Key), 0);
  end;
end;

//***************************************************************************
//       Envía al menú de agregar viáticos
//***************************************************************************
procedure TfODTPadre.sbAgregarViaticosClick(Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel11.ClientToScreen(Classes.Point(sbAgregarViaticos.Left, sbAgregarViaticos.top));
  pmAgregarViaticos.Popup(punto.x+10, punto.y+10);
end;
//***************************************************************************
//       Elimina viáticos de un empleado en las tablas
//           ODTVIATICO Y ODTVIATICODETALLE
//***************************************************************************
procedure TfODTPadre.sbEliminarViaticosClick(Sender: TObject);
var Query: TQuery;
begin
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  if qViaticoCODIGOVIATICO.AsString <> '' then
  begin
    if Application.MessageBox('Esta seguro de eliminar este registro? ','Advertencia!', mb_yesNoCancel)=mrYes then
    begin
      if not validarHijasTerminadas then //Borrar Viatico
      begin
        if ValidarImpresionViatico then
          raise exception.Create('No se puede eliminar el registro, ya se ha generado la impresión');
        Query.sql.Clear;
        Query.SQL.Add('DELETE FROM ODTVIATICODETALLE WHERE CODIGOVIATICO = ' + qViaticoresumenCODIGOVIATICO.AsString);
        Query.SQL.Add(' AND CODIGOIMPUTACIONMANOOBRA IN(SELECT CODIGOIMPUTACIONMANOOBRA FROM IMPUTACIONMANOOBRA '+
                        ' WHERE CODIGOTIPOIMPUTACIONODT=''V'' AND CODIGOSUBTIPOIMPUTACIONODT=''VIA'')');
        Query.ExecSQL;
        Query.SQL.Clear;
        Query.SQL.Add('DELETE FROM ODTVIATICOESCALA WHERE CODIGOVIATICO = ' + qViaticoresumenCODIGOVIATICO.AsString);
        Query.ExecSQL;
        Query.SQL.Clear;
        Query.SQL.Add('DELETE FROM ODTVIATICO WHERE CODIGOVIATICO = ' + qViaticoresumenCODIGOVIATICO.AsString);
        Query.ExecSQL;
      end
      else
      begin
        if ValidarImpresionViatico then
          raise exception.Create('No se puede eliminar el registro, ya se ha generado la impresión');
          
        if ValidarImpresionGastosComision then
          raise exception.Create('No se puede eliminar el registro, ya se ha generado la impresión');

        Query.sql.Clear;
        Query.SQL.Add('DELETE FROM ODTVIATICODETALLE WHERE CODIGOVIATICO = ' + qViaticoresumenCODIGOVIATICO.AsString);
        Query.SQL.Add(' AND CODIGOIMPUTACIONMANOOBRA IN(SELECT CODIGOIMPUTACIONMANOOBRA FROM IMPUTACIONMANOOBRA '+
                        ' WHERE CODIGOTIPOIMPUTACIONODT=''V'' AND CODIGOSUBTIPOIMPUTACIONODT<>''VIA'')');
        Query.ExecSQL;
        Query.SQL.Clear;
        Query.SQL.Add('DELETE FROM ODTVIATICODETALLETIQUETE WHERE CODIGOVIATICO = ' + qViaticoresumenCODIGOVIATICO.AsString);
        Query.ExecSQL;

        Query.SQL.Clear;
        Query.SQL.Add('DELETE FROM ODTVIATICO WHERE CODIGOVIATICO = ' + qViaticoresumenCODIGOVIATICO.AsString);
        Query.ExecSQL;
      end;

      qViatico.Close;
      qViatico.Open;
      qViaticoResumen.Close;
      qViaticoResumen.Open;
      DBGridViaticos.Repaint;
      sbEliminarViaticos.Enabled := False;
    end;
  end;

  query.close;
  Query.Free;
{var Query: TQuery;
EstadoImpresoanticipo:string;
begin
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  if qViaticoCODIGOVIATICO.AsString <> '' then
  begin
    Query.sql.Clear;
    Query.SQL.Add('SELECT IMPRESOANTICIPO FROM ODTVIATICO WHERE CODIGOVIATICO = ' + qViaticoCODIGOVIATICO.AsString);
    Query.Open;
    EstadoImpresoanticipo:= query.fieldbyname('IMPRESOANTICIPO').ASSTRING;
    Query.close;
    If EstadoImpresoanticipo <> 'S' then
    Begin
      Query.sql.Clear;
      Query.SQL.Add('SELECT FECHAPAGOANTICIPO,FECHAPAGOVIATICO,ESTADO FROM ODTVIATICO WHERE CODIGOVIATICO = ' + qViaticoCODIGOVIATICO.AsString);
      Query.Open;
      if (Query.FieldByName('FECHAPAGOANTICIPO').Asstring<>'')or(Query.FieldByName('FECHAPAGOVIATICO').Asstring<>'')
      or(Query.FieldByName('ESTADO').Asstring='PRO') then
        raise Exception.Create('Este viático no puede ser borrado puesto que ya fue procesado por nómina');
      if Application.MessageBox('Esta seguro de eliminar este registro? ','Advertencia!', mb_yesNoCancel)=mrYes then
      begin
        Query.sql.Clear;
        Query.SQL.Add('DELETE FROM ODTVIATICODETALLE WHERE CODIGOVIATICO = ' + qViaticoCODIGOVIATICO.AsString);
        Query.ExecSQL;
        Query.SQL.Clear;
        Query.SQL.Add('DELETE FROM ODTVIATICODETALLETIQUETE WHERE CODIGOVIATICO = ' + qViaticoCODIGOVIATICO.AsString);
        Query.ExecSQL;
        Query.SQL.Clear;
        Query.SQL.Add('DELETE FROM ODTVIATICOESCALA WHERE CODIGOVIATICO = ' + qViaticoCODIGOVIATICO.AsString);
        Query.ExecSQL;
        Query.SQL.Clear;
        Query.SQL.Add('DELETE FROM ODTVIATICO WHERE CODIGOVIATICO = ' + qViaticoCODIGOVIATICO.AsString);
        Query.ExecSQL;
        qViatico.Close;
        qViatico.Open;
        qViaticoResumen.Close;
        qViaticoResumen.Open;
        DBGridViaticos.Repaint;
      end;
    end
    else
    Begin
      Application.MessageBox(PChar('Este registro no se puede Eliminar pues ya ha sido impreso el anticipo. Consulte con el administrador'),PChar('Error'),MB_OK);
    end;
  end;
  query.close;
  Query.Free;}
end;
//***************************************************************************
//       Presenta el formulario de Auxilios de Alimentación
//    para Editar las tablas ODTAUXILIO Y ODTAUXILIODETALLE
//***************************************************************************
procedure TfODTPadre.sbEditarAuxiliosClick(Sender: TObject);
var    cedula,auxilio:string;
begin

  if (qODT.State in [dsEdit,dsInsert]) and qODT.CachedUpdates then
  begin
    try
      cedula:=qPresManoCODIGOEMPLEADO.AsString;
      auxilio:=qAuxilioResumenCODIGOAUXILIO.AsString;
      qODT.Post;
      qODT.Edit;
      qPresMano.Locate('CODIGOEMPLEADO',cedula,[]);
      qAuxilioResumen.Locate('CODIGOAUXILIO',auxilio,[]);
    except
    end;
  end;
  if qPresManoCODIGOEMPLEADO.AsString <> '' then
  begin
    if (qODTCODIGOMUNICIPIO.AsString<>'') and (qODTCODIGOZONAORIGEN.AsString<>'') then
    begin
      if (qMunicipioCODIGOZONA.AsString<>qODTCODIGOZONAORIGEN.AsString)then
      begin
        //Restricción eliminada por solicitud de Rafael Medina-SanGil
        if Application.MessageBox('Esta seguro que desea ingresar un auxilio de alimentación a otra zona? ','Advertencia!', mb_yesNoCancel)<>mrYes then
          exit;
      end;
      if (qODTFECHAINICIO.AsString<>'') and (qODTFECHAFINALESTIMADA.AsString<>'') then
      begin
        FAuxilio:= TFAuxilio.Create(Application);
        try
          PoblarTablasTemporalesAuxilio;
          FAuxilio.qAuxilio.Close;
          FAuxilio.qAuxilio.ParamByName('CODIGOODT').AsString:=qPresManoCODIGOODT.AsString;
          FAuxilio.qAuxilio.ParamByName('CODIGOEMPLEADO').AsString:=qPresManoCODIGOEMPLEADO.AsString;
          FAuxilio.qAuxilio.ParamByName('CODIGOAUXILIO').AsString:=qAuxilioResumenCODIGOAUXILIO.AsString;
          FAuxilio.qAuxilio.Open;
          FAuxilio.qAuxilio.Edit;
          if (FAuxilio.ShowModal = mrOk)or not(FAuxilio.modificado) then
          begin
            qAuxilio.Close;
            qAuxilio.Open;
            qAuxilioResumen.Close;
            qAuxilioResumen.Open;
          end
          else
          begin
            EscribirTablasTemporalesAuxilio;
          end;
        finally
          FAuxilio.Free;
        end;
      end
      else
        Application.MessageBox(PChar('No se pueden editar Auxilios si no ha ingresado las fechas inicial y final de la ODT'),PChar('Error'),MB_OK);
    end
    else
      Application.MessageBox(PChar('No se pueden editar Auxilios si no ha ingresado'+ #13 + 'la zona de origen y el municipio de destino'),PChar('Error'),MB_OK);
  end
  else
    Application.MessageBox(PChar('No ha ingresado la mano de obra asociada'),PChar('Error'),MB_OK);
end;
//***************************************************************************
//       Presenta el formulario de Auxilios de Alimentación
//    para Insertar en las tablas ODTAUXILIO Y ODTAUXILIODETALLE
//***************************************************************************
procedure TfODTPadre.sbAgregarAuxiliosClick(Sender: TObject);
var Query: TQuery;
    Codigo: string;
    bm:TBookmark;
begin
  if (qODT.State in [dsEdit,dsInsert]) and qODT.CachedUpdates then
  begin
    try
      bm:=qPresMano.GetBookmark;
      qODT.Post;
      qODT.Edit;
      qPresMano.GotoBookmark(bm);
    except
    end;
  end;

  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';

  if qPresManoCODIGOEMPLEADO.AsString <> '' then
  begin
    if (qODTCODIGOMUNICIPIO.AsString<>'') and (qODTCODIGOZONAORIGEN.AsString<>'') then
    begin
      if (qMunicipioCODIGOZONA.AsString<>qODTCODIGOZONAORIGEN.AsString)then
      begin
        //Restricción eliminada por solicitud de Rafael Medina-SanGil
        if Application.MessageBox('Esta seguro que desea ingresar un auxilio de alimentación a otra zona? ','Advertencia!', mb_yesNoCancel)<>mrYes then
          exit;
      end;
      if (qODTFECHAINICIO.AsString<>'') and (qODTFECHAFINALESTIMADA.AsString<>'') and (qODTFECHAFINAL.AsString<>'') then
      begin
        FAuxilio:= TFAuxilio.Create(Application);
        try
          FAuxilio.qAuxilio.Close;
          FAuxilio.qAuxilio.ParamByName('CODIGOODT').AsString:=qPresManoCODIGOODT.AsString;
          FAuxilio.qAuxilio.ParamByName('CODIGOEMPLEADO').AsString:=qPresManoCODIGOEMPLEADO.AsString;
          FAuxilio.qAuxilio.ParamByName('CODIGOAUXILIO').AsString:='-1';
          FAuxilio.qAuxilio.Open;
          FAuxilio.qAuxilio.Insert;
          Codigo:=FAuxilio.qAuxilioCODIGOAUXILIO.AsString;
          FAuxilio.qAuxilio.FieldByName('FECHAINICIO').AsDateTime:=qODTFECHAINICIO.AsDateTime;
          FAuxilio.qAuxilio.Post;
          FAuxilio.qAuxilio.Close;
          FAuxilio.qAuxilio.ParamByName('CODIGOODT').AsString:=qPresManoCODIGOODT.AsString;
          FAuxilio.qAuxilio.ParamByName('CODIGOEMPLEADO').AsString:=qPresManoCODIGOEMPLEADO.AsString;
          FAuxilio.qAuxilio.ParamByName('CODIGOAUXILIO').AsString:=Codigo;
          FAuxilio.qAuxilio.Open;
          FAuxilio.qAuxilio.Edit;
          FAuxilio.qAuxilio.FieldByName('FECHAFIN').AsDateTime:=qODTFECHAFINAL.AsDateTime;
          Codigo := FAuxilio.qAuxilioCODIGOAUXILIO.AsString;
          if FAuxilio.ShowModal = mrOk then
          begin
            qAuxilio.Close;
            qAuxilio.Open;
            qAuxilioResumen.Close;
            qAuxilioResumen.Open;
          end
          else
          begin
            if Codigo <> '' then
            begin
              Query.SQL.Clear;
              Query.SQL.Add('DELETE FROM ODTAUXILIODETALLE WHERE CODIGOAUXILIO = ' + Codigo);
              Query.ExecSQL;
              Query.SQL.Clear;
              Query.SQL.Add('DELETE FROM ODTAUXILIO WHERE CODIGOAUXILIO = ' + Codigo);
              Query.ExecSQL;
              qAuxilio.Close;
              qAuxilio.Open;
              qAuxilioResumen.Close;
              qAuxilioResumen.Open;
            end;
          end;
        except
          on e:exception do
          begin
            try
              Query.SQL.Clear;
              Query.SQL.Add('DELETE FROM ODTAUXILIODETALLE WHERE CODIGOAUXILIO IN(SELECT CODIGOAUXILIO FROM ODTAUXILIO WHERE CODIGOODT='+qODTCODIGOODT.Asstring);
              Query.SQL.Add('AND CODIGOEMPLEADO='+qPresManoCODIGOEMPLEADO.AsString+')');
              Query.ExecSQL;
              Query.SQL.Clear;
              Query.SQL.Add('DELETE FROM ODTAUXILIO WHERE CODIGOODT='+qODTCODIGOODT.Asstring);
              Query.SQL.Add('AND CODIGOEMPLEADO='+qPresManoCODIGOEMPLEADO.AsString);
              Query.ExecSQL;
            except
              on e:exception do
              begin
                showmessage(e.message);
              end;
            end;
            showmessage(e.message);
          end;
        end;
        FAuxilio.Free;
      end
      else
      begin
        Application.MessageBox(PChar('No se pueden editar Auxilios si no ha ingresado las fechas inicial y final de la ODT'),PChar('Error'),MB_OK);
      end;
    end
    else
      Application.MessageBox(PChar('No se pueden editar Auxilios si no ha ingresado'+ #13 + 'la zona de origen y el municipio de destino'),PChar('Error'),MB_OK);
  end
  else
    Application.MessageBox(PChar('No ha ingresado la mano de obra asociada'),PChar('Error'),MB_OK);
  query.close;
  Query.Free;
end;
//***************************************************************************
//       Elimina Auxilios de Alimentación
//    de las tablas ODTAUXILIO Y ODTAUXILIODETALLE
//***************************************************************************
procedure TfODTPadre.sbEliminarAuxiliosClick(Sender: TObject);
var Query: TQuery;
begin
  inherited;
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  if qAuxilioCODIGOAUXILIO.AsString <> '' then
  begin
    Query.sql.Clear;
    Query.SQL.Add('SELECT ESTADO,IMPRESO FROM ODTAUXILIO WHERE CODIGOAUXILIO = ' + qAuxilioCODIGOAUXILIO.AsString);
    Query.Open;
    if (Query.FieldByName('ESTADO').Asstring='PRO') then
      raise Exception.Create('Este auxilio no puede ser borrado puesto que ya fue procesado por nómina');
    if (Query.FieldByName('IMPRESO').Asstring='S') then
      raise Exception.Create('Este auxilio no puede ser borrado puesto que ya fue impreso');

    if Application.MessageBox('Esta seguro de eliminar este registro? ','Advertencia!', mb_yesNoCancel)=mrYes then
    begin
      Query.sql.Clear;
      Query.SQL.Add('DELETE FROM ODTAUXILIODETALLE WHERE CODIGOAUXILIO = ' + qAuxilioResumenCODIGOAUXILIO.AsString);
      Query.ExecSQL;
      Query.SQL.Clear;
      Query.SQL.Add('DELETE FROM ODTAUXILIO WHERE CODIGOAUXILIO = ' + qAuxilioResumenCODIGOAUXILIO.AsString);
      Query.ExecSQL;
      qAuxilio.Close;
      qAuxilio.Open;
      qAuxilioResumen.Close;
      qAuxilioResumen.Open;
      DBGridAuxilios.Repaint;
    end;
  end;
  query.close;
  Query.Free;
end;

procedure TfODTPadre.dbMotivosExit(Sender: TObject);
begin
  inherited;
  if (Tecla = 13) and (dbMotivos.Lines[dbMotivos.Lines.Count] = '') then
    dbMotivos.SetFocus;
  Tecla := 0;
end;

procedure TfODTPadre.dbMotivosKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Linea: Integer;
  Texto, TextoAnterior: String;
begin
  inherited;
  Tecla := Key;
  case Key of
    13: begin
          Linea := dbMotivos.Perform(EM_LINEFROMCHAR, dbMotivos.SelStart, 0);
          if Linea <> dbMotivos.Lines.Count then
          begin
            if (Linea = 0) and (dbMotivos.CaretPos.x = 0) then
            begin
              dbMotivos.Lines.Insert(0, '');
              Exit;
            end;

            if dbMotivos.CaretPos.x = 0 then
            begin
              dbMotivos.Lines.Insert(Linea, '');
              Exit
            end else
            begin
              Texto := Copy(dbMotivos.Lines[Linea], dbMotivos.CaretPos.x + 1, Length(dbMotivos.Lines[Linea]));
              TextoAnterior := dbMotivos.Lines[Linea];
              Delete(TextoAnterior, dbMotivos.CaretPos.x + 1, Length(dbMotivos.Lines[Linea]));
              dbMotivos.Lines[Linea] := TextoAnterior;
              dbMotivos.Lines.Insert(Linea + 1, Texto);
              if Linea + 1 <> dbMotivos.Lines.Count then
                keybd_event(38, 0, 0, 0);
              Exit;
            end;

            dbMotivos.Lines.Insert(Linea + 1, '');
            if Linea + 1 <>  dbMotivos.Lines.Count then
              keybd_event(38, 0, 0, 0);
          end
          else
            dbMotivos.Lines.Add('');
        end;
  end;
end;
//***************************************************************************
//       Genera el código para impresión de la odt
//***************************************************************************
function TfODTPadre.GenerarImpreso:string;
var s1,s2:string;
    i:Integer;
begin
   Result:='';
   s1:=qODTCODIGOODT.AsString;
   s2:='';
   for i:=5 downto Length(s1) do
    s2:='0' + s2;
   Result:=s2 + s1 + '-0';
end;
//***************************************************************************
//       Realiza validaciones iniciales de campos
//   y verifica los permisos de usuario al mostrar el formulario
//***************************************************************************
procedure TfODTPadre.FormShow(Sender: TObject);
var Permiso:integer;
begin
  inherited;
  qODTCODIGOADMINISTRATIVOValidate(qODTCODIGOADMINISTRATIVO);
  qODTCODIGOAPROBADOValidate(qODTCODIGOAPROBADO);
  qODTCODIGOREVISADOValidate(qODTCODIGOREVISADO);
  qODTCODIGOEJECUTORValidate(qODTCODIGOEJECUTOR);
  qODTCODIGOODTTIPOMANOOBRAValidate(nil);
  qODTCODIGOAREAINFLUENCIAValidate(qODTCODIGOAREAINFLUENCIA);
  Notebook.ActivePage:='Generales';
  nbViaticos.ActivePage:='Editar';
  nbAuxilios.ActivePage:='Editar';  

  Caption:='Orden de Trabajo Padre No ' + qODTCODIGOODT.AsString;
  Permiso:=EditarODT;
  if qODT.State in [dsEdit] then
  begin
    if Permiso=0  then
    begin
      bbAceptar.Enabled:=False;
      bbtnAuditoria.visible:=true;
      qODT.CachedUpdates:=False;
      qODT.UpdateObject:=nil;
      if (qODTCODIGOODTTIPOMANOOBRA.asfloat = 2) then
        qcontratista.open;
      Caption:='Orden de Trabajo Padre No ' + qODTCODIGOODT.AsString + ' (Modo Solo Lectura).';
    end;
    if (permiso=2) then
    begin
      bbtnAuditoria.visible:=true;
    end;
  end;
  if (qODT.State in [dsInsert]) then
  Begin
    Caption:='Orden de Trabajo Padre No ' + qODTCODIGOODT.AsString + ' (Insertando).';
    qODTCODIGOESTADOODT.AsString:= '1';
  end;
  if (qODTCODIGOESTADOODT.AsString = '6') then //ODT Terminada
  begin
//    if Permiso<>2 then
//    begin
      Caption:=Caption +  ' **Terminada**';
      bbAceptar.Enabled:=False;
      qODT.CachedUpdates:=False;
      qODT.UpdateObject:=nil;
//    end;
    nbViaticos.ActivePage:='Ver';
    nbAuxilios.ActivePage:='Imprimir';
    LiquidacindeAuxilios1.Visible:=(not ProcManager.CanProcExecute('_Ocultar Odt Viaticos/Auxilios'))or( varcodigousuario=0);
  end
  else
  begin
    LiquidacindeAuxilios1.Visible:=false;
  end;
  VisualizarExtras(not(ProcManager.CanProcExecute('_Ocultar Odt Extras'))or( varcodigousuario=0));
  VisualizarViaticosAuxilios(not(ProcManager.CanProcExecute('_Ocultar Odt Viaticos/Auxilios'))or( varcodigousuario=0));

  CodigoODTSobreTiempo := '';
  CodigoODTViatico := '';
  CodigoODTAuxilio := '';

  qTipoTurno.close;
  qTipoTurno.open;
  qDescripcionTurno.close;
  qDescripcionTurno.open;
  sManoObraOdt:='';
  qPresMano.First;
  while not(qPresMano.eof) do
  begin
    sManoObraOdt:=qPresManoCODIGOEMPLEADO.AsString+',';
    qPresMano.Next;
  end;
  sManoObraOdt:=copy(sManoObraOdt,1,length(sManoObraOdt)-1);
  qPresMano.First;
  if qODTCODIGOESTADOODT.asinteger = 6 then
    Terminada:= true;
end;

procedure TfODTPadre.qODTCalcFields(DataSet: TDataSet);
var s1:string;
    i:Integer;
begin
  DataSet.FieldbyName('ImpresoODT').AsString:='';
  s1:=copy(qODTCODIGOODT.AsString,7,5);

  DataSet.FieldbyName('ImpresoODT').AsString:=s1 + '-0';
end;
//***************************************************************************
//      Validación de que el código administrativo exista
//   y generación de motivos por defecto para las dependencias que los manejen
//***************************************************************************
procedure TfODTPadre.qODTCODIGOADMINISTRATIVOValidate(Sender: TField);
var qDatos: TQuery;
begin
 if Sender.Text <> '' then
  begin
    if ((EditarODT = 0) and (qODT.State in [dsInsert]) and (odtabierta = true)) then  raise Exception.Create('El usuario no tiene permiso para Generar ni Editar ODT para el área.');
    qTipoTurno.close;
    qTipoTurno.open;
    qCIA.Close;
    qCIA.Params[0].AsString:=Sender.Text;
    qCIA.Open;
    if qCIA.RecordCount > 0 then
    begin
      lbCIA.Caption:=qCIA.Fields[0].AsString;
      lbCentroCosto.Caption:=qCIA.Fields[2].AsString;
      lbArea.Caption:=qCIA.Fields[3].AsString;
    end
    else
    begin
      raise Exception.Create('Este Código Administrativo No Existe.');
    end;
    if (qODT.State in [dsInsert]) then
    begin
      qDatos := TQuery.Create(Application);
      qDatos.DatabaseName := 'BaseDato';
      qDatos.SQL.Add('SELECT MOTIVOS, MOTIVOS, CODIGOPRIORIDAD, CODIGOLABOR, ');
      qDatos.SQL.Add('CODIGOSECUENCIA, CODIGOTIPOTAREA, ENERGIZADO, CODIGOTIPOMANOOBRA,');
      qDatos.SQL.Add('CODIGOMUNICIPIO,CODIGOAREAINFLUENCIA FROM ODTPLANTILLA');
      qDatos.SQL.Add('WHERE CODIGOADMINISTRATIVO = ' + Sender.Text);
      qDatos.SQL.Add('ORDER BY CONSECUTIVO');
      qDatos.Open;
      if (qODTMOTIVOS.AsString = '')  then
         qODTMOTIVOS.AsString := qDatos.fieldbyname('MOTIVOS').AsString;
      if (qODTCODIGOPRIORIDAD .AsString = '')  then
         qODTCODIGOPRIORIDAD.AsString := qDatos.fieldbyname('CODIGOPRIORIDAD').AsString;
      if (qODTCODIGOLABOR.AsString = '')  then
         qODTCODIGOLABOR.AsString := qDatos.fieldbyname('CODIGOLABOR').AsString;
      if (qODTEQUIPOENERGIZADO.AsString = '')  then
         qODTEQUIPOENERGIZADO.AsString := qDatos.fieldbyname('ENERGIZADO').AsString;
      if (qODTCODIGOTIPOTAREA.AsString = '')  then
         qODTCODIGOTIPOTAREA.AsString := qDatos.fieldbyname('CODIGOTIPOTAREA').AsString;
      if (qODTCODIGOODTTIPOMANOOBRA.AsString = '')  then
         qODTCODIGOODTTIPOMANOOBRA.AsString := qDatos.fieldbyname('CODIGOTIPOMANOOBRA').AsString;
      if (qODTCODIGOMUNICIPIO.AsString = '')  then
         qODTCODIGOMUNICIPIO.AsString := qDatos.fieldbyname('CODIGOMUNICIPIO').AsString;
      if (qODTCODIGOAREAINFLUENCIA.AsString = '')  then
         qODTCODIGOAREAINFLUENCIA.AsString := qDatos.fieldbyname('CODIGOAREAINFLUENCIA').AsString;
      qDatos.Free;
    end;
  end;

end;
//***************************************************************************
//    Despliega formulario para escoger quien aprueba la ODT
//***************************************************************************
procedure TfODTPadre.sbAprobadoClick(Sender: TObject);
var filtroaprobado:string;
begin
  if (qODTCODIGOADMINISTRATIVO.AsString <> '') then
  begin
    filtroaprobado:=' EXISTS '
     +'(SELECT NULL FROM ODTPERFILEMPLEADO P '
     +' WHERE E.CODIGOEMPLEADO=P.CODIGOEMPLEADO '
     +' AND P.APROBAR=''S'' '    
     +' AND P.CODIGOADMINISTRATIVO='+qODTCODIGOADMINISTRATIVO.AsString+')';
    fBuscarEmpleado:=TfBuscarEmpleado.Create(Application);
    try
      FFiltroEmpleado.LimpiarFiltro;
      FFiltroEmpleado.FiltroAdicional:=filtroaprobado;
      FFiltroEmpleado.tdFiltroEmpleadoCODIGOADMINISTRATIVO.AsString:=qODTCODIGOADMINISTRATIVO.AsString;
      FFiltroEmpleado.BitBtnFiltrarClick(nil);
      fBuscarEmpleado.filtrar(false);

      if fBuscarEmpleado.ShowModal=MrOK then
      begin
        dsODT.DataSet.FieldByName('CODIGOAPROBADO').AsString:=fBuscarEmpleado.qListaEmpleado.FieldByName('CODIGOEMPLEADO').AsString;
      end;
    finally
     fBuscarEmpleado.Free;
     fBuscarEmpleado:=nil;
    end;
  end
  else
    raise exception.create('Debe seleccionar primero el Código Administrativo del Área que Genera la Odt.');
end;
//***************************************************************************
//    Despliega formulario para escoger quien revisa la ODT
//***************************************************************************
procedure TfODTPadre.sbRevisadoClick(Sender: TObject);
var filtroaprobado:string;
begin
  if (qODTCODIGOADMINISTRATIVO.AsString <> '') then
  begin
    filtroaprobado:=' EXISTS '
     +'(SELECT NULL FROM ODTPERFILEMPLEADO P '
     +' WHERE E.CODIGOEMPLEADO=P.CODIGOEMPLEADO '
     +' AND P.REVISAR=''S'' '    
     +' AND P.CODIGOADMINISTRATIVO='+qODTCODIGOADMINISTRATIVO.AsString+')';
    fBuscarEmpleado:=TfBuscarEmpleado.Create(Application);
    try
      FFiltroEmpleado.LimpiarFiltro;
      FFiltroEmpleado.FiltroAdicional:=filtroaprobado;
      FFiltroEmpleado.tdFiltroEmpleadoCODIGOADMINISTRATIVO.AsString:=qODTCODIGOADMINISTRATIVO.AsString;
      FFiltroEmpleado.BitBtnFiltrarClick(nil);
      fBuscarEmpleado.filtrar(false);

      if fBuscarEmpleado.ShowModal=MrOK then
      begin
        dsODT.DataSet.FieldByName('CODIGOREVISADO').AsString:=fBuscarEmpleado.qListaEmpleado.FieldByName('CODIGOEMPLEADO').AsString;
      end;
    finally
     fBuscarEmpleado.Free;
     fBuscarEmpleado:=nil;
    end;
  end
  else
    raise exception.create('Debe seleccionar primero el Código Administrativo del Área que Genera la Odt.');
end;

procedure TfODTPadre.qODTCODIGOAPROBADOValidate(Sender: TField);
begin
  if (Sender.Text <> '') then
  begin
     qEmpleado.Close;
     qEmpleado.Params[0].AsString:=Sender.Text;
     qEmpleado.Open;
     if qEmpleado.RecordCount > 0 then
        EdAprueba.Text:=qEmpleado.Fields[0].AsString
     else
        raise Exception.Create('Este Empleado No Existe.');
  end;
end;

procedure TfODTPadre.qODTCODIGOREVISADOValidate(Sender: TField);
begin
  if (Sender.Text <> '') then
  begin
     qEmpleado.Close;
     qEmpleado.Params[0].AsString:=Sender.Text;
     qEmpleado.Open;
     if qEmpleado.RecordCount > 0 then
        EdRevisado.Text:=qEmpleado.Fields[0].AsString
     else
        raise Exception.Create('Este Empleado No Existe.');
  end;
end;

procedure TfODTPadre.EdApruebaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F3 : sbAprobadoClick(nil);
  end;
end;

procedure TfODTPadre.EdRevisadoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F3 : sbRevisadoClick(nil);
  end;
end;

procedure TfODTPadre.dMenuCIASelectID(Sender: tnMenuItem; ID: Integer;
  MenuEstructura: tMenuEs);
begin
  inherited;
  qODT.FieldByName('CODIGOADMINISTRATIVO').AsInteger:=ID;
end;

procedure TfODTPadre.bbAceptarClick(Sender: TObject);
begin
  bDatosIncompletos := False;
  try
    if (qODTMOTIVOS.AsString='') then raise exception.create('Debe ingresar los motivos de la Orden de Trabajo.');
    if (qODTCODIGOADMINISTRATIVO.AsString='') then raise exception.create('Debe ingresar la CIA.');
    if (qODTCODIGOODTTIPOMANOOBRA.AsString='') then raise exception.create('Debe ingresar el tipo de mano de obra.');
    if (qODTCODIGOPRIORIDAD.AsString='') then raise exception.create('Debe ingresar la prioridad.');
    if ((qODTCODIGOMUNICIPIOORIGEN.AsString='') and (qODTCODIGOMODOODT.AsInteger <> 3)) then
      raise exception.create('Debe ingresar El municipio Origen.');
    if qReporte.active then qReporte.Close;
    if qPresMano.active then qPresMano.Close;
    if qPresMate.active then  qPresMate.Close;

    if (CambioFechaFinal) and (qODTCODIGOESTADOODT.asinteger<>6)then
    begin
      if Application.MessageBox('Desea Finalizar la ODT? ','Confirmación!', mb_yesNoCancel)=mrYes then
      begin
        qODTCODIGOESTADOODT.asinteger := 6;
      end;
    end;

    if bCambioASOCIARRPORTEDANO then
      raise Exception.Create('La casilla de verificación "Asocia Reportes de Daños" no se puede cambiar porque tiene ODT Hijas asociadas.');

    if (qODTASOCIARREPORTESDANO.AsString = 'T') and (qODTCODIGOCOORDINACIONGRUPOTRABAJO.AsString = '') then
    begin
      dbeCoordinador.SetFocus;
      raise Exception.Create('Debe seleccionar el Coordinador de Cuadrillas.');
    end;

    qODT.Post;

    IF qODTCODIGOESTADOODT.Asstring = '6' then
      LiquidacionCuentasCobro;
    if qODT.UpdatesPending then
      qODT.ApplyUpdates;

    qReporte.Open;
    qPresMano.Open;
    qPresMate.close;    
    qPresMate.Open;

    Close;
    ModalResult:=MrOk;
  except
    on E:Exception do
    begin
      ShowMessage(E.Message);
      bDatosIncompletos := True;
      if bCambioASOCIARRPORTEDANO then
        bDatosIncompletos := False;
      qODT.Edit;
      ModalResult:=MrCancel;
      qReporte.Open;
      qPresMano.Open;
      qPresMate.Open;
      Close;
    end;
  end;
end;

procedure TfODTPadre.bbCancelarClick(Sender: TObject);
var
  qConsultaViatico:tquery;
begin
  if Application.MessageBox(PChar('Perderá los cambios realizados. Esta seguro de Cancelar?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
  begin
    try
      if (qODTCODIGOODT.AsString<>'') then
      begin
        qConsultaViatico := TQuery.Create(Application);
        qConsultaViatico.DatabaseName := 'BaseDato';
        qConsultaViatico.sql.add('SELECT CODIGOVIATICO FROM ODTVIATICO WHERE IMPRESOANTICIPO = ''S'' AND CODIGOODT = ' + qODTCODIGOODT.AsString);
        //qConsultaViatico.sql.SAVETOFILE('C:\CODIGOSDEVIATICOS.TXT');
        qConsultaViatico.open;
        if qConsultaViatico.RecordCount >0 then
        Begin
          qConsultaViatico.first;
          while  not qConsultaViatico.eof do
          Begin
            anticiposimpresos:= anticiposimpresos + qConsultaViatico.fieldbyname('CODIGOVIATICO').asstring + ',';
            qConsultaViatico.next;
          end;
        end;
        qConsultaViatico.free;
      end;
      qODT.Cancel;
      if qODT.UpdatesPending then
        qODT.CancelUpdates;
    finally
      bDatosIncompletos := True;
      bCancelando := True;
      Close;
    end;
  end
  else
  begin
    ModalResult := 0;
    bDatosIncompletos := False;
  end;
end;

procedure TfODTPadre.FormClose(Sender: TObject; var Action: TCloseAction);
var i:integer;
begin
  Action:=CaHide;
  if not bCancelando then
  begin
    if bDatosIncompletos then
    begin
      if Application.MessageBox(PChar('Hay datos incompletos. Desea completar los datos?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
      begin
        ModalResult := 0;
        bDatosIncompletos := false;
        Action:=caNone;
      end
      else
      begin
        qODT.Cancel;
        qODT.CancelUpdates;
        Action:=caHide;
      end;
    end
    else
      if ModalResult <> MrCancel then
      begin
        ModalResult := mrOK;
        Action:=caHide;
      end;
    end;
    if ModalResult=2 then
    begin
      try
        qODT.Cancel;
        qODT.CancelUpdates;
        Action:=caHide;
      except
      end;
    end;
  if (Action=caHide) then
  begin
    try
      for i:=0 to ComponentCount - 1 do
      begin
        if (Components[i] is TQuery) then
        begin
         if ((TQuery(Components[i])).Active) and (((TQuery(Components[i])).Name)<>'qODT') then
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
//***************************************************************************
//    Navegación por los items de la ODT padre
//***************************************************************************
procedure TfODTPadre.ArbolChange(Sender: TObject; Node: TTreeNode);
begin
  if Node.Text='Generales' then
    Notebook.PageIndex:=0
    else if Node.Text='Reportes' then
      Notebook.PageIndex:=1
      else if Node.Text='Mano Obra' then
        Notebook.PageIndex:=2
        else if Node.Text='Materiales' then
          Notebook.PageIndex:=3
            else if Node.Text='Otros' then
              Notebook.PageIndex:=4
end;

procedure TfODTPadre.qReporteCalcFields(DataSet: TDataSet);
var qDatos:TQuery;
    Direccion:string;
begin
  Direccion:='';
  qDatos:=TQuery.Create(Application);
  qDatos.DatabaseName:='BaseDato';
  if dsReporte.DataSet.FieldByName('CODIGOTIPOVIA').AsString <> '' then
  begin
    qDatos.Close;
    qDatos.SQL.Text:='SELECT ABREVIATURA FROM DIR_TIPOVIA WHERE CODIGOTIPOVIA = ' +
                     dsReporte.DataSet.FieldByName('CODIGOTIPOVIA').AsString;
    qDatos.Open;
    Direccion:=Direccion + qDatos.Fields[0].AsString;
  end;
  if dsReporte.DataSet.FieldByName('CODIGONOMBREVIA').AsString <> '' then
  begin
    qDatos.Close;
    qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                     dsReporte.DataSet.FieldByName('CODIGONOMBREVIA').AsString;
    qDatos.Open;
    Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
  end;
  Direccion:=Direccion + dsReporte.DataSet.FieldByName('MODIFICADORVIA').AsString;

  if dsReporte.DataSet.FieldByName('DUPLICADOR').AsString <> '' then
  begin
    qDatos.Close;
    qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                     dsReporte.DataSet.FieldByName('DUPLICADOR').AsString;
    qDatos.Open;
    Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
  end;
  Direccion:=Direccion + dsReporte.DataSet.FieldByName('MODIFICADORDUPLICADOR').AsString +
             ' ' + dsReporte.DataSet.FieldByName('NUMEROPUERTA').AsString;

  DataSet.FieldByName('DIRECCIONCALCULADA').AsString:=Direccion;
  qDatos.Free;
end;

procedure TfODTPadre.DBGridMaterialDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
   iRowNumber : Integer;
begin
  with (Sender as TDBGrid), Canvas do
  begin
    iRowNumber := qPresMateCONSECUTIVO.AsInteger mod 3;
       if iRowNumber = 0 then
         Brush.Color := clWhite
         else if iRowNumber = 1 then
           Brush.Color := $00FFEDE6
           else Brush.Color:=clAqua;
    if (gdFocused in State) then
      Font.Color := clBlack;

    FillRect(Rect);
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;

end;

function TfODTPadre.GetFecha(Tipo:Boolean): String;
begin
  fFormaFecha := TfFormaFecha.Create(Application);
  uFormaFecha.sFecha := sFecha;
  fFormaFecha.height:=291;
  if FFormaFecha.ShowModal = mrOk then
    if Tipo then
       Result := DateTimetoStr(FFormaFecha.Date+FFormaFecha.fTime)
    else
       Result := DateTimetoStr(FFormaFecha.Date)
  else Result := sFecha;
  fFormaFecha.Free;
end;
//***************************************************************************
//    Despliega formulario para seleccionar fecha emisión ODT
//***************************************************************************
procedure TfODTPadre.sbFechaEmisionClick(Sender: TObject);
begin
  dbeFechaEmision.Setfocus;
  sFecha := dbeFechaEmision.Text;
  Fecha := GetFecha(true);
  if Fecha <> '' then dbeFechaEmision.Text := Fecha;
end;

procedure TfODTPadre.dbeFechaEmisionKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F3 : sbFechaEmisionClick(nil);
  end;
end;
//***************************************************************************
//    Despliega formulario para seleccionar fecha aprobación ODT
//***************************************************************************
procedure TfODTPadre.sbFechaAprobacionClick(Sender: TObject);
begin
  try
    dbeFechaAprobacion.Setfocus;
    //sFecha := dbeFechaAprobacion.Text;
    sFecha :=qODTFECHAAPROBACION.asstring;
    if sFecha = '' then
      sFecha := FechaServidorCad;
    Fecha := GetFecha(False);
    if Fecha <> '' then dbeFechaAprobacion.Text := Fecha;
  except
  end;

end;

procedure TfODTPadre.dbeFechaAprobacionKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F3 : sbFechaAprobacionClick(nil);
  end;
end;
//***************************************************************************
//    Despliega formulario para seleccionar fecha asignación ODT
//***************************************************************************
procedure TfODTPadre.sbFechaAsignacionClick(Sender: TObject);
begin
  inherited;
  try
    dbeFechaAsignacion.Setfocus;
    sFecha :=qODTFECHAASIGNACION.asstring;
    if sFecha = '' then
      sFecha := FechaServidorCad;
    Fecha := GetFecha(True);
    if Fecha <> '' then dbeFechaAsignacion.Text := Fecha;
  except
  end;
end;

procedure TfODTPadre.dbeFechaAsignacionKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F3 : sbFechaAsignacionClick(nil);
  end;
end;
//***************************************************************************
//    Al registrar una ODT genera estos valores por defecto
//***************************************************************************
procedure TfODTPadre.qODTAfterInsert(DataSet: TDataSet);
begin
  qEstadoOdt.First;
  qTipoManoObra.First;
  with DataSet do
  begin
//    FieldByName('CODIGOPRIORIDAD').AsString       := qPrioridad.FieldByName('CODIGOPRIORIDAD').AsString;
//    FieldByName('CODIGOLABOR').AsString           := qLabor.FieldByName('CODIGOLABOR').AsString;
//    FieldByName('CODIGOTIPOTAREA').AsString       := qTipoTarea.FieldByName('CODIGOTIPOTAREA').AsString;
    FieldByName('CODIGOESTADOODT').AsString       := qEstadoOdt.FieldByName('CODIGOESTADOODT').AsString;
//    FieldByName('CODIGOODTTIPOMANOOBRA').AsString := qTipoManoObra.FieldByName('CODIGOODTTIPOMANOOBRA').AsString;
    FieldByName('FECHAEMISION').AsDateTime        := FechaServidor;
    FieldByName('COSTOMATERIAL').AsFloat          :=0;
    FieldByName('COSTOTRANSPORTE').AsFloat        :=0;
    FieldByName('COSTOMANOOBRA').AsFloat          :=0;
    FieldByName('COSTOEQUIPO').AsFloat            :=0;
//    FieldByName('EQUIPOENERGIZADO').AsString      :='S';
    if (UpperCase(nombreAplicativo)='ENERGISAP')then
      FieldByName('CODIGOMODOODT').AsInteger      :=2
    else
      FieldByName('CODIGOMODOODT').AsInteger      :=1;
  end;
end;
//***************************************************************************
//    Despliega formulario para seleccionar quien ejecuta la ODT (Jefe de Cuadrilla)
//***************************************************************************
procedure TfODTPadre.sbEjecutadoClick(Sender: TObject);
begin
  if qODTCODIGOODTTIPOMANOOBRA.AsInteger<>2 then
  begin
    fBuscarEmpleado:=TfBuscarEmpleado.Create(Application);
    if qODTCODIGOADMINISTRATIVO.AsString <> '' then
    begin
      FFiltroEmpleado.LimpiarFiltro;
      FFiltroEmpleado.tdFiltroEmpleadoCODIGOADMINISTRATIVO.AsString:=qODTCODIGOADMINISTRATIVO.AsString;
      FFiltroEmpleado.BitBtnFiltrarClick(nil);
      fBuscarEmpleado.filtrar(false);
    end;
    try
    if fBuscarEmpleado.ShowModal=MrOK then
    begin
      dsODT.DataSet.FieldByName('CODIGOEJECUTOR').AsString:=fBuscarEmpleado.qListaEmpleado.FieldByName('CODIGOEMPLEADO').AsString;
    end;
    finally
     fBuscarEmpleado.Free;
     fBuscarEmpleado:=nil;
    end;
    end
  else
  begin
    if qODTCODIGOCONTRATISTA.AsString <> '' then
    begin
      fBuscarEmpleadoContratista := TfBuscarEmpleadoContratista.Create(Application);
      fBuscarEmpleadoContratista.qEmpleadoContratista.Close;
      fBuscarEmpleadoContratista.qEmpleadoContratista.DataSource := dsOdt;
      fBuscarEmpleadoContratista.qEmpleadoContratista.Open;
      fBuscarEmpleadoContratista.dbgEmpleadoContratista.MultiSelect := False;
      try
        if fBuscarEmpleadoContratista.ShowModal = mrOK then
        begin
          dsODT.DataSet.FieldByName('CODIGOEJECUTOR').AsString := fBuscarEmpleadoContratista.qEmpleadoContratista.FieldByName('CODIGOEMPLEADO').AsString;
          EdEjecutado.Text := fBuscarEmpleadoContratista.qEmpleadoContratista.FieldByName('NOMBREEMPLEADO').AsString;
        end;
      finally
        fBuscarEmpleadoContratista.Free;
        fBuscarEmpleadoContratista := nil;
      end;
    end
    else
      Application.MessageBox('Debe asignar el contratista antes de asignar el ejecutor','Error',MB_OK+MB_ICONEXCLAMATION);
  end;
end;

procedure TfODTPadre.EdEjecutadoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F3 : sbEjecutadoClick(nil);
  end;
end;

procedure TfODTPadre.qODTCODIGOEJECUTORValidate(Sender: TField);
begin
  if (Sender.Text <> '') then
  begin
     qEmpleado.Close;
     qEmpleado.Params[0].AsString:=Sender.Text;
     qEmpleado.Open;
     if qEmpleado.RecordCount > 0 then
        EdEjecutado.Text:=qEmpleado.Fields[0].AsString
     else
        raise Exception.Create('Este Empleado No Existe.');
  end;
end;
//***************************************************************************
//    Permisos de Edición de una ODT
//    0: No puede editar
//    1: Puede editar
//    2: Puede editar aún después de terminada
//***************************************************************************
function TfODTPadre.EditarODT: Integer;
var qDatos:TQuery;
begin
  Result:=0;
  ConsDll.RefrescarVariables;
  if VarCodigoUsuario = 0 then //Es Admin ?
  begin
    Result:=2;
    Exit;
  end;
  qDatos:=TQuery.Create(Application);
  try
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Add('SELECT EDITAR,REABRIR FROM ODTPERMISOS WHERE NOMBRETABLA = ''ODT''');
    qDatos.SQL.Add('AND CODIGOUSUARIO = ' + IntToStr(VarCodigoUsuario));
    if qODTCODIGOADMINISTRATIVO.AsString<>'' then
      qDatos.SQL.Add('AND CODIGOADMINISTRATIVO = ' + qODTCODIGOADMINISTRATIVO.AsString);
    qDatos.Open;
    if qDatos.Fields[0].AsString = 'S' then
      Result:=1;
    if qDatos.Fields[1].AsString = 'S' then
      Result:=2;
  finally
    qDatos.Free;
  end;
end;
//***************************************************************************
//    Despliega el menú de impresión ODT Padre
//***************************************************************************
procedure TfODTPadre.bbImprimirClick(Sender: TObject);
var punto:TPoint;
begin
 punto:=pInferior.ClientToScreen(Classes.Point(bbImprimir.Left, bbImprimir.top));
 pmImprimir.Popup(punto.x+10, punto.y+10);
end;

procedure TfODTPadre.qODTAfterPost(DataSet: TDataSet);
begin
  qODT.ApplyUpdates;
  qODT.CommitUpdates;
end;
//***************************************************************************
//   Imprime Primera Hoja (Principal ) ODT Padre
//***************************************************************************
procedure TfODTPadre.ParteAnterior1Click(Sender: TObject);
// Consulta vehiculos asociados a la odt
function VehiculosAsociados:string;
var qTemp:TQuery;
    ListaTemp:TStringList;
    I,J:Integer;
begin
  qTemp:=TQuery.Create(Application);
  ListaTemp:=TStringList.Create;
  ListaTemp.Duplicates:=dupIgnore;
  ListaTemp.Sorted:=True;

  try
    qTemp.DatabaseName:='BaseDato';
    qTemp.SQL.Text:='SELECT DISTINCT CODIGOVEHICULO FROM ODTVEHICULO WHERE CODIGOODT='+qODTCODIGOODT.AsString;
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

// Consulta grupos de trabajo asociados a la odt
function GrupoTrabajo:string;
var  qTemp:TQuery;
begin
  qTemp := TQuery.Create(Application);
  try
    Result:='';
    if qODTCODIGOODTTIPOMANOOBRA.AsString='1' then
    begin
      qTemp.DatabaseName := 'BaseDato';
      qTemp.SQL.Add('SELECT DISTINCT G.NOMBREGRUPOTRABAJO FROM ODTDIA D, GRUPOTRABAJO G');
      qTemp.SQL.Add('WHERE G.CODIGOGRUPOTRABAJO = D.CODIGOGRUPOTRABAJO');
      qTemp.SQL.Add('AND   D.CODIGOODT = ' + qODTCODIGOODT.AsString);
      qTemp.SQL.Add('AND   G.CODIGOADMINISTRATIVO = ' + qODTCODIGOADMINISTRATIVO.AsString);
      qTemp.Open;
      while not qTemp.Eof do
      begin
        Result:=Result + qTemp.Fields[0].AsString;
        qTemp.Next;
        if not qTemp.Eof then
          Result:=Result + ',';
      end;
    end
    else
    begin
      qTemp := TQuery.Create(Application);
      qTemp.DatabaseName := 'BaseDato';
      qTemp.SQL.Add('SELECT NOMBRECONTRATISTA FROM CONTRATISTA C, ODT O');
      qTemp.SQL.Add('WHERE O.CODIGOCONTRATISTA=C.CODIGOCONTRATISTA');
      qTemp.SQL.Add('AND O.CODIGOODT=' + qODTCODIGOODT.AsString);
      qTemp.Open;
      Result:=qTemp.Fields[0].AsString;
    end;
  finally
    qTemp.Free;
  end;
end;
//Fin funcion

// Valores por defecto de qrlabels generados dinámicamente
procedure AjustarQRLabel(var qrLabel:TQRLabel);
begin
  qrLabel.AutoSize := False;
  qrLabel.WordWrap := False;
  qrLabel.Height := 16;
  qrLabel.Font.Size := 7;
  qrLabel.Font.Name := 'Arial';
  qrLabel.Alignment:= taLeftJustify;
end;

var qDatos:TQuery;
    qrLabel:TQRLabel;
    I:Integer;
begin
  fQRODTPadre:= TfQRODTPadre.Create(Application);
  try
    if (qODT.State in [dsEdit,dsInsert]) and qODT.CachedUpdates then
    begin
      qODT.Post;
      qODT.Edit;
    end;
    with fQRODTPadre do
    begin
      qODTPadre.Close;
      qODTPadre.Params[0].AsString:=qODTCODIGOODT.AsString;
      qODTPadre.Open;

      qFechaInicio.Close;
      qFechaInicio.Params[0].AsString:=qODTCODIGOODT.AsString;
      qFechaInicio.Open;

      qFechaFinal.Close;
      qFechaFinal.Params[0].AsString:=qODTCODIGOODT.AsString;
      qFechaFinal.Open;

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
      qrlMoviles.Caption:='';
      qrlContratista.Caption:='';
      //qrlEmergencia.Caption:='';
      qrlOpSubestacion.Caption:='';
      //qrlUrgente.Caption:='';
      //qrlIngCDC.Caption:='';
      //qrlAsisCDC.Caption:='';
      //qrlSecreCDC.Caption:='';
      
      if qODTPadreCODIGOPRIORIDAD.AsString= '1' then qrlNormal.Caption     :='Ö';
      if qODTPadreCODIGOPRIORIDAD.AsString= '2' then qrlMoviles.Caption    :='Ö';
      if qODTPadreCODIGOPRIORIDAD.AsString= '3' then qrlContratista.Caption :='Ö';
      //if qODTPadreCODIGOPRIORIDAD.AsString= '8' then qrlEmergencia.Caption     :='Ö';
      if qODTPadreCODIGOPRIORIDAD.AsString= '4' then qrlOpSubestacion.Caption    :='Ö';
      {if qODTPadreCODIGOPRIORIDAD.AsString= '7' then qrlIngCDC.Caption :='Ö';
      if qODTPadreCODIGOPRIORIDAD.AsString= '9' then qrlUrgente.Caption     :='Ö';
      if qODTPadreCODIGOPRIORIDAD.AsString= '5' then qrlSecreCdc.Caption    :='Ö';
      if qODTPadreCODIGOPRIORIDAD.AsString= '6' then qrlAsisCDC.Caption :='Ö'; }


      //LABOR Y TAREA
      qrlLabor.Caption:=dblcbLabor.Text;
      qrlTarea.Caption:=dblcbTarea.Text;
      if qODTPadreCODIGOZONAORIGEN.AsString<>'' then
        qrlZonaOrigen.Caption:=qZonaNOMBREZONA.AsString;
      if qODTPadreCODIGOMUNICIPIO.AsString<>'' then
        qrlMunicipioTrabajo.Caption:=qMunicipioNOMBREMUNICIPIO.AsString;
      //ASIGNACION
      qrlAdministrativo.Caption :=lbCIA.Caption;
      qrlTipoManoObra.Caption   :=dblcbTipoManoObra.Text;
      qrlAprobado.Caption       :=EdAprueba.Text;
      qrlRevisado.Caption       :=EdRevisado.Text;
      qrlEjecutado.Caption      :=EdEjecutado.Text;
      //HORARIO NORMAL
      qrdbNombreHorario.DataSet := qODT;
      qrlDescripcionHorario.Caption :=  dblcbTurno.Text;

      //CEDULAS
      qDatos := TQuery.Create(Application);
      qDatos.DatabaseName := 'BaseDato';

      with qDatos.SQL do
      begin
        Add('select p.codigoempleado, e.nombreempleado');
        Add('from odtpresmano p, empleado e');
        Add('where e.codigoempleado = p.codigoempleado');
        Add('and codigoodt = ' + qODTCODIGOODT.AsString);
        Add('group by p.codigoempleado, e.nombreempleado');
        Add('order by  e.nombreempleado');
      end;
      qDatos.Open;

      I:=0;
      while not qDatos.Eof do
      begin
        //Cedula
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := 640 + I*30;
        qrLabel.Left := 4;
        qrLabel.Width := 70;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatos.FieldByName('CodigoEmpleado').AsString;
        //Nombres
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := 640 + I*30;
        qrLabel.Left := 84;
        qrLabel.Width := 185;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatos.FieldByName('NombreEmpleado') .AsString;
        //Horas Extras
        qDatosExtras.close;
        qDatosExtras.ParamByName('CodigoOdt').AsString:=qODTPadreCODIGOODT.AsString;
        qDatosExtras.ParamByName('CodigoEmpleado').AsString:=qDatos.FieldByName('CodigoEmpleado').AsString;
        qDatosExtras.open;
        //Cantidad Diurna
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := 640 + I*30;
        qrLabel.Left := 278;
        qrLabel.Width := 15;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatosExtras.FieldByName('CantidadDiurna') .AsString;
        //Cantidad Nocturna
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := 640 + I*30;
        qrLabel.Left := 306;
        qrLabel.Width := 15;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatosExtras.FieldByName('CantidadNocturna') .AsString;
        //Fecha hora Desde
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := 640 + I*30;
        qrLabel.Left := 333;
        qrLabel.Width := 78;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatosExtras.FieldByName('Desde') .AsString;
        //Fecha hora Hasta
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := 640 + I*30;
        qrLabel.Left := 420;
        qrLabel.Width := 78;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatosExtras.FieldByName('Hasta') .AsString;
        //Viáticos
        qDatosViaticos.close;
        qDatosViaticos.ParamByName('CodigoOdt').AsString:=qODTPadreCODIGOODT.AsString;
        qDatosViaticos.ParamByName('CodigoEmpleado').AsString:=qDatos.FieldByName('CodigoEmpleado').AsString;
        qDatosViaticos.open;
        //Días Pagados Viaticos
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := 640 + I*30;
        qrLabel.Left := 505;
        qrLabel.Width := 15;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatosViaticos.FieldByName('DiasPagados') .AsString;
        qrLabel.Alignment:= taCenter;
        //Valor Viaticos
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := 640 + I*30;
        qrLabel.Left := 530;
        qrLabel.Width := 51;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatosViaticos.FieldByName('Valor').AsString;
        qrLabel.Alignment:= taCenter;
        //Auxilios de alimentación
        qDatosAuxilios.close;
        qDatosAuxilios.ParamByName('CodigoOdt').AsString:=qODTPadreCODIGOODT.AsString;
        qDatosAuxilios.ParamByName('CodigoEmpleado').AsString:=qDatos.FieldByName('CodigoEmpleado').AsString;
        qDatosAuxilios.open;
        //Desayunos
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := 640 + I*30;
        qrLabel.Left := 585;
        qrLabel.Width := 30;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatosAuxilios.FieldByName('CantidadDesayunos') .AsString;
        qrLabel.Alignment:= taCenter;
        //Almuerzos
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := 640 + I*30;
        qrLabel.Left := 638;
        qrLabel.Width := 30;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatosAuxilios.FieldByName('CantidadAlmuerzos') .AsString;
        qrLabel.Alignment:= taCenter;
        //Comidas
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := 640 + I*30;
        qrLabel.Left := 690;
        qrLabel.Width := 30;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatosAuxilios.FieldByName('CantidadComidas') .AsString;
        qrLabel.Alignment:= taCenter;

        Inc(I);
        if I > 8 then Break;
        qDatos.Next;
      end;
      qDatos.Free;
      QuickRep1.Preview;
    end;
  except
    Application.ProcessMessages;
  end;
end;

//***************************************************************************
//   Imprime Hoja de atrás de la ODT
//   trabajos asociados o ODT hijas
//***************************************************************************
procedure TfODTPadre.PartePosterior1Click(Sender: TObject);
begin
  try
    fQRODTPadreAdc:= TfQRODTPadreAdc.Create(Application);
    fQRODTPadreAdc.qrlNumeroODT.Caption:=qODTCODIGOODT.AsString;
    fQRODTPadreAdc.QuickRep1.Preview;
  finally
    Application.ProcessMessages;
  end;
end;

procedure TfODTPadre.qODTCODIGOESTADOODTChange(Sender: TField);
//var qDatos:TQuery;
begin
  if (sender.AsString = '6') then //ODT Terminada
  begin
      Caption:=Caption +  ' **Terminada**';
      PanelExtras.Enabled:= false;
      PanelViaticoAuxilio.Enabled:= false;
  end;
end;

//***************************************************************************
//   Imprime Hoja de materiales de la ODT
//***************************************************************************
procedure TfODTPadre.HojaAdicional1Click(Sender: TObject);
procedure AjustarQRLabel(var qrLabel:TQRLabel);
begin
  qrLabel.Alignment:= taRightJustify;
  qrLabel.AutoSize := False;
  qrLabel.AutoStretch := False;
  qrLabel.WordWrap := False;
  qrLabel.Height := 16;
  qrLabel.Font.Size := 7;
  qrLabel.Font.Name := 'Arial';
  qrLabel.SendToBack;
end;
var I:integer;
    qrLabel:TQRLabel;
    pformaimprimir:^TfQRODTPadreMateriales;
    nuevahoja:boolean;
begin
  if qPresMate.RecordCount > 0 then
  begin
    if MessageDlg('Ya existen materiales asociados a la ODT. ' + Chr(13) +
    'Desea imprimir la página de materiales en blanco?',mtConfirmation,[mbYes,mbNo],0)
    = mrNo then
    begin
      try
        if listaforms <>nil then
        begin
          for i:=listaforms.Count-1 downto 0 do
          begin
            pformaimprimir:=listaforms[i];
            listaforms.Delete(i);
            pformaimprimir.free;
          end;
          listaforms.free;
        end;
        listaforms:=TList.Create;
        qMaterialesImprimir.Close;
        qMaterialesImprimir.Open;
        nuevahoja:=true;

        while nuevahoja do
        begin
          new(pformaimprimir);
          pformaimprimir^:=TfQRODTPadreMateriales.Create(self);
          listaforms.Add(pformaimprimir);
          with pformaimprimir^ do
          begin
            nuevahoja:=false;
            qrdbImpresoODT.DataSet:=qODT;
            I:=0;
            while not (qMaterialesImprimir.Eof) and not(nuevahoja) do
            begin
              //Codigo Odt Hija
              qrLabel := TQRLabel.Create(QRBand2);
              AjustarQRLabel(qrLabel);
              qrLabel.Top := 100 + I*25;
              qrLabel.Left := 6;
              qrLabel.Width := 25;
              qrLabel.Parent := QRBand2;
              qrLabel.Alignment:= taCenter;
              qrLabel.Caption := qMaterialesImprimir.FieldByName('Consecutivo').AsString;
              //CodigoMaterial
              qrLabel := TQRLabel.Create(QRBand2);
              AjustarQRLabel(qrLabel);
              qrLabel.Top := 100 + I*25;
              qrLabel.Left := 41;
              qrLabel.Width := 40;
              qrLabel.Parent := QRBand2;
              qrLabel.Alignment:= taCenter;
              qrLabel.Caption := qMaterialesImprimir.FieldByName('CodigoMaterial').AsString;
              //NombreMaterial
              qrLabel := TQRLabel.Create(QRBand2);
              AjustarQRLabel(qrLabel);
              qrLabel.Top := 100 + I*25;
              qrLabel.Left := 86;
              qrLabel.Width := 208;
              qrLabel.Parent := QRBand2;
              qrLabel.Alignment:= taLeftJustify;
              qrLabel.Caption := qMaterialesImprimir.FieldByName('NombreMaterial').AsString;
              //CodigoUnidad
              qrLabel := TQRLabel.Create(QRBand2);
              AjustarQRLabel(qrLabel);
              qrLabel.Top := 100 + I*25;
              qrLabel.Left := 300;
              qrLabel.Width := 25;
              qrLabel.Parent := QRBand2;
              qrLabel.Alignment:= taCenter;
              qrLabel.Caption := qMaterialesImprimir.FieldByName('CodigoUnidad').AsString;
              //CantidadSolicitada
              qrLabel := TQRLabel.Create(QRBand2);
              AjustarQRLabel(qrLabel);
              qrLabel.Top := 100 + I*25;
              qrLabel.Left := 334;
              qrLabel.Width := 45;
              qrLabel.Parent := QRBand2;
              if qMaterialesImprimir.FieldByName('CantidadSolicitada').AsString<>'0' then
                qrLabel.Caption := qMaterialesImprimir.FieldByName('CantidadSolicitada') .AsString
              else qrLabel.Caption :=' ';
              //CantidadEntregada
              qrLabel := TQRLabel.Create(QRBand2);
              AjustarQRLabel(qrLabel);
              qrLabel.Top := 100 + I*25;
              qrLabel.Left := 387;
              qrLabel.Width := 45;
              qrLabel.Parent := QRBand2;
              if qMaterialesImprimir.FieldByName('CantidadEntregada').AsString<>'0'then
                qrLabel.Caption := qMaterialesImprimir.FieldByName('CantidadEntregada') .AsString
              else qrLabel.Caption :=' ';
              //CantidadConsumida
              qrLabel := TQRLabel.Create(QRBand2);
              AjustarQRLabel(qrLabel);
              qrLabel.Top := 100 + I*25;
              qrLabel.Left := 443;
              qrLabel.Width := 45;
              qrLabel.Parent := QRBand2;
              if qMaterialesImprimir.FieldByName('CantidadConsumida').AsString<>'0' then
                qrLabel.Caption := qMaterialesImprimir.FieldByName('CantidadConsumida') .AsString
              else qrLabel.Caption :=' ';
              //CantidadReintegradaBuena
              qrLabel := TQRLabel.Create(QRBand2);
              AjustarQRLabel(qrLabel);
              qrLabel.Top := 100 + I*25;
              qrLabel.Left := 500;
              qrLabel.Width := 35;
              qrLabel.Parent := QRBand2;
              if qMaterialesImprimir.FieldByName('CantidadReintegradaBuena').AsString<>'0' then
                qrLabel.Caption := qMaterialesImprimir.FieldByName('CantidadReintegradaBuena') .AsString
              else qrLabel.Caption :=' ';
              //CantidadReintegradaMala
              qrLabel := TQRLabel.Create(QRBand2);
              AjustarQRLabel(qrLabel);
              qrLabel.Top := 100 + I*25;
              qrLabel.Left := 540;
              qrLabel.Width := 35;
              qrLabel.Parent := QRBand2;
              if qMaterialesImprimir.FieldByName('CantidadReintegradaMala').AsString<>'0' then
                qrLabel.Caption := qMaterialesImprimir.FieldByName('CantidadReintegradaMala') .AsString
              else qrLabel.Caption :=' ';
              //CantidadRetiradaBuena
              qrLabel := TQRLabel.Create(QRBand2);
              AjustarQRLabel(qrLabel);
              qrLabel.Top := 100 + I*25;
              qrLabel.Left := 580;
              qrLabel.Width := 35;
              qrLabel.Parent := QRBand2;
              if qMaterialesImprimir.FieldByName('CantidadRetiradaBuena').AsString<>'0' then
                qrLabel.Caption := qMaterialesImprimir.FieldByName('CantidadRetiradaBuena') .AsString
              else qrLabel.Caption :=' ';
              //CantidadRetiradaMala
              qrLabel := TQRLabel.Create(QRBand2);
              AjustarQRLabel(qrLabel);
              qrLabel.Top := 100 + I*25;
              qrLabel.Left := 625;
              qrLabel.Width := 33;
              qrLabel.Parent := QRBand2;
              if qMaterialesImprimir.FieldByName('CantidadRetiradaMala').AsString<>'0' then
                qrLabel.Caption := qMaterialesImprimir.FieldByName('CantidadRetiradaMala') .AsString
              else qrLabel.Caption :=' ';
                //CantidadTraslado nuevo
              qrLabel := TQRLabel.Create(QRBand2);
              AjustarQRLabel(qrLabel);
              qrLabel.Top := 100 + I*25;
              qrLabel.Left := 667;
              qrLabel.Width := 33;
              qrLabel.Parent := QRBand2;
              if qMaterialesImprimir.FieldByName('Cantidadtrasladonueva').AsString<>'0' then
                qrLabel.Caption := qMaterialesImprimir.FieldByName('Cantidadtrasladonueva') .AsString
              else qrLabel.Caption :=' ';
              //CantidadTraslado Desmantelado
              qrLabel := TQRLabel.Create(QRBand2);
              AjustarQRLabel(qrLabel);
              qrLabel.Top := 100 + I*25;
              qrLabel.Left := 707;
              qrLabel.Width := 33;
              qrLabel.Parent := QRBand2;
              if qMaterialesImprimir.FieldByName('Cantidadtrasladodesman').AsString<>'0' then
                qrLabel.Caption := qMaterialesImprimir.FieldByName('Cantidadtrasladodesman') .AsString
              else qrLabel.Caption :=' ';
              Inc(I);
              if I > 35 then nuevahoja:=true;
              qMaterialesImprimir.Next;
            end;
          end;
        end;
        //qrcMateriales.Prepare;
        qrcMateriales.Preview;;
      except
      end;

    end
    else
    begin
      try
        fQRODTPadreAdc2:= TfQRODTPadreAdc2.Create(Application);
        fQRODTPadreAdc2.qrlNumeroODT.Caption:=GenerarImpreso;
        fQRODTPadreAdc2.QuickRep1.preview;
      {except
        on e:exception do
        begin
        end;
      end;
        Application.ProcessMessages; }
      finally
        Application.ProcessMessages;
      end;
    end;
    exit;
  end
  else
  begin
    try
      fQRODTPadreAdc2:= TfQRODTPadreAdc2.Create(Application);
      fQRODTPadreAdc2.qrlNumeroODT.Caption:=GenerarImpreso;
      fQRODTPadreAdc2.QuickRep1.preview;
    except
      on e:exception do
      begin
      end;
    end;
  end;

end;
//***************************************************************************
//   Imprime Reportes de daños o actividades asociados a la ODT
//***************************************************************************
procedure TfODTPadre.ReportesAsociadosClick(Sender: TObject);
begin
  inherited;
  fQRListaReporteODT:=TfQRListaReporteODT.Create(Application);
  try
    fQRListaReporteODT.qrlImpreso.Caption:=GenerarImpreso;
    fQRListaReporteODT.qrlImpresoInferior.Caption:=GenerarImpreso;
    fQRListaReporteODT.qReportes.ParamByName('CODIGOODT').AsString:=qODTCODIGOODT.AsString;
    fQRListaReporteODT.qReportes.Open;
    fQRListaReporteODT.QuickRep.Preview;
  finally
    Application.ProcessMessages;
  end;
end;

procedure TfODTPadre.qODTSobreTiempoAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qODTSobreTiempoCODIGOODT.AsString := qPresManoCODIGOODT.AsString;
  qODTSobreTiempoCODIGOEMPLEADO.AsString := qPresManoCODIGOEMPLEADO.AsString;
end;
//***************************************************************************
//       Presenta el formulario de Horas Extras
//    para Insertar en las tablas ODTSOBRETIEMPO Y ODTSOBRETIEMPODETALLE
//***************************************************************************
procedure TfODTPadre.sbAgregarExtrasClick(Sender: TObject);
var Query: TQuery;
    Codigo: string;
    bm:TBookmark;
begin
  if (qODT.State in [dsEdit,dsInsert]) and qODT.CachedUpdates then
  begin
    try
      bm:=qPresMano.GetBookmark;
      qODT.Post;
      qODT.Edit;
      qPresMano.GotoBookmark(bm);
    except
    end;
  end;
  if (qODTCODIGOTIPOTURNO.AsString='')then
    raise Exception.Create('Debe seleccionar el horario para ingresar las horas extras');
  if qPresManoCODIGOEMPLEADO.AsString <> '' then
  begin
    FODTDetalleHorasExtras := TFODTDetalleHorasExtras.Create(Application);
//    try
      FODTDetalleHorasExtras.qODTSobreTiempo.ParamByName('CODIGOODTSOBRETIEMPO').AsString := '-1';
      FODTDetalleHorasExtras.qODTSobreTiempo.Open;
      FODTDetalleHorasExtras.qODTSobreTiempo.Insert;
      FODTDetalleHorasExtras.qODTSobreTiempoCODIGOODT.AsString := qPresManoCODIGOODT.AsString;
      FODTDetalleHorasExtras.qODTSobreTiempoCODIGOEMPLEADO.AsString := qPresManoCODIGOEMPLEADO.AsString;
      FODTDetalleHorasExtras.qODTSobreTiempoOBSERVACION.AsString := qODTCODIGOODT.AsString;
      FODTDetalleHorasExtras.qODTSobreTiempoCANTIDADDIURNA.AsInteger := 0;
      FODTDetalleHorasExtras.qODTSobreTiempoCANTIDADNOCTURNA.AsInteger := 0;

      if ((qODTCODIGOTURNOGRUPO.AsString = '3')and (qODTCODIGOTIPOTURNO.AsString='1')) then
        FODTDetalleHorasExtras.qODTSobreTiempoFECHAASIGNACION.AsDateTime := trunc(qODTFECHAASIGNACION.AsDateTime)+1
      else
        FODTDetalleHorasExtras.qODTSobreTiempoFECHAASIGNACION.AsDateTime := trunc(qODTFECHAASIGNACION.AsDateTime);
      FODTDetalleHorasExtras.qODTSobreTiempo.Post;
      FODTDetalleHorasExtras.qODTSobreTiempo.Edit;

      FODTDetalleHorasExtras.qODTSobreTiempoDetalle.Open;
      if FODTDetalleHorasExtras.ShowModal = mrOk then
      begin
        qODTSobreTiempo.Close;
        qODTSobreTiempo.Open;
      end
      else
      begin
        Codigo := FODTDetalleHorasExtras.qODTSobreTiempoCODIGOODTSOBRETIEMPO.AsString;
        if Codigo <> '' then
        begin
          Query := TQuery.Create(Application);
          Query.DatabaseName := 'BaseDato';
          Query.SQL.Add('DELETE FROM ODTSOBRETIEMPODETALLE WHERE CODIGOODTSOBRETIEMPO = ' + Codigo);
          Query.ExecSQL;
          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('DELETE FROM ODTSOBRETIEMPO WHERE CODIGOODTSOBRETIEMPO = ' + Codigo);
          Query.ExecSQL;
          Query.close;
          Query.Free;
          qODTSobreTiempo.Close;
          qODTSobreTiempo.Open;
        end;
      end;
{    except
      on e:exception do
      begin
        showmessage(e.message);
        FODTDetalleHorasExtras.Free;
      end;
    end;   }
  end;
end;
//***************************************************************************
//       Presenta el formulario de Horas Extras
//    para Editar en las tablas ODTSOBRETIEMPO Y ODTSOBRETIEMPODETALLE
//***************************************************************************
procedure TfODTPadre.sbEditarExtrasClick(Sender: TObject);
var    bm:TBookmark;
begin
  if (qODT.State in [dsEdit,dsInsert]) and qODT.CachedUpdates then
  begin
    try
      bm:=qPresMano.GetBookmark;
      qODT.Post;
      qODT.Edit;
      qPresMano.GotoBookmark(bm);
    except
    end;
  end;
  if qODTSobreTiempoCODIGOODTSOBRETIEMPO.AsString <> '' then
  begin
    FODTDetalleHorasExtras := TFODTDetalleHorasExtras.Create(Application);
    try
      PoblarTablasTemporalesSobreTiempo;
      FODTDetalleHorasExtras.qODTSobreTiempo.ParamByName('CODIGOODTSOBRETIEMPO').AsString :=
        qODTSobreTiempoCODIGOODTSOBRETIEMPO.AsString;
      FODTDetalleHorasExtras.qODTSobreTiempo.Open;
      FODTDetalleHorasExtras.qODTSobreTiempo.Edit;
      FODTDetalleHorasExtras.qODTSobreTiempoDetalle.Open;
      FODTDetalleHorasExtras.CopiarFechaTemp;
      if (FODTDetalleHorasExtras.ShowModal = mrOk)or not(FODTDetalleHorasExtras.modificado) then
      begin
        qODTSobreTiempo.Close;
        qODTSobreTiempo.Open;
      end
      else
      begin
        EscribirTablasTemporalesSobreTiempo;
      end;
    except
      on e:exception do
      begin
        showmessage(e.message);
        FODTDetalleHorasExtras.Free;
      end;
    end;
  end;
end;


procedure TfODTPadre.qODTSobreTiempoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  if qODT.State in [dsEdit,dsInsert] then
  begin
    sbAgregarExtras.Enabled := qODTSobreTiempo.RecordCount = 0;
    sbEditarExtras.Enabled:=not sbAgregarExtras.Enabled;
    sbEliminarExtras.Enabled := not sbAgregarExtras.Enabled;
  end
  else
  begin
    sbAgregarExtras.Enabled := False;
    sbEditarExtras.Enabled:=False;
    sbEliminarExtras.Enabled :=False;
  end;
end;
//***************************************************************************
//       Elimina Registros de horas extras de un empleado en
//     en las tablas ODTSOBRETIEMPO Y ODTSOBRETIEMPODETALLE
//***************************************************************************
procedure TfODTPadre.sbEliminarExtrasClick(Sender: TObject);
var Query: TQuery;
begin
  inherited;
  if qODTSobreTiempoCODIGOODTSOBRETIEMPO.AsString <> '' then
    if Application.MessageBox('Esta seguro de eliminar este registro? ','Advertencia!', mb_yesNoCancel)=mrYes then
  begin
    Query := TQuery.Create(Application);
    Query.DatabaseName := 'BaseDato';
    Query.SQL.Add('DELETE FROM ODTSOBRETIEMPODETALLE');
    Query.SQL.Add('WHERE CODIGOODTSOBRETIEMPO = ' + qODTSobreTiempoCODIGOODTSOBRETIEMPO.AsString);
    Query.ExecSQL;
    Query.SQL.Clear;
    Query.SQL.Add('DELETE FROM ODTSOBRETIEMPO');
    Query.SQL.Add('WHERE CODIGOODTSOBRETIEMPO = ' + qODTSobreTiempoCODIGOODTSOBRETIEMPO.AsString);
    Query.ExecSQL;
    Query.Free;
    qODTSobreTiempo.Close;
    qODTSobreTiempo.Open;
  end;
end;

procedure TfODTPadre.qODTSobreTiempoAfterPost(DataSet: TDataSet);
begin
  inherited;
  qODTSobreTiempo.ApplyUpdates;
  qODTSobreTiempo.CommitUpdates;
end;
//***************************************************************************
//      Validaciones antes de cambiar el estado de una ODT
//     Especialmente cuando va pasar a estado Terminada
//***************************************************************************
procedure TfODTPadre.qODTCODIGOESTADOODTValidate(Sender: TField);
var Query: TQuery;
    S: string;
    Total: Integer;
    qConsulta2, qModProcesado: tquery;
begin

 //*************Codigo Nuevo Omar*************
  if (Sender.Text = '7') then
  begin
    //Interfaz OW
    {
    qConsulta2 := TQuery.Create(Application);
    qConsulta2.DatabaseName := 'BaseDato';
    qConsulta2.SQL.Add('SELECT COUNT(*) FROM ODTREQUISICION WHERE CODIGOODT = ' + qODTCODIGOODT.ASSTRING +' AND ESTADO <> ''ANULADO''' );
    try
      qConsulta2.Open;
    except
      qConsulta2.Close;
      qConsulta2.Free;
      exit;
    end;
    if qConsulta2.Fields[0].AsINTEGER > 0 then
    begin
      qConsulta2.Close;
      qConsulta2.Free;
      raise Exception.Create('Existen Requisiciones adjuntas a esta odt, Eliminelas primero.');
    end;
    qConsulta2.Close;
    qConsulta2.Free;}
    //*******************************************************++

{
    qConsulta2 := TQuery.Create(Application);
    qConsulta2.DatabaseName := 'BaseDato';
    qConsulta2.SQL.Add('select count(*) from  V4801A'+dblinkOW+' where substr(codigo_documento_externo,1, 11) = '''+qODTCODIGOODT.ASSTRING+ ''' and  codigo_ot not in ( ');
    qConsulta2.SQL.Add(' select codigo_ot from V4801A'+dblinkOW+' where estado = ''98''');
    qConsulta2.SQL.Add(' or ((estado = ''99'') and (codigo_ot not in (select codigo_ot from V4111A'+dblinkOW+' ))))');
    //qConsulta2.SQL.SaveToFile('c:\ow.txt');
    try
      qConsulta2.Open;
    except
      qConsulta2.Close;
      qConsulta2.Free;
      exit;
    end;
    if qConsulta2.Fields[0].AsINTEGER > 0 then
    begin
      qConsulta2.Close;
      qConsulta2.Free;
      raise Exception.Create('Existen OTs de OW en proceso o terminadas con materiales adjuntas a esta ODT.');
    end;
    qConsulta2.Close;
    qConsulta2.Free;
 }

    if ValidarExistenciaExtras then
      raise Exception.Create('No se puede asignar el estado de CANCELADA a la Odt debido a que' + Chr(13) +
                             'Existen Horas Extras relacionadas.');
    if ValidarExistenciaViaticos then
      raise Exception.Create('No se puede asignar el estado de CANCELADA a la Odt debido a que' + Chr(13) +
                             'Existen Viáticos relacionados.');
    if ValidarExistenciaAuxilios then
      raise Exception.Create('No se puede asignar el estado de CANCELADA a la Odt debido a que' + Chr(13) +
                             'Existen Auxilios relacionados.');                             
  end;

 //***************************************


  if (Sender.Text <> '') and (Sender.Text = '6') then
  begin
    if ValidarAnticiposSinLegalizar then
      raise Exception.Create('No se puede asignar el estado de TERMINADA a la Odt debido a que' + Chr(13) +
                             'Porque existen anticipos que no han sido legalizados');
    Query := TQuery.Create(Application);
    Query.DatabaseName := 'BaseDato';

    qReporte.First;
    while not qReporte.Eof do
    begin
      if (qReporteCODIGOESTADOREPORTE.AsString = '1') or (qReporteCODIGOESTADOREPORTE.AsString = '2') or
         (qReporteCODIGOESTADOREPORTE.AsString = '3') then
      begin
        raise Exception.Create('No se puede asignar el estado de TERMINADA a la odt debido a que' + Chr(13) +
                               'el reporte # ' + qReporteCODIGOREPORTE.AsString +
                               ' tiene estado de ' + qReporteNOMBREESTADOREPORTE.AsString);
      end;
      qReporte.Next;
    end;

    Query.sql.clear;
    Query.SQL.Add('SELECT COUNT(OD.CODIGOODT) FROM ODTDIA OD, ODTREPORTE ODR');
    Query.SQL.Add('WHERE ((FECHAINICIOTRABAJO IS NULL) OR (FECHAFINALTRABAJO IS NULL))');
    Query.SQL.Add('AND OD.CODIGOODT = ' + qODTCODIGOODT.AsString);
    Query.SQL.Add('AND OD.CODIGOODT = ODR.CODIGOODT');
    Query.SQL.Add('AND OD.CONSECUTIVO = ODR.CONSECUTIVO');
    Query.Open;
    if Query.Fields[0].AsInteger > 0 then
    begin
      Query.close;
      Query.Free;
      raise Exception.Create('No se puede asignar el estado de TERMINADA a la odt debido a que' + Chr(13) +
                               'algunas ODT hijas no tienen FECHA INICIO DE TRABAJO ó FECHA FINAL DE TRABAJO');
    end;


    if (qODTFECHAINICIO.AsString='') or (qODTFECHAFINAL.AsString='') then
      raise Exception.Create('No se puede asignar el estado de TERMINADA a la odt debido a que' + Chr(13) +
                                     'no se ha ingresado la FECHA INICIO DE TRABAJO ó FECHA FINAL DE TRABAJO');
    if Query.Fields[0].AsInteger > 0 then
    begin
      Query.close;
      Query.Free;
      raise Exception.Create('No se puede asignar el estado de TERMINADA a la odt debido a que' + Chr(13) +
                               'algunas ODT hijas no tienen FECHA INICIO DE TRABAJO ó FECHA FINAL DE TRABAJO');
    end;

    Query.sql.clear;
    Query.SQL.Add('SELECT DISTINCT CONSECUTIVO FROM ODTPRESMATE');
    Query.SQL.Add('WHERE CANTIDADSOLICITADA IS NULL');
    Query.SQL.Add('AND CANTIDADENTREGADA IS NULL');
    Query.SQL.Add('AND CANTIDADCONSUMIDA IS NULL');
    Query.SQL.Add('AND CANTIDADREINTEGRADABUENA IS NULL');
    Query.SQL.Add('AND CANTIDADREINTEGRADAMALA IS NULL');
    Query.SQL.Add('AND CANTIDADRETIRADABUENA IS NULL');
    Query.SQL.Add('AND CANTIDADRETIRADAMALA IS NULL');
    Query.SQL.Add('AND CANTIDADMODIFICADANUEVA IS NULL');
    Query.SQL.Add('AND CANTIDADMODIFICADADESMBUENA IS NULL');
    Query.SQL.Add('AND CANTIDADMODIFICADADESMMALA IS NULL');
    Query.SQL.Add('AND CANTIDADCONSUMIDADESMANTELADA IS NULL');
    Query.SQL.Add('AND CODIGOODT = ' + qODTCODIGOODT.AsString);
    Query.Open;
    S:='';
    while not Query.Eof do
    begin
      S:= S + Query.FieldByName('CONSECUTIVO').AsString;
      Query.Next;
      if not Query.Eof then
        S := S + ', ';
    end;

    if S <> '' then
      raise Exception.Create('No se puede asignar el estado de TERMINADA a la odt debido a que' + Chr(13) +
                             'dentro de las siguientes odt hijas existen materiales que no tiene ninguna cantidad : ' + S);

    if qODTCODIGOADMINISTRATIVO.AsString = '63' then
    begin
      Query.sql.clear;
      Query.SQL.Add('SELECT CONSECUTIVO, GENERAINDICE FROM ODTDIA');
      Query.SQL.Add('WHERE GENERAINDICE IS NULL');
      Query.SQL.Add('AND CODIGOODT = ' + qODTCODIGOODT.AsString);
      Query.Open;
      S:='';
      while not Query.Eof do
      begin
        S:= S + Query.FieldByName('CONSECUTIVO').AsString;
        Query.Next;
        if not Query.Eof then
          S := S + ', ';
      end;

      if S <> '' then
      begin
        Query.close;
        Query.free;
        raise Exception.Create('No se puede asignar el estado de TERMINADA a la odt debido a que' + Chr(13) +
                               'dentro de las siguientes odt hijas no se ha diligenciado el campo GENERA ÍNDICE ATENCIÓN AL CLIENTE: ' + S);
      end;
    end;
    if (qODTCODIGOODTTIPOMANOOBRA.AsString = '1') then
    begin
      Query.sql.clear;
      Query.SQL.Add('SELECT OD.CODIGOODT, OD.CONSECUTIVO, COUNT(ODP.CODIGOEMPLEADO) AS TOTAL');
      Query.SQL.Add('  FROM ODTDIA OD, ODTPRESMANO ODP');
      Query.SQL.Add(' WHERE ODP.CODIGOODT (+) = OD.CODIGOODT');
      Query.SQL.Add('   AND ODP.CONSECUTIVO (+) = OD.CONSECUTIVO');
      Query.SQL.Add('   AND NOT OD.CODIGOESTADOODTDIA = ''7'' ');
      Query.SQL.Add('   AND OD.CODIGOODT = ' + qODTCODIGOODT.AsString);
      Query.SQL.Add('GROUP BY OD.CODIGOODT, OD.CONSECUTIVO');
      Query.SQL.Add('HAVING COUNT(ODP.CODIGOEMPLEADO) = 0');
      Query.Open;
      S := '';
      while not Query.Eof do
      begin
        S:= S + Query.FieldByName('CONSECUTIVO').AsString;
        Query.Next;
        if not Query.Eof then
          S := S + ', ';
      end;
      if S <> '' then
      begin
        Query.close;
        Query.Free;
        raise Exception.Create('No se puede asignar el estado de TERMINADA a la odt debido a que' + Chr(13) +
                               'las siguientes odt hijas no tienen asignado mano de obra: ' + S);
      end;
    end;
    if Not(ValidarHijasTerminadas) then
      raise exception.create('No se puede terminar la Odt hasta que no termine todas las órdenes de trabajo hijas.');

    Query.sql.clear;
    Query.SQL.Add('SELECT COUNT(*) AS TOTAL');
    Query.SQL.Add('FROM ODTSOBRETIEMPO');
    Query.SQL.Add('WHERE CODIGOODT = ' + qODTCODIGOODT.AsString);
    Query.Open;
    Total := Query.FieldByName('TOTAL').AsInteger;

    if (Total = 0) then
    if MessageDlg('Esta ODT genera horas extras?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
    begin
     raise Exception.Create('Debe ingresar las horas extras referentes a esta ODT para poder cerrarla.' + Chr(13) +
                               'Diríjase a la pestaña mano de obra de la ODT padre y proceda a diligenciar la horas extras.');
    end;
    if (qODTCODIGOAPROBADO.AsString='') or (qODTCODIGOREVISADO.AsString='') or (qODTCODIGOEJECUTOR.AsString='') then
    begin
     Query.close;
     Query.Free;
     raise Exception.Create('La ODT no puede ser terminada si no está aprobada revisada y ejecutada.' + Chr(13) +
                               'Diríjase a la pestaña mano de obra de la ODT padre y proceda a diligenciar estos campos.');
    end;

    if ValidarConciliacion(False,'') then
      raise Exception.Create('No se puede asignar el estado de TERMINADA a la ODT debido a que' + Chr(13) +
                             'no se ha realizado la conciliación de viáticos');

    if TieneConciliacionesCeroPesosODT() then
    begin
      raise Exception.Create('Para poder asignar el estado TERMINADA a la ODT debe realizar ' + Chr(13) +
            'primero la conciliación de viáticos.');
    end;


  end;
  {if (Sender.Text = '6') then
  begin
    //**********************************cuentas de cobro******************************************
    qConsulta2 := TQuery.Create(Application);
    qConsulta2.DatabaseName := 'BaseDato';
    qConsulta2.SQL.Add('SELECT  cd.*, oc.numerocuenta, OC.CEDULAUSUARIO, OC.OBSERVACION, AC.CODIGOLIQUIDACION,');
    qConsulta2.SQL.Add(' DECODE(esnormal,''S'',ac.VALORNORMAL,ac.VALORFESTIVO) AS cobro FROM odtcobro oc, odtcobrodetalleactividad cd, odtactividadcobro ac' );
    qConsulta2.SQL.Add(' WHERE cd.procesado is null and cd.CODIGOADMINISTRATIVO = ac.CODIGOADMINISTRATIVO');
    qConsulta2.SQL.Add(' AND cd.CODIGOODTACTIVIDADCOBRO = ac.CODIGOODTACTIVIDADCOBRO');
    qConsulta2.SQL.Add(' AND cd.CODIGOODT = oc.CODIGOODT AND CD.CONSECUTIVO = OC.CONSECUTIVO ');
    qConsulta2.SQL.Add(' AND CD.CONSECUTIVOCOBRO = OC.CONSECUTIVOCOBRO AND OC.CODIGOODT = '  + qODTCODIGOODT.ASSTRING  );
    //qConsulta2.SQL.SAVETOFILE('c:\cuentascobro.txt');
    qConsulta2.Open;
    if qconsulta2.RecordCount >0 then
    Begin
      qconsulta2.First;
      while not qconsulta2.Eof do
      Begin
        StoredProc1.UnPrepare;
        StoredProc1.StoredProcName := 'CUENTACOBRO';
        StoredProc1.Prepare;
        StoredProc1.ParamByName('VI_CLIENTE_ID').Asinteger  :=  qconsulta2.fieldbyname('numerocuenta').asinteger;
        StoredProc1.ParamByName('VI_CODIGO_LIQUIDACION').asinteger := qconsulta2.fieldbyname('CODIGOLIQUIDACION').asinteger;
        StoredProc1.ParamByName('VI_VALOR_CONCEPTO').asinteger := qconsulta2.fieldbyname('COBRO').asinteger;
        StoredProc1.ParamByName('VI_IDENTIFICACION').AsString := qconsulta2.fieldbyname('CEDULAUSUARIO').AsString;
        StoredProc1.ParamByName('VI_MENSAJE').AsString :=  'ODT: '+ qconsulta2.fieldbyname('codigoodt').asstring + '-' + qconsulta2.fieldbyname('consecutivo').asstring + ' ENERGIS.  '+   qconsulta2.fieldbyname('OBSERVACION').ASSTRING;
        StoredProc1.ExecProc;
        qModProcesado:= TQuery.Create(Application);
        qModProcesado.DatabaseName := 'BaseDato';
        qModProcesado.SQL.Add('UPDATE odtcobrodetalleactividad SET PROCESADO = ''S'' WHERE CODIGOODT = '+ qconsulta2.fieldbyname('CODIGOODT').asstring );
        qModProcesado.SQL.Add(' AND CONSECUTIVO = '+ qconsulta2.fieldbyname('CONSECUTIVO').asstring);
        qModProcesado.SQL.Add(' AND CONSECUTIVOCOBRO = '+ qconsulta2.fieldbyname('CONSECUTIVOCOBRO').asstring);
        qModProcesado.SQL.Add(' AND CODIGOADMINISTRATIVO = '+ qconsulta2.fieldbyname('CODIGOADMINISTRATIVO').asstring);
        qModProcesado.SQL.Add(' AND CODIGOODTACTIVIDADCOBRO = '+ qconsulta2.fieldbyname('CODIGOODTACTIVIDADCOBRO').asstring);
        //qModProcesado.SQL.SAVETOFILE('c:\qModProcesado.txt');
        qModProcesado.ExecSQL;
        qModProcesado.Free;
        qconsulta2.Next;
      End;
    End;
    qConsulta2.Free;
  end;}
 //***********************************************************************************************
end;

procedure TfODTPadre.Copiar1Click(Sender: TObject);
begin
  if qODTSobreTiempoCODIGOODTSOBRETIEMPO.AsString <> '' then
    CodigoODTSobreTiempo := qODTSobreTiempoCODIGOODTSOBRETIEMPO.AsString;
end;
//***************************************************************************
//      Pega información de horas extras copiadas de un
//     empleado a otro
//***************************************************************************
procedure TfODTPadre.Pegar1Click(Sender: TObject);
var Query, qInsertar, qSecuencia: TQuery;
    Codigo, CodigoAux: string;
begin
  if (qODTSobreTiempoCODIGOODTSOBRETIEMPO.AsString <> '') then
  begin
   MessageDlg('Este empleado ya tiene asignado horas extras.' + Chr(13) +
              'No es posible pegar los datos.', mtWarning, [mbOk], 0);
   Exit;
  end;
  if (qPresManoCODIGOEMPLEADO.AsString <> '')and (CodigoODTSobreTiempo <> '')then
  begin
    qInsertar := TQuery.Create(Application);
    qInsertar.DatabaseName := 'BaseDato';
    qInsertar.SQL.Add('INSERT INTO ODTSOBRETIEMPO(CODIGOODTSOBRETIEMPO,');
    qInsertar.SQL.Add('CODIGOODT,CODIGOEMPLEADO,CANTIDADDIURNA,CANTIDADNOCTURNA,');
    qInsertar.SQL.Add('FECHAASIGNACION,OBSERVACION)');
    qInsertar.SQL.Add('VALUES(:CODIGOODTSOBRETIEMPO,:CODIGOODT,');
    qInsertar.SQL.Add(':CODIGOEMPLEADO,:CANTIDADDIURNA,:CANTIDADNOCTURNA,');
    qInsertar.SQL.Add(':FECHAASIGNACION,:OBSERVACION)');

    Query := TQuery.Create(Application);
    Query.DatabaseName := 'BaseDato';
    Query.SQL.Add('SELECT SQ_SOBRETIEMPO.NEXTVAL FROM DUAL');
    Query.Open;
    Codigo := Query.Fields[0].AsString;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT CODIGOODT, CANTIDADDIURNA, CANTIDADNOCTURNA,');
    Query.SQL.Add('FECHAASIGNACION, OBSERVACION FROM ODTSOBRETIEMPO');
    Query.SQL.Add('WHERE CODIGOODTSOBRETIEMPO = ' + CodigoODTSobreTiempo);
    Query.Open;
    qInsertar.ParamByName('CODIGOODTSOBRETIEMPO').AsString := Codigo;
    with qInsertar do
    begin
      ParamByName('CODIGOODT').AsString := Query.FieldByName('CODIGOODT').AsString;
      ParamByName('CODIGOEMPLEADO').AsString := qPresManoCODIGOEMPLEADO.AsString;
      ParamByName('CANTIDADDIURNA').AsString := Query.FieldByName('CANTIDADDIURNA').AsString;
      ParamByName('CANTIDADNOCTURNA').AsString := Query.FieldByName('CANTIDADNOCTURNA').AsString;
      ParamByName('FECHAASIGNACION').AsString := FormatoFecha(Query.FieldByName('FECHAASIGNACION'));
      ParamByName('OBSERVACION').AsString := Query.FieldByName('OBSERVACION').AsString;
    end;
    qInsertar.ExecSQL;
    qInsertar.Close;
    qInsertar.SQL.Clear;
    qInsertar.SQL.Add('INSERT INTO ODTSOBRETIEMPODETALLE(CODIGOODTSOBRETIEMPODETALLE,');
    qInsertar.SQL.Add('CODIGOODTSOBRETIEMPO,CODIGOODT,CODIGOEMPLEADO,FECHAHORADESDE,');
    qInsertar.SQL.Add('FECHAHORAHASTA,CANTIDADDIURNA,CANTIDADNOCTURNA,CONVENCIONAL,OBSERVACION,DISPONIBILIDAD)');
    qInsertar.SQL.Add(' VALUES(:CODIGOODTSOBRETIEMPODETALLE,:CODIGOODTSOBRETIEMPO,:CODIGOODT,');
    qInsertar.SQL.Add(':CODIGOEMPLEADO,TO_DATE(:FECHAHORADESDE,''MM/DD/YYYY HH24:MI:SS''),');
    qInsertar.SQL.Add('TO_DATE(:FECHAHORAHASTA,''MM/DD/YYYY HH24:MI:SS''),:CANTIDADDIURNA,:CANTIDADNOCTURNA,:CONVENCIONAL,:OBSERVACION,:DISPONIBILIDAD)');
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT CODIGOODT, FECHAHORADESDE, FECHAHORAHASTA, CANTIDADDIURNA,');
    Query.SQL.Add('CANTIDADNOCTURNA,CONVENCIONAL,OBSERVACION,DISPONIBILIDAD FROM ODTSOBRETIEMPODETALLE');
    Query.SQL.Add('WHERE CODIGOODTSOBRETIEMPO = ' + CodigoODTSobreTiempo);
    Query.Open;
    Query.First;
    qSecuencia := TQuery.Create(Application);
    qSecuencia.DatabaseName := 'BaseDato';
    qSecuencia.SQL.Add('SELECT SQ_SOBRETIEMPODETALLE.NEXTVAL FROM DUAL');
    while not Query.Eof do
    begin
      with qInsertar do
      begin
        qSecuencia.Close;
        qSecuencia.Open;
        CodigoAux := qSecuencia.Fields[0].AsString;
        Close;
        ParamByName('CODIGOODTSOBRETIEMPODETALLE').AsString := CodigoAux;
        ParamByName('CODIGOODTSOBRETIEMPO').AsString := Codigo;
        ParamByName('CODIGOODT').AsString := Query.FieldByName('CODIGOODT').AsString;
        ParamByName('CODIGOEMPLEADO').AsString := qPresManoCODIGOEMPLEADO.AsString;
        ParamByName('FECHAHORADESDE').AsString := FormatoFecha(Query.FieldByName('FECHAHORADESDE'),True);
        ParamByName('FECHAHORAHASTA').AsString := FormatoFecha(Query.FieldByName('FECHAHORAHASTA'),True);
        ParamByName('CANTIDADDIURNA').AsString := Query.FieldByName('CANTIDADDIURNA').AsString;
        ParamByName('CANTIDADNOCTURNA').AsString := Query.FieldByName('CANTIDADNOCTURNA').AsString;
        ParamByName('CONVENCIONAL').AsString := Query.FieldByName('CONVENCIONAL').AsString;
        ParamByName('DISPONIBILIDAD').AsString := Query.FieldByName('DISPONIBILIDAD').AsString;
        ParamByName('OBSERVACION').AsString := Query.FieldByName('OBSERVACION').AsString;
        ExecSQL;
      end;
      Query.Next;
    end;
    qSecuencia.Free;
    Query.Free;
    qInsertar.Free;
    qODTSobreTiempo.Close;
    qODTSobreTiempo.Open;
  end;
end;
//***************************************************************************
//      Consulta fecha del servidor
//***************************************************************************
function TfODTPadre.FechaServidorCad: string;
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

procedure TfODTPadre.ActualizaInventario(aOdt, aConsecutivo: string);
//var
//  QTablas,Query, qTemp, QActualiza: TQuery;
//  Tabla, Condicion: string;
//  Lista: TStringList;
begin
{  Lista := TStringList.Create;
  QTablas := TQuery.Create(Application);
  QTablas.DatabaseName := 'BaseDato';
  QTablas.SQL.Add('SELECT H_TABLA FROM H_TABLA');
  QTablas.Open;
  QTablas.First;
  Query   := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  while not QTablas.Eof do
  begin
    Query.sql.Clear;
    Tabla := Copy(QTablas.Fields[0].AsString,3,Length(QTablas.Fields[0].AsString));
    Query.SQL.Add('SELECT * FROM ' + QTablas.Fields[0].AsString);
    Query.SQL.Add('WHERE H_CODIGOODT = :CODIGOODT');
    Query.SQL.Add('AND H_CONSECUTIVO = :CONSECUTIVO');
    Query.ParamByName('CODIGOODT').AsString := aOdt;
    Query.ParamByName('CONSECUTIVO').AsString := aConsecutivo;
    Query.Open;
    while not Query.Eof do
    begin
      qTemp := TQuery.Create(nil);
      qTemp.DatabaseName := 'BaseDato';
      with qTemp.SQL do
      begin
        Add('SELECT UCC.COLUMN_NAME');
        Add('FROM USER_CONS_COLUMNS UCC, USER_CONSTRAINTS UC');
        Add('WHERE UCC.CONSTRAINT_NAME = UC.CONSTRAINT_NAME');
        Add('AND UCC.TABLE_NAME = ''' + Tabla + '''');
        Add('AND UC.CONSTRAINT_TYPE = ''P''');
      end;
      qTemp.Open;
      Lista.Clear;
      while not qTemp.Eof do
      begin
        Lista.Add(qTemp.Fields[0].AsString);
        qTemp.Next;
      end;
      QActualiza := TQuerY.Create(Application);
      QActualiza.DatabaseName := 'BaseDato';
      QActualiza.SQL.Add('UPDATE ' + Tabla + ' SET CODIGOESTADOINFRAESTRUCTURA = ''1''');
      Condicion := '';
      if Lista.Count = 1 then
        Condicion := ConstruirCondicion(Tabla,Query.FieldByName(Lista[0]).AsString,'');
      if Lista.Count = 2 then
        Condicion := ConstruirCondicion(Tabla,Query.FieldByName(Lista[0]).AsString,Query.FieldByName(Lista[1]).AsString);
      if Condicion <> '' then
      begin
        QActualiza.SQL.Add('WHERE ' + Condicion);
        QActualiza.SQL.Add('AND CODIGOESTADOINFRAESTRUCTURA = ''2''');
        QActualiza.ExecSQL;
      end;
      QActualiza.Free;

      qTemp.Free;
      Query.Next;
    end;
    QTablas.Next;
  end;
  QTablas.Free;
  Query.Free;
  Lista.Free;        }
end;

procedure TfODTPadre.qODTCODIGOADMINISTRATIVOChange(Sender: TField);
var
  i:integer;
begin
  if (Sender.AsString<>'') then
  begin
    qCIA.close;
    qCIA.ParamByName('CODIGOADMINISTRATIVO').AsString:=Sender.AsString;
    qCIA.sql.insert(3,'AND ESTADO=''A''');
    qCIA.open;
    i:=qCIA.recordcount;
    qCIA.sql.delete(3);
    if (i=0) then
      raise Exception.Create('Este Código Administrativo pertenece a un Área Inactiva.');
    qTurnoGrupo.Close;
    qTurnoGrupo.Open;
    Arbol.Enabled:=true;
    Notebook.Enabled:=true;
  end;
end;

procedure TfODTPadre.qPresManoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if qODTSobreTiempo.Active then
  begin
    sbAgregarExtras.Enabled := qODTSobreTiempo.RecordCount = 0;
    sbEditarExtras.Enabled:=not sbAgregarExtras.Enabled;
    sbEliminarExtras.Enabled := not sbAgregarExtras.Enabled;
  end;

  if qViaticoResumen.Active then
  begin
    EditarViaticoConciliacion1.Visible:=False;

    if (not ValidarHijasTerminadas) then //Odt no terminada
    begin
      if (not ValidarViaticosEmpleado) then //Sin viaticos
      begin
        sbAgregarViaticos.Enabled:=True;
        AgregarViaticos1.Visible:=True;
        AgregarGastosComision1.Visible:=False;
        AgregarConciliacionViaticos1.Visible:=False;
        bLimpiarFECHAFINVIATICO:= False;
        sbEditarViaticos.Enabled:=False;
      end
      else
      begin
        bLimpiarFECHAFINVIATICO:= True;
        sbAgregarViaticos.Enabled:=False;
        sbEditarViaticos.Enabled:=True;
        EditarViaticos1.Visible:=True;
        EditarGastosComision1.Visible:=False;
        EditarViaticoConciliacion1.Visible:=False;
      end;
    end
    else
    begin
      if qODTFECHAFINAL.AsString<>'' then
      begin
        if (not GastosComisionEmpleado) then //Otros Gastos
        begin
          sbAgregarViaticos.Enabled:=True;
          AgregarViaticos1.Visible:=False;
          AgregarGastosComision1.Visible:=True;
          sbEditarViaticos.Enabled:=False;
          EditarGastosComision1.Visible:=False;
        end
        else
        begin
          sbAgregarViaticos.Enabled:=False;
          sbEditarViaticos.Enabled:=True;
          EditarViaticos1.Visible:=False;
          EditarGastosComision1.Visible:=True;
        end;

        if ValidarViaticosEmpleado then
        begin
          if ValidarConciliacion(True,DataSet.fieldbyname('CODIGOEMPLEADO').asString) then
          begin
            sbAgregarViaticos.Enabled:=True;
            AgregarViaticos1.Visible:=False;
            AgregarConciliacionViaticos1.Visible:=True;
            bLimpiarFECHAFINVIATICO:= True;
          end
          else
          begin
            bLimpiarFECHAFINVIATICO:= False;
            sbEditarViaticos.Enabled:=True;
            EditarViaticoConciliacion1.Visible:=True;
            AgregarConciliacionViaticos1.Visible:=False;
          end;
        end
        else
        begin
          AgregarConciliacionViaticos1.Visible:=False;
        end;
      end
      else
      begin
        sbAgregarViaticos.Enabled:=False;
        sbEditarViaticos.Enabled:=False;
      end;
    end;

    if ((ValidarViaticosEmpleado) and (not validarHijasterminadas))
        or
       ((GastosComisionEmpleado) and (validarHijasterminadas))
    then
      sbEliminarViaticos.Enabled := True;

    if (not GastosComisionEmpleado) and (validarHijasterminadas) then
      sbEliminarViaticos.Enabled := False;
  end;

  if qAuxilioResumen.Active then
  begin
    sbAgregarAuxilios.Enabled :=true;
    sbEditarAuxilios.Enabled:=qAuxilioResumen.RecordCount > 0;
    if qODTCODIGOESTADOODT.AsString='6' then
      sbImprimirAuxilios.Enabled:=sbEditarAuxilios.Enabled
    else
      sbImprimirAuxilios.Enabled:=false;
    sbEliminarAuxilios.Enabled := sbEditarAuxilios.Enabled;
  end;
  qViaticoResumenAfterScroll(qViaticoResumen);  
end;
//***************************************************************************
//      Presenta menú para editar viáticos
//***************************************************************************
procedure TfODTPadre.sbEditarViaticosClick(Sender: TObject);
var punto:TPoint;
  Query:TQuery;
begin
{ Query:=TQuery.Create(Application);
 Query.DatabaseName:='BaseDato';
 Query.sql.Clear;
 Query.sql.Add('SELECT VALORANTICIPO FROM ODTVIATICO WHERE CODIGOVIATICO='+qViaticoCODIGOVIATICO.AsString);
 Query.open;
 Query.close;
 Query.free;  }
 punto:=Panel11.ClientToScreen(Classes.Point(sbEditarViaticos.Left, sbEditarViaticos.top));
 pmEditarViaticos.Popup(punto.x+10, punto.y+10);
end;

procedure TfODTPadre.qViaticoResumenAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qPresManoAfterScroll(qPresMano);
end;

procedure TfODTPadre.qAuxilioResumenAfterOpen(DataSet: TDataSet);
begin
  inherited;
    sbAgregarAuxilios.Enabled :=true;
    sbEditarAuxilios.Enabled:=qAuxilioResumen.RecordCount > 0;
    if qODTCODIGOESTADOODT.AsString='6' then
      sbImprimirAuxilios.Enabled:=sbEditarAuxilios.Enabled
    else
      sbImprimirAuxilios.Enabled:=false;
    sbEliminarAuxilios.Enabled := sbEditarAuxilios.Enabled;
end;
//***************************************************************************
//     Imprime formato de liquidación de auxilios de alimentación
//       -Solo cuando la ODT está terminada-
//***************************************************************************
procedure TfODTPadre.LiquidacindeAuxilios1Click(Sender: TObject);
var qDatos:tquery;
 cop:boolean;
begin
  sbImprimirAuxilios.Click();

   {cop:=false;
   qDatos:=TQuery.Create(Application);
   qDatos.DatabaseName:='BaseDato';
   try
     qDatos.SQL.Add('SELECT count(*) FROM ODTAUXILIO OA, EMPLEADO E ');
     qDatos.SQL.Add('WHERE OA.CODIGOEMPLEADO = E.CODIGOEMPLEADO');
     qDatos.SQL.Add('AND (OA.COBROINDIVIDUAL<>''S'' OR COBROINDIVIDUAL IS NULL)');
     qDatos.SQL.Add('AND OA.CODIGOODT='+qODTCODIGOODT.AsString);
     qDatos.SQL.Add('AND IMPRESO=''S''');
     qDatos.open;
     if (qDatos.fields[0].AsInteger>0) then
       cop:=true;
   except
   end;
   qdatos.free;

  inherited;
  if fQRAuxilio<>nil then
  begin
    fQRAuxilio.free;
    fQRAuxilio:=nil;
  end;
  if fQRAuxilioCopia<>nil then
  begin
    fQRAuxilioCopia.free;
    fQRAuxilioCopia:=nil;
  end;
  try
    fQRAuxilio := TfQRAuxilio.Create(self);
    with fQRAuxilio do
    begin
      qEmpleadosAuxilio.ParamByName('CODIGOODT').AsString := qODT.FieldByName('CODIGOODT').AsString;
      qEmpleadosAuxilio.Open;

      qImputaciones.ParamByName('CODIGOODT').AsString := qODT.FieldByName('CODIGOODT').AsString;
      qImputaciones.Open;

      qCIA.ParamByName('CIA').AsString := qODTCODIGOADMINISTRATIVO.AsString;
      qCIA.Open;
      qPagado.ParamByName('CODIGOODT').AsString := qODT.FieldByName('CODIGOODT').AsString;
      qPagado.Open;

      qVehiculos.ParamByName('CODIGOODT').AsString := qODT.FieldByName('CODIGOODT').AsString;
      qVehiculos.Open;
      if qVehiculos.RecordCount>0 then
      begin
        while not qVehiculos.eof do
        begin
          qrlVehiculos.Caption:=qrlVehiculos.Caption + qVehiculos.FieldByName('CODIGOVEHICULO').AsString +'    ';
          qVehiculos.Next;
        end;
      end
      else
      begin
        QRLabelVehiculos.Caption:=' ';
      end;
      copia:=cop;
      if copia then
        qrlCopia1.Caption:='COPIA NO VALIDA PARA COBRAR';
    end;
    fQRAuxilioCopia := TfQRAuxilio.Create(self);
    with fQRAuxilioCopia do
    begin
      copia:=true;
      qEmpleadosAuxilio.ParamByName('CODIGOODT').AsString := qODT.FieldByName('CODIGOODT').AsString;
      qEmpleadosAuxilio.Open;

      qImputaciones.ParamByName('CODIGOODT').AsString := qODT.FieldByName('CODIGOODT').AsString;
      qImputaciones.Open;

      qCIA.ParamByName('CIA').AsString := qODTCODIGOADMINISTRATIVO.AsString;
      qCIA.Open;
      qPagado.ParamByName('CODIGOODT').AsString := qODT.FieldByName('CODIGOODT').AsString;
      qPagado.Open;

      qVehiculos.ParamByName('CODIGOODT').AsString := qODT.FieldByName('CODIGOODT').AsString;
      qVehiculos.Open;
      if qVehiculos.RecordCount>0 then
      begin
        while not qVehiculos.eof do
        begin
          qrlVehiculos.Caption:=qrlVehiculos.Caption + qVehiculos.FieldByName('CODIGOVEHICULO').AsString +'    ';
          qVehiculos.Next;
        end;
      end
      else
      begin
        QRLabelVehiculos.Caption:=' ';
      end;
      qrlCopia1.Caption:='COPIA NO VALIDA PARA COBRAR';

      try
  //      qrAuxilio.Prepare;
  //      qrImputaciones.Prepare;
        qrcAuxilioGrupo.Preview;
      except
      end;
    end;
  finally
    GuardarTransaccion;
  end; }
end;

procedure TfODTPadre.qrcAuxilioGrupoAddReports(Sender: TObject);
begin
  inherited;
  qrcAuxilioGrupo.Reports.Clear;
  qrcAuxilioGrupo.Reports.Add(fQRAuxilio.qrAuxilio);
  qrcAuxilioGrupo.Reports.Add(fQRAuxilio.qrImputaciones);
  qrcAuxilioGrupo.Reports.Add(fQRAuxilioCopia.qrAuxilio);
  qrcAuxilioGrupo.Reports.Add(fQRAuxilioCopia.qrImputaciones);
end;
//***************************************************************************
//     Despliega formulario para seleccionar la fecha
//     inicio de trabajos  de la ODT
//***************************************************************************
procedure TfODTPadre.sbFechaInicialClick(Sender: TObject);
begin
  inherited;
  fechaservidoractual:= fechaservidor;
  try
    dbEdFechaInicio.Setfocus;
    sFecha := dbEdFechaInicio.Text;
    if sFecha = '' then
      sFecha := FechaServidorCad;
    Fecha := GetFecha(True);
    if Fecha <> '' then dbEdFechaInicio.Text := Fecha;

  except
  end;
end;
//***************************************************************************
//     Despliega formulario para seleccionar la fecha
//     final de trabajos de la ODT
//***************************************************************************
procedure TfODTPadre.sbFechaFinClick(Sender: TObject);
begin
  inherited;
  try
    dbEdFechaFin.Setfocus;
    sFecha := dbEdFechaFin.Text;
    if sFecha = '' then
      sFecha := FechaServidorCad;
    Fecha := GetFecha(True);
    if Fecha <> '' then dbEdFechaFin.Text := Fecha;

  except
  end;
end;
//***************************************************************************
//     Guarda el código de auxilio de alimentación de un empleado
//     para permitir copiar los valores del mismo a otro empleado
//***************************************************************************
procedure TfODTPadre.CopiarAuxiliosClick(Sender: TObject);
begin
  inherited;
  if qAuxilioCODIGOAUXILIO.AsString <> '' then
    CodigoODTAuxilio := qAuxilioCODIGOAUXILIO.AsString;
end;
//***************************************************************************
//   Copia auxilio de Alimentación de un empleado a otro
//***************************************************************************
procedure TfODTPadre.PegarAuxiliosClick(Sender: TObject);
var Query, qInsertar, qSecuencia: TQuery;
    Codigo, CodigoAux: string;
begin
  if (qAUXILIOCODIGOAUXILIO.AsString <> '') then
  begin
   MessageDlg('Este empleado ya tiene asignado auxilio de alimentación.' + Chr(13) +
              'No es posible pegar los datos.', mtWarning, [mbOk], 0);
   Exit;
  end;
  if (qPresManoCODIGOEMPLEADO.AsString <> '')and (CodigoODTAuxilio <> '')then
  begin
    qInsertar := TQuery.Create(Application);
    qInsertar.DatabaseName := 'BaseDato';
    qInsertar.SQL.Add('INSERT INTO ODTAUXILIO(CODIGOAUXILIO,CODIGOEMPLEADO,CODIGOODT,FECHAINICIO,FECHAFIN,CANTIDADDESAYUNOS,');
    qInsertar.SQL.Add('CANTIDADALMUERZOS,CANTIDADCOMIDAS,CODIGOVEHICULO) VALUES(:CODIGOAUXILIO,');
    qInsertar.SQL.Add(':CODIGOEMPLEADO,:CODIGOODT,TO_DATE(:FECHAINICIO,''MM/DD/YYYY HH24:MI:SS''),');
    qInsertar.SQL.Add('TO_DATE(:FECHAFIN,''MM/DD/YYYY HH24:MI:SS''),:CANTIDADDESAYUNOS,:CANTIDADALMUERZOS,:CANTIDADCOMIDAS,:CODIGOVEHICULO)');
    Query := TQuery.Create(Application);
    Query.DatabaseName := 'BaseDato';
    Query.SQL.Add('SELECT SQ_ODTAUXILIO.NEXTVAL FROM DUAL');
    Query.Open;
    Codigo := Query.Fields[0].AsString;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT CODIGOODT,FECHAINICIO, FECHAFIN, ');
    Query.SQL.Add('CANTIDADDESAYUNOS,CANTIDADALMUERZOS,CANTIDADCOMIDAS,CODIGOVEHICULO FROM ODTAUXILIO');
    Query.SQL.Add('WHERE CODIGOAUXILIO = ' + CodigoODTAuxilio);
    Query.Open;
    qInsertar.ParamByName('CODIGOAUXILIO').AsString := Codigo;
    with qInsertar do
    begin
      ParamByName('CODIGOODT').AsString := Query.FieldByName('CODIGOODT').AsString;
      ParamByName('CODIGOEMPLEADO').AsString := qPresManoCODIGOEMPLEADO.AsString;
      ParamByName('FECHAINICIO').AsString := FormatoFecha(Query.FieldByName('FECHAINICIO'),true);
      ParamByName('FECHAFIN').AsString := FormatoFecha(Query.FieldByName('FECHAFIN'),true);
      ParamByName('CANTIDADDESAYUNOS').AsString := Query.FieldByName('CANTIDADDESAYUNOS').AsString;
      ParamByName('CANTIDADALMUERZOS').AsString := Query.FieldByName('CANTIDADALMUERZOS').AsString;
      ParamByName('CANTIDADCOMIDAS').AsString := Query.FieldByName('CANTIDADCOMIDAS').AsString;
      ParamByName('CODIGOVEHICULO').AsString := Query.FieldByName('CODIGOVEHICULO').AsString;
    end;
    qInsertar.ExecSQL;
    qInsertar.Close;
    qInsertar.SQL.Clear;
    qInsertar.SQL.Add('INSERT INTO ODTAUXILIODETALLE(CODIGOAUXILIODETALLE,CODIGOAUXILIO,CODIGOIMPUTACIONMANOOBRA,');
    qInsertar.SQL.Add('VALORIMPUTACION,FECHA)');
    qInsertar.SQL.Add('VALUES(:CODIGOAUXILIODETALLE,');
    qInsertar.SQL.Add(':CODIGOAUXILIO,:CODIGOIMPUTACIONMANOOBRA,:VALORIMPUTACION,TO_DATE(:FECHA,''MM/DD/YYYY''))');
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT CODIGOAUXILIO, CODIGOIMPUTACIONMANOOBRA,');
    Query.SQL.Add('VALORIMPUTACION,FECHA FROM ODTAUXILIODETALLE');
    Query.SQL.Add('WHERE CODIGOAUXILIO = ' + CodigoODTAuxilio);
    Query.Open;
    Query.First;
    qSecuencia := TQuery.Create(Application);
    qSecuencia.DatabaseName := 'BaseDato';
    qSecuencia.SQL.Add('SELECT SQ_ODTAUXILIODETALLE.NEXTVAL FROM DUAL');
    while not Query.Eof do
    begin
      with qInsertar do
      begin
        qSecuencia.Close;
        qSecuencia.Open;
        CodigoAux := qSecuencia.Fields[0].AsString;
        Close;
        ParamByName('CODIGOAUXILIODETALLE').AsString := CodigoAux;
        ParamByName('CODIGOAUXILIO').AsString := Codigo;
        ParamByName('CODIGOIMPUTACIONMANOOBRA').AsString := Query.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsString;
        ParamByName('VALORIMPUTACION').AsString := Query.FieldByName('VALORIMPUTACION').AsString;
        ParamByName('FECHA').AsString := FormatoFecha(Query.FieldByName('FECHA'));
        ExecSQL;
      end;
      Query.Next;
    end;

    qInsertar.Free;
    qAuxilio.Close;
    qAuxilio.Open;

    FAuxilio:= TFAuxilio.Create(Application);
    try
      FAuxilio.qAuxilio.Close;
      FAuxilio.qAuxilio.ParamByName('CODIGOODT').AsString:=qPresManoCODIGOODT.AsString;
      FAuxilio.qAuxilio.ParamByName('CODIGOEMPLEADO').AsString:=qPresManoCODIGOEMPLEADO.AsString;
      FAuxilio.qAuxilio.ParamByName('CODIGOAUXILIO').AsString:=Codigo;
      FAuxilio.qAuxilio.Open;
      FAuxilio.qAuxilio.Edit;


      if FAuxilio.ShowModal = mrOk then
      begin
        qAuxilio.Close;
        qAuxilio.Open;
        qAuxilioResumen.Close;
        qAuxilioResumen.Open;
      end
      else
      begin
        if Codigo <> '' then
        begin
          Query.SQL.Clear;
          Query.SQL.Add('DELETE FROM ODTAUXILIODETALLE WHERE CODIGOAUXILIO = ' + Codigo);
          Query.ExecSQL;
          Query.SQL.Clear;
          Query.SQL.Add('DELETE FROM ODTAUXILIO WHERE CODIGOAUXILIO = ' + Codigo);
          Query.ExecSQL;
          qAuxilio.Close;
          qAuxilio.Open;
          qAuxilioResumen.Close;
          qAuxilioResumen.Open;
        end;
      end;
    finally
      FAuxilio.Free;
    end;
    qSecuencia.Free;
    Query.Free;
    qAuxilioResumen.Close;
    qAuxilioResumen.Open;
  end;
end;
//***************************************************************************
//     Guarda el código de viático  de un empleado
//     para permitir copiar los valores del mismo a otro empleado
//***************************************************************************
procedure TfODTPadre.CopiarViaticosClick(Sender: TObject);
begin
  if qViaticoCODIGOVIATICO.AsString <> '' then
    CodigoODTViatico := qViaticoCODIGOVIATICO.AsString;
end;
//***************************************************************************
//     Copia viáticos de un empleado a otro
//***************************************************************************
procedure TfODTPadre.PegarViaticosClick(Sender: TObject);
var Query, qInsertar, qSecuencia: TQuery;
    Codigo, CodigoAux: string;
begin
  if (qViaticoCODIGOVIATICO.AsString <> '') then
  begin
   MessageDlg('Este empleado ya tiene asignado viáticos.' + Chr(13) +
              'No es posible pegar los datos.', mtWarning, [mbOk], 0);
   Exit;
  end;
  if (qPresManoCODIGOEMPLEADO.AsString <> '')and (CodigoODTViatico <> '')then
  begin
    qInsertar := TQuery.Create(Application);
    qInsertar.DatabaseName := 'BaseDato';
    qInsertar.SQL.Add('INSERT INTO ODTVIATICO(CODIGOVIATICO,CODIGOEMPLEADO,CODIGOODT,CODIGOCOMISION,CODIGOZONAORIGEN,CODIGOMUNICIPIODESTINO,');
    qInsertar.SQL.Add('FECHAINICIO,FECHAFIN,USOVEHICULO,CODIGOVEHICULO,VEHICULOOFICIAL,VALORANTICIPO, FECHAPAGOANTICIPO, FECHAPAGOVIATICO, ANTICIPO, PORCENTAJEANTICIPO, DIASPROYECTADOS,CIUDADCAPITAL,DESTINO) ');
    qInsertar.SQL.Add('VALUES(:CODIGOVIATICO,:CODIGOEMPLEADO,:CODIGOODT,:CODIGOCOMISION,:CODIGOZONAORIGEN,:CODIGOMUNICIPIODESTINO,');
    qInsertar.SQL.Add('TO_DATE(:FECHAINICIO,''MM/DD/YYYY HH24:MI:SS''),TO_DATE(:FECHAFIN,''MM/DD/YYYY HH24:MI:SS''),:USOVEHICULO,:CODIGOVEHICULO,:VEHICULOOFICIAL,:VALORANTICIPO, :FECHAPAGOANTICIPO, :FECHAPAGOVIATICO,');
    qInsertar.SQL.Add(':ANTICIPO, :PORCENTAJEANTICIPO, :DIASPROYECTADOS,:CIUDADCAPITAL,:DESTINO)');
    Query := TQuery.Create(Application);
    Query.DatabaseName := 'BaseDato';
    Query.SQL.Add('SELECT SQ_ODTVIATICO.NEXTVAL FROM DUAL');
    Query.Open;
    Codigo := Query.Fields[0].AsString;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT CODIGOODT, CODIGOCOMISION, CODIGOZONAORIGEN,CODIGOMUNICIPIODESTINO,');
    Query.SQL.Add('FECHAINICIO, FECHAFIN,USOVEHICULO,CODIGOVEHICULO,VEHICULOOFICIAL,');
    Query.SQL.Add('VALORANTICIPO, FECHAPAGOANTICIPO, FECHAPAGOVIATICO, ANTICIPO, PORCENTAJEANTICIPO, DIASPROYECTADOS,CIUDADCAPITAL,DESTINO FROM ODTVIATICO');
    Query.SQL.Add('WHERE CODIGOVIATICO = ' + CodigoODTViatico);
    Query.Open;
    qInsertar.ParamByName('CODIGOVIATICO').AsString := Codigo;
    with qInsertar do
    begin
      ParamByName('CODIGOODT').AsString := Query.FieldByName('CODIGOODT').AsString;
      ParamByName('CODIGOEMPLEADO').AsString := qPresManoCODIGOEMPLEADO.AsString;
      ParamByName('CODIGOCOMISION').AsString := Query.FieldByName('CODIGOCOMISION').AsString;
      ParamByName('CODIGOZONAORIGEN').AsString := Query.FieldByName('CODIGOZONAORIGEN').AsString;
      ParamByName('CODIGOMUNICIPIODESTINO').AsString := Query.FieldByName('CODIGOMUNICIPIODESTINO').AsString;
      ParamByName('FECHAINICIO').AsString := FormatoFecha(Query.FieldByName('FECHAINICIO'),true);
      ParamByName('FECHAFIN').AsString := FormatoFecha(Query.FieldByName('FECHAFIN'),true);
      ParamByName('USOVEHICULO').AsString := Query.FieldByName('USOVEHICULO').AsString;
      ParamByName('CODIGOVEHICULO').AsString := Query.FieldByName('CODIGOVEHICULO').AsString;
      ParamByName('VEHICULOOFICIAL').AsString := Query.FieldByName('VEHICULOOFICIAL').AsString;
      ParamByName('VALORANTICIPO').AsFloat := Query.FieldByName('VALORANTICIPO').AsFloat;
      ParamByName('FECHAPAGOANTICIPO').AsString := Query.FieldByName('FECHAPAGOANTICIPO').AsString;
      ParamByName('FECHAPAGOVIATICO').AsString := Query.FieldByName('FECHAPAGOVIATICO').AsString;
      ParamByName('ANTICIPO').AsString := Query.FieldByName('ANTICIPO').AsString;
      ParamByName('PORCENTAJEANTICIPO').AsString := Query.FieldByName('PORCENTAJEANTICIPO').AsString;
      ParamByName('DIASPROYECTADOS').AsString := Query.FieldByName('DIASPROYECTADOS').AsString;
      ParamByName('CIUDADCAPITAL').AsString := Query.FieldByName('CIUDADCAPITAL').AsString;
      ParamByName('DESTINO').AsString := Query.FieldByName('DESTINO').AsString;
    end;
    qInsertar.ExecSQL;
    qInsertar.Close;
    qInsertar.SQL.Clear;
    qInsertar.SQL.Add('INSERT INTO ODTVIATICODETALLE VALUES(:CODIGOVIATICODETALLE,');
    qInsertar.SQL.Add(':CODIGOVIATICO,:CODIGOIMPUTACIONMANOOBRA,:VALORIMPUTACION)');
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT CODIGOVIATICO, CODIGOIMPUTACIONMANOOBRA,');
    Query.SQL.Add('VALORIMPUTACION FROM ODTVIATICODETALLE');
    Query.SQL.Add('WHERE CODIGOVIATICO = ' + CodigoODTViatico);
    Query.Open;
    Query.First;
    qSecuencia := TQuery.Create(Application);
    qSecuencia.DatabaseName := 'BaseDato';
    qSecuencia.SQL.Add('SELECT SQ_ODTVIATICODETALLE.NEXTVAL FROM DUAL');
    while not Query.Eof do
    begin
      with qInsertar do
      begin
        qSecuencia.Close;
        qSecuencia.Open;
        CodigoAux := qSecuencia.Fields[0].AsString;
        Close;
        ParamByName('CODIGOVIATICODETALLE').AsString := CodigoAux;
        ParamByName('CODIGOVIATICO').AsString := Codigo;
        ParamByName('CODIGOIMPUTACIONMANOOBRA').AsString := Query.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsString;
        ParamByName('VALORIMPUTACION').AsString := Query.FieldByName('VALORIMPUTACION').AsString;
        ExecSQL;
      end;
      Query.Next;
    end;
    qInsertar.Close;
    qInsertar.SQL.Clear;
    qInsertar.SQL.Add('INSERT INTO ODTVIATICODETALLETIQUETE VALUES(:CODIGOVIATICODETALLETIQUETE,');
    qInsertar.SQL.Add(':CODIGOVIATICO,:CODIGOTIPOTIQUETE,:NUMEROTIQUETE,:VALORTIQUETE)');
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT CODIGOVIATICO, CODIGOTIPOTIQUETE,NUMEROTIQUETE,');
    Query.SQL.Add('VALORTIQUETE FROM ODTVIATICODETALLETIQUETE');
    Query.SQL.Add('WHERE CODIGOVIATICO = ' + CodigoODTViatico);
    Query.Open;
    Query.First;
    qSecuencia := TQuery.Create(Application);
    qSecuencia.DatabaseName := 'BaseDato';
    qSecuencia.SQL.Add('SELECT SQ_ODTVIATICODETALLETIQUETE.NEXTVAL FROM DUAL');
    while not Query.Eof do
    begin
      with qInsertar do
      begin
        qSecuencia.Close;
        qSecuencia.Open;
        CodigoAux := qSecuencia.Fields[0].AsString;
        Close;
        ParamByName('CODIGOVIATICODETALLETIQUETE').AsString := CodigoAux;
        ParamByName('CODIGOVIATICO').AsString := Codigo;
        ParamByName('CODIGOTIPOTIQUETE').AsString := Query.FieldByName('CODIGOTIPOTIQUETE').AsString;
        ParamByName('NUMEROTIQUETE').AsString := Query.FieldByName('NUMEROTIQUETE').AsString;
        ParamByName('VALORTIQUETE').AsString := Query.FieldByName('VALORTIQUETE').AsString;
        ExecSQL;
      end;
      Query.Next;
    end;
    qSecuencia.Free;
    Query.Free;
    qInsertar.Free;
    qViatico.Close;
    qViatico.Open;
    qViaticoResumen.Close;
    qViaticoResumen.Open;
  end;
end;

procedure TfODTPadre.qODTFECHAFINALValidate(Sender: TField);
var query:tquery;
begin
  inherited;
  if dbEdFechaFinEstimada.Text='' then
    raise exception.create('Debe ingresar la Fecha Final Estimada');

  query:=tquery.create(self);
  query.databasename:='BaseDato';
  if (Sender.Text <> '' ) then
  begin
    if (Sender.AsDateTime < qODTFECHAAPROBACION.AsDateTime) then
      raise Exception.Create('La Fecha de Finalización de Trabajo No Puede Ser Menor que La Fecha de aprobación.');
    if  (Sender.AsDateTime < qODTFECHAASIGNACION.AsDateTime) then
      raise Exception.Create('La Fecha de Finalización de Trabajo No Puede Ser Menor que La Fecha de Asignación de Trabajo.');
    if  (Sender.AsDateTime < qODTFECHAINICIO.AsDateTime) then
      raise Exception.Create('La Fecha de Finalización de Trabajo No Puede Ser Menor que La Fecha de Inicio de Trabajo.');
    query.sql.clear;
    query.sql.add('select count(*) from odtdia where codigoodt='+qODTCODIGOODT.AsString);
    query.sql.add('and fechafinaltrabajo is null AND NOT CODIGOESTADOODTDIA = ''7'' ');
    query.open;
    if query.fields[0].Asinteger>0 then
    begin
      query.close;
      Query.free;
      raise exception.create('Existen trabajos de esta ODT sin fecha final, debe ingresar estas fechas primero.');
    end;
  end;

  query.sql.clear;
  query.sql.add('SELECT * FROM ODTVIATICO V,ODTVIATICODETALLE VD,IMPUTACIONMANOOBRA IMO ');
  query.sql.add('WHERE V.CODIGOODT='+qODTCODIGOODT.AsString+' AND (V.VALORANTICIPO IS NULL)');
  query.sql.add('AND V.CODIGOVIATICO=VD.CODIGOVIATICO ');
  query.sql.add('AND IMO.CODIGOIMPUTACIONMANOOBRA=VD.CODIGOIMPUTACIONMANOOBRA ');
  query.sql.add('AND IMO.CODIGOTIPOIMPUTACIONODT=''V''');
  query.open;
  if not query.IsEmpty then
  begin
    if Trunc(qODTFECHAFINALESTIMADA.AsDateTime)<> Trunc(Sender.AsDatetime) then
    begin
      Query.Close;
      Application.MessageBox('Las fechas de terminación real y estimada de la odt son diferentes','Viáticos',MB_ICONWARNING)
    end;
  end;

  if qODTSobreTiempo.RecordCount>0 then
  begin
    query.sql.clear;
    query.sql.add('SELECT MAX(FECHAHORAHASTA) FROM ODTSOBRETIEMPODETALLE WHERE CODIGOODT='+qODTCODIGOODT.AsString);
    query.open;
    if query.fields[0].AsDateTime<Sender.AsDateTime then
    begin
      query.Close;
      query.Free;
      raise Exception.Create('No puede cambiar La Fecha final puesto que hay '+ #13+
      'mano de obra con horas extras asignadas desde esta fecha');
    end;
    query.free;
  end;
end;

procedure TfODTPadre.qODTFECHAINICIOValidate(Sender: TField);
var query:tquery;
begin
  inherited;
  //Inicio-Validación fechas
  if (Sender.Text <> '' ) and (Sender.AsDateTime < qODTFECHAAPROBACION.AsDateTime) then
    raise Exception.Create('La Fecha de Inicio de Trabajo No Puede Ser Menor que La Fecha de aprobación.');
  if (Sender.Text <> '' ) and (Sender.AsDateTime < qODTFECHAASIGNACION.AsDateTime) then
    raise Exception.Create('La Fecha de Inicio de Trabajo No Puede Ser Menor que La Fecha de Asignación de Trabajo.');
  if (Sender.Text <> '' ) and (qODTFECHAFINAL.AsString<>'') then
  begin
    if (Sender.AsDateTime > qODTFECHAFINAL.AsDateTime) then
     raise Exception.Create('La Fecha de Inicio de Trabajo No Puede Ser Mayor que La Fecha de final de Trabajo.');
  end;
  if  fechaservidoractual = 0 then  fechaservidoractual:= fechaservidor;
  if (Sender.Text <> '' ) and (Sender.AsDateTime < fechaservidoractual) and (VERIFICARODTPERMISOSEDITAR('ODTFECHAANTERIOR') = false) then
    raise Exception.Create('La Fecha de Inicio de Trabajo ('+ Sender.Text +') No Puede Ser Menor que La Fecha actual del sistema ('+datetimetostr(fechaservidor)+').');


  //Fin-Validación fechas
  query:=tquery.create(self);
  query.databasename:='BaseDato';
  if qViaticoResumen.RecordCount>0 then
  begin
    query.sql.clear;
    query.sql.add('SELECT MIN(FECHAINICIO) FROM ODTVIATICO WHERE CODIGOODT='+qODTCODIGOODT.AsString+' AND (VALORANTICIPO IS NULL)');
    query.open;
    if (query.recordcount>0)and (query.fields[0].asstring<>'') then
    begin
      if query.fields[0].AsDateTime<Sender.AsDateTime then
      begin
        query.free;
        raise Exception.Create('No puede cambiar La Fecha de Inicio puesto que hay '+ #13+
        'mano de obra con viáticos asignados desde esta fecha');
      end;
    end;
  end;
  if qAuxilioResumen.RecordCount>0 then
  begin
    query.sql.clear;
    query.sql.add('SELECT MIN(FECHAINICIO) FROM ODTAUXILIO WHERE CODIGOODT='+qODTCODIGOODT.AsString);
    query.open;
    if query.fields[0].AsDateTime<Sender.AsDateTime then
    begin
      Query.close;
      query.free;
      raise Exception.Create('No puede cambiar La Fecha de Inicio puesto que hay '+ #13+
      'mano de obra con auxilios asignados desde esta fecha');
    end;
    query.free;
  end;
  if qODTSobreTiempo.RecordCount>0 then
  begin
    query.sql.clear;
    query.sql.add('SELECT MIN(FECHAHORADESDE) FROM ODTSOBRETIEMPODETALLE WHERE CODIGOODT='+qODTCODIGOODT.AsString);
    query.open;
    if query.fields[0].AsDateTime<Sender.AsDateTime then
    begin
      Query.close;
      query.free;
      raise Exception.Create('No puede cambiar La Fecha de Inicio puesto que hay '+ #13+
      'mano de obra con horas extras asignadas desde esta fecha');
    end;
    query.free;
  end;
end;

procedure TfODTPadre.qODTCODIGOMUNICIPIOValidate(Sender: TField);
begin
  inherited;
  if qviatico.RecordCount>0 then
    raise Exception.Create('No puede cambiar el municipio de destino puesto que hay '+ #13+
    'mano de obra con viáticos asignados para este municipio de destino');
  if qAuxilio.RecordCount>0 then
    raise Exception.Create('No puede cambiar el municipio de destino puesto que hay '+ #13 +
    'mano de obra con auxilios asignados para este municipio de destino');
end;

procedure TfODTPadre.qODTCODIGOZONAORIGENValidate(Sender: TField);
var query:tquery;
begin
  inherited;
  if qODTCODIGOODT.AsString<>'' then
  begin
    raise Exception.Create('No puede cambiar la zona de origen puesto que '+ #13+
     'ya se generó un código de Odt para esta zona');
  end;
  if qviatico.RecordCount>0 then
    raise Exception.Create('No puede cambiar la zona de origen puesto que hay '+ #13+
    'mano de obra con viáticos asignados para esta zona de origen');
  if qAuxilio.RecordCount>0 then
    raise Exception.Create('No puede cambiar la zona de origen puesto que hay '+ #13+
    'mano de obra con auxilios asignados para esta zona de origen');
end;

procedure TfODTPadre.qODTCODIGOODTTIPOMANOOBRAValidate(Sender: TField);
begin
  if sender<>nil then
  begin
    if qPresMano.RecordCount>0 then
      raise exception.Create('No puede cambiar el tipo de mano de obra '+ chr(13)+
      'puesto que ya hay mano de obra asignada');
    if dsODT.DataSet.State in [dsInsert, dsEdit] then
    begin
      dsODT.DataSet.FieldByName('CODIGOEJECUTOR').Value := Null;
      EdEjecutado.Text:='';
    end;
  end;
  if qODTCODIGOODTTIPOMANOOBRA.AsInteger=2 then
  begin
    gbHorarioTrabajo.Enabled := False;
    PanelViaticos.Enabled := False;
    PanelAuxilios.Enabled := False;
    PanelExtras.Enabled := False;
    dbeContratista.Enabled := True;
    dblcContratista.Enabled := True;
    qContratista.close;
    qcontratista.open;
    dbeContrato.Enabled:= true;
    sbBuscarcontrato.Enabled:= False;
  end
  else
  begin
    if dsODT.DataSet.State in [dsInsert, dsEdit] then
    Begin
      dsODT.DataSet.FieldByName('CODIGOCONTRATISTA').Value := Null;
    end;
    qODTNUMEROCONTRATO.asstring := '';
    dbeContrato.Enabled:= false;
    gbHorarioTrabajo.Enabled := True;
    dbeContratista.Enabled := False;
    dblcContratista.Enabled:= False;
    dbeContrato.Enabled:= False;
    sbBuscarcontrato.Enabled:= False;
    DBGridManoObra.Enabled := True;
    AgregarAnticipo1.Visible:=False;
    PanelViaticos.Enabled := True;
    
    if ValidarHijasTerminadas then
    begin
      PanelAuxilios.Enabled := True;
      PanelExtras.Enabled := True;
      PanelAuxilios.ShowHint:=false;
      PanelExtras.ShowHint:=false;
    end
    else
    begin
      PanelAuxilios.Enabled := false;
      PanelExtras.Enabled := false;
      PanelAuxilios.ShowHint:=true;
      PanelExtras.ShowHint:=true;
    end;

  end;
end;

procedure TfODTPadre.qODTCODIGOCONTRATISTAValidate(Sender: TField);
begin
  if sender.AsString<>'' then
  begin
    if qPresMano.RecordCount>0 then
      raise exception.Create('No puede cambiar el tipo de mano de obra '+ chr(13)+
      'puesto que ya hay mano de obra asignada');
    if dsODT.DataSet.State in [dsInsert, dsEdit] then
    begin
      dsODT.DataSet.FieldByName('CODIGOEJECUTOR').Value := Null;
      EdEjecutado.Text:='';
    end;
  end;
end;

procedure TfODTPadre.FormDestroy(Sender: TObject);
var i:integer;
pformaimprimir:^TfQRODTPadreMateriales;
begin
  try
    if FViatico<>nil then
    begin
      FViatico.Free;
      FViatico:=nil;
    end;
    if fQRAuxilio<>nil then
    begin
      fQRAuxilio.Free;
      fQRAuxilio:=nil;
    end;
    if fQRAuxilioCopia<>nil then
    begin
      fQRAuxilioCopia.Free;
      fQRAuxilioCopia:=nil;
    end;
    if fQRAuxilioIndividual<>nil then
    begin
      fQRAuxilioIndividual.Free;
      fQRAuxilioIndividual:=nil;
    end;
    if fQRAuxilioIndividualCopia<>nil then
    begin
      fQRAuxilioIndividualCopia.Free;
      fQRAuxilioIndividualCopia:=nil;
    end;
    if listaforms <>nil then
    begin
      for i:=listaforms.Count-1 downto 0 do
      begin
        pformaimprimir:=listaforms[i];
        listaforms.Delete(i);
        pformaimprimir.free;
      end;
      listaforms.free;
    end;
  except
  end;
  DepuracionRegistrosErroneos;
  inherited;
end;

procedure TfODTPadre.EditarViaticos1Click(Sender: TObject);
begin
  inherited;
  if qPresManoCODIGOEMPLEADO.AsString <> '' then
  begin
    //if ((qODTCODIGOMUNICIPIO.AsString<>'') and (qODTCODIGOZONAORIGEN.AsString<>''))
    if ((qODTCODIGOMUNICIPIO.AsString<>'') and (qODTCODIGOMUNICIPIOORIGEN.AsString<>'') and (qODTCODIGOZONAORIGEN.AsString<>''))
      or (qODTCODIGOAREAINFLUENCIA.AsString='2') then
    begin
      {if (qZonaCODIGOZONA.Asinteger<>8)and(qMunicipioCODIGOMUNICIPIO.AsString <> qZonaCODIGOMUNICIPIOBASE.AsString) then
      begin}
        if (qODTFECHAINICIO.AsString<>'') and (qODTFECHAFINALESTIMADA.AsString<>'') then
        begin
          FViatico:=TFViatico.Create(Application);
          try
            PoblarTablasTemporalesViaticos;
            FViatico.qViatico.Close;
            FViatico.qViatico.DataSource:=dsPresMano;
            FViatico.qViatico.Open;
            FViatico.qViatico.Edit;
            if (FViatico.ShowModal=mrOk)or not(FViatico.modificado) then
            begin
              qViatico.Close;
              qViatico.Open;
              qViaticoResumen.Close;
              qViaticoResumen.Open;
            end
            else
            begin
             EscribirTablasTemporalesViaticos;
            end;
          except
            on e:exception do
            begin
              showmessage(e.message);
            end;
          end;
          FViatico.Free;
        end
        else
          Application.MessageBox(PChar('No se pueden editar viáticos si no ha ingresado las fechas inicial y final de la ODT'),PChar('Error'),MB_OK);
      {end
      else
        Application.MessageBox(PChar('No se pueden editar viáticos hacia el municipio base de la misma zona.'),PChar('Error'),MB_OK);}
    end
    else
      Application.MessageBox(PChar('No se pueden editar viáticos si no ha ingresado'+ #13 + 'la zona de origen y el municipio de destino'),PChar('Error'),MB_OK);
  end;
end;

procedure TfODTPadre.AgregarViaticos1Click(Sender: TObject);
var Query: TQuery;
    Codigo, ODTS: string;
    bm:TBookmark;
    origen, destino:integer;
begin
  inherited;
  if qMunicipioCODIGOZONA.AsInteger = qMunicipioOrigenCODIGOZONA.AsInteger then
  begin
    if (qMunicipioOrigenZONAESPECIAL.AsString = 'S') and (qMunicipioZONAESPECIAL.AsString = 'S') then
      raise exception.Create('Municipios Especiales en la misma zona')
    else if (qMunicipioOrigenZONAESPECIAL.AsString = 'S') and (qMunicipioZONAESPECIAL.AsString = 'N') then
      raise exception.Create('Municipio Origen '+qMunicipioOrigenNOMBREMUNICIPIO.AsString+' SOLO Auxilios de Alimentación.')
    else if (qMunicipioOrigenZONAESPECIAL.AsString = 'N') and (qMunicipioZONAESPECIAL.AsString = 'S') then
      raise exception.Create('Municipio Destino '+qMunicipioNOMBREMUNICIPIO.AsString+' SOLO Auxilios de Alimentación.')
    else if (qMunicipioOrigenZONAESPECIAL.AsString = 'S') and (qMunicipioZONAESPECIAL.AsString = 'P') then
      raise exception.Create('Municipio Origen '+qMunicipioOrigenNOMBREMUNICIPIO.AsString+' SOLO Auxilios de Alimentación.')
    else if (qMunicipioOrigenZONAESPECIAL.AsString = 'P') and (qMunicipioZONAESPECIAL.AsString = 'S') then
      raise exception.Create('Municipio Destino '+qMunicipioNOMBREMUNICIPIO.AsString+' SOLO Auxilios de Alimentación.')
  end;

  if qODTCODIGOAREAINFLUENCIA.asstring <> '2' then
  Begin
    if ((qODTCODIGOMUNICIPIO.AsString = '') or (qODTCODIGOMUNICIPIOORIGEN.AsString = ''))  then
      raise exception.create('Se requiere registrar los municipios origen y destino de la ODT.');

    Query := TQuery.Create(Application);
    Query.DatabaseName := 'BaseDato';
    Query.sql.text:= 'Select codigomunicipiobase from zonaessa where codigozona =  '+ qMunicipioCODIGOZONA.Asstring;
    Query.open;
    destino:= Query.fieldbyname('codigomunicipiobase').asinteger;
    Query.close;
    Query.sql.text:= 'Select codigomunicipiobase from zonaessa where codigozona =  '+ qMunicipioOrigencodigozona.Asstring;
    Query.open;
    origen:= Query.fieldbyname('codigomunicipiobase').asinteger;
    Query.close;
    Query.free;

    if ( ((qMunicipioCODIGOZONA.AsInteger) = (qMunicipioOrigencodigozona.asinteger)) and  ((destino <>  qMunicipioCODIGOMUNICIPIO.asinteger)
       and ( origen <> qMunicipioOrigencodigomunicipio.asinteger))) then
    Begin
      raise exception.Create('Si el municipio origen y el municipio destino pertenecen a la misma zona y estos dos no son cabecera de Zona, se debe pagar Auxilio de alimentación y no viatico');
    End;

    if ( ((qMunicipioCODIGOZONA.AsInteger) = (qMunicipioOrigencodigozona.asinteger)) and  ((destino <>  qMunicipioCODIGOMUNICIPIO.asinteger)
       and ( origen <> qMunicipioOrigencodigomunicipio.asinteger))) then
    Begin
      raise exception.Create('Si el municipio origen y el municipio destino pertenecen a la misma zona y estos dos no son cabecera de Zona, se debe pagar Auxilio de alimentación y no viatico');
    End;
  end;
  
  ODTS:='';
  if (qODT.State in [dsEdit,dsInsert]) and qODT.CachedUpdates then
  begin
    try
      bm:=qPresMano.GetBookmark;
      qODT.Post;
      qODT.Edit;
      qPresMano.GotoBookmark(bm);
    except
    end;
  end;
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';

  if qPresManoCODIGOEMPLEADO.AsString <> '' then
  begin
    if ((qODTCODIGOMUNICIPIO.AsString<>'') and (qODTCODIGOZONAORIGEN.AsString<>'') and (qODTCODIGOMUNICIPIOORIGEN.AsString<>''))
       or (qODTCODIGOAREAINFLUENCIA.AsString='2') then
    begin
      {if (qZonaCODIGOZONA.Asinteger<>8)and(qMunicipioCODIGOMUNICIPIO.AsString <> qZonaCODIGOMUNICIPIOBASE.AsString) then
      begin }
        if (qODTFECHAINICIO.AsString<>'') and (qODTFECHAFINALESTIMADA.AsString<>'') then
        begin
          if not GetODTS_SinConciliacionDeViaticos(qPresManoCODIGOEMPLEADO.AsString, ODTS) then
          begin
            FViatico:= TFViatico.Create(Application);
            try
              FViatico.qViatico.Close;
              FViatico.qViatico.ParamByName('CODIGOODT').AsString:=qPresManoCODIGOODT.AsString;
              FViatico.qViatico.ParamByName('CODIGOEMPLEADO').AsString:=qPresManoCODIGOEMPLEADO.AsString;
              FViatico.qViatico.Open;
              FViatico.qViatico.Insert;
              FViatico.qViatico.FieldByName('CODIGOMUNICIPIODESTINO').AsString:=qODTCODIGOMUNICIPIO.AsString;
              FViatico.qViatico.FieldByName('CODIGOMUNICIPIOORIGEN').AsString:=qODTCODIGOMUNICIPIOORIGEN.AsString;
              FViatico.qViatico.FieldByName('CODIGOZONAORIGEN').AsString:=qODTCODIGOZONAORIGEN.AsString;
              FViatico.qViatico.FieldByName('FECHAINICIO').AsDateTime:=qODTFECHAINICIO.AsDateTime;
              FViatico.qViatico.FieldByName('TIPOVIATICO').AsString:='V';
              FViatico.qViatico.Post;
              FViatico.qViatico.Close;
              FViatico.qViatico.ParamByName('CODIGOODT').AsString:=qPresManoCODIGOODT.AsString;
              FViatico.qViatico.ParamByName('CODIGOEMPLEADO').AsString:=qPresManoCODIGOEMPLEADO.AsString;
              FViatico.qViatico.Open;
              FViatico.qViatico.Edit;
              FViatico.qViatico.FieldByName('FECHAFIN').AsDateTime:=qODTFECHAFINALESTIMADA.AsDateTime;
              Codigo := FViatico.qViaticoCODIGOVIATICO.AsString;
              if FViatico.ShowModal = mrOk then
              begin
                qViatico.Close;
                qViatico.Open;
                qViaticoResumen.Close;
                qViaticoResumen.Open;
              end
              else
              begin
                if Codigo <> '' then
                begin
                  Query.SQL.Clear;
                  Query.SQL.Add('DELETE FROM ODTVIATICODETALLE WHERE CODIGOVIATICO = ' + Codigo);
                  Query.ExecSQL;
                  Query.SQL.Clear;
                  Query.SQL.Add('DELETE FROM ODTVIATICO WHERE CODIGOVIATICO = ' + Codigo);
                  Query.ExecSQL;
                  qViatico.Close;
                  qViatico.Open;
                  qViaticoResumen.Close;
                  qViaticoResumen.Open;
                end;
              end;
            except
              on e:exception do
              begin
                showmessage(e.message);
                try
                  Query.SQL.Clear;
                  Query.SQL.Add('DELETE FROM ODTVIATICODETALLE WHERE CODIGOVIATICO IN(SELECT CODIGOVIATICO FROM ODTVIATICO WHERE CODIGOODT='+qODTCODIGOODT.Asstring);
                  Query.SQL.Add('AND CODIGOEMPLEADO='+qPresManoCODIGOEMPLEADO.AsString+')');
                  Query.ExecSQL;
                  Query.SQL.Clear;
                  Query.SQL.Add('DELETE FROM ODTVIATICODETALLETIQUETE WHERE CODIGOVIATICO IN(SELECT CODIGOVIATICO FROM ODTVIATICO WHERE CODIGOODT='+qODTCODIGOODT.Asstring);
                  Query.SQL.Add('AND CODIGOEMPLEADO='+qPresManoCODIGOEMPLEADO.AsString+')');
                  Query.ExecSQL;
                  Query.SQL.Clear;
                  Query.SQL.Add('DELETE FROM ODTVIATICO WHERE CODIGOODT='+qODTCODIGOODT.Asstring+' AND CODIGOEMPLEADO='+qPresManoCODIGOEMPLEADO.AsString);
                  Query.ExecSQL;
                except
                end;
              end;
            end;
            FViatico.Free;
          end
          else
           Application.MessageBox(PChar('No se pueden agregar viáticos por que existen viáticos'+chr(13)+'sin conciliación en las ODTs:  '+ODTS),PChar('Error'),MB_OK);
        end
        else
          Application.MessageBox(PChar('No se pueden editar viáticos si no ha ingresado las fechas inicial y final estimada de la ODT'),PChar('Error'),MB_OK);
      {end
      else
        Application.MessageBox(PChar('No se pueden editar viáticos hacia el municipio base de la misma zona.'),PChar('Error'),MB_OK);  }
    end
    else
      Application.MessageBox(PChar('No se pueden editar viáticos si no ha ingresado'+ #13 + 'la zona de origen y el municipio de destino'),PChar('Error'),MB_OK);
  end
  else
    Application.MessageBox(PChar('No ha ingresado la mano de obra asociada'),PChar('Error'),MB_OK);

  Query.Free;
end;

procedure TfODTPadre.EditarAnticipo1Click(Sender: TObject);
var
  qConsulta:Tquery;
  permiso:integer;
begin
  inherited;
  if qPresManoCODIGOEMPLEADO.AsString <> '' then
  begin
    if ((qODTCODIGOMUNICIPIO.AsString<>'') and (qODTCODIGOZONAORIGEN.AsString<>''))
      or (qODTCODIGOAREAINFLUENCIA.AsString='2') then
    begin
      if (qZonaCODIGOZONA.Asinteger<>8)and(qMunicipioCODIGOMUNICIPIO.AsString <> qZonaCODIGOMUNICIPIOBASE.AsString) then
      begin
        try
          FAnticipoViatico:=TFAnticipoViatico.Create(Application);
          qConsulta := TQuery.Create(Application);
          qConsulta.DatabaseName := 'BaseDato';
          qConsulta.sql.add('SELECT IMPRESOANTICIPO FROM ODTVIATICO WHERE CODIGOVIATICO = ' + qViaticoCODIGOVIATICO.AsString);
          qConsulta.open;
          if (qconsulta.fieldbyname('IMPRESOANTICIPO').asstring = 'S') then
          Begin
            FAnticipoViatico.sbImprimir.Enabled:= false;
            FAnticipoViatico.bbAceptar.Enabled:= false;
            FAnticipoViatico.PanelEncabezado.Enabled:=false;
          end;
          qconsulta.free;

          PoblarTablasTemporalesViaticos;
          FAnticipoViatico.qViatico.Close;
          FAnticipoViatico.qViatico.DataSource:=dsPresMano;
          FAnticipoViatico.qViatico.Open;
          FAnticipoViatico.qViatico.Edit;
          if (FAnticipoViatico.ShowModal=mrOk)or not(FAnticipoViatico.modificado) then
          begin
            qViatico.Close;
            qViatico.Open;
            qViaticoResumen.Close;
            qViaticoResumen.Open;
          end
          else
          begin
            EscribirTablasTemporalesViaticos;
          end;
        finally
          FAnticipoViatico.Free;
          GuardarTransaccion;
        end
      end  
      else
        Application.MessageBox(PChar('No se pueden editar viáticos hacia el municipio base de la misma zona.'),PChar('Error'),MB_OK);
    end
    else
      Application.MessageBox(PChar('No se pueden editar viáticos si no ha ingresado'+ #13 + 'la zona de origen y el municipio de destino'),PChar('Error'),MB_OK);
  end;
end;

procedure TfODTPadre.AgregarAnticipo1Click(Sender: TObject);
var Query: TQuery;
    Codigo: string;
    bm:TBookmark;
begin
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  if (qODT.State in [dsEdit,dsInsert]) and qODT.CachedUpdates then
  begin
    try
      bm:=qPresMano.GetBookmark;
      qODT.Post;
      qODT.Edit;
      qPresMano.GotoBookmark(bm);
    except
    end;
  end;
  if qPresManoCODIGOEMPLEADO.AsString <> '' then
  begin
    if ((qODTCODIGOMUNICIPIO.AsString<>'') and (qODTCODIGOZONAORIGEN.AsString<>'') and (qODTCODIGOMUNICIPIOORIGEN.AsString<>''))
      or (qODTCODIGOAREAINFLUENCIA.AsString='2') then
    begin
      if (qZonaCODIGOZONA.Asinteger<>8)and(qMunicipioCODIGOMUNICIPIO.AsString <> qZonaCODIGOMUNICIPIOBASE.AsString) then
      begin
        try
          FAnticipoViatico:= TFAnticipoViatico.Create(Application);
          FAnticipoViatico.qViatico.Close;
          FAnticipoViatico.qViatico.DataSource:=dsPresMano;
          FAnticipoViatico.qViatico.Open;
          FAnticipoViatico.qViatico.Insert;
          FAnticipoViatico.qViatico.FieldByName('CODIGOMUNICIPIODESTINO').AsString:=qODTCODIGOMUNICIPIO.AsString;
          FAnticipoViatico.qViatico.FieldByName('CODIGOMUNICIPIOORIGEN').AsString:=qODTCODIGOMUNICIPIOORIGEN.AsString;
          FAnticipoViatico.qViatico.FieldByName('CODIGOZONAORIGEN').AsString:=qODTCODIGOZONAORIGEN.AsString;
          if (qODTFECHAINICIO.Asstring<>'') then
          begin
            FAnticipoViatico.qViatico.FieldByName('FECHAINICIO').AsDateTime:=qODTFECHAINICIO.AsDateTime;
            FAnticipoViatico.qViatico.FieldByName('FECHAFIN').AsDateTime:=qODTFECHAINICIO.AsDateTime;
          end
          else
          begin
            FAnticipoViatico.qViatico.FieldByName('FECHAINICIO').AsDateTime:=qODTFECHAASIGNACION.AsDateTime;
            FAnticipoViatico.qViatico.FieldByName('FECHAFIN').AsDateTime:=qODTFECHAASIGNACION.AsDateTime;
          end;

          FAnticipoViatico.qViatico.Post;

          FAnticipoViatico.qViatico.Close;
          FAnticipoViatico.qViatico.Open;
          FAnticipoViatico.qViatico.Edit;
          FAnticipoViatico.qViaticoVALORANTICIPO.AsFloat:=trunc(FAnticipoViatico.qViaticoDiarioVALORVIATICO.AsFloat
          *qViaticoDIASPROYECTADOS.AsInteger*qViaticoPORCENTAJEANTICIPO.asfloat/100);
          Codigo := FAnticipoViatico.qViaticoCODIGOVIATICO.AsString;
          FAnticipoViatico.bbAceptar.enabled:= true;
          if FAnticipoViatico.ShowModal = mrOk then
          begin
            {if  FAnticipoViatico.Imprimio then
              GuardarTransaccion;   }
            qViatico.Close;
            qViatico.Open;
            qViaticoResumen.Close;
            qViaticoResumen.Open;
          end
          else
          begin
            if  FAnticipoViatico.Imprimio then
              GuardarTransaccion
            else
            begin
              if Codigo <> '' then
              begin
                Query.SQL.Clear;
                Query.sql.add('SELECT CODIGOVIATICO FROM ODTVIATICO WHERE IMPRESOANTICIPO = ''S'' AND CODIGOVIATICO = ' + Codigo);
                Query.open;
                if Query.RecordCount =0 then
                Begin
                  Query.SQL.Clear;
                  Query.SQL.Add('DELETE FROM ODTVIATICODETALLE WHERE CODIGOVIATICO = ' + Codigo);
                  Query.ExecSQL;
                  Query.SQL.Clear;
                  Query.SQL.Add('DELETE FROM ODTVIATICODETALLETIQUETE WHERE CODIGOVIATICO = ' + Codigo);
                  Query.ExecSQL;
                  Query.SQL.Clear;
                  Query.SQL.Add('DELETE FROM ODTVIATICO WHERE CODIGOVIATICO = ' + Codigo);
                  Query.ExecSQL;
                end;
                Query.close;

                qViatico.Close;
                qViatico.Open;
                qViaticoResumen.Close;
                qViaticoResumen.Open;
              end;
            end;
          end;
        finally
          FAnticipoViatico.Free;
        end;
      end
      else
        Application.MessageBox(PChar('No se pueden editar viáticos hacia el municipio base de la misma zona.'),PChar('Error'),MB_OK);

    end
    else
      Application.MessageBox(PChar('No se pueden editar viáticos si no ha ingresado'+ #13 + 'la zona de origen y el municipio de destino'),PChar('Error'),MB_OK);
  end
  else
    Application.MessageBox(PChar('No ha ingresado la mano de obra asociada'),PChar('Error'),MB_OK);
  Query.Free;
end;

procedure TfODTPadre.qODTCODIGOAREAINFLUENCIAValidate(Sender: TField);
begin
  inherited;
  if (Sender.Asstring ='0') or (Sender.Asstring ='1') then
  begin
    sbCigMunicipio.Enabled:=true;
    dbEdNombreMunicipio.Enabled:=true;
  end
  else
  begin
    sbCigMunicipio.Enabled:=false;
    dbEdNombreMunicipio.Enabled:=false;
    if qODT.State in [dsEdit,dsInsert] then
    begin
      if qODTCODIGOMUNICIPIO.AsString<>'' then
        qODTCODIGOMUNICIPIO.AsString:='';
    end;
  end;
  if old_areainfluencia<>Sender.asstring then
  begin
    if qViaticoResumen.Active then
      if not(qViaticoResumen.IsEmpty) then
        raise exception.create('No puede modificar este campo porque existen viáticos para esta área de influencia');
    if qAuxilioResumen.Active then
      if not(qAuxilioResumen.IsEmpty) then
        raise exception.create('No puede modificar este campo porque existen auxilios para esta área de influencia');
  end;
end;
//***************************************************************************
//    Imprime formato anterior parte de atrás odt padre
//***************************************************************************
procedure TfODTPadre.PartePosteriorFormatoAnteriorClick(Sender: TObject);
begin
  fQRODTPadreAtras:=TfQRODTPadreAtras.Create(Application);
  try
    fQRODTPadreAtras.QuickRep1.Preview;
  except
    fQRODTPadreAtras.Free;
  end;
end;
//***************************************************************************
//    Imprime vale de materiales
//***************************************************************************
procedure TfODTPadre.ValeMateriales1Click(Sender: TObject);
begin
  fQRODTValeMateriales:=tfQRODTValeMateriales.Create(Application);
  try
    fQRODTValeMateriales.qCIA.Close;
    fQRODTValeMateriales.qMateriales.Close;
    fQRODTValeMateriales.qCIA.open;
    fQRODTValeMateriales.qMateriales.open;
    fQRODTValeMateriales.QuickRep1.Preview;
  except
    fQRODTValeMateriales.Free;
  end;
end;
//***************************************************************************
//    Presenta el formulario de viáticos
//    en vista de impresión
//***************************************************************************
procedure TfODTPadre.SpeedButton1Click(Sender: TObject);
var CIA:INTEGER;
begin
  CIA := CapturarCIA(true);
  if CIA<>0 then qODTCODIGOADMINISTRATIVO.AsInteger:=CIA;
end;

procedure TfODTPadre.qrcMaterialesAddReports(Sender: TObject);
var i:integer;
  pformaimprimir:^TfQRODTPadreMateriales;
begin
  if listaforms<>nil then
  begin
    qrcMateriales.Reports.Clear;
    for i := 0 to listaforms.Count-1 do
    begin
      pformaimprimir:=listaforms[i];
      qrcMateriales.Reports.Add( pformaimprimir^.QuickRep1);
    end;
  end;
end;
//****************************************************************************
//  Validación fecha aprobación de la odt posterior a la de emisión
//  anterior a las demás
//****************************************************************************
procedure TfODTPadre.qODTFECHAAPROBACIONValidate(Sender: TField);
begin
  inherited;
  if (Sender.Text <> '' ) and (qODTFECHAASIGNACION.AsString<>'') then
  begin
    if (Sender.AsDateTime > qODTFECHAASIGNACION.AsDateTime) then
     raise Exception.Create('La fecha de aprobación No Puede Ser Mayor que La Fecha de asignación.');
  end;
  if (Sender.Text <> '' ) and (qODTFECHAINICIO.AsString<>'') then
  begin
    if (Sender.AsDateTime > qODTFECHAINICIO.AsDateTime) then
     raise Exception.Create('La fecha de aprobación No Puede Ser Mayor que La Fecha de inicio de trabajo.');
  end;
  if (Sender.Text <> '' ) and (qODTFECHAFINAL.AsString<>'') then
  begin
    if (Sender.AsDateTime > qODTFECHAFINAL.AsDateTime) then
     raise Exception.Create('La fecha de aprobación No Puede Ser Mayor que La Fecha final de trabajo.');
  end;
end;

procedure TfODTPadre.qODTFECHAASIGNACIONValidate(Sender: TField);
begin
  inherited;
  if (Sender.Text <> '' ) and (Sender.AsDateTime < qODTFECHAAPROBACION.AsDateTime) then
    raise Exception.Create('La fecha de asignación No Puede Ser Menor que La Fecha de aprobación.');
  if (Sender.Text <> '' ) and (qODTFECHAINICIO.AsString<>'') then
  begin
    if (Sender.AsDateTime > qODTFECHAINICIO.AsDateTime) then
     raise Exception.Create('La fecha de asignación No Puede Ser Mayor que La Fecha de inicio de trabajo.');
  end;
  if (Sender.Text <> '' ) and (qODTFECHAFINAL.AsString<>'') then
  begin
    if (Sender.AsDateTime > qODTFECHAFINAL.AsDateTime) then
     raise Exception.Create('La fecha de asignación No Puede Ser Mayor que La Fecha final de trabajo.');
  end;
end;


procedure TfODTPadre.FormCreate(Sender: TObject);
var
  i:integer;
  nodo:ttreenode;
begin
  //dblinkOW := '@DESA_APP_OW' ;
  dblinkOW := 'DBLINKMATERIALES' ;

  CambioFechaFinal:=false;
  qPrioridad.open;
  qLabor.open;
  qPresMate.open;
  qPresMano.open;
  qReporte.open;
  qImputacion.open;
  qAreaInfluencia.open;
  qODTHija.open;
  qEstadoODT.open;
  qTipoTarea.open;
  qTipoManoObra.open;
  qTipoTurno.open;

  qAuxilioResumen.close;
  qODTSobreTiempo.close;
  qViaticoResumen.close;

  qAuxilioResumen.Open;
  qODTSobreTiempo.Open;
  qViaticoResumen.Open;

  DepuracionRegistrosErroneos;
  slArbol:=TStringList.create;
  nodo:=Arbol.Items.GetFirstNode;
  for i := 0 to Arbol.Items.Count-1 do
  begin
    slArbol.Add(nodo.Text);
    nodo:=nodo.getNextSibling;
  end;
  dbcbAsociaReportes.OnClick := nil;
  qODT.Open;
  dbcbAsociaReportes.OnClick := dbcbAsociaReportesClick;
  qPresMano.Open;
  qViatico.Open;
  qAuxilio.Open;
  qODTSobreTiempo.Open;
  qViaticoResumen.Open;
  qImputacion.Open;
  qDatosAuxilios.Open;
  qMunicipio.Open;

  qZona.Open;
  qMunicipioOrigen.Open;
  qModoOdt.Open;
  qODTLaborDetalle.Open;
  qDescripcionTurno.Open;
  qTipoTurno.Open;
  qAreaInfluencia.Open;
  qTipoTarea.Open;
  odtabierta:= true;
end;

procedure TfODTPadre.sbImprimirAuxiliosClick(Sender: TObject);
var qDatos:tquery;
  cop:boolean;
begin
   cop:=false;
   qDatos:=TQuery.Create(Application);
   qDatos.DatabaseName:='BaseDato';
   try
     qDatos.SQL.Add('SELECT count(*) FROM ODTAUXILIO OA, EMPLEADO E ');
     qDatos.SQL.Add('WHERE OA.CODIGOEMPLEADO = E.CODIGOEMPLEADO');
     qDatos.SQL.Add('AND (OA.COBROINDIVIDUAL=''S'')');
     qDatos.SQL.Add('AND OA.CODIGOODT='+qODTCODIGOODT.AsString);
     qDatos.SQL.Add('AND OA.CODIGOEMPLEADO='+qPresManoCODIGOEMPLEADO.AsString);
     qDatos.SQL.Add('AND IMPRESO=''S''');
     qDatos.open;
     if (qDatos.fields[0].AsInteger>0) then
       cop:=true;
   except
   end;
   qdatos.free;
   
  inherited;
  if fQRAuxilioIndividual<>nil then
  begin
    fQRAuxilioIndividual.free;
    fQRAuxilioIndividual:=nil;
  end;

  {if fQRAuxilioIndividualCopia<>nil then
  begin
    fQRAuxilioIndividualCopia.free;
    fQRAuxilioIndividualCopia:=nil;
  end;}

  try
    fQRAuxilioIndividual := TfQRAuxilioIndividual.Create(self);
    with fQRAuxilioIndividual do
    begin
      qEmpleadosAuxilio.ParamByName('CODIGOEMPLEADO').AsString := qPresManoCODIGOEMPLEADO.AsString;
      qEmpleadosAuxilio.ParamByName('CODIGOODT').AsString := qODT.FieldByName('CODIGOODT').AsString;
      qEmpleadosAuxilio.Open;

      qvaloralmuerzo.open;
      qvalordesayuno.open;
      qvalorcomida.open;

      qImputaciones.ParamByName('CODIGOEMPLEADO').AsString := qPresManoCODIGOEMPLEADO.AsString;
      qImputaciones.ParamByName('CODIGOODT').AsString := qODT.FieldByName('CODIGOODT').AsString;
      qImputaciones.Open;

      qCIA.ParamByName('CIA').AsString := qODTCODIGOADMINISTRATIVO.AsString;
      qCIA.Open;

      qPagado.ParamByName('CODIGOEMPLEADO').AsString := qPresManoCODIGOEMPLEADO.AsString;
      qPagado.ParamByName('CODIGOODT').AsString := qODT.FieldByName('CODIGOODT').AsString;
      qPagado.Open;

      qVehiculos.ParamByName('CODIGOEMPLEADO').AsString := qPresManoCODIGOEMPLEADO.AsString;
      qVehiculos.ParamByName('CODIGOODT').AsString := qODT.FieldByName('CODIGOODT').AsString;
      qVehiculos.Open;
      if qVehiculos.RecordCount>0 then
      begin
        while not qVehiculos.eof do
        begin
         // qrlVehiculos.Caption:=qrlVehiculos.Caption + qVehiculos.FieldByName('CODIGOVEHICULO').AsString +'    ';
          qVehiculos.Next;
        end;
      end
      else
      begin
       // QRLabelVehiculos.Caption:=' ';
      end;
      copia:=cop;
      {if copia then
        qrlCopia1.Caption:='COPIA NO VALIDA PARA COBRAR'; }
        {try
        qrAuxilio.Prepare;
        qrImputaciones.Prepare;
        qrcAuxilioIndividual.Preview;
      except
      end;  }
      fQRAuxilioIndividual.qrAuxilio.Prepare;
      fQRAuxilioIndividual.qrImputaciones.Prepare;
      qrcAuxilioIndividual.Preview;

    end;


   { fQRAuxilioIndividualCopia := TfQRAuxilioIndividual.Create(self);
    with fQRAuxilioIndividualCopia do
    begin
      copia:=true;
      qEmpleadosAuxilio.ParamByName('CODIGOEMPLEADO').AsString := qPresManoCODIGOEMPLEADO.AsString;
      qEmpleadosAuxilio.ParamByName('CODIGOODT').AsString := qODT.FieldByName('CODIGOODT').AsString;
      qEmpleadosAuxilio.Open;

      qImputaciones.ParamByName('CODIGOEMPLEADO').AsString := qPresManoCODIGOEMPLEADO.AsString;
      qImputaciones.ParamByName('CODIGOODT').AsString := qODT.FieldByName('CODIGOODT').AsString;
      qImputaciones.Open;

      qCIA.ParamByName('CIA').AsString := qODTCODIGOADMINISTRATIVO.AsString;
      qCIA.Open;

      qPagado.ParamByName('CODIGOEMPLEADO').AsString := qPresManoCODIGOEMPLEADO.AsString;
      qPagado.ParamByName('CODIGOODT').AsString := qODT.FieldByName('CODIGOODT').AsString;
      qPagado.Open;

      qVehiculos.ParamByName('CODIGOEMPLEADO').AsString := qPresManoCODIGOEMPLEADO.AsString;
      qVehiculos.ParamByName('CODIGOODT').AsString := qODT.FieldByName('CODIGOODT').AsString;
      qVehiculos.Open;
      if qVehiculos.RecordCount>0 then
      begin
        while not qVehiculos.eof do
        begin
          qrlVehiculos.Caption:=qrlVehiculos.Caption + qVehiculos.FieldByName('CODIGOVEHICULO').AsString +'    ';
          qVehiculos.Next;
        end;
      end
      else
      begin
        QRLabelVehiculos.Caption:=' ';
      end;
     // qrlCopia1.Caption:='COPIA NO VALIDA PARA COBRAR';
      try
        qrAuxilio.Prepare;
        qrImputaciones.Prepare;
        qrcAuxilioIndividual.Preview;
      except

      end;
    end;}

  finally
    GuardarTransaccion;
  end;
end;

procedure TfODTPadre.ImprimirViatico1Click(Sender: TObject);
begin
  inherited;
  if qViaticoResumen.RecordCount>0 then
  begin
    FViatico:=TFViatico.Create(Application);
    try
      FViatico.qViatico.DataSource:=dsPresMano;
      FViatico.qViatico.Open;
      FViatico.qViatico.Open;
      FViatico.PanelEncabezado.Enabled:=false;
      FViatico.ShowModal;
    finally
      FViatico.Free;
      GuardarTransaccion;
    end;
  end;
end;

procedure TfODTPadre.sbVerViaticoClick(Sender: TObject);
var punto:TPoint;
begin
 punto:=Panel11.ClientToScreen(Classes.Point(sbVerViatico.Left, sbVerViatico.top));
 pmImprimirViaticos.Popup(punto.x+10, punto.y+10);
end;

procedure TfODTPadre.qrcAuxilioIndividualAddReports(Sender: TObject);
begin
  inherited;
  qrcAuxilioIndividual.Reports.Clear;
  qrcAuxilioIndividual.Reports.Add(fQRAuxilioIndividual.qrAuxilio);
  qrcAuxilioIndividual.Reports.Add(fQRAuxilioIndividual.qrImputaciones);
  {qrcAuxilioIndividual.Reports.Add(fQRAuxilioIndividualCopia.qrAuxilio);
  qrcAuxilioIndividual.Reports.Add(fQRAuxilioIndividualCopia.qrImputaciones); }
end;

procedure TfODTPadre.qODTCODIGOTIPOTURNOChange(Sender: TField);
begin
  inherited;
  qDescripcionTurno.close;
  qDescripcionTurno.open;
end;

procedure TfODTPadre.qDescripcionTurnoCalcFields(DataSet: TDataSet);
begin
  inherited;
  qDescripcionTurnoDesdeHasta.AsString:= formatdatetime('hh:mm',qDescripcionTurnoDesde.asdatetime)+'-'+formatdatetime('hh:mm',qDescripcionTurnohasta.asdatetime);
end;



procedure TfODTPadre.OdtPadreAPClick(Sender: TObject);
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

    qTemp.SQL.Text:='SELECT DISTINCT CODIGOVEHICULO FROM ODTVEHICULO WHERE CODIGOODT='+qODTCODIGOODT.AsString;
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
    qTemp.SQL.Add('AND   D.CODIGOODT = ' + qODTCODIGOODT.AsString);
    qTemp.SQL.Add('AND   G.CODIGOADMINISTRATIVO = ' + qODTCODIGOADMINISTRATIVO.AsString);
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
  qrLabel.OnPrint:=fQRODTPadreAP.QRLabelPrint;
end;

var qDatos:TQuery;
    qrLabel:TQRLabel;
    I:Integer;
    Inicio,alto:integer;
begin
  try
    if (qODT.State in [dsEdit,dsInsert]) and qODT.CachedUpdates then
    begin
      qODT.Post;
      qODT.Edit;
    end;
    fQRODTPadreAP:= TfQRODTPadreAP.Create(Application);
    with fQRODTPadreAP do
    begin
      qODTPadre.Close;
      qODTPadre.Params[0].AsString:=qODTCODIGOODT.AsString;
      qODTPadre.Open;
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

      //LABOR Y TAREA
      qrlLabor.Caption:=dblcbLabor.Text;
      qrlTarea.Caption:=dblcbTarea.Text;
      qrlZona.Caption:=dblcbNombreZona.Text;
      qrlMunicipio.Caption:=dbedNombreMunicipio.Text;

      //ASIGNACION
      qrlAdministrativo.Caption :=qCIA.fieldbyname('NOMBRECATEGORIA').AsString;
      qrlTipoManoObra.Caption   :=dblcbTipoManoObra.Text;
      qrlAprobado.Caption       :=EdAprueba.Text;
      qrlRevisado.Caption       :=EdRevisado.Text;
      qrlEjecutado.Caption      :=EdEjecutado.Text;

      qrlAprobado2.Caption       :=EdAprueba.Text;
      qrlEjecutado2.Caption      :=EdEjecutado.Text;
      //CEDULAS
      qDatos := TQuery.Create(Application);
      qDatos.DatabaseName := 'BaseDato';
      with qDatos.SQL do
      begin
        Add('select p.codigoempleado, e.nombreempleado');
        Add('from odtpresmano p, empleado e');
        Add('where e.codigoempleado = p.codigoempleado');
        Add('and codigoodt = ' + qODTCODIGOODT.AsString);
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
        //Horas Extras
        qDatosExtras.close;
        qDatosExtras.ParamByName('CodigoOdt').AsString:=qODTPadreCODIGOODT.AsString;
        qDatosExtras.ParamByName('CodigoEmpleado').AsString:=qDatos.FieldByName('CodigoEmpleado').AsString;
        qDatosExtras.open;
        //Cantidad Diurna
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := Inicio + I*alto;
        qrLabel.Left := 278;
        qrLabel.Width := 15;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatosExtras.FieldByName('CantidadDiurna') .AsString;
        //Cantidad Nocturna
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := Inicio + I*alto;
        qrLabel.Left := 306;
        qrLabel.Width := 15;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatosExtras.FieldByName('CantidadNocturna') .AsString;
        //Fecha hora Desde
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := Inicio + I*alto;
        qrLabel.Left := 333;
        qrLabel.Width := 78;
        qrLabel.Parent := QRBand2;
        if (qDatosExtras.FieldByName('Desde').asdatetime=0) then
          qrLabel.Caption :=''
        else
          qrLabel.Caption := formatdatetime('dd/mm/yy hh:nn',qDatosExtras.FieldByName('Desde').asdatetime);
        //Fecha hora Hasta
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := Inicio + I*alto;
        qrLabel.Left := 420;
        qrLabel.Width := 78;
        qrLabel.Parent := QRBand2;
        if (qDatosExtras.FieldByName('Hasta').asdatetime=0) then
          qrLabel.Caption :=''
        else
          qrLabel.Caption := formatdatetime('dd/mm/yy hh:nn',qDatosExtras.FieldByName('Hasta').asdatetime);
        //Viáticos
        qDatosViaticos.close;
        qDatosViaticos.ParamByName('CodigoOdt').AsString:=qODTPadreCODIGOODT.AsString;
        qDatosViaticos.ParamByName('CodigoEmpleado').AsString:=qDatos.FieldByName('CodigoEmpleado').AsString;
        qDatosViaticos.open;
        //Días Pagados Viaticos
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := Inicio + I*alto;
        qrLabel.Left := 505;
        qrLabel.Width := 15;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatosViaticos.FieldByName('DiasPagados') .AsString;
        qrLabel.Alignment:= taCenter;
        //Valor Viaticos
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := Inicio + I*alto;
        qrLabel.Left := 531;
        qrLabel.Width := 48;
        qrLabel.Parent := QRBand2;
        if (qDatosViaticos.FieldByName('Valor').asstring='') then
          qrLabel.Caption :=''
        else
          qrLabel.Caption := FloatToStrf(qDatosViaticos.FieldByName('Valor').Asfloat,ffCurrency,10,0);
        qrLabel.Alignment:= taCenter;
        //Auxilios de alimentación
        qDatosAuxilios.close;
        qDatosAuxilios.ParamByName('CodigoOdt').AsString:=qODTPadreCODIGOODT.AsString;
        qDatosAuxilios.ParamByName('CodigoEmpleado').AsString:=qDatos.FieldByName('CodigoEmpleado').AsString;
        qDatosAuxilios.open;
        //Desayunos
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := Inicio + I*alto;
        qrLabel.Left := 596;
        qrLabel.Width := 30;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatosAuxilios.FieldByName('CantidadDesayunos') .AsString;
        qrLabel.Alignment:= taCenter;
        //Almuerzos
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := Inicio + I*alto;
        qrLabel.Left := 642;
        qrLabel.Width := 30;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatosAuxilios.FieldByName('CantidadAlmuerzos') .AsString;
        qrLabel.Alignment:= taCenter;
        //Comidas
        qrLabel := TQRLabel.Create(QRBand2);
        AjustarQRLabel(qrLabel);
        qrLabel.Top := Inicio + I*alto;
        qrLabel.Left := 696;
        qrLabel.Width := 30;
        qrLabel.Parent := QRBand2;
        qrLabel.Caption := qDatosAuxilios.FieldByName('CantidadComidas') .AsString;
        qrLabel.Alignment:= taCenter;

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
      fQRODTPadreAP.QuickRep1.Preview;
    except
      fQRODTPadreAP.Free;
    end;
  finally
    Application.ProcessMessages;
  end;
end;

procedure TfODTPadre.HojaMaterialesAPClick(Sender: TObject);
begin
{  fQRODTPadreAtrasAP:=TfQRODTPadreAtrasAP.Create(Application);
  try
    fQRODTPadreAtrasAP.QuickRep1.Preview;
  except
    fQRODTPadreAtrasAP.Free;
  end;}
end;

procedure TfODTPadre.RegistrodeOperacionesAPClick(Sender: TObject);
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

procedure TfODTPadre.qODTCODIGOLABORChange(Sender: TField);
//Inserta los detalles para labor
procedure DetallesLabor(CodigoODT,CodigoLabor:string);
var qDatos,qTemp,qCodigo:TQuery;
    CodigoODTLaborDetalle:string;
begin
  qDatos:= TQuery.Create(Application);
  qTemp := TQuery.Create(Application);
  qCodigo := TQuery.Create(Application);
  qDatos.DataBaseName  :='BaseDato';
  qTemp.DataBaseName   :='BaseDato';
  qCodigo.DataBaseName   :='BaseDato';
  qDatos.Close;
  qDatos.SQL.Clear;
  qDatos.SQL.Add('DELETE FROM ODTLABORDETALLE WHERE CODIGOODT='+CodigoODT);
  qDatos.ExecSQL;
  qDatos.Close;
  qDatos.SQL.Clear;
  qDatos.SQL.Text:='SELECT CODIGOLABORDETALLE FROM LABORDETALLE WHERE '+
                   'CODIGOLABOR = ' + CodigoLabor + ' ORDER BY CODIGOLABORDETALLE';
  qDatos.Open;
  qCodigo.SQL.Text:='SELECT MAX(CODIGOODTLABORDETALLE) FROM ODTLABORDETALLE';
  CodigoODTLaborDetalle:='1';
  while not qDatos.Eof do
  begin
    qCodigo.Close;
    qCodigo.Open;
    if qCodigo.Fields[0].AsString<>'' then
     CodigoODTLaborDetalle:=inttostr(qCodigo.Fields[0].AsInteger +1);
    qTemp.Close;
    qTemp.SQL.Text:='INSERT INTO ODTLABORDETALLE VALUES('+CodigoODTLaborDetalle+','+CodigoODT+','+
                     qDatos.Fields[0].AsString+','+ '0)';
    qTemp.ExecSQL;
    qDatos.Next;
  end;
  qDatos.Free;
  qTemp.Free;
end;
begin
  inherited;
  if (qODTCODIGOODT.AsString<>'') and (qODTCODIGOLABOR.AsString<>'') then
  begin
    DetallesLabor(qODTCODIGOODT.AsString,qODTCODIGOLABOR.AsString);
    qODTLaborDetalle.Close;
    qODTLaborDetalle.Open;
  end;
end;

procedure TfODTPadre.qODTLaborDetalleAfterPost(DataSet: TDataSet);
begin
  inherited;
  qODTLaborDetalle.ApplyUpdates;
  qODTLaborDetalle.CommitUpdates;   
end;

procedure TfODTPadre.dbGridDetalleLaborColEnter(Sender: TObject);
begin
  if dbGridDetalleLabor.Columns[dbGridDetalleLabor.SelectedIndex].Field = DBCheckBox1.Field then
     DBCheckBox1.Visible:=True
  else
     DBCheckBox1.Visible:=False;
end;

procedure TfODTPadre.dbGridDetalleLaborDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
const IsChecked : array[Boolean] of Integer =
      (DFCS_BUTTONCHECK, DFCS_BUTTONCHECK or DFCS_CHECKED);
var
  DrawState: Integer;
  DrawRect: TRect;
begin
  if qODTLaborDetalle.Active then
  begin
    if qODTLaborDetalle.RecordCount>0 then
    begin
      if (gdFocused in State) then
      begin
        if (Column.Field.FieldName = DBCheckBox1.DataField) then
        begin
         DBCheckBox1.Left := Rect.Left + dbGridDetalleLabor.Left + 2;
         DBCheckBox1.Top := Rect.Top + dbGridDetalleLabor.top + 2;
         DBCheckBox1.Width := Rect.Right - Rect.Left;
         DBCheckBox1.Height := Rect.Bottom - Rect.Top;
         DBCheckBox1.Visible := True;
        end
      end
      else
      begin
        if (Column.Field.FieldName = DBCheckBox1.DataField) then
        begin
          DrawRect:=Rect;
          InflateRect(DrawRect,-1,-1);
          if Column.Field.AsInteger = 0 then
            DrawState := ISChecked[False]
          else
            DrawState := ISChecked[True];

          dbGridDetalleLabor.Canvas.FillRect(Rect);
          DrawFrameControl(dbGridDetalleLabor.Canvas.Handle, DrawRect,
                           DFC_BUTTON, DrawState);
        end;
      end;
    end;
  end;
end;

procedure TfODTPadre.qContratistaAfterOpen(DataSet: TDataSet);
begin
  try
    qContrato.close;
    qContrato.ParamByName('CEDULACONTRATISTA').Asinteger:=qContratistaCEDULACONTRATISTA.Asinteger;
    qcontrato.open;
  except
  end;
end;

procedure TfODTPadre.LiquidacionCuentasCobro;
var
qConsulta2,qModProcesado: tquery;
Begin
    //**********************************cuentas de cobro******************************************
    qConsulta2 := TQuery.Create(Application);
    qConsulta2.DatabaseName := 'BaseDato';
    qConsulta2.SQL.Add('SELECT  cd.*, oc.numerocuenta, OC.CEDULAUSUARIO, OC.OBSERVACION, AC.CODIGOLIQUIDACION,');
    qConsulta2.SQL.Add(' DECODE(esnormal,''S'',ac.VALORNORMAL,ac.VALORFESTIVO) AS cobro FROM odtcobro oc, odtcobrodetalleactividad cd, odtactividadcobro ac' );
    qConsulta2.SQL.Add(' WHERE cd.procesado is null and cd.CODIGOADMINISTRATIVO = ac.CODIGOADMINISTRATIVO');
    qConsulta2.SQL.Add(' AND cd.CODIGOODTACTIVIDADCOBRO = ac.CODIGOODTACTIVIDADCOBRO');
    qConsulta2.SQL.Add(' AND cd.CODIGOODT = oc.CODIGOODT AND CD.CONSECUTIVO = OC.CONSECUTIVO ');
    qConsulta2.SQL.Add(' AND CD.CONSECUTIVOCOBRO = OC.CONSECUTIVOCOBRO AND OC.CODIGOODT = '  + qODTCODIGOODT.ASSTRING  );
    //qConsulta2.SQL.SAVETOFILE('c:\cuentascobro.txt');
    qConsulta2.Open;
    if qconsulta2.RecordCount >0 then
    Begin
      qconsulta2.First;
      while not qconsulta2.Eof do
      Begin
        StoredProc1.UnPrepare;
        StoredProc1.StoredProcName := 'CUENTACOBRO';
        StoredProc1.Prepare;
        StoredProc1.ParamByName('VI_CLIENTE_ID').Asinteger  :=  qconsulta2.fieldbyname('numerocuenta').asinteger;
        StoredProc1.ParamByName('VI_CODIGO_LIQUIDACION').asinteger := qconsulta2.fieldbyname('CODIGOLIQUIDACION').asinteger;
        StoredProc1.ParamByName('VI_VALOR_CONCEPTO').asinteger := qconsulta2.fieldbyname('COBRO').asinteger;
        StoredProc1.ParamByName('VI_IDENTIFICACION').AsString := qconsulta2.fieldbyname('CEDULAUSUARIO').AsString;
        StoredProc1.ParamByName('VI_MENSAJE').AsString :=  'ODT: '+ qconsulta2.fieldbyname('codigoodt').asstring + '-' + qconsulta2.fieldbyname('consecutivo').asstring + ' ENERGIS.  '+   qconsulta2.fieldbyname('OBSERVACION').ASSTRING;
        StoredProc1.ExecProc;

        qModProcesado:= TQuery.Create(Application);
        qModProcesado.DatabaseName := 'BaseDato';
        qModProcesado.SQL.Add('UPDATE odtcobrodetalleactividad SET PROCESADO = ''S'' WHERE CODIGOODT = '+ qconsulta2.fieldbyname('CODIGOODT').asstring );
        qModProcesado.SQL.Add(' AND CONSECUTIVO = '+ qconsulta2.fieldbyname('CONSECUTIVO').asstring);
        qModProcesado.SQL.Add(' AND CONSECUTIVOCOBRO = '+ qconsulta2.fieldbyname('CONSECUTIVOCOBRO').asstring);
        qModProcesado.SQL.Add(' AND CODIGOADMINISTRATIVO = '+ qconsulta2.fieldbyname('CODIGOADMINISTRATIVO').asstring);
        qModProcesado.SQL.Add(' AND CODIGOODTACTIVIDADCOBRO = '+ qconsulta2.fieldbyname('CODIGOODTACTIVIDADCOBRO').asstring);
        //qModProcesado.SQL.SAVETOFILE('c:\qModProcesado.txt');
        qModProcesado.ExecSQL;
        qModProcesado.Free;
        qconsulta2.Next;
      End;
    End;
    qConsulta2.Free;
    //***********************************************************************************************
end;

procedure TfODTPadre.qContratoBeforeOpen(DataSet: TDataSet);
begin
//Aqui se cambia el select del query.

qContrato.sql.Text:= 'SELECT codigo_contrato,cedula_contratista FROM '+EsquemaContratos+'SIO_CONTRATOS'+DBLink+' '+
                     ' WHERE control_contrato = ''EN'' '+
                     ' AND CEDULA_CONTRATISTA =:CEDULACONTRATISTA';
qContrato.ParamByName('CEDULACONTRATISTA').asinteger:= qContratistaCEDULACONTRATISTA.asinteger;
end;

procedure TfODTPadre.DepuracionRegistrosErroneos;
var query:tquery;
begin
  if (qODTCODIGOODT.AsString<>'') then
  begin
    query:=TQuery.create(self);
    query.databasename:='BaseDato';

    query.sql.Add('DELETE FROM ODTVIATICO V');
    query.sql.Add('WHERE CODIGOODT='+qODTCODIGOODT.AsString);
    query.sql.Add('AND NOT EXISTS');
    query.sql.Add('(SELECT NULL FROM ODTVIATICODETALLE D ');
    query.sql.Add('WHERE D.CODIGOVIATICO=V.CODIGOVIATICO)');
    query.ExecSQL;

    query.sql.clear;

    query.sql.Add('DELETE FROM ODTAUXILIO V');
    query.sql.Add('WHERE CODIGOODT='+qODTCODIGOODT.AsString);
    query.sql.Add('AND NOT EXISTS');
    query.sql.Add('(SELECT NULL FROM ODTAUXILIODETALLE D ');
    query.sql.Add('WHERE D.CODIGOAUXILIO=V.CODIGOAUXILIO)');
    query.ExecSQL;

    query.free;
  end;
end;

procedure TfODTPadre.Visitas1Click(Sender: TObject);
begin
  inherited;
  try
    Application.ProcessMessages;
    FQRVisitas:=TFQRVisitas.Create(Application);
    FQRVisitas.QuickRep1.Preview;
  except
    on e:exception do
    begin
//      showmessage(e.message);
      FQRVisitas.free;
    end;
  end;
end;

procedure TfODTPadre.qContratistaAfterScroll(DataSet: TDataSet);
begin
  try
    qContrato.close;
    qcontrato.open;
    dblcContratista.Hint:= qContratistaNOMBRECONTRATISTA.asstring;
  except
  end;
end;

procedure TfODTPadre.qContratistaBeforeOpen(DataSet: TDataSet);
begin
{qcontratista.sql.clear;
qcontratista.sql.text:= 'SELECT  CODIGOCONTRATISTA, NOMBRECONTRATISTA,CEDULACONTRATISTA FROM CONTRATISTA'; }
end;

procedure TfODTPadre.qPresManoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qPresManoAfterScroll(DataSet);
end;

procedure TfODTPadre.sbVerAuxiliosClick(Sender: TObject);
begin
  inherited;
  if qAuxilioResumen.RecordCount>0 then
  begin
    FAuxilio:=TFAuxilio.Create(Application);
    try
      FAuxilio.qAuxilio.close;
      FAuxilio.qAuxilio.ParamByName('CODIGOODT').AsString:=qPresManoCODIGOODT.AsString;
      FAuxilio.qAuxilio.ParamByName('CODIGOEMPLEADO').AsString:=qPresManoCODIGOEMPLEADO.AsString;
      FAuxilio.qAuxilio.ParamByName('CODIGOAUXILIO').AsString:=qAuxilioResumenCODIGOAUXILIO.AsString;
      FAuxilio.qAuxilio.Open;
      FAuxilio.PanelEncabezado.Enabled:=false;
      FAuxilio.PanelGastosTransporte.Enabled:=false;
      FAuxilio.bbAceptar.Enabled:=false;
      FAuxilio.ShowModal;
    finally
      FAuxilio.Free;
    end;
  end;//
end;

procedure TfODTPadre.sbVerExtrasClick(Sender: TObject);
begin
  inherited;
  if qODTSobreTiempoCODIGOODTSOBRETIEMPO.AsString <> '' then
  begin
    FODTDetalleHorasExtras := TFODTDetalleHorasExtras.Create(Application);
    try
//      CrearTablasTemporalesSobreTiempo;
//      PoblarTablasTemporalesSobreTiempo;
      FODTDetalleHorasExtras.qODTSobreTiempo.ParamByName('CODIGOODTSOBRETIEMPO').AsString :=
        qODTSobreTiempoCODIGOODTSOBRETIEMPO.AsString;
      FODTDetalleHorasExtras.qODTSobreTiempo.Open;
      FODTDetalleHorasExtras.qODTSobreTiempo.CachedUpdates:=False;
      FODTDetalleHorasExtras.qODTSobreTiempo.UpdateObject:=nil;
      FODTDetalleHorasExtras.qODTSobreTiempoDetalle.Open;
      FODTDetalleHorasExtras.qODTSobreTiempoDetalle.CachedUpdates:=False;
      FODTDetalleHorasExtras.qODTSobreTiempoDetalle.UpdateObject:=nil;
      FODTDetalleHorasExtras.CopiarFechaTemp;
      FODTDetalleHorasExtras.Caption:=FODTDetalleHorasExtras.Caption+ ' (Modo Solo Lectura).';
      FODTDetalleHorasExtras.bbAceptar.Enabled:=false;
      FODTDetalleHorasExtras.ShowModal;

    except
      on e:exception do
      begin
        showmessage(e.message);
        FODTDetalleHorasExtras.Free;
      end;
    end;
  end;
end;
//Valida si existen anticipos de viáticos que no hayan sido devueltos
function TfODTPadre.ValidarAnticiposSinLegalizar: boolean;
var query:tquery;
begin
  result:=false;
  if (sManoObraOdt<>'') then
  begin
    query:=TQuery.Create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT COUNT(*)FROM ODTVIATICO WHERE CODIGOODT= '+qODTCODIGOODT.AsString);
    query.sql.add('AND (DIASPROYECTADOS IS NOT NULL AND DIASPAGADOS IS NULL) ');
    query.sql.add('AND (DEVOLUCION IS NULL) ');
    query.Open;
    if (query.fields[0].Asinteger>0) then result:=true;
    query.free;
  end;
end;
//Valida si existen auxilios de alimentación en la odt
function TfODTPadre.ValidarExistenciaAuxilios: boolean;
var query:tquery;
begin
  result:=false;
  if (sManoObraOdt<>'') then
  begin
    query:=TQuery.Create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT COUNT(*)FROM ODTAUXILIO WHERE CODIGOODT= '+qODTCODIGOODT.AsString);
    query.Open;
    if (query.fields[0].Asinteger>0) then result:=true;
    query.free;
  end;
end;
//Valida si existen horas extras en la odt
function TfODTPadre.ValidarExistenciaExtras: boolean;
var query:tquery;
begin
  result:=false;
  if (sManoObraOdt<>'') then
  begin
    query:=TQuery.Create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT COUNT(*)FROM ODTSOBRETIEMPO WHERE CODIGOODT= '+qODTCODIGOODT.AsString);
    query.Open;
    if (query.fields[0].Asinteger>0) then result:=true;
    Query.close;
    query.free;
  end;
end;
//Valida si existen viáticos en la odt
function TfODTPadre.ValidarExistenciaViaticos: boolean;
var query:tquery;
begin
  result:=false;
  if (sManoObraOdt<>'') then
  begin
    query:=TQuery.Create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT COUNT(*)FROM ODTVIATICO WHERE CODIGOODT= '+qODTCODIGOODT.AsString);
    query.Open;
    if (query.fields[0].Asinteger>0) then result:=true;
    Query.close;
    query.free;
  end;
end;

procedure TfODTPadre.GuardarTransaccion;
begin
  if qODT.Database.InTransaction then
  begin
    qODT.Database.commit;
    qODT.Database.StartTransaction;
  end;
end;

procedure TfODTPadre.qODTCODIGOZONAORIGENChange(Sender: TField);
var query:tquery;
  nombresecuencia:String;
begin
  inherited;
  if (sender.AsString<>'') then
  begin
    if (qODTCODIGOODT.AsString='') then
    begin
      query:=TQuery.create(self);
      query.DatabaseName :='BaseDato';
      querY.sql.add('SELECT NOMBRESECUENCIA FROM ODT_SECUENCIAZONA WHERE CODIGOZONA='+sender.AsString);
      query.open;
      if query.IsEmpty then
        raise  exception.create('No existe una secuencia definida para esta zona.');
      nombresecuencia:=query.fields[0].AsString;
      query.sql.clear;
      try
        query.sql.add('SELECT INVENTARIOHND.'+ NOMBRESECUENCIA+'.NEXTVAL codigo FROM DUAL');
        query.open;
        qODTCODIGOODT.AsFloat:=query.fields[0].asfloat;
        {Arbol.Enabled:=true;
        Notebook.Enabled:=true;}
      except
        showmessage('Error al tratar de generar el código de ODT a partir de la secuencia de la Zona.');
      end;

      query.free;
    end
    else  exception.create('Esta ODT ya tiene un código asociado otra Zona ');

  end
  else
    raise exception.create('Debe ingresar la zona de origen');
end;

//***************************************************************************
//       Crea tablas temporales con información de las
//     las tablas ODTAUXILIO Y ODTAUXILIODETALLE antes de modificarlas
//***************************************************************************
procedure TfODTPadre.CrearTablasTemporalesAuxilio;
var
  tTemp, tTempDetalle: TTable;
begin
  tTemp := TTable.Create(Application);
  tTempDetalle := TTable.Create(Application);
  with tTemp do
  begin
    Active := False;
    DatabaseName := GetTemporalPath;
    TableType := ttParadox;
    TableName := 'ODTAUXILIO';
    try
      DeleteTable;
    except
    end;
    with FieldDefs do
    begin
      Clear;
      Add('CODIGOAUXILIO', ftInteger, 0, True);
      Add('CODIGOEMPLEADO',ftFloat, 0, True);
      Add('CODIGOODT', ftFloat, 0, True);
      Add('FECHAINICIO', ftDateTime, 0, True);
      Add('FECHAFIN', ftDateTime, 0, True);
      Add('CANTIDADDESAYUNOS', ftFloat, 0, False);
      Add('CANTIDADALMUERZOS', ftFloat, 0, False);
      Add('CANTIDADCOMIDAS', ftFloat, 0, False);
      Add('CODIGOVEHICULO', ftString, 10, False);
      Add('RESPONSABLECOBRO', ftString, 1, False);
    end;
    with IndexDefs do
    begin
      Clear;
      Add('', 'CODIGOAUXILIO', [ixPrimary, ixUnique]);
      Add('Idx1', 'CODIGOODT;CODIGOEMPLEADO', [ixUnique]);
    end;
    CreateTable;
  end;

  with tTempDetalle do
  begin
    Active := False;
    DatabaseName := GetTemporalPath;
    TableType := ttParadox;
    TableName := 'ODTAUXILIODETALLE';
    try
      DeleteTable;
    except
    end;
    with FieldDefs do
    begin
      Clear;
      Add('CODIGOAUXILIODETALLE', ftInteger, 0, True);
      Add('CODIGOAUXILIO', ftInteger, 0, True);
      Add('CODIGOIMPUTACIONMANOOBRA',ftFloat, 0, True);
      Add('VALORIMPUTACION', ftFloat, 0, False);
      Add('FECHA', ftDateTime, 0, False);
    end;
    with IndexDefs do
    begin
      Clear;
      Add('', 'CODIGOAUXILIODETALLE', [ixPrimary, ixUnique]);
    end;
    CreateTable;
  end;
  tTemp.Free;
  tTempDetalle.Free;
end;
//***************************************************************************
//       Crea tablas temporales con información de las
//     las tablas ODTSOBRETIEMPO Y ODTSOBRETIEMPODETALLE antes de modificarlas
//***************************************************************************
procedure TfODTPadre.CrearTablasTemporalesSobreTiempo;
var tTemp, tTempDetalle: TTable;
begin
  tTemp        := TTable.Create(Application);
  tTempDetalle := TTable.Create(Application);
  with tTemp do
  begin
    Active := False;
    DatabaseName :=GetTemporalPath;
    TableType := ttParadox;
    TableName := 'ODTSOBRETIEMPO';
    try
      DeleteTable;
    except
    end;
    with FieldDefs do
    begin
      Clear;
      Add('CODIGOODTSOBRETIEMPO', ftInteger, 0, True);
      Add('CODIGOODT',ftFloat, 0, True);
      Add('CODIGOEMPLEADO', ftFloat, 0, True);
      Add('CANTIDADDIURNA', ftInteger, 0, True);
      Add('CANTIDADNOCTURNA', ftInteger, 0, True);
      Add('FECHAASIGNACION', ftDateTime, 0, True);
      Add('OBSERVACION', ftString, 50, False);
    end;
    with IndexDefs do
    begin
      Clear;
      Add('', 'CODIGOODTSOBRETIEMPO', [ixPrimary, ixUnique]);
      Add('Idx1', 'CODIGOODT;CODIGOEMPLEADO', [ixUnique]);
    end;
    CreateTable;
  end;

  with tTempDetalle do
  begin
    Active := False;
    DatabaseName := GetTemporalPath;
    TableType := ttParadox;
    TableName := 'ODTSOBRETIEMPODETALLE';
    try
      DeleteTable;
    except
    end;    
    with FieldDefs do
    begin
      Clear;
      Add('CODIGOODTSOBRETIEMPODETALLE', ftInteger, 0, True);
      Add('CODIGOODTSOBRETIEMPO', ftInteger, 0, True);
      Add('CODIGOODT',ftFloat, 0, True);
      Add('CODIGOEMPLEADO', ftFloat, 0, True);
      Add('FECHAHORADESDE', ftDateTime, 0, True);
      Add('FECHAHORAHASTA', ftDateTime, 0, True);
      Add('CANTIDADDIURNA', ftInteger, 0, False);
      Add('CANTIDADNOCTURNA', ftInteger, 0, False);
      Add('CONVENCIONAL', ftString, 1, False);
      Add('OBSERVACION', ftString, 50, False);
      Add('DISPONIBILIDAD', ftString, 1, False);
    end;
    with IndexDefs do
    begin
      Clear;
      Add('', 'CODIGOODTSOBRETIEMPODETALLE', [ixPrimary, ixUnique]);
      Add('Idx1', 'CODIGOODT;CODIGOEMPLEADO;FECHAHORADESDE;FECHAHORAHASTA', [ixUnique]);
    end;
    CreateTable;
  end;
  tTemp.Free;
  tTempDetalle.Free;
end;
//***************************************************************************
//       Crea tablas temporales con información de las
//     las tablas ODTVIATICO Y ODTVIATICODETALLE antes de modificarlas
//***************************************************************************
procedure TfODTPadre.CrearTablasTemporalesViaticos;
var tTemp: TTable;
  tTempDetalle:TTable;
  tTempDetalle2:TTable;
begin
  tTemp := TTable.Create(Application);
  with tTemp do
  begin
    Active := False;
    DatabaseName := GetTemporalPath;
    TableType := ttParadox;
    TableName := 'ODTVIATICO';
    try
      DeleteTable;
    except
    end;
    with FieldDefs do
    begin
      Clear;
      Add('CODIGOVIATICO', ftInteger, 0, True);
      Add('CODIGOEMPLEADO',ftFloat, 0, True);
      Add('CODIGOODT', ftFloat, 0, True);
      Add('CODIGOCOMISION', ftInteger, 0, True);
      Add('CODIGOZONAORIGEN', ftFloat, 0, True);
      Add('CODIGOMUNICIPIODESTINO', ftFloat, 0, False);
      Add('FECHAINICIO', ftDateTime, 0, True);
      Add('FECHAFIN', ftDateTime, 0, True);
      Add('USOVEHICULO', ftString, 1, False);
      Add('CODIGOVEHICULO', ftString, 10, False);
      Add('VEHICULOOFICIAL', ftString, 1, False);
      Add('VALORANTICIPO', ftFloat, 0, False);
      Add('FECHAPAGOANTICIPO', ftDateTime, 0, False);
      Add('FECHAPAGOVIATICO', ftDateTime, 0, False);
      Add('ANTICIPO', ftString, 1, False);
      Add('PORCENTAJEANTICIPO', ftInteger, 0, False);
      Add('DIASPROYECTADOS', ftInteger, 0, False);
      Add('CIUDADCAPITAL', ftString, 1, False);
      Add('DESTINO', ftString, 30, False);
    end;
    with IndexDefs do
    begin
      Clear;
      Add('', 'CODIGOVIATICO', [ixPrimary, ixUnique]);
      Add('Idx1', 'CODIGOODT;CODIGOEMPLEADO', [ixUnique]);
    end;
    CreateTable;
  end;
  tTemp.Free;

  tTempDetalle := TTable.Create(Application);
  with tTempDetalle do
  begin
    Active := False;
    DatabaseName :=GetTemporalPath;
    TableType := ttParadox;
    TableName := 'ODTVIATICODETALLE';
    try
      DeleteTable;
    except
    end;
    with FieldDefs do
    begin
      Clear;
      Add('CODIGOVIATICODETALLE', ftInteger, 0, True);
      Add('CODIGOVIATICO', ftInteger, 0, True);
      Add('CODIGOIMPUTACIONMANOOBRA', ftFloat, 0, True);
      Add('VALORIMPUTACION',ftFloat, 0, False);
    end;
    with IndexDefs do
    begin
      Clear;
      Add('', 'CODIGOVIATICODETALLE', [ixPrimary, ixUnique]);
      Add('Idx1', 'CODIGOVIATICO;CODIGOIMPUTACIONMANOOBRA', [ixUnique]);
    end;
    CreateTable;
  end;
  tTempDetalle.Free;
  tTempDetalle2 := TTable.Create(Application);
  with tTempDetalle2 do
  begin
    Active := False;
    DatabaseName := GetTemporalPath;
    TableType := ttParadox;
    TableName := 'ODTVIATICODETALLETIQUETE';
    try
      DeleteTable;
    except
    end;    
    with FieldDefs do
    begin
      Clear;
      Add('CODIGOVIATICODETALLETIQUETE', ftFloat, 0, True);
      Add('CODIGOTIPOTIQUETE', ftString, 1, True);
      Add('CODIGOVIATICO', ftFloat, 0, True);
      Add('NUMEROTIQUETE', ftString, 20, True);
      Add('VALORTIQUETE', ftFloat, 0, False);
    end;
    with IndexDefs do
    begin
      Clear;
      Add('', 'CODIGOVIATICODETALLETIQUETE', [ixPrimary, ixUnique]);
    end;
    CreateTable;
  end;
  tTempDetalle2.Free;
end;
//***************************************************************************
//       Escribe información en las las tablas ODTAUXILIO Y ODTAUXILIODETALLE
//          a partir de la información de tablas temporales
//***************************************************************************
procedure TfODTPadre.EscribirTablasTemporalesAuxilio;
var
  tTemp, tTempDetalle: TTable;
  I: Integer;
  Campo: string;
  Query: TQuery;
begin
  tTemp := TTable.Create(Application);
  tTempDetalle := TTable.Create(Application);
  tTemp.DatabaseName := GetTemporalPath;
  tTemp.TableName := 'ODTAUXILIO';
  tTempDetalle.TableName := 'ODTAUXILIODETALLE';
  tTempDetalle.DatabaseName :=GetTemporalPath;
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
    try
    tTemp.Open;
    qAuxilio.Edit;
    for I:=0 to tTemp.FieldDefs.Count - 1 do
    begin
      Campo := tTemp.Fields[I].FieldName;
      qAuxilio.FieldByName(Campo).AsString := tTemp.FieldByName(Campo).AsString;
    end;
    qAuxilio.Post;
    Query.SQL.Text := 'DELETE FROM ODTAUXILIODETALLE WHERE CODIGOAUXILIO = ' + tTemp.FieldByName('CODIGOAUXILIO').AsString;
    Query.ExecSQL;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Text := 'SELECT * FROM ODTAUXILIODETALLE WHERE CODIGOAUXILIODETALLE = :CODIGO';
    Query.RequestLive := True;
    tTempDetalle.Open;
    tTempDetalle.First;
    while not tTempDetalle.Eof do   
    begin
      Query.Close;
      Query.ParamByName('CODIGO').AsString := tTempDetalle.FieldByName('CODIGOAUXILIODETALLE').AsString;
      Query.Open;
      Query.Insert;
      for I:=0 to tTempDetalle.FieldDefs.Count - 1 do
      begin
        Campo := tTempDetalle.Fields[I].FieldName;
        Query.FieldByName(Campo).AsString := tTempDetalle.FieldByName(Campo).AsString
      end;
      Query.Post;
      tTempDetalle.Next;
    end;
  except
    tTemp.Close;
    tTempDetalle.Close;
  end;
  Query.Free;
  tTemp.Free;
  tTempDetalle.Free;
end;
//***************************************************************************
//       Escribe información en las las tablas ODTSOBRETIEMPO Y ODTSOBRETIEMPODETALLE
//          a partir de la información de tablas temporales
//***************************************************************************
procedure TfODTPadre.EscribirTablasTemporalesSobreTiempo;
var tTemp, tTempDetalle: TTable;
    I: Integer;
    Campo: string;
    Query: TQuery;
begin
  tTemp        := TTable.Create(Application);
  tTempDetalle := TTable.Create(Application);
  tTemp.DatabaseName :=GetTemporalPath;
  tTemp.TableName := 'ODTSOBRETIEMPO';
  tTempDetalle.TableName := 'ODTSOBRETIEMPODETALLE';
  tTempDetalle.DatabaseName :=GetTemporalPath;
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
    try
    tTemp.Open;
    qODTSobreTiempo.Edit;
    for I:=0 to tTemp.FieldDefs.Count - 1 do
    begin
      Campo := tTemp.Fields[I].FieldName;
      qODTSobreTiempo.FieldByName(Campo).AsString := tTemp.FieldByName(Campo).AsString;
    end;
    qODTSobreTiempo.Post;
    Query.SQL.Text := 'DELETE FROM ODTSOBRETIEMPODETALLE WHERE CODIGOODTSOBRETIEMPO = ' + tTemp.FieldByName('CODIGOODTSOBRETIEMPO').AsString;
    Query.ExecSQL;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Text := 'SELECT * FROM ODTSOBRETIEMPODETALLE WHERE CODIGOODTSOBRETIEMPODETALLE = :CODIGO';
    Query.RequestLive := True;
    tTempDetalle.Open;
    tTempDetalle.First;
    while not tTempDetalle.Eof do
    begin
      Query.Close;
      Query.ParamByName('CODIGO').AsString := tTempDetalle.FieldByName('CODIGOODTSOBRETIEMPODETAL').AsString;
      Query.Open;
      Query.Insert;
      for I:=0 to tTempDetalle.FieldDefs.Count - 1 do
      begin
        Campo := tTempDetalle.Fields[I].FieldName;
        if Campo <> 'CODIGOODTSOBRETIEMPODETAL' then
          Query.FieldByName(Campo).AsString := tTempDetalle.FieldByName(Campo).AsString
        else
          Query.FieldByName('CODIGOODTSOBRETIEMPODETALLE').AsString := tTempDetalle.FieldByName(Campo).AsString;
      end;
      Query.Post;
      tTempDetalle.Next;
    end;
  except
    tTemp.Close;
    tTempDetalle.Close;
  end;
  query.close;
  Query.Free;
  tTemp.Free;
  tTempDetalle.Free;
end;
//***************************************************************************
//       Escribe información en las las tablas ODTVIATICO Y ODTVIATICODETALLE
//          a partir de la información de tablas temporales
//***************************************************************************
procedure TfODTPadre.EscribirTablasTemporalesViaticos;
var tTemp,tTempDetalle,tTempDetalle2: TTable;
    I: Integer;
    Campo: string;
    Query: TQuery;
begin
  tTemp        := TTable.Create(Application);
  tTemp.DatabaseName :=GetTemporalPath;
  tTemp.TableName := 'ODTVIATICO';
  tTempDetalle := TTable.Create(Application);
  tTempDetalle.DatabaseName := GetTemporalPath;
  tTempDetalle.TableName := 'ODTVIATICODETALLE';
  tTempDetalle2 := TTable.Create(Application);
  tTempDetalle2.DatabaseName := GetTemporalPath;
  tTempDetalle2.TableName := 'ODTVIATICODETALLETIQUETE';
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  try
    tTemp.Open;
    qViatico.Edit;
    for I:=0 to tTemp.FieldDefs.Count - 1 do
    begin
      Campo := tTemp.Fields[I].FieldName;
      qViatico.FieldByName(Campo).AsString := tTemp.FieldByName(Campo).AsString;
    end;
    qViatico.Post;

    Query.SQL.Text := 'DELETE FROM ODTVIATICODETALLE WHERE CODIGOVIATICO = ' + tTemp.FieldByName('CODIGOVIATICO').AsString;
    Query.ExecSQL;
    Query.Close;

    Query.SQL.Clear;
    Query.SQL.Text := 'SELECT * FROM ODTVIATICODETALLE WHERE CODIGOVIATICO = :CODIGOVIATICO';
    Query.RequestLive := True;
    tTempDetalle.Open;
    tTempDetalle.First;
    while not tTempDetalle.Eof do
    begin
      Query.Close;
      Query.ParamByName('CODIGOVIATICO').AsString := tTemp.FieldByName('CODIGOVIATICO').AsString;
      Query.Open;
      Query.Insert;
      for I:=0 to tTempDetalle.FieldDefs.Count - 1 do
      begin
        Campo := tTempDetalle.Fields[I].FieldName;
        Query.FieldByName(Campo).AsString := tTempDetalle.FieldByName(Campo).AsString
      end;
      Query.Post;
      tTempDetalle.Next;
    end;
    Query.SQL.Text := 'DELETE FROM ODTVIATICODETALLETIQUETE WHERE CODIGOVIATICO = ' + tTemp.FieldByName('CODIGOVIATICO').AsString;
    Query.ExecSQL;
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Text := 'SELECT * FROM ODTVIATICODETALLETIQUETE WHERE CODIGOVIATICO = :CODIGOVIATICO';
    Query.RequestLive := True;
    tTempDetalle2.Open;
    tTempDetalle2.First;
    while not tTempDetalle2.Eof do
    begin
      Query.Close;
      Query.ParamByName('CODIGOVIATICO').AsString := tTemp.FieldByName('CODIGOVIATICO').AsString;
      Query.Open;
      Query.Insert;
      for I:=0 to tTempDetalle2.FieldDefs.Count - 1 do
      begin
        Campo := tTempDetalle2.Fields[I].FieldName;
        Query.FieldByName(Campo).AsString := tTempDetalle.FieldByName(Campo).AsString
      end;
      Query.Post;
      tTempDetalle2.Next;
    end;
  except
    tTemp.Close;
  end;
  Query.Free;
  tTemp.Free;
  tTempDetalle.Free;
  tTempDetalle2.Free;
end;
//***************************************************************************
//       LLena tablas temporales con información de las
//     las tablas ODTAUXILIO Y ODTAUXILIODETALLE antes de modificarlas
//***************************************************************************
procedure TfODTPadre.PoblarTablasTemporalesAuxilio;
var
  tTemp, tTempDetalle: TTable;
  I: Integer;
  Campo: string;
  Query: TQuery;
begin
  try
    CrearTablasTemporalesAuxilio;
  except
  end;
  tTemp := TTable.Create(Application);
  tTempDetalle := TTable.Create(Application);
  tTemp.DatabaseName :=GetTemporalPath;
  tTemp.TableName := 'ODTAUXILIO';
  tTempDetalle.TableName := 'ODTAUXILIODETALLE';
  tTempDetalle.DatabaseName := GetTemporalPath;
  tTemp.Open;
  tTemp.Insert;
  for I:=0 to tTemp.FieldDefs.Count - 1 do
  begin
    Campo := tTemp.Fields[I].FieldName;
    tTemp.FieldByName(Campo).AsString := qAuxilio.FieldByName(Campo).AsString;
  end;
  tTemp.Post;
  tTemp.Free;

  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('SELECT * FROM ODTAUXILIODETALLE');
  Query.SQL.Add('WHERE CODIGOAUXILIO = ' + qAuxilioCODIGOAUXILIO.AsString);
  Query.Open;
  Query.First;
  tTempDetalle.Open;
  try
    while not Query.Eof do
    begin
      tTempDetalle.Insert;
      for I:=0 to tTempDetalle.FieldDefs.Count - 1 do
      begin
        Campo := tTempDetalle.Fields[I].FieldName;
        tTempDetalle.FieldByName(Campo).AsString := Query.FieldByName(Campo).AsString
      end;
      tTempDetalle.Post;
      Query.Next;
    end;
  except
    tTempDetalle.Close;
    raise;
  end;
  Query.Free;
  tTempDetalle.Free;
end;
//***************************************************************************
//       Llena tablas temporales con información de las
//     las tablas ODTSOBRETIEMPO Y ODTSOBRETIEMPODETALLE antes de modificarlas
//***************************************************************************
procedure TfODTPadre.PoblarTablasTemporalesSobreTiempo;
var tTemp, tTempDetalle: TTable;
    I: Integer;
    Campo: string;
    Query: TQuery;
begin
  try
    CrearTablasTemporalesSobreTiempo;
  except
  end;
  tTemp        := TTable.Create(Application);
  tTempDetalle := TTable.Create(Application);
  tTemp.DatabaseName := GetTemporalPath;
  tTemp.TableName := 'ODTSOBRETIEMPO';
  tTempDetalle.TableName := 'ODTSOBRETIEMPODETALLE';
  tTempDetalle.DatabaseName := GetTemporalPath;
  tTemp.Open;
  tTemp.Insert;
  for I:=0 to tTemp.FieldDefs.Count - 1 do
  begin
    Campo := tTemp.Fields[I].FieldName;
    tTemp.FieldByName(Campo).AsString := qODTSobreTiempo.FieldByName(Campo).AsString;
  end;
  tTemp.Post;
  tTemp.Free;

  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('SELECT * FROM ODTSOBRETIEMPODETALLE');
  Query.SQL.Add('WHERE CODIGOODTSOBRETIEMPO = ' + qODTSobreTiempoCODIGOODTSOBRETIEMPO.AsString);
  Query.Open;
  Query.First;
  tTempDetalle.Open;
  try
    while not Query.Eof do
    begin
      tTempDetalle.Insert;
      for I:=0 to tTempDetalle.FieldDefs.Count - 1 do
      begin
        Campo := tTempDetalle.Fields[I].FieldName;
        if Campo <> 'CODIGOODTSOBRETIEMPODETAL' then
          tTempDetalle.FieldByName(Campo).AsString := Query.FieldByName(Campo).AsString
        else
          tTempDetalle.FieldByName(Campo).AsString := Query.FieldByName('CODIGOODTSOBRETIEMPODETALLE').AsString;
      end;
      tTempDetalle.Post;
      Query.Next;
    end;
  except
    tTempDetalle.Close;
    raise;
  end;
  Query.Free;
  tTempDetalle.Free;
end;
//***************************************************************************
//       Llena tablas temporales con información de las
//     las tablas ODTVIATICO Y ODTVIATICODETALLE antes de modificarlas
//***************************************************************************
procedure TfODTPadre.PoblarTablasTemporalesViaticos;
var tTemp, tTempDetalle, tTempDetalle2: TTable;
    I: Integer;
    Campo: string;
    Query: TQuery;
begin
  try
   CrearTablasTemporalesViaticos;
  except
  end;
  tTemp        := TTable.Create(Application);
  tTemp.DatabaseName :=GetTemporalPath;
  tTemp.TableName := 'ODTVIATICO';
  tTemp.Open;
  tTemp.Insert;
  for I:=0 to tTemp.FieldDefs.Count - 1 do
  begin
    Campo := tTemp.Fields[I].FieldName;
    tTemp.FieldByName(Campo).AsString := qViatico.FieldByName(Campo).AsString;
  end;
  tTemp.Post;
  tTemp.Free;
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Clear;
  Query.SQL.Add('SELECT * FROM ODTVIATICODETALLE');
  Query.SQL.Add('WHERE CODIGOVIATICO = ' + qViaticoCODIGOVIATICO.AsString);
  Query.Open;
  Query.First;

  tTempDetalle := TTable.Create(Application);
  tTempDetalle.TableName := 'ODTVIATICODETALLE';
  tTempDetalle.DatabaseName := GetTemporalPath;
  tTempDetalle.Open;
//  try
    while not Query.Eof do
    begin
      tTempDetalle.Insert;
      for I:=0 to tTempDetalle.FieldDefs.Count - 1 do
      begin
        Campo := tTempDetalle.Fields[I].FieldName;
        tTempDetalle.FieldByName(Campo).AsString := Query.FieldByName(Campo).AsString
      end;
      tTempDetalle.Post;
      Query.Next;
    end;
  tTempDetalle.Free;
//  except    tTempDetalle.Close;    raise;  end;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT * FROM ODTVIATICODETALLETIQUETE');
  Query.SQL.Add('WHERE CODIGOVIATICO = ' + qViaticoCODIGOVIATICO.AsString);
  Query.Open;
  Query.First;

  tTempDetalle2 := TTable.Create(Application);
  tTempDetalle2.DatabaseName := GetTemporalPath;
  tTempDetalle2.TableName := 'ODTVIATICODETALLETIQUETE';
  tTempDetalle2.Open;

  while not Query.Eof do
  begin
    tTempDetalle2.Insert;
    for I:=0 to tTempDetalle2.FieldDefs.Count - 1 do
    begin
      Campo := tTempDetalle2.Fields[I].FieldName;
      if Campo <> 'CODIGOVIATICODETALLETIQUE' then
        tTempDetalle2.FieldByName(Campo).AsString := Query.FieldByName(Campo).AsString
      else
        tTempDetalle2.FieldByName(Campo).AsString := Query.FieldByName('CODIGOVIATICODETALLETIQUETE' ).AsString;
    end;
    tTempDetalle2.Post;
    Query.Next;
  end;
  tTempDetalle2.Free;
end;

procedure TfODTPadre.bbtnAuditoriaClick(Sender: TObject);
begin
  inherited;
  ConsultarAditoria('ODT',qODTCODIGOODT.AsString);
end;

procedure TfODTPadre.VisualizarExtras(ver: boolean);
begin
  PanelExtras.Visible:=ver;
end;

procedure TfODTPadre.VisualizarViaticosAuxilios(ver: boolean);
begin
  PanelViaticoAuxilio.Visible:=ver;
//  PanelViaticos.Visible:=ver;
//  PanelAuxilios.Visible:=ver;
end;

procedure TfODTPadre.qODTCODIGOTIPOTAREAValidate(Sender: TField);
begin
  inherited;
  if (qPresmate.RecordCount>0) then
    raise exception.create('No puede cambiar este tipo de tarea, porque ya hay materiales asociados');
end;

procedure TfODTPadre.VisualizarModoOdt(modo: integer);
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


  case modo of
    2: //Alumbrado Público
    begin
      for i := 0 to pmImprimir.Items.Count-1 do
      begin
        if (pmImprimir.Items[i].tag=1) then
          pmImprimir.Items[i].Visible:=false
        else
          pmImprimir.Items[i].Visible:=true;
      end;
    end;
    //Modo Administrativo
    5:
    begin
      Arbol.Items[1].Delete;
      //Arbol.Items[4].Delete;
      Arbol.Items[3].Delete;
    end;
    else//General
    begin
      for i := 0 to pmImprimir.Items.Count-1 do
      begin
        if (pmImprimir.Items[i].tag=2) then
          pmImprimir.Items[i].Visible:=false
        else
          pmImprimir.Items[i].Visible:=true;
      end;
    end;
  end;
  Notebook.ActivePage:='Generales';
end;

procedure TfODTPadre.qODTCODIGOMODOODTValidate(Sender: TField);
begin
  inherited;
  if Sender.AsString<>'' then
    VisualizarModoOdt(sender.AsInteger);
  qTipoTarea.close;
  qTipoTarea.open;
  qLabor.close;
  qLabor.open;
end;

procedure TfODTPadre.qPresmateCalcFields(DataSet: TDataSet);
var query:tquery;
begin
  if (qPresMateCODIGOMATERIAL.AsString<>'') then
  begin
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('select nombrematerial,codigounidad,codigomaterialessa from materialessa');
    query.sql.add('where codigomaterial= '+qPresMateCODIGOMATERIAL.AsString);
    query.open;
    qPresMateNombreMaterial.Asstring:=query.fieldbyname('nombrematerial').AsString;
    qPresMateNombreUnidad.AsString:=query.fieldbyname('codigounidad').AsString;
    query.Close;
    query.free;
  end;
end;

procedure TfODTPadre.sbCigMunicipioClick(Sender: TObject);
var CIG:INTEGER;
qconsulta: tquery;
begin
  CIG := CapturarCIGMunicipio;
  if CIG <>0 then
  Begin
    qConsulta := TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.sql.add('select CODIGOMUNICIPIO from municipio where codigogeografico = (SELECT GETCODIGOMUNICIPIO('+ INTTOSTR(CIG)+') FROM DUAL)');
    qConsulta.open;
    if qconsulta.fieldbyname('codigomunicipio').asstring <> '' then
      qODTCODIGOMUNICIPIO.AsInteger:=qconsulta.fieldbyname('codigomunicipio').asinteger;;
    qConsulta.Free;
  end;
end;


procedure TfODTPadre.dbeCIAKeyPress(Sender: TObject; var Key: Char);
var
  i:integer;
  qDatos, Query: TQuery;
  ConsecutivosRequisiciones, CodigosRequisiciones: String;
begin
    If qODTCODIGOODT.asstring = '' then  raise exception.create('Debe ingresar la zona origen.');
    //Interfaz OW
    {
    Query:=TQuery.Create(Application);
    Query.DatabaseName:='BaseDato';
    Query.sql.Clear;
    Query.sql.Add('select CONSECUTIVO, CODIGOREQUISICION from odtrequisicion where estado in (''APROBADA'',''VIGENTE'')  '+
                  ' AND CODIGOODT = '+qODTCODIGOODT.AsString);
    Query.open;
    if Query.recordcount > 0 then
    Begin
      ConsecutivosRequisiciones:= '';
      CodigosRequisiciones:= '';
      Query.first;
      while not Query.eof do
      Begin
        ConsecutivosRequisiciones:= ConsecutivosRequisiciones + Query.fieldbyname('CONSECUTIVO').asstring + ',';
        CodigosRequisiciones:= CodigosRequisiciones + Query.fieldbyname('CODIGOREQUISICION').asstring + ',';
        Query.next
      End;
      Query.close;
      Query.free;
      Delete(ConsecutivosRequisiciones, Length(ConsecutivosRequisiciones), 1);
      Delete(CodigosRequisiciones, Length(CodigosRequisiciones), 1);
      raise Exception.Create('Existen requisiciones Activas o procesadas con codigos: '+ CodigosRequisiciones +' en la(s) ODT Hija(s): '+ ConsecutivosRequisiciones +' .');
    End;
    Query.close;
    Query.free; }

end;

procedure TfODTPadre.qODTFECHAINICIOChange(Sender: TField);
begin
  inherited;
  if qODTCODIGOESTADOODT.AsInteger  = 1 then
  begin
    if ObtenerFechaServidor<qODTFECHAINICIO.AsFloat then
      qODTCODIGOESTADOODT.AsInteger := 2;
  end;
end;

procedure TfODTPadre.qODTFECHAASIGNACIONChange(Sender: TField);
begin
  inherited;
  if (qODTFECHAFINAL.AsString<>'') then
  begin
    CambioFechaFinal:=true;
  end;
end;

procedure TfODTPadre.qODTCODIGOAREAINFLUENCIAChange(Sender: TField);
begin
  old_areainfluencia:=qODTCODIGOAREAINFLUENCIA.asstring;
end;

procedure TfODTPadre.qODTAfterOpen(DataSet: TDataSet);
begin
  inherited;
  old_areainfluencia:=qODTCODIGOAREAINFLUENCIA.asstring;
end;

function TfODTPadre.ValidarHijasTerminadas: boolean;
var query:tquery;
begin
  if qODTCODIGOODT.AsString<>'' then
  begin
    result:=true;                                               
    query := TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('select count(*) from odtdia');
    query.sql.add('where codigoodt='+qODTCODIGOODT.AsString);
    query.sql.add('and ((not codigoestadoodtdia in (''6'',''7'')) or (codigoestadoodtdia is null))');
    query.open;
    if query.fields[0].AsInteger>0 then
      result:=false;
    query.close;
    query.free;
  end;
end;

procedure TfODTPadre.qODTHijaFECHAFINALTRABAJOChange(Sender: TField);
begin
  inherited;
//
end;


function TfODTPadre.VERIFICARODTPERMISOSEDITAR(PERMISO:string): Boolean;
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
    if qODTCODIGOADMINISTRATIVO.AsString<>'' then
      qDatos.SQL.Add('AND CODIGOADMINISTRATIVO = ' + qODTCODIGOADMINISTRATIVO.AsString);
    qDatos.Open;
    if qDatos.Fields[0].AsString = 'S' then
      Result:=true;
  finally
    qDatos.Free;
  end;
end;

function TfODTPadre.FechaServidor: tdatetime;
var qFecha: TQuery;
begin
  //Result := '';
  qFecha := TQuery.Create(Application);
  qFecha.DatabaseName := 'BaseDato';
  qFecha.SQL.Text := 'SELECT SYSDATE FROM DUAL';
  qFecha.Open;
  Result := qFecha.Fields[0].Asdatetime;
  qFecha.Free;
end;

function TfODTPadre.booltostr(A: boolean):string;
begin
  if A=True then Result:='Verdadero'
  else Result:='Falso';
end;


procedure TfODTPadre.sbFechaFinEstimadaClick(Sender: TObject);
begin
  inherited;
  try
    dbEdFechaFinEstimada.Setfocus;
    sFecha := dbEdFechaFinEstimada.Text;
    if sFecha = '' then
      sFecha := FechaServidorCad;
    Fecha := GetFecha(True);
    if Fecha <> '' then dbEdFechaFinEstimada.Text := Fecha;

  except
  end;

end;

procedure TfODTPadre.AgregarGastosComision1Click(Sender: TObject);
var Query: TQuery;
    Codigo: string;
    bm:TBookmark;
begin
  inherited;
  if (qODT.State in [dsEdit,dsInsert]) and qODT.CachedUpdates then
  begin
    try
      bm:=qPresMano.GetBookmark;
      qODT.Post;
      qODT.Edit;
      qPresMano.GotoBookmark(bm);
    except
    end;
  end;
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';


  if qPresManoCODIGOEMPLEADO.AsString <> '' then
  begin
    if ((qODTCODIGOMUNICIPIO.AsString<>'') and (qODTCODIGOZONAORIGEN.AsString<>''))
       or (qODTCODIGOAREAINFLUENCIA.AsString='2') then
    begin
      //if (qZonaCODIGOZONA.Asinteger<>8)and(qMunicipioCODIGOMUNICIPIO.AsString <> qZonaCODIGOMUNICIPIOBASE.AsString) then
      //begin
        if (qODTFECHAINICIO.AsString<>'') and (qODTFECHAFINAL.AsString<>'') then
        begin
          if (not ValidarConciliacion(True,qPresManoCODIGOEMPLEADO.AsString)) and (not TieneViaticosSinConciliacionEmpleado)  then
          begin
              FODTGastosComision:= TFODTGastosComision.Create(Application);
              try
                if not GastosComisionEmpleado then
                begin
                  FODTGastosComision.qViatico.Close;
                  FODTGastosComision.qViatico.ParamByName('CODIGOODT').AsString:=qPresManoCODIGOODT.AsString;
                  FODTGastosComision.qViatico.ParamByName('CODIGOEMPLEADO').AsString:=qPresManoCODIGOEMPLEADO.AsString;
                  FODTGastosComision.qViatico.Open;
                  FODTGastosComision.qViatico.Insert;
                  FODTGastosComision.qViatico.FieldByName('CODIGOMUNICIPIODESTINO').AsString:=qODTCODIGOMUNICIPIO.AsString;
                  FODTGastosComision.qViatico.FieldByName('CODIGOZONAORIGEN').AsString:=qODTCODIGOZONAORIGEN.AsString;
                  FODTGastosComision.qViatico.FieldByName('FECHAINICIO').AsDateTime:=qODTFECHAINICIO.AsDateTime;
                  FODTGastosComision.qViatico.FieldByName('FECHAFIN').AsDateTime:=qODTFECHAFINAL.AsDateTime;
                  FODTGastosComision.qViatico.FieldByName('TIPOVIATICO').AsString:='G';
                  FODTGastosComision.qViatico.Post;
                end;

                FODTGastosComision.qViatico.Close;
                FODTGastosComision.qViatico.ParamByName('CODIGOODT').AsString:=qPresManoCODIGOODT.AsString;
                FODTGastosComision.qViatico.ParamByName('CODIGOEMPLEADO').AsString:=qPresManoCODIGOEMPLEADO.AsString;
                FODTGastosComision.qViatico.Open;
                FODTGastosComision.qViatico.Edit;

                Codigo := FODTGastosComision.qViaticoCODIGOVIATICO.AsString;

                if FODTGastosComision.ShowModal = mrOk then
                begin
                  qViatico.Close;
                  qViatico.Open;
                  qViaticoResumen.Close;
                  qViaticoResumen.Open;
                end
                else
                begin
                  if (FODTGastosComision.bCancelando) then
                  begin
                    if Codigo <> '' then
                    begin
                      Query.SQL.Clear;//Eliminar todos los gastos de la comision, menos los de viaticos.
                      Query.SQL.Add('Delete from ODTVIATICODETALLE where codigoviaticodetalle in');
                      Query.SQL.Add('(Select codigoviaticodetalle  FROM ODTVIATICODETALLE OVD,imputacionmanoobra imo WHERE ovd.CODIGOVIATICO = ' + Codigo);
                      Query.SQL.Add('and ovd.CODIGOIMPUTACIONMANOOBRA=imo.CODIGOIMPUTACIONMANOOBRA ');
                      Query.SQL.Add('AND IMO.CODIGOTIPOIMPUTACIONODT=''V'' AND IMO.CODIGOSUBTIPOIMPUTACIONODT<>''VIA'')');
                      Query.ExecSQL;
                      Query.SQL.Clear;
                      Query.SQL.Add('DELETE FROM ODTVIATICODETALLETIQUETE WHERE CODIGOVIATICO = ' + Codigo);
                      Query.ExecSQL;
                      Query.SQL.Clear;
                      Query.SQL.Add('DELETE FROM ODTVIATICO WHERE CODIGOVIATICO = ' + Codigo);
                      Query.ExecSQL;
                      qViatico.Close;
                      qViatico.Open;
                      qViaticoResumen.Close;
                      qViaticoResumen.Open;
                    end;
                  end;
                end;
              except
                on e:exception do
                begin
                  showmessage(e.message);
                  try
                    Query.SQL.Clear;//Eliminar todos los gastos de la comision, menos los de viaticos.
                    Query.SQL.Add('Delete from ODTVIATICODETALLE where codigoviaticodetalle in');
                    Query.SQL.Add('(Select codigoviaticodetalle  FROM ODTVIATICODETALLE OVD,imputacionmanoobra imo WHERE ovd.CODIGOVIATICO = ' + Codigo);
                    Query.SQL.Add('and ovd.CODIGOIMPUTACIONMANOOBRA=imo.CODIGOIMPUTACIONMANOOBRA ');
                    Query.SQL.Add('AND IMO.CODIGOTIPOIMPUTACIONODT=''V'' AND IMO.CODIGOSUBTIPOIMPUTACIONODT<>''VIA'')');
                    Query.ExecSQL;
                    Query.SQL.Clear;
                    Query.SQL.Add('DELETE FROM ODTVIATICODETALLETIQUETE WHERE CODIGOVIATICO IN(SELECT CODIGOVIATICO FROM ODTVIATICO WHERE CODIGOODT='+qODTCODIGOODT.Asstring);
                    Query.SQL.Add('AND CODIGOEMPLEADO='+qPresManoCODIGOEMPLEADO.AsString+')');
                    Query.ExecSQL;
                  except
                  end;
                end;
              end;
              FODTGastosComision.Free;
          end
          else Application.MessageBox(PChar('No se pueden editar viáticos si no ha realizado la conciliación.'),PChar('Información'),MB_OK+MB_ICONINFORMATION);
        end
        else
          Application.MessageBox(PChar('No se pueden editar viáticos si no ha ingresado las fechas inicial y final de la ODT'),PChar('Error'),MB_OK);
      {end
      else
        Application.MessageBox(PChar('No se pueden editar viáticos hacia el municipio base de la misma zona.'),PChar('Error'),MB_OK);}
    end
    else
      Application.MessageBox(PChar('No se pueden editar viáticos si no ha ingresado'+ #13 + 'la zona de origen y el municipio de destino'),PChar('Error'),MB_OK);
  end
  else
    Application.MessageBox(PChar('No ha ingresado la mano de obra asociada'),PChar('Error'),MB_OK);

  Query.Free;
end;

function TfODTPadre.GastosComisionEmpleado: boolean;
var
sql:string;
qry:Tquery;
begin
  result:=False;
  sql:='SELECT DISTINCT V.CODIGOVIATICO '+
       'FROM ODTVIATICO V,ODTVIATICODETALLE VD,IMPUTACIONMANOOBRA IMO '+
       'WHERE V.CODIGOVIATICO=VD.CODIGOVIATICO AND V.CODIGOODT=:CODIGOODT '+
       'AND V.CODIGOEMPLEADO=:CODIGOEMPLEADO '+
       'AND IMO.CODIGOIMPUTACIONMANOOBRA=VD.CODIGOIMPUTACIONMANOOBRA '+
       'AND IMO.CODIGOTIPOIMPUTACIONODT=''V''  '+
       'AND IMO.CODIGOSUBTIPOIMPUTACIONODT<>''VIA''';
  qry:=Tquery.Create(Application);
  qry.DatabaseName:='BaseDato';
  qry.DataSource:=dsPresMano;
  qry.SQL.Text:=sql;
  qry.Open;

  result:=not qry.IsEmpty;

  qry.close;
  qry.free;
end;

function TfODTPadre.ValidarViaticosEmpleado: boolean;
var
sql:string;
qry:Tquery;
begin
  result:=False;
  sql:='SELECT DISTINCT V.CODIGOVIATICO '+
       'FROM ODTVIATICO V,ODTVIATICODETALLE VD,IMPUTACIONMANOOBRA IMO '+
       'WHERE V.CODIGOVIATICO=VD.CODIGOVIATICO AND V.CODIGOODT=:CODIGOODT '+
       'AND V.CODIGOEMPLEADO=:CODIGOEMPLEADO '+
       'AND IMO.CODIGOIMPUTACIONMANOOBRA=VD.CODIGOIMPUTACIONMANOOBRA '+
       'AND IMO.CODIGOTIPOIMPUTACIONODT=''V''  '+
       'AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''VIA''';
  qry:=Tquery.Create(Application);
  qry.DatabaseName:='BaseDato';
  qry.DataSource:=dsPresMano;
  qry.SQL.Text:=sql;
  qry.Open;

  result:=not qry.IsEmpty;

  qry.close;
  qry.free;

end;

procedure TfODTPadre.qODTFECHAFINALESTIMADAValidate(Sender: TField);
var query:tquery;
begin
  inherited;
  if (Sender.Text <> '' ) then
  begin
    if (Sender.AsDateTime < qODTFECHAAPROBACION.AsDateTime) then
      raise Exception.Create('La Fecha de Finalización de Trabajo No Puede Ser Menor que La Fecha de aprobación.');
    if  (Sender.AsDateTime < qODTFECHAASIGNACION.AsDateTime) then
      raise Exception.Create('La Fecha de Finalización de Trabajo No Puede Ser Menor que La Fecha de Asignación de Trabajo.');
    if  (Sender.AsDateTime < qODTFECHAINICIO.AsDateTime) then
      raise Exception.Create('La Fecha de Finalización de Trabajo No Puede Ser Menor que La Fecha de Inicio de Trabajo.');
   
  end;

  query:=tquery.create(self);
  query.databasename:='BaseDato';
  query.sql.clear;
  query.sql.add('SELECT MAX(FECHAFIN) FROM ODTVIATICO V,ODTVIATICODETALLE VD,IMPUTACIONMANOOBRA IMO ');
  query.sql.add('WHERE V.CODIGOODT='+qODTCODIGOODT.AsString+' AND (V.VALORANTICIPO IS NULL)');
  query.sql.add('AND V.CODIGOVIATICO=VD.CODIGOVIATICO ');
  query.sql.add('AND IMO.CODIGOIMPUTACIONMANOOBRA=VD.CODIGOIMPUTACIONMANOOBRA ');
  query.sql.add('AND IMO.CODIGOTIPOIMPUTACIONODT=''V''');
  query.sql.add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''VIA''');
  query.open;
  if (query.recordcount>0)and (query.fields[0].asstring<>'') then
  begin
    if query.fields[0].AsDateTime>Sender.AsDateTime then
    begin
      Query.close;
      query.free;
      raise Exception.Create('No puede cambiar La Fecha Final puesto que hay '+ #13+
      'mano de obra con viáticos asignados hasta esta fecha');
    end;
  end;
  query.close;
  query.free;
end;

function TfODTPadre.ValidarConciliacion(ValidarEmpleado:Boolean;CodEmpleado:string): Boolean;
var
sql:string;
qry:Tquery;
begin
  result:=False;
  sql:='SELECT V.CODIGOEMPLEADO,VD.VALORIMPUTACION,V.VALORVIATICOESTIMADO, '+
       'O.FECHAFINALESTIMADA,O.FECHAFINAL '+
       'FROM ODTVIATICO V,ODTVIATICODETALLE VD,IMPUTACIONMANOOBRA IMO,ODT O  '+
       'WHERE V.CODIGOVIATICO=VD.CODIGOVIATICO AND V.CODIGOODT=O.CODIGOODT AND O.CODIGOODT=:CODIGOODT ';
  if validarempleado then
    sql:=sql+'AND V.CODIGOEMPLEADO='+CODEMPLEADO+' ';

    sql:=sql+'AND IMO.CODIGOIMPUTACIONMANOOBRA=VD.CODIGOIMPUTACIONMANOOBRA '+
       'AND IMO.CODIGOTIPOIMPUTACIONODT=''V''  '+
       'AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''VIA'' '+
       'AND V.VALORVIATICOESTIMADO=VD.VALORIMPUTACION '+
       'AND TRUNC(O.FECHAFINALESTIMADA)<>TRUNC(O.FECHAFINAL) AND O.FECHAFINAL IS NOT NULL';

  qry:=Tquery.Create(Application);
  qry.DatabaseName:='BaseDato';
  qry.DataSource:=dsPresMano;
  qry.SQL.Text:=sql;
  qry.Open;

  result:=not qry.IsEmpty;

  qry.close;
  qry.free;
end;

procedure TfODTPadre.EditarViaticoConciliacion1Click(Sender: TObject);
begin
  if qPresManoCODIGOEMPLEADO.AsString <> '' then
  begin
    if ((qODTCODIGOMUNICIPIO.AsString<>'') and (qODTCODIGOZONAORIGEN.AsString<>''))
      or (qODTCODIGOAREAINFLUENCIA.AsString='2') then
    begin
      {if (qZonaCODIGOZONA.Asinteger<>8)and(qMunicipioCODIGOMUNICIPIO.AsString <> qZonaCODIGOMUNICIPIOBASE.AsString) then
      begin}
        if (qODTFECHAINICIO.AsString<>'') and (qODTFECHAFINAL.AsString<>'') then
        begin
          FViaticoConciliacion:=TFViaticoConciliacion.Create(Application);
          try
            PoblarTablasTemporalesViaticos;
            FViaticoConciliacion.qViatico.Close;
            FViaticoConciliacion.qViatico.DataSource:=dsPresMano;
            FViaticoConciliacion.qViatico.Open;
            FViaticoConciliacion.qViatico.Edit;
            if bLimpiarFECHAFINVIATICO then
              FViaticoConciliacion.qViatico.FieldByName('FECHAFIN').AsString:='';
            if (FViaticoConciliacion.ShowModal=mrOk)or not(FViaticoConciliacion.modificado) then
            begin
              qViatico.Close;
              qViatico.Open;
              qViaticoResumen.Close;
              qViaticoResumen.Open;
            end
           { else
            begin
             EscribirTablasTemporalesViaticos;
            end};
          except
            on e:exception do
            begin
              showmessage(e.message);
            end;
          end;
          FViaticoConciliacion.Free;
        end
        else
          Application.MessageBox(PChar('No se pueden editar viáticos si no ha ingresado las fechas inicial y final de la ODT'),PChar('Error'),MB_OK);
      {end
      else
        Application.MessageBox(PChar('No se pueden editar viáticos hacia el municipio base de la misma zona.'),PChar('Error'),MB_OK);}
    end
    else
      Application.MessageBox(PChar('No se pueden editar viáticos si no ha ingresado'+ #13 + 'la zona de origen y el municipio de destino'),PChar('Error'),MB_OK);
  end;
end;

function TfODTPadre.ValidarImpresionViatico: boolean;
var
sql:string;
qry:Tquery;
begin
  result:=False;
  sql:='select * from odtviatico where codigoviatico='+qViaticoresumenCODIGOVIATICO.AsString+
       ' and impresoviatico=''S''';
  qry:=Tquery.Create(Application);
  qry.DatabaseName:='BaseDato';
  qry.sql.Text:=sql;
  qry.open;
  if not qry.IsEmpty then
    result:=True;
  qry.close;
  qry.free;
end;

function TfODTPadre.ValidarImpresionGastosComision: boolean;
var
sql:string;
qry:Tquery;
begin
  result:=False;
  sql:='select * from odtviatico where codigoviatico='+qViaticoresumenCODIGOVIATICO.AsString+
       ' and impresogastos=''S''';
  qry:=Tquery.Create(Application);
  qry.DatabaseName:='BaseDato';
  qry.sql.Text:=sql;
  qry.open;
  if not qry.IsEmpty then
    result:=True;
  qry.close;
  qry.free;

end;

procedure TfODTPadre.dbEdFechaFinChange(Sender: TObject);
begin
  inherited;
  if dbEdFechaFinEstimada.Text = '' then
    dbEdFechaFinEstimada.Text:= dbEdFechaFin.Text;
end;

procedure TfODTPadre.ImprimirViaticos(tipo: Integer);   //--> 1 : Impresión de Viatico
begin                                                   //--> 2 : Impresión de Conciliación
  inherited;                                            //--> 3 : Impresión de Otros Gastos
  if qViaticoResumen.RecordCount>0 then
    begin
      case tipo of
        1 : begin
              FViatico:=TFViatico.Create(Application);
              try
                FViatico.qViatico.Close;
                FViatico.qViatico.DataSource:=dsPresMano;
                FViatico.qViatico.Open;
                FViatico.PanelEncabezado.Enabled:=false;
                FViatico.sbImprimirClick(FViatico.sbImprimir);
              finally
                FViatico.Free;
              end;
            end;
        2 : begin
              FViaticoConciliacion:=TFViaticoConciliacion.Create(Application);
              try
                FViaticoConciliacion.qViatico.Close;
                FViaticoConciliacion.qViatico.DataSource:=dsPresMano;
                FViaticoConciliacion.qViatico.Open;
                FViaticoConciliacion.sbImprimirClick(FViaticoConciliacion.sbImprimir);
              except
                on e:exception do
                begin
                  showmessage(e.message);
                end;
              end;
              FViaticoConciliacion.Free;
            end;
        3 : begin
              if GastosComisionEmpleado then
                begin
                  FODTGastosComision:= TFODTGastosComision.Create(Application);
                  try
                    if GastosComisionEmpleado then
                    begin
                      FODTGastosComision.qViatico.Close;
                      FODTGastosComision.qViatico.DataSource:= dsPresMano;
                      FODTGastosComision.qViatico.Open;
                      FODTGastosComision.sbImprimirClick(FODTGastosComision.sbImprimir);
                    end;
                  except
                    on e:exception do
                    begin
                      showmessage(e.message);
                    end;
                  end;
                  FODTGastosComision.Free;
                end;
            end;
      end;
    end;
end;

procedure TfODTPadre.Viatico1Click(Sender: TObject);
begin
  inherited;
  ImprimirViaticos(1);   //--> 1 : Impresión de Viatico
end;

procedure TfODTPadre.Conciliacion1Click(Sender: TObject);
begin
  inherited;
  if ((qODTCODIGOESTADOODT.asinteger = 6) and (Terminada = true)) then
    ImprimirViaticos(2)   //--> 2 : Impresión de Conciliación
  else
    Showmessage('No se puede realizar esta operación si la ODT no está terminada.');
end;

procedure TfODTPadre.OtrosGastos1Click(Sender: TObject);
begin
  inherited;
  if ((qODTCODIGOESTADOODT.asinteger = 6) and (Terminada = true)) then
    ImprimirViaticos(3)   //--> 3 : Impresión de Otros Gastos
  else
    Showmessage('No se puede realizar esta operación si la ODT no está terminada.');
end;

function TfODTPadre.TieneConciliacionesCeroPesosODT():Boolean;
var
   sql:String;
   qry:TQuery;
begin
  result:=False;
  sql:='SELECT V.CODIGOEMPLEADO,VD.VALORIMPUTACION,V.VALORVIATICOESTIMADO, O.FECHAFINALESTIMADA,O.FECHAFINAL'+
       ' FROM ODTVIATICO V,ODTVIATICODETALLE VD,IMPUTACIONMANOOBRA IMO,ODT O'+
       ' WHERE V.CODIGOVIATICO=VD.CODIGOVIATICO'+
       ' AND V.CODIGOODT=O.CODIGOODT'+
       ' AND IMO.CODIGOIMPUTACIONMANOOBRA=VD.CODIGOIMPUTACIONMANOOBRA'+
       ' AND IMO.CODIGOTIPOIMPUTACIONODT=''V'' '+
       ' AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''VIA'' '+
       ' AND (V.CONCILIACIONREALIZADA <>  ''S'' OR (V.CONCILIACIONREALIZADA IS NULL))'+
       ' AND O.CODIGOODT= :CODIGOODT'+
       ' AND O.FECHAFINAL IS NOT NULL';

  qry:=Tquery.Create(Application);
  qry.DatabaseName:='BaseDato';
  qry.DataSource:=dsPresMano;
  qry.SQL.Text:=sql;
  qry.Open;

  result:= not qry.IsEmpty;

  qry.close;
  qry.free;
end;

function TfODTPadre.GetODTS_SinConciliacionDeViaticos(CodigoEmpleado: String; var ODTS:String):Boolean;
var
   sql:String;
   qry:TQuery;
begin
  result:=False;
  ODTS:='';
  sql:='SELECT V.CODIGOODT FROM ODTVIATICO V '+
       ' WHERE (V.CONCILIACIONREALIZADA <>  ''S'' OR (V.CONCILIACIONREALIZADA IS NULL)) '+
       ' AND V.TIPOVIATICO = ''V'' '+
       ' AND V.CODIGOODT <> '+qODTCODIGOODT.AsString+
       ' AND V.FECHAINICIO >= TO_DATE(''01/04/2014 00:00:00'', ''DD/MM/YYYY HH24:MI:SS'') '+
       ' AND V.CODIGOEMPLEADO = '+CodigoEmpleado;

  qry:=Tquery.Create(Application);
  qry.DatabaseName:='BaseDato';
  qry.SQL.Text:=sql;
  qry.Open;

  qry.Open;
  if (qry.RecordCount>0) then
  begin
    while not(qry.Eof)  do
    begin
      ODTS:=ODTS+', '+qry.Fields[0].AsString;
      qry.Next;
    end;
    ODTS:=copy(ODTS,3,length(ODTS)-2);
    Result:= True;
  end;

  qry.Close;
  qry.Free;
end;

function TfODTPadre.TieneViaticosSinConciliacionEmpleado: Boolean;
var
sql:string;
qry:Tquery;
begin
  result:=False;
  sql:='SELECT V.* FROM ODTVIATICO V,ODTVIATICODETALLE VD,IMPUTACIONMANOOBRA IMO '+
       ' WHERE V.CODIGOVIATICO=VD.CODIGOVIATICO AND V.CODIGOODT=:CODIGOODT '+
       ' AND V.CODIGOEMPLEADO=:CODIGOEMPLEADO '+
       ' AND IMO.CODIGOIMPUTACIONMANOOBRA=VD.CODIGOIMPUTACIONMANOOBRA '+
       ' AND IMO.CODIGOTIPOIMPUTACIONODT=''V'' '+
       ' AND IMO.CODIGOSUBTIPOIMPUTACIONODT = ''VIA'' '+
       ' AND V.FECHAINICIO >= TO_DATE(''01/04/2014 00:00:00'', ''DD/MM/YYYY HH24:MI:SS'') '+  //FECHA ACORDADA PARA INICIAR LA IMPLEMENTACION DE CONCILIACIONES.
       ' AND ((V.CONCILIACIONREALIZADA <>  ''S'') OR (V.CONCILIACIONREALIZADA IS NULL)) ';
  qry:=Tquery.Create(Application);
  qry.DatabaseName:='BaseDato';
  qry.DataSource:=dsPresMano;
  qry.SQL.Text:=sql;
  qry.Open;

  result:=not qry.IsEmpty;

  qry.close;
  qry.free;

end;


procedure TfODTPadre.SpeedButton2Click(Sender: TObject);
var CIG:INTEGER;
qconsulta: tquery;
begin
  CIG := CapturarCIGMunicipio;
  if CIG <>0 then
  Begin
    qConsulta := TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.sql.add('select CODIGOMUNICIPIO, codigozona  from municipio where codigogeografico = (SELECT GETCODIGOMUNICIPIO('+ INTTOSTR(CIG)+') FROM DUAL)');
    qConsulta.open;
    //showmessage(qconsulta.fieldbyname('codigozona').asstring+' - '+  qODTCODIGOZONATRABAJO.asstring +' - '+ qZONACODIGOZONA.asstring );
    if  qconsulta.fieldbyname('codigozona').asstring <> qZONACODIGOZONA.asstring then
      raise exception.Create('El municipio seleccionado no pertenece a la zona Origen');

    if qconsulta.fieldbyname('codigomunicipio').asstring <> '' then
      qODTCODIGOMUNICIPIOORIGEN.AsInteger:=qconsulta.fieldbyname('codigomunicipio').asinteger;;
    qConsulta.Free;
  end;
end;

procedure TfODTPadre.qODTCODIGOMUNICIPIOORIGENValidate(Sender: TField);
begin
  inherited;
  if qviatico.RecordCount>0 then
    raise Exception.Create('No puede cambiar el municipio de origen puesto que hay '+ #13+
    'mano de obra con viáticos asignados para este municipio de origen');
  if qAuxilio.RecordCount>0 then
    raise Exception.Create('No puede cambiar el municipio de origen puesto que hay '+ #13 +
    'mano de obra con auxilios asignados para este municipio de origen');
end;

procedure TfODTPadre.DBGridViaticosDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  with (Sender as TDBGrid) do
  begin
    if  (gdSelected in State)  then
    begin
      DBGridViaticos.Canvas.Brush.Color :=clInfobk;
      DBGridViaticos.Canvas.Font.Color:=ClBlack;
    end;
    if DataSource.DataSet.FieldByName('CONCILIACIONREALIZADA').AsString = 'S' then
    begin
         DBGridViaticos.Canvas.Brush.Color:= 8454016;
         DBGridViaticos.Canvas.FillRect(Rect);
    end;
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TfODTPadre.BitBtn1Click(Sender: TObject);
var
  sTemp: string;
begin
  if Application.MessageBox('Es recomendable guardar los cambios realizados. Si se presenta alguna falla en la ejecución de este proceso se bloqueará el botón Aceptar. Desea ejecutarlo? ','Advertencia!', MB_ICONWARNING+MB_YESNO)=mrYes then
  begin
    try
      ProcesarAsignacionesPendientes(qODTCODIGOODT.AsFloat,sTemp);
    except
      on e: Exception do
      begin
        bbAceptar.Enabled:= False;
        Application.MessageBox(PChar('Ocurrió un error en el proceso: '+Chr(13)+Chr(13)+e.Message),'EnerGis',MB_ICONERROR+MB_OK);
      end;
    end;
  end;
end;

procedure TfODTPadre.qViaticoResumenAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if ValidarHijasTerminadas then
  begin
    if qViaticoResumenTIPO.AsString = 'OG' then
      sbEliminarViaticos.Enabled := True
    else
      sbEliminarViaticos.Enabled := False;
  end;
end;

procedure TfODTPadre.qODTNewRecord(DataSet: TDataSet);
begin
  inherited;
  qODTASOCIARREPORTESDANO.AsString:='F';
end;

procedure TfODTPadre.dbcbAsociaReportesClick(Sender: TObject);
begin
  inherited;
  if dbcbAsociaReportes.Checked then
    qCoordinadorMunicipio.Open
  else
  begin
    qCoordinadorMunicipio.Close;
    if (qODT.State in [dsEdit,dsInsert]) then
      qODTCODIGOCOORDINACIONGRUPOTRABAJO.Clear;
  end;
end;

procedure TfODTPadre.qODTASOCIARREPORTESDANOChange(Sender: TField);
var
  qConsulta: TQuery;
begin
  inherited;
  if (qODT.State in [dsEdit]) then
  begin
    if (Sender.NewValue <> Sender.OldValue) then
    begin
      qConsulta := TQuery.Create(nil);
      qConsulta.DatabaseName := 'BaseDato';
      qConsulta.SQL.add('SELECT CONSECUTIVO FROM ODTDIA WHERE CODIGOODT = '+qODTCODIGOODT.AsString);
      qConsulta.Open;
      bCambioASOCIARRPORTEDANO := not qConsulta.IsEmpty;
      qConsulta.Close;
      qConsulta.Free;
    end;
  end;
end;

procedure TfODTPadre.BitBtn2Click(Sender: TObject);
var
  Excel, WorkBook, WorkSheet: Variant;
  j, max, inc : Integer;
  MensageEstado, existeCodCuenta: String;
  qTemp : TQuery;
begin
  inherited;
  if OpenDialog1.Execute then
  begin
    Excel := CreateOleObject('Excel.Application');
    Excel.Workbooks.Open(OpenDialog1.FileName);
    Excel.Workbooks[1].worksheets[1].Activate;
    WorkBook := Excel.ActiveWorkBook;
    WorkSheet := WorkBook.ActiveSheet;

    try
      qTemp := TQuery.Create(nil);
      qTemp.DatabaseName := 'BaseDato';
      try
        j := 1;
        while WorkSheet.cells.item[j + 1, 1].Text <> '' do
        Begin
          qTemp.SQL.Clear;
          qTemp.SQL.Text:= 'SELECT DISTINCT CODIGOCUENTA '+
                             'FROM ODTCUENTACAMPANA '+
                            'WHERE CODIGOCUENTA = TRIM('+QuotedStr(WorkSheet.cells.item[j+1,1].Text)+')' +
                             ' AND CODIGOODT = '+qODTCODIGOODT.AsString;
          qTemp.Open;
          existeCodCuenta:= qTemp.FieldByName('CODIGOCUENTA').AsString;
          if existeCodCuenta = '' then
            begin
              if qTemp.Active then
                qTemp.Close;
              qTemp.SQL.Clear;
              qTemp.SQL.Add('INSERT INTO ODTCUENTACAMPANA');
              qTemp.SQL.Add('(CODIGOODT,CODIGOCUENTA)');
              qTemp.SQL.Add('VALUES (');
              qTemp.SQL.Add(qODTCODIGOODT.AsString+',');
              qTemp.SQL.Add('TRIM('+QuotedStr(WorkSheet.cells.item[j+1,1].Text)+')');
              qTemp.SQL.Add(')');
              qTemp.ExecSQL;
            end;
          qTemp.Close;
          j := j + 1;
        end;
        MensageEstado := 'Se han Insertado ' + IntToStr(j - 1)+ ' Registros exitosamente';
        Application.MessageBox(PChar(MensageEstado), 'EnerGis', MB_OK + MB_ICONINFORMATION);
      except
        on E: Exception do
          Application.MessageBox(PChar('Ocurrio un error, por favor verifique el archivo e intente cargar de nuevo. Error: '+Chr(13)+Chr(13)+E.Message),'EnerGis',MB_OK+MB_ICONERROR);
      end;
    finally
      qTemp.Close;
      qTemp.Free;
      Excel.Workbooks.Close;
      Excel.Quit;
      Excel := Unassigned;
    end;

    qTemp := TQuery.Create(nil);
    qTemp.DatabaseName := 'BaseDato';
    qTemp.SQL.Clear;
    qTemp.SQL.Text:= 'SELECT DISTINCT CODIGOCUENTA '+
                       'FROM ODTCUENTACAMPANA '+
                      'WHERE CONSECUTIVO IS NULL '+
                        'AND CODIGOODT = '+qODTCODIGOODT.AsString;
    qTemp.Open;
    if not qTemp.IsEmpty then
      begin
        max:= qTemp.RecordCount;
        inc:= 1;
//        ShowMessage(IntToStr(max));
        qTemp.First;
        fFormaEspere := TfFormaEspere.Create(Application);
        fFormaEspere.ProgressBar1.Max := max;
        fFormaEspere.lbMotivo.Caption := 'Creando ODT Hija '+IntToStr(inc);
        fFormaEspere.FormStyle:= fsStayOnTop;
        fFormaEspere.Show;
        fFormaEspere.Refresh;
        while not qTemp.Eof do
          begin
            if CrearODTHijaComercial(qTemp.FieldByName('CODIGOCUENTA').AsString) then
              begin
                inc:= inc+1;
                fFormaEspere.lbMotivo.Caption := 'Creando ODT Hija '+IntToStr(inc);
              end;
            fFormaEspere.Incremente(1);
            fFormaEspere.Refresh;
            qTemp.Next;
          end;
        fFormaEspere.Free;
      end;
    qTemp.Close;
    qTemp.Free;
  end;
end;

function TfODTPadre.CrearODTHijaComercial(codigoCuenta:String) : Boolean;
var
  slDatos : TStringList;
  qConsulta : TQuery;
  sRes, sCodTipoGestion, sCodUbicacion, sCodReporte, sCodClienteSGD : string;
  ODTHija : TODTHija;
  i, ConsecutivoODT : Integer;
  Tamano: Word;
begin
  Result:= False;
  Tamano := 255;
  SetLength(sRes, 255);
  try
    if codigoCuenta <> '' then
      begin
        slDatos:= TStringList.Create;
        slDatos.Clear;
        Application.NormalizeTopMosts;
        if GetDatosCuenta390(CodigoCuenta, PChar(sRes), Tamano) then
        begin
          SetLength(sRes, Tamano);
//          ShowMessage(sRes);
          slDatos.CommaText:= sRes;
        end;
        Application.RestoreTopMosts;
        Application.ProcessMessages;
        sCodUbicacion:= slDatos.Values['CODIGOUBICACION'];
//        ShowMessage(sCodUbicacion);
        case qODTCODIGOLABOR.AsInteger of
          121 : sCodTipoGestion:= '1';
          122 : sCodTipoGestion:= '2';
          123 : sCodTipoGestion:= '3';
          124 : sCodTipoGestion:= '4';
        else
          sCodTipoGestion:= '1';
        end;
        if slDatos.Count > 0 then
          begin
            qConsulta:= TQuery.Create(nil);
            qConsulta.DatabaseName := 'BaseDato';
            qConsulta.SQL.Clear;
            qConsulta.SQL.Text:= 'INSERT INTO SIGCOM_CONVEXCEL '+
                                 '(CODIGOCUENTA, REFERENCIA, NOMBRES, SERIAL, CODIGOTIPOGESTION, TIPOREGISTRO, FECHACARGA, SECTOR, OFICINA, CODIGOUBICACION) '+
                                 'VALUES '+
                                 '('+codigoCuenta+', '+QuotedStr(slDatos.Values['REFERENCIA'])+', '+QuotedStr(slDatos.Values['NOMBRES'])+
                                 ', '+QuotedStr(slDatos.Values['SERIAL'])+', '+QuotedStr(sCodTipoGestion)+', 1, SYSDATE, TRIM('+QuotedStr(slDatos.Values['SECTOR'])+') '+
                                 ', TRIM('+QuotedStr(slDatos.Values['OFICINA'])+'), '+QuotedStr(slDatos.Values['CODIGOUBICACION'])+')';
            qConsulta.SQL.SaveToFile(GetTemporalPath+'insert_CONV_EXCEL.txt');
            qConsulta.ExecSQL;
            qConsulta.Close;
            qConsulta.SQL.Clear;
            qConsulta.SQL.Text:= 'SELECT MAX(CODIGOREPORTE) CODIGOREPORTE '+
                                 'FROM SIGCOM_GESTION G '+
                                 'WHERE G.CODIGOCUENTA = '+codigoCuenta;
            qConsulta.SQL.SaveToFile(GetTemporalPath+'codRporte_GESTION.txt');
            qConsulta.Open;
            sCodReporte:= qConsulta.FieldByName('CODIGOREPORTE').AsString;
            ODTHija := TODTHija.Create(qODTCODIGOODT.AsFloat,qODTCODIGOADMINISTRATIVO.AsFloat);
            ConsecutivoODT:= ODTHija.CrearODTHija;
            if sCodReporte <> '' then
              begin
                ODTHija.AsignarReporte(StrToFloat(sCodReporte));
                if qConsulta.Active then
                  qConsulta.Close;
                qConsulta.SQL.Clear;
                qConsulta.SQL.Text:= 'SELECT * FROM REPORTE WHERE CODIGOREPORTE='+sCodReporte+' ';
                qConsulta.Open;
                ODTHija.AsignarDireccion(qConsulta);
              end;
            if ConsecutivoODT > 0 then
              begin
                if qConsulta.Active then
                  qConsulta.Close;
                qConsulta.SQL.Clear;
                qConsulta.SQL.Text:= 'UPDATE ODTCUENTACAMPANA '+
                                       ' SET CONSECUTIVO = '+IntToStr(ConsecutivoODT)+' '+
                                     ' WHERE CODIGOODT = '+qODTCODIGOODT.AsString+' '+
                                       ' AND CODIGOCUENTA = '+QuotedStr(codigoCuenta);
                qConsulta.SQL.SaveToFile(GetTemporalPath+'update_consecutivo_ODTCUENTACAMPANA.txt');
                qConsulta.ExecSQL;
              end;
            if qConsulta.Active then
              qConsulta.Close;
            qConsulta.SQL.Clear;
            qConsulta.SQL.Text:= 'SELECT CODIGOCLIENTESGD '+
                                 'FROM CLIENTESGD C '+
                                 'WHERE C.CODIGOCLIENTECOM = '+codigoCuenta;
            qConsulta.SQL.SaveToFile(GetTemporalPath+'codClienteSGD_ODTCLIENTESGD.txt');
            qConsulta.Open;
            sCodClienteSGD:= qConsulta.FieldByName('CODIGOCLIENTESGD').AsString;
            if sCodClienteSGD <> '' then
              ODTHija.InsertarInfraestructura('',sCodClienteSGD,'',codigoCuenta);
            ODTHija.Free;
            Result:= True;
            qConsulta.Free;
          end;
        slDatos.Clear;
        slDatos.Free;
      end;
  except
    on e:Exception do
    begin
      Result:= False;
      showmessage(e.message);
    end;
  end;
end;


end.






