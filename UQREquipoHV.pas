unit UQREquipoHV;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, Db, DBTables, ExtCtrls, jpeg;

type
  TFQREquipoHV = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel3: TQRLabel;
    QRLbNombreSubestacion: TQRLabel;
    QRLbNombreCircuito: TQRLabel;
    QRLbAmbito: TQRLabel;
    QRLbTipoElemento: TQRLabel;
    QRLbElemento: TQRLabel;
    QRLbSubestacion: TQRLabel;
    QRLbCircuito: TQRLabel;
    tEmpresaLogo: TTable;
    tEmpresaLogoCODIGOEMPRESA: TStringField;
    tEmpresaLogoCONSECUTIVO: TStringField;
    tEmpresaLogoLOGOEMPRESA: TBlobField;
    dsEmpresaLogo: TDataSource;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    qNombreFormato: TQuery;
    qNombreFormatoCODIGOFORMATOMTTO: TFloatField;
    qNombreFormatoNOMBREFORMATOMTTO: TStringField;
    qNombreFormatoCODIGOCOORDINACION: TFloatField;
    qNombreSeccion: TQuery;
    qNombreSeccionCODIGOSECCIONFORMATO: TFloatField;
    qNombreSeccionCODIGOFORMATOMTTO: TFloatField;
    qNombreSeccionNOMBRESECCIONFORMATO: TStringField;
    qNombreSeccionCONSECUTIVOSECCIONFORMATO: TFloatField;
    qSeccionDatos: TQuery;
    qSeccionDatosCODIGOSECCIONFORMATODATOS: TFloatField;
    qSeccionDatosCODIGOFORMATOMTTODATOS: TFloatField;
    qSeccionDatosCODIGOSECCIONFORMATO: TFloatField;
    qSeccionDatosNOMBRESECCIONFORMATO: TStringField;
    qSeccionDatosCODIGOODT: TFloatField;
    qSeccionDatosSUBACTIVIDADODT: TFloatField;
    qSeccionDatosESTADOTERMINADO: TStringField;
    qSeccionDatosFECHAREGISTRO: TDateTimeField;
    qSeccionDatosFECHAMODIFICACION: TDateTimeField;
    qSeccionDatosFECHAPRUEBA: TDateTimeField;
    dsSeccionDatos: TDataSource;
    qFormatoDatos: TQuery;
    qFormatoDatosCODIGOFORMATOMTTODATOS: TFloatField;
    qFormatoDatosCODIGOFORMATOMTTO: TFloatField;
    qFormatoDatosCODIGOADMINISTRATIVO: TFloatField;
    qFormatoDatosCODIGOUSUARIOCREACION: TFloatField;
    qFormatoDatosFECHACREACION: TDateTimeField;
    qFormatoDatosCODIGOUSUARIOMODIFICACION: TFloatField;
    qFormatoDatosFECHAULTIMAMODIFICACION: TDateTimeField;
    qFormatoDatosCODIGOAMBITO: TFloatField;
    qFormatoDatosCODIGOSUBESTACION: TStringField;
    qFormatoDatosCODIGOCOORDINACION: TFloatField;
    qFormatoDatosCODIGOTIPOMTTO: TFloatField;
    qFormatoDatosCODIGOCIRCUITO: TStringField;
    qFormatoDatosCODIGOTIPOELEMENTO: TFloatField;
    qFormatoDatosFECHAPRUEBA: TDateTimeField;
    dsFormatoDatos: TDataSource;
    qFormatoDatosNombreFormatoMtto: TStringField;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape3: TQRShape;
    QRShape6: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape4: TQRShape;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRShape9: TQRShape;
    QRShape12: TQRShape;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRLabel5: TQRLabel;
    QRLbFecha: TQRLabel;
    qlPagina: TQRSysData;
    QRImage2: TQRImage;
    qFormatoDatosCODIGOELEMENTO: TStringField;
    qFormatoDatosCLELEMENTO1: TStringField;
    qFormatoDatosCLELEMENTO2: TStringField;
    qFormatoDatosCODIGOODT: TFloatField;
    qFormatoDatosCONSECUTIVOODT: TFloatField;
    qSeccionDatosCODIGOUSUARIOCREACION: TFloatField;
    qSeccionDatosCODIGOUSUARIOMODIFICACION: TFloatField;
    qNombreSubactividad: TQuery;
    qNombreSubactividadCODIGOSUBACTIVIDADAREAODT: TFloatField;
    qNombreSubactividadNOMBRESUBACTIVIDADAREAODT: TStringField;
    dsNombreSubactividad: TDataSource;
    QRDBText2: TQRDBText;
    QRLabel8: TQRLabel;
    procedure QuickRep1AfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FQREquipoHV: TFQREquipoHV;

implementation

{$R *.DFM}

procedure TFQREquipoHV.QuickRep1AfterPreview(Sender: TObject);
begin
  close;
  qFormatoDatos.free;
  qSeccionDatos.free;
  qNombreSubactividad.free;
  qNombreFormato.free;

end;

procedure TFQREquipoHV.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

end.
