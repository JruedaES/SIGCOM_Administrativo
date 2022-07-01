unit uSeleccionarSeccionMantenimiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uBuscarDatos, AppEvent, Db, DBTables, Digisoft, Menus, Grids, DBGrids,
  RXDBCtrl, Buttons, StdCtrls, ExtCtrls;

type
  TfSeleccionarSeccionMantenimiento = class(TfBuscarDatos)
    qDatosCODIGOFORMATOMTTO: TFloatField;
    qDatosNOMBREFORMATOMTTO: TStringField;
    qDatosCODIGOSECCIONFORMATO: TFloatField;
    qDatosNOMBRESECCIONFORMATO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSeleccionarSeccionMantenimiento: TfSeleccionarSeccionMantenimiento;

implementation

{$R *.DFM}

end.
