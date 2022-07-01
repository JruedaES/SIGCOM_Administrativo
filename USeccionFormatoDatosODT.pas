unit USeccionFormatoDatosODT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Grids, DBGrids, RXDBCtrl, ComCtrls, ExtCtrls, ToolEdit,
  StdCtrls, Mask, DBCtrls, Buttons,QuickRpt,Qrctrls ;

type
  TFSeccionFormatoDatosODT = class(TForm)
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    dbgmedidas: TRxDBGrid;
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
    qFormatoDatosCLELEMENTO1: TStringField;
    qFormatoDatosCLELEMENTO2: TStringField;
    qFormatoDatosCODIGOODT: TFloatField;
    qFormatoDatosCONSECUTIVOODT: TFloatField;
    Label8: TLabel;
    qSubactividad: TQuery;
    dsSubactividad: TDataSource;
    qSeccionDatosNombreSubactividad: TStringField;
    qSubactividadCODIGOSUBACTIVIDADAREAODT: TFloatField;
    qSubactividadCODIGOACTIVIDADAREAODT: TFloatField;
    qSubactividadNOMBRESUBACTIVIDADAREAODT: TStringField;
    Edit4: TEdit;
    qColumnaMedida: TQuery;
    qColumnaMedidaCODIGOCOLUMNAMEDIDA: TFloatField;
    qColumnaMedidaCODIGOSECCIONFORMATO: TFloatField;
    qColumnaMedidaNOMBRECOLUMNAMEDIDA: TStringField;
    qColumnaMedidaCODIGOTIPOCOLUMNAMEDIDA: TStringField;
    qColumnaMedidaCONSECUTIVOMEDIDASECCION: TFloatField;
    qColumnaMedidaTIPODATO: TStringField;
    qColumnaMedidaCODIGOUNIDADMEDIDAMTTO: TFloatField;
    qColumnaMedidaCODIGOTIPOVALOR: TFloatField;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    EFormato: TEdit;
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
    procedure FloatField2Change(Sender: TField);
    procedure qEncabezadoDatosCalcFields(DataSet: TDataSet);
    procedure qValorMedidaDetalleCalcFields(DataSet: TDataSet);
    procedure qSeccionDatosCalcFields(DataSet: TDataSet);
    procedure qSeccionDatosCODIGOUSUARIOCREACIONValidate(Sender: TField);
    procedure qSeccionDatosBeforePost(DataSet: TDataSet);
    procedure sbFechaPruebaClick(Sender: TObject);
    procedure DBEFechaPruebaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qSeccionDatosAfterOpen(DataSet: TDataSet);

  private
    CargandoTabla:boolean;
  public
    bDatosIncompletos, bCancelando: Boolean;
    words: array of integer;
    qrLabel:TQRLabel;
    qrShape:TQRShape;
    qrShapeLine:TQRShape;
    qrshapeVerLine:TQRShape;
    qrShapeRectangle:TQRShape;
    sFecha, Fecha:string;
    function GetFecha(Tipo:Boolean): String;

    procedure CrearTablaTemporalMedidas;
    procedure CargarTablaTemporalMedidas;
    procedure EscribirTablaTemporalMedidas;
    procedure AgregarEncabezadosSeccion;
  end;
var
  FSeccionFormatoDatosODT: TFSeccionFormatoDatosODT;

implementation

uses uListaFormatoMantenimiento, uQREquipo, uHojaVidaEquipo, ConsDll,
  uFormaFecha, uODTUrbanaRural, UFormatoMttoDatosODT, uFuncionSGD;
{$R *.DFM}

procedure TFSeccionFormatoDatosODT.CrearTablaTemporalMedidas;
var TipoCampo:TFieldType;
    TamanoCampo:integer;

begin
  with TMedidas do
  begin
    Active := false;
    DatabaseName := GetTemporalPath;
    TableType := ttParadox;
    TableName := 'TEMPMEDIDASMTTO';
    qColumnaMedida.Close;
    qColumnaMedida.Open;
