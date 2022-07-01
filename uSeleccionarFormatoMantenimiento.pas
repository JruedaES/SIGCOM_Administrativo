unit uSeleccionarFormatoMantenimiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBuscarDatos, AppEvent, Db, DBTables, Digisoft, Menus, Grids, DBGrids,
  RXDBCtrl, Buttons, StdCtrls, ExtCtrls;

type
  TfSeleccionarFormatoMantenimiento = class(TfBuscarDatos)
    qDatosCODIGOFORMATOMTTO: TFloatField;
    qDatosNOMBREFORMATOMTTO: TStringField;
    qDatosCODIGOMANTENIMIENTO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSeleccionarFormatoMantenimiento: TfSeleccionarFormatoMantenimiento;

implementation

{$R *.DFM}

end.
