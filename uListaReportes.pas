unit uListaReportes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls, Mask, Menus,
  MPlayer, RXClock, ComCtrls;

type

TIndice = class
  private
    fNombreTabla : string;
    procedure SetNombreTabla(aValor: string);
    function  GetNombreTabla: string;
  public
    Query : TQuery;
    property  NombreTabla: string read GetNombreTabla write SetNombreTabla;
    procedure CrearTabla(const qReporte: TQuery); virtual; abstract;
    procedure EliminarTabla; virtual; abstract;
    procedure CambiarFrom(Query: TQuery);
end;

TIndiceMetropolitana = class(TIndice)
  public
    constructor Create(aNombreTabla : string);
    destructor  Destroy;
    procedure CrearTabla(const qReportes: TQuery);
    procedure EliminarTabla;
end;

TIndiceRural = class(TIndice)
  public
    constructor Create(aNombreTabla : string);
    destructor  Destroy;
    procedure CrearTabla(const qReportes: TQuery);
    procedure EliminarTabla;
end;

TIndicePodas = class(TIndice)
  public
    constructor Create(aNombreTabla : string);
    destructor  Destroy;
    procedure CrearTabla(const qReportes: TQuery);
    procedure EliminarTabla;
end;

  TfListaReportes = class(TFdSgdListaBase)
    dbgListaReportes: TRxDBGrid;
    qListaReportes: TQuery;
    qListaReportesCODIGOREPORTE: TFloatField;
    qListaReportesCODIGOINFORMANTE: TStringField;
    qListaReportesDIRECCIONINFORMANTE: TStringField;
    qListaReportesNOMBREINFORMANTE: TStringField;
    qListaReportesCIGINFORMANTE: TFloatField;
    qListaReportesTELEFONO: TStringField;
    qListaReportesCIGDANO: TFloatField;
    qListaReportesCODIGOADMINISTRATIVO: TFloatField;
    qListaReportesCODIGOTIPOREPORTE: TStringField;
    qListaReportesCODIGOCLASEREPORTE: TStringField;
    qListaReportesCODIGOPRIORIDAD: TStringField;
    qListaReportesCODIGOESTADOREPORTE: TStringField;
    qListaReportesNUMEROCARTA: TStringField;
    qListaReportesCODIGOESTADOCARTA: TFloatField;
    qListaReportesREGISTROS: TFloatField;
    qListaReportesFECHAHORA: TDateTimeField;
    qListaReportesFECHAULTIMOREGISTRO: TDateTimeField;
    qListaReportesFECHAHORADICTADO: TDateTimeField;
    qListaReportesFECHAHORALLEGADA: TDateTimeField;
    qListaReportesFECHAHORAATENCION: TDateTimeField;
    qListaReportesX: TFloatField;
    qListaReportesY: TFloatField;
    qListaReportesORIGENREPORTE: TStringField;
    qListaReportesCODIGOTIPOELEMENTO: TStringField;
    qListaReportesCODIGOELEMENTO: TStringField;
    qListaReportesCODIGOSUBESTACION: TStringField;
    qListaReportesCODIGOCIRCUITO: TStringField;
    qListaReportesCODIGOTRAFODIS: TFloatField;
    qListaReportesCODIGOAPOYO: TFloatField;
    qListaReportesCODIGOCLIENTESGD: TFloatField;
    qListaReportesCODIGOCLIENTECOM: TFloatField;
    qListaReportesREPORTEPADRE: TFloatField;
    qListaReportesPINTADOAPOYO: TStringField;
    qListaReportesNOMBREADMINISTRATIVO: TStringField;
    qListaReportesNOMBRETIPOREPORTE: TStringField;
    qListaReportesNOMBRECLASEREPORTE: TStringField;
    qListaReportesNOMBRESUBESTACION: TStringField;
    qListaReportesNOMBRECIRCUITO: TStringField;
    qListaReportesCOLOR: TFloatField;
    qListaReportesNOMBREESTADOREPORTE: TStringField;
    qListaReportesDIRECCIONDANO: TStringField;
    qListaReportesPRIORIDADDANO: TFloatField;
    qListaReportesCIAINFORMANTE: TFloatField;
    qListaReportesNOMBRECIAINFORMANTE: TStringField;
    qListaReportesCODIGOTIPOVIA: TFloatField;
    qListaReportesCODIGONOMBREVIA: TFloatField;
    qListaReportesMODIFICADORVIA: TStringField;
    qListaReportesDUPLICADOR: TFloatField;
    qListaReportesMODIFICADORDUPLICADOR: TStringField;
    qListaReportesNUMEROPUERTA: TFloatField;
    qListaReportesDireccionCalculada: TStringField;
    qListaReportesNOMBREGRUPOTRABAJO: TStringField;
    qListaReportesCODIGOTIPODANO: TFloatField;
    qTipoDano: TQuery;
    qListaReportesNombreTipoDano: TStringField;
    qListaReportesNOMBREFUNCIONARIO: TStringField;
    qListaReportesCODIGOTIPOPREDIO: TStringField;
    pmEstadistica: TPopupMenu;
    Totalatencinalcliente1: TMenuItem;
    ndicedeatencinalclienterearural1: TMenuItem;
    Estadsticaanterior1: TMenuItem;
    ndicedepodas1: TMenuItem;
    qListaReportesNOMBRETIPOINFORMANTE: TStringField;
    Timer: TTimer;
    qODTReporte: TQuery;
    qTotalesTOTAL: TFloatField;
    qOdt: TQuery;
    dsOdt: TDataSource;
    qListaReportesCODIGOCOMUNA: TFloatField;
    qListaReportesNombreCig: TStringField;
    qGeografico: TQuery;
    qGeograficoCODIGOGEOGRAFICO: TFloatField;
    qGeograficoNIVEL: TFloatField;
    qGeograficoCIUDAD: TStringField;
    qGeograficoBARRIO: TStringField;
    qGeograficoNOMBRECIG: TStringField;
    qListaReportesPRIORIDADESTIMADA: TFloatField;
    qListaReportesTIPOCLIENTE: TStringField;
    qListaReportesNombreTipoCliente: TStringField;
    StatusBar1: TStatusBar;
    lFecha: TLabel;
    qListaReportesCOLORCELDA: TFloatField;
    qListaReportesNombreSolicitante: TStringField;
    qListaReportesDESCRIPCION: TMemoField;
    qListaReportesOBSERVACION: TMemoField;
    qListaReportesCODIGOODT: TStringField;
    qListaReportesCODIGOUSUARIOCREACION: TFloatField;
    qListaReportesNombreUsuario: TStringField;
    pcInformacionReporte: TPageControl;
    tsInformacion: TTabSheet;
    tsReportes: TTabSheet;
    Panel5: TPanel;
    GroupBox5: TGroupBox;
    DBText3: TDBText;
    GroupBox7: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    GroupBox8: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    GroupBox9: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    GroupBox10: TGroupBox;
    DBText4: TDBText;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    Panel6: TPanel;
    dbgReportesAsociados: TRxDBGrid;
    Panel7: TPanel;
    Panel8: TPanel;
    infinterrupcion: TLabel;
    memo: TMemo;
    qReporteAsociado: TQuery;
    dsReporteAsociado: TDataSource;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    qReporteAsociadoCODIGOREPORTE: TFloatField;
    qReporteAsociadoNOMBREINFORMANTE: TStringField;
    qReporteAsociadoTELEFONO: TStringField;
    qReporteAsociadoDireccion: TStringField;
    qReporteAsociadoCIG: TStringField;
    qReporteAsociadoCIGDANO: TFloatField;
    qReporteAsociadoCODIGOTIPOVIA: TFloatField;
    qReporteAsociadoCODIGONOMBREVIA: TFloatField;
    qReporteAsociadoMODIFICADORVIA: TStringField;
    qReporteAsociadoDUPLICADOR: TFloatField;
    qReporteAsociadoMODIFICADORDUPLICADOR: TStringField;
    qReporteAsociadoNUMEROPUERTA: TFloatField;
    qReporteAsociadoCODIGOTIPOPREDIO: TStringField;
    Label29: TLabel;
    dbeInterruptor: TDBEdit;
    qListaReportesCODIGOINTERRUPTORDIS: TFloatField;
    sbUbicarSubestacion: TSpeedButton;
    SpeedButton1: TSpeedButton;
    sbInterruptor: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    qReporteAsociadoCODIGOCLIENTESGD: TFloatField;
    qTipoElemento: TQuery;
    dsTipoElemento: TDataSource;
    qReporteAsociadoCODIGOSUBESTACION: TStringField;
    qReporteAsociadoCODIGOCIRCUITO: TStringField;
    qReporteAsociadoCODIGOAPOYO: TFloatField;
    qReporteAsociadoCODIGOTRAFODIS: TFloatField;
    qReporteAsociadoCODIGOINTERRUPTORDIS: TFloatField;
    qReporteAsociadoPINTADOAPOYO: TStringField;
    SpeedButton6: TSpeedButton;
    Panel9: TPanel;
    sbAgruparReporte: TSpeedButton;
    qListaReportesTELEFONORECIBE: TStringField;
    qListaReportesNOMBRECLASECLIENTE: TStringField;
    qListaReportesCODIGOCLASECLIENTE: TFloatField;
    qListaReportesCODIGOEVENTO: TFloatField;
    qListaReportesCODIGOEVENTORESTABLECIMIENTO: TFloatField;
    pmAsociar: TPopupMenu;
    AgruparReporte1: TMenuItem;
    DesagruparReporte1: TMenuItem;
    pmAsociarReportesHijos: TPopupMenu;
    DesagruparReporteHijo: TMenuItem;
    qReporteAsociadoCODIGOESTADOREPORTE: TStringField;
    qReporteAsociadoNOMBREESTADOREPORTE: TStringField;
    qReporteAsociadoCOLOR: TFloatField;
    stbMensaje: TStatusBar;
    sbAsignarODT: TSpeedButton;
    qListaReportesCODIGOGRUPOTRABAJO: TFloatField;
    qListaReportesNombreDepartamento: TStringField;
    gbDescripcionReporteAsociado: TGroupBox;
    dbmDescripcionReporteAsociado: TDBMemo;
    qReporteAsociadoDESCRIPCION: TMemoField;
    qListaReportesDESCRIPCIONTIPOPREDIO: TMemoField;
    qListaReportesCODIGOCIRCUITO_1: TStringField;
    qReporteAsociadoDESCRIPCIONTIPOPREDIO: TMemoField;
    GroupBox2: TGroupBox;
    DBMemo1: TDBMemo;
    qListaReportesSedeOperativa: TStringField;
    qListaReportesNOMBREMUNICIPIO: TStringField;
    sbRefrescadoAutomatico: TSpeedButton;
    procedure dbgListaReportesGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure SBBuscaElementoCartografiaClick(Sender: TObject);
    procedure dbgListaReportesDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure qListaReportesCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure SBImprimirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SBEstadisticaClick(Sender: TObject);
    procedure Totalatencinalcliente1Click(Sender: TObject);
    procedure ndicedeatencinalclienterearural1Click(Sender: TObject);
    procedure ndicedepodas1Click(Sender: TObject);
    procedure dbgListaReportesMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgListaReportesTitleClick(Column: TColumn);
    procedure SBOrdenarClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SBBuscarClick(Sender: TObject);
    procedure sbRefrescadoAutomaticoClick(Sender: TObject);
    procedure StatusBar1Click(Sender: TObject);
    procedure SBFiltroCarograficoClick(Sender: TObject);
    procedure qReporteAsociadoCalcFields(DataSet: TDataSet);
    procedure qListaReportesAfterScroll(DataSet: TDataSet);
    procedure sbUbicarSubestacionClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbInterruptorClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure sbAgruparReporteClick(Sender: TObject);
    procedure AgruparReporte1Click(Sender: TObject);
    procedure DesagruparReporteHijoClick(Sender: TObject);
    procedure pmAsociarChange(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure DesagruparReporte1Click(Sender: TObject);
    procedure dbgReportesAsociadosGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure sbAsignarODTClick(Sender: TObject);
  private
    { Private declarations }
    CodigoReporte : String;
  public
    { Public declarations }
    Lista,ListaEstadistica,ListaFrom : TStringList;
    TeclaShift:Boolean;
    ListaOrden:TStringList;
    MostrarTodos:Boolean;
    ListaInformantes:tstringlist;
    procedure Filtrar;
    procedure LimpiarFiltro;
    Function AsociarReporte(CodigoReporte:String):Boolean;
    procedure VisualizarFormReporte(CodigoReporte:String);
    Function TrafoPadreHijosIgualesSinAgrupar(CodReportePadre,CodReporteHijo:String):Boolean;
  end;

  var
    fListaReportes : TfListaReportes;

implementation

uses uFIMPComunes, uReporte, ConsDll,
  uQRListaReportes, uFuncionSGD, uIndiceAreaMetropolitana,
  uQRListadoReportes, uBuscarReporte, UListaReportesAgrupados, uAsignarODT,
  uComunesAdministrativo;

{$R *.DFM}

procedure TfListaReportes.dbgListaReportesGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  inherited;
  if Field.FieldName='NOMBREESTADOREPORTE' then
  begin
     Background:=qListaReportesCOLOR.AsInteger;
  end;
  if (Field.FieldName='REPORTEPADRE') then
  begin
    if qListaReportesCOLORCELDA.asinteger <> 0 then
      Background:=qListaReportesCOLORCELDA.asinteger;
  end; 
  if (Field.FieldName='REGISTROS') then
  begin
    if qListaReportesCOLORCELDA.asinteger <> 0 then
      if qListaReportesREGISTROS.asinteger> 0 then
        Background:=qListaReportesCOLORCELDA.asinteger;
  end;
  if (Field.FieldName='NOMBRECLASEREPORTE') then
  begin
    if (qListaReportesCODIGOCLASEREPORTE.ASSTRING='1') then
      Background:=$00E7D9AF;
    if (qListaReportesCODIGOCLASEREPORTE.ASSTRING='2') then
      Background:=$0015FAAC;
  end; 
  if BackGround = 0 then BackGround := clWhite;
end;

procedure TfListaReportes.SBBuscaElementoCartografiaClick(Sender: TObject);
begin
  inherited;
  if not (qListaReportesX.IsNull or qListaReportesY.IsNull) then
  begin
    BuscarCoordenada(qListaReportesX.AsFloat, qListaReportesY.AsFloat);
  end
  else
    MessageDlg('Este Reporte No Esta Ubicado En Cartografía', mtInformation, [mbOK],0);
end;

procedure TfListaReportes.dbgListaReportesDblClick(Sender: TObject);
begin
  inherited;
  if qListaReportesCODIGOREPORTE.AsString <> '' then
  begin
    if not (Assigned(Application.FindComponent('fReporte') as TForm)) then
      fReporte:=TfReporte.Create(Application);

    fReporte.qReporte.Active:=False;
    fReporte.qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE='+
                                qListaReportesCODIGOREPORTE.AsString;


   if qListaReportesCODIGOESTADOREPORTE.AsInteger= 1 then
   begin
    fReporte.SpeedButton10.Visible :=true ;
    Freporte.sbGestionarOdt.visible := false;
    end;

    if qListaReportesCODIGOESTADOREPORTE.AsInteger= 2  then
   begin
    fReporte.SpeedButton10.Visible :=true;
    Freporte.sbGestionarOdt.visible := true;
    end;
     if (qListaReportesCODIGOESTADOREPORTE.AsInteger= 4) or (qListaReportesCODIGOESTADOREPORTE.AsInteger= 5) OR (qListaReportesCODIGOESTADOREPORTE.AsInteger= 3) then
   begin
    fReporte.SpeedButton10.Visible :=false;
      Freporte.sbGestionarOdt.visible := FALSE;
      Freporte.bbAceptar.Visible:=false;
    end ;

    fReporte.qReporte.Active:=True;
    fReporte.qReporte.Edit;
    fReporte.qgrupotrabajo.Close;
    If freporte.qReporteCODIGOGRUPOTRABAJO.ASSTRING <> '' then
      fReporte.qgrupotrabajo.SQL.text:= fReporte.qgrupotrabajo.SQL.text + ' AND (ACTIVO = ''S'' OR CODIGOGRUPOTRABAJO = '+ freporte.qReporteCODIGOGRUPOTRABAJO.ASSTRING+') ORDER BY NOMBREGRUPOTRABAJO '
    else
      fReporte.qgrupotrabajo.SQL.text:= fReporte.qgrupotrabajo.SQL.text + ' AND (ACTIVO = ''S'') ORDER BY NOMBREGRUPOTRABAJO ';
    fReporte.qGrupoTrabajo.Open;
    fReporte.Show;

    if VarCodigoUsuario <> 0 then
    begin
      if ((fReporte.qReporteCODIGOESTADOREPORTE.AsString = '4') and (not ProcManager.CanProcExecute('_Permitir editar reportes reparados'))) then
      begin
        DeshabilitarControles(fReporte,False);
        fReporte.lbCodigo.Enabled:= True;
      end;
    end;
    
    fReporte.ActualizarBarraEstado;
  end;
end;

procedure TfListaReportes.Filtrar;
Var CadFrom,sWhereLista, fechareportes : String;

begin
  Lista := GetQueryFiltroReporte(ListaRotulos, ListaDatos, ListaFrom, CodigoReporte);
  If Lista <> Nil then
    begin
      qListaReportes.Close;
      If qListaReportes.sql.Count > 19 then
        LimpiarFiltro;
      sWhereLista:=Lista.Text;
      if sWhereLista='' then
        sWhereLista:=' (R.CODIGOREPORTE=R.REPORTEPADRE OR R.REPORTEPADRE IS NULL) '
      else
        sWhereLista:=Lista.Text+' AND(R.CODIGOREPORTE=R.REPORTEPADRE OR R.REPORTEPADRE IS NULL) ';
      If MostrarTodos = true then
        fechareportes:= ''
      else
        fechareportes:= 'AND FECHAHORA >SYSDATE - 365';
      qListaReportes.sql.Insert(18,sWhereLista + fechareportes);
      qTotales.sql.Insert(18,sWhereLista + fechareportes);
      CadFrom := 'FROM REPORTE R, INFORMANTE I, ADMINISTRATIVO A, TIPOREPORTE TR, CLASEREPORTE CR, CLASECLIENTE CC, ' +
                'ESTADOREPORTE ER, SUBESTACION S, CIRCUITO C, ADMINISTRATIVO AD, GRUPOTRABAJO GT,GEOGRAFICO G, GEOGRAFICO G2';
      if ListaFrom.Count > 0 then
        CadFrom := CadFrom + ',' + ListaFrom.Text;
      qListaReportes.SQL[13]:= CadFrom;
      qTotales.SQL[13]:=CadFrom;
      qListaReportes.SQL.SaveToFile(GetTemporalPath+'ListaReportes.sql');
      qTotales.SQL.SaveToFile(GetTemporalPath+'ListaReportestotales.sql');
      qListaReportes.Open;
      qTotales.Open;
      dsBase.DataSet := qListaReportes;
      if qTotales.fieldByName('Total').AsInteger > 1 then
        lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + qTotales.fieldByName('Total').AsString+' Registros Encontrados >>'
      else
        lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + qTotales.fieldByName('Total').AsString+' Registro Encontrado >>';
      if CodigoReporte <> '' then
        begin
          if tsReportes.TabVisible then
            begin
              pcInformacionReporte.ActivePage:= tsReportes;
              qReporteAsociado.Locate('CodigoReporte',CodigoReporte,[]);
            end;
        end;
    end;
end;

procedure TfListaReportes.LimpiarFiltro;
var
 nLineasExtra,i: Byte;
begin
 nLineasExtra := qListaReportes.SQL.Count-19;
 if nLineasExtra > 0 then
    for i:=1 to nLineasExtra do
     begin
      qListaReportes.SQL.Delete(18);
      qTotales.SQL.Delete(18);
     end;
end;

procedure TfListaReportes.FormCreate(Sender: TObject);
begin
  inherited;
  ListaFrom := TStringList.Create;
  ListaEstadistica := TStringList.Create;
  ListaOrden := TStringList.Create;
  ListaInformantes := TStringList.create;
  Timer.Interval := 60000;
  Timer.Enabled := false;
  CodigoReporte:= '';
end;

procedure TfListaReportes.SBFiltrarClick(Sender: TObject);
begin
  Filtrar;
  inherited;
end;

procedure TfListaReportes.qListaReportesCalcFields(DataSet: TDataSet);
var qDatos:TQuery;
    Direccion:string;
begin
  Direccion:='';
  if qListaReportesCIGDANO.AsString<>'' then
  begin
    qGeografico.close;
    qGeografico.open;
    qListaReportesNombreCig.AsString:=qGeograficoBARRIO.AsString;
    qDatos:=TQuery.Create(Application);
    qDatos.DatabaseName:='BaseDato';
    qDatos.Close;
    qDatos.SQL.Text:='SELECT GETDEPARTAMENTO('+qListaReportesCIGDANO.AsString+') FROM DUAL ';
    qDatos.Open;
    qListaReportesNombreDepartamento.AsString:= qDatos.Fields[0].AsString;
    {qDatos.Close;
    qDatos.SQL.Text:='SELECT GETMUNICIPIO('+qListaReportesCIGDANO.AsString+') FROM DUAL ';
    qDatos.Open;
    qListaReportesNombreMunicipio.AsString:= qDatos.Fields[0].AsString;
    qDatos.Close;}
    qDatos.Free;
  end;
  try
    qDatos:=TQuery.Create(Application);
    qDatos.DatabaseName:='BaseDato';
    if DataSet.FieldByName('CODIGOTIPOVIA').AsString <> '' then
    begin
      qDatos.Close;
      qDatos.SQL.Text:='SELECT ABREVIATURA FROM DIR_TIPOVIA WHERE CODIGOTIPOVIA = ' +
                       DataSet.FieldByName('CODIGOTIPOVIA').AsString;
      qDatos.Open;
      Direccion:=Direccion + qDatos.Fields[0].AsString;
    end;
    if DataSet.FieldByName('CODIGONOMBREVIA').AsString <> '' then
    begin
      qDatos.Close;
      qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                       DataSet.FieldByName('CODIGONOMBREVIA').AsString;
      qDatos.Open;
      Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
    end;
    Direccion:=Direccion + DataSet.FieldByName('MODIFICADORVIA').AsString;

    if DataSet.FieldByName('DUPLICADOR').AsString <> '' then
    begin
      qDatos.Close;
      qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                       DataSet.FieldByName('DUPLICADOR').AsString;
      qDatos.Open;
      Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
    end;
    Direccion:=Direccion + DataSet.FieldByName('MODIFICADORDUPLICADOR').AsString +
               ' ' + DataSet.FieldByName('NUMEROPUERTA').AsString;

    Direccion:=Direccion + ' ' + DataSet.FieldByName('CODIGOTIPOPREDIO').AsString + ' ' +
               DataSet.FieldByName('DESCRIPCIONTIPOPREDIO').AsString;
    DataSet.FieldByName('DIRECCIONCALCULADA').AsString:=TrimLeft(Direccion);
    if (qListaReportesCODIGOREPORTE.AsString<>'') then
    begin
      qDatos.Close;
      qdatos.SQL.clear;
      qDatos.SQL.add('SELECT CODIGOODT ||''-''|| CONSECUTIVO FROM ODTREPORTE WHERE CODIGOREPORTE='+qListaReportesCODIGOREPORTE.AsString);
      qDatos.Open;
      qListaReportesCodigoodt.AsString:=qDatos.fields[0].AsString;

      qDatos.Close;
      qdatos.SQL.Clear;
      qDatos.SQL.Add('select s.nombresedeoperativa from apoyo a , c_grupoaol c, reporte r, SEDEOPERATIVA S  where c.codigogrupoaol=a.grupoaol ');
      qDatos.SQL.Add('and r.codigoapoyo=a.codigoapoyo and s.codigosedeoperativa=c.codigosedeoperativa and codigoreporte='+qListaReportesCODIGOREPORTE.AsString+' ');
      qDatos.Open;
      qListaReportesSedeOperativa.AsString := qDatos.Fields[0].AsString;
      qDatos.Close;
    end;
    if (qListaReportesCODIGOUSUARIOCREACION.AsString<>'') then
    begin
      qdatos.sql.clear;
      qDatos.sql.add('SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+qListaReportesCODIGOUSUARIOCREACION.AsString);
      qDatos.Open;
      qListaReportesNombreUsuario.AsString:=qDatos.fields[0].AsString;
    end;
  finally
    qDatos.Free;
  end;
  if (qListaReportesTIPOCLIENTE.AsString='V') then qListaReportesNombreTipoCliente.AsString:='CLIENTE VIP'
  else qListaReportesNombreTipoCliente.AsString:='NORMAL';
  if (qListaReportesCODIGOINFORMANTE.AsString='04') then
    qListaReportesNombreSolicitante.AsString:=qListaReportesNOMBREFUNCIONARIO.AsString
  else
    qListaReportesNombreSolicitante.AsString:=qListaReportesNOMBREINFORMANTE.AsString;
end;

procedure TfListaReportes.FormShow(Sender: TObject);
begin
  qListaReportes.Close;
  Filtrar;
  sbRefrescadoAutomatico.Click;
  inherited;
  if not qListaReportesCODIGOTRAFODIS.IsNull then
    begin
      if TrafoMedidaCentralizada(qListaReportesCODIGOTRAFODIS.AsString) then
        stbMensaje.Visible:= True
      else
        stbMensaje.Visible:= False;
    end;
    qOdt.close;
    qOdt.open;
end;

procedure TfListaReportes.SBImprimirClick(Sender: TObject);
begin
  inherited;
  FQRListadoReportes := TFQRListadoReportes.Create(Application);
  FQRListadoReportes.ListaRotulos.Assign(ListaRotulos);
  FQRListadoReportes.ListaDatos.Assign(ListaDatos);
  with FQRListadoReportes do
  begin
    qrTitulo.Caption := '';
    QuickRep.DataSet := qListaReportes;
    if not qODTReporte.Active then
      qODTReporte.Active := True;
    qrdbCodigoReporte.DataSet := qListaReportes;
    qrdbFechaRegistro.DataSet := qListaReportes;
    qrdbHoraRegistro.DataSet  := qListaReportes;
    qrdbFechaDictado.DataSet  := qListaReportes;
    qrdbHoraDictado.DataSet   := qListaReportes;
    qrdbTelefono.DataSet      := qListaReportes;
    qrdbDescripcion.DataSet   := qListaReportes;
    qrdbObservacion.DataSet   := qListaReportes;
    qrdbDireccion.DataSet     := qListaReportes;
    qrdbNombreCIG.DataSet     := qListaReportes;
    qrdbSolicitante.DataSet   := qListaReportes;
    qrdbCodigoODT.DataSet     := qODTReporte;
    qrdbFechaInicio.DataSet   := qListaReportes;
    qrdbHoraInicio.DataSet    := qListaReportes;
    qrdbFechaFin.DataSet      := qListaReportes;
    qrdbHoraFin.DataSet       := qListaReportes;
    qrdbMovilODT.DataSet      := qListaReportes;
    QuickRep.Preview;
  end;
end;

procedure TfListaReportes.FormDestroy(Sender: TObject);
begin
  ListaFrom.Free;
  ListaEstadistica.Free;
  ListaOrden.Free;
  ListaInformantes.free;
  inherited;
end;

procedure TfListaReportes.SBEstadisticaClick(Sender: TObject);
var punto:TPoint;
begin
 punto:=Panel2.ClientToScreen(Classes.Point(sbEstadistica.Left, sbEstadistica.top));
 pmEstadistica.Popup(punto.x+10, punto.y+10);
end;

procedure TfListaReportes.Totalatencinalcliente1Click(Sender: TObject);
var MiIndice : TIndiceMetropolitana;
begin
  MiIndice := TIndiceMetropolitana.Create('ESTADISTICAREPORTE');
  MiIndice.CrearTabla(qListaReportes);

  fIndiceAreaMetropolitana := TfIndiceAreaMetropolitana.Create(Application);
  fIndiceAreaMetropolitana.ListaRotulos.assign(ListaRotulos);
  fIndiceAreaMetropolitana.ListaDatos.assign(ListaDatos);
  with fIndiceAreaMetropolitana do
  begin
    Caption := 'Índice Area Metropolitana';
    UpdIndice.SQL[ukDelete].Clear;
    UpdIndice.SQL[ukDelete].Add('DELETE FROM ' + MiIndice.NombreTabla);
    UpdIndice.SQL[ukDelete].Add('WHERE');
    UpdIndice.SQL[ukDelete].Add('CODIGOREPORTE = :OLD_CODIGOREPORTE and');
    UpdIndice.SQL[ukDelete].Add('CODIGOODT = :OLD_CODIGOODT');
    qIndice.Close;
    qIndice.SQL.Clear;
    qIndice.SQL.Add('SELECT * FROM ' + MiIndice.NombreTabla);
    qIndice.SQL.Add('ORDER BY CODIGOODT');
    qIndice.Open;
    qGruposTrabajo.Close;
    qTotales.Close;
    qTiemposGrupo.Close;
    qODTs.Close;
    MiIndice.CambiarFrom(qGruposTrabajo);
    MiIndice.CambiarFrom(qTotales);
    MiIndice.CambiarFrom(qTiemposGrupo);
    qTotales.Open;
    qODTs.Open;
    qRegistros.Close;
    qRegistros.SQL.Clear;
    qRegistros.SQL.Text := 'SELECT COUNT(*) AS TOTALREPORTES FROM ' + MiIndice.NombreTabla;
    qRegistros.Open;
    MiIndice.Free;
    ReportesRepetidos;
    Show;
  end;
end;

{ Indice }

procedure TIndice.CambiarFrom(Query: TQuery);
var i:Integer;
begin
  for i := 0 to Query.SQL.Count - 1 do
    if Pos('FROM',UpperCase(Query.SQL[i])) > 0 then
      Query.SQL[i] := 'FROM ' + NombreTabla; 
end;

function TIndice.GetNombreTabla: string;
begin
  Result := fNombreTabla;
end;

procedure TIndice.SetNombreTabla(aValor: string);
begin
  if fNombreTabla <> aValor then
    fNombreTabla := aValor;
end;

{ IndiceMetropolitana }

procedure TIndiceMetropolitana.CrearTabla(const qReportes: TQuery);
var i:Integer;
begin
   Query.Close;
   with Query.SQL do
   begin
      Clear;
      Add('INSERT INTO ' + NombreTabla);
     Add('SELECT DISTINCT R.CODIGOREPORTE, R.CODIGOADMINISTRATIVO, R.CODIGOGRUPOTRABAJO,');
     Add('R.CIGDANO, R.CODIGOSUBESTACION, R.CODIGOCIRCUITO, R.FECHAHORA, R.FECHAHORADICTADO,');
     Add('R.FECHAHORALLEGADA, R.FECHAHORAATENCION, G.NOMBREGRUPOTRABAJO, O.CODIGOODT');
     Add('FROM REPORTE R, ODTREPORTE ODR, ODT O, GRUPOTRABAJO G, ODTDIA OD');
     Add('WHERE (R.CODIGOREPORTE = ODR.CODIGOREPORTE)');
     Add('AND (O.CODIGOADMINISTRATIVO = R.CODIGOADMINISTRATIVO)');
     Add('AND (O.CODIGOODT = OD.CODIGOODT)');
     Add('AND (O.CODIGOODT = ODR.CODIGOODT)');
     Add('AND (OD.CONSECUTIVO = ODR.CONSECUTIVO)');
     Add('AND (G.CODIGOGRUPOTRABAJO = R.CODIGOGRUPOTRABAJO)');
     Add('AND (G.CODIGOADMINISTRATIVO = R.CODIGOADMINISTRATIVO)');
     Add('AND (R.CODIGOTIPODANO <> 7 OR R.CODIGOTIPODANO IS NULL)');
     Add('AND (R.CODIGOESTADOREPORTE = 4)');
     Add('AND (R.FECHAHORA IS NOT NULL) AND (R.FECHAHORADICTADO IS NOT NULL)');
     Add('AND (R.FECHAHORALLEGADA IS NOT NULL) AND (R.FECHAHORAATENCION IS NOT NULL)');
     Add('AND (R.FECHAHORALLEGADA >= R.FECHAHORADICTADO)');
     Add('AND (R.FECHAHORAATENCION >= R.FECHAHORALLEGADA)');
     //Add('AND OD.GENERAINDICE = ''S''');
     Add('AND (R.CIGDANO NOT IN (');
     Add('SELECT CODIGOGEOGRAFICO');
     Add('FROM GEOGRAFICO');
     Add('WHERE (NOMBREGEOGRAFICO LIKE ''%VEREDA%'') OR (URBANO=''R'')))');
     Add('AND ( (R.CODIGOTIPOPREDIO NOT IN (''VER'',''FIN'') ) OR (R.CODIGOTIPOPREDIO IS NULL))');
     Add('AND ( (R.DESCRIPCIONTIPOPREDIO NOT LIKE ''%FINCA%'') OR (R.DESCRIPCIONTIPOPREDIO IS NULL) )');
     Add('AND (R.CIGDANO IN ( select codigogeografico from geografico where getmunicipio(codigogeografico) in (''BUCARAMANGA'',''FLORIDABLANCA'',''GIRON'',''PIEDECUESTA'',''BARRANCABERMEJA'')))');
     for i:=18 to qReportes.SQL.Count - 2 do
     begin
       if Trim(qReportes.SQL[i]) <> '' then
         Add(qReportes.SQL[i]);
     end;
     SaveToFile(GetTemporalPath+ 'IndiceAtencionMetrop.txt');
   end;
   Query.ExecSQL;
end;

constructor TIndiceMetropolitana.Create(aNombreTabla: string);
begin
  inherited Create;
  NombreTabla := aNombreTabla;
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  EliminarTabla;
end;

destructor TIndiceMetropolitana.Destroy;
begin
  Query.Close;
  Query.Free;
  inherited Destroy;
end;

procedure TIndiceMetropolitana.EliminarTabla;
var qTemp :TQuery;
begin
  if NombreTabla <> '' then
  begin
    qTemp := TQuery.Create(Application);
    qTemp.DatabaseName := 'BaseDato';
    qTemp.SQL.Text := 'DELETE FROM ' + NombreTabla;
    try
      qTemp.ExecSQL;
      qTemp.Free;
    except
      qTemp.Free;
    end;
  end;
end;

{ TIndiceRegional }

procedure TIndiceRural.CrearTabla(const qReportes: TQuery);
var i:Integer;
begin
   Query.Close;
   with Query.SQL do
   begin
      Clear;
      Add('INSERT INTO ' + NombreTabla);
     Add('SELECT DISTINCT R.CODIGOREPORTE, R.CODIGOADMINISTRATIVO, R.CODIGOGRUPOTRABAJO,');
     Add('R.CIGDANO, R.CODIGOSUBESTACION, R.CODIGOCIRCUITO, R.FECHAHORA, R.FECHAHORADICTADO,');
     Add('R.FECHAHORALLEGADA, R.FECHAHORAATENCION, G.NOMBREGRUPOTRABAJO, O.CODIGOODT');
     Add('FROM REPORTE R, ODTREPORTE ODR, ODT O, GRUPOTRABAJO G, ODTDIA OD');
     Add('WHERE (R.CODIGOREPORTE = ODR.CODIGOREPORTE)');
     Add('AND (O.CODIGOADMINISTRATIVO = R.CODIGOADMINISTRATIVO)');
     Add('AND (O.CODIGOODT = OD.CODIGOODT)');
     Add('AND (O.CODIGOODT = ODR.CODIGOODT)');
     Add('AND (OD.CONSECUTIVO = ODR.CONSECUTIVO)');
     Add('AND (G.CODIGOGRUPOTRABAJO = R.CODIGOGRUPOTRABAJO)');
     Add('AND (G.CODIGOADMINISTRATIVO = R.CODIGOADMINISTRATIVO)');
     Add('AND (R.CODIGOTIPODANO <> 7 OR R.CODIGOTIPODANO IS NULL)');
     Add('AND (R.CODIGOESTADOREPORTE = 4)');
     Add('AND (R.FECHAHORA IS NOT NULL) AND (R.FECHAHORADICTADO IS NOT NULL)');
     Add('AND (R.FECHAHORALLEGADA IS NOT NULL) AND (R.FECHAHORAATENCION IS NOT NULL)');
     Add('AND (R.FECHAHORALLEGADA >= R.FECHAHORADICTADO)');
     Add('AND (R.FECHAHORAATENCION >= R.FECHAHORALLEGADA)');
     //Add('AND OD.GENERAINDICE = ''S''');
     Add('AND( (R.CIGDANO IN ');
     Add('          (SELECT CODIGOGEOGRAFICO  ');
     Add('             FROM GEOGRAFICO ');
     Add('            WHERE (NOMBREGEOGRAFICO LIKE ''%VEREDA%'') OR (URBANO = ''R'') )) ');
     Add('AND (R.CIGDANO IN ');
     Add('          (SELECT codigogeografico ');
     Add('             FROM geografico  ');
     Add('            WHERE getmunicipio (codigogeografico) IN ');
     Add('                     (''BUCARAMANGA'',  ''FLORIDABLANCA'', ''GIRON'', ''PIEDECUESTA'', ''BARRANCABERMEJA''))) ');
     Add('   OR (R.CIGDANO NOT IN ');
     Add('         (SELECT codigogeografico ');
     Add('            FROM geografico ');
     Add('           WHERE getmunicipio (codigogeografico) IN ');
     Add('                    (''BUCARAMANGA'',  ''FLORIDABLANCA'',  ''GIRON'',  ''PIEDECUESTA'',  ''BARRANCABERMEJA'')))) ');



   {  Add('AND ((R.CIGDANO IN (');
     Add('SELECT CODIGOGEOGRAFICO');
     Add('FROM GEOGRAFICO');
     Add('WHERE (NOMBREGEOGRAFICO LIKE ''%VEREDA%'')OR (URBANO=''R'')) )');
     Add('AND ( (R.CODIGOTIPOPREDIO NOT IN (''VER'',''FIN'') ) OR (R.CODIGOTIPOPREDIO IS NULL))');
     Add('AND ( (R.DESCRIPCIONTIPOPREDIO NOT LIKE ''%FINCA%'') OR (R.DESCRIPCIONTIPOPREDIO IS NULL) )');
     Add('AND (R.CIGDANO IN ( select codigogeografico from geografico where getmunicipio(codigogeografico) in (''BUCARAMANGA'',''FLORIDABLANCA'',''GIRON'',''PIEDECUESTA'',''BARRANCABERMEJA'')))');
     Add('OR (R.CIGDANO NOT IN ( select codigogeografico from geografico where getmunicipio(codigogeografico) in (''BUCARAMANGA'',''FLORIDABLANCA'',''GIRON'',''PIEDECUESTA'',''BARRANCABERMEJA'')))');}
     for i:=18 to qReportes.SQL.Count - 2 do
     begin
       if Trim(qReportes.SQL[i]) <> '' then
         Add(qReportes.SQL[i]);
     end;
     SaveToFile(gettemporalpath+'IndiceAtencionRural.txt');
   end;
   Query.ExecSQL;
end;

constructor TIndiceRural.Create(aNombreTabla: string);
begin
  inherited Create;
  NombreTabla := aNombreTabla;
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  EliminarTabla;
end;

destructor TIndiceRural.Destroy;
begin
  Query.Close;
  Query.Free;
  inherited Destroy;
end;

procedure TIndiceRural.EliminarTabla;
var qTemp :TQuery;
begin
  if NombreTabla <> '' then
  begin
    qTemp := TQuery.Create(Application);
    qTemp.DatabaseName := 'BaseDato';
    qTemp.SQL.Text := 'DELETE FROM ' + NombreTabla;
    try
      qTemp.ExecSQL;
      qTemp.Free;
    except
      qTemp.Free;
    end;
  end;
end;

procedure TfListaReportes.ndicedeatencinalclienterearural1Click(
  Sender: TObject);
var MiIndice : TIndiceRural;
begin
  MiIndice := TIndiceRural.Create('ESTADISTICAREPORTE');
  MiIndice.CrearTabla(qListaReportes);

  fIndiceAreaMetropolitana := TfIndiceAreaMetropolitana.Create(Application);
  fIndiceAreaMetropolitana.ListaRotulos.assign(ListaRotulos);
  fIndiceAreaMetropolitana.ListaDatos.assign(ListaDatos);
  with fIndiceAreaMetropolitana do
  begin
    Caption := 'Índice Area Rural';
    UpdIndice.SQL[ukDelete].Clear;
    UpdIndice.SQL[ukDelete].Add('DELETE FROM ' + MiIndice.NombreTabla);
    UpdIndice.SQL[ukDelete].Add('WHERE');
    UpdIndice.SQL[ukDelete].Add('CODIGOREPORTE = :OLD_CODIGOREPORTE and');
    UpdIndice.SQL[ukDelete].Add('CODIGOODT = :OLD_CODIGOODT');
    qIndice.Close;
    qIndice.SQL.Clear;
    qIndice.SQL.Add('SELECT * FROM ' + MiIndice.NombreTabla);
    qIndice.SQL.Add('ORDER BY 1 ASC');
    qIndice.Open;
    qGruposTrabajo.Close;
    qTotales.Close;
    qTiemposGrupo.Close;
    qODTs.Close;
    MiIndice.CambiarFrom(qGruposTrabajo);
    MiIndice.CambiarFrom(qTotales);
    MiIndice.CambiarFrom(qTiemposGrupo);
    qTiemposGrupo.Open;
    qGruposTrabajo.Open;
    qTotales.Open;
    qODTs.Open;
    qRegistros.Close;
    qRegistros.SQL.Clear;
    qRegistros.SQL.Text := 'SELECT COUNT(*) AS TOTALREPORTES FROM ' + MiIndice.NombreTabla;
    qRegistros.Open;
    MiIndice.Free;
    Show;
  end;
end;

{ TIndicePodas }

procedure TIndicePodas.CrearTabla(const qReportes: TQuery);
var i:Integer;
begin
   Query.Close;
   with Query.SQL do
   begin
      Clear;
      Add('INSERT INTO ' + NombreTabla);
     Add('SELECT DISTINCT R.CODIGOREPORTE, R.CODIGOADMINISTRATIVO, R.CODIGOGRUPOTRABAJO,');
     Add('R.CIGDANO, R.CODIGOSUBESTACION, R.CODIGOCIRCUITO, R.FECHAHORA, R.FECHAHORADICTADO,');
     Add('R.FECHAHORALLEGADA, R.FECHAHORAATENCION, G.NOMBREGRUPOTRABAJO, O.CODIGOODT');
     Add('FROM REPORTE R, ODTREPORTE ODR, ODT O, GRUPOTRABAJO G , ODTDETALLEACTIVIDAD ODA');
     Add('WHERE (R.CODIGOREPORTE = ODR.CODIGOREPORTE)');
     Add('AND (O.CODIGOODT = ODR.CODIGOODT)');
     Add('AND (O.CODIGOADMINISTRATIVO = R.CODIGOADMINISTRATIVO)');
     Add('AND (R.CODIGOESTADOREPORTE = ''4'')');
     Add('AND (R.CODIGOTIPODANO = 7 OR R.CODIGOTIPODANO IS NULL)');
     Add('AND (G.CODIGOGRUPOTRABAJO (+)= R.CODIGOGRUPOTRABAJO)');
     Add('AND (G.CODIGOADMINISTRATIVO (+)= R.CODIGOADMINISTRATIVO)');
     Add('AND (O.CODIGOODT (+)= ODA.CODIGOODT)');
     Add('AND (ODA.CODIGOODTACTIVIDAD = 9)');
     Add('AND (R.FECHAHORA IS NOT NULL) AND (R.FECHAHORADICTADO IS NOT NULL)');
     Add('AND (R.FECHAHORALLEGADA IS NOT NULL) AND (R.FECHAHORAATENCION IS NOT NULL)');
     Add('AND (R.FECHAHORALLEGADA >= R.FECHAHORADICTADO)');
     Add('AND (R.FECHAHORAATENCION >= R.FECHAHORALLEGADA)');
     for i:=18 to qReportes.SQL.Count - 2 do
     begin
       if Trim(qReportes.SQL[i]) <> '' then
         Add(qReportes.SQL[i]);
     end;
     SaveToFile(GetTemporalPath+ 'IndiceAtencionPodas.txt');
   end;
   Query.ExecSQL;
end;

constructor TIndicePodas.Create(aNombreTabla: string);
begin
  inherited Create;
  NombreTabla := aNombreTabla;
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  EliminarTabla;
end;

destructor TIndicePodas.Destroy;
begin
  Query.Close;
  Query.Free;
  inherited Destroy;
end;

procedure TIndicePodas.EliminarTabla;
var qTemp :TQuery;
begin
  if NombreTabla <> '' then
  begin
    qTemp := TQuery.Create(Application);
    qTemp.DatabaseName := 'BaseDato';
    qTemp.SQL.Text := 'DELETE FROM ' + NombreTabla;
    try
      qTemp.ExecSQL;
      qTemp.Free;
    except
      qTemp.Free;
    end;
  end;
end;

procedure TfListaReportes.ndicedepodas1Click(Sender: TObject);
var MiIndice : TIndicePodas;
begin
  MiIndice := TIndicePodas.Create('ESTADISTICAREPORTE');
  MiIndice.CrearTabla(qListaReportes);

  fIndiceAreaMetropolitana := TfIndiceAreaMetropolitana.Create(Application);
  fIndiceAreaMetropolitana.ListaRotulos.assign(ListaRotulos);
  fIndiceAreaMetropolitana.ListaDatos.assign(ListaDatos);
  with fIndiceAreaMetropolitana do
  begin
    Caption := 'Índice Podas';
    UpdIndice.SQL[ukDelete].Clear;
    UpdIndice.SQL[ukDelete].Add('DELETE FROM ' + MiIndice.NombreTabla);
    UpdIndice.SQL[ukDelete].Add('WHERE');
    UpdIndice.SQL[ukDelete].Add('CODIGOREPORTE = :OLD_CODIGOREPORTE and');
    UpdIndice.SQL[ukDelete].Add('CODIGOODT = :OLD_CODIGOODT');
    qIndice.Close;
    qIndice.SQL.Clear;
    qIndice.SQL.Add('SELECT * FROM ' + MiIndice.NombreTabla);
    qIndice.SQL.Add('ORDER BY 1 ASC');
    qIndice.Open;
    qGruposTrabajo.Close;
    qTotales.Close;
    qTiemposGrupo.Close;
    qODTs.Close;
    MiIndice.CambiarFrom(qGruposTrabajo);
    MiIndice.CambiarFrom(qTotales);
    MiIndice.CambiarFrom(qTiemposGrupo);
    qTiemposGrupo.Open;
    qGruposTrabajo.Open;
    qTotales.Open;
    qODTs.Open;
    qRegistros.Close;
    qRegistros.SQL.Clear;
    qRegistros.SQL.Text := 'SELECT COUNT(*) AS TOTALREPORTES FROM ' + MiIndice.NombreTabla;
    qRegistros.Open;
    MiIndice.Free;
    Show;
  end;

end;

procedure TfListaReportes.dbgListaReportesMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
begin
  pt:= dbgListaReportes.MouseCoord(x, y);

  if pt.y=0 then
   begin
      dbgListaReportes.Cursor:=crHandPoint;
      if Shift = [ssShift] then
          TeclaShift:=True
      else
          TeclaShift:=False;
    end
  else
    dbgListaReportes.Cursor:=crDefault;
end;

procedure TfListaReportes.dbgListaReportesTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if qListaReportes.FieldByName(Columna).Lookup  then
    Result := qListaReportes.FieldByName(Columna).KeyFields
  else
    if qListaReportes.FieldByName(Columna).Calculated then
    begin
      Result := '1';
      raise exception.create('Imposible ordenar por este campo calculado.');
    end
    else
      Result := Columna;
end;

var
  ListaTemp:TStringList;
  i,j:Integer;
  Encontrado:Boolean;
  Sort:String;
begin

  with dbgListaReportes.DataSource.DataSet do
  begin
    try
      dbgListaReportes.Columns[PreviousColumnIndex].title.Font.Style :=
      dbgListaReportes.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
    except
    end;
    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];

    Encontrado:=False;
    if PreviousColumnIndex = Column.Index then
       begin
         Encontrado:=True;
         ListaTemp:=TStringList.Create;
         for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
              end;
          end;
          ListaTemp.Free;
        end
    else
      begin
          if (not TeclaShift) then
             ListaOrden.Clear;
      end;

    PreviousColumnIndex := Column.Index;
    if (ListaOrden.Count > 0) and (not Encontrado) then
     begin
        ListaTemp:=TStringList.Create;
        Encontrado:=False;
        for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
                Encontrado:=True;
              end;
          end;
        if (not Encontrado) then
          if NombreColumna(Column.Field.FieldName) <> '' then
            ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');
        ListaTemp.Free;
     end;

     if (ListaOrden.Count = 0) then
       if NombreColumna(Column.Field.FieldName) <> '' then
        ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');

     qListaReportes.SQl.Delete(qListaReportes.SQl.Count - 1);
     Sort:='Order By ';
     for i:=0 to ListaOrden.Count - 1 do
     begin
       ListaTemp:=TStringList.Create;
       ListaTemp.CommaText:=ListaOrden[i];
       if i <> ListaOrden.Count - 1 then
         Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1] + ','
       else
         Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1];
       ListaTemp.Free;
     end;

     qListaReportes.Sql.Add(Sort);
     qListaReportes.Close;
     qListaReportes.Open;
  end;
