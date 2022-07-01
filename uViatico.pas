unit uViatico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, Digisoft,
  Grids, DBGrids, ToolEdit, CurrEdit, Menus, UComunesAdministrativo, Math;

type
  TFViatico = class(TForm)
    qViatico: TQuery;
    qEmpleado: TQuery;
    dsEmpleado: TDataSource;
    qSueldo: TQuery;
    dsSueldo: TDataSource;
    dsViatico: TDataSource;
    dsCia: TDataSource;
    qCia: TQuery;
    qOdt: TQuery;
    dsOdt: TDataSource;
    qViaticoDiario: TQuery;
    dsViaticoDiario: TDataSource;
    qMunicipioDestino: TQuery;
    dsMunicipioDestino: TDataSource;
    pInferior: TPanel;
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    sbImprimir: TSpeedButton;
    updViatico: TUpdateSQL;
    PanelEncabezado: TPanel;
    Label2: TLabel;
    dbEdNombreEmpleado: TDBEdit;
    Label1: TLabel;
    dbEdCedula: TDBEdit;
    Label3: TLabel;
    dbEdCia: TDBEdit;
    Label4: TLabel;
    dbEdCodigoODT: TDBEdit;
    Label7: TLabel;
    dbEdMunicipioDestino: TDBEdit;
    Label27: TLabel;
    dbEdFechaInicio: TDBEdit;
    Label28: TLabel;
    dbEdFechaFin: TDBEdit;
    Label29: TLabel;
    dbEdDias: TDBEdit;
    Label8: TLabel;
    dbEdViaticoDiario: TDBEdit;
    Panel6: TPanel;
    qEmpleadoCODIGOEMPLEADO: TFloatField;
    qEmpleadoNOMBREEMPLEADO: TStringField;
    qEmpleadoDIRECCION: TStringField;
    qEmpleadoBARRIO: TStringField;
    qEmpleadoTELEFONO: TStringField;
    qEmpleadoCODIGOSUELDO: TStringField;
    qEmpleadoCODIGOADMINISTRATIVO: TFloatField;
    qEmpleadoREFERENCIA: TStringField;
    Label19: TLabel;
    dbEdComision: TDBEdit;
    qViaticoCODIGOVIATICO: TFloatField;
    qViaticoCODIGOEMPLEADO: TFloatField;
    qViaticoCODIGOODT: TFloatField;
    qViaticoCODIGOCOMISION: TFloatField;
    qViaticoFECHAINICIO: TDateTimeField;
    qViaticoFECHAFIN: TDateTimeField;
    qViaticoUSOVEHICULO: TStringField;
    qViaticoVEHICULOOFICIAL: TStringField;
    qViaticoDias: TIntegerField;
    qViaticoValorViatico: TFloatField;
    updValorViatico: TUpdateSQL;
    dsValorViatico: TDataSource;
    qValorViatico: TQuery;
    qValorViaticoCODIGOVIATICODETALLE: TFloatField;
    qValorViaticoCODIGOVIATICO: TFloatField;
    qValorViaticoCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qValorViaticoVALORIMPUTACION: TFloatField;
    qValorViaticoNUMEROIMPUTACION: TFloatField;
    qValorViaticoAUXILIAR: TFloatField;
    qValorViaticoDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qViaticoAnoInicio: TDateField;
    qViaticoMesInicio: TDateField;
    qViaticoDiaInicio: TDateField;
    qViaticoAnoFin: TDateField;
    qViaticoMesFin: TDateField;
    qViaticoDiaFin: TDateField;
    Label10: TLabel;
    dbEdValorViatico: TDBEdit;
    qViaticoCODIGOZONAORIGEN: TFloatField;
    qViaticoCODIGOMUNICIPIODESTINO: TFloatField;
    Label32: TLabel;
    dbEdZonaOrigen: TDBEdit;
    qZonaOrigen: TQuery;
    dsZona: TDataSource;
    qMunicipioDestinoCODIGOMUNICIPIO: TFloatField;
    qMunicipioDestinoNOMBREMUNICIPIO: TStringField;
    qMunicipioDestinoCODIGOZONA: TFloatField;
    qMunicipioDestinoCODIGO_CUENTA: TFloatField;
    qMunicipioDestinoZONAESPECIAL: TStringField;
    qMunicipioDestinoNOMBREZONA: TStringField;
    qViaticoCODIGOVEHICULO: TStringField;
    qViaticoDiarioCODIGOVIATICOZONA: TFloatField;
    qViaticoDiarioCODIGOZONAORIGEN: TFloatField;
    qViaticoDiarioCODIGOZONADESTINO: TFloatField;
    qViaticoDiarioVALORVIATICO: TFloatField;
    qViaticoDiarioVALORAUXILIO: TFloatField;
    qViaticoDiarioPORCENTAJESALARIO: TFloatField;
    qViaticoDiarioPORCENTAJEULTIMODIA: TFloatField;
    qGerencia: TQuery;
    dsGerencia: TDataSource;
    qGerenciaNOMBRECATEGORIA: TStringField;
    qOdtCODIGOODT: TFloatField;
    qOdtFECHAEMISION: TDateTimeField;
    qOdtMOTIVOS: TMemoField;
    qOdtCODIGOADMINISTRATIVO: TFloatField;
    qOdtCODIGOPRIORIDAD: TStringField;
    qOdtCODIGOLABOR: TStringField;
    qOdtCODIGOTIPOTAREA: TFloatField;
    qOdtCODIGOAPROBADO: TFloatField;
    qOdtCODIGOREVISADO: TFloatField;
    qOdtCODIGOODTTIPOMANOOBRA: TFloatField;
    qOdtCODIGOEJECUTOR: TFloatField;
    qOdtCODIGOFIRMANTE: TFloatField;
    qOdtEQUIPOENERGIZADO: TStringField;
    qOdtFECHAAPROBACION: TDateTimeField;
    qOdtFECHAASIGNACION: TDateTimeField;
    qOdtIMPUTACIONMATERIAL: TStringField;
    qOdtCOSTOMATERIAL: TFloatField;
    qOdtCOSTOMANOOBRA: TFloatField;
    qOdtCOSTOTRANSPORTE: TFloatField;
    qOdtCOSTOEQUIPO: TFloatField;
    qOdtCODIGOALMACEN: TStringField;
    qOdtCODIGOESTADOODT: TStringField;
    qOdtHORARIONORMALDESDE: TDateTimeField;
    qOdtHORARIONORMALHASTA: TDateTimeField;
    qOdtCODIGOTURNOGRUPO: TFloatField;
    qOdtCODIGOZONATRABAJO: TFloatField;
    qOdtCODIGOIMPUTACIONMATERIAL: TFloatField;
    qOdtSECUENCIA: TStringField;
    qOdtCODIGOMUNICIPIO: TFloatField;
    qOdtFECHAINICIO: TDateTimeField;
    qOdtFECHAFINAL: TDateTimeField;
    qOdtCODIGOZONAORIGEN: TFloatField;
    qOdtCODIGOCONTRATISTA: TStringField;
    qZonaOrigenCODIGOZONA: TFloatField;
    qZonaOrigenNOMBREZONA: TStringField;
    qZonaOrigenCODIGOZONAESSA: TFloatField;
    qViaticoFECHAPAGOANTICIPO: TDateTimeField;
    qViaticoFECHAPAGOVIATICO: TDateTimeField;
    qViaticoANTICIPO: TStringField;
    qViaticoPORCENTAJEANTICIPO: TFloatField;
    qViaticoDIASPROYECTADOS: TFloatField;
    qViaticoVALORANTICIPO: TFloatField;
    qOdtCODIGOAREAINFLUENCIA: TStringField;
    qViaticoCIUDADCAPITAL: TStringField;
    qViaticoCodigoZonaDestino: TIntegerField;
    qCargo: TQuery;
    dsCargo: TDataSource;
    qEmpleadoCODIGOCONTRATISTA: TStringField;
    qEmpleadoCODIGOCARGO: TFloatField;
    qCargoNIVEL: TFloatField;
    qViaticoSueldo: TFloatField;
    qCargoCODIGOCARGO: TFloatField;
    qViaticoNivel: TIntegerField;
    qViaticoCodigoZona: TIntegerField;
    qViaticoDESTINO: TStringField;
    qViaticoESTADO: TStringField;
    gbEscalas: TGroupBox;
    dbgEscalas: TDBGrid;
    DBNavigator1: TDBNavigator;
    qViaticoEscala: TQuery;
    dsViaticoEscala: TDataSource;
    updViaticoEscala: TUpdateSQL;
    qMunicipio: TQuery;
    qValorViaticoEscala: TQuery;
    qValorViaticoEscalaCODIGOVIATICOZONA: TFloatField;
    qValorViaticoEscalaCODIGOZONAORIGEN: TFloatField;
    qValorViaticoEscalaCODIGOZONADESTINO: TFloatField;
    qValorViaticoEscalaVALORVIATICO: TFloatField;
    qValorViaticoEscalaVALORAUXILIO: TFloatField;
    qValorViaticoEscalaPORCENTAJESALARIO: TFloatField;
    qValorViaticoEscalaPORCENTAJEULTIMODIA: TFloatField;
    qValorViaticoEscalaVIGENCIADESDE: TDateTimeField;
    qValorViaticoEscalaVIGENCIAHASTA: TDateTimeField;
    qValorViaticoEscalaSALARIODESDE: TFloatField;
    qValorViaticoEscalaSALARIOHASTA: TFloatField;
    qValorViaticoEscalaCIUDADCAPITAL: TStringField;
    qValorViaticoEscalaNIVELCARGO: TFloatField;
    qValorEscalaDiario: TQuery;
    qViaticoVALORDIARIO: TFloatField;
    qValorEscalaDiarioCODIGOVIATICOZONA: TFloatField;
    qValorEscalaDiarioCODIGOZONAORIGEN: TFloatField;
    qValorEscalaDiarioCODIGOZONADESTINO: TFloatField;
    qValorEscalaDiarioVALORVIATICO: TFloatField;
    qValorEscalaDiarioVALORAUXILIO: TFloatField;
    qValorEscalaDiarioPORCENTAJESALARIO: TFloatField;
    qValorEscalaDiarioPORCENTAJEULTIMODIA: TFloatField;
    qValorEscalaDiarioVIGENCIADESDE: TDateTimeField;
    qValorEscalaDiarioVIGENCIAHASTA: TDateTimeField;
    qValorEscalaDiarioSALARIODESDE: TFloatField;
    qValorEscalaDiarioSALARIOHASTA: TFloatField;
    qValorEscalaDiarioCIUDADCAPITAL: TStringField;
    qValorEscalaDiarioNIVELCARGO: TFloatField;
    qViaticoDIFICILACCESO: TStringField;
    sbFechaInicio: TSpeedButton;
    sbFechaFin: TSpeedButton;
    qViaticoDIASPAGADOS: TFloatField;
    qEmpleadoTipoCecos: TStringField;
    Label16: TLabel;
    DBEdit3: TDBEdit;
    sbBuscarCIG: TSpeedButton;
    SpeedButton7: TSpeedButton;
    qViaticoIMPRESOANTICIPO: TStringField;
    qViaticoCODIGOGEOGRAFICO: TFloatField;
    qMunicipioDestinoCODIGOGEOGRAFICO: TFloatField;
    qGeografico: TQuery;
    qGeograficoNOMBRECATEGORIA: TStringField;
    qGeograficoINDICEDIFICULTAD: TFloatField;
    qViaticoDEVOLUCION: TStringField;
    qViaticoIMPRESOVIATICO: TStringField;
    qViaticoNUMEROIMPRESION: TFloatField;
    qViaticoCodigoBarra: TStringField;
    DBCheckBox1: TDBCheckBox;
    qViaticoESCALAS: TStringField;
    qViaticoEscalaCODIGOODTVIATICOESCALA: TFloatField;
    qViaticoEscalaCODIGOVIATICO: TFloatField;
    qViaticoEscalaVALOR: TFloatField;
    qViaticoEscalaDIA: TFloatField;
    qViaticoEscalaLUGAR: TStringField;
    qSueldoCODIGO: TStringField;
    qSueldoSUELDO: TFloatField;
    Label17: TLabel;
    dbEdSueldo: TDBEdit;
    qViaticoDiarioVIGENCIADESDE: TDateTimeField;
    qViaticoDiarioVIGENCIAHASTA: TDateTimeField;
    qViaticoDiarioSALARIODESDE: TFloatField;
    qViaticoDiarioSALARIOHASTA: TFloatField;
    qViaticoDiarioCIUDADCAPITAL: TStringField;
    qViaticoDiarioNIVELCARGO: TFloatField;
    qViaticoDiarioSALARIOLIMITEVIATICO: TFloatField;
    qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO: TFloatField;
    qViaticoAUXILIOZONA: TStringField;
    qViaticoValorViaticoOAuxilioDiario: TFloatField;
    qOdtNOTAS: TMemoField;
    qOdtFECHAFINALESTIMADA: TDateTimeField;
    qViaticoFECHAINICIOESTIMADA: TDateTimeField;
    qViaticoFECHAFINESTIMADA: TDateTimeField;
    qViaticoVALORVIATICOESTIMADO: TFloatField;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    qViaticoTIPOVIATICO: TStringField;
    qOdtCODIGOODTLETRA: TStringField;
    qViaticocodigoodtletra: TStringField;
    qViaticoAnoFinEstimado: TDateField;
    qViaticoMesFinEstimado: TDateField;
    qViaticoDiaFinEstimado: TDateField;
    qViaticoDiasEstimados: TIntegerField;
    qViaticoDiasEstimadospagados: TFloatField;
    qViaticoDiarioEncargo: TQuery;
    qViaticoORIGEN: TStringField;
    Label5: TLabel;
    dbEdMunicipioOrigen: TDBEdit;
    qViaticoCODIGOMUNICIPIOORIGEN: TFloatField;
    qMunicipioOrigen: TQuery;
    qMunicipioOrigenCODIGOMUNICIPIO: TFloatField;
    qMunicipioOrigenNOMBREMUNICIPIO: TStringField;
    qMunicipioOrigenCODIGO_CUENTA: TFloatField;
    qMunicipioOrigenZONAESPECIAL: TStringField;
    qMunicipioOrigenNOMBREZONA: TStringField;
    qMunicipioOrigenCODIGOGEOGRAFICO: TFloatField;
    qMunicipioOrigenCODIGOZONA: TFloatField;
    dsMunicipioOrigen: TDataSource;
    qViaticoDiarioExclusion: TQuery;
    dsViaticoDiarioExclusion: TDataSource;
    lblSueldoNuevo: TLabel;
    edSueldoNuevo: TCurrencyEdit;
    qEmpleadoNivel: TIntegerField;
    procedure sbImprimirClick(Sender: TObject);
    procedure qViaticoAfterInsert(DataSet: TDataSet);
    procedure qViaticoAfterPost(DataSet: TDataSet);
    procedure qViaticoAfterOpen(DataSet: TDataSet);
    procedure qEmpleadoAfterOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbAceptarClick(Sender: TObject);
    procedure bbCancelarClick(Sender: TObject);
    procedure qViaticoCalcFields(DataSet: TDataSet);
    procedure qValorViaticoAfterInsert(DataSet: TDataSet);
    procedure qValorViaticoAfterPost(DataSet: TDataSet);
    procedure VALORIMPUTACIONSetText(Sender: TField;
      const Text: String);
    procedure qValorViaticoAfterDelete(DataSet: TDataSet);
    procedure qViaticoDiarioAfterOpen(DataSet: TDataSet);
    procedure qAuxilioViajeVALORIMPUTACIONSetText(Sender: TField;
      const Text: String);
    procedure qAuxilioViajeAfterInsert(DataSet: TDataSet);
    procedure qViaticoFECHAINICIOValidate(Sender: TField);
    procedure qViaticoFECHAFINValidate(Sender: TField);
    procedure dbchbCiudadCapitalMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure qViaticoCODIGOMUNICIPIODESTINOValidate(Sender: TField);
    procedure qViaticoCODIGOMUNICIPIODESTINOChange(Sender: TField);
    procedure qRepVehiculoVALORIMPUTACIONSetText(Sender: TField;
      const Text: String);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qViaticoEscalaAfterPost(DataSet: TDataSet);
    procedure qViaticoEscalaAfterDelete(DataSet: TDataSet);
    procedure qViaticoEscalaAfterInsert(DataSet: TDataSet);
    procedure qViaticoEscalaCODIGOZONAChange(Sender: TField);
    procedure qViaticoEscalaBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure qViaticoDIFICILACCESOValidate(Sender: TField);
    procedure sbFechaInicioClick(Sender: TObject);
    procedure sbFechaFinClick(Sender: TObject);
    procedure qViaticoFECHAINICIOChange(Sender: TField);
    procedure qViaticoFECHAFINChange(Sender: TField);
    procedure qViaticoDIASPAGADOSValidate(Sender: TField);
    procedure qEmpleadoCalcFields(DataSet: TDataSet);
    procedure sbBuscarCIGClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure qViaticoCODIGOGEOGRAFICOValidate(Sender: TField);
    procedure qViaticoCODIGOGEOGRAFICOChange(Sender: TField);
    procedure qViaticoVALORDIARIOChange(Sender: TField);
    procedure qViaticoESCALASChange(Sender: TField);
    procedure qViaticoESCALASValidate(Sender: TField);
    procedure qViaticoMODIFICADOChange(Sender: TField);
    procedure qViaticoCODIGOEMPLEADOChange(Sender: TField);
    procedure qAuxilioDirectivoAfterInsert(DataSet: TDataSet);
    procedure qCiaAfterOpen(DataSet: TDataSet);
    procedure qViaticoCODIGOMUNICIPIOORIGENChange(Sender: TField);
    procedure qViaticoCODIGOMUNICIPIOORIGENValidate(Sender: TField);
    procedure qViaticoORIGENChange(Sender: TField);
  private
    sFecha, Fecha:string;
    CodigoEmpleadoReemplazado, SueldoDelReemplazado: String;
    NivelDelReemplazado : String;
    HayValoresEnReemplazo: Boolean;
    ViaticoRegla_CC5906: Double;
    TextoLabelSueldo: String;
    function calcularValorEscalasViaticos:double;
    function GetCodigoEmpleadoReemplazado (CodigoEmpleadoReemplazante: String): String;
    function ConsultarValoresEnReemplazo(CodigoEmpleadoReemplazado : String): Boolean;
    function EstablecerValoresEnReemplazo(): Boolean;
    function ExcepcionMunicipio: boolean;
    function Regla_CC5906(CODIGOMUNICIPIODESTINO, CODIGOMUNICIPIOORIGEN: String): Double;
    function SonMunicipiosMismaZona(CODIGOMUNICIPIODESTINO, CODIGOMUNICIPIOORIGEN: String): Boolean;
  public
    { Public declarations }
    bDatosIncompletos, bCancelando, Modificado: Boolean;
    error:String;
    Editable:boolean;
    function ValidarFechaViatico(var odts:string):boolean;
    function validarFechaAuxilio(var odts:string):boolean;
    function AreaInfluencia:boolean;
    function PernoctaAreaInfluencia:boolean;
    procedure EliminarRegistrosDetalleNulo;
    function ValidarViaticoCausado:boolean;
    procedure InhabilitarCambios;
  end;

