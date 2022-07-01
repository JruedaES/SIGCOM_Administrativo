unit ufiltroSolicitudSoporte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, ToolEdit, RXDBCtrl, Db,
  DBTables;

type
  TfFiltroSolicitudSoporte = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Panel3: TPanel;
    BitBtnAnularFiltro: TBitBtn;
    DBEdit2: TDBEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    gbProgramacion: TGroupBox;
    Label18: TLabel;
    sbFechaAprobacion: TSpeedButton;
    LFechaAsignacion: TLabel;
    sbFechaAsignacion: TSpeedButton;
    Label23: TLabel;
    sbFechaInicial: TSpeedButton;
    Label27: TLabel;
    sbFechaFin: TSpeedButton;
    dbeFechaAsignacion: TDBEdit;
    dbeFechaAprobacion: TDBEdit;
    dbEdFechaInicio: TDBEdit;
    dbEdFechaFin: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    dblcbAplicativo: TDBLookupComboBox;
    Label7: TLabel;
    dblcbEstado: TDBLookupComboBox;
    Label8: TLabel;
    dblcbprioridad: TDBLookupComboBox;
    Label9: TLabel;
    dblcbTipo: TDBLookupComboBox;
    GroupBox3: TGroupBox;
    Label10: TLabel;
    Label11: TLabel;
    Label14: TLabel;
    DBEdit4: TDBEdit;
    dblcbIngenieroSoporte: TDBLookupComboBox;
    qTipoPrioridad: TQuery;
    dsTipoPrioridad: TDataSource;
    qAplicativo: TQuery;
    dsAplicativo: TDataSource;
    qEstado: TQuery;
    dsEstado: TDataSource;
    qTipoSolicitud: TQuery;
    dsTipoSolicitud: TDataSource;
    qUsuario: TQuery;
    dsUsuario: TDataSource;
    qCIA: TQuery;
    qAreaFuncional: TQuery;
    dsAreaFuncional: TDataSource;
    qAdministrativo: TQuery;
    Edit1: TEdit;
    sbFechaDictado: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    EFechasolicitudDesde: TEdit;
    eFechaSolicitudHasta: TEdit;
    eFechaAsignacionDesde: TEdit;
    eFechaAsignacionHasta: TEdit;
    qAplicativoCODIGOAPLICATIVO: TFloatField;
    qAplicativoNOMBREAPLICATIVO: TStringField;
    qTipoPrioridadCODIGOPRIORIDADSOLICITUD: TFloatField;
    qTipoPrioridadNOMBREPRIORIDADSOLICITUD: TStringField;
    qEstadoCODIGOESTADOSOLICITUD: TFloatField;
    qEstadoNOMBREESTADOSOLICITUD: TStringField;
    qTipoSolicitudCODIGOTIPOSOLICITUD: TFloatField;
    qTipoSolicitudNOMBRETIPOSOLICITUD: TStringField;
    qUsuarioCODIGOUSUARIO: TFloatField;
    qUsuarioNOMBREUSUARIO: TStringField;
    qUsuarioCODIGOTIPOUSUARIO: TStringField;
    qAreaFuncionalCODIGOAREAFUNCIONAL: TFloatField;
    qAreaFuncionalNOMBREAREAFUNCIONAL: TStringField;
    qAdministrativoCODIGOADMINISTRATIVO: TFloatField;
    qAdministrativoNOMBREADMINISTRATIVO: TStringField;
    dsCia: TDataSource;
    dsAdministrativo: TDataSource;
    edit2: TEdit;
    bitBFiltrar: TBitBtn;
    procedure sbFechaDictadoClick(Sender: TObject);
    function GetFechaHora: String;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtnAnularFiltroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bitBFiltrarClick(Sender: TObject);
  private
    { Private declarations }
  public
  Fecha: string;
    { Public declarations }
  end;

var
  fFiltroSolicitudSoporte: TfFiltroSolicitudSoporte;

implementation

uses uFormaFecha, ulistasoporte;

{$R *.DFM}

procedure TfFiltroSolicitudSoporte.sbFechaDictadoClick(Sender: TObject);
var sFecha:string;
begin
  sFecha:='';
  Fecha := '';
  EFechasolicitudDesde.SetFocus;
  Fecha := EFechasolicitudDesde.Text;
  if Fecha = '' then
    Fecha := datetimetostr(now);

  sFecha:=GetFechaHora;
  EFechasolicitudDesde.Text:=  sFecha;
end;

function TfFiltroSolicitudSoporte.GetFechaHora: String;
begin
  fFormaFecha := TfFormaFecha.Create(Application);
  uFormaFecha.sFecha := Fecha;
  fFormaFecha.height:=291;
  if FFormaFecha.ShowModal = mrOk
  then Result := DateTimetoStr(FFormaFecha.Date+FFormaFecha.fTime)
  else Result := sFecha;
  fFormaFecha.Free;
end;

procedure TfFiltroSolicitudSoporte.SpeedButton3Click(Sender: TObject);
var sFecha:string;
begin
  sFecha:='';
  Fecha := '';
  eFechaSolicitudHasta.SetFocus;
  Fecha := eFechaSolicitudHasta.Text;
  if Fecha = '' then
    Fecha := datetimetostr(now);

  sFecha:=GetFechaHora;
  eFechaSolicitudHasta.text:=  sFecha;
end;

procedure TfFiltroSolicitudSoporte.SpeedButton1Click(Sender: TObject);
var sFecha:string;
begin
  sFecha:='';
  Fecha := '';
  eFechaAsignacionDesde.SetFocus;
  Fecha := eFechaAsignacionDesde.Text;
  if Fecha = '' then
    Fecha := datetimetostr(now);

  sFecha:=GetFechaHora;
  eFechaAsignacionDesde.Text:= sFecha;
