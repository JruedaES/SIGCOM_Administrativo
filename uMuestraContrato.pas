unit uMuestraContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, TParser, Buttons, ExtCtrls;

type
  TFMuestraContrato = class(TForm)
    DParser1: TDParser;
    Panel1: TPanel;
    Panel2: TPanel;
    MContrato: TMemo;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMuestraContrato: TFMuestraContrato;

implementation

Uses uQRContratoObra, uContrato;

var Valor, Primera, Segunda, Tercera, Cuarta, Quinta, Sexta, Septima, Octava : String;

{$R *.DFM}

procedure TFMuestraContrato.FormActivate(Sender: TObject);
var
  total: Double;
  IvaUtilidad:Double;
begin
//  IvaUtilidad:=(TotalMaterial+TotalTransporte+TotalEquipo+TotalManoObra)*(DMContrato.tPresActi.FieldByName('Utilidades').AsFloat);
//  Total:=(DMContrato.tContrato.FieldByName('MATERIAL').AsFloat+DMContrato.tContrato.FieldByName('MANOOBRA').AsFloat+DMContrato.tContrato.FieldByName('EQUIPO').AsFloat+DMContrato.tContrato.FieldByName('TRANSPORTE').AsFloat));
  MContrato.Lines.Clear;
  Primera :='1. OBJETO ';
  MContrato.Lines.Add(Primera);
  Primera := '    Ejecutar trabajos de mantenimiento de Alumbrado P�blico.';
  MContrato.Lines.Add(Primera);
  Segunda := '';
  MContrato.Lines.Add(Segunda);
  Segunda := '2. ALCANCE ';
  MContrato.Lines.Add(Segunda);
  Segunda := '';
  Segunda := Segunda + '    ' + FContrato.qContrato.FieldByName('OBJETO').AsString;
  Segunda := Segunda + ' (ANEXO 1)';
  MContrato.Lines.Add(Segunda);
  Tercera := '';
  MContrato.Lines.Add(Tercera);
  Tercera := '3. VALOR MATERIALES ';
  MContrato.Lines.Add(Tercera);
  Tercera := '';
  MContrato.Lines.Add(Tercera);
  Tercera := Tercera + '     El Valor total de los materiales necesarios para la ejecuci�n de este contrato ';
  Tercera := Tercera + 'son suministrados por el contratista ';
  MContrato.Lines.Add(Tercera);
  Cuarta := '';
  MContrato.Lines.Add(Cuarta);
  Cuarta := Cuarta + '4. VALOR ';
  MContrato.Lines.Add(Cuarta);
  Cuarta := '';
  Cuarta := Cuarta + 'El valor del presente contrato es de: ';
  DParser1.Expresion := FloatToStr(FContrato.qContrato.FieldByName('CostoTotal').AsFloat);
  DParser1.Execute;
  Valor := DParser1.dsEnLetras;
  Cuarta := Cuarta + Valor + '('+FormatFloat('"$"#,##0.00',FContrato.qContrato.FieldByName('CostoTotal').AsFloat)+') ';
  MContrato.Lines.Add(Cuarta);
  Quinta := '';
  MContrato.Lines.Add(Quinta);
  Quinta := Quinta + '5. LEGISLACION SOBRE SALUD OCUPACIONAL ';
  MContrato.Lines.Add(Quinta);
  Quinta := '';
  Quinta := Quinta + 'EL CONTRATISTA deber� tener en cuenta lo expresado en los '+
           'art�culos 34, 57, 108, 205, 206, 217, 220, 221,,282, 283, 349, 350 y 351'+
           'del C�digo Sustantivo de Trabajo, la ley 9 de 1979, decreto 614 de 1984, '+
           'Resoluci�n 2406 de 1979, 2013 de 1986 y 1016 de 1989,emanados de los Ministerios '+
           'de Trabajo y Salud, referentes a la legislaci�n sobre salud ocupacional. ';
{  Quinta := Quinta + 'art�culos 34, 57, 108, 205, 206, 217, 220, 221,,282, 283, 349, 350 y 351 ';
  Quinta := Quinta + 'del C�digo Sustantivo de Trabajo, la ley 9 de 1979, decreto 614 de 1984, ';
  Quinta := Quinta + 'Resoluci�n 2406 de 1979, 2013 de 1986 y 1016 de 1989, emanados de los Ministerios ';
  Quinta := Quinta + 'de Trabajo y Salud, referentes a la legislaci�n sobre salud ocupacional. ';}
  MContrato.Lines.Add(Quinta);
  Sexta := '';
  MContrato.Lines.Add(Sexta);
  Sexta := Sexta + '6. LEGISLACION SOBRE PRESERVACION DEL MEDIO AMBIENTE ';
  MContrato.Lines.Add(Sexta);
  Sexta := '';
  Sexta := Sexta + 'EL CONTRATISTA manifiesta conocer todas las normas reguladoras de ';
  Sexta := Sexta + 'la conservaci�n del medio ambiente y se compromete a cumplir lo ';
  Sexta := Sexta + 'dispuesto por la ley 99 de 1993, sus decretos reglamentarios y ';
  Sexta := Sexta + 'dem�s normas que lo modifiquen o adicionen ';
  Sexta := Sexta + ' contados a partir de la elaboraci�n y firma del presente contrato.';
  Sexta := Sexta + 'Previa a la ejecuci�n de la obra el Contratista tramitar� y ';
  Sexta := Sexta + 'obtendr� los permisos necesarios ante la autoridad ambiental competente ';
  Sexta := Sexta + 'para cumplir con las exigencias legales, adem�s los que llegare a requerirse ';
  Sexta := Sexta + 'durante el desarrollo del contrato. Tambi�n el contratista responder� patrimonialmente ';
  Sexta := Sexta + 'por los da�os ambientales con ocasi�n de los trabajos contratados. ';
  Sexta := Sexta + 'El contratista actuar� con autonom�a t�cnica y administrativa en la ';
  Sexta := Sexta + 'organizaci�n del presente contrato y debe disponer de los medios , equipos ';
  Sexta := Sexta + 'y elementos de seguridad y personal para la ejecuci�n de las actividades del anexo 1. ';
  MContrato.Lines.Add(Sexta);
  Septima := '';
  MContrato.Lines.Add(Septima);
  Septima := Septima + '7. PLAZO DE ENTREGA ';
  MContrato.Lines.Add(Septima);
  Septima := '';
  Septima := Septima + 'El plazo de entrega para este contrato es de 15 d�as contados a partir de la fecha de emisi�n. ';
  MContrato.Lines.Add(Septima);
  Octava := '';
  MContrato.Lines.Add(Octava);
  Octava := Octava + '8. ESTAMPILLA ';
  MContrato.Lines.Add(Octava);
  Octava := '';
  Octava := Octava + 'Para la legalizaci�n del presente contrato, el contratista concelar� el valor de ($20.00) ';
  Octava := Octava + 'por cada mil o fracci�n del valor total del contrato, correspondiente a la estampilla ';
  Octava:= Octava + 'Pro-Electrficaci�n Rural. ';
  MContrato.Lines.Add(Octava);
end;

procedure TFMuestraContrato.BitBtn1Click(Sender: TObject);
begin
  fQRContratoObra := TfQRContratoObra.Create(Application);
  fQRContratoObra.QuickReport.Preview;
  fQRContratoObra.Free;
end;

end.
