unit uComunesAdministrativo;

interface

uses Windows, SysUtils, dbTables, Dialogs, db, Controls, Forms, Classes, Math,
     uBuscarEmpleado, udFiltrarEmpleado, uSeleccionarGrupoTrabajo, IniFiles;

const
  Port_SFTP = '6666';
  UserID_SFTP = 'handheld';
  Password_SFTP = 'PHR8CjN4?mC8';
  DirRaiz_SFTP = '\Asignaciones_EnerGis\CIA\';
  CarpetaImportadas = 'Importado';
  CarpetaExportadas = 'Exportado';
  
type
  TDesdeHasta=record
    Desde:TDateTime;
    Hasta:TDateTime;
  end;
  TTransporte=(ttVehiculo,ttPasajes);                                                                                     
  TODTHija = class
  private
    FCodigoODT   : Double;
    FConsecutivo : Integer;
    FCodigoAdministrativo : Double;
    FIdSesion : Double;
    procedure SetCodigoODT(aValor: Double);
    procedure SetConsecutivo(aValor: Integer);
    procedure SetCodigoAdministrativo(aValor: Double);
    procedure BorrarManoObra;
    procedure BorrarMateriales;
    procedure BorrarMedidasSeguridad;
    procedure BorrarVehiculos;
    procedure BorrarReporte;
    procedure BorrarActividades;
    procedure BorrarApoyos;
    procedure InsertarMedidasSeguridad;
    procedure InsertarVehiculoAnterior;
    procedure InsertarManoObraAnterior;
    procedure MovilAnterior;
  public
    constructor Create(aCodigoODT, CIA: Double);overload;
    constructor Create(aCodigoODT: Double; aConsecutivo: Integer; CIA: Double);overload;
    property CodigoODT: Double read FCodigoODT write SetCodigoODT;
    property Consecutivo: Integer read FConsecutivo write SetConsecutivo;
    property CodigoAdministrativo: Double read FCodigoAdministrativo write SetCodigoAdministrativo;
    function GenerarImpreso: string;overload;
    class function GenerarImpreso(aCodigoODT: Double; aConsecutivo: Integer): string;overload;
    function CrearODTHija: Integer;
    procedure AsignarGrupoTrabajo(CodigoGrupoTrabajo: Integer);
    procedure AsignarReporte(CodigoReporte: Double);
    procedure AsignarDireccion(const DataSet: TDataSet);
    procedure AsignarFechas(FechaInicio,FechaFinal: TField);
    function  BorrarODTHija: Boolean;
    Procedure InsertarInfraestructura(pintado,codigoclientesgd,codigoapoyo,codigoclientecom:string);
    property IdSesion: Double read FIdSesion write FIdSesion;
    procedure AsignarApoyosProximidad(x, y, distancia: String);
    procedure InsertarManoObraDelGT(pGT: string);
    procedure AsignarObjetoDelTrabajo;
end;

type
   CantidadHorasConcepto = record
      DiurnaOrdinaria : double;
      NocturnaOrdinaria : double;
      DiurnaDomingo : double;
      NocturnaDomingo :double;
      DiurnaFestivo : double;
      NocturnaFestivo :double;
      ExtraDiurnaOrdinaria : double;
      ExtraNocturnaOrdinaria : double;
      ExtraDiurnaDomFestivo :  double;
      ExtraNocturnaDomFestivo : double;
    end;
   PorcentajeHorasConcepto = record
      DiurnaOrdinaria : double;
      NocturnaOrdinaria : double;
      DiurnaDomingo : double;
      DiurnaFestivo : double;
      NocturnaDomingo :double;
      NocturnaFestivo :double;
      ExtraDiurnaOrdinaria : double;
      ExtraNocturnaOrdinaria : double;
      ExtraDiurnaDomFestivo :  double;
      ExtraNocturnaDomFestivo : double;
    end;
    function GetFecha(Tipo:Boolean;fecha:string =''): String;
    function GetCadenaIzquierda(c,s:string):string;
    function GetCadenaDerecha(c,s:string):string;
    function NombreAplicativo:string;
    function GastosTranporteAuxiliosOdt(CodigoOdt:string): double;
    function GastosTransporteViaticosOdt(CodigoOdt:string): double;
    procedure CostosActividadOdtHija(CodigoOdt:double;consecutivo:integer;var Mensaje:string);
    function CostoManoObraHija(CodigoOdt:double;consecutivo:integer;var Mensaje:string):double;
    function CostoManoObraHijaIntegrado(CodigoOdt:double;consecutivo:integer;fechai:tdatetime;fechaf:tdatetime):double;
    function CostoMaterialHija(CodigoOdt:double;consecutivo:integer):double;
    function CostoTransporteHija(CodigoOdt:double;consecutivo:integer):double;
    function CostoEquipoHija(CodigoOdt:double;consecutivo:integer):double;
    function HorasLaboralesTurno(desde,hasta:tdatetime;tipo,turno:integer):tlist;
    function HorasTotalesEmpleado(cedula,codigoodt:double;listahoras:tlist):double;
    function RangoInterseccionHoras(Desde1,Hasta1,Desde2,Hasta2:TDateTime):TDesdeHasta;
    function SumaInterseccionHoras(Desde1,Hasta1,Desde2,Hasta2:TDateTime):double;
    procedure CostosOdtHija(CodigoOdt:double;consecutivo:integer);
    function SumaListaHoras(listahoras: tlist): double;
    function RegistrarImpresionViatico(tipo:integer;valor,codigoodt:double):double;
    function RegistrarImpresionAuxilios(valor,codigoodt:double):double;
    function FechaServidor: TDateTime;
    function AnoServidor: Integer;
    function SeleccionarEmpleado(var nombre:string;cia:integer=0):double;
    procedure SeleccionarGrupoTrabajo(var cia:integer;var codigo:integer);
    function GetCIASEdicionTablaUsuario(NombreTabla:string): string;
    function EsUsuarioAdmin:boolean;
    function SeleccionarOdtTerminada:double;
    function SeleccionarOdtHijaTerminada:String;
    function SeleccionarUsuario:double;
    function SeleccionarImpresion:double;
    function CompletarCadenaIzquierda(s,c: string; n: integer): string;
    function SumarCantidadesConceptosExtrasRecargos(Datos:tdataset): CantidadHorasConcepto;
    function ConsultarConceptosExtrasRecargos:PorcentajeHorasConcepto;
    function ValidarAreaActiva(CIA:double):boolean;
    procedure SeleccionarPlanillaExtras(out codemp:double;out fecha:tdatetime);
    procedure AgregarFormatosMantenimientoOdt(codigoodt:double;consecutivo:integer);
    function BorrarAsignacionEMG(pCodigoODT, pConsecutivo, Tipo: string; bBorrarEnSFTP : Boolean = True): Boolean;
    function DescripcionDireccion(ds:TDataSet; Control:TControl) : String;
    function EstaEnUsoODTHija(sCodigoODT, sConsecutivo: string; var sSesion, sUsuario, sTerminal: string): Boolean;
var
  Host_SFTP: String;

implementation


uses uFormaFecha, uFuncionSGD, ConsDll, uSeleccionarOdt, USeleccionarOdtHija,
     uSeleccionarUsuario, uSeleccionarImpresionCobro, uSeleccionarPlanillaExtras,
     uFIMPAdministrativo, uDescripcionDireccion;

constructor TODTHija.Create(aCodigoODT, CIA: Double);
var Query: TQuery;
begin
  inherited Create;
  CodigoODT := aCodigoODT;
  CodigoAdministrativo := CIA;
  Query := TQuery.Create(nil);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('SELECT MAX(CONSECUTIVO) AS VALOR FROM');
  Query.SQL.Add('ODTDIA WHERE CODIGOODT = ' + FloatToStr(CodigoODT));
  Query.Open;
  Consecutivo := Query.FieldByName('VALOR').AsInteger + 1;
  Query.Free;
end;

constructor TODTHija.Create(aCodigoODT: Double; aConsecutivo: Integer; CIA: Double);
begin
  inherited Create;
  CodigoODT := aCodigoODT;
  Consecutivo := aConsecutivo;
  CodigoAdministrativo := CIA;
end;

procedure TODTHija.BorrarManoObra;
var Query: TQuery;
begin
  Query := TQuery.Create(nil);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('DELETE FROM ODTPRESMANO');
  Query.SQL.Add('WHERE CODIGOODT = ' + FloatToStr(CodigoODT));
  Query.SQL.Add('AND CONSECUTIVO = ' + IntToStr(Consecutivo));
  Query.ExecSQL;
  Query.Free;
end;

function EstaEnUsoODTHija(sCodigoODT, sConsecutivo: string; var sSesion, sUsuario, sTerminal: string): Boolean;
var
  qry: TQuery;
begin
  result := False;
  qry := TQuery.Create(nil);
  qry.DatabaseName := 'BaseDato';
  qry.SQL.Add('SELECT S.SID, U.CODIGOUSUARIO, US.LOGINUSUARIO, S.OSUSER, S.TERMINAL');
  qry.SQL.Add('FROM V$SESSION S, USUARIOTS_LOG U, SESIONGESTION G, USUARIO US');
  qry.SQL.Add('WHERE S.AUDSID = U.IDSESIONBD');
  qry.SQL.Add('AND G.IDSESIONBD = U.IDSESIONBD');
  qry.SQL.Add('AND G.FECHAFIN IS NULL');
  qry.SQL.Add('AND G.TIPOGESTION = ''O'' ');
  qry.SQL.Add('AND G.CLAVE1 = :CODIGOODT');
  qry.SQL.Add('AND G.CLAVE2 = :CONSECUTIVO');
  qry.SQL.Add('AND U.CODIGOUSUARIO = US.CODIGOUSUARIO');
  qry.ParamByName('CODIGOODT').AsString := sCodigoODT;
  qry.ParamByName('CONSECUTIVO').AsString := sConsecutivo;
  qry.Open;

  if not qry.IsEmpty then
  begin
    sSesion := qry.FieldByName('SID').AsString;
    sUsuario := qry.FieldByName('LOGINUSUARIO').AsString;
    sTerminal:= qry.FieldByName('TERMINAL').AsString;
    result:= True;
  end;

  qry.Close;
  qry.Free;
end;

function GetCadenaDerecha(c,s:string):string;
var i:integer;
cadena:string;
begin
  result:='';
  cadena:=s;
  i:=pos(c,cadena);
  while (i>0) do
  begin
    cadena:=copy(cadena,i+1,length(cadena)-i);
    i:=pos(c,cadena);
  end;
  result:=cadena;
end;

function GetCadenaIzquierda(c,s:string):string;
var i:integer;
cadena:string;
begin
  result:='';
  cadena:=s;
  i:=pos(c,cadena);
  while (i>0) do
  begin
    cadena:=copy(cadena,1,i-1);
    i:=pos(c,cadena);
  end;
  result:=cadena;
end;

procedure TODTHija.BorrarMateriales;
var Query: TQuery;
begin
  Query := TQuery.Create(nil);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('DELETE FROM ODTPRESMATE');
  Query.SQL.Add('WHERE CODIGOODT = ' + FloatToStr(CodigoODT));
  Query.SQL.Add('AND CONSECUTIVO = ' + IntToStr(Consecutivo));
  Query.ExecSQL;
  Query.Free;
end;

procedure TODTHija.BorrarMedidasSeguridad;
var Query: TQuery;
begin
  Query := TQuery.Create(nil);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('DELETE FROM ODTMEDIDASEGURIDAD');
  Query.SQL.Add('WHERE CODIGOODT = ' + FloatToStr(CodigoODT));
  Query.SQL.Add('AND CONSECUTIVO = ' + IntToStr(Consecutivo));
  Query.ExecSQL;
  Query.Free;
end;

procedure TODTHija.BorrarVehiculos;
var Query: TQuery;
begin
  Query := TQuery.Create(nil);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('DELETE FROM ODTVEHICULO');
  Query.SQL.Add('WHERE CODIGOODT = ' + FloatToStr(CodigoODT));
  Query.SQL.Add('AND CONSECUTIVO = ' + IntToStr(Consecutivo));
  Query.ExecSQL;
  Query.Free;
end;

procedure TODTHija.BorrarReporte;
var Query: TQuery;
begin
  Query := TQuery.Create(nil);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('DELETE FROM ODTREPORTE');
  Query.SQL.Add('WHERE CODIGOODT = ' + FloatToStr(CodigoODT));
  Query.SQL.Add('AND CONSECUTIVO = ' + IntToStr(Consecutivo));
  Query.ExecSQL;
  Query.Free;
end;

procedure TODTHija.BorrarActividades;
var Query: TQuery;
begin
  Query := TQuery.Create(nil);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('DELETE FROM ODTDETALLEACTIVIDAD');
  Query.SQL.Add('WHERE CODIGOODT = ' + FloatToStr(CodigoODT));
  Query.SQL.Add('AND CONSECUTIVO = ' + IntToStr(Consecutivo));
  Query.ExecSQL;
  Query.Free;
end;

procedure TODTHija.BorrarApoyos;
var Query: TQuery;
begin
  Query := TQuery.Create(nil);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('DELETE FROM ODTAPOYO');
  Query.SQL.Add('WHERE CODIGOODT = ' + FloatToStr(CodigoODT));
  Query.SQL.Add('AND CONSECUTIVO = ' + IntToStr(Consecutivo));
  Query.ExecSQL;
  Query.Free;
