//***************************************************************************
//                       Módulo de ODT
//               Listado de Órdenes de Trabajo
//      A través de este listado se insertan o Editan ODTs y ODTs hijas
//***************************************************************************
unit uListaODTUrbanaRural;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls, Mask, RXSplit,
  Menus, MPlayer, ImgList;

type
  TfListaODTUrbanaRural = class(TFdSgdListaBase)
    qListaODTPadre: TQuery;
    dsListaPadre: TDataSource;
    qListaODTHija: TQuery;
    dsListaHija: TDataSource;
    qListaODTHijaCODIGOODT: TFloatField;
    qListaODTHijaCONSECUTIVO: TFloatField;
    qListaODTHijaIMPRESOODT: TStringField;
    qListaODTHijaCODIGOGRUPOTRABAJO: TFloatField;
    qListaODTHijaCODIGOGEOGRAFICO: TFloatField;
    qListaODTHijaCODIGOSUBESTACION: TStringField;
    qListaODTHijaCODIGOCIRCUITO: TStringField;
    qListaODTHijaCODIGOTIPOELEMENTO: TStringField;
    qListaODTHijaCODIGOEQUIPO: TStringField;
    qListaODTHijaCOSTOMATERIAL: TFloatField;
    qListaODTHijaCOSTOMANOOBRA: TFloatField;
    qListaODTHijaCOSTOTRANSPORTE: TFloatField;
    qListaODTHijaCOSTOEQUIPO: TFloatField;
    qListaODTHijaOBSERVACION3: TStringField;
    qListaODTHijaFECHAINICIOTRABAJO: TDateTimeField;
    qListaODTHijaFECHAFINALTRABAJO: TDateTimeField;
    qListaODTHijaCostoTotalHija: TCurrencyField;
    Panel5: TPanel;
    Panel6: TPanel;
    dbgListaHijas: TRxDBGrid;
    Panel7: TPanel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    DBText1: TDBText;
    qListaODTHijaCODIGOADMINISTRATIVO: TFloatField;
    qBusquedaReportes: TQuery;
    Panel4: TPanel;
    Panel8: TPanel;
    dbgListaOdtPadre: TRxDBGrid;
    qListaODTPadreCODIGOODT: TFloatField;
    qListaODTPadreFECHAEMISION: TDateTimeField;
    qListaODTPadreCODIGOADMINISTRATIVO: TFloatField;
    qListaODTPadreCODIGOPRIORIDAD: TStringField;
    qListaODTPadreCODIGOTIPOTAREA: TFloatField;
    qListaODTPadreCODIGOAPROBADO: TFloatField;
    qListaODTPadreCODIGOODTTIPOMANOOBRA: TFloatField;
    qListaODTPadreCODIGOEJECUTOR: TFloatField;
    qListaODTPadreCODIGOFIRMANTE: TFloatField;
    qListaODTPadreFECHAAPROBACION: TDateTimeField;
    qListaODTPadreFECHAASIGNACION: TDateTimeField;
    qListaODTPadreCOSTOMATERIAL: TFloatField;
    qListaODTPadreCOSTOMANOOBRA: TFloatField;
    qListaODTPadreCOSTOTRANSPORTE: TFloatField;
    qListaODTPadreCOSTOEQUIPO: TFloatField;
    qListaODTPadreCODIGOESTADOODT: TStringField;
    qListaODTPadreNOMBREESTADOODT: TStringField;
    qListaODTPadreNOMBREPRIORIDAD: TStringField;
    qListaODTPadreNOMBRETIPOTAREA: TStringField;
    qListaODTPadreNOMBREODTTIPOMANOOBRA: TStringField;
    qListaODTPadreCODIGOREVISADO: TFloatField;
    qListaODTPadreNOMBREADMINISTRATIVO: TStringField;
    qGrupoTrabajo: TQuery;
    qListaODTHijaNombreGrupoTrabajo: TStringField;
    RxDBGrid1: TRxDBGrid;
    RxSplitter1: TRxSplitter;
    qReporte: TQuery;
    dsReporte: TDataSource;
    pmImprimir: TPopupMenu;
    MaterialesConsumidos: TMenuItem;
    qNombreMaterial: TQuery;
    qNombreMaterialCODIGOMATERIAL: TFloatField;
    qNombreMaterialNOMBREMATERIAL: TStringField;
    qNombreMaterialCODIGOUNIDAD: TStringField;
    qNombreMaterialVALORUNITARIO: TFloatField;
    ListadodeHorasExtras1: TMenuItem;
    ListadodeOdts1: TMenuItem;
    qListaODTPadreNombreAprobado: TStringField;
    pmOrdenar: TPopupMenu;
    CodigoOdt: TMenuItem;
    FechaEmision: TMenuItem;
    FechaAsignacion: TMenuItem;
    N1: TMenuItem;
    FechaAprobacion: TMenuItem;
    Prioridad: TMenuItem;
    N3: TMenuItem;
    EstadoOdt: TMenuItem;
    CIA: TMenuItem;
    Labor: TMenuItem;
    TipoTarea: TMenuItem;
    qListaODTPadreNOMBRELABOR: TStringField;
    qListaODTPadreCODIGOLABOR: TStringField;
    ListadodeViticosCausados1: TMenuItem;
    ListadodeAuxiliosCausados1: TMenuItem;
    qMaterialesODT: TQuery;
    qMaterialesODTCODIGOMATERIAL: TFloatField;
    qMaterialesODTNombreMaterial: TStringField;
    qMaterialesODTNombreUnidad: TStringField;
    sbRefrescar: TSpeedButton;
    qListaODTPadreNOMBREMUNICIPIO: TStringField;
    gbMotivos: TGroupBox;
    DBText2: TDBText;
    qListaODTPadreMotivos: TStringField;
    qApoyosOdtHIja: TQuery;
    Label6: TLabel;
    Panel9: TPanel;
    dNavigator3: TdNavigator;
    SpeedButton1: TSpeedButton;
    sbEditarHija: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Label7: TLabel;
    Panel10: TPanel;
    dNavigator2: TdNavigator;
    sbInsertar: TSpeedButton;
    sbEditarPadre: TSpeedButton;
    qListaODTHijaCOSTOACTIVIDAD: TFloatField;
    pmExportar: TPopupMenu;
    ExportarListaOdtPadres1: TMenuItem;
    ExportarListaOdtHijas1: TMenuItem;
    qListaOdtHijaExportar: TQuery;
    qMaterialesODTCANTIDADSOLICITADA: TFloatField;
    qMaterialesODTCANTIDADCONSUMIDA: TFloatField;
    qMaterialesODTCANTIDADENTREGADA: TFloatField;
    qMaterialesODTCANTIDADREINTEGRADABUENA: TFloatField;
    qMaterialesODTCANTIDADREINTEGRADAMALA: TFloatField;
    qMaterialesODTCANTIDADRETIRADABUENA: TFloatField;
    qMaterialesODTCANTIDADRETIRADAMALA: TFloatField;
    qListaODTHijaCODIGOESTADOODTDIA: TStringField;
    qListaODTHijaNombreEstadoOdt: TStringField;
    qListaODTPadreImpresoODT: TStringField;
    qListaODTHijaOBSERVACION1: TMemoField;
    qListaODTHijaOBSERVACION2: TMemoField;
    pmImprimirHija: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    Panel11: TPanel;
    SpeedButton2: TSpeedButton;
    qListaODTHijaREVISIONCOORDINADOR: TStringField;
    qListaODTHijaNOMBRECATEGORIA: TStringField;
    SBBuscarOdtHija: TSpeedButton;
    cbReportesPendientes: TCheckBox;
    cbTodosReportes: TCheckBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    GroupBox10: TGroupBox;
    DBText4: TDBText;
    GroupBox3: TGroupBox;
    DBMemo1: TDBMemo;
    GroupBox4: TGroupBox;
    DBMemo2: TDBMemo;
    qListaODTHijaDESCRIPCIONTIPOPREDIO: TMemoField;
    qListaODTHijaDireccionCalculada: TStringField;
    sbAsignarGT: TSpeedButton;
    qListaODTPadreCODIGOMODOODT: TFloatField;
    Splitter1: TSplitter;
    sbFiltroHijas: TSpeedButton;
    ilBotones: TImageList;
    procedure sbInsertarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbEditarPadreClick(Sender: TObject);
    procedure sbEditarHijaClick(Sender: TObject);
    procedure dbgListaOdtPadreGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure qListaODTHijaCalcFields(DataSet: TDataSet);
    procedure SpeedButton3Click(Sender: TObject);
    procedure qListaODTHijaAfterScroll(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure qBusquedaReportesAfterScroll(DataSet: TDataSet);
    procedure qListaODTPadreCalcFields(DataSet: TDataSet);
    procedure dbgListaOdtPadreDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgListaHijasDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure SBImprimirClick(Sender: TObject);
    procedure MaterialesConsumidosClick(Sender: TObject);
    procedure ListadodeHorasExtras1Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure Panel6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListadodeOdts1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SBOrdenarClick(Sender: TObject);
    procedure CodigoOdtClick(Sender: TObject);
    procedure FechaEmisionClick(Sender: TObject);
    procedure FechaAsignacionClick(Sender: TObject);
    procedure FechaAprobacionClick(Sender: TObject);
    procedure CIAClick(Sender: TObject);
    procedure PrioridadClick(Sender: TObject);
    procedure EstadoOdtClick(Sender: TObject);
    procedure LaborClick(Sender: TObject);
    procedure TipoTareaClick(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
    procedure dbgListaOdtPadreTitleClick(Column: TColumn);
    procedure dbgListaOdtPadreMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure SBEstadisticaClick(Sender: TObject);
    procedure ListadodeViticosCausados1Click(Sender: TObject);
    procedure ListadodeAuxiliosCausados1Click(Sender: TObject);
    procedure sbRefrescarClick(Sender: TObject);
    procedure ExportarListaOdtPadres1Click(Sender: TObject);
    procedure ExportarListaOdtHijas1Click(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure dbgListaHijasGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure SBBuscarOdtHijaClick(Sender: TObject);
    procedure cbReportesPendientesClick(Sender: TObject);
    procedure cbTodosReportesClick(Sender: TObject);
    procedure sbAsignarGTClick(Sender: TObject);
    procedure qListaODTPadreAfterScroll(DataSet: TDataSet);
    procedure sbFiltroHijasClick(Sender: TObject);
  private
    { Private declarations }
    gSLLista, gSLListaRotulos, gSLListaDatos, gSLListaFrom : TStringList;
    ListaDireccionCampos:TStringList;
    function ExisteTransaccionActual:boolean;
    procedure FiltrarODTHija;
    procedure LimpiarFiltroODTHijas;
  public
    { Public declarations }
    sCriterio : String;
    Lista,ListaEstadistica,ListaFrom : TStringList;
    VerFiltro:boolean;
    GrupodeTrabajo:integer;
    procedure TotalizarCostos;
    procedure Filtrar;
    procedure LimpiarFiltro;
    procedure Ordenar(sCriterio: String);
  end;
var
  fListaODTUrbanaRural: TfListaODTUrbanaRural;


implementation

uses uODTUrbanaRural, uElementosAsociadosODT, uCartografiaReportes,
  uFIMPComunes, uODTPadre, uQRIndicexMaterialResumen, uQRListaODTHorasExtras,
  uComunesAdministrativo, uQRListadoODT, uBuscarOdt, uEstadisticaOdt,
  uQRListaODTViaticos, uQRListaODTAuxilios, DecisionCubeBugWorkaround,
  ConsDll, uFuncionSGD, uQRODTHija, uQRODTHijaTodas, uBuscarOdtHija,
  uFIMPAdministrativo;


{$R *.DFM}

procedure TfListaODTUrbanaRural.sbInsertarClick(Sender: TObject);
 var qDatos:TQuery;
begin
  if ExisteTransaccionActual then
    raise exception.create('No puede crear una Odt porque tiene una Odt en transacción.');
  fODTPadre:=TfODTPadre.Create(Application);
  try
    fODTPadre.qODT.Close;
    fODTPadre.qODT.Open;
    if not fODTPadre.qODT.Database.InTransaction then
       fODTPadre.qODT.Database.StartTransaction;
    fODTPadre.qODT.Close;
    fODTPadre.qODT.SQL.Text:='SELECT * FROM ODT WHERE CODIGOODT = -1';
    fODTPadre.qODT.Open;
    fODTPAdre.qODT.Insert;
    fODTPadre.EstadoOdt1:= false;
    qDatos:=TQuery.Create(Application);
    fODTPadre.pSuperior.Enabled:=true;
    fODTPadre.Arbol.Enabled:=false;
    fODTPadre.Notebook.Enabled:=false;
    IniciarSesionGestionOdtHija(fODTPadre.qODTCODIGOODT.AsFloat,0);
    if fODTPadre.ShowModal=mrOK then
    begin
       fODTPadre.qODT.Database.Commit;
       qListaODTPadre.Close;
       qListaODTPadre.Open;
//       qListaODTPadre.Locate('CODIGOODT',(fODTPadre.qODTCODIGOODT.Asfloat),[])
    end
    else
       fODTPadre.qODT.Database.Rollback;
    qDatos.Free;
  except
    on e:exception do
    begin
      showmessage(e.message);
      if fODTPadre.qODT.Database.InTransaction then
        fODTPadre.qODT.Database.Rollback;
    end;
  end;
  TerminarSesionGestionOdtHija(fODTPadre.qODTCODIGOODT.AsFloat,0);
  fODTPadre.Free;
end;

procedure TfListaODTUrbanaRural.SpeedButton1Click(Sender: TObject);
  //Inserta las Medidas de Seguridad Para Cada ODT Hija
  procedure MedidasDeSeguridad(CodigoAdministrativo,CodigoODT,Consecutivo:string);
  var qDatos,qTemp:TQuery;
  begin
    qDatos:= TQuery.Create(Application);
    qTemp := TQuery.Create(Application);
    qDatos.DataBaseName  :='BaseDato';
    qTemp.DataBaseName   :='BaseDato';
    qDatos.SQL.Text:='SELECT CODIGOMEDIDASEGURIDAD FROM MEDIDASEGURIDAD WHERE '+
                     'CODIGOADMINISTRATIVO = ' + CodigoAdministrativo + ' ORDER BY ORDEN';
    qDatos.Open;

    while not qDatos.Eof do
    begin
      qTemp.Close;
      qTemp.SQL.Text:='INSERT INTO ODTMEDIDASEGURIDAD VALUES('+CodigoODT+','+
                         Consecutivo+','+qDatos.Fields[0].AsString+','+ '1)';
      qTemp.ExecSQL;
      qDatos.Next;
    end;
    qDatos.Free;
    qTemp.Free;
  end;

  procedure BorrarDatosAnteriores(CodigoODT,Consecutivo:string);
  var qTemp:TQuery;
  begin
    qTemp := TQuery.Create(Application);
    qTemp.DataBaseName  :='BaseDato';
    qTemp.SQL.Text:='DELETE FROM ODTPRESMANO WHERE CODIGOODT = ' + CodigoODt + ' AND CONSECUTIVO = ' + Consecutivo;
    qTemp.ExecSQL;
    qTemp.Close;
    qTemp.SQL.Text:='DELETE FROM ODTPRESMATE WHERE CODIGOODT = ' + CodigoODt + ' AND CONSECUTIVO = ' + Consecutivo;
    qTemp.ExecSQL;
    qTemp.Close;
    qTemp.SQL.Text:='DELETE FROM ODTMEDIDASEGURIDAD WHERE CODIGOODT = ' + CodigoODT + ' AND CONSECUTIVO = ' + Consecutivo;
    qTemp.ExecSQL;
    qTemp.Free;
  end;
var
  qDatos:TQuery;
  iConsecutivo: Integer;
begin
  if ExisteTransaccionActual then
    raise exception.create('No puede crear una Odt hija porque tiene una Odt en transacción.');

  if qListaODTPadreCODIGOODT.AsString <> '' then
  begin
    if qListaODTPadreCODIGOESTADOODT.AsString = '6' then
    begin
      MessageDlg('Orden de trabajo terminada, imposible agregar otra nota de trabajo. ' + Chr(13) +
                 'Por favor consulte con el administrador del sistema.',mtError,[mbOk],0);
      Exit;
    end;
    if qListaODTPadreCODIGOAPROBADO.AsString = '' then
    begin
      MessageDlg('No se pueden agregar trabajos porque esta ODT No ha sido aprobada.  ' + Chr(13) +
                 'Diríjase a la pestaña generales de la ODT padre.',mtError,[mbOk],0);
      Exit;
    end;
    GrupodeTrabajo:= 0;
    fODTUrbanaRural:=TfODTUrbanaRural.Create(Application);
    fODTUrbanaRural.bEsHijaNueva:= True;
    try
      fODTUrbanaRural.sbcrearintervencion.Enabled:= true;
      fODTUrbanaRural.qODTPadre.Close;
      fODTUrbanaRural.qODTPadre.SQL.Add('WHERE CODIGOODT = '+qListaODTPadreCODIGOODT.AsString);
      fODTUrbanaRural.qODTPadre.Open;

      if FOdtUrbanaRural.EditarODT then
      begin
        fODTUrbanaRural.qODTHija.SQL.Add('WHERE CODIGOODT = -1');
        fODTUrbanaRural.qODTHija.Close;
        fODTUrbanaRural.qODTHija.Open;
        fODTUrbanaRural.qODTHija.Insert;
        fODTUrbanaRural.qODTHija.FieldByName('CODIGOODT').AsFloat:=fODTUrbanaRural.qODTPadre.FieldByName('CODIGOODT').AsFloat;

        qDatos:=TQuery.Create(nil);
        qDatos.DatabaseName:='BaseDato';
        qDatos.SQL.Text:='SELECT MAX(CONSECUTIVO) FROM ODTDIA WHERE CODIGOODT='+qListaODTPadreCODIGOODT.AsString;
        qDatos.Open;
        iConsecutivo:= qDatos.Fields[0].AsInteger + 1;
        qDatos.Close;
        qDatos.Free;
        fODTUrbanaRural.qODTHija.FieldByName('CONSECUTIVO').AsInteger:= iConsecutivo;

        fODTUrbanaRural.qODTHija.FieldByName('IMPRESOODT').AsString:=FOdtUrbanaRural.GenerarImpreso;
        fODTUrbanaRural.qODTHija.Post;
        fODTUrbanaRural.IdSesion := IniciarSesionGestionOdtHija(fODTUrbanaRural.qODTHijaCODIGOODT.AsFloat,
                            fODTUrbanaRural.qODTHijaCONSECUTIVO.AsFloat);

        fODTUrbanaRural.qtrans.Open;
        if not fODTUrbanaRural.qtrans.Database.InTransaction then
          fODTUrbanaRural.qtrans.Database.StartTransaction;

        fODTUrbanaRural.qODTPadre.Edit;
        fODTUrbanaRural.qODTHija.Edit;
        
        BorrarDatosAnteriores(qListaODTPadreCODIGOODT.AsString, fODTUrbanaRural.qODTHijaCONSECUTIVO.AsString);
        MedidasDeSeguridad(qListaODTPadreCODIGOADMINISTRATIVO.AsString, qListaODTPadreCODIGOODT.AsString,
                           fODTUrbanaRural.qODTHijaCONSECUTIVO.AsString);

        fODTUrbanaRural.VehiculosAnteriores;
        fODTUrbanaRural.PersonalAnterior;
        fODTUrbanaRural.MovilAnterior;

        fODtUrbanaRural.Show;
      end
      else
        raise exception.create('Este usuario no tiene permiso para Generar ODT para el área.');
    except
      on e:Exception do
      begin
        showmessage(e.message);
        fODtUrbanaRural.Free;
      end;
    end;
  end;
end;

procedure TfListaODTUrbanaRural.sbEditarPadreClick(Sender: TObject);
var
  qconsulta:tquery;
  bm, bm2:TBookmark;
  query:tquery;
  cont: integer;
  sl:tstringlist;
begin
  if ExisteTransaccionActual then
    raise exception.create('No puede editar una Odt porque tiene una Odt en transacción.');

  query := TQuery.Create(self);
  query.DatabaseName := 'BaseDato';

  query.sql.add('select s.sid,u.codigousuario,us.loginusuario,s.osuser,s.terminal');
  query.sql.add('from v$session s,usuariots_log u,sesiongestion g, usuario us');
  query.sql.add('where s.audsid=U.idsesionbd');
  query.sql.add('and g.idsesionbd=u.idsesionbd');
  query.sql.add('and g.fechafin is null');
  query.sql.add('and g.tipogestion = ''O''');
  query.sql.add('and g.clave1 = '+ qListaODTPadreCODIGOODT.AsString);
  query.sql.add('and u.codigousuario=us.codigousuario');
  query.open;

  cont:= query.RecordCount;

  if cont>0 then
    raise exception.create('No se puede acceder esta Orden de Trabajo porque está siendo utilizada por el siguiente usuario.'
    + #13 + '[SESION : '+ query.fieldbyname('SID').Asstring + '] [USUARIO : '+query.fieldbyname('loginusuario').Asstring+'] [TERMINAL : '+query.fieldbyname('terminal').Asstring+']');
  query.free;

  fODTPadre:=TfODTPadre.Create(Application);
  try
    fODTPadre.qODT.Close;
    fODTPadre.qODT.SQL.Text:='SELECT * FROM ODT WHERE CODIGOODT = ' + qListaODTPadreCODIGOODT.AsString;
    fODTPadre.qODT.Open;
    fODTPadre.qAnticipoViaticoInicial.open;
    fODTPadre.qODT.Edit;
    bm:=qListaODTPadre.GetBookmark;
    bm2:=qListaODTHija.GetBookmark;
    fODTPadre.EstadoOdt1:= true;
    IniciarSesionGestionOdtHija(fODTPadre.qODTCODIGOODT.AsFloat,0);
    fODTPadre.qODTCODIGOMODOODTValidate(fODTPadre.qODTCODIGOMODOODT);
    if not fODTPadre.qODT.Database.InTransaction then
       fODTPadre.qODT.Database.StartTransaction;
    if fODTPadre.ShowModal=MrOK then
    begin
      qListaODTPadre.DisableControls;
      qListaODTHija.DisableControls;
      fODTPadre.qODT.Database.Commit;
      TotalizarCostos;
      qListaODTPadre.Close;
      qListaODTPadre.Open;
      qListaODTPadre.GotoBookmark(bm);
      qListaODTPadre.EnableControls;
      qListaODTHija.GotoBookmark(bm2);
      qListaODTHija.EnableControls;
    end
    else
      fODTPadre.qODT.Database.Rollback;
    if fODTPadre.anticiposimpresos <> '' then
    Begin
      Delete(fODTPadre.anticiposimpresos, Length(fODTPadre.anticiposimpresos), 1);
      //showmessage(fODTPadre.anticiposimpresos);
      qConsulta := TQuery.Create(Application);
      qConsulta.DataBaseName  :='BaseDato';
      qConsulta.sql.add('update odtviatico set impresoanticipo = ''S'' where codigoviatico in ('+fODTPadre.anticiposimpresos+')  ');

      qConsulta.ExecSQL;
      qConsulta.free;
    end;
  except
    on e:exception do
    begin
      sl:=tstringlist.create;
      sl.Add(e.message);
      sl.SaveToFile(GetTemporalPath+'\Error Odt Padre.txt');
    end;
  end;
  TerminarSesionGestionOdtHija(fODTPadre.qODTCODIGOODT.AsFloat,0);
  fODTPadre.Free;
  if sl<>nil then
  begin
    showmessage('Se presentó un error al abrir la Odt Padre.  Para mayor información consulte el log:'+ GetTemporalPath+'\Error Odt Padre.txt ');
    sl.free;
    sl:=nil;
  end;
end;

procedure TfListaODTUrbanaRural.sbEditarHijaClick(Sender: TObject);
var
  qconsulta,query: tquery;
  bm1,bm2:TBookmark;
  cont: integer;
  sSID, sUsuario, sTerminalAct, sTerminalReg: string;
begin
  sSID:='';
  sUsuario:='';
  sTerminalAct:='';
  sTerminalReg:='';

  if ExisteTransaccionActual then
    raise exception.create('No puede editar una Odt hija porque tiene una Odt en transacción.');

  query := TQuery.Create(nil);
  query.DatabaseName := 'BaseDato';
  query.SQL.Clear;
  query.sql.add('select s.sid,u.codigousuario,us.loginusuario,s.osuser,s.terminal');
  query.sql.add('from v$session s,usuariots_log u,sesiongestion g, usuario us');
  query.sql.add('where s.audsid=U.idsesionbd');
  query.sql.add('and g.idsesionbd=u.idsesionbd');
  query.sql.add('and g.fechafin is null');
  query.sql.add('and g.tipogestion = ''O''');
  query.sql.add('and g.clave1 = '+ qListaODTPadreCODIGOODT.AsString);
  query.sql.add('and g.clave2 = '+ qListaODTHijaCONSECUTIVO.AsString);
  query.sql.add('and u.codigousuario=us.codigousuario');
  query.Open;
  cont:= query.RecordCount;
  if cont>0 then
  begin
    sSID:=query.FieldByName('SID').AsString;
    sUsuario:=query.FieldByName('loginusuario').AsString;
    sTerminalReg:=query.FieldByName('terminal').AsString;
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('SELECT V.TERMINAL FROM V$SESSION V WHERE V.AUDSID = SYS_CONTEXT (''USERENV'',''SESSIONID'')');
    query.Open;
    sTerminalAct:=query.FieldByName('TERMINAL').AsString;
    query.Close;
    if sTerminalReg <> sTerminalAct then
    begin
      query.Free;
      raise exception.create('No se puede acceder esta Orden de Trabajo porque está siendo utilizada por el siguiente usuario.'
                                 + #13 + '[SESION : '+sSID+ '] [USUARIO : '+sUsuario+'] [TERMINAL : '+sTerminalReg+']');
    end;
  end;
  query.Close;
  query.Free;

  bm1:=qListaODTPadre.GetBookmark;
  bm2:=qListaODTHija.GetBookmark;
  GrupodeTrabajo:= qlistaodthija.fieldbyname('codigogrupotrabajo').asinteger;
  if not qListaODTHijaCODIGOODT.DataSet.isempty then
  begin
    fODTUrbanaRural:=TfODTUrbanaRural.Create(Application);
    try
      qListaODTHija.DisableControls;
      //****************ODTINTERVENCION  codigo Omar***********************************
      qConsulta := TQuery.Create(Application);
      qConsulta.DatabaseName := 'BaseDato';
      qConsulta.SQL.Add('SELECT count(*) FROM odtintervencion');
      qConsulta.SQL.Add('WHERE CODIGOODT = '+qListaODTHijaCODIGOODT.AsString);
      qConsulta.SQL.Add('AND CONSECUTIVO = '+qListaODTHijaCONSECUTIVO.AsString);
      qConsulta.Open;
      if qConsulta.Fields[0].AsFLOAT <> 0 then
      begin
        fODTUrbanaRural.IntervencionCreada:= true;
        fODTUrbanaRural.sbEditarIntervencion.Enabled := true;
        fODTUrbanaRural.sbAgregarRequisicion.Enabled := true;
        fODTUrbanaRural.sbEditarRequisicion.Enabled := true;
        fODTUrbanaRural.sbImprimirRequisicion.Enabled := true;
      end
      else
      fODTUrbanaRural.sbCrearIntervencion.Enabled := true;
      qConsulta.Close;
      qConsulta.Free;
      //*****************************************************************************************
      fODTUrbanaRural.qODTPadre.Close;
      fODTUrbanaRural.qODTPadre.SQL.Add('WHERE CODIGOODT = '+qListaODTHijaCODIGOODT.AsString);
      fODTUrbanaRural.qODTPadre.Open;

      fODTUrbanaRural.qODTHija.Close;
      fODTUrbanaRural.qODTHija.SQL.Add('WHERE CODIGOODT = '+qListaODTHijaCODIGOODT.AsString);
      fODTUrbanaRural.qODTHija.SQL.Add('AND CONSECUTIVO = '+qListaODTHijaCONSECUTIVO.AsString);
      fODTUrbanaRural.qODTHija.Open;
      fODTUrbanaRural.IdSesion := IniciarSesionGestionOdtHija(fODTUrbanaRural.qODTHijaCODIGOODT.AsFloat,
                                  fODTUrbanaRural.qODTHijaCONSECUTIVO.AsFloat);

      fODTUrbanaRural.qtrans.Open;
      if not fODTUrbanaRural.qtrans.Database.InTransaction then
         fODTUrbanaRural.qtrans.Database.StartTransaction;

      if fODTUrbanaRural.qODTHijaCODIGOTIPOACTIVO.asinteger = 1 then
        fODTUrbanaRural.nbActivo.ActivePage:= 'SubEstacion';
      if fODTUrbanaRural.qODTHijaCODIGOTIPOACTIVO.asinteger = 2 then
        fODTUrbanaRural.nbActivo.ActivePage:= 'linea';
      if fODTUrbanaRural.qODTHijaCODIGOTIPOACTIVO.asinteger = 3 then
        fODTUrbanaRural.nbActivo.ActivePage:= 'circuito';
      fODTUrbanaRural.qODTPadre.Edit;
      fODTUrbanaRural.qODTHija.Edit;
      fODtUrbanaRural.Show;

      {TotalizarCostos;
      qListaODTHija.Close;
      qListaODTHija.Open;
      qListaODTHija.GotoBookmark(bm2);
      dbgListaHijas.SetFocus; }
      qListaODTHija.EnableControls;
    except
      on e:exception do
      begin
        showmessage(e.message);
        fODtUrbanaRural.Free;
      end;
    end;
  end
  else
    Application.MessageBox(PChar('No existen ODTs hijas para esta ODT'),PChar('Confirmación'),MB_ICONERROR+MB_OK);
end;

procedure TfListaODTUrbanaRural.dbgListaOdtPadreGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
 if (Field.FieldName='NOMBREESTADOODT') and (qListaODTPadreCODIGOESTADOODT.AsString <> '') then
  begin

     case qListaODTPadreCODIGOESTADOODT.AsInteger of
        0:begin
           Background:=$000080FF;
           AFont.Color:=clBlue;
           end;
        1: begin
           Background:=clYellow;
           AFont.Color:=clBlue;
           end;
        2:Background:=65280;
        6:Background:=8421376;
     end;
  end;
end;

procedure TfListaODTUrbanaRural.qListaODTHijaCalcFields(DataSet: TDataSet);
var query:tquery;
    Direccion:string;
begin
  Direccion:='';
  if qListaODTHijaCODIGOESTADOODTDIA.AsString<>'' then
  begin
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.clear;
    query.sql.add('SELECT NOMBREESTADOODT FROM ESTADOODT WHERE CODIGOESTADOODT='''+qListaODTHijaCODIGOESTADOODTDIA.AsString+'''');
    query.open;
    qListaODTHijaNombreEstadoOdt.AsString:=query.Fieldbyname('NOMBREESTADOODT').asstring;
    query.close;
    query.free;
  end;
  qListaODTHijaCostoTotalHija.AsFloat:=qListaODTHijaCOSTOMATERIAL.AsFloat + qListaODTHijaCOSTOMANOOBRA.AsFloat +
                                       qListaODTHijaCOSTOTRANSPORTE.AsFloat+qListaODTHijaCOSTOEQUIPO.AsFloat;

  if DataSet.FieldByName('DESCRIPCIONTIPOPREDIO').AsString <> '' then
    Direccion:= Direccion + ' ' + DataSet.FieldByName('DESCRIPCIONTIPOPREDIO').AsString;
  DataSet.FieldByName('DIRECCIONCALCULADA').AsString:=TrimLeft(Direccion);

end;

procedure TfListaODTUrbanaRural.TotalizarCostos;
var qDatos, qActualizar:TQuery;
    i:integer;
begin

  qListaODThija.First;
  while not qListaODThija.eof do
  begin
    CostosOdtHija(qListaODTHijaCODIGOODT.AsInteger,qListaODTHijaCONSECUTIVO.AsInteger);
    qListaODThija.next;
  end;

  qDatos      :=TQuery.Create(Application);
  qActualizar :=TQuery.Create(Application);
  qDatos.DatabaseName      :='BaseDato';
  qActualizar.DatabaseName :='BaseDato';

  qDatos.SQL.Text:='SELECT SUM(NVL(COSTOMATERIAL,0)) AS SUMAMATERIAL, SUM(NVL(COSTOMANOOBRA,0)) AS SUMAMANOOBRA, '+
                   'SUM(NVL(COSTOTRANSPORTE,0)) AS SUMATRANSPORTE, SUM(NVL(COSTOEQUIPO,0)) AS SUMAEQUIPO FROM ODTDIA WHERE CODIGOODT = '+ qListaODTPadreCODIGOODT.AsString;
  qDatos.Open;

  qActualizar.SQL.Text:='UPDATE ODT SET COSTOMATERIAL = :COSTOMATERIAL, COSTOMANOOBRA = :COSTOMANOOBRA, COSTOTRANSPORTE=:COSTOTRANSPORTE, '+
                        'COSTOEQUIPO = :COSTOEQUIPO WHERE CODIGOODT = '+qListaODTPadreCODIGOODT.AsString;
  qActualizar.ParamByName('COSTOMATERIAL').AsFloat   :=qDatos.FieldByName('SUMAMATERIAL').AsFloat;
  qActualizar.ParamByName('COSTOMANOOBRA').AsFloat   :=qDatos.FieldByName('SUMAMANOOBRA').AsFloat;
  qActualizar.ParamByName('COSTOEQUIPO').AsFloat     :=qDatos.FieldByName('SUMAEQUIPO').AsFloat;
  qActualizar.ParamByName('COSTOTRANSPORTE').AsFloat :=qDatos.FieldByName('SUMATRANSPORTE').AsFloat;
  qActualizar.ExecSQL;
  qDatos.Free;
  qActualizar.Free;
end;

procedure TfListaODTUrbanaRural.SpeedButton3Click(Sender: TObject);
begin
{if qListaODTHijaCODIGOODT.AsString <> '' then
begin
  if not Assigned(Application.FindComponent('fElementosAsociadosODT') as TForm) then
  begin
    fElementosAsociadosODT:=TfElementosAsociadosODT.Create(Application);
    with fElementosAsociadosODT do
    begin
      qElementos.Close;
      qElementos.ParamByName('CODIGOODT').AsString:=qListaODTHijaCODIGOODT.AsString;
      qElementos.ParamByName('CONSECUTIVO').AsString:=qListaODTHijaCONSECUTIVO.AsString;
      qElementos.Open;
      Show;
    end;
  end
  else
   with fElementosAsociadosODT do
    begin
      qElementos.Close;
      qElementos.ParamByName('CODIGOODT').AsString:=qListaODTHijaCODIGOODT.AsString;
      qElementos.ParamByName('CONSECUTIVO').AsString:=qListaODTHijaCONSECUTIVO.AsString;
      qElementos.Open;
      Show;
    end;
end;          }
end;

procedure TfListaODTUrbanaRural.qListaODTHijaAfterScroll(
  DataSet: TDataSet);
begin
{  if Assigned(Application.FindComponent('fElementosAsociadosODT') as TForm) then
  with fElementosAsociadosODT do
    begin
      qElementos.Close;
      qElementos.ParamByName('CODIGOODT').AsString:=qListaODTHijaCODIGOODT.AsString;
      qElementos.ParamByName('CONSECUTIVO').AsString:=qListaODTHijaCONSECUTIVO.AsString;
      qElementos.Open;
      Show;
    end;     }
end;

procedure TfListaODTUrbanaRural.FormDestroy(Sender: TObject);
begin
  ListaFrom.Free;
  ListaEstadistica.Free;
  gSLLista.Free;
  gSLListaRotulos.Free;
  gSLListaDatos.Free;
  gSLListaFrom.Free;
  inherited;
end;

procedure TfListaODTUrbanaRural.SpeedButton4Click(Sender: TObject);
begin
{  if qListaODTHijaCODIGOODT.AsString <> '' then
  begin
    qBusquedaReportes.Close;
    qBusquedaReportes.Open;

    if not Assigned(Application.FindComponent('fCartografiaReportes') as TForm) then
       fCartografiaReportes:=TfCartografiaReportes.Create(Application);

    with fCartografiaReportes do
    begin
       dsBusqueda.DataSet:=qBusquedaReportes;
    end;
    fCartografiaReportes.Show;
  end; }
end;

procedure TfListaODTUrbanaRural.qBusquedaReportesAfterScroll(
  DataSet: TDataSet);
begin

  if Assigned(Application.FindComponent('fCartografiaReportes') as TForm) then
  begin
      if DataSet.Fields[0].AsString <> '' then
      begin
      fCartografiaReportes.StatusBar1.SimpleText:='Reporte '+DataSet.Fields[0].AsString;
      if BuscarReporte(DataSet.FieldByName('CODIGOREPORTE').AsInteger,True) then
      begin
         MostrarMapa;
         fCartografiaReportes.StatusBar1.SimpleText:='Reporte '+DataSet.Fields[0].AsString + ' Ubicado.';
      end
      else
         fCartografiaReportes.StatusBar1.SimpleText:='Reporte '+DataSet.Fields[0].AsString + ' No Ubicado.';
      end;   
  end;

end;

procedure TfListaODTUrbanaRural.qListaODTPadreCalcFields(
  DataSet: TDataSet);
var s1,s2:string;
    i:Integer;
    query:tquery;
begin
  qListaODTPadre.FieldbyName('ImpresoODT').AsString:='';
  s1:=copy(DataSet.FieldByName('CODIGOODT').AsString,7,5);
  s2:='';
  qListaODTPadre.FieldbyName('ImpresoODT').AsString:=s1 + '-0';
  query:=TQuery.create(Application);
  query.databasename:='BaseDato';
  query.sql.text:='select replace(replace(replace(motivos,ascii(13),'' ''),ascii(9),'' ''),ascii(11),'' '') motivos from odt WHERE CODIGOODT='+qListaODTPadreCODIGOODT.asstring;
  query.open;
  qListaODTPadre.FieldbyName('MOTIVOS').AsString:=query.fieldbyname('MOTIVOS').asstring;
  query.close;
  if qListaODTPadreCODIGOESTADOODT.AsString<>'' then
  begin
    query.sql.clear;
    query.sql.add('SELECT NOMBREESTADOODT FROM ESTADOODT WHERE CODIGOESTADOODT='''+qListaODTPadreCODIGOESTADOODT.AsString+'''');
    query.open;
    qListaODTPadreNombreEstadoOdt.AsString:=query.Fieldbyname('NOMBREESTADOODT').asstring;
    query.close;
  end;
  query.free;
end;

procedure TfListaODTUrbanaRural.dbgListaOdtPadreDblClick(Sender: TObject);
begin
  inherited;
  if qListaODTPadreCODIGOODT.AsString <> '' then
    sbEditarPadreClick(nil);
end;

procedure TfListaODTUrbanaRural.FormShow(Sender: TObject);
begin
  inherited;
  ListadodeHorasExtras1.visible:=not(ProcManager.CanProcExecute('_Ocultar Odt Extras'))or (varcodigousuario=0);
  ListadodeViticosCausados1.visible:=not(ProcManager.CanProcExecute('_Ocultar Odt Viaticos/Auxilios'))or (varcodigousuario=0);
  ListadodeAuxiliosCausados1.visible:=not(ProcManager.CanProcExecute('_Ocultar Odt Viaticos/Auxilios'))or (varcodigousuario=0);
  Filtrar;
  WindowState:= wsMaximized;
end;

procedure TfListaODTUrbanaRural.dbgListaHijasDblClick(Sender: TObject);
begin
  inherited;
 { if qListaODTHijaCODIGOODT.AsString <> '' then
    sbEditarHijaClick(nil); }
    
end;

procedure TfListaODTUrbanaRural.FormCreate(Sender: TObject);
begin
  inherited;
  ListaFrom := TStringList.Create;
  ListaEstadistica := TStringList.Create;
  ListaDireccionCampos:=TStringList.Create;
  ListaDireccionCampos.Add('CODIGOODT=-1');
  ListaDireccionCampos.Add('CODIGOADMINISTRATIVO=-1');
  ListaDireccionCampos.Add('FECHAEMISION=-1');
  ListaDireccionCampos.Add('FECHAAPROBACION=-1');
  ListaDireccionCampos.Add('FECHAASIGNACION=-1');
  ListaDireccionCampos.Add('CODIGOESTADOODT=-1');
  ListaDireccionCampos.Add('CODIGOLABOR=-1');
  ListaDireccionCampos.Add('CODIGOPRIORIDAD=-1');
  ListaDireccionCampos.Add('CODIGOTIPOTAREA=-1');
  qReporte.Open;
  qListaODTHija.Open;
  qGrupoTrabajo.Open;
  qNombreMaterial.Open;
  Panel3.Visible:= False;
  gSLLista := TStringList.Create;
  gSLListaRotulos := TStringList.Create;
  gSLListaDatos := TStringList.Create;
  gSLListaFrom := TStringList.Create;
end;

procedure TfListaODTUrbanaRural.Filtrar;
Var CadFrom,s : String;
begin
  Lista := GetQueryFiltroODT(ListaRotulos, ListaDatos, ListaFrom);
  If Lista <> Nil then
  begin
    qListaODTPadre.Close;
    qTotales.close;
    If qListaODTPadre.sql.Count > 14 then LimpiarFiltro;
    qListaODTPadre.SQl.Insert(13,Lista.Text);qTotales.sql.Insert(13,Lista.Text);
    qListaODTHijaexportar.SQl.Insert(16,Lista.Text);
    CadFrom := 'FROM ODT O, ESTADOODT EO, PRIORIDAD P, LABOR L, TIPOTAREA TT, ODTTIPOMANOOBRA MO, ADMINISTRATIVO A, ODTDIA OD,MUNICIPIO M, ODTSOBRETIEMPO HE';
    if ListaFrom.Count > 0 then
      CadFrom := CadFrom + ',' + ListaFrom.Text;
    qListaODTPadre.SQL[5]:= CadFrom;
    qTotales.SQL[5]:=CadFrom;
//  end;
   qListaODTPadre.Open;
   qTotales.Open;
   if qTotales.fieldByName('Total').AsInteger > 1
   then lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + qTotales.fieldByName('Total').AsString+' Registros Encontrados >>'
   else lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + qTotales.fieldByName('Total').AsString+' Registro Encontrado >>';
  end;
end;

procedure TfListaODTUrbanaRural.LimpiarFiltro;
var
 nLineasExtra,i: Byte;
begin
 nLineasExtra := qListaODTPadre.SQL.Count-14;
 if nLineasExtra > 0 then
    for i:=1 to nLineasExtra do
     begin
      qListaODTPadre.SQL.Delete(13);
      qTotales.SQL.Delete(13);
      qListaOdtHijaExportar.SQL.Delete(16);
     end;
end;

procedure TfListaODTUrbanaRural.SBFiltrarClick(Sender: TObject);
begin
  Filtrar;
  inherited;
end;

procedure TfListaODTUrbanaRural.SBImprimirClick(Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel2.ClientToScreen(Classes.Point(sbImprimir.Left, sbImprimir.top));
  pmImprimir.Popup(punto.x+10, punto.y+10);
end;


procedure TfListaODTUrbanaRural.ListadodeOdts1Click(Sender: TObject);
begin
  FQRListadoODT := TFQRListadoODT.Create(Application);
  FQRListadoODT.ListaDatos.Assign(ListaDatos);
  FQRListadoODT.ListaRotulos.Assign(ListaRotulos);
  with FQRListadoODT do
  begin
    qrTitulo.Caption:='';
    dsodt.DataSet := qListaODTPadre;
    qNombresEmpleados.DataSource := dsListaPadre;
    qNombresEmpleados.Close;
    qNombresEmpleados.Open;
    QuickRep.DataSet:=qListaODTPadre;
    qrdbCodigoOdt.DataSet:=qListaODTPadre;
    qrdbCodigoAdministrativo.DataSet:=qListaODTPadre;
    qrdbFechaEmision.DataSet:=qListaODTPadre;
    qrdbFechaAsignacion.DataSet:=qListaODTPadre;
    qrdbFechaAprobacion.DataSet:=qListaODTPadre;
    qrdbNombrePrioridad.DataSet:=qListaODTPadre;
    qrdbNombreLabor.DataSet:=qListaODTPadre;
    qrdbNombreTipoTarea.DataSet:=qListaODTPadre;
    qrdbCodigoEstadoODT.DataSet:=qListaODTPadre;
    qrdbConsecutivo.DataSet:=qODTDia;
    qrdbCodigoReporte.DataSet:=qODTDia;
    qrdbNombreGrupoTrabajo.DataSet:=qODTDia;
    qrdbObservacion1.DataSet:=qODTDia;
    qrdbObservacion2.DataSet:=qODTDia;
    if not qODTDia.Active then qODTDia.Open;
  end;
  FQRListadoODT.QuickRep.Preview;
end;

procedure TfListaODTUrbanaRural.MaterialesConsumidosClick(Sender: TObject);
var i: Integer;
begin
  with qMaterialesODT do
  begin
    Active := False;
    SQL.Clear;
    SQL.Add('SELECT PM.CODIGOMATERIAL, SUM(NVL(CANTIDADSOLICITADA,0)) CANTIDADSOLICITADA, SUM(NVL(CANTIDADCONSUMIDA,0)) CANTIDADCONSUMIDA,');
    SQL.Add('SUM(NVL(CANTIDADENTREGADA,0)) CANTIDADENTREGADA, SUM(NVL(CANTIDADREINTEGRADABUENA,0)) CANTIDADREINTEGRADABUENA, SUM(NVL(CANTIDADREINTEGRADAMALA,0)) CANTIDADREINTEGRADAMALA,');
    SQL.Add('SUM(NVL(CANTIDADRETIRADABUENA,0)) CANTIDADRETIRADABUENA, SUM(NVL(CANTIDADRETIRADAMALA,0)) CANTIDADRETIRADAMALA');
    SQL.Add(qListaODTPadre.SQL[5] + ', ODTPRESMATE PM');
    for i := 6 to qListaODTPadre.SQL.Count - 1 do
    begin
      if Pos('ORDER BY',UpperCase(qListaODTPadre.SQL[i])) = 0 then
        SQL.Add(qListaODTPadre.SQL[i]);
    end;
    SQL.Add('AND (PM.CODIGOODT = OD.CODIGOODT)');
    SQL.Add('AND (PM.CONSECUTIVO = OD.CONSECUTIVO)');
    SQL.Add('GROUP BY PM.CODIGOMATERIAL');

  end;
  qMaterialesODT.Open;
  FQRIndicexMaterialResumen := TFQRIndicexMaterialResumen.Create(Application);
  FQRIndicexMaterialResumen.ListaRotulos.Assign(ListaRotulos);
  FQRIndicexMaterialResumen.ListaDatos.Assign(ListaDatos);
  with FQRIndicexMaterialResumen do
  begin
    TituloReporte.Caption                  := 'MATERIALES CONSUMIDOS POR ODT''S';
    qrTitulo.Caption                       := '';
    QuickRep.DataSet                       := qMaterialesODT;
    qrdbCodigo.DataSet                     := qMaterialesODT;
    qrdbNombreMaterial.DataSet             := qMaterialesODT;
    qrdbNombreUnidad.DataSet               := qMaterialesODT;
    qrdbCantidadSolicitada.DataSet         := qMaterialesODT;
    qrdbCantidadEntregada.DataSet          := qMaterialesODT;
    qrdbCantidadConsumida.DataSet          := qMaterialesODT;
    qrdbCantidadReintegradaMala.DataSet    := qMaterialesODT;
    qrdbCantidadReintegradaBuena.DataSet   := qMaterialesODT;
    qrdbCantidadRetiradaBuena.DataSet      := qMaterialesODT;
    qrdbCantidadRetiradaMala.DataSet       := qMaterialesODT;
    QuickRep.Preview;
  end;
end;

procedure TfListaODTUrbanaRural.ListadodeHorasExtras1Click(Sender: TObject);
var i:Integer;
begin
  FQRListaODTHorasExtras := TFQRListaODTHorasExtras.Create(Application);
  FQRListaODTHorasExtras.ListaDatos.Assign(ListaDatos);
  FQRListaODTHorasExtras.ListaRotulos.Assign(ListaRotulos);
  with FQRListaODTHorasExtras.qSobreTiempo do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT O.CODIGOADMINISTRATIVO,OSD.CODIGOEMPLEADO,E.NOMBREEMPLEADO, OSD.CODIGOODT,');
    SQL.Add('OSD.FECHAHORADESDE,OSD.FECHAHORAHASTA ,OSD.CANTIDADDIURNA,OSD.CANTIDADNOCTURNA,OSD.OBSERVACION');
    SQL.Add(qListaODTPadre.SQL[5] + ', ODTSOBRETIEMPO OS, EMPLEADO E,ODTSOBRETIEMPODETALLE OSD');
    for i := 6 to qListaODTPadre.SQL.Count - 1 do
    begin
      if Pos('ORDER BY',UpperCase(qListaODTPadre.SQL[i])) = 0 then
        SQL.Add(qListaODTPadre.SQL[i])
    end;
    SQL.Add('AND (OS.CODIGOEMPLEADO = E.CODIGOEMPLEADO) AND (OS.CODIGOODT = O.CODIGOODT)');
    SQL.Add('AND (OS.CANTIDADDIURNA > 0 OR OS.CANTIDADNOCTURNA > 0)AND (OSD.CODIGOODTSOBRETIEMPO=OS.CODIGOODTSOBRETIEMPO) ');
    SQL.Add('ORDER BY O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO,OSD.CODIGOODT');
    Open;
  end;
  FQRListaODTHorasExtras.QuickRep.Preview;
end;

procedure TfListaODTUrbanaRural.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if Field.FieldName='NOMBREESTADOREPORTE' then
  begin
     Background:=qReporte.FieldByName('COLOR').AsInteger;
     if BackGround = 0 then BackGround := clWhite;
  end;
end;

procedure TfListaODTUrbanaRural.Panel6MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Clave : string;
    Query: TQuery;
    ObjetoODT: TODTHija;
begin
  inherited;
   if (ssCtrl in Shift) and (Button in [mbRight]) and (qListaODTHijaCONSECUTIVO.AsString <> '' )then
   begin
     if InputQuery('Digite la clave de administrador','Clave Admin', Clave) then
     begin
       Query := TQuery.Create(Application);
       Query.DataBaseName := 'BaseDato';
       Query.SQL.Text := 'SELECT CLAVEUSUARIO FROM USUARIO WHERE CODIGOUSUARIO = 0';
       Query.Open;
       if Query.Fields[0].AsString = Clave then
       begin
         ObjetoODT := TODTHija.Create(qListaODTHijaCODIGOODT.AsFloat,qListaODTHijaCONSECUTIVO.AsInteger,
                                               qListaODTPadreCODIGOADMINISTRATIVO.AsFloat);
         if not Query.DataBase.InTransaction then
           Query.Database.StartTransaction;
         try
           if ObjetoODT.BorrarODTHija then
           begin
             Query.Database.Commit;
             qListaODTHija.Close;
             qListaODTHija.Open;
             MessageDlg('Eliminación exitosa.',mtInformation,[mbOk],0);
           end;
         except
           Query.Database.Rollback;
           MessageDlg('Imposible eliminar la ODT.',mtError,[mbOk],0);
         end;

         ObjetoODT.Free;                             
       end
       else
         MessageDlg('Clave Incorrecta.',mtError,[mbOk],0);
       query.close;  
       Query.Free;
     end;
   end;
end;


procedure TfListaODTUrbanaRural.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var CodigoODT: string;
begin
  inherited;
  if Key = VK_F5 then
  begin
    CodigoODT := qListaODTPadreCODIGOODT.AsString;
    qListaODTPadre.Close;
    qListaODTPadre.Open;
    qTotales.Close;
    qTotales.Open;
    qListaODTPadre.Locate('CODIGOODT',CodigoODT,[]);
  end;
end;

procedure TfListaODTUrbanaRural.SBOrdenarClick(Sender: TObject);
var punto:TPoint;
begin
 punto:=Panel2.ClientToScreen(Classes.Point(SBOrdenar.Left, SBOrdenar.top));
 pmOrdenar.Popup(punto.x+10, punto.y+10);
end;

procedure TfListaODTUrbanaRural.Ordenar(sCriterio: String);
begin
  qListaODTPadre.Close;
  qListaODTPadre.SQL.Delete(qListaODTPadre.SQL.Count - 1);
  qListaODTPadre.SQL.Add(sCriterio);
  qListaODTPadre.Open;
  dbgListaOdtPadre.SetFocus;
end;
//************Ordenar Por CODIGOODT
procedure TfListaODTUrbanaRural.CodigoOdtClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('CODIGOODT');
  sCriterio := 'ORDER BY O.CODIGOODT DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['CODIGOODT']='1') then
    begin
      sCriterio := 'ORDER BY O.CODIGOODT ASC';
      ListaDireccionCampos.Values['CODIGOODT']:='-1';
    end
    else
      ListaDireccionCampos.Values['CODIGOODT']:='1'
  end;
  CodigoOdt.Checked := true;
  Ordenar(sCriterio);
  with dbgListaOdtPadre do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qListaODTPadreCODIGOODT;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;
//************Ordenar Por FECHAEMISION
procedure TfListaODTUrbanaRural.FechaEmisionClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHAEMISION');
  sCriterio := 'ORDER BY O.FECHAEMISION DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['FECHAEMISION']='1' then
    begin
      sCriterio := 'ORDER BY O.FECHAEMISION ASC';
      ListaDireccionCampos.Values['FECHAEMISION']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHAEMISION']:='1'
  end;
  FechaEmision.Checked := true;
  Ordenar(sCriterio);
  with dbgListaOdtPadre do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qListaODTPadreFECHAEMISION;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;
//************Ordenar Por FECHAASIGNACION
procedure TfListaODTUrbanaRural.FechaAsignacionClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHAASIGNACION');
  sCriterio := 'ORDER BY O.FECHAASIGNACION DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['FECHAASIGNACION']='1' then
    begin
      sCriterio := 'ORDER BY O.FECHAASIGNACION ASC';
      ListaDireccionCampos.Values['FECHAASIGNACION']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHAASIGNACION']:='1'
  end;
  FechaAsignacion.Checked := true;
  Ordenar(sCriterio);
  with dbgListaOdtPadre do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qListaODTPadreFECHAASIGNACION;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;
//************Ordenar Por
procedure TfListaODTUrbanaRural.FechaAprobacionClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHAAPROBACION');
  sCriterio := 'ORDER BY O.FECHAAPROBACION DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['FECHAAPROBACION']='1' then
    begin
      sCriterio := 'ORDER BY O.FECHAAPROBACION ASC';
      ListaDireccionCampos.Values['FECHAAPROBACION']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHAAPROBACION']:='1'
  end;
  FechaAprobacion.Checked := true;
  Ordenar(sCriterio);
  with dbgListaOdtPadre do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qListaODTPadreFECHAAPROBACION;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;
//************Ordenar Por CODIGOADMINISTRATIVO
procedure TfListaODTUrbanaRural.CIAClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('CODIGOADMINISTRATIVO');
  sCriterio := 'ORDER BY O.CODIGOADMINISTRATIVO DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['CODIGOADMINISTRATIVO']='1' then
    begin
      sCriterio := 'ORDER BY O.CODIGOADMINISTRATIVO ASC';
      ListaDireccionCampos.Values['CODIGOADMINISTRATIVO']:='-1';
    end
    else
      ListaDireccionCampos.Values['CODIGOADMINISTRATIVO']:='1'
  end;
  CIA.Checked := true;
  Ordenar(sCriterio);
  with dbgListaOdtPadre do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qListaODTPadreCODIGOADMINISTRATIVO;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;
//************Ordenar Por CODIGOPRIORIDAD
procedure TfListaODTUrbanaRural.PrioridadClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('CODIGOPRIORIDAD');
  sCriterio := 'ORDER BY O.CODIGOPRIORIDAD DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['CODIGOPRIORIDAD']='1' then
    begin
      sCriterio := 'ORDER BY O.CODIGOPRIORIDAD ASC';
      ListaDireccionCampos.Values['CODIGOPRIORIDAD']:='-1';
    end
    else
      ListaDireccionCampos.Values['CODIGOPRIORIDAD']:='1'
  end;
  sCriterio := 'ORDER BY O.CODIGOPRIORIDAD';
  Prioridad.Checked := true;
  Ordenar(sCriterio);
  with dbgListaOdtPadre do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qListaODTPadreNOMBREPRIORIDAD;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;
//************Ordenar Por CODIGOESTADOODT
procedure TfListaODTUrbanaRural.EstadoOdtClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('CODIGOESTADOODT');
  sCriterio := 'ORDER BY O.CODIGOESTADOODT DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['CODIGOESTADOODT']='1' then
    begin
      sCriterio := 'ORDER BY O.CODIGOESTADOODT ASC';
      ListaDireccionCampos.Values['CODIGOESTADOODT']:='-1';
    end
    else
      ListaDireccionCampos.Values['CODIGOESTADOODT']:='1'
  end;
  EstadoOdt.Checked := true;
  Ordenar(sCriterio);
  with dbgListaOdtPadre do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qListaODTPadreNOMBREESTADOODT;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;
//************Ordenar Por CODIGOLABOR
procedure TfListaODTUrbanaRural.LaborClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('CODIGOLABOR');
  sCriterio := 'ORDER BY O.CODIGOLABOR DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['CODIGOLABOR']='1' then
    begin
      sCriterio := 'ORDER BY O.CODIGOLABOR ASC';
      ListaDireccionCampos.Values['CODIGOLABOR']:='-1';
    end
    else
      ListaDireccionCampos.Values['CODIGOLABOR']:='1'
  end;
  Labor.Checked := true;
  Ordenar(sCriterio);
  with dbgListaOdtPadre do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qListaODTPadreNOMBRELABOR;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;
//************Ordenar Por CODIGOTIPOTAREA
procedure TfListaODTUrbanaRural.TipoTareaClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('CODIGOTIPOTAREA');
  sCriterio := 'ORDER BY O.CODIGOTIPOTAREA DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['CODIGOTIPOTAREA']='1' then
    begin
      sCriterio := 'ORDER BY O.CODIGOTIPOTAREA ASC';
      ListaDireccionCampos.Values['CODIGOTIPOTAREA']:='-1';
    end
    else
      ListaDireccionCampos.Values['CODIGOTIPOTAREA']:='1'
  end;
  TipoTarea.Checked := true;
  Ordenar(sCriterio);
  with dbgListaOdtPadre do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qListaODTPadreNOMBRETIPOTAREA;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;
//************Despliega el formulario Buscar ODT
procedure TfListaODTUrbanaRural.SBBuscarClick(Sender: TObject);
begin
  inherited;
  FBuscarOdt := TfBuscarOdt.Create(Application);
  FBuscarOdt.dsOdt.DataSet:=qListaODTPadre;
  FBuscarOdt.ShowModal;
  FBuscarOdt.Free;
  dbgListaOdtPadre.Setfocus;
end;

procedure TfListaODTUrbanaRural.dbgListaOdtPadreTitleClick(
  Column: TColumn);
Var Posicion,I:Integer;
  NombreCampo:String;
  Campo:TField;
begin
  inherited;
  with dbgListaOdtPadre do
  begin
    for I:=0 to dbgListaOdtPadre.Columns.Count-1 do
      Columns[I].title.Font.Style :=
      Columns[I].title.Font.Style - [fsBold];
    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];
  end;
  Campo:=Column.Field;
  NombreCampo:=Campo.FieldName;
  if NombreCampo='NOMBREESTADOODT' then
    NombreCampo:='CODIGOESTADOODT';
  if NombreCampo='NOMBREPRIORIDAD' then
    NombreCampo:='CODIGOPRIORIDAD';
  if NombreCampo='NOMBRELABOR' then
    NombreCampo:='CODIGOLABOR';
  if NombreCampo='NOMBRETIPOTAREA' then
    NombreCampo:='CODIGOTIPOTAREA';
  Posicion:=ListaDireccionCampos.IndexOfName(NombreCampo);
  sCriterio := 'ORDER BY O.'+ NombreCampo+ ' DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values[NombreCampo]='1' then
    begin
      sCriterio := 'ORDER BY O.'+ NombreCampo+ ' ASC';
      ListaDireccionCampos.Values[NombreCampo]:='-1';
    end
    else
      ListaDireccionCampos.Values[NombreCampo]:='1';
    with pmOrdenar do
    begin
      for I := 0 to Items.Count-1 do
      begin
        if Items[I].Tag=Posicion+1 then
        begin
          Items[I].Checked:=True;
          break;
        end;
      end;
    end;
    Ordenar(sCriterio);
  end;
  dbgListaOdtPadre.SelectedField:=Campo;
end;

procedure TfListaODTUrbanaRural.dbgListaOdtPadreMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
Var Fila,Columna,Posicion:Integer;
    NombreCampo:String;
begin
  try
    dbgListaOdtPadre.MouseToCell(x,y,Columna,Fila);
    if Fila=0 then
    begin
      NombreCampo:=dbgListaOdtPadre.Columns[Columna-1].Field.FieldName;
      if NombreCampo='NOMBREESTADOODT' then
        NombreCampo:='CODIGOESTADOODT';
      if NombreCampo='NOMBREPRIORIDAD' then
        NombreCampo:='CODIGOPRIORIDAD';
      if NombreCampo='NOMBRELABOR' then
        NombreCampo:='CODIGOLABOR';
      if NombreCampo='NOMBRETIPOTAREA' then
        NombreCampo:='CODIGOTIPOTAREA';
      Posicion:=ListaDireccionCampos.IndexOfName(NombreCampo);
      if Posicion<>-1 then dbgListaOdtPadre.Cursor:=crHandPoint
      else
       dbgListaOdtPadre.Cursor:=crDefault;
    end
    else
       dbgListaOdtPadre.Cursor:=crDefault;
  except
  end;
end;

procedure TfListaODTUrbanaRural.SBEstadisticaClick(Sender: TObject);
var Actividad:TActividad;
begin
  Actividad:=TActividad.Create('ESTADISTICAODTACTIVIDAD');
  Actividad.CrearTabla(Lista);
  Actividad.Free;
  FEstadisticaOdt:=TFEstadisticaOdt.Create(Application);
  with FEstadisticaOdt do
  begin
    Caption := 'Estadística Actividades ODTs';
    ListaRotulos.assign(ListaRotulos);
    ListaDatos.assign(ListaDatos);
    qEstadistica.Open;
    Show;
  end;
end;

procedure TfListaODTUrbanaRural.ListadodeViticosCausados1Click(
  Sender: TObject);
var
  I: Integer;
  Consulta: TStringList;
begin
  inherited;
  fQRListaODTViaticos:= TfQRListaODTViaticos.Create(Application);
  fQRListaODTViaticos.ListaDatos.Assign(ListaDatos);
  fQRListaODTViaticos.ListaRotulos.Assign(ListaRotulos);

  Consulta := TStringList.Create();
  Consulta.Add('SELECT DISTINCT E.CODIGOEMPLEADO,O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, E.CODIGOSUELDO, OV.CODIGOODT, OV.CODIGOCOMISION,OV.CODIGOVIATICO,');
  Consulta.Add('TO_CHAR(OV.FECHAINICIO, ''DD Mon'') || '' - '' || TO_CHAR(OV.FECHAFIN, ''DD Mon YYYY'') AS FECHA, OVD.VALORIMPUTACION');

  Consulta.Add(qListaODTPadre.SQL[5] + ', ODTVIATICO OV, ODTVIATICODETALLE OVD, IMPUTACIONMANOOBRA IMO, EMPLEADO E');
  for i := 6 to qListaODTPadre.SQL.Count - 1 do
  begin
    if Pos('ORDER BY',UpperCase(qListaODTPadre.SQL[i])) = 0 then
      Consulta.Add(qListaODTPadre.SQL[i])
  end;
  Consulta.Add('AND (OV.CODIGOODT (+) = O.CODIGOODT)');
  Consulta.Add('AND OVD.CODIGOVIATICO = OV.CODIGOVIATICO');
  Consulta.Add('AND OV.CODIGOEMPLEADO = E.CODIGOEMPLEADO');
  Consulta.Add('AND OVD.CODIGOIMPUTACIONMANOOBRA = IMO.CODIGOIMPUTACIONMANOOBRA');
  Consulta.Add('AND TO_CHAR(IMO.CODIGOTIPOIMPUTACIONODT)=''V''');

  with fQRListaODTViaticos do
  begin
    qViaticos.SQL.Clear;
    qPeaje.SQL.Clear;
    qParqueo.SQL.Clear;
    qGasolina.SQL.Clear;
    qPasajes.SQL.Clear;
    qAuxilioViaje.SQL.Clear;
    qOtros.SQL.Clear;

    for I := 0 to Consulta.Count - 1 do
    begin
      qViaticos.SQL.Add(Consulta[I]);
      qPeaje.SQL.Add(Consulta[I]);
      qParqueo.SQL.Add(Consulta[I]);
      qGasolina.SQL.Add(Consulta[I]);
      qPasajes.SQL.Add(Consulta[I]);
      qAuxilioViaje.SQL.Add(Consulta[I]);
      qOtros.SQL.Add(Consulta[I]);
    end;
    qViaticos.SQL.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''VIA''');
    qPeaje.SQL.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''PEA''');
    qParqueo.SQL.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''PAR''');
    qOtros.SQL.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''REP''');
    qGasolina.SQL.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''GAS''');
    qPasajes.SQL.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''PAS''');
    qAuxilioViaje.SQL.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''AUX''');

    qViaticos.SQL.Add('ORDER BY O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, FECHA');
    qPeaje.SQL.Add('ORDER BY O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, FECHA');
    qParqueo.SQL.Add('ORDER BY O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, FECHA');
    qOtros.SQL.Add('ORDER BY O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, FECHA');
    qGasolina.SQL.Add('ORDER BY O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, FECHA');
    qPasajes.SQL.Add('ORDER BY O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, FECHA');
    qAuxilioViaje.SQL.Add('ORDER BY O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, FECHA');

    qViaticos.Open;
    qPeaje.Open;
    qParqueo.Open;
    qGasolina.Open;
    qPasajes.Open;
    qAuxilioViaje.Open;
    qOtros.Open;
    qMotivo.Close;
    qMotivo.Open;
  end;
  fQRListaODTViaticos.qrViatico.Preview;
end;

procedure TfListaODTUrbanaRural.ListadodeAuxiliosCausados1Click(
  Sender: TObject);
var
  I: Integer;
  Consulta: TStringList;
begin
  inherited;
  FQRListaODTAuxilios := TFQRListaODTAuxilios.Create(Application);
  FQRListaODTAuxilios.ListaDatos.Assign(ListaDatos);
  FQRListaODTAuxilios.ListaRotulos.Assign(ListaRotulos);

  Consulta := TStringList.Create();
  Consulta.Add('SELECT DISTINCT O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, E.CODIGOSUELDO,OA.CODIGOODT,OA.CODIGOAUXILIO,OAD.VALORIMPUTACION,');
  Consulta.Add('TO_CHAR(OA.FECHAINICIO, ''DD Mon'') || '' - '' || TO_CHAR(OA.FECHAFIN, ''DD Mon YYYY'') AS FECHA');
  Consulta.Add(qListaODTPadre.SQL[5] + ', ODTAUXILIO OA, ODTAUXILIODETALLE OAD, IMPUTACIONMANOOBRA IMO, EMPLEADO E');
  for i := 6 to qListaODTPadre.SQL.Count - 1 do
  begin
    if Pos('ORDER BY',UpperCase(qListaODTPadre.SQL[i])) = 0 then
      Consulta.Add(qListaODTPadre.SQL[i])
  end;

  Consulta.Add('AND (OA.CODIGOODT (+) = O.CODIGOODT)');
  Consulta.Add('AND OAD.CODIGOAUXILIO = OA.CODIGOAUXILIO');
  Consulta.Add('AND OA.CODIGOEMPLEADO = E.CODIGOEMPLEADO');
  Consulta.Add('AND OAD.CODIGOIMPUTACIONMANOOBRA = IMO.CODIGOIMPUTACIONMANOOBRA');
  Consulta.Add('AND OAD.VALORIMPUTACION > 0');
  Consulta.Add('AND TO_CHAR(IMO.CODIGOTIPOIMPUTACIONODT)=''A'' ');

  with FQRListaODTAuxilios do
  begin
    qAuxilioAlimentacion.SQL.Clear;
    qDesayunos.SQL.Clear;
    qAlmuerzos.SQL.Clear;
    qComidas.SQL.Clear;
    qAuxilioPeaje .SQL.Clear;
    qAuxilioParqueo.SQL.Clear;
    qAuxilioGasolina.SQL.Clear;
    qAuxilioPasaje.SQL.Clear;

    for I := 0 to Consulta.Count - 1 do
    begin
      qAuxilioAlimentacion.SQL.Add(Consulta[I]);
      qDesayunos.SQL.Add(Consulta[I]);
      qAlmuerzos.SQL.Add(Consulta[I]);
      qComidas.SQL.Add(Consulta[I]);
      qAuxilioPeaje.SQL.Add(Consulta[I]);
      qAuxilioPasaje.SQL.Add(Consulta[I]);
      qAuxilioGasolina.SQL.Add(Consulta[I]);
      qAuxilioParqueo.SQL.Add(Consulta[I]);
    end;
    qAuxilioAlimentacion.SQL[0]:='SELECT DISTINCT O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, E.CODIGOSUELDO, OA.CODIGOODT,OA.CODIGOAUXILIO,OA.CANTIDADDESAYUNOS,OA.CANTIDADALMUERZOS,OA.CANTIDADCOMIDAS,A.NOMBRECATEGORIA,';

    qDesayunos.SQL.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''DES''');
    qAlmuerzos.SQL.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''ALM''');
    qComidas.SQL.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''COM''');
    qAuxilioPeaje.SQL.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''PEA''');
    qAuxilioPasaje.SQL.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''PAS''');
    qAuxilioGasolina.SQL.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''GAS''');
    qAuxilioParqueo.SQL.Add('AND IMO.CODIGOSUBTIPOIMPUTACIONODT=''PAR''');

    qAuxilioAlimentacion.SQL.Add('ORDER BY O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, FECHA');
    qDesayunos.SQL.Add('ORDER BY O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, FECHA');
    qAlmuerzos.SQL.Add('ORDER BY O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, FECHA');
    qComidas.SQL.Add('ORDER BY O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, FECHA');
    qAuxilioPeaje.SQL.Add('ORDER BY O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, FECHA');
    qAuxilioPasaje.SQL.Add('ORDER BY O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, FECHA');
    qAuxilioGasolina.SQL.Add('ORDER BY O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, FECHA');
    qAuxilioParqueo.SQL.Add('ORDER BY O.CODIGOADMINISTRATIVO,E.NOMBREEMPLEADO, FECHA');

    qAuxilioAlimentacion.Open;
    qDesayunos.Open;
    qAlmuerzos.Open;
    qComidas.Open;
    qAuxilioPeaje.Open;
    qAuxilioParqueo.Open;
    qAuxilioGasolina.Open;
    qAuxilioPasaje.Open;
  end;
  FQRListaODTAuxilios.qrAuxilio.Preview;
