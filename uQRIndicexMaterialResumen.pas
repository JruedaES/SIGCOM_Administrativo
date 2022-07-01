unit uQRIndicexMaterialResumen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Qrctrls, QuickRpt, ExtCtrls;

type
  TFQRIndicexMaterialResumen = class(TForm)
    QuickRep: TQuickRep;
    TitleBand1: TQRBand;
    QRDBImage1: TQRDBImage;
    qrdbNombreEmpresa: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBText6: TQRDBText;
    TituloReporte: TQRLabel;
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
    tEmpresaLogo: TTable;
    QRBand1: TQRBand;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel15: TQRLabel;
    QRBand2: TQRBand;
    qrdbCodigo: TQRDBText;
    qrdbNombreMaterial: TQRDBText;
    qrdbCantidadSolicitada: TQRDBText;
    qrdbCantidadEntregada: TQRDBText;
    qrdbCantidadConsumida: TQRDBText;
    qrdbCantidadReintegradaMala: TQRDBText;
    qrdbCantidadReintegradaBuena: TQRDBText;
    qrdbCantidadRetiradaBuena: TQRDBText;
    qrdbCantidadRetiradaMala: TQRDBText;
    qrdbNombreUnidad: TQRDBText;
    QRBand4: TQRBand;
    qlPagina: TQRSysData;
    ChildBand1: TQRChildBand;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    ListaRotulos, ListaDatos : TStringList;
  end;

var
  FQRIndicexMaterialResumen: TFQRIndicexMaterialResumen;

implementation


{$R *.DFM}

procedure TFQRIndicexMaterialResumen.FormCreate(Sender: TObject);
begin
  ListaRotulos := TStringList.Create;
  ListaDatos := TStringList.Create;
end;

procedure TFQRIndicexMaterialResumen.FormDestroy(Sender: TObject);
begin
  ListaRotulos.Free;
  ListaDatos.Free;
end;

procedure TFQRIndicexMaterialResumen.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
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

procedure TFQRIndicexMaterialResumen.QuickRepAfterPreview(
  Sender: TObject);
begin
  try
    Close;
  except
    Close;
    Application.ProcessMessages;
  end;
end;

procedure TFQRIndicexMaterialResumen.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  BEEP;
end;

end.
