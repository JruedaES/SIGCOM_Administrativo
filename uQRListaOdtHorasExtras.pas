unit uQRListaOdtHorasExtras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, Db, DBTables, ExtCtrls;

type
  TFQRListaODTHorasExtras = class(TForm)
    qEmpresa: TQuery;
    qSobreTiempo: TQuery;
    qSobreTiempoNOMBREEMPLEADO: TStringField;
    qSobreTiempoCODIGOODT: TFloatField;
    qSobreTiempoCANTIDADNOCTURNA: TFloatField;
    qSobreTiempoOBSERVACION: TStringField;
    tEmpresaLogo: TTable;
    qSobreTiempoCODIGOADMINISTRATIVO: TFloatField;
    qAdministrativo: TQuery;
    qSobreTiempoNombreDependencia: TStringField;
    QuickRep: TQuickRep;
    TitleBand1: TQRBand;
    QRSDatosFiltro: TQRShape;
    QRDBImage2: TQRDBImage;
    QRDBText2: TQRDBText;
    QRLabel14: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRmRotulos1: TQRMemo;
    QRmDatos1: TQRMemo;
    QRmPuntos1: TQRMemo;
    QRmRotulos2: TQRMemo;
    QRmPuntos2: TQRMemo;
    QRmDatos2: TQRMemo;
    qrsFiltroDatos: TQRShape;
    qrlFiltroDatos: TQRLabel;
    QRGroup2: TQRGroup;
    QRDBText4: TQRDBText;
    QRGroup3: TQRGroup;
    bfDependencia: TQRBand;
    bfEmpleado: TQRBand;
    QRBand5: TQRBand;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRDBText11: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRExpr1: TQRExpr;
    QRExpr2: TQRExpr;
    QRLabel20: TQRLabel;
    QRExpr3: TQRExpr;
    QRExpr4: TQRExpr;
    QRLabel21: TQRLabel;
    ChildBand2: TQRChildBand;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    ChildBand3: TQRChildBand;
    qCopiaSobreTiempo: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField1: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField4: TStringField;
    FloatField4: TFloatField;
    StringField5: TStringField;
    QRLabel27: TQRLabel;
    QRDBText16: TQRDBText;
    qSobreTiempoFECHAHORADESDE: TDateTimeField;
    qSobreTiempoFECHAHORAHASTA: TDateTimeField;
    qSobreTiempoCANTIDADDIURNA: TFloatField;
    SummaryBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    qSobreTiempoCODIGOEMPLEADO: TFloatField;
    QRExpr5: TQRExpr;
    QRExpr6: TQRExpr;
    QRExpr7: TQRExpr;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    qSobreTiempoMotivos2: TStringField;
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure FormShow(Sender: TObject);
    procedure QuickRep1AfterPreview(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qSobreTiempoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    ListaRotulos, ListaDatos : TStringList;
  end;

var
  FQRListaODTHorasExtras: TFQRListaODTHorasExtras;

implementation

{$R *.DFM}

procedure TFQRListaODTHorasExtras.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  Sender.Color := clSilver;
end;

procedure TFQRListaODTHorasExtras.FormShow(Sender: TObject);
begin
  QuickRep.Preview;
end;

procedure TFQRListaODTHorasExtras.QuickRep1AfterPreview(Sender: TObject);
begin
  Close;
end;

procedure TFQRListaODTHorasExtras.FormCreate(Sender: TObject);
begin
  ListaRotulos := TStringList.Create;
  ListaDatos   := TStringList.Create;
end;

procedure TFQRListaODTHorasExtras.FormDestroy(Sender: TObject);
begin
  ListaRotulos.Free;
  ListaDatos.Free;
end;

procedure TFQRListaODTHorasExtras.QuickRep1BeforePrint(Sender: TCustomQuickRep;
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

procedure TFQRListaODTHorasExtras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Beep;
end;

procedure TFQRListaODTHorasExtras.qSobreTiempoCalcFields(
  DataSet: TDataSet);
var query:tquery;
begin
  query:=TQuery.create(self);
  query.DatabaseName:='BaseDato';
  query.sql.text:='SELECT MOTIVOS FROM ODT WHERE CODIGOODT='+qSobreTiempoCODIGOODT.AsString;
  query.open;
  if query.fields[0].AsString<>'' then
    qSobreTiempoMotivos2.AsString:=copy(query.fields[0].AsString,1,100);
  query.free;
end;

end.
