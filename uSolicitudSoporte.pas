unit uSolicitudSoporte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, dbctrls, Db, DBTables, Mask, ComCtrls,
  Menus, utMenuArbol, ImgList, Grids, DBGrids, RXDBCtrl, ToolEdit;

type
  TfSolicitudSoporte = class(TForm)
    Panel1: TPanel;
    Panel4: TPanel;
    qReporte1: TQuery;
    UpdSQLReporte: TUpdateSQL;
    lbCodigo: TLabel;
    dsReporte: TDataSource;
    Label2: TLabel;
    dbeCodigoReporte: TDBText;
    qTipoInformante: TQuery;
    Label3: TLabel;
    pcDatos: TPageControl;
    tsInformante: TTabSheet;
    tsFechas: TTabSheet;
    tsObservaciones: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    bbCancelar: TBitBtn;
    bbAceptar: TBitBtn;
    qCIA: TQuery;
    bbImprimir: TBitBtn;
    qAdministrativo: TQuery;
    gbInformante: TGroupBox;
    lbUsuarioSolicitante: TLabel;
    lbCIAInformante: TLabel;
    lbTelefono: TLabel;
    dbeTelefonoCia: TDBEdit;
    lbExtension: TLabel;
    dbeExtension: TDBEdit;
    gbDireccion: TGroupBox;
    gbFechas: TGroupBox;
    lbFechaInicialAsignada: TLabel;
    lbFechaFinalAsignada: TLabel;
    lbFechaInicialAtencion: TLabel;
    dbeFechaInicialAtencion: TDBEdit;
    dbeFechaFinalAsignada: TDBEdit;
    dbeFechaInicialAsignada: TDBEdit;
    sbFechaInicialAsignada: TSpeedButton;
    sbFechaFinalAsignada: TSpeedButton;
    sbFechaInicialAtencion: TSpeedButton;
    lbFechaFinalAtencion: TLabel;
    dbeFechaFinalAtencion: TDBEdit;
    sbFechaFinalAtencion: TSpeedButton;
    dbeUsuarioInformante: TDBEdit;
    lbUsuarioInformante: TLabel;
    qTipoDano: TQuery;
    dsTipoDano: TDataSource;
    lbFechaSolicitud: TLabel;
    dbEdFechaHora: TDBEdit;
    qReporte1CODIGOREPORTE: TFloatField;
    qReporte1CODIGOINFORMANTE: TStringField;
    qReporte1DIRECCIONINFORMANTE: TStringField;
    qReporte1NOMBREINFORMANTE: TStringField;
    qReporte1TELEFONO: TStringField;
    qReporte1CODIGOADMINISTRATIVO: TFloatField;
    qReporte1CODIGOTIPOREPORTE: TStringField;
    qReporte1CODIGOCLASEREPORTE: TStringField;
    qReporte1CODIGOTIPODANO: TFloatField;
    qReporte1CODIGOPRIORIDAD: TStringField;
    qReporte1CODIGOESTADOREPORTE: TStringField;
    qReporte1NUMEROCARTA: TStringField;
    qReporte1CODIGOESTADOCARTA: TFloatField;
    qReporte1REGISTROS: TFloatField;
    qReporte1DESCRIPCION: TStringField;
    qReporte1OBSERVACION: TStringField;
    qReporte1FECHAHORA: TDateTimeField;
    qReporte1FECHAULTIMOREGISTRO: TDateTimeField;
    qReporte1FECHAHORADICTADO: TDateTimeField;
    qReporte1FECHAHORALLEGADA: TDateTimeField;
    qReporte1FECHAHORAATENCION: TDateTimeField;
    qReporte1X: TFloatField;
    qReporte1Y: TFloatField;
    qReporte1ORIGENREPORTE: TStringField;
    qReporte1CODIGOTIPOELEMENTO: TStringField;
    qReporte1CODIGOELEMENTO: TStringField;
    qReporte1CODIGOSUBESTACION: TStringField;
    qReporte1CODIGOCIRCUITO: TStringField;
    qReporte1CODIGOTRAFODIS: TFloatField;
    qReporte1CODIGOAPOYO: TFloatField;
    qReporte1CODIGOCLIENTESGD: TFloatField;
    qReporte1CODIGOCLIENTECOM: TFloatField;
    qReporte1REPORTEPADRE: TFloatField;
    qReporte1PINTADOAPOYO: TStringField;
    qReporte1CODIGOTIPOVIA: TFloatField;
    qReporte1CODIGONOMBREVIA: TFloatField;
    qReporte1MODIFICADORVIA: TStringField;
    qReporte1DUPLICADOR: TFloatField;
    qReporte1MODIFICADORDUPLICADOR: TStringField;
    qReporte1NUMEROPUERTA: TFloatField;
    qReporte1CODIGOODT: TFloatField;
    qReporte1CONSECUTIVO: TFloatField;
    qReporte1CIAINFORMANTE: TFloatField;
    qReporte1CODIGOCONTADOR: TStringField;
    qReporte1PRIORIDADDANO: TFloatField;
    qReporte1NUMEROSAT: TFloatField;
    qReporte1FECHALIMITERESPUESTA: TDateTimeField;
    qReporte1NOMBREFUNCIONARIO: TStringField;
    qReporte1CODIGOGRUPOTRABAJO: TFloatField;
    qReporte1CODIGONODOBT: TStringField;
    qReporte1CODIGOINTERRUPTORDIS: TFloatField;
    qReporte1CODIGOTIPOPREDIO: TStringField;
    qReporte1DESCRIPCIONTIPOPREDIO: TStringField;
    qReporte1FECHAHORASAD: TDateTimeField;
    qReporte1CODIGOUSUARIOCREACION: TFloatField;
    qSolicitud: TQuery;
    dsSolicitud: TDataSource;
    sbtnCiaInformante: TSpeedButton;
    dbeCIAInformante: TDBEdit;
    lbDescripcion: TLabel;
    lbPrioridad: TLabel;
    DBETipoPrioridad: TDBLookupComboBox;
    qTipoPrioridad: TQuery;
    dsTipoPrioridad: TDataSource;
    DBLCBEstadoSolicitud: TDBLookupComboBox;
    updSolicitud: TUpdateSQL;
    qAplicativo: TQuery;
    dsAplicativo: TDataSource;
    qEstado: TQuery;
    dsEstado: TDataSource;
    lbTipoSolicitud: TLabel;
    DBLCBTipoSolicitud: TDBLookupComboBox;
    qTipoSolicitud: TQuery;
    dsTipoSolicitud: TDataSource;
    GroupBox1: TGroupBox;
    lbAplicativo: TLabel;
    dbeCodigoAplicativo: TDBEdit;
    DBENombreAplicativo: TDBLookupComboBox;
    lbAreaFuncional: TLabel;
    DBEAreaFuncional: TDBEdit;
    DBLCBAreaFuncional: TDBLookupComboBox;
    dbmDescripcionSolicitud: TDBMemo;
    lbDescripcionSolicitud: TLabel;
    lbObsevaciones: TLabel;
    DBMObservaciones: TDBMemo;
    lbUsuarioSoporte: TLabel;
    DBLCBUsuarioSoporte: TDBLookupComboBox;
    DBLCBUsuarioSolicitante: TDBLookupComboBox;
    qUsuario: TQuery;
    dsUsuario: TDataSource;
    qSolicitudCODIGOSOLICITUD: TFloatField;
    qSolicitudCODIGOCIASOLICITA: TFloatField;
    qSolicitudCODIGOUSUARIOINFORMANTE: TFloatField;
    qSolicitudCODIGOUSUARIOSOLICITA: TFloatField;
    qSolicitudCODIGOUSUARIOSOPORTE: TFloatField;
    qSolicitudFECHAHORASOLICITUD: TDateTimeField;
    qSolicitudCODIGOTIPOSOLICITUD: TFloatField;
    qSolicitudCODIGOPRIORIDADSOLICITUD: TFloatField;
    qSolicitudCODIGOESTADOSOLICITUD: TFloatField;
    qSolicitudNOMBRESOLICITUD: TStringField;
    qSolicitudDESCRIPCIONSOLICITUD: TBlobField;
    qSolicitudTELEFONOCIASOLICITA: TFloatField;
    qSolicitudEXTENSIONCIASOLICITA: TFloatField;
    qSolicitudFECHAINICIALASIGNADA: TDateTimeField;
    qSolicitudFECHAFINALASIGNADA: TDateTimeField;
    qSolicitudFECHAINICIALEJECUTADA: TDateTimeField;
    qSolicitudFECHAFINALEJECUTADA: TDateTimeField;
    qSolicitudCODIGOAPLICATIVO: TFloatField;
    qSolicitudOBSERVACIONES: TStringField;
    qSolicitudFECHAHORAREGISTRO: TDateTimeField;
    qSolicitudCODIGOUSUARIOCREACION: TFloatField;
    qAreaFuncional: TQuery;
    dsAreaFuncional: TDataSource;
    qSolicitudCODIGOAREAFUNCIONAL: TFloatField;
    qEmpleado: TQuery;
    dsEmpleado: TDataSource;
    qSolicitudNombreUsuario11: TStringField;
    qSolicitudNombreCIA: TStringField;
    DBCIA: TDBText;
    DBTCIA: TDBText;
    lbFechaHoraSolicitud: TLabel;
    DBEFechaSolicitud: TDBEdit;
    Label1: TLabel;
    DBENombreSolicitud: TDBEdit;
    DBECodigoSolicitud: TDBEdit;
    DBTNombreSolicitud: TDBText;
    Label4: TLabel;
    dbeFechaHoraSolicitud: TDBEdit;
    sbFechaSolicitud: TSpeedButton;
    qTipoUsuario: TQuery;
    dsTipoUsuario: TDataSource;
    qTipoUsuarioCODIGOTIPOUSUARIO: TStringField;
    qProgramacionUsuarioSoporte: TQuery;
    dsProgramacionUsuarioSoporte: TDataSource;
    updProgramacionUsuarioSoporte: TUpdateSQL;
    qProgramacionUsuarioSoporteCODIGOPROGRAMACIONUSUARIO: TFloatField;
    qProgramacionUsuarioSoporteCODIGOUSUARIOSOPORTE: TFloatField;
    qProgramacionUsuarioSoporteCODIGOSOLICITUD: TFloatField;
    qProgramacionUsuarioSoporteFECHAINICIOASIGNADA: TDateTimeField;
    qProgramacionUsuarioSoporteFECHAFINALASIGNADA: TDateTimeField;
    qProgramacionUsuarioSoporteCODIGOESTADOSOLICITUD: TFloatField;
    qUsuarioSoporte: TQuery;
    qSolicitudCODIGOUSUARIOMODIFICACION: TFloatField;
    qSolicitudFECHAHORAMODIFICACION: TDateTimeField;
    dsUsuarioSoporte: TDataSource;
    DBTECIA: TDBText;
    dsCIA: TDataSource;
    qSolicitudNombreUsuarioInformante: TStringField;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    dsTipoAtencion: TDataSource;
    qTipoAtencion: TQuery;
    qSolicitudCODIGOTIPOATENCION: TFloatField;
    DBLookupComboBox2: TDBLookupComboBox;
    Label6: TLabel;
    qTipoSoporte: TQuery;
    dsTipoSoporte: TDataSource;
    qSolicitudCODIGOTIPOSOPORTE: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure qReporte1AfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure qReporte1CODIGOINFORMANTEChange(Sender: TField);
    procedure sbFechaInicialAsignadaClick(Sender: TObject);
    procedure sbFechaFinalAsignadaClick(Sender: TObject);
    procedure sbFechaInicialAtencionClick(Sender: TObject);
    procedure qReporte1FECHAHORADICTADOValidate(Sender: TField);
    procedure qReporte1FECHAHORALLEGADAValidate(Sender: TField);
    procedure qReporte1FECHAHORAATENCIONValidate(Sender: TField);
    procedure qReporte1CODIGOESTADOREPORTEValidate(Sender: TField);
    procedure bbAceptarClick(Sender: TObject);
    procedure bbCancelarClick(Sender: TObject);
    procedure qReporte1UpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure sbEmergenciaClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure qReporteElementoUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure qReporteElementoAfterPost(DataSet: TDataSet);
    procedure qReporteElementoAfterDelete(DataSet: TDataSet);
    procedure qReporte1CODIGOADMINISTRATIVOValidate(Sender: TField);
    procedure bbImprimirClick(Sender: TObject);
    procedure Reporte1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbFechaFinalAtencionClick(Sender: TObject);
    procedure qReporte1FECHALIMITERESPUESTAValidate(Sender: TField);
    procedure lbCodigoDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbFechaSolicitudClick(Sender: TObject);
    procedure qReporte1AfterClose(DataSet: TDataSet);
    procedure sbFechaFinClick(Sender: TObject);
    procedure qReporte1FECHAHORAValidate(Sender: TField);
    procedure sbtnCiaInformanteClick(Sender: TObject);
    procedure qSolicitudAfterInsert(DataSet: TDataSet);
    procedure qSolicitudCODIGOCIASOLICITAValidate(Sender: TField);
    procedure qSolicitudCODIGOAREAFUNCIONALChange(Sender: TField);
    procedure qSolicitudCODIGOCIASOLICITAChange(Sender: TField);
    procedure qSolicitudAfterDelete(DataSet: TDataSet);
    procedure qSolicitudAfterPost(DataSet: TDataSet);
    procedure sbFechaDictadoClick(Sender: TObject);
    procedure qProgramacionUsuarioSoporteAfterInsert(DataSet: TDataSet);
    procedure qProgramacionUsuarioSoporteAfterDelete(DataSet: TDataSet);
    procedure qProgramacionUsuarioSoporteAfterPost(DataSet: TDataSet);
    procedure qProgramacionUsuarioSoporteBeforePost(DataSet: TDataSet);
    procedure qSolicitudCODIGOSOLICITUDChange(Sender: TField);
    procedure qSolicitudCODIGOAREAFUNCIONALValidate(Sender: TField);
    procedure qSolicitudCODIGOUSUARIOINFORMANTEValidate(Sender: TField);
    procedure qSolicitudCalcFields(DataSet: TDataSet);
  private
    NumeroODT : Integer;
    TiempoMaximoAtencion:double;
    procedure DatosIniciales;
    procedure CambiarEstadoEdit(Edit:TDBEdit;Estado:Boolean);
    function GetFechaHora: String;
    function GetFecha: String;
    //Verifica que el usuario actual puede editar un reporte
    function EditarReporte:Boolean;
    function FechaServidor: string;
  public
    { Public declarations }
    bDatosIncompletos, bCancelando: Boolean;
    ModoInsercion : Boolean;
    Fecha: string;
  end;

