unit uIndicexMaterialResumen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Qrctrls, QuickRpt, ExtCtrls;

type
  TFIndicexMaterialResumen = class(TForm)
    QuickRep1: TQuickRep;
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
    qEmpresa: TQuery;
    tEmpresaLogo: TTable;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qrdbCantidadSolicitada: TQRDBText;
    qrdbCantidadEntregada: TQRDBText;
    qrdbCantidadConsumida: TQRDBText;
    qrdbCantidadReintegradaMala: TQRDBText;
    qrdbCantidadReintegradaBuena: TQRDBText;
    qrdbCantidadRetiradaBuena: TQRDBText;
    qrdbCantidadRetiradaMala: TQRDBText;
    QRDBText3: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FIndicexMaterialResumen: TFIndicexMaterialResumen;

implementation

uses uIndiceAreaMetropolitana;


{$R *.DFM}

end.
