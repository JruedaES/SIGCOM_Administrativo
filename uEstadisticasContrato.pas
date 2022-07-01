unit uEstadisticasContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uEstadisticasBase, Menus, mxDB, Db, DBTables, mxtables, mxstore,
  StdCtrls, Buttons, Spin, ExtCtrls, Grids, mxgrid, mxpivsrc, TeeProcs,
  TeEngine, Chart, mxgraph, utnToolbar, Series;

type
  TfEstadisticasContrato = class(TfEstadisticasBase)
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Series5: TBarSeries;
    Series6: TBarSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEstadisticasContrato: TfEstadisticasContrato;

implementation

{$R *.DFM}

end.
