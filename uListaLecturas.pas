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
unit uListaLecturas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls, Mask, RXSplit,
  Menus, MPlayer, ImgList, Registry, ComCtrls, Math, Spin;

type
  TfListaLecturas = class(TFdSgdListaBase)
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
    qprincipalSUMINISTROSLEIDOS: TIntegerField;
    qCamposCalculados: TQuery;
    qprincipalBATERIA: TStringField;
    qprincipalPORCENTAJEAVANCE: TStringField;
    qprincipalLECTOR: TStringField;
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
    qprincipalCODIGOGRUPOITINERARIO: TFloatField;
    qprincipalCODIGOITINERARIO: TFloatField;
    qprincipalAOLFINCADESDE: TFloatField;
    qprincipalAOLFINCAHASTA: TFloatField;
    qprincipalCANTIDADPG: TFloatField;
    qprincipalCODIGOADMINISTRATIVO: TFloatField;
    qprincipalCODIGOGRUPOTRABAJO: TFloatField;
    qprincipalCOLOR: TFloatField;
    qprincipalCODIGOCOORDINACIONGRUPOTRABAJO: TFloatField;
    qprincipalCODIGOESTADOITINERARIO: TFloatField;
    qprincipalCODIGOGRUPOITINERARIO_1: TFloatField;
    qprincipalCODIGOTIPOITINERARIO: TFloatField;
    qprincipalCODIGORUTA: TFloatField;
    qprincipalCODIGOGRUPOAOL: TFloatField;
    qprincipalCANTIDADSUMNISTROS: TFloatField;
    qprincipalCODIGOESTADOGRUPOITINERARIO: TFloatField;
    qprincipalACTIVO: TStringField;
    qprincipalCODIGOGRUPOAOL_1: TFloatField;
    qprincipalNOMBREGRUPOAOL: TStringField;
    qprincipalCODIGOOFICINA: TFloatField;
    qprincipalFECHAENTREGA: TDateTimeField;
    qprincipalTIPOCONSUMO: TStringField;
    qprincipalDISPERSA: TStringField;
    qprincipalCODIGODIAL: TFloatField;
    qprincipalCODIGOSEDEOPERATIVA: TFloatField;
    qprincipalPERIODO: TStringField;
    qTotal: TQuery;
    qprincipalFECHAHORAINICIAL: TStringField;
    qprincipalFECHAHORAFINAL: TStringField;
    Label1: TLabel;
    qHoraInicial: TQuery;
    qHoraFinal: TQuery;
    qNombreEstadoItinerario: TQuery;
    Splitter1: TSplitter;
    sbRefrescar: TSpeedButton;
    sbVistaPreliminarVL: TSpeedButton;
    lFechaLectura: TLabel;
    Label2: TLabel;
    lNombreSupervisor: TLabel;
    Label4: TLabel;
    lSedeOperativa: TLabel;
    Label6: TLabel;
    lDialLectura: TLabel;
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
    qprincipalCANTIDADSUMINISTROSREALES: TStringField;
    qSuministrosReales: TQuery;
    qCamposCalculadosNVLBATERIA: TStringField;
    ReabrirItinerario1: TMenuItem;
    qListaLectura: TQuery;
    qprincipalCANTIDADGEOREFERENCIADOS: TStringField;
    qprincipalCANTIDADNOGEOREFERENCIADOS: TStringField;
    qprincipalSININFORMACIONCOMERCIAL: TStringField;
    qprincipalPORCENTAJEGEOREFERENCIADOS: TStringField;
    qprincipalPORCENTAJENOGEOREFERENCIADOS: TStringField;
    qprincipalPORcENTAJESININFOCOMERCIAL: TStringField;
    qGeorefenciados: TQuery;
    qNoGeoreferenciados: TQuery;
    qSinInfoComercial: TQuery;
    qSinInfoComercialLeidos: TQuery;
    qGeoReferenciadosLeidos: TQuery;
    qNoGeoreferenciadoslLeidos: TQuery;
    SpeedButton1: TSpeedButton;
    qprincipalNOMBREGRUPOTRABAJO: TStringField;
    qprincipalNOMBREESTADO: TStringField;
    qprincipalCANTIDADRESTANTES: TIntegerField;
    qprincipalCLIENTES_EXPORTADOS: TFloatField;
    qprincipalCLIENTES_GEOREF: TFloatField;
    qprincipalCLIENTES_NOGEOREF: TFloatField;
    qprincipalCLIENTES_CONINFOCOM: TFloatField;
    qprincipalCLIENTES_SININFOCOM: TFloatField;
    qprincipalCLIENTES_LEIDOS: TFloatField;
    qprincipalFECHAPRIMERALECTURA: TDateTimeField;
    qprincipalFECHAULTIMALECTURA: TDateTimeField;
    qprincipalFECHALECTURA: TDateTimeField;
    qprincipalCLIENTES_LEIDOSPERDIDOS: TFloatField;
    sbAuditoria: TSpeedButton;
    qprincipalSUPERVISOR: TFloatField;
    qprincipalCODIGOHABILITADOR: TStringField;
    qprincipalTIPO: TStringField;
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

  private
    gSLLista, gSLListaRotulos, gSLListaDatos, gSLListaFrom: TStringList;
    ListaDireccionCampos: TStringList;
  public
    sCriterio: String;
    Lista, ListaEstadistica, ListaFrom: TStringList;
    VerFiltro: boolean;
    GrupodeTrabajo: integer;
    procedure Filtrar;
    procedure LimpiarFiltro;
    function FormatoFecha(aFecha: TField): string;
    Procedure HabilitarBotones(Bandera: boolean);
    Procedure CargarInfoItinerario;
    function CodigoSupervisor(CodSuper: String): String;
  end;

