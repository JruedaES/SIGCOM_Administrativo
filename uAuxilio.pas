unit uAuxilio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, DBCtrls, Mask, ExtCtrls, Digisoft,
  Grids, DBGrids, ToolEdit, CurrEdit, RXDBCtrl,UComunesAdministrativo, Math;

type
  TTransporte=(ttVehiculo,ttPasajes);
  TFAuxilio = class(TForm)
    Panel1: TPanel;
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    PanelEncabezado: TPanel;
    Label2: TLabel;
    dbEdNombreEmpleado: TDBEdit;
    Label1: TLabel;
    dbEdCedula: TDBEdit;
    Label3: TLabel;
    dbEdCia: TDBEdit;
    dsAuxilio: TDataSource;
    updAuxilio: TUpdateSQL;
    qDesayuno: TQuery;
    qAlmuerzo: TQuery;
    qComida: TQuery;
    qCia: TQuery;
    qEmpleado: TQuery;
    dsEmpleado: TDataSource;
    dsCia: TDataSource;
    qEmpleadoCODIGOEMPLEADO: TFloatField;
    qEmpleadoNOMBREEMPLEADO: TStringField;
    qEmpleadoDIRECCION: TStringField;
    qEmpleadoBARRIO: TStringField;
    qEmpleadoTELEFONO: TStringField;
    qEmpleadoCODIGOSUELDO: TStringField;
    qEmpleadoCODIGOADMINISTRATIVO: TFloatField;
    qEmpleadoREFERENCIA: TStringField;
    qDesayunoCODIGOAUXILIOALIMENTACION: TFloatField;
    qDesayunoNOMBREAUXILIOALIMENTACION: TStringField;
    qDesayunoVALORAUXILIOALIMENTACION: TFloatField;
    qAlmuerzoCODIGOAUXILIOALIMENTACION: TFloatField;
    qAlmuerzoNOMBREAUXILIOALIMENTACION: TStringField;
    qAlmuerzoVALORAUXILIOALIMENTACION: TFloatField;
    qComidaCODIGOAUXILIOALIMENTACION: TFloatField;
    qComidaNOMBREAUXILIOALIMENTACION: TStringField;
    qComidaVALORAUXILIOALIMENTACION: TFloatField;
    qCiaCODIGOADMINISTRATIVO: TFloatField;
    qCiaNOMBRECATEGORIA: TStringField;
    qCiaCODIGOCENTROCOSTO: TFloatField;
    qCiaCODIGOAREARESPONSABILIDAD: TFloatField;
    dsCuentaAuxiliar: TDataSource;
    qCuentaAuxiliar: TQuery;
    qCuentaAuxiliarCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qCuentaAuxiliarNUMEROIMPUTACION: TFloatField;
    qCuentaAuxiliarAUXILIAR: TFloatField;
    qCuentaAuxiliarDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qValorDesayuno: TQuery;
    qPeaje: TQuery;
    qPasaje: TQuery;
    qGasolina: TQuery;
    qParqueo: TQuery;
    updParqueo: TUpdateSQL;
    dsParqueo: TDataSource;
    dsGasolina: TDataSource;
    updGasolina: TUpdateSQL;
    updPasaje: TUpdateSQL;
    dsPasaje: TDataSource;
    dsPeaje: TDataSource;
    updValorDesayuno: TUpdateSQL;
    dsValorDesayuno: TDataSource;
    updPeaje: TUpdateSQL;
    qValorAlmuerzo: TQuery;
    dsValorAlmuerzo: TDataSource;
    updValorAlmuerzo: TUpdateSQL;
    qValorComida: TQuery;
    dsValorComida: TDataSource;
    updValorComida: TUpdateSQL;
    qValorDesayunoCODIGOAUXILIODETALLE: TFloatField;
    qValorDesayunoCODIGOAUXILIO: TFloatField;
    qValorDesayunoCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qValorDesayunoVALORIMPUTACION: TFloatField;
    qValorDesayunoNUMEROIMPUTACION: TFloatField;
    qValorDesayunoAUXILIAR: TFloatField;
    qValorDesayunoDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qValorAlmuerzoCODIGOAUXILIODETALLE: TFloatField;
    qValorAlmuerzoCODIGOAUXILIO: TFloatField;
    qValorAlmuerzoCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qValorAlmuerzoVALORIMPUTACION: TFloatField;
    qValorAlmuerzoNUMEROIMPUTACION: TFloatField;
    qValorAlmuerzoAUXILIAR: TFloatField;
    qValorAlmuerzoDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qValorComidaCODIGOAUXILIODETALLE: TFloatField;
    qValorComidaCODIGOAUXILIO: TFloatField;
    qValorComidaCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qValorComidaVALORIMPUTACION: TFloatField;
    qValorComidaNUMEROIMPUTACION: TFloatField;
    qValorComidaAUXILIAR: TFloatField;
    qValorComidaDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qPeajeCODIGOAUXILIODETALLE: TFloatField;
    qPeajeCODIGOAUXILIO: TFloatField;
    qPeajeCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qPeajeVALORIMPUTACION: TFloatField;
    qPeajeNUMEROIMPUTACION: TFloatField;
    qPeajeAUXILIAR: TFloatField;
    qPeajeDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qPasajeCODIGOAUXILIODETALLE: TFloatField;
    qPasajeCODIGOAUXILIO: TFloatField;
    qPasajeCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qPasajeVALORIMPUTACION: TFloatField;
    qPasajeNUMEROIMPUTACION: TFloatField;
    qPasajeAUXILIAR: TFloatField;
    qPasajeDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qGasolinaCODIGOAUXILIODETALLE: TFloatField;
    qGasolinaCODIGOAUXILIO: TFloatField;
    qGasolinaCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qGasolinaVALORIMPUTACION: TFloatField;
    qGasolinaNUMEROIMPUTACION: TFloatField;
    qGasolinaAUXILIAR: TFloatField;
    qGasolinaDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qParqueoCODIGOAUXILIODETALLE: TFloatField;
    qParqueoCODIGOAUXILIO: TFloatField;
    qParqueoCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qParqueoVALORIMPUTACION: TFloatField;
    qParqueoNUMEROIMPUTACION: TFloatField;
    qParqueoAUXILIAR: TFloatField;
    qParqueoDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    PanelGastosTransporte: TPanel;
    Label9: TLabel;
    Label31: TLabel;
    gbOtrosGastos: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    dbEdPeaje: TDBEdit;
    dbEdParqueadero: TDBEdit;
    DBEdPasajes: TDBEdit;
    gbAuxilioAlimentacion: TGroupBox;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    EdOtrosGastos: TCurrencyEdit;
    EdAlimentacion: TCurrencyEdit;
    Label25: TLabel;
    dbEdPlacaVehiculo: TDBEdit;
    sbAsociarVehiculo: TSpeedButton;
    dbChbResponsableCobro: TDBCheckBox;
    qResponsableCobro: TQuery;
    qOdtVehiculo: TQuery;
    qOdtVehiculoCODIGOODT: TFloatField;
    qOdtVehiculoCONSECUTIVO: TFloatField;
    qOdtVehiculoCODIGOVEHICULO: TStringField;
    qOdtVehiculoCODIGOPROPIETARIO: TStringField;
    qOdtVehiculoNOMBREPROPIETARIO: TStringField;
    dsOdtVehiculo: TDataSource;
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
    qOdtCODIGOZONAORIGEN: TFloatField;
    qOdtCODIGOCONTRATISTA: TStringField;
    dsOdt: TDataSource;
    qOdtCODIGOAREAINFLUENCIA: TStringField;
    qDesayunoVIGENCIADESDE: TDateTimeField;
    qDesayunoVIGENCIAHASTA: TDateTimeField;
    qDesayunoCODIGOTIPOIMPUTACIONODT: TStringField;
    qDesayunoCODIGOSUBTIPOIMPUTACIONODT: TStringField;
    qAlmuerzoVIGENCIADESDE: TDateTimeField;
    qAlmuerzoVIGENCIAHASTA: TDateTimeField;
    qAlmuerzoCODIGOTIPOIMPUTACIONODT: TStringField;
    qAlmuerzoCODIGOSUBTIPOIMPUTACIONODT: TStringField;
    qComidaVIGENCIADESDE: TDateTimeField;
    qComidaVIGENCIAHASTA: TDateTimeField;
    qComidaCODIGOTIPOIMPUTACIONODT: TStringField;
    qComidaCODIGOSUBTIPOIMPUTACIONODT: TStringField;
    GroupBox1: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    sbFechaInicio: TSpeedButton;
    sbFechaFin: TSpeedButton;
    dbedFechaInicio: TDBEdit;
    dbedFechaFin: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    spF_ODTALIMENTACION: TStoredProc;
    Label5: TLabel;
    Label14: TLabel;
    dbEdGasolina: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    dbEdOtros: TDBEdit;
    Panel2: TPanel;
    Bevel1: TBevel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    GroupBox2: TGroupBox;
    Label22: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    SpeedButton1: TSpeedButton;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    DBEdit2: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    GroupBox3: TGroupBox;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    qReparacion: TQuery;
    updReparacion: TUpdateSQL;
    dsReparacion: TDataSource;
    qReparacionCODIGOAUXILIODETALLE: TFloatField;
    qReparacionCODIGOAUXILIO: TFloatField;
    qReparacionCODIGOIMPUTACIONMANOOBRA: TFloatField;
    qReparacionVALORIMPUTACION: TFloatField;
    qReparacionNUMEROIMPUTACION: TFloatField;
    qReparacionAUXILIAR: TFloatField;
    qReparacionDESCRIPCIONIMPUTACIONMANOOBRA: TStringField;
    qOdtFECHAFINAL: TDateTimeField;
    qAuxilio: TQuery;
    qAuxilioTotalAlimentacion: TFloatField;
    qAuxilioTotalOtrosGastos: TFloatField;
    qAuxilioTotalAuxilio: TFloatField;
    qAuxilioDias: TIntegerField;
    qAuxilioDiaInicio: TDateField;
    qAuxilioDiaFin: TDateField;
    qAuxilioMesInicio: TDateField;
    qAuxilioMesFin: TDateField;
    qAuxilioAnoInicio: TDateField;
    qAuxilioAnoFin: TDateField;
    qAuxilioDiasDesayuno: TIntegerField;
    qAuxilioDiasAlmuerzo: TIntegerField;
    qAuxilioDiasComida: TIntegerField;
    qAuxilioCODIGOAUXILIO: TFloatField;
    qAuxilioCODIGOEMPLEADO: TFloatField;
    qAuxilioCODIGOODT: TFloatField;
    qAuxilioFECHAINICIO: TDateTimeField;
    qAuxilioFECHAFIN: TDateTimeField;
    qAuxilioCANTIDADDESAYUNOS: TFloatField;
    qAuxilioCANTIDADALMUERZOS: TFloatField;
    qAuxilioCANTIDADCOMIDAS: TFloatField;
    qAuxilioRESPONSABLECOBRO: TStringField;
    qAuxilioCODIGOVEHICULO: TStringField;
    qAuxilioESTADO: TStringField;
    qAuxilioCOBROINDIVIDUAL: TStringField;
    qAuxilioDEVOLUCION: TStringField;
    qAuxilioIMPRESO: TStringField;
    qAuxilioNUMEROIMPRESION: TFloatField;
    qEmpleadoTipoCecos: TStringField;
    Label46: TLabel;
    DBEdit19: TDBEdit;
    qOdtNOTAS: TMemoField;
    Label26: TLabel;
    EdTotalAuxilios: TCurrencyEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure bbAceptarClick(Sender: TObject);
    procedure bbCancelarClick(Sender: TObject);

    procedure qAuxilioAfterInsert(DataSet: TDataSet);
    procedure qAuxilioAfterPost(DataSet: TDataSet);
    procedure qAuxilioCalcFields(DataSet: TDataSet);
    procedure qAuxilioVALORPEAJESetText(Sender: TField;
      const Text: String);
    procedure qAuxilioAfterOpen(DataSet: TDataSet);
    procedure qEmpleadoAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure tdMemTable1CantidadDesayunosSetText(Sender: TField;
      const Text: String);
    procedure tdMemTable1CantidadAlmuerzosSetText(Sender: TField;
      const Text: String);
    procedure tdMemTable1CantidadComidasSetText(Sender: TField;
      const Text: String);
    procedure tdMemTable1FechaChange(Sender: TField);
    procedure qAuxilioCANTIDADDESAYUNOSChange(Sender: TField);
    procedure qAuxilioCANTIDADALMUERZOSChange(Sender: TField);
    procedure qAuxilioCANTIDADCOMIDASChange(Sender: TField);
    procedure qValorDesayunoAfterInsert(DataSet: TDataSet);
    procedure qValorAlmuerzoAfterInsert(DataSet: TDataSet);
    procedure qValorComidaAfterInsert(DataSet: TDataSet);
    procedure qPeajeAfterInsert(DataSet: TDataSet);
    procedure qPasajeAfterInsert(DataSet: TDataSet);
    procedure qGasolinaAfterInsert(DataSet: TDataSet);
    procedure qParqueoAfterInsert(DataSet: TDataSet);
    procedure qValorDesayunoAfterPost(DataSet: TDataSet);
    procedure qValorAlmuerzoAfterPost(DataSet: TDataSet);
    procedure qValorComidaAfterPost(DataSet: TDataSet);
    procedure qPeajeAfterPost(DataSet: TDataSet);
    procedure qPasajeAfterPost(DataSet: TDataSet);
    procedure qGasolinaAfterPost(DataSet: TDataSet);
    procedure qParqueoAfterPost(DataSet: TDataSet);
    procedure qAuxilioCANTIDADDESAYUNOSValidate(Sender: TField);
    procedure qAuxilioCANTIDADALMUERZOSValidate(Sender: TField);
    procedure qAuxilioCANTIDADCOMIDASValidate(Sender: TField);
    procedure qValorDesayunoVALORIMPUTACIONChange(Sender: TField);
    procedure qValorAlmuerzoVALORIMPUTACIONChange(Sender: TField);
    procedure qValorComidaVALORIMPUTACIONChange(Sender: TField);
    procedure qPeajeVALORIMPUTACIONChange(Sender: TField);
    procedure qPasajeVALORIMPUTACIONChange(Sender: TField);
    procedure qGasolinaVALORIMPUTACIONChange(Sender: TField);
    procedure qParqueoVALORIMPUTACIONChange(Sender: TField);
    procedure qAuxilioCODIGOVEHICULOValidate(Sender: TField);
    procedure sbAsociarVehiculoClick(Sender: TObject);
    procedure qAuxilioRESPONSABLECOBROValidate(Sender: TField);
    procedure dbChbResponsableCobroMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure qAuxilioFECHAINICIOValidate(Sender: TField);
    procedure qAuxilioFECHAFINValidate(Sender: TField);
    procedure qAuxilioFECHAINICIOChange(Sender: TField);
    procedure sbFechaInicioClick(Sender: TObject);
    procedure sbFechaFinClick(Sender: TObject);
    procedure qAuxilioCOBROINDIVIDUALValidate(Sender: TField);
    procedure qPeajeVALORIMPUTACIONValidate(Sender: TField);
    procedure qGasolinaVALORIMPUTACIONValidate(Sender: TField);
    procedure qParqueoVALORIMPUTACIONValidate(Sender: TField);
    procedure qAuxilioBeforePost(DataSet: TDataSet);
    procedure qReparacionAfterInsert(DataSet: TDataSet);
    procedure qReparacionAfterPost(DataSet: TDataSet);
    procedure qReparacionVALORIMPUTACIONChange(Sender: TField);
    procedure qReparacionVALORIMPUTACIONValidate(Sender: TField);
    procedure qEmpleadoCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure qAuxilioMODIFICADOChange(Sender: TField);
  private
    { Private declarations }
    CODIGOEMPRESA, CupoAuxiliosGlobal: Integer;
    function ObtenerTotalDiasExclusion(CodigoAdministrativoEmpleado: String; FechaDesde, FechaHasta, HoraDesde, HoraHasta: TDateTime): Integer;
    function VerificacionFinDeSemanaYFestivos(FechaDesde, FechaHasta, HoraDesde, HoraHasta: TDateTime; TipoAuxilio: Integer): Integer;
  public
    sFecha, Fecha:string;
    bDatosIncompletos, bCancelando: Boolean;
    Editable,Modificado:boolean;
    procedure CalculaAuxilioAlimentacion;
    procedure CalculaOtrosGastos;
    procedure CalculaTotalAuxilio;
    function IntersectarVecesHora(FechaDesde, FechaHasta, HoraDesde,HoraHasta: tdatetime):integer;
    function validarFechaAuxilio(var odts:string):boolean;
    function validarFechaViatico(var odts:string):boolean;
    function validarFechas:boolean;
    function validarVehiculo:boolean;
    procedure EliminarRegistrosDetalleNulo;

    function ValidarCantidadAuxilioIgualDias:boolean;
    procedure ActualizarValoresSegunCantidades;
    function ValidarAuxilioCausado:boolean;
    procedure InhabilitarCambios;    
  end;

