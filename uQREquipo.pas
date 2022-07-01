unit uQREquipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, Qrctrls, Db, DBTables, jpeg;

type
  TFQREquipo = class(TForm)
    QRFormatoEquipo: TQuickRep;
    QRTitulo: TQRBand;
    qrdbLogo: TQRDBImage;
    qlNombreEmpresa: TQRLabel;
    tEmpresaLogo: TTable;
    tEmpresaLogoCODIGOEMPRESA: TStringField;
    tEmpresaLogoCONSECUTIVO: TStringField;
    tEmpresaLogoLOGOEMPRESA: TBlobField;
    dsEmpresaLogo: TDataSource;
    QRImage2: TQRImage;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLbNombreElemento: TQRLabel;
    QRLbAmbito: TQRLabel;
    QRLbCoordinacion: TQRLabel;
    QRLbNombreSubestacion: TQRLabel;
    QRLabel30: TQRLabel;
    QRLbNombreCircuito: TQRLabel;
    QRLbSubestacion: TQRLabel;
    QRLbTipoMtto: TQRLabel;
    QRLBNombreFormato: TQRLabel;
    QRLbTipoElemento: TQRLabel;
    QRLbElemento: TQRLabel;
    QRLbCircuito: TQRLabel;
    QREquipo: TQRSubDetail;
    QRLabel2: TQRLabel;
    qEncabezadoFormato: TQuery;
    QRSeccion: TQRSubDetail;
    QRLbNombreSeccion: TQRLabel;
    QRMedida: TQRSubDetail;
    QRLabel1: TQRLabel;
    QRLbFecha: TQRLabel;
    QRSysData1: TQRSysData;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRFormatoEquipoAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FQREquipo: TFQREquipo;

implementation

uses UFormatoMttoImprirmir;

{$R *.DFM}

procedure TFQREquipo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFQREquipo.QRFormatoEquipoAfterPreview(Sender: TObject);
begin
  close;
end;

end.
