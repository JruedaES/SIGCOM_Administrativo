unit uActaParcial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TParser, Buttons, ExtCtrls, Db, DBTables;

type

  TDatosActa=record
    Dependencia:string;
    Acta:integer;
    NumeroContrato:string;
    NombreContratista:String;
    NitContratista:string;
    Objeto:string;
    Asunto:string;
    ValoraPagar:double;
    Final:boolean;
    FechaLiquidacion:TDateTime;
  end;
  TFActaParcial = class(TForm)
    DParser1: TDParser;
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MResolucion: TMemo;
    MResuelve: TMemo;
    qEmpresa: TQuery;
    qEmpresaNOMBREEMPRESA: TStringField;
    qEmpresaNITEMPRESA: TStringField;
    qEmpresaLOGOEMPRESA: TBlobField;
    qEmpresaCIUDAD: TStringField;
    qEmpresaNOMBREABREVIADO: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    Datos:TDatosActa;
    NombreFirmante:array[0..3]of string;
    CargoFirmante:array[0..3]of string;
    Procedure CargarDatos;
    { Public declarations }
  end;

var
  FActaParcial: TFActaParcial;


implementation

Uses uQRActaParcial, uContrato;

var Valor, Primera: String;

{$R *.DFM}

procedure TFActaParcial.BitBtn1Click(Sender: TObject);
begin
  fQRActaParcial := TfQRActaParcial.Create(Application);
  try
    with fQRActaParcial do
    begin
      qlAreaFuncional.Caption:=Datos.Dependencia;
      qrlActa.Caption:=inttostr(Datos.Acta);
      qrlNumeroContrato.Caption:=Datos.NumeroContrato;
      qrlNombreContratista.Caption:=Datos.NombreContratista;
      qrlNitContratista.Caption:=Datos.NitContratista;
      qrlObjeto.Caption:=Datos.Objeto;
      qrlAsunto.Caption:=Datos.Asunto;
      qrlValoraPagar.Caption:=FormatFloat('"$"#,##0.00',Datos.ValoraPagar);
      QRLabelNombrefirmante.Caption :=NombreFirmante[0];
      QRLabelCargoFirmante.Caption := CargoFirmante[0];
      QRLabelNombrefirmante1.Caption := NombreFirmante[1];
      QRLabelCargoFirmante1.Caption := CargoFirmante[1];
      QRLabelNombrefirmante2.Caption := NombreFirmante[2];
      QRLabelCargoFirmante2.Caption := CargoFirmante[2];
      QRLabelNombrefirmante3.Caption := NombreFirmante[3];
      QRLabelCargoFirmante3.Caption := CargoFirmante[3];
    end;
    fQRActaParcial.QRRichTextConsiderando.Lines.Add(MResolucion.Text);
    fQRActaParcial.QRMResuelve.Lines:=Mresuelve.Lines;
    fQRActaParcial.QuickReport.Preview;
  except
    fQRActaParcial.Free;
  end;
end;

procedure TFActaParcial.BitBtn2Click(Sender: TObject);
begin
  close;
end;

procedure TFActaParcial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;
procedure TFActaParcial.CargarDatos;
var
//  total: Double;
//  IvaUtilidad:Double;
  i:integer;
  unidad,decimal:String;
begin
//  IvaUtilidad:=(TotalMaterial+TotalTransporte+TotalEquipo+TotalManoObra)*(FContrato.tPresActi.FieldByName('Utilidades').AsFloat);
//  Total:=(FContrato.tContrato.FieldByName('MATERIAL').AsFloat+FContrato.tContrato.FieldByName('MANOOBRA').AsFloat+FContrato.tContrato.FieldByName('EQUIPO').AsFloat+FContrato.tContrato.FieldByName('TRANSPORTE').AsFloat));
  MResolucion.Lines.Clear;
  Primera := '';
  Primera := 'En '+qEmpresa.FieldByName('CIUDAD').AsString+' el ' + FormatDateTime('d "de" mmmm "de" yyyy, ', now) + ' ';
  Primera := Primera + 'se reunieron en las oficinas de la '+qEmpresa.FieldByName('NOMBREEMPRESA').AsString+', los Señores ';
  Primera := Primera + fContrato.qInterventorNOMBREEMPLEADO.AsString +' en representación de la ' +qEmpresa.FieldByName('NOMBREEMPRESA').AsString+',';
  for i:=0 to 3 do
  begin
    if NombreFirmante[i]<>'' then
      Primera := Primera + NombreFirmante[i] + ',  ' + CargoFirmante[i]+', '
  end;
  Primera := Primera + ' con el fin de establecer el ';
  Primera := Primera + ' acta de Liquidación Parcial del contrato en referencia, así:';
  MResolucion.Lines.Add(Primera);
  MResuelve.Lines.Clear;
  Primera := '1. DESARROLLO DEL TRABAJO';
  MResuelve.Lines.Add(Primera);
  Primera := '';
  Primera := Primera + 'Se desarrolló el trabajo a entera satisfacción por parte de la '+qEmpresa.FieldByName('NOMBREABREVIADO').AsString+', ';
  Primera := Primera + 'mediante el contrato ' + Datos.NumeroContrato +fcontrato.qContratoNUMEROCONTRATO.AsString+ '.';
  MResuelve.Lines.Add(Primera);
  Primera := '';
  MResuelve.Lines.Add(Primera);
  Primera := '2. INTERVENTORIA';
  MResuelve.Lines.Add(Primera);
  Primera := '';
  Primera := Primera + 'El Interventor hace constar que los trabajos fueron recibidos a entera ';
  Primera := Primera + ' satisfacción, el día ' + FormatDateTime('d "de" mmmm "de" yyyy, ',Datos.FechaLiquidacion);
  MResuelve.Lines.Add(Primera);
  Primera := '';
  MResuelve.Lines.Add(Primera);
  Primera := '3. VALOR A PAGAR';
  MResuelve.Lines.Add(Primera);
  Primera := '';
  Primera := Primera + 'El valor a pagar es de: ';
  i:=Pos('.',FormatFloat('0.00',Datos.ValoraPagar));

  if i>0 then
    begin
     Unidad:=copy(FormatFloat('0.00',Datos.ValoraPagar),1,i-1);
     Decimal:=Copy(FormatFloat('0.00',Datos.ValoraPagar),i+1,2);
     DParser1.dsunidades:='Pesos';
     DParser1.Expresion :=Unidad;
     DParser1.Execute;
     Unidad:=DParser1.DsEnLetras;
     DParser1.dsunidades:='Centavos';
     DParser1.Expresion :=Decimal;
     DParser1.Execute;
     Decimal:=DParser1.DsEnLetras;
     Valor :=unidad+' con '+decimal;
    end
  else
   begin
     DParser1.Expresion :=FormatFloat('0.00',Datos.ValoraPagar);
     DParser1.Execute;
     Valor :=DParser1.DsEnLetras;
   end;

  //Valor := DParser1.dsEnLetras;
  Primera := Primera + Valor + '  ' + '('+FormatFloat('"$"#,##0.00',Datos.ValoraPagar) +') ';
  MResuelve.Lines.Add(Primera);
  Primera := '';
  MResuelve.Lines.Add(Primera);
  Primera := '';
  MResuelve.Lines.Add(Primera);
  Primera := 'En constancia firman quienes en ella intervinieron.';
  MResuelve.Lines.Add(Primera);

end;
end.
