unit USeccionFormatoDatos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Grids, DBGrids, RXDBCtrl, ComCtrls, ExtCtrls, ToolEdit,
  StdCtrls, Mask, DBCtrls, Buttons,QuickRpt,Qrctrls;

type
  TFSeccionFormatoDatos = class(TForm)
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    qFormatoDatos: TQuery;
    dsFormatoDatos: TDataSource;
    updFormatoDatos: TUpdateSQL;
    qSeccionDatos: TQuery;
    dsSeccionDatos: TDataSource;
    updSeccionDatos: TUpdateSQL;
    Panel8: TPanel;
    Panel9: TPanel;
    qUsuarioCreacion: TQuery;
    qUsuarioCreacionNOMBREUSUARIO: TStringField;
    qUsuarioModificacion: TQuery;
    dsUsuarioModificacion: TDataSource;
    dsUsuarioCreacion: TDataSource;
    qEncabezadoSeccion: TQuery;
    dsEncabezadoSeccion: TDataSource;
    updEncabezadoSeccion: TUpdateSQL;
    TMedidas: TTable;
    dsMedidas: TDataSource;
    qValorMedida: TQuery;
    dsValorMedida: TDataSource;
    updValorMedida: TUpdateSQL;
    qValorMedidaDetalle: TQuery;
    dsValorMedidaDetalle: TDataSource;
    updValorMedidaDetalle: TUpdateSQL;
    qValorMedidaCODIGOVALORMEDIDA: TFloatField;
    qValorMedidaCODIGOSECCIONFORMATODATOS: TFloatField;
    qValorMedidaFILA: TFloatField;
    qValorMedidaDetalleCODIGOVALORMEDIDADETALLE: TFloatField;
    qValorMedidaDetalleCODIGOVALORMEDIDA: TFloatField;
    qColumnaMedida: TQuery;
    dsColumnaMedida: TDataSource;
    Panel1: TPanel;
    qValorMedidaDetalleCODIGOCOLUMNAMEDIDA: TFloatField;
    qValorMedidaDetalleVALOR: TStringField;
    GroupBox1: TGroupBox;
    qSeccion: TQuery;
    dsSeccion: TDataSource;
    qSeccionCODIGOSECCIONFORMATO: TFloatField;
    qSeccionCODIGOFORMATOMTTO: TFloatField;
    qSeccionNOMBRESECCIONFORMATO: TStringField;
    qSeccionCONSECUTIVOSECCIONFORMATO: TFloatField;
    qEncabezadoSeccionDatos: TQuery;
    dsEncabezadoSeccionDatos: TDataSource;
    qSeccionDatosCODIGOSECCIONFORMATODATOS: TFloatField;
    qSeccionDatosCODIGOFORMATOMTTODATOS: TFloatField;
    qSeccionDatosCODIGOSECCIONFORMATO: TFloatField;
    qEncabezadoSeccionCODIGOENCABEZADOSECCION: TFloatField;
    qEncabezadoSeccionCODIGOSECCIONFORMATO: TFloatField;
    qEncabezadoSeccionNOMBRECAMPO: TStringField;
    qEncabezadoSeccionCONSECUTIVOENCABEZADOSECCION: TFloatField;
    qEncabezadoSeccionDatosCODIGOENCABEZADOSECCIONDATOS: TFloatField;
    qEncabezadoSeccionDatosCODIGOSECCIONFORMATODATOS: TFloatField;
    qEncabezadoSeccionDatosCODIGOENCABEZADOSECCION: TFloatField;
    qEncabezadoSeccionDatosVALORENCABEZADOSECCION: TStringField;
    qFormatoDatosCODIGOFORMATOMTTODATOS: TFloatField;
    qFormatoDatosCODIGOFORMATOMTTO: TFloatField;
    qFormatoDatosCODIGOADMINISTRATIVO: TFloatField;
    qFormatoDatosCODIGOUSUARIOCREACION: TFloatField;
    qFormatoDatosFECHACREACION: TDateTimeField;
    qFormatoDatosCODIGOUSUARIOMODIFICACION: TFloatField;
    qFormatoDatosFECHAULTIMAMODIFICACION: TDateTimeField;
    RxDBGrid1: TRxDBGrid;
    updEncabezadoSeccionDatos: TUpdateSQL;
    qEncabezadoSeccionDatosNombreCampo: TStringField;
    updColumnaMedida: TUpdateSQL;
    qColumnaMedidaCODIGOCOLUMNAMEDIDA: TFloatField;
    qColumnaMedidaCODIGOSECCIONFORMATO: TFloatField;
    qColumnaMedidaNOMBRECOLUMNAMEDIDA: TStringField;
    qColumnaMedidaCODIGOTIPOCOLUMNAMEDIDA: TStringField;
    qColumnaMedidaTIPODATO: TStringField;
    qColumnaMedidaCONSECUTIVOMEDIDASECCION: TFloatField;
    qColumnaMedidaCODIGOUNIDADMEDIDAMTTO: TFloatField;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    Panel7: TPanel;
    bAceptar: TBitBtn;
    bCancelar: TBitBtn;
    qUsuarioModificacionNOMBREUSUARIO: TStringField;
    qNombreFormato: TQuery;
    dsNombreFormato: TDataSource;
    qNombreFormatoCODIGOFORMATOMTTO: TFloatField;
    qNombreFormatoNOMBREFORMATOMTTO: TStringField;
    qNombreFormatoCODIGOCOORDINACION: TFloatField;
    qFormato1: TQuery;
    FloatField1: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField5: TFloatField;
    DateTimeField2: TDateTimeField;
    dsFormato1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    qFormato1CODIGOAMBITO: TFloatField;
    qFormato1CODIGOSUBESTACION: TStringField;
    qFormato1CODIGOCOORDINACION: TFloatField;
    qFormato1CODIGOTIPOMTTO: TFloatField;
    qFormato1CODIGOTIPOELEMENTO: TFloatField;
    qFormato1CODIGOELEMENTO: TStringField;
    qFormato1CODIGOCIRCUITO: TStringField;
    qFormatoDatosCODIGOAMBITO: TFloatField;
    qFormatoDatosCODIGOSUBESTACION: TStringField;
    qFormatoDatosCODIGOCOORDINACION: TFloatField;
    qFormatoDatosCODIGOTIPOMTTO: TFloatField;
    qFormatoDatosCODIGOTIPOELEMENTO: TFloatField;
    qFormatoDatosCODIGOCIRCUITO: TStringField;
    qSeccionDatosNombreSeccion: TStringField;
    BitBtnImprimir: TBitBtn;
    qFormato1CODIGOFORMATOMTTO: TFloatField;
    qEncabezadoDatos: TQuery;
    qEncabezadoDatosCODIGOENCABEZADOFORMATODATOS: TFloatField;
    qEncabezadoDatosCODIGOENCABEZADOFORMATO: TFloatField;
    qEncabezadoDatosCODIGOFORMATOMTTODATOS: TFloatField;
    qEncabezadoDatosVALORENCABEZADOFORMATO: TStringField;
    qEncabezadoDatosNombreCampo: TStringField;
    dsEncabezadoDatos: TDataSource;
    qValorMedidaDetalleNombreColumnaMedida: TStringField;
    qSeccionDatosCODIGOODT: TFloatField;
    qSeccionDatosSUBACTIVIDADODT: TFloatField;
    qSeccionDatosESTADOTERMINADO: TStringField;
    Label4: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    qFormatoDatosFECHAPRUEBA: TDateTimeField;
    qSeccionDatosFECHAREGISTRO: TDateTimeField;
    qSeccionDatosFECHAMODIFICACION: TDateTimeField;
    qSeccionDatosFECHAPRUEBA: TDateTimeField;
    Label5: TLabel;
    Label6: TLabel;
    LbFecha: TLabel;
    DBFechaCreacionSeccion: TDBEdit;
    DBFechaModificacionSeccion: TDBEdit;
    Label7: TLabel;
    DBLCBSeccion: TDBLookupComboBox;
    qCIA: TQuery;
    qSeccionDatosNombreUsuarioCreacion: TStringField;
    qSeccionDatosNombreUsuarioModificacion: TStringField;
    qSeccionDatosCODIGOUSUARIOCREACION: TFloatField;
    qSeccionDatosCODIGOUSUARIOMODIFICACION: TFloatField;
    DBEFechaPrueba: TDBEdit;
    sbFechaPrueba: TSpeedButton;
    qFormatoDatosCODIGOELEMENTO: TStringField;
    qColumnaMedidaCODIGOTIPOVALOR: TFloatField;
    EFormato: TEdit;
    qFormatoDatosCLELEMENTO1: TStringField;
    qFormatoDatosCLELEMENTO2: TStringField;
    qFormatoDatosCODIGOODT: TFloatField;
    qFormatoDatosCONSECUTIVOODT: TFloatField;
    Label8: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    qSubactividad: TQuery;
    dsSubactividad: TDataSource;
    qSeccionDatosNombreSubactividad: TStringField;
    qSubactividadCODIGOSUBACTIVIDADAREAODT: TFloatField;
    qSubactividadCODIGOACTIVIDADAREAODT: TFloatField;
    qSubactividadNOMBRESUBACTIVIDADAREAODT: TStringField;
    Edit4: TEdit;
    dbgMedidas: TRxDBGrid;
    procedure bbAceptarClick(Sender: TObject);
    procedure qSeccionDatosAfterInsert(DataSet: TDataSet);
    procedure qValorMedidaAfterInsert(DataSet: TDataSet);
    procedure qValorMedidaDetalleAfterInsert(DataSet: TDataSet);
    procedure qSeccionDatosCODIGOSECCIONFORMATOChange(Sender: TField);
    procedure qEncabezadoSeccionDatosAfterInsert(DataSet: TDataSet);
    procedure qEncabezadoSeccionDatosCalcFields(DataSet: TDataSet);
    procedure qSeccionDatosAfterPost(DataSet: TDataSet);
    procedure qSeccionDatosAfterDelete(DataSet: TDataSet);
    procedure qFormatoDatosAfterDelete(DataSet: TDataSet);
    procedure qFormatoDatosAfterPost(DataSet: TDataSet);
    procedure qEncabezadoSeccionDatosAfterPost(DataSet: TDataSet);
    procedure qEncabezadoSeccionDatosAfterDelete(DataSet: TDataSet);
    procedure qEncabezadoSeccionAfterDelete(DataSet: TDataSet);
    procedure qEncabezadoSeccionAfterPost(DataSet: TDataSet);
    procedure qColumnaMedidaAfterPost(DataSet: TDataSet);
    procedure qColumnaMedidaAfterDelete(DataSet: TDataSet);
    procedure qValorMedidaAfterDelete(DataSet: TDataSet);
    procedure qValorMedidaAfterPost(DataSet: TDataSet);
    procedure qValorMedidaDetalleAfterDelete(DataSet: TDataSet);
    procedure qValorMedidaDetalleAfterPost(DataSet: TDataSet);
    procedure qSeccionAfterDelete(DataSet: TDataSet);
    procedure qSeccionAfterPost(DataSet: TDataSet);
    procedure qSeccionDatosBeforeInsert(DataSet: TDataSet);
    procedure TMedidasAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure bAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bCancelarClick(Sender: TObject);
    procedure BBtnImprimirClick(Sender: TObject);
    procedure FloatField2Change(Sender: TField);
    procedure GenerarEncabezado;
    procedure GenerarEncabezadoSeccion;
    procedure AjustarQRLabel(var qrLabel:TQRLabel);
    procedure AjustarQRLabelMedidas(var qrLabel:TQRLabel);
    procedure AjustarQRLabelMedidasDato(var qrLabelDato:TQRLabel);
    procedure GenerarDatos;
    procedure qEncabezadoDatosCalcFields(DataSet: TDataSet);
    procedure qValorMedidaDetalleCalcFields(DataSet: TDataSet);
    procedure qSeccionDatosCalcFields(DataSet: TDataSet);
    procedure qSeccionDatosCODIGOUSUARIOCREACIONValidate(Sender: TField);
    procedure qSeccionDatosBeforePost(DataSet: TDataSet);
    procedure sbFechaPruebaClick(Sender: TObject);
    procedure DBEFechaPruebaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    CargandoTabla:boolean;
  public
    bDatosIncompletos, bCancelando: Boolean;
    //Reporte
    words: array of integer;
    qrLabel:TQRLabel;
    qrShape:TQRShape;
    qrShapeLine:TQRShape;
    qrshapeVerLine:TQRShape;
    qrShapeRectangle:TQRShape;
    //Fin Reporte
    sFecha, Fecha:string;
    function GetFecha(Tipo:Boolean): String;

