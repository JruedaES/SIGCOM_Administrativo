unit uEstadisticaAdministrativo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uEstadisticasBase, Menus, mxDB, Db, DBTables, mxtables, mxstore,
  StdCtrls, Buttons, Spin, ExtCtrls, Grids, mxgrid, mxpivsrc, TeeProcs,
  TeEngine, Chart, mxgraph, utnToolbar, Series;

type
  TfEstadisticaAdministrativo = class(TfEstadisticasBase)
    qEstadistica: TQuery;
    Series1: TBarSeries;
    Series2: TBarSeries;               
    Series3: TBarSeries;
    Series5: TBarSeries;
    Series6: TBarSeries;
    Series7: TBarSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEstadisticaAdministrativo: TfEstadisticaAdministrativo;

implementation

{$R *.DFM}

end.
