unit uLiquidarExtrasRecargos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, StdCtrls, Mask, DBCtrls, DBTables, Digisoft,UBase,
  ToolEdit, RXDBCtrl, Spin, Buttons, Menus, ComCtrls, Grids, DBGrids,math,
  utMenuArbol,interexcel;

const NombreConceptos:array [0..15] of string=
      ('StDiurnoOrdinario'      ,'StNocturnoOrdinario'       ,'StDiurnoDomingoFestivo',
       'StDiurnoDomingoFestivo2','StNocturnoDomingoFestivo'  ,'SrNocturnoOrdinario',
       'SrDiurnoDomingo'        ,'SrNocturnoDomingo'         ,'SrDiurnoFestivo',
       'SrNocturnoFestivo'      , 'StDiurnoOrdinarioConv',
       'StNocturnoOrdinarioConv','StDiurnoDomingoFestivoConv','StNocturnoDomingoFestivoConv',
       'DisponibilidadSabado'   ,'DisponibilidadDomingoFestivo');

//      CodigoConceptos:array [0..14] of integer=(200,205,210,215,220,280,230,235,260,265,270,240,245,250,255);

type
  OpGeneracionPlanilla=(GenerarTurnosSinProgramacion,GenerarTurnosConProgramacion,GenerarHorarioUnico);
  PHorasTurnoDetalle = ^THorasTurnoDetalle;
  THorasTurnoDetalle = record
    Fecha,HoraDesde,HoraHasta:TDateTime;
    CantidadDiurna,CantidadNocturna:integer;
  end;
  TDesdeHasta= record
    HoraDesde:TDateTime;
    HoraHasta:TDateTime;
  end;
  PHorasDia = ^THorasDia;
  THorasDia = record
    TipoTurno,Turno,CantidadDiurna,CantidadNocturna:integer;
    DesdeHasta:TList;
    DesdeConvecional,HastaConvencional:TDateTime;
    CantidadExtraDiurna,CantidadExtraNocturna:integer;
    CantidadExtraDiurnaConv,CantidadExtraNocturnaConv:integer;
    CantidadExtraDisponibilidad:integer;
    DesdeHastaDiurno,DesdeHastaNocturno:String;
    DesdeHastaExtraDiurno,DesdeHastaExtraNocturno:String;
    Observacion,ObservacionExtra:String;
  end;
  THorasExtra = record
    CantidadDiurna,CantidadNocturna:integer;
    DesdeHastaDiurno,DesdeHastaNocturno:String;
  end;
  TConceptosExtras=class
  public
    Cantidades:array [0..16] of integer;
    CantidadesDias:array [0..16] of array [1..31] of integer;
    constructor create;
    procedure SumarCantidades;
  end;

  TFLiquidarExtrasRecargos = class(TFBase)
    dsMemFiltro: TDataSource;
    qEmpleado: TQuery;
    qEmpleadoCODIGOEMPLEADO: TFloatField;
    qEmpleadoNOMBREEMPLEADO: TStringField;
    dsEmpleado: TDataSource;
    qCIA: TQuery;
    qCIACODIGOADMINISTRATIVO: TFloatField;
    qCIANOMBRECATEGORIA: TStringField;
    dsCIA: TDataSource;
    pmVer: TPopupMenu;
    VerProgramacinTurnos1: TMenuItem;
    pmMeses: TPopupMenu;
    Enero1: TMenuItem;
    Febrero1: TMenuItem;
    Marzo1: TMenuItem;
    Abril1: TMenuItem;
    Mayo1: TMenuItem;
    Junio1: TMenuItem;
    Julio1: TMenuItem;
    Agosto1: TMenuItem;
    Septiembre1: TMenuItem;
    Octubre1: TMenuItem;
    Noviembre1: TMenuItem;
    Diciembre1: TMenuItem;
    qCalendarioProgramacion: TQuery;
    qCalendarioProgramacionCODIGOEMPLEADO: TFloatField;
    qCalendarioProgramacionCODIGOPROGRAMACION: TFloatField;
    qCalendarioProgramacionFECHA: TDateTimeField;
    qCalendarioProgramacionD1: TFloatField;
    qCalendarioProgramacionD2: TFloatField;
    qCalendarioProgramacionD3: TFloatField;
    qCalendarioProgramacionD4: TFloatField;
    qCalendarioProgramacionD5: TFloatField;
    qCalendarioProgramacionD6: TFloatField;
    qCalendarioProgramacionD7: TFloatField;
    qCalendarioProgramacionD8: TFloatField;
    qCalendarioProgramacionD9: TFloatField;
    qCalendarioProgramacionD10: TFloatField;
    qCalendarioProgramacionD11: TFloatField;
    qCalendarioProgramacionD12: TFloatField;
    qCalendarioProgramacionD13: TFloatField;
    qCalendarioProgramacionD14: TFloatField;
    qCalendarioProgramacionD15: TFloatField;
    qCalendarioProgramacionD16: TFloatField;
    qCalendarioProgramacionD17: TFloatField;
    qCalendarioProgramacionD18: TFloatField;
    qCalendarioProgramacionD19: TFloatField;
    qCalendarioProgramacionD20: TFloatField;
    qCalendarioProgramacionD21: TFloatField;
    qCalendarioProgramacionD22: TFloatField;
    qCalendarioProgramacionD23: TFloatField;
    qCalendarioProgramacionD24: TFloatField;
    qCalendarioProgramacionD25: TFloatField;
    qCalendarioProgramacionD26: TFloatField;
    qCalendarioProgramacionD27: TFloatField;
    qCalendarioProgramacionD28: TFloatField;
    qCalendarioProgramacionD29: TFloatField;
    qCalendarioProgramacionD30: TFloatField;
    qCalendarioProgramacionD31: TFloatField;
    qCalendarioProgramacionCODIGOESTADOPROGRAMACION: TStringField;
    qCalendarioProgramacionDIADESCANSO: TFloatField;
    dsCalendarioProgramacion: TDataSource;
    qPlanilla: TQuery;
    dsPlanilla: TDataSource;
    updPlanilla: TUpdateSQL;
    qOdtSobreTiempoDetalle: TQuery;
    qOdtSobreTiempoDetalleCODIGOODTSOBRETIEMPODETALLE: TFloatField;
    qOdtSobreTiempoDetalleCODIGOODTSOBRETIEMPO: TFloatField;
    qOdtSobreTiempoDetalleCODIGOODT: TFloatField;
    qOdtSobreTiempoDetalleCODIGOEMPLEADO: TFloatField;
    qOdtSobreTiempoDetalleFECHAHORADESDE: TDateTimeField;
    qOdtSobreTiempoDetalleFECHAHORAHASTA: TDateTimeField;
    qOdtSobreTiempoDetalleCANTIDADDIURNA: TFloatField;
    qOdtSobreTiempoDetalleCANTIDADNOCTURNA: TFloatField;
    qOdtSobreTiempoDetalleDESDEHASTA: TStringField;
    qOdtSobreTiempoDetalleCONVENCIONAL: TStringField;
    dsOdtSobreTiempoDetalle: TDataSource;
    qTipoTurnoProgramacion: TQuery;
    qTipoTurnoProgramacionCODIGOTIPOTURNO: TFloatField;
    qTipoTurnoProgramacionCODIGOTURNO: TFloatField;
    qTipoTurnoProgramacionDesdeHasta: TStringField;
    dsTipoTurnoProgramacion: TDataSource;
    tdMemCantidadConcepto: tdMemTable;
    tdMemCantidadConceptoSTDIURNOORDINARIO: TIntegerField;
    tdMemCantidadConceptoSTDIURNODOMINGOFESTIVO: TIntegerField;
    tdMemCantidadConceptoSTDIURNODOMINGOFESTIVO2: TIntegerField;
    tdMemCantidadConceptoSTNOCTURNOORDINARIO: TIntegerField;
    tdMemCantidadConceptoSTNOCTURNODOMINGOFESTIVO: TIntegerField;
    tdMemCantidadConceptoSRDIURNODOMINGO: TIntegerField;
    tdMemCantidadConceptoSRDIURNOFESTIVO: TIntegerField;
    tdMemCantidadConceptoSRNOCTURNOORDINARIO: TIntegerField;
    tdMemCantidadConceptoSRNOCTURNODOMINGO: TIntegerField;
    tdMemCantidadConceptoSRNOCTURNOFESTIVO: TIntegerField;
    dsMemCantidadConcepto: TDataSource;
    tdMemCantidadPorcentaje: tdMemTable;
    dsTdMemCantidadPorcentaje: TDataSource;
    qTipoTurno: TQuery;
    dsTipoTurno: TDataSource;
    qTurnoEmpleadoDetalle: TQuery;
    dsTurnoEmpleadoDetalle: TDataSource;
    qTurnoEmpleadoDetalleCODIGOTURNOEMPLEADODETALLE: TFloatField;
    qTurnoEmpleadoDetalleCODIGOTURNOEMPLEADO: TFloatField;
    qTurnoEmpleadoDetalleFECHA: TDateTimeField;
    qTurnoEmpleadoDetalleFECHAHORADESDE: TDateTimeField;
    qTurnoEmpleadoDetalleFECHAHORAHASTA: TDateTimeField;
    qTurnoEmpleadoDetalleCANTIDADDIURNA: TFloatField;
    qTurnoEmpleadoDetalleCANTIDADNOCTURNA: TFloatField;
    qTurnoEmpleadoDetalleDesdeHasta: TStringField;
    tdMemPorcentajeConcepto: tdMemTable;
    tdMemPorcentajeConceptoSTDIURNOORDINARIO: TIntegerField;
    tdMemPorcentajeConceptoSTDIURNODOMINGOFESTIVO: TIntegerField;
    tdMemPorcentajeConceptoSTDIURNODOMINGOFESTIVO2: TIntegerField;
    tdMemPorcentajeConceptoSTNOCTURNOORDINARIO: TIntegerField;
    tdMemPorcentajeConceptoSTNOCTURNODOMINGOFESTIVO: TIntegerField;
    tdMemPorcentajeConceptoSRDIURNODOMINGO: TIntegerField;
    tdMemPorcentajeConceptoSRDIURNOFESTIVO: TIntegerField;
    tdMemPorcentajeConceptoSRNOCTURNOORDINARIO: TIntegerField;
    tdMemPorcentajeConceptoSRNOCTURNODOMINGO: TIntegerField;
    tdMemPorcentajeConceptoSRNOCTURNOFESTIVO: TIntegerField;
    dsTdMemPorcentajeConcepto: TDataSource;
    qSobreTiempoTurno: TQuery;
    qDetalleTurno: TQuery;
    qLiquidacion: TQuery;
    dsLiquidacion: TDataSource;
    updLiquidacion: TUpdateSQL;
    PanelTotal: TPanel;
    PanelEncabezado: TPanel;
    Panel3: TPanel;
    gbCia: TGroupBox;
    dbEdCodigoCia: TDBEdit;
    dbLkCbNombreCia: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    PanelSeleccionFecha: TPanel;
    seAgnos: TSpinEdit;
    dbEdFecha: TDBDateEdit;
    gbTipoTurno: TGroupBox;
    dbedTipoTurno: TDBEdit;
    gbEmpleado: TGroupBox;
    sbtGenerarPlanilla: TSpeedButton;
    Bevel1: TBevel;
    sbtLiquidarConceptos: TSpeedButton;
    sbtImprimirPlanilla: TSpeedButton;
    dbLkCbNombreEmpleado: TDBLookupComboBox;
    dbEdCodigoEmpleado: TDBEdit;
    PanelGenerar: TPanel;
    Panel4: TPanel;
    dbgCalendarioProgramacion: TRxDBGrid;
    HeaderControl1: THeaderControl;
    PanelLiquidacion: TPanel;
    dbgCantidadSobreTiempo: TRxDBGrid;
    SeparadorResumenSobreTiempo: TPanel;
    dbgLiquidacionSobretiempo: TRxDBGrid;
    HeaderControl2: THeaderControl;
    HeaderControl3: THeaderControl;
    PanelTurnosMes: TPanel;
    PanelEncabezadoPlanilla: TPanel;
    PanelDetalle: TPanel;
    PanelDetalleExtras: TPanel;
    dbgSobreTiempoDetalle: TRxDBGrid;
    PanelEncabezadoExtrasDia: TPanel;
    Label7: TLabel;
    dbtDiaExtras: TDBText;
    PanelInferiorTurno: TPanel;
    PanelEncabezadoTurnoDia: TPanel;
    Label6: TLabel;
    dbtDiaTurno: TDBText;
    dbgTurnoDetalle: TRxDBGrid;
    Panel5: TPanel;
    dbgTurnoEmpleado: TRxDBGrid;
    DBNavigator2: TDBNavigator;
    HeaderControl5: THeaderControl;
    qLiquidacionCODIGO: TStringField;
    qLiquidacionCONCEPTO: TFloatField;
    qLiquidacionANO_SBT: TFloatField;
    qLiquidacionMES_SBT: TFloatField;
    qLiquidacionDIA_1: TFloatField;
    qLiquidacionDIA_2: TFloatField;
    qLiquidacionDIA_3: TFloatField;
    qLiquidacionDIA_4: TFloatField;
    qLiquidacionDIA_5: TFloatField;
    qLiquidacionDIA_6: TFloatField;
    qLiquidacionDIA_7: TFloatField;
    qLiquidacionDIA_8: TFloatField;
    qLiquidacionDIA_9: TFloatField;
    qLiquidacionDIA_10: TFloatField;
    qLiquidacionDIA_11: TFloatField;
    qLiquidacionDIA_12: TFloatField;
    qLiquidacionDIA_13: TFloatField;
    qLiquidacionDIA_14: TFloatField;
    qLiquidacionDIA_15: TFloatField;
    qLiquidacionDIA_16: TFloatField;
    qLiquidacionDIA_17: TFloatField;
    qLiquidacionDIA_18: TFloatField;
    qLiquidacionDIA_19: TFloatField;
    qLiquidacionDIA_20: TFloatField;
    qLiquidacionDIA_21: TFloatField;
    qLiquidacionDIA_22: TFloatField;
    qLiquidacionDIA_23: TFloatField;
    qLiquidacionDIA_24: TFloatField;
    qLiquidacionDIA_25: TFloatField;
    qLiquidacionDIA_26: TFloatField;
    qLiquidacionDIA_27: TFloatField;
    qLiquidacionDIA_28: TFloatField;
    qLiquidacionDIA_29: TFloatField;
    qLiquidacionDIA_30: TFloatField;
    qLiquidacionDIA_31: TFloatField;
    qLiquidacionUSUARIO: TFloatField;
    qLiquidacionFECHA: TDateTimeField;
    qLiquidacionANO_SIRH: TFloatField;
    qLiquidacionMES_SIRH: TFloatField;
    qLiquidacionNOMINA_SIRH: TFloatField;
    qLiquidacionFEC_SIRH: TDateTimeField;
    qLiquidacionUSR_SIRH: TFloatField;
    qTipoTurnoCODIGOTIPOTURNO: TFloatField;
    qTipoTurnoNOMBRETIPOTURNO: TStringField;
    qTipoTurnoDESCANSOFESTIVO: TStringField;
    qPlanillaCODIGOPLANILLATURNOEMPLEADO: TFloatField;
    qPlanillaCODIGOEMPLEADO: TFloatField;
    qPlanillaCANTIDADDIURNA: TFloatField;
    qPlanillaCANTIDADNOCTURNA: TFloatField;
    qPlanillaOBSERVACION: TStringField;
    qPlanillaDESDEHASTADIURNA: TStringField;
    qPlanillaDESDEHASTANOCTURNA: TStringField;
    qPlanillaCANTIDADEXTRADIURNA: TFloatField;
    qPlanillaCANTIDADEXTRANOCTURNA: TFloatField;
    qPlanillaDESDEHASTAEXTRADIURNA: TStringField;
    qPlanillaDESDEHASTAEXTRANOCTURNA: TStringField;
    qPlanillaOBSERVACIONEXTRA: TStringField;
    qPlanillaCODIGOESTADOPLANILLA: TStringField;
    qSobreTiempoTurnoCODIGOODTSOBRETIEMPODETALLE: TFloatField;
    qSobreTiempoTurnoCODIGOODTSOBRETIEMPO: TFloatField;
    qSobreTiempoTurnoCODIGOODT: TFloatField;
    qSobreTiempoTurnoCODIGOEMPLEADO: TFloatField;
    qSobreTiempoTurnoFECHAHORADESDE: TDateTimeField;
    qSobreTiempoTurnoFECHAHORAHASTA: TDateTimeField;
    qSobreTiempoTurnoCANTIDADDIURNA: TFloatField;
    qSobreTiempoTurnoCANTIDADNOCTURNA: TFloatField;
    qSobreTiempoTurnoCONVENCIONAL: TStringField;
    updOdtSobreTiempoDetalle: TUpdateSQL;
    dsPlanillaMesEmpleado: TDataSource;
    updPlanillaMesEmpleado: TUpdateSQL;
    VerDetalleTurnosDa1: TMenuItem;
    dMenuCIA: TdMenuArbol;
    qTipoTurnoTIPOHORARIO: TStringField;
    qTipoHorario: TQuery;
    dsTipoHorario: TDataSource;
    qTipoHorarioCODIGOTIPOTURNO: TFloatField;
    qTipoHorarioNOMBRETIPOTURNO: TStringField;
    qTipoHorarioDESCANSOFESTIVO: TStringField;
    qTipoHorarioTIPOHORARIO: TStringField;
    qTipoTurnoProgramacionJORNADA: TFloatField;
    qTipoTurnoProgramacionFECHADESDE: TDateTimeField;
    qTipoTurnoProgramacionFECHAHASTA: TDateTimeField;
    qDescripcionTurno: TQuery;
    dsDescripcionTurno: TDataSource;
    qDescripcionTurnoCODIGOTIPOTURNO: TFloatField;
    qDescripcionTurnoCODIGOTURNO: TFloatField;
    qDescripcionTurnoMINFECHADESDE: TDateTimeField;
    qDescripcionTurnoMAXFECHAHASTA: TDateTimeField;
    qDescripcionTurnoDesdeHasta: TStringField;
    qPlanillaMesEmpleado: TQuery;
    qPlanillaMesEmpleadoCODIGOEMPLEADO: TFloatField;
    qPlanillaMesEmpleadoFECHA: TDateTimeField;
    qPlanillaMesEmpleadoCODIGOTIPOTURNO: TFloatField;
    qPlanillaMesEmpleadoCODIGOESTADOPLANILLA: TStringField;
    qOdtPermisos: TQuery;
    qOdtPermisosCODIGOUSUARIO: TFloatField;
    qOdtPermisosCODIGOADMINISTRATIVO: TFloatField;
    qOdtPermisosREABRIR: TStringField;
    qCIAREABRIR: TStringField;
    tdMemCantidadConceptoSTDIURNOORDINARIOCONV: TIntegerField;
    tdMemCantidadConceptoSTDIURNODOMINGOFESTIVOCONV: TIntegerField;
    tdMemCantidadConceptoSTNOCTURNOORDINARIOCONV: TIntegerField;
    tdMemCantidadConceptoSTNOCTURNODOMINGOFESTIVOCONV: TIntegerField;
    tdMemPorcentajeConceptoSTDIURNOORDINARIOCONV: TIntegerField;
    tdMemPorcentajeConceptoSTDIURNODOMINGOFESTIVOCONV: TIntegerField;
    tdMemPorcentajeConceptoSTNOCTURNOORDINARIOCONV: TIntegerField;
    tdMemPorcentajeConceptoSTNOCTURNODOMINGOFESTIVOCONV: TIntegerField;
    qEmpleadoTIPO_CONTRATO: TFloatField;
    tdMemCantidadConceptoDISPONIBILIDADSABADO: TIntegerField;
    tdMemCantidadConceptoDISPONIBILIDADDOMINGOFESTIVO: TIntegerField;
    tdMemPorcentajeConceptoDISPONIBILIDADSABADO: TIntegerField;
    tdMemPorcentajeConceptoDISPONIBILIDADDOMINGOFESTIVO: TIntegerField;
    qSobreTiempoConvTurno: TQuery;
    qSobreTiempoConvTurnoCODIGOODTSOBRETIEMPODETALLE: TFloatField;
    qSobreTiempoConvTurnoCODIGOODTSOBRETIEMPO: TFloatField;
    qSobreTiempoConvTurnoCODIGOODT: TFloatField;
    qSobreTiempoConvTurnoCODIGOEMPLEADO: TFloatField;
    qSobreTiempoConvTurnoFECHAHORADESDE: TDateTimeField;
    qSobreTiempoConvTurnoFECHAHORAHASTA: TDateTimeField;
    qSobreTiempoConvTurnoCANTIDADDIURNA: TFloatField;
    qSobreTiempoConvTurnoCANTIDADNOCTURNA: TFloatField;
    qSobreTiempoConvTurnoCONVENCIONAL: TStringField;
    qPlanillaCANTIDADEXTRADIURNACONV: TFloatField;
    qPlanillaCANTIDADEXTRANOCTURNACONV: TFloatField;
    sbtActualizarExtras: TSpeedButton;
    qTurnoEmpleado: TQuery;
    qTurnoEmpleadoCantidadExtraDiurnaTotal: TIntegerField;
    qTurnoEmpleadoCantidadExtraNocturnaTotal: TIntegerField;
    qTurnoEmpleadoDIASIGUIENTE: TDateTimeField;
    qTurnoEmpleadoDescripcion: TStringField;
    qTurnoEmpleadoCODIGOTURNOEMPLEADO: TFloatField;
    qTurnoEmpleadoCODIGOEMPLEADO: TFloatField;
    qTurnoEmpleadoCODIGOTIPOTURNO: TFloatField;
    qTurnoEmpleadoCODIGOTURNO: TFloatField;
    qTurnoEmpleadoCODIGOESTADO: TStringField;
    qTurnoEmpleadoCODIGOPLANILLATURNOEMPLEADO: TFloatField;
    qTurnoEmpleadoCANTIDADDIURNA: TFloatField;
    qTurnoEmpleadoCANTIDADNOCTURNA: TFloatField;
    qTurnoEmpleadoOBSERVACION: TStringField;
    qTurnoEmpleadoDESDEHASTADIURNA: TStringField;
    qTurnoEmpleadoDESDEHASTANOCTURNA: TStringField;
    qTurnoEmpleadoCANTIDADEXTRADIURNA: TFloatField;
    qTurnoEmpleadoCANTIDADEXTRANOCTURNA: TFloatField;
    qTurnoEmpleadoDESDEHASTAEXTRADIURNA: TStringField;
    qTurnoEmpleadoDESDEHASTAEXTRANOCTURNA: TStringField;
    qTurnoEmpleadoOBSERVACIONEXTRA: TStringField;
    qTurnoEmpleadoCODIGOESTADOPLANILLA: TStringField;
    qTurnoEmpleadoJORNADA: TFloatField;
    qTurnoEmpleadoCANTIDADEXTRADIURNACONV: TFloatField;
    qTurnoEmpleadoCANTIDADEXTRANOCTURNACONV: TFloatField;
    dsTurnoEmpleado: TDataSource;
    updTurnoEmpleado: TUpdateSQL;
    dblcbTipoTurno: TDBLookupComboBox;
    qPlanillaMesEmpleadoCODIGOUSUARIOCREACION: TFloatField;
    qPlanillaMesEmpleadoFECHACREACION: TDateTimeField;
    qPlanillaMesEmpleadoCODIGOUSUARIOMODIFICACION: TFloatField;
    qPlanillaMesEmpleadoFECHAMODIFICACION: TDateTimeField;
    qOdtSobreTiempoDetalleOBSERVACION: TStringField;
    qSobreTiempoTurnoOBSERVACION: TStringField;
    qSobreTiempoConvTurnoOBSERVACION: TStringField;
    tdMemFiltro: TTable;
    tdMemFiltroCodigoAdministrativo: TIntegerField;
    tdMemFiltroFecha: TDateField;
    tdMemFiltroInicioMes: TDateField;
    tdMemFiltroFinMes: TDateField;
    tdMemFiltroCodigoTipoTurno: TIntegerField;
    tdMemFiltroAno: TIntegerField;
    tdMemFiltroMes: TIntegerField;
    tdMemFiltroTipoHorario: TStringField;
    tdMemFiltroReabrir: TStringField;
    tdMemFiltroTipoContrato: TIntegerField;
    qSobreTiempoTurnoDISPONIBILIDAD: TStringField;
    qSobreTiempoConvTurnoDISPONIBILIDAD: TStringField;
    qSobreTiempoDispTurno: TQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    qPlanillaCANTIDADEXTRADISPONIBILIDAD: TFloatField;
    qTurnoEmpleadoCANTIDADEXTRADISPONIBILIDAD: TFloatField;
    sbtmirarLiquidacion: TSpeedButton;
    qVerificarliquidacion: TQuery;
    qLiquidacionver: TQuery;
    qLiquidacionverCODIGO: TStringField;
    qLiquidacionverCONCEPTO: TFloatField;
    qLiquidacionverDESCRIPCION: TStringField;
    qLiquidacionverSUMA: TFloatField;
    qTipoTurnoProgramacionDESCRIPCION: TStringField;
    qTurnoEmpleadoD: TStringField;
    qTurnoEmpleadoFECHA: TDateTimeField;
    qTurnoEmpleadoDIA: TDateTimeField;
    qPlanillaFECHA: TDateTimeField;
    qPlanillaDIA: TDateTimeField;
    qPlanillaD: TStringField;
    SpeedButton2: TSpeedButton;
    qTurnoEmpleado2: TQuery;
    qTurnoEmpleado2CODIGOTURNOEMPLEADO: TFloatField;
    qTurnoEmpleado2CODIGOEMPLEADO: TFloatField;
    qTurnoEmpleado2FECHA: TDateTimeField;
    qTurnoEmpleado2CODIGOTIPOTURNO: TFloatField;
    qTurnoEmpleado2CODIGOTURNO: TFloatField;
    qTurnoEmpleado2CODIGOESTADO: TStringField;
    qTurnoEmpleado2JORNADA: TFloatField;
    sbtAprobarPlanilla: TSpeedButton;
    qPlanillaMesEmpleadoEstado: TStringField;
    DBEdit1: TDBEdit;
    tdMemFiltroCodigoEmpleado: TFloatField;
    procedure tdMemFiltroCodigoAdministrativoChange(Sender: TField);
    procedure tdMemFiltroCodigoEmpleadoChange(Sender: TField);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VerProgramacinTurnos1Click(Sender: TObject);
    procedure MesClick(Sender: TObject);
    procedure dbEdFechaChange(Sender: TObject);
    procedure PanelSeleccionFechaMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure qPlanillaAfterDelete(DataSet: TDataSet);
    procedure qPlanillaAfterPost(DataSet: TDataSet);
    procedure tdMemFiltroFechaChange(Sender: TField);
    procedure dbgCalendarioProgramacionGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure HeaderControl1DrawSection(HeaderControl: THeaderControl;
      Section: THeaderSection; const Rect: TRect; Pressed: Boolean);
    procedure tdMemFiltroAfterInsert(DataSet: TDataSet);
    procedure sbtGenerarPlanillaClick(Sender: TObject);
    procedure dbgTurnoEmpleadoGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure qPlanillaAfterInsert(DataSet: TDataSet);
    procedure qTipoTurnoProgramacionCalcFields(DataSet: TDataSet);
    procedure qTurnoEmpleadoCalcFields(DataSet: TDataSet);
    procedure qTurnoEmpleadoDetalleAfterDelete(DataSet: TDataSet);
    procedure qTurnoEmpleadoDetalleCalcFields(DataSet: TDataSet);
    procedure sbtLiquidarConceptosClick(Sender: TObject);
    procedure dbgPlanillaGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure qTurnoEmpleadoCODIGOTURNOValidate(Sender: TField);
    procedure dbgLiquidacionSobretiempoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure sbtImprimirPlanillaClick(Sender: TObject);
    procedure qTurnoEmpleadoCODIGOTURNOChange(Sender: TField);
    procedure dbgCantidadSobreTiempoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure qLiquidacionAfterPost(DataSet: TDataSet);
    procedure qLiquidacionAfterDelete(DataSet: TDataSet);
    procedure qLiquidacionAfterInsert(DataSet: TDataSet);
    procedure seAgnosChange(Sender: TObject);
    procedure qTurnoEmpleadoAfterOpen(DataSet: TDataSet);
    procedure qTurnoEmpleadoAfterClose(DataSet: TDataSet);
    procedure tdMemFiltroCodigoTipoTurnoChange(Sender: TField);
    procedure qOdtSobreTiempoDetalleCONVENCIONALValidate(Sender: TField);
    procedure qOdtSobreTiempoDetalleAfterPost(DataSet: TDataSet);
    procedure qPlanillaMesEmpleadoAfterPost(DataSet: TDataSet);
    procedure qPlanillaMesEmpleadoAfterInsert(DataSet: TDataSet);
    procedure qPlanillaMesEmpleadoCODIGOESTADOPLANILLAValidate(
      Sender: TField);
    procedure VerDetalleTurnosDa1Click(Sender: TObject);
    procedure dMenuCIASelectID(Sender: tnMenuItem; ID: Integer;
      MenuEstructura: tMenuEs);
    procedure qDescripcionTurnoCalcFields(DataSet: TDataSet);
    procedure qTurnoEmpleadoBeforeOpen(DataSet: TDataSet);
    procedure qTurnoEmpleadoBeforeClose(DataSet: TDataSet);
    procedure sbtActualizarExtrasClick(Sender: TObject);
    procedure qTurnoEmpleadoAfterPost(DataSet: TDataSet);
    procedure sbtmirarLiquidacionClick(Sender: TObject);
    procedure chbCodigoEstadoPlanillaClick(Sender: TObject);
    procedure qOdtSobreTiempoDetalleCalcFields(DataSet: TDataSet);
    procedure qPlanillaCalcFields(DataSet: TDataSet);
    procedure qEmpleadoBeforeOpen(DataSet: TDataSet);
    procedure qLiquidacionBeforeOpen(DataSet: TDataSet);
    procedure qVerificarliquidacionBeforeOpen(DataSet: TDataSet);
    procedure qLiquidacionverAfterOpen(DataSet: TDataSet);
    procedure SpeedButton2Click(Sender: TObject);
    procedure tdMemFiltroCodigoAdministrativoValidate(Sender: TField);
    procedure qPlanillaMesEmpleadoCODIGOESTADOPLANILLAChange(
      Sender: TField);
    procedure qPlanillaMesEmpleadoCalcFields(DataSet: TDataSet);
    procedure sbtAprobarPlanillaClick(Sender: TObject);private
    Year, Month, Day: Word;
    ListaDomingos,ListaFestivos, ListaFinalMes :TStringList;
    ListaTurnosDesde, ListaTurnosHasta,ListaObservaciones:TstringList;
    ColorConcepto: array [0..16] of TColor;
    ColorPorcentaje: array [0..16] of TColor;
    bmTurnoEmpleado:TBookmark;
    Generado:boolean;
    OpcionGeneracion:OpGeneracionPlanilla;
    procedure EliminarRegistros;
    procedure VerificarLiquidacion;
    function CrearListaTurnosMes:TList;
    function ConsultarTipoTurno:integer;
    procedure GenerarDiasMes(Fecha: TDateTime);
    procedure AsignarCantidadesConceptosTemporales(Conceptos:TConceptosExtras);
    procedure AsignarCantidadesPorcentajesTemporales;
    procedure AsignarConceptos;
    function CalcularCantidadesConceptos:TConceptosExtras;
    procedure AsignarPorcentajesConceptosTemporales;
    procedure IniciarColores;
    function EsDomingo(Dia:Integer):boolean;
    function EsFestivo(Dia:Integer):boolean;
    function EsFinalMes(Dia:Integer):boolean;
    Procedure ListarTurnos(tipo:integer);Overload;
    procedure LiquidarSobretiempo;
    function ValidarExtrasConvencionales(var Dias:TstringList):boolean;
    procedure InsertarRegistrosLiquidacion(Conceptos:TConceptosExtras);
    procedure VerLiquidacion;
    function ActualizarHorasExtrasTurno(var HorasDia:THorasDia;Fecha:TDateTime):boolean;
    function ActualizarListaTurnosMes(DiasMes:Tlist):TList;
    procedure ActualizarTurno(var HorasDia:THorasDia;Fecha:TDateTime);
    procedure InsertarRegistrosPlanilla(DiasMes:TList);
    procedure InsertarRegistroPlanillaMes;
    procedure InsertarRegistrosTurnoEmpleado(DiasMes:TList);
    procedure InsertarRegistrosTurnoEmpleadoDetalle(HorasDia:THorasDia;CodigoTurnoEmpleado:double);
    procedure InsertarRegistroPlanilla(HorasDia:THorasDia;Fecha:TDateTime);
    function InsertarRegistroTurnoEmpleado(HorasDia:THorasDia;Fecha:TDateTime):double;
    procedure AsignarEstadoPlanillas(Estado:string);
    function ValidarLiquidacionNomina:boolean;
    function ExistenRegistrosLiquidacionNomina:boolean;
  public
    Escritura:boolean;
    ex:eduexcel;
    CodigoConceptos:array [0..16] of integer;
    PorcentajeConceptos:array [0..16] of integer;
    function FechaServidor: string;
    procedure AprobarLiquidacion;    
    procedure CalcularHorasTurno(Dia,Desde,Hasta:TDateTime;var Horas:THorasDia);
    procedure CalcularDetalleTurno(Desde,Hasta:TDateTime;var ListaHoras:TList);
    procedure RestarHorasConvencionales(var Horas:THorasDia);
    procedure CalcularHorasExtra(Dia,Desde,Hasta:TDateTime;var Horas:THorasExtra);
    procedure AsignarConceptosTemp(tipocontrato: string; var conceptoscompara : TstringList);
    function CargarListaTurnosMes:TList;
  end;
  function FormatoFecha(aFecha:TField):string;overload;
  function FormatoFecha(aFecha:tdatetime):string;overload;
  function FormatoFechaHora(aFecha:TField):string;
  function FormatoHora(aHora:TField):string;
  function HoraDia(Dia:TDateTime):TTime;
  function InterseccionHoras(Desde1,Hasta1,Desde2,Hasta2:TDateTime):real;
  procedure IniciarHorasDia(var HorasDia:THorasDia;IniciarExtras:Boolean=True);
  procedure IniciarHorasExtra(var HorasExtra:THorasExtra);
  function Indice(NombreConcepto:string):integer;
  procedure FiltrarTurnosDesdeHasta(Turno:integer;ListaDesde,ListaHasta:TStringList;out ListaDesdeTurno,ListaHastaTurno:TStringList);
  function HorasEntreRango(Desde1,Hasta1,Desde2,Hasta2:TDateTime):Boolean;

