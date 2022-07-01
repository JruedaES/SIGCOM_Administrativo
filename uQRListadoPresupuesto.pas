unit uQRListadoPresupuesto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, DBTables, Db, jpeg;

type
  TFQRListadoPresupuesto = class(TForm)
    QuickRep: TQuickRep;
    BandaTitulo: TQRBand;
    QRDBImage1: TQRDBImage;
    qrdbNombreEmpresa: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel50: TQRLabel;
    QRShape5: TQRShape;
    qrlProyectoEnergis: TQRLabel;
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
    qrbDetalle: TQRBand;
    qrdbCodigoOdt: TQRDBText;
    qrdbCodigoAdministrativo: TQRDBText;
    qrdbCodigoRevisado: TQRDBText;
    qrdbNombreLabor: TQRDBText;
    qrdbFechaEmision: TQRDBText;
    qrdbCodigoEjecutor: TQRDBText;
    qrdbNombreTipoTarea: TQRDBText;
    qrdbNombrePrioridad: TQRDBText;
    qrdbCodigoEstadoODT: TQRDBText;
    qPresupuesto: TQuery;
    dsPresupuesto: TDataSource;
    SeparadorSubdetalle: TQRChildBand;
    qDir_Reporte: TQuery;
    qDir_ReporteDIRECCION: TStringField;
    BandaEncabezadoDetalle: TQRGroup;
    QRLabel2: TQRLabel;
    QRShape14: TQRShape;
    QRLabel4: TQRLabel;
    QRShape15: TQRShape;
    QRLabel10: TQRLabel;
    QRShape19: TQRShape;
    QRLabel14: TQRLabel;
    QRShape21: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRShape22: TQRShape;
    QRLabel17: TQRLabel;
    QRShape23: TQRShape;
    tEmpresaLogo: TTable;
    QRShape18: TQRShape;
    QRLabel1: TQRLabel;
    QRShape1: TQRShape;
    QRLabel3: TQRLabel;
    QRShape2: TQRShape;
    QRLabel5: TQRLabel;
    TeMPRESA: TTable;
    QRDBText1: TQRDBText;
    SummaryBand1: TQRBand;
    ChildBand1: TQRChildBand;
    PageFooterBand1: TQRBand;
    qlPagina: TQRSysData;
    QRShape4: TQRShape;
    QLSGD: TQRLabel;
    QRILogoElectros: TQRImage;
    QRILogoPrograma: TQRImage;
    QRSysData1: TQRSysData;
    QRLabel6: TQRLabel;
    QRImage1: TQRImage;
    QRLabel7: TQRLabel;
    QRShape3: TQRShape;
    QRDBText2: TQRDBText;
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
  FQRListadoPresupuesto: TFQRListadoPresupuesto;

implementation


{$R *.DFM}

procedure TFQRListadoPresupuesto.QuickRepAfterPreview(Sender: TObject);
begin
  try
    Close;
  except
    Close;
    Application.ProcessMessages;
  end;
end;

procedure TFQRListadoPresupuesto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Beep;
end;

procedure TFQRListadoPresupuesto.FormShow(Sender: TObject);
begin
  QuickRep.Preview;
end;

procedure TFQRListadoPresupuesto.FormCreate(Sender: TObject);
begin
  ListaRotulos := TStringList.Create;
  ListaDatos := TStringList.Create;
end;

procedure TFQRListadoPresupuesto.FormDestroy(Sender: TObject);
begin
  ListaRotulos.Free;
  ListaDatos.Free;
end;

procedure TFQRListadoPresupuesto.QuickRepBeforePrint(Sender: TCustomQuickRep;
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
  end
  else
    BandaTitulo.Height :=73;
end;

procedure TFQRListadoPresupuesto.qrdbHoraFinPrint(sender: TObject;
  var Value: String);
begin
  if Value = '30/12/1899 00:00:00' then
    Value := '';
end;

procedure TFQRListadoPresupuesto.qrdbFechaEmisionPrint(sender: TObject;
  var Value: String);
begin
  if Value = '30/12/1899' then
    Value := '';
end;

end.