//    if qColumnaMedida.RecordCount>0 then
//    begin
      with FieldDefs do
      begin
        Clear;
        Add('CODIGOVALORMEDIDA', ftFloat, 0, True);
        Add('CODIGOSECCIONFORMATODATOS',ftFloat, 0, True);
        Add('FILA', ftFloat, 0, True);
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
 //   end;
    CreateTable;
  end;
  TMedidas.OPEN;
end;

procedure TFSeccionFormatoDatosODT.CargarTablaTemporalMedidas;
var
  i,j,k,valor,dato: Integer;
  Valores:TStringList;
  query,query1,query2:TQuery;
  col:tcolumn;
begin
  qSeccionDatos.open;
  TMedidas.close;
  dbgMedidas.columns.clear;
  qcolumnaMedida.Close;
  qColumnaMedida.Open;
  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  query1:=TQuery.Create(Application);
  query1.DatabaseName:='BaseDato';
  while not qColumnaMedida.Eof do
  begin
    col:=dbgMedidas.Columns.Add;
    col.Title.caption:=qColumnaMedidaNOMBRECOLUMNAMEDIDA.AsString;
    col.Title.Alignment:=taCenter;
    col.FieldName:=qColumnaMedidaNOMBRECOLUMNAMEDIDA.AsString;
    col.Width:=length(col.FieldName)*10;
    if qColumnaMedidaCODIGOTIPOVALOR.AsString <>'' then
    begin
      Valores:= TStringList.Create;

      query.SQL.text:='SELECT CODIGOVALOR FROM HVE_VALORESMEDIDA WHERE CODIGOCOLUMNAMEDIDA='+ qColumnaMedidaCODIGOCOLUMNAMEDIDA.AsString;
      Query.Open;
      while not query.eof do
      begin
        query1.SQL.Text:='SELECT VALOR FROM HVE_VALORES WHERE ACTIVO = ''S'' AND CODIGOVALOR='+ query.Fields[0].AsString;
        query1.Open;
        Valores.add(query1.fields[0].AsString);
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

  qValorMedida.sql.clear;
  qValorMedida.sql.add('SELECT * FROM HVE_VALORMEDIDA');
  qValorMedida.sql.add('WHERE CODIGOSECCIONFORMATODATOS='+qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString);
  qValorMedida.sql.add('ORDER BY FILA');

  qValorMedida.Open;
  qValorMedida.First;
  TMedidas.Open;
  ///CON DATOS
  while not(qValorMedida.Eof)  do
  begin

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

procedure TFSeccionFormatoDatosODT.bbAceptarClick(Sender: TObject);
begin
  EscribirTablaTemporalMedidas;
end;

procedure TFSeccionFormatoDatosODT.EscribirTablaTemporalMedidas;
var
  i,fila: Integer;
begin
//  TMedidas.DatabaseName := 'Temp';
  TMedidas.DatabaseName := getTemporalPath;
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
        // if qColumnaMedida.Locate('nombrecolumnamedida',TMedidas.Fields[i].name,[]) then
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

