unit UCronograma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBGrids,
  DBTables, DBCtrls, Grids, StdCtrls, Calendar, Buttons, ComCtrls, ExtCtrls, UAdministradorTareas,
  UIdTarea, Menus, ToolWin, ImgList, MPlayer, UBase;

const ancho=121;
const Mes: array[0..11] of String = ('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre');

type
  TFcronograma = class(TFBase)
    PanelLateral: TPanel;
    PanelBaseSuperior: TPanel;
    PanelCentral: TPanel;
    PanelSuperiorCentral: TPanel;
    PanelDomingo: TPanel;
    PanelLunes: TPanel;
    PanelMartes: TPanel;
    PanelMiercoles: TPanel;
    PanelJueves: TPanel;
    PanelViernes: TPanel;
    PanelSabado: TPanel;
    PanelInferiorCentral: TPanel;
    Panel1: TPanel;
    ListaImagenes: TImageList;
    PanelFiltros: TPanel;
    ContenedorFechas: TPanel;
    PFecha: TPanel;
    SBFechas: TSpeedButton;
    CFechas: TCheckBox;
    PanelFecha: TPanel;
    Calendario: TDateTimePicker;
    ContenedorTipoMant: TPanel;
    ContenedorElementos: TPanel;
    ContenedorLugar: TPanel;
    PTipoMant: TPanel;
    SBTipoMant: TSpeedButton;
    CTipoMant: TCheckBox;
    PanelTipoMant: TPanel;
    PElemento: TPanel;
    SBElementos: TSpeedButton;
    CElemento: TCheckBox;
    PanelElemento: TPanel;
    PLugar: TPanel;
    SBLugar: TSpeedButton;
    CAmbito: TCheckBox;
    PanelLugar: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    STipoMantenimiento: TDataSource;
    QTipoMantenimiento: TQuery;
    SSubestacion: TDataSource;
    QSubestacion: TQuery;
    SElemento: TDataSource;
    QElemento: TQuery;
    SAmbito: TDataSource;
    QAmbito: TQuery;
    SCircuito: TDataSource;
    QCircuito: TQuery;
    TipoMantenimiento: TDBLookupComboBox;
    Elemento: TDBLookupComboBox;
    Ambito: TDBLookupComboBox;
    Panel2: TPanel;
    Subestacion: TDBLookupComboBox;
    Panel3: TPanel;
    Circuito: TDBLookupComboBox;
    Image1: TImage;
    PanelSuperior: TPanel;
    LabelMes: TLabel;
    PanelMedio: TPanel;
    LabelConector: TLabel;
    LabelYear: TLabel;
    QAmbitoElemento: TQuery;
    SAmbitoElemento: TDataSource;
    qCaracteristicasElemento: TQuery;
    qTablaElemento: TQuery;
    codigo2: TListBox;
    codigo1: TListBox;
    Memo1: TMemo;
    Panel7: TPanel;
    cbElemento: TComboBox;
    TAlarma: TTimer;
    lAlarma: TLabel;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    Panel9: TPanel;
    Areas: TPageControl;
    Subprocesos: TTabSheet;
    qAreaOperacion: TQuery;
    qAreaOperacionCODIGOAREAOPERACIONODT: TFloatField;
    qAreaOperacionCODIGOTIPOTRABAJOODT: TFloatField;
    qAreaOperacionNOMBREAREAOPERACIONODT: TStringField;
    qAreaOperacionCODIGOADMINISTRATIVO: TFloatField;
    qAreaOperacionCOLOR: TStringField;
    dsAreaOperacion: TDataSource;
    updAreaOperacion: TUpdateSQL;
    ToolButton10: TToolButton;
    pContenedorCoordinacion: TPanel;
    PanelCoordinacion: TPanel;
    SpeedButton1: TSpeedButton;
    cCoordinacion: TCheckBox;
    PCoordinacion: TPanel;
    Coordinacion: TDBLookupComboBox;
    qCoordinacion: TQuery;
    dsCoordinacion: TDataSource;
    procedure CalendarioChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure CFechasClick(Sender: TObject);
    procedure CElementoClick(Sender: TObject);
    procedure CTipoMantClick(Sender: TObject);
    procedure CAmbitoClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure TipoMantenimientoClick(Sender: TObject);
    procedure SubestacionClick(Sender: TObject);
    procedure ElementoClick(Sender: TObject);
    procedure AmbitoClick(Sender: TObject);
    procedure CircuitoClick(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure cbElementoChange(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure TAlarmaTimer(Sender: TObject);
    procedure lAlarmaClick(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ToolButton9Click(Sender: TObject);
    procedure AreasOperacion;
    procedure qAreaOperacionAfterDelete(DataSet: TDataSet);
    procedure qAreaOperacionAfterPost(DataSet: TDataSet);
    procedure ToolButton10Click(Sender: TObject);
    procedure CoordinacionClick(Sender: TObject);
    procedure cCoordinacionClick(Sender: TObject);

  private
    { Private declarations }
  public
    FechaCalendario1,FechaFormAlarma: TDate;
    PanelInterno,PanelActividades:Tpanel;
    ScrollInterno:TScrollbar;
    Lista:PunteroLista;
    ListaEstructura,ListaParametros:TList;
    GrillaHoras:TStringGrid;
    sql_cronograma,Consulta_calendario,sql_refrescado,Consulta_refrescado,fecha_reporte:String;
    parametros:TParametros;
    sqltablaelemento,sAlarma: string;
    totalsuma,NDiasReporte,LDiaReporte:integer;
    Bisiesto:Integer; //Bisiesto: Se utiliza en los procedimientos "YearBisiesto" y "CreacionDias". Guarda valores de 1 o 0 para conocer que año fue, es o será bisiesto.
    DiaInic:Word;     //DiaInic: Se utiliza en el procedimiento "FormCreate" para decodificar la fecha que proporciona el reloj del equipo.
    MesInic,Mes_visualizado,Year_visualizado,Dia_visualizado:Word;     //MesInic: Se utiliza en los procedimientos "FormCreate", "CalendarioChange" y "CreacionDias" para decodificar la fecha y generar cambios en el calendario principal.
    AgnoInic:Word;    //AgnoInic: Se utiliza en los procedimientos "FormCreate", "CalendarioChange" y "CreacionDias" para decodificar la fecha y generar cambios en el calendario principal.
    AdminTareas:TAdministradorTareas;
    GenerarPanelActividad,gpa:TIdTarea;
    Dia,MesTarea,Year:word;
    function CalcDias(mes,year: Integer): Integer;
    procedure Consulta();

    procedure Alarma(FechaAlarma:string);
    procedure DefinirConsulta(suma:Integer);
    procedure GeneracionDias(PanelCalendario:TPanel; Columna,Fila,NumDia,AlturaPanel:Integer; Mes_Agno:String);
    procedure DesplazarScroll(Sender: TObject);
    procedure YearBisiesto(YearBis:Word);
    procedure Liberar();
    procedure CreacionDias();
    procedure PunteroDia;
    { Public declarations }
  end;

var
   Fcronograma: TFcronograma;

implementation

uses UTarea, UMantenimiento, UAdminBancoM, uQRProgramacionMantenimiento,
  uQRCalendarioMantenimiento, uMttosPendientes, uMantenimientoODT,
  uAlarmaMantenimiento,// uMaestroSubPruebas, uMaestroMantenimiento,
  uModificarMantenimiento,
  uQRCalendarioObservaciones, UMantenimientoAnterior,
  uMantenimientosPendientes;
{$R *.DFM}
//******************************************************************************
procedure TFcronograma.FormCreate(Sender: TObject);
var
   FechaCalendario:TDate;
   i:Integer;
begin
  if QAmbito.Active then
    Qambito.Close;
  QAmbito.Open;

  if QTipoMantenimiento.Active then
    QTipoMantenimiento.Close;
  QTipoMantenimiento.Open;

  if QElemento.Active then
    QElemento.Close;
  QElemento.Open;

  qAreaOperacion.Open;
  AreasOperacion;
                     
  qCoordinacion.Open;

  Edit1.Visible:= False;
  Edit2.Visible:= False;

  for i:= 0 to 2 do
    parametros[i]:= IntToStr(0);

  totalsuma:= 0;
  Liberar;
  FechaCalendario1:= Now;
  FechaFormAlarma:=now;
  Calendario.Date:=Now;
  FechaCalendario:=Calendario.Date;
  Decodedate(FechaCalendario,AgnoInic,MesInic,DiaInic);
  LabelYear.Caption:= InttoStr(AgnoInic);
  LabelMes.Caption:= Mes[MesInic-1];
  AdminTareas:=TAdministradorTareas.CrearAdministrador();
  CreacionDias;
  cbElemento.Clear;
end;
//******************************************************************************
//YearBisiesto: Obtención de los años bisiestos desde 1980.
procedure TFcronograma.YearBisiesto(YearBis:Word);
var
  Cont_Year:Integer;
begin
  Cont_Year:=YearBis;
  while Cont_Year>1980 do
    Cont_Year:=Cont_Year-4;
  if Cont_Year=1980 then
  begin
    Bisiesto:=1;
  end
  else
    Bisiesto:=0;
end;

procedure TFCronograma.Alarma(FechaAlarma:String);
var qry:Tquery;
    sqldatos:string;
begin
  sqldatos:= ' select count(codigotarea) as numero from pm_tarea where to_char(fechaalarma,''ddmmyyyy'') =:fechaalarma and codigoestadotarea = 4 ';
  qry:= Tquery.Create(application);
  qry.DatabaseName:='BaseDato';
  qry.SQL.Append(sqldatos);
  qry.ParamByName('FECHAALARMA').asstring:= FechaAlarma;
  qry.Open;
  if qry.FieldByName('NUMERO').asinteger > 0 then
  begin
    if lAlarma.Visible = false then
      lAlarma.Visible:= true;
    if lAlarma.ShowHint = false then
      lAlarma.ShowHint:= true;
    if TAlarma.Enabled = false then
      TAlarma.Enabled:= true;
  end;
end;

procedure TFCronograma.Consulta;
begin
end;

procedure TFcronograma.DefinirConsulta(suma:integer);
var qry1: TQuery;
begin
  sql_cronograma:='';
  sql_refrescado:='';
  case suma of
    0: begin
         sql_cronograma:= ' SELECT CODIGOTAREA FROM PM_TAREA WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' ORDER BY FECHAINICIAL ';
         sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA, BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''
                          +Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                          ' ORDER BY HORA ';
       end;
    //**
    20: begin
          sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M, PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                           ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' ORDER BY FECHAINICIAL ';

          sql_refrescado:= ' SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                           ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                           ' ORDER BY HORA ';
        end;
    21: begin
          sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M, PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                           ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' '+
                           ' AND M.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+'''  '+
                           ' ORDER BY FECHAINICIAL ';

          sql_refrescado:= ' SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                           ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                           ' AND M.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+'''  '+
                           ' ORDER BY HORA ';
        end;
    25: begin
          sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                           ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                           ' AND BM.CODIGOAMBITO = '''+VarToStr(Ambito.KeyValue)+''' ORDER BY FECHAINICIAL ';

          sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                           ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                           ' BM.CODIGOAMBITO = '''+vartostr(Ambito.keyvalue)+''' ORDER BY HORA ';
        end;
    26: begin
          sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                           ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                           ' AND M.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+'''  '+
                           ' AND BM.CODIGOAMBITO = '''+VarToStr(Ambito.KeyValue)+''' ORDER BY FECHAINICIAL ';

          sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                           ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                           ' AND M.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+''' '+
                           ' BM.CODIGOAMBITO = '''+vartostr(Ambito.keyvalue)+''' ORDER BY HORA ';
        end;
    60: begin
          sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                           ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                           ' AND M.CODIGOSUBESTACION= '''+VarToStr(Subestacion.KeyValue)+''' '+
                           ' ORDER BY FECHAINICIAL ';

          sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                           ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                           ' AND M.CODIGOSUBESTACION= '''+VarToStr(Subestacion.KeyValue)+''' ORDER BY HORA ';
        end;

    65: begin
          sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                           ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                           ' AND M.CODIGOSUBESTACION= '''+VarToStr(Subestacion.KeyValue)+''' '+
                           ' AND BM.CODIGOAMBITO = '''+VarToStr(Ambito.KeyValue)+''' ORDER BY FECHAINICIAL ';

          sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                           ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                           ' AND M.CODIGOSUBESTACION= '''+VarToStr(Subestacion.KeyValue)+''' '+
                           ' BM.CODIGOAMBITO = '''+vartostr(Ambito.keyvalue)+''' ORDER BY HORA ';
        end;
    61: begin  //era 66
          sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                           ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                           ' AND M.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+'''  '+
                           ' AND M.CODIGOSUBESTACION= '''+VarToStr(Subestacion.KeyValue)+''' '+
                           ' AND BM.CODIGOAMBITO = '''+VarToStr(Ambito.KeyValue)+''' ORDER BY FECHAINICIAL ';

          sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                           ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                           ' AND M.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+''' '+
                           ' AND M.CODIGOSUBESTACION= '''+VarToStr(Subestacion.KeyValue)+''' '+
                           ' BM.CODIGOAMBITO = '''+vartostr(Ambito.keyvalue)+''' ORDER BY HORA ';
        end;
    71: begin  //era 76
          sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                           ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                           ' AND M.CODIGOSUBESTACION= '''+VarToStr(Subestacion.KeyValue)+''' '+
                           ' AND M.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+''' '+
                           ' AND BM.CODIGOAMBITO = '''+VarToStr(Ambito.KeyValue)+''' ORDER BY FECHAINICIAL ';

          sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                           ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                           ' AND M.CODIGOSUBESTACION= '''+VarToStr(Subestacion.KeyValue)+''' '+
                           ' AND M.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+''' '+
                           ' BM.CODIGOAMBITO = '''+vartostr(Ambito.keyvalue)+''' ORDER BY HORA ';
        end;
    75: begin
          if cbElemento.Text <> '' then
          begin
            qry1:= TQuery.Create(application);
            qry1.DatabaseName:= 'BaseDato';
            qry1.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
            qry1.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
            qry1.Open;
            if qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1 then
            begin
              sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                               ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' '+
                               ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                               ' BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.KeyValue)+''' AND '+
                               ' BM.CODIGOAMBITO = '''+vartostr(Ambito.keyvalue)+''' '+
                               ' EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' ORDER BY FECHAINICIAL ';

              sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND '+
                               ' T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.keyvalue)+''' AND '+
                               ' BM.CODIGOAMBITO = '''+vartostr(Ambito.keyvalue)+''' '+
                               ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' '+
                               ' EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+'''  AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
            end
            else
            begin
              if qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2 then
              begin
                sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                                 ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.keyvalue)+'''  AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                                 ' BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO '+
                                 ' BM.CODIGOAMBITO = '''+vartostr(Ambito.keyvalue)+''' '+
                                 ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' '+
                                 ' AND EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' AND EM.CLELEMENTO2 = '''+codigo2.Items[cbElemento.itemindex]+'''   ORDER BY FECHAINICIAL ';

                sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND '+
                                 ' T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND '+
                                 ' M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.keyvalue)+''' AND EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' AND EM.CLELEMENTO2 = '''+codigo2.Items[cbElemento.itemindex]+''' AND '+
                                 ' BM.CODIGOAMBITO = '''+vartostr(Ambito.keyvalue)+''' '+
                                 ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' '+
                                 ' M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
              end;
            end;
          end
          else
          begin
               //showmessage('consulta sin elemento');
            sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                             ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND '+
                             ' BM.CODIGOAMBITO = '''+vartostr(Ambito.keyvalue)+''' '+
                             ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' '+
                             ' M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.keyvalue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY FECHAINICIAL ';

            sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND '+
                             ' T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.keyvalue)+''' AND '+
                             ' BM.CODIGOAMBITO = '''+vartostr(Ambito.keyvalue)+''' '+
                             ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' '+
                             ' M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
          end;
        end;
    35: begin
          sql_cronograma:= ' SELECT CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                           ' BM.CODIGOAMBITO = '''+vartostr(Ambito.keyvalue)+''' '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' '+
                           ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY FECHAINICIAL ';

          sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                           ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                           ' BM.CODIGOAMBITO = '''+vartostr(Ambito.keyvalue)+''' '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' '+
                           ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
        end;
    30: begin
          sql_cronograma:= ' SELECT CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' '+
                           ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY FECHAINICIAL ';

          sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                           ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                           ' AND BM.CODIGOAREAOPERACIONODT= '''+VarToStr(Coordinacion.KeyValue)+''' '+
                           ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
        end;
    //**f
    1: begin
         sql_cronograma:= ' SELECT CODIGOTAREA FROM PM_TAREA,PM_MANTENIMIENTO WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND PM_TAREA.CODIGOTAREA = PM_MANTENIMIENTO.CODIGOMANTENIMIENTO ' +
                          ' AND PM_MANTENIMIENTO.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+''' ORDER BY FECHAINICIAL ';

         sql_refrescado:= ' SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                          ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                          ' AND M.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                          ' ORDER BY HORA ';
       end;
    6: begin
         sql_cronograma:= ' SELECT CODIGOTAREA FROM PM_TAREA,PM_MANTENIMIENTO,PM_BANCOMANTENIMIENTO WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND PM_TAREA.CODIGOTAREA = PM_MANTENIMIENTO.CODIGOMANTENIMIENTO ' +
                          ' AND PM_MANTENIMIENTO.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+''' AND PM_MANTENIMIENTO.CODIGOBANCOMANTENIMIENTO = PM_BANCOMANTENIMIENTO.CODIGOBANCOMANTENIMIENTO AND PM_BANCOMANTENIMIENTO.CODIGOAMBITO = '''+VarToStr(Ambito.KeyValue)+''' ORDER BY FECHAINICIAL ';

         sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                          ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                          ' AND M.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                          ' BM.CODIGOAMBITO = '''+vartostr(Ambito.keyvalue)+''' ORDER BY HORA ';
       end;
    16: begin
          sql_cronograma:= ' SELECT CODIGOTAREA FROM PM_TAREA,PM_MANTENIMIENTO,PM_BANCOMANTENIMIENTO WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND PM_TAREA.CODIGOTAREA = PM_MANTENIMIENTO.CODIGOMANTENIMIENTO ' +
                           ' AND PM_MANTENIMIENTO.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+''' AND'+
                           ' PM_MANTENIMIENTO.CODIGOBANCOMANTENIMIENTO = PM_BANCOMANTENIMIENTO.CODIGOBANCOMANTENIMIENTO AND '+
                           ' PM_BANCOMANTENIMIENTO.CODIGOAMBITO = '''+VarToStr(Ambito.KeyValue)+''' AND PM_BANCOMANTENIMIENTO.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY FECHAINICIAL ';

          sql_refrescado:=  ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                            ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                            ' AND M.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                            ' AND BM.CODIGOELEMENTO = '''+vartostr(Elemento.keyvalue)+''' AND BM.CODIGOAMBITO = '''+VarToStr(Ambito.KeyValue)+''' ORDER BY HORA ';
        end;
    5: begin
         sql_cronograma:= ' SELECT CODIGOTAREA FROM PM_TAREA,PM_MANTENIMIENTO,PM_BANCOMANTENIMIENTO WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND PM_TAREA.CODIGOTAREA = PM_MANTENIMIENTO.CODIGOMANTENIMIENTO ' +
                          ' AND PM_MANTENIMIENTO.CODIGOBANCOMANTENIMIENTO = PM_BANCOMANTENIMIENTO.CODIGOBANCOMANTENIMIENTO AND PM_BANCOMANTENIMIENTO.CODIGOAMBITO= '''+VarToStr(Ambito.KeyValue)+''' ORDER BY FECHAINICIAL ';

         sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                          ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                          ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOAMBITO='''+VarToStr(Ambito.KeyValue)+''' ORDER BY HORA ';
       end;
    15: begin
          sql_cronograma:= ' SELECT CODIGOTAREA FROM PM_TAREA,PM_MANTENIMIENTO,PM_BANCOMANTENIMIENTO WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND PM_TAREA.CODIGOTAREA = PM_MANTENIMIENTO.CODIGOMANTENIMIENTO ' +
                           ' AND PM_MANTENIMIENTO.CODIGOBANCOMANTENIMIENTO = PM_BANCOMANTENIMIENTO.CODIGOBANCOMANTENIMIENTO AND PM_BANCOMANTENIMIENTO.CODIGOAMBITO = '''+VarToStr(Ambito.KeyValue)+''' AND PM_BANCOMANTENIMIENTO.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY FECHAINICIAL ';

          sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,AM.CODIGOODTOPERA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                           ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                           ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOAMBITO='''+VarToStr(Ambito.KeyValue)+''' AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
        end;
    11: begin
          sql_cronograma:= ' SELECT CODIGOTAREA FROM PM_TAREA,PM_MANTENIMIENTO,PM_BANCOMANTENIMIENTO WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND PM_TAREA.CODIGOTAREA = PM_MANTENIMIENTO.CODIGOMANTENIMIENTO ' +
                           ' AND PM_MANTENIMIENTO.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+''' AND PM_MANTENIMIENTO.CODIGOBANCOMANTENIMIENTO = PM_BANCOMANTENIMIENTO.CODIGOBANCOMANTENIMIENTO AND PM_BANCOMANTENIMIENTO.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY FECHAINICIAL ';

          sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                           ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOTIPOMANT='''+VarToStr(TipoMantenimiento.KeyValue)+''' AND '+
                           ' M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
        end;
    10: begin
          sql_cronograma:= ' SELECT CODIGOTAREA FROM PM_TAREA,PM_MANTENIMIENTO,PM_BANCOMANTENIMIENTO WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND PM_TAREA.CODIGOTAREA = PM_MANTENIMIENTO.CODIGOMANTENIMIENTO ' +
                           ' AND PM_MANTENIMIENTO.CODIGOBANCOMANTENIMIENTO = PM_BANCOMANTENIMIENTO.CODIGOBANCOMANTENIMIENTO AND PM_BANCOMANTENIMIENTO.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY FECHAINICIAL ';

          sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                           ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
        end;
    120: begin
           sql_cronograma:= ' SELECT CODIGOTAREA FROM PM_TAREA,PM_MANTENIMIENTO WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND PM_TAREA.CODIGOTAREA = PM_MANTENIMIENTO.CODIGOMANTENIMIENTO ' +
                            ' AND PM_MANTENIMIENTO.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND PM_MANTENIMIENTO.CODIGOCIRCUITO = '''+VarToStr(Circuito.KeyValue)+''' ORDER BY FECHAINICIAL ';

           sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                            ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND '+
                            ' M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOCIRCUITO = '''+VarToStr(Circuito.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO ORDER BY HORA ';
         end;
    130: begin
           if cbElemento.Text <> '' then
            begin
              cbElemento.ItemIndex;
              qry1:= TQuery.Create(application);
              qry1.DatabaseName:= 'BaseDato';
              qry1.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
              qry1.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
              qry1.Open;
              if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) then
              begin
                sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                                 ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOCIRCUITO = '''+VarToStr(Circuito.KeyValue)+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND '+
                                 ' EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                 ' AND BM.CODIGOELEMENTO= '''+VarToStr(Elemento.KeyValue)+''' ORDER BY FECHAINICIAL ';

                sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND '+
                                 ' T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOCIRCUITO = '''+vartostr(Circuito.keyvalue)+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND '+
                                 ' EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
              end
              else
              begin
                if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) then
                begin
                  sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                                   ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOCIRCUITO = '''+VarToStr(Circuito.KeyValue)+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND '+
                                   ' EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' AND EM.CLELEMENTO1 = '''+codigo2.Items[cbElemento.itemindex]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                   ' AND BM.CODIGOELEMENTO= '''+VarToStr(Elemento.KeyValue)+''' ORDER BY FECHAINICIAL ';

                  sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND '+
                                   ' T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOCIRCUITO = '''+vartostr(Circuito.keyvalue)+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND '+
                                   ' EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' AND EM.CLELEMENTO2 = '''+codigo2.Items[cbElemento.itemindex]+'''  AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
                end;
              end;
            end
            else
            begin
                 // showmessage('consulta sin elemento 130');
              sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                               ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOCIRCUITO = '''+VarToStr(Circuito.KeyValue)+''' AND '+
                               ' M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                               ' AND BM.CODIGOELEMENTO= '''+VarToStr(Elemento.KeyValue)+''' ORDER BY FECHAINICIAL ';

              sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                               ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOCIRCUITO = '''+vartostr(Circuito.keyvalue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
            end;
         end;
    121: begin
           sql_cronograma:= ' SELECT CODIGOTAREA FROM PM_TAREA,PM_MANTENIMIENTO WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND PM_TAREA.CODIGOTAREA = PM_MANTENIMIENTO.CODIGOMANTENIMIENTO ' +
                            ' AND PM_MANTENIMIENTO.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+''' AND PM_MANTENIMIENTO.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND '+
                            ' PM_MANTENIMIENTO.CODIGOCIRCUITO = '''+VarToStr(Circuito.KeyValue)+''' ORDER BY FECHAINICIAL ';

           sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                            ' AND M.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+''' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND PM_MANTENIMIENTO.CODIGOCIRCUITO = '''+VarToStr(Circuito.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO ORDER BY HORA ';

         end;
    131: begin
           if cbElemento.Text <> '' then
            begin
              cbElemento.ItemIndex;
              qry1:= TQuery.Create(application);
              qry1.DatabaseName:= 'BaseDato';
              qry1.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
              qry1.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
              qry1.Open;
              if qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1 then
              begin
                sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                                 ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOCIRCUITO = '''+VarToStr(Circuito.KeyValue)+''' AND M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.keyvalue)+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO '+
                                 ' AND EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                 ' AND BM.CODIGOELEMENTO= '''+VarToStr(Elemento.KeyValue)+''' ORDER BY FECHAINICIAL ';

                sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND '+
                                 ' T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOCIRCUITO = '''+vartostr(Circuito.keyvalue)+''' AND M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.keyvalue)+''' AND '+
                                 ' M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' AND '+
                                 ' M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
              end
              else
              begin
                if qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2 then
                begin
                  sql_cronograma:=  ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                                    ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOCIRCUITO = '''+VarToStr(Circuito.KeyValue)+''' AND M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.keyvalue)+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND '+
                                    ' EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' AND EM.CLELEMENTO1 = '''+codigo2.Items[cbElemento.itemindex]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                    ' AND BM.CODIGOELEMENTO= '''+VarToStr(Elemento.KeyValue)+''' ORDER BY FECHAINICIAL ';

                  sql_refrescado:=  ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND '+
                                    ' T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOCIRCUITO = '''+vartostr(Circuito.keyvalue)+''' AND M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.keyvalue)+''' AND '+
                                    ' M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' AND EM.CLELEMENTO2 = '''+codigo2.Items[cbElemento.itemindex]+''' AND '+
                                    ' M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
                end;
              end;
            end
            else
            begin
                       // showmessage('consulta sin elemento 131');
              sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                               ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOCIRCUITO = '''+VarToStr(Circuito.KeyValue)+''' AND M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.keyvalue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                               ' AND BM.CODIGOELEMENTO= '''+VarToStr(Elemento.KeyValue)+''' ORDER BY FECHAINICIAL ';

              sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                               ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOCIRCUITO = '''+vartostr(Circuito.keyvalue)+''' AND M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.KeyValue)+''' AND '+
                               ' M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
            end;
         end;
    40: begin
          sql_cronograma:= ' SELECT CODIGOTAREA FROM PM_TAREA,PM_MANTENIMIENTO WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND PM_TAREA.CODIGOTAREA = PM_MANTENIMIENTO.CODIGOMANTENIMIENTO ' +
                           ' AND PM_MANTENIMIENTO.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' ORDER BY FECHAINICIAL ';

          sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                           ' WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND '+
                           ' M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO ORDER BY HORA ';
        end;
    50: begin
          if (cbElemento.Text <> '') then
          begin
            cbElemento.ItemIndex;
            qry1:= TQuery.Create(application);
            qry1.DatabaseName:= 'BaseDato';
            qry1.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
            qry1.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
            qry1.Open;
            if qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1 then
            begin
              sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                               ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO '+
                               ' AND EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' ORDER BY FECHAINICIAL ';

              sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                               ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
            end
            else
            begin
              if qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2 then
              begin
                sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                                 ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO '+
                                 ' AND EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' AND EM.CLELEMENTO2 = '''+codigo2.Items[cbElemento.itemindex]+'''   ORDER BY FECHAINICIAL ';

                sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                                 ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' AND EM.CLELEMENTO2 = '''+codigo2.Items[cbElemento.itemindex]+''' AND '+
                                 ' M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
              end;
            end;
          end
          else
          begin
                    //showmessage('consulta sin elemento 50');
            sql_cronograma:= ' SELECT CODIGOTAREA FROM PM_TAREA,PM_MANTENIMIENTO,PM_BANCOMANTENIMIENTO WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND PM_TAREA.CODIGOTAREA = PM_MANTENIMIENTO.CODIGOMANTENIMIENTO ' +
                             ' AND PM_MANTENIMIENTO.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND PM_MANTENIMIENTO.CODIGOBANCOMANTENIMIENTO = PM_BANCOMANTENIMIENTO.CODIGOBANCOMANTENIMIENTO AND PM_BANCOMANTENIMIENTO.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY FECHAINICIAL ';

            sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                             ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
          end;
        end;
    41: begin
          sql_cronograma:= ' SELECT CODIGOTAREA FROM PM_TAREA,PM_MANTENIMIENTO WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND PM_TAREA.CODIGOTAREA = PM_MANTENIMIENTO.CODIGOMANTENIMIENTO ' +
                           ' AND PM_MANTENIMIENTO.CODIGOTIPOMANT = '''+VarToStr(TipoMantenimiento.KeyValue)+''' AND PM_MANTENIMIENTO.CODIGOSUBESTACION= '''+VarToStr(Subestacion.KeyValue)+''' ORDER BY FECHAINICIAL ';

          sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO '+
                           ' AND M.CODIGOTIPOMANT= '''+VarToStr(TipoMantenimiento.KeyValue)+''' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+'''AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO ORDER BY HORA ';
        end;
    51: begin
          if cbElemento.Text <> '' then
          begin
            qry1:= TQuery.Create(application);
            qry1.DatabaseName:= 'BaseDato';
            qry1.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
            qry1.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
            qry1.Open;
            if qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1 then
            begin
              sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                               ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                               ' BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.KeyValue)+''' AND '+
                               ' EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' ORDER BY FECHAINICIAL ';

              sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND '+
                               ' T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.keyvalue)+''' AND '+
                               ' EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+'''  AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
            end
            else
            begin
              if qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2 then
              begin
                sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                                 ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.keyvalue)+'''  AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                                 ' BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO '+
                                 ' AND EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' AND EM.CLELEMENTO2 = '''+codigo2.Items[cbElemento.itemindex]+'''   ORDER BY FECHAINICIAL ';

                sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND '+
                                 ' T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND '+
                                 ' M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.keyvalue)+''' AND EM.CLELEMENTO1 = '''+codigo1.Items[cbElemento.itemindex]+''' AND EM.CLELEMENTO2 = '''+codigo2.Items[cbElemento.itemindex]+''' AND '+
                                 ' M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
              end;
            end;
          end
          else
          begin
                     // showmessage('consulta sin elemento 51');
            sql_cronograma:= ' SELECT T.CODIGOTAREA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_calendario+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                             ' AND M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND '+
                             ' M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.keyvalue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY FECHAINICIAL ';

            sql_refrescado:= ' SELECT T.CODIGOTAREA,T.NOMBRETAREA,T.CODIGODESC,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta_refrescado+''' AND '+
                             ' T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOTIPOMANT = '''+vartostr(TipoMantenimiento.keyvalue)+''' AND '+
                             ' M.CODIGOSUBESTACION = '''+VarToStr(Subestacion.KeyValue)+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+VarToStr(Elemento.KeyValue)+''' ORDER BY HORA ';
          end;
        end;
  end;

end;

function TFcronograma.CalcDias(mes,year: Integer): Integer;
const DiasMes: array[0..11] of Integer = (31,28,31,30,31,30,31,31,30,31,30,31);
begin
  if mes <> 2 then
    Result:= DiasMes[mes-1]
  else
  begin
    if (abs(year-2000))mod 4 = 0 then
      Result:= 29
    else
      Result:= DiasMes[1];
  end;
end;

//******************************************************************************
//GeneracionDias: Generación de días en el calendario principal.
procedure TFcronograma.GeneracionDias(PanelCalendario: TPanel; Columna,
  Fila, NumDia, AlturaPanel:Integer; Mes_Agno:String);
var
   qry:Tquery;
   sql,NumDias,Consulta:String;
   DiaTemp,Contador,AltoPanelActividad,x,y,i:Integer;
   NumeroDia:TPanel;
begin
     x:=0;
     y:=0;
     if NumDia<=9 then
      NumDias:='0'+inttostr(NumDia)
     else
      NumDias:=inttostr(NumDia);
     Contador:=0;
     PanelInterno:=Tpanel.Create(PanelCalendario);
     PanelInterno.BorderStyle:=BsSingle;
     PanelInterno.BevelOuter:=BvNone;
     PanelInterno.Caption:='';
     PanelInterno.Color:=ClWhite;
     PanelInterno.Ctl3D:=False;
     PanelInterno.Left:=(Columna*(Ancho));
     PanelInterno.Top:=(Fila*(AlturaPanel-2)-1);
     PanelInterno.Width:=Ancho+1;
     PanelInterno.Height:=AlturaPanel-1;
     PanelCalendario.InsertControl(PanelInterno);

     consulta:=NumDias+Mes_Agno;
     Consulta_calendario:= consulta;
     DefinirConsulta(totalsuma);
     AltoPanelActividad:=0;
     Qry:=TQuery.Create(Application);
     Qry.DatabaseName:='BaseDato';
     Qry.Sql.Clear;
     Sql:='SELECT CODIGOTAREA FROM PM_TAREA WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta+''' ORDER BY FECHAINICIAL ';
     Qry.Sql.Add(sql_cronograma);
     Qry.Open;
     for i:=1 to qry.RecordCount do
      Begin
       AltoPanelActividad:=AltoPanelActividad+1;
       Qry.Next;
      end;
     Qry.Close;

     PanelActividades:=TPanel.Create(PanelInterno);
     PanelActividades.BorderStyle:=Bsnone;
     PanelActividades.BevelOuter:=BvNone;
     PanelActividades.Caption:='';
     PanelActividades.Color:=ClWhite;
     PanelActividades.Ctl3D:=False;
     PanelActividades.Left:=0;
     PanelActividades.Top:=16;
     if AltoPanelActividad > 5 then
        PanelActividades.Width:=104
     else
         PanelActividades.Width:=120;
     PanelInterno.InsertControl(PanelActividades);
     PanelActividades.Height:=(AltoPanelActividad*16);
     if AltoPanelActividad>5 then
     begin
       ScrollInterno:=TScrollBar.Create(PanelInterno);
       ScrollInterno.Kind:=sbVertical;
       ScrollInterno.Align:=alRight;
       ScrollInterno.Ctl3D:=False;
       ScrollInterno.Max:=AltoPanelActividad+2;
       ScrollInterno.Min:=-16;
       ScrollInterno.Position:=-16;
       ScrollInterno.SmallChange:=16;
       ScrollInterno.Width:=12;
       PanelInterno.InsertControl(ScrollInterno);
       ScrollInterno.Parent:=PanelInterno;
       ScrollInterno.OnChange:=DesplazarScroll;
     end;
     New(Lista);
     Lista^.Dia:=NumDia;
     Lista^.Panel:=PanelActividades;
     ListaEstructura.Add(Lista);
     NumeroDia:=Tpanel.Create(PanelInterno);
     NumeroDia.Font.Size:=7;
     NumeroDia.Font.Name:='Ms Reference Sans Serif';
     NumeroDia.Font.Color:=ClBlack;
     NumeroDia.BevelOuter:=BvNone;
     NumeroDia.BevelInner:=BvNone;
     NumeroDia.Caption:=IntToStr(NumDia);
     NumeroDia.Color:=$00AAAAAA;
     NumeroDia.Ctl3D:=False;
     NumeroDia.Align:=AlTop;
     NumeroDia.Height:=16;
     PanelInterno.InsertControl(NumeroDia);
