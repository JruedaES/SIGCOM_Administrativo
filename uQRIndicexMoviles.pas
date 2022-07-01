unit uQRIndicexMoviles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeeProcs, TeEngine, Chart, DBChart, QrTee, QuickRpt, ExtCtrls, Series,
  Db, DBTables, Qrctrls;

type
  TFQRIndicexMoviles = class(TForm)
    QuickRep: TQuickRep;
    BandaGraficos: TQRBand;
    TitleBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    qEmpresa: TQuery;
    qrdbNombreEmpresa: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel50: TQRLabel;
    BandaEncabezado: TQRChildBand;
    QRShape1: TQRShape;
    qrlGrupoTrabajo: TQRLabel;
    qrlTotalDictado: TQRLabel;
    qrlTotalLlegada: TQRLabel;
    qrlTotalAtencion: TQRLabel;
    qrlTotalTiempo: TQRLabel;
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
    QRLabel12: TQRLabel;
    QRDBChart1: TQRDBChart;
    QRChartReportes: TQRChart;
    SeriesReportes: TBarSeries;
    QRChartODTs: TQRChart;
    QRDBChart2: TQRDBChart;
    SeriesODTs: TBarSeries;
    BandaDetalle: TQRBand;
    qrdbGrupotrabajo: TQRDBText;
    qrdbSumaDictado: TQRDBText;
    qrdbSumaLlegada: TQRDBText;
    qrdbSumaAtencion: TQRDBText;
    qrdbSumaTotal: TQRDBText;
    qrlPromedioDictado: TQRLabel;
    qrlPromedioLlegada: TQRLabel;
    qrlPromedioAtencion: TQRLabel;
    qrlPromedioTotal: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    qrdbPromedioDictado: TQRDBText;
    qrdbPromedioLlegada: TQRDBText;
    qrdbPromedioAtencion: TQRDBText;
    qrdbPromedioTotal: TQRDBText;
    QRBand2: TQRBand;
    ChildBand1: TQRChildBand;
    QRLabel9: TQRLabel;
    qrdbTotalReportes: TQRDBText;
    ChildBand2: TQRChildBand;
    ChildBand3: TQRChildBand;
    QRLabel6: TQRLabel;
    qrdbTotalODTs: TQRDBText;
    tEmpresaLogo: TTable;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ListaRotulos, ListaDatos : TStringList;
  end;

var
  FQRIndicexMoviles: TFQRIndicexMoviles;

implementation
uses uIndiceAreaMetropolitana;
{$R *.DFM}

procedure TFQRIndicexMoviles.FormShow(Sender: TObject);
begin
  QuickRep.Preview;
end;

procedure TFQRIndicexMoviles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  BEEP;
end;

procedure TFQRIndicexMoviles.QuickRepAfterPreview(Sender: TObject);
var Cadena: string;
begin
  try
   Cadena := ExtractFilePath(ParamStr(0));
    if Cadena[Length(Cadena)] <> '\' then
      Cadena := Cadena + '\';
    QRChartReportes.Chart.SaveToMetafile(Cadena + 'Reportes.wmf');
    QRChartODTs.Chart.SaveToMetafile(Cadena + 'ODT.wmf');
    Close;
  except
    Close;
    Application.ProcessMessages;
  end;
end;

procedure TFQRIndicexMoviles.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var i, n, m, alto : integer;
    Cadena : string;
begin
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

procedure TFQRIndicexMoviles.FormCreate(Sender: TObject);
begin
  ListaRotulos := TStringList.Create;
  ListaDatos := TStringList.Create;
end;

procedure TFQRIndicexMoviles.FormDestroy(Sender: TObject);
begin
  ListaRotulos.Free;
  ListaDatos.Free;
end;

end.