procedure TFSeccionFormatoDatosODT.qSeccionDatosAfterInsert(
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

procedure TFSeccionFormatoDatosODT.qValorMedidaAfterInsert(DataSet: TDataSet);
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

procedure TFSeccionFormatoDatosODT.qValorMedidaDetalleAfterInsert(DataSet:TDataSet);
 var qDatos:TQuery;
Begin
  // SHOWMESSAGE('7 qValorMedidaDetalleAfterInsert' );
  qDatos:=TQuery.Create(self);
  qDatos.DatabaseName:='BaseDato';
  qDatos.sql.text:='SELECT SQ_HVEMEDIDADETALLE.NEXTVAL FROM DUAL';
  qDatos.Open;
  qValorMedidaDetalleCODIGOVALORMEDIDADETALLE.AsString:=qDatos.Fields[0].AsString;
  qValorMedidaDetalleCODIGOVALORMEDIDA.AsString:=qValorMedidaCODIGOVALORMEDIDA.AsString;
  qDatos.Free;
  qValorMedidaDetalleCODIGOVALORMEDIDA.AsString:=qValorMedidaCODIGOVALORMEDIDA.AsString;
end;

procedure TFSeccionFormatoDatosODT.qSeccionDatosCODIGOSECCIONFORMATOChange(
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

procedure TFSeccionFormatoDatosODT.qEncabezadoSeccionDatosAfterInsert(
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

procedure TFSeccionFormatoDatosODT.qEncabezadoSeccionDatosCalcFields(
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

procedure TFSeccionFormatoDatosODT.qSeccionDatosAfterPost(DataSet: TDataSet);
begin
  qSeccionDatos.ApplyUpdates;
  qSeccionDatos.CommitUpdates;
end;

procedure TFSeccionFormatoDatosODT.qSeccionDatosAfterDelete(
  DataSet: TDataSet);
begin
  qSeccionDatos.ApplyUpdates;
  qSeccionDatos.CommitUpdates;
end;

procedure TFSeccionFormatoDatosODT.qFormatoDatosAfterDelete(
  DataSet: TDataSet);
begin
  qFormatoDatos.ApplyUpdates;
  qFormatoDatos.CommitUpdates;
end;

procedure TFSeccionFormatoDatosODT.qFormatoDatosAfterPost(DataSet: TDataSet);
begin
  qFormatoDatos.ApplyUpdates;
  qFormatoDatos.CommitUpdates;
end;

procedure TFSeccionFormatoDatosODT.qEncabezadoSeccionDatosAfterPost(
  DataSet: TDataSet);
begin
  qEncabezadoSeccionDatos.ApplyUpdates;
  qEncabezadoSeccionDatos.CommitUpdates;
end;

procedure TFSeccionFormatoDatosODT.qEncabezadoSeccionDatosAfterDelete(
  DataSet: TDataSet);
begin
  qEncabezadoSeccionDatos.ApplyUpdates;
  qEncabezadoSeccionDatos.CommitUpdates;
end;

procedure TFSeccionFormatoDatosODT.qEncabezadoSeccionAfterDelete(
  DataSet: TDataSet);
begin
  qEncabezadoSeccion.ApplyUpdates;
  qEncabezadoSeccion.CommitUpdates;
end;

procedure TFSeccionFormatoDatosODT.qEncabezadoSeccionAfterPost(
  DataSet: TDataSet);
begin
  qEncabezadoSeccion.ApplyUpdates;
  qEncabezadoSeccion.CommitUpdates;
end;

procedure TFSeccionFormatoDatosODT.qColumnaMedidaAfterPost(DataSet: TDataSet);
begin
     qColumnaMedida.ApplyUpdates;
     qColumnaMedida.CommitUpdates;
end;

procedure TFSeccionFormatoDatosODT.qColumnaMedidaAfterDelete(
  DataSet: TDataSet);
begin
  qColumnaMedida.ApplyUpdates;
  qColumnaMedida.CommitUpdates;
end;

procedure TFSeccionFormatoDatosODT.qValorMedidaAfterDelete(DataSet: TDataSet);
begin
  qValorMedida.ApplyUpdates;
  qValorMedida.CommitUpdates;
end;

procedure TFSeccionFormatoDatosODT.qValorMedidaAfterPost(DataSet: TDataSet);
begin
  qValorMedida.ApplyUpdates;
  qValorMedida.CommitUpdates;
end;

procedure TFSeccionFormatoDatosODT.qValorMedidaDetalleAfterDelete(
  DataSet: TDataSet);
begin
  qValorMedidaDetalle.ApplyUpdates;
  qValorMedidaDetalle.CommitUpdates;
end;

procedure TFSeccionFormatoDatosODT.qValorMedidaDetalleAfterPost(
  DataSet: TDataSet);
begin
  qValorMedidaDetalle.ApplyUpdates;
  qValorMedidaDetalle.CommitUpdates;
end;

procedure TFSeccionFormatoDatosODT.qSeccionAfterDelete(DataSet: TDataSet);
begin
  qSeccion.ApplyUpdates;
  qSeccion.CommitUpdates;
end;

procedure TFSeccionFormatoDatosODT.qSeccionAfterPost(DataSet: TDataSet);
begin
  qSeccion.ApplyUpdates;
  qSeccion.CommitUpdates;
end;

procedure TFSeccionFormatoDatosODT.qSeccionDatosBeforeInsert(
  DataSet: TDataSet);
begin
   qSeccionDatos.close;
   qSeccionDatos.Open;
end;

procedure TFSeccionFormatoDatosODT.TMedidasAfterInsert(DataSet: TDataSet);
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

procedure TFSeccionFormatoDatosODT.FormCreate(Sender: TObject);
begin
  CargandoTabla:=true;
end;

procedure TFSeccionFormatoDatosODT.bAceptarClick(Sender: TObject);
begin
  if DBEFechaPrueba.Text='' then
  begin
    Application.MessageBox('Debe ingresar la fecha de la prueba','Error',Mb_Iconerror);
    ModalResult:=0;
    Exit;
  end;

  if updSeccionDatos = nil then
  begin
    close;
  end
  else
  begin
    EscribirTablaTemporalMedidas;
    bDatosIncompletos := False;
    try
      qEncabezadoSeccionDatos.Close;
      qSeccionDatos.post;
      if qSeccionDatos.UpdatesPending then
        qSeccionDatos.ApplyUpdates;
      qEncabezadoSeccionDatos.Open;
      Close;
      ModalResult:=MrOk;
    except
      on E:Exception do
      begin
        ShowMessage(E.Message);
        bDatosIncompletos := True;
        qSeccionDatos.Edit;
        ModalResult:=MrCancel;
        qEncabezadoSeccionDatos.Open;
        Close;
      end;
    end;
  end;
end;

procedure TFSeccionFormatoDatosODT.FormClose(Sender: TObject;
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

procedure TFSeccionFormatoDatosODT.bCancelarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Perderá los cambios realizados.Esta seguro de Cancelar?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
  begin
    try
      qSeccionDatos.Cancel;
      if qSeccionDatos.UpdatesPending then
        qSeccionDatos.CancelUpdates;
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

procedure TFSeccionFormatoDatosODT.FloatField2Change(Sender: TField);
begin
  qNombreFormato.Close;
  qNombreFormato.Open;
end;

procedure TFSeccionFormatoDatosODT.qEncabezadoDatosCalcFields(
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

procedure TFSeccionFormatoDatosODT.qValorMedidaDetalleCalcFields(
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

procedure TFSeccionFormatoDatosODT.qSeccionDatosCODIGOUSUARIOCREACIONValidate(
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

procedure TFSeccionFormatoDatosODT.qSeccionDatosCalcFields(DataSet: TDataSet);
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

procedure TFSeccionFormatoDatosODT.qSeccionDatosBeforePost(DataSet: TDataSet);
begin
  RefrescarVariables;
  qSeccionDatosFECHAMODIFICACION.AsString:=DateTimeToStr(Now);
  qSeccionDatosCODIGOUSUARIOMODIFICACION.AsInteger:= varcodigousuario;
end;

procedure TFSeccionFormatoDatosODT.sbFechaPruebaClick(Sender: TObject);
begin
  DBEFechaPrueba.Setfocus;
  sFecha := DBEFechaPrueba.Text;
  Fecha := GetFecha(False);
  if Fecha <> '' then DBEFechaPrueba.Text := Fecha;
end;

function TFSeccionFormatoDatosODT.GetFecha(Tipo:Boolean): String;
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

procedure TFSeccionFormatoDatosODT.DBEFechaPruebaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 inherited;
  case Key of
    VK_F3 : sbFechaPruebaClick(nil);
  end;
end;

procedure TFSeccionFormatoDatosODT.AgregarEncabezadosSeccion;
var qEliminarEncabezados:tquery;
begin
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
end;

procedure TFSeccionFormatoDatosODT.qSeccionDatosAfterOpen(
  DataSet: TDataSet);
begin
  qEncabezadoSeccionDatos.close;
  qEncabezadoSeccionDatos.open;
  if qEncabezadoSeccionDatos.RecordCount=0 then
    AgregarEncabezadosSeccion;
end;

end.


