unit UFormatoMttoDatosODT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Grids, DBGrids, RXDBCtrl, ComCtrls, ExtCtrls, ToolEdit,
  Buttons, StdCtrls, Mask, DBCtrls,ConsDll;

type
  TFFormatoMttoDatosODT = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    qFormatoDatos: TQuery;
    dsFormatoDatos: TDataSource;
    updFormatoDatos: TUpdateSQL;
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    Label22: TLabel;
    qEncabezadoDatos: TQuery;
    dsEncabezadoDatos: TDataSource;
    updEncabezadoDato: TUpdateSQL;
    qFormatoDatosCODIGOFORMATOMTTODATOS: TFloatField;
    qFormatoDatosCODIGOFORMATOMTTO: TFloatField;
    qFormatoDatosCODIGOADMINISTRATIVO: TFloatField;
    qFormatoDatosCODIGOUSUARIOCREACION: TFloatField;
    qFormatoDatosFECHACREACION: TDateTimeField;
    qFormatoDatosCODIGOUSUARIOMODIFICACION: TFloatField;
    qFormatoDatosFECHAULTIMAMODIFICACION: TDateTimeField;
    GroupBox1: TGroupBox;
    dsFormato: TDataSource;
    qFormato: TQuery;
    qFormatoCODIGOFORMATOMTTO: TFloatField;
    qFormatoNOMBREFORMATOMTTO: TStringField;
    Panel3: TPanel;
    Panel4: TPanel;
    dbeCIA: TDBEdit;
    lbCIA: TLabel;
    Label2: TLabel;
    DbUsuario: TDBEdit;
    Label3: TLabel;
    LbFecha: TLabel;
    DBFechaCreacion: TDBEdit;
    Panel7: TPanel;
    DBNavigator1: TDBNavigator;
    qFormatoDatosNombreUsuarioCreacion: TStringField;
    qFormatoDatosNombreUsuarioModificacion: TStringField;
    qEncabezado: TQuery;
    qEncabezadoCODIGOENCABEZADOFORMATO: TFloatField;
    qEncabezadoCODIGOFORMATOMTTO: TFloatField;
    qEncabezadoNOMBRECAMPO: TStringField;
    qEncabezadoCONSECUTIVOFORMATO: TFloatField;
    qCIA: TQuery;
    qEncabezadoDatosCODIGOENCABEZADOFORMATODATOS: TFloatField;
    qEncabezadoDatosCODIGOENCABEZADOFORMATO: TFloatField;
    qEncabezadoDatosCODIGOFORMATOMTTODATOS: TFloatField;
    qEncabezadoDatosVALORENCABEZADOFORMATO: TStringField;
    qEncabezadoDatosNombreCampo: TStringField;
    Label7: TLabel;
    Panel6: TPanel;
    Panel5: TPanel;
    bAceptar: TBitBtn;
    bCancelar: TBitBtn;
    GroupBox2: TGroupBox;
    LbAmbito: TLabel;
    qAmbito: TQuery;
    dsAmbito: TDataSource;
    LbSubestacion: TLabel;
    qSubestacion: TQuery;
    dsSubestacion: TDataSource;
    LbCoordinacion: TLabel;
    LbTipoMtto: TLabel;
    qCoordinacion: TQuery;
    dsCoordinacion: TDataSource;
    qTipoMtto: TQuery;
    dsTipoMtto: TDataSource;
    Label6: TLabel;
    qTipoElemento: TQuery;
    dsTipoElemento: TDataSource;
    qEncabezadoFormato: TQuery;
    dsEncabezadoFormato: TDataSource;
    updEncabezadoFormato: TUpdateSQL;
    qFormatoDatosCODIGOAMBITO: TFloatField;
    qFormatoDatosCODIGOSUBESTACION: TStringField;
    qFormatoDatosCODIGOCOORDINACION: TFloatField;
    qFormatoDatosCODIGOTIPOMTTO: TFloatField;
    qSubestacionCODIGOSUBESTACION: TStringField;
    qSubestacionNOMBRESUBESTACION: TStringField;
    qTipoMttoCODIGOTIPOMANT: TFloatField;
    qTipoMttoNOMBREMANT: TStringField;
    qTipoElementoCODIGOELEMENTO: TFloatField;
    qTipoElementoCODIGOTIPOELEMENTO: TStringField;
    qTipoElementoCODIGOAMBITO: TFloatField;
    qTipoElementoNOMBRETABLAELEMENTO: TStringField;
    qTipoElementoNUMEROCLAVESELEMENTO: TFloatField;
    qTipoElementoCLAVEELEMENTO1: TStringField;
    qTipoElementoCLAVEELEMENTO2: TStringField;
    qTipoElementoCLAVEELEMENTO3: TStringField;
    qTipoElementoNOMBRETIPOELEMENTO: TStringField;
    qTipoElementoCAMPODESCRIPTIVO: TStringField;
    qCoordinacionCODIGOODTOPERA: TFloatField;
    qCoordinacionNOMBREODTOPERA: TStringField;
    qAmbitoCODIGOAMBITO: TFloatField;
    qAmbitoNOMBREAMBITO: TStringField;
    qFormatoCODIGOCOORDINACION: TFloatField;
    LabelCodigoCircuito: TLabel;
    Label8: TLabel;
    codigo1: TListBox;
    codigo2: TListBox;
    QCircuito: TQuery;
    DSCircuito: TDataSource;
    qCaracteristicasElemento: TQuery;
    qCaracteristicasElementoCODIGOELEMENTO: TFloatField;
    qCaracteristicasElementoCODIGOTIPOELEMENTO: TStringField;
    qCaracteristicasElementoCODIGOAMBITO: TFloatField;
    qCaracteristicasElementoNOMBRETABLAELEMENTO: TStringField;
    qCaracteristicasElementoNUMEROCLAVESELEMENTO: TFloatField;
    qCaracteristicasElementoCLAVEELEMENTO1: TStringField;
    qCaracteristicasElementoCLAVEELEMENTO2: TStringField;
    qCaracteristicasElementoCLAVEELEMENTO3: TStringField;
    qCaracteristicasElementoNOMBRETIPOELEMENTO: TStringField;
    qCaracteristicasElementoCAMPODESCRIPTIVO: TStringField;
    qTablaElemento: TQuery;
    Memo1: TMemo;
    QCircuitoCODIGOCIRCUITO: TStringField;
    QCircuitoNOMBRECIRCUITO: TStringField;
    qFormatoDatosCODIGOCIRCUITO: TStringField;
    dsTablaElemento: TDataSource;
    dsCaracteristicasElemento: TDataSource;
    qFormatoDatosCODIGOTIPOELEMENTO: TFloatField;
    DBEdit1: TDBEdit;
    dsMantenimientoDatos: TDataSource;
    qPmelemento: TQuery;
    dsPmelemento: TDataSource;
    Memo2: TMemo;
    Memo3: TMemo;
    EAmbito: TEdit;
    ECoordinacion: TEdit;
    ETipoElemento: TEdit;
    EElemento: TEdit;
    ESubestacion: TEdit;
    ETipoMantenimiento: TEdit;
    ECircuito: TEdit;
    ENombreFormato: TEdit;
    ECodigoFormato: TEdit;
    Panel8: TPanel;
    qPmelementoCODIGOELEMENTOMANTENIMIENTO: TFloatField;
    qPmelementoCLELEMENTO1: TStringField;
    qPmelementoCLELEMENTO2: TStringField;
    qPmelementoCODIGOELEMENTO: TFloatField;
    qMantenimientoDatos: TQuery;
    qMantenimientoDatosCODIGOBANCOMANTENIMIENTO: TFloatField;
    qMantenimientoDatosNOMBREMANTENIMIENTO: TStringField;
    qMantenimientoDatosCODIGONIVELTENSION: TStringField;
    qMantenimientoDatosCODIGOAMBITO: TFloatField;
    qMantenimientoDatosFRECUENCIA: TFloatField;
    qMantenimientoDatosDESCRIPCION: TBlobField;
    qMantenimientoDatosCODIGOTIPOMANT: TFloatField;
    qMantenimientoDatosCODIGODESCRIPTIVO: TStringField;
    qMantenimientoDatosCODIGOELEMENTO: TFloatField;
    qMantenimientoDatosCODIGOAREAOPERACIONODT: TFloatField;
    qMantenimientoDatosCODIGOMANTENIMIENTO: TFloatField;
    qMantenimientoDatosCODIGOTIPOMANT_1: TFloatField;
    qMantenimientoDatosFECHAINICIOEJEC: TDateTimeField;
    qMantenimientoDatosFECHAFINEJEC: TDateTimeField;
    qMantenimientoDatosCODIGOSUBESTACION: TStringField;
    qMantenimientoDatosCODIGOCIRCUITO: TStringField;
    qMantenimientoDatosCODIGOBANCOMANTENIMIENTO_1: TFloatField;
    qMantenimientoDatosCODIGOAMBITO_1: TFloatField;
    qMantenimientoDatosOBSERVACIONELEMENTO: TStringField;
    qFormatoDatosFECHAPRUEBA: TDateTimeField;
    qFormatoDatosCODIGOELEMENTO: TStringField;
    qFormatoDatosCLELEMENTO1: TStringField;
    qFormatoDatosCLELEMENTO2: TStringField;
    qFormatoDatosCODIGOODT: TFloatField;
    qFormatoDatosCONSECUTIVOODT: TFloatField;
    qFormatoCoordinacion: TQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    qCIANOMBREADMINISTRATIVO: TStringField;
    qCIANOMBRECATEGORIA: TStringField;
    qCIACODIGOCENTROCOSTO: TFloatField;
    qCIACODIGOAREARESPONSABILIDAD: TFloatField;
    qFormatoDatosCODIGOHOJAVIDAEQUIPO: TFloatField;
    qMantenimientoDatosCODIGOHOJAVIDAEQUIPO: TFloatField;
    qFormatoDatosCODIGOMANTENIMIENTO: TFloatField;
    procedure qFormatoDatosAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure qFormatoDatosCalcFields(DataSet: TDataSet);
    procedure qEncabezadoDatosAfterPost(DataSet: TDataSet);
    procedure qEncabezadoDatosAfterDelete(DataSet: TDataSet);
    procedure qEncabezadoDatosAfterInsert(DataSet: TDataSet);
    procedure qEncabezadoDatosCalcFields(DataSet: TDataSet);
    procedure qFormatoDatosCODIGOADMINISTRATIVOValidate(Sender: TField);
    procedure qFormatoDatosAfterPost(DataSet: TDataSet);
    procedure qFormatoDatosAfterDelete(DataSet: TDataSet);
    procedure bAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bCancelarClick(Sender: TObject);
    procedure qAmbitoAfterDelete(DataSet: TDataSet);
    procedure qAmbitoAfterPost(DataSet: TDataSet);
    procedure cbElementoChange(Sender: TObject);
    procedure qFormatoDatosCODIGOAMBITOValidate(Sender: TField);
    procedure qFormatoDatosCODIGOCOORDINACIONValidate(Sender: TField);
    procedure qFormatoDatosCODIGOCIRCUITOValidate(Sender: TField);
    procedure qFormatoDatosBeforePost(DataSet: TDataSet);
    procedure qFormatoDatosCODIGOUSUARIOCREACIONValidate(Sender: TField);
    procedure CambiaCodigoFormato;
    procedure qFormatoDatosCODIGOFORMATOMTTOChange(Sender: TField);
    procedure qFormatoDatosAfterOpen(DataSet: TDataSet);

  private
    { Private declarations }
  public
    bDatosIncompletos, bCancelando: Boolean;
    sqltablaelemento, CODIGOFORMATOMANTENIMIENTO: string;
    mttoanterior:boolean;
    CODIGO_ADMINISTRATIVO: INTEGER;

  end;

