unit uQRListaODTViaticos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, DBTables, Db, Qrctrls, QuickRpt, ExtCtrls, jpeg;

type
  TFQRListaODTViaticos = class(TFBase)
    qEmpresa: TQuery;
    qViaticos: TQuery;
    tEmpresaLogo: TTable;
    qPeaje: TQuery;
    qGasolina: TQuery;
    qParqueo: TQuery;
    qPasajes: TQuery;
    qAuxilioViaje: TQuery;
    qViaticosNOMBREEMPLEADO: TStringField;
    qViaticosCODIGOSUELDO: TStringField;
    qViaticosCODIGOODT: TFloatField;
    qViaticosCODIGOCOMISION: TFloatField;
    qPeajeNOMBREEMPLEADO: TStringField;
    qPeajeCODIGOSUELDO: TStringField;
    qPeajeCODIGOODT: TFloatField;
    qPeajeCODIGOCOMISION: TFloatField;
    qPeajeVALORIMPUTACION: TFloatField;
    qParqueoNOMBREEMPLEADO: TStringField;
    qParqueoCODIGOSUELDO: TStringField;
    qParqueoCODIGOODT: TFloatField;
    qParqueoCODIGOCOMISION: TFloatField;
    qParqueoVALORIMPUTACION: TFloatField;
    qGasolinaNOMBREEMPLEADO: TStringField;
    qGasolinaCODIGOSUELDO: TStringField;
    qGasolinaCODIGOODT: TFloatField;
    qGasolinaCODIGOCOMISION: TFloatField;
    qGasolinaVALORIMPUTACION: TFloatField;
    qPasajesNOMBREEMPLEADO: TStringField;
    qPasajesCODIGOSUELDO: TStringField;
    qPasajesCODIGOODT: TFloatField;
    qPasajesCODIGOCOMISION: TFloatField;
    qPasajesVALORIMPUTACION: TFloatField;
    qAuxilioViajeNOMBREEMPLEADO: TStringField;
    qAuxilioViajeCODIGOSUELDO: TStringField;
    qAuxilioViajeCODIGOODT: TFloatField;
    qAuxilioViajeCODIGOCOMISION: TFloatField;
    qAuxilioViajeVALORIMPUTACION: TFloatField;
    qViaticosVALORIMPUTACION: TFloatField;
    qViaticosCODIGOVIATICO: TFloatField;
    qPeajeCODIGOVIATICO: TFloatField;
    qParqueoCODIGOVIATICO: TFloatField;
    qGasolinaCODIGOVIATICO: TFloatField;
    qPasajesCODIGOVIATICO: TFloatField;
    qAuxilioViajeCODIGOVIATICO: TFloatField;
    qViaticosValorPeaje: TFloatField;
    qViaticosValorParqueo: TFloatField;
    qViaticosValorGasolina: TFloatField;
    qViaticosValorPasajes: TFloatField;
    qViaticosValorAuxilioViaje: TFloatField;
    qOtros: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    qViaticosValorOtros: TFloatField;
    qViaticosCODIGOADMINISTRATIVO: TFloatField;
    qNombreDependencia: TQuery;
    qViaticosNombreDependencia: TStringField;
    qrViatico: TQuickRep;
    TitleBand1: TQRBand;
    qrsDatosFiltro: TQRShape;
    QRDBImage2: TQRDBImage;
    QRDBText2: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel19: TQRLabel;
    qrmRotulos1: TQRMemo;
    qrmDatos1: TQRMemo;
    qrmPuntos1: TQRMemo;
    qrmRotulos2: TQRMemo;
    qrmPuntos2: TQRMemo;
    qrmDatos2: TQRMemo;
    qrsFiltroDatos: TQRShape;
    qrlFiltroDatos: TQRLabel;
    QRImage1: TQRImage;
    QRBand3: TQRBand;
    qrgBandaDependencia: TQRGroup;
    BandaFooterDependencia: TQRBand;
    qrgBandaEmpleado: TQRGroup;
    bandaFooterEmpleado: TQRBand;
    QRDBText4: TQRDBText;
    qViaticosCODIGOEMPLEADO: TFloatField;
    QRDBText8: TQRDBText;
    ChildBand2: TQRChildBand;
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
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRDBText14: TQRDBText;
    QRDBText15: TQRDBText;
    QRDBText16: TQRDBText;
    QRDBText17: TQRDBText;
    qreSubTotal: TQRExpr;
    QRDBText18: TQRDBText;
    QRLabel32: TQRLabel;
    qreTotalEmpleado: TQRExpr;
    qreViaticos: TQRExpr;
    qrePeaje: TQRExpr;
    qreParqueo: TQRExpr;
    qreGasolina: TQRExpr;
    qrePasajes: TQRExpr;
    qreAuxilioViaje: TQRExpr;
    qreOtros: TQRExpr;
    QRLabel33: TQRLabel;
    QRExpr11: TQRExpr;
    QRExpr12: TQRExpr;
    QRExpr13: TQRExpr;
    QRExpr14: TQRExpr;
    QRExpr15: TQRExpr;
    QRExpr16: TQRExpr;
    QRExpr17: TQRExpr;
    QRExpr18: TQRExpr;
    QRBand4: TQRBand;
    QRLabel34: TQRLabel;
    QRExpr19: TQRExpr;
    QRExpr20: TQRExpr;
    QRExpr21: TQRExpr;
    QRExpr22: TQRExpr;
    QRExpr23: TQRExpr;
    QRExpr24: TQRExpr;
    QRExpr25: TQRExpr;
    QRExpr26: TQRExpr;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    qMotivo: TQuery;
    dsViaticos: TDataSource;
    QRDBText5: TQRDBText;
    qViaticosFECHA: TStringField;
    qPeajeFECHA: TStringField;
    qParqueoFECHA: TStringField;
    qGasolinaFECHA: TStringField;
    qPasajesFECHA: TStringField;
    qAuxilioViajeFECHA: TStringField;
    qOtrosFECHA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qrViaticoBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure qrViaticoAfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QRDBText1Print(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
    ListaRotulos, ListaDatos : TStringList;
  end;

var
  FQRListaODTViaticos: TFQRListaODTViaticos;

implementation

{$R *.DFM}

procedure TFQRListaODTViaticos.FormCreate(Sender: TObject);
begin
  inherited;
  ListaRotulos := TStringList.Create;
  ListaDatos   := TStringList.Create;
end;

procedure TFQRListaODTViaticos.FormDestroy(Sender: TObject);
begin
  inherited;
  ListaRotulos.Free;
  ListaDatos.Free;
end;

{Este procedimiento escribe en el cuadro FILTRO DE DATOS los campos por los cuales han sido filtradas
las ordenes de trabajo en el formulario fListaODTUrbanaRural.}
procedure TFQRListaODTViaticos.qrViaticoBeforePrint(
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

{Este procedimiento inicializa los valores de las expresiones calculadas para cada uno de los
empleados del reporte.}
procedure TFQRListaODTViaticos.QRGroup1BeforePrint(
  Sender: TQRCustomBand; var PrintBand: Boolean);
begin
  inherited;
  Sender.Color := clSilver;
  qreSubTotal.Reset;
  qreTotalEmpleado.Reset;
  qreViaticos.Reset;
  qrePeaje.Reset;
  qreParqueo.Reset;
  qreGasolina.Reset;
  qrePasajes.Reset;
  qreAuxilioViaje.Reset;
  qreOtros.Reset;
end;

procedure TFQRListaODTViaticos.qrViaticoAfterPreview(
  Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFQRListaODTViaticos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TFQRListaODTViaticos.QRDBText1Print(sender: TObject;
  var Value: String);
begin
  inherited;
  if length(value)>50 then qrdbtext1.Font.size:=5
  else qrdbtext1.Font.size:=7;
end;

end.
 