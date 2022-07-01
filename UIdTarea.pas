unit UIdTarea;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Grids, StdCtrls, Calendar, Buttons, ComCtrls, ExtCtrls,ConsDll, DBCtrls, Db,DBTables;

type
    TIdTarea = class (TObject)
  private
         CodigoMantenimiento:Real;
  public
    constructor Crear(PanelHora:TPanel; HoraPanel,codopera:Integer; CodigoMant:Real; NombreActividad,HoraActividad:String);
    destructor Destruir();
    procedure PanelActividadClick(Sender:TObject);
    procedure PanelActividadDobleClick(Sender:TObject);
  end;

implementation

uses UCronograma,UMantenimiento;
//******************************************************************************
constructor TIdTarea.Crear(PanelHora:TPanel; HoraPanel,codopera:Integer; CodigoMant:Real; NombreActividad,HoraActividad:String);
var
   PanelActividad:TPanel;
   query1,query2 :TQuery;
   colorPanel:string;
begin
  query2:=TQuery.Create(Application);
  query2.DatabaseName:='Basedato';
  if query2.Active then
    query2.close;
  query2.SQL.Add('Select codigoareaoperacionodt,color from areaoperacionodt where codigoareaoperacionodt='+ inttostr(codopera));
  query2.Open;
  if (query2.Fields[1].AsString)='' then
  begin
    colorPanel:='$00FF8080';
  end
  else
  begin
    colorPanel:= query2.Fields[1].AsString;
  end;

  inherited Create;
  CodigoMantenimiento:=CodigoMant;
  PanelActividad:=TPanel.Create(PanelHora);
  PanelActividad.BorderStyle:=BsSingle;
  PanelActividad.Font.Size:=5;
  PanelActividad.Font.Name:='Tahoma';
  PanelActividad.Font.Style:=[fsBold];
  PanelActividad.Font.Color:=clWhite;
  PanelActividad.Caption:=NombreActividad;
  PanelActividad.BevelOuter:=BvRaised;
  PanelActividad.Cursor:= crHandPoint;
  PanelActividad.Color:=StringToColor(colorPanel);
  PanelActividad.Ctl3D:=False;
  PanelActividad.Left:=0;
  PanelActividad.Top:=16*(HoraPanel);
  PanelActividad.Width:=120;
  PanelActividad.Height:=16;
  PanelHora.InsertControl(PanelActividad);
  PanelActividad.Parent:=PanelHora;
  PanelActividad.OnClick:=nil;
  PanelActividad.OnDblClick:=PanelActividadDobleClick;
  query2.Free;
end;
//******************************************************************************
destructor TIdTarea.Destruir();
begin
     inherited
end;
//******************************************************************************
procedure TIdTarea.PanelActividadClick(Sender:TObject);
begin
     (((Sender as TPanel).Parent)as TPanel).SetFocus;
end;
//******************************************************************************
procedure TIdTarea.PanelActividadDobleClick(Sender: TObject);
begin
     FMantenimiento:=TFMantenimiento.editar(nil,CodigoMantenimiento,0);
     FMantenimiento.ShowModal;
     FMantenimiento.Free;
end;
//******************************************************************************
end.
