unit uListaClienteSgdOdt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uListaDatos, Db, DBTables, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl,
  ExtCtrls;

type
  TfListaClienteSgdOdt = class(TfListaDatos)
    qDatosCODIGOCLIENTESGD: TFloatField;
    qDatosCODIGO_CUENTA: TFloatField;
    qDatosCODIGOCONTADOR: TStringField;
    qDatosCODIGOCOMERCIALIZADOR: TStringField;
    qDatosESTRATO: TStringField;
    qDatosFACTURACION: TStringField;
    qDatosULTIMOCONSUMO: TFloatField;
    qDatosDIRCLIENTE: TMemoField;
    qDatosNOMBRESUSCRIPTOR: TStringField;
    qDatosNOMBREOBSERVACION: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fListaClienteSgdOdt: TfListaClienteSgdOdt;

implementation

{$R *.DFM}

end.
 