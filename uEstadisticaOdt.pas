unit uEstadisticaOdt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uEstadisticasBase, Menus, mxDB, Db, DBTables, mxtables, mxstore,
  StdCtrls, Buttons, Spin, ExtCtrls, Grids, mxgrid, mxpivsrc, TeeProcs,
  TeEngine, Chart, mxgraph, utnToolbar, Series;

type
  TFEstadisticaOdt = class(TfEstadisticasBase)
    Series2: TBarSeries;
    Series6: TBarSeries;
    Series7: TBarSeries;
    Series12: TBarSeries;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
  public
  end;
  TActividad=class
  private
    fNombreTabla : string;
    procedure SetNombreTabla(aValor: string);
    function  GetNombreTabla: string;
  public
    Query : TQuery;
    procedure CrearTabla(ListaFiltro:TStringList);
    procedure EliminarTabla;
    function ExisteTabla:boolean;
    property  NombreTabla: string read GetNombreTabla write SetNombreTabla;
    constructor Create(aNombreTabla:string);
    destructor  Destroy;
  end;

var
  FEstadisticaOdt: TFEstadisticaOdt;

implementation

{$R *.DFM}

{ TActividad }

procedure TActividad.CrearTabla(ListaFiltro: TStringList);
var i:Integer;
begin
  EliminarTabla;
  Query.Close;
  with Query.SQL do
  begin
    Clear;
    Add('INSERT INTO ' + NombreTabla);
    Add('SELECT ODA.CODIGOODT,ODA.CONSECUTIVO,ODA.CODIGONIVELTENSION,NT.TENSION,ODA.CODIGOODTOPERA,');
    Add('OO.NOMBREODTOPERA,ODA.CODIGOODTACTIVIDAD,OA.NOMBREODTACTIVIDAD');
    Add('FROM ODTDETALLEACTIVIDAD ODA,NIVELTENSION NT,ODTOPERA OO,ODTACTIVIDAD OA,ODT O,  ODTDIA OD');
    Add('WHERE (O.CODIGOODT(+)=ODA.CODIGOODT)');
    Add('AND(O.CODIGOODT = OD.CODIGOODT)');
    Add('AND(OD.CONSECUTIVO(+)= ODA.CONSECUTIVO)');
    Add('AND(ODA.CODIGONIVELTENSION=OA.CODIGONIVELTENSION) ');
    Add('AND(ODA.CODIGOODTOPERA=OA.CODIGOODTOPERA)');
    Add('AND(ODA.CODIGOODTACTIVIDAD=OA.CODIGOODTACTIVIDAD)');
    Add('AND(ODA.CODIGONIVELTENSION=NT.CODIGONIVELTENSION)');
    Add('AND(ODA.CODIGOODTOPERA=OO.CODIGOODTOPERA)');
    if ListaFiltro<>nil then
    begin
      for i:=0 to ListaFiltro.Count - 1 do
        Add(ListaFiltro[i]);
    end;
    Query.ExecSQL;
  end;
end;

constructor TActividad.Create(aNombreTabla: string);
begin
  inherited Create;
  NombreTabla := UpperCase(aNombreTabla);
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
end;

destructor TActividad.Destroy;
begin
  Query.Close;
  Query.Free;
  inherited Destroy;  
end;

procedure TActividad.EliminarTabla;
begin
  if ExisteTabla then
  begin
    if NombreTabla <> '' then
    begin
      Query.close;
      Query.SQL.Clear;
      Query.SQL.Text := 'DELETE FROM ' + NombreTabla;
      try
        Query.ExecSQL;
        Query.ApplyUpdates;
        Query.CommitUpdates;
      except
      end;
    end;
  end;
end;

function TActividad.ExisteTabla: boolean;
begin
  result:=false;
  with Query.SQL do
  begin
    Query.Close;
    Clear;
    Add('select count(*) from all_tables where table_name='''+UpperCase(NombreTabla)+'''');
    Query.open;
    if Query.Fields[0].AsInteger<>0 then result:=true;
  end;
end;

function TActividad.GetNombreTabla: string;
begin
  Result := fNombreTabla;
end;

procedure TActividad.SetNombreTabla(aValor: string);
begin
  if fNombreTabla <> aValor then
    fNombreTabla := aValor;
end;

procedure TFEstadisticaOdt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:=caFree;
end;

procedure TFEstadisticaOdt.FormShow(Sender: TObject);
begin
  inherited;
    DecisionGraph1.Title.Text.Clear;
    DecisionGraph1.Title.Text.Add('Cantidad de Actividades');
end;

end.
