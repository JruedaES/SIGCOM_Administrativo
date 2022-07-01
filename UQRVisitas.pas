unit UQRVisitas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, Db, DBTables, ExtCtrls, jpeg;

type
  TFQRVisitas = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    tEmpresaLogo: TTable;
    tEmpresaLogoCODIGOEMPRESA: TStringField;
    tEmpresaLogoCONSECUTIVO: TStringField;
    tEmpresaLogoLOGOEMPRESA: TBlobField;
    dsEmpresaLogo: TDataSource;
    QRShape1: TQRShape;
    QRLabel4: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRBand1: TQRBand;
    QRShape9: TQRShape;
    QRShape12: TQRShape;
    QRShape16: TQRShape;
    QRShape18: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel1: TQRLabel;
    QRDBImage1: TQRDBImage;
    QRLabel5: TQRLabel;
    qlPagina: TQRSysData;
    QRImage2: TQRImage;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape21: TQRShape;
    QRLabel15: TQRLabel;
    QRShape23: TQRShape;
    QRShape19: TQRShape;
    QRShape24: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRShape27: TQRShape;
    QRLabel14: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRShape28: TQRShape;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRShape29: TQRShape;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape33: TQRShape;
    QRShape34: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRShape42: TQRShape;
    QRShape3: TQRShape;
    QRLabel30: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel31: TQRLabel;
    QRShape2: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape20: TQRShape;
    QRShape22: TQRShape;
    QRShape32: TQRShape;
    QRShape43: TQRShape;
    QRShape44: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel49: TQRLabel;
    QRLabel50: TQRLabel;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRLabel51: TQRLabel;
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
    QRShape59: TQRShape;
    QRShape60: TQRShape;
    QRShape61: TQRShape;
    QRShape62: TQRShape;
    QRShape63: TQRShape;
    QRShape64: TQRShape;
    QRShape65: TQRShape;
    QRSysData1: TQRSysData;
    QRShape4: TQRShape;
    procedure QuickRep1AfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure GenerarCasillas();
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FQRVisitas: TFQRVisitas;

implementation

{$R *.DFM}

procedure TFQRVisitas.QuickRep1AfterPreview(Sender: TObject);
begin
  close;
end;

procedure TFQRVisitas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure TFQRVisitas.GenerarCasillas;
var
 qrShape:TQRShape;
 qrShapeLine:TQRShape;
 qrShapeRectangle:TQRShape;
 I,rectangletop,rectangleleft:Integer;
begin
{ rectangletop:=1;
 rectangleleft:=1;
 qrShape.Top:=0;

 for i:=0 to qrShape2.Height do
 begin
   qrShape := TQRShape.Create(FQREquipoHV.QRBand1);
   qrShape.Shape := qrsRectangle;
   qrShape.Top := qrShape.Top + rectangletop;
   qrShape.Left := rectangleleft;
   qrShape.Width:= 30;
   qrShape.Height := 25;
   qrShape.Parent := FQREquipoHV.QRShape2;
   rectangletop:=25;
 end;}
end;

procedure TFQRVisitas.FormShow(Sender: TObject);
begin
 // GenerarCasillas;
end;

end.
