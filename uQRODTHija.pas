unit uQRODTHija;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, DBTables, Db;

type
  TfQRODTHija = class(TForm)
    QuickRep: TQuickRep;
    QRBand1: TQRBand;
    qEmpresa: TQuery;
    QRDBImage1: TQRDBImage;
    qrdbNombreEmpresa: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel50: TQRLabel;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape1: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRDBText12: TQRDBText;
    QRBand3: TQRBand;
    QRLabel12: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel13: TQRLabel;
    tEmpresaLogo: TTable;
    QRLabel15: TQRLabel;
    QRDBText13: TQRDBText;
    QRLabel17: TQRLabel;
    QRDBText15: TQRDBText;
    QRShape5: TQRShape;
    QRLabel18: TQRLabel;
    QRDBText16: TQRDBText;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape13: TQRShape;
    ChildBand2: TQRChildBand;
    qODTHija: TQuery;
    qODTHijaCODIGOODT: TFloatField;
    qODTHijaCONSECUTIVO: TFloatField;
    qODTHijaFECHAINICIOTRABAJO: TDateTimeField;
    qODTHijaFECHAFINALTRABAJO: TDateTimeField;
    qODTHijaNOMBRECATEGORIA: TStringField;
    qODTHijaOBSERVACION1: TMemoField;
    qODTHijaOBSERVACION2: TMemoField;
    QRDBText14: TQRDBText;
    QRLabel16: TQRLabel;
    qrlusuariobd: TQRLabel;
    QRShape25: TQRShape;
    QRLabel21: TQRLabel;
    QRLabel2: TQRLabel;
    qReportes: TQuery;
    qPresmano: TQuery;
    dsOdtHija: TDataSource;
    qReportesCONSECUTIVO: TFloatField;
    qReportesCODIGOREPORTE: TFloatField;
    qReportesCOLOR: TFloatField;
    qReportesNOMBREESTADOREPORTE: TStringField;
    QRSubDetail1: TQRSubDetail;
    QRDBText3: TQRDBText;
    QRShape16: TQRShape;
    QRDBText5: TQRDBText;
    GroupHeaderBand1: TQRBand;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape17: TQRShape;
    QRDBText2: TQRDBText;
    QRSubDetail2: TQRSubDetail;
    qPresmanoCODIGOEMPLEADO: TFloatField;
    qPresmanoNOMBREEMPLEADO: TStringField;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand4: TQRBand;
    QRShape2: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape10: TQRShape;
    QRSubDetail3: TQRSubDetail;
    qGrupoTrabajo: TQuery;
    qODTHijaCODIGOGRUPOTRABAJO: TFloatField;
    qODTHijaCODIGOADMINISTRATIVO: TFloatField;
    qODTHijanombregrupotrabajo: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRODTHija: TfQRODTHija;

implementation

{$R *.DFM}

procedure TfQRODTHija.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfQRODTHija.QuickRepAfterPreview(Sender: TObject);
begin
  Close;
end;

procedure TfQRODTHija.FormCreate(Sender: TObject);
var
qconsulta: tquery;
begin
    qConsulta:= TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qconsulta.sql.text:= 'select upper(user||''@''||SYS_CONTEXT (''USERENV'', ''db_name'')) as usuario from dual';
    qconsulta.open;
    qrlusuariobd.Caption:= qconsulta.FieldByName('usuario').asstring;
    qconsulta.free;
  //liberar:=true;
end;

end.
