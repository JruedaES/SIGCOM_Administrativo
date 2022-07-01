unit uQRActaLiquidacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uQRBase, Qrctrls, quickrpt, ExtCtrls, Db, DBTables, jpeg;

type
  TfQRActaLiquidacion = class(TFQRBase)
    QRLabelNombrefirmante: TQRLabel;
    QRLabelCargoFirmante: TQRLabel;
    QRLabelNombrefirmante1: TQRLabel;
    QRLabelCargoFirmante1: TQRLabel;
    QRLabelNombrefirmante3: TQRLabel;
    QRLabelCargoFirmante3: TQRLabel;
    QRLabelNombrefirmante2: TQRLabel;
    QRLabelCargoFirmante2: TQRLabel;
    QRRichTextConsiderando: TQRRichText;
    QRMResuelve: TQRMemo;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabelContratista: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabelValorcontrato: TQRLabel;
    qCia: TQuery;
    procedure QuickReportAfterPreview(Sender: TObject);
    procedure qlAreaFuncionalPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    NombreFirmante,CargoFirmante, NombreFirmante1,CargoFirmante1,NombreFirmante2,CargoFirmante2, NombreFirmante3, CargoFirmante3: String;

    { Public declarations }
  end;

var
  fQRActaLiquidacion: TfQRActaLiquidacion;

implementation

uses UContrato, uActaLiquidacion;

{$R *.DFM}

procedure TfQRActaLiquidacion.QuickReportAfterPreview(Sender: TObject);
begin
  close;
end;

procedure TfQRActaLiquidacion.qlAreaFuncionalPrint(sender: TObject;
  var Value: String);
begin
  value:=qCia.fieldbyname('nombrecategoria').AsString;
end;

end.
