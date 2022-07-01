unit uQROdtValeMateriales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, StdCtrls, ComCtrls;

type
  TfQRODTValeMateriales = class(TForm)
    tEmpresaLogo: TTable;
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
    QuickRep1: TQuickRep;
    BandaTitulo: TQRBand;
    QRDBImage1: TQRDBImage;
    qrdbNombreEmpresa: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBText6: TQRDBText;
    qrlProyectoEnergis: TQRLabel;
    BandaEncabezadoDetalle: TQRGroup;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRShape1: TQRShape;
    QRShape18: TQRShape;
    QRLabel12: TQRLabel;
    QRShape19: TQRShape;
    QRLabel13: TQRLabel;
    QRShape20: TQRShape;
    QRLabel14: TQRLabel;
    QRShape21: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape22: TQRShape;
    QRLabel17: TQRLabel;
    QRShape23: TQRShape;
    qrbDetalle: TQRBand;
    qrdbCodigoAdministrativo: TQRDBText;
    qrdbCodigoRevisado: TQRDBText;
    qrdbNombreLabor: TQRDBText;
    qrdbCodigoEjecutor: TQRDBText;
    qrdbNombrePrioridad: TQRDBText;
    QRShape2: TQRShape;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRLabel4: TQRLabel;
    QRShape11: TQRShape;
    QRLabel5: TQRLabel;
    QRShape12: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape13: TQRShape;
    QRLabel8: TQRLabel;
    QRShape14: TQRShape;
    QRLabel9: TQRLabel;
    QRShape15: TQRShape;
    QRLabel10: TQRLabel;
    QRShape16: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel18: TQRLabel;
    QRBand1: TQRBand;
    QRLabel49: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRShape17: TQRShape;
    QRShape25: TQRShape;
    QRShape24: TQRShape;
    QRLabel19: TQRLabel;
    QRShape26: TQRShape;
    qrdbFechaEmision: TQRDBText;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRShape5: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape42: TQRShape;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel34: TQRLabel;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    procedure QuickRep1AfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrbDetalleBeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRSysData1Print(sender: TObject; var Value: String);
    procedure qrdbCodigoAdministrativoPrint(sender: TObject;
      var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRODTValeMateriales: TfQRODTValeMateriales;

implementation
uses uODTPadre;

{$R *.DFM}

procedure TfQRODTValeMateriales.QuickRep1AfterPreview(Sender: TObject);
begin
  Close;
end;

procedure TfQRODTValeMateriales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qMateriales.Close;
  qMateriales.Free;
  Action:=CaFree;
end;

procedure TfQRODTValeMateriales.qrbDetalleBeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  if qMateriales.RecordCount=0 then PrintBand:=False
  else
  begin
    if Sender.Color=clwhite then
      Sender.Color:=clSilver
    else
      Sender.Color:=clwhite;
  end;
end;

procedure TfQRODTValeMateriales.QRSysData1Print(sender: TObject;
  var Value: String);
begin
  (sender as TQRSysData).color:=qrbDetalle.Color;
end;

procedure TfQRODTValeMateriales.qrdbCodigoAdministrativoPrint(
  sender: TObject; var Value: String);
begin
  (sender as TQRDBText).color:=qrbDetalle.Color;
end;

end.