end;

function TODTHija.GenerarImpreso: string;
begin
  Result := GenerarImpreso(CodigoODT,Consecutivo);
end;

class function TODTHija.GenerarImpreso(aCodigoODT: Double;
  aConsecutivo: Integer): string;
var i: Integer;
    s1: string;
begin
  s1:=copy(floattostr(aCodigoODT),7,5);
  Result:='';
  Result:=s1 + '-' + inttostr(aConsecutivo);
end;

procedure TODTHija.SetCodigoODT(aValor: Double);
begin
  FCodigoODT := aValor;
end;

procedure TODTHija.SetConsecutivo(aValor: Integer);
begin
  FConsecutivo := aValor;
end;

procedure TODTHija.SetCodigoAdministrativo(aValor: Double);
begin
  FCodigoAdministrativo := aValor;
end;

function TODTHija.CrearODTHija: Integer;
var
  Repetir: Boolean;
  Query: TQuery;
begin
  result:= -1;
  Repetir := True;
  Query   := TQuery.Create(nil);
  Query.DatabaseName := 'BaseDato';
  while Repetir do
  begin
   Query.Close;
   Query.SQL.Clear;
   Query.SQL.Add('SELECT COUNT(*) AS CUANTOS FROM ODTDIA');
   Query.SQL.Add('WHERE CODIGOODT = ' + FloatToStr(CodigoODT));
   Query.SQL.Add('AND CONSECUTIVO = ' + IntToStr(Consecutivo));
   Query.Open;
   if Query.FieldByName('CUANTOS').AsInteger = 0 then
     Repetir := False
   else
     Consecutivo := Consecutivo + 1;
  end;
  BorrarManoObra;
  BorrarMateriales;
  BorrarMedidasSeguridad;
  BorrarVehiculos;
  BorrarReporte;
  BorrarActividades;
  BorrarApoyos;
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('INSERT INTO ODTDIA(CODIGOODT,CONSECUTIVO,IMPRESOODT,COSTOMANOOBRA,');
  Query.SQL.Add('COSTOMATERIAL,COSTOTRANSPORTE,COSTOEQUIPO,GENERAINDICE)');
  Query.SQL.Add('VALUES('+FloatToStr(CodigoODT)+','+IntToStr(Consecutivo)+','''+GenerarImpreso+''',');
  Query.SQL.Add('0,0,0,0,''S'')');
  Query.ExecSQL;
  InsertarMedidasSeguridad;
  InsertarManoObraAnterior;
  InsertarVehiculoAnterior;
  Query.Free;
  result:= Consecutivo;
end;

procedure TODTHija.InsertarMedidasSeguridad;
var qDatos,qTemp:TQuery;
begin
  qDatos := TQuery.Create(nil);
  qTemp  := TQuery.Create(nil);
  qDatos.DataBaseName  :='BaseDato';
  qTemp.DataBaseName   :='BaseDato';
  qDatos.SQL.Text:='SELECT CODIGOMEDIDASEGURIDAD FROM MEDIDASEGURIDAD WHERE '+
                   'CODIGOADMINISTRATIVO = ' + FloatToStr(CodigoAdministrativo) + ' ORDER BY ORDEN';
  qDatos.Open;

  while not qDatos.Eof do
  begin
    qTemp.Close;
    qTemp.SQL.Text:='INSERT INTO ODTMEDIDASEGURIDAD VALUES('+ FloatToStr(CodigoODT) + ',' +
                     intToStr(Consecutivo) + ',' + qDatos.Fields[0].AsString + ',' + '1)';
    qTemp.ExecSQL;
    qDatos.Next;
  end;
  qDatos.Free;
  qTemp.Free;
end;


procedure TODTHija.InsertarManoObraAnterior;

function FormatoFecha(aFecha:TDateTime):string;
begin
  Result:=FormatDateTime('mm/dd/yyyy',aFecha);
end;

var qDatos, qTemp: TQuery;
    FechaEmision : TDateTime;
begin
  qDatos := TQuery.Create(nil);
  qTemp  := TQuery.Create(nil);
  qDatos.DataBaseName := 'BaseDato';
  qTemp.DataBaseName  := 'BaseDato';
  qDatos.SQL.Text := 'SELECT FECHAEMISION FROM ODT WHERE CODIGOODT = ' + FloatToStr(CodigoODT);
  qDatos.Open;
  FechaEmision := qDatos.FieldByName('FECHAEMISION').AsDateTime;
  qDatos.Close;
  qDatos.SQL.Clear;
  qDatos.SQL.Add('SELECT CODIGOEMPLEADO FROM ODTPRESMANO WHERE CODIGOODT = ' + FloatToStr(CodigoODT));
  qDatos.SQL.Add('AND CONSECUTIVO = ' + IntToStr(Consecutivo - 1));
  qDatos.Open;
  while not qDatos.Eof do
  begin
    qTemp.Close;
    qTemp.SQL.Clear;
    qTemp.SQL.Add('INSERT INTO ODTPRESMANO(CODIGOODT,CONSECUTIVO,FECHADIAODT,CODIGOEMPLEADO)');
    qTemp.SQL.Add('VALUES(' + FloatToStr(CodigoODT) + ',' + IntToStr(Consecutivo) + ',');
    qTemp.SQL.Add('TO_DATE('''+ FormatoFecha(FechaEmision) + ''',''MM/DD/YYYY''),');
    qTemp.SQL.Add(qDatos.FieldByName('CODIGOEMPLEADO').AsString + ')');
    qTemp.ExecSQL;
    qDatos.Next;
  end;
  qTemp.Free;
  qDatos.Free;
end;

procedure TODTHija.InsertarVehiculoAnterior;
var qDatos, qTemp:TQuery;
begin
  qDatos := TQuery.Create(nil);
  qTemp  := TQuery.Create(nil);
  qDatos.DataBaseName := 'BaseDato';
  qTemp.DataBaseName  := 'BaseDato';
  qDatos.SQL.Add('SELECT DISTINCT CODIGOVEHICULO FROM ODTVEHICULO WHERE CODIGOODT = ' + FloatToStr(CodigoODT));
  qDatos.SQL.Add('AND CONSECUTIVO = ' + IntToStr(Consecutivo - 1));
  qDatos.Open;
  while not qDatos.Eof do
  begin
    qTemp.Close;
    qTemp.SQL.Clear;
    qTemp.SQL.Add('INSERT INTO ODTVEHICULO (CODIGOODT, CONSECUTIVO, CODIGOVEHICULO) VALUES(' + FloatToStr(CodigoODT) + ',');
    qTemp.SQL.Add(IntToStr(Consecutivo) + ',''' + qDatos.FieldByName('CODIGOVEHICULO').AsString + ''')');
    qTemp.ExecSQL;
    qDatos.Next;
  end;
  qTemp.Free;
  qDatos.Free;
end;

procedure TODTHija.AsignarGrupoTrabajo(CodigoGrupoTrabajo: Integer);
var Query: TQuery;
    Existe: Boolean;
begin
  Query := TQuery.Create(nil);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('SELECT COUNT(*) AS TOTAL FROM');
  Query.SQL.Add('GRUPOTRABAJO WHERE CODIGOADMINISTRATIVO = ' + FloatToStr(CodigoAdministrativo));
  Query.SQL.Add('AND CODIGOGRUPOTRABAJO = ' + FloatToStr(CodigoGrupoTrabajo));
  Query.Open;
  Existe := Query.FieldByName('TOTAL').AsInteger > 0;
  if Existe then
  begin
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('UPDATE ODTDIA SET CODIGOGRUPOTRABAJO = ' + IntToStr(CodigoGrupoTrabajo));
    Query.SQL.Add('WHERE CODIGOODT = ' + FloatToStr(CodigoODT));
    Query.SQL.Add('AND CONSECUTIVO = ' + IntToStr(Consecutivo));
    Query.ExecSQL;
  end;
  Query.Free;
end;

procedure TODTHija.AsignarReporte(CodigoReporte: Double);
var Query: TQuery;
    Existe, Asignado: Boolean;
begin
  Query := TQuery.Create(nil);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('SELECT COUNT(*) AS TOTAL FROM');
  Query.SQL.Add('REPORTE WHERE CODIGOREPORTE = ' + FloatToStr(CodigoReporte));
  Query.Open;
  Existe := Query.FieldByName('TOTAL').AsInteger > 0;
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT COUNT(*) AS TOTAL FROM ODTREPORTE');
  Query.SQL.Add('WHERE CODIGOREPORTE = ' + FloatToStr(CodigoReporte));
  Query.Open;
  Asignado := Query.FieldByName('TOTAL').AsInteger > 0;
  if (Existe) and (not Asignado) then
  begin
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Add('INSERT INTO ODTREPORTE VALUES(');
    Query.SQL.Add(FloatToStr(CodigoODT) + ',');
    Query.SQL.Add(IntToStr(Consecutivo) + ',');
    Query.SQL.Add(FloatToStr(CodigoReporte) + ')');
    Query.ExecSQL;
  end;
  Query.Free;
  if (not Existe) then
    MessageDlg('No se pudo asignar el reporte debido a que este no ha sido creado.',mtError,[mbOk],0);
  if (Asignado) then
    MessageDlg('No se pudo asignar el reporte debido a que este ya fue asignado a otra ODT.',mtError,[mbOk],0); 
end;

procedure TODTHija.AsignarDireccion(const DataSet: TDataSet);
var Query: TQuery;
begin
  Query := TQuery.Create(nil);
  Query.DatabaseName := 'BaseDato';
  with Query.SQL do
  begin
    Clear;
    Add('UPDATE ODTDIA');
    Add('SET ');
    Add('CODIGOGEOGRAFICO = :CODIGOGEOGRAFICO ,');
    Add('CODIGOTIPOVIA = :CODIGOTIPOVIA ,');
    Add('CODIGONOMBREVIA = :CODIGONOMBREVIA ,');
    Add('MODIFICADORVIA = :MODIFICADORVIA ,');
    Add('DUPLICADOR = :DUPLICADOR ,');
    Add('MODIFICADORDUPLICADOR = :MODIFICADORDUPLICADOR ,');
    Add('NUMEROPUERTA = :NUMEROPUERTA ,');
    Add('CODIGOTIPOPREDIO = :CODIGOTIPOPREDIO ,');
    Add('DESCRIPCIONTIPOPREDIO = :DESCRIPCIONTIPOPREDIO');
    Add('WHERE');
    Add('CODIGOODT = ' + FloatToStr(CodigoODT) + ' AND');
    Add('CONSECUTIVO = ' + IntToStr(Consecutivo));
  end;
  Query.ParamByName('CODIGOGEOGRAFICO').Assign(DataSet.FieldByName('CIGDANO'));
  Query.ParamByName('CODIGOTIPOVIA').Assign(DataSet.FieldByName('CODIGOTIPOVIA'));
  Query.ParamByName('CODIGONOMBREVIA').Assign(DataSet.FieldByName('CODIGONOMBREVIA'));
  Query.ParamByName('MODIFICADORVIA').Assign(DataSet.FieldByName('MODIFICADORVIA'));
  Query.ParamByName('DUPLICADOR').Assign(DataSet.FieldByName('DUPLICADOR'));
  Query.ParamByName('MODIFICADORDUPLICADOR').Assign(DataSet.FieldByName('MODIFICADORDUPLICADOR'));
  Query.ParamByName('NUMEROPUERTA').Assign(DataSet.FieldByName('NUMEROPUERTA'));
  Query.ParamByName('CODIGOTIPOPREDIO').Assign(DataSet.FieldByName('CODIGOTIPOPREDIO'));
  Query.ParamByName('DESCRIPCIONTIPOPREDIO').Assign(DataSet.FieldByName('DESCRIPCIONTIPOPREDIO'));
  Query.ExecSQL;
  Query.Free;
end;

procedure TODTHija.AsignarFechas(FechaInicio, FechaFinal: TField);
var Query: TQuery;
begin
  Query := TQuery.Create(nil);
  Query.DatabaseName := 'BaseDato';
  with Query.SQL do
  begin
    Clear;
    Add('UPDATE ODTDIA');
    Add('SET ');
    Add('FECHAINICIOTRABAJO = :FECHAINICIOTRABAJO ,');
    Add('FECHAFINALTRABAJO = :FECHAFINALTRABAJO');
    Add('WHERE');
    Add('CODIGOODT = ' + FloatToStr(CodigoODT) + ' AND');
    Add('CONSECUTIVO = ' + IntToStr(Consecutivo));
  end;
  Query.ParamByName('FECHAINICIOTRABAJO').Assign(FechaInicio);
  Query.ParamByName('FECHAFINALTRABAJO').Assign(FechaFinal);
  Query.ExecSQL;
  Query.Free;
end;

procedure TODTHija.MovilAnterior;
var qDatos, qActualizar: TQuery;
begin
  qDatos:=TQuery.Create(nil);
  qDatos.DataBaseName:='BaseDato';
  qDatos.SQL.Add('SELECT CODIGOGRUPOTRABAJO FROM ODTDIA WHERE CODIGOODT = ' + FloatToStr(CodigoODT));
  qDatos.SQL.Add('AND CONSECUTIVO = ' + IntToStr(Consecutivo - 1));
  qDatos.Open;
  if qDatos.FieldByName('CODIGOGRUPOTRABAJO').AsString <> '' then
  begin
    qActualizar := TQuery.Create(nil);
    qActualizar.DatabaseName := 'BaseDato';
    qActualizar.SQL.Add('UPDATE ODTDIA SET CODIGOGRUPOTRABAJO = ' + qDatos.FieldByName('CODIGOGRUPOTRABAJO').AsString);
    qActualizar.SQL.Add('WHERE CODIGOODT = ' + FloatToStr(CodigoODT) + ' AND CONSECUTIVO = ' + IntToStr(Consecutivo));
    qActualizar.ExecSQL;
    qActualizar.Free;
  end;
  qDatos.Free;
end;

function TODTHija.BorrarODTHija: Boolean;
var Query: TQuery;
begin
  Result := False;
  if MessageDlg('Esta seguro de eliminar la ODT ' + GenerarImpreso(CodigoODT,Consecutivo),mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    BorrarReporte;
    BorrarMedidasSeguridad;
    BorrarVehiculos;
    BorrarMateriales;
    BorrarManoObra;
    BorrarActividades;
    BorrarApoyos;
    Query := TQuery.Create(nil);
    Query.DatabaseName := 'BaseDato';
    Query.SQL.Add('DELETE FROM ODTDIA');
    Query.SQL.Add('WHERE CODIGOODT = ' + FloatToStr(CodigoODT));
    Query.SQL.Add('AND CONSECUTIVO = ' + IntToStr(Consecutivo));
    Query.ExecSQL;
    Query.Free;
    Result := True;
  end;
end;

function GetFecha(Tipo: Boolean;fecha:string): String;
begin
  fFormaFecha := TfFormaFecha.Create(Application);
  uFormaFecha.sFecha := Fecha;
  fFormaFecha.height:=291;
  if FFormaFecha.ShowModal = mrOk then
    if Tipo then
       Result := DateTimetoStr(FFormaFecha.Date+FFormaFecha.fTime)
    else
       Result := DateTimetoStr(FFormaFecha.Date)
  else Result := sFecha;
  fFormaFecha.Free;
end;

function NombreAplicativo:string;
var
  ArcIni : TiniFile;
  VarRutaLocal:string;
begin
  VarRutaLocal := ExtractFilePath(ParamStr(0));
  if VarRutaLocal[Length(VarRutaLocal)] <> '\' then
    VarRutaLocal := VarRutaLocal + '\';
  ArcIni := TiniFile.Create(VarRutaLocal+'energis.ini');
  result:=arcini.ReadString('APLICATIVO','nombre','ENERGIS');
  ArcIni.Free;
end;
function GastosTranporteAuxiliosOdt(
  CodigoOdt: string): double;
var query:tquery;
begin
  result:=0;
  query:=tquery.create(nil);
  query.databasename:='BaseDato';
  query.sql.Add('select  sum(nvl(oav.valorimputacion,0)) valortransporte from odtviaticodetalle oav,odtviatico oa,imputacionmanoobra i');
  query.sql.Add('where oa.codigoviatico=oav.codigoviatico');
  query.sql.Add('and oav.codigoimputacionmanoobra=i.codigoimputacionmanoobra');
  query.sql.Add('and codigosubtipoimputacionodt not in (''ANT'',''AUX'',''VIA'')');
  query.sql.Add('and valorimputacion is not null ');
  query.sql.Add('and codigoodt='+codigoodt);
  query.open;
  result:=query.fieldbyname('valortransporte').AsFloat;
  query.free;
end;



function GastosTransporteViaticosOdt(
  CodigoOdt: string): double;
var query:tquery;
begin
  result:=0;
  query:=tquery.create(nil);
  query.databasename:='BaseDato';
  query.sql.Add('select  sum(nvl(oav.valorimputacion,0)) valortransporte from odtviaticodetalle oav,odtviatico oa,imputacionmanoobra i');
  query.sql.Add('where oa.codigoviatico=oav.codigoviatico');
  query.sql.Add('and oav.codigoimputacionmanoobra=i.codigoimputacionmanoobra');
  query.sql.Add('and codigosubtipoimputacionodt not in (''DES'',''ALM'',''COM'')');
  query.sql.Add('and valorimputacion is not null');
  query.sql.Add('and codigoodt='+codigoodt);
  query.open;
  result:=query.fieldbyname('valortransporte').AsFloat;
  query.free;
end;

procedure CostosActividadOdtHija(CodigoOdt:double;consecutivo:integer;var Mensaje:string);
var query:tquery;
  costo:double;
begin
  query:=TQuery.create(application);
  query.databasename:='BaseDato';
  query.sql.add('select sum(nvl(costoactividad,0)) from odtactividad a,odtdetalleactividad o');
  query.sql.add('where o.codigoodtactividad=a.codigoodtactividad');
  query.sql.add('and o.codigoniveltension=a.codigoniveltension');
  query.sql.add('and o.codigoodtopera=a.codigoodtopera');
  query.sql.add('and codigoodt='+floattostr(CodigoOdt));
  query.sql.add('and consecutivo='+inttostr(consecutivo));
  query.open;
  costo:=0;
  if (query.fields[0].AsString<>'')then
    costo:=query.fields[0].AsFloat;
  query.sql.clear;
  query.sql.add('update odtdia');
  query.sql.add('set costoactividad='+floattostr(costo) );
  query.sql.add('where codigoodt='+floattostr(codigoodt));
  query.sql.add('and consecutivo='+inttostr(consecutivo));
  try
    query.ExecSQL;
  except
  end;
  query.free;
end;
function CostoManoObraHija(CodigoOdt:double;consecutivo:integer;var Mensaje:string):double;
var ValorHora,CostoIndividual,CostoTotalMano, Sueldo:extended;
 Hour, Min, Sec, MSec, dias: Word;
 Horas:double;
 query,qdatos,qActualiza:tquery;
 l:tlist;
 i:integer;
 sl:tstringlist;
 p:^TDesdeHasta;
begin
//falta meter viaticos y auxilios distribuidos sobre los trabajos
  CostoTotalMano:=0;
  mensaje:='';
  query:=tquery.create(nil);
  query.databasename:='BaseDato';
  query.sql.add('SELECT O.CODIGOTIPOTURNO,O.CODIGOTURNO,OD.FECHAINICIOTRABAJO,OD.FECHAFINALTRABAJO');
  query.sql.add('FROM ODT O,ODTDIA OD');
  query.sql.add('WHERE OD.CODIGOODT=O.CODIGOODT');
  query.sql.add('AND OD.CODIGOODT='+floattostr(codigoodt));
  query.sql.add('AND OD.CONSECUTIVO='+inttostr(consecutivo));
  query.open;

  qDatos:=tquery.create(nil);
  qDatos.databasename:='BaseDato';
  qDatos.sql.add('SELECT  OM.CODIGOEMPLEADO,S.SUELDO FROM SUELDO S,EMPLEADO E, ODTPRESMANO OM');
  qDatos.sql.add('WHERE OM.CODIGOODT='+floattostr(codigoodt));
  qDatos.sql.add('AND OM.CONSECUTIVO='+inttostr(consecutivo));
  qDatos.sql.add('AND OM.CODIGOEMPLEADO=E.CODIGOEMPLEADO');
  qDatos.sql.add('AND E.CODIGOSUELDO=S.CODIGOSUELDO');
  qdatos.Open;
  sueldo:=qDatos.fieldbyname('SUELDO').AsFloat;

  qActualiza:=tquery.create(nil);
  qActualiza.databasename:='BaseDato';


  if (query.fieldbyname('FECHAFINALTRABAJO').AsString<>'') and  (query.fieldbyname('FECHAINICIOTRABAJO').asstring<>'')then
  begin
    if (query.fieldbyname('CODIGOTIPOTURNO').Asstring<>'')and(query.fieldbyname('CODIGOTURNO').Asstring<>'')then
    begin
      l:=HorasLaboralesTurno(query.fieldbyname('FECHAINICIOTRABAJO').AsDateTime,query.fieldbyname('FECHAFINALTRABAJO').AsDatetime,
      query.fieldbyname('CODIGOTIPOTURNO').AsInteger,query.fieldbyname('CODIGOTURNO').AsInteger);
      qdatos.First;
      sl:=TStringList.create;
      if (l<>nil) then
      begin
        for i :=0 to l.Count-1 do
        begin
          p:=l[i];
          sl.add(floattostr(p.desde)+':'+FloatToStr(p.hasta));
        end;
        While Not qDatos.Eof do
        begin
          try
            horas:=0;
            horas:=HorasTotalesEmpleado(qdatos.fieldbyName('CodigoEmpleado').asInteger,codigoodt,l);
            Sueldo:= qDatos.fieldbyName('SUELDO').asfloat;
            ValorHora:= Sueldo/240;
            CostoIndividual:=ValorHora *Horas ;
            qActualiza.sql.clear;
            qActualiza.sql.add('UPDATE ODTPRESMANO SET COSTOS='+floattostr(CostoIndividual));
            qActualiza.sql.add('WHERE CODIGOEMPLEADO='+qdatos.Fieldbyname('CODIGOEMPLEADO').asstring);
            qActualiza.sql.add('AND CODIGOODT='+floattostr(codigoodt));
            qActualiza.sql.add('AND CONSECUTIVO='+intToStr(consecutivo));
            qActualiza.execsql;
            CostoTotalMano:=CostoIndividual+CostoTotalMano;
          except;
          end;
          qDatos.Next;
        end;//end while
        qActualiza.sql.clear;
        qActualiza.sql.add('UPDATE ODTDIA SET COSTOMANOOBRA='+floattostr(CostoTotalMano));
        qActualiza.sql.add('WHERE CODIGOODT='+floattostr(codigoodt));
        qActualiza.sql.add('AND CONSECUTIVO='+intToStr(consecutivo));
        qActualiza.execsql;
      end;
    end
    else mensaje:='No ha ingresado información del horario de trabajo en la Odt Padre';
  end
  else mensaje:='No existen fechas de inicio o fin del trabajo';
  query.free;
  qDatos.free;
  qActualiza.free;
  result:=costototalmano;
end;

function CostoMaterialHija(CodigoOdt:double;consecutivo:integer):double;
var ValorUnitario,Total,CostoMaterial: Double;
 query,qdatos,qActualiza:tquery;
begin
  qDatos:=tquery.create(nil);
  qDatos.databasename:='BaseDato';
  qDatos.sql.add('SELECT OM.CODIGOMATERIAL,M.VALORUNITARIO,OM.CANTIDADCONSUMIDA FROM ODTPRESMATE OM,MATERIAL M');
  qDatos.sql.add('WHERE OM.CODIGOMATERIAL=M.CODIGOMATERIAL');
  qDatos.sql.add('AND OM.CODIGOODT='+floattostr(codigoodt));
  qDatos.sql.add('AND OM.CONSECUTIVO='+intToStr(consecutivo));
  qdatos.Open;

  qdatos.First;
  Total:=0;

  qActualiza:=tquery.create(nil);
  qActualiza.databasename:='BaseDato';

  While Not qdatos.Eof do
  begin
    ValorUnitario:=qDatos.FieldByName('ValorUnitario').AsFloat;
    CostoMaterial:=qDatos.FieldByName('CANTIDADCONSUMIDA').AsFloat*ValorUnitario;

    qActualiza.sql.clear;
    qActualiza.sql.add('UPDATE ODTPRESMATE SET VALORLIQUIDADO='+floattostr(CostoMaterial));
    qActualiza.sql.add('WHERE CODIGOMATERIAL='+qdatos.Fieldbyname('CODIGOMATERIAL').asstring);
    qActualiza.sql.add('AND CODIGOODT='+floattostr(codigoodt));
    qActualiza.sql.add('AND CONSECUTIVO='+intToStr(consecutivo));
    qActualiza.execsql;

    Total:=Total+CostoMaterial;
    qdatos.Next;
  end;
  qActualiza.sql.clear;
  qActualiza.sql.add('UPDATE ODTDIA SET COSTOMATERIAL='+floattostr(Total));
  qActualiza.sql.add('WHERE CODIGOODT='+floattostr(codigoodt));
  qActualiza.sql.add('AND CONSECUTIVO='+intToStr(consecutivo));
  qActualiza.execsql;


  qActualiza.free;
  qDatos.free;
  result:=Total;
end;

function CostoTransporteHija(CodigoOdt:double;consecutivo:integer):double;
var  vehiculoIndividual,vehiculototal:real;
 query,qdatos,qActualiza:tquery;
 Hour, Min, Sec, MSec, dias: Word;
 Horas:double;
 l:tlist;
begin
  query:=tquery.create(nil);
  query.databasename:='BaseDato';
  query.sql.add('SELECT OD.FECHAINICIOTRABAJO,OD.FECHAFINALTRABAJO,O.CODIGOTURNO,O.CODIGOTIPOTURNO');
  query.sql.add('FROM ODTDIA OD,ODT O');
  query.sql.add('WHERE O.CODIGOODT=OD.CODIGOODT');
  query.sql.add('AND OD.CODIGOODT='+floattostr(codigoodt));
  query.sql.add('AND OD.CONSECUTIVO='+inttostr(consecutivo));
  query.open;

  qDatos:=tquery.create(nil);
  qDatos.databasename:='BaseDato';
  qDatos.sql.add('SELECT OV.CODIGOVEHICULO,TV.COSTOVEHICULO,O.CODIGOTURNO,O.CODIGOTIPOTURNO FROM ODT O,ODTVEHICULO OV,VEHICULO V,TIPOVEHICULO TV');
  qDatos.sql.add('WHERE O.CODIGOODT=OV.CODIGOODT ');
  qDatos.sql.add('AND OV.CODIGOVEHICULO=V.CODIGOVEHICULO');
  qDatos.sql.add('AND V.CODIGOTIPOVEHICULO=TV.CODIGOTIPOVEHICULO');
  qDatos.sql.add('AND OV.CODIGOODT='+floattostr(codigoodt));
  qDatos.sql.add('AND OV.CONSECUTIVO='+intToStr(consecutivo));
  qdatos.Open;

  qActualiza:=tquery.create(nil);
  qActualiza.databasename:='BaseDato';

  if (query.fieldbyname('FECHAFINALTRABAJO').AsString<>'') and  (query.fieldbyname('FECHAINICIOTRABAJO').asstring<>'')then
  begin
    vehiculototal:=0;
    dias:= trunc(query.fieldbyname('FECHAFINALTRABAJO').AsDatetime-query.fieldbyname('FECHAINICIOTRABAJO').AsDateTime);
    decodetime((query.fieldbyname('FECHAFINALTRABAJO').AsDateTime-query.fieldbyname('FECHAINICIOTRABAJO').AsDateTime), Hour, Min, Sec, MSec);
    l:=HorasLaboralesTurno(query.fieldbyname('FECHAINICIOTRABAJO').AsDateTime,query.fieldbyname('FECHAFINALTRABAJO').AsDatetime,
    query.fieldbyname('CODIGOTIPOTURNO').AsInteger,query.fieldbyname('CODIGOTURNO').AsInteger);
    Horas:=sumaListaHoras(l);
    qDatos.First;
    While Not qDatos.Eof do
    begin
      vehiculoIndividual:=qDatos.FieldByName('COSTOVEHICULO').AsFloat*Horas;
      vehiculototal:= vehiculototal+vehiculoIndividual;
      qDatos.Next;
    end;
    qActualiza.sql.clear;
    qActualiza.sql.add('UPDATE ODTDIA SET COSTOTRANSPORTE='+floattostr(vehiculototal));
    qActualiza.sql.add('WHERE CODIGOODT='+floattostr(codigoodt));
    qActualiza.sql.add('AND CONSECUTIVO='+intToStr(consecutivo));
    qActualiza.execsql;
  end;
  query.free;
  qActualiza.free;
  qDatos.free;
end;

function CostoEquipoHija(CodigoOdt:double;consecutivo:integer):double;
var  EquipoIndividual,Equipototal:real;
 query,qdatos,qActualiza:tquery;
 Hour, Min, Sec, MSec, dias: Word;
 Horas:double;
 l:tlist;
begin
  query:=tquery.create(nil);
  query.databasename:='BaseDato';
  query.sql.add('SELECT OD.FECHAINICIOTRABAJO,OD.FECHAFINALTRABAJO,O.CODIGOTURNO,O.CODIGOTIPOTURNO');
  query.sql.add('FROM ODTDIA OD,ODT O');
  query.sql.add('WHERE O.CODIGOODT=OD.CODIGOODT');
  query.sql.add('AND OD.CODIGOODT='+floattostr(codigoodt));
  query.sql.add('AND OD.CONSECUTIVO='+inttostr(consecutivo));
  query.open;

  qDatos:=tquery.create(nil);
  qDatos.databasename:='BaseDato';
  qDatos.sql.add('SELECT OE.CODIGOEQUIPO,OE.COSTOUNITARIO,OE.COSTOUNITARIO*OE.CANTIDAD VALORHORA,O.CODIGOTURNO,O.CODIGOTIPOTURNO FROM ODT O,ODTPRESEQUIPO OE,EQUIPO E');
  qDatos.sql.add('WHERE O.CODIGOODT=OE.CODIGOODT ');
  qDatos.sql.add('AND OE.CODIGOEQUIPO=E.CODIGOEQUIPO');
  qDatos.sql.add('AND OE.CODIGOODT='+floattostr(codigoodt));
  qDatos.sql.add('AND OE.CONSECUTIVO='+intToStr(consecutivo));
  qdatos.Open;

  qActualiza:=tquery.create(nil);
  qActualiza.databasename:='BaseDato';

  if (query.fieldbyname('FECHAFINALTRABAJO').AsString<>'') and  (query.fieldbyname('FECHAINICIOTRABAJO').asstring<>'')then
  begin
    Equipototal:=0;
    horas:= (query.fieldbyname('FECHAFINALTRABAJO').AsDatetime-query.fieldbyname('FECHAINICIOTRABAJO').AsDateTime)*24;
    qDatos.First;
    While Not qDatos.Eof do
    begin
      EquipoIndividual:=qDatos.FieldByName('VALORHORA').AsFloat*Horas;
      equipototal:= equipototal+EquipoIndividual;
      qDatos.Next;
    end;
    qActualiza.sql.clear;
    qActualiza.sql.add('UPDATE ODTDIA SET COSTOEQUIPO='+floattostr(equipototal));
    qActualiza.sql.add('WHERE CODIGOODT='+floattostr(codigoodt));
    qActualiza.sql.add('AND CONSECUTIVO='+intToStr(consecutivo));
    qActualiza.execsql;
  end;
  query.free;
  qActualiza.free;
  qDatos.free;
end;

//Lista de intervalos de horas desde-hasta laborales por día
//a partir del intervalo de fechas que recibe como parámetro
function HorasLaboralesTurno(desde, hasta: tdatetime;
  tipo, turno: integer): tlist;
var query:tquery;
  horainicio,horafin,desde1,dia,hasta1:tdatetime;
  p,r:^TDesdeHasta;
  semana:array [1..7]of string;
  listaturno:tlist;
  i:integer;
begin
  result:=TList.create;
  query:=TQuery.create(Nil);
  listaturno:=TList.create;
  query.databasename:='BaseDato';
  query.sql.Add('SELECT FECHADESDE,FECHAHASTA,D1,D2,D3,D4,D5,D6,D7 FROM TIPOTURNODETALLE');
  query.sql.Add(' WHERE CODIGOTIPOTURNO='+inttostr(tipo));
  query.sql.Add(' AND CODIGOTURNO='+inttostr(turno));
  query.sql.Add(' AND CODIGOTURNO>0');
  query.open;
  horainicio:=0;
  horafin:=0;
  if (query.fieldbyname('FECHADESDE').AsString<>'')then
    horainicio:=query.fieldbyname('FECHADESDE').asdatetime;
  if (query.fieldbyname('FECHAHASTA').asstring<>'')then
    horafin:=query.fieldbyname('FECHAHASTA').asdatetime;
  while (not query.eof) do
  begin
    new(r);
    r.desde:=0;
    r.hasta:=0;
    if (query.fieldbyname('FECHADESDE').AsString<>'')then
      r.desde:=query.fieldbyname('FECHADESDE').asdatetime;
    if (query.fieldbyname('FECHAHASTA').asstring<>'')then
      r.Hasta:=query.fieldbyname('FECHAHASTA').asdatetime;
    listaturno.add(r);
    query.next;
  end;
  if horainicio>0 then
  begin
    try
      desde1:=desde;
      dia:=trunc(desde)-1;  // le resto 1 porque las horas del turno le suman 1 al día
      if desde<(horainicio+dia) then
        desde1:=horainicio+dia;
      semana[1]:=query.fieldbyname('D2').AsString;
      semana[2]:=query.fieldbyname('D3').AsString;
      semana[3]:=query.fieldbyname('D4').AsString;
      semana[4]:=query.fieldbyname('D5').AsString;
      semana[5]:=query.fieldbyname('D6').AsString;
      semana[6]:=query.fieldbyname('D7').AsString;
      semana[7]:=query.fieldbyname('D1').AsString;
      query.free;
      //desde hasta en intervalos de dias
      while (desde1<=(trunc(hasta)+1)) do
      begin
        hasta1:=desde1+1;
        if (hasta1>hasta)then
          hasta1:=hasta;
        if (semana[dayofweek(dia+1)]='S')then
        begin
          for i:=0 to listaturno.count-1 do
          begin
            r:=listaturno[i];
            new(p);
            p^:=RangoInterseccionhoras(dia+r.desde,dia+r.hasta,desde1,hasta1);
            result.add(p);
          end;
        end;
        desde1:=desde1+1;
        dia:=dia+1;
      end;
    except
      on e:exception do
      begin
        showmessage(e.message);
      end;
    end;
  end;
  listaturno.free;
end;

function HorasTotalesEmpleado(cedula,codigoodt: double;
  listahoras: tlist): double;
var query:tquery;
  p:^TDesdeHasta;
  i:integer;
  l:tlist;
begin
  query:=TQuery.create(nil);
  query.databasename:='BaseDato';
  query.sql.add('SELECT FECHAHORADESDE,FECHAHORAHASTA FROM ODTSOBRETIEMPODETALLE');
  query.sql.add('WHERE CODIGOEMPLEADO='+floattostr(cedula));
  query.sql.add('AND CODIGOODT='+floattostr(codigoodt));
  query.open;
  i:=0;
  result:=0;
  for i := 0 to listahoras.count-1 do
  begin
    p:=listahoras[i];
    query.first;
    result:=result+(p.Hasta-p.desde);      //restar las extras que se intercepten
    while (not query.eof) do
    begin
      result:=result- SumaInterseccionHoras(p.desde,p.hasta,query.fieldbyname('FECHAHORADESDE').AsDateTime,query.fieldbyname('FECHAHORAHASTA').AsDateTime);
      query.Next;
    end;
  end;
  // para asi sumar las horas extras solo una vez
  query.sql.clear;
  query.sql.add('select sum(nvl(fechahorahasta,0)-nvl(fechahoradesde,0)) from odtsobretiempodetalle');
  query.sql.add(' where codigoempleado='+floattostr(cedula));
  query.sql.add(' and codigoodt='+floattostr(codigoodt));
  query.open;
  if query.fields[0].AsString<>'' then
    Result:=Result+ query.fields[0].AsFloat;
  result:=round(result*24);
  query.free;
end;

function SumaListaHoras(listahoras: tlist): double;
var
  p:^TDesdeHasta;
  i:integer;
  l:tlist;
begin
  i:=0;
  result:=0;
  for i := 0 to listahoras.count-1 do
  begin
    p:=listahoras[i];
    result:=result+(p.Hasta-p.desde);
  end;
  result:=result*24;
end;

function RangoInterseccionHoras(Desde1, Hasta1, Desde2,
  Hasta2: TDateTime): TDesdeHasta;
begin
  result.Hasta:=min(Hasta1,Hasta2);
  result.desde:=max(Desde1,Desde2);
  if (result.hasta<result.desde) then
  begin
    result.Desde:=0;
    result.Hasta:=0;
  end;
end;


function SumaInterseccionHoras(Desde1, Hasta1, Desde2,
  Hasta2: TDateTime): double;
begin
  result:=min(Hasta1,Hasta2)-max(Desde1,Desde2);
  if (result<0) then
    result:=0;
end;

procedure CostosOdtHija(CodigoOdt:double;consecutivo:integer);
var mensaje:string;
begin
  CostoMaterialHija(codigoodt,consecutivo);
  CostoManoObraHija(codigoodt,consecutivo,mensaje);
  CostoTransporteHija(codigoodt,consecutivo);
  CostoEquipoHija(codigoodt,consecutivo);
end;

function RegistrarImpresionViatico(tipo:integer;valor,codigoodt:double):double;
var query:tquery;
consecutivo:integer;
cadena,s:string;
begin
  query:=TQuery.create(Application);
  query.DatabaseName:='Basedato';
  if (tipo=0) then s:='N'
  else s:='V';
  query.sql.Add('select sq_odtimpresion.nextval from dual');
  query.open;
  consecutivo:= query.Fields[0].asinteger;
  cadena:= completarcadenaIzquierda(inttostr(AnoServidor),'0',4)+ completarcadenaIzquierda(inttostr(consecutivo),'0',5);
  query.sql.clear;
  query.sql.add('insert into odtimpresion(numeroimpresion,tipo,fecha,codigoodt,valor)');
  query.sql.add('values(:numeroimpresion,:tipo,trunc(sysdate),:codigoodt,:valor)');
  query.ParamByName('numeroimpresion').Asstring:=cadena;
  query.ParamByName('tipo').Asstring:=s;
//  query.ParamByName('fecha').AsDateTime:= fechaServidor;
  query.ParamByName('codigoodt').AsFloat:=codigoodt;
  query.ParamByName('valor').AsFloat:=valor;
  query.ExecSQL;
  query.free;
  result:=strtofloat(cadena);
end;

function RegistrarImpresionAuxilios(valor,codigoodt:double):double;
var query:tquery;
  consecutivo:integer;
  cadena,s:string;
begin
  query:=TQuery.create(Application);
  query.DatabaseName:='Basedato';
  query.sql.Add('select sq_odtimpresion.nextval from dual');
  query.open;
  consecutivo:= query.Fields[0].asinteger;
  cadena:= completarcadenaIzquierda(inttostr(AnoServidor),'0',4)+ completarcadenaIzquierda(inttostr(consecutivo),'0',5);
  query.close;
  query.sql.clear;
  query.sql.add('insert into odtimpresion(numeroimpresion,tipo,fecha,codigoodt,valor)');
  query.sql.add('values(:numeroimpresion,:tipo,trunc(sysdate),:codigoodt,:valor)');
  query.ParamByName('numeroimpresion').Asstring:=cadena;
  query.ParamByName('tipo').Asstring:='A';
//  query.ParamByName('fecha').AsDateTime:= fechaServidor;
  query.ParamByName('codigoodt').AsFloat:=codigoodt;
  query.ParamByName('valor').AsFloat:=valor;
  query.ExecSQL;
  query.close;
  query.free;
  result:=strtofloat(cadena);
end;

function FechaServidor: TDateTime;
var qFecha: TQuery;
begin
  Result := 0;
  qFecha := TQuery.Create(Application);
  qFecha.DatabaseName := 'BaseDato';
  qFecha.SQL.Text := 'SELECT SYSDATE FROM DUAL';
  qFecha.Open;
  Result := qFecha.Fields[0].AsDateTime;
  qFecha.Free;
end;

function AnoServidor:integer;
var qFecha: TQuery;
begin
  Result := 0;
  qFecha := TQuery.Create(Application);
  qFecha.DatabaseName := 'BaseDato';
  qFecha.SQL.Text := 'SELECT to_char(SYSDATE,''yyyy'') ANO FROM DUAL';
  qFecha.Open;
  Result := qFecha.Fields[0].asinteger;
  qFecha.Free;
end;

function SeleccionarEmpleado(var nombre:string;cia:integer=0):double;
begin
  result :=0;
  fBuscarEmpleado:=TfBuscarEmpleado.Create(Application);
  try
    if cia>0 then
    begin
      FdFiltrarEmpleado.tdFiltroEmpleado.Edit;
      FdFiltrarEmpleado.tdFiltroEmpleadoCODIGOADMINISTRATIVO.AsString:=inttostr(cia);
      FdFiltrarEmpleado.BitBtnFiltrarClick(nil);
    end;

    if fBuscarEmpleado.ShowModal=MrOK then
    begin
      result:=fBuscarEmpleado.qListaEmpleado.FieldByName('CODIGOEMPLEADO').asfloat;
      nombre:=fBuscarEmpleado.qListaEmpleado.FieldByName('NOMBREEMPLEADO').AsString
    end;
  finally
    fBuscarEmpleado.Free;
    fBuscarEmpleado:=nil;
  end;
end;


procedure SeleccionarGrupoTrabajo(var cia:integer;var codigo:integer);
begin
  fSeleccionarGrupoTrabajo:=tfSeleccionarGrupoTrabajo.Create(Application);
  try
    if cia>0 then
    begin
      fSeleccionarGrupoTrabajo.EdCodigo.Text:=inttostr(cia);
      fSeleccionarGrupoTrabajo.SBFiltrarClick(nil);
    end;

    if fSeleccionarGrupoTrabajo.ShowModal=MrOK then
    begin
      cia:= fSeleccionarGrupoTrabajo.qDatosCODIGOADMINISTRATIVO.asinteger;
      codigo:=fSeleccionarGrupoTrabajo.qDatosCODIGOGRUPOTRABAJO.asinteger;
    end;
  finally
    fSeleccionarGrupoTrabajo.Free;
    fSeleccionarGrupoTrabajo:=nil;
  end;
end;
//***************************************************************************
//   Devuelve los códigos administrativos
//   para los que el usuario tiene permisos de edición
//   si -1 ninguna cia
//***************************************************************************
function GetCIASEdicionTablaUsuario(NombreTabla:string): string;
var qDatos:TQuery;
begin
  Result:='-1';
  ConsDll.RefrescarVariables;
  qDatos:=TQuery.Create(Application);
  try
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Add('SELECT CODIGOADMINISTRATIVO FROM ODTPERMISOS WHERE NOMBRETABLA = '''+Uppercase(NombreTabla)+'''');
    qDatos.SQL.Add('AND EDITAR=''S''');
    qDatos.SQL.Add('AND CODIGOUSUARIO = ' + IntToStr(VarCodigoUsuario));
    qDatos.Open;
    while not(qDatos.eof) do
    begin
      result:=Result+','+qDatos.fieldbyname('CODIGOADMINISTRATIVO').AsString;
      qDatos.next;
    end;
    result:='('+copy(result,2,length(result)-1)+')';
  finally
    qDatos.Free;
  end;
