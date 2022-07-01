unit uListaStock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, Grids, DBGrids, RXDBCtrl,  UTrCVS, DBTables, Db,
  Digisoft, StdCtrls, ExtCtrls, UtdNavigator, Buttons, Menus, ComCtrls,
  ImgList, Mask, DBCtrls;

type
  TfListaStock = class(TFdSgdListaBase)
    Panel4: TPanel;
    DBText1: TDBText;
    Label1: TLabel;
    qListaStock: TQuery;
    dbgStockGrupos: TRxDBGrid;
    qGrupoTrabajo: TQuery;                                                                                                            
    dsGrupoTrabajo: TDataSource;
    UpdSQLListaStock: TUpdateSQL;
    qListaStockCODIGOADMINISTRATIVO: TFloatField;
    qListaStockCODIGOGRUPOTRABAJO: TFloatField;
    qListaStockCODIGOMATERIAL: TFloatField;
    qListaStockCANTIDADMINIMA: TFloatField;
    qListaStockNOMBREMATERIAL: TStringField;
    qListaStockCODIGOUNIDAD: TStringField;
    qListaStockVALORUNITARIO: TFloatField;
    qListaStockNOMBREADMINISTRATIVO: TStringField;
    qListaStockNOMBREGRUPOTRABAJO: TStringField;
    qListaStockVALORTOTAL: TFloatField;
    pmOrdenar: TPopupMenu;
    CIA1: TMenuItem;
    GrupoTrabajo1: TMenuItem;
    Nombre1: TMenuItem;
    Horario1: TMenuItem;
    pmImprimirMovimiento: TPopupMenu;
    Notebook: TNotebook;
    ImageList1: TImageList;
    Panel5: TPanel;
    DBNavigator1: TDBNavigator;
    dbgBalance: TRxDBGrid;
    qBalance: TQuery;
    dsBalance: TDataSource;
    Panel6: TPanel;
    Panel7: TPanel;
    Label18: TLabel;
    LFechaAsignacion: TLabel;
    sbFechaAprobacion: TSpeedButton;
    sbFechaAsignacion: TSpeedButton;
    Panel8: TPanel;
    tvOpciones: TTreeView;
    Panel9: TPanel;
    eFechaInicial: TEdit;
    eFechaFinal: TEdit;
    Label2: TLabel;
    sbReporteMovimiento: TSpeedButton;
    Movimientodelgruposeleccionado1: TMenuItem;
    Movimientodeladependenciapormviles1: TMenuItem;
    Movimientodeladependencia1: TMenuItem;
    sbReporteEstado: TSpeedButton;
    pmImprimirEstado: TPopupMenu;
    Estadodelstockdelgruposeleccionado1: TMenuItem;
    Estadodelstockdetodaladependencia1: TMenuItem;
    sbTraslados: TSpeedButton;
    qListaStockCANTIDADACTUAL: TFloatField;
    qListaStockCANTIDADACTUALDESMANTELADABUEN: TFloatField;
    qBalanceNOMBREGRUPOTRABAJO: TStringField;
    qBalanceCODIGOMATERIAL: TFloatField;
    qBalanceNOMBREMATERIAL: TStringField;
    qBalanceCODIGOUNIDAD: TStringField;
    qBalanceTRASLADONUEVONEGATIVO: TFloatField;
    qBalanceTRASLADODESMANNEGATIVO: TFloatField;
    qBalanceCANTIDADENTREGADA: TFloatField;
    qBalanceCANTIDADCONSUMIDA: TFloatField;
    qBalanceCANTIDADCONSUMIDADESMANTELADA: TFloatField;
    qBalanceCANTIDADRETIRADABUENA: TFloatField;
    qBalanceCANTIDADRETIRADAMALA: TFloatField;
    qBalanceCANTIDADREINTEGRADABUENA: TFloatField;
    qBalanceCANTIDADREINTEGRADAMALA: TFloatField;
    qBalanceCANTIDADREINTEGRADABUENADESMAN: TFloatField;
    qBalanceCANTIDADREINTEGRADAMALADESMAN: TFloatField;
    qBalanceCANTIDADTRASLADONUEVA: TFloatField;
    qBalanceCANTIDADTRASLADODESMAN: TFloatField;
    qBalanceBALANCENUEVO: TFloatField;
    qBalanceBALANCEDESMANTELADO: TFloatField;
    MovimientodeladependenciaporODT1: TMenuItem;
    MovimientodeladependenciaporRequisicion1: TMenuItem;
    qGrupoTrabajoCODIGOADMINISTRATIVO: TFloatField;
    qGrupoTrabajoNOMBREADMINISTRATIVO: TStringField;
    qGrupoTrabajoCODIGOGRUPOTRABAJO: TFloatField;
    qGrupoTrabajoNOMBREGRUPOTRABAJO: TStringField;
    qGrupoTrabajoCODIGOTIPOTURNO: TFloatField;
    qGrupoTrabajoNOMBRETIPOTURNO: TStringField;
    Panel10: TPanel;
    sbAuditoria: TSpeedButton;
    dbnAuditoria: TDBNavigator;
    qAuditoria: TQuery;
    dsAuditoria: TDataSource;
    updAuditoria: TUpdateSQL;
    dsDetalleAuditorial: TDataSource;
    updDetalleAuditoria: TUpdateSQL;
    qAuditoriaCODIGOODTAUDITORIASTOCK: TFloatField;
    qAuditoriaCODIGOADMINISTRATIVO: TFloatField;
    qAuditoriaCODIGOODT: TFloatField;
    qAuditoriaCONSECUTIVO: TFloatField;
    qAuditoriaCODIGOGRUPOTRABAJO: TFloatField;
    qDetalleAuditoria: TQuery;
    qDetalleAuditoriaCODIGOODTAUDITORIASTOCK: TFloatField;
    qDetalleAuditoriaCODIGOMATERIAL: TFloatField;
    qDetalleAuditoriaCANTIDADNUEVA: TFloatField;
    qDetalleAuditoriaCANTIDADNUEVAREAL: TFloatField;
    qDetalleAuditoriaCANTIDADDESMANTBUENA: TFloatField;
    qDetalleAuditoriaCANTIDADDESMANTBUENAREAL: TFloatField;
    qDetalleAuditoriaCANTIDADDESMANTMALA: TFloatField;
    qDetalleAuditoriaCANTIDADDESMANTMALAREAL: TFloatField;
    qDetalleAuditoriaNOMBREMATERIAL: TStringField;
    qDetalleAuditoriaCODIGOUNIDAD: TStringField;
    dbgauditoria: TDBGrid;
    qListaStockCANTIDADACTUALDESMANTELADAMALA: TFloatField;
    qDiferenciasAuditoria: TQuery;
    qDiferenciasAuditoriaCODIGOODTAUDITORIASTOCK: TFloatField;
    qDiferenciasAuditoriaCODIGOMATERIAL: TFloatField;
    qDiferenciasAuditoriaDIFERENCIAACTUAL: TFloatField;
    qDiferenciasAuditoriaDIFERENCIADESMBUENA: TFloatField;
    qDiferenciasAuditoriaDIFERENCIADESMALA: TFloatField;
    Panel11: TPanel;
    dbGridStock: TRxDBGrid;
    dbgSerial: TRxDBGrid;
    qSerial: TQuery;
    qSerialSERIAL: TStringField;
    qSerialID: TFloatField;
    dsSerial: TDataSource;
    procedure qListaStockAfterPost(DataSet: TDataSet);
    procedure qListaStockAfterDelete(DataSet: TDataSet);
    procedure qListaStockCalcFields(DataSet: TDataSet);
    procedure qListaStockAfterInsert(DataSet: TDataSet);
    procedure SBOrdenarClick(Sender: TObject);
    procedure Ordenar(sCriterio: String);
    procedure CIA1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Nombre1Click(Sender: TObject);
    procedure GrupoTrabajo1Click(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure Reportedemovimientodemateriales1Click(Sender: TObject);
    procedure tvOpcionesChange(Sender: TObject; Node: TTreeNode);
    procedure sbFechaAprobacionClick(Sender: TObject);
    procedure sbFechaAsignacionClick(Sender: TObject);
    function GetFecha(Tipo: Boolean): String;
    procedure qGrupoTrabajoAfterScroll(DataSet: TDataSet);
    procedure sbReporteMovimientoClick(Sender: TObject);
    procedure eFechaInicialChange(Sender: TObject);
    procedure Movimientodeladependenciapormviles1Click(Sender: TObject);
    procedure Movimientodeladependencia1Click(Sender: TObject);
    procedure eFechaFinalChange(Sender: TObject);
    procedure Estadodelstockdelgruposeleccionado1Click(Sender: TObject);
    procedure Estadodelstockdetodaladependencia1Click(Sender: TObject);
    procedure sbReporteEstadoClick(Sender: TObject);
    procedure qListaStockAfterEdit(DataSet: TDataSet);
    procedure qGrupoTrabajoAfterOpen(DataSet: TDataSet);
    procedure sbTrasladosClick(Sender: TObject);
    procedure MovimientodeladependenciaporODT1Click(Sender: TObject);
    procedure MovimientodeladependenciaporRequisicion1Click(
      Sender: TObject);
    procedure qAuditoriaAfterPost(DataSet: TDataSet);
    procedure qAuditoriaAfterInsert(DataSet: TDataSet);
    procedure qDetalleAuditoriaAfterPost(DataSet: TDataSet);
    procedure qDetalleAuditoriaAfterInsert(DataSet: TDataSet);
    procedure sbAuditoriaClick(Sender: TObject);
    procedure qListaStockBeforePost(DataSet: TDataSet);
    procedure qDetalleAuditoriaCalcFields(DataSet: TDataSet);
    procedure dbgauditoriaEditButtonClick(Sender: TObject);
    procedure qAuditoriaBeforeEdit(DataSet: TDataSet);
    procedure qAuditoriaBeforeInsert(DataSet: TDataSet);
    procedure qDetalleAuditoriaBeforeInsert(DataSet: TDataSet);
    procedure qDetalleAuditoriaBeforePost(DataSet: TDataSet);
    procedure qListaStockAfterScroll(DataSet: TDataSet);
    procedure qListaStockBeforeDelete(DataSet: TDataSet);
  private
    { Private declarations }
    FechaInicial, FechaFinal: TDateTime;
    function TienePermisos(pVarCodigoUsuario: Integer; pCIA: string): Boolean;
  public
    Auditoria:boolean;
    codigoodt:double;
    codigoauditoria:double;
    consecutivo:integer;
    codigoadministrativo:double;
    codigogrupotrabajo:integer;
    { Public declarations }
    Lista, ListaDireccionCampos, ListaFrom: TStringList;
    EditarStock: boolean;
    EditarAuditoria:boolean;
    procedure Filtrar;
    procedure LimpiarFiltro;
    procedure AuditoriaStockCuadrilla(odt,administrativo: double; consec, grupotrabajo: integer);
    procedure InsertaMaterialAuditoriaStock;
    function Serializado: boolean;
  end;

var
  fListaStock: TfListaStock;

implementation

uses uBuscarMaterial, uStockGrupoTrabajo, uBuscarStock, uFIMPAdministrativo,
  uQRBalanceMaterialMoviles, uFormaFecha,  uQRBalanceMaterialDependencia,
  uQREstadoActualMovil, ConsDll, uTraslado, uQRBalanceMaterialMovilesODT,
  uQRBalanceMaterialMovilesReq, uQRAuditoriaStockMoviles,
  uComunesAdministrativo;

{$R *.DFM}

procedure TfListaStock.qListaStockAfterPost(DataSet: TDataSet);
begin
  inherited;
  qListaStock.ApplyUpdates;
  qListaStock.CommitUpdates;
end;

procedure TfListaStock.qListaStockAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qListaStock.ApplyUpdates;
  qListaStock.CommitUpdates;
end;

procedure TfListaStock.qListaStockCalcFields(DataSet: TDataSet);
var qDatos:TQuery;
begin
  inherited;
  qDatos:=TQuery.Create(Application);
  qDatos.DatabaseName:='BaseDato';
  qDatos.SQL.Text:='SELECT SUM(VALORUNITARIO) FROM  STOCKGRUPOTRABAJO WHERE '+
                   'CODIGOADMINISTRATIVO = '+qListaStockCODIGOADMINISTRATIVO.AsString +
                   ' AND CODIGOGRUPOTRABAJO = '+qListaStockCODIGOGRUPOTRABAJO.AsString;
  qDatos.Open;
end;

procedure TfListaStock.qListaStockAfterInsert(DataSet: TDataSet);
begin
  if qGrupoTrabajoCODIGOGRUPOTRABAJO.AsString <> '' then
  begin
    try
      fStockGrupoTrabajo := TfStockGrupoTrabajo.Create(Application);
      with fStockGrupoTrabajo do
      begin
        qStockGrupoTrabajo.Insert;
        qStockGrupoTrabajo.FieldByName('CODIGOADMINISTRATIVO').AsString := Self.qGrupoTrabajo.FieldbyName('CODIGOADMINISTRATIVO').AsString;
        qStockGrupoTrabajo.FieldByName('CODIGOGRUPOTRABAJO').AsString   := Self.qGrupoTrabajo.FieldbyName('CODIGOGRUPOTRABAJO').AsString;
        qStockGrupoTrabajo.FieldByName('CANTIDADACTUAL').AsFloat := qStockGrupoTrabajo.FieldbyName('CANTIDADACTUAL').AsFloat;
        qStockGrupoTrabajo.FieldByName('FECHAULTIMOINVENTARIO').AsString := FormatDateTime('dd/mm/yyyy', Now);
        if ShowModal = mrOk then
        begin
          qListaStock.Close;
          qListaStock.Open;
          qListaStock.Locate('CODIGOMATERIAL',(qStockGrupoTrabajoCODIGOMATERIAL.AsString),[]);
        end
        else
          DataSet.Cancel;
      end;
    finally
      fStockGrupoTrabajo.Free;
    end;
  end;
end;

procedure TfListaStock.SBOrdenarClick(Sender: TObject);
var
  Punto: TPoint;
begin
  inherited;
  Punto := Panel2.ClientToScreen(Classes.Point(SBOrdenar.Left, SBOrdenar.top));
  pmOrdenar.Popup(Punto.x + 10, Punto.y + 10);
end;

procedure TfListaStock.Ordenar(sCriterio: String);
begin
  qGrupoTrabajo.Close;
  qGrupoTrabajo.SQL.Delete(qGrupoTrabajo.SQL.Count - 1);
  qGrupoTrabajo.SQL.Add(sCriterio);
  qGrupoTrabajo.Open;
  dbgStockGrupos.SetFocus;
end;

procedure TfListaStock.CIA1Click(Sender: TObject);
var
  Posicion: Integer;
begin
  inherited;
  Posicion := ListaDireccionCampos.IndexOfName('CODIGOADMINISTRATIVO');
  sCriterio := 'ORDER BY G.CODIGOADMINISTRATIVO DESC';
  if Posicion <> -1 then
  begin
    if ListaDireccionCampos.Values['CODIGOADMINISTRATIVO'] = '1' then
    begin
      sCriterio := 'ORDER BY G.CODIGOADMINISTRATIVO ASC';
      ListaDireccionCampos.Values['CODIGOADMINISTRATIVO'] := '-1';
    end
    else
      ListaDireccionCampos.Values['CODIGOADMINISTRATIVO'] := '1'
  end;
  Ordenar(sCriterio);
  dbgStockGrupos.SelectedField := qGrupoTrabajoCODIGOADMINISTRATIVO;
end;

procedure TfListaStock.FormCreate(Sender: TObject);
begin
  inherited;
  ListaDireccionCampos := TStringList.Create;
  ListaDireccionCampos.Add('CODIGOADMINISTRATIVO=-1');
  ListaDireccionCampos.Add('CODIGOGRUPOTRABAJO=-1');
  ListaDireccionCampos.Add('NOMBREGRUPOTRABAJO=-1');
  ListaDireccionCampos.Add('NOMBREHORARIOTRABAJO=-1');
  ListaFrom := TStringList.Create;
  //eFechaInicial.Text := FormatDateTime('dd/mm/yyyy', Now);
  eFechaInicial.Text := DateToStr( Now);
  eFechaFinal.Text := DateToStr( Now);
  Notebook.ActivePage := 'EstadoActual';
  Auditoria:=false;
  EditarStock:= false;
  EditarAuditoria:=false;
  RefrescarVariables;
end;

procedure TfListaStock.Nombre1Click(Sender: TObject);
var
  Posicion: Integer;
begin
  inherited;
  Posicion := ListaDireccionCampos.IndexOfName('NOMBREGRUPOTRABAJO');
  sCriterio := 'ORDER BY G.NOMBREGRUPOTRABAJO DESC';
  if Posicion <> -1 then
  begin
    if ListaDireccionCampos.Values['NOMBREGRUPOTRABAJO'] = '1' then
    begin
      sCriterio := 'ORDER BY G.NOMBREGRUPOTRABAJO ASC';
      ListaDireccionCampos.Values['NOMBREGRUPOTRABAJO'] := '-1';
    end
    else
      ListaDireccionCampos.Values['NOMBREGRUPOTRABAJO'] := '1'
  end;
  Ordenar(sCriterio);
  dbgStockGrupos.SelectedField := qGrupoTrabajoNOMBREGRUPOTRABAJO;
end;

procedure TfListaStock.GrupoTrabajo1Click(Sender: TObject);
var
  Posicion: Integer;
begin
  inherited;
  Posicion := ListaDireccionCampos.IndexOfName('CODIGOGRUPOTRABAJO');
  sCriterio := 'ORDER BY G.CODIGOGRUPOTRABAJO DESC';
  if Posicion <> -1 then
  begin
    if ListaDireccionCampos.Values['CODIGOGRUPOTRABAJO'] = '1' then
    begin
      sCriterio := 'ORDER BY G.CODIGOGRUPOTRABAJO ASC';
      ListaDireccionCampos.Values['CODIGOGRUPOTRABAJO'] := '-1';
    end
    else
      ListaDireccionCampos.Values['CODIGOGRUPOTRABAJO'] := '1'
  end;
  Ordenar(sCriterio);
  dbgStockGrupos.SelectedField := qGrupoTrabajoCODIGOGRUPOTRABAJO;
end;

procedure TfListaStock.SBBuscarClick(Sender: TObject);
begin
  inherited;
  fBuscarStock := TfBuscarStock.Create(Application);
  fBuscarStock.dsStock.DataSet := qGrupoTrabajo;
  fBuscarStock.ShowModal;
  dbgStockGrupos.SetFocus;
  fBuscarStock.Free;
end;

procedure TfListaStock.FormShow(Sender: TObject);
begin
  inherited;
  qGrupoTrabajo.Close;
  Filtrar;
end;

procedure TfListaStock.Filtrar;
var
  CadFrom: String;
begin
  Lista := GetQueryFiltroStock(ListaRotulos, ListaDatos, ListaFrom);
  if Lista <> nil then
  begin
    qGrupoTrabajo.Close;
    if qGrupoTrabajo.sql.Count > 5 then
      LimpiarFiltro;
    qGrupoTrabajo.SQL.insert(5,Lista.Text);
    CadFrom := 'FROM GRUPOTRABAJO G, TIPOTURNO TT, ADMINISTRATIVO A';
    qGrupoTrabajo.SQL[2] := CadFrom;
    qGrupoTrabajo.SQL.insert(qGrupoTrabajo.sql.Count, 'order by 1 ');
    qGrupoTrabajo.Open;
    if qGrupoTrabajo.RecordCount > 0 then
      lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + IntToStr(qGrupoTrabajo.RecordCount) + ' Registros Encontrados >>'
    else
      lFiltroDatos.Caption := ' << FILTRO DE DATOS >> ';
  end;
end;

procedure TfListaStock.SBFiltrarClick(Sender: TObject);
begin
  Filtrar;
  inherited;
end;

procedure TfListaStock.LimpiarFiltro;
var
  nLineasExtra, I: Byte;
begin
  nLineasExtra := qGrupoTrabajo.SQL.Count - 5;
  if nLineasExtra > 0 then
    for I := 1 to nLineasExtra do
    begin
      qGrupoTrabajo.SQL.Delete(5);
    end;
end;


//Movimiento del Grupo Seleccionado............
procedure TfListaStock.Reportedemovimientodemateriales1Click(
  Sender: TObject);
begin
  fQRBalanceMaterialMoviles := TfQRBalanceMaterialMoviles.Create(Application);
  try
    with fQRBalanceMaterialMoviles do
    begin
      qBalance.close;
      qBalance.SQL.Clear;
      //qBalance.SQL.Add('SELECT NOMBREGRUPOTRABAJO, CODIGOMATERIAL, NOMBREMATERIAL,CODIGOUNIDAD,CODIGOODT,CONSECUTIVO,SUM(cantidad) AS TRASLADONUEVONEGATIVO, '+
      qBalance.SQL.Add('SELECT NOMBREGRUPOTRABAJO, CODIGOMATERIAL, NOMBREMATERIAL,CODIGOUNIDAD,SUM(cantidad) AS TRASLADONUEVONEGATIVO, '+
      'SUM(cantidaddesmantelada) AS TRASLADODESMANNEGATIVO, SUM(CANTIDADENTREGADA) AS CANTIDADENTREGADA, SUM(CANTIDADCONSUMIDA) AS CANTIDADCONSUMIDA, '+
      'SUM(CANTIDADCONSUMIDADESMANTELADA) AS CANTIDADCONSUMIDADESMANTELADA, SUM (CANTIDADRETIRADABUENA) AS CANTIDADRETIRADABUENA, '+
      'SUM(CANTIDADRETIRADAMALA) AS CANTIDADRETIRADAMALA,SUM (CANTIDADREINTEGRADABUENA) AS CANTIDADREINTEGRADABUENA, '+
      'SUM(CANTIDADREINTEGRADAMALA) AS CANTIDADREINTEGRADAMALA, SUM(CANTIDADREINTEGRADABUENADESMAN) AS CANTIDADREINTEGRADABUENADESMAN, '+
      'SUM(CANTIDADREINTEGRADAMALADESMAN) AS CANTIDADREINTEGRADAMALADESMAN,SUM(CANTIDADTRASLADONUEVA) AS CANTIDADTRASLADONUEVA, '+
      'SUM(CANTIDADTRASLADODESMAN) AS CANTIDADTRASLADODESMAN, '+
      '(NVL(SUM(CANTIDADTRASLADONUEVA),0)+NVL(SUM(CANTIDADENTREGADA),0)-NVL(SUM(cantidad),0)- NVL(SUM(CANTIDADCONSUMIDA),0)-NVL(SUM (CANTIDADREINTEGRADABUENA),0)-NVL(SUM(CANTIDADREINTEGRADAMALA),0)) AS BALANCENUEVO, '+
      '(NVL(SUM(CANTIDADTRASLADODESMAN),0)+ NVL(SUM(CANTIDADRETIRADAMALA),0)+NVL(SUM (CANTIDADRETIRADABUENA),0)-NVL(SUM(cantidaddesmantelada),0)- '+
      'NVL(SUM(CANTIDADCONSUMIDADESMANTELADA),0)-NVL(SUM(CANTIDADREINTEGRADABUENADESMAN),0)-NVL(SUM(CANTIDADREINTEGRADAMALADESMAN),0)) AS BALANCEDESMANTELADO '+
      'FROM '+
      '( '+
      //'SELECT G.NOMBREGRUPOTRABAJO, M.CODIGOMATERIAL, M.NOMBREMATERIAL,M.CODIGOUNIDAD,OD.CODIGOODT, OD.CONSECUTIVO,0 AS cantidad, 0 AS cantidaddesmantelada, '+
      'SELECT G.NOMBREGRUPOTRABAJO, M.CODIGOMATERIAL, M.NOMBREMATERIAL,M.CODIGOUNIDAD,0 AS cantidad, 0 AS cantidaddesmantelada, '+
      'NVL(SUM(OP.CANTIDADENTREGADA),0) AS CANTIDADENTREGADA, NVL(SUM(OP.CANTIDADCONSUMIDA),0) AS CANTIDADCONSUMIDA, '+
      'NVL(SUM(OP.CANTIDADCONSUMIDADESMANTELADA),0) AS CANTIDADCONSUMIDADESMANTELADA, NVL(SUM(OP.CANTIDADRETIRADABUENA),0) AS CANTIDADRETIRADABUENA, '+
      'NVL(SUM(OP.CANTIDADRETIRADAMALA),0) AS CANTIDADRETIRADAMALA,NVL(SUM(OP.CANTIDADREINTEGRADABUENA),0) AS CANTIDADREINTEGRADABUENA, '+
      'NVL(SUM(OP.CANTIDADREINTEGRADAMALA),0) AS CANTIDADREINTEGRADAMALA, NVL(SUM(OP.CANTIDADREINTEGRADABUENADESMAN),0) AS CANTIDADREINTEGRADABUENADESMAN, '+
      'NVL(SUM(OP.CANTIDADREINTEGRADAMALADESMAN),0) AS CANTIDADREINTEGRADAMALADESMAN,NVL(SUM(CANTIDADTRASLADONUEVA),0) AS CANTIDADTRASLADONUEVA, '+
      'NVL(SUM(CANTIDADTRASLADODESMAN),0) AS CANTIDADTRASLADODESMAN '+
      'FROM ODT O, ODTPRESMATE OP, MATERIALESSA M, ODTDIA OD,GRUPOTRABAJO G, ADMINISTRATIVO A '+
      'WHERE O.CODIGOODT = OP.CODIGOODT '+
      'AND O.CODIGOODT = OD.CODIGOODT '+
      'AND OD.CODIGOODT = OP.CODIGOODT '+
      'AND OD.CONSECUTIVO = OP.CONSECUTIVO '+
      'AND OP.CODIGOMATERIAL = M.CODIGOMATERIAL '+
      'AND O.CODIGOADMINISTRATIVO = :CODIGOADMINISTRATIVO '+
      'AND O.CODIGOADMINISTRATIVO = A.CODIGOADMINISTRATIVO '+
      'AND OD.CODIGOGRUPOTRABAJO = :CODIGOGRUPOTRABAJO '+
      'AND OD.CODIGOGRUPOTRABAJO = G.CODIGOGRUPOTRABAJO '+
      'AND A.CODIGOADMINISTRATIVO = G.CODIGOADMINISTRATIVO '+
      'AND O.FECHAASIGNACION >= TO_DATE(:FECHAINICIAL, ''DD/MM/YYYY'') '+
      'AND O.FECHAASIGNACION <= TO_DATE(:FECHAFINAL, ''DD/MM/YYYY'') '+
      //'GROUP BY OD.CODIGOODT, OD.CONSECUTIVO,G.NOMBREGRUPOTRABAJO, M.CODIGOMATERIAL, M.NOMBREMATERIAL, M.CODIGOUNIDAD '+
      'GROUP BY G.NOMBREGRUPOTRABAJO, M.CODIGOMATERIAL, M.NOMBREMATERIAL, M.CODIGOUNIDAD '+
      'UNION '+
      //'SELECT G.NOMBREGRUPOTRABAJO,TMD.CODIGOMATERIAL,M.NOMBREMATERIAL,M.CODIGOUNIDAD,TMD.CODIGOODT,TMD.CONSECUTIVO,NVL(TMD.CANTIDAD,0), NVL(TMD.CANTIDADDESMANTELADA,0), '+
      'SELECT G.NOMBREGRUPOTRABAJO,TMD.CODIGOMATERIAL,M.NOMBREMATERIAL,M.CODIGOUNIDAD,NVL(TMD.CANTIDAD,0), NVL(TMD.CANTIDADDESMANTELADA,0), '+
      '0 AS CANTIDADENTREGADA, 0 AS CANTIDADCONSUMIDA, '+
      '0 AS CANTIDADCONSUMIDADESMANTELADA, 0 AS CANTIDADRETIRADABUENA, 0 AS CANTIDADRETIRADAMALA, '+
      '0 AS CANTIDADREINTEGRADABUENA,0 AS CANTIDADREINTEGRADAMALA, 0 AS CANTIDADREINTEGRADABUENADESMAN, '+
      '0 AS CANTIDADREINTEGRADAMALADESMAN,0 AS CANTIDADTRASLADONUEVA,0 AS CANTIDADTRASLADODESMAN '+
      'FROM  TRASLADOMATERIAL T, TRASLADOMATERIALDETALLE TMD, MATERIALESSA M, GRUPOTRABAJO G, ODT O '+
      'WHERE TMD.CODIGOTRASLADO = T.CODIGOTRASLADO '+
      'AND TMD.CODIGOMATERIAL = M.CODIGOMATERIAL '+
      'AND T.CODIGOADMINISTRATIVOORIGEN = G.CODIGOADMINISTRATIVO '+
      'AND T.CODIGOGRUPOTRABAJOORIGEN = G.CODIGOGRUPOTRABAJO '+
      'AND T.CODIGOODT = O.CODIGOODT '+
      'AND O.FECHAASIGNACION >= TO_DATE(:FECHAINICIAL, ''DD/MM/YYYY'') '+
      'AND O.FECHAASIGNACION <= TO_DATE(:FECHAFINAL, ''DD/MM/YYYY'') '+
      'AND T.CODIGOADMINISTRATIVOORIGEN= :CODIGOADMINISTRATIVO '+
      'AND T.CODIGOGRUPOTRABAJOORIGEN = :CODIGOGRUPOTRABAJO '+
      ') '+
      'GROUP BY '+
      //' NOMBREGRUPOTRABAJO, CODIGOMATERIAL, NOMBREMATERIAL,CODIGOUNIDAD,CODIGOODT,CONSECUTIVO '+
      ' NOMBREGRUPOTRABAJO, CODIGOMATERIAL, NOMBREMATERIAL,CODIGOUNIDAD '+
      //'ORDER BY NOMBREGRUPOTRABAJO, CODIGOMATERIAL,CODIGOUNIDAD,CODIGOODT,CONSECUTIVO');
      'ORDER BY NOMBREGRUPOTRABAJO, CODIGOMATERIAL,CODIGOUNIDAD');
      qBalance.ParamByName('CODIGOADMINISTRATIVO').AsString := qGrupoTrabajo.FieldByName('CODIGOADMINISTRATIVO').AsString;
      qBalance.ParamByName('CODIGOGRUPOTRABAJO').AsString  := qGrupoTrabajo.FieldByName('CODIGOGRUPOTRABAJO').AsString ;
      qBalance.ParamByName('FECHAINICIAL').AsString := FormatDateTime('dd/mm/yyyy', FechaInicial);
      qBalance.ParamByName('FECHAFINAL').AsString := FormatDateTime('dd/mm/yyyy', FechaFinal);
      qbalance.open;
      qrlDependencia.Caption := DBText1.Field.Text;
      qrTitulo.Caption := 'Del ' + eFechaInicial.Text + ' al ' + eFechaFinal.Text;
      ShowModal;
    end;
  except
    fQRBalanceMaterialMoviles.Free;
  end;
end;

procedure TfListaStock.tvOpcionesChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  case Node.Index of
    0: Notebook.ActivePage := 'EstadoActual';
    1: Notebook.ActivePage := 'Movimiento';
    2: Notebook.ActivePage := 'Auditoria';
  end;
end;

procedure TfListaStock.sbFechaAprobacionClick(Sender: TObject);
var
  Fecha: String;
begin
  inherited;
  eFechaInicial.Setfocus;
  sFecha := eFechaInicial.Text;
  Fecha := GetFecha(False);
  if Fecha <> '' then
    eFechaInicial.Text := Fecha;
end;

procedure TfListaStock.sbFechaAsignacionClick(Sender: TObject);
var
  Fecha: String;
begin
  inherited;
  eFechaFinal.Setfocus;
  sFecha := eFechaFinal.Text;
  Fecha := GetFecha(False);
  if Fecha <> '' then
    eFechaFinal.Text := Fecha;
end;

function TfListaStock.GetFecha(Tipo: Boolean): String;
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

procedure TfListaStock.qGrupoTrabajoAfterScroll(DataSet: TDataSet);
var
  query : TQuery;
begin
  inherited;
  if (eFechaInicial.Text <> '') and (eFechaFinal.Text <> '') then
  begin
    FechaInicial := StrToDate(eFechaInicial.Text);
    FechaFinal := StrToDate(eFechaFinal.Text);
    if FechaInicial > FechaFinal then
    begin
      MessageDlg('La fecha inicial debe ser mayor que la fecha final.', mtWarning, [mbOK], 0);
      Exit;
    end;
  end;

  qBalance.ParamByName('CODIGOADMINISTRATIVO').AsString := '';
  qBalance.ParamByName('CODIGOGRUPOTRABAJO').AsString := '';
  qBalance.ParamByName('FECHAINICIAL').AsString := '';
  qBalance.ParamByName('FECHAFINAL').AsString := '';

  qBalance.Close;
  qBalance.ParamByName('CODIGOADMINISTRATIVO').Value := qGrupoTrabajo.FieldByName('CODIGOADMINISTRATIVO').Value;
  qBalance.ParamByName('CODIGOGRUPOTRABAJO').Value := qGrupoTrabajo.FieldByName('CODIGOGRUPOTRABAJO').Value;
  qBalance.ParamByName('FECHAINICIAL').AsString := FormatDateTime('dd/mm/yyyy', FechaInicial);
  qBalance.ParamByName('FECHAFINAL').AsString := FormatDateTime('dd/mm/yyyy', FechaFinal);
  qBalance.Open;

  if not Auditoria then
  begin
    if (qListaStockCODIGOADMINISTRATIVO.AsString<>'')and
    (qListaStockCODIGOGRUPOTRABAJO.AsString<>'')then
    begin
      query:=TQuery.Create(nil);
      query.DatabaseName:='BaseDato';
      query.sql.add('SELECT MAX(CODIGOODTAUDITORIASTOCK) FROM ODTAUDITORIASTOCK');
      query.sql.add('WHERE CODIGOADMINISTRATIVO='+qListaStockCODIGOADMINISTRATIVO.AsString);
      query.sql.add('AND CODIGOGRUPOTRABAJO='+qListaStockCODIGOGRUPOTRABAJO.AsString);
      query.open;
      codigoauditoria:=query.Fields[0].AsFloat;
      qAuditoria.close;
      qAuditoria.ParamByName('CODIGOODTAUDITORIASTOCK').AsFloat:=codigoauditoria;
      qAuditoria.open;
      qDetalleAuditoria.close;
      qDetalleAuditoria.open;
      query.close;
      query.free;
    end;
  end;

  if (VarCodigoUsuario <> 0) then
  begin
    if not TienePermisos(VarCodigoUsuario,qGrupoTrabajoCODIGOADMINISTRATIVO.AsString) then
      DBNavigator1.VisibleButtons := [nbFirst,nbPrior,nbNext,nbLast,nbPost,nbCancel]
    else
    begin
      DBNavigator1.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert,
                                     nbDelete, nbEdit, nbPost, nbCancel, nbRefresh];
      if Auditoria then
        EditarStock:=true;
    end;
  end;