var
  FAuxilio: TFAuxilio;

implementation

uses uOdtVehiculo, uFuncionSGD;

{$R *.DFM}

procedure TFAuxilio.FormKeyPress(Sender: TObject; var Key: Char);
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


procedure TFAuxilio.bbAceptarClick(Sender: TObject);
var odts,desayunos,almuerzos,comidas:string;
begin
  bDatosIncompletos := False;
  if not (validarFechas) then
  begin
    if (Application.MessageBox(pchar('La Fecha final debe ser mayor a la fecha inicial. Desea Corregir el auxilio?'),pchar('Energis'),MB_YESNO+MB_ICONQUESTION)=IDyes) then
    begin
     ModalResult:=0;
     Exit;
    end
    else
    begin
    {     ModalResult:=mrCancel;
     Close;
     Exit;}
      bDatosIncompletos := True;
      qAuxilio.Edit;
      ModalResult:=MrCancel;
      Close;
    end;
  end;

  if not (validarVehiculo) then
  begin
    if (Application.MessageBox(pchar('Debe ingresar la placa del vehículo. Desea Corregir el auxilio?'),pchar('Energis'),MB_YESNO+MB_ICONQUESTION)=IDyes) then
    begin
     ModalResult:=0;
     Exit;
    end
    else
    begin
    {     ModalResult:=mrCancel;
     Close;
     Exit;     }
      bDatosIncompletos := True;
      qAuxilio.Edit;
      ModalResult:=MrCancel;
      Close;
    end;
  end;

  try
    if not (validarFechaAuxilio(odts)) then
    begin
      if (Application.MessageBox(pchar('Ya existen auxilios para el empleado en esas fechas,'+char(13)
      +'ODT-AUXILIO: '+chr(13)+chr(13)+odts+chr(13)+'Desea Corregir el auxilio?'),pchar('Energis'),MB_YESNO+MB_ICONQUESTION)=IDyes) then
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

    if not (ValidarCantidadAuxilioIgualDias) and (CODIGOEMPRESA <> 3) then
    begin
      Application.MessageBox(pchar('Debe ingresar tres (3) registros para un rango de fechas, así: '+char(13)+char(13)+
       'Registro 1 : Auxilios del primer día.'+char(13)+
       'Registro 2 : Auxilios del ultimo día.'+char(13)+
       'Registro 3 : Auxilios de los días intermedios.'),pchar('Error'),MB_OK+MB_ICONERROR);
      ModalResult:=0;
      Exit;
    end;
    if qAuxilioCANTIDADDESAYUNOS.asstring = '' then desayunos:= '0' else desayunos:= qAuxilioCANTIDADDESAYUNOS.asstring ;
    if qAuxilioCANTIDADALMUERZOS.asstring = '' then almuerzos:= '0' else almuerzos:=qAuxilioCANTIDADALMUERZOS.asstring;
    if qAuxilioCANTIDADCOMIDAS.asstring = '' then comidas:= '0' else comidas:= qAuxilioCANTIDADCOMIDAS.asstring;

    if not (validarFechaViatico(odts)) then
    begin
      if (Application.MessageBox(pchar('Ya existen viáticos para el empleado en esas fechas,'+char(13)
      +'ODT :'+chr(13)+chr(13)+odts+chr(13)+chr(13)+'Desea Corregir el auxilio?'),pchar('Energis'),MB_YESNO+MB_ICONQUESTION)=IDyes) then
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

    if not (ValidarAuxilioCausado)then
    begin
      if (Application.MessageBox(pchar('No se permite liquidar auxilios que no han sido causados.'+char(13)
          +'Desea Corregir el auxilio?'),pchar('Energis'),MB_YESNO+MB_ICONQUESTION)=IDyes) then
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
    if qAuxilio.State in [dsEdit,dsInsert] then
      qAuxilio.Post;
    if qAuxilio.UpdatesPending then
      qAuxilio.ApplyUpdates;
    Close;
    ModalResult:=MrOk;
  except
    bDatosIncompletos := True;
    qAuxilio.Edit;
    ModalResult:=MrCancel;
    Close;
  end;
