unit uInformacionContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, Db, DBTables;

type
  TFInformacionContrato = class(TForm)
    GBObjeto: TGroupBox;
    MObjeto: TMemo;
    qBorrarActividades: TQuery;
    qBuscarActividadContrato: TQuery;
    gbUbicacion: TGroupBox;
    qActividadContrato: TQuery;
    updActividadContrato: TUpdateSQL;
    MUbicacion: TMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CrearActividades;
  private
    { Private declarations }
  public
  Contrato :String;

  end;

var
  FInformacionContrato: TFInformacionContrato;

implementation

uses uContratoObra;

{$R *.DFM}

procedure TFInformacionContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CrearActividades;
  fContratoobra.Visible := True;
  fContratoobra.WindowState := wsNormal;
  Action:=caFree;
end;

procedure TFInformacionContrato.CrearActividades;
var i : Integer;
    Actividad,TipoPresupuesto : String;
    Estructura : Integer;
    Cantidad : Real;
    query:tquery;
    sl:tstringlist;
begin
  if (Contrato<>'') then
  begin
    query:=TQuery.Create(self);
    query.DatabaseName:='basedato';
    query.sql.clear;
    query.sql.add('select a.codigoestructura,codigoactividad,count(codigoactividad)cantidad from apoyo a,actividad t');
    query.sql.add('where a.CODIGOESTRUCTURA=t.codigoestructura');
    query.sql.add('and t.codigotipoactividad=1');
    query.sql.add('and a.codigocontrato='+Contrato);
    query.sql.add('group by a.codigoestructura,codigoactividad');
    query.open;

    fContratoObra.qActividadContratoObra.close;
    fContratoObra.qActividadContratoObra.open;
    fContratoObra.qActividadContratoObra.First;

//    qBorrarActividades.Close;
//    qBorrarActividades.ParamByName('Contrato').AsString := Contrato;
//    qBorrarActividades.ExecSQL;

    fContratoObra.qActividadContratoObra.close;
    fContratoObra.qActividadContratoObra.Open;
    while not query.eof do
    begin
      Actividad:=query.fieldbyname('codigoactividad').asstring;
      Estructura := query.fieldbyname('codigoestructura').AsInteger;
      TipoPresupuesto := '14';
      Cantidad:=query.fieldbyname('Cantidad').AsFloat;
      fContratoObra.qActividadContratoObra.Open;
      fContratoObra.qActividadContratoObra.First;
      if fContratoObra.qActividadContratoObra.Locate('codigoactividad',actividad,[])then
      begin
        fContratoObra.qActividadContratoObra.Edit;
        Cantidad := fContratoObra.qActividadContratoObra.FieldByName('CANTIDADPRESUPUESTADA').AsFloat+cantidad;
      end
      else
      begin
        fContratoObra.qActividadContratoObra.Insert;
        fContratoObra.qActividadContratoObra.FieldByName('CODIGOACTIVIDAD').AsString := Actividad;
      end;
      fContratoObra.qActividadContratoObraCODIGOTIPOPRESUPUESTO.AsString := TipoPresupuesto;
      fContratoObra.qActividadContratoObraCANTIDADPRESUPUESTADA.AsFloat := Cantidad;
      fContratoObra.qActividadContratoObra.Post;
      query.next;
    end;
  end;
end;

end.