end;

procedure TfListaStock.sbReporteMovimientoClick(Sender: TObject);
var
  Punto: TPoint;
begin
  inherited;
  Punto := Panel7.ClientToScreen(Classes.Point(sbReporteMovimiento.Left, sbReporteMovimiento.top));
  pmImprimirMovimiento.Popup(Punto.x + 10, Punto.y + 10);
end;

procedure TfListaStock.eFechaInicialChange(Sender: TObject);
begin
  inherited;
  qGrupoTrabajoAfterScroll(nil);
end;

procedure TfListaStock.Movimientodeladependenciapormviles1Click(
  Sender: TObject);
begin
  fQRBalanceMaterialMoviles := TfQRBalanceMaterialMoviles.Create(Application);
  try
    with fQRBalanceMaterialMoviles do
    begin
      qBalance.SQL.Clear;
      qBalance.SQL.Add('SELECT * FROM ( '+
      //'SELECT NOMBREGRUPOTRABAJO, CODIGOMATERIAL, NOMBREMATERIAL,CODIGOUNIDAD,CODIGOODT,CONSECUTIVO,SUM(cantidad) AS TRASLADONUEVONEGATIVO, '+
      'SELECT NOMBREGRUPOTRABAJO, CODIGOMATERIAL, NOMBREMATERIAL,CODIGOUNIDAD,SUM(cantidad) AS TRASLADONUEVONEGATIVO, '+
      'SUM(cantidaddesmantelada) AS TRASLADODESMANNEGATIVO, SUM(CANTIDADENTREGADA) AS CANTIDADENTREGADA, SUM(CANTIDADCONSUMIDA) AS CANTIDADCONSUMIDA, '+
      'SUM(CANTIDADCONSUMIDADESMANTELADA) AS CANTIDADCONSUMIDADESMANTELADA, SUM (CANTIDADRETIRADABUENA) AS CANTIDADRETIRADABUENA, '+
      'SUM(CANTIDADRETIRADAMALA) AS CANTIDADRETIRADAMALA,SUM (CANTIDADREINTEGRADABUENA) AS CANTIDADREINTEGRADABUENA, '+
      'SUM(CANTIDADREINTEGRADAMALA) AS CANTIDADREINTEGRADAMALA, SUM(CANTIDADREINTEGRADABUENADESMAN) AS CANTIDADREINTEGRADABUENADESMAN, '+
      'SUM(CANTIDADREINTEGRADAMALADESMAN) AS CANTIDADREINTEGRADAMALADESMAN,SUM(CANTIDADTRASLADONUEVA) AS CANTIDADTRASLADONUEVA, '+
      'SUM(CANTIDADTRASLADODESMAN) AS CANTIDADTRASLADODESMAN, '+
      '(NVL(SUM(CANTIDADTRASLADONUEVA),0)+NVL(SUM(CANTIDADENTREGADA),0)-NVL(SUM(cantidad),0)- NVL(SUM(CANTIDADCONSUMIDA),0)-NVL(SUM (CANTIDADREINTEGRADABUENA),0)- '+
      'NVL(SUM(CANTIDADREINTEGRADAMALA),0)) AS BALANCENUEVO, '+
      '(NVL(SUM(CANTIDADTRASLADODESMAN),0)+ NVL(SUM(CANTIDADRETIRADAMALA),0)+NVL(SUM (CANTIDADRETIRADABUENA),0)-NVL(SUM(cantidaddesmantelada),0)- '+
      'NVL(SUM(CANTIDADCONSUMIDADESMANTELADA),0)-NVL(SUM(CANTIDADREINTEGRADABUENADESMAN),0)-NVL(SUM(CANTIDADREINTEGRADAMALADESMAN),0)) AS BALANCEDESMANTELADO '+
      'FROM '+
      '( '+
      //'SELECT G.NOMBREGRUPOTRABAJO, M.CODIGOMATERIAL, M.NOMBREMATERIAL,M.CODIGOUNIDAD,OD.CODIGOODT, OD.CONSECUTIVO,0 AS cantidad, 0 AS cantidaddesmantelada, NVL(SUM(OP.CANTIDADENTREGADA),0) AS CANTIDADENTREGADA, '+
      'SELECT G.NOMBREGRUPOTRABAJO, M.CODIGOMATERIAL, M.NOMBREMATERIAL,M.CODIGOUNIDAD,0 AS cantidad, 0 AS cantidaddesmantelada, NVL(SUM(OP.CANTIDADENTREGADA),0) AS CANTIDADENTREGADA, '+
      'NVL(SUM(OP.CANTIDADCONSUMIDA),0) AS CANTIDADCONSUMIDA, '+
      'NVL(SUM(OP.CANTIDADCONSUMIDADESMANTELADA),0) AS CANTIDADCONSUMIDADESMANTELADA, NVL(SUM (OP.CANTIDADRETIRADABUENA),0) AS CANTIDADRETIRADABUENA, NVL(SUM(OP.CANTIDADRETIRADAMALA),0) AS CANTIDADRETIRADAMALA, '+
      'NVL(SUM(OP.CANTIDADREINTEGRADABUENA),0) AS CANTIDADREINTEGRADABUENA, '+
      'NVL(SUM(OP.CANTIDADREINTEGRADAMALA),0) AS CANTIDADREINTEGRADAMALA, NVL(SUM(OP.CANTIDADREINTEGRADABUENADESMAN),0) AS CANTIDADREINTEGRADABUENADESMAN, '+
      'NVL(SUM(OP.CANTIDADREINTEGRADAMALADESMAN),0) AS CANTIDADREINTEGRADAMALADESMAN, NVL(SUM(CANTIDADTRASLADONUEVA),0) AS CANTIDADTRASLADONUEVA, '+
      'NVL(SUM(CANTIDADTRASLADODESMAN),0) AS CANTIDADTRASLADODESMAN '+
      'FROM ODT O, ODTPRESMATE OP, MATERIALESSA M, ODTDIA OD,GRUPOTRABAJO G, ADMINISTRATIVO A '+
      'WHERE O.CODIGOODT = OP.CODIGOODT '+
      'AND O.CODIGOODT = OD.CODIGOODT '+
      'AND OD.CODIGOODT = OP.CODIGOODT '+
      'AND OD.CONSECUTIVO = OP.CONSECUTIVO '+
      'AND OP.CODIGOMATERIAL = M.CODIGOMATERIAL '+
      'AND O.CODIGOADMINISTRATIVO = A.CODIGOADMINISTRATIVO '+
      'AND O.CODIGOADMINISTRATIVO = :CODIGOADMINISTRATIVO '+
      'AND OD.CODIGOGRUPOTRABAJO = G.CODIGOGRUPOTRABAJO '+
      'AND A.CODIGOADMINISTRATIVO = G.CODIGOADMINISTRATIVO '+
      'AND O.FECHAASIGNACION >= TO_DATE(:FECHAINICIAL, ''DD/MM/YYYY'') '+
      'AND O.FECHAASIGNACION <= TO_DATE(:FECHAFINAL, ''DD/MM/YYYY'') '+
      //'GROUP BY OD.CODIGOODT, OD.CONSECUTIVO,G.NOMBREGRUPOTRABAJO, M.CODIGOMATERIAL, M.NOMBREMATERIAL, M.CODIGOUNIDAD '+
      'GROUP BY G.NOMBREGRUPOTRABAJO, M.CODIGOMATERIAL, M.NOMBREMATERIAL, M.CODIGOUNIDAD '+
      'UNION '+
      //'SELECT G.NOMBREGRUPOTRABAJO,TMD.CODIGOMATERIAL,M.NOMBREMATERIAL,M.CODIGOUNIDAD,TMD.CODIGOODT,TMD.CONSECUTIVO,NVL(TMD.CANTIDAD,0), NVL(TMD.CANTIDADDESMANTELADA,0), '+
      'SELECT G.NOMBREGRUPOTRABAJO,TMD.CODIGOMATERIAL,M.NOMBREMATERIAL,M.CODIGOUNIDAD,NVL(TMD.CANTIDAD,0), NVL(TMD.CANTIDADDESMANTELADA,0), '+
      '0 AS CANTIDADENTREGADA, 0 AS CANTIDADCONSUMIDA, '+
      '0 AS CANTIDADCONSUMIDADESMANTELADA, 0 AS CANTIDADRETIRADABUENA, 0 AS CANTIDADRETIRADAMALA, '+
      '0 AS CANTIDADREINTEGRADABUENA,0 AS CANTIDADREINTEGRADAMALA, 0 AS CANTIDADREINTEGRADABUENADESMAN, '+
      '0 AS CANTIDADREINTEGRADAMALADESMAN,0 AS CANTIDADTRASLADONUEVA,0 AS CANTIDADTRASLADODESMAN '+
      'FROM  TRASLADOMATERIAL T, TRASLADOMATERIALDETALLE TMD, MATERIALESSA M, GRUPOTRABAJO G, ODT O '+
      'WHERE TMD.CODIGOTRASLADO = T.CODIGOTRASLADO '+
      'AND TMD.CODIGOMATERIAL = M.CODIGOMATERIAL '+
      'AND T.CODIGOADMINISTRATIVOORIGEN = G.CODIGOADMINISTRATIVO '+
      'AND T.CODIGOGRUPOTRABAJOORIGEN = G.CODIGOGRUPOTRABAJO '+
      'AND T.CODIGOODT = O.CODIGOODT '+
      'AND O.FECHAASIGNACION >= TO_DATE(:FECHAINICIAL, ''DD/MM/YYYY'') '+
      'AND O.FECHAASIGNACION <= TO_DATE(:FECHAFINAL, ''DD/MM/YYYY'') '+
      'AND T.CODIGOADMINISTRATIVOORIGEN = :CODIGOADMINISTRATIVO '+
      ') '+
      'GROUP BY '+
      //' NOMBREGRUPOTRABAJO, CODIGOMATERIAL, NOMBREMATERIAL,CODIGOUNIDAD,CODIGOODT,CONSECUTIVO '+
      ' NOMBREGRUPOTRABAJO, CODIGOMATERIAL, NOMBREMATERIAL,CODIGOUNIDAD '+
      ') '+
      'WHERE '+
      '( '+
      '(TRASLADONUEVONEGATIVO >0) OR '+
      '(TRASLADODESMANNEGATIVO >0) OR '+
      '(CANTIDADENTREGADA >0) OR '+
      '(CANTIDADCONSUMIDA >0) OR '+
      '(CANTIDADCONSUMIDADESMANTELADA >0) OR '+
      '(CANTIDADRETIRADABUENA >0) OR '+
      '(CANTIDADRETIRADAMALA >0) OR '+
      '(CANTIDADREINTEGRADABUENA >0) OR '+
      '(CANTIDADREINTEGRADAMALA >0) OR '+
      '(CANTIDADREINTEGRADABUENADESMAN >0) OR '+
      '(CANTIDADREINTEGRADAMALADESMAN >0) OR '+
      '(CANTIDADTRASLADONUEVA >0) OR '+
      '(CANTIDADTRASLADODESMAN >0) '+
      ') '+
      //'ORDER BY NOMBREGRUPOTRABAJO, CODIGOMATERIAL,CODIGOUNIDAD,CODIGOODT,CONSECUTIVO');
      'ORDER BY NOMBREGRUPOTRABAJO, CODIGOMATERIAL,CODIGOUNIDAD');

      qBalance.ParamByName('CODIGOADMINISTRATIVO').AsString := qGrupoTrabajo.FieldByName('CODIGOADMINISTRATIVO').AsString;
      qBalance.ParamByName('FECHAINICIAL').AsString := FormatDateTime('dd/mm/yyyy', FechaInicial);
      qBalance.ParamByName('FECHAFINAL').AsString := FormatDateTime('dd/mm/yyyy', FechaFinal);
      qBalance.Open;
      qrlDependencia.Caption := DBText1.Field.Text;
      qrTitulo.Caption := 'Del ' + eFechaInicial.Text + ' al ' + eFechaFinal.Text;
      showmodal;
    end;
  except
    fQRBalanceMaterialMoviles.free;
  end;