end;

procedure TFAuxilio.bbCancelarClick(Sender: TObject);
begin
  if MessageDlg('Perderá los cambios realizados.Esta seguro de Cancelar?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    try
     qAuxilio.Cancel;
      if qAuxilio.UpdatesPending then
        qAuxilio.CancelUpdates;
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





procedure TFAuxilio.qAuxilioAfterInsert(DataSet: TDataSet);
var Query:TQuery;
begin
  Query:=TQuery.Create(self);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT SQ_ODTAUXILIO.NEXTVAL FROM DUAL';
  Query.Open;
  DataSet.FieldByName('CODIGOAUXILIO').AsInteger:=Query.Fields[0].AsInteger;
  DataSet.FieldByName('CODIGOEMPLEADO').AsFloat:=qAuxilio.ParamByName('CODIGOEMPLEADO').AsFloat;
  DataSet.FieldByName('CODIGOODT').AsFloat:=qAuxilio.ParamByName('CODIGOODT').AsFloat;
  Query.Free;
  qResponsableCobro.Close;
  qResponsableCobro.Open;
  DataSet.FieldByName('COBROINDIVIDUAL').AsString:='S';
  if  qResponsableCobro.Fields[0].AsInteger>0 then
    DataSet.FieldByName('RESPONSABLECOBRO').AsString:='N'
  else
    DataSet.FieldByName('RESPONSABLECOBRO').AsString:='S';
end;

procedure TFAuxilio.qAuxilioAfterPost(DataSet: TDataSet);
begin
  qAuxilio.ApplyUpdates;
  qAuxilio.CommitUpdates;
end;

procedure TFAuxilio.qAuxilioCalcFields(DataSet: TDataSet);
var Hora,hora2:tdatetime;

begin
  qAuxilioDias.AsInteger:=trunc(qAuxilioFECHAFIN.AsDateTime) - trunc(qAuxilioFECHAINICIO.AsDateTime)+1;
  qAuxilioDiaInicio.AsDateTime:=qAuxilioFECHAINICIO.AsDateTime;
  qAuxilioMesInicio.AsDateTime:=qAuxilioFECHAINICIO.AsDateTime;
  qAuxilioAnoInicio.AsDateTime:=qAuxilioFECHAINICIO.AsDateTime;
  qAuxilioDiaFin.AsDateTime:=qAuxilioFECHAFIN.AsDateTime;
  qAuxilioMesFin.AsDateTime:=qAuxilioFECHAFIN.AsDateTime;
  qAuxilioAnoFin.AsDateTime:=qAuxilioFECHAFIN.AsDateTime;
  if (CODIGOEMPRESA <> 3) then Hora:=EncodeTime(6,0,0,0)
  else Hora:=EncodeTime(6,0,0,0);
  qAuxilioDiasDesayuno.AsInteger:=IntersectarVecesHora(qAuxilioFECHAINICIO.AsDateTime,qAuxilioFECHAFIN.AsDateTime,Hora,Hora);
  if (CODIGOEMPRESA <> 3) then Hora:=EncodeTime(12,0,0,0)
  else Hora:=EncodeTime(12,0,0,0);
  qAuxilioDiasAlmuerzo.AsInteger:=IntersectarVecesHora(qAuxilioFECHAINICIO.AsDateTime,qAuxilioFECHAFIN.AsDateTime,Hora,Hora);
  if (CODIGOEMPRESA <> 3) then Hora:=EncodeTime(18,0,0,0)
  else Hora:=EncodeTime(18,0,0,0);
  if (CODIGOEMPRESA <> 3) then Hora2:=EncodeTime(19,0,0,0)
  else Hora2:=EncodeTime(19,0,0,0);
  qAuxilioDiasComida.AsInteger:=IntersectarVecesHora(qAuxilioFECHAINICIO.AsDateTime,qAuxilioFECHAFIN.AsDateTime,Hora,hora2);
end;

procedure TFAuxilio.qAuxilioVALORPEAJESetText(Sender: TField;
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

procedure TFAuxilio.qAuxilioAfterOpen(DataSet: TDataSet);
var
  qry: TQuery;
begin
  qry:=TQuery.Create(nil);
  qry.DatabaseName:='BaseDato';
  qry.SQL.Text:= 'SELECT EMPRESA FROM VIP_EMPLEADOS_TURNOS V '+
                 ' WHERE V.CODIGO= '+qAuxilio.ParamByName('CODIGOEMPLEADO').AsString;
  //qry.SQL.SaveToFile(GetTemporalPath+'EmpleadoTurno.txt');
  qry.Open;
  if not qry.IsEmpty then CODIGOEMPRESA := qry.FieldByName('EMPRESA').AsInteger;
  qry.Close;
  qry.Free;

  qOdt.Close;
  qOdt.Open;

  if qAuxilio.RecordCount>0 then
  begin
    qEmpleado.Close;
    qEmpleado.Open;
    qCuentaAuxiliar.Close;
    qCuentaAuxiliar.Open;
    qCIA.Close;
    qCIA.Open;
    qValorDesayuno.Close;
    qValorDesayuno.Open;
    if qValorDesayuno.RecordCount > 0 then
      qValorDesayuno.Edit
    else
      qValorDesayuno.Insert;
    qValorAlmuerzo.Close;
    qValorAlmuerzo.Open;

    if qValorAlmuerzo.RecordCount > 0 then
      qValorAlmuerzo.Edit
    else
      qValorAlmuerzo.Insert;
    qValorComida.Close;
    qValorComida.Open;
    if qValorComida.RecordCount > 0 then
      qValorComida.Edit
    else
      qValorComida.Insert;
    qGasolina.Close;
    qGasolina.Open;
    If qGasolina.RecordCount > 0 then
      qGasolina.Edit
    else
      qGasolina.Insert;
    qPeaje.Close;
    qPeaje.Open;
    If qPeaje.RecordCount > 0 then
      qPeaje.Edit
    else
      qPeaje.Insert;
    qParqueo.Close;
    qParqueo.Open;
    If qParqueo.RecordCount > 0 then
      qParqueo.Edit
    else
      qParqueo.Insert;
    qPasaje.Close;
    qPasaje.Open;
    If qPasaje.RecordCount > 0 then
      qPasaje.Edit
    else
      qPasaje.Insert;
    qReparacion.Close;
    qReparacion.Open;
    If qReparacion.RecordCount > 0 then
      qReparacion.Edit
    else
      qReparacion.Insert;
  end;
end;

procedure TFAuxilio.qEmpleadoAfterOpen(DataSet: TDataSet);
begin
  qCia.Close;
  qCia.Open;
end;

procedure TFAuxilio.FormShow(Sender: TObject);
var query:Tquery;
begin
  CalculaAuxilioAlimentacion;
  CalculaOtrosGastos;
  qAuxilioCODIGOVEHICULOValidate(qAuxilioCODIGOVEHICULO);
  qAuxilioCOBROINDIVIDUALValidate(qAuxilioCOBROINDIVIDUAL);
  qAuxilioRESPONSABLECOBROValidate(qAuxilioRESPONSABLECOBRO);

  query:=TQuery.Create(self);
  query.DatabaseName:='BaseDato';
  query.sql.text:='select codigoestadoodt from odt where codigoodt='+qAuxilioCODIGOODT.AsString;
  query.open;
  if query.fieldbyname('codigoestadoodt').AsString='6' then
  begin
    InhabilitarCambios;
  end;
  query.free;
  if qAuxilioESTADO.AsString='PRO' then
  begin
    InhabilitarCambios;
    Caption:=Caption+'  *** Solo Lectura(Procesado Por Nómina) ***';
    PanelEncabezado.Enabled:=false;
    PanelGastosTransporte.Enabled:=false;
    bbAceptar.Enabled:=false;
  end;
  qDesayuno.Close;
  qDesayuno.Open;
  qAlmuerzo.Close;
  qAlmuerzo.Open;
  qComida.Close;
  qComida.Open;
end;

procedure TFAuxilio.tdMemTable1CantidadDesayunosSetText(Sender: TField;
  const Text: String);
begin
  try
   if strtoint(Text)<=qAuxilioDias.AsInteger then Sender.AsString:=Text;
  except
  end;
end;
procedure TFAuxilio.tdMemTable1CantidadAlmuerzosSetText(Sender: TField;
  const Text: String);
begin
  try
    if strtoint(Text)<=qAuxilioDias.AsInteger then Sender.AsString:=Text;
  except
  end;
end;

procedure TFAuxilio.tdMemTable1CantidadComidasSetText(Sender: TField;
  const Text: String);
begin
  try
    if strtoint(Text)<=qAuxilioDias.AsInteger then Sender.AsString:=Text;
  except
  end;
end;

procedure TFAuxilio.tdMemTable1FechaChange(Sender: TField);
begin
  if sender.AsString<>'' then
  begin
    if qAuxilio.Active then
    begin
      if Sender.AsDateTime<qAuxilioFECHAFIN.AsDateTime then
      begin
        Sender.NewValue:=Sender.OldValue;
      end;
    end;
  end;
end;

procedure TFAuxilio.qAuxilioCANTIDADDESAYUNOSChange(Sender: TField);
begin
  if qValorDesayuno.Active then
  begin
    qValorDesayuno.Edit;
    qValorDesayunoVALORIMPUTACION.AsFloat := Sender.AsInteger * qDesayuno.FieldbyName('VALORAUXILIOALIMENTACION').AsFloat;
    Modificado:=true;
  end;
end;

procedure TFAuxilio.qAuxilioCANTIDADALMUERZOSChange(Sender: TField);
begin
  if qValorAlmuerzo.Active then
  begin
    qValorAlmuerzo.Edit;
    qValorAlmuerzoVALORIMPUTACION.AsFloat := Sender.AsInteger * qAlmuerzo.FieldbyName('VALORAUXILIOALIMENTACION').AsFloat;
    Modificado:=true;
  end;
end;

procedure TFAuxilio.qAuxilioCANTIDADCOMIDASChange(Sender: TField);
begin
  if qValorComida.Active then
  begin
    qValorComida.Edit;
    qValorComidaVALORIMPUTACION.AsFloat := Sender.AsInteger * qComida.FieldbyName('VALORAUXILIOALIMENTACION').AsFloat;
    Modificado:=true;
  end;
end;

procedure TFAuxilio.qValorDesayunoAfterInsert(DataSet: TDataSet);
var Query:TQuery;
begin
  DataSet.FieldByName('CODIGOAUXILIO').AsString:=qAuxilioCODIGOAUXILIO.AsString;
  Query:=TQuery.Create(Application);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT SQ_ODTAUXILIODETALLE.NEXTVAL FROM DUAL';
  Query.Open;
  DataSet.FieldByName('CODIGOAUXILIODETALLE').AsInteger:=Query.Fields[0].AsInteger;
  Query.Close;
  Query.sql.Clear;
  Query.sql.Add('SELECT CODIGOIMPUTACIONMANOOBRA');
  Query.sql.Add('FROM IMPUTACIONMANOOBRA IMO, ODTAUXILIO V, ODT O');
  Query.sql.Add('WHERE O.CODIGOODT=V.CODIGOODT');
  Query.sql.Add('AND IMO.VIGENCIADESDE<=V.FECHAINICIO');
  Query.sql.Add('AND (IMO.VIGENCIAHASTA>=V.FECHAFIN OR IMO.VIGENCIAHASTA IS NULL)');
  Query.sql.Add('AND V.CODIGOAUXILIO='+qAuxilioCODIGOAUXILIO.AsString);
  Query.sql.Add('AND IMO.CODIGOTIPOIMPUTACIONODT=''A''');
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''DES''');
  Query.sql.Add('AND IMO.TIPOCECOS='''+qEmpleadoTipoCecos.AsString+'''');  
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFAuxilio.qValorAlmuerzoAfterInsert(DataSet: TDataSet);
var Query:TQuery;
begin
  DataSet.FieldByName('CODIGOAUXILIO').AsString:=qAuxilioCODIGOAUXILIO.AsString;
  Query:=TQuery.Create(Application);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT SQ_ODTAUXILIODETALLE.NEXTVAL FROM DUAL';
  Query.Open;
  DataSet.FieldByName('CODIGOAUXILIODETALLE').AsInteger:=Query.Fields[0].AsInteger;
  Query.Close;
  Query.sql.Clear;
  Query.sql.Add('SELECT CODIGOIMPUTACIONMANOOBRA');
  Query.sql.Add('FROM IMPUTACIONMANOOBRA IMO, ODTAUXILIO V, ODT O');
  Query.sql.Add('WHERE O.CODIGOODT=V.CODIGOODT');
  Query.sql.Add('AND IMO.VIGENCIADESDE<=V.FECHAINICIO');
  Query.sql.Add('AND (IMO.VIGENCIAHASTA>=V.FECHAFIN OR IMO.VIGENCIAHASTA IS NULL)');
  Query.sql.Add('AND V.CODIGOAUXILIO='+qAuxilioCODIGOAUXILIO.AsString);
  Query.sql.Add('AND IMO.CODIGOTIPOIMPUTACIONODT=''A''');
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''ALM''');
  Query.sql.Add('AND IMO.TIPOCECOS='''+qEmpleadoTipoCecos.AsString+'''');  
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFAuxilio.qValorComidaAfterInsert(DataSet: TDataSet);
var Query:TQuery;
begin
  DataSet.FieldByName('CODIGOAUXILIO').AsString:=qAuxilioCODIGOAUXILIO.AsString;
  Query:=TQuery.Create(Application);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT SQ_ODTAUXILIODETALLE.NEXTVAL FROM DUAL';
  Query.Open;
  DataSet.FieldByName('CODIGOAUXILIODETALLE').AsInteger:=Query.Fields[0].AsInteger;
  Query.Close;
  Query.sql.Clear;
  Query.sql.Add('SELECT CODIGOIMPUTACIONMANOOBRA');
  Query.sql.Add('FROM IMPUTACIONMANOOBRA IMO, ODTAUXILIO V, ODT O');
  Query.sql.Add('WHERE O.CODIGOODT=V.CODIGOODT');
  Query.sql.Add('AND IMO.VIGENCIADESDE<=V.FECHAINICIO');
  Query.sql.Add('AND (IMO.VIGENCIAHASTA>=V.FECHAFIN OR IMO.VIGENCIAHASTA IS NULL)');
  Query.sql.Add('AND V.CODIGOAUXILIO='+qAuxilioCODIGOAUXILIO.AsString);
  Query.sql.Add('AND IMO.CODIGOTIPOIMPUTACIONODT=''A''');
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''COM''');
  Query.sql.Add('AND IMO.TIPOCECOS='''+qEmpleadoTipoCecos.AsString+'''');
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFAuxilio.qPeajeAfterInsert(DataSet: TDataSet);
var Query:TQuery;
begin
  DataSet.FieldByName('CODIGOAUXILIO').AsString:=qAuxilioCODIGOAUXILIO.AsString;
  Query:=TQuery.Create(Application);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT SQ_ODTAUXILIODETALLE.NEXTVAL FROM DUAL';
  Query.Open;
  DataSet.FieldByName('CODIGOAUXILIODETALLE').AsInteger:=Query.Fields[0].AsInteger;
  Query.Close;
  Query.sql.Clear;
  Query.sql.Add('SELECT CODIGOIMPUTACIONMANOOBRA');
  Query.sql.Add('FROM IMPUTACIONMANOOBRA IMO, ODTAUXILIO V, ODT O');
  Query.sql.Add('WHERE O.CODIGOODT=V.CODIGOODT');
  Query.sql.Add('AND IMO.VIGENCIADESDE<=V.FECHAINICIO');
  Query.sql.Add('AND (IMO.VIGENCIAHASTA>=V.FECHAFIN OR IMO.VIGENCIAHASTA IS NULL)');
  Query.sql.Add('AND V.CODIGOAUXILIO='+qAuxilioCODIGOAUXILIO.AsString);
  Query.sql.Add('AND IMO.CODIGOTIPOIMPUTACIONODT=''A''');
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''PEA''');
  Query.sql.Add('AND IMO.TIPOCECOS='''+qEmpleadoTipoCecos.AsString+'''');  
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFAuxilio.qPasajeAfterInsert(DataSet: TDataSet);
var Query:TQuery;
begin
  DataSet.FieldByName('CODIGOAUXILIO').AsString:=qAuxilioCODIGOAUXILIO.AsString;
  Query:=TQuery.Create(Application);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT SQ_ODTAUXILIODETALLE.NEXTVAL FROM DUAL';
  Query.Open;
  DataSet.FieldByName('CODIGOAUXILIODETALLE').AsInteger:=Query.Fields[0].AsInteger;
  Query.Close;
  Query.sql.Clear;
  Query.sql.Add('SELECT CODIGOIMPUTACIONMANOOBRA');
  Query.sql.Add('FROM IMPUTACIONMANOOBRA IMO, ODTAUXILIO V, ODT O');
  Query.sql.Add('WHERE O.CODIGOODT=V.CODIGOODT');
  Query.sql.Add('AND IMO.VIGENCIADESDE<=V.FECHAINICIO');
  Query.sql.Add('AND (IMO.VIGENCIAHASTA>=V.FECHAFIN OR IMO.VIGENCIAHASTA IS NULL)');
  Query.sql.Add('AND V.CODIGOAUXILIO='+qAuxilioCODIGOAUXILIO.AsString);
  Query.sql.Add('AND IMO.CODIGOTIPOIMPUTACIONODT=''A''');
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''PAS''');
  Query.sql.Add('AND IMO.TIPOCECOS='''+qEmpleadoTipoCecos.AsString+'''');  
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFAuxilio.qGasolinaAfterInsert(DataSet: TDataSet);
var Query:TQuery;
begin
  DataSet.FieldByName('CODIGOAUXILIO').AsString:=qAuxilioCODIGOAUXILIO.AsString;
  Query:=TQuery.Create(Application);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT SQ_ODTAUXILIODETALLE.NEXTVAL FROM DUAL';
  Query.Open;
  DataSet.FieldByName('CODIGOAUXILIODETALLE').AsInteger:=Query.Fields[0].AsInteger;
  Query.Close;
  Query.sql.Clear;
  Query.sql.Add('SELECT CODIGOIMPUTACIONMANOOBRA');
  Query.sql.Add('FROM IMPUTACIONMANOOBRA IMO, ODTAUXILIO V, ODT O');
  Query.sql.Add('WHERE O.CODIGOODT=V.CODIGOODT');
  Query.sql.Add('AND IMO.VIGENCIADESDE<=V.FECHAINICIO');
  Query.sql.Add('AND (IMO.VIGENCIAHASTA>=V.FECHAFIN OR IMO.VIGENCIAHASTA IS NULL)');
  Query.sql.Add('AND V.CODIGOAUXILIO='+qAuxilioCODIGOAUXILIO.AsString);
  Query.sql.Add('AND IMO.CODIGOTIPOIMPUTACIONODT=''A''');
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''GAS''');
  Query.sql.Add('AND IMO.TIPOCECOS='''+qEmpleadoTipoCecos.AsString+'''');  
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFAuxilio.qParqueoAfterInsert(DataSet: TDataSet);
var Query:TQuery;
begin
  DataSet.FieldByName('CODIGOAUXILIO').AsString:=qAuxilioCODIGOAUXILIO.AsString;
  Query:=TQuery.Create(Application);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT SQ_ODTAUXILIODETALLE.NEXTVAL FROM DUAL';
  Query.Open;
  DataSet.FieldByName('CODIGOAUXILIODETALLE').AsInteger:=Query.Fields[0].AsInteger;
  Query.Close;
  Query.sql.Clear;
  Query.sql.Add('SELECT CODIGOIMPUTACIONMANOOBRA');
  Query.sql.Add('FROM IMPUTACIONMANOOBRA IMO, ODTAUXILIO V, ODT O');
  Query.sql.Add('WHERE O.CODIGOODT=V.CODIGOODT');
  Query.sql.Add('AND IMO.VIGENCIADESDE<=V.FECHAINICIO');
  Query.sql.Add('AND (IMO.VIGENCIAHASTA>=V.FECHAFIN OR IMO.VIGENCIAHASTA IS NULL)');
  Query.sql.Add('AND V.CODIGOAUXILIO='+qAuxilioCODIGOAUXILIO.AsString);
  Query.sql.Add('AND IMO.CODIGOTIPOIMPUTACIONODT=''A''');
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''PAR''');
  Query.sql.Add('AND IMO.TIPOCECOS='''+qEmpleadoTipoCecos.AsString+'''');  
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFAuxilio.qValorDesayunoAfterPost(DataSet: TDataSet);
begin
  qValorDesayuno.ApplyUpdates;
  qValorDesayuno.CommitUpdates;
  qValorDesayuno.Edit;
end;

procedure TFAuxilio.qValorAlmuerzoAfterPost(DataSet: TDataSet);
begin
  qValorAlmuerzo.ApplyUpdates;
  qValorAlmuerzo.CommitUpdates;
  qValorAlmuerzo.Edit;
end;

procedure TFAuxilio.qValorComidaAfterPost(DataSet: TDataSet);
begin
  qValorComida.ApplyUpdates;
  qValorComida.CommitUpdates;
  qValorComida.Edit;
end;

procedure TFAuxilio.qPeajeAfterPost(DataSet: TDataSet);
begin
  qPeaje.ApplyUpdates;
  qPeaje.CommitUpdates;
  qPeaje.Edit;
end;

procedure TFAuxilio.qPasajeAfterPost(DataSet: TDataSet);
begin
  qPasaje.ApplyUpdates;
  qPasaje.CommitUpdates;
  qPasaje.Edit;
end;

procedure TFAuxilio.qGasolinaAfterPost(DataSet: TDataSet);
begin
  qGasolina.ApplyUpdates;
  qGasolina.CommitUpdates;
  qGasolina.Edit;
end;

procedure TFAuxilio.qParqueoAfterPost(DataSet: TDataSet);
begin
  qParqueo.ApplyUpdates;
  qParqueo.CommitUpdates;
  qParqueo.Edit;
end;

procedure TFAuxilio.qAuxilioCANTIDADDESAYUNOSValidate(Sender: TField);
var
  NumDiasExc, NumDiasVal: Integer;
  Hora : TDateTime;
  mensaje : String;
begin
  if sender.AsInteger>qAuxilioDiasDesayuno.AsInteger then
    raise Exception.Create('La Cantidad de desayunos no puede exceder el número de días que se haya trabajado durante las 6:00 a.m.');

  if (CODIGOEMPRESA <> 3) then Hora:=EncodeTime(6,0,0,0)
  else Hora:=EncodeTime(6,0,0,0);
  NumDiasExc:=  VerificacionFinDeSemanaYFestivos(qAuxilioFECHAINICIO.AsDateTime, qAuxilioFECHAFIN.AsDateTime, Hora, Hora, 1);
  NumDiasVal:= qAuxilioDiasDesayuno.AsInteger-NumDiasExc;
  if Sender.AsInteger > NumDiasVal then
  begin
    if (CODIGOEMPRESA <> 3) then
      mensaje:= 'La Cantidad de desayunos no puede ser mayor a ( '+IntToStr(NumDiasVal)+' ) debido a'+
                ' restricciones para los Fines de Semana y días Festivos.'
    else
      mensaje:= 'La Cantidad de desayunos no puede ser mayor a ( '+IntToStr(CupoAuxiliosGlobal)+' ) por que'+
                ' supera el total de Auxilios por turno para empleados de TermoBarranca.';
    raise Exception.Create(mensaje);
  end;
end;

procedure TFAuxilio.qAuxilioCANTIDADALMUERZOSValidate(Sender: TField);
var
  NumDiasExc, NumDiasVal: Integer;
  Hora : TDateTime;
  mensaje: String;
begin
  if sender.AsInteger>qAuxilioDiasAlmuerzo.AsInteger then
    raise Exception.Create('La Cantidad de almuerzos no puede exceder el número de días que se haya trabajado durante las 12:00 m.');

  if (CODIGOEMPRESA <> 3) then Hora:=EncodeTime(12,0,0,0)
  else Hora:=EncodeTime(12,0,0,0);
  NumDiasExc:=  VerificacionFinDeSemanaYFestivos(qAuxilioFECHAINICIO.AsDateTime, qAuxilioFECHAFIN.AsDateTime, Hora, Hora, 2);
  NumDiasVal:= qAuxilioDiasAlmuerzo.AsInteger-NumDiasExc;
  if Sender.AsInteger > NumDiasVal then
  begin
    if (CODIGOEMPRESA <> 3) then
      mensaje:= 'La Cantidad de almuerzos no puede ser mayor a ( '+IntToStr(NumDiasVal)+' ) debido a'+
                ' restricciones para los Fines de Semana y días Festivos.'
    else
      mensaje:= 'La Cantidad de almuerzos no puede ser mayor a ( '+IntToStr(CupoAuxiliosGlobal)+' ) por que'+
                ' supera el total de Auxilios por turno para empleados de TermoBarranca.';
    raise Exception.Create(mensaje);
  end;
end;

procedure TFAuxilio.qAuxilioCANTIDADCOMIDASValidate(Sender: TField);
var
  NumDiasExc, NumDiasVal, CantMensaje: Integer;
  Hora, Hora2 : TDateTime;
  mensaje: String;
begin
  if sender.AsInteger>qAuxilioDiasComida.AsInteger then
    raise Exception.Create('La Cantidad de comidas no puede exceder el número de días que se haya trabajado de 6:00 p.m. a 7:00 p.m.');

  if (CODIGOEMPRESA <> 3) then Hora:=EncodeTime(18,0,0,0)
  else Hora:=EncodeTime(18,0,0,0);
  if (CODIGOEMPRESA <> 3) then Hora2:=EncodeTime(19,0,0,0)
  else Hora2:=EncodeTime(19,0,0,0);
  NumDiasExc:=  VerificacionFinDeSemanaYFestivos(qAuxilioFECHAINICIO.AsDateTime, qAuxilioFECHAFIN.AsDateTime, Hora, Hora2, 3);
  NumDiasVal:= qAuxilioDiasComida.AsInteger-NumDiasExc;
  if (Sender.AsInteger > NumDiasVal) then
  begin
    if (CODIGOEMPRESA <> 3) then
      mensaje:= 'La Cantidad de comidas no puede ser mayor a ( '+IntToStr(NumDiasVal)+' ) debido a'+
                ' restricciones para los Fines de Semana y días Festivos.'
    else
      mensaje:= 'La Cantidad de comidas no puede ser mayor a ( '+IntToStr(CupoAuxiliosGlobal)+' ) por que'+
                ' supera el total de Auxilios por turno para empleados de TermoBarranca.';
    raise Exception.Create(mensaje);
  end;
end;

procedure TFAuxilio.CalculaAuxilioAlimentacion;
begin
  EdAlimentacion.Value:=qValorDesayunoVALORIMPUTACION.AsFloat+qValorAlmuerzoVALORIMPUTACION.AsFloat
    +qValorComidaVALORIMPUTACION.AsFloat;
  CalculaTotalAuxilio;
end;

procedure TFAuxilio.CalculaOtrosGastos;
begin
  EdOtrosGastos.Value:=qPasajeVALORIMPUTACION.AsFloat+qPeajeVALORIMPUTACION.AsFloat
    +qParqueoVALORIMPUTACION.AsFloat +qGasolinaVALORIMPUTACION.AsFloat+qReparacionVALORIMPUTACION.AsFloat;
  CalculaTotalAuxilio;
end;

procedure TFAuxilio.CalculaTotalAuxilio;
begin
  EdTotalAuxilios.Value:=EdAlimentacion.Value+ EdOtrosGastos.Value;
end;

procedure TFAuxilio.qValorDesayunoVALORIMPUTACIONChange(Sender: TField);
begin
  CalculaAuxilioAlimentacion;
end;

procedure TFAuxilio.qValorAlmuerzoVALORIMPUTACIONChange(Sender: TField);
begin
  CalculaAuxilioAlimentacion;
end;

procedure TFAuxilio.qValorComidaVALORIMPUTACIONChange(Sender: TField);
begin
  CalculaAuxilioAlimentacion;
end;

procedure TFAuxilio.qPeajeVALORIMPUTACIONChange(Sender: TField);
begin
  CalculaOtrosGastos;
end;

procedure TFAuxilio.qPasajeVALORIMPUTACIONChange(Sender: TField);
begin
  CalculaOtrosGastos;
end;

procedure TFAuxilio.qGasolinaVALORIMPUTACIONChange(Sender: TField);
begin
  CalculaOtrosGastos;
end;

procedure TFAuxilio.qParqueoVALORIMPUTACIONChange(Sender: TField);
begin
  CalculaOtrosGastos;
end;

procedure TFAuxilio.qAuxilioCODIGOVEHICULOValidate(Sender: TField);
const alfabeto = ['A'..'Z'];
  numeros=['0'..'9'];
var placa:string;
  query:tquery;
begin
  if qAuxilioCODIGOVEHICULO.AsString<>'' then
  begin
    placa:=trim(sender.AsString);
    if length(placa)<5 then
      raise Exception.Create('Placa inválida. Longitud debe ser de 6');
    if (not(placa[1] in alfabeto)) and (not(placa[2] in alfabeto))and (not(placa[3] in alfabeto)) then
      raise Exception.Create('Placa inválida. Verifique que los tres primeros campos sean letras.');
    if (not(placa[4] in numeros)) and (not(placa[5] in numeros))and (not(placa[6] in numeros)) then
      raise Exception.Create('Placa inválida. Verifique que los tres últimos campos sean números. Sin espacios ni otros caracteres.');

    query:=TQuery.create(self);
    query.databasename:='BaseDato';
    query.sql.add('select count(*)cont from vehiculo where codigovehiculo='''+sender.asstring+'''');
    query.sql.add('and codigopropietario=''1''');
    query.sql.add('and estado<>''R''');
    query.open;
    if (query.fieldbyname('cont').asinteger=0)then
      raise Exception.Create('Este placa de vehículo no Existe en la empresa.');
    query.free;
    dbEdPeaje.Enabled:=true;
    dbEdParqueadero.Enabled:=true;
  end
  else
  begin

  end;
