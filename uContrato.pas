
unit uContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, Db, DBTables, DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, Consdll,
  utnNewDbgrid, Buttons, ComCtrls, Mask, Menus, QuickRpt, TParser, uFIMPComunes,
  uFuncionSGD,Digisoft, utMenuArbol;

type
  TfContrato = class(TFBase)
    PanelBotones: TPanel;
    BitBtnAceptar: TBitBtn;
    BitBtnCancelar: TBitBtn;
    BitBtnImprimir: TBitBtn;
    BBCartografia: TBitBtn;
    dsContrato: TDataSource;
    dsEstadoContrato: TDataSource;
    dsTipoContrato: TDataSource;
    dsPrograma: TDataSource;
    dsContratista: TDataSource;
    dsActividadContrato: TDataSource;
    dsTipoActividad: TDataSource;
    dsTipoPresupuesto: TDataSource;
    dsMaterialContrato: TDataSource;
    PopupMenuActividades: TPopupMenu;
    AdicionarActividades1: TMenuItem;
    BorrarActividades1: TMenuItem;
    qPptoMateriales: TQuery;
    dsqPptoMateriales: TDataSource;
    PopupMenuLiquidacion: TPopupMenu;
    ActividadesdelContrato1: TMenuItem;
    MaterialesLiquidados1: TMenuItem;
    PopupMenuContratos: TPopupMenu;
    ContratoObra: TMenuItem;
    PresupuestoObra: TMenuItem;
    ActividadesPresupuestadasdelaObra1: TMenuItem;
    MaterialesPresupuestadosdelaObra1: TMenuItem;
    dsFirma: TDataSource;
    DParser1: TDParser;
    qPptoMaterialesCODIGOMATERIAL: TFloatField;
    qPptoMaterialesNOMBREMATERIAL: TStringField;
    qPptoMaterialesSUM: TFloatField;
    qListaApoyo: TQuery;
    Notebook: TNotebook;
    gbUbicacion: TGroupBox;
    Opcionurbano: TDBRadioGroup;
    gbAsignacion: TGroupBox;
    Label56: TLabel;
    gbCostos: TGroupBox;
    Label53: TLabel;
    Label64: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Bevel7: TBevel;
    Label68: TLabel;
    Label70: TLabel;
    Label91: TLabel;
    Label93: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEditManoObra: TDBEdit;
    ButtonModifAIU: TButton;
    DBEditIVA: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    gbProgramacion: TGroupBox;
    Label4: TLabel;
    SpeedButtonFechaLiquidacion: TSpeedButton;
    Label15: TLabel;
    SpeedButtonFechaAsignacion: TSpeedButton;
    SpeedButtonFechaInicio: TSpeedButton;
    Label16: TLabel;
    Label3: TLabel;
    SpeedButtonFechaTerminacion: TSpeedButton;
    Label10: TLabel;
    SpeedButtonFechaCertificado: TSpeedButton;
    DBEditFechaInicio: TDBEdit;
    DBEditFechaAsignacion: TDBEdit;
    DBEditFechaLiquidacion: TDBEdit;
    DBEditFechaTerminacion: TDBEdit;
    DBEditFechaCertificado: TDBEdit;
    DBGridMaterial: TDBGrid;
    Arbol: TTreeView;
    Label9: TLabel;
    DBTGeografico: TDBText;
    sbBuscarCIG: TSpeedButton;
    dbeCIG: TDBEdit;
    qGeografico: TQuery;
    qEstadoContrato: TQuery;
    qTipoContrato: TQuery;
    qPrograma: TQuery;
    updContrato: TUpdateSQL;
    qContratista: TQuery;
    qFirma: TQuery;
    qInterventor: TQuery;
    qAuxiliar: TQuery;
    qTipoActividad: TQuery;
    qTipoPresupuesto: TQuery;
    qMaterialContrato: TQuery;
    qDivision: TQuery;
    qDepartamento: TQuery;
    dsDivision: TDataSource;
    dsDepartamento: TDataSource;
    dsInterventor: TDataSource;
    dsAuxiliar: TDataSource;
    dblcbInterventor: TDBLookupComboBox;
    qZona: TQuery;
    dsZona: TDataSource;
    DBGridActividad: TDBGrid;
    qEmpresa: TQuery;
    bbFirmas: TBitBtn;
    qEmpresaCODIGOEMPRESA: TStringField;
    qEmpresaNOMBREEMPRESA: TStringField;
    qEmpresaNOMBREABREVIADO: TStringField;
    qEmpresaNITEMPRESA: TStringField;
    qEmpresaCIUDAD: TStringField;
    qEmpresaREPRESENTANTELEGAL: TStringField;
    qEmpresaLICENCIA: TStringField;
    qEmpresaDIRECCION: TStringField;
    qEmpresaTELEFONOS: TStringField;
    qEmpresaEMAIL: TStringField;
    qEmpresaMISIONEMPRESA: TBlobField;
    qEmpresaCODIGOZONA: TStringField;
    qEmpresaCODIGOCIUDAD: TStringField;
    qEmpresaCODIGOBARRIO: TStringField;
    qTipoPresupuestoCODIGOTIPOPRESUPUESTO: TStringField;
    qTipoPresupuestoNOMBRETIPOPRESUPUESTO: TStringField;
    qActividadContrato: TQuery;
    qActividadContratoNombreActividadContrato: TStringField;
    bbClausulas: TBitBtn;
    PopupMenuClausulas: TPopupMenu;
    AdicionarClausulasIniciales: TMenuItem;
    EditarClasulas: TMenuItem;
    qClausula: TQuery;
    dsClausula: TDataSource;
    updClausula: TUpdateSQL;
    qTipoContratoCODIGOTIPOCONTRATO: TStringField;
    qTipoContratoNOMBRETIPOCONTRATO: TStringField;
    qTipoContratoIVAADMINISTRACION: TStringField;
    qTipoContratoIVAIMPREVISTOS: TStringField;
    qTipoContratoIVAUTILIDAD: TStringField;
    qGeograficoCODIGOGEOGRAFICO: TFloatField;
    qGeograficoNOMBREGEOGRAFICO: TStringField;
    qGeograficoNOMBREMUNICIPIO: TMemoField;
    qGeograficoINDICEDIFICULTAD: TFloatField;
    GroupBox5: TGroupBox;
    Label18: TLabel;
    SpeedButton1: TSpeedButton;
    sbCargarPresupuesto: TSpeedButton;
    dsgeografico: TDataSource;
    qGeograficoURBANO: TStringField;
    DBEdit4: TDBEdit;
    GroupBox1: TGroupBox;
    Label13: TLabel;
    LCodigoContrato: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label58: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DBENumeroPresupuesto: TDBEdit;
    DBEditCodAno: TDBEdit;
    EDNumeroContrato: TDBEdit;
    DBLookupComboBoxEstado: TDBLookupComboBox;
    DBLCBTipoContrato: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    GroupBox6: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBText5: TDBText;
    DBEdit11: TDBEdit;
    dblcbContratista: TDBLookupComboBox;
    qImagen: TQuery;
    dsImagen: TDataSource;
    dbgLiquidacion: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox8: TGroupBox;
    GroupBox7: TGroupBox;
    qLiquidacion: TQuery;
    dsLiquidacion: TDataSource;
    updLiquidacion: TUpdateSQL;
    qLiquidacionMaterial: TQuery;
    dsLiquidacionMaterial: TDataSource;
    updLiquidacionMaterial: TUpdateSQL;
    qLiquidacionActividad: TQuery;
    dsLiquidacionActividad: TDataSource;
    updLiquidacionActividad: TUpdateSQL;
    qLiquidacionCODIGOCONTRATOLIQUIDACION: TFloatField;
    qLiquidacionCODIGOCONTRATO: TFloatField;
    qLiquidacionCONSECUTIVO: TFloatField;
    qLiquidacionFECHA: TDateTimeField;
    qLiquidacionMaterialCODIGOCONTRATOLIQUIDACION: TFloatField;
    qLiquidacionMaterialCODIGOCONTRATOOBRA: TFloatField;
    qLiquidacionActividadCODIGOCONTRATOLIQUIDACION: TFloatField;
    qLiquidacionActividadCODIGOCONTRATOOBRA: TFloatField;
    qLiquidacionMaterialCODIGOMATERIAL: TFloatField;
    qLiquidacionMaterialCODIGOCONTRATO: TFloatField;
    qLiquidacionMaterialCONSECUTIVO: TFloatField;
    qLiquidacionActividadCODIGOCONTRATO: TFloatField;
    qLiquidacionActividadCONSECUTIVO: TFloatField;
    PanelLiquidacion: TPanel;
    DBNavigator1: TDBNavigator;
    bImprimirActaLiquidacion: TBitBtn;
    qLiquidacionActividadValorUnitario: TFloatField;
    qLiquidacionMaterialValorUnitario: TFloatField;
    qLiquidacionActividadCANTIDADLIQUIDADAACTUAL: TFloatField;
    qLiquidacionActividadCANTIDADLIQUIDADATOTAL: TFloatField;
    qLiquidacionMaterialCANTIDADLIQUIDADAACTUAL: TFloatField;
    qLiquidacionMaterialCANTIDADLIQUIDADATOTAL: TFloatField;
    qLiquidacionVALORACTIVIDADACTUAL: TFloatField;
    qLiquidacionVALORMATERIALACTUAL: TFloatField;
    qLiquidacionVALORACTIVIDADTOTAL: TFloatField;
    qLiquidacionVALORMATERIALTOTAL: TFloatField;
    qLiquidacionVALORLIQUIDACIONACTUAL: TFloatField;
    qLiquidacionVALORLIQUIDACIONTOTAL: TFloatField;
    qLiquidacionActividadCODIGOACTIVIDADCONTRATOOBRA: TFloatField;
    qLiquidacionMaterialCODIGOMATERIALCONTRATOOBRA: TFloatField;
    PopupMenuLiquidacionParcial: TPopupMenu;
    ActadeLiquidacinParcial1: TMenuItem;
    ActividadesLiquidadas1: TMenuItem;
    MaterialesLiquidados2: TMenuItem;
    qLiquidacionACTA: TFloatField;
    bLiquidacionFinal: TBitBtn;
    qLiquidacionFINAL: TStringField;
    Panel5: TPanel;
    DBGrid3: TDBGrid;
    DBNavigator2: TDBNavigator;
    DBGrid2: TDBGrid;
    DBNavigator3: TDBNavigator;
    lbCIA: TLabel;
    Label11: TLabel;
    sbCia: TSpeedButton;
    dbeCIA: TDBEdit;
    dMenuCIA: TdMenuArbol;
    qCIA: TQuery;
    qInterventorCODIGOEMPLEADO: TFloatField;
    qInterventorNOMBREEMPLEADO: TStringField;
    qContratistaCODIGOCONTRATISTA: TStringField;
    qContratistaNOMBRECONTRATISTA: TStringField;
    qContratistaREPRESENTANTE: TStringField;
    qContratistaDIRECCION: TStringField;
    qContratistaCIUDAD: TStringField;
    qContratistaTELEFONO: TStringField;
    qContratistaRETENEDORIVA: TStringField;
    qCIANOMBREADMINISTRATIVO: TStringField;
    qCIANOMBRECATEGORIA: TStringField;
    qCIACODIGOCENTROCOSTO: TFloatField;
    qCIACODIGOAREARESPONSABILIDAD: TFloatField;
    qContrato: TQuery;
    qContratoValorIVA: TFloatField;
    qContratoCostoDirecto: TFloatField;
    qContratoCostoTotal: TFloatField;
    qContratoValorMaterial: TFloatField;
    qContratoValorManoObra: TFloatField;
    qContratoValorEquipo: TFloatField;
    qContratoValorTransporte: TFloatField;
    qContratoAIU: TFloatField;
    qContratoValorAIU: TFloatField;
    qContratoCostoDirectoSinAIU: TFloatField;
    qContratoNombreGeografico: TStringField;
    dbmObjeto: TDBMemo;
    qContratoCODIGOCONTRATO: TFloatField;
    qContratoNUMEROCONTRATO: TStringField;
    qContratoCODIGOADMINISTRATIVO: TFloatField;
    qContratoCODIGOESTADOCONTRATO: TStringField;
    qContratoCODIGOTIPOCONTRATO: TStringField;
    qContratoCODIGOCONTRATISTA: TStringField;
    qContratoCODIGOINTERVENTOR: TFloatField;
    qContratoOBJETO: TBlobField;
    qContratoFECHAASIGNACION: TDateTimeField;
    qContratoFECHAINICIO: TDateTimeField;
    qContratoFECHAENTREGA: TDateTimeField;
    qContratoFECHACERTIFICADO: TDateTimeField;
    qContratoFECHALIQUIDACION: TDateTimeField;
    qContratoADMINISTRACION: TFloatField;
    qContratoIMPREVISTOS: TFloatField;
    qContratoUTILIDADES: TFloatField;
    qContratoIVA: TFloatField;
    qContratoMATERIALPRESUPUESTADO: TFloatField;
    qContratoTRANSPORTEPRESUPUESTADO: TFloatField;
    qContratoEQUIPOPRESUPUESTADO: TFloatField;
    qContratoMANOOBRAPRESUPUESTADO: TFloatField;
    qContratoSECUENCIA: TFloatField;
    qContratoANO: TStringField;
    qContratoCODIGOGEOGRAFICO: TFloatField;
    qContratoCODIGOPRESUPUESTO: TFloatField;
    qContratoMONTOTOTAL: TFloatField;
    qContratoREPRESENTANTECONTRATISTA: TStringField;
    qLiquidacionValorIva: TFloatField;
    qLiquidacionValorAIU: TFloatField;
    qLiquidacionCostoConAIU: TFloatField;
    qLiquidacionCostoTotal: TFloatField;
    DBNavigator4: TDBNavigator;
    qActividadContratoCODIGOCONTRATO: TFloatField;
    qActividadContratoCANTIDADPRESUPUESTADA: TFloatField;
    qActividadContratoMATERIALPRESUPUESTADO: TFloatField;
    qActividadContratoTRANSPORTEPRESUPUESTADO: TFloatField;
    qActividadContratoEQUIPOPRESUPUESTADO: TFloatField;
    qActividadContratoMANOOBRAPRESUPUESTADO: TFloatField;
    qActividadContratoCANTIDADEJECUTADA: TFloatField;
    qActividadContratoNombreTipoPresupuesto: TStringField;
    qActividadContratoCODIGOTIPOPRESUPUESTO: TStringField;
    qActividadContratoValorPresupuestado: TFloatField;
    qContratoIvaSobre: TStringField;
    qContratoMATERIALEJECUTADO: TFloatField;
    qContratoMANOOBRAEJECUTADO: TFloatField;
    qContratoEQUIPOEJECUTADO: TFloatField;
    qContratoTRANSPORTEEJECUTADO: TFloatField;
    qActividadContratoMATERIALEJECUTADO: TFloatField;
    qActividadContratoTRANSPORTEEJECUTADO: TFloatField;
    qActividadContratoEQUIPOEJECUTADO: TFloatField;
    qActividadContratoMANOOBRAEJECUTADO: TFloatField;
    qActividadContratoValorEjecutado: TFloatField;
    qMaterialContratoCODIGOMATERIAL: TFloatField;
    qMaterialContratoVALORUNITARIO: TFloatField;
    qMaterialContratoNOMBREMATERIAL: TStringField;
    qMaterialContratoCODIGOUNIDAD: TStringField;
    qMaterialContratoCANTIDADPRESUPUESTADO: TFloatField;
    qMaterialContratoVALORPRESUPUESTADO: TFloatField;
    qMaterialContratoCANTIDADENTREGADA: TFloatField;
    qMaterialContratoVALORENTREGADO: TFloatField;
    qMaterialContratoCANTIDADCONSUMIDA: TFloatField;
    qMaterialContratoVALORCONSUMIDO: TFloatField;
    qMaterialContratoCANTIDADREINTEGRADA: TFloatField;
    qMaterialContratoVALORREINTEGRADO: TFloatField;
    qContratoValorIvaPresupuestado: TFloatField;
    qContratoCostoDirectoPresupuestado: TFloatField;
    qContratoCostoTotalPresupuestado: TFloatField;
    qContratoValorMaterialPresupuestado: TFloatField;
    qContratoValorManoObraPresupuestado: TFloatField;
    qContratoValorEquipoPresupuestado: TFloatField;
    qContratoValorTransportePresupuestado: TFloatField;
    qContratoValorAIUPresupuestado: TFloatField;
    qContratoCostoDirectoSinAIUPresupuestado: TFloatField;
    qLiquidacionActividadCODIGOACTIVIDAD: TFloatField;
    qActividadContratoCODIGOACTIVIDAD: TFloatField;
    GroupBox4: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Button1: TButton;
    DBEditAIU: TDBEdit;
    DBEdit1IVA: TDBEdit;
    procedure ButtonModifAIUClick(Sender: TObject);
    procedure SpeedButtonFechaAsignacionClick(Sender: TObject);
    procedure SpeedButtonFechaInicioClick(Sender: TObject);
    procedure SpeedButtonFechaTerminacionClick(Sender: TObject);
    procedure SpeedButtonFechaCertificadoClick(Sender: TObject);
    procedure SpeedButtonFechaLiquidacionClick(Sender: TObject);
    procedure BitBtnImprimirClick(Sender: TObject);
    procedure AdicionarActividades1Click(Sender: TObject);
    procedure CertificadodeEntrega1Click(Sender: TObject);
    procedure BitBtnAceptarClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure BBCartografiaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActadeLiquidacin1Click(Sender: TObject);
    procedure MaterialesLiquidados1Click(Sender: TObject);
    procedure ContratoObraClick(Sender: TObject);
    procedure PresupuestoObraClick(Sender: TObject);
    procedure ActividadesPresupuestadasdelaObra1Click(Sender: TObject);
    procedure MaterialesPresupuestadosdelaObra1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGridMaterialDblClick(Sender: TObject);
    procedure ArbolChange(Sender: TObject; Node: TTreeNode);
    procedure sbBuscarCIGClick(Sender: TObject);
    procedure qActividadContratoCalcFields(DataSet: TDataSet);
    procedure qContratoCalcFields(DataSet: TDataSet);
    procedure qContratoCODIGOCONTRATOChange(Sender: TField);
    procedure qContratoCODIGOTIPOCONTRATOChange(Sender: TField);
    procedure qContratoFECHAINICIOValidate(Sender: TField);
    procedure qContratoFECHAENTREGAValidate(Sender: TField);
    procedure qContratoFECHACERTIFICADOValidate(Sender: TField);
    procedure qContratoFECHALIQUIDACIONValidate(Sender: TField);
    procedure qContratoAfterPost(DataSet: TDataSet);
    procedure qContratoAfterDelete(DataSet: TDataSet);
    procedure qMaterialContratoAfterPost(DataSet: TDataSet);
    procedure qMaterialContratoAfterDelete(DataSet: TDataSet);
    procedure qContratoCODIGOCONTRATISTAChange(Sender: TField);
    procedure qContratoSECUENCIAChange(Sender: TField);
    procedure qContratoNUMEROPRESUPUESTOValidate(Sender: TField);
    procedure qContratoANOValidate(Sender: TField);
    procedure qContratoSECUENCIAValidate(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure qContratoAfterInsert(DataSet: TDataSet);
    procedure qActividadContratoAfterCancel(DataSet: TDataSet);
    procedure qContratoAfterCancel(DataSet: TDataSet);
    procedure qMaterialContratoAfterCancel(DataSet: TDataSet);
    procedure bbFirmasClick(Sender: TObject);
    procedure bbClausulasClick(Sender: TObject);
    procedure AdicionarClausulasInicialesClick(Sender: TObject);
    procedure EditarClasulasClick(Sender: TObject);
    procedure qClausulaAfterPost(DataSet: TDataSet);
    procedure qContratoCODIGOGEOGRAFICOChange(Sender: TField);
    procedure SpeedButton1Click(Sender: TObject);
    procedure qContratoCODIGOPRESUPUESTOValidate(Sender: TField);
    procedure sbCargarPresupuestoClick(Sender: TObject);
    procedure qContratoCODIGOPRESUPUESTOChange(Sender: TField);
    procedure qActividadContratoAfterScroll(DataSet: TDataSet);
    procedure qContratoCODIGOADMINISTRATIVOChange(Sender: TField);
    procedure qLiquidacionAfterDelete(DataSet: TDataSet);
    procedure qLiquidacionAfterInsert(DataSet: TDataSet);
    procedure qLiquidacionAfterPost(DataSet: TDataSet);
    procedure qLiquidacionMaterialAfterInsert(DataSet: TDataSet);
    procedure bImprimirActaLiquidacionClick(Sender: TObject);
    procedure qLiquidacionMaterialAfterPost(DataSet: TDataSet);
    procedure qLiquidacionActividadAfterPost(DataSet: TDataSet);
    procedure qLiquidacionActividadAfterDelete(DataSet: TDataSet);
    procedure qLiquidacionMaterialCalcFields(DataSet: TDataSet);
    procedure qLiquidacionFECHAValidate(Sender: TField);
    procedure qLiquidacionBeforePost(DataSet: TDataSet);
    procedure dbgLiquidacionEditButtonClick(Sender: TObject);
    procedure qLiquidacionActividadCalcFields(DataSet: TDataSet);
    procedure qContratoAfterOpen(DataSet: TDataSet);
    procedure ActadeLiquidacinParcial1Click(Sender: TObject);
    procedure ActividadesLiquidadas1Click(Sender: TObject);
    procedure MaterialesLiquidados2Click(Sender: TObject);
    procedure dbgLiquidacionDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure bLiquidacionFinalClick(Sender: TObject);
    procedure qLiquidacionBeforeInsert(DataSet: TDataSet);
    procedure qLiquidacionBeforeDelete(DataSet: TDataSet);
    procedure sbCiaClick(Sender: TObject);
    procedure qContratoCODIGOADMINISTRATIVOValidate(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure qLiquidacionCalcFields(DataSet: TDataSet);
    procedure qLiquidacionAfterOpen(DataSet: TDataSet);
    procedure ActividadesdelContrato1Click(Sender: TObject);
    procedure dMenuCIASelectID(Sender: tnMenuItem; ID: Integer;
      MenuEstructura: tMenuEs);
  private
    { Private declarations }
    InsertandoLiquidacion:boolean;
    Pagina:integer;
  public
    Fecha,NumeroContrato,CodigoObra,EsRetenedor,NombreContratista :String;
    ValorIndice,CodDivision,CodDepartamento,CodSecuencia,codAno : String;
    ManoObraTotal,MaterialTotal,EquipoTotal,TransporteTotal,FactorDificultad, IVA, AIU : Real;
    CodigoTipoPresupuesto : Integer;
    TotalIva:real;
    sFecha:TDateTime;
    bCancelando,bDatosIncompletos,bFiltrado: boolean;
    NombreFirmante:array[0..3]of string;
    CargoFirmante:array[0..3]of string;
    MensajeError:String;
    procedure ActualizarMaterialDesdePresupuesto;
    procedure InsertarClausulasIniciales(minuta:integer);
    procedure GenerarNumeroContrato;
    function FechaServidor:string;
    procedure InsertarLiquidacionActividadObras;
    procedure ActualizarValorLiquidacionActividades;
    procedure ActualizarValorLiquidacionMateriales;
    procedure ActualizarValorLiquidacion;
    procedure InsertarLiquidacionMaterialObras;
    function GetFecha(Tipo:Boolean): String;
  end;

var
  fContrato: TfContrato;

implementation

uses uAIUContrato, uSeleccionarTipoPresupuesto, uFormaFecha, uBuscarActividad,
  uCertificadoEntrega, uInformacionContrato, uActaLiquidacion, uResolucion,
  uQRLiquidObra2, uQRActividadContrato, uQRMaterialContrato, 
  uBuscarMaterialEnerGis, uFirmaContrato, UClausulaContrato, uqrContratoObra,
  UMinuta, uqrPresupuestoContrato, uAsignarPresupuesto, uActaParcial,
  uQRActividadContratoPresupuestada, uQRActividadContratoLiquidado,
  uQRMaterialContratoPresupuestado, uQRMaterialContratoLiquidado;

{$R *.DFM}


procedure TfContrato.ActualizarMaterialDesdePresupuesto;
Var NumeroVale : String;
begin
  qPptoMateriales.Close;
  qPptoMateriales.Open;
  qPptoMateriales.First;
  try
    While Not qPptoMateriales.Eof do
    begin
      if qMaterialContrato.Locate('CodigoContrato;NumeroVale;CodigoMaterial',
                                        VarArrayOf([
                                                    CodigoObra,
                                                    NumeroVale,
                                                    qPptoMateriales.FieldByName('CodigoMaterial').AsString
                                                    ]),
                                                    [loCaseInsensitive])then
      begin
        qMaterialContrato.Edit;
        qMaterialContrato.FieldByName('CantidadSolicitada').AsFloat := qPptoMateriales.FieldByName('Sum').AsFloat;
        qMaterialContrato.Post;
      end
      else
      begin
        qMaterialContrato.Append;
        qMaterialContrato.FieldByName('CodigoContrato').AsString := CodigoObra;
        qMaterialContrato.FieldByName('CodigoMaterial').AsString := qPptoMateriales.FieldByName('CodigoMaterial').AsString;
        qMaterialContrato.FieldByName('NumeroVale').AsString := NumeroVale;
        qMaterialContrato.FieldByName('CantidadSolicitada').AsFloat := qPptoMateriales.FieldByName('Sum').AsFloat;
        qMaterialContrato.Post;
      end;
      qPptoMateriales.Next;
    end;
  except
  end;
end;

procedure TfContrato.ButtonModifAIUClick(Sender: TObject);
var
  myerrorstring:string;
begin
 try
  fAIUContrato := TfAIUContrato.Create(Application);
  fAIUContrato.Showmodal;
  fAIUContrato.Free;
 except
    MyErrorString := 'ErrorCode: ' + IntToStr(Error) + #13#10;
    Application.Messagebox(Pchar('Ocurrio un error en el Sistema'),Pchar('Información'),MB_ICONASTERISK+MB_OK)
 end;
end;

procedure TfContrato.SpeedButtonFechaAsignacionClick(Sender: TObject);
begin
  inherited;
  DBEditFechaAsignacion.Setfocus;
  Fecha := DBEditFechaAsignacion.Text;
  qContrato.fieldbyName('FECHAASIGNACION').asstring := GetFecha(false);
end;

procedure TfContrato.SpeedButtonFechaInicioClick(Sender: TObject);
begin
  inherited;
  DBEditFechaAsignacion.Setfocus;
  Fecha := DBEditFechaAsignacion.Text;
  qContrato.fieldbyName('FECHAINICIO').asstring := GetFecha(false);
end;

procedure TfContrato.SpeedButtonFechaTerminacionClick(Sender: TObject);
begin
  inherited;
  DBEditFechaTerminacion.Setfocus;
  Fecha := DBEditFechaTerminacion.Text;
  qContrato.fieldbyName('FECHAENTREGA').asstring := GetFecha(false);
end;

procedure TfContrato.SpeedButtonFechaCertificadoClick(Sender: TObject);
begin
  inherited;
  DBEditFechaCertificado.Setfocus;
  Fecha := DBEditFechaCertificado.Text;
  qContrato.fieldbyName('FECHACERTIFICADO').asstring := GetFecha(false);
end;

procedure TfContrato.SpeedButtonFechaLiquidacionClick(Sender: TObject);
begin
  inherited;
  DBEditFechaCertificado.Setfocus;
  Fecha := DBEditFechaLiquidacion.Text;
  qContrato.fieldbyName('FECHALIQUIDACION').asstring := GetFecha(false);
end;

procedure TfContrato.BitBtnImprimirClick(Sender: TObject);
var punto:TPoint;
begin
 punto:=PanelBotones.ClientToScreen(Classes.Point(BitBtnImprimir.Left, BitBtnImprimir.top));
 if (DBLookupComboBoxEstado.Text = 'PRESUPUESTADO') or (DBLookupComboBoxEstado.Text = 'ASIGNADO')then
   PopupMenuContratos.Popup(punto.x+10, punto.y+10)
 else PopupMenuLiquidacion.Popup(punto.x+10, punto.y+10);
end;

procedure TfContrato.AdicionarActividades1Click(Sender: TObject);
var i:Integer;
begin
  fBuscarActividad := TfBuscarActividad.Create(Application);
  if fBuscarActividad.ShowModal = mrOk then
  begin
  if fBuscarActividad.DBGridActividad.SelectedRows.Count>0  then
  begin
    if qContrato.State in [dsEdit,dsInsert] then
      qContrato.Post;
    qActividadContrato.open;
    for i:=0 to fBuscarActividad.DBGridActividad.SelectedRows.Count-1 do
    begin
      fBuscarActividad.qActividad.BookMark:=fBuscarActividad.DBGridActividad.SelectedRows.Items[i];
      try
       qActividadContrato.Append;
       qActividadContrato.fieldbyName('CODIGOCONTRATO').asstring := qContratoCODIGOCONTRATO.AsString;
       qActividadContrato.fieldbyName('CODIGOACTIVIDAD').asstring := fBuscarActividad.qActividad.fieldbyName('CODIGOACTIVIDAD').asstring;
       qActividadContrato.fieldbyName('CANTIDADPRESUPUESTADA').asfloat := 1;
       qActividadContrato.fieldbyName(('CodigoTipoPRESUPUESTO')).AsInteger :=CodigoTipoPresupuesto;
       qActividadContratoCalcFields(qActividadContrato);
       qActividadContrato.Post;
      except
          ShowMessage('La Actividad ya esta asignada al Contrato.');
          qActividadContrato.Cancel;
      end;
    end;
    qContrato.Edit;
  end;
  fBuscarActividad.qActividad.Active:=True;
  DBGridActividad.SelectedIndex := 0;
  end;
  fBuscarActividad.Free;
end;

procedure TfContrato.CertificadodeEntrega1Click(Sender: TObject);
var i:integer;
begin
  try
    if qContrato.state in [dsEdit,dsInsert] then qContrato.Post;
    for i:=0 to 3 do
    begin
      NombreFirmante[i]:='';
      CargoFirmante[i]:='';
    end;
    qFirma.Close;
    qFirma.ParamByName('CodigoDocumento').AsString:='ENT';
    qFirma.Open;

    i:=1;
    NombreFirmante[0]:=qContratoREPRESENTANTECONTRATISTA.AsString;
    CargoFirmante[0]:='REPRESENTANTE LEGAL - CONTRATISTA';

    while not (qFirma.Eof) and (i<4) do
    begin
      NombreFirmante[i]:=qFirma.fieldbyname('NombreEmpleado').AsString;
      CargoFirmante[i]:=qFirma.fieldbyname('NombreCargo').AsString;
      qFirma.Next;
      inc(i);
    end;

    FCertificadoEntrega := TFCertificadoEntrega.Create(self);
    for i:=0 to 3 do
    begin
      FCertificadoEntrega.NombreFirmante[i] := NombreFirmante[i];
      FCertificadoEntrega.CargoFirmante[i] := CargoFirmante[i];
    end;
    FCertificadoEntrega.Show;
  except
    FCertificadoEntrega.Free;
  end;
  qContrato.Edit;
end;

procedure TfContrato.BitBtnAceptarClick(Sender: TObject);
begin
  bDatosIncompletos := False;
  bCancelando := False;
  try
    if qContrato.state in [dsEdit,dsInsert] then qContrato.Post;
    ModalResult:=MrOk;
    close;
  Except
    on e:exception do
    begin
      MensajeError:=e.Message;
      bDatosIncompletos := True;
      ModalResult:=MrCancel;
      Close;
    end;
  end;
end;

procedure TfContrato.BitBtnCancelarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Perderá los cambios realizados.Esta seguro de Cancelar?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
  begin
    qContrato.Cancel;
    bDatosIncompletos := true;
    bCancelando := true;
    close;
  end
  else
  begin
    ModalResult := 0;
    bDatosIncompletos := false;
  end;
end;

procedure TfContrato.BBCartografiaClick(Sender: TObject);
var ListaApoyo,Lista : TStringList;
begin
  bDatosIncompletos := False;
  try
    qContrato.Post;
    qContrato.Edit;
  except
  end;
  if CodigoObra='' then CodigoObra:= qContrato.FieldByName('CODIGOCONTRATO').AsString;
  FInformacionContrato := TFInformacionContrato.Create(Application);
  FInformacionContrato.Visible := False;
  FInformacionContrato.Caption :='Contrato # '+FContrato.qContrato.FieldByName('NUMEROCONTRATO').AsString; //Cambio Octubre
  FInformacionContrato.Top := screen.Height - FInformacionContrato.height;
  FInformacionContrato.Show;
  FInformacionContrato.Mobjeto.text := dbMObjeto.Text;
  FInformacionContrato.Contrato := CodigoObra;
  FContrato.BorderStyle := bsToolWindow;
  FContrato.FormStyle := fsStayOnTop;
  fContrato.WindowState := wsMinimized;
  fContrato.Visible := False;

  Lista := TStringList.create;
  Lista.Add('VarCodigoEstadoInfraestructura='+'2');
  Lista.Add('VarCodigoContrato='+CodigoObra);
  Lista.Add('VarCodigoGrupoInventario='+'01');
  Lista.Add('VarCodigoCuadrillaInventario='+'01');
  Lista.Add('VarCodigoUsuarioDirector='+'0');
  Lista.Add('VarCodigoUsuarioOficial='+'0');
  Lista.Add('VarCodigoUsuarioAuxiliar='+'0');
  Lista.Add('VarCodigoUsuarioControlCalidad='+'0');
  Lista.Add('VarCodigoEstadoControlCalidad='+'1');
  Lista.Add('VarFechaInventario='+DateTimetoStr(Date));
  Lista.Add('VarFechaControlCalidad='+'0');
  GetData('SET',Lista);
  Lista.Free;
  RefrescarVariables;
  MostrarMapa;
  UbicarContrato(StrToInt(CodigoObra),False);
// UbicarContrato(CODIGO CONTRATO ,SI QUIERE REALIZAR ZOOM O NO);
   qListaApoyo.Close;
   qListaApoyo.ParamByName('Codigo').AsInteger := StrToInt(CodigoObra);
   qListaApoyo.Open;
   qListaApoyo.First;
   if qListaApoyo.FieldByName('CodigoApoyo').AsString <> '' then
   begin
     ListaApoyo := TStringList.create;
     ListaApoyo.Clear;
     While not qListaApoyo.eof do
     begin
       if qListaApoyo.FieldByName('CodigoApoyo').AsString <> ''
       then  ListaApoyo.Add(qListaApoyo.FieldByName('CodigoApoyo').AsString+','+FormatFloat('00.00',qListaApoyo.FieldByName('X').asfloat)+','+FormatFloat('00.00',qListaApoyo.FieldByName('Y').asfloat));
       qListaApoyo.Next;
     end;
     MostrarVistaLateralApoyos(ListaApoyo);
     ListaApoyo.Free;
   end;
{ try
 except
    bDatosIncompletos := True;
 end;
}end;

procedure TfContrato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (bCancelando) and (bDatosIncompletos) then // CierroCancelando
  begin
    if FContrato.qContrato.Database.InTransaction then FContrato.qContrato.Database.Rollback;
     Action := caHide;
  end;
  if (not bDatosIncompletos) and (not bCancelando)  then //CierroGuardo;
  begin
    ModalResult := mrOk;
    Action := caHide;
  end;
  if (not bCancelando) and (bDatosIncompletos) then
  begin //Preguntar SiDesea completar datos
    if MensajeError<>'' then showmessage(MensajeError);
    if Application.MessageBox(PChar('Hay datos incompletos.Desea completar los datos?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes     then
    begin
        bDatosIncompletos := false;
        ModalResult := 0;
        Action := caNone;
    end
    else
    begin
       if FContrato.qContrato.Database.InTransaction then FContrato.qContrato.Database.Rollback;
       Action := caHide;
    end;
  end;
end;

procedure TfContrato.ActadeLiquidacin1Click(Sender: TObject);
var i:integer;
begin
  try
    if qContrato.state in [dsEdit,dsInsert]then qContrato.Post;
    for i:=0 to 3 do
    begin
      NombreFirmante[i]:='';
      CargoFirmante[i]:='';
    end;
    qFirma.Close;
    qFirma.ParamByName('CodigoDocumento').AsString:='ACT';
    qFirma.Open;
    i:=1;
    NombreFirmante[0]:=qContratoREPRESENTANTECONTRATISTA.AsString;
    CargoFirmante[0]:='REPRESENTANTE LEGAL - CONTRATISTA';

    while not (qFirma.Eof) and (i<4) do
    begin
      NombreFirmante[i]:=qFirma.fieldbyname('NombreEmpleado').AsString;
      CargoFirmante[i]:=qFirma.fieldbyname('NombreCargo').AsString;
      qFirma.Next;
      inc(i);
    end;
    fActaLiquidacion := TFActaLiquidacion.Create(Application);
    try
      for i:=0 to 3 do
      begin
        fActaLiquidacion.NombreFirmante[i]:=NombreFirmante[i];
        fActaLiquidacion.CargoFirmante[i]:=CargoFirmante[i];
      end;
      fActaLiquidacion.Show;
    except
      fActaLiquidacion.free;
    end;
  finally
    qContrato.Edit;
  end;
end;



procedure TfContrato.ActividadesdelContrato1Click(Sender: TObject);
begin
  fQRActividadContrato:=TfQRActividadContrato.Create(Application);
  try
    if qContrato.state in [dsEdit,dsInsert] then qContrato.Post;
    fQRActividadContrato.QuickReport.ReportTitle := 'Actividades Ejecutadas. Contrato # '+ qContratoNUMEROCONTRATO.AsString;
    fQRActividadContrato.qActividadContrato.DataSource:=dsContrato;
    fQRActividadContrato.qActividadContrato.open;
    fQRActividadContrato.qContrato.DataSource:=dsContrato;
    fQRActividadContrato.qContrato.open;
    DParser1.Expresion := qContratoCostoTotal.Asstring;
    DParser1.Execute;
    fQRActividadContrato.QRLSon.Caption := 'Son : '+ DParser1.DsEnLetras;

    fQRActividadContrato.QuickReport.preview;
  except
    on e:exception do
    begin
      showmessage(e.message);
      try
        fQRActividadContrato.free;
      except
      end;
    end;
  end;
  qContrato.edit;
end;

procedure TfContrato.MaterialesLiquidados1Click(Sender: TObject);
begin
  inherited;
  fQRMaterialContrato:=tfQRMaterialContrato.Create(Application);
  try
    qContrato.Post;
    fQRMaterialContrato.qMaterialContrato.close;
    fQRMaterialContrato.qMaterialContrato.DataSource:=dsContrato;
    fQRMaterialContrato.qMaterialContrato.open;
    fQRMaterialContrato.QuickReport.ReportTitle := 'Materiales Consumidos. Contrato # '+qContrato.FieldByName('NUMEROCONTRATO').AsString;
    fQRMaterialContrato.QuickReport.Preview;
  except
    on e:exception do
    begin
      showmessage(e.message);
      fQRMaterialContrato.free;
    end;
  end;
  qContrato.Edit;
end;

procedure TfContrato.ContratoObraClick(Sender: TObject);
var i:integer;
    bm:tbookmark;
begin
  try
    qContrato.Post;
    for i:=0 to 3 do
    begin
      NombreFirmante[i]:='';
      CargoFirmante[i]:='';
    end;
    qFirma.Close;
    qFirma.ParamByName('CodigoDocumento').Asstring:='CTO';
    qFirma.Open;
    i:=1;
    NombreFirmante[0]:=qContratoREPRESENTANTECONTRATISTA.AsString;
    CargoFirmante[0]:='REPRESENTANTE LEGAL - CONTRATISTA';

    while not (qFirma.Eof) and (i<4) do
    begin
      NombreFirmante[i]:=qFirma.fieldbyname('NombreEmpleado').AsString;
      CargoFirmante[i]:=qFirma.fieldbyname('NombreCargo').AsString;
      qFirma.Next;
      inc(i);
    end;
    fqrContratoObra:= TfqrContratoObra.Create(Application);
    fqrContratoObra.qcontrato.close;
    fqrContratoObra.qContrato.ParamByName('CodigoContrato').AsString:=qContratoCODIGOCONTRATO.AsString;
    fqrContratoObra.qcontrato.open;
    fqrContratoObra.qClausula.close;
    fqrContratoObra.qClausula.ParamByName('CodigoContrato').AsString:=qContratoCODIGOCONTRATO.AsString;
    fqrContratoObra.qClausula.open;
    fqrContratoObra.QRLNombrefirmante.Caption := NombreFirmante[0];
    fqrContratoObra.QRLCargoFirmante.Caption := CargoFirmante[0];
    fqrContratoObra.QRLNombrefirmante1.Caption := NombreFirmante[1];
    fqrContratoObra.QRLCargoFirmante1.Caption := CargoFirmante[1];
    fqrContratoObra.QRLNombrefirmante2.Caption := NombreFirmante[2];
    fqrContratoObra.QRLCargoFirmante2.Caption := CargoFirmante[2];
    fqrContratoObra.QRLNombrefirmante3.Caption := NombreFirmante[3];
    fqrContratoObra.QRLCargoFirmante3.Caption := CargoFirmante[3];
    fqrContratoObra.QRLNombreContratista.Caption := dblcbContratista.Text;
    bm:=qContrato.GetBookmark;
    fqrContratoObra.ShowModal;
//    fqrContratoObra.QuickReport.Preview;
    qContrato.GotoBookmark(bm);
  except
    On e:exception  do
    begin
      showmessage (e.Message);
      if fqrContratoObra<>nil then
        fqrContratoObra.Free;
    end;
  end;
  qContrato.Edit;
end;


procedure TfContrato.PresupuestoObraClick(Sender: TObject);
Var i : Integer;
begin
  try
    fQRPresupuestoContrato:=TfQRPresupuestoContrato.Create(Application);
    fQRPresupuestoContrato.qcontrato.Close;
    fQRPresupuestoContrato.qcontrato.DataSource:=dsContrato;
    fQRPresupuestoContrato.qcontrato.Open;
    fQRPresupuestoContrato.QuickReport.ReportTitle := 'Presupuesto de Obra del Contrato # '+qContrato.FieldByName('NUMEROCONTRATO').AsString;
    DParser1.Expresion := qContratoCostoTotalPresupuestado.Asstring;
    DParser1.Execute;
    fQRPresupuestoContrato.QRLSon.Caption := 'Son : '+ DParser1.DsEnLetras;
    for i:=0 to 3 do
    begin
      NombreFirmante[i]:='';
      CargoFirmante[i]:='';
    end;
    qFirma.Close;
    qFirma.ParamByName('CodigoDocumento').Asstring:='PTO';
    qFirma.Open;
    i:=1;
    NombreFirmante[0]:=qContratoREPRESENTANTECONTRATISTA.AsString;
    CargoFirmante[0]:='REPRESENTANTE LEGAL - CONTRATISTA';

    while not (qFirma.Eof) and (i<4) do
    begin
      if qFirma.fieldbyname('NombreEmpleado').AsString<>'' then
        NombreFirmante[i]:=qFirma.fieldbyname('NombreEmpleado').AsString;
      if qFirma.fieldbyname('NombreCargo').AsString<>'' then
        CargoFirmante[i]:=qFirma.fieldbyname('NombreCargo').AsString;
      qFirma.Next;
      inc(i);
    end;
    fQRPresupuestoContrato.QRLabelNombrefirmante.Caption := NombreFirmante[0];
    fQRPresupuestoContrato.QRLabelCargoFirmante.Caption := CargoFirmante[0];
    fQRPresupuestoContrato.QRLabelNombrefirmante1.Caption := NombreFirmante[1];
    fQRPresupuestoContrato.QRLabelCargoFirmante1.Caption := CargoFirmante[1];
    fQRPresupuestoContrato.QRLabelNombrefirmante2.Caption := NombreFirmante[2];
    fQRPresupuestoContrato.QRLabelCargoFirmante2.Caption := CargoFirmante[2];
    fQRPresupuestoContrato.showmodal;
  except
    on e:exception do
    begin
      showmessage(e.message);
      fQRPresupuestoContrato.free;
   end;
  end;
end;

procedure TfContrato.ActividadesPresupuestadasdelaObra1Click(Sender: TObject);
begin
  fQRActividadContratoPresupuestada:=TfQRActividadContratoPresupuestada.Create(Application);
  try
    qContrato.Post;
    fQRActividadContratoPresupuestada.QuickReport.ReportTitle := 'Actividades Presupuestadas. Contrato # '+qContrato.FieldByName('NUMEROCONTRATO').AsString;
    fQRActividadContratoPresupuestada.qActividadContrato.close;
    fQRActividadContratoPresupuestada.qActividadContrato.DataSource:=dsContrato;
    fQRActividadContratoPresupuestada.qActividadContrato.open;
    DParser1.Expresion := qContratoCostoTotalPresupuestado.Asstring;
    DParser1.Execute;
    fQRActividadContratoPresupuestada.QRLSon.Caption := 'Son : '+ DParser1.DsEnLetras;
    fQRActividadContratoPresupuestada.QuickReport.Preview;
  except
    on e:exception do
    begin
      showmessage(e.message);
      try
        fQRActividadContratoPresupuestada.free;
      except
      end;
    end;
  end;
  qContrato.Edit;
end;

procedure TfContrato.MaterialesPresupuestadosdelaObra1Click(Sender: TObject);
begin

  try
    fQRMaterialContratoPresupuestado:=tfQRMaterialContratoPresupuestado.Create(Application);
    if qContrato.State in [dsEdit,dsInsert] then qContrato.Post;
    fQRMaterialContratoPresupuestado.qMaterialContrato.close;
    fQRMaterialContratoPresupuestado.qMaterialContrato.DataSource:=dsContrato;
    fQRMaterialContratoPresupuestado.qMaterialContrato.open;
    fQRMaterialContratoPresupuestado.QuickReport.ReportTitle := 'Materiales Presupuestados. Contrato # '+qContrato.FieldByName('NUMEROCONTRATO').AsString;
    fQRMaterialContratoPresupuestado.QuickReport.Preview;
  except
    on e:exception do
    begin
      showmessage(e.message);
      fQRMaterialContratoPresupuestado.free;
    end;
  end;
  qContrato.Edit;
end;


procedure TfContrato.FormActivate(Sender: TObject);
begin
  Notebook.PageIndex:=Pagina;
end;

procedure TfContrato.DBGridMaterialDblClick(Sender: TObject);
begin
  dsMaterialContrato.DataSet.Edit;
end;

procedure TfContrato.ArbolChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  if Node.Text='Información' then
   Notebook.PageIndex:=0
  else if Node.Text='Programación' then
   Notebook.PageIndex:=1
  else if Node.Text='Actividades' then
   Notebook.PageIndex:=2
  else if Node.Text='Materiales' then
   Notebook.PageIndex:=3
  else if Node.Text='Liquidaciones' then
   Notebook.PageIndex:=4;
  Pagina:=Notebook.PageIndex;
end;

procedure TfContrato.sbBuscarCIGClick(Sender: TObject);
var CIG:INTEGER;
begin
  CIG := CapturarCIG;
  if CIG<>0 then dsContrato.DataSet.FieldByName('CODIGOGEOGRAFICO').AsInteger:=CIG;
end;

procedure TfContrato.qActividadContratoCalcFields(DataSet: TDataSet);
var qDescripcion:TQuery;
begin
  qDescripcion:=TQuery.Create(self);
  try
    qDescripcion.DatabaseName:='BaseDato';
    qDescripcion.sql.add('SELECT tp.nombretipopresupuesto,ta.nombretipoactividad,e.nombreestructura,a.descripcion');
    qDescripcion.sql.add('FROM tipopresupuesto tp,actividad a,estructura e,tipoactividad ta,actividadcontratoobra ac');
    qDescripcion.sql.add('WHERE tp.CODIGOTIPOPRESUPUESTO=ac.codigotipopresupuesto');
    qDescripcion.sql.add('AND ac.codigoactividad=a.codigoactividad');
    qDescripcion.sql.add('AND a.codigotipoactividad=ta.codigotipoactividad');
    qDescripcion.sql.add('AND a.codigoestructura=e.codigoestructura');
    qDescripcion.sql.add('AND ac.codigoactividad='+qActividadContratoCODIGOACTIVIDAD.AsString);
    qDescripcion.Open;
    if qDescripcion.Fieldbyname('Descripcion').asstring<>'' then
    begin
      qActividadContrato.FieldByName('NombreActividadContrato').AsString:= qDescripcion.Fields[0].asstring;
    end
    else
    begin
      qActividadContrato.FieldByName('NombreActividadContrato').AsString:=
      qDescripcion.FieldByName('NombreTipoPresupuesto').AsString+' '+
      ' DE '+qDescripcion.FieldByName('NombreEstructura').AsString;
    end;
  except
  end;
  qActividadContratoValorPresupuestado.AsFloat:=qActividadContratoMATERIALPRESUPUESTADO.AsFloat+
  qActividadContratoEQUIPOPRESUPUESTADO.AsFloat+qActividadContratoMANOOBRAPRESUPUESTADO.AsFloat+
  qActividadContratoTRANSPORTEPRESUPUESTADO.AsFloat;

  qActividadContratoValorEjecutado.AsFloat:=qActividadContratoMATERIALEJECUTADO.AsFloat+
  qActividadContratoEQUIPOEJECUTADO.AsFloat+qActividadContratoMANOOBRAEJECUTADO.AsFloat+
  qActividadContratoTRANSPORTEEJECUTADO.AsFloat;

  qDescripcion.Free;
end;

procedure TfContrato.qContratoCalcFields(DataSet: TDataSet);
var
  IVA,AIU,MaterialPresupuestado,ManoObraPresupuestado,EquipoPresupuestado,TransportePresupuestado,Utilidades,Administracion,Imprevistos,
  ValorTotalPresupuestado,SumaPresupuestado,SumaAIUPresupuestado,SumaIVAPresupuestado:Double;
  Material,ManoObra,Equipo,Transporte:Double;
  ValorTotal,Suma,SumaAIU,SumaIVA:Double;  
begin
  qContratoAIU.AsFloat:=qContrato.FieldByName('ADMINISTRACION').AsFloat+ qContrato.FieldByName('IMPREVISTOS').ASFloat+qContrato.FieldByName('UTILIDADES').AsFloat;
  AIU := qContratoAIU.AsFloat/100;
  IVA := qContratoIVA.AsFloat/100;
  Utilidades := qContratoUTILIDADES.AsFloat/100;
  Administracion := qContratoADMINISTRACION.AsFloat/100;
  Imprevistos := qContratoIMPREVISTOS.AsFloat/100;

  MaterialPresupuestado := qContratoMATERIALPRESUPUESTADO.AsFloat;
  ManoObraPresupuestado := qContratoMANOOBRAPresupuestado.ASFloat;
  TransportePresupuestado := qContratoTRANSPORTEPresupuestado.AsFloat;
  EquipoPresupuestado := qContratoEQUIPOPresupuestado.AsFloat;

  Material := qContratoMATERIALEJECUTADO.AsFloat;
  ManoObra := qContratoMANOOBRAEJECUTADO.ASFloat;
  Transporte := qContratoTRANSPORTEEJECUTADO.AsFloat;
  Equipo := qContratoEQUIPOEJECUTADO.AsFloat;
  qContratoIvaSobre.AsString:='';
  SumaPresupuestado:= MaterialPresupuestado+ManoObraPresupuestado+ TransportePresupuestado+ EquipoPresupuestado ;
  SumaAIUPresupuestado := SumaPresupuestado*AIU;
  SumaIVAPresupuestado:=0;
  Suma:= Material+ManoObra+ Transporte+ Equipo ;
  SumaAIU := Suma*AIU;
  SumaIVA:=0;
  if (qTipoContratoIVAUTILIDAD.AsString='S')then
  begin
    SumaIVAPresupuestado := (SumaPresupuestado*Utilidades)*IVA;
    SumaIVA := (Suma*Utilidades)*IVA;
    qContratoIvaSobre.AsString :='SOBRE UTILIDAD';
  end;
  if qTipoContratoIVAADMINISTRACION.AsString='S' then
  begin
    SumaIVAPresupuestado := SumaIVAPresupuestado+(SumaPresupuestado*Administracion)*IVA;
    SumaIVA := SumaIVA+(Suma*Administracion)*IVA;
    if qContratoIvaSobre.AsString<>'' then
      qContratoIvaSobre.AsString:=qContratoIvaSobre.AsString + ', ADMINISTRACIÓN'
    else
      qContratoIvaSobre.AsString:='SOBRE ADMINISTRACIÓN';
  end;
  if qTipoContratoIVAIMPREVISTOS.AsString='S' then
  begin
    SumaIVAPresupuestado := SumaIVAPresupuestado+(SumaPresupuestado*Imprevistos)*IVA;
    SumaIVA := SumaIVA+(Suma*Imprevistos)*IVA;
    if qContratoIvaSobre.AsString<>'' then
      qContratoIvaSobre.AsString:=qContratoIvaSobre.AsString + ', IMPREVISTOS'
    else
      qContratoIvaSobre.AsString:='SOBRE IMPREVISTOS';
  end;
  qContratoValorMaterial.AsFloat:= Material*(1+AIU);
  qContratoValorManoObra.AsFloat:= ManoObra*(1+AIU);
  qContratoValorEquipo.AsFloat:= Equipo*(1+AIU);
  qContratoValorTransporte.AsFloat:= Transporte*(1+AIU);
  qContratoValorMaterialPresupuestado.AsFloat:= MaterialPresupuestado*(1+AIU);
  qContratoValorManoObraPresupuestado.AsFloat:= ManoObraPresupuestado*(1+AIU);
  qContratoValorEquipoPresupuestado.AsFloat:= EquipoPresupuestado*(1+AIU);
  qContratoValorTransportePresupuestado.AsFloat:= TransportePresupuestado*(1+AIU);

  ValorTotal := Suma +SumaAIU+SumaIVA;
  qContratoValorIVA.AsFloat := SumaIVA;
  qContratoValorAIU.AsFloat := SumaAIU;
  qContratoCOSTODIRECTOSINAIU.AsFloat := SUMA;
  qContratoCOSTODIRECTO.AsFloat := SUMA+SUMAAIU;
  qContratoCOSTOTOTAL.AsFloat:= round(ValorTotal);

  ValorTotalPresupuestado := SumaPresupuestado +SumaAIUPresupuestado+SumaIVAPresupuestado;
  qContratoValorIvaPresupuestado.AsFloat := SumaIVAPresupuestado;
  qContratoValorAIUPresupuestado.AsFloat := SumaAIUPresupuestado;
  qContratoCostoDirectoSinAIUPresupuestado.AsFloat := SumaPresupuestado;
  qContratoCostoDirectoPresupuestado.AsFloat := SumaPresupuestado+SumaAIUPresupuestado;
  qContratoCostoTotalPresupuestado.AsFloat:= round(ValorTotalPresupuestado);

  qContratoNombreGeografico.AsString:=qGeograficoNOMBREGEOGRAFICO.AsString;

end;

procedure TfContrato.qContratoCODIGOCONTRATOChange(Sender: TField);
var query:tquery;
begin
  inherited;
  CodigoObra:=Sender.AsString;
  query:=tquery.create(self);
  query.databasename:='Basedato';
  query.sql.text:='';
  query.free;
end;


procedure TfContrato.qContratoCODIGOTIPOCONTRATOChange(Sender: TField);
begin
  inherited;
  NombreContratista := qContratista.FieldByName('NOMBRECONTRATISTA').AsString;
  EsRetenedor:=qContratista.FieldByName('RETENEDORIVA').AsString;
end;

procedure TfContrato.qContratoFECHAINICIOValidate(Sender: TField);
begin
  inherited;
  if qContratoFECHAAsignacion.AsDateTime=0
  then raise Exception.Create('La Fecha de Asignacion no debe estar en blanco.')
  else if Sender.AsDateTime < qContratoFECHAAsignacion.AsDateTime
    then raise Exception.Create('LA Fecha de Inicio de Obra debe ser mayor que la Fecha de Asignación.');
end;

procedure TfContrato.qContratoFECHAENTREGAValidate(Sender: TField);
begin
  inherited;
  if qContratoFECHAInicio.AsDateTime=0
  then raise Exception.Create('La Fecha de Inicio no debe estar en blanco.')
  else if Sender.AsDateTime < qContratoFECHAInicio.AsDateTime
    then raise Exception.Create('LA Fecha de Entrega de Obra debe ser mayor que la Fecha de Inicio.');
end;

procedure TfContrato.qContratoFECHACERTIFICADOValidate(Sender: TField);
begin
  inherited;
  if qContratoFECHAEntrega.AsDateTime=0
  then raise Exception.Create('La Fecha de Entrega no debe estar en blanco.')
  else if Sender.AsDateTime < qContratoFECHAEntrega.AsDateTime
    then raise Exception.Create('LA Fecha de Certificado de Obra debe ser mayor que la Fecha de Entrega.');

end;

procedure TfContrato.qContratoFECHALIQUIDACIONValidate(Sender: TField);
begin
  inherited;
  if qContratoFECHACERTIFICADO.AsDateTime=0
  then raise Exception.Create('La Fecha de Certificado no debe estar en blanco.')
  else if Sender.AsDateTime < qContratoFECHACERTIFICADO.AsDateTime
    then raise Exception.Create('LA Fecha de Liquidación de Obra debe ser mayor que la Fecha de Certificado.');
end;

procedure TfContrato.qContratoAfterPost(DataSet: TDataSet);
begin
  qContrato.ApplyUpdates;
  qContrato.CommitUpdates;
end;

procedure TfContrato.qContratoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qContrato.ApplyUpdates;
  qContrato.CommitUpdates;
end;

procedure TfContrato.qMaterialContratoAfterPost(DataSet: TDataSet);
begin
  qMaterialContrato.ApplyUpdates;
  qMaterialContrato.CommitUpdates;
end;

procedure TfContrato.qMaterialContratoAfterDelete(DataSet: TDataSet);
begin
  qMaterialContrato.ApplyUpdates;
  qMaterialContrato.CommitUpdates;
end;


procedure TfContrato.qContratoCODIGOCONTRATISTAChange(Sender: TField);
var query:tquery;
begin
  if sender.asstring<>'' then
  begin
    NombreContratista := qContratista.FieldByName('NOMBRECONTRATISTA').AsString;
    EsRetenedor:=qContratista.FieldByName('RETENEDORIVA').AsString;
    query:=tquery.create(self);
    query.databasename:='BaseDato';
    query.sql.text:='select representante from contratista where codigocontratista='''+Sender.asstring+'''';
    query.open;
    qContratoREPRESENTANTECONTRATISTA.AsString:=query.fields[0].asstring;
    query.free;
  end;
end;

procedure TfContrato.qContratoSECUENCIAChange(Sender: TField);
begin
end;
// Genera el número del contrato a partir de los campos
// division,departamento,programa,secuencia,año
procedure TfContrato.GenerarNumeroContrato;
function RellenoCeros(s:string;n:integer):string;
var i:integer;
begin
  result:=s;
  for i:=1 to length(s)-n do
    result:='0'+result;
end;
begin
//
end;

procedure TfContrato.qContratoNUMEROPRESUPUESTOValidate(Sender: TField);
begin
  inherited;
  CodSecuencia:=Sender.AsString;
  GenerarNumeroContrato;
end;

procedure TfContrato.qContratoANOValidate(Sender: TField);
begin
  inherited;
  codano:=Sender.AsString;
//  GenerarNumeroContrato;
end;

procedure TfContrato.qContratoSECUENCIAValidate(Sender: TField);
begin
  inherited;
  CodSecuencia:=Sender.AsString;
//  GenerarNumeroContrato;
end;

procedure TfContrato.FormCreate(Sender: TObject);
begin
  qEstadoContrato.Open;
  qDivision.Open;
  qDepartamento.Open;
  qContratista.Open;
  qInterventor.Open;
  qAuxiliar.Open;
  qZona.Open;
  qGeografico.Open;
  qEmpresa.Open;
  qContrato.Open;
  qLiquidacion.Open;
  qLiquidacionActividad.Open;
  qLiquidacionMaterial.Open;
  Pagina:=0;    
  inherited;
end;

procedure TfContrato.qContratoAfterInsert(DataSet: TDataSet);
var Dia,mes,ano:word;
begin
  inherited;
  qContratoSECUENCIA.AsInteger:=0;
  DecodeDate(strtodatetime(FechaServidor),ano,mes,dia);
  qContratoANO.AsInteger:=ano;
  qContratoSECUENCIA.AsInteger:=0;  
end;

procedure TfContrato.qActividadContratoAfterCancel(DataSet: TDataSet);
begin
  inherited;
  qActividadContrato.CancelUpdates;
end;

procedure TfContrato.qContratoAfterCancel(DataSet: TDataSet);
begin
  inherited;
  qContrato.CancelUpdates;
end;

procedure TfContrato.qMaterialContratoAfterCancel(DataSet: TDataSet);
begin
  inherited;
  qMaterialContrato.CancelUpdates;
end;


procedure TfContrato.bbFirmasClick(Sender: TObject);
begin
  try
    qContrato.Post;
  except
    on E:Exception  do
    begin
      Application.MessageBox('Debe llenar los Datos del contrato  Antes de Ingresar Firmas','Error',MB_OK);
      qContrato.Edit;
      exit;
    end;
  end;
  fFirmaContrato:=TfFirmaContrato.Create(Application);
  fFirmaContrato.qEmpleado.DataSource:=dsContrato;
  fFirmaContrato.qEmpleado.open;
  fFirmaContrato.qFirma.DataSource:=dsContrato;
  fFirmaContrato.qFirma.Open;
  fFirmaContrato.ShowModal;
  fFirmaContrato.free;
  qContrato.Edit;
end;


procedure TfContrato.bbClausulasClick(Sender: TObject);
var punto:TPoint;
begin
  try
    qContrato.Post;
  except
    on E:Exception  do
    begin
      Application.MessageBox('Debe llenar los Datos del contrato  Antes de Ingresar Claúsulas','Error',MB_OK);
      qContrato.Edit;
      exit;
    end;
  end;
  punto:=PanelBotones.ClientToScreen(Classes.Point(bbClausulas.Left, bbClausulas.top));
  PopupMenuClausulas.Popup(punto.x+10, punto.y+10);
  qContrato.Edit;  
end;
// Inserta las clausulas iniciales comunes a todos los contratos
procedure TfContrato.InsertarClausulasIniciales(minuta:integer);
procedure InsertarClausula(Codigo,Contrato,Consecutivo,Titulo:String;Texto:Variant);
begin
  qClausula.Close;
  qClausula.Open;
  qClausula.Insert;
  qClausula.FieldByName('CODIGOCLAUSULACONTRATO').AsString:=Codigo;
  qClausula.FieldByName('CODIGOCONTRATO').AsString:=Contrato;
  qClausula.FieldByName('CONSECUTIVO').AsString:=Consecutivo;
  qClausula.FieldByName('TITULO').AsString:=Titulo;
  qClausula.FieldByName('TEXTO').AsVariant:=Texto;
  qClausula.Post;
end;
var Query,Query2,qClausulaInsertar:TQuery;

begin
  Query:=TQuery.Create(self);
  Query.DatabaseName:='BaseDato';
  Query.Sql.Clear;
  Query.sql.Add('SELECT MAX(CODIGOCLAUSULACONTRATO) CODIGO FROM CLAUSULACONTRATO');
  Query.Close;
  Query.Open;

  Query2:=TQuery.Create(self);
  Query2.DatabaseName:='BaseDato';
  Query2.Sql.Clear;
  Query2.sql.Add('SELECT MAX(CONSECUTIVO) CONSECUTIVO FROM CLAUSULACONTRATO WHERE CODIGOCONTRATO='+qContratoCODIGOCONTRATO.AsString);
  Query2.Close;
  Query2.Open;

  qClausulaInsertar:=TQuery.Create(self);
  qClausulaInsertar.DatabaseName:='BaseDato';
  qClausulaInsertar.Sql.Clear;
  qClausulaInsertar.sql.Add('SELECT TITULO, TEXTO FROM CLAUSULA WHERE CODIGOMINUTA='+IntToStr(minuta)+' ORDER BY CODIGOCLAUSULA');
  qClausulaInsertar.Close;
  qClausulaInsertar.Open;
  qClausulaInsertar.First;
  while not qClausulaInsertar.Eof do
  begin
    InsertarClausula(inttostr(Query.FieldByName('CODIGO').asInteger+1),qContratoCODIGOCONTRATO.AsString,
    inttostr(Query2.FieldByName('CONSECUTIVO').asInteger+1),qClausulaInsertar.FieldByName('TITULO').asString,
    qClausulaInsertar.FieldByName('TEXTO').asVariant);
    Query.Close;
    Query.Open;
    Query2.Close;
    Query2.Open;
    qClausulaInsertar.Next;
  end;
  Query.Free;
  Query2.Free;  
  qClausulaInsertar.Free;
end;

procedure TfContrato.AdicionarClausulasInicialesClick(Sender: TObject);
begin
  FMinuta:=TFMinuta.Create(application);
  try
    if FMinuta.ShowModal=mrOk then
    begin
      if FMinuta.DBGrid1.SelectedRows.Count > 0 then
      begin
         InsertarClausulasIniciales(FMinuta.qMinutaCODIGOMINUTA.AsInteger);
      end;
    end;
  finally
    FMinuta.free;
  end;

end;

procedure TfContrato.EditarClasulasClick(Sender: TObject);
begin
  fClausulaContrato:=TfClausulaContrato.Create(Application);
  fClausulaContrato.qClausula.DataSource:=dsContrato;
  fClausulaContrato.qClausula.open;
  fClausulaContrato.qConsecutivo.DataSource:=dsContrato;
  fClausulaContrato.ShowModal;
  fClausulaContrato.free;
end;

procedure TfContrato.qClausulaAfterPost(DataSet: TDataSet);
begin
  qClausula.ApplyUpdates;
  qClausula.CommitUpdates;
end;

function TfContrato.FechaServidor: string;
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

procedure TfContrato.qContratoCODIGOGEOGRAFICOChange(Sender: TField);
begin
  inherited;
  qGeografico.close;
  qGeografico.open;
end;

procedure TfContrato.SpeedButton1Click(Sender: TObject);
var presupuesto:double;
qry:Tquery;
begin
  inherited;
  fAsignarPresupuesto:=TfAsignarPresupuesto.Create(Application);
  try
    if (fAsignarPresupuesto.ShowModal=mrOk) then
    begin
      presupuesto:=fAsignarPresupuesto.qPresupuestoCODIGOPRESUPUESTO.asfloat;
      qContratoCODIGOPRESUPUESTO.Asfloat:=presupuesto;
    end;
  except
    on e:exception do
    begin
      showmessage(e.message);
    end;
  end;
  fAsignarPresupuesto.free;
end;

procedure TfContrato.qContratoCODIGOPRESUPUESTOValidate(Sender: TField);
begin
  inherited;
  if (sender.asstring<>'') then
    sbCargarPresupuesto.Enabled:=true
  else
    sbCargarPresupuesto.Enabled:=false;
end;

procedure TfContrato.sbCargarPresupuestoClick(Sender: TObject);
var
  query,qDatos,qDatosActividad,qDatosMaterial,qcodigo:tquery;
  Codigo,Nocontratoobra:integer;
begin
  if qContratoCODIGOPRESUPUESTO.AsString<>'' then
  begin
    if not(qLiquidacion.RecordCount>0) then
    begin
      query:=TQuery.create(self);
      query.databasename:='BaseDato';
      query.sql.text:='SELECT COUNT(*) FROM CONTRATOOBRA WHERE CODIGOCONTRATO='+qContratoCODIGOCONTRATO.AsString;
      query.Open;

      qcodigo:=TQuery.create(self);
      qcodigo.databasename:='BaseDato';

      qDatos:=TQuery.create(self);
      qDatos.databasename:='BaseDato';

      qDatosMaterial:=TQuery.create(self);
      qDatosMaterial.databasename:='BaseDato';

      qDatosActividad:=TQuery.create(self);
      qDatosActividad.databasename:='BaseDato';
      //Elimina los registros anteriores de contratoobra materiales y actividades
      if query.Fields[0].Asinteger>0 then
      begin
        if Application.MessageBox(PChar('Desea eliminar las obras y cargar las del presupuesto'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
        begin
          qdatos.sql.clear;
          qDatos.sql.text:='SELECT CODIGOCONTRATOOBRA FROM CONTRATOOBRA WHERE CODIGOCONTRATO='+qContratoCODIGOCONTRATO.AsString;
          qDatos.Open;
          while not qDatos.eof do
          begin
            query.sql.clear;
            query.sql.text:='DELETE FROM ACTIVIDADCONTRATOOBRA WHERE CODIGOCONTRATOOBRA='+qDatos.fields[0].AsString;
            query.ExecSQL;

            query.sql.clear;
            query.sql.text:='DELETE FROM MATERIALCONTRATOOBRA WHERE CODIGOCONTRATOOBRA='+qDatos.fields[0].AsString;
            query.ExecSQL;
            qDatos.next;
          end;
          query.sql.clear;
          query.sql.text:='DELETE FROM CONTRATOOBRA WHERE CODIGOCONTRATO='+qContratoCODIGOCONTRATO.AsString;
          query.ExecSQL;
        end
        else
        begin
          query.free;
          qDatos.free;
          exit;
        end;
      end;
      qdatos.sql.clear;
      qDatos.sql.Add('SELECT CODIGOPRESUPUESTOOBRA,CONSECUTIVO,FECHAINICIO,FECHAFIN,NVL(MATERIAL,0)MATERIAL,NVL(TRANSPORTE,0)TRANSPORTE,');
      qDatos.sql.Add('NVL(EQUIPO,0)EQUIPO,NVL(MANOOBRA,0)MANOOBRA,CODIGOGEOGRAFICO');
      qDatos.sql.Add('FROM PRESUPUESTOOBRA WHERE CODIGOPRESUPUESTO='+qContratoCODIGOPRESUPUESTO.AsString);
      qDatos.Open;
      try
      //copia las obras de los presupuestos a los contratos
        while not qDatos.eof do
        begin
          qcodigo.sql.clear;
          qcodigo.sql.text:='SELECT MAX(CODIGOCONTRATOOBRA) FROM CONTRATOOBRA';
          qcodigo.open;
          Codigo:=1;
          if (qcodigo.fields[0].asstring<>'') then Codigo:= qcodigo.fields[0].asinteger+1;
          Nocontratoobra:=codigo;
          query.sql.clear;
          query.sql.add('INSERT INTO CONTRATOOBRA(CODIGOCONTRATOOBRA,CODIGOCONTRATO,CONSECUTIVO,');
          query.sql.add('FECHAINICIO,FECHAFIN,MATERIALPRESUPUESTADO,TRANSPORTEPRESUPUESTADO,EQUIPOPRESUPUESTADO,MANOOBRAPRESUPUESTADO,');
          query.sql.add('CODIGOGEOGRAFICO)');
          query.sql.add('VALUES(:CODIGOCONTRATOOBRA,:CODIGOCONTRATO,:CONSECUTIVO,');
          query.sql.add('TO_DATE(:FECHAINICIO,''DD/MM/YYYY''),TO_DATE(:FECHAFIN,''DD/MM/YYYY''),:MATERIALPRESUPUESTADO,:TRANSPORTEPRESUPUESTADO,:EQUIPOPRESUPUESTADO,:MANOOBRAPRESUPUESTADO,');
          query.sql.add(':CODIGOGEOGRAFICO)');
          query.ParamByName('CODIGOCONTRATOOBRA').Asinteger:=Codigo;
          query.ParamByName('CODIGOCONTRATO').AsString:=qContratoCODIGOCONTRATO.AsString;
          query.ParamByName('CONSECUTIVO').AsString:=qDatos.fieldbyname('CONSECUTIVO').AsString;
          query.ParamByName('FECHAINICIO').AsString:=formatdatetime('dd/mm/yyyy',qDatos.fieldbyname('FECHAINICIO').Asdatetime);
          query.ParamByName('FECHAFIN').AsString:=formatdatetime('dd/mm/yyyy',qDatos.fieldbyname('FECHAFIN').Asdatetime);
          query.ParamByName('MATERIALPRESUPUESTADO').asfloat:=qDatos.fieldbyname('MATERIAL').asfloat;
          query.ParamByName('TRANSPORTEPRESUPUESTADO').asfloat:=qDatos.fieldbyname('TRANSPORTE').asfloat;
          query.ParamByName('EQUIPOPRESUPUESTADO').asfloat:=qDatos.fieldbyname('EQUIPO').asfloat;
          query.ParamByName('MANOOBRAPRESUPUESTADO').asfloat:=qDatos.fieldbyname('MANOOBRA').asfloat;
          query.ParamByName('CODIGOGEOGRAFICO').asfloat:=qDatos.fieldbyname('CODIGOGEOGRAFICO').asfloat;
          query.ExecSQL;
          qDatosActividad.sql.clear;
          qDatosActividad.sql.add('SELECT CODIGOACTIVIDAD,CANTIDADPRESUPUESTADA,NVL(MATERIAL,0)MATERIAL,');
          qDatosActividad.sql.add('NVL(TRANSPORTE,0)TRANSPORTE,NVL(EQUIPO,0)EQUIPO,NVL(MANOOBRA,0)MANOOBRA');
          qDatosActividad.sql.add('FROM ACTIVIDADPRESUPUESTOOBRA WHERE CODIGOPRESUPUESTO='+qContratoCODIGOPRESUPUESTO.AsString);
          qDatosActividad.sql.add(' AND CODIGOPRESUPUESTOOBRA='+qDatos.fieldbyname('CODIGOPRESUPUESTOOBRA').Asstring);
          qDatosActividad.Open;
        //copia las actividades de los presupuestos a los contratos
          while not qDatosActividad.eof do
          begin
            qcodigo.sql.clear;
            qcodigo.sql.text:='SELECT MAX(CODIGOACTIVIDADCONTRATOOBRA) FROM ACTIVIDADCONTRATOOBRA';
            qcodigo.open;
            Codigo:=1;
            if (qcodigo.fields[0].asstring<>'') then Codigo:= qcodigo.fields[0].asinteger+1;
            query.sql.clear;
            query.sql.add('INSERT INTO ACTIVIDADCONTRATOOBRA(CODIGOACTIVIDADCONTRATOOBRA,');
            query.sql.add('CODIGOACTIVIDAD,CODIGOCONTRATO,CODIGOCONTRATOOBRA,CODIGOTIPOPRESUPUESTO,CANTIDADPRESUPUESTADA,');
            query.sql.add('MATERIALPRESUPUESTADO,TRANSPORTEPRESUPUESTADO,EQUIPOPRESUPUESTADO,MANOOBRAPRESUPUESTADO)');
            query.sql.add('VALUES(:CODIGOACTIVIDADCONTRATOOBRA,');
            query.sql.add(':CODIGOACTIVIDAD,:CODIGOCONTRATO,:CODIGOCONTRATOOBRA,:CODIGOTIPOPRESUPUESTO,:CANTIDADPRESUPUESTADA,');
            query.sql.add(':MATERIAL,:TRANSPORTE,:EQUIPO,:MANOOBRA)');
            query.ParamByName('CODIGOACTIVIDADCONTRATOOBRA').Asinteger:=Codigo;
            query.ParamByName('CODIGOACTIVIDAD').AsString:=qDatosActividad.fieldbyname('CODIGOACTIVIDAD').AsString;
            query.ParamByName('CODIGOCONTRATO').AsString:=qContratoCODIGOCONTRATO.AsString;
            query.ParamByName('CODIGOCONTRATOOBRA').AsInteger:=NoContratoObra;
            query.ParamByName('CODIGOTIPOPRESUPUESTO').AsString:=qContratoCodigoPresupuesto.AsString;
            query.ParamByName('CANTIDADPRESUPUESTADA').AsString:=qDatosActividad.fieldbyname('CANTIDADPRESUPUESTADA').AsString;
            query.ParamByName('MATERIAL').asfloat:=qDatosActividad.fieldbyname('MATERIAL').asfloat;
            query.ParamByName('TRANSPORTE').asfloat:=qDatosActividad.fieldbyname('TRANSPORTE').asfloat;
            query.ParamByName('EQUIPO').asfloat:=qDatosActividad.fieldbyname('EQUIPO').asfloat;
            query.ParamByName('MANOOBRA').asfloat:=qDatosActividad.fieldbyname('MANOOBRA').asfloat;
            query.ExecSQL;

            qDatosActividad.next;
          end;
        //copia las actividades de los presupuestos a los contratos
          qDatosMaterial.sql.clear;
          qDatosMaterial.sql.Add('SELECT CODIGOMATERIAL,CANTIDADPRESUPUESTADA,NVL(VALORPRESUPUESTADO,0)VALORPRESUPUESTADO,VALORUNITARIO');
          qDatosMaterial.sql.Add('FROM MATERIALPRESUPUESTOOBRA WHERE CODIGOPRESUPUESTO='+qContratoCODIGOPRESUPUESTO.AsString);
          qDatosMaterial.sql.add(' AND CODIGOPRESUPUESTOOBRA='+qDatos.fieldbyname('CODIGOPRESUPUESTOOBRA').Asstring);
          qDatosMaterial.Open;
          while not qDatosMaterial.eof do
          begin
            qcodigo.sql.clear;
            qcodigo.sql.text:='SELECT MAX(CODIGOMATERIALCONTRATOOBRA) FROM MATERIALCONTRATOOBRA';
            qcodigo.open;
            Codigo:=1;
            if (qcodigo.fields[0].asstring<>'') then Codigo:= qcodigo.fields[0].asinteger+1;
            query.sql.clear;
            query.sql.add('INSERT INTO MATERIALCONTRATOOBRA(CODIGOMATERIALCONTRATOOBRA,');
            query.sql.add('CODIGOCONTRATO,CODIGOCONTRATOOBRA,CODIGOMATERIAL,CANTIDADSOLICITADA,VALORPRESUPUESTADO,VALORUNITARIO)');
            query.sql.add('VALUES(:CODIGOMATERIALCONTRATOOBRA,:CODIGOCONTRATO,:CODIGOCONTRATOOBRA,:CODIGOMATERIAL,');
            query.sql.add(':CANTIDADSOLICITADA,:VALORPRESUPUESTADO,:VALORUNITARIO)');

            query.ParamByName('CODIGOMATERIALCONTRATOOBRA').Asinteger:=Codigo;
            query.ParamByName('CODIGOCONTRATO').AsString:=qContratoCODIGOCONTRATO.AsString;
            query.ParamByName('CODIGOCONTRATOOBRA').AsInteger:=Nocontratoobra;
            query.ParamByName('CODIGOMATERIAL').AsString:=qDatosMaterial.fieldbyname('CODIGOMATERIAL').AsString;
            query.ParamByName('CANTIDADSOLICITADA').asfloat:=qDatosMaterial.fieldbyname('CANTIDADPRESUPUESTADA').asfloat;
            query.ParamByName('VALORPRESUPUESTADO').asfloat:=qDatosMaterial.fieldbyname('VALORPRESUPUESTADO').asfloat;
            query.ParamByName('VALORUNITARIO').asfloat:=qDatosMaterial.fieldbyname('VALORUNITARIO').asfloat;
            qDatosMaterial.next;
          end;
          qDatos.Next;
        end;
      except
       on e:exception do
       begin
         showmessage(e.message);
       end;
      end;  
      query.free;
      qDatos.free;
      qCodigo.free;
      qDatosActividad.free;
      qDatosMaterial.free;
      qActividadContrato.Close;qActividadContrato.Open;
      qMaterialContrato.Close;qMaterialContrato.Open;
    end
    else
    showmessage('No se pueden cargar presupuestos puesto que ya existen liquidaciones para este contrato');
  end
  else
    showmessage('debe ingresar un código de presupuesto.');
end;

procedure TfContrato.qContratoCODIGOPRESUPUESTOChange(Sender: TField);
var qActualizarPresupuesto:tquery;
begin
  inherited;
  qActualizarPresupuesto:= TQuery.create(self);
  if sender.AsString<>'' then
  begin
    qActualizarPresupuesto.DatabaseName:='BaseDato';
    //Asigna el estado contratado al presupuesto escogido
    qActualizarPresupuesto.sql.Add('UPDATE PRESUPUESTO SET CODIGOESTADOPRESUPUESTO=2');
    if qContratoFECHAASIGNACION.AsString<>'' then
      qActualizarPresupuesto.sql.Add(', FECHAASIGNACION=TO_DATE('''+ formatdatetime('dd/mm/yyy',qContratoFECHAASIGNACION.AsDateTime)+''',''dd/mm/yyyy'')');
    qActualizarPresupuesto.sql.Add(' WHERE CODIGOPRESUPUESTO='+Sender.AsString);
    qActualizarPresupuesto.ExecSQL;
  end;
  if string(qContratoCODIGOPRESUPUESTO.OldValue)<>'' then
  begin
    qActualizarPresupuesto.sql.clear;
    qActualizarPresupuesto.sql.Add('UPDATE PRESUPUESTO SET CODIGOESTADOPRESUPUESTO=1');
    if qContratoFECHAASIGNACION.AsString<>'' then
      qActualizarPresupuesto.sql.Add(', FECHAASIGNACION='''' ');
    qActualizarPresupuesto.sql.Add(' WHERE CODIGOPRESUPUESTO='+string(qContratoCODIGOPRESUPUESTO.OldValue));
    qActualizarPresupuesto.ExecSQL;

    qActualizarPresupuesto.sql.clear;
    qActualizarPresupuesto.sql.Add('UPDATE PRESUPUESTO SET CODIGOESTADOPRESUPUESTO=1');
    qActualizarPresupuesto.sql.Add(', FECHAASIGNACION='''' ');
    qActualizarPresupuesto.sql.Add(' WHERE CODIGOPRESUPUESTO='+string(qContratoCODIGOPRESUPUESTO.OldValue));
    qActualizarPresupuesto.ExecSQL;
  end;
  qActualizarPresupuesto.free;
end;

procedure TfContrato.qActividadContratoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  qImagen.Close;
  qImagen.open;
end;

procedure TfContrato.qContratoCODIGOADMINISTRATIVOChange(Sender: TField);
begin
  inherited;
  qInterventor.Close;
  qInterventor.Open;
end;

procedure TfContrato.qLiquidacionAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qLiquidacion.ApplyUpdates;
  qLiquidacion.CommitUpdates;
end;

procedure TfContrato.qLiquidacionAfterInsert(DataSet: TDataSet);
var codigo:integer;
  query:tquery;
begin
  inherited;
  query:=TQuery.create(Self);
  query.DatabaseName:='BaseDato';
  query.sql.text:='SELECT MAX(CODIGOCONTRATOLIQUIDACION)FROM CONTRATOLIQUIDACION';
  query.open;
  codigo:=0;
  if (query.Fields[0].AsString<>'') then
    codigo:=query.Fields[0].AsInteger;
  inc(codigo);
  DataSet.FieldByName('CODIGOCONTRATOLIQUIDACION').AsInteger:=codigo;
  query.sql.text:='SELECT MAX(CONSECUTIVO)FROM CONTRATOLIQUIDACION WHERE CODIGOCONTRATO='+qContratoCODIGOCONTRATO.AsString;
  query.open;
  codigo:=0;
  if (query.Fields[0].AsString<>'') then
    codigo:=query.Fields[0].AsInteger;
  inc(codigo);
  DataSet.FieldByName('CONSECUTIVO').AsInteger:=codigo;
  query.free;
  DataSet.FieldByName('CODIGOCONTRATO').AsInteger:=qContratoCODIGOCONTRATO.AsInteger;
  dbgLiquidacion.Refresh;
end;

procedure TfContrato.qLiquidacionAfterPost(DataSet: TDataSet);
begin
  inherited;
  qLiquidacion.ApplyUpdates;
  qLiquidacion.CommitUpdates;
  if (InsertandoLiquidacion) then
  begin
    InsertarLiquidacionActividadObras;
    InsertarLiquidacionMaterialObras;
    ActualizarValorLiquidacion;
  end;
  InsertandoLiquidacion:=false;
  qLiquidacion.close;
  qLiquidacion.open;
  qLiquidacionActividad.close;
  qLiquidacionActividad.open;
  qLiquidacionMaterial.close;
  qLiquidacionMaterial.open;
end;

procedure TfContrato.qLiquidacionMaterialAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('CODIGOCONTRATOLIQUIDACION').AsInteger:=qLiquidacionCODIGOCONTRATOLIQUIDACION.AsInteger;
end;

//Agrega registros de liquidacion por cada actividad de cada obra
procedure TfContrato.InsertarLiquidacionActividadObras;
var
  query,qDatosObra,qDatosActividadObra:tquery;
  obra:string;
begin
  query:=TQuery.create(self);
  query.databasename:='BaseDato';

  qDatosObra:=TQuery.create(self);
  qDatosObra.databasename:='BaseDato';

  qDatosActividadObra:=TQuery.create(self);
  qDatosActividadObra.databasename:='BaseDato';
  qDatosObra.close;
  qDatosObra.sql.clear;
  qDatosObra.sql.Add('SELECT CODIGOCONTRATOOBRA FROM CONTRATOOBRA WHERE CODIGOCONTRATO='+qContratoCODIGOCONTRATO.AsString);
  qDatosObra.sql.Add('ORDER BY CODIGOCONTRATOOBRA');
  qDatosObra.Open;
  while not (qDatosObra.eof) do
  begin
    obra:=qDatosObra.Fieldbyname('CODIGOCONTRATOOBRA').asstring;
    qDatosActividadObra.close;
    qDatosActividadObra.sql.clear;
    qDatosActividadObra.sql.Add('SELECT C.CODIGOCONTRATO,C.CONSECUTIVO,A.CODIGOCONTRATOOBRA,');
    qDatosActividadObra.sql.Add('A.CODIGOACTIVIDADCONTRATOOBRA,A.CODIGOACTIVIDAD,NVL(A.CANTIDADEJECUTADA,0)AS CANTIDADEJECUTADA');
    qDatosActividadObra.sql.Add('FROM ACTIVIDADCONTRATOOBRA A,CONTRATOOBRA C');
    qDatosActividadObra.sql.Add('WHERE C.CODIGOCONTRATOOBRA=A.CODIGOCONTRATOOBRA');
    qDatosActividadObra.sql.Add('AND A.CODIGOCONTRATOOBRA='+obra);
    qDatosActividadObra.Open;
    while not qDatosActividadObra.eof do
    begin
      query.close;
      query.sql.clear;
      query.sql.add('INSERT INTO CONTRATOLIQUIDACIONACTIVIDAD(CODIGOCONTRATOLIQUIDACION,');
      query.sql.add('CODIGOCONTRATO,CONSECUTIVO, CODIGOCONTRATOOBRA, CODIGOACTIVIDADCONTRATOOBRA,CODIGOACTIVIDAD,CANTIDADLIQUIDADATOTAL) ');
      query.sql.add('VALUES (');
      query.sql.add(qLiquidacionCODIGOCONTRATOLIQUIDACION.asstring+',');
      query.sql.add(qDatosActividadObra.fieldbyname('CODIGOCONTRATO').asstring+',');
      query.sql.add(qDatosActividadObra.fieldbyname('CONSECUTIVO').asstring+',');
      query.sql.add(qDatosActividadObra.fieldbyname('CODIGOCONTRATOOBRA').asstring+',');
      query.sql.add(qDatosActividadObra.fieldbyname('CODIGOACTIVIDADCONTRATOOBRA').asstring+',');
      query.sql.add(qDatosActividadObra.fieldbyname('CODIGOACTIVIDAD').asstring+',');
      query.sql.add(qDatosActividadObra.fieldbyname('CANTIDADEJECUTADA').asstring+')');
      query.ExecSQL;
      qDatosActividadObra.next;
    end;
    qDatosObra.next;
  end;
  qDatosObra.free;
  qDatosActividadObra.free;
  query.free;
  qLiquidacionActividad.Close;
  qLiquidacionActividad.Open;
end;
//Agrega registros de liquidacion por cada material de cada obra
procedure TfContrato.InsertarLiquidacionMaterialObras;
var
  query,qDatos,qDatosMaterial:tquery;
begin
  query:=TQuery.create(self);
  query.databasename:='BaseDato';

  qDatos:=TQuery.create(self);
  qDatos.databasename:='BaseDato';

  qDatosMaterial:=TQuery.create(self);
  qDatosMaterial.databasename:='BaseDato';

  qdatos.sql.clear;
  qDatos.sql.Add('SELECT CODIGOCONTRATOOBRA FROM CONTRATOOBRA WHERE CODIGOCONTRATO='+qContratoCODIGOCONTRATO.AsString);
  qDatos.sql.Add('ORDER BY CODIGOCONTRATOOBRA');
  qDatos.Open;
  while not qDatos.eof do
  begin
    qDatosMaterial.sql.clear;
    qDatosMaterial.sql.Add('SELECT C.CODIGOCONTRATO,C.CONSECUTIVO,C.CODIGOCONTRATOOBRA,');
    qDatosMaterial.sql.Add('CODIGOMATERIALCONTRATOOBRA,CODIGOMATERIAL,NVL(CANTIDADCONSUMIDA,0) AS CANTIDADCONSUMIDA');
    qDatosMaterial.sql.Add('FROM MATERIALCONTRATOOBRA M ,CONTRATOOBRA C');
    qDatosMaterial.sql.Add('WHERE C.CODIGOCONTRATOOBRA=M.CODIGOCONTRATOOBRA');
    qDatosMaterial.sql.Add('AND C.CODIGOCONTRATOOBRA='+qDatos.Fields[0].asstring);
    qDatosMaterial.Open;
    while not qDatosMaterial.eof do
    begin
      query.sql.clear;
      query.sql.add('INSERT INTO CONTRATOLIQUIDACIONMATERIAL(CODIGOCONTRATOLIQUIDACION,CODIGOCONTRATO,');
      query.sql.add('CODIGOCONTRATOOBRA,CONSECUTIVO, CODIGOMATERIALCONTRATOOBRA,CODIGOMATERIAL,CANTIDADLIQUIDADATOTAL)');
      query.sql.add('VALUES (');
      query.sql.add(qLiquidacionCODIGOCONTRATOLIQUIDACION.asstring+',');
      query.sql.add(qDatosMaterial.fieldbyname('CODIGOCONTRATO').asstring+',');
      query.sql.add(qDatosMaterial.fieldbyname('CODIGOCONTRATOOBRA').asstring+',');
      query.sql.add(qDatosMaterial.fieldbyname('CONSECUTIVO').asstring+',');
      query.sql.add(qDatosMaterial.fieldbyname('CODIGOMATERIALCONTRATOOBRA').asstring+',');
      query.sql.add(qDatosMaterial.fieldbyname('CODIGOMATERIAL').asstring+',');
      query.sql.add(qDatosMaterial.fieldbyname('CANTIDADCONSUMIDA').asstring+')');
      query.ExecSQL;
      qDatosMaterial.next;
    end;
    qdatos.next;
  end;
  qDatos.free;
  qDatosMaterial.free;
  query.free;
  qLiquidacionMaterial.close;
  qLiquidacionMaterial.Open;
end;

procedure TfContrato.bImprimirActaLiquidacionClick(Sender: TObject);
var punto:TPoint;
begin
 punto:=PanelLiquidacion.ClientToScreen(Classes.Point(bImprimirActaLiquidacion.Left, bImprimirActaLiquidacion.top));
 PopupMenuLiquidacionParcial.Popup(punto.x+10, punto.y+10);
end;

procedure TfContrato.qLiquidacionMaterialAfterPost(DataSet: TDataSet);
begin
  inherited;
  qLiquidacionMaterial.ApplyUpdates;
  qLiquidacionMaterial.CommitUpdates;
end;

procedure TfContrato.qLiquidacionActividadAfterPost(DataSet: TDataSet);
begin
  inherited;
  qLiquidacionActividad.ApplyUpdates;
  qLiquidacionActividad.CommitUpdates;
end;

procedure TfContrato.qLiquidacionActividadAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qLiquidacionActividad.ApplyUpdates;
  qLiquidacionActividad.CommitUpdates;
end;

procedure TfContrato.qLiquidacionMaterialCalcFields(DataSet: TDataSet);
var query:tquery;
begin
  inherited;
  query:=tquery.create(self);
  query.databasename:='BaseDato';
  query.sql.add('select valorunitario');
  query.sql.add('from materialcontratoobra');
  query.sql.add('where codigomaterialcontratoobra='+qLiquidacionMaterialCODIGOMATERIALCONTRATOOBRA.asstring);
  query.open;
  DataSet.FieldByName('ValorUnitario').AsString:=query.fieldbyname('ValorUnitario').AsString;
  query.free;
end;

procedure TfContrato.qLiquidacionFECHAValidate(Sender: TField);
var query:tquery;
begin
  inherited;
  if qLiquidacion.State=dsInsert then
  begin
    if Sender.AsString<>'' then
    begin
      if (Sender.AsDateTime<qContratoFECHAINICIO.AsDateTime) then
        raise exception.create('La fecha de liquidación no puede ser anterior al inicio del contrato.');
      query:=TQuery.create(Self);
      query.DatabaseName:='BaseDato';
      query.sql.clear;
      query.sql.add('select max(fecha) from contratoliquidacion');
      query.sql.add('where codigocontrato='+qContratoCODIGOCONTRATO.AsString);
      query.open;
      if (query.RecordCount>0) then                                                                        
      begin
        if (Sender.AsDateTime<query.fields[0].AsDateTime) then
          raise exception.create('La fecha de liquidación no puede ser anterior a otra liquidación previa.');
      end;
      query.free;
    end;
  end
  else
    raise exception.create('La fecha de liquidación no es editable');
end;

procedure TfContrato.qLiquidacionBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (qLiquidacionFECHA.AsString='') then
    raise exception.create('Debe ingresar una fecha de liquidación');
  if (qLiquidacionACTA.AsString='') then
    raise exception.create('Debe ingresar Un número de Acta');
  if qLiquidacion.state=dsInsert then InsertandoLiquidacion:=true
  else InsertandoLiquidacion:=false;

  qLiquidacionVALORLIQUIDACIONACTUAL.AsFloat:=qLiquidacionVALORMATERIALACTUAL.AsFloat+ qLiquidacionVALORACTIVIDADACTUAL.AsFloat;
  qLiquidacionVALORLIQUIDACIONTOTAL.AsFloat:=qLiquidacionVALORMATERIALTOTAL.AsFloat+ qLiquidacionVALORACTIVIDADTOTAL.AsFloat;
end;

procedure TfContrato.dbgLiquidacionEditButtonClick(Sender: TObject);
begin
  sFecha := dbgLiquidacion.SelectedField.AsDateTime;
  Fecha := GetFecha(false);
  if Fecha <> '' then dbgLiquidacion.SelectedField.AsString := Fecha;
end;

function TfContrato.GetFecha(Tipo: Boolean): String;

function FechaSinSegundos: string;
var Hour, Min, Sec, MSec: Word;
begin
   if sFecha = 0 then
   begin
     DecodeTime(Now, Hour, Min, Sec, MSec);
     Min := 0;
     Sec := 0;
     Result := DateTimeToStr(Int(Now) + EncodeTime(Hour, Min, Sec, MSec));
   end
   else
   begin
     Result := DateTimeToStr(sFecha);
   end;
end;

begin
  fFormaFecha := TfFormaFecha.Create(Application);
  uFormaFecha.sFecha := FechaSinSegundos;
  FFormaFecha.seSegundos.Value := 0;
  FFormaFecha.seSegundos.Enabled := False;
  FFormaFecha.seMinutos.Value := 0;
  FFormaFecha.seMinutos.Enabled := False;
  fFormaFecha.height:=291;
  if FFormaFecha.ShowModal = mrOk then
    if Tipo then
       Result := DateTimetoStr(FFormaFecha.Date+FFormaFecha.fTime)
    else
       Result := DateTimetoStr(FFormaFecha.Date)
  else Result := DateTimeToStr(sFecha);
  fFormaFecha.Free;
end;

procedure TfContrato.ActualizarValorLiquidacionActividades;
var qCantidadActividad,qBorrarActividadesNulas:tquery;
  ValorLiquidadoTotal,ValorLiquidadoActual:double;
begin
  qCantidadActividad:=tquery.create(self);
  qCantidadActividad.databasename:='BaseDato';
  qCantidadActividad.close;
  qCantidadActividad.sql.Add('SELECT A.CODIGOCONTRATO,A.CODIGOACTIVIDADCONTRATOOBRA,L.CANTIDADLIQUIDADATOTAL');
  qCantidadActividad.sql.Add('FROM CONTRATOLIQUIDACIONACTIVIDAD L,ACTIVIDADCONTRATOOBRA A');
  qCantidadActividad.sql.Add('WHERE A.CODIGOACTIVIDADCONTRATOOBRA=L.CODIGOACTIVIDADCONTRATOOBRA');
  qCantidadActividad.sql.Add('AND L.CODIGOCONTRATO=:CODIGOCONTRATO');
  qCantidadActividad.sql.Add('AND L.CONSECUTIVO=:CONSECUTIVO');
  qCantidadActividad.sql.Add('AND A.CODIGOACTIVIDADCONTRATOOBRA=:CODIGOACTIVIDADCONTRATOOBRA');
  qLiquidacionActividad.close;
  qLiquidacionActividad.open;
  ValorLiquidadoTotal:=0;
  ValorLiquidadoActual:=0;
  while not qLiquidacionActividad.eof do
  begin
    qCantidadActividad.close;
    qCantidadActividad.parambyname('CODIGOCONTRATO').AsString:=qLiquidacionCODIGOCONTRATO.AsString ;
    qCantidadActividad.parambyname('CONSECUTIVO').AsInteger:=qLiquidacionCONSECUTIVO.AsInteger-1 ;
    qCantidadActividad.parambyname('CODIGOACTIVIDADCONTRATOOBRA').AsString:=qLiquidacionActividadCODIGOACTIVIDADCONTRATOOBRA.AsString ;
    qCantidadActividad.open;
    qLiquidacionActividad.edit;
    ValorLiquidadoTotal:=ValorLiquidadoTotal+qLiquidacionActividadCANTIDADLIQUIDADATOTAL.AsFloat*qLiquidacionActividadValorUnitario.AsFloat;
    if (qCantidadActividad.Recordcount>0) then
      qLiquidacionActividadCANTIDADLIQUIDADAACTUAL.AsInteger:= qLiquidacionActividadCANTIDADLIQUIDADATOTAL.AsInteger-
       qCantidadActividad.fieldbyname('CANTIDADLIQUIDADATOTAL').AsInteger
    else
      qLiquidacionActividadCANTIDADLIQUIDADAACTUAL.AsInteger:= qLiquidacionActividadCANTIDADLIQUIDADATOTAL.AsInteger;
    ValorLiquidadoActual:=ValorLiquidadoActual+qLiquidacionActividadCANTIDADLIQUIDADAACTUAL.AsFloat*qLiquidacionActividadValorUnitario.AsFloat;
    qLiquidacionActividad.post;
    qLiquidacionActividad.next;
  end;
  qBorrarActividadesNulas:=TQuery.create(self);
  qBorrarActividadesNulas.DatabaseName:='BaseDato';
  qBorrarActividadesNulas.sql.Add('DELETE FROM CONTRATOLIQUIDACIONACTIVIDAD WHERE CODIGOCONTRATOLIQUIDACION='+qLiquidacionCODIGOCONTRATOLIQUIDACION.Asstring);
  qBorrarActividadesNulas.sql.Add('AND CANTIDADLIQUIDADAACTUAL=0');
  qBorrarActividadesNulas.ExecSQL;
  qBorrarActividadesNulas.free;
  qLiquidacion.edit;
  qLiquidacionVALORACTIVIDADACTUAL.AsFloat:=ValorLiquidadoActual;
  qLiquidacionVALORACTIVIDADTOTAL.AsFloat:=ValorLiquidadoTotal;
  qLiquidacion.post;
  qCantidadActividad.free;
end;

procedure TfContrato.ActualizarValorLiquidacionMateriales;
var qCantidadMaterial,qBorrarMaterialesNulos:tquery;
  ValorLiquidadoTotal,ValorLiquidadoActual:double;
begin
  qCantidadMaterial:=tquery.create(self);
  qCantidadMaterial.databasename:='BaseDato';
  qCantidadMaterial.close;
  qCantidadMaterial.sql.Add('SELECT M.CODIGOCONTRATO,M.CODIGOMATERIALCONTRATOOBRA,L.CANTIDADLIQUIDADATOTAL');
  qCantidadMaterial.sql.Add('FROM CONTRATOLIQUIDACIONMATERIAL L,MATERIALCONTRATOOBRA M');
  qCantidadMaterial.sql.Add('WHERE M.CODIGOMATERIALCONTRATOOBRA=L.CODIGOMATERIALCONTRATOOBRA');
  qCantidadMaterial.sql.Add('AND L.CODIGOCONTRATO=:CODIGOCONTRATO');
  qCantidadMaterial.sql.Add('AND L.CONSECUTIVO=:CONSECUTIVO');
  qCantidadMaterial.sql.Add('AND M.CODIGOMATERIALCONTRATOOBRA=:CODIGOMATERIALCONTRATOOBRA');
  qLiquidacionMaterial.close;
  qLiquidacionMaterial.open;
  ValorLiquidadoTotal:=0;
  ValorLiquidadoActual:=0;
  while not qLiquidacionMaterial.eof do
  begin
    qCantidadMaterial.close;
    qCantidadMaterial.parambyname('CODIGOCONTRATO').AsString:=qLiquidacionCODIGOCONTRATO.AsString ;
    qCantidadMaterial.parambyname('CONSECUTIVO').AsInteger:=qLiquidacionCONSECUTIVO.AsInteger-1 ;
    qCantidadMaterial.parambyname('CODIGOMATERIALCONTRATOOBRA').AsString:=qLiquidacionMaterialCODIGOCONTRATOOBRA.AsString ;
    qCantidadMaterial.open;
    qLiquidacionMaterial.edit;
    ValorLiquidadoTotal:=ValorLiquidadoTotal+qLiquidacionMaterialCANTIDADLIQUIDADATOTAL.AsFloat*qLiquidacionMaterialValorUnitario.AsFloat;
    if (qCantidadMaterial.Recordcount>0) then
      qLiquidacionMaterialCANTIDADLIQUIDADAACTUAL.AsInteger:= qLiquidacionMaterialCANTIDADLIQUIDADATOTAL.AsInteger-
       qCantidadMaterial.fieldbyname('CANTIDADLIQUIDADATOTAL').AsInteger
    else
      qLiquidacionMaterialCANTIDADLIQUIDADAACTUAL.AsInteger:= qLiquidacionMaterialCANTIDADLIQUIDADATOTAL.AsInteger;
    ValorLiquidadoActual:=ValorLiquidadoActual+qLiquidacionMaterialCANTIDADLIQUIDADAACTUAL.AsFloat*qLiquidacionMaterialValorUnitario.AsFloat;
    qLiquidacionMaterial.post;
    qLiquidacionMaterial.next;
  end;
  qBorrarMaterialesNulos:=TQuery.create(self);
  qBorrarMaterialesNulos.DatabaseName:='BaseDato';
  qBorrarMaterialesNulos.sql.Add('DELETE FROM CONTRATOLIQUIDACIONMATERIAL WHERE CODIGOCONTRATOLIQUIDACION='+qLiquidacionCODIGOCONTRATOLIQUIDACION.Asstring);
  qBorrarMaterialesNulos.sql.Add('AND CANTIDADLIQUIDADAACTUAL=0');
  qBorrarMaterialesNulos.ExecSQL;
  qBorrarMaterialesNulos.free;

  qLiquidacion.edit;
  qLiquidacionVALORMATERIALACTUAL.AsFloat:=ValorLiquidadoActual;
  qLiquidacionVALORMATERIALTOTAL.AsFloat:=ValorLiquidadoTotal;
  qLiquidacion.post;
  qCantidadMaterial.free;
end;

procedure TfContrato.qLiquidacionActividadCalcFields(DataSet: TDataSet);
var query:tquery;
begin
  inherited;
  query:=tquery.create(self);
  query.databasename:='BaseDato';
  query.sql.add('SELECT NVL(valorunitariomaterial,0)+NVL(valorunitariomanoobra,0)+NVL(valorunitarioequipo,0)+');
  query.sql.add('NVL(valorunitariotransporte,0) AS valorunitario FROM actividadcontratoobra');
  query.sql.add('where codigoactividadcontratoobra='+qLiquidacionActividadCODIGOACTIVIDADCONTRATOOBRA.asstring);
  query.open;
  DataSet.FieldByName('ValorUnitario').AsString:=query.fieldbyname('ValorUnitario').AsString;
  query.free;
end;

procedure TfContrato.qContratoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qClausula.close;
  qClausula.open;
  qMaterialContrato.open;
  qActividadContrato.open;
  qLiquidacion.open;
  qTipoContrato.Close;
  qTipoContrato.Open;
end;

procedure TfContrato.ActadeLiquidacinParcial1Click(Sender: TObject);
var i,codigoliquidacion:integer;
begin
  try
    codigoliquidacion:=qLiquidacionCODIGOCONTRATOLIQUIDACION.AsInteger;
    if qContrato.State in [dsEdit,dsInsert] then qContrato.Post;
    qLiquidacion.Locate('CODIGOCONTRATOLIQUIDACION',codigoliquidacion,[]);
    for i:=0 to 3 do
    begin
      NombreFirmante[i]:='';
      CargoFirmante[i]:='';
    end;
    qFirma.Close;
    qFirma.ParamByName('CodigoDocumento').AsString:='ACT';
    qFirma.Open;
    i:=1;
    NombreFirmante[0]:=qContratoREPRESENTANTECONTRATISTA.AsString;
    CargoFirmante[0]:='REPRESENTANTE LEGAL - CONTRATISTA';

    while not (qFirma.Eof) and (i<4) do
    begin
      NombreFirmante[i]:=qFirma.fieldbyname('NombreEmpleado').AsString;
      CargoFirmante[i]:=qFirma.fieldbyname('NombreCargo').AsString;
      qFirma.Next;
      inc(i);
    end;
    FActaParcial := TFActaParcial.Create(Application);
    try
      FActaParcial.Datos.Dependencia:=qCIANOMBRECATEGORIA.AsString;
      FActaParcial.Datos.Acta:=qLiquidacionActa.Asinteger;
      FActaParcial.Datos.NumeroContrato:=qContratoNUMEROCONTRATO.AsString;
      FActaParcial.Datos.NombreContratista:=qContratistaNOMBRECONTRATISTA.AsString;
      FActaParcial.Datos.NitContratista:=qContratoCODIGOCONTRATISTA.AsString;
      FActaParcial.Datos.Objeto:=qContratoOBJETO.AsString;
      FActaParcial.Datos.valorapagar:=qLiquidacionCostoTotal.Asfloat;
      FActaParcial.Datos.FechaLiquidacion:=qLiquidacionFECHA.AsDateTime;
      FActaParcial.CargarDatos;
      if qLiquidacionFINAL.asstring='S' then
        FActaParcial.Datos.Asunto:='LIQUIDACIÓN FINAL'
      else
        FActaParcial.Datos.Asunto:='LIQUIDACIÓN PARCIAL';
      for i:=0 to 3 do
      begin
        FActaParcial.NombreFirmante[i]:=NombreFirmante[i];
        FActaParcial.CargoFirmante[i]:=CargoFirmante[i];
      end;
      FActaParcial.Show;
    except
      FActaParcial.free;
    end;
  except
  end;
  qContrato.Edit;
end;

procedure TfContrato.ActividadesLiquidadas1Click(Sender: TObject);
var codigoliquidacion,i:integer;
unidad,decimal,valor:String;
begin
  codigoliquidacion:=qLiquidacionCODIGOCONTRATOLIQUIDACION.AsInteger;
  if qContrato.State in [dsEdit,dsInsert] then qContrato.Post;
  qLiquidacion.Locate('CODIGOCONTRATOLIQUIDACION',codigoliquidacion,[]);

  try
    fQRActividadContratoLiquidado:=tfQRActividadContratoLiquidado.Create(Application);
    fQRActividadContratoLiquidado.QuickReport.ReportTitle := 'Actividades Liquidadas. Contrato # '+ qContratoNUMEROCONTRATO.AsString+ 'Acta No.'+qLiquidacionACTA.AsString;
    fQRActividadContratoLiquidado.qContrato.Close;
    fQRActividadContratoLiquidado.qContrato.ParamByName('CODIGOCONTRATO').AsString:=qContratoCodigoContrato.AsString;
    fQRActividadContratoLiquidado.qContrato.Open;
    fQRActividadContratoLiquidado.qActividadContrato.DataSource:=dsLiquidacion;
    fQRActividadContratoLiquidado.qActividadContrato.open;
    fQRActividadContratoLiquidado.qrlivasobre.caption:=qContratoIvaSobre.AsString;

    i:=Pos('.',qContratoCostoTotal.Asstring);

 if i>0 then
   begin
     Unidad:=copy(qContratoCostoTotal.Asstring,1,i-1);
     Decimal:=Copy(qContratoCostoTotal.Asstring,i+1,2);
     DParser1.dsunidades:='Pesos';
     DParser1.Expresion :=Unidad;
     DParser1.Execute;
     Unidad:=DParser1.DsEnLetras;
     DParser1.dsunidades:='Centavos';
     DParser1.Expresion :=Decimal;
     DParser1.Execute;
     Decimal:=DParser1.DsEnLetras;
     fQRActividadContratoLiquidado.QRLSon.Caption := 'Son : '+ unidad+' con '+decimal;
   end
 else
   begin
     DParser1.Expresion :=qContratoCostoTotal.Asstring;
     DParser1.Execute;
     fQRActividadContratoLiquidado.QRLSon.Caption := 'Son : '+ DParser1.DsEnLetras;
   end;

    {DParser1.Expresion := qContratoCostoTotalPresupuestado.Asstring;
    DParser1.Execute;
    fQRActividadContratoLiquidado.QRLSon.Caption := 'Son : '+ DParser1.DsEnLetras;  }

    fQRActividadContratoLiquidado.QuickReport.preview;
  except
    on e:exception do
    begin
      showmessage(e.message);
      try
        fQRActividadContratoLiquidado.free;
      except
      end;
    end;
  end;
 // qContrato.edit;
end;

procedure TfContrato.MaterialesLiquidados2Click(Sender: TObject);
var codigoliquidacion:integer;
begin
  codigoliquidacion:=qLiquidacionCODIGOCONTRATOLIQUIDACION.AsInteger;
  if qContrato.State in [dsEdit,dsInsert] then qContrato.Post;
  qLiquidacion.Locate('CODIGOCONTRATOLIQUIDACION',codigoliquidacion,[]);

  fQRMaterialContratoLiquidado:=tfQRMaterialContratoLiquidado.Create(Application);
  try
    fQRMaterialContratoLiquidado.qMaterialContrato.close;
    fQRMaterialContratoLiquidado.qMaterialContrato.DataSource:=dsLiquidacion;
    fQRMaterialContratoLiquidado.qMaterialContrato.open;
    fQRMaterialContratoLiquidado.QuickReport.ReportTitle := 'Materiales Liquidados. Contrato # '+qContrato.FieldByName('NUMEROCONTRATO').AsString;
    fQRMaterialContratoLiquidado.QuickReport.Preview;
  except
    on e:exception do
    begin
      showmessage(e.message);
      fQRMaterialContratoLiquidado.free;
    end;
  end;
//  qContrato.Edit;
//  Notebook.PageIndex:=4;
//  Notebook.Refresh;
end;

procedure TfContrato.dbgLiquidacionDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var  DrawRect: TRect;
  colorAnterior:tcolor;
begin
  if qLiquidacionFINAL.AsString='S' then
  begin
    DrawRect:=Rect;
//      InflateRect(DrawRect,-1,-1);
    colorAnterior:=dbgLiquidacion.Canvas.brush.Color;
    dbgLiquidacion.Canvas.brush.Color:=clNavy;
    dbgLiquidacion.Canvas.FrameRect(Rect);
    dbgLiquidacion.Canvas.brush.Color:=colorAnterior;
  end;
end;

procedure TfContrato.bLiquidacionFinalClick(Sender: TObject);
begin
  qLiquidacion.Insert;
  qLiquidacionFINAL.AsString:='S';
  qContratoCODIGOESTADOCONTRATO.AsString:='4';
end;

procedure TfContrato.qLiquidacionBeforeInsert(DataSet: TDataSet);
var query:tquery;
i:integer;
begin
  query:=tquery.Create(self);
  query.databasename:='BaseDato';
  query.sql.Add('SELECT COUNT(*) FROM CONTRATOLIQUIDACION WHERE CODIGOCONTRATO='+qContratoCODIGOCONTRATO.AsString);
  query.sql.Add('AND FINAL=''S''');
  query.open;
  i:=query.Fields[0].AsInteger;
  query.free;
  if i>0 then raise exception.create('Ya existe una liquidación final para este contrato');
end;

procedure TfContrato.qLiquidacionBeforeDelete(DataSet: TDataSet);
var query:tquery;
  s:string;
begin
  query:=tquery.create(self);
  query.databasename:='BaseDato';
  query.sql.add('SELECT MAX(CONSECUTIVO) FROM CONTRATOLIQUIDACION WHERE CODIGOCONTRATO='+qContratoCODIGOCONTRATO.AsString);
  query.open;
  s:=query.fields[0].AsString;
  query.free;
  if (qLiquidacionCONSECUTIVO.AsString<>s) then
    raise exception.Create('Solo se puede eliminar la última liquidación realizada');

  if qLiquidacionFINAL.AsString='S' then qContratoCODIGOESTADOCONTRATO.AsString:='3';  
end;

procedure TfContrato.sbCiaClick(Sender: TObject);
var CIA:INTEGER;
begin
  CIA := CapturarCIA;
  if CIA<>0 then qContratoCODIGOADMINISTRATIVO.AsInteger:=CIA;
end;

procedure TfContrato.qContratoCODIGOADMINISTRATIVOValidate(Sender: TField);
begin
  if Sender.Text <> '' then
  begin
    qCIA.Close;
    qCIA.Params[0].AsString:=Sender.Text;
    qCIA.Open;
    if qCIA.RecordCount>0 then
      lbCIA.Caption:=qCIANOMBREADMINISTRATIVO.AsString;
  end;
end;

procedure TfContrato.FormShow(Sender: TObject);
begin
  qContratoCODIGOADMINISTRATIVOValidate(qContratoCODIGOADMINISTRATIVO);
end;

procedure TfContrato.ActualizarValorLiquidacion;
begin
  ActualizarValorLiquidacionActividades;
  ActualizarValorLiquidacionMateriales;
  qLiquidacion.edit;
  qLiquidacionVALORLIQUIDACIONACTUAL.AsFloat:=qLiquidacionVALORACTIVIDADACTUAL.AsFloat+
  qLiquidacionVALORMATERIALACTUAL.AsFloat;
  qLiquidacionVALORLIQUIDACIONTOTAL.AsFloat:=qLiquidacionVALORACTIVIDADTOTAL.AsFloat+
  qLiquidacionVALORMATERIALTOTAL.AsFloat;
  qLiquidacion.post;
end;

procedure TfContrato.qLiquidacionCalcFields(DataSet: TDataSet);
var
  IVA,AIU,Material,Actividad,Utilidades,Administracion,Imprevistos,
  ValorTotal,Suma,SumaAIU,SumaIVA:Double;
begin
  AIU := qContrato.FieldByName('AIU').AsFloat/100;
  IVA := qContrato.FieldByName('IVA').AsFloat/100;
  Material := qLiquidacionVALORMATERIALACTUAL.AsFloat;
  Actividad := qLiquidacionVALORACTIVIDADACTUAL.AsFloat;
  Utilidades := qContrato.FieldByName('UTILIDADES').AsFloat/100;
  Administracion := qContrato.FieldByName('ADMINISTRACION').AsFloat/100;
  Imprevistos := qContrato.FieldByName('IMPREVISTOS').AsFloat/100;
  Suma:= Material+Actividad ;
  SumaAIU := Suma*AIU;
  SumaIVA:=0;
  if qTipoContrato.FieldByName('IVAUTILIDAD').AsString='S' then
  begin
    SumaIVA := (Suma*Utilidades)*IVA;
  end;
  if qTipoContrato.FieldByName('IVAADMINISTRACION').AsString='S' then
  begin
    SumaIVA := SumaIVA+(Suma*Administracion)*IVA;
  end;
  if qTipoContrato.FieldByName('IVAIMPREVISTOS').AsString='S' then
  begin
    SumaIVA := SumaIVA+(Suma*Imprevistos)*IVA;
  end;
  ValorTotal := Suma +SumaAIU+SumaIVA;
  DataSet.FieldByName('ValorIVA').AsFloat := SumaIVA;
  DataSet.FieldByName('ValorAIU').AsFloat := SumaAIU;
  DataSet.FieldByName('COSTOCONAIU').AsFloat := SUMA+SUMAAIU;
  DataSet.FieldByName('COSTOTOTAL').AsFloat := ValorTotal;
end;

procedure TfContrato.qLiquidacionAfterOpen(DataSet: TDataSet);
begin
  qLiquidacionActividad.open;
  qLiquidacionMaterial.open;
end;


procedure TfContrato.dMenuCIASelectID(Sender: tnMenuItem; ID: Integer;
  MenuEstructura: tMenuEs);
begin
  inherited;
  qContrato.FieldByName('CODIGOADMINISTRATIVO').AsInteger:=ID;
end;

end.


 