var
  fListaLecturas: TfListaLecturas;

implementation

uses uODTUrbanaRural, uElementosAsociadosODT, uCartografiaReportes,
  uFIMPComunes, uODTPadre, uQRIndicexMaterialResumen, uQRListaODTHorasExtras,
  uComunesAdministrativo, uQRListadoODT, uBuscarOdt, uEstadisticaOdt,
  uQRListaODTViaticos, uQRListaODTAuxilios, DecisionCubeBugWorkaround,
  ConsDll, uFuncionSGD, uQRODTHija, uQRODTHijaTodas, uBuscarOdtHija,
  uFIMPAdministrativo, uVistaPreliminarVL, uGaleriaPreliminar,
  uAnalisisFacturacion, uFormaEspere,UFiltrarclave, uAuditoriaSupervisor;

{$R *.DFM}

function TfListaLecturas.FormatoFecha(aFecha: TField): string;
begin
  Result := FormatDateTime('mm/dd/yyyy hh:mm:ss', aFecha.AsDateTime);
end;

procedure TfListaLecturas.FormDestroy(Sender: TObject);
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

procedure TfListaLecturas.FormShow(Sender: TObject);
begin
  { inherited;
    ListadodeHorasExtras1.visible:=not(ProcManager.CanProcExecute('_Ocultar Odt Extras'))or (varcodigousuario=0);
    ListadodeViticosCausados1.visible:=not(ProcManager.CanProcExecute('_Ocultar Odt Viaticos/Auxilios'))or (varcodigousuario=0);
    ListadodeAuxiliosCausados1.visible:=not(ProcManager.CanProcExecute('_Ocultar Odt Viaticos/Auxilios'))or (varcodigousuario=0); }
  Filtrar;
  WindowState := wsMaximized;
  if qprincipal.Active then
  lFiltroDatos.Caption := '<< FILTRO DE DATOS ' +
    IntToStr(qprincipal.RecordCount) + ' Registros  >> ';
end;

procedure TfListaLecturas.FormCreate(Sender: TObject);

begin
  inherited;
  ListaFrom := TStringList.Create;
  ListaEstadistica := TStringList.Create;
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