end;

procedure TFAuxilio.sbAsociarVehiculoClick(Sender: TObject);
begin
  qOdtVehiculo.Close;
  qOdtVehiculo.Open;
  if qOdtVehiculo.RecordCount>0 then
  begin
    FOdtVehiculo:=TFOdtVehiculo.Create(Application);
    FOdtVehiculo.DBGridOdtVehiculo.DataSource:=dsOdtVehiculo;
    if FOdtVehiculo.ShowModal =mrOk then
    begin
      qAuxilioCODIGOVEHICULO.AsString:=qOdtVehiculoCODIGOVEHICULO.AsString;
    end;
    FOdtVehiculo.free;
  end
  else
    Application.MessageBox(PChar('No hay Vehículos asociados a la ODT.'),PChar('Error'),MB_OK+MB_ICONERROR);
end;

procedure TFAuxilio.qAuxilioRESPONSABLECOBROValidate(Sender: TField);
begin
  if sender.AsString='S' then
  begin
    qResponsableCobro.Close;
    qResponsableCobro.Open;
    if qResponsableCobro.Fields[0].AsInteger>0 then
      raise Exception.create('Ya existe un responsable del cobro del auxilios de alimentación'+
      char(13)+'para la ODT '+qAuxilioCODIGOODT.AsString);
  end;
