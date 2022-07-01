unit uAnalisisFacturacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Db, Buttons, Grids, DBGrids, DBTables,
  ConsDll, uInformacionOriginal, uInformacionMedidor,
  ComCtrls, TeeProcs, TeEngine, Chart, DBChart, Series, uListaCritica, Math,
  uSeleccionarObservacion, ToolWin, ImgList, RXDBCtrl, DBClient;

type
  TFAnalisisFacturacion = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PanelExtras: TPanel;
    qListaLectura: TQuery;
    dsListaLectura: TDataSource;
    qActiva: TQuery;
    dsActiva: TDataSource;
    qActivaM_CLAVE_PRIMARIA: TFloatField;
    qActivaM_CODIGO_CITY: TFloatField;
    qActivaM_CODIGO_RUTA: TFloatField;
    qActivaM_CODIGO_ACOMET: TFloatField;
    qActivaM_NOMBRE_ABONADO: TStringField;
    qActivaM_DIRECC_ABONADO: TStringField;
    qActivaM_CONTADOR_ACTIVO: TFloatField;
    qActivaM_MULTIP_ACTIVO: TFloatField;
    qActivaM_NUMERO_AGUJAS: TFloatField;
    qActivaM_NUMERO_TRANSFORMA: TFloatField;
    qActivaM_FASES: TFloatField;
    qActivaM_NUMERO_DEPOSITO: TFloatField;
    qActivaM_VALOR_DEPOSITO: TFloatField;
    qActivaM_FECHA_CONEXION: TFloatField;
    qActivaM_TARIFA_SERVICIO: TFloatField;
    qActivaM_SECTOR_CONSUMO: TFloatField;
    qActivaM_IDENT: TStringField;
    qActivaM_RTN: TStringField;
    qActivaM_FECHA_ACTUAL: TFloatField;
    qActivaM_FECHA_ANTERIOR: TFloatField;
    qActivaM_LECTURA_ACTUAL: TFloatField;
    qActivaM_LECTURA_ANTERIOR: TFloatField;
    qActivaM_CONSUMO_DEL_MES: TFloatField;
    qActivaM_CONSUMO_ESTIMADO: TFloatField;
    qActivaM_CONSUMO_ADICIONAL: TFloatField;
    qActivaM_DIAS_FACTURADOS: TFloatField;
    qActivaM_CONSUMOS1: TFloatField;
    qActivaM_CONSUMOS2: TFloatField;
    qActivaM_CONSUMOS3: TFloatField;
    qActivaM_CONSUMOS4: TFloatField;
    qActivaM_CONSUMOS5: TFloatField;
    qActivaM_CONSUMOS6: TFloatField;
    qActivaM_CONSUMOS7: TFloatField;
    qActivaM_CONSUMOS8: TFloatField;
    qActivaM_CONSUMOS9: TFloatField;
    qActivaM_CONSUMOS10: TFloatField;
    qActivaM_CONSUMOS11: TFloatField;
    qActivaM_CONSUMOS12: TFloatField;
    qActivaM_DIAS1: TFloatField;
    qActivaM_DIAS2: TFloatField;
    qActivaM_DIAS3: TFloatField;
    qActivaM_DIAS4: TFloatField;
    qActivaM_DIAS5: TFloatField;
    qActivaM_DIAS6: TFloatField;
    qActivaM_DIAS7: TFloatField;
    qActivaM_DIAS8: TFloatField;
    qActivaM_DIAS9: TFloatField;
    qActivaM_DIAS10: TFloatField;
    qActivaM_DIAS11: TFloatField;
    qActivaM_DIAS12: TFloatField;
    qActivaM_COBRO_ENERGIA: TFloatField;
    qActivaM_COBRO_DIESEL: TFloatField;
    qActivaM_COBRO_INTERES: TFloatField;
    qActivaM_COBRO_PUBLICO: TFloatField;
    qActivaM_OTROS_DR_CR: TFloatField;
    qActivaM_SUBSIDIO: TFloatField;
    qActivaM_SALDO_DEL_MES: TFloatField;
    qActivaM_SALDO_30_DIAS: TFloatField;
    qActivaM_SALDO_60_DIAS: TFloatField;
    qActivaM_SALDO_90_DIAS: TFloatField;
    qActivaM_SALDO_120_DIAS: TFloatField;
    qActivaM_SALDO_ANTERIOR: TFloatField;
    qActivaM_VALOR_RECTIFICA: TFloatField;
    qActivaM_PAGOS_DEL_CICLO: TFloatField;
    qActivaM_PAGOS_DEL_MES: TFloatField;
    qActivaM_PAGOS_NO_ACT: TFloatField;
    qActivaM_FECHA_PAGO: TFloatField;
    qActivaM_CTL_PAGO1: TFloatField;
    qActivaM_CTL_PAGO2: TFloatField;
    qActivaM_CTL_PAGO3: TFloatField;
    qActivaM_CTL_PAGO4: TFloatField;
    qActivaM_CTL_PAGO5: TFloatField;
    qActivaM_CTL_PAGO6: TFloatField;
    qActivaM_COLECTOR: TFloatField;
    qActivaM_FECHA_EMISION: TFloatField;
    qActivaM_ULTIMO_MES_FACT: TFloatField;
    qActivaM_ESTADO_REGISTRO: TFloatField;
    qActivaM_FECHA_INACTIVO: TFloatField;
    qActivaM_CODIGO_ARCHIVO: TStringField;
    qActivaM_CODIGO_PROMEDIO: TFloatField;
    qActivaM_CODIGO_CONTRATO: TFloatField;
    qActivaM_CODIGO_LECTURA: TFloatField;
    qActivaM_CODIGO_AGRUPA: TFloatField;
    qActivaM_CODIGO_U_MEDIDO: TFloatField;
    qActivaM_CODIGO_M_AVISOS: TFloatField;
    qActivaM_CODIGO_COMENTA: TFloatField;
    qActivaM_CODIGO_CORTE: TStringField;
    qActivaM_FECHA_CORTE: TFloatField;
    qActivaM_FECHA_3EDAD: TFloatField;
    qActivaM_CODIGO_3EDAD: TFloatField;
    qActivaM_CODIGO_FRAUDE: TFloatField;
    qActivaM_FECHA_FRAUDE: TFloatField;
    qActivaW_ULTIMO_MES_GRAB: TFloatField;
    qActivaM_FECHA_GARANTIA: TFloatField;
    qActivaM_CATASTRO: TFloatField;
    qActivaM_NO_GARANTIA: TStringField;
    qActivaM_REGION: TFloatField;
    qActivaM_TOTAL_CARGO_MES: TFloatField;
    qActivaM_TELEFONO: TFloatField;
    qActivaM_FAX: TFloatField;
    qActivaM_ISV: TFloatField;
    qActivaM_ISV_ANT: TFloatField;
    qActivaM_NUMERO_CORTES: TFloatField;
    qActivaM_NIVEL_RESIDENCIAL: TStringField;
    qActivaM_BONO_GENERAL: TStringField;
    qActivaFECHA_LECTURA_PROGRAMADA: TDateTimeField;
    qActivaID_CARGUE_INFO_COMERCIAL: TFloatField;
    dsReactiva: TDataSource;
    qReactiva: TQuery;
    qReactivaS_CLAVE_PRIMARIA: TFloatField;
    qReactivaS_CONTDOR_REACTIVO: TFloatField;
    qReactivaS_LECTUR_ACTUAL_R: TFloatField;
    qReactivaS_LECTUR_ANTERIOR_R: TFloatField;
    qReactivaS_CONSUMO_REACTIVO_MES: TFloatField;
    qReactivaS_LECTUR_DEMANDA: TFloatField;
    qReactivaS_DEMANDA1: TFloatField;
    qReactivaS_DEMANDA2: TFloatField;
    qReactivaS_DEMANDA3: TFloatField;
    qReactivaS_DEMANDA4: TFloatField;
    qReactivaS_DEMANDA5: TFloatField;
    qReactivaS_DEMANDA6: TFloatField;
    qReactivaS_DEMANDA7: TFloatField;
    qReactivaS_DEMANDA8: TFloatField;
    qReactivaS_DEMANDA9: TFloatField;
    qReactivaS_DEMANDA10: TFloatField;
    qReactivaS_DEMANDA11: TFloatField;
    qReactivaS_DEMANDA12: TFloatField;
    qReactivaS_DEMANDA_SELEC: TFloatField;
    qReactivaS_DEMANDA_CONTRATA: TFloatField;
    qReactivaS_FACTOR_POTENCIA: TFloatField;
    qReactivaS_CARGA_CONECTA: TFloatField;
    qReactivaS_COMENT_ESPEC: TStringField;
    qReactivaS_CONSUMO1: TFloatField;
    qReactivaS_CONSUMO2: TFloatField;
    qReactivaS_CONSUMO3: TFloatField;
    qReactivaS_CONSUMO4: TFloatField;
    qReactivaS_CONSUMO5: TFloatField;
    qReactivaS_CONSUMO6: TFloatField;
    qReactivaS_CONSUMO7: TFloatField;
    qReactivaS_CONSUMO8: TFloatField;
    qReactivaS_CONSUMO9: TFloatField;
    qReactivaS_CONSUMO10: TFloatField;
    qReactivaS_CONSUMO11: TFloatField;
    qReactivaS_CONSUMO12: TFloatField;
    qReactivaS_FACTOR1: TFloatField;
    qReactivaS_FACTOR2: TFloatField;
    qReactivaS_FACTOR3: TFloatField;
    qReactivaS_FACTOR4: TFloatField;
    qReactivaS_FACTOR5: TFloatField;
    qReactivaS_FACTOR6: TFloatField;
    qReactivaS_FACTOR7: TFloatField;
    qReactivaS_FACTOR8: TFloatField;
    qReactivaS_FACTOR9: TFloatField;
    qReactivaS_FACTOR10: TFloatField;
    qReactivaS_FACTOR11: TFloatField;
    qReactivaS_FACTOR12: TFloatField;
    qReactivaS_ESCALA_MED_DEMAN: TFloatField;
    qReactivaS_CABALLAJE: TFloatField;
    qReactivaS_CODIGO_DEMANDA: TFloatField;
    qReactivaS_CODIGO_TRANSF: TFloatField;
    qReactivaS_CODIGO_VOLTAJE: TFloatField;
    qReactivaS_CARGO_DEMANDA: TFloatField;
    qReactivaS_CARGO_REACT: TFloatField;
    qReactivaS_CARGO_VOLTAGE: TFloatField;
    qReactivaS_DEMANDA_MAX11: TFloatField;
    qReactivaS_STATUS: TFloatField;
    qReactivaS_CODIGO_HORARIO: TStringField;
    qReactivaS_DEMANDA_CONT_TAB1: TFloatField;
    qReactivaS_DEMANDA_CONT_TAB2: TFloatField;
    qReactivaS_DEMANDA_CONT_TAB3: TFloatField;
    qReactivaS_DEMANDA_CONT_TAB4: TFloatField;
    qReactivaS_DEMANDA_CONT_TAB5: TFloatField;
    qReactivaS_DEMANDA_CONT_TAB6: TFloatField;
    qReactivaS_DEMANDA_CONT_TAB7: TFloatField;
    qReactivaS_DEMANDA_CONT_TAB8: TFloatField;
    qReactivaS_DEMANDA_CONT_TAB9: TFloatField;
    qReactivaS_DEMANDA_CONT_TAB10: TFloatField;
    qReactivaS_DEMANDA_CONT_TAB11: TFloatField;
    qReactivaS_DEMANDA_CONT_TAB12: TFloatField;
    qReactivaS_CODIGO_HORARIO_TAB1: TStringField;
    qReactivaS_CODIGO_HORARIO_TAB2: TStringField;
    qReactivaS_CODIGO_HORARIO_TAB3: TStringField;
    qReactivaS_CODIGO_HORARIO_TAB4: TStringField;
    qReactivaS_CODIGO_HORARIO_TAB5: TStringField;
    qReactivaS_CODIGO_HORARIO_TAB6: TStringField;
    qReactivaS_CODIGO_HORARIO_TAB7: TStringField;
    qReactivaS_CODIGO_HORARIO_TAB8: TStringField;
    qReactivaS_CODIGO_HORARIO_TAB9: TStringField;
    qReactivaS_CODIGO_HORARIO_TAB10: TStringField;
    qReactivaS_CODIGO_HORARIO_TAB11: TStringField;
    qReactivaS_CODIGO_HORARIO_TAB12: TStringField;
    qReactivaS_LECTURA_VA_ANT: TFloatField;
    qReactivaS_LECTURA_SE_ANT: TFloatField;
    qReactivaS_LECTURA_PU_ANT: TFloatField;
    qReactivaS_LECTURA_VA_ACT: TFloatField;
    qReactivaS_LECTURA_SE_ACT: TFloatField;
    qReactivaS_LECTURA_PU_ACT: TFloatField;
    qReactivaFECHA_LECTURA_PROGRAMADA: TDateTimeField;
    qReactivaID_CARGUE_INFO_COMERCIAL: TFloatField;
    qActivaCONSUMOACTUAL: TStringField;
    qReactivaCONSUMOACTUAL: TStringField;
    qActuales: TQuery;
    dsActuales: TDataSource;
    qActualesTIPO: TStringField;
    qActualesM_CONSUMOS1: TFloatField;
    qActualesM_CONSUMOS2: TFloatField;
    qActualesM_CONSUMOS3: TFloatField;
    qActualesM_CONSUMOS4: TFloatField;
    qActualesM_CONSUMOS5: TFloatField;
    qActualesM_CONSUMOS6: TFloatField;
    qActualesM_CONSUMOS7: TFloatField;
    qActualesM_CONSUMOS8: TFloatField;
    qActualesM_CONSUMOS9: TFloatField;
    qActualesM_CONSUMOS10: TFloatField;
    qActualesM_CONSUMOS11: TFloatField;
    qActualesM_CONSUMOS12: TFloatField;
    qActualesANTERIOR: TStringField;
    qActualesACTUAL: TStringField;
    DBChart: TDBChart;
    qTipoFacturacion: TQuery;
    dsTipoFacturacion: TDataSource;
    qTipoFacturacionCODIGOTIPOFACTURACION: TFloatField;
    qTipoFacturacionNOMBRETIPOFACTURACION: TStringField;
    qTipoFacturacionReactiva: TQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    dsTipoFacturacionReactiva: TDataSource;
    qTipoFacturacionDemanda: TQuery;
    FloatField2: TFloatField;
    StringField2: TStringField;
    dsTipoFacturacionDemanda: TDataSource;
    Label30: TLabel;
    DBText3: TDBText;
    qTarifas: TQuery;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    FloatField23: TFloatField;
    FloatField24: TFloatField;
    StringField3: TStringField;
    FloatField25: TFloatField;
    FloatField26: TFloatField;
    FloatField27: TFloatField;
    FloatField28: TFloatField;
    FloatField29: TFloatField;
    FloatField30: TFloatField;
    FloatField31: TFloatField;
    FloatField32: TFloatField;
    FloatField33: TFloatField;
    FloatField34: TFloatField;
    FloatField35: TFloatField;
    FloatField36: TFloatField;
    FloatField37: TFloatField;
    FloatField38: TFloatField;
    FloatField39: TFloatField;
    FloatField40: TFloatField;
    FloatField41: TFloatField;
    FloatField42: TFloatField;
    FloatField43: TFloatField;
    FloatField44: TFloatField;
    FloatField45: TFloatField;
    FloatField46: TFloatField;
    FloatField47: TFloatField;
    FloatField48: TFloatField;
    FloatField49: TFloatField;
    FloatField50: TFloatField;
    FloatField51: TFloatField;
    FloatField52: TFloatField;
    FloatField53: TFloatField;
    FloatField54: TFloatField;
    FloatField55: TFloatField;
    FloatField56: TFloatField;
    FloatField57: TFloatField;
    FloatField58: TFloatField;
    StringField4: TStringField;
    FloatField59: TFloatField;
    FloatField60: TFloatField;
    FloatField61: TFloatField;
    FloatField62: TFloatField;
    FloatField63: TFloatField;
    FloatField64: TFloatField;
    FloatField65: TFloatField;
    FloatField66: TFloatField;
    FloatField67: TFloatField;
    FloatField68: TFloatField;
    FloatField69: TFloatField;
    FloatField70: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    FloatField71: TFloatField;
    FloatField72: TFloatField;
    FloatField73: TFloatField;
    FloatField74: TFloatField;
    FloatField75: TFloatField;
    FloatField76: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField77: TFloatField;
    StringField17: TStringField;
    StoredProc1: TStoredProc;
    qAnomaliasHistorico: TQuery;
    qAnomaliasHistoricoCODIGO: TStringField;
    qAnomaliasHistoricoMES: TStringField;
    Label41: TLabel;
    DBText8: TDBText;
    Label42: TLabel;
    Label43: TLabel;
    DBText9: TDBText;
    Label44: TLabel;
    qCodigoLectura: TQuery;
    qLectores: TQuery;
    dsLectores: TDataSource;
    qLectoresNOMBREGRUPOTRABAJO: TStringField;
    qRutasPeligrosas: TQuery;
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
    qListaLecturaAUTORIZADIRECTOR: TStringField;
    qListaLecturaAUTORIZAGERENTE: TStringField;
    qListaLecturaLECTURAENCONTRADA: TStringField;
    qListaLecturaDESVIACIONCONSUMO: TStringField;
    qListaLecturaCODIGOANOMALIACONSUMOACT: TStringField;
    qListaLecturaCODIGOANOMALIACONSUMOREAC: TStringField;
    qListaLecturaCODIGOANOMALIACONSUMODEMAN: TStringField;
    qListaLecturaOBSERVACION_CRITICA: TMemoField;
    qListaLecturaCODIGOADMINISTRATIVO1: TStringField;
    qListaLecturaCODIGOGRUPOTRABAJO1: TStringField;
    qListaLecturaTIPOFACTURACION_CRITICA: TFloatField;
    qListaLecturaLECTURAREACTIVA_CONCRITICA: TFloatField;
    qListaLecturaLECTURADEMANDA_CONCRITICA: TFloatField;
    qListaLecturaCODIGOTIPOLECTURA: TFloatField;
    qListaLecturaCONSUMO_CONCRITICA: TFloatField;
    qListaLecturaVERSION_NAME: TStringField;
    qListaLecturaVERSION_CODE: TStringField;
    qListaLecturaCONSUMO_REACTIVA: TStringField;
    qListaLecturaPROMEDIO_CALCULADO: TStringField;
    qListaLecturaCARGO_COMERCIALIZACION: TStringField;
    qListaLecturaCARGO_REGULACION: TStringField;
    qListaLecturaOTROS_CARGOS: TStringField;
    qListaLecturaTOTAL_FACTURA: TStringField;
    qListaLecturaCODIGOOBSERVACION: TFloatField;
    qListaLecturaTELEFONO_CLIENTE: TStringField;
    qListaLecturaCORREO_CLIENTE: TStringField;
    qListaLecturaTELMOVIL_CLIENTE: TStringField;
    qListaLecturaDESVIACIONREACTIVA: TStringField;
    qListaLecturaDESVIACIONDEMANDA: TStringField;
    qListaLecturaLECTURAENCONTRADA_REACTIVA: TStringField;
    qListaLecturaLECTRUAENCONTRADA_DEMANDA: TStringField;
    qListaLecturaLECTURAENCONTRADA_DEMANDA: TStringField;
    qListaLecturaNEW_COD_SUPLEMENTARIO: TStringField;
    qListaLecturaDESVIACIONCONSUMO_CONCRITICA: TFloatField;
    qListaLecturaCONSUMO_REACTIVA_CONCRITICA: TFloatField;
    qListaLecturaDESVIACIONREACTIVA_CONCRITICA: TFloatField;
    qListaLecturaDESVIACIONDEMANDA_CONCRITICA: TFloatField;
    qListaLecturaBONOGOBIERNO: TStringField;
    qListaLecturaCRITICA_INCMS: TStringField;
    qListaLecturaVALOR_CONSUMO_ESCRITORIO: TFloatField;
    qListaLecturaCODIGOTIPOMEDIDOR: TFloatField;
    qListaLecturaIMPUESTO_CONSUMO: TStringField;
    qListaLecturaCARGO_REACTIVA: TStringField;
    qListaLecturaFECHA_ULT_PAGO: TDateTimeField;
    qListaLecturaSALDO_NEGATIVO: TFloatField;
    qListaLecturaBOMBADEAGUA: TStringField;
    qListaLecturaBONO120: TStringField;
    qListaLecturaPROCESADO_INCMS: TStringField;
    qListaLecturaANOMALIA_FACTURACION: TStringField;
    qListaLecturaALUMBRADO_PUBLICO: TStringField;
    qListaLecturaCARGO_VARIO: TFloatField;
    qListaLecturaCSMO_ENVIADO: TStringField;
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
    qListaLecturaCODIGOIMPRESION: TFloatField;
    qListaLecturaCONSUMOMINIMO: TFloatField;
    qListaLecturaPROMEDIOLIBRO: TStringField;
    qListaLecturaCODIGOESPECIAL: TStringField;
    qListaLecturaCODIGOANOMALIA_2: TStringField;
    qListaLecturaNOMBRE: TStringField;
    qListaLecturaDESCRIPCION_1: TStringField;
    qListaLecturaUSUARIOCREACION_1: TFloatField;
    qListaLecturaFECHACREACION_1: TDateTimeField;
    qListaLecturaUSUARIOMODIFICACION_1: TFloatField;
    qListaLecturaFECHAMODIFICACION_1: TDateTimeField;
    qListaLecturaESTADO_1: TStringField;
    qListaLecturaANOMALIAESPECIAL: TStringField;
    qListaLecturaCODIGOANOMALIACRITICA: TStringField;
    qListaLecturaDESCRIPCION_2: TStringField;
    qListaLecturaTIPO_1: TFloatField;
    qListaLecturaHABILITAR_CRITICA: TStringField;
    qListaLecturaCODIGOCLASE_1: TStringField;
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
    qListaLecturaCODIGOMODELOMEDIDOR: TStringField;
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
    qListaLecturaM_SECTOR_CONSUMO: TFloatField;
    qListaLecturaM_ESTADO_REGISTRO: TFloatField;
    qListaLecturaCN_CUOTA_FINANCIAMIENTO: TFloatField;
    qListaLecturaCN_CUOTA_OTROSCARGOS: TFloatField;
    qListaLecturaCN_CUOTA_CONSUMO: TFloatField;
    qListaLecturaM_BONO_GENERAL: TStringField;
    qListaLecturaS_CARGO_DEMANDA: TFloatField;
    qListaLecturaM_MESES_MOROSOS: TFloatField;
    qListaLecturaM_FECHA_PAGO: TFloatField;
    qListaLecturaM_CODIGO_CONTRATO: TFloatField;
    qListaLecturaCN_MONTO: TFloatField;
    qListaLecturaCN_MESES_CONTRATO: TFloatField;
    qListaLecturaCN_MESES_APLICADOS: TFloatField;
    qListaLecturaM_PAGOS_DEL_CICLO: TFloatField;
    qListaLecturaCN_SALDO: TFloatField;
    qListaLecturaM_CONSUMO_ADICIONAL: TFloatField;
    qListaLecturaUSUARIOULTIMAEXPORTACION: TFloatField;
    qListaLecturaFECHAULTIMAEXPORTACION: TDateTimeField;
    qListaLecturaLEIDO: TStringField;
    qListaLecturaM_CONSUMO_ESTIMADO: TFloatField;
    qListaLecturaFECHACARGALECTURA: TDateTimeField;
    qListaLecturaHL_CODIGO_LECTURA1: TStringField;
    qListaLecturaHL_CODIGO_LECTURA2: TStringField;
    qListaLecturaHL_CODIGO_LECTURA3: TStringField;
    qListaLecturaFACTURA_GOBIERNO: TStringField;
    qListaLecturaM_DIAS1: TFloatField;
    qListaLecturaM_DIAS2: TFloatField;
    qListaLecturaM_DIAS3: TFloatField;
    qListaLecturaVERSION_PGI: TStringField;
    qListaLecturaPROMEDIOLIBRO_1: TFloatField;
    qListaLecturaANOMALIACONFLICTO: TStringField;
    qListaLecturaCODUBICACION_NUEVO: TStringField;
    qListaLecturaLIBRO_NUEVO: TStringField;
    qListaLecturaACTIVA_TELEMEDIDO: TFloatField;
    qListaLecturaREACTIVA_TELEMEDIDO: TFloatField;
    qListaLecturaDEMANDA_TELEMEDIDO: TFloatField;
    qListaLecturaCORTE: TStringField;
    qListaLecturaFECHALECTURA_TELEMEDIDO: TDateTimeField;
    qListaLecturaS_FACTOR_POTENCIA: TFloatField;
    qListaLecturaLECTENCONT_ULTIMOPERIODO: TStringField;
    qListaLecturaANOMALIAFACT_ULTIMOPERIODO: TStringField;
    qListaLecturaANOMALIAFACT_PENULTIMOPERIODO: TStringField;
    qListaLecturaANOMALIALECT_ULTIMOPERIODO: TStringField;
    qListaLecturaANOMALIALECT_PENULTIMOPERIODO: TStringField;
    qListaLecturaFECHACALENDARIO: TStringField;
    qListaLecturaEST_SUM: TStringField;
    qListaLecturaLECT_CORTE_REACTIVA: TFloatField;
    qListaLecturaLECT_CORTE_DEMANDA: TFloatField;
    qListaLecturaM_FECHA_CORTE: TDateTimeField;
    qListaLecturaPROMEDIOACTIVA: TFloatField;
    qListaLecturaPROMEDIOREACTIVA: TFloatField;
    qListaLecturaPROMEDIODEMANDA: TFloatField;
    qListaLecturaULTIMALECTURAREAL: TFloatField;
    qListaLecturaIND_RELIQUIDA: TStringField;
    qListaLecturaSUMACONSUMOSPROMEDIADOS: TFloatField;
    qListaLecturaIND_ANOM_PEND: TStringField;
    qListaLecturaIN_RUTA: TFloatField;
    qListaLecturaIN_ITINERARIO: TFloatField;
    qListaLecturaIN_NISRAD: TFloatField;
    qListaLecturaIN_NIF: TFloatField;
    qListaLecturaIN_NUM_APA: TStringField;
    qListaLecturaIN_CO_MARCA: TStringField;
    qListaLecturaCGV_PM: TStringField;
    qListaLecturaIN_PROM_IMPORTE: TFloatField;
    qListaLecturaMONTO_ULTIMO_PAGO: TFloatField;
    qListaLecturaCIIU_ACTIVIDAD: TStringField;
    qListaLecturaCO_ERROR: TStringField;
    qListaLecturaIND_CORTE: TFloatField;
    qListaLecturaLECT_CORTE: TFloatField;
    qListaLecturaCSMO_PROMEDIO: TFloatField;
    qListaLecturaMONTO_ACUERDO: TFloatField;
    qListaLecturaNRO_CUOTA_APLICADA: TFloatField;
    qListaLecturaFECHA_ULT_PAGO_1: TDateTimeField;
    qListaLecturaDESVIACIONDECONSUMOVALOR: TStringField;
    qListaLecturaCONSUMOREACTIVA: TStringField;
    qListaLecturaCONSUMODEMANDA: TStringField;
    qListaLecturaFECHAULTIMALECTURAFORMATO: TStringField;
    qListaLecturaDIASDIFERENCIA: TStringField;
    qListaLecturaCONSUMOANTERIOR: TStringField;
    qListaLecturaCODIGOANOMALIACONS: TStringField;
    qListaLecturaDESCRIPCIONDETALLADA: TStringField;
    qListaLecturaPROMEDIOCALCULADO: TStringField;
    Panel6: TPanel;
    GroupBox3: TGroupBox;
    GroupBox6: TGroupBox;
    Label6: TLabel;
    Label26: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    Label39: TLabel;
    DBText7: TDBText;
    Label40: TLabel;
    Label45: TLabel;
    DBText10: TDBText;
    DBMemo5: TDBMemo;
    GroupBox7: TGroupBox;
    Label2: TLabel;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    DBMemo2: TDBMemo;
    DBMemo1: TDBMemo;
    lRutasPeligrosas: TLabel;
    sbMedidor: TSpeedButton;
    Panel7: TPanel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    Label16: TLabel;
    Label38: TLabel;
    DBEdit3: TDBEdit;
    DBEdit1: TDBEdit;
    DBMemo3: TDBMemo;
    DBEdit4: TDBEdit;
    DBMemo4: TDBMemo;
    DBEdit17: TDBEdit;
    GroupBox4: TGroupBox;
    Label18: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    DBEdit5: TDBEdit;
    DBEdit15: TDBEdit;
    iLista: TImageList;
    ToolBar1: TToolBar;
    sbHistorico: TToolButton;
    SpeedButton6: TToolButton;
    SpeedButton1: TToolButton;
    ToolButton4: TToolButton;
    SpeedButton3: TToolButton;
    ToolButton8: TToolButton;
    SpeedButton2: TToolButton;
    SpeedButton4: TToolButton;
    sbConfirmar: TToolButton;
    sbINCMS: TToolButton;
    ToolButton1: TToolButton;
    Panel1: TPanel;
    ToolButton2: TToolButton;
    cbsTablas: TClientDataSet;
    dsLecturas: TDataSource;
    rcListadoLecturas: TRxDBGrid;
    Label11: TLabel;
    DBEdit6: TDBEdit;
    Label36: TLabel;
    DBEdit16: TDBEdit;
    Label3: TLabel;
    eCodigoTarifa: TEdit;
    eNombreTarifa: TEdit;
    Label1: TLabel;
    DBEdit9: TDBEdit;
    Label14: TLabel;
    DBEdit10: TDBEdit;
    Label25: TLabel;
    Label21: TLabel;
    DBEdit12: TDBEdit;
    Label20: TLabel;
    DBEdit11: TDBEdit;
    Label27: TLabel;
    Label24: TLabel;
    DBEdit14: TDBEdit;
    Label28: TLabel;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    Label15: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label13: TLabel;
    DBEdit8: TDBEdit;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    Label31: TLabel;
    Label37: TLabel;
    Label47: TLabel;
    DBEdit18: TDBEdit;
    DBText5: TDBEdit;
    BB28: TDBEdit;
    DBText4: TDBEdit;
    ScrollBox2: TScrollBox;
    Panel4: TPanel;
    DBText6: TDBText;
    Label10: TLabel;
    Label19: TLabel;
    DBEdit13: TDBEdit;
    procedure qActualesCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure sgtituloDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgHistoricoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sbConfirmarClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure qListaLecturaCalcFields(DataSet: TDataSet);
    procedure SpeedButton6Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbHistoricoClick(Sender: TObject);
    procedure sbMedidorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbINCMSClick(Sender: TObject);
    procedure rcListadoLecturasCellClick(Column: TColumn);
  private
    { Private declarations }
    CodigoBorrado: string;
    ValidarMaximoHorasExtras: boolean;
    Function PeriodoAnterior: String;
    Function PromediarLectura(Tipo: Integer): String;
    Procedure HabilitarTipoMedida;
    Function LecturaMes(Mes : String ; var Tipo : String): String;
    Function ConvertirClave(CodigoCuenta : String ) : String;
    Procedure CargarTablaHistorico;
  public
    { Public declarations }
    bDatosIncompletos, bCancelando: boolean;
    Fecha, Odts: string;
    Modificado: boolean;
    sFecha: TDateTime;
    FechaLectura: String;
    CodigoCritita: String;
    procedure CargarVistaPreliminar(CodApoyo: string);
    procedure GenerarGrafica(Grafica: String);
    Function Tarifa: Extended;
    Function CalcularConsumo(LecturaAnterior, LecturaActual,
      Agujas: Integer): Integer;
    Function Medidor(Agujas: Integer): Integer;
    Function CalcularLectura(LecturaAnterior, NuevoConsumo,
      Agujas: Integer): Integer;
  end;