//    function GetTemporalPath: string;

    procedure CrearTablaTemporalMedidas;
    procedure CargarTablaTemporalMedidas;
    procedure EscribirTablaTemporalMedidas;
  end;
var
  FSeccionFormatoDatos: TFSeccionFormatoDatos;

implementation

uses uListaFormatoMantenimiento, uQREquipo, uHojaVidaEquipo, ConsDll,
  uFormaFecha, uODTUrbanaRural, UFormatoMttoDatosODT, uFuncionSGD;
{$R *.DFM}

procedure TFSeccionFormatoDatos.CrearTablaTemporalMedidas;
var TipoCampo:TFieldType;
    TamanoCampo:integer;
//    k:Integer;
begin
  with TMedidas do
  begin
    Active := false;
//    DatabaseName := 'Temp';
    DatabaseName := GetTemporalPath;
    TableType := ttParadox;
    TableName := 'TEMPMEDIDASMTTO';
    with FieldDefs do
    begin
      Clear;
      Add('CODIGOVALORMEDIDA', ftFloat, 0, True);
      //***
//      Add('CODIGOFORMATOMTTODATOS',ftFloat, 0, True);
      //***
      Add('CODIGOSECCIONFORMATODATOS',ftFloat, 0, True);
      Add('FILA', ftFloat, 0, True);
      qColumnaMedida.Close;
      qColumnaMedida.Open;
      while not(qColumnaMedida.eof) do
      begin
        if (qColumnaMedidaTIPODATO.AsString='N')then
        begin
          TipoCampo:=ftFloat;
          tamanoCampo:=0;
        end
        else
        begin
          TipoCampo:=ftString;
          tamanoCampo:=80;
        end;
        Add(qColumnaMedidaNOMBRECOLUMNAMEDIDA.AsString, TipoCampo, TamanoCampo, False);
        qColumnaMedida.next;
      end;
    end;
    with IndexDefs do
    begin
      Clear;
      Add('', 'CODIGOVALORMEDIDA', [ixPrimary, ixUnique]);
    end;
    CreateTable;
  end;
  TMedidas.OPEN;