var
  fSolicitudSoporte: TfSolicitudSoporte;

implementation

uses uFormaFecha, uDatosComercial, uFIMPAdministrativo, uListaReportes,
  uInfoElectricoCliente, uQRReporte, uQRElementoReporte, uFuncionSGD,
  uInformacionReporte, uElementosElectricos, uReporteSimilar,
  uArbolInterruptores, uBuscarTipoDano, ConsDll, uAsignarODT,
  uComunesAdministrativo, ulistasoporte;
{$R *.DFM}

procedure TfSolicitudSoporte.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfSolicitudSoporte.FormActivate(Sender: TObject);
begin
 { if qReporte.State in [dsInsert] then //Insertando un Nuevo Registro
  begin
      CambiarEstadoEdit(dbeFechaLlegada,False);
      sbFechaLlegada.Enabled:=False;
      CambiarEstadoEdit(dbeFechaAtencion,False);
      sbFechaAtencion.Enabled:=False;
      CargarBarraTipoReporte;
  end;
  if qReporteCODIGOADMINISTRATIVO.AsString <> '' then
    qReporteCODIGOADMINISTRATIVOValidate(qReporteCODIGOADMINISTRATIVO);

  if qReporteCODIGOTIPOREPORTE.AsString <> '' then
    qReporteCODIGOTIPOREPORTEValidate(qReporteCODIGOTIPOREPORTE);

  if qReporteCODIGOINFORMANTE.AsString <> '' then
    qReporteCODIGOINFORMANTEChange(qReporteCODIGOINFORMANTE);
    }
end;

