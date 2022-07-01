unit uEstadisticaReporteEstado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uEstadisticasBase, Menus, mxDB, Db, DBTables, mxtables, mxstore,
  StdCtrls, Buttons, Spin, ExtCtrls, Grids, mxgrid, mxpivsrc, TeeProcs,
  TeEngine, Chart, mxgraph, utnToolbar;

type
  TfEstadisticaReporteEstado = class(TfEstadisticasBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEstadisticaReporteEstado: TfEstadisticaReporteEstado;

implementation

{$R *.DFM}

end.