end;
//******************************************************************************
//CalendarioChange: Actualiza el calendario principal a un mes y/o año especifico.
procedure TFcronograma.CalendarioChange(Sender: TObject);
var
  DiaCalendario,MesCalendario,AgnoCalendario:Word;
  Fecha:Tdate;
begin
  FCronograma.Refresh;
  Fecha:=Calendario.Date;
  Decodedate(Fecha,AgnoCalendario,MesCalendario,DiaCalendario);
  if ((MesInic<>MesCalendario) or (AgnoInic<>AgnoCalendario)) then
  begin
    totalsuma:= 0;
    LabelYear.Caption:= InttoStr(AgnoCalendario);
    LabelMes.Caption:= Mes[MesCalendario-1];
    // if ((Subestacion.Visible) and (Subestacion.Text <> '')) and ((Circuito.Visible) and (Circuito.Text <>'')) then
    if (Circuito.Visible) and (Circuito.Text <>'') then
    begin
      totalsuma:= totalsuma + 120;
      parametros[4]:= VarToStr(Subestacion.KeyValue);
      parametros[5]:= VarToStr(Circuito.KeyValue);
    end
    else
    begin
      if (Subestacion.Visible) and (Subestacion.Text <> '') then
      begin
        totalsuma:= totalsuma + 40;
        parametros[4]:= VarToStr(Subestacion.KeyValue);
      end
      else
      begin
        if (CAmbito.Checked) and (Ambito.Text<>'') then
        begin
          totalsuma:= totalsuma + 5;
          parametros[2]:= VarToStr(Ambito.KeyValue);
        end;
      end;
    end;
    if (CElemento.Checked) and (Elemento.Text <> '') then
    begin
      totalsuma:= totalsuma + 10;
      parametros[3]:= VarToStr(Elemento.KeyValue);
    end;
    if (CTipoMant.Checked) and (TipoMantenimiento.Text <> '') then
    begin
      totalsuma:= totalsuma + 1;
      parametros[1]:= VarToStr(TipoMantenimiento.KeyValue);
    end;
    if (cCoordinacion.Checked) and (Coordinacion.Text <> '') then
    begin
      totalsuma:= totalsuma + 20;
      parametros[6]:= VarToStr(Coordinacion.KeyValue);
    end;
    parametros[0]:= IntToStr(totalsuma);
    Liberar;
    CreacionDias;
  end;
