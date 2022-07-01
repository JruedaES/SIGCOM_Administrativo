unit uQRAuditoriaStockMoviles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, ExtCtrls, QuickRpt, DBTables, Db, Qrctrls;

type
  TfQRAuditoriaStockMoviles = class(TForm)
    QuickReport: TQuickRep;
    TitleBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    qrdbNombreEmpresa: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel50: TQRLabel;
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
    QRBand1: TQRBand;
    qBalance: TQuery;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRBand2: TQRBand;
    qrlDependencia: TQRLabel;
    QRBand3: TQRBand;
    QRSysData1: TQRSysData;
    qEmpresa: TQuery;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    qEmpleado: TQuery;
    QRShape1: TQRShape;
    ChildBand1: TQRChildBand;
    QRDBText1: TQRDBText;
    QRLCedulas1: TQRLabel;
    qrlNombres1: TQRLabel;
    QRLCedulas2: TQRLabel;
    qrlNombres2: TQRLabel;
    QRShape5: TQRShape;
    QRBand4: TQRBand;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRBand5: TQRBand;
    QRShape25: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qrlRevisaNombre: TQRLabel;
    qrlRevisaCedula: TQRLabel;
    qrlCuadrillanombre1: TQRLabel;
    qrlCuadrillaCedula1: TQRLabel;
    qrlCuadrillanombre2: TQRLabel;
    qrlCuadrillaCedula2: TQRLabel;
    QRSysData2: TQRSysData;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickReportAfterPreview(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qrlCuadrillanombre2Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRAuditoriaStockMoviles: TfQRAuditoriaStockMoviles;

implementation

{$R *.DFM}

procedure TfQRAuditoriaStockMoviles.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tEmpresaLogo.Close;
  qEmpresa.Close;
  qBalance.Close;
  Action := caFree;
end;

procedure TfQRAuditoriaStockMoviles.QuickReportAfterPreview(
  Sender: TObject);
begin
  close;
  beep;
end;

procedure TfQRAuditoriaStockMoviles.FormShow(Sender: TObject);
begin
  QuickReport.Preview;
end;

procedure TfQRAuditoriaStockMoviles.qrlCuadrillanombre2Print(
  sender: TObject; var Value: String);
begin
  value:='';
end;

end.
