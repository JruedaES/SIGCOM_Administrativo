unit uQRListaODTAuxilios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, DBTables, Db, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TFQRListaODTAuxilios = class(TFBase)
    qEmpresa: TQuery;
    qAuxilioAlimentacion: TQuery;
    tEmpresaLogo: TTable;
    qrAuxilio: TQuickRep;
    TitleBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    qrdbNombreEmpresa: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel50: TQRLabel;
    QRLabel10: TQRLabel;
    DetailBand1: TQRBand;
    qrdbCodigoOdt: TQRDBText;
    qrdbFecha: TQRDBText;
    qrdbImputacionDesayunos: TQRDBText;
    qrdbImputacionAlmuerzos: TQRDBText;
    qrdbImputacionComidas: TQRDBText;
    qreSubTotal: TQRExpr;
    QRBandFooter: TQRBand;
    QRLabel5: TQRLabel;
    qreTotalEmpleado: TQRExpr;
    qreDesayunos: TQRExpr;
    qreAlmuerzos: TQRExpr;
    qreComidas: TQRExpr;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    qreViaticosTotales: TQRExpr;
    qrePeajeTotales: TQRExpr;
    qreParqueoTotales: TQRExpr;
    qreTotales: TQRExpr;
    qrdbCantidadDesayunos: TQRDBText;
    qrdbCantidadAlmuerzos: TQRDBText;
    qrdbCantidadComidas: TQRDBText;
    qDesayunos: TQuery;
    qAlmuerzos: TQuery;
    qComidas: TQuery;
    qDesayunosNOMBREEMPLEADO: TStringField;
    qDesayunosCODIGOSUELDO: TStringField;
    qDesayunosCODIGOODT: TFloatField;
    qDesayunosVALORIMPUTACION: TFloatField;
    qAlmuerzosNOMBREEMPLEADO: TStringField;
    qAlmuerzosCODIGOSUELDO: TStringField;
    qAlmuerzosCODIGOODT: TFloatField;
    qAlmuerzosVALORIMPUTACION: TFloatField;
    qComidasNOMBREEMPLEADO: TStringField;
    qComidasCODIGOSUELDO: TStringField;
    qComidasCODIGOODT: TFloatField;
    qComidasVALORIMPUTACION: TFloatField;
    qreCantidadDesayunos: TQRExpr;
    qreCantidadAlmuerzos: TQRExpr;
    qreCantidadComidas: TQRExpr;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRExpr3: TQRExpr;
    qDesayunosCODIGOAUXILIO: TFloatField;
    qAlmuerzosCODIGOAUXILIO: TFloatField;
    qComidasCODIGOAUXILIO: TFloatField;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText8: TQRDBText;
    QRExpr4: TQRExpr;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    qAuxilioPeaje: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField4: TFloatField;
    qAuxilioPasaje: TQuery;
    StringField5: TStringField;
    StringField6: TStringField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField10: TFloatField;
    qAuxilioParqueo: TQuery;
    StringField9: TStringField;
    StringField10: TStringField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField16: TFloatField;
    qAuxilioGasolina: TQuery;
    StringField13: TStringField;
    StringField14: TStringField;
    FloatField19: TFloatField;
    FloatField20: TFloatField;
    FloatField22: TFloatField;
    QRExpr8: TQRExpr;
    QRExpr9: TQRExpr;
    QRExpr10: TQRExpr;
    QRExpr11: TQRExpr;
    qrsDatosFiltro: TQRShape;
    qrmRotulos1: TQRMemo;
    qrmDatos1: TQRMemo;
    qrmPuntos1: TQRMemo;
    qrmRotulos2: TQRMemo;
    qrmPuntos2: TQRMemo;
    qrmDatos2: TQRMemo;
    qrsFiltrodatos: TQRShape;
    qrlFiltroDatos: TQRLabel;
    QRImage2: TQRImage;
    qAuxilioAlimentacionNOMBREEMPLEADO: TStringField;
    qAuxilioAlimentacionCODIGOSUELDO: TStringField;
    qAuxilioAlimentacionCODIGOODT: TFloatField;
    qAuxilioAlimentacionCODIGOAUXILIO: TFloatField;
    qAuxilioAlimentacionCANTIDADDESAYUNOS: TFloatField;
    qAuxilioAlimentacionCANTIDADALMUERZOS: TFloatField;
    qAuxilioAlimentacionCANTIDADCOMIDAS: TFloatField;
    qAuxilioAlimentacionValorDesayunos: TFloatField;
    qAuxilioAlimentacionValorAlmuerzos: TFloatField;
    qAuxilioAlimentacionValorComidas: TFloatField;
    qAuxilioAlimentacionValorPasajes: TFloatField;
    qAuxilioAlimentacionValorPeajes: TFloatField;
    qAuxilioAlimentacionValorGasolina: TFloatField;
    qAuxilioAlimentacionValorParqueo: TFloatField;
    qAuxilioAlimentacionCODIGOADMINISTRATIVO: TFloatField;
    qDesayunosCODIGOADMINISTRATIVO: TFloatField;
    qAlmuerzosCODIGOADMINISTRATIVO: TFloatField;
    qComidasCODIGOADMINISTRATIVO: TFloatField;
    qAuxilioPeajeCODIGOADMINISTRATIVO: TFloatField;
    qAuxilioPasajeCODIGOADMINISTRATIVO: TFloatField;
    qAuxilioParqueoCODIGOADMINISTRATIVO: TFloatField;
    qAuxilioGasolinaCODIGOADMINISTRATIVO: TFloatField;
    QRGroup2: TQRGroup;
    QRGroup1: TQRGroup;
    QRDBText1: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel7: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRDBText9: TQRDBText;
    QRBandGrupoCia: TQRBand;
    QRLabel15: TQRLabel;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRBand2: TQRBand;
    QRSysData1: TQRSysData;
    ChildBand2: TQRChildBand;
    qAuxilioAlimentacionFECHA: TStringField;
    qDesayunosFECHA: TStringField;
    qAlmuerzosFECHA: TStringField;
    qComidasFECHA: TStringField;
    qAuxilioPeajeFECHA: TStringField;
    qAuxilioPasajeFECHA: TStringField;
    qAuxilioParqueoFECHA: TStringField;
    qAuxilioGasolinaFECHA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrAuxilioAfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure qrAuxilioBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    ListaRotulos, ListaDatos : TStringList;
  end;