var
  FAnalisisFacturacion: TFAnalisisFacturacion;
  TipoFacturacion, TipoFacturacionReactiva, TipoFacturacionDemanda: Integer;

implementation

uses uFormaFecha, uFuncionSGD, uODTPadre, uCambiarLectura,
  uGaleriaPreliminar, uFormaEspere;

{$R *.DFM}

procedure TFAnalisisFacturacion.CargarVistaPreliminar(CodApoyo: string);
var
  CodigoApoyo: string;
  i: Integer;
begin
  { for i:= Application.MainForm.MDIChildCount-1 downto 0 do
    if (Application.MainForm.MDIChildren[i] is TFAnalisisFacturacion) then
    begin }
  // fGaleriaPreliminar.Free;
  // fGaleriaPreliminar := nil;
  CodigoApoyo := qListaLectura.FieldByName('CLAVE').AsString;
  if CodigoApoyo <> '' then
  begin
    fGaleriaPreliminar := TfGaleriaPreliminar.CreateByparametros(Application,
      CodigoApoyo);
    fGaleriaPreliminar.FechaLectura := FechaLectura;
    fGaleriaPreliminar.TipoDeFoto := '15';
    fGaleriaPreliminar.ManualDock(Panel4);
    fGaleriaPreliminar.Show;
  end;
  { end; }