end;

procedure TfListaReportes.SBOrdenarClick(Sender: TObject);
begin
  qListaReportes.Close;
  qListaReportes.Open;
  qTotales.Close;
  qTotales.Open;
end;

procedure TfListaReportes.TimerTimer(Sender: TObject);
var Cuantos: Integer;
    CodigoReporte : Double;
begin
  try
    Cuantos := qTotales.FieldByName('Total').AsInteger;
    qTotales.Close;
    qTotales.Open;
    StatusBar1.Color:=clBtnFace;
    StatusBar1.Font.Color:=clWindowText;
    StatusBar1.Panels[0].Text:='';
    if qTotales.FieldByName('Total').AsInteger <> Cuantos then
    begin
      Beep;    
      if qTotales.FieldByName('Total').AsInteger > Cuantos then
      begin
        MessageDlg('Ha ingresado un nuevo reporte al listado.',mtInformation,[mbOk],0);
        StatusBar1.Color:=clSilver;
        StatusBar1.Font.Color:=clNavy;
        StatusBar1.Panels[0].Text:='Se ha ingresado  al listado un nuevo reporte que cumple con el filtro aplicado.';
        CodigoReporte := qListaReportesCODIGOREPORTE.AsFloat;
      end;
      qListaReportes.Close;
      qListaReportes.Open;