var
  FViatico: TFViatico;

implementation

uses uQrViaticosEstimados, uOdtVehiculo, ConsDll, uFormaFecha,
  uFuncionSGD, uFIMPComunes, uODTPadre;

{$R *.DFM}

procedure TFViatico.sbImprimirClick(Sender: TObject);
var
  Query:TQuery;
  escalas:string;
  dias: integer;
begin
  fodtpadre.guardartransaccion;
  Query:=TQuery.Create(self);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT CODIGOTIPOUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+Inttostr(VarCodigoUsuario);
  Query.Open;
  if (qViaticoFECHAPAGOVIATICO.AsString='')or(Query.fields[0].asstring='0')or(qViaticoIMPRESOVIATICO.AsString='') then
  begin
  //Solo deja imprimir una vez a menos que sea ADMINISTRADOR
    FQrViaticosEstimados:=TFQrViaticosEstimados.Create(Application);
    with FQrViaticosEstimados do
    begin
      qrViatico.DataSet:=qViatico;
      qrdbDependencia.DataSet:=qCia;
      qrdbDependencia.DataField:='NOMBRECATEGORIA';
      qrdbCIA.DataSet:=qCia;
      qrdbCIA.DataField:='CODIGOADMINISTRATIVO';
      qrdbNombreEmpleado.DataSet:=qEmpleado;
      qrdbNombreEmpleado.DataField:='NOMBREEMPLEADO';
      qrdbSalario.DataSet:=qSueldo;
      qrdbSalario.DataField:='SUELDO';
      //qrdbComision.DataSet:=qViatico;
      //qrdbComision.DataField:='CODIGOCOMISION';
      qrdbCedula.DataSet:=qViatico;
      qrdbCedula.DataField:='CODIGOEMPLEADO';
      qrdbViaticoDiario.DataSet:=qViatico;
      qrdbViaticoDiario.DataField:='VALORDIARIO';
      qrdbMotivoViaje.DataSet:=qOdt;
      qrdbMotivoViaje.DataField:='MOTIVOS';

      qrdbCodigoODT.DataSet:=qviatico;
      qrdbCodigoODT.DataField:='CODIGOODT';

      qrdbCodigoODTLetra.DataSet:=qViatico;
      qrdbCodigoODTLetra.DataField:='CODIGOODTLETRA';

      qrdbMunicipioDestino.DataSet:=qViatico;
      qrdbMunicipioDestino.DataField:='DESTINO';

      QRDBMunicipioOrigen1.DataSet:=qViatico;
      QRDBMunicipioOrigen1.DataField:='ORIGEN';

      {qrdbMunicipioOrigen.DataSet:=qZonaOrigen;
      qrdbMunicipioOrigen.DataField:='NOMBREZONA'; }


      qrdbZonaOrigen1.DataSet:=qZonaOrigen;
      qrdbZonaOrigen1.DataField:='NOMBREZONA';

      qrdbZonaOrigen2.DataSet:=qZonaOrigen;
      qrdbZonaOrigen2.DataField:='NOMBREZONA';
     { qrdbDias.DataSet:=qViatico;
      qrdbDias.DataField:='Dias';
                                      }
      qAreaInfluencia.close;
      qAreaInfluencia.DataSource:=dsOdt;
      qAreaInfluencia.open;

      qrdbAnoInicio.DataSet:=qViatico;
      qrdbAnoInicio.DataField:='ANOINICIO';
      qrdbMesInicio.DataSet:=qViatico;
      qrdbMesInicio.DataField:='MESINICIO';
      qrdbDiaInicio.DataSet:=qViatico;
      qrdbDiaInicio.DataField:='DIAINICIO';
      qrdbAnoFin.DataSet:=qViatico;
      qrdbAnoFin.DataField:='ANOFINESTIMADO';
      qrdbMesFin.DataSet:=qViatico;
      qrdbMesFin.DataField:='MESFINESTIMADO';
      qrdbDiaFin.DataSet:=qViatico;
      qrdbDiaFin.DataField:='DIAFINESTIMADO';
      qrdbMunicipioDestino2.DataSet:=qViatico;
      qrdbMunicipioDestino2.DataField:='DESTINO';
      qrdbMunicipioDestino3.DataSet:=qViatico;
      qrdbMunicipioDestino3.DataField:='DESTINO';
      qrdbDiasPagados.DataSet:=qViatico;
      qrdbDiasPagados.DataField:='DiasEstimadospagados';
      qrdbDias.DataSet:=qViatico;
      qrdbDias.DataField:='DiasEstimadospagados';
      qrdbValorUnitario.DataSet:=qViatico;
      qrdbValorUnitario.DataField:='VALORDIARIO';
      qrdbValorTotal.DataSet:=qViatico;
      qrdbValorTotal.DataField:='VALORVIATICOESTIMADO';
   //   qrlTotalComision.Caption:='$'+ FormatFloat('###,###,###',CETotalComision.Value);
   //   qrlSaldoGirar.Caption:='$'+FormatFloat('###,###,###',CESaldo.Value);
     { if CESaldo.Value<0 then qrlSaldo.Caption:='SALDO A REINTEGRAR';   }
     { qrlZonaOrigen.Caption:='Fuera de la Zona  '+ qZonaOrigenNOMBREZONA.AsString; }

      qrViatico.Preview;
    end;
  end
  else
    Application.MessageBox(pchar('Este viático ya fue pagado.'),pchar('Información'),MB_OK);
  Query.Close;
  Query.Free;
end;

procedure TFViatico.qViaticoAfterInsert(DataSet: TDataSet);
var Query:TQuery;
begin
  Query:=TQuery.Create(self);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT SQ_ODTVIATICO.NEXTVAL FROM DUAL';
  Query.Open;
  DataSet.FieldByName('CODIGOVIATICO').AsInteger:=Query.Fields[0].AsInteger;
  DataSet.FieldByName('CODIGOEMPLEADO').AsFloat:=qViatico.ParamByName('CODIGOEMPLEADO').AsFloat;
  DataSet.FieldByName('CODIGOODT').AsFloat:=qViatico.ParamByName('CODIGOODT').AsFloat;
  Query.Close;
  Query.SQL.Text:='SELECT MAX(CODIGOCOMISION) FROM ODTVIATICO';
  Query.Open;
  DataSet.FieldByName('CODIGOCOMISION').AsInteger:=Query.Fields[0].AsInteger+1;

  Query.Free;
  DataSet.FieldByName('CIUDADCAPITAL').AsString:='N';
  DataSet.FieldByName('DIFICILACCESO').AsString:='N';
  DataSet.FieldByName('ESCALAS').AsString:='N';
end;

procedure TFViatico.qViaticoAfterPost(DataSet: TDataSet);
begin
  qViatico.ApplyUpdates;
  qViatico.CommitUpdates;
end;

