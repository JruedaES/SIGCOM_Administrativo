unit UQRLiquidarExtras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Grids, DBGrids, RXDBCtrl, Db, DBTables, jpeg, Qrctrls;

type
  TFQRLiquidarExtras = class(TForm)
    qLiquidacionver: TQuery;
    dsLiquidacion: TDataSource;
    QuickRep: TQuickRep;
    BandaTitulo2: TQRBand;
    QRShape1: TQRShape;
    qrlSeccion: TQRLabel;
    qrlCargo: TQRLabel;
    qrlNombreEmpleado: TQRLabel;
    qrlCedula: TQRLabel;
    QRShape3: TQRShape;
    QRShape7: TQRShape;
    qrdbNombreCia: TQRDBText;
    qrdbCedulaEmpleado: TQRDBText;
    qrdbCargoEmpleado: TQRDBText;
    qrdbNombreEmpleado: TQRDBText;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape51: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    BandaTitulo: TQRBand;
    QRDBImage1: TQRDBImage;
    qrdbNombreEmpresa: TQRDBText;
    qlAreaFuncional: TQRLabel;
    qrdbNIT: TQRDBText;
    QRImage2: TQRImage;
    qrdbFecha: TQRDBText;
    DetailBand1: TQRBand;
    QRShape30: TQRShape;
    QRShape34: TQRShape;
    qrdbObservacion: TQRDBText;
    qrdbObservacionExtra: TQRDBText;
    QRShape58: TQRShape;
    QRShape60: TQRShape;
    QRShape77: TQRShape;
    QRShape78: TQRShape;
    qrdbDisponibilidad: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    QRShape57: TQRShape;
    QRShape15: TQRShape;
    qrlObservacion: TQRLabel;
    QRLabel1: TQRLabel;
    QRShape24: TQRShape;
    QRShape59: TQRShape;
    QRShape69: TQRShape;
    QRLabel10: TQRLabel;
    QRShape74: TQRShape;
    ChildBand2: TQRChildBand;
    QRShape82: TQRShape;
    QRShape83: TQRShape;
    QRShape85: TQRShape;
    QRShape86: TQRShape;
    QRLabel14: TQRLabel;
    QRShape87: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    tEmpresaLogo: TTable;
    qEmpresa: TQuery;
    qCargo: TQuery;
    qCargoNOMBRECARGO: TStringField;
    qLiquidacionverCODIGO: TStringField;
    qLiquidacionverCONCEPTO: TFloatField;
    qLiquidacionverDESCRIPCION: TStringField;
    QRBand2: TQRBand;
    qLiquidacionverSUMA: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRepAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FQRLiquidarExtras: TFQRLiquidarExtras;

implementation

{$R *.DFM}

procedure TFQRLiquidarExtras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
     Action:=caFree;
end;



procedure TFQRLiquidarExtras.QuickRepAfterPreview(Sender: TObject);
begin
    Close;
end;

end.