end;

procedure TFSeccionFormatoDatos.CargarTablaTemporalMedidas;
var
  i,j,k,valor,dato: Integer;
  Valores:TStringList;
  query,query1,query2:TQuery;
  col:tcolumn;
begin
  TMedidas.close;
  dbgMedidas.columns.clear;
  qcolumnaMedida.Close;
  qColumnaMedida.Open;
  while not qColumnaMedida.Eof do
  begin
    col:=dbgMedidas.Columns.Add;
    col.Title.caption:=qColumnaMedidaNOMBRECOLUMNAMEDIDA.AsString;
    col.Title.Alignment:=taCenter;
    col.FieldName:=qColumnaMedidaNOMBRECOLUMNAMEDIDA.AsString;
    if qColumnaMedidaCODIGOTIPOVALOR.AsString <>'' then
    begin
      Valores:= TStringList.Create;
      query:=TQuery.Create(Application);
      query.DatabaseName:='BaseDato';
      query.SQL.text:='SELECT CODIGOVALOR FROM HVE_VALORESMEDIDA WHERE CODIGOCOLUMNAMEDIDA='+ qColumnaMedidaCODIGOCOLUMNAMEDIDA.AsString;
      Query.Open;
      while not query.eof do
      begin
        query1:=TQuery.Create(Application);
        query1.DatabaseName:='BaseDato';
        query1.SQL.Text:='SELECT VALOR FROM HVE_VALORES WHERE CODIGOVALOR='+ query.Fields[0].AsString;
        query1.Open;
        Valores.add(query1.fields[0].AsString);
        query1.close;
        query1.free;
        query.Next;
      end;
      col.Picklist:= Valores;
    end;
    qColumnaMedida.next;
  end;
  i:=0;
  j:=0;
  dato:=0;
  CargandoTabla:=true;
  /////*********
  /////*********
  qValorMedida.Close;
  {query1:=TQuery.Create(Application);
  query1.DatabaseName:='BaseDato'; }
  qValorMedida.sql.clear;
  qValorMedida.sql.add('SELECT * FROM HVE_VALORMEDIDA');
  qValorMedida.sql.add('WHERE CODIGOSECCIONFORMATODATOS='+qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString);
  qValorMedida.sql.add('ORDER BY FILA');
  qValorMedida.Open;
  qValorMedida.First;
  ///CON DATOS
  while not(qValorMedida.Eof)  do
  begin
    if TMedidas.Active then
      TMedidas.close;
    TMedidas.Open;
    TMedidas.Insert;
    TMedidas.FieldbyName('CODIGOVALORMEDIDA').AsString:=qValorMedidaCODIGOVALORMEDIDA.AsString;
    TMedidas.FieldbyName('CODIGOSECCIONFORMATODATOS').AsString:=qValorMedidaCODIGOSECCIONFORMATODATOS.AsString;
    TMedidas.FieldbyName('FILA').AsString:=qValorMedidaFILA.AsString;
    qValorMedidaDetalle.Close;
    qValorMedidaDetalle.Open;
    for i := 0 to TMedidas.Fields.Count - 1 do
    begin
      if qColumnaMedida.Locate('nombrecolumnamedida',TMedidas.Fields[i].fieldname,[]) then
      begin
         if (qValorMedidaDetalle.Locate('codigocolumnamedida',qColumnaMedidaCODIGOCOLUMNAMEDIDA.AsString,[])) then
         begin
           TMedidas.Fields[i].AsString:=qValorMedidaDetalleVALOR.AsString;
         end;
      end;
    end;
    TMedidas.Post;
    qValorMedida.Next;
  end;
  CargandoTabla:=false;
end;


procedure TFSeccionFormatoDatos.bbAceptarClick(Sender: TObject);
begin
  EscribirTablaTemporalMedidas;
end;

procedure TFSeccionFormatoDatos.EscribirTablaTemporalMedidas;
var
  i,fila: Integer;