end;

function EsUsuarioAdmin:boolean;
begin
  ConsDll.RefrescarVariables;
  if VarCodigoUsuario = 0 then 
    Result:=true
  else
    Result:=false;
end;

function SeleccionarOdtTerminada:double;
begin
  result:=0;
  fSeleccionarOdt:=TfSeleccionarOdt.Create(Application);
  try
    if fSeleccionarOdt.ShowModal=MrOK then
    begin
      result:= fSeleccionarOdt.qDatosCODIGOODT.AsFloat;
    end;
  finally
    fSeleccionarOdt.Free;
    fSeleccionarOdt:=nil;
  end;
end;


function SeleccionarOdtHijaTerminada:String;
begin
  result:='';
  fSeleccionarOdtHija:=TfSeleccionarOdtHija.Create(Application);
  try
    if fSeleccionarOdtHija.ShowModal=MrOK then
    begin
      result:= fSeleccionarOdtHija.qDatosCODIGOODT.AsString + '-'+ fSeleccionarOdtHija.qDatosCONSECUTIVO.AsString ;
    end;
  finally
    fSeleccionarOdtHija.Free;
    fSeleccionarOdtHija:=nil;
  end;
end;

function SeleccionarUsuario:double;
begin
  result:=0;
  fSeleccionarUsuario:=tfSeleccionarUsuario.Create(Application);
  try
    if fSeleccionarUsuario.ShowModal=MrOK then
    begin
      result:= fSeleccionarUsuario.qDatosCODIGOUSUARIO.AsFloat;
    end;
  finally
    fSeleccionarUsuario.Free;
    fSeleccionarUsuario:=nil;
  end;