end;

procedure TFAuxilio.dbChbResponsableCobroMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Perform(wm_NextDLGCTL, 0, 0);
end;

procedure TFAuxilio.qAuxilioFECHAINICIOValidate(Sender: TField);
begin
  if qAuxilio.State =dsEdit then
  begin
    if (sender.AsDateTime<qOdtFECHAINICIO.AsDateTime)  then
      raise Exception.Create('La fecha de inicio del auxilio de alimentación no puede ser anterior a la de la odt');
    qAuxilioCalcFields(qAuxilio);
    qAuxilioCANTIDADDESAYUNOSValidate(qAuxilioCANTIDADDESAYUNOS);
    qAuxilioCANTIDADALMUERZOSValidate(qAuxilioCANTIDADALMUERZOS);
    qAuxilioCANTIDADCOMIDASValidate(qAuxilioCANTIDADCOMIDAS);
  end;
end;

procedure TFAuxilio.qAuxilioFECHAFINValidate(Sender: TField);
begin
  if qAuxilio.State =dsEdit then
  begin
    if (sender.AsDateTime>qOdtFECHAFINAL.AsDateTime)  then
      raise Exception.Create('La fecha final del auxilio de alimentación no puede ser posterior a la de la odt');
    qAuxilioCalcFields(qAuxilio);
    qAuxilioCANTIDADDESAYUNOSValidate(qAuxilioCANTIDADDESAYUNOS);
    qAuxilioCANTIDADALMUERZOSValidate(qAuxilioCANTIDADALMUERZOS);
    qAuxilioCANTIDADCOMIDASValidate(qAuxilioCANTIDADCOMIDAS);
  end;
