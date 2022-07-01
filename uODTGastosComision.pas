unit uODTGastosComision;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, Digisoft,
  Grids, DBGrids, ToolEdit, CurrEdit, Menus,UComunesAdministrativo;

type
  TFODTGastosComision = class(TForm)
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
    PanelGastosTransporte: TPanel;
    Panel3: TPanel;
    updViatico: TUpdateSQL;
    dsTipoTiquete: TDataSource;
    qTipoTiquete: TQuery;
    gbVehiculo: TGroupBox;
    Label5: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    dbEdGasolina: TDBEdit;
    dbEdPeaje: TDBEdit;
    dbEdParqueadero: TDBEdit;
    dbrgUsaVehiculo: TDBRadioGroup;
    qTipoTiqueteCODIGOTIPOTIQUETE: TStringField;
    qTipoTiqueteDESCRIPCION: TStringField;
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
    DBMemoMotivoOdt: TDBMemo;
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
    qOdtVehiculo: TQuery;
    dsOdtVehiculo: TDataSource;
    qViaticoCODIGOVIATICO: TFloatField;
    qViaticoCODIGOEMPLEADO: TFloatField;
    qViaticoCODIGOODT: TFloatField;
    qViaticoCODIGOCOMISION: TFloatField;
    qViaticoFECHAINICIO: TDateTimeField;
    qViaticoFECHAFIN: TDateTimeField;
    qViaticoUSOVEHICULO: TStringField;
    qViaticoVEHICULOOFICIAL: TStringField;
    qViaticoDias: TIntegerField;
    qGasolina: TQuery;
    dsGasolina: TDataSource;
    updGasolina: TUpdateSQL;
    qPeaje: TQuery;
    dsPeaje: TDataSource;
    updPeaje: TUpdateSQL;
    qParqueo: TQuery;
    dsParqueo: TDataSource;
    updParqueo: TUpdateSQL;
    qPasaje: TQuery;
    dsPasaje: TDataSource;
    updPasaje: TUpdateSQL;
    qViaticoAnoInicio: TDateField;
    qViaticoMesInicio: TDateField;
    qViaticoDiaInicio: TDateField;
    qViaticoAnoFin: TDateField;
    qViaticoMesFin: TDateField;
    qViaticoDiaFin: TDateField;
    Label9: TLabel;
    CETotalTransporte: TCurrencyEdit;
    Label26: TLabel;
    CETotalComision: TCurrencyEdit;
    qAuxilioViaje: TQuery;
    dsAuxilio: TDataSource;
    updAuxilio: TUpdateSQL;
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
    qOdtVehiculoCODIGOODT: TFloatField;
    qOdtVehiculoCONSECUTIVO: TFloatField;
    qOdtVehiculoCODIGOVEHICULO: TStringField;
    qOdtVehiculoCODIGOPROPIETARIO: TStringField;
    qOdtVehiculoNOMBREPROPIETARIO: TStringField;
    dsPropietarioVehiculo: TDataSource;
    qPropietarioVehiculo: TQuery;
    qViaticoCODIGOVEHICULO: TStringField;
    dsTiqueteViatico: TDataSource;
    qTiqueteViatico: TQuery;
    qPropietarioVehiculoCODIGOPROPIETARIO: TStringField;
    qViaticoDiarioCODIGOVIATICOZONA: TFloatField;
    qViaticoDiarioCODIGOZONAORIGEN: TFloatField;
    qViaticoDiarioCODIGOZONADESTINO: TFloatField;
    qViaticoDiarioVALORVIATICO: TFloatField;
    qViaticoDiarioVALORAUXILIO: TFloatField;
    qViaticoDiarioPORCENTAJESALARIO: TFloatField;
    qViaticoDiarioPORCENTAJEULTIMODIA: TFloatField;
    updTiqueteViatico: TUpdateSQL;
    qTiqueteViaticoCODIGOVIATICODETALLETIQUETE: TFloatField;
    qTiqueteViaticoCODIGOVIATICO: TFloatField;
    qTiqueteViaticoCODIGOTIPOTIQUETE: TStringField;
    qTiqueteViaticoNUMEROTIQUETE: TStringField;
    qTiqueteViaticoVALORTIQUETE: TFloatField;
    qTiqueteViaticoNombreTipoTiquete: TStringField;
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
    gbPasajes: TGroupBox;
    dbgTiquetes: TDBGrid;
    dbnTiquetes: TDBNavigator;
    qViaticoANTICIPO: TStringField;
    qViaticoPORCENTAJEANTICIPO: TFloatField;
    qViaticoDIASPROYECTADOS: TFloatField;
    qViaticoVALORANTICIPO: TFloatField;
    qOdtCODIGOAREAINFLUENCIA: TStringField;
    qViaticoCIUDADCAPITAL: TStringField;
    Label31: TLabel;
    dbEdAuxilioViaje: TDBEdit;
    dbchbCiudadCapital: TDBCheckBox;
    qViaticoCodigoZonaDestino: TIntegerField;
    qCargo: TQuery;
    dsCargo: TDataSource;
    qEmpleadoCODIGOCONTRATISTA: TStringField;
    qEmpleadoCODIGOCARGO: TFloatField;
    qCargoNIVEL: TFloatField;
    qViaticoSueldo: TFloatField;
    qCargoCODIGOCARGO: TFloatField;
    qEmpleadoNivel: TIntegerField;
    qViaticoNivel: TIntegerField;
    qViaticoCodigoZona: TIntegerField;
    qViaticoDESTINO: TStringField;
    Label14: TLabel;
    Label15: TLabel;
    dbEdOtros: TDBEdit;
    qRepVehiculo: TQuery;
    dsRepVehiculo: TDataSource;
    updRepVehiculo: TUpdateSQL;
    qPeajeCODIGOVIATICODETALLE: TFloatField;
    qPeajeCODIGOVIATICO: TFloatField;
    qPeajeCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qPeajeVALORIMPUTACION: TFloatField;
    qPeajeNUMEROIMPUTACION: TFloatField;
    qPeajeAUXILIAR: TFloatField;
    qPeajeDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qPasajeCODIGOVIATICODETALLE: TFloatField;
    qPasajeCODIGOVIATICO: TFloatField;
    qPasajeCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qPasajeVALORIMPUTACION: TFloatField;
    qPasajeNUMEROIMPUTACION: TFloatField;
    qPasajeAUXILIAR: TFloatField;
    qPasajeDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qGasolinaCODIGOVIATICODETALLE: TFloatField;
    qGasolinaCODIGOVIATICO: TFloatField;
    qGasolinaCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qGasolinaVALORIMPUTACION: TFloatField;
    qGasolinaNUMEROIMPUTACION: TFloatField;
    qGasolinaAUXILIAR: TFloatField;
    qGasolinaDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qParqueoCODIGOVIATICODETALLE: TFloatField;
    qParqueoCODIGOVIATICO: TFloatField;
    qParqueoCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qParqueoVALORIMPUTACION: TFloatField;
    qParqueoNUMEROIMPUTACION: TFloatField;
    qParqueoAUXILIAR: TFloatField;
    qParqueoDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qAuxilioViajeCODIGOVIATICODETALLE: TFloatField;
    qAuxilioViajeCODIGOVIATICO: TFloatField;
    qAuxilioViajeCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qAuxilioViajeVALORIMPUTACION: TFloatField;
    qAuxilioViajeNUMEROIMPUTACION: TFloatField;
    qAuxilioViajeAUXILIAR: TFloatField;
    qAuxilioViajeDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qRepVehiculoCODIGOVIATICODETALLE: TFloatField;
    qRepVehiculoCODIGOVIATICO: TFloatField;
    qRepVehiculoCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qRepVehiculoVALORIMPUTACION: TFloatField;
    qRepVehiculoNUMEROIMPUTACION: TFloatField;
    qRepVehiculoAUXILIAR: TFloatField;
    qRepVehiculoDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qViaticoESTADO: TStringField;
    qMunicipio: TQuery;
    qViaticoVALORDIARIO: TFloatField;
    qViaticoDIFICILACCESO: TStringField;
    qViaticoDIASPAGADOS: TFloatField;
    qEmpleadoTipoCecos: TStringField;
    qViaticoIMPRESOANTICIPO: TStringField;
    qViaticoCODIGOGEOGRAFICO: TFloatField;
    qMunicipioDestinoCODIGOGEOGRAFICO: TFloatField;
    qGeografico: TQuery;
    qGeograficoNOMBRECATEGORIA: TStringField;
    qGeograficoINDICEDIFICULTAD: TFloatField;
    Label25: TLabel;
    dbEdPlacaVehiculo: TDBEdit;
    sbAsociarVehiculo: TSpeedButton;
    dbrgVehiculoOficial: TDBRadioGroup;
    qViaticoDEVOLUCION: TStringField;
    qViaticoIMPRESOVIATICO: TStringField;
    qViaticoNUMEROIMPRESION: TFloatField;
    qViaticoCodigoBarra: TStringField;
    qViaticoESCALAS: TStringField;
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
    qViaticoValorAuxilioDiario: TFloatField;
    qAuxilioDirectivo: TQuery;
    dsAuxilioDirectivo: TDataSource;
    updAuxilioDirectivo: TUpdateSQL;
    qAuxilioDirectivoCODIGOVIATICODETALLE: TFloatField;
    qAuxilioDirectivoCODIGOVIATICO: TFloatField;
    qAuxilioDirectivoCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qAuxilioDirectivoVALORIMPUTACION: TFloatField;
    qAuxilioDirectivoNUMEROIMPUTACION: TFloatField;
    qAuxilioDirectivoAUXILIAR: TFloatField;
    qAuxilioDirectivoDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qViaticoValorAuxilioTotal: TFloatField;
    qViaticoValorViaticoMasAuxilio: TFloatField;
    qViaticoAUXILIOZONA: TStringField;
    qViaticoValorViaticoOAuxilioDiario: TFloatField;
    qOdtNOTAS: TMemoField;
    Label27: TLabel;
    dbEdFechaInicio: TDBEdit;
    Label28: TLabel;
    dbEdFechaFin: TDBEdit;
    sbFechaInicio: TSpeedButton;
    sbFechaFin: TSpeedButton;
    qViaticoTIPOVIATICO: TStringField;
    qOdtCODIGOODTLETRA: TStringField;
    procedure sbImprimirClick(Sender: TObject);
    procedure qViaticoAfterInsert(DataSet: TDataSet);
    procedure qViaticoAfterPost(DataSet: TDataSet);
    procedure qViaticoAfterOpen(DataSet: TDataSet);
    procedure qEmpleadoAfterOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbAceptarClick(Sender: TObject);
    procedure bbCancelarClick(Sender: TObject);
    procedure qViaticoVALORPASAJESValidate(Sender: TField);
    procedure sbAsociarVehiculoClick(Sender: TObject);
    procedure qGasolinaAfterPost(DataSet: TDataSet);
    procedure qPeajeAfterPost(DataSet: TDataSet);
    procedure qParqueoAfterPost(DataSet: TDataSet);
    procedure qPasajeAfterPost(DataSet: TDataSet);
    procedure qPasajeAfterInsert(DataSet: TDataSet);
    procedure qParqueoAfterInsert(DataSet: TDataSet);
    procedure qPeajeAfterInsert(DataSet: TDataSet);
    procedure qGasolinaAfterInsert(DataSet: TDataSet);
    procedure dbEdGasolinaExit(Sender: TObject);
    procedure qViaticoCalcFields(DataSet: TDataSet);
    procedure VALORIMPUTACIONSetText(Sender: TField;
      const Text: String);
    procedure qViaticoPLACAVEHICULOChange(Sender: TField);
    procedure dbEdAuxilioViajeExit(Sender: TObject);
    procedure qAuxilioViajeVALORIMPUTACIONSetText(Sender: TField;
      const Text: String);
    procedure qAuxilioViajeAfterDelete(DataSet: TDataSet);
    procedure qAuxilioViajeAfterInsert(DataSet: TDataSet);
    procedure qAuxilioViajeAfterPost(DataSet: TDataSet);
    procedure qTiqueteViaticoAfterDelete(DataSet: TDataSet);
    procedure qTiqueteViaticoAfterInsert(DataSet: TDataSet);
    procedure qTiqueteViaticoAfterPost(DataSet: TDataSet);
    procedure qViaticoFECHAINICIOValidate(Sender: TField);
    procedure qViaticoFECHAFINValidate(Sender: TField);
    procedure qViaticoCODIGOVEHICULOValidate(Sender: TField);
    procedure dbchbCiudadCapitalMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure qViaticoCIUDADCAPITALChange(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure qViaticoCODIGOMUNICIPIODESTINOValidate(Sender: TField);
    procedure qViaticoCODIGOMUNICIPIODESTINOChange(Sender: TField);
    procedure qRepVehiculoAfterInsert(DataSet: TDataSet);
    procedure qRepVehiculoAfterPost(DataSet: TDataSet);
    procedure qRepVehiculoVALORIMPUTACIONSetText(Sender: TField;
      const Text: String);
    procedure qPeajeVALORIMPUTACIONValidate(Sender: TField);
    procedure qGasolinaVALORIMPUTACIONValidate(Sender: TField);
    procedure qParqueoVALORIMPUTACIONValidate(Sender: TField);
    procedure qRepVehiculoVALORIMPUTACIONValidate(Sender: TField);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qViaticoEscalaAfterInsert(DataSet: TDataSet);
    procedure qViaticoEscalaBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure qViaticoDIFICILACCESOValidate(Sender: TField);
    procedure qViaticoFECHAINICIOChange(Sender: TField);
    procedure qViaticoFECHAFINChange(Sender: TField);
    procedure qViaticoDIASPAGADOSValidate(Sender: TField);
    procedure qEmpleadoCalcFields(DataSet: TDataSet);
    procedure sbBuscarCIGClick(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure qViaticoCODIGOGEOGRAFICOValidate(Sender: TField);
    procedure qViaticoCODIGOGEOGRAFICOChange(Sender: TField);
    procedure qViaticoVALORDIARIOChange(Sender: TField);
    procedure qViaticoMODIFICADOChange(Sender: TField);
    procedure qViaticoCODIGOEMPLEADOChange(Sender: TField);
    procedure qAuxilioDirectivoAfterInsert(DataSet: TDataSet);
    procedure qAuxilioDirectivoAfterPost(DataSet: TDataSet);
    procedure sbFechaFinClick(Sender: TObject);
    procedure qOdtCalcFields(DataSet: TDataSet);
    procedure sbFechaInicioClick(Sender: TObject);
  private
    sFecha, Fecha:string;
    function calcularValorEscalasViaticos:double;
    procedure ValidarAuxilioACapital;
  public
    { Public declarations }
    bDatosIncompletos, bCancelando: Boolean;
    error:String;
    Editable,Modificado:boolean;
    procedure CalculaTotalTransporte;
    procedure CalculaTotalComision;
    function validarFechaViatico(var odts:string):boolean;
    function validarFechaAuxilio(var odts:string):boolean;
    function AreaInfluencia:boolean;
    function PernoctaAreaInfluencia:boolean;
    procedure EliminarRegistrosDetalleNulo;
    function ValidarViaticoCausado:boolean;
    procedure InhabilitarCambios;
  end;

var
  FODTGastosComision: TFODTGastosComision;

implementation

uses uQRViaticos, uOdtVehiculo, ConsDll, uFormaFecha, 
  uFuncionSGD, uFIMPComunes, UqrODTGastosComision;

{$R *.DFM}

procedure TFODTGastosComision.sbImprimirClick(Sender: TObject);
var
  Query:TQuery;
  escalas:string;
  total:double;
begin
  Query:=TQuery.Create(self);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT CODIGOTIPOUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+Inttostr(VarCodigoUsuario);
  Query.Open;
  if (qViaticoFECHAPAGOVIATICO.AsString='')or(Query.fields[0].asstring='0')or(qViaticoIMPRESOVIATICO.AsString='') then
  begin
  //Solo deja imprimir una vez a menos que sea ADMINISTRADOR
    FqrODTGastosComision:=TFqrODTGastosComision.Create(Application);
    qOdtFECHAFINAL.asstring;
    with FqrODTGastosComision do
    begin
      qrFechaFinODT.caption:=  datetimetostr(qOdtFECHAFINAL.asdatetime);
      qrViatico.DataSet:=qViatico;
      qrdbDependencia.DataSet:=qCia;
      qrdbDependencia.DataField:='NOMBRECATEGORIA';
      qrdbCIA.DataSet:=qCia;
      qrdbCIA.DataField:='CODIGOADMINISTRATIVO';      
      qrdbNombreEmpleado.DataSet:=qEmpleado;
      qrdbNombreEmpleado.DataField:='NOMBREEMPLEADO';
      qrdbSalario.DataSet:=qSueldo;
      qrdbSalario.DataField:='SUELDO';
      {qrdbComision.DataSet:=qViatico;
      qrdbComision.DataField:='CODIGOCOMISION'; }
      qrdbCedula.DataSet:=qViatico;
      qrdbCedula.DataField:='CODIGOEMPLEADO';
      qrdbViaticoDiario.DataSet:=qViatico;
      qrdbViaticoDiario.DataField:='VALORDIARIO';
     { qrdbMotivoViaje.DataSet:=qOdt;
      qrdbMotivoViaje.DataField:='MOTIVOS';   }
      qrdbCodigoODT.DataSet:=qOdt;
      qrdbCodigoODT.DataField:='CODIGOODT';

      qrdbMunicipioOrigen.DataSet:=qZonaOrigen;
      qrdbMunicipioOrigen.DataField:='NOMBREZONA';

      qrdbMunicipioDestino.dataset:= qviatico;
      qrdbMunicipioDestino.DataField:='DESTINO';

      qrdbCodigoODTletra.DataSet:=qOdt;
      qrdbCodigoODTletra.DataField:='CODIGOODTLETRA';

      qrlDestino.Caption:=dbEdMunicipioDestino.Text;
      
      qDetalleVehiculo.close;
      qDetalleVehiculo.DataSource:=dsViatico;
      qDetalleVehiculo.open;
      qViaticoDetalle.DataSet:=qDetalleVehiculo;

      total:=0;
      qTotal.close;
      qTotal.SQL.Clear;
      qTotal.SQL.text:='Select nvl(sum(valorimputacion),0) total from ('+
                       qDetalleVehiculo.sql.text+')';
      qTotal.DataSource:=dsViatico;
      qTotal.open;
      total:=qTotal.Fields[0].asFloat;

      qrlTranspporte.Caption:='$ '+ FormatFloat('###,###,###',qTotal.Fields[0].asFloat);

      qTiquete.close;
      qTiquete.DataSource:=dsViatico;
      qTiquete.open;
      qrViaticoTiquete.DataSet:=qTiquete;

      qTotal.close;
      qTotal.SQL.Clear;
      qTotal.SQL.text:='Select nvl(sum(valortiquete),0) total from ('+
                       qTiquete.sql.text+')';
      qTotal.DataSource:=dsViatico;
      qTotal.open;
      total:=total+qTotal.Fields[0].asFloat;

      qrlpasajes.Caption:='$ '+ FormatFloat('###,###,###',qTotal.Fields[0].asFloat);
      qTotal.close;
      
      qAuxilio.close;
      qAuxilio.DataSource:=dsViatico;
      qAuxilio.open;
      qrAuxilio.DataSet:=qAuxilio;
      if qAuxilio.IsEmpty then
        qrlAuxilio.caption:='$ 0'
      else
      begin
        total:=Total+qAuxilioVALORIMPUTACION.asFloat;
        qrlAuxilio.caption:='$ '+FormatFloat('###,###,###',qAuxilioVALORIMPUTACION.asFloat);
      end;

      qrlTotal.Caption:='$ '+ FormatFloat('###,###,###',total);
      qrViatico.Preview;
    end;



  end
  else
    Application.MessageBox(pchar('Este viático ya fue pagado'),pchar('Información'),MB_OK);
  Query.Close;
  Query.Free;
end;

procedure TFODTGastosComision.qViaticoAfterInsert(DataSet: TDataSet);
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
  qOdtVehiculo.Close;
  qOdtVehiculo.Open;
  if qOdtVehiculo.RecordCount>0 then
  begin
    DataSet.FieldByName('USOVEHICULO').AsString:='S';
    DataSet.FieldByName('CODIGOVEHICULO').AsString:=qOdtVehiculo.FieldbyName('CODIGOVEHICULO').AsString;
    if qOdtVehiculo.FieldByName('CODIGOPROPIETARIO').AsString='1' then
      DataSet.FieldByName('VEHICULOOFICIAL').AsString:='S'
    else
      DataSet.FieldByName('VEHICULOOFICIAL').AsString:='N';
  end
  else
  begin
    DataSet.FieldByName('USOVEHICULO').AsString:='N';
  end;
  Query.Free;
  DataSet.FieldByName('CIUDADCAPITAL').AsString:='N';
  DataSet.FieldByName('DIFICILACCESO').AsString:='N';  
end;

procedure TFODTGastosComision.qViaticoAfterPost(DataSet: TDataSet);
begin
  qViatico.ApplyUpdates;
  qViatico.CommitUpdates;
end;

procedure TFODTGastosComision.qViaticoAfterOpen(DataSet: TDataSet);
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
    qViaticoDiario.Open;
    qTipoTiquete.Close;
    qTipoTiquete.Open;
    qOdtVehiculo.Close;
    qOdtVehiculo.Open;
    qPropietarioVehiculo.Close;
    qPropietarioVehiculo.Open;

    qGasolina.Close;
    qGasolina.Open;
    If qGasolina.RecordCount > 0
    then qGasolina.Edit
    else qGasolina.Insert;

    qPeaje.Close;
    qPeaje.Open;
    If qPeaje.RecordCount > 0
    then qPeaje.Edit
    else qPeaje.Insert;

    qParqueo.Close;
    qParqueo.Open;
    If qParqueo.RecordCount > 0
    then qParqueo.Edit
    else qParqueo.Insert;

    qRepVehiculo.Close;
    qRepVehiculo.Open;
     If qRepVehiculo.RecordCount > 0
    then qRepVehiculo.Edit
    else qRepVehiculo.Insert;

    qPasaje.Close;
    qPasaje.Open;
     If qPasaje.RecordCount > 0
    then qPasaje.Edit
    else qPasaje.Insert;

    qAuxilioViaje.Close;
    qAuxilioViaje.Open;
     If qAuxilioViaje.RecordCount > 0
    then qAuxilioViaje.Edit
    else qAuxilioViaje.Insert;

    qAuxilioDirectivo.Close;
    qAuxilioDirectivo.Open;
     If qAuxilioDirectivo.RecordCount > 0
    then qAuxilioDirectivo.Edit
    else qAuxilioDirectivo.Insert;
    qTiqueteViatico.Close;
    qTiqueteViatico.Open;

    CalculaTotalTransporte;
    CalculaTotalComision;
  end;
end;

procedure TFODTGastosComision.qEmpleadoAfterOpen(DataSet: TDataSet);
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

procedure TFODTGastosComision.FormKeyPress(Sender: TObject; var Key: Char);
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
     end
end;

procedure TFODTGastosComision.bbAceptarClick(Sender: TObject);
var odts:string;
begin
  bDatosIncompletos := False;
  try
    if qViatico.State in [dsEdit,dsInsert] then
    begin
      if (qViaticoFECHAINICIO.AsString='') and (qViaticoFECHAFIN.AsString='') then
        Raise Exception.Create('Debe ingresar las Fechas de inicio y fin del viático.');
      if qViaticoDESTINO.AsString='' then
      begin
        if ((dbEdMunicipioDestino.Text<> '')) then
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
      qPeajeVALORIMPUTACIONValidate(qPeajeVALORIMPUTACION);
      qGasolinaVALORIMPUTACIONValidate(qGasolinaVALORIMPUTACION);
      qParqueoVALORIMPUTACIONValidate(qParqueoVALORIMPUTACION);
    end;
    if not (validarFechaViatico(odts)) then
    begin
      if (Application.MessageBox(pchar('Ya existen viáticos para el empleado en esas fechas,'+char(13)
      +'Odt:'+odts+'. Desea Corregir el viático'),pchar('Error'),MB_YESNO)=IDyes) then
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

    {if not (validarFechaAuxilio(odts)) then
    begin
      if (Application.MessageBox(pchar('Ya existen auxilios para el empleado en esas fechas,'+char(13)
      +'Odt:'+odts+'. Desea Corregir el viático'),pchar('Error'),MB_YESNO)=IDyes) then
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
    end;}

    if not (ValidarViaticoCausado)then
    begin
      if (Application.MessageBox(pchar('No se permite liquidar Gastos que no han sido causados.'+char(13)
          +'Desea Corregir el registro'),pchar('Error'),MB_YESNO)=IDyes) then
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
    {if AreaInfluencia then
    begin
      if (qViaticoDIFICILACCESO.AsString<>'S') then
      begin
        if not(PernoctaAreaInfluencia) then
        begin
          Application.MessageBox(pchar('Este viático no puede ser guardado puesto que no pernocta en el área de influencia'),pchar('Error'),MB_YESNO);
          ModalResult:=0;
          Exit;
        end;
      end;
    end; }
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

procedure TFODTGastosComision.CalculaTotalTransporte;
var
  SavePlace: TBookMark;
  ValorPasaje: Extended;
begin
  if qGasolina.Active and qPeaje.Active and qParqueo.Active and qPasaje.Active then
  begin
    SavePlace:=qTiqueteViatico.GetBookmark;
    qTiqueteViatico.First;
    ValorPasaje:=0;
    while not qTiqueteViatico.Eof do
    begin
      ValorPasaje:= ValorPasaje + qTiqueteViaticoVALORTIQUETE.AsFloat;
      qTiqueteViatico.Next;                                                                                            
    end;
    qTiqueteViatico.GotoBookmark(SavePlace);
    qPasaje.Edit;
    qPasajeVALORIMPUTACION.AsFloat:=ValorPasaje;
    CETotalTransporte.Value :=   round(qGasolinaVALORIMPUTACION.AsFloat + qPeajeVALORIMPUTACION.AsFloat +
    qParqueoVALORIMPUTACION.AsFloat+qRepVehiculoVALORIMPUTACION.AsFloat + qPasajeVALORIMPUTACION.AsFloat);
    CalculaTotalComision;
  end;
end;

procedure TFODTGastosComision.CalculaTotalComision;
begin
  CETotalComision.Value:= qViaticoValorViaticoMasAuxilio.AsFloat + CETotalTransporte.Value
  + round(qAuxilioViajeVALORIMPUTACION.AsFloat);
end;

procedure TFODTGastosComision.bbCancelarClick(Sender: TObject);
begin
  if MessageDlg('Perderá los cambios realizados.Esta seguro de Cancelar?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    try
      if qViatico.CachedUpdates then
      begin
        qGasolina.Cancel;
        if qGasolina.UpdatesPending then
          qGasolina.CancelUpdates;

        qPeaje.Cancel;
        if qPeaje.UpdatesPending then
          qPeaje.CancelUpdates;

        qPasaje.Cancel;
        if qPasaje.UpdatesPending then
          qPasaje.CancelUpdates;

        qParqueo.Cancel;
        if qParqueo.UpdatesPending then
          qParqueo.CancelUpdates;

        qRepVehiculo.Cancel;
        if qRepVehiculo.UpdatesPending then
          qRepVehiculo.CancelUpdates;

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

procedure TFODTGastosComision.qViaticoVALORPASAJESValidate(Sender: TField);
begin
  if (Sender.Text <> '' ) and (qViatico.FieldByName('TIQUETEIDA').AsString='') and (qViatico.FieldByName('TIQUETEVUELTA').AsString='') then
    raise Exception.Create('Debe ingresar los No. de Tiquetes de Ida y Vuelta antes de ingresar el valor de Pasajes');
end;

procedure TFODTGastosComision.sbAsociarVehiculoClick(Sender: TObject);
begin
  qOdtVehiculo.Close;
  qOdtVehiculo.Open;
  if qOdtVehiculo.RecordCount>0 then
  begin
    FOdtVehiculo:=TFOdtVehiculo.Create(Application);
    FOdtVehiculo.DBGridOdtVehiculo.DataSource:=dsOdtVehiculo;
    if FOdtVehiculo.ShowModal =mrOk then
    begin
      qViaticoCODIGOVEHICULO.AsString:=qOdtVehiculoCODIGOVEHICULO.AsString;
    end;
    FOdtVehiculo.Free;
  end
  else
    Application.MessageBox(PChar('No hay Vehículos asociados a la ODT'),PChar('Error'),MB_OK);
end;

procedure TFODTGastosComision.qGasolinaAfterPost(DataSet: TDataSet);
begin
  qGasolina.ApplyUpdates;
  qGasolina.CommitUpdates;
  qGasolina.Edit;
end;

procedure TFODTGastosComision.qPeajeAfterPost(DataSet: TDataSet);
begin
  qPeaje.ApplyUpdates;
  qPeaje.CommitUpdates;
  qPeaje.Edit;
end;

procedure TFODTGastosComision.qParqueoAfterPost(DataSet: TDataSet);
begin
  qParqueo.ApplyUpdates;
  qParqueo.CommitUpdates;
  qParqueo.Edit;
end;

procedure TFODTGastosComision.qPasajeAfterPost(DataSet: TDataSet);
begin
  qPasaje.ApplyUpdates;
  qPasaje.CommitUpdates;
  qPasaje.Edit;
end;

procedure TFODTGastosComision.qPasajeAfterInsert(DataSet: TDataSet);
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
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''PAS''');
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFODTGastosComision.qParqueoAfterInsert(DataSet: TDataSet);
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
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''PAR''');
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFODTGastosComision.qPeajeAfterInsert(DataSet: TDataSet);
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
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''PEA''');
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFODTGastosComision.qGasolinaAfterInsert(DataSet: TDataSet);
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
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''GAS''');
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFODTGastosComision.dbEdGasolinaExit(Sender: TObject);
begin
  CalculaTotalTransporte;
end;

procedure TFODTGastosComision.qViaticoCalcFields(DataSet: TDataSet);
begin
  if qViaticoCodigoZonaDestino.AsString<>'' then
    qViaticocodigozona.AsString:=qViaticoCodigoZonaDestino.AsString
  else
    qViaticocodigozona.AsString:='8';

  qViaticoDias.AsInteger:=trunc(qViaticoFECHAFIN.AsDateTime) - trunc(qViaticoFECHAINICIO.AsDateTime)+1;
  if ((qViaticoNivel.AsInteger>0) or (qViaticoSueldo.AsFloat>qViaticoDiarioSALARIOLIMITEVIATICO.AsFloat))
  and (qViaticoCodigoZona.AsString<>'8')
  and ((qViaticoDiarioSALARIOLIMITEVIATICO.asinteger>0)and(qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.asinteger>0)) then
  begin
    qViaticoValorAuxilioDiario.AsFloat:=qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.AsFloat;
    qViaticoValorViaticooAuxilioDiario.AsFloat:=qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.AsFloat;
  end
  else
  begin
    qViaticoValorViaticooAuxilioDiario.AsFloat:=qViaticoDiarioVALORVIATICO.AsFloat;
    qViaticoValorAuxilioDiario.AsFloat:=0;
  end;

  if (qViaticoFECHAFIN.AsDateTime)=trunc(qViaticoFECHAFIN.AsDateTime) then qViaticoDias.AsInteger:= qViaticoDias.AsInteger-1;


  qViaticoValorAuxilioTotal.AsFloat:=round(qViaticoDias.AsFloat *qViaticoValorAuxilioDiario.asfloat);
  qViaticoValorViaticoMasAuxilio.AsFloat:=qViaticoValorAuxilioTotal.AsFloat;
  
  if (qAuxilioDirectivo.Active) and (qAuxilioDirectivo.CachedUpdates) then
  begin
    qAuxilioDirectivo.Edit;
    qAuxilioDirectivoVALORIMPUTACION.AsFloat:=qViaticoValorAuxilioTotal.AsFloat;
    qAuxilioDirectivo.Post;
  end;

  CalculaTotalComision;
  qViaticoAnoInicio.AsDateTime:=qViaticoFECHAINICIO.AsDateTime;
  qViaticoMesInicio.AsDateTime:=qViaticoFECHAINICIO.AsDateTime;
  qViaticoDiaInicio.AsDateTime:=qViaticoFECHAINICIO.AsDateTime;
  qViaticoAnoFin.AsDateTime:=qViaticoFECHAFIN.AsDateTime;
  qViaticoMesFin.AsDateTime:=qViaticoFECHAFIN.AsDateTime;
  qViaticoDiaFin.AsDateTime:=qViaticoFECHAFIN.AsDateTime;

  qViaticoCodigoBarra.AsString:='*'+qViaticoNUMEROIMPRESION.AsString+'*';
end;

procedure TFODTGastosComision.VALORIMPUTACIONSetText(Sender: TField;
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

procedure TFODTGastosComision.qViaticoPLACAVEHICULOChange(Sender: TField);
begin
  if qPropietarioVehiculo.active then
  begin
    if qPropietarioVehiculo.RecordCount>0 then
    begin
      if qPropietarioVehiculo.FieldByName('CODIGOPROPIETARIO').AsString='1' then
        qViaticoVEHICULOOFICIAL.AsString:='S'
      else
        qViaticoVEHICULOOFICIAL.AsString:='N';
    end;
  end;
  if (Sender.AsString<>'') then
  begin
    qViaticoUSOVEHICULO.AsString:='S';
    if qAuxilioViaje.Active then
    begin
      qAuxilioViaje.Edit;
      qAuxilioViajeVALORIMPUTACION.AsFloat:= 0;
      qAuxilioViaje.Post;
    end;
  end
  else
  begin
    if qPeaje.Active then
    begin
      qPeaje.Edit;
      qPeajeVALORIMPUTACION.AsFloat:= 0;
      qPeaje.Post;
    end;
    if qParqueo.Active then
    begin
      qParqueo.Edit;
      qParqueoVALORIMPUTACION.AsFloat:= 0;
      qParqueo.Post;
    end;
    if qGasolina.Active then
    begin
      qGasolina.Edit;
      qGasolinaVALORIMPUTACION.AsFloat:= 0;
      qGasolina.Post;
    end;
    if qRepVehiculo.Active then
    begin
      qRepVehiculo.Edit;
      qRepVehiculoVALORIMPUTACION.AsFloat:= 0;
      qRepVehiculo.Post;
    end;
  end;
end;

procedure TFODTGastosComision.dbEdAuxilioViajeExit(Sender: TObject);
begin
  CalculaTotalComision;
end;

procedure TFODTGastosComision.qAuxilioViajeVALORIMPUTACIONSetText(Sender: TField;
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

procedure TFODTGastosComision.qAuxilioViajeAfterDelete(DataSet: TDataSet);
begin
  qAuxilioViaje.ApplyUpdates;
  qAuxilioViaje.CommitUpdates;
  qAuxilioViaje.Edit;
end;

procedure TFODTGastosComision.qAuxilioViajeAfterInsert(DataSet: TDataSet);
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

procedure TFODTGastosComision.qAuxilioViajeAfterPost(DataSet: TDataSet);
begin
  qAuxilioViaje.ApplyUpdates;
  qAuxilioViaje.CommitUpdates;
  qAuxilioViaje.Edit;
end;

procedure TFODTGastosComision.qTiqueteViaticoAfterDelete(DataSet: TDataSet);
begin
  qTiqueteViatico.ApplyUpdates;
  qTiqueteViatico.CommitUpdates;
  qTiqueteViatico.Edit;
end;

procedure TFODTGastosComision.qTiqueteViaticoAfterInsert(DataSet: TDataSet);
var Query:TQuery;
begin
  Query:=TQuery.Create(Application);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT SQ_ODTVIATICODETALLETIQUETE.NEXTVAL FROM DUAL';
  Query.Open;
  DataSet.FieldByName('CODIGOVIATICO').AsString:=qViaticoCODIGOVIATICO.AsString;
  DataSet.FieldByName('CODIGOVIATICODETALLETIQUETE').AsInteger:=Query.Fields[0].AsInteger;
  Query.Free;
end;

procedure TFODTGastosComision.qTiqueteViaticoAfterPost(DataSet: TDataSet);
begin
  qTiqueteViatico.ApplyUpdates;
  qTiqueteViatico.CommitUpdates;
  CalculaTotalTransporte;
end;

procedure TFODTGastosComision.qViaticoFECHAINICIOValidate(Sender: TField);
begin
  if qViatico.State =dsEdit then
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


procedure TFODTGastosComision.qViaticoFECHAFINValidate(Sender: TField);
begin
  if qViatico.State =dsEdit then
  begin
    if  (Sender.Text <>'' ) then
    begin
      if  (sender.AsDateTime<qViaticoFECHAINICIO.AsDateTime)  then
        raise Exception.Create('La fecha final del viático no puede ser inferior a la fecha inicial del viático');
      if  (sender.AsDateTime>qOdtFECHAFINAL.AsDateTime)  then
        raise Exception.Create('La fecha final del viático no puede ser superior a la de la odt');

    end;
  end;
end;

procedure TFODTGastosComision.qViaticoCODIGOVEHICULOValidate(Sender: TField);
const alfabeto = ['A'..'Z', 'a'..'z'];
var placa:string;
begin
  if (sender.AsString<>'') then
  begin
    placa:=trim(sender.AsString);
    if length(placa)<5 then
      raise Exception.Create('Placa inválida');
    if (not(placa[1] in alfabeto)) and (not(placa[1] in alfabeto)) then
      raise Exception.Create('Placa inválida');
  end;
end;

procedure TFODTGastosComision.dbchbCiudadCapitalMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Perform(wm_NextDLGCTL, 0, 0);
end;

procedure TFODTGastosComision.qViaticoCIUDADCAPITALChange(Sender: TField);
begin
  if qViatico.State<>dsinsert then
  begin
    qViaticoDiario.Close;
    qViaticoDiario.ParamByName('CIUDADCAPITAL').AsString:=Sender.AsString;
    qViaticoDiario.Open;
    if qAuxilioViaje.Active then
    begin
      qAuxilioViaje.Edit;
      if (Sender.AsString='S') then
      begin
        qAuxilioViajeVALORIMPUTACION.AsFloat:= qViaticoDiarioVALORAUXILIO.AsFloat;
        qViaticoCODIGOVEHICULO.AsString:='';
      end
      else
      begin
        qAuxilioViajeVALORIMPUTACION.AsFloat:= 0;
      end;
      qAuxilioViaje.Post;
    end;
  end;
  Modificado:=true;
end;

procedure TFODTGastosComision.FormShow(Sender: TObject);
var query:Tquery;
begin
  qViaticoDIFICILACCESOvalidate(qViaticoDIFICILACCESO);
//  qViaticoCODIGOMUNICIPIODESTINOValidate(qViaticoCODIGOMUNICIPIODESTINO);
  ValidarAuxilioACapital;
  if qViatico.state in [dsEdit,dsInsert] then
    qViaticoCalcFields(qViatico)
  else
  begin
    qViatico.Edit;
    qViaticoCalcFields(qViatico);
    qViatico.Post;
  end;
  query:=TQuery.Create(self);
  query.DatabaseName:='BaseDato';
  query.sql.text:='select codigoestadoodt from odt where codigoodt='+qViaticoCODIGOODT.AsString;
  query.open;

  if query.fieldbyname('codigoestadoodt').AsString='6' then
    InhabilitarCambios;

  sbImprimir.Enabled:=false;
  query.sql.clear;
  query.sql.add('select IMPRESOGASTOS from odtviatico where codigoviatico='+qViaticoCODIGOVIATICO.AsString);
  query.open;

  if (query.fieldbyname('IMPRESOGASTOS').AsString<>'S')then
    sbImprimir.Enabled:=true
  else
    InhabilitarCambios;

  if qViaticoESTADO.AsString='PRO' then
  begin
    Caption:=Caption+'  *** Solo Lectura(Procesado Por Nómina) ***';
    PanelEncabezado.Enabled:=false;
    PanelGastosTransporte.Enabled:=false;
    InhabilitarCambios;
  end;
  query.free;
  if qViatico.State in [dsEdit,dsInsert] then
  begin
    if ((qViaticoNivel.AsInteger>0) or (qViaticoSueldo.AsFloat>qViaticoDiarioSALARIOLIMITEVIATICO.AsFloat))
    and (qViaticoCODIGOZONA.AsString<>'8')
    and ((qViaticoDiarioSALARIOLIMITEVIATICO.asinteger>0)and(qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.asinteger>0)) then
      qViaticoDiasPagados.AsFloat:=qViaticoDias.Asfloat
    else
      qViaticoDiasPagados.AsFloat:=qViaticoDias.Asfloat + (qViaticoDiarioPORCENTAJEULTIMODIA.AsFloat/100) - 1;
  end;
end;

procedure TFODTGastosComision.qViaticoCODIGOMUNICIPIODESTINOValidate(Sender: TField);
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

procedure TFODTGastosComision.qViaticoCODIGOMUNICIPIODESTINOChange(Sender: TField);
begin
  qMunicipioDestino.Close;
  qMunicipioDestino.Open;
  if qViatico.State in [dsEdit,dsInsert] then
  begin
    qViaticoDESTINO.AsString:=qMunicipioDestinoNOMBREMUNICIPIO.AsString;
    qViaticoCODIGOGEOGRAFICO.AsString:=qMunicipioDestinoCODIGOGEOGRAFICO.AsString;
  end;
end;

procedure TFODTGastosComision.qRepVehiculoAfterInsert(DataSet: TDataSet);
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
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''REP''');
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFODTGastosComision.qRepVehiculoAfterPost(DataSet: TDataSet);
begin
  qRepVehiculo.ApplyUpdates;
  qRepVehiculo.CommitUpdates;
  qRepVehiculo.Edit;
end;

procedure TFODTGastosComision.qRepVehiculoVALORIMPUTACIONSetText(Sender: TField;
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

function TFODTGastosComision.validarFechaViatico(var odts:String): boolean;
var
  query:TQuery;
  FechaInicio,FechaFin:String;
begin
  result:=False;
  odts:='';
  FechaInicio:=FormatDateTime('dd/mm/yyyy hh:nn:ss', qViaticoFECHAINICIO.AsDateTime);
  FechaFin:=FormatDateTime('dd/mm/yyyy hh:nn:ss', qViaticoFECHAFIN.AsDateTime);

  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  query.sql.Add('SELECT CODIGOODT');
  query.sql.Add('FROM ODTVIATICO V');
  query.sql.Add('WHERE V.CODIGOEMPLEADO='+qViaticoCODIGOEMPLEADO.AsString);
  query.sql.Add('AND V.CODIGOVIATICO<>'+qViaticoCODIGOVIATICO.AsString);
  query.sql.Add('AND (((to_date('''+FechaInicio+''',''DD/MM/YYYY HH24:MI:SS'')> V.FECHAINICIO)');
  query.sql.Add('AND (to_date('''+FechaInicio+''',''DD/MM/YYYY HH24:MI:SS'')<= V.FECHAFIN))');
  query.sql.Add('OR((to_date('''+FechaFin+''',''DD/MM/YYYY HH24:MI:SS'')>= V.FECHAINICIO )');
  query.sql.Add('AND(to_date('''+FechaFin+''',''DD/MM/YYYY HH24:MI:SS'')< V.FECHAFIN))');
  query.sql.Add('OR((to_date('''+FechaInicio+''',''DD/MM/YYYY HH24:MI:SS'') <= V.FECHAINICIO )');
  query.sql.Add('AND (to_date('''+FechaFin+''',''DD/MM/YYYY HH24:MI:SS'') >= V.FECHAFIN)) )');
  query.sql.Add('AND ((DEVOLUCION is null) or (DEVOLUCION <>''S''))');
  query.sql.Add('AND V.TIPOVIATICO=''G''');
  //query.SQL.SaveToFile(GetTemporalPath+'sqlFuncion_ValidarFechaViatico_uODTGastosComision.txt');
  query.Open;
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

procedure TFODTGastosComision.qPeajeVALORIMPUTACIONValidate(Sender: TField);
begin
  if Sender.AsInteger>0 then
    if qViaticoCODIGOVEHICULO.AsString='' then Raise Exception.Create('Debe ingresar primero la placa del vehiculo');
end;

procedure TFODTGastosComision.qGasolinaVALORIMPUTACIONValidate(Sender: TField);
begin
  if Sender.AsInteger>0 then
    if qViaticoCODIGOVEHICULO.AsString='' then Raise Exception.Create('Debe ingresar primero la placa del vehiculo');
end;

procedure TFODTGastosComision.qParqueoVALORIMPUTACIONValidate(Sender: TField);
begin
  if Sender.AsInteger>0 then
    if qViaticoCODIGOVEHICULO.AsString='' then Raise Exception.Create('Debe ingresar primero la placa del vehiculo');
end;

procedure TFODTGastosComision.qRepVehiculoVALORIMPUTACIONValidate(Sender: TField);
begin
  if Sender.AsInteger>0 then
    if qViaticoCODIGOVEHICULO.AsString='' then Raise Exception.Create('Debe ingresar primero la placa del vehiculo');
end;

procedure TFODTGastosComision.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not bCancelando then
  begin
    if error<>'' then ShowMessage(error);
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

procedure TFODTGastosComision.qViaticoEscalaAfterInsert(DataSet: TDataSet);
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

procedure TFODTGastosComision.qViaticoEscalaBeforePost(DataSet: TDataSet);
begin

end;

// Calcula el valor de los viaticos a partir de las escalas realizadas
function TFODTGastosComision.calcularValorEscalasViaticos:double;
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

procedure TFODTGastosComision.FormCreate(Sender: TObject);
begin
  qMunicipio.close;
  qMunicipio.open;
  qSueldo.close;
  qSueldo.open;
  Editable:=true;
  Modificado:=false;
end;

procedure TFODTGastosComision.qViaticoDIFICILACCESOValidate(Sender: TField);
begin
  qViaticoVALORDIARIOChange(qViaticoVALORDIARIO);
end;
//valida si el destino es del area de influencia
function TFODTGastosComision.AreaInfluencia: boolean;
begin
  result:=false;
  if (qViaticoCODIGOZONAORIGEN.AsString=qViaticoCodigoZonaDestino.AsString) and
  (qViaticoCODIGOZONAORIGEN.AsString<>'8') then
  begin
    qMunicipioDestino.Close;
    qMunicipioDestino.Open;
    if (qMunicipioDestinoZONAESPECIAL.AsString='S') then
      result:=true;
  end;
end;
//valida si pernocta en el lugar de destino, si este  es del area de influencia
function TFODTGastosComision.PernoctaAreaInfluencia: boolean;
begin
  result:=true;
  if (trunc(qViaticoFECHAINICIO.AsDateTime)=trunc(qViaticoFECHAFIN.AsDateTime)) then
  begin
    result:=false;
  end;
end;

function TFODTGastosComision.validarFechaAuxilio(var odts: string): boolean;
var query:tquery;
  FechaInicio,FechaFin:String;
begin
  result:=false;
  odts:='';
  FechaInicio:=FormatDateTime('dd/mm/yyyy',qViaticoFECHAINICIO.asdatetime);
  FechaFin:=FormatDateTime('dd/mm/yyyy',qViaticoFECHAFIN.asdatetime);
  if not((trunc(qViaticoFECHAFIN.asdatetime))=qViaticoFECHAFIN.asdatetime) then
    fechafin:=FormatDateTime('dd/mm/yyyy',trunc(qViaticoFECHAFIN.asdatetime)+1);
  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  query.sql.Add('SELECT CODIGOODT');
  query.sql.Add('FROM ODTAUXILIO A');
  query.sql.Add('WHERE A.CODIGOEMPLEADO='+qViaticoCODIGOEMPLEADO.AsString);
  query.sql.Add('AND (((to_date('''+FechaInicio+''',''dd/mm/yyyy'')>=A.FECHAINICIO)');
  query.sql.Add('AND (to_date('''+FechaInicio+''',''dd/mm/yyyy'')<A.FECHAFIN))');
  query.sql.Add('OR((to_date('''+FechaFin+''',''dd/mm/yyyy'')>A.FECHAINICIO )');
  query.sql.Add('AND(to_date('''+FechaFin+''',''dd/mm/yyyy'')<=A.FECHAFIN))');
  query.sql.Add('OR((to_date('''+FechaInicio+''',''dd/mm/yyyy'')<A.FECHAINICIO )');
  query.sql.Add('AND (to_date('''+FechaFin+''',''dd/mm/yyyy'')>A.FECHAFIN)) )');
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
end;

procedure TFODTGastosComision.qViaticoFECHAINICIOChange(Sender: TField);
var dias:double;
begin
  dias:=trunc(qViaticoFECHAFIN.AsDateTime) - trunc(qViaticoFECHAINICIO.AsDateTime)+1;
  if (qViaticoFECHAFIN.AsDateTime)=trunc(qViaticoFECHAFIN.AsDateTime)then dias:= qViaticoDias.AsInteger-1;
    if ((qViaticoNivel.AsInteger>0) or (qViaticoSueldo.AsFloat>qViaticoDiarioSALARIOLIMITEVIATICO.AsFloat))
    and(qViaticoCodigoZona.AsString<>'8') then
      qViaticoDiasPagados.AsFloat:=dias
    else
      qViaticoDiasPagados.AsFloat:=dias + (qViaticoDiarioPORCENTAJEULTIMODIA.AsFloat/100) - 1;
  qViaticoCalcFields(qViatico);
  Modificado:=True;
end;

procedure TFODTGastosComision.qViaticoFECHAFINChange(Sender: TField);
var dias:double;
begin
  if (sender.AsDateTime)=trunc(sender.AsDateTime)then
    if (sender.AsDateTime-(1/(24*60)))> qViaticoFECHAINICIO.AsDateTime then
      qViaticoFECHAFIN.AsDateTime := sender.AsDateTime-(1/(24*60));
  dias:=trunc(qViaticoFECHAFIN.AsDateTime) - trunc(qViaticoFECHAINICIO.AsDateTime)+1;
//  if (qViaticoFECHAFIN.AsDateTime)=trunc(qViaticoFECHAFIN.AsDateTime)then dias:= qViaticoDias.AsInteger-1; Cambiado por instrucción que pasa al día anterior
  if ((qViaticoNivel.AsInteger>0) or (qViaticoSueldo.AsFloat>qViaticoDiarioSALARIOLIMITEVIATICO.AsFloat))
  and(qViaticoCodigoZona.AsString<>'8')
  and ((qViaticoDiarioSALARIOLIMITEVIATICO.asinteger>0)and(qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.asinteger>0)) then
    qViaticoDiasPagados.AsFloat:=dias
  else
    qViaticoDiasPagados.AsFloat:=dias + (qViaticoDiarioPORCENTAJEULTIMODIA.AsFloat/100) - 1;
  qViaticoCalcFields(qViatico);
  Modificado:=True;
end;

procedure TFODTGastosComision.qViaticoDIASPAGADOSValidate(Sender: TField);
begin
  if (Sender.asstring<>'') and (qViaticoDias.AsString<>'' )then
  begin
    if (Sender.AsFloat>qViaticoDias.AsFloat) then raise Exception.Create('Los días pagados no pueden ser mas que los días del viático');
  end;
end;

procedure TFODTGastosComision.qEmpleadoCalcFields(DataSet: TDataSet);
var query:tquery;
begin
// Modificado Customer Care 2604 Cambio centro de costo del empleado por centro de costo de la odt 11 agosto 2011
  if qOdt.Active then
  begin
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT F_Tipocecos('+qEmpleadoCODIGOADMINISTRATIVO.AsString+') FROM dual');
    query.Open;

    qEmpleadoTipoCecos.AsString:=query.fields[0].AsString;
    query.free;
  end;
end;

procedure TFODTGastosComision.EliminarRegistrosDetalleNulo;
var query:tquery;
begin
  query:=TQuery.Create(self);
  query.databasename:='BaseDato';
  query.sql.add('DELETE FROM ODTVIATICODETALLE WHERE CODIGOVIATICO='+qViaticoCODIGOVIATICO.AsString);
  query.sql.add('AND VALORIMPUTACION IS NULL');
  query.ExecSQL;
  query.free;
end;

procedure TFODTGastosComision.sbBuscarCIGClick(Sender: TObject);
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

procedure TFODTGastosComision.SpeedButton7Click(Sender: TObject);
begin
  BuscarBarrio(qViaticoCODIGOGEOGRAFICO.AsString,true);
end;

procedure TFODTGastosComision.qViaticoCODIGOGEOGRAFICOValidate(Sender: TField);
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

procedure TFODTGastosComision.qViaticoCODIGOGEOGRAFICOChange(Sender: TField);
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

procedure TFODTGastosComision.qViaticoVALORDIARIOChange(Sender: TField);
begin
  if qViatico.State in [dsEdit,dsInsert] then
  begin
    if Sender.Asfloat>qViaticoDiarioVALORVIATICO.AsFloat then
    begin
      if not (qViaticoDIFICILACCESO.AsString='S')then
        sender.AsFloat:=qViaticoDiarioVALORVIATICO.AsFloat;
    end;
    Modificado:=true;
  end;
end;

function TFODTGastosComision.ValidarViaticoCausado: boolean;
begin
  result:=true;
  if (qViaticoFECHAINICIO.AsDateTime>FechaServidor) or
    (qViaticoFECHAFIN.AsDateTime>FechaServidor) then
    result:=false;
end;

procedure TFODTGastosComision.qViaticoMODIFICADOChange(Sender: TField);
begin
  Modificado:=true;
end;

procedure TFODTGastosComision.qViaticoCODIGOEMPLEADOChange(Sender: TField);
begin
  Modificado:=true;
end;

procedure TFODTGastosComision.InhabilitarCambios;
begin
  Editable:=false;
  bbAceptar.Enabled:=false;
  qViatico.CachedUpdates:=False;
  qViatico.UpdateObject:=nil;
  qPeaje.CachedUpdates:=False;
  qPeaje.UpdateObject:=nil;
  qParqueo.CachedUpdates:=False;
  qParqueo.UpdateObject:=nil;
  qGasolina.CachedUpdates:=False;
  qGasolina.UpdateObject:=nil;
  qPasaje.CachedUpdates:=False;
  qPasaje.UpdateObject:=nil;
  qRepVehiculo.CachedUpdates:=False;
  qRepVehiculo.UpdateObject:=nil;
  qTiqueteViatico.CachedUpdates:=False;
  qTiqueteViatico.UpdateObject:=nil;
  sbFechaInicio.Enabled:=false;
  sbFechaFin.Enabled:=False;
  bbCancelar.Enabled:=False;
end;

procedure TFODTGastosComision.qAuxilioDirectivoAfterInsert(DataSet: TDataSet);
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

procedure TFODTGastosComision.qAuxilioDirectivoAfterPost(DataSet: TDataSet);
begin
  qAuxilioDirectivo.ApplyUpdates;
  qAuxilioDirectivo.CommitUpdates;
  qAuxilioDirectivo.Edit;
end;

procedure TFODTGastosComision.ValidarAuxilioACapital;
var query:tquery;
begin
  query:=TQuery.create(self);
  query.DatabaseName:='BaseDato';
  query.sql.add('(SELECT VZ.* FROM VIATICOZONA VZ');
  query.sql.add('WHERE VZ.CODIGOZONADESTINO=:CODIGOZONA');
  query.sql.add('AND VZ.CODIGOZONAORIGEN=:CODIGOZONAORIGEN');
  query.sql.add('AND VZ.CIUDADCAPITAL=''S''');
  query.sql.add('AND VZ.VIGENCIADESDE<=:FECHAINICIO');
  query.sql.add('AND VZ.VIGENCIAHASTA>=:FECHAINICIO)');
  query.sql.add('UNION');
  query.sql.add('(SELECT VZ.* FROM VIATICOZONA VZ');
  query.sql.add('WHERE VZ.CODIGOZONAORIGEN=:CODIGOZONAORIGEN');
  query.sql.add('AND VZ.CODIGOZONADESTINO=:CODIGOZONA');
  query.sql.add('AND VZ.VIGENCIADESDE<=:FECHAINICIO');
  query.sql.add('AND VZ.VIGENCIAHASTA>=:FECHAINICIO');
  query.sql.add('AND VZ.CIUDADCAPITAL=''S''');
  query.sql.add('AND VZ.SALARIODESDE<=:SUELDO');
  query.sql.add('AND VZ.SALARIOHASTA>=:SUELDO');
  query.sql.add('AND :NIVEL IS NULL');
  query.sql.add(')');
  query.sql.add('UNION');
  query.sql.add('(SELECT VZ.* FROM VIATICOZONA VZ');
  query.sql.add('WHERE VZ.CODIGOZONAORIGEN=:CODIGOZONAORIGEN');
  query.sql.add('AND VZ.CODIGOZONADESTINO=:CODIGOZONA');
  query.sql.add('AND VZ.VIGENCIADESDE<=:FECHAINICIO');
  query.sql.add('AND VZ.VIGENCIAHASTA>=:FECHAINICIO');
  query.sql.add('AND VZ.NIVELCARGO=:NIVEL ');
  query.sql.add('AND VZ.CIUDADCAPITAL=''S''');
  query.sql.add(')');
  query.DataSource:=dsViatico;
  query.open;
  if (query.IsEmpty) then
  begin
    dbchbCiudadCapital.ReadOnly:=true;
  end
  else
  begin
    dbchbCiudadCapital.ReadOnly:=false;
  end;
  query.close;
  query.free;
end;

procedure TFODTGastosComision.sbFechaFinClick(Sender: TObject);
begin
  try
    dbEdFechaFin.Setfocus;
    sFecha := dbEdFechaFin.Text;
    Fecha := GetFecha(true,Sfecha);
    if Fecha <> '' then dbEdFechaFin.Text := Fecha;
  except
  end;
end;

procedure TFODTGastosComision.qOdtCalcFields(DataSet: TDataSet);
begin
qOdtCODIGOODTLETRA.AsString:= qOdtCODIGOODT.AsString+'-C';
end;

procedure TFODTGastosComision.sbFechaInicioClick(Sender: TObject);
begin
  try
    dbEdFechaInicio.Setfocus;
    sFecha := dbEdFechaInicio.Text;
    Fecha := GetFecha(true,Sfecha);
    if Fecha <> '' then dbEdFechaInicio.Text := Fecha;
  except
  end;
end;

end.



 