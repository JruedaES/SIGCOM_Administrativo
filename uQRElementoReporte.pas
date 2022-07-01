unit uQRElementoReporte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables;

type
  TfQRElementoReporte = class(TForm)
    QuickReport: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBImage1: TQRDBImage;
    qrdbCodigoReporte: TQRDBText;
    Query1: TQuery;
    Query1NOMBREEMPRESA: TStringField;
    Query1NITEMPRESA: TStringField;
    Query1LOGOEMPRESA: TBlobField;
    Table1: TTable;
    DataSource1: TDataSource;
    QRBand2: TQRBand;
    QRShape5: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    qrdbTipoElemento: TQRDBText;
    qrdbClave1: TQRDBText;
    qrdbClave2: TQRDBText;
    qrdbNombreEstructura: TQRDBText;
    QRBand3: TQRBand;
    QRShape6: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel3: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRElementoReporte: TfQRElementoReporte;

implementation

{$R *.DFM}

procedure TfQRElementoReporte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BEEP;
end;

end.
