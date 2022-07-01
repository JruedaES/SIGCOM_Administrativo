unit uQRBalanceMaterialDependencia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Qrctrls, QuickRpt, ExtCtrls, UBase;

type
  TfQRBalanceMaterialDependencia = class(TForm)
    QuickReport: TQuickRep;
    TitleBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    qrdbNombreEmpresa: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel50: TQRLabel;
    QRShape5: TQRShape;
    QRLabel1: TQRLabel;
    qrsDatosFiltro: TQRShape;
    qrmRotulos1: TQRMemo;
    qrsFiltrodatos: TQRShape;
    qrlFiltroDatos: TQRLabel;
    qrmDatos1: TQRMemo;
    qrmPuntos1: TQRMemo;
    qrmRotulos2: TQRMemo;
    qrmPuntos2: TQRMemo;
    qrmDatos2: TQRMemo;
    qrTitulo: TQRLabel;
    QRGroupFooterMoviles: TQRBand;
    QRBand2: TQRBand;
    qrlDependencia: TQRLabel;
    QRBand3: TQRBand;
    QRSysData1: TQRSysData;
    qBalance: TQuery;
    tEmpresaLogo: TTable;
    qEmpresa: TQuery;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    qBalanceCODIGOMATERIAL: TFloatField;
    qBalanceNOMBREMATERIAL: TStringField;
    qBalanceCODIGOUNIDAD: TStringField;
    qBalanceCANTIDADENTREGADA: TFloatField;
    qBalanceCANTIDADCONSUMIDA: TFloatField;
    qBalanceCANTIDADCONSUMIDADESMANTELADA: TFloatField;
    qBalanceCANTIDADRETIRADABUENA: TFloatField;
    qBalanceCANTIDADRETIRADAMALA: TFloatField;
    qBalanceCANTIDADREINTEGRADABUENA: TFloatField;
    qBalanceCANTIDADREINTEGRADAMALA: TFloatField;
    qBalanceCANTIDADREINTEGRADABUENADESMAN: TFloatField;
    qBalanceCANTIDADREINTEGRADAMALADESMAN: TFloatField;
    qBalanceCANTIDADTRASLADONUEVA: TFloatField;
    qBalanceCANTIDADTRASLADODESMAN: TFloatField;
    qBalanceBALANCENUEVO: TFloatField;
    qBalanceBALANCEDESMANTELADO: TFloatField;
    QRDBText17: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickReportAfterPreview(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRBalanceMaterialDependencia: TfQRBalanceMaterialDependencia;

implementation

{$R *.DFM}

procedure TfQRBalanceMaterialDependencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tEmpresaLogo.Close;
  qEmpresa.Close;
  qBalance.Close;
  Action := caFree;
end;

procedure TfQRBalanceMaterialDependencia.QuickReportAfterPreview(
  Sender: TObject);
begin
  Close;
  beep;
end;

procedure TfQRBalanceMaterialDependencia.FormShow(Sender: TObject);
begin
  QuickReport.Preview;
end;

end.
