
unit uContratoObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, Db, DBTables, DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, Consdll,
  utnNewDbgrid, Buttons, ComCtrls, Mask, Menus, QuickRpt, TParser, uFIMPComunes,
  uFuncionSGD,Digisoft;

type
  TfContratoObra = class(TFBase)
    GroupBox1: TGroupBox;
    Label13: TLabel;
    LCodigoContrato: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DBECodigoConsecutivo: TDBEdit;
    DBEditCodAno: TDBEdit;
    EdCodigoContrato: TDBEdit;
    GroupBox2: TGroupBox;
    PanelBotones: TPanel;
    BitBtnAceptar: TBitBtn;
    BitBtnCancelar: TBitBtn;
    BitBtnImprimir: TBitBtn;
    BBCartografia: TBitBtn;
    dsContrato: TDataSource;
    MObjeto: TDBMemo;
    dsEstadoContrato: TDataSource;
    dsTipoContrato: TDataSource;
    dsActividadContratoObra: TDataSource;
    dsActividad: TDataSource;
    dsMaterialContratoObra: TDataSource;
    qPptoMateriales: TQuery;
    dsqPptoMateriales: TDataSource;
    dsMaterial: TDataSource;
    DParser1: TDParser;
    qPptoMaterialesCODIGOMATERIAL: TFloatField;
    qPptoMaterialesNOMBREMATERIAL: TStringField;
    qTotalActividad: TQuery;
    dsTotalActividad: TDataSource;
    qListaApoyo: TQuery;
    Notebook: TNotebook;
    gbUbicacion: TGroupBox;
    Opcionurbano: TDBRadioGroup;
    gbCostos: TGroupBox;
    Label53: TLabel;
    Label64: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label91: TLabel;
    Label93: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEditManoObra: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit2: TDBEdit;
    Panel3: TPanel;
    SCuadradoActividad: TShape;
    Label33: TLabel;
    Label40: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    SVerticalActivida1: TShape;
    SVerticalActivida2: TShape;
    SVerticalActivida3: TShape;
    SLineaVActividad1: TShape;
    SHorizontalActividad1: TShape;
    SHorizontalActividad2: TShape;
    Shape1: TShape;
    IEstructura: TImage;
    DBMemo2: TDBMemo;
    DBGridMaterial: TDBGrid;
    Arbol: TTreeView;
    Label9: TLabel;
    DBTGeografico: TDBText;
    sbBuscarCIG: TSpeedButton;
    dbeCIG: TDBEdit;
    qGeografico: TQuery;
    qContrato: TQuery;
    qEstadoContrato: TQuery;
    qTipoContrato: TQuery;
    updContrato: TUpdateSQL;
    qMaterial: TQuery;
    qMaterialContratoObra: TQuery;
    qActividadContratoObra1: TQuery;
    updActividadContratoObra: TUpdateSQL;
    qContratoValorIVA: TFloatField;
    qContratoCostoDirecto: TFloatField;
    qContratoCostoTotal: TFloatField;
    qContratoValorMaterial: TFloatField;
    qContratoValorManoObra: TFloatField;
    qContratoValorEquipo: TFloatField;
    qContratoValorTransporte: TFloatField;
    updActividadContratoObra1: TUpdateSQL;
    updMaterialContratoObra: TUpdateSQL;
    qDivision: TQuery;
    qDepartamento: TQuery;
    dsDivision: TDataSource;
    dsDepartamento: TDataSource;
    DBGridActividad: TDBGrid;
    qEmpresa: TQuery;
    qUnidad: TQuery;
    dsUnidad: TDataSource;
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
    DBNavigator1: TDBNavigator;
    qActividad: TQuery;
    qActividadContratoObra: TQuery;
    qActividadContratoObraNombreTipoPresupuesto: TStringField;
    qActividadContratoObraNombreActividadContrato: TStringField;
    qContratoAiu: TFloatField;
    qContratoValorAIU: TFloatField;
    qContratoCostoDirectoSinAIU: TFloatField;
    qContratoObra: TQuery;
    dsContratoObra: TDataSource;
    updContratoObra: TUpdateSQL;
    qContratoObraValorIVA: TFloatField;
    qContratoObraCostoDirecto: TFloatField;
    qContratoObraCostoTotal: TFloatField;
    qContratoObraValorMaterial: TFloatField;
    qContratoObraValorManoObra: TFloatField;
    qContratoObraValorEquipo: TFloatField;
    qContratoObraValorTransporte: TFloatField;
    qContratoNombreEstado: TStringField;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    qContratoNombreTipocontrato: TStringField;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    DBNavigator2: TDBNavigator;
    qTipoPresupuesto: TQuery;
    qTipoPresupuestoCODIGOTIPOPRESUPUESTO: TStringField;
    qTipoPresupuestoNOMBRETIPOPRESUPUESTO: TStringField;
    dsTipoPresupuesto: TDataSource;
    qTipoPresupuestoMANOOBRA: TStringField;
    qTipoPresupuestoMATERIAL: TStringField;
    qTipoPresupuestoEQUIPO: TStringField;
    qTipoPresupuestoTRANSPORTE: TStringField;
    qPptoMaterialesSUMA: TFloatField;
    qTotalActividadMATERIALPRESUPUESTADO: TFloatField;
    qTotalActividadTRANSPORTEPRESUPUESTADO: TFloatField;
    qTotalActividadMANOOBRAPRESUPUESTADO: TFloatField;
    qTotalActividadEQUIPOPRESUPUESTADO: TFloatField;
    qContratoObraCODIGOCONTRATOOBRA: TFloatField;
    qContratoObraCODIGOCONTRATO: TFloatField;
    qContratoObraCONSECUTIVO: TFloatField;
    qContratoObraFECHAINICIO: TDateTimeField;
    qContratoObraFECHAFIN: TDateTimeField;
    qContratoObraCODIGOMUNICIPIO: TFloatField;
    qContratoObraCODIGOGEOGRAFICO: TFloatField;
    qContratoObraCODIGOMUNICIPIODIFICULTAD: TFloatField;
    qMaterialContratoObra1: TQuery;
    qActividadContratoObraCODIGOCONTRATO: TFloatField;
    qActividadContratoObraCODIGOCONTRATOOBRA: TFloatField;
    qActividadContratoObraCODIGOTIPOPRESUPUESTO: TStringField;
    qActividadContratoObraCANTIDADPRESUPUESTADA: TFloatField;
    qContratoCODIGOCONTRATO: TFloatField;
    qContratoNUMEROCONTRATO: TStringField;
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
    qContratoSECUENCIA: TFloatField;
    qContratoANO: TStringField;
    qContratoCODIGOGEOGRAFICO: TFloatField;
    sbFechaInicio: TSpeedButton;
    Label17: TLabel;
    Label18: TLabel;
    DBEditFechaFinObra: TDBEdit;
    DBEditFechaInicioObra: TDBEdit;
    sbFechaFin: TSpeedButton;
    gbProgramacion: TGroupBox;
    Label6: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    DBEditFechaInicio: TDBEdit;
    DBEditFechaAsignacion: TDBEdit;
    DBEditFechaLiquidacion: TDBEdit;
    DBEditFechaTerminacion: TDBEdit;
    DBEditFechaCertificado: TDBEdit;
    qActividadContratoObra1CODIGOCONTRATO: TFloatField;
    qActividadContratoObra1CODIGOCONTRATOOBRA: TFloatField;
    qActividadContratoObra1CODIGOTIPOPRESUPUESTO: TStringField;
    qActividadContratoObra1CANTIDADPRESUPUESTADA: TFloatField;
    qActividadContratoObra1CANTIDADEJECUTADA: TFloatField;
    DBText5: TDBText;
    Label7: TLabel;
    Label19: TLabel;
    qContratoObraNombreGeografico: TStringField;
    qContratoObraNombreMunicipio: TStringField;
    qContratoObraIndiceDificultad: TFloatField;
    qContratoNombreGeografico: TStringField;
    qGeograficoCODIGOGEOGRAFICO: TFloatField;
    qGeograficoNOMBREGEOGRAFICO: TStringField;
    qGeograficoNOMBREMUNICIPIO: TMemoField;
    qGeograficoINDICEDIFICULTAD: TFloatField;
    qTipoPresupuestoActividad: TQuery;
    qTipoPresupuestoActividadFactorMaterial: TIntegerField;
    qTipoPresupuestoActividadFactorManoObra: TIntegerField;
    qTipoPresupuestoActividadFactorTransporte: TIntegerField;
    qTipoPresupuestoActividadFactorEquipo: TIntegerField;
    qTipoPresupuestoActividadCODIGOTIPOPRESUPUESTO: TStringField;
    qTipoPresupuestoActividadNOMBRETIPOPRESUPUESTO: TStringField;
    qTipoPresupuestoActividadMANOOBRA: TStringField;
    qTipoPresupuestoActividadMATERIAL: TStringField;
    qTipoPresupuestoActividadEQUIPO: TStringField;
    qTipoPresupuestoActividadTRANSPORTE: TStringField;
    dsGeografico: TDataSource;
    DBText6: TDBText;
    qGeograficoURBANO: TStringField;
    DBText7: TDBText;
    DBText8: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    Shape5: TShape;
    qActividadContratoObraVALORUNITARIOMATERIAL: TFloatField;
    qActividadContratoObraVALORUNITARIOMANOOBRA: TFloatField;
    qActividadContratoObraVALORUNITARIOEQUIPO: TFloatField;
    qActividadContratoObraVALORUNITARIOTRANSPORTE: TFloatField;
    qContratoCODIGOPRESUPUESTO: TFloatField;
    qContratoMONTOTOTAL: TFloatField;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    qActividadContratoObraMATERIALPRESUPUESTADO: TFloatField;
    qActividadContratoObraTRANSPORTEPRESUPUESTADO: TFloatField;
    qActividadContratoObraEQUIPOPRESUPUESTADO: TFloatField;
    qActividadContratoObraMANOOBRAPRESUPUESTADO: TFloatField;
    qContratoObraEQUIPOPRESUPUESTADO: TFloatField;
    qContratoObraMANOOBRAPRESUPUESTADO: TFloatField;
    qContratoMATERIALPRESUPUESTADO: TFloatField;
    qContratoTRANSPORTEPRESUPUESTADO: TFloatField;
    qContratoEQUIPOPRESUPUESTADO: TFloatField;
    qContratoMANOOBRAPRESUPUESTADO: TFloatField;
    Shape2: TShape;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    qActividadContratoObra1MATERIALPRESUPUESTADO: TFloatField;
    qActividadContratoObra1TRANSPORTEPRESUPUESTADO: TFloatField;
    qActividadContratoObra1EQUIPOPRESUPUESTADO: TFloatField;
    qActividadContratoObra1MANOOBRAPRESUPUESTADO: TFloatField;
    qActividadContratoObra1VALORUNITARIOMATERIAL: TFloatField;
    qActividadContratoObra1VALORUNITARIOMANOOBRA: TFloatField;
    qActividadContratoObra1VALORUNITARIOEQUIPO: TFloatField;
    qActividadContratoObra1VALORUNITARIOTRANSPORTE: TFloatField;
    qActividadContratoObraCANTIDADEJECUTADA: TFloatField;
    qContratoCODIGOADMINISTRATIVO: TFloatField;
    qContratoREPRESENTANTECONTRATISTA: TStringField;
    gbAsignacion: TGroupBox;
    Label34: TLabel;
    Label56: TLabel;
    GroupBox6: TGroupBox;
    Label11: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    DBText9: TDBText;
    DBEdit12: TDBEdit;
    qContratoNombreInterventor: TStringField;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    qContratoNombreContratista: TStringField;
    qActividadContratoObraNombreTipoActividad: TStringField;
    qActividadContratoObraNombreEstructura: TStringField;
    qActividadNOMBRETIPOACTIVIDAD: TStringField;
    qActividadNOMBREESTRUCTURA: TStringField;
    DBText12: TDBText;
    qActividadContratoObraCODIGOACTIVIDADCONTRATOOBRA: TFloatField;
    qActividadContratoObra1CODIGOACTIVIDADCONTRATOOBRA: TFloatField;
    qPptoMaterialesCODIGOACTIVIDADCONTRATOOBRA: TFloatField;
    updMaterialContratoObra1: TUpdateSQL;
    qMaterialContratoObra1CODIGOMATERIALCONTRATOOBRA: TFloatField;
    qMaterialContratoObra1CODIGOCONTRATO: TFloatField;
    qMaterialContratoObra1CODIGOCONTRATOOBRA: TFloatField;
    qMaterialContratoObra1CODIGOMATERIAL: TFloatField;
    qMaterialContratoObra1CANTIDADSOLICITADA: TFloatField;
    qMaterialContratoObra1CANTIDADENTREGADA: TFloatField;
    qMaterialContratoObra1CANTIDADCONSUMIDA: TFloatField;
    qMaterialContratoObra1CANTIDADREINTEGRADABUENA: TFloatField;
    qMaterialContratoObra1CANTIDADREINTEGRADAMALA: TFloatField;
    qMaterialContratoObra1CANTIDADRETIRADABUENA: TFloatField;
    qMaterialContratoObra1CANTIDADRETIRADAMALA: TFloatField;
    qMaterialContratoObra1VALORPRESUPUESTADO: TFloatField;
    qMaterialContratoObra1CODIGOACTIVIDADCONTRATOOBRA: TFloatField;
    qMaterialContratoObra1VALORUNITARIO: TFloatField;
    qMaterialContratoObraNOMBREMATERIAL: TStringField;
    qMaterialContratoObraNOMBREUNIDAD: TStringField;
    qMaterialContratoObraCODIGOMATERIALCONTRATOOBRA: TFloatField;
    qMaterialContratoObraCODIGOCONTRATO: TFloatField;
    qMaterialContratoObraCODIGOCONTRATOOBRA: TFloatField;
    qMaterialContratoObraCODIGOMATERIAL: TFloatField;
    qMaterialContratoObraCANTIDADSOLICITADA: TFloatField;
    qMaterialContratoObraCANTIDADENTREGADA: TFloatField;
    qMaterialContratoObraCANTIDADCONSUMIDA: TFloatField;
    qMaterialContratoObraCANTIDADREINTEGRADABUENA: TFloatField;
    qMaterialContratoObraCANTIDADREINTEGRADAMALA: TFloatField;
    qMaterialContratoObraCANTIDADRETIRADABUENA: TFloatField;
    qMaterialContratoObraCANTIDADRETIRADAMALA: TFloatField;
    qMaterialContratoObraVALORPRESUPUESTADO: TFloatField;
    qMaterialContratoObraCODIGOACTIVIDADCONTRATOOBRA: TFloatField;
    qMaterialContratoObraVALORUNITARIO: TFloatField;
    qContratoObraValorAIU: TFloatField;
    qContratoObraCostoDirectoSinAiu: TFloatField;
    qMaterialCODIGOMATERIAL: TFloatField;
    qMaterialNOMBREMATERIAL: TStringField;
    qMaterialCODIGOUNIDAD: TStringField;
    qMaterialVALORUNITARIO: TFloatField;
    qMaterialPESOUNITARIO: TFloatField;
    qContratoObraMATERIALPRESUPUESTADO: TFloatField;
    qContratoObraTRANSPORTEPRESUPUESTADO: TFloatField;
    qContratoObraMATERIALEJECUTADO: TFloatField;
    qContratoObraMANOOBRAEJECUTADO: TFloatField;
    qContratoObraEQUIPOEJECUTADO: TFloatField;
    qContratoObraTRANSPORTEEJECUTADO: TFloatField;
    qContratoObraVALORMATERIALSOLICITADO: TFloatField;
    qContratoObraVALORMATERIALENTREGADO: TFloatField;
    qContratoObraVALORMATERIALCONSUMIDO: TFloatField;
    qContratoObraVALORMATERIALREINTEGRADO: TFloatField;
    qActividadContratoObraMATERIALEJECUTADO: TFloatField;
    qActividadContratoObraTRANSPORTEEJECUTADO: TFloatField;
    qActividadContratoObraEQUIPOEJECUTADO: TFloatField;
    qActividadContratoObraMANOOBRAEJECUTADO: TFloatField;
    qMaterialContratoObraVALORCONSUMIDO: TFloatField;
    qMaterialContratoObraVALORENTREGADO: TFloatField;
    qMaterialContratoObraVALORREINTEGRADO: TFloatField;
    qActividadContratoObra1MATERIALEJECUTADO: TFloatField;
    qActividadContratoObra1TRANSPORTEEJECUTADO: TFloatField;
    qActividadContratoObra1EQUIPOEJECUTADO: TFloatField;
    qActividadContratoObra1MANOOBRAEJECUTADO: TFloatField;
    qMaterialContratoObra1VALORCONSUMIDO: TFloatField;
    qMaterialContratoObra1VALORENTREGADO: TFloatField;
    qMaterialContratoObra1VALORREINTEGRADO: TFloatField;
    qTipoContratoCODIGOTIPOCONTRATO: TStringField;
    qTipoContratoNOMBRETIPOCONTRATO: TStringField;
    qTipoContratoIVAADMINISTRACION: TStringField;
    qTipoContratoIVAIMPREVISTOS: TStringField;
    qTipoContratoIVAUTILIDAD: TStringField;
    qContratoMATERIALEJECUTADO: TFloatField;
    qContratoMANOOBRAEJECUTADO: TFloatField;
    qContratoEQUIPOEJECUTADO: TFloatField;
    qContratoTRANSPORTEEJECUTADO: TFloatField;
    qContratoVALORMATERIALSOLICITADO: TFloatField;
    qContratoVALORMATERIALENTREGADO: TFloatField;
    qContratoVALORMATERIALCONSUMIDO: TFloatField;
    qContratoVALORMATERIALREINTEGRADO: TFloatField;
    qActividadContratoObraCODIGOACTIVIDAD: TFloatField;
    qActividadContratoObra1CODIGOACTIVIDAD: TFloatField;
    qActividadCODIGOACTIVIDAD: TFloatField;
    procedure BitBtnAceptarClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure BBCartografiaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridMaterialEditButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGridMaterialDblClick(Sender: TObject);
    procedure ArbolChange(Sender: TObject; Node: TTreeNode);
    procedure sbBuscarCIGClick(Sender: TObject);
    procedure qActividadContratoObraCalcFields(DataSet: TDataSet);
    procedure qContratoCalcFields(DataSet: TDataSet);
    procedure qContratoAfterPost(DataSet: TDataSet);
    procedure qContratoAfterDelete(DataSet: TDataSet);
    procedure qActividadContratoObraAfterDelete(DataSet: TDataSet);
    procedure qActividadContratoObraAfterPost(DataSet: TDataSet);
    procedure qMaterialContratoObraAfterPost(DataSet: TDataSet);
    procedure qMaterialContratoObraAfterDelete(DataSet: TDataSet);
    procedure qActividadContratoObra1AfterDelete(DataSet: TDataSet);
    procedure qActividadContratoObra1AfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure qActividadContratoObraAfterCancel(DataSet: TDataSet);
    procedure qContratoAfterCancel(DataSet: TDataSet);
    procedure qMaterialContratoObraAfterCancel(DataSet: TDataSet);
    procedure qContratoObraAfterCancel(DataSet: TDataSet);
    procedure qContratoObraAfterDelete(DataSet: TDataSet);
    procedure qContratoObraAfterPost(DataSet: TDataSet);
    procedure qContratoObraCODIGOGEOGRAFICOValidate(Sender: TField);
    procedure qContratoObraAfterInsert(DataSet: TDataSet);
    procedure DBGridActividadDblClick(Sender: TObject);
    procedure DBGridActividadEditButtonClick(Sender: TObject);
    procedure qActividadContratoObraAfterInsert(DataSet: TDataSet);
    procedure qMaterialContratoObraAfterInsert(DataSet: TDataSet);
    procedure qActividadContratoObra1BeforePost(DataSet: TDataSet);
    procedure qMaterialContratoObraBeforePost(DataSet: TDataSet);
    procedure sbFechaInicioClick(Sender: TObject);
    procedure sbFechaFinClick(Sender: TObject);
    procedure qContratoObraCalcFields(DataSet: TDataSet);
    procedure qActividadContratoObraCODIGOTIPOPRESUPUESTOChange(
      Sender: TField);
    procedure qTipoPresupuestoActividadCalcFields(DataSet: TDataSet);
    procedure qContratoObraCODIGOGEOGRAFICOChange(Sender: TField);
    procedure qActividadContratoObraCANTIDADPRESUPUESTADAChange(
      Sender: TField);
    procedure qActividadContratoObraCANTIDADEJECUTADAChange(
      Sender: TField);
    procedure qActividadContratoObraVALORUNITARIOMATERIALChange(
      Sender: TField);
    procedure qActividadContratoObraVALORUNITARIOMANOOBRAChange(
      Sender: TField);
    procedure qActividadContratoObraVALORUNITARIOEQUIPOChange(
      Sender: TField);
    procedure qActividadContratoObraVALORUNITARIOTRANSPORTEChange(
      Sender: TField);
    procedure qActividadContratoObraBeforePost(DataSet: TDataSet);
    procedure qMaterialContratoObraCODIGOMATERIALChange(Sender: TField);
    procedure qContratoObraAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    sFecha,CodigoContrato,CodigoContratoObra,EsRetenedor,NombreContratista :String;
    ValorIndice,CodDivision,CodDepartamento,CodSecuencia,codAno : String;
    ManoObraTotal,MaterialTotal,EquipoTotal,TransporteTotal,IVA, AIU : Real;
    CodigoTipoPresupuesto : Integer;
    TotalIva:real;
    bCancelando,bDatosIncompletos,bFiltrado: boolean;
    procedure ActualizarMaterialDesdePresupuesto;
    procedure ActualizarValoresActividad;
    procedure ActualizarValoresObraDesdeActividad;
    procedure ActualizarValoresContrato;
    procedure ActualizarValoresObraDesdeMaterial;
    procedure ActualizarValoresMaterial;
    Function GetFecha: String;
    function FechaServidor:string;

  end;
