unit uFirmaPresupuesto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCtrls, Buttons, ExtCtrls, DBTables, Db;

type
  TfFirmaPresupuesto = class(TForm)
    DBNavigator1: TDBNavigator;
    dbgFirma: TDBGrid;
    qFirma: TQuery;
    dsFirma: TDataSource;
    updFirma: TUpdateSQL;
    qEmpleado: TQuery;
    qFirmaNombreEmpleado: TStringField;
    qFirmaCargoEmpleado: TStringField;
    qDocumento: TQuery;
    qFirmaNombreDocumento: TStringField;
    qFirmaCODIGOPRESUPUESTO: TFloatField;
    qFirmaCODIGOEMPLEADO: TFloatField;
    qFirmaCODIGOCARGO: TFloatField;
    qFirmaCODIGODOCUMENTO: TStringField;
    procedure qFirmaAfterDelete(DataSet: TDataSet);
    procedure qFirmaAfterPost(DataSet: TDataSet);
    procedure qFirmaAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFirmaPresupuesto: TfFirmaPresupuesto;

implementation

{$R *.DFM}

procedure TfFirmaPresupuesto.qFirmaAfterDelete(DataSet: TDataSet);
begin
  qFirma.ApplyUpdates;
  qFirma.CommitUpdates;
end;

procedure TfFirmaPresupuesto.qFirmaAfterPost(DataSet: TDataSet);
begin
  qFirma.ApplyUpdates;
  qFirma.CommitUpdates;
end;

procedure TfFirmaPresupuesto.qFirmaAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('Codigopresupuesto').AsString:=qFirma.parambyname('CodigoPresupuesto').AsString;
end;

end.
