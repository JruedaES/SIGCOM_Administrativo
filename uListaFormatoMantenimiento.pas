//***************************************************************************
//                       Módulo de ODT
//               Listado de Órdenes de Trabajo
//      A través de este listado se insertan o Editan ODTs y ODTs hijas
//***************************************************************************
unit uListaFormatoMantenimiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls, Mask, RXSplit,
  Menus, MPlayer;

type
  TfListaFormatoMantenimiento = class(TFdSgdListaBase)
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
    qFormatoMtto: TQuery;
    dsFormatoMtto: TDataSource;
    qFormatoDatosNombreFormatoMtto: TStringField;
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
    qFormatoMttoCODIGOFORMATOMTTO: TFloatField;
    qFormatoMttoNOMBREFORMATOMTTO: TStringField;
    qFormatoMttoCODIGOCOORDINACION: TFloatField;
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

  private
    { Private declarations }
  public
    { Public declarations }
    sCriterio : String;
    index:Integer;
    Lista,ListaEstadistica,ListaFrom : TStringList;
    procedure Filtrar;
    procedure LimpiarFiltro;
  end;
var
  fListaFormatoMantenimiento: TfListaFormatoMantenimiento;

implementation

uses UFormatoMttoDatos, uElementosAsociadosODT, uQRListaODTViaticos,
  uQRListaODTAuxilios, USeccionFormatoDatos, UFormatoMttoImprirmir;

  {$R *.DFM}

procedure TfListaFormatoMantenimiento.dbgListaOdtPadreGetCellParams(Sender: TObject;
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

procedure TfListaFormatoMantenimiento.FormDestroy(Sender: TObject);
begin
 ListaFrom.Free;
 ListaEstadistica.Free;
  inherited;
end;

procedure TfListaFormatoMantenimiento.dbgListaOdtPadreDblClick(Sender: TObject);
begin
  inherited;
  if qFormatoDatosCODIGOFORMATOMTTODATOS.AsString <> '' then
    sbEditarFormatoClick(nil);
end;

procedure TfListaFormatoMantenimiento.FormShow(Sender: TObject);
begin
  Filtrar;
//  inherited;
end;

procedure TfListaFormatoMantenimiento.dbgListaHijasDblClick(Sender: TObject);
begin
  inherited;
  if qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString <> '' then
    sbEditarSeccionClick(nil);
end;

procedure TfListaFormatoMantenimiento.FormCreate(Sender: TObject);
begin
  inherited;
  ListaFrom := TStringList.Create;
  index:=0;
end;

procedure TfListaFormatoMantenimiento.Filtrar;
begin
end;

procedure TfListaFormatoMantenimiento.LimpiarFiltro;
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

procedure TfListaFormatoMantenimiento.SBFiltrarClick(Sender: TObject);
begin
  Filtrar;
  inherited;
end;

procedure TfListaFormatoMantenimiento.SBImprimirClick(Sender: TObject);
begin
  FFormatoMttoImprimir:=TFFormatoMttoImprimir.create(Application);
  FFormatoMttoImprimir.Show;
end;

procedure TfListaFormatoMantenimiento.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
{  if Field.FieldName='NOMBREESTADOREPORTE' then
  begin
     Background:=qReporte.FieldByName('COLOR').AsInteger;
     if BackGround = 0 then BackGround := clWhite;
  end;}
end;

procedure TfListaFormatoMantenimiento.sbRefrescarClick(Sender: TObject);
begin
  inherited;
  qFormatoDatos.Close;
  qFormatoDatos.Open;
  qSeccionDatos.close;
  qSeccionDatos.Open;
end;
procedure TfListaFormatoMantenimiento.sbEditarFormatoClick(
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

procedure TfListaFormatoMantenimiento.sbEditarSeccionClick(
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
//    FSeccionFormatoDatos.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS = ' + qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
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

procedure TfListaFormatoMantenimiento.sbInsertarSeccionClick(
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
    SHOWMESSAGE('AQUÍ' + FSeccionFormatoDatos.qFormatoDatosCODIGOFORMATOMTTODATOS.AsString);
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

procedure TfListaFormatoMantenimiento.sbInsertarFormatoClick(
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

procedure TfListaFormatoMantenimiento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  action:=cafree;
end;

end.