var
  fContratoObra: TfContratoObra;

implementation

uses uFormaFecha, uBuscarActividad,
    uBuscarMaterialEnerGis, uFirmaPresupuesto, uInformacionContrato,
  uListaContratoDistribucion;

  //  uListaMantenimientos, uListaReportes;

{$R *.DFM}

Function TfContratoObra.GetFecha: String;
begin
  FFormaFecha := TFFormaFecha.Create(Application);//
  if FFormaFecha.ShowModal = mrOk then
  begin
   Result := DatetoStr(FFormaFecha.Date);
  end
  else
     Result := '';
  FFormaFecha.Free;//
end;

procedure TfContratoObra.ActualizarValoresObraDesdeActividad;
var
    TotalMaterial,TotalEquipo,TotalManoObra,TotalTransporte:Double;
    TotalMaterialLiq,TotalEquipoLiq,TotalManoObraLiq,TotalTransporteLiq:Double;
begin
  TotalMaterial:=0;
  TotalEquipo:=0;
  TotalManoObra:=0;
  TotalTransporte:=0;

  TotalMaterialLiq:=0;
  TotalEquipoLiq:=0;
  TotalManoObraLiq:=0;
  TotalTransporteLiq:=0;

  qActividadContratoObra1.close;
  qActividadContratoObra1.open;
  qActividadContratoObra1.First;
  while Not qActividadContratoObra1.Eof do
  begin
    TotalMaterial:=TotalMaterial+qActividadContratoObra1CANTIDADPRESUPUESTADA.AsFloat*qActividadContratoObra1VALORUNITARIOMATERIAL .AsFloat;
    TotalTransporte:=TotalTransporte+qActividadContratoObra1CANTIDADPRESUPUESTADA.AsFloat*qActividadContratoObra1VALORUNITARIOTRANSPORTE.AsFloat;
    TotalEquipo:=TotalEquipo+qActividadContratoObra1CANTIDADPRESUPUESTADA.AsFloat*qActividadContratoObra1VALORUNITARIOEQUIPO.AsFloat;
    TotalManoObra:=TotalManoObra+qActividadContratoObra1CANTIDADPRESUPUESTADA.AsFloat*qActividadContratoObra1VALORUNITARIOMANOOBRA.AsFloat;

    TotalMaterialLiq:=TotalMaterialLiq+qActividadContratoObra1CANTIDADEJECUTADA.AsFloat*qActividadContratoObra1VALORUNITARIOMATERIAL.AsFloat;
    TotalTransporteLiq:=TotalTransporteLiq+qActividadContratoObra1CANTIDADEJECUTADA.AsFloat*qActividadContratoObra1VALORUNITARIOTRANSPORTE.AsFloat;
    TotalEquipoLiq:=TotalEquipoLiq+qActividadContratoObra1CANTIDADEJECUTADA.AsFloat*qActividadContratoObra1VALORUNITARIOEQUIPO.AsFloat;
    TotalManoObraLiq:=TotalManoObraLiq+qActividadContratoObra1CANTIDADEJECUTADA.AsFloat*qActividadContratoObra1VALORUNITARIOMANOOBRA.AsFloat;

    qActividadContratoObra1.Next;
  end;
  qContratoObra.Edit;

  qContratoObraMATERIALPRESUPUESTADO.AsFloat:=TotalMaterial;
  qContratoObraEQUIPOPRESUPUESTADO.AsFloat:=TotalEquipo;
  qContratoObraMANOOBRAPRESUPUESTADO.AsFloat:=TotalManoObra;
  qContratoObraTRANSPORTEPRESUPUESTADO.AsFloat:=TotalTransporte;

  qContratoObraMATERIALEJECUTADO.AsFloat:=TotalMaterialLiq;
  qContratoObraEQUIPOEJECUTADO.AsFloat:=TotalEquipoLiq;
  qContratoObraMANOOBRAEJECUTADO.AsFloat:=TotalManoObraLiq;
  qContratoObraTRANSPORTEEJECUTADO.AsFloat:=TotalTransporteLiq;

  ActualizarValoresContrato;