var
  FFormatoMttoDatosODT:TFFormatoMttoDatosODT;

implementation

uses uFuncionSGD, uODTUrbanaRural, uListaRegistrarMantenimientoAnterior;
{$R *.DFM}
procedure TFFormatoMttoDatosODT.qFormatoDatosAfterInsert(DataSet: TDataSet);
var qDatos:TQuery;

begin
  qDatos:=TQuery.Create(self);
  qDatos.DatabaseName:='BaseDato';
  qDatos.sql.text:='SELECT SQ_HVEFORMATO.NEXTVAL FROM DUAL';
  qDatos.Open;
 // qFormatoDatosCODIGOMANTENIMIENTO.AsString:=qMantenimientoDatosCODIGOMANTENIMIENTO.AsString;
  qFormatoDatosCODIGOFORMATOMTTODATOS.AsString:=qDatos.Fields[0].AsString;
  qFormatoDatosFECHACREACION.AsString:= DateTimeToStr(Now);
  qFormatoDatosCODIGOUSUARIOCREACION.AsFloat:= VarCodigoUsuario;
  qFormatoDatosCODIGOADMINISTRATIVO.AsFloat:= CODIGO_ADMINISTRATIVO;

  qDatos.SQL.Clear;
  qDatos.close;
  qDatos.sql.text:='SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+ inttostr(VarCodigoUsuario);
  qDatos.open;
  qFormatoDatosNombreUsuarioCreacion.asstring:=qDatos.fields[0].asstring;
  qDatos.Free;
  qFormato.Close;
  qFormato.Open;