end;

function SeleccionarImpresion:double;
begin
  result:=0;
  fSeleccionarImpresionCobro:=TfSeleccionarImpresionCobro.Create(Application);
  try
    if fSeleccionarImpresionCobro.ShowModal=MrOK then
    begin
      if (fSeleccionarImpresionCobro.PageControl1.ActivePage=fSeleccionarImpresionCobro.tsAuxilios)then
         result:= fSeleccionarImpresionCobro.qAuxiliosNUMEROIMPRESION.AsFloat
      else
      begin
        if (fSeleccionarImpresionCobro.PageControl1.ActivePage=fSeleccionarImpresionCobro.tsViaticos) then
          result:= fSeleccionarImpresionCobro.qViaticosNUMEROIMPRESION.AsFloat
        else
          result:= fSeleccionarImpresionCobro.qAnticipoNUMEROIMPRESION.AsFloat
      end;
    end;
  finally
    fSeleccionarImpresionCobro.Free;
    fSeleccionarImpresionCobro:=nil;
  end;
end;

function CompletarCadenaIzquierda(s,c: string; n: integer): string;
var i:integer;
begin
  result:=s;
  if (length(s)<n) then
  begin
    i:=n-length(s);
    c:=copy(c,1,i);
    result:=c+result;
    result:=CompletarCadenaIzquierda(result,c,n);
  end;
