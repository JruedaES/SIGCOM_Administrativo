unit uVehiculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, RXDBCtrl, Db, DBTables, StdCtrls, Buttons,
  DBCtrls;

type
  TfVehiculo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TRxDBGrid;
    qVehiculo: TQuery;
    dsVehiculo: TDataSource;
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    qVehiculoCODIGOVEHICULO: TStringField;
    qVehiculoCODIGOTIPOVEHICULO: TFloatField;
    qVehiculoCODIGOPROPIETARIO: TStringField;
    qVehiculoCODIGOADMINISTRATIVO: TFloatField;
    qTipoVehiculo: TQuery;
    qPropietario: TQuery;
    qVehiculoNombreTipoVehiculo: TStringField;
    qVehiculoNombrePropietario: TStringField;
    Panel3: TPanel;
    SBFiltrar: TSpeedButton;
    procedure qVehiculoCODIGOVEHICULOSetText(Sender: TField;
      const Text: String);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LimpiarFiltro;
    procedure filtrar;        
  end;

var
  fVehiculo: TfVehiculo;

implementation

uses uFiltroVehiculo;

{$R *.DFM}

procedure TfVehiculo.qVehiculoCODIGOVEHICULOSetText(Sender: TField;
  const Text: String);
begin
  Sender.AsString:=UpperCase(Text);
end;

procedure TfVehiculo.FormCreate(Sender: TObject);
begin
  FFiltroVehiculo:=TFFiltroVehiculo.Create(self);
end;

procedure TfVehiculo.FormDestroy(Sender: TObject);
begin
  FFiltroVehiculo.Free;
end;

procedure TfVehiculo.SBFiltrarClick(Sender: TObject);
begin
  FFiltroVehiculo.LimpiarFiltro;
  filtrar;
end;

procedure TfVehiculo.filtrar;
var Orden:string;
 i:integer;
begin
  if FFiltroVehiculo.ShowModal<>mrOk then
     Exit;
  qvehiculo.Close;
  Orden:=qvehiculo.SQL[qvehiculo.SQL.Count - 1];
  LimpiarFiltro;
  qvehiculo.SQL.Delete(qvehiculo.SQL.Count - 1);
  for i:=0 to FFiltroVehiculo.ListaFiltro.Count - 1 do
  begin
     if i>0 then
       qvehiculo.SQL.Add('AND '+FFiltroVehiculo.ListaFiltro[i])
     else
       qvehiculo.SQL.Add('WHERE '+FFiltroVehiculo.ListaFiltro[i])     
  end;
  qvehiculo.SQL.Add(Orden);
  qvehiculo.Open;
end;

procedure TfVehiculo.LimpiarFiltro;
var i,nLineas:Integer;
begin
  nLineas:=qvehiculo.SQL.Count - 2;
  if nLineas > 0 then
    for i:=1 to nLineas do
       qvehiculo.SQL.Delete(1);
end;

end.
