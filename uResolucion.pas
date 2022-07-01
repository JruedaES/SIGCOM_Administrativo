unit uResolucion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TParser, Buttons, ExtCtrls;

type
  TFResolucion = class(TForm)
    DParser1: TDParser;
    Panel1: TPanel;
    Panel2: TPanel;
    MContrato: TMemo;
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
  FResolucion: TFResolucion;

implementation

Uses uQRContratoObra, uContrato, uQRResolucion1;

var Valor, Primera : String;

{$R *.DFM}

procedure TFResolucion.FormActivate(Sender: TObject);
var
//  total: Double;
//  IvaUtilidad:Double;
  NombreEmpresa,NombreCiudad : String;
begin
//  IvaUtilidad:=(TotalMaterial+TotalTransporte+TotalEquipo+TotalManoObra)*(FContreto.tPresActi.FieldByName('Utilidades').AsFloat);
//  Total:=(FContreto.tContrato.FieldByName('MATERIAL').AsFloat+FContreto.tContrato.FieldByName('MANOOBRA').AsFloat+FContreto.tContrato.FieldByName('EQUIPO').AsFloat+FContreto.tContrato.FieldByName('TRANSPORTE').AsFloat));
  NombreEmpresa:=FContrato.qEmpresa.FieldByName('NOMBREEMPRESA').AsString;
  NombreCiudad:=FContrato.qGeografico.FieldByName('NombreGeografico').AsString;
  MContrato.Lines.Clear;
  Primera := '';
  Primera := Primera + 'Por la cual se reconoce un pago.';
  MContrato.Lines.Add(Primera);
  Primera := '';
  Primera := Primera + 'El Subgerente de Operaciones de la '+NombreEmpresa+' en uso de sus funciones y,';
  MContrato.Lines.Add(Primera);
  MResolucion.Lines.Clear;
  Primera := '';
  Primera := Primera + 'Que al Señor ' + FContrato.NombreContratista + ',';
  Primera := Primera + '  se le autorizó mediante contrato ' + FContrato.qContrato.FieldByName('NUMEROCONTRATO').AsString+ ', ';
  Primera := Primera + FContrato.qContrato.FieldByName('OBJETO').AsString + '.,';
  MResolucion.Lines.Add(Primera);
  Primera := '';
  MResolucion.Lines.Add(Primera);
  Primera := Primera + 'Que el Señor '+FContrato.NombreContratista + ',';
  Primera := Primera + ' realizó los trabajos a entera satisfacción por parte de la '+NombreEmpresa+', y cursó a la ';
  Primera := Primera + NombreEmpresa+', una cuenta de cobro por la suma de: ';
  DParser1.Expresion := FloatToStr(FContrato.qContrato.FieldByName('CostoTotal').AsFloat);
  DParser1.Execute;
  Valor := DParser1.dsEnLetras;
  Primera := Primera + '('+FormatFloat('"$"#,##0.00',FContrato.qContrato.FieldByName('CostoTotal').AsFloat)+') ' + Valor ;
  MResolucion.Lines.Add(Primera);
  Primera := '';
  MResolucion.Lines.Add(Primera);
  Primera := Primera + 'Que actualmente la '+NombreEmpresa+', cuenta con ';
  Primera := Primera + ' presupuesto para la cancelación del anterior pago ';
  MResolucion.Lines.Add(Primera);
  MResuelve.Lines.Clear;
  Primera := '';
  Primera := Primera + 'Artículo 1o. Reconocer el pago al Señor ' + FContrato.NombreContratista + ',';
  Primera := Primera + ' por la suma de ';
  DParser1.Expresion := FloatToStr(FContrato.qContrato.FieldByName('CostoTotal').AsFloat);
  DParser1.Execute;
  Valor := DParser1.dsEnLetras;
  Primera := Primera + '('+FormatFloat('"$"#,##0.00',FContrato.qContrato.FieldByName('CostoTotal').AsFloat)+') ' + Valor ;
  MResuelve.Lines.Add(Primera);
  Primera := '';
  MResuelve.Lines.Add(Primera);
  Primera := Primera + 'Artículo 2o. Cargar al presupuesto de la '+NombreEmpresa;
  Primera := Primera + ' valor anotado en el artículo anterior.';
  MResuelve.Lines.Add(Primera);
  Primera := '';
  MResuelve.Lines.Add(Primera);
  Primera := '';
  MResuelve.Lines.Add(Primera);
  Primera := Primera + 'COMUNIQUESE Y CUMPLASE';
  MResuelve.Lines.Add(Primera);
  Primera := '';
  MResuelve.Lines.Add(Primera);
  Primera := '';
  MResuelve.Lines.Add(Primera);
  Primera := Primera + 'Dada en '+NombreCiudad;
  MResuelve.Lines.Add(Primera);
end;

procedure TFResolucion.BitBtn1Click(Sender: TObject);
begin
  fQRResolucion1 := TfQRResolucion1.Create(Application);
  try
    fQRResolucion1.QRLabelNombrefirmante.Caption := NombreFirmante[0];
    fQRResolucion1.QRLabelCargofirmante.Caption := CargoFirmante[0];
    fQRResolucion1.QRLabelNombrefirmante1.Caption := NombreFirmante[1];
    fQRResolucion1.QRLabelCargofirmante1.Caption := CargoFirmante[1];
    fQRResolucion1.QRLabelNombrefirmante2.Caption := NombreFirmante[2];
    fQRResolucion1.QRLabelCargofirmante2.Caption := CargoFirmante[2];
    fQRResolucion1.QRLabelNombrefirmante3.Caption := NombreFirmante[3];
    fQRResolucion1.QRLabelCargofirmante3.Caption := CargoFirmante[3];
    fQRResolucion1.QRRichTextResolucion.Lines.Add(MContrato.Text);
    fQRResolucion1.QRRichTextConsiderando.Lines.Add(MResolucion.Text);
    fQRResolucion1.QRMResuelve.Lines:= Mresuelve.Lines;
    fQRResolucion1.QuickReport.Preview;
  except
    fQRResolucion1.free;
  end;
end;

procedure TFResolucion.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFResolucion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

end.
