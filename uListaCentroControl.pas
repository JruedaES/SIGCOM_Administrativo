unit uListaCentroControl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, Series, DBCtrls, Grids, DBGrids, RXDBCtrl,
  TeEngine, TeeProcs, Chart, DBChart, ComCtrls, EditChar;

type
  TFListaCentroControl = class(TFdSgdListaBase)
    PCLibro: TPageControl;
    tsRecibidos: TTabSheet;
    Panel4: TPanel;
    Panel9: TPanel;
    DBCRecibidos: TDBChart;
    Series1: TBarSeries;
    DBGRecibidos: TRxDBGrid;
    Panel5: TPanel;
    Shape25: TShape;
    Shape31: TShape;
    Shape30: TShape;
    Shape29: TShape;
    Label39: TLabel;
    Label38: TLabel;
    Shape28: TShape;
    Shape27: TShape;
    Label36: TLabel;
    Label35: TLabel;
    Label34: TLabel;
    Label15: TLabel;
    DBText24: TDBText;
    DBText25: TDBText;
    DBText26: TDBText;
    DBText27: TDBText;
    DBText28: TDBText;
    Shape38: TShape;
    Label42: TLabel;
    DBText32: TDBText;
    tsDictados: TTabSheet;
    Panel6: TPanel;
    Shape1: TShape;
    DBText4: TDBText;
    DBText5: TDBText;
    DBText6: TDBText;
    DBText7: TDBText;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Label9: TLabel;
    DBText15: TDBText;
    Shape21: TShape;
    Shape22: TShape;
    Shape23: TShape;
    Shape39: TShape;
    Label43: TLabel;
    DBText33: TDBText;
    Panel7: TPanel;
    Panel10: TPanel;
    PCDictados: TPageControl;
    TSTiempo: TTabSheet;
    DBCTiemposDictados: TDBChart;
    HBSTiempoDictadoReportesDictados: THorizBarSeries;
    STiempoEnLlegar: THorizBarSeries;
    TSMovil: TTabSheet;
    DBCMovilReporteDictados: TDBChart;
    HBSMovilReporteDictado: TBarSeries;
    DBGDictados: TRxDBGrid;
    tsAtendidos: TTabSheet;
    Panel12: TPanel;
    PCReporteAtendidos: TPageControl;
    tsTiempoAtendidos: TTabSheet;
    DBCReporteAtendidosTiempo: TDBChart;
    HBSReporteAtendidoTiempoDictado: THorizBarSeries;
    HBSReporteAtendidosTiempoAtencion: THorizBarSeries;
    STiempoEnReparacion: THorizBarSeries;
    tsMovilReportesAtendidos: TTabSheet;
    DBCMovilReporteAtendidos: TDBChart;
    HBSMovilReporteAtendido: TBarSeries;
    DBGAtendidos: TDBGrid;
    Panel13: TPanel;
    Shape16: TShape;
    Shape26: TShape;
    Shape20: TShape;
    Label32: TLabel;
    Shape19: TShape;
    Shape18: TShape;
    Shape17: TShape;
    Label29: TLabel;
    Label28: TLabel;
    Label27: TLabel;
    Label26: TLabel;
    Label30: TLabel;
    DBText18: TDBText;
    DBText19: TDBText;
    DBText20: TDBText;
    DBText21: TDBText;
    DBText23: TDBText;
    DBText29: TDBText;
    Label37: TLabel;
    Shape33: TShape;
    Label45: TLabel;
    DBText35: TDBText;
    tsTerminado: TTabSheet;
    Panel8: TPanel;
    Shape9: TShape;
    Label16: TLabel;
    DBText8: TDBText;
    DBText10: TDBText;
    DBText11: TDBText;
    DBText17: TDBText;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Label22: TLabel;
    Shape15: TShape;
    Shape34: TShape;
    Shape36: TShape;
    DBText30: TDBText;
    Label41: TLabel;
    Label44: TLabel;
    DBText34: TDBText;
    Panel11: TPanel;
    DBGTerminados: TDBGrid;
    Panel14: TPanel;
    PCTerminados: TPageControl;
    TSTiempos: TTabSheet;
    DBCTiemposReportesTerminados: TDBChart;
    LReporteTerminados: TLabel;
    STiempoDictadoReportesTerminados: THorizBarSeries;
    STiempoLlegadaTerminados: THorizBarSeries;
    STiempoTerminacion: THorizBarSeries;
    TSmoviles: TTabSheet;
    DBCMovilReportesTerminados: TDBChart;
    HBSMovilReporteTerminados: TBarSeries;
    qRecibidos: TQuery;
    dsRecibidos: TDataSource;
    DBCRecibidosClasificacion: TDBChart;
    qTotalesTipo: TQuery;
    BarSeries1: TPieSeries;
    qRecibidosCODIGOREPORTE: TFloatField;
    qRecibidosCODIGOINFORMANTE: TStringField;
    qRecibidosDIRECCIONINFORMANTE: TStringField;
    qRecibidosNOMBREINFORMANTE: TStringField;
    qRecibidosCIGINFORMANTE: TFloatField;
    qRecibidosTELEFONO: TStringField;
    qRecibidosCIGDANO: TFloatField;
    qRecibidosDIRECCIONDANO: TStringField;
    qRecibidosCODIGOADMINISTRATIVO: TFloatField;
    qRecibidosCODIGOTIPOREPORTE: TStringField;
    qRecibidosCODIGOCLASEREPORTE: TStringField;
    qRecibidosCODIGOPRIORIDAD: TStringField;
    qRecibidosCODIGOESTADOREPORTE: TStringField;
    qRecibidosNUMEROCARTA: TStringField;
    qRecibidosCODIGOESTADOCARTA: TFloatField;
    qRecibidosREGISTROS: TFloatField;
    qRecibidosDESCRIPCION: TStringField;
    qRecibidosOBSERVACION: TStringField;
    qRecibidosFECHAHORA: TDateTimeField;
    qRecibidosFECHAULTIMOREGISTRO: TDateTimeField;
    qRecibidosFECHAHORADICTADO: TDateTimeField;
    qRecibidosFECHAHORALLEGADA: TDateTimeField;
    qRecibidosFECHAHORAATENCION: TDateTimeField;
    qRecibidosX: TFloatField;
    qRecibidosY: TFloatField;
    qRecibidosORIGENREPORTE: TStringField;
    qRecibidosCODIGOTIPOELEMENTO: TStringField;
    qRecibidosCODIGOELEMENTO: TStringField;
    qRecibidosCODIGOSUBESTACION: TStringField;
    qRecibidosCODIGOCIRCUITO: TStringField;
    qRecibidosCODIGOTRAFODIS: TFloatField;
    qRecibidosCODIGOAPOYO: TFloatField;
    qRecibidosCODIGOCLIENTESGD: TFloatField;
    qRecibidosCODIGOCLIENTECOM: TFloatField;
    qRecibidosREPORTEPADRE: TFloatField;
    qRecibidosCODIGOODT: TFloatField;
    qRecibidosPINTADOAPOYO: TStringField;
    qRecibidosNOMBREINFORMANTE_1: TStringField;
    qRecibidosNOMBREADMINISTRATIVO: TStringField;
    qRecibidosNOMBRETIPOREPORTE: TStringField;
    qRecibidosNOMBRECLASEREPORTE: TStringField;
    qRecibidosNOMBRESUBESTACION: TStringField;
    qRecibidosNOMBRECIRCUITO: TStringField;
    qRecibidosCOLOR: TFloatField;
    qRecibidosNOMBREESTADOREPORTE: TStringField;
    qRecibidosPRIORIDADDANO: TFloatField;
    qRecibidosCIAINFORMANTE: TFloatField;
    qRecibidosNOMBRECIAINFORMANTE: TStringField;
    qRecibidosCODIGOTIPOVIA: TFloatField;
    qRecibidosCODIGONOMBREVIA: TFloatField;
    qRecibidosMODIFICADORVIA: TStringField;
    qRecibidosDUPLICADOR: TFloatField;
    qRecibidosMODIFICADORDUPLICADOR: TStringField;
    qRecibidosNUMEROPUERTA: TFloatField;
    qRecibidosDireccionCalculada: TStringField;
    Shape5: TShape;
    Label1: TLabel;
    DBText1: TDBText;
    qDictados: TQuery;
    dsDictados: TDataSource;
    qDictadosCODIGOREPORTE: TFloatField;
    qDictadosNOMBREINFORMANTE: TStringField;
    qDictadosTELEFONO: TStringField;
    qDictadosFECHAHORA: TDateTimeField;
    qDictadosFECHAHORADICTADO: TDateTimeField;
    qDictadosTIEMPOTRANSCURRIDO1: TFloatField;
    qDictadosTIEMPODICTADO: TFloatField;
    qDictadosTiempoDictadoReporte: TDateTimeField;
    qDictadosTiempoEnEspera: TDateTimeField;
    qDictadosTiempoEnLlegar: TDateTimeField;
    qDictadosTiempoTranscurrido: TStringField;
    qDictadosTiempoA: TStringField;
    qDictadosTiempoB: TStringField;
    qDictadosTiempoC: TStringField;
    qDictadosCODIGOADMINISTRATIVO: TFloatField;
    qDictadosCODIGOGRUPOTRABAJO: TFloatField;
    qDictadosNOMBREGRUPOTRABAJO: TStringField;
    qDictadosGrupos: TQuery;
    dsDictadosGrupos: TDataSource;
    qDictadosDESCRIPCION: TStringField;
    qDictadosCIGDANO: TFloatField;
    qDictadosDIRECCIONDANO: TStringField;
    qDictadosPRIORIDADDANO: TFloatField;
    qDictadosNOMBRETIPOREPORTE: TStringField;
    qDictadosNOMBRECLASEREPORTE: TStringField;
    qDictadosDireccionCalculada: TStringField;
    qDictadosCODIGOTIPOVIA: TFloatField;
    qDictadosCODIGONOMBREVIA: TFloatField;
    qDictadosMODIFICADORVIA: TStringField;
    qDictadosDUPLICADOR: TFloatField;
    qDictadosMODIFICADORDUPLICADOR: TStringField;
    qDictadosNUMEROPUERTA: TFloatField;
    qDictadosNOMBRESUBESTACION: TStringField;
    qDictadosNOMBRECIRCUITO: TStringField;
    qDictadosCODIGOTRAFODIS: TFloatField;
    qDictadosPINTADOAPOYO: TStringField;
    Label2: TLabel;
    DBText2: TDBText;
    Shape6: TShape;
    Label3: TLabel;
    DBText3: TDBText;
    qAtendidos: TQuery;
    dsAtendidos: TDataSource;
    qAtendidosCODIGOREPORTE: TFloatField;
    qAtendidosNOMBREINFORMANTE: TStringField;
    qAtendidosTELEFONO: TStringField;
    qAtendidosFECHAHORA: TDateTimeField;
    qAtendidosFECHAHORADICTADO: TDateTimeField;
    qAtendidosTIEMPOTRANSCURRIDO1: TFloatField;
    qAtendidosTIEMPODICTADO: TFloatField;
    qAtendidosTIEMPOLLEGADA: TFloatField;
    qAtendidosCODIGOADMINISTRATIVO: TFloatField;
    qAtendidosCODIGOGRUPOTRABAJO: TFloatField;
    qAtendidosNOMBREGRUPOTRABAJO: TStringField;
    qAtendidosDESCRIPCION: TStringField;
    qAtendidosCIGDANO: TFloatField;
    qAtendidosDIRECCIONDANO: TStringField;
    qAtendidosPRIORIDADDANO: TFloatField;
    qAtendidosNOMBRETIPOREPORTE: TStringField;
    qAtendidosNOMBRECLASEREPORTE: TStringField;
    qAtendidosNOMBRESUBESTACION: TStringField;
    qAtendidosNOMBRECIRCUITO: TStringField;
    qAtendidosCODIGOTRAFODIS: TFloatField;
    qAtendidosPINTADOAPOYO: TStringField;
    qAtendidosCODIGOTIPOVIA: TFloatField;
    qAtendidosCODIGONOMBREVIA: TFloatField;
    qAtendidosMODIFICADORVIA: TStringField;
    qAtendidosDUPLICADOR: TFloatField;
    qAtendidosMODIFICADORDUPLICADOR: TStringField;
    qAtendidosNUMEROPUERTA: TFloatField;
    qAtendidosTiempoDictadoTotal: TDateTimeField;
    qAtendidosTiempoEnReparacion: TDateTimeField;
    qAtendidosTiempoTranscurrido: TDateTimeField;
    qAtendidosTiempoA: TStringField;
    qAtendidosTiempoB: TStringField;
    qAtendidosTiempoLlegadaTotal: TDateTimeField;
    qAtendidosFECHAHORALLEGADA: TDateTimeField;
    qAtendidosTiempoEnEspera: TDateTimeField;
    qAtendidosTiempoC: TStringField;
    qAtendidosTiempoD: TStringField;
    Shape7: TShape;
    qAtendidosDireccionCalculada: TStringField;
    Series2: THorizBarSeries;
    Shape8: TShape;
    Label4: TLabel;
    DBText9: TDBText;
    Shape13: TShape;
    Label5: TLabel;
    DBText12: TDBText;
    qAtendidosGrupos: TQuery;
    dsAtendidosGrupos: TDataSource;
    qTerminados: TQuery;
    dsTerminados: TDataSource;
    qTerminadosCODIGOREPORTE: TFloatField;
    qTerminadosNOMBREINFORMANTE: TStringField;
    qTerminadosTELEFONO: TStringField;
    qTerminadosFECHAHORA: TDateTimeField;
    qTerminadosFECHAHORADICTADO: TDateTimeField;
    qTerminadosFECHAHORALLEGADA: TDateTimeField;
    qTerminadosTIEMPOTRANSCURRIDO1: TFloatField;
    qTerminadosTIEMPODICTADO: TFloatField;
    qTerminadosTIEMPOLLEGADA: TFloatField;
    qTerminadosTIEMPOATENDIDO: TFloatField;
    qTerminadosCODIGOADMINISTRATIVO: TFloatField;
    qTerminadosCODIGOGRUPOTRABAJO: TFloatField;
    qTerminadosNOMBREGRUPOTRABAJO: TStringField;
    qTerminadosDESCRIPCION: TStringField;
    qTerminadosCIGDANO: TFloatField;
    qTerminadosDIRECCIONDANO: TStringField;
    qTerminadosPRIORIDADDANO: TFloatField;
    qTerminadosNOMBRETIPOREPORTE: TStringField;
    qTerminadosNOMBRECLASEREPORTE: TStringField;
    qTerminadosNOMBRESUBESTACION: TStringField;
    qTerminadosNOMBRECIRCUITO: TStringField;
    qTerminadosCODIGOTRAFODIS: TFloatField;
    qTerminadosPINTADOAPOYO: TStringField;
    qTerminadosCODIGOTIPOVIA: TFloatField;
    qTerminadosCODIGONOMBREVIA: TFloatField;
    qTerminadosMODIFICADORVIA: TStringField;
    qTerminadosDUPLICADOR: TFloatField;
    qTerminadosMODIFICADORDUPLICADOR: TStringField;
    qTerminadosNUMEROPUERTA: TFloatField;
    qTerminadosTiempoA: TStringField;
    qTerminadosTiempoB: TStringField;
    qTerminadosTiempoC: TStringField;
    qTerminadosDireccionCalculada: TStringField;
    qTerminadosFECHAHORAATENCION: TDateTimeField;
    qTerminadosGrupos: TQuery;
    Shape14: TShape;
    Label6: TLabel;
    Shape24: TShape;
    Label7: TLabel;
    DBText13: TDBText;
    DBText14: TDBText;
    qRecibidosCODIGOTIPODANO: TFloatField;
    procedure qRecibidosCalcFields(DataSet: TDataSet);
    procedure SBFiltrarClick(Sender: TObject);
    procedure qDictadosCalcFields(DataSet: TDataSet);
    procedure DBGRecibidosDblClick(Sender: TObject);
    procedure DBGDictadosDblClick(Sender: TObject);
    procedure qAtendidosCalcFields(DataSet: TDataSet);
    procedure DBCReporteAtendidosTiempoDblClick(Sender: TObject);
    procedure DBCTiemposDictadosDblClick(Sender: TObject);
    procedure DBGAtendidosDblClick(Sender: TObject);
    procedure SBFiltroCarograficoClick(Sender: TObject);
    procedure qTerminadosCalcFields(DataSet: TDataSet);
    procedure DBCTiemposReportesTerminadosDblClick(Sender: TObject);
    procedure DBGTerminadosDblClick(Sender: TObject);
    procedure SBBuscaElementoCartografiaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    Segundos,Minutos,Horas,TiempoFinal : Double;
    //Actualiza el dibujado de una Serie del TChar
    procedure RefrescarSerie(Serie:TChartSeries;DataSet:TDataSet);
    //Abre la forma de captura de datos del reporte en modo edición
    procedure EditarReporte(CodigoReporte:string);
    //Actualiza todos los Querys y los graficos asociados
    procedure RefrescarTodo;
  end;