//      qListaReportes.Locate('CODIGOREPORTE',CodigoReporte,[]);
    end;
  except
  end;
end;

procedure TfListaReportes.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_F5 then
  begin
    SBOrdenarClick(nil);
  end;
end;

procedure TfListaReportes.SBBuscarClick(Sender: TObject);
begin
  inherited;
  FBuscarReporte := TfBuscarReporte.Create(Application);
  FBuscarReporte.dsReporte.DataSet:=qListaReportes;
  FBuscarReporte.ShowModal;
  FBuscarReporte.Free;
  dbgListaReportes.Setfocus;
end;

procedure TfListaReportes.sbRefrescadoAutomaticoClick(Sender: TObject);
begin
  inherited;
  Timer.Enabled:=sbRefrescadoAutomatico.Down;
  if sbRefrescadoAutomatico.Down then
  begin
    sbRefrescadoAutomatico.Hint:='Refrescado automático de nuevos reporte habilitado.';
    StatusBar1.Panels[0].Text:='Se refrescarán Los nuevos reportes que cumplan con el filtro cada minuto.';    
  end
  else
    sbRefrescadoAutomatico.Hint:='Refrescado automático deshabilitado';
end;

procedure TfListaReportes.StatusBar1Click(Sender: TObject);
begin
  StatusBar1.Panels[0].Text:='';
  StatusBar1.Color:=clBtnFace;
  StatusBar1.Font.Color:=clWindowText;
