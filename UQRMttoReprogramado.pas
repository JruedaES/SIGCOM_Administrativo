unit UQRMttoReprogramado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, Db, DBTables, ExtCtrls, jpeg;

type
  TFQRMttoReprogramado = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    tEmpresaLogo: TTable;
    tEmpresaLogoCODIGOEMPRESA: TStringField;
    tEmpresaLogoCONSECUTIVO: TStringField;
    tEmpresaLogoLOGOEMPRESA: TBlobField;
    dsEmpresaLogo: TDataSource;
    QRShape16: TQRShape;
    qlPagina: TQRSysData;
    ShTitulo: TQRShape;
    qrdbNombreEmpresa: TQRDBText;
    QRDBText6: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBImage1: TQRDBImage;
    lbTitulo: TQRLabel;
    qrlbFecha: TQRLabel;
    QRImage2: TQRImage;
    QRLabel74: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel76: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel77: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel78: TQRLabel;
    QRDBText10: TQRDBText;
    QRShape59: TQRShape;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel75: TQRLabel;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRShape24: TQRShape;
    QRMemo1: TQRMemo;
    QRLabel8: TQRLabel;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRMemo4: TQRMemo;
    QRMemo5: TQRMemo;
    QRLabel10: TQRLabel;
    qMttoReprogramado: TQuery;
    qMttoReprogramadoCODIGOTAREA: TFloatField;
    qMttoReprogramadoNOMBRETAREA: TStringField;
    qMttoReprogramadoFECHAINICIALANTERIOR: TDateTimeField;
    qMttoReprogramadoFECHAFINALANTERIOR: TDateTimeField;
    qMttoReprogramadoFECHAINICIALNUEVA: TDateTimeField;
    qMttoReprogramadoFECHAFINALNUEVA: TDateTimeField;
    qMttoReprogramadoMOTIVOREPROGRAMACION: TStringField;
    qMttoReprogramadoFECHAREPROGRAMACION: TDateTimeField;
    qMttoReprogramadoCODIGOTAREA_1: TFloatField;
    qMttoReprogramadoFECHAINICIAL: TDateTimeField;
    qMttoReprogramadoFECHAFINAL: TDateTimeField;
    qMttoReprogramadoNOMBRETAREA_1: TStringField;
    qMttoReprogramadoTENSION: TFloatField;
    qMttoReprogramadoNOMBREESTADO: TStringField;
    qMttoReprogramadoNOMBRETIPOELEMENTO: TStringField;
    qMttoReprogramadoNOMBRESUBESTACION: TStringField;
    qMttoReprogramadoCODIGOMANTENIMIENTO: TFloatField;
    qMttoReprogramadoCODIGOTIPOMANT: TFloatField;
    qMttoReprogramadoNOMBREMANT: TStringField;
    dsMttoReprogramado: TDataSource;
    QRShape4: TQRShape;
    QRBand1: TQRBand;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRDBText24: TQRDBText;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    qEmpresa: TQuery;
    QRLabel1: TQRLabel;
    procedure QuickRep1AfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FQRMttoReprogramado: TFQRMttoReprogramado;

implementation

{$R *.DFM}

procedure TFQRMttoReprogramado.QuickRep1AfterPreview(Sender: TObject);
begin
  close;
  qMttoReprogramado.Free;
  qEmpresa.Free;
end;

procedure TFQRMttoReprogramado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

end.
