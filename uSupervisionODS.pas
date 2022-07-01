unit uSupervisionODS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls, Mask, Menus,
  MPlayer, RXClock, ComCtrls,Registry;

type

TIndice = class
  private
    fNombreTabla : string;
  public
    Query : TQuery;

end;



  TfSupervisionODS = class(TFdSgdListaBase)
    qListaReportes: TQuery;
    qTipoDano: TQuery;
    pmEstadistica: TPopupMenu;
    Totalatencinalcliente1: TMenuItem;
    ndicedeatencinalclienterearural1: TMenuItem;
    Estadsticaanterior1: TMenuItem;
    ndicedepodas1: TMenuItem;
    Timer: TTimer;
    qODTReporte: TQuery;
    qTotalesTOTAL: TFloatField;
    StatusBar1: TStatusBar;
    lFecha: TLabel;
    qReporteAsociado: TQuery;
    dsReporteAsociado: TDataSource;
    qReporteAsociadoCODIGOREPORTE: TFloatField;
    qReporteAsociadoNOMBREINFORMANTE: TStringField;
    qReporteAsociadoTELEFONO: TStringField;
    qReporteAsociadoDireccion: TStringField;
    qReporteAsociadoCIG: TStringField;
    qReporteAsociadoCIGDANO: TFloatField;
    qReporteAsociadoCODIGOTIPOVIA: TFloatField;
    qReporteAsociadoCODIGONOMBREVIA: TFloatField;
    qReporteAsociadoMODIFICADORVIA: TStringField;
    qReporteAsociadoDUPLICADOR: TFloatField;
    qReporteAsociadoMODIFICADORDUPLICADOR: TStringField;
    qReporteAsociadoNUMEROPUERTA: TFloatField;
    qReporteAsociadoCODIGOTIPOPREDIO: TStringField;
    qReporteAsociadoCODIGOCLIENTESGD: TFloatField;
    qTipoElemento: TQuery;
    dsTipoElemento: TDataSource;
    qReporteAsociadoCODIGOSUBESTACION: TStringField;
    qReporteAsociadoCODIGOCIRCUITO: TStringField;
    qReporteAsociadoCODIGOAPOYO: TFloatField;
    qReporteAsociadoCODIGOTRAFODIS: TFloatField;
    qReporteAsociadoCODIGOINTERRUPTORDIS: TFloatField;
    qReporteAsociadoPINTADOAPOYO: TStringField;
    Panel9: TPanel;
    qReporteAsociadoCODIGOESTADOREPORTE: TStringField;
    qReporteAsociadoNOMBREESTADOREPORTE: TStringField;
    qReporteAsociadoCOLOR: TFloatField;
    qReporteAsociadoDESCRIPCION: TMemoField;
    qReporteAsociadoDESCRIPCIONTIPOPREDIO: TMemoField;
    pmExportar: TPopupMenu;
    MenuItem3: TMenuItem;
    qListaReportesCODIGOREPORTE: TFloatField;
    qListaReportesTIPOCLIENTE: TStringField;
    qListaReportesPRIORIDADESTIMADA: TFloatField;
    qListaReportesCIGINFORMANTE: TFloatField;
    qListaReportesCIGDANO: TFloatField;
    qListaReportesNOMBREMUNICIPIO: TStringField;
    qListaReportesDIRECCIONDANO: TStringField;
    qListaReportesCODIGOADMINISTRATIVO: TFloatField;
    qListaReportesCODIGOTIPOREPORTE: TStringField;
    qListaReportesCODIGOCLASEREPORTE: TStringField;
    qListaReportesCODIGOTIPODANO: TFloatField;
    qListaReportesCODIGOPRIORIDAD: TStringField;
    qListaReportesNOMBRECATEGORIA: TStringField;
    qListaReportesNOMBREDEPARTAMENTO: TStringField;
    qListaReportesSEDEOPERATIVA: TStringField;
    qListaReportesCODIGOESTADOREPORTE: TStringField;
    qListaReportesNUMEROCARTA: TStringField;
    qListaReportesCODIGOESTADOCARTA: TFloatField;
    qListaReportesREGISTROS: TFloatField;
    qListaReportesDESCRIPCION: TMemoField;
    qListaReportesOBSERVACION: TMemoField;
    qListaReportesFECHAHORA: TDateTimeField;
    qListaReportesFECHAULTIMOREGISTRO: TDateTimeField;
    qListaReportesFECHAHORADICTADO: TDateTimeField;
    qListaReportesFECHAHORALLEGADA: TDateTimeField;
    qListaReportesFECHAHORAFIN: TDateTimeField;
    qListaReportesCODIGOAPOYO: TFloatField;
    qListaReportesCODIGOCLIENTESGD: TFloatField;
    qListaReportesCODIGOINTERRUPTORDIS: TFloatField;
    qListaReportesCODIGOCLIENTECOM: TFloatField;
    qListaReportesPINTADOAPOYO: TStringField;
    qListaReportesCODIGOSUBESTACION: TStringField;
    qListaReportesNOMBRETIPOREPORTE: TStringField;
    qListaReportesNOMBRECLASEREPORTE: TStringField;
    qListaReportesCODIGOCOMUNA: TFloatField;
    qListaReportesNOMBRETIPODANO: TStringField;
    qListaReportesCOLOR: TFloatField;
    qListaReportesNOMBREESTADOREPORTE: TStringField;
    qListaReportesPRIORIDADDANO: TFloatField;
    qListaReportesCIAINFORMANTE: TFloatField;
    qListaReportesNOMBREGRUPOTRABAJO: TStringField;
    qListaReportesCODIGOUSUARIOCREACION: TFloatField;
    qListaReportesCODIGOCLASECLIENTE: TFloatField;
    qListaReportesNOMBRECLASECLIENTE: TStringField;
    qListaReportesCODIGOGRUPOTRABAJO: TFloatField;
    sbVistaPreliminarVL: TSpeedButton;
    qGestion: TQuery;
    dsGestion: TDDataSource;
    qGestionCODIGOGESTION: TFloatField;
    qGestionCODIGOCUENTA: TFloatField;
    qGestionCODIGOODT: TFloatField;
    qGestionCONSECUTIVO: TFloatField;
    qGestionTIPOCAUSALNOGESTION: TFloatField;
    qGestionOBSERVACIONESGESTION: TStringField;
    qGestionFECHAHORAINI: TDateTimeField;
    qGestionFECHAHORAFIN: TDateTimeField;
    qGestionNUEVALECTURA: TFloatField;
    qGestionNOMBREATIENDE: TStringField;
    qGestionDOCUMENTOATIENDE: TStringField;
    qGestionTELEFONOATIENDE: TStringField;
    qGestionTESTIGO: TStringField;
    qGestionOBSERVACIONANOMALIAS: TMemoField;
    qGestionOBSERVACIONCORTERECONEXION: TMemoField;
    qGestionFECHAHORADESCARGADO: TDateTimeField;
    qGestionCODIGOREPORTE: TFloatField;
    qGestionDESCRIPCIONODT: TMemoField;
    qGestionNOMBREEMPLEADO: TStringField;
    qGestionNOMBREGRUPOTRABAJO: TStringField;
    qFinca: TQuery;
    dsFinca: TDDataSource;
    qMedidor: TQuery;
    dsMedidor: TDDataSource;
    dsPuntoMedida: TDDataSource;
    qPuntoMedida: TQuery;
    qEnergis: TQuery;
    dsEnergis: TDDataSource;
    qSuministro: TQuery;
    dsSuministro: TDDataSource;
    qFincaDESVIACIONFINCA: TMemoField;
    qFincaPROVINCIA: TStringField;
    qFincaMUNICIPIO: TStringField;
    qFincaOFICINA: TStringField;
    qFincaSECTOR: TStringField;
    qFincaBARRIO: TStringField;
    qFincaTIPOVIA: TMemoField;
    qFincaCALLE: TStringField;
    qFincaNUMEROPUERTA: TStringField;
    qFincaTIPOFINCA: TMemoField;
    qFincaNOMBREFINCA: TStringField;
    qFincaREFERENCIA: TStringField;
    qFincaESTADOFINCA: TMemoField;
    qFincaOBSERVACIONFINCA: TStringField;
    qMedidorDESVIACIONMEDIDOR: TMemoField;
    qMedidorTIPOCONEXION: TMemoField;
    qMedidorDESCRIPCION: TStringField;
    qMedidorLECTURA: TFloatField;
    qMedidorDIGITOS: TFloatField;
    qMedidorMULTIPLO: TFloatField;
    qMedidorVUELTAS: TFloatField;
    qMedidorKH: TFloatField;
    qMedidorKD: TFloatField;
    qMedidorIRREGULARIDADMEDIDOR: TMemoField;
    qMedidorOBSERVACIONMEDIDOR: TStringField;
    qMedidorSERIAL: TStringField;
    qEnergisCODIGOPINTADO: TFloatField;
    qEnergisNOMBRETIPOAPOYO: TStringField;
    qEnergisTIPOACOMETIDA: TMemoField;
    qEnergisOBSERVACIONENERGIS: TStringField;
    qEnergisNOMBRECIRCUITO: TStringField;
    qEnergisCODIGOCTRANS: TStringField;
    qEnergisTIPOCTRANS: TStringField;
    qEnergisPOTENCIACTRANS: TStringField;
    qSuministroCODIGOSUMINSITRO: TFloatField;
    qSuministroAPELLIDOS: TStringField;
    qSuministroNOMBRES: TStringField;
    qSuministroIRREGULARIDADSUMINISTRO: TMemoField;
    qSuministroTIPOENTRADA: TMemoField;
    qSuministroENTRADA: TStringField;
    qSuministroTIPOPISO: TMemoField;
    qSuministroPISO: TStringField;
    qSuministroTIPOAPARTAMENTO: TMemoField;
    qSuministroAPARTAMENTO: TStringField;
    qSuministroNOMBRECOMERCIAL: TStringField;
    qSuministroOBSERVACIONSUMINISTRO: TStringField;
    qSuministroRUBRO: TMemoField;
    qArtefactos: TQuery;
    dsArtefactos: TDDataSource;
    qArtefactosARTEFACTOSNOMBRE: TStringField;
    qArtefactosCANTIDAD: TFloatField;
    qArtefactosTOTALCARGAARTEFACTO: TFloatField;
    qAnomalia: TQuery;
    dsAnomalia: TDDataSource;
    qAnomaliaNOMBRE: TStringField;
    qMaterial: TQuery;
    dsMaterial: TDDataSource;
    qPuntoMedidaINFRAESTRUCTURAELECTRICA: TMemoField;
    qPuntoMedidaNUMEROFILAS: TFloatField;
    qPuntoMedidaNUMEROCOLUMNAS: TFloatField;
    qPuntoMedidaOBSERVACIONESPM: TStringField;
    qPuntoMedidaIRREGULARIDAD: TMemoField;
    qManoObra: TQuery;
    dsManoObra: TDDataSource;
    qManoObraMANOOBRA: TMemoField;
    qListaReportesCODIGOGESTION: TFloatField;
    qPuntoMedidaINFRAESTRUCTURA: TStringField;
    qGestionANOMALIAOBSERVACION: TStringField;
    qGestionCORTERECONEXIONOBSERVACION: TStringField;
    qGestionODTDESCRIPCION: TStringField;
    qFincaFINCADESVIACION: TStringField;
    qFincaVIATIPO: TStringField;
    qFincaFINCATIPO: TStringField;
    qFincaFINCAESTADO: TStringField;
    qMedidorMEDIDORDESVIACION: TStringField;
    qMedidorCONEXIONTIPO: TStringField;
    qMedidorMEDIDORIRREGULARIDAD: TStringField;
    qPuntoMedidaIRREGULARIDADPM: TStringField;
    qEnergisACOMETIDATIPO: TStringField;
    qSuministroSUMINISTROIRREGULARIDAD: TStringField;
    qSuministroENTRADATIPO: TStringField;
    qSuministroPISOTIPO: TStringField;
    qSuministroAPARTAMENTOTIPO: TStringField;
    qSuministroRUBROSUMINISTRO: TStringField;
    qGestionTIPOGESTION: TMemoField;
    qGestionTIPOCORTERECONEXION: TMemoField;
    qGestionGESTIONTIPO: TStringField;
    qGestionCORTERECONEXIONTIPO: TStringField;
    SpeedButton1: TSpeedButton;
    qListaReportesCODIGOODT: TFloatField;
    pmGestion: TPopupMenu;
    exportarGestion: TMenuItem;
    pmFinca: TPopupMenu;
    exportarFinca: TMenuItem;
    pmMedidor: TPopupMenu;
    ExportarMedidor: TMenuItem;
    pmPuntoMedida: TPopupMenu;
    exportarPM: TMenuItem;
    pmEnergis: TPopupMenu;
    exportarEnergis: TMenuItem;
    pmSuministro: TPopupMenu;
    exportarSuministro: TMenuItem;
    pmArtefacto: TPopupMenu;
    exportarArtefactos: TMenuItem;
    pmMateriales: TPopupMenu;
    exportarMateriales: TMenuItem;
    Panel4: TPanel;
    Panel14: TPanel;
    pcInformacionReporte: TPageControl;
    tsGestion: TTabSheet;
    Panel5: TPanel;
    RxDBGrid1: TRxDBGrid;
    tbFinca: TTabSheet;
    Panel6: TPanel;
    RxDBGrid2: TRxDBGrid;
    tbMedidor: TTabSheet;
    Panel7: TPanel;
    RxDBGrid3: TRxDBGrid;
    tbPuntoMedida: TTabSheet;
    Panel10: TPanel;
    RxDBGrid4: TRxDBGrid;
    tbEnergis: TTabSheet;
    Panel11: TPanel;
    RxDBGrid5: TRxDBGrid;
    tbSuministro: TTabSheet;
    Panel8: TPanel;
    RxDBGrid6: TRxDBGrid;
    tbDetalles: TTabSheet;
    gbArtefactos: TGroupBox;
    Panel12: TPanel;
    RxDBGrid7: TRxDBGrid;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    GroupBox2: TGroupBox;
    Panel13: TPanel;
    RxDBGrid8: TRxDBGrid;
    GroupBox3: TGroupBox;
    DBMemo2: TDBMemo;
    dbgListaReportes: TRxDBGrid;
    pmAnomalia: TPopupMenu;
    exportarAnomalia: TMenuItem;
    pmManoObra: TPopupMenu;
    exportarManoObra: TMenuItem;
    sbRefrescar: TSpeedButton;
    qMedidorTENSIONNOMINAL: TStringField;
    qGestionTIPOCAUSALVACIO: TStringField;
    qGestionCODIGOTIPOGESTION: TFloatField;
    qSuministroCODIGOVACIO: TStringField;
    qEnergisPINTADOVACIO: TStringField;
    qPuntoMedidaCODIGOINFRAESTRUCTURAELECTRICA: TFloatField;
    tbFuncionamiento: TTabSheet;
    Panel15: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel16: TPanel;
    RxDBGrid9: TRxDBGrid;
    TabSheet2: TTabSheet;
    Panel17: TPanel;
    RxDBGrid10: TRxDBGrid;
    TabSheet3: TTabSheet;
    Panel18: TPanel;
    RxDBGrid11: TRxDBGrid;
    TabSheet4: TTabSheet;
    Panel19: TPanel;
    RxDBGrid12: TRxDBGrid;
    TabSheet5: TTabSheet;
    Panel20: TPanel;
    RxDBGrid13: TRxDBGrid;
    TabSheet6: TTabSheet;
    Panel21: TPanel;
    RxDBGrid14: TRxDBGrid;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    GroupBox4: TGroupBox;
    Panel22: TPanel;
    RxDBGrid15: TRxDBGrid;
    GroupBox5: TGroupBox;
    DBMemo3: TDBMemo;
    GroupBox6: TGroupBox;
    Panel23: TPanel;
    RxDBGrid16: TRxDBGrid;
    GroupBox7: TGroupBox;
    DBMemo4: TDBMemo;
    RxDBGrid17: TRxDBGrid;
    dsFuncionamiento: TDDataSource;
    qFuncionamiento: TQuery;
    RxDBGrid18: TRxDBGrid;
    qFuncionamientoCONEXIONES: TStringField;
    qFuncionamientoCONTINUIDAD: TStringField;
    qFuncionamientoPRUEBASUNITARIAS: TStringField;
    qFuncionamientoDISPLAY: TStringField;
    qFuncionamientoESTADOINTEGRADOR: TStringField;
    qFuncionamientoREVISIONLAB: TStringField;
    qFuncionamientoPRUEBACALIBRACION: TStringField;
    qFuncionamientoPORERRORCALIBRACION: TStringField;
    qFuncionamientoPRUEBAINTEGRACION: TStringField;
    qFuncionamientoPORERRORINTEGRACION: TStringField;
    qFuncionamientoCAMBIOMEDIDOR: TStringField;
    qFuncionamientoAOLMEDIDOR: TStringField;
    qFuncionamientoOBSERVACIONESREVISIONLAB: TMemoField;
    qFuncionamientoCERTIFICADOREVISIONLAB: TStringField;
    qFuncionamientoCONEXIONSTRING: TStringField;
    qFuncionamientoCONTINUIDADSTRING: TStringField;
    qFuncionamientoPRUEBASUNISTRING: TStringField;
    qFuncionamientoDISPLAYSTRING: TStringField;
    qFuncionamientoESTADOINTEGRADORSTRING: TStringField;
    qFuncionamientoREVISIONLABSTRING: TStringField;
    qFuncionamientoPRUEBACALIBRACIONSTRING: TStringField;
    qFuncionamientoPRUEBAINTEGRACIONSTRING: TStringField;
    qFuncionamientoCAMBIOMEDIDORSTRING: TStringField;
    qFuncionamientoCERTIFICADOREVISIONLABSTRING: TStringField;
    tbRegistroMedidas: TTabSheet;
    qRegistroMedidas: TQuery;
    dsRegistroMedidas: TDDataSource;
    RxDBGrid19: TRxDBGrid;
    qRegistroMedidasVOLTAJEFAN: TFloatField;
    qRegistroMedidasVOLTAJEFBN: TFloatField;
    qRegistroMedidasVOLTAJEFCN: TFloatField;
    qRegistroMedidasVOLTAJEFAB: TFloatField;
    qRegistroMedidasVOLTAJEFBC: TFloatField;
    qRegistroMedidasVOLTAJEFCA: TFloatField;
    qRegistroMedidasCORRIENTEIA: TFloatField;
    qRegistroMedidasCORRIENTEIB: TFloatField;
    qRegistroMedidasCORRIENTEIC: TFloatField;
    qRegistroMedidasCORRIENTEIN: TFloatField;
    qFuncionamientoOBSERVACION: TStringField;
    qListaReportesCONSECUTIVO: TFloatField;
    qMaterialCODIGOMATERIAL: TFloatField;
    qMaterialCANTIDADCONSUMIDA: TFloatField;
    qMaterialCANTIDADRETIRADABUENA: TFloatField;
    qMaterialCANTIDADRETIRADAMALA: TFloatField;
    qMaterialNOMBREMATERIAL: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure qListaReportesCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

    procedure dbgListaReportesTitleClick(Column: TColumn);
    procedure SBOrdenarClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SBBuscarClick(Sender: TObject);
    procedure StatusBar1Click(Sender: TObject);
    procedure SBFiltroCarograficoClick(Sender: TObject);
    procedure qListaReportesAfterScroll(DataSet: TDataSet);
    procedure CargarVistaPreliminar (CodApoyo: string);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure sbAgruparReporteClick(Sender: TObject);
    procedure AgruparReporte1Click(Sender: TObject);
    procedure DesagruparReporteHijoClick(Sender: TObject);
    procedure pmAsociarChange(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure DesagruparReporte1Click(Sender: TObject);
    procedure dbgReportesAsociadosGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure MenuItem3Click(Sender: TObject);
    procedure sbVistaPreliminarVLClick(Sender: TObject);
    procedure qPuntoMedidaCalcFields(DataSet: TDataSet);
    procedure qGestionCalcFields(DataSet: TDataSet);
    procedure qFincaCalcFields(DataSet: TDataSet);
    procedure qMedidorCalcFields(DataSet: TDataSet);
    procedure qEnergisCalcFields(DataSet: TDataSet);
    procedure qSuministroCalcFields(DataSet: TDataSet);
    procedure sbExportarClick(Sender: TObject);
    procedure exportarGestionClick(Sender: TObject);
    procedure exportarFincaClick(Sender: TObject);
    procedure ExportarMedidorClick(Sender: TObject);
    procedure exportarPMClick(Sender: TObject);
    procedure exportarEnergisClick(Sender: TObject);
    procedure exportarSuministroClick(Sender: TObject);
    procedure exportarArtefactosClick(Sender: TObject);
    procedure exportarMaterialesClick(Sender: TObject);
    procedure exportarAnomaliaClick(Sender: TObject);
    procedure exportarManoObraClick(Sender: TObject);
    procedure dbgListaReportesGetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure sbRefrescarClick(Sender: TObject);
    procedure qFuncionamientoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
     gSLLista, gSLListaRotulos, gSLListaDatos, gSLListaFrom : TStringList;
    CodigoReporte : String;
  public
    { Public declarations }
    Lista,ListaEstadistica,ListaFrom : TStringList;
    TeclaShift:Boolean;
    ListaOrden:TStringList;
    MostrarTodos:Boolean;
    ListaInformantes:tstringlist;
    procedure Filtrar;
    procedure LimpiarFiltro;
    Function AsociarReporte(CodigoReporte:String):Boolean;
    procedure VisualizarFormReporte(CodigoReporte:String);
    Function TrafoPadreHijosIgualesSinAgrupar(CodReportePadre,CodReporteHijo:String):Boolean;
    function InformacionFoto(codigogestion:string; var fechalectura,tipofoto:string):string;
    function TipoCausalGestion(codigotipogestion,codigotipado: string): string;
  end;

  var
    fSupervisionODS : TfSupervisionODS;

implementation

uses uFIMPComunes, uReporte, ConsDll,
  uQRListaReportes, uFuncionSGD, uIndiceAreaMetropolitana,
  uQRListadoReportes, uBuscarReporte, UListaReportesAgrupados, uAsignarODT,
  uComunesAdministrativo,uFIMPAdministrativo,uFormaEspere,uGaleriaPreliminar,uVistaPreliminarVL;

{$R *.DFM}

procedure TfSupervisionODS.Filtrar;
Var CadFrom,sWhereLista, fechareportes : String;

begin
  Lista := GetFiltroSupervisionODS(ListaRotulos, ListaDatos, ListaFrom);
  If Lista <> Nil then
    begin
      qListaReportes.Close;
       LimpiarFiltro;
       // qListaReportes.SQL.SaveToFile('C:\Users\DIEGO\Desktop\qListaReportes.TXT');
       qListaReportes.SQl.Strings[102]:=Lista.Text;
       qListaReportes.open;

       qManoObra.close;
       qManoObra.open;
       qMaterial.close;
       qMaterial.open;
       qGestion.close;
       qGestion.open;
       qfinca.close;
       qfinca.open;
       qmedidor.close;
       qmedidor.open;
       qPuntoMedida.close;
       qPuntoMedida.open;
       qEnergis.close;
       qEnergis.open;
       qSuministro.close;
       qSuministro.open;
       qArtefactos.close;
       qArtefactos.open;
       qAnomalia.close;
       qAnomalia.open;
       qFuncionamiento.close;
       qFuncionamiento.open;
       qRegistroMedidas.close;
       qRegistroMedidas.open;
    end;
end;

procedure TfSupervisionODS.LimpiarFiltro;
begin
qListaReportes.SQL.strings[102]:= '';
end;

procedure TfSupervisionODS.FormCreate(Sender: TObject);
begin
  inherited;
  ListaFrom := TStringList.Create;
  ListaDatos := TStringList.Create;
  ListaRotulos := TStringList.Create;
  ListaOrden := TStringList.Create;
  Timer.Interval := 60000;
  Timer.Enabled := false;
  CodigoReporte:= '';

  gSLLista := TStringList.Create;
  gSLListaRotulos := TStringList.Create;
  gSLListaDatos := TStringList.Create;
  gSLListaFrom := TStringList.Create;
end;

procedure TfSupervisionODS.SBFiltrarClick(Sender: TObject);
begin
  Filtrar;
  inherited;
end;

procedure TfSupervisionODS.qListaReportesCalcFields(DataSet: TDataSet);
var qDatos:TQuery;
    Direccion:string;
begin

 end;

procedure TfSupervisionODS.FormShow(Sender: TObject);
begin
  qListaReportes.Close;
  Filtrar;
end;



procedure TfSupervisionODS.FormDestroy(Sender: TObject);
begin
  ListaFrom.Free;

  ListaOrden.Free;

  inherited;
end;

procedure TfSupervisionODS.dbgListaReportesTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if qListaReportes.FieldByName(Columna).Lookup  then
    Result := qListaReportes.FieldByName(Columna).KeyFields
  else
    if qListaReportes.FieldByName(Columna).Calculated then
    begin
      Result := '1';
      raise exception.create('Imposible ordenar por este campo calculado.');
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

  with dbgListaReportes.DataSource.DataSet do
  begin
    try
      dbgListaReportes.Columns[PreviousColumnIndex].title.Font.Style :=
      dbgListaReportes.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
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

     qListaReportes.SQl.Delete(qListaReportes.SQl.Count - 1);
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

     qListaReportes.Sql.Add(Sort);
     qListaReportes.Close;
     qListaReportes.Open;
  end;
end;

procedure TfSupervisionODS.SBOrdenarClick(Sender: TObject);
begin
  qListaReportes.Close;
  qListaReportes.Open;
  qTotales.Close;
  qTotales.Open;
end;

procedure TfSupervisionODS.TimerTimer(Sender: TObject);
var Cuantos: Integer;
    CodigoReporte : Double;
begin
  try
    Cuantos := qTotales.FieldByName('Total').AsInteger;
    qTotales.Close;
    qTotales.Open;
    StatusBar1.Color:=clBtnFace;
    StatusBar1.Font.Color:=clWindowText;
    StatusBar1.Panels[0].Text:='';
    if qTotales.FieldByName('Total').AsInteger <> Cuantos then
    begin
      Beep;    
      if qTotales.FieldByName('Total').AsInteger > Cuantos then
      begin
        MessageDlg('Ha ingresado un nuevo reporte al listado.',mtInformation,[mbOk],0);
        StatusBar1.Color:=clSilver;
        StatusBar1.Font.Color:=clNavy;
        StatusBar1.Panels[0].Text:='Se ha ingresado  al listado un nuevo reporte que cumple con el filtro aplicado.';
        CodigoReporte := qListaReportesCODIGOREPORTE.AsFloat;
      end;
      qListaReportes.Close;
      qListaReportes.Open;
//      qListaReportes.Locate('CODIGOREPORTE',CodigoReporte,[]);
    end;
  except
  end;
end;

procedure TfSupervisionODS.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
  begin
    SBOrdenarClick(nil);
  end;
end;

procedure TfSupervisionODS.SBBuscarClick(Sender: TObject);
begin
  inherited;
  FBuscarReporte := TfBuscarReporte.Create(Application);
  FBuscarReporte.dsReporte.DataSet:=qListaReportes;
  FBuscarReporte.ShowModal;
  FBuscarReporte.Free;
  dbgListaReportes.Setfocus;
end;



procedure TfSupervisionODS.StatusBar1Click(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:='';
  StatusBar1.Color:=clBtnFace;
  StatusBar1.Font.Color:=clWindowText;
end;

procedure TfSupervisionODS.SBFiltroCarograficoClick(Sender: TObject);
begin
  inherited;
  FiltroReporte(ListaRotulos, ListaDatos, ListaFrom, Lista);
end;



procedure TfSupervisionODS.qListaReportesAfterScroll(DataSet: TDataSet);
BEGIN
IF Panel4.Visible THEN
    BEGIN
    fGaleriaPreliminar := NIL;
    fGaleriaPreliminar.Free;
   CargarVistaPreliminar(qListaReportes.fieldByName('CODIGOREPORTE').AsString);
  end;

IF qListaReportesCODIGOTIPODANO.asstring <>'135' then
begin
TabSheet7.TabVisible:= false;
tbRegistroMedidas.TabVisible:=false;
end
else
begin
TabSheet7.TabVisible:= true;
tbRegistroMedidas.TabVisible:=true;
end;
end;



procedure TfSupervisionODS.SpeedButton3Click(Sender: TObject);
begin
  if qReporteAsociadoCODIGOTRAFODIS.AsString <> '' then
  begin
    MostrarMapa();
    LineasTrafoDis(qReporteAsociadoCODIGOTRAFODIS.AsString,1,3);
    MarcarClientes(ListaInformantes,clBlack,False);
  end;
end;

procedure TfSupervisionODS.SpeedButton4Click(Sender: TObject);
Var qBuscarApoyo : TQuery;
begin
  if (qReporteAsociadoCODIGOAPOYO.AsString<>'') then
  begin
    BuscarApoyo(qReporteAsociadoCODIGOAPOYO.AsString,True);
  end
  else
  begin
    qBuscarApoyo := TQuery.Create(Application);
    qBuscarApoyo.DatabaseName:=qReporteAsociado.DatabaseName;
    qBuscarApoyo.Close;
    qBuscarApoyo.Sql.Add('Select CodigoApoyo From Apoyo where PintadoApoyo='''+qReporteAsociado.FieldByName('PINTADOAPOYO').AsString+'''');
    qBuscarApoyo.Open;
    try
      BuscarApoyo(qBuscarApoyo.FieldByName('CodigoApoyo').AsString,True);
    except
      on e:exception do
      begin
        showmessage(e.message);
      end;
    end;
    qBuscarApoyo.Free;
  end;
end;

procedure TfSupervisionODS.SpeedButton5Click(Sender: TObject);
var
 nSql:integer;
 sql:string;
begin
//  MarcarClientes(ListaInformantes,clBlack);

end;

procedure TfSupervisionODS.SpeedButton6Click(Sender: TObject);
var
  i,j:Integer;
  sCodReportes,sPadre,sMensaje:string;
begin


end;

procedure TfSupervisionODS.sbAgruparReporteClick(Sender: TObject);
var
 nSql:integer;
 sql:string;
begin
  MostrarMapa();
  FlistaReportesAgrupados:=TFListaReportesAgrupados.create(Application);
  nSql:=qListaReportes.SQL.count;
  FlistaReportesAgrupados.qlistareportes.close;
  FlistaReportesAgrupados.qlistareportes.SQL.clear;
  FlistaReportesAgrupados.qlistareportes.sql.text:=qListaReportes.SQL.Text;
  sql:=FlistaReportesAgrupados.qlistareportes.sql[nSql];
  while (FlistaReportesAgrupados.qlistareportes.sql[nSql-1]='') or (pos('ORDER',uppercase(sql))>0) do
  begin
    FlistaReportesAgrupados.qlistareportes.sql.Delete(nSql-1);
    nSql:=FlistaReportesAgrupados.qlistareportes.sql.count;
    sql:=FlistaReportesAgrupados.qlistareportes.sql[nSql-1];
  end;
  FlistaReportesAgrupados.qlistareportes.sql.Add('AND (R.CODIGOCLASEREPORTE = ''2'')');
  FlistaReportesAgrupados.qlistareportes.sql.Add('AND (R.CODIGOREPORTE=R.REPORTEPADRE OR R.REPORTEPADRE IS NULL)');
  FlistaReportesAgrupados.qlistareportes.sql.Add('ORDER BY R.CODIGOREPORTE DESC');
  FlistaReportesAgrupados.qlistareportes.open;

  FlistaReportesAgrupados.show;
end;

procedure TfSupervisionODS.AgruparReporte1Click(Sender: TObject);
begin
  //if (qListaReportesCODIGOESTADOREPORTE.AsString <> '4') and (qListaReportesCODIGOESTADOREPORTE.AsString <> '5') and (qListaReportesCODIGOTRAFODIS.AsString <> '') then
  if (qListaReportesCODIGOESTADOREPORTE.AsString <> '4') and (qListaReportesCODIGOESTADOREPORTE.AsString <> '5') then
    AsociarReporte(qListaReportesCODIGOREPORTE.AsString)
  else
    Application.MessageBox('El reporte se encuentra reparado, cancelado'+#13+
                           'o  no tiene  transformador  asociado por lo'+#13+
                           'tanto no se puede agrupar manualmente.',PChar('Información'),mb_ok+MB_ICONINFORMATION);
  {if qListaReportesCODIGOTRAFODIS.AsString = ''  then
  begin
    AsociarReporte(qListaReportesCODIGOREPORTE.AsString)
  end
  else
    application.MessageBox('El reporte seleccionado tiene transformador asociado'+#13+'por lo tanto no se puede agrupar manualmente',PChar('Información'),mb_ok+MB_ICONINFORMATION);
  }
end;

function TfSupervisionODS.AsociarReporte(CodigoReporte: String): Boolean;
var
  CodigoReportePadre, CodReporteAbuelo, CodEstadoReportePadre, NomTipoLabor:String;
  qReporte, qUpdateReporte ,qCircuito, qry: TQuery;
begin
  CodReporteAbuelo:='';
  CodEstadoReportePadre:='';
  NomTipoLabor:='';

  qry:=TQuery.Create(nil);
  qry.DatabaseName:='BaseDato';
  qry.SQL.Add('SELECT CODIGOREPORTE FROM REPORTE WHERE REPORTEPADRE='+CodigoReporte);
  qry.SQL.Add('AND CODIGOREPORTE <> '+CodigoReporte);
  qry.Open;
  if not qry.IsEmpty then
  begin
    qry.Close;
    qry.Free;
    raise Exception.Create('No se puede agrupar este reporte porque tiene reporte hijos asociados.');
  end;
  qry.Close;
  qry.Free;

  if InputQuery('Digite el código de reporte a asociar','Codigo Reporte', CodigoReportePadre) then
  begin
    if CodigoReportePadre <> '' then
    begin
      qReporte:=TQuery.Create(nil);
      qReporte.DatabaseName:='BaseDato';
      qReporte.Close;
      qReporte.SQL.Clear;
      qReporte.SQL.Add('SELECT R.CODIGOREPORTE, R.CODIGOESTADOREPORTE, T.NOMBRETIPOLABORREPORTE');
      qReporte.SQL.Add('FROM REPORTE R, TIPOLABORREPORTE T');
      qReporte.SQL.Add('WHERE R.CODIGOTIPOLABORREPORTE=T.CODIGOTIPOLABORREPORTE(+)');
      qReporte.SQL.Add('AND R.CODIGOREPORTE='+CodigoReportePadre);
      qReporte.Open;
      if not qReporte.IsEmpty then
      begin
        CodEstadoReportePadre:= qReporte.FieldByName('CODIGOESTADOREPORTE').AsString;
        NomTipoLabor:= qReporte.FieldByName('NOMBRETIPOLABORREPORTE').AsString;

        qry:=TQuery.Create(nil);
        qry.DatabaseName:='BaseDato';
        qry.SQL.Add('SELECT REPORTEPADRE FROM REPORTE WHERE CODIGOREPORTE='+CodigoReportePadre);
        qry.Open;
        CodReporteAbuelo:= qry.FieldByName('REPORTEPADRE').AsString;
        qry.Close;

        if (CodReporteAbuelo <> '') and (CodigoReportePadre <> CodReporteAbuelo) then
        begin
          if Application.MessageBox(pChar('No se puede asociar el reporte No. '+CodigoReporte+' al reporte digitado No. ['+CodigoReportePadre+'] '+
                                          'ya que éste ultimo se encuentra asociado al reporte No. '+CodReporteAbuelo+'.'+
                                          chr(13)+chr(13)+'Desea intentar asociar el reporte No. '+CodigoReporte+' al reporte No. '+CodReporteAbuelo+' ?'),
                                          'Agrupar Reportes',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
          begin
            CodigoReportePadre:= CodReporteAbuelo;
            qry.SQL.Clear;
            qry.SQL.Add('SELECT R.CODIGOREPORTE, R.CODIGOESTADOREPORTE, T.NOMBRETIPOLABORREPORTE');
            qry.SQL.Add('FROM REPORTE R, TIPOLABORREPORTE T');
            qry.SQL.Add('WHERE R.CODIGOTIPOLABORREPORTE=T.CODIGOTIPOLABORREPORTE(+)');
            qry.SQL.Add('AND R.CODIGOREPORTE='+CodReporteAbuelo);
            qry.Open;
            CodEstadoReportePadre:= qry.FieldByName('CODIGOESTADOREPORTE').AsString;
            NomTipoLabor:= qry.FieldByName('NOMBRETIPOLABORREPORTE').AsString;
            qry.Close;
          end
          else
          begin
            qry.Free;
            qReporte.Close;
            qReporte.Free;
            Application.MessageBox(pChar('No se asoció el reporte No. '+CodigoReporte),'Agrupar Reportes',MB_OK+ MB_ICONINFORMATION);
            Exit;
          end;
        end;
        qry.Free;

        if CodEstadoReportePadre <> '5' then
        begin
          if (not TrafoPadreHijosIgualesSinAgrupar(CodigoReportePadre,CodigoReporte)) and (UpperCase(NomTipoLabor) = 'TRANSFORMADOR') then
            ActualizarTipoLaborReporte(CodigoReportePadre,'3');

          AgruparReportes(CodigoReportePadre,CodigoReporte);
          ActualizarReportesHijos(CodigoReportePadre);
          qListaReportes.Close;
          qListaReportes.Open;
        end
        else
          application.MessageBox(PChar('El reporte padre No. '+CodigoReportePadre+' se encuentra cancelado'+#13+'por lo tanto no se le puede agrupar hijos.'),PChar('Información'),MB_OK+MB_ICONINFORMATION);
      end
      else
        application.MessageBox('El código de reporte digitado no existe',PChar('Información'),MB_OK+MB_ICONINFORMATION);

      qReporte.Close;
      qReporte.Free;
    end;
  end;
end;

procedure TfSupervisionODS.DesagruparReporteHijoClick(Sender: TObject);
var
  sCodReportes,sPadre,sMensaje,CodigoReporte:string;
begin

end;

procedure TfSupervisionODS.pmAsociarChange(Sender: TObject;
  Source: TMenuItem; Rebuild: Boolean);
var
  sCodReportes,sPadre,sMensaje:string;
begin
  
end;

procedure TfSupervisionODS.DesagruparReporte1Click(Sender: TObject);
var
  qHijosReporte:Tquery;
  CodigoReporte:String;
begin
  qHijosReporte:=TQuery.create(nil);
  qHijosReporte.DatabaseName:='BaseDato';
  qHijosReporte.sql.Add('select count(*) as cantidad from reporte where reportepadre='+qListaReportesCODIGOREPORTE.AsString);
  qHijosReporte.Open;
  if qHijosReporte.FieldByName('cantidad').AsInteger > 0 then
  begin
    if Application.MessageBox(pChar('Esta seguro de desagrupar el reporte padre '+CodigoReporte+'?'),'Desagrupar Reporte',MB_YESNO+MB_ICONQUESTION) = IDYES then
    begin
      CodigoReporte:=qListaReportesCODIGOREPORTE.AsString;
      DesAgruparReportePadre(qListaReportesCODIGOREPORTE.AsString);
      ActualizarReporteDesagrupado(qListaReportesCODIGOREPORTE.AsString);
      qListaReportes.close;
      qListaReportes.open;
      Application.MessageBox(pChar('Se desagrupó el reporte padre: '+CodigoReporte+' con éxito'),'Desagrupar Reporte',MB_OK+ MB_ICONINFORMATION);
      VisualizarFormReporte(CodigoReporte);
    end;
  end
  else
    application.MessageBox('El registro seleccionado no tiene reportes asociados.',PChar('Información'),mb_ok+MB_ICONINFORMATION);
  qHijosReporte.close;
  qHijosReporte.free;

end;

procedure TfSupervisionODS.VisualizarFormReporte(CodigoReporte:String);
begin

  if not (Assigned(Application.FindComponent('fReporte') as TForm)) then
    fReporte:=TfReporte.Create(Application);
  fReporte.qReporte.Active:=False;
  fReporte.qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE='+
                                CodigoReporte;
  fReporte.qReporte.Active:=True;
  fReporte.qReporte.Edit;
  fReporte.qgrupotrabajo.Close;
  If freporte.qReporteCODIGOGRUPOTRABAJO.ASSTRING <> '' then
    fReporte.qgrupotrabajo.SQL.text:= fReporte.qgrupotrabajo.SQL.text + ' AND (ACTIVO = ''S'' OR CODIGOGRUPOTRABAJO = '+ freporte.qReporteCODIGOGRUPOTRABAJO.ASSTRING+')'
  else
    fReporte.qgrupotrabajo.SQL.text:= fReporte.qgrupotrabajo.SQL.text + ' AND (ACTIVO = ''S'')';
  fReporte.qGrupoTrabajo.Open;

  fReporte.DBEdit3.text:='';
  fReporte.qReporteCODIGOADMINISTRATIVO.AsString:='';
  fReporte.Show;
  fReporte.ActualizarBarraEstado;
end;

procedure TfSupervisionODS.dbgReportesAsociadosGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if Field.FieldName='NOMBREESTADOREPORTE' then
  begin
     Background:=qListaReportesCOLOR.AsInteger;
  end;
  if BackGround = 0 then BackGround := clWhite;
end;

function TfSupervisionODS.TrafoPadreHijosIgualesSinAgrupar(CodReportePadre,CodReporteHijo: String): Boolean;
var
  qCompararReportes:tQuery;
begin
  result:=True;
  qCompararReportes:=TQuery.create(nil);
  qCompararReportes.DatabaseName:='BaseDato';
  qCompararReportes.sql.Add('select rp.codigoreporte as codigoreportepadre,rp.codigotrafodis as codigotrafopadre,rh.codigoreporte as codigoreportehijo,rh.codigotrafodis as codigotrafohijo');
  qCompararReportes.sql.Add('from reporte rp, reporte rh ');
  qCompararReportes.sql.Add('where rp.codigoreporte ='+CodReportePadre+' and rh.codigoreporte ='+CodReporteHijo);
  qCompararReportes.sql.Add('and rp.codigotrafodis<>rh.codigotrafodis');
  qCompararReportes.Open;
  if not qCompararReportes.eof then
    result:=False;
  qCompararReportes.Close;
  qCompararReportes.Free;
end;



procedure TfSupervisionODS.MenuItem3Click(Sender: TObject);
var
Query: TQuery;
  Lista1, Lista2: TStringList;
begin
  inherited;
//sbVistaPreliminarVL.Down := False;
//Panel4.visible:= false;
  fFormaEspere := TfFormaEspere.Create(Application);
  fFormaEspere.ProgressBar1.Max := qListaReportes.RecordCount;
  fFormaEspere.lbMotivo.Caption := 'Generando Archivo...';
  fFormaEspere.Show;
  fFormaEspere.Refresh;
  fFormaEspere.ProgressBar1.Position := 1;
  fFormaEspere.Refresh;

  Lista1 := TStringList.Create;
  Lista2 := TStringList.Create;
  qListaReportes.AfterScroll := NIL;

  qListaReportes.DisableControls;


  Lista2.Clear;
  qListaReportes.First;

  fFormaEspere.lbMotivo.Caption := 'Recopilando información...';
  fFormaEspere.ProgressBar1.Position := 3;
  fFormaEspere.Refresh;
  Lista1.Clear;
     Lista1.Add('Codigo Reporte');
     Lista1.Add('Prioridad');
     Lista1.Add('Estado Reporte');
     Lista1.Add('Tipo de daño');
     Lista1.Add('Departamento');
     Lista1.Add('Municipio');
     Lista1.Add('Barrio');
     Lista1.Add('Sede operativa');
     Lista1.Add('Fecha registro');
     Lista1.Add('Fecha finalización');
     Lista1.Add('Codigo ODT padre');
     Lista1.Add('Grupo trabajo');
     Lista2.add(Lista1.CommaText);


     while not qListaReportes.Eof do
     begin
     Lista1.Clear;
     Lista1.Add(qListaReportes.fieldByName('CODIGOREPORTE').AsString);
     Lista1.Add(qListaReportes.fieldByName('PRIORIDADESTIMADA').AsString);
     Lista1.Add(qListaReportes.fieldByName('NOMBREESTADOREPORTE').AsString);
     Lista1.Add(qListaReportes.fieldByName('NOMBRETIPODANO').AsString);
     Lista1.Add(qListaReportes.fieldByName('NOMBREDEPARTAMENTO').AsString);
     Lista1.Add(qListaReportes.fieldByName('NOMBREMUNICIPIO').AsString);
     Lista1.Add(qListaReportes.fieldByName('NOMBRECATEGORIA').AsString);
     Lista1.Add(qListaReportes.fieldByName('SEDEOPERATIVA').AsString);
     Lista1.Add(qListaReportes.fieldByName('FECHAHORA').AsString);
     Lista1.Add(qListaReportes.fieldByName('FECHAHORAFIN').AsString);
     Lista1.Add(qListaReportes.fieldByName('REPORTEPADRE').AsString);
     Lista1.Add(qListaReportes.fieldByName('NOMBREGRUPOTRABAJO').AsString);

     Lista2.add(Lista1.CommaText);
    fFormaEspere.lbMotivo.Caption := 'Generando datos...';
    fFormaEspere.ProgressBar1.Position :=
      fFormaEspere.ProgressBar1.Position + 1;
    fFormaEspere.Refresh;

    qListaReportes.Next;
  end;
  fFormaEspere.Free;

  if SaveDialog1.Execute then
  begin
    Lista2.SaveToFile(SaveDialog1.FileName);

  end;

  qListaReportes.EnableControls;

 // qListaReportes.AfterScroll := qListaReportesAfterScroll;
  // qprincipal.OnCalcFields :=qprincipalCalcFields;
  Lista1.Free;
  Lista2.Free;

end;

procedure TfSupervisionODS.sbVistaPreliminarVLClick(Sender: TObject);
var Registro : TRegIniFile;
i: integer;
begin
if qListaReportesCODIGOESTADOREPORTE.asInteger =4 then
Begin
IF sbVistaPreliminarVL.Down = true then
Begin
 if Assigned(fGaleriaPreliminar) then
 begin
  fGaleriaPreliminar := NIL;
fGaleriaPreliminar.Free;
end;
  Panel4.visible:= true;
  CargarVistaPreliminar(qListaReportes.FieldByName('CODIGOREPORTE').AsString);
end
else  Panel4.visible:= false;
end
     else
     BEGIN
      application.MessageBox(pchar('La orden de servicio no cuenta con fotos disponibles '+chr(13)+''+chr(13)+
                                      'Una vez finalice la orden de servicio (ODS) podrá visualizar las fotos.'),'Atención',MB_ICONWARNING);
      sbVistaPreliminarVL.Down := false
      END;
end;
procedure TfSupervisionODS.CargarVistaPreliminar(CodApoyo: string);
var
  CodigoApoyo,fechalectura,tipofoto: string;
  i: Integer;
begin
       fechalectura:='';
       tipofoto:='';
       CodigoApoyo:= qListaReportes.FieldByName('CODIGOGESTION').AsString;
       InformacionFoto(CodigoApoyo,fechalectura,tipofoto);
       if  CodigoApoyo <> '' then
       begin
           if  not Assigned(fGaleriaPreliminar) then
           begin
             fGaleriaPreliminar:= TfGaleriaPreliminar.CreateByparametros(Application, CodigoApoyo);
             fGaleriaPreliminar.BanderaODT:= TRUE;
             fGaleriaPreliminar.CoolBar3.Bands[0].Text := 'Fotos ODS';
             fGaleriaPreliminar.TipoDeFoto := tipofoto;
          fGaleriaPreliminar.FechaLectura := fechalectura;
           end
           else
           begin
             fGaleriaPreliminar.Align :=alClient;
           fGaleriaPreliminar.FechaLectura := fechalectura;
             fGaleriaPreliminar.TipoDeFoto := tipofoto;
            fGaleriaPreliminar.MostrarVistaPreliminar(CodigoApoyo);
           end;

           fGaleriaPreliminar.ManualDock(Panel4);
           fGaleriaPreliminar.Show;
           fGaleriaPreliminar.Zommer1.Caption := 'Foto de ODS';
       end;
     
   end;
procedure TfSupervisionODS.qPuntoMedidaCalcFields(DataSet: TDataSet);
begin
  inherited;

qPuntoMedidaIRREGULARIDADPM.asstring:= qPuntoMedidaIRREGULARIDAD.asstring;
if qPuntoMedidaCODIGOINFRAESTRUCTURAELECTRICA.asinteger >6  then
begin
qPuntoMedidaINFRAESTRUCTURA.AsString:='SIN IDENTIFICAR'
end
else qPuntoMedidaINFRAESTRUCTURA.AsString:= qPuntoMedidaINFRAESTRUCTURAELECTRICA.ASSTRING;

end;

procedure TfSupervisionODS.qGestionCalcFields(DataSet: TDataSet);
begin
  inherited;
qGestionANOMALIAOBSERVACION.ASSTRING:= qGestionOBSERVACIONANOMALIAS.ASSTRING;

qGestionCORTERECONEXIONOBSERVACION.ASSTRING:= qGestionOBSERVACIONCORTERECONEXION.ASSTRING;

qGestionODTDESCRIPCION.ASSTRING:= qGestionDESCRIPCIONODT.ASSTRING;

qGestionGESTIONTIPO.asstring:= qGestionTIPOGESTION.asstring;

qGestionCORTERECONEXIONTIPO.asstring:= qGestionTIPOCORTERECONEXION.asstring;

if qGestionTIPOCAUSALNOGESTION.asstring = '-1' then
begin
qGestionTIPOCAUSALVACIO.asstring:=''
end
else
begin
qGestionTIPOCAUSALVACIO.asstring:=TipoCausalGestion(qGestionCODIGOTIPOGESTION.asstring,qGestionTIPOCAUSALNOGESTION.asstring);
end;
if qGestionTIPOCORTERECONEXION.asstring= '-1' then
begin
 qGestionCORTERECONEXIONTIPO.asstring:= '';
end;


end;

procedure TfSupervisionODS.qFincaCalcFields(DataSet: TDataSet);
begin
  inherited;
qFincaFINCADESVIACION.asstring:= qFincaDESVIACIONFINCA.asstring;
qFincaVIATIPO.asstring:= qFincaTIPOVIA.asstring;
qFincaFINCATIPO.asstring:= qFincaTIPOFINCA.asstring;
qFincaFINCAESTADO.asstring:= qFincaESTADOFINCA.asstring;



end;

procedure TfSupervisionODS.qMedidorCalcFields(DataSet: TDataSet);
begin
  inherited;
  qMedidorMEDIDORDESVIACION.asstring:= qMedidorDESVIACIONMEDIDOR.asstring;
  qmedidorconexiontipo.asstring:= qMedidorTIPOCONEXION.asstring;
  qMedidorMEDIDORIRREGULARIDAD.asstring:= qMedidorIRREGULARIDADMEDIDOR.asstring;

end;

procedure TfSupervisionODS.qEnergisCalcFields(DataSet: TDataSet);
begin
  inherited;
qEnergisACOMETIDATIPO.asstring:= qEnergisTIPOACOMETIDA.asstring;
if qEnergisCODIGOPINTADO.asstring='-1' then
begin
qEnergisPINTADOVACIO.asstring:=''
end
else qEnergisPINTADOVACIO.asstring := qEnergisCODIGOPINTADO.asstring;

end;

procedure TfSupervisionODS.qSuministroCalcFields(DataSet: TDataSet);
begin
  inherited;
qSuministroSUMINISTROIRREGULARIDAD.asstring:= qSuministroIRREGULARIDADSUMINISTRO.asstring;
qSuministroENTRADATIPO.asstring:= qSuministroTIPOENTRADA.asstring;
qsuministropisotipo.asstring:= qSuministroTIPOPISO.asstring;
qSuministroAPARTAMENTOTIPO.asstring:= qSuministroTIPOAPARTAMENTO.asstring;
qSuministroRUBROSUMINISTRO.asstring:= qSuministroRUBRO.AsString;
if qSuministroCODIGOSUMINSITRO.asstring= '-1' then
begin
qSuministroCODIGOVACIO.asstring := '';
end
else qSuministroCODIGOVACIO.asstring:= qSuministroCODIGOSUMINSITRO.asstring;
end;

function TfSupervisionODS.InformacionFoto(codigogestion: string;
  var fechalectura, tipofoto: string): string;
var  qTemp: TQuery;
begin
 qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';
  qTemp.SQL.Clear;
  qTemp.SQL.Add('select tipofoto,TO_CHAR(fechalectura,''DD/MM/YYYY'') AS fechalectura  from sigcom_foto where clave=:codigogestion AND CODIGOITINERARIO=:codigogestion');
  qTemp.ParamByName('codigogestion').AsString := codigogestion;
  qTemp.open;

  while not qTemp.eof
  do
  begin
  if tipofoto=EmptyStr then
  tipofoto:=qTemp.FieldByName('tipofoto').AsString
  else
  tipofoto:=tipofoto+','+qTemp.FieldByName('tipofoto').AsString ;
  qTemp.next;
  end;
  fechalectura:= qTemp.FieldByName('fechalectura').asstring;
  qTemp.Close;
  qTemp.Free;



end;

procedure TfSupervisionODS.sbExportarClick(Sender: TObject);
begin
  inherited;
 if SaveDialog1.Execute then
  begin
  panel4.visible:=false;
    dsBase.DataSet.DisableControls;
    CVS1.DataSet := dsBase.DataSet;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    dsBase.DataSet.EnableControls;
  end;

end;

procedure TfSupervisionODS.exportarGestionClick(Sender: TObject);
begin
  inherited;
 if SaveDialog1.Execute then
  begin
    dsGestion.DataSet.DisableControls;
    CVS1.DataSet := dsGestion.DataSet;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    dsGestion.DataSet.EnableControls;
  end;

end;

procedure TfSupervisionODS.exportarFincaClick(Sender: TObject);
begin
  inherited;
if SaveDialog1.Execute then
  begin
    dsFinca.DataSet.DisableControls;
    CVS1.DataSet := dsFinca.DataSet;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    dsFinca.DataSet.EnableControls;
  end;
end;

procedure TfSupervisionODS.ExportarMedidorClick(Sender: TObject);
begin
  inherited;
 if SaveDialog1.Execute then
  begin
    dsMedidor.DataSet.DisableControls;
    CVS1.DataSet := dsMedidor.DataSet;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    dsMedidor.DataSet.EnableControls;
  end;
end;

procedure TfSupervisionODS.exportarPMClick(Sender: TObject);
begin
  inherited;
 if SaveDialog1.Execute then
  begin
    dsPuntoMedida.DataSet.DisableControls;
    CVS1.DataSet := dsPuntoMedida.DataSet;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    dsPuntoMedida.DataSet.EnableControls;
  end;
end;

procedure TfSupervisionODS.exportarEnergisClick(Sender: TObject);
begin
  inherited;
if SaveDialog1.Execute then
  begin
    dsEnergis.DataSet.DisableControls;
    CVS1.DataSet := dsEnergis.DataSet;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    dsEnergis.DataSet.EnableControls;
  end;
end;

procedure TfSupervisionODS.exportarSuministroClick(Sender: TObject);
begin
  inherited;
if SaveDialog1.Execute then
  begin
    dsSuministro.DataSet.DisableControls;
    CVS1.DataSet := dsSuministro.DataSet;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    dsSuministro.DataSet.EnableControls;
  end;
end;

procedure TfSupervisionODS.exportarArtefactosClick(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
  begin
    dsArtefactos.DataSet.DisableControls;
    CVS1.DataSet := dsArtefactos.DataSet;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    dsArtefactos.DataSet.EnableControls;
  end;
end;

procedure TfSupervisionODS.exportarMaterialesClick(Sender: TObject);
begin
  inherited;
 if SaveDialog1.Execute then
  begin
    dsMaterial.DataSet.DisableControls;
    CVS1.DataSet := dsMaterial.DataSet;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    dsMaterial.DataSet.EnableControls;
  end;
end;

procedure TfSupervisionODS.exportarAnomaliaClick(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
  begin
    dsAnomalia.DataSet.DisableControls;
    CVS1.DataSet := dsAnomalia.DataSet;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    dsAnomalia.DataSet.EnableControls;
  end;
end;

procedure TfSupervisionODS.exportarManoObraClick(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
  begin
    dsManoObra.DataSet.DisableControls;
    CVS1.DataSet := dsManoObra.DataSet;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    dsManoObra.DataSet.EnableControls;
  end;
end;

procedure TfSupervisionODS.dbgListaReportesGetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
  inherited;
 if Field.Text = 'CANCELADO' then
 begin
  Background := clAqua;
 end;

  if Field.Text = 'ASIGNADO' then
 begin
  Background := clYellow;
 end;

   if Field.Text = 'EN EJECUCION' then
 begin
  Background := clLime;
 end;

    if Field.Text = 'REPARADO' then
 begin
  Background := clRed;
 end;
end;

procedure TfSupervisionODS.sbRefrescarClick(Sender: TObject);
var
Marca: TBookmark;
begin
  inherited;

  Marca :=  qListaReportes.GetBookmark;

  qListaReportes.Close;
  qListaReportes.Open;
  qListaReportes.GotoBookmark(Marca);
  qManoObra.close;
       qManoObra.open;
       qMaterial.close;
       qMaterial.open;
       qGestion.close;
       qGestion.open;
       qfinca.close;
       qfinca.open;
       qmedidor.close;
       qmedidor.open;
       qPuntoMedida.close;
       qPuntoMedida.open;
       qEnergis.close;
       qEnergis.open;
       qSuministro.close;
       qSuministro.open;
       qArtefactos.close;
       qArtefactos.open;
       qAnomalia.close;
       qAnomalia.open;
end;

function TfSupervisionODS.TipoCausalGestion(
  codigotipogestion,codigotipado: string): string;
  var  qTemp: TQuery;
  tipo:string;
begin
 //124 RECONEXION 123 CORTE/SUSPENCION
IF codigotipogestion = '124' then
begin
   tipo:= '22'
end
else tipo:= '2';


  qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';
  qTemp.SQL.Clear;
  qTemp.SQL.Add('select NOMBRETIPADOS from sigcom_tipadosdetalle WHERE CODIGOTIPADOSDETALLE=:codigotipadodetalle AND CODIGOTIPADOS=:tipo');
  qTemp.ParamByName('codigotipadodetalle').AsString := codigotipado;
  qTemp.ParamByName('tipo').AsString := tipo;
  qTemp.open;
 result:= qTemp.FieldByName('NOMBRETIPADOS').AsString;
   qTemp.Close;
  qTemp.Free;

end;



procedure TfSupervisionODS.qFuncionamientoCalcFields(DataSet: TDataSet);
begin
  inherited;
qFuncionamientoOBSERVACION.ASSTRING:= qFuncionamientoOBSERVACIONESREVISIONLAB.ASSTRING;
if qFuncionamientoCONEXIONES.ASSTRING ='0'  THEN
qFuncionamientoCONEXIONSTRING.ASSTRING:= 'CONFORME'
ELSE qFuncionamientoCONEXIONSTRING.ASSTRING:= 'INCONFORME' ;


if qFuncionamientoCONTINUIDAD.ASSTRING ='0'  THEN
qFuncionamientoCONTINUIDADSTRING.ASSTRING:= 'CONFORME'
ELSE qFuncionamientoCONTINUIDADSTRING.ASSTRING:= 'INCONFORME' ;

if qFuncionamientoPRUEBASUNITARIAS.ASSTRING ='0'  THEN
qFuncionamientoPRUEBASUNISTRING.ASSTRING:= 'CONFORME'
ELSE qFuncionamientoPRUEBASUNISTRING.ASSTRING:= 'INCONFORME' ;

if qFuncionamientoDISPLAY.ASSTRING ='0'  THEN
qFuncionamientoDISPLAYSTRING.ASSTRING:= 'CONFORME'
ELSE qFuncionamientoDISPLAYSTRING.ASSTRING:= 'INCONFORME' ;

if qFuncionamientoESTADOINTEGRADOR.ASSTRING ='0'  THEN
qFuncionamientoESTADOINTEGRADORSTRING.ASSTRING:= 'NO REGISTRA'
ELSE qFuncionamientoESTADOINTEGRADORSTRING.ASSTRING:= 'REGISTRA' ;

if qFuncionamientoREVISIONLAB.ASSTRING ='0'  THEN
qFuncionamientoREVISIONLABSTRING.ASSTRING:= 'NO'
ELSE qFuncionamientoREVISIONLABSTRING.ASSTRING:= 'SI' ;

if qFuncionamientoPRUEBACALIBRACION.ASSTRING ='0'  THEN
qFuncionamientoPRUEBACALIBRACIONSTRING.ASSTRING:= 'CONFORME'
ELSE qFuncionamientoPRUEBACALIBRACIONSTRING.ASSTRING:= 'INCONFORME' ;

if qFuncionamientoPRUEBAINTEGRACION.ASSTRING ='0'  THEN
qFuncionamientoPRUEBAINTEGRACIONSTRING.ASSTRING:= 'CONFORME'
ELSE qFuncionamientoPRUEBAINTEGRACIONSTRING.ASSTRING:= 'INCONFORME' ;

if qFuncionamientoCAMBIOMEDIDOR.ASSTRING ='0'  THEN
qFuncionamientoCAMBIOMEDIDORSTRING.ASSTRING:= 'NO'
ELSE qFuncionamientoCAMBIOMEDIDORSTRING.ASSTRING:= 'SI' ;

if qFuncionamientoCERTIFICADOREVISIONLAB.ASSTRING ='0'  THEN
qFuncionamientoCERTIFICADOREVISIONLABSTRING.ASSTRING:= 'NO'
ELSE qFuncionamientoCERTIFICADOREVISIONLABSTRING.ASSTRING:= 'SI' ;











end;



end.
