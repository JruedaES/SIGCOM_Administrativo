unit UQRMttosPendientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, Db, DBTables, ExtCtrls, jpeg, StdCtrls;

type
  TFQRMttosPendientes = class(TForm)
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    tEmpresaLogo: TTable;
    tEmpresaLogoCODIGOEMPRESA: TStringField;
    tEmpresaLogoCONSECUTIVO: TStringField;
    tEmpresaLogoLOGOEMPRESA: TBlobField;
    dsEmpresaLogo: TDataSource;
    QRShape16: TQRShape;
    qlPagina: TQRSysData;
    ShTitulo: TQRShape;
    qrdbNombreEmpresa: TQRDBText;
    QRDBText6: TQRDBText;
    qlAreaFuncional: TQRLabel;
    QRDBImage1: TQRDBImage;
    lbTitulo: TQRLabel;
    qrlbFecha: TQRLabel;
    QRImage2: TQRImage;
    QRMemo1: TQRMemo;
    QRLabel8: TQRLabel;
    QRMemo2: TQRMemo;
    QRMemo3: TQRMemo;
    QRMemo5: TQRMemo;
    QRLabel10: TQRLabel;
    qMttoReprogramado: TQuery;
    dsMttoReprogramado: TDataSource;
    QRShape4: TQRShape;
    QRBand1: TQRBand;
    QRDBText17: TQRDBText;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    QRDBText21: TQRDBText;
    QRDBText22: TQRDBText;
    QRShape3: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape19: TQRShape;
    qEmpresa: TQuery;
    QRLabel1: TQRLabel;
    qMttoReprogramadoCODIGOTAREA: TFloatField;
    qMttoReprogramadoFECHAINICIAL: TDateTimeField;
    qMttoReprogramadoFECHAFINAL: TDateTimeField;
    qMttoReprogramadoNOMBRETAREA: TStringField;
    qMttoReprogramadoNOMBREESTADO: TStringField;
    qMttoReprogramadoTENSION: TFloatField;
    qMttoReprogramadoNOMBRETIPOELEMENTO: TStringField;
    qMttoReprogramadoNOMBRESUBESTACION: TStringField;
    qMttoReprogramadoCODIGOMANTENIMIENTO: TFloatField;
    qMttoReprogramadoCODIGOTIPOMANT: TFloatField;
    qMttoReprogramadoNOMBREMANT: TStringField;
    qMttoReprogramadoCODIGOELEMENTO: TFloatField;
    qMttoReprogramadoNOMBREAREAOPERACIONODT: TStringField;
    QRMemo4: TQRMemo;
    QRDBText24: TQRDBText;
    QRShape1: TQRShape;
    QRShape20: TQRShape;
    QRMemo6: TQRMemo;
    QRMemo7: TQRMemo;
    QRMemo8: TQRMemo;
    QRShape21: TQRShape;
    QRShape2: TQRShape;
    QRShape22: TQRShape;
    QRMemo9: TQRMemo;
    QRShape23: TQRShape;
    QRShape25: TQRShape;
    QRShape26: TQRShape;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    qMttoReprogramadoelemento: TStringField;
    qElementoMtto: TQuery;
    qElementoMttoCODIGOELEMENTOMANTENIMIENTO: TFloatField;
    qElementoMttoCLELEMENTO1: TStringField;
    qElementoMttoCLELEMENTO2: TStringField;
    qElementoMttoCODIGOELEMENTO: TFloatField;
    Memo2: TMemo;
    procedure QuickRep1AfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qMttoReprogramadoCalcFields(DataSet: TDataSet);
    procedure consultarElemento(codigotipoelemento:string);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FQRMttosPendientes: TFQRMttosPendientes;

implementation

{$R *.DFM}

procedure TFQRMttosPendientes.QuickRep1AfterPreview(Sender: TObject);
begin
  close;
  qMttoReprogramado.Free;
  qEmpresa.Free;
end;

procedure TFQRMttosPendientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure TFQRMttosPendientes.qMttoReprogramadoCalcFields(DataSet: TDataSet);
begin
  qElementoMtto.Close;
  qElementoMtto.ParamByName('CODIGOELEMENTOMANTENIMIENTO').AsString:=qMttoReprogramado.fieldbyname('CODIGOTAREA').asstring;
  qElementoMtto.Open;
  consultarelemento(qElementoMttoCODIGOELEMENTO.asstring);
  qMttoReprogramadoelemento.AsString:=Memo2.Text;
end;

procedure TFQRMttosPendientes.consultarElemento(codigotipoelemento:string);
var qry1,qtablaelemento:tquery;
  sqltablaelemento1:string;
begin
  qry1:=tquery.Create(Application);
  qry1.DatabaseName:='Basedato';
  qtablaelemento:=TQuery.Create(Application);
  qtablaelemento.DatabaseName:='Basedato';
  qry1.SQL.Add('select * from pm_elemento where codigoelemento=:codigoelemento');
  qry1.ParamByName('CODIGOELEMENTO').AsString:=codigotipoelemento;
  qry1.Open;
  Memo2.Clear;
 //CONSULTAR ELEMENTO
  if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
  begin
    if qTablaElemento.Active then
      qTablaElemento.Close;
    qTablaElemento.SQL.Clear;
    sqltablaelemento1:= ' SELECT'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+','+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM ' + '  '+
                        qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+'  '+'WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+' = '''+qElementoMtto.fieldbyname('CLELEMENTO1').AsString+''' ';
    qTablaElemento.SQL.Add(sqltablaelemento1);
    qTablaElemento.Open;
    memo2.Lines.Append(qTablaElemento.Fields[1].asstring);
  end
  else
  begin
    if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
    begin
      Memo2.Lines.Append(qElementoMtto.fieldbyname('CLELEMENTO1').asstring);
    end
  end;
  if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
  begin
    if qTablaElemento.Active then
      qTablaElemento.Close;
    qTablaElemento.SQL.Clear;
    sqltablaelemento1:= ' SELECT '+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+','+qry1.fieldbyname('CLAVEELEMENTO2').asstring+','+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                        qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+'WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+' = '''+qElementoMtto.fieldbyname('CLELEMENTO1').asstring+''' '+
                        'and'+qry1.fieldbyname('CLAVEELEMENTO').asstring+' = '''+qElementoMtto.fieldbyname('CLELEMENTO2').asstring+''' ';

    qTablaElemento.SQL.Add(sqltablaelemento1);
    qTablaElemento.Open;
    Memo2.Lines.Append(qTablaElemento.Fields[2].asstring);
  end
  else
  begin
    if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
    begin
      sqltablaelemento1:=  ' SELECT '+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+','+qry1.fieldbyname('CLAVEELEMENTO2').asstring+' '+' FROM'+' '+
                           qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+'WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+' =  '''+qElementoMtto.fieldbyname('CLELEMENTO1').asstring+''' '+
                           'and'+qry1.fieldbyname('CLAVEELEMENTO2').asstring+' = '''+qElementoMtto.fieldbyname('CLELEMENTO2').asstring+''' ';
      Memo2.Lines.Append(qElementoMtto.fieldbyname('CLELEMENTO1').asstring+qElementoMtto.fieldbyname('CLELEMENTO2').asstring);
    end;
  end;
  qry1.Free;
  qtablaelemento.Free;
//  elemento:=Memo2.Text;         
end;

procedure TFQRMttosPendientes.FormCreate(Sender: TObject);
begin
  qElementoMtto.Open;
end;

end.
