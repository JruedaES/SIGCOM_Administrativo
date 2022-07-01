unit UClausulaContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Grids, DBGrids, ExtCtrls, DBCtrls, StdCtrls, Mask;

type
  TfClausulaContrato = class(TForm)
    qClausula: TQuery;
    dsClausula: TDataSource;
    updClausula: TUpdateSQL;
    dbgClausulas: TDBGrid;
    DBNavigator1: TDBNavigator;
    qCodigo: TQuery;
    qConsecutivo: TQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    GroupBox1: TGroupBox;
    dbTextoClausula: TDBMemo;
    procedure qClausulaAfterPost(DataSet: TDataSet);
    procedure qClausulaAfterDelete(DataSet: TDataSet);
    procedure qClausulaAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fClausulaContrato: TfClausulaContrato;

implementation

{$R *.DFM}

procedure TfClausulaContrato.qClausulaAfterPost(DataSet: TDataSet);
begin
  qClausula.ApplyUpdates;
  qClausula.CommitUpdates;
end;

procedure TfClausulaContrato.qClausulaAfterDelete(DataSet: TDataSet);
begin
  qClausula.ApplyUpdates;
  qClausula.CommitUpdates;
end;

procedure TfClausulaContrato.qClausulaAfterInsert(DataSet: TDataSet);
begin
  qCodigo.close;
  qCodigo.open;
  qConsecutivo.close;
  qConsecutivo.ParamByName('CODIGOCONTRATO').AsString:=qClausula.ParamByName('CODIGOCONTRATO').AsString;
  qConsecutivo.open;
  DataSet.FieldByName('CODIGOCLAUSULACONTRATO').AsInteger:=qCodigo.fields[0].AsInteger+1;
  DataSet.FieldByName('CONSECUTIVO').AsInteger:=qConsecutivo.fields[0].AsInteger+1;
  DataSet.FieldByName('CODIGOCONTRATO').AsString:=qClausula.ParamByName('CODIGOCONTRATO').AsString;
end;

end.