end;

procedure TfListaStock.Movimientodeladependencia1Click(Sender: TObject);
begin
  fQRBalanceMaterialDependencia := TfQRBalanceMaterialDependencia.Create(Application);
  try
    with fQRBalanceMaterialDependencia do
    begin
      qBalance.Close;
      qBalance.ParamByName('CODIGOADMINISTRATIVO').Value := qGrupoTrabajo.FieldByName('CODIGOADMINISTRATIVO').Value;
      qBalance.ParamByName('FECHAINICIAL').AsString := FormatDateTime('dd/mm/yyyy', FechaInicial);
      qBalance.ParamByName('FECHAFINAL').AsString := FormatDateTime('dd/mm/yyyy', FechaFinal);
      qBalance.Open;
      qrlDependencia.Caption := DBText1.Field.Text;
      qrTitulo.Caption := 'Del ' + eFechaInicial.Text + ' al ' + eFechaFinal.Text;
      showmodal;
    end;
  except
    fQRBalanceMaterialDependencia.free;
  end;
end;

procedure TfListaStock.eFechaFinalChange(Sender: TObject);
begin
  inherited;
  qGrupoTrabajoAfterScroll(nil);
end;

procedure TfListaStock.Estadodelstockdelgruposeleccionado1Click(
  Sender: TObject);