begin
  TMedidas.DatabaseName := GetTemporalPath;
  TMedidas.First;
  fila:=0;
  qColumnaMedida.close;
  qColumnaMedida.open;
  while not TMedidas.eof do
  begin
    qValorMedida.Close;
    qValorMedida.sql.clear;
    qValorMedida.sql.add('SELECT * FROM HVE_VALORMEDIDA');
    qValorMedida.sql.add('WHERE CODIGOVALORMEDIDA='+TMedidas.Fieldbyname('CODIGOVALORMEDIDA').AsString);
    qValorMedida.Open;
    if not(qValorMedida.RecordCount>0) then
    begin
      qValorMedida.Insert;
      inc(fila);
      qValorMedidaFILA.AsInteger:=fila;
      qValorMedida.Post;
      qValorMedida.Edit;
      qValorMedidaDetalle.close;
      qValorMedidaDetalle.open;
    end;
    for i := 0 to TMedidas.Fields.count-1 do
    begin
      if qColumnaMedida.Locate('nombrecolumnamedida',TMedidas.Fields[i].fieldname,[]) then
  //    if qColumnaMedida.Locate('nombrecolumnamedida',TMedidas.Fields[i].name,[]) then
      begin
        if not( qValorMedidaDetalle.Locate('codigocolumnamedida',qColumnaMedidaCODIGOCOLUMNAMEDIDA.AsString,[])) then
        begin
          qValorMedidaDetalle.insert;
          qValorMedidaDetalleCODIGOCOLUMNAMEDIDA.AsString:=qColumnaMedidaCODIGOCOLUMNAMEDIDA.AsString;
        end
        else
          qValorMedidaDetalle.Edit;
        qValorMedidaDetalleVALOR.AsString:=TMedidas.Fields[i].AsString;
      end;
    end;
    TMedidas.Next;
  end;
  qSeccionDatosESTADOTERMINADO.AsString:='SI';
end;

procedure TFSeccionFormatoDatos.qSeccionDatosAfterInsert(
  DataSet: TDataSet);
var qDatos:TQuery;
begin
  RefrescarVariables;
  qDatos:=TQuery.Create(self);
  qDatos.DatabaseName:='BaseDato';
  qDatos.sql.text:='SELECT SQ_HVESECCION.NEXTVAL FROM DUAL';
  qDatos.Open;
  qSeccionDatos.Open;
  qFormatoDatos.Open;
  qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString:=qDatos.Fields[0].AsString;
  qSeccionDatosCODIGOFORMATOMTTODATOS.AsString:=qFormatoDatosCODIGOFORMATOMTTODATOS.AsString;
  qSeccionDatosFECHAREGISTRO.AsString:= DateTimeToStr(Now);
  qDatos.SQL.Clear;
  qDatos.close;
  qDatos.sql.text:='SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+ inttostr(VarCodigoUsuario);
  qDatos.open;
  qSeccionDatosNombreUsuarioCreacion.asstring:=qDatos.fields[0].asstring;
  qSeccionDatosCODIGOUSUARIOCREACION.AsFloat:= VarCodigoUsuario;
  qDatos.Free;

end;

procedure TFSeccionFormatoDatos.qValorMedidaAfterInsert(DataSet: TDataSet);
 var qDatos:TQuery;
Begin
  qDatos:=TQuery.Create(self);
  qDatos.DatabaseName:='BaseDato';
  qDatos.sql.text:='SELECT SQ_HVEMEDIDA.NEXTVAL FROM DUAL';
  qDatos.Open;
  qValorMedidaCODIGOVALORMEDIDA.AsString:=qDatos.Fields[0].AsString;
  qValorMedidaCODIGOSECCIONFORMATODATOS.AsString:=TMedidas.FieldbyName('CODIGOSECCIONFORMATODATOS').AsString;
  qDatos.Free;
end;

procedure TFSeccionFormatoDatos.qValorMedidaDetalleAfterInsert(DataSet:TDataSet);
 var qDatos:TQuery;
Begin
  qDatos:=TQuery.Create(self);
  qDatos.DatabaseName:='BaseDato';
  qDatos.sql.text:='SELECT SQ_HVEMEDIDADETALLE.NEXTVAL FROM DUAL';
  qDatos.Open;
  qValorMedidaDetalleCODIGOVALORMEDIDADETALLE.AsString:=qDatos.Fields[0].AsString;
  qValorMedidaDetalleCODIGOVALORMEDIDA.AsString:=qValorMedidaCODIGOVALORMEDIDA.AsString;
  qDatos.Free;
  qValorMedidaDetalleCODIGOVALORMEDIDA.AsString:=qValorMedidaCODIGOVALORMEDIDA.AsString;
end;

procedure TFSeccionFormatoDatos.qSeccionDatosCODIGOSECCIONFORMATOChange(
  Sender: TField);
var
 qEliminarEncabezados:tquery;
 i,j,k,valor,dato: Integer;
 Valores:TStringList;
 query,query1,query2:TQuery;
 col:tcolumn;
begin
  if (qValorMedida.RecordCount>0) then
    raise Exception.create('No se puede modificar el código de sección');
  // crea encabezados de sección
  if qSeccionDatosCODIGOSECCIONFORMATO.AsString<>'' then
  begin
    DBLCBSeccion.Enabled:=False;
    qEliminarEncabezados:=TQuery.Create(Application);
    qEliminarEncabezados.DatabaseName:='BaseDato';
    qEliminarEncabezados.sql.text:='DELETE FROM HVE_ENCABEZADOSECCIONDATOS WHERE CODIGOSECCIONFORMATODATOS='+qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
    qEliminarEncabezados.ExecSQL;
    qEliminarEncabezados.free;
    qEncabezadoSeccion.close;
    qEncabezadoSeccion.open;
    while (not qEncabezadoSeccion.eof) do
    begin
      qEncabezadoSeccionDatos.Insert;
      qEncabezadoSeccionDatosCODIGOSECCIONFORMATODATOS.AsString:=qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
      qEncabezadoSeccionDatosCODIGOENCABEZADOSECCION.AsString:=qEncabezadoSeccionCODIGOENCABEZADOSECCION.AsString;
      qEncabezadoSeccionDatos.Post;
      qEncabezadoSeccion.next;
    end;
  end;
  qEncabezadoSeccionDatos.close;
  qEncabezadoSeccionDatos.open;

  // crea tablas temporales de medidas
  CrearTablaTemporalMedidas;
  CargarTablaTemporalMedidas;//ESTABA
  qValorMedida.Close;
  qValorMedida.Open;
  qValorMedida.First;
  // llena los combos de valores posibles de medidas
  query1:=TQuery.Create(Application);
  query1.DatabaseName:='BaseDato';
  i:=0;
  j:=0;
  qcolumnaMedida.Close;
  qColumnaMedida.Open;
  k:=3;
  dbgMedidas.columns.clear;
  while not qColumnaMedida.Eof do
  begin
    col:=dbgMedidas.Columns.Add;
    col.Title.caption:=qColumnaMedidaNOMBRECOLUMNAMEDIDA.AsString;
    col.Title.Alignment:=taCenter;
    col.FieldName:=qColumnaMedidaNOMBRECOLUMNAMEDIDA.AsString;
    if qColumnaMedidaCODIGOTIPOVALOR.AsString <>'' then
    begin
      Valores:= TStringList.Create;
      query:=TQuery.Create(Application);
      query.DatabaseName:='BaseDato';
      query.SQL.text:='SELECT CODIGOVALOR FROM HVE_VALORESMEDIDA WHERE CODIGOCOLUMNAMEDIDA='+ qColumnaMedidaCODIGOCOLUMNAMEDIDA.AsString;
      Query.Open;
      while not query.eof do
      begin
        query1.SQL.Text:='SELECT VALOR FROM HVE_VALORES WHERE CODIGOVALOR='+ query.Fields[0].AsString;
        query1.Open;
        Valores.add(query1.fields[0].AsString);
        query.Next;
      end;
      dbgMedidas.Columns[k].Picklist:= Valores;
    end;
    inc(k);
    qColumnaMedida.Next;
  end;