procedure TfListaLecturas.Filtrar;
Var
  CadFrom, s: String;
  Valor: integer;
begin
  Lista := GetQueryFiltroLecutra(ListaRotulos, ListaDatos, ListaFrom);
  If Lista <> Nil then
  begin
    qprincipal.close;

    LimpiarFiltro;

    qprincipal.SQl.Insert(8, Lista.Text);
   // qprincipal.SQL.SaveToFile('C:\Users\DESJORGE\Desktop\qprincipal.TXT');
    qprincipal.Open;

    qGrupoTrabajo.Open;

    {
      qListaLectura.close;
      qListaLectura.ParamByName('PERIODO').AsString      := qprincipalPERIODO.AsString;;
      qListaLectura.ParamByName('CODIGOITINERARIO').AsString  := qprincipalCODIGOITINERARIO.AsString;
      qListaLectura.Open;
      lDetalleSuministros.Caption := ' Detalle : Suministros leidos en  Itinerario '+qprincipalSUMINISTROSLEIDOS.AsString;
    }
    lDialLectura.Caption := qprincipalCODIGODIAL.AsString;
    lFechaLectura.Caption := qprincipalPERIODO.AsString;

    qSupervisor.close;
    qSupervisor.ParamByName('CODIGO').AsString :=
      qprincipalCODIGOCOORDINACIONGRUPOTRABAJO.AsString;
    qSupervisor.Open;

    lSedeOperativa.Caption := qSupervisorNOMBRESEDEOPERATIVA.AsString;
    lNombreSupervisor.Caption :=
      qSupervisorNOMBRECOORDINACIONGRUPOTRABAJO.AsString;

      CargarInfoItinerario;
  end;
end;

procedure TfListaLecturas.LimpiarFiltro;
begin
  qprincipal.SQl.Delete(8);
end;

procedure TfListaLecturas.SBFiltrarClick(Sender: TObject);
begin
  Filtrar;
  inherited;
end;

procedure TfListaLecturas.SBImprimirClick(Sender: TObject);
var
  punto: TPoint;
begin
  punto := Panel2.ClientToScreen(Classes.Point(sbImprimir.Left,
    sbImprimir.top));
  pmImprimir.Popup(punto.x + 10, punto.y + 10);
end;

procedure TfListaLecturas.SBOrdenarClick(Sender: TObject);
var
  punto: TPoint;
begin
  punto := Panel2.ClientToScreen(Classes.Point(SBOrdenar.Left, SBOrdenar.top));
  pmOrdenar.Popup(punto.x + 10, punto.y + 10);
end;

procedure TfListaLecturas.sbRefrescarClick(Sender: TObject);
var
  Marca: TBookmark;
begin
  inherited;

  Marca := qprincipal.GetBookmark;

  qprincipal.close;
  qprincipal.Open;
  qprincipal.GotoBookmark(Marca);

  qListaLectura.close;
  qListaLectura.Open;
end;

procedure TfListaLecturas.ExportarListaOdtPadres1Click(Sender: TObject);
var
  Query: TQuery;
  Lista1, Lista2: TStringList;
