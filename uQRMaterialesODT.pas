unit uQRMaterialesODT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, QRPrntr;

type
  TFQRMaterialesODT = class(TForm)
    QuickRep: TQuickRep;
    TitleBand1: TQRBand;
    QRLabel50: TQRLabel;
    qrdbImpresoODT: TQRDBText;
    QRLabel27: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRShape30: TQRShape;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
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
    QRShape1: TQRShape;
    DetailBand: TQRBand;
    qrdbConsecutivo: TQRLabel;
    qrdbCodigoMaterial: TQRLabel;
    qrdbNombreMaterial: TQRLabel;
    qrdbNombreUnidad: TQRLabel;
    qrdbSolicitado: TQRLabel;
    qrdbEntregado: TQRLabel;
    qrdbConsumido: TQRLabel;
    qrdbReintegradoB: TQRLabel;
    qrdbReintegradoM: TQRLabel;
    qrdbRetiradoB: TQRLabel;
    qrdbRetiradoM: TQRLabel;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QuickRepNeedData(Sender: TObject; var MoreData: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    J, Filas: integer;
    Query: TQuery;
  end;

var
  FQRMaterialesODT: TFQRMaterialesODT;

implementation


{$R *.DFM}

procedure TFQRMaterialesODT.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var i:Integer;
begin
  if Sender.QRPrinter.Destination =  QRPrntr.qrdPrinter then
  begin
    for I:=0 to Self.ComponentCount - 1 do
      if (Self.Components[i] is TQRShape) then
         TQRShape(Components[i]).Pen.Width := 8;
    DetailBand.Frame.Width := 2;
    QuickRep.Frame.Width := 2;
  end;
end;

procedure TFQRMaterialesODT.QuickRepNeedData(Sender: TObject;
  var MoreData: Boolean);
begin
  MoreData :=True;
  qrdbConsecutivo.Caption := '';
  qrdbCodigoMaterial.Caption := '';
  qrdbNombreMaterial.Caption := '';
  qrdbNombreUnidad.Caption   := '';
  qrdbSolicitado.Caption     := '';
  qrdbEntregado.Caption      := '';
  qrdbConsumido.Caption      := '';
  qrdbReintegradoB.Caption   := '';
  qrdbReintegradoM.Caption   := '';
  qrdbRetiradoB.Caption      := '';
  qrdbRetiradoM.Caption      := '';
  if not Query.Eof then
  begin
    qrdbConsecutivo.Caption    := Query.FieldByName('CONSECUTIVO').AsString;
    qrdbCodigoMaterial.Caption := Query.FieldByName('CODIGOMATERIAL').AsString;
    qrdbNombreMaterial.Caption := Query.FieldByName('NOMBREMATERIAL').AsString;
    qrdbNombreUnidad.Caption   := Query.FieldByName('NOMBREUNIDAD').AsString;
    qrdbSolicitado.Caption     := Query.FieldByName('CANTIDADSOLICITADA').AsString;
    qrdbEntregado.Caption      := Query.FieldByName('CANTIDADENTREGADA').AsString;
    qrdbConsumido.Caption      := Query.FieldByName('CANTIDADCONSUMIDA').AsString;
    qrdbReintegradoB.Caption   := Query.FieldByName('CANTIDADREINTEGRADABUENA').AsString;
    qrdbReintegradoM.Caption   := Query.FieldByName('CANTIDADREINTEGRADAMALA').AsString;
    qrdbRetiradoB.Caption      := Query.FieldByName('CANTIDADRETIRADABUENA').AsString;
    qrdbRetiradoM.Caption      := Query.FieldByName('CANTIDADRETIRADAMALA').AsString;
    Query.Next;
  end;
  if J > Filas then
    MoreData:=False;
  Inc(J);  
end;

end.