end;

procedure TFSeccionFormatoDatos.qEncabezadoSeccionDatosAfterInsert(
  DataSet: TDataSet);
var query:tquery;
begin
  query:=TQuery.create(Application);
  query.DatabaseName:='BaseDato';
  query.sql.text:='SELECT SQ_HVEENCABEZADOSECCION.NEXTVAL FROM DUAL';
  query.open;
  DataSet.fieldbyname('CODIGOENCABEZADOSECCIONDATOS').asstring:=query.Fields[0].Asstring;
  query.close;
  query.free;
end;

procedure TFSeccionFormatoDatos.qEncabezadoSeccionDatosCalcFields(
  DataSet: TDataSet);
var query:tquery;
begin
  if (DataSet.State <>dsinsert) then
  begin
    if Dataset.FieldByName('CODIGOENCABEZADOSECCION').AsString<>'' then
    begin
      query:=TQuery.create(Application);
      query.DatabaseName:='BaseDato';
      query.sql.text:='SELECT NOMBRECAMPO FROM HVE_ENCABEZADOSECCION WHERE CODIGOENCABEZADOSECCION ='+Dataset.FieldByName('CODIGOENCABEZADOSECCION').AsString;
      query.open;
      Dataset.FieldByName('NOMBRECAMPO').AsString:=query.Fields[0].AsString;
      query.free;
    end;
  end;
end;

procedure TFSeccionFormatoDatos.qSeccionDatosAfterPost(DataSet: TDataSet);
begin
  qSeccionDatos.ApplyUpdates;
  qSeccionDatos.CommitUpdates;
end;

procedure TFSeccionFormatoDatos.qSeccionDatosAfterDelete(
  DataSet: TDataSet);
begin
  qSeccionDatos.ApplyUpdates;
  qSeccionDatos.CommitUpdates;
end;

procedure TFSeccionFormatoDatos.qFormatoDatosAfterDelete(
  DataSet: TDataSet);
begin
  qFormatoDatos.ApplyUpdates;
  qFormatoDatos.CommitUpdates;
end;

procedure TFSeccionFormatoDatos.qFormatoDatosAfterPost(DataSet: TDataSet);
begin
  qFormatoDatos.ApplyUpdates;
  qFormatoDatos.CommitUpdates;
end;

procedure TFSeccionFormatoDatos.qEncabezadoSeccionDatosAfterPost(
  DataSet: TDataSet);
begin
  qEncabezadoSeccionDatos.ApplyUpdates;
  qEncabezadoSeccionDatos.CommitUpdates;
end;

procedure TFSeccionFormatoDatos.qEncabezadoSeccionDatosAfterDelete(
  DataSet: TDataSet);
begin
  qEncabezadoSeccionDatos.ApplyUpdates;
  qEncabezadoSeccionDatos.CommitUpdates;
end;

procedure TFSeccionFormatoDatos.qEncabezadoSeccionAfterDelete(
  DataSet: TDataSet);
begin
  qEncabezadoSeccion.ApplyUpdates;
  qEncabezadoSeccion.CommitUpdates;
end;

procedure TFSeccionFormatoDatos.qEncabezadoSeccionAfterPost(
  DataSet: TDataSet);
begin
  qEncabezadoSeccion.ApplyUpdates;
  qEncabezadoSeccion.CommitUpdates;
end;

procedure TFSeccionFormatoDatos.qColumnaMedidaAfterPost(DataSet: TDataSet);
begin
     qColumnaMedida.ApplyUpdates;
     qColumnaMedida.CommitUpdates;
end;

procedure TFSeccionFormatoDatos.qColumnaMedidaAfterDelete(
  DataSet: TDataSet);
begin
  qColumnaMedida.ApplyUpdates;
  qColumnaMedida.CommitUpdates;
end;

procedure TFSeccionFormatoDatos.qValorMedidaAfterDelete(DataSet: TDataSet);
begin
  qValorMedida.ApplyUpdates;
  qValorMedida.CommitUpdates;
end;

procedure TFSeccionFormatoDatos.qValorMedidaAfterPost(DataSet: TDataSet);
begin
  qValorMedida.ApplyUpdates;
  qValorMedida.CommitUpdates;
end;

procedure TFSeccionFormatoDatos.qValorMedidaDetalleAfterDelete(
  DataSet: TDataSet);
begin
  qValorMedidaDetalle.ApplyUpdates;
  qValorMedidaDetalle.CommitUpdates;
end;

procedure TFSeccionFormatoDatos.qValorMedidaDetalleAfterPost(
  DataSet: TDataSet);
begin
  qValorMedidaDetalle.ApplyUpdates;
  qValorMedidaDetalle.CommitUpdates;
end;

procedure TFSeccionFormatoDatos.qSeccionAfterDelete(DataSet: TDataSet);
begin
  qSeccion.ApplyUpdates;
  qSeccion.CommitUpdates;
end;

procedure TFSeccionFormatoDatos.qSeccionAfterPost(DataSet: TDataSet);
begin
  qSeccion.ApplyUpdates;
  qSeccion.CommitUpdates;
end;

procedure TFSeccionFormatoDatos.qSeccionDatosBeforeInsert(
  DataSet: TDataSet);
begin
   qSeccionDatos.close;
   qSeccionDatos.Open;
end;

procedure TFSeccionFormatoDatos.TMedidasAfterInsert(DataSet: TDataSet);
var qDatos:TQuery;