end;

function EsDiaFestivo(Fecha:tdatetime):boolean;
var query:tquery;
begin
  query:=tquery.create(application);
  try
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT COUNT(*) FROM FESTIVO');
    query.sql.add('WHERE FECHAFESTIVO = TO_DATE('''+FormatDateTime('dd/mm/yyyy',Fecha)+''',''DD/MM/YYYY'')');
    query.open;
    result:=false;
    if query.Fields[0].AsInteger>0 then
      result:=true;
  except
  end;
  query.free;
end;
//Recorre un dataset que contiene cantidades de horas normales y extras diurnas y nocturnas por dia
//y las totaliza por conceptos de sobretiempo y sobreremuneración
function SumarCantidadesConceptosExtrasRecargos(Datos:tdataset): CantidadHorasConcepto;
var i:integer;
  Horas:CantidadHorasConcepto;
begin
  //Datos [fecha,festivo(S/N),CantDiurna,CantNocturna,CantExtraDiurna,CantExtraNocturna]
  Horas.DiurnaOrdinaria :=0;
  Horas.NocturnaOrdinaria := 0;
  Horas.ExtraDiurnaOrdinaria:=0;
  Horas.ExtraNocturnaOrdinaria:=0;
  Horas.DiurnaDomingo :=0;
  Horas.NocturnaFestivo := 0;
  Horas.DiurnaFestivo :=0;
  Horas.NocturnaDomingo := 0;
  Horas.ExtraDiurnaDomFestivo :=0;
  Horas.ExtraNocturnaDomFestivo:=0;
  try
    if Datos.RecordCount>0 then
    begin
      Datos.First;
      for i:= 0  to (Datos.RecordCount-1) do
      begin
        if Esdiafestivo(Datos.fieldbyname('fecha').AsDateTime) then
        begin
          Horas.DiurnaFestivo :=Horas.DiurnaFestivo+Datos.fieldbyname('DIURNA').AsInteger;
          Horas.NocturnaFestivo := Horas.NocturnaFestivo+Datos.fieldbyname('NOCTURNA').AsInteger;
          Horas.ExtraDiurnaDomFestivo := Horas.ExtraDiurnaDomFestivo +Datos.fieldbyname('EXTRADIURNA').AsInteger;
          Horas.ExtraNocturnaDomFestivo:=Horas.ExtraNocturnaDomFestivo+Datos.fieldbyname('EXTRANOCTURNA').AsInteger;
        end
        else
        begin
          if (DayOfWeek(Datos.fieldbyname('fecha').Asdatetime)=1 ) then
          begin
            Horas.DiurnaDomingo :=Horas.DiurnaDomingo+Datos.fieldbyname('DIURNA').AsInteger;
            Horas.NocturnaDomingo := Horas.NocturnaDomingo+Datos.fieldbyname('NOCTURNA').AsInteger;
            Horas.ExtraDiurnaDomFestivo := Horas.ExtraDiurnaDomFestivo +Datos.fieldbyname('EXTRADIURNA').AsInteger;
            Horas.ExtraNocturnaDomFestivo:=Horas.ExtraNocturnaDomFestivo+Datos.fieldbyname('EXTRANOCTURNA').AsInteger;
          end
          else
          begin
            Horas.DiurnaOrdinaria :=Horas.DiurnaOrdinaria +Datos.fieldbyname('DIURNA').AsInteger;
            Horas.NocturnaOrdinaria := Horas.NocturnaOrdinaria +Datos.fieldbyname('NOCTURNA').AsInteger;
            Horas.ExtraDiurnaOrdinaria:=Horas.ExtraDiurnaOrdinaria+Datos.fieldbyname('EXTRADIURNA').AsInteger;
            Horas.ExtraNocturnaOrdinaria:=Horas.ExtraNocturnaOrdinaria+Datos.fieldbyname('EXTRANOCTURNA').AsInteger;
          end;
        end;
        Datos.Next;
      end;
    end;
  except
  end;
  result:=horas;
end;

function CostoManoObraHijaIntegrado(CodigoOdt:double;consecutivo:integer;fechai:tdatetime;fechaf:tdatetime):double;
var sp,sp2:TStoredProc;
  query,qry:tquery;
  qactualiza:tquery;
  turno,tipoturno:integer;
  ds:TDataSet;
  Horas:CantidadHorasConcepto;
  Porcentajes:PorcentajeHorasConcepto;
  totalempleado,valordesayuno,valoralmuerzo,valorcomida:double;
  valordesayunoemp,valoralmuerzoemp,valorcomidaemp:double;
  parametro:tparam;
  valorhora:double;
  costototalmano:double;
  qvalorviatico:tquery;
begin
  query:=TQuery.create(nil);
  query.DatabaseName:='BaseDato';
  query.sql.add('SELECT VALORAUXILIOALIMENTACION FROM AUXILIOALIMENTACION');
  query.sql.add('WHERE CODIGOTIPOIMPUTACIONODT=''A''');
  query.sql.add('AND CODIGOSUBTIPOIMPUTACIONODT=''DES''');
  query.sql.add('AND VIGENCIADESDE<=:FECHAINICIO');
  query.sql.add('AND VIGENCIAHASTA>:FECHAINICIO');
  query.ParamByName('FECHAINICIO').AsDateTime:=fechai;
  query.open;
  valordesayuno:=query.fieldbyname('VALORAUXILIOALIMENTACION').AsFloat;
  query.sql.Clear;
  query.sql.add('SELECT VALORAUXILIOALIMENTACION FROM AUXILIOALIMENTACION');
  query.sql.add('WHERE CODIGOTIPOIMPUTACIONODT=''A''');
  query.sql.add('AND CODIGOSUBTIPOIMPUTACIONODT=''ALM''');
  query.sql.add('AND VIGENCIADESDE<=:FECHAINICIO');
  query.sql.add('AND VIGENCIAHASTA>:FECHAINICIO');
  query.ParamByName('FECHAINICIO').AsDateTime:=fechai;
  query.open;
  valoralmuerzo:=query.fieldbyname('VALORAUXILIOALIMENTACION').AsFloat;
  query.sql.Clear;
  query.sql.add('SELECT VALORAUXILIOALIMENTACION FROM AUXILIOALIMENTACION');
  query.sql.add('WHERE CODIGOTIPOIMPUTACIONODT=''A''');
  query.sql.add('AND CODIGOSUBTIPOIMPUTACIONODT=''COM''');
  query.sql.add('AND VIGENCIADESDE<=:FECHAINICIO');
  query.sql.add('AND VIGENCIAHASTA>:FECHAINICIO');
  query.ParamByName('FECHAINICIO').AsDateTime:=fechai;
  query.open;
  valorcomida:=query.fieldbyname('VALORAUXILIOALIMENTACION').AsFloat;
  qactualiza:=TQuery.create(nil);
  qactualiza.DatabaseName:='BaseDato';
  query.sql.Clear;
  query.sql.add('select codigotipoturno,codigoturno from odt');
  query.sql.add('where codigoodt=:codigoodt');
  query.parambyname('codigoodt').Asfloat:=CodigoOdt;
  query.open;
  turno:=query.fieldbyname('codigoturno').AsInteger;
  tipoturno:=query.fieldbyname('codigotipoturno').AsInteger;
  result:=0;
  costototalmano:=0;
  qvalorviatico:=TQuery.create(nil);
  qvalorviatico.DatabaseName:='BaseDato';
  qvalorviatico.sql.Add('select trunc(odt_valorviatico (:fechai ,:fechaf ,:cododt ,:codemp )) from dual');

  if (turno>0)and (tipoturno>0)then
  begin
    query.sql.clear;
    query.sql.add('SELECT  OM.CODIGOEMPLEADO,S.SUELDO FROM SUELDO S,EMPLEADO E, ODTPRESMANO OM');
    query.sql.add('WHERE OM.CODIGOODT='+floattostr(codigoodt));
    query.sql.add('AND OM.CONSECUTIVO='+inttostr(consecutivo));
    query.sql.add('AND OM.CODIGOEMPLEADO=E.CODIGOEMPLEADO');
    query.sql.add('AND E.CODIGOSUELDO=S.CODIGOSUELDO');
    query.Open;

    while not query.eof do
    begin
      valorhora:=query.fieldbyname('SUELDO').AsFloat/240;
      try
        sp:=TStoredProc.Create(nil);
        sp.DatabaseName:='BaseDato';
        sp.StoredProcName:='ODT_SUMARHORASEMPLEADO';
        sp.Close;
        sp.Params.Clear;
        sp.Params.CreateParam(ftDateTime,'fechai',ptInput);
        sp.Params.CreateParam(ftDateTime,'fechaf',ptInput);
        sp.Params.CreateParam(ftFloat,'tipoturno1',ptInput);
        sp.Params.CreateParam(ftFloat,'turno1',ptInput);
        sp.Params.CreateParam(ftFloat,'cododt',ptInput);
        sp.Params.CreateParam(ftFloat,'codemp',ptInput);
        sp.Params.CreateParam(ftcursor, 'c', ptoutput);


        sp.parambyname('fechai').AsDateTime:=fechai;
        sp.parambyname('fechaf').AsDateTime:=fechaf;
        sp.parambyname('tipoturno1').AsFloat:=tipoturno;
        sp.parambyname('turno1').AsFloat:=turno;
        sp.parambyname('cododt').AsFloat:=CodigoOdt;
        sp.parambyname('codemp').AsFloat:=query.fieldbyname('codigoempleado').AsFloat;
        sp.Prepare;
        sp.open;
        qvalorviatico.close;
        qvalorviatico.parambyname('fechai').AsDateTime:=fechai;
        qvalorviatico.parambyname('fechaf').AsDateTime:=fechaf;
        qvalorviatico.parambyname('cododt').AsFloat:=CodigoOdt;
        qvalorviatico.parambyname('codemp').AsFloat:=query.fieldbyname('codigoempleado').AsFloat;
        qvalorviatico.open;
        valordesayunoemp:=valordesayuno*sp.fieldbyname('cantidaddesayunos').AsFloat;
        valoralmuerzoemp:=valoralmuerzo*sp.fieldbyname('cantidadalmuerzos').AsFloat;
        valorcomidaemp:=valorcomida*sp.fieldbyname('cantidadcomidas').AsFloat;
        Porcentajes:=ConsultarConceptosExtrasRecargos;
        horas:=SumarCantidadesConceptosExtrasRecargos(sp);
        totalempleado:=
        horas.DiurnaOrdinaria*Porcentajes.DiurnaOrdinaria*valorhora +
        Horas.NocturnaOrdinaria*Porcentajes.NocturnaOrdinaria*valorhora +
        Horas.DiurnaDomingo*Porcentajes.DiurnaDomingo*valorhora +
        Horas.NocturnaDomingo*Porcentajes.NocturnaDomingo*valorhora +
        Horas.DiurnaFestivo*Porcentajes.DiurnaFestivo*valorhora +
        Horas.NocturnaFestivo*Porcentajes.NocturnaFestivo*valorhora +
        horas.ExtraDiurnaOrdinaria*Porcentajes.ExtraDiurnaOrdinaria*valorhora +
        Horas.ExtraNocturnaOrdinaria*Porcentajes.ExtraNocturnaOrdinaria*valorhora +
        Horas.ExtraDiurnaDomFestivo*Porcentajes.ExtraDiurnaDomFestivo*valorhora +
        Horas.ExtraNocturnaDomFestivo*Porcentajes.ExtraNocturnaDomFestivo*valorhora +
        valordesayunoemp*Porcentajes.DiurnaOrdinaria*valorhora +
        valoralmuerzoemp*Porcentajes.DiurnaOrdinaria*valorhora +
        valorcomidaemp*Porcentajes.DiurnaOrdinaria*valorhora +
        qvalorviatico.fields[0].AsFloat;
        qactualiza.sql.clear;
        qactualiza.sql.add('update odtpresmano ');
        qactualiza.sql.add('set HORASDIURNAS='+floattostr(horas.DiurnaOrdinaria*Porcentajes.DiurnaOrdinaria*valorhora )+',');
        qactualiza.sql.add('HORASNOCTURNAS='+floattostr(Horas.NocturnaOrdinaria*Porcentajes.NocturnaOrdinaria*valorhora)+',');
        qactualiza.sql.add('HORASDIURNASDOMINGO='+floattostr(Horas.DiurnaDomingo*Porcentajes.DiurnaDomingo*valorhora)+',');
        qactualiza.sql.add('HORASNOCTURNASDOMINGO='+floattostr(Horas.NocturnaDomingo*Porcentajes.NocturnaDomingo*valorhora)+',');
        qactualiza.sql.add('HORASDIURNASFESTIVO='+floattostr(Horas.DiurnaFestivo*Porcentajes.DiurnaFestivo*valorhora )+',');
        qactualiza.sql.add('HORASNOCTURNASFESTIVO='+floattostr(Horas.NocturnaFestivo*Porcentajes.NocturnaFestivo*valorhora)+',');
        qactualiza.sql.add('EXTRASDIURNAS='+floattostr(horas.ExtraDiurnaOrdinaria*Porcentajes.ExtraDiurnaOrdinaria*valorhora)+',');
        qactualiza.sql.add('EXTRASNOCTURNAS='+floattostr(Horas.ExtraNocturnaOrdinaria*Porcentajes.ExtraNocturnaOrdinaria*valorhora)+',');
        qactualiza.sql.add('EXTRASDIURNASDOMFESTIVO='+floattostr(Horas.ExtraDiurnaDomFestivo*Porcentajes.ExtraDiurnaDomFestivo*valorhora)+',');
        qactualiza.sql.add('EXTRASNOCTURNASDOMFESTIVO='+floattostr(Horas.ExtraNocturnaDomFestivo*Porcentajes.ExtraNocturnaDomFestivo*valorhora)+',');
        qactualiza.sql.add('DESAYUNO='+floattostr(valordesayunoemp)+',');
        qactualiza.sql.add('ALMUERZO='+floattostr(valoralmuerzoemp)+',');
        qactualiza.sql.add('COMIDA='+floattostr(valorcomidaemp)+',');
        qactualiza.sql.add('VIATICOS='+floattostr(qvalorviatico.fields[0].AsFloat)+',');
        qactualiza.sql.add('COSTOREAL='+floattostr(totalempleado));
        qactualiza.sql.add('where codigoodt='+floattostr(CodigoOdt));
        qactualiza.sql.add('and consecutivo='+floattostr(consecutivo));
        qactualiza.sql.add('and codigoempleado='+query.fieldbyname('codigoempleado').AsString);
        qactualiza.ExecSQL;
        CostoTotalMano:=totalempleado+CostoTotalMano;

      except
        on e:exception do
        begin
          showmessage(e.message);
        end;
      end;
      query.next;
      sp.free;
    end;
    qActualiza.sql.clear;
    qActualiza.sql.add('UPDATE ODTDIA SET COSTOMANOOBRA='+floattostr(CostoTotalMano));
    qActualiza.sql.add('WHERE CODIGOODT='+floattostr(codigoodt));
    qActualiza.sql.add('AND CONSECUTIVO='+intToStr(consecutivo));
    qActualiza.execsql;

  end;
  query.free;