var
  FLiquidarExtrasRecargos: TFLiquidarExtrasRecargos;

implementation
uses Qrctrls, uQRLiquidarExtrasRecargos, ConsDll,UQRLiquidarExtras,
  uFuncionSGD, uComunesAdministrativo;

{$R *.DFM}

//Filtra las listas desde-hasta para un turno
procedure FiltrarTurnosDesdeHasta(Turno:integer;ListaDesde,ListaHasta:TStringList;out ListaDesdeTurno,ListaHastaTurno:TStringList);
var i,j:integer;
begin
  ListaDesdeTurno:=TStringList.Create;
  ListaHastaTurno:=TStringList.Create;
  for i:=0 to ListaDesde.Count-1 do
  begin
    if ListaDesde.Names[i]=inttostr(turno) then
    begin
      j:=pos('=',ListaDesde[i]);
      ListaDesdeTurno.Add(copy(ListaDesde[i],j+1,length(ListaDesde[i])-j));
      ListaHastaTurno.Add(copy(ListaHasta[i],j+1,length(ListaHasta[i])-j));
    end;
  end;
end;

function FormatoFecha(aFecha:TField):string;overload;
begin
  Result:=FormatDateTime('mm/dd/yyyy',aFecha.AsDateTime);
end;
//Devuelve un TDateTime en una cadena formateada de fecha
function FormatoFecha(aFecha:tdatetime):string;overload;
begin
  Result:=FormatDateTime('mm/dd/yyyy',aFecha);
end;
//Devuelve un campo TDateTime en una cadena formateada de hora
function FormatoHora(aHora:TField):string;
begin
  Result:=FormatDateTime('hh',aHora.AsDateTime);
end;
//Devuelve un campo TDateTime en una cadena formateada de fecha-hora
function FormatoFechaHora(aFecha:TField):string;
begin
  Result:=FormatDateTime('dd/mm hh:nn',aFecha.AsDateTime);
end;
//Toma la Hora de un tipo TDateTime
function HoraDia(Dia:TDateTime):TTime;
begin
  result:=Dia-trunc(Dia);
end;
//Inicia variable de tipo THorasDia
procedure IniciarHorasDia(var HorasDia:THorasDia;IniciarExtras:Boolean=True);
begin
  with HorasDia do
  begin
    TipoTurno:=1;
    Turno:=0;
    CantidadDiurna:=0;
    CantidadNocturna:=0;
    DesdeHastaDiurno:='';
    DesdeHastaNocturno:='';
    DesdeHasta:=TList.Create;
    DesdeConvecional:=-1;
    HastaConvencional:=-1;
    Observacion:='';
    if IniciarExtras then
    begin
      CantidadExtraDiurna:=0;
      CantidadExtraNocturna:=0;
      CantidadExtraDiurnaConv:=0;
      CantidadExtraNocturnaConv:=0;
      CantidadExtraDisponibilidad:=0;
      DesdeHastaExtraDiurno:='';
      DesdeHastaExtraNocturno:='';
      ObservacionExtra:='';
    end;
  end;
end;
//Inicia variable de tipo THorasExtras
procedure IniciarHorasExtra(var HorasExtra:THorasExtra);
begin
  with HorasExtra do
  begin
    CantidadDiurna:=0;
    CantidadNocturna:=0;
    DesdeHastaDiurno:='';
    DesdeHastaNocturno:='';
  end;
end;
//verifica si dos lapsos de tiempo se intersectan
//y devuelve la cantidad de tiempo de la interseccion
function InterseccionHoras(Desde1,Hasta1,Desde2,Hasta2:TDateTime):real;
begin
  Result:=(min(Hasta1,Hasta2)-max(Desde1,Desde2));
  if result<0 then result:=0;
end;

procedure TFLiquidarExtrasRecargos.tdMemFiltroCodigoAdministrativoChange(Sender: TField);
begin
  qEmpleado.Close;
  qTurnoEmpleado.Close;
  qOdtSobreTiempoDetalle.Close;
  dbEdCodigoEmpleado.Text:='';
  if sender.AsString<>'' then
  begin
    if not(ValidarAreaActiva(sender.AsFloat)) then
      raise Exception.Create('Este Código Administrativo pertenece a un Área Inactiva.');
    qEmpleado.Open;
  end;
end;

procedure TFLiquidarExtrasRecargos.tdMemFiltroCodigoEmpleadoChange(
  Sender: TField);
begin
  AsignarConceptos;
  IniciarColores;
  qTurnoEmpleado.Close;
  qCalendarioProgramacion.Close;
  qOdtSobreTiempoDetalle.Close;
  qTurnoEmpleadoDetalle.Close;
  if (tdMemFiltroFecha.AsString<>'') and (tdMemFiltroCodigoEmpleado.AsString<>'') then
  begin
    qCalendarioProgramacion.Open;
    tdMemFiltroCodigoTipoTurno.AsInteger :=ConsultarTipoTurno;
    if tdMemFiltroCodigoTipoTurno.AsInteger>0 then
      ListarTurnos(tdMemFiltroCodigoTipoTurno.AsInteger);
    qTurnoEmpleado.Open;
    qOdtSobreTiempoDetalle.Open;
    qTurnoEmpleadoDetalle.Open;
  end;
  PanelTurnosMes.Repaint;
  PanelLiquidacion.Repaint;
 // if ValidarExistenciaRegistrosNomina
end;

procedure TFLiquidarExtrasRecargos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
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
     end
end;

procedure TFLiquidarExtrasRecargos.FormCreate(Sender: TObject);
var cad:string;
  i:integer;
begin
  tdMemFiltro.close;
  tdMemFiltro.DatabaseName:=GetTemporalPath;
  tdMemFiltro.CreateTable;
  ListaDomingos := TStringList.Create;
  ListaDomingos.Duplicates := dupIgnore;
  ListaDomingos.Sorted := True;
  ListaFestivos := TStringList.Create;
  ListaFestivos.Duplicates := dupIgnore;
  ListaFestivos.Sorted := True;
  ListaFinalMes := TStringList.Create;
  ListaFinalMes.Duplicates := dupIgnore;
  ListaFinalMes.Sorted := True;
  ListaTurnosDesde:=TStringList.Create;
  ListaTurnosHasta:=TStringList.Create;
  ListaObservaciones:=TStringList.Create;
  Escritura:=false;
  for i:=0 to 15 do
  begin
    CodigoConceptos[i]:=0;
    PorcentajeConceptos[i]:=0;
  end;

  try
    ConsDll.RefrescarVariables;
  except
    Exit;
  end;
  qCIA.Close;
  if (VarCodigoUsuario=0) then
  begin
    qCIA.Open;
  end
  else
  begin
    qCIA.sql.Delete(qCIA.sql.Count-1);
    qOdtPermisos.Close;
    qOdtPermisos.Sql.Add('AND CODIGOUSUARIO=:CODIGOUSUARIO');
    qOdtPermisos.ParamByName('CODIGOUSUARIO').AsInteger:=VarCodigoUsuario;
    qOdtPermisos.Open;
    if (qOdtPermisos.RecordCount>0)then
    begin
      qOdtPermisos.First;
      qCIA.Sql.Add('AND CODIGOADMINISTRATIVO IN ');
      cad:='';
      while not qOdtPermisos.Eof do
      begin
        cad:=Cad+ qOdtPermisos.fieldbyname('CODIGOADMINISTRATIVO').AsString+',';
        qOdtPermisos.Next;
      end;
      cad:='('+copy(cad,1,length(cad)-1)+')';
      qCIA.Sql.Add(cad);
      qCIA.Sql.Add('ORDER BY NOMBRECATEGORIA');
      qCIA.Open;
    end
    else
    begin
      showmessage('Usted no tiene permisos para trabajar este aplicativo');
      close;
    end;
  end;
end;
//Asigna la cantidad de horas a cada concepto de la tabla temporal de conceptos
procedure TFLiquidarExtrasRecargos.AsignarCantidadesConceptosTemporales(
  Conceptos: TConceptosExtras);                                                                             
var i:integer;
begin
  tdMemCantidadConcepto.Close;
  tdMemCantidadConcepto.Open;
  tdMemCantidadConcepto.Insert;
  with tdMemCantidadConcepto do
  begin
    Edit;
    with Fields do
    begin
      with Conceptos do
      begin
        for i:=0 to count-1 do
        begin
          Fields[i].AsInteger:= cantidades[Indice(Fields[i].FieldName)];
        end;
      end;
    end;
    Post;
  end;
end;

procedure TFLiquidarExtrasRecargos.AsignarPorcentajesConceptosTemporales;
var i:Integer;
begin
  tdMemPorcentajeConcepto.Close;
  tdMemPorcentajeConcepto.Open;
  tdMemPorcentajeConcepto.Insert;
  with tdMemPorcentajeConcepto do
  begin
    Edit;
    for i:=0 to 15 do
    begin
      Fields[i].AsInteger:=porcentajeconceptos[indice(Fields[i].FieldName)];
    end;
    Post;
  end;
end;
//Recorre la planilla para calcular las cantidades
//de cada concepto de sobretiempo y sobreremuneración
function TFLiquidarExtrasRecargos.CalcularCantidadesConceptos: TConceptosExtras;
function CompararInicioFinCadenas(Cad1,Cad2:string;n:integer):boolean;
begin
  Result:=False;
  cad2:=copy(cad2,length(cad2)-n+1,n);//fin
  cad1:=copy(cad1,1,n);               //inicio
  if CompareStr(Cad1,Cad2)=0 then
    Result:=true;