begin
  if not CargandoTabla then
  begin
    qDatos:=TQuery.Create(self);
    qDatos.DatabaseName:='BaseDato';
    qDatos.sql.text:='SELECT SQ_HVEMEDIDA.NEXTVAL FROM DUAL';
    qDatos.Open;
    Dataset.FieldByName('CODIGOVALORMEDIDA').AsString:=qDatos.Fields[0].AsString;
    Dataset.FieldByName('CODIGOSECCIONFORMATODATOS').AsString:=qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
    qDatos.SQL.clear;
    Dataset.FieldByName('FILA').AsString:='1';
    qDatos.Free;
  end;
end;

procedure TFSeccionFormatoDatos.FormCreate(Sender: TObject);
begin
  CargandoTabla:=true;
end;

procedure TFSeccionFormatoDatos.bAceptarClick(Sender: TObject);
begin
  close;
  ModalResult:=MrOk;
end;

procedure TFSeccionFormatoDatos.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
if updSeccionDatos = nil then
begin
  Action:=cafree;
end
else
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
        qSeccionDatos.Cancel;
        qSeccionDatos.CancelUpdates;
        Action:=caFree;
      end;
    end
    else
      if ModalResult <> MrCancel then
      begin
        ModalResult := mrOK;
        Action:=caFree;
      end;
    end;
    if ModalResult=2 then
    begin
      try
        qSeccionDatos.Cancel;
        qSeccionDatos.CancelUpdates;
        Action:=caFree;
      except
      end;
    end;
end;
end;

procedure TFSeccionFormatoDatos.bCancelarClick(Sender: TObject);
begin
  ModalResult:=MrCancel;
  Close;
end;

procedure TFSeccionFormatoDatos.BBtnImprimirClick(Sender: TObject);
begin
{  Application.ProcessMessages;
  FQREquipo := TFQREquipo.create(Application);

  FQREquipo.QRLBNombreFormato.Caption:= qNombreFormatoNOMBREFORMATOMTTO.AsString;
  FQREquipo.QRLbNombreSeccion.Caption:=DBLCBSeccion.TEXT;

  //Ambito
  FQREquipo.QRLbAmbito.Caption:=fHojaVidaEquipo.DBLCBAmbito.text;

//Coordinacion NO ESTA EN HOJA DE VIDA
//  FQREquipo.QRLbCoordinacion.Caption:= fHojaVidaEquipo

//TIPO MANTENIMIENTO //NO ESTA EN HOJA DE VIDA
//  FQREquipo.QRLbTipoMtto.Caption:= fHojaVidaEquipo.dblc

  //Subestacion
  FQREquipo.QRLbSubestacion.Caption:=fHojaVidaEquipo.DBLCBSubestacion.text;
  //TIPO ELEMENTO
  FQREquipo.QRLbTipoElemento.Caption:= fHojaVidaEquipo.DBLCBTipoElemento.text;

  if (fHojaVidaEquipo.DBLCBAmbito.text ='SUBESTACION') then
  begin
    FQREquipo.QRLbCircuito.Caption:='';
    FQREquipo.QRLbNombreCircuito.Caption:='';
  end
  else
  begin
    FQREquipo.QRLbCircuito.Caption:=fHojaVidaEquipo.Circuito.Text;
  end;
  //ELEMENTO
  FQREquipo.QRLbElemento.Caption := fHojaVidaEquipo.cbElemento.text;

 //FECHA IMPRESIÓN
  FQREquipo.QRLBFecha.Caption := DateTimeToStr(Now);
  GenerarEncabezado;
  GenerarEncabezadoSeccion;
  GenerarDatos;
  FQREquipo.QRFormatoEquipo.Preview; }
end;

procedure TFSeccionFormatoDatos.AjustarQRLabel(var qrLabel:TQRLabel);
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
  qrLabel.Alignment:= taCenter;
  qrLabel.Font.Style:=[fsbold];
end;

procedure TFSeccionFormatoDatos.AjustarQRLabelMedidas(var qrLabel:TQRLabel);
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

procedure TFSeccionFormatoDatos.AjustarQRLabelMedidasDato(var qrLabelDato:TQRLabel);
var
heightMedida,sizeMedida:Integer;
begin
  heightMedida:=12;
  sizeMedida:=7;
  qrLabelDato.AutoSize:=true;
  qrLabelDato.WordWrap := False;
  qrLabelDato.Height := heightMedida;
  qrLabelDato.Font.Size := sizeMedida;
  qrLabelDato.Font.Name := 'Arial';
  qrLabelDato.Alignment:= taCenter;
end;

procedure TFSeccionFormatoDatos.GenerarEncabezado;
var
 qrLabel,qrLabelDato:TQRLabel;
 I,top,left,width,space,lineheight,topspace:Integer;
begin
  I:=0;
  top := 35;
  left:=150;
  width:=200;
  space:=15;
  topspace:=17;
  lineheight:=25;
  if qEncabezadoDatos.Active then
   qEncabezadoDatos.close;
  qEncabezadoDatos.Open;
  while not qEncabezadoDatos.eof do
    begin
      qrLabel := TQRLabel.Create(FQREquipo.QREquipo);
      qrLabelDato := TQRLabel.Create(FQREquipo.QREquipo);
      AjustarQRLabel(qrLabel);

      // Encabezado Formato
      qrLabel.Top := top + I*topspace;
      qrLabel.Left := left;
      qrLabel.Width := width;
      qrLabel.Parent := FQREquipo.QREquipo;
      qrLabel.Caption := qEncabezadoDatos.FieldByName('NOMBRECAMPO').AsString;

      //Datos Encabezado
      qrLabelDato.Top := top + I*topspace;
      qrLabelDato.Left := left + width + space;
      qrLabelDato.Width:= width;
      qrLabelDato.Height := lineheight;
      qrLabelDato.Parent :=FQREquipo.QREquipo;
      qrLabelDato.Caption := qEncabezadoDatos.FieldByName('VALORENCABEZADOFORMATO').AsString;
      FQREquipo.QREquipo.Height:=qrLabel.Top + space;
      inc(i);
      qEncabezadoDatos.next;
    end;
end;

