unit uQRListadoCARTA;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, DBTables, Db;

type
  TFQRListadoCarta = class(TForm)
    QuickRep: TQuickRep;
    BandaTitulo: TQRBand;
    QRDBImage1: TQRDBImage;
    qrdbNombreEmpresa: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel50: TQRLabel;
    QRShape5: TQRShape;
    qrsDatosFiltro: TQRShape;
    qrmRotulos1: TQRMemo;
    qrsFiltrodatos: TQRShape;
    qrlFiltroDatos: TQRLabel;
    qrmDatos1: TQRMemo;
    qrmPuntos1: TQRMemo;
    qrmRotulos2: TQRMemo;
    qrmPuntos2: TQRMemo;
    qrmDatos2: TQRMemo;
    qEmpresa: TQuery;
    tEmpresaLogo: TTable;
    qCartaEmpleado: TQuery;
    dsCarta: TDataSource;
    QRSubDetail1: TQRSubDetail;
    qrdbConsecutivo: TQRDBText;
    qrdbCodigoReporte: TQRDBText;
    dsCartaEmpleado: TDataSource;
    qNombresEmpleados: TQuery;
    qNombresEmpleadosNOMBREAPROBADO: TStringField;
    qNombresEmpleadosNOMBREEJECUTADO: TStringField;
    qNombresEmpleadosNOMBREREVISADO: TStringField;
    qrlCedula: TQRLabel;
    qr: TQRLabel;
    QRImage10: TQRImage;
    ColumnHeaderBand1: TQRBand;
    QRShape2: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRShape3: TQRShape;
    QRLabel3: TQRLabel;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel6: TQRLabel;
    QRShape12: TQRShape;
    QRLabel7: TQRLabel;
    QRShape13: TQRShape;
    QRLabel8: TQRLabel;
    QRShape14: TQRShape;
    QRLabel9: TQRLabel;
    QRShape15: TQRShape;
    QRLabel10: TQRLabel;
    QRShape16: TQRShape;
    QRLabel11: TQRLabel;
    QRShape17: TQRShape;
    QRLabel12: TQRLabel;
    QRShape18: TQRShape;
    QRLabel13: TQRLabel;
    qCartaEmpleadoCODIGOEMPLEADO: TFloatField;
    qCartaEmpleadoNOMBREEMPLEADO: TStringField;
    qCartaEmpleadoFECHAENVIO: TDateTimeField;
    QRLabel1: TQRLabel;
    QRDBText13: TQRDBText;
    qCia: TQuery;
    QRDBText14: TQRDBText;
    SummaryBand1: TQRBand;
    QRShape7: TQRShape;
    QRLabel2: TQRLabel;
    QRSysData2: TQRSysData;
    QRLabel14: TQRLabel;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRShape1: TQRShape;
    QRShape4: TQRShape;
    QRShape6: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape19: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape23: TQRShape;
    QRShape24: TQRShape;
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure qrdbHoraFinPrint(sender: TObject; var Value: String);
    procedure qrdbFechaEmisionPrint(sender: TObject; var Value: String);
  private
    { Private declarations }
  public
    { Public declarations }
    ListaRotulos, ListaDatos : TStringList;
  end;

var
  FQRListadoCarta: TFQRListadoCarta;

implementation


{$R *.DFM}

procedure TFQRListadoCarta.QuickRepAfterPreview(Sender: TObject);
begin
  try
    Close;
  except
    Close;
    Application.ProcessMessages;
  end;
end;

procedure TFQRListadoCarta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Beep;
end;

procedure TFQRListadoCarta.FormShow(Sender: TObject);
begin
  QuickRep.Preview;
end;

procedure TFQRListadoCarta.FormCreate(Sender: TObject);
begin
  ListaRotulos := TStringList.Create;
  ListaDatos := TStringList.Create;
end;

procedure TFQRListadoCarta.FormDestroy(Sender: TObject);
begin
  ListaRotulos.Free;
  ListaDatos.Free;
  Self := nil;
end;

procedure TFQRListadoCarta.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var i, n, m, alto : integer;
    Cadena :string;
begin
  if ListaDatos.Count > 0 then
  begin
     BandaTitulo.Height := 110;

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
     BandaTitulo.Height := BandaTitulo.Height+Alto*(n+m)+5;
  end;
  for i := 0 to DetailBand1.ControlCount-1  do
  begin
    if DetailBand1.Controls[i] is TQRDBText then
    begin
      (DetailBand1.Controls[i] as TQRDBText).DataSet:=QuickRep.DataSet;
    end;
  end;

end;

procedure TFQRListadoCarta.qrdbHoraFinPrint(sender: TObject;
  var Value: String);
begin
  if Value = '30/12/1899 00:00:00' then
    Value := '';
end;

procedure TFQRListadoCarta.qrdbFechaEmisionPrint(sender: TObject;
  var Value: String);
begin
  if Value = '30/12/1899' then
    Value := '';
end;

end.