end;

function ConsultarConceptosExtrasRecargos:PorcentajeHorasConcepto;
var Query:TQuery;
    i:Integer;
begin
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';

  Query.SQL.Clear;
  Query.SQL.Add('SELECT VALOR/100 PORCENTAJE FROM ODTCONCEPTO');
  Query.SQL.Add('WHERE DESCRIPCION LIKE ''%REC%'' AND DESCRIPCION LIKE ''%DI%'' AND DESCRIPCION LIKE ''%ORD%''');
  Query.open;
  if query.fieldbyname('PORCENTAJE').AsFloat>0 then
   result.DiurnaOrdinaria:=1+ query.fieldbyname('PORCENTAJE').AsFloat
  else
   result.DiurnaOrdinaria:=1;

  Query.SQL.Clear;
  Query.SQL.Add('SELECT VALOR/100 PORCENTAJE FROM ODTCONCEPTO');
  Query.SQL.Add('WHERE DESCRIPCION LIKE ''%REC%'' AND DESCRIPCION LIKE ''%NOC%'' AND DESCRIPCION LIKE ''%ORD%''');
  Query.open;
  if query.fieldbyname('PORCENTAJE').AsFloat>0 then
    result.NocturnaOrdinaria:=1+ query.fieldbyname('PORCENTAJE').AsFloat
  else
    result.NocturnaOrdinaria:=1;

  Query.SQL.Clear;
  Query.SQL.Add('SELECT VALOR/100 PORCENTAJE FROM ODTCONCEPTO');
  Query.SQL.Add('WHERE DESCRIPCION LIKE ''%REC%'' AND DESCRIPCION LIKE ''%DI%'' AND DESCRIPCION LIKE ''%DOM%''');
  Query.open;
  if query.fieldbyname('PORCENTAJE').AsFloat>0 then
    result.DiurnaDomingo:=1+ query.fieldbyname('PORCENTAJE').AsFloat
  else
    result.DiurnaDomingo:=1;
    
  Query.SQL.Clear;
  Query.SQL.Add('SELECT VALOR/100 PORCENTAJE FROM ODTCONCEPTO');
  Query.SQL.Add('WHERE DESCRIPCION LIKE ''%REC%'' AND DESCRIPCION LIKE ''%NOC%'' AND DESCRIPCION LIKE ''%DOM%''');
  Query.open;
  if query.fieldbyname('PORCENTAJE').AsFloat>0 then
    result.NocturnaDomingo:=1+ query.fieldbyname('PORCENTAJE').AsFloat
  else
    result.NocturnaDomingo:=1;

  Query.SQL.Clear;
  Query.SQL.Add('SELECT VALOR/100 PORCENTAJE FROM ODTCONCEPTO');
  Query.SQL.Add('WHERE DESCRIPCION LIKE ''%REC%'' AND DESCRIPCION LIKE ''%DI%'' AND DESCRIPCION LIKE ''%FES%''');
  Query.open;
  if query.fieldbyname('PORCENTAJE').AsFloat>0 then
    result.DiurnaFestivo := 1+ query.fieldbyname('PORCENTAJE').AsFloat
  else
    result.DiurnaFestivo := 1;

  Query.SQL.Clear;
  Query.SQL.Add('SELECT VALOR/100 PORCENTAJE FROM ODTCONCEPTO');
  Query.SQL.Add('WHERE DESCRIPCION LIKE ''%REC%'' AND DESCRIPCION LIKE ''%NOC%'' AND DESCRIPCION LIKE ''%FES%''');
  Query.open;
  if query.fieldbyname('PORCENTAJE').AsFloat>0 then
    result.NocturnaFestivo:= 1 + query.fieldbyname('PORCENTAJE').AsFloat
  else
    result.NocturnaFestivo:= 1;

  Query.SQL.Clear;
  Query.SQL.Add('SELECT VALOR/100 PORCENTAJE FROM ODTCONCEPTO');
  Query.SQL.Add('WHERE DESCRIPCION LIKE ''%EXT%'' AND DESCRIPCION LIKE ''%DI%'' AND DESCRIPCION LIKE ''%ORD%''');
  Query.open;
  if query.fieldbyname('PORCENTAJE').AsFloat>0 then
    result.ExtraDiurnaOrdinaria:= 1+ query.fieldbyname('PORCENTAJE').AsFloat
  else
    result.ExtraDiurnaOrdinaria:= 1;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT VALOR/100 PORCENTAJE FROM ODTCONCEPTO');
  Query.SQL.Add('WHERE DESCRIPCION LIKE ''%EXT%'' AND DESCRIPCION LIKE ''%NOC%'' AND DESCRIPCION LIKE ''%ORD%''');
  Query.open;
  if query.fieldbyname('PORCENTAJE').AsFloat>0 then
    result.ExtraNocturnaOrdinaria:= 1 + query.fieldbyname('PORCENTAJE').AsFloat
  else
    result.ExtraNocturnaOrdinaria:= 1; 

  Query.SQL.Clear;
  Query.SQL.Add('SELECT VALOR/100 PORCENTAJE FROM ODTCONCEPTO');
  Query.SQL.Add('WHERE DESCRIPCION LIKE ''%EXT%'' AND DESCRIPCION LIKE ''%DI%'' AND DESCRIPCION LIKE ''%DOM%''');
  Query.open;
  if query.fieldbyname('PORCENTAJE').AsFloat>0 then
    result.ExtraDiurnaDomFestivo:=1 + query.fieldbyname('PORCENTAJE').AsFloat
  else
    result.ExtraDiurnaDomFestivo:=1;

  Query.SQL.Clear;
  Query.SQL.Add('SELECT VALOR/100 PORCENTAJE FROM ODTCONCEPTO');
  Query.SQL.Add('WHERE DESCRIPCION LIKE ''%EXT%'' AND DESCRIPCION LIKE ''%NOC%'' AND DESCRIPCION LIKE ''%DOM%''');
  Query.open;
  if query.fieldbyname('PORCENTAJE').AsFloat>0 then
    result.ExtraNocturnaDomFestivo:= 1 + query.fieldbyname('PORCENTAJE').AsFloat
  else
    result.ExtraNocturnaDomFestivo:= 1;

  Query.Free;