end;


procedure TfContratoObra.ActualizarMaterialDesdePresupuesto;
begin
  qPptoMateriales.Close;
  qPptoMateriales.Open;
  qPptoMateriales.First;
  try
    While Not qPptoMateriales.Eof do
    begin
      if qMaterialContratoObra.Locate('CodigoContratoObra;CodigoMaterial;CodigoActividadContratoObra',
                                        VarArrayOf([
                                                    CodigoContrato,
                                                    qPptoMaterialesCodigoMaterial.AsString,
                                                    qPptoMaterialesCODIGOACTIVIDADContratoObra.AsString
                                                    ]),
                                                    [loCaseInsensitive])then
      begin
        qMaterialContratoObra.Edit;
        qMaterialContratoObraCANTIDADSOLICITADA.AsFloat := qPptoMaterialesSUMA.AsFloat;
        qMaterialContratoObra.Post;
      end
      else
      begin
        qMaterialContratoObra.Insert;
        qMaterialContratoObraCodigoMaterial.AsString := qPptoMaterialesCodigoMaterial.AsString;
        qMaterialContratoObraCANTIDADSOLICITADA.AsFloat := qPptoMaterialesSUMA.AsFloat;
        qMaterialContratoObra.Post;
      end;
      qPptoMateriales.Next;
    end;
  except
  end;
