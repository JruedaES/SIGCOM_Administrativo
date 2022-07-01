unit uListaMovimientosStock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, Mask, ComCtrls, ExtCtrls, Db, DBTables,
  Grids, DBGrids, RXDBCtrl;

type
  TfListaMovimientosStock = class(TForm)
    Panel1: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    SpeedButton2: TSpeedButton;
    EditFechaIni: TDateTimePicker;
    dtpFechafin: TDateTimePicker;
    Panel2: TPanel;
    Panel3: TPanel;
    sbImprimirRequisicion: TSpeedButton;
    bbCerrar: TBitBtn;
    SaveDialog1: TSaveDialog;
    dsMovimientosStock: TDataSource;
    qMovimientosStock: TQuery;
    RxDBGrid1: TRxDBGrid;
    qGrupoTrabajo: TQuery;
    qGrupoTrabajoCODIGOGRUPOTRABAJO: TFloatField;
    qGrupoTrabajoNOMBREGRUPOTRABAJO: TStringField;
    dsGrupoTrabajo: TDataSource;
    qCIA: TQuery;
    qCIACODIGOADMINISTRATIVO: TFloatField;
    qCIANOMBRECATEGORIA: TStringField;
    dsCIA: TDataSource;
    lUsuario: TLabel;
    lMaterial: TLabel;
    eUsuario: TEdit;
    eMaterial: TEdit;
    Label1: TLabel;
    dbEdCodigoCia: TDBEdit;
    dbLkCbNombreCia: TDBLookupComboBox;
    cbCIA: TCheckBox;
    cbGrupoTrabajo: TCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    procedure SpeedButton2Click(Sender: TObject);
    procedure cbGrupoTrabajoClick(Sender: TObject);
    procedure cbCIAClick(Sender: TObject);
    procedure bbCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fListaMovimientosStock: TfListaMovimientosStock;

implementation

{$R *.DFM}

procedure TfListaMovimientosStock.SpeedButton2Click(Sender: TObject);
var
qConsulta:tquery;
numerousuario: integer;
begin
qMovimientosStock.Close;
qMovimientosStock.sql.Clear;