end;
//******************************************************************************
//Liberar: Liberación de memoria para realizar cambios en el calendario principal.
procedure TFcronograma.Liberar;
var
   x:Integer;
begin
     for x:=0 to PanelInferiorCentral.ControlCount-1 do
     begin
          (PanelInferiorCentral.Controls[0] as TPanel).Controls[0].Free;
           PanelInferiorCentral.Controls[0].Free;
     end;
end;
//******************************************************************************
//CreacionDias: Generación por meses de los días correspondientes a ese mes y en un año determinado.
procedure TFCronograma.CreacionDias;
var
   Hoy:TDate;
   NumeroDay,DiaSemana,NumeroFila,Dia,PrimerDia,AltoPanel,MonthAux,YearAux,HourAux,iterador:Integer;
   Day,Month,Year:word;
   Month_Year,MesConsulta:String;
begin
     ListaEstructura:=Tlist.Create();
     FechaCalendario1:=Calendario.Date;
     Hoy:=Calendario.Date;
     DecodeDate(Hoy,Year,Month,Day);
     MonthAux:=Month;
     YearAux:=Year;
     MesInic:=Month;
     AgnoInic:=Year;
     Dia:=Day;
     PrimerDia:=Dia;
     DiaSemana:=DayOfWeek(Hoy);
     if DiaSemana = 1 then
       DiaSemana:= 7
     else
       DiaSemana:= DiaSemana - 1;
     NumeroFila:=0;
     iterador:= 1;
     If MonthAux<=9 then
      MesConsulta:='0'+IntToStr(MonthAux)
     Else
      MesConsulta:=IntToStr(MonthAux);
     Month_Year:=MesConsulta+InttoStr(YearAux);
     fecha_reporte:= MesConsulta+InttoStr(YearAux);
     while PrimerDia > 0 do
      begin
       PrimerDia:=PrimerDia-1;
       DiaSemana:=DiaSemana-1;
       if DiaSemana < 0 then
        begin
         DiaSemana:= 6;
        end;
      end;
     LDiaReporte:= DiaSemana + 1;
     NumeroDay:= CalcDias(MonthAux,YearAux);
     NDiasReporte:= NumeroDay;

