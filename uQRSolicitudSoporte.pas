unit uQRSolicitudSoporte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, jpeg;

type
  TfQRSolicitudSoporte = class(TForm)
    qrSolicitudSoporte: TQuickRep;
    QRBand1: TQRBand;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    qrdbCodigoReporte: TQRDBText;
    Query1: TQuery;
    Query1NOMBREEMPRESA: TStringField;
    Query1NITEMPRESA: TStringField;
    Query1LOGOEMPRESA: TBlobField;
    Table1: TTable;
    DataSource1: TDataSource;
    QRBand2: TQRBand;
    QRShape4: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    qrdbNombreInformante: TQRDBText;
    qrdbNombreSolicitante: TQRDBText;
    QRLabel6: TQRLabel;
    qrdbTelefono: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    qrdbNodoFisico: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    qrdbNombreAdministrativo: TQRDBText;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    qrdbFechaDictado: TQRDBText;
    qrdbFechaLlegada: TQRDBText;
    qrdbFechaAtencion: TQRDBText;
    QRLabel17: TQRLabel;
    qrdbEstadoReporte: TQRDBText;
    qrdbDescripcion: TQRDBText;
    qrdbObservacion: TQRDBText;
    QRLabel20: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel21: TQRLabel;
    qSe_Solicitud: TQuery;
    dsSe_solicitud: TDataSource;
    qSe_SolicitudNOMBREESTADOSOLICITUD: TStringField;
    qSe_SolicitudNOMBREAREAFUNCIONAL: TStringField;
    qSe_SolicitudINFORMANTE: TStringField;
    qSe_SolicitudSOPORTE: TStringField;
    qSe_SolicitudNOMBREPRIORIDADSOLICITUD: TStringField;
    qSe_SolicitudNOMBRETIPOSOLICITUD: TStringField;
    qSe_SolicitudNOMBREAPLICATIVO: TStringField;
    qSe_SolicitudNOMBRECATEGORIA: TStringField;
    qSe_SolicitudCODIGOSOLICITUD: TFloatField;
    qSe_SolicitudCODIGOCIASOLICITA: TFloatField;
    qSe_SolicitudCODIGOUSUARIOINFORMANTE: TFloatField;
    qSe_SolicitudCODIGOUSUARIOSOLICITA: TFloatField;
    qSe_SolicitudCODIGOUSUARIOSOPORTE: TFloatField;
    qSe_SolicitudFECHAHORASOLICITUD: TDateTimeField;
    qSe_SolicitudCODIGOTIPOSOLICITUD: TFloatField;
    qSe_SolicitudCODIGOPRIORIDADSOLICITUD: TFloatField;
    qSe_SolicitudCODIGOESTADOSOLICITUD: TFloatField;
    qSe_SolicitudNOMBRESOLICITUD: TStringField;
    qSe_SolicitudDESCRIPCIONSOLICITUD: TBlobField;
    qSe_SolicitudTELEFONOCIASOLICITA: TFloatField;
    qSe_SolicitudEXTENSIONCIASOLICITA: TFloatField;
    qSe_SolicitudFECHAINICIALASIGNADA: TDateTimeField;
    qSe_SolicitudFECHAFINALASIGNADA: TDateTimeField;
    qSe_SolicitudFECHAINICIALEJECUTADA: TDateTimeField;
    qSe_SolicitudFECHAFINALEJECUTADA: TDateTimeField;
    qSe_SolicitudCODIGOAPLICATIVO: TFloatField;
    qSe_SolicitudOBSERVACIONES: TStringField;
    qSe_SolicitudFECHAHORAREGISTRO: TDateTimeField;
    qSe_SolicitudCODIGOUSUARIOCREACION: TFloatField;
    qSe_SolicitudCODIGOAREAFUNCIONAL: TFloatField;
    QRLabel19: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRLabel23: TQRLabel;
    QRDBText5: TQRDBText;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel26: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    qlPagina: TQRSysData;
    QRDBText10: TQRDBText;
    QRLabel22: TQRLabel;
    QRSysData1: TQRSysData;
    QRImage1: TQRImage;
    QRImage2: TQRImage;
    qSe_SolicitudSOLICITANTE: TStringField;
    qSe_SolicitudFECHAHORAMODIFICACION: TDateTimeField;
    qSe_SolicitudCODIGOUSUARIOMODIFICACION: TFloatField;
    QRLabel3: TQRLabel;
    QRShape3: TQRShape;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrSolicitudSoporteAfterPreview(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRSolicitudSoporte: TfQRSolicitudSoporte;

implementation
uses
ulistasoporte;
{$R *.DFM}

procedure TfQRSolicitudSoporte.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfQRSolicitudSoporte.qrSolicitudSoporteAfterPreview(
  Sender: TObject);
begin
  close;
end;

end.
