//***************************************************************************
//                       Módulo de hoja de vida de equipos
//       A través de este listado se consulta el historial de la hve
//***************************************************************************
unit uHojaVidaEquipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls, interexcel,
  UtdNavigator, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls, Mask, RXSplit,
  Menus, MPlayer,shellapi,comObj;

type
  TfHojaVidaEquipo = class(TFdSgdListaBase)
    sbEditarFormato: TSpeedButton;
    dsFormatoDatos: TDataSource;
    qSeccionDatos: TQuery;
    qFormatoDatos: TQuery;
    dsSeccionDatos: TDataSource;
    sbInsertarFormato: TSpeedButton;
    Panel5: TPanel;
    dbgListaHijas: TRxDBGrid;
    Panel4: TPanel;
    Panel8: TPanel;
    dNavigator2: TdNavigator;
    dbgListaOdtPadre: TRxDBGrid;
    RxSplitter1: TRxSplitter;
    pmImprimir: TPopupMenu;
    qSeccionDatosCODIGOSECCIONFORMATODATOS: TFloatField;
    qSeccionDatosCODIGOFORMATOMTTODATOS: TFloatField;
    qSeccionDatosCODIGOSECCIONFORMATO: TFloatField;
    sbRefrescar: TSpeedButton;
    qFormatoDatosCODIGOFORMATOMTTODATOS: TFloatField;
    qFormatoDatosCODIGOADMINISTRATIVO: TFloatField;
    qFormatoDatosCODIGOUSUARIOCREACION: TFloatField;
    qFormatoDatosFECHACREACION: TDateTimeField;
    qFormatoDatosCODIGOUSUARIOMODIFICACION: TFloatField;
    qFormatoDatosFECHAULTIMAMODIFICACION: TDateTimeField;
    qSeccionDatosNOMBRESECCIONFORMATO: TStringField;
    StoredProc1: TStoredProc;
    qFormatoDatosCODIGOFORMATOMTTO: TFloatField;
    qFormatoDatosCODIGOAMBITO: TFloatField;
    qFormatoDatosCODIGOSUBESTACION: TStringField;
    qFormatoDatosCODIGOCOORDINACION: TFloatField;
    qFormatoDatosCODIGOTIPOMTTO: TFloatField;
    qFormatoDatosCODIGOTIPOELEMENTO: TFloatField;
    qFormatoDatosCODIGOCIRCUITO: TStringField;
    Panel6: TPanel;
    sbInsertarSeccion: TSpeedButton;
    sbEditarSeccion: TSpeedButton;
    SpeedButton4: TSpeedButton;
    dNavigator3: TdNavigator;
    qFormatoDatosCODIGOELEMENTO: TStringField;
    qFormatoDatosFECHAPRUEBA: TDateTimeField;
    qSeccionDatosCODIGOODT: TFloatField;
    qSeccionDatosSUBACTIVIDADODT: TFloatField;
    qSeccionDatosESTADOTERMINADO: TStringField;
    qSeccionDatosFECHAREGISTRO: TDateTimeField;
    qSeccionDatosFECHAMODIFICACION: TDateTimeField;
    qSeccionDatosFECHAPRUEBA: TDateTimeField;
    qSeccionDatosCODIGOUSUARIOCREACION: TFloatField;
    qSeccionDatosCODIGOUSUARIOMODIFICACION: TFloatField;
    qFormatoDatosCLELEMENTO1: TStringField;
    qFormatoDatosCLELEMENTO2: TStringField;
    qFormatoDatosCODIGOODT: TFloatField;
    qFormatoDatosCONSECUTIVOODT: TFloatField;
    Panel7: TPanel;
    PanelSuperior: TPanel;
    RxDBGConsultaHojaVidaEquipo: TRxDBGrid;
    qMantenimientos: TQuery;
    qMantenimientosCODIGOTAREA: TFloatField;
    qMantenimientosFECHAINICIAL: TDateTimeField;
    qMantenimientosFECHAFINAL: TDateTimeField;
    qMantenimientosNOMBRETAREA: TStringField;
    qMantenimientosCODIGOMANTENIMIENTO: TFloatField;
    qMantenimientosCODIGOTIPOMANT: TFloatField;
    qMantenimientosNOMBREMANT: TStringField;
    qMantenimientosNOMBRETIPOELEMENTO: TStringField;
    qMantenimientosNOMBRESUBESTACION: TStringField;
    qMantenimientosTENSION: TFloatField;
    qMantenimientosNOMBREESTADO: TStringField;
    dsMantenimientos: TDataSource;
    qFormatosPruebas: TQuery;
    qFormatosPruebasCODIGOFORMATOMTTODATOS: TFloatField;
    qFormatosPruebasCODIGOFORMATOMTTO: TFloatField;
    qFormatosPruebasCODIGOADMINISTRATIVO: TFloatField;
    qFormatosPruebasCODIGOUSUARIOCREACION: TFloatField;
    qFormatosPruebasFECHACREACION: TDateTimeField;
    qFormatosPruebasCODIGOUSUARIOMODIFICACION: TFloatField;
    qFormatosPruebasFECHAULTIMAMODIFICACION: TDateTimeField;
    qFormatosPruebasCODIGOAMBITO: TFloatField;
    qFormatosPruebasCODIGOSUBESTACION: TStringField;
    qFormatosPruebasCODIGOCOORDINACION: TFloatField;
    qFormatosPruebasCODIGOTIPOMTTO: TFloatField;
    qFormatosPruebasCODIGOTIPOELEMENTO: TFloatField;
    qFormatosPruebasCODIGOELEMENTO: TStringField;
    qFormatosPruebasCODIGOCIRCUITO: TStringField;
    qFormatosPruebasFECHAPRUEBA: TDateTimeField;
    qFormatosPruebasCLELEMENTO1: TStringField;
    qFormatosPruebasCLELEMENTO2: TStringField;
    qFormatosPruebasCODIGOODT: TFloatField;
    qFormatosPruebasCONSECUTIVOODT: TFloatField;
    qFormatosPruebasCODIGOMANTENIMIENTO: TFloatField;
    dsFormatosPruebas: TDataSource;
    qMantenimientoODT: TQuery;
    dsMantenimientoODT: TDataSource;
    qFormato: TQuery;
    qFormatoCODIGOFORMATOMTTO: TFloatField;
    qFormatoNOMBREFORMATOMTTO: TStringField;
    dsFormato: TDataSource;
    qMantenimientosCODIGOODT: TFloatField;
    qMantenimientosCONSECUTIVO: TFloatField;
    qFormatocodigoMantenimiento: TFloatField;
    qFormatocodigoFormatoDatos: TIntegerField;
    qSubestacion: TQuery;
    qSubestacionCODIGOSUBESTACION: TStringField;
    qSubestacionNOMBRESUBESTACION: TStringField;
    dsSubestacion: TDataSource;
    qFormatoDatosCODIGOHOJAVIDAEQUIPO: TFloatField;
    qFormatoDatosCODIGOMANTENIMIENTO: TFloatField;
    qFormatoDatosnombreSubestacion: TStringField;
    qSubactividad: TQuery;
    qSubactividadCODIGOSUBACTIVIDADAREAODT: TFloatField;
    dsSubactividad: TDataSource;
    qFormatoDatosnombreFormato: TStringField;
    qSecciones: TQuery;
    dsSecciones: TDataSource;
    qSeccionDatosCODIGOFORMATOMTTO: TFloatField;
    SpeedButton1: TSpeedButton;
    pmOrdenar: TPopupMenu;
    CodigoMtto: TMenuItem;
    NombreMantenimiento: TMenuItem;
    TipoMantenimiento: TMenuItem;
    Coordinacion: TMenuItem;
    N1: TMenuItem;
    FechaInicialMtto: TMenuItem;
    FechaFinalMtto: TMenuItem;
    EstadoMtto: TMenuItem;
    N3: TMenuItem;
    TipoElemento: TMenuItem;
    Tension: TMenuItem;
    Subestacion: TMenuItem;
    Bevel5: TBevel;
    qMantenimientoselemento: TStringField;
    qElementoMtto: TQuery;
    Memo2: TMemo;
    qElementoMttoCODIGOELEMENTOMANTENIMIENTO: TFloatField;
    qElementoMttoCLELEMENTO1: TStringField;
    qElementoMttoCLELEMENTO2: TStringField;
    qElementoMttoCODIGOELEMENTO: TFloatField;
    procedure dbgListaOdtPadreGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure dbgListaOdtPadreDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgListaHijasDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure SBImprimirClick(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sbRefrescarClick(Sender: TObject);
    procedure sbEditarFormatoClick(Sender: TObject);
    procedure sbEditarSeccionClick(Sender: TObject);
    procedure sbInsertarSeccionClick(Sender: TObject);
    procedure sbInsertarFormatoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGConsultaHojaVidaEquipoDblClick(Sender: TObject);
    procedure qFormatoDatosCalcFields(DataSet: TDataSet);
    procedure SBFiltroCarograficoClick(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
    procedure SBOrdenarClick(Sender: TObject);
    procedure CodigoMttoClick(Sender: TObject);
    procedure NombreMantenimientoClick(Sender: TObject);
    procedure TipoMantenimientoClick(Sender: TObject);
    procedure FechaInicialMttoClick(Sender: TObject);
    procedure FechaFinalMttoClick(Sender: TObject);
    procedure EstadoMttoClick(Sender: TObject);
    procedure TipoElementoClick(Sender: TObject);
    procedure TensionClick(Sender: TObject);
    procedure SubestacionClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure SBEstadisticaClick(Sender: TObject);
    procedure SBBuscaElementoCartografiaClick(Sender: TObject);
    procedure qMantenimientosCalcFields(DataSet: TDataSet);
    procedure consultarElemento(codigotipoelemento:string);
  private
    { Private declarations }
    Formatos_Excel: eduexcel;
    ListaDireccionCampos:TStringList;
    Year, Month, Day, Hour, Min, Sec, MSec: Word;
    Present: TDateTime;
  public
    { Public declarations }
    sCriterio : String;
    index:Integer;
    Lista,ListaEstadistica,ListaFrom : TStringList;
    procedure Filtrar;
    procedure LimpiarFiltro;
    procedure Ordenar(sCriterio:String);
  end;
var
  fHojaVidaEquipo: TfHojaVidaEquipo;

implementation

uses UFormatoMttoDatos, uElementosAsociadosODT, uQRListaODTViaticos,
  uQRListaODTAuxilios, USeccionFormatoDatos, UFormatoMttoImprirmir,
  ufiltroMantenimientoAnterior, UFormatoMttoDatosODT,
  USeccionFormatoDatosODT, ufiltroMantenimiento, uBusquedaMtto,
  UQRMttosRealizadosHV, UQREquipoHV;

  {$R *.DFM}

procedure TfHojaVidaEquipo.dbgListaOdtPadreGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
{ if (Field.FieldName='NOMBREESTADOODT') and (qListaODTPadreCODIGOESTADOODT.AsString <> '') then
  begin

     case qListaODTPadreCODIGOESTADOODT.AsInteger of
        1: begin
           Background:=clYellow;
           AFont.Color:=clBlue;
           end;
        2:Background:=65280;
        6:Background:=8421376;
     end;
  end;
}
end;

procedure TfHojaVidaEquipo.FormDestroy(Sender: TObject);
begin
 ListaFrom.Free;
 ListaEstadistica.Free;
end;

procedure TfHojaVidaEquipo.dbgListaOdtPadreDblClick(Sender: TObject);
{var
qDatos,qformatos:TQuery;}
begin
  if qFormatoDatosCODIGOFORMATOMTTODATOS.AsString <>'' then
  begin
    FFormatoMttoDatosODT:=TFFormatoMttoDatosODT.Create(Application);
    FFormatoMttoDatosODT.mttoanterior:=false;
    FFormatoMttoDatosODT.baceptar.Enabled:= false;
    qFormatosPruebas.Open;
    if FFormatoMttoDatosODT.qMantenimientoDatos.Active then
      FFormatoMttoDatosODT.qMantenimientoDatos.close;
    FFormatoMttoDatosODT.qMantenimientoDatos.ParamByName('CODIGOMANTENIMIENTO').AsFloat:= qFormatoDatosCODIGOMANTENIMIENTO.AsFloat;
    FFormatoMttoDatosODT.qMantenimientoDatos.Open;
      ////  ELEMENTO
    if FFormatoMttoDatosODT.qPmelemento.Active then
      FFormatoMttoDatosODT.qPmelemento.Close;
    FFormatoMttoDatosODT.qPmelemento.ParamByName('CODIGOELEMENTOMANTENIMIENTO').AsFloat:= qFormatoDatosCODIGOMANTENIMIENTO.AsFloat;
    FFormatoMttoDatosODT.qPmelemento.Open;
    try
      FFormatoMttoDatosODT.qFormatoDatos.Close;
      FFormatoMttoDatosODT.qFormatoDatos.SQL.Text:='SELECT * FROM HVE_FORMATOMTTODATOS WHERE CODIGOFORMATOMTTODATOS = ' + qFormatoDatosCODIGOFORMATOMTTODATOS.AsString;
      FFormatoMttoDatosODT.qFormatoDatos.Open;
      FFormatoMttoDatosODT.qFormatoDatos.Edit;
      FFormatoMttoDatosODT.CODIGOFORMATOMANTENIMIENTO:=  qFormatoDatosCODIGOFORMATOMTTO.AsString;
      if FFormatoMttoDatosODT.ShowModal=MrOK then
      begin
        qFormatoDatos.close;
        qFormatoDatos.open;
      end
    finally
      FFormatoMttoDatosODT.Free;
    end;
  end








{  if qFormatosPruebas.Active then
    qFormatosPruebas.Close;
  qFormatosPruebas.ParamByName('CODIGOODT').AsInteger:= qMantenimientosCODIGOODT.AsInteger;
  qFormatosPruebas.ParamByName('CONSECUTIVOODT').AsInteger:=qMantenimientosCONSECUTIVO.AsInteger;
  qFormatosPruebas.ParamByName('CODIGOFORMATOMTTO').AsInteger:=qFormatoCODIGOFORMATOMTTO.AsInteger;
  qFormatosPruebas.Open;
  if qFormatosPruebasCODIGOFORMATOMTTODATOS.AsString <>'' then
  begin
    FFormatoMttoDatos:=TFFormatoMttoDatos.Create(Application);
    FFormatoMttoDatos.hojavida:=true;
    FFormatoMttoDatos.Panel1.Enabled:=false;
    FFormatoMttoDatos.Panel2.Enabled:=false;
//    FFormatoMttoDatos.mttoanterior:=true;
    qFormatosPruebas.Open;
    if FFormatoMttoDatos.qMantenimientoDatos.Active then
      FFormatoMttoDatos.qMantenimientoDatos.close;
    FFormatoMttoDatos.qMantenimientoDatos.ParamByName('CODIGOMANTENIMIENTO').AsFloat:= qMantenimientosCODIGOMANTENIMIENTO.AsFloat;
    FFormatoMttoDatos.qMantenimientoDatos.Open;
      ////  ELEMENTO
    if FFormatoMttoDatos.qPmelemento.Active then
      FFormatoMttoDatos.qPmelemento.Close;
    FFormatoMttoDatos.qPmelemento.ParamByName('CODIGOELEMENTOMANTENIMIENTO').AsFloat:= qMantenimientosCODIGOMANTENIMIENTO.AsFloat;
    FFormatoMttoDatos.qPmelemento.Open;

    try
      FFormatoMttoDatos.qFormatoDatos.Close;
      FFormatoMttoDatos.qFormatoDatos.SQL.Text:='SELECT * FROM HVE_FORMATOMTTODATOS WHERE CODIGOFORMATOMTTODATOS = ' + qFormatosPruebasCODIGOFORMATOMTTODATOS.AsString;
      FFormatoMttoDatos.qFormatoDatos.Open;

      if FFormatoMttoDatos.ShowModal=MrOK then
      begin
        qFormatosPruebas.Close;
      end;
//      else
   finally
      FFormatoMttoDatos.Free;
    end;

  end; }
end;

procedure TfHojaVidaEquipo.FormShow(Sender: TObject);
begin
  Filtrar;
end;

procedure TfHojaVidaEquipo.dbgListaHijasDblClick(Sender: TObject);
var qDatos,qformatos,qrDatos:TQuery;
begin
//  qPruebasProgramadas.Open;
qSeccionDatos.Open;//agregué
{
  if qFormatosPruebas.Active then
    qFormatosPruebas.Close;
  qFormatosPruebas.ParamByName('CODIGOODT').AsInteger:= qMantenimientosCODIGOODT.AsInteger;
  qFormatosPruebas.ParamByName('CONSECUTIVOODT').AsInteger:=qMantenimientosCONSECUTIVO.AsInteger;
  qFormatosPruebas.ParamByName('CODIGOFORMATOMTTO').AsInteger:=qFormatoCODIGOFORMATOMTTO.AsInteger;  }
  qFormatosPruebas.Open;
  qDatos:=TQuery.Create(Application);
  qDatos.DatabaseName:='BaseDato';
  qDatos.SQL.Add('SELECT CODIGOSECCIONFORMATODATOS FROM HVE_SECCIONFORMATODATOS ');
  qDatos.SQL.Add(' WHERE CODIGOFORMATOMTTODATOS='+ qFormatosPruebasCODIGOFORMATOMTTODATOS.AsString);
  qDatos.SQL.Add(' AND CODIGOSECCIONFORMATO='+ qSeccionDatosCODIGOSECCIONFORMATO.AsString);
  qDatos.Open;
  if qDatos.Fields[0].AsString <>'' then
  begin
    FSeccionFormatoDatos:=TFSeccionFormatoDatos.Create(Application);
    FSeccionFormatoDatos.bAceptar.Enabled:= false;
    FSeccionFormatoDatos.Panel8.Enabled:=false;
    FSeccionFormatoDatos.RxDBGrid1.ReadOnly:=true;
    FSeccionFormatoDatos.dbgMedidas.ReadOnly:=true;
    //FSeccionFormatoDatos.dbgMedidas.Enabled:=false;
    qFormatosPruebas.Open;

    FSeccionFormatoDatos.Edit2.Text:= qFormatosPruebasCODIGOODT.AsString;
    FSeccionFormatoDatos.Edit3.Text:= qFormatosPruebasCONSECUTIVOODT.AsString;
    qrDatos:=TQuery.Create(Application);
    qrDatos.DatabaseName:='BaseDato';
    //  qrDatos.Tag:=99;
    qrDatos.SQL.Add('SELECT NOMBREFORMATOMTTO FROM HVE_FORMATOMTTO WHERE CODIGOFORMATOMTTO='+ qFormatosPruebasCODIGOFORMATOMTTO.AsString);
    qrDatos.Open;
    FSeccionFormatoDatos.EFormato.text:=qrDatos.Fields[0].AsString;
    qrDatos.Close;
    qrDatos.SQL.Clear;
    try
      FSeccionFormatoDatos.qSeccionDatos.Close;
      FSeccionFormatoDatos.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS='+qDatos.Fields[0].AsString;
      FSeccionFormatoDatos.qSeccionDatos.Open;
      FSeccionFormatoDatos.Edit1.Text:=FSeccionFormatoDatos.qSeccionDatosNombreSubactividad.AsString;
    //  qrDatos.Tag:=99;
      qrDatos.SQL.Add('SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO ='+ FSeccionFormatoDatos.qSeccionDatosCODIGOUSUARIOCREACION.AsString);
      qrDatos.Open;
      FSeccionFormatoDatos.Edit4.text:=qrDatos.Fields[0].AsString;
      qrDatos.SQL.Clear;
      FSeccionFormatoDatos.CrearTablaTemporalMedidas;
      FSeccionFormatoDatos.CargarTablaTemporalMedidas;
      if FSeccionFormatoDatos.ShowModal=MrOK then
      begin
        qFormatosPruebas.Close;
      end;
    finally
        FSeccionFormatoDatos.Free;
    end;
  end;
  qDatos.Free;
  qrDatos.Free;
end;

procedure TfHojaVidaEquipo.FormCreate(Sender: TObject);
begin
  inherited;
  ListaFrom := TStringList.Create;
  index:=0;

  qMantenimientos.Open;
   if qMantenimientos.RecordCount <> 1 then
    PanelSuperior.Caption := 'MANTENIMIENTOS REALIZADOS     << ' + inttostr(qMantenimientos.recordcount)+' Registros Encontrados >>'
  else PanelSuperior.Caption := 'MANTENIMIENTOS REALIZADOS     << ' +inttostr(qMantenimientos.recordcount)+' Registro Encontrado >>';
  qFormatoDatos.Close;
  qFormatoDatos.Open;
  qSeccionDatos.Close;
  qSeccionDatos.Open;
  qFormato.Open;
  qSecciones.Open;
  
  ListaDireccionCampos:=TStringList.Create;
  ListaDireccionCampos.Add('CODIGOMTTO=-1');
  ListaDireccionCampos.Add('NOMBREMANTENIMIENTO=-1');
  ListaDireccionCampos.Add('TIPOMANTENIMIENTO=-1');
//  ListaDireccionCampos.Add('COORDINACION=-1');
  ListaDireccionCampos.Add('FECHAINICIALMTTO=-1');
  ListaDireccionCampos.Add('FECHAFINALMTTO=-1');
  ListaDireccionCampos.Add('ESTADOMTTO=-1');
  ListaDireccionCampos.Add('TIPOELEMENTO=-1');
  ListaDireccionCampos.Add('TENSION=-1');
  ListaDireccionCampos.Add('SUBESTACION=-1');
  ListaDireccionCampos.Add('ELEMENTO=-1');
end;

procedure TfHojaVidaEquipo.Filtrar;
begin
end;

procedure TfHojaVidaEquipo.LimpiarFiltro;
var
 nLineasExtra,i: Byte;
begin
 nLineasExtra := qFormatoDatos.SQL.Count-3;
 if nLineasExtra > 0 then
    for i:=1 to nLineasExtra do
     begin
      qFormatoDatos.SQL.Delete(2);
      qTotales.SQL.Delete(2);
     end;
end;

procedure TfHojaVidaEquipo.SBFiltrarClick(Sender: TObject);
begin
 { fFiltroMantenimiento:=TfFiltroMantenimiento.Create(Application);
  fFiltroMantenimiento.ShowModal;
  fFiltroMantenimiento.Free;   }
  fFiltroMantenimiento:=TfFiltroMantenimiento.Create(Application);
  fFiltroMantenimiento.ShowModal;
  fFiltroMantenimiento.DBLCBEstadoMtto.KeyValue:=2;
  qMantenimientos.SQL.Clear;
  qMantenimientos.Close;
  qMantenimientos.sql.text:=fFiltroMantenimiento.qmantenimientos.sql.text;
  qMantenimientos.Open;
  if qMantenimientos.RecordCount <> 1 then
    PanelSuperior.Caption := 'MANTENIMIENTOS REALIZADOS     << ' + inttostr(qMantenimientos.recordcount)+' Registros Encontrados >>'
  else PanelSuperior.Caption := 'MANTENIMIENTOS REALIZADOS     << ' +inttostr(qMantenimientos.recordcount)+' Registro Encontrado >>';
  qFormatoDatos.Close;
  qFormatoDatos.Open;
  qSeccionDatos.Close;
  qSeccionDatos.Open;
  fFiltroMantenimiento.Free;
end;

procedure TfHojaVidaEquipo.SBFiltroCarograficoClick(Sender: TObject);
begin
  inherited;
  ShellExecute(Handle,'open',pchar('E:\HISTORIAL\historial.xls'),nil,nil,SW_SHOW);
end;

procedure TfHojaVidaEquipo.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
{  if Field.FieldName='NOMBREESTADOREPORTE' then
  begin
     Background:=qReporte.FieldByName('COLOR').AsInteger;
     if BackGround = 0 then BackGround := clWhite;
  end;}
end;

procedure TfHojaVidaEquipo.sbRefrescarClick(Sender: TObject);
begin
  inherited;
  qFormatoDatos.Close;
  qFormatoDatos.Open;
  qSeccionDatos.close;
  qSeccionDatos.Open;
end;
procedure TfHojaVidaEquipo.sbEditarFormatoClick(
  Sender: TObject);
begin
  inherited;
  FFormatoMttoDatos:=TFFormatoMttoDatos.Create(Application);
  try
    FFormatoMttoDatos.qFormatoDatos.Close;
    FFormatoMttoDatos.qFormatoDatos.SQL.Text:='SELECT * FROM HVE_FORMATOMTTODATOS WHERE CODIGOFORMATOMTTODATOS = ' + qFormatoDatosCODIGOFORMATOMTTODATOS.AsString;
    FFormatoMttoDatos.qFormatoDatos.Open;
    FFormatoMttoDatos.qFormatoDatos.Edit;
    if FFormatoMttoDatos.ShowModal=MrOK then
    begin
      FFormatoMttoDatos.qFormatoDatos.Database.Commit;
      qFormatoDatos.Close;
      qFormatoDatos.Open;
      qFormatoDatos.Locate('CODIGOFORMATOMTTODATOS',(FFormatoMttoDatos.qFormatoDatosCODIGOFORMATOMTTODATOS.AsInteger),[]);
    end
 finally
    FFormatoMttoDatos.Free;
  end;
end;

procedure TfHojaVidaEquipo.sbEditarSeccionClick(
  Sender: TObject);
begin
  inherited;
  FSeccionFormatoDatos:=TFSeccionFormatoDatos.Create(Application);
  try
    FSeccionFormatoDatos.qSeccionDatos.Close;
    FSeccionFormatoDatos.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS = ' + qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
    FSeccionFormatoDatos.qSeccionDatos.Open;
    FSeccionFormatoDatos.qSeccionDatos.Edit;
    if not FSeccionFormatoDatos.qSeccionDatos.Database.InTransaction then
       FSeccionFormatoDatos.qSeccionDatos.Database.StartTransaction;
    if FSeccionFormatoDatos.ShowModal=MrOK then
    begin
      FSeccionFormatoDatos.qSeccionDatos.Database.Commit;
      qSeccionDatos.Close;
      qSeccionDatos.Open;
      with FSeccionFormatoDatos do
      qFormatoDatos.Locate('CODIGOFORMATOMTTODATOS',(qFormatoDatosCODIGOFORMATOMTTODATOS.AsInteger),[]);
    end
    else
      FSeccionFormatoDatos.qSeccionDatos.Database.Rollback;
 finally
    FSeccionFormatoDatos.Free;
  end;
end;

procedure TfHojaVidaEquipo.sbInsertarSeccionClick(
  Sender: TObject);
  var qDatos:TQuery;
begin
  inherited;
  FSeccionFormatoDatos:=TFSeccionFormatoDatos.Create(Application);
  qDatos:=TQuery.Create(self);
  qDatos.DatabaseName:='BaseDato';
  try
    FSeccionFormatoDatos.qSeccionDatos.Close;
    FSeccionFormatoDatos.qSeccionDatos.Open;
    FSeccionFormatoDatos.qSeccionDatos.Insert;
    FSeccionFormatoDatos.qSeccionDatosCODIGOFORMATOMTTODATOS.AsString:=qFormatoDatosCODIGOFORMATOMTTODATOS.AsString;
    FSeccionFormatoDatos.qSeccionDatos.Post;
    FSeccionFormatoDatos.qSeccionDatos.Edit;

    if not FSeccionFormatoDatos.qSeccionDatos.Database.InTransaction then
       FSeccionFormatoDatos.qSeccionDatos.Database.StartTransaction;
    if FSeccionFormatoDatos.ShowModal=MrOK then
    begin
      FSeccionFormatoDatos.qSeccionDatos.Database.Commit;
      qSeccionDatos.Close;
      qSeccionDatos.Open;
      qSeccionDatos.Locate('CODIGOSECCIONFORMATODATOS',(FSeccionFormatoDatos.qSeccionDatosCODIGOSECCIONFORMATODATOS.AsInteger),[]);
    end
    else
      FSeccionFormatoDatos.qSeccionDatos.Database.Rollback;
 finally
    FSeccionFormatoDatos.Free;
  end;
end;

procedure TfHojaVidaEquipo.sbInsertarFormatoClick(
  Sender: TObject);
begin
  FFormatoMttoDatos:=TFFormatoMttoDatos.Create(Application);
  try
    if not FFormatoMttoDatos.qFormatoDatos.Database.InTransaction then
       FFormatoMttoDatos.qFormatoDatos.Database.StartTransaction;

    FFormatoMttoDatos.qFormatoDatos.Open;
    FFormatoMttoDatos.qFormatoDatos.insert;
    FFormatoMttoDatos.qFormatoDatos.Post;
    FFormatoMttoDatos.qFormatoDatos.Edit;

    if FFormatoMttoDatos.ShowModal=MrOK then
    begin
      FFormatoMttoDatos.qFormatoDatos.Database.Commit;
      qFormatoDatos.Close;
      qFormatoDatos.Open;
      qSeccionDatos.Close;
      qSeccionDatos.Open;
    with FFormatoMttoDatos do
      qFormatoDatos.Locate('CODIGOFORMATOMTTODATOS',(qFormatoDatosCODIGOFORMATOMTTODATOS.AsInteger),[]);
    end
    else
      FFormatoMttoDatos.qFormatoDatos.Database.Rollback;
 finally
    FFormatoMttoDatos.Free;
  end;
end;

procedure TfHojaVidaEquipo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfHojaVidaEquipo.RxDBGConsultaHojaVidaEquipoDblClick(
  Sender: TObject);
begin
//  if qPruebasProgramadas.Active then
//    qPruebasProgramadas.Close;
//  qPruebasProgramadas.Open;
  qFormato.Close;
  qFormato.Open;
end;

procedure TfHojaVidaEquipo.SBImprimirClick(Sender: TObject);
var
i,m,j:integer;
Nombrearchivo, ComentariosHistoricos: string;
UltimaRuta:string;
observaciones:string;
archivo:string;
Present: TDateTime;
Year, Month, Day, Hour, Min, Sec, MSec: Word;

begin
 //*********************************Formato de Subestaciones****************************************
Present:= Now;
DecodeDate(Present, Year, Month, Day);
DecodeTime(Present, Hour, Min, Sec, MSec);
Formatos_Excel:= eduexcel.Create;
//subestacion:=TQuery.Create(Appication);
qFormatoDatos.Open;
IF qFormatoDatosCODIGOFORMATOMTTO.ASINTEGER = 6 THEN
Begin
  Formatos_Excel.AsignarPlantilla('C:\Energis4\FormatoSubestacion.xls');
  Formatos_Excel.HojaActiva('Protocolo entrega de equipos');
  Formatos_Excel.Visible(FALSE);
  qSeccionDatos.first;
  while not qSeccionDatos.eof do
  Begin
    FSeccionFormatoDatos:=TFSeccionFormatoDatos.Create(Application);
    //try
    FSeccionFormatoDatos.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS = ' + qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
    FSeccionFormatoDatos.qSeccionDatos.Open;
//    FSeccionFormatoDatos.BitBtnImprimir.Enabled:=true;
    FSeccionFormatoDatos.bCancelar.Visible:=false;
    FSeccionFormatoDatos.updFormatoDatos:=nil;
    FSeccionFormatoDatos.updSeccionDatos:=nil;
    FSeccionFormatoDatos.Panel3.Enabled:=false;
    FSeccionFormatoDatos.Panel8.Enabled:=false;
    FSeccionFormatoDatos.DBNavigator1.visible:=false;
    FSeccionFormatoDatos.DBNavigator2.visible:=false;
    FSeccionFormatoDatos.dbgMedidas.ReadOnly:=true;
    {IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('D8',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',86,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('D9',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',116,[loCaseInsensitive])THEN
    Formatos_Excel.Asignar('G8',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',47,[loCaseInsensitive])THEN
    Formatos_Excel.Asignar('G9',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);}

    //fecha prueba
//    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('D8',FHOJAVIDAEQUIPO.qSeccionDatosFECHAPRUEBA.asstring);
//        Formatos_Excel.Asignar('D8',FHOJAVIDAEQUIPO.qFormatoDatosFECHAPRUEBA.asstring);
//    Formatos_Excel.Asignar('D8',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    //subestacion
//    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',336,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('F8',FHOJAVIDAEQUIPO.qMantenimientosNOMBRESUBESTACION.asstring);
//      Formatos_Excel.Asignar('F8',FHOJAVIDAEQUIPO.qFormatoDatosnombreSubestacion.asstring);
      Formatos_Excel.Asignar('F9',FHOJAVIDAEQUIPO.qMantenimientosNOMBRETIPOELEMENTO.asstring);
  //odt
//    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',337,[loCaseInsensitive])THEN
      Formatos_Excel.Asignar('D9',FHOJAVIDAEQUIPO.qSeccionDatosCODIGOODT.asstring);
//      Formatos_Excel.Asignar('D9',FHOJAVIDAEQUIPO.qFormatoDatosCODIGOODT.asstring);

      Formatos_Excel.Asignar('H8',FHOJAVIDAEQUIPO.qMantenimientoselemento.asstring);
  //elemento
//    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',338,[loCaseInsensitive])THEN
//      Formatos_Excel.Asignar('F9',FHOJAVIDAEQUIPO.qFormatoDatosCODIGOODT.asstring);
    //Formatos_Excel.Asignar('F9',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

 {   IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',337,[loCaseInsensitive])THEN
      Formatos_Excel.Asignar('H8',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',338,[loCaseInsensitive])THEN
      Formatos_Excel.Asignar('H9',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);  }

    //ESTADO OPERATIVO
    iF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',3,[loCaseInsensitive]) THEN
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring= 'FUNCIONAMIENTO NORMAL' THEN
        Formatos_Excel.Asignar('C14',Formatos_Excel.Obtener('C14')+'  '+'X');
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring= 'PENDIENTE REPARACION' THEN
        Formatos_Excel.Asignar('E14',Formatos_Excel.Obtener('E14')+'  '+'X');
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring= 'FUERA DE SERVICIO' THEN
        Formatos_Excel.Asignar('F14',Formatos_Excel.Obtener('F14')+'  '+'X');
    end;

    //CONDICIONES INICIALES
    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',111,[loCaseInsensitive]) THEN
    BEGIN
      iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('C17',Formatos_Excel.Obtener('C17')+'                       '+'X')
      ELSE
        Formatos_Excel.Asignar('C17',Formatos_Excel.Obtener('C17')+'                             '+'X');
    END;
    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',298,[loCaseInsensitive]) THEN
    BEGIN
      iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'NORMAL' THEN
      Formatos_Excel.Asignar('C18',Formatos_Excel.Obtener('C18')+'         '+'X')
      ELSE
      Formatos_Excel.Asignar('C18',Formatos_Excel.Obtener('C18')+'              '+'X');
    END;
    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',299,[loCaseInsensitive]) THEN
    Begin
      iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'SI' THEN
      Formatos_Excel.Asignar('C19',Formatos_Excel.Obtener('C19')+'     '+'X')
      ELSE
      Formatos_Excel.Asignar('C19',Formatos_Excel.Obtener('C19')+'            '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',300,[loCaseInsensitive]) then
    Begin
      iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
      Formatos_Excel.Asignar('C20',Formatos_Excel.Obtener('C20')+'                    '+'X')
      ELSE
      Formatos_Excel.Asignar('C20',Formatos_Excel.Obtener('C20')+'                          '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',301,[loCaseInsensitive]) then
    Begin
      iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
      Formatos_Excel.Asignar('E17',Formatos_Excel.Obtener('E17')+'           '+'X')
      ELSE
      Formatos_Excel.Asignar('E17',Formatos_Excel.Obtener('E17')+'                    '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',302,[loCaseInsensitive]) then
    Begin
      iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
      Formatos_Excel.Asignar('E18',Formatos_Excel.Obtener('E18')+'                      '+'X')
      ELSE
      Formatos_Excel.Asignar('E18',Formatos_Excel.Obtener('E18')+'                               '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',303,[loCaseInsensitive]) then
    Begin
      iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
      Formatos_Excel.Asignar('E19',Formatos_Excel.Obtener('E19')+'                '+'X')
      ELSE
      Formatos_Excel.Asignar('E19',Formatos_Excel.Obtener('E19')+'                         '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',304,[loCaseInsensitive]) then
    Begin
      iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
      Formatos_Excel.Asignar('E20',Formatos_Excel.Obtener('E20')+'     '+'X')
      ELSE
      Formatos_Excel.Asignar('E20',Formatos_Excel.Obtener('E20')+'              '+'X');
    end;


    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',306,[loCaseInsensitive]) then
    begin
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'NORMAL' THEN
    Formatos_Excel.Asignar('F17',Formatos_Excel.Obtener('F17')+'          '+'X')
    ELSE
    Formatos_Excel.Asignar('F17',Formatos_Excel.Obtener('F17')+'                  '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',307,[loCaseInsensitive]) then
    Begin
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
    Formatos_Excel.Asignar('F18',Formatos_Excel.Obtener('F18')+'      '+'X')
    ELSE
    Formatos_Excel.Asignar('F18',Formatos_Excel.Obtener('F18')+'              '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',308,[loCaseInsensitive]) then
    begin
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
    Formatos_Excel.Asignar('F19',Formatos_Excel.Obtener('F19')+'             '+'X')
    ELSE
    Formatos_Excel.Asignar('F19',Formatos_Excel.Obtener('F19')+'                     '+'X');
    end;

    // Bushing
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',549,[loCaseInsensitive]) then
    begin
      iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring <>'' THEN
      begin
        iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'NORMAL' THEN
          Formatos_Excel.Asignar('F20',Formatos_Excel.Obtener('F20')+'                  '+'X')
        ELSE
          Formatos_Excel.Asignar('F20',Formatos_Excel.Obtener('F20')+'                               '+'X');
      end;
    end;

    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',551,[loCaseInsensitive])THEN
      Formatos_Excel.Asignar('E21',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',550,[loCaseInsensitive])THEN
      Formatos_Excel.Asignar('E21',Formatos_Excel.Obtener('E21')+ ' / '+ FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);



    {if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',310,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('H17','VALOR:'+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);}

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',309,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('C23',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    //TRABAJOS REALIZADOS
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',311,[loCaseInsensitive]) then
    Begin
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'INSPECCION' THEN
      Formatos_Excel.Asignar('C31',Formatos_Excel.Obtener('C31')+'  '+'X');

    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'MANTENIMIENTO' THEN
      Formatos_Excel.Asignar('E31',Formatos_Excel.Obtener('E31')+'  '+'X');

    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'REPARACION' THEN
      Formatos_Excel.Asignar('F31',Formatos_Excel.Obtener('F31')+'  '+'X');

    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'MONTAJE' THEN
      Formatos_Excel.Asignar('H31',Formatos_Excel.Obtener('H31')+'  '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',98,[loCaseInsensitive]) then
    Begin
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('C33',Formatos_Excel.Obtener('C33')+'              '+'X');
    end;

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',285,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('C34',Formatos_Excel.Obtener('C34')+'        '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',99,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('C35',Formatos_Excel.Obtener('C35')+' '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',104,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('C36',Formatos_Excel.Obtener('C36')+'    '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',102,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('E33',Formatos_Excel.Obtener('E33')+'                  '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',109,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('E34',Formatos_Excel.Obtener('E34')+'                 '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',113,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('E35',Formatos_Excel.Obtener('E35')+'           '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',282,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('E36',Formatos_Excel.Obtener('E36')+'         '+'X');

   { FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',107,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('F33',Formatos_Excel.Obtener('F33')+'            '+'X');   }

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',283,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('F33',Formatos_Excel.Obtener('F33')+'     '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',284,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('F34',Formatos_Excel.Obtener('F34')+'           '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',103,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('F35',Formatos_Excel.Obtener('F35')+'                 '+'X');


    //Bushing 2  ....Falta...

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',548,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('F36',Formatos_Excel.Obtener('F36')+'            '+'X');


    //ventiladores reparados.....
    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',547,[loCaseInsensitive])THEN
      Formatos_Excel.Asignar('E37',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    //  RESISTENCIA CONTACTOS
    //Formatos_Excel.Asignar('H29',Formatos_Excel.Obtener('F32')+'');
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',286,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('D40',Formatos_Excel.Obtener('D40')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',290,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('D41',Formatos_Excel.Obtener('D41')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',287,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('E40',Formatos_Excel.Obtener('E40')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',291,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('E41',Formatos_Excel.Obtener('E41')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',288,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('F40',Formatos_Excel.Obtener('F40')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',292,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('F41',Formatos_Excel.Obtener('F41')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',289,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('H40',Formatos_Excel.Obtener('H40')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',293,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('H41',Formatos_Excel.Obtener('H41')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);




    //  PRESION SF6

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',103,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'BAR' THEN
    Formatos_Excel.Asignar('E43',Formatos_Excel.Obtener('E43')+'                                                          '+'X');
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'MPA' THEN
    Formatos_Excel.Asignar('E43',Formatos_Excel.Obtener('G43')+'              '+'X');

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',539,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('D44',Formatos_Excel.Obtener('D44')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',542,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('D45',Formatos_Excel.Obtener('D45')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',540,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('E44',Formatos_Excel.Obtener('E44')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',543,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('E45',Formatos_Excel.Obtener('E45')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',541,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('F44',Formatos_Excel.Obtener('F44')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',544,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('F45',Formatos_Excel.Obtener('F45')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',545,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('H44',Formatos_Excel.Obtener('H44')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',546,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('H45',Formatos_Excel.Obtener('H45')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);


    //OBSERVACIONES PRESION SF6
    //*********************************************************************************************

     //ESTADO FINAL DE LOS EQUIPOS
    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',271,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'OPERACION NORMAL' THEN
    Formatos_Excel.Asignar('C54',Formatos_Excel.Obtener('C54')+'  X');
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'PENDIENTE REPARACION' THEN
    Formatos_Excel.Asignar('E54',Formatos_Excel.Obtener('E54')+'  X');
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'FUERA DE SERVICIO' THEN
    Formatos_Excel.Asignar('F54',Formatos_Excel.Obtener('F54')+'  X');

    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',297,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('C56',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',339,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('C62',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',340,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('C64',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    qSeccionDatos.NEXT;
    FSeccionFormatoDatos.free;
  End;
end;

  //*********************************************Formato de Aceites**********************************************************
IF qFormatoDatosCODIGOFORMATOMTTO.ASINTEGER = 2 THEN
Begin
  Formatos_Excel.AsignarPlantilla('C:\Energis4\FormatoAceites.xls');
  Formatos_Excel.HojaActiva('Fisicoquimicos');
  Formatos_Excel.Visible(FALSE);
  qSeccionDatos.first;
  while not qSeccionDatos.eof do
  Begin
    FSeccionFormatoDatos:=TFSeccionFormatoDatos.Create(Application);
    //try
    FSeccionFormatoDatos.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS = ' + qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
    FSeccionFormatoDatos.qSeccionDatos.Open;
//    FSeccionFormatoDatos.BitBtnImprimir.Enabled:=true;
    FSeccionFormatoDatos.bCancelar.Visible:=false;
    FSeccionFormatoDatos.updFormatoDatos:=nil;
    FSeccionFormatoDatos.updSeccionDatos:=nil;
    FSeccionFormatoDatos.Panel3.Enabled:=false;
    FSeccionFormatoDatos.Panel8.Enabled:=false;
    FSeccionFormatoDatos.DBNavigator1.visible:=false;
    FSeccionFormatoDatos.DBNavigator2.visible:=false;
    FSeccionFormatoDatos.dbgMedidas.ReadOnly:=true;


      //*********Encabezado***************

    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',13,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('D5',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',116,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('D6',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',117,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('D7',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',17,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('D8',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',119,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('I5',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',120,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('I6',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',121,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('I7',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',122,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('I8',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',150,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('D32',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    {IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('M14',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('C33',Formatos_Excel.Obtener('C33')+'');
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('G32',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('K32',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('C37',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('L37',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring); }


    //***********************ANALISIS CROMATOGRAFICO/***************************
    Formatos_Excel.HojaActiva('CROMATOGRAFIA');
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('C53',{PROFESIONAL ASISTENTE}FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('K53',{COORDINADOR}FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('I34',{CUADRO ANALISIS CROMATOGRAFICO ARRIBA}FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('I37',{CUADRO ANALISIS CROMATOGRAFICO ABAJO}FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    qsecciondatos.Next;
  end;

  qFormatoDatos.last;
  i:= 0;
  while not qFormatoDatos.bof do
  Begin
    If qFormatoDatosCODIGOFORMATOMTTO.asinteger= 2 then
    Begin
      FSeccionFormatoDatos:=TFSeccionFormatoDatos.Create(Application);
      //try
      FSeccionFormatoDatos.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS = ' + qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
      FSeccionFormatoDatos.qSeccionDatos.Open;
//      FSeccionFormatoDatos.BitBtnImprimir.Enabled:=true;
      FSeccionFormatoDatos.bCancelar.Visible:=false;
      FSeccionFormatoDatos.updFormatoDatos:=nil;
      FSeccionFormatoDatos.updSeccionDatos:=nil;
      FSeccionFormatoDatos.Panel3.Enabled:=false;
      FSeccionFormatoDatos.Panel8.Enabled:=false;
      FSeccionFormatoDatos.DBNavigator1.visible:=false;
      FSeccionFormatoDatos.DBNavigator2.visible:=false;
      FSeccionFormatoDatos.dbgMedidas.ReadOnly:=true;

      //*************cuadro Analisis Cromatografico****************************
      Formatos_Excel.HojaActiva('CROMATOGRAFIA');
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',62,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,12,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {Fecha de analisis}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',63,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,14,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{CO2 DIOXIDO DE CARBONO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',64,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,15,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{CH4 METANO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',65,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,16,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{CO MONOXIDO DE CARBONO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',66,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,17,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{C2H2 ACETILENO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',67,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,18,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{C2H4 ETILENO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',68,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,19,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{C2H6 ETANO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',69,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,20,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{C3H6  PROPILENO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',70,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,21,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{C3H8 PROPANO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',71,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,22,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{H2 HIDROGENO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',72,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,23,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{O2 OXIGENO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',73,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,24,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{H2O en Papel}

      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',314,[loCaseInsensitive]) then
        ComentariosHistoricos:= ComentariosHistoricos + FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring;

      Formatos_Excel.Asignar(5+i,24,Comentarioshistoricos);{Comentarios Historicos}

      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',315,[loCaseInsensitive]) then
        Formatos_Excel.Asignar('I37',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{Diagnostico}

  //*************cuadro Analisis FisicoQuimico****************************
      Formatos_Excel.HojaActiva('Fisicoquimicos');
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',288,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,12,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);  {Fecha de analisis}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',49,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,14,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {Temperatura de aceite Inferior}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',51,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,15,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{Multiplicador Meyers}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',52,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,16,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);   {Color D1500}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',53,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,17,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {Gravedad Especifica}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',54,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,18,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);  {Viscocidad Comparativa}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',55,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,19,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {Examen Visual}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',56,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,20,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);   {Contenido de humedad}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',57,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,21,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {Tension Interfacial}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',58,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,22,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);  {Rigides Dielectrica}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',59,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,23,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {Indice de Acides}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',60,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,24,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {H2O en Papel}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',61,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,25,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {Calidad del Aceite}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',312,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,26,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {% saturacion relativa}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',81,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,27,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);   {Factor de Ptencia}

      FSeccionFormatoDatos.free;
    End;
    i:=i+1;
    qFormatoDatos.prior;
  end;
end;

  IF qFormatoDatosCODIGOFORMATOMTTO.ASINTEGER = 11 THEN
Begin
  Formatos_Excel.AsignarPlantilla('C:\Energis4\Formatomantenimietolineas.xls');
  Formatos_Excel.HojaActiva('Hoja1');
  Formatos_Excel.Visible(FALSE);
  qSeccionDatos.first;
  while not qSeccionDatos.eof do
  Begin
    FSeccionFormatoDatos:=TFSeccionFormatoDatos.Create(Application);
    //try
    FSeccionFormatoDatos.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS = ' + qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
    FSeccionFormatoDatos.qSeccionDatos.Open;
//    FSeccionFormatoDatos.BitBtnImprimir.Enabled:=true;
    FSeccionFormatoDatos.bCancelar.Visible:=false;
    FSeccionFormatoDatos.updFormatoDatos:=nil;
    FSeccionFormatoDatos.updSeccionDatos:=nil;
    FSeccionFormatoDatos.Panel3.Enabled:=false;
    FSeccionFormatoDatos.Panel8.Enabled:=false;
    FSeccionFormatoDatos.DBNavigator1.visible:=false;
    FSeccionFormatoDatos.DBNavigator2.visible:=false;
    FSeccionFormatoDatos.dbgMedidas.ReadOnly:=true;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',211,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E7','X')
      ELSE
        Formatos_Excel.Asignar('G7','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',317,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('H7','Linea'+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',319,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E8','X')
      ELSE
        Formatos_Excel.Asignar('G8','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',318,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('H8','Linea'+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',320,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D9',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);



    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',212,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E10','X')
      ELSE
        Formatos_Excel.Asignar('G10','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',321,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D11','Linea'+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);



    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',213,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E12','X')
      ELSE
        Formatos_Excel.Asignar('G12','X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',214,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E14','X')
      ELSE
        Formatos_Excel.Asignar('G14','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',322,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D15','Linea'+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    //VANO
        if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',215,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E16','X')
      ELSE
        Formatos_Excel.Asignar('G16','X');
    end;
    Formatos_Excel.Asignar('H16','Linea ');
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',325,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('H16',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    Formatos_Excel.Asignar('H16',' Y ');
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',327,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('H16',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);


    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',324,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E17','X')
      ELSE
        Formatos_Excel.Asignar('G17','X');
    end;
    Formatos_Excel.Asignar('H17','Linea ');
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',326,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('H17',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    Formatos_Excel.Asignar('H17',' Y ');
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',328,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('H17',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    //VANO OBSERVACION
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',329,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D18',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    //pODA eSTRUCTURA
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',218,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E19','X')
      ELSE
        Formatos_Excel.Asignar('G19','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',323,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D20','Linea'+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);



    //PODA CAMINO DE ACCESO
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',219,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E21','X')
      ELSE
        Formatos_Excel.Asignar('G21','X');
    end;


    //lIMPIEZA CANAL DE DESAGUE
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',220,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E23','X')
      ELSE
        Formatos_Excel.Asignar('G23','X');
    end;

    //pODA VANO
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',221,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E25','X')
      ELSE
        Formatos_Excel.Asignar('G25','X');
    end;
    Formatos_Excel.Asignar('H25','Linea ');
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',222,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('H25',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    Formatos_Excel.Asignar('H25',' Y ');
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',223,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('H25',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',330,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D26',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    //PUESTA A TIERRA
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',224,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E27','X')
      ELSE
        Formatos_Excel.Asignar('G27','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',332,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D28',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    //MEDIDA DE TIERRA
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',225,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D29',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    //PROBLEMAS ESTRUCTURA
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',226,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E30','X')
      ELSE
        Formatos_Excel.Asignar('G30','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',333,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D31',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    //PROBLEMAS DESLIZAMIENTOS
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',227,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E32','X')
      ELSE
        Formatos_Excel.Asignar('G32','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',334,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D33',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    //PUNTOS CALIENTES
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',228,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E34','X')
      ELSE
        Formatos_Excel.Asignar('G34','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',335,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D35',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    //OBSERVACIONES
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',229,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D36',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    //RESPONSABLE
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',105,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('E41',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    //FECHA
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',91,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('E43',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    qSeccionDatos.NEXT;
  END;
END;
                //************************COMUNES*****************************************
  //*************************************************************************
  {WorkBook := oXL.ActiveWorkBook ;
  WorkSheet := WorkBook.ActiveSheet;}


  archivo:= 'C:\energis4\Formato_'+ IntToStr(Day) + '_' + IntToStr(Month) + '_' + IntToStr(Year) + ' '+ IntToStr(Hour)+ 'y' + IntToStr(Min)+ '.XLS';
  Formatos_Excel.Salvar(archivo);
  Formatos_Excel.Visible(true);
  Formatos_Excel.Terminar;
  Formatos_Excel.Free;
  Showmessage('El Formato a sido exportado a Excel, vaya a la carpeta c:\energis4 e imprimalo.');
end;

procedure TfHojaVidaEquipo.qFormatoDatosCalcFields(DataSet: TDataSet);
var query:TQuery;
begin
  query:=TQuery.Create(Application);
  query.DatabaseName:='Basedato';
  query.SQL.Add('SELECT NOMBREFORMATOMTTO FROM HVE_FORMATOMTTO WHERE CODIGOFORMATOMTTO='+ qFormatoDatosCODIGOFORMATOMTTO.AsString);
  query.Open;
  qFormatoDatosnombreFormato.AsString:=query.Fields[0].AsString;
end;


procedure TfHojaVidaEquipo.SBBuscarClick(Sender: TObject);
begin
  inherited;
  FBusquedaMtto := TFBusquedaMtto.Create(Application);
  FBusquedaMtto.dsMtto.DataSet:=qMantenimientos;
  FBusquedaMtto.ShowModal;
  FBusquedaMtto.Free;
  RxDBGConsultaHojaVidaEquipo.Setfocus;
end;

procedure TfHojaVidaEquipo.SBOrdenarClick(Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel2.ClientToScreen(Classes.Point(SBOrdenar.Left, SBOrdenar.top));
  pmOrdenar.Popup(punto.x+10, punto.y+10);
end;

//ORDENAR
procedure TfHojaVidaEquipo.Ordenar(sCriterio: String);
begin
  qMantenimientos.Close;
  qMantenimientos.SQL.Delete(qMantenimientos.SQL.Count - 1);
  qMantenimientos.SQL.Add(sCriterio);
  qMantenimientos.Open;
  RxDBGConsultaHojaVidaEquipo.SetFocus;
end;

procedure TfHojaVidaEquipo.CodigoMttoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('CODIGOMTTO');
  sCriterio := 'ORDER BY t.codigotarea DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['CODIGOMTTO']='1') then
    begin
      sCriterio := 'ORDER BY t.codigotarea ASC';
      ListaDireccionCampos.Values['CODIGOMTTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['CODIGOMTTO']:='1'
  end;
  CodigoMtto.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaHojaVidaEquipo do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosCODIGOMANTENIMIENTO;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;


procedure TfHojaVidaEquipo.NombreMantenimientoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('NOMBREMANTENIMIENTO');
  sCriterio := 'ORDER BY T.NOMBRETAREA DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['NOMBREMANTENIMIENTO']='1') then
    begin
      sCriterio := 'ORDER BY T.NOMBRETAREA ASC';
      ListaDireccionCampos.Values['NOMBREMANTENIMIENTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['NOMBREMANTENIMIENTO']:='1'
  end;
  NombreMantenimiento.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaHojaVidaEquipo do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBRETAREA;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfHojaVidaEquipo.TipoMantenimientoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('TIPOMANTENIMIENTO');
  sCriterio := 'ORDER BY TM.NOMBREMANT DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['TIPOMANTENIMIENTO']='1' then
    begin
      sCriterio := 'ORDER BY TM.NOMBREMANT ASC';
      ListaDireccionCampos.Values['TIPOMANTENIMIENTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['TIPOMANTENIMIENTO']:='1'
  end;
  TipoMantenimiento.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaHojaVidaEquipo do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBREMANT;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;
procedure TfHojaVidaEquipo.FechaInicialMttoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHAINICIALMTTO');
  sCriterio := 'ORDER BY t.fechainicial DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['FECHAINICIALMTTO']='1' then
    begin
      sCriterio := 'ORDER BY t.fechainicial ASC';
      ListaDireccionCampos.Values['FECHAINICIALMTTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHAINICIALMTTO']:='1'
  end;
  FechaInicialMtto.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaHojaVidaEquipo do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosFECHAINICIAL;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfHojaVidaEquipo.FechaFinalMttoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHAFINALMTTO');
  sCriterio := 'ORDER BY t.fechafinal DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['FECHAFINALMTTO']='1' then
    begin
      sCriterio := 'ORDER BY t.fechafinal ASC';
      ListaDireccionCampos.Values['FECHAFINALMTTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHAFINALMTTO']:='1'
  end;
  FechaFinalMtto.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaHojaVidaEquipo do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosFECHAFINAL;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;
procedure TfHojaVidaEquipo.EstadoMttoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('ESTADOMTTO');
  sCriterio := 'ORDER BY et.NombreEstado DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['ESTADOMTTO']='1' then
    begin
      sCriterio := 'ORDER BY et.NombreEstado ASC';
      ListaDireccionCampos.Values['ESTADOMTTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['ESTADOMTTO']:='1'
  end;
  EstadoMtto.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaHojaVidaEquipo do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBREESTADO;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;
procedure TfHojaVidaEquipo.TipoElementoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('TIPOELEMENTO');
  sCriterio := 'ORDER BY e.nombretipoelemento DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['TIPOELEMENTO']='1' then
    begin
      sCriterio := 'ORDER BY e.nombretipoelemento ASC';
      ListaDireccionCampos.Values['TIPOELEMENTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['TIPOELEMENTO']:='1'
  end;
  TipoElemento.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaHojaVidaEquipo do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBRETIPOELEMENTO;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;
procedure TfHojaVidaEquipo.TensionClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('TENSION');
  sCriterio := 'ORDER BY nt.tension DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['TENSION']='1' then
    begin
      sCriterio := 'ORDER BY nt.tension ASC';
      ListaDireccionCampos.Values['TENSION']:='-1';
    end
    else
      ListaDireccionCampos.Values['TENSION']:='1'
  end;
  Tension.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaHojaVidaEquipo do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosTENSION;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;
procedure TfHojaVidaEquipo.SubestacionClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('SUBESTACION');
  sCriterio := 'ORDER BY s.nombresubestacion DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['SUBESTACION']='1' then
    begin
      sCriterio := 'ORDER BY s.nombresubestacion ASC';
      ListaDireccionCampos.Values['SUBESTACION']:='-1';
    end
    else
      ListaDireccionCampos.Values['SUBESTACION']:='1'
  end;
  Subestacion.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaHojaVidaEquipo do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBRESUBESTACION;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfHojaVidaEquipo.sbExportarClick(Sender: TObject);
Var
  oXL, oWB: Variant;
  fila: integer;
begin
  Present:= Now;
  DecodeDate(Present, Year, Month, Day);
  DecodeTime(Present, Hour, Min, Sec, MSec);
  oXL := CreateOleObject('Excel.Application');
  oXL.Visible := True;
  oWB := oXL.Workbooks.Add;
  oWB.sheets.add.name:= 'Mantenimientos';
  oWB.ActiveSheet.Cells[1,1] := 'CODIGO MTTO';
  oWB.ActiveSheet.Cells[1,2] := 'NOMBRE MANTENIMIENTO';
  oWB.ActiveSheet.Cells[1,3] := 'TIPO MTTO';
  oWB.ActiveSheet.Cells[1,4] := 'FECHA INICIAL';
  oWB.ActiveSheet.Cells[1,5] := 'FECHA FINAL';
  oWB.ActiveSheet.Cells[1,6] := 'SUBESTACION';
  oWB.ActiveSheet.Cells[1,7] := 'TIPO ELEMENTO';
  oWB.ActiveSheet.Cells[1,8] := 'TENSION';
  oWB.ActiveSheet.Cells[1,9] := 'ESTADO';
  qMantenimientos.First;
  fila:= 2;
  while not qMantenimientos.eof do
  begin
    oWB.ActiveSheet.Cells[fila,1] :=  qMantenimientos.FIELDBYNAME('CODIGOMANTENIMIENTO').asstring;
    oWB.ActiveSheet.Cells[fila,2] :=  qMantenimientos.FIELDBYNAME('NOMBRETAREA').asstring;
    oWB.ActiveSheet.Cells[fila,3] :=  qMantenimientos.FIELDBYNAME('NOMBREMANT').asstring;
    oWB.ActiveSheet.Cells[fila,4] :=  qMantenimientos.FIELDBYNAME('FECHAINICIAL').asstring;
    oWB.ActiveSheet.Cells[fila,5] :=  qMantenimientos.FIELDBYNAME('FECHAFINAL').asstring;
    oWB.ActiveSheet.Cells[fila,6]:=  qMantenimientos.FIELDBYNAME('NOMBRESUBESTACION').asstring;
    oWB.ActiveSheet.Cells[fila,7] :=  qMantenimientos.FIELDBYNAME('NOMBRETIPOELEMENTO').asstring;
    oWB.ActiveSheet.Cells[fila,8] :=  qMantenimientos.FIELDBYNAME('TENSION').asstring;
    oWB.ActiveSheet.Cells[fila,9]:=  qMantenimientos.FIELDBYNAME('NOMBREESTADO').asstring;
    fila:= fila + 1;
    qMantenimientos.next;
  end;
  //oWB.SaveAs('C:\EnerGIS4\ConsultaMttosElemento'+'_'+IntToStr(Day)+'_'+ IntToStr(Month)+'_' +IntToStr(Year) + '_'+ IntToStr(Hour)+'y'+IntToStr(Min),null,'','',EmptyParam,EmptyParam,0, EmptyParam, EmptyParam, EmptyParam,EmptyParam,0);
end;


procedure TfHojaVidaEquipo.SBEstadisticaClick(Sender: TObject);
begin
  Application.ProcessMessages;
  fQRMttosRealizadosHV:=TFQRMttosRealizadosHV.create(Application);
  fQRMttosRealizadosHV.qMttoReprogramado.SQL.Clear;
  fQRMttosRealizadosHV.qMttoReprogramado.Close;
  fQRMttosRealizadosHV.qMttoReprogramado.SQL.Text:=qMantenimientos.SQL.Text;
  fQRMttosRealizadosHV.qMttoReprogramado.Open;
  fQRMttosRealizadosHV.qEmpresa.Open;
//  fQRMttoReprogramado.QRDBText7.Caption :=CBELEMENTO.TEXT;
  //FECHA IMPRESIÓN
  fQRMttosRealizadosHV.QRLBFecha.Caption := DateTimeToStr(Now);
  fQRMttosRealizadosHV.QuickRep1.Preview;
end;

procedure TfHojaVidaEquipo.SBBuscaElementoCartografiaClick(
  Sender: TObject);
begin
  inherited;
 { Application.ProcessMessages;
  fQREquipoHV:=TFQREquipoHV.create(Application);
  fQREquipoHV.qMttoReprogramado.SQL.Clear;
  fQREquipoHV.qMttoReprogramado.Close;
  fQREquipoHV.qMttoReprogramado.SQL.Text:=qMantenimientos.SQL.Text;
  fQREquipoHV.qMttoReprogramado.Open;
  fQREquipoHV.qEmpresa.Open;
//  fQRMttoReprogramado.QRDBText7.Caption :=CBELEMENTO.TEXT;
  //FECHA IMPRESIÓN
  fQREquipoHV.QRLBFecha.Caption := DateTimeToStr(Now);
  fQREquipoHV.QuickRep1.Preview;     }
end;

procedure TfHojaVidaEquipo.qMantenimientosCalcFields(DataSet: TDataSet);
begin
  inherited;
  qElementoMtto.Close;
  qElementoMtto.ParamByName('CODIGOELEMENTOMANTENIMIENTO').AsString:=qmantenimientos.fieldbyname('CODIGOTAREA').asstring;
  qElementoMtto.Open;
  consultarelemento(qElementoMttoCODIGOELEMENTO.asstring);
  qMantenimientoselemento.AsString:=Memo2.Text;
end;

procedure TfHojaVidaEquipo.consultarElemento(codigotipoelemento: string);
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

end.
