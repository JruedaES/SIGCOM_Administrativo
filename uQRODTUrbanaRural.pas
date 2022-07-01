unit uQRODTUrbanaRural;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, StdCtrls, ComCtrls;

type
  TfQRODTUrbanaRural = class(TForm)
    QuickRep: TQuickRep;
    TitleBand: TQRBand;
    ShTitulo: TQRShape;
    QRDBImage1: TQRDBImage;
    qrdbNombreEmpresa: TQRDBText;
    QRDBText2: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    qrdbCodigoODT: TQRDBText;
    qrdbFechaEmision: TQRDBText;
    QRLabel4: TQRLabel;
    QRLabel3: TQRLabel;
    qEmpresa: TQuery;
    qEmpresaNOMBREEMPRESA: TStringField;
    qEmpresaNITEMPRESA: TStringField;
    qEmpresaLOGOEMPRESA: TBlobField;
    dsEmpresa: TDataSource;
    QRShape1: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape6: TQRShape;
    qrlDireccion: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape2: TQRShape;
    qrlCIG: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape5: TQRShape;
    qrlSubestacion: TQRLabel;
    qrlTipoElemento: TQRLabel;
    qrlEquipo: TQRLabel;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRLabel8: TQRLabel;
    qrlVehiculos: TQRLabel;
    QRShape7: TQRShape;
    QRLabel9: TQRLabel;
    qrlNormal: TQRLabel;
    QRShape21: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape8: TQRShape;
    qrlUrgente: TQRLabel;
    qrlEmergencia: TQRLabel;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape12: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    qrlEnergizado: TQRLabel;
    QRShape13: TQRShape;
    qrlDesenergizado: TQRLabel;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRLabel24: TQRLabel;
    qrlLabor: TQRLabel;
    QRShape16: TQRShape;
    QRLabel26: TQRLabel;
    qrlTarea: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    qrdbFechaAprobacion: TQRDBText;
    qrdbFechaAsignacion: TQRDBText;
    qrdbFechaInicioTrabajo: TQRDBText;
    qrdbFechaFinalTrabajo: TQRDBText;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    qrdbMotivos: TQRDBText;
    QRShape17: TQRShape;
    QRLabel22: TQRLabel;
    qrdbObservacion2: TQRDBText;
    QRShape18: TQRShape;
    QRLabel23: TQRLabel;
    qrdbObservacion3: TQRDBText;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRLabel25: TQRLabel;
    qrlAdministrativo: TQRLabel;
    QRLabel33: TQRLabel;
    qrlTipoManoObra: TQRLabel;
    QRLabel27: TQRLabel;
    qrlGrupoTrabajo: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    qrlAprobado: TQRLabel;
    qrlRevisado: TQRLabel;
    qrlEjecutado: TQRLabel;
    QRedMedidas1: TQRRichText;
    RichEdit1: TRichEdit;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    qrdbCostoManoObra: TQRDBText;
    qrdbCostoMaterial: TQRDBText;
    qrdbCostoTransporte: TQRDBText;
    qrdbCostoEquipo: TQRDBText;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    qrdbCostoManoObraP: TQRDBText;
    qrdbCostoMaterialP: TQRDBText;
    qrdbCostoTransporteP: TQRDBText;
    qrdbCostoEquipoP: TQRDBText;
    QRShape24: TQRShape;
    QRLabel44: TQRLabel;
    QRLabel38: TQRLabel;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRLabel34: TQRLabel;
    QRLabel39: TQRLabel;
    QRShape11: TQRShape;
    QRShape25: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    tEmpresaLogo: TTable;
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRODTUrbanaRural: TfQRODTUrbanaRural;

implementation

{$R *.DFM}

procedure TfQRODTUrbanaRural.QuickRepAfterPreview(Sender: TObject);
begin
  Close;
end;

procedure TfQRODTUrbanaRural.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

end.
