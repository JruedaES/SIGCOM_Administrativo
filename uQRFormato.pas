unit uQRFormato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, Qrctrls, Db, DBTables, jpeg, StdCtrls;

type
  TFQRFormato = class(TForm)
    QuickRep1: TQuickRep;
    QRBand1: TQRBand;
    qrdbLogo: TQRDBImage;
    qlNombreEmpresa: TQRLabel;
    tEmpresaLogo: TTable;
    tEmpresaLogoCODIGOEMPRESA: TStringField;
    tEmpresaLogoCONSECUTIVO: TStringField;
    tEmpresaLogoLOGOEMPRESA: TBlobField;
    dsEmpresaLogo: TDataSource;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QREncabezado: TQRSubDetail;
    QRLabel1: TQRLabel;
    QREncabezadoSeccion: TQRSubDetail;
    QRLbNombreSeccion: TQRLabel;
    QRLBNombreFormato: TQRLabel;
    QRMedidas: TQRSubDetail;
    QRLBFecha: TQRLabel;
    QRShape4: TQRShape;
    QRImage1: TQRImage;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRSysData1: TQRSysData;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRep1AfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FQRFormato: TFQRFormato;

implementation

uses UFormatoMttoImprirmir;

{$R *.DFM}

procedure TFQRFormato.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFQRFormato.QuickRep1AfterPreview(Sender: TObject);
begin
  close;
end;

end.





