var
  FQRListaODTAuxilios: TFQRListaODTAuxilios;

implementation

{$R *.DFM}

procedure TFQRListaODTAuxilios.FormCreate(Sender: TObject);
begin
  inherited;
  ListaRotulos := TStringList.Create;
  ListaDatos   := TStringList.Create;
end;

{Este procedimiento inicializa los valores de las expresiones calculadas para cada uno de los
empleados del reporte.}
procedure TFQRListaODTAuxilios.QRGroup1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  Sender.Color := clSilver;
  qreSubTotal.Reset;
  qreTotalEmpleado.Reset;
  qreDesayunos.Reset;
  qreCantidadDesayunos.Reset;
  qreAlmuerzos.Reset;
  qreCantidadAlmuerzos.Reset;
  qreComidas.Reset;
  qreCantidadComidas.Reset;
end;

procedure TFQRListaODTAuxilios.qrAuxilioAfterPreview(
  Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFQRListaODTAuxilios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFQRListaODTAuxilios.FormDestroy(Sender: TObject);
begin
  inherited;
  ListaRotulos.Free;
  ListaDatos.Free;
end;

{Este procedimiento escribe en el cuadro FILTRO DE DATOS los campos por los cuales han sido filtradas
las ordenes de trabajo en el formulario fListaODTUrbanaRural.}
procedure TFQRListaODTAuxilios.qrAuxilioBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
var
  I, N, M, Alto : integer;
  Cadena : string;
begin
  inherited;
  if ListaDatos.Count > 0 then
  begin
     TitleBand1.Height := 120;

     qrmRotulos1.Enabled := True;
     qrmRotulos2.Enabled := True;

     qrmDatos1.Enabled := True;
     qrmDatos2.Enabled := True;

     qrmPuntos1.Enabled := True;
     qrmPuntos2.Enabled := True;

     qrsDatosFiltro.Enabled := True;
     qrlFiltroDatos.Enabled := True;
     qrsFiltroDatos.Enabled := True;

     qrmRotulos1.Lines.Clear;
     qrmRotulos2.Lines.Clear;
     qrmDatos1.Lines.Clear;
     qrmDatos2.Lines.Clear;
     qrmPuntos1.Lines.Clear;
     qrmPuntos2.Lines.Clear;

     n := (ListaDatos.Count div 2);
     m := (ListaDatos.Count mod 2);
     for i:=0 to n+m-1 do
     begin
       qrmRotulos1.Lines.Add(ListaRotulos[i]);
       Cadena := ListaDatos[i];
       Delete(Cadena,1,Pos('=',Cadena));
       qrmDatos1.Lines.Add(Cadena);
       qrmPuntos1.Lines.Add(':');
     end;
     for i:=n+m to ListaDatos.Count-1 do
     begin
       qrmRotulos2.Lines.Add(ListaRotulos[i]);
       Cadena := ListaDatos[i];
       Delete(Cadena,1,Pos('=',Cadena));
       qrmDatos2.Lines.Add(Cadena);
       qrmPuntos2.Lines.Add(':');
     end;
     Alto := 15;
     qrmRotulos1.Height := Alto*(n+m);
     qrmRotulos2.Height := Alto*(n+m);
     qrmDatos1.Height := Alto*(n+m);
     qrmDatos2.Height := Alto*(n+m);
     qrmPuntos1.Height := Alto*(n+m);
     qrmPuntos2.Height := Alto*(n+m);
     qrsDatosFiltro.Height := Alto*(n+m)+Alto;
     TitleBand1.Height := TitleBand1.Height+Alto*(n+m)+5;
  end;
end;

end.
    