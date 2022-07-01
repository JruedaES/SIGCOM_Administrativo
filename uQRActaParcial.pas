unit uQRActaParcial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uQRBase, Qrctrls, quickrpt, ExtCtrls, Db, DBTables, jpeg;

type
  TfQRActaParcial = class(TFQRBase)
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
    qrlActa: TQRLabel;
    qrlAsunto: TQRLabel;
    qrlNombreContratista: TQRLabel;
    qrlValoraPagar: TQRLabel;
    qCia: TQuery;
    QRLabel3: TQRLabel;
    QRLabel7: TQRLabel;
    qrlNitContratista: TQRLabel;
    qrlNumeroContrato: TQRLabel;
    qrlObjeto: TQRLabel;
    procedure QuickReportAfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
//    NombreFirmante,CargoFirmante, NombreFirmante1,CargoFirmante1,NombreFirmante2,CargoFirmante2, NombreFirmante3, CargoFirmante3: String;

    { Public declarations }
  end;

var
  fQRActaParcial: TfQRActaParcial;

implementation


{$R *.DFM}

procedure TfQRActaParcial.QuickReportAfterPreview(Sender: TObject);
begin
  close;
end;

procedure TfQRActaParcial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=CaFree;
end;

end.
 