//case MonthAux of
//1,3,5,7,8,10,12:begin
     if ((DiaSemana=5) or (DiaSemana=6)) then
      begin
       AltoPanel:=105;
//       PanelInferior.Height:=26;
      end
     else
      AltoPanel:=123;
     while iterador <= NumeroDay do
      begin
       GeneracionDias(PanelInferiorCentral,DiaSemana,NumeroFila,iterador,AltoPanel,Month_Year);
       iterador:= iterador+1;
       DiaSemana:=DiaSemana+1;
       if (DiaSemana=7) then
        begin
         DiaSemana:=0;
         NumeroFila:=NumeroFila+1;
        end;
      end;
  AdminTareas.CrearActividades(Month_Year,ListaEstructura,parametros);
end;
//******************************************************************************

//******************************************************************************
procedure TFCronograma.DesplazarScroll(Sender: TObject);
var
aux2:integer;
begin
     ((Sender as TScrollBar).Parent).Controls[0].top:=-(Sender as TScrollBar).Position;
end;
//******************************************************************************
procedure TFcronograma.ToolButton1Click(Sender: TObject);
var
  Qry1,qry3:TQuery;
  Fecha: TDateTime;
  sql_total:String;

begin
  FMantenimiento:=TFMantenimiento.crearnuevo(Self);
  fMantenimiento.edicionMtto:=false;
  if FMantenimiento.Showmodal = mrOk then
  begin
    Fecha:= StrtoDateTime(FMantenimiento.dbeFechaInicial.Text);
    Decodedate(Fecha,Year,MesTarea,Dia);
    if MesTarea = MesInic then
    begin
      sql_total:=  ' SELECT T.CODIGOTAREA,M.CODIGOTIPOMANT,M.CODIGOSUBESTACION,M.CODIGOCIRCUITO,BM.CODIGOAMBITO,BM.CODIGOELEMENTO,BM.CODIGOAREAOPERACIONODT,EM.CLELEMENTO1,EM.CLELEMENTO2 FROM PM_TAREA T,'+
                   ' PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE T.CODIGOTAREA = '''+Edit2.Text+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND '+
                   ' M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO';

      Qry1:= TQuery.Create(Application);
      Qry1.DatabaseName:='BaseDato';
      Qry1.SQL.Clear;
      Qry1.SQL.Add(sql_total);
      Qry1.Open;
      case totalsuma of
       0: begin
            PunteroDia;
          end;
       //inicio
      20: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) then
              PunteroDia;
          end;
      21: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) then
              PunteroDia;
          end;
      25: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) then
              PunteroDia;
          end;
      60: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) then
              PunteroDia;
          end;
     140: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsInteger) then
              PunteroDia;
          end;
      30: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsInteger) then
              PunteroDia;
          end;
      26: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) then
              PunteroDia;
          end;
      61: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) then
              PunteroDia;
          end;
      166: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsInteger) then
              PunteroDia;
          end;
       71: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsInteger) then
              PunteroDia;
          end;
       65: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) then
              PunteroDia;
          end;
       75: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsInteger) then
              PunteroDia;
          end;
       //fin
       1: begin
            if (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) then
              PunteroDia;
          end;
       6: begin
            if (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) then
              PunteroDia;
          end;
       16: begin
             if  (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
               PunteroDia;
           end;
       15: begin
             if (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
               PunteroDia;
           end;
       11: begin
             if  (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
               PunteroDia;
           end;
       10: begin
             if (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
               PunteroDia;
           end;
       5: begin
            if (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) then
              PunteroDia;
          end;
       40:begin
            if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) then
              PunteroDia;
          end;
      120:begin
            if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString)  then
              PunteroDia;
          end;
      130:begin
            if (cbElemento.Visible) and (cbElemento.Text <> '') then
            begin
              qry3:= TQuery.Create(application);
              qry3.DatabaseName:='BaseDato';
              qry3.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
              qry3.FieldByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
              qry3.Open;
              if qry3.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1 then
              begin
                if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) then
                  PunteroDia;
              end
              else
              begin
                if qry3.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2 then
                begin
                  if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) and (codigo2.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO2').asstring) then
                    PunteroDia;
                end;
              end;
            end
            else
            begin
              if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
                PunteroDia;
            end;
           end;
      121:begin
            if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) then
              PunteroDia;
          end;
      131:begin
            if (cbElemento.Visible) and (cbElemento.Text <> '') then
            begin
              qry3:= TQuery.Create(application);
              qry3.DatabaseName:='BaseDato';
              qry3.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
              qry3.FieldByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
              qry3.Open;
              if qry3.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1 then
              begin
                if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (TipoMantenimiento.keyvalue = Qry1.fieldbyname('CODIGOTIPOMANT').asinteger)  and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) then
                  PunteroDia;
              end
              else
              begin
                if qry3.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2 then
                begin
                  if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (TipoMantenimiento.keyvalue = Qry1.fieldbyname('CODIGOTIPOMANT').asinteger) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) and (codigo2.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO2').asstring) then
                    punterodia;
                end;
              end;
            end
            else
            begin
              if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (TipoMantenimiento.keyvalue = Qry1.fieldbyname('CODIGOTIPOMANT').asinteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
                punterodia;
            end;
           end;
        50:begin
             if (cbElemento.Visible) and (cbElemento.Text <> '') then
             begin
               qry3:= TQuery.Create(application);
               qry3.DatabaseName:='BaseDato';
               qry3.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
               qry3.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
               qry3.Open;
               if qry3.FieldByName('NUMEROCLAVES').asinteger = 1 then
               begin
                 if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) then
                   punterodia;
               end
               else
               begin
                 if qry3.FieldByName('NUMEROCLAVES').asinteger = 2 then
                   if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) and (codigo2.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO2').asstring) then
                     punterodia;
               end;
             end
             else
             begin
               if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString)  then
                 punterodia;
             end;
           end;
        41:begin
             if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger)  then
               punterodia;
             end;
        51:begin
             if (cbElemento.Visible) and (cbElemento.Text <> '') then
             begin
               qry3:= TQuery.Create(application);
               qry3.DatabaseName:='BaseDato';
               qry3.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
               qry3.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
               qry3.Open;
               if qry3.FieldByName('NUMEROCLAVES').asinteger = 1 then
               begin
                 if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (TipoMantenimiento.keyvalue = Qry1.fieldbyname('CODIGOTIPOMANT').asinteger) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) then
                   punterodia;
               end
               else
               begin
                 if qry3.FieldByName('NUMEROCLAVES').asinteger = 2 then
                   if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').asinteger) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) and (codigo2.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO2').asstring) then
                     punterodia;
               end;
             end
             else
             begin
             if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString)  then
               punterodia;
             end;
           end;
      end;
    end;
  end;
  Edit1.Text:= FMantenimiento.QTarea.fieldByName('CODIGOTAREA').AsString;
  FMantenimiento.free;
end;
//******************************************************************************
procedure TFcronograma.CFechasClick(Sender: TObject);
begin
     PanelFecha.Visible:=CFechas.Checked;
     contenedorfechas.Height:=PanelFecha.Height+Pfecha.Height+5;
     if CFechas.Checked=false then
        contenedorfechas.Height:=Pfecha.Height;
end;
//******************************************************************************
procedure TFcronograma.CElementoClick(Sender: TObject);
begin
     PanelElemento.Visible:=CElemento.Checked;
     Elemento.Visible:=CElemento.Checked;
     Elemento.KeyValue:='';
     contenedorelementos.Height:=PanelElemento.Height+PElemento.Height+5;
     if CElemento.Checked=false then
       begin
         if cbElemento.Visible = true then
           cbElemento.Visible:= false;
         if cbElemento.Items.Count > 1 then
           cbElemento.Clear;
         contenedorElementos.Height:=PElemento.Height;
         totalsuma:=0;
         if ((Circuito.Visible) and (Circuito.Text <>'')) then
           begin
             totalsuma:= totalsuma + 120;
             parametros[4]:= VarToStr(Subestacion.KeyValue);
             parametros[5]:= VarToStr(Circuito.KeyValue);
           end
         else
           begin
             if (CAmbito.Checked) and (Ambito.Text <> '') then
               begin
                 if Ambito.KeyValue = 1 then
                   begin
                     if (Subestacion.Visible) and (Subestacion.Text <> '') then
                       begin
                         totalsuma:= totalsuma + 40;
                         parametros[4]:= VarToStr(Subestacion.KeyValue);
                       end
                     else
                       begin
                         totalsuma:= totalsuma + 5;
                         parametros[2]:= VarToStr(Ambito.KeyValue);
                       end;
                   end
                 else
                   begin
                     totalsuma:= totalsuma + 5;
                     parametros[2]:= VarToStr(Ambito.KeyValue);
                   end;
               end;
           end;
         if (CTipoMant.Checked) and (TipoMantenimiento.Text <> '') then
           begin
             totalsuma:= totalsuma + 1;
             parametros[1]:= VarToStr(TipoMantenimiento.KeyValue);
           end;
         //NUEVO
         if (cCoordinacion.Checked) and (Coordinacion.Text <> '') then
         begin
           totalsuma:= totalsuma + 20;
           parametros[6]:= VarToStr(Coordinacion.KeyValue);
         end;
         // FIN NUEVO
         parametros[0]:= IntToStr(totalsuma);
         liberar;
         CreacionDias;
       end;
end;
//******************************************************************************
procedure TFcronograma.CTipoMantClick(Sender: TObject);
begin
  PanelTipoMant.Visible:=CTipoMant.Checked;
  TipoMantenimiento.Visible:= CTipoMant.Checked;
  TipoMantenimiento.KeyValue:=0;
  contenedorTipoMant.Height:=PanelTipoMant.Height+PTipoMant.Height+5;
  if CTipoMant.Checked=false then
   begin
     contenedortipomant.Height:=PTipoMant.Height;
     totalsuma:=0;
     if (Circuito.Visible) and (Circuito.Text <>'') then
       begin
         totalsuma:= totalsuma + 120;
         parametros[4]:= VarToStr(Subestacion.KeyValue);
         parametros[5]:= VarToStr(Circuito.KeyValue);
       end
     else
       begin
         if (CAmbito.Checked) and (Ambito.Text <> '') then
           begin
             if Ambito.KeyValue = 1 then
               begin
                 if (Subestacion.Visible) and (Subestacion.Text <> '') then
                   begin
                     totalsuma:= totalsuma + 40;
                     parametros[4]:= VarToStr(Subestacion.KeyValue);
                   end
                 else
                   begin
                     totalsuma:= totalsuma + 5;
                     parametros[2]:= VarToStr(Ambito.KeyValue);
                   end;
               end
             else
               begin
                 totalsuma:= totalsuma + 5;
                 parametros[2]:= VarToStr(Ambito.KeyValue);
               end;
           end;
       end;
     if (CElemento.Checked) and (Elemento.Text <> '') then
       begin
         totalsuma:= totalsuma + 10;
         parametros[3]:= VarToStr(Elemento.KeyValue);
       end;
       //NUEVO
      if (cCoordinacion.Checked) and (Coordinacion.Text <> '') then
       begin
         totalsuma:= totalsuma + 20;
         parametros[6]:= VarToStr(Coordinacion.KeyValue);
       end;
     // FIN NUEVO
     parametros[0]:= InttoStr(totalsuma);
     liberar;
     CreacionDias;
   end;