procedure TFViatico.qViaticoAfterOpen(DataSet: TDataSet);
begin
  if qViatico.RecordCount>0 then
  begin
    qOdt.Close;
    qOdt.Open;
    qEmpleado.Close;
    qEmpleado.Open;
    qZonaOrigen.Close;
    qZonaOrigen.Open;
    qViaticoDiario.Close;
    //SHOWMESSAGE('qViaticoAfterOpen - 0');
    // SI EL EMPLEADO ESTA HACIENDO UN REEMPLAZO CONSULTO Y ESTABLEZCO LOS VIATICOS A LOS QUE APLICA EL EMPLEADO REEMPLAZADO
    CodigoEmpleadoReemplazado:= GetCodigoEmpleadoReemplazado(qViatico.ParamByName('CODIGOEMPLEADO').AsString);
    if CodigoEmpleadoReemplazado <> '' then
      HayValoresEnReemplazo := ConsultarValoresEnReemplazo(CodigoEmpleadoReemplazado);
    if (CodigoEmpleadoReemplazado <> '') and (HayValoresEnReemplazo) then
    begin
      //SHOWMESSAGE('qViaticoAfterOpen - 1');
      if not ExcepcionMunicipio then
      begin
        //SHOWMESSAGE('qViaticoAfterOpen - 2');
        qViaticoDiario.DataSource:= nil;
        qViaticoDiario.ParamByName('CODIGOMUNICIPIODESTINO').AsString:= qViaticoCODIGOMUNICIPIODESTINO.AsString;
        qViaticoDiario.ParamByName('CODIGOZONAORIGEN').AsString:= qViaticoCODIGOZONAORIGEN.AsString;
        qViaticoDiario.ParamByName('CODIGOZONA').AsString:= qViaticoCODIGOZONA.AsString;
        qViaticoDiario.ParamByName('FECHAINICIO').AsDateTime:= qViaticoFECHAINICIO.AsDateTime;
        qViaticoDiario.ParamByName('CIUDADCAPITAL').AsString:= qViaticoCIUDADCAPITAL.AsString;
        qViaticoDiario.ParamByName('SUELDO').AsFloat:= StrToFloat(SueldoDelReemplazado);
        qViaticoDiario.ParamByName('NIVEL').AsString:= NivelDelReemplazado;
      end
      else
      begin
        //SHOWMESSAGE('qViaticoAfterOpen - 3');
        qViaticoDiario.DataSource:= nil;
        qViaticoDiario.SQL.Clear;
        qViaticoDiario.SQL.Text:= qViaticoDiarioExclusion.SQL.Text;
        qViaticoDiario.ParamByName('CODIGOMUNICIPIODESTINO').AsString:= qViaticoCODIGOMUNICIPIODESTINO.AsString;
        qViaticoDiario.ParamByName('CODIGOMUNICIPIOORIGEN').AsString:= qViaticoCODIGOMUNICIPIOORIGEN.AsString;
        qViaticoDiario.ParamByName('FECHAINICIO').AsDateTime:= qViaticoFECHAINICIO.AsDateTime;
        qViaticoDiario.ParamByName('CIUDADCAPITAL').AsString:= qViaticoCIUDADCAPITAL.AsString;
        qViaticoDiario.ParamByName('SUELDO').AsFloat:= StrToFloat(SueldoDelReemplazado);
        qViaticoDiario.ParamByName('NIVEL').AsString:= NivelDelReemplazado;
      end;
    end
    else
    begin
      if ExcepcionMunicipio then
      begin
        //SHOWMESSAGE('Hay excepcion municipio 1');
        qViaticoDiario.DataSource:= nil;
        qViaticoDiario.SQL.Clear;
        qViaticoDiario.SQL.Text:= qViaticoDiarioExclusion.SQL.Text;
        qViaticoDiario.DataSource:= dsViatico;
        //SHOWMESSAGE('Hay excepcion municipio 2');
      end;
    end;
    //***********************************************************************************************************
    qViaticoDiario.Open;
    qViaticoEscala.close;
    qViaticoEscala.open;
    qValorViatico.Close;
    qValorViatico.Open;
    If qValorViatico.RecordCount > 0
    then qValorViatico.Edit
    else qValorViatico.Insert;
  end;
end;

procedure TFViatico.qEmpleadoAfterOpen(DataSet: TDataSet);
begin
  qCia.Close;
  qCia.Open;
  qSueldo.Close;
  try
    qSueldo.sql.clear;
    qSueldo.SQL.add('SELECT CODIGO,SUELDO_MES AS SUELDO');
    qSueldo.SQL.add('FROM SIP_EMPLEADO');
    qSueldo.SQL.add('WHERE CODIGO=:CODIGOEMPLEADO');
    qSueldo.Open;
  except
    qSueldo.close;
    qSueldo.sql.Clear;
    qSueldo.SQL.add('SELECT TO_CHAR(E.CODIGOEMPLEADO) AS CODIGO,S.SUELDO');
    qSueldo.SQL.add('FROM EMPLEADO E,SUELDO S');
    qSueldo.SQL.add('WHERE E.CODIGOSUELDO=S.CODIGOSUELDO');
    qSueldo.SQL.add('AND E.CODIGOEMPLEADO=:CODIGOEMPLEADO');
    qSueldo.Open;
  end;
  qCargo.Close;
  qCargo.Open;
end;

procedure TFViatico.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  Begin
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
end;

procedure TFViatico.bbAceptarClick(Sender: TObject);
var
  odts:string;
  NoPagaViatico: Boolean;
begin
  bDatosIncompletos := False;
  try
    if qViatico.State in [dsEdit,dsInsert] then
    begin
      if (qViaticoFECHAINICIO.AsString='') or (qViaticoFECHAFIN.AsString='')then
        Raise Exception.Create('Debe ingresar las fechas de Inicio y Fin del viático.');
      if (qViaticoDESTINO.AsString= '') then
        Raise Exception.Create('Debe ingresar el Destino del viático.');
      if (qViaticoORIGEN.AsString= '') then
        Raise Exception.Create('Debe ingresar el Origen del viático.');

      qViaticoVALORVIATICOESTIMADO.AsFloat:=qViaticoValorViatico.AsFloat;
      qViaticoFECHAINICIOESTIMADA.AsDateTime:=qViaticoFECHAINICIO.AsDateTime;
      qViaticoFECHAFINESTIMADA.AsDateTime:=qViaticoFECHAFIN.AsDateTime;
      
      if qViaticoDESTINO.AsString='' then
      begin
        if qViaticoCODIGOMUNICIPIODESTINO.AsString<>'' then
        begin
          qMunicipioDestino.Close;
          qMunicipioDestino.Open;
          qViaticoDESTINO.AsString:=qMunicipioDestinoNOMBREMUNICIPIO.AsString;
        end
        else
        begin
          Raise Exception.Create('DEBE INGRESAR EL LUGAR DE DESTINO');
        end;
      end;

      if qViaticoORIGEN.AsString='' then
      begin
        if qViaticoCODIGOMUNICIPIOORIGEN.AsString<>'' then
        begin
          qMunicipioOrigen.Close;
          qMunicipioOrigen.Open;
          qViaticoORIGEN.AsString:=qMunicipioOrigenNOMBREMUNICIPIO.AsString;
        end
        else
        begin
          Raise Exception.Create('DEBE INGRESAR EL LUGAR DE ORIGEN');
        end;
      end;

    end;
    if not (ValidarFechaViatico(odts)) then
    begin
      if (Application.MessageBox(pchar('Ya existen viáticos para el empleado en esas fechas,'+char(13)
      +'ODT: '+odts+'. Desea Corregir el viático?'),pchar('Energis'),MB_YESNO+MB_ICONQUESTION)=IDyes) then
      begin
        ModalResult:=0;
        Exit;
      end
      else
      begin
        ModalResult:=mrCancel;
        Close;
        Exit;
      end;
    end;

    if not (validarFechaAuxilio(odts)) then
    begin
      if (Application.MessageBox(pchar('Ya existen auxilios para el empleado en esas fechas,'+char(13)
      +'ODT: '+odts+'. Desea Corregir el viático?'),pchar('Energis'),MB_YESNO+MB_ICONQUESTION)=IDyes) then
      begin
        ModalResult:=0;
        Exit;
      end
      else
      begin
        ModalResult:=mrCancel;
        Close;
        Exit;
      end;
    end;
   { if not (ValidarViaticoCausado)then
    begin
      if (Application.MessageBox(pchar('No se permite liquidar viáticos que no han sido causados.'+char(13)
          +'Desea Corregir el auxilio'),pchar('Error'),MB_YESNO)=IDyes) then
      begin
       ModalResult:=0;
       Exit;
      end
      else
      begin
       ModalResult:=mrCancel;
       Close;
       Exit;
      end;
    end;  }
    if AreaInfluencia then
    begin
      NoPagaViatico:= False;
      if (qViaticoDIFICILACCESO.AsString<>'S') then
      begin
        if (qViaticoCODIGOMUNICIPIOORIGEN.AsString <> qViaticoCODIGOMUNICIPIODESTINO.AsString) then
        begin
          if ((qMunicipioOrigenZONAESPECIAL.AsString='N') and (qMunicipioDestinoZONAESPECIAL.AsString='P') and (not(PernoctaAreaInfluencia)))
             or
             ((qMunicipioOrigenZONAESPECIAL.AsString='P') and (qMunicipioDestinoZONAESPECIAL.AsString='P') and (not(PernoctaAreaInfluencia))) then
          NoPagaViatico := True;
        end
        else
        begin
          if ((qMunicipioOrigenZONAESPECIAL.AsString='N') and (qMunicipioDestinoZONAESPECIAL.AsString='N') and (not(PernoctaAreaInfluencia)))
             or
             ((qMunicipioOrigenZONAESPECIAL.AsString='P') and (qMunicipioDestinoZONAESPECIAL.AsString='P') and (not(PernoctaAreaInfluencia))) then
          NoPagaViatico := True;
        end;

        if NoPagaViatico then
        begin
          Application.MessageBox(pchar('Este viático no puede ser guardado puesto que no pernocta en el área de influencia.'),pchar('Información'),MB_OK+MB_ICONERROR);
          ModalResult:=0;
          Exit;
        end;
      end;
    end;

    if qViatico.State in [dsEdit,dsInsert] then
     qViatico.Post;
    if qViatico.UpdatesPending then
      qViatico.ApplyUpdates;
    EliminarRegistrosDetalleNulo;
    Close;
    ModalResult:=MrOk;
  except
    on e:exception do
    begin
      error:=e.Message;
      bDatosIncompletos := True;
      qViatico.Edit;
      ModalResult:=MrCancel;
      Close;
    end;
  end;
end;

