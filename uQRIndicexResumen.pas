unit uQRIndicexResumen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, DBTables, Db, TeeProcs, TeEngine, Chart,
  DBChart, QrTee, Series;

type
  TFQRIndicexResumen = class(TForm)
    QuickRep: TQuickRep;
    TitleBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    qrdbNombreEmpresa: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel50: TQRLabel;
    QRShape5: TQRShape;
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
    qEmpresa: TQuery;
    DetailBand1: TQRBand;
    QRDBChart1: TQRDBChart;
    QRChart1: TQRChart;
    Series1: TBarSeries;
    ChildBand1: TQRChildBand;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel10: TQRLabel;
    ChildBand2: TQRChildBand;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRBand3: TQRBand;
    qlPagina: TQRSysData;
    QRBand1: TQRBand;
    ChildBand3: TQRChildBand;
    QRLabel3: TQRLabel;
    qrdbPromediodictado: TQRDBText;
    qrdbPromedioLlegada: TQRDBText;
    qrdbPromedioAtencion: TQRDBText;
    qrdbPromedioTotal: TQRDBText;
    QRShape3: TQRShape;
    QRLabel4: TQRLabel;
    qrdbSumaDictado: TQRDBText;
    qrdbSumaLlegada: TQRDBText;
    qrdbSumaAtencion: TQRDBText;
    qrdbSumaTotal: TQRDBText;
    ChildBand4: TQRChildBand;
    ChildBand5: TQRChildBand;
    QRShape6: TQRShape;
    QRLabel9: TQRLabel;
    qrdbTotalReportes: TQRDBText;
    ChildBand6: TQRChildBand;
    ChildBand7: TQRChildBand;
    QRShape4: TQRShape;
    QRLabel5: TQRLabel;
    qrdbTotalODTs: TQRDBText;
    tEmpresaLogo: TTable;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ListaRotulos, ListaDatos : TStringList;
  end;

var
  FQRIndicexResumen: TFQRIndicexResumen;

implementation


{$R *.DFM}

procedure TFQRIndicexResumen.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var i, n, m, alto : integer;
    Cadena: string;
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

procedure TFQRIndicexResumen.FormCreate(Sender: TObject);
begin
  ListaRotulos := TStringList.Create;
  ListaDatos   := TStringList.Create; 
end;

procedure TFQRIndicexResumen.FormDestroy(Sender: TObject);
begin
  ListaRotulos.Free;
  ListaDatos.Free;
end;

procedure TFQRIndicexResumen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  BEEP;
end;

procedure TFQRIndicexResumen.QuickRepAfterPreview(Sender: TObject);
var Cadena:string;
begin
  try
    Cadena := ExtractFilePath(ParamStr(0));
    if Cadena[Length(Cadena)] <> '\' then
      Cadena := Cadena + '\';
    QRChart1.Chart.SaveToMetafile(Cadena + 'Tiempos.wmf');
    Close;
  except
    Close;
    Application.ProcessMessages;
  end;
end;

procedure TFQRIndicexResumen.FormShow(Sender: TObject);
begin
  QuickRep.Preview;
end;

end.
