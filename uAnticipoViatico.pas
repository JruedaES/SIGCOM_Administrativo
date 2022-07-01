unit uAnticipoViatico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, Digisoft,
  Grids, DBGrids, ToolEdit, CurrEdit, Menus,UComunesAdministrativo;

type

  TFAnticipoViatico = class(TForm)
    pInferior: TPanel;
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    sbImprimir: TSpeedButton;
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
    Label18: TLabel;
    DBMemoMotivoOdt: TDBMemo;
    Label29: TLabel;
    dbEdDias: TDBEdit;
    Label6: TLabel;
    dbEdSueldo: TDBEdit;
    Label8: TLabel;
    dbEdViaticoDiario: TDBEdit;
    Panel6: TPanel;
    Label19: TLabel;
    dbEdComision: TDBEdit;
    Label10: TLabel;
    dbEdValorViatico: TDBEdit;
    Label31: TLabel;
    dbEdAuxilioViaje: TDBEdit;
    Label32: TLabel;
    dbEdZonaOrigen: TDBEdit;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    qViatico: TQuery;
    qViaticoDias: TIntegerField;
    qViaticoValorViatico: TFloatField;
    qViaticoDiasPagados: TFloatField;
    qViaticoCODIGOVIATICO: TFloatField;
    qViaticoCODIGOEMPLEADO: TFloatField;
    qViaticoCODIGOODT: TFloatField;
    qViaticoCODIGOCOMISION: TFloatField;
    qViaticoFECHAINICIO: TDateTimeField;
    qViaticoFECHAFIN: TDateTimeField;
    qViaticoUSOVEHICULO: TStringField;
    qViaticoVEHICULOOFICIAL: TStringField;
    qViaticoAnoInicio: TDateField;
    qViaticoMesInicio: TDateField;
    qViaticoDiaInicio: TDateField;
    qViaticoAnoFin: TDateField;
    qViaticoMesFin: TDateField;
    qViaticoDiaFin: TDateField;
    qViaticoCODIGOZONAORIGEN: TFloatField;
    qViaticoCODIGOMUNICIPIODESTINO: TFloatField;
    qViaticoCODIGOVEHICULO: TStringField;
    qViaticoFECHAPAGOANTICIPO: TDateTimeField;
    qViaticoFECHAPAGOVIATICO: TDateTimeField;
    qViaticoANTICIPO: TStringField;
    qViaticoPORCENTAJEANTICIPO: TFloatField;
    qViaticoDIASPROYECTADOS: TFloatField;
    qViaticoVALORANTICIPO: TFloatField;
    qViaticoCIUDADCAPITAL: TStringField;
    qViaticoCodigoZonaDestino: TIntegerField;
    qViaticoSueldo: TFloatField;
    qViaticoNivel: TIntegerField;
    qViaticoCodigoZona: TIntegerField;
    qViaticoDESTINO: TStringField;
    qViaticoESTADO: TStringField;
    qEmpleado: TQuery;
    qEmpleadoCODIGOEMPLEADO: TFloatField;
    qEmpleadoNOMBREEMPLEADO: TStringField;
    qEmpleadoDIRECCION: TStringField;
    qEmpleadoBARRIO: TStringField;
    qEmpleadoTELEFONO: TStringField;
    qEmpleadoCODIGOSUELDO: TStringField;
    qEmpleadoCODIGOADMINISTRATIVO: TFloatField;
    qEmpleadoREFERENCIA: TStringField;
    qEmpleadoCODIGOCONTRATISTA: TStringField;
    qEmpleadoCODIGOCARGO: TFloatField;
    qEmpleadoNivel: TIntegerField;
    dsEmpleado: TDataSource;
    qSueldo: TQuery;
    qSueldoCODIGO: TStringField;
    qSueldoSUELDO: TFloatField;
    dsSueldo: TDataSource;
    dsViatico: TDataSource;
    dsCia: TDataSource;
    qCia: TQuery;
    qOdt: TQuery;
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
    qOdtCODIGOAREAINFLUENCIA: TStringField;
    dsOdt: TDataSource;
    qViaticoDiario: TQuery;
    qViaticoDiarioCODIGOVIATICOZONA: TFloatField;
    qViaticoDiarioCODIGOZONAORIGEN: TFloatField;
    qViaticoDiarioCODIGOZONADESTINO: TFloatField;
    qViaticoDiarioVALORVIATICO: TFloatField;
    qViaticoDiarioVALORAUXILIO: TFloatField;
    qViaticoDiarioPORCENTAJESALARIO: TFloatField;
    qViaticoDiarioPORCENTAJEULTIMODIA: TFloatField;
    dsViaticoDiario: TDataSource;
    qMunicipioDestino: TQuery;
    qMunicipioDestinoCODIGOMUNICIPIO: TFloatField;
    qMunicipioDestinoNOMBREMUNICIPIO: TStringField;
    qMunicipioDestinoCODIGOZONA: TFloatField;
    qMunicipioDestinoCODIGO_CUENTA: TFloatField;
    qMunicipioDestinoZONAESPECIAL: TStringField;
    qMunicipioDestinoNOMBREZONA: TStringField;
    dsMunicipioDestino: TDataSource;
    updViatico: TUpdateSQL;
    dsTipoTiquete: TDataSource;
    qTipoTiquete: TQuery;
    qTipoTiqueteCODIGOTIPOTIQUETE: TStringField;
    qTipoTiqueteDESCRIPCION: TStringField;
    qOdtVehiculo: TQuery;
    qOdtVehiculoCODIGOODT: TFloatField;
    qOdtVehiculoCONSECUTIVO: TFloatField;
    qOdtVehiculoCODIGOVEHICULO: TStringField;
    qOdtVehiculoCODIGOPROPIETARIO: TStringField;
    qOdtVehiculoNOMBREPROPIETARIO: TStringField;
    dsOdtVehiculo: TDataSource;
    qGasolina: TQuery;
    qGasolinaCODIGOVIATICODETALLE: TFloatField;
    qGasolinaCODIGOVIATICO: TFloatField;
    qGasolinaCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qGasolinaVALORIMPUTACION: TFloatField;
    qGasolinaNUMEROIMPUTACION: TFloatField;
    qGasolinaAUXILIAR: TFloatField;
    qGasolinaDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    dsGasolina: TDataSource;
    updGasolina: TUpdateSQL;
    qPeaje: TQuery;
    qPeajeCODIGOVIATICODETALLE: TFloatField;
    qPeajeCODIGOVIATICO: TFloatField;
    qPeajeCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qPeajeVALORIMPUTACION: TFloatField;
    qPeajeNUMEROIMPUTACION: TFloatField;
    qPeajeAUXILIAR: TFloatField;
    qPeajeDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    dsPeaje: TDataSource;
    updPeaje: TUpdateSQL;
    qParqueo: TQuery;
    qParqueoCODIGOVIATICODETALLE: TFloatField;
    qParqueoCODIGOVIATICO: TFloatField;
    qParqueoCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qParqueoVALORIMPUTACION: TFloatField;
    qParqueoNUMEROIMPUTACION: TFloatField;
    qParqueoAUXILIAR: TFloatField;
    qParqueoDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    dsParqueo: TDataSource;
    updParqueo: TUpdateSQL;
    qPasaje: TQuery;
    qPasajeCODIGOVIATICODETALLE: TFloatField;
    qPasajeCODIGOVIATICO: TFloatField;
    qPasajeCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qPasajeVALORIMPUTACION: TFloatField;
    qPasajeNUMEROIMPUTACION: TFloatField;
    qPasajeAUXILIAR: TFloatField;
    qPasajeDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    dsPasaje: TDataSource;
    updPasaje: TUpdateSQL;
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
    qAuxilioViaje: TQuery;
    qAuxilioViajeCODIGOVIATICODETALLE: TFloatField;
    qAuxilioViajeCODIGOVIATICO: TFloatField;
    qAuxilioViajeCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qAuxilioViajeVALORIMPUTACION: TFloatField;
    qAuxilioViajeNUMEROIMPUTACION: TFloatField;
    qAuxilioViajeAUXILIAR: TFloatField;
    qAuxilioViajeDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    dsAuxilio: TDataSource;
    updAuxilio: TUpdateSQL;
    qZonaOrigen: TQuery;
    qZonaOrigenCODIGOZONA: TFloatField;
    qZonaOrigenNOMBREZONA: TStringField;
    qZonaOrigenCODIGOZONAESSA: TFloatField;
    dsZona: TDataSource;
    dsPropietarioVehiculo: TDataSource;
    qPropietarioVehiculo: TQuery;
    qPropietarioVehiculoCODIGOPROPIETARIO: TStringField;
    dsTiqueteViatico: TDataSource;
    qTiqueteViatico: TQuery;
    qTiqueteViaticoCODIGOVIATICODETALLETIQUETE: TFloatField;
    qTiqueteViaticoCODIGOVIATICO: TFloatField;
    qTiqueteViaticoCODIGOTIPOTIQUETE: TStringField;
    qTiqueteViaticoNUMEROTIQUETE: TStringField;
    qTiqueteViaticoVALORTIQUETE: TFloatField;
    qTiqueteViaticoNombreTipoTiquete: TStringField;
    updTiqueteViatico: TUpdateSQL;
    qGerencia: TQuery;
    qGerenciaNOMBRECATEGORIA: TStringField;
    dsGerencia: TDataSource;
    qCargo: TQuery;
    qCargoNIVEL: TFloatField;
    qCargoCODIGOCARGO: TFloatField;
    dsCargo: TDataSource;
    qRepVehiculo: TQuery;
    qRepVehiculoCODIGOVIATICODETALLE: TFloatField;
    qRepVehiculoCODIGOVIATICO: TFloatField;
    qRepVehiculoCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qRepVehiculoVALORIMPUTACION: TFloatField;
    qRepVehiculoNUMEROIMPUTACION: TFloatField;
    qRepVehiculoAUXILIAR: TFloatField;
    qRepVehiculoDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    dsRepVehiculo: TDataSource;
    updRepVehiculo: TUpdateSQL;
    Label27: TLabel;
    Label28: TLabel;
    sbFechaInicio: TSpeedButton;
    sbFechaFin: TSpeedButton;
    dbEdFechaInicio: TDBEdit;
    dbEdFechaFin: TDBEdit;
    qViaticoIMPRESOANTICIPO: TStringField;
    qEmpleadoTipoCecos: TStringField;
    qAuxilioDirectivo: TQuery;
    qAuxilioDirectivoCODIGOVIATICODETALLE: TFloatField;
    qAuxilioDirectivoCODIGOVIATICO: TFloatField;
    qAuxilioDirectivoCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qAuxilioDirectivoVALORIMPUTACION: TFloatField;
    qAuxilioDirectivoNUMEROIMPUTACION: TFloatField;
    qAuxilioDirectivoAUXILIAR: TFloatField;
    qAuxilioDirectivoDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    dsAuxilioDirectivo: TDataSource;
    updAuxilioDirectivo: TUpdateSQL;
    qViaticoValorAuxilioDiario: TFloatField;
    qViaticoDIFICILACCESO: TStringField;
    qViaticoVALORDIARIO: TFloatField;
    qViaticoCODIGOGEOGRAFICO: TFloatField;
    qViaticoDEVOLUCION: TStringField;
    qViaticoIMPRESOVIATICO: TStringField;
    qViaticoNUMEROIMPRESION: TFloatField;
    qViaticoESCALAS: TStringField;
    qViaticoDiarioVIGENCIADESDE: TDateTimeField;
    qViaticoDiarioVIGENCIAHASTA: TDateTimeField;
    qViaticoDiarioSALARIODESDE: TFloatField;
    qViaticoDiarioSALARIOHASTA: TFloatField;
    qViaticoDiarioCIUDADCAPITAL: TStringField;
    qViaticoDiarioNIVELCARGO: TFloatField;
    qViaticoDiarioSALARIOLIMITEVIATICO: TFloatField;
    qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO: TFloatField;
    qViaticoValorViaticooAuxilioDiario: TFloatField;
    qOdtNOTAS: TMemoField;
    procedure sbImprimirClick(Sender: TObject);
    procedure qViaticoAfterInsert(DataSet: TDataSet);
    procedure qViaticoAfterPost(DataSet: TDataSet);
    procedure qViaticoAfterOpen(DataSet: TDataSet);
    procedure qEmpleadoAfterOpen(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbAceptarClick(Sender: TObject);
    procedure bbCancelarClick(Sender: TObject);
    procedure qGasolinaAfterPost(DataSet: TDataSet);
    procedure qPeajeAfterPost(DataSet: TDataSet);
    procedure qParqueoAfterPost(DataSet: TDataSet);
    procedure qPasajeAfterPost(DataSet: TDataSet);
    procedure qPasajeAfterInsert(DataSet: TDataSet);
    procedure qParqueoAfterInsert(DataSet: TDataSet);
    procedure qPeajeAfterInsert(DataSet: TDataSet);
    procedure qGasolinaAfterInsert(DataSet: TDataSet);
    procedure qViaticoCalcFields(DataSet: TDataSet);
    procedure qValorViaticoAfterInsert(DataSet: TDataSet);
    procedure qValorViaticoAfterPost(DataSet: TDataSet);
    procedure VALORIMPUTACIONSetText(Sender: TField;
      const Text: String);
    procedure qValorViaticoAfterDelete(DataSet: TDataSet);
    procedure qViaticoDiarioAfterOpen(DataSet: TDataSet);
    procedure qViaticoPLACAVEHICULOChange(Sender: TField);
    procedure qAuxilioViajeVALORIMPUTACIONSetText(Sender: TField;
      const Text: String);
    procedure qAuxilioViajeAfterDelete(DataSet: TDataSet);
    procedure qAuxilioViajeAfterInsert(DataSet: TDataSet);
    procedure qAuxilioViajeAfterPost(DataSet: TDataSet);
    procedure qTiqueteViaticoAfterDelete(DataSet: TDataSet);
    procedure qTiqueteViaticoAfterInsert(DataSet: TDataSet);
    procedure qTiqueteViaticoAfterPost(DataSet: TDataSet);
    procedure qViaticoDIASPROYECTADOSChange(Sender: TField);
    procedure qViaticoPORCENTAJEANTICIPOChange(Sender: TField);
    procedure qViaticoPORCENTAJEANTICIPOValidate(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure qViaticoDIASPROYECTADOSValidate(Sender: TField);
    procedure qViaticoCIUDADCAPITALChange(Sender: TField);
    procedure qViaticoCODIGOMUNICIPIODESTINOValidate(Sender: TField);
    procedure qRepVehiculoAfterInsert(DataSet: TDataSet);
    procedure qRepVehiculoAfterPost(DataSet: TDataSet);
    procedure qViaticoCODIGOMUNICIPIODESTINOChange(Sender: TField);
    procedure qViaticoVALORANTICIPOChange(Sender: TField);
    procedure EliminarRegistrosDetalleNulo;
    procedure sbFechaInicioClick(Sender: TObject);
    procedure qViaticoFECHAINICIOChange(Sender: TField);
    procedure qEmpleadoCalcFields(DataSet: TDataSet);
    procedure qViaticoMODIFICADOChange(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure qAuxilioDirectivoAfterInsert(DataSet: TDataSet);
    procedure qAuxilioDirectivoAfterDelete(DataSet: TDataSet);
    procedure qAuxilioDirectivoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
    ValoresAnticipoIniciales: Boolean;
  public
    { Public declarations }
    Modificado:boolean;
    sFecha, Fecha:string;
    Imprimio:boolean;
    bDatosIncompletos, bCancelando: Boolean;
    function GetFecha(Tipo:Boolean): String;
  end;

var
  FAnticipoViatico: TFAnticipoViatico;

implementation

uses uQRAnticipoViaticos, uOdtVehiculo, ConsDll, uFormaFecha;

{$R *.DFM}

procedure TFAnticipoViatico.sbImprimirClick(Sender: TObject);
var
  Query:TQuery;
begin
  Query:=TQuery.Create(self);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT CODIGOTIPOUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+Inttostr(VarCodigoUsuario);
  Query.Open;
  if (qViaticoFECHAPAGOANTICIPO.AsString='')or(Query.fields[0].asstring='0')or(qViaticoIMPRESOANTICIPO.AsString='') then
  begin
    FQRAnticipoViaticos:=TFQRAnticipoViaticos.Create(Application);
    with FQRAnticipoViaticos do
    begin
      QuickRep.DataSet:=qViatico;
      qrdbDependencia.DataSet:=qCia;
      qrdbDependencia.DataField:='NOMBRECATEGORIA';
      qrdbGerencia.DataSet:=qGerencia;
      qrdbGerencia.DataField:='NOMBRECATEGORIA';
      qrdbNombreEmpleado.DataSet:=qEmpleado;
      qrdbNombreEmpleado.DataField:='NOMBREEMPLEADO';
      qrdbSalario.DataSet:=qSueldo;
      qrdbSalario.DataField:='SUELDO';
      qrdbComision.DataSet:=qViatico;
      qrdbComision.DataField:='CODIGOCOMISION';
      qrdbCedula.DataSet:=qViatico;
      qrdbCedula.DataField:='CODIGOEMPLEADO';
      qrdbCedulaAnticipo.DataSet:=qViatico;
      qrdbCedulaAnticipo.DataField:='CODIGOEMPLEADO';
      qrdbCedulaAnticipo1.DataSet:=qViatico;
      qrdbCedulaAnticipo1.DataField:='CODIGOEMPLEADO';
      qrdbValorAnticipo.DataSet:=qViatico;
      qrdbValorAnticipo.DataField:='VALORANTICIPO';
      qrdbViaticoDiario.DataSet:=qViatico;
      qrdbViaticoDiario.DataField:='VALORVIATICOOAUXILIODIARIO';
      qrdbMotivoViaje.DataSet:=qOdt;
      qrdbMotivoViaje.DataField:='MOTIVOS';
      qrdbCodigoODT.DataSet:=qOdt;
      qrdbCodigoODT.DataField:='CODIGOODT';
      qrdbMunicipioDestino.DataSet:=qViatico;
      qrdbMunicipioDestino.DataField:='DESTINO';
      qrdbZonaOrigen1.DataSet:=qZonaOrigen;
      qrdbZonaOrigen1.DataField:='NOMBREZONA';
      qrdbZonaOrigen2.DataSet:=qZonaOrigen;
      qrdbZonaOrigen2.DataField:='NOMBREZONA';
      qrdbDias.DataSet:=qViatico;
      qrdbDias.DataField:='DIASPROYECTADOS';
      qrdbAnoInicio.DataSet:=qViatico;
      qrdbAnoInicio.DataField:='ANOINICIO';
      qrdbMesInicio.DataSet:=qViatico;
      qrdbMesInicio.DataField:='MESINICIO';
      qrdbDiaInicio.DataSet:=qViatico;
      qrdbDiaInicio.DataField:='DIAINICIO';
      qrdbAnoFin.DataSet:=qViatico;
      qrdbAnoFin.DataField:='ANOFIN';
      qrdbMesFin.DataSet:=qViatico;
      qrdbMesFin.DataField:='MESFIN';
      qrdbDiaFin.DataSet:=qViatico;
      qrdbDiaFin.DataField:='DIAFIN';
      qrdbMunicipioDestino2.DataSet:=qViatico;
      qrdbMunicipioDestino2.DataField:='DESTINO';
      qrdbMunicipioDestino3.DataSet:=qViatico;
      qrdbMunicipioDestino3.DataField:='DESTINO';
      qrdbPlacaVehiculo.DataSet:=qViatico;
      qrdbPlacaVehiculo.DataField:='CODIGOVEHICULO';
      qrdbDiasPagados.DataSet:=qViatico;
      qrdbDiasPagados.DataField:='DiasPagados';
      qrdbViatico.DataSet:=qViatico;
      qrdbViatico.DataField:='ValorViatico';
      qrdbPeaje.DataSet:=qPeaje;
      qrdbPeaje.DataField:='VALORIMPUTACION';
      qrdbPasaje.DataSet:=qPasaje;
      qrdbPasaje.DataField:='VALORIMPUTACION';
      qrdbParqueo.DataSet:=qParqueo;
      qrdbParqueo.DataField:='VALORIMPUTACION';
      qrdbGasolina.DataSet:=qGasolina;
      qrdbGasolina.DataField:='VALORIMPUTACION';
      qrlZonaOrigen.Caption:='Fuera de la Zona  '+ qZonaOrigenNOMBREZONA.AsString;
      if qTipoTiqueteCODIGOTIPOTIQUETE.AsString='T' then
        qrlTerrestre.Caption:='X';
      if qTipoTiqueteCODIGOTIPOTIQUETE.AsString='F' then
        qrlFluvial.Caption:='X';
      if qTipoTiqueteCODIGOTIPOTIQUETE.AsString='A' then
        qrlAereo.Caption:='X';
      if qMunicipioDestinoCODIGOZONA.AsString=qZonaOrigenCODIGOZONA.AsString then
        qrlFueraZona.Caption:='NO'
      else
        qrlFueraZona.Caption:='SI';
      if qViaticoUSOVEHICULO.AsString='S' then
        qrlUsoVehiculo.Caption:='X'
      else
        qrlUsoPasaje.Caption:='X';
      if qViaticoCODIGOVEHICULO.AsString<>'' then
      begin
        if qViaticoVEHICULOOFICIAL.AsString='S' then
          qrlVehiculoOficial.Caption:='X'
        else
          qrlVehiculoParticular.Caption:='X';
      end;
      qTiquetes.DataSource:=dsViatico;
      qTiquetes.Open;
      if qValorViaticoVALORIMPUTACION.AsString<>'' then
      begin
        qrdbCuentaViatico.DataSet:=qValorViatico;
        qrdbCuentaViatico.DataField:='NUMEROIMPUTACION';
        qrdbAuxiliarViatico.DataSet:=qValorViatico;
        qrdbAuxiliarViatico.DataField:='AUXILIAR';
        qrdbCentroCosto.DataSet:=qCia;
        qrdbCentroCosto.DataField:='CODIGOCENTROCOSTO';
        qrdbAreaResponsable.DataSet:=qCia;
        qrdbAreaResponsable.DataField:='CODIGOAREARESPONSABILIDAD';
        qrdbNombreViatico.Dataset:=qValorViatico;
        qrdbNombreViatico.DataField:='DESCRIPCIONIMPUTACIONMANOOBRA';
        qrdbViatico.DataSet:=qValorViatico;
        qrdbViatico.DataField:='VALORIMPUTACION';
      end;
      if qPeajeVALORIMPUTACION.AsString<>'' then
      begin
        qrlPeaje.Caption:='X';
        qrdbCuentaPeaje.DataSet:=qPeaje;
        qrdbCuentaPeaje.DataField:='NUMEROIMPUTACION';
        qrdbAuxiliarPeaje.DataSet:=qPeaje;
        qrdbAuxiliarPeaje.DataField:='AUXILIAR';
        qrdbCentroCosto2.DataSet:=qCia;
        qrdbCentroCosto2.DataField:='CODIGOCENTROCOSTO';
        qrdbAreaResponsable2.DataSet:=qCia;
        qrdbAreaResponsable2.DataField:='CODIGOAREARESPONSABILIDAD';
        qrdbNombrePeaje.Dataset:=qPeaje;
        qrdbNombrePeaje.DataField:='DESCRIPCIONIMPUTACIONMANOOBRA';
        qrdbPeaje.DataSet:=qPeaje;
        qrdbPeaje.DataField:='VALORIMPUTACION';
      end;
      if qParqueoVALORIMPUTACION.AsString<>'' then
      begin
        qrlParqueo.Caption:='X';
        qrdbCuentaParqueo.DataSet:=qParqueo;
        qrdbCuentaParqueo.DataField:='NUMEROIMPUTACION';
        qrdbAuxiliarParqueo.DataSet:=qParqueo;
        qrdbAuxiliarParqueo.DataField:='AUXILIAR';
        qrdbCentroCosto3.DataSet:=qCia;
        qrdbCentroCosto3.DataField:='CODIGOCENTROCOSTO';
        qrdbAreaResponsable3.DataSet:=qCia;
        qrdbAreaResponsable3.DataField:='CODIGOAREARESPONSABILIDAD';
        qrdbNombreParqueo.Dataset:=qParqueo;
        qrdbNombreParqueo.DataField:='DESCRIPCIONIMPUTACIONMANOOBRA';
        qrdbParqueo.DataSet:=qParqueo;
        qrdbParqueo.DataField:='VALORIMPUTACION';
      end;
      if qGasolinaVALORIMPUTACION.AsString<>'' then
      begin
        qrlGasolina.Caption:='X';
        qrdbCuentaGasolina.DataSet:=qGasolina;
        qrdbCuentaGasolina.DataField:='NUMEROIMPUTACION';
        qrdbAuxiliarGasolina.DataSet:=qGasolina;
        qrdbAuxiliarGasolina.DataField:='AUXILIAR';
        qrdbCentroCosto4.DataSet:=qCia;
        qrdbCentroCosto4.DataField:='CODIGOCENTROCOSTO';
        qrdbAreaResponsable4.DataSet:=qCia;
        qrdbAreaResponsable4.DataField:='CODIGOAREARESPONSABILIDAD';
        qrdbNombreGasolina.Dataset:=qGasolina;
        qrdbNombreGasolina.DataField:='DESCRIPCIONIMPUTACIONMANOOBRA';
        qrdbGasolina.DataSet:=qGasolina;
        qrdbGasolina.DataField:='VALORIMPUTACION';
      end;
      if (qPasajeVALORIMPUTACION.AsString<>'') and (qPasajeVALORIMPUTACION.AsString<>'0') then
      begin
        qrdbCuentaPasaje.DataSet:=qPasaje;
        qrdbCuentaPasaje.DataField:='NUMEROIMPUTACION';
        qrdbAuxiliarPasaje.DataSet:=qPasaje;
        qrdbAuxiliarPasaje.DataField:='AUXILIAR';
        qrdbCentroCosto5.DataSet:=qCia;
        qrdbCentroCosto5.DataField:='CODIGOCENTROCOSTO';
        qrdbAreaResponsable5.DataSet:=qCia;
        qrdbAreaResponsable5.DataField:='CODIGOAREARESPONSABILIDAD';
        qrdbNombrePasaje.Dataset:=qPasaje;
        qrdbNombrePasaje.DataField:='DESCRIPCIONIMPUTACIONMANOOBRA';
        qrdbPasaje.DataSet:=qPasaje;
        qrdbPasaje.DataField:='VALORIMPUTACION';
      end;
      if qAuxilioViajeVALORIMPUTACION.AsString<>'' then
      begin
        qrdbCuentaAuxilioViaje.DataSet:=qAuxilioViaje;
        qrdbCuentaAuxilioViaje.DataField:='NUMEROIMPUTACION';
        qrdbAuxiliarAuxilioViaje.DataSet:=qAuxilioViaje;
        qrdbAuxiliarAuxilioViaje.DataField:='AUXILIAR';
        qrdbCentroCosto6.DataSet:=qCia;
        qrdbCentroCosto6.DataField:='CODIGOCENTROCOSTO';
        qrdbAreaResponsable6.DataSet:=qCia;
        qrdbAreaResponsable6.DataField:='CODIGOAREARESPONSABILIDAD';
        qrdbNombreAuxilioViaje.Dataset:=qAuxilioViaje;
        qrdbNombreAuxilioViaje.DataField:='DESCRIPCIONIMPUTACIONMANOOBRA';
        qrdbAuxilioViaje.DataSet:=qAuxilioViaje;
        qrdbAuxilioViaje.DataField:='VALORIMPUTACION';
      end;
      QuickRep.Preview;
    end;
  end
  else
    Application.MessageBox(pchar('Este viático ya fue pagado'),pchar('Información'),MB_OK);
  Query.Close;
  Query.Free;
end;

procedure TFAnticipoViatico.qViaticoAfterInsert(DataSet: TDataSet);
var Query:TQuery;
begin
  Query:=TQuery.Create(self);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT SQ_ODTVIATICO.NEXTVAL FROM DUAL';
  Query.Open;
  DataSet.FieldByName('CODIGOVIATICO').AsInteger:=Query.Fields[0].AsInteger;
  DataSet.FieldByName('CODIGOEMPLEADO').AsFloat:=qViatico.ParamByName('CODIGOEMPLEADO').AsFloat;
  DataSet.FieldByName('CODIGOODT').AsFloat:=qViatico.ParamByName('CODIGOODT').AsFloat;
  DataSet.FieldByName('PORCENTAJEANTICIPO').AsInteger:=90;
  DataSet.FieldByName('DIASPROYECTADOS').AsInteger:=1;
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
  qViaticoDIASPROYECTADOSChange(qViaticoDIASPROYECTADOS);
end;

procedure TFAnticipoViatico.qViaticoAfterPost(DataSet: TDataSet);
begin
  qViatico.ApplyUpdates;
  qViatico.CommitUpdates;
end;

procedure TFAnticipoViatico.qViaticoAfterOpen(DataSet: TDataSet);
begin
  if qViatico.RecordCount>0 then
  begin
    qOdt.Close;
    qOdt.Open;
    qEmpleado.Close;
    qEmpleado.Open;
    qMunicipioDestino.Close;
    qMunicipioDestino.Open;
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
    qValorViatico.Close;
    qValorViatico.Open;
    If qValorViatico.RecordCount > 0
    then qValorViatico.Edit
    else qValorViatico.Insert;
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
    qRepVehiculo.Close;
    qRepVehiculo.Open;
    If qRepVehiculo.RecordCount > 0
    then qRepVehiculo.Edit
    else qRepVehiculo.Insert;
    qParqueo.Close;
    qParqueo.Open;
    If qParqueo.RecordCount > 0
    then qParqueo.Edit
    else qParqueo.Insert;
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

    qTiqueteViatico.Close;
    qTiqueteViatico.Open;
  end;
end;

procedure TFAnticipoViatico.qEmpleadoAfterOpen(DataSet: TDataSet);
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
    qSueldo.SQL.add('SELECT TO_CHAR(E.CODIGOEMPLEADO)  AS CODIGO,S.SUELDO');
    qSueldo.SQL.add('FROM EMPLEADO E,SUELDO S');
    qSueldo.SQL.add('WHERE E.CODIGOSUELDO=S.CODIGOSUELDO');
    qSueldo.SQL.add('AND E.CODIGOEMPLEADO=:CODIGOEMPLEADO');
    qSueldo.Open;
  end;
  qCargo.Close;
  qCargo.Open;

end;

procedure TFAnticipoViatico.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFAnticipoViatico.bbAceptarClick(Sender: TObject);
begin
  bDatosIncompletos := False;
  try
     if qViatico.State in [dsEdit,dsInsert] then
       qViatico.Post;
     if qViatico.UpdatesPending then
        qViatico.ApplyUpdates;
     Close;
     ModalResult:=MrOk;
  except
     bDatosIncompletos := True;
     qViatico.Edit;
     ModalResult:=MrCancel;
     Close;
  end;
end;



procedure TFAnticipoViatico.bbCancelarClick(Sender: TObject);
begin
  if MessageDlg('Perderá los cambios realizados.Esta seguro de Cancelar?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    try
     qValorViatico.Cancel;
      if qValorViatico.UpdatesPending then
        qValorViatico.CancelUpdates;

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


procedure TFAnticipoViatico.qValorViaticoAfterPost(DataSet: TDataSet);
begin
  qValorViatico.ApplyUpdates;
  qValorViatico.CommitUpdates;
  qValorViatico.Edit;
end;

procedure TFAnticipoViatico.qGasolinaAfterPost(DataSet: TDataSet);
begin
  qGasolina.ApplyUpdates;
  qGasolina.CommitUpdates;
  qGasolina.Edit;
end;

procedure TFAnticipoViatico.qPeajeAfterPost(DataSet: TDataSet);
begin
  qPeaje.ApplyUpdates;
  qPeaje.CommitUpdates;
  qPeaje.Edit;
end;

procedure TFAnticipoViatico.qParqueoAfterPost(DataSet: TDataSet);
begin
  qParqueo.ApplyUpdates;
  qParqueo.CommitUpdates;
  qParqueo.Edit;
end;

procedure TFAnticipoViatico.qPasajeAfterPost(DataSet: TDataSet);
begin
  qPasaje.ApplyUpdates;
  qPasaje.CommitUpdates;
  qPasaje.Edit;
end;

procedure TFAnticipoViatico.qPasajeAfterInsert(DataSet: TDataSet);
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
  Query.sql.Add('AND V.CODIGOVIATICO=:'+qViaticoCODIGOVIATICO.AsString);
  Query.sql.Add('AND IMO.TIPOCECOS='''+qEmpleadoTipoCecos.AsString+'''');
  Query.sql.Add('AND IMO.CODIGOTIPOIMPUTACIONODT=''V''');
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''PAS''');
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFAnticipoViatico.qParqueoAfterInsert(DataSet: TDataSet);
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
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''PAR''');
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFAnticipoViatico.qPeajeAfterInsert(DataSet: TDataSet);
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
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''PEA''');
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFAnticipoViatico.qGasolinaAfterInsert(DataSet: TDataSet);
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
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''GAS''');
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFAnticipoViatico.qViaticoCalcFields(DataSet: TDataSet);
begin
  if qViaticoCodigoZonaDestino.AsString<>'' then
    qViaticocodigozona.AsString:=qViaticoCodigoZonaDestino.AsString
  else
    qViaticocodigozona.AsString:='8';

  qViaticoDias.AsInteger:=trunc(qViaticoFECHAFIN.AsDateTime) - trunc(qViaticoFECHAINICIO.AsDateTime)+1;
  if (qViaticoFECHAFIN.AsDateTime)=trunc(qViaticoFECHAFIN.AsDateTime)then qViaticoDias.AsInteger:= qViaticoDias.AsInteger-1;
  qViaticoDiasPagados.AsFloat:=qViaticoDias.AsInteger + qViaticoDiarioPORCENTAJEULTIMODIA.AsFloat/100 - 1;

  if ((qViaticoNivel.AsInteger>0) or (qViaticoSueldo.AsFloat>qViaticoDiarioSALARIOLIMITEVIATICO.AsFloat))
  and (qViaticoCodigoZona.AsString<>'8')
  and ((qViaticoDiarioSALARIOLIMITEVIATICO.asinteger>0)and(qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.asinteger>0)) then
  begin
    qViaticoValorAuxilioDiario.AsFloat:=qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.AsFloat;
    qViaticoValorViatico.AsFloat:=0;
    qViaticoValorViaticooAuxilioDiario.AsFloat:=qViaticoDiarioVALORAUXILIOVIAJEDIRECTIVO.AsFloat;
  end
  else
  begin
    qViaticoValorAuxilioDiario.AsFloat:=0;
    qViaticoValorViatico.AsFloat:=round(qViaticoDiasPagados.AsFloat *qViaticoDiarioVALORVIATICO.asfloat);
    qViaticoValorViaticooAuxilioDiario.AsFloat:=qViaticoDiarioVALORVIATICO.AsFloat;
  end;


  if qValorViatico.Active then
  begin
    qValorViatico.Edit;
    qValorViaticoVALORIMPUTACION.AsFloat:= qViaticoValorViatico.AsFloat;
    qValorViatico.Post;
  end;
  if (qAuxilioDirectivo.Active) and (qAuxilioDirectivo.CachedUpdates) then
  begin
    qAuxilioDirectivo.Edit;
    qAuxilioDirectivoVALORIMPUTACION.AsFloat:=round(qViaticoDias.AsFloat *qViaticoValorAuxilioDiario.asfloat);
    qAuxilioDirectivo.Post;
  end;
  qViaticoAnoInicio.AsDateTime:=qViaticoFECHAINICIO.AsDateTime;
  qViaticoMesInicio.AsDateTime:=qViaticoFECHAINICIO.AsDateTime;
  qViaticoDiaInicio.AsDateTime:=qViaticoFECHAINICIO.AsDateTime;
  qViaticoAnoFin.AsDateTime:=qViaticoFECHAFIN.AsDateTime;
  qViaticoMesFin.AsDateTime:=qViaticoFECHAFIN.AsDateTime;
  qViaticoDiaFin.AsDateTime:=qViaticoFECHAFIN.AsDateTime;
  
end;

procedure TFAnticipoViatico.qValorViaticoAfterInsert(DataSet: TDataSet);
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
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''VIA''');
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFAnticipoViatico.VALORIMPUTACIONSetText(Sender: TField;
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

procedure TFAnticipoViatico.qValorViaticoAfterDelete(DataSet: TDataSet);
begin
  qValorViatico.ApplyUpdates;
  qValorViatico.CommitUpdates;
  qValorViatico.Edit;
end;

procedure TFAnticipoViatico.qViaticoDiarioAfterOpen(DataSet: TDataSet);
begin
  if (qViatico.RecordCount>0) and (qViaticoDiario.RecordCount=0) then
    if qViatico.State in [dsEdit,dsInsert] then
    begin
      ShowMessage('No existen viáticos definidos para '+ qZonaOrigenNOMBREZONA.AsString+' - '+ qMunicipioDestinoNOMBREZONA.AsString);
      bbAceptar.Enabled:=False;
    end;
end;

procedure TFAnticipoViatico.qViaticoPLACAVEHICULOChange(Sender: TField);
begin
  if qPropietarioVehiculo.RecordCount>0 then
  begin
    if qPropietarioVehiculo.FieldByName('CODIGOPROPIETARIO').AsString='1' then
      qViaticoVEHICULOOFICIAL.AsString:='S'
    else
      qViaticoVEHICULOOFICIAL.AsString:='N';
  end;
end;

procedure TFAnticipoViatico.qAuxilioViajeVALORIMPUTACIONSetText(Sender: TField;
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

procedure TFAnticipoViatico.qAuxilioViajeAfterDelete(DataSet: TDataSet);
begin
  qAuxilioViaje.ApplyUpdates;
  qAuxilioViaje.CommitUpdates;
  qAuxilioViaje.Edit;
end;

procedure TFAnticipoViatico.qAuxilioViajeAfterInsert(DataSet: TDataSet);
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

procedure TFAnticipoViatico.qAuxilioViajeAfterPost(DataSet: TDataSet);
begin
  qAuxilioViaje.ApplyUpdates;
  qAuxilioViaje.CommitUpdates;
  qAuxilioViaje.Edit;
end;

procedure TFAnticipoViatico.qTiqueteViaticoAfterDelete(DataSet: TDataSet);
begin
  qTiqueteViatico.ApplyUpdates;
  qTiqueteViatico.CommitUpdates;
  qTiqueteViatico.Edit;
end;

procedure TFAnticipoViatico.qTiqueteViaticoAfterInsert(DataSet: TDataSet);
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

procedure TFAnticipoViatico.qTiqueteViaticoAfterPost(DataSet: TDataSet);
begin
  qTiqueteViatico.ApplyUpdates;
  qTiqueteViatico.CommitUpdates;
end;

procedure TFAnticipoViatico.qViaticoDIASPROYECTADOSChange(Sender: TField);
begin
  if (qViaticoPORCENTAJEANTICIPO.AsString<>'') and  (qViaticoDIASPROYECTADOS.AsString<>'') then
    qViaticoVALORANTICIPO.AsFloat:=trunc(qViaticoValorViaticooAuxilioDiario.AsFloat*qViaticoDIASPROYECTADOS.AsInteger*qViaticoPORCENTAJEANTICIPO.asfloat/100);
  qViaticoFECHAFIN.AsDateTime:=qViaticoFECHAINICIO.AsDateTime+qViaticoDIASPROYECTADOS.AsInteger;
  qViaticoFECHAFIN.AsDateTime:=trunc(qViaticoFECHAFIN.AsDateTime)-(1/(24*60));
  Modificado:=true;
end;

procedure TFAnticipoViatico.qViaticoPORCENTAJEANTICIPOChange(
  Sender: TField);
begin
  if (qViaticoPORCENTAJEANTICIPO.AsString<>'') and  (qViaticoDIASPROYECTADOS.AsString<>'') then
  qViaticoVALORANTICIPO.AsFloat:=trunc(qViaticoValorViaticooAuxilioDiario.AsFloat*qViaticoDIASPROYECTADOS.AsInteger*qViaticoPORCENTAJEANTICIPO.asfloat/100);
  Modificado:=true;
end;

procedure TFAnticipoViatico.qViaticoPORCENTAJEANTICIPOValidate(
  Sender: TField);
begin
  if sender.AsString<>'' then
  begin
    if not (sender.AsInteger in [1..90]) then
      raise exception.create('Porcentaje no válido');
  end;
  if (qViaticoPORCENTAJEANTICIPO.AsString<>'') and  (qViaticoDIASPROYECTADOS.AsString<>'') then
  qViaticoVALORANTICIPO.AsFloat:=trunc(qViaticoValorViaticooAuxilioDiario.AsFloat*qViaticoDIASPROYECTADOS.AsInteger*qViaticoPORCENTAJEANTICIPO.asfloat/100);
end;

procedure TFAnticipoViatico.FormShow(Sender: TObject);
begin
  if not qViatico.Active then
    qViatico.Open;
  if qViatico.state in [dsEdit,dsInsert] then
    qViaticoCalcFields(qViatico)
  else
  begin
    qViatico.Edit;
    qViaticoCalcFields(qViatico);
    qViatico.Post;
  end;
  if qViaticoFECHAPAGOANTICIPO.AsString<>'' then
  begin
    Caption:=Caption+'  *** Solo Lectura(Anticipo Procesado Por Nómina) ***';
    PanelEncabezado.Enabled:=false;
    bbAceptar.Enabled:=false;
  end;
  if qViaticoESTADO.AsString='PRO' then
  begin
    Caption:=Caption+'  *** Solo Lectura(Procesado Por Nómina) ***';
    PanelEncabezado.Enabled:=false;
    bbAceptar.Enabled:=false;
  end;
  qViaticoPORCENTAJEANTICIPOValidate(qViaticoPORCENTAJEANTICIPO);
  ValoresAnticipoiniciales:= true;
end;

procedure TFAnticipoViatico.qViaticoDIASPROYECTADOSValidate(
  Sender: TField);
begin
  if Sender.AsInteger <1 then raise exception.create('La cantidad de días proyectada debe ser mayor o igual a 1');
  if Sender.AsInteger>10 then raise exception.create('La cantidad de días proyectada mayor que 10 debe ser autorizada por la gerencia');   
end;

procedure TFAnticipoViatico.qViaticoCIUDADCAPITALChange(Sender: TField);
begin
  if qViatico.State<>dsinsert then
  begin
    qViaticoDiario.Close;
    qViaticoDiario.Open;
    if qAuxilioViaje.Active then
    begin
      qAuxilioViaje.Edit;
      qAuxilioViajeVALORIMPUTACION.AsFloat:= qViaticoDiarioVALORAUXILIO.AsFloat;
      qAuxilioViajeVALORIMPUTACION.AsFloat:=0;
      qAuxilioViaje.Post;
    end;
  end;
  Modificado:=true;
end;

procedure TFAnticipoViatico.qViaticoCODIGOMUNICIPIODESTINOValidate(
  Sender: TField);
begin
  if sender.AsString<>'' then
    dbEdMunicipioDestino.ReadOnly:=true;
end;

procedure TFAnticipoViatico.qRepVehiculoAfterInsert(DataSet: TDataSet);
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

procedure TFAnticipoViatico.qRepVehiculoAfterPost(DataSet: TDataSet);
begin
  qRepVehiculo.ApplyUpdates;
  qRepVehiculo.CommitUpdates;
  qRepVehiculo.Edit;
end;

procedure TFAnticipoViatico.qViaticoCODIGOMUNICIPIODESTINOChange(
  Sender: TField);
begin
  qMunicipioDestino.Close;
  qMunicipioDestino.Open;
  if qViatico.State in [dsEdit,dsInsert] then
    qViaticoDESTINO.AsString:=qMunicipioDestinoNOMBREMUNICIPIO.AsString;
  Modificado:=true;
end;

procedure TFAnticipoViatico.qViaticoVALORANTICIPOChange(Sender: TField);
begin
  Modificado:=true;
end;

procedure TFAnticipoViatico.EliminarRegistrosDetalleNulo;
var query:tquery;
begin
  query:=TQuery.Create(self);
  query.databasename:='BaseDato';
  query.sql.add('DELETE FROM ODTVIATICODETALLE WHERE CODIGOVIATICO='+qViaticoCODIGOVIATICO.AsString);
  query.sql.add('AND VALORIMPUTACION IS NULL');
  query.ExecSQL;
  query.free;
end;

procedure TFAnticipoViatico.sbFechaInicioClick(Sender: TObject);
begin
  try
    dbEdFechaInicio.Setfocus;
    sFecha := dbEdFechaInicio.Text;
    Fecha := GetFecha(True);
    if Fecha <> '' then dbEdFechaInicio.Text := Fecha;
  except
  end;
end;

function TFAnticipoViatico.GetFecha(Tipo: Boolean): String;
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

procedure TFAnticipoViatico.qViaticoFECHAINICIOChange(Sender: TField);
begin
  Modificado:=true;
  if (sender.AsString<>'') and (qViaticoDIASPROYECTADOS.AsInteger>0)then
  begin
    qViaticoFECHAFIN.AsDateTime:=qViaticoFECHAINICIO.AsDateTime+qViaticoDIASPROYECTADOS.AsInteger;
    qViaticoFECHAFIN.AsDateTime:=trunc(qViaticoFECHAFIN.AsDateTime);
  end;
end;

procedure TFAnticipoViatico.qEmpleadoCalcFields(DataSet: TDataSet);
var query:tquery;
begin
// Modificado Customer Care 2569 Cambio centro de costo del empleado por centro de costo de la odt 11 agosto 2011
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

procedure TFAnticipoViatico.qViaticoMODIFICADOChange(Sender: TField);
begin
  Modificado:=True;
end;

procedure TFAnticipoViatico.FormCreate(Sender: TObject);
begin
  inherited;
  imprimio:=false;
end;

procedure TFAnticipoViatico.qAuxilioDirectivoAfterInsert(
  DataSet: TDataSet);
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

procedure TFAnticipoViatico.qAuxilioDirectivoAfterDelete(
  DataSet: TDataSet);
begin
  qAuxilioDirectivo.ApplyUpdates;
  qAuxilioDirectivo.CommitUpdates;
  qAuxilioDirectivo.Edit;
end;

procedure TFAnticipoViatico.qAuxilioDirectivoAfterPost(DataSet: TDataSet);
begin
  qAuxilioDirectivo.ApplyUpdates;
  qAuxilioDirectivo.CommitUpdates;
  qAuxilioDirectivo.Edit;
end;

end.