procedure TFViatico.bbCancelarClick(Sender: TObject);
begin
  if MessageDlg('Perderá los cambios realizados. Esta seguro de Cancelar?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    try
      if qViatico.CachedUpdates then
      begin
        qValorViatico.Cancel;
        if qValorViatico.UpdatesPending then
          qValorViatico.CancelUpdates;

        qViatico.Cancel;
        if qViatico.UpdatesPending then
          qViatico.CancelUpdates;
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
  end;
end;

procedure TFViatico.qValorViaticoAfterPost(DataSet: TDataSet);
begin
  qValorViatico.ApplyUpdates;
  qValorViatico.CommitUpdates;
  qValorViatico.Edit;
end;

procedure TFViatico.qViaticoCalcFields(DataSet: TDataSet);
var
   dias, diasdif: integer;
begin
  if qViaticoCodigoZonaDestino.AsString <> '' then
    qViaticoCODIGOZONA.AsString := qViaticoCodigoZonaDestino.AsString
  else
  begin
    if (qViaticoCODIGOMUNICIPIODESTINO.AsString = '') then
      qViaticoCODIGOZONA.AsString:='8';
  end;

  qViaticoDias.AsInteger:=trunc(qViaticoFECHAFIN.AsDateTime) - trunc(qViaticoFECHAINICIO.AsDateTime)+1;

  qViaticoDiasEstimados.AsInteger:= trunc(qViaticoFECHAFINESTIMADA.AsDateTime) - trunc(qViaticoFECHAINICIO.AsDateTime)+1;

  if qViaticoEscala.Active then
  begin
    if qViaticoEscala.RecordCount>0 then
      qViaticoValorViatico.AsFloat:=calcularValorEscalasViaticos
    else
      qViaticoValorViatico.AsFloat:= round(qViaticoDiasPagados.AsFloat *qViaticoVALORDIARIO.asfloat);
  end
  else
    qViaticoValorViatico.AsFloat:= round(qViaticoDiasPagados.AsFloat *qViaticoVALORDIARIO.asfloat);

  if (qViaticoFECHAFIN.AsDateTime)=trunc(qViaticoFECHAFIN.AsDateTime) then
    qViaticoDias.AsInteger:= qViaticoDias.AsInteger-1;

  if (qValorViatico.Active) and (qValorViatico.CachedUpdates) then
  begin
    qValorViatico.Edit;
    qValorViaticoVALORIMPUTACION.AsFloat:= qViaticoValorViatico.AsFloat;
    qValorViatico.Post;
  end;

  qViaticoAnoInicio.AsDateTime:=qViaticoFECHAINICIO.AsDateTime;
  qViaticoMesInicio.AsDateTime:=qViaticoFECHAINICIO.AsDateTime;
  qViaticoDiaInicio.AsDateTime:=qViaticoFECHAINICIO.AsDateTime;
  qViaticoAnoFin.AsDateTime:=qViaticoFECHAFIN.AsDateTime;
  qViaticoMesFin.AsDateTime:=qViaticoFECHAFIN.AsDateTime;
  qViaticoDiaFin.AsDateTime:=qViaticoFECHAFIN.AsDateTime;

  qViaticoAnoFinEstimado.AsDateTime:=qViaticoFECHAFINESTIMADA.AsDateTime;
  qViaticoMesFinEstimado.AsDateTime:=qViaticoFECHAFINESTIMADA.AsDateTime;
  qViaticoDiaFinEstimado.AsDateTime:=qViaticoFECHAFINESTIMADA.AsDateTime;

  qViaticoCodigoBarra.AsString:='*'+qViaticoNUMEROIMPRESION.AsString+'*';
  qViaticocodigoodtletra.asstring := qViaticocodigoodt.asstring + '-A';

  dias:=trunc(qViaticoFECHAFIN.AsDateTime) - trunc(qViaticoFECHAINICIO.AsDateTime)+1;

  if trunc(qViaticoFECHAFINESTIMADA.AsDateTime) -   trunc(qViaticoFECHAFIN.AsDateTime) > 0 then
    diasdif := (trunc(qViaticoFECHAFINESTIMADA.AsDateTime) -   trunc(qViaticoFECHAFIN.AsDateTime)) * +1;
  if trunc(qViaticoFECHAFINESTIMADA.AsDateTime) -   trunc(qViaticoFECHAFIN.AsDateTime) < 0 then
    diasdif := (trunc(qViaticoFECHAFINESTIMADA.AsDateTime) -   trunc(qViaticoFECHAFIN.AsDateTime)) * -1;

  if trunc(qViaticoFECHAFINESTIMADA.AsDateTime) -   trunc(qViaticoFECHAFIN.AsDateTime) = 0 then
    diasdif := 0;

  if ((qViaticoNivel.AsInteger>0) or (qViaticoSueldo.AsFloat>qViaticoDiarioSALARIOLIMITEVIATICO.AsFloat))
  and (qViaticoCodigoZona.AsString<>'8')
  and ((qViaticoDiarioSALARIOLIMITEVIATICO.asinteger>0)and(qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.asinteger>0))
  then
  begin
    qViaticoDiasEstimadosPagados.AsFloat:= dias;
  end
  else
  begin
     if qViaticoVALORDIARIO.AsFloat > 0 then
       qViaticoDiasEstimadosPagados.AsFloat:= StrToFloat(FormatFloat('0.00',qViaticoVALORVIATICOESTIMADO.AsFloat/qViaticoVALORDIARIO.AsFloat));
  end;

end;

procedure TFViatico.qValorViaticoAfterInsert(DataSet: TDataSet);
var Query:TQuery;
begin
  DataSet.FieldByName('CODIGOVIATICO').AsString:=qViaticoCODIGOVIATICO.AsString;
  Query:=TQuery.Create(Application);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT SQ_ODTVIATICODETALLE.NEXTVAL FROM DUAL';
  Query.Open;
  DataSet.FieldByName('CODIGOVIATICODETALLE').AsInteger:=Query.Fields[0].AsInteger;
  Query.Close;
  Query.sql.Clear;
  Query.sql.Add('SELECT CODIGOIMPUTACIONMANOOBRA');
  Query.sql.Add('FROM IMPUTACIONMANOOBRA IMO, ODTVIATICO V, ODT O');
  Query.sql.Add('WHERE O.CODIGOODT=V.CODIGOODT');
  Query.sql.Add('AND IMO.VIGENCIADESDE<=V.FECHAINICIO');
  Query.sql.Add('AND (IMO.VIGENCIAHASTA>=V.FECHAFIN OR IMO.VIGENCIAHASTA IS NULL)');
  Query.sql.Add('AND V.CODIGOVIATICO='+qViaticoCODIGOVIATICO.AsString);
  Query.sql.Add('AND IMO.CODIGOTIPOIMPUTACIONODT=''V''');
  Query.sql.Add('AND IMO.TIPOCECOS='''+qEmpleadoTipoCecos.AsString+'''');
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''VIA''');
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFViatico.VALORIMPUTACIONSetText(Sender: TField;
  const Text: string);
var temp:Double;
    Texto:string;
begin
  try
    Texto:=Text;
    while Pos(',', Texto) > 0 do
      delete(Texto,Pos(',', Texto),1) ;
    temp:=StrToFloat(Texto);
    Texto:=FloatToStr(temp);
    Sender.AsString:=Texto;
  except
  end;
end;

procedure TFViatico.qValorViaticoAfterDelete(DataSet: TDataSet);
begin
  qValorViatico.ApplyUpdates;
  qValorViatico.CommitUpdates;
  qValorViatico.Edit;
end;

procedure TFViatico.qViaticoDiarioAfterOpen(DataSet: TDataSet);
begin
  //SHOWMESSAGE('qViaticoDiarioAfterOpen 00');
  if (qViatico.RecordCount>0) and ((qViaticoDiario.RecordCount=0) and (not HayValoresEnReemplazo) and (ViaticoRegla_CC5906 = 0)) then
  begin
    //SHOWMESSAGE('qViaticoDiarioAfterOpen 01');
    if qViatico.State in [dsEdit,dsInsert] then
    begin
      ShowMessage('No existen viáticos definidos para '+ qZonaOrigenNOMBREZONA.AsString+' - '+ 'a ese destino' );
      bbAceptar.Enabled:=False;
     // sbImprimir.Enabled:=False;
    end;
  end
  else
  begin
    //SHOWMESSAGE('qViaticoDiarioAfterOpen 02');
    if qViatico.State in [dsEdit,dsInsert] then
    begin
      //SHOWMESSAGE('qViaticoDiarioAfterOpen 0 - qViaticoVALORDIARIO.AsFloat: '+qViaticoVALORDIARIO.AsString);
      if HayValoresEnReemplazo then EstablecerValoresEnReemplazo();
      //SHOWMESSAGE('qViaticoDiarioAfterOpen 0_1 - qViaticoVALORDIARIO.AsFloat: '+qViaticoVALORDIARIO.AsString);

      if ((qViaticoNivel.AsInteger>0) or (qViaticoSueldo.AsFloat>qViaticoDiarioSALARIOLIMITEVIATICO.AsFloat))
      and (qViaticoCodigoZona.AsString<>'8')
      and ((qViaticoDiarioSALARIOLIMITEVIATICO.AsInteger>0)and(qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.AsInteger>0))
      then
      begin
        //SHOWMESSAGE('qViaticoDiarioAfterOpen 1 - qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.AsString: '+qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.AsString);
        qViaticoVALORDIARIO.AsFloat:=qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.AsInteger;
        //SHOWMESSAGE('qViaticoDiarioAfterOpen 1 - qViaticoVALORDIARIO.AsFloat: '+qViaticoVALORDIARIO.AsString);
        qViaticoAUXILIOZONA.AsString:='S';
      end
      else
      begin
        //SHOWMESSAGE('qViaticoDiarioAfterOpen 2 ');
        if (not HayValoresEnReemplazo) then
        begin
          //SHOWMESSAGE('qViaticoDiarioAfterOpen 2 - qViaticoVALORDIARIO.AsFloat: '+qViaticoVALORDIARIO.AsString);
          qViaticoVALORDIARIO.AsFloat:=qViaticoDiarioVALORVIATICO.AsFloat;
        end;
        qViaticoAUXILIOZONA.AsString:='N';
      end;
    end;
  end;
end;

procedure TFViatico.qAuxilioViajeVALORIMPUTACIONSetText(Sender: TField;
  const Text: String);
var temp:Double;
    Texto:string;
begin
  try
    Texto:=Text;
    while Pos(',', Texto) > 0 do
      delete(Texto,Pos(',', Texto),1) ;
    temp:=StrToFloat(Texto);
    Texto:=FloatToStr(temp);
    Sender.AsString:=Texto;
  except
  end;
end;

procedure TFViatico.qAuxilioViajeAfterInsert(DataSet: TDataSet);
var Query:TQuery;
begin
  DataSet.FieldByName('CODIGOVIATICO').AsString:=qViaticoCODIGOVIATICO.AsString;
  Query:=TQuery.Create(Application);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT SQ_ODTVIATICODETALLE.NEXTVAL FROM DUAL';
  Query.Open;
  DataSet.FieldByName('CODIGOVIATICODETALLE').AsInteger:=Query.Fields[0].AsInteger;
  Query.Close;
  Query.sql.Clear;
  Query.sql.Add('SELECT CODIGOIMPUTACIONMANOOBRA');
  Query.sql.Add('FROM IMPUTACIONMANOOBRA IMO, ODTVIATICO V, ODT O');
  Query.sql.Add('WHERE O.CODIGOODT=V.CODIGOODT');
  Query.sql.Add('AND IMO.VIGENCIADESDE<=V.FECHAINICIO');
  Query.sql.Add('AND (IMO.VIGENCIAHASTA>=V.FECHAFIN OR IMO.VIGENCIAHASTA IS NULL)');
  Query.sql.Add('AND V.CODIGOVIATICO='+qViaticoCODIGOVIATICO.AsString);
  Query.sql.Add('AND IMO.TIPOCECOS='''+qEmpleadoTipoCecos.AsString+'''');
  Query.sql.Add('AND IMO.CODIGOTIPOIMPUTACIONODT=''V''');
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''AUX''');
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFViatico.qViaticoFECHAINICIOValidate(Sender: TField);
begin
  if qViatico.State=dsEdit then
  begin
    if sender.Text<>'' then
    begin
      if (sender.AsDateTime>qViaticoFECHAFIN.AsDateTime)  then
        raise Exception.Create('La fecha de inicio del viático no puede ser mayor que la fecha final del viático');
      if (sender.AsDateTime<qOdtFECHAINICIO.AsDateTime)  then
        raise Exception.Create('La fecha de inicio del viático no puede ser inferior a la de la odt');
    end;
  end;
end;


procedure TFViatico.qViaticoFECHAFINValidate(Sender: TField);
begin
  if qViatico.State=dsEdit then
  begin
    if  (Sender.Text <>'' ) then
    begin
      if  (sender.AsDateTime<qViaticoFECHAINICIO.AsDateTime)  then
        raise Exception.Create('La fecha final del viático no puede ser inferior a la fecha inicial del viático');
      if  (sender.AsDateTime>qOdtFECHAFINALESTIMADA.AsDateTime)  then
        raise Exception.Create('La fecha final del viático no puede ser superior a la fecha final estimada para la odt');
    end;
  end;
end;

procedure TFViatico.dbchbCiudadCapitalMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Perform(wm_NextDLGCTL, 0, 0);
end;

procedure TFViatico.FormShow(Sender: TObject);
var
  query:Tquery;
  HoraFin, MinFin, SecFin, MSecFin: Word;
  HoraInicio, MinInicio, SecInicio, MSecInicio: Word;
  HoraInfJornada1, HoraSupJornada1, HoraInfJornada2, HoraSupJornada2: TTime;
begin
  ViaticoRegla_CC5906:= Regla_CC5906(qViaticoCODIGOMUNICIPIODESTINO.AsString, qViaticoCODIGOMUNICIPIOORIGEN.AsString);
  qViaticoDIFICILACCESOvalidate(qViaticoDIFICILACCESO);

  if qViatico.state in [dsEdit,dsInsert] then qViaticoCalcFields(qViatico);

  query:=TQuery.Create(self);
  query.DatabaseName:='BaseDato';
  query.sql.text:='select codigoestadoodt from odt where codigoodt='+qViaticoCODIGOODT.AsString;
  query.open;
  sbImprimir.Enabled:=false;
  if query.fieldbyname('codigoestadoodt').AsString>='6' then
    InhabilitarCambios
  else
  begin
    query.sql.clear;
    query.sql.add('select impresoviatico from odtviatico where codigoviatico='+qViaticoCODIGOVIATICO.AsString);
    query.open;

    if (query.fieldbyname('impresoviatico').AsString='S')then
      InhabilitarCambios
    else
      sbImprimir.Enabled:=True;
  end;

  if qViaticoESTADO.AsString='PRO' then
  begin
    Caption:=Caption+'  *** Solo Lectura(Procesado Por Nómina) ***';
    PanelEncabezado.Enabled:=false;
    InhabilitarCambios;
  end;
  query.free;
  if qViatico.State in [dsEdit,dsInsert] then
  begin
    if HayValoresEnReemplazo then EstablecerValoresEnReemplazo();
    {
    SHOWMESSAGE('fs qViaticoDiarioCODIGOVIATICOZONA.AsString: '+qViaticoDiarioCODIGOVIATICOZONA.AsString);
    SHOWMESSAGE('fs qViaticoNivel.AsInteger: '+qViaticoNivel.AsString);
    SHOWMESSAGE('fs qViaticoCODIGOZONA.AsString: '+qViaticoCODIGOZONA.AsString);
    SHOWMESSAGE('fs qViaticoSueldo.AsFloat: '+qViaticoSueldo.AsString);
    SHOWMESSAGE('fs qViaticoDiarioSALARIOLIMITEVIATICO.AsFloat: '+qViaticoDiarioSALARIOLIMITEVIATICO.AsString);
    if (qViaticoSueldo.AsFloat>qViaticoDiarioSALARIOLIMITEVIATICO.AsFloat) then
    SHOWMESSAGE('fs el SUELDO es mayor que SALARIOLIMITEVIATICO');
    SHOWMESSAGE('fs qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.AsInteger: '+qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.AsString);
    SHOWMESSAGE('fs qViaticoVALORDIARIO.AsFloat: '+qViaticoVALORDIARIO.AsString);
    SHOWMESSAGE('FS qViaticoCODIGOMUNICIPIODESTINO.AsString: '+qViaticoCODIGOMUNICIPIODESTINO.AsString);
    }
    if ((qViaticoNivel.AsInteger > 0) or (qViaticoSueldo.AsFloat > qViaticoDiarioSALARIOLIMITEVIATICO.AsFloat))
    and (qViaticoCODIGOZONA.AsString <> '8')
    and ((qViaticoDiarioSALARIOLIMITEVIATICO.AsInteger>0) and (qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.AsInteger>0))
    then
    // VALIDACION ANTIGUA
    begin
      //SHOWMESSAGE('fs VALIDACION ANTIGUA');
      qViaticoVALORDIARIO.AsFloat:=qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.AsInteger;
      qViaticoAUXILIOZONA.AsString:='S';
      qViaticoDiasPagados.AsFloat:=qViaticoDias.AsFloat;
    end
    else if (((qViaticoNivel.AsInteger > 0) {or (qViaticoSueldo.AsFloat>qViaticoDiarioSALARIOLIMITEVIATICO.AsFloat)})
    and (qViaticoCODIGOZONA.AsString = '8'))
    //and ((qViaticoDiarioSALARIOLIMITEVIATICO.AsInteger>0) and (qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.AsInteger>0))
    then
    // (ES DIRECTIVO O SOBRERREMUNERADO) Y FUERA DEL AREA DE INFLUENCIA DE LA ESSA
    begin
      //SHOWMESSAGE('fs DIRECTIVO = 8');
      if (Trunc(qViaticoFECHAINICIO.AsDateTime) = Trunc(qViaticoFECHAFIN.AsDateTime)) then
      //COMISIONES QUE INICIAN Y TERMINA EL MISMO DIA.
      begin
        HoraInfJornada1:= EncodeTime(0,0,0,000);
        HoraSupJornada1:= EncodeTime(11,59,59,999);
        HoraInfJornada2:= EncodeTime(12,0,0,000);
        HoraSupJornada2:= EncodeTime(23,59,59,999);
        if (Frac(qViaticoFECHAINICIO.AsDateTime) >= HoraInfJornada1) and (Frac(qViaticoFECHAFIN.AsDateTime) <= HoraSupJornada1) then
        // SI LAS HORAS INICIO Y FIN ESTA EN LA MAÑANA NO SE PAGAN VIATICOS.
         qViaticoDiasPagados.AsFloat:=0
        else if (Frac(qViaticoFECHAINICIO.AsDateTime) >= HoraInfJornada2) and (Frac(qViaticoFECHAFIN.AsDateTime) <= HoraSupJornada2) then
        // SI LAS HORAS INICIO Y FIN ESTA EN LA TARDE NO SE PAGAN VIATICOS.
         qViaticoDiasPagados.AsFloat:=0
        else if ((Frac(qViaticoFECHAINICIO.AsDateTime) >= HoraInfJornada1) and (Frac(qViaticoFECHAINICIO.AsDateTime) <= HoraSupJornada1))
             and ((Frac(qViaticoFECHAFIN.AsDateTime) >= HoraInfJornada2) and (Frac(qViaticoFECHAFIN.AsDateTime) <= HoraSupJornada2))
        then
        // SI LA HORA DE INICIO ESTA EN LA MAÑANA Y LA HORA DE FIN ESTA EN LA TARDE SE PAGA EL PORCENTAJE RESPECTIVO.
         qViaticoDiasPagados.AsFloat:=qViaticoDias.AsFloat + (qViaticoDiarioPORCENTAJEULTIMODIA.AsFloat/100) - 1;
      end
      else
      begin
        DecodeTime(qViaticoFECHAFIN.AsDateTime, HoraFin, MinFin, SecFin, MSecFin);
        if (HoraFin < 12) then //SI LA HORA FINAL DEL VIATICO ES ANTES DE LAS 12 DEL MEDIO DIA NO SE PAGA EL ULTIMO DIA
          qViaticoDiasPagados.AsFloat:= qViaticoDias.AsFloat  - 1
        else //SI LA HORA FINAL DEL VIATICO ES DESPUES DE LAS 12 DEL MEDIO DIA SE PAGA EL PORCENTAJE RESPECTIVO
          qViaticoDiasPagados.AsFloat:=qViaticoDias.Asfloat + (qViaticoDiarioPORCENTAJEULTIMODIA.AsFloat/100) - 1;
      end;
    end
    else  //PARA EL RESTO DE LOS CASOS SE APLICA EL PORCENTAJE RESPECTIVO
    begin
      //SHOWMESSAGE('fs RESTO DE CASOS');
      if (ViaticoRegla_CC5906 > 0) and
         (not SonMunicipiosMismaZona(qViaticoCODIGOMUNICIPIODESTINO.AsString, qViaticoCODIGOMUNICIPIOORIGEN.AsString))
      then
      begin
        //SHOWMESSAGE('fs IF ViaticoRegla_CC5906');
        qViaticoVALORDIARIO.AsFloat:=ViaticoRegla_CC5906;
      end;
      qViaticoDiasPagados.AsFloat:=qViaticoDias.AsFloat + (qViaticoDiarioPORCENTAJEULTIMODIA.AsFloat/100) - 1;
    end;

  end;
end;

procedure TFViatico.qViaticoCODIGOMUNICIPIODESTINOValidate(Sender: TField);
begin
// Modificado solicitud
 if sender.AsString<>'' then
  begin
    dbEdMunicipioDestino.ReadOnly:=true;
//    if qViatico.State in [dsEdit,dsInsert] then qViaticoCIUDADCAPITAL.AsString:='';
//    dbchbCiudadCapital.ReadOnly:=true;
  end
  else
  begin
    dbEdMunicipioDestino.ReadOnly:=false;
//    dbchbCiudadCapital.ReadOnly:=false;
  end;
end;

procedure TFViatico.qViaticoCODIGOMUNICIPIODESTINOChange(Sender: TField);
begin
  qMunicipioDestino.Close;
  qMunicipioDestino.Open;
  if qViatico.State in [dsEdit,dsInsert] then
  begin
    qViaticoDESTINO.AsString:=qMunicipioDestinoNOMBREMUNICIPIO.AsString;
    qViaticoCODIGOGEOGRAFICO.AsString:=qMunicipioDestinoCODIGOGEOGRAFICO.AsString;
  end;
end;

procedure TFViatico.qRepVehiculoVALORIMPUTACIONSetText(Sender: TField;
  const Text: String);
var temp:Double;
    Texto:string;
begin
  try
    Texto:=Text;
    while Pos(',', Texto) > 0 do
      delete(Texto,Pos(',', Texto),1) ;
    temp:=StrToFloat(Texto);
    Texto:=FloatToStr(temp);
    Sender.AsString:=Texto;
  except
  end;
end;

function TFViatico.ValidarFechaViatico(var odts:String): boolean;
var
  query:TQuery;
  FechaInicio,FechaFin:String;
  ContODTs: Integer;
  slODTs : TStringList;
begin
  ContODTs:=0;
  result:=False;
  odts:='';
  slODTs := TStringList.Create;
  slODTs.Sorted := True;
  FechaInicio:=FormatDateTime('dd/mm/yyyy hh:nn:ss', qViaticoFECHAINICIO.AsDateTime);
  FechaFin:=FormatDateTime('dd/mm/yyyy hh:nn:ss', qViaticoFECHAFIN.AsDateTime);

  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  query.sql.Add('SELECT V.CODIGOODT, V.CONCILIACIONREALIZADA, VD.VALORIMPUTACION');
  query.sql.Add('FROM ODTVIATICO V, ODTVIATICODETALLE VD');
  query.sql.Add('WHERE V.CODIGOVIATICO=VD.CODIGOVIATICO');
  query.sql.Add('AND V.CODIGOVIATICO<>'+qViaticoCODIGOVIATICO.AsString);
  query.sql.Add('AND (((to_date('''+FechaInicio+''',''DD/MM/YYYY HH24:MI:SS'')> V.FECHAINICIO)');
  query.sql.Add('AND (to_date('''+FechaInicio+''',''DD/MM/YYYY HH24:MI:SS'')<= V.FECHAFIN))');
  query.sql.Add('OR((to_date('''+FechaFin+''',''DD/MM/YYYY HH24:MI:SS'')>= V.FECHAINICIO )');
  query.sql.Add('AND(to_date('''+FechaFin+''',''DD/MM/YYYY HH24:MI:SS'')< V.FECHAFIN))');
  query.sql.Add('OR((to_date('''+FechaInicio+''',''DD/MM/YYYY HH24:MI:SS'') <= V.FECHAINICIO )');
  query.sql.Add('AND (to_date('''+FechaFin+''',''DD/MM/YYYY HH24:MI:SS'') >= V.FECHAFIN)) )');
  query.sql.Add('AND ((DEVOLUCION is null) or (DEVOLUCION <>''S''))');
  query.sql.Add('AND V.CODIGOEMPLEADO='+qViaticoCODIGOEMPLEADO.AsString);
  query.sql.Add('AND V.TIPOVIATICO = ''V''');
  //query.SQL.SaveToFile(GetTemporalPath+'sqlFuncion_ValidarFechaViatico_uViaticoPAS.txt');
  query.Open;
  if (query.RecordCount>0) then
  begin
    while not(query.Eof)  do
    begin
      if (query.FieldByName('CONCILIACIONREALIZADA').AsString = 'S') and
         (query.FieldByName('VALORIMPUTACION').AsInteger = 0) then
        inc(ContODTs)
      else
        slODTs.Add(query.Fields[0].AsString);
      query.Next;
    end;
    odts:= slODTs.CommaText;
    if ContODTs = query.RecordCount then Result:=True;
  end
  else
    Result:=true;
  query.Close;
  query.Free;
  slODTs.Free;