end;
var Dia,ExtrasDF,ExtrasDF2,HorasDF:integer;
  QDatos:tquery;
  Conceptos:TConceptosExtras;
  DescansaFestivo:string;
begin
  Conceptos:=TConceptosExtras.create;
  try
    QDatos:=TQuery.Create(Application);
    QDatos.DatabaseName:='BaseDato';
    QDatos.sql.Text:='SELECT DESCANSOFESTIVO FROM TIPOTURNO WHERE CODIGOTIPOTURNO='
     +tdMemFiltroCodigoTipoTurno.AsString;
    QDatos.Open;
    DescansaFestivo:=QDatos.Fields[0].AsString;
    QDatos.Close;
    QDatos.SQL.Clear;
    QDatos.sql.Add('SELECT CODIGOPLANILLATURNOEMPLEADO,TO_CHAR(DIA,''DD'') D,');
    QDatos.sql.Add('CODIGOEMPLEADO,FECHA,DIA, CANTIDADDIURNA,CANTIDADNOCTURNA,OBSERVACION,');
    QDatos.sql.Add('DESDEHASTADIURNA,DESDEHASTANOCTURNA,');
    QDatos.sql.Add('CANTIDADEXTRADIURNA,CANTIDADEXTRANOCTURNA,CANTIDADEXTRADIURNACONV,CANTIDADEXTRANOCTURNACONV,CANTIDADEXTRADISPONIBILIDAD,');
    QDatos.sql.Add('DESDEHASTAEXTRADIURNA,DESDEHASTAEXTRANOCTURNA,');
    QDatos.sql.Add('OBSERVACIONEXTRA,CODIGOESTADOPLANILLA');
    QDatos.sql.Add('FROM PLANILLATURNOEMPLEADO');
    QDatos.sql.Add('WHERE CODIGOEMPLEADO='+tdMemFiltroCodigoEmpleado.AsString);
    QDatos.sql.Add('AND FECHA=TO_DATE(''' + FormatoFecha(tdMemFiltroInicioMes) + ''',''MM/DD/YYYY'')');
    QDatos.sql.Add('ORDER BY DIA');
    QDatos.Close;
    QDatos.Open;
    if QDatos.RecordCount>0 then
    begin
      with Conceptos do
      begin
        QDatos.First;
        Dia:=0;
        while not QDatos.Eof do
        begin
          inc(Dia);
          HorasDF:=0;
          ExtrasDF:=0;
          ExtrasDF2:=0;
          if EsFestivo(QDatos.fieldbyname('D').AsInteger) then
          begin
            if (comparestr(QDatos.fieldbyname('DESDEHASTAEXTRADIURNA').AsString,QDatos.fieldbyname('DESDEHASTADIURNA').AsString)>0)
            and (QDatos.fieldbyname('CANTIDADDIURNA').AsInteger>0)
            and CompararInicioFinCadenas(QDatos.fieldbyname('DESDEHASTAEXTRADIURNA').AsString,QDatos.fieldbyname('DESDEHASTADIURNA').AsString,2) then
            begin
              HorasDF:=QDatos.fieldbyname('CANTIDADEXTRADIURNA').AsInteger+QDatos.fieldbyname('CANTIDADDIURNA').AsInteger;
              ExtrasDF2:=HorasDF-8;
              if ExtrasDF2>0 then
                ExtrasDF:=HorasDF-ExtrasDF2-QDatos.fieldbyname('CANTIDADDIURNA').AsInteger
              else
                ExtrasDF:=HorasDF-QDatos.fieldbyname('CANTIDADDIURNA').AsInteger;
            end
            else
            begin
              HorasDF:=QDatos.fieldbyname('CANTIDADEXTRADIURNA').AsInteger;
              ExtrasDF2:=HorasDF-8;
              if ExtrasDF2>0 then
                ExtrasDF:=HorasDF-ExtrasDF2
              else
                ExtrasDF:=HorasDF;
            end;
            CantidadesDias[Indice('srDiurnoFestivo'),dia]:=QDatos.fieldbyname('CANTIDADDIURNA').AsInteger;
            CantidadesDias[Indice('srNocturnoFestivo'),dia]:=QDatos.fieldbyname('CANTIDADNOCTURNA').AsInteger;
            CantidadesDias[Indice('stNocturnoDomingoFestivo'),dia]:=QDatos.fieldbyname('CANTIDADEXTRANOCTURNA').AsInteger;
            CantidadesDias[Indice('stNocturnoDomingoFestivoConv'),dia]:=QDatos.fieldbyname('CANTIDADEXTRANOCTURNACONV'). AsInteger;
            CantidadesDias[Indice('stDiurnoDomingoFestivoConv'),dia]:=QDatos.fieldbyname('CANTIDADEXTRADIURNACONV'). AsInteger;
            CantidadesDias[Indice('DisponibilidadDomingoFestivo'),dia]:=QDatos.fieldbyname('CANTIDADEXTRADISPONIBILIDAD'). AsInteger;
            if ExtrasDF>0 then
              CantidadesDias[Indice('stDiurnoDomingoFestivo'),dia]:=ExtrasDF;
            if ExtrasDF2>0 then
              CantidadesDias[Indice('stDiurnoDomingoFestivo2'),dia]:=ExtrasDF2;

          end
          else
          begin
            if EsDomingo(QDatos.fieldbyname('D').AsInteger) then
            begin
              if (comparestr(QDatos.fieldbyname('DESDEHASTAEXTRADIURNA').AsString,QDatos.fieldbyname('DESDEHASTADIURNA').AsString)>0)
              and (QDatos.fieldbyname('CANTIDADDIURNA').AsInteger>0)
              and CompararInicioFinCadenas(QDatos.fieldbyname('DESDEHASTAEXTRADIURNA').AsString,QDatos.fieldbyname('DESDEHASTADIURNA').AsString,2) then
              begin
                HorasDF:=QDatos.fieldbyname('CANTIDADEXTRADIURNA').AsInteger+QDatos.fieldbyname('CANTIDADDIURNA').AsInteger;
                ExtrasDF2:=HorasDF-8;
                if ExtrasDF2>0 then
                  ExtrasDF:=HorasDF-ExtrasDF2-QDatos.fieldbyname('CANTIDADDIURNA').AsInteger
                else
                  ExtrasDF:=HorasDF-QDatos.fieldbyname('CANTIDADDIURNA').AsInteger;
              end
              else
              begin
                HorasDF:=QDatos.fieldbyname('CANTIDADEXTRADIURNA').AsInteger;
                ExtrasDF2:=HorasDF-8;
                if ExtrasDF2>0 then
                  ExtrasDF:=HorasDF-ExtrasDF2
                else
                  ExtrasDF:=HorasDF;
              end;
              CantidadesDias[Indice('srDiurnoDomingo'),dia]:=QDatos.fieldbyname('CANTIDADDIURNA').AsInteger;
              CantidadesDias[Indice('srNocturnoDomingo'),dia]:=QDatos.fieldbyname('CANTIDADNOCTURNA').AsInteger;
              CantidadesDias[Indice('stNocturnoDomingoFestivo'),dia]:=QDatos.fieldbyname('CANTIDADEXTRANOCTURNA').AsInteger;
              CantidadesDias[Indice('stNocturnoDomingoFestivoConv'),dia]:=QDatos.fieldbyname('CANTIDADEXTRANOCTURNACONV').AsInteger;
              CantidadesDias[Indice('stDiurnoDomingoFestivoConv'),dia]:=QDatos.fieldbyname('CANTIDADEXTRADIURNACONV').AsInteger;
              CantidadesDias[Indice('DisponibilidadDomingoFestivo'),dia]:=QDatos.fieldbyname('CANTIDADEXTRADISPONIBILIDAD'). AsInteger;
              if ExtrasDF>0 then
                CantidadesDias[Indice('stDiurnoDomingoFestivo'),dia]:=ExtrasDF;
              if ExtrasDF2>0 then
                CantidadesDias[Indice('stDiurnoDomingoFestivo2'),dia]:=ExtrasDF2;
            end
            else
            begin
              if (DayOfWeek(QDatos.fieldbyname('DIA').AsDateTime)=7) then
              CantidadesDias[Indice('DisponibilidadSabado'),dia]:=QDatos.fieldbyname('CANTIDADEXTRADISPONIBILIDAD'). AsInteger;
              CantidadesDias[Indice('stDiurnoOrdinario'),dia]:=QDatos.fieldbyname('CANTIDADEXTRADIURNA').AsInteger;
              CantidadesDias[Indice('srNocturnoOrdinario'),dia]:=QDatos.fieldbyname('CANTIDADNOCTURNA').AsInteger;
              CantidadesDias[Indice('stNocturnoOrdinario'),dia]:=QDatos.fieldbyname('CANTIDADEXTRANOCTURNA').AsInteger;
              CantidadesDias[Indice('stDiurnoOrdinarioConv'),dia]:=QDatos.fieldbyname('CANTIDADEXTRADIURNACONV').AsInteger;
              CantidadesDias[Indice('stNocturnoOrdinarioConv'),dia]:=QDatos.fieldbyname('CANTIDADEXTRANOCTURNACONV').AsInteger;
            end;
          end;
          QDatos.Next;
        end;
        SumarCantidades;
      end;
    end;
    QDatos.Free;
  except
  end;
  result:=Conceptos;
end;

//Recibe un entero correspondiente al día del mes y devuelve true si es domingo
function TFLiquidarExtrasRecargos.EsDomingo(Dia: Integer): boolean;
var i:Integer;
begin
 Result:=False;
 for i := 0 to ListaDomingos.Count-1 do
 begin
   if strtoint(ListaDomingos[i])=Dia then
   begin
     Result:=true;
     break;
   end;
 end;
end;
//Recibe un entero correspondiente al día del mes y devuelve true si es festivo
function TFLiquidarExtrasRecargos.EsFestivo(Dia: Integer): boolean;
var i:Integer;
begin
 Result:=False;
 for i := 0 to ListaFestivos.Count-1 do
 begin
   if strtoint(ListaFestivos[i])=Dia then
   begin
     Result:=true;
     break;
   end;
 end;
end;
//Recibe un entero correspondiente al día del mes y devuelve true si es fin de mes
function TFLiquidarExtrasRecargos.EsFinalMes(Dia: Integer): boolean;
var i:Integer;
begin
 Result:=False;
 for i := 0 to ListaFinalMes.Count-1 do
 begin
   if strtoint(ListaFinalMes[i])=Dia then
   begin
     Result:=true;
     break;
   end;
 end;
end;
//Recibe un fecha  y genera lista de domingos, festivos y fin de mes
procedure TFLiquidarExtrasRecargos.GenerarDiasMes(Fecha: TDateTime);
const Dias:array[1..7] of string=('D','L','M','M','J','V','S');
var I: Integer;
    Query: TQuery;
    Texto: string;
    Dia:TDateTime;
begin
  ListaFestivos.Clear;
  ListaDomingos.Clear;
  ListaFinalMes.Clear;
  Query := TQuery.Create(Application);
  Dia:=Fecha;
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Text := 'SELECT COUNT(*) FROM SIP_FESTIVOS'+dblink+ '  WHERE UPPER(DESCRIPCION) LIKE ''%FESTIVO%'' AND FECHA = :FECHA';
  for I:=1 to 31 do
  begin
    Query.Close;
    Query.Params[0].AsDateTime := Dia;
    Query.Open;
    Texto := Dias[DayOfWeek(Dia)];
    try
      DecodeDate(Fecha,Year, Month, Day);
      Day := I;
      EncodeDate(Year,Month,Day);
      if Query.Fields[0].AsInteger > 0 then
      begin
        ListaFestivos.Add(FormatDateTime('dd',Dia));
      end;
      if Texto = 'D' then
      begin
        ListaDomingos.Add(FormatDateTime('dd',Dia));
      end;
    except
      ListaFinalMes.Add(IntToStr(Day));
    end;
    HeaderControl1.Sections[I].Text :=  Texto;
    Dia := Dia + 1;
  end;
  Query.Free;
end;
//Realiza los cálculos de conceptos y genera los registros de liquidación
procedure TFLiquidarExtrasRecargos.LiquidarSobretiempo;
var sl:tstringlist;
  dias:string;
  i:integer;
begin
  if ValidarExtrasConvencionales(sl) then
  begin
    AsignarEstadoPlanillas('LIQ');
  end
  else
  begin
    for i:=0 to sl.Count-1 do
      dias:=dias+sl[i]+', ';
    dias:=copy(dias,1,length(dias)-2);
    showmessage('Se encontraron horas extras convencionales que no cumplen con los requisitos. '+dias +' Por favor verifique');
    AsignarEstadoPlanillas('GEN');
  end;
  qTurnoEmpleado.Close;
  qTurnoEmpleado.Open;
end;

procedure TFLiquidarExtrasRecargos.FormShow(Sender: TObject);
begin
  tdMemFiltro.StoreDefs:=False;
  tdMemFiltro.Open;
  tdMemFiltro.Insert;
  Generado:=true;
  qCalendarioProgramacion.Close;
  dbEdFechaChange(nil);
  dbEdCodigoCia.SetFocus;
//  IniciarColores;
  qTurnoEmpleado.Close;
  qTurnoEmpleado.Open;
  inherited;
end;

procedure TFLiquidarExtrasRecargos.VerProgramacinTurnos1Click(Sender: TObject);
begin
  if VerProgramacinTurnos1.Checked then
    PanelEncabezado.Height:=84
  else
    PanelEncabezado.Height:=175;
  VerProgramacinTurnos1.Checked:=not VerProgramacinTurnos1.Checked;
end;

procedure TFLiquidarExtrasRecargos.MesClick(Sender: TObject);
var
  YearActual, MesActual, DiaActual: Word;
  Hoy: TDateTime;
begin
  if dbEdFecha.Date = 0 then
    dbEdFecha.Date := Now;
  DecodeDate(dbEdFecha.Date, Year, Month, Day);

  Hoy := Now;
  DecodeDate(Hoy, YearActual, MesActual, DiaActual);
  Month := (Sender as TMenuItem).Tag;

  if (Month > MesActual) and (Year >= YearActual) then
    raise Exception.Create('No se pueden generar planillas de meses futuros.');

  dbEdFecha.Date := StrToDate(IntToStr(Day) + '/' + IntToStr(Month) + '/' + IntToStr(Year));
end;

procedure TFLiquidarExtrasRecargos.dbEdFechaChange(Sender: TObject);
var cadena:string;
begin
  try
    cadena := FormatDateTime('  MMMM  "01 de" YYYY ', dbEdFecha.Date);
    cadena[1] := UpperCase(cadena[1])[1];
    PanelSeleccionFecha.Caption := cadena; // UpperCase(cadena[1]) + Copy(cadena, 2 length(cadena)-1);
    DecodeDate(dbEdFecha.Date, Year, Month, Day);
    seAgnos.Value := Year;
    tdMemFiltroINICIOMES.AsDateTime:=dbEdFecha.Date;
    tdMemFiltroAno.Asinteger:=Year;
    tdMemFiltroMes.Asinteger:=Month;
    if Month<12 then inc(Month)
    else
    begin
      inc(Year);
      Month:=1;
    end;
    tdMemFiltroFINMES.AsDateTime:=EncodeDate(Year, Month, Day)-1;
    tdMemFiltroFecha.AsDateTime := dbEdFecha.Date;
  except
  end;
end;

procedure TFLiquidarExtrasRecargos.PanelSeleccionFechaMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Punto: TPoint;
begin
    Punto:=PanelSeleccionFecha.ClientToScreen(Classes.Point(X + 10, 10));
    pmMeses.Popup(punto.x+10, punto.y);
end;
procedure TFLiquidarExtrasRecargos.qPlanillaAfterDelete(DataSet: TDataSet);
begin
  qPlanilla.ApplyUpdates;
  qPlanilla.CommitUpdates;
end;

procedure TFLiquidarExtrasRecargos.qPlanillaAfterPost(DataSet: TDataSet);
begin
  qPlanilla.ApplyUpdates;
  qPlanilla.CommitUpdates;
end;

procedure TFLiquidarExtrasRecargos.tdMemFiltroFechaChange(Sender: TField);
begin
  GenerarDiasMes(Sender.AsDateTime);
  IniciarColores;
  qTurnoEmpleado.Close;
  qCalendarioProgramacion.Close;
  qOdtSobreTiempoDetalle.Close;
  qTurnoEmpleadoDetalle.Close;
  if (tdMemFiltroFecha.AsString<>'') and (tdMemFiltroCodigoEmpleado.AsString<>'') then
  begin
    qCalendarioProgramacion.Open;
    tdMemFiltroCodigoTipoTurno.AsInteger :=ConsultarTipoTurno;
    if tdMemFiltroCodigoTipoTurno.AsInteger>0 then
    begin
      ListarTurnos(tdMemFiltroCodigoTipoTurno.AsInteger);
    end;
    qTurnoEmpleado.Open;
    qOdtSobreTiempoDetalle.Open;
    qTurnoEmpleadoDetalle.Open;
  end;
  PanelTurnosMes.Repaint;
  PanelLiquidacion.Repaint;
end;

procedure TFLiquidarExtrasRecargos.dbgCalendarioProgramacionGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
var Dia:integer;
begin
  Dia:= strtoint(copy(Field.FieldName,2,length(Field.FieldName)-1));
  if EsDomingo(Dia) then Background := clRed;
  if EsFestivo(Dia) then Background := clRed;
  if EsFinalMes(Dia) then Background := clBlack;
  if Field.AsString = '0' then
    Background := clBlue;
end;

procedure TFLiquidarExtrasRecargos.HeaderControl1DrawSection(
  HeaderControl: THeaderControl; Section: THeaderSection;
  const Rect: TRect; Pressed: Boolean);
begin
  with HeaderControl.Canvas do
  begin
    if EsDomingo(Section.Index) then Font.Color := clRed;
    if EsFestivo(Section.Index) then Font.Color := clRed;
    TextOut(Rect.Left + Font.Size, Rect.Top + 2, Section.Text)
  end;
end;

procedure TFLiquidarExtrasRecargos.tdMemFiltroAfterInsert(DataSet: TDataSet);
begin
  DecodeDate(Now, Year, Month, Day);
  Day := 1;
  tdMemFiltroFecha.AsDateTime := StrToDate(IntToStr(Day) + '/' + IntToStr(Month) + '/' + IntToStr(Year));
end;
//******************************************************************************
// Genera una Planilla de turnos a partir de la programación
// existente para el empleado en el mes seleccionado
//******************************************************************************
procedure TFLiquidarExtrasRecargos.sbtGenerarPlanillaClick(Sender: TObject);
//*** Generar Registros de PlanillaTurnoEmpleado a partir de los turnos programados
var ListaTurnosMes:TList;
begin
  Application.ProcessMessages;
  try
    if qTurnoEmpleadoCODIGOESTADO.AsString = 'BLO' then
      raise Exception.Create('No se puede generar esta planilla ya que se encuentra bloqueada.');
    qCalendarioProgramacion.Close;
    qCalendarioProgramacion.Open;
    if tdMemFiltroCodigoTipoTurno.AsInteger<=0 then
      raise Exception.Create('Debe escoger el horario del empleado para generar la planilla');
    if qCalendarioProgramacion.RecordCount>0 then
    begin
      if Application.MessageBox('Desea Cargar los turnos de la programación realizada'+ chr(13)+
      'para el empleado este mes','Confirmación',MB_YESNO)= idyes then
        OpcionGeneracion:=GenerarTurnosConProgramacion
      else
      begin
        if tdMemFiltroTipoHorario.AsString='T' then
          OpcionGeneracion:=GenerarTurnosSinProgramacion
        else
          OpcionGeneracion:=GenerarHorarioUnico;
      end;
    end
    else
      if tdMemFiltroTipoHorario.AsString='T' then
        OpcionGeneracion:=GenerarTurnosSinProgramacion
      else
        OpcionGeneracion:=GenerarHorarioUnico;

    Generado:=false;
    ListaTurnosMes:=CrearListaTurnosMes;
    qTurnoEmpleado.Database.StartTransaction;
    EliminarRegistros;
    InsertarRegistrosTurnoEmpleado(ListaTurnosMes);
    ActualizarListaTurnosMes(ListaTurnosMes);
    InsertarRegistrosPlanilla(ListaTurnosMes);
    InsertarRegistroPlanillaMes;
    AsignarEstadoPlanillas('GEN');
    Generado:=true;

    qTurnoEmpleado.Database.Commit;

  except
    on e:exception do
    begin
      showmessage(e.message);
      if qTurnoEmpleado.Database.InTransaction then
        qTurnoEmpleado.Database.Rollback;
    end;
  end;
  qTurnoEmpleado.Close;
  qTurnoEmpleado.Open;
  qOdtSobreTiempoDetalle.Close;
  qOdtSobreTiempoDetalle.Open;
  Application.ProcessMessages;
end;

procedure TFLiquidarExtrasRecargos.dbgTurnoEmpleadoGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if Field.FieldName ='D' then
  begin
    if Field.AsString<>'' then
    begin
      if EsDomingo(Field.AsInteger) then Background := clRed;
      if EsFestivo(Field.AsInteger) then Background := claqua;
    end;
  end;
end;
//*********Cuenta la cantidad de horas extras diurnas y nocturnas
procedure TFLiquidarExtrasRecargos.CalcularHorasExtra(Dia, Desde,
  Hasta: TDateTime; var Horas: THorasExtra);
var HoraDesde,MinDesde,SegDesde,MsDesde,HoraHasta,MinHasta,SegHasta,MsHasta:Word;
    Hora:TTime;
begin
  if Hasta>Desde then
  begin
    Dia:=trunc(Dia);
    if Dia>Desde then Desde:=Dia;
    if Hasta>Dia+1 then Hasta:=Dia+1;
    DecodeTime(Desde, HoraDesde, MinDesde, SegDesde, MsDesde);
    DecodeTime(Hasta, HoraHasta, MinHasta, SegHasta, MsHasta);
    if HoraHasta=0 then HoraHasta:=24;
    //if HoraDesde<6 then
    if HoraDesde<5 then
    begin
      if Horas.DesdeHastaNocturno<>'' then
        Horas.DesdeHastaNocturno:=Horas.DesdeHastaNocturno+' / ';
      Horas.DesdeHastaNocturno:=Horas.DesdeHastaNocturno+FormatDateTime('hh',Desde);
      //if HoraHasta>6 then
      if HoraHasta>5 then
      begin
        //Hora:=EncodeTime(6, 0, 0, 0);
        Hora:=EncodeTime(5, 0, 0, 0);
        Horas.DesdeHastaNocturno:=Horas.DesdeHastaNocturno+ '-'+FormatDateTime('hh',trunc(Hasta)+Hora);
        //Horas.CantidadNocturna:=Horas.CantidadNocturna + 6-HoraDesde;
        Horas.CantidadNocturna:=Horas.CantidadNocturna + 5-HoraDesde;
        CalcularHorasExtra(Dia,trunc(Desde)+Hora,Hasta,Horas);
      end
      else
      begin
        Horas.DesdeHastaNocturno:=Horas.DesdeHastaNocturno+ '-'+FormatDateTime('hh',Hasta);
        Horas.CantidadNocturna:=Horas.CantidadNocturna +HoraHasta-HoraDesde;
      end;
    end
    else
    begin
      //if HoraDesde>=22 then
      if HoraDesde>=19 then
      begin
        if Horas.DesdeHastaNocturno<>'' then
          Horas.DesdeHastaNocturno:=Horas.DesdeHastaNocturno+' / ';
        //Hora:=EncodeTime(2, 0, 0, 0);
        Hora:=EncodeTime(5, 0, 0, 0);
        Horas.DesdeHastaNocturno:=Horas.DesdeHastaNocturno+ FormatDateTime('hh',Desde)
                                +'-'+ FormatDateTime('hh',Hasta);
        if (Hasta-desde)<(Hora) then
          Horas.CantidadNocturna:=Horas.CantidadNocturna+ HoraHasta-HoraDesde
        else
          Horas.CantidadNocturna:=Horas.CantidadNocturna+ 24-HoraDesde;
      end
      else
      begin
        if Horas.DesdeHastaDiurno<>'' then
          Horas.DesdeHastaDiurno:=Horas.DesdeHastaDiurno+' / ';
        Horas.DesdeHastaDiurno:=Horas.DesdeHastaDiurno+FormatDateTime('hh',Desde);
        //if (HoraHasta <=22) then
        if (HoraHasta <=19) then
        begin
          Horas.DesdeHastaDiurno:=Horas.DesdeHastaDiurno+'-'+FormatDateTime('hh',Hasta);
          Horas.CantidadDiurna:=HoraHasta - HoraDesde;
        end
        else
        begin
          //Hora:=EncodeTime(22, 0, 0, 0);
          Hora:=EncodeTime(19, 0, 0, 0);
          Horas.DesdeHastaDiurno:=Horas.DesdeHastaDiurno+'-'+FormatDateTime('hh',trunc(Desde)+Hora);
          //Horas.CantidadDiurna:=Horas.CantidadDiurna + 22-HoraDesde;
          Horas.CantidadDiurna:=Horas.CantidadDiurna + 19-HoraDesde;
          CalcularHorasExtra(Dia,trunc(Desde)+Hora,Hasta,Horas);
        end;
      end;
    end;
  end;
end;

procedure TFLiquidarExtrasRecargos.qPlanillaAfterInsert(DataSet: TDataSet);
var Query:TQuery;
    j:integer;
begin
  if Generado then
  begin
    qPlanilla.delete;
    qPlanilla.CommitUpdates;
    exit;
  end;
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Text:='SELECT MAX(CODIGOPLANILLATURNOEMPLEADO) AS CODIGO FROM PLANILLATURNOEMPLEADO';
  Query.Open;
  j:=0;
  if Query.fieldbyname('CODIGO').AsString<>'' then
    J:=Query.fieldbyname('CODIGO').AsInteger;
  DataSet.FieldByName('CODIGOPLANILLATURNOEMPLEADO').AsInteger:=j+1;
  DataSet.FieldByName('CODIGOEMPLEADO').AsString:=tdMemFiltroCodigoEmpleado.AsString;
  DataSet.FieldByName('FECHA').AsString:=tdMemFiltroFecha.AsString;
  DataSet.FieldByName('DIA').AsString:=tdMemFiltroFecha.AsString;
  Query.Free;
end;

procedure TFLiquidarExtrasRecargos.qTipoTurnoProgramacionCalcFields(
  DataSet: TDataSet);
begin
  if qTipoTurnoProgramacionCODIGOTURNO.AsString<>'' then
  begin
    if (qTipoTurnoProgramacionCODIGOTURNO.AsInteger <=0)then
    begin
      qTipoTurnoProgramacionDESDEHASTA.AsString:=qTipoTurnoProgramacionDESCRIPCION.AsString;
    end
    else
      begin
      if (qTipoTurnoProgramacionCODIGOTURNO.AsInteger >0)and
         (qTipoTurnoProgramacionFECHADESDE.AsString<>'')and
         (qTipoTurnoProgramacionFECHAHASTA.AsString<>'')then
      begin
        qTipoTurnoProgramacionDESDEHASTA.AsString:= 'De '+
         FormatDateTime('HH : NN',qTipoTurnoProgramacionFECHADESDE.AsDateTime)+
        ' a ' + FormatDateTime('HH:NN',qTipoTurnoProgramacionFECHAHASTA.AsDateTime);
      end;
    end;
  end;

end;
//Genera la lista de detalle de un turno partido por días
//a partir de la hora desde hasta de un turno
procedure TFLiquidarExtrasRecargos.CalcularDetalleTurno(Desde, Hasta: TDateTime;
  var ListaHoras: TList);
var Dia,DiaFinal,Hora,HoraDesdeDiurna,HoraHastaDiurna:TDateTime;
    HoraDesdeNocturna1,HoraHastaNocturna1,HoraDesdeNocturna2,HoraHastaNocturna2:tdatetime;
    pHoras:PHorasTurnoDetalle;
    temp:integer;
begin
  Dia:=trunc(Desde);
  DiaFinal:=trunc(Hasta);
  ListaHoras:=TList.Create;
  while Dia<=DiaFinal do
  begin
    HoraDesdeNocturna1:=Dia;
    //hora:=EncodeTime(6,0,0,0);
    hora:=EncodeTime(5,0,0,0);
    HoraHastaNocturna1:=Dia+hora;
    HoraDesdeDiurna:=Dia+hora;
    //hora:=EncodeTime(22,0,0,0);
    hora:=EncodeTime(19,0,0,0);
    HoraHastaDiurna:=Dia+hora;
    HoraDesdeNocturna2:=Dia+hora;
    HoraHastaNocturna2:=Dia+1;
    new(pHoras);
    ListaHoras.Add(pHoras);
    pHoras.HoraDesde:=Desde;
    pHoras.Fecha:=Dia;
    if trunc(Hasta)>Dia then
    begin
      phoras.HoraHasta:=trunc(Hasta);
      Desde:=trunc(Hasta);
    end
    else
    begin
      phoras.HoraHasta:=Hasta;
    end;
    temp:=round(interseccionhoras(phoras.HoraDesde,phoras.HoraHasta,HoraDesdeDiurna,HoraHastaDiurna)*24);
    if temp>0 then phoras.CantidadDiurna:=temp else phoras.CantidadDiurna:=0;
    temp:=round(interseccionhoras(phoras.HoraDesde,phoras.HoraHasta,HoraDesdeNocturna1,HoraHastaNocturna1)*24);
    if temp>0 then phoras.CantidadNocturna:=temp else phoras.CantidadNocturna:=0;
    temp:=round(interseccionhoras(phoras.HoraDesde,phoras.HoraHasta,HoraDesdeNocturna2,HoraHastaNocturna2)*24);
    if temp>0 then phoras.CantidadNocturna:= phoras.CantidadNocturna+temp;
    Dia:=Dia+1;
  end;
end;

procedure TFLiquidarExtrasRecargos.qTurnoEmpleadoCalcFields(DataSet: TDataSet);
begin
  if (qTurnoEmpleadoFECHA.AsString<>'') then
    qTurnoEmpleadoDIASIGUIENTE.AsDateTime:=qTurnoEmpleadoFECHA.AsDateTime+1;
  qTurnoEmpleadoCantidadExtraDiurnaTotal.AsInteger:=qTurnoEmpleadoCANTIDADEXTRADIURNA.AsInteger + qTurnoEmpleadoCANTIDADEXTRADIURNACONV.AsInteger;
  qTurnoEmpleadoCantidadExtraNocturnaTotal.AsInteger:=qTurnoEmpleadoCANTIDADEXTRANOCTURNA.AsInteger + qTurnoEmpleadoCANTIDADEXTRANOCTURNACONV.AsInteger;
  qTurnoEmpleadoD.AsString:=FormatDateTime('DD',qTurnoEmpleadoDIA.AsDateTime);
end;

procedure TFLiquidarExtrasRecargos.qTurnoEmpleadoDetalleAfterDelete(
  DataSet: TDataSet);
begin

end;

//Calcula la cantidad de horas de un turno y los valores desde hasta
procedure TFLiquidarExtrasRecargos.CalcularHorasTurno(Dia, Desde,
  Hasta: TDateTime; var Horas: THorasDia);
var HoraDesde,MinDesde,SegDesde,MsDesde,HoraHasta,MinHasta,SegHasta,MsHasta:Word;
    Hora:TTime;
begin
  if Hasta>Desde then
  begin
    Dia:=trunc(Dia);
    if Dia>Desde then Desde:=Dia;
    if Hasta>Dia+1 then Hasta:=Dia+1;
    DecodeTime(Desde, HoraDesde, MinDesde, SegDesde, MsDesde);
    DecodeTime(Hasta, HoraHasta, MinHasta, SegHasta, MsHasta);
    if HoraHasta=0 then HoraHasta:=24;
    //if HoraDesde<6 then
    if HoraDesde<5 then
    begin
      if Horas.DesdeHastaNocturno<>'' then
        Horas.DesdeHastaNocturno:=Horas.DesdeHastaNocturno+' / ';
      Horas.DesdeHastaNocturno:=Horas.DesdeHastaNocturno+FormatDateTime('hh',Desde);
      //if HoraHasta>6 then
      if HoraHasta>5 then
      begin
        //Hora:=EncodeTime(6, 0, 0, 0);
        Hora:=EncodeTime(5, 0, 0, 0);
        Horas.DesdeHastaNocturno:=Horas.DesdeHastaNocturno+ '-'+FormatDateTime('hh',trunc(Hasta)+Hora);
        //Horas.CantidadNocturna:=Horas.CantidadNocturna + 6-HoraDesde;
        Horas.CantidadNocturna:=Horas.CantidadNocturna + 5-HoraDesde;
        CalcularHorasTurno(Dia,trunc(Desde)+Hora,Hasta,Horas);
      end
      else
      begin
        Horas.DesdeHastaNocturno:=Horas.DesdeHastaNocturno+ '-'+FormatDateTime('hh',Hasta);
        Horas.CantidadNocturna:=Horas.CantidadNocturna +HoraHasta-HoraDesde;
      end;
    end
    else
    begin
      //if HoraDesde>=22 then
      if HoraDesde>=19 then
      begin
        if Horas.DesdeHastaNocturno<>'' then
          Horas.DesdeHastaNocturno:=Horas.DesdeHastaNocturno+' / ';
        Horas.DesdeHastaNocturno:=Horas.DesdeHastaNocturno+ FormatDateTime('hh',Desde)
                                +'-'+ FormatDateTime('hh',Hasta);
        Horas.CantidadNocturna:=Horas.CantidadNocturna+ HoraHasta-HoraDesde
      end
      else
      begin
        if Horas.DesdeHastaDiurno<>'' then
          Horas.DesdeHastaDiurno:=Horas.DesdeHastaDiurno+' / ';
        Horas.DesdeHastaDiurno:=Horas.DesdeHastaDiurno+FormatDateTime('hh',Desde);
        //if (HoraHasta <=22) then
        if (HoraHasta <=19) then
        begin
          Horas.DesdeHastaDiurno:=Horas.DesdeHastaDiurno+'-'+FormatDateTime('hh',Hasta);
          Horas.CantidadDiurna:=Horas.CantidadDiurna+HoraHasta - HoraDesde;
        end
        else
        begin
          //Hora:=EncodeTime(22, 0, 0, 0);
          Hora:=EncodeTime(19, 0, 0, 0);
          Horas.DesdeHastaDiurno:=Horas.DesdeHastaDiurno+'-'+FormatDateTime('hh',trunc(Desde)+Hora);
          //Horas.CantidadDiurna:=Horas.CantidadDiurna + 22-HoraDesde;
          Horas.CantidadDiurna:=Horas.CantidadDiurna + 19-HoraDesde;
          CalcularHorasTurno(Dia,trunc(Desde)+Hora,Hasta,Horas);
        end;
      end;
    end;
  end;
end;

procedure TFLiquidarExtrasRecargos.qTurnoEmpleadoDetalleCalcFields(
  DataSet: TDataSet);
begin
   DataSet.FieldByName('DESDEHASTA').AsString:=FormatDateTime('hh:nn',qTurnoEmpleadoDetalleFECHAHORADESDE.asdatetime)
   + ' - ' + FormatDateTime('hh:nn',qTurnoEmpleadoDetalleFECHAHORAHASTA.asdatetime);
end;

procedure TFLiquidarExtrasRecargos.sbtLiquidarConceptosClick(Sender: TObject);
begin
//arreglar validacion convencionales para que acepte las primeras convencionales del mes
  LiquidarSobretiempo;
end;

procedure TFLiquidarExtrasRecargos.dbgPlanillaGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if Field.FieldName ='D' then
  begin
    if Field.AsString<>'' then
    begin
      if EsDomingo(Field.AsInteger) then Background := clRed;
      if EsFestivo(Field.AsInteger) then Background := claqua;
    end;
  end;
end;

procedure TFLiquidarExtrasRecargos.qTurnoEmpleadoCODIGOTURNOValidate(
  Sender: TField);
Var 
    HorasDia:THorasDia;
begin
  if qTurnoEmpleado.state=dsEdit then
  begin
    if qTurnoEmpleadoCODIGOESTADO.Asstring='BLO' then
      raise exception.Create('Este turno no puede ser modificado');
    IniciarHorasDia(HorasDia);
    HorasDia.TipoTurno:=tdMemFiltroCodigoTipoTurno.AsInteger;
    HorasDia.Turno:=Sender.AsInteger;
    if HorasDia.Turno>0 then
      if not ActualizarHorasExtrasTurno(horasdia,qTurnoEmpleadoFECHA.AsDateTime) then
        raise Exception.Create('Este turno se intersecta con horas extras');
  end;
end;

procedure TFLiquidarExtrasRecargos.dbgLiquidacionSobretiempoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  Column.Title.Alignment:=taCenter;
  Column.Field.Alignment:=taCenter;
  if ColorPorcentaje[DataCol]<>$00000000 then
    Column.Color:=ColorPorcentaje[DataCol]
  else
    Column.Color:=clWindow;
end;
// Valida la información de un turno contra las horas extras de ese día
function TFLiquidarExtrasRecargos.ActualizarHorasExtrasTurno(
  var HorasDia: THorasDia;Fecha:TDateTime):boolean;
var Intersecta:boolean;
  HorasExtra:THorasExtra;
  CantidadHoras:Integer;
  Desde,Hasta:TDateTime;
  i:integer;
  pDesdeHasta:^TDesdeHasta;
begin
  qSobreTiempoTurno.Close;
  qSobreTiempoTurno.ParamByName('CODIGOEMPLEADO').AsString:=tdMemFiltroCodigoEmpleado.AsString;
  qSobreTiempoTurno.ParamByName('FECHA').AsDateTime:=Fecha;
  qSobreTiempoTurno.ParamByName('DIASIGUIENTE').AsDateTime:=Fecha+1;
  qSobreTiempoTurno.Open;
  qSobreTiempoTurno.First;
  Intersecta:=False;
  while not qSobreTiempoTurno.Eof do
  begin
    IniciarHorasExtra(HorasExtra);
    Desde:=qSobreTiempoTurno.FieldbyName('FECHAHORADESDE').AsDateTime;
    Hasta:=qSobreTiempoTurno.FieldbyName('FECHAHORAHASTA').AsDateTime;
    CalcularHorasExtra(Fecha,Desde,Hasta,HorasExtra);
    HorasDia.CantidadExtraDiurna:=HorasDia.CantidadExtraDiurna + HorasExtra.CantidadDiurna;
    HorasDia.CantidadExtraNocturna:=HorasDia.CantidadExtraNocturna + HorasExtra.CantidadNocturna;
    if HorasDia.ObservacionExtra<>'' then
      HorasDia.ObservacionExtra:=HorasDia.ObservacionExtra+' / ';
    HorasDia.ObservacionExtra:=HorasDia.ObservacionExtra+qSobreTiempoTurno.FieldbyName('OBSERVACION').AsString;
    if HorasExtra.CantidadDiurna >0 then
    begin
      if HorasDia.DesdeHastaExtraDiurno<>'' then
        HorasDia.DesdeHastaExtraDiurno:=HorasDia.DesdeHastaExtraDiurno + ' / ';
      HorasDia.DesdeHastaExtraDiurno:=HorasDia.DesdeHastaExtraDiurno+HorasExtra.DesdeHastaDiurno;
    end;
    if HorasExtra.CantidadNocturna>0 then
    begin
      if HorasDia.DesdeHastaExtraNocturno<>'' then
        HorasDia.DesdeHastaExtraNocturno:=HorasDia.DesdeHastaExtraNocturno + ' / ';
      HorasDia.DesdeHastaExtraNocturno:=HorasDia.DesdeHastaExtraNocturno+HorasExtra.DesdeHastaNocturno;
    end;
    for i:=0 to HorasDia.DesdeHasta.Count-1 do
    begin
      pDesdeHasta:=HorasDia.DesdeHasta[i];
      if InterseccionHoras(pDesdeHasta.HoraDesde,pDesdeHasta.HoraHasta,Desde,Hasta)>0 then
      begin
        intersecta:=true;
      end;
    end;
    qSobreTiempoTurno.Next;
  end;
  if Intersecta then
  begin
    IniciarHorasDia(HorasDia,false);
    HorasDia.TipoTurno:=tdMemFiltroCodigoTipoTurno.AsInteger;
    for i:=0 to HorasDia.DesdeHasta.Count-1 do
    begin
      pDesdeHasta:=HorasDia.DesdeHasta[i];
      pDesdeHasta.HoraDesde:=Fecha;
      pDesdeHasta.HoraHasta:=Fecha;
    end;
  end;
  Result:=not Intersecta;

  qSobreTiempoConvTurno.Close;
  qSobreTiempoConvTurno.ParamByName('CODIGOEMPLEADO').AsString:=tdMemFiltroCodigoEmpleado.AsString;
  qSobreTiempoConvTurno.ParamByName('FECHA').AsDateTime:=Fecha;
  qSobreTiempoConvTurno.ParamByName('DIASIGUIENTE').AsDateTime:=Fecha+1;
  qSobreTiempoConvTurno.Open;
  qSobreTiempoConvTurno.First;
  Intersecta:=False;
  while not qSobreTiempoConvTurno.Eof do
  begin
    IniciarHorasExtra(HorasExtra);
    Desde:=qSobreTiempoConvTurno.FieldbyName('FECHAHORADESDE').AsDateTime;
    Hasta:=qSobreTiempoConvTurno.FieldbyName('FECHAHORAHASTA').AsDateTime;
    CalcularHorasExtra(Fecha,Desde,Hasta,HorasExtra);
    HorasDia.CantidadExtraDiurnaConv:=HorasDia.CantidadExtraDiurnaConv + HorasExtra.CantidadDiurna;
    HorasDia.CantidadExtraNocturnaConv:=HorasDia.CantidadExtraNocturnaConv + HorasExtra.CantidadNocturna;
    if HorasDia.ObservacionExtra<>'' then
      HorasDia.ObservacionExtra:=HorasDia.ObservacionExtra+' / ';
    HorasDia.ObservacionExtra:=HorasDia.ObservacionExtra+qSobreTiempoConvTurno.FieldbyName('OBSERVACION').AsString;
    if HorasExtra.CantidadDiurna >0 then
    begin
      if HorasDia.DesdeHastaExtraDiurno<>'' then
        HorasDia.DesdeHastaExtraDiurno:=HorasDia.DesdeHastaExtraDiurno + ' / ';
      HorasDia.DesdeHastaExtraDiurno:=HorasDia.DesdeHastaExtraDiurno+HorasExtra.DesdeHastaDiurno;
    end;
    if HorasExtra.CantidadNocturna>0 then
    begin
      if HorasDia.DesdeHastaExtraNocturno<>'' then
        HorasDia.DesdeHastaExtraNocturno:=HorasDia.DesdeHastaExtraNocturno + ' / ';
      HorasDia.DesdeHastaExtraNocturno:=HorasDia.DesdeHastaExtraNocturno+HorasExtra.DesdeHastaNocturno;
    end;
    for i:=0 to HorasDia.DesdeHasta.Count-1 do
    begin
      pDesdeHasta:=HorasDia.DesdeHasta[i];
      if InterseccionHoras(pDesdeHasta.HoraDesde,pDesdeHasta.HoraHasta,Desde,Hasta)>0 then
      begin
       if HorasDia.DesdeConvecional=-1 then
          HorasDia.DesdeConvecional:=qSobreTiempoConvTurnoFECHAHORADESDE.AsDateTime;
        HorasDia.HastaConvencional:=qSobreTiempoConvTurnoFECHAHORAHASTA.AsDateTime;
      end;
    end;
    qSobreTiempoConvTurno.Next;
  end;

  qSobreTiempoDispTurno.Close;
  qSobreTiempoDispTurno.ParamByName('CODIGOEMPLEADO').AsString:=tdMemFiltroCodigoEmpleado.AsString;
  qSobreTiempoDispTurno.ParamByName('FECHA').AsDateTime:=Fecha;
  qSobreTiempoDispTurno.ParamByName('DIASIGUIENTE').AsDateTime:=Fecha+1;
  qSobreTiempoDispTurno.Open;
  qSobreTiempoDispTurno.First;
  Intersecta:=False;
  while not qSobreTiempoDispTurno.Eof do
  begin
    Desde:=qSobreTiempoDispTurno.FieldbyName('FECHAHORADESDE').AsDateTime;
    Hasta:=qSobreTiempoDispTurno.FieldbyName('FECHAHORAHASTA').AsDateTime;
    CantidadHoras:=round((Hasta-Desde)*24);
    if (CantidadHoras>0) then
    begin
      if (HorasDia.CantidadExtraDisponibilidad+CantidadHoras<=8) then
        HorasDia.CantidadExtraDisponibilidad:= HorasDia.CantidadExtraDisponibilidad+CantidadHoras
      else HorasDia.CantidadExtraDisponibilidad:=8;
    end;
    qSobreTiempoDispTurno.Next;
  end;
end;

procedure TFLiquidarExtrasRecargos.FormDestroy(Sender: TObject);
begin
  ListaDomingos.Free;
  ListaFestivos.Free;
  ListaFinalMes.Free;
  ListaTurnosDesde.Free;
  ListaTurnosHasta.Free;
  ListaObservaciones.Free;
  inherited;
end;
// Recibe una lista que contiene los turnos de cada día del mes
//e Inserta un registro de turno por cada día en la tabla turnoempleado
procedure TFLiquidarExtrasRecargos.InsertarRegistrosTurnoEmpleado(DiasMes:TList);
var
  i:integer;
  PDia:PHorasDia;
  HorasDia:THorasDia;
  Fecha:TDateTime;
  Codigo:double;
begin
  qTurnoEmpleado.Close;
  qTurnoEmpleadoDetalle.Close;
  Fecha:=tdMemFiltroFecha.AsDateTime;
  for i := 0 to DiasMes.Count-1 do
  begin
    PDia:=DiasMes[i];
    HorasDia:=PDia^;
    codigo:=InsertarRegistroTurnoEmpleado(HorasDia,fecha);
    InsertarRegistrosTurnoEmpleadoDetalle(HorasDia,codigo);
    Fecha:=Fecha+1;
  end;
  qTurnoEmpleado.Open;
  qTurnoEmpleadoDetalle.Open;
  Application.ProcessMessages;
end;
//Inserta Registros en la planilla a partir de la lista que recibe como parámetro
procedure TFLiquidarExtrasRecargos.InsertarRegistrosPlanilla(DiasMes:TList);
var
  i:integer;
  PDia:PHorasDia;
  HorasDia:THorasDia;
  Fecha:TDateTime;
begin
  qPlanilla.Close;
  qPlanilla.Open;
  Fecha:=tdMemFiltroFecha.AsDateTime;
  for i := 0 to DiasMes.Count-1 do
  begin
    PDia:=DiasMes[i];
    HorasDia:=PDia^;
    InsertarRegistroPlanilla(HorasDia,Fecha);
    Fecha:=Fecha+1;
  end;
  qPlanilla.Close;
  qPlanilla.Open;
end;
//Inserta Registros en turnoempleadodetalle
//a partir de la información del turno que recibe como parámetro
procedure TFLiquidarExtrasRecargos.InsertarRegistrosTurnoEmpleadoDetalle(
  HorasDia: THorasDia;CodigoTurnoEmpleado:double);
var i,j:integer;
   ListaHoras:Tlist;
   pHoras:PHorasTurnoDetalle;
   pDesdeHasta:^TDesdeHasta;
   query,qcodigo:tquery;
begin
  query:=TQuery.Create(self);
  query.DatabaseName:='BaseDato';
  qcodigo := TQuery.Create(Application);
  qcodigo.DatabaseName := 'BaseDato';

  RestarHorasConvencionales(HorasDia);
  try
    for j:=0 to HorasDia.DesdeHasta.count-1 do
    begin
      pDesdeHasta:=HorasDia.DesdeHasta[j];
      CalcularDetalleTurno(pDesdeHasta.HoraDesde,pDesdeHasta.HoraHasta,ListaHoras);
      for i:= 0 to ListaHoras.Count-1 do
      begin
        query.sql.clear;
        query.sql.Add('insert into TURNOEMPLEADODETALLE');
        query.sql.Add('  (CODIGOTURNOEMPLEADODETALLE, CODIGOTURNOEMPLEADO, FECHA, FECHAHORADESDE,');
        query.sql.Add('   FECHAHORAHASTA, CANTIDADDIURNA, CANTIDADNOCTURNA)');
        query.sql.Add('values ');
        query.sql.Add('  (:CODIGOTURNOEMPLEADODETALLE, :CODIGOTURNOEMPLEADO, :FECHA, :FECHAHORADESDE,');
        query.sql.Add('   :FECHAHORAHASTA, :CANTIDADDIURNA, :CANTIDADNOCTURNA)');

        qcodigo.SQL.Text:='SELECT SQ_TURNOEMPLEADODETALLE.NEXTVAL CODIGO FROM DUAL';
        qcodigo.Open;

        PHoras:=ListaHoras[i];
        query.ParamByName('CODIGOTURNOEMPLEADODETALLE').AsFloat:=qcodigo.fields[0].AsFloat;
        query.ParamByName('CODIGOTURNOEMPLEADO').AsFloat:=CodigoTurnoEmpleado;
        query.ParamByName('FECHA').AsDateTime:= phoras.Fecha;
        query.ParamByName('FECHAHORADESDE').AsdateTime:=phoras.HoraDesde;
        query.ParamByName('FECHAHORAHASTA').AsdateTime:=phoras.HoraHasta;
        query.ParamByName('CANTIDADDIURNA').Asinteger:=phoras.CantidadDiurna;
        query.ParamByName('CANTIDADNOCTURNA').Asinteger:=phoras.CantidadNocturna;
        query.ExecSQL;
      end;
    end;
  except
    on e:exception do
    begin
      showmessage(e.message);
    end;
  end;
  query.free;
  qcodigo.free;
end;
//Actualiza información de un turno a partir de los registros de turno detalle
// para la fecha que recibe como parámetro
procedure TFLiquidarExtrasRecargos.ActualizarTurno(var HorasDia: THorasDia;
  Fecha: TDateTime);
var Desde,Hasta:TDateTime;
begin
  qDetalleTurno.Close;
  qDetalleTurno.ParamByName('CODIGOEMPLEADO').AsString:=tdMemFiltroCodigoEmpleado.AsString;
  qDetalleTurno.ParamByName('FECHA').AsDateTime:=Fecha;
  qDetalleTurno.ParamByName('DIASIGUIENTE').AsDateTime:=Fecha+1;
  qDetalleTurno.Open;
  qDetalleTurno.First;
  while not qDetalleTurno.Eof do
  begin
    Desde:=qDetalleTurno.FieldbyName('FECHAHORADESDE').AsDateTime;
    Hasta:=qDetalleTurno.FieldbyName('FECHAHORAHASTA').AsDateTime;
    CalcularHorasTurno(Fecha,Desde,Hasta,HorasDia);
    qDetalleTurno.Next;
  end;
end;

procedure TFLiquidarExtrasRecargos.InsertarRegistroPlanilla(HorasDia: THorasDia;Fecha:TDateTime);
begin
  try
    if (qPlanilla.State in [dsInsert]) then
      qPlanilla.Cancel;
    qPlanilla.Insert;
    qPlanillaDIA.AsDateTime:=Fecha;
    qPlanillaCANTIDADDIURNA.AsInteger:=HorasDia.CantidadDiurna;
    qPlanillaCANTIDADNOCTURNA.AsInteger:=HorasDia.CantidadNocturna;
    qPlanillaOBSERVACION.AsString:=HorasDia.Observacion;
    qPlanillaOBSERVACIONEXTRA.AsString:=HorasDia.ObservacionExtra;
    qPlanillaDESDEHASTADIURNA.AsString:=HorasDia.DesdeHastaDiurno;
    qPlanillaDESDEHASTANOCTURNA.AsString:=HorasDia.DesdeHastaNocturno;
    qPlanillaCANTIDADEXTRADIURNA.AsInteger:=HorasDia.CantidadExtraDiurna;
    qPlanillaCANTIDADEXTRANOCTURNA.AsInteger:=HorasDia.CantidadExtraNocturna;
    qPlanillaCANTIDADEXTRADIURNACONV.AsInteger:=HorasDia.CantidadExtraDiurnaConv;
    qPlanillaCANTIDADEXTRANOCTURNACONV.AsInteger:=HorasDia.CantidadExtraNocturnaConv;
    qPlanillaDESDEHASTAEXTRADIURNA.AsString:=HorasDia.DesdeHastaExtraDiurno;
    qPlanillaDESDEHASTAEXTRANOCTURNA.AsString:=HorasDia.DesdeHastaExtraNocturno;
    qPlanillaCANTIDADEXTRADISPONIBILIDAD.AsInteger:=HorasDia.CantidadExtraDisponibilidad;
    qPlanilla.Post;
  except
    qPlanilla.Cancel;
  end;
end;

function TFLiquidarExtrasRecargos.InsertarRegistroTurnoEmpleado(HorasDia: THorasDia;
  Fecha: TDateTime):double;
var query, qcodigo:tquery;
begin
  query:=TQuery.create(self);
  query.DatabaseName:='BaseDato';
  result:=0;
  qcodigo := TQuery.Create(Application);
  qcodigo.DatabaseName := 'BaseDato';
  try
    query.sql.clear;
    query.sql.add('insert into TURNOEMPLEADO');
    query.sql.add('  (CODIGOTURNOEMPLEADO, CODIGOEMPLEADO, FECHA, CODIGOTIPOTURNO, CODIGOTURNO)');
    query.sql.add('values');
    query.sql.add('  (:CODIGOTURNOEMPLEADO, :CODIGOEMPLEADO, :FECHA, :CODIGOTIPOTURNO, :CODIGOTURNO)');

    qcodigo.SQL.Text:='SELECT SQ_TURNOEMPLEADO.NEXTVAL CODIGO FROM DUAL';
    qcodigo.Open;
    result:=qcodigo.fieldbyname('CODIGO').AsFloat;
    query.ParamByName('CODIGOTURNOEMPLEADO').AsFloat:=qcodigo.fieldbyname('CODIGO').AsFloat;
    query.ParamByName('CODIGOEMPLEADO').AsString:=tdMemFiltroCodigoEmpleado.AsString;
    query.ParamByName('FECHA').AsDateTime:= fecha;
    query.ParamByName('CODIGOTIPOTURNO').AsInteger:=HorasDia.TipoTurno;
    query.ParamByName('CODIGOTURNO').AsInteger:=HorasDia.Turno;

    query.ExecSQL;
  except
    on e:exception do
    begin
      showmessage(e.message);
    end;
  end;
  query.free;
  qcodigo.free;
end;

procedure TFLiquidarExtrasRecargos.sbtImprimirPlanillaClick(Sender: TObject);
begin
  Application.ProcessMessages;
  FQRLiquidarExtrasRecargos:=TFQRLiquidarExtrasRecargos.Create(Application);
  FQRLiquidarExtrasRecargos.ListaDomingos.Assign(ListaDomingos);
  FQRLiquidarExtrasRecargos.ListaFestivos.Assign(ListaFestivos);
  with FQRLiquidarExtrasRecargos do
  begin
    QuickRep.DataSet:=qTurnoEmpleado;
    qrdbDia.DataSet:=qTurnoEmpleado;
    qrdbDia2.DataSet:=qTurnoEmpleado;
    qrdbFecha.DataSet:=tdMemFiltro;

    qrdbPSRNocturnoOrdinario.DataSet:=tdMemPorcentajeConcepto;
    qrdbPSRDiurnoDomingo.DataSet:=tdMemPorcentajeConcepto;
    qrdbPSRNocturnoDomingo.DataSet:=tdMemPorcentajeConcepto;
    qrdbPSRDiurnoFestivo.DataSet:=tdMemPorcentajeConcepto;
    qrdbPSRNocturnoFestivo.DataSet:=tdMemPorcentajeConcepto;
    qrdbPSTDiurnoOrdinario.DataSet:=tdMemPorcentajeConcepto;
    qrdbPSTNocturnoOrdinario.DataSet:=tdMemPorcentajeConcepto;
    qrdbPSTDiurnoDomingoFestivo.DataSet:=tdMemPorcentajeConcepto;
    qrdbPSTNocturnoDomingoFestivo.DataSet:=tdMemPorcentajeConcepto;
    qrdbPSTDiurnoDomingoFestivoAdicional.DataSet:=tdMemPorcentajeConcepto;
    qrdbPSTDiurnoOrdinarioConv.DataSet:=tdMemPorcentajeConcepto;
    qrdbPSTNocturnoOrdinarioConv.DataSet:=tdMemPorcentajeConcepto;
    qrdbPSTDiurnoDomingoFestivoConv.DataSet:=tdMemPorcentajeConcepto;
    qrdbPSTNocturnoDomingoFestivoConv.DataSet:=tdMemPorcentajeConcepto;
    qrdbPSTDisponibilidadSabado.DataSet:=tdMemPorcentajeConcepto;
    qrdbPSTDisponibilidadDomingo.DataSet:=tdMemPorcentajeConcepto;

    qCargo.Close;
    qCargo.ParamByName('CODIGOEMPLEADO').AsString:=tdMemFiltroCodigoEmpleado.AsString;
    qCargo.Open;

    //cOMENTARIADO POR oMAR bARRAGAN HORAS EXTRAS HONDURAS
    {qZONAESSA.Close;
    qZONAESSA.ParamByName('CODIGOEMPLEADO').AsString:=tdMemFiltroCodigoEmpleado.AsString;
    qZONAESSA.Open; }
    
    qrdbNombreCia.DataSet:=qCIA;
    qrdbNombreEmpleado.DataSet:=qEmpleado;
    qrdbCedulaEmpleado.DataSet:=tdMemFiltro;
    qrdbFecha.DataSet:=tdMemFiltro;
    qrdbCantidadDiurna.DataSet:=qTurnoEmpleado;
    qrdbCantidadNocturna.DataSet:=qTurnoEmpleado;
    qrdbDeaDiurno.DataSet:=qTurnoEmpleado;
    qrdbDeaNocturno.DataSet:=qTurnoEmpleado;
    qrdbObservacion.DataSet:=qTurnoEmpleado;
    qrdbCantidadExtraDiurna.DataSet:=qTurnoEmpleado;
    qrdbCantidadExtraNocturna.DataSet:=qTurnoEmpleado;
    qrdbDeaExtraDiurno.DataSet:=qTurnoEmpleado;
    qrdbDeaExtraNocturno.DataSet:=qTurnoEmpleado;
    qrdbObservacionExtra.DataSet:=qTurnoEmpleado;
    qrdbDisponibilidad.DataSet:=qTurnoEmpleado;

    qrdbSRNocturnoOrdinario.DataSet:=tdMemCantidadConcepto;
    qrdbSRDiurnoDomingo.DataSet:=tdMemCantidadConcepto;
    qrdbSRNocturnoDomingo.DataSet:=tdMemCantidadConcepto;
    qrdbSRDiurnoFestivo.DataSet:=tdMemCantidadConcepto;
    qrdbSRNocturnoFestivo.DataSet:=tdMemCantidadConcepto;
    qrdbSTDiurnoOrdinario.DataSet:=tdMemCantidadConcepto;
    qrdbSTNocturnoOrdinario.DataSet:=tdMemCantidadConcepto;
    qrdbSTDiurnoDomingoFestivo.DataSet:=tdMemCantidadConcepto;
    qrdbSTNocturnoDomingoFestivo.DataSet:=tdMemCantidadConcepto;
    qrdbSTDiurnoDomingoFestivoAdicional.DataSet:=tdMemCantidadConcepto;
    qrdbSTDiurnoOrdinarioConv.DataSet:=tdMemCantidadConcepto;
    qrdbSTNocturnoOrdinarioConv.DataSet:=tdMemCantidadConcepto;
    qrdbSTDiurnoDomingoFestivoConv.DataSet:=tdMemCantidadConcepto;
    qrdbSTNocturnoDomingoFestivoConv.DataSet:=tdMemCantidadConcepto;
    qrdbSTDisponibilidadSabado.DataSet:=tdMemCantidadConcepto;
    qrdbSTDisponibilidadDomingo.DataSet:=tdMemCantidadConcepto;

    if tdMemFiltroTipoHorario.AsString<>'T' then
    begin
      qrdbCantidadDiurna.Enabled:=false;
      qrdbCantidadNocturna.Enabled:=false;
      qrdbDeaDiurno.Enabled:=false;
      qrdbDeaNocturno.Enabled:=False;
      qrdbObservacion.Enabled:=False;
    end;

    QuickRep.Preview;
  end;
  Application.ProcessMessages;
end;

procedure TFLiquidarExtrasRecargos.qTurnoEmpleadoCODIGOTURNOChange(
  Sender: TField);
var i,j,k:integer;
  Query:TQuery;
  turnos:array [0..2]of integer;
  tipos:array [0..2]of integer;
  Codigos:array [0..2]of integer;
  ArregloHorasdia:array[0..2] of THorasDia;
  pDesdeHasta:^TDesdeHasta;
  TurnosDesde,TurnosHasta:tStringList;
begin
  if qTurnoEmpleado.State=dsEdit then
  begin
    for i:=0 to 2 do
    begin
      turnos[i]:=0;
      tipos[i]:=0;
      codigos[i]:=0;
    end;
    turnos[1]:=Sender.AsInteger;
    Codigos[1]:=qTurnoEmpleadoCODIGOTURNOEMPLEADO.AsInteger;
    tipos[1]:=qTurnoEmpleadoCODIGOTIPOTURNO.AsInteger;    
    Query:=TQuery.Create(Application);
    Query.DatabaseName:='BaseDato';
    Query.sql.Clear;
    Query.sql.Add('SELECT CODIGOTURNOEMPLEADO,CODIGOTIPOTURNO,CODIGOTURNO ');
    Query.sql.Add('FROM TURNOEMPLEADO WHERE FECHA=TO_DATE(''');
    Query.sql.Add(FormatoFecha(qTurnoEmpleadoFECHA.asdatetime-1) + ''',''MM/DD/YYYY'')');
    Query.sql.Add('AND CODIGOEMPLEADO='+qTurnoEmpleadoCODIGOEMPLEADO.AsString);
    Query.Open;
    turnos[0]:=Query.fieldbyname('CODIGOTURNO').AsInteger;
    Tipos[0]:=Query.fieldbyname('CODIGOTIPOTURNO').AsInteger;
    codigos[0]:=Query.fieldbyname('CODIGOTURNOEMPLEADO').AsInteger;
    Query.Close;
    Query.sql.Clear;
    Query.sql.Add('SELECT CODIGOTURNOEMPLEADO,CODIGOTIPOTURNO,CODIGOTURNO ');
    Query.sql.Add('FROM TURNOEMPLEADO WHERE FECHA=TO_DATE(''');
    Query.sql.Add(FormatoFecha(qTurnoEmpleadoFECHA.asdatetime+1) + ''',''MM/DD/YYYY'')');
    Query.sql.Add('AND CODIGOEMPLEADO='+qTurnoEmpleadoCODIGOEMPLEADO.AsString);
    Query.Open;
    turnos[2]:=Query.fieldbyname('CODIGOTURNO').AsInteger;
    Tipos[2]:=Query.fieldbyname('CODIGOTIPOTURNO').AsInteger;
    codigos[2]:=Query.fieldbyname('CODIGOTURNOEMPLEADO').AsInteger;
    for i:=0 to 2 do
    begin
      IniciarHorasDia(ArregloHorasdia[i]);
      ArregloHorasdia[i].TipoTurno:=tipos[i];
      ArregloHorasdia[i].Turno:=turnos[i];
      if ArregloHorasdia[i].Turno>0 then
      begin
        ListarTurnos(ArregloHorasdia[i].TipoTurno);
        FiltrarTurnosDesdeHasta(ArregloHorasdia[i].Turno,ListaTurnosDesde,ListaTurnosHasta,TurnosDesde,TurnosHasta);
        for k:=0 to TurnosDesde.Count-1 do
        begin
          // se le restan dos días debido a las fechas de tipo turno detalle basadas en el día 1
          new(pDesdeHasta);
          pDesdeHasta.HoraDesde:=qTurnoEmpleadoFECHA.AsDateTime + i + StrToDateTime(TurnosDesde[k])-2;
          pDesdeHasta.HoraHasta:=qTurnoEmpleadoFECHA.AsDateTime + i + StrToDateTime(TurnosHasta[k])-2;
          ArregloHorasdia[i].DesdeHasta.Add(pDesdeHasta);
        end;
        ActualizarHorasExtrasTurno(ArregloHorasdia[i],qTurnoEmpleadoFECHA.AsDateTime+ i-1 )
      end
      else
      begin
        new(pDesdeHasta);
        pDesdeHasta.HoraDesde:=qTurnoEmpleadoFECHA.AsDateTime + i -1;
        pDesdeHasta.HoraHasta:=qTurnoEmpleadoFECHA.AsDateTime + i -1;
        ArregloHorasdia[i].DesdeHasta.Add(pDesdeHasta);
        ArregloHorasdia[i].Observacion:=ListaObservaciones.Values[inttostr(ArregloHorasdia[i].Turno)];
      end;
      Query.sql.Text:='DELETE FROM TURNOEMPLEADODETALLE WHERE CODIGOTURNOEMPLEADO='
        + inttostr(codigos[i]);
      Query.ExecSQL;
      if codigos[i]<=0 then
      begin
        Query.Close;
        Query.SQL.Text:='SELECT SQ_TURNOEMPLEADO.NEXTVAL CODIGO FROM DUAL';
        Query.Open;
        j:=0;
        if Query.fieldbyname('CODIGO').AsString<>'' then
          j:=Query.fieldbyname('CODIGO').AsInteger;
        query.sql.Clear;
        Query.sql.Add('INSERT INTO TURNOEMPLEADO(CODIGOTURNOEMPLEADO,CODIGOEMPLEADO,FECHA,CODIGOTIPOTURNO,');
        Query.sql.Add('CODIGOTURNO,CODIGOESTADO) VALUES('+ inttostr(j)+ ','+tdMemFiltroCodigoEmpleado.AsString);
        Query.sql.Add(', TO_DATE(''' + FormatoFecha(qTurnoEmpleadoFECHA.asdatetime + i-1) + ''',''MM/DD/YYYY'')');
        Query.sql.Add(', ' + tdMemFiltroCodigoTipoTurno.AsString+',0,'''')');
        Query.ExecSQL;
        codigos[i]:=j;
      end;
      InsertarRegistrosTurnoEmpleadoDetalle(ArregloHorasdia[i],codigos[i]);
    end;
    qTurnoEmpleadoDetalle.Close;
    qTurnoEmpleadoDetalle.Open;
    dbgTurnoDetalle.Repaint;
    Application.ProcessMessages;
    for i:=0 to 2 do
    begin
      ActualizarTurno(ArregloHorasdia[i],qTurnoEmpleadoFECHA.AsDateTime+i-1);
      Query.Close;
      query.sql.Clear;
      query.sql.Add('UPDATE PLANILLATURNOEMPLEADO SET CANTIDADDIURNA=');
      query.sql.Add(Inttostr(ArregloHorasDia[i].CantidadDiurna)+',');
      query.sql.Add('CANTIDADNOCTURNA='+Inttostr(ArregloHorasDia[i].CantidadNocturna)+',');
      query.sql.Add('OBSERVACION='''+ArregloHorasDia[i].Observacion+''',');
      query.sql.Add('DESDEHASTADIURNA='''+ArregloHorasDia[i].DesdeHastaDiurno+''',');
      query.sql.Add('DESDEHASTANOCTURNA='''+ArregloHorasDia[i].DesdeHastaNocturno+'''');
      query.sql.Add('WHERE DIA=TO_DATE(''' + FormatoFecha(qTurnoEmpleadoFECHA.asdatetime+i-1) + ''',''MM/DD/YYYY'')');
      query.sql.Add('AND FECHA=TO_DATE(''' + FormatoFecha(tdMemFiltroFecha) + ''',''MM/DD/YYYY'')');
      query.sql.Add('AND CODIGOEMPLEADO='+tdMemFiltroCodigoEmpleado.AsString );
      Query.ExecSQL;
    end;
    Query.Free;
    bmTurnoEmpleado := qTurnoEmpleado.GetBookmark;
    qTurnoEmpleado.Post;
    qTurnoEmpleado.Close;
    qTurnoEmpleado.Open;
    qTurnoEmpleado.GotoBookmark(bmTurnoEmpleado);
    Application.ProcessMessages;
  end;
end;

procedure TFLiquidarExtrasRecargos.dbgCantidadSobreTiempoDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  if ColorConcepto[DataCol]<>$00000000 then
    Column.Color:=ColorConcepto[DataCol]
  else
    Column.Color:=clWindow;
end;
//actualiza la lista de turnos para un tipos de turno
procedure TFLiquidarExtrasRecargos.ListarTurnos(tipo:integer);
var query:tquery;
begin
  qDescripcionTurno.Close;
  qDescripcionTurno.Open;
  qTipoTurnoProgramacion.Close;
  qTipoTurnoProgramacion.Open;
  qTipoTurnoProgramacion.First;
  ListaTurnosDesde.Clear;
  ListaTurnosHasta.Clear;
  ListaObservaciones.Clear;
  query:=TQuery.create(self);
  query.DatabaseName:='BaseDato';
  query.sql.add('SELECT CODIGOTIPOTURNO,CODIGOTURNO,JORNADA,');
  query.sql.add('FECHADESDE, FECHAHASTA,DESCRIPCION');
  query.sql.add('FROM TIPOTURNODETALLE');
  query.sql.add('WHERE CODIGOTIPOTURNO='+inttostr(tipo));
  query.sql.add('ORDER BY 1,2,3');
  query.open;
  while not query.Eof do
  begin
    ListaTurnosDesde.Add(query.fieldbyname('CODIGOTURNO').asstring+'='+query.fieldbyname('FECHADESDE').asstring) ;
    ListaTurnosHasta.Add(query.fieldbyname('CODIGOTURNO').asstring+'='+query.fieldbyname('FECHAHASTA').asstring) ;
    ListaObservaciones.Add(query.fieldbyname('CODIGOTURNO').asstring+'='+query.fieldbyname('DESCRIPCION').asstring) ;
    query.Next;
  end;
  qTipoTurnoProgramacion.First;
  query.free;
end;
//consulta el tipo de turno para un empleado
//si tiene registros de turnoempleado o de programacion
function TFLiquidarExtrasRecargos.ConsultarTipoTurno: integer;
var query:TQuery;
begin
  result:=0;
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('SELECT CODIGOTIPOTURNO FROM PLANILLAMESEMPLEADO WHERE CODIGOEMPLEADO='+tdMemFiltroCodigoEmpleado.AsString);
  Query.SQL.Add('AND FECHA = TO_DATE(''' + FormatoFecha(tdMemFiltroFecha) + ''',''MM/DD/YYYY'')');
  query.Open;
  if Query.RecordCount>0 then
  begin
    result:=Query.FieldByName('CODIGOTIPOTURNO').AsInteger;
  end
  else
  begin
    query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('SELECT CODIGOTIPOTURNOPROGRAMACION FROM PROGRAMACION P,CALENDARIOPROGRAMACION C');
    Query.SQL.Add('WHERE P.CODIGOPROGRAMACION=C.CODIGOPROGRAMACION');
    Query.SQL.Add('AND C.CODIGOEMPLEADO='+tdMemFiltroCodigoEmpleado.AsString);
    Query.SQL.Add('AND C.FECHA = TO_DATE(''' + FormatoFecha(tdMemFiltroFecha) + ''',''MM/DD/YYYY'')');
    Query.Open;
    result:=Query.FieldByName('CODIGOTIPOTURNOPROGRAMACION').AsInteger;
  end;
  query.free;
end;
//Carga la liquidacion de la tabla sip_extra_tiempo a las tablas temporales
procedure TFLiquidarExtrasRecargos.VerLiquidacion;
var  Conceptos:TConceptosExtras;
begin
  Conceptos:=CalcularCantidadesConceptos;
  AsignarCantidadesConceptosTemporales(Conceptos);
  AsignarCantidadesPorcentajesTemporales;
  Conceptos.Free;
end;
//Inserta registros de liquidacion en la tabla sip_extra_tiempo
procedure TFLiquidarExtrasRecargos.InsertarRegistrosLiquidacion(
  Conceptos: TConceptosExtras);
var i,j:Integer;
begin
  Application.ProcessMessages;
  qLiquidacion.close;
  qLiquidacion.open;  
  try
//    qLiquidacion.Database.StartTransaction;
    with Conceptos do
    begin
      for i:=0 to 15 do
      begin
        if Cantidades[i]>0 then
        begin
          if qLiquidacion.State in [dsEdit,dsInsert] then
            qLiquidacion.Cancel;
          qLiquidacion.Insert;
          qLiquidacionCONCEPTO.AsInteger:=CodigoConceptos[i];
          for j:=1 to 31 do
            if CantidadesDias[i,j]>0 then
              qLiquidacion.FieldByName('DIA_'+InttoStr(j)).AsInteger:=CantidadesDias[i,j];
          qLiquidacion.Post;
        end;
      end;
    end;
//    qLiquidacion.Database.Commit;
  except
//    qLiquidacion.Database.Rollback;
  end;
end;

procedure TFLiquidarExtrasRecargos.qLiquidacionAfterPost(DataSet: TDataSet);
begin
  inherited;
  qLiquidacion.ApplyUpdates;
  qLiquidacion.CommitUpdates;
end;

procedure TFLiquidarExtrasRecargos.qLiquidacionAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qLiquidacion.ApplyUpdates;
  qLiquidacion.CommitUpdates;
end;

procedure TFLiquidarExtrasRecargos.qLiquidacionAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('CODIGO').AsString:=tdMemFiltroCodigoEmpleado.AsString;
  DataSet.FieldByName('ANO_SBT').AsString:=tdMemFiltroAno.AsString;
  DataSet.FieldByName('MES_SBT').AsString:=tdMemFiltroMes.AsString;
  DataSet.FieldByName('FECHA').Asdatetime:=now;
  DataSet.FieldByName('USUARIO').AsInteger:=VarCodigoUsuario;
end;
//asigna la cantidad de horas a cada porcentaje
procedure TFLiquidarExtrasRecargos.AsignarCantidadesPorcentajesTemporales;
const Colores: array [0..11] of TColor=($00FFFFFF,$00DFEFEF,$00DFDFDF,
                                       $00BFCFCF,$00BFBFBF,$009FAFAF,
                                       $009F9F9F,$007F8F8F,$007F7F7F,
                                       $005F6F6F,$005F5F5F,$003F4F4F);

var i,j,pos,Cantidad:Integer;
  Porcentajes,Cantidades:TStringList;
  Porcentaje,NombreCampo,temp:String;
begin
  Porcentajes:=TStringList.Create;
  Cantidades:=TStringList.Create;
  for i := 0 to dbgCantidadSobreTiempo.Columns.Count-1 do
  begin
    NombreCampo:=dbgCantidadSobreTiempo.Fields[i].FieldName;
    Porcentaje:=tdMemPorcentajeConcepto.FieldByName(NombreCampo).AsString;
    if Porcentaje<>'' then
    begin
      Cantidad:=tdMemCantidadConcepto.FieldByName(NombreCampo).AsInteger;
      pos:=Porcentajes.IndexOf(Porcentaje);
      if pos=-1 then
      begin
        pos:=Porcentajes.Add(Porcentaje);
        Cantidades.Insert(pos,inttostr(Cantidad));
      end
      else
        Cantidades[pos]:=inttostr(strtoint(Cantidades[pos])+Cantidad);
    end;
  end;
  if Porcentajes.Count>2 then
  begin
    for i:=0 to Porcentajes.Count-2 do
    begin
      for j:=i+1 to Porcentajes.Count-1 do
      begin
//        Porcentajes.SaveToFile('c:\a.txt');
        if strtoint(Porcentajes[j])<strtoint(Porcentajes[i]) then
        begin
          temp:=Porcentajes[j];
          Porcentajes[j]:=Porcentajes[i];
          Porcentajes[i]:=temp;
          temp:=Cantidades[j];
          Cantidades[j]:=Cantidades[i];
          Cantidades[i]:=temp;
        end;
      end;
    end;
    for i:=0 to Porcentajes.count-1 do
    begin
      ColorPorcentaje[i]:=Colores[i];
      for j := 0 to dbgCantidadSobreTiempo.Columns.Count-1 do
      begin
        NombreCampo:=dbgCantidadSobreTiempo.Columns[j].Field.FullName;
        Porcentaje:=tdMemPorcentajeConcepto.FieldbyName(NombreCampo).AsString;
        if Porcentaje=Porcentajes[i] then
          ColorConcepto[j]:=Colores[i];
      end;
    end;
    with tdMemCantidadPorcentaje do
    begin
      Close;
      with FieldDefs do
      begin
        Clear;
        for i := 0 to Porcentajes.count-1 do
        begin
          Add(Porcentajes[i]+'%', ftInteger, 0, True);
        end;
      end;
      Open;
      Insert;
      for i := 0 to Cantidades.count-1 do
      begin
        Fields[i].AsString:=Cantidades[i];
      end;
      Post;
    end;
  end;
  dbgLiquidacionSobretiempo.Repaint;
  dbgCantidadSobreTiempo.Repaint;
end;
//Devuelve la cantidad para un nombre de concepto
function Indice(NombreConcepto: string): integer;
var i:integer;
begin
  result:=-1;
  for i:=0 to 15 do
  begin
    if (CompareText(NombreConcepto,NombreConceptos[i])=0) then
    begin
      result:=i;
      break;
    end;
  end;
end;



{ TConceptosExtras }
constructor TConceptosExtras.create;
var i,j:integer;
begin
  for i:=0 to 15 do
  begin
    for j:=1 to 31 do
    begin
      CantidadesDias[i,j]:=0;
    end;
    Cantidades[i]:=0;
  end;
end;
//totaliza las cantidades por concepto
procedure TConceptosExtras.SumarCantidades;
var i,j:integer;
begin
  for i:=0 to 15 do
  begin
    for j:=1 to 31 do
    begin
      Cantidades[i]:=Cantidades[i] + CantidadesDias[i,j];
    end;
  end;
end;

procedure TFLiquidarExtrasRecargos.seAgnosChange(Sender: TObject);
var
  YearActual, MesActual, DiaActual: Word;
  Hoy: TDateTime;
begin
  DecodeDate(dbEdFecha.Date, Year, Month, Day);
  Year := seAgnos.Value;

  Hoy := Now;
  DecodeDate(Hoy, YearActual, MesActual, DiaActual);

  if (Year > YearActual) or ((Year = YearActual) and (Month > MesActual)) then
  begin
    seAgnos.Value:= seAgnos.Value-1;
    raise Exception.Create('No se pueden generar planillas de meses futuros.');
  end;

  dbEdFecha.Date := StrToDate(IntToStr(Day) + '/' + IntToStr(Month) + '/' + IntToStr(Year));
end;

procedure TFLiquidarExtrasRecargos.qTurnoEmpleadoAfterOpen(DataSet: TDataSet);
var Query:TQuery;
begin
  if qPlanillaMesEmpleado.RecordCount=1 then
  begin
    if (qPlanillaMesEmpleado.FieldByName('CODIGOESTADOPLANILLA').AsString = 'LIQ') then
    begin
      VerLiquidacion;
      sbtGenerarPlanilla.Enabled := True;
      sbtImprimirPlanilla.Enabled:=false;
      sbtmirarLiquidacion.Enabled:= TRUE;
      sbtLiquidarConceptos.Enabled:=True;
      sbtActualizarExtras.Enabled := True;
      if (tdMemFiltroREABRIR.AsString='S') or (VarCodigoUsuario=0) then
        begin
          Query := TQuery.Create(Application);
          Query.DatabaseName := 'BaseDato';
          Query.SQL.Add('select sign( sysdate - (last_day(to_date(''' + FormatoFecha(tdMemFiltroFecha) + ''',''MM/DD/YYYY''))+1))  from dual ');
          Query.Open;

          // pILAS ES NECESARIO QUITAR ESTE COMENTARIO A LA ENTRADA EN PRODUCCION...........
          //if Query.Fields[0].AsInteger = 1 then
            sbtAprobarPlanilla.Enabled := True;
          Query.Free;
        end
    end
    else
    begin
      if (qPlanillaMesEmpleado.FieldByName('CODIGOESTADOPLANILLA').AsString = 'BLO') then
      begin
        VerLiquidacion;
        sbtImprimirPlanilla.Enabled:=true;
        sbtmirarLiquidacion.Enabled:=TRUE;
      end
      else
      begin
        PanelDetalle.Visible:=True;
        VerDetalleTurnosDa1.Checked:=True;
        sbtGenerarPlanilla.Enabled := True;
        sbtLiquidarConceptos.Enabled:=True;
        sbtActualizarExtras.Enabled := True;
      end;
    end;
  end
  else
  begin
    sbtGenerarPlanilla.Enabled := True;
  end;
end;

procedure TFLiquidarExtrasRecargos.qTurnoEmpleadoAfterClose(DataSet: TDataSet);
begin
  sbtGenerarPlanilla.Enabled:=false;
  sbtImprimirPlanilla.Enabled:=false;
  sbtmirarLiquidacion.Enabled:=FALSE;
  sbtLiquidarConceptos.Enabled:=false;
  sbtActualizarExtras.Enabled := false;
  PanelDetalle.Visible:=False;
  VerDetalleTurnosDa1.checked:=False;
  tdMemCantidadConcepto.Close;
  tdMemCantidadPorcentaje.close;
  sbtAprobarPlanilla.Enabled := False;
  Escritura:=false;
end;
//Inicia las variables colorconceptos y colorporcentajes
procedure TFLiquidarExtrasRecargos.IniciarColores;
var i:integer;
begin
  for i:=0 to 10 do
  begin
    ColorConcepto[i]:=$00000000;
    ColorPorcentaje[i]:=$00000000;
  end;
  dbgCantidadSobreTiempo.Repaint;
  dbgLiquidacionSobretiempo.RePaint;
end;


procedure TFLiquidarExtrasRecargos.tdMemFiltroCodigoTipoTurnoChange(
  Sender: TField);
begin
  inherited;
  ListarTurnos(sender.asinteger);
  qTurnoEmpleado.Close;
  qTurnoEmpleado.Open;
  qTipoHorario.Close;
  qTipoHorario.Open;
  tdMemFiltroTipoHorario.AsString:=qTipoHorarioTIPOHORARIO.AsString;
end;
//Resta horas extras convencionales del turno normal para que no sean doblemente contabilizadas
procedure TFLiquidarExtrasRecargos.RestarHorasConvencionales(
  var Horas: THorasDia);
var  pDesdeHasta:^TDesdeHasta;
  i:integer;
begin
  if Horas.DesdeConvecional>-1 then
  begin
    for i:=0 to Horas.DesdeHasta.Count-1 do
    begin
      pDesdeHasta:=Horas.DesdeHasta[i];
      if pDesdeHasta.HoraHasta>Horas.DesdeConvecional then
        pDesdeHasta.HoraHasta:=Horas.DesdeConvecional;
    end;
  end;
end;

procedure TFLiquidarExtrasRecargos.qOdtSobreTiempoDetalleCONVENCIONALValidate(
  Sender: TField);
begin
  if Sender.AsString='S' then
  begin
    if (qOdtSobreTiempoDetalleCANTIDADDIURNA.AsInteger+qOdtSobreTiempoDetalleCANTIDADNOCTURNA.AsInteger)>3 then
      raise Exception.Create('Las horas extras convencionales deben ser iguales a tres');
  end;
end;

procedure TFLiquidarExtrasRecargos.qOdtSobreTiempoDetalleAfterPost(
  DataSet: TDataSet);
begin
  qOdtSobreTiempoDetalle.ApplyUpdates;
  qOdtSobreTiempoDetalle.CommitUpdates;
end;

procedure TFLiquidarExtrasRecargos.InsertarRegistroPlanillaMes;
begin
  try
    if (qPlanillaMesEmpleado.State in [dsInsert,dsEdit]) then
      qPlanillaMesEmpleado.Cancel;
    qPlanillaMesEmpleado.Insert;
    qPlanillaMesEmpleado.Post;
  except
    qPlanillaMesEmpleado.Cancel;
  end;
end;

procedure TFLiquidarExtrasRecargos.qPlanillaMesEmpleadoAfterPost(
  DataSet: TDataSet);
begin
  inherited;
  qPlanillaMesEmpleado.ApplyUpdates;
  qPlanillaMesEmpleado.CommitUpdates;
end;

procedure TFLiquidarExtrasRecargos.qPlanillaMesEmpleadoAfterInsert(
  DataSet: TDataSet);
begin
  DataSet.FieldByName('CodigoEmpleado').AsString:=tdMemFiltroCodigoEmpleado.AsString;
  DataSet.FieldByName('Fecha').AsString:=tdMemFiltroFecha.AsString;
  DataSet.FieldByName('CodigoTipoTurno').AsString:=tdMemFiltroCodigoTipoTurno.AsString;
  DataSet.FieldByName('CodigoEstadoPlanilla').AsString:='GEN';
  DataSet.FieldByName('CodigoUsuarioCreacion').AsInteger:=VarCodigoUsuario;
  DataSet.FieldByName('FechaCreacion').AsString:=FechaServidor;
end;



//Cambia el estado de turnoempleado,planillaturnoempleado y planillamesempleado
//asignándoles el valor que recibe como parámetro
procedure TFLiquidarExtrasRecargos.AsignarEstadoPlanillas(Estado: string);
Var Query:TQuery;
begin
  if (tdMemFiltroCodigoEmpleado.AsString<>'')
  and (tdMemFiltroInicioMes.AsString<>'')
  and (tdMemFiltroFinMes.AsString<>'')  then
  begin
    Query := TQuery.Create(Application);
    Query.DatabaseName := 'BaseDato';
    Query.SQL.Clear;
    Query.SQL.Add('UPDATE PLANILLAMESEMPLEADO SET CODIGOESTADOPLANILLA = '''+Estado+'''');
    Query.SQL.Add('WHERE CODIGOEMPLEADO = ' + tdMemFiltroCodigoEmpleado.AsString);
    Query.SQL.Add('AND FECHA = TO_DATE(''' + FormatoFecha(tdMemFiltroFecha) + ''',''MM/DD/YYYY'')');
    Query.ExecSQL;

    Query.SQL.Clear;
    Query.SQL.Add('UPDATE PLANILLATURNOEMPLEADO SET CODIGOESTADOPLANILLA = '''+Estado+'''');
    Query.SQL.Add('WHERE CODIGOEMPLEADO = ' + tdMemFiltroCodigoEmpleado.AsString);
    Query.SQL.Add('AND FECHA = TO_DATE(''' + FormatoFecha(tdMemFiltroFecha) + ''',''MM/DD/YYYY'')');
    Query.ExecSQL;
    Query.SQL.Clear;
    Query.SQL.Add('UPDATE TURNOEMPLEADO SET CODIGOESTADO =  '''+Estado+'''');
    Query.SQL.Add('WHERE CODIGOEMPLEADO = ' + tdMemFiltroCodigoEmpleado.AsString);
    Query.SQL.Add('AND FECHA >= TO_DATE(''' + FormatoFecha(tdMemFiltroInicioMes) + ''',''MM/DD/YYYY'')');
    Query.SQL.Add('AND FECHA <= TO_DATE(''' + FormatoFecha(tdMemFiltroFinMes) + ''',''MM/DD/YYYY'')');
    Query.ExecSQL;

    Query.SQL.Clear;
    Query.SQL.Add('UPDATE ODTSOBRETIEMPODETALLE SET ESTADO =  '''+Estado+'''');
    Query.SQL.Add('WHERE CODIGOEMPLEADO = ' + tdMemFiltroCodigoEmpleado.AsString);
    Query.SQL.Add('AND FECHAHORAHASTA >= TO_DATE(''' + FormatoFecha(tdMemFiltroInicioMes) + ''',''MM/DD/YYYY'')');
    Query.SQL.Add('AND FECHAHORAHASTA <= TO_DATE(''' + FormatoFecha(tdMemFiltroFinMes) + ''',''MM/DD/YYYY'')');
    Query.ExecSQL;

    Query.Free;
  end;
end;

procedure TFLiquidarExtrasRecargos.qPlanillaMesEmpleadoCODIGOESTADOPLANILLAValidate(
  Sender: TField);
begin
  if sender.AsString = 'BLO' then
  begin
    if not (ValidarLiquidacionNomina) then
      raise Exception.create('Ya existen registros en Nómina para este empleado este mes.');
    dbgTurnoEmpleado.ReadOnly:=true;
    DBNavigator2.VisibleButtons:=[nbFirst, nbPrior, nbNext, nbLast];
  end
  else
  begin
    dbgTurnoEmpleado.ReadOnly:=false;
    DBNavigator2.VisibleButtons:=[nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel];
  end;
end;


procedure TFLiquidarExtrasRecargos.VerDetalleTurnosDa1Click(Sender: TObject);
begin
  inherited;
  if VerDetalleTurnosDa1.Checked then
    PanelDetalle.Visible:=false
  else
    PanelDetalle.Visible:=true;
  VerDetalleTurnosDa1.Checked:=not VerDetalleTurnosDa1.Checked;
end;

procedure TFLiquidarExtrasRecargos.dMenuCIASelectID(Sender: tnMenuItem;
  ID: Integer; MenuEstructura: tMenuEs);
begin
  inherited;
  tdMemFiltroCodigoAdministrativo.AsInteger:=ID;
end;

procedure TFLiquidarExtrasRecargos.qDescripcionTurnoCalcFields(
  DataSet: TDataSet);
begin
  if qDescripcionTurnoCODIGOTURNO.AsString<>'' then
  begin
    case qDescripcionTurnoCODIGOTURNO.AsInteger of
      -2: qDescripcionTurnoDESDEHASTA.AsString:='INCAPACIDAD';
      -1: qDescripcionTurnoDESDEHASTA.AsString:='VACACIONES';
      -3: qDescripcionTurnoDESDEHASTA.AsString:='PERMISO NO REMUNERADO';
      -4: qDescripcionTurnoDESDEHASTA.AsString:='PERMISO REMUNERADO';
      -5: qDescripcionTurnoDESDEHASTA.AsString:='CALAMIDAD';
      -6: qDescripcionTurnoDESDEHASTA.AsString:='OTRO PERMISO';
       0: qDescripcionTurnoDESDEHASTA.AsString:='DESCANSO';

       else
       begin
        if (qDescripcionTurnoCODIGOTURNO.AsInteger >0)and
           (qDescripcionTurnoMINFECHADESDE.AsString<>'')and
           (qDescripcionTurnoMAXFECHAHASTA.AsString<>'')then
        begin
          qDescripcionTurnoDESDEHASTA.AsString:= 'De '+
           FormatDateTime('HH : NN',qDescripcionTurnoMINFECHADESDE.AsDateTime)+
          ' a ' + FormatDateTime('HH:NN',qDescripcionTurnoMAXFECHAHASTA.AsDateTime);
        end;
       end;
    end;
  end;
end;

procedure TFLiquidarExtrasRecargos.qTurnoEmpleadoBeforeOpen(
  DataSet: TDataSet);
begin
  qPlanillaMesEmpleado.Open;
end;

procedure TFLiquidarExtrasRecargos.qTurnoEmpleadoBeforeClose(
  DataSet: TDataSet);
begin
  qPlanillaMesEmpleado.Close;
  sbtAprobarPlanilla.Enabled:=false;  
end;

//consulta los conceptos por empleado
procedure TFLiquidarExtrasRecargos.AsignarConceptos;
var Query:TQuery;
    i:Integer;
    sl:TStringList;
begin
  sl:=TStringList.Create;
  sl.Add('AND ABREVIADO LIKE ''%SOB%'' AND ABREVIADO LIKE ''%DIU%'' AND ABREVIADO LIKE ''%ORD%''');
  sl.Add('AND ABREVIADO LIKE ''%SOB%'' AND ABREVIADO LIKE ''%NOC%'' AND ABREVIADO LIKE ''%ORD%''');
  sl.Add('AND ABREVIADO LIKE ''%SOB%'' AND ABREVIADO LIKE ''%DIU%'' AND ABREVIADO LIKE ''%DOM%''');
  sl.Add('AND ABREVIADO LIKE ''%SB%'' AND ABREVIADO LIKE ''%D-F%'' AND ABREVIADO LIKE ''%>8%''');
  sl.Add('AND ABREVIADO LIKE ''%SOB%'' AND ABREVIADO LIKE ''%NOC%'' AND ABREVIADO LIKE ''%DOM%''');
  sl.Add('AND ABREVIADO LIKE ''%SOBREREM%''');
  sl.Add('AND ABREVIADO LIKE ''%TURNO%'' AND ABREVIADO LIKE ''%DIU%'' AND ABREVIADO LIKE ''%DOM%''');
  sl.Add('AND ABREVIADO LIKE ''%TURNO%'' AND ABREVIADO LIKE ''%NOC%'' AND ABREVIADO LIKE ''%DOM%''');
  sl.Add('AND ABREVIADO LIKE ''%TURNO%'' AND ABREVIADO LIKE ''%DIU%'' AND ABREVIADO LIKE ''%FES%''');
  sl.Add('AND ABREVIADO LIKE ''%TURNO%'' AND ABREVIADO LIKE ''%NOC%'' AND ABREVIADO LIKE ''%FES%''');
  sl.Add('AND ABREVIADO LIKE ''%CONV%'' AND ABREVIADO LIKE ''%DIU%'' AND ABREVIADO LIKE ''%ORD%''');
  sl.Add('AND ABREVIADO LIKE ''%CONV%'' AND ABREVIADO LIKE ''%NOC%'' AND ABREVIADO LIKE ''%ORD%''');
  sl.Add('AND ABREVIADO LIKE ''%CONV%'' AND ABREVIADO LIKE ''%DIU%'' AND ABREVIADO LIKE ''%D-F%''');
  sl.Add('AND ABREVIADO LIKE ''%CONV%'' AND ABREVIADO LIKE ''%NOC%'' AND ABREVIADO LIKE ''%D-F%''');
  sl.Add('AND ABREVIADO LIKE ''%DISP%'' AND ABREVIADO LIKE ''%SAB%''');
  sl.Add('AND ABREVIADO LIKE ''%DISP%'' AND ABREVIADO LIKE ''%DOM%''');
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Text :='SELECT CONCEPTO,DESCRIPCION,VALOR_3 FROM SIP_CONCEPTOS'+dblink+ '  WHERE TIPO_CONTRATO='+tdMemFiltroTipoContrato.AsString;
  Query.SQL.Add('');
  for i:=0 to 15 do
  begin
    Query.Close;
    Query.SQL[1]:=sl[i];
    Query.Open;
    CodigoConceptos[i]:=Query.FieldbyName('CONCEPTO').AsInteger;
    PorcentajeConceptos[i]:=Query.FieldbyName('VALOR_3').AsInteger;
  end;
  Query.Free;
  AsignarPorcentajesConceptosTemporales;