begin
  inherited;

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
  Lista1.Add('ITINERARIO');
  Lista1.Add('CODIGO DIALGEO');
  Lista1.Add('LECTOR');
  Lista1.Add('PUNTOS DE MEDIDA');
  Lista1.Add('SUMINISTROS');
  Lista1.Add('SUMINISTROS LEIDOS');
  Lista1.Add('PORCENTAJE DE AVANCE');
  Lista1.Add('HORA PRIMERA LECTURA');
  Lista1.Add('HORA ULTIMA LECTURA');
  Lista1.Add('ESTADO');
  Lista1.Add('TIPO');
  Lista2.Add(Lista1.CommaText);

  while not qprincipal.Eof do
  begin
    Lista1.Clear;
    Lista1.Add(qprincipal.fieldByName('CODIGOITINERARIO').AsString);
    Lista1.Add(qprincipal.fieldByName('CODIGOGRUPOAOL').AsString);
    Lista1.Add(qprincipal.fieldByName('NOMBREGRUPOTRABAJO').AsString);
    Lista1.Add(qprincipal.fieldByName('CANTIDADPG').AsString);
    Lista1.Add(qprincipal.fieldByName('CLIENTES_EXPORTADOS').AsString);
    Lista1.Add(qprincipal.fieldByName('CLIENTES_LEIDOS').AsString);
    Lista1.Add(qprincipal.fieldByName('PORCENTAJEAVANCE').AsString);
    Lista1.Add(qprincipal.fieldByName('FECHAPRIMERALECTURA').AsString);
    Lista1.Add(qprincipal.fieldByName('FECHAULTIMALECTURA').AsString);
    Lista1.Add(qprincipal.fieldByName('NOMBREESTADO').AsString);
    Lista1.Add(qprincipal.fieldByName('TIPO').AsString);

    Lista2.Add(Lista1.CommaText);

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

