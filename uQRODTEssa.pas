unit uQRODTEssa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, Db, DBTables, ExtCtrls, DBCtrls;

type
  TfQRODTEssa = class(TForm)
    QuickReport: TQuickRep;
    QRBand1: TQRBand;
    Query1: TQuery;
    Query1NOMBREEMPRESA: TStringField;
    Query1NITEMPRESA: TStringField;
    Query1LOGOEMPRESA: TBlobField;
    DataSource1: TDataSource;
    Table1: TTable;
    Table2: TTable;
    QRShape1: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRLabel1: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    qrdbCodigoODT: TQRDBText;
    qrdbFechaEmision: TQRDBText;
    QRLabel4: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    qrlDireccion: TQRLabel;
    qrlBarrio: TQRLabel;
    qrlCiudad: TQRLabel;
    qrlZona: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRLabel14: TQRLabel;
    qrdbMotivos: TQRDBText;
    QRShape13: TQRShape;
    QRLabel15: TQRLabel;
    QRRectangulo16: TQRShape;
    qrlPrioridadUrgente: TQRLabel;
    QRRectangulo15: TQRShape;
    qrlPrioridadNormal: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRShape14: TQRShape;
    QRLabel16: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRShape21: TQRShape;
    QRShape18: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    qrlLaborVisitar: TQRLabel;
    qrlLaborProgramar: TQRLabel;
    qrlLaborCorregir: TQRLabel;
    qrlLaborModificar: TQRLabel;
    qrlLaborInformar: TQRLabel;
    qrlLaborOtros: TQRLabel;
    QRShape22: TQRShape;
    QRLabel23: TQRLabel;
    qrdbResponsable: TQRDBText;
    QRLabel24: TQRLabel;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    qrlEnergizado: TQRLabel;
    qrlDesenergizado: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel27: TQRLabel;
    qrlNotasCoordinador: TQRLabel;
    QRShape29: TQRShape;
    QRLabel28: TQRLabel;
    qrlAprobado: TQRLabel;
    QRShape27: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    qrdbFechaAprobacion: TQRDBText;
    qrdbFechaAsignacion: TQRDBText;
    qrdbFechaInicioTrabajo: TQRDBText;
    qrdbFechaFinalTrabajo: TQRDBText;
    QRLabel35: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape30: TQRShape;
    QRShape28: TQRShape;
    qrlNoVales: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel43: TQRLabel;
    qrlSecuenciaTrabajos1: TQRLabel;
    QRLabel58: TQRLabel;
    QRShape41: TQRShape;
    QRLabel59: TQRLabel;
    QRShape42: TQRShape;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    qrlMedidas1: TQRLabel;
    qrlMedidas2: TQRLabel;
    qrlMedidas3: TQRLabel;
    qrlMedidas4: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    qrlMedidas5: TQRLabel;
    qrlMedidas6: TQRLabel;
    qrlMedidas7: TQRLabel;
    QRLabel64: TQRLabel;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRLabel65: TQRLabel;
    qrlSecuenciaTrabajos2: TQRLabel;
    QRShape52: TQRShape;
    QRLabel66: TQRLabel;
    qrlDanosEncontrados1: TQRLabel;
    qrlDanosEncontrados2: TQRLabel;
    qrlDanosEncontrados3: TQRLabel;
    QRShape53: TQRShape;
    QRLabel67: TQRLabel;
    QRLabel71: TQRLabel;
    qrlCausasRetrasos: TQRLabel;
    qrlObservaciones: TQRLabel;
    qrlEncargadoTrabajo: TQRLabel;
    qrlDivision: TQRLabel;
    qrlSeccion: TQRLabel;
    qrlTarea: TQRLabel;
    qrlCuadrilla: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRODTEssa: TfQRODTEssa;

implementation

{$R *.DFM}

procedure TfQRODTEssa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BEEP;
end;

end.