begin
  fQREstadoActualMovil:= TfQREstadoActualMovil.Create(Application);
  try
    with fQREstadoActualMovil do
    begin
      qEstado.SQL.Clear;
      qEstado.SQL.Add('SELECT G.NOMBREGRUPOTRABAJO, S.CODIGOMATERIAL, M.NOMBREMATERIAL,');
      qEstado.SQL.Add('M.CODIGOUNIDAD, S.FECHAULTIMOINVENTARIO, S.CANTIDADINICIAL,');
      qEstado.SQL.Add('S.CANTIDADACTUAL,S.CANTIDADACTUALDESMANTELADABUEN, M.VALORUNITARIO,');
      qEstado.SQL.Add('(M.VALORUNITARIO * (S.CANTIDADACTUAL+S.CANTIDADACTUALDESMANTELADABUEN)) AS VALORTOTAL');
      qEstado.SQL.Add('FROM STOCKGRUPOTRABAJO S, MATERIALESSA M, ADMINISTRATIVO A,');
      qEstado.SQL.Add('GRUPOTRABAJO G');
      qEstado.SQL.Add('WHERE M.CODIGOMATERIAL (+)= S.CODIGOMATERIAL');
      qEstado.SQL.Add('AND A.CODIGOADMINISTRATIVO = S.CODIGOADMINISTRATIVO');
      qEstado.SQL.Add('AND S.CODIGOGRUPOTRABAJO = G.CODIGOGRUPOTRABAJO');
      qEstado.SQL.Add('AND S.CODIGOADMINISTRATIVO = G.CODIGOADMINISTRATIVO');
      qEstado.SQL.Add('AND S.CODIGOADMINISTRATIVO =:CODIGOADMINISTRATIVO');
      qEstado.SQL.Add('AND S.CODIGOGRUPOTRABAJO =:CODIGOGRUPOTRABAJO');
      qEstado.SQL.Add('AND ((NVL(CANTIDADACTUAL,0)<>0) OR (NVL(CANTIDADINICIAL,0)<>0)');
      qEstado.SQL.Add('OR (NVL(CANTIDADACTUALDESMANTELADABUEN,0)<>0) OR (NVL(CANTIDADACTUALDESMANTELADAMALA,0)<>0))');
      qEstado.SQL.Add('ORDER BY G.NOMBREGRUPOTRABAJO, S.CODIGOMATERIAL');
      qEstado.ParamByName('CODIGOADMINISTRATIVO').Value := qGrupoTrabajo.FieldByName('CODIGOADMINISTRATIVO').Value;
      qEstado.ParamByName('CODIGOGRUPOTRABAJO').Value := qGrupoTrabajo.FieldByName('CODIGOGRUPOTRABAJO').Value;

      qEstado.Open;
      qrlDependencia.Caption := DBText1.Field.Text;
      qrTitulo.Caption := DateToStr(Now);
      ShowModal;
    end;
  except
    fQREstadoActualMovil.free;
  end;
end;

procedure TfListaStock.Estadodelstockdetodaladependencia1Click(
  Sender: TObject);
