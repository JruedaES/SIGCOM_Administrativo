unit uQRBalanceMaterialMovilesODT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, ExtCtrls, QuickRpt, DBTables, Db, Qrctrls;

type
  TfQRBalanceMaterialMovilesODT = class(TForm)
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
    tEmpresaLogo: TTable;
    qrGroupHeaderMoviles: TQRGroup;
    QRChildBand1: TQRChildBand;
    QRBand1: TQRBand;
    QRGroupFooterMoviles: TQRBand;
    QRDBText1: TQRDBText;
    qBalance: TQuery;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand2: TQRBand;
    qrlDependencia: TQRLabel;
    QRBand3: TQRBand;
    QRSysData1: TQRSysData;
    qEmpresa: TQuery;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText21: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickReportAfterPreview(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRBalanceMaterialMovilesODT: TfQRBalanceMaterialMovilesODT;

implementation

{$R *.DFM}

procedure TfQRBalanceMaterialMovilesODT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tEmpresaLogo.Close;
  qEmpresa.Close;
  qBalance.Close;
  Action := caFree;
end;

procedure TfQRBalanceMaterialMovilesODT.QuickReportAfterPreview(
  Sender: TObject);
begin
  close;
  beep;
end;

procedure TfQRBalanceMaterialMovilesODT.FormShow(Sender: TObject);
begin
  QuickReport.Preview;
end;

end.
