unit uFirmaContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, DBCtrls, Buttons, ExtCtrls, DBTables, Db;

type
  TfFirmaContrato = class(TForm)
    DBNavigator1: TDBNavigator;
    dbgFirma: TDBGrid;
    qFirma: TQuery;
    dsFirma: TDataSource;
    updFirma: TUpdateSQL;
    qEmpleado: TQuery;
    qFirmaCODIGOCONTRATO: TFloatField;
    qFirmaCODIGOEMPLEADO: TFloatField;
    qFirmaCODIGOCARGO: TFloatField;
    qFirmaNombreEmpleado: TStringField;
    qFirmaCargoEmpleado: TStringField;
    qFirmaCODIGODOCUMENTO: TStringField;
    qDocumento: TQuery;
    qFirmaNombreDocumento: TStringField;
    procedure qFirmaAfterDelete(DataSet: TDataSet);
    procedure qFirmaAfterPost(DataSet: TDataSet);
    procedure qFirmaAfterInsert(DataSet: TDataSet);
    procedure qFirmaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFirmaContrato: TfFirmaContrato;

implementation

{$R *.DFM}

procedure TfFirmaContrato.qFirmaAfterDelete(DataSet: TDataSet);
begin
  qFirma.ApplyUpdates;
  qFirma.CommitUpdates;
end;

procedure TfFirmaContrato.qFirmaAfterPost(DataSet: TDataSet);
begin
  qFirma.ApplyUpdates;
  qFirma.CommitUpdates;
end;

procedure TfFirmaContrato.qFirmaAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('CodigoContrato').AsString:=qFirma.parambyname('CodigoContrato').AsString;
end;

procedure TfFirmaContrato.qFirmaBeforePost(DataSet: TDataSet);
begin
  if (qFirmaCODIGOEMPLEADO.AsString='') then
    raise Exception.Create('Debe ingresar el empleado que firma el documento');

  if (qFirmaCODIGODOCUMENTO.AsString='') then
    raise Exception.Create('Debe ingresar el documento que se firma.');
end;

end.
