unit uActaLiquidacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TParser, Buttons, ExtCtrls;

type
  TFActaLiquidacion = class(TForm)
    DParser1: TDParser;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MResolucion: TMemo;
    MResuelve: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    NombreFirmante:array[0..3]of string;
    CargoFirmante:array[0..3]of string;

    { Public declarations }
  end;

var
  FActaLiquidacion: TFActaLiquidacion;
    Valorcontrato:String;


implementation

Uses uContrato, uQRContratoObra, uQRActaLiquidacion;

var Valor, Primera, Segunda, Tercera, Cuarta, Quinta, Sexta, Septima, Octava : String;

{$R *.DFM}

procedure TFActaLiquidacion.FormActivate(Sender: TObject);
var
  total: Double;
  IvaUtilidad:Double;
  i:integer;
begin
//  IvaUtilidad:=(TotalMaterial+TotalTransporte+TotalEquipo+TotalManoObra)*(FContrato.tPresActi.FieldByName('Utilidades').AsFloat);
//  Total:=(FContrato.tContrato.FieldByName('MATERIAL').AsFloat+FContrato.tContrato.FieldByName('MANOOBRA').AsFloat+FContrato.tContrato.FieldByName('EQUIPO').AsFloat+FContrato.tContrato.FieldByName('TRANSPORTE').AsFloat));
  with FContrato do
  begin
    ValorContrato:=FormatFloat('"$"#,##0.00',qContrato.FieldByName('CostoTotal').AsFloat);
    MResolucion.Lines.Clear;
    Primera := '';
    Primera := 'En '+qEmpresa.FieldByName('CIUDAD').AsString+' a ' + FormatDateTime('d "de" mmmm "de" yyyy, ', now) + ', ';
    Primera := Primera + 'se reunieron en las oficinas de la '+qEmpresa.FieldByName('NOMBREEMPRESA').AsString+', los Señores ';
    for i:=0 to 3 do
    begin
      if NombreFirmante[i]<>'' then
        Primera := Primera + NombreFirmante[i] + ',  ' + CargoFirmante[i]+', '
    end;
    Primera := Primera + NombreContratista + ' como contratista, con el fin de establecer el ';
    Primera := Primera + ' acta de Liquidación Final del contrato en referencia, así:';
    MResolucion.Lines.Add(Primera);
    MResuelve.Lines.Clear;
    Primera := '1. DESARROLLO DEL TRABAJO';
    MResuelve.Lines.Add(Primera);
    Primera := '';
    Primera := Primera + 'Se desarrolló el trabajo a entera satisfacción por parte de la '+qEmpresa.FieldByName('NOMBREABREVIADO').AsString+', ';
    Primera := Primera + 'mediante el contrato ' + qContrato.Fieldbyname('NUMEROCONTRATO').AsString + '.';
    MResuelve.Lines.Add(Primera);
    Primera := '';
    MResuelve.Lines.Add(Primera);
    Primera := '2. INTERVENTORIA';
    MResuelve.Lines.Add(Primera);
    Primera := '';
    Primera := Primera + 'El Interventor hace constar que los trabajos fueron recibidos a entera ';
    Primera := Primera + ' satisfacción, el día ' + FormatDateTime('d "de" mmmm "de" yyyy, ',qContrato.Fieldbyname('FECHALIQUIDACION').AsDateTime);
    MResuelve.Lines.Add(Primera);
    Primera := '';
    MResuelve.Lines.Add(Primera);
    Primera := '3. VALOR TOTAL DEL CONTRATO';
    MResuelve.Lines.Add(Primera);
    Primera := '';
    Primera := Primera + 'El valor total del contrato ' + qContrato.Fieldbyname('NUMEROCONTRATO').AsString;
    Primera := Primera + ' es de ';
    DParser1.Expresion := qContrato.FieldByName('CostoTotal').AsString;
    DParser1.Execute;
    Valor := DParser1.dsEnLetras;
    Primera := Primera + Valor + '  ' + '('+valorcontrato +') ';
    MResuelve.Lines.Add(Primera);
    Primera := '';
    MResuelve.Lines.Add(Primera);
    Primera := '';
    MResuelve.Lines.Add(Primera);
    Primera := 'En constancia firman quienes en ella intervinieron.';
    MResuelve.Lines.Add(Primera);
  end;
end;

procedure TFActaLiquidacion.BitBtn1Click(Sender: TObject);
begin
  fQRActaLiquidacion := TfQRActaLiquidacion.Create(Application);
  try
    with fContrato do
    begin
      fQRActaLiquidacion.QRLabelContratista.Caption:=NombreContratista;
      fQRActaLiquidacion.QRLabelValorcontrato.Caption:=ValorContrato;
      fQRActaLiquidacion.QRLabelNombrefirmante.Caption := NombreFirmante[0];
      fQRActaLiquidacion.QRLabelCargoFirmante.Caption := CargoFirmante[0];
      fQRActaLiquidacion.QRLabelNombrefirmante1.Caption := NombreFirmante[1];
      fQRActaLiquidacion.QRLabelCargoFirmante1.Caption := CargoFirmante[1];
      fQRActaLiquidacion.QRLabelNombrefirmante2.Caption := NombreFirmante[2];
      fQRActaLiquidacion.QRLabelCargoFirmante2.Caption := CargoFirmante[2];
      fQRActaLiquidacion.QRLabelNombrefirmante3.Caption := NombreFirmante[3];
      fQRActaLiquidacion.QRLabelCargoFirmante3.Caption := CargoFirmante[3];
    end;
    fQRActaLiquidacion.QRRichTextConsiderando.Lines.Add(MResolucion.Text);
    fQRActaLiquidacion.QRMResuelve.Lines:=Mresuelve.Lines;
    fQRActaLiquidacion.QuickReport.Preview;
  except
    fQRActaLiquidacion.Free;
  end;
end;

procedure TFActaLiquidacion.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFActaLiquidacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

end.