{ begin
  inherited;

  {  if SaveDialog1.Execute then
  begin
  dsprincipal.DataSet.DisableControls;
  CVS1.DataSet := dsprincipal.DataSet;
  CVS1.FileNameText := SaveDialog1.FileName;
  fFormaEspere := TfFormaEspere.Create(Application);
  fFormaEspere.ProgressBar1.Max := qprincipal.RecordCount;
  fFormaEspere.lbMotivo.Caption := 'Generando Archivo...';
  fFormaEspere.Show;
  fFormaEspere.Refresh;
  fFormaEspere.ProgressBar1.Position := 1;
  fFormaEspere.Refresh;
  CVS1.TableExport;


  dsprincipal.DataSet.EnableControls;
  fFormaEspere.lbMotivo.Caption := 'Generando datos...';
  fFormaEspere.ProgressBar1.Position := fFormaEspere.ProgressBar1.Position+1;
  fFormaEspere.Refresh;
  end;
  fFormaEspere.free; }
{ end; }

procedure TfListaLecturas.sbExportarClick(Sender: TObject);
var
  punto: TPoint;
begin
  punto := Panel2.ClientToScreen(Classes.Point(sbExportar1.Left,
    sbExportar1.top));
  pmExportar.Popup(punto.x + 10, punto.y + 10);
end;

procedure TfListaLecturas.SBBuscaElementoCartografiaClick(Sender: TObject);
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

procedure TfListaLecturas.Itinerario1Click(Sender: TObject);
begin
  inherited;
  qListaLectura.close;
  qListaLectura.SQl.Delete(9);
  qListaLectura.SQl.Insert(9, 'ORDER BY I.CODIGOITINERARIO');
  qListaLectura.Open;
end;

procedure TfListaLecturas.FechaLectura1Click(Sender: TObject);
begin
  inherited;
  qListaLectura.close;
  qListaLectura.SQl.Delete(9);
  qListaLectura.SQl.Insert(9, 'ORDER BY FECHALECTURA');
  qListaLectura.Open;
end;

procedure TfListaLecturas.sbVistaPreliminarVLClick(Sender: TObject);
var
  Registro: TRegIniFile;
  i: integer;
begin
  IF sbVistaPreliminarVL.Down = true then
  Begin
    Panel4.Visible := true;
    CargarVistaPreliminar(qListaLectura.fieldByName('CLAVE').AsString);
  end
  else
    Panel4.Visible := False;
end;

procedure TfListaLecturas.CargarVistaPreliminar(CodApoyo: string);
var
  CodigoApoyo: string;
  i: integer;
begin
  CodigoApoyo := qListaLectura.fieldByName('CLAVE').AsString;
  if CodigoApoyo <> '' then
  begin
    fGaleriaPreliminar := TfGaleriaPreliminar.CreateByparametros(Application,
      CodigoApoyo);
    fGaleriaPreliminar.FechaLectura := lFechaLectura.Caption;
    fGaleriaPreliminar.TipoDeFoto := '15,17';
    fGaleriaPreliminar.ManualDock(Panel4);
    fGaleriaPreliminar.Show;
  end;

  { for i:= Application.MainForm.MDIChildCount-1 downto 0 do
    if (Application.MainForm.MDIChildren[i] is TfListaLecturas) then
    begin }
  { CodigoApoyo:= qListaLectura.FieldByName('CLAVE').AsString;
    if  CodigoApoyo <> '' then
    begin
    if  not Assigned(fGaleriaPreliminar) then
    begin
    //showmessage('yes');
    fGaleriaPreliminar:= TfGaleriaPreliminar.CreateByparametros(Application, CodigoApoyo);
    fGaleriaPreliminar.FechaLectura := lFechaLectura.Caption;

    end
    else
    begin
    //showmessage('no');
    fGaleriaPreliminar.Align :=alClient;
    fGaleriaPreliminar.FechaLectura := lFechaLectura.Caption;
    fGaleriaPreliminar.MostrarVistaPreliminar(CodigoApoyo);
    end;

    fGaleriaPreliminar.ManualDock(Panel4);
    fGaleriaPreliminar.Show;
    end;
    {   end; }
end;

procedure TfListaLecturas.CodigodeCuenta1Click(Sender: TObject);
begin
  inherited;
  qListaLectura.close;
  qListaLectura.SQl.Delete(9);
  qListaLectura.SQl.Insert(9, 'ORDER BY CLAVE');
  qListaLectura.Open;
end;

procedure TfListaLecturas.qprincipalCalcFields(DataSet: TDataSet);
var
  Cantidad: integer;
begin
  inherited;
   if qprincipalDISPERSA.asstring = 'S' then qprincipalTIPO.asstring := 'Alto Consumidor'
   else qprincipalTIPO.asstring:='Masivo';


 { qCamposCalculados.close;
  qCamposCalculados.ParamByName('CODIGOITINERARIO').AsString :=
    qprincipalCODIGOITINERARIO.AsString;
  qCamposCalculados.ParamByName('PERIODO').AsString :=
    qprincipalPERIODO.AsString;
  qCamposCalculados.Open;

  IF qCamposCalculados.IsEmpty then
  qprincipalBATERIA.asiNTEGER :=100
  else
  qprincipalBATERIA.asiNTEGER := qCamposCalculadosNVLBATERIA.AsInteger;  }

 { qTotal.close;
  qTotal.ParamByName('CODIGOITINERARIO').AsString :=
    qprincipalCODIGOITINERARIO.AsString;
  qTotal.ParamByName('PERIODO').AsString := qprincipalPERIODO.AsString;
  qTotal.Open;      }

 { qHoraFinal.close;
  qHoraFinal.ParamByName('CODIGOITINERARIO').AsString :=
    qprincipalCODIGOITINERARIO.AsString;
  qHoraFinal.ParamByName('FECHAPROGRAMADA').AsString :=
    qprincipalPERIODO.AsString;
  qHoraFinal.Open;
  qprincipalFECHAHORAFINAL.AsString := qHoraFinal.fieldByName
    ('FECHAHORAFINAL').AsString;  }

 { qHoraInicial.close;
  qHoraInicial.ParamByName('CODIGOITINERARIO').AsString :=
    qprincipalCODIGOITINERARIO.AsString;
  qHoraInicial.ParamByName('FECHAPROGRAMADA').AsString :=
    qprincipalPERIODO.AsString;
  qHoraInicial.Open;
  qprincipalFECHAHORAINICIAL.AsString := qHoraInicial.fieldByName
    ('FECHAHORAINICIAL').AsString; }


 { Cantidad := qTotal.fieldByName('CANTIDAD').asiNTEGER;

  qSuministrosReales.close;
  qSuministrosReales.ParamByName('PERIODO').AsString :=
    qprincipalPERIODO.AsString;
  qSuministrosReales.ParamByName('CODIGOITINERARIO').AsString :=
    qprincipalCODIGOITINERARIO.AsString;
  qSuministrosReales.Open;

  qprincipalCANTIDADSUMINISTROSREALES.AsString := qSuministrosReales.fieldByName
    ('CANTIDAD').AsString;

  qprincipalSUMINISTROSLEIDOS.AsString := qTotal.fieldByName('Cantidad').AsString;
                                                                                    }
  try
   qprincipalPORCENTAJEAVANCE.AsString :=
      FloatToStr( ( (qprincipalCLIENTES_LEIDOS.AsInteger) * 100) / (qprincipalCLIENTES_EXPORTADOS.
      asiNTEGER-qprincipalCLIENTES_LEIDOSPERDIDOS.AsInteger));
  Except
    qprincipalPORCENTAJEAVANCE.AsString := '0';
  end;    


  qprincipalCANTIDADRESTANTES.AsInteger :=
   qprincipalCLIENTES_EXPORTADOS.AsInteger- qprincipalCLIENTES_LEIDOS.AsInteger;
  {
  qCamposCalculados.First;





  qGrupoTrabajo.close;
  qGrupoTrabajo.ParamByName('CODIGOADMINISTRATIVO').AsString :=
    qprincipalCODIGOADMINISTRATIVO.AsString;
  qGrupoTrabajo.ParamByName('CODIGOGRUPOTRABAJO').AsString :=
    qprincipalCODIGOGRUPOTRABAJO.AsString;
  qGrupoTrabajo.Open;
  qprincipalLECTOR.AsString := qGrupoTrabajo.fieldByName
    ('NOMBREGRUPOTRABAJO').AsString;

    qGeorefenciados.close;
    qGeorefenciados.ParamByName('CODIGOITINERARIO').AsString :=qprincipalCODIGOITINERARIO.AsString;
    qGeorefenciados.ParamByName('FECHALECTURA').AsString :=qprincipalPERIODO.AsString;
    qGeorefenciados.open;
    qprincipalCANTIDADGEOREFERENCIADOS.AsString := qGeorefenciados.FieldByName('CANTIDAD').AsString;


    qNoGeoreferenciados.close;
    qNoGeoreferenciados.ParamByName('CODIGOITINERARIO').AsString :=qprincipalCODIGOITINERARIO.AsString;
    qNoGeoreferenciados.ParamByName('FECHALECTURA').AsString :=qprincipalPERIODO.AsString;
    qNoGeoreferenciados.open;
    qprincipalCANTIDADNOGEOREFERENCIADOS.AsString := qNoGeoreferenciados.FieldByName('CANTIDAD').AsString;

    qSinInfoComercial.close;
    qSinInfoComercial.ParamByName('CODIGOITINERARIO').AsString :=qprincipalCODIGOITINERARIO.AsString;
    qSinInfoComercial.ParamByName('FECHALECTURA').AsString :=qprincipalPERIODO.AsString;
    qSinInfoComercial.open;
    qprincipalSININFORMACIONCOMERCIAL.AsString := qSinInfoComercial.FieldByName('CANTIDAD').AsString;

    qNoGeoreferenciadoslLeidos.close;
    qNoGeoreferenciadoslLeidos.ParamByName('CODIGOITINERARIO').AsString :=qprincipalCODIGOITINERARIO.AsString;
    qNoGeoreferenciadoslLeidos.ParamByName('FECHALECTURA').AsString :=qprincipalPERIODO.AsString;
    qNoGeoreferenciadoslLeidos.open;
    try
    qprincipalPORCENTAJEGEOREFERENCIADOS.AsString := FloatToStr((qNoGeoreferenciadoslLeidos.FieldByName('CANTIDAD').AsInteger/qNoGeoreferenciados.FieldByName('CANTIDAD').AsInteger)*100);
  Except
    qprincipalPORCENTAJEGEOREFERENCIADOS.AsString := '100';
  end;
    qGeoReferenciadosLeidos.close;
    qGeoReferenciadosLeidos.ParamByName('CODIGOITINERARIO').AsString :=qprincipalCODIGOITINERARIO.AsString;
    qGeoReferenciadosLeidos.ParamByName('FECHALECTURA').AsString :=qprincipalPERIODO.AsString;
    qGeoReferenciadosLeidos.open;

     try
    qprincipalPORCENTAJENOGEOREFERENCIADOS.AsString := FloatToStr((qGeoReferenciadosLeidos.FieldByName('CANTIDAD').AsInteger/qGeorefenciados.FieldByName('CANTIDAD').AsInteger)*100);
    Except
    qprincipalPORCENTAJENOGEOREFERENCIADOS.AsString := '100';
    end;
    qSinInfoComercialLeidos.close;
    qSinInfoComercialLeidos.ParamByName('CODIGOITINERARIO').AsString :=qprincipalCODIGOITINERARIO.AsString;
    qSinInfoComercialLeidos.ParamByName('FECHALECTURA').AsString :=qprincipalPERIODO.AsString;
    qSinInfoComercialLeidos.open;

  try
 qprincipalPORcENTAJESININFOCOMERCIAL.AsString    :=  FloatToStr((qSinInfoComercialLeidos.FieldByName('CANTIDAD').AsInteger/qSinInfoComercial.FieldByName('CANTIDAD').AsInteger)*100);
  Except
   qprincipalPORcENTAJESININFOCOMERCIAL.AsString :='100';
  END;   }


end;

procedure TfListaLecturas.qListaLecturaAfterOpen(DataSet: TDataSet);
begin
  lDetalleSuministros.Caption := ' Detalle : Suministros leidos en  Itinerario '
    + qprincipalSUMINISTROSLEIDOS.AsString;
end;

procedure TfListaLecturas.RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
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

procedure TfListaLecturas.Ce1Click(Sender: TObject);
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

procedure TfListaLecturas.sbRecargarClick(Sender: TObject);
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

procedure TfListaLecturas.Timer1Timer(Sender: TObject);
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

procedure TfListaLecturas.HabilitarBotones(Bandera: boolean);
begin
  sbRefrescar.Enabled := Bandera;
  SBFiltrar.Enabled := Bandera;
  SBBuscaElementoCartografia.Enabled := Bandera;
  SBSalir.Enabled := Bandera;
  sbVistaPreliminarVL.Enabled:= Bandera;
 // ToolButton1.enabled:= Bandera;
  sbExportar1.enabled:=Bandera;
  SBOrdenar.enabled:=Bandera;
  sbAuditoria.enabled:=Bandera;
  SpeedButton1.enabled:=Bandera;
  sbExportar3.enabled:=Bandera;
end;

procedure TfListaLecturas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if Assigned(fGaleriaPreliminar) then
  begin
    fGaleriaPreliminar.Free;
    fGaleriaPreliminar := nil;
  end;

end;

procedure TfListaLecturas.qprincipalAfterScroll(DataSet: TDataSet);
begin
  inherited;
  IF not qprincipal.IsEmpty then
  begin
qListaLectura.close;
qListaLectura.SQl.Clear;
qListaLectura.SQl.Add('SELECT S.CODIGOLECTURA,');
qListaLectura.SQl.Add('       S.CLAVE,');
qListaLectura.SQl.Add('         S.LECTURAACTUAL,');
qListaLectura.SQl.Add('         S.lecturaencontrada,');
qListaLectura.SQl.Add('         S.CONSUMOACTUAL,');
qListaLectura.SQl.Add('         S.CODIGOANOMALIA,');
qListaLectura.SQl.Add('         S.FECHALECTURA,');
qListaLectura.SQl.Add('         S.FECHALLEGADA,');
qListaLectura.SQl.Add('         S.FECHASALIDA,');
qListaLectura.SQl.Add('         INF.CODUBICACION,');
qListaLectura.SQl.Add('         INF.TARIFA,');
qListaLectura.SQl.Add('         S.CODIGOANOMALIACONSUMOACT,');
qListaLectura.SQl.Add('         INF.NOMBRESUSCRIPTOR,');
qListaLectura.SQl.Add('         SUBSTR(INF.direccionsucriptor, 1,100) AS direccionsucriptor ,');
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

  lDetalleSuministros.Caption := ' Suministros leidos en  Itinerario '+ IntToStr(qListaLectura.RecordCount);
   end;
end;

procedure TfListaLecturas.sbExportar3Click(Sender: TObject);
var
  punto: TPoint;
begin
  inherited;
  punto := Panel11.ClientToScreen(Classes.Point(sbExportar3.Left,
    sbExportar3.top));
  pmExportar2.Popup(punto.x + 10, punto.y + 10);
end;

procedure TfListaLecturas.MenuItem3Click(Sender: TObject);
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

procedure TfListaLecturas.ReabrirItinerario1Click(Sender: TObject);
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

procedure TfListaLecturas.qListaLecturaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  IF Panel4.Visible THEN
  BEGIN
    fGaleriaPreliminar := NIL;
    fGaleriaPreliminar.Free;
    CargarVistaPreliminar(qListaLectura.fieldByName('CLAVE').AsString);
  end;
end;

procedure TfListaLecturas.SpeedButton1Click(Sender: TObject);
var
filtro: TffiltrarClave;
begin
  inherited;
  filtro := TffiltrarClave.Create(Self);
  if filtro.ShowModal = mrOk then
  begin

   IF not qListaLectura.IsEmpty then
  begin
   qListaLectura.Locate('CLAVE',filtro.Edit1.Text,[loCaseInsensitive]);
   dbgListaHijas.SetFocus;
   end;

  end;

end;

procedure TfListaLecturas.CargarInfoItinerario;
begin
  IF not qprincipal.IsEmpty then
  begin
qListaLectura.close;
qListaLectura.SQl.Clear;
qListaLectura.SQl.Add('SELECT S.CODIGOLECTURA,');
qListaLectura.SQl.Add('       S.CLAVE,');
qListaLectura.SQl.Add('         S.LECTURAENCONTRADA,');
qListaLectura.SQl.Add('         S.CONSUMOACTUAL,');
qListaLectura.SQl.Add('         S.CODIGOANOMALIA,');
qListaLectura.SQl.Add('         S.FECHALECTURA,');
qListaLectura.SQl.Add('         S.FECHALLEGADA,');
qListaLectura.SQl.Add('         S.FECHASALIDA,');
qListaLectura.SQl.Add('         INF.CODUBICACION,');
qListaLectura.SQl.Add('         INF.TARIFA,');
qListaLectura.SQl.Add('         S.CODIGOANOMALIACONSUMOACT,');
qListaLectura.SQl.Add('         INF.NOMBRESUSCRIPTOR,');
qListaLectura.SQl.Add('         SUBSTR(INF.DIRECCIONSUCRIPTOR,0,100) as DIRECCIONSUCRIPTOR,');
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

  lDetalleSuministros.Caption := ' Suministros leidos en  Itinerario '+ IntToStr(qListaLectura.RecordCount);
   end;
end;

procedure TfListaLecturas.qprincipalAfterOpen(DataSet: TDataSet);
begin
  inherited;
CargarInfoItinerario;
end;

procedure TfListaLecturas.sbAuditoriaClick(Sender: TObject);
var
fAuditoriaSupervisor: TfAuditoriaSupervisor;
begin
  inherited;
fAuditoriaSupervisor := TfAuditoriaSupervisor.Create(Self);
//ShowMessage(IntToStr(qprincipalSUPERVISOR.AsInteger));
fAuditoriaSupervisor.origen := qprincipalSUPERVISOR.AsInteger;
fAuditoriaSupervisor.fecha := qprincipalPERIODO.AsString;
fAuditoriaSupervisor.itinerario := qprincipalCODIGOITINERARIO.AsString;
fAuditoriaSupervisor.ShowModal;
fAuditoriaSupervisor.Free;

end;
function TfListaLecturas.CodigoSupervisor(CodSuper: String): String;
begin

end;

end.
