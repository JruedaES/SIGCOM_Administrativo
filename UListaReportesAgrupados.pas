unit UListaReportesAgrupados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Mask, DBCtrls, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, ExtCtrls, Db,
  Digisoft, DBTables,uFIMPComunes, ComCtrls,ufuncionsgd, Menus;

type
  TFListaReportesAgrupados = class(TForm)
    Panel4: TPanel;
    Panel6: TPanel;
    dbgListaReportes: TRxDBGrid;
    qListaReportes: TQuery;
    qListaReportesCODIGOREPORTE: TFloatField;
    qListaReportesCODIGOINFORMANTE: TStringField;
    qListaReportesDIRECCIONINFORMANTE: TStringField;
    qListaReportesNOMBREINFORMANTE: TStringField;
    qListaReportesCIGINFORMANTE: TFloatField;
    qListaReportesTELEFONO: TStringField;
    qListaReportesCIGDANO: TFloatField;
    qListaReportesCODIGOADMINISTRATIVO: TFloatField;
    qListaReportesCODIGOTIPOREPORTE: TStringField;
    qListaReportesCODIGOCLASEREPORTE: TStringField;
    qListaReportesCODIGOPRIORIDAD: TStringField;
    qListaReportesCODIGOESTADOREPORTE: TStringField;
    qListaReportesNUMEROCARTA: TStringField;
    qListaReportesCODIGOESTADOCARTA: TFloatField;
    qListaReportesREGISTROS: TFloatField;
    qListaReportesFECHAHORA: TDateTimeField;
    qListaReportesFECHAULTIMOREGISTRO: TDateTimeField;
    qListaReportesFECHAHORADICTADO: TDateTimeField;
    qListaReportesFECHAHORALLEGADA: TDateTimeField;
    qListaReportesFECHAHORAATENCION: TDateTimeField;
    qListaReportesX: TFloatField;
    qListaReportesY: TFloatField;
    qListaReportesORIGENREPORTE: TStringField;
    qListaReportesCODIGOTIPOELEMENTO: TStringField;
    qListaReportesCODIGOELEMENTO: TStringField;
    qListaReportesCODIGOSUBESTACION: TStringField;
    qListaReportesCODIGOCIRCUITO: TStringField;
    qListaReportesCODIGOTRAFODIS: TFloatField;
    qListaReportesCODIGOAPOYO: TFloatField;
    qListaReportesCODIGOCLIENTESGD: TFloatField;
    qListaReportesCODIGOCLIENTECOM: TFloatField;
    qListaReportesREPORTEPADRE: TFloatField;
    qListaReportesPINTADOAPOYO: TStringField;
    qListaReportesNOMBREADMINISTRATIVO: TStringField;
    qListaReportesNOMBRETIPOREPORTE: TStringField;
    qListaReportesNOMBRECLASEREPORTE: TStringField;
    qListaReportesNOMBRESUBESTACION: TStringField;
    qListaReportesNOMBRECIRCUITO: TStringField;
    qListaReportesCOLOR: TFloatField;
    qListaReportesNOMBREESTADOREPORTE: TStringField;
    qListaReportesDIRECCIONDANO: TStringField;
    qListaReportesPRIORIDADDANO: TFloatField;
    qListaReportesCIAINFORMANTE: TFloatField;
    qListaReportesNOMBRECIAINFORMANTE: TStringField;
    qListaReportesCODIGOTIPOVIA: TFloatField;
    qListaReportesCODIGONOMBREVIA: TFloatField;
    qListaReportesMODIFICADORVIA: TStringField;
    qListaReportesDUPLICADOR: TFloatField;
    qListaReportesMODIFICADORDUPLICADOR: TStringField;
    qListaReportesNUMEROPUERTA: TFloatField;
    qListaReportesDireccionCalculada: TStringField;
    qListaReportesNOMBREGRUPOTRABAJO: TStringField;
    qListaReportesCODIGOTIPODANO: TFloatField;
    qListaReportesNombreTipoDano: TStringField;
    qListaReportesNOMBREFUNCIONARIO: TStringField;
    qListaReportesCODIGOTIPOPREDIO: TStringField;
    qListaReportesNOMBRETIPOINFORMANTE: TStringField;
    qListaReportesCODIGOCOMUNA: TFloatField;
    qListaReportesNombreCig: TStringField;
    qListaReportesPRIORIDADESTIMADA: TFloatField;
    qListaReportesTIPOCLIENTE: TStringField;
    qListaReportesNombreTipoCliente: TStringField;
    qListaReportesCOLORCELDA: TFloatField;
    qListaReportesNombreSolicitante: TStringField;
    qListaReportesDESCRIPCION: TMemoField;
    qListaReportesOBSERVACION: TMemoField;
    qListaReportesCODIGOODT: TStringField;
    qListaReportesCODIGOUSUARIOCREACION: TFloatField;
    qListaReportesNombreUsuario: TStringField;
    qListaReportesCODIGOINTERRUPTORDIS: TFloatField;
    dsBase: TDDataSource;
    qTipoDano: TQuery;
    qGeografico: TQuery;
    qGeograficoCODIGOGEOGRAFICO: TFloatField;
    qGeograficoNIVEL: TFloatField;
    qGeograficoCIUDAD: TStringField;
    qGeograficoBARRIO: TStringField;
    qGeograficoNOMBRECIG: TStringField;
    qListaReportesfechahoraformateada: TStringField;
    PageControl1: TPageControl;
    tsTecnica: TTabSheet;
    tsReportesAsociados: TTabSheet;
    tsInterrupcion: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label29: TLabel;
    sbUbicarSubestacion: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    DBEdit1: TDBEdit;
    dbeCircuito: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    dbeInterruptor: TDBEdit;
    SpeedButton2: TSpeedButton;
    Panel1: TPanel;
    dbgReportesAsociados: TRxDBGrid;
    Panel7: TPanel;
    SpeedButton6: TSpeedButton;
    Panel2: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    SpeedButton7: TSpeedButton;
    infinterrupcion: TLabel;
    memo: TMemo;
    qReporteAsociado: TQuery;
    qReporteAsociadoCODIGOREPORTE: TFloatField;
    qReporteAsociadoNOMBREINFORMANTE: TStringField;
    qReporteAsociadoTELEFONO: TStringField;
    qReporteAsociadoDireccion: TStringField;
    qReporteAsociadoCIG: TStringField;
    qReporteAsociadoCIGDANO: TFloatField;
    qReporteAsociadoCODIGOTIPOVIA: TFloatField;
    qReporteAsociadoCODIGONOMBREVIA: TFloatField;
    qReporteAsociadoMODIFICADORVIA: TStringField;
    qReporteAsociadoDUPLICADOR: TFloatField;
    qReporteAsociadoMODIFICADORDUPLICADOR: TStringField;
    qReporteAsociadoNUMEROPUERTA: TFloatField;
    qReporteAsociadoCODIGOTIPOPREDIO: TStringField;
    qReporteAsociadoCODIGOCLIENTESGD: TFloatField;
    qReporteAsociadoCODIGOSUBESTACION: TStringField;
    qReporteAsociadoCODIGOCIRCUITO: TStringField;
    qReporteAsociadoCODIGOAPOYO: TFloatField;
    qReporteAsociadoCODIGOTRAFODIS: TFloatField;
    qReporteAsociadoCODIGOINTERRUPTORDIS: TFloatField;
    qReporteAsociadoPINTADOAPOYO: TStringField;
    dsReporteAsociado: TDataSource;
    qListaReportesTotalReportes: TIntegerField;
    pmAgrupar: TPopupMenu;
    AgruparReportes1: TMenuItem;
    qReporteAsociadopintadotrafodis: TStringField;
    sbRefrescadoAutomatico: TSpeedButton;
    Timer: TTimer;
    TimerDibujo: TTimer;
    qTotal: TQuery;
    qListaReportesDESCRIPCIONTIPOPREDIO: TMemoField;
    qReporteAsociadoDESCRIPCIONTIPOPREDIO: TMemoField;
    procedure qListaReportesAfterScroll(DataSet: TDataSet);
    procedure qListaReportesCalcFields(DataSet: TDataSet);
    procedure dbgListaReportesGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qReporteAsociadoCalcFields(DataSet: TDataSet);
    procedure sbUbicarSubestacionClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure dbgListaReportesDblClick(Sender: TObject);
    procedure AgruparReportes1Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure sbRefrescadoAutomaticoClick(Sender: TObject);
    procedure TimerDibujoTimer(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure qListaReportesAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    ListaInformantes:tstringlist;
    ListaTrafos:tstringlist;
    Procedure Totales;
  end;

var
  FListaReportesAgrupados: TFListaReportesAgrupados;

implementation

uses uReporte;

{$R *.DFM}

procedure TFListaReportesAgrupados.qListaReportesAfterScroll(
  DataSet: TDataSet);
var
 i,posicion:integer;
 Evento:TStringList;
begin
  qReporteAsociado.Close;
  qReporteAsociado.ParamByname('codigoreportepadre').asString:=qListaReportesCODIGOREPORTE.asString;
  qReporteAsociado.open;
  i:=1;

  ListaInformantes.Clear;
  ListaTrafos.clear;

  tsReportesAsociados.TabVisible:=False;
  tsInterrupcion.TabVisible:=False;

  if not qReporteAsociado.IsEmpty then
  begin

    tsReportesAsociados.TabVisible:=True;
    while not qReporteAsociado.eof do
    begin
      if i=1 then
      begin
        ListaInformantes.add(qListaReportesCODIGOCLIENTESGD.AsString);
        ListaTrafos.add(qListaReportesCODIGOTRAFODIS.AsString);
      end;

      ListaInformantes.add(qReporteAsociadoCODIGOCLIENTESGD.AsString);
      if not ListaTrafos.Find(qReporteAsociadoCODIGOTRAFODIS.AsString,posicion) then
        ListaTrafos.Add(qReporteAsociadoCODIGOTRAFODIS.AsString);
      qReporteAsociado.Next;
      i:=i+1;
    end;

    memo.Clear;

    if qListaReportesCODIGOTRAFODIS.asString <>'' then
    begin
      Evento:=TStringList.Create;
      Evento.Assign(VerificarInterrupcion(qListaReportesCODIGOTRAFODIS.asString)); //Verifica si existe evento abierto.

      if evento.Count=4 then
      begin
        tsInterrupcion.TabVisible:=True;
        if evento[1]<> '' then
          memo.Lines.Add(evento[1]);
      end;
      Evento.Free;
    end;

  end
  else
  begin
    if qListaReportesCODIGOCLIENTESGD.AsString<>'' then
      ListaInformantes.add(qListaReportesCODIGOCLIENTESGD.AsString);

    if qListaReportesCODIGOTRAFODIS.AsString<>'' then
      ListaTrafos.add(qListaReportesCODIGOTRAFODIS.AsString);
  end;
  
  if dbgListaReportes.SelectedRows.Count=0 then
  begin
    TimerDibujo.Enabled:=False;
    TimerDibujo.Enabled:=True;
  end;
end;

procedure TFListaReportesAgrupados.qListaReportesCalcFields(
  DataSet: TDataSet);
var qDatos:TQuery;
    Direccion:string;
begin
  Direccion:='';
  if qListaReportesCIGDANO.AsString<>'' then
  begin
    qGeografico.close;
    qGeografico.open;
    qListaReportesNombreCig.AsString:=qGeograficoBARRIO.AsString;
  end;
  try
    qDatos:=TQuery.Create(Application);
    qDatos.DatabaseName:='BaseDato';
    if DataSet.FieldByName('CODIGOTIPOVIA').AsString <> '' then
    begin
      qDatos.Close;
      qDatos.SQL.Text:='SELECT ABREVIATURA FROM DIR_TIPOVIA WHERE CODIGOTIPOVIA = ' +
                       DataSet.FieldByName('CODIGOTIPOVIA').AsString;
      qDatos.Open;
      Direccion:=Direccion + qDatos.Fields[0].AsString;
    end;
    if DataSet.FieldByName('CODIGONOMBREVIA').AsString <> '' then
    begin
      qDatos.Close;
      qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                       DataSet.FieldByName('CODIGONOMBREVIA').AsString;
      qDatos.Open;
      Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
    end;
    Direccion:=Direccion + DataSet.FieldByName('MODIFICADORVIA').AsString;

    if DataSet.FieldByName('DUPLICADOR').AsString <> '' then
    begin
      qDatos.Close;
      qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                       DataSet.FieldByName('DUPLICADOR').AsString;
      qDatos.Open;
      Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
    end;
    Direccion:=Direccion + DataSet.FieldByName('MODIFICADORDUPLICADOR').AsString +
               ' ' + DataSet.FieldByName('NUMEROPUERTA').AsString;

    Direccion:=Direccion + ' ' + DataSet.FieldByName('CODIGOTIPOPREDIO').AsString + ' ' +
               DataSet.FieldByName('DESCRIPCIONTIPOPREDIO').AsString;
    DataSet.FieldByName('DIRECCIONCALCULADA').AsString:=TrimLeft(Direccion);
    if (qListaReportesCODIGOREPORTE.AsString<>'') then
    begin
      qdatos.sql.clear;
      qDatos.sql.add('SELECT CODIGOODT ||''-''|| CONSECUTIVO FROM ODTREPORTE WHERE CODIGOREPORTE='+qListaReportesCODIGOREPORTE.AsString);
      qDatos.Open;
      qListaReportesCodigoodt.AsString:=qDatos.fields[0].AsString;
    end;

    qdatos.close;
    qdatos.sql.clear;
    qdatos.sql.add('select to_char(fechahora,''DD/MM/YYYY hh12:mi:ss am'') from reporte where codigoreporte='+qListaReportesCODIGOREPORTE.AsString);
    qdatos.open;
    DataSet.FieldByName('fechahoraformateada').AsString:=qDatos.fields[0].AsString;

    qdatos.close;
    qdatos.sql.clear;
    qdatos.sql.add('Select decode(count(*),0,1,count(*)) total from reporte where reportepadre='+qListaReportesCODIGOREPORTE.AsString);
    qdatos.open;
    DataSet.FieldByName('totalreportes').AsString:=qDatos.fields[0].AsString;
    qdatos.close;
  finally
    qDatos.Free;
  end;
 
end;

procedure TFListaReportesAgrupados.dbgListaReportesGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  if Field.FieldName='NOMBREESTADOREPORTE' then
  begin
     Background:=qListaReportesCOLOR.AsInteger;
  end;

  if BackGround = 0 then BackGround := clWhite;
end;

procedure TFListaReportesAgrupados.FormCreate(Sender: TObject);
begin
  qTipoDano.close;
  qTipoDano.Open;
  ListaInformantes := TStringList.create;
  ListaTrafos:= TStringList.create;
  Timer.Interval := 60000;
  Timer.Enabled := false;

  TimerDibujo.Interval := 3000;
  TimerDibujo.Enabled:=False;
end;

procedure TFListaReportesAgrupados.FormDestroy(Sender: TObject);
begin
  ListaInformantes.free;
  ListaTrafos.free;
end;

procedure TFListaReportesAgrupados.qReporteAsociadoCalcFields(
  DataSet: TDataSet);
var qDatos:TQuery;
    Direccion:string;
begin
  Direccion:='';
  qDatos:=TQuery.Create(Application);
  qDatos.DatabaseName:='BaseDato';
  if qReporteAsociadoCIGDANO.AsString<>'' then
  begin
    qDatos.Close;
    qDatos.SQL.clear;
    qDatos.SQL.Text:='Select * from nombrebarrio where codigogeografico=' +
                       DataSet.FieldByName('CIGDANO').AsString;
    qDatos.Open;
    qReporteAsociadoCIG.asString:=qDatos.FieldByName('BARRIO').AsString;
  end;

  if qReporteAsociadoCODIGOTRAFODIS.AsString<>'' then
  begin
    qDatos.Close;
    qDatos.SQL.clear;
    qDatos.SQL.Text:='Select pintadotrafodis from trafodis where codigotrafodis=' +
                       DataSet.FieldByName('CODIGOTRAFODIS').AsString;
    qDatos.Open;
    qReporteAsociadoPINTADOTRAFODIS.asString:=qDatos.FieldByName('pintadotrafodis').AsString;
  end;

    qDatos.Close;
    qDatos.SQL.clear;
    if DataSet.FieldByName('CODIGOTIPOVIA').AsString <> '' then
    begin
      qDatos.Close;
      qDatos.SQL.Text:='SELECT ABREVIATURA FROM DIR_TIPOVIA WHERE CODIGOTIPOVIA = ' +
                       DataSet.FieldByName('CODIGOTIPOVIA').AsString;
      qDatos.Open;
      Direccion:=Direccion + qDatos.Fields[0].AsString;
    end;
    if DataSet.FieldByName('CODIGONOMBREVIA').AsString <> '' then
    begin
      qDatos.Close;
      qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                       DataSet.FieldByName('CODIGONOMBREVIA').AsString;
      qDatos.Open;
      Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
    end;
    Direccion:=Direccion + DataSet.FieldByName('MODIFICADORVIA').AsString;

    if DataSet.FieldByName('DUPLICADOR').AsString <> '' then
    begin
      qDatos.Close;
      qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                       DataSet.FieldByName('DUPLICADOR').AsString;
      qDatos.Open;
      Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
    end;
    Direccion:=Direccion + DataSet.FieldByName('MODIFICADORDUPLICADOR').AsString +
               ' ' + DataSet.FieldByName('NUMEROPUERTA').AsString;

    Direccion:=Direccion + ' ' + DataSet.FieldByName('CODIGOTIPOPREDIO').AsString + ' ' +
               DataSet.FieldByName('DESCRIPCIONTIPOPREDIO').AsString;
    DataSet.FieldByName('DIRECCION').AsString:=TrimLeft(Direccion);

  qDatos.close;
  qDatos.Free;
end;

procedure TFListaReportesAgrupados.sbUbicarSubestacionClick(
  Sender: TObject);
begin
  if qListaReportesCODIGOSUBESTACION.AsString<>'' then
  begin
    MostrarMapa();
    buscarsubestacion(qListaReportesCODIGOSUBESTACION.AsString, false);
  end;
end;

procedure TFListaReportesAgrupados.SpeedButton1Click(Sender: TObject);
begin
  if qListaReportesCodigoCircuito.AsString<>'' then
  begin
    MostrarMapa();
    BuscarCircuito(qListaReportesCodigoCircuito.AsString);
  end;
end;

procedure TFListaReportesAgrupados.SpeedButton3Click(Sender: TObject);
begin
  if qReporteAsociadoCODIGOTRAFODIS.AsString <> '' then
  begin
    MostrarMapa();
    LineasTrafoDis(qListaReportesCODIGOTRAFODIS.AsString,1,3);
  end;
end;

procedure TFListaReportesAgrupados.SpeedButton2Click(Sender: TObject);
var qDatos:TQuery;
sl:TStringList;
sTramos:string;
begin
  sl:=TStringList.Create;
  sl.Assign(TramosBTInterruptor(qListaReportesCODIGOCIRCUITO.AsString,qListaReportesCODIGOINTERRUPTORDIS.asString));
  if sl<>nil then
  begin
    sTramos:=sl.commatext;
    FiltrarTramo(sTramos,1);
  end;
  sl.free;
end;

procedure TFListaReportesAgrupados.SpeedButton4Click(Sender: TObject);
Var qBuscarApoyo : TQuery;
begin
  if (qReporteAsociadoCODIGOAPOYO.AsString<>'') then
  begin
    BuscarApoyo(qReporteAsociadoCODIGOAPOYO.AsString,True);
  end
  else
  begin
    qBuscarApoyo := TQuery.Create(Application);
    qBuscarApoyo.DatabaseName:=qReporteAsociado.DatabaseName;
    qBuscarApoyo.Close;
    qBuscarApoyo.Sql.Add('Select CodigoApoyo From Apoyo where PintadoApoyo='''+qReporteAsociado.FieldByName('PINTADOAPOYO').AsString+'''');
    qBuscarApoyo.Open;
    try
      BuscarApoyo(qBuscarApoyo.FieldByName('CodigoApoyo').AsString,True);
    except
      on e:exception do
      begin
        showmessage(e.message);
      end;
    end;
    qBuscarApoyo.Free;
  end;
 
end;

procedure TFListaReportesAgrupados.SpeedButton7Click(Sender: TObject);
Var qBuscarApoyo : TQuery;
begin
  if (qReporteAsociadoCODIGOAPOYO.AsString<>'') then
  begin
    BuscarApoyo(qReporteAsociadoCODIGOAPOYO.AsString,True);
  end
  else
  begin
    qBuscarApoyo := TQuery.Create(Application);
    qBuscarApoyo.DatabaseName:=qReporteAsociado.DatabaseName;
    qBuscarApoyo.Close;
    qBuscarApoyo.Sql.Add('Select CodigoApoyo From Apoyo where PintadoApoyo='''+qReporteAsociado.FieldByName('PINTADOAPOYO').AsString+'''');
    qBuscarApoyo.Open;
    try
      BuscarApoyo(qBuscarApoyo.FieldByName('CodigoApoyo').AsString,True);
    except
      on e:exception do
      begin
        showmessage(e.message);
      end;
    end;
    qBuscarApoyo.Free;
  end;
end;

procedure TFListaReportesAgrupados.dbgListaReportesDblClick(
  Sender: TObject);
begin
  if qListaReportesCODIGOREPORTE.AsString <> '' then
  begin
    if not (Assigned(Application.FindComponent('fReporte') as TForm)) then
      fReporte:=TfReporte.Create(Application);

    fReporte.qReporte.Active:=False;
    fReporte.qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE='+
                                qListaReportesCODIGOREPORTE.AsString;
    fReporte.qReporte.Active:=True;
    fReporte.qReporte.Edit;
    fReporte.qgrupotrabajo.Close;
    If freporte.qReporteCODIGOGRUPOTRABAJO.ASSTRING <> '' then
      fReporte.qgrupotrabajo.SQL.text:= fReporte.qgrupotrabajo.SQL.text + ' AND (ACTIVO = ''S'' OR CODIGOGRUPOTRABAJO = '+ freporte.qReporteCODIGOGRUPOTRABAJO.ASSTRING+')'
    else
      fReporte.qgrupotrabajo.SQL.text:= fReporte.qgrupotrabajo.SQL.text + ' AND (ACTIVO = ''S'')';
    fReporte.qGrupoTrabajo.Open;
    fReporte.Show;
    fReporte.ActualizarBarraEstado;
  end;
end;

procedure TFListaReportesAgrupados.AgruparReportes1Click(Sender: TObject);
var
  i,j:Integer;
  sCodReportes,sPadre,sMensaje,sCodCircuito,sValor:string;
  Lista:TStringlist;
begin
  sCodCircuito:=qListaReportesCODIGOCIRCUITO.asString;
  if dbgListaReportes.SelectedRows.Count>0 then
  begin
    sCodReportes:='';
    sPadre:='';
    for i:=0 to dbgListaReportes.SelectedRows.Count-1 do
    begin
      qListaReportes.BookMark:=dbgListaReportes.SelectedRows.Items[i];

      if (qListaReportesREPORTEPADRE.asString<>'')and(qListaReportesREPORTEPADRE.asString=qListaReportesCODIGOREPORTE.asString) then
      begin
        if sPadre='' then
          sPadre:=qListaReportesCODIGOREPORTE.asString
        else
          raise exception.Create('Existe mas de un reporte padre en la asociación');
      end
      else
      begin
        if VerificarClienteCircuito(sCodCircuito,qListaReportesCODIGOCLIENTESGD.asString) then
        begin
          j:=j+1;
          sCodReportes:=sCodReportes+qListaReportesCODIGOREPORTE.asString+',';
        end
        else
        begin
          Application.MessageBox('No se puede realizar la operación, los reportes no pertencen al mismo circuito.','Error al agrupar',MB_ICONERROR);
          exit;
        end;

      end;

    end;

    sCodReportes:=copy(sCodReportes,1,length(sCodReportes)-1);

    if (sPadre='') then
    begin
      if (pos(',',sCodReportes)=0) then
        raise exception.Create('No existe reporte padre en la asociación')
      else
      begin
        Lista:=TStringlist.Create;
        Lista.CommaText:=sCodReportes;
        for i:=0 to Lista.Count-2 do
          for j:=i+1 to Lista.Count-1 do
          begin
            if strtoint(Lista[i])>strtoint(lista[j]) then
            begin
              sValor:=Lista[j];
              Lista[j]:=Lista[i];
              Lista[i]:=sValor;
            end;
          end;
        sCodReportes:=Lista.CommaText;
        Lista.Free;

        sPadre:=copy(sCodReportes,1,pos(',',sCodReportes)-1);
        sCodReportes:=copy(sCodReportes,pos(',',sCodReportes)+1,length(sCodReportes)-pos(',',sCodReportes));
        j:=j-1;
      end;
    end;

    if j=1 then
      sMensaje:='Desea agrupar el reporte '+sCodReportes+' con el reporte '+sPadre+' ?'
    else
      sMensaje:='Desea agrupar los reportes '+sCodReportes+' con el reporte '+sPadre+' ?';

    if Application.MessageBox(pChar(sMensaje),'Agrupar Reportes',MB_YESNO+ MB_ICONQUESTION) = IDYES then
    begin
      AgruparReportes(sPadre,sCodReportes);
      ActualizarReportesHijos(sPadre);
      qListaReportes.close;
      qListaReportes.open;
    end;
  end;


end;

procedure TFListaReportesAgrupados.SpeedButton6Click(Sender: TObject);
var
  i,j:Integer;
  sCodReportes,sPadre,sMensaje:string;
begin
  if dbgReportesAsociados.SelectedRows.Count>0 then
  begin
    sCodReportes:='';
    sPadre:=qListaReportesCODIGOREPORTE.asString;
    for i:=0 to dbgReportesAsociados.SelectedRows.Count-1 do
    begin
      qReporteAsociado.BookMark:=dbgReportesAsociados.SelectedRows.Items[i];
      j:=j+1;
      sCodReportes:=sCodReportes+qReporteAsociadoCODIGOREPORTE.asString+',';
    end;

    sCodReportes:=copy(sCodReportes,1,length(sCodReportes)-1);

    if j=1 then
      sMensaje:='Desea desagrupar el reporte '+sCodReportes+' del reporte '+sPadre+' ?'
    else
      sMensaje:='Desea desagrupar los reportes '+sCodReportes+' del reporte '+sPadre+' ?';

    if Application.MessageBox(pChar(sMensaje),'Agrupar Reportes',MB_YESNO+ MB_ICONQUESTION) = IDYES then
    begin
      DesAgruparReportes(sPadre,sCodReportes);
      ActualizarReporteDesagrupado(sCodReportes);
      qListaReportes.close;
      qListaReportes.open;
    end;
  end;
end;

procedure TFListaReportesAgrupados.sbRefrescadoAutomaticoClick(
  Sender: TObject);
begin
  Timer.Enabled:=sbRefrescadoAutomatico.Down;
  if sbRefrescadoAutomatico.Down then
    sbRefrescadoAutomatico.Hint:='Refrescado automático de nuevos reporte habilitado.'
  else
    sbRefrescadoAutomatico.Hint:='Refrescado automático deshabilitado';
end;

procedure TFListaReportesAgrupados.TimerDibujoTimer(Sender: TObject);
var
  i:integer;
begin
  if (listaTrafos.Count>0) and (ListaInformantes.Count>0) then
  begin
    if qListaReportesCodigoCircuito.AsString<>'' then
      BuscarCircuito(qListaReportesCodigoCircuito.AsString);
    for i:=0 to listaTrafos.Count-1 do
      LineasTrafoDis(listaTrafos[i],1,3,false);

    if listaInformantes.Count>0 then
      MarcarClientes(ListaInformantes,clBlack,False);
  end;

  TimerDibujo.Enabled:=False;
end;

procedure TFListaReportesAgrupados.TimerTimer(Sender: TObject);
begin
  qListaReportes.Close;
  qListaReportes.Open;
end;

procedure TFListaReportesAgrupados.Totales;
begin
  qTotal.close;
  qTotal.sql.clear;
  qTotal.sql.text:='SELECT COUNT(codigoreporte) as Total from ('+qListaReportes.sql.text+')';
  qTotal.open;
  if qTotal.fieldbyname('TOTAL').asInteger > 1
     then caption:='Reportes Agrupados << '+ qTotal.fieldbyname('TOTAL').asString+' Registros Encontrados >>'
     else caption:='Reportes Agrupados << '+ qTotal.fieldbyname('TOTAL').asString+' Registro Encontrado >>';
  qTotal.close;
end;

procedure TFListaReportesAgrupados.qListaReportesAfterOpen(
  DataSet: TDataSet);
begin
  Totales;
end;

end.
