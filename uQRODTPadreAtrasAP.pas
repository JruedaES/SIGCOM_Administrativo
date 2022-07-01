unit uQRODTPadreAtrasAP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, StdCtrls, ComCtrls;

type
  TfQRODTPadreAtrasAP = class(TForm)
    tEmpresaLogo: TTable;
    qEmpresa: TQuery;
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRLabel27: TQRLabel;
    QRShape28: TQRShape;
    QRShape29: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape30: TQRShape;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRBand1: TQRBand;
    qCia: TQuery;
    PageHeaderBand1: TQRBand;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape16: TQRShape;
    QRLabel7: TQRLabel;
    QRShape23: TQRShape;
    QRLabel8: TQRLabel;
    QRShape24: TQRShape;
    QRLabel11: TQRLabel;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    QRShape10: TQRShape;
    QRShape44: TQRShape;
    QRLabel49: TQRLabel;
    QRLabel26: TQRLabel;
    QRShape51: TQRShape;
    QRLabel32: TQRLabel;
    QRShape52: TQRShape;
    QRShape57: TQRShape;
    QRLabel33: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape20: TQRShape;
    QRShape21: TQRShape;
    QRShape22: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRShape11: TQRShape;
    QRLabel14: TQRLabel;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape27: TQRShape;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRShape34: TQRShape;
    QRShape43: TQRShape;
    QRLabel21: TQRLabel;
    QRShape45: TQRShape;
    QRLabel22: TQRLabel;
    QRShape46: TQRShape;
    QRLabel23: TQRLabel;
    QRShape47: TQRShape;
    QRLabel24: TQRLabel;
    QRShape48: TQRShape;
    QRLabel25: TQRLabel;
    QRShape58: TQRShape;
    QRLabel28: TQRLabel;
    QRShape59: TQRShape;
    QRLabel36: TQRLabel;
    QRShape60: TQRShape;
    QRLabel37: TQRLabel;
    QRShape61: TQRShape;
    qMateriales: TQuery;
    qMaterialesCODIGOODT: TFloatField;
    qMaterialesCODIGOMATERIAL: TFloatField;
    qMaterialesCANTIDADSOLICITADA: TFloatField;
    qMaterialesCANTIDADENTREGADA: TFloatField;
    qMaterialesCANTIDADCONSUMIDA: TFloatField;
    qMaterialesCANTIDADREINTEGRADABUENA: TFloatField;
    qMaterialesCANTIDADREINTEGRADAMALA: TFloatField;
    qMaterialesCANTIDADRETIRADABUENA: TFloatField;
    qMaterialesCANTIDADRETIRADAMALA: TFloatField;
    qMaterialesVALORPRESUPUESTADO: TFloatField;
    qMaterialesVALORLIQUIDADO: TFloatField;
    qMaterialesNOMBREMATERIAL: TStringField;
    qMaterialesCODIGOUNIDAD: TStringField;
    QRLabel38: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape62: TQRShape;
    procedure QuickRep1AfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure QuickRep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fQRODTPadreAtrasAP: TfQRODTPadreAtrasAP;

implementation
uses uODTPadre;

{$R *.DFM}

procedure TfQRODTPadreAtrasAP.QuickRep1AfterPreview(Sender: TObject);
begin
  Close;
end;

procedure TfQRODTPadreAtrasAP.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qMateriales.Close;
  qMateriales.Free;
  Action:=CaFree;
end;

procedure TfQRODTPadreAtrasAP.QuickRep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
procedure AjustarQRLabel(var qrLabel:TQRLabel);
begin
  qrLabel.Alignment:= taRightJustify;
  qrLabel.AutoSize := False;
  qrLabel.AutoStretch := False;
  qrLabel.WordWrap := False;
  qrLabel.Height := 16;
  qrLabel.Font.Size := 7;
  qrLabel.Font.Name := 'Arial';
  qrLabel.SendToBack;
end;
var I:integer;
    qrLabel:TQRLabel;