end;
//Determina el número de veces que se intersecta el intervalo HoraDesde-HoraHasta
// dentro del intervalo de fechas desde-hasta
function TFAuxilio.IntersectarVecesHora(FechaDesde, FechaHasta, HoraDesde,HoraHasta: tdatetime):integer;
var
  Fecha1, Fecha2, FechaAEvaluar: TDateTime;
  sFecha1, sFecha2, sFechaDesde, sFechaHasta, sHoraDesde, sHoraHasta: String;
begin
  Result:=0;
  FechaAEvaluar:= FechaDesde;
  while FechaAEvaluar <= FechaHasta do
  begin
    Fecha1:=Trunc(FechaAEvaluar)+Frac(HoraDesde);
    Fecha2:=Trunc(FechaAEvaluar)+Frac(HoraHasta);

    if ((Fecha1>=FechaDesde) and (Fecha1<=FechaHasta)) and
       ((Fecha2>=FechaDesde) and (Fecha2<=FechaHasta)) then
      inc(Result);

    FechaAEvaluar:=Int(FechaAEvaluar)+1;
  end;
end;

procedure TFAuxilio.qAuxilioFECHAINICIOChange(Sender: TField);
begin
  qDesayuno.Close;
  qDesayuno.Open;
  qAlmuerzo.Close;
  qAlmuerzo.Open;
  qComida.Close;
  qComida.Open;
  Modificado:=true;
end;

function TFAuxilio.validarFechaAuxilio(var odts: string): boolean;
var
  query:tquery;
  FechaInicio,FechaFin:String;
  sql:TStringList;
