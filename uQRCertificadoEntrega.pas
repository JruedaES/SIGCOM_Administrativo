unit uQRCertificadoEntrega;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uQRBase, Qrctrls, quickrpt, ExtCtrls, Db, DBTables, jpeg;

type
  TfQRCertificadoEntrega = class(TFQRBase)
    QRLInterventor: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabelNombrefirmante: TQRLabel;
    QRLabelCargoFirmante: TQRLabel;
    QRRichText1: TQRRichText;
    QRLabelNombrefirmante1: TQRLabel;
    QRLabelNombrefirmante2: TQRLabel;
    QRLabelNombrefirmante3: TQRLabel;
    QRLabelCargoFirmante1: TQRLabel;
    QRLabelCargoFirmante3: TQRLabel;
    QRLabelCargoFirmante2: TQRLabel;
    qCia: TQuery;
    procedure QuickReportAfterPreview(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qlAreaFuncionalPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRCertificadoEntrega: TfQRCertificadoEntrega;

implementation

Uses
  uContrato, uCertificadoEntrega;
{$R *.DFM}

procedure TfQRCertificadoEntrega.QuickReportAfterPreview(Sender: TObject);
begin
  close;
end;

procedure TfQRCertificadoEntrega.FormShow(Sender: TObject);
begin
  QuickReport.Preview;
end;

procedure TfQRCertificadoEntrega.qlAreaFuncionalPrint(sender: TObject;
  var Value: String);
begin
  value:=qCia.fieldbyname('nombrecategoria').AsString;
end;

end.
