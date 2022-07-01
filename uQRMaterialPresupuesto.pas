unit uQRMaterialPresupuesto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uQRBase, Qrctrls, quickrpt, ExtCtrls,uFuncionSGD, Db, DBTables, jpeg;

type
  TfQRMaterialPresupuesto = class(TFQRBase)
    QRDBText3: TQRDBText;
    QRDBTCantidad: TQRDBText;
    QRDBTValoru: TQRDBText;
    QRShape16: TQRShape;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel14: TQRLabel;
    QRNombreEstructura: TQRLabel;
    QRShape22: TQRShape;
    QRShape9: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape23: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel25: TQRLabel;
    QRShape13: TQRShape;
    QRShape18: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    qMaterialPresupuesto: TQuery;
    QRGroup2: TQRGroup;
    QRDBText22: TQRDBText;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRDBText23: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText24: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText25: TQRDBText;
    bfObra: TQRBand;
    QRShape21: TQRShape;
    QRShape24: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    qMaterialPresupuestoCODIGOMATERIALPRESUPUESTOOBRA: TFloatField;
    qMaterialPresupuestoCODIGOPRESUPUESTO: TFloatField;
    qMaterialPresupuestoCODIGOPRESUPUESTOOBRA: TFloatField;
    qMaterialPresupuestoCODIGOMATERIAL: TFloatField;
    qMaterialPresupuestoCANTIDADPRESUPUESTADA: TFloatField;
    qMaterialPresupuestoVALORPRESUPUESTADO: TFloatField;
    qMaterialPresupuestoCODIGOACTIVIDADPRESUPUESTOOBRA: TFloatField;
    qMaterialPresupuestoNOMBREMATERIAL: TStringField;
    qMaterialPresupuestoPESOUNITARIO: TFloatField;
    qMaterialPresupuestoNOMBREGEOGRAFICO: TStringField;
    qMaterialPresupuestoNOMBREMUNICIPIO: TMemoField;
    qMaterialPresupuestoINDICEDIFICULTAD: TFloatField;
    qMaterialPresupuestoURBANO: TStringField;
    ChildBand1: TQRChildBand;
    QRLabel27: TQRLabel;
    QRShape25: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel15: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape33: TQRShape;
    dsMaterialPresupuesto: TDataSource;
    qMaterialPresupuestoCODIGOUNIDAD: TStringField;
    procedure ColumnHeaderBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickReportAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRMaterialPresupuesto: TfQRMaterialPresupuesto;

implementation


{$R *.DFM}

procedure TfQRMaterialPresupuesto.ColumnHeaderBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  ColumnHeaderBand1.Height :=10;
end;

procedure TfQRMaterialPresupuesto.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  ColumnHeaderBand1.Height :=40;
end;

procedure TfQRMaterialPresupuesto.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  DetailBand1.Height:=20;
end;


procedure TfQRMaterialPresupuesto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfQRMaterialPresupuesto.QuickReportAfterPreview(Sender: TObject);
begin
  close;
end;

end.