end;

procedure TfListaODTUrbanaRural.sbRefrescarClick(Sender: TObject);
begin
  inherited;
  qListaODTPadre.Close;
  qListaODTPadre.Open;
  qTotales.close;
  qTotales.Open;
end;

procedure TfListaODTUrbanaRural.ExportarListaOdtPadres1Click(
  Sender: TObject);
begin
  inherited;
  if SaveDialog1.Execute then
  begin
     dsBase.DataSet.DisableControls;
     CVS1.DataSet := dsBase.DataSet;
     CVS1.FileNameText := SaveDialog1.FileName;
     CVS1.TableExport;
     dsBase.DataSet.EnableControls;
  end;
end;

procedure TfListaODTUrbanaRural.ExportarListaOdtHijas1Click(
  Sender: TObject);
var i:integer;
begin
  inherited;
  if SaveDialog1.Execute then
  begin
    dsBase.DataSet.DisableControls;
    qListaOdtHijaExportar.close;
    qListaOdtHijaExportar.sql.SaveToFile(GetTemporalPath+'\ListaOdtHija.txt');
    qListaOdtHijaExportar.open;
    CVS1.DataSet := qListaOdtHijaExportar;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    qListaOdtHijaExportar.close;
    dsBase.DataSet.EnableControls;
  end;
