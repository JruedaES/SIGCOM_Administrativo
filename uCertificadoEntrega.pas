unit uCertificadoEntrega;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TParser, Buttons, ExtCtrls;

type
  TFCertificadoEntrega = class(TForm)
    DParser1: TDParser;
    Panel1: TPanel;
    Panel2: TPanel;
    MContrato: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    Valor, Primera, Segunda, Tercera, Cuarta, Quinta, Sexta, Septima, Octava:string;
    NombreFirmante:array[0..3]of string;
    CargoFirmante:array[0..3]of string;
  end;

var
  FCertificadoEntrega: TFCertificadoEntrega;

implementation

Uses uQRContratoObra, uContrato, uQRCertificadoEntrega;


{$R *.DFM}

procedure TFCertificadoEntrega.FormActivate(Sender: TObject);
//var
//  total: Double;
//  IvaUtilidad:Double;
begin
//  IvaUtilidad:=(TotalMaterial+TotalTransporte+TotalEquipo+TotalManoObra)*(Fcontrato.tPresActi.FieldByName('Utilidades').AsFloat);
//  Total:=(Fcontrato.tContrato.FieldByName('MATERIAL').AsFloat+Fcontrato.tContrato.FieldByName('MANOOBRA').AsFloat+Fcontrato.tContrato.FieldByName('EQUIPO').AsFloat+Fcontrato.tContrato.FieldByName('TRANSPORTE').AsFloat));
  MContrato.Lines.Clear;
  Primera := '';
  Primera := Primera + 'El Señor ' + FContrato.NombreContratista + ',';
  Primera := Primera + '  realizó : ';
  Primera := Primera + Fcontrato.qContrato.FieldByName('OBJETO').AsString + '.,';
  Primera := Primera + ' mediante  contrato  ';
  Primera := Primera + Fcontrato.qContrato.FieldByName('NUMEROCONTRATO').AsString + ', ';
  Primera := Primera + ' por  lo  tanto  se  pueden ';
  Primera := Primera + 'recibir  a  entera  satisfacción.';
  MContrato.Lines.Add(Primera);
  Primera := '';
  MContrato.Lines.Add(Primera);
  Primera := '';
  MContrato.Lines.Add(Primera);
  Primera := '';
  MContrato.Lines.Add(Primera);
  Primera := 'Dada en '+Fcontrato.qGeografico.fieldbyname('nombregeografico').AsString+' a ' + FormatDateTime('d "de" mmmm "de" yyyy, ', now);
  MContrato.Lines.Add(Primera);
  Primera := '';
  MContrato.Lines.Add(Primera);
  Primera := '';
  MContrato.Lines.Add(Primera);
  Primera := '';
  MContrato.Lines.Add(Primera);
  Primera := 'Atentamente ';
  MContrato.Lines.Add(Primera);
end;

procedure TFCertificadoEntrega.BitBtn1Click(Sender: TObject);
begin
  fQRCertificadoEntrega := TfQRCertificadoEntrega.Create(Application);
  try
    fQRCertificadoEntrega.QRLabelNombrefirmante.Caption := NombreFirmante[0];
    fQRCertificadoEntrega.QRLabelCargoFirmante.Caption := CargoFirmante[0];
    fQRCertificadoEntrega.QRLabelNombrefirmante1.Caption := NombreFirmante[1];
    fQRCertificadoEntrega.QRLabelCargoFirmante1.Caption := CargoFirmante[1];
    fQRCertificadoEntrega.QRLabelNombrefirmante2.Caption := NombreFirmante[2];
    fQRCertificadoEntrega.QRLabelCargoFirmante2.Caption := CargoFirmante[2];
    fQRCertificadoEntrega.QRLabelNombrefirmante3.Caption := NombreFirmante[3];
    fQRCertificadoEntrega.QRLabelCargoFirmante3.Caption := CargoFirmante[3];
    fQRCertificadoEntrega.QRRichText1.Lines.Clear;
    fQRCertificadoEntrega.QRRichText1.Lines.Add(MContrato.Text);
    fQRCertificadoEntrega.QRLInterventor.Caption := fQRCertificadoEntrega.QRLInterventor.Caption;
    fQRCertificadoEntrega.QuickReport.Preview;
  except
    fQRCertificadoEntrega.free;
  end;
end;

procedure TFCertificadoEntrega.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFCertificadoEntrega.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

end.
