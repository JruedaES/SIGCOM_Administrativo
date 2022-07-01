unit uAsignarAnalistas;

/// INFORMACION IMPORTANTE ----------------------------------------------------
///----------------------------------------------------------------------------
/// NO BORRAR ESPACIOS EN LOS QUERYS 

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Db,
  DBTables, Grids, ComCtrls, DBGrids, RXDBCtrl,USeleccionarAnalista,uFIMPAdministrativo,
  ImgList, Spin, Menus, UTrCVS;

type
  TFAsignarAnalista = class(TForm)
    Panel5: TPanel;
    qSedeOperativa: TQuery;
    dsSedeOperativa: TDataSource;
    qCoordinadorGrupoTrabajo: TQuery;
    dsCoordinadorGrupoTrabajo: TDataSource;
    qSedeOperativaCODIGOSEDEOPERATIVA: TFloatField;
    qSedeOperativaNOMBRESEDEOPERATIVA: TStringField;
    qSedeOperativaACTIVO: TStringField;
    qSedeOperativaCODIGOTIPOSEDE: TFloatField;
    qSedeOperativaCOLOR: TFloatField;
    qCoordinadorGrupoTrabajoCODIGOANALISTA: TFloatField;
    qCoordinadorGrupoTrabajoNOMBREANALISTA: TStringField;
    qCoordinadorGrupoTrabajoACTIVO: TStringField;
    qCoordinadorGrupoTrabajoCODIGOUSUARIO: TFloatField;
    qCoordinadorGrupoTrabajoCODIGOSEDEOPERATIVA: TFloatField;
    qTotales: TQuery;
    qAsignados: TQuery;
    qSinAsignar: TQuery;
    qTotalesCANTIDAD: TFloatField;
    qAsignadosCANTIDAD: TFloatField;
    qSinAsignarCANTIDAD: TFloatField;
    qCuentasResultas: TQuery;
    FloatField1: TFloatField;
    qAnalistas: TQuery;
    FloatField2: TFloatField;
    PageControl1: TPageControl;
    tgGestion: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    DBLkpCmbBoxOficinas: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    eanalistasdisponibles: TEdit;
    rbAnalistasTodos: TRadioButton;
    rbAnalistaSeleccionado: TRadioButton;
    GroupBox2: TGroupBox;
    rbSeleccionListadoPrincipal: TRadioButton;
    rbtodoellistado: TRadioButton;
    eTodas: TRadioButton;
    GroupBox3: TGroupBox;
    GroupBox5: TGroupBox;
    tbEstadoAnalisis: TTabSheet;
    Panel1: TPanel;
    sbRefrescar: TSpeedButton;
    eFechaLectura2: TEdit;
    Label7: TLabel;
    dbgListaHijas: TRxDBGrid;
    Panel2: TPanel;
    RxDBGrid1: TRxDBGrid;
    qPrincipal: TQuery;
    dsprincipal: TDataSource;
    qListaLectura: TQuery;
    qlectura: TDataSource;
    qListaLecturaCODIGOLECTURA: TFloatField;
    qListaLecturaCLAVE: TStringField;
    qListaLecturaLECTURAACTUAL: TStringField;
    qListaLecturaCONSUMOACTUAL: TStringField;
    qListaLecturaOBSERVACIONES: TStringField;
    qListaLecturaCODIGOANOMALIA: TStringField;
    qListaLecturaFECHALECTURA: TDateTimeField;
    qListaLecturaLAT: TStringField;
    qListaLecturaLNG: TStringField;
    qListaLecturaCAMBIOPOSICION: TStringField;
    qListaLecturaFECHALLEGADA: TDateTimeField;
    qListaLecturaFECHASALIDA: TDateTimeField;
    qListaLecturaLECTURAREACTIVA: TStringField;
    qListaLecturaPOTENCIA: TStringField;
    qListaLecturaLIBRO: TStringField;
    qListaLecturaFECHALECTURA_01: TDateTimeField;
    qListaLecturaX: TStringField;
    qListaLecturaY: TStringField;
    qListaLecturaPX: TFloatField;
    qListaLecturaPY: TFloatField;
    qListaLecturaTIPOCLAVE: TStringField;
    qListaLecturaACELEROMETRO: TStringField;
    qListaLecturaBRUJULA: TStringField;
    qListaLecturaCODIGOITINERARIO: TFloatField;
    qListaLecturaNVLBATERIA: TStringField;
    qListaLecturaVALIDO: TStringField;
    qListaLecturaTIPO_FACTURA: TStringField;
    qListaLecturaVALOR_CONSUMO: TFloatField;
    qListaLecturaESTADOLECTURA: TFloatField;
    qListaLecturaFACTURO: TStringField;
    qListaLecturaLECTURA_CONCRITICA: TStringField;
    qListaLecturaCODIGOUSUARIO_CRITICA: TFloatField;
    qListaLecturaFECHA_CRITICA: TDateTimeField;
    qListaLecturaFECHA_PROGRAMADA: TDateTimeField;
    qListaLecturaMARCA_CRITICA: TStringField;
    qListaLecturaCODIGOANALISTA: TFloatField;
    qListaLecturaCODIGOADMINISTRATIVO: TFloatField;
    qListaLecturaCODIGOGRUPOTRABAJO: TFloatField;
    qListaLecturaCODIGODIAL: TFloatField;
    qListaLecturaPERIODO: TFloatField;
    qListaLecturaFECHALECTURA_1: TDateTimeField;
    qListaLecturaCODIGOAPOYO1: TFloatField;
    qListaLecturaLIBRO_1: TStringField;
    qListaLecturaACOMETIDA: TFloatField;
    qListaLecturaCLAVE_1: TFloatField;
    qListaLecturaCODIGOCLIENTESGD: TFloatField;
    qListaLecturaCICLO: TFloatField;
    qListaLecturaCODIGOUNICOM: TFloatField;
    qListaLecturaCODUBICACION: TStringField;
    qListaLecturaAOLPREDIO: TFloatField;
    qListaLecturaAOLPUNTOCONSUMO: TFloatField;
    qListaLecturaAOLMEDIDOR: TFloatField;
    qListaLecturaNOMBRESUSCRIPTOR: TStringField;
    qListaLecturaDIRECCIONSUCRIPTOR: TMemoField;
    qListaLecturaNUMEROCONTADOR: TFloatField;
    qListaLecturaCODIGOMARCAMEDIDOR: TStringField;
    qListaLecturaFACTORMULTIPLICADOR: TFloatField;
    qListaLecturaNUMEROAGUJAS: TFloatField;
    qListaLecturaTARIFA: TFloatField;
    qListaLecturaSECTORCONSUMO: TFloatField;
    qListaLecturaFECHAULTIMALECTURA: TFloatField;
    qListaLecturaULTIMALECTURA: TFloatField;
    qListaLecturaCONSUMO1: TFloatField;
    qListaLecturaCONSUMO2: TFloatField;
    qListaLecturaCONSUMO3: TFloatField;
    qListaLecturaCONSUMO4: TFloatField;
    qListaLecturaCONSUMO5: TFloatField;
    qListaLecturaCONSUMO6: TFloatField;
    qListaLecturaCONSUMO7: TFloatField;
    qListaLecturaCONSUMO8: TFloatField;
    qListaLecturaCONSUMO9: TFloatField;
    qListaLecturaCONSUMO10: TFloatField;
    qListaLecturaCONSUMO11: TFloatField;
    qListaLecturaCONSUMO12: TFloatField;
    qListaLecturaVALORAP: TFloatField;
    qListaLecturaCOSTOKWH: TFloatField;
    qListaLecturaCARGOCOMERCIALIZACION: TFloatField;
    qListaLecturaCARGOREGULACION: TFloatField;
    qListaLecturaSALDOANTERIOR: TFloatField;
    qListaLecturaX_1: TFloatField;
    qListaLecturaY_1: TFloatField;
    qListaLecturaCODIGOORIGENPROCESO: TFloatField;
    qListaLecturaCODIGOMODELOMEDIDOR: TFloatField;
    qListaLecturaCODIGOTIPOMEDIDA: TStringField;
    qListaLecturaCODIGOITINERARIO_1: TFloatField;
    qListaLecturaFILA: TFloatField;
    qListaLecturaCOLUMNA: TFloatField;
    qListaLecturaDIMENSIONMEDIDOR: TStringField;
    qListaLecturaCOM_INF_ADICIONAL: TStringField;
    qListaLecturaCODIGOCONTADOR: TStringField;
    qListaLecturaNOMBREMARCAMEDIDOR: TStringField;
    qListaLecturaAUTORIZADO: TStringField;
    qListaLecturaINDUSTRIAL_AUTORIZA: TStringField;
    qListaLecturaS_CONTDOR_REACTIVO: TFloatField;
    qListaLecturaS_LECTUR_ACTUAL_R: TFloatField;
    qListaLecturaS_LECTUR_DEMANDA: TFloatField;
    qListaLecturaS_DEMANDA1: TFloatField;
    qListaLecturaS_DEMANDA2: TFloatField;
    qListaLecturaS_DEMANDA3: TFloatField;
    qListaLecturaS_DEMANDA4: TFloatField;
    qListaLecturaS_DEMANDA5: TFloatField;
    qListaLecturaS_DEMANDA6: TFloatField;
    qListaLecturaS_DEMANDA7: TFloatField;
    qListaLecturaS_DEMANDA8: TFloatField;
    qListaLecturaS_DEMANDA9: TFloatField;
    qListaLecturaS_DEMANDA10: TFloatField;
    qListaLecturaS_DEMANDA11: TFloatField;
    qListaLecturaS_DEMANDA12: TFloatField;
    qListaLecturaS_CONSUMO1: TFloatField;
    qListaLecturaS_CONSUMO2: TFloatField;
    qListaLecturaS_CONSUMO3: TFloatField;
    qListaLecturaS_CONSUMO4: TFloatField;
    qListaLecturaS_CONSUMO5: TFloatField;
    qListaLecturaS_CONSUMO6: TFloatField;
    qListaLecturaS_CONSUMO7: TFloatField;
    qListaLecturaS_CONSUMO8: TFloatField;
    qListaLecturaS_CONSUMO9: TFloatField;
    qListaLecturaS_CONSUMO10: TFloatField;
    qListaLecturaS_CONSUMO11: TFloatField;
    qListaLecturaS_CONSUMO12: TFloatField;
    qListaLecturaS_LECTUR_ANTERIOR_R: TFloatField;
    qListaLecturaM_CODIGO_3EDAD: TFloatField;
    qListaLecturaM_TARIFA_SERVICIO: TFloatField;
    qListaLecturaM_CODIGO_LECTURA: TFloatField;
    qListaLecturaLAT_1: TFloatField;
    qListaLecturaLNG_1: TFloatField;
    qListaLecturaCODIGOCLASE: TStringField;
    qListaLecturaCODIGOANOMALIA_1: TStringField;
    qListaLecturaDESCRIPCION: TStringField;
    qListaLecturaTIPO: TStringField;
    qListaLecturaREQUIERE_LECTURA: TStringField;
    qListaLecturaFACTURABLE: TStringField;
    qListaLecturaPROMEDIABLE: TStringField;
    qListaLecturaFOTOGRAFIA: TStringField;
    qListaLecturaOBSERVACION: TStringField;
    qListaLecturaMARCACION: TStringField;
    qListaLecturaUSUARIOCREACION: TFloatField;
    qListaLecturaFECHACREACION: TDateTimeField;
    qListaLecturaUSUARIOMODIFICACION: TFloatField;
    qListaLecturaFECHAMODIFICACION: TDateTimeField;
    qListaLecturaESTADO: TStringField;
    qListaLecturaPARAMETRIZACION: TStringField;
    qPrincipalAsignados: TQuery;
    qPrincipalSinAsignados: TQuery;
    lTotal: TLabel;
    lTotalAsignados: TLabel;
    lTotalNoAsignados: TLabel;
    qTotal: TQuery;
    Label9: TLabel;
    Label10: TLabel;
    RxDBGrid3: TRxDBGrid;
    qSecundariaFacturacion: TQuery;
    dsSuceundariaFacturacion: TDataSource;
    Label12: TLabel;
    lFacturacion: TLabel;
    lFacturacionAsignados: TLabel;
    lFacturacionNoAsignados: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    qSecundarioSinAsignar: TQuery;
    qFacturacionAsignados: TQuery;
    qTotalFacturados: TQuery;
    SpeedButton1: TSpeedButton;
    rbAnalistasSeleccionados: TRadioButton;
    rbSelecconTablaFacturacion: TRadioButton;
    rbSeleccionTablaLectura: TRadioButton;
    GroupBox4: TGroupBox;
    rbDistribucionNormal: TRadioButton;
    rbDistribucionEquivalente: TRadioButton;
    qListadoPrincipal: TQuery;
    dsListadoPrincipal: TDataSource;
    lDetalleSuministros: TLabel;
    qListadoSecundario: TQuery;
    dsListadoSecundario: TDataSource;
    qListaNoCruzadosPrinciapal: TQuery;
    dsListaNoCruzadosPrincipal: TDataSource;
    qListaNoCruzadosPrinciapalCANTIDAD: TFloatField;
    qListaNoCruzadosPrinciapalCANTIDADLEIDOS: TIntegerField;
    qListaNoCruzadosPrinciapalPORCENTAJE: TStringField;
    qSeleccionAnomaliasFacturacion: TQuery;
    qUpdateCuentas: TQuery;
    qSeleccionAnomaliasLecturas: TQuery;
    qSeleccionTodos: TQuery;
    qAnalistasSeleccionados: TQuery;
    FloatField3: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    lSede: TLabel;
    qListaNoCruzadosPrinciapalLIBRO: TStringField;
    qListaNoCruzadosSecundario: TQuery;
    dsListaNoCruzadosSecundario: TDataSource;
    qListaNoCruzadosPrinciapalCUENTASCRUZADAS: TStringField;
    qListaNoCruzadosPrinciapalCUENTASNOCRUZADAS: TStringField;
    qListaNoCruzadosPrinciapalPORCENTAJENOCRUZA: TStringField;
    dsqListaCuentasNoLeidas: TDataSource;
    qListaNoCruzadosSecundarioM_CLAVE_PRIMARIA: TFloatField;
    qListaNoCruzadosSecundarioM_CODIGO_CITY: TFloatField;
    qListaNoCruzadosSecundarioM_CODIGO_RUTA: TFloatField;
    qListaNoCruzadosSecundarioM_CODIGO_ACOMET: TFloatField;
    qListaNoCruzadosSecundarioM_NOMBRE_ABONADO: TStringField;
    qListaNoCruzadosSecundarioM_DIRECC_ABONADO: TStringField;
    qListaNoCruzadosSecundarioM_CONTADOR_ACTIVO: TFloatField;
    qListaNoCruzadosSecundarioM_MULTIP_ACTIVO: TFloatField;
    qListaNoCruzadosSecundarioM_NUMERO_AGUJAS: TFloatField;
    qListaNoCruzadosSecundarioM_NUMERO_TRANSFORMA: TFloatField;
    qListaNoCruzadosSecundarioM_FASES: TFloatField;
    qListaNoCruzadosSecundarioM_NUMERO_DEPOSITO: TFloatField;
    qListaNoCruzadosSecundarioM_VALOR_DEPOSITO: TFloatField;
    qListaNoCruzadosSecundarioM_FECHA_CONEXION: TFloatField;
    qListaNoCruzadosSecundarioM_TARIFA_SERVICIO: TFloatField;
    qListaNoCruzadosSecundarioM_SECTOR_CONSUMO: TFloatField;
    qListaNoCruzadosSecundarioM_IDENT: TStringField;
    qListaNoCruzadosSecundarioM_RTN: TStringField;
    qListaNoCruzadosSecundarioM_FECHA_ACTUAL: TFloatField;
    qListaNoCruzadosSecundarioM_FECHA_ANTERIOR: TFloatField;
    qListaNoCruzadosSecundarioM_LECTURA_ACTUAL: TFloatField;
    qListaNoCruzadosSecundarioM_LECTURA_ANTERIOR: TFloatField;
    qListaNoCruzadosSecundarioM_CONSUMO_DEL_MES: TFloatField;
    qListaNoCruzadosSecundarioM_CONSUMO_ESTIMADO: TFloatField;
    qListaNoCruzadosSecundarioM_CONSUMO_ADICIONAL: TFloatField;
    qListaNoCruzadosSecundarioM_DIAS_FACTURADOS: TFloatField;
    qListaNoCruzadosSecundarioM_CONSUMOS1: TFloatField;
    qListaNoCruzadosSecundarioM_CONSUMOS2: TFloatField;
    qListaNoCruzadosSecundarioM_CONSUMOS3: TFloatField;
    qListaNoCruzadosSecundarioM_CONSUMOS4: TFloatField;
    qListaNoCruzadosSecundarioM_CONSUMOS5: TFloatField;
    qListaNoCruzadosSecundarioM_CONSUMOS6: TFloatField;
    qListaNoCruzadosSecundarioM_CONSUMOS7: TFloatField;
    qListaNoCruzadosSecundarioM_CONSUMOS8: TFloatField;
    qListaNoCruzadosSecundarioM_CONSUMOS9: TFloatField;
    qListaNoCruzadosSecundarioM_CONSUMOS10: TFloatField;
    qListaNoCruzadosSecundarioM_CONSUMOS11: TFloatField;
    qListaNoCruzadosSecundarioM_CONSUMOS12: TFloatField;
    qListaNoCruzadosSecundarioM_DIAS1: TFloatField;
    qListaNoCruzadosSecundarioM_DIAS2: TFloatField;
    qListaNoCruzadosSecundarioM_DIAS3: TFloatField;
    qListaNoCruzadosSecundarioM_DIAS4: TFloatField;
    qListaNoCruzadosSecundarioM_DIAS5: TFloatField;
    qListaNoCruzadosSecundarioM_DIAS6: TFloatField;
    qListaNoCruzadosSecundarioM_DIAS7: TFloatField;
    qListaNoCruzadosSecundarioM_DIAS8: TFloatField;
    qListaNoCruzadosSecundarioM_DIAS9: TFloatField;
    qListaNoCruzadosSecundarioM_DIAS10: TFloatField;
    qListaNoCruzadosSecundarioM_DIAS11: TFloatField;
    qListaNoCruzadosSecundarioM_DIAS12: TFloatField;
    qListaNoCruzadosSecundarioM_COBRO_ENERGIA: TFloatField;
    qListaNoCruzadosSecundarioM_COBRO_DIESEL: TFloatField;
    qListaNoCruzadosSecundarioM_COBRO_INTERES: TFloatField;
    qListaNoCruzadosSecundarioM_COBRO_PUBLICO: TFloatField;
    qListaNoCruzadosSecundarioM_OTROS_DR_CR: TFloatField;
    qListaNoCruzadosSecundarioM_SUBSIDIO: TFloatField;
    qListaNoCruzadosSecundarioM_SALDO_DEL_MES: TFloatField;
    qListaNoCruzadosSecundarioM_SALDO_30_DIAS: TFloatField;
    qListaNoCruzadosSecundarioM_SALDO_60_DIAS: TFloatField;
    qListaNoCruzadosSecundarioM_SALDO_90_DIAS: TFloatField;
    qListaNoCruzadosSecundarioM_SALDO_120_DIAS: TFloatField;
    qListaNoCruzadosSecundarioM_SALDO_ANTERIOR: TFloatField;
    qListaNoCruzadosSecundarioM_VALOR_RECTIFICA: TFloatField;
    qListaNoCruzadosSecundarioM_PAGOS_DEL_CICLO: TFloatField;
    qListaNoCruzadosSecundarioM_PAGOS_DEL_MES: TFloatField;
    qListaNoCruzadosSecundarioM_PAGOS_NO_ACT: TFloatField;
    qListaNoCruzadosSecundarioM_FECHA_PAGO: TFloatField;
    qListaNoCruzadosSecundarioM_CTL_PAGO1: TFloatField;
    qListaNoCruzadosSecundarioM_CTL_PAGO2: TFloatField;
    qListaNoCruzadosSecundarioM_CTL_PAGO3: TFloatField;
    qListaNoCruzadosSecundarioM_CTL_PAGO4: TFloatField;
    qListaNoCruzadosSecundarioM_CTL_PAGO5: TFloatField;
    qListaNoCruzadosSecundarioM_CTL_PAGO6: TFloatField;
    qListaNoCruzadosSecundarioM_COLECTOR: TFloatField;
    qListaNoCruzadosSecundarioM_FECHA_EMISION: TFloatField;
    qListaNoCruzadosSecundarioM_ULTIMO_MES_FACT: TFloatField;
    qListaNoCruzadosSecundarioM_ESTADO_REGISTRO: TFloatField;
    qListaNoCruzadosSecundarioM_FECHA_INACTIVO: TFloatField;
    qListaNoCruzadosSecundarioM_CODIGO_ARCHIVO: TStringField;
    qListaNoCruzadosSecundarioM_CODIGO_PROMEDIO: TFloatField;
    qListaNoCruzadosSecundarioM_CODIGO_CONTRATO: TFloatField;
    qListaNoCruzadosSecundarioM_CODIGO_LECTURA: TFloatField;
    qListaNoCruzadosSecundarioM_CODIGO_AGRUPA: TFloatField;
    qListaNoCruzadosSecundarioM_CODIGO_U_MEDIDO: TFloatField;
    qListaNoCruzadosSecundarioM_CODIGO_M_AVISOS: TFloatField;
    qListaNoCruzadosSecundarioM_CODIGO_COMENTA: TFloatField;
    qListaNoCruzadosSecundarioM_CODIGO_CORTE: TStringField;
    qListaNoCruzadosSecundarioM_FECHA_CORTE: TFloatField;
    qListaNoCruzadosSecundarioM_FECHA_3EDAD: TFloatField;
    qListaNoCruzadosSecundarioM_CODIGO_3EDAD: TFloatField;
    qListaNoCruzadosSecundarioM_CODIGO_FRAUDE: TFloatField;
    qListaNoCruzadosSecundarioM_FECHA_FRAUDE: TFloatField;
    qListaNoCruzadosSecundarioW_ULTIMO_MES_GRAB: TFloatField;
    qListaNoCruzadosSecundarioM_FECHA_GARANTIA: TFloatField;
    qListaNoCruzadosSecundarioM_CATASTRO: TFloatField;
    qListaNoCruzadosSecundarioM_NO_GARANTIA: TStringField;
    qListaNoCruzadosSecundarioM_REGION: TFloatField;
    qListaNoCruzadosSecundarioM_TOTAL_CARGO_MES: TFloatField;
    qListaNoCruzadosSecundarioM_TELEFONO: TFloatField;
    qListaNoCruzadosSecundarioM_FAX: TFloatField;
    qListaNoCruzadosSecundarioM_ISV: TFloatField;
    qListaNoCruzadosSecundarioM_ISV_ANT: TFloatField;
    qListaNoCruzadosSecundarioM_NUMERO_CORTES: TFloatField;
    qListaNoCruzadosSecundarioM_NIVEL_RESIDENCIAL: TStringField;
    qListaNoCruzadosSecundarioM_BONO_GENERAL: TStringField;
    qListaNoCruzadosSecundarioM_MESES_MOROSOS: TFloatField;
    qListaNoCruzadosSecundarioFECHA_LECTURA_PROGRAMADA: TDateTimeField;
    qListaNoCruzadosSecundarioID_CARGUE_INFO_COMERCIAL: TFloatField;
    qListaCuentasNoLeidasSecundario: TQuery;
    dsListaCuentasNoLeidasSecundario: TDataSource;
    qListaCuentasNoLeidasSecundarioCODIGOADMINISTRATIVO: TFloatField;
    qListaCuentasNoLeidasSecundarioCODIGOGRUPOTRABAJO: TFloatField;
    qListaCuentasNoLeidasSecundarioCODIGODIAL: TFloatField;
    qListaCuentasNoLeidasSecundarioPERIODO: TFloatField;
    qListaCuentasNoLeidasSecundarioFECHALECTURA: TDateTimeField;
    qListaCuentasNoLeidasSecundarioCODIGOAPOYO1: TFloatField;
    qListaCuentasNoLeidasSecundarioLIBRO: TStringField;
    qListaCuentasNoLeidasSecundarioACOMETIDA: TFloatField;
    qListaCuentasNoLeidasSecundarioCLAVE: TFloatField;
    qListaCuentasNoLeidasSecundarioCODIGOCLIENTESGD: TFloatField;
    qListaCuentasNoLeidasSecundarioCICLO: TFloatField;
    qListaCuentasNoLeidasSecundarioCODIGOUNICOM: TFloatField;
    qListaCuentasNoLeidasSecundarioCODUBICACION: TStringField;
    qListaCuentasNoLeidasSecundarioAOLPREDIO: TFloatField;
    qListaCuentasNoLeidasSecundarioAOLPUNTOCONSUMO: TFloatField;
    qListaCuentasNoLeidasSecundarioAOLMEDIDOR: TFloatField;
    qListaCuentasNoLeidasSecundarioNOMBRESUSCRIPTOR: TStringField;
    qListaCuentasNoLeidasSecundarioDIRECCIONSUCRIPTOR: TMemoField;
    qListaCuentasNoLeidasSecundarioNUMEROCONTADOR: TFloatField;
    qListaCuentasNoLeidasSecundarioCODIGOMARCAMEDIDOR: TStringField;
    qListaCuentasNoLeidasSecundarioFACTORMULTIPLICADOR: TFloatField;
    qListaCuentasNoLeidasSecundarioNUMEROAGUJAS: TFloatField;
    qListaCuentasNoLeidasSecundarioTARIFA: TFloatField;
    qListaCuentasNoLeidasSecundarioSECTORCONSUMO: TFloatField;
    qListaCuentasNoLeidasSecundarioFECHAULTIMALECTURA: TFloatField;
    qListaCuentasNoLeidasSecundarioULTIMALECTURA: TFloatField;
    qListaCuentasNoLeidasSecundarioCONSUMO1: TFloatField;
    qListaCuentasNoLeidasSecundarioCONSUMO2: TFloatField;
    qListaCuentasNoLeidasSecundarioCONSUMO3: TFloatField;
    qListaCuentasNoLeidasSecundarioCONSUMO4: TFloatField;
    qListaCuentasNoLeidasSecundarioCONSUMO5: TFloatField;
    qListaCuentasNoLeidasSecundarioCONSUMO6: TFloatField;
    qListaCuentasNoLeidasSecundarioCONSUMO7: TFloatField;
    qListaCuentasNoLeidasSecundarioCONSUMO8: TFloatField;
    qListaCuentasNoLeidasSecundarioCONSUMO9: TFloatField;
    qListaCuentasNoLeidasSecundarioCONSUMO10: TFloatField;
    qListaCuentasNoLeidasSecundarioCONSUMO11: TFloatField;
    qListaCuentasNoLeidasSecundarioCONSUMO12: TFloatField;
    qListaCuentasNoLeidasSecundarioVALORAP: TFloatField;
    qListaCuentasNoLeidasSecundarioCOSTOKWH: TFloatField;
    qListaCuentasNoLeidasSecundarioCARGOCOMERCIALIZACION: TFloatField;
    qListaCuentasNoLeidasSecundarioCARGOREGULACION: TFloatField;
    qListaCuentasNoLeidasSecundarioSALDOANTERIOR: TFloatField;
    qListaCuentasNoLeidasSecundarioX: TFloatField;
    qListaCuentasNoLeidasSecundarioY: TFloatField;
    qListaCuentasNoLeidasSecundarioCODIGOORIGENPROCESO: TFloatField;
    qListaCuentasNoLeidasSecundarioCODIGOMODELOMEDIDOR: TFloatField;
    qListaCuentasNoLeidasSecundarioCODIGOTIPOMEDIDA: TStringField;
    qListaCuentasNoLeidasSecundarioCODIGOITINERARIO: TFloatField;
    qListaCuentasNoLeidasSecundarioFILA: TFloatField;
    qListaCuentasNoLeidasSecundarioCOLUMNA: TFloatField;
    qListaCuentasNoLeidasSecundarioDIMENSIONMEDIDOR: TStringField;
    qListaCuentasNoLeidasSecundarioCOM_INF_ADICIONAL: TStringField;
    qListaCuentasNoLeidasSecundarioCODIGOCONTADOR: TStringField;
    qListaCuentasNoLeidasSecundarioNOMBREMARCAMEDIDOR: TStringField;
    qListaCuentasNoLeidasSecundarioAUTORIZADO: TStringField;
    qListaCuentasNoLeidasSecundarioINDUSTRIAL_AUTORIZA: TStringField;
    qListaCuentasNoLeidasSecundarioS_CONTDOR_REACTIVO: TFloatField;
    qListaCuentasNoLeidasSecundarioS_LECTUR_ACTUAL_R: TFloatField;
    qListaCuentasNoLeidasSecundarioS_LECTUR_DEMANDA: TFloatField;
    qListaCuentasNoLeidasSecundarioS_DEMANDA1: TFloatField;
    qListaCuentasNoLeidasSecundarioS_DEMANDA2: TFloatField;
    qListaCuentasNoLeidasSecundarioS_DEMANDA3: TFloatField;
    qListaCuentasNoLeidasSecundarioS_DEMANDA4: TFloatField;
    qListaCuentasNoLeidasSecundarioS_DEMANDA5: TFloatField;
    qListaCuentasNoLeidasSecundarioS_DEMANDA6: TFloatField;
    qListaCuentasNoLeidasSecundarioS_DEMANDA7: TFloatField;
    qListaCuentasNoLeidasSecundarioS_DEMANDA8: TFloatField;
    qListaCuentasNoLeidasSecundarioS_DEMANDA9: TFloatField;
    qListaCuentasNoLeidasSecundarioS_DEMANDA10: TFloatField;
    qListaCuentasNoLeidasSecundarioS_DEMANDA11: TFloatField;
    qListaCuentasNoLeidasSecundarioS_DEMANDA12: TFloatField;
    qListaCuentasNoLeidasSecundarioS_CONSUMO1: TFloatField;
    qListaCuentasNoLeidasSecundarioS_CONSUMO2: TFloatField;
    qListaCuentasNoLeidasSecundarioS_CONSUMO3: TFloatField;
    qListaCuentasNoLeidasSecundarioS_CONSUMO4: TFloatField;
    qListaCuentasNoLeidasSecundarioS_CONSUMO5: TFloatField;
    qListaCuentasNoLeidasSecundarioS_CONSUMO6: TFloatField;
    qListaCuentasNoLeidasSecundarioS_CONSUMO7: TFloatField;
    qListaCuentasNoLeidasSecundarioS_CONSUMO8: TFloatField;
    qListaCuentasNoLeidasSecundarioS_CONSUMO9: TFloatField;
    qListaCuentasNoLeidasSecundarioS_CONSUMO10: TFloatField;
    qListaCuentasNoLeidasSecundarioS_CONSUMO11: TFloatField;
    qListaCuentasNoLeidasSecundarioS_CONSUMO12: TFloatField;
    qListaCuentasNoLeidasSecundarioS_LECTUR_ANTERIOR_R: TFloatField;
    qListaCuentasNoLeidasSecundarioM_CODIGO_3EDAD: TFloatField;
    qListaCuentasNoLeidasSecundarioM_TARIFA_SERVICIO: TFloatField;
    qListaCuentasNoLeidasSecundarioM_CODIGO_LECTURA: TFloatField;
    qListaCuentasNoLeidasSecundarioLAT: TFloatField;
    qListaCuentasNoLeidasSecundarioLNG: TFloatField;
    Panel11: TPanel;
    lAlertaFacturacion: TLabel;
    Panel12: TPanel;
    sbFacturacionNo: TSpeedButton;
    lAlertaLimite: TLabel;
    Panel13: TPanel;
    sbFacturacion: TSpeedButton;
    ImageList1: TImageList;
    Panel14: TPanel;
    sbRecargar: TSpeedButton;
    Timer1: TTimer;
    sbSegundos: TSpinEdit;
    Label19: TLabel;
    Panel15: TPanel;
    SpeedButton8: TSpeedButton;
    qFueraDeLimite: TQuery;
    qMalFacturado: TQuery;
    sbExportar: TSpeedButton;
    pmExportar: TPopupMenu;
    ExportarListaOdtPadres1: TMenuItem;
    CVS1: TCVS;
    SaveDialog1: TSaveDialog;
    CVS2: TCVS;
    qGeneral: TQuery;
    dsGeneral: TDataSource;
    qResueltas: TQuery;
    FloatField6: TFloatField;
    qPendientes: TQuery;
    FloatField7: TFloatField;
    Panel10: TPanel;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn31: TBitBtn;
    qDesasignar: TQuery;
    CVS3: TCVS;
    pmInformes: TPopupMenu;
    MenuItem1: TMenuItem;
    ClientesaCriticar1: TMenuItem;
    ExportarAnomaliasdeFacturacin1: TMenuItem;
    ExportarAnomaliasdeLectura1: TMenuItem;
    qLecturasTotales: TQuery;
    qClientesCritica: TQuery;
    qCambiarEstadoDesasignados: TQuery;
    qSecundariaFacturacionDESCRIPCION: TStringField;
    qSecundariaFacturacionCODIGOANOMALIA: TStringField;
    qSecundariaFacturacionASIGNADOS: TFloatField;
    qSecundariaFacturacionNO_ASIGNADOS: TFloatField;
    qSecundariaFacturacionTOTAL: TFloatField;
    qPrincipalCODIGOANOMALIA: TStringField;
    qPrincipalDESCRIPCION: TStringField;
    qPrincipalASIGNADOS2: TFloatField;
    qPrincipalNO_ASIGNADOS: TFloatField;
    qPrincipalTOTAL: TFloatField;
    qListadoPrincipalCODIGOANALISTA: TFloatField;
    qListadoPrincipalNOMBREANALISTA: TStringField;
    qListadoPrincipalCUENTASASIGNADAS: TFloatField;
    qListadoPrincipalCUENTASRESUELTAS: TFloatField;
    qListadoPrincipalCUENTASPENDIENTES: TFloatField;
    qListadoPrincipalPORCENTAJE: TFloatField;
    qListadoSecundarioCODIGOADMINISTRATIVO: TFloatField;
    qListadoSecundarioCODIGOGRUPOTRABAJO: TFloatField;
    qListadoSecundarioCODIGODIAL: TFloatField;
    qListadoSecundarioPERIODO: TFloatField;
    qListadoSecundarioFECHALECTURA: TDateTimeField;
    qListadoSecundarioCODIGOAPOYO1: TFloatField;
    qListadoSecundarioLIBRO: TStringField;
    qListadoSecundarioACOMETIDA: TFloatField;
    qListadoSecundarioCLAVE: TFloatField;
    qListadoSecundarioCODIGOCLIENTESGD: TFloatField;
    qListadoSecundarioCICLO: TFloatField;
    qListadoSecundarioCODIGOUNICOM: TFloatField;
    qListadoSecundarioCODUBICACION: TStringField;
    qListadoSecundarioAOLPREDIO: TFloatField;
    qListadoSecundarioAOLPUNTOCONSUMO: TFloatField;
    qListadoSecundarioAOLMEDIDOR: TFloatField;
    qListadoSecundarioNOMBRESUSCRIPTOR: TStringField;
    qListadoSecundarioDIRECCIONSUCRIPTOR: TMemoField;
    qListadoSecundarioNUMEROCONTADOR: TFloatField;
    qListadoSecundarioCODIGOMARCAMEDIDOR: TStringField;
    qListadoSecundarioFACTORMULTIPLICADOR: TFloatField;
    qListadoSecundarioNUMEROAGUJAS: TFloatField;
    qListadoSecundarioTARIFA: TFloatField;
    qListadoSecundarioSECTORCONSUMO: TFloatField;
    qListadoSecundarioFECHAULTIMALECTURA: TFloatField;
    qListadoSecundarioULTIMALECTURA: TFloatField;
    qListadoSecundarioCONSUMO1: TFloatField;
    qListadoSecundarioCONSUMO2: TFloatField;
    qListadoSecundarioCONSUMO3: TFloatField;
    qListadoSecundarioCONSUMO4: TFloatField;
    qListadoSecundarioCONSUMO5: TFloatField;
    qListadoSecundarioCONSUMO6: TFloatField;
    qListadoSecundarioCONSUMO7: TFloatField;
    qListadoSecundarioCONSUMO8: TFloatField;
    qListadoSecundarioCONSUMO9: TFloatField;
    qListadoSecundarioCONSUMO10: TFloatField;
    qListadoSecundarioCONSUMO11: TFloatField;
    qListadoSecundarioCONSUMO12: TFloatField;
    qListadoSecundarioVALORAP: TFloatField;
    qListadoSecundarioCOSTOKWH: TFloatField;
    qListadoSecundarioCARGOCOMERCIALIZACION: TFloatField;
    qListadoSecundarioCARGOREGULACION: TFloatField;
    qListadoSecundarioSALDOANTERIOR: TFloatField;
    qListadoSecundarioX: TFloatField;
    qListadoSecundarioY: TFloatField;
    qListadoSecundarioCODIGOORIGENPROCESO: TFloatField;
    qListadoSecundarioCODIGOTIPOMEDIDA: TStringField;
    qListadoSecundarioCODIGOITINERARIO: TFloatField;
    qListadoSecundarioFILA: TFloatField;
    qListadoSecundarioCOLUMNA: TFloatField;
    qListadoSecundarioDIMENSIONMEDIDOR: TStringField;
    qListadoSecundarioCOM_INF_ADICIONAL: TStringField;
    qListadoSecundarioCODIGOCONTADOR: TStringField;
    qListadoSecundarioNOMBREMARCAMEDIDOR: TStringField;
    qListadoSecundarioAUTORIZADO: TStringField;
    qListadoSecundarioINDUSTRIAL_AUTORIZA: TStringField;
    qListadoSecundarioS_CONTDOR_REACTIVO: TFloatField;
    qListadoSecundarioS_LECTUR_ACTUAL_R: TFloatField;
    qListadoSecundarioS_LECTUR_DEMANDA: TFloatField;
    qListadoSecundarioS_DEMANDA1: TFloatField;
    qListadoSecundarioS_DEMANDA2: TFloatField;
    qListadoSecundarioS_DEMANDA3: TFloatField;
    qListadoSecundarioS_DEMANDA4: TFloatField;
    qListadoSecundarioS_DEMANDA5: TFloatField;
    qListadoSecundarioS_DEMANDA6: TFloatField;
    qListadoSecundarioS_DEMANDA7: TFloatField;
    qListadoSecundarioS_DEMANDA8: TFloatField;
    qListadoSecundarioS_DEMANDA9: TFloatField;
    qListadoSecundarioS_DEMANDA10: TFloatField;
    qListadoSecundarioS_DEMANDA11: TFloatField;
    qListadoSecundarioS_DEMANDA12: TFloatField;
    qListadoSecundarioS_CONSUMO1: TFloatField;
    qListadoSecundarioS_CONSUMO2: TFloatField;
    qListadoSecundarioS_CONSUMO3: TFloatField;
    qListadoSecundarioS_CONSUMO4: TFloatField;
    qListadoSecundarioS_CONSUMO5: TFloatField;
    qListadoSecundarioS_CONSUMO6: TFloatField;
    qListadoSecundarioS_CONSUMO7: TFloatField;
    qListadoSecundarioS_CONSUMO8: TFloatField;
    qListadoSecundarioS_CONSUMO9: TFloatField;
    qListadoSecundarioS_CONSUMO10: TFloatField;
    qListadoSecundarioS_CONSUMO11: TFloatField;
    qListadoSecundarioS_CONSUMO12: TFloatField;
    qListadoSecundarioS_LECTUR_ANTERIOR_R: TFloatField;
    qListadoSecundarioM_CODIGO_3EDAD: TFloatField;
    qListadoSecundarioM_TARIFA_SERVICIO: TFloatField;
    qListadoSecundarioM_CODIGO_LECTURA: TFloatField;
    qListadoSecundarioLAT: TFloatField;
    qListadoSecundarioLNG: TFloatField;
    qListadoSecundarioM_SECTOR_CONSUMO: TFloatField;
    qListadoSecundarioM_ESTADO_REGISTRO: TFloatField;
    qListadoSecundarioCN_CUOTA_FINANCIAMIENTO: TFloatField;
    qListadoSecundarioCN_CUOTA_OTROSCARGOS: TFloatField;
    qListadoSecundarioCN_CUOTA_CONSUMO: TFloatField;
    qListadoSecundarioM_BONO_GENERAL: TStringField;
    qListadoSecundarioS_CARGO_DEMANDA: TFloatField;
    qListadoSecundarioM_MESES_MOROSOS: TFloatField;
    qListadoSecundarioM_FECHA_PAGO: TFloatField;
    qListadoSecundarioM_CODIGO_CONTRATO: TFloatField;
    qListadoSecundarioCN_MONTO: TFloatField;
    qListadoSecundarioCN_MESES_CONTRATO: TFloatField;
    qListadoSecundarioCN_MESES_APLICADOS: TFloatField;
    qListadoSecundarioM_PAGOS_DEL_CICLO: TFloatField;
    qListadoSecundarioCN_SALDO: TFloatField;
    qListadoSecundarioM_CONSUMO_ADICIONAL: TFloatField;
    qListadoSecundarioUSUARIOULTIMAEXPORTACION: TFloatField;
    qListadoSecundarioFECHAULTIMAEXPORTACION: TDateTimeField;
    qListadoSecundarioLEIDO: TStringField;
    qListadoSecundarioM_CONSUMO_ESTIMADO: TFloatField;
    qListadoSecundarioFECHACARGALECTURA: TDateTimeField;
    qListadoSecundarioHL_CODIGO_LECTURA1: TStringField;
    qListadoSecundarioHL_CODIGO_LECTURA2: TStringField;
    qListadoSecundarioHL_CODIGO_LECTURA3: TStringField;
    qListadoSecundarioFACTURA_GOBIERNO: TStringField;
    qListadoSecundarioM_DIAS1: TFloatField;
    qListadoSecundarioM_DIAS2: TFloatField;
    qListadoSecundarioM_DIAS3: TFloatField;
    qListadoSecundarioVERSION_PGI: TStringField;
    qListadoSecundarioPROMEDIOLIBRO: TFloatField;
    qListadoSecundarioANOMALIACONFLICTO: TStringField;
    qListadoSecundarioCODIGOLECTURA: TFloatField;
    qListadoSecundarioCLAVE_1: TStringField;
    qListadoSecundarioLECTURAACTUAL: TStringField;
    qListadoSecundarioCONSUMOACTUAL: TStringField;
    qListadoSecundarioOBSERVACIONES: TStringField;
    qListadoSecundarioCODIGOANOMALIA: TStringField;
    qListadoSecundarioFECHALECTURA_1: TDateTimeField;
    qListadoSecundarioLAT_1: TStringField;
    qListadoSecundarioLNG_1: TStringField;
    qListadoSecundarioCAMBIOPOSICION: TStringField;
    qListadoSecundarioFECHALLEGADA: TDateTimeField;
    qListadoSecundarioFECHASALIDA: TDateTimeField;
    qListadoSecundarioLECTURAREACTIVA: TStringField;
    qListadoSecundarioPOTENCIA: TStringField;
    qListadoSecundarioLIBRO_1: TStringField;
    qListadoSecundarioFECHALECTURA_01: TDateTimeField;
    qListadoSecundarioX_1: TStringField;
    qListadoSecundarioY_1: TStringField;
    qListadoSecundarioPX: TFloatField;
    qListadoSecundarioPY: TFloatField;
    qListadoSecundarioTIPOCLAVE: TStringField;
    qListadoSecundarioACELEROMETRO: TStringField;
    qListadoSecundarioBRUJULA: TStringField;
    qListadoSecundarioCODIGOITINERARIO_1: TFloatField;
    qListadoSecundarioNVLBATERIA: TStringField;
    qListadoSecundarioVALIDO: TStringField;
    qListadoSecundarioTIPO_FACTURA: TStringField;
    qListadoSecundarioVALOR_CONSUMO: TFloatField;
    qListadoSecundarioESTADOLECTURA: TFloatField;
    qListadoSecundarioFACTURO: TStringField;
    qListadoSecundarioLECTURA_CONCRITICA: TStringField;
    qListadoSecundarioCODIGOUSUARIO_CRITICA: TFloatField;
    qListadoSecundarioFECHA_CRITICA: TDateTimeField;
    qListadoSecundarioFECHA_PROGRAMADA: TDateTimeField;
    qListadoSecundarioMARCA_CRITICA: TStringField;
    qListadoSecundarioCODIGOANALISTA: TFloatField;
    qListadoSecundarioAUTORIZADIRECTOR: TStringField;
    qListadoSecundarioAUTORIZAGERENTE: TStringField;
    qListadoSecundarioLECTURAENCONTRADA: TStringField;
    qListadoSecundarioDESVIACIONCONSUMO: TStringField;
    qListadoSecundarioCODIGOANOMALIACONSUMOACT: TStringField;
    qListadoSecundarioCODIGOANOMALIACONSUMOREAC: TStringField;
    qListadoSecundarioCODIGOANOMALIACONSUMODEMAN: TStringField;
    qListadoSecundarioOBSERVACION_CRITICA: TMemoField;
    qListadoSecundarioCODIGOADMINISTRATIVO1: TStringField;
    qListadoSecundarioCODIGOGRUPOTRABAJO1: TStringField;
    qListadoSecundarioTIPOFACTURACION_CRITICA: TFloatField;
    qListadoSecundarioLECTURAREACTIVA_CONCRITICA: TFloatField;
    qListadoSecundarioLECTURADEMANDA_CONCRITICA: TFloatField;
    qListadoSecundarioCODIGOTIPOLECTURA: TFloatField;
    qListadoSecundarioCONSUMO_CONCRITICA: TFloatField;
    qListadoSecundarioVERSION_NAME: TStringField;
    qListadoSecundarioVERSION_CODE: TStringField;
    qListadoSecundarioCONSUMO_REACTIVA: TStringField;
    qListadoSecundarioPROMEDIO_CALCULADO: TStringField;
    qListadoSecundarioCARGO_COMERCIALIZACION: TStringField;
    qListadoSecundarioCARGO_REGULACION: TStringField;
    qListadoSecundarioOTROS_CARGOS: TStringField;
    qListadoSecundarioTOTAL_FACTURA: TStringField;
    qListadoSecundarioCODIGOOBSERVACION: TFloatField;
    qListadoSecundarioTELEFONO_CLIENTE: TStringField;
    qListadoSecundarioCORREO_CLIENTE: TStringField;
    qListadoSecundarioTELMOVIL_CLIENTE: TStringField;
    qListadoSecundarioDESVIACIONREACTIVA: TStringField;
    qListadoSecundarioDESVIACIONDEMANDA: TStringField;
    qListadoSecundarioLECTURAENCONTRADA_REACTIVA: TStringField;
    qListadoSecundarioLECTRUAENCONTRADA_DEMANDA: TStringField;
    qListadoSecundarioLECTURAENCONTRADA_DEMANDA: TStringField;
    qListadoSecundarioNEW_COD_SUPLEMENTARIO: TStringField;
    qListadoSecundarioDESVIACIONCONSUMO_CONCRITICA: TFloatField;
    qListadoSecundarioCONSUMO_REACTIVA_CONCRITICA: TFloatField;
    qListadoSecundarioDESVIACIONREACTIVA_CONCRITICA: TFloatField;
    qListadoSecundarioDESVIACIONDEMANDA_CONCRITICA: TFloatField;
    qListadoSecundarioDIRECCION: TMemoField;
    qSecundariaFacturacionINCMS_ASIGNADOS: TFloatField;
    qPrincipalINCMS_ASIGNADOS: TFloatField;
    GroupBox6: TGroupBox;
    RxDBGrid2: TRxDBGrid;
    Panel3: TPanel;
    Label3: TLabel;
    eFechaLectura: TLabel;
    Label5: TLabel;
    eCuentasCritica: TLabel;
    Label6: TLabel;
    eCuentasResueltas: TLabel;
    Label11: TLabel;
    lProcentajeAvance: TLabel;
    SpeedButton10: TSpeedButton;
    SpeedButton9: TSpeedButton;
    sbFiltrarGestion: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbCodObservacionChange(Sender: TObject);
    procedure dbCodDesvChange(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qPrincipalCalcFields(DataSet: TDataSet);
    procedure sbRefrescarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbFiltrarGestionClick(Sender: TObject);
    procedure qListadoPrincipalCalcFields(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qListaNoCruzadosPrinciapalCalcFields(DataSet: TDataSet);
    procedure SpeedButton2Click(Sender: TObject);
    procedure qListaNoCruzadosPrinciapalAfterScroll(DataSet: TDataSet);
    procedure qListaCuentasNoLeidasCalcFields(DataSet: TDataSet);
    procedure qListaCuentasNoLeidasAfterScroll(DataSet: TDataSet);
    procedure SpeedButton7Click(Sender: TObject);
    procedure sbRecargarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure ExportarListaOdtPadres1Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure ClientesaCriticar1Click(Sender: TObject);
    procedure ExportarAnomaliasdeFacturacin1Click(Sender: TObject);
    procedure ExportarAnomaliasdeLectura1Click(Sender: TObject);
    procedure tbEstadoAnalisisShow(Sender: TObject);
    procedure RxDBGrid1CellClick(Column: TColumn);
    procedure RxDBGrid3CellClick(Column: TColumn);
    procedure RxDBGrid2CellClick(Column: TColumn);

  private
   // Procedure CalcularValores(Valor: String; var Totales , Asignados , SinAsignar : String);
    { Private declarations }
    Function AnalistasNormalFacturacion(qAnalistas : TQuery): Boolean;
    Function AnalistasNormalLecturas(qAnalistas : TQuery): Boolean;
    Function AnalistasNormalTodas(qAnalistas : TQuery): Boolean;
    Procedure RecargarFormulario(Sender: TObject);
    Procedure ControlAlertas;
    Procedure HabilitarBotones(Bandera : Boolean);
  public
   ListaExterna, ListaRotulos, ListaDatos,ListaFrom : TStringList;
   procedure LimpiarFiltro;
  end;

var
  AsignarGrupoTrabajo: TFAsignarAnalista;
  Lista,ListaAnalistas : TStringList;
implementation

uses uFormaEspere;

{$R *.DFM}

procedure TFAsignarAnalista.LimpiarFiltro;
begin
 qPrincipal.SQL.Delete(7);
 qPrincipalSinAsignados.SQL.Delete(7);
 qPrincipalAsignados.SQL.Delete(7);
 qFacturacionAsignados.SQL.Delete(7);
 qSecundarioSinAsignar.SQL.Delete(7);
 qTotalFacturados.SQL.Delete(7);
 qSeleccionAnomaliasFacturacion.SQL.Delete(7);
 qSeleccionAnomaliasLecturas.SQL.Delete(7);
 qSeleccionTodos.SQL.Delete(7);
 qSedeOperativa.SQL.Delete(2);
end;

procedure TFAsignarAnalista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//ModalResult := mrCancel;
 action:=cafree;

end;

procedure TFAsignarAnalista.dbCodObservacionChange(Sender: TObject);
begin
{if dbCodObservacion.Text <> '0' then
 begin
  dbCodObservacion.Font.Color:=clRed;
  dbCodObservacion.Font.Style:= [fsBold];
  dbObservacion.Font.Color:=clRed;
  dbObservacion.Font.Style:= [fsBold];
  dbAol.Font.Color:=clRed;
  dbAol.Font.Style:= [fsBold];
 end
else
 begin
  dbCodObservacion.Font.Style:= [];
  dbCodObservacion.Font.Color:=clBlack;
  dbObservacion.Font.Color:=clBlack;
  dbObservacion.Font.Style:= [];
  dbAol.Font.Color:=clBlack;
  dbAol.Font.Style:= [];
 end;  }
end;

procedure TFAsignarAnalista.dbCodDesvChange(Sender: TObject);
begin
 {if dbCodDesv.Text <> '0' then
 begin
  dbCodDesv.Font.Color:=clRed;
  dbCodDesv.Font.Style:= [fsBold];
  dbDesv.Font.Color:=clRed;
  dbDesv.Font.Style:= [fsBold];
  dbAol.Font.Color:=clRed;
  dbAol.Font.Style:= [fsBold];
 end
else
 begin
  dbCodDesv.Font.Color:=clBlack;
  dbCodDesv.Font.Style:= [];
  dbDesv.Font.Color:=clBlack;
  dbDesv.Font.Style:= [];
  dbAol.Font.Color:=clBlack;
  dbAol.Font.Style:= [];
 end;}
end;

procedure TFAsignarAnalista.BitBtn2Click(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TFAsignarAnalista.BitBtn31Click(Sender: TObject);
begin
 if rbAnalistasSeleccionados.Checked then
 begin
     if Application.MessageBox(PChar('¿ Esta seguro que desea desasignar las cuentas a los analistas seleccionados ?'), 'Confirmación',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
      begin
              if   ListaAnalistas.Count >0 then
             begin
             qCambiarEstadoDesasignados.CLOSE;
             qCambiarEstadoDesasignados.SQL.Delete(2);
             qCambiarEstadoDesasignados.SQL.Insert(2,'CODIGOANALISTA IN ('+ListaAnalistas.CommaText+')');
             qCambiarEstadoDesasignados.ParamByName('FECHALECTURA').AsString := eFechaLectura.Caption;
             qCambiarEstadoDesasignados.ExecSQL;

             qDesasignar.CLOSE;
             qDesasignar.SQL.Delete(2);
             qDesasignar.SQL.Insert(2,'CODIGOANALISTA IN ('+ListaAnalistas.CommaText+')');
             qDesasignar.ParamByName('FECHALECTURA').AsString := eFechaLectura.Caption;
             qDesasignar.ExecSQL;

             IF qDesasignar.RowsAffected >0 then
             begin
             messagedlg('Se han desasignados : '+IntToStr(qDesasignar.RowsAffected)+ ' cuentas.',mtInformation,[mbOk],0);
             RecargarFormulario(Sender);
             end;
             end
             else
             messagedlg('Es necesario que selecciones al menos a un analista para realizar la desasignación.',mtWarning,[mbOk],0);
    end;
 end;
end;

procedure TFAsignarAnalista.FormShow(Sender: TObject);
var
Total,TotalAsignados,TotalSinAsignar : Integer;
begin
  qCoordinadorGrupoTrabajo.open;
  qSedeOperativa.open;

  
 ListaExterna := TStringList.Create;
 ListaRotulos := TStringList.Create;
 ListaDatos := TStringList.Create;
 ListaFrom  := TStringList.Create;

{qListadoPrincipal.close;
qListadoPrincipal.open;

// ABRIR LISTADO PRINCIAPAL CON TODA LA INFORMACIÓN.
qPrincipal.ParamByName('FECHALECTURA').AsString :=eFechaLectura.Caption ;
qPrincipal.Open;

qSecundariaFacturacion.open;  }


{qListaCuentasNoLeidas.ParamByName('FECHALECTURA').AsString := eFechaLectura.Caption;
qListaCuentasNoLeidas.open;  }
{
qListaNoCruzadosPrinciapal.ParamByName('FECHALECTURA').AsString := eFechaLectura.Caption;
qListaNoCruzadosPrinciapal.open;  }

{// TOTALIZO CADA UNA DE LAS CANTIDAD DEL LISTADO PRINCIPAL.
Total := 0;
TotalAsignados :=0;
TotalSinAsignar := 0;

qPrincipal.First; {

 {while not  qPrincipal.Eof  do
 begin
  Total := Total + qPrincipalCANTIDAD.AsInteger;
  TotalAsignados := TotalAsignados + qPrincipalNumeroAsignados.AsInteger;
  TotalSinAsignar := TotalSinAsignar + qPrincipalNumeroNoAsignados.AsInteger;
 qPrincipal.Next;
 end;

qPrincipal.First;

lTotal.Caption :=  IntToStr(Total);
lTotalAsignados.Caption :=  IntToStr(TotalAsignados);
lTotalNoAsignados.Caption :=  IntToStr(TotalSinAsignar);   }


// CALCULAMOS LOS VALORES DE LA PATE SUPERIOR DE LA PANTALLA


{eCuentasCritica.Caption :=   qClientesCritica.FieldByName('CANTIDAD').AsString;
eCuentasResueltas.Caption :=  IntToStr(qCuentasResultas.FieldByName('CANTIDAD').AsInteger);  }
{Total := qClientesCritica.FieldByName('CANTIDAD').AsInteger;

if Total = 0 then
Total := 1;

lProcentajeAvance.Caption :=   FloatToStr(Round(qCuentasResultas.FieldByName('CANTIDAD').AsInteger*100/Total)) + '%';}


// INFORMACION DEL LISTADO DE CONSUMO



{Total := 0;
TotalAsignados :=0;
TotalSinAsignar := 0;    }

{qSecundariaFacturacion.First; }

 {{while not  qSecundariaFacturacion.Eof  do
 begin
  Total := Total + qSecundariaFacturacionTotal.AsInteger;
  TotalAsignados := TotalAsignados + qSecundariaFacturacionAsignados.AsInteger;
  TotalSinAsignar := TotalSinAsignar + qSecundariaFacturacionNoAsignados.AsInteger;
  qSecundariaFacturacion.Next;
 end;
qSecundariaFacturacion.First; }



{lFacturacion.Caption := IntToStr(Total);
lFacturacionAsignados.Caption := IntToStr(TotalAsignados);
lFacturacionNoAsignados.Caption := IntToStr(TotalSinAsignar);  }

end;

procedure TFAsignarAnalista.qPrincipalCalcFields(DataSet: TDataSet);
var
qConsulta : TQuery;
Fecha,Analista : STring;
 begin
{ /// CONOCER LAS CUENTAS ASIGNADAS PARA CADA TIPO DE ANOMALIA

 qPrincipalAsignados.Close;
 qPrincipalAsignados.ParamByName('FECHALECTURA').AsString := eFechaLectura.Caption;
 qPrincipalAsignados.ParamByName('CODIGOANOMALIA').AsString := qPrincipalCODIGOANOMALIA.AsString;
 qPrincipalAsignados.Open;
 qPrincipalNumeroAsignados.AsInteger := qPrincipalAsignados.FieldByName('CANTIDAD').AsInteger;

 qPrincipalSinAsignados.Close;
 qPrincipalSinAsignados.ParamByName('FECHALECTURA').AsString := eFechaLectura.Caption;
 qPrincipalSinAsignados.ParamByName('CODIGOANOMALIA').AsString := qPrincipalCODIGOANOMALIA.AsString;
 qPrincipalSinAsignados.Open;
 qPrincipalNumeroNoAsignados.AsInteger  := qPrincipalSinAsignados.FieldByName('CANTIDAD').AsInteger;
}
 end;

procedure TFAsignarAnalista.sbRefrescarClick(Sender: TObject);
begin
fFormaEspere := TfFormaEspere.Create(Application);
fFormaEspere.ProgressBar1.Max := 2;
fFormaEspere.lbMotivo.Caption := 'Recargando información...';
fFormaEspere.Show;
fFormaEspere.Refresh;
fFormaEspere.ProgressBar1.Position := 1;
fFormaEspere.Refresh;

qListadoPrincipal.close;
qListadoPrincipal.ParamByName('FECHALECTURA').AsString :=   eFechaLectura.caption;
qListadoPrincipal.open;

fFormaEspere.lbMotivo.Caption := 'Mostrando datos...';
fFormaEspere.ProgressBar1.Position := 1;
fFormaEspere.Refresh;


fFormaEspere.Free;
end;

procedure TFAsignarAnalista.SpeedButton1Click(Sender: TObject);
var
 fSeleccionarAnalista: TfSeleccionarAnalista;
 i : Integer;
begin
fSeleccionarAnalista := TfSeleccionarAnalista.Create(Self);
fSeleccionarAnalista.qDatos.Open;
if fSeleccionarAnalista.ShowModal = mrOk then
begin
 if fSeleccionarAnalista.dbgDatos.SelectedRows.Count > 0 then
 begin
      ListaAnalistas.Clear;
      with fSeleccionarAnalista do
      begin
           for i:=0 to dbgDatos.SelectedRows.Count-1 do
           begin
           qDatos.BookMark :=  dbgDatos.SelectedRows.Items[i];
           ListaAnalistas.Add(qDatos.FieldByName('CODIGOANALISTA').AsString);
           end;
      end;

 end;
 eanalistasdisponibles.Text :=  IntToStr(ListaAnalistas.Count);
end;
end;

procedure TFAsignarAnalista.sbFiltrarGestionClick(Sender: TObject);
Var CadFrom,s : String;
Total,TotalAsignados,TotalSinAsignar : Integer;
Valor : Integer;
begin
  Lista := GetQueryFiltroCriticaGestion(ListaRotulos, ListaDatos, ListaFrom);
  If Lista <> Nil then
  begin
    qPrincipal.close;
    LimpiarFiltro;

// CAMBIOS EN LOS TOTALES

lFacturacion.Caption := IntToStr(0);
lFacturacionAsignados.Caption := IntToStr(0);
lFacturacionNoAsignados.Caption := IntToStr(0);

    // CAMBIOS EN QUERYES
    qPrincipal.SQl.Insert(7,Lista.Text);
    qPrincipalSinAsignados.SQL.Insert(7,Lista.Text);                 
    qPrincipalAsignados.SQL.Insert(7,Lista.Text);
    qSeleccionAnomaliasFacturacion.SQL.Insert(7,Lista.Text);
    qSeleccionAnomaliasLecturas.SQL.Insert(7,Lista.Text);
    qSeleccionTodos.SQL.Insert(7,Lista.Text);
    qSedeOperativa.SQL.Insert(2,Lista.Text);

    qSedeOperativa.Open;
    lSede.Caption :=  qSedeOperativa.FieldByName('NOMBRESEDEOPERATIVA').AsString;


// ABRIR LISTADO PRINCIAPAL CON TODA LA INFORMACIÓN.
qPrincipal.ParamByName('FECHALECTURA').AsString :=eFechaLectura.Caption ;
qPrincipal.Open;

// TOTALIZO CADA UNA DE LAS CANTIDAD DEL LISTADO PRINCIPAL.
Total := 0;
TotalAsignados :=0;
TotalSinAsignar := 0;
 {
 while not  qPrincipal.Eof  do
 begin
  Total := Total + qPrincipalCANTIDAD.AsInteger;
  TotalAsignados := TotalAsignados + qPrincipalNumeroAsignados.AsInteger;
  TotalSinAsignar := TotalSinAsignar + qPrincipalNumeroNoAsignados.AsInteger;
 qPrincipal.Next;
 end;        }

qPrincipal.First;

lTotal.Caption :=  IntToStr(Total);
lTotalAsignados.Caption :=  IntToStr(TotalAsignados);
lTotalNoAsignados.Caption :=  IntToStr(TotalSinAsignar);


// CALCULAMOS LOS VALORES DE LA PATE SUPERIOR DE LA PANTALLA

qCuentasResultas.close;
qCuentasResultas.ParamByName('FECHALECTURA').AsString :=  eFechaLectura.Caption;
qCuentasResultas.Open;


eCuentasCritica.Caption :=   IntToStr(Total);
eCuentasResueltas.Caption :=  IntToStr(qCuentasResultas.FieldByName('CANTIDAD').AsInteger);

if Total = 0 then
Total := 1;

lProcentajeAvance.Caption :=   FloatToStr(Round(qCuentasResultas.FieldByName('CANTIDAD').AsInteger*100/Total)) + '%';


// INFORMACION DEL LISTADO DE CONSUMO


qFacturacionAsignados.SQl.Insert(7,Lista.Text);       
qSecundarioSinAsignar.SQL.Insert(6,Lista.Text);
qTotalFacturados.SQL.Insert(7,Lista.Text);

qSecundariaFacturacion.close;
qSecundariaFacturacion.ParamByName('FECHALECTURA').AsString :=eFechaLectura.Caption;
qSecundariaFacturacion.open;

Total := 0;
TotalAsignados :=0;
TotalSinAsignar := 0;
 {
 while not  qSecundariaFacturacion.Eof  do
 begin
  Total := Total + qSecundariaFacturacionTotal.AsInteger;
  TotalAsignados := TotalAsignados + qSecundariaFacturacionAsignados.AsInteger;
  TotalSinAsignar := TotalSinAsignar + qSecundariaFacturacionNoAsignados.AsInteger;

  qSecundariaFacturacion.Next;
 end;


lFacturacion.Caption := IntToStr(Total);
lFacturacionAsignados.Caption := IntToStr(TotalAsignados);
lFacturacionNoAsignados.Caption := IntToStr(TotalSinAsignar);
                                                                }

end;

end;

procedure TFAsignarAnalista.qListadoPrincipalCalcFields(DataSet: TDataSet);
var
qAsignado : TQuery;
Asignadas,NoAsignadas : Integer;
begin
{
  try
  qAsignado := TQuery.Create(Self);
  qAsignado.DatabaseName := 'BaseDato';
  qAsignado.SQL.Clear;
  qAsignado.SQL.Add('SELECT COUNT(*) as CANTIDAD ');
  qAsignado.SQL.Add('FROM SIGCOM_LECTURA S, SGC_CLASES C  ,SGC_ITINERARIO I, SGC_GRUPOITINERARIO G, C_GRUPOAOL GA   ');
  qAsignado.SQL.Add('WHERE ESTADOLECTURA in (2,5,4) AND S.CODIGOANOMALIA = C.CODIGOCLASE AND S.VALIDO !=''SI''  ');
  qAsignado.SQL.Add('AND S.FECHA_PROGRAMADA=TO_DATE(:FECHALECTURA,''DD/MM/YYYY'') AND  S.CODIGOANALISTA='+qListadoPrincipalCODIGOANALISTA.AsString+'   ');
  qAsignado.SQL.Add('AND S.CODIGOITINERARIO = I.CODIGOITINERARIO ');
  qAsignado.SQL.Add('AND G.CODIGOGRUPOITINERARIO = I.CODIGOGRUPOITINERARIO ');
  qAsignado.SQL.Add('AND GA.CODIGOGRUPOAOL=G.CODIGOGRUPOAOL  ');
  qAsignado.ParamByName('FECHALECTURA').AsString :=  eFechaLectura.Caption;
  qAsignado.open;


  qResueltas.close;
  qResueltas.ParamByName('FECHALECTURA').AsString :=  eFechaLectura.Caption;
  qResueltas.ParamByName('CODIGOANALISTA').AsString :=  qListadoPrincipalCODIGOANALISTA.AsString;
  qResueltas.open;

  qPendientes.close;
  qPendientes.ParamByName('FECHALECTURA').AsString :=  eFechaLectura.Caption;
  qPendientes.ParamByName('CODIGOANALISTA').AsString :=  qListadoPrincipalCODIGOANALISTA.AsString;
  qPendientes.open;

  qListadoPrincipalCUENTASASIGNADAS.AsInteger := qAsignado.FieldByName('CANTIDAD').AsInteger;

  qListadoPrincipalCUENTASPENDIENTES.AsInteger := qPendientes.FieldByName('CANTIDAD').AsInteger;
  Asignadas := qAsignado.FieldByName('CANTIDAD').AsInteger;

 { qAsignado.close;
  qAsignado.SQL.Delete(3);
  qAsignado.SQL.Insert(3,'AND FECHA_CRITICA IS NOT NULL ');
  qAsignado.Open;   }
  {
  qListadoPrincipalCUENTASRESUELTAS.AsInteger := qResueltas.FieldByName('CANTIDAD').AsInteger;
  NoAsignadas  := qResueltas.FieldByName('CANTIDAD').AsInteger;


  IF Asignadas = 0 then
  Asignadas:=1;

  qListadoPrincipalPORCENTAJE.AsInteger :=  Round((NoAsignadas*100)/Asignadas);

  finally
  qAsignado.Free;
  end;

  }
end;

procedure TFAsignarAnalista.BitBtn1Click(Sender: TObject);
var
Proceso : Boolean;
begin

Proceso := False;
/// ASIGANCION DE SUPERVISORES
  if rbAnalistasTodos.Checked then
  begin
  // 1. Opción con todos los analistas activos.
  {
  Estos son todos analistas que estan en estado activo.
  }
     if rbDistribucionNormal.Checked then
     begin
       // 1. Opción Distribución Normal
          if rbSeleccionListadoPrincipal.Checked then
          begin
          // 1. Opcion Selección Listado Principal
              ShowMessage('Opción en Construcción');
          end
          else if rbSelecconTablaFacturacion.Checked then
          begin
          // 2. Opción de Tabla de Facturación (Dependiendo el filtro )
          Proceso:=AnalistasNormalFacturacion(qCoordinadorGrupoTrabajo);
          end
          else if rbSeleccionTablaLectura.Checked then
          begin
          // 3. Opción de Tabla de Lecturas (Dependiendo el filtro )
          Proceso:=AnalistasNormalLecturas(qCoordinadorGrupoTrabajo);
          end
          else if rbtodoellistado.Checked then
          begin
          // 4. Opción de todo el Listado Principal
             ShowMessage('Opción en Construcción');
          end
          else if eTodas.Checked then
          begin
           // 4. Opción de todas Las Existentes (Dependiendo el filtro )
           Proceso:=  AnalistasNormalTodas(qCoordinadorGrupoTrabajo);
          end;

     end
     else if rbDistribucionEquivalente.Checked then
     begin
      // 2. Opción Distribución Equivalente

          if eTodas.Checked then
          begin
           // 4. Opción de todas Las Existentes (Dependiendo el filtro )

          end
          else
          messagedlg('Esta Selección no tendra ninguna diferencia con la ( Distribución Normal ), Selecciona distribución normal.',mtInformation,[mbOk],0);

     end;

  end
  else if rbAnalistasSeleccionados.Checked then
  begin
   // 2. Opción con todos los analistas seleccionados.
   if rbDistribucionNormal.Checked then
     begin
       // 1. Opción Distribución Normal
          if rbSeleccionListadoPrincipal.Checked then
          begin
          // 1. Opcion Selección Listado Principal
            ShowMessage('Opción en Construcción');
          end
          else if rbSelecconTablaFacturacion.Checked then
          begin
          // 2. Opción de Tabla de Facturación (Dependiendo el filtro )
             if   ListaAnalistas.Count >0 then
             begin
             qAnalistasSeleccionados.SQL.Delete(2);
             qAnalistasSeleccionados.SQL.Insert(2,'CODIGOANALISTA IN ('+ListaAnalistas.CommaText+')');
             Proceso:=AnalistasNormalFacturacion(qAnalistasSeleccionados);
             end
             else
             messagedlg('Es necesario que selecciones al menos a un analista para realizar la asignación.',mtWarning,[mbOk],0);
          end
          else if rbSeleccionTablaLectura.Checked then
          begin
          // 3. Opción de Tabla de Lecturas (Dependiendo el filtro )
             if   ListaAnalistas.Count >0 then
             begin
             qAnalistasSeleccionados.SQL.Delete(2);
             qAnalistasSeleccionados.SQL.Insert(2,'CODIGOANALISTA IN ('+ListaAnalistas.CommaText+')');
             Proceso:=AnalistasNormalLecturas(qAnalistasSeleccionados);
             end
             else
             messagedlg('Es necesario que selecciones al menos a un analista para realizar la asignación.',mtWarning,[mbOk],0);
          end
          else if rbtodoellistado.Checked then
          begin
          // 4. Opción de todo el Listado Principal
            ShowMessage('Opción en Construcción');
          end
          else if eTodas.Checked then
          begin
           // 4. Opción de todas Las Existentes (Dependiendo el filtro )
             if   ListaAnalistas.Count >0 then
             begin
             qAnalistasSeleccionados.SQL.Delete(2);
             qAnalistasSeleccionados.SQL.Insert(2,'CODIGOANALISTA IN ('+ListaAnalistas.CommaText+')');
             Proceso:=AnalistasNormalTodas(qAnalistasSeleccionados);
             end
             else
             messagedlg('Es necesario que selecciones al menos a un analista para realizar la asignación.',mtWarning,[mbOk],0);
          end;

     end
     else if rbDistribucionEquivalente.Checked then
     begin
      // 2. Opción Distribución Equivalente

          if eTodas.Checked then
          begin
           // 4. Opción de todas Las Existentes (Dependiendo el filtro )

          end
          else
          messagedlg('Esta Selección no tendra ninguna diferencia con la ( Distribución Normal ), Selecciona distribución normal.',mtInformation,[mbOk],0);
     end;
  end
  else if rbAnalistaSeleccionado.Checked then
  begin
   // 3. Opción con el analista Elejido.
          if rbSeleccionListadoPrincipal.Checked then
          begin
          // 1. Opcion Selección Listado Principal
          ShowMessage('Opción en Construcción');
          end
          else if rbSelecconTablaFacturacion.Checked then
          begin
          // 2. Opción de Tabla de Facturación (Dependiendo el filtro )
          if   not (Trim(DBLookupComboBox1.Text)='') then
             begin
             qAnalistasSeleccionados.SQL.Delete(2);
             qAnalistasSeleccionados.SQL.Insert(2,'CODIGOANALISTA IN ('+qCoordinadorGrupoTrabajoCODIGOANALISTA.AsString+')');
             Proceso:=AnalistasNormalFacturacion(qAnalistasSeleccionados);
             end
             else
             messagedlg('Es necesario que selecciones  un analista para realizar la asignación.',mtWarning,[mbOk],0);
          end
          else if rbSeleccionTablaLectura.Checked then
          begin
          // 3. Opción de Tabla de Lecturas (Dependiendo el filtro )
          if  not (Trim(DBLookupComboBox1.Text)='') then
             begin
             qAnalistasSeleccionados.SQL.Delete(2);
             qAnalistasSeleccionados.SQL.Insert(2,'CODIGOANALISTA IN ('+qCoordinadorGrupoTrabajoCODIGOANALISTA.AsString+')');
             Proceso:=AnalistasNormalLecturas(qAnalistasSeleccionados);
             end
             else
             messagedlg('Es necesario que selecciones al menos a un analista para realizar la asignación.',mtWarning,[mbOk],0);
          end
          else if rbtodoellistado.Checked then
          begin
          // 4. Opción de todo el Listado Principal
          ShowMessage('Opción en Construcción');
          end
          else if eTodas.Checked then
          begin
           // 4. Opción de todas Las Existentes (Dependiendo el filtro )
           if   not (Trim(DBLookupComboBox1.Text)='') then
             begin
            qAnalistasSeleccionados.SQL.Delete(2);
            qAnalistasSeleccionados.SQL.Insert(2,'CODIGOANALISTA IN ('+qCoordinadorGrupoTrabajoCODIGOANALISTA.AsString+')');
            Proceso:= AnalistasNormalTodas(qAnalistasSeleccionados);
             end
             else
             messagedlg('Es necesario que selecciones  un analista para realizar la asignación.',mtWarning,[mbOk],0);
          end;
  end;

  if Proceso then
  RecargarFormulario(Sender);

end;

function TFAsignarAnalista.AnalistasNormalFacturacion(qAnalistas : TQuery): Boolean;
var
qQuery : TQuery;
begin
Result := False;

    try
    qQuery := TQuery.Create(Self);
    qQuery.DatabaseName := 'BaseDato';

    qAnalistas.open;

    if qSecundariaFacturacionNO_ASIGNADOS.AsInteger > 0 then
    begin
     messagedlg('Se van a Asignar '+qSecundariaFacturacionNO_ASIGNADOS.AsString+' cuentas.',mtInformation,[mbOk],0);

      if not qAnalistas.IsEmpty then
      begin
      qAnalistas.First;

      qSeleccionAnomaliasFacturacion.close;
      qSeleccionAnomaliasFacturacion.ParamByName('FECHALECTURA').AsString := eFechaLectura.Caption;
      qSeleccionAnomaliasFacturacion.ParamByName('CODIGOANOMALIACRITICA').AsString := qSecundariaFacturacionCODIGOANOMALIA.AsString;
      qSeleccionAnomaliasFacturacion.open;

      qSeleccionAnomaliasFacturacion.First;

      if not qSeleccionAnomaliasFacturacion.IsEmpty THEN
      begin

      while NOT qSeleccionAnomaliasFacturacion.Eof do
      begin

      qUpdateCuentas.close;
      qUpdateCuentas.ParamByName('CLAVE').AsString :=   qSeleccionAnomaliasFacturacion.FieldByName('CLAVE').AsString;
      qUpdateCuentas.ParamByName('FECHALECTURA').AsString :=  eFechaLectura.Caption;
      qUpdateCuentas.ParamByName('CODIGOANALISTA').AsString := qAnalistas.FieldByName('CODIGOANALISTA').AsString;
      qUpdateCuentas.ExecSQL;

      if not qAnalistas.Eof then
      qAnalistas.Next
      else
      qAnalistas.First;

      qSeleccionAnomaliasFacturacion.Next;
      end;
      Result := True;
      messagedlg('Se han terminado la Asignación de analistas.',mtInformation,[mbOk],0);
      end
      else
      messagedlg('Ha ocurrido un error al intentar obtener las cuentas para realizar la asignación, Contacte a Soporte Tecnico.',mtError,[mbOk],0);

      end
      else
      messagedlg('No hay Analistas activos, no es posible realizar la asignación.',mtInformation,[mbOk],0);

    end
    else
    messagedlg('No hay cuentas para sera ser asignadas, intenta con un filtro diferente.',mtInformation,[mbOk],0);

    Except
    on E : Exception do
    messagedlg('Ha ocurrido un error al intentar realizar la asignación. Error : '+E.Message,mtError ,[mbOk],0);
    end;

    qQuery.Free;
end;

function TFAsignarAnalista.AnalistasNormalLecturas(qAnalistas : TQuery): Boolean;
var
qQuery : TQuery;
begin
Result := False;
    try
    qQuery := TQuery.Create(Self);
    qQuery.DatabaseName := 'BaseDato';

    qAnalistas.Open;

    if qPrincipalNO_ASIGNADOS.AsInteger > 0 then
    begin
     messagedlg('Se van a Asignar '+qPrincipalNO_ASIGNADOS.AsString+' cuentas.',mtInformation,[mbOk],0);

      if not qAnalistas.IsEmpty then
      begin
      qAnalistas.First;

      qSeleccionAnomaliasLecturas.close;
      qSeleccionAnomaliasLecturas.ParamByName('FECHALECTURA').AsString := eFechaLectura.Caption;
      qSeleccionAnomaliasLecturas.ParamByName('CODIGOANOMALIA').AsString := qPrincipalCODIGOANOMALIA.AsString;
      qSeleccionAnomaliasLecturas.open;

      qSeleccionAnomaliasLecturas.First;

      if not qSeleccionAnomaliasLecturas.IsEmpty THEN
      begin

      while NOT qSeleccionAnomaliasLecturas.Eof do
      begin

      qUpdateCuentas.close;
      qUpdateCuentas.ParamByName('CLAVE').AsString :=   qSeleccionAnomaliasLecturas.FieldByName('CLAVE').AsString;
      qUpdateCuentas.ParamByName('FECHALECTURA').AsString :=  eFechaLectura.Caption;
      qUpdateCuentas.ParamByName('CODIGOANALISTA').AsString := qAnalistas.FieldByName('CODIGOANALISTA').AsString;
      qUpdateCuentas.ExecSQL;

      if not qAnalistas.Eof then
      qAnalistas.Next
      else
      qAnalistas.First;

      qSeleccionAnomaliasLecturas.Next;
      end;
      Result := True;
      messagedlg('Se han terminado la Asignación de analistas.',mtInformation,[mbOk],0);
      end
      else
      messagedlg('Ha ocurrido un error al intentar obtener las cuentas para realizar la asignación, Contacte a Soporte Tecnico.',mtError,[mbOk],0);

      end
      else
      messagedlg('No hay Analistas activos, no es posible realizar la asignación.',mtInformation,[mbOk],0);

    end
    else
    messagedlg('No hay cuentas para sera ser asignadas, intenta con un filtro diferente.',mtInformation,[mbOk],0);

    Except
    on E : Exception do
    messagedlg('Ha ocurrido un error al intentar realizar la asignación. Error : '+E.Message,mtError ,[mbOk],0);
    end;

    qQuery.Free;
end;

function TFAsignarAnalista.AnalistasNormalTodas(qAnalistas : TQuery): Boolean;
var
qQuery : TQuery;
begin
Result := False;
    try
    qQuery := TQuery.Create(Self);
    qQuery.DatabaseName := 'BaseDato';

    qAnalistas.Open;

      if not qAnalistas.IsEmpty then
      begin
      qAnalistas.First;

      qSeleccionTodos.close;
      qSeleccionTodos.ParamByName('FECHALECTURA').AsString := eFechaLectura.Caption;
      qSeleccionTodos.open;

      qSeleccionTodos.First;

      if not qSeleccionTodos.IsEmpty THEN
      begin

      while NOT qSeleccionTodos.Eof do
      begin

      qUpdateCuentas.close;
      qUpdateCuentas.ParamByName('CLAVE').AsString :=   qSeleccionTodos.FieldByName('CLAVE').AsString;
      qUpdateCuentas.ParamByName('FECHALECTURA').AsString :=  eFechaLectura.Caption;
      qUpdateCuentas.ParamByName('CODIGOANALISTA').AsString := qAnalistas.FieldByName('CODIGOANALISTA').AsString;
      qUpdateCuentas.ExecSQL;

      if not qAnalistas.Eof then
      qAnalistas.Next
      else
      qAnalistas.First;

      qSeleccionTodos.Next;
      end;
      Result := True;
      messagedlg('Se han terminado la Asignación de analistas.',mtInformation,[mbOk],0);
      end
      else
      messagedlg('Ha ocurrido un error al intentar obtener las cuentas para realizar la asignación, Contacte a Soporte Tecnico.',mtError,[mbOk],0);

      end
      else
      messagedlg('No hay Analistas activos, no es posible realizar la asignación.',mtInformation,[mbOk],0);


    Except
    on E : Exception do
    messagedlg('Ha ocurrido un error al intentar realizar la asignación. Error : '+E.Message,mtError ,[mbOk],0);
    end;

    qQuery.Free;
end;


procedure TFAsignarAnalista.RecargarFormulario(Sender: TObject);
var
Total : Integer;
begin

//ControlAlertas;

lFacturacion.Caption := IntToStr(0);
lFacturacionAsignados.Caption := IntToStr(0);
lFacturacionNoAsignados.Caption := IntToStr(0);

     qListadoPrincipal.close;
     qListadoPrincipal.ParamByName('FECHALECTURA').AsString :=   eFechaLectura.caption;
     qListadoPrincipal.open;

     qPrincipal.close;
     qPrincipal.ParamByName('FECHALECTURA').AsString :=eFechaLectura.Caption;
     qPrincipal.Open;

     qSecundariaFacturacion.close;
     qSecundariaFacturacion.ParamByName('FECHALECTURA').AsString :=eFechaLectura.Caption;
     qSecundariaFacturacion.open;

     qCuentasResultas.close;
     qCuentasResultas.ParamByName('FECHALECTURA').AsString := eFechaLectura.Caption;
     qCuentasResultas.Open;

  qClientesCritica.close;
  qClientesCritica.ParamByName('FECHALECTURA').AsString   := eFechaLectura.Caption;
  qClientesCritica.open;

  Total := qClientesCritica.FieldByName('CANTIDAD').AsInteger;

  eCuentasCritica.Caption :=   qClientesCritica.FieldByName('CANTIDAD').AsString;
  eCuentasResueltas.Caption :=  IntToStr(qCuentasResultas.FieldByName('CANTIDAD').AsInteger);


  //   FormShow(Sender);
     
end;

procedure TFAsignarAnalista.FormCreate(Sender: TObject);
begin
 Lista := TStringList.Create;
 ListaAnalistas := TStringList.Create;
end;

procedure TFAsignarAnalista.qListaNoCruzadosPrinciapalCalcFields(
  DataSet: TDataSet);
var

Query,Query1 : Tquery;
begin

 try
 Query := TQuery.Create(Self);
 Query.DatabaseName := 'BaseDato';

 Query1 := TQuery.Create(Self);
 Query1.DatabaseName := 'BaseDato';


 Query.SQl.clear;
 Query.SQL.Add('SELECT COUNT(*) AS CANTIDAD ');
 Query.SQL.Add('FROM  FPLE180 FP , SIGCOM_LECTURA S ');
 Query.SQL.Add('WHERE FECHA_LECTURA_PROGRAMADA=TO_DATE(:FECHALECTURA,''DD/MM/YYYY'') ');
 Query.SQL.Add('AND FECHA_LECTURA_PROGRAMADA = FECHA_PROGRAMADA  ');
 Query.SQL.Add('AND TO_CHAR (FP.M_CODIGO_CITY * 1000 + FP.M_CODIGO_RUTA, ''000000'')= S.LIBRO  ');
 Query.SQL.Add('AND M_CLAVE_PRIMARIA = S.CLAVE ');
 Query.SQL.Add('AND  S.LIBRO = :LIBRO');
 Query.ParamByName('FECHALECTURA').AsString :=   eFechaLectura.Caption;
 Query.ParamByName('LIBRO').aSsTRING := qListaNoCruzadosPrinciapalLIBRO.AsString;
 Query.Open;
 qListaNoCruzadosPrinciapalCANTIDADLEIDOS.AsString :=  Query.FieldByName('CANTIDAD').AsString;

 if not qListaNoCruzadosPrinciapalCANTIDAD.AsInteger > 0 then
 qListaNoCruzadosPrinciapalCANTIDAD.AsInteger := 1;
 
 qListaNoCruzadosPrinciapalPORCENTAJE.AsInteger := Round(Query.FieldByName('CANTIDAD').AsInteger*100/qListaNoCruzadosPrinciapalCANTIDAD.AsInteger);


 Query1.SQL.Add('SELECT count(*) AS CANTIDAD ');
 Query1.SQL.Add('FROM  FPLE180 FP , SGC_INFOITINERARIO S ');
 Query1.SQL.Add('WHERE FECHA_LECTURA_PROGRAMADA=TO_DATE(:FECHALECTURA,''DD/MM/YYYY'') ');
 Query1.SQL.Add('AND FECHA_LECTURA_PROGRAMADA = FECHALECTURA ');
 Query1.SQL.Add('AND TO_CHAR (FP.M_CODIGO_CITY * 1000 + FP.M_CODIGO_RUTA, ''000000'')= S.LIBRO ');
 Query1.SQL.Add('AND M_CLAVE_PRIMARIA = S.CLAVE ');
 Query1.SQL.Add('AND S.LIBRO = :LIBRO  ');
 Query1.ParamByName('FECHALECTURA').AsString :=   eFechaLectura.Caption;
 Query1.ParamByName('LIBRO').aSsTRING := qListaNoCruzadosPrinciapalLIBRO.AsString;

 Query1.OPEN;

 if Query1.FieldByName('CANTIDAD').AsInteger >0 then
 qListaNoCruzadosPrinciapalCUENTASCRUZADAS.AsString :=  Query1.FieldByName('CANTIDAD').AsString
 else
 qListaNoCruzadosPrinciapalCUENTASCRUZADAS.AsInteger := 0;

 qListaNoCruzadosPrinciapalCUENTASNOCRUZADAS.asInteger :=
 qListaNoCruzadosPrinciapalCANTIDAD.AsInteger - qListaNoCruzadosPrinciapalCUENTASCRUZADAS.AsInteger;

 
 qListaNoCruzadosPrinciapalPORCENTAJENOCRUZA.AsInteger := Round(qListaNoCruzadosPrinciapalCUENTASNOCRUZADAS.asInteger*100/qListaNoCruzadosPrinciapalCANTIDAD.AsInteger);


finally
 Query.Free;
 Query1.Free;
end;

end;

procedure TFAsignarAnalista.SpeedButton2Click(Sender: TObject);
begin
fFormaEspere := TfFormaEspere.Create(Application);
fFormaEspere.ProgressBar1.Max := 2;
fFormaEspere.lbMotivo.Caption := 'Recargando información...';
fFormaEspere.Show;
fFormaEspere.Refresh;
fFormaEspere.ProgressBar1.Position := 1;
fFormaEspere.Refresh;

qListaNoCruzadosPrinciapal.close;
qListaNoCruzadosPrinciapal.ParamByName('FECHALECTURA').AsString :=  qListaLectura.FieldByName('FECHA_PROGRAMADA').AsString ;
qListaNoCruzadosPrinciapal.open;


fFormaEspere.lbMotivo.Caption := 'Mostrando datos...';
fFormaEspere.ProgressBar1.Position := 2;
fFormaEspere.Refresh;


fFormaEspere.Free;
end;

procedure TFAsignarAnalista.qListaNoCruzadosPrinciapalAfterScroll(
  DataSet: TDataSet);
  VAR
  Query : Tquery;
begin

end;

procedure TFAsignarAnalista.qListaCuentasNoLeidasCalcFields(
  DataSet: TDataSet);
var
Query : TQuery;
begin
{try
 { Query := TQuery.Create(Self);
  Query.DatabaseName := 'BaseDato';

  Query.SQL.Add('SELECT COUNT(DISTINCT CLAVE) AS CANTIDAD FROM SIGCOM_LECTURA WHERE CODIGOITINERARIO=:CODIGOITINERARIO ');
  Query.ParamByName('CODIGOITINERARIO').AsString := qListaCuentasNoLeidasCODIGOITINERARIO.AsString;
  Query.Open;
  qListaCuentasNoLeidasCANTIDADLEIDOS.AsString :=  Query.FieldByName('CANTIDAD').AsString;

  qListaCuentasNoLeidasPORCENTAJE.AsInteger :=    Round(Query.FieldByName('CANTIDAD').AsInteger*100/qListaCuentasNoLeidasCLIENTES.AsInteger)

  finally
  Query.Free;
end;       }


end;

procedure TFAsignarAnalista.qListaCuentasNoLeidasAfterScroll(
  DataSet: TDataSet);
  var
  Query : TQuery;
begin
{   qListaCuentasNoLeidasSecundario.Close;
   qListaCuentasNoLeidasSecundario.ParamByName('FECHALECTURA').Asstring :=  eFechaLectura.Caption;
   qListaCuentasNoLeidasSecundario.ParamByName('CODIGOITINERARIO').Asstring := qListaCuentasNoLeidasCODIGOITINERARIO.AsString;
   qListaCuentasNoLeidasSecundario.Open;

  try
   Query := TQuery.Create(Self);
   Query.DatabaseName := 'BaseDato';

   Query.SQL.Text :=  'SELECT COUNT(*) AS CANTIDAD FROM ('+ qListaCuentasNoLeidasSecundario.SQl.Text + ')';
   Query.ParamByName('FECHALECTURA').AsString := eFechaLectura.Caption;
   Query.OPEN;

  Label16.Caption := 'Cuentas por promediar : ' + Query.FieldByName('CANTIDAD').AsString;

  finally
   Query.Free;
  end;    }
end;

procedure TFAsignarAnalista.SpeedButton7Click(Sender: TObject);
begin
fFormaEspere := TfFormaEspere.Create(Application);
fFormaEspere.ProgressBar1.Max := 2;
fFormaEspere.lbMotivo.Caption := 'Recargando información...';
fFormaEspere.Show;
fFormaEspere.Refresh;
fFormaEspere.ProgressBar1.Position := 1;
fFormaEspere.Refresh;
  {

qListaCuentasNoLeidas.close;
qListaCuentasNoLeidas.ParamByName('FECHALECTURA').AsString := eFechaLectura.Caption;
qListaCuentasNoLeidas.open;   }


fFormaEspere.lbMotivo.Caption := 'Mostrando datos...';
fFormaEspere.ProgressBar1.Position := 2;
fFormaEspere.Refresh;

end;


procedure TFAsignarAnalista.sbRecargarClick(Sender: TObject);
begin

if sbRecargar.Down then
begin
Timer1.Enabled := True;
Timer1.Interval := (sbSegundos.Value)*1000;
sbSegundos.Enabled := False;
HabilitarBotones(False);
end
else
begin
sbSegundos.Enabled := True;
Timer1.Enabled := False;
HabilitarBotones(True);
end;
end;

procedure TFAsignarAnalista.Timer1Timer(Sender: TObject);
begin
IF sbRecargar.Down then
 begin
  fFormaEspere := TfFormaEspere.Create(Application);
  fFormaEspere.ProgressBar1.Max := 4;
  fFormaEspere.lbMotivo.Caption := 'Recargando Información...';
  fFormaEspere.Show;
  fFormaEspere.Refresh;
  fFormaEspere.ProgressBar1.Position := 1;
  fFormaEspere.Refresh;
  RecargarFormulario(Sender);
  fFormaEspere.lbMotivo.Caption := 'Terminando...';
  fFormaEspere.ProgressBar1.Position := 4;
  fFormaEspere.Refresh;
  fFormaEspere.Free;

 end
else
begin
Timer1.Enabled := False;
sbSegundos.Enabled := True;
HabilitarBotones(True);
end;
end;

procedure TFAsignarAnalista.HabilitarBotones(Bandera: Boolean);
begin
BitBtn1.Enabled := Bandera;
sbFiltrarGestion.Enabled := Bandera;
sbFacturacionNo.Enabled := Bandera;
sbFacturacion.Enabled := Bandera;
tbEstadoAnalisis.Enabled := Bandera;
SpeedButton8.Enabled := Bandera;
end;

procedure TFAsignarAnalista.SpeedButton8Click(Sender: TObject);
begin
  fFormaEspere := TfFormaEspere.Create(Application);
  fFormaEspere.ProgressBar1.Max := 4;
  fFormaEspere.lbMotivo.Caption := 'Recargando Información...';
  fFormaEspere.Show;
  fFormaEspere.Refresh;
  fFormaEspere.ProgressBar1.Position := 1;
  fFormaEspere.Refresh;
  RecargarFormulario(Sender);
  fFormaEspere.lbMotivo.Caption := 'Terminando...';
  fFormaEspere.ProgressBar1.Position := 4;
  fFormaEspere.Refresh;
  fFormaEspere.Free;
end;

procedure TFAsignarAnalista.ControlAlertas;
begin
qMalFacturado.Close;
qMalFacturado.ParamByName('FECHALECTURA').AsSTring := eFechaLectura.Caption;
qMalFacturado.open;
    /// facturacion
 if qMalFacturado.FieldByName('CANTIDAD').AsInteger >0 then
 begin
 sbFacturacionNo.Glyph := nil;
 ImageList1.GetBitmap(2,sbFacturacionNo.Glyph);
 lAlertaLimite.Caption := qMalFacturado.FieldByName('CANTIDAD').AsString+ ' Anomalias por facturación fuera de limites';
 end
 else
 begin
 sbFacturacionNo.Glyph := nil;
 ImageList1.GetBitmap(1,sbFacturacionNo.Glyph);
 lAlertaLimite.Caption :=' No hay anomalias por facturación fuera de limites';
 end;


qFueraDeLimite.Close;
qFueraDeLimite.ParamByName('FECHALECTURA').AsSTring := eFechaLectura.Caption;
qFueraDeLimite.open;
   // Limites
if qFueraDeLimite.FieldByName('CANTIDAD').AsInteger >0   then
 begin
  sbFacturacion.Glyph := nil;
 ImageList1.GetBitmap(2,sbFacturacion.Glyph);
 lAlertaFacturacion.Caption :=qFueraDeLimite.FieldByName('CANTIDAD').AsString+' Anomalias por facturación no corresponde';
 end
 else
 begin
 sbFacturacion.Glyph := nil;
 ImageList1.GetBitmap(0,sbFacturacion.Glyph);
 lAlertaFacturacion.Caption :=  'Alerta de Facturación no corresponde';
 end;


end;

procedure TFAsignarAnalista.sbExportarClick(Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel1.ClientToScreen(Classes.Point(sbExportar.Left, sbExportar.top));
  pmExportar.Popup(punto.x+10, punto.y+10);
end;

procedure TFAsignarAnalista.ExportarListaOdtPadres1Click(Sender: TObject);
begin
      inherited;
  if SaveDialog1.Execute then
  begin
     dsListadoPrincipal.DataSet.DisableControls;
     CVS1.DataSet := dsListadoPrincipal.DataSet;
     CVS1.FileNameText := SaveDialog1.FileName;
     CVS1.TableExport;
     dsListadoPrincipal.DataSet.EnableControls;
  end;
end;

procedure TFAsignarAnalista.SpeedButton9Click(Sender: TObject);
begin

qGeneral.close;
qGeneral.ParamByName('FECHALECTURA').AsString := eFechaLectura.Caption; 
qGeneral.open;
  if SaveDialog1.Execute then
  begin
     dsGeneral.DataSet.DisableControls;
     CVS1.DataSet := dsGeneral.DataSet;
     CVS1.FileNameText := SaveDialog1.FileName;
     CVS1.TableExport;
     dsGeneral.DataSet.EnableControls;
  end;
end;

procedure TFAsignarAnalista.MenuItem1Click(Sender: TObject);
begin
qLecturasTotales.close;
qLecturasTotales.ParamByName('FECHALECTURA').AsString   := eFechaLectura.caption;
qLecturasTotales.open;

Application.MessageBox(PChar('Los Clientes Leidos en el día '+eFechaLectura.caption+' son : '+qLecturasTotales.FieldByName('CANTIDAD').AsString), 'Información',
      MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
end;

procedure TFAsignarAnalista.SpeedButton10Click(Sender: TObject);
var
  punto: TPoint;
begin
  punto := GroupBox3.ClientToScreen(Classes.Point(SpeedButton10.Left,
    SpeedButton10.top));
  pmInformes.Popup(punto.x + 10, punto.y + 10);
end;

procedure TFAsignarAnalista.ClientesaCriticar1Click(Sender: TObject);
begin
qClientesCritica.close;
qClientesCritica.ParamByName('FECHALECTURA').AsString   := eFechaLectura.caption;
qClientesCritica.open;

Application.MessageBox(PChar('Los Clientes para critica en el día '+eFechaLectura.caption+' son : '+qClientesCritica.FieldByName('CANTIDAD').AsString), 'Información',
      MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
end;

procedure TFAsignarAnalista.ExportarAnomaliasdeFacturacin1Click(
  Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
     dsSuceundariaFacturacion.DataSet.DisableControls;
     CVS1.DataSet := dsSuceundariaFacturacion.DataSet;
     CVS1.FileNameText := SaveDialog1.FileName;
     CVS1.TableExport;
     dsSuceundariaFacturacion.DataSet.EnableControls;
  end;
end;

procedure TFAsignarAnalista.ExportarAnomaliasdeLectura1Click(
  Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
     dsprincipal.DataSet.DisableControls;
     CVS1.DataSet := dsprincipal.DataSet;
     CVS1.FileNameText := SaveDialog1.FileName;
     CVS1.TableExport;
     dsprincipal.DataSet.EnableControls;
  end;
end;

procedure TFAsignarAnalista.tbEstadoAnalisisShow(Sender: TObject);
begin
  qListadoPrincipal.close;
  qListadoPrincipal.ParamByName('FECHALECTURA').AsString :=   eFechaLectura.caption;
  qListadoPrincipal.open;                    
end;

procedure TFAsignarAnalista.RxDBGrid1CellClick(Column: TColumn);
begin
qListadoSecundario.Close;
qListadoSecundario.ParamByName('FECHALECTURA').AsString := eFechaLectura.Caption;
qListadoSecundario.ParamByName('CODIGOANALISTA').AsString := qListadoPrincipalCODIGOANALISTA.AsString;
qListadoSecundario.Open;


lDetalleSuministros.Caption := 'Cuentas : ' + qListadoPrincipalCUENTASASIGNADAS.AsString +' Asignadas ';
end;

procedure TFAsignarAnalista.RxDBGrid3CellClick(Column: TColumn);
begin
rbSelecconTablaFacturacion.Enabled := True;
rbSelecconTablaFacturacion.Checked := True;     
rbSeleccionTablaLectura.Enabled := False;
end;

procedure TFAsignarAnalista.RxDBGrid2CellClick(Column: TColumn);
begin
rbSelecconTablaFacturacion.Enabled := False;
rbSeleccionTablaLectura.Enabled := True;
rbSeleccionTablaLectura.Checked := True;
end;

end.