end;

procedure TfFiltroSolicitudSoporte.SpeedButton2Click(Sender: TObject);
var sFecha:string;
begin
  sFecha:='';
  Fecha := '';
  eFechaAsignacionHasta.SetFocus;
  Fecha := eFechaAsignacionHasta.Text;
  if Fecha = '' then
    Fecha := datetimetostr(now);

  sFecha:=GetFechaHora;
  eFechaAsignacionhasta.text:= sFecha;
end;

procedure TfFiltroSolicitudSoporte.BitBtnAnularFiltroClick(
  Sender: TObject);
begin
fListaSoporte.qSe_Solicitud.close;
fListaSoporte.qSe_Solicitud.open;
end;

procedure TfFiltroSolicitudSoporte.FormCreate(Sender: TObject);
begin
  APPLICATION.UpdateFormatSettings:= FALSE;
  ShortTimeFormat := 'HH:mm:ss';
  LongTimeFormat := 'HH:mm:ss';
  ShortDateFormat := 'dd/mm/yyyy';
qTipoPrioridad.open;
qAplicativo.open;
qEstado.open;
qTipoSolicitud.open;
qUsuario.open;
qCIA.open;
qAreaFuncional.open;
qAdministrativo.open;
end;

procedure TfFiltroSolicitudSoporte.bitBFiltrarClick(Sender: TObject);
var
Sql:string;
begin
  sql:= 'SELECT es.nombreestadosolicitud, af.nombreAreafuncional, u.nombreusuario, e.nombreempleado, u3. nombreusuario, '+
        'ps.NOMBREPRIORIDADSOLICITUD,ts.NOMBRETIPOSOLICITUD, ap.NOMBREAPLICATIVO, a.NOMBRECATEGORIA,s.* '+
        'FROM se_solicitud s,se_areafuncional af, usuario u,usuario u3, administrativo a, se_tiposolicitud ts, '+
        'se_prioridadsolicitud ps, se_aplicativo ap, se_areaaplicativo aap, se_estadosolicitud es,empleado e '+
        'WHERE ((s.codigoaplicativo = aap.CODIGOAPLICATIVO) AND (s.CODIGOAREAFUNCIONAL = aap.CODIGOAREAFUNCIONAL)) '+
        'AND aap.CODIGOAREAFUNCIONAL = af.CODIGOAREAFUNCIONAL '+
        'AND aap.CODIGOAPLICATIVO = ap.CODIGOAPLICATIVO '+
        'AND s.CODIGOPRIORIDADSOLICITUD = ps.codigoprioridadsolicitud '+
        'AND s.CODIGOTIPOSOLICITUD = ts.CODIGOTIPOSOLICITUD '+
        'AND s.CODIGOUSUARIOINFORMANTE = u.CODIGOUSUARIO(+) '+
        'AND s.CODIGOUSUARIOSOPORTE = u3.CODIGOUSUARIO(+) '+
        'AND s.CODIGOUSUARIOSOLICITA= e.CODIGOEMPLEADO '+
        'AND s.CODIGOCIASOLICITA = a.CODIGOADMINISTRATIVO '+
        'AND s.CODIGOESTADOSOLICITUD = es.CODIGOESTADOSOLICITUD ';

  if edit1.Text <> '' then sql:= sql + ' and s.codigosolicitud >= '+edit1.Text;
  if edit2.Text <> '' then sql:= sql + ' and s.codigosolicitud <= '+edit2.Text;
  if dblcbAplicativo.Text  <> '' then sql:= sql + ' and s.codigoaplicativo = '+ qAplicativocodigoaplicativo.asstring;
  if dblcbIngenieroSoporte.Text  <> '' then sql:= sql + ' and s.codigousuariosoporte = '+ qusuariocodigousuario.asstring;
  if dblcbEstado.Text  <> '' then sql:= sql + ' and s.codigoestadosolicitud = '+ qEstadoCODIGOESTADOSOLICITUD.asstring;
  if dblcbprioridad.Text  <> '' then sql:= sql + ' and s.codigoprioridadsolicitud = '+ qTipoPrioridadCODIGOPRIORIDADSOLICITUD.asstring;
  if dblcbTipo.Text  <> '' then sql:= sql + ' and s.codigotiposolicitud = '+ qTipoSolicitudCODIGOTIPOSOLICITUD.asstring;
  if EFechasolicitudDesde.Text <> '' then  sql:= sql + ' and s.fechahorasolicitud >= to_date('''+EFechasolicitudDesde.Text+''',''dd/mm/yyyy hh24:mi:ss'')';
  if EFechasolicitudhasta.Text <> '' then  sql:= sql + ' and s.fechahorasolicitud <= to_date('''+EFechasolicitudhasta.Text+''',''dd/mm/yyyy hh24:mi:ss'')';
  if EFechaAsignacionDesde.Text <> '' then  sql:= sql + ' and s.fechainicialasignada >= to_date('''+EFechaAsignacionDesde.Text+''',''dd/mm/yyyy hh24:mi:ss'')';
  if EFechaAsignacionhasta.Text <> '' then  sql:= sql + ' and s.fechainicialasignada <= to_date('''+EFechaAsignacionhasta.Text+''',''dd/mm/yyyy hh24:mi:ss'')';
  sql:= sql + ' order by codigosolicitud';
  fListaSoporte.qSe_Solicitud.SQL.Text:= sql;
  fListaSoporte.qSe_Solicitud.Close;
  fListaSoporte.qSe_Solicitud.Open;
end;
end.