var
  FListaCentroControl: TFListaCentroControl;

implementation

uses uSeleccionarGrupoTrabajo, uReporte, uAsignarODT;

{$R *.DFM}

procedure TFListaCentroControl.qRecibidosCalcFields(DataSet: TDataSet);
var qDatos:TQuery;
    Direccion:string;
begin
  Direccion:='';
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

  DataSet.FieldByName('DIRECCIONCALCULADA').AsString:=Direccion;
  qDatos.Free;
end;

procedure TFListaCentroControl.SBFiltrarClick(Sender: TObject);
//Retorna la Fecha en formato mes/dia/año hora/minuto/segundo
function FormatoFecha(aFecha:TDateTime):string;
begin
  Result:=FormatDateTime('mm/dd/yyyy hh:mm:ss',aFecha);
end;

var qActualizar:TQuery;
begin
  inherited;
  if (PCLibro.ActivePage = tsRecibidos) and (qRecibidosCODIGOREPORTE.AsString <> '') then
  begin
    FSeleccionarGrupoTrabajo:=TFSeleccionarGrupoTrabajo.Create(Application);
    try
    if FSeleccionarGrupoTrabajo.ShowModal = mrOk then
    begin
      qActualizar:=TQuery.Create(Application);
      qActualizar.DatabaseName:='BaseDato';
      qActualizar.SQL.Add('UPDATE REPORTE SET CODIGOESTADOREPORTE = ''2'',');
      qActualizar.SQL.Add('CODIGOGRUPOTRABAJO = '+FSeleccionarGrupoTrabajo.qGrupoTrabajo.FieldByName('CODIGOGRUPOTRABAJO').AsString+',');
      qActualizar.SQL.Add('FECHAHORADICTADO = TO_DATE('''+FormatoFecha(Now)+''',''MM/DD/YYYY HH24:MI:SS'')');
      qActualizar.SQL.Add('WHERE CODIGOREPORTE = '+ qRecibidosCODIGOREPORTE.AsString);
      qActualizar.ExecSQL;
      qActualizar.Free;
      qRecibidos.Close;
      qRecibidos.Open;
      qTotales.Close;
      qTotales.Open;
      RefrescarSerie(DBCRecibidos.SeriesList.Series[0],qTotales);
      qTotalesTipo.Close;
      qTotalesTipo.Open;
      RefrescarSerie(DBCRecibidosClasificacion.SeriesList.Series[0],qTotalesTipo);
      qDictados.Close;
      qDictados.Open;
      RefrescarSerie(DBCTiemposDictados.SeriesList.Series[0],qDictados);
      RefrescarSerie(DBCTiemposDictados.SeriesList.Series[1],qDictados);
      qDictadosGrupos.Close;
      qDictadosGrupos.Open;
      RefrescarSerie(DBCMovilReporteDictados.SeriesList.Series[0],qDictadosGrupos);
    end;
    finally
      FSeleccionarGrupoTrabajo.Free;
    end;
  end;
end;

procedure TFListaCentroControl.qDictadosCalcFields(DataSet: TDataSet);
begin
 if Now > qDictados.FieldByName('FechaHora').AsDateTime then
  begin
    TiempoFinal := Now - qDictados.FieldByName('FECHAHORA').AsDateTime;
    Horas := Int(TiempoFinal*24);
    Minutos := InT((TiempoFinal*24-Horas)*60);
    Segundos := Int( (((TiempoFinal*24-Horas)*60)-Minutos)*60);
    qDictados.FieldByName('TiempoTranscurrido').AsString := (FloatToStr(Horas)+':'+FloatToStr(Minutos)+':'+FloatToStr(Segundos));

    qDictadosTiempoA.AsString:= FloatToStr(Int(TiempoFinal)) + ' días ' +  (FormatDateTime('hh' + '"h" '+ ':nn' + '"min" '+':ss' + '"seg"', Frac(TiempoFinal)));


    //qDictados.FieldByName('TiempoTranscurrido').AsDateTime := Now - qDictados.FieldByName('FechaHora').AsDateTime;
    qDictados.FieldByName('TiempoEnEspera').AsDateTime := Now-qDictados.FieldByName('FechaHoraDictado').AsDateTime;
    qDictados.FieldByName('TiempoDictadoReporte').AsString := FormatDateTime('hh:mm:ss',qDictados.FieldByName('FechaHoraDictado').AsDateTime - qDictados.FieldByName('FECHAHORA').AsDateTime);
    qDictados.FieldByName('TiempoEnLlegar').AsString := FormatDateTime('hh:mm:ss',Now - qDictados.FieldByName('FechaHoraDictado').AsDateTime);

    TiempoFinal:=qDictados.FieldByName('FechaHoraDictado').AsDateTime - qDictados.FieldByName('FECHAHORA').AsDateTime;
    qDictadosTiempoB.AsString:= FloatToStr(Int(TiempoFinal)) + ' días ' +  (FormatDateTime('hh' + '"h" '+ ':nn' + '"min" '+':ss' + '"seg"', Frac(TiempoFinal)));
    TiempoFinal:=Now - qDictados.FieldByName('FechaHoraDictado').AsDateTime;
    qDictadosTiempoC.AsString:= FloatToStr(Int(TiempoFinal)) + ' días ' +  (FormatDateTime('hh' + '"h" '+ ':nn' + '"min" '+':ss' + '"seg"', Frac(TiempoFinal)));
  end;

  qRecibidosCalcFields(DataSet);

end;

procedure TFListaCentroControl.RefrescarSerie(Serie: TChartSeries;
  DataSet: TDataSet);
begin
  Serie.DataSource:=nil;
  Serie.Clear;
  Serie.DataSource:=DataSet;
end;

procedure TFListaCentroControl.EditarReporte(CodigoReporte: string);
begin
  if CodigoReporte <> '' then
  begin
    if not (Assigned(Application.FindComponent('fReporte') as TForm)) then
       fReporte:=TfReporte.Create(Application);
    fReporte.FormStyle:=fsNormal;
    fReporte.qReporte.Active:=False;
    fReporte.qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE='+
                                CodigoReporte;
    fReporte.qReporte.Active:=True;
    fReporte.qReporte.Edit;
    fReporte.pcDatos.ActivePage:=fReporte.tsFechas;
    if fReporte.ShowModal = mrOk then
       RefrescarTodo;
    fReporte.Free;
  end;
end;

procedure TFListaCentroControl.DBGRecibidosDblClick(Sender: TObject);
begin
  inherited;
  EditarReporte(qRecibidosCODIGOREPORTE.AsString);
end;

procedure TFListaCentroControl.RefrescarTodo;
begin
  qRecibidos.Close;
  qRecibidos.UnPrepare;
  qRecibidos.Open;
  qTotales.Close;
  qTotales.UnPrepare;
  qTotales.Open;
  RefrescarSerie(DBCRecibidos.SeriesList.Series[0],qTotales);
  qTotalesTipo.Close;
  qTotalesTipo.UnPrepare;
  qTotalesTipo.Open;
  RefrescarSerie(DBCRecibidosClasificacion.SeriesList.Series[0],qTotalesTipo);
  qDictados.Close;
  qDictados.UnPrepare;
  qDictados.Open;
  RefrescarSerie(DBCTiemposDictados.SeriesList.Series[0],qDictados);
  RefrescarSerie(DBCTiemposDictados.SeriesList.Series[1],qDictados);
  qDictadosGrupos.Close;
  qDictadosGrupos.UnPrepare;
  qDictadosGrupos.Open;
  RefrescarSerie(DBCMovilReporteDictados.SeriesList.Series[0],qDictadosGrupos);
  qAtendidos.Close;
  qAtendidos.UnPrepare;
  qAtendidos.Open;
  RefrescarSerie(DBCReporteAtendidosTiempo.SeriesList.Series[0],qAtendidos);
  qAtendidosGrupos.Close;
  qAtendidosGrupos.UnPrepare;
  qAtendidosGrupos.Open;
  RefrescarSerie(DBCMovilReporteAtendidos.SeriesList.Series[0],qAtendidosGrupos);
  qTerminados.Close;
  qTerminados.UnPrepare;
  qTerminados.Open;
  RefrescarSerie(DBCTiemposReportesTerminados.SeriesList.Series[0],qTerminados);
  qTerminadosGrupos.Close;
  qTerminadosGrupos.UnPrepare;
  qTerminadosGrupos.Open;
  RefrescarSerie(DBCMovilReportesTerminados.SeriesList.Series[0],qTerminadosGrupos);
end;

procedure TFListaCentroControl.DBGDictadosDblClick(Sender: TObject);
begin
  EditarReporte(qDictadosCODIGOREPORTE.AsString);
end;

procedure TFListaCentroControl.qAtendidosCalcFields(DataSet: TDataSet);
begin
  if Now > DataSet.FieldByName('FechaHORA').AsDateTime then
  begin
    TiempoFinal := Now - DataSet.FieldByName('FechaHORA').AsDateTime;
    Horas := Int(TiempoFinal*24);
    Minutos := InT((TiempoFinal*24-Horas)*60);
    Segundos := Int( (((TiempoFinal*24-Horas)*60)-Minutos)*60);
    //qAtendidos.FieldByName('TiempoTranscurrido').AsString := (FloatToStr(Horas)+':'+FloatToStr(Minutos)+':'+FloatToStr(Segundos));
    qAtendidos.FieldByName('TiempoTranscurrido').AsDateTime:=TiempoFinal;

    qAtendidosTiempoA.AsString:= FloatToStr(Int(TiempoFinal)) + ' días ' +  (FormatDateTime('hh' + '"h" '+ ':nn' + '"min" '+':ss' + '"seg"', Frac(TiempoFinal)));
    qAtendidos.FieldByName('TiempoDictadoTotal').AsDateTime :=qAtendidos.FieldByName('FechaHORADictado').AsDateTime - qAtendidos.FieldByName('FECHAHORA').AsDateTime;
    TiempoFinal:=qAtendidos.FieldByName('TiempoDictadoTotal').AsDateTime;
    qAtendidosTiempoB.AsString:= FloatToStr(Int(TiempoFinal)) + ' días ' +  (FormatDateTime('hh' + '"h" '+ ':nn' + '"min" '+':ss' + '"seg"', Frac(TiempoFinal)));

    qAtendidos.FieldByName('TiempoLlegadaTotal').AsDateTime :=qAtendidos.FieldByName('FechaHORALlegada').AsDateTime - qAtendidos.FieldByName('FechaHORADictado').AsDateTime;
    TiempoFinal:=qAtendidos.FieldByName('TiempoLlegadaTotal').AsDateTime;
    qAtendidosTiempoC.AsString:=FloatToStr(Int(TiempoFinal)) + ' días ' +  (FormatDateTime('hh' + '"h" '+ ':nn' + '"min" '+':ss' + '"seg"', Frac(TiempoFinal)));

    qAtendidos.FieldByName('TiempoEnEspera').AsDateTime := Now-qAtendidos.FieldByName('FechaHORA').AsDateTime;
    qAtendidos.FieldByName('TiempoEnReparacion').AsDateTime :=Now-qAtendidos.FieldByName('FechaHORALlegada').AsDateTime;
    TiempoFinal:=qAtendidos.FieldByName('TiempoEnReparacion').AsDateTime;
    qAtendidosTiempoD.AsString:=FloatToStr(Int(TiempoFinal)) + ' días ' +  (FormatDateTime('hh' + '"h" '+ ':nn' + '"min" '+':ss' + '"seg"', Frac(TiempoFinal)));
  end;
  qRecibidosCalcFields(DataSet);
end;

procedure TFListaCentroControl.DBCReporteAtendidosTiempoDblClick(
  Sender: TObject);
begin
  inherited;
  EditChart(Self,DBCReporteAtendidosTiempo);
end;

procedure TFListaCentroControl.DBCTiemposDictadosDblClick(Sender: TObject);
begin
  inherited;
  EditChart(Self,DBCTiemposDictados);
end;

procedure TFListaCentroControl.DBGAtendidosDblClick(Sender: TObject);
begin
  EditarReporte(qAtendidosCODIGOREPORTE.AsString);
end;

procedure TFListaCentroControl.SBFiltroCarograficoClick(Sender: TObject);
begin
  RefrescarTodo;
end;

procedure TFListaCentroControl.qTerminadosCalcFields(DataSet: TDataSet);
begin
  if Now > DataSet.FieldByName('FechaHORA').AsDateTime then
  begin
    TiempoFinal:=qTerminados.FieldByName('TiempoAtendido').AsFloat;
    qTerminadosTiempoC.AsString:= FloatToStr(Int(TiempoFinal)) + ' días ' +  (FormatDateTime('hh' + '"h" '+ ':nn' + '"min" '+':ss' + '"seg"', Frac(TiempoFinal)));
    TiempoFinal:=qTerminados.FieldByName('TiempoLlegada').AsFloat;
    qTerminadosTiempoB.AsString:= FloatToStr(Int(TiempoFinal)) + ' días ' +  (FormatDateTime('hh' + '"h" '+ ':nn' + '"min" '+':ss' + '"seg"', Frac(TiempoFinal)));
    TiempoFinal:=qTerminados.FieldByName('TiempoDictado').AsFloat;
    qTerminadosTiempoA.AsString:= FloatToStr(Int(TiempoFinal)) + ' días ' +  (FormatDateTime('hh' + '"h" '+ ':nn' + '"min" '+':ss' + '"seg"', Frac(TiempoFinal)));
  end;
  qRecibidosCalcFields(DataSet);
end;

procedure TFListaCentroControl.DBCTiemposReportesTerminadosDblClick(
  Sender: TObject);
begin
  inherited;
  EditChart(Self,DBCTiemposReportesTerminados);
end;

procedure TFListaCentroControl.DBGTerminadosDblClick(Sender: TObject);
begin
  EditarReporte(qTerminadosCODIGOREPORTE.AsString);
end;

procedure TFListaCentroControl.SBBuscaElementoCartografiaClick(
  Sender: TObject);

function GenerarImpreso(ODT,Consecutivo:string): string;
var i:Integer;
    s1:string;
begin
    Result:='';
    s1:=ODT;
    for i:=5 downto Length(s1) do
       Result:='0' + Result;
    Result:=Result + s1 + '-' + Consecutivo;
end;

var i, Consecutivo:Integer;
    qInsertar, qDatos:TQuery;
    ODT:string;
    Cadena1,Cadena2:string;
    Repetir:Boolean;
begin
  if PCLibro.ActivePage = tsTerminado then
  begin
    qInsertar:=TQuery.Create(Application);
    qInsertar.DatabaseName:='BaseDato';
    qDatos:=TQuery.Create(Application);
    qDatos.DatabaseName:='BaseDato';
    FAsignarODT:=TFAsignarODT.Create(Application);
    if FAsignarODT.ShowModal = mrOk then
    begin
      ODT:=FAsignarODT.EdNumeroODT.Text;
      if ODT = '' then
        ODT:='-1';
      if DBGTerminados.SelectedRows.Count > 0 then
      for i:=0 to DBGTerminados.SelectedRows.Count-1 do
      begin
           qTerminados.BookMark:=DBGTerminados.SelectedRows.Items[i];
           if (DBGTerminados.Fields[0].Text<>'') then
           begin
             qDatos.Close;
             qDatos.SQL.Text:='SELECT MAX(CONSECUTIVO) FROM ODTREPORTE WHERE CODIGOODT = ' + ODT;
             qDatos.Open;
             if ODT <> '-1' then
               Consecutivo:=qDatos.Fields[0].AsInteger
             else
               Consecutivo:=i;

             Repetir:=True;
             while (Repetir) do
             begin
               qDatos.Close;
               qDatos.SQL.Clear;
               qDatos.SQL.Text:='SELECT COUNT(*) FROM ODTDIA WHERE CODIGOODT = ' + ODT + ' AND CONSECUTIVO = ' + IntToStr(Consecutivo+1);
               qDatos.Open;
               if qDatos.Fields[0].AsInteger = 0 then
                 Repetir:=False
               else
                 Inc(Consecutivo);  
             end;
             qInsertar.Close;
             qInsertar.SQL.Clear;
             qInsertar.SQL.Text:='INSERT INTO ODTREPORTE VALUES('+ODT+',' + IntToStr(Consecutivo+1) + ','+qTerminadosCODIGOREPORTE.AsString+')';
             qInsertar.ExecSQL;
             if ODT <> '-1' then
             begin
               qInsertar.Close;
               qInsertar.SQL.Clear;
               Cadena1:='INSERT INTO ODTDIA(CODIGOODT, CONSECUTIVO, IMPRESOODT, CODIGOGEOGRAFICO ';
               Cadena2:=' VALUES ('+ ODT + ',' + IntToStr(Consecutivo+1) + ',''' + GenerarImpreso(ODT,IntToStr(Consecutivo+1)) + ''','+ qTerminadosCIGDANO.AsString;
               if qTerminadosCODIGOTIPOVIA.AsString <> '' then
               begin
                 Cadena1:=Cadena1 + ' ,CODIGOTIPOVIA';
                 Cadena2:=Cadena2 + ','+qTerminadosCODIGOTIPOVIA.AsString;
               end;
               if qTerminadosCODIGONOMBREVIA.AsString <> '' then
               begin
                 Cadena1:=Cadena1 + ' ,CODIGONOMBREVIA';
                 Cadena2:=Cadena2 + ',' + qTerminadosCODIGONOMBREVIA.AsString;
               end;
               if qTerminadosMODIFICADORVIA.AsString <> '' then
               begin
                 Cadena1:=Cadena1 + ',MODIFICADORVIA';
                 Cadena2:=Cadena2 + ',''' + qTerminadosMODIFICADORVIA.AsString + '''';
               end;
               if qTerminadosDUPLICADOR.AsString <> '' then
               begin
                 Cadena1:=Cadena1 + ',DUPLICADOR';
                 Cadena2:=Cadena2 + ',' + qTerminadosDUPLICADOR.AsString;
               end;
               if qTerminadosMODIFICADORDUPLICADOR.AsString <> '' then
               begin
                 Cadena1:=Cadena1 + ',MODIFICADORDUPLICADOR';
                 Cadena2:=Cadena2 + ',''' + qTerminadosMODIFICADORDUPLICADOR.AsString + '''';
               end;
               if qTerminadosNUMEROPUERTA.AsString <> '' then
               begin
                 Cadena1:=Cadena1 + ',NUMEROPUERTA';
                 Cadena2:=Cadena2 + ',''' + qTerminadosNUMEROPUERTA.AsString + '''';
               end;
               if qTerminadosCODIGOGRUPOTRABAJO.AsString <> '' then
               begin
                 Cadena1:=Cadena1 + ',CODIGOGRUPOTRABAJO';
                 Cadena2:=Cadena2 + ',' + qTerminadosCODIGOGRUPOTRABAJO.AsString;
               end;
               Cadena1:=Cadena1 + ')';
               Cadena2:=Cadena2 + ')';
               qInsertar.SQL.Text:=Cadena1 + Cadena2;
               qInsertar.SQL.SaveToFile('C:\sqlInsertarODT.txt');
               qInsertar.ExecSQL;
             end;
           end;
      end;
      RefrescarTodo;
    end;
    qInsertar.Free;
    qDatos.Free;
    FAsignarODT.Free;
  end;
end;

end.
