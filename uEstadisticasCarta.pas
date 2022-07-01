unit uEstadisticasCarta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uEstadisticasBase, Menus, mxDB, Db, DBTables, mxtables, mxstore,
  StdCtrls, Buttons, Spin, ExtCtrls, Grids, mxgrid, mxpivsrc, TeeProcs,
  TeEngine, Chart, mxgraph, utnToolbar;

type
  TfEstadisticasCarta = class(TfEstadisticasBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fEstadisticasCarta: TfEstadisticasCarta;

implementation

{$R *.DFM}

end.