end;

procedure TFFormatoMttoDatosODT.FormShow(Sender: TObject);
var
  qry1,qry2,qry3,qry4,qrDatos:Tquery;
  dsElemento:TDataSource;
  sqltablaelemento1,sqlprueba:string;
begin
  qrDatos:=TQuery.Create(Application);
  qrDatos.DatabaseName:='BaseDato';
  qSubestacion.Open;
  qCoordinacion.Open;
  qTipoMtto.Open;
  qFormato.Open;
  qTipoElemento.Open;
  qEncabezado.Open;
  qFormatoDatos.Open;
  qEncabezadoDatos.open;
  qrDatos.SQL.Add('SELECT NOMBREAMBITO FROM PM_AMBITO WHERE CODIGOAMBITO =' + qMantenimientoDatosCODIGOAMBITO.AsString);
  qrDatos.Open;
  EAmbito.text:=qrDatos.Fields[0].AsString;
  qrDatos.SQL.Clear;
  qrDatos.SQL.Add('SELECT NOMBRESUBESTACION FROM SUBESTACION WHERE CODIGOSUBESTACION='''+ qMantenimientoDatosCODIGOSUBESTACION.AsString+'''');
  qrDatos.Open;
  ESubestacion.text:=qrDatos.Fields[0].AsString;
  qrDatos.SQL.Clear;
  qrDatos.SQL.Add('SELECT NOMBREAREAOPERACIONODT FROM AREAOPERACIONODT WHERE CODIGOAREAOPERACIONODT='+ qMantenimientoDatosCODIGOAREAOPERACIONODT.AsString);
  qrDatos.Open;
  ECoordinacion.text:=qrDatos.Fields[0].AsString;
  qrDatos.SQL.Clear;
  qrDatos.SQL.Add('SELECT NOMBREMANT FROM PM_TIPOMANTENIMIENTO WHERE CODIGOTIPOMANT='+ qMantenimientoDatosCODIGOTIPOMANT.AsString);
  qrDatos.Open;
  ETipoMantenimiento.text:=qrDatos.Fields[0].AsString;
  qrDatos.SQL.Clear;
  qrDatos.SQL.Add('SELECT NOMBRETIPOELEMENTO FROM PM_ELEMENTO WHERE CODIGOELEMENTO='+ qMantenimientoDatosCODIGOELEMENTO.AsString);
  qrDatos.Open;
  ETipoElemento.text:=qrDatos.Fields[0].AsString;
  qrDatos.SQL.Clear;
  if (qMantenimientoDatosCODIGOAMBITO.AsInteger = 1)then
  begin
    LabelCodigoCircuito.Enabled:=false;
    ECircuito.Enabled:=false;
  end
  else if (qMantenimientoDatosCODIGOAMBITO.AsInteger = 2) then
  begin
    qrDatos.SQL.Add('SELECT NOMBRECIRCUITO FROM CIRCUITO WHERE CODIGOCIRCUITO='+ qMantenimientoDatosCODIGOCIRCUITO.AsString);
    qrDatos.Open;
    ECircuito.text:=qrDatos.Fields[0].AsString;
    qrDatos.SQL.Clear;
  end;
  if mttoanterior then
  begin
    qrDatos.SQL.Add('SELECT NOMBREFORMATOMTTO FROM HVE_FORMATOMTTO WHERE CODIGOFORMATOMTTO='+ fListaRegistrarMantenimientoAnterior.qPruebasProgramadasCODIGOFORMATOMTTO.AsString);
    qrDatos.Open;
    ENombreFormato.text:=qrDatos.Fields[0].AsString;
    qrDatos.SQL.Clear;
    ECodigoFormato.text:= fListaRegistrarMantenimientoAnterior.qPruebasProgramadasCODIGOFORMATOMTTO.AsString;
  end
  else
  begin
    qrDatos.SQL.Add('SELECT NOMBREFORMATOMTTO FROM HVE_FORMATOMTTO WHERE CODIGOFORMATOMTTO='+  CODIGOFORMATOMANTENIMIENTO);
    qrDatos.Open;
    ENombreFormato.text:=qrDatos.Fields[0].AsString;
    qrDatos.SQL.Clear;
    ECodigoFormato.text:= CODIGOFORMATOMANTENIMIENTO;
  end;
  qFormatoDatosCODIGOAMBITO.AsInteger:=qMantenimientoDatosCODIGOAMBITO.AsInteger;
  qFormatoDatosCODIGOSUBESTACION.AsString:=qMantenimientoDatosCODIGOSUBESTACION.AsString;
  qFormatoDatosCODIGOCOORDINACION.AsInteger:=qMantenimientoDatosCODIGOAREAOPERACIONODT.AsInteger;
  qFormatoDatosCODIGOTIPOMTTO.AsInteger:=qMantenimientoDatosCODIGOTIPOMANT.AsInteger;
  qFormatoDatosCODIGOTIPOELEMENTO.AsString:=qMantenimientoDatosCODIGOELEMENTO.AsString;
  qFormatoDatosCODIGOADMINISTRATIVO.AsInteger:= CODIGO_ADMINISTRATIVO;
  ///////////////***********
  qFormatoDatosCODIGOHOJAVIDAEQUIPO.AsFloat:=qMantenimientoDatosCODIGOHOJAVIDAEQUIPO.AsFloat;
  //////////////************
  if (qMantenimientoDatosCODIGOAMBITO.AsInteger = 2) then
  begin
    qFormatoDatosCODIGOCIRCUITO.AsString:=qMantenimientoDatosCODIGOCIRCUITO.AsString;
  end;
  qFormatoDatosCODIGOADMINISTRATIVOValidate(qFormatoDatosCODIGOADMINISTRATIVO);
  qFormatoDatosCODIGOUSUARIOCREACIONValidate(qFormatoDatosCODIGOUSUARIOCREACION);

  ///ELEMENTO
   qry1:= TQuery.Create(Application);
   qry1.DatabaseName:='BaseDato';
   qry1.SQL.Clear;
   qry1.SQL.Add('select * from pm_elemento where codigoelemento='+ qPmelementoCODIGOELEMENTO.AsString);
   qry1.Open;
   qFormatoDatosCLELEMENTO1.AsString:=qPmelementoCLELEMENTO1.AsString;
   qFormatoDatosCLELEMENTO2.AsString:=qPmelementoCLELEMENTO2.AsString;
   qFormatoDatosCODIGOELEMENTO.AsString:=qPmelementoCODIGOELEMENTO.AsString;
   dsElemento:= TDataSource.Create(application);
   dsElemento.DataSet:= qry1;
  //CONSULTAR ELEMENTO
  if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
     begin
       if qTablaElemento.Active then
         qTablaElemento.Close;
       qTablaElemento.SQL.Clear;
       sqltablaelemento1:= ' SELECT'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+','+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM ' + '  '+
                              qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+'  '+'WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+' = '''+qPmelemento.fieldbyname('CLELEMENTO1').AsString+''' ';
       Memo2.Lines.Append(sqltablaelemento1);
       qTablaElemento.SQL.Add(sqltablaelemento1);
       qTablaElemento.Open;
       memo3.Lines.Append(qTablaElemento.Fields[1].asstring);
       EElemento.Text:= qTablaElemento.Fields[1].asString;
     end
   else
     begin
       if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
       begin
         if qTablaElemento.Active then
           qTablaElemento.Close;
         qTablaElemento.SQL.Clear;
         sqltablaelemento1:= ' SELECT'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+' FROM ' + '  '+
                                qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+'  '+'WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+' = '''+qPmelemento.fieldbyname('CLELEMENTO1').AsString+''' ';
         Memo2.Lines.Append(sqltablaelemento1);
         qTablaElemento.SQL.Add(sqltablaelemento1);
         qTablaElemento.Open;
         memo3.Lines.Append(qTablaElemento.Fields[0].asstring);
         EElemento.Text:= qTablaElemento.Fields[0].asString;
       end
     end;
   if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
     begin
       if qTablaElemento.Active then
         qTablaElemento.Close;
       qTablaElemento.SQL.Clear;
       sqltablaelemento1:= ' SELECT '+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+','+qry1.fieldbyname('CLAVEELEMENTO2').asstring+','+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                             qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+'WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+' = '''+qPmelemento.fieldbyname('CLELEMENTO1').asstring+''' '+
                             'and'+qry1.fieldbyname('CLAVEELEMENTO').asstring+' = '''+qPmelemento.fieldbyname('CLELEMENTO2').asstring+''' ';
       qTablaElemento.SQL.Add(sqltablaelemento1);
       qTablaElemento.Open;
       Memo3.Lines.Append(qTablaElemento.Fields[2].asstring);
     end
   else
     begin
       if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
       sqltablaelemento1:=  ' SELECT '+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+','+qry1.fieldbyname('CLAVEELEMENTO2').asstring+' '+' FROM'+' '+
                             qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+'WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+' =  '''+qPmelemento.fieldbyname('CLELEMENTO1').asstring+''' '+
                             'and'+qry1.fieldbyname('CLAVEELEMENTO2').asstring+' = '''+qPmelemento.fieldbyname('CLELEMENTO2').asstring+''' ';
       Memo2.Lines.Append(sqltablaelemento1);

       Memo3.Lines.Append(qPmelemento.fieldbyname('CLELEMENTO1').asstring+qPmelemento.fieldbyname('CLELEMENTO2').asstring);
     end;
end;

procedure TFFormatoMttoDatosODT.qFormatoDatosCalcFields(DataSet: TDataSet);
var qusuario:tquery;
begin
  qusuario:=TQuery.create(application);
  qusuario.databasename:='BaseDato';

  if qFormatoDatosCODIGOUSUARIOCREACION.AsString<>'' then
  begin
    qusuario.Close;
    qusuario.sql.text:='SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+qFormatoDatosCODIGOUSUARIOCREACION.AsString;
    qusuario.open;
    qFormatoDatosNombreUsuarioCreacion.asstring:=qusuario.fields[0].asstring;
    DbUsuario.Text:= qusuario.Fields[0].AsString;
  end;

  if qFormatoDatosCODIGOUSUARIOMODIFICACION.AsString<>'' then
  begin
    qusuario.close;
    qusuario.sql.text:='SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+qFormatoDatosCODIGOUSUARIOMODIFICACION.AsString;
    qusuario.open;
    qFormatoDatosNombreUsuarioModificacion.asstring:=qusuario.fields[0].asstring;
  end;
  qusuario.free;
end;

procedure TFFormatoMttoDatosODT.CambiaCodigoFormato;
var qEliminarEncabezados:tquery;
begin
  if qFormatoDatosCODIGOFORMATOMTTO.AsString<>'' then
  begin
    qEliminarEncabezados:=TQuery.Create(Application);
    qEliminarEncabezados.DatabaseName:='BaseDato';
    qEliminarEncabezados.sql.text:='DELETE FROM HVE_ENCABEZADOFORMATODATOS WHERE CODIGOFORMATOMTTODATOS='+qFormatoDatosCODIGOFORMATOMTTODATOS.AsString;
    qEliminarEncabezados.ExecSQL;
    qEliminarEncabezados.free;
    qEncabezadoDatos.close;
    qEncabezadoDatos.open;
    qEncabezado.close;
    qEncabezado.open;
    while (not qEncabezado.eof) do
    begin
      qEncabezadoDatos.Insert;
      qEncabezadoDatosCODIGOFORMATOMTTODATOS.AsString:=qFormatoDatosCODIGOFORMATOMTTODATOS.AsString;
      qEncabezadoDatosCODIGOENCABEZADOFORMATO.AsString:=qEncabezadoCODIGOENCABEZADOFORMATO.AsString;
      qEncabezadoDatos.Post;
      qEncabezado.next;
    end;
  end;
  qEncabezadoDatos.close;
  qEncabezadoDatos.open;
end;

procedure TFFormatoMttoDatosODT.qEncabezadoDatosAfterPost(DataSet: TDataSet);
begin
  qEncabezadoDatos.ApplyUpdates;
  qEncabezadoDatos.CommitUpdates;
end;

procedure TFFormatoMttoDatosODT.qEncabezadoDatosAfterDelete(
  DataSet: TDataSet);
begin
  qEncabezadoDatos.ApplyUpdates;
  qEncabezadoDatos.CommitUpdates;
end;

procedure TFFormatoMttoDatosODT.qEncabezadoDatosAfterInsert(
  DataSet: TDataSet);
var query:tquery;
begin
  query:=TQuery.create(Application);
  query.DatabaseName:='BaseDato';
  query.sql.text:='SELECT SQ_HVEENCABEZADO.NEXTVAL FROM DUAL';
  query.open;
  DataSet.fieldbyname('CODIGOENCABEZADOFORMATODATOS').asstring:=query.Fields[0].Asstring;
  query.close;
  query.free;
end;

procedure TFFormatoMttoDatosODT.qEncabezadoDatosCalcFields(DataSet: TDataSet);
var query:tquery;
begin
  if qEncabezadoDatosCODIGOENCABEZADOFORMATO.AsString<>'' then
  begin
    query:=TQuery.create(Application);
    query.DatabaseName:='BaseDato';
    query.sql.text:='SELECT NOMBRECAMPO FROM HVE_ENCABEZADOFORMATO WHERE CODIGOENCABEZADOFORMATO ='+qEncabezadoDatosCODIGOENCABEZADOFORMATO.AsString;
    query.open;
    qEncabezadoDatosNombreCampo.AsString:=query.Fields[0].AsString;
    query.free;
  end;
end;

procedure TFFormatoMttoDatosODT.qFormatoDatosCODIGOADMINISTRATIVOValidate(
  Sender: TField);
begin
  if Sender.Text <> '' then
  begin
    qCIA.Close;
    qCIA.Params[0].AsString:=Sender.Text;
    qCIA.Open;
    if qCIA.RecordCount > 0 then
    begin
      lbCIA.Caption:=qCIA.Fields[0].AsString;
    end
    else
      raise Exception.Create('Este Código Administrativo No Existe.');
  end;
end;

procedure TFFormatoMttoDatosODT.qFormatoDatosAfterPost(DataSet: TDataSet);
begin
  qFormatoDatos.ApplyUpdates;
  qFormatoDatos.CommitUpdates;
end;

procedure TFFormatoMttoDatosODT.qFormatoDatosAfterDelete(DataSet: TDataSet);
begin
  qFormatoDatos.ApplyUpdates;
  qFormatoDatos.CommitUpdates;
end;

procedure TFFormatoMttoDatosODT.bAceptarClick(Sender: TObject);
begin
  if updFormatoDatos = nil then
  begin
    Close;
    ModalResult:=MrOk;
  end
  else
  begin
      bDatosIncompletos := False;
    try
      qEncabezadoDatos.Close;
      qFormatoDatos.post;
      if qFormatoDatos.UpdatesPending then
        qFormatoDatos.ApplyUpdates;
      qEncabezadoDatos.Open;
      Close;
      ModalResult:=MrOk;
    except
      on E:Exception do
      begin
        ShowMessage(E.Message);
        bDatosIncompletos := True;
        qFormatoDatos.Edit;
        ModalResult:=MrCancel;
        qEncabezadoDatos.Open;
        Close;
      end;
    end;
  end;
end;

procedure TFFormatoMttoDatosODT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not bCancelando then
  begin
    if bDatosIncompletos then
    begin
      if Application.MessageBox(PChar('Hay datos incompletos.Desea completar los datos?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
      begin
        ModalResult := 0;
        bDatosIncompletos := false;
        Action:=caNone;
      end
      else
      begin
        qFormatoDatos.Cancel;
        qFormatoDatos.CancelUpdates;
        Action:=caHide;
      end;
    end
    else
      if ModalResult <> MrCancel then
      begin
        ModalResult := mrOK;
        Action:=caHide;
      end;
    end;
    if ModalResult=2 then
    begin
      try
        qFormatoDatos.Cancel;
        qFormatoDatos.CancelUpdates;
        Action:=caHide;
      except
      end;
    end;
end;

procedure TFFormatoMttoDatosODT.bCancelarClick(Sender: TObject);
begin
  if updFormatoDatos = nil then
  begin
    ModalResult:=MrCancel;
    Close;
  end
  else
  begin
    if Application.MessageBox(PChar('Perderá los cambios realizados.Esta seguro de Cancelar?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
    begin
      try
        qFormatoDatos.Cancel;
        if qFormatoDatos.UpdatesPending then
          qFormatoDatos.CancelUpdates;
      finally
        bDatosIncompletos := True;
        bCancelando := True;
        Close;
      end;
    end
    else
    begin
      ModalResult := 0;
      bDatosIncompletos := False;
    end;
  end;
end;

procedure TFFormatoMttoDatosODT.qAmbitoAfterDelete(DataSet: TDataSet);
begin
  qAmbito.ApplyUpdates;
  qAmbito.CommitUpdates;
end;

procedure TFFormatoMttoDatosODT.qAmbitoAfterPost(DataSet: TDataSet);
begin
  qAmbito.ApplyUpdates;
  qAmbito.CommitUpdates;
end;

procedure TFFormatoMttoDatosODT.cbElementoChange(Sender: TObject);
begin
  qFormatoDatos.FieldByName('CODIGOELEMENTO').AsInteger:= strtoint(eElemento.text);
end;

procedure TFFormatoMttoDatosODT.qFormatoDatosCODIGOAMBITOValidate(
  Sender: TField);
begin
  if qtipoelemento.Active then
      qtipoelemento.Close;
   qtipoelemento.ParamByName('CODIGOAMBITO').asinteger:= qFormatoDatosCODIGOAMBITO.AsInteger;
  qtipoelemento.Open;
end;

procedure TFFormatoMttoDatosODT.qFormatoDatosCODIGOCOORDINACIONValidate(
  Sender: TField);
begin
  if qFormato.Active then
   qFormato.Close;
  qFormato.Open;
end;

procedure TFFormatoMttoDatosODT.qFormatoDatosCODIGOCIRCUITOValidate(
  Sender: TField);
begin
  If (qFormatoDatosCODIGOAMBITO.AsInteger=2)then
  begin
        if (eCircuito.Visible) and (eCircuito.Text <> '') then
        begin
             if eElemento.Visible = false then
               eElemento.Visible:= true;
             if qCaracteristicasElemento.Active then
               qCaracteristicasElemento.Close;
             qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= qFormatoDatosCODIGOTIPOELEMENTO.AsInteger;
             qCaracteristicasElemento.Open;
             if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
               begin
                 if qTablaElemento.Active then
                   qTablaElemento.Close;
                 qTablaElemento.SQL.Clear;
                 sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                                    qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
                 qTablaElemento.SQL.Add(sqltablaelemento);
                memo1.Lines.Append(sqltablaelemento);
                 qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= qFormatoDatosCODIGOCIRCUITO.AsString;
                 qTablaElemento.Open;
                 if codigo1.Items.Count >= 1 then
                   codigo1.Clear;
                 while not qTablaElemento.Eof do
                   begin
                     codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                     eElemento.Text:=qTablaElemento.fields[1].asstring;
                     qTablaElemento.Next;
                   end;
               end
             else
               begin
                 if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
                   begin
                     if qTablaElemento.Active then
                       qTablaElemento.Close;
                     qTablaElemento.SQL.Clear;
                     sqltablaelemento:= ' SELECT '+'  '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                                        qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
                     qTablaElemento.SQL.Add(sqltablaelemento);
                     memo1.Lines.Append(sqltablaelemento);
                     qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= qFormatoDatosCODIGOCIRCUITO.AsString;
                     qTablaElemento.Open;
                     if codigo1.Items.Count >= 1 then
                       codigo1.Clear;
                     while not qTablaElemento.Eof do
                       begin
                         codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                         eElemento.Text:=qTablaElemento.fields[0].asstring;
                         qTablaElemento.Next;
                       end;
                   end;
               end;
             if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
             begin
               if qTablaElemento.Active then
                 qTablaElemento.Close;
               qTablaElemento.SQL.Clear;
               sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                                  qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
               qTablaElemento.SQL.Add(sqltablaelemento);
               memo1.Lines.Append(sqltablaelemento);
               qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:=qFormatoDatosCODIGOCIRCUITO.AsString;
               qTablaElemento.Open;
               if codigo1.Items.Count >= 1 then
                 codigo1.Clear;
               if codigo2.Items.Count >= 1 then
                 codigo2.Clear;
               while not qTablaElemento.Eof do
                 begin
                   codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                   codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                   eElemento.Text:=qTablaElemento.fields[2].asstring;
                   qTablaElemento.Next;
                 end;
               end
             else
             begin
               if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring ='') then
                 begin
                 if qTablaElemento.Active then
                   qTablaElemento.Close;
                 qTablaElemento.SQL.Clear;
                 sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+' '+'FROM'+' '+
                                    qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
                 qTablaElemento.SQL.Add(sqltablaelemento);
                 memo1.Lines.Append(sqltablaelemento);
                 qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= qFormatoDatosCODIGOCIRCUITO.AsString;
                 qTablaElemento.Open;
                 if codigo1.Items.Count >= 1 then
                   codigo1.Clear;
                 if codigo2.Items.Count >= 1 then
                   codigo2.Clear;
                 while not qTablaElemento.Eof do
                   begin
                     codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                     codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                     eElemento.Text:=qTablaElemento.fields[0].asstring + qTablaElemento.Fields[1].asstring;
                     qTablaElemento.Next;
                   end;
                 end;
               end;
           end
        else
          begin
            if eElemento.Enabled=true then
              eElemento.Enabled:= false;
          end;
  end;
end;

procedure TFFormatoMttoDatosODT.qFormatoDatosBeforePost(DataSet: TDataSet);
begin
  RefrescarVariables;
  qFormatoDatosFECHAULTIMAMODIFICACION.AsString:=DateTimeToStr(Now);
  qFormatoDatosCODIGOUSUARIOMODIFICACION.AsInteger:= varcodigousuario;
end;

procedure TFFormatoMttoDatosODT.qFormatoDatosCODIGOUSUARIOCREACIONValidate(
  Sender: TField);
var qusuario:tquery;
begin
  RefrescarVariables;
  qusuario:=TQuery.create(application);
  qusuario.databasename:='BaseDato';

  if qFormatoDatosCODIGOUSUARIOCREACION.AsString ='' then
   begin
      if qusuario.Active then
        qusuario.Close;
      qusuario.sql.text:='SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+ inttostr(varcodigousuario);
      qusuario.Open;
      DbUsuario.Text:= qusuario.Fields[0].AsString;
   end;
   qusuario.Free;
end;

procedure TFFormatoMttoDatosODT.qFormatoDatosCODIGOFORMATOMTTOChange(
  Sender: TField);
var qEliminarEncabezados:tquery;
begin
  if qFormatoDatosCODIGOFORMATOMTTO.AsString <> '' then
  begin
    qEliminarEncabezados:=TQuery.Create(Application);
    qEliminarEncabezados.DatabaseName:='BaseDato';
    qEliminarEncabezados.sql.text:='DELETE FROM HVE_ENCABEZADOFORMATODATOS WHERE CODIGOFORMATOMTTODATOS='+qFormatoDatosCODIGOFORMATOMTTODATOS.AsString;
    qEliminarEncabezados.ExecSQL;
    qEliminarEncabezados.free;
    qEncabezadoDatos.close;
    qEncabezadoDatos.open;
    qEncabezado.close;
    qEncabezado.open;
    while (not qEncabezado.eof) do
    begin
      qEncabezadoDatos.Insert;
      qEncabezadoDatosCODIGOFORMATOMTTODATOS.AsString:=qFormatoDatosCODIGOFORMATOMTTODATOS.AsString;
      qEncabezadoDatosCODIGOENCABEZADOFORMATO.AsString:=qEncabezadoCODIGOENCABEZADOFORMATO.AsString;
      qEncabezadoDatos.Post;
      qEncabezado.next;
    end;
  end;
  qEncabezadoDatos.close;
  qEncabezadoDatos.open;
end;

procedure TFFormatoMttoDatosODT.qFormatoDatosAfterOpen(DataSet: TDataSet);
begin
  qEncabezadoDatos.open;
  if qEncabezadoDatos.RecordCount=0 then
    CambiaCodigoFormato;
end;

end.


  