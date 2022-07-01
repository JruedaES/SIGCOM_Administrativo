//***************************************************************************
//                       Módulo de ODT     
//               Listado de Órdenes de Trabajo
//      A través de este listado se insertan o Editan ODTs y ODTs hijas
//***************************************************************************
unit uListaRegistrarMantenimientoAnterior;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls, Mask, RXSplit,
  Menus, MPlayer, comObj;

type
  TfListaRegistrarMantenimientoAnterior = class(TFdSgdListaBase)
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
    panelSuperior: TPanel;
    RxDBGConsultaMttoAnterior: TRxDBGrid;
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
    qSubactividadesOdt: TQuery;
    qSubactividadesOdtCOUNT: TFloatField;
    dsSubactividadesOdt: TDataSource;
    qSeccionesPruebas: TQuery;
    qSeccionesPruebasCODIGOSECCIONFORMATODATOS: TFloatField;
    qSeccionesPruebasCODIGOFORMATOMTTODATOS: TFloatField;
    qSeccionesPruebasCODIGOSECCIONFORMATO: TFloatField;
    qSeccionesPruebasCODIGOODT: TFloatField;
    qSeccionesPruebasSUBACTIVIDADODT: TFloatField;
    qSeccionesPruebasESTADOTERMINADO: TStringField;
    qSeccionesPruebasFECHAREGISTRO: TDateTimeField;
    qSeccionesPruebasFECHAMODIFICACION: TDateTimeField;
    qSeccionesPruebasFECHAPRUEBA: TDateTimeField;
    qSeccionesPruebasCODIGOUSUARIOCREACION: TFloatField;
    qSeccionesPruebasCODIGOUSUARIOMODIFICACION: TFloatField;
    dsSeccionesPruebas: TDataSource;
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
    qSubactividad: TQuery;
    qSubactividadCODIGOSUBACTIVIDADAREAODT: TFloatField;
    dsSubactividad: TDataSource;
    qdatosSubactividad: TQuery;
    qdatosSubactividadCODIGOODTSUBACTIVIDADDATOS: TFloatField;
    qdatosSubactividadPROGRAMADA: TStringField;
    qdatosSubactividadEJECUTADA: TStringField;
    dsDatosSubactividad: TDataSource;
    updDatosSubactividad: TUpdateSQL;
    qPruebasProgramadasAnterior: TQuery;
    dsPruebasProgramadasAnterior: TDataSource;
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
    qPruebasProgramadasAnteriorCODIGOSUBACTIVIDADPRUEBA: TFloatField;
    qPruebasProgramadasAnteriorCODIGOSECCIONFORMATO: TFloatField;
    qPruebasProgramadasAnteriorNOMBRESECCIONFORMATO: TStringField;
    qPruebasProgramadasAnteriorCODIGOFORMATOMTTO: TFloatField;
    qPruebasProgramadasAnteriorNOMBREFORMATOMTTO: TStringField;
    qPruebasProgramadas: TQuery;
    dsPruebasProgramadas: TDataSource;
    qPruebasProgramadasCODIGOSUBACTIVIDADPRUEBA: TFloatField;
    qPruebasProgramadasCODIGOFORMATOMTTO: TFloatField;
    qPruebasProgramadasCODIGOSECCIONFORMATO: TFloatField;
    qPruebasProgramadasNOMBREFORMATOMTTO: TStringField;
    qPruebasProgramadasNOMBRESECCIONFORMATO: TStringField;
    qPruebasProgramadasCODIGOSUBACTIVIDADAREAODT: TFloatField;
    qPruebasProgramadasNOMBRESUBACTIVIDADAREAODT: TStringField;
    qPruebasProgramadasCODIGOMANTENIMIENTO: TFloatField;
    qMantenimientosNOMBREAREAOPERACIONODT: TStringField;
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
    Bevel4: TBevel;
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
    procedure RxDBGConsultaMttoAnteriorDblClick(Sender: TObject);
    procedure qFormatoCalcFields(DataSet: TDataSet);
    procedure SBBuscarClick(Sender: TObject);
    procedure SBOrdenarClick(Sender: TObject);
    procedure CodigoMttoClick(Sender: TObject);
    procedure NombreMantenimientoClick(Sender: TObject);
    procedure TipoMantenimientoClick(Sender: TObject);
    procedure CoordinacionClick(Sender: TObject);
    procedure FechaInicialMttoClick(Sender: TObject);
    procedure FechaFinalMttoClick(Sender: TObject);
    procedure EstadoMttoClick(Sender: TObject);
    procedure TipoElementoClick(Sender: TObject);
    procedure TensionClick(Sender: TObject);
    procedure SubestacionClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);

  private
    { Private declarations }
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
  fListaRegistrarMantenimientoAnterior: TfListaRegistrarMantenimientoAnterior;

implementation

