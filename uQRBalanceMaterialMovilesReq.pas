unit uQRBalanceMaterialMovilesReq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, ExtCtrls, QuickRpt, DBTables, Db, Qrctrls;

type
  TfQRBalanceMaterialMovilesReq = class(TForm)
    QuickReport: TQuickRep;
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
    tEmpresaLogo: TTable;
    qrGroupHeaderMoviles: TQRGroup;
    QRChildBand1: TQRChildBand;
    QRBand1: TQRBand;
    QRGroupFooterMoviles: TQRBand;
    QRDBText1: TQRDBText;
    qBalance: TQuery;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand2: TQRBand;
    qrlDependencia: TQRLabel;
    QRBand3: TQRBand;
    QRSysData1: TQRSysData;
    qEmpresa: TQuery;
    QRLabel6: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText18: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText21: TQRDBText;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText9: TQRDBText;
    qBalanceCODIGOREQUISICION: TFloatField;
    qBalanceFECHAREQUISICION: TDateTimeField;
    qBalanceNOMBREGRUPOTRABAJO: TStringField;
    qBalanceCODIGOMATERIAL: TFloatField;
    qBalanceNOMBREMATERIAL: TStringField;
    qBalanceCODIGOUNIDAD: TStringField;
    qBalanceCANTIDADENTREGADA: TFloatField;
    qBalanceCANTIDADCONSUMIDA: TFloatField;
    QRDBText10: TQRDBText;
    qBalanceVIGENCIA: TFloatField;
    QRDBText11: TQRDBText;
    qBalanceCANTIDADREINTEGRADABUENA: TFloatField;
    qBalanceCANTIDADREINTEGRADAMALA: TFloatField;
    qBalanceCANTIDADTRASLADONUEVA: TFloatField;
    qBalanceTRASLADONUEVONEGATIVO: TFloatField;
    qBalanceCODIGOODTCOMPLETO: TFloatField;
    qBalancecodigoodt: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickReportAfterPreview(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qBalanceCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRBalanceMaterialMovilesReq: TfQRBalanceMaterialMovilesReq;

implementation

{$R *.DFM}

procedure TfQRBalanceMaterialMovilesReq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  tEmpresaLogo.Close;
  qEmpresa.Close;
  qBalance.Close;
  Action := caFree;
end;

procedure TfQRBalanceMaterialMovilesReq.QuickReportAfterPreview(
  Sender: TObject);
begin
  close;
  beep;
end;

procedure TfQRBalanceMaterialMovilesReq.FormShow(Sender: TObject);
begin
  QuickReport.Preview;
end;

procedure TfQRBalanceMaterialMovilesReq.qBalanceCalcFields(
  DataSet: TDataSet);
Var
qconsulta: tquery;
begin
  qconsulta:=TQuery.Create(self);
  qconsulta.DatabaseName:='BaseDato';
  qconsulta.SQL.Text:='SELECT  SUBSTR(codigoodt,7,LENGTH(codigoodt)) AS codigoodt FROM odt WHERE codigoodt = '+ qBalanceCODIGOODTCOMPLETO.asstring ;
  qconsulta.open;
  qBalance.FieldByName('CODIGOODT').asstring:=  qConsulta.FieldByName('CODIGOODT').asstring;
  qconsulta.close;
  qConsulta.free;
end;

end.