begin
  fQREstadoActualMovil:= TfQREstadoActualMovil.Create(Application);
  try
    with fQREstadoActualMovil do
    begin
      qEstado.SQL.Clear;
      qEstado.SQL.Add('SELECT G.NOMBREGRUPOTRABAJO, S.CODIGOMATERIAL, M.NOMBREMATERIAL,');
      qEstado.SQL.Add('M.CODIGOUNIDAD, S.FECHAULTIMOINVENTARIO, S.CANTIDADINICIAL,');
      qEstado.SQL.Add('S.CANTIDADACTUAL,S.CANTIDADACTUALDESMANTELADABUEN, M.VALORUNITARIO,');
      qEstado.SQL.Add('(M.VALORUNITARIO * (S.CANTIDADACTUAL+S.CANTIDADACTUALDESMANTELADABUEN)) AS VALORTOTAL');
      qEstado.SQL.Add('FROM STOCKGRUPOTRABAJO S, MATERIALESSA M, ADMINISTRATIVO A,');
      qEstado.SQL.Add('GRUPOTRABAJO G');
      qEstado.SQL.Add('WHERE M.CODIGOMATERIAL (+)= S.CODIGOMATERIAL');
      qEstado.SQL.Add('AND A.CODIGOADMINISTRATIVO = S.CODIGOADMINISTRATIVO');
      qEstado.SQL.Add('AND S.CODIGOGRUPOTRABAJO = G.CODIGOGRUPOTRABAJO');
      qEstado.SQL.Add('AND S.CODIGOADMINISTRATIVO = G.CODIGOADMINISTRATIVO');
      qEstado.SQL.Add('AND S.CODIGOADMINISTRATIVO =:CODIGOADMINISTRATIVO');
      qEstado.SQL.Add('AND S.CODIGOGRUPOTRABAJO > 0');
      qEstado.SQL.Add('AND ((NVL(CANTIDADACTUAL,0)<>0) OR (NVL(CANTIDADINICIAL,0)<>0)');
      qEstado.SQL.Add('OR (NVL(CANTIDADACTUALDESMANTELADABUEN,0)<>0) OR (NVL(CANTIDADACTUALDESMANTELADAMALA,0)<>0))');
      qEstado.SQL.Add('ORDER BY G.NOMBREGRUPOTRABAJO, S.CODIGOMATERIAL');
      qEstado.ParamByName('CODIGOADMINISTRATIVO').AsString := qGrupoTrabajo.FieldByName('CODIGOADMINISTRATIVO').AsString;
      qEstado.Open;
      qrlDependencia.Caption := DBText1.Field.Text;
      qrTitulo.Caption := DateToStr(Now);
      ShowModal;
    end;
   except
     on e:exception do
     begin
       showmessage(e.message);
       fQREstadoActualMovil.free;
     end;
   end;
end;

procedure TfListaStock.sbReporteEstadoClick(Sender: TObject);
var
  Punto: TPoint;
begin
  inherited;
  Punto := Panel5.ClientToScreen(Classes.Point(sbReporteEstado.Left, sbReporteEstado.top));
  pmImprimirEstado.Popup(Punto.x + 10, Punto.y + 10);
end;

procedure TfListaStock.qListaStockAfterEdit(DataSet: TDataSet);
begin
  inherited;
  if qGrupoTrabajoCODIGOGRUPOTRABAJO.AsString <> '' then
  begin
    try
      fStockGrupoTrabajo := TfStockGrupoTrabajo.Create(Application);
      with fStockGrupoTrabajo do
      begin
        qStockGrupoTrabajo.Filter := 'CODIGOADMINISTRATIVO = '
        + Self.qListaStock.FieldbyName('CODIGOADMINiSTRATIVO').AsString +
        'AND CODIGOGRUPOTRABAJO = ' + Self.qListaStock.FieldbyName('CODIGOGRUPOTRABAJO').AsString +
        'AND CODIGOMATERIAL = ' + Self.qListaStock.FieldbyName('CODIGOMATERIAL').AsString;
        qStockGrupoTrabajo.FindFirst;
        if ShowModal = mrOk then
        begin
          qListaStock.Close;
          qListaStock.Open;
          qListaStock.Locate('CODIGOMATERIAL',(qStockGrupoTrabajoCODIGOMATERIAL.AsString),[]);
        end
      end;
    finally
      fStockGrupoTrabajo.Free;
    end;
  end;
end;

procedure TfListaStock.qGrupoTrabajoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qListaStock.Close;
  qListaStock.Open;
end;

procedure TfListaStock.sbTrasladosClick(Sender: TObject);
Var
qconsulta:tquery;
qconsulta2:tquery;
CodigoTraslado: integer;
begin
{qConsulta := TQuery.Create(Application);
qConsulta.DatabaseName := 'BaseDato';
qConsulta.SQL.Add('SELECT max(codigotraslado) FROM trasladomaterial');
qConsulta.Open;
CodigoTraslado := qConsulta.Fields[0].AsiNTEGER;
qConsulta.Close;
qConsulta.Free;
fTraslado := tfTraslado.Create(Application);
ftraslado.Estado:= 'Insert';
fTraslado.codigotraslado:= CodigoTraslado +1;
fTraslado.qTrasladomaterial.open;
fTraslado.qTrasladomaterial.insert;
fTraslado.qTrasladoMaterialCODIGOTRASLADO.ASINTEGER:= fTraslado.codigotraslado;
fTraslado.qTrasladoMaterialDetalle.open;
fTraslado.qTrasladoMaterialDetalle.insert;

if fTraslado.ShowModal = mrOk then
begin

  fTraslado.qTrasladoMaterialCODIGOTRASLADO.ASINTEGER:= fTraslado.codigotraslado;
  fTraslado.qTrasladoMaterialFECHATRASLADO.ASDATETIME:= fTraslado.dtpFechaTraslado.DateTime;
  fTraslado.qTrasladoMaterial.ApplyUpdates;
  fTraslado.qTrasladoMaterial.CommitUpdates;
  fTraslado.qTrasladoMaterialDetalle.ApplyUpdates;
  fTraslado.qTrasladoMaterialDetalle.CommitUpdates;
  fTraslado.qTrasladoMaterialDetalle.First;

  while not fTraslado.qTrasladoMaterialDetalle.Eof do
  begin
     //Material Nuevo
     if fTraslado.qTrasladoMaterialDetalleCANTIDAD.Asfloat>0 then
     Begin
       qConsulta := TQuery.Create(Application);
       qConsulta.DatabaseName := 'BaseDato';
       qConsulta.SQL.Add('update stockgrupotrabajo set cantidadactual = cantidadactual -' + fTraslado.qTrasladoMaterialDetalleCANTIDAD.AsString);
       qConsulta.SQL.Add('where CODIGOADMINISTRATIVO ='+ fTraslado.qTrasladoMaterialCODIGOADMINISTRATIVOORIGEN.AsString);
       qconsulta.SQL.Add(' AND CODIGOGRUPOTRABAJO =' +fTraslado.qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsString);
       qConsulta.SQL.Add(' AND CODIGOMATERIAL = ' + fTraslado.qTrasladoMaterialDetalleCODIGOMATERIAL.AsString);
       qConsulta.execsql;
       qConsulta.Free;

       qConsulta := TQuery.Create(Application);
       qConsulta.DatabaseName := 'BaseDato';
       qConsulta.SQL.Add('SELECT * FROM Stockgrupotrabajo WHERE CODIGOADMINISTRATIVO ='+ fTraslado.qTrasladoMaterialCODIGOADMINISTRATIVODESTINO.AsString);
       qConsulta.SQL.Add(' AND CODIGOGRUPOTRABAJO =' +fTraslado.qTrasladoMaterialCODIGOGRUPOTRABAJODESTINO.AsString);
       qConsulta.SQL.Add(' AND CODIGOMATERIAL = ' + fTraslado.qTrasladoMaterialDetalleCODIGOMATERIAL.AsString);
       //**qConsulta.SQL.Add(' AND NUEVO = ''S''');
       qConsulta.Open;
       if qConsulta.Fields[0].AsFloat > 0 then
       begin
         qConsulta := TQuery.Create(Application);
         qConsulta.DatabaseName := 'BaseDato';
         qConsulta.SQL.Add('update stockgrupotrabajo set cantidadactual = cantidadactual +' + fTraslado.qTrasladoMaterialDetalleCANTIDAD.AsString);
         qConsulta.SQL.Add('where CODIGOADMINISTRATIVO ='+ fTraslado.qTrasladoMaterialCODIGOADMINISTRATIVODESTINO.AsString);
         qconsulta.SQL.Add(' AND CODIGOGRUPOTRABAJO =' +fTraslado.qTrasladoMaterialCODIGOGRUPOTRABAJODESTINO.AsString);
         qConsulta.SQL.Add(' AND CODIGOMATERIAL = ' + fTraslado.qTrasladoMaterialDetalleCODIGOMATERIAL.AsString);
         qConsulta.execsql;
         qConsulta.Free;
       end
       else
       begin
         qConsulta := TQuery.Create(Application);
         qConsulta.DatabaseName := 'BaseDato';
         qConsulta.SQL.Add('INSERT INTO stockgrupotrabajo');
         qConsulta.SQL.Add('(CODIGOADMINISTRATIVO, CODIGOGRUPOTRABAJO,CODIGOMATERIAL,CANTIDADACTUAL) ');
         qConsulta.SQL.Add('VALUES('+fTraslado.qTrasladoMaterialCODIGOADMINISTRATIVODESTINO.AsString+','+fTraslado.qTrasladoMaterialCODIGOGRUPOTRABAJODESTINO.AsString);
         qConsulta.SQL.Add(','+fTraslado.qTrasladoMaterialDetalleCODIGOMATERIAL.AsString+','+fTraslado.qTrasladoMaterialDetalleCANTIDAD.AsString+')');
         qConsulta.execsql;
         qConsulta.Free;
       end;
     end;
     //Material Desmatelado
     if fTraslado.qTrasladoMaterialDetalleCANTIDADDESMANTELADA.Asfloat>0 then
     begin
       qConsulta2 := TQuery.Create(Application);
       qConsulta2.DatabaseName := 'BaseDato';
       qConsulta2.SQL.Add('update stockgrupotrabajo set cantidadactualdesmanteladabuen = cantidadactualdesmanteladabuen -' + fTraslado.qTrasladoMaterialDetalleCANTIDADDESMANTELADA.AsString);
       qConsulta2.SQL.Add('where CODIGOADMINISTRATIVO ='+ fTraslado.qTrasladoMaterialCODIGOADMINISTRATIVOORIGEN.AsString);
       qconsulta2.SQL.Add(' AND CODIGOGRUPOTRABAJO =' +fTraslado.qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsString);
       qConsulta2.SQL.Add(' AND CODIGOMATERIAL = ' + fTraslado.qTrasladoMaterialDetalleCODIGOMATERIAL.AsString);
       //**qConsulta2.SQL.Add(' AND NUEVO = ''N''');
       qConsulta2.execsql;
       qConsulta2.Free;

       qConsulta2 := TQuery.Create(Application);
       qConsulta2.DatabaseName := 'BaseDato';
       qConsulta2.SQL.Add('SELECT * FROM Stockgrupotrabajo WHERE CODIGOADMINISTRATIVO ='+ fTraslado.qTrasladoMaterialCODIGOADMINISTRATIVODESTINO.AsString);
       qConsulta2.SQL.Add(' AND CODIGOGRUPOTRABAJO =' +fTraslado.qTrasladoMaterialCODIGOGRUPOTRABAJODESTINO.AsString);
       qConsulta2.SQL.Add(' AND CODIGOMATERIAL = ' + fTraslado.qTrasladoMaterialDetalleCODIGOMATERIAL.AsString);
       //**qConsulta2.SQL.Add(' AND NUEVO = ''N''');
       qConsulta2.Open;
       if qConsulta2.Fields[0].AsFloat > 0 then
       begin
         qConsulta2 := TQuery.Create(Application);
         qConsulta2.DatabaseName := 'BaseDato';
         qConsulta2.SQL.Add('update stockgrupotrabajo set cantidadactualdesmanteladabuen = cantidadactualdesmanteladabuen +' + fTraslado.qTrasladoMaterialDetalleCANTIDADDESMANTELADA.AsString);
         qConsulta2.SQL.Add('where CODIGOADMINISTRATIVO ='+ fTraslado.qTrasladoMaterialCODIGOADMINISTRATIVODESTINO.AsString);
         qconsulta2.SQL.Add(' AND CODIGOGRUPOTRABAJO =' +fTraslado.qTrasladoMaterialCODIGOGRUPOTRABAJODESTINO.AsString);
         qConsulta2.SQL.Add(' AND CODIGOMATERIAL = ' + fTraslado.qTrasladoMaterialDetalleCODIGOMATERIAL.AsString);
         //**qConsulta2.SQL.Add(' AND NUEVO = ''N''');
         qConsulta2.execsql;
         qConsulta2.Free;
       end
       else
       begin
         qConsulta2 := TQuery.Create(Application);
         qConsulta2.DatabaseName := 'BaseDato';
         qConsulta2.SQL.Add('INSERT INTO stockgrupotrabajo');
         qConsulta2.SQL.Add('(CODIGOADMINISTRATIVO, CODIGOGRUPOTRABAJO,CODIGOMATERIAL,cantidadactualdesmanteladabuen) ');
         qConsulta2.SQL.Add('VALUES('+fTraslado.qTrasladoMaterialCODIGOADMINISTRATIVODESTINO.AsString+','+fTraslado.qTrasladoMaterialCODIGOGRUPOTRABAJODESTINO.AsString);
         qConsulta2.SQL.Add(','+fTraslado.qTrasladoMaterialDetalleCODIGOMATERIAL.AsString+','+fTraslado.qTrasladoMaterialDetalleCANTIDAD.AsString+')');
         qConsulta2.execsql;
         qConsulta2.Free;
       end;
     end;
     fTraslado.qTrasladoMaterialDetalle.next;
  end;

end; }
end;
procedure TfListaStock.MovimientodeladependenciaporODT1Click(
  Sender: TObject);