end;

function TFAnalisisFacturacion.PeriodoAnterior: String;
var
  Dia, Mes, Ano: Word;
begin
  DecodeDate(qListaLectura.ParamByName('FECHALECTURA').AsDate, Ano, Mes, Dia);
  if Mes = 1 then
    Result := IntToStr(12)
  else
    Result := IntToStr(Mes - 1);

end;

procedure TFAnalisisFacturacion.qActualesCalcFields(DataSet: TDataSet);
var
  Campo: String;
begin

  if qActualesTIPO.AsString = 'ACTIVA' then
  begin
    qActualesACTUAL.AsString := qListaLecturaCONSUMOACTUAL.AsString;
    qActualesANTERIOR.AsString := qActuales.FieldByName
      ('M_CONSUMOS' + PeriodoAnterior).AsString;
  end;

  if qActualesTIPO.AsString = 'REACTIVA' then
  begin
    qActualesACTUAL.AsString := qListaLecturaLECTURAREACTIVA.AsString;
    qActualesANTERIOR.AsString := qActuales.FieldByName
      ('M_CONSUMOS' + PeriodoAnterior).AsString;
  end;

end;

procedure TFAnalisisFacturacion.FormShow(Sender: TObject);
var
Tipo : String;
begin
  PageControl1.ActivePage := TabSheet1;

  eCodigoTarifa.Text := qListaLecturaTARIFA.AsString;
  qTipoFacturacion.Open;
  CodigoCritita := 'C1';

  if qListaLecturaCODIGOANOMALIA.AsString = 'AL16_1' THEN
    sbMedidor.Enabled := true;

  if (qListaLecturaAUTORIZADIRECTOR.AsString = 'SI') then
  begin
    sbConfirmar.Enabled := ProcManager.CanProcExecute('_Director Critica');
  //  sbGerencia.Enabled := ProcManager.CanProcExecute('_Director Critica');
  end;

  if (qListaLecturaTARIFA.AsInteger > 100) and
    (qListaLecturaTARIFA.AsInteger < 200) then
  begin
    eNombreTarifa.Text := 'Servicio Residencial';
  end;

  if (qListaLecturaTARIFA.AsInteger > 200) and
    (qListaLecturaTARIFA.AsInteger < 300) then
  begin
    eNombreTarifa.Text := 'Baja Tensión';
  end;

  if (qListaLecturaTARIFA.AsInteger > 500) and
    (qListaLecturaTARIFA.AsInteger < 700) then
  begin
    eNombreTarifa.Text := 'Baja Tensión';
  end;

  if (qListaLecturaTARIFA.AsInteger > 300) and
    (qListaLecturaTARIFA.AsInteger < 400) then
  begin
    eNombreTarifa.Text := 'Media Tensión';
  end;

  if (qListaLecturaTARIFA.AsInteger > 400) and
    (qListaLecturaTARIFA.AsInteger < 500) then
  begin
    eNombreTarifa.Text := 'Alta Tensión';
  end;
  // Tabla de historico

