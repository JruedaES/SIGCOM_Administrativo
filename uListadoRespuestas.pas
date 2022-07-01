unit uListadoRespuestas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ComCtrls, ToolWin, ImgList, ExtCtrls, Db,
  DBTables, StdCtrls, DBCtrls;

type
  TfListadoRespuestas = class(TForm)
    Panel1: TPanel;
    ilGeneral: TImageList;
    Panel2: TPanel;
    Panel3: TPanel;
    ToolBar1: TToolBar;
    tbFotografias: TToolButton;
    RxDBGrid1: TRxDBGrid;
    pfotografias: TPanel;
    qListadoGeneral: TQuery;
    dsListadoGeneral: TDataSource;
    DBText1: TDBText;
    qListadoGeneralCODIGOCONSULTA: TFloatField;
    qListadoGeneralCODIGOCUENTA: TFloatField;
    qListadoGeneralPERIODO: TFloatField;
    qListadoGeneralFECHAENCUESTA: TDateTimeField;
    qListadoGeneralCODIGOAMINISTRATIVO: TFloatField;
    qListadoGeneralCODIGOGRUPOTRABAJO: TFloatField;
    qListadoGeneralENCUESTO: TStringField;
    qListadoGeneralVERSION_NAME: TStringField;
    qListadoGeneralVERSION_CODE: TStringField;
    qListadoGeneralRESPUESTA: TStringField;
    qListadoGeneralNOMBRECONSULTA: TMemoField;
    qListadoGeneralCONSULTA: TStringField;
    ToolButton1: TToolButton;
    procedure tbFotografiasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qListadoGeneralAfterScroll(DataSet: TDataSet);
    procedure qListadoGeneralCalcFields(DataSet: TDataSet);
    procedure ToolButton1Click(Sender: TObject);
    procedure RxDBGrid1TitleClick(Column: TColumn);
  private
  Fconsulta : String;
  FPeriodo : String;
  ListaOrden : TStringList;
procedure CargarVistaPreliminar(CodApoyo: string);
  public
  property Periodo : String Read FPeriodo Write FPeriodo;
  property Consulta : String Read FConsulta Write Fconsulta;
   constructor Create(AOwner: TComponent); overload;
   constructor Create(AOwner: TComponent; Periodo, CodigoConsulta : String); overload;
  destructor Destroy; override;
  end;

var
  fListadoRespuestas: TfListadoRespuestas;

implementation

uses uGaleriaPreliminar,  uFIMPAdministrativo,UFiltrarclave;

{$R *.DFM}

procedure TfListadoRespuestas.tbFotografiasClick(Sender: TObject);
begin
  IF tbFotografias.Down = true then
  Begin
    pfotografias.Visible := true;
    CargarVistaPreliminar(qListadoGeneral.fieldByName('CODIGOCUENTA').AsString);
  end
  else
    pfotografias.Visible := False;

end;


procedure TfListadoRespuestas.CargarVistaPreliminar(CodApoyo: string);
var
  CodigoApoyo: string;
  i: integer;
begin
  CodigoApoyo := qListadoGeneral.fieldByName('CODIGOCUENTA').AsString;
  if CodigoApoyo <> '' then
  begin
    fGaleriaPreliminar := TfGaleriaPreliminar.CreateByparametros(Application,
      CodigoApoyo);
    fGaleriaPreliminar.FechaLectura := '';
    fGaleriaPreliminar.Periodo := Periodo;
    fGaleriaPreliminar.TipoDeFoto := '24';
    fGaleriaPreliminar.Consulta :=  qListadoGeneral.fieldByName('CODIGOCONSULTA').AsString;
    fGaleriaPreliminar.BanderaAvisosConsultas := true;
    fGaleriaPreliminar.ManualDock(pfotografias);
    fGaleriaPreliminar.CoolBar3.Bands[0].Text := 'Fotos Consulta';
    fGaleriaPreliminar.Show;
  end;
end;


procedure TfListadoRespuestas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(fGaleriaPreliminar) then
  begin
    fGaleriaPreliminar.Free;
    fGaleriaPreliminar := nil;
  end;
end;

procedure TfListadoRespuestas.qListadoGeneralAfterScroll(
  DataSet: TDataSet);
begin
IF pfotografias.Visible THEN
  BEGIN
    fGaleriaPreliminar := NIL;
    fGaleriaPreliminar.Free;
    CargarVistaPreliminar(qListadoGeneral.fieldByName('CODIGOCUENTA').AsString);
  end;
end;

constructor TfListadoRespuestas.Create(AOwner: TComponent);
begin
      inherited Create(AOwner);
end;

constructor TfListadoRespuestas.Create(AOwner : TComponent;Periodo, CodigoConsulta: String);
begin
    inherited Create(AOwner);
    FPeriodo := Periodo;
    Fconsulta := CodigoConsulta;

    qListadoGeneral.close;
    qListadoGeneral.ParamByName('PERIODO').AsString :=  FPeriodo;
    qListadoGeneral.ParamByName('CODIGOCONSULTA').AsString :=  CodigoConsulta;
    qListadoGeneral.Open;
end;

destructor TfListadoRespuestas.Destroy;
begin

end;

procedure TfListadoRespuestas.qListadoGeneralCalcFields(DataSet: TDataSet);
begin
qListadoGeneralCONSULTA.AsString := qListadoGeneralNOMBRECONSULTA.AsString;
end;

procedure TfListadoRespuestas.ToolButton1Click(Sender: TObject);
var
filtro: TffiltrarClave;
begin
  inherited;
  filtro := TffiltrarClave.Create(Self);
  if filtro.ShowModal = mrOk then
  begin

   IF not qListadoGeneral.IsEmpty then
  begin
   qListadoGeneral.Locate('CODIGOCUENTA',filtro.Edit1.Text,[loCaseInsensitive]);
   end;

  end;

end;

procedure TfListadoRespuestas.RxDBGrid1TitleClick(Column: TColumn);
var
Nombre : String;
begin
  if Column.Field.FieldKind   = fkData then
  begin
  Nombre := 'qListadoGeneral';

    qListadoGeneral.close;
    qListadoGeneral.SQL.Strings[20] := ' ORDER BY '+Column.Field.FieldName+' '+ListaOrden.Values[Nombre+Column.Field.FieldName]+' ';
    qListadoGeneral.open;

  if ListaOrden.Values[Nombre+Column.Field.FieldName] = 'DESC' then
  ListaOrden.Values[Nombre+Column.Field.FieldName] := 'ASC'
  else
  ListaOrden.Values[Nombre+Column.Field.FieldName] := 'DESC';
 end;
end;

end.

