unit uAsignarPresupuesto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, RXDBCtrl;

type
  TfAsignarPresupuesto = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    BBAsignar: TBitBtn;
    BitBtnCerrar: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    dsPresupuesto: TDataSource;
    qPresupuesto: TQuery;
    qPresupuestoCODIGOPRESUPUESTO: TFloatField;
    qPresupuestoNUMEROPRESUPUESTO: TStringField;
    qPresupuestoFECHAPRESUPUESTO: TDateTimeField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAsignarPresupuesto: TfAsignarPresupuesto;

implementation

{$R *.DFM}

procedure TfAsignarPresupuesto.FormCreate(Sender: TObject);
begin
  qPresupuesto.open;
end;

end.