CargarTablaHistorico;

  // GUARDAMOS PARA SIEMPRE EL TIPO DE FACTURACION
  TipoFacturacion := qTipoFacturacionCODIGOTIPOFACTURACION.AsInteger;
  TipoFacturacionReactiva := qTipoFacturacionCODIGOTIPOFACTURACION.AsInteger;
  TipoFacturacionDemanda := qTipoFacturacionCODIGOTIPOFACTURACION.AsInteger;



  TRY
    FechaLectura := qListaLecturaFECHALECTURA_1.AsString;    //CAMBIO FECHA
    CargarVistaPreliminar(qListaLecturaCLAVE.AsString);
  Except
    on e: Exception do
    begin
      ShowMessage(e.Message);
    end;

  end;

  GenerarGrafica('CONSUMOACTIVA');
  IF DBEdit9.Field.IsNull then
    DBEdit9.Text := '0';

  IF DBEdit10.Field.IsNull then
    DBEdit9.Text := '0';

  IF qTipoFacturacionCODIGOTIPOFACTURACION.AsInteger = 2 then
    SpeedButton3.Enabled := False;

  HabilitarTipoMedida;



  qLectores.close;
  qLectores.ParamByName('CODIGOADMINISTRATIVO').AsString := qListaLecturaCODIGOADMINISTRATIVO.AsString;
    qLectores.ParamByName('CODIGOGRUPOTRABAJO').AsString := qListaLecturaCODIGOGRUPOTRABAJO.AsString;
  qLectores.open;

    qLectores.Close;
  qLectores.ParamByName('CODIGOGRUPOTRABAJO').AsString :=qListaLecturaCODIGOGRUPOTRABAJO.AsString;
  qLectores.ParamByName('CODIGOADMINISTRATIVO').AsString := qListaLecturaCODIGOADMINISTRATIVO.AsString;
  qLectores.Open;

  qRutasPeligrosas.close;
  qRutasPeligrosas.ParamByName('LIBRO').AsString := Copy(qListaLecturaCODUBICACION.AsString,1,6);
  qRutasPeligrosas.open;

  if  qRutasPeligrosas.RecordCount >0 then
  lRutasPeligrosas.Visible := True;


end;

procedure TFAnalisisFacturacion.SpeedButton1Click(Sender: TObject);
var
  Query, Query1: TQuery;
  buttonSelected: Integer;
  sTextoPregunta: String;
  value: string;
  Observacion, Desviacion, DesviacionReactiva, DesviacionDemanda: String;
  i: Integer;
  fSeleccionar: TfSeleccionarObservacion;
  CON_CRITICA : String;
