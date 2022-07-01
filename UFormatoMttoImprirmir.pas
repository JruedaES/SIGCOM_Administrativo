unit UFormatoMttoImprirmir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Grids, DBGrids, RXDBCtrl, ComCtrls, ExtCtrls, ToolEdit,QuickRpt, Qrctrls,
  Buttons, StdCtrls, Mask, DBCtrls;

type
  TFFormatoMttoImprimir = class(TForm)
    Panel1: TPanel;
    qFormatoDatos: TQuery;
    dsFormatoDatos: TDataSource;
    updFormatoDatos: TUpdateSQL;
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
    dsFormato: TDataSource;
    qFormato: TQuery;
    qFormatoCODIGOFORMATOMTTO: TFloatField;
    qFormatoNOMBREFORMATOMTTO: TStringField;
    Panel3: TPanel;
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
    Panel6: TPanel;
    Panel5: TPanel;
    bAceptar: TBitBtn;
    bCancelar: TBitBtn;
    qAmbito: TQuery;
    dsAmbito: TDataSource;
    qSubestacion: TQuery;
    dsSubestacion: TDataSource;
    qCoordinacion: TQuery;
    dsCoordinacion: TDataSource;
    qTipoMtto: TQuery;
    dsTipoMtto: TDataSource;
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
    QCircuitoCODIGOCIRCUITO: TStringField;
    QCircuitoNOMBRECIRCUITO: TStringField;
    qFormatoDatosCODIGOCIRCUITO: TStringField;
    dsTablaElemento: TDataSource;
    dsCaracteristicasElemento: TDataSource;
    qFormatoDatosCODIGOTIPOELEMENTO: TFloatField;
    GroupBox1: TGroupBox;
    LbAmbito: TLabel;
    LbSubestacion: TLabel;
    LbCoordinacion: TLabel;
    LbTipoMtto: TLabel;
    DBLCBFormato: TDBLookupComboBox;
    DBLCBAmbito: TDBLookupComboBox;
    DBLCBSubestacion: TDBLookupComboBox;
    DBLCBCoordinacion: TDBLookupComboBox;
    DBLCBTipoMtto: TDBLookupComboBox;
    codigo1: TListBox;
    codigo2: TListBox;
    Memo1: TMemo;
    Label9: TLabel;
    DBLCBSeccion: TDBLookupComboBox;
    Label10: TLabel;
    qSecciones: TQuery;
    dsSecciones: TDataSource;
    qSeccionesCODIGOSECCIONFORMATO: TFloatField;
    qSeccionesCODIGOFORMATOMTTO: TFloatField;
    qSeccionesNOMBRESECCIONFORMATO: TStringField;
    qSeccionesCONSECUTIVOSECCIONFORMATO: TFloatField;
    qFormatoDatosCODIGOELEMENTO: TStringField;
    dsEncabezado: TDataSource;
    qMedidas: TQuery;
    dsMedidas: TDataSource;
    qMedidasCODIGOCOLUMNAMEDIDA: TFloatField;
    qMedidasCODIGOSECCIONFORMATO: TFloatField;
    qMedidasNOMBRECOLUMNAMEDIDA: TStringField;
    qMedidasCODIGOTIPOCOLUMNAMEDIDA: TStringField;
    qMedidasTIPODATO: TStringField;
    qMedidasCONSECUTIVOMEDIDASECCION: TFloatField;
    qMedidasCODIGOUNIDADMEDIDAMTTO: TFloatField;
    procedure qFormatoDatosAfterInsert(DataSet: TDataSet);
    procedure qFormatoDatosCalcFields(DataSet: TDataSet);
    procedure qFormatoDatosCODIGOFORMATOMTTOChange(Sender: TField);
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
    procedure DBLCBCoordinacionClick(Sender: TObject);
    procedure qAmbitoAfterDelete(DataSet: TDataSet);
    procedure qAmbitoAfterPost(DataSet: TDataSet);
    procedure DBLCBFormatoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AjustarQRLabel(var qrLabel:TQRLabel);
    procedure AjustarQRLabelMedidas(var qrLabel:TQRLabel);
    procedure GenerarEncabezado;
    procedure GenerarEncabezadoSeccion;
    procedure GenerarMedidas;

  private
    { Private declarations }
  public
    bDatosIncompletos, bCancelando: Boolean;
    sqltablaelemento: string;
  end;