end;

function ValidarAreaActiva(CIA:double):boolean;
var query:tquery;
begin
  query:=TQuery.Create(nil);
  query.DatabaseName:='BaseDato';
  query.sql.add('SELECT count(*)FROM ADMINISTRATIVO');
  query.sql.add('WHERE CODIGOADMINISTRATIVO='+FloatToStr(cia));
  query.sql.add('AND ESTADO=''A''');
  query.open;
  if (query.Fields[0].AsInteger>0)then
    result:=true
  else
    result:=false;
end;
procedure SeleccionarPlanillaExtras(out codemp:double;out fecha:tdatetime);
begin
  codemp:=0;
  fecha:=0;
  fSeleccionarPlanillaExtras:=tfSeleccionarPlanillaExtras.Create(Application);
  try
    if fSeleccionarPlanillaExtras.ShowModal=MrOK then
    begin
      codemp:=fSeleccionarPlanillaExtras.qPlanilla.fieldbyname('CODIGOEMPLEADO').AsFloat;
      fecha:=fSeleccionarPlanillaExtras.qPlanilla.fieldbyname('FECHA').AsDateTime;      
    end;
  finally
    fSeleccionarPlanillaExtras.Free;
    fSeleccionarPlanillaExtras:=nil;
  end;
end;

procedure AgregarFormatosMantenimientoOdt(codigoodt:double;consecutivo:integer);
var qOdtFormato,qOdtSeccion,qInsertar:tquery;
      CodFormatoDatos:double;
begin
  qOdtFormato:=TQuery.Create(nil);
  qOdtFormato.DatabaseName:='BaseDato';
  qOdtSeccion:=TQuery.Create(nil);
  qOdtSeccion.DatabaseName:='BaseDato';

  qOdtFormato.sql.add('SELECT distinct fm.codigoformatomtto,fm.nombreformatomtto,pmo.codigomantenimiento');
  qOdtFormato.sql.add('FROM hve_seccionformato sf,');
  qOdtFormato.sql.add('hve_formatomtto fm,');
  qOdtFormato.sql.add('subactividadprueba sp,');
  qOdtFormato.sql.add('pm_pruebasprogramadas pp,');
  qOdtFormato.sql.add('pm_mantenimientoodt pmo');
  qOdtFormato.sql.add('WHERE fm.codigoformatomtto = sf.codigoformatomtto');
  qOdtFormato.sql.add('AND sp.codigosubactividadprueba = pp.codigosubactividadprueba');
  qOdtFormato.sql.add('AND sp.codigoseccionformato = sf.codigoseccionformato');
  qOdtFormato.sql.add('AND pp.codigomantenimiento = pmo.codigomantenimiento');
  qOdtFormato.sql.add('AND pmo.codigoodt='+floattostr(codigoodt));
  qOdtFormato.sql.add('AND pmo.consecutivo='+inttostr(consecutivo));
  qOdtFormato.open;
  qOdtSeccion.sql.add('SELECT DISTINCT fm.codigoformatomtto, fm.nombreformatomtto,');
  qOdtSeccion.sql.add('                sf.codigoseccionformato, sf.nombreseccionformato,');
  qOdtSeccion.sql.add('                sp.codigosubactividadareaodt');
  qOdtSeccion.sql.add('  FROM hve_seccionformato sf,');
  qOdtSeccion.sql.add('        hve_formatomtto fm,');
  qOdtSeccion.sql.add('        subactividadprueba sp,');
  qOdtSeccion.sql.add('        pm_pruebasprogramadas pp,');
  qOdtSeccion.sql.add('        pm_mantenimientoodt pmo');
  qOdtSeccion.sql.add('  WHERE fm.codigoformatomtto = sf.codigoformatomtto');
  qOdtSeccion.sql.add('    AND sp.codigosubactividadprueba = pp.codigosubactividadprueba');
  qOdtSeccion.sql.add('    AND sp.codigoseccionformato = sf.codigoseccionformato');
  qOdtSeccion.sql.add('    AND pp.codigomantenimiento = pmo.codigomantenimiento');
  qOdtSeccion.sql.add('    AND pmo.codigoodt=:codigoodt');
  qOdtSeccion.sql.add('    AND pmo.consecutivo=:consecutivo');
  qOdtSeccion.sql.add('    AND sf.codigoformatomtto=:codigoformatomtto ');


  qInsertar:=TQuery.create(nil);
  qInsertar.DatabaseName:='BaseDato';
  while not(qOdtFormato.eof) do
  begin
    qInsertar.sql.clear;
    qInsertar.sql.add('Insert into HVE_FORMATOMTTODATOS');
    qInsertar.sql.add('   (CODIGOFORMATOMTTODATOS, CODIGOFORMATOMTTO, CODIGOUSUARIOCREACION, FECHACREACION,');
    qInsertar.sql.add('    CODIGOODT, CONSECUTIVOODT, CODIGOMANTENIMIENTO)');
    qInsertar.sql.add(' Values');
    qInsertar.sql.add('   (:CODIGOFORMATOMTTODATOS, :CODIGOFORMATOMTTO, :CODIGOUSUARIOCREACION, SYSDATE,');
    qInsertar.sql.add('    :CODIGOODT, :CONSECUTIVOODT,:CODIGOMANTENIMIENTO)');
    CodFormatoDatos:=GetSiguienteValorSecuencia('SQ_HVEFORMATO');
    qInsertar.ParamByName('CODIGOFORMATOMTTODATOS').AsFloat:=CodFormatoDatos;
    qInsertar.ParamByName('CODIGOFORMATOMTTO').AsFloat:=qOdtFormato.fieldbyname('CODIGOFORMATOMTTO').AsFloat;
    qInsertar.ParamByName('CODIGOUSUARIOCREACION').AsFloat:=varCodigoUsuario;
    qInsertar.ParamByName('CODIGOODT').AsFloat:=codigoodt;
    qInsertar.ParamByName('CONSECUTIVOODT').asinteger:=consecutivo;
    qInsertar.ParamByName('CODIGOMANTENIMIENTO').asfloat:=qOdtFormato.fieldbyname('CODIGOMANTENIMIENTO').asfloat;
    qInsertar.ExecSQL;
    qOdtSeccion.close;
    qOdtSeccion.ParamByName('CODIGOODT').AsFloat:=codigoodt;
    qOdtSeccion.ParamByName('CONSECUTIVO').asinteger:=consecutivo;
    qOdtSeccion.ParamByName('CODIGOFORMATOMTTO').AsFloat:=qOdtFormato.fieldbyname('CODIGOFORMATOMTTO').AsFloat;
    qOdtSeccion.open;
    while not(qOdtSeccion.eof) do
    begin
      qInsertar.sql.clear;
      qInsertar.sql.add('Insert into HVE_SECCIONFORMATODATOS');
      qInsertar.sql.add('   (CODIGOSECCIONFORMATODATOS, CODIGOFORMATOMTTODATOS, CODIGOSECCIONFORMATO, CODIGOODT, ');
      qInsertar.sql.add('    FECHAREGISTRO, CODIGOUSUARIOCREACION,SUBACTIVIDADODT)');
      qInsertar.sql.add(' Values');
      qInsertar.sql.add('   (:CODIGOSECCIONFORMATODATOS, :CODIGOFORMATOMTTODATOS, :CODIGOSECCIONFORMATO, :CODIGOODT, ');
      qInsertar.sql.add('    SYSDATE, :CODIGOUSUARIOCREACION,:SUBACTIVIDADODT)');
      qInsertar.ParamByName('CODIGOSECCIONFORMATODATOS').AsFloat:= GetSiguienteValorSecuencia('SQ_HVESECCION');
      qInsertar.ParamByName('CODIGOFORMATOMTTODATOS').AsFloat:= CodFormatoDatos;
      qInsertar.ParamByName('CODIGOSECCIONFORMATO').AsFloat:=qOdtSeccion.fieldbyname('CODIGOSECCIONFORMATO').AsFloat;
      qInsertar.ParamByName('CODIGOODT').AsFloat:=Codigoodt;
      qInsertar.ParamByName('CODIGOUSUARIOCREACION').AsFloat:=VarCodigoUsuario;
      qInsertar.ParamByName('SUBACTIVIDADODT').AsFloat:=qOdtSeccion.fieldbyname('codigosubactividadareaodt').AsFloat;
      qInsertar.ExecSQL;
      qOdtSeccion.Next;
    end;
    qOdtFormato.Next;
  end;
end;

procedure TODTHija.InsertarInfraestructura(pintado,codigoclientesgd,codigoapoyo, codigoclientecom:string);
var qodtclientesgd,qodtapoyo: TQuery;
    sql:string;
begin
  qodtapoyo := TQuery.Create(nil);
  qodtapoyo.DatabaseName := 'BaseDato';

  if (pintado<>'')and(codigoapoyo<>'') then
  begin
    qOdtApoyo.sql.Clear;
    sql:='INSERT INTO ODTAPOYO(CODIGOODT,CONSECUTIVO,PINTADOAPOYO)'+
         'VALUES('+floattostr(CODIGOODT)+','+inttostr(CONSECUTIVO)+','+pintado+')';

    qodtapoyo.sql.Text:=sql;
    qodtapoyo.ExecSQL;
  end;

  qodtapoyo.close;
  qodtapoyo.free;

  qodtclientesgd := TQuery.Create(nil);
  qodtclientesgd.DatabaseName := 'BaseDato';

  if (codigoclientesgd<>'')and(codigoclientecom<>'') then
  begin
    qOdtApoyo.sql.Clear;
    sql:='INSERT INTO ODTCLIENTESGD (CODIGOODT,CONSECUTIVO,CODIGOCLIENTESGD,CODIGOCUENTA)'+
         'VALUES('+floattostr(CODIGOODT)+','+inttostr(CONSECUTIVO)+','+codigoclientesgd+','+ codigoclientecom +')';

    qodtapoyo.sql.Text:=sql;
    qodtapoyo.ExecSQL;
  end;
  qodtapoyo.close;
  qodtapoyo.free;
end;

function BorrarAsignacionEMG(pCodigoODT, pConsecutivo, Tipo: string; bBorrarEnSFTP : Boolean = True): Boolean;
var
  query: TQuery;
  sl,ListaTablas: TStringList;
  asignacion: Double;
  i: Integer;
  sql, RutaFullArchivoSFTP, NombreODT, sCIA, sGT: string;
