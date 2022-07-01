unit uQREstadoActualMovil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Qrctrls, QuickRpt, ExtCtrls;

type
  TfQREstadoActualMovil = class(TForm)
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
    qrGroupHeaderMoviles: TQRGroup;
    QRDBText1: TQRDBText;
    QRChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand1: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRGroupFooterMoviles: TQRBand;
    QRBand2: TQRBand;
    qrlDependencia: TQRLabel;
    QRBand3: TQRBand;
    QRSysData1: TQRSysData;
    qEmpresa: TQuery;
    tEmpresaLogo: TTable;
    qEstado: TQuery;
    QRLabel8: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText9: TQRDBText;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure QuickReportAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQREstadoActualMovil: TfQREstadoActualMovil;

implementation

{$R *.DFM}

procedure TfQREstadoActualMovil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tEmpresaLogo.Close;
  qEmpresa.Close;
  qEstado.Close;
  Action := caFree;
end;

procedure TfQREstadoActualMovil.FormShow(Sender: TObject);
begin
  QuickReport.Preview;
end;

procedure TfQREstadoActualMovil.QuickReportAfterPreview(Sender: TObject);
begin
  close;
  Beep;
end;

end.
