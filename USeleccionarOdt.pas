unit USeleccionarOdt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uListaSimple, Db, DBTables, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl,
  ExtCtrls;

type
  TfSeleccionarOdt = class(TfListaSimple)
    qDatosCODIGOODT: TFloatField;
    qDatosCODIGOADMINISTRATIVO: TFloatField;
    qDatosNOMBRECATEGORIA: TStringField;
    qDatosMOTIVOS: TMemoField;
    qDatosMotivosCalculado: TStringField;
    procedure qDatosCalcFields(DataSet: TDataSet);
    procedure SBFiltrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSeleccionarOdt: TfSeleccionarOdt;

implementation

{$R *.DFM}

procedure TfSeleccionarOdt.qDatosCalcFields(DataSet: TDataSet);
begin
  inherited;
  qDatosMotivosCalculado.AsString:=qDatosMOTIVOS.AsString;
end;

procedure TfSeleccionarOdt.SBFiltrarClick(Sender: TObject);
var
 i:integer;
begin
  qDatos.close;
  for i :=0  to qDatos.sql.count-5 do
  begin
    qDatos.SQL.Delete(3);
  end;
  i:=3;
  if EdCodigo.Text <> '' then
  begin
   qDatos.SQL.Insert(i,'AND O.CODIGOODT LIKE ''%'+EdCodigo.Text+'%''');
   inc(i);
  end;
  if EdCodigo2.Text <> '' then
  begin
     qDatos.SQL.Insert(i,'AND O.CODIGOADMINISTRATIVO ='+EdCodigo2.Text);
   inc(i);
  end;
  if EdNombre.Text <> '' then
  begin
    qDatos.SQL.Insert(i,'AND O.MOTIVOS LIKE ''%'+EdNombre.Text+'%''');
    inc(i);
  end;
  qDatos.Open;
end;

end.
