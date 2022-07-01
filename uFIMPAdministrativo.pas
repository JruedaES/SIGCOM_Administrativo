unit uFIMPAdministrativo;

interface

uses Windows, SysUtils, Classes, Dialogs, Plugins, Consdll, Controls,DBTables;
  
Type
//***********************         Filtros         ***********************
 TRotarImagen = function(ImagenEntrada, ImagenSalida: String; Angulo: Extended): Boolean;
  TGetQueryFiltroCarta = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetQueryFiltroODT = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetQueryFiltroLectura = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetQueryFiltroReparto = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetFiltroSupervisionODS = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetQueryFiltroIlegales = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetQueryFiltroStock = function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetQueryFiltroGrupoTrabajo = function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetQueryFiltroAdministrativo = function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetQueryAdministrativo = function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetQueryFiltroActividadCobro = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetQueryFiltroMedidaSeguridad = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetQueryFiltroReporte = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetQueryFiltroProgramacion = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetQueryFiltroAveria = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetFiltroReparto = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TFiltroAveria = Procedure(ListaRotulo, ListaDato, ListaFrom, ListaWhere : TStringList);
  TVerEstadisticaAverias = Function (ListaRotulo, ListaDato, ListaEstadistica: TStringList) :Boolean;
  TGetQueryFiltroContrato = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetQueryFiltroPresupuesto = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetQueryFiltroActividad = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TMostrarRuta = Procedure(qRutas: TQuery);
  TFiltroCapaTemporal   =   Function(q:Tquery; llave, render : string; tiposhape:integer;tamano:integer;color:integer; doZoom: boolean; NombreFiltro : String) : Boolean;
  TGetQueryFiltroMaterial = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TMostrarItinerario = Function(CodGrupoAol,CodRuta,CodItinerario,CodGrupoItinerario,Color: string) :Boolean;
  TGetListaCliente = Function(ListaDato : TStringList):Boolean;
  TGetListaApoyo = Function(ListaDato : TStringList):Boolean;

//***********************         Interrupciones         ***********************
  TGetInterrupcionTrafodis = Function(CodigoTrafodis:Integer;Proceso:Boolean;Var CodigoInterrupcion ,TotalClientes: Integer;DescPromedio,ConsumoPromedio: Real):Boolean;
  TGetInterrupcionInterruptordis = Function(CodigoInterruptordis:Integer;Proceso:Boolean;Var CodigoInterrupcion ,TotalClientes: Integer;DescPromedio,ConsumoPromedio: Real):Boolean;
  TCrearEventoDistribucionTipoEventoReporte = Function (TipoEvento,TipoElemento:Integer; PintadoApoyo,Llave1Elemento,Llave2Elemento:String;Fecha:String=''): String;
  TCrearEventoCierreDistribucionTipoEventoReporte = Function (CodigoEventoApertura:String;TipoEvento,TipoElemento:Integer; PintadoApoyo,Llave1Elemento,Llave2Elemento:String;
                                                             TipoElementoFalla,CodCausa,Just,PintadoApoyoFalla,Llave1ElementoFalla,Llave2ElementoFalla:String;Fecha:String=''):String;
  TEditarEventoCierreDistribucionTipoEventoReporte = Function (CodigoEvento: integer;CodCausa,Just:String):String;
  TEditarEventoAperturaDistribucionTipoEventoReporte = Function (CodigoEvento,TipoElemento: integer;PintadoApoyo,Llave1Elemento:String;Fecha:String=''):String;
  TBorrarEventoAdmin = Function (CodigoEvento:String):Boolean;