procedure TfSolicitudSoporte.DatosIniciales;
var qFecha:TQuery;
begin
   with qSolicitud do
   begin
      qFecha:=TQuery.Create(Application);
      qFecha.DataBaseName:='BaseDato';
      qFecha.SQL.Text:='SELECT SYSDATE FROM DUAL';
      qFecha.Open;
      FieldByName('FECHAHORAREGISTRO').AsDateTime:=qFecha.Fields[0].AsDateTime;
      qFecha.Free;
      FieldByName('CODIGOUSUARIOINFORMANTE').AsFloat:= VarCodigoUsuario; //logueado
      FieldByName('REGISTROS').AsString:='1';
      FieldByName('CODIGOUSUARIOCREACION').AsInteger:=VarCodigoUsuario;//Usuario Creacion
   end;
end;

procedure TfSolicitudSoporte.qReporte1AfterInsert(DataSet: TDataSet);
begin
  DatosIniciales;
end;

procedure TfSolicitudSoporte.FormCreate(Sender: TObject);
var qInformante:TQuery;
begin
  qSolicitud.Open;
  qSolicitud.Insert;
  qProgramacionUsuarioSoporte.Open;
  qAreaFuncional.Open;
  qEstado.Open;
  qTipoSolicitud.Open;
  qUsuario.Open;
  qUsuarioSoporte.Open;
  qTipoPrioridad.Open;
  qCIA.Open;
  qTipoAtencion.open;
  qtiposoporte.open;
 {
  RefrescarVariables;

  if qSolicitud.State=dsInsert then
  begin
    qSolicitudFECHAHORAREGISTRO.AsString:=DateTimeToStr(now);
    qSolicitudCODIGOUSUARIOINFORMANTE.AsString:=IntToStr(VarCodigoUsuario);
    qSolicitudFECHAHORAMODIFICACION.AsString:=DateTimeToStr(now);
    qSolicitudCODIGOUSUARIOMODIFICACION.AsString:=IntToStr(VarCodigoUsuario);
    qSolicitudCODIGOESTADOSOLICITUD.AsString:='5';//SOLICITADA
    qUsuario.Close;
    qUsuario.ParamByName('CODIGOUSUARIO').AsString:=qSolicitudCODIGOUSUARIOINFORMANTE.AsString;
    qUsuario.Open;
  end;
  bCancelando := False;

 //HABILITAR MENÚS
//  RefrescarVariables;
  qTipoUsuario.Close;
  qTipoUsuario.ParamByName('CODIGOUSUARIO').AsInteger:=VarCodigoUsuario;
  qTipoUsuario.Open;

  If (qTipoUsuarioCODIGOTIPOUSUARIO.AsInteger=1) or (qTipoUsuarioCODIGOTIPOUSUARIO.AsInteger=0) then
  begin
    DBEFechaSolicitud.Enabled:=true;
    DBLCBUsuarioSoporte.Enabled:=true;
    dbeFechaInicialAsignada.Enabled:=true;
    sbFechaInicialAsignada.Enabled:=true;
    dbeFechaFinalAsignada.Enabled:=true;
    sbFechaFinalAsignada.Enabled:=true;
    dbeFechaInicialAtencion.Enabled:=true;
    sbFechaInicialAtencion.Enabled:=true;
    dbeFechaFinalAtencion.Enabled:=true;
    sbFechaFinalAtencion.Enabled:=true;
    DBLCBEstadoSolicitud.ReadOnly:=false;
    DBLCBEstadoSolicitud.Enabled:=true;
  end;
  }
end;

procedure TfSolicitudSoporte.qReporte1CODIGOINFORMANTEChange(Sender: TField);
begin
{  lbUsuarioInformante.Enabled:=False;
  dbeUsuarioInformante.Enabled:=False;
  dbeUsuarioInformante.Color:=clBtnFace;
  lbCIAInformante.Enabled:=False;
  dbeCIAInformante.Enabled:=False;
  dbeCIAInformante.Color:=clBtnFace;
  dbeCIAInformante.PopupMenu:=nil;
  lbFecha4.Enabled:=False;
  dbeFechaLimite.Enabled:=False;
  dbeFechaLimite.Color:=clBtnFace;
  sbFechaLimite.Enabled:=False;
  lbFechaSad.Enabled:=False;
  dbeFechaSAD.Enabled:=False;
  dbeFechaSaD.Color:=clBtnFace;
  sbFechaSAD.Enabled:=False;
  qReporteCIAINFORMANTE.AsString:='';
  qReporteNOMBREFUNCIONARIO.AsString:='';
  qReporteNUMEROCARTA.AsString:='';
  lbCIAInformante.Enabled:=True;
  lbCIAInformante.Caption:='CIA';
  dbeCIAInformante.Enabled:=True;
  dbeCIAInformante.DataField:='CIAINFORMANTE';
  dbeCIAInformante.Color:=clWindow;
  dbeCIAInformante.PopupMenu:=dMenuArbol2;
  lbFuncionario.Enabled:=True;
  dbeFuncionario.Enabled:=True;
  dbeFuncionario.Color:=clWindow;
  lbCIAInformante.Enabled:=True;
  lbCIAInformante.Caption:='# Rad';
  dbeCIAInformante.Enabled:=True;
  dbeCIAInformante.DataField:='NUMEROSAT';
  dbeCIAInformante.Color:=clWindow;
  dbeCIAInformante.PopupMenu:=nil;
  lbFecha4.Enabled:=True;
  dbeFechaLimite.Enabled:=True;
  dbeFechaLimite.Color:=clWindow;
  sbFechaLimite.Enabled:=True;
  lbFechaSad.Enabled:=True;
  dbeFechaSAD.Enabled:=True;
  dbeFechaSAD.Color:=clWindow;
  sbFechaSAD.Enabled:=True;
  lbFecha1.Caption:='Fecha y Hora de Dictado';
  lbFecha2.Caption:='Fecha y Hora de Llegada';
 lbFecha3.Caption:='Fecha y Hora de Atención';
}
end;

procedure TfSolicitudSoporte.CambiarEstadoEdit(Edit:TDBEdit;Estado: Boolean);
begin
  {
  if not Estado then
  begin
    Edit.Color:=clSilver;
    Edit.Enabled:=False;
  end
  else
  begin
    Edit.Color:=clWindow;
    Edit.Enabled:=True;
  end;
  }
end;

function TfSolicitudSoporte.GetFechaHora: String;
begin

  fFormaFecha := TfFormaFecha.Create(Application);
  uFormaFecha.sFecha := Fecha;
  fFormaFecha.height:=291;
  if FFormaFecha.ShowModal = mrOk
  then Result := DateTimetoStr(FFormaFecha.Date+FFormaFecha.fTime)
  else Result := sFecha;
  fFormaFecha.Free;

end;

procedure TfSolicitudSoporte.sbFechaInicialAsignadaClick(Sender: TObject);
var sFecha:string;
begin
  sFecha:='';
  Fecha := '';
  dbeFechaInicialAsignada.Setfocus;
  Fecha := qSolicitudFECHAINICIALASIGNADA.AsString;
  if Fecha = '' then
    Fecha := FechaServidor;
  sFecha:=GetFechaHora;
  if sFecha<>'' then
  begin
    qSolicitud.FieldbyName('FECHAINICIALASIGNADA').AsString := sFecha;
    qSolicitud.FieldByName('CODIGOESTADOSOLICITUD').AsString :='1'; //Asignado
  end;
end;

procedure TfSolicitudSoporte.sbFechaFinalAsignadaClick(Sender: TObject);
var sFecha:string;
begin
  sFecha:='';
  Fecha := '';
  dbeFechaFinalAsignada.Setfocus;
  Fecha :=qSolicitudFECHAFINALASIGNADA.AsString;
  if Fecha = '' then
    Fecha := FechaServidor;
  sFecha:=GetFechaHora;
  if sFecha<>'' then
  begin
    qSolicitud.FieldbyName('FECHAFINALASIGNADA').AsString :=sFecha;
    qSolicitud.FieldByName('CODIGOESTADOSOLICITUD').AsString :='1'; //Asignado
  end;
end;