begin
  fQRBalanceMaterialMovilesODT := TfQRBalanceMaterialMovilesODT.Create(Application);
  try
    with fQRBalanceMaterialMovilesODT do
    begin
      qBalance.close;
      qBalance.SQL.Clear;
      qBalance.SQL.Add('SELECT * FROM ( '+
      //'SELECT NOMBREGRUPOTRABAJO, CODIGOMATERIAL, NOMBREMATERIAL,CODIGOUNIDAD,CODIGOODT,CONSECUTIVO,SUM(cantidad) AS TRASLADONUEVONEGATIVO, '+
      'SELECT NOMBREGRUPOTRABAJO, CODIGOMATERIAL, NOMBREMATERIAL,CODIGOUNIDAD,codigoodt,SUM(cantidad) AS TRASLADONUEVONEGATIVO, '+
      'SUM(cantidaddesmantelada) AS TRASLADODESMANNEGATIVO, SUM(CANTIDADENTREGADA) AS CANTIDADENTREGADA, SUM(CANTIDADCONSUMIDA) AS CANTIDADCONSUMIDA, '+
      'SUM(CANTIDADCONSUMIDADESMANTELADA) AS CANTIDADCONSUMIDADESMANTELADA, SUM (CANTIDADRETIRADABUENA) AS CANTIDADRETIRADABUENA, '+
      'SUM(CANTIDADRETIRADAMALA) AS CANTIDADRETIRADAMALA,SUM (CANTIDADREINTEGRADABUENA) AS CANTIDADREINTEGRADABUENA, '+
      'SUM(CANTIDADREINTEGRADAMALA) AS CANTIDADREINTEGRADAMALA, SUM(CANTIDADREINTEGRADABUENADESMAN) AS CANTIDADREINTEGRADABUENADESMAN, '+
      'SUM(CANTIDADREINTEGRADAMALADESMAN) AS CANTIDADREINTEGRADAMALADESMAN,SUM(CANTIDADTRASLADONUEVA) AS CANTIDADTRASLADONUEVA, '+
      'SUM(CANTIDADTRASLADODESMAN) AS CANTIDADTRASLADODESMAN, '+
      '(NVL(SUM(CANTIDADTRASLADONUEVA),0)+NVL(SUM(CANTIDADENTREGADA),0)-NVL(SUM(cantidad),0)- NVL(SUM(CANTIDADCONSUMIDA),0)-NVL(SUM (CANTIDADREINTEGRADABUENA),0)- '+
      'NVL(SUM(CANTIDADREINTEGRADAMALA),0)) AS BALANCENUEVO, '+
      '(NVL(SUM(CANTIDADTRASLADODESMAN),0)+ NVL(SUM(CANTIDADRETIRADAMALA),0)+NVL(SUM (CANTIDADRETIRADABUENA),0)-NVL(SUM(cantidaddesmantelada),0)- '+
      'NVL(SUM(CANTIDADCONSUMIDADESMANTELADA),0)-NVL(SUM(CANTIDADREINTEGRADABUENADESMAN),0)-NVL(SUM(CANTIDADREINTEGRADAMALADESMAN),0)) AS BALANCEDESMANTELADO '+
      'FROM '+
      '( '+
      //'SELECT G.NOMBREGRUPOTRABAJO, M.CODIGOMATERIAL, M.NOMBREMATERIAL,M.CODIGOUNIDAD,OD.CODIGOODT, OD.CONSECUTIVO,0 AS cantidad, 0 AS cantidaddesmantelada, NVL(SUM(OP.CANTIDADENTREGADA),0) AS CANTIDADENTREGADA, '+
      'SELECT G.NOMBREGRUPOTRABAJO, M.CODIGOMATERIAL, M.NOMBREMATERIAL,M.CODIGOUNIDAD,OD.CODIGOODT,0 AS cantidad, 0 AS cantidaddesmantelada, NVL(SUM(OP.CANTIDADENTREGADA),0) AS CANTIDADENTREGADA, '+
      'NVL(SUM(OP.CANTIDADCONSUMIDA),0) AS CANTIDADCONSUMIDA, '+
      'NVL(SUM(OP.CANTIDADCONSUMIDADESMANTELADA),0) AS CANTIDADCONSUMIDADESMANTELADA, NVL(SUM (OP.CANTIDADRETIRADABUENA),0) AS CANTIDADRETIRADABUENA, NVL(SUM(OP.CANTIDADRETIRADAMALA),0) AS CANTIDADRETIRADAMALA, '+
      'NVL(SUM(OP.CANTIDADREINTEGRADABUENA),0) AS CANTIDADREINTEGRADABUENA, '+
      'NVL(SUM(OP.CANTIDADREINTEGRADAMALA),0) AS CANTIDADREINTEGRADAMALA, NVL(SUM(OP.CANTIDADREINTEGRADABUENADESMAN),0) AS CANTIDADREINTEGRADABUENADESMAN, '+
      'NVL(SUM(OP.CANTIDADREINTEGRADAMALADESMAN),0) AS CANTIDADREINTEGRADAMALADESMAN, NVL(SUM(CANTIDADTRASLADONUEVA),0) AS CANTIDADTRASLADONUEVA, '+
      'NVL(SUM(CANTIDADTRASLADODESMAN),0) AS CANTIDADTRASLADODESMAN '+
      'FROM ODT O, ODTPRESMATE OP, MATERIALESSA M, ODTDIA OD,GRUPOTRABAJO G, ADMINISTRATIVO A '+
      'WHERE O.CODIGOODT = OP.CODIGOODT '+
      'AND O.CODIGOODT = OD.CODIGOODT '+
      'AND OD.CODIGOODT = OP.CODIGOODT '+
      'AND OD.CONSECUTIVO = OP.CONSECUTIVO '+
      'AND OP.CODIGOMATERIAL = M.CODIGOMATERIAL '+
      'AND O.CODIGOADMINISTRATIVO = A.CODIGOADMINISTRATIVO '+
      'AND O.CODIGOADMINISTRATIVO = :CODIGOADMINISTRATIVO '+
      'AND OD.CODIGOGRUPOTRABAJO = G.CODIGOGRUPOTRABAJO '+
      'AND A.CODIGOADMINISTRATIVO = G.CODIGOADMINISTRATIVO '+
      'AND O.FECHAASIGNACION >= TO_DATE(:FECHAINICIAL, ''DD/MM/YYYY'') '+
      'AND O.FECHAASIGNACION <= TO_DATE(:FECHAFINAL, ''DD/MM/YYYY'') '+
      //'GROUP BY OD.CODIGOODT, OD.CONSECUTIVO,G.NOMBREGRUPOTRABAJO, M.CODIGOMATERIAL, M.NOMBREMATERIAL, M.CODIGOUNIDAD '+
      'GROUP BY OD.CODIGOODT,G.NOMBREGRUPOTRABAJO, M.CODIGOMATERIAL, M.NOMBREMATERIAL, M.CODIGOUNIDAD '+
      'UNION '+
      //'SELECT G.NOMBREGRUPOTRABAJO,TMD.CODIGOMATERIAL,M.NOMBREMATERIAL,M.CODIGOUNIDAD,TMD.CODIGOODT,TMD.CONSECUTIVO,NVL(TMD.CANTIDAD,0), NVL(TMD.CANTIDADDESMANTELADA,0), '+
      'SELECT G.NOMBREGRUPOTRABAJO,TMD.CODIGOMATERIAL,M.NOMBREMATERIAL,M.CODIGOUNIDAD,TMD.CODIGOODT,NVL(TMD.CANTIDAD,0), NVL(TMD.CANTIDADDESMANTELADA,0), '+
      '0 AS CANTIDADENTREGADA, 0 AS CANTIDADCONSUMIDA, '+
      '0 AS CANTIDADCONSUMIDADESMANTELADA, 0 AS CANTIDADRETIRADABUENA, 0 AS CANTIDADRETIRADAMALA, '+
      '0 AS CANTIDADREINTEGRADABUENA,0 AS CANTIDADREINTEGRADAMALA, 0 AS CANTIDADREINTEGRADABUENADESMAN, '+
      '0 AS CANTIDADREINTEGRADAMALADESMAN,0 AS CANTIDADTRASLADONUEVA,0 AS CANTIDADTRASLADODESMAN '+
      'FROM  TRASLADOMATERIAL T, TRASLADOMATERIALDETALLE TMD, MATERIALESSA M, GRUPOTRABAJO G, ODT O '+
      'WHERE TMD.CODIGOTRASLADO = T.CODIGOTRASLADO '+
      'AND TMD.CODIGOMATERIAL = M.CODIGOMATERIAL '+
      'AND T.CODIGOADMINISTRATIVOORIGEN = G.CODIGOADMINISTRATIVO '+
      'AND T.CODIGOGRUPOTRABAJOORIGEN = G.CODIGOGRUPOTRABAJO '+
      'AND T.CODIGOODT = O.CODIGOODT '+
      'AND O.FECHAASIGNACION >= TO_DATE(:FECHAINICIAL, ''DD/MM/YYYY'') '+
      'AND O.FECHAASIGNACION <= TO_DATE(:FECHAFINAL, ''DD/MM/YYYY'') '+
      'AND T.CODIGOADMINISTRATIVOORIGEN = :CODIGOADMINISTRATIVO '+
      ') '+
      'GROUP BY '+
      //' NOMBREGRUPOTRABAJO, CODIGOMATERIAL, NOMBREMATERIAL,CODIGOUNIDAD,CODIGOODT,CONSECUTIVO '+
      ' NOMBREGRUPOTRABAJO, CODIGOMATERIAL, NOMBREMATERIAL,CODIGOUNIDAD,CODIGOODT '+
      ') '+
      'WHERE '+
      '( '+
      '(TRASLADONUEVONEGATIVO >0) OR '+
      '(TRASLADODESMANNEGATIVO >0) OR '+
      '(CANTIDADENTREGADA >0) OR '+
      '(CANTIDADCONSUMIDA >0) OR '+
      '(CANTIDADCONSUMIDADESMANTELADA >0) OR '+
      '(CANTIDADRETIRADABUENA >0) OR '+
      '(CANTIDADRETIRADAMALA >0) OR '+
      '(CANTIDADREINTEGRADABUENA >0) OR '+
      '(CANTIDADREINTEGRADAMALA >0) OR '+
      '(CANTIDADREINTEGRADABUENADESMAN >0) OR '+
      '(CANTIDADREINTEGRADAMALADESMAN >0) OR '+
      '(CANTIDADTRASLADONUEVA >0) OR '+
      '(CANTIDADTRASLADODESMAN >0) '+
      ') '+
      //'ORDER BY NOMBREGRUPOTRABAJO, CODIGOMATERIAL,CODIGOUNIDAD,CODIGOODT,CONSECUTIVO');
      'ORDER BY NOMBREGRUPOTRABAJO, CODIGOODT, CODIGOMATERIAL,CODIGOUNIDAD');

      qBalance.ParamByName('CODIGOADMINISTRATIVO').AsString := qGrupoTrabajo.FieldByName('CODIGOADMINISTRATIVO').AsString;
      qBalance.ParamByName('FECHAINICIAL').AsString := FormatDateTime('dd/mm/yyyy', FechaInicial);
      qBalance.ParamByName('FECHAFINAL').AsString := FormatDateTime('dd/mm/yyyy', FechaFinal);
      qBalance.Open;
      qrlDependencia.Caption := DBText1.Field.Text;
      qrTitulo.Caption := 'Del ' + eFechaInicial.Text + ' al ' + eFechaFinal.Text;
      showmodal;
    end;
  except
    fQRBalanceMaterialMovilesODT.free;
  end;  
end;

procedure TfListaStock.MovimientodeladependenciaporRequisicion1Click(
  Sender: TObject);
