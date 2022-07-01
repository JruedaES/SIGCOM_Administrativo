unit uQRODTEssaMaterialesManoObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, Db, DBTables, QuickRpt, ExtCtrls;

type
  TfQRODTEssaMaterialesManoObra = class(TForm)
    QuickReport: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    Table1: TTable;
    QRDBImage1: TQRDBImage;
    QRDBText1: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrdbCodigoODT: TQRDBText;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    qrdbFechaEmision: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    qrDiaODT: TQRSubDetail;
    QRLabel5: TQRLabel;
    qrdbNumeroDia: TQRDBText;
    QRLabel6: TQRLabel;
    qrdbFechaDiaODT: TQRDBText;
    QRShape4: TQRShape;
    qrPreManoODT: TQRSubDetail;
    cbTitulosManoObra: TQRChildBand;
    QRShape5: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape6: TQRShape;
    qrdbCodigoEmpleado: TQRDBText;
    qrdbNombreEmpleado: TQRDBText;
    qrdbExtrasDiurnas: TQRDBText;
    qrdbExtrasNocturnas: TQRDBText;
    qrdbDesayuno: TQRDBText;
    qrdbAlmuerzo: TQRDBText;
    qrdbComida: TQRDBText;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRGroup1: TQRGroup;
    qrbTituloMateriales: TQRBand;
    QRShape21: TQRShape;
    QRLabel14: TQRLabel;
    QRShape20: TQRShape;
    QRLabel15: TQRLabel;
    qrValeODT: TQRSubDetail;
    QRLabel16: TQRLabel;
    qrNumeroVale: TQRDBText;
    QRLabel17: TQRLabel;
    qrFechaVale: TQRDBText;
    QRShape22: TQRShape;
    QRChildBand1: TQRChildBand;
    QRShape23: TQRShape;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRSubDetail1: TQRSubDetail;
    QRShape31: TQRShape;
    qrdbCodigoMaterial: TQRDBText;
    qrdbNombreMaterial: TQRDBText;
    qrdbUnidad: TQRDBText;
    qrdbSolicitado: TQRDBText;
    qrdbEntregado: TQRDBText;
    qrdbConsumido: TQRDBText;
    qrdbReintegrado: TQRDBText;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape26: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    qrdbRetBueno: TQRDBText;
    qrdbRetMalo: TQRDBText;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRLabel27: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape42: TQRShape;
    QRLabel28: TQRLabel;
    QRShape9: TQRShape;
    QRShape43: TQRShape;
    QRDBText4: TQRDBText;
    Query1: TQuery;
    Query1NOMBREEMPRESA: TStringField;
    Query1NITEMPRESA: TStringField;
    Query1LOGOEMPRESA: TBlobField;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape49: TQRShape;
    QRDBText9: TQRDBText;
    QRLabel38: TQRLabel;
    QRDBText10: TQRDBText;
    QRShape50: TQRShape;
    QRDBText11: TQRDBText;
    QRLabel39: TQRLabel;
    QRDBText12: TQRDBText;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape48: TQRShape;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRODTEssaMaterialesManoObra: TfQRODTEssaMaterialesManoObra;

implementation

uses uODT;

{$R *.DFM}

end.