qMovimientosStock.sql.Text:=  ' SELECT DISTINCT A.*, M.NOMBREMATERIAL, S.CLAVE1,S.CLAVE2 FROM ('+
                              ' SELECT ID_USUARIO USUARIO,  ID_SESION SESION, HOST,  DECODE (ACCION, ''A'',''MODIFICACION'',''I'',''INSERCION'',''E'',''BORRADO'') ACCION, FECHA, CLAVE1 AREA, CLAVE2 GRUPOTRABAJO, CLAVE3 CODIGO_MATERIAL, '+
                              ' CLAVE4 NUEVONEW, CLAVE5 NUEVOOLD, CLAVE6 DESMABUENANEW, CLAVE7 DESMABUENAOLD, CLAVE8 DESMAMALANEW, CLAVE9 DESMAMALAOLD  FROM USUARIO_LOG   WHERE tabla = ''STOCKGRUPOTRABAJO'' '+
                              ' AND (CLAVE4 <> CLAVE5 '+
                              ' OR CLAVE6 <> CLAVE7 '+
                              ' OR CLAVE8 <> CLAVE9) '+
                              ' AND ACCION = ''A'' '+
                              ' UNION '+
                              ' SELECT ID_USUARIO USUARIO,  ID_SESION SESION, HOST,  DECODE (ACCION, ''A'',''MODIFICACION'',''I'',''INSERCION'',''E'',''BORRADO'') ACCION, FECHA, CLAVE1 AREA, CLAVE2 GRUPOTRABAJO, CLAVE3 CODIGO_MATERIAL, '+
                              ' CLAVE4 NUEVONEW, CLAVE5 NUEVOOLD, CLAVE6 DESMABUENANEW, CLAVE7 DESMABUENAOLD, CLAVE8 DESMAMALANEW, CLAVE9 DESMAMALAOLD  FROM USUARIO_LOG   WHERE tabla = ''STOCKGRUPOTRABAJO'' '+
                              ' AND ACCION = ''I'' '+
                              ' UNION '+
                              ' SELECT ID_USUARIO USUARIO,  ID_SESION SESION, HOST, DECODE (ACCION, ''A'',''MODIFICACION'',''I'',''INSERCION'',''E'',''BORRADO'') ACCION, FECHA, CLAVE1 AREA, CLAVE2 GRUPOTRABAJO, CLAVE3 CODIGO_MATERIAL, '+
                              ' CLAVE4 NUEVONEW, CLAVE5 NUEVOOLD, CLAVE6 DESMABUENANEW, CLAVE7 DESMABUENAOLD, CLAVE8 DESMAMALANEW, CLAVE9 DESMAMALAOLD  FROM USUARIO_LOG   WHERE tabla = ''STOCKGRUPOTRABAJO'' '+
                              ' AND ACCION = ''E'') A, MATERIALESSA M, SESIONGESTION S ' +
                              ' WHERE A.SESION = S.IDSESIONBD(+) ' +
                              ' AND S.FECHAINICIO(+)<=A.FECHA AND S.FECHAFIN(+)  >= A.FECHA ' +
                              ' AND A.CODIGO_MATERIAL = M.CODIGOMATERIAL ' +
                              ' AND A.FECHA >= TO_DATE('''+DatetimetoStr(EditFechaIni.Date)+''',''DD/MM/YYYY'') '+
                              ' AND A.FECHA <= TO_DATE('''+Datetimetostr(dtpFechafin.Date)+''',''DD/MM/YYYY'')';

if cbCIA.Checked then
  qMovimientosStock.sql.Text:=qMovimientosStock.sql.Text + ' AND AREA = '+ qCIACODIGOADMINISTRATIVO.AsString ;


if cbGrupoTrabajo.Checked then
  qMovimientosStock.sql.Text:=qMovimientosStock.sql.Text + ' AND GRUPOTRABAJO = '+ qGrupoTrabajoCODIGOGRUPOTRABAJO.AsString ;

if eusuario.Text <> '' then
Begin
  qConsulta := TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.SQL.Add('SELECT count(*)  FROM USUARIO');
  qConsulta.SQL.Add(' WHERE LOGINUSUARIO = ''' + UPPERCASE(eusuario.Text)+'''');
  qConsulta.Open;
  numerousuario:=  qConsulta.Fields[0].Asinteger;
  qConsulta.close;
  qConsulta.free;
  if numerousuario = 0 then
    raise Exception.Create('El login de Usuario no es valido.')
  else
    qMovimientosStock.sql.Text:= qMovimientosStock.sql.Text + ' AND USUARIO = '''+  UPPERCASE(eusuario.Text)+'''';
End;

if eMaterial.text <> '' then
  qMovimientosStock.sql.Text:= qMovimientosStock.sql.Text + ' AND CODIGO_MATERIAL = '+  eMaterial.Text;
qMovimientosStock.sql.Text:=qMovimientosStock.sql.Text + ' ORDER BY FECHA';
qMovimientosStock.open;


end;

procedure TfListaMovimientosStock.cbGrupoTrabajoClick(Sender: TObject);
begin
if cbGrupoTrabajo.Checked = true then
  qGrupoTrabajo.open
else
  qgrupotrabajo.close;
qMovimientosStock.close;
end;

procedure TfListaMovimientosStock.cbCIAClick(Sender: TObject);
begin
if cbCIA.Checked = true then
Begin
  qCIA.open;
  qgrupotrabajo.close;
end
else
Begin
  qCIA.close;
  qgrupotrabajo.close;
end;
qMovimientosStock.close;
end;

procedure TfListaMovimientosStock.bbCerrarClick(Sender: TObject);
begin
CLOSE;
end;

procedure TfListaMovimientosStock.FormCreate(Sender: TObject);
begin
editfechaini.Date:= now;
dtpfechafin.Date:= now;
end;

end.
