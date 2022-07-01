unit uSeleccionarObservacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uListaSimple, Db, DBTables, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl,
  ExtCtrls, DBCtrls;

type
  TfSeleccionarObservacion = class(TfListaSimple)
    GroupBox1: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    qDatosCODIGOOBSERVACIONCRITICA: TFloatField;
    qDatosNOMBREOBSERVACIONCRITICA: TStringField;
    qDatosACTIVO: TStringField;
    procedure SBFiltrarClick(Sender: TObject);
    procedure dbgDatosTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSeleccionarObservacion: TfSeleccionarObservacion;

implementation

{$R *.DFM}

procedure TfSeleccionarObservacion.SBFiltrarClick(Sender: TObject);
var
 i:integer;
begin
end;

procedure TfSeleccionarObservacion.dbgDatosTitleClick(Column: TColumn);
begin
 //
end;


procedure TfSeleccionarObservacion.FormCreate(Sender: TObject);
begin
  inherited;
qDatos.Close;
qDatos.Open;
DBLookupComboBox1.KeyValue := qDatosCODIGOOBSERVACIONCRITICA.AsString;
end;

end.