begin
  qMateriales.Close;
  qMateriales.Open;
  I:=0;
  while not qMateriales.Eof do
  begin
    //CodigoMaterial
    qrLabel := TQRLabel.Create(QRBand2);
    AjustarQRLabel(qrLabel);
    qrLabel.Top := 226 + I*25;
    qrLabel.Left := 6;
    qrLabel.Width := 40;
    qrLabel.Parent := QRBand2;
    qrLabel.Alignment:= taCenter;
    qrLabel.Caption := qMateriales.FieldByName('CodigoMaterial').AsString;
    //NombreMaterial
    qrLabel := TQRLabel.Create(QRBand2);
    AjustarQRLabel(qrLabel);
    qrLabel.Top := 226 + I*25;
    qrLabel.Left := 54;
    qrLabel.Width := 290;
    qrLabel.Parent := QRBand2;
    qrLabel.Alignment:= taLeftJustify;
    qrLabel.Caption := qMateriales.FieldByName('NombreMaterial').AsString;
    //CodigoUnidad
    qrLabel := TQRLabel.Create(QRBand2);
    AjustarQRLabel(qrLabel);
    qrLabel.Top := 226 + I*25;
    qrLabel.Left := 354;
    qrLabel.Width := 40;
    qrLabel.Parent := QRBand2;
    qrLabel.Alignment:= taCenter;
    qrLabel.Caption := qMateriales.FieldByName('CodigoUnidad').AsString;
    //CantidadSolicitada
    qrLabel := TQRLabel.Create(QRBand2);
    AjustarQRLabel(qrLabel);
    qrLabel.Top := 226 + I*25;
    qrLabel.Left := 412;
    qrLabel.Width := 40;
    qrLabel.Parent := QRBand2;
    if qMateriales.FieldByName('CantidadSolicitada').AsString<>'0' then
      qrLabel.Caption := qMateriales.FieldByName('CantidadSolicitada') .AsString
    else qrLabel.Caption :=' ';
    //CantidadEntregada
    qrLabel := TQRLabel.Create(QRBand2);
    AjustarQRLabel(qrLabel);
    qrLabel.Top := 226 + I*25;
    qrLabel.Left := 467;
    qrLabel.Width := 40;
    qrLabel.Parent := QRBand2;
    if qMateriales.FieldByName('CantidadEntregada').AsString<>'0'then
      qrLabel.Caption := qMateriales.FieldByName('CantidadEntregada') .AsString
    else qrLabel.Caption :=' ';
    //CantidadConsumida
    qrLabel := TQRLabel.Create(QRBand2);
    AjustarQRLabel(qrLabel);
    qrLabel.Top := 226 + I*25;
    qrLabel.Left := 524;
    qrLabel.Width := 40;
    qrLabel.Parent := QRBand2;
    if qMateriales.FieldByName('CantidadConsumida').AsString<>'0' then
      qrLabel.Caption := qMateriales.FieldByName('CantidadConsumida') .AsString
    else qrLabel.Caption :=' ';
    //Extra Noche desde
    qrLabel := TQRLabel.Create(QRBand2);
    AjustarQRLabel(qrLabel);
    qrLabel.Top := 226 + I*25;
    qrLabel.Left := 578;
    qrLabel.Width := 30;
    qrLabel.Parent := QRBand2;
    if qMateriales.FieldByName('CantidadReintegradaBuena').AsString<>'0' then
      qrLabel.Caption := qMateriales.FieldByName('CantidadReintegradaBuena') .AsString
    else qrLabel.Caption :=' ';
    //Extra Noche hasta
    qrLabel := TQRLabel.Create(QRBand2);
    AjustarQRLabel(qrLabel);
    qrLabel.Top := 226 + I*25;
    qrLabel.Left := 622;
    qrLabel.Width := 30;
    qrLabel.Parent := QRBand2;
    if qMateriales.FieldByName('CantidadReintegradaMala').AsString<>'0' then
      qrLabel.Caption := qMateriales.FieldByName('CantidadReintegradaMala') .AsString
    else qrLabel.Caption :=' ';
    //CantidadRetiradaBuena
    qrLabel := TQRLabel.Create(QRBand2);
    AjustarQRLabel(qrLabel);
    qrLabel.Top := 226 + I*25;
    qrLabel.Left := 663;
    qrLabel.Width := 30;
    qrLabel.Parent := QRBand2;
    if qMateriales.FieldByName('CantidadRetiradaBuena').AsString<>'0' then
      qrLabel.Caption := qMateriales.FieldByName('CantidadRetiradaBuena') .AsString
    else qrLabel.Caption :=' ';
    //CantidadRetiradaMala
    qrLabel := TQRLabel.Create(QRBand2);
    AjustarQRLabel(qrLabel);
    qrLabel.Top := 226 + I*25;
    qrLabel.Left := 706;
    qrLabel.Width := 30;
    qrLabel.Parent := QRBand2;
    if qMateriales.FieldByName('CantidadRetiradaMala').AsString<>'0' then
      qrLabel.Caption := qMateriales.FieldByName('CantidadRetiradaMala') .AsString
    else qrLabel.Caption :=' ';
    Inc(I);
    if I > 16 then Break;
    qMateriales.Next;
  end;
end;

end.
