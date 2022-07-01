unit uAlarmaMantenimiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, Buttons, Grids, DBGrids, DBTables, StdCtrls, Menus;

type
  TfAlarmaMantenimiento = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    qAlarma: TQuery;
    SpeedButton1: TSpeedButton;
    dsAlarma: TDataSource;
    qAlarmaCODIGOTAREA: TFloatField;
    qAlarmaNOMBRETAREA: TStringField;
    qAlarmaFECHAINICIAL: TDateTimeField;
    qAlarmaCODIGOSUBESTACION: TStringField;
    qAlarmaCODIGOCIRCUITO: TStringField;
    qAlarmaCODIGOAMBITO: TFloatField;
    qAmbito: TQuery;
    qAmbitoCODIGOAMBITO: TFloatField;
    qAmbitoNOMBREAMBITO: TStringField;
    qAlarmaambito: TStringField;
    qAlarmaelemento: TStringField;
    qAlarmalugar: TStringField;
    Panel4: TPanel;
    DBGrid1: TDBGrid;
    StaticText1: TStaticText;
    Panel5: TPanel;
    procedure qAlarmaCalcFields(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor ListaMantenimientos(FechaMantenimiento:string);
  end;

var
  fAlarmaMantenimiento: TfAlarmaMantenimiento;

implementation

{$R *.DFM}

constructor TfAlarmaMantenimiento.ListaMantenimientos(FechaMantenimiento:string);
begin
  inherited create(Owner);
  if qAmbito.Active then
    qAmbito.Close;
  qAmbito.Open;
  if qAlarma.Active then
    qAlarma.Close;
  qAlarma.ParamByName('FECHAALARMA').asstring:= FechaMantenimiento;
  qAlarma.Open;
end;

procedure TfAlarmaMantenimiento.qAlarmaCalcFields(DataSet: TDataSet);
var qry1,qry2,qrycto,qrysub:Tquery;
    sqlmtto,sqltabla:string;
begin
  if (qAlarma.FieldByName('CODIGOTAREA').asstring <> '') then
    begin
      qry1:= Tquery.Create(application);
      qry1.DatabaseName:='BaseDato';
      sqlmtto:= ' select em.CLELEMENTO1,em.CLELEMENTO2,e.numeroclaveselemento,e.nombretablaelemento,e.claveelemento1,e.claveelemento2,e.campodescriptivo from '+
                ' pm_mantenimiento m,pm_bancomantenimiento bm,pm_elementomantenimiento em,pm_elemento e where '+
                ' m.codigomantenimiento ='''+qAlarma.fieldbyname('CODIGOTAREA').asstring+''' and '+
                ' m.CODIGOMANTENIMIENTO = em.CODIGOELEMENTOMANTENIMIENTO and '+
                ' m.CODIGOBANCOMANTENIMIENTO = bm.CODIGOBANCOMANTENIMIENTO and '+
                ' bm.CODIGOELEMENTO = e.CODIGOELEMENTO';
      qry1.SQL.Append(sqlmtto);
      qry1.Open;
      if (qry1.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
        begin
          if qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1 then
            begin
              sqltabla:= ' SELECT '+' '+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+qry1.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+
                         ' WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+'='''+qry1.fieldbyname('CLELEMENTO1').asstring+''' ';
                      {sqltabla:= ' SELECT '+' '+qryelemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+qryelemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+
                                 ' WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION AND'+qryelemento.fieldbyname('CLAVEELEMENTO1').asstring+'='+qMantenimientos.fieldbyname('CLELEMENTO1').asstring;}
              qry2:= Tquery.Create(application);
              qry2.DatabaseName:='BaseDato';
              qry2.SQL.Append(sqltabla);
              qry2.Open;
              qAlarma.FieldByName('ELEMENTO').asstring:= qry1.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+qry2.Fields[0].asstring;
            end
          else
            begin
              if qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2 then
                begin
                  sqltabla:= ' SELECT '+' '+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+qry1.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+
                             ' WHERE '+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+'='''+qry1.fieldbyname('CLELEMENTO1').asstring+''' and'+' '+
                               qry1.fieldbyname('CLAVEELEMENTO2').asstring+'='''+qry1.fieldbyname('CLELEMENTO2').asstring+''' ';
                          {sqltabla:= ' SELECT '+' '+qryelemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+qryelemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+
                                     ' WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION AND'+qryelemento.fieldbyname('CLAVEELEMENTO1').asstring+'='+qMantenimientos.fieldbyname('CLELEMENTO1').asstring+'and'+
                                       qryelemento.fieldbyname('CLAVEELEMENTO2').asstring+'='+qMantenimientos.fieldbyname('CLELEMENTO2').asstring;}
                  qry2:= Tquery.Create(application);
                  qry2.DatabaseName:='BaseDato';
                  qry2.SQL.Append(sqltabla);
                  qry2.Open;
                  qAlarma.FieldByName('ELEMENTO').asstring:= qry1.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+qry2.Fields[0].asstring;
                end;
            end;
        end
      else
        begin
          if (qry1.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
            begin
              if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) then
                qAlarma.FieldByName('ELEMENTO').asstring:= qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+qry1.fieldbyname('CLELEMENTO1').asstring
              else
                begin
                  if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) then
                    qAlarma.FieldByName('ELEMENTO').asstring:=qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+qry1.fieldbyname('CLELEMENTO1').asstring+qry1.fieldbyname('CLELEMENTO2').asstring;
                end;
            end;
        end;
      if (qAlarma.FieldByName('CODIGOAMBITO').asinteger = 1) then
        begin
          qrysub:= Tquery.Create(application);
          qrysub.DatabaseName:='BaseDato';
          qrysub.SQL.Append('select nombresubestacion from subestacion where codigosubestacion =:codigosubestacion');
          qrysub.ParamByName('CODIGOSUBESTACION').asstring:= qAlarma.fieldbyname('CODIGOSUBESTACION').asstring;
          qrysub.Open;
          qAlarma.FieldByName('LUGAR').asstring:= qrysub.fieldbyname('NOMBRESUBESTACION').asstring;
        end
      else
        begin
          qrycto:= Tquery.Create(application);
          qrycto.DatabaseName:='BaseDato';
          qrycto.SQL.Append('select nombrecircuito from circuito where codigocircuito =:codigocircuito');
          qrycto.ParamByName('CODIGOCIRCUITO').asstring:= qAlarma.fieldbyname('CODIGOCIRCUITO').asstring;
          qrycto.Open;
          qAlarma.FieldByName('LUGAR').asstring:= qrycto.fieldbyname('NOMBRECIRCUITO').asstring;
        end;
      qry1.Free;
      qry2.Free;
      qrysub.Free;
      qrycto.Free;

    end;
end;

procedure TfAlarmaMantenimiento.SpeedButton1Click(Sender: TObject);
begin
  fAlarmaMantenimiento.ModalResult:= mrOk;
end;

end.