procedure TfSolicitudSoporte.sbFechaInicialAtencionClick(Sender: TObject);
var sFecha:string;
begin
  sFecha:='';
  Fecha := '';
  dbeFechaInicialAtencion.Setfocus;
  Fecha := qSolicitudFECHAINICIALEJECUTADA.AsString;
  if Fecha = '' then
    Fecha := FechaServidor;
  sFecha:=GetFechaHora;
  if sFecha<>'' then
  begin
    qSolicitud.FieldbyName('FECHAINICIALEJECUTADA').AsString := sFecha;
    qSolicitudCODIGOESTADOSOLICITUD.AsString:='3';
  end;
end;

procedure TfSolicitudSoporte.qReporte1FECHAHORADICTADOValidate(Sender: TField);
begin
{  if Sender.Text<>'' then
  begin
    if (qReporteFECHAHORA.AsString<>'') then
    begin
      if (Sender.AsDateTime < qReporteFECHAHORA.AsDateTime) then
        raise Exception.Create('La fecha de dictado no puede ser menor que la fecha de recepción del reporte.')
      else
        if (TiempoMaximoAtencion>0) then
          if (((Sender.AsDateTime - qReporteFECHAHORA.AsDateTime)*24*60)>TiempoMaximoAtencion) then  // tiempo de atencion mayor de atencion máximo esperado
             if Application.MessageBox('El tiempo de dictado supera el tiempo esperado.  Desea conservarlo?',PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idNo then
              abort;
    end
    else
      raise Exception.Create('La fecha de recepción del reporte no puede estar vacía.');
    if (qReporteFECHAHORALLEGADA.AsString<>'') then
    begin
      if (Sender.AsDateTime > qReporteFECHAHORALLEGADA.AsDateTime) then
       raise Exception.Create('La fecha de dictado no puede ser mayor que la fecha de llegada al sitio de trabajo.');
    end;
    if (qReporteFECHAHORAATENCION.AsString<>'') then
    begin
      if (Sender.AsDateTime > qReporteFECHAHORAATENCION.AsDateTime) then
       raise Exception.Create('La fecha de dictado no puede ser mayor que la fecha de atención del reporte.');
    end;
  end;
  }
end;

procedure TfSolicitudSoporte.qReporte1FECHAHORALLEGADAValidate(Sender: TField);
begin
{  if Sender.Text<>'' then
  begin

    if (qReporteFECHAHORA.AsString<>'') then
    begin
      if (Sender.AsDateTime < qReporteFECHAHORA.AsDateTime) then
       raise Exception.Create('La fecha de llegada al sitio de trabajo no puede ser menor'+ Chr(13) +'que la fecha de recepción del reporte.');
    end
    else
      raise Exception.Create('La fecha de recepción del reporte no puede estar vacía.');
    if (qReporteFECHAHORADICTADO.AsString<>'') then
    begin
      if (Sender.AsDateTime < qReporteFECHAHORADICTADO.AsDateTime) then
       raise Exception.Create('La fecha de llegada al sitio de trabajo no puede ser menor'+ Chr(13) +'que la fecha de dictado del reporte a la cuadrilla.')
      else
        if (TiempoMaximoAtencion>0) then
          if (((Sender.AsDateTime - qReporteFECHAHORADICTADO.AsDateTime)*24*60)>TiempoMaximoAtencion) then  // tiempo de atencion mayor de atencion máximo esperado
            if Application.MessageBox('El tiempo de llegada supera el tiempo esperado.  Desea conservarlo?',PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idNo then
              abort;
    end
    else
      raise Exception.Create('La fecha de dictado del reporte no puede estar vacía.');
    if (qReporteFECHAHORAATENCION.AsString<>'') then
    begin
      if (Sender.AsDateTime > qReporteFECHAHORAATENCION.AsDateTime) then
       raise Exception.Create('La fecha de dictado no puede ser mayor que la fecha de atención del reporte.');
    end;
  end;
  }
end;

procedure TfSolicitudSoporte.qReporte1FECHAHORAATENCIONValidate(Sender: TField);
begin
 { if Sender.Text<>'' then
  begin
    if (qReporteFECHAHORA.AsString<>'') then
    begin
      if (Sender.AsDateTime < qReporteFECHAHORA.AsDateTime) then
       raise Exception.Create('La fecha de atención del reporte no puede ser menor'+ Chr(13) +'que la fecha de recepción del reporte.');
    end
    else
      raise Exception.Create('La fecha de recepción del reporte no puede estar vacía.');
    if (qReporteFECHAHORADICTADO.AsString<>'') then
    begin
      if (Sender.AsDateTime < qReporteFECHAHORADICTADO.AsDateTime) then
       raise Exception.Create('La fecha de atención del reporte no puede ser menor'+ Chr(13) +'que la fecha de dictado del reporte a la cuadrilla.');
    end
    else
      raise Exception.Create('La fecha de dictado del reporte no puede estar vacía.');
    if (qReporteFECHAHORALLEGADA.AsString<>'') then
    begin
      if (Sender.AsDateTime < qReporteFECHAHORALLEGADA.AsDateTime) then
        raise Exception.Create('La fecha de atención del reporte no puede ser menor'+ Chr(13) +'que la fecha de llegada al sitio de trabajo.')
      else
        if (TiempoMaximoAtencion>0) then
          if ((((Sender.AsDateTime - qReporteFECHAHORALLEGADA.AsDateTime)/24)*60)>TiempoMaximoAtencion) then  // tiempo de atencion mayor de atencion máximo esperado
            if Application.MessageBox('El tiempo de atención supera el tiempo esperado.  Desea conservarlo?',PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idNo then
              abort;
    end
    else
      raise Exception.Create('La fecha de llegada al sitio de trabajo del reporte no puede estar vacía.');
  end;
  }
end;

procedure TfSolicitudSoporte.qReporte1CODIGOESTADOREPORTEValidate(Sender: TField);
begin
 {  if Sender.Text <> '' then
   begin
     if (Sender.Text='2') and (dbeFechaDictado.Text='') then
        raise Exception.Create('Para Cambiar el Estado del Reporte a Asignado, Debe' + Chr(13) +
                               'Llenar la Fecha de Dictado.');
     if (Sender.Text='3') and (dbeFechaDictado.Text='') then
        raise Exception.Create('Para Cambiar el Estado del Reporte a En Ejecución, Debe' + Chr(13) +
                               'Llenar la Fecha de Dictado.');
     if (Sender.Text='3') and (dbeFechaLlegada.Text='') then
        raise Exception.Create('Para Cambiar el Estado del Reporte a En Ejecución, Debe' + Chr(13) +
                               'Llenar la Fecha de Llegada.');
     if (Sender.Text='4') and (dbeFechaAtencion.Text='') then
        raise Exception.Create('Para Cambiar el Estado del Reporte a Reparado, Debe' + Chr(13) +
                               'Llenar la Fecha de Atención.');
   end;
   }
end;
  /////////AQUÍ VOY
procedure TfSolicitudSoporte.bbAceptarClick(Sender: TObject);
var MostrarMensaje, Transaccion: Boolean;
    ListaError: TStringList;
    ODTHija: TODTHija;
    CodigoSolicitud: integer;
begin
  bDatosIncompletos := False;
  Transaccion := False;
  try
    if qSolicitud.State in [dsInsert] then
    begin
      if (qSolicitudCODIGOCIASOLICITA.AsString = '') then
      begin
        Application.MessageBox(pChar('Debe Seleccionar la Dependencia'),'Error en la Dependencia',mb_iconerror);
        exit;
      end;

      if (qSolicitudCODIGOUSUARIOINFORMANTE.AsString = '') then
      begin
        Application.MessageBox(pChar('Debe Seleccionar el Usuario Informante'),'Error en el Usuario Informante',mb_iconerror);
        exit;
      end;

      if (qSolicitudCODIGOUSUARIOSOLICITA.AsString = '') then
      begin
        Application.MessageBox(pChar('Debe Seleccionar el Usuario que Solicita el Soporte'),'Error en el Usuario que Solicita el Soporte',mb_iconerror);
        exit;
      end;

      if (qSolicitudFECHAHORASOLICITUD.AsString = '') then
      begin
        Application.MessageBox(pChar('Debe Seleccionar la Fecha de la Solicitud'),'Error en la Fecha de la Solicitud',mb_iconerror);
        exit;
      end;

      if (qSolicitudNOMBRESOLICITUD.AsString = '') then
      begin
        Application.MessageBox(pChar('Debe Ingresar el título de la Solicitud'),'Error en el Título de la Solicitud',mb_iconerror);
        exit;
      end;

      if (qSolicitudCODIGOTIPOSOLICITUD.AsString = '') then
      begin
        Application.MessageBox(pChar('Debe Seleccionar el Tipo de Solicitud'),'Error en el Tipo de la Solicitud',mb_iconerror);
        exit;
      end;

      if (qSolicitudCODIGOPRIORIDADSOLICITUD.AsString = '') then
      begin
        Application.MessageBox(pChar('Debe Seleccionar la Prioridad de la Solicitud'),'Error en la Prioridad de la Solicitud',mb_iconerror);
        exit;
      end;

      if (qSolicitudCODIGOESTADOSOLICITUD.AsString = '') then
      begin
        Application.MessageBox(pChar('Debe Seleccionar el Estado de la Solicitud'),'Error en el Estado de la Solicitud',mb_iconerror);
        exit;
      end;

      if (qSolicitudCODIGOAREAFUNCIONAL.AsString = '') then
      begin
        Application.MessageBox(pChar('Debe Seleccionar el Área Funcional del Aplicativo que requiere Soporte'),'Error en el Área Funcional del Aplicativo que requiere Soporte',mb_iconerror);
        exit;
      end;

      if (qSolicitudCODIGOAPLICATIVO.AsString = '') then
      begin
        Application.MessageBox(pChar('Debe Seleccionar el Aplicativo que requiere Soporte'),'Error en el Aplicativo que requiere Soporte',mb_iconerror);
        exit;
      end;  

      if (qSolicitudCODIGOTIPOATENCION.AsString = '') then
      begin
        Application.MessageBox(pChar('Debe Seleccionar el Tipo de Atención que requiere Soporte'),'Error en el Aplicativo que requiere Soporte',mb_iconerror);
        exit;
      end;

      if (qSolicitudCODIGOTIPOSOPORTE.AsString = '') then
      begin
        Application.MessageBox(pChar('Debe Seleccionar el Tipo de Soporte que requiere'),'Error en el Aplicativo que requiere Soporte',mb_iconerror);
        exit;
      end;

      if (qSolicitudDESCRIPCIONSOLICITUD.AsString = '') then
      begin
        Application.MessageBox(pChar('Debe Ingresar la descripción de la Solicitud'),'Error en la descripción de la Solicitud',mb_iconerror);
        exit;
      end;

      if(qSolicitudCODIGOESTADOSOLICITUD.AsInteger=1)then
      begin
       if (qSolicitudCODIGOUSUARIOSOPORTE.AsString = '') then
       begin
         Application.MessageBox(pChar('Debe Asignar un Ingeniero(a) de Soporte a la Solicitud'),'Error en el Ing. Soporte Asignado',mb_iconerror);
         exit;
       end;
       if (qSolicitudFECHAINICIALASIGNADA.AsString = '') then
       begin
         Application.MessageBox(pChar('Debe Asignar una Fecha y Hora de Inicio del Soporte a la Solicitud'),'Error en la Fecha de Inicio de Soporte',mb_iconerror);
         exit;
       end;
       if (qSolicitudFECHAFINALASIGNADA.AsString = '') then
       begin
         Application.MessageBox(pChar('Debe Asignar una Fecha y Hora de Finalización del Soporte a la Solicitud'),'Error en la Fecha Final de Soporte',mb_iconerror);
         exit;
       end;
      end;
    MostrarMensaje:=True;
    end;

    {if qSolicitud.State in [dsBrowse] then //sólo están habilitados los desplazamientos, ni insert, ni edit;
    begin
      MostrarMensaje:=True;
      qSolicitud.Edit;
    end;
    }
    if qSolicitud.State in[dsEdit]then
    begin
      MostrarMensaje:=false;
    end;
    
    qSolicitud.Post;
    qProgramacionUsuarioSoporte.Append;
    qProgramacionUsuarioSoporte.Post;

     if qSolicitud.UpdatesPending then
       qSolicitud.ApplyUpdates;

     if Transaccion then
       qSolicitud.Database.Commit;

     if MostrarMensaje then
     begin
       MessageDlg('Esta solicitud fue registrada con el número: '+ qSolicitud.FieldByName('CODIGOSOLICITUD').AsString,
       mtInformation,[mbOk],0);
     end;
     
     Close;
     ModalResult:=MrOk;
     CodigoSolicitud:=qSolicitudCODIGOSOLICITUD.asinteger;
     fListaSoporte.qSe_Solicitud.Close;
     fListaSoporte.qSe_Solicitud.Open;
     fListaSoporte.qSe_Solicitud.locate('codigosolicitud',codigosolicitud,[]);
  except
     on E:Exception do
     begin
       showmessage(e.message);
       if Transaccion then
       begin
         qSolicitud.Database.Rollback;
       end;
       bDatosIncompletos := True;
       qSolicitud.Edit;
       ModalResult:=MrCancel;
       Close;
     end;
  end;
end;

procedure TfSolicitudSoporte.bbCancelarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Perderá los cambios realizados.Está seguro de Cancelar?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
  begin
    try
      qSolicitud.Cancel;
      if qSolicitud.UpdatesPending then
        qSolicitud.CancelUpdates;
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

procedure TfSolicitudSoporte.FormClose(Sender: TObject; var Action: TCloseAction);
var PuedoCerrar: Boolean;
begin
  PuedoCerrar := True;
  if not bCancelando then
  begin
    if bDatosIncompletos then
    begin
      if Application.MessageBox(PChar('Hay datos incompletos. Desea completar los datos?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
      begin
        ModalResult := 0;
        bDatosIncompletos := False;
        Action:=caNone;
        PuedoCerrar := False;
      end
      else
      begin
        qSolicitud.Cancel;
        qSolicitud.CancelUpdates;
        Action:=caFree;
      end;
    end
    else
    begin
      if (ModalResult <> MrCancel) and (ModalResult <> 0) then
      begin
        ModalResult := mrOK;
        Action:=caFree;
      end;
    end;
  end;

  if (ModalResult = 2) or ( (PuedoCerrar) and (ModalResult = 0) )then
  begin
    try
      qSolicitud.Cancel;
      qSolicitud.CancelUpdates;
      Action:=caFree;
    except
    end;
  end;
end;

procedure TfSolicitudSoporte.qReporte1UpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  try
  finally
  end;
end;

procedure TfSolicitudSoporte.sbEmergenciaClick(Sender: TObject);
begin
  qSolicitud.FieldByName('CODIGOPRIORIDADSOLICITUD').AsString:='2';
end;

procedure TfSolicitudSoporte.SpeedButton4Click(Sender: TObject);
begin
//  UbicarReporte;
end;

procedure TfSolicitudSoporte.qReporteElementoUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  try
  finally
  end;
end;

procedure TfSolicitudSoporte.qReporteElementoAfterPost(DataSet: TDataSet);
begin
{
 try
   qReporteElemento.ApplyUpdates;
   qReporteElemento.CommitUpdates;
 except
   qReporteElemento.CancelUpdates;
 end;  }
end;

procedure TfSolicitudSoporte.qReporteElementoAfterDelete(DataSet: TDataSet);
begin
{ try
   qReporteElemento.ApplyUpdates;
   qReporteElemento.CommitUpdates;
 except
   qReporteElemento.CancelUpdates;
 end;
 }
end;

procedure TfSolicitudSoporte.qReporte1CODIGOADMINISTRATIVOValidate(Sender: TField);
begin
 {
  if Sender.Text <> '' then
  begin
    qCIA.Close;
    qCIA.Params[0].AsString:=Sender.Text;
    qCIA.Open;
    if qCIA.RecordCount > 0 then
    begin
      Lbcia1.Caption:=qCIA.Fields[0].AsString;
      Lbcia2.Caption:=qCIA.Fields[0].AsString;
    end
    else
      raise Exception.Create('Este Código Administrativo No Existe.');
    qGrupoTrabajo.Close;
    qGrupoTrabajo.Open;
    dblcbGrupoTrabajo.Refresh;
    qTiempo.close;
    qTiempo.Open;
    if (qTiempo.RecordCount>0) then
      TiempoMaximoAtencion:=qTiempoTIEMPOATENCION.AsFloat;
    qTiempo.close;
  end
  else
  begin
    lbcia1.Caption:='';
    lbcia2.Caption:='';
  end;
  }
end;

procedure TfSolicitudSoporte.bbImprimirClick(Sender: TObject);
var punto:TPoint;
begin
{ punto:=Panel2.ClientToScreen(Classes.Point(bbImprimir.Left, bbImprimir.top));
 pmImprimir.Popup(punto.x+10, punto.y+10);
 }
end;

procedure TfSolicitudSoporte.Reporte1Click(Sender: TObject);
begin
{
  if qSolicitud.FieldByName('CODIGOREPORTE').AsString='' then
    MessageDlg('Para Imprimir el Reporte, Este Debe Ser Guardado.',mtInformation,[mbOK],0)
  else
  begin
    try
      fQRSolicitud:=TfQRSolicitud.Create(Application);
      with fQRReporte do
      begin
        qrdbCodigoReporte.DataSet        :=qSolicitud;
        qrdbFechaCreacion.DataSet        :=qSolicitud;
        qrdbTipoInformante.DataSet       :=qSolicitud;
        qrdbNombreInformante.DataSet     :=qSolicitud;
        qrdbTelefono.DataSet             :=qSolicitud;
        qrdbNodofisico.DataSet           :=qSolicitud;
        qrdbDireccionDano.DataSet        :=qSolicitud;
        qrdbNombreClaseReporte.DataSet   :=qSolicitud;
        qrdbNombreTipoReporte.DataSet    :=qSolicitud;
        qrdbDireccionDano.DataSet        :=qSolicitud;
        qrdbNombreAdministrativo.DataSet :=qSolicitud;
        qrdbFechaDictado.DataSet         :=qSolicitud;
        qrdbFechaLlegada.DataSet         :=qSolicitud;
        qrdbFechaAtencion.DataSet        :=qSolicitud;
        qrdbEstadoReporte.DataSet        :=qSolicitud;
        qrdbDescripcion.DataSet          :=qSolicitud;
        qrdbObservacion.DataSet          :=qSolicitud;
        QuickReport.DataSet:=qReporte;
        fReporte.Hide;
        QuickReport.Preview;
      end;
    finally
      fQRReporte.Free;
      fQRReporte:=nil;
      fReporte.Show;
    end;
  end;
  }
end;

procedure TfSolicitudSoporte.SpeedButton2Click(Sender: TObject);
begin
{  fReporte.Hide;
  fInformacionReporte:=TfInformacionReporte.Create(Application);
  fInformacionReporte.Show;
  }
end;
{
procedure TfSolicitudSoporte.dMenuArbol2SelectID(Sender: tnMenuItem; ID: Integer;
  MenuEstructura: tMenuEs);
begin
  dsReporte.DataSet.FieldByName('CIAINFORMANTE').AsInteger:=ID;
  qCIA.Close;
  qCIA.Params[0].AsInteger:=ID;
  qCIA.Open;
  if qCIA.RecordCount > 0 then
     dbeCIAInformante.Hint:=qCIA.Fields[0].AsString;
end;
}

procedure TfSolicitudSoporte.sbFechaFinalAtencionClick(Sender: TObject);
var sFecha:string;
begin
  sFecha:='';
  Fecha := '';
  dbeFechaFinalAtencion.Setfocus;
  Fecha := qSolicitudFECHAFINALEJECUTADA.AsString;
  if Fecha = '' then
    Fecha := FechaServidor;
  sFecha:=GetFechaHora;
  if sFecha<>'' then
  begin
    qSolicitud.FieldbyName('FECHAFINALEJECUTADA').AsString := sFecha;
    qSolicitudCODIGOESTADOSOLICITUD.AsString:='3';
  end;
end;

function TfSolicitudSoporte.GetFecha: String;
begin
  fFormaFecha := TfFormaFecha.Create(Application);
  fFormaFecha.height:=291;
  if FFormaFecha.ShowModal = mrOk then
    Result := DateTimetoStr(FFormaFecha.Date + StrToTime('11:59:59 pm'))
  else Result := sFecha;
  fFormaFecha.Free;
end;

procedure TfSolicitudSoporte.qReporte1FECHALIMITERESPUESTAValidate(Sender: TField);
begin
{  if Sender.Text <> '' then
  begin
    if qReporte.FieldByName('FECHAHORASAD').AsString='' then
    begin
      if (dbeCIAInformante.Visible) and (dbeCIAInformante.DataField = 'NUMEROSAT') then
        raise Exception.Create('Para Introducir La Fecha Limite de Respuesta,' + Chr(13) +
                               'La Fecha del SAD No Debe Ser Vacia.')
    end
    else
      if (Sender.AsDateTime) < (qReporte.FieldByName('FECHAHORASAD').AsDateTime) then
        raise Exception.Create('La Fecha Limite de Respuesta,' + Chr(13) +
                               'No Debe Ser Menor que La Fecha del SAD.')
  end;
  }
end;

procedure TfSolicitudSoporte.lbCodigoDblClick(Sender: TObject);
var qDatos:TQuery;
    i:Integer;
begin
{
 if qReporteCODIGOREPORTE.AsString  = '' then
 begin
   MessageDlg('Para crear un nuevo reporte a partir de otro, debe guardar este primero.',mtError,[MbOk],0);
   Exit;
 end;
 if MessageDlg('Desea crear un nuevo reporte a partir de este? ',mtConfirmation,[mbYes,mbNo],0) = mrYes then
 begin
   qDatos:=TQuery.Create(Application);
   qDatos.DatabaseName:='BaseDato';
   qDatos.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE = ' + qReporteCODIGOREPORTE.AsString;
   qDatos.Open;
   qReporte.Post;
   if qReporte.UpdatesPending then
     qReporte.ApplyUpdates;
   qReporteFECHAHORADICTADO.OnValidate:=nil;
   qReporteFECHAHORAATENCION.OnValidate:=nil;
   qReporteFECHAHORALLEGADA.OnValidate:=nil;
   qReporteCODIGOESTADOREPORTE.OnValidate:=nil;
   qReporte.Close;
   qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE= - 1';
   qReporte.Open;
   qReporte.Insert;

   for i:=0 to qDatos.FieldCount - 1 do
     if (qDatos.Fields[i].FieldName <> 'CODIGOREPORTE') and (qDatos.Fields[i].FieldName <> 'CODIGOUSUARIOCREACION')then
       qReporte.FieldByName(qDatos.Fields[i].FieldName).AsString:=qDatos.Fields[i].AsString;

   qReporte.FieldByName('CODIGOUSUARIOCREACION').AsInteger:=VarCodigoUsuario;//Usuario Creacion
   qReporteREPORTEPADRE.AsFloat := qDatos.FieldByName('CODIGOREPORTE').AsFloat;
   qReporteFECHAHORA.AsString := FechaServidor;
   qReporteFECHAHORADICTADO.OnValidate := qReporteFECHAHORADICTADOValidate;
   qReporteFECHAHORAATENCION.OnValidate := qReporteFECHAHORAATENCIONValidate;
   qReporteFECHAHORALLEGADA.OnValidate := qReporteFECHAHORALLEGADAValidate;
   qReporteCODIGOESTADOREPORTE.OnValidate := qReporteCODIGOESTADOREPORTEValidate;

   if MessageDlg('Desea utilizar la copia para el traslado a otra dependencia?.',mtConfirmation,[MbYes,mbNo],0) = mrYes then
   begin
     qReporteCODIGOGRUPOTRABAJO.AsString:='';
     qReporteFECHAHORADICTADO.AsString:='';
     qReporteFECHAHORALLEGADA.AsString:='';
     qReporteFECHAHORAATENCION.Asstring:='';
     qReporteCODIGOESTADOREPORTE.AsString:='1';
   end;
 end;                    }
end;

procedure TfSolicitudSoporte.FormShow(Sender: TObject);
var qInformante:TQuery;
begin
  RefrescarVariables;

  if qSolicitud.State=dsInsert then
  begin
    qSolicitudFECHAHORAREGISTRO.AsString:=DateTimeToStr(now);
    qSolicitudCODIGOUSUARIOINFORMANTE.AsString:=IntToStr(VarCodigoUsuario);
    qSolicitudFECHAHORAMODIFICACION.AsString:=DateTimeToStr(now);
    qSolicitudCODIGOUSUARIOMODIFICACION.AsString:=IntToStr(VarCodigoUsuario);
    qSolicitudCODIGOESTADOSOLICITUD.AsString:='5';//SOLICITADA
    qUsuario.Close;
    qUsuario.ParamByName('CODIGOUSUARIO').AsString:=qSolicitudCODIGOUSUARIOINFORMANTE.AsString;
    qUsuario.Open;
    bCancelando := False;
    //HABILITAR MENÚS
    qTipoUsuario.Close;
    qTipoUsuario.ParamByName('CODIGOUSUARIO').AsInteger:=VarCodigoUsuario;
    qTipoUsuario.Open;
    
    //if (qTipoUsuarioCODIGOTIPOUSUARIO.AsString='1') or (qTipoUsuarioCODIGOTIPOUSUARIO.AsString='0') then
    if (qTipoUsuarioCODIGOTIPOUSUARIO.AsString='0') then
    begin
      DBEFechaSolicitud.Enabled:=true;
      DBLCBUsuarioSoporte.Enabled:=true;
      dbeFechaInicialAsignada.Enabled:=true;
      sbFechaInicialAsignada.Enabled:=true;
      dbeFechaFinalAsignada.Enabled:=true;
      sbFechaFinalAsignada.Enabled:=true;
      dbeFechaInicialAtencion.Enabled:=true;
      sbFechaInicialAtencion.Enabled:=true;
      dbeFechaFinalAtencion.Enabled:=true;
      sbFechaFinalAtencion.Enabled:=true;
      DBLCBEstadoSolicitud.ReadOnly:=false;
      DBLCBEstadoSolicitud.Enabled:=true;
    end;
  end;
////***EDIT  
  if qSolicitud.State=dsEdit then
  begin
    qSolicitudCODIGOUSUARIOINFORMANTEValidate(qSolicitudCODIGOUSUARIOINFORMANTE);
    qSolicitudFECHAHORAMODIFICACION.AsString:=DateTimeToStr(now);
    qSolicitudCODIGOUSUARIOMODIFICACION.AsString:=IntToStr(VarCodigoUsuario);
    qSolicitudCODIGOCIASOLICITAValidate(qSolicitudCODIGOCIASOLICITA);
    qSolicitudCODIGOAREAFUNCIONALValidate(qSolicitudCODIGOAREAFUNCIONAL);

    //HABILITAR MENÚS
    qTipoUsuario.Close;
    qTipoUsuario.ParamByName('CODIGOUSUARIO').AsInteger:=VarCodigoUsuario;
    qTipoUsuario.Open;
    
    //if (qTipoUsuarioCODIGOTIPOUSUARIO.AsString='1') or (qTipoUsuarioCODIGOTIPOUSUARIO.AsString='0') then
    if (qTipoUsuarioCODIGOTIPOUSUARIO.AsString='0') then
    begin
      DBEFechaSolicitud.Enabled:=true;
      DBLCBUsuarioSoporte.Enabled:=true;
      dbeFechaInicialAsignada.Enabled:=true;
      sbFechaInicialAsignada.Enabled:=true;
      dbeFechaFinalAsignada.Enabled:=true;
      sbFechaFinalAsignada.Enabled:=true;
      dbeFechaInicialAtencion.Enabled:=true;
      sbFechaInicialAtencion.Enabled:=true;
      dbeFechaFinalAtencion.Enabled:=true;
      sbFechaFinalAtencion.Enabled:=true;
      DBLCBEstadoSolicitud.ReadOnly:=false;
      DBLCBEstadoSolicitud.Enabled:=true;
    end;

    //if (qTipoUsuarioCODIGOTIPOUSUARIO.AsString<>'1') and (qTipoUsuarioCODIGOTIPOUSUARIO.AsString<>'0') then
    if (qTipoUsuarioCODIGOTIPOUSUARIO.AsString<>'0') then
    begin
      DBEFechaSolicitud.Enabled:=False;
      DBLCBEstadoSolicitud.Enabled:=False;
    end;
  end;
end;

function TfSolicitudSoporte.EditarReporte: Boolean;
var qDatos:TQuery;
begin
{  Result:=False;
  ConsDll.RefrescarVariables;
  if VarCodigoUsuario = 0 then //Es Admin ?
  begin
    Result:=True;
    Exit;
  end;
  qDatos:=TQuery.Create(Application);
  try
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Add('SELECT EDITAR FROM ODTPERMISOS WHERE NOMBRETABLA = ''REPORTE''');
    qDatos.SQL.Add('AND CODIGOUSUARIO = ' + IntToStr(VarCodigoUsuario));
    if qReporteCODIGOADMINISTRATIVO.AsString<>'' then
      qDatos.SQL.Add('AND CODIGOADMINISTRATIVO = ' + qReporteCODIGOADMINISTRATIVO.AsString);
    qDatos.Open;
    if qDatos.Fields[0].AsString = 'S' then
      Result:=True;
  finally
    qDatos.Free;
  end;
  }
end;

procedure TfSolicitudSoporte.sbFechaSolicitudClick(Sender: TObject);
var sFecha:string;
begin
  sFecha:='';
  Fecha := qSolicitudFECHAHORAREGISTRO.AsString;
  if Fecha = '' then
    Fecha := FechaServidor;
  dbeFechaSolicitud.Setfocus;
  sFecha:=GetFechaHora;
  if sFecha<>'' then
    qSolicitud.FieldbyName('FECHAHORAREGISTRO').AsString := sFecha;
end;

procedure TfSolicitudSoporte.qReporte1AfterClose(DataSet: TDataSet);
begin
  NumeroODT := 0;
end;

function TfSolicitudSoporte.FechaServidor: string;
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

procedure TfSolicitudSoporte.sbFechaFinClick(Sender: TObject);
begin
  inherited;
  try
    dbEdFechaHora.Setfocus;
    sFecha := dbEdFechaHora.Text;
    Fecha := GetFechaHora;
    if Fecha <> '' then dbEdFechaHora.Text := Fecha;
  except
  end;
end;

procedure TfSolicitudSoporte.qReporte1FECHAHORAValidate(Sender: TField);
begin
{
  if (Sender.Text <> '' ) and (qReporteFECHAHORADICTADO.AsString<>'') then
  begin
    if (Sender.AsDateTime > qReporteFECHAHORADICTADO.AsDateTime) then
     raise Exception.Create('La fecha de recepción del reporte no puede ser mayor que la fecha de dictado del mismo.');
  end;
  if (Sender.Text <> '' ) and (qReporteFECHAHORALLEGADA.AsString<>'') then
  begin
    if (Sender.AsDateTime > qReporteFECHAHORALLEGADA.AsDateTime) then
     raise Exception.Create('La fecha de recepción del reporte  no puede ser mayor que la fecha de llegada al sitio de trabajo.');
  end;
  if (Sender.Text <> '' ) and (qReporteFECHAHORAATENCION.AsString<>'') then
  begin
    if (Sender.AsDateTime > qReporteFECHAHORAATENCION.AsDateTime) then
     raise Exception.Create('La fecha de recepción del reporte  no puede ser mayor que la fecha de atención del mismo.');
  end;
  }
end;

procedure TfSolicitudSoporte.sbtnCiaInformanteClick(Sender: TObject);
var CIA:Integer;
begin
  CIA := CapturarCIA;
  if CIA<>0 then qSolicitudCODIGOCIASOLICITA.AsFloat:=CIA;
end;

procedure TfSolicitudSoporte.qSolicitudAfterInsert(DataSet: TDataSet);
var qcodigoSolicitud:TQuery;
begin
  qcodigoSolicitud:=TQuery.Create(Application);
  qcodigoSolicitud.DatabaseName:='basedato';
  qcodigoSolicitud.Close;
  qcodigoSolicitud.SQL.Add('SELECT MAX(CODIGOSOLICITUD) FROM SE_SOLICITUD');
  qcodigoSolicitud.Open;
  qSolicitudCODIGOSOLICITUD.AsFloat:=qcodigoSolicitud.Fields[0].AsFloat +1;
  qSolicitudCODIGOUSUARIOCREACION.AsString:=inttostr(varcodigoUsuario);
  qcodigoSolicitud.Free;
end;

procedure TfSolicitudSoporte.qSolicitudCODIGOCIASOLICITAValidate(
  Sender: TField);
begin
  if qSolicitud.State=dsEdit then
  begin
    if (qSolicitudCODIGOCIASOLICITA.AsString<>'') and (qSolicitudCODIGOUSUARIOSOLICITA.AsString<>'') then
    begin
      qEmpleado.Close;
      qEmpleado.ParamByName('CODIGOCIASOLICITA').AsString:=qSolicitudCODIGOCIASOLICITA.AsString;
      qEmpleado.Open;
    end;
  end;
end;

procedure TfSolicitudSoporte.qSolicitudCODIGOAREAFUNCIONALChange(
  Sender: TField);
begin
  qAplicativo.Close;
  qAplicativo.ParamByName('CODIGOAREAFUNCIONAL').AsFloat:=Sender.AsFloat;
  qAplicativo.Open;

end;

procedure TfSolicitudSoporte.qSolicitudCODIGOCIASOLICITAChange(
  Sender: TField);
begin
  qEmpleado.Close;
  qEmpleado.ParamByName('CODIGOCIASOLICITA').AsFloat:=Sender.AsFloat;
  qEmpleado.Open;
end;

procedure TfSolicitudSoporte.qSolicitudAfterDelete(DataSet: TDataSet);
begin
  qSolicitud.ApplyUpdates;
  qSolicitud.CommitUpdates;
end;

procedure TfSolicitudSoporte.qSolicitudAfterPost(DataSet: TDataSet);
begin
  qSolicitud.ApplyUpdates;
  qSolicitud.CommitUpdates;
end;

procedure TfSolicitudSoporte.sbFechaDictadoClick(Sender: TObject);
var sFecha:string;
begin
  sFecha:='';
  Fecha := '';
  dbeFechaHoraSolicitud.Setfocus;
  Fecha := qSolicitudFECHAHORASOLICITUD.AsString;
  if Fecha = '' then
    Fecha := FechaServidor;
  sFecha:=GetFechaHora;
  if sFecha<>'' then
  begin
    qSolicitud.FieldbyName('FECHAHORASOLICITUD').AsString := sFecha;
  end;
end;

procedure TfSolicitudSoporte.qProgramacionUsuarioSoporteAfterInsert(
  DataSet: TDataSet);
//var qCodigoProgramacionUsuario:TQuery;
begin
 { qCodigoProgramacionUsuario:=TQuery.Create(Application);
  qCodigoProgramacionUsuario.DatabaseName:='basedato';
  qCodigoProgramacionUsuario.Close;
  qCodigoProgramacionUsuario.SQL.Add('SELECT MAX(CODIGOPROGRAMACIONUSUARIO) FROM SE_PROGRAMACIONUSUARIOSOPORTE');
  qCodigoProgramacionUsuario.Open;

  qProgramacionUsuarioSoporteCODIGOPROGRAMACIONUSUARIO.AsFloat:=qCodigoProgramacionUsuario.Fields[0].AsFloat +1;
  qProgramacionUsuarioSoporteCODIGOSOLICITUD.AsFloat:=qSolicitudCODIGOSOLICITUD.AsFloat;
  qProgramacionUsuarioSoporteCODIGOUSUARIOSOPORTE.AsFloat:=qSolicitudCODIGOUSUARIOSOPORTE.AsFloat;
  qProgramacionUsuarioSoporteFECHAINICIOASIGNADA.AsString:=qSolicitudFECHAINICIALASIGNADA.AsString;
  qProgramacionUsuarioSoporteFECHAFINALASIGNADA.AsString:=qSolicitudFECHAFINALASIGNADA.AsString;
  qProgramacionUsuarioSoporteCODIGOESTADOSOLICITUD.AsString:=qSolicitudCODIGOESTADOSOLICITUD.AsString;

  qCodigoProgramacionUsuario.Free;
  }
end;

procedure TfSolicitudSoporte.qProgramacionUsuarioSoporteAfterDelete(
  DataSet: TDataSet);
begin
  qProgramacionUsuarioSoporte.ApplyUpdates;
  qProgramacionUsuarioSoporte.CommitUpdates;
end;

procedure TfSolicitudSoporte.qProgramacionUsuarioSoporteAfterPost(
  DataSet: TDataSet);
begin
  qProgramacionUsuarioSoporte.ApplyUpdates;
  qProgramacionUsuarioSoporte.CommitUpdates;
end;

procedure TfSolicitudSoporte.qProgramacionUsuarioSoporteBeforePost(
  DataSet: TDataSet);
var qCodigoProgramacionUsuario:TQuery;
begin
  qCodigoProgramacionUsuario:=TQuery.Create(Application);
  qCodigoProgramacionUsuario.DatabaseName:='basedato';
  qCodigoProgramacionUsuario.Close;
  qCodigoProgramacionUsuario.SQL.Add('SELECT MAX(CODIGOPROGRAMACIONUSUARIO) FROM SE_PROGRAMACIONUSUARIOSOPORTE');
  qCodigoProgramacionUsuario.Open;

  qProgramacionUsuarioSoporteCODIGOPROGRAMACIONUSUARIO.AsFloat:=qCodigoProgramacionUsuario.Fields[0].AsFloat +1;
  qProgramacionUsuarioSoporteCODIGOSOLICITUD.AsFloat:=qSolicitudCODIGOSOLICITUD.AsFloat;
  qProgramacionUsuarioSoporteCODIGOUSUARIOSOPORTE.AsFloat:=qSolicitudCODIGOUSUARIOSOPORTE.AsFloat;
  qProgramacionUsuarioSoporteFECHAINICIOASIGNADA.AsString:=qSolicitudFECHAINICIALASIGNADA.AsString;
  qProgramacionUsuarioSoporteFECHAFINALASIGNADA.AsString:=qSolicitudFECHAFINALASIGNADA.AsString;
  qProgramacionUsuarioSoporteCODIGOESTADOSOLICITUD.AsString:=qSolicitudCODIGOESTADOSOLICITUD.AsString;

  qCodigoProgramacionUsuario.Free;
end;

procedure TfSolicitudSoporte.qSolicitudCODIGOSOLICITUDChange(
  Sender: TField);
begin
{  qProgramacionUsuarioSoporte.Close;
  qProgramacionUsuarioSoporte.ParamByName('CODIGOSOLICITUD').AsFloat:=Sender.AsFloat;
  qProgramacionUsuarioSoporte.Open;
}
  qProgramacionUsuarioSoporte.Open;
  
end;

procedure TfSolicitudSoporte.qSolicitudCODIGOAREAFUNCIONALValidate(
  Sender: TField);
begin
  if qSolicitud.State=dsEdit then
  begin
    if (qSolicitudCODIGOAREAFUNCIONAL.AsString<>'') and (qSolicitudCODIGOAPLICATIVO.AsString<>'') then
    begin
      qAplicativo.Close;
      qAplicativo.ParamByName('CODIGOAREAFUNCIONAL').AsString:=qSolicitudCODIGOAREAFUNCIONAL.AsString;
      qAplicativo.Open;
    end;
  end;
end;

procedure TfSolicitudSoporte.qSolicitudCODIGOUSUARIOINFORMANTEValidate(
  Sender: TField);
begin
  if qSolicitud.State=dsEdit then
  begin
    if (qSolicitudCODIGOUSUARIOINFORMANTE.AsString<>'') then
    begin
      qUsuario.Close;
      qUsuario.ParamByName('CODIGOUSUARIO').AsString:=qSolicitudCODIGOUSUARIOINFORMANTE.AsString;
      qUsuario.Open;
    end;
  end;
end;
procedure TfSolicitudSoporte.qSolicitudCalcFields(DataSet: TDataSet);
var qusuarioInformante:tquery;
begin
//  ShowMessage('3 qFormatoDatosCalcFields');
  qusuarioInformante:=TQuery.create(application);
  qusuarioInformante.databasename:='BaseDato';

  if qSolicitudCODIGOUSUARIOINFORMANTE.AsString<>'' then
  begin
    qusuarioInformante.Close;
    qusuarioInformante.sql.text:='SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+qSolicitudCODIGOUSUARIOINFORMANTE.AsString;
    qusuarioInformante.open;
    qSolicitudNombreUsuarioInformante.asstring:=qusuarioInformante.fields[0].asstring;
    dbeUsuarioInformante.Text:= qusuarioInformante.Fields[0].AsString;
  end;
end;
end.