end;

procedure TfContratoObra.BitBtnAceptarClick(Sender: TObject);
begin
  inherited;
  bDatosIncompletos := False;
  bCancelando := False;
  try
    qContratoObra.Post;
    ActualizarValoresContrato;
    qContrato.Post;
    ModalResult:=MrOk;
    close;
 Except
    bDatosIncompletos := True;
    ModalResult:=MrCancel;
    Close;
 end;
end;

procedure TfContratoObra.BitBtnCancelarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Perderá los cambios realizados.Esta seguro de Cancelar?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
  begin
    qContrato.Cancel;
    qContratoObra.Cancel;
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

procedure TfContratoObra.BBCartografiaClick(Sender: TObject);
var ListaApoyo1,ListaApoyo2,Lista : TStringList;
 codigoobra:string;
 x:integer;
begin
  bDatosIncompletos := False;
  try
    qContratoObra.Post;
    qContratoObra.Edit;
  except
  end;
  //Ocultar Ventana  contrato
  self.BorderStyle := bsToolWindow;
//  self.FormStyle := fsStayOnTop;
  self.WindowState := wsMinimized;
  self.Visible := False;

  if CodigoObra='' then CodigoObra:= qContratoObra.FieldByName('CODIGOCONTRATOOBRA').AsString;
  FInformacionContrato := TFInformacionContrato.Create(Application);
  FInformacionContrato.Visible := False;
  FInformacionContrato.Caption :='Contrato # '+qContrato.FieldByName('NUMEROCONTRATO').AsString; //Cambio Octubre
  FInformacionContrato.Top := screen.Height - FInformacionContrato.height-15;
  FInformacionContrato.MUbicacion.text :=qContratoObraNombreGeografico.AsString;
  FInformacionContrato.Mobjeto.text := qContratoOBJETO.AsString;
  FInformacionContrato.Contrato := CodigoObra;
  FInformacionContrato.Show;



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
//  UbicarContrato(qContratoObraCODIGOCONTRATOOBRA.AsInteger,False);
// UbicarContrato(CODIGO CONTRATO ,SI QUIERE REALIZAR ZOOM O NO);
   qListaApoyo.Close;
   qListaApoyo.ParamByName('Codigo').AsInteger := StrToInt(CodigoObra);
   qListaApoyo.Open;
   qListaApoyo.First;
   if qListaApoyo.FieldByName('CodigoApoyo').AsString <> '' then
   begin
     ListaApoyo1 := TStringList.create;
     ListaApoyo2 := TStringList.create;
     x:=0;
     While not qListaApoyo.eof do
     begin
       if (qListaApoyo.FieldByName('CodigoApoyo').AsString <> '') then
       begin
         ListaApoyo1.Add(qListaApoyo.FieldByName('CodigoApoyo').AsString+','+inttostr(x)+',0');
          x:=x+20;
         ListaApoyo2.Add(qListaApoyo.FieldByName('CodigoApoyo').AsString)
       end;
       qListaApoyo.Next;
     end;
     MarcarApoyos(ListaApoyo2);
     MostrarVistaLateralApoyos(ListaApoyo1);
     ListaApoyo1.Free;
     ListaApoyo2.Free;
   end;
  Application.ProcessMessages;
end;

procedure TfContratoObra.FormClose(Sender: TObject; var Action: TCloseAction);
var i:integer;
    bm2:TBookmark;