end;
//******************************************************************************
procedure TFcronograma.CAmbitoClick(Sender: TObject);
begin
  PanelLugar.Visible:=CAmbito.Checked;
  Ambito.Visible:=CAmbito.Checked;
  Elemento.Enabled:= CAmbito.Checked;
  Ambito.KeyValue:=0;
  contenedorlugar.Height:=(PanelLugar.Height+PLugar.Height+5);
  if CAmbito.Checked=false then
  begin
    if cbElemento.Visible then
      cbElemento.Visible:= false;
    if cbElemento.Items.Count > 1 then
      cbElemento.Clear;
    CElemento.Enabled:= False;
    CElemento.Checked:= False;
    contenedorLugar.Height:=PLugar.Height+4;
    if Subestacion.Visible then
      Subestacion.Visible:= False;
    if Circuito.Visible then
      Circuito.Visible:= False;
    totalsuma:=0;
    if (CTipoMant.Checked) and (TipoMantenimiento.Text <> '') then
    begin
      totalsuma:= totalsuma + 1;
      parametros[1]:= VarToStr(TipoMantenimiento.KeyValue);
    end;
    //NUEVO
    if (cCoordinacion.Checked) and (Coordinacion.Text <> '') then
    begin
      totalsuma:= totalsuma + 20;
      parametros[6]:= VarToStr(Coordinacion.KeyValue);
    end;
    // FIN NUEVO
    parametros[0]:= IntToStr(totalsuma);
    liberar;
    CreacionDias;
  end;
end;

procedure TFcronograma.SpeedButton2Click(Sender: TObject);
var
  Adminbancomantenimiento: TFAdminBancoM;
begin
  Adminbancomantenimiento:= TFAdminBancoM.crear(self);
  Adminbancomantenimiento.PanelFiltros.Visible:= False;
  Adminbancomantenimiento.GridMantenimientos.Top:= Adminbancomantenimiento.GridMantenimientos.Top - 71;
  Adminbancomantenimiento.ShowModal;
  Adminbancomantenimiento.Free;
end;

procedure TFcronograma.TipoMantenimientoClick(Sender: TObject);
begin
  totalsuma:= 1;
  parametros[1]:= VarToStr(TipoMantenimiento.KeyValue);
  if (Circuito.Visible) and (Circuito.Text <>'') then
  begin
    totalsuma:= totalsuma + 120;
    parametros[4]:= VarToStr(Subestacion.KeyValue);
    parametros[5]:= VarToStr(Circuito.KeyValue);
  end
  else
  begin
    if (CAmbito.Checked) and (Ambito.Text <> '') then
    begin
      if Ambito.KeyValue = 1 then
      begin
        if (Subestacion.Visible) and (Subestacion.Text <> '') then
        begin
          totalsuma:= totalsuma + 40;
          parametros[4]:= VarToStr(Subestacion.KeyValue);
        end
        else
        begin
          totalsuma:= totalsuma + 5;
          parametros[2]:= VarToStr(Ambito.KeyValue);
        end;
      end
      else
      begin
        totalsuma:= totalsuma + 5;
        parametros[2]:= VarToStr(Ambito.KeyValue);
      end;
    end;
  end;
  if (CElemento.Checked) and (Elemento.Text <> '') then
  begin
    totalsuma:= totalsuma + 10;
    parametros[3]:= VarToStr(Elemento.KeyValue);
  end;
  //NUEVO
  if (cCoordinacion.Checked) and (Coordinacion.Text <> '') then
  begin
    totalsuma:= totalsuma + 20;
    parametros[6]:= VarToStr(Coordinacion.KeyValue);
  end;
 // FIN NUEVO
  parametros[0]:= InttoStr(totalsuma);
  liberar;
  CreacionDias;
end;

procedure TFcronograma.SubestacionClick(Sender: TObject);
begin
  if (Ambito.KeyValue = 1) and (Ambito.Text <> '') then
  begin
    totalsuma:= 40;
    parametros[4]:= VarToStr(Subestacion.KeyValue);
    if (CElemento.Checked) and (Elemento.Text <> '') then
    begin
      totalsuma:= totalsuma + 10;
      parametros[3]:= VarToStr(Elemento.KeyValue);
      if (contenedorelementos.Height = PanelElemento.Height+(PElemento.Height+5)) then
      begin
        contenedorelementos.Height:= (PanelElemento.Height+(PElemento.Height+5)) + (panel7.Height + 5);
        if cbElemento.Visible = false then
          cbElemento.Visible:= true;
      end;
      if qCaracteristicasElemento.Active then
        qCaracteristicasElemento.Close;
      qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
      qCaracteristicasElemento.Open;
      if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
      begin
        if qTablaElemento.Active then
          qTablaElemento.Close;
        qTablaElemento.SQL.Clear;
        sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                            qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
        qTablaElemento.SQL.Add(sqltablaelemento);
        qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(Subestacion.keyvalue);
        qTablaElemento.Open;
        if (qTablaElemento.RecordCount > 0) then
        begin
          if codigo1.Items.Count >= 1 then
            codigo1.Clear;
          if cbElemento.Items.Count >= 1 then
            cbElemento.Clear;
          while not qTablaElemento.Eof do
          begin
            codigo1.Items.Append(qTablaElemento.fields[0].asstring);
            cbElemento.Items.Append(qTablaElemento.fields[1].asstring);
            qTablaElemento.Next;
          end;
        end
        else
        begin
          if codigo1.Items.Count >= 1 then
            codigo1.Clear;
          if cbElemento.Items.Count >= 1 then
            cbElemento.Clear;
          MessageDlg('No se encontraron elementos de ese tipo asociados con la Subestación.', mtInformation,[mbOk], 0);
        end;
      end
      else
      begin
        if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
        begin
          if qTablaElemento.Active then
            qTablaElemento.Close;
          qTablaElemento.SQL.Clear;
          sqltablaelemento:= ' SELECT '+'  '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                              qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
          qTablaElemento.SQL.Add(sqltablaelemento);
          qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(Subestacion.keyvalue);
          qTablaElemento.Open;
          if (qTablaElemento.RecordCount > 0) then
          begin
            if codigo1.Items.Count >= 1 then
              codigo1.Clear;
            if cbElemento.Items.Count >= 1 then
              cbElemento.Clear;
            while not qTablaElemento.Eof do
            begin
              codigo1.Items.Append(qTablaElemento.fields[0].asstring);
              cbElemento.Items.Append(qTablaElemento.fields[0].asstring);
              qTablaElemento.Next;
            end;
          end
          else
          begin
            if codigo1.Items.Count >= 1 then
              codigo1.Clear;
            if cbElemento.Items.Count >= 1 then
              cbElemento.Clear;
            MessageDlg('No se encontraron elementos de ese tipo asociados con la Subestación.', mtInformation,[mbOk], 0);
          end;
        end;
      end;
      if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
      begin
        if qTablaElemento.Active then
          qTablaElemento.Close;
        qTablaElemento.SQL.Clear;
        sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                           qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
        qTablaElemento.SQL.Add(sqltablaelemento);
        qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(Subestacion.keyvalue);
        qTablaElemento.Open;
        if (qTablaElemento.RecordCount > 0)  then
        begin
          if codigo1.Items.Count >= 1 then
            codigo1.Clear;
          if codigo2.Items.Count >= 1 then
            codigo2.Clear;
          if cbElemento.Items.Count >= 1 then
            cbElemento.Clear;
          while not qTablaElemento.Eof do
          begin
            codigo1.Items.Append(qTablaElemento.fields[0].asstring);
            codigo2.Items.Append(qTablaElemento.fields[1].asstring);
            cbElemento.Items.Append(qTablaElemento.fields[2].asstring);
            qTablaElemento.Next;
          end;
        end
        else
        begin
          if codigo1.Items.Count >= 1 then
            codigo1.Clear;
          if cbElemento.Items.Count >= 1 then
            cbElemento.Clear;
          MessageDlg('No se encontraron elementos de ese tipo asociados con la Subestación.', mtInformation,[mbOk], 0);
        end;
      end
      else
      begin
        if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
        begin
          if qTablaElemento.Active then
            qTablaElemento.Close;
          qTablaElemento.SQL.Clear;
          sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+' '+'FROM'+' '+
                             qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
          qTablaElemento.SQL.Add(sqltablaelemento);
          qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(Subestacion.keyvalue);
          qTablaElemento.Open;
          if (qTablaElemento.RecordCount > 0) then
          begin
            if codigo1.Items.Count >= 1 then
              codigo1.Clear;
            if codigo2.Items.Count >= 1 then
              codigo2.Clear;
            if cbElemento.Items.Count >= 1 then
              cbElemento.Clear;
            while not qTablaElemento.Eof do
            begin
              codigo1.Items.Append(qTablaElemento.fields[0].asstring);
              codigo2.Items.Append(qTablaElemento.fields[1].asstring);
              cbElemento.Items.Append(qTablaElemento.fields[0].asstring + qTablaElemento.Fields[1].asstring);
              qTablaElemento.Next;
            end;
          end
          else
          begin
            if codigo1.Items.Count >= 1 then
              codigo1.Clear;
            if cbElemento.Items.Count >= 1 then
              cbElemento.Clear;
            MessageDlg('No se encontraron elementos de ese tipo asociados con la Subestación.', mtInformation,[mbOk], 0);
          end;
        end;
      end;
    end
    else
    begin
      if cbElemento.Visible then
        cbElemento.Visible:= false;
    end;
    if (CTipoMant.Checked) and (TipoMantenimiento.Text <> '') then
    begin
      totalsuma:= totalsuma + 1;
      parametros[1]:= VarToStr(TipoMantenimiento.KeyValue);
    end;
    //NUEVO
    if (cCoordinacion.Checked) and (Coordinacion.Text <> '') then
    begin
      totalsuma:= totalsuma + 20;
      parametros[6]:= VarToStr(Coordinacion.KeyValue);
    end;
   // FIN NUEVO
    parametros[0]:= IntToStr(totalsuma);
    liberar;
    CreacionDias;
  end
  else
  begin
    if QCircuito.Active then
      QCircuito.Close;
    QCircuito.ParamByName('codsubestacion').AsString:= VarToStr(Subestacion.KeyValue);
    QCircuito.Open;
  end;
end;

procedure TFcronograma.AmbitoClick(Sender: TObject);
var a:String;
begin
  case Ambito.KeyValue of
     1:begin
           if QSubestacion.Active then
             Qsubestacion.Close;
           QSubestacion.Open;
           if contenedorlugar.Height = (PanelLugar.Height+PLugar.Height+5) then
             contenedorlugar.Height:= ((PanelLugar.Height+PLugar.Height+5)+ (Panel2.Height + 1))
           else
             if contenedorlugar.Height = ((PanelLugar.Height+PLugar.Height+5) + (Panel2.Height + 1) + (Panel3.Height + 1)) then
               contenedorlugar.Height:= ((PanelLugar.Height+PLugar.Height+5)+(Panel2.Height + 1));
           if Subestacion.Visible = False then
             Subestacion.Visible:= True;
           Subestacion.KeyValue:='';
           if (Circuito.Visible)  then
             Circuito.Visible:= False;
           totalsuma:= 5;
           parametros[2]:= VarToStr(Ambito.KeyValue);
           if CElemento.Enabled = false then
             CElemento.Enabled:= True
           else
             if (CElemento.Checked) and (Elemento.Text <> '') then
               Elemento.KeyValue:= 0;
           if cbElemento.Visible then
             begin
               if cbElemento.Items.Count > 1 then
                 cbElemento.Clear;
               cbElemento.Visible:= false;
             end;
           if QElemento.Active then
             QElemento.Close;
           QElemento.ParamByName('CODIGOAMBITO').AsInteger:= Ambito.KeyValue;
           QElemento.Open;
         end;
     2:begin
         if QSubestacion.Active then
           QSubestacion.Close;
         QSubestacion.Open;
         if QCircuito.Active then
           Qcircuito.Close;
         if contenedorlugar.Height = (PanelLugar.Height+PLugar.Height+5) then
           contenedorlugar.Height:= ((PanelLugar.Height+PLugar.Height+5)+(Panel2.Height + 1) + (Panel3.Height + 1))
           else
             if contenedorlugar.Height = ((PanelLugar.Height+PLugar.Height+5)+(Panel2.Height + 1)) then
               contenedorlugar.Height:= ((PanelLugar.Height+PLugar.Height+5)+(Panel2.Height + 1))+(Panel3.Height + 1);
         if Subestacion.Visible = False then
           Subestacion.Visible:= True;
         Subestacion.KeyValue:='';
         if Circuito.Visible= False then
           Circuito.Visible:= True;
         Circuito.KeyValue:='';
         totalsuma:= 5;
         parametros[2]:= VarToStr(Ambito.KeyValue);
         if CElemento.Enabled = false then
           CElemento.Enabled:= True;
         if (CElemento.Checked) and (Elemento.Text <> '') then
               Elemento.KeyValue:= 0;
         if cbElemento.Visible then
           begin
             if cbElemento.Items.Count > 1 then
               cbElemento.Clear;
             cbElemento.Visible:= false;
           end;
         if QElemento.Active then
             QElemento.Close;
         QElemento.ParamByName('CODIGOAMBITO').AsInteger:= Ambito.KeyValue;
         QElemento.Open;
       end;
  end;
  if (CTipoMant.Checked) and (TipoMantenimiento.Text<>'') then
    begin
      totalsuma:= totalsuma + 1;
      parametros[1]:= VarToStr(TipoMantenimiento.KeyValue);
    end;
  //NUEVO
  if (cCoordinacion.Checked) and (Coordinacion.Text <> '') then
  begin
    totalsuma:= totalsuma + 20;
    parametros[6]:= VarToStr(Coordinacion.KeyValue);
  end;
  // FIN NUEVO
  parametros[0]:= IntToStr(totalsuma);
  liberar;
  CreacionDias;
