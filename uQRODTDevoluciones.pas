unit uQRODTDevoluciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, StdCtrls, ComCtrls, jpeg;

type
  TfQRODTDevoluciones = class(TForm)
    qEmpresa: TQuery;
    qCia: TQuery;
    qMateriales: TQuery;
    qMaterialesCODIGOODT: TFloatField;
    qMaterialesCODIGOMATERIAL: TFloatField;
    qMaterialesCANTIDADSOLICITADA: TFloatField;
    qMaterialesCANTIDADENTREGADA: TFloatField;
    qMaterialesCANTIDADCONSUMIDA: TFloatField;
    qMaterialesCANTIDADREINTEGRADABUENA: TFloatField;
    qMaterialesCANTIDADREINTEGRADAMALA: TFloatField;
    qMaterialesCANTIDADRETIRADABUENA: TFloatField;
    qMaterialesCANTIDADRETIRADAMALA: TFloatField;
    qMaterialesVALORPRESUPUESTADO: TFloatField;
    qMaterialesVALORLIQUIDADO: TFloatField;
    qMaterialesNOMBREMATERIAL: TStringField;
    qMaterialesCODIGOUNIDAD: TStringField;
    qMaterialesCONSECUTIVO: TFloatField;
    qrDevoluciones: TQuickRep;
    QRBand2: TQRBand;
    QRBand4: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel27: TQRLabel;
    QRShape2: TQRShape;
    QRLabel12: TQRLabel;
    QRShape4: TQRShape;
    QRLabel30: TQRLabel;
    QRShape5: TQRShape;
    QRLabel31: TQRLabel;
    QRShape6: TQRShape;
    QRLabel35: TQRLabel;
    QRShape11: TQRShape;
    QRLabel38: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape1: TQRShape;
    QRLabel7: TQRLabel;
    QRShape10: TQRShape;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText14: TQRDBText;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape25: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape33: TQRShape;
    ChildBand1: TQRChildBand;
    QRLabel13: TQRLabel;
    QRShape18: TQRShape;
    QRLabel14: TQRLabel;
    QRShape20: TQRShape;
    QRLabel15: TQRLabel;
    QRShape21: TQRShape;
    QRShape17: TQRShape;
    QRShape16: TQRShape;
    QRShape15: TQRShape;
    QRBand1: TQRBand;
    qlNombreEmpresa: TQRLabel;
    qrdbLogo: TQRDBImage;
    qrlNumeroReintegro: TQRLabel;
    tEmpresaLogo: TTable;
    tEmpresaLogoCODIGOEMPRESA: TStringField;
    tEmpresaLogoCONSECUTIVO: TStringField;
    tEmpresaLogoLOGOEMPRESA: TBlobField;
    QRShape3: TQRShape;
    QRShape24: TQRShape;
    QRLabel40: TQRLabel;
    QRLabel39: TQRLabel;
    dsEmpresaLogo: TDataSource;
    QRShape40: TQRShape;
    QRShape7: TQRShape;
    qCliente: TQuery;
    QRShape8: TQRShape;
    QRSysData1: TQRSysData;
    qlPagina: TQRSysData;
    QRBand3: TQRBand;
    QRSysData2: TQRSysData;
    qReintegro: TQuery;
    qReintegroNombreUnidad: TStringField;
    dsReintegro: TDataSource;
    qMaterial: TQuery;
    qUnidad: TQuery;
    QRDBText4: TQRDBText;
    qReintegroNombreMaterial: TStringField;
    qReintegroCODIGOREINTEGRO: TFloatField;
    qReintegroCODIGOMATERIAL: TFloatField;
    qReintegroCANTIDADNUEVAB: TFloatField;
    qReintegroCANTIDADNUEVAM: TFloatField;
    qReintegroCANTIDADNUEVAREALB: TFloatField;
    qReintegroCANTIDADNUEVAREALM: TFloatField;
    qReintegroCANTIDADDESMANB: TFloatField;
    qReintegroCANTIDADDESMANM: TFloatField;
    qReintegroCANTIDADDESMANREALB: TFloatField;
    qReintegroCANTIDADDESMANREALM: TFloatField;
    qReintegroESTADO: TStringField;
    QRDBText12: TQRDBText;
    qEmpresa2: TQuery;
    qEmpresa2NOMBREEMPRESA: TStringField;
    qEncabezado: TQuery;
    qEncabezadoCODIGOODT: TFloatField;
    qEncabezadoCONSECUTIVO: TFloatField;
    qEncabezadoCIAS_CIAS: TFloatField;
    qEncabezadoCOD_ALMACEN: TStringField;
    qEncabezadoCOD_BODEGA: TStringField;
    qEncabezadoCODIGOREINTEGRO: TFloatField;
    qEncabezadoESTADO: TStringField;
    qEncabezadoNOMBREGRUPOTRABAJO: TStringField;
    QRDBText1: TQRDBText;
    QRImage3: TQRImage;
    QRImage2: TQRImage;
    QRLabel3: TQRLabel;
    QRDBText7: TQRDBText;
    qEncabezadoCODIGOMOVIMIENTOPRESUPUESTO: TStringField;
    procedure qrDevolucionesAfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRODTDevoluciones: TfQRODTDevoluciones;

implementation

uses uInformacionOdtHija;

{$R *.DFM}

procedure TfQRODTDevoluciones.qrDevolucionesAfterPreview(Sender: TObject);
begin
  Close;
end;

procedure TfQRODTDevoluciones.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fInformacionOdtHija.Close;
  Action:=CaFree;
end;

end.
