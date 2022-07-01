unit uQRIndicexTotal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, DBTables, Db;

type
  TFQRIndicexTotal = class(TForm)
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
    qrbEncabezados: TQRBand;
    qrlCodigoReporte: TQRLabel;
    qrlFechaRegistro: TQRLabel;
    qrlCiudad: TQRLabel;
    qrlBarrio: TQRLabel;
    qrlDireccion: TQRLabel;
    qrlSolicitante: TQRLabel;
    qrlTelefono: TQRLabel;
    qrlTrabajo: TQRLabel;
    qrlHoraRegistro: TQRLabel;
    qrlHoraFin: TQRLabel;
    qrlHoraDictado: TQRLabel;
    qrlFechaDictado: TQRLabel;
    qrlCodigoODT: TQRLabel;
    qrlHoraInicio: TQRLabel;
    qrlFechaInicio: TQRLabel;
    qrlFechaFin: TQRLabel;
    qrlMovilODT: TQRLabel;
    qrbDetalle: TQRBand;
    qrdbCodigoReporte: TQRDBText;
    qrdbFechaRegistro: TQRDBText;
    qrdbCiudad: TQRDBText;
    qrdbBarrio: TQRDBText;
    qrdbDireccion: TQRDBText;
    qrdbSolicitante: TQRDBText;
    qrdbTelefono: TQRDBText;
    qrdbHoraRegistro: TQRDBText;
    qrdbTrabajoRealizar: TQRDBText;
    qrdbHoraDictado: TQRDBText;
    qrdbHoraFin: TQRDBText;
    qrdbFechaDictado: TQRDBText;
    qrdbCodigoODT: TQRDBText;
    qrdbHoraInicio: TQRDBText;
    qrdbFechaInicio: TQRDBText;
    qrdbFechaFin: TQRDBText;
    qrdbMovilODT: TQRDBText;
    ChildBand1: TQRChildBand;
    QRBand3: TQRBand;
    qlPagina: TQRSysData;
    QRLabel2: TQRLabel;
    qrdbTrabajoRealizado: TQRDBText;
    tEmpresaLogo: TTable;
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    ListaRotulos, ListaDatos : TStringList;
  end;

var
  FQRIndicexTotal: TFQRIndicexTotal;

implementation

uses uIndiceAreaMetropolitana;


{$R *.DFM}

procedure TFQRIndicexTotal.QuickRepAfterPreview(Sender: TObject);
begin
  try
    Close;
  except
    Close;
    Application.ProcessMessages;
  end;
end;

procedure TFQRIndicexTotal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  Beep;
end;

procedure TFQRIndicexTotal.FormShow(Sender: TObject);
begin
  QuickRep.Preview;
end;

procedure TFQRIndicexTotal.FormCreate(Sender: TObject);
begin
  ListaRotulos := TStringList.Create;
  ListaDatos := TStringList.Create;
end;

procedure TFQRIndicexTotal.FormDestroy(Sender: TObject);
begin
  ListaRotulos.Free;
  ListaDatos.Free;
end;

procedure TFQRIndicexTotal.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var i, n, m, alto : integer;
    Cadena :string;
begin
  if ListaDatos.Count > 0 then
  begin
     TitleBand1.Height := 110;

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