end;

procedure TfListaODTUrbanaRural.sbExportarClick(Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel2.ClientToScreen(Classes.Point(sbExportar.Left, sbExportar.top));
  pmExportar.Popup(punto.x+10, punto.y+10);
end;

function TfListaODTUrbanaRural.ExisteTransaccionActual: boolean;
var query:tquery;
begin
  query:=TQuery.Create(self);
  query.DatabaseName := 'BaseDato';
  query.sql.add('SELECT count(*)');
  query.sql.add('FROM sesiongestion s');
  query.sql.add('WHERE s.idsesionbd =  SYS_CONTEXT (''USERENV'', ''SESSIONID'')');
  query.sql.add('AND fechafin is null');
  query.open;
  result := false;
  if query.fields[0].AsInteger>0 then
    result := true;

end;

procedure TfListaODTUrbanaRural.dbgListaHijasGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
 if (Field.FieldName='NombreEstadoOdt') and (qListaODTHijaCODIGOESTADOODTDIA.AsString <> '') then
  begin

     case qListaODTHijaCODIGOESTADOODTDIA.AsInteger of
        0:begin
           Background:=$000080FF;
           AFont.Color:=clBlue;
           end;
        1: begin
           Background:=clYellow;
           AFont.Color:=clBlue;
           end;
        2:Background:=65280;
        6:begin
          Background:=8421376;
          if qListaODTHijaREVISIONCOORDINADOR.Asstring <> 'S' then
          Background:=$2FFFAD;
          end;
        7:Background:= 16711935;
     end;
  end;
end;

procedure TfListaODTUrbanaRural.SpeedButton2Click(Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel11.ClientToScreen(Classes.Point(sbImprimir.Left, sbImprimir.top));
  pmImprimirHija.Popup(punto.x+10, punto.y+10);
end;

procedure TfListaODTUrbanaRural.MenuItem1Click(Sender: TObject);
begin
  inherited;
  fQRODTHija:=TfQRODTHija.Create(Application);
  try
    //fQRODTHija.qrlImpreso.Caption:=GenerarImpreso;
    //fQRODTHija.qrlImpresoInferior.Caption:=GenerarImpreso;
    fQRODTHija.qODTHija.ParamByName('CODIGOODT').AsString:=qListaODTHijaCODIGOODT.AsString;
    fQRODTHija.qODTHija.ParamByName('CONSECUTIVO').AsInteger:=qListaODTHijaCONSECUTIVO.AsInteger;
    fQRODTHija.qODTHija.Open;
    fQRODTHija.qReportes.open;
    fQRODTHija.qpresmano.open;
    fQRODTHija.QuickRep.Preview;
  finally
    Application.ProcessMessages;
  end;
end;

procedure TfListaODTUrbanaRural.MenuItem2Click(Sender: TObject);
begin
  inherited;
  fQRODTHijaTodas:=TfQRODTHijaTodas.Create(Application);
  try
    fQRODTHijaTodas.qODTHija.ParamByName('CODIGOODT').AsString:=qlistaODTPadreCODIGOODT.AsString;
    fQRODTHijaTodas.qODTHija.Open;
    fQRODTHijaTodas.qReportes.open;
    fQRODTHijaTodas.qpresmano.open;
    fQRODTHijaTodas.QuickRep.Preview;
  finally
    Application.ProcessMessages;
  end;

end;

procedure TfListaODTUrbanaRural.SBBuscarOdtHijaClick(Sender: TObject);
begin
  FBuscarOdtHija := TfBuscarOdtHija.Create(Application);
  FBuscarOdtHija.dsOdt.DataSet:=qListaODTHija;
  FBuscarOdtHija.ShowModal;
  FBuscarOdtHija.Free;
  dbgListaHijas.Setfocus;
end;

procedure TfListaODTUrbanaRural.cbReportesPendientesClick(Sender: TObject);
begin
 if  cbReportesPendientes.Checked then
Begin
qListaODTHija.Close;
qListaODTHija.SQL.text:= 'SELECT D.CODIGOODT, D.CONSECUTIVO, D.IMPRESOODT, D.CODIGOGRUPOTRABAJO, D.CODIGOGEOGRAFICO, D.CODIGOSUBESTACION, '+
                               ' D.CODIGOCIRCUITO, D.CODIGOTIPOELEMENTO, D.CODIGOEQUIPO, D.COSTOMATERIAL, D.COSTOMANOOBRA, D.COSTOTRANSPORTE,  '+
                               ' D.COSTOEQUIPO, D.OBSERVACION1, D.OBSERVACION2, D.OBSERVACION3, D.FECHAINICIOTRABAJO, D.FECHAFINALTRABAJO,  '+
                               ' O.CODIGOADMINISTRATIVO,D.COSTOACTIVIDAD,D.CODIGOESTADOODTDIA, D.REVISIONCOORDINADOR, G.NOMBRECATEGORIA  '+
                               ' FROM ODTDIA D, ODT O, ODTREPORTE DR, REPORTE R, GEOGRAFICO G  '+
                               ' WHERE (D.CODIGOODT =:CODIGOODT) AND (O.CODIGOODT = D.CODIGOODT) AND D.CODIGOGEOGRAFICO = G.CODIGOGEOGRAFICO(+) '+
                               ' AND D.CODIGOODT = DR.CodigoOdt AND D.CONSECUTIVO = DR.CONSECUTIVO AND DR.CODIGOREPORTE = R.CODIGOREPORTE AND R.CODIGOESTADOREPORTE IN (0,1,2,3) ORDER BY 2 DESC';

End
else
Begin
qListaODTHija.SQL.text:= 'SELECT D.CODIGOODT, D.CONSECUTIVO, D.IMPRESOODT, D.CODIGOGRUPOTRABAJO, D.CODIGOGEOGRAFICO, D.CODIGOSUBESTACION, '+
                               ' D.CODIGOCIRCUITO, D.CODIGOTIPOELEMENTO, D.CODIGOEQUIPO, D.COSTOMATERIAL, D.COSTOMANOOBRA, D.COSTOTRANSPORTE,  '+
                               ' D.COSTOEQUIPO, D.OBSERVACION1, D.OBSERVACION2, D.OBSERVACION3, D.FECHAINICIOTRABAJO, D.FECHAFINALTRABAJO,  '+
                               ' O.CODIGOADMINISTRATIVO,D.COSTOACTIVIDAD,D.CODIGOESTADOODTDIA, D.REVISIONCOORDINADOR, G.NOMBRECATEGORIA  '+
                               ' FROM ODTDIA D, ODT O, GEOGRAFICO G  '+
                               ' WHERE (D.CODIGOODT =:CODIGOODT) AND (O.CODIGOODT = D.CODIGOODT) AND D.CODIGOGEOGRAFICO = G.CODIGOGEOGRAFICO(+) ORDER BY 2 DESC';

End;
qListaODTHija.Open;
end;

procedure TfListaODTUrbanaRural.cbTodosReportesClick(Sender: TObject);
begin
  qReporte.Close;
  qReporte.SQL.Clear;
  if  cbTodosReportes.Checked then
  begin
    qReporte.SQL.text:= 'SELECT O.CONSECUTIVO, O.CODIGOREPORTE, ER.COLOR, ER.NOMBREESTADOREPORTE '+
    'FROM ODTREPORTE O, REPORTE R, ESTADOREPORTE ER '+
    'WHERE 1=1 '+
    'AND O.CODIGOODT=:CODIGOODT '+
    'AND R.CODIGOREPORTE = O.CODIGOREPORTE '+
    'AND R.CODIGOESTADOREPORTE = ER.CODIGOESTADOREPORTE ';
  end
  else
  begin
    qReporte.SQL.text:= 'SELECT O.CONSECUTIVO, O.CODIGOREPORTE, ER.COLOR, ER.NOMBREESTADOREPORTE '+
    'FROM ODTREPORTE O, REPORTE R, ESTADOREPORTE ER '+
    'WHERE 1=1 '+
    'AND O.CODIGOODT=:CODIGOODT '+
    'AND O.CONSECUTIVO =:CONSECUTIVO '+
    'AND R.CODIGOREPORTE = O.CODIGOREPORTE '+
    'AND R.CODIGOESTADOREPORTE = ER.CODIGOESTADOREPORTE ';
  end;
  qReporte.Open;
end;

procedure TfListaODTUrbanaRural.sbAsignarGTClick(Sender: TObject);
var
  qDatos, qContMateriales: TQuery;
  i, CodigoGrupo, CIA: Integer;
  Transaccion, bHacerRollBack: Boolean;
  lSLEstODTHija, lSLCantMat: TStringList;
  TextoReporte : String;
begin
  if dbgListaHijas.SelectedRows.Count > 0 then
  begin
    CodigoGrupo:=0;
    bHacerRollBack:=False;
    lSLEstODTHija := TStringList.Create;
    lSLCantMat:= TStringList.Create;
    lSLEstODTHija.Sorted := True;
    lSLCantMat.Sorted := True;

    qContMateriales:= TQuery.Create(nil);
    qContMateriales.DatabaseName := 'BaseDato';
    qContMateriales.SQL.Clear;
    qContMateriales.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM ODTPRESMATE');
    qContMateriales.SQL.Add('WHERE CODIGOODT = :CODIGOODT');
    qContMateriales.SQL.Add('AND CONSECUTIVO = :CONSECUTIVO');

    for i:=0 to dbgListaHijas.SelectedRows.Count-1 do
    begin
      qListaODTHija.BookMark:=dbgListaHijas.SelectedRows.Items[i];
      lSLEstODTHija.Add(qListaODTHijaCODIGOESTADOODTDIA.AsString);
      qContMateriales.ParamByName('CODIGOODT').AsString:= qListaODTHijaCODIGOODT.AsString;
      qContMateriales.ParamByName('CONSECUTIVO').AsString:= qListaODTHijaCONSECUTIVO.AsString;
      qContMateriales.Open;
      lSLCantMat.Add(qContMateriales.FieldByName('CANTIDAD').AsString);
      qContMateriales.Close;
    end;
    qContMateriales.Free;

    if lSLEstODTHija.Count = 1 then
    begin
      if ((lSLEstODTHija[0] = '6') or (lSLEstODTHija[0] = '7')) then
      begin
        lSLEstODTHija.Free;
        lSLCantMat.Free;
        raise Exception.Create('El estado de todas las ODTs Hijas seleccionadas debe ser ASIGNADA.');
      end;
    end
    else
    begin
      lSLEstODTHija.Free;
      lSLCantMat.Free;
      raise Exception.Create('El estado de todas las ODTs Hijas seleccionadas debe ser ASIGNADA.');
    end;

    if lSLCantMat.Count = 1 then
    begin
      if lSLCantMat[0] <> '0' then
      begin
        lSLEstODTHija.Free;
        lSLCantMat.Free;
        raise Exception.Create('Las ODTs Hijas seleccionadas tienen materiales asociados.');
      end;
    end
    else
    begin
      lSLEstODTHija.Free;
      lSLCantMat.Free;
      raise Exception.Create('Las ODTs Hijas seleccionadas tienen materiales asociados.');
    end;

    CIA:=qListaODTPadreCODIGOADMINISTRATIVO.AsInteger;
    SeleccionarGrupoTrabajo(CIA, CodigoGrupo);
    if not (CIA = qListaODTPadreCODIGOADMINISTRATIVO.AsInteger) then
      raise Exception.Create('Debe seleccionar un Grupo Trabajo del área que genera la ODT.');

    try
      if (CodigoGrupo <> 0) then
      begin
        if not qListaODTPadre.Database.InTransaction then
        begin
          qListaODTPadre.Database.StartTransaction;
          Transaccion := True;
        end;

        qDatos := TQuery.Create(nil);
        qDatos.DatabaseName := 'BaseDato';
        for i:=0 to dbgListaHijas.SelectedRows.Count-1 do
        begin
          qListaODTHija.BookMark:=dbgListaHijas.SelectedRows.Items[i];
          qDatos.SQL.Clear;
          qDatos.SQL.Add('UPDATE ODTDIA SET CODIGOGRUPOTRABAJO='+IntToStr(CodigoGrupo));
          qDatos.SQL.Add('WHERE CODIGOODT = ' + qListaODTHijaCODIGOODT.AsString);
          qDatos.SQL.Add('AND CONSECUTIVO = ' + qListaODTHijaCONSECUTIVO.AsString);
          qDatos.ExecSQL;
          qDatos.Close;

          qDatos.SQL.Clear;
          qDatos.SQL.Add('select codigoreporte from odtreporte where codigoodt = '''+qListaODTHijaCODIGOODT.AsString+''' and consecutivo = '''+qListaODTHijaCONSECUTIVO.AsString+''' ');
          qDatos.open;
          TextoReporte := qDatos.Fields[0].asSTring;
          qDatos.Close;

        qDatos.SQL.Clear;
        qDatos.SQL.Add('UPDATE SIGCOM_GESTION ');
        qDatos.SQL.Add(' SET (CODIGOODT, CONSECUTIVO,CODIGOADMINISTRATIVO, DESCRIPCIONODT, NOMBREEMPLEADO )=   ');
        qDatos.SQL.Add(' (SELECT ORE.CODIGOODT, ORE.CONSECUTIVO, O.CODIGOADMINISTRATIVO, O.MOTIVOS , E.NOMBREEMPLEADO ');
        qDatos.SQL.Add(' FROM ODTREPORTE ORE, ODT O, ODTDIA OD, EMPLEADO E      ');
        qDatos.SQL.Add(' WHERE CODIGOREPORTE = :CODIGOREPORTE     ');
        qDatos.SQL.Add(' AND ORE.CODIGOODT = OD.CODIGOODT      ');
        qDatos.SQL.Add(' AND ORE.CONSECUTIVO = OD.CONSECUTIVO   ');
        qDatos.SQL.Add('  AND OD.CODIGOODT = O.CODIGOODT        ');
        qDatos.SQL.Add(' AND O.CODIGOEJECUTOR = E.CODIGOEMPLEADO(+))');
        qDatos.SQL.Add(' WHERE CODIGOREPORTE = :CODIGOREPORTE');
        qDatos.ParamByName('CODIGOREPORTE').AsString:=TextoReporte;
        qDatos.Close;

        qDatos.SQL.Clear;
        qDatos.SQL.Add( 'UPDATE SIGCOM_GESTION set CODIGOGRUPOTRABAJO='''+IntToStr(CodigoGrupo)+''' WHERE CODIGOREPORTE = :CODIGOREPORTE ');
        qDatos.ParamByName('CODIGOREPORTE').AsString:=TextoReporte;
        qDatos.ExecSQL;
        qDatos.Close;


        qDatos.SQL.Clear;
        qDatos.SQL.Add('UPDATE REPORTE SET CODIGOESTADOREPORTE=''2'',FECHAHORADICTADO=SYSDATE,FECHAHORADESCARGA=SYSDATE WHERE CODIGOREPORTE = :CODIGOREPORTE ');
        qDatos.ParamByName('CODIGOREPORTE').AsString:=TextoReporte;
        qDatos.ExecSQL;
        qDatos.Close;

        end;
        qDatos.Free;

        if Transaccion then
        begin
          if not bHacerRollBack then
          begin
            qListaODTPadre.Database.Commit;
            Application.MessageBox(PChar('Asignación realizada correctamente.'),'EnerGis',MB_OK+MB_ICONINFORMATION);
          end
          else
            qListaODTPadre.Database.Rollback;
        end;
      end;
    finally
      qListaODTHija.Close;
      qListaODTHija.Open;
    end;

    lSLEstODTHija.Free;
    lSLCantMat.Free;
  end
  else
    raise Exception.Create('Debe escoger una o más ODTs Hijas para asignarles el Grupo de Trabajo.');
end;

procedure TfListaODTUrbanaRural.qListaODTPadreAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if qListaODTPadreCODIGOMODOODT.AsInteger = 3 then
    sbAsignarGT.Enabled := True
  else
    sbAsignarGT.Enabled := False;
end;

procedure TfListaODTUrbanaRural.LimpiarFiltroODTHijas;
var
  nLineasExtra,i: Byte;
begin
 nLineasExtra := qListaODTHija.SQL.Count-7;
 if nLineasExtra > 0 then
    for i:=1 to nLineasExtra do
    begin
      qListaODTHija.SQL.Delete(6);
    end;
end;

procedure TfListaODTUrbanaRural.FiltrarODTHija;
var
  CadFrom : String;
begin
  gSLLista := GetQueryFiltroODTHija(gSLListaRotulos, gSLListaDatos, gSLListaFrom, qListaODTPadreCODIGOADMINISTRATIVO.AsString);
  if gSLLista <> nil then
  begin
    sbFiltroHijas.Glyph:=nil;
    if Trim(gSLLista.Text) <> '' then
      ilBotones.GetBitmap(1,sbFiltroHijas.Glyph)
    else
      ilBotones.GetBitmap(0,sbFiltroHijas.Glyph);

    qListaODTHija.Close;
    if qListaODTHija.SQL.Count > 7 then
      LimpiarFiltroODTHijas;

    qListaODTHija.SQL.Insert(6,gSLLista.Text);

    CadFrom := ' FROM ODTDIA D, ODT O, GEOGRAFICO G ';
    if gSLListaFrom.Count > 0 then
      CadFrom := CadFrom + ',' + gSLListaFrom.Text;

    qListaODTHija.SQL[4]:= CadFrom;
    qListaODTHija.Open;
  end;
end;

procedure TfListaODTUrbanaRural.sbFiltroHijasClick(Sender: TObject);
begin
  FiltrarODTHija;
  inherited;
end;

end.
