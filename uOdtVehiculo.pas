unit uOdtVehiculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, ExtCtrls;

type
  TFOdtVehiculo = class(TForm)
    DBGridOdtVehiculo: TDBGrid;
    Panel1: TPanel;
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOdtVehiculo: TFOdtVehiculo;

implementation

{$R *.DFM}

end.
