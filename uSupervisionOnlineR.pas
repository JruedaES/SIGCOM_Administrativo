// ***************************************************************************
// Supervisión Online
 { *
  Formulario para la supervisión en tiempo de real de las lecturas
  realizadas mediante el aplicativo Movil SIGCOM.

  ----------
  Primea versión: 2018/04/20
  Ultima versión :  2018/04/20
  Version : 1.0
  Author: Jorge A. Rueda E.
  --------------------------------------------------

}

// ***************************************************************************
unit uSupervisionOnlineR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls, Mask, RXSplit,
  Menus, MPlayer, ImgList, Registry, ComCtrls, Math, Spin, ToolWin;

type
  TfSupervisionOnlineR = class(TFdSgdListaBase)
    dsListaPadre: TDataSource;
    dsListaLectura: TDataSource;
    Panel5: TPanel;
    dbgListaHijas: TRxDBGrid;
    qGrupoTrabajo: TQuery;
    RxSplitter1: TRxSplitter;
    pmImprimir: TPopupMenu;
    MaterialesConsumidos: TMenuItem;
    ListadodeHorasExtras1: TMenuItem;
    ListadodeOdts1: TMenuItem;
    pmOrdenar: TPopupMenu;
    ListadodeViticosCausados1: TMenuItem;
    ListadodeAuxiliosCausados1: TMenuItem;
    pmExportar: TPopupMenu;
    ExportarListaOdtPadres1: TMenuItem;
    pmImprimirHija: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    AolFinca1: TMenuItem;
    Itinerario1: TMenuItem;
    FechaLectura1: TMenuItem;
    Panel4: TPanel;
    CodigodeCuenta1: TMenuItem;
    Panel8: TPanel;
    RxDBGrid1: TRxDBGrid;
    RxSplitter2: TRxSplitter;
    qprincipal: TQuery;
    dsprincipal: TDataSource;
    qCamposCalculados: TQuery;
    qClases: TQuery;
    qClasesCODIGOCLASE: TStringField;
    qClasesCODIGOANOMALIA: TStringField;
    qClasesDESCRIPCION: TStringField;
    qClasesTIPO: TStringField;
    qClasesREQUIERE_LECTURA: TStringField;
    qClasesFACTURABLE: TStringField;
    qClasesPROMEDIABLE: TStringField;
    qClasesFOTOGRAFIA: TStringField;
    qClasesOBSERVACION: TStringField;
    qClasesMARCACION: TStringField;
    qClasesUSUARIOCREACION: TFloatField;
    qClasesFECHACREACION: TDateTimeField;
    qClasesUSUARIOMODIFICACION: TFloatField;
    qClasesFECHAMODIFICACION: TDateTimeField;
    qClasesESTADO: TStringField;
    qClasesPARAMETRIZACION: TStringField;
    Panel9: TPanel;
    Panel11: TPanel;
    lDetalleSuministros: TLabel;
    qTotal: TQuery;
    Label1: TLabel;
    qHoraInicial: TQuery;
    qHoraFinal: TQuery;
    qNombreEstadoItinerario: TQuery;
    Splitter1: TSplitter;
    sbRefrescar: TSpeedButton;
    sbVistaPreliminarVL: TSpeedButton;
    lFechaLectura: TLabel;
    qSupervisor: TQuery;
    qSupervisorCODIGOCOORDINACIONGRUPOTRABAJO: TFloatField;
    qSupervisorNOMBRECOORDINACIONGRUPOTRABAJO: TStringField;
    qSupervisorACTIVO: TStringField;
    qSupervisorCODIGOUSUARIO: TFloatField;
    qSupervisorCODIGOSEDEOPERATIVA: TFloatField;
    qSupervisorCODIGOSEDEOPERATIVA_1: TFloatField;
    qSupervisorNOMBRESEDEOPERATIVA: TStringField;
    qSupervisorACTIVO_1: TStringField;
    qSupervisorCODIGOTIPOSEDE: TFloatField;
    qSupervisorCOLOR: TFloatField;
    pmCerrarItinerario: TPopupMenu;
    Ce1: TMenuItem;
    sbSegundos: TSpinEdit;
    Panel14: TPanel;
    Timer1: TTimer;
    sbRecargar: TSpeedButton;
    sbExportar1: TSpeedButton;
    sbExportar3: TSpeedButton;
    pmExportar2: TPopupMenu;
    MenuItem3: TMenuItem;
    SpinEdit1: TSpinEdit;
    Label19: TLabel;
    StoredProc1: TStoredProc;
    qCamposCalculadosNVLBATERIA: TStringField;
    ReabrirItinerario1: TMenuItem;
    qListaLectura: TQuery;
    SpeedButton1: TSpeedButton;
    qprincipalLOGIN: TStringField;
    qprincipalNOMBRESEDEOPERATIVA: TStringField;
    qprincipalCOLOR: TFloatField;
    qprincipalCODIGOITINERARIO: TFloatField;
    qprincipalNOMBREESTADOITINERARIO: TStringField;
    qprincipalNOMBREGRUPOTRABAJO: TStringField;
    qprincipalCODIGOESTADOITINERARIO: TFloatField;
    qprincipalFECHAPRIMERAREPARTO: TDateTimeField;
    qprincipalFECHAULTIMOREPARTO: TDateTimeField;
    qprincipalTOTALREPARTIDOS: TFloatField;
    qprincipalCANTIDAD: TFloatField;
    qprincipalPORCENTAJEAVANCE: TStringField;
    qListaLecturaCODIGOCUENTA: TFloatField;
    qListaLecturaFECHA_PROGRAMADA_REPARTO: TDateTimeField;
    qListaLecturaNOMBRE: TStringField;
    qListaLecturaNOMBRESUSCRIPTOR: TStringField;
    qListaLecturaDIRECCION: TStringField;
    qListaLecturaDIRECCIONSUSCRIPTOR: TMemoField;
    qListaLecturaFECHAENTREGA: TDateTimeField;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ImageList1: TImageList;
    qprincipalCLIENTESDEVUELTOS: TFloatField;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure SBImprimirClick(Sender: TObject);
    procedure SBOrdenarClick(Sender: TObject);
    procedure sbRefrescarClick(Sender: TObject);
    procedure ExportarListaOdtPadres1Click(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure SBBuscaElementoCartografiaClick(Sender: TObject);
    procedure Itinerario1Click(Sender: TObject);
    procedure FechaLectura1Click(Sender: TObject);
    procedure sbVistaPreliminarVLClick(Sender: TObject);
    procedure CargarVistaPreliminar(CodApoyo: string);
    procedure CodigodeCuenta1Click(Sender: TObject);
    procedure qprincipalCalcFields(DataSet: TDataSet);
    procedure qListaLecturaAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure Ce1Click(Sender: TObject);
    procedure sbRecargarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qprincipalAfterScroll(DataSet: TDataSet);
    procedure sbExportar3Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure ReabrirItinerario1Click(Sender: TObject);
    procedure qListaLecturaAfterScroll(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure qprincipalAfterOpen(DataSet: TDataSet);
    procedure sbAuditoriaClick(Sender: TObject);
    procedure qListaLecturaCalcFields(DataSet: TDataSet);
    procedure ToolButton1Click(Sender: TObject);

  private
    gSLLista, gSLListaRotulos, gSLListaDatos, gSLListaFrom: TStringList;
    ListaDireccionCampos: TStringList;
  public
    sCriterio: String;
    Lista, ListaEstadistica, ListaFrom,ListaOrden: TStringList;
    VerFiltro: boolean;
    GrupodeTrabajo: integer;
    procedure Filtrar;
    procedure LimpiarFiltro;
    function FormatoFecha(aFecha: TField): string;
    Procedure HabilitarBotones(Bandera: boolean);
    Procedure CargarInfoItinerario;
    function CodigoSupervisor(CodSuper: String): String;
    function ValidarListadoItinerarios : Boolean;
    function InactivarClienteDelItinerarioExportado (CodigoItinerario : String; var clientesExportados : String) : Boolean;
    function ActualizarListadoDeTotalesPorItinerario (CodigoItinerario, ClientesExportado : String): Boolean;
    procedure ActualizarEstadoClientesListado(CodigoItinerario : String);
    function consultarEstadoItinerario (CodigoItinerario : String ) : Boolean;
    function ValidarEstadoItinerarioGeneral: Boolean;
  end;

var
  fSupervisionOnlineR: TfSupervisionOnlineR;

implementation

uses uODTUrbanaRural, uElementosAsociadosODT, uCartografiaReportes,
  uFIMPComunes, uODTPadre, uQRIndicexMaterialResumen, uQRListaODTHorasExtras,
  uComunesAdministrativo, uQRListadoODT, uBuscarOdt, uEstadisticaOdt,
  uQRListaODTViaticos, uQRListaODTAuxilios, DecisionCubeBugWorkaround,
  ConsDll, uFuncionSGD, uQRODTHija, uQRODTHijaTodas, uBuscarOdtHija,
  uFIMPAdministrativo, uVistaPreliminarVL, uGaleriaPreliminar,
  uAnalisisFacturacion, uFormaEspere,UFiltrarclave, uAuditoriaSupervisor;

{$R *.DFM}

function TfSupervisionOnlineR.FormatoFecha(aFecha: TField): string;
begin
  Result := FormatDateTime('mm/dd/yyyy hh:mm:ss', aFecha.AsDateTime);
end;

procedure TfSupervisionOnlineR.FormDestroy(Sender: TObject);
begin
  ListaFrom.Free;
  ListaEstadistica.Free;
  gSLLista.Free;
  gSLListaRotulos.Free;
  gSLListaDatos.Free;
  gSLListaFrom.Free;

  if Assigned(fVistaPreliminarVL) then
  begin
    fVistaPreliminarVL.Free;
    fVistaPreliminarVL := nil;
  end;
  inherited;
end;

procedure TfSupervisionOnlineR.FormShow(Sender: TObject);
begin
  { inherited;
    ListadodeHorasExtras1.visible:=not(ProcManager.CanProcExecute('_Ocultar Odt Extras'))or (varcodigousuario=0);
    ListadodeViticosCausados1.visible:=not(ProcManager.CanProcExecute('_Ocultar Odt Viaticos/Auxilios'))or (varcodigousuario=0);
    ListadodeAuxiliosCausados1.visible:=not(ProcManager.CanProcExecute('_Ocultar Odt Viaticos/Auxilios'))or (varcodigousuario=0); }
  Filtrar;
  WindowState := wsMaximized;
  IF qprincipal.Active THEN
lFiltroDatos.Caption := '<< FILTRO DE DATOS ' + IntToStr(qprincipal.RecordCount) + ' Registros  >> ';
end;

procedure TfSupervisionOnlineR.FormCreate(Sender: TObject);
begin
  inherited;
   ListaFrom := TStringList.Create;
  ListaEstadistica := TStringList.Create;
  ListaDatos := TStringList.Create;
  ListaRotulos := TStringList.Create;
  ListaOrden := TStringList.Create;
  {ListaDireccionCampos := TStringList.Create;
  ListaDireccionCampos.Add('CODIGOODT=-1');
  ListaDireccionCampos.Add('CODIGOADMINISTRATIVO=-1');
  ListaDireccionCampos.Add('FECHAEMISION=-1');
  ListaDireccionCampos.Add('FECHAAPROBACION=-1');
  ListaDireccionCampos.Add('FECHAASIGNACION=-1');
  ListaDireccionCampos.Add('CODIGOESTADOODT=-1');
  ListaDireccionCampos.Add('CODIGOLABOR=-1');
  ListaDireccionCampos.Add('CODIGOPRIORIDAD=-1');
  ListaDireccionCampos.Add('CODIGOTIPOTAREA=-1');      }

  // qprincipal.Open;
  // qListaLectura.Open;
 // qGrupoTrabajo.Open;

  Panel3.Visible := False;
  gSLLista := TStringList.Create;
  gSLListaRotulos := TStringList.Create;
  gSLListaDatos := TStringList.Create;
  gSLListaFrom := TStringList.Create;
end;

procedure TfSupervisionOnlineR.Filtrar;
Var
  CadFrom, s: String;
  Valor: integer;
begin
  Lista := GetQueryFiltroReparto(ListaRotulos, ListaDatos, ListaFrom);
  If Lista <> Nil then
  begin
      qprincipal.close;
      LimpiarFiltro;
      qprincipal.SQl.Strings[40]:=Lista.Text;
      qprincipal.Open;
      qListaLectura.close;
      qListaLectura.Open;

  end;
end;

procedure TfSupervisionOnlineR.LimpiarFiltro;
begin
qprincipal.SQL.strings[40]:= '';
end;

procedure TfSupervisionOnlineR.SBFiltrarClick(Sender: TObject);
begin

  Filtrar;
  inherited;
end;

procedure TfSupervisionOnlineR.SBImprimirClick(Sender: TObject);
var
  punto: TPoint;
begin
  punto := Panel2.ClientToScreen(Classes.Point(sbImprimir.Left,
    sbImprimir.top));
  pmImprimir.Popup(punto.x + 10, punto.y + 10);
end;

procedure TfSupervisionOnlineR.SBOrdenarClick(Sender: TObject);
var
  punto: TPoint;
begin
  punto := Panel2.ClientToScreen(Classes.Point(SBOrdenar.Left, SBOrdenar.top));
  pmOrdenar.Popup(punto.x + 10, punto.y + 10);
end;

procedure TfSupervisionOnlineR.sbRefrescarClick(Sender: TObject);
var
  Marca,Marca2: TBookmark;
begin
  inherited;

  Marca := qprincipal.GetBookmark;

  qprincipal.close;
  qprincipal.Open;
  qprincipal.GotoBookmark(Marca);
  Marca2 := qListaLectura.GetBookmark;
  qListaLectura.close;
  qListaLectura.Open;
end;

procedure TfSupervisionOnlineR.ExportarListaOdtPadres1Click(Sender: TObject);
var
  Query: TQuery;
  Lista1, Lista2: TStringList;
begin
  inherited;
sbVistaPreliminarVL.Down := False;
Panel4.visible:= false;
  fFormaEspere := TfFormaEspere.Create(Application);
  fFormaEspere.ProgressBar1.Max := qprincipal.RecordCount;
  fFormaEspere.lbMotivo.Caption := 'Generando Archivo...';
  fFormaEspere.Show;
  fFormaEspere.Refresh;
  fFormaEspere.ProgressBar1.Position := 1;
  fFormaEspere.Refresh;

  Lista1 := TStringList.Create;
  Lista2 := TStringList.Create;
  qprincipal.AfterScroll := NIL;

  qprincipal.DisableControls;
  qListaLectura.DisableControls;

  Lista2.Clear;
  qprincipal.First;

  fFormaEspere.lbMotivo.Caption := 'Recopilando información...';
  fFormaEspere.ProgressBar1.Position := 3;
  fFormaEspere.Refresh;
  Lista1.Clear;
     Lista1.Add('Codigo Itinerario');
     Lista1.Add('Repartidor');
     Lista1.Add('Cantidad Clientes');
     Lista1.Add('Porcentaje de Avance');
     Lista1.Add('Hora Primera Entrega');
     Lista1.Add('Hora Ultima Entrega');
     Lista1.Add('Estado Itinerario');
     Lista2.add(Lista1.CommaText);


     while not qprincipal.Eof do
     begin
     Lista1.Clear;
     Lista1.Add(qprincipal.fieldByName('CODIGOITINERARIO').AsString);
     Lista1.Add(qprincipal.fieldByName('NOMBREGRUPOTRABAJO').AsString);
     Lista1.Add(qprincipal.fieldByName('CANTIDAD').AsString);
     Lista1.Add(qprincipal.fieldByName('PORCENTAJEAVANCE').AsString);
     Lista1.Add(qprincipal.fieldByName('FECHAPRIMERAREPARTO').AsString);
     Lista1.Add(qprincipal.fieldByName('FECHAULTIMOREPARTO').AsString);
     Lista1.Add(qprincipal.fieldByName('NOMBREESTADOITINERARIO').AsString);
     Lista2.add(Lista1.CommaText);
    fFormaEspere.lbMotivo.Caption := 'Generando datos...';
    fFormaEspere.ProgressBar1.Position :=
      fFormaEspere.ProgressBar1.Position + 1;
    fFormaEspere.Refresh;

    qprincipal.Next;
  end;
  fFormaEspere.Free;

  if SaveDialog1.Execute then
  begin
    Lista2.SaveToFile(SaveDialog1.FileName);

  end;

  qprincipal.EnableControls;
  qListaLectura.EnableControls;
  qprincipal.AfterScroll := qprincipalAfterScroll;
  // qprincipal.OnCalcFields :=qprincipalCalcFields;
  Lista1.Free;
  Lista2.Free;
end;

procedure TfSupervisionOnlineR.sbExportarClick(Sender: TObject);
var
  punto: TPoint;
begin
  punto := Panel2.ClientToScreen(Classes.Point(sbExportar1.Left,
    sbExportar1.top));
  pmExportar.Popup(punto.x + 10, punto.y + 10);
end;

procedure TfSupervisionOnlineR.SBBuscaElementoCartografiaClick(Sender: TObject);
var
  Query, Query2,Query3,qQueryLeido,qQueryExportado: TQuery;
begin
  inherited;

  try
      Query3 := TQuery.Create(nil);
      Query3.DatabaseName := 'BaseDato';
      Query3.SQL.add('SELECT g.codigoruta,g.codigogrupoitinerario,i.color,g.codigogrupoaol FROM SGC_ITINERARIO i, SGC_GRUPOITINERARIO g WHERE CODIGOITINERARIO='+qprincipal.fieldByName
      ('CODIGOITINERARIO').AsString+' and G.CODIGOGRUPOITINERARIO=I.CODIGOGRUPOITINERARIO ');
      Query3.Open;


      qQueryLeido := TQuery.Create(nil);
      qQueryLeido.DatabaseName := 'BaseDato';

      qQueryLeido.SQL.add('SELECT   A.CODIGOAPOYO,A.X AS X,A.Y AS Y,''M'' as Marcado, '''' AS TEXTO FROM SIGCOM_LECTURA S , CLIENTESGD C , APOYO A ');
      qQueryLeido.SQL.add('WHERE S.FECHA_PROGRAMADA=TO_DATE('+QuotedStr(qprincipal.fieldByName('FECHALECTURA').AsString)+',''DD/MM/YYYY'') ');
      qQueryLeido.SQL.add('AND S.CODIGOITINERARIO='+qprincipal.fieldByName('CODIGOITINERARIO').AsString+'        ');
      qQueryLeido.SQL.add('AND sgc_fun_convertir_clave(C.CODIGO_CUENTA)=S.CLAVE  AND A.CODIGOAPOYO=C.CODIGOAPOYO     ');
      qQueryLeido.SQL.add('ORDER BY S.FECHALECTURA');
      qQueryLeido.Open;

      qQueryExportado := TQuery.Create(nil);
      qQueryExportado.DatabaseName := 'BaseDato';

      qQueryExportado.SQL.add('SELECT  DISTINCT A.CODIGOAPOYO,A.X,A.Y,''M'' as Marcado, '''' AS TEXTO ');
      qQueryExportado.SQL.add('FROM SGC_INFOITINERARIO S , CLIENTESGD C , APOYO A  ');
      qQueryExportado.SQL.add('WHERE FECHALECTURA=TO_DATE('+QuotedStr(qprincipal.fieldByName('FECHALECTURA').AsString)+',''DD/MM/YYYY'')  ');
      qQueryExportado.SQL.add('AND CODIGOITINERARIO='+qprincipal.fieldByName('CODIGOITINERARIO').AsString+'    AND A.CODIGOAPOYO=C.CODIGOAPOYO ');
      qQueryExportado.SQL.add('AND sgc_fun_convertir_clave(C.CODIGO_CUENTA)=S.CLAVE  ');
      qQueryExportado.Open;


    Query2 := TQuery.Create(nil);
    Query2.DatabaseName := 'BaseDato';
    Query2.SQl.Add('SELECT CODIGOAPOYO FROM CLIENTESGD WHERE sgc_fun_convertir_clave(CODIGO_CUENTA)=''' +
      qListaLectura.fieldByName('CLAVE').AsString + ''' ');
    Query2.Open;

    if not Query2.IsEmpty then
    begin
        FiltroCapaTemporal(qQueryExportado, 'CODIGOAPOYO', 'Marcado', 1,2,clGray,false,'Itinerario Exportado');
       FiltroCapaTemporal(qQueryLeido, 'CODIGOAPOYO', 'Marcado', 1,2,clLime,true,'Itinerario Leido');
        BuscarApoyo(Query2.fieldByName('CODIGOAPOYO').AsString, False);
        qQueryLeido.close;
        qQueryLeido.open;
        MostrarRuta(qQueryLeido);
    end;

  finally
    Query2.Free;
    Query3.Free;
    qQueryExportado.Free;
    qQueryLeido.Free;
  end;
end;

procedure TfSupervisionOnlineR.Itinerario1Click(Sender: TObject);
begin
  inherited;
  qListaLectura.close;
  qListaLectura.SQl.Delete(9);
  qListaLectura.SQl.Insert(9, 'ORDER BY I.CODIGOITINERARIO');
  qListaLectura.Open;
end;

procedure TfSupervisionOnlineR.FechaLectura1Click(Sender: TObject);
begin
  inherited;
  qListaLectura.close;
  qListaLectura.SQl.Delete(9);
  qListaLectura.SQl.Insert(9, 'ORDER BY FECHALECTURA');
  qListaLectura.Open;
end;

procedure TfSupervisionOnlineR.sbVistaPreliminarVLClick(Sender: TObject);
var
  Registro: TRegIniFile;
  i: integer;
begin
  IF sbVistaPreliminarVL.Down = true then
  Begin
    Panel4.Visible := true;
    CargarVistaPreliminar(qListaLectura.fieldByName('CODIGOCUENTA').AsString);
  end
  else
    Panel4.Visible := False;
end;

procedure TfSupervisionOnlineR.CargarVistaPreliminar(CodApoyo: string);
var
  CodigoApoyo: string;
  i: integer;
begin
  CodigoApoyo := qListaLectura.fieldByName('CODIGOCUENTA').AsString;
  if CodigoApoyo <> '' then
  begin
   if  not Assigned(fGaleriaPreliminar) then
           begin
    fGaleriaPreliminar := TfGaleriaPreliminar.CreateByparametros(Application,CodigoApoyo);
    fGaleriaPreliminar.FechaLectura := lFechaLectura.Caption;
    fGaleriaPreliminar.BanderaReparto:= TRUE;
    fGaleriaPreliminar.CoolBar3.Bands[0].Text := 'Fotos Reparto';
    fGaleriaPreliminar.TipoDeFoto := '23';
    end
           else
           begin
             fGaleriaPreliminar.Align :=alClient;
             fGaleriaPreliminar.FechaLectura := lFechaLectura.Caption;
             fGaleriaPreliminar.TipoDeFoto := '23';
            fGaleriaPreliminar.MostrarVistaPreliminar(CodigoApoyo);
           end;
    fGaleriaPreliminar.ManualDock(Panel4);
    fGaleriaPreliminar.Show;
     fGaleriaPreliminar.Zommer1.Caption := 'Foto de Reparto ';
  end;
end;

procedure TfSupervisionOnlineR.CodigodeCuenta1Click(Sender: TObject);
begin
  inherited;
  qListaLectura.close;
  qListaLectura.SQl.Delete(9);
  qListaLectura.SQl.Insert(9, 'ORDER BY CLAVE');
  qListaLectura.Open;
end;

procedure TfSupervisionOnlineR.qprincipalCalcFields(DataSet: TDataSet);
var
  Cantidad: integer;
begin
  inherited;
try
  qprincipalPORCENTAJEAVANCE.AsString :=
      FloatToStr( ((qprincipalTOTALREPARTIDOS.AsInteger
      +qprincipalCLIENTESDEVUELTOS.AsInteger) * 100) / qprincipalCANTIDAD.AsInteger);

 Except
qprincipalPORCENTAJEAVANCE.AsString := '0';
 end;
end;

procedure TfSupervisionOnlineR.qListaLecturaAfterOpen(DataSet: TDataSet);
begin
lDetalleSuministros.Caption := ' Detalle : Clientes repartidos en  Itinerario '+qprincipalTOTALREPARTIDOS.AsString;
lFechaLectura.Caption := qListalecturaFECHA_PROGRAMADA_REPARTO.asstring;
end;

procedure TfSupervisionOnlineR.RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor);
begin
  inherited;
  if Field.Text = 'EXPORTADO' then
  begin
    Background := clAqua;
  end;

  if Field.Text = 'DESCARGADO' then
  begin
    Background := clYellow;
  end;

  if Field.Text = 'EN EJECUCIÓN' then
  begin
    Background := clLime;
  end;

  if Field.Text = 'TERMINADO' then
  begin
    Background := clRed;
  end;
end;

procedure TfSupervisionOnlineR.Ce1Click(Sender: TObject);
var
  qUpdate: TQuery;
  buttonSelected: integer;
  Book: TBookmark;
begin
  inherited;
  buttonSelected := messagedlg('Esta seguro que desea CERRAR el itinerario : ' +
    qprincipalCODIGOITINERARIO.AsString, mtConfirmation, [mbOK, mbCancel], 0);

  if buttonSelected = 1 then
  begin
    try

      qUpdate := TQuery.Create(nil);
      qUpdate.DatabaseName := 'BaseDato';

      Book := qprincipal.GetBookmark;

      qUpdate.SQl.Add
        ('UPDATE SGC_ITINERARIO SET CODIGOESTADOITINERARIO=''7'' WHERE CODIGOITINERARIO='
        + qprincipalCODIGOITINERARIO.AsString + ' ');
      qUpdate.ExecSQL;

      if qUpdate.RowsAffected > 0 then
      begin
        messagedlg('Se ha cambiado el estado al itinerario : ' +
          qprincipalCODIGOITINERARIO.AsString, mtInformation, [mbOK], 0);

        qprincipal.close;
        qprincipal.Open;
        qprincipal.GotoBookmark(Book);
      end;
    Except
      on E: Exception do
      begin
        messagedlg('No ha sido posible cambiar el estado del itinerario.',
          mtError, [mbOK], 0);
        qUpdate.Free;
      end;

    end;
    qUpdate.Free;
  end;
end;

procedure TfSupervisionOnlineR.sbRecargarClick(Sender: TObject);
begin
  inherited;
  if sbRecargar.Down then
  begin
  sbVistaPreliminarVL.Down := False;
   Panel4.visible:= false;
    Timer1.Enabled := true;
    Timer1.Interval := (sbSegundos.Value) * 1000;
    sbSegundos.Enabled := False;
    HabilitarBotones(False);
  end
  else
  begin
    sbSegundos.Enabled := true;
    Timer1.Enabled := False;
    HabilitarBotones(true);
  end;
end;

procedure TfSupervisionOnlineR.Timer1Timer(Sender: TObject);
begin
  inherited;
  IF sbRecargar.Down then
  begin
    fFormaEspere := TfFormaEspere.Create(Application);
    fFormaEspere.ProgressBar1.Max := 4;
    fFormaEspere.lbMotivo.Caption := 'Recargando Información...';
    fFormaEspere.Show;
    fFormaEspere.Refresh;
    fFormaEspere.ProgressBar1.Position := 1;
    fFormaEspere.Refresh;
    sbRefrescarClick(Sender);
    fFormaEspere.lbMotivo.Caption := 'Terminando...';
    fFormaEspere.ProgressBar1.Position := 4;
    fFormaEspere.Refresh;
    fFormaEspere.Free;

  end
  else
  begin
    Timer1.Enabled := False;
    sbSegundos.Enabled := true;
    HabilitarBotones(true);
  end;
end;

procedure TfSupervisionOnlineR.HabilitarBotones(Bandera: boolean);
begin
  sbRefrescar.Enabled := Bandera;
  SBFiltrar.Enabled := Bandera;
  SBBuscaElementoCartografia.Enabled := Bandera;
  SBSalir.Enabled := Bandera;
  sbVistaPreliminarVL.Enabled:= Bandera;
  ToolButton1.enabled:= Bandera;
  sbExportar1.enabled:=Bandera;
end;

procedure TfSupervisionOnlineR.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if Assigned(fGaleriaPreliminar) then
  begin
    fGaleriaPreliminar.Free;
    fGaleriaPreliminar := nil;
  end;

end;

procedure TfSupervisionOnlineR.qprincipalAfterScroll(DataSet: TDataSet);
begin
  inherited;
  IF not qprincipal.IsEmpty then
  begin
  //lDetalleSuministros.Caption := ' Suministros leidos en  Itinerario '+ IntToStr(qListaLectura.RecordCount);
   end;
end;
procedure TfSupervisionOnlineR.sbExportar3Click(Sender: TObject);
var
  punto: TPoint;
begin
  inherited;
  punto := Panel11.ClientToScreen(Classes.Point(sbExportar3.Left,
    sbExportar3.top));
  pmExportar2.Popup(punto.x + 10, punto.y + 10);
end;

procedure TfSupervisionOnlineR.MenuItem3Click(Sender: TObject);
var
  qTEmp: TQuery;
begin
  inherited;
  sbVistaPreliminarVL.Down := False;
  Panel4.visible:= false;
  qTemp:= TQuery.Create(nil);
  qTemp.Databasename := 'BaseDato';
  qTemp.SQL.AddStrings(qListalectura.SQL);
  qTemp.ParamByName('codigoitinerario').AsString := qprincipalCODIGOITINERARIO.AsString;
  qTemp.Open;

  if SaveDialog1.Execute then
  begin
    //dsListaLectura.DataSet.DisableControls;
    //qListalecturaDIRECCION.Value := '';
    CVS1.DataSet := qTemp;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    //dsListaLectura.DataSet.EnableControls;
  end;
  qTemp.Close;
  qTemp.Free;
end;

procedure TfSupervisionOnlineR.ReabrirItinerario1Click(Sender: TObject);
var
  qUpdate: TQuery;
  buttonSelected: integer;
  Book: TBookmark;
begin
  inherited;
  buttonSelected := messagedlg('Esta seguro que desea REABRIR el itinerario : '
    + qprincipalCODIGOITINERARIO.AsString, mtConfirmation, [mbOK, mbCancel], 0);

  if buttonSelected = 1 then
  begin
    try

      qUpdate := TQuery.Create(nil);
      qUpdate.DatabaseName := 'BaseDato';

      Book := qprincipal.GetBookmark;

      qUpdate.SQl.Add
        ('UPDATE SGC_ITINERARIO SET CODIGOESTADOITINERARIO=''5'' WHERE CODIGOITINERARIO='
        + qprincipalCODIGOITINERARIO.AsString + ' ');
      qUpdate.ExecSQL;

      if qUpdate.RowsAffected > 0 then
      begin
        messagedlg('Se ha cambiado el estado al itinerario : ' +
          qprincipalCODIGOITINERARIO.AsString, mtInformation, [mbOK], 0);

        qprincipal.close;
        qprincipal.Open;
        qprincipal.GotoBookmark(Book);
      end;
    Except
      on E: Exception do
      begin
        messagedlg('No ha sido posible cambiar el estado del itinerario.',
          mtError, [mbOK], 0);
        qUpdate.Free;
      end;

    end;
    qUpdate.Free;
  end;

end;

procedure TfSupervisionOnlineR.qListaLecturaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  IF Panel4.Visible THEN
  BEGIN
    fGaleriaPreliminar := NIL;
    fGaleriaPreliminar.Free;
   CargarVistaPreliminar(qListaLectura.fieldByName('CODIGOCUENTA').AsString);
  end;
end;

procedure TfSupervisionOnlineR.SpeedButton1Click(Sender: TObject);
var
filtro: TffiltrarClave;
begin
  inherited;
  filtro := TffiltrarClave.Create(Self);
  if filtro.ShowModal = mrOk then
  begin

   IF not qListaLectura.IsEmpty then
  begin
   qListaLectura.Locate('CODIGOCUENTA',filtro.Edit1.Text,[loCaseInsensitive]);
   dbgListaHijas.SetFocus;
   end;

  end;

end;

procedure TfSupervisionOnlineR.CargarInfoItinerario;
begin
  IF not qprincipal.IsEmpty then
  begin
qListaLectura.close;
qListaLectura.SQl.Clear;
qListaLectura.SQl.Add('SELECT S.CODIGOLECTURA,');
qListaLectura.SQl.Add('       S.CLAVE,');
qListaLectura.SQl.Add('         S.LECTURAACTUAL,');
qListaLectura.SQl.Add('         S.CONSUMOACTUAL,');
qListaLectura.SQl.Add('         S.CODIGOANOMALIA,');
qListaLectura.SQl.Add('         S.FECHALECTURA,');
qListaLectura.SQl.Add('         S.FECHALLEGADA,');
qListaLectura.SQl.Add('         S.FECHASALIDA,');
qListaLectura.SQl.Add('         INF.CODUBICACION,');
qListaLectura.SQl.Add('         INF.TARIFA,');
qListaLectura.SQl.Add('         S.CODIGOANOMALIACONSUMOACT,');
qListaLectura.SQl.Add('         INF.NOMBRESUSCRIPTOR,');
qListaLectura.SQl.Add('         CS.DESCRIPCION AS NOMBREANOMALIA');
qListaLectura.SQl.Add('    FROM SIGCOM_LECTURA S,');
qListaLectura.SQl.Add('         SGC_CLASES CS,');
qListaLectura.SQl.Add('         SGC_INFOITINERARIO INF');
qListaLectura.SQl.Add('   WHERE S.CLAVE = INF.CLAVE');
qListaLectura.SQl.Add('         AND S.CODIGOITINERARIO = INF.CODIGOITINERARIO');
qListaLectura.SQl.Add('         AND S.CODIGOITINERARIO = ' +
    qprincipalCODIGOITINERARIO.AsString + ' ');
qListaLectura.SQl.Add('         AND INF.CODIGOITINERARIO = S.CODIGOITINERARIO');
qListaLectura.SQl.Add('         AND INF.FECHALECTURA = TO_DATE (''' +
    lFechaLectura.Caption + ''', ''DD/MM/YYYY'') ');
qListaLectura.SQl.Add('       AND INF.FECHALECTURA = S.FECHA_PROGRAMADA');
qListaLectura.SQl.Add('       AND CS.CODIGOCLASE = S.CODIGOANOMALIA');
qListaLectura.SQl.Add('       AND S.CODIGOADMINISTRATIVO1 = INF.CODIGOADMINISTRATIVO ');
qListaLectura.SQl.Add('       AND S.CODIGOGRUPOTRABAJO1 = INF.CODIGOGRUPOTRABAJO ');
qListaLectura.SQl.Add('ORDER BY S.FECHALECTURA DESC');
 qListaLectura.Open;

  lDetalleSuministros.Caption := ' Clientes repartidos en  Itinerario '+ IntToStr(qListaLectura.RecordCount);
   end;
end;

procedure TfSupervisionOnlineR.qprincipalAfterOpen(DataSet: TDataSet);
begin
  inherited;
 //CargarInfoItinerario;
end;

procedure TfSupervisionOnlineR.sbAuditoriaClick(Sender: TObject);
var
fAuditoriaSupervisor: TfAuditoriaSupervisor;
begin
  inherited;
fAuditoriaSupervisor := TfAuditoriaSupervisor.Create(Self);
//ShowMessage(IntToStr(qprincipalSUPERVISOR.AsInteger));

end;
function TfSupervisionOnlineR.CodigoSupervisor(CodSuper: String): String;
begin

end;

procedure TfSupervisionOnlineR.qListaLecturaCalcFields(DataSet: TDataSet);
begin
  inherited;
qListalecturaDIRECCION.AsString := qListalecturaDIRECCIONSUSCRIPTOR.asstring;
end;

procedure TfSupervisionOnlineR.ToolButton1Click(Sender: TObject);
var
Cantidad : String;
begin
  inherited;

  if ValidarListadoItinerarios then
  begin
  if ValidarEstadoItinerarioGeneral then
  begin
   if Application.MessageBox
    (PChar('¿ Esta seguro que desea retornar al listado de reparto las cuentas de los itinerarios que estan en estado TERMINADO y que no fueron procesadas en campo?'+ char(13)+'Esta acción es irreversible, los clientes tendran que realizar todo el proceso de reparto nuevamente.'+char(13)+'Los clientes los encontrara en la pestaña (pendientes).'),
    'Confirmación', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
   begin

    qprincipal.First;
    while not qprincipal.Eof do
    begin
    Cantidad := '0';
    
    if (qprincipalCANTIDAD.AsInteger-qprincipalTOTALREPARTIDOS.AsInteger)>0 then
    if ConsultarEstadoItinerario(qprincipalCODIGOITINERARIO.AsString) then
    if InactivarClienteDelItinerarioExportado(qprincipalCODIGOITINERARIO.AsString,Cantidad) then
    if ActualizarListadoDeTotalesPorItinerario(qprincipalCODIGOITINERARIO.AsString,Cantidad) then
       ActualizarEstadoClientesListado(qprincipalCODIGOITINERARIO.AsString);

    qprincipal.Next;
    end;
    qprincipal.First;
      Application.MessageBox(PChar('El proceso ha terminado. En el listado principal en CLIENTES DEVUELTOS aparecera la cantidad de clientes que se procesarón. '),
          'Información', MB_OK + MB_ICONINFORMATION+ MB_DEFBUTTON2);
     sbRefrescarClick(Sender);

     end
   else
   Application.MessageBox(PChar('No ha sido posible realizar el proceso, ningun itinerario ha terminado, Intente nuevamente cuando al menos uno esté en ESTADO terminado. '),
          'Información', MB_OK + MB_ICONEXCLAMATION+ MB_DEFBUTTON2);
   end;
  end;

end;

function TfSupervisionOnlineR.ValidarListadoItinerarios: Boolean;
begin
  Result := False;

 if qprincipal.Active then
 begin
  IF qprincipal.RecordCount > 0 then
   Result := True
  else
  Application.MessageBox(PChar('El filtro utilizado retorna ningun itinerario por lo tanto no es posible realizar la acción, realice otro filtro e intente nuevamente.'),
          'Error', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
 end
 else
  Application.MessageBox(PChar('No hay itinerarios en el listado, realice otro filtro e intente nuevamente.'),
          'Error', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);

end;

function TfSupervisionOnlineR.InactivarClienteDelItinerarioExportado(
  CodigoItinerario: String; var clientesExportados : String): Boolean;
var
    qTemp,qTemp1: TQuery;
begin
  result:=False;
  clientesExportados := '0';

  qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';

  qTemp1:= TQuery.Create(nil);
  qTemp1.DatabaseName := 'BaseDato';

  qTemp1.SQL.Clear;
  qTemp1.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM  REP_EXPORTACION  WHERE CODIGOITINERARIO=:CODIGOITINERARIO AND REPARTIDO=''NO''  ');
  qTemp1.ParamByName('CODIGOITINERARIO').AsString := CodigoItinerario;
  qTemp1.open;

  if qTemp1.FieldByName('CANTIDAD').AsInteger >0 then
  begin

  qTemp.Close;
  qTemp.SQL.Clear;
  qTemp.SQL.Add('UPDATE  REP_EXPORTACION SET ACTIVO=''N'' WHERE CODIGOITINERARIO=:CODIGOITINERARIO AND REPARTIDO=''NO'' AND ACTIVO=''S''  ');
  qTemp.ParamByName('CODIGOITINERARIO').AsString := CodigoItinerario;

  qTemp.ExecSQL;

  if qTemp.RowsAffected > 0 then
  begin
  Result := True;
  clientesExportados := IntToStr(qTemp.RowsAffected);
  end;

  end
  else
  begin
    Result := True;
    clientesExportados := qTemp1.FieldByName('CANTIDAD').AsString;
  end;

  qTemp.Close;
  qTemp.Free;

end;

function TfSupervisionOnlineR.ActualizarListadoDeTotalesPorItinerario(
  CodigoItinerario, ClientesExportado: String): Boolean;
var
  qTemp: TQuery;
begin
  result:=False;

  qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';



  qTemp.SQL.Clear;
  qTemp.SQL.Add('UPDATE REP_TOTALESPORITINERARIO SET CLIENTESDEVUELTOS=:CLIENTES  WHERE CODIGOITINERARIO=:CODIGOITINERARIO  ');
  qTemp.ParamByName('CODIGOITINERARIO').AsString := CodigoItinerario;
  qTemp.ParamByName('CLIENTES').AsString := ClientesExportado;
  qTemp.ExecSQL;

  if qTemp.RowsAffected > 0 then
  begin
  Result := True;
  end;


  qTemp.Close;
  qTemp.Free;

end;

procedure TfSupervisionOnlineR.ActualizarEstadoClientesListado(
  CodigoItinerario: String);
var
  qTemp: TQuery;

begin

 qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';



qTemp.SQL.Clear;
qTemp.SQL.Add('UPDATE REP_CLIENTESREPARTO C      ');
qTemp.SQL.Add('SET  ');
qTemp.SQL.Add('    CODIGOESTADOCLIENTEREPARTO = 2,  ');
qTemp.SQL.Add('    FECHA_PROGRAMADA_REPARTO = NULL   ');
qTemp.SQL.Add('WHERE  ');
qTemp.SQL.Add('    EXISTS (    ');
qTemp.SQL.Add('        SELECT    ');
qTemp.SQL.Add('            NULL  ');
qTemp.SQL.Add('        FROM    ');
qTemp.SQL.Add('            REP_EXPORTACION R    ');
qTemp.SQL.Add('        WHERE      ');
qTemp.SQL.Add('            ACTIVO = ''N'' AND R.REPARTIDO=''NO''   ');
qTemp.SQL.Add('            AND CODIGOITINERARIO = :CODIGOITINERARIO  ');
qTemp.SQL.Add('            AND C.CODIGOCUENTA = R.CODIGOCUENTA   ');
qTemp.SQL.Add('            AND C.FECHA_PROGRAMADA_REPARTO = R.FECHAPROGRAMADAREPARTO    ');
  qTemp.ParamByName('CODIGOITINERARIO').AsString := CodigoItinerario;
  qTemp.ExecSQL;

end;

function TfSupervisionOnlineR.consultarEstadoItinerario(
  CodigoItinerario: String): Boolean;
var
  qTemp: TQuery;
begin
  result:=False;

  qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';



  qTemp.SQL.Clear;
  qTemp.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM REP_ITINERARIO WHERE CODIGOITINERARIO=:CODIGOITINERARIO AND CODIGOESTADOITINERARIO=6');
  qTemp.ParamByName('CODIGOITINERARIO').AsString := CodigoItinerario;
  qTemp.open;

  if qTemp.FieldByName('CANTIDAD').asInteger > 0 then
  begin
  Result := True;
  end;


  qTemp.Close;
  qTemp.Free;

end;

function TfSupervisionOnlineR.ValidarEstadoItinerarioGeneral: Boolean;
begin
result:=false;
qprincipal.First;
    while not qprincipal.Eof do
    begin

    if ConsultarEstadoItinerario(qprincipalCODIGOITINERARIO.AsString) then
    result:=true;


    qprincipal.Next;
    end;



end;
end.