procedure TFSeccionFormatoDatos.GenerarEncabezadoSeccion;
var
 qrLabel,qrlabelDato:TQRLabel;
 I,top,left,width,space,lineheight,topspace:Integer;

 begin
  I:=0;
  top := 40;
  left:=150;
  width:=200;
  space:=15;
  topspace:=17;
  lineheight:=25;

  if qEncabezadoSeccionDatos.Active then
    qEncabezadoSeccionDatos.close;
  qEncabezadoSeccionDatos.Open;

  if qEncabezadoSeccionDatos.RecordCount=0 then
    FQREquipo.QRSeccion.Height:=45
  else
  begin
    while not qEncabezadoSeccionDatos.eof do
    begin
      qrLabel := TQRLabel.Create(FQREquipo.QRSeccion);
      qrlabeldato := TQRLabel.Create(FQREquipo.QRSeccion);
      qrLabel := TQRLabel.Create(FQREquipo.QRSeccion);
      AjustarQRLabel(qrLabel);

      //Encabezado Seccion
      qrLabel.Top := top + I*topspace;
      qrLabel.Left := left;
      qrLabel.Width := width;
      qrLabel.Parent := FQREquipo.QRSeccion;
      qrLabel.Caption := qEncabezadoSeccionDatos.FieldByName('NOMBRECAMPO').AsString;

      //Datos Encabezado Seccion
      qrLabelDato.Top := top + I*topspace;
      qrLabelDato.Left := left + width + space;
      qrLabelDato.Width:= width;
      qrLabelDato.Height := lineheight;
      qrLabelDato.Parent := FQREquipo.QRSeccion;
      qrLabelDato.Caption := qEncabezadoSeccionDatos.FieldByName('VALORENCABEZADOSECCION').AsString;
      FQREquipo.QRSeccion.Height:=qrLabel.Top + space;
      inc(i);
      qEncabezadoSeccionDatos.next;
    end;
  end;
end;

procedure TFSeccionFormatoDatos.GenerarDatos;
var
 qMedidas:TQuery;
 qrlabelDato:TQRLabel;
 wordsD, temp: array of integer;
 I,h,medidasspace,a,j,k,f,m,p,n,s,t,leftrect,width1,widthDato1,width2,widthDato2,dato,top,rectangletop,left,rectangleleft,width,widthDato,height,size,space,lineheight,topspace,lineleft:Integer;
 widthM, widthM1, widthM2,tempo :Integer;
begin
  qMedidas:=Tquery.Create(Application);
  qMedidas.databaseName:='BaseDato';
  a:=0;
//  m:=0;
  p:=0;
  n:=0;
  I:=0;
  f:=1;
  j:=0;
//  k:=0;
  s:=1;
  t:=1;
  tempo:=0;
  lineheight:=25;
  left:= 12;
//  left:= 10;
  space:=5;
  top := 40;
  topspace:=17;
  rectangletop :=35;
  rectangleleft:=5;
  lineleft:=12;
//  lineleft:=10;
  width:=0;
  width2:=0;
  widthDato:=0;
  widthDato1:=0;
  widthDato2:=0;
  widthM:=0;
  widthM1:=0;
  widthM2:=0;


  qrShape := TQRShape.Create(FQREquipo.QRMedida);
  qrShape.Shape := qrsRectangle;
  qrShape.Top := rectangletop;

  qrShape.Left := rectangleleft-1;
  qrShape.Width:= 1200;
  qrShape.Height := lineheight;
  qrShape.Parent := FQREquipo.QRMedida;

  /////////LLENAR DATOS
  if TMedidas.Active then
   TMedidas.Close;
  TMedidas.Open;
  m:=TMedidas.recordcount;
  SetLength(words,(TMedidas.FieldDefs.Count*m)); //MEDIDAS1
  SetLength(wordsD,(TMedidas.FieldDefs.Count*m)); //MEDIDAS2
//  SetLength(temp,(TMedidas.FieldDefs.Count*m)); //TEMP
  SetLength(temp,(TMedidas.FieldDefs.Count)); //TEMP

  while not TMedidas.Eof do
  begin
//    showmessage('entra a llenar datos');
    for h:=3 to TMedidas.FieldDefs.Count - 1 do
    begin
      //MEDIDAS1
      if (t=1) then
      begin
        qrLabel := TQRLabel.Create(FQREquipo.QRMedida);
        AjustarQRLabelMedidas(qrLabel);
        qrLabel.Top := top;
        qrLabel.Parent := FQREquipo.QRMedida;
        qrlabel.Caption:=TMedidas.Fields[h].fieldname;
        words[i]:= qrLabel.Width;
        width := width + qrlabel.Width;
      end;
      ////
      // Vertical
      qrShapeLine := TQRShape.Create(FQREquipo.QRMedida);
      qrShapeLine.Shape:=qrsVertLine;
      qrShapeLine.Height:=lineheight;
      qrShapeLine.Width:=1;
      qrShapeLine.Top:= rectangletop;
      qrShapeLine.parent := FQREquipo.QRMedida;
      if (h=3) then
      begin
        qrShapeLine.Left:=2;
//        qrShapeLine.Left:=0;
//        qrShapeLine.Height:= qrShapeLine.Height + lineheight*(s-2) + 2;
        qrShapeLine.Height:= qrShapeLine.Height + lineheight*(s-1) + 2;
      end;
      //MEDIDAS2
      qrlabelDato := TQRLabel.Create(FQREquipo.QRMedida);
      AjustarQRLabelMedidasDato(qrlabelDato);
      qrlabelDato.Parent := FQREquipo.QRMedida;
      qrlabelDato.Caption:= TMedidas.Fields[h].AsString;

      IF (T<2)THEN
      BEGIN
        if (t=1)then
        begin
        qrlabelDato.Top := Top + lineheight;
        end
        else
        begin
          qrlabelDato.Top := Top + lineheight*f;
        end;
      //
        wordsD[i]:= qrLabelDato.Width;
        if (wordsD[i] > words[i]) then
        begin
//          if(wordsD[i]< 200) then
          if(wordsD[i]< 350) then
          begin
            widthM := widthM + wordsD[i];
          end
          else
          begin
            widthM := widthM + 350;
            //truncar acá
//            widthM := widthM + 200;
          end;
        end
        else
        begin
          widthM := widthM + words[i];
        end;

        if (j=0)then
        begin
          qrLabel.Left:=left;
          width1:= width;
          qrlabelDato.Left:=left;
          widthM1:= widthM;
          temp[tempo]:= Left;
        end
        else
        begin
          if(j=1)then
          begin
            if (wordsD[i-1] > words[i-1]) then
            begin
              if(wordsD[i-1]< 350) then
              begin
                widthM2 := widthM2 + wordsD[i-1]+ 20;
                //MEDIDAS 1
                width2:= width2 + wordsD[i-1]+ 20;
              end
              else
              begin
                widthM2 := widthM2 + 350 + 20;
