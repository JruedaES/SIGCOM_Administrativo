// ***************************************************************************
// Módulo Lecturas
// Listado de Lecturas
// ***************************************************************************
unit uListaCritica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls, Mask, RXSplit,
  Menus, MPlayer, ImgList, Registry, ComCtrls, uAsignarAnalistas,uSeleccionarObservacion;

type
  TfListaCritica = class(TFdSgdListaBase)
    dsListaPadre: TDataSource;
    qListaLectura: TQuery;
    dsListaLectura: TDataSource;
    qGrupoTrabajo: TQuery;
    pmExportar: TPopupMenu;
    ExportarListaOdtPadres1: TMenuItem;
    sbVistaPreliminarVL: TSpeedButton;
    qCamposCalculados: TQuery;
    qCamposCalculadosNVLBATERIA: TStringField;
    qCamposCalculadosCODIGORUTA: TFloatField;
    qCamposCalculadosCODIGOGRUPOAOL: TFloatField;
    qCamposCalculadosCOLOR: TFloatField;
    qCamposCalculadosCODIGOGRUPOITINERARIO: TFloatField;
    qCamposCalculadosCODIGOLECTURA: TFloatField;
    qCamposCalculadosCLAVE: TStringField;
    qCamposCalculadosCONSUMOACTUAL: TStringField;
    qCamposCalculadosCODIGOANOMALIA: TStringField;
    qCamposCalculadosFECHALECTURA: TDateTimeField;
    qCamposCalculadosCODIGOITINERARIO: TFloatField;
    qCamposCalculadosAOLFINCA: TFloatField;
    qCamposCalculadosCODIGOADMINISTRATIVO: TFloatField;
    qCamposCalculadosCODIGOGRUPOTRABAJO: TFloatField;
    qCamposCalculadosNOMBRESUSCRIPTOR: TStringField;
    qCamposCalculadosDIRECCIONSUSCRIPTOR: TStringField;
    qCamposCalculadosCONSUMOPROMEDIO: TFloatField;
    qCamposCalculadosCODIGOAPOYO: TFloatField;
    qCamposCalculadosVALIDO: TStringField;
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
    qUpdateLectura: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    FloatField1: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField2: TFloatField;
    DateTimeField2: TDateTimeField;
    StringField11: TStringField;
    StringField12: TStringField;
    qAnalista: TQuery;
    sbRefrescar: TSpeedButton;
    Panel6: TPanel;
    sbAnalistas: TSpeedButton;
    qValidarCritica: TQuery;
    Label5: TLabel;
    eCuentasCritica: TLabel;
    Label6: TLabel;
    eCuentasResueltas: TLabel;
    Label11: TLabel;
    lProcentajeAvance: TLabel;
    qResueltas: TQuery;
    FloatField4: TFloatField;
    pmCambiarEstado: TPopupMenu;
    ColocarenestadoPendiente1: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel5: TPanel;
    dbgListaHijas: TRxDBGrid;
    RxSplitter1: TRxSplitter;
    Panel4: TPanel;
    qlistaLecturaPendientes: TQuery;
    dsListaPendientes: TDataSource;
    dsListaResueltos: TDataSource;
    qListaResueltos: TQuery;
    Panel7: TPanel;
    RxDBGrid1: TRxDBGrid;
    RxSplitter2: TRxSplitter;
    Panel8: TPanel;
    Panel9: TPanel;
    RxDBGrid2: TRxDBGrid;
    RxSplitter3: TRxSplitter;
    Panel10: TPanel;
    pmActivar: TPopupMenu;
    MenuItem1: TMenuItem;
    ImageList1: TImageList;
    qlistaLecturaPendientesOBSERVACION_CRITICA: TMemoField;
    Label1: TLabel;
    Label2: TLabel;
    lPendientes: TLabel;
    lnumpendientes: TLabel;
    qPendientes: TQuery;
    FloatField3: TFloatField;
    qlistaLecturaPendientesOBSERVACIONPENDIENTE: TStringField;
    pmReiniciar: TPopupMenu;
    MenuItem2: TMenuItem;
    qListaLecturaCODIGOANOMALIA: TStringField;
    qListaLecturaFECHALECTURA: TDateTimeField;
    qListaLecturaCODIGOITINERARIO: TFloatField;
    qListaLecturaCODIGOANALISTA: TFloatField;
    qListaLecturaVALIDO: TStringField;
    qListaLecturaESTADOLECTURA: TFloatField;
    qListaLecturaDESCRIPCION: TStringField;
    qListaLecturaCODIGOANOMALIACONSUMOACT: TStringField;
    qListaLecturaFECHA_PROGRAMADA: TDateTimeField;
    qlistaLecturaPendientesFECHA_PROGRAMADA: TDateTimeField;
    qlistaLecturaPendientesCODIGOANOMALIA: TStringField;
    qlistaLecturaPendientesFECHALECTURA: TDateTimeField;
    qlistaLecturaPendientesCODIGOITINERARIO: TFloatField;
    qlistaLecturaPendientesCODIGOANALISTA: TFloatField;
    qlistaLecturaPendientesVALIDO: TStringField;
    qlistaLecturaPendientesESTADOLECTURA: TFloatField;
    qlistaLecturaPendientesDESCRIPCION: TStringField;
    qlistaLecturaPendientesCODIGOANOMALIACONSUMOACT: TStringField;
    qListaResueltosFECHA_CRITICA: TDateTimeField;
    qListaResueltosOBSERVACION_CRITICA: TMemoField;
    qListaResueltosFECHA_PROGRAMADA: TDateTimeField;
    qListaResueltosCODIGOANOMALIA: TStringField;
    qListaResueltosFECHALECTURA: TDateTimeField;
    qListaResueltosCODIGOITINERARIO: TFloatField;
    qListaResueltosCODIGOANALISTA: TFloatField;
    qListaResueltosVALIDO: TStringField;
    qListaResueltosESTADOLECTURA: TFloatField;
    qListaResueltosDESCRIPCION: TStringField;
    qListaResueltosCODIGOANOMALIACONSUMOACT: TStringField;
    qListaResueltosOBSERVACIONPENDIENTE: TStringField;
    qListaResueltosMARCA_CRITICA: TStringField;
    qListaLecturaNOMBREOBSERVACIONCRITICA: TStringField;
    qlistaLecturaPendientesNOMBREOBSERVACIONCRITICA: TStringField;
    qListaResueltosNOMBREOBSERVACIONCRITICA: TStringField;
    ExportarPendientes1: TMenuItem;
    ExportarResueltos1: TMenuItem;
    qReporteGeneral1: TQuery;
    dsReporteGeneral1: TDDataSource;
    QReporteGeneral2: TQuery;
    dsReporteGeneral2: TDDataSource;
    qListaLecturaNOMBRECRITICA: TStringField;
    qListaLecturaCLAVE: TFloatField;
    qListaLecturaCODIGOLECTURA: TFloatField;
    qListaLecturaCONSUMOACTUAL: TFloatField;
    qListaLecturaDESVIACIONCONSUMO: TFloatField;
    qlistaLecturaPendientesCLAVE: TFloatField;
    qlistaLecturaPendientesCODIGOLECTURA: TFloatField;
    qlistaLecturaPendientesCONSUMOACTUAL: TFloatField;
    qListaResueltosCLAVE: TFloatField;
    qListaResueltosCODIGOLECTURA: TFloatField;
    qListaResueltosCONSUMOACTUAL: TFloatField;
    qListaResueltosDESVIACIONCONSUMO: TFloatField;
    qlistaLecturaPendientesDESVIACIONCONSUMO: TFloatField;
    qlistaLecturaPendientesNOMBRECRITICA: TStringField;
    qListaResueltosNOMBRECRITICA: TStringField;
    qExistenciaFotos: TQuery;
    qListaLecturaFOTOS: TStringField;
    qlistaLecturaPendientesFOTOS: TStringField;
    qListaResueltosFOTOS: TStringField;
    qListaLecturaANALISTA: TStringField;
    qListaLecturaESTADOCRITICA: TStringField;
    qListaLecturaANOMALIACONSUMO: TStringField;
    qlistaLecturaPendientesANALISTA: TStringField;
    qlistaLecturaPendientesESTADOCRITICA: TStringField;
    qlistaLecturaPendientesANOMALIACONSUMO: TStringField;
    qListaResueltosANALISTA: TStringField;
    qListaResueltosESTADOCRITICA: TStringField;
    qListaResueltosANOMALIACONSUMO: TStringField;
    aParametroPromedio: TQuery;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure SBImprimirClick(Sender: TObject);
    procedure SBOrdenarClick(Sender: TObject);
    procedure sbRefrescarClick(Sender: TObject);
    procedure ExportarListaOdtPadres1Click(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SBBuscaElementoCartografiaClick(Sender: TObject);
    procedure AolFinca1Click(Sender: TObject);
    procedure Itinerario1Click(Sender: TObject);
    procedure FechaLectura1Click(Sender: TObject);
    procedure sbVistaPreliminarVLClick(Sender: TObject);
    { procedure sbFiltroHijasClick(Sender: TObject); }
    procedure CargarVistaPreliminar(CodApoyo: string);
    procedure CodigodeCuenta1Click(Sender: TObject);
    procedure qprincipalCalcFields(DataSet: TDataSet);
    procedure ds(DataSet: TDataSet);
    procedure dbgListaHijasDblClick(Sender: TObject);
    procedure sbAnalistasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgListaHijasGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure qListaLecturaAfterOpen(DataSet: TDataSet);
    procedure dbgListaHijasTitleClick(Column: TColumn);
    procedure ck(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure qListaResueltosCalcFields(DataSet: TDataSet);
    procedure qlistaLecturaPendientesCalcFields(DataSet: TDataSet);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure ColocarenestadoPendiente1Click(Sender: TObject);
    procedure RxDBGrid2DblClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure qListaLecturaCalcFields(DataSet: TDataSet);
    procedure MenuItem2Click(Sender: TObject);
    procedure RxDBGrid1TitleClick(Column: TColumn);
    procedure RxDBGrid2TitleClick(Column: TColumn);
    procedure ExportarPendientes1Click(Sender: TObject);
    procedure ExportarResueltos1Click(Sender: TObject);
    procedure Exportarotros1Click(Sender: TObject);
  private
    { Private declarations }
    gSLLista, gSLListaRotulos, gSLListaDatos, gSLListaFrom: TStringList;
    ListaDireccionCampos: TStringList;
    function ExisteTransaccionActual: Boolean;
    function ValidarProcesoCritica(Tipo: Integer): Boolean;
    { procedure FiltrarODTHija; }
    { procedure LimpiarFiltroODTHijas; }

  public
    { Public declarations }
    sCriterio,FechaLectura: String;
    Lista, ListaEstadistica, ListaFrom,ListaOrden: TStringList;
    VerFiltro: Boolean;
    GrupodeTrabajo: Integer;
    FechaGlobal : String;
    procedure Filtrar;
    procedure LimpiarFiltro;
    Procedure OrdenarGrilla(Query : TQuery); 
  end;

var
  fListaCritica: TfListaCritica;

implementation

uses uODTUrbanaRural, uElementosAsociadosODT, uCartografiaReportes,
  uFIMPComunes, uODTPadre, uQRIndicexMaterialResumen, uQRListaODTHorasExtras,
  uComunesAdministrativo, uQRListadoODT, uBuscarOdt, uEstadisticaOdt,
  uQRListaODTViaticos, uQRListaODTAuxilios, DecisionCubeBugWorkaround,
  ConsDll, uFuncionSGD, uQRODTHija, uQRODTHijaTodas, uBuscarOdtHija,
  uFIMPAdministrativo, uVistaPreliminarVL, uGaleriaPreliminar,
  uAnalisisFacturacion, uFormaEspere;

{$R *.DFM}

procedure TfListaCritica.FormDestroy(Sender: TObject);
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

procedure TfListaCritica.FormShow(Sender: TObject);
begin
  inherited;
  sbAnalistas.visible := ProcManager.CanProcExecute
    ('_Permitir Asignar Analistas');
 { Label5.visible := not ProcManager.CanProcExecute
    ('_Permitir Asignar Analistas');
  eCuentasCritica.visible := not ProcManager.CanProcExecute
    ('_Permitir Asignar Analistas');
  Label6.visible := not ProcManager.CanProcExecute
    ('_Permitir Asignar Analistas');
  eCuentasResueltas.visible := not ProcManager.CanProcExecute
    ('_Permitir Asignar Analistas');
  Label11.visible := not ProcManager.CanProcExecute
    ('_Permitir Asignar Analistas');
  lProcentajeAvance.visible := not ProcManager.CanProcExecute
    ('_Permitir Asignar Analistas');
  lPendientes.visible := not ProcManager.CanProcExecute
    ('_Permitir Asignar Analistas');
  lnumpendientes.visible := not ProcManager.CanProcExecute
    ('_Permitir Asignar Analistas'); }
  Filtrar;
  WindowState := wsMaximized;

end;

procedure TfListaCritica.FormCreate(Sender: TObject);
var

 query : Tquery;
begin
  inherited;
  ListaOrden := TStringList.Create;
  ListaFrom := TStringList.Create;
  ListaEstadistica := TStringList.Create;
  ListaDireccionCampos := TStringList.Create;
  ListaDireccionCampos.Add('CODIGOODT=-1');
  ListaDireccionCampos.Add('CODIGOADMINISTRATIVO=-1');
  ListaDireccionCampos.Add('FECHAEMISION=-1');
  ListaDireccionCampos.Add('FECHAAPROBACION=-1');
  ListaDireccionCampos.Add('FECHAASIGNACION=-1');
  ListaDireccionCampos.Add('CODIGOESTADOODT=-1');
  ListaDireccionCampos.Add('CODIGOLABOR=-1');
  ListaDireccionCampos.Add('CODIGOPRIORIDAD=-1');
  ListaDireccionCampos.Add('CODIGOTIPOTAREA=-1');

  query := Tquery.Create(self);
  query.DatabaseName := 'BaseDato';

  query.CLOSE;
  query.SQL.clear;
  query.sql.add('alter session set NLS_NUMERIC_CHARACTERS = ''.,'' ');
  query.ExecSQL;


  //qCamposCalculados.open;

  if NOT ProcManager.CanProcExecute('_Permitir Asignar Analistas') then
  BEGIN
    qListaLectura.SQL.Strings[2] :=
      ' AND S.CODIGOANALISTA=(SELECT CODIGOANALISTA FROM SGC_ANALISTAS WHERE CODIGOUSUARIO=(SELECT GETCODIGOUSUARIO FROM DUAL))';
    qListaResueltos.SQL.Strings[2] :=
      ' AND S.CODIGOANALISTA=(SELECT CODIGOANALISTA FROM SGC_ANALISTAS WHERE CODIGOUSUARIO=(SELECT GETCODIGOUSUARIO FROM DUAL))';
    qlistaLecturaPendientes.SQL.Strings[2] :=
      ' AND S.CODIGOANALISTA=(SELECT CODIGOANALISTA FROM SGC_ANALISTAS WHERE CODIGOUSUARIO=(SELECT GETCODIGOUSUARIO FROM DUAL))';
  END;
 { qAnalista.open;
  qListaLectura.open;

  qListaResueltos.open;

  qlistaLecturaPendientes.open;

  qGrupoTrabajo.open;   }

  Panel3.visible := False;
  gSLLista := TStringList.Create;
  gSLListaRotulos := TStringList.Create;
  gSLListaDatos := TStringList.Create;
  gSLListaFrom := TStringList.Create;

end;

procedure TfListaCritica.Filtrar;
Var
  CadFrom, s: String;
  Valor: Integer;
begin
  Lista := GetQueryFiltroCritica(ListaRotulos, ListaDatos, ListaFrom);
  If Lista <> Nil then
  begin
    qListaLectura.close;

    LimpiarFiltro;

   FechaGlobal := ListaDatos.Values['Periodo'];


    qListaLectura.SQL.Insert(7, Lista.Text);
    qListaResueltos.SQL.Insert(7, Lista.Text);
    qlistaLecturaPendientes.SQL.Insert(7, Lista.Text);

    qListaLectura.open;

    qTotales.close;
    qTotales.sql.clear;
    qTotales.SQL.add('select count(*) as cantidad from sigcom_lectura where 1=1 ');

     if NOT ProcManager.CanProcExecute('_Permitir Asignar Analistas') then
     BEGIN
     qTotales.SQL.add(' AND codigoanalista=(SELECT CODIGOANALISTA FROM SGC_ANALISTAS WHERE CODIGOUSUARIO=(SELECT GETCODIGOUSUARIO FROM DUAL))');
     END;

    qTotales.SQL.add('and valido!=''SI'' and CRITICA_INCMS !=''SI'' and fecha_programada=TO_DATE('''+FechaGlobal+''',''DD/MM/YYYY'')  ');
   // showmessage(qTotales.Text);
    qTotales.open;
    lFiltroDatos.Caption := 'Suministros Con Anomalias en la Autocritica : ' +
    qTotales.FieldByName('CANTIDAD').AsString;
    eCuentasCritica.Caption := qTotales.FieldByName('CANTIDAD').AsString;

   // SHOWMESSAGE('Cuentas Resueltas :'+ eCuentasResueltas.Caption);
    // sHOWMESSAGE('Cuentas Critica :'+ qTotales.FieldByName('CANTIDAD').AsString);
     TRY
      lProcentajeAvance.Caption :=
        FloatToStr(Round((StrToInt(eCuentasResueltas.Caption) /
        StrToInt(eCuentasCritica.Caption)) * 100)) + ' %';
    Except
      on E: Exception Do
      BEGIN
      //ShowMessage('Se ha presentado un error al interntar cargar el avance ' + e.Message);
        lProcentajeAvance.Caption := '0 %';
      END;

    end;


    qListaResueltos.close;
    qListaResueltos.open;

    qlistaLecturaPendientes.close;
    qlistaLecturaPendientes.open;



    ListaOrden.Clear;
    OrdenarGrilla(qListaLectura);
    OrdenarGrilla(qlistaLecturaPendientes);
    OrdenarGrilla(qListaResueltos);

  end;
end;

procedure TfListaCritica.LimpiarFiltro;
begin
  qListaLectura.SQL.Delete(7);
  qListaResueltos.SQL.Delete(7);
  qlistaLecturaPendientes.SQL.Delete(7);

end;

procedure TfListaCritica.SBFiltrarClick(Sender: TObject);
begin
  Filtrar;

  inherited;
end;

procedure TfListaCritica.SBImprimirClick(Sender: TObject);
var
  punto: TPoint;
begin

end;

procedure TfListaCritica.SBOrdenarClick(Sender: TObject);
var
  punto: TPoint;
begin
end;

// ************Despliega el formulario Buscar ODT
procedure TfListaCritica.sbRefrescarClick(Sender: TObject);
begin
  inherited;
  qListaLectura.close;
  qListaLectura.open;

  qListaResueltos.close;
  qListaResueltos.open;

  qlistaLecturaPendientes.close;
  qlistaLecturaPendientes.open;

end;

procedure TfListaCritica.ExportarListaOdtPadres1Click(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
  begin
    dsListaLectura.DataSet.DisableControls;
    CVS1.DataSet := dsListaLectura.DataSet;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    dsListaLectura.DataSet.EnableControls;
  end;
end;

procedure TfListaCritica.sbExportarClick(Sender: TObject);
var
  punto: TPoint;
begin
  punto := Panel2.ClientToScreen(Classes.Point(sbExportar.Left,
    sbExportar.top));
  pmExportar.Popup(punto.x + 10, punto.y + 10);
end;

function TfListaCritica.ExisteTransaccionActual: Boolean;
begin

end;

procedure TfListaCritica.SpeedButton2Click(Sender: TObject);
var
  punto: TPoint;
begin
end;

procedure TfListaCritica.SBBuscaElementoCartografiaClick(Sender: TObject);
var
  Query: TQuery;
begin
  inherited;

  try
    { Query:=TQuery.create(nil);
      Query.DatabaseName:='BaseDato';

      Query.SQL.Add('SELECT A.X,A.Y,RA.CODIGOAPOYO,RA.AOLFINCA,G.CODIGOGRUPOAOL AS GRUPOAOL');
      Query.SQL.Add('FROM APOYO A,SGC_RUTAAPOYO RA , SGC_RUTA R , SGC_GRUPOITINERARIO  G, SGC_ITINERARIO I');
      Query.SQL.Add('WHERE');
      Query.SQL.Add('A.CODIGOAPOYO = RA.CODIGOAPOYO');
      Query.SQL.Add('AND RA.CODIGORUTA = R.CODIGORUTA');
      Query.SQL.Add('AND RA.CODIGOGRUPOAOL = R.CODIGOGRUPOAOL');
      Query.SQL.Add('AND R.CODIGORUTA = '+qListaLecturaCODIGORUTA.AsString+' ');
      Query.SQL.Add('AND R.CODIGOGRUPOAOL = '+qListaLecturaCODIGOGRUPOAOL.AsString+' ');
      Query.SQL.Add('AND R.CODIGORUTA = G.CODIGORUTA (+) AND R.CODIGOGRUPOAOL =G.CODIGOGRUPOAOL(+)');
      Query.SQL.Add('AND G.CODIGOGRUPOITINERARIO = I.CODIGOGRUPOITINERARIO(+)');
      Query.SQL.Add('AND G.CODIGOGRUPOITINERARIO ='+qListaLecturaCODIGOGRUPOITINERARIO.AsString+'  ');
      Query.SQL.Add('AND RA.AOLFINCA BETWEEN I.AOLFINCADESDE AND I.AOLFINCAHASTA');
      Query.SQL.Add('AND I.CODIGOITINERARIO ='+qListaLecturaCODIGOITINERARIO.AsString+' ');
      Query.SQL.Add('ORDER BY RA.AOLFINCA');
      Query.Open;


      BuscarApoyo(qListaLecturaCODIGOAPOYO.AsString,True);
      MostrarItinerario(qListaLecturaCODIGOGRUPOAOL.AsString,qListaLecturaCODIGORUTA.AsString,qListaLecturaCODIGOITINERARIO.AsString,qListaLecturaCODIGOGRUPOITINERARIO.AsString,qListaLecturaCOLOR.AsString);
      MostrarRuta(Query); }

  finally
    Query.Free;
  end;
end;

procedure TfListaCritica.AolFinca1Click(Sender: TObject);
begin
  inherited;
  qListaLectura.close;
  qListaLectura.SQL.Delete(9);
  qListaLectura.SQL.Insert(9, 'ORDER BY AOLFINCA');
  qListaLectura.open;
end;

procedure TfListaCritica.Itinerario1Click(Sender: TObject);
begin
  inherited;
  qListaLectura.close;
  qListaLectura.SQL.Delete(9);
  qListaLectura.SQL.Insert(9, 'ORDER BY I.CODIGOITINERARIO');
  qListaLectura.open;
end;

procedure TfListaCritica.FechaLectura1Click(Sender: TObject);
begin
  inherited;
  qListaLectura.close;
  qListaLectura.SQL.Delete(9);
  qListaLectura.SQL.Insert(9, 'ORDER BY FECHALECTURA');
  qListaLectura.open;
end;

procedure TfListaCritica.sbVistaPreliminarVLClick(Sender: TObject);
var
  Registro: TRegIniFile;
  i: Integer;
begin
  IF sbVistaPreliminarVL.Down = true then
  Begin
    Panel4.visible := true;
    { CargarVistaPreliminar(qListaLecturaCLAVE.asstring); }
  end
  else
    Panel4.visible := False;
end;

procedure TfListaCritica.CargarVistaPreliminar(CodApoyo: string);
var
  CodigoApoyo: string;
  i: Integer;
begin
  for i := Application.MainForm.MDIChildCount - 1 downto 0 do
    if (Application.MainForm.MDIChildren[i] is TfListaCritica) then
    begin
      CodigoApoyo := qListaLectura.FieldByName('CLAVE').AsString;
      if CodigoApoyo <> '' then
      begin
        if not Assigned(fGaleriaPreliminar) then
        begin
          fGaleriaPreliminar := TfGaleriaPreliminar.CreateByparametros
            (Application, CodigoApoyo);
          fGaleriaPreliminar.FechaLectura :=
            qListaLectura.FieldByName('FECHALECTURA_1').AsString;
            fGaleriaPreliminar.TipoDeFoto := '15';
        end
        else
        begin
          fGaleriaPreliminar.FechaLectura :=
            qListaLectura.FieldByName('FECHALECTURA_1').AsString;
          fGaleriaPreliminar.MostrarVistaPreliminar(CodigoApoyo);
          fGaleriaPreliminar.TipoDeFoto := '15';
        end;

        fGaleriaPreliminar.ManualDock(Panel4);
        fGaleriaPreliminar.Show;
        break;
      end;
    end;
end;

procedure TfListaCritica.CodigodeCuenta1Click(Sender: TObject);
begin
  inherited;
  qListaLectura.close;
  qListaLectura.SQL.Delete(9);
  qListaLectura.SQL.Insert(9, 'ORDER BY CLAVE');
  qListaLectura.open;
end;

procedure TfListaCritica.qprincipalCalcFields(DataSet: TDataSet);
var
  Cantidad: Integer;
begin
  inherited;
  { qCamposCalculados.close;
    qCamposCalculados.ParamByName('CODIGOITINERARIO').AsString := qprincipalCODIGOITINERARIO.AsString;
    qCamposCalculados.open; }
  { try
    Cantidad := qCamposCalculados.RecordCount;
    Except
    Cantidad := 0;
    end;
    qprincipalSUMINISTROSLEIDOS.AsString :=IntToStr(Cantidad);
    try
    qprincipalPORCENTAJEAVANCE.AsString := IntToStr(Round((Cantidad*100)/qprincipalCANTIDADSUMINISTROS.AsInteger));
    Except
    qprincipalPORCENTAJEAVANCE.AsString := '0';
    end;
    qCamposCalculados.First;

    try
    qprincipalBATERIA.AsInteger := qCamposCalculadosNVLBATERIA.AsInteger;
    Except
    qprincipalBATERIA.AsInteger :=0; }
  { end; }

  { qGrupoTrabajo.Close;
    qGrupoTrabajo.ParamByName('CODIGOADMINISTRATIVO').AsString := qprincipalCODIGOADMINISTRATIVO.AsString;
    qGrupoTrabajo.ParamByName('CODIGOGRUPOTRABAJO').AsString :=  qprincipalCODIGOGRUPOTRABAJO.AsString;
    qGrupoTrabajo.Open;
    qprincipalLECTOR.AsString :=qGrupoTrabajo.FieldByName('NOMBREGRUPOTRABAJO').AsString; }
end;

procedure TfListaCritica.ds(DataSet: TDataSet);
begin
  inherited;
  qAnalista.close;
  qAnalista.ParamByName('CODIGOANALISTA').AsString :=
    qListaLecturaCODIGOANALISTA.AsString;
  qAnalista.open;
  qListaLecturaANALISTA.AsString := qAnalista.FieldByName
    ('NOMBREANALISTA').AsString;

  if qListaLecturaESTADOLECTURA.AsInteger = 4 then
    qListaLecturaESTADOCRITICA.AsString := 'SOLUCIONADO';

  if qListaLecturaESTADOLECTURA.AsInteger = 2 then
    qListaLecturaESTADOCRITICA.AsString := 'SIN CRITICA';

  if qListaLecturaESTADOLECTURA.AsInteger = 5 then
    qListaLecturaESTADOCRITICA.AsString := 'PENDIENTE';

end;

procedure TfListaCritica.dbgListaHijasDblClick(Sender: TObject);
begin
  inherited;

{try }
    // sbVistaPreliminarVLClick(Sender);
    if Assigned(FAnalisisFacturacion) THEN
    begin
      FAnalisisFacturacion.Free;
      FAnalisisFacturacion := nil;
    end;

    IF ValidarProcesoCritica(1) then
    begin
      FAnalisisFacturacion := TFAnalisisFacturacion.Create(self);
      FAnalisisFacturacion.qListaLectura.ParamByName('FECHALECTURA').AsString :=
        qListaLectura.FieldByName('FECHA_PROGRAMADA').AsString;
      FAnalisisFacturacion.qListaLectura.ParamByName('CODIGOCLAVE').AsString :=
        qListaLecturaCLAVE.AsString;
      FAnalisisFacturacion.qListaLectura.open;
            // Boton del promedio
      aParametroPromedio.Close;
      aParametroPromedio.open;

      if aParametroPromedio.FieldByName('VALOR').AsString = 'NO' then
             FAnalisisFacturacion.SpeedButton3.Enabled := False;

      FAnalisisFacturacion.Show;
    end
    else
    begin
      FAnalisisFacturacion := TFAnalisisFacturacion.Create(self);
      FAnalisisFacturacion.qListaLectura.ParamByName('FECHALECTURA').AsString :=
        qListaLectura.FieldByName('FECHA_PROGRAMADA').AsString;
      FAnalisisFacturacion.qListaLectura.ParamByName('CODIGOCLAVE').AsString :=
        qListaLecturaCLAVE.AsString;
      FAnalisisFacturacion.qListaLectura.open;
      FAnalisisFacturacion.SpeedButton1.Enabled := False;
      FAnalisisFacturacion.SpeedButton2.Enabled := False;
      FAnalisisFacturacion.SpeedButton3.Enabled := False;


      FAnalisisFacturacion.SpeedButton6.Enabled := False;
      FAnalisisFacturacion.Show;
    end;



  {except
    on E: Exception do
      messagedlg
        ('Se ha presentado un error al intentar cargar la información de la cuenta Error : '
        + E.Message, mtError, [mbOk], 0);
  end;}

end;

procedure TfListaCritica.sbAnalistasClick(Sender: TObject);
var
  qupdate: TQuery;
  i,Total: Integer;
  AsignarAnalista: TFAsignarAnalista;
  Codigo, Itinerario: String;
begin
  fFormaEspere := TfFormaEspere.Create(Application);
  fFormaEspere.ProgressBar1.Max := 4;
  fFormaEspere.lbMotivo.Caption := 'Recopilando Información...';
  fFormaEspere.Show;
  fFormaEspere.Refresh;
  fFormaEspere.ProgressBar1.Position := 1;
  fFormaEspere.Refresh;

  AsignarAnalista := TFAsignarAnalista.Create(self);

  AsignarAnalista.eFechaLectura.Caption := FechaGlobal;
  AsignarAnalista.eFechaLectura2.Text := FechaGlobal;


  fFormaEspere.lbMotivo.Caption := 'Cargando Información...';
  fFormaEspere.ProgressBar1.Position := 2;
  fFormaEspere.Refresh;

  AsignarAnalista.qPrincipal.ParamByName('FECHALECTURA').AsString :=FechaGlobal;
  AsignarAnalista.qPrincipal.open;

  fFormaEspere.lbMotivo.Caption := 'Generando opciones de asignación...';
  fFormaEspere.ProgressBar1.Position := 3;
  fFormaEspere.Refresh;

  AsignarAnalista.qSecundariaFacturacion.close;
  AsignarAnalista.qSecundariaFacturacion.ParamByName('FECHALECTURA').AsString :=FechaGlobal;
  AsignarAnalista.qSecundariaFacturacion.open;

  AsignarAnalista.qCuentasResultas.close;
  AsignarAnalista.qCuentasResultas.ParamByName('FECHALECTURA').AsString :=FechaGlobal;
  AsignarAnalista.qCuentasResultas.open;

  AsignarAnalista.qClientesCritica.close;
  AsignarAnalista.qClientesCritica.ParamByName('FECHALECTURA').AsString   := FechaGlobal;
  AsignarAnalista.qClientesCritica.open;

  Total := AsignarAnalista.qClientesCritica.FieldByName('CANTIDAD').AsInteger;

  AsignarAnalista.eCuentasCritica.Caption :=   AsignarAnalista.qClientesCritica.FieldByName('CANTIDAD').AsString;
  AsignarAnalista.eCuentasResueltas.Caption :=  IntToStr(AsignarAnalista.qCuentasResultas.FieldByName('CANTIDAD').AsInteger);

if Total = 0 then
Total := 1;

 AsignarAnalista.lProcentajeAvance.Caption :=   FloatToStr(Round(AsignarAnalista.qCuentasResultas.FieldByName('CANTIDAD').AsInteger*100/Total)) + '%';
  
  fFormaEspere.lbMotivo.Caption := 'Terminando...';
  fFormaEspere.ProgressBar1.Position := 4;
  fFormaEspere.Refresh;

  fFormaEspere.Free;

  if AsignarAnalista.ShowModal = mrOk then
  begin
    Codigo := AsignarAnalista.qCoordinadorGrupoTrabajoCODIGOANALISTA.AsString;

    try
      qupdate := TQuery.Create(nil);
      qupdate.DatabaseName := 'BaseDato';

      if true then
      begin

        if dbgListaHijas.SelectedRows.Count > 0 then
          with dbgListaHijas.DataSource.DataSet do
            for i := 0 to dbgListaHijas.SelectedRows.Count - 1 do
            begin
              dbgListaHijas.DataSource.DataSet.GotoBookmark
                (TBookmark(dbgListaHijas.SelectedRows.Items[i]));

              qupdate.close;
              qupdate.SQL.Clear;
              qupdate.SQL.Add('UPDATE SIGCOM_LECTURA SET CODIGOANALISTA=' +
                Codigo + ' WHERE CODIGOLECTURA=' +
                dbgListaHijas.DataSource.DataSet.FieldByName('CODIGOLECTURA')
                .AsString + ' ');
              qupdate.ExecSQL;

            end;

      end;

      if AsignarAnalista.rbtodoellistado.Checked then
      begin
        qListaLectura.First;

        while not qListaLectura.Eof do
        begin
          qupdate.close;
          qupdate.SQL.Clear;
          qupdate.SQL.Add('UPDATE SIGCOM_LECTURA SET CODIGOANALISTA=' + Codigo +
            ' WHERE CODIGOLECTURA=' + qListaLectura.FieldByName('CODIGOLECTURA')
            .AsString + ' ');
          qupdate.ExecSQL;

          qListaLectura.Next;
        end;
        qListaLectura.First;
      end;

    finally
      qupdate.Free;
    end;
    qListaLectura.close;
    qListaLectura.open;
  end;
end;

procedure TfListaCritica.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  fListaCritica := nil;
end;

procedure TfListaCritica.dbgListaHijasGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if Field.FieldName = 'ESTADOCRITICA' then
  begin
    Background := clFuchsia;
  end;

end;

function TfListaCritica.ValidarProcesoCritica(Tipo: Integer): Boolean;
begin
  Result := true;

  qValidarCritica.close;
  if Tipo = 1 then
  begin
    qValidarCritica.ParamByName('FECHALECTURA').AsString :=
      qListaLectura.FieldByName('FECHA_PROGRAMADA').AsString;
    qValidarCritica.ParamByName('CLAVE').AsString :=
      qListaLecturaCLAVE.AsString;

  end;
  if Tipo = 2 then
  begin
    qValidarCritica.ParamByName('FECHALECTURA').AsString :=
      qlistaLecturaPendientes.FieldByName('FECHA_PROGRAMADA').AsString;
    qValidarCritica.ParamByName('CLAVE').AsString :=
      qlistaLecturaPendientesCLAVE.AsString;

  end;
  if Tipo = 3 then
  begin
    qValidarCritica.ParamByName('FECHALECTURA').AsString :=
      qListaResueltos.FieldByName('FECHA_PROGRAMADA').AsString;
    qValidarCritica.ParamByName('CLAVE').AsString :=
      qListaResueltosCLAVE.AsString;

  end;

  qValidarCritica.open;

  if qValidarCritica.FieldByName('CANTIDAD').AsInteger > 0 then
  begin
    Result := False;
  end
  else
    Result := true;

end;

procedure TfListaCritica.qListaLecturaAfterOpen(DataSet: TDataSet);
begin
  inherited;


    qResueltas.close;
    qResueltas.ParamByName('FECHALECTURA').AsString :=FechaGlobal;

    qResueltas.SQL.Delete(3);

    if NOT ProcManager.CanProcExecute('_Permitir Asignar Analistas') then
    qResueltas.SQL.Insert(3,'AND S.CODIGOANALISTA=(SELECT CODIGOANALISTA FROM SGC_ANALISTAS WHERE CODIGOUSUARIO=(SELECT GETCODIGOUSUARIO FROM DUAL))')
    else
    qResueltas.SQL.Insert(3,'');
   //  showmessage(qResueltas.Text);
    qResueltas.open;
    //  SHOWMESSAGE(qResueltas.FieldByName('CANTIDAD').AsString);
    eCuentasResueltas.Caption := qResueltas.FieldByName('CANTIDAD').AsString;

    qPendientes.close;
    qPendientes.ParamByName('FECHALECTURA').AsString :=FechaGlobal;

    qPendientes.SQL.Delete(3);

    if NOT ProcManager.CanProcExecute('_Permitir Asignar Analistas') then
    qPendientes.SQL.Insert(3,'AND S.CODIGOANALISTA=(SELECT CODIGOANALISTA FROM SGC_ANALISTAS WHERE CODIGOUSUARIO=(SELECT GETCODIGOUSUARIO FROM DUAL))')
    else
    qPendientes.SQL.Insert(3,'');

    qPendientes.open;

    lnumpendientes.Caption := qPendientes.FieldByName('CANTIDAD').AsString;


    TRY
      lProcentajeAvance.Caption :=
        FloatToStr(Round((StrToInt(eCuentasResueltas.Caption) /
        StrToInt(eCuentasCritica.Caption)) * 100)) + ' %';
    Except
      on E: Exception Do
      BEGIN
     // ShowMessage('Se ha presetnado un error al interntar cargar el avance ' + e.Message);
        lProcentajeAvance.Caption := '0 %';
      END;
 end;
end;


PROCEdure TfListaCritica.dbgListaHijasTitleClick(Column: TColumn);
var
Nombre : String;
begin
  if Column.Field.FieldKind   = fkData then
  begin
  Nombre := 'qListaLectura';

    qListaLectura.close;
    qListaLectura.SQL.Strings[8] := 'ORDER BY '+Column.Field.FieldName+' '+ListaOrden.Values[Nombre+Column.Field.FieldName]+' ';
    qListaLectura.open;

  if ListaOrden.Values[Nombre+Column.Field.FieldName] = 'DESC' then
  ListaOrden.Values[Nombre+Column.Field.FieldName] := 'ASC'
  else
  ListaOrden.Values[Nombre+Column.Field.FieldName] := 'DESC';
 end;


end;

procedure TfListaCritica.ck(Sender: TObject);
var
  Query: TQuery;
begin
  inherited;
  try
    Query := TQuery.Create(nil);
    Query.DatabaseName := 'BaseDato';

    Query.close;
    Query.SQL.Clear;
    Query.SQL.Add
      ('UPDATE SIGCOM_LECTURA SET CODIGOUSUARIO_CRITICA=(SELECT GETCODIGOUSUARIO FROM DUAL) ,ESTADOLECTURA=''5'' ');
    Query.SQL.Add('WHERE CLAVE=' + qListaLecturaCLAVE.AsString + ' ');
    Query.ExecSQL;

    if Query.RowsAffected > 0 then
    begin
      //showmessage();
      Application.MessageBox(PChar('Se ha modificado Exitosamente el estado de la Cuenta.'), 'Información',MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
      qListaLectura.close;
      qListaLectura.open;

      qListaResueltos.close;
      qListaResueltos.open;

      qlistaLecturaPendientes.close;
      qlistaLecturaPendientes.open;

    end
    else
    begin
     Application.MessageBox(PChar('No se ha podido modificar el estado de la Cuenta.'), 'Información',MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
    end;

  finally
    Query.Free;
  end;
end;

procedure TfListaCritica.MenuItem1Click(Sender: TObject);
var
  Query: TQuery;
begin
  inherited;
  try
    Query := TQuery.Create(nil);
    Query.DatabaseName := 'BaseDato';

    Query.close;
    Query.SQL.Clear;
    Query.SQL.Add
      ('UPDATE SIGCOM_LECTURA SET CODIGOUSUARIO_CRITICA=(SELECT GETCODIGOUSUARIO FROM DUAL) ,ESTADOLECTURA=''2'' ');
    Query.SQL.Add('WHERE CLAVE=' + qlistaLecturaPendientesCLAVE.AsString + '  AND FECHA_PROGRAMADA =TO_DATE('''+FechaGlobal+''',''DD/MM/YYYY'')  ');
    Query.ExecSQL;

    if Query.RowsAffected > 0 then
    begin
      Application.MessageBox(PChar('Se ha modificado Exitosamente el estado de la Cuenta.'), 'Información',MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
      qListaLectura.close;
      qListaLectura.open;

      qListaResueltos.close;
      qListaResueltos.open;

      qlistaLecturaPendientes.close;
      qlistaLecturaPendientes.open;

    end
    else
    begin
        Application.MessageBox(PChar('No se ha podido modificar el estado de la Cuenta.'), 'Información',MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
    end;

  finally
    Query.Free;
  end;

end;

procedure TfListaCritica.qListaResueltosCalcFields(DataSet: TDataSet);
begin
  inherited;
   qExistenciaFotos.close;
  qExistenciaFotos.ParamByName('CLAVE').AsString :=    qListaResueltosCLAVE.AsString;
  qExistenciaFotos.ParamByName('FECHALECTURA').AsString := FechaGlobal;
  qExistenciaFotos.open;

  if  qExistenciaFotos.FieldByName('CANTIDAD').Asinteger>0 then
  qListaResueltosFOTOS.AsString :=  'SI'
  else
  qListaResueltosFOTOS.AsString :=  'NO';


end;

procedure TfListaCritica.qlistaLecturaPendientesCalcFields(DataSet: TDataSet);
begin
  inherited;

  qExistenciaFotos.close;
  qExistenciaFotos.ParamByName('CLAVE').AsString :=    qlistaLecturaPendientesCLAVE.AsString;
  qExistenciaFotos.ParamByName('FECHALECTURA').AsString := FechaGlobal;
  qExistenciaFotos.open;


  if  qExistenciaFotos.FieldByName('CANTIDAD').Asinteger>0 then
  qlistaLecturaPendientesFOTOS.AsString :=  'SI'
  else
  qlistaLecturaPendientesFOTOS.AsString :=  'NO';

end;

procedure TfListaCritica.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if Field.FieldName = 'ESTADOCRITICA' then
  begin
    Background := clYellow;
  end;
end;

procedure TfListaCritica.RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;

  if Field.FieldName = 'ESTADOCRITICA' then
  begin
    Background := clAqua;
  end;

end;

procedure TfListaCritica.ColocarenestadoPendiente1Click(Sender: TObject);
var
  Query: TQuery;
  Observacion: String;
  fSeleccionar : TfSeleccionarObservacion;
begin
  inherited;
fSeleccionar := TfSeleccionarObservacion.Create(Self);

 if (fSeleccionar.ShowModal = mrOk)  then
begin
//Showmessage(fSeleccionar.qDatosNOMBREOBSERVACIONCRITICA.AsString );
          try
        Query := TQuery.Create(nil);
        Query.DatabaseName := 'BaseDato';

        Query.close;
        Query.SQL.Clear;
        Query.SQL.Add
          ('UPDATE SIGCOM_LECTURA SET CODIGOUSUARIO_CRITICA=(SELECT GETCODIGOUSUARIO FROM DUAL) ,ESTADOLECTURA=''5'',CODIGOOBSERVACION='+fSeleccionar.qDatosCODIGOOBSERVACIONCRITICA.AsString+' ');
        Query.SQL.Add('WHERE CLAVE=' + qListaLecturaCLAVE.AsString + ' AND FECHA_PROGRAMADA =TO_DATE('''+FechaGlobal+''',''DD/MM/YYYY'')  ');
        Query.ExecSQL;

        if Query.RowsAffected > 0 then
        begin
  Application.MessageBox(PChar('Se ha modificado Exitosamente el estado de la Cuenta.'), 'Información',MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
          qListaLectura.close;
          qListaLectura.open;

          qListaResueltos.close;
          qListaResueltos.open;

          qlistaLecturaPendientes.close;
          qlistaLecturaPendientes.open;

        end
        else
        begin
        Application.MessageBox(PChar('No se ha podido modificar el estado de la Cuenta.'), 'Información',MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
        end;

      finally
        Query.Free;
      end;



end;
end;

procedure TfListaCritica.RxDBGrid2DblClick(Sender: TObject);
begin
  inherited;

  {try}
    // sbVistaPreliminarVLClick(Sender);
    if Assigned(FAnalisisFacturacion) THEN
    begin
      FAnalisisFacturacion.Free;
      FAnalisisFacturacion := nil;
    end;

    IF ValidarProcesoCritica(3) then
    begin
      FAnalisisFacturacion := TFAnalisisFacturacion.Create(self);
      FAnalisisFacturacion.qListaLectura.close;
      FAnalisisFacturacion.qListaLectura.ParamByName('FECHALECTURA').AsString :=
        qListaResueltos.FieldByName('FECHA_PROGRAMADA').AsString;
      FAnalisisFacturacion.qListaLectura.ParamByName('CODIGOCLAVE').AsString :=
        qListaResueltosCLAVE.AsString;
      FAnalisisFacturacion.qListaLectura.open;
      FAnalisisFacturacion.Show;
    end
    else
    begin
      FAnalisisFacturacion := TFAnalisisFacturacion.Create(self);
      FAnalisisFacturacion.sbHistorico.Enabled := true;
      FAnalisisFacturacion.qListaLectura.close;
      FAnalisisFacturacion.qListaLectura.ParamByName('FECHALECTURA').AsString :=
        qListaResueltos.FieldByName('FECHA_PROGRAMADA').AsString;
      FAnalisisFacturacion.qListaLectura.ParamByName('CODIGOCLAVE').AsString :=
        qListaResueltosCLAVE.AsString;
      FAnalisisFacturacion.qListaLectura.open;
      FAnalisisFacturacion.SpeedButton1.Enabled := False;
      FAnalisisFacturacion.SpeedButton2.Enabled := False;
      FAnalisisFacturacion.SpeedButton3.Enabled := False;
      FAnalisisFacturacion.SpeedButton6.Enabled := False;
      FAnalisisFacturacion.Show;
    end;

 { except
    on E: Exception do
      messagedlg
        ('Se ha presentado un error al intentar cargar la información de la cuenta Error :.'
        + E.Message, mtError, [mbOk], 0);
  end;   }

end;

procedure TfListaCritica.RxDBGrid1DblClick(Sender: TObject);
begin
  inherited;

{  try }
    // sbVistaPreliminarVLClick(Sender);
    if Assigned(FAnalisisFacturacion) THEN
    begin
      FAnalisisFacturacion.Free;
      FAnalisisFacturacion := nil;
    end;

    IF ValidarProcesoCritica(2) then
    begin
      FAnalisisFacturacion := TFAnalisisFacturacion.Create(self);
      FAnalisisFacturacion.qListaLectura.ParamByName('FECHALECTURA').AsString :=
        qlistaLecturaPendientes.FieldByName('FECHA_PROGRAMADA').AsString;
      FAnalisisFacturacion.qListaLectura.ParamByName('CODIGOCLAVE').AsString :=
        qlistaLecturaPendientesCLAVE.AsString;
      FAnalisisFacturacion.qListaLectura.open;
      FAnalisisFacturacion.Show;
    end
    else
    begin
      FAnalisisFacturacion := TFAnalisisFacturacion.Create(self);
      FAnalisisFacturacion.qListaLectura.ParamByName('FECHALECTURA').AsString :=
        qlistaLecturaPendientes.FieldByName('FECHA_PROGRAMADA').AsString;
      FAnalisisFacturacion.qListaLectura.ParamByName('CODIGOCLAVE').AsString :=
        qlistaLecturaPendientesCLAVE.AsString;
      FAnalisisFacturacion.qListaLectura.open;
      FAnalisisFacturacion.SpeedButton1.Enabled := False;
      FAnalisisFacturacion.SpeedButton2.Enabled := False;
      FAnalisisFacturacion.SpeedButton3.Enabled := False;
      FAnalisisFacturacion.SpeedButton6.Enabled := False;
      FAnalisisFacturacion.Show;
    end;

  {except
    on E: Exception do
      messagedlg
        ('Se ha presentado un error al intentar cargar la información de la cuenta Error :.'
        + E.Message, mtError, [mbOk], 0);
  end;   }

end;

procedure TfListaCritica.qListaLecturaCalcFields(DataSet: TDataSet);
begin
  inherited;
  qExistenciaFotos.close;
  qExistenciaFotos.ParamByName('CLAVE').AsString :=    qListaLecturaCLAVE.AsString;
  qExistenciaFotos.ParamByName('FECHALECTURA').AsString := FechaGlobal;
  qExistenciaFotos.open;
  if  qExistenciaFotos.FieldByName('CANTIDAD').Asinteger>0 then
  qListaLecturaFOTOS.AsString :=  'SI'
  else
  qListaLecturaFOTOS.AsString :=  'NO';

end;

procedure TfListaCritica.MenuItem2Click(Sender: TObject);
var
  Query: TQuery;
  Observacion: String;
  fSeleccionar : TfSeleccionarObservacion;
begin
  inherited;
fSeleccionar := TfSeleccionarObservacion.Create(Self);

 if fSeleccionar.ShowModal = mrOk then
 begin

    try
      Query := TQuery.Create(nil);
      Query.DatabaseName := 'BaseDato';

      Query.close;
      Query.SQL.Clear;
      Query.SQL.Add
        ('UPDATE SIGCOM_LECTURA SET TIPO_FACTURA=TIPOFACTURACION_CRITICA,LECTURAACTUAL=LECTURA_CONCRITICA,CONSUMOACTUAL=CONSUMO_CONCRITICA ');
        Query.SQL.Add
        (',LECTURAREACTIVA=LECTURAREACTIVA_CONCRITICA,POTENCIA=LECTURADEMANDA_CONCRITICA,CODIGOUSUARIO_CRITICA=(SELECT GETCODIGOUSUARIO FROM DUAL), ');
        Query.SQL.Add(' CONSUMO_REACTIVA=CONSUMO_REACTIVA_CONCRITICA,ESTADOLECTURA=''2'',CODIGOOBSERVACION='+fSeleccionar.qDatosCODIGOOBSERVACIONCRITICA.AsString+',DESVIACIONCONSUMO=DESVIACIONCONSUMO_CONCRITICA,DESVIACIONREACTIVA=DESVIACIONREACTIVA_CONCRITICA,DESVIACIONDEMANDA=DESVIACIONDEMANDA_CONCRITICA ');
      Query.SQL.Add('WHERE CLAVE=' + qListaResueltosCLAVE.AsString + '  AND FECHA_PROGRAMADA =TO_DATE('''+FechaGlobal+''',''DD/MM/YYYY'')  ');
      Query.ExecSQL;

      if Query.RowsAffected > 0 then
      begin
       Application.MessageBox(PChar('Se ha modificado Exitosamente el estado de la Cuenta.'), 'Información',MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

        qListaLectura.close;
        qListaLectura.open;

        qListaResueltos.close;
        qListaResueltos.open;

      //  qlistaLecturaPendientes.close;
      //  qlistaLecturaPendientes.open;

      end
      else
      begin
            Application.MessageBox(PChar('No se ha podido modificar el estado de la Cuenta.'), 'Información',MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
      end;

    finally
      Query.Free;
    end;


  end;
  end;



procedure TfListaCritica.OrdenarGrilla(Query: TQuery);
var
i : Integer;
begin
 for i := 0 to  Query.FieldDefList.Count-1 do
 begin
 ListaOrden.add(Query.Name+Query.FieldDefList[i].Name+'=DESC');
 end;
  end;

procedure TfListaCritica.RxDBGrid1TitleClick(Column: TColumn);
var
Nombre : String;
begin

  if Column.Field.FieldKind   = fkData then
  begin
  Nombre := 'qlistaLecturaPendientes';

    qlistaLecturaPendientes.close;
    qlistaLecturaPendientes.SQL.Strings[9] := 'ORDER BY '+Column.Field.FieldName+' '+ListaOrden.Values[Nombre+Column.Field.FieldName]+' ';
    qlistaLecturaPendientes.open;

  if ListaOrden.Values[Nombre+Column.Field.FieldName] = 'DESC' then
  ListaOrden.Values[Nombre+Column.Field.FieldName] := 'ASC'
  else
  ListaOrden.Values[Nombre+Column.Field.FieldName] := 'DESC';
  end;

end;

procedure TfListaCritica.RxDBGrid2TitleClick(Column: TColumn);
var
Nombre : String;
begin
  if Column.Field.FieldKind   = fkData then
  begin
  Nombre := 'qListaResueltos';

    qListaResueltos.close;
    qListaResueltos.SQL.Strings[9] := 'ORDER BY '+Column.Field.FieldName+' '+ListaOrden.Values[Nombre+Column.Field.FieldName]+' ';
    qListaResueltos.open;

  if ListaOrden.Values[Nombre+Column.Field.FieldName] = 'DESC' then
  ListaOrden.Values[Nombre+Column.Field.FieldName] := 'ASC'
  else
  ListaOrden.Values[Nombre+Column.Field.FieldName] := 'DESC';
  end;

end;

procedure TfListaCritica.ExportarPendientes1Click(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
  begin
    dsListaPendientes.DataSet.DisableControls;
    CVS1.DataSet := dsListaPendientes.DataSet;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    dsListaPendientes.DataSet.EnableControls;
  end;
end;

procedure TfListaCritica.ExportarResueltos1Click(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
  begin
    dslistaresueltos.DataSet.DisableControls;
    CVS1.DataSet := dslistaresueltos.DataSet;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    dslistaresueltos.DataSet.EnableControls;
  end;
end;

procedure TfListaCritica.Exportarotros1Click(Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
  begin
    dsReporteGeneral1.DataSet.DisableControls;
    CVS1.DataSet := dsReporteGeneral1.DataSet;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    dsReporteGeneral1.DataSet.EnableControls;
  end;
end;

end.