end;

procedure TFViatico.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not bCancelando then
  begin
    if error<>'' then ShowMessage(error);
    if bDatosIncompletos then
    begin
      if Application.MessageBox(PChar('Hay datos incompletos. Desea completar los datos?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
      begin
        error:='';
        ModalResult := 0;
        bDatosIncompletos := false;
        Action:=caNone;
      end
      else
      begin
        qViatico.Cancel;
        qViatico.CancelUpdates;
        Action:=caHide;
      end;
    end
    else
    begin
      if ModalResult <> MrCancel then
      begin
        ModalResult := mrOK;
        Action:=caHide;
      end;
    end;
    if ModalResult=2 then
    begin
      try
        qViatico.Cancel;
        qViatico.CancelUpdates;
        Action:=caHide;
      except
      end;
    end;
  end
  else
  begin
    try
      qViatico.Cancel;
      qViatico.CancelUpdates;
      Action:=caHide;
    except
    end;
  end;
end;

procedure TFViatico.qViaticoEscalaAfterPost(DataSet: TDataSet);
begin
  qViaticoEscala.ApplyUpdates;
  qViaticoEscala.CommitUpdates;
  qViaticoCalcFields(qViatico);
{  qViaticoEscala.close;
  qViaticoEscala.open;}
end;

procedure TFViatico.qViaticoEscalaAfterDelete(DataSet: TDataSet);
begin
  qViaticoEscala.ApplyUpdates;
  qViaticoEscala.CommitUpdates;
end;

procedure TFViatico.qViaticoEscalaAfterInsert(DataSet: TDataSet);
var Query:TQuery;
  Codigo:integer;
begin
  DataSet.FieldByName('CODIGOVIATICO').AsString:=qViaticoCODIGOVIATICO.AsString;
  Query:=TQuery.Create(Application);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT MAX(CODIGOODTVIATICOESCALA)CODIGO FROM ODTVIATICOESCALA';
  Query.Open;
  Codigo:=0;
  if (Query.fieldbyname('CODIGO').asstring<>'') then
    codigo:=Query.fieldbyname('CODIGO').asinteger;
  inc(codigo);
  DataSet.FieldByName('CODIGOODTVIATICOESCALA').AsInteger:=codigo;
  Query.Close;
  Query.Free;
  calcularValorEscalasViaticos;
  qViaticoCalcFields(nil);
end;

procedure TFViatico.qViaticoEscalaCODIGOZONAChange(Sender: TField);
begin
  qValorViaticoEscala.close;
  qValorViaticoEscala.ParamByName('CODIGOZONA').AsString:=Sender.AsString;
  qValorViaticoEscala.open;
  qViaticoEscalaVALOR.Asfloat:=qValorViaticoEscalaVALORVIATICO.AsFloat;
end;


procedure TFViatico.qViaticoEscalaBeforePost(DataSet: TDataSet);
begin
 { if (qViaticoEscalaLUGAR.AsString='')then
    raise Exception.Create('Debe ingresar un lugar para esta día');}
  if (qViaticoEscalaVALOR.AsString='')then
    raise Exception.Create('Debe ingresar un valor para el viático de este día');
end;

// Calcula el valor de los viaticos a partir de las escalas realizadas
function TFViatico.calcularValorEscalasViaticos:double;
var query:tquery;
begin
  query:=TQuery.Create(self);
  query.databasename:='BaseDato';
  query.sql.add('SELECT * FROM ODTVIATICOESCALA WHERE CODIGOVIATICO='+qViaticoCODIGOVIATICO.AsString);
  query.Open;
  result:=0;
  while not query.eof do
  begin
    result:=result+query.fieldbyname('VALOR').AsFloat;
    query.next;
  end;
  query.free;
end;

procedure TFViatico.FormCreate(Sender: TObject);
begin
  if qViatico.State in [dsEdit,dsInsert] then
  begin
    qViatico.FieldByName('CODIGOMUNICIPIODESTINO').AsString:=fodtpadre.qODTCODIGOMUNICIPIO.AsString;
    qViatico.FieldByName('CODIGOMUNICIPIOORIGEN').AsString:=fodtpadre.qODTCODIGOMUNICIPIOORIGEN.AsString;
  end;
  qMunicipio.close;
  qMunicipio.open;
  Editable:=true;
  Modificado:=false;
  CodigoEmpleadoReemplazado:= '';
  HayValoresEnReemplazo:= False;
  ViaticoRegla_CC5906:= 0;
end;

procedure TFViatico.qViaticoDIFICILACCESOValidate(Sender: TField);
begin
  qViaticoVALORDIARIOChange(qViaticoVALORDIARIO);
end;
//valida si el destino es del area de influencia
function TFViatico.AreaInfluencia: boolean;
begin
  result:=false;
  if (qViaticoCODIGOZONAORIGEN.AsString=qViaticoCodigoZonaDestino.AsString) and
  (qViaticoCODIGOZONAORIGEN.AsString<>'8') then
  begin
    qMunicipioDestino.Close;
    qMunicipioDestino.Open;
    result:=true;
  end;
end;
//valida si pernocta en el lugar de destino, si este  es del area de influencia
function TFViatico.PernoctaAreaInfluencia: boolean;
begin
  result:=true;
  if (trunc(qViaticoFECHAINICIO.AsDateTime)=trunc(qViaticoFECHAFIN.AsDateTime)) then
  begin
    result:=false;
  end;
end;

function TFViatico.validarFechaAuxilio(var odts: string): boolean;
var query:tquery;
  FechaInicio,FechaFin:String;
begin
  result:=false;
  odts:='';
  FechaInicio:=FormatDateTime('dd/mm/yyyy hh:nn:ss',qViaticoFECHAINICIO.asdatetime);
  FechaFin:=FormatDateTime('dd/mm/yyyy hh:nn:ss',qViaticoFECHAFIN.asdatetime);

  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  query.sql.Add('SELECT DISTINCT(CODIGOODT)');
  query.sql.Add('FROM ODTAUXILIO A');
  query.sql.Add('WHERE A.CODIGOEMPLEADO='+qViaticoCODIGOEMPLEADO.AsString);
  query.sql.Add('AND (((to_date('''+FechaInicio+''',''dd/mm/yyyy HH24:MI:SS'')>A.FECHAINICIO)');
  query.sql.Add('AND (to_date('''+FechaInicio+''',  ''dd/mm/yyyy HH24:MI:SS'')<=A.FECHAFIN))');
  query.sql.Add('OR((to_date('''+FechaFin+''',      ''dd/mm/yyyy HH24:MI:SS'')>=A.FECHAINICIO )');
  query.sql.Add('AND(to_date('''+FechaFin+''',      ''dd/mm/yyyy HH24:MI:SS'')<A.FECHAFIN))');
  query.sql.Add('OR((to_date('''+FechaInicio+''',   ''dd/mm/yyyy HH24:MI:SS'')<=A.FECHAINICIO )');
  query.sql.Add('AND (to_date('''+FechaFin+''',     ''dd/mm/yyyy HH24:MI:SS'')>=A.FECHAFIN)) )');
  //query.SQL.SaveToFile(GetTemporalPath+'sqlFuncion_ValidarFechaAuxilio_uViaticoPAS.txt');
  query.open;
  if (query.RecordCount>0) then
  begin
    while not(query.eof)  do
    begin
      odts:=odts+', '+query.fields[0].asstring;
      query.next;
    end;
    odts:=copy(odts,3,length(odts)-2);
  end
  else
    Result:=true;
  query.Close;
  query.Free;
end;

procedure TFViatico.sbFechaInicioClick(Sender: TObject);
begin
  try
    dbedFechaInicio.Setfocus;
    sFecha := dbedFechaInicio.Text;
    Fecha := GetFecha(true,Sfecha);
    if Fecha <> '' then dbedFechaInicio.Text := Fecha;
  except
  end;
end;

procedure TFViatico.sbFechaFinClick(Sender: TObject);
begin
  try
    dbEdFechaFin.Setfocus;
    sFecha := dbEdFechaFin.Text;
    Fecha := GetFecha(true,Sfecha);
    if Fecha <> '' then dbEdFechaFin.Text := Fecha;
  except
  end;
end;

procedure TFViatico.qViaticoFECHAINICIOChange(Sender: TField);
var
   dias:double;
   HoraFin, MinFin, SecFin, MSecFin: Word;
   HoraInfJornada1, HoraSupJornada1, HoraInfJornada2, HoraSupJornada2: TTime;
begin
  dias:=trunc(qViaticoFECHAFIN.AsDateTime) - trunc(qViaticoFECHAINICIO.AsDateTime)+1;
  if (qViaticoFECHAFIN.AsDateTime)=trunc(qViaticoFECHAFIN.AsDateTime)then dias:= qViaticoDias.AsInteger-1;

  if HayValoresEnReemplazo then EstablecerValoresEnReemplazo();

  if ((qViaticoNivel.AsInteger > 0) or (qViaticoSueldo.AsFloat > qViaticoDiarioSALARIOLIMITEVIATICO.AsFloat))
  and(qViaticoCodigoZona.AsString <> '8')
  and ((qViaticoDiarioSALARIOLIMITEVIATICO.AsInteger>0) and (qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.AsInteger>0))
  then
  // VALIDACION ANTIGUA
  begin
    //SHOWMESSAGE('fichange VALIDACION ANTIGUA');
    qViaticoDiasPagados.AsFloat:=dias;
  end
  else if (((qViaticoNivel.AsInteger > 0) {or (qViaticoSueldo.AsFloat > qViaticoDiarioSALARIOLIMITEVIATICO.AsFloat)})
  and (qViaticoCODIGOZONA.AsString = '8'))
  //and ((qViaticoDiarioSALARIOLIMITEVIATICO.AsInteger>0) and (qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.AsInteger>0)))
  then
  // (ES DIRECTIVO O SOBRERREMUNERADO) Y FUERA DEL AREA DE INFLUENCIA DE LA ESSA
  begin
      //SHOWMESSAGE('fichange DIRECTIVO = 8');
      if (Trunc(qViaticoFECHAINICIO.AsDateTime) = Trunc(qViaticoFECHAFIN.AsDateTime)) then
      //COMISIONES QUE INICIAN Y TERMINA EL MISMO DIA.
      begin
        HoraInfJornada1:= EncodeTime(0,0,0,000);
        HoraSupJornada1:= EncodeTime(11,59,59,999);
        HoraInfJornada2:= EncodeTime(12,0,0,000);
        HoraSupJornada2:= EncodeTime(23,59,59,999);
        if (Frac(qViaticoFECHAINICIO.AsDateTime) >= HoraInfJornada1) and (Frac(qViaticoFECHAFIN.AsDateTime) <= HoraSupJornada1) then  // Las Horas esta en la mañana.
        // SI LAS HORAS INICIO Y FIN ESTA EN LA MAÑANA NO SE PAGAN VIATICOS.
         qViaticoDiasPagados.AsFloat:=0
        else if (Frac(qViaticoFECHAINICIO.AsDateTime) >= HoraInfJornada2) and (Frac(qViaticoFECHAFIN.AsDateTime) <= HoraSupJornada2) then // Las Horas estan en la tarde.
        // SI LAS HORAS INICIO Y FIN ESTA EN LA TARDE NO SE PAGAN VIATICOS.
         qViaticoDiasPagados.AsFloat:=0
        else if ((Frac(qViaticoFECHAINICIO.AsDateTime) >= HoraInfJornada1) and (Frac(qViaticoFECHAINICIO.AsDateTime) <= HoraSupJornada1))
             and ((Frac(qViaticoFECHAFIN.AsDateTime) >= HoraInfJornada2) and (Frac(qViaticoFECHAFIN.AsDateTime) <= HoraSupJornada2))
        then
        // SI LA HORA DE INICIO ESTA EN LA MAÑANA Y LA HORA DE FIN ESTA EN LA TARDE SE PAGA EL PORCENTAJE RESPECTIVO.
         qViaticoDiasPagados.AsFloat:=dias + (qViaticoDiarioPORCENTAJEULTIMODIA.AsFloat/100) - 1;
      end
      else
      begin
        DecodeTime(qViaticoFECHAFIN.AsDateTime, HoraFin, MinFin, SecFin, MSecFin);
        if (HoraFin < 12) then //SI LA HORA FINAL DEL VIATICO ES ANTES DE LAS 12 DEL MEDIO DIA NO SE PAGA EL ULTIMO DIA
          qViaticoDiasPagados.AsFloat:= dias  - 1
        else //SI LA HORA FINAL DEL VIATICO ES DESPUES DE LAS 12 DEL MEDIO DIA SE PAGA EL PORCENTAJE RESPECTIVO
          qViaticoDiasPagados.AsFloat:=dias + (qViaticoDiarioPORCENTAJEULTIMODIA.AsFloat/100) - 1;
      end;
  end
  else //PARA EL RESTO DE LOS CASOS SE APLICA EL PORCENTAJE RESPECTIVO
  begin
    //SHOWMESSAGE('fichange RESTO DE CASOS');
    if (ViaticoRegla_CC5906 > 0) and
    (not SonMunicipiosMismaZona(qViaticoCODIGOMUNICIPIODESTINO.AsString, qViaticoCODIGOMUNICIPIOORIGEN.AsString))
    then
    begin
      //SHOWMESSAGE('fichange IF ViaticoRegla_CC5906');
      qViaticoVALORDIARIO.AsFloat:=ViaticoRegla_CC5906;
    end;
    qViaticoDiasPagados.AsFloat:=dias + (qViaticoDiarioPORCENTAJEULTIMODIA.AsFloat/100) - 1;
  end;
  qViaticoCalcFields(qViatico);
  Modificado:=True;
end;

procedure TFViatico.qViaticoFECHAFINChange(Sender: TField);
var
   dias:double;
   HoraFin, MinFin, SecFin, MSecFin: Word;
   HoraInfJornada1, HoraSupJornada1, HoraInfJornada2, HoraSupJornada2: TTime;
begin
  if (sender.AsDateTime)=trunc(sender.AsDateTime)then
    if (sender.AsDateTime-(1/(24*60)))> qViaticoFECHAINICIO.AsDateTime then
      qViaticoFECHAFIN.AsDateTime := sender.AsDateTime-(1/(24*60));
  dias:=trunc(qViaticoFECHAFIN.AsDateTime) - trunc(qViaticoFECHAINICIO.AsDateTime)+1;
  
  if HayValoresEnReemplazo then EstablecerValoresEnReemplazo();

  if ((qViaticoNivel.AsInteger > 0) or (qViaticoSueldo.AsFloat > qViaticoDiarioSALARIOLIMITEVIATICO.AsFloat))
  and(qViaticoCodigoZona.AsString <> '8')
  and ((qViaticoDiarioSALARIOLIMITEVIATICO.AsInteger>0) and (qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.AsInteger>0))
  then
  // VALIDACION ANTIGUA
  begin
    //SHOWMESSAGE('ffchange VALIDACION ANTIGUA');
    qViaticoDiasPagados.AsFloat:=dias;
  end
  else if (((qViaticoNivel.AsInteger > 0) {or (qViaticoSueldo.AsFloat > qViaticoDiarioSALARIOLIMITEVIATICO.AsFloat)})
  and (qViaticoCODIGOZONA.AsString = '8'))
  //and ((qViaticoDiarioSALARIOLIMITEVIATICO.AsInteger>0) and (qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.AsInteger>0)))
  then
  // (ES DIRECTIVO O SOBRERREMUNERADO) Y FUERA DEL AREA DE INFLUENCIA DE LA ESSA
  begin
      //SHOWMESSAGE('ffchange DIRECTIVO = 8');
      if (Trunc(qViaticoFECHAINICIO.AsDateTime) = Trunc(qViaticoFECHAFIN.AsDateTime)) then
      //COMISIONES QUE INICIAN Y TERMINA EL MISMO DIA.
      begin
        HoraInfJornada1:= EncodeTime(0,0,0,000);
        HoraSupJornada1:= EncodeTime(11,59,59,999);
        HoraInfJornada2:= EncodeTime(12,0,0,000);
        HoraSupJornada2:= EncodeTime(23,59,59,999);
        if (Frac(qViaticoFECHAINICIO.AsDateTime) >= HoraInfJornada1) and (Frac(qViaticoFECHAFIN.AsDateTime) <= HoraSupJornada1) then
        // SI LAS HORAS INICIO Y FIN ESTA EN LA MAÑANA NO SE PAGAN VIATICOS.
         qViaticoDiasPagados.AsFloat:=0
        else if (Frac(qViaticoFECHAINICIO.AsDateTime) >= HoraInfJornada2) and (Frac(qViaticoFECHAFIN.AsDateTime) <= HoraSupJornada2) then
        // SI LAS HORAS INICIO Y FIN ESTA EN LA TARDE NO SE PAGAN VIATICOS.
         qViaticoDiasPagados.AsFloat:=0
        else if ((Frac(qViaticoFECHAINICIO.AsDateTime) >= HoraInfJornada1) and (Frac(qViaticoFECHAINICIO.AsDateTime) <= HoraSupJornada1))
             and ((Frac(qViaticoFECHAFIN.AsDateTime) >= HoraInfJornada2) and (Frac(qViaticoFECHAFIN.AsDateTime) <= HoraSupJornada2))
        then
        // SI LA HORA DE INICIO ESTA EN LA MAÑANA Y LA HORA DE FIN ESTA EN LA TARDE SE PAGA EL PORCENTAJE RESPECTIVO.
         qViaticoDiasPagados.AsFloat:=dias + (qViaticoDiarioPORCENTAJEULTIMODIA.AsFloat/100) - 1;
      end
      else
      begin
        DecodeTime(qViaticoFECHAFIN.AsDateTime, HoraFin, MinFin, SecFin, MSecFin);
        if (HoraFin < 12) then //SI LA HORA FINAL DEL VIATICO ES ANTES DE LAS 12 DEL MEDIO DIA NO SE PAGA EL ULTIMO DIA
          qViaticoDiasPagados.AsFloat:= dias  - 1
        else //SI LA HORA FINAL DEL VIATICO ES DESPUES DE LAS 12 DEL MEDIO DIA SE PAGA EL PORCENTAJE RESPECTIVO
          qViaticoDiasPagados.AsFloat:=dias + (qViaticoDiarioPORCENTAJEULTIMODIA.AsFloat/100) - 1;
      end;
  end
  else //PARA EL RESTO DE LOS CASOS SE APLICA EL PORCENTAJE RESPECTIVO
  begin
    //SHOWMESSAGE('ffchange RESTO DE CASOS');
    if (ViaticoRegla_CC5906 > 0) and
    (not SonMunicipiosMismaZona(qViaticoCODIGOMUNICIPIODESTINO.AsString, qViaticoCODIGOMUNICIPIOORIGEN.AsString))
    then
    begin
      //SHOWMESSAGE('ffchange IF ViaticoRegla_CC5906');
      qViaticoVALORDIARIO.AsFloat:=ViaticoRegla_CC5906;
    end;
    qViaticoDiasPagados.AsFloat:=dias + (qViaticoDiarioPORCENTAJEULTIMODIA.AsFloat/100) - 1;
  end;
  qViaticoCalcFields(qViatico);
  Modificado:=True;
end;

procedure TFViatico.qViaticoDIASPAGADOSValidate(Sender: TField);
begin
  if (Sender.asstring<>'') and (qViaticoDias.AsString<>'' )then
  begin
    if (Sender.AsFloat>qViaticoDias.AsFloat) then raise Exception.Create('Los días pagados no pueden ser mas que los días del viático');
  end;
end;

procedure TFViatico.qEmpleadoCalcFields(DataSet: TDataSet);
var
  query: TQuery;
  Escalafon_R, Nivel_R, Grado_R, Clase_R, Nivel: String;
  slEscala: TStringList;
begin
// Modificado Customer Care 2604 Cambio centro de costo del empleado por centro de costo de la odt 11 agosto 2011
  if qOdt.Active then
  begin
    query:=TQuery.Create(Self);
    query.DatabaseName:='BaseDato';
    query.SQL.Add('SELECT F_Tipocecos('+qEmpleadoCODIGOADMINISTRATIVO.AsString+') FROM dual');
    query.Open;

    qEmpleadoTipoCecos.AsString:=query.Fields[0].AsString;
    query.Free;
  end;

  query:=TQuery.Create(Self);
  query.DatabaseName:='BaseDato';
  query.SQL.Add('SELECT NIVEL FROM CARGO WHERE CODIGOCARGO='+qEmpleadoCODIGOCARGO.AsString);
  query.Open;
  qEmpleadoNivel.AsString:= query.Fields[0].AsString;
  query.Close;
  query.Free;

  Escalafon_R:='';
  Nivel_R:='';
  Grado_R:='';
  Clase_R:='';

  slEscala:= TStringList.Create;
  ExtractStrings(['-'], [' '], PChar(qEmpleadoCODIGOSUELDO.AsString), slEscala);

  if slEscala.Count > 0 then
  begin
    if slEscala.Count >= 1 then Escalafon_R:=slEscala[0];
    if slEscala.Count >= 2 then Nivel_R:=slEscala[1];
    if slEscala.Count >= 3 then Grado_R:=slEscala[2];
    if slEscala.Count >= 4 then Clase_R:=slEscala[3];
  end;

  slEscala.Clear;
  slEscala.Free;
  
  if (Nivel_R = 'DI') and (qEmpleadoNivel.AsString = '') then
  begin
    query:=TQuery.Create(Self);
    query.DatabaseName:='BaseDato';

    query.Close;
    query.SQL.Clear;
    query.SQL.Text:= ' SELECT DISTINCT(C.NIVEL) FROM EMPLEADO E, CARGO C'+
                      ' WHERE E.CODIGOCARGO = C.CODIGOCARGO'+
                      ' AND E.CODIGOEMPLEADO <> '+qEmpleadoCODIGOEMPLEADO.AsString+
                      ' AND E.CODIGOSUELDO = '+QuotedStr(qEmpleadoCODIGOSUELDO.AsString)+
                      ' AND E.ESTADO IN ('+QuotedStr('AC')+','+QuotedStr('LC')+')';
    query.Open;
    if (not query.IsEmpty) then
    begin
      if query.RecordCount > 1 then
      begin
        while not query.Eof do
        begin
          Nivel:= query.FieldByName('NIVEL').AsString;
          if Nivel <> '' then Break;
          query.Next;
        end;
      end
      else Nivel:= query.FieldByName('NIVEL').AsString;
    end;
    query.Close;
    query.Free;
    qEmpleadoNivel.AsString:= Nivel;
  end;
end;

procedure TFViatico.EliminarRegistrosDetalleNulo;
var query:tquery;
begin
  query:=TQuery.Create(self);
  query.databasename:='BaseDato';
  query.sql.add('DELETE FROM ODTVIATICODETALLE WHERE CODIGOVIATICO='+qViaticoCODIGOVIATICO.AsString);
  query.sql.add('AND VALORIMPUTACION IS NULL');
  query.ExecSQL;
  query.free;
end;

procedure TFViatico.sbBuscarCIGClick(Sender: TObject);
var CIG:INTEGER;
  qDatos:tQuery;
  nivelgeografico:integer;
begin
  CIG := CapturarCIG;
  qDatos:=TQuery.Create(Application);
  qDatos.DatabaseName:='BaseDato';
  qDatos.SQL.Add('SELECT NIVEL FROM GEOGRAFICO WHERE CODIGOGEOGRAFICO = '+ inttostr(CIG));
  qDatos.open;
  nivelgeografico:=  qdatos.FieldByName('NIVEL').ASINTEGER;
  qdatos.free;
  if nivelgeografico < 4 THEN
    raise Exception.Create('Debe seleccionar un CIG correspondiente a un barrio o por lo menos un municipio.');
  if (CIG<>0) then qViaticoCODIGOGEOGRAFICO.AsInteger:=CIG;
end;

procedure TFViatico.SpeedButton7Click(Sender: TObject);
begin
  BuscarBarrio(qViaticoCODIGOGEOGRAFICO.AsString,true);
end;

procedure TFViatico.qViaticoCODIGOGEOGRAFICOValidate(Sender: TField);
var query:tquery;
begin
  if (sender.AsString<>'') then
  begin
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT GETCODIGOMUNICIPIO('+Sender.AsString+') FROM DUAL');
    query.open;
    if (query.fields[0].AsInteger<>qMunicipioDestinoCODIGOGEOGRAFICO.AsInteger)then
    begin
      raise Exception.Create('EL CIG no corresponde al municipio');
    end;
    query.free;
  end;
end;

procedure TFViatico.qViaticoCODIGOGEOGRAFICOChange(Sender: TField);
var s:string;
begin
  qGeografico.close;
  qGeografico.open;
  s:=qMunicipioDestinoNOMBREMUNICIPIO.AsString;
  if (qViaticoCODIGOGEOGRAFICO.AsString<>qMunicipioDestinoCODIGOGEOGRAFICO.AsString) then
    s:=s+'-' + qGeograficoNOMBRECATEGORIA.AsString;
  qViaticoDESTINO.AsString:=s;
  Modificado:=true;
end;

procedure TFViatico.qViaticoVALORDIARIOChange(Sender: TField);
begin
  {
  if qViatico.State in [dsEdit,dsInsert] then
  begin
    if Sender.Asfloat>qViaticoDiarioVALORVIATICO.AsFloat then
    begin
      if not (qViaticoDIFICILACCESO.AsString='S')then
      begin
        sender.AsFloat:=qViaticoDiarioVALORVIATICO.AsFloat;
      end;
    end;
    Modificado:=true;
  end;
  }
end;

procedure TFViatico.qViaticoESCALASChange(Sender: TField);
var i:integer;
  query:tquery;
begin
  query:=TQuery.create(self);
  query.DatabaseName:='BaseDato';
  query.sql.Add('DELETE FROM ODTVIATICOESCALA WHERE CODIGOVIATICO='+qViaticoCODIGOVIATICO.AsString);
  query.ExecSQL;
  query.free;
  qViaticoEscala.close;
  qViaticoEscala.open;
  if qViaticoESCALAS.AsString='S' then
  begin
    for i := 0  to qViaticoDias.AsInteger-1 do
    begin
      qViaticoEscala.Insert;
      qViaticoEscalaDIA.AsInteger:=i+1;
      qViaticoEscalaLUGAR.AsString:=qViaticoDESTINO.AsString;
      qViaticoEscalaVALOR.AsString:=qViaticoVALORDIARIO.AsString;
      qViaticoEscala.Post;
    end;
  end;
  qViaticoCalcFields(qViatico);
  Modificado:=true;
end;

procedure TFViatico.qViaticoESCALASValidate(Sender: TField);
begin
  if sender.AsString='S' then
    gbEscalas.Enabled:=true
  else
    gbEscalas.Enabled:=false;
end;

function TFViatico.ValidarViaticoCausado: boolean;
begin
  result:=true;
  if (qViaticoFECHAINICIO.AsDateTime>FechaServidor) or
    (qViaticoFECHAFIN.AsDateTime>FechaServidor) then
    result:=false;
end;

procedure TFViatico.qViaticoMODIFICADOChange(Sender: TField);
begin
  Modificado:=true;
end;

procedure TFViatico.qViaticoCODIGOEMPLEADOChange(Sender: TField);
begin
  Modificado:=true;
end;

procedure TFViatico.InhabilitarCambios;
begin
  Editable:=false;
  bbAceptar.Enabled:=false;
  qViatico.CachedUpdates:=False;
  qViatico.UpdateObject:=nil;
  qValorViatico.CachedUpdates:=False;
  qValorViatico.UpdateObject:=nil;
  sbFechaInicio.Enabled:=false;
  sbFechaFin.Enabled:=False;
  bbCancelar.Enabled:=False;
end;

procedure TFViatico.qAuxilioDirectivoAfterInsert(DataSet: TDataSet);
var Query:TQuery;
begin
  DataSet.FieldByName('CODIGOVIATICO').AsString:=qViaticoCODIGOVIATICO.AsString;
  Query:=TQuery.Create(Application);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT SQ_ODTVIATICODETALLE.NEXTVAL FROM DUAL';
  Query.Open;
  DataSet.FieldByName('CODIGOVIATICODETALLE').AsInteger:=Query.Fields[0].AsInteger;
  Query.Close;
  Query.sql.Clear;
  Query.sql.Add('SELECT CODIGOIMPUTACIONMANOOBRA');
  Query.sql.Add('FROM IMPUTACIONMANOOBRA IMO, ODTVIATICO V, ODT O');
  Query.sql.Add('WHERE O.CODIGOODT=V.CODIGOODT');
  Query.sql.Add('AND IMO.VIGENCIADESDE<=V.FECHAINICIO');
  Query.sql.Add('AND (IMO.VIGENCIAHASTA>=V.FECHAFIN OR IMO.VIGENCIAHASTA IS NULL)');
  Query.sql.Add('AND V.CODIGOVIATICO='+qViaticoCODIGOVIATICO.AsString);
  Query.sql.Add('AND IMO.TIPOCECOS='''+qEmpleadoTipoCecos.AsString+'''');
  Query.sql.Add('AND IMO.CODIGOTIPOIMPUTACIONODT=''V''');
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''ADZ''');
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;


procedure TFViatico.qCiaAfterOpen(DataSet: TDataSet);
begin
  qGerencia.close;
  qGerencia.open;
end;

function TFViatico.GetCodigoEmpleadoReemplazado (CodigoEmpleadoReemplazante: String): String;
var
  Query1 :TQuery;
  sFechaDesde, sFechaHasta, sFECHA_DESDE, sFECHA_HASTA, sCodigoSueldo: String;
begin
  result:= '';
  if CodigoEmpleadoReemplazante <> '' then
  begin
    sFechaDesde:= FormatDateTime('dd/mm/yyyy', qViaticoFECHAINICIO.AsDateTime);
    sFechaHasta:= FormatDateTime('dd/mm/yyyy', fODTPadre.qODTFECHAFINALESTIMADA.AsDateTime);

    sFECHA_DESDE := 'TO_DATE('''+sFechaDesde+''', ''DD/MM/YYYY '')';
    sFECHA_HASTA := 'TO_DATE('''+sFechaHasta+''', ''DD/MM/YYYY '')';

    Query1:=TQuery.Create(Application);
    Query1.DatabaseName:='BaseDato';

    Query1.SQL.Clear;
    Query1.SQL.Text:= 'SELECT R.COD_REEMPLAZO, R.SUELDO_R, R.ESCALAFON_R, R.NIVEL_R, R.GRADO_R, R.CLASE_R'+
                      ' FROM VIP_REEMPLAZOS R'+
                      ' WHERE R.CODIGO = '+CodigoEmpleadoReemplazante+
                      ' AND (R.FECHA_HASTA >= '+sFECHA_DESDE+' )'+
                      ' AND (R.FECHA_DESDE <= '+sFECHA_DESDE+')';
                      //' AND (R.FECHA_HASTA >= '+sFECHA_HASTA+' )'+
                      //' AND (R.FECHA_DESDE <= '+sFECHA_HASTA+')';
    //Query1.SQL.SaveToFile(GetTemporalPath+'1_EmpleadoReemplazado.txt');
    Query1.Open;
    if (not Query1.IsEmpty) then
    begin
      SueldoDelReemplazado:= Query1.FieldByName('SUELDO_R').AsString;
      if (Query1.FieldByName('COD_REEMPLAZO').AsString <> '') then //SI ESTE CAMPO ESTA LLENO ES UN REEMPLAZO
      begin
         result:= Query1.FieldByName('COD_REEMPLAZO').AsString;
         TextoLabelSueldo:= 'Reemplazo :';
      end
      else
      begin
         //SI EL CAMPO ESTA VACIO ES UN ENCARGO Y ENTONCES DEVUELVO UNA CADENA (UN CODIGOSUELDO)
         sCodigoSueldo:='';
         if Query1.FieldByName('ESCALAFON_R').AsString <> '' then
           sCodigoSueldo := Query1.FieldByName('ESCALAFON_R').AsString;
         if Query1.FieldByName('NIVEL_R').AsString <> '' then
           sCodigoSueldo := sCodigoSueldo+'-'+Query1.FieldByName('NIVEL_R').AsString;
         if Query1.FieldByName('GRADO_R').AsString <> '' then
           sCodigoSueldo := sCodigoSueldo+'-'+Query1.FieldByName('GRADO_R').AsString;
         if Query1.FieldByName('CLASE_R').AsString <> '' then
           sCodigoSueldo := sCodigoSueldo+'-'+Query1.FieldByName('CLASE_R').AsString;

         result:= sCodigoSueldo;
         TextoLabelSueldo:= 'Encargo :';
      end;
    end;
    Query1.Close;
    Query1.Free;
  end;
end;

function TFViatico.ConsultarValoresEnReemplazo(CodigoEmpleadoReemplazado : String): Boolean;
var
  Query2:TQuery;
  Escalafon_R, Nivel_R, Grado_R, Clase_R, Nivel: String;
  slEscala: TStringList;
begin
  result:= False;
  Query2:=TQuery.Create(Application);
  Query2.DatabaseName:='BaseDato';
  if Pos('-', CodigoEmpleadoReemplazado) > 0 then
  begin
    Escalafon_R:='';
    Nivel_R:='';
    Grado_R:='';
    Clase_R:='';
    {
    Si el parametro recibido (CodigoEmpleadoReemplazado) es una cadena
    tipo CODIGOSUELDO, busco el nivel de uno o mas empleados con igual CODIGOSUELDO.

    Para el caso de Directivos: En el caso que hallan empleados con el mismo
    CODIGOSUELDO y diferente Nivel o no tienen Nivel y el NIVEL_R en
    la vista VIP_REEMPLAZOS es igual a DI (DIRECTIVO) se seguira tratando como un Directivo.
    }
    slEscala:= TStringList.Create;
    ExtractStrings(['-'], [' '], PChar(CodigoEmpleadoReemplazado), slEscala);

    if slEscala.Count > 0 then
    begin
      if slEscala.Count >= 1 then Escalafon_R:=slEscala[0];
      if slEscala.Count >= 2 then Nivel_R:=slEscala[1];
      if slEscala.Count >= 3 then Grado_R:=slEscala[2];
      if slEscala.Count >= 4 then Clase_R:=slEscala[3];
    end;

    slEscala.Clear;
    slEscala.Free;

    Query2.Close;
    Query2.SQL.Clear;
    Query2.SQL.Text:= ' SELECT DISTINCT(C.NIVEL) FROM EMPLEADO E, CARGO C'+
                      ' WHERE E.CODIGOCARGO = C.CODIGOCARGO'+
                      ' AND E.CODIGOEMPLEADO <> '+qViatico.ParamByName('CODIGOEMPLEADO').AsString+
                      ' AND E.CODIGOSUELDO = '+QuotedStr(CodigoEmpleadoReemplazado)+
                      ' AND E.ESTADO IN ('+QuotedStr('AC')+','+QuotedStr('LC')+')';
    //Query2.SQL.SaveToFile(GetTemporalPath+'3_NivelEmpleadoReemplazado.txt');
    Query2.Open;
    if (not Query2.IsEmpty) then
    begin
      if Query2.RecordCount > 1 then
      begin
        while not Query2.Eof do
        begin
          Nivel:= Query2.FieldByName('NIVEL').AsString;
          if (Nivel_R = 'DI') and (Nivel <> '') then Break;
          Query2.Next;
        end;
      end
      else Nivel:= Query2.FieldByName('NIVEL').AsString;
    end
    else Nivel:= '';

    result:= True;
  end
  else
  begin
    Query2.Close;
    Query2.SQL.Clear;
    Query2.SQL.Text:= ' SELECT C.NIVEL '+
                      ' FROM EMPLEADO E, CARGO C'+
                      ' WHERE E.CODIGOCARGO= C.CODIGOCARGO'+
                      ' AND E.CODIGOEMPLEADO = '+CodigoEmpleadoReemplazado;
    //Query2.SQL.SaveToFile(GetTemporalPath+'3_NivelEmpleadoReemplazado.txt');
    Query2.Open;
    if (not Query2.IsEmpty) then
      Nivel:= Query2.FieldByName('NIVEL').AsString;
    result:= True;
  end;
  Query2.Close;
  Query2.Free;

  if ExcepcionMunicipio then
  begin
    qViaticoDiarioEncargo.Close;
    qViaticoDiarioEncargo.DataSource:= nil;
    qViaticoDiarioEncargo.SQL.Clear;
    qViaticoDiarioEncargo.SQL.Text:= qViaticoDiarioExclusion.SQL.Text;
    qViaticoDiarioEncargo.ParamByName('CODIGOMUNICIPIODESTINO').AsString:= qViaticoCODIGOMUNICIPIODESTINO.AsString;
    qViaticoDiarioEncargo.ParamByName('CODIGOMUNICIPIOORIGEN').AsString:= qViaticoCODIGOMUNICIPIODESTINO.AsString;
    qViaticoDiarioEncargo.ParamByName('FECHAINICIO').AsDateTime:= qViaticoFECHAINICIO.AsDateTime;
    qViaticoDiarioEncargo.ParamByName('CIUDADCAPITAL').AsString:= qViaticoCIUDADCAPITAL.AsString;
    qViaticoDiarioEncargo.ParamByName('SUELDO').AsFloat:= StrToFloat(SueldoDelReemplazado);
    qViaticoDiarioEncargo.ParamByName('NIVEL').AsString:= Nivel;
    qViaticoDiarioEncargo.Open;
  end
  else
  begin
    qViaticoDiarioEncargo.Close;
    qViaticoDiarioEncargo.ParamByName('CODIGOMUNICIPIODESTINO').AsString:= qViaticoCODIGOMUNICIPIODESTINO.AsString;
    qViaticoDiarioEncargo.ParamByName('CODIGOZONAORIGEN').AsString:= qViaticoCODIGOZONAORIGEN.AsString;
    qViaticoDiarioEncargo.ParamByName('CODIGOZONA').AsString:= qViaticoCODIGOZONA.AsString;
    qViaticoDiarioEncargo.ParamByName('FECHAINICIO').AsDateTime:= qViaticoFECHAINICIO.AsDateTime;
    qViaticoDiarioEncargo.ParamByName('CIUDADCAPITAL').AsString:= qViaticoCIUDADCAPITAL.AsString;
    qViaticoDiarioEncargo.ParamByName('SUELDO').AsFloat:= StrToFloat(SueldoDelReemplazado);
    qViaticoDiarioEncargo.ParamByName('NIVEL').AsString:= Nivel;
    qViaticoDiarioEncargo.Open;
  End;
  NivelDelReemplazado:= Nivel;
end;

function TFViatico.EstablecerValoresEnReemplazo(): Boolean;
begin
   qViaticoVALORDIARIO.AsFloat:=qViaticoDiarioEncargo.FieldByName('VALORVIATICO').AsFloat;
   qViaticoNivel.AsString:= NivelDelReemplazado;
   qViaticoSueldo.AsFloat:= StrToFloat(SueldoDelReemplazado);
   lblSueldoNuevo.Visible:= True;
   lblSueldoNuevo.Caption := TextoLabelSueldo;
   edSueldoNuevo.Visible:= True;
   edSueldoNuevo.Text:= FormatFloat('0.0000', StrToFloat(SueldoDelReemplazado));
end;

function TFViatico.ExcepcionMunicipio: Boolean;
var
  qConsultaviaticosmunicipios:TQuery;
  FechaInicio:String;
begin
  result:=false;
  if (fODTPadre.qODTCODIGOMUNICIPIO.AsString <> '') and (fODTPadre.qODTCODIGOMUNICIPIOORIGEN.AsString <> '') then
  begin
    FechaInicio:=FormatDateTime('dd/mm/yyyy',qViaticoFECHAINICIO.asdatetime);
    qConsultaviaticosmunicipios:=TQuery.Create(Application);
    qConsultaviaticosmunicipios.DatabaseName:='BaseDato';
    qConsultaviaticosmunicipios.SQL.Text:='SELECT * FROM VIATICOZONA WHERE CODIGOMUNICIPIOORIGEN = '
                                          + fODTPadre.qODTCODIGOMUNICIPIOORIGEN.AsString +
                    ' AND CODIGOMUNICIPIODESTINO =  '+ fODTPadre.qODTCODIGOMUNICIPIO.AsString +
                    ' AND VIGENCIADESDE<= to_date('''+FechaInicio+''',''dd/mm/yyyy'') '+
                    ' AND VIGENCIAHASTA>=to_date('''+FechaInicio+''',''dd/mm/yyyy'') ';
    //qConsultaviaticosmunicipios.SQL.SaveToFile(GetTemporalPath+'3_ExcepcionMunicipio.txt');
    qConsultaviaticosmunicipios.Open;

    if  qConsultaviaticosmunicipios.RecordCount >  0 then
      Result:= true;
    qConsultaviaticosmunicipios.Close;
    qConsultaviaticosmunicipios.Free;
  end;
end;

procedure TFViatico.qViaticoCODIGOMUNICIPIOORIGENChange(Sender: TField);
begin
  qMunicipioOrigen.Close;
  qMunicipioOrigen.Open;
  if qViatico.State in [dsEdit,dsInsert] then
  begin
    qViaticoORIGEN.AsString:=qMunicipioOrigenNOMBREMUNICIPIO.AsString;
    //qViaticoCODIGOGEOGRAFICO.AsString:=qMunicipioOrigenCODIGOGEOGRAFICO.AsString;
  end;
end;

procedure TFViatico.qViaticoCODIGOMUNICIPIOORIGENValidate(Sender: TField);
begin
// Modificado solicitud
 if sender.AsString<>'' then
  begin
    dbEdMunicipioOrigen.ReadOnly:=true;
  end
  else
  begin
    dbEdMunicipioOrigen.ReadOnly:=false;
  end;
end;

procedure TFViatico.qViaticoORIGENChange(Sender: TField);
begin
  Modificado:=true;
end;

function TFViatico.Regla_CC5906(CODIGOMUNICIPIODESTINO, CODIGOMUNICIPIOORIGEN: String): Double;
var
  qry:TQuery;
  temp, actual: Double;
  FechaInicio:String;
begin
  temp:=0;
  actual:=0;
  if (CODIGOMUNICIPIODESTINO <> '') and (CODIGOMUNICIPIOORIGEN <> '') then
  begin
    FechaInicio:=FormatDateTime('DD/MM/YYYY HH:NN:SS',qViaticoFECHAINICIO.AsDateTime);
    qry:=TQuery.Create(Application);
    qry.DatabaseName:='BaseDato';
    qry.SQL.Clear;
    qry.SQL.Text:= 'SELECT VALORVIATICO FROM VIATICOZONAEXCLUSION'+
                  ' WHERE (CODIGOMUNICIPIO = '+CODIGOMUNICIPIODESTINO+' AND CRITERIO = ''D'')'+
                  ' AND VIGENCIADESDE <= TO_DATE('''+FechaInicio+''',''DD/MM/YYYY HH24:MI:SS'')'+
                  ' AND VIGENCIAHASTA >= TO_DATE('''+FechaInicio+''',''DD/MM/YYYY HH24:MI:SS'')'+
                  ' UNION'+
                  ' SELECT VALORVIATICO FROM VIATICOZONAEXCLUSION'+
                  ' WHERE (CODIGOMUNICIPIO = '+CODIGOMUNICIPIOORIGEN+' AND CRITERIO = ''O'')'+
                  ' AND VIGENCIADESDE <= TO_DATE('''+FechaInicio+''',''DD/MM/YYYY HH24:MI:SS'')'+
                  ' AND VIGENCIAHASTA >= TO_DATE('''+FechaInicio+''',''DD/MM/YYYY HH24:MI:SS'')';
    //qry.SQL.SaveToFile(GetTemporalPath+'Regla_CC5906.txt');
    qry.Open;
    if (not qry.IsEmpty) then
    begin
      temp:= qry.FieldByName('VALORVIATICO').AsFloat;
      if qry.RecordCount > 1 then
      begin
        while not qry.Eof do
        begin
          temp:= qry.FieldByName('VALORVIATICO').AsFloat;
          if temp > actual then actual:= temp;
          qry.Next;
        end;
      end
      else actual:= temp;
    end;
    qry.Close;
    qry.Free;
  end;
  result:= actual;
end;

function TFViatico.SonMunicipiosMismaZona(CODIGOMUNICIPIODESTINO, CODIGOMUNICIPIOORIGEN: String): Boolean;
var
  qry:TQuery;
begin
  result:= False;
  if (CODIGOMUNICIPIODESTINO <> '') and (CODIGOMUNICIPIOORIGEN <> '') then
  begin
    qry:=TQuery.Create(Application);
    qry.DatabaseName:='BaseDato';
    qry.SQL.Clear;
    qry.SQL.Text:= 'SELECT * FROM ZONAESSA Z1, ZONAESSA Z2, MUNICIPIO M, MUNICIPIO M2 '+
                  ' WHERE M.CODIGOZONA = Z1.CODIGOZONA '+
                  ' AND M2.CODIGOZONA = Z2.CODIGOZONA '+
                  ' AND M.CODIGOMUNICIPIO = '+CODIGOMUNICIPIOORIGEN+
                  ' AND M2.CODIGOMUNICIPIO = '+CODIGOMUNICIPIODESTINO+
                  ' AND ((Z1.CODIGOZONA = Z2.CODIGOZONA) or (Z1.CODIGOZONA = Z2.CODIGOZONAPADRE) '+
                  ' or (Z1.CODIGOZONAPADRE = Z2.CODIGOZONA))';

    //qry.SQL.SaveToFile(GetTemporalPath+'SonMunicipiosMismaZona.txt');
    qry.Open;
    if (not qry.IsEmpty) then result:= True;
    qry.Close;
    qry.Free;
  end;
end;

end.