begin
//Aqui Reporte de Movimientod de las cuadrillas de las dependencias por Requisicion.
  fQRBalanceMaterialMovilesReq := TfQRBalanceMaterialMovilesReq.Create(Application);
  try
    with fQRBalanceMaterialMovilesReq do
    begin
      qBalance.close;
      qBalance.SQL.Clear;
      qBalance.SQL.Add('SELECT ORq.CODIGOREQUISICION,orq.fecharequisicion,orq.vigencia,ART.nombregrupotrabajo,ART.codigomaterial, ART.nombrematerial,ART.codigounidad, art.codigoodt as codigoodtcompleto, '+
      'ART.CANTIDADENTREGADA, ART.CANTIDADCONSUMIDA, art.cantidadreintegradabuena, art.cantidadreintegradamala,art.cantidadtrasladonueva, art.trasladonuevonegativo FROM ODTREQUISICION ORq, '+
      '(SELECT * FROM ( '+
      //'SELECT NOMBREGRUPOTRABAJO, CODIGOMATERIAL, NOMBREMATERIAL,CODIGOUNIDAD,CODIGOODT,CONSECUTIVO,SUM(cantidad) AS TRASLADONUEVONEGATIVO, '+
      'SELECT NOMBREGRUPOTRABAJO, CODIGOMATERIAL, NOMBREMATERIAL,CODIGOUNIDAD,codigoodt,SUM(cantidad) AS TRASLADONUEVONEGATIVO, '+
      'SUM(cantidaddesmantelada) AS TRASLADODESMANNEGATIVO, SUM(CANTIDADENTREGADA) AS CANTIDADENTREGADA, SUM(CANTIDADCONSUMIDA) AS CANTIDADCONSUMIDA, '+
      'SUM(CANTIDADCONSUMIDADESMANTELADA) AS CANTIDADCONSUMIDADESMANTELADA, SUM (CANTIDADRETIRADABUENA) AS CANTIDADRETIRADABUENA, '+
      'SUM(CANTIDADRETIRADAMALA) AS CANTIDADRETIRADAMALA,SUM (CANTIDADREINTEGRADABUENA) AS CANTIDADREINTEGRADABUENA, '+
      'SUM(CANTIDADREINTEGRADAMALA) AS CANTIDADREINTEGRADAMALA, SUM(CANTIDADREINTEGRADABUENADESMAN) AS CANTIDADREINTEGRADABUENADESMAN, '+
      'SUM(CANTIDADREINTEGRADAMALADESMAN) AS CANTIDADREINTEGRADAMALADESMAN,SUM(CANTIDADTRASLADONUEVA) AS CANTIDADTRASLADONUEVA, '+
      'SUM(CANTIDADTRASLADODESMAN) AS CANTIDADTRASLADODESMAN, '+
      '(NVL(SUM(CANTIDADTRASLADONUEVA),0)+NVL(SUM(CANTIDADENTREGADA),0)-NVL(SUM(cantidad),0)- NVL(SUM(CANTIDADCONSUMIDA),0)-NVL(SUM (CANTIDADREINTEGRADABUENA),0)- '+
      'NVL(SUM(CANTIDADREINTEGRADAMALA),0)) AS BALANCENUEVO, '+
      '(NVL(SUM(CANTIDADTRASLADODESMAN),0)+ NVL(SUM(CANTIDADRETIRADAMALA),0)+NVL(SUM (CANTIDADRETIRADABUENA),0)-NVL(SUM(cantidaddesmantelada),0)- '+
      'NVL(SUM(CANTIDADCONSUMIDADESMANTELADA),0)-NVL(SUM(CANTIDADREINTEGRADABUENADESMAN),0)-NVL(SUM(CANTIDADREINTEGRADAMALADESMAN),0)) AS BALANCEDESMANTELADO '+
      'FROM '+
      '( '+
      //'SELECT G.NOMBREGRUPOTRABAJO, M.CODIGOMATERIAL, M.NOMBREMATERIAL,M.CODIGOUNIDAD,OD.CODIGOODT, OD.CONSECUTIVO,0 AS cantidad, 0 AS cantidaddesmantelada, NVL(SUM(OP.CANTIDADENTREGADA),0) AS CANTIDADENTREGADA, '+
      'SELECT G.NOMBREGRUPOTRABAJO, M.CODIGOMATERIAL, M.NOMBREMATERIAL,M.CODIGOUNIDAD,OD.CODIGOODT,0 AS cantidad, 0 AS cantidaddesmantelada, NVL(SUM(OP.CANTIDADENTREGADA),0) AS CANTIDADENTREGADA, '+
      'NVL(SUM(OP.CANTIDADCONSUMIDA),0) AS CANTIDADCONSUMIDA, '+
      'NVL(SUM(OP.CANTIDADCONSUMIDADESMANTELADA),0) AS CANTIDADCONSUMIDADESMANTELADA, NVL(SUM (OP.CANTIDADRETIRADABUENA),0) AS CANTIDADRETIRADABUENA, NVL(SUM(OP.CANTIDADRETIRADAMALA),0) AS CANTIDADRETIRADAMALA, '+
      'NVL(SUM(OP.CANTIDADREINTEGRADABUENA),0) AS CANTIDADREINTEGRADABUENA, '+
      'NVL(SUM(OP.CANTIDADREINTEGRADAMALA),0) AS CANTIDADREINTEGRADAMALA, NVL(SUM(OP.CANTIDADREINTEGRADABUENADESMAN),0) AS CANTIDADREINTEGRADABUENADESMAN, '+
      'NVL(SUM(OP.CANTIDADREINTEGRADAMALADESMAN),0) AS CANTIDADREINTEGRADAMALADESMAN, NVL(SUM(CANTIDADTRASLADONUEVA),0) AS CANTIDADTRASLADONUEVA, '+
      'NVL(SUM(CANTIDADTRASLADODESMAN),0) AS CANTIDADTRASLADODESMAN '+
      'FROM ODT O, ODTPRESMATE OP, MATERIALESSA M, ODTDIA OD,GRUPOTRABAJO G, ADMINISTRATIVO A '+
      'WHERE O.CODIGOODT = OP.CODIGOODT '+
      'AND O.CODIGOODT = OD.CODIGOODT '+
      'AND OD.CODIGOODT = OP.CODIGOODT '+
      'AND OD.CONSECUTIVO = OP.CONSECUTIVO '+
      'AND OP.CODIGOMATERIAL = M.CODIGOMATERIAL '+
      'AND O.CODIGOADMINISTRATIVO = A.CODIGOADMINISTRATIVO '+
      'AND O.CODIGOADMINISTRATIVO = :CODIGOADMINISTRATIVO '+
      'AND OD.CODIGOGRUPOTRABAJO = G.CODIGOGRUPOTRABAJO '+
      'AND A.CODIGOADMINISTRATIVO = G.CODIGOADMINISTRATIVO '+
      'AND O.FECHAASIGNACION >= TO_DATE(:FECHAINICIAL, ''DD/MM/YYYY'') '+
      'AND O.FECHAASIGNACION <= TO_DATE(:FECHAFINAL, ''DD/MM/YYYY'') '+
      //'GROUP BY OD.CODIGOODT, OD.CONSECUTIVO,G.NOMBREGRUPOTRABAJO, M.CODIGOMATERIAL, M.NOMBREMATERIAL, M.CODIGOUNIDAD '+
      'GROUP BY OD.CODIGOODT,G.NOMBREGRUPOTRABAJO, M.CODIGOMATERIAL, M.NOMBREMATERIAL, M.CODIGOUNIDAD '+
      'UNION '+
      //'SELECT G.NOMBREGRUPOTRABAJO,TMD.CODIGOMATERIAL,M.NOMBREMATERIAL,M.CODIGOUNIDAD,TMD.CODIGOODT,TMD.CONSECUTIVO,NVL(TMD.CANTIDAD,0), NVL(TMD.CANTIDADDESMANTELADA,0), '+
      'SELECT G.NOMBREGRUPOTRABAJO,TMD.CODIGOMATERIAL,M.NOMBREMATERIAL,M.CODIGOUNIDAD,TMD.CODIGOODT,NVL(TMD.CANTIDAD,0), NVL(TMD.CANTIDADDESMANTELADA,0), '+
      '0 AS CANTIDADENTREGADA, 0 AS CANTIDADCONSUMIDA, '+
      '0 AS CANTIDADCONSUMIDADESMANTELADA, 0 AS CANTIDADRETIRADABUENA, 0 AS CANTIDADRETIRADAMALA, '+
      '0 AS CANTIDADREINTEGRADABUENA,0 AS CANTIDADREINTEGRADAMALA, 0 AS CANTIDADREINTEGRADABUENADESMAN, '+
      '0 AS CANTIDADREINTEGRADAMALADESMAN,0 AS CANTIDADTRASLADONUEVA,0 AS CANTIDADTRASLADODESMAN '+
      'FROM  TRASLADOMATERIAL T, TRASLADOMATERIALDETALLE TMD, MATERIALESSA M, GRUPOTRABAJO G, ODT O '+
      'WHERE TMD.CODIGOTRASLADO = T.CODIGOTRASLADO '+
      'AND TMD.CODIGOMATERIAL = M.CODIGOMATERIAL '+
      'AND T.CODIGOADMINISTRATIVOORIGEN = G.CODIGOADMINISTRATIVO '+
      'AND T.CODIGOGRUPOTRABAJOORIGEN = G.CODIGOGRUPOTRABAJO '+
      'AND T.CODIGOODT = O.CODIGOODT '+
      'AND O.FECHAASIGNACION >= TO_DATE(:FECHAINICIAL, ''DD/MM/YYYY'') '+
      'AND O.FECHAASIGNACION <= TO_DATE(:FECHAFINAL, ''DD/MM/YYYY'') '+
      'AND T.CODIGOADMINISTRATIVOORIGEN = :CODIGOADMINISTRATIVO '+
      ') '+
      'GROUP BY '+
      //' NOMBREGRUPOTRABAJO, CODIGOMATERIAL, NOMBREMATERIAL,CODIGOUNIDAD,CODIGOODT,CONSECUTIVO '+
      ' NOMBREGRUPOTRABAJO, CODIGOMATERIAL, NOMBREMATERIAL,CODIGOUNIDAD,CODIGOODT '+
      ') '+
      'WHERE '+
      '( '+
      '(TRASLADONUEVONEGATIVO >0) OR '+
      '(TRASLADODESMANNEGATIVO >0) OR '+
      '(CANTIDADENTREGADA >0) OR '+
      '(CANTIDADCONSUMIDA >0) OR '+
      '(CANTIDADCONSUMIDADESMANTELADA >0) OR '+
      '(CANTIDADRETIRADABUENA >0) OR '+
      '(CANTIDADRETIRADAMALA >0) OR '+
      '(CANTIDADREINTEGRADABUENA >0) OR '+
      '(CANTIDADREINTEGRADAMALA >0) OR '+
      '(CANTIDADREINTEGRADABUENADESMAN >0) OR '+
      '(CANTIDADREINTEGRADAMALADESMAN >0) OR '+
      '(CANTIDADTRASLADONUEVA >0) OR '+
      '(CANTIDADTRASLADODESMAN >0) '+
      ') '+
      //'ORDER BY NOMBREGRUPOTRABAJO, CODIGOMATERIAL,CODIGOUNIDAD,CODIGOODT,CONSECUTIVO');
      'ORDER BY NOMBREGRUPOTRABAJO, CODIGOODT, CODIGOMATERIAL,CODIGOUNIDAD '+
      ') ART '+
      'WHERE ART.codigoodt = orq.CODIGOODT '+
      'ORDER BY art.nombregrupotrabajo, orq.VIGENCIA, orq.CODIGOREQUISICION,ART.codigoodt ');

      qBalance.ParamByName('CODIGOADMINISTRATIVO').AsString := qGrupoTrabajo.FieldByName('CODIGOADMINISTRATIVO').AsString;
      qBalance.ParamByName('FECHAINICIAL').AsString := FormatDateTime('dd/mm/yyyy', FechaInicial);
      qBalance.ParamByName('FECHAFINAL').AsString := FormatDateTime('dd/mm/yyyy', FechaFinal);
      qBalance.Open;
      qrlDependencia.Caption := DBText1.Field.Text;
      qrTitulo.Caption := 'Del ' + eFechaInicial.Text + ' al ' + eFechaFinal.Text;
      showmodal;
    end;
  except
    fQRBalanceMaterialMovilesReq.free;
  end;
end;

procedure TfListaStock.qAuditoriaAfterPost(DataSet: TDataSet);
begin
  inherited;
  qAuditoria.ApplyUpdates;
  qAuditoria.CommitUpdates;
end;

procedure TfListaStock.AuditoriaStockCuadrilla(odt,
  administrativo: double; consec, grupotrabajo: integer);
