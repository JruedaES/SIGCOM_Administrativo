unit uBodegaAreainvalida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons, Grids, DBGrids, Mask, ExtCtrls, Db, DBTables;

type
  TfBodegaAreainvalida = class(TForm)
    qBodegaInvalida: TQuery;
    dsBodegaInvalida: TDataSource;
    updBodegaInvalida: TUpdateSQL;
    qArea: TQuery;
    dsArea: TDataSource;
    Panel3: TPanel;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    btAceptar: TBitBtn;
    btCancelar: TBitBtn;
    DBNavigator2: TDBNavigator;
    qAlmacen: TQuery;
    dsAlmacen: TDataSource;
    qBodega: TQuery;
    dsBodega: TDataSource;
    qAlmacenCOD_ALMACEN: TStringField;
    qAreaAREA_AREA: TStringField;
    qBodegaCOD_ALMACEN: TStringField;
    qBodegaCOD_BODEGA: TStringField;
    qBodegaInvalidaCOD_ALMACEN: TStringField;
    qBodegaInvalidaCOD_BODEGA: TStringField;
    qBodegaInvalidaAREA_AREA: TStringField;
    qBodegaInvalidaNombreArea: TStringField;
    qBodegaInvalidaNombreAlmacen: TStringField;
    qBodegaInvalidaNombreBodega: TStringField;
    qAreaAREA_DESCRI: TStringField;
    qAlmacenALMACEN_DESCRI: TStringField;
    qBodegaBODEGA_DESCRI: TStringField;
    procedure qBodegaInvalidaBeforeInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBodegaAreainvalida: TfBodegaAreainvalida;

implementation

{$R *.DFM}

procedure TfBodegaAreainvalida.qBodegaInvalidaBeforeInsert(
  DataSet: TDataSet);
begin
{
qBodegaInvalida.insert;
if qarea2area_area.asstring = '' then
raise Exception.Create('Se debe escoger el area primero.')
else
qBodegaInvalidaAREA_AREA.asstring := qarea2area_area.asstring; }
end;

procedure TfBodegaAreainvalida.FormShow(Sender: TObject);
begin
qBodegaInvalida.open;
end;

procedure TfBodegaAreainvalida.btAceptarClick(Sender: TObject);
begin   
qBodegaInvalida.ApplyUpdates;
qBodegaInvalida.CommitUpdates;
end;

end.