end;
procedure TFLiquidarExtrasRecargos.AsignarConceptosTemp(tipocontrato: string; var conceptoscompara: TstringList);
var
    Query:TQuery;
    i:Integer;
    sl:TStringList;
begin
  sl:=TStringList.Create;
  sl.Add('AND ABREVIADO LIKE ''%SOB%'' AND ABREVIADO LIKE ''%DIU%'' AND ABREVIADO LIKE ''%ORD%''');
  sl.Add('AND ABREVIADO LIKE ''%SOB%'' AND ABREVIADO LIKE ''%NOC%'' AND ABREVIADO LIKE ''%ORD%''');
  sl.Add('AND ABREVIADO LIKE ''%SOB%'' AND ABREVIADO LIKE ''%DIU%'' AND ABREVIADO LIKE ''%DOM%''');
  sl.Add('AND ABREVIADO LIKE ''%SB%'' AND ABREVIADO LIKE ''%D-F%'' AND ABREVIADO LIKE ''%>8%''');
  sl.Add('AND ABREVIADO LIKE ''%SOB%'' AND ABREVIADO LIKE ''%NOC%'' AND ABREVIADO LIKE ''%DOM%''');
  sl.Add('AND ABREVIADO LIKE ''%SOBREREM%''');
  sl.Add('AND ABREVIADO LIKE ''%TURNO%'' AND ABREVIADO LIKE ''%DIU%'' AND ABREVIADO LIKE ''%DOM%''');
  sl.Add('AND ABREVIADO LIKE ''%TURNO%'' AND ABREVIADO LIKE ''%NOC%'' AND ABREVIADO LIKE ''%DOM%''');
  sl.Add('AND ABREVIADO LIKE ''%TURNO%'' AND ABREVIADO LIKE ''%DIU%'' AND ABREVIADO LIKE ''%FES%''');
  sl.Add('AND ABREVIADO LIKE ''%TURNO%'' AND ABREVIADO LIKE ''%NOC%'' AND ABREVIADO LIKE ''%FES%''');
  sl.Add('AND ABREVIADO LIKE ''%CONV%'' AND ABREVIADO LIKE ''%DIU%'' AND ABREVIADO LIKE ''%ORD%''');
  sl.Add('AND ABREVIADO LIKE ''%CONV%'' AND ABREVIADO LIKE ''%NOC%'' AND ABREVIADO LIKE ''%ORD%''');
  sl.Add('AND ABREVIADO LIKE ''%CONV%'' AND ABREVIADO LIKE ''%DIU%'' AND ABREVIADO LIKE ''%D-F%''');
  sl.Add('AND ABREVIADO LIKE ''%CONV%'' AND ABREVIADO LIKE ''%NOC%'' AND ABREVIADO LIKE ''%D-F%''');
  sl.Add('AND ABREVIADO LIKE ''%DISP%'' AND ABREVIADO LIKE ''%SAB%''');
  sl.Add('AND ABREVIADO LIKE ''%DISP%'' AND ABREVIADO LIKE ''%DOM%''');
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Text :='SELECT CONCEPTO,DESCRIPCION,VALOR_3 FROM SIP_CONCEPTOS'+dblink+ '  WHERE TIPO_CONTRATO='+tdMemFiltroTipoContrato.AsString;
  Query.SQL.Add('');
  for i:=0 to 15 do
  begin
    Query.Close;
    Query.SQL[1]:=sl[i];
    Query.Open;
    conceptoscompara.add(Query.FieldbyName('CONCEPTO').Asstring);
  end;
  Query.Free;
  AsignarPorcentajesConceptosTemporales;
