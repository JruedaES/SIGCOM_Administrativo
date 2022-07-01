unit uQRProgramacionMantenimiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, ExtCtrls, Qrctrls, Db, DBTables, Grids, DBGrids, StdCtrls, jpeg;

const Mes: array[0..11] of String = ('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre');
const Dias: array[0..6] of String = ('Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sabado');

type
  TFQRProgramacionMantenimiento = class(TForm)
    qSubestacion: TQuery;
    qCircuito: TQuery;
    qSubestacionNOMBRESUBESTACION: TStringField;
    qCircuitoCODIGOCIRCUITO: TStringField;
    qCircuitoCODIGOSUBESTACION: TStringField;
    qCircuitoCODIGONIVELTENSION: TStringField;
    qCircuitoNOCIRCUITO: TFloatField;
    qCircuitoNOMBRECIRCUITO: TStringField;
    qCircuitoCODIGOPROPIETARIO: TStringField;
    qCircuitoCORRIENTE: TFloatField;
    qCircuitoDESTINO: TStringField;
    qCircuitoLONGITUD: TFloatField;
    qCircuitoCAPACIDADINSTALADA: TFloatField;
    qCircuitoCODIGOESTRUCTURATIPICA: TStringField;
    qCircuitoCODIGONODOINICIAL: TFloatField;
    qCircuitoNOTRAFOSTRIFASICOS: TFloatField;
    qCircuitoCARGATRAFOSTRIFASICOS: TFloatField;
    qCircuitoCARGATRAFOSMONOFASICOS: TFloatField;
    qCircuitoNOTRAFOSMONOFASICOS: TFloatField;
    qCircuitoHISTORIA: TBlobField;
    qCircuitoCODIGOINTERRUPTORSUB: TStringField;
    qCircuitoCODIGOAPOYO: TFloatField;
    qCircuitoCODIGONODOMT: TStringField;
    qCircuitoNOCLIENTESBT: TFloatField;
    qCircuitoNOLAMPARASAP: TFloatField;
    qCircuitoNOTRAMOSBT: TFloatField;
    qCircuitoNOTRAMOSMT: TFloatField;
    qCircuitoNOAPOYOSMT: TFloatField;
    qCircuitoNOAPOYOSBT: TFloatField;
    qCircuitoNONODOSMT: TFloatField;
    qCircuitoNONODOSBT: TFloatField;
    qCircuitoCOLOR: TFloatField;
    qCircuitoPLANCHAS: TStringField;
    qCircuitoDES_ACUMULADO: TFloatField;
    qCircuitoFES_ACUMULADO: TFloatField;
    qCircuitoCODIGOGRUPOINDICE: TFloatField;
    qCircuitoCODIGOESTADOINVENTARIO: TStringField;
    qCircuitoCODIGOCATEGORIA: TStringField;
    qCircuitoNOCLIENTESCRUZADOS: TFloatField;
    qCircuitoNOCLIENTESDIRECTOS: TFloatField;
    qCircuitoDEMANDAPROMEDIO: TFloatField;
    qCircuitoDEMANDAPROMEDIOCRUZADOS: TFloatField;
    qCircuitoFECHABALANCEDESDE: TDateTimeField;
    qCircuitoFECHABALANCEHASTA: TDateTimeField;
    qCircuitoCARGALAMPARASAP: TFloatField;
    qCircuitoDEMANDACLIENTESBT: TFloatField;
    qCircuitoDEMANDACLIENTESCRUZADOS: TFloatField;
    qCircuitoDEMANDALAMPARASAP: TFloatField;
    qCircuitoCODIGOCREG_COSTOLINEA: TFloatField;
    qCircuitoCODIGODISTRITO: TStringField;
    qCircuitoIDALIMENTADOR: TFloatField;
    qCircuitoCODIGOCURVATIPICA: TFloatField;
    qCircuitoCODIGOETAPADESLASTRE: TFloatField;
    qCircuitoRELERECIERRE: TStringField;
    qCircuitoALIMENTADORRADIAL: TStringField;
    qCircuitoNORMALMENTEABIERTO: TStringField;
    qCircuitoLONGITUD_MT_EMPRESA: TFloatField;
    qCircuitoLONGITUD_BT_EMPRESA: TFloatField;
    qCircuitoCLIENTES_URBANOS: TFloatField;
    qCircuitoCLIENTES_RURALES: TFloatField;
    qCircuitoVALOR_AVALUO: TFloatField;
    qCircuitoCODIGOESTRUCTURA_CONDUCTOR: TFloatField;
    qCircuitoCODIGOESTRUCTURA_APOYO: TFloatField;
    qMantenimiento: TQuery;
    QuickRep1: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    DataSource1: TDataSource;
    qMantenimientoFECHAINICIAL: TDateTimeField;
    qMantenimientoNOMBRETAREA: TStringField;
    qMantenimientoCODIGOSUBESTACION: TStringField;
    qMantenimientoCODIGOCIRCUITO: TStringField;
    qMantenimientoCODIGOELEMENTO: TStringField;
    qMantenimientoFECHAFINEJEC: TDateTimeField;
    qMantenimientoCODIGOAMBITO: TFloatField;
    qMantenimientoNombreEspecificoAmbito: TStringField;
    QRBand1: TQRBand;
    qlNombreEmpresa: TQRLabel;
    QRShape5: TQRShape;
    QRDBImage1: TQRDBImage;
    qrlTitulo: TQRLabel;
    QRImage2: TQRImage;
    Button1: TButton;
    tEmpresa: TTable;
    qMantenimientoNOMBREAMBITO: TStringField;
    qMantenimientoNOMBREMANT: TStringField;
    procedure qMantenimientoCalcFields(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor imprimir(AOwner: TComponent; Mes_Year: String);
    procedure SubestacionDia(DiaConsulta: String);
    procedure CircuitoDia(DiaConsultaCto:String);
  end;

var
  FQRProgramacionMantenimiento: TFQRProgramacionMantenimiento;

implementation

{$R *.DFM}


procedure TFQRProgramacionMantenimiento.SubestacionDia(DiaConsulta: String);
var
  SubestacionTemp: String;
begin
{
  if qMantenimientoDia.Active then
    qMantenimientoDia.Close;
  qMantenimientoDia.ParamByName('FECHATAREA').AsString:= DiaConsulta;
  qMantenimientoDia.Open;
  if not qMantenimientoDia.IsEmpty then
    begin
      SubestacionTemp:= qMantenimientoDia.fieldByName('CODIGOSUBESTACION').AsString;
      if qSubestacion.Active then
        qSubestacion.Close;
      qSubestacion.ParamByName('CODSUBESTACION').AsString:= SubestacionTemp;
      qSubestacion.Open;
      while not qMantenimientoDia.Eof do
        begin
          if SubestacionTemp <> qMantenimientoDia.FieldByName('CODIGOSUBESTACION').AsString then
            begin
              SubestacionTemp:= qMantenimientoDia.fieldByName('CODIGOSUBESTACION').AsString;
              if qSubestacion.Active then
                qSubestacion.Close;
              qSubestacion.ParamByName('CODSUBESTACION').AsString:= SubestacionTemp;
              qSubestacion.Open;
            end;
          qMantenimientoDia.Next;
        end;

    end;

                  }
end;

procedure TFQRProgramacionMantenimiento.CircuitoDia(DiaConsultaCto:String);
var
CircuitoTemp:String;
begin
{  if qMantenimientoDiaCircuito.Active then
    qMantenimientoDiaCircuito.Close;
  qMantenimientoDiaCircuito.ParamByName('FECHATAREACTO').AsString:= DiaConsultaCto;
  qMantenimientoDiaCircuito.Open;
  if not qMantenimientoDiaCircuito.IsEmpty then
    begin
      CircuitoTemp:= qMantenimientoDiaCircuito.fieldByName('CODIGOCIRCUITO').AsString;
      if qCircuito.Active then
        qCircuito.Close;
      qCircuito.ParamByName('CODCIRCUITO').AsString:= CircuitoTemp;
      qCircuito.Open;
      while not qMantenimientoDiaCircuito.Eof do
        begin
          if CircuitoTemp <> qMantenimientoDiaCircuito.FieldByName('CODIGOCIRCUITO').AsString then
            begin
              CircuitoTemp:= qMantenimientoDiaCircuito.fieldByName('CODIGOCIRCUITO').AsString;
              if qCircuito.Active then
                qCircuito.Close;
              qCircuito.ParamByName('CODSUBESTACION').AsString:= CircuitoTemp;
              qCircuito.Open;
            end;
          qMantenimientoDiaCircuito.Next;
        end;

    end;            }
end;


constructor TFQRProgramacionMantenimiento.imprimir(AOwner:TComponent;Mes_Year:String);
var
  sql,FechaConsulta,FechaConsultaCto: string;
  DiaTemp,DiaTempCircuito: Integer;
  Qry1: TQuery;
  MesConsulta: TDate;
begin
  inherited Create(Owner);
  {sql:= ' SELECT CODIGOTAREA,NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA, CODIGOSUBESTACION, CODIGOCIRCUITO, CODIGOAMBITO FROM PM_TAREA,PM_MANTENIMIENTO,PM_BANCOMANTENIMIENTO WHERE TO_CHAR(FECHAINICIAL,''MMYYYY'')= '''
  +Mes_Year+''' AND PM_TAREA.CODIGOTAREA = PM_MANTENIMIENTO.CODIGOMANTENIMIENTO AND PM_MANTENIMIENTO.CODIGOBANCOMANTENIMIENTO = PM_BANCOMANTENIMIENTO.CODIGOBANCOMANTENIMIENTO ORDER BY FECHAINICIAL,HORA ';
  Qry1:= TQuery.Create(Application);
  Qry1.DatabaseName:='BaseDato';
  Qry1.Sql.Clear;
  sql:= ' SELECT CODIGOTAREA,NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA FROM PM_TAREA WHERE TO_CHAR(FECHAINICIAL,''MMYYYY'')= '''+Mes_Year+''' ORDER BY FECHAINICIAL,HORA ';
  Qry1.Sql.Add(sql);
  Qry1.Open;
  if not Qry1.IsEmpty then
    begin
      DiaTemp:=Qry1.FieldByName('DIA').AsInteger;
      if DiaTemp <= 9 then
        FechaConsulta:= '0'+InttoStr(DiaTemp)+Mes_Year
      else
        FechaConsulta:= InttoStr(DiaTemp)+Mes_Year;

      SubestacionDia(FechaConsulta);
      while not Qry1.Eof do
        begin
          if DiaTemp <> Qry1.FieldByName('DIA').AsInteger then
            begin
              DiaTemp:=Qry1.FieldByName('DIA').AsInteger;
              FechaConsulta:= InttoStr(DiaTemp)+Mes_Year;
              SubestacionDia(FechaConsulta);
            end;
          Qry1.Next;
        end;
      Qry1.First;
      DiaTempCircuito:= Qry1.FieldByName('DIA').AsInteger;
      if DiaTempCircuito < 9 then
        FechaConsultaCto:= '0'+InttoStr(DiaTempCircuito)+Mes_Year
      else
        FechaConsultaCto:= InttoStr(DiaTempCircuito)+Mes_Year;
    end;
  Qry1.Close;
  Qry1.Free;
                        }
  if QMantenimiento.Active then
    QMantenimiento.Close;
  QMantenimiento.ParamByName('MES').AsString:= Mes_Year;
  QMantenimiento.Open;
end;

procedure TFQRProgramacionMantenimiento.qMantenimientoCalcFields(
  DataSet: TDataSet);
begin
  if (qMantenimientoCODIGOAMBITO.AsString='1') then
  begin
    qSubestacion.Close;
    qSubestacion.ParamByName('CODIGOSUBESTACION').AsString:=qMantenimientoCODIGOSUBESTACION.AsString;
    qSubestacion.Open;
    qMantenimientoNombreEspecificoAmbito.AsString:=qSubestacionNOMBRESUBESTACION.AsString;
  end
  else
  begin
    qCircuito.Close;
    qCircuito.ParamByName('CODIGOCIRCUITO').AsString:=qMantenimientoCODIGOCIRCUITO.AsString;
    qCircuito.Open;
    qMantenimientoNombreEspecificoAmbito.AsString:=qCircuitoNOMBRECIRCUITO.AsString;
  end;
end;

procedure TFQRProgramacionMantenimiento.FormShow(Sender: TObject);
begin
  {qMantenimiento.close;
  qMantenimiento.ParamByName('MES').AsString:='112006';
  qMantenimiento.open;}

end;

procedure TFQRProgramacionMantenimiento.Button1Click(Sender: TObject);
begin
   QuickRep1.Preview;
end;

end.
