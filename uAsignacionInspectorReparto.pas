unit uAsignacionInspectorReparto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,UBase,
  DBTables, Db, DBCtrls, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask,ConsDll;

type
  TfAsignacionInspectorReparto = class(TfBase)
    Panel6: TPanel;
    qItinerarios: TQuery;
    dsItinerarios: TDataSource;
    Panel1: TPanel;
    dbgGrupoTrabajo: TDBGrid;
    Panel2: TPanel;
    dbgItinerarios: TDBGrid;
    Panel4: TPanel;
    lFiltroDatosIti: TLabel;
    lFiltroDatosGrup: TLabel;
    Panel5: TPanel;
    Panel7: TPanel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    sbBuscarCodigo: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label3: TLabel;
    sbConsultarListadoClientes: TSpeedButton;
    eOficina: TEdit;
    DBLkpCmbBoxOficinas: TDBLookupComboBox;
    dbComboCiclosReparto: TDBLookupComboBox;
    qOficinas: TQuery;
    qOficinasCODIGOOFICINA: TFloatField;
    qOficinasNOMBREOFICINA: TStringField;
    dsOficinas: TDataSource;
    qCiclosReparto: TQuery;
    qCiclosRepartoCODIGOESTADOCICLOREPARTO: TFloatField;
    qCiclosRepartoFECHA_PROGRAMADA_REPARTO: TStringField;
    dsCiclosReparto: TDataSource;
    qAdministrativo: TQuery;
    dsAdministrativo: TDataSource;
    eFechaReparto: TEdit;
    qAdministrativoCODIGOGRUPOTRABAJO: TFloatField;
    qAdministrativoNOMBREGRUPOTRABAJO: TStringField;
    qAdministrativoCODIGOADMINISTRATIVO: TFloatField;
    qItinerariosCODIGOITINERARIO: TFloatField;
    qItinerariosNOMBREESTADOITINERARIO: TStringField;
    qItinerariosNOMBREGRUPOTRABAJO: TStringField;
    qItinerariosCODIGOESTADOITINERARIO: TFloatField;
    qItinerariosCANTIDAD: TFloatField;
    Splitter2: TSplitter;
    procedure qItinerariosAfterPost(DataSet: TDataSet);
    procedure eOficinaKeyPress(Sender: TObject; var Key: Char);
    procedure eOficinaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbBuscarCodigoClick(Sender: TObject);
    procedure eFechaRepartoKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton5Click(Sender: TObject);
    procedure eFechaRepartoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbComboCiclosRepartoCloseUp(Sender: TObject);
    procedure sbConsultarListadoClientesClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLkpCmbBoxOficinasCloseUp(Sender: TObject);
    procedure dbgItinerariosTitleClick(Column: TColumn);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
  { Public declarations }
     Fecha:string;
     function GetFecha(Tipo:Boolean): String;
     Function ConteoRegistros(codigoQuery : Integer): Integer;
     Function ValidarAsignacion : Boolean;
     function ValidarSedeFecha: Boolean;
     procedure RecargarListados;
     function AsignarItinerario(CodigoItinerario : String ; CodigoGrupoTrabajo, CodigoAdministrativo : String): Boolean;
     function CambiarEstadoItinerario(CodigoItinerario : String ; CodigoEstado : String): Boolean;
     function DesAsignarItinerario(CodigoItinerario : String): boolean;
     function ValidarCamposAsignacion: Boolean;
     function ValidarCamposInspector : Boolean;
     function consultarSedeOperativa(var CodigoSedeOperativa : String): Boolean;
  end;

var
  fAsignacionInspectorReparto: TfAsignacionInspectorReparto;
   TotalItinerarios, TotalGruposTrabajo : Integer;
   LimiteGeneralClientes : String;
  ListaOrden: TStringList;

implementation

uses uFormaFecha;

{$R *.DFM}


function TfAsignacionInspectorReparto.ValidarSedeFecha: Boolean;
begin
Result := False;
  IF (Trim(eOficina.Text) <> '') and (trim(eFechaReparto.Text) <> '') then
  begin
Result := True;
  end
  else if  NOT(Trim(eOficina.Text) <> '') then
  begin
      Application.MessageBox('Se debe seleccionar una Sede Operativa', 'Error', MB_ICONERROR+MB_OK);
      eOficina.SetFocus;
  end
  else
  begin
    Application.MessageBox('Se debe seleccionar una fecha para Reparto', 'Error', MB_ICONERROR+MB_OK);
    eFechaReparto.SetFocus;
  end;
end;


procedure TfAsignacionInspectorReparto.qItinerariosAfterPost(DataSet: TDataSet);
begin
qItinerarios.ApplyUpdates;
qItinerarios.CommitUpdates;
end;

function TfAsignacionInspectorReparto.ConteoRegistros(
  codigoQuery: Integer): Integer;