end;

procedure TFcronograma.CircuitoClick(Sender: TObject);
begin
  totalsuma:= 120;
  parametros[4]:= VarToStr(Subestacion.KeyValue);
  parametros[5]:= VarToStr(Circuito.KeyValue);
  if (CElemento.Checked) and (Elemento.Text <> '') then
    begin
      totalsuma:= totalsuma + 10;
      parametros[3]:= VarToStr(Elemento.KeyValue);
      if (contenedorelementos.Height = PanelElemento.Height+(PElemento.Height+5)) then
        begin
          contenedorelementos.Height:= (PanelElemento.Height+(PElemento.Height+5)) + (panel7.Height + 5);
          if cbElemento.Visible = false then
            cbElemento.Visible:= true;
        end;
      if qCaracteristicasElemento.Active then
        qCaracteristicasElemento.Close;
      qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
      qCaracteristicasElemento.Open;
      if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
        begin
          if qTablaElemento.Active then
            qTablaElemento.Close;
          qTablaElemento.SQL.Clear;
          sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                             qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
          qTablaElemento.SQL.Add(sqltablaelemento);
          qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= vartostr(Circuito.keyvalue);
          qTablaElemento.Open;
          if (qTablaElemento.RecordCount > 0) then
            begin
              if codigo1.Items.Count >= 1 then
                codigo1.Clear;
              if cbElemento.Items.Count >= 1 then
                cbElemento.Clear;
              while not qTablaElemento.Eof do
                begin
                  codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                  cbElemento.Items.Append(qTablaElemento.fields[1].asstring);
                  qTablaElemento.Next;
                end;
            end
          else
            begin
              if codigo1.Items.Count >= 1 then
                codigo1.Clear;
              if cbElemento.Items.Count >= 1 then
                cbElemento.Clear;
              MessageDlg('No se encontraron elementos de ese tipo asociados con la Línea.', mtInformation,[mbOk], 0);
            end;
        end
      else
        begin
          if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
            begin
              if qTablaElemento.Active then
                qTablaElemento.Close;
              qTablaElemento.SQL.Clear;
              sqltablaelemento:= ' SELECT '+'  '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                                 qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
              qTablaElemento.SQL.Add(sqltablaelemento);
              qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= vartostr(Circuito.keyvalue);
              qTablaElemento.Open;
              if (qTablaElemento.RecordCount > 0) then
                begin
                  if codigo1.Items.Count >= 1 then
                    codigo1.Clear;
                  if cbElemento.Items.Count >= 1 then
                    cbElemento.Clear;
                  while not qTablaElemento.Eof do
                    begin
                      codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                      cbElemento.Items.Append(qTablaElemento.fields[0].asstring);
                      qTablaElemento.Next;
                    end;
                end
              else
                begin
                  if codigo1.Items.Count >= 1 then
                    codigo1.Clear;
                  if cbElemento.Items.Count >= 1 then
                    cbElemento.Clear;
                  MessageDlg('No se encontraron elementos de ese tipo asociados con la Línea.', mtInformation,[mbOk], 0);
                end;
            end;
        end;
      if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
        begin
          if qTablaElemento.Active then
            qTablaElemento.Close;
          qTablaElemento.SQL.Clear;
          sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                             qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
          qTablaElemento.SQL.Add(sqltablaelemento);
          qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= vartostr(Circuito.keyvalue);
          qTablaElemento.Open;
          if (qTablaElemento.RecordCount > 0) then
            begin
              if codigo1.Items.Count >= 1 then
                codigo1.Clear;
              if codigo2.Items.Count >= 1 then
                codigo2.Clear;
              if cbElemento.Items.Count >= 1 then
                cbElemento.Clear;
              while not qTablaElemento.Eof do
                begin
                  codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                  codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                  cbElemento.Items.Append(qTablaElemento.fields[2].asstring);
                  qTablaElemento.Next;
                end;
            end
          else
            begin
              if codigo1.Items.Count >= 1 then
                codigo1.Clear;
              if cbElemento.Items.Count >= 1 then
                cbElemento.Clear;
              MessageDlg('No se encontraron elementos de ese tipo asociados con la Línea.', mtInformation,[mbOk], 0);
            end;
        end
      else
        begin
          if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
            begin
              if qTablaElemento.Active then
                qTablaElemento.Close;
              qTablaElemento.SQL.Clear;
              sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+' '+'FROM'+' '+
                                  qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
              qTablaElemento.SQL.Add(sqltablaelemento);
              qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= vartostr(Circuito.KeyValue);
              qTablaElemento.Open;
              if (qTablaElemento.RecordCount > 0)  then
                begin
                  if codigo1.Items.Count >= 1 then
                    codigo1.Clear;
                  if codigo2.Items.Count >= 1 then
                    codigo2.Clear;
                  if cbElemento.Items.Count >= 1 then
                    cbElemento.Clear;
                  while not qTablaElemento.Eof do
                    begin
                      codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                      codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                      cbElemento.Items.Append(qTablaElemento.fields[0].asstring + qTablaElemento.Fields[1].asstring);
                      qTablaElemento.Next;
                    end;
                end
              else
                begin
                  if codigo1.Items.Count >= 1 then
                    codigo1.Clear;
                  if cbElemento.Items.Count >= 1 then
                    cbElemento.Clear;
                  MessageDlg('No se encontraron elementos de ese tipo asociados con la Línea.', mtInformation,[mbOk], 0);
                end;
            end;
        end;
    end
  else
    begin
      if cbElemento.Visible = true then
        cbElemento.Visible:= false;
    end;

  if (CTipoMant.Checked) and (TipoMantenimiento.Text <> '') then
  begin
    totalsuma:= totalsuma + 1;
    parametros[1]:= VarToStr(TipoMantenimiento.KeyValue);
  end;

  //NUEVO
  if (cCoordinacion.Checked) and (Coordinacion.Text <> '') then
   begin
     totalsuma:= totalsuma + 20;
     parametros[6]:= VarToStr(Coordinacion.KeyValue);
   end;
  // FIN NUEVO
  parametros[0]:= IntToStr(totalsuma);
  liberar;
  CreacionDias;
end;

procedure TFcronograma.Edit1Click(Sender: TObject);
begin
  MessageDlg('Procedimiento click de edit1', mtInformation,[mbOk], 0);
end;

procedure TFcronograma.ToolButton3Click(Sender: TObject);
begin
  close;
end;

procedure TFcronograma.ToolButton4Click(Sender: TObject);
begin
  FQRCalendarioMantenimiento:= TFQRCalendarioMantenimiento.GenerarCalendario(application,fecha_reporte,NDiasReporte,LDiaReporte);
  try
    FQRCalendarioMantenimiento.QuickRep1.Preview;
  except
    FQRCalendarioMantenimiento.free;
  end;
end;

procedure TFcronograma.cbElementoChange(Sender: TObject);
begin
  totalsuma:= 10;
  parametros[3]:= VarToStr(Elemento.KeyValue);
  if ((Circuito.Visible) and (Circuito.Text <>'')) then
    begin
      totalsuma:= totalsuma + 120;
      parametros[4]:= VarToStr(Subestacion.KeyValue);
      parametros[5]:= VarToStr(Circuito.KeyValue);
    end
  else
    begin
      if (Subestacion.Visible) and (Subestacion.Text <> '') then
        begin
          totalsuma:= totalsuma + 40;
          parametros[4]:= VarToStr(Subestacion.KeyValue);
        end
    end;
  if (CTipoMant.Checked) and (TipoMantenimiento.Text <> '') then
  begin
    totalsuma:= totalsuma + 1;
    parametros[1]:= vartostr(TipoMantenimiento.keyvalue);
  end;
  //NUEVO
  if (cCoordinacion.Checked) and (Coordinacion.Text <> '') then
  begin
    totalsuma:= totalsuma + 20;
    parametros[6]:= VarToStr(Coordinacion.KeyValue);
  end;
 // FIN NUEVO
  parametros[0]:= IntToStr(totalsuma);
  liberar;
  CreacionDias;
end;

procedure TFcronograma.ToolButton5Click(Sender: TObject);
begin
  {fMttosPendientes:= TfMttosPendientes.BuscarMantenimientos(self,FechaCalendario1);
  if fMttosPendientes.ShowModal = mrOk then
    begin
      Liberar;
      CreacionDias;
    end;
  fMttosPendientes.Free; }
  fMantenimientosPendientes:= TfMantenimientosPendientes.BuscarMantenimientos(self,FechaCalendario1);
  if fMantenimientosPendientes.ShowModal = mrOk then
    begin
      Liberar;
      CreacionDias;
    end;
  fMantenimientosPendientes.Free;
end;

procedure TFcronograma.Button1Click(Sender: TObject);
begin
  fMantenimientoODT:= TfMantenimientoODT.Create(application);
  fMantenimientoODT.ShowModal;
  fMantenimientoODT.Free;
end;

procedure TFcronograma.ToolButton6Click(Sender: TObject);
begin
  fMantenimientoODT:= TfMantenimientoODT.Create(application);
  fMantenimientoODT.ShowModal;
  fMantenimientoODT.Free; 
end;

procedure TFcronograma.FormPaint(Sender: TObject);
var yearalarma,mesalarma,diaalarma:word;
begin
  decodedate(FechaFormAlarma,yearalarma,mesalarma,diaalarma);
  if diaalarma < 10 then
    sAlarma:= '0'+inttostr(diaalarma)
  else
    sAlarma:= inttostr(diaalarma);
  if mesalarma < 10 then
    sAlarma:= sAlarma + '0'+inttostr(mesalarma)
  else
    sAlarma:= sAlarma + inttostr(mesalarma);
  sAlarma:= sAlarma + inttostr(yearalarma);
  Alarma(sAlarma);
end;

procedure TFcronograma.TAlarmaTimer(Sender: TObject);
begin
  if lAlarma.Color = $000000C1 then
  begin
    lAlarma.Color:= clbtnface;
    lAlarma.Font.Color:= clwindowtext;
  end
  else
  if lAlarma.Color = clbtnface then
  begin
    lAlarma.Color:= $000000C1;
    lAlarma.Font.Color:= clWhite;
  end;
end;

procedure TFcronograma.lAlarmaClick(Sender: TObject);
begin
  fAlarmaMantenimiento:= TfAlarmaMantenimiento.ListaMantenimientos(sAlarma);
  fAlarmaMantenimiento.ShowModal;
  lAlarma.Color:= $00C9C9C9;
  lAlarma.Font.Color:= clwindowtext;
  fAlarmaMantenimiento.Free;
end;

procedure TFcronograma.ToolButton8Click(Sender: TObject);
var Fecha:Tdate;
  Year,Mes,Dia:word;
  cFecha:string;
begin
  fModificarMantenimiento:= TfModificarMantenimiento.Create(application);
  if fModificarMantenimiento.ShowModal = mrok then
    begin
      liberar;
      CreacionDias;
      Fecha:= now;
      decodedate(Fecha,Year,Mes,Dia);
      if Dia < 10 then
        cFecha:= '0'+inttostr(Dia)
      else
        cFecha:= inttostr(Dia);
      if Mes < 10 then
        cFecha:= cFecha + '0'+inttostr(Mes)
      else
        cFecha:= cFecha + inttostr(Mes);
      cFecha:= cFecha + inttostr(Year);
      Alarma(cFecha);
    end;
  fModificarMantenimiento.Free;
end;

procedure TFcronograma.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TFcronograma.ToolButton9Click(Sender: TObject);
begin
  FQRCalendarioObservaciones:= TFQRCalendarioObservaciones.GenerarCalendario(application,fecha_reporte,NDiasReporte,LDiaReporte);
  try
    FQRCalendarioObservaciones.QuickRep1.Preview;
  except
    FQRCalendarioObservaciones.free;
  end;
end;

procedure TFcronograma.AreasOperacion;
var
  panel:TPanel;
  top,i:integer;
  label1:TLabel;
  pages:integer;