end;

function TFLiquidarExtrasRecargos.CargarListaTurnosMes:TList;
var
  i,j:integer;
  Fecha:TDateTime;
  PDia:PHorasDia;
  HorasDia:THorasDia;
  DiasMes:TList;
  TurnosDesde,TurnosHasta:TstringList;
  pDesdeHasta:^tDesdeHasta;
begin
  DiasMes:=TList.Create;
  Fecha:=tdMemFiltroFecha.AsDateTime;
  qTurnoEmpleado2.close;
  qTurnoEmpleado2.open;
  while not qTurnoEmpleado2.Eof do
  begin
    new(PDia);
    IniciarHorasDia(PDia^);
    PDia.TipoTurno:=tdMemFiltroCodigoTipoTurno.AsInteger;
    PDia.Turno:=qTurnoEmpleado2CODIGOTURNO.AsInteger;
    DiasMes.Add(PDia);
    qTurnoEmpleado2.Next;
  end;
  qTurnoEmpleado2.Close;
  for i := 0 to DiasMes.Count-1 do
  begin
    PDia:=DiasMes[i];
    HorasDia:=PDia^;
    if HorasDia.Turno>0 then
    begin
      FiltrarTurnosDesdeHasta(HorasDia.Turno,ListaTurnosDesde,ListaTurnosHasta,TurnosDesde,TurnosHasta);
      for j:=0 to TurnosDesde.Count-1 do
      begin
        new(pDesdeHasta);
        pDesdeHasta.HoraDesde:=Fecha + i + StrToDateTime(TurnosDesde[j])-1;
        pDesdeHasta.HoraHasta:=Fecha + i + StrToDateTime(TurnosHasta[j])-1;
        HorasDia.DesdeHasta.Add(pDesdeHasta);
      end;
    end
    else
    begin
      new(pDesdeHasta);
      pDesdeHasta.HoraDesde:=Fecha + i ;
      pDesdeHasta.HoraHasta:=Fecha + i ;
      HorasDia.DesdeHasta.Add(pDesdeHasta);
      HorasDia.Observacion:=ListaObservaciones.Values[inttostr(HorasDia.Turno)];
    end;
    ActualizarHorasExtrasTurno(HorasDia,Fecha+i);
    PDia:=DiasMes[i];
    PDia^:=HorasDia;
  end;
  Result:=DiasMes;
