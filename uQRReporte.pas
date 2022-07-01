unit uQRReporte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables;

type
  TfQRReporte = class(TForm)
    QuickReport: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrdbCodigoReporte: TQRDBText;
    qrdbFechaCreacion: TQRDBText;
    Query1: TQuery;
    Query1NOMBREEMPRESA: TStringField;
    Query1NITEMPRESA: TStringField;
    Query1LOGOEMPRESA: TBlobField;
    Table1: TTable;
    DataSource1: TDataSource;
    QRBand2: TQRBand;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrdbTipoInformante: TQRDBText;
    qrdbNombreInformante: TQRDBText;
    QRLabel6: TQRLabel;
    qrdbTelefono: TQRDBText;
    QRLabel7: TQRLabel;
    qrdbDireccionDano: TQRDBText;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    qrdbNodoFisico: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    qrdbNombreClaseReporte: TQRDBText;
    qrdbNombreTipoReporte: TQRDBText;
    QRLabel13: TQRLabel;
    qrdbNombreAdministrativo: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    qrdbFechaDictado: TQRDBText;
    qrdbFechaLlegada: TQRDBText;
    qrdbFechaAtencion: TQRDBText;
    QRLabel17: TQRLabel;
    qrdbEstadoReporte: TQRDBText;
    qrdbDescripcion: TQRDBText;
    qrdbObservacion: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRReporte: TfQRReporte;

implementation

{$R *.DFM}

procedure TfQRReporte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BEEP;
end;

end.