begin
  top:=11;
  i:=0;
  qAreaOperacion.Open;
  while not (qAreaOperacion.Eof)do
  begin
    label1:= TLabel.Create(Application);
    label1.Caption:=LowerCase(qAreaOperacionNOMBREAREAOPERACIONODT.AsString);
    if qAreaOperacionCOLOR.AsString=''then
    begin
      qAreaOperacion.Open;
      qAreaOperacion.Edit;
      qAreaOperacionCOLOR.AsString:=ColorToString($000080FF);
      qAreaOperacion.Post;
      label1.Color:=StringToColor(qAreaOperacionCOLOR.ASSTRING);
//      label1.Color:=$000080FF;
    end
    else
    begin
      label1.Color:=StringToColor(qAreaOperacionCOLOR.AsString);
    end;
    label1.Font.Color:=clWhite;
    label1.Font.Size:=5;
    label1.Alignment:=taCenter;
    label1.Font.Style:=[fsbold];
    if (i=0) then
      label1.top:= 0
    else
      label1.top:= (top+15)*i;
    label1.Left:=5;
    label1.Visible:=true;
    label1.BringToFront;
    label1.width:=180;
    label1.Height:=15;
    label1.Parent:=Areas;
    label1.Parent:= Areas.Pages[0];
    inc(i);
    qAreaOperacion.Next;
  end;
end;

procedure TFcronograma.qAreaOperacionAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qAreaOperacion.ApplyUpdates;
  qAreaOperacion.CommitUpdates;
end;

procedure TFcronograma.qAreaOperacionAfterPost(DataSet: TDataSet);
begin
  inherited;
  qAreaOperacion.ApplyUpdates;
  qAreaOperacion.CommitUpdates;
end;

procedure TFcronograma.ToolButton10Click(Sender: TObject);
var
  Qry,Qry1,qry3:TQuery;
  PunteroTemporal:PunteroLista;
  CodigoTarea:Real;
  Fecha: TDateTime;
  Dia,MesTarea,Year:word;
  x,NPanelActividad,Fila,FilaPanel,odtopera:integer;
  Consulta,NombreTarea,HoraTarea,Sql,Sql1,Sql2,sql_total:String;
begin
     FMantenimientoAnterior:=TFMantenimientoAnterior.crearnuevo(Self);
     FMantenimientoAnterior.edicionMtto:=false;
     if FMantenimientoAnterior.Showmodal = mrOk then
      begin
       Fecha:= StrtoDateTime(FMantenimientoAnterior.dbeFechaInicial.Text);
       Decodedate(Fecha,Year,MesTarea,Dia);
       if MesTarea = MesInic then
        begin
          sql_total:=  ' SELECT T.CODIGOTAREA,M.CODIGOTIPOMANT,M.CODIGOSUBESTACION,M.CODIGOCIRCUITO,BM.CODIGOAMBITO,BM.CODIGOELEMENTO,EM.CLELEMENTO1,EM.CLELEMENTO2 FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE T.CODIGOTAREA = '''+Edit2.Text+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND '+
                       ' M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO';
          Qry1:= TQuery.Create(Application);
          Qry1.DatabaseName:='BaseDato';
          Qry1.SQL.Clear;
          Qry1.SQL.Add(sql_total);
          Qry1.Open;
case totalsuma of
       0: begin
            PunteroDia;
          end;
       //inicio
      20: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) then
              PunteroDia;
          end;
      21: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) then
              PunteroDia;
          end;
      25: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) then
              PunteroDia;
          end;
      60: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) then
              PunteroDia;
          end;
     140: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsInteger) then
              PunteroDia;
          end;
      30: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsInteger) then
              PunteroDia;
          end;
      26: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) then
              PunteroDia;
          end;
      61: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) then
              PunteroDia;
          end;
      166: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsInteger) then
              PunteroDia;
          end;
       71: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsInteger) then
              PunteroDia;
          end;
       65: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) then
              PunteroDia;
          end;
       75: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsInteger) then
              PunteroDia;
          end;
       //fin
       1: begin
            if (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) then
              PunteroDia;
          end;
       6: begin
            if (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) then
              PunteroDia;
          end;
       16: begin
             if  (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
               PunteroDia;
           end;
       15: begin
             if (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
               PunteroDia;
           end;
       11: begin
             if  (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
               PunteroDia;
           end;
       10: begin
             if (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
               PunteroDia;
           end;
       5: begin
            if (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) then
              PunteroDia;
          end;
       40:begin
            if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) then
              PunteroDia;
          end;
      120:begin
            if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString)  then
              PunteroDia;
          end;
      130:begin
            if (cbElemento.Visible) and (cbElemento.Text <> '') then
            begin
              qry3:= TQuery.Create(application);
              qry3.DatabaseName:='BaseDato';
              qry3.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
              qry3.FieldByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
              qry3.Open;
              if qry3.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1 then
              begin
                if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) then
                  PunteroDia;
              end
              else
              begin
                if qry3.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2 then
                begin
                  if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) and (codigo2.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO2').asstring) then
                    PunteroDia;
                end;
              end;
            end
            else
            begin
              if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
                PunteroDia;
            end;
           end;
      121:begin
            if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) then
              PunteroDia;
          end;
      131:begin
            if (cbElemento.Visible) and (cbElemento.Text <> '') then
            begin
              qry3:= TQuery.Create(application);
              qry3.DatabaseName:='BaseDato';
              qry3.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
              qry3.FieldByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
              qry3.Open;
              if qry3.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1 then
              begin
                if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (TipoMantenimiento.keyvalue = Qry1.fieldbyname('CODIGOTIPOMANT').asinteger)  and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) then
                  PunteroDia;
              end
              else
              begin
                if qry3.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2 then
                begin
                  if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (TipoMantenimiento.keyvalue = Qry1.fieldbyname('CODIGOTIPOMANT').asinteger) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) and (codigo2.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO2').asstring) then
                    punterodia;
                end;
              end;
            end
            else
            begin
              if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (TipoMantenimiento.keyvalue = Qry1.fieldbyname('CODIGOTIPOMANT').asinteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
                punterodia;
            end;
           end;
        50:begin
             if (cbElemento.Visible) and (cbElemento.Text <> '') then
             begin
               qry3:= TQuery.Create(application);
               qry3.DatabaseName:='BaseDato';
               qry3.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
               qry3.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
               qry3.Open;
               if qry3.FieldByName('NUMEROCLAVES').asinteger = 1 then
               begin
                 if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) then
                   punterodia;
               end
               else
               begin
                 if qry3.FieldByName('NUMEROCLAVES').asinteger = 2 then
                   if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) and (codigo2.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO2').asstring) then
                     punterodia;
               end;
             end
             else
             begin
               if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString)  then
                 punterodia;
             end;
           end;
        41:begin
             if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger)  then
               punterodia;
             end;
        51:begin
             if (cbElemento.Visible) and (cbElemento.Text <> '') then
             begin
               qry3:= TQuery.Create(application);
               qry3.DatabaseName:='BaseDato';
               qry3.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
               qry3.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
               qry3.Open;
               if qry3.FieldByName('NUMEROCLAVES').asinteger = 1 then
               begin
                 if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (TipoMantenimiento.keyvalue = Qry1.fieldbyname('CODIGOTIPOMANT').asinteger) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) then
                   punterodia;
               end
               else
               begin
                 if qry3.FieldByName('NUMEROCLAVES').asinteger = 2 then
                   if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').asinteger) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) and (codigo2.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO2').asstring) then
                     punterodia;
               end;
             end
             else
             begin
             if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString)  then
               punterodia;
             end;
           end;
      end;
    end;
  end;
     Edit1.Text:= FMantenimientoAnterior.QTarea.fieldByName('CODIGOTAREA').AsString;
     FMantenimientoAnterior.free;
end;

