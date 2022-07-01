unit uQRActividadPresupuesto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uQRBase, Qrctrls, quickrpt, ExtCtrls, Db, DBTables, jpeg;

type
  TfQRActividadPresupuesto = class(TFQRBase)
    QRShape8: TQRShape;
    QRLabel3: TQRLabel;
    QRShape9: TQRShape;
    QRLabel6: TQRLabel;
    QRShape10: TQRShape;
    QRLabel7: TQRLabel;
    QRShape11: TQRShape;
    QRLabel8: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRLabel9: TQRLabel;
    QRDBTCantidad: TQRDBText;
    qActividadPresupuesto: TQuery;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRGroup1: TQRGroup;
    QRDBText3: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel19: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText6: TQRDBText;
    bfObra: TQRBand;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel11: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRExpr8: TQRExpr;
    dsActividadPresupuesto: TDataSource;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    qActividadPresupuestoCODIGOACTIVIDADPRESUPUESTO: TFloatField;
    qActividadPresupuestoCODIGOACTIVIDAD: TStringField;
    qActividadPresupuestoCODIGOPRESUPUESTO: TFloatField;
    qActividadPresupuestoCODIGOPRESUPUESTOOBRA: TFloatField;
    qActividadPresupuestoCANTIDADPRESUPUESTADA: TFloatField;
    qActividadPresupuestoMATERIAL: TFloatField;
    qActividadPresupuestoTRANSPORTE: TFloatField;
    qActividadPresupuestoEQUIPO: TFloatField;
    qActividadPresupuestoMANOOBRA: TFloatField;
    qActividadPresupuestoNOMBREGEOGRAFICO: TStringField;
    qActividadPresupuestoNOMBREMUNICIPIO: TMemoField;
    qActividadPresupuestoINDICEDIFICULTAD: TFloatField;
    qActividadPresupuestoCODIGOGEOGRAFICO: TFloatField;
    qActividadPresupuestoNOMBREACTIVIDADPRESUPUESTO: TStringField;
    procedure QuickReportAfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRActividadPresupuesto: TfQRActividadPresupuesto;

implementation
uses uContrato;
{$R *.DFM}

procedure TfQRActividadPresupuesto.QuickReportAfterPreview(
  Sender: TObject);
begin
  close;
end;

procedure TfQRActividadPresupuesto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