var
  FFormatoMttoImprimir:TFFormatoMttoImprimir;

implementation

uses uFuncionSGD, uQRFormato, uQRLiquidarExtrasRecargos;
{$R *.DFM}
procedure TFFormatoMttoImprimir.qFormatoDatosAfterInsert(DataSet: TDataSet);
var qDatos:TQuery;
begin
  qDatos:=TQuery.Create(self);
  qDatos.DatabaseName:='BaseDato';
  qDatos.sql.text:='SELECT SQ_HVEFORMATO.NEXTVAL FROM DUAL';
  qDatos.Open;
  qFormatoDatosCODIGOFORMATOMTTODATOS.AsString:=qDatos.Fields[0].AsString;
  qDatos.Free;
  qFormato.Close;
  qFormato.Open;
end;

procedure TFFormatoMttoImprimir.qFormatoDatosCalcFields(DataSet: TDataSet);
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
  end;
  if qFormatoDatosCODIGOUSUARIOMODIFICACION.AsString<>'' then
  begin
    qusuario.close;
    qusuario.sql.text:='SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+qFormatoDatosCODIGOUSUARIOMODIFICACION.AsString;
    qusuario.open;
    qFormatoDatosNombreUsuarioModificacion.asstring:=qusuario.fields[0].asstring;
  end;
end;

procedure TFFormatoMttoImprimir.qFormatoDatosCODIGOFORMATOMTTOChange(
  Sender: TField);
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

procedure TFFormatoMttoImprimir.qEncabezadoDatosAfterPost(DataSet: TDataSet);
begin
  qEncabezadoDatos.ApplyUpdates;
  qEncabezadoDatos.CommitUpdates;
end;

procedure TFFormatoMttoImprimir.qEncabezadoDatosAfterDelete(
  DataSet: TDataSet);
begin
  qEncabezadoDatos.ApplyUpdates;
  qEncabezadoDatos.CommitUpdates;
end;

