unit uQRMaterialContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uQRBase, Qrctrls, quickrpt, ExtCtrls,uFuncionSGD, Db, DBTables, jpeg;

type
  TfQRMaterialContrato = class(TFQRBase)
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
    qMaterialContrato: TQuery;
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
    ChildBand1: TQRChildBand;
    QRLabel27: TQRLabel;
    qMaterialContratoCODIGOMATERIALCONTRATOOBRA: TFloatField;
    qMaterialContratoCODIGOCONTRATO: TFloatField;
    qMaterialContratoCODIGOCONTRATOOBRA: TFloatField;
    qMaterialContratoCODIGOMATERIAL: TFloatField;
    qMaterialContratoCANTIDADSOLICITADA: TFloatField;
    qMaterialContratoCANTIDADENTREGADA: TFloatField;
    qMaterialContratoCANTIDADCONSUMIDA: TFloatField;
    qMaterialContratoCANTIDADREINTEGRADABUENA: TFloatField;
    qMaterialContratoCANTIDADREINTEGRADAMALA: TFloatField;
    qMaterialContratoCANTIDADRETIRADABUENA: TFloatField;
    qMaterialContratoCANTIDADRETIRADAMALA: TFloatField;
    qMaterialContratoVALORPRESUPUESTADO: TFloatField;
    qMaterialContratoCODIGOACTIVIDADCONTRATOOBRA: TFloatField;
    qMaterialContratoVALORUNITARIO: TFloatField;
    qMaterialContratoNOMBREMATERIAL: TStringField;
    qMaterialContratoPESOUNITARIO: TFloatField;
    qMaterialContratoNOMBREUNIDAD: TStringField;
    qMaterialContratoCODIGOGEOGRAFICO: TFloatField;
    qMaterialContratoNOMBREGEOGRAFICO: TStringField;
    qMaterialContratoNOMBREMUNICIPIO: TMemoField;
    qMaterialContratoINDICEDIFICULTAD: TFloatField;
    qMaterialContratoURBANO: TStringField;
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
    qMaterialContratoVALORCONSUMIDO: TFloatField;
    qMaterialContratoVALORENTREGADO: TFloatField;
    qMaterialContratoVALORREINTEGRADO: TFloatField;
    procedure ColumnHeaderBand1AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
    procedure ColumnHeaderBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickReportAfterPreview(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRMaterialContrato: TfQRMaterialContrato;

implementation


{$R *.DFM}

procedure TfQRMaterialContrato.ColumnHeaderBand1AfterPrint(
  Sender: TQRCustomBand; BandPrinted: Boolean);
begin
  ColumnHeaderBand1.Height := 50;
end;

procedure TfQRMaterialContrato.ColumnHeaderBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  ColumnHeaderBand1.Height := 50;
end;

procedure TfQRMaterialContrato.DetailBand1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  DetailBand1.Height:= 50;
end;


procedure TfQRMaterialContrato.QuickReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
//
end;

procedure TfQRMaterialContrato.QuickReportAfterPreview(Sender: TObject);
begin
  close;
end;

procedure TfQRMaterialContrato.FormCreate(Sender: TObject);
begin
//
end;

procedure TfQRMaterialContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

end.
 