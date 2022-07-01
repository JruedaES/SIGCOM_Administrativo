unit uListaElementoODT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, Grids, DBGrids, RXDBCtrl, UTrCVS, DBTables, Db, Digisoft,
  StdCtrls, ExtCtrls, UtdNavigator, Buttons;

type
  TFListaElementoODT = class(TFdSgdListaBase)
    RxDBGrid1: TRxDBGrid;
    qElementos: TQuery;
    qElementosCODIGOODT: TFloatField;
    qElementosCONSECUTIVO: TFloatField;
    qElementosCODIGOTIPOELEMENTO: TStringField;
    qElementosCLAVE1: TFloatField;
    qElementosCLAVE2: TStringField;
    qElementosCODIGOESTRUCTURA: TFloatField;
    qElementosNOMBRETIPOELEMENTO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FListaElementoODT: TFListaElementoODT;

implementation

{$R *.DFM}

end.
