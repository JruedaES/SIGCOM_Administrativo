unit uSeleccionarGrupoTrabajo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uListaDatos, Db, DBTables, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl,
  ExtCtrls;

type
  TfSeleccionarGrupoTrabajo = class(TfListaDatos)
    qDatosCODIGOADMINISTRATIVO: TFloatField;
    qDatosCODIGOGRUPOTRABAJO: TFloatField;
    qDatosNOMBREGRUPOTRABAJO: TStringField;
    procedure SBFiltrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSeleccionarGrupoTrabajo: TfSeleccionarGrupoTrabajo;

implementation

{$R *.DFM}

procedure TfSeleccionarGrupoTrabajo.SBFiltrarClick(Sender: TObject);
var swhere:string;
 i:integer;
 entro:boolean;
begin
  qDatos.close;
  for i :=0  to qDatos.sql.count-2 do
  begin
    qDatos.SQL.Delete(1);
  end;
  i:=1;
  entro:=false;
  if EdCodigo.Text <> '' then
  begin
   qDatos.SQL.Insert(i,'WHERE CODIGOADMINISTRATIVO = '+EdCodigo.Text);
   entro:=true;
   inc(i);
  end;
  if EdCodigo2.Text <> '' then
  begin
   if entro then
     qDatos.SQL.Insert(i,'AND CODIGOGRUPOTRABAJO ='+EdCodigo2.Text)
   else
     qDatos.SQL.Insert(i,'WHERE CODIGOGRUPOTRABAJO ='+EdCodigo2.Text);
   entro:=true;
   inc(i);
  end;
  if EdNombre.Text <> '' then
  begin
    if entro then
      qDatos.SQL.Insert(i,'AND NOMBREGRUPOTRABAJO LIKE ''%'+EdNombre.Text+'%''')
    else
      qDatos.SQL.Insert(i,'WHERE NOMBREGRUPOTRABAJO LIKE ''%'+EdNombre.Text+'%''');
    inc(i);
  end;
  qDatos.Open;
end;

end.
