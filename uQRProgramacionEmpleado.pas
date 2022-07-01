unit uQRProgramacionEmpleado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, QuickRpt, Db, DBTables, ExtCtrls, Digisoft, StdCtrls;

type
  TFQRProgramacionEmpleado = class(TForm)
    QuickRep: TQuickRep;
    TitleBand1: TQRBand;
    DetailBand1: TQRBand;
    SummaryBand1: TQRBand;
    BandaTitulo: TQRBand;
    QRDBImage1: TQRDBImage;
    qrdbNombreEmpresa: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBText6: TQRDBText;
    QRShape5: TQRShape;
    qrlProyectoEnergis: TQRLabel;
    qrTitulo: TQRLabel;
    qrdbFechaProgramacion: TQRDBText;
    qrdbNombreEmpleado: TQRDBText;
    qrdbD1: TQRDBText;
    qrdbD2: TQRDBText;
    qrdbD3: TQRDBText;
    qrdbD4: TQRDBText;
    qrdbD5: TQRDBText;
    qrdbD6: TQRDBText;
    qrdbD7: TQRDBText;
    qrdbD8: TQRDBText;
    qrdbD9: TQRDBText;
    qrdbD10: TQRDBText;
    qrdbD11: TQRDBText;
    qrdbD12: TQRDBText;
    qrdbD13: TQRDBText;
    qrdbD14: TQRDBText;
    qrdbD15: TQRDBText;
    qrdbD16: TQRDBText;
    qrdbD17: TQRDBText;
    qrdbD18: TQRDBText;
    qrdbD19: TQRDBText;
    qrdbD20: TQRDBText;
    qrdbD21: TQRDBText;
    qrdbD22: TQRDBText;
    qrdbD23: TQRDBText;
    qrdbD24: TQRDBText;
    qrdbD25: TQRDBText;
    qrdbD26: TQRDBText;
    qrdbD27: TQRDBText;
    qrdbD28: TQRDBText;
    qrdbD29: TQRDBText;
    qrdbD30: TQRDBText;
    qrdbD31: TQRDBText;
    ColumnHeaderBand1: TQRBand;
    qrlD1: TQRLabel;
    qrlD2: TQRLabel;
    qrlD3: TQRLabel;
    qrlD4: TQRLabel;
    qrlD5: TQRLabel;
    qrlD6: TQRLabel;
    qrlD7: TQRLabel;
    qrlD14: TQRLabel;
    qrlD13: TQRLabel;
    qrlD12: TQRLabel;
    qrlD11: TQRLabel;
    qrlD10: TQRLabel;
    qrlD9: TQRLabel;
    qrlD8: TQRLabel;
    qrlD21: TQRLabel;
    qrlD20: TQRLabel;
    qrlD19: TQRLabel;
    qrlD18: TQRLabel;
    qrlD17: TQRLabel;
    qrlD16: TQRLabel;
    qrlD15: TQRLabel;
    qrlD24: TQRLabel;
    qrlD23: TQRLabel;
    qrlD22: TQRLabel;
    qrlD31: TQRLabel;
    qrlD30: TQRLabel;
    qrlD29: TQRLabel;
    qrlD28: TQRLabel;
    qrlD27: TQRLabel;
    qrlD26: TQRLabel;
    qrlD25: TQRLabel;
    qrdbNombreProgramacion: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
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
    QRShape16: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape51: TQRShape;
    QRShape52: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape57: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape69: TQRShape;
    qEmpresa: TQuery;
    ChildBand1: TQRChildBand;
    ChildBand2: TQRChildBand;
    tEmpresaLogo: TTable;
    qrdbCia: TQRDBText;
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qrdbFechaProgramacionPrint(sender: TObject; var Value: String);
    procedure qrdbDiaPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FQRProgramacionEmpleado: TFQRProgramacionEmpleado;

implementation

{$R *.DFM}

procedure TFQRProgramacionEmpleado.QuickRepAfterPreview(Sender: TObject);
begin
  Close;
end;

procedure TFQRProgramacionEmpleado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFQRProgramacionEmpleado.qrdbFechaProgramacionPrint(sender: TObject;
  var Value: String);
begin
  Value:=UpperCase(Value);
end;

procedure TFQRProgramacionEmpleado.qrdbDiaPrint(sender: TObject;
  var Value: String);
begin
  if Value='0' then Value:='D';
end;

end.