//                widthM2 := widthM2 + 200 + 20;
                //MEDIDAS 1
                width2:= width2 + 350 + 20;
//                width2:= width2 + 200 + 20;
              end;
            end
            else
            begin
              widthM2 := widthM2 + words[i-1] + 20;
              //MEDIDAS 1
              width2:= width2 + words[i-1] + 20;
            end;
            temp[tempo]:= qrlabelDato.Left + widthM2;
            qrlabelDato.Left:= qrlabelDato.Left + widthM2;
            qrLabel.Left:= qrLabel.Left + widthM2;
//            temp[i]:=qrlabelDato.Left;
//            showmessage('valor de t'+ inttostr(t));
//            showmessage('temp['+ inttostr(tempo) + ']' + inttostr(temp[tempo]));
          end;
        end;
        if (t=1) then
        begin
          qrShapeLine.Left:=lineleft;
          leftrect:= qrShapeLine.Left;
          qrShapeLine.Left:= qrShapeLine.Left + WidthM + a*19;
          n:=qrShapeLine.Left;
        end
        else
        begin
          n:= n + WidthM + (a-1)*19;
        end;

        if (m < 10) then
        begin
         s:=11
        end
        else
        begin
         s:= m
        end;
        qrShapeLine.Height:= qrShapeLine.Height + lineheight*(s-1);
      end
      else
      begin
        qrlabelDato.Top := Top + lineheight*f;
        qrlabelDato.Left:= temp[tempo];
      end;
      j:=1;
      inc(i);
      inc(tempo);
      inc(a);
    end;
    inc(f);
    inc(t);
    width:=0;
    widthM:=0;
    width1:=0;
    widthM1:=0;
    width2:=0;
    widthM2:=0;
    a:=0;
    tempo:=0;
    TMedidas.Next;
    qrShape.Width:= qrShapeLine.Left - rectangleleft;
  end;
  //Linea Horizontal
    for k:=0 to s do
    begin
      qrShapeRectangle:=TQRShape.Create(FQREquipo.QRMedida);
      qrShapeRectangle.Shape:= qrsHorLine;
      qrShapeRectangle.Left:=lineleft-5;
      qrShapeRectangle.Height:= 1 ;
      qrShapeRectangle.Width:= n - rectangleleft -3;
      qrShapeRectangle.Top:= rectangletop + k*lineheight;
      qrShapeRectangle.parent:=FQREquipo.QRMedida;
    end;
    qMedidas.Free;
end;

procedure TFSeccionFormatoDatos.FloatField2Change(Sender: TField);
begin
  qNombreFormato.Close;
  qNombreFormato.Open;
end;

procedure TFSeccionFormatoDatos.qEncabezadoDatosCalcFields(
  DataSet: TDataSet);
  var query:tquery;
begin
    qEncabezadoDatos.open;
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
procedure TFSeccionFormatoDatos.qValorMedidaDetalleCalcFields(
  DataSet: TDataSet);
var query:tquery;
begin
    qValorMedidaDetalle.open;
    if qValorMedidaDetalleCODIGOCOLUMNAMEDIDA.AsString<>'' then
  begin
    query:=TQuery.create(Application);
    query.DatabaseName:='BaseDato';
    query.sql.text:='SELECT NOMBRECOLUMNAMEDIDA FROM HVE_COLUMNAMEDIDA WHERE CODIGOCOLUMNAMEDIDA ='+qValorMedidaDetalleCODIGOCOLUMNAMEDIDA.AsString;
    query.open;
    qValorMedidaDetalleNombreColumnaMedida.AsString:=query.Fields[0].AsString;
    query.free;
  end;
end;

procedure TFSeccionFormatoDatos.qSeccionDatosCODIGOUSUARIOCREACIONValidate(
  Sender: TField);
var qusuario:tquery;
begin
  RefrescarVariables;
  qusuario:=TQuery.create(application);
  qusuario.databasename:='BaseDato';

  if qSeccionDatosCODIGOUSUARIOCREACION.AsString ='' then
   begin
      if qusuario.Active then
        qusuario.Close;
      qusuario.sql.text:='SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+ inttostr(varcodigousuario);
      qusuario.Open;
      qSeccionDatosCODIGOUSUARIOCREACION.AsFloat:=VarCodigoUsuario;
      Edit4.Text:=qusuario.Fields[0].AsString;
   end;
   qusuario.Free;
end;

procedure TFSeccionFormatoDatos.qSeccionDatosCalcFields(DataSet: TDataSet);
var qusuario:tquery;
begin
  qusuario:=TQuery.create(application);
  qusuario.databasename:='BaseDato';

  if qSeccionDatosCODIGOUSUARIOMODIFICACION.AsString<>'' then
  begin
    qusuario.close;
    qusuario.sql.text:='SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+qSeccionDatosCODIGOUSUARIOMODIFICACION.AsString;
    qusuario.open;
    qSeccionDatosNombreUsuarioModificacion.asstring:=qusuario.fields[0].asstring;
  end;
  qusuario.free;
end;

procedure TFSeccionFormatoDatos.qSeccionDatosBeforePost(DataSet: TDataSet);
begin
  RefrescarVariables;
  qSeccionDatosFECHAMODIFICACION.AsString:=DateTimeToStr(Now);
  qSeccionDatosCODIGOUSUARIOMODIFICACION.AsInteger:= varcodigousuario;
end;

procedure TFSeccionFormatoDatos.sbFechaPruebaClick(Sender: TObject);
begin
  DBEFechaPrueba.Setfocus;
  sFecha := DBEFechaPrueba.Text;
  Fecha := GetFecha(False);
  if Fecha <> '' then DBEFechaPrueba.Text := Fecha;
end;

function TFSeccionFormatoDatos.GetFecha(Tipo:Boolean): String;
begin
  fFormaFecha := TfFormaFecha.Create(Application);
  uFormaFecha.sFecha := sFecha;
  fFormaFecha.height:=291;
  if FFormaFecha.ShowModal = mrOk then
    if Tipo then
       Result := DateTimetoStr(FFormaFecha.Date+FFormaFecha.fTime)
    else
       Result := DateTimetoStr(FFormaFecha.Date)
  else Result := sFecha;
  fFormaFecha.Free;
end;

procedure TFSeccionFormatoDatos.DBEFechaPruebaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 inherited;
  case Key of
    VK_F3 : sbFechaPruebaClick(nil);
  end;
end;

end.






 