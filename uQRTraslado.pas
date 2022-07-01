unit uQRTraslado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, DBTables, Qrctrls, Db, jpeg;

type
  TfQRTraslado = class(TForm)
    qrTraslado: TQuickRep;
    tEmpresaLogo: TTable;
    tEmpresaLogoCODIGOEMPRESA: TStringField;
    tEmpresaLogoCONSECUTIVO: TStringField;
    tEmpresaLogoLOGOEMPRESA: TBlobField;
    dsEmpresaLogo: TDataSource;
    qTrasladoDetalle: TQuery;
    dsTrasladoDetalle: TDataSource;
    qTraslados: TQuery;
    qTrasladosCODIGOADMINISTRATIVOORIGEN: TFloatField;
    qTrasladosCODIGOGRUPOTRABAJOORIGEN: TFloatField;
    qTrasladosCODIGOADMINISTRATIVODESTINO: TFloatField;
    qTrasladosCODIGOGRUPOTRABAJODESTINO: TFloatField;
    qTrasladosFECHATRASLADO: TDateTimeField;
    qTrasladosCODIGOTRASLADO: TFloatField;
    qTrasladosCODIGOODT: TFloatField;
    qTrasladosCONSECUTIVO: TFloatField;
    dsTraslados: TDataSource;
    qTrasladoDestino: TQuery;
    dsTrasladoDestino: TDataSource;
    qTrasladosNOMBREGRUPOTRABAJO: TStringField;
    qTrasladoDetalleCODIGOTRASLADO: TFloatField;
    qTrasladoDetalleCANTIDAD: TFloatField;
    qTrasladoDetalleCODIGOMATERIAL: TFloatField;
    qTrasladoDetalleCANTIDADDESMANTELADA: TFloatField;
    qTrasladoDetalleCODIGOODT: TFloatField;
    qTrasladoDetalleCONSECUTIVO: TFloatField;
    qTrasladoDetalleNOMBREMATERIAL: TStringField;
    qTrasladoDestinoCODIGOTRASLADO: TFloatField;
    qTrasladoDestinoCODIGOADMINISTRATIVOORIGEN: TFloatField;
    qTrasladoDestinoCODIGOGRUPOTRABAJOORIGEN: TFloatField;
    qTrasladoDestinoCODIGOADMINISTRATIVODESTINO: TFloatField;
    qTrasladoDestinoCODIGOGRUPOTRABAJODESTINO: TFloatField;
    qTrasladoDestinoFECHATRASLADO: TDateTimeField;
    qTrasladoDestinoCODIGOODT: TFloatField;
    qTrasladoDestinoCONSECUTIVO: TFloatField;
    qTrasladoDestinoNOMBREGRUPOTRABAJO: TStringField;
    QRBand1: TQRBand;
    QRShape2: TQRShape;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText24: TQRDBText;
    QRDBText25: TQRDBText;
    QRDBText28: TQRDBText;
    qrdbLogo: TQRDBImage;
    QRLabel33: TQRLabel;
    QRNumeroTraslado: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel6: TQRLabel;
    QRImage2: TQRImage;
    QRDBText27: TQRDBText;
    QRDBText7: TQRDBText;
    QRBand3: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand2: TQRBand;
    QRLabel21: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr1: TQRExpr;
    ChildBand1: TQRChildBand;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape7: TQRShape;
    QRShape3: TQRShape;
    qTrasladosNOMBRECATEGORIA: TStringField;
    qTrasladoDestinoNOMBRECATEGORIA: TStringField;
    QRBand4: TQRBand;
    qlPagina: TQRSysData;
    QRSysData1: TQRSysData;
    qTrasladoDetalleCODIGOUNIDAD: TStringField;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel8: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText12: TQRDBText;
    qEmpresa: TQuery;
    qEmpresaNOMBREEMPRESA: TStringField;
    qEmpresaNITEMPRESA: TStringField;
    qlNombreEmpresa: TQRLabel;
    QRImage1: TQRImage;
    QRLabel13: TQRLabel;
    QRDBText13: TQRDBText;
    qTrasladosOBSERVACION: TMemoField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrTrasladoAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRTraslado: TfQRTraslado;

implementation

uses uODTUrbanaRural, uIntervencion,uInformacionOdtHija;

{$R *.DFM}

procedure TfQRTraslado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fInformacionOdtHija.close;
  Action := caFree;
end;

procedure TfQRTraslado.qrTrasladoAfterPreview(
  Sender: TObject);
begin
  CLOSE;
end;

end.
 