procedure TFFormatoMttoImprimir.qEncabezadoDatosAfterInsert(
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

procedure TFFormatoMttoImprimir.qEncabezadoDatosCalcFields(DataSet: TDataSet);
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

procedure TFFormatoMttoImprimir.qFormatoDatosCODIGOADMINISTRATIVOValidate(
  Sender: TField);
begin
 {if Sender.Text <> '' then
  begin
    qCIA.Close;
    qCIA.Params[0].AsString:=Sender.Text;
    qCIA.Open;
    if qCIA.RecordCount > 0 then
    begin
//      lbCIA.Caption:=qCIA.Fields[0].AsString;
    end
    else
      raise Exception.Create('Este Código Administrativo No Existe.');
  end;
}
end;

procedure TFFormatoMttoImprimir.qFormatoDatosAfterPost(DataSet: TDataSet);
begin
   qFormatoDatos.ApplyUpdates;
  qFormatoDatos.CommitUpdates;
end;

procedure GenerarEncabezadoFormato(Sender: TObject);
begin
end;

procedure TFFormatoMttoImprimir.qFormatoDatosAfterDelete(DataSet: TDataSet);
begin
  qFormatoDatos.ApplyUpdates;
  qFormatoDatos.CommitUpdates;
end;

procedure TFFormatoMttoImprimir.AjustarQRLabel(var qrLabel:TQRLabel);
var
height,size:Integer;
begin
  height:=20;
  size:=9;
  qrLabel.AutoSize := False;
  qrLabel.WordWrap := False;
  qrLabel.Height := height;
  qrLabel.Font.Size := size;
  qrLabel.Font.Name := 'Arial';
//  qrLabel.Alignment:= taLeftJustify;
  qrLabel.Alignment:= taCenter;
  qrLabel.Font.Style:=[fsbold];
end;

procedure TFFormatoMttoImprimir.AjustarQRLabelMedidas(var qrLabel:TQRLabel);
var
heightMedida,sizeMedida:Integer;
begin
  heightMedida:=12;
  sizeMedida:=8;
  qrLabel.AutoSize:=true;
  qrLabel.WordWrap := False;
  qrLabel.Height := heightMedida;
  qrLabel.Font.Size := sizeMedida;
  qrLabel.Font.Name := 'Arial';
  qrLabel.Alignment:= taCenter;
  qrLabel.Font.Style:=[fsbold];
end;

procedure TFFormatoMttoImprimir.GenerarEncabezado();
var
 qEncabezadoFormato:TQuery;
 qrLabel:TQRLabel;
 qrShape:TQRShape;
 I,top,left,width,space,lineheight,topspace:Integer;

begin
  qencabezadoformato:=Tquery.Create(Application);
  qencabezadoformato.databaseName:='BaseDato';
  with qEncabezadoFormato.SQL do
  begin
    Add('Select codigoformatomtto, nombrecampo');
    add('from hve_encabezadoformato');
    Add('where codigoformatomtto='+ qformatoCODIGOFORMATOMTTO.asString);
  end;
  qEncabezadoFormato.Open;

  I:=0;
  top := 35;
  left:=150;
  width:=200;
  space:=15;
  topspace:=17;
  lineheight:=25;

  while not qEncabezadoFormato.eof do
    begin
      qrLabel := TQRLabel.Create(fqrformato.QREncabezado);
      qrShape := TQRShape.Create(FQRFormato.QREncabezado);
      AjustarQRLabel(qrLabel);
      // Encabezado Formato
      qrLabel.Top := top + I*topspace;
      qrLabel.Left := left;
      qrLabel.Width := width;
      qrLabel.Parent := fqrformato.QREncabezado;
      qrLabel.Caption := qEncabezadoFormato.FieldByName('NOMBRECAMPO').AsString;
      //Línea
      qrShape.Top := top + I*topspace;
      qrShape.Left := left + width + space;
      qrShape.Width:= width;
      qrShape.Height := lineheight;
      qrShape.Shape :=qrsHorLine;
      qrShape.Parent :=FQRFormato.QREncabezado;

      FQRFormato.QREncabezado.Height:=qrLabel.Top + space;
      inc(i);
      qEncabezadoFormato.next;
    end;
end;

procedure TFFormatoMttoImprimir.GenerarEncabezadoSeccion;
var
 qEncabezadoSeccion:TQuery;
 qrLabel:TQRLabel;
 qrShape:TQRShape;
 I,top,left,width,height,size,space,lineheight,topspace:Integer;

begin
 qEncabezadoSeccion:=Tquery.Create(Application);
 qEncabezadoSeccion.databaseName:='BaseDato';

 with qEncabezadoSeccion.SQL do
  begin
    Add('Select codigoseccionformato, nombrecampo');
    add('from hve_encabezadoseccion');
    Add('where codigoseccionformato='+ qSeccionesCODIGOSECCIONFORMATO.asString);
  end;
  qEncabezadoSeccion.Open;
  I:=0;
  top := 40;
  left:=150;
  width:=200;
  space:=15;
  topspace:=17;
  lineheight:=25;

  if qEncabezadoSeccion.RecordCount=0 then
    FQRFormato.QREncabezadoSeccion.Height:=45
  else
  begin
    while not qEncabezadoSeccion.eof do
    begin
      qrLabel := TQRLabel.Create(fqrformato.QREncabezadoSeccion);
      qrShape := TQRShape.Create(FQRFormato.QREncabezadoSeccion);
      AjustarQRLabel(qrLabel);
      //Encabezado Seccion
      qrLabel.Top := top + I*topspace;
      qrLabel.Left := left;
      qrLabel.Width := width;

      qrLabel.Parent := fqrformato.QREncabezadoSeccion;
      qrLabel.Caption := qEncabezadoSeccion.FieldByName('NOMBRECAMPO').AsString;
      //Línea
      qrShape.Top := top + I*topspace;
      qrShape.Left := left + width + space;
      qrShape.Width:= width;
      qrShape.Height := lineheight;
      qrShape.Shape := qrsHorLine;
      qrShape.Parent := FQRFormato.QREncabezadoSeccion;
      FQRFormato.QREncabezadoSeccion.Height:=qrLabel.Top + space;
      inc(i);
      qEncabezadoSeccion.next;
    end;
  end;
end;

procedure TFFormatoMttoImprimir.GenerarMedidas;
var
 qMedidas:TQuery;
 qrLabel:TQRLabel;
 qrShape:TQRShape;
 qrShapeLine:TQRShape;
 qrshapeVerLine:TQRShape;
 qrShapeRectangle:TQRShape;
 words: array of integer;
 I,medidasspace,j,k,leftrect,width1,width2,dato,top,rectangletop,left,rectangleleft,width,height,size,space,lineheight,topspace,lineleft:Integer;

begin
 qMedidas:=Tquery.Create(Application);
 qMedidas.databaseName:='BaseDato';

 if qMedidasCODIGOSECCIONFORMATO.asString = '' then
  Begin
    raise Exception.Create('No existen Formatos asociados.');
  End;

 with qMedidas.SQL do
  begin
    Add('Select codigoseccionformato, nombrecolumnamedida');
    add('from hve_columnamedida');
    Add('where ACTIVO = ''S'' AND codigoseccionformato='+ qMedidasCODIGOSECCIONFORMATO.asString);
  end;
  qmedidas.Close;
  qMedidas.Open;

  I:=0;
  j:=0;
  k:=0;
  top := 40;
  left:= 10;
  width:=0;
  width2:=0;
  space:=5;
  topspace:=17;
  lineheight:=25;
  rectangletop :=35;
  rectangleleft:=5;
  lineleft:=10;

  //Rectángulo
  qrShape := TQRShape.Create(FQRFormato.QRMedidas);
  qrShape.Shape := qrsRectangle;
  qrShape.Top := rectangletop;
  qrShape.Left := rectangleleft;
  qrShape.Width:= 1200;
  qrShape.Height := lineheight;
  qrShape.Parent := FQRFormato.QRMedidas;

  SetLength(words,qmedidas.recordcount );

  while not qMedidas.eof do
  begin
    qrLabel := TQRLabel.Create(fqrformato.QRMedidas);
    qrShapeLine := TQRShape.Create(FQRFormato.QRMedidas);
    qrShapeLine.Shape:=qrsVertLine;
    qrShapeLine.Height:=lineheight;
    qrShapeLine.Width:=1;
    qrShapeLine.Top:= rectangletop;
    qrShapeLine.parent := FQRFormato.QRMedidas;

    //Medidas
    AjustarQRLabelMedidas(qrLabel);
    qrLabel.Top := top;
    qrLabel.Parent := fqrformato.QRMedidas;
    qrLabel.Caption := qMedidas.FieldByName('NOMBRECOLUMNAMEDIDA').AsString;
    words[i]:= qrLabel.Width;
    width := width + qrlabel.Width;
    if (j=0)then
    begin
      qrLabel.Left:=left;
      width1:= width;
    end
    else
    begin
      if(J=1)then
      begin
        width2:= width2 + words[i-1]+ 18;
        qrLabel.Left:= qrLabel.Left + width2;
      end;
    end;
    qrShapeLine.Left:=lineleft;
    leftrect:= qrShapeLine.Left;
    qrShapeLine.Left:= qrShapeLine.Left + Width + i*19;
    qrShapeLine.Height:= qrShapeLine.Height + lineheight*9 + 2;
    j:=1;
    inc(i);
    qMedidas.next;
  end;
  qrShape.Width:= qrShapeLine.Left - rectangleleft;

   ///
    for k:=0 to 10 do
    begin
      qrShapeRectangle:=TQRShape.Create(FQRFormato.QRMedidas);
      qrShapeRectangle.Shape:= qrsHorLine;
      qrShapeRectangle.Left:=lineleft;
      qrShapeRectangle.Height:= 1 ;
      qrShapeRectangle.Width:= qrShapeLine.Left - rectangleleft - 5;
      qrShapeRectangle.Top:= rectangletop + k*lineheight;
      qrShapeRectangle.parent:=FQRFormato.QRMedidas;
    end;

    qrShapeLine := TQRShape.Create(FQRFormato.QRMedidas);
    qrShapeLine.Shape:=qrsVertLine;
    qrShapeLine.Height:=lineheight;
    qrShapeLine.Width:=1;
    qrShapeLine.Top:= rectangletop;
    qrShapeLine.parent := FQRFormato.QRMedidas;
    qrShapeLine.Left:= rectangleleft;
    qrShapeLine.Height:= qrShapeLine.Height + lineheight*9 + 2;
  qMedidas.free;
end;

procedure TFFormatoMttoImprimir.bAceptarClick(Sender: TObject);
begin
  Application.ProcessMessages;
  FQRFormato:=TFQRFormato.Create(Application);
  FQRFormato.QRLbNombreFormato.Caption:=DBLCBFormato.Text;
  FQRFormato.QRLbNombreSeccion.caption:=DBLCBSeccion.Text;
  FQRFormato.QRLabel26.Caption:=DBLCBAmbito.Text;
  FQRFormato.QRLabel32.Caption:=DBLCBSubestacion .Text;
  FQRFormato.QRLabel27.Caption:=DBLCBCoordinacion.Text;
  FQRFormato.QRLabel33.Caption:=DBLCBTipoMtto.Text;
  FQRFormato.QRLabel3.Caption := DateTimeToStr(Now);
  GenerarEncabezado;
  GenerarEncabezadoSeccion;
  GenerarMedidas;
  FQRFormato.QuickRep1.Preview;
end;

procedure TFFormatoMttoImprimir.FormClose(Sender: TObject;
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
        Action:=cafree;
      end;
    end
    else
      if ModalResult <> MrCancel then
      begin
        ModalResult := mrOK;
        Action:=cafree;
      end;
    end;
    if ModalResult=2 then
    begin
      try
        qFormatoDatos.Cancel;
        qFormatoDatos.CancelUpdates;
        Action:=cafree;
      except
      end;
    end;
end;

procedure TFFormatoMttoImprimir.bCancelarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Desea Cancelar la Operación?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
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

procedure TFFormatoMttoImprimir.DBLCBCoordinacionClick(Sender: TObject);
begin
if qFormato.Active then
   qFormato.Close;
  qFormato.ParamByName('CODIGOCOORDINACION').asinteger:= DBLCBCoordinacion.KeyValue;
  qFormato.Open;
end;

procedure TFFormatoMttoImprimir.qAmbitoAfterDelete(DataSet: TDataSet);
begin
  qAmbito.ApplyUpdates;
  qAmbito.CommitUpdates;
end;

procedure TFFormatoMttoImprimir.qAmbitoAfterPost(DataSet: TDataSet);
begin
  qAmbito.ApplyUpdates;
  qAmbito.CommitUpdates;
end;

procedure TFFormatoMttoImprimir.DBLCBFormatoClick(Sender: TObject);
begin
if qSecciones.Active then
   qSecciones.Close;
  qSecciones.ParamByName('CODIGOFORMATOMTTO').asinteger:= DBLCBFormato.KeyValue;
  qSecciones.Open;
end;

procedure TFFormatoMttoImprimir.FormCreate(Sender: TObject);
begin

  qAmbito.close;
  qSubestacion.close;
  qCoordinacion.Close;
  qTipoMtto.close;
  qFormato.close;
  qTipoElemento.close;
  qencabezado.open;
  qFormatoDatos.open;
  qEncabezadoDatos.open;

  qAmbito.open;
  qSubestacion.Open;
  qCoordinacion.Open;
  qTipoMtto.Open;
  qFormato.open;

  qTipoElemento.Open;
  qEncabezado.Open;
  qFormatoDatosCODIGOADMINISTRATIVOValidate(qFormatoDatosCODIGOADMINISTRATIVO);
  qFormatoDatos.Open;
  qEncabezadoDatos.open;

end;

end.