begin
  Query := TQuery.create(nil);
  Query.DatabaseName := 'BaseDato';

 { Query1 := TQuery.create(nil);
  Query1.DatabaseName := 'BaseDato';  }

  fSeleccionar := TfSeleccionarObservacion.create(Self);
  if fSeleccionar.ShowModal = mrOk then
  begin

    try

      sTextoPregunta :=
        '¿ Esta Seguro que desea confirmar la NUEVA lectura y el NUEVO consumo ? '
        + chr(13) +
        ' En caso de no haber sido modificados se tomaran los valores que estan Originalmente de campo de la cuenta.';

      if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
        MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
      begin

       { Query1.Close;
        Query1.SQL.Clear;
        Query1.SQL.Add
          ('SELECT REGEXP_SUBSTR (SGC_DESVIACIONCONSUMO (:PROMEDIO, ');
        Query1.SQL.Add(' :TARIFA,:CONSUMO),''[^,]+'',');
        Query1.SQL.Add('                    1,');
        Query1.SQL.Add('                    1) AS DESVIACION FROM DUAL');
        Query1.ParamByName('PROMEDIO').AsString := PromediarLectura(1);
        Query1.ParamByName('TARIFA').AsString := qListaLecturaTARIFA.AsString;
        Query1.ParamByName('CONSUMO').AsString := DBEdit10.Text;
        Query1.Open;   }

        Desviacion :=qListaLecturaDESVIACIONDECONSUMOVALOR.AsString; //Query1.FieldByName('DESVIACION').AsString;

        CON_CRITICA := qListaLecturaDESVIACIONCONSUMO.AsString;

        IF qListaLecturaDESVIACIONCONSUMO.AsString = '' then
        CON_CRITICA := '0';


        Query.Close;
        Query.SQL.Clear;
        Query.SQL.Add('UPDATE SIGCOM_LECTURA SET DESVIACIONCONSUMO=' +
          Desviacion + ',CODIGOOBSERVACION=' +
          fSeleccionar.qDatosCODIGOOBSERVACIONCRITICA.AsString +
          ',MARCA_CRITICA=''' + CodigoCritita + ''',CONSUMO_CONCRITICA=''' +
          qListaLecturaCONSUMOACTUAL.AsString + ''',CONSUMOACTUAL=''' +
          DBEdit10.Text + ''',LECTURA_CONCRITICA=''' +
          qListaLecturaLECTURAACTUAL.AsString + ''',TIPOFACTURACION_CRITICA='''
          + qListaLecturaTIPO_FACTURA.AsString + ''',TIPO_FACTURA=' +
          IntToStr(DBLookupComboBox1.KeyValue) +
          ',FECHA_CRITICA=SYSDATE,CODIGOUSUARIO_CRITICA=(SELECT GETCODIGOUSUARIO FROM DUAL) ,ESTADOLECTURA=''4'',LECTURAACTUAL='''
          + DBEdit9.Text + ''',DESVIACIONCONSUMO_CONCRITICA=' +CON_CRITICA+ ' ');
        Query.SQL.Add('WHERE CLAVE=' + qListaLecturaCLAVE.AsString +
          ' AND FECHA_PROGRAMADA =TO_DATE(''' +
          qListaLecturaFECHALECTURA_1.AsString + ''',''DD/MM/YYYY'') ');    // CAMBIO FECHA
        Query.ExecSQL;

        if qListaLecturaCODIGOTIPOMEDIDA.AsInteger = 1 then
        begin

         { Query1.Close;
          Query1.SQL.Clear;
          Query1.SQL.Add
            ('SELECT REGEXP_SUBSTR (SGC_DESVIACIONCONSUMOAVANZADO (:PROMEDIO, ');
          Query1.SQL.Add(' :TARIFA,:CONSUMO,1),''[^,]+'',');
          Query1.SQL.Add('                    1,');
          Query1.SQL.Add('                    1) AS DESVIACION FROM DUAL');
          Query1.ParamByName('PROMEDIO').AsString := PromediarLectura(2);
          Query1.ParamByName('TARIFA').AsString := qListaLecturaTARIFA.AsString;
          Query1.ParamByName('CONSUMO').AsString := DBEdit11.Text;
          Query1.Open;        }

          DesviacionReactiva :=qListaLecturaDESVIACIONREACTIVA.AsString;// Query1.FieldByName('DESVIACION').AsString;
          if DesviacionReactiva ='' then
          DesviacionReactiva :='0';


          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('UPDATE SIGCOM_LECTURA SET DESVIACIONCONSUMO=' +
            Desviacion + ',DESVIACIONREACTIVA=' + DesviacionReactiva +
            ',DESVIACIONREACTIVA_CONCRITICA=' +DesviacionReactiva + ',CODIGOOBSERVACION=' +
            fSeleccionar.qDatosCODIGOOBSERVACIONCRITICA.AsString +
            ',MARCA_CRITICA=''' + CodigoCritita + ''',CONSUMO_CONCRITICA=''' +
            qListaLecturaCONSUMOACTUAL.AsString + ''',CONSUMOACTUAL=''' +
            DBEdit10.Text + ''',LECTURAREACTIVA_CONCRITICA=''' +
            qListaLecturaLECTURAREACTIVA.AsString + ''',LECTURA_CONCRITICA=''' +
            qListaLecturaLECTURAACTUAL.AsString +
            ''',TIPOFACTURACION_CRITICA=''' + qListaLecturaTIPO_FACTURA.AsString
            + ''',TIPO_FACTURA=' + IntToStr(DBLookupComboBox1.KeyValue) +
            ',FECHA_CRITICA=SYSDATE,CODIGOUSUARIO_CRITICA=(SELECT GETCODIGOUSUARIO FROM DUAL) ,ESTADOLECTURA=''4'',LECTURAACTUAL='''
            + DBEdit9.Text + ''',CONSUMO_REACTIVA_CONCRITICA=''' +
            qListaLecturaCONSUMO_REACTIVA.AsString + ''',CONSUMO_REACTIVA=''' +
            DBEdit11.Text + ''',LECTURAREACTIVA=''' + DBEdit12.Text +
            ''',DESVIACIONCONSUMO_CONCRITICA=' +CON_CRITICA + ' ');
          Query.SQL.Add('WHERE CLAVE=' + qListaLecturaCLAVE.AsString +
            '  AND FECHA_PROGRAMADA =TO_DATE(''' +
            qListaLecturaFECHALECTURA_1.AsString + ''',''DD/MM/YYYY'') ');        // CAMBIO FECHA
          Query.ExecSQL;

        end;

        if qListaLecturaCODIGOTIPOMEDIDA.AsInteger = 2 then
        begin

          Query.Close;
          Query.SQL.Clear;
          Query.SQL.Add('UPDATE SIGCOM_LECTURA SET DESVIACIONCONSUMO=' +
            Desviacion + ',CODIGOOBSERVACION=' +
            fSeleccionar.qDatosCODIGOOBSERVACIONCRITICA.AsString +
            ',CONSUMO_CONCRITICA=' + qListaLecturaCONSUMOACTUAL.AsString +
            ',CONSUMOACTUAL=''' + DBEdit10.Text +
            ''',LECTURADEMANDA_CONCRITICA=''' + qListaLecturaPOTENCIA.AsString +
            ''',LECTURAREACTIVA_CONCRITICA=''' +
            qListaLecturaLECTURAREACTIVA.AsString + ''',LECTURA_CONCRITICA=''' +
            qListaLecturaLECTURAACTUAL.AsString +
            ''',TIPOFACTURACION_CRITICA=''' + qListaLecturaTIPO_FACTURA.AsString
            + ''',TIPO_FACTURA=' + IntToStr(DBLookupComboBox1.KeyValue) +
            ',FECHA_CRITICA=SYSDATE,CODIGOUSUARIO_CRITICA=(SELECT GETCODIGOUSUARIO FROM DUAL) ,ESTADOLECTURA=''4'',LECTURAACTUAL='''
            + DBEdit9.Text + ''',CONSUMO_REACTIVA_CONCRITICA=''' +
            qListaLecturaCONSUMO_REACTIVA.AsString + ''',CONSUMO_REACTIVA=''' +
            DBEdit11.Text + ''',LECTURAREACTIVA=''' + DBEdit12.Text +
            ''',POTENCIA=''' + DBEdit14.Text +
            ''',DESVIACIONCONSUMO_CONCRITICA=' +CON_CRITICA + ' ');
          Query.SQL.Add('WHERE CLAVE=' + qListaLecturaCLAVE.AsString +
            ' AND FECHA_PROGRAMADA =TO_DATE(''' +
            qListaLecturaFECHALECTURA_1.AsString + ''',''DD/MM/YYYY'') ');  // CAMBIO FECHA
          Query.ExecSQL;

        end;

        if Assigned(fListaCritica) then
        begin

        fListaCritica.qListaLectura.Close;
         fListaCritica.qListaLectura.Open;

         fListaCritica.qListaResueltos.Close;

         fListaCritica.qListaResueltos.Open;

        //  fListaCritica.qlistaLecturaPendientes.Close;
        //  fListaCritica.qlistaLecturaPendientes.Open;
         end;
        Close;
      end;
    finally
      Query.Free;
      Query1.Free;
    end;
  end;

end;

procedure TFAnalisisFacturacion.SpeedButton2Click(Sender: TObject);
var
  Query: TQuery;
  buttonSelected: Integer;
  sTextoPregunta: String;
  Varible: boolean;
begin

  try
    Query := TQuery.create(nil);
    Query.DatabaseName := 'BaseDato';
    Varible := False;

    IF qTipoFacturacionCODIGOTIPOFACTURACION.AsInteger = 2 then
    begin
      Application.NormalizeTopMosts;
      if Application.MessageBox
        (PChar('La Lectura debe ser REAL, No se permite la modificación de una Lectura Promediada'),
        'Confirmación', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES
      then
      begin
        Varible := true;
        Application.RestoreTopMosts;
      end;
    end
    else
    begin
      Varible := true;
      Application.RestoreTopMosts;
    end;

    if Varible then
    begin
      FCambioLectura := TFCambioLectura.create(Self);

      TRY
        FCambioLectura.eLecturaActual.Text :=
          IntToStr(Trunc(StrToFloat(qListaLecturaLECTURAACTUAL.AsString)));
        FCambioLectura.eLecturaNueva.Text :=
          IntToStr(Trunc(StrToFloat(qListaLecturaLECTURAACTUAL.AsString)));
      EXCEPT
        ON e: Exception DO

        BEGIN
          FCambioLectura.eLecturaActual.Text :=
            IntToStr(Trunc(StrToFloat('0')));
          FCambioLectura.eLecturaNueva.Text := IntToStr(Trunc(StrToFloat('0')));
        END;

      end;

      FCambioLectura.eLecturaAnterior.Text :=
        IntToStr(Trunc(qListaLectura.FieldByName('ULTIMALECTURA').AsFloat));
      FCambioLectura.eConsumoAnterior.Text :=
        IntToStr(Trunc(qListaLectura.FieldByName('CONSUMO' + PeriodoAnterior)
        .AsFloat));
  try
      FCambioLectura.eConsumoNuevo.Text :=
        IntToStr(Trunc(qListaLecturaCONSUMOACTUAL.AsFloat));
     FCambioLectura.eConsumoActual.Text :=   IntToStr(Trunc(qListaLecturaCONSUMOACTUAL.AsFloat));
 except
         FCambioLectura.eConsumoNuevo.Text :='0';
    FCambioLectura.eConsumoActual.Text  := '0';
 end;

      FCambioLectura.eConsumoActual.Tag :=
        qListaLecturaFACTORMULTIPLICADOR.AsInteger;
      FCambioLectura.eConsumoAnterior.Tag :=
        StrToInt(Copy(qListaLecturaPERIODO.AsString, 3, 4));
      FCambioLectura.Label20.Caption :=
        IntToStr(Ceil(StrToFloat(PromediarLectura(1))));

  try
      FCambioLectura.eConsumoNuevo.Text :=
        IntToStr(Trunc(qListaLecturaCONSUMOACTUAL.AsFloat));
      FCambioLectura.eConsumoActual.Text :=   IntToStr(Trunc(qListaLecturaCONSUMOACTUAL.AsFloat));
 except
         FCambioLectura.eConsumoNuevo.Text :='0';
            FCambioLectura.eConsumoActual.Text  := '0';
 end;

      FCambioLectura.AgujasGeneral := qListaLecturaNUMEROAGUJAS.AsInteger;
      if qListaLecturaCODIGOTIPOMEDIDA.AsInteger = 1 then
      begin
        FCambioLectura.TabSheet2.TabVisible := true;

        TRY
          FCambioLectura.eLecturaActualR.Text :=
            IntToStr(Trunc(StrToFloat(DBEdit12.Text)));
        Except
          FCambioLectura.eLecturaActualR.Text := '0';
        end;

        FCambioLectura.eLecturaAnteriorR.Text :=
          IntToStr(Trunc(qListaLectura.FieldByName('S_LECTUR_ACTUAL_R')
          .AsFloat));
        FCambioLectura.eConsumoAnteriorR.Text :=
          IntToStr(Trunc(qListaLectura.FieldByName('S_CONSUMO' +
          PeriodoAnterior).AsFloat));



        FCambioLectura.eConsumoActualR.Tag :=
          qListaLecturaFACTORMULTIPLICADOR.AsInteger;
        FCambioLectura.eConsumoAnteriorR.Tag :=
          StrToInt(Copy(qListaLecturaPERIODO.AsString, 3, 4));
        FCambioLectura.Label27.Caption :=
          IntToStr(Ceil(StrToFloat(PromediarLectura(2))));
        try
          FCambioLectura.eLecturaNuevaR.Text :=
            IntToStr(Trunc(StrToFloat(DBEdit12.Text)));

                FCambioLectura.eConsumoActualR.Text :=
          IntToStr(Trunc(StrToFloat(DBEdit12.Text)));
        Except
          FCambioLectura.eLecturaNuevaR.Text := '0';
                FCambioLectura.eConsumoActualR.Text := '0';
        end;


           try
         FCambioLectura.eConsumoNuevoR.Text :=
          IntToStr(Trunc(qListaLecturaCONSUMOREACTIVA.AsFloat));
          except
         FCambioLectura.eConsumoNuevoR.Text :='0';
 end;


      end;

      if qListaLecturaCODIGOTIPOMEDIDA.AsInteger = 2 then
      begin
        FCambioLectura.TabSheet2.TabVisible := true;
        FCambioLectura.TabSheet3.TabVisible := true;

        IF DBEdit12.Text = '' THEN
        DBEdit12.Text := '0';

        FCambioLectura.eLecturaActualR.Text :=
          IntToStr(Trunc(StrToFloat(DBEdit12.Text)));
        FCambioLectura.eLecturaAnteriorR.Text :=
          IntToStr(Trunc(qListaLectura.FieldByName('S_LECTUR_ACTUAL_R')
          .AsFloat));
        FCambioLectura.eConsumoAnteriorR.Text :=
          IntToStr(Trunc(qListaLectura.FieldByName('S_CONSUMO' +
          PeriodoAnterior).AsFloat));
        FCambioLectura.eConsumoActualR.Text :=
          IntToStr(Trunc(qListaLecturaCONSUMOREACTIVA.AsFloat));
        FCambioLectura.eConsumoActualR.Tag :=
          qListaLecturaFACTORMULTIPLICADOR.AsInteger;
        FCambioLectura.eConsumoAnteriorR.Tag :=
          StrToInt(Copy(qListaLecturaPERIODO.AsString, 3, 4));
        FCambioLectura.Label27.Caption :=
          IntToStr(Ceil(StrToFloat(PromediarLectura(2))));
        FCambioLectura.eLecturaNuevaR.Text :=
          IntToStr(Trunc(StrToFloat(DBEdit12.Text)));
        FCambioLectura.eConsumoNuevoR.Text :=
          IntToStr(Trunc(qListaLecturaCONSUMOREACTIVA.AsFloat));
        TRY
          FCambioLectura.eLecturaNuevaD.Text :=
            IntToStr(Trunc(StrToFloat(DBEdit14.Text)));
        Except
          DBEdit14.Text := '0';
          FCambioLectura.eLecturaNuevaD.Text := '0';

        end;
        FCambioLectura.eLecturaAnteriorD.Text :=
          IntToStr(Trunc(qListaLectura.FieldByName('S_LECTUR_DEMANDA')
          .AsFloat));
        FCambioLectura.eConsumoAnteriorD.Text :=
          IntToStr(Trunc(qListaLectura.FieldByName('S_DEMANDA' +
          PeriodoAnterior).AsFloat));

        FCambioLectura.eLecturaActualD.Text :=
          IntToStr(Trunc(StrToFloat(DBEdit14.Text)));

        FCambioLectura.eConsumoActualD.Text :=
          IntToStr(Trunc(0));
        FCambioLectura.eConsumoActualD.Tag :=
          qListaLecturaFACTORMULTIPLICADOR.AsInteger;
        FCambioLectura.eConsumoAnteriorD.Tag :=
          StrToInt(Copy(qListaLecturaPERIODO.AsString, 3, 4));
        FCambioLectura.Label35.Caption :=
          IntToStr(Ceil(StrToFloat(PromediarLectura(3))));
        FCambioLectura.eLecturaNuevaD.Text :=
          IntToStr(Trunc(StrToFloat(DBEdit14.Text)));
        FCambioLectura.eConsumoNuevoD.Text := '';
      end;

      if FCambioLectura.ShowModal = mrOk then
      begin
        sTextoPregunta := '¿ Esta Seguro que desea cambiar la lectura ?';
        if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
          MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
        begin
          DBEdit9.Text := FCambioLectura.eLecturaNueva.Text;
          DBEdit10.Text := FCambioLectura.eConsumoNuevo.Text;
          DBLookupComboBox1.KeyValue := 0;
          CodigoCritita := 'C2';
          if qListaLecturaCODIGOTIPOMEDIDA.AsInteger = 1 then
          begin
            DBEdit12.Text := FCambioLectura.eLecturaNuevaR.Text;
            DBEdit11.Text := FCambioLectura.eConsumoNuevoR.Text;
       //     DBLookupComboBox2.KeyValue := 0;
          end;

          if qListaLecturaCODIGOTIPOMEDIDA.AsInteger = 2 then
          begin
            DBEdit12.Text := FCambioLectura.eLecturaNuevaR.Text;
            DBEdit11.Text := FCambioLectura.eConsumoNuevoR.Text;
           // DBLookupComboBox2.KeyValue := 0;
            DBEdit14.Text := FCambioLectura.eLecturaNuevaD.Text;
           // DBEdit13.Text := FCambioLectura.eConsumoNuevoD.Text;
           // DBLookupComboBox3.KeyValue := 0;
          end;

        end;

      end;

    end;
  finally
    { Query.Free; }
  end;
end;

procedure TFAnalisisFacturacion.SpeedButton3Click(Sender: TObject);
var
  Query: TQuery;
  buttonSelected: Integer;
  sTextoPregunta: String;
begin
  Query := TQuery.create(nil);
  Query.DatabaseName := 'BaseDato';
  try
  //  Application.NormalizeTopMosts;
    sTextoPregunta :=
      '¿ Esta Seguro que desea Modificar el consumo de la cuenta por el Promedio ? ' +
      chr(13) + ' El Nuevo Consumo sera : ' +
      IntToStr(Ceil(StrToFloat(PromediarLectura(1))));

    if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
    begin
      CodigoCritita := 'C3';
      DBEdit10.Text := IntToStr(Round(StrToFloat(PromediarLectura(1))));
      DBEdit9.Text :=
        IntToStr( CalcularLectura(qListaLecturaULTIMALECTURA.AsInteger,Round(0/
        qListaLecturaFACTORMULTIPLICADOR.AsInteger),
        qListaLecturaNUMEROAGUJAS.AsInteger)
        { Round(StrToFloat(PromediarLectura(1))/qListaLecturaFACTORMULTIPLICADOR.AsInteger) +
          StrToInt(qListaLecturaULTIMALECTURA.AsString) }
        );
      DBLookupComboBox1.KeyValue := 2;

      if qListaLecturaCODIGOTIPOMEDIDA.AsInteger = 1 then
      begin

       // DBLookupComboBox2.KeyValue := 2;
        DBEdit11.Text := IntToStr(Round(StrToFloat(PromediarLectura(2))));
        DBEdit12.Text := IntToStr(
          { Round(StrToFloat(PromediarLectura(2))/qListaLecturaFACTORMULTIPLICADOR.AsInteger) +
            StrToInt(qListaLecturaS_LECTUR_ACTUAL_R.AsString) }
          CalcularLectura(qListaLecturaS_LECTUR_ACTUAL_R.AsInteger,Round(0/
          qListaLecturaFACTORMULTIPLICADOR.AsInteger),
          qListaLecturaNUMEROAGUJAS.AsInteger));
      end;

      if qListaLecturaCODIGOTIPOMEDIDA.AsInteger = 2 then
      begin
      //  DBLookupComboBox2.KeyValue := 2;
        DBEdit11.Text := IntToStr(Round(StrToFloat(PromediarLectura(2))));
        DBEdit12.Text := IntToStr(
          { Round(StrToFloat(PromediarLectura(2))/qListaLecturaFACTORMULTIPLICADOR.AsInteger) +
            StrToInt(qListaLecturaS_LECTUR_ACTUAL_R.AsString) }
          CalcularLectura(qListaLecturaS_LECTUR_ACTUAL_R.AsInteger,Round(0/
          qListaLecturaFACTORMULTIPLICADOR.AsInteger),
          qListaLecturaNUMEROAGUJAS.AsInteger));

        DBEdit14.Text := IntToStr(Round(StrToFloat(PromediarLectura(3))));



      end;
    END;
    Application.RestoreTopMosts;
  finally
    { Query.Free; }
  end;

end;

function TFAnalisisFacturacion.PromediarLectura(Tipo: Integer): String;
var
  Query: TQuery;
  sp: TStoredProc;
begin

  Query := TQuery.create(nil);
  Query.DatabaseName := 'BaseDato';

  { try

    sp := TStoredProc.create(nil);
    sp.DatabaseName := 'BaseDato';
    sp.StoredProcName := 'SGC_LISTADOVALORES';
    sp.Close;
    sp.Params.Clear;
    sp.Params.CreateParam(ftFloat, 'TIPO', ptInput);
    sp.Params.CreateParam(ftFloat, 'CODIGO', ptInput);
    sp.Params.CreateParam(ftDateTime, 'FECHALECTURA', ptInput);

    sp.ParamByName('TIPO').AsFloat := Tipo;
    sp.ParamByName('CODIGO').AsFloat := qListaLecturaCLAVE.AsFloat;
    sp.ParamByName('FECHALECTURA').AsDateTime :=
    qListaLecturaFECHALECTURA.AsDateTime;

    sp.Prepare;
    sp.ExecProc;
    // sp.AutoCalcFields := true;
    except
    on e: Exception do
    begin
    ShowMessage(e.Message);
    end;

    end;
  }
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add
    ('SELECT SGC_PROMEDIO_LECTURA(:TIPO,:CODIGO,:FECHALECTURA,:CODIGOANOMALIA) as promedio FROM DUAL');
  Query.ParamByName('TIPO').AsFloat := Tipo;
  Query.ParamByName('CODIGO').AsFloat := qListaLecturaCLAVE.AsFloat;
  Query.ParamByName('CODIGOANOMALIA').AsString := qListaLecturaCODIGOANOMALIA.AsString;
  Query.ParamByName('FECHALECTURA').AsDateTime :=
    qListaLecturaFECHALECTURA_1.AsDateTime;
  Query.Open;

  Result := Query.FieldByName('promedio').AsString;

  Query.Free;
end;

procedure TFAnalisisFacturacion.sgtituloDrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  texto: string;
begin
{  with sgtitulo do
  begin
    texto := Cells[ACol, ARow];
    if ARow = 0 then
    begin // primera fila centrada
      Canvas.TextRect(Rect, Rect.Left + (Rect.Right - Rect.Left -
        Canvas.TextWidth(texto) + 1) div 2, Rect.Top + 2, texto);
    end
    else if ACol = 0 then
    begin // primera columna alineada a la derecha
      Canvas.TextRect(Rect, Rect.Right - Canvas.TextWidth(texto) - 2,
        Rect.Top + 2, texto);
    end;
  end; }
end;

procedure TFAnalisisFacturacion.GenerarGrafica(Grafica: String);
var
  Serie: TBarSeries;
  Color: Tcolor;
  i: Integer;
Marca: TBookmark;
begin
  try
  if (Grafica = 'CONSUMOACTIVA') or (Grafica = 'LECTURAACTIVA') or ((Grafica = 'CONSUMOREACTIVA') AND (qListaLecturaCODIGOTIPOMEDIDA.AsInteger =1))  then
  begin
    Serie := TBarSeries.create(DBChart);
    Serie.Title := 'Serie1';
    DBChart.RemoveAllSeries;

      Color := clSilver;
      Marca := cbsTablas.GetBookmark;
cbsTablas.First;
cbsTablas.Next;
  i := 1;
 while not   cbsTablas.Eof do
 begin
      Serie.AddXY(i, cbsTablas.FieldByName(Grafica).AsFloat,
      cbsTablas.fieldByNAme('Nombre').ASString, Color);

  DBChart.AddSeries(Serie);
 cbsTablas.next;
 i := i+1;
 end;
  cbsTablas.GotoBookmark(Marca);
    end;
  Except
    on e: Exception do
    begin

    end;
  end;
end;

procedure TFAnalisisFacturacion.sgHistoricoMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ACol, ARow: Integer;
begin
end;

procedure TFAnalisisFacturacion.sbConfirmarClick(Sender: TObject);
var
  Query: TQuery;
  buttonSelected: Integer;
begin
  Query := TQuery.create(nil);
  Query.DatabaseName := 'BaseDato';
  try

    buttonSelected :=
      messagedlg('¿ Esta Seguro que desea confirmar la lectura ?',
      mtConfirmation, [mbOK, mbCancel], 0);

    if buttonSelected = 1 then
    begin
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add
        ('UPDATE SIGCOM_LECTURA SET MARCA_CRITICA=''C1'',FECHA_CRITICA=SYSDATE,CODIGOUSUARIO_CRITICA=(SELECT GETCODIGOUSUARIO FROM DUAL) ,ESTADOLECTURA=''3'',LECTURA_CONCRITICA='
        + DBEdit9.Text + ' ');
      Query.SQL.Add('WHERE CODIGOLECTURA=' +
        qListaLecturaCODIGOLECTURA.AsString + ' ');
      Query.ExecSQL;
    end;
  finally
    Query.Free;
  end;
end;

procedure TFAnalisisFacturacion.SpeedButton4Click(Sender: TObject);
var
  Query: TQuery;
  buttonSelected: Integer;
begin
  DBEdit9.Text := PromediarLectura(1);
  Query := TQuery.create(nil);
  Query.DatabaseName := 'BaseDato';
  try

    buttonSelected :=
      messagedlg('¿ Esta Seguro que desea ESTIMAR ( usando el CENSO DE CARGA )  ?',
      mtConfirmation, [mbOK, mbCancel], 0);

    if buttonSelected = 1 then
    begin
      CodigoCritita := 'C4';
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('UPDATE SIGCOM_LECTURA SET MARCA_CRITICA=''' + CodigoCritita
        + ''',FECHA_CRITICA=SYSDATE,CODIGOUSUARIO_CRITICA=(SELECT GETCODIGOUSUARIO FROM DUAL),ESTADOLECTURA=''4'',LECTURA_CONCRITICA='
        + DBEdit9.Text + ' ');
      Query.SQL.Add('WHERE CODIGOLECTURA=' +
        qListaLecturaCODIGOLECTURA.AsString + ' ');
      Query.ExecSQL;
    end;
  finally
    Query.Free;
  end;
end;

procedure TFAnalisisFacturacion.qListaLecturaCalcFields(DataSet: TDataSet);
var
  Mes, Dia, Ano, Fecha: String;
  Fecha1: TDateTime;
  Fecha2: TDateTime;
  Query, Query1: TQuery;
begin


  Query := TQuery.create(Self);
  Query.DatabaseName := 'BaseDato';

  Query1 := TQuery.create(Self);
  Query1.DatabaseName := 'BaseDato';

  Fecha := Copy(qListaLecturaFECHAULTIMALECTURA.AsString, 1, 2);
  Ano := '20' + Fecha;
  Fecha := Copy(qListaLecturaFECHAULTIMALECTURA.AsString, 3, 2);
  Mes := Fecha;
  Fecha := Copy(qListaLecturaFECHAULTIMALECTURA.AsString, 5, 2);
  Dia := Fecha;
  qListaLecturaFECHAULTIMALECTURAFORMATO.AsString := Dia + '/' + Mes +
    '/' + Ano;
  TRY
    Fecha2 := qListaLecturaFECHAULTIMALECTURAFORMATO.AsDateTime;

    Fecha1 := qListaLecturaFECHALECTURA_1.AsDateTime;

    qListaLecturaDIASDIFERENCIA.AsInteger := Trunc(Fecha1) - Trunc(Fecha2);
  Except
    qListaLecturaFECHAULTIMALECTURAFORMATO.AsString := '';
    qListaLecturaDIASDIFERENCIA.AsInteger := 30;
  end;

  qListaLecturaCONSUMOANTERIOR.AsString := qListaLectura.FieldByName
    ('CONSUMO' + PeriodoAnterior).AsString;

  if trim(qListaLecturaDESVIACIONCONSUMO.AsString) = '' then
  BEGIN
    qListaLecturaDESVIACIONDECONSUMOVALOR.AsString := '0';
    qListaLecturaCODIGOANOMALIACONS.AsString :=
      qListaLecturaCODIGOANOMALIA.AsString;
    qListaLecturaDESCRIPCIONDETALLADA.AsString := qListaLecturaNOMBRE.AsString +
      ' ' + qListaLecturaDESCRIPCION.AsString;
  END
  else
  begin

    Query.SQL.Clear;
    Query.SQL.Add('SELECT ROUND(' + qListaLecturaDESVIACIONCONSUMO.AsString +
      ') as valor FROM DUAL');
    Query.Open;

    qListaLecturaDESVIACIONDECONSUMOVALOR.AsString :=
      Query.FieldByName('valor').AsString;
    qListaLecturaCODIGOANOMALIACONS.AsString :=
      qListaLecturaCODIGOANOMALIA.AsString + ' ,' +
      qListaLecturaCODIGOANOMALIACONSUMOACT.AsString;

    Query1.SQL.Clear;
    Query1.SQL.Add('SELECT DESCRIPCION FROM SGC_CLASES WHERE CODIGOCLASE =''' +
      trim(qListaLecturaCODIGOANOMALIACONSUMOACT.AsString) + ''' ');
    Query1.Open;

    qListaLecturaDESCRIPCIONDETALLADA.AsString := qListaLecturaNOMBRE.AsString +
      ' ' + char(13) + ' ' + qListaLecturaDESCRIPCION.AsString + ' ' + char(13)
      + ' ' + Query1.FieldByName('DESCRIPCION').AsString;

  end;

  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT ROUND(' + PromediarLectura(1) + ') as valor FROM DUAL');
  Query.Open;

  qListaLecturaPROMEDIOCALCULADO.AsString := Query.FieldByName('valor')
    .AsString;

  Query1.Free;
  Query.Free;
end;

procedure TFAnalisisFacturacion.SpeedButton6Click(Sender: TObject);
begin

  if Application.MessageBox(PChar(' ¿ Desea restaurar la información Original de la cuenta ?'),
    'Confirmación', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
  begin
    DBEdit10.Text := qListaLecturaCONSUMOACTUAL.AsString;
    DBEdit9.Text := qListaLecturaLECTURAACTUAL.AsString;

    DBLookupComboBox1.KeyValue := TipoFacturacion;

    if qListaLecturaCODIGOTIPOMEDIDA.AsInteger = 1 then
    begin
      DBEdit12.Text := qListaLecturaLECTURAREACTIVA.AsString;
      DBEdit11.Text := qListaLecturaCONSUMO_REACTIVA.AsString;
     // DBLookupComboBox2.KeyValue := TipoFacturacionReactiva;
    end;

    if qListaLecturaCODIGOTIPOMEDIDA.AsInteger = 2 then
    begin
      DBEdit14.Text := qListaLecturaPOTENCIA.AsString;
    //  DBEdit13.Text := qListaLecturaCONSUMODEMANDA.AsString;
     // DBLookupComboBox3.KeyValue := TipoFacturacionDemanda;
    end;

  end;

end;

procedure TFAnalisisFacturacion.HabilitarTipoMedida;
begin
  if qListaLecturaCODIGOTIPOMEDIDA.AsInteger = 1 then
  begin
    Label21.Enabled := true;

    Label21.Font.Style := [fsBold];

    Label20.Enabled := true;
    Label20.Font.Style := [fsBold];

   // Label19.Enabled := true;
   // Label19.Font.Size := 12;
   // Label19.Font.Style := [fsBold];

    qTipoFacturacionReactiva.Open;

  end
  else if qListaLecturaCODIGOTIPOMEDIDA.AsInteger = 2 then
  begin
    Label21.Enabled := true;
    Label21.Font.Style := [fsBold];

    Label20.Enabled := true;
    Label20.Font.Style := [fsBold];

  //  Label19.Enabled := true;
  //  Label19.Font.Size := 12;
  //  Label19.Font.Style := [fsBold];

    Label24.Enabled := true;
    Label24.Font.Style := [fsBold];

 //   Label23.Enabled := true;
 //   Label23.Font.Size := 12;
 //   Label23.Font.Style := [fsBold];

 //   Label22.Enabled := true;
 //   Label22.Font.Size := 12;
 //   Label22.Font.Style := [fsBold];

    qTipoFacturacionDemanda.Open;
    qTipoFacturacionReactiva.Open;
  end;

end;

function TFAnalisisFacturacion.Tarifa: Extended;
begin

end;

procedure TFAnalisisFacturacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  if Assigned(fGaleriaPreliminar) then
  begin
    fGaleriaPreliminar.Free;
    fGaleriaPreliminar := nil;
  end;

  { FAnalisisFacturacion.Free; }
  FAnalisisFacturacion := nil;

end;

function TFAnalisisFacturacion.CalcularConsumo(LecturaAnterior, LecturaActual,
  Agujas: Integer): Integer;
begin

  Result := LecturaActual - LecturaAnterior;

  IF Result < 0 then
    Result := ((Medidor(Agujas) - LecturaAnterior) + LecturaActual);

end;

function TFAnalisisFacturacion.Medidor(Agujas: Integer): Integer;
begin
  if Agujas = 3 then
    Result := 1000;
  if Agujas = 4 then
    Result := 10000;
  if Agujas = 5 then
    Result := 100000;
  if Agujas = 6 then
    Result := 10000000;
  if Agujas = 7 then
    Result := 100000000;
  if Agujas = 8 then
    Result := 1000000000;
end;

function TFAnalisisFacturacion.CalcularLectura(LecturaAnterior, NuevoConsumo,
  Agujas: Integer): Integer;
var
  Valor: Integer;
begin
  Valor := LecturaAnterior + NuevoConsumo;

  if Valor >= Medidor(Agujas) then
    Result := Valor - Medidor(Agujas)
  else
    Result := Valor;

end;

procedure TFAnalisisFacturacion.sbHistoricoClick(Sender: TObject);
var
  fInformacion: TfInformacionOriginal;
begin
  fInformacion := TfInformacionOriginal.create(Self);
  fInformacion.qTipoFacturacion.Close;
  fInformacion.qTipoFacturacion.ParamByName('CODIGO').AsString :=
    qListaLectura.FieldByName('TIPOFACTURACION_CRITICA').AsString;
  fInformacion.qTipoFacturacion.Open;
  fInformacion.eLectura.Text := qListaLecturaLECTURA_CONCRITICA.AsString;
  fInformacion.eConsumo.Text := qListaLecturaCONSUMO_CONCRITICA.AsString;
  fInformacion.ldesviacion.Caption := qListaLecturaDESVIACIONCONSUMO_CONCRITICA.
    AsString + ' %';
  fInformacion.eLecturaReactiva.Text := qListaLectura.FieldByName
    ('LECTURAREACTIVA_CONCRITICA').AsString;
  fInformacion.eLecturaDemanda.Text := qListaLectura.FieldByName
    ('LECTURADEMANDA_CONCRITICA').AsString;
  fInformacion.eConsumoReactiva.Text :=
    qListaLecturaCONSUMO_REACTIVA_CONCRITICA.AsString;
    fInformacion.LdesviacionReactiva.Caption :=qListaLecturaDESVIACIONREACTIVA_CONCRITICA.AsString +' %';
    fInformacion.lDesviacionDemanda.Caption := qListaLecturaDESVIACIONDEMANDA_CONCRITICA.AsString+ ' %';

  try
    fInformacion.eConsumoDemanda.Text :=
      FloatToStr(qListaLecturaLECTRUAENCONTRADA_DEMANDA.AsInteger *
      qListaLecturaFACTORMULTIPLICADOR.AsInteger);
  Except
    fInformacion.eConsumoDemanda.Text := '0';
  end;

  fInformacion.ShowModal;

end;

procedure TFAnalisisFacturacion.sbMedidorClick(Sender: TObject);
var
  fInformacion: TfInformacionMedidor;
begin
  fInformacion := TfInformacionMedidor.create(Self);
  fInformacion.qInformacion.Close;
  fInformacion.qInformacion.ParamByName('CLAVE').AsString :=
    qListaLecturaCLAVE.AsString;
  fInformacion.qInformacion.ParamByName('FECHALECTURA').AsString :=
    FechaLectura;
  fInformacion.qInformacion.Open;
  fInformacion.ShowModal;
end;

procedure TFAnalisisFacturacion.FormCreate(Sender: TObject);
VAR
  Query: TQuery;
begin
  try
    Query := TQuery.create(Self);
    Query.DatabaseName := 'BaseDato';
    Query.SQL.Add('alter session set NLS_NUMERIC_CHARACTERS = ''.,''  ');
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

function TFAnalisisFacturacion.LecturaMes(Mes: String ; var Tipo : String): String;
begin
Result := '0';
Tipo := '';
qCodigoLectura.close;
qCodigoLectura.ParamByName('CODIGOMES').AsString := Mes;
qCodigoLectura.ParamByName('CLAVE').AsString := ConvertirClave(qListaLecturaCLAVE.AsString);
qCodigoLectura.open;

 if not  qCodigoLectura.IsEmpty then
 begin
 Result :=  qCodigoLectura.fieldByName('HL_LECTURA').AsString;
 Tipo :=   qCodigoLectura.fieldByName('TIPO').AsString;
 end;

end;

procedure TFAnalisisFacturacion.sbINCMSClick(Sender: TObject);
var
Query : TQuery;
sTextoPregunta : sTRING;
begin
    sTextoPregunta :='¿ Esta seguro que desea que esta cuenta se analice en INCMS ? ';

    if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
    begin

       try
        Query := TQuery.create(nil);
        Query.DatabaseName := 'BaseDato';
        Query.SQL.Add('UPDATE SIGCOM_LECTURA SET CODIGOANALISTA=NULL,CRITICA_INCMS=''SI'',ESTADOLECTURA=4 WHERE FECHA_PROGRAMADA=to_date('+QuotedStr(qListaLecturaFECHA_PROGRAMADA.AsString)+',''DD/MM/YYYY'')  and CLAVE='+qListaLecturaCLAVE.AsString+'  ');
        Query.ExecSQL;

        IF Query.RowsAffected >0 THEN
        begin
      messagedlg('Se ha modificado la cuenta.',mtInformation,[mbOk],0);

        if Assigned(fListaCritica) then
        begin

        fListaCritica.qListaLectura.Close;
         fListaCritica.qListaLectura.Open;

         fListaCritica.qListaResueltos.Close;

         fListaCritica.qListaResueltos.Open;

        //  fListaCritica.qlistaLecturaPendientes.Close;
        //  fListaCritica.qlistaLecturaPendientes.Open;
         end;

        Close;
        end
        else
            messagedlg('Ha ocurrido un error al intentar pasar la cuenta a INCMS.',mtError,[mbOk],0);

      finally

        Query.Free;
      end;


    end;
end;

procedure TFAnalisisFacturacion.CargarTablaHistorico;
var
Tipo : String;
begin
    if not cbsTablas.IsEmpty then
    begin
      cbsTablas.EmptyDataSet;
      cbsTablas.Close;

    end;

    cbsTablas.Open;
    cbsTablas.Append;



    cbsTablas.fieldbyname('Nombre').AsString := 'Actual';
     cbsTablas.fieldbyname('TIPO').AsString := qTipoFacturacionNOMBRETIPOFACTURACION.aSsTRING;
    cbsTablas.fieldbyname('CONSUMOACTIVA').AsString := qListaLecturaCONSUMOACTUAL.AsString;
    cbsTablas.fieldbyname('LECTURAACTIVA').AsString := qListaLecturaLECTURAACTUAL.AsString;
    cbsTablas.fieldbyname('CONSUMOREACTIVA').AsString := qListaLecturaCONSUMOREACTIVA.AsString;
    cbsTablas.fieldbyname('LECTURAREACTIVA').AsString := qListaLecturaLECTURAREACTIVA.AsString;
    cbsTablas.fieldbyname('CONSUMODEMANDA').AsString := qListaLecturaPOTENCIA.AsString;
    cbsTablas.Post;


    cbsTablas.Append;
    cbsTablas.fieldbyname('Nombre').AsString := 'Enero';
    cbsTablas.fieldbyname('CONSUMOACTIVA').AsString := qListaLecturaCONSUMO1.AsString;
    cbsTablas.fieldbyname('LECTURAACTIVA').AsString := LecturaMes('01',Tipo);
    cbsTablas.fieldbyname('TIPO').AsString := Tipo;
    cbsTablas.fieldbyname('CONSUMOREACTIVA').AsString := qListaLecturaS_CONSUMO1.AsString;
    cbsTablas.fieldbyname('LECTURAREACTIVA').AsString := '';
    cbsTablas.fieldbyname('CONSUMODEMANDA').AsString :=  '';
    cbsTablas.Post;

    cbsTablas.Append;
    cbsTablas.fieldbyname('Nombre').AsString := 'Febrero';
    cbsTablas.fieldbyname('CONSUMOACTIVA').AsString := qListaLecturaCONSUMO2.AsString;
    cbsTablas.fieldbyname('LECTURAACTIVA').AsString := LecturaMes('02',Tipo);
    cbsTablas.fieldbyname('CONSUMOREACTIVA').AsString := qListaLecturaS_CONSUMO2.AsString;
    cbsTablas.fieldbyname('LECTURAREACTIVA').AsString := '';
    cbsTablas.fieldbyname('CONSUMODEMANDA').AsString :=  '';
    cbsTablas.fieldbyname('TIPO').AsString := Tipo;
    cbsTablas.Post;

    cbsTablas.Append;
    cbsTablas.fieldbyname('Nombre').AsString := 'Marzo';
    cbsTablas.fieldbyname('CONSUMOACTIVA').AsString := qListaLecturaCONSUMO3.AsString;
    cbsTablas.fieldbyname('LECTURAACTIVA').AsString := LecturaMes('03',Tipo);
    cbsTablas.fieldbyname('CONSUMOREACTIVA').AsString := qListaLecturaS_CONSUMO3.AsString;
    cbsTablas.fieldbyname('LECTURAREACTIVA').AsString := '';
    cbsTablas.fieldbyname('CONSUMODEMANDA').AsString :=  '';
    cbsTablas.fieldbyname('TIPO').AsString := Tipo;
    cbsTablas.Post;

        cbsTablas.Append;
    cbsTablas.fieldbyname('Nombre').AsString := 'Abril';
    cbsTablas.fieldbyname('CONSUMOACTIVA').AsString := qListaLecturaCONSUMO4.AsString;
    cbsTablas.fieldbyname('LECTURAACTIVA').AsString := LecturaMes('0',Tipo);
    cbsTablas.fieldbyname('CONSUMOREACTIVA').AsString := qListaLecturaS_CONSUMO4.AsString;
    cbsTablas.fieldbyname('LECTURAREACTIVA').AsString := '';
    cbsTablas.fieldbyname('CONSUMODEMANDA').AsString :=  '';
    cbsTablas.fieldbyname('TIPO').AsString := Tipo;
    cbsTablas.Post;

        cbsTablas.Append;
    cbsTablas.fieldbyname('Nombre').AsString := 'Mayo';
    cbsTablas.fieldbyname('CONSUMOACTIVA').AsString := qListaLecturaCONSUMO5.AsString;
    cbsTablas.fieldbyname('LECTURAACTIVA').AsString := LecturaMes('05',Tipo);
    cbsTablas.fieldbyname('CONSUMOREACTIVA').AsString := qListaLecturaS_CONSUMO5.AsString;
    cbsTablas.fieldbyname('LECTURAREACTIVA').AsString := '';
    cbsTablas.fieldbyname('CONSUMODEMANDA').AsString :=  '';
    cbsTablas.fieldbyname('TIPO').AsString := Tipo;
    cbsTablas.Post;

        cbsTablas.Append;
    cbsTablas.fieldbyname('Nombre').AsString := 'Junio';
    cbsTablas.fieldbyname('CONSUMOACTIVA').AsString := qListaLecturaCONSUMO6.AsString;
    cbsTablas.fieldbyname('LECTURAACTIVA').AsString := LecturaMes('06',Tipo);
    cbsTablas.fieldbyname('CONSUMOREACTIVA').AsString := qListaLecturaS_CONSUMO6.AsString;
    cbsTablas.fieldbyname('LECTURAREACTIVA').AsString := '';
    cbsTablas.fieldbyname('CONSUMODEMANDA').AsString :=  '';
    cbsTablas.fieldbyname('TIPO').AsString := Tipo;
    cbsTablas.Post;

        cbsTablas.Append;
    cbsTablas.fieldbyname('Nombre').AsString := 'Julio';
    cbsTablas.fieldbyname('CONSUMOACTIVA').AsString := qListaLecturaCONSUMO7.AsString;
    cbsTablas.fieldbyname('LECTURAACTIVA').AsString := LecturaMes('07',Tipo);
    cbsTablas.fieldbyname('CONSUMOREACTIVA').AsString := qListaLecturaS_CONSUMO7.AsString;
    cbsTablas.fieldbyname('LECTURAREACTIVA').AsString := '';
    cbsTablas.fieldbyname('CONSUMODEMANDA').AsString :=  '';
    cbsTablas.fieldbyname('TIPO').AsString := Tipo;
    cbsTablas.Post;

        cbsTablas.Append;
    cbsTablas.fieldbyname('Nombre').AsString := 'Agosto';
    cbsTablas.fieldbyname('CONSUMOACTIVA').AsString := qListaLecturaCONSUMO8.AsString;
    cbsTablas.fieldbyname('LECTURAACTIVA').AsString := LecturaMes('08',Tipo);
    cbsTablas.fieldbyname('CONSUMOREACTIVA').AsString := qListaLecturaS_CONSUMO8.AsString;
    cbsTablas.fieldbyname('LECTURAREACTIVA').AsString := '';
    cbsTablas.fieldbyname('CONSUMODEMANDA').AsString :=  '';
    cbsTablas.fieldbyname('TIPO').AsString := Tipo;
    cbsTablas.Post;

        cbsTablas.Append;
    cbsTablas.fieldbyname('Nombre').AsString := 'Septiembre';
    cbsTablas.fieldbyname('CONSUMOACTIVA').AsString := qListaLecturaCONSUMO9.AsString;
    cbsTablas.fieldbyname('LECTURAACTIVA').AsString := LecturaMes('09',Tipo);
    cbsTablas.fieldbyname('CONSUMOREACTIVA').AsString := qListaLecturaS_CONSUMO9.AsString;
    cbsTablas.fieldbyname('LECTURAREACTIVA').AsString := '';
    cbsTablas.fieldbyname('CONSUMODEMANDA').AsString :=  '';
    cbsTablas.fieldbyname('TIPO').AsString := Tipo;
    cbsTablas.Post;

        cbsTablas.Append;
    cbsTablas.fieldbyname('Nombre').AsString := 'Octubre';
    cbsTablas.fieldbyname('CONSUMOACTIVA').AsString := qListaLecturaCONSUMO10.AsString;
    cbsTablas.fieldbyname('LECTURAACTIVA').AsString := LecturaMes('10',Tipo);
    cbsTablas.fieldbyname('CONSUMOREACTIVA').AsString := qListaLecturaS_CONSUMO10.AsString;
    cbsTablas.fieldbyname('LECTURAREACTIVA').AsString := '';
    cbsTablas.fieldbyname('CONSUMODEMANDA').AsString :=  '';
    cbsTablas.fieldbyname('TIPO').AsString := Tipo;
    cbsTablas.Post;

        cbsTablas.Append;
    cbsTablas.fieldbyname('Nombre').AsString := 'Noviembre';
    cbsTablas.fieldbyname('CONSUMOACTIVA').AsString := qListaLecturaCONSUMO11.AsString;
    cbsTablas.fieldbyname('LECTURAACTIVA').AsString := LecturaMes('11',Tipo);
    cbsTablas.fieldbyname('CONSUMOREACTIVA').AsString := qListaLecturaS_CONSUMO11.AsString;
    cbsTablas.fieldbyname('LECTURAREACTIVA').AsString := '';
    cbsTablas.fieldbyname('CONSUMODEMANDA').AsString :=  '';
    cbsTablas.fieldbyname('TIPO').AsString := Tipo;
    cbsTablas.Post;

        cbsTablas.Append;
    cbsTablas.fieldbyname('Nombre').AsString := 'Diciembre';
    cbsTablas.fieldbyname('CONSUMOACTIVA').AsString := qListaLecturaCONSUMO12.AsString;
    cbsTablas.fieldbyname('LECTURAACTIVA').AsString := LecturaMes('12',Tipo);
    cbsTablas.fieldbyname('CONSUMOREACTIVA').AsString := qListaLecturaS_CONSUMO12.AsString;
    cbsTablas.fieldbyname('LECTURAREACTIVA').AsString := '';
    cbsTablas.fieldbyname('CONSUMODEMANDA').AsString :=  '';
    cbsTablas.fieldbyname('TIPO').AsString := Tipo;
    cbsTablas.Post;

    rcListadoLecturas.DataSource := dsLecturas;

end;

function TFAnalisisFacturacion.ConvertirClave(
  CodigoCuenta: String): String;
  var
  numero : Double;
begin
 numero:= StrToFloat(CodigoCuenta);

if  (numero>3000000) and (numero<4000000) then
Result := FloatToStr(numero-3000000)
else
result := CodigoCuenta;

end;

procedure TFAnalisisFacturacion.rcListadoLecturasCellClick(
  Column: TColumn);
begin
GenerarGrafica(Column.FieldName);
end;

end.