begin
  asignacion:=0;
  sCIA:='';
  sGT:='';
  query:=TQuery.Create(nil);
  query.DatabaseName:='BaseDato';
  query.Close;
  query.SQL.Clear;
  sql:= 'SELECT CODIGOASIGNACIONEMG FROM EMG_ODTASIGNACION '+
        'WHERE CODIGOODT = '+pCodigoODT+
        ' AND CONSECUTIVO ='+pConsecutivo+
        ' AND CODIGOESTADOASIGNACION = 10 ';
  query.SQL.Text:= sql;
  query.Open;
  if not query.IsEmpty then
  begin
    Query.Close;
    Query.Free;
    Application.MessageBox('La Asignación se encuentra en estado TERMINADA y ya ha sido importada a la Base de Datos de Infraestructura.'+
                            chr(13)+chr(13)+' No se puede Borrar.', 'Advertencia', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  query.Close;
  query.SQL.Clear;
  query.sql.add('SELECT CODIGOASIGNACIONEMG, CODIGOADMINISTRATIVO, CODIGOGRUPOTRABAJO FROM EMG_ODTASIGNACION');
  query.sql.add('WHERE CODIGOODT='+pCodigoODT);
  query.sql.add('AND CONSECUTIVO='+pConsecutivo);
  query.sql.add('AND TIPODATOORIGEN='''+Tipo+'''');
  query.Open;
  if not query.IsEmpty then
  begin
    asignacion:= query.FieldByName('CODIGOASIGNACIONEMG').AsFloat;
    sCIA:= query.FieldByName('CODIGOADMINISTRATIVO').AsString;
    sGT:= query.FieldByName('CODIGOGRUPOTRABAJO').AsString;
  end;

  if tipo='E' then
  begin
    query.Close;
    query.SQL.Clear;
    sql:= 'SELECT CODIGOASIGNACIONEMG FROM EMG_ODTASIGNACION '+
          'WHERE CODIGOODT = '+pCodigoODT+
          ' AND CONSECUTIVO ='+pConsecutivo+
          ' AND TIPODATOORIGEN=''I'' ';
    query.SQL.Text:= sql;
    query.open;
    if not query.IsEmpty then
    begin
      Query.Close;
      Query.Free;
      Application.MessageBox('La ODT tiene una asignación importada.'+
                              chr(13)+chr(13)+' No se puede Borrar.', 'Advertencia', MB_OK + MB_ICONWARNING);
      Exit;
    end;
    Query.Close;

    if (asignacion <> 0) and bBorrarEnSFTP then
    begin
      Application.NormalizeTopMosts;
      if ConectarA_SFTP(Host_SFTP, Port_SFTP, UserID_SFTP, Password_SFTP) then
      begin
        NombreODT := 'ODT'+pCodigoODT+'_'+CompletarCadenaIzquierda(pConsecutivo,'0',2);;
        RutaFullArchivoSFTP:= DirRaiz_SFTP+sCIA+'\'+sGT+'\'+CarpetaImportadas+'\'+NombreODT+'.zip';
        if ExisteArchivo_SFTP(RutaFullArchivoSFTP) then
        begin
          Query.Free;
          Application.MessageBox(PChar('No se puede borrar la asignación móvil por que está importada en el servidor FTP: '+Host_SFTP),PChar('Energis'),MB_ICONINFORMATION+MB_OK);
          Exit;
        end
        else
        begin
          RutaFullArchivoSFTP:= DirRaiz_SFTP+sCIA+'\'+sGT+'\'+CarpetaExportadas+'\'+NombreODT+'.zip';
          BorrarArchivo_SFTP(RutaFullArchivoSFTP, False);
        end;
      end
      else
        Application.MessageBox(PChar('No se pudo conectar al servidor FTP: '+Host_SFTP+chr(13)+chr(13)+'Asignación no eliminada del Servidor Ftp.'),PChar('Energis'),MB_ICONERROR+MB_OK);
      Application.RestoreTopMosts;
    end;
  end;

  if tipo='I' then
  begin
    query.Close;
    query.sql.clear;
    query.sql.add('UPDATE EMG_ODTASIGNACION SET CODIGOESTADOASIGNACION = 1');
    query.sql.add('WHERE CODIGOODT = '+pCodigoODT);
    query.sql.add('AND CONSECUTIVO ='+pConsecutivo);
    query.sql.add('AND TIPODATOORIGEN=''E'' ');
    query.ExecSQL;
    query.Close;
  end;

  query.Close;
  query.sql.clear;
  query.sql.add('UPDATE APOYO A SET ENREVISIONMOVIL=0');
  query.sql.add('WHERE EXISTS');
  query.sql.add('(SELECT NULL FROM EMG_APOYO E');
  query.sql.add('WHERE CODIGOASIGNACIONEMG='+FloatToStr(asignacion));
  query.sql.add('AND A.CODIGOAPOYO=E.CODIGOAPOYO)');
  query.ExecSQL;
  query.Close;

  sl:=TStringList.Create;
  sl.add('WHERE CODIGOASIGNACIONEMG='+ FloatToStr(asignacion));

  listatablas:=TStringList.Create;
  ListaTablas.Add('EMG_ODTASIGNACION');
  ListaTablas.Add('EMG_APOYO');
  ListaTablas.Add('EMG_NODOMT');
  ListaTablas.Add('EMG_NODOBT');
  ListaTablas.Add('EMG_INTERRUPTORDIS');
  ListaTablas.Add('EMG_PARARRAYODIS');
  ListaTablas.Add('EMG_CONDENSADOR');
  ListaTablas.Add('EMG_FOTOAPOYO');
  ListaTablas.Add('EMG_DIRECCIONAPOYO');
  ListaTablas.Add('EMG_DETALLEAPOYO');
  ListaTablas.Add('EMG_TEMPLETEPOSTE');
  ListaTablas.Add('EMG_INCIDENTALAPOYO');
  ListaTablas.Add('EMG_EXCAVACION');
  ListaTablas.Add('EMG_DUCTOEXCAVACION');
  ListaTablas.Add('EMG_TRAFODIS');
  ListaTablas.Add('EMG_TRAFODISOBSERVACION');
  ListaTablas.Add('EMG_TRAMOMT');
  ListaTablas.Add('EMG_TRAMOBT');
  ListaTablas.Add('EMG_STOCKGRUPOTRABAJO');
  ListaTablas.Add('EMG_ODTPRESMATE');
  ListaTablas.Add('EMG_ALUMBRADOPUBLICO');
  ListaTablas.Add('EMG_CLIENTESGD');
  ListaTablas.Add('EMG_FOTOCLIENTE');
  ListaTablas.Add('EMG_CLIENTEOBSERVACION');
  ListaTablas.Add('EMG_DIRECCIONCLIENTESGD');
  ListaTablas.Add('EMG_MATERIALENCAMPO');
  ListaTablas.Add('EMG_ELEMENTOSELIMINADOS');
  ListaTablas.Add('EMG_ALM_SERIALMATERIAL');

  for i:= ListaTablas.count -1 downto 0 do
  begin
    query.Close;
    query.sql.clear;
    query.sql.add('DELETE FROM '+ListaTablas[i]);
    query.sql.Add(sl.Text);
    query.ExecSQL;
  end;

  ListaTablas.Clear;
  ListaTablas.Free;
  sl.Clear;
  sl.Free;
  Query.Close;
  Query.Free;
end;

procedure TODTHija.AsignarApoyosProximidad(x, y, distancia: string);
var
  Query,qOdtApoyo: TQuery;
  sql:string;
begin
  qOdtApoyo := TQuery.Create(nil);
  qOdtApoyo.DatabaseName := 'BaseDato';
  Query := TQuery.Create(nil);
  Query.DatabaseName := 'BaseDato';
  if (x<>'')and (y <>'') and (distancia <>'') then
  begin
    sql:='select codigoapoyo,pintadoapoyo, distacia ||''mts'' from ( '+
         ' select round(sqrt(power(('+x+'-  a.x),2)+power((a.y- '+y+'),2)),3) as distacia, a.codigoapoyo, a.pintadoapoyo from apoyo   a '+
         ' WHERE NOT EXISTS (SELECT PINTADOAPOYO FROM ODTAPOYO OA WHERE A.PINTADOAPOYO = OA.PINTADOAPOYO) '+
         ' order by 1  asc)  '+
         ' where distacia <'+distancia ;
    qOdtApoyo.sql.text:=sql;
    qOdtApoyo.open;
    qOdtApoyo.First;
    while not qOdtApoyo.Eof do
    begin
      if qOdtApoyo.FieldByName('PINTADOAPOYO').AsString <> '' then
      begin
        Query.Close;
        Query.sql.Clear;
        sql:='INSERT INTO ODTAPOYO(CODIGOODT,CONSECUTIVO,PINTADOAPOYO)'+
             'VALUES('+FloatToStr(CODIGOODT)+','+IntToStr(CONSECUTIVO)+','+qOdtApoyo.FieldByName('PINTADOAPOYO').AsString+')';
        Query.sql.Text:=sql;
        Query.ExecSQL;
      end;
      qOdtApoyo.Next;
    end;
  end;
  Query.free;
  qOdtApoyo.Close;
  qOdtApoyo.Free;
end;


procedure TODTHija.InsertarManoObraDelGT(pGT: string);

  function FormatoFecha(aFecha:TDateTime):string;
  begin
    Result:=FormatDateTime('mm/dd/yyyy',aFecha);
  end;

var
  qDatos: TQuery;
  FechaEmision : TDateTime;
begin
  qDatos := TQuery.Create(nil);
  qDatos.DataBaseName := 'BaseDato';
  qDatos.SQL.Clear;
  qDatos.SQL.Text := 'SELECT FECHAEMISION FROM ODT WHERE CODIGOODT = ' + FloatToStr(CodigoODT);
  qDatos.Open;
  FechaEmision := qDatos.FieldByName('FECHAEMISION').AsDateTime;
  qDatos.Close;
  qDatos.SQL.Clear;
  qDatos.SQL.Add('DELETE FROM ODTPRESMANO WHERE CODIGOODT = ' + FloatToStr(CodigoODT));
  qDatos.SQL.Add('AND CONSECUTIVO = ' + IntToStr(Consecutivo));
  qDatos.ExecSQL;
  qDatos.Close;
  qDatos.SQL.Clear;
  qDatos.SQL.Add('INSERT INTO ODTPRESMANO(CODIGOODT,CONSECUTIVO,FECHADIAODT,CODIGOEMPLEADO)');
  qDatos.SQL.Add('SELECT '+FloatToStr(CodigoODT)+','+IntToStr(Consecutivo)+',');
  qDatos.SQL.Add('TO_DATE('''+ FormatoFecha(FechaEmision) + ''',''MM/DD/YYYY''),');
  qDatos.SQL.Add('E.CODIGOEMPLEADO FROM EMPLEADO E ');
  qDatos.SQL.Add('WHERE E.CODIGOGRUPOTRABAJO = '+pGT);
  qDatos.SQL.Add('AND E.CODIGOADMINISTRATIVO = '+FloatToStr(CodigoAdministrativo));
  qDatos.ExecSQL;
  qdatos.Close;
  qDatos.Free;
end;

procedure TODTHija.AsignarObjetoDelTrabajo;
var
  Query: TQuery;
  sCodTipoTrabajo, sCodTipoActivo, sCodTipoIntervencion: String;
begin
  sCodTipoTrabajo:= '';
  sCodTipoActivo:= '';
  sCodTipoIntervencion:= '';
  Query := TQuery.Create(nil);
  Query.DatabaseName := 'BaseDato';
  with Query do
  begin
    try
      SQL.Clear;
      SQL.Add('SELECT CODIGOTIPOTRABAJOODT, CODIGOTIPOACTIVO, CODIGOTIPOINTERVENCION');
      SQL.Add('FROM OBJETOTRABAJOODT');
      SQL.Add('WHERE CODIGOOBJETOTRABAJOODT = 1');
      Open;
      if not isEmpty then
      begin
        sCodTipoTrabajo:= FieldByName('CODIGOTIPOTRABAJOODT').AsString;
        sCodTipoActivo:= FieldByName('CODIGOTIPOACTIVO').AsString;
        sCodTipoIntervencion:= FieldByName('CODIGOTIPOINTERVENCION').AsString;
        Close;
        if (sCodTipoTrabajo <> '') or (sCodTipoActivo <> '') or (sCodTipoIntervencion <> '') then
        begin
          SQL.Clear;
          SQL.Add('UPDATE ODTDIA');
          SQL.Add('SET ');

          if (sCodTipoTrabajo <> '') then
            SQL.Add('CODIGOTIPOTRABAJOODT = '+sCodTipoTrabajo);

          if (sCodTipoTrabajo <> '') and (sCodTipoActivo <> '') then
            SQL.Add(', CODIGOTIPOACTIVO = '+sCodTipoActivo);

          if (sCodTipoTrabajo = '') and (sCodTipoActivo <> '') then
            SQL.Add('CODIGOTIPOACTIVO = '+sCodTipoActivo);

          if ((sCodTipoTrabajo <> '') or (sCodTipoActivo <> '')) and (sCodTipoIntervencion <> '') then
            SQL.Add(', CODIGOTIPOINTERVENCION = '+sCodTipoIntervencion);

          if (sCodTipoTrabajo = '') and (sCodTipoActivo = '') and (sCodTipoIntervencion <> '') then
            SQL.Add('CODIGOTIPOINTERVENCION = '+sCodTipoIntervencion);

          SQL.Add('WHERE');
          SQL.Add('CODIGOODT = ' + FloatToStr(CodigoODT) + ' AND');
          SQL.Add('CONSECUTIVO = ' + IntToStr(Consecutivo));
          ExecSQL;
        end;
      end;
    except
      on E: Exception do
      begin
        Application.MessageBox(PChar('No se pudo asignar el Tipo de Trabajo, Tipo de Activo ó Tipo de Labor a la ODT Hija porque ocurrió un error: '+chr(13)+chr(13)+e.Message),PChar('EnerGis'),MB_ICONWARNING+MB_OK);
      end;
    end;
  end;
  Query.Close;
  Query.Free;
end;

function DescripcionDireccion(ds:TDataSet; Control:TControl) : String;
var p:TPoint;
begin
  fDescripcionDireccion := TfDescripcionDireccion.Create(Application);
  fDescripcionDireccion.CargarDataSet(ds);
  if Control<>nil then
  begin
    p := Control.ClientToScreen(Point(0,0));
    fDescripcionDireccion.left:= p.x;
    fDescripcionDireccion.top := p.y;
    if fDescripcionDireccion.BoundsRect.Right>Screen.Width
    then fDescripcionDireccion.left:= p.x-fDescripcionDireccion.BoundsRect.Right+Screen.Width;
  end;
  fDescripcionDireccion.Showmodal;
  result:=fDescripcionDireccion.dsExterno.DataSet.FieldByName('DescripcionTipoPredio').AsString;
  fDescripcionDireccion.free;
end;


end.