//***********************         Cartografia            ***********************
  TFiltroApoyo = Procedure(ListaRotulo, ListaDato, ListaFrom, ListaWhere : TStringList);
  TBuscarDireccion = Function(Dir1,Dir2,Dir3,Dir4:String):Boolean;
  TMarcarBarrio = Function(Zona,Ciudad,Barrio:String;Zoom:Boolean):Boolean;

  TBuscarClienteCGC = Function(CodigoContrato:String;Zoom:Boolean):Boolean;
  TImprimirListaPlancha = Procedure(Planchas:TStringList;Confirmar:Integer;Texto:string);

  TLimpiarBusqueda = Function:Boolean;
  TClienteEnInterrupcion = Function(CodigoCliente:String):Boolean;
  TBuscarCliente = Function(CodigoCliente:String;Zoom:Boolean):Boolean;
  TBuscarClientesApoyo = Function(Apoyos:Array of String;NApoyo:Integer):Boolean;
  TBuscarClientesTrafoDis = Function(Trafodis:Array of String;NTrafos,Normalida :Integer):Boolean;
  TBuscarLineasTrafo = Function (Trafodis : Array of String;NTrafodis : Integer):Boolean;
  TBuscarApoyo = Function(CodigoApoyo:String;Zoom:Boolean;SeleccionApoyoReporte:Boolean=False):Boolean;
  TBuscarBarrio = Function(CodigoCig:String;Zoom:Boolean):Boolean;

  TBuscarCIG = Function (CodigoCig:String; nivel:integer; Zoom:Boolean):Boolean;

  TActualizarReportes = Function:Boolean;
  TUbicarContrato = Function(CodigoContrato:Integer;Zoom:Boolean):Boolean;
  TMoverMovilAReporte = Function(CodMovil:String;CodigoReporte:Integer):Boolean;
  TMoverMovilADireccion = Function(CodMovil:String; Cll1,Cll2 : String; Mover : Boolean) :Boolean;
  TBuscarReporte = Function(CodigoReporte:Integer;Zoom:Boolean):Boolean;
  TBorrarReporte = Function(CodigoReporte:Integer):Boolean;
  TSetCodigoReporte = Function(CodigoReporte:Integer):Boolean;
  TResaltarTramosMT = Function (ListaTramos:TStringList):Boolean;

  TFiltroClienteSGC = Procedure(ListaRotulo, ListaDato, ListaFrom, ListaWhere : TStringList);
  TFiltroCliente = Procedure(ListaRotulo, ListaDato, ListaFrom, ListaWhere : TStringList);
  TFiltroEvento = Procedure(ListaRotulo, ListaDato, ListaFrom, ListaWhere : TStringList);

  TGetQueryFiltroClienteSGC = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetQueryFiltroCliente = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  TGetQueryFiltroEvento = Function(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;

  TDescargarArchivo = Function(DirectorioOrigen, DirectorioDestino: PWideChar;
      SobreEscribir: Boolean) : PWideChar;  stdcall;

  TMostrarVistaLateral = Function(ListaTemp : TStringList): Boolean;
  TMostrarVistaLateralOdt = Function(ListaTemp : TStringList;Odt,Consecutivo:double): Boolean;
  TMostrarFILTROODTAP= Function(sql:String): Boolean;
  TVistaLateralTrafo1 = Function(Codigo:string):TObject;
  TMostrarMaestroRespuestas = Function:TObject;
  TMostrarMaestroCategorias = Function:TObject;

  TVerPlancha = Function:Boolean;
  TUbicarReporte = Procedure;
  TCrearReporte = Function(CodigoReporte:Integer;X,Y:Double):Boolean;
  TBuscarCoordenada = Procedure(X,Y:Double);
  TMostrarMapa  = Function:Boolean;
  TMarcarApoyos  = Procedure(Lista:TStringList);
  TEMovilExportarCartografiaApoyos = function(ListaApoyos:TStringList; Ruta:string):boolean;
  TSetElementoOdt = procedure(tipo:string);
  TValidarMovil = function(cododt,consecutivo: double) : Boolean;
  TSeleccionarRamalCircuito = procedure(tipo:string);
  TBuscarGeocodigo = Function(Lista:TStringList;var X,Y:Double;var Cig:Integer;Marcar:Boolean=True):string;
//  TBorrarReporte = Function(CodigoReporte:Integer):Boolean;
  TEnviarCorreo=Procedure(Host, User, Password, from, asunto, body,Receptor, Copia, Anexos: Pchar); // External 'EmailLib';
  TExportar=function(ruta,Servidor,Usuario,ClaveUsuario,esquema,ODT,CONSECUTIVO:AnsiString;bVerMensaje:Boolean=True): Boolean; // External 'IESDF';
  TImportar=Procedure(ruta,Servidor,Usuario,ClaveUsuario,esquema,ODT,CONSECUTIVO,asignacion:AnsiString); // External 'IESDF';
  TFiltroReporte = Procedure(ListaRotulo, ListaDato, ListaFrom, ListaWhere : TStringList);
  TSeleccionarApoyoLista = Function :boolean;
  TSeleccionarTrafoDisLista = Function :boolean;
  TSeleccionarDuctoExcavacionLista = Function :boolean;
  TSeleccionarExcavacionLista = Function :boolean;
  TSeleccionarLamparaAPLista = Function :boolean;
  TSeleccionarTramoMTLista = Function :boolean;
  TSeleccionarTramoBTLista = Function :boolean;
  TSeleccionarPararrayoLista = Function :boolean;
  TSeleccionarCondensadorLista = Function :boolean;
  TSeleccionarNodoMTLista = Function :boolean;
  TSeleccionarNodoBTLista = Function :boolean;
  TSeleccionarDetalleApoyoLista = Function :boolean;
  TSeleccionarInterruptorDisLista = Function :boolean;
  TLecturasItinerario = Function (RutaArchivo:PWideChar; var Itinerario,FechaLectura, MensajeError,Bandera : PWideChar): PWideChar; stdcall;
  TItinerarioEnFTP = Function (RutaArchivo:PWideChar): PWideChar; stdcall;
  TItinerarioArchivosFTP = Function (RutaArchivo,Extension:PWideChar): PWideChar; stdcall;
  TFotosArchivosFTP = Function (FileNameLocal,FileNameFtp:PWideChar): PWideChar; stdcall;
  //TSeleccionarCondensadorLista = Function :boolean;

  //****************** CLIENTE SFTP ******************************************//
  TConectarA_SFTP = function(Servidor, Puerto, Usuario, Contrasena: String; MostrarMensajes: Boolean = True; MostrarProgreso: Boolean = True): Boolean;
  TBajarArchivo_SFTP = function(RutaCompletaArchivoRemoto, CarpetaDestino: String; Sobrescribir: Boolean = False; MostrarMensajes: Boolean = True; MostrarProgreso: Boolean = True): Boolean;
  TSubirArchivo_SFTP = function(RutaCompletaArchivoLocal, CarpetaDestino: String; Sobrescribir: Boolean = False; MostrarMensajes: Boolean = True; MostrarProgreso: Boolean = True): Boolean;
  TCrearDirectorio_SFTP = function (NombreDirectorio: String): Boolean;
  TBorrarDirectorio_SFTP = function (NombreDirectorio: String): Boolean;
  TDesconectar_SFTP = procedure;
  TExisteArchivo_SFTP = function (RutaCompletaArchivoRemoto: String): Boolean;
  TBorrarArchivo_SFTP = function (RutaCompletaArchivoRemoto: String; MostrarMensajes: Boolean = True): Boolean;
  //******************** FIN CLIENTE SFTP ************************************//

  TGetQueryFiltroODTHija = Function(ListaRotulo, ListaDato, ListaFrom : TStringList; CIA: string): TStringList;
  TGetDatosCuenta390 = function (pCodigoCuenta : string; sResultado: PChar; var BufLen: Word) : Boolean;
  TMostrarGrupoItinerario = Function(sCodigoGrupoAOL, sCodRuta, sCodGrupoIti: string) :Boolean;
  TMostrarGrupoItinerarioReparto = Function(sFechaReparto,CodigoSedeOperativa: string) :Boolean;
  TVerCalendarioLecturas = function(pUsuario,pContrasena,pServidor,pEsquema:string): Boolean;
  TGenerarQR = Function(Texto:string;Margen : integer = 4; TamanoPixel : integer = 3;NivelError : Integer = 0):HBitmap;
  TImprimirMapaItinerario = function(NombreCapa: string): Boolean;
  TGetItinerarioCapa = Function(q:TQuery; llave,render:string; Tamano:Integer=2; Color:Integer=$00FFFF00; doZoom:Boolean=True; NombreCapa:string=''):Boolean;

  Function VerPlancha : Boolean;
  Function MostrarVistaLateralApoyos(ListaTemp : TStringList): Boolean;
  Function MostrarVistaLateralApoyosOdt(ListaTemp: TStringList;Odt,Consecutivo:double) : Boolean;
  Function MostrarFILTROODTApoyosAP(sql : String): Boolean;
  Function GetListaApoyo(ListaDato : TStringList):Boolean;
  Function GetListaCliente(ListaDato : TStringList):Boolean;
//***********************         Interrupciones         ***********************
  Function GetInterrupcionTrafodis(CodigoTrafodis:Integer;Proceso:Boolean;Var CodigoInterrupcion ,TotalClientes: Integer;DescPromedio,ConsumoPromedio: Real):Boolean;
  Function GetInterrupcionInterruptordis(CodigoInterruptordis:Integer;Proceso:Boolean;Var CodigoInterrupcion ,TotalClientes: Integer;DescPromedio,ConsumoPromedio: Real):Boolean;
  Function CrearEventoDistribucionReporte(TipoEvento,TipoElemento:Integer; PintadoApoyo,Llave1Elemento,Llave2Elemento:String;Fecha:String=''): String;
  Function CrearEventoCierreDistribucionReporte(CodigoEventoApertura:String;TipoEvento,TipoElemento:Integer; PintadoApoyo,Llave1Elemento,Llave2Elemento:String;
                                                TipoElementoFalla,CodCausa,Just,PintadoApoyoFalla,Llave1ElementoFalla,Llave2ElementoFalla:String;Fecha:String=''):String;
  Function EditarCierreDistribucionReporte(CodigoEvento: integer;CodCausa,Just:String):String;
  Function EditarAperturaDistribucionReporte(CodigoEvento,TipoElemento: integer;PintadoApoyo,Llave1Elemento:String;Fecha:String=''):String;
  Function BorrarEventoAdmin(CodigoEvento:String):Boolean;
  Function AbrirMaestroRespuestas :Boolean;
  Function AbrirMaestroCategorias :Boolean;

//***********************         Cartografia            ***********************
  function SafeLoadLibrary(const FileName: string; ErrorMode: UINT = SEM_NOOPENFILEERRORBOX): HMODULE;
  Function ResaltarTramosMT(ListaTramos:TStringList):Boolean;
  Function BuscarApoyo(CodigoApoyo:String;Zoom:Boolean;SeleccionApoyoReporte:Boolean=False):Boolean;
  Function MostrarItinerario(CodGrupoAol,CodRuta,CodItinerario,CodGrupoItinerario,Color:String):Boolean;
  Function BuscarBarrio(CodigoCig:String;Zoom:Boolean):Boolean;

  Function BuscarCIG(CodigoCig:String; nivel:integer; Zoom:Boolean):Boolean;

  Function ActualizarReportes:Boolean;
  Function UbicarContrato(CodigoContrato:Integer;Zoom:Boolean):Boolean;

  Function BuscarClienteCGC(CodigoContrato:String;Zoom:Boolean):Boolean;

  Function BuscarCliente(CodigoCliente:String;Zoom:Boolean):Boolean;
  Function ClienteEnInterrupcion(CodigoCliente:String;Zoom:Boolean):Boolean;
  Function BuscarClientesApoyo(Apoyos:Array of String;NApoyo:Integer):Boolean;
  Function BuscarClientesTrafoDis(Trafodis:Array of String;NTrafos,Normalida : Integer):Boolean;
  Function BuscarLineasTrafo(Trafodis : Array of String;NTrafodis : Integer):Boolean;


  Function MoverMovilAReporte(CodMovil:String;CodigoReporte:Integer):Boolean;
  Function MoverMovilADireccion(CodMovil:String; Cll1,Cll2 : String; Mover : Boolean) :Boolean;

  Function BuscarReporte(CodigoReporte:Integer;Zoom:Boolean):Boolean;
  Function SetCodigoReporte(CodigoReporte:Integer):Boolean;
  Function BorrarReporte(CodigoReporte:Integer):Boolean;

  Function LimpiarBusqueda:Boolean;
  Function BuscarDireccion(Dir1,Dir2,Dir3,Dir4:String):Boolean;
  Function MarcarBarrio(Zona,Ciudad,Barrio:String;Zoom:Boolean):Boolean;

  Procedure FiltroClienteSGC(ListaRotulo, ListaDato, ListaFrom, ListaWhere : TStringList);
  Procedure FiltroCliente(ListaRotulo, ListaDato, ListaFrom, ListaWhere : TStringList);
  Function GetQueryFiltroEvento(ListaRotulo, ListaDato, ListaFrom : TStringList) : TStringList;

  Function GetQueryFiltroAveria(ListaRotulo, ListaDato, ListaFrom : TStringList) : TStringList;
  Function VerEstadisticaAverias(ListaRotulo, ListaDato, ListaEstadistica: TStringList) :Boolean;
  Procedure FiltroApoyo(ListaRotulo, ListaDato, ListaFrom, ListaWhere : TStringList);
  Function GetQueryFiltroMaterial(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Function GetQueryFiltroReporte(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Function GetQueryFiltroProgramacion(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Function GetQueryFiltroODT(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Function GetQueryFiltroStock(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Function GetQueryFiltroGrupoTrabajo(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Function GetQueryFiltroAdministrativo(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Function GetQueryFiltroActividadCobro(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Function GetQueryFiltroMedidaSeguridad(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Function GetQueryFiltroContrato(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Function GetQueryFiltroPresupuesto(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Function GetQueryFiltroActividad(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Function GetQueryFiltroCarta(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Procedure UbicarReporte;
  Function  CrearReporte(CodigoReporte:Integer;X,Y:Double):Boolean;
  Procedure BuscarCoordenada(X,Y:Double);
  Function VistaLateralTrafo(Codigo:string):TObject;
  Procedure MostrarMapa;
  Procedure MarcarApoyos(Lista:TStringList);
  Procedure ImprimirListaPlancha(Planchas:TStringList;Confirmar:Integer;Texto:string);
  Function  BuscarGeocodigoCig(Lista:TStringList;var X,Y:Double;var Cig:Integer;Marcar:Boolean=True):string;
  Procedure EnviarCorreo(Host, User, Password, from, asunto, body,Receptor, Copia, Anexos: Pchar);
  function Exportar(ruta,Servidor,Usuario,ClaveUsuario,esquema,ODT,CONSECUTIVO:AnsiString;bVerMensaje:Boolean=True): Boolean;
  Procedure Importar(ruta,Servidor,Usuario,ClaveUsuario,esquema,ODT,CONSECUTIVO,asignacion:AnsiString);
  function EMovilExportarCartografiaApoyos(ListaApoyos:TStringList; Ruta:string):boolean;
  Procedure FiltroReporte(ListaRotulo, ListaDato, ListaFrom, ListaWhere : TStringList);
  Procedure SetElementoOdt(tipo:string);
  function SeleccionarRamalCircuito(CodCto:string):boolean;
  function SeleccionarApoyoLista: Boolean;
  function SeleccionarDuctoExcavacionLista: Boolean;
  function SeleccionarTrafoDisLista: Boolean;
  function SeleccionarExcavacionLista: Boolean;
  function SeleccionarLamparaAPLista: Boolean;
  function SeleccionarTramoMTLista: Boolean;
  function SeleccionarTramoBTLista: Boolean;
  function SeleccionarPararrayoLista: Boolean;
  function SeleccionarCondensadorLista: Boolean;
  function SeleccionarNodoMTLista: Boolean;
  function SeleccionarNodoBTLista: Boolean;
  function SeleccionarDetalleApoyoLista: Boolean;
  function SeleccionarInterruptorDisLista: Boolean;
  function ExportarAsignacionMovil(ruta,odt:string):boolean;
  function ImportarAsignacionMovil(ruta,odt:string):boolean;
  function RegistrarSincronizarMovil:boolean;
  function VerificarConexionDispositivoMovil: boolean;
  Function ValidarMovil(cododt,consecutivo: double) : Boolean;

  //****************** CLIENTE SFTP ******************************************//
  function ConectarA_SFTP(Servidor, Puerto, Usuario, Contrasena: String; MostrarMensajes: Boolean = True; MostrarProgreso: Boolean = True): Boolean;
  function BajarArchivo_SFTP(RutaCompletaArchivoRemoto, CarpetaDestino: String; Sobrescribir: Boolean = False; MostrarMensajes: Boolean = True; MostrarProgreso: Boolean = True): Boolean;
  function SubirArchivo_SFTP(RutaCompletaArchivoLocal, CarpetaDestino: String; Sobrescribir: Boolean = False; MostrarMensajes: Boolean = True; MostrarProgreso: Boolean = True): Boolean;
  function CrearDirectorio_SFTP(NombreDirectorio: String): Boolean;
  function BorrarDirectorio_SFTP(NombreDirectorio: String): Boolean;
  procedure Desconectar_SFTP();
  Procedure MostrarRuta(qRutas: TQuery);
  function ExisteArchivo_SFTP(RutaCompletaArchivoRemoto: String): Boolean;
  function BorrarArchivo_SFTP(RutaCompletaArchivoRemoto: String; MostrarMensajes: Boolean = True): Boolean;
  Function GetQueryFiltroLecutra(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Function GetQueryFiltroCritica(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Function GetQueryFiltroCriticaGestion(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  //******************** FIN CLIENTE SFTP ************************************//

  Function GetQueryFiltroODTHija(ListaRotulo, ListaDato, ListaFrom : TStringList; CIA: String): TStringList;
  function GetDatosCuenta390(pCodigoCuenta : string; sResultado: PChar; var BufLen: Word) : Boolean;
  Function MostrarGrupoItinerario(sCodigoGrupoAOL, sCodRuta, sCodGrupoIti: string):Boolean;
  Function MostrarGrupoItinerarioReparto(sFechaReparto,CodigoSedeOperativa: string):Boolean;
  function VerCalendarioLecturas(pUsuario,pContrasena,pServidor,pEsquema:string): Boolean;
  function  RotarImagen(ImagenEntrada, ImagenSalida: String; Angulo: Extended): Boolean;
  function DescargarArchivoFTP(DirectorioOrigen, DirectorioDestino: String;
      SobreEscribir: Boolean) : String;
  function GenerarQR(Texto:string;Margen : integer = 4; TamanoPixel : integer = 3;NivelError : Integer = 0):HBitmap;
  function ImprimirMapaItinerario(NombreCapa: string): Boolean;
  function GetItinerarioCapa(q:TQuery; Llave,Render:string; Tamano:Integer=2; Color:Integer=$00FFFF00; doZoom:Boolean=True; NombreCapa:string=''):Boolean;
  Function FiltroCapaTemporal(q:Tquery; llave, render : string; tiposhape:integer;tamano:integer;color:integer; doZoom: boolean; NombreFiltro : String):Boolean;
  function GetInformacionBackupLecturas(FileName : String ; var CodigoItinerario,FechaLectura, MensajeError : String; var Bandera : Boolean) : String;
  function GetItinerariosConBackup(FileName: string): String;
  function GetArchivosItinerariosConBackup(FileName: string): String;
  function UpLoadFotos(FileNameLocal,FileNameFTP: string): String;
  function GetFiltroReparto(ListaRotulo, ListaDato, ListaFrom :TStringList): TStringList;
  Function GetQueryFiltroReparto(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Function GetQueryFiltroRepartoGeneral(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Function GetFiltroSupervisionODS(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  Function GetQueryFiltroIlegales(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
  implementation

uses
  Sincronizar_TLB,ComObj,Registry,Forms;


  function  RotarImagen(ImagenEntrada, ImagenSalida: String;  Angulo: Extended): Boolean;
Var
   Rotmagen : TRotarImagen;
   Handle   : THandle;
Begin
  Handle := LoadLibrary('VampImaging0_26_4.dll');
  if Handle <> 0 then
  begin
    @Rotmagen := GetProcAddress(Handle, 'RotarImagen');
    if @Rotmagen <> nil then
    Begin
       Rotmagen(ImagenEntrada, ImagenSalida, Angulo);
    End
    else MessageDlg('No cargó la función "RotarImagen" de VampImaging0_26_4.dll',mtError,[mbOK],0);
  End
  else MessageDlg('No cargó la libreria VampImaging0_26_4.dll',mtError,[mbOK],0);
End;

//Funcion para cargar las dll's
function SafeLoadLibrary(const Filename: string; ErrorMode: UINT): HMODULE;
var
  OldMode: UINT;
  FPUControlWord: Word;
begin
  OldMode := SetErrorMode(ErrorMode);
  try
    asm
      FNSTCW  FPUControlWord
    end;
    try
      Result := LoadLibrary(PChar(Filename));
    finally
      asm
        FNCLEX
        FLDCW FPUControlWord
      end;
    end;
  finally
    SetErrorMode(OldMode);
  end;
end;

Function MostrarVistaLateralApoyos(ListaTemp: TStringList) : Boolean;
Var
   MostrarVL : TMostrarVistaLateral;
   Handle   : THandle;
Begin
  Handle := LoadLibrary('VistaLateral.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('VistaLateral.pgi');
    @MostrarVL := GetProcAddress(Handle, 'MostrarVistaLateralApoyos');
    if @MostrarVL <> nil then
    Begin
      MostrarVL(ListaTemp);
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('VistaLateral.pgi');
  End;
End;

Function MostrarVistaLateralApoyosOdt(ListaTemp: TStringList;Odt,Consecutivo:double) : Boolean;
Var
   MostrarVL : TMostrarVistaLateralOdt;
   Handle   : THandle;
Begin
  Handle := LoadLibrary('VistaLateral.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('VistaLateral.pgi');
    @MostrarVL := GetProcAddress(Handle, 'MostrarVistaLateralApoyosOdt');
    if @MostrarVL <> nil then
    Begin
      MostrarVL(ListaTemp,odt,consecutivo);
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('VistaLateral.pgi');
  End;
End;

Function MostrarFILTROODTApoyosAP(SQL:STRING) : Boolean;
Var
   MostrarODTAPOYO : TMostrarFILTROODTAP;
   Handle   : THandle;
Begin

  Handle := LoadLibrary('Cartografia.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Cartografia.pgi');
    @MostrarODTAPOYO := GetProcAddress(Handle, 'DoFiltroODTAPOYOAP');
    if @MostrarODTAPOYO <> nil then
    Begin
      MostrarODTAPOYO(SQL);
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('Cartografia.pgi');
  End;

End;

Function VistaLateralTrafo(Codigo:string):TObject;
Var
   GetVistaLateral : TVistaLateralTrafo1;
   Handle   : THandle;
Begin
//  Result := True;
  Handle := SafeLoadLibrary('VistaLateral.pgi');
  try
  if Handle <> 0 then
  begin
    @GetVistaLateral := GetProcAddress(Handle, 'VistaLateralTrafo1');
    if @GetVistaLateral <> nil
    then GetVistaLateral(Codigo);
  End;
  finally
    FreeLibrary(Handle);
  end;
End;

Function GetQueryFiltroCarta(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
Var
   GetQuery : TGetQueryFiltroCarta;
   Handle   : THandle;
Begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroCarta');
    if @GetQuery <> nil
    then Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  End;
End;

Procedure FiltroApoyo(ListaRotulo, ListaDato, ListaFrom, ListaWhere : TStringList);
Var
   GetFiltroCartografia : TFiltroApoyo;
   Handle   : THandle;
Begin
//  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
  if Handle <> 0 then
  begin
    @GetFiltroCartografia := GetProcAddress(Handle, 'FiltroApoyo');
    if @GetFiltroCartografia <> nil
    then GetFiltroCartografia(ListaRotulo, ListaDato, ListaFrom, ListaWhere);
  End;
  finally
    FreeLibrary(Handle);
  end;
End;

Function GetQueryFiltroReporte(ListaRotulo, ListaDato, ListaFrom : TStringList) : TStringList;
Var
   GetQuery : TGetQueryFiltroReporte;
   Handle   : THandle;
Begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroReporte');
    if @GetQuery <> nil
    then Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  End;
End;

Function DescargarArchivoFTP(DirectorioOrigen, DirectorioDestino: String;
      SobreEscribir: Boolean) : String;
Var
   GetFTP : TDescargarArchivo;
   Handle   : THandle;
     Mat, Men: PWideChar;
Begin
  Result := 'False';
  Handle := LoadLibrary('FTP.dll');
  if Handle <> 0 then
  begin
    @GetFTP := GetProcAddress(Handle, 'DescargarArchivo');
    if @GetFTP <> nil
    then
    begin
          GetMem(Mat, Length(DirectorioOrigen) * 2 + 2);
      Mat := StringToWideChar(DirectorioOrigen, Mat,
        Length(DirectorioOrigen) + 1);

      GetMem(Men, Length(DirectorioDestino) * 2 + 2);
      Men := StringToWideChar(DirectorioDestino, Men,
        Length(DirectorioDestino) + 1);
      GetFTP(Mat, Men,SobreEscribir);
    end;
  End;
End;

function GetQueryFiltroStock(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
var
  GetQuery: TGetQueryFiltroStock;
  Handle: THandle;
begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroStock');
    if @GetQuery <> nil then
      Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  end;
end;

function GetQueryFiltroGrupoTrabajo(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
var
  GetQuery: TGetQueryFiltroGrupoTrabajo;
  Handle: THandle;
begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroGrupoTrabajo');
    if @GetQuery <> nil then
      Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  end;
end;

Function GetQueryFiltroODT(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
Var
   GetQuery : TGetQueryFiltroODT;
   Handle   : THandle;
Begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroODT');
    if @GetQuery <> nil
    then Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  End;
End;

Function GetQueryFiltroLecutra(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
Var
   GetQuery : TGetQueryFiltroLectura;
   Handle   : THandle;
Begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroLectura');
    if @GetQuery <> nil
    then Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  End;
End;


Function GetQueryFiltroReparto(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
Var
   GetQuery : TGetQueryFiltroReparto;
   Handle   : THandle;
Begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroReparto');
    if @GetQuery <> nil
    then Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  End;
End;
Function GetQueryFiltroRepartoGeneral(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
Var
   GetQuery : TGetQueryFiltroReparto;
   Handle   : THandle;
Begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroRepartoGeneral');
    if @GetQuery <> nil
    then Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  End;
End;

Function GetQueryFiltroCritica(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
Var
   GetQuery : TGetQueryFiltroLectura;
   Handle   : THandle;
Begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroCritica');
    if @GetQuery <> nil
    then Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  End;
End;

Function GetQueryFiltroCriticaGestion(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
Var
   GetQuery : TGetQueryFiltroLectura;
   Handle   : THandle;
Begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroCriticaGestion');
    if @GetQuery <> nil
    then Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  End;
End;

Function GetQueryFiltroActividad(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
Var
   GetQuery : TGetQueryFiltroActividad;
   Handle   : THandle;
Begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroActividad');
    if @GetQuery <> nil
    then Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  End;
End;

Function GetQueryFiltroActividadCobro(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
Var
   GetQuery : TGetQueryFiltroActividadCobro;
   Handle   : THandle;
Begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroActividadCobro');
    if @GetQuery <> nil
    then Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  End;
End;

Function GetQueryFiltroMedidaSeguridad(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
Var
   GetQuery : TGetQueryFiltroMedidaSeguridad;
   Handle   : THandle;
Begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroMedidaSeguridad');
    if @GetQuery <> nil
    then Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  End;
End;

function GetQueryFiltroAdministrativo(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
var
  GetQuery: TGetQueryFiltroAdministrativo;
  Handle: THandle;
begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroAdministrativo');
    if @GetQuery <> nil then
      Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  end;
end;

Function GetQueryFiltroProgramacion(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
Var
   GetQuery : TGetQueryFiltroProgramacion;
   Handle   : THandle;
Begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroProgramacion');
    if @GetQuery <> nil
    then Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  End;
End;

Function GetQueryFiltroContrato(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
Var
   GetQuery : TGetQueryFiltroContrato;
   Handle   : THandle;
Begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroContrato');
    if @GetQuery <> nil
    then Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  End;
End;

Function GetQueryFiltroPresupuesto(ListaRotulo, ListaDato, ListaFrom : TStringList): TStringList;
Var
   GetQuery : TGetQueryFiltroPresupuesto;
   Handle   : THandle;
Begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroPresupuesto');
    if @GetQuery <> nil
    then Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  End;
End;


Function GetQueryFiltroAveria(ListaRotulo, ListaDato, ListaFrom : TStringList) : TStringList;
Var
   GetQuery : TGetQueryFiltroAveria;
   Handle   : THandle;
Begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroAveria');
    if @GetQuery <> nil
    then Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  End;
End;


Function GetQueryFiltroMaterial(ListaRotulo, ListaDato, ListaFrom : TStringList) : TStringList;
Var
   GetQuery : TGetQueryFiltroMaterial;
   Handle   : THandle;
Begin
  Result := Nil;

  Handle := LoadLibrary('Filtros.pgi');

  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroMaterial');
    if @GetQuery <> nil then
    Begin
      Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
    End;
  End;
End;

Procedure FiltroAveria(ListaRotulo, ListaDato, ListaFrom, ListaWhere : TStringList);
Var
   GetFiltroCartografia : TFiltroAveria;
   Handle   : THandle;
Begin
//  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetFiltroCartografia := GetProcAddress(Handle, 'FiltroAveria');
      if @GetFiltroCartografia <> nil
      then GetFiltroCartografia(ListaRotulo, ListaDato, ListaFrom, ListaWhere);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;

Function VerEstadisticaAverias(ListaRotulo, ListaDato, ListaEstadistica: TStringList) :Boolean;
  Var
   GetVerEstadistica : TVerEstadisticaAverias;
   Handle   : THandle;
Begin
  Result := True;
  Handle := SafeLoadLibrary('Estadisticas.pgi');
  try
  if Handle <> 0 then
  begin
    @GetVerEstadistica := GetProcAddress(Handle, 'VerEstadisticaAverias');
    if @GetVerEstadistica <> nil then
    GetVerEstadistica(ListaRotulo, ListaDato, ListaEstadistica);
  End;
  finally
    FreeLibrary(Handle);
  end;
End;

Function GetListaApoyo(ListaDato : TStringList):Boolean;
Var
   GetLista : TGetListaApoyo;
   Handle   : THandle;
Begin
  Result := True;
  Handle := LoadLibrary('Listas.pgi');
  if Handle <> 0 then
  begin
    @GetLista := GetProcAddress(Handle, 'GetListaApoyo');
    if @GetLista <> nil
    then Result := GetLista(ListaDato);
  End;
End;

Function GetListaCliente(ListaDato : TStringList):Boolean;
Var
   GetLista : TGetListaCliente;
   Handle   : THandle;
Begin
  Result := True;
  Handle := LoadLibrary('Listas.pgi');
  if Handle <> 0 then
  begin
    @GetLista := GetProcAddress(Handle, 'GetListaCliente');
    ShowMessage(ListaDato.Text);
    if @GetLista <> nil
    then Result := GetLista(ListaDato);
  End;
End;
//***********************         Interrupciones         ***********************
Function GetInterrupcionTrafodis(CodigoTrafodis:Integer;Proceso:Boolean;Var CodigoInterrupcion ,TotalClientes: Integer;DescPromedio,ConsumoPromedio: Real):Boolean;
Var
   GetInterrupcion : TGetInterrupcionTrafodis;
   Handle   : THandle;
Begin
  Result := True;
  Handle := LoadLibrary('Interrupcion.pgi');
  if Handle <> 0 then
  begin
    @GetInterrupcion := GetProcAddress(Handle, 'GetInterrupcionTrafodis');
    if @GetInterrupcion <> nil
    then Result := GetInterrupcion(CodigoTrafodis,Proceso,CodigoInterrupcion ,TotalClientes,DescPromedio,ConsumoPromedio);
  End;
End;

Function GetInterrupcionInterruptordis(CodigoInterruptordis:Integer;Proceso:Boolean;Var CodigoInterrupcion ,TotalClientes: Integer;DescPromedio,ConsumoPromedio: Real):Boolean;
Var
   GetInterrupcion : TGetInterrupcionInterruptordis;
   Handle   : THandle;
Begin
  Result := True;
  Handle := LoadLibrary('Interrupcion.pgi');
  if Handle <> 0 then
  begin
    @GetInterrupcion := GetProcAddress(Handle, 'GetInterrupcionInteruptordis');
    if @GetInterrupcion <> nil
    then Result := GetInterrupcion(CodigoInterruptordis,Proceso,CodigoInterrupcion ,TotalClientes,DescPromedio,ConsumoPromedio);
  End;
End;


//***********************         Cartografia            ***********************

Function BuscarDireccion(Dir1,Dir2,Dir3,Dir4:String):Boolean;
Var
   GetReporte : TBuscarDireccion;
   Handle   : THandle;
Begin
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'UbicarDireccion');
      if @GetReporte <> nil
      then Result := GetReporte(Dir1,Dir2,Dir3,Dir4);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;

Function MarcarBarrio(Zona,Ciudad,Barrio:String;Zoom:Boolean):Boolean;
Var
   GetReporte : TMarcarBarrio;
   Handle   : THandle;
Begin
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'MarcarBarrio');
      if @GetReporte <> nil
      then Result := GetReporte(Zona,Ciudad,Barrio,Zoom);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;

Function ResaltarTramosMT(ListaTramos:TStringList):Boolean;
Var
   GetReporte : TResaltarTramosMT;
   Handle   : THandle;
Begin
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'MarcarTramosMT');
      if @GetReporte <> nil
      then Result := GetReporte(ListaTramos);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;

Function BuscarLineasTrafo(Trafodis : Array of String;NTrafodis :Integer):Boolean;
Var
   GetReporte : TBuscarLineasTrafo;
   Handle   : THandle;
Begin
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'BuscarLineasTrafo');
      if @GetReporte <> nil
      then Result := GetReporte(Trafodis,NTrafodis);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;

Function BuscarClientesTrafoDis(Trafodis:Array of String;NTrafos,Normalida :Integer):Boolean;
Var
   GetReporte : TBuscarClientesTrafoDis;
   Handle   : THandle;
Begin
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'BuscarClientesTrafoDis');
      if @GetReporte <> nil
      then Result := GetReporte(Trafodis,NTrafos,Normalida);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;


Function BuscarClientesApoyo(Apoyos:Array of String;NApoyo:Integer):Boolean;
Var
   GetReporte : TBuscarClientesApoyo;
   Handle   : THandle;
Begin
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'BuscarClientesApoyo');
      if @GetReporte <> nil
      then Result := GetReporte(Apoyos,NApoyo);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;


Function LimpiarBusqueda:Boolean;
Var
   GetReporte : TLimpiarBusqueda;
   Handle   : THandle;
Begin
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
  if Handle <> 0 then
  begin
    @GetReporte := GetProcAddress(Handle, 'LimpiarBusqueda');
    if @GetReporte <> nil
    then Result := GetReporte;
  End;
  finally
    FreeLibrary(Handle);
  end;
End;


Function BorrarReporte(CodigoReporte:Integer):Boolean;
Var
   GetReporte : TBorrarReporte;
   Handle   : THandle;
Begin
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'BorrarReporte');
      if @GetReporte <> nil
      then Result := GetReporte(CodigoReporte);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;

Function ClienteEnInterrupcion(CodigoCliente:String;Zoom:Boolean):Boolean;
Var
   GetReporte : TClienteEnInterrupcion;
   Handle   : THandle;
Begin
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'ClienteEnInterrupcion');
      if @GetReporte <> nil
      then Result := GetReporte(CodigoCliente);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;

Function BuscarReporte(CodigoReporte:Integer;Zoom:Boolean):Boolean;
Var
   GetReporte : TBuscarReporte;
   Handle   : THandle;
Begin
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'BuscarReporte');
      if @GetReporte <> nil
      then Result := GetReporte(CodigoReporte,Zoom);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;

Procedure MostrarRuta(qRutas: TQuery);
var
    DibujarRutaLectura : TMostrarRuta;
    Handle   : THandle;
Begin
  MostrarMapa;
  Handle := LoadLibrary('Cartografia.pgi');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Cartografia.pgi');
    @DibujarRutaLectura := GetProcAddress(Handle, 'DibujarRutaLectura');
    if @DibujarRutaLectura <> nil then
      DibujarRutaLectura(qRutas);
  End;
End;

Function BuscarApoyo(CodigoApoyo:String;Zoom:Boolean;SeleccionApoyoReporte:Boolean=False):Boolean;
Var
   GetReporte : TBuscarApoyo;
   Handle   : THandle;
Begin
  MostrarMapa;
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'BuscarApoyo');
      if @GetReporte <> nil
      then GetReporte(CodigoApoyo,Zoom,SeleccionApoyoReporte);
    End
    Else   ShowMessage('No cargo la Funcion');
  finally
    FreeLibrary(Handle);
  end;
end;

Function MostrarItinerario(CodGrupoAol,CodRuta,CodItinerario,CodGrupoItinerario,Color:String):Boolean;
Var
   GetReporte : TMostrarItinerario;
   Handle   : THandle;
Begin
  MostrarMapa;
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'MostrarItinerario');
      if @GetReporte <> nil
      then GetReporte(CodGrupoAol,CodRuta,CodItinerario,CodGrupoItinerario,Color);
    End
    Else   ShowMessage('No cargo la Funcion');
  finally
    FreeLibrary(Handle);
  end;
end;

Function FiltroCapaTemporal(q:Tquery; llave, render : string; tiposhape:integer;tamano:integer;color:integer; doZoom: boolean; NombreFiltro : String):Boolean;
Var
   GetReporte : TFiltroCapaTemporal;
   Handle   : THandle;
Begin
  MostrarMapa;
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'GetFiltroCapaTemporal');
      if @GetReporte <> nil
      then GetReporte(q,llave,render, 1,2,color,doZoom,NombreFiltro);
    End
    Else   ShowMessage('No cargo la Funcion');
  finally
    FreeLibrary(Handle);
  end;
end;


Function BuscarBarrio(CodigoCig:String;Zoom:Boolean):Boolean;
Var
   GetReporte : TBuscarBarrio;
   Handle   : THandle;
Begin
  MostrarMapa;
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'BuscarBarrio');
      if @GetReporte <> nil
      then GetReporte(CodigoCig,Zoom);
    End
    Else   ShowMessage('No cargo la Funcion');
  finally
    FreeLibrary(Handle);
  end;
end;


Function BuscarCIG(CodigoCig:String; nivel:integer; Zoom:Boolean):Boolean;
Var
   GetReporte : TBuscarCIG;
   Handle   : THandle;
Begin
  MostrarMapa;
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'BuscarCIG');
      if @GetReporte <> nil
      then GetReporte(CodigoCig,nivel, Zoom);
    End
    Else   ShowMessage('No cargo la Funcion');
  finally
    FreeLibrary(Handle);
  end;
end;


Function ActualizarReportes:Boolean;
Var
   GetReporte : TActualizarReportes;
   Handle   : THandle;
Begin
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'ActualizarReportes');
      if @GetReporte <> nil
      then GetReporte;
    End
    Else   ShowMessage('No cargo la Funcion');
  finally
    FreeLibrary(Handle);
  end;
end;


Function UbicarContrato(CodigoContrato:Integer;Zoom:Boolean):Boolean;
Var
   UbicarContrato : TUbicarContrato;
   Handle   : THandle;
Begin
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    If Handle = 0 then  ShowMessage('No cargo la libreria');
    if Handle <> 0 then
    begin
//      ModPlugIns.LoadModulo('Cartografia.pgi');
      @UbicarContrato := GetProcAddress(Handle, 'UbicarContrato');
      if @UbicarContrato <> nil then
      Begin
        UbicarContrato(CodigoContrato,Zoom);
      End
      Else   ShowMessage('No cargo la Funcion');
//      ModPlugIns.UnLoadModulo('Cartografia.pgi');
    End;
  finally
    FreeLibrary(Handle);
  end;
End;

Function BuscarCliente(CodigoCliente:String;Zoom:Boolean):Boolean;
Var
   GetReporte : TBuscarCliente;
   Handle   : THandle;
Begin
  MostrarMapa;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    //ModPlugIns.LoadModulo('Cartografia.pgi');
    @GetReporte := GetProcAddress(Handle, 'BuscarCliente');
    if @GetReporte <> nil
    then Result := GetReporte(CodigoCliente,Zoom)
    else ShowMessage('No cargo la Funcion');
    //ModPlugIns.UnLoadModulo('Cartografia.pgi');
  End;
 finally
   FreeLibrary(Handle);
 end;
End;

Function BuscarClienteCGC(CodigoContrato:String;Zoom:Boolean):Boolean;
Var
   GetReporte : TBuscarClienteCGC;
   Handle   : THandle;
Begin
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'BuscarClienteCGC');
      if @GetReporte <> nil
      then Result := GetReporte(CodigoContrato,Zoom);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;

Function SetCodigoReporte(CodigoReporte:Integer):Boolean;
Var
   GetReporte : TSetCodigoReporte;
   Handle   : THandle;
Begin
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'SetCodigoReporte');
      if @GetReporte <> nil
      then Result := GetReporte(CodigoReporte);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;

Function MoverMovilAReporte(CodMovil:String;CodigoReporte:Integer):Boolean;
Var
   GetReporte : TMoverMovilAReporte;
   Handle   : THandle;
Begin
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'MoverMovilaReporte');
      if @GetReporte <> nil
      then Result := GetReporte(CodMovil,CodigoReporte);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;

Function MoverMovilADireccion(CodMovil:String; Cll1,Cll2 : String; Mover : Boolean) :Boolean;
Var
   GetReporte : TMoverMovilADireccion;
   Handle   : THandle;
Begin
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetReporte := GetProcAddress(Handle, 'MoverMovilaDireccion');
      if @GetReporte <> nil
      then Result := GetReporte(CodMovil,Cll1,Cll2, Mover);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;

Procedure FiltroClienteSGC(ListaRotulo, ListaDato, ListaFrom, ListaWhere : TStringList);
Var
   GetFiltroCartografia : TFiltroClienteSGC;
   Handle   : THandle;
Begin
//  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetFiltroCartografia := GetProcAddress(Handle, 'FiltroClienteSGC');
      if @GetFiltroCartografia <> nil
      then GetFiltroCartografia(ListaRotulo, ListaDato, ListaFrom, ListaWhere);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;

Procedure FiltroCliente(ListaRotulo, ListaDato, ListaFrom, ListaWhere : TStringList);
Var
   GetFiltroCartografia : TFiltroCliente;
   Handle   : THandle;
Begin
//  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetFiltroCartografia := GetProcAddress(Handle, 'FiltroCliente');
      if @GetFiltroCartografia <> nil
      then GetFiltroCartografia(ListaRotulo, ListaDato, ListaFrom, ListaWhere);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;

Function GetQueryFiltroEvento(ListaRotulo, ListaDato, ListaFrom : TStringList) : TStringList;
Var
   GetQuery : TGetQueryFiltroEvento;
   Handle   : THandle;
Begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroEvento');
    if @GetQuery <> nil
    then Result := GetQuery(ListaRotulo, ListaDato, ListaFrom);
  End;
End;


Function VerPlancha:Boolean;
Var
   GetPlancha: TVerPlancha;
   Handle   : THandle;
Begin
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetPlancha := GetProcAddress(Handle, 'VerPlancha');
      if @GetPlancha <> nil
      then Result := VerPlancha;
    End;
  finally
    FreeLibrary(Handle);
  end;
End;


Procedure UbicarReporte;
Var
   GetUbicarReporte: TUbicarReporte;
   Handle   : THandle;
Begin
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetUbicarReporte := GetProcAddress(Handle, 'UbicarReporte');
      if @GetUbicarReporte <> nil
      then GetUbicarReporte;
    End;
  finally
    FreeLibrary(Handle);
  end;


End;

Function  CrearReporte(CodigoReporte:Integer;X,Y:Double):Boolean;
Var
   GetCrearReporte: TCrearReporte;
   Handle   : THandle;
Begin
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetCrearReporte := GetProcAddress(Handle, 'CrearReporte');
      if @GetCrearReporte <> nil
      then GetCrearReporte(CodigoReporte,X,Y);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;


Procedure BuscarCoordenada(X,Y:Double);
Var
   GetBuscarCoordenada: TBuscarCoordenada;
   Handle   : THandle;
Begin
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetBuscarCoordenada := GetProcAddress(Handle, 'BuscarCoordenada');
      if @GetBuscarCoordenada <> nil
      then GetBuscarCoordenada(X,Y);
    End;
  finally
    FreeLibrary(Handle);
  end;
End;

Procedure MostrarMapa;
var   GetMostrarMapa : TMostrarMapa;
    Handle   : THandle;
Begin
  Handle := LoadLibrary('Cartografia.pgi');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Cartografia.pgi');
    @GetMostrarMapa := GetProcAddress(Handle, 'MostrarMapa');
    if @GetMostrarMapa <> nil then
      GetMostrarMapa;
//    ModPlugIns.UnLoadModulo('Cartografia.pgi');
  End;
End;

Procedure MarcarApoyos(Lista:TStringList);
Var
   GetMarcarApoyos : TMarcarApoyos;
   Handle          : THandle;
begin
 Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetMarcarApoyos := GetProcAddress(Handle, 'MarcarApoyos');
      if @GetMarcarApoyos <> nil
      then GetMarcarApoyos(Lista);
    End;
  finally
//    FreeLibrary(Handle);
  end;
end;

function EMovilExportarCartografiaApoyos(ListaApoyos:TStringList; Ruta:string):boolean;
Var
   GetExportarCartografiaApoyos : TEMovilExportarCartografiaApoyos;
   Handle          : THandle;
begin
 Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetExportarCartografiaApoyos := GetProcAddress(Handle, 'EMovilExportarCartografiaApoyos');
      if @GetExportarCartografiaApoyos <> nil
      then GetExportarCartografiaApoyos(ListaApoyos,ruta);
    End;
  finally
//    FreeLibrary(Handle);
  end;
end;

Procedure SetElementoOdt(tipo:string);
var
   GetElementoOdt : TSetElementoOdt;
   Handle          : THandle;
begin
 Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetElementoOdt := GetProcAddress(Handle, 'SetElementoOdt');
      if @GetElementoOdt <> nil
      then GetElementoOdt(tipo);
    End;
  finally
//    FreeLibrary(Handle);
  end;
end;

//LLamado a función de importación para Datos de EnerGis Movil en Vista Lateral
Function ValidarMovil(cododt,consecutivo: double) : Boolean;
Var
   GetValidarMovil : TValidarMovil;
   Handle   : THandle;
Begin
  Handle := LoadLibrary('VistaLateral.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('VistaLateral.pgi');
    @GetValidarMovil := GetProcAddress(Handle, 'ValidarMovil');
    if @GetValidarMovil <> nil then
    Begin
      GetValidarMovil(cododt,consecutivo);
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('VistaLateral.pgi');
  End;
End;

Procedure ImprimirListaPlancha(Planchas:TStringList;Confirmar:Integer;Texto:string);
Var
   GetImprimirListaPlancha : TImprimirListaPlancha;
   Handle                  : THandle;
begin
 Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetImprimirListaPlancha := GetProcAddress(Handle, 'ImprimirListaPlanchas');
      if @GetImprimirListaPlancha <> nil
      then GetImprimirListaPlancha(Planchas,Confirmar,Texto);
    End;
  finally
    FreeLibrary(Handle);
  end;
end;

Function BuscarGeocodigoCig(Lista:TStringList;var X,Y:Double;var Cig:integer;Marcar:Boolean=True):string;
Var
   GetBuscar : TBuscarGeocodigo;
   Handle    : THandle;
begin
 Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @GetBuscar := GetProcAddress(Handle, 'BuscarGeocodigoCIG');
      if @GetBuscar <> nil
      then
      begin
        result:=GetBuscar(Lista,X,Y,Cig,Marcar);
      end;
    End;
  finally
    FreeLibrary(Handle);
  end;
end;
//Seleccionar el ramal de un circuito en topología
function SeleccionarRamalCircuito(CodCto:string):boolean;
var
   GetValidarMovil : TSeleccionarRamalCircuito;
   Handle          : THandle;
begin
  Handle := LoadLibrary('Topologias.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Topologias.pgi');
    @GetValidarMovil := GetProcAddress(Handle, 'ODTMovilExportarApoyos');
    if @GetValidarMovil <> nil then
    Begin
      GetValidarMovil(CodCto);
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('Topologias.pgi');
  End;
end;

Procedure EnviarCorreo(Host, User, Password, from, asunto, body,Receptor, copia, Anexos: Pchar);
Var
   Enviar : TEnviarCorreo;
   Handle    : THandle;
begin
 Handle := SafeLoadLibrary('EmailLib.dll');
  try
    if Handle <> 0 then
    begin
      @Enviar := GetProcAddress(Handle, 'EnviarCorreo');
      if @Enviar <> nil
      then
      begin
        Enviar(Host, User, Password, from, asunto, body,Receptor,Copia,  Anexos);
      end;
    End;
  finally
    FreeLibrary(Handle);
  end;
end;

function Exportar(ruta,Servidor,Usuario,ClaveUsuario,esquema,ODT,CONSECUTIVO:AnsiString; bVerMensaje:Boolean = True): Boolean;
Var
   Exportar : TExportar;
   Handle    : THandle;
begin
  Result:= False;
  Handle := SafeLoadLibrary('IESDF.dll');
  try
    if Handle <> 0 then
    begin
      @Exportar := GetProcAddress(Handle, 'Exportar');
      if @Exportar<> nil then
        Result:= Exportar(ruta,Servidor,Usuario,ClaveUsuario,esquema,ODT,CONSECUTIVO,bVerMensaje);
    end;
  except
  end;
  FreeLibrary(Handle);
end;

Procedure Importar(ruta,Servidor,Usuario,ClaveUsuario,esquema,ODT,CONSECUTIVO,asignacion:AnsiString);
Var
   Importar : TImportar;
   Handle    : THandle;
begin
  Handle := SafeLoadLibrary('IESDF.dll');
  try
    if Handle <> 0 then
    begin
      @Importar := GetProcAddress(Handle, 'Importar');
      if @Importar<> nil
      then
      begin
        Importar(ruta,Servidor,Usuario,ClaveUsuario,esquema,ODT,CONSECUTIVO,asignacion);
      end;
    End;
  except
  end;
  FreeLibrary(Handle);
end;

Procedure FiltroReporte(ListaRotulo, ListaDato, ListaFrom, ListaWhere : TStringList);
Var
   GetFiltroCartografia : TFiltroReporte;
   Handle   : THandle;
Begin
//  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
  if Handle <> 0 then
  begin
    @GetFiltroCartografia := GetProcAddress(Handle, 'FiltroReporte');
    if @GetFiltroCartografia <> nil
    then GetFiltroCartografia(ListaRotulo, ListaDato, ListaFrom, ListaWhere);
  End;
  finally
//    FreeLibrary(Handle);
  end;
End;

function SeleccionarApoyoLista: Boolean;
var
   GetListaApoyo : TSeleccionarApoyoLista;
   Handle          : THandle;
begin
  Handle := LoadLibrary('Listas.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Listas.pgi');
    @GetListaApoyo := GetProcAddress(Handle, 'ListaApoyo');
    if @GetListaApoyo <> nil then
    Begin
      GetListaApoyo;
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('Listas.pgi');
  End;
end;

function SeleccionarTrafoDisLista: Boolean;
var
   GetListaTrafos : TSeleccionarTrafoDisLista;
   Handle          : THandle;
begin
  Handle := LoadLibrary('Listas.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Listas.pgi');
    @GetListaTrafos := GetProcAddress(Handle, 'ListaTrafoDis');
    if @GetListaTrafos <> nil then
    Begin
      GetListaTrafos;
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('Listas.pgi');
  End;
end;

function SeleccionarDuctoExcavacionLista: Boolean;
var
   GetListaDuctoExcavacion : TSeleccionarDuctoExcavacionLista;
   Handle          : THandle;
begin
  Handle := LoadLibrary('Listas.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Listas.pgi');
    @GetListaDuctoExcavacion := GetProcAddress(Handle, 'ListaDuctoExcavacion');
    if @GetListaDuctoExcavacion <> nil then
    Begin
      GetListaDuctoExcavacion;
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('Listas.pgi');
  End;
end;

function SeleccionarExcavacionLista: Boolean;
var
   GetListaExcavacion : TSeleccionarExcavacionLista;
   Handle          : THandle;
begin
  Handle := LoadLibrary('Listas.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Listas.pgi');
    @GetListaExcavacion := GetProcAddress(Handle, 'ListaExcavacion');
    if @GetListaExcavacion <> nil then
    Begin
      GetListaExcavacion;
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('Listas.pgi');
  End;
end;

function SeleccionarLamparaAPLista: Boolean;
var
   GetListaLamparaAP : TSeleccionarLamparaAPLista;
   Handle          : THandle;
begin
  Handle := LoadLibrary('Listas.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Listas.pgi');
    @GetListaLamparaAP := GetProcAddress(Handle, 'ListaLamparaAP');
    if @GetListaLamparaAP <> nil then
    Begin
      GetListaLamparaAP;
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('Listas.pgi');
  End;
end;

function SeleccionarTramoMTLista: Boolean;
var
   GetListaTramoMT : TSeleccionarTramoMTLista;
   Handle          : THandle;
begin
  Handle := LoadLibrary('Listas.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Listas.pgi');
    @GetListaTramoMT := GetProcAddress(Handle, 'ListaTramoMT');
    if @GetListaTramoMT <> nil then
    Begin
      GetListaTramoMT;
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('Listas.pgi');
  End;
end;

function SeleccionarTramoBTLista: Boolean;
var
   GetListaTramoBT : TSeleccionarTramoBTLista;
   Handle          : THandle;
begin
  Handle := LoadLibrary('Listas.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Listas.pgi');
    @GetListaTramoBT := GetProcAddress(Handle, 'ListaTramoBT');
    if @GetListaTramoBT <> nil then
    Begin
      GetListaTramoBT;
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('Listas.pgi');
  End;
end;

function SeleccionarPararrayoLista: Boolean;
var
   GetListaPararrayo : TSeleccionarPararrayoLista;
   Handle          : THandle;
begin
  Handle := LoadLibrary('Listas.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Listas.pgi');
    @GetListaPararrayo := GetProcAddress(Handle, 'ListaPararrayo');
    if @GetListaPararrayo <> nil then
    Begin
      GetListaPararrayo;
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('Listas.pgi');
  End;
end;

function SeleccionarCondensadorLista: Boolean;
var
   GetListaCondensador : TSeleccionarCondensadorLista;
   Handle          : THandle;
begin
  Handle := LoadLibrary('Listas.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Listas.pgi');
    @GetListaCondensador := GetProcAddress(Handle, 'ListaCondensador');
    if @GetListaCondensador <> nil then
    Begin
      GetListaCondensador;
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('Listas.pgi');
  End;
end;

function SeleccionarNodoMTLista: Boolean;
var
   GetListaNodoMT : TSeleccionarNodoMTLista;
   Handle          : THandle;
begin
  Handle := LoadLibrary('Listas.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Listas.pgi');
    @GetListaNodoMT := GetProcAddress(Handle, 'ListaNodoMT');
    if @GetListaNodoMT <> nil then
    Begin
      GetListaNodoMT;
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('Listas.pgi');
  End;
end;

function SeleccionarNodoBTLista: Boolean;
var
   GetListaNodoBT : TSeleccionarNodoBTLista;
   Handle          : THandle;
begin
  Handle := LoadLibrary('Listas.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Listas.pgi');
    @GetListaNodoBT := GetProcAddress(Handle, 'ListaNodoBT');
    if @GetListaNodoBT <> nil then
    Begin
      GetListaNodoBT;
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('Listas.pgi');
  End;
end;

function SeleccionarDetalleApoyoLista: Boolean;
var
   GetListaDetalleApoyo : TSeleccionarDetalleApoyoLista;
   Handle          : THandle;
begin
  Handle := LoadLibrary('Listas.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Listas.pgi');
    @GetListaDetalleApoyo := GetProcAddress(Handle, 'ListaDetalleApoyo');
    if @GetListaDetalleApoyo <> nil then
    Begin
      GetListaDetalleApoyo;
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('Listas.pgi');
  End;
end;

function SeleccionarInterruptorDisLista: Boolean;
var
   GetListaInterruptorDis : TSeleccionarInterruptorDisLista;
   Handle          : THandle;
begin
  Handle := LoadLibrary('Listas.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Listas.pgi');
    @GetListaInterruptorDis := GetProcAddress(Handle, 'ListaInterruptorDis');
    if @GetListaInterruptorDis <> nil then
    Begin
      GetListaInterruptorDis;
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('Listas.pgi');
  End;
end;

function ExportarAsignacionMovil(ruta, odt: string): boolean;
var con:ComSincronizarInterface;
  reintentar:boolean;
begin
  RegistrarSincronizarMovil;
  result:=false;
  con:=createComobject(CLASS_ComSincronizar) as ComSincronizarInterface;
  reintentar:=true;
  try
    while (reintentar) do
    begin
        reintentar:=false;
        if con.Verificar_Conexi_n then
        begin
          if con.ExportarAsignaci_n(ruta,odt) then
          begin
            showmessage('La asignación se copió en el Dispositivo Móvil.');
            result:=true;
            reintentar:=false;            
          end
          else
            showmessage('La asignación no se pudo copiar en el Dispositivo Móvil.')
        end
        else
        begin
          if (Application.MessageBox('El dispositivo Móvil no se encuentra conectado.','Error',MB_RETRYCANCEL)=mrRetry) then
             reintentar:=true;
        end;
    end;
  except
    on e:exception do
    begin
      showmessage(e.message);
    end;
  end;
end;

function ImportarAsignacionMovil(ruta, odt: string): boolean;
var con:ComSincronizarInterface;
  reintentar:boolean;
begin
  RegistrarSincronizarMovil;
  result:=false;
  con:=createComobject(CLASS_ComSincronizar) as ComSincronizarInterface;
  reintentar:=true;
  try
    while (reintentar) do
    begin
      reintentar:=false;
      if con.Verificar_Conexi_n then
      begin
        if con.ImportarAsignaci_n(ruta,odt) then
        begin
          showmessage('La asignación se copió en el Equipo.');
          result:=true;
        end
        else
          showmessage('La asignación no se pudo copiar en el Equipo.')
      end
      else
      begin
        if Application.MessageBox('El dispositivo Móvil no se encuentra conectado.','Error',MB_RETRYCANCEL)=mrRetry then
           reintentar:=true;
      end;
    end;
  except
    on e:exception do
    begin
      showmessage(e.message);
    end;
  end;
end;

function RegistrarSincronizarMovil: boolean;
 var reg: TRegistry;
begin
  reg:= TRegistry.Create;
  reg.RootKey := HKEY_CLASSES_ROOT;
  reg.OpenKey('CLSID\',false);
  if not reg.KeyExists('{0D53A3E8-E51A-49C7-944E-E72A2064F938}') then
    reg.CreateKey('{0D53A3E8-E51A-49C7-944E-E72A2064F938}');

  reg.OpenKey('{0D53A3E8-E51A-49C7-944E-E72A2064F938}',false);
  reg.WriteString('','ElectroSoftware.ComSincronizar');

  if not reg.KeyExists('InprocServer32') then
    reg.CreateKey('InprocServer32');

  reg.OpenKey('InprocServer32\',false);
  reg.WriteString('','mscoree.dll');
  reg.WriteString('Class','ElectroSoftware.ComSincronizar');
  reg.WriteString('Assembly','Sincronizar, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null');
  reg.CloseKey;
  reg.Free;
end;

function VerificarConexionDispositivoMovil: boolean;
var con:ComSincronizarInterface;
begin
  RegistrarSincronizarMovil;
  result:=false;
  con:=createComobject(CLASS_ComSincronizar) as ComSincronizarInterface;
  result:=false;
  try
    if con.Verificar_Conexi_n then
     result:=true;
  except
  end;
end;

Function CrearEventoDistribucionReporte(TipoEvento,TipoElemento:Integer; PintadoApoyo,Llave1Elemento,Llave2Elemento:String;Fecha:String=''): String;
Var
   CrearEvento : TCrearEventoDistribucionTipoEventoReporte;
   Handle   : THandle;
Begin
  Handle := LoadLibrary('Interrupcion.pgi');
  If Handle = 0 then
     ShowMessage('No cargo la libreria');
  result := '';
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Interrupcion.pgi');
    @CrearEvento := GetProcAddress(Handle, 'CrearEventoDistribucionReporte');
    if @CrearEvento <> nil then
       result := CrearEvento(TipoEvento,TipoElemento,PintadoApoyo,Llave1Elemento,Llave2Elemento,Fecha)
    else
       Application.MessageBox('No cargo la Funcion', 'Error', MB_OK);
  End;
end;

Function CrearEventoCierreDistribucionReporte(CodigoEventoApertura:String;TipoEvento,TipoElemento:Integer; PintadoApoyo,Llave1Elemento,Llave2Elemento:String;
         TipoElementoFalla,CodCausa,Just,PintadoApoyoFalla,Llave1ElementoFalla,Llave2ElementoFalla:String;Fecha:String=''):String;
Var
   CrearEventoCierre : TCrearEventoCierreDistribucionTipoEventoReporte;
   Handle   : THandle;
Begin
  Handle := LoadLibrary('Interrupcion.pgi');
  If Handle = 0 then
     ShowMessage('No cargo la libreria');
  result := '';
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Interrupcion.pgi');
    @CrearEventoCierre := GetProcAddress(Handle, 'CrearEventoCierreDistribucionReporte');
    if @CrearEventoCierre <> nil then
       result := CrearEventoCierre(CodigoEventoApertura,TipoEvento,TipoElemento,PintadoApoyo,Llave1Elemento,Llave2Elemento,TipoElementoFalla,CodCausa,Just,PintadoApoyoFalla,Llave1ElementoFalla,Llave2ElementoFalla,Fecha)
    else
       Application.MessageBox('No cargo la Funcion', 'Error', MB_OK);
  End;
end;

Function EditarAperturaDistribucionReporte(CodigoEvento,TipoElemento: integer;PintadoApoyo,Llave1Elemento:String;Fecha:String=''):String;
Var
   EditarEventoapertura : TEditarEventoAperturaDistribucionTipoEventoReporte;
   Handle   : THandle;
Begin
  Handle := LoadLibrary('Interrupcion.pgi');
  If Handle = 0 then
     ShowMessage('No cargo la libreria');
  result := '';
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Interrupcion.pgi');
    @EditarEventoApertura := GetProcAddress(Handle, 'EditarEventoAperturaDistribucionReporte');
    if @EditarEventoApertura <> nil then
       result := EditarEventoApertura(CodigoEvento,TipoElemento,PintadoApoyo,Llave1Elemento,Fecha)
    else
       Application.MessageBox('No cargo la Funcion', 'Error', MB_OK);
  End;
end;

Function EditarCierreDistribucionReporte(CodigoEvento: integer;CodCausa,Just:String):String;
Var
   EditarEventoCierre : TEditarEventoCierreDistribucionTipoEventoReporte;
   Handle   : THandle;
Begin
  Handle := LoadLibrary('Interrupcion.pgi');
  If Handle = 0 then
     ShowMessage('No cargo la libreria');
  result := '';
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Interrupcion.pgi');
    @EditarEventoCierre := GetProcAddress(Handle, 'EditarEventoCierreDistribucionReporte');
    if @EditarEventoCierre <> nil then
       result := EditarEventoCierre(CodigoEvento,CodCausa,Just)
    else
       Application.MessageBox('No cargo la Funcion', 'Error', MB_OK);
  End;
end;

Function BorrarEventoAdmin(CodigoEvento:String):Boolean;
Var
   BorrarEvento : TBorrarEventoAdmin;
   Handle   : THandle;
Begin
  Handle := LoadLibrary('Interrupcion.pgi');
  If Handle = 0 then
     ShowMessage('No cargo la libreria');
  result := False;
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Interrupcion.pgi');
    @BorrarEvento := GetProcAddress(Handle, 'BorrarEvento');
    if @BorrarEvento <> nil then
       result := BorrarEvento(CodigoEvento)
    else
       Application.MessageBox('No cargo la Funcion', 'Error', MB_OK);
  End;
end;

//******************** CLIENTE SFTP ******************************************//

function ConectarA_SFTP(Servidor, Puerto, Usuario, Contrasena: String; MostrarMensajes: Boolean = True; MostrarProgreso: Boolean = True): Boolean;
Var
   GetQuery : TConectarA_SFTP;
   Handle   : THandle;
Begin
  Handle := SafeLoadLibrary('ClienteSFTP.dll');
  If Handle = 0
    then ShowMessage('No cargo la libreria ClienteSFTP.dll');

  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'ConectarA_SFTP');
    if @GetQuery <> nil then
      result:= GetQuery(Servidor, Puerto, Usuario, Contrasena, MostrarMensajes, MostrarProgreso)
    else
      ShowMessage('No cargo la Funcion');
  End;
End;

function BajarArchivo_SFTP(RutaCompletaArchivoRemoto, CarpetaDestino: String; Sobrescribir: Boolean = False; MostrarMensajes: Boolean = True; MostrarProgreso: Boolean = True): Boolean;
Var
   GetQuery : TBajarArchivo_SFTP;
   Handle   : THandle;
Begin
  Handle := SafeLoadLibrary('ClienteSFTP.dll');
  If Handle = 0
    then ShowMessage('No cargo la libreria ClienteSFTP.dll');

  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'BajarArchivo_SFTP');
    if @GetQuery <> nil then
      result:= GetQuery(RutaCompletaArchivoRemoto, CarpetaDestino, Sobrescribir, MostrarMensajes, MostrarProgreso)
    else
      ShowMessage('No cargo la Funcion');
  End;
End;

function SubirArchivo_SFTP(RutaCompletaArchivoLocal, CarpetaDestino: String; Sobrescribir: Boolean = False; MostrarMensajes: Boolean = True; MostrarProgreso: Boolean = True): Boolean;
Var
   GetQuery : TSubirArchivo_SFTP;
   Handle   : THandle;
Begin
  Handle := SafeLoadLibrary('ClienteSFTP.dll');
  If Handle = 0
    then ShowMessage('No cargo la libreria ClienteSFTP.dll');

  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'SubirArchivo_SFTP');
    if @GetQuery <> nil then
      result:= GetQuery(RutaCompletaArchivoLocal, CarpetaDestino, Sobrescribir, MostrarMensajes, MostrarProgreso)
    else
      ShowMessage('No cargo la Funcion');
  End;
End;

function CrearDirectorio_SFTP(NombreDirectorio: String): Boolean;
Var
   GetQuery : TCrearDirectorio_SFTP;
   Handle   : THandle;
Begin
  Handle := SafeLoadLibrary('ClienteSFTP.dll');
  If Handle = 0
    then ShowMessage('No cargo la libreria ClienteSFTP.dll');

  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'CrearDirectorio_SFTP');
    if @GetQuery <> nil then
      result:= GetQuery(NombreDirectorio)
    else
      ShowMessage('No cargo la Funcion');
  End;
End;

function BorrarDirectorio_SFTP(NombreDirectorio: String): Boolean;
Var
   GetQuery : TBorrarDirectorio_SFTP;
   Handle   : THandle;
Begin
  Handle := SafeLoadLibrary('ClienteSFTP.dll');
  If Handle = 0
    then ShowMessage('No cargo la libreria ClienteSFTP.dll');

  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'BorrarDirectorio_SFTP');
    if @GetQuery <> nil then
      result:= GetQuery(NombreDirectorio)
    else
      ShowMessage('No cargo la Funcion');
  End;
End;

function ExisteArchivo_SFTP(RutaCompletaArchivoRemoto: String): Boolean;
Var
   GetQuery : TExisteArchivo_SFTP;
   Handle   : THandle;
Begin
  Handle := SafeLoadLibrary('ClienteSFTP.dll');
  If Handle = 0
    then ShowMessage('No cargo la libreria ClienteSFTP.dll');

  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'ExisteArchivo_SFTP');
    if @GetQuery <> nil then
      result:= GetQuery(RutaCompletaArchivoRemoto)
    else
      ShowMessage('No cargo la Funcion');
  End;
End;

procedure Desconectar_SFTP();
Var
   GetQuery : TDesconectar_SFTP;
   Handle   : THandle;
Begin
  Handle := SafeLoadLibrary('ClienteSFTP.dll');
  If Handle = 0
    then ShowMessage('No cargo la libreria ClienteSFTP.dll');

  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'Desconectar_SFTP');
    if @GetQuery <> nil then GetQuery()
    else
      ShowMessage('No cargo la Funcion');
  End;
End;

function BorrarArchivo_SFTP(RutaCompletaArchivoRemoto: String; MostrarMensajes: Boolean = True): Boolean;
Var
   GetQuery : TBorrarArchivo_SFTP;
   Handle   : THandle;
Begin
  Handle := SafeLoadLibrary('ClienteSFTP.dll');
  If Handle = 0
    then ShowMessage('No cargo la libreria ClienteSFTP.dll');

  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'BorrarArchivo_SFTP');
    if @GetQuery <> nil then
      result:= GetQuery(RutaCompletaArchivoRemoto, MostrarMensajes)
    else
      ShowMessage('No cargo la Funcion');
  End;
End;
//********************** FIN CLIENTE SFTP ************************************//

Function GetQueryFiltroODTHija(ListaRotulo, ListaDato, ListaFrom : TStringList; CIA: String): TStringList;
Var
   GetQuery : TGetQueryFiltroODTHija;
   Handle   : THandle;
Begin
  Result := Nil;
  Handle := LoadLibrary('Filtros.pgi');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetQueryFiltroODTHija');
    if @GetQuery <> nil
    then Result := GetQuery(ListaRotulo, ListaDato, ListaFrom, CIA);
  End;
End;

function GetDatosCuenta390(pCodigoCuenta : string; sResultado: PChar; var BufLen: Word) : Boolean;
Var
   GetQuery : TGetDatosCuenta390;
   Handle   : THandle;
Begin
  Handle := LoadLibrary('ConnSQLServer390.dll');
  If Handle = 0
    then ShowMessage('No cargo la libreria ConnSQLServer390.dll');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GetDatosCuenta390');
    if @GetQuery <> nil then
      result:= GetQuery(pCodigoCuenta, sResultado, BufLen)
    else
        ShowMessage('No cargo la Funcion GetDatosCuenta390');
  end;
end;

Function MostrarGrupoItinerario(sCodigoGrupoAOL, sCodRuta, sCodGrupoIti: string):Boolean;
var
   VerGI : TMostrarGrupoItinerario;
   Handle   : THandle;
Begin
  MostrarMapa;
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @VerGI := GetProcAddress(Handle, 'MostrarGrupoItinerario');
      if @VerGI <> nil then
        VerGI(sCodigoGrupoAOL, sCodRuta, sCodGrupoIti);
    end
    else   ShowMessage('No cargó la Funcion MostrarGrupoItinerario del modulo de Cartografia.');
  finally
    FreeLibrary(Handle);
  end;
end;

Function MostrarGrupoItinerarioReparto(sFechaReparto,CodigoSedeOperativa: string):Boolean;
var
   VerGI : TMostrarGrupoItinerarioReparto;
   Handle   : THandle;
Begin
  MostrarMapa;
  Result := True;
  Handle := SafeLoadLibrary('Cartografia.pgi');
  try
    if Handle <> 0 then
    begin
      @VerGI := GetProcAddress(Handle, 'MostrarItinerarioReparto');
      if @VerGI <> nil then
        VerGI(sFechaReparto, CodigoSedeOperativa);
    end
    else   ShowMessage('No cargó la Funcion MostrarGrupoItinerarioReparto del modulo de Cartografia.');
  finally
    FreeLibrary(Handle);
  end;
end;


function VerCalendarioLecturas(pUsuario,pContrasena,pServidor,pEsquema:string): Boolean;
var
    Handle   : THandle;
    VerCaln: TVerCalendarioLecturas;
Begin
  result := False;

  Handle := LoadLibrary('calnlectsgc.dll');
  if Handle = 0 then
     ShowMessage('No cargó la libreria calnlectsgc.dll');

  if Handle <> 0 then
  begin
    @VerCaln := GetProcAddress(Handle, 'VerCalendarioDeLecturas');
    if @VerCaln <> nil then
    begin
      with Application do
      begin
       NormalizeTopMosts;
       RestoreTopMosts;
       result := VerCaln(pUsuario,pContrasena,pServidor,pEsquema);
      end;
    end
    else
      ShowMessage('No cargó la Funcion VerCalendarioDeLecturas de calnlectsgc.dll');
  end;
End;

Function GenerarQR(Texto:string;Margen : integer = 4; TamanoPixel : integer = 3;NivelError : Integer = 0):HBitmap;
Var
   GetQuery : TGenerarQR;
   Handle   : THandle;
Begin
  Handle := LoadLibrary('GenerarQR.dll');
  if Handle <> 0 then
  begin
    @GetQuery := GetProcAddress(Handle, 'GenerarQRbmp');
    if @GetQuery <> nil then
    Begin
      result:=GetQuery(Texto,Margen,TamanoPixel,NivelError);
    End
    else
      ShowMessage('No cargo la Funcion GenerarQRbmp en GenerarQR.dll');
  end
  else
    ShowMessage('No encontro GenerarQR.dll');
End;

function ImprimirMapaItinerario(NombreCapa: string): Boolean;
Var
   GetMapa : TImprimirMapaItinerario;
   Handle   : THandle;
Begin
  Handle := LoadLibrary('Cartografia.pgi');
  If Handle = 0 then
    ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Cartografia.pgi');
    @GetMapa := GetProcAddress(Handle, 'ImprimirCapa');
    if @GetMapa <> nil then
      GetMapa(NombreCapa)
    else
      ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('Cartografia.pgi');
  End;
end;

function GetItinerarioCapa(q:TQuery; Llave,Render:string; Tamano:Integer=2; Color:Integer=$00FFFF00; doZoom:Boolean=True; NombreCapa:string=''):Boolean;
Var
   GetFiltro : TGetItinerarioCapa;
   Handle   : THandle;
Begin
  Handle := LoadLibrary('Cartografia.pgi');
  If Handle = 0 then  ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin
    ModPlugIns.LoadModulo('Cartografia.pgi');
    @GetFiltro := GetProcAddress(Handle, 'GetItinerarioCapa');
    if @GetFiltro <> nil then
    Begin
      GetFiltro(q, Llave, Render, Tamano, Color, doZoom, NombreCapa);
    End
    Else ShowMessage('No cargo la Funcion');
    ModPlugIns.UnLoadModulo('Cartografia.pgi');
  End;
end;


function GetItinerariosConBackup(FileName: string): String;
Var
   GetCarpetas : TItinerarioEnFTP;
   Handle   : THandle;
Begin
  Handle := SafeLoadLibrary('Servicios.dll');
  If Handle = 0 then
    ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin

    @GetCarpetas := GetProcAddress(Handle, 'ListarCarpetas');
    if @GetCarpetas <> nil then
    Result :=   GetCarpetas(PWideChar(WideString(FileName)))
    else
      ShowMessage('No cargo la Funcion');

  End;
end;
Function AbrirMaestroRespuestas: Boolean;
var
GetMaestro : TMostrarMaestroRespuestas;
   Handle   : THandle;
begin

Handle := SafeLoadLibrary('Maestros.pgi');
  try
  if Handle <> 0 then
  begin
    @GetMaestro := GetProcAddress(Handle, 'GetRespuestas');
    if @GetMaestro <> nil
    then GetMaestro;
    result :=true;
  End;
  finally
    FreeLibrary(Handle);
  end;

end;
Function AbrirMaestroCategorias: Boolean;
var
GetMaestro : TMostrarMaestroCategorias;
   Handle   : THandle;
begin

Handle := SafeLoadLibrary('Maestros.pgi');
  try
  if Handle <> 0 then
  begin
    @GetMaestro := GetProcAddress(Handle, 'GetCategorias');
    if @GetMaestro <> nil
    then GetMaestro;
    result :=true;
  End;
  finally
    FreeLibrary(Handle);
  end;

end;

function GetArchivosItinerariosConBackup(FileName: string): String;
Var
   GetArchivos : TItinerarioArchivosFTP;
   Handle   : THandle;
Begin
  Handle := SafeLoadLibrary('Servicios.dll');
  If Handle = 0 then
    ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin

    @GetArchivos := GetProcAddress(Handle, 'ListarArchivos');
    if @GetArchivos <> nil then
    Result :=   GetArchivos(PWideChar(WideString(FileName)),PWideChar(WideString('json')))
    else
      ShowMessage('No cargo la Funcion');

  End;
end;



function UpLoadFotos(FileNameLocal,FileNameFTP: string): String;
Var
   GetArchivos : TFotosArchivosFTP;
   Handle   : THandle;
Begin
  Handle := SafeLoadLibrary('Servicios.dll');
  If Handle = 0 then
    ShowMessage('No cargo la libreria');
  if Handle <> 0 then
  begin

    @GetArchivos := GetProcAddress(Handle, 'CargarArchivo');
    if @GetArchivos <> nil then
    Result :=   GetArchivos(PWideChar(WideString(FileNameLocal)),PWideChar(WideString(FileNameFTP)))
    else
      ShowMessage('No cargo la Funcion');

  End;
end;
 function GetFiltroReparto(ListaRotulo, ListaDato, ListaFrom :TStringList): TStringList;
var
GetQuery: TGetFiltroReparto;
Handle : THandle;
begin
Result:=nil;
Handle := LoadLibrary('Filtros.pgi');
if Handle <> 0 then
   begin
   @GetQuery:= GetProcAddress( Handle,'GetFiltroReparto');
   if @GetQuery <> nil
   then Result := GetQuery(ListaRotulo,ListaDato,ListaFrom);
   end;
end;
 function GetFiltroSupervisionODS(ListaRotulo, ListaDato, ListaFrom :TStringList): TStringList;
var
GetQuery: tGetFiltroSupervisionODS;
Handle : THandle;
begin
Result:=nil;
Handle := LoadLibrary('Filtros.pgi');
if Handle <> 0 then
   begin
   @GetQuery:= GetProcAddress( Handle,'GetFiltroSupervisionODS');
   if @GetQuery <> nil
   then Result := GetQuery(ListaRotulo,ListaDato,ListaFrom);
   end;
end;
function GetQueryFiltroIlegales(ListaRotulo, ListaDato, ListaFrom :TStringList): TStringList;
var
GetQuery: TGetQueryFiltroIlegales;
Handle : THandle;
begin
Result:=nil;
Handle := LoadLibrary('Filtros.pgi');
if Handle <> 0 then
   begin
   @GetQuery:= GetProcAddress( Handle,'GetQueryFiltroIlegales');
   if @GetQuery <> nil
   then Result := GetQuery(ListaRotulo,ListaDato,ListaFrom);
   end;
end;

function GetInformacionBackupLecturas(FileName : String ; var CodigoItinerario,FechaLectura,MensajeError : String; var Bandera : Boolean) : String;
Var
   Lecturas : TLecturasItinerario;
   Handle   : THandle;
   Valor,itinerario,Mensaje,Mensaje2,Mensaje3,Codigo : PWideChar;
   Flag : Boolean;
   Comparador : String;
begin

   Valor := PWideChar(WideString(FileName));
  Handle := SafeLoadLibrary('Servicios.dll');
  Mensaje := '';
  try
    if Handle <> 0 then
    begin
      @Lecturas := GetProcAddress(Handle, 'CargarJsonLecturas');
      if @Lecturas <> nil  then
      begin
    Result := Lecturas(Valor,Mensaje,Mensaje2,Mensaje3,Codigo);

    CodigoItinerario :=  Mensaje;
    FechaLectura     :=  Mensaje2;
    MensajeError     :=  Mensaje3;
    Comparador       :=  PWideChar(WideString(Codigo));
    Bandera := False;
    if  Comparador = '1' then
    Bandera := True
    else;

    end;

    End
    Else   ShowMessage('No cargo la Funcion');
  finally
    FreeLibrary(Handle);
  end;


end;


end.