end;

procedure TfListaReportes.SBFiltroCarograficoClick(Sender: TObject);
begin
  inherited;
  FiltroReporte(ListaRotulos, ListaDatos, ListaFrom, Lista);
end;

procedure TfListaReportes.qReporteAsociadoCalcFields(DataSet: TDataSet);
var qDatos:TQuery;
    Direccion:string;
begin
  Direccion:='';
  qDatos:=TQuery.Create(Application);
  qDatos.DatabaseName:='BaseDato';
  if qReporteAsociadoCIGDANO.AsString<>'' then
  begin
    qDatos.Close;
    qDatos.SQL.clear;
    qDatos.SQL.Text:='Select * from nombrebarrio where codigogeografico=' +
                       DataSet.FieldByName('CIGDANO').AsString;
    qDatos.Open;
    qReporteAsociadoCIG.asString:=qDatos.FieldByName('BARRIO').AsString;
  end;

    qDatos.Close;
    qDatos.SQL.clear;
    if DataSet.FieldByName('CODIGOTIPOVIA').AsString <> '' then
    begin
      qDatos.Close;
      qDatos.SQL.Text:='SELECT ABREVIATURA FROM DIR_TIPOVIA WHERE CODIGOTIPOVIA = ' +
                       DataSet.FieldByName('CODIGOTIPOVIA').AsString;
      qDatos.Open;
      Direccion:=Direccion + qDatos.Fields[0].AsString;
    end;
    if DataSet.FieldByName('CODIGONOMBREVIA').AsString <> '' then
    begin
      qDatos.Close;
      qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                       DataSet.FieldByName('CODIGONOMBREVIA').AsString;
      qDatos.Open;
      Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
    end;
    Direccion:=Direccion + DataSet.FieldByName('MODIFICADORVIA').AsString;

    if DataSet.FieldByName('DUPLICADOR').AsString <> '' then
    begin
      qDatos.Close;
      qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                       DataSet.FieldByName('DUPLICADOR').AsString;
      qDatos.Open;
      Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
    end;
    Direccion:=Direccion + DataSet.FieldByName('MODIFICADORDUPLICADOR').AsString +
               ' ' + DataSet.FieldByName('NUMEROPUERTA').AsString;

    Direccion:=Direccion + ' ' + DataSet.FieldByName('CODIGOTIPOPREDIO').AsString + ' ' +
               DataSet.FieldByName('DESCRIPCIONTIPOPREDIO').AsString;
    DataSet.FieldByName('DIRECCION').AsString:=TrimLeft(Direccion);

  qDatos.close;
  qDatos.Free;

