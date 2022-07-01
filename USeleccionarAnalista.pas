unit USeleccionarAnalista;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uListaSimple, Db, DBTables, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl,
  ExtCtrls;

type
  TfSeleccionarAnalista = class(TfListaSimple)
    qDatosCODIGOANALISTA: TFloatField;
    qDatosNOMBREANALISTA: TStringField;
    qDatosACTIVO: TStringField;
    qDatosCODIGOUSUARIO: TFloatField;
    qDatosCODIGOSEDEOPERATIVA: TFloatField;
    procedure SBFiltrarClick(Sender: TObject);
    procedure dbgDatosTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSeleccionarAnalista: TfSeleccionarAnalista;

implementation

{$R *.DFM}

procedure TfSeleccionarAnalista.SBFiltrarClick(Sender: TObject);
var
 i:integer;
begin
end;

procedure TfSeleccionarAnalista.dbgDatosTitleClick(Column: TColumn);
begin
 //
end;

end.
