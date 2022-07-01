unit uAsignacionLectores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,UBase,
  DBTables, Db, DBCtrls, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Mask;

type
  TfAsignacionLectores = class(TfBase)
    Panel6: TPanel;
    qItinerarios: TQuery;
    dsItinerarios: TDataSource;
    Panel1: TPanel;
    dsDial: TDataSource;
    qDial: TQuery;
    qDialCICLO: TFloatField;
    qDialFECHALECTURA: TDateTimeField;
    qAdministrativo: TQuery;
    dsAdministrativo: TDataSource;
    dbgGrupoTrabajo: TDBGrid;
    Panel2: TPanel;
    DBNavigator2: TDBNavigator;
    dbgItinerarios: TDBGrid;
    qAdministrativoCODIGOGRUPOTRABAJO: TFloatField;
    qAdministrativoNOMBREGRUPOTRABAJO: TStringField;
    qItinerariosCODIGOITINERARIO: TFloatField;
    qItinerariosCODIGOADMINISTRATIVO: TFloatField;
    qItinerariosNOMBRECATEGORIA: TStringField;
    qItinerariosCODIGOGRUPOTRABAJO: TFloatField;
    qItinerariosNOMBREGRUPOTRABAJO: TStringField;
    qItinerariosCODIGOCOORDINACIONGRUPOTRABAJO: TFloatField;
    qItinerariosNOMBRECOORDINACIONGRUPOTRABAJO: TStringField;
    qItinerariosGETCODIGOUSUARIO: TFloatField;
    qAdministrativoCODIGOADMINISTRATIVO: TFloatField;
    DBNavigator1: TDBNavigator;
    Panel4: TPanel;
    lFiltroDatosIti: TLabel;
    lFiltroDatosGrup: TLabel;
    qTotalesIti: TQuery;
    qTotalesItiTOTAL: TFloatField;
    qTotalesGrupo: TQuery;
    FloatField1: TFloatField;
    Panel5: TPanel;
    qItinerariosCANTIDADSUMINISTROS: TFloatField;
    qItinerariosCODIGOESTADOITINERARIO: TFloatField;
    qItinerariosNOMBREESTADOITINERARIO: TStringField;
    qDiales: TQuery;
    dsDiales: TDataSource;
    qDialesCODIGODIAL: TFloatField;
    qDialesNOMBREDIAL: TStringField;
    qDialesCOLOR: TFloatField;
    Panel7: TPanel;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    Panel3: TPanel;
    BitBtnAnularFiltro: TBitBtn;
    SBFiltrar: TSpeedButton;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    sbFechaAprobacion: TSpeedButton;
    dbeFechaLectura: TDBEdit;
    Label1: TLabel;
    qItinerariosCODIGOGRUPOAOL: TFloatField;
    qItinerariosCODIGOGRUPOITINERARIO: TFloatField;
    qAdministrativoLOGIN: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure qItinerariosAfterPost(DataSet: TDataSet);
    procedure btAceptarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbeFechaLecturaChange(Sender: TObject);
    procedure sbFechaAprobacionClick(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure BitBtnAnularFiltroClick(Sender: TObject);
  private
    { Private declarations }
  public
  { Public declarations }
     Fecha:string;
     function GetFecha(Tipo:Boolean): String;
     Function ConteoRegistros(codigoQuery : Integer): Integer;
     Function ValidarAsignacion : Boolean;
  end;

var
  fAsignacionLectores: TfAsignacionLectores;
   TotalItinerarios, TotalGruposTrabajo : Integer;
   LimiteGeneralClientes : String;

implementation

uses uFormaFecha;

{$R *.DFM}

procedure TfAsignacionLectores.FormCreate(Sender: TObject);
Var
Query : Tquery;
ParamSupervisor : String;
begin
qDiales.Open;
qDial.Open;
qItinerarios.close;
qItinerarios.Open;
ParamSupervisor := qItinerarios.FieldByName('CODIGOCOORDINACIONGRUPOTRABAJO').AsString;
qTotalesIti.Open;

///qAdministrativo.ParamByName('CODIGOCOORDINACIONGRUPOTRABAJO').AsString := ParamSupervisor;
qAdministrativo.Open;

qTotalesGrupo.ParamByName('CODIGOCOORDINACIONGRUPOTRABAJO').AsString := ParamSupervisor;
qTotalesGrupo.Open;

TotalItinerarios := ConteoRegistros(0);
TotalGruposTrabajo := ConteoRegistros(1);
try
Query := TQuery.Create(Self);
Query.DatabaseName := 'BaseDato';

Query.SQl.Add('SELECT VALOR FROM SGC_PARAMETROS WHERE CODIGOPARAMETRO=''2'' ');
Query.Open;
LimiteGeneralClientes := Query.FieldByName('VALOR').AsString;

if LimiteGeneralClientes='' then
LimiteGeneralClientes := '400';

finally
Query.Free;
end;

end;

procedure TfAsignacionLectores.qItinerariosAfterPost(DataSet: TDataSet);
begin
qItinerarios.ApplyUpdates;
qItinerarios.CommitUpdates;
end;

procedure TfAsignacionLectores.btAceptarClick(Sender: TObject);
Var
qUpdateIte : TQuery;
posicion1, posicion2: String;
begin
  if ValidarAsignacion then
  begin
  qUpdateIte := TQuery.Create(Self);
  qUpdateIte.DatabaseName:='BaseDato';
  qUpdateIte.sql.add('UPDATE SGC_ITINERARIO');
  qUpdateIte.sql.add('SET CODIGOADMINISTRATIVO = :CODIGOADMINISTRATIVO,');
  qUpdateIte.sql.add('CODIGOGRUPOTRABAJO = :CODIGOGRUPOTRABAJO,');
  qUpdateIte.sql.add('CODIGOESTADOITINERARIO = :CODIGOESTADOITINERARIO');
  qUpdateIte.sql.add('WHERE CODIGOITINERARIO = :OLD_CODIGOITINERARIO');

  qUpdateIte.ParamByName('CODIGOADMINISTRATIVO').AsString:= qAdministrativo.fieldByName('CODIGOADMINISTRATIVO').AsString;
  qUpdateIte.ParamByName('CODIGOGRUPOTRABAJO').AsString:= qAdministrativo.FieldByName('CODIGOGRUPOTRABAJO').AsString;
  qUpdateIte.ParamByName('CODIGOESTADOITINERARIO').AsInteger:= 2;
  qUpdateIte.ParamByName('OLD_CODIGOITINERARIO').AsString:= qItinerarios.FieldByName('CODIGOITINERARIO').AsString;

  qUpdateIte.ExecSQL;
  qUpdateIte.Close;
  qUpdateIte.Free;

  posicion1 := qItinerariosCODIGOITINERARIO.AsString;
  posicion2 := qAdministrativoCODIGOGRUPOTRABAJO.AsString;

  qItinerarios.Close;
  qItinerarios.Open;

  qItinerarios.Locate('CODIGOITINERARIO',(posicion1),[]);
  qAdministrativo.Locate('CODIGOGRUPOTRABAJO',(posicion2),[]);
  end;

end;

procedure TfAsignacionLectores.BitBtn1Click(Sender: TObject);
Var
qUpdateIte : TQuery;
posicion1, posicion2: String;
begin

  qUpdateIte := TQuery.Create(Self);
  qUpdateIte.DatabaseName:='BaseDato';
  qUpdateIte.sql.add('UPDATE SGC_ITINERARIO');
  qUpdateIte.sql.add('SET CODIGOADMINISTRATIVO = :CODIGOADMINISTRATIVO,');
  qUpdateIte.sql.add('CODIGOGRUPOTRABAJO = :CODIGOGRUPOTRABAJO,');
  qUpdateIte.sql.add('CODIGOESTADOITINERARIO = :CODIGOESTADOITINERARIO');
  qUpdateIte.sql.add('WHERE CODIGOITINERARIO = :OLD_CODIGOITINERARIO');

  qUpdateIte.ParamByName('CODIGOADMINISTRATIVO').AsString:= '';
  qUpdateIte.ParamByName('CODIGOGRUPOTRABAJO').AsString:= '';
  qUpdateIte.ParamByName('CODIGOESTADOITINERARIO').AsInteger:= 1;
  qUpdateIte.ParamByName('OLD_CODIGOITINERARIO').AsString:= qItinerarios.FieldByName('CODIGOITINERARIO').AsString;

  qUpdateIte.ExecSQL;
  qUpdateIte.Close;
  qUpdateIte.Free;


    posicion1 := qItinerariosCODIGOITINERARIO.AsString;
  posicion2 := qAdministrativoCODIGOGRUPOTRABAJO.AsString;

  qItinerarios.Close;
  qItinerarios.Open;

  qItinerarios.Locate('CODIGOITINERARIO',(posicion1),[]);
  qAdministrativo.Locate('CODIGOGRUPOTRABAJO',(posicion2),[]);

end;

procedure TfAsignacionLectores.dbeFechaLecturaChange(Sender: TObject);
Var
 Lista : TStringList;
begin
   {  if dbeFechaLectura.Text <> '' Then
     Begin
          qItinerarios.close;
          qItinerarios.SQL.Delete(9);
          qItinerarios.SQL.Insert(9,' AND D.CODIGODIAL = (SELECT MIN (CICLO) FROM EEH_RUTACICLO WHERE FECHALECTURA =  TO_DATE('''+ dbeFechaLectura.Text + ''',''DD/MM/YYYY''))');
          qItinerarios.open;

          qTotalesIti.Close;
          qTotalesIti.SQL.Delete(9);
          qTotalesIti.SQL.Insert(9,' AND D.CODIGODIAL = (SELECT MIN (CICLO) FROM EEH_RUTACICLO WHERE FECHALECTURA =  TO_DATE('''+ dbeFechaLectura.Text + ''',''DD/MM/YYYY''))');
          qTotalesIti.open;

          qTotalesIti.Close;
          qTotalesGrupo.Close;
          qTotalesIti.Open;
          qTotalesGrupo.Open;
          
          TotalItinerarios := ConteoRegistros(0);
          TotalGruposTrabajo := ConteoRegistros(1);

          qAdministrativo.Close;
          qAdministrativo.ParamByName('CODIGOCOORDINACIONGRUPOTRABAJO').AsString:= qItinerarios.fieldbyname('CODIGOCOORDINACIONGRUPOTRABAJO').AsString;
          qAdministrativo.Open;
     End;       }
end;

procedure TfAsignacionLectores.sbFechaAprobacionClick(Sender: TObject);
begin
  try
    dbeFechaLectura.Setfocus;
    Fecha := GetFecha(True);
    if Fecha <> '' then dbeFechaLectura.Text := Fecha;
  except
  end;
end;

function TfAsignacionLectores.GetFecha(Tipo: Boolean): String;
begin
fFormaFecha := TfFormaFecha.Create(Application);
  uFormaFecha.sFecha := sFecha;
  fFormaFecha.height:=291;
  if FFormaFecha.ShowModal = mrOk then
    if Tipo then
       Result := DateTimetoStr(FFormaFecha.Date)
    else
       Result := DateTimetoStr(FFormaFecha.Date)
  else Result := sFecha;
  fFormaFecha.Free;
end;

function TfAsignacionLectores.ConteoRegistros(
  codigoQuery: Integer): Integer;
begin
// El código '0' para el query que cuenta el total de los itinerarios  'qTotalesIti' y  1 para el query que cuenta el total de grupos de trabajo 'qTotalesGrupo'.
case codigoQuery of
   0: lFiltroDatosIti.Caption := ' << FILTRO DE DATOS >>    << ' +IntToStr(qItinerarios.RecordCount)+' Registros  >>';
   1: lFiltroDatosGrup.Caption := ' << FILTRO DE DATOS >>    << ' + qTotalesGrupo.fieldByName('Total').AsString+' Registros  >>';
end;
end;

function TfAsignacionLectores.ValidarAsignacion: Boolean;
var
Query : TQuery;
begin

try

  Query := TQuery.Create(Self);
  Query.DatabaseName:='BaseDato';  

 Query.SQL.cLEAR;
 Query.SQL.Add('SELECT nvl(SUM(CANTIDADSUMINISTROS),0) AS SUMA FROM SGC_ITINERARIO I, SGC_GRUPOITINERARIO G , C_GRUPOAOL C ');
 Query.SQL.Add('WHERE');
 Query.SQL.Add('C.CODIGOGRUPOAOL = G.CODIGOGRUPOAOL');
 Query.SQL.Add('AND G.CODIGOGRUPOITINERARIO = I.CODIGOGRUPOITINERARIO');
 Query.SQL.Add('AND I.CODIGOGRUPOTRABAJO ='+qAdministrativoCODIGOGRUPOTRABAJO.AsString+' ');
 Query.SQL.Add('AND I.CODIGOADMINISTRATIVO ='+qAdministrativoCODIGOADMINISTRATIVO.AsString+'  ');
 Query.SQL.Add('AND CODIGODIAL=(SELECT CODIGODIAL FROM SGC_ITINERARIO I, SGC_GRUPOITINERARIO G , C_GRUPOAOL C');
 Query.SQL.Add('WHERE');
 Query.SQL.Add('C.CODIGOGRUPOAOL = G.CODIGOGRUPOAOL');
 Query.SQL.Add('AND G.CODIGOGRUPOITINERARIO = I.CODIGOGRUPOITINERARIO');
 Query.SQL.Add('AND I.CODIGOITINERARIO='+qItinerariosCODIGOITINERARIO.AsString+' )   ');
 Query.Open;

 if ((Query.FieldByName('SUMA').AsInteger+qItinerariosCANTIDADSUMINISTROS.AsInteger) >StrToInt(LimiteGeneralClientes)) then
 begin
 Result := False;
Application.MessageBox(PChar('No se pueden Asignar más de '+LimiteGeneralClientes+' clientes a un Lector para el mismo día intenta con un lector diferente.'),'Información',MB_OK+MB_ICONINFORMATION+MB_DEFBUTTON2);
 end
 else
 begin
 Result := True;
 //Query.SQL.SaveToFile('D:\sigcom4\Temp\CONSULTA.TXT');
 //ShowMessage(Query.SQL.Text);
 //ShowMessage(Query.FieldByName('SUMA').AsString);
 end;
except
on e : Exception do
begin
Application.MessageBox(PChar('Se debe seleccionar un Lector y un Itinerario para realizar la Asignación. Error :'+e.Message),'Error',MB_OK+MB_ICONERROR+MB_DEFBUTTON2);

end;

end;

Query.Free;
end;

procedure TfAsignacionLectores.SBFiltrarClick(Sender: TObject);
begin

if not (Trim(qDialesCODIGODIAL.AsString) = '') then
 begin
 qItinerarios.CLOSE;
  qItinerarios.SQL.Delete(11);
  qItinerarios.SQL.Insert(11,'AND D.CODIGODIAL='+qDialesCODIGODIAL.AsString+' ');
  qItinerarios.Open;
  qTotalesIti.close;
  qTotalesIti.open;
  lFiltroDatosIti.Caption := ' << FILTRO DE DATOS >>    << ' + IntToStr(qItinerarios.RecordCount)+' Registros  >>';
 end;
end;

procedure TfAsignacionLectores.BitBtnAnularFiltroClick(Sender: TObject);
begin
qItinerarios.CLOSE;
qItinerarios.SQL.Delete(11);
qItinerarios.SQL.Insert(11,'');
qItinerarios.Open;
qTotalesIti.close;
qTotalesIti.open;
 lFiltroDatosIti.Caption := ' << FILTRO DE DATOS >>    << ' + IntToStr(qItinerarios.RecordCount)+' Registros  >>';
end;

end.