end;

procedure TfListaReportes.qListaReportesAfterScroll(DataSet: TDataSet);
var i:integer;
Evento:TStringList;
begin
  tsReportes.TabVisible:=False;
  if qListaReportesREPORTEPADRE.AsString <> '' then
  begin
    qReporteAsociado.Close;
    qReporteAsociado.ParamByname('CODIGOREPORTEPADRE').AsString:=qListaReportesCODIGOREPORTE.AsString;
    qReporteAsociado.open;
    i:=1;

    while not qReporteAsociado.eof do
    begin
      tsReportes.TabVisible:=True;
      if i=1 then
        ListaInformantes.add(qListaReportesCODIGOCLIENTESGD.AsString);

      ListaInformantes.add(qReporteAsociadoCODIGOCLIENTESGD.AsString);
      qReporteAsociado.Next;
      i:=i+1;
    end;
  end;

  memo.Clear;

  if qListaReportesCODIGOTRAFODIS.asString <>'' then
    begin
      Evento:=TStringList.Create;
      Evento.Assign(VerificarInterrupcion(qListaReportesCODIGOTRAFODIS.asString)); //Verifica si existe evento abierto.
      if evento.Count=4 then
        begin
          if evento[1]<> '' then
            memo.Lines.Add(evento[1]);
        end;
      Evento.Free;

      if TrafoMedidaCentralizada(qListaReportesCODIGOTRAFODIS.AsString) then
        stbMensaje.Visible:= True
      else
        stbMensaje.Visible:= False;
    end
  else
    stbMensaje.Visible:= False;