var query:tquery;
begin
  query:=TQuery.create(self);
  query.DatabaseName:='BaseDato';
  query.sql.add('SELECT CODIGOODTAUDITORIASTOCK FROM ODTAUDITORIASTOCK');
  query.sql.add('WHERE CODIGOODT='+floattostr(odt));
  query.sql.add('AND CONSECUTIVO='+inttostr(consec));
  query.open;
  Auditoria:=true;
  codigoodt:=odt;
  codigoadministrativo:=administrativo;
  consecutivo:=consec;
  codigogrupotrabajo:=grupotrabajo;

  if (query.RecordCount<1) then
  begin
    EditarAuditoria:=true;
    qAuditoria.close;
    qAuditoria.ParamByName('CODIGOODTAUDITORIASTOCK').Asfloat:=-1;
    qAuditoria.open;
    qAuditoria.insert;
    qAuditoriaCODIGOADMINISTRATIVO.AsFloat:=codigoadministrativo;
    qAuditoriaCODIGOGRUPOTRABAJO.Asinteger:=codigogrupotrabajo;
    qAuditoriaCODIGOODT.AsFloat:=codigoodt;
    qAuditoriaCONSECUTIVO.Asinteger:=consecutivo;
    qAuditoria.post;
    qDetalleAuditoria.close;
    qDetalleAuditoria.open;
    InsertaMaterialAuditoriaStock;
    sbAuditoria.Enabled:=false;
  end
  else
  begin
  // Imprimir
    qAuditoria.close;
    qAuditoria.ParamByName('CODIGOODTAUDITORIASTOCK').Asfloat:=query.fields[0].AsFloat;
    qAuditoria.open;
    sbAuditoria.Enabled:=true;    
  end;

  query.close;
  query.free;



  qDetalleAuditoria.close;
  qDetalleAuditoria.open;


  Panel1.Enabled:=false;
  Notebook.ActivePage:='Auditoria';
  dbgStockGrupos.Enabled:=false;
end;

procedure TfListaStock.qAuditoriaAfterInsert(DataSet: TDataSet);
var query:tquery;
begin
  inherited;
  query:=TQuery.Create(self);
  query.DatabaseName:='BaseDato';
  query.sql.add('select sq_odtauditoriastock.nextval from dual');
  query.Open;
  qAuditoriaCODIGOODTAUDITORIASTOCK.AsFloat:=query.Fields[0].AsFloat;
  query.free;
end;

procedure TfListaStock.InsertaMaterialAuditoriaStock;
var qactualiza:tquery;
begin
  qListaStock.close;
  qListaStock.open;
  qListaStock.First;
  qactualiza:=TQuery.create(self);
  qactualiza.DatabaseName:='BaseDato';
  while not qListaStock.eof  do
  begin
//    if (qListaStockCANTIDADACTUAL.AsFloat>0)or(qListaStockCANTIDADACTUALDESMANTELADABUEN.AsFloat>0)then
//    begin
      qDetalleAuditoria.insert;
      qDetalleAuditoriaCODIGOMATERIAL.AsFloat:=qListaStockCODIGOMATERIAL.AsFloat;
      qDetalleAuditoriaCANTIDADNUEVA.AsFloat:=qListaStockCANTIDADACTUAL.AsFloat;
      qDetalleAuditoriaCANTIDADDESMANTBUENA.AsFloat:=qListaStockCANTIDADACTUALDESMANTELADABUEN.AsFloat;
      qDetalleAuditoriaCANTIDADDESMANTMALA.AsFloat:=qListaStockCANTIDADACTUALDESMANTELADABUEN.AsFloat;
      qDetalleAuditoria.post;
//    end;

    qListaStock.next;
  end;
  qactualiza.free;
end;

procedure TfListaStock.qDetalleAuditoriaAfterPost(DataSet: TDataSet);
begin
  inherited;
  qDetalleAuditoria.ApplyUpdates;
  qDetalleAuditoria.CommitUpdates;
end;

procedure TfListaStock.qDetalleAuditoriaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qDetalleAuditoriaCODIGOODTAUDITORIASTOCK.AsFloat:=qAuditoriaCODIGOODTAUDITORIASTOCK.AsFloat;
end;

procedure TfListaStock.sbAuditoriaClick(Sender: TObject);
var nombres:array [0..1,0..3] of string;
  i:integer;
  query:tquery;
begin
  fQRAuditoriaStockMoviles := TfQRAuditoriaStockMoviles.Create(Application);
  try
    with fQRAuditoriaStockMoviles do
    begin
      qBalance.close;
      qBalance.DataSource:=dsAuditoria;
      qBalance.Open;
      qempleado.close;
      qempleado.ParamByName('CODIGOADMINISTRATIVO').AsString := qGrupoTrabajo.FieldByName('CODIGOADMINISTRATIVO').AsString;
      qempleado.ParamByName('CODIGOGRUPOTRABAJO').AsString := qGrupoTrabajo.FieldByName('CODIGOGRUPOTRABAJO').AsString;
      qempleado.Open;
      for i:=0 to 3 do
      begin
        nombres[0,i]:='';
        nombres[1,i]:='';
      end;
      i:=0;
      while not qempleado.eof do
      begin
        if i<4 then
        begin
          nombres[0,i]:=qEmpleado.fieldbyname('CODIGOEMPLEADO').AsString;
          nombres[1,i]:=qEmpleado.fieldbyname('NOMBREEMPLEADO').AsString;
        end;
        qEmpleado.next;
        inc(i);
      end;
      QRLCedulas1.Caption:=nombres[0,0]+char(13)+nombres[0,1];
      QRLCedulas2.Caption:=nombres[0,2]+char(13)+nombres[0,3];
      qrlNombres1.Caption:=nombres[1,0]+char(13)+nombres[1,1];
      qrlNombres2.Caption:=nombres[1,2]+char(13)+nombres[1,3];
      qrlDependencia.Caption := DBText1.Field.Text;
      qrTitulo.Caption := 'ODT: '+qAuditoriaCODIGOODT.AsString+'-'+qAuditoriaCONSECUTIVO.AsString;
      query:=tquery.create(self);
      query.DatabaseName:='BaseDato';
      query.sql.add('SELECT E.CODIGOEMPLEADO,E.NOMBREEMPLEADO FROM EMPLEADO E,ODT O');
      query.sql.add('WHERE E.CODIGOEMPLEADO=O.CODIGOREVISADO');
      query.sql.add('AND O.CODIGOODT='+qAuditoriaCODIGOODT.AsString);
    

      query.open;
      qrlRevisaNombre.Caption:=query.fieldbyname('NOMBREEMPLEADO').AsString;
      qrlRevisaCedula.Caption:=query.fieldbyname('CODIGOEMPLEADO').AsString;
      query.close;

      query.sql.clear;
      query.sql.add('SELECT E.CODIGOEMPLEADO,E.NOMBREEMPLEADO FROM EMPLEADO E,ODT O');
      query.sql.add('WHERE E.CODIGOEMPLEADO=O.CODIGOEJECUTOR');
      query.sql.add('AND O.CODIGOODT='+qAuditoriaCODIGOODT.AsString);
      query.open;
      qrlCuadrillanombre1.Caption:=query.fieldbyname('NOMBREEMPLEADO').AsString;
      qrlCuadrillaCedula1.Caption:=query.fieldbyname('CODIGOEMPLEADO').AsString;

      query.free;
      showmodal;
    end;
  except
    on e:exception do
    begin
      showmessage(e.message);
      fQRAuditoriaStockMoviles.free;
    end;
  end;
end;

procedure TfListaStock.qListaStockBeforePost(DataSet: TDataSet);
begin
  inherited;
  if not EditarStock then raise exception.Create('Usted no tiene permisos para editar el stock de materiales.');
end;

procedure TfListaStock.qDetalleAuditoriaCalcFields(DataSet: TDataSet);
var query:tquery;
begin
  inherited;
  if (qDetalleAuditoriaCODIGOMATERIAL.AsString<>'') then
  begin
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('select codigounidad,nombrematerial from materialessa');
    query.sql.add('where codigomaterial='+qDetalleAuditoriaCODIGOMATERIAL.AsString);
    query.open;
    qDetalleAuditoriaCODIGOUNIDAD.AsString:=query.fieldbyname('codigounidad').asstring;
    qDetalleAuditoriaNOMBREMATERIAL.AsString:=query.fieldbyname('nombrematerial').asstring;
    query.close;
    query.free;
  end;
end;

procedure TfListaStock.dbgauditoriaEditButtonClick(Sender: TObject);
var i:integer;
begin
  fBuscarMaterial := tfBuscarMaterial.Create(Application);
  try
    if fBuscarMaterial.ShowModal = mrOk then
    begin
      if fBuscarMaterial.DBGridBuscarMaterial.SelectedRows.Count>0 then
      begin
        for i:=0 to fBuscarMaterial.DBGridBuscarMaterial.SelectedRows.Count-1 do
        begin
          fBuscarMaterial.qMaterial.BookMark:=fBuscarMaterial.DBGridBuscarMaterial.SelectedRows.Items[i];
          try
            if (i=0) and (dbgauditoria.Fields[0].text<>'') then qDetalleAuditoria.Edit
            else
            begin
              if qDetalleAuditoria.State in [dsInsert] then
                qDetalleAuditoria.Cancel;
              qDetalleAuditoria.Insert;
            end;

            qDetalleAuditoria.FieldbyName('CodigoMaterial').asstring := fBuscarMaterial.qMaterial.fieldbyName('CodigoMaterial').asstring;
            qDetalleAuditoriaCANTIDADNUEVA.AsFloat:=0;
            qDetalleAuditoriaCANTIDADDESMANTBUENA.AsFloat:=0;
            qDetalleAuditoriaCANTIDADDESMANTMALA.AsFloat:=0;
            qDetalleAuditoria.Post;
            qDetalleAuditoria.Insert;
          except
            on E:Exception do
            begin
              qDetalleAuditoria.Cancel;
            end;
          end;
        end;
        if qDetalleAuditoria.State in [dsInsert] then
          qDetalleAuditoria.Cancel;
        qDetalleAuditoria.Active := False;
        qDetalleAuditoria.Active := True;
        if (not qDetalleAuditoria.IsEmpty) and (qDetalleAuditoriaCODIGOMATERIAL.AsFloat = 0) then
          qDetalleAuditoria.Delete;
      end;
    end;
  finally
    fBuscarMaterial.free;
  end;
end;

procedure TfListaStock.qAuditoriaBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  if ((not Auditoria) and (varcodigousuario <> 0)) then
    raise exception.Create('Este registro Solo es editable a través de una Odt.');
end;

procedure TfListaStock.qAuditoriaBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if ((not Auditoria) and (varcodigousuario <> 0)) then
    raise exception.Create('Solo se pueden agregar registros a través de una Odt.');
end;

procedure TfListaStock.qDetalleAuditoriaBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  if not(Editarauditoria) then
    raise exception.Create('Esta auditoría no es Editable.');
end;

procedure TfListaStock.qDetalleAuditoriaBeforePost(DataSet: TDataSet);
begin
  inherited;
  if not(Editarauditoria) then
    raise exception.Create('Esta auditoría no es Editable.');
end;

procedure TfListaStock.qListaStockAfterScroll(DataSet: TDataSet);
begin
  if qListaStockCODIGOMATERIAL.asString<>'' then
  begin
    if Serializado then
    begin
      dbgSerial.Visible:=True;
      qSerial.close;
      qSerial.open;
    end
    else
      dbgSerial.Visible:=False;
  end;

end;

function TfListaStock.Serializado: boolean;
var
  sql:string;
  qry:tquery;
begin
  Result:=False;
  sql:='Select * from materialessa where codigomaterial='+qListaStockCODIGOMATERIAL.asString+
        ' and serializable=''S''';
  qry:=Tquery.Create(Application);
  qry.DatabaseName:='BaseDato';
  qry.sql.text:=sql;
  qry.open;

  if not qry.IsEmpty then
    Result:=True;

  qry.close;
  qry.free;
end;

function TfListaStock.TienePermisos(pVarCodigoUsuario: Integer; pCIA: string): Boolean;
var
  qConsulta:TQuery;
begin
  result:= False;
  if pCIA <> '' then
  begin
    qConsulta:=TQuery.Create(nil);
    qConsulta.DatabaseName:='BaseDato';
    qConsulta.SQL.Text:='SELECT count(*) as cuenta FROM  odtpermisos WHERE '+
                     ' codigousuario = '+IntToStr(pVarCodigoUsuario)+' AND EDITAR = ''S'' '+
                     ' AND CODIGOADMINISTRATIVO = '+pCIA+
                     ' AND nombretabla = ''STOCKMATERIALES''';
    qConsulta.Open;
    if qConsulta.FieldByName('cuenta').AsInteger > 0 then
      result:= True;
    qConsulta.Close;
    qConsulta.Free;
  end;
end;

procedure TfListaStock.qListaStockBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if (VarCodigoUsuario <> 0) then
  begin
    if not TienePermisos(VarCodigoUsuario,qGrupoTrabajoCODIGOADMINISTRATIVO.AsString) then
      raise Exception.Create('No tiene permisos para realizar esta acción')
  end;
end;

end.


