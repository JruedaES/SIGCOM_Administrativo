unit uMantenimientoReprogramado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, StdCtrls, DBCtrls,
  ToolWin, ComCtrls, RXDBCtrl, Mask;

type
  TfMantenimientoReprogramado = class(TForm)
    PanelPrinicipal: TPanel;
    Panel2: TPanel;
    qMantenimientoReprogramado: TQuery;
    dsMantenimientoReprogramado: TDataSource;
    PanelFiltros: TPanel;
    updMantenimientoReprogramado: TUpdateSQL;
    qMantenimientoReprogramadoCODIGOMANTENIMIENTO: TFloatField;
    qMantenimientoReprogramadoMOTIVOREPROGRAMACION: TStringField;
    qMantenimientoReprogramadoCODIGOMTTOREPROGRAMADO: TFloatField;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    eMantenimiento: TEdit;
    Label2: TLabel;
    dbeMotivo: TDBEdit;
    PanelHerramientas: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    qMantenimientoReprogramadoFECHAREPROGRAMACION: TDateTimeField;
    procedure SBSalirClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure qMantenimientoReprogramadoAfterDelete(DataSet: TDataSet);
    procedure qMantenimientoReprogramadoAfterPost(DataSet: TDataSet);
    procedure qMantenimientoReprogramadoAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    codigomtto:integer;
    constructor crear(AOwner: TComponent);
  end;

var
  fMantenimientoReprogramado: TfMantenimientoReprogramado;

implementation

uses ubancomantenimiento, ConsDll;

{$R *.DFM}

constructor TfMantenimientoReprogramado.crear(AOwner: TComponent);
begin
  inherited Create(Owner);
end;

procedure TfMantenimientoReprogramado.SBSalirClick(Sender: TObject);
begin
 ModalResult:= mrOk;
end;

procedure TfMantenimientoReprogramado.SpeedButton1Click(Sender: TObject);
begin
   qMantenimientoReprogramado.Post;
   close;
end;

procedure TfMantenimientoReprogramado.qMantenimientoReprogramadoAfterDelete(
  DataSet: TDataSet);
begin
  qMantenimientoReprogramado.ApplyUpdates;
  qMantenimientoReprogramado.CommitUpdates;
end;

procedure TfMantenimientoReprogramado.qMantenimientoReprogramadoAfterPost(
  DataSet: TDataSet);
begin
  qMantenimientoReprogramado.ApplyUpdates;
  qMantenimientoReprogramado.CommitUpdates;
end;

procedure TfMantenimientoReprogramado.qMantenimientoReprogramadoAfterInsert(
  DataSet: TDataSet);
var query:TQuery;
begin
  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  query.SQL.Add('Select max(codigomttoreprogramado) from pm_mantenimientoreprogramado');
  query.Open;
  qMantenimientoReprogramadoCODIGOMTTOREPROGRAMADO.AsInteger:=query.Fields[0].AsInteger+1;
  qMantenimientoReprogramadoCODIGOMANTENIMIENTO.AsInteger:=codigomtto;
  qMantenimientoReprogramadoFECHAREPROGRAMACION.AsString:=DateToStr(Date);
end;

procedure TfMantenimientoReprogramado.FormShow(Sender: TObject);
begin
  qMantenimientoReprogramado.insert;
end;

end.