begin
  Action:=caFree;
  if not bCancelando then
  begin
    if bDatosIncompletos then
    begin
      if Application.MessageBox(PChar('Hay datos incompletos.Desea completar los datos?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
      begin
        ModalResult := 0;
        bDatosIncompletos := false;
        Action:=caNone;
      end
      else
      begin
        qContrato.Cancel;
        qContrato.CancelUpdates;
        qContratoObra.Cancel;
        qContratoObra.CancelUpdates;
        if qContrato.Database.InTransaction then qContrato.Database.Rollback;
        Action:=caFree;
      end;
    end
    else
    begin
      if (ModalResult = mrOK) then
      begin
        if qContrato.Database.InTransaction then qContrato.Database.Commit;
        if Assigned(Application.FindComponent('fListaContratoDistribucion') as TForm) then
        begin
          bm2:=fListaContratoDistribucion.qContratoObra.GetBookmark;
          fListaContratoDistribucion.qContratoObra.Close;
          fListaContratoDistribucion.qContratoObra.Open;
          fListaContratoDistribucion.qContratoObra.GotoBookmark(bm2);
        end;
        Action:=caFree;
      end;
    end
  end
  else
  begin
    try
      qContrato.Cancel;
      qContrato.CancelUpdates;
      qContratoObra.Cancel;
      qContratoObra.CancelUpdates;
      if qContrato.Database.InTransaction then qContrato.Database.Rollback;
      Action:=caFree;
    except
    end;
  end;
  //Cierra todos los querys
  if (Action=CaFree) then
  begin
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


procedure TfContratoObra.DBGridMaterialEditButtonClick(Sender: TObject);
var i:Integer;
    Material:String;
begin
  fBuscarMaterialEnerGis := TfBuscarMaterialEnergis.Create(Application);
  if fBuscarMaterialEnerGis.ShowModal = mrOk then
  begin
    if fBuscarMaterialEnerGis.DBGridBuscarMaterial.SelectedRows.Count>0 then
    begin
      for i:=0 to fBuscarMaterialEnerGis.DBGridBuscarMaterial.SelectedRows.Count-1 do
      begin
        fBuscarMaterialEnerGis.qMaterial.BookMark:=fBuscarMaterialEnerGis.DBGridBuscarMaterial.SelectedRows.Items[i];
        try
          Material := fBuscarMaterialEnerGis.qMaterial.fieldbyName('CodigoMaterial').asstring;
          if qmaterialcontratoobra.State in [dsedit,dsinsert] then
          begin
            qmaterialcontratoobra.cancel;
          end;
          if qMaterialContratoObra.Locate('CodigoMaterial',Material,[]) then qMaterialContratoObra.Edit
          else qMaterialContratoObra.Insert;
          qMaterialContratoObraCodigoMaterial.asstring := Material;
          qMaterialContratoObraCANTIDADSOLICITADA.asfloat := qMaterialContratoObraCANTIDADSOLICITADA.asfloat+1;
          qMaterialContratoObra.Post;
        except
          on e:exception do
          begin
            showmessage(e.Message);
            qMaterialContratoObra.Cancel;
          end;
        end;
      end;
    end;
    fBuscarMaterialEnerGis.qMaterial.Active:=True;
    DBGridMaterial.SelectedIndex := 0;
  end;
  fBuscarMaterialEnerGis.Free;
end;

procedure TfContratoObra.FormActivate(Sender: TObject);
begin
  inherited;
  if CodigoContrato =''
  then CodigoContrato := qContratoCODIGOCONTRATO.AsString;
  Notebook.PageIndex:=0;
  CodigoTipoPresupuesto:=0;
  qActividadContratoObra.Close;
  qActividadContratoObra.Open;
  qMaterialContratoObra.Close;
  qMaterialContratoObra.Open;
end;

procedure TfContratoObra.DBGridMaterialDblClick(Sender: TObject);
begin
  dsMaterialContratoObra.DataSet.Edit;
end;

procedure TfContratoObra.ArbolChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  if Node.Text='Información' then
   Notebook.PageIndex:=0
  else if Node.Text='Ejecución' then
   Notebook.PageIndex:=1
  else if Node.Text='Presupuesto' then
   Notebook.PageIndex:=2
  else if Node.Text='Materiales' then
   Notebook.PageIndex:=3;
end;

procedure TfContratoObra.sbBuscarCIGClick(Sender: TObject);
var CIG:INTEGER;
begin
  CIG := CapturarCIG;
  if CIG<>0 then qContratoObraCODIGOGEOGRAFICO.AsInteger:=CIG;
end;


procedure TfContratoObra.qActividadContratoObraCalcFields(DataSet: TDataSet);
var qDescripcion:TQuery;
begin
  try
    qActividad.close;
    qActividad.open;
    qActividadContratoObraNombreTipoActividad.AsString:=qActividadNOMBRETIPOACTIVIDAD.AsString;
    qActividadContratoObraNombreEstructura.AsString:=qActividadNOMBREESTRUCTURA.AsString;    
    if qActividadContratoObraCODIGOACTIVIDAD.AsString<>'' then
    begin
      qDescripcion:=TQuery.Create(self);
      qDescripcion.DatabaseName:='BaseDato';
      qDescripcion.sql.add('SELECT tp.nombretipopresupuesto,ta.nombretipoactividad,e.nombreestructura,a.descripcion');
      qDescripcion.sql.add('FROM tipopresupuesto tp,actividad a,estructura e,tipoactividad ta,actividadcontratoobra ac');
      qDescripcion.sql.add('WHERE tp.CODIGOTIPOPRESUPUESTO=ac.codigotipopresupuesto');
      qDescripcion.sql.add('AND ac.codigoactividad=a.codigoactividad');
      qDescripcion.sql.add('AND a.codigotipoactividad=ta.codigotipoactividad');
      qDescripcion.sql.add('AND a.codigoestructura=e.codigoestructura');
      qDescripcion.sql.add('AND ac.codigoactividadcontratoobra='+qActividadContratoObraCODIGOACTIVIDADCONTRATOOBRA.AsString);
      qDescripcion.Open;
      if qDescripcion.Fieldbyname('descripcion').asstring<>'' then
      begin
        qActividadContratoObraNombreActividadContrato.AsString:= qDescripcion.Fields[0].asstring;
      end
      else
      begin
        qActividadContratoObraNombreActividadContrato.AsString:=
        qActividadContratoObraNombreTipoPresupuesto.AsString+' '+
        ' DE '+ qActividadContratoObraNombreEstructura.AsString;
      end;
      qDescripcion.Free;
    end;
  except
  end;
end;


procedure TfContratoObra.qContratoCalcFields(DataSet: TDataSet);
var
  IVA,AIU,Material,ManoObra,Equipo,Transporte,Utilidades,Administracion,Imprevistos,
  ValorTotal,Suma,SumaAIU,SumaIVA:Double;
  query:tquery;
begin
  query:=TQuery.Create(self);
  query.DatabaseName:='BaseDato';
  if (qContratoCODIGOGEOGRAFICO.AsString<>'') then
  begin
    query.sql.clear;
    query.sql.text:='SELECT NOMBREGEOGRAFICO,getmunicipio(codigogeografico) municipio,INDICEDIFICULTAD FROM GEOGRAFICO WHERE CODIGOGEOGRAFICO='+qContratoCODIGOGEOGRAFICO.AsString;
    query.open;
    qContratoNombreGeografico.AsString:=query.fields[0].AsString;
  end;
  if (qContratoCODIGOINTERVENTOR.AsString<>'') then
  begin
    query.sql.clear;
    query.sql.text:='SELECT NOMBREEMPLEADO FROM EMPLEADO WHERE CODIGOEMPLEADO='+qContratoCODIGOINTERVENTOR.AsString;
    query.open;
    qContratoNombreInterventor.AsString:=query.fields[0].AsString;
  end;
  if (qContratoCODIGOCONTRATISTA.AsString<>'') then
  begin
    query.sql.clear;
    query.sql.text:='SELECT NOMBRECONTRATISTA,REPRESENTANTE FROM CONTRATISTA WHERE CODIGOCONTRATISTA='''+qContratoCODIGOCONTRATISTA.AsString+'''';
    query.open;
    qContratoNombreContratista.AsString:=query.fields[0].AsString;
    qContratoREPRESENTANTECONTRATISTA.AsString:=query.fields[1].AsString;
  end;
  query.free;
end;


procedure TfContratoObra.qContratoAfterPost(DataSet: TDataSet);
begin
  inherited;
  qContrato.ApplyUpdates;
  qContrato.CommitUpdates;
end;

procedure TfContratoObra.qContratoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qContrato.ApplyUpdates;
  qContrato.CommitUpdates;
end;

procedure TfContratoObra.qActividadContratoObraAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qActividadContratoObra.ApplyUpdates;
  qActividadContratoObra.CommitUpdates;
end;

procedure TfContratoObra.qActividadContratoObraAfterPost(DataSet: TDataSet);
var query:TQuery;
begin
  inherited;
  qActividadContratoObra.ApplyUpdates;
  qActividadContratoObra.CommitUpdates;
  if (qTipoPresupuestoMATERIAL.AsString<>'S')then
  begin
    query:=TQuery.Create(self);
    query.DatabaseName:='Basedato';
    query.sql.add('SELECT count(*)');
    query.sql.add('  FROM materialcontratoobra');
    query.sql.add(' WHERE codigoactividadcontratoobra='+qActividadContratoObraCODIGOACTIVIDADCONTRATOOBRA.asstring);
    query.open;
    if (query.fields[0].AsInteger=0) then
    begin
      if MessageDlg('Desea cargar los materiales de esta actividad?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
      begin
        query.sql.clear;
        query.sql.add('select e.codigomaterial, e.cantidad from actividad a,detalleestructura e');
        query.sql.add('where a.codigoestructura=e.codigoestructura');
        query.sql.add('and a.codigoactividad='+qActividadContratoObraCODIGOACTIVIDAD.AsString);
        query.open;
        while not(query.eof) do
        begin
          qMaterialContratoObra.Insert;
          qMaterialContratoObraCODIGOMATERIAL.Asfloat:=query.fieldbyname('codigomaterial').AsFloat;
          qMaterialContratoObraCANTIDADSOLICITADA.AsFloat:=query.fieldbyname('cantidad').AsFloat*qActividadContratoObraCANTIDADPRESUPUESTADA.AsFloat;
          qMaterialContratoObraCODIGOACTIVIDADCONTRATOOBRA.AsFloat:=qActividadContratoObraCODIGOACTIVIDADCONTRATOOBRA.AsFloat;
          qMaterialContratoObra.Post;
          query.next;
        end;
      end;
      query.free;
    end;
  end;
  ActualizarValoresObraDesdeActividad;
end;

procedure TfContratoObra.qMaterialContratoObraAfterPost(DataSet: TDataSet);
begin
  qMaterialContratoObra.ApplyUpdates;
  qMaterialContratoObra.CommitUpdates;
  ActualizarValoresObraDesdeMaterial;
end;

procedure TfContratoObra.qMaterialContratoObraAfterDelete(DataSet: TDataSet);
begin
  qMaterialContratoObra.ApplyUpdates;
  qMaterialContratoObra.CommitUpdates;
end;

procedure TfContratoObra.qActividadContratoObra1AfterDelete(DataSet: TDataSet);
begin
  qActividadContratoObra1.ApplyUpdates;
  qActividadContratoObra1.CommitUpdates;
end;

procedure TfContratoObra.qActividadContratoObra1AfterPost(DataSet: TDataSet);
begin
  qActividadContratoObra1.ApplyUpdates;
  qActividadContratoObra1.CommitUpdates;
end;

procedure TfContratoObra.FormCreate(Sender: TObject);
begin
  qEstadoContrato.Open;
  qTipoContrato.Open;
  qDivision.Open;
  qDepartamento.Open;
  qGeografico.Open;
  qEmpresa.Open;
  qContrato.Open;
  qActividadContratoObra.Open;
  qMaterialContratoObra.Open;
end;



function TfContratoObra.FechaServidor: string;
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

procedure TfContratoObra.qActividadContratoObraAfterCancel(DataSet: TDataSet);
begin
  inherited;
  qActividadContratoObra.CancelUpdates;
end;

procedure TfContratoObra.qContratoAfterCancel(DataSet: TDataSet);
begin
  inherited;
  qContrato.CancelUpdates;
end;

procedure TfContratoObra.qMaterialContratoObraAfterCancel(DataSet: TDataSet);
begin
  inherited;
  qMaterialContratoObra.CancelUpdates;
end;

procedure TfContratoObra.qContratoObraAfterCancel(DataSet: TDataSet);
begin
  inherited;
  qContratoObra.CancelUpdates;
end;

procedure TfContratoObra.qContratoObraAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qContratoObra.ApplyUpdates;
  qContratoObra.CommitUpdates;
end;

procedure TfContratoObra.qContratoObraAfterPost(DataSet: TDataSet);
begin
  inherited;
  qContratoObra.ApplyUpdates;
  qContratoObra.CommitUpdates;
end;

procedure TfContratoObra.qContratoObraCODIGOGEOGRAFICOValidate(
  Sender: TField);
var qDatos:tquery;
  codigoarbol1,codigoarbol2:string;
  nombre1,nombre2:string;
begin
  if (sender.AsString<>'') then
  begin
    qDatos:=TQuery.Create(self);
    if (qContratoCODIGOGEOGRAFICO.AsString<>'') then
    begin
      qDatos.DatabaseName:='BaseDato';
      qDatos.sql.add('SELECT NOMBRECATEGORIA,CODIGOARBOL FROM GEOGRAFICO');
      qDatos.sql.add('WHERE CODIGOGEOGRAFICO='+qContratoCODIGOGEOGRAFICO.AsString);
      qDatos.open;
      nombre1:=qDatos.Fieldbyname('NOMBRECATEGORIA').AsString;
      codigoarbol1:=qDatos.Fieldbyname('CODIGOARBOL').AsString;
      qDatos.close;
      
      qDatos.sql.clear;
      qDatos.sql.add('SELECT CODIGOARBOL FROM GEOGRAFICO');
      qDatos.sql.add('WHERE CODIGOGEOGRAFICO='+Sender.AsString);
      qDatos.open;

      codigoarbol2:=qDatos.Fieldbyname('CODIGOARBOL').AsString;
      codigoarbol2:=copy(codigoarbol2,1,length(codigoarbol1));
      qDatos.sql.clear;
      qDatos.sql.add('SELECT NOMBRECATEGORIA FROM GEOGRAFICO');
      qDatos.sql.add('WHERE CODIGOARBOL='''+codigoarbol2+'''');
      qDatos.open;
      nombre2:=qDatos.Fieldbyname('NOMBRECATEGORIA').AsString;

      if (UpperCase(nombre1)<>UpperCase(nombre2)) then
       raise Exception.Create('La ubicación de la obra debe estar dentro de '+ qContratoNombreGeografico.AsString);
    end
    else
      raise Exception.Create('Debe ingresar primero el código CIG del Contrato');
    qDatos.free;
  end;
end;

procedure TfContratoObra.qContratoObraAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qContratoObraCODIGOCONTRATO.AsString:=qContratoCODIGOCONTRATO.AsString;
end;

procedure TfContratoObra.DBGridActividadDblClick(Sender: TObject);
begin
  inherited;
   qActividadContratoObra.Edit;
end;

procedure TfContratoObra.DBGridActividadEditButtonClick(
  Sender: TObject);
var i:Integer;
begin
  fBuscarActividad := TfBuscarActividad.Create(Application);
  try
    if fBuscarActividad.ShowModal = mrOk then
    begin
      if fBuscarActividad.DBGridActividad.SelectedRows.Count>0  then
      begin
        for i:=0 to fBuscarActividad.DBGridActividad.SelectedRows.Count-1 do
        begin
          fBuscarActividad.qActividad.BookMark:=fBuscarActividad.DBGridActividad.SelectedRows.Items[i];
          try
           if fBuscarActividad.qActividadCODIGOACTIVIDAD.asstring<>'' then
           begin
             if qActividadContratoObra.state=dsInsert then qActividadContratoObra.Cancel;
             qActividadContratoObra.Insert;
             qActividadContratoObra.fieldbyName('CODIGOACTIVIDAD').asstring := fBuscarActividad.qActividadCODIGOACTIVIDAD.asstring;
             qActividadContratoObra.fieldbyName('CANTIDADPRESUPUESTADA').asfloat := 1;
             qActividadContratoObra.fieldbyName('CodigoTipoPRESUPUESTO').AsInteger :=CodigoTipoPresupuesto;
             qActividadContratoObra.Post;
           end;
          except
             on e:exception do
             begin
               showmessage(e.message);
               qActividadContratoObra.Cancel;
             end;
          end;
        end;
        qContratoObra.Edit;
      end;
      DBGridActividad.SelectedIndex := 0;
    end;
  finally
    fBuscarActividad.Free;
  end;
end;

procedure TfContratoObra.qActividadContratoObraAfterInsert(
  DataSet: TDataSet);
var query:tquery;
codigo:integer;
begin
  query:=TQuery.create(self);
  query.databasename:='BaseDato';
  query.sql.text:='SELECT MAX(CODIGOACTIVIDADCONTRATOOBRA) FROM ACTIVIDADCONTRATOOBRA';
  query.open;
  codigo:=1;
  if query.fields[0].AsString<>'' then codigo:=query.fields[0].asinteger+1;
  qActividadContratoObraCODIGOACTIVIDADCONTRATOOBRA.asinteger :=codigo ;
  qActividadContratoObraCODIGOcontrato.asstring := qContratoCODIGOCONTRATO.AsString;
  qActividadContratoObraCODIGOCONTRATOOBRA.asstring := qContratoObraCODIGOCONTRATOOBRA.AsString;
  query.free;
end;

procedure TfContratoObra.ActualizarValoresObraDesdeMaterial;
var totalpres,totalCon,totalEnt,totalRe:double;
begin
  qMaterialContratoObra1.close;
  qMaterialContratoObra1.open;
  qMaterialContratoObra1.First;
  Totalpres := 0;
  totalCon := 0;
  totalEnt := 0;
  totalRe := 0;    
  while Not qMaterialContratoObra1.Eof do
  begin
    Totalpres:=Totalpres+(qMaterialContratoObra1CANTIDADSOLICITADA.AsFloat*qMaterialContratoObra1VALORUNITARIO.AsFloat);
    totalEnt:=totalEnt+(qMaterialContratoObra1CANTIDADENTREGADA.AsFloat*qMaterialContratoObra1VALORUNITARIO.AsFloat);
    totalCon:=totalCon+(qMaterialContratoObra1CANTIDADCONSUMIDA.AsFloat*qMaterialContratoObra1VALORUNITARIO.AsFloat);
    totalRe:=totalRe+(qMaterialContratoObra1CANTIDADREINTEGRADABUENA.AsFloat*qMaterialContratoObra1VALORUNITARIO.AsFloat);
    qMaterialContratoObra1.Next;
  end;
  qContratoObraVALORMATERIALSOLICITADO.AsFloat:=TotalPres;
  qContratoObraVALORMATERIALENTREGADO.AsFloat:=totalEnt;
  qContratoObraVALORMATERIALCONSUMIDO.AsFloat:=totalCon;
  qContratoObraVALORMATERIALREINTEGRADO.AsFloat:=totalRe;  
  qMaterialContratoObra.close;
  qMaterialContratoObra.open;
  ActualizarValoresContrato;    
end;

procedure TfContratoObra.ActualizarValoresContrato;
var
   TotalMaterial,TotalEquipo,TotalManoObra,TotalTransporte:Double;
   TotalMaterialEj,TotalEquipoEj,TotalManoObraEj,TotalTransporteEj:Double;
   TotalMaterialSol,TotalMaterialEnt,TotalMaterialCon,TotalMaterialRe:Double;
   query:tquery;
begin
  TotalMaterial:=0;
  TotalEquipo:=0;
  TotalManoObra:=0;
  TotalTransporte:=0;

  TotalMaterialEj:=0;
  TotalEquipoEj:=0;
  TotalManoObraEj:=0;
  TotalTransporteEj:=0;

  TotalMaterialSol:=0;
  TotalMaterialEnt:=0;
  TotalMaterialCon:=0;
  TotalMaterialRe:=0;

  query:=TQuery.create(self);
  query.DatabaseName:='BaseDato';
  query.sql.Add('SELECT CODIGOCONTRATOOBRA,MATERIALPRESUPUESTADO,TRANSPORTEPRESUPUESTADO,EQUIPOPRESUPUESTADO,MANOOBRAPRESUPUESTADO, ');
  query.sql.Add('MATERIALEJECUTADO,TRANSPORTEEJECUTADO,EQUIPOEJECUTADO,MANOOBRAEJECUTADO, ');
  query.sql.Add('VALORMATERIALSOLICITADO, VALORMATERIALENTREGADO, VALORMATERIALCONSUMIDO, VALORMATERIALREINTEGRADO');
  query.sql.Add('FROM CONTRATOOBRA WHERE CODIGOCONTRATO='+qContratoCODIGOCONTRATO.asstring);
  query.open;
  while Not query.Eof do
  begin
    TotalMaterial:=TotalMaterial+ query.fieldbyname('MATERIALPRESUPUESTADO').AsFloat;
    TotalTransporte:=TotalTransporte+query.fieldbyname('TRANSPORTEPRESUPUESTADO').AsFloat;
    TotalEquipo:=TotalEquipo+query.fieldbyname('EQUIPOPRESUPUESTADO').AsFloat;
    TotalManoObra:=TotalManoObra+query.fieldbyname('MANOOBRAPRESUPUESTADO').AsFloat;

    TotalMaterialEj:=TotalMaterialEj+ query.fieldbyname('MATERIALEJECUTADO').AsFloat;
    TotalTransporteEj:=TotalTransporteEj+query.fieldbyname('TRANSPORTEEJECUTADO').AsFloat;
    TotalEquipoEj:=TotalEquipoEj+query.fieldbyname('EQUIPOEJECUTADO').AsFloat;
    TotalManoObraEj:=TotalManoObraEj+query.fieldbyname('MANOOBRAEJECUTADO').AsFloat;

    TotalMaterialSol:=TotalMaterialSol+ query.fieldbyname('VALORMATERIALSOLICITADO').AsFloat;
    TotalMaterialEnt:=TotalMaterialEnt+query.fieldbyname('VALORMATERIALENTREGADO').AsFloat;
    TotalMaterialCon:=TotalMaterialCon+query.fieldbyname('VALORMATERIALCONSUMIDO').AsFloat;
    TotalMaterialRe:=TotalMaterialRe+query.fieldbyname('VALORMATERIALREINTEGRADO').AsFloat;

    query.Next;
  end;
  if not (qContrato.state in [dsEdit,dsInsert]) then
    qContrato.Edit;
//Actividades Presupuestadas
  qContratoMATERIALPRESUPUESTADO.AsFloat:=TotalMaterial;
  qContratoEQUIPOPRESUPUESTADO.AsFloat:=TotalEquipo;
  qContratoMANOOBRAPRESUPUESTADO.AsFloat:=TotalManoObra;
  qContratoTRANSPORTEPRESUPUESTADO.AsFloat:=TotalTransporte;
//Actividades Ejecutadas
  qContratoMATERIALEJECUTADO.AsFloat:=TotalMaterialEj;
  qContratoEQUIPOPRESUPUESTADO.AsFloat:=TotalEquipoEj;
  qContratoMANOOBRAEJECUTADO.AsFloat:=TotalManoObraEj;
  qContratoTRANSPORTEEJECUTADO.AsFloat:=TotalTransporteEj;
//Materiales
  qContratoVALORMATERIALSOLICITADO.AsFloat:=TotalMaterialSol;
  qContratoVALORMATERIALENTREGADO.AsFloat:=TotalMaterialEnt;
  qContratoVALORMATERIALCONSUMIDO.AsFloat:=TotalMaterialCon;
  qContratoVALORMATERIALREINTEGRADO.AsFloat:=TotalMaterialRe;

  qContrato.Post;
  qContrato.Edit;
  query.free;
end;

procedure TfContratoObra.qMaterialContratoObraAfterInsert(
  DataSet: TDataSet);
var query:tquery;
codigo:integer;
begin
  query:=TQuery.create(self);
  query.databasename:='BaseDato';
  query.sql.text:='SELECT MAX(CODIGOMATERIALCONTRATOOBRA) FROM MATERIALCONTRATOOBRA';
  query.open;
  codigo:=1;
  if query.fields[0].AsString<>'' then codigo:=query.fields[0].asinteger+1;
  qMaterialContratoObraCODIGOMATERIALCONTRATOOBRA.AsInteger:=Codigo;
  query.free;
  qMaterialContratoObraCODIGOCONTRATOOBRA.asstring := qContratoObraCODIGOCONTRATOOBRA.AsString;
  qMaterialContratoObraCODIGOCONTRATO.AsString := qContratoObraCODIGOCONTRATO.AsString;
end;

procedure TfContratoObra.qActividadContratoObra1BeforePost(
  DataSet: TDataSet);
begin
  if qActividadContratoObraCODIGOACTIVIDAD.AsString='' then
    DataSet.cancel;
end;

procedure TfContratoObra.qMaterialContratoObraBeforePost(
  DataSet: TDataSet);
begin
  if qMaterialCODIGOMATERIAL.AsString<>'' then
  begin
    qMaterial.close;
    qMaterial.ParamByName('CodigoMaterial').AsString:=qMaterialContratoObraCODIGOMATERIAL.AsString;
    qMaterial.open;
    qMaterialContratoObraVALORUNITARIO.AsFloat:=qMaterialVALORUNITARIO.AsFloat;
  end;
  ActualizarValoresMaterial;  
end;

procedure TfContratoObra.ActualizarValoresMaterial;
begin
  qMaterialContratoObraVALORPRESUPUESTADO.AsFloat:=qMaterialContratoObraVALORUNITARIO.AsFloat*
    qMaterialContratoObraCANTIDADSOLICITADA.AsFloat;
  qMaterialContratoObraVALORENTREGADO.AsFloat:=qMaterialContratoObraVALORUNITARIO.AsFloat*
    qMaterialContratoObraCANTIDADENTREGADA.AsFloat;
  qMaterialContratoObraVALORCONSUMIDO.AsFloat:=qMaterialContratoObraVALORUNITARIO.AsFloat*
    qMaterialContratoObraCANTIDADCONSUMIDA.AsFloat;
  qMaterialContratoObraVALORREINTEGRADO.AsFloat:=qMaterialContratoObraVALORUNITARIO.AsFloat*
    qMaterialContratoObraCANTIDADREINTEGRADABUENA.AsFloat;
end;

procedure TfContratoObra.sbFechaInicioClick(Sender: TObject);
begin
  inherited;
  DBEditFechaInicioObra.Setfocus;
  sFecha := DBEditFechaInicioObra.Text;
  qContratoObraFECHAINICIO.asstring := GetFecha;
end;

procedure TfContratoObra.sbFechaFinClick(Sender: TObject);
begin
  inherited;
  DBEditFechaFinObra.Setfocus;
  sFecha := DBEditFechaFinObra.Text;
  qContratoObraFECHAFIN.asstring := GetFecha;
end;

procedure TfContratoObra.qContratoObraCalcFields(DataSet: TDataSet);
var
  IVA,AIU,Material,ManoObra,Equipo,Transporte,Utilidades,Administracion,Imprevistos,
  ValorTotal,Suma,SumaAIU,SumaIVA:Double;
  query:tquery;
begin
  AIU := qContrato.FieldByName('AIU').AsFloat/100;
  IVA := qContrato.FieldByName('IVA').AsFloat/100;
  Material := qContratoObraMATERIALEJECUTADO.AsFloat;
  ManoObra := qContratoObraMANOOBRAEJECUTADO.ASFloat;
  Transporte := qContratoObraTRANSPORTEEJECUTADO.AsFloat;
  Equipo := qContratoObraEQUIPOEJECUTADO.AsFloat;
  Utilidades := qContratoUTILIDADES.AsFloat/100;
  Administracion := qContratoADMINISTRACION.AsFloat/100;
  Imprevistos := qContratoIMPREVISTOS.AsFloat/100;
  Suma:= Material+ManoObra+ Transporte+ Equipo ;
  SumaAIU := Suma*AIU;
  SumaIVA:=0;
  if qTipoContratoIVAUTILIDAD.AsString='S' then
  SumaIVA := (Suma*Utilidades)*IVA;
  if qTipoContratoIVAADMINISTRACION.AsString='S' then
  SumaIVA := SumaIVA+(Suma*Administracion)*IVA;
  if qTipoContratoIVAIMPREVISTOS.AsString='S' then
  SumaIVA := SumaIVA+(Suma*Imprevistos)*IVA;
  ValorTotal := Suma +SumaAIU+SumaIVA;
  qContratoObraValorIVA.AsFloat := SumaIVA;
  qContratoObraValorAIU.AsFloat := SumaAIU;
  qContratoObraCOSTODIRECTOSINAIU.AsFloat := SUMA;
  qContratoObraCOSTODIRECTO.AsFloat := SUMA+SUMAAIU;
  qContratoObraCOSTOTOTAL.AsFloat:= ValorTotal;
  qContratoObraValorMaterial.AsFloat:= Material*(1+AIU);
  qContratoObraValorManoObra.AsFloat:= MANOOBRA*(1+AIU);
  qContratoObraValorEquipo.AsFloat:= EQUIPO*(1+AIU);
  qContratoObraValorTransporte.AsFloat:= TRANSPORTE*(1+AIU);
  query:=TQuery.Create(self);
  query.DatabaseName:='BaseDato';

  if (qContratoObraCODIGOGEOGRAFICO.AsString<>'') then
  begin
    query.sql.clear;
    query.sql.text:='SELECT NOMBREGEOGRAFICO,getmunicipio(codigogeografico) municipio,INDICEDIFICULTAD FROM GEOGRAFICO WHERE CODIGOGEOGRAFICO='+qContratoObraCODIGOGEOGRAFICO.AsString;
    query.open;
    qContratoObraNombreGeografico.AsString:=query.fields[0].AsString;
    qContratoObraNombreMunicipio.AsString:=query.fields[1].AsString;
    qContratoObraIndiceDificultad.AsString:=query.fields[2].AsString;
  end;
  query.free;
end;

procedure TfContratoObra.qActividadContratoObraCODIGOTIPOPRESUPUESTOChange(
  Sender: TField);
Var ManoObra,Material,Equipo,Transporte:Real;
   qValorActividad:tquery;
begin
  qTipoPresupuestoActividad.close;
  qTipoPresupuestoActividad.open;
  qValorActividad:=tquery.create(self);
  qvaloractividad.DatabaseName:='BaseDato';
  if (qActividadContratoObraCODIGOACTIVIDAD.AsString<>'') then
  begin
    qValorActividad.sql.text:='SELECT MANOOBRA,MATERIAL,EQUIPO,TRANSPORTE FROM ACTIVIDAD WHERE CODIGOACTIVIDAD='+qActividadContratoObraCODIGOACTIVIDAD.AsString;
    qValorActividad.open;
    if (qValorActividad.RecordCount>0) then
    begin
      ManoObra := qValorActividad.fieldbyname('MANOOBRA').asfloat   * qTipoPresupuestoActividadFactorManoObra.AsFloat;
      Material := qValorActividad.fieldbyname('MATERIAL').asfloat   * qTipoPresupuestoActividadFactorMaterial.AsFloat;
      Equipo :=  qValorActividad.fieldbyname('Equipo').asfloat     * qTipoPresupuestoActividadFactorEquipo.AsFloat;
      Transporte := qValorActividad.fieldbyname('Transporte').asfloat * qTipoPresupuestoActividadFactorTransporte.AsFloat;

      qActividadContratoObraVALORUNITARIOMATERIAL.asfloat := MATERIAL;
      qActividadContratoObraVALORUNITARIOTRANSPORTE.asfloat := TRANSPORTE*qContratoObraIndiceDificultad.AsFloat;
      qActividadContratoObraVALORUNITARIOEQUIPO.asfloat := EQUIPO*qContratoObraIndiceDificultad.AsFloat;
      qActividadContratoObraVALORUNITARIOMANOOBRA.asfloat := MANOOBRA*qContratoObraIndiceDificultad.AsFloat;
    end;
  end;
  if (qTipoPresupuestoMATERIAL.AsString='S') then
  begin
    qValorActividad.sql.clear;
    qValorActividad.sql.add('DELETE FROM materialcontratoobra');
    qValorActividad.sql.add('      WHERE codigoactividadcontratoobra = '+qActividadContratoObraCODIGOACTIVIDADCONTRATOOBRA.AsString);
    qValorActividad.ExecSQL;
  end;
  qValorActividad.free;
end;

procedure TfContratoObra.qTipoPresupuestoActividadCalcFields(
  DataSet: TDataSet);
begin
  if qTipoPresupuestoActividadMANOOBRA.AsString='S' then qTipoPresupuestoActividadFactorManoObra.Asinteger:=1
  else qTipoPresupuestoActividadFactorManoObra.Asinteger:=0;
  if qTipoPresupuestoActividadMATERIAL.AsString='S' then qTipoPresupuestoActividadFactorMaterial.Asinteger:=1
  else qTipoPresupuestoActividadFactorMaterial.Asinteger:=0;
  if qTipoPresupuestoActividadEQUIPO.AsString='S' then qTipoPresupuestoActividadFactorEquipo.Asinteger:=1
  else qTipoPresupuestoActividadFactorEquipo.Asinteger:=0;
  if qTipoPresupuestoActividadTRANSPORTE.AsString='S' then qTipoPresupuestoActividadFactorTransporte.Asinteger:=1
  else qTipoPresupuestoActividadFactorTransporte.Asinteger:=0;
end;

procedure TfContratoObra.qContratoObraCODIGOGEOGRAFICOChange(
  Sender: TField);
begin
  inherited;
  qGeografico.close;
  qGeografico.open;
end;

procedure TfContratoObra.ActualizarValoresActividad;
begin
  qActividadContratoObraMATERIALPRESUPUESTADO.AsFloat:=qActividadContratoObraCANTIDADPRESUPUESTADA.AsFloat*qActividadContratoObraVALORUNITARIOMATERIAL .AsFloat;
  qActividadContratoObraTRANSPORTEPRESUPUESTADO.AsFloat:=qActividadContratoObraCANTIDADPRESUPUESTADA.AsFloat*qActividadContratoObraVALORUNITARIOTRANSPORTE.AsFloat;
  qActividadContratoObraEQUIPOPRESUPUESTADO.AsFloat:=qActividadContratoObraCANTIDADPRESUPUESTADA.AsFloat*qActividadContratoObraVALORUNITARIOEQUIPO.AsFloat;
  qActividadContratoObraMANOOBRAPRESUPUESTADO.AsFloat:=qActividadContratoObraCANTIDADPRESUPUESTADA.AsFloat*qActividadContratoObraVALORUNITARIOMANOOBRA.AsFloat;

  qActividadContratoObraMATERIALEJECUTADO.AsFloat:=qActividadContratoObraCANTIDADEJECUTADA.AsFloat*qActividadContratoObraVALORUNITARIOMATERIAL.AsFloat;
  qActividadContratoObraTRANSPORTEEJECUTADO.AsFloat:=qActividadContratoObraCANTIDADEJECUTADA.AsFloat*qActividadContratoObraVALORUNITARIOTRANSPORTE.AsFloat;
  qActividadContratoObraEQUIPOEJECUTADO.AsFloat:=qActividadContratoObraCANTIDADEJECUTADA.AsFloat*qActividadContratoObraVALORUNITARIOEQUIPO.AsFloat;
  qActividadContratoObraMANOOBRAEJECUTADO.AsFloat:=qActividadContratoObraCANTIDADEJECUTADA.AsFloat*qActividadContratoObraVALORUNITARIOMANOOBRA.AsFloat;
end;

procedure TfContratoObra.qActividadContratoObraCANTIDADPRESUPUESTADAChange(
  Sender: TField);
begin
  ActualizarValoresActividad;
end;

procedure TfContratoObra.qActividadContratoObraCANTIDADEJECUTADAChange(
  Sender: TField);
begin
  ActualizarValoresActividad;
end;

procedure TfContratoObra.qActividadContratoObraVALORUNITARIOMATERIALChange(
  Sender: TField);
begin
  inherited;
  ActualizarValoresActividad;
end;

procedure TfContratoObra.qActividadContratoObraVALORUNITARIOMANOOBRAChange(
  Sender: TField);
begin
  inherited;
  ActualizarValoresActividad;
end;

procedure TfContratoObra.qActividadContratoObraVALORUNITARIOEQUIPOChange(
  Sender: TField);
begin
  inherited;
  ActualizarValoresActividad;
end;

procedure TfContratoObra.qActividadContratoObraVALORUNITARIOTRANSPORTEChange(
  Sender: TField);
begin
  inherited;
  ActualizarValoresActividad;
end;

procedure TfContratoObra.qActividadContratoObraBeforePost(
  DataSet: TDataSet);
begin
  ActualizarValoresActividad;
end;

procedure TfContratoObra.qMaterialContratoObraCODIGOMATERIALChange(
  Sender: TField);
begin
  if sender.asstring<>'' then
  begin
    qMaterial.close;
    qMaterial.ParamByName('CodigoMaterial').AsString:=sender.asstring;
    qMaterial.open;
    qMaterialContratoObraVALORUNITARIO.AsFloat:=qMaterialVALORUNITARIO.AsFloat;
  end;
end;

procedure TfContratoObra.qContratoObraAfterOpen(DataSet: TDataSet);
begin
  qMaterialContratoObra.Open;
  qActividadContratoObra.Open;
end;

end.

 