end;

//Crea la lista de turnos y sobretiempos del empleado en el mes
//a partir de los registros de programacion de turnos y los de sobretiempos
function TFLiquidarExtrasRecargos.CrearListaTurnosMes: TList;
var
  i,j,MaximoDia:integer;
  Fecha:TDateTime;
  PDia:PHorasDia;
  HorasDia:THorasDia;
  DiasMes:TList;
  Query:TQuery;
  TurnosDesde,TurnosHasta:TstringList;
  pDesdeHasta:^tDesdeHasta;
begin
  DiasMes:=TList.Create;
  Fecha:=tdMemFiltroFecha.AsDateTime;
  MaximoDia := 31;
  for I := 0 to ListaFinalMes.Count - 1 do
  begin
    if MaximoDia > (StrToInt(ListaFinalMes[I]) - 1) then
      MaximoDia := StrToInt(ListaFinalMes[I]) - 1;
  end;
  for i := 1 to MaximoDia do
  begin
    new(PDia);
    IniciarHorasDia(PDia^);
    PDia.TipoTurno:=tdMemFiltroCodigoTipoTurno.AsInteger;
    PDia.Turno:=0;
    DiasMes.Add(PDia);
  end;
  case OpcionGeneracion of
    GenerarTurnosConProgramacion:
    begin
      qCalendarioProgramacion.First;
      while not qCalendarioProgramacion.Eof do
      begin
        for i := 1 to MaximoDia do
        begin
          if qCalendarioProgramacion.FieldByName('D'+IntToStr(i)).AsString <>'' then
          begin
            PDia:=DiasMes[i-1];
            PDia.Turno:=qCalendarioProgramacion.FieldByName('D'+IntToStr(i)).AsInteger;
          end;
        end;
        qCalendarioProgramacion.Next;
      end;
    end;
    GenerarHorarioUnico:
    begin
      Query:=TQuery.Create(self);
      Query.DatabaseName:='BaseDato';
      Query.SQL.Add('select max(D7),max(D1),max(D2),max(D3),max(D4),max(D5),max(D6)');
      Query.SQL.Add('from tipoturnodetalle');
      Query.SQL.Add('WHERE CODIGOTIPOTURNO='+tdMemFiltroCodigoTipoTurno.AsString);
      Query.SQL.Add('AND CODIGOTURNO=1');
      Query.SQL.Add('group by codigotipoturno,codigoturno');
      Query.Open;
      for i := 1 to MaximoDia do
      begin
        PDia:=DiasMes[i-1];
        if (qTipoHorarioDESCANSOFESTIVO.AsString='S') and (EsFestivo(i)) then
        begin
          PDia.Turno:=0;
        end
        else
        begin
          j:=DayOfWeek(Fecha+i-1);
          if Query.Fields[j-1].AsString='S' then
            PDia.Turno:=1
          else
            PDia.Turno:=0;
        end;
      end;
    end;
  end;
  for i := 0 to DiasMes.Count-1 do
  begin
    PDia:=DiasMes[i];
    HorasDia:=PDia^;
    if HorasDia.Turno>0 then
    begin
      FiltrarTurnosDesdeHasta(HorasDia.Turno,ListaTurnosDesde,ListaTurnosHasta,TurnosDesde,TurnosHasta);
      for j:=0 to TurnosDesde.Count-1 do
      begin
        new(pDesdeHasta);
        pDesdeHasta.HoraDesde:=Fecha + i + StrToDateTime(TurnosDesde[j])-1;
        pDesdeHasta.HoraHasta:=Fecha + i + StrToDateTime(TurnosHasta[j])-1;
        HorasDia.DesdeHasta.Add(pDesdeHasta);
      end;
    end
    else
    begin
      new(pDesdeHasta);
      pDesdeHasta.HoraDesde:=Fecha + i ;
      pDesdeHasta.HoraHasta:=Fecha + i ;
      HorasDia.DesdeHasta.Add(pDesdeHasta);
      HorasDia.Observacion:=ListaObservaciones.Values[inttostr(HorasDia.Turno)];
    end;
    ActualizarHorasExtrasTurno(HorasDia,Fecha+i);
    PDia:=DiasMes[i];
    PDia^:=HorasDia;
  end;
  Result:=DiasMes;
end;

// Recibe una lista que contiene los turnos de cada día del mes
//y actualiza la cantidad de horas día segun los turnos
function TFLiquidarExtrasRecargos.ActualizarListaTurnosMes(DiasMes:Tlist): TList;
var
  i:integer;
  Fecha:TDateTime;
  PDia:PHorasDia;
  HorasDia:THorasDia;
begin
  Fecha:=tdMemFiltroFecha.AsDateTime;
  for i := 0 to DiasMes.Count-1 do
  begin
    PDia:=DiasMes[i];
    HorasDia:=PDia^;
    ActualizarTurno(HorasDia,Fecha+i);
    PDia:=DiasMes[i];
    PDia^:=HorasDia;
  end;
  Result:=DiasMes;
end;

//Elimina los registros actuales de la planilla filtrada por empleado por mes
procedure TFLiquidarExtrasRecargos.EliminarRegistros;
var Query: TQuery;
begin
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('DELETE FROM TURNOEMPLEADODETALLE  D');
  Query.SQL.Add('WHERE EXISTS');
  Query.SQL.Add('(SELECT NULL FROM TURNOEMPLEADO T');
  Query.SQL.Add('WHERE T.CODIGOEMPLEADO = :codigoempleado');
  Query.SQL.Add('AND trunc(T.FECHA) >= trunc(:iniciomes)');
  Query.SQL.Add('AND trunc(T.FECHA) <= trunc(:finmes)');
  Query.SQL.Add('AND T.CODIGOTURNOEMPLEADO=D.CODIGOTURNOEMPLEADO)');
  Query.ParamByName('iniciomes').AsDateTime:=tdMemFiltroInicioMes.AsDateTime;
  Query.ParamByName('finmes').AsDateTime:=tdMemFiltroFinMes.AsDateTime;
  Query.ParamByName('codigoempleado').AsFloat:=tdMemFiltroCodigoEmpleado.AsFloat;
  Query.ExecSQL;
  Query.SQL.Clear;
  Query.SQL.Add('DELETE FROM TURNOEMPLEADO');
  Query.SQL.Add('WHERE CODIGOEMPLEADO = :codigoempleado');
  Query.SQL.Add('AND trunc(FECHA) >= trunc(:iniciomes)');
  Query.SQL.Add('AND trunc(FECHA) <= trunc(:finmes)');
  Query.ParamByName('iniciomes').AsDateTime:=tdMemFiltroInicioMes.AsDateTime;
  Query.ParamByName('finmes').AsDateTime:=tdMemFiltroFinMes.AsDateTime;
  Query.ParamByName('codigoempleado').AsFloat:=tdMemFiltroCodigoEmpleado.AsFloat;
  Query.ExecSQL;
  Query.SQL.Clear;
  Query.SQL.Add('DELETE FROM PLANILLAMESEMPLEADO');
  Query.SQL.Add('WHERE CODIGOEMPLEADO = :codigoempleado');
  Query.SQL.Add('AND trunc(FECHA) >= trunc(:iniciomes)');
  Query.SQL.Add('AND trunc(FECHA) <= trunc(:finmes)');
  Query.ParamByName('iniciomes').AsDateTime:=tdMemFiltroInicioMes.AsDateTime;
  Query.ParamByName('finmes').AsDateTime:=tdMemFiltroFinMes.AsDateTime;
  Query.ParamByName('codigoempleado').AsFloat:=tdMemFiltroCodigoEmpleado.AsFloat;
  Query.ExecSQL;
  Query.SQL.Clear;
  Query.SQL.Add('DELETE FROM PLANILLATURNOEMPLEADO');
  Query.SQL.Add('WHERE CODIGOEMPLEADO = :codigoempleado');
  Query.SQL.Add('AND trunc(FECHA) >= trunc(:iniciomes)');
  Query.SQL.Add('AND trunc(FECHA) <= trunc(:finmes)');
  Query.ParamByName('iniciomes').AsDateTime:=tdMemFiltroInicioMes.AsDateTime;
  Query.ParamByName('finmes').AsDateTime:=tdMemFiltroFinMes.AsDateTime;
  Query.ParamByName('codigoempleado').AsFloat:=tdMemFiltroCodigoEmpleado.AsFloat;
  Query.ExecSQL;
  Query.Free;
end;
procedure TFLiquidarExtrasRecargos.sbtActualizarExtrasClick(
  Sender: TObject);
var ListaTurnosMes:TList;
begin
  Application.ProcessMessages;
  try
    Generado:=false;
    ListaTurnosMes:=CargarListaTurnosMes;
    qTurnoEmpleado.Database.StartTransaction;
    EliminarRegistros;
    InsertarRegistrosTurnoEmpleado(ListaTurnosMes);
    ActualizarListaTurnosMes(ListaTurnosMes);
    InsertarRegistrosPlanilla(ListaTurnosMes);
    InsertarRegistroPlanillaMes;
    AsignarEstadoPlanillas('GEN');
    Generado:=true;
    qTurnoEmpleado.Database.Commit;
  except
    on e:exception do
    begin
      showmessage(e.message);
      qTurnoEmpleado.Database.Rollback;
    end;
  end;
  qTurnoEmpleado.Close;
  qTurnoEmpleado.Open;
  qOdtSobreTiempoDetalle.Close;
  qOdtSobreTiempoDetalle.Open;
  Application.ProcessMessages;
end;

procedure TFLiquidarExtrasRecargos.qTurnoEmpleadoAfterPost(
  DataSet: TDataSet);
