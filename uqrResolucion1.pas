unit uqrResolucion1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, TParser, Db, DBTables, jpeg;

type
  TfqrResolucion1 = class(TForm)
    QuickReport: TQuickRep;
    tEmpresaLogo: TTable;
    tEmpresaLogoCODIGOEMPRESA: TStringField;
    tEmpresaLogoCONSECUTIVO: TStringField;
    tEmpresaLogoLOGOEMPRESA: TBlobField;
    dsEmpresaLogo: TDataSource;
    DParser1: TDParser;
    TitleBand1: TQRBand;
    QRDBImage2: TQRDBImage;
    QRImage1: TQRImage;
    QRDBText15: TQRDBText;
    QRLabel48: TQRLabel;
    QRDBText16: TQRDBText;
    qlFecha: TQRLabel;
    QRShape5: TQRShape;
    PageFooterBand1: TQRBand;
    qlPagina: TQRSysData;
    QRShape1: TQRShape;
    QLSGD: TQRLabel;
    QRILogoElectros: TQRImage;
    QRILogoPrograma: TQRImage;
    qEmpresa: TQuery;
    qCia: TQuery;
    QRDBText1: TQRDBText;
    QRRichTextResolucion: TQRRichText;
    QRLabel6: TQRLabel;
    QRRichTextConsiderando: TQRRichText;
    QRLabel7: TQRLabel;
    QRMResuelve: TQRMemo;
    ChildBand1: TQRChildBand;
    QRLabelNombrefirmante: TQRLabel;
    QRLabelCargoFirmante: TQRLabel;
    QRLabelNombrefirmante1: TQRLabel;
    QRLabelCargoFirmante1: TQRLabel;
    QRLabelNombrefirmante2: TQRLabel;
    QRLabelCargoFirmante2: TQRLabel;
    QRLabelNombrefirmante3: TQRLabel;
    QRLabelCargoFirmante3: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickReportAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fqrResolucion1: TfqrResolucion1;

implementation

uses uContrato;

{$R *.DFM}

procedure TfqrResolucion1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfqrResolucion1.QuickReportAfterPreview(Sender: TObject);
begin
  Close;
end;


end.
 