end;

procedure TfListaReportes.sbUbicarSubestacionClick(Sender: TObject);
begin
  if qListaReportesCODIGOSUBESTACION.AsString<>'' then
  begin
    MostrarMapa;
    buscarsubestacion(qListaReportesCODIGOSUBESTACION.AsString, false);
  end;
end;

procedure TfListaReportes.SpeedButton1Click(Sender: TObject);
begin
  if qListaReportesCodigoCircuito.AsString<>'' then
  begin
    MostrarMapa();
    BuscarCircuito(qListaReportesCodigoCircuito.AsString);
  end;
end;

procedure TfListaReportes.sbInterruptorClick(Sender: TObject);
var qDatos:TQuery;
sl:TStringList;
sTramos:string;
begin
  sl:=TStringList.Create;
  {sl.Assign(TramosMTInterruptor(qReporteAsociadoCODIGOCIRCUITO.AsString, qReporteAsociadoCODIGOINTERRUPTORDIS.asString));
  if sl<>nil then
  begin
    sTramos:='';
    for i:=0 to sl.Count-1 do
      sTramos:=sTramos+sl[i]+',';

    sTramos:=copy(sTramos,1,length(sTramos)-1);
    MostrarMapa();
    FiltrarTramo(sTramos,2);
    beep;
  end;

  sl.Clear; }
  sl.Assign(TramosBTInterruptor(qReporteAsociadoCODIGOCIRCUITO.AsString, qReporteAsociadoCODIGOINTERRUPTORDIS.asString));
  if sl<>nil then
  begin
    sTramos:=sl.commatext;
    FiltrarTramo(sTramos,1);
  end;
  sl.free;

end;

procedure TfListaReportes.SpeedButton3Click(Sender: TObject);
begin
  if qReporteAsociadoCODIGOTRAFODIS.AsString <> '' then
  begin
    MostrarMapa();
    LineasTrafoDis(qReporteAsociadoCODIGOTRAFODIS.AsString,1,3);
    MarcarClientes(ListaInformantes,clBlack,False);
  end;
end;