procedure TFcronograma.ElementoClick(Sender: TObject);
begin
  totalsuma:= 10;
  parametros[3]:= VarToStr(Elemento.KeyValue);
  case Ambito.KeyValue of
     1:begin
         if (Subestacion.Visible) and (Subestacion.Text <> '') then
           begin
             if (contenedorelementos.Height = PanelElemento.Height+(PElemento.Height+5)) then
               begin
                 contenedorelementos.Height:= (PanelElemento.Height+(PElemento.Height+5)) + (panel7.Height + 5);
                 if cbElemento.Visible = false then
                   cbElemento.Visible:= true;
               end;
             totalsuma:= totalsuma + 40;
             parametros[4]:= vartostr(Subestacion.keyvalue);
             if qCaracteristicasElemento.Active then
               qCaracteristicasElemento.Close;
             qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
             qCaracteristicasElemento.Open;
             if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
               begin
                 if qTablaElemento.Active then
                   qTablaElemento.Close;
                 qTablaElemento.SQL.Clear;
                 sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                                    qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
                 qTablaElemento.SQL.Add(sqltablaelemento);
                 memo1.Lines.Append(sqltablaelemento);
                 qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(Subestacion.keyvalue);
                 qTablaElemento.Open;
                 if (qTablaElemento.RecordCount > 0) then
                   begin
                     if codigo1.Items.Count >= 1 then
                       codigo1.Clear;
                     if cbElemento.Items.Count >= 1 then
                       cbElemento.Clear;

                     while not qTablaElemento.Eof do
                       begin
                         codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                         cbElemento.Items.Append(qTablaElemento.fields[1].asstring);
                         qTablaElemento.Next;
                       end;
                   end
                 else
                   begin
                     if codigo1.Items.Count >= 1 then
                       codigo1.Clear;
                     if cbElemento.Items.Count >= 1 then
                       cbElemento.Clear;
                     MessageDlg('No se encontraron elementos de ese tipo asociados con la subestación.', mtInformation,[mbOk], 0);
                   end;
               end
             else
               begin
                 if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
                   begin
                     if qTablaElemento.Active then
                       qTablaElemento.Close;
                     qTablaElemento.SQL.Clear;
                     sqltablaelemento:= ' SELECT '+'  '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                                        qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
                     qTablaElemento.SQL.Add(sqltablaelemento);
                     memo1.Lines.Append(sqltablaelemento);
                     qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(Subestacion.keyvalue);
                     qTablaElemento.Open;
                     if (qTablaElemento.RecordCount > 0) then
                       begin
                         if codigo1.Items.Count >= 1 then
                           codigo1.Clear;
                         if cbElemento.Items.Count >= 1 then
                           cbElemento.Clear;

                         while not qTablaElemento.Eof do
                           begin
                             codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                             cbElemento.Items.Append(qTablaElemento.fields[0].asstring);
                             qTablaElemento.Next;
                           end;
                       end
                     else
                       begin
                         if codigo1.Items.Count >= 1 then
                           codigo1.Clear;
                         if cbElemento.Items.Count >= 1 then
                           cbElemento.Clear;
                         MessageDlg('No se encontraron elementos de ese tipo asociados con la subestación.', mtInformation,[mbOk], 0);
                       end;
                   end;
               end;
             if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
               begin
                 if qTablaElemento.Active then
                   qTablaElemento.Close;
                 qTablaElemento.SQL.Clear;
                 sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                                    qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
                 qTablaElemento.SQL.Add(sqltablaelemento);
                 memo1.Lines.Append(sqltablaelemento);
                 qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(Subestacion.keyvalue);
                 qTablaElemento.Open;
                 if (qTablaElemento.RecordCount > 0) then
                   begin
                     if codigo1.Items.Count >= 1 then
                       codigo1.Clear;
                     if codigo2.Items.Count >= 1 then
                       codigo2.Clear;
                     if cbElemento.Items.Count >= 1 then
                       cbElemento.Clear;

                     while not qTablaElemento.Eof do
                       begin
                         codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                         codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                         cbElemento.Items.Append(qTablaElemento.fields[2].asstring);
                         qTablaElemento.Next;
                       end;
                   end
                 else
                   begin
                     if codigo1.Items.Count >= 1 then
                       codigo1.Clear;
                     if cbElemento.Items.Count >= 1 then
                       cbElemento.Clear;
                     MessageDlg('No se encontraron elementos de ese tipo asociados con la subestación.', mtInformation,[mbOk], 0);
                   end;
               end
             else
               begin
                 if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
                   begin
                     if qTablaElemento.Active then
                       qTablaElemento.Close;
                     qTablaElemento.SQL.Clear;
                     sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+' '+'FROM'+' '+
                                        qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
                     qTablaElemento.SQL.Add(sqltablaelemento);
                     memo1.Lines.Append(sqltablaelemento);
                     qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(Subestacion.keyvalue);
                     qTablaElemento.Open;
                     if (qTablaElemento.RecordCount > 0) then
                       begin
                         if codigo1.Items.Count >= 1 then
                           codigo1.Clear;
                         if codigo2.Items.Count >= 1 then
                           codigo2.Clear;
                         if cbElemento.Items.Count >= 1 then
                           cbElemento.Clear;
                         while not qTablaElemento.Eof do
                           begin
                             codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                             codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                             cbElemento.Items.Append(qTablaElemento.fields[0].asstring + qTablaElemento.Fields[1].asstring);
                             qTablaElemento.Next;
                           end;
                       end
                     else
                       begin
                         if codigo1.Items.Count >= 1 then
                           codigo1.Clear;
                         if cbElemento.Items.Count >= 1 then
                           cbElemento.Clear;
                         MessageDlg('No se encontraron elementos de ese tipo asociados con la subestación.', mtInformation,[mbOk], 0);
                       end;
                   end;
               end;
           end
         else
           begin
             totalsuma:= totalsuma + 5;
             parametros[2]:= VarToStr(Ambito.KeyValue);
             if cbElemento.Visible then
               cbElemento.Visible:= false;
           end;
       end;
     2:begin
         if (Circuito.Visible) and (Circuito.Text <> '') then
           begin
             if (contenedorelementos.Height = PanelElemento.Height+(PElemento.Height+5)) then
               begin
                 contenedorelementos.Height:= (PanelElemento.Height+(PElemento.Height+5)) + (panel7.Height + 5);
                 if cbElemento.Visible = false then
                   cbElemento.Visible:= true;
               end;
             totalsuma:= totalsuma + 120;
             parametros[5]:= vartostr(Circuito.keyvalue);
             if qCaracteristicasElemento.Active then
               qCaracteristicasElemento.Close;
             qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
             qCaracteristicasElemento.Open;
             if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
               begin
                 if qTablaElemento.Active then
                   qTablaElemento.Close;
                 qTablaElemento.SQL.Clear;
                 sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                                    qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
                 qTablaElemento.SQL.Add(sqltablaelemento);
                 memo1.Lines.Append(sqltablaelemento);
                 qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= vartostr(Circuito.keyvalue);
                 qTablaElemento.Open;
                 if (qTablaElemento.RecordCount > 0) then
                   begin
                     if codigo1.Items.Count >= 1 then
                       codigo1.Clear;
                     if cbElemento.Items.Count >= 1 then
                       cbElemento.Clear;

                     while not qTablaElemento.Eof do
                       begin
                         codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                         cbElemento.Items.Append(qTablaElemento.fields[1].asstring);
                         qTablaElemento.Next;
                       end;
                   end
                 else
                   begin
                     if codigo1.Items.Count >= 1 then
                       codigo1.Clear;
                     if cbElemento.Items.Count >= 1 then
                       cbElemento.Clear;
                     MessageDlg('No se encontraron elementos de ese tipo asociados con la Línea.', mtInformation,[mbOk], 0);
                   end;
               end
             else
               begin
                 if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
                   begin
                     if qTablaElemento.Active then
                       qTablaElemento.Close;
                     qTablaElemento.SQL.Clear;
                     sqltablaelemento:= ' SELECT '+'  '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                                        qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
                     qTablaElemento.SQL.Add(sqltablaelemento);
                     memo1.Lines.Append(sqltablaelemento);
                     qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= vartostr(Circuito.keyvalue);
                     qTablaElemento.Open;
                     if (qTablaElemento.RecordCount > 0) then
                       begin
                         if codigo1.Items.Count >= 1 then
                           codigo1.Clear;
                         if cbElemento.Items.Count >= 1 then
                           cbElemento.Clear;

                         while not qTablaElemento.Eof do
                           begin
                             codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                             cbElemento.Items.Append(qTablaElemento.fields[0].asstring);
                             qTablaElemento.Next;
                           end;
                       end
                     else
                       begin
                         if codigo1.Items.Count >= 1 then
                           codigo1.Clear;
                         if cbElemento.Items.Count >= 1 then
                           cbElemento.Clear;
                         MessageDlg('No se encontraron elementos de ese tipo asociados con la Línea.', mtInformation,[mbOk], 0);
                       end;
                   end;
               end;
             if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
               begin
                 if qTablaElemento.Active then
                   qTablaElemento.Close;
                 qTablaElemento.SQL.Clear;
                 sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                                    qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
                 qTablaElemento.SQL.Add(sqltablaelemento);
                 memo1.Lines.Append(sqltablaelemento);
                 qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= vartostr(Circuito.keyvalue);
                 qTablaElemento.Open;
                 if (qTablaElemento.RecordCount > 0) then
                   begin
                     if codigo1.Items.Count >= 1 then
                       codigo1.Clear;
                     if codigo2.Items.Count >= 1 then
                       codigo2.Clear;
                     if cbElemento.Items.Count >= 1 then
                       cbElemento.Clear;

                     while not qTablaElemento.Eof do
                       begin
                         codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                         codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                         cbElemento.Items.Append(qTablaElemento.fields[2].asstring);
                         qTablaElemento.Next;
                       end;
                   end
                 else
                   begin
                     if codigo1.Items.Count >= 1 then
                       codigo1.Clear;
                     if cbElemento.Items.Count >= 1 then
                       cbElemento.Clear;
                     MessageDlg('No se encontraron elementos de ese tipo asociados con la Línea.', mtInformation,[mbOk], 0);
                   end;
               end
             else
               begin
                 if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
                   begin
                     if qTablaElemento.Active then
                       qTablaElemento.Close;
                     qTablaElemento.SQL.Clear;
                     sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+' '+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+' '+'FROM'+' '+
                                        qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
                     qTablaElemento.SQL.Add(sqltablaelemento);
                     memo1.Lines.Append(sqltablaelemento);
                     qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= vartostr(Circuito.KeyValue);
                     qTablaElemento.Open;
                     if (qTablaElemento.RecordCount > 0) then
                       begin
                         if codigo1.Items.Count >= 1 then
                           codigo1.Clear;
                         if codigo2.Items.Count >= 1 then
                           codigo2.Clear;
                         if cbElemento.Items.Count >= 1 then
                           cbElemento.Clear;

                         while not qTablaElemento.Eof do
                           begin
                             codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                             codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                             cbElemento.Items.Append(qTablaElemento.fields[0].asstring + qTablaElemento.Fields[1].asstring);
                             qTablaElemento.Next;
                           end;
                       end
                     else
                       begin
                         if codigo1.Items.Count >= 1 then
                           codigo1.Clear;
                         if cbElemento.Items.Count >= 1 then
                           cbElemento.Clear;
                         MessageDlg('No se encontraron elementos de ese tipo asociados con la Línea.', mtInformation,[mbOk], 0);
                       end;
                   end;
               end;
           end
         else
           begin
             totalsuma:= totalsuma + 5;
             parametros[2]:= VarToStr(Ambito.KeyValue);
             if cbElemento.Visible then
               cbElemento.Visible:= false;
           end;
       end;
  end;
  if (CTipoMant.Checked) and (TipoMantenimiento.Text <> '') then
  begin
    totalsuma:= totalsuma + 1;
    parametros[1]:= VarToStr(TipoMantenimiento.KeyValue);
  end;
  //NUEVO
  if (cCoordinacion.Checked) and (Coordinacion.Text <> '') then
   begin
     totalsuma:= totalsuma + 20;
     parametros[6]:= VarToStr(Coordinacion.KeyValue);
   end;
  // FIN NUEVO
  parametros[0]:= IntToStr(totalsuma);
  liberar;
  CreacionDias;
end;

procedure TFcronograma.CoordinacionClick(Sender: TObject);
begin
  totalsuma:= 20;
  parametros[6]:= VarToStr(Coordinacion.KeyValue);
  if (Circuito.Visible) and (Circuito.Text <>'') then
  begin
    totalsuma:= totalsuma + 120;
    parametros[4]:= VarToStr(Subestacion.KeyValue);
    parametros[5]:= VarToStr(Circuito.KeyValue);
  end
  else
  begin
    if (CAmbito.Checked) and (Ambito.Text <> '') then
    begin
      if Ambito.KeyValue = 1 then
      begin
        if (Subestacion.Visible) and (Subestacion.Text <> '') then
        begin
          totalsuma:= totalsuma + 40;
          parametros[4]:= VarToStr(Subestacion.KeyValue);
        end
        else
        begin
          totalsuma:= totalsuma + 5;
          parametros[2]:= VarToStr(Ambito.KeyValue);
        end;
      end
      else
      begin
        totalsuma:= totalsuma + 5;
        parametros[2]:= VarToStr(Ambito.KeyValue);
      end;
    end;
  end;
  if (CElemento.Checked) and (Elemento.Text <> '') then
  begin
    totalsuma:= totalsuma + 10;
    parametros[3]:= VarToStr(Elemento.KeyValue);
  end;
  //NUEVO
  if (CTipoMant.Checked) and (TipoMantenimiento.Text <> '') then
  begin
    totalsuma:= totalsuma + 1;
    parametros[1]:= VarToStr(TipoMantenimiento.KeyValue);
  end;
  // FIN NUEVO
  parametros[0]:= InttoStr(totalsuma);
  liberar;
  CreacionDias;
end;

procedure TFcronograma.cCoordinacionClick(Sender: TObject);
begin
  PanelCoordinacion.Visible:=cCoordinacion.Checked;
  Coordinacion.Visible:= cCoordinacion.Checked;
  Coordinacion.KeyValue:=0;
  pContenedorCoordinacion.Height:=PanelCoordinacion.Height+PCoordinacion.Height+5;
  if cCoordinacion.Checked=false then
  begin
    pContenedorCoordinacion.Height:=PCoordinacion.Height;
    PanelCoordinacion.SendToBack;
    cCoordinacion.BringToFront;
    totalsuma:=0;
    if (Circuito.Visible) and (Circuito.Text <>'') then
    begin  {
      totalsuma:= totalsuma + 120;
      parametros[4]:= VarToStr(Subestacion.KeyValue);
      parametros[5]:= VarToStr(Circuito.KeyValue);
      }
    end
    else
    begin
      if (CAmbito.Checked) and (Ambito.Text <> '') then
      begin
        if Ambito.KeyValue = 1 then
        begin
          if (Subestacion.Visible) and (Subestacion.Text <> '') then
          begin
            totalsuma:= totalsuma + 40;
            parametros[4]:= VarToStr(Subestacion.KeyValue);
          end
          else
          begin
            totalsuma:= totalsuma + 5;
            parametros[2]:= VarToStr(Ambito.KeyValue);
          end;
        end
        else
        begin
          totalsuma:= totalsuma + 5;
          parametros[2]:= VarToStr(Ambito.KeyValue);
        end;
      end;
    end;
    if (CElemento.Checked) and (Elemento.Text <> '') then
    begin
      totalsuma:= totalsuma + 10;
      parametros[3]:= VarToStr(Elemento.KeyValue);
    end;
    //NUEVO
    if (cCoordinacion.Checked) and (Coordinacion.Text <> '') then
     begin
       totalsuma:= totalsuma + 20;
       parametros[6]:= VarToStr(Coordinacion.KeyValue);
     end;
    // FIN NUEVO
    parametros[0]:= InttoStr(totalsuma);
    liberar;
    CreacionDias;
  end;
end;

procedure TFcronograma.PunteroDia;
var
  PunteroTemporal:PunteroLista;
  x,NPanelActividad,Fila,FilaPanel,odtopera:integer;
 Consulta,NombreTarea,HoraTarea,Sql,Sql1,Sql2:String;
 CodigoTarea:Real;
 Qry:TQuery;
begin
  new(PunteroTemporal);
  PunteroTemporal:= ListaEstructura.Items[Dia-1];
  NPanelActividad:= PunteroTemporal^.Panel.ControlCount;
  if NPanelActividad > 0 then
  begin
    for x:=NPanelActividad-1 downto 0 do
      PunteroTemporal^.Panel.Controls[x].Free;
  end;
  PunteroTemporal^.Panel.Height:=0;
  if Dia <= 9 then
    Consulta:='0'+inttostr(Dia)
  else
    Consulta:=inttostr(Dia);
  if MesTarea <= 9 then
    Consulta:=Consulta+'0'+IntToStr(MesTarea)
  else
    Consulta:=Consulta + IntToStr(MesTarea);
  Consulta:= Consulta + InttoStr(Year);
  Consulta_refrescado:= Consulta;
  DefinirConsulta(totalsuma);
  Qry:=TQuery.Create(Application);
  Qry.DatabaseName:='BaseDato';
  Qry.Sql.Clear;
  Sql:=' SELECT CODIGOTAREA,NOMBRETAREA,TO_CHAR(FECHAINICIAL,''HH24'') AS HORA FROM PM_TAREA WHERE TO_CHAR(FECHAINICIAL,''DDMMYYYY'')= '''+Consulta+''' ORDER BY HORA ';
  Qry.SQL.Add(sql_refrescado);
  Qry.Open;
  Edit1.Text:= InttoStr(Qry.RecordCount);
  FilaPanel:= 0;
  while not Qry.Eof do
  begin
    PunteroTemporal^.Panel.Height:= PunteroTemporal^.Panel.Height + 16;
    CodigoTarea:= Qry.FieldByName('CODIGOTAREA').AsFloat;
    NombreTarea:= Qry.FieldByName('NOMBRETAREA').AsString;
    HoraTarea:= Qry.FieldByName('HORA').AsString;
    odtopera:= Qry.fieldbyname('CODIGOAREAOPERACIONODT').asinteger;
    GenerarPanelActividad:= TIdTarea.Crear(PunteroTemporal^.Panel,FilaPanel,odtopera,CodigoTarea,NombreTarea,HoraTarea);
    FilaPanel:= FilaPanel + 1;
    Qry.Next;
  end;
  Qry.Close;
end;

end.
