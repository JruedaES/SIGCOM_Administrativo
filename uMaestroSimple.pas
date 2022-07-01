unit uMaestroSimple;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, DBTables, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl,
  ExtCtrls, DBCtrls, uListaSimple, uSeleccionarImpresionCobro, ComCtrls;

type
  TfMaestroSimple = class(TfListaSimple)
    DBNavigator1: TDBNavigator;
    updDatos: TUpdateSQL;
    procedure qActividadOdtAfterPost(DataSet: TDataSet);
    procedure qDatosAfterPost(DataSet: TDataSet);
    procedure qDatosAfterDelete(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMaestroSimple: TfMaestroSimple;

implementation

{$R *.DFM}

procedure TfMaestroSimple.qActividadOdtAfterPost(DataSet: TDataSet);
begin
  inherited;
  qDatos.ApplyUpdates;
  qDatos.CommitUpdates;
end;

procedure TfMaestroSimple.qDatosAfterPost(DataSet: TDataSet);
begin
  inherited;
  qDatos.ApplyUpdates;
  qDatos.CommitUpdates;
end;

procedure TfMaestroSimple.qDatosAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qDatos.ApplyUpdates;
  qDatos.CommitUpdates;
end;

procedure TfMaestroSimple.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action:=cafree;
end;

end.
 