uses UFormatoMttoDatos, uElementosAsociadosODT, uQRListaODTViaticos,
  uQRListaODTAuxilios, USeccionFormatoDatos, UFormatoMttoImprirmir,
  ufiltroMantenimientoAnterior, UFormatoMttoDatosODT,
  USeccionFormatoDatosODT, uBusquedaMtto;

  {$R *.DFM}

procedure TfListaRegistrarMantenimientoAnterior.dbgListaOdtPadreGetCellParams(Sender: TObject;
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

procedure TfListaRegistrarMantenimientoAnterior.FormDestroy(Sender: TObject);
begin
 ListaFrom.Free;
 ListaEstadistica.Free;
//  inherited;
end;

procedure TfListaRegistrarMantenimientoAnterior.dbgListaOdtPadreDblClick(Sender: TObject);
{begin
  inherited;
  if qFormatoDatosCODIGOFORMATOMTTODATOS.AsString <> '' then
    sbEditarFormatoClick(nil);
    }
{var
qDatos,qformatos:TQuery;
begin
  qOdtSubactividadDatos.Open;
  if qFormatosPruebas.Active then
    qFormatosPruebas.Close;
//  qFormatosPruebas.ParamByName('CODIGOODT').AsInteger:= qODTHijaCODIGOODT.AsInteger;
//  qFormatosPruebas.ParamByName('CONSECUTIVOODT').AsInteger:=qODTHijaCONSECUTIVO.AsInteger;
//  qFormatosPruebas.ParamByName('CODIGOFORMATOMTTO').AsInteger:=qFormatoCODIGOFORMATOMTTO.AsInteger;

  qFormatosPruebas.ParamByName('CODIGOODT').AsInteger:= qMantenimientosCODIGOODT.AsInteger;
  qFormatosPruebas.ParamByName('CONSECUTIVOODT').AsInteger:=qMantenimientosCONSECUTIVO.AsInteger;
  qFormatosPruebas.ParamByName('CODIGOFORMATOMTTO').AsInteger:=qFormatoCODIGOFORMATOMTTO.AsInteger;
  qFormatosPruebas.Open;

  //inicio 27122007 --agregar el campo codigomantenimiento en el query qFormatosPruebas
  qFormatosPruebasCODIGOMANTENIMIENTO.AsFloat:=qOdtSubactividadDatosCODIGOMANTENIMIENTO.AsFloat;
  //fin 27122007
  if qFormatosPruebasCODIGOFORMATOMTTODATOS.AsString <>'' then
  begin
    FFormatoMttoDatosODT:=TFFormatoMttoDatosODT.Create(Application);
    qFormatosPruebas.Open;

    if FFormatoMttoDatosODT.qMantenimientoDatos.Active then
      FFormatoMttoDatosODT.qMantenimientoDatos.close;
    FFormatoMttoDatosODT.qMantenimientoDatos.ParamByName('CODIGOMANTENIMIENTO').AsFloat:= qOdtSubactividadDatosCODIGOMANTENIMIENTO.AsFloat;
    FFormatoMttoDatosODT.qMantenimientoDatos.Open;
      ////  ELEMENTO
    if FFormatoMttoDatosODT.qPmelemento.Active then
      FFormatoMttoDatosODT.qPmelemento.Close;
    FFormatoMttoDatosODT.qPmelemento.ParamByName('CODIGOELEMENTOMANTENIMIENTO').AsFloat:= qOdtSubactividadDatosCODIGOMANTENIMIENTO.AsFloat;
    FFormatoMttoDatosODT.qPmelemento.Open;

    try
      FFormatoMttoDatosODT.qFormatoDatos.Close;
      FFormatoMttoDatosODT.qFormatoDatos.SQL.Text:='SELECT * FROM HVE_FORMATOMTTODATOS WHERE CODIGOFORMATOMTTODATOS = ' + qFormatosPruebasCODIGOFORMATOMTTODATOS.AsString;
      FFormatoMttoDatosODT.qFormatoDatos.Open;
      FFormatoMttoDatosODT.qFormatoDatos.Edit;
      if not FFormatoMttoDatosODT.qFormatoDatos.Database.InTransaction then
         FFormatoMttoDatosODT.qFormatoDatos.Database.StartTransaction;
      if FFormatoMttoDatosODT.ShowModal=MrOK then
      begin
        FFormatoMttoDatosODT.qFormatoDatos.Database.Commit;
        qFormatosPruebas.Close;
        qFormatosPruebas.Open;
      end
      else
        FFormatoMttoDatosODT.
        qFormatoDatos.Database.Rollback;
    finally
      FFormatoMttoDatosODT.Free;
    end;
  end
  else
  begin
    if qFormatosPruebasCODIGOFORMATOMTTODATOS.AsString ='' then
    begin
      FFormatoMttoDatosODT:=TFFormatoMttoDatosODT.Create(Application);
     try
     if not FFormatoMttoDatosODT.qFormatoDatos.Database.InTransaction then
       FFormatoMttoDatosODT.qFormatoDatos.Database.StartTransaction;
     FFormatoMttoDatosODT.qFormatoDatos.Open;
     FFormatoMttoDatosODT.qFormatoDatos.insert;
     FFormatoMttoDatosODT.qFormatoDatos.Post;
     FFormatoMttoDatosODT.qFormatoDatos.Edit;

     FFormatoMttoDatosODT.qFormatoDatosCODIGOFORMATOMTTO.AsInteger:=qPruebasProgramadasCODIGOFORMATOMTTO.AsInteger;
//     FFormatoMttoDatosODT.qFormatoDatosCODIGOODT.AsFloat:=qODTHijaCODIGOODT.AsFloat;
//     FFormatoMttoDatosODT.qFormatoDatosCONSECUTIVOODT.AsInteger:=qODTHijaCONSECUTIVO.AsInteger;

     FFormatoMttoDatosODT.qFormatoDatosCODIGOODT.AsFloat:=qMantenimientosCODIGOODT.AsFloat;
     FFormatoMttoDatosODT.qFormatoDatosCONSECUTIVOODT.AsInteger:=qMantenimientosCONSECUTIVO.AsInteger;

      if FFormatoMttoDatosODT.qMantenimientoDatos.Active then
        FFormatoMttoDatosODT.qMantenimientoDatos.close;
      FFormatoMttoDatosODT.qMantenimientoDatos.ParamByName('CODIGOMANTENIMIENTO').AsFloat:= qOdtSubactividadDatosCODIGOMANTENIMIENTO.AsFloat;
      FFormatoMttoDatosODT.qMantenimientoDatos.Open;
      ////  ELEMENTO
      if FFormatoMttoDatosODT.qPmelemento.Active then
        FFormatoMttoDatosODT.qPmelemento.Close;
      FFormatoMttoDatosODT.qPmelemento.ParamByName('CODIGOELEMENTOMANTENIMIENTO').AsFloat:= qOdtSubactividadDatosCODIGOMANTENIMIENTO.AsFloat;
      FFormatoMttoDatosODT.qPmelemento.Open;

       if FFormatoMttoDatosODT.ShowModal=MrOK then
       begin
        FFormatoMttoDatosODT.qFormatoDatos.Database.Commit;
        qFormatosPruebas.Close;
        FFormatoMttoDatosODT.qMantenimientoDatos.Free;
       END;
   finally
      FFormatoMttoDatosODT.Free;
      end;
    end;
  end; }
var
qDatos,qformatos:TQuery;
begin
  if qFormatosPruebas.Active then
    qFormatosPruebas.Close;
  qFormatosPruebas.ParamByName('CODIGOODT').AsInteger:= qMantenimientosCODIGOODT.AsInteger;
  qFormatosPruebas.ParamByName('CONSECUTIVOODT').AsInteger:=qMantenimientosCONSECUTIVO.AsInteger;
  qFormatosPruebas.ParamByName('CODIGOFORMATOMTTO').AsInteger:=qFormatoCODIGOFORMATOMTTO.AsInteger;
  qFormatosPruebas.Open;
  if qFormatosPruebasCODIGOFORMATOMTTODATOS.AsString <>'' then
  begin
    FFormatoMttoDatosODT:=TFFormatoMttoDatosODT.Create(Application);
    FFormatoMttoDatosODT.mttoanterior:=true;
    qFormatosPruebas.Open;
    if FFormatoMttoDatosODT.qMantenimientoDatos.Active then
      FFormatoMttoDatosODT.qMantenimientoDatos.close;
    FFormatoMttoDatosODT.qMantenimientoDatos.ParamByName('CODIGOMANTENIMIENTO').AsFloat:= qMantenimientosCODIGOMANTENIMIENTO.AsFloat;
    FFormatoMttoDatosODT.qMantenimientoDatos.Open;
      ////  ELEMENTO
    if FFormatoMttoDatosODT.qPmelemento.Active then
      FFormatoMttoDatosODT.qPmelemento.Close;
    FFormatoMttoDatosODT.qPmelemento.ParamByName('CODIGOELEMENTOMANTENIMIENTO').AsFloat:= qMantenimientosCODIGOMANTENIMIENTO.AsFloat;
    FFormatoMttoDatosODT.qPmelemento.Open;
    try
      FFormatoMttoDatosODT.qFormatoDatos.Close;
      FFormatoMttoDatosODT.qFormatoDatos.SQL.Text:='SELECT * FROM HVE_FORMATOMTTODATOS WHERE CODIGOFORMATOMTTODATOS = ' + qFormatosPruebasCODIGOFORMATOMTTODATOS.AsString;
      FFormatoMttoDatosODT.qFormatoDatos.Open;
      FFormatoMttoDatosODT.qFormatoDatos.Edit;
      if not FFormatoMttoDatosODT.qFormatoDatos.Database.InTransaction then
         FFormatoMttoDatosODT.qFormatoDatos.Database.StartTransaction;
      if FFormatoMttoDatosODT.ShowModal=MrOK then
      begin
        FFormatoMttoDatosODT.qFormatoDatos.Database.Commit;
        qFormatosPruebas.Close;
        qFormatosPruebas.Open;
      end
      else
        FFormatoMttoDatosODT.qFormatoDatos.Database.Rollback;
    finally
      FFormatoMttoDatosODT.Free;
    end;
  end
  else
  begin
    if qFormatosPruebasCODIGOFORMATOMTTODATOS.AsString ='' then
    begin
      FFormatoMttoDatosODT:=TFFormatoMttoDatosODT.Create(Application);
      FFormatoMttoDatosODT.mttoanterior:=true;
     try
     if not FFormatoMttoDatosODT.qFormatoDatos.Database.InTransaction then
       FFormatoMttoDatosODT.qFormatoDatos.Database.StartTransaction;
     FFormatoMttoDatosODT.qFormatoDatos.Open;
     FFormatoMttoDatosODT.qFormatoDatos.insert;
     FFormatoMttoDatosODT.qFormatoDatos.Post;
     FFormatoMttoDatosODT.qFormatoDatos.Edit;

     FFormatoMttoDatosODT.qFormatoDatosCODIGOFORMATOMTTO.AsInteger:=qPruebasProgramadasCODIGOFORMATOMTTO.AsInteger;
     FFormatoMttoDatosODT.qFormatoDatosCODIGOODT.AsFloat:=qMantenimientosCODIGOODT.AsFloat;
     FFormatoMttoDatosODT.qFormatoDatosCONSECUTIVOODT.AsInteger:=qMantenimientosCONSECUTIVO.AsInteger;
     FFormatoMttoDatosODT.qFormatoDatosCODIGOMANTENIMIENTO.AsInteger:=qMantenimientosCODIGOMANTENIMIENTO.AsInteger;
//     FFormatoMttoDatosODT.qFormatoDatosCODIGOODT.AsFloat:=qODTHijaCODIGOODT.AsFloat;
//     FFormatoMttoDatosODT.qFormatoDatosCONSECUTIVOODT.AsInteger:=qODTHijaCONSECUTIVO.AsInteger;

      if FFormatoMttoDatosODT.qMantenimientoDatos.Active then
        FFormatoMttoDatosODT.qMantenimientoDatos.close;
      FFormatoMttoDatosODT.qMantenimientoDatos.ParamByName('CODIGOMANTENIMIENTO').AsFloat:= qMantenimientosCODIGOMANTENIMIENTO.AsFloat;
      FFormatoMttoDatosODT.qMantenimientoDatos.Open;
      ////  ELEMENTO
      if FFormatoMttoDatosODT.qPmelemento.Active then
        FFormatoMttoDatosODT.qPmelemento.Close;
      FFormatoMttoDatosODT.qPmelemento.ParamByName('CODIGOELEMENTOMANTENIMIENTO').AsFloat:= qMantenimientosCODIGOMANTENIMIENTO.AsFloat;
      FFormatoMttoDatosODT.qPmelemento.Open;

       if FFormatoMttoDatosODT.ShowModal=MrOK then
       begin
        FFormatoMttoDatosODT.qFormatoDatos.Database.Commit;
        qFormatosPruebas.Close;
        FFormatoMttoDatosODT.qMantenimientoDatos.Free;
       END;
   finally
      FFormatoMttoDatosODT.Free;
      end;
    end;
  end;
end;

procedure TfListaRegistrarMantenimientoAnterior.FormShow(Sender: TObject);
begin
  Filtrar;
end;

procedure TfListaRegistrarMantenimientoAnterior.dbgListaHijasDblClick(Sender: TObject);
var qDatos,qformatos,qrDatos:TQuery;
begin
  qPruebasProgramadas.Open;
  if qFormatosPruebas.Active then
    qFormatosPruebas.Close;
  qFormatosPruebas.ParamByName('CODIGOODT').AsInteger:= qMantenimientosCODIGOODT.AsInteger;
  qFormatosPruebas.ParamByName('CONSECUTIVOODT').AsInteger:=qMantenimientosCONSECUTIVO.AsInteger;
  qFormatosPruebas.ParamByName('CODIGOFORMATOMTTO').AsInteger:=qFormatoCODIGOFORMATOMTTO.AsInteger;
  qFormatosPruebas.Open;
  qSubactividad.Open;
  qDatos:=TQuery.Create(Application);
  qDatos.DatabaseName:='BaseDato';
//  qDatos.Tag:=99;
  qDatos.SQL.Add('SELECT CODIGOSECCIONFORMATODATOS FROM HVE_SECCIONFORMATODATOS ');
  qDatos.SQL.Add(' WHERE CODIGOFORMATOMTTODATOS='+ qFormatosPruebasCODIGOFORMATOMTTODATOS.AsString);
  qDatos.SQL.Add(' AND CODIGOSECCIONFORMATO='+ qPruebasProgramadasCODIGOSECCIONFORMATO.AsString);
  qDatos.SQL.Add(' AND SUBACTIVIDADODT='+ qSubactividadCODIGOSUBACTIVIDADAREAODT.AsString);
  qDatos.Open;
  if qDatos.Fields[0].AsString <>'' then
  begin
    FSeccionFormatoDatosODT:=TFSeccionFormatoDatosODT.Create(Application);
    qFormatosPruebas.Open;

    qrDatos:=TQuery.Create(Application);
    qrDatos.DatabaseName:='BaseDato';
  //  qrDatos.Tag:=99;
    qrDatos.SQL.Add('SELECT NOMBREFORMATOMTTO FROM HVE_FORMATOMTTO WHERE CODIGOFORMATOMTTO='+ qFormatosPruebasCODIGOFORMATOMTTO.AsString);
    qrDatos.Open;
//    FSeccionFormatoDatosODT.EFormato.text:=
    qrDatos.SQL.Clear;
    try
      FSeccionFormatoDatosODT.qSeccionDatos.Close;
      FSeccionFormatoDatosODT.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS='+qDatos.Fields[0].AsString;
      FSeccionFormatoDatosODT.qSeccionDatos.Open;
      qrDatos:=TQuery.Create(Application);
      qrDatos.DatabaseName:='BaseDato';
    //  qrDatos.Tag:=99;
      qrDatos.SQL.Add('SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO ='+ FSeccionFormatoDatosODT.qSeccionDatosCODIGOUSUARIOCREACION.AsString);
      qrDatos.Open;
      FSeccionFormatoDatosODT.Edit4.text:=qrDatos.Fields[0].AsString;
      qrDatos.SQL.Clear;
      FSeccionFormatoDatosODT.CrearTablaTemporalMedidas;
      FSeccionFormatoDatosODT.CargarTablaTemporalMedidas;

      FSeccionFormatoDatosODT.qSeccionDatos.Edit;
      if not FSeccionFormatoDatosODT.qSeccionDatos.Database.InTransaction then
         FSeccionFormatoDatosODT.qSeccionDatos.Database.StartTransaction;

      if FSeccionFormatoDatosODT.ShowModal=MrOK then
      begin
        FSeccionFormatoDatosODT.qSeccionDatos.Database.Commit;
        qFormatosPruebas.Close;
        qFormatosPruebas.Open;
      end
      else
        FSeccionFormatoDatosODT.qSeccionDatos.Database.Rollback;
    finally
        FSeccionFormatoDatosODT.Free;
    end;
  end
  else
  begin
    if qDatos.Fields[0].AsString ='' then
    begin
      FSeccionFormatoDatosODT:=TFSeccionFormatoDatosODT.Create(Application);
     try
     if not FSeccionFormatoDatosODT.qSeccionDatos.Database.InTransaction then
       FSeccionFormatoDatosODT.qSeccionDatos.Database.StartTransaction;
     FSeccionFormatoDatosODT.qSeccionDatos.Open;
     FSeccionFormatoDatosODT.qSeccionDatos.insert;
     FSeccionFormatoDatosODT.qSeccionDatos.Post;
     FSeccionFormatoDatosODT.qSeccionDatos.Edit;

     FSeccionFormatoDatosODT.qSeccionDatosCODIGOFORMATOMTTODATOS.AsInteger:= qFormatosPruebasCODIGOFORMATOMTTODATOS.AsInteger;
     FSeccionFormatoDatosODT.qSeccionDatosCODIGOSECCIONFORMATO.AsInteger:=qPruebasProgramadasCODIGOSECCIONFORMATO.AsInteger;
     FSeccionFormatoDatosODT.qSeccionDatosCODIGOUSUARIOCREACIONValidate(FSeccionFormatoDatosODT.qSeccionDatosCODIGOUSUARIOCREACION);
     FSeccionFormatoDatosODT.qSeccionDatosCODIGOODT.AsFloat:= qMantenimientosCODIGOODT.AsFloat;
     FSeccionFormatoDatosODT.qSeccionDatosSUBACTIVIDADODT.AsFloat:=qPruebasProgramadasCODIGOSUBACTIVIDADAREAODT.AsFloat;

     qrDatos:=TQuery.Create(Application);
     qrDatos.DatabaseName:='BaseDato';
//     qrDatos.Tag:=99;
     qrDatos.SQL.Add('SELECT NOMBREFORMATOMTTO FROM HVE_FORMATOMTTO WHERE CODIGOFORMATOMTTO='+ qPruebasProgramadasCODIGOFORMATOMTTO.AsString);
     qrDatos.Open;
     FSeccionFormatoDatosODT.EFormato.text:=qrDatos.Fields[0].AsString;
     qrDatos.SQL.Clear;
     qrDatos:=TQuery.Create(Application);
     qrDatos.DatabaseName:='BaseDato';
    // qrDatos.Tag:=99;
     qrDatos.SQL.Add('SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+ FSeccionFormatoDatosODT.qSeccionDatosCODIGOUSUARIOCREACION.AsString);
     qrDatos.Open;
     FSeccionFormatoDatosODT.Edit4.text:=qrDatos.Fields[0].AsString;
     qrDatos.SQL.Clear;
     if FSeccionFormatoDatosODT.ShowModal=MrOK then
       begin
        FSeccionFormatoDatosODT.qSeccionDatos.Database.Commit;
        qSeccionesPruebas.Close;
       END;
   finally
      FSeccionFormatoDatosODT.Free;
      end;
    end;
  end;
  qDatos.Free;
  qrDatos.Free;
end;

procedure TfListaRegistrarMantenimientoAnterior.FormCreate(Sender: TObject);
begin
  inherited;
  ListaFrom := TStringList.Create;
  index:=0;

  qMantenimientos.Open;
   if qMantenimientos.RecordCount <> 1 then
    PanelSuperior.Caption := 'MANTENIMIENTOS REALIZADOS     << ' + inttostr(qMantenimientos.recordcount)+' Registros Encontrados >>'
  else PanelSuperior.Caption := 'MANTENIMIENTOS REALIZADOS     << ' +inttostr(qMantenimientos.recordcount)+' Registro Encontrado >>';
  if qPruebasProgramadas.Active then
    qPruebasProgramadas.Close;
  qPruebasProgramadas.Open;
  qFormato.Close;
  qFormato.Open;

  ListaDireccionCampos:=TStringList.Create;
  ListaDireccionCampos.Add('CODIGOMTTO=-1');
  ListaDireccionCampos.Add('NOMBREMANTENIMIENTO=-1');
  ListaDireccionCampos.Add('TIPOMANTENIMIENTO=-1');
  ListaDireccionCampos.Add('COORDINACION=-1');
  ListaDireccionCampos.Add('FECHAINICIALMTTO=-1');
  ListaDireccionCampos.Add('FECHAFINALMTTO=-1');
  ListaDireccionCampos.Add('ESTADOMTTO=-1');
  ListaDireccionCampos.Add('TIPOELEMENTO=-1');
  ListaDireccionCampos.Add('TENSION=-1');
  ListaDireccionCampos.Add('SUBESTACION=-1');
  ListaDireccionCampos.Add('ELEMENTO=-1');

end;

procedure TfListaRegistrarMantenimientoAnterior.Filtrar;
begin
end;

procedure TfListaRegistrarMantenimientoAnterior.LimpiarFiltro;
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

procedure TfListaRegistrarMantenimientoAnterior.SBFiltrarClick(Sender: TObject);
begin
  fFiltroMantenimientoAnterior:=TfFiltroMantenimientoAnterior.Create(Application);
  fFiltroMantenimientoAnterior.ShowModal;
  qMantenimientos.SQL.Clear;
  qMantenimientos.Close;
  qMantenimientos.sql.text:=fFiltroMantenimientoAnterior.qmantenimientos.sql.text;
  qMantenimientos.Open;
  if qMantenimientos.RecordCount <> 1 then
    PanelSuperior.Caption := 'MANTENIMIENTOS REALIZADOS     << ' + inttostr(qMantenimientos.recordcount)+' Registros Encontrados >>'
  else PanelSuperior.Caption := 'MANTENIMIENTOS REALIZADOS     << ' +inttostr(qMantenimientos.recordcount)+' Registro Encontrado >>';
  fFiltroMantenimientoAnterior.Free;

  qFormatoDatos.Close;
  qSeccionDatos.Close;
  qFormatosPruebas.Close;
  qPruebasProgramadas.Close;
  qFormato.Close;

  qFormatoDatos.Open;
  qSeccionDatos.Open;
  qFormatosPruebas.Open;
  qPruebasProgramadas.Open;
  qFormato.Open;

end;

procedure TfListaRegistrarMantenimientoAnterior.SBImprimirClick(Sender: TObject);
begin
  FFormatoMttoImprimir:=TFFormatoMttoImprimir.create(Application);
  FFormatoMttoImprimir.Show;
end;

procedure TfListaRegistrarMantenimientoAnterior.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
{  if Field.FieldName='NOMBREESTADOREPORTE' then
  begin
     Background:=qReporte.FieldByName('COLOR').AsInteger;
     if BackGround = 0 then BackGround := clWhite;
  end;}
end;

procedure TfListaRegistrarMantenimientoAnterior.sbRefrescarClick(Sender: TObject);
begin
  inherited;
  qMantenimientos.Close;
  qMantenimientos.Open;
  qPruebasProgramadas.Close;
  qPruebasProgramadas.Open;
  qFormato.Close;
  qFormato.Open;
  {
  qFormatoDatos.Close;
  qFormatoDatos.Open;
  qSeccionDatos.close;
  qSeccionDatos.Open;
  qPruebasProgramadas.Close;
  qPruebasProgramadas.Open;
  qformato.Close;
  qFormato.Open;         }
end;

procedure TfListaRegistrarMantenimientoAnterior.sbEditarFormatoClick(
  Sender: TObject);
begin
  inherited;
  FFormatoMttoDatos:=TFFormatoMttoDatos.Create(Application);
  try
    FFormatoMttoDatos.qFormatoDatos.Close;
    FFormatoMttoDatos.qFormatoDatos.SQL.Text:='SELECT * FROM HVE_FORMATOMTTODATOS WHERE CODIGOFORMATOMTTODATOS = ' + qFormatoDatosCODIGOFORMATOMTTODATOS.AsString;
    FFormatoMttoDatos.qFormatoDatos.Open;
    FFormatoMttoDatos.qFormatoDatos.Edit;
    if not FFormatoMttoDatos.qFormatoDatos.Database.InTransaction then
       FFormatoMttoDatos.qFormatoDatos.Database.StartTransaction;
    if FFormatoMttoDatos.ShowModal=MrOK then
    begin
      FFormatoMttoDatos.qFormatoDatos.Database.Commit;
      qFormatoDatos.Close;
      qFormatoDatos.Open;
      qFormatoDatos.Locate('CODIGOFORMATOMTTODATOS',(FFormatoMttoDatos.qFormatoDatosCODIGOFORMATOMTTODATOS.AsInteger),[]);
    end
    else
      FFormatoMttoDatos.qFormatoDatos.Database.Rollback;
 finally
    FFormatoMttoDatos.Free;
  end;
end;

procedure TfListaRegistrarMantenimientoAnterior.sbEditarSeccionClick(
  Sender: TObject);
begin
  inherited;
  FSeccionFormatoDatos:=TFSeccionFormatoDatos.Create(Application);
  try
    //***
//    FSeccionFormatoDatos.DBEdit8.Text:=qFormatoDatosNombreFormatoMtto.AsString;
//    qFormatoDatos.Open;
    //***
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

procedure TfListaRegistrarMantenimientoAnterior.sbInsertarSeccionClick(
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

procedure TfListaRegistrarMantenimientoAnterior.sbInsertarFormatoClick(
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

procedure TfListaRegistrarMantenimientoAnterior.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  action:=cafree;
end;

procedure TfListaRegistrarMantenimientoAnterior.RxDBGConsultaMttoAnteriorDblClick(
  Sender: TObject);
begin
  if qPruebasProgramadas.Active then
    qPruebasProgramadas.Close;
  qPruebasProgramadas.Open;
  qFormato.Close;
  qFormato.Open;
end;

procedure TfListaRegistrarMantenimientoAnterior.qFormatoCalcFields(
  DataSet: TDataSet);
begin
  qFormatocodigoMantenimiento.AsString:=qPruebasProgramadasCODIGOMANTENIMIENTO.AsString;
end;

procedure TfListaRegistrarMantenimientoAnterior.SBBuscarClick(
  Sender: TObject);
begin
  inherited;
  FBusquedaMtto := TFBusquedaMtto.Create(Application);
  FBusquedaMtto.dsMtto.DataSet:=qMantenimientos;
  FBusquedaMtto.ShowModal;
  FBusquedaMtto.Free;
  RxDBGConsultaMttoAnterior.Setfocus;
end;

procedure TfListaRegistrarMantenimientoAnterior.SBOrdenarClick(
  Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel2.ClientToScreen(Classes.Point(SBOrdenar.Left, SBOrdenar.top));
  pmOrdenar.Popup(punto.x+10, punto.y+10);
end;

//ORDENAR
procedure TfListaRegistrarMantenimientoAnterior.Ordenar(sCriterio: String);
begin
  qMantenimientos.Close;
  qMantenimientos.SQL.Delete(qMantenimientos.SQL.Count - 1);
  qMantenimientos.SQL.Add(sCriterio);
  qMantenimientos.Open;
  RxDBGConsultaMttoAnterior.SetFocus;
end;

procedure TfListaRegistrarMantenimientoAnterior.CodigoMttoClick(
  Sender: TObject);
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
  with RxDBGConsultaMttoAnterior do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosCODIGOMANTENIMIENTO;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfListaRegistrarMantenimientoAnterior.NombreMantenimientoClick(
  Sender: TObject);
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
  with RxDBGConsultaMttoAnterior do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBRETAREA;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfListaRegistrarMantenimientoAnterior.TipoMantenimientoClick(
  Sender: TObject);
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
  with RxDBGConsultaMttoAnterior do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBREMANT;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfListaRegistrarMantenimientoAnterior.CoordinacionClick(
  Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('COORDINACION');
  sCriterio := 'ORDER BY a.nombreareaoperacionodt DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['COORDINACION']='1' then
    begin
      sCriterio := 'ORDER BY a.nombreareaoperacionodt ASC';
      ListaDireccionCampos.Values['COORDINACION']:='-1';
    end
    else
      ListaDireccionCampos.Values['COORDINACION']:='1'
  end;
  Coordinacion.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMttoAnterior do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBREAREAOPERACIONODT;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfListaRegistrarMantenimientoAnterior.FechaInicialMttoClick(
  Sender: TObject);
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
  with RxDBGConsultaMttoAnterior do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosFECHAINICIAL;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfListaRegistrarMantenimientoAnterior.FechaFinalMttoClick(
  Sender: TObject);
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
  with RxDBGConsultaMttoAnterior do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosFECHAFINAL;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfListaRegistrarMantenimientoAnterior.EstadoMttoClick(
  Sender: TObject);
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
  with RxDBGConsultaMttoAnterior do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBREESTADO;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfListaRegistrarMantenimientoAnterior.TipoElementoClick(
  Sender: TObject);
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
  with RxDBGConsultaMttoAnterior do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBRETIPOELEMENTO;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfListaRegistrarMantenimientoAnterior.TensionClick(
  Sender: TObject);
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
  with RxDBGConsultaMttoAnterior do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosTENSION;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfListaRegistrarMantenimientoAnterior.SubestacionClick(
  Sender: TObject);
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
  with RxDBGConsultaMttoAnterior do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBRESUBESTACION;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfListaRegistrarMantenimientoAnterior.sbExportarClick(
  Sender: TObject);
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
  oWB.ActiveSheet.Cells[1,4] := 'COORDINACION';
  oWB.ActiveSheet.Cells[1,5] := 'FECHA INICIAL';
  oWB.ActiveSheet.Cells[1,6] := 'FECHA FINAL';
  oWB.ActiveSheet.Cells[1,7] := 'SUBESTACION';
  oWB.ActiveSheet.Cells[1,8] := 'TIPO ELEMENTO';
  oWB.ActiveSheet.Cells[1,9] := 'TENSION';
  oWB.ActiveSheet.Cells[1,10] := 'ESTADO';
//  oWB.ActiveSheet.Cells[1,11] := 'ELEMENTO';                  
  qMantenimientos.First;
  fila:= 2;
  while not qMantenimientos.eof do
  begin
    oWB.ActiveSheet.Cells[fila,1] :=  qMantenimientos.FIELDBYNAME('CODIGOMANTENIMIENTO').asstring;
    oWB.ActiveSheet.Cells[fila,2] :=  qMantenimientos.FIELDBYNAME('NOMBRETAREA').asstring;
    oWB.ActiveSheet.Cells[fila,3] :=  qMantenimientos.FIELDBYNAME('NOMBREMANT').asstring;
    oWB.ActiveSheet.Cells[fila,4] :=  qMantenimientos.FIELDBYNAME('NOMBREAREAOPERACIONODT').asstring;
    oWB.ActiveSheet.Cells[fila,5] :=  qMantenimientos.FIELDBYNAME('FECHAINICIAL').asstring;
    oWB.ActiveSheet.Cells[fila,6] :=  qMantenimientos.FIELDBYNAME('FECHAFINAL').asstring;
    oWB.ActiveSheet.Cells[fila,7] :=  qMantenimientos.FIELDBYNAME('NOMBRESUBESTACION').asstring;
    oWB.ActiveSheet.Cells[fila,8] :=  qMantenimientos.FIELDBYNAME('NOMBRETIPOELEMENTO').asstring;
    oWB.ActiveSheet.Cells[fila,9] :=  qMantenimientos.FIELDBYNAME('TENSION').asstring;
    oWB.ActiveSheet.Cells[fila,10]:=  qMantenimientos.FIELDBYNAME('NOMBREESTADO').asstring;
//    oWB.ActiveSheet.Cells[fila,11]:=  qMantenimientos.FIELDBYNAME('ELEMENTO').asstring;
    fila:= fila + 1;
    qMantenimientos.next;
  end;
  oWB.SaveAs('C:\EnerGIS4\ConsultaMttosAnterioresRegistrados'+'_'+IntToStr(Day)+'_'+ IntToStr(Month)+'_' +IntToStr(Year) + '_'+ IntToStr(Hour)+'y'+IntToStr(Min),null,'','',EmptyParam,EmptyParam,0, EmptyParam, EmptyParam, EmptyParam,EmptyParam,0);
end;

end.