begin
end;

function TfAsignacionInspectorReparto.ValidarAsignacion: Boolean;
begin
end;



procedure TfAsignacionInspectorReparto.eOficinaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9', Char(VK_BACK), Char(VK_DELETE)]) then Key := #0;
end;

procedure TfAsignacionInspectorReparto.eOficinaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = VK_RETURN then
    begin
    sbBuscarCodigoClick(Sender);
    end;

end;

procedure TfAsignacionInspectorReparto.sbBuscarCodigoClick(
  Sender: TObject);
var
cod:string;
begin
  cod:=eOficina.TEXT;
  DBLkpCmbBoxOficinas.KeyValue := cod;
  eFechaReparto.SetFocus;
end;

procedure TfAsignacionInspectorReparto.eFechaRepartoKeyPress(
  Sender: TObject; var Key: Char);
begin
 if not (key in [#8,'0'..'9',DecimalSeparator,'+','-','/']) then key:=#0;
end;

procedure TfAsignacionInspectorReparto.SpeedButton5Click(Sender: TObject);
var
Fecha:string;
sFecha:string;
begin
eFechaReparto.Text := GetFecha(True);
dbComboCiclosReparto.KeyValue  := eFechaReparto.Text ;
end;

procedure TfAsignacionInspectorReparto.eFechaRepartoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_RETURN then
    begin
  dbComboCiclosReparto.KeyValue := eFechaReparto.Text;
    end;
end;

function TfAsignacionInspectorReparto.GetFecha(Tipo: Boolean): String;
begin
  FFormaFecha :=  TFFormaFecha.Create(Application);
 // uFormaFecha.sFecha := Fecha;
  fFormaFecha.height:=291;
  if FFormaFecha.ShowModal = mrOk
then Result := DateTimetoStr(FFormaFecha.Date)
else Result := sFecha;
end;

procedure TfAsignacionInspectorReparto.dbComboCiclosRepartoCloseUp(
  Sender: TObject);
begin
eFechaReparto.TEXT := dbComboCiclosReparto.KeyValue;
end;

procedure TfAsignacionInspectorReparto.sbConsultarListadoClientesClick(
  Sender: TObject);
begin
  IF ValidarSedeFecha then
  begin
  RecargarListados;
  end;
end;

procedure TfAsignacionInspectorReparto.RecargarListados;
begin

 qItinerarios.close;
 qItinerarios.ParamByName('CODIGOSEDE').AsString := eOficina.Text;
 qItinerarios.ParamByName('FECHAREPARTO').AsString :=  eFechaReparto.Text;
 qItinerarios.open;

 qAdministrativo.close;
 qAdministrativo.ParamByName('CODIGOSEDEOPERATIVA').AsString := eOficina.Text;
 qAdministrativo.Open;

end;

procedure TfAsignacionInspectorReparto.FormCreate(Sender: TObject);
begin
  qOficinas.Open;
  qCiclosReparto.Open;
  ListaOrden := TStringList.Create;
end;

procedure TfAsignacionInspectorReparto.DBLkpCmbBoxOficinasCloseUp(
  Sender: TObject);
begin
eOficina.tEXT :=  DBLkpCmbBoxOficinas.KeyValue;
end;

procedure TfAsignacionInspectorReparto.dbgItinerariosTitleClick(
  Column: TColumn);
var
Nombre : String;
begin
  if Column.Field.FieldKind   = fkData then
  begin
  Nombre := 'qItinerarios';

    qItinerarios.close;
    qItinerarios.SQL.Strings[15] := 'ORDER BY '+Column.Field.FieldName+' '+ListaOrden.Values[Nombre+Column.Field.FieldName]+' ';
    qItinerarios.open;

  if ListaOrden.Values[Nombre+Column.Field.FieldName] = 'DESC' then
  ListaOrden.Values[Nombre+Column.Field.FieldName] := 'ASC'
  else
  ListaOrden.Values[Nombre+Column.Field.FieldName] := 'DESC';
 end;

end;

FUNCTION TfAsignacionInspectorReparto.AsignarItinerario(CodigoItinerario,
  CodigoGrupoTrabajo,CodigoAdministrativo: String): Boolean;
var
qQuery : TQuery;
begin
result := False;
  try
   qQuery := TQuery.Create(nil);
   qQuery.DatabaseName := 'BaseDato';

   qQuery.SQL.Clear;
   qQuery.SQL.Add('SELECT * FROM REP_ITINERARIO_GRUPOTRABAJO WHERE CODIGOITINERARIO=:CodigoItinerario ');
   qQuery.ParamByName('CODIGOITINERARIO').AsString := CodigoItinerario;
   qQuery.open;

   if qQuery.RecordCount = 0 then
   begin
   qQuery.close;
   qQuery.SQL.Clear;
   qQuery.SQL.Add(' INSERT INTO  REP_ITINERARIO_GRUPOTRABAJO (CODIGOGRUPOTRABAJO,CODIGOADMINISTRATIVO,CODIGOITINERARIO,FECHACREACION) ');
   qQuery.SQL.Add(' VALUES (:CODIGOGRUPOTRABAJO,:CODIGOADMINISTRATIVO,:CODIGOITINERARIO,SYSDATE) ');
   qQuery.ParamByName('CODIGOGRUPOTRABAJO').AsString :=   CodigoGrupoTrabajo;
   qQuery.ParamByName('CODIGOADMINISTRATIVO').AsString :=   CodigoAdministrativo;
   qQuery.ParamByName('CODIGOITINERARIO').AsString := CodigoItinerario;
   qQuery.ExecSQL;

   if qQuery.RowsAffected >0 then
   result := True;

   end
   else
    Application.MessageBox('El itinerario ya tiene asignado un inspector de reparto. Primero se debe desasignar el itinerario.', 'Error', MB_ICONERROR+MB_OK);

finally
  qQuery.Free;
end;


end;

procedure TfAsignacionInspectorReparto.BitBtn2Click(Sender: TObject);
begin
if ValidarCamposAsignacion and ValidarCamposInspector then
begin
if Application.MessageBox(PChar('¿Desea asignar el inspector '+qAdministrativoNOMBREGRUPOTRABAJO.AsString+' al itinerario '+qItinerariosCODIGOITINERARIO.AsString+' ?'),'Confirmación',MB_YESNO+MB_ICONQUESTION+MB_ICONERROR+MB_DEFBUTTON2)  = ID_YES  then
begin

if AsignarItinerario(qItinerariosCODIGOITINERARIO.AsString,qAdministrativoCODIGOGRUPOTRABAJO.AsString,qAdministrativoCODIGOADMINISTRATIVO.AsString) then
 begin

 if CambiarEstadoItinerario(qItinerariosCODIGOITINERARIO.AsString,'2') then
 begin
 Application.MessageBox(Pchar('Se ha asignado el itinerario '+qItinerariosCODIGOITINERARIO.AsString+' al inspector : '+qAdministrativoNOMBREGRUPOTRABAJO.AsString+'.'), 'Información', MB_ICONINFORMATION+MB_OK);
 RecargarListados;
 end
 else
 Application.MessageBox('No ha sido posible cambiar el estado al itinerario. Intente nuevamente.', 'Error', MB_ICONERROR+MB_OK);

 end
 else
  Application.MessageBox('No ha sido posible cambiar asignar el inspector de reparto al itinerario. Intente nuevamente.', 'Error', MB_ICONERROR+MB_OK);

end;

end;
end;

function TfAsignacionInspectorReparto.CambiarEstadoItinerario(
  CodigoItinerario, CodigoEstado: String): Boolean;
var
qQuery : TQuery;
begin
result := False;
  try
   qQuery := TQuery.Create(nil);
   qQuery.DatabaseName := 'BaseDato';

   qQuery.SQL.Clear;
   qQuery.SQL.Add(' UPDATE REP_ITINERARIO SET CODIGOESTADOITINERARIO=:CODIGOESTADOITINERARIO  ');
   qQuery.SQL.Add(' WHERE CODIGOITINERARIO=:CODIGOITINERARIO ');
   qQuery.ParamByName('CODIGOESTADOITINERARIO').AsString :=   CodigoEstado;
   qQuery.ParamByName('CODIGOITINERARIO').AsString := CodigoItinerario;
   qQuery.ExecSQL;

   if qQuery.RowsAffected >0 then
   result := True;

finally
  qQuery.Free;
end;

end;

function TfAsignacionInspectorReparto.ValidarCamposAsignacion: Boolean;
begin
Result := False;

 if qItinerarios.Active  then
 begin


 if qItinerarios.RecordCount >0  then
 begin

 if (qItinerariosCODIGOITINERARIO.AsString <> '') then
 begin

Result := True;
 end
 else
   Application.MessageBox('El codigo del itinerario no es valido, realice un nuevo filtro e intente nuevamente.', 'Error', MB_ICONERROR+MB_OK);

 end
 else
  Application.MessageBox('No hay itinerarios en el listado, realice un nuevo filtro e intente nuevamente.', 'Error', MB_ICONERROR+MB_OK);

  end
 else
  Application.MessageBox('No hay itinerarios en el listado, realice un nuevo filtro e intente nuevamente.', 'Error', MB_ICONERROR+MB_OK);


end;

function TfAsignacionInspectorReparto.ValidarCamposInspector: Boolean;
begin
Result := False;

  if qAdministrativo.Active then
 begin


  if qAdministrativo.RecordCount >0 then
 begin

 if (qAdministrativoCODIGOGRUPOTRABAJO.AsString <> '') and (qAdministrativoCODIGOADMINISTRATIVO.AsString <> '') then
 begin
Result := True;
 end
 else
   Application.MessageBox('El codigo del Inspector de reparto no es valido, realice un nuevo filtro e intente nuevamente.', 'Error', MB_ICONERROR+MB_OK);

 end
 else
  Application.MessageBox('No hay inspectores de reparto en el listado, realice un nuevo filtro e intente nuevamente.', 'Error', MB_ICONERROR+MB_OK);

   end
 else
  Application.MessageBox('No hay inspectores de reparto en el listado, realice un nuevo filtro e intente nuevamente.', 'Error', MB_ICONERROR+MB_OK);


end;

procedure TfAsignacionInspectorReparto.BitBtn3Click(Sender: TObject);
begin
if ValidarCamposInspector and ValidarCamposAsignacion then
begin

if Application.MessageBox(PChar('¿Esta seguro que desea desasignar el inspector '+qItinerariosNOMBREGRUPOTRABAJO.AsString+' del itinerario '+qItinerariosCODIGOITINERARIO.AsString+' ?'),'Confirmación',MB_YESNO+MB_ICONQUESTION+MB_ICONERROR+MB_DEFBUTTON2)  = ID_YES  then
begin

if qItinerariosNOMBREGRUPOTRABAJO.AsString <> '' then
begin
IF DesAsignarItinerario(qItinerariosCODIGOITINERARIO.AsString) then
begin
 if CambiarEstadoItinerario(qItinerariosCODIGOITINERARIO.AsString,'7') then
 begin
 Application.MessageBox(Pchar('Se ha desasignado el itinerario '+qItinerariosCODIGOITINERARIO.AsString+'.'), 'Información', MB_ICONINFORMATION+MB_OK);
 RecargarListados;
 end
 else
 Application.MessageBox('No ha sido posible cambiar el estado al itinerario. Intente nuevamente.', 'Error', MB_ICONERROR+MB_OK);
end
else
 Application.MessageBox('No ha sido posible desasignar el  itinerario ya que no ha sido asignado. Intente nuevamente.', 'Error', MB_ICONERROR+MB_OK);

end
else
 Application.MessageBox('No es posible desasignar el  itinerario.', 'Error', MB_ICONERROR+MB_OK);


end;

end;



end;

function TfAsignacionInspectorReparto.DesAsignarItinerario(
  CodigoItinerario: String): boolean;
var
qQuery : TQuery;
begin
result := False;
  try
   qQuery := TQuery.Create(nil);
   qQuery.DatabaseName := 'BaseDato';

   qQuery.SQL.Clear;
   qQuery.SQL.Add(' DELETE FROM  REP_ITINERARIO_GRUPOTRABAJO ');
   qQuery.SQL.Add(' WHERE CODIGOITINERARIO=:CODIGOITINERARIO ');
   qQuery.ParamByName('CODIGOITINERARIO').AsString := CodigoItinerario;
   qQuery.ExecSQL;

   if qQuery.RowsAffected >0 then
   result := True;

finally
  qQuery.Free;
end;


end;

procedure TfAsignacionInspectorReparto.FormShow(Sender: TObject);
var
Sede : String;
begin

consultarSedeOperativa(Sede);
if Sede <> '' then
begin
eOficina.Text := Sede;
sbBuscarCodigoClick(Sender);
eOficina.Enabled := False;
DBLkpCmbBoxOficinas.Enabled := False;
end;

if ProcManager.CanProcExecute
    ('_Asignar Inspectores de Reparto') then
begin

if consultarSedeOperativa(Sede) then
begin
if Sede <> '' then
begin
eOficina.Text := Sede;
sbBuscarCodigoClick(Sender);
end;

 eOficina.Enabled := True;
DBLkpCmbBoxOficinas.Enabled := True;

end;

end;

end;

function TfAsignacionInspectorReparto.consultarSedeOperativa(
  var CodigoSedeOperativa: String): Boolean;
var
qQuery : TQuery;
begin
result := False;
CodigoSedeOperativa := '';
  try
   qQuery := TQuery.Create(nil);
   qQuery.DatabaseName := 'BaseDato';

   qQuery.SQL.Clear;
   qQuery.SQL.Add('SELECT CODIGOSEDEOPERATIVA FROM COORDINACIONGRUPOTRABAJO WHERE CODIGOUSUARIO=GETCODIGOUSUARIO ');
   qQuery.Open;

   if qQuery.RecordCount >0 then
   begin
   result := True;
   CodigoSedeOperativa  := qQuery.FieldByName('CODIGOSEDEOPERATIVA').AsString;
   end;
finally
  qQuery.Free;
end;

end;

end.