begin
  //Validaciones por separado
  result:=false;
  odts:='';
  sql:=TStringList.Create;
  FechaInicio:=FormatDateTime('dd/mm/yyyy hh:nn:ss',qAuxilioFECHAINICIO.AsDateTime);
  FechaFin:=FormatDateTime('dd/mm/yyyy hh:nn:ss',qAuxilioFECHAFIN.AsDateTime);

  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  sql.Add('SELECT CODIGOODT, CODIGOAUXILIO');
  sql.Add('FROM ODTAUXILIO A');
  sql.Add('WHERE A.CODIGOEMPLEADO='+qAuxilioCODIGOEMPLEADO.AsString);
  sql.Add('AND A.CODIGOAUXILIO<>'+qAuxilioCODIGOAUXILIO.AsString);
  sql.Add('AND (((to_date('''+FechaInicio+''',''dd/mm/yyyy HH24:MI:SS'')>A.FECHAINICIO)');
  sql.Add('AND (to_date('''+FechaInicio+''',  ''dd/mm/yyyy HH24:MI:SS'')<=A.FECHAFIN))');
  sql.Add('OR((to_date('''+FechaFin+''',      ''dd/mm/yyyy HH24:MI:SS'')>=A.FECHAINICIO )');
  sql.Add('AND(to_date('''+FechaFin+''',      ''dd/mm/yyyy HH24:MI:SS'')<A.FECHAFIN))');
  sql.Add('OR((to_date('''+FechaInicio+''',   ''dd/mm/yyyy HH24:MI:SS'')<=A.FECHAINICIO )');
  sql.Add('AND (to_date('''+FechaFin+''',     ''dd/mm/yyyy HH24:MI:SS'')>=A.FECHAFIN)) )');
  if (qAuxilioCANTIDADDESAYUNOS.AsInteger>0) then
  begin
    query.sql.clear;
    query.sql.Text:=sql.Text;
    query.sql.Add('AND (CANTIDADDESAYUNOS>0)');
    //query.SQL.SaveToFile(GetTemporalPath+'sqlFuncion_validarFechaAuxilio_uAuxilioPAS.txt');
    query.open;
    if (query.RecordCount>0) then
    begin
      while not(query.eof)  do
      begin
        odts:=odts+query.fields[0].asstring+' - '+query.fields[1].asstring+chr(13);
        query.next;
      end;
      query.Close;
      query.Free;
      sql.Free;
      Exit;
    end;
  end;
  if (qAuxilioCANTIDADALMUERZOS.AsInteger>0) then
  begin
    query.sql.clear;
    query.sql.Text:=sql.Text;
    query.sql.Add('AND (CANTIDADALMUERZOS>0 )');
    //query.SQL.SaveToFile(GetTemporalPath+'sqlFuncion_validarFechaAuxilio_uAuxilioPAS.txt');
    query.open;
    if (query.RecordCount>0) then
    begin
      while not(query.eof)  do
      begin
        odts:=odts+query.fields[0].asstring+' - '+query.fields[1].asstring+chr(13);
        query.next;
      end;
      query.Close;
      query.Free;
      sql.Free;
      Exit;
    end;
  end;
  if (qAuxilioCANTIDADCOMIDAS.AsInteger>0) then
  begin
    query.sql.clear;
    query.sql.Text:=sql.Text;
    query.sql.Add('AND (CANTIDADCOMIDAS>0 )');
    //query.SQL.SaveToFile(GetTemporalPath+'sqlFuncion_validarFechaAuxilio_uAuxilioPAS.txt');
    query.open;
    if (query.RecordCount>0) then
    begin
      while not(query.eof)  do
      begin
        odts:=odts+query.fields[0].asstring+' - '+query.fields[1].asstring+chr(13);
        query.next;
      end;
      query.Close;
      query.Free;
      sql.Free;
      Exit;
    end;
  end;
  Result:=true;
end;

procedure TFAuxilio.sbFechaInicioClick(Sender: TObject);
begin
  try
    dbedFechaInicio.Setfocus;
    sFecha := dbedFechaInicio.Text;
    Fecha := GetFecha(true,Sfecha);
    if Fecha <> '' then dbedFechaInicio.Text := Fecha;
  except
  end;
end;

procedure TFAuxilio.sbFechaFinClick(Sender: TObject);
begin
  try
    dbedFechaFin.Setfocus;
    sFecha := dbedFechaFin.Text;
    Fecha := GetFecha(true,sfecha);
    if Fecha <> '' then dbedFechaFin.Text := Fecha;
  except
  end;
end;

procedure TFAuxilio.qAuxilioCOBROINDIVIDUALValidate(Sender: TField);
begin
  if (Sender.AsString='S') then
  begin
    if qAuxilio.state in [dsEdit,dsInsert]then
      qAuxilioRESPONSABLECOBRO.AsString:='';
   // qAuxilioRESPONSABLECOBRO.ReadOnly:=true;
  end
  else
  begin
    qAuxilioRESPONSABLECOBRO.ReadOnly:=false;
  end;
end;

procedure TFAuxilio.qPeajeVALORIMPUTACIONValidate(Sender: TField);
begin
  if Sender.AsInteger>0 then
    if qAuxilioCODIGOVEHICULO.AsString='' then Raise Exception.Create('Debe ingresar primero la placa del vehiculo');
end;

procedure TFAuxilio.qGasolinaVALORIMPUTACIONValidate(Sender: TField);
begin
  if Sender.AsInteger>0 then
    if qAuxilioCODIGOVEHICULO.AsString='' then Raise Exception.Create('Debe ingresar primero la placa del vehiculo');
end;

procedure TFAuxilio.qParqueoVALORIMPUTACIONValidate(Sender: TField);
begin
  if Sender.AsInteger>0 then
    if qAuxilioCODIGOVEHICULO.AsString='' then Raise Exception.Create('Debe ingresar primero la placa del vehiculo');
end;

function TFAuxilio.validarFechaViatico(var odts: string): boolean;
var
  query:TQuery;
  FechaInicio,FechaFin:String;
  ContODTs: Integer;
  slODTs : TStringList;
begin
  ContODTs:=0;
  result:=false;
  odts:='';
  slODTs := TStringList.Create;
  slODTs.Sorted := True;
  FechaInicio:=FormatDateTime('dd/mm/yyyy hh:nn:ss', qAuxilioFECHAINICIO.AsDateTime);
  FechaFin:=FormatDateTime('dd/mm/yyyy hh:nn:ss', qAuxilioFECHAFIN.AsDateTime);

  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  query.sql.Add('SELECT V.CODIGOODT, V.CONCILIACIONREALIZADA, VD.VALORIMPUTACION');
  query.sql.Add('FROM ODTVIATICO V, ODTVIATICODETALLE VD');
  query.sql.Add('WHERE V.CODIGOVIATICO=VD.CODIGOVIATICO');
  query.sql.Add('AND (((to_date('''+FechaInicio+''',''DD/MM/YYYY HH24:MI:SS'')> V.FECHAINICIO)');
  query.sql.Add('AND (to_date('''+FechaInicio+''',''DD/MM/YYYY HH24:MI:SS'')<= V.FECHAFIN))');
  query.sql.Add('OR((to_date('''+FechaFin+''',''DD/MM/YYYY HH24:MI:SS'')>= V.FECHAINICIO )');
  query.sql.Add('AND(to_date('''+FechaFin+''',''DD/MM/YYYY HH24:MI:SS'')< V.FECHAFIN))');
  query.sql.Add('OR((to_date('''+FechaInicio+''',''DD/MM/YYYY HH24:MI:SS'') <= V.FECHAINICIO )');
  query.sql.Add('AND (to_date('''+FechaFin+''',''DD/MM/YYYY HH24:MI:SS'') >= V.FECHAFIN)) )');
  query.sql.Add('AND V.TIPOVIATICO = ''V'' ');
  query.sql.Add('AND V.CODIGOEMPLEADO='+qAuxilioCODIGOEMPLEADO.AsString);
  query.sql.Add('AND DEVOLUCION IS NULL');
  //query.SQL.SaveToFile(GetTemporalPath+'sqlFuncion_ValidarFechaViatico_uAuxilioPAS.txt');
  query.Open;
  if (query.RecordCount>0) then
  begin
    while not(query.eof)  do
    begin
      if (query.FieldByName('CONCILIACIONREALIZADA').AsString = 'S') and
         (query.FieldByName('VALORIMPUTACION').AsInteger = 0) then
        inc(ContODTs)
      else
        slODTs.Add(query.Fields[0].AsString);
      query.next;
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
//Valida fechas
function TFAuxilio.validarFechas: boolean;
begin
  result:=false;
  try
    qAuxilioFECHAINICIOValidate(qAuxilioFECHAINICIO);
    qAuxilioFECHAFINValidate(qAuxilioFECHAFIN);
    result:=true;
  except
  end;  
end;
// valida que se haya ingresado la placa del vehículo si ha gastos de vehículo
function TFAuxilio.validarVehiculo: boolean;
begin
  result:=false;
  try
    qPeajeVALORIMPUTACIONValidate(qPeajeVALORIMPUTACION);
    qGasolinaVALORIMPUTACIONValidate(qGasolinaVALORIMPUTACION);
    qParqueoVALORIMPUTACIONValidate(qParqueoVALORIMPUTACION);
    result:=true;
  except
  end;
end;

procedure TFAuxilio.EliminarRegistrosDetalleNulo;
var query:tquery;
begin
  query:=TQuery.Create(self);
  query.databasename:='BaseDato';
  query.sql.add('DELETE FROM ODTAUXILIODETALLE WHERE CODIGOAUXILIO='+qAuxilioCODIGOAUXILIO.AsString);
  query.sql.add('AND VALORIMPUTACION IS NULL');
  query.ExecSQL;
  query.free;
end;

// validar si la cantidad de días corresponde a la cantidad de auxilios de cada tipo
function TFAuxilio.ValidarCantidadAuxilioIgualDias: boolean;
var dias:integer;
begin
  result:=true;
  dias:=trunc(qAuxilioFECHAFIN.AsDateTime)-trunc(qAuxilioFECHAINICIO.AsDateTime)+1;
  if (qAuxilioCANTIDADDESAYUNOS.AsInteger<dias)and (qAuxilioCANTIDADDESAYUNOS.AsInteger>0)then
    result:=false;
  if(qAuxilioCANTIDADALMUERZOS.AsInteger<dias)and (qAuxilioCANTIDADALMUERZOS.AsInteger>0)then
    result:=false;
  if(qAuxilioCANTIDADCOMIDAS.AsInteger<dias)and (qAuxilioCANTIDADCOMIDAS.AsInteger>0) then
    result:=false;
end;

procedure TFAuxilio.ActualizarValoresSegunCantidades;
begin
  if qValorDesayuno.Active then
  begin
    qValorDesayuno.Edit;
    qValorDesayunoVALORIMPUTACION.AsFloat := qAuxilioCANTIDADDESAYUNOS.AsInteger * qDesayuno.FieldbyName('VALORAUXILIOALIMENTACION').AsFloat;
  end;

  if qValorAlmuerzo.Active then
  begin
    qValorAlmuerzo.Edit;
    qValorAlmuerzoVALORIMPUTACION.AsFloat := qAuxilioCANTIDADALMUERZOS.AsInteger * qAlmuerzo.FieldbyName('VALORAUXILIOALIMENTACION').AsFloat;
  end;

  if qValorComida.Active then
  begin
    qValorComida.Edit;
    qValorComidaVALORIMPUTACION.AsFloat := qAuxilioCANTIDADCOMIDAS.AsInteger * qComida.FieldbyName('VALORAUXILIOALIMENTACION').AsFloat;
  end;
end;

procedure TFAuxilio.qAuxilioBeforePost(DataSet: TDataSet);
begin
  if (qAuxilio.state=dsEdit) then
  begin
    if (qAuxilioFECHAINICIO.AsString='') then
      raise exception.create('La fecha de inicio del auxilio no puede ser nula');
    if (qAuxilioFECHAFIN.AsString='') then
      raise exception.create('La fecha de fin del auxilio no puede ser nula');
    ActualizarValoresSegunCantidades
  end;
end;

procedure TFAuxilio.qReparacionAfterInsert(DataSet: TDataSet);
var Query:TQuery;
begin
  DataSet.FieldByName('CODIGOAUXILIO').AsString:=qAuxilioCODIGOAUXILIO.AsString;
  Query:=TQuery.Create(Application);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Text:='SELECT SQ_ODTAUXILIODETALLE.NEXTVAL FROM DUAL';
  Query.Open;
  DataSet.FieldByName('CODIGOAUXILIODETALLE').AsInteger:=Query.Fields[0].AsInteger;
  Query.Close;
  Query.sql.Clear;
  Query.sql.Add('SELECT CODIGOIMPUTACIONMANOOBRA');
  Query.sql.Add('FROM IMPUTACIONMANOOBRA IMO, ODTAUXILIO V, ODT O');
  Query.sql.Add('WHERE O.CODIGOODT=V.CODIGOODT');
  Query.sql.Add('AND IMO.VIGENCIADESDE<=V.FECHAINICIO');
  Query.sql.Add('AND (IMO.VIGENCIAHASTA>=V.FECHAFIN OR IMO.VIGENCIAHASTA IS NULL)');
  Query.sql.Add('AND V.CODIGOAUXILIO='+qAuxilioCODIGOAUXILIO.AsString);
  Query.sql.Add('AND IMO.CODIGOTIPOIMPUTACIONODT=''A''');
  Query.sql.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''REP''');
  Query.sql.Add('AND IMO.TIPOCECOS='''+qEmpleadoTipoCecos.AsString+'''');  
  Query.sql.Add('AND O.CODIGOZONAORIGEN=IMO.CODIGOZONAESSA');
  Query.Open;
  DataSet.FieldByName('CODIGOIMPUTACIONMANOOBRA').AsInteger:=Query.fieldbyname('CODIGOIMPUTACIONMANOOBRA').AsInteger;
  Query.Free;
end;

procedure TFAuxilio.qReparacionAfterPost(DataSet: TDataSet);
begin
  qReparacion.ApplyUpdates;
  qReparacion.CommitUpdates;
  qReparacion.Edit;
end;

procedure TFAuxilio.qReparacionVALORIMPUTACIONChange(Sender: TField);
begin
  CalculaOtrosGastos;
end;

procedure TFAuxilio.qReparacionVALORIMPUTACIONValidate(Sender: TField);
begin
  if Sender.AsInteger>0 then
    if qAuxilioCODIGOVEHICULO.AsString='' then Raise Exception.Create('Debe ingresar primero la placa del vehiculo');
end;


procedure TFAuxilio.qEmpleadoCalcFields(DataSet: TDataSet);
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

function TFAuxilio.ValidarAuxilioCausado: boolean;
begin
  result:=true;
  if (qAuxilioFECHAINICIO.AsDateTime>FechaServidor) or
    (qAuxilioFECHAFIN.AsDateTime>FechaServidor) then
    result:=false;
end;

procedure TFAuxilio.FormCreate(Sender: TObject);
begin
  Editable:=true;
  Modificado:=false;
  CupoAuxiliosGlobal:= 0;
  CODIGOEMPRESA:=0;
end;

procedure TFAuxilio.qAuxilioMODIFICADOChange(Sender: TField);
begin
  Modificado:=true;
end;

procedure TFAuxilio.InhabilitarCambios;
begin
  Editable:=false;
  bbAceptar.Enabled:=false;
  qAuxilio.CachedUpdates:=False;
  qAuxilio.UpdateObject:=nil;
  qValorDesayuno.CachedUpdates:=False;
  qValorDesayuno.UpdateObject:=nil;
  qValorAlmuerzo.CachedUpdates:=False;
  qValorAlmuerzo.UpdateObject:=nil;
  qValorComida.CachedUpdates:=False;
  qValorComida.UpdateObject:=nil;
  qParqueo.CachedUpdates:=False;
  qParqueo.UpdateObject:=nil;
  qGasolina.CachedUpdates:=False;
  qGasolina.UpdateObject:=nil;
  qPasaje.CachedUpdates:=False;
  qPasaje.UpdateObject:=nil;
  qReparacion.CachedUpdates:=False;
  qReparacion.UpdateObject:=nil;
  qPeaje.CachedUpdates:=False;
  qPeaje.UpdateObject:=nil;
end;


function TFAuxilio.ObtenerTotalDiasExclusion(CodigoAdministrativoEmpleado: String; FechaDesde, FechaHasta, HoraDesde, HoraHasta: TDateTime): Integer;

const
  ArrayDiasDeLaSemana: array [1..7] of String = ('LUNES','MARTES','MIÉRCOLES','JUEVES','VIERNES','SÁBADO','DOMINGO');
var
  qry: TQuery;
  FechaAEvaluar: TDateTime;
  i, ContDias: Integer;
  Fecha1, Fecha2 : TDateTime;

  function DiaDeLaSemana(Fecha: TDateTime): String;
  var
   qry: TQuery;
   sFecha, sFechaOrcl :String;
  begin
    result:= '';
    qry:=TQuery.Create(nil);
    qry.DatabaseName:='BaseDato';
    sFecha:= FormatDateTime('dd/mm/yyyy HH:nn:ss', Fecha);
    sFechaOrcl := 'TO_DATE('''+sFecha+''', ''DD/MM/YYYY HH24:MI:SS'')';
    qry.SQL.Text:= 'SELECT TO_CHAR('+sFechaOrcl+','+QuotedStr('DAY')+','+
                   QuotedStr('NLS_DATE_LANGUAGE=SPANISH')+') AS DIA FROM DUAL';
    qry.Open;
    //qry.sql.savetofile('c:\dia.txt');
    if not qry.IsEmpty then result:= TRIM(qry.FieldByName('DIA').AsString);
    qry.Close;
    qry.Free;
  end;

  function EsDiaFestivo(Fecha: TDateTime): Boolean;
  var
   qry: TQuery;
   sFecha, sFechaOrcl :String;
  begin
    result:= False;
    qry:=TQuery.Create(nil);
    qry.DatabaseName:='BaseDato';
    sFecha:= FormatDateTime('dd/mm/yyyy', Fecha);
    sFechaOrcl := 'TO_DATE('''+sFecha+''', ''DD/MM/YYYY'')';
    qry.SQL.Text:= 'SELECT * FROM SIP_FESTIVOS WHERE UPPER(DESCRIPCION) <> '+QuotedStr('DOMINGO')+
                   ' AND UPPER(DESCRIPCION) <> '+QuotedStr('SABADO')+' AND FECHA = '+sFechaOrcl;
    qry.Open;
    //qry.sql.savetofile('c:\festivo.txt');
    if not qry.IsEmpty then result:= True;
    qry.Close;
    qry.Free;
  end;

begin
  ContDias:=0;
  if CodigoAdministrativoEmpleado <> '' then
  begin
    qry:=TQuery.Create(nil);
    qry.DatabaseName:='BaseDato';

    qry.SQL.Text:= 'SELECT SUM(R.LUNES) LUNES, SUM(R.MARTES) MARTES, SUM(R.MIERCOLES) MIERCOLES, '+
                   ' SUM(R.JUEVES) JUEVES, SUM(R.VIERNES) VIERNES, SUM(R.SABADO) SABADO, SUM(R.DOMINGO) DOMINGO, '+
                   ' SUM(R.FESTIVO) FESTIVO FROM EXCLUSIONAUXILIOCIA E, REGLAEXCLUSION R '+
                   ' WHERE E.CODIGOREGLAEXCLUSION = R.CODIGOREGLAEXCLUSION '+
                   ' AND E.CODIGOADMINISTRATIVO = '+CodigoAdministrativoEmpleado+
                   ' AND CODIGOTIPOAUXILIO = 1';
    qry.Open;
    //qry.SQL.SaveToFile('c:\sum.txt');
    while not qry.Eof do
    begin
      FechaAEvaluar:= FechaDesde;
      while FechaAEvaluar <= FechaHasta do
      begin
        HoraDesde:= Frac(HoraDesde)+ Trunc(FechaAEvaluar);
        HoraHasta:= Frac(HoraHasta)+ Trunc(FechaAEvaluar);
        Fecha2:= Min(HoraHasta,FechaHasta);
        Fecha1:= Max(HoraDesde,FechaAEvaluar);

        if  EsDiaFestivo(FechaAEvaluar)  then
        begin
          if  (qry.FieldByName('FESTIVO').AsInteger > 0) and (Fecha2 >= Fecha1) then inc(ContDias);
        end
        else
        begin
          for i:=0 to 6 do
          begin
            if qry.Fields[i].AsInteger > 0 then
              if (DiaDeLaSemana(FechaAEvaluar) = ArrayDiasDeLaSemana[i+1]) and (Fecha2 >= Fecha1) then
                inc(ContDias);
          end;
        end;
        FechaAEvaluar:= int(FechaAEvaluar)+1;
      end;
      qry.Next;
    end;
    qry.Close;
    qry.Free;
  end;
  result:= ContDias;
end;

//FUNCION QUE DEVUELVE LA CANTIDAD DE AUXILIOS (DESAYUNOS, ALMUERZOS O COMIDAS)
//A DESCONTAR DEL TOTAL DE AUXILIOS (DESAYUNOS, ALMUERZOS O COMIDAS) ENTRE FECHA INICIO Y FIN

function TFAuxilio.VerificacionFinDeSemanaYFestivos(FechaDesde, FechaHasta, HoraDesde, HoraHasta: TDateTime; TipoAuxilio: Integer): Integer;
var
  FechaAEvaluar, Fecha1, Fecha2: TDateTime;
  ContAux: Integer;
  HorasEntreFechas: Double;
  Hour1, Hour2, Mins1, Mins2, Sec1, Sec2, MSec: Word;
  bMenosDeOchoHoras: Boolean;
  a,b,c, AuxiliosTotales, CupoAuxilios : Integer;

  function EsDiaFestivoSabadoDomingo(Fecha: TDateTime): Boolean;
  var
   qry: TQuery;
   sFecha, sFechaOrcl :String;
  begin
    result:= False;
    qry:=TQuery.Create(nil);
    qry.DatabaseName:='BaseDato';
    sFecha:= FormatDateTime('dd/mm/yyyy', Fecha);
    sFechaOrcl := 'TO_DATE('''+sFecha+''', ''DD/MM/YYYY'')';
    qry.SQL.Text:= 'SELECT * FROM SIP_FESTIVOS WHERE FECHA = '+sFechaOrcl;
    qry.Open;
    if not qry.IsEmpty then result:= True;
    qry.Close;
    qry.Free;
  end;

begin
  ContAux:=0;
  bMenosDeOchoHoras:= False;
  CupoAuxilios:=0;
  AuxiliosTotales:=0;

  FechaAEvaluar:= FechaDesde;
  while FechaAEvaluar <= FechaHasta do
  begin
    Fecha1:=Trunc(FechaAEvaluar)+Frac(HoraDesde);
    Fecha2:=Trunc(FechaAEvaluar)+Frac(HoraHasta);
    if  EsDiaFestivoSabadoDomingo(FechaAEvaluar) then
    begin
      if TipoAuxilio = 2 then //ES ALMUERZO
      begin
        DecodeTime(FECHAHASTA, Hour1, Mins1, Sec1, MSec);
        DecodeTime(FECHADESDE, Hour2, Mins2, Sec2, MSec);
        HorasEntreFechas := (Trunc(FECHAHASTA) - Trunc(FECHADESDE))*24+
                            (Hour1-Hour2)+((Mins1-Mins2)*(1/60))+
                            ((Sec1-Sec2)*(1/3600));
        // TRABAJÓ MENOS DE OCHO HORAS
        if (HorasEntreFechas <  8) and (qAuxilioDiasAlmuerzo.AsInteger > 0) then
        begin
          ContAux:= 1;
          bMenosDeOchoHoras:= True;
          Break;
        end;
      end;

      if ((Fecha1>=FechaDesde) and (Fecha1<=FechaHasta)) and
         ((Fecha2>=FechaDesde) and (Fecha2<=FechaHasta)) then
      begin
        //SI NO ES DE TERMOBARRANCA y NO ES ALMUERZO SE DESCUENTA.
        if (CODIGOEMPRESA <> 3) and (TipoAuxilio <> 2) then inc(ContAux);
      end;
    end;
    FechaAEvaluar:= int(FechaAEvaluar)+1;
  end;

  // SI ES DE TERMOBARRANCA Y HA TRABAJADO MAS DE OCHO HORAS
  if (CODIGOEMPRESA = 3) and (not bMenosDeOchoHoras) then
  begin
    a:= qAuxilioDiasDesayuno.AsInteger;
    b:= qAuxilioDiasAlmuerzo.AsInteger;
    c:= qAuxilioDiasComida.AsInteger;

    if a>b then
      if a>c then  AuxiliosTotales := a
      else AuxiliosTotales := c
    else
    begin
      if b>c then AuxiliosTotales := b
      else AuxiliosTotales := c;
    end;

    if TipoAuxilio = 1 then
    begin
      CupoAuxilios:= AuxiliosTotales-(qAuxilioCANTIDADALMUERZOS.AsInteger+qAuxilioCANTIDADCOMIDAS.AsInteger);
      if (qAuxilioCANTIDADDESAYUNOS.AsInteger > CupoAuxilios) then
      begin
        CupoAuxiliosGlobal:= CupoAuxilios;
        ContAux:= a;
      end;
    end
    else if TipoAuxilio = 2 then
    begin
      CupoAuxilios:= AuxiliosTotales-(qAuxilioCANTIDADDESAYUNOS.AsInteger+qAuxilioCANTIDADCOMIDAS.AsInteger);
      if (qAuxilioCANTIDADALMUERZOS.AsInteger > CupoAuxilios) then
      begin
        CupoAuxiliosGlobal:= CupoAuxilios;
        ContAux:= b;
      end;
    end
    else if TipoAuxilio = 3 then
    begin
      CupoAuxilios:= AuxiliosTotales-(qAuxilioCANTIDADDESAYUNOS.AsInteger+qAuxilioCANTIDADALMUERZOS.AsInteger);
      if (qAuxilioCANTIDADCOMIDAS.AsInteger > CupoAuxilios) then
      begin
        CupoAuxiliosGlobal := CupoAuxilios;
        ContAux:= c;
      end;
    end;
  end;
  result:= ContAux;
end;

end.