procedure TfListaReportes.SpeedButton4Click(Sender: TObject);
Var qBuscarApoyo : TQuery;
begin
  if (qReporteAsociadoCODIGOAPOYO.AsString<>'') then
  begin
    BuscarApoyo(qReporteAsociadoCODIGOAPOYO.AsString,True);
  end
  else
  begin
    qBuscarApoyo := TQuery.Create(Application);
    qBuscarApoyo.DatabaseName:=qReporteAsociado.DatabaseName;
    qBuscarApoyo.Close;
    qBuscarApoyo.Sql.Add('Select CodigoApoyo From Apoyo where PintadoApoyo='''+qReporteAsociado.FieldByName('PINTADOAPOYO').AsString+'''');
    qBuscarApoyo.Open;
    try
      BuscarApoyo(qBuscarApoyo.FieldByName('CodigoApoyo').AsString,True);
    except
      on e:exception do
      begin
        showmessage(e.message);
      end;
    end;
    qBuscarApoyo.Free;
  end;
end;

procedure TfListaReportes.SpeedButton5Click(Sender: TObject);
var
 nSql:integer;
 sql:string;
begin
//  MarcarClientes(ListaInformantes,clBlack);

  MostrarMapa();
  FlistaReportesAgrupados:=TFListaReportesAgrupados.create(Application);
  nSql:=qListaReportes.SQL.count;
  FlistaReportesAgrupados.qlistareportes.close;
  FlistaReportesAgrupados.qlistareportes.SQL.clear;
  FlistaReportesAgrupados.qlistareportes.sql.text:=qListaReportes.SQL.Text;
  sql:=FlistaReportesAgrupados.qlistareportes.sql[nSql-1];
  while (FlistaReportesAgrupados.qlistareportes.sql[nSql-1]='') or (pos('ORDER',uppercase(sql))>0) do
  begin
    FlistaReportesAgrupados.qlistareportes.sql.Delete(nSql-1);
    nSql:=FlistaReportesAgrupados.qlistareportes.sql.count;
    sql:=FlistaReportesAgrupados.qlistareportes.sql[nSql-1];
  end;
  FlistaReportesAgrupados.qlistareportes.sql.Add('AND (R.CODIGOCLASEREPORTE = ''2'')');
  FlistaReportesAgrupados.qlistareportes.sql.Add('AND (R.CODIGOREPORTE=R.REPORTEPADRE OR R.REPORTEPADRE IS NULL)');
  FlistaReportesAgrupados.qlistareportes.sql.Add('ORDER BY R.CODIGOREPORTE DESC');;
  FlistaReportesAgrupados.qlistareportes.open;
  FlistaReportesAgrupados.show;
end;

procedure TfListaReportes.SpeedButton6Click(Sender: TObject);
var
  i,j:Integer;
  sCodReportes,sPadre,sMensaje:string;
begin
  if dbgReportesAsociados.SelectedRows.Count>0 then
  begin
    sCodReportes:='';
    sPadre:=qListaReportesCODIGOREPORTE.asString;
    for i:=0 to dbgReportesAsociados.SelectedRows.Count-1 do
    begin
      qReporteAsociado.BookMark:=dbgReportesAsociados.SelectedRows.Items[i];
      j:=j+1;
      sCodReportes:=sCodReportes+qReporteAsociadoCODIGOREPORTE.asString+',';
    end;

    sCodReportes:=copy(sCodReportes,1,length(sCodReportes)-1);

    if j=1 then
      sMensaje:='Desea desagrupar el reporte '+sCodReportes+' del reporte '+sPadre+' ?'
    else
      sMensaje:='Desea desagrupar los reportes '+sCodReportes+' del reporte '+sPadre+' ?';

    if Application.MessageBox(pChar(sMensaje),'Agrupar Reportes',MB_YESNO+ MB_ICONINFORMATION) = IDYES then
    begin
      DesAgruparReportes(sPadre,sCodReportes);
      ActualizarReporteDesagrupado(sCodReportes);
      qListaReportes.close;
      qListaReportes.open;
    end;
  end;
end;

procedure TfListaReportes.sbAgruparReporteClick(Sender: TObject);
var
 nSql:integer;
 sql:string;
begin
  MostrarMapa();
  FlistaReportesAgrupados:=TFListaReportesAgrupados.create(Application);
  nSql:=qListaReportes.SQL.count;
  FlistaReportesAgrupados.qlistareportes.close;
  FlistaReportesAgrupados.qlistareportes.SQL.clear;
  FlistaReportesAgrupados.qlistareportes.sql.text:=qListaReportes.SQL.Text;
  sql:=FlistaReportesAgrupados.qlistareportes.sql[nSql];
  while (FlistaReportesAgrupados.qlistareportes.sql[nSql-1]='') or (pos('ORDER',uppercase(sql))>0) do
  begin
    FlistaReportesAgrupados.qlistareportes.sql.Delete(nSql-1);
    nSql:=FlistaReportesAgrupados.qlistareportes.sql.count;
    sql:=FlistaReportesAgrupados.qlistareportes.sql[nSql-1];
  end;
  FlistaReportesAgrupados.qlistareportes.sql.Add('AND (R.CODIGOCLASEREPORTE = ''2'')');
  FlistaReportesAgrupados.qlistareportes.sql.Add('AND (R.CODIGOREPORTE=R.REPORTEPADRE OR R.REPORTEPADRE IS NULL)');
  FlistaReportesAgrupados.qlistareportes.sql.Add('ORDER BY R.CODIGOREPORTE DESC');
  FlistaReportesAgrupados.qlistareportes.open;

  FlistaReportesAgrupados.show;
end;

procedure TfListaReportes.AgruparReporte1Click(Sender: TObject);
begin
  //if (qListaReportesCODIGOESTADOREPORTE.AsString <> '4') and (qListaReportesCODIGOESTADOREPORTE.AsString <> '5') and (qListaReportesCODIGOTRAFODIS.AsString <> '') then
  if (qListaReportesCODIGOESTADOREPORTE.AsString <> '4') and (qListaReportesCODIGOESTADOREPORTE.AsString <> '5') then
    AsociarReporte(qListaReportesCODIGOREPORTE.AsString)
  else
    Application.MessageBox('El reporte se encuentra reparado, cancelado'+#13+
                           'o  no tiene  transformador  asociado por lo'+#13+
                           'tanto no se puede agrupar manualmente.',PChar('Información'),mb_ok+MB_ICONINFORMATION);
  {if qListaReportesCODIGOTRAFODIS.AsString = ''  then
  begin
    AsociarReporte(qListaReportesCODIGOREPORTE.AsString)
  end
  else
    application.MessageBox('El reporte seleccionado tiene transformador asociado'+#13+'por lo tanto no se puede agrupar manualmente',PChar('Información'),mb_ok+MB_ICONINFORMATION);
  }
end;

function TfListaReportes.AsociarReporte(CodigoReporte: String): Boolean;
var
  CodigoReportePadre, CodReporteAbuelo, CodEstadoReportePadre, NomTipoLabor:String;
  qReporte, qUpdateReporte ,qCircuito, qry: TQuery;
begin
  CodReporteAbuelo:='';
  CodEstadoReportePadre:='';
  NomTipoLabor:='';

  qry:=TQuery.Create(nil);
  qry.DatabaseName:='BaseDato';
  qry.SQL.Add('SELECT CODIGOREPORTE FROM REPORTE WHERE REPORTEPADRE='+CodigoReporte);
  qry.SQL.Add('AND CODIGOREPORTE <> '+CodigoReporte);
  qry.Open;
  if not qry.IsEmpty then
  begin
    qry.Close;
    qry.Free;
    raise Exception.Create('No se puede agrupar este reporte porque tiene reporte hijos asociados.');
  end;
  qry.Close;
  qry.Free;

  if InputQuery('Digite el código de reporte a asociar','Codigo Reporte', CodigoReportePadre) then
  begin
    if CodigoReportePadre <> '' then
    begin
      qReporte:=TQuery.Create(nil);
      qReporte.DatabaseName:='BaseDato';
      qReporte.Close;
      qReporte.SQL.Clear;
      qReporte.SQL.Add('SELECT R.CODIGOREPORTE, R.CODIGOESTADOREPORTE, T.NOMBRETIPOLABORREPORTE');
      qReporte.SQL.Add('FROM REPORTE R, TIPOLABORREPORTE T');
      qReporte.SQL.Add('WHERE R.CODIGOTIPOLABORREPORTE=T.CODIGOTIPOLABORREPORTE(+)');
      qReporte.SQL.Add('AND R.CODIGOREPORTE='+CodigoReportePadre);
      qReporte.Open;
      if not qReporte.IsEmpty then
      begin
        CodEstadoReportePadre:= qReporte.FieldByName('CODIGOESTADOREPORTE').AsString;
        NomTipoLabor:= qReporte.FieldByName('NOMBRETIPOLABORREPORTE').AsString;

        qry:=TQuery.Create(nil);
        qry.DatabaseName:='BaseDato';
        qry.SQL.Add('SELECT REPORTEPADRE FROM REPORTE WHERE CODIGOREPORTE='+CodigoReportePadre);
        qry.Open;
        CodReporteAbuelo:= qry.FieldByName('REPORTEPADRE').AsString;
        qry.Close;

        if (CodReporteAbuelo <> '') and (CodigoReportePadre <> CodReporteAbuelo) then
        begin
          if Application.MessageBox(pChar('No se puede asociar el reporte No. '+CodigoReporte+' al reporte digitado No. ['+CodigoReportePadre+'] '+
                                          'ya que éste ultimo se encuentra asociado al reporte No. '+CodReporteAbuelo+'.'+
                                          chr(13)+chr(13)+'Desea intentar asociar el reporte No. '+CodigoReporte+' al reporte No. '+CodReporteAbuelo+' ?'),
                                          'Agrupar Reportes',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = IDYES then
          begin
            CodigoReportePadre:= CodReporteAbuelo;
            qry.SQL.Clear;
            qry.SQL.Add('SELECT R.CODIGOREPORTE, R.CODIGOESTADOREPORTE, T.NOMBRETIPOLABORREPORTE');
            qry.SQL.Add('FROM REPORTE R, TIPOLABORREPORTE T');
            qry.SQL.Add('WHERE R.CODIGOTIPOLABORREPORTE=T.CODIGOTIPOLABORREPORTE(+)');
            qry.SQL.Add('AND R.CODIGOREPORTE='+CodReporteAbuelo);
            qry.Open;
            CodEstadoReportePadre:= qry.FieldByName('CODIGOESTADOREPORTE').AsString;
            NomTipoLabor:= qry.FieldByName('NOMBRETIPOLABORREPORTE').AsString;
            qry.Close;
          end
          else
          begin
            qry.Free;
            qReporte.Close;
            qReporte.Free;
            Application.MessageBox(pChar('No se asoció el reporte No. '+CodigoReporte),'Agrupar Reportes',MB_OK+ MB_ICONINFORMATION);
            Exit;
          end;
        end;
        qry.Free;

        if CodEstadoReportePadre <> '5' then
        begin
          if (not TrafoPadreHijosIgualesSinAgrupar(CodigoReportePadre,CodigoReporte)) and (UpperCase(NomTipoLabor) = 'TRANSFORMADOR') then
            ActualizarTipoLaborReporte(CodigoReportePadre,'3');

          AgruparReportes(CodigoReportePadre,CodigoReporte);
          ActualizarReportesHijos(CodigoReportePadre);
          qListaReportes.Close;
          qListaReportes.Open;
        end
        else
          application.MessageBox(PChar('El reporte padre No. '+CodigoReportePadre+' se encuentra cancelado'+#13+'por lo tanto no se le puede agrupar hijos.'),PChar('Información'),MB_OK+MB_ICONINFORMATION);
      end
      else
        application.MessageBox('El código de reporte digitado no existe',PChar('Información'),MB_OK+MB_ICONINFORMATION);

      qReporte.Close;
      qReporte.Free;
    end;
  end;
end;

procedure TfListaReportes.DesagruparReporteHijoClick(Sender: TObject);
var
  sCodReportes,sPadre,sMensaje,CodigoReporte:string;
begin
  if dbgReportesAsociados.SelectedRows.Count>0 then
  begin
    sCodReportes:='';
    sPadre:=qListaReportesCODIGOREPORTE.asString;
    sCodReportes:=qReporteAsociadoCODIGOREPORTE.asString;
    sMensaje:='Desea desagrupar el reporte '+sCodReportes+' del reporte '+sPadre+' ?';
    if Application.MessageBox(pChar(sMensaje),'Desagrupar Reporte',MB_YESNO+ MB_ICONINFORMATION) = IDYES then
    begin
      DesAgruparReportes(sPadre,sCodReportes);
      ActualizarReporteDesagrupado(sCodReportes);
      qListaReportes.close;
      qListaReportes.open;
      VisualizarFormReporte(sCodReportes);
    end;
  end;
end;

procedure TfListaReportes.pmAsociarChange(Sender: TObject;
  Source: TMenuItem; Rebuild: Boolean);
var
  sCodReportes,sPadre,sMensaje:string;
begin
  if dbgReportesAsociados.SelectedRows.Count>0 then
  begin
    sCodReportes:='';
    sPadre:=qListaReportesCODIGOREPORTE.asString;
    sCodReportes:=qReporteAsociadoCODIGOREPORTE.asString;
    sMensaje:='Desea desagrupar el reporte '+sCodReportes+' del reporte '+sPadre+' ?';
    if Application.MessageBox(pChar(sMensaje),'Agrupar Reportes',MB_YESNO+ MB_ICONINFORMATION) = IDYES then
    begin
      DesAgruparReportes(sPadre,sCodReportes);
      ActualizarReporteDesagrupado(sCodReportes);
      qListaReportes.close;
      qListaReportes.open;
    end;
  end;
end;

procedure TfListaReportes.DesagruparReporte1Click(Sender: TObject);
var
  qHijosReporte:Tquery;
  CodigoReporte:String;
begin
  qHijosReporte:=TQuery.create(nil);
  qHijosReporte.DatabaseName:='BaseDato';
  qHijosReporte.sql.Add('select count(*) as cantidad from reporte where reportepadre='+qListaReportesCODIGOREPORTE.AsString);
  qHijosReporte.Open;
  if qHijosReporte.FieldByName('cantidad').AsInteger > 0 then
  begin
    if Application.MessageBox(pChar('Esta seguro de desagrupar el reporte padre '+CodigoReporte+'?'),'Desagrupar Reporte',MB_YESNO+MB_ICONQUESTION) = IDYES then
    begin
      CodigoReporte:=qListaReportesCODIGOREPORTE.AsString;
      DesAgruparReportePadre(qListaReportesCODIGOREPORTE.AsString);
      ActualizarReporteDesagrupado(qListaReportesCODIGOREPORTE.AsString);
      qListaReportes.close;
      qListaReportes.open;
      Application.MessageBox(pChar('Se desagrupó el reporte padre: '+CodigoReporte+' con éxito'),'Desagrupar Reporte',MB_OK+ MB_ICONINFORMATION);
      VisualizarFormReporte(CodigoReporte);
    end;
  end
  else
    application.MessageBox('El registro seleccionado no tiene reportes asociados.',PChar('Información'),mb_ok+MB_ICONINFORMATION);
  qHijosReporte.close;
  qHijosReporte.free;

end;

procedure TfListaReportes.VisualizarFormReporte(CodigoReporte:String);
begin

  if not (Assigned(Application.FindComponent('fReporte') as TForm)) then
    fReporte:=TfReporte.Create(Application);
  fReporte.qReporte.Active:=False;
  fReporte.qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE='+
                                CodigoReporte;
  fReporte.qReporte.Active:=True;
  fReporte.qReporte.Edit;
  fReporte.qgrupotrabajo.Close;
  If freporte.qReporteCODIGOGRUPOTRABAJO.ASSTRING <> '' then
    fReporte.qgrupotrabajo.SQL.text:= fReporte.qgrupotrabajo.SQL.text + ' AND (ACTIVO = ''S'' OR CODIGOGRUPOTRABAJO = '+ freporte.qReporteCODIGOGRUPOTRABAJO.ASSTRING+')'
  else
    fReporte.qgrupotrabajo.SQL.text:= fReporte.qgrupotrabajo.SQL.text + ' AND (ACTIVO = ''S'')';
  fReporte.qGrupoTrabajo.Open;

  fReporte.DBEdit3.text:='';
  fReporte.qReporteCODIGOADMINISTRATIVO.AsString:='';
  fReporte.Show;
  fReporte.ActualizarBarraEstado;
end;

procedure TfListaReportes.dbgReportesAsociadosGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if Field.FieldName='NOMBREESTADOREPORTE' then
  begin
     Background:=qListaReportesCOLOR.AsInteger;
  end;
  if BackGround = 0 then BackGround := clWhite;
end;

function TfListaReportes.TrafoPadreHijosIgualesSinAgrupar(CodReportePadre,CodReporteHijo: String): Boolean;
var
  qCompararReportes:tQuery;
begin
  result:=True;
  qCompararReportes:=TQuery.create(nil);
  qCompararReportes.DatabaseName:='BaseDato';
  qCompararReportes.sql.Add('select rp.codigoreporte as codigoreportepadre,rp.codigotrafodis as codigotrafopadre,rh.codigoreporte as codigoreportehijo,rh.codigotrafodis as codigotrafohijo');
  qCompararReportes.sql.Add('from reporte rp, reporte rh ');
  qCompararReportes.sql.Add('where rp.codigoreporte ='+CodReportePadre+' and rh.codigoreporte ='+CodReporteHijo);
  qCompararReportes.sql.Add('and rp.codigotrafodis<>rh.codigotrafodis');
  qCompararReportes.Open;
  if not qCompararReportes.eof then
    result:=False;
  qCompararReportes.Close;
  qCompararReportes.Free;
end;

procedure TfListaReportes.sbAsignarODTClick(Sender: TObject);
var
  ODT, GT, CodSedeOperativa : string;
  qDatos, qFechazona, qSedeOperativa: TQuery;
  i, Consecutivo: Integer;
  Repetir, Transaccion, bHacerRollBack: Boolean;
  ODTHija : TODTHija;
  NumeroODT : Double;
  lSLCias, lSLEstRep, lSLCodSedeOper: TStringList;
begin
  if dbgListaReportes.SelectedRows.Count > 0 then
  begin
    bHacerRollBack:=False;
    lSLCias := TStringList.Create;
    lSLEstRep := TStringList.Create;
    lSLCodSedeOper:= TStringList.Create;
    lSLCias.Sorted := True;
    lSLEstRep.Sorted := True;
    lSLCodSedeOper.Sorted := True;

    qSedeOperativa:= TQuery.Create(nil);
    qSedeOperativa.DatabaseName := 'BaseDato';
    qSedeOperativa.SQL.Clear;
    qSedeOperativa.SQL.Add('select c.codigosedeoperativa as sedeoperativa from apoyo a , c_grupoaol c, reporte r where c.codigogrupoaol=a.grupoaol ');
    qSedeOperativa.SQL.Add('and r.codigoapoyo=a.codigoapoyo and codigoreporte=:CODREPORTE ');
    qSedeOperativa.Close;

    for i:=0 to dbgListaReportes.SelectedRows.Count-1 do
    begin
      qListaReportes.BookMark:=dbgListaReportes.SelectedRows.Items[i];
      lSLCias.Add(qListaReportesCODIGOADMINISTRATIVO.AsString);
      lSLEstRep.Add(qListaReportesCODIGOESTADOREPORTE.AsString);

      qSedeOperativa.ParamByName('CODREPORTE').AsString:= qListaReportesCODIGOREPORTE.AsString;
      qSedeOperativa.Open;
      if not qSedeOperativa.IsEmpty then
      begin
        if qSedeOperativa.FieldByName('SEDEOPERATIVA').AsString = '' then
          lSLCodSedeOper.Add('SIN SEDE OPERATIVA')
        else
          lSLCodSedeOper.Add(qSedeOperativa.FieldByName('SEDEOPERATIVA').AsString);
      end;
      qSedeOperativa.Close;
    end;
    qSedeOperativa.Free;

    if not (lSLCias.Count = 1) then
    begin
      lSLCias.Free;
      lSLEstRep.Free;
      lSLCodSedeOper.Free;
      raise Exception.Create('Los Reportes seleccionados no pueden ser de CIAs diferentes.');
    end;

    if lSLEstRep.Count = 1 then
    begin
      if not (StrToInt(lSLEstRep[0]) = 1) then
      begin
        lSLCias.Free;
        lSLEstRep.Free;
        lSLCodSedeOper.Free;
        raise Exception.Create('El estado de todos los Reportes seleccionados debe ser PENDIENTE.');
      end;
    end
    else
    begin
      lSLCias.Free;
      lSLEstRep.Free;
      lSLCodSedeOper.Free;
      raise Exception.Create('El estado de todos los Reportes seleccionados debe ser PENDIENTE.');
    end;

    if lSLCodSedeOper.Count = 1 then
    begin
      if lSLCodSedeOper[0] = 'SIN SEDE OPERATIVA' then
      begin
        lSLCias.Free;
        lSLEstRep.Free;
        lSLCodSedeOper.Free;
        raise Exception.Create('Los Reportes seleccionados no tienen Sede Operativa.');
      end
      else
        CodSedeOperativa:= lSLCodSedeOper[0];
    end
    else
    begin
      lSLCias.Free;
      lSLEstRep.Free;
      lSLCodSedeOper.Free;
      raise Exception.Create('Los Reportes seleccionados no pueden ser de Sedes Operativas diferentes.');
    end;

    FAsignarODT:=TFAsignarODT.Create(Application);
    FAsignarODT.CodigoAdministrativo := qListaReportesCODIGOADMINISTRATIVO.AsFloat;
    FAsignarODT.SedeOperativa:= CodSedeOperativa;
    FAsignarODT.Caption:= 'Asignar Reportes seleccionados a ODT';
    FAsignarODT.lbGT.Visible:= True;
    FAsignarODT.dblcbGrupoTrabajo.Visible:= True;
    qFechazona := TQuery.Create(Application);
    qFechazona.DatabaseName := 'BaseDato';
    qFechazona.SQL.Add('select codigosecuencia from odtplantilla');
    qFechazona.SQL.Add('where codigoadministrativo='+qListaReportesCODIGOADMINISTRATIVO.AsString);
    qFechazona.Open;
    ODT := qFechazona.Fields[0].AsString;
    qFechazona.Free;
    NumeroODT := 0;
    try
      FAsignarODT.EdNumeroODT.Text:=ODT;
      if FAsignarODT.ShowModal = mrOk then
      begin
        ODT:=FAsignarODT.qOdtCODIGOODT.AsString;
        GT:=FAsignarODT.qGrupoTrabajoCODIGOGRUPOTRABAJO.AsString;
        if (ODT <> '') and (GT <> '') then
        begin
          if not qListaReportes.Database.InTransaction then
          begin
            qListaReportes.Database.StartTransaction;
            Transaccion := True;
          end;

          for i:=0 to dbgListaReportes.SelectedRows.Count-1 do
          begin
            qListaReportes.BookMark:=dbgListaReportes.SelectedRows.Items[i];
            qDatos := TQuery.Create(Application);
            qDatos.DatabaseName := 'BaseDato';
            qDatos.SQL.Add('SELECT CODIGOODT FROM ODTREPORTE');
            qDatos.SQL.Add('WHERE CODIGOREPORTE = ' + qListaReportesCODIGOREPORTE.AsString);
            qDatos.Open;
            if qDatos.RecordCount > 0 then
            begin
              MessageDlg('No es posible asignar el Reporte '+qListaReportesCODIGOREPORTE.AsString+' a la Orden de Trabajo # ' + ODT + Chr(13) +
              'ya que fué asignado a la Orden de Trabajo #  ' + qDatos.Fields[0].AsString,
              mtError,[mbOk],0);
              bHacerRollBack:= True;
              qDatos.Close;
              qDatos.Free;
              Break;
            end
            else
            begin
              NumeroODT := StrTofloat(ODT);
              if NumeroODT > 0 then
              begin
                ODTHija := TODTHija.Create(NumeroODT,qListaReportesCODIGOADMINISTRATIVO.AsInteger);
                ODTHija.CrearODTHija;
                ODTHija.AsignarGrupoTrabajo(StrToInt(GT));
                if qListaReportesCODIGOREPORTE.AsString <> '' then
                 ODTHija.AsignarReporte(qListaReportesCODIGOREPORTE.AsFloat);
                //ODTHija.AsignarDireccion(qReporte);
                ODTHija.InsertarInfraestructura(qListaReportesPINTADOAPOYO.AsString,qListaReportesCodigoClienteSGD.AsString,qListaReportesCODIGOAPOYO.AsString,qListaReportesCodigoClienteCOM.AsString);
                ODTHija.AsignarFechas(qListaReportesFECHAHORALLEGADA,qListaReportesFECHAHORAATENCION);
                ODTHija.Free;
                qDatos.Close;
                qDatos.SQL.Clear;
                qDatos.SQL.Add('UPDATE REPORTE SET FECHAHORADICTADO=SYSDATE, CODIGOESTADOREPORTE=2, CODIGOGRUPOTRABAJO='+GT);
                qDatos.SQL.Add('WHERE CODIGOREPORTE = ' + qListaReportesCODIGOREPORTE.AsString);
                qDatos.ExecSQL;
                qDatos.Close;
                qDatos.SQL.Clear;

                {qDatos.SQL.Add('UPDATE INFOCLIENTECOMERCIAL SET (CODIGOODT, CONSECUTIVO)= ');
                qDatos.SQL.Add('(SELECT CODIGOODT, CONSECUTIVO FROM ODTREPORTE WHERE CODIGOREPORTE = :CODIGOREPORTE)');
                qDatos.SQL.Add('WHERE CODIGOREPORTE = :CODIGOREPORTE');
                qDatos.ParamByName('CODIGOREPORTE').AsFloat:= qListaReportesCODIGOREPORTE.AsFloat;
                qDatos.ExecSQL;
                qDatos.Close; }

                qDatos.SQL.Add('UPDATE SIGCOM_GESTION SET (CODIGOODT, CONSECUTIVO,CODIGOADMINISTRATIVO,CODIGOGRUPOTRABAJO, DESCRIPCIONODT, NOMBREEMPLEADO )= ');
                qDatos.SQL.Add(' (SELECT ORE.CODIGOODT, ORE.CONSECUTIVO, O.CODIGOADMINISTRATIVO, OD.CODIGOGRUPOTRABAJO, O.MOTIVOS , E.NOMBREEMPLEADO ');
                qDatos.SQL.Add(' FROM ODTREPORTE ORE, ODT O, ODTDIA OD, EMPLEADO E WHERE CODIGOREPORTE = :CODIGOREPORTE ');
                qDatos.SQL.Add(' AND ORE.CODIGOODT = OD.CODIGOODT AND ORE.CONSECUTIVO = OD.CONSECUTIVO AND OD.CODIGOODT = O.CODIGOODT ');
                qDatos.SQL.Add(' AND O.CODIGOEJECUTOR = E.CODIGOEMPLEADO) ');
                qDatos.SQL.Add(' WHERE CODIGOREPORTE = :CODIGOREPORTE ');
                qDatos.ParamByName('CODIGOREPORTE').AsFloat:= qListaReportesCODIGOREPORTE.AsFloat;
                qDatos.ExecSQL;
                qDatos.Close;
              end;
            end;
            qDatos.Close;
            qDatos.Free;
          end;

          if Transaccion then
          begin
            if not bHacerRollBack then
            begin
              qListaReportes.Database.Commit;
              Application.MessageBox(PChar('Asignación realizada correctamente.'),'Asignar ODT',MB_OK+MB_ICONINFORMATION);
              SBOrdenarClick(nil);
            end
            else
              qListaReportes.Database.Rollback;
          end;
        end
        else
        begin
          raise Exception.Create('Debe seleccionar una Orden y Grupo de Trabajo.');
        end;
      end;
    finally
      FAsignarODT.Free;
    end;
  end
  else
  begin
    raise Exception.Create('Debe escoger uno o más reportes para asignarlos a una Orden de Trabajo.');
  end;
end;

end.