Var Query:TQuery;
begin
  qTurnoEmpleado.ApplyUpdates;
  qTurnoEmpleado.CommitUpdates;
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Clear;
  Query.SQL.Add('UPDATE PLANILLAMESEMPLEADO SET CODIGOUSUARIOMODIFICACION = '+inttostr(VarCodigoUsuario)+',');
  Query.SQL.Add('FECHAMODIFICACION = TO_DATE('''+FechaServidor+''',''DD/MM/YYYY'')');
  Query.SQL.Add('WHERE CODIGOEMPLEADO = ' + tdMemFiltroCodigoEmpleado.AsString);
  Query.SQL.Add('AND FECHA = TO_DATE(''' + FormatoFecha(tdMemFiltroFecha) + ''',''MM/DD/YYYY'')');
  Query.ExecSQL;
  Query.Free;
end;

function TFLiquidarExtrasRecargos.FechaServidor: string;
var qFecha: TQuery;
begin
  Result := '';
  qFecha := TQuery.Create(Application);
  qFecha.DatabaseName := 'BaseDato';
  qFecha.SQL.Text := 'SELECT TO_CHAR(SYSDATE,''DD/MM/YYYY'') FROM DUAL';
  qFecha.Open;
  Result := qFecha.Fields[0].AsString;
  qFecha.Free;
end;

procedure TFLiquidarExtrasRecargos.sbtmirarLiquidacionClick(
  Sender: TObject);
  var
  col,fil,pos: integer;
  temcod,VarRutaLocal: string;
  concepticod: tstringList;
begin
  ex:= eduexcel.Create;
  VarRutaLocal := ExtractFilePath(ParamStr(0));
  if VarRutaLocal[Length(VarRutaLocal)] <> '\' then
    VarRutaLocal := VarRutaLocal + '\';
  VarRutaLocal:=VarRutaLocal+'Plantillas\LIQUIDACION.xls';
  ex.AsignarPlantilla(VarRutaLocal);
  ex.HojaActiva('Liquidacion actual');
  qVerificarliquidacion.Close;
  qVerificarliquidacion.ParamByName('ADMINISTRATIVO').AsString :=tdMemFiltroCodigoAdministrativo.AsString;
  qVerificarliquidacion.ParamByName('ANO').AsString := tdMemFiltroAno.AsString;
  qVerificarliquidacion.ParamByName('MES').AsString :=  tdMemFiltroMes.AsString;
  qVerificarliquidacion.open;
  COL:=1;
  fil:=5;
  Ex.Visible(true);
  concepticod:=TstringList.Create;
  AsignarConceptosTemp(qVerificarliquidacion.FieldByName('tipo_contrato').AsString,concepticod);
  temcod:=qVerificarliquidacion.FieldByName('codigo').asstring;
  Ex.Asignar(1,1,qVerificarliquidacion.FieldByName('FECHA').AsString);
  while not (qVerificarliquidacion.Eof ) do
  begin
    if temcod <> qVerificarliquidacion.FieldByName('codigo').asstring then
     begin
       fil:=fil+1;
       temcod:=qVerificarliquidacion.FieldByName('codigo').asstring;
     end;
    Ex.Asignar(fil,1,qVerificarliquidacion.FieldByName('CODIGOADMINISTRATIVO').AsString);
    Ex.Asignar(fil,2,qVerificarliquidacion.FieldByName('codigo').AsString);
    Ex.Asignar(fil,3,qVerificarliquidacion.FieldByName('nombreempleado').AsString);
    Ex.Asignar(fil,4,qVerificarliquidacion.FieldByName('CONCEPTO').AsString);
    Ex.Asignar(fil,5,qVerificarliquidacion.FieldByName('DESCRIPCION').AsString);
    Ex.Asignar(fil,6,qVerificarliquidacion.FieldByName('VALOR_3').AsString);
    Ex.Asignar(fil,7,qVerificarliquidacion.FieldByName('SUMA').AsString);
    qVerificarliquidacion.next;
    fil:=fil+1;
  end;
  qVerificarliquidacion.close;
  ex.Terminar;
  ex.Free;

end;

procedure TFLiquidarExtrasRecargos.VerificarLiquidacion;
begin
end;

function TFLiquidarExtrasRecargos.ValidarLiquidacionNomina: boolean;
var Query:TQuery;
begin
  result:=true;
  Query:=TQuery.Create(Application);
  Query.DatabaseName:='BaseDato';
  Query.sql.clear;
  if  (tdMemFiltroCodigoEmpleado.AsString<>'')
  and (tdMemFiltroAno.AsString<>'')
  and (tdMemFiltroMes.AsString<>'')then
  begin
    Query.SQL.Add('SELECT * FROM SIP_EXTRA_TIEMPO'+dblink);
    Query.SQL.Add('WHERE CODIGO='+tdMemFiltroCodigoEmpleado.AsString);
    Query.SQL.Add('AND ANO_SBT='+tdMemFiltroAno.AsString);
    Query.SQL.Add('AND MES_SBT='+tdMemFiltroMes.AsString);
    Query.Open;
    if Query.RecordCount>0 then
    begin
      result:=false;
    end
    else
    begin
    end;
  end;
  Query.Free;
end;

procedure TFLiquidarExtrasRecargos.chbCodigoEstadoPlanillaClick(
  Sender: TObject);
var  Conceptos:TConceptosExtras;
  estado:boolean;
begin
  inherited;
end;
//******************************************************************************
//   Valida si el empleado tiene derecho a devengar  horas extras
// convencionales teniendo en cuenta que haya   trabajado 6 turnos continuos
//******************************************************************************
function TFLiquidarExtrasRecargos.ValidarExtrasConvencionales(var Dias:TstringList):boolean;
var query:tquery;
begin
  Dias:=TStringList.Create;
  result:=true;
  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  query.SQL.Add('SELECT   t.fecha');
  query.SQL.Add('  FROM turnoempleado t, planillaturnoempleado p');
  query.SQL.Add(' WHERE p.codigoempleado = t.codigoempleado');
  query.SQL.Add('   AND t.fecha = p.dia');
  query.SQL.Add('   AND t.codigoempleado = :codigoempleado');
  query.SQL.Add('   AND t.fecha >= :iniciomes');
  query.SQL.Add('   AND t.fecha <= :finmes');
  query.SQL.Add('   AND (p.cantidadextradiurnaconv>0 or p.cantidadextranocturnaconv>0)');
  query.SQL.Add('   AND SumarHorasTurnosAnteriores(t.codigoempleado,t.fecha)<45');
  query.DataSource:=dsMemFiltro;
  query.Open;

  if query.RecordCount>0 then
  begin
    Result:=false;
    while not(query.Eof) do
    begin
      Dias.Add(query.fieldbyname('fecha').asstring);
      query.Next;
    end;
  end;
  query.free;
end;
//Valida  si existen registros de liquidación para el empleado en ese mes
function TFLiquidarExtrasRecargos.ExistenRegistrosLiquidacionNomina: boolean;
var Query:TQuery;
begin
  result:=false;
  Query:=TQuery.Create(Application);
  Query.DatabaseName:='BaseDato';
  Query.sql.clear;
  Query.SQL.Add('SELECT * FROM SIP_EXTRA_TIEMPO'+dblink);
  Query.SQL.Add('WHERE CODIGO='+tdMemFiltroCodigoEmpleado.AsString);
  Query.SQL.Add('AND ANO_SBT='+tdMemFiltroAno.AsString);
  Query.SQL.Add('AND MES_SBT='+tdMemFiltroMes.AsString);
  Query.Open;
  if Query.RecordCount>0 then
  begin
    result:=true;
  end;
  Query.Free;
end;

procedure TFLiquidarExtrasRecargos.qOdtSobreTiempoDetalleCalcFields(
  DataSet: TDataSet);
begin
  if (qOdtSobreTiempoDetalleFECHAHORADESDE.AsString<>'')and
     (qOdtSobreTiempoDetalleFECHAHORAHASTA.AsString<>'')then
  begin
    qOdtSobreTiempoDetalleDESDEHASTA.AsString:= 'De '+
     FormatDateTime('HH : NN',qOdtSobreTiempoDetalleFECHAHORADESDE.AsDateTime)+
    ' a ' + FormatDateTime('HH:NN',qOdtSobreTiempoDetalleFECHAHORAHASTA.AsDateTime);
  end;
end;

procedure TFLiquidarExtrasRecargos.qPlanillaCalcFields(DataSet: TDataSet);
begin
  qPlanillaD.AsString:=FormatDateTime('DD',qPlanillaDIA.AsDateTime);
end;

procedure TFLiquidarExtrasRecargos.qEmpleadoBeforeOpen(DataSet: TDataSet);
begin
  qEmpleado.sql.clear;
  qEmpleado.sql.Add('SELECT E.CODIGOEMPLEADO, E.NOMBREEMPLEADO,SE.TIPO_CONTRATO'+dblink);
  qEmpleado.sql.Add('FROM EMPLEADO E, SIP_EMPLEADO'+dblink+' SE');
  qEmpleado.sql.Add('WHERE CODIGOADMINISTRATIVO=:CODIGOADMINISTRATIVO');
  qEmpleado.sql.Add('AND E.CODIGOEMPLEADO=SE.IDENTIFICACION');
  qEmpleado.sql.Add('AND ((E.estado IN (''AC'',''LC'')) OR (E.estado IS NULL))');
  qEmpleado.sql.Add('ORDER BY NOMBREEMPLEADO');
end;

procedure TFLiquidarExtrasRecargos.qLiquidacionBeforeOpen(
  DataSet: TDataSet);
begin
  qLiquidacion.sql.clear;
  qLiquidacion.sql.add('SELECT * FROM SIP_EXTRA_TIEMPO'+dblink);
  qLiquidacion.sql.add('WHERE CODIGO=:CODIGOEMPLEADO');
  qLiquidacion.sql.add('AND ANO_SBT=:ANO');
  qLiquidacion.sql.add('AND MES_SBT=:MES');

  updLiquidacion.ModifySQL.text:=
      'update SIP_EXTRA_TIEMPO'+dblink+
      ' set'                           +
      '  CODIGO = :CODIGO,'           +
      '  CONCEPTO = :CONCEPTO,'       +
      '  ANO_SBT = :ANO_SBT,'         +
      '  MES_SBT = :MES_SBT,'         +
      '  DIA_1 = :DIA_1,'             +
      '  DIA_2 = :DIA_2,'             +
      '  DIA_3 = :DIA_3,'             +
      '  DIA_4 = :DIA_4,'             +
      '  DIA_5 = :DIA_5,'             +
      '  DIA_6 = :DIA_6,'             +
      '  DIA_7 = :DIA_7,'             +
      '  DIA_8 = :DIA_8,'             +
      '  DIA_9 = :DIA_9,'             +
      '  DIA_10 = :DIA_10,'           +
      '  DIA_11 = :DIA_11,'           +
      '  DIA_12 = :DIA_12,'           +
      '  DIA_13 = :DIA_13,'           +
      '  DIA_14 = :DIA_14,'           +
      '  DIA_15 = :DIA_15,'           +
      '  DIA_16 = :DIA_16,'           +
      '  DIA_17 = :DIA_17,'           +
      '  DIA_18 = :DIA_18,'           +
      '  DIA_19 = :DIA_19,'           +
      '  DIA_20 = :DIA_20,'           +
      '  DIA_21 = :DIA_21,'           +
      '  DIA_22 = :DIA_22,'           +
      '  DIA_23 = :DIA_23,'           +
      '  DIA_24 = :DIA_24,'           +
      '  DIA_25 = :DIA_25,'           +
      '  DIA_26 = :DIA_26,'           +
      '  DIA_27 = :DIA_27,'           +
      '  DIA_28 = :DIA_28,'           +
      '  DIA_29 = :DIA_29,'           +
      '  DIA_30 = :DIA_30,'           +
      '  DIA_31 = :DIA_31,'           +
      '  USUARIO = :USUARIO,'         +
      '  FECHA = :FECHA,'             +
      '  ANO_SIRH = :ANO_SIRH,'       +
      '  MES_SIRH = :MES_SIRH,'       +
      '  NOMINA_SIRH = :NOMINA_SIRH,' +
      '  FEC_SIRH = :FEC_SIRH,'       +
      '  USR_SIRH = :USR_SIRH'        +
      ' where'                         +
      '  CODIGO = :OLD_CODIGO and'    +
      '  CONCEPTO = :OLD_CONCEPTO and'+
      '  ANO_SBT = :OLD_ANO_SBT and'  +
      '  MES_SBT = :OLD_MES_SBT'     ;

  updLiquidacion.InsertSQL.text:=
      'insert into SIP_EXTRA_TIEMPO'+ dblink+

        '  (CODIGO, CONCEPTO, ANO_SBT, MES_SBT, DIA_1, DIA_2, DIA_3, DIA_' +
        '4, '                                                              +
      'DIA_5, '                                                            +
        '   DIA_6, DIA_7, DIA_8, DIA_9, DIA_10, DIA_11, DIA_12, DIA_13, D' +
        'IA_14, '                                                          +
        '   DIA_15, DIA_16, DIA_17, DIA_18, DIA_19, DIA_20, DIA_21, DIA_2' +
        '2, DIA_23, '                                                      +
        '   DIA_24, DIA_25, DIA_26, DIA_27, DIA_28, DIA_29, DIA_30, DIA_3' +
        '1, USUARIO, '                                                     +
      '   FECHA, ANO_SIRH, MES_SIRH, NOMINA_SIRH, FEC_SIRH, USR_SIRH) '    +
      ' values'                                                             +
        '  (:CODIGO, :CONCEPTO, :ANO_SBT, :MES_SBT, :DIA_1, :DIA_2, :DIA_' +
        '3, :DIA_4, '                                                      +
        '   :DIA_5, :DIA_6, :DIA_7, :DIA_8, :DIA_9, :DIA_10, :DIA_11, :DI' +
        'A_12, :DIA_13, '                                                  +
        '   :DIA_14, :DIA_15, :DIA_16, :DIA_17, :DIA_18, :DIA_19, :DIA_20' +
        ', :DIA_21, '                                                      +
        '   :DIA_22, :DIA_23, :DIA_24, :DIA_25, :DIA_26, :DIA_27, :DIA_28' +
        ', :DIA_29, '                                                      +
        '   :DIA_30, :DIA_31, :USUARIO, :FECHA, :ANO_SIRH, :MES_SIRH, :NO' +
        'MINA_SIRH, '                                                      +
        ':FEC_SIRH, :USR_SIRH)';

  updLiquidacion.DeleteSQL.text :=
      'delete from SIP_EXTRA_TIEMPO'+ dblink +
      ' where'                          +
      '  CODIGO = :OLD_CODIGO and'     +
      '  CONCEPTO = :OLD_CONCEPTO and' +
      '  ANO_SBT = :OLD_ANO_SBT and'   +
      '  MES_SBT = :OLD_MES_SBT';
end;

procedure TFLiquidarExtrasRecargos.qVerificarliquidacionBeforeOpen(
  DataSet: TDataSet);
begin
qVerificarliquidacion.sql.Text:=
  'SELECT TO_CHAR (SYSDATE,''DD/MM/YYYY HH:MI'') AS fecha,mm.CODIGOADMINISTRATIVO,e.codigo,MM.NOMBREEMPLEADO,e.concepto,c.DESCRIPCION,em.tipo_contrato,c.valor_3, '+
  'NVL(e.dia_1,0)+NVL(e.dia_2,0)+NVL(e.dia_3,0)+NVL(e.dia_4,0)+ NVL(e.dia_5,0) '+
  '+ NVL(e.dia_6,0)+NVL(e.dia_7,0)+ NVL(e.dia_8,0)+NVL( e.dia_9,0)+ NVL(e.dia_10,0)+ NVL(e.dia_11,0)+ NVL(e.dia_12,0) ' +
  '+ NVL(e.dia_13,0)+NVL(e.dia_14,0)+NVL(e.dia_15,0) +NVL(e.dia_16,0)+ NVL(e.dia_17,0)+ NVL(e.dia_18,0)+ NVL(e.dia_19,0) ' +
  '+NVL(e.dia_20,0)+ NVL(e.dia_21,0)+ NVL(e.dia_22,0)+ NVL(e.dia_23,0)+ NVL(e.dia_24,0)+ NVL(e.dia_25,0)+ NVL(e.dia_26,0) ' +
  '+ NVL(e.dia_27,0)+NVL(e.dia_28,0) + NVL(e.dia_29,0)+ NVL(e.dia_30,0)+ NVL(e.dia_31,0) AS suma ' +
  'FROM SIP_EXTRA_TIEMPO'+dblink+ ' E, SIP_CONCEPTOS'+dblink+' c, sip_empleado'+dblink+' em, empleado mm '+
  'WHERE  EM.IDENTIFICACION =e.CODIGO ' +
  'AND e.ANO_SBT=:ANO '+
  'AND e.MES_SBT=:MES '+
  'AND E.concepto=c.concepto ' +
  'AND C.TIPO_CONTRATO = em.tipo_contrato '+
  'AND mm.CODIGOEMPLEADO= EM.IDENTIFICACION '+
  'AND mm.CODIGOADMINISTRATIVO= :ADMINISTRATIVO '+
  ' ORDER BY MM.NOMBREEMPLEADO,e.codigo,e.concepto ';
end;

procedure TFLiquidarExtrasRecargos.qLiquidacionverAfterOpen(
  DataSet: TDataSet);
begin
  qLiquidacionver.sql.text:=
  'SELECT e.codigo,e.concepto,c.DESCRIPCION,c.VALOR_3 , NVL(e.dia_1,0)+NVL(e.dia_2,0) '+
  '+NVL(e.dia_3,0)+NVL(e.dia_4,0)+ NVL(e.dia_5,0)+ NVL(e.dia_6,0)+NVL(e.dia_7,0)+ NVL(e.dia_8,0) '+
  '+NVL( e.dia_9,0)+ NVL(e.dia_10,0)+ NVL(e.dia_11,0)+ NVL(e.dia_12,0) '+
  '+ NVL(e.dia_13,0)+NVL(e.dia_14,0)+NVL(e.dia_15,0) +NVL(e.dia_16,0) '+
  '+ NVL(e.dia_17,0)+ NVL(e.dia_18,0)+ NVL(e.dia_19,0) +NVL(e.dia_20,0) '+
  '+ NVL(e.dia_21,0)+ NVL(e.dia_22,0)+ NVL(e.dia_23,0)+ NVL(e.dia_24,0)+ NVL(e.dia_25,0)+ NVL(e.dia_26,0) '+
  '+ NVL(e.dia_27,0)+NVL(e.dia_28,0) + NVL(e.dia_29,0)+ NVL(e.dia_30,0)+ NVL(e.dia_31,0) AS suma '+
  ' FROM SIP_EXTRA_TIEMPO'+dblink+ '  E, SIP_CONCEPTOS'+dblink+ '  c, sip_empleado'+dblink+ '  em '+
  ' WHERE e.IDENTIFICACION=:CODIGOEMPLEADO '+
  'AND EM.IDENTIFICACION =e.CODIGO '+
  'AND e.ANO_SBT=:ANO '+
  'AND e.MES_SBT=:MES '+
  'AND E.concepto=c.concepto '+
  'AND C.TIPO_CONTRATO = em.tipo_contrato ';

end;
//*******************************************************************
// Determina si un rango de horas está dentro de otro rango dado
//*******************************************************************
function HorasEntreRango(Desde1,Hasta1,Desde2,Hasta2:TDateTime):Boolean;
begin
  result:=false;
  if (Desde1<Hasta1) and (Desde2<Hasta2) then
    if (Desde1>=Desde2) and (Hasta1<=Hasta2) then Result:=true;
end;

procedure TFLiquidarExtrasRecargos.SpeedButton2Click(Sender: TObject);
var CIA:INTEGER;
begin
  CIA := CapturarCIA(true);
  if CIA<>0 then tdMemFiltroCODIGOADMINISTRATIVO.AsInteger:=CIA;
end;

procedure TFLiquidarExtrasRecargos.tdMemFiltroCodigoAdministrativoValidate(
  Sender: TField);
var i:integer;
begin
  if Sender.AsString<>'' then
  begin
    qCIA.close;
    qCIA.sql.insert(qCIA.sql.Count-1,' AND CODIGOADMINISTRATIVO='+Sender.AsString);
    qCIA.open;
    i:=qCIA.RecordCount;
    qCIA.sql.Delete(qCIA.sql.Count-2);
    qCIA.open;
    if i=0 then
      raise Exception.Create('Esta Área no Existe ó El usuario no tiene permisos.');
  end;
end;

procedure TFLiquidarExtrasRecargos.qPlanillaMesEmpleadoCODIGOESTADOPLANILLAChange(
  Sender: TField);
var  Conceptos:TConceptosExtras;
  estado:boolean;
begin
end;

procedure TFLiquidarExtrasRecargos.qPlanillaMesEmpleadoCalcFields(
  DataSet: TDataSet);
begin
  if qPlanillaMesEmpleadoCODIGOESTADOPLANILLA.AsString='BLO'then
    qPlanillaMesEmpleadoEstado.AsString:='APROBADA'
  else
    if qPlanillaMesEmpleadoCODIGOESTADOPLANILLA.AsString='LIQ'then
      qPlanillaMesEmpleadoEstado.AsString:='LIQUIDADA'
    else
      if qPlanillaMesEmpleadoCODIGOESTADOPLANILLA.AsString='GEN'then
        qPlanillaMesEmpleadoEstado.AsString:='GENERADA'
      else
        qPlanillaMesEmpleadoEstado.AsString:='';      
end;

procedure TFLiquidarExtrasRecargos.AprobarLiquidacion;
var  Conceptos:TConceptosExtras;
begin
  Conceptos:=CalcularCantidadesConceptos;
  InsertarRegistrosLiquidacion(Conceptos);
  Conceptos.free;
  AsignarEstadoPlanillas('BLO');
  qTurnoEmpleado.Close;
  qTurnoEmpleado.open;
end;

procedure TFLiquidarExtrasRecargos.sbtAprobarPlanillaClick(
  Sender: TObject);
begin
  AprobarLiquidacion;
end;

end.







 