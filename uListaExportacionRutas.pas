unit uListaExportacionRutas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls, ConsDll, ComObj,
  OleCtnrs, Math, FileCtrl, Menus;

const
  NumClientesPorPagFA = 10;
  NumClientesPorPagFB = 4;
  NumItemsPorPagFC = 68;
  NumItemsPorPagFE = 100;
  NumCeldasAbajo = 6;
  NumCeldasDerecha = 15;
  NumCeldasDerechaFC = 12;
  NomFormatoA = 'FORMATO_A_SIGCOM_PAPER - Version 3.xlsx';
  NomFormatoB = 'FORMATO_B_SIGCOM_PAPER - Version 3.xlsx';
  NomFormatoC = 'FORMATO_D_SIGCOM_PAPER - Version 3.xlsx';
  NomFormatoD = 'FORMATO_C_SIGCOM_PAPER - Version 3.xlsx';
  NomFormatoE = 'FORMATO_E_SIGCOM_PAPER - Version 3.xlsx';
  NOMTABLAEXPO = 'SGC_INFOITINERARIO';
  NOM_TBL_180 = 'FPLE180_DIARIA';
  NOM_TBL_190 = 'FPLE190_LECT';
  NOM_TBL_CAL = 'INCMS_CALENDARIO';
  CadenaExpReg = '^[0-9]+$';

  FilaIniDir = 5;
  ColIniDir = 4;
  FilaIniAOLPredio = 6;
  ColIniAOLPredio = 12;
  FilaIniSistema = 6;
  ColIniSistema = 6;
  FilaIniRuta = 6;
  ColIniRuta = 8;
  FilaIniAcometida = 6;
  ColIniAcometida = 10;
  FilaIniFila = 6;
  ColIniFila = 2;
  FilaIniColumna = 6;
  ColIniColumna = 4;
  FilaIniNumContador = 7;
  ColIniNumContador = 2;
  FilaIniMarca = 7;
  ColIniMarca = 8;
  FilaIniOrden = 5;
  ColIniOrden = 2;
  FilaIniTipoMedida = 8;
  ColIniTipoMedida = 12;
  FilaIniCodImpreso = 8;
  ColIniCodImpreso = 1;
  FilaIniNomAnomalia = 8;
  ColIniNomAnomalia = 2;
  FilaIniDesClase = 8;
  ColIniDesClase = 7;

  FilaIniNumContadorFE = 6;
  ColIniNumContadorFE = 1;
  FilaIniRutaFE = 6;
  ColIniRutaFE = 4;
  FilaIniAcometidaFE = 6;
  ColIniAcometidaFE = 5;
  FilaIniHOJA = 6;
  ColIniHOJA = 6;

type
  TRxDBGrid = class(RXDBCtrl.TRxDBGrid)
  private
  protected
    procedure DrawCell(ACol, ARow: Integer; ARect: TRect; State: TGridDrawState); override;
  public
  end;

  TFListaExportacionRutas = class(TFdSgdListaBase)
    pBase: TPanel;
    pMedio: TPanel;
    pSuperior: TPanel;
    Splitter1: TSplitter;
    DBGrid1: TDBGrid;
    RxDBGrid2: TRxDBGrid;
    pBarraItinierarios: TPanel;
    pBarraGA: TPanel;
    dsGruposAOL: TDataSource;
    dsItinerarios: TDataSource;
    qGruposAOL: TQuery;
    qItinerarios: TQuery;
    qGruposAOLCODIGOGRUPOAOL: TFloatField;
    qGruposAOLNOMBREGRUPOAOL: TStringField;
    qGruposAOLDISPERSA: TStringField;
    qGruposAOLCODIGORUTA: TFloatField;
    qGruposAOLCODIGOGRUPOITINERARIO: TFloatField;
    qGruposAOLNOMBREESTADOGRUPOITINERARIO: TStringField;
    Panel4: TPanel;
    bbExpoGIs: TBitBtn;
    qGruposAOLTipoGrupoAOL: TStringField;
    qItinerariosCODIGOITINERARIO: TFloatField;
    qItinerariosCODIGOGRUPOAOL: TFloatField;
    qItinerariosCODIGORUTA: TFloatField;
    qItinerariosCODIGOGRUPOITINERARIO: TFloatField;
    qItinerariosNOMBREITINERARIO: TStringField;
    qItinerariosCOLOR: TFloatField;
    qItinerariosNOMBREESTADOITINERARIO: TStringField;
    qItinerariosAOLFINCADESDE: TFloatField;
    qItinerariosAOLFINCAHASTA: TFloatField;
    qItinerariosCANTIDADPG: TFloatField;
    qItinerariosCANTIDADSUMINISTROS: TFloatField;
    qItinerariosCODIGOGRUPOTRABAJO: TFloatField;
    qItinerariosNOMBREGRUPOTRABAJO: TStringField;
    qItinerariosCODIGOADMINISTRATIVO: TFloatField;
    qItinerariosNOMBRECATEGORIA: TStringField;
    qGruposAOLCODIGOESTADOGRUPOITINERARIO: TFloatField;
    qTotalItinerariosDiaL: TQuery;
    qPMConcDiaL: TQuery;
    qPMPuntDiaL: TQuery;
    qClientesDiaL: TQuery;
    qTotalItinerariosDiaLTOTALITINERARIOS: TFloatField;
    dsTotalItinerariosDiaL: TDataSource;
    dsClientesDiaL: TDataSource;
    dsPMConcDiaL: TDataSource;
    dsPMPuntDiaL: TDataSource;
    qClientesDiaLTOTALCLIENTES: TFloatField;
    qPMConcDiaLPUNTOSMEDIDA: TFloatField;
    qPMPuntDiaLPUNTOSMEDIDA: TFloatField;
    bbCambiarGTaIti: TBitBtn;
    qItinerariosCODIGOESTADOITINERARIO: TFloatField;
    qItinerariosITEM: TFloatField;
    sbVerGIenCarto: TSpeedButton;
    sbRefrescar: TSpeedButton;
    sbVerItiEnCarto: TSpeedButton;
    qGruposAOLITEM: TFloatField;
    From_qInsert_Info: TQuery;
    SelectPrincipal_qInsert_Info: TQuery;
    Select_EnRutaSinInfoComercial: TQuery;
    From_qInsert_Info_GC: TQuery;
    Insert_SoloComercial: TQuery;
    qClientesAlertantes: TQuery;
    qItinerariosIMPRIMIRPLANILLA: TStringField;
    sbImprimirItinerario: TSpeedButton;
    qImprimirItinerario: TQuery;
    qItinerariosLOGIN: TStringField;
    sbBorrarExpo: TSpeedButton;
    pmSigComPapel: TPopupMenu;
    miExcelYMapas: TMenuItem;
    miSoloMapas: TMenuItem;
    InsertInto_qInsert_Info: TQuery;
    qItinerariosCantClientesEnrutadosCruzados: TIntegerField;
    qItinerariosCantClientesSOLOComercial: TIntegerField;
    Select_SoloComercial: TQuery;
    From_SoloComercial: TQuery;
    qItinerariosCantClientesAExportar: TIntegerField;
    Panel6: TPanel;
    Label3: TLabel;
    DBText3: TDBText;
    DBText4: TDBText;
    Label4: TLabel;
    lblTotalClientesAExp: TLabel;
    Insert_EnRutaSinInfoComercial: TQuery;
    From_EnRutaSinInfoComercial: TQuery;
    qItinerariosCantClientesEnRutaSinInfoCOM: TIntegerField;
    sbCalcClientesTotalesAExp: TSpeedButton;
    qItinerariosCantClientesAliensDiaL: TIntegerField;
    qItinerariosCantClientesItinerario: TIntegerField;
    qIndice: TQuery;
    qLibrosSinPromedio: TQuery;
    qTelemedidos: TQuery;
    qMarcarRegistrosAuditables: TQuery;
    spMarcarAuditables: TStoredProc;
    qInsertAltosConsumidores: TQuery;
    procedure FormShow(Sender: TObject);
    procedure qGruposAOLCalcFields(DataSet: TDataSet);
    procedure bbExpoGIsClick(Sender: TObject);
    procedure qItinerariosAfterOpen(DataSet: TDataSet);
    procedure qGruposAOLAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure bbCambiarGTaItiClick(Sender: TObject);
    procedure sbVerGIenCartoClick(Sender: TObject);
    procedure RxDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbRefrescarClick(Sender: TObject);
    procedure sbVerItiEnCartoClick(Sender: TObject);
    procedure sbImprimirItinerarioClick(Sender: TObject);
    procedure sbBorrarExpoClick(Sender: TObject);
    procedure miExcelYMapasClick(Sender: TObject);
    procedure miSoloMapasClick(Sender: TObject);
    procedure qItinerariosCalcFields(DataSet: TDataSet);
    procedure sbCalcClientesTotalesAExpClick(Sender: TObject);

  private
    { Private declarations }
    iSedeOperativa, iCodigoDial, iPeriodo, iCodCoorGT: integer;
    dtFechaLectura: TDate;
    sNombreSO, sEsquemaInterfaz: string;

    FilaDir, ColDir: integer;
    FilaAOLPredio, ColAOLPredio: integer;
    FilaSistema, ColSistema: integer;
    FilaRuta, ColRuta: integer;
    FilaAcometida, ColAcometida: integer;
    FilaFila, ColFila: integer;
    FilaColumna, ColColumna: integer;
    FilaNumContador, ColNumContador: integer;
    FilaMarca, ColMarca: integer;
    FilaOrden, ColOrden: integer;
    FilaTipoMedida, ColTipoMedida: integer;
    FilaCodImpreso, ColCodImpreso: integer;
    FilaNomAnomalia, ColNomAnomalia: integer;
    FilaDesClase, ColDesClase: integer;
    FilaHOJA, ColHOJA: integer;
    ParametroAuditable : String;

    slCliPorIti, slCodsIti: TStringlist;

    procedure DeshabilitarControles(pValor: Boolean);
    function GetTotalRegsTablasCOM(sTabla: string; dtFechaLectura: TDateTime): Integer;
    procedure InicializarFilasFA;
    procedure InicializarColumnasFA;
    procedure InicializarFilasFC;
    procedure InicializarColumnasFC;
    procedure ImprimirCartoItinerario;
    function GetTotalClientesAExp: Integer;
    function GetPeriodoMaxExportadoGAOL (slCodsItis: TStringlist): Integer;
    procedure InicializarFilasFE;
    procedure InicializarColumnasFE;
    function FileVersionGet( const sgFileName : string ) : string;
    function ActualizarTotal(sCodIti, sFecha, sCampo, sValor: string): Integer;
    function HayInfoLECT_CORTE(dtFechaLectura: TDateTime): Boolean;
    procedure GetParametroAuditables;
    
  public
    { Public declarations }
  end;

var
  FListaExportacionRutas: TFListaExportacionRutas;

implementation

uses uFormaEspere, uOpcionExpoItinerario, uFIMPAdministrativo, uFuncionSGD;

{$R *.DFM}

function TFListaExportacionRutas.FileVersionGet( const sgFileName : string ) : string;
var infoSize: DWORD;
var verBuf:   pointer;
var verSize:  UINT;
var wnd:      UINT;
var FixedFileInfo : PVSFixedFileInfo;
begin
  infoSize := GetFileVersioninfoSize(PChar(sgFileName), wnd);

  result := '';

  if infoSize <> 0 then
  begin
    GetMem(verBuf, infoSize);
    try
      if GetFileVersionInfo(PChar(sgFileName), wnd, infoSize, verBuf) then
      begin
        VerQueryValue(verBuf, '\', Pointer(FixedFileInfo), verSize);

        result := IntToStr(FixedFileInfo.dwFileVersionMS div $10000) + '.' +
                  IntToStr(FixedFileInfo.dwFileVersionMS and $0FFFF) + '.' +
                  IntToStr(FixedFileInfo.dwFileVersionLS div $10000) + '.' +
                  IntToStr(FixedFileInfo.dwFileVersionLS and $0FFFF);
      end;
    finally
      FreeMem(verBuf);
    end;
  end;
end;

procedure TRxDBGrid.DrawCell(ACol, ARow: Integer; ARect: TRect; State: TGridDrawState);
const
  ALGN : array[0..2] of Integer = (DT_LEFT, DT_RIGHT, DT_CENTER);
var
  CurrTit : string;
  CurrCol : TColumn;
  uFormat : Integer;
begin
  TRxDBGrid(Self).RowHeights[0] := 2 * TRxDBGrid(Self).DefaultRowHeight;
  if (ARow = 0) and (ACol > 0) and (ColCount > 0) then
  begin
    CurrCol := Columns[ACol - Integer(dgIndicator in Options)];
    CurrTit := CurrCol.Title.Caption;
    Canvas.Font := CurrCol.Font;
    Canvas.FillRect(ARect);
    uFormat := ALGN[Integer(CurrCol.Title.Alignment)] + DT_WORDBREAK;
    DrawText(Canvas.Handle, PChar(CurrTit), -1, ARect, uFormat);
  end
  else
    Inherited;
end;

function TFListaExportacionRutas.GetPeriodoMaxExportadoGAOL (slCodsItis: TStringlist): Integer;
var
  qVarios: TQuery;
begin
  result:= 0;
  if slCodsItis.Count > 0 then
  begin
    qVarios:= TQuery.Create(nil);
    qVarios.DatabaseName := 'BaseDato';
    qVarios.SQL.Add('SELECT MAX(PERIODO) AS ULTIMOPERIODOEXP');
    qVarios.SQL.Add('FROM '+NOMTABLAEXPO);
    qVarios.SQL.Add('WHERE CODIGOITINERARIO IN ('+slCodsItis.CommaText+')');
    qVarios.Open;
    result:= qVarios.FieldByName('ULTIMOPERIODOEXP').AsInteger;
    qVarios.Close;
    qVarios.Free;
  end;
end;

procedure TFListaExportacionRutas.DeshabilitarControles(pValor: Boolean);
begin
  bbExpoGIs.Enabled:= pValor;
  sbVerGIenCarto.Enabled:= pValor;
  bbCambiarGTaIti.Enabled := pValor;
  sbVerItiEnCarto.Enabled := pValor;
  sbImprimirItinerario.Enabled:= pValor;
  sbBorrarExpo.Enabled := pValor;
  sbCalcClientesTotalesAExp.Enabled := pValor; 
end;

procedure TFListaExportacionRutas.FormCreate(Sender: TObject);
var
  qTemp: TQuery;
begin
  inherited;
  sEsquemaInterfaz:= '';
  qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';
  qTemp.SQL.Add('SELECT VALOR FROM PARAMETRO WHERE CODIGOPARAMETRO = '+QuotedStr('CMS'));
  qTemp.Open;
  if not qTemp.IsEmpty then
     sEsquemaInterfaz:= qTemp.FieldByName('VALOR').AsString;
  qTemp.Close;

  slCliPorIti:= TStringlist.Create;
  slCliPorIti.Sorted := True;
  slCodsIti:= TStringlist.Create;
  slCodsIti.Sorted := True;

  RxDBGrid2.Columns[9].Title.Caption :='Clientes'+#10+'enrutados';
  RxDBGrid2.Columns[9].Title.Alignment := taCenter;
  RxDBGrid2.Columns[10].Title.Caption :='Clientes enrutados'+#10+'y con cruce Comercial';
  RxDBGrid2.Columns[10].Title.Alignment := taCenter;
  RxDBGrid2.Columns[11].Title.Caption :='Clientes enrutados'+#10+'en otros DiaL';
  RxDBGrid2.Columns[11].Title.Alignment := taCenter;
  RxDBGrid2.Columns[12].Title.Caption :='Clientes'+#10+'sin XY';
  RxDBGrid2.Columns[12].Title.Alignment := taCenter;
  RxDBGrid2.Columns[13].Title.Caption :='Clientes enrutados'+#10+'sin info Comercial';
  RxDBGrid2.Columns[13].Title.Alignment := taCenter;
  RxDBGrid2.Columns[14].Title.Caption :='Clientes totales'+#10+'a exportar';
  RxDBGrid2.Columns[14].Title.Alignment := taCenter;
  RxDBGrid2.Columns[15].Title.Caption :='Código'+#10+'Lector';
  RxDBGrid2.Columns[15].Title.Alignment := taCenter;
  RxDBGrid2.Columns[18].Title.Caption :='Código'+#10+'Administrativo';
  RxDBGrid2.Columns[18].Title.Alignment := taCenter;

  //iSedeOperativa:= StrToInt(ListaDatos[0]);
  iSedeOperativa:= StrToInt(ListaDatos.Values['SEDE_OPERATIVA']);
  //iCodigoDial:= StrToInt(ListaDatos[1]);
  iCodigoDial:= StrToInt(ListaDatos.Values['DIAL']);
  //dtFechaLectura := StrToDate(ListaDatos[2]);
  dtFechaLectura := StrToDate(ListaDatos.Values['FECHA_LECTURA']);

  qTemp.Close;
  qTemp.SQL.Clear;
  qTemp.SQL.Add('SELECT DISTINCT PERIODO FROM INCMS_CALENDARIO'+sEsquemaInterfaz);
  qTemp.SQL.Add(' WHERE FECHALECTURA = :FECHALECTURA');
  qTemp.SQL.Add(' AND CICLO = :CODIGODIAL');
  qTemp.ParamByName('FECHALECTURA').AsDate := dtFechaLectura;
  qTemp.ParamByName('CODIGODIAL').AsInteger := iCodigoDial;
  qTemp.Open;
  if not qTemp.isEmpty then
    iPeriodo:= qTemp.FieldByName('PERIODO').AsInteger
  else
  begin
    iPeriodo:= -1;
    DeshabilitarControles(False);
    Application.MessageBox(PChar('No existe un Periodo en el Calendario de Lectura para el DiaL y Fecha de Lectura digitados.'),'SigCom',MB_ICONWARNING);
  end;

  qTemp.Close;
  qTemp.SQL.Clear;
  qTemp.SQL.Add('SELECT NOMBRESEDEOPERATIVA FROM SEDEOPERATIVA');
  qTemp.SQL.Add('WHERE CODIGOSEDEOPERATIVA = '+IntToStr(iSedeOperativa));
  qTemp.Open;
  sNombreSO:= qTemp.FieldByName('NOMBRESEDEOPERATIVA').AsString;
  qTemp.Close;
  qTemp.Free;

  GetParametroAuditables;
end;

procedure TFListaExportacionRutas.FormShow(Sender: TObject);
var
 qTemp: TQuery;
begin
  inherited;
  RefrescarVariables;
  qGruposAOL.Close;
  qItinerarios.Close;
  qTotalItinerariosDiaL.Close;
  qClientesDiaL.Close;

  if (VarCodigoUsuario <> 0) then
  begin
    qTemp:= TQuery.Create(nil);
    qTemp.DatabaseName := 'BaseDato';
    qTemp.SQL.Add('SELECT CGT.CODIGOCOORDINACIONGRUPOTRABAJO');
    qTemp.SQL.Add('FROM COORDINACIONGRUPOTRABAJO CGT, USUARIO U');
    qTemp.SQL.Add('WHERE CGT.CODIGOUSUARIO = U.CODIGOUSUARIO');
    qTemp.SQL.Add('AND CGT.ACTIVO = ''S'' ');
    qTemp.SQL.Add('AND CGT.CODIGOUSUARIO = :CODUSU');
    qTemp.ParamByName('CODUSU').AsInteger := VarCodigoUsuario;
    qTemp.Open;
    if not qTemp.isEmpty then
      iCodCoorGT:= qTemp.Fields[0].AsInteger
    else
    begin
      iCodCoorGT:= -1;
      DeshabilitarControles(False);
      Application.MessageBox(PChar('Usted no es un Coordinador de Grupos de Trabajo. No hay resultados de busqueda.'),'SigCom',MB_ICONWARNING);
    end;
    qTemp.Close;
    qTemp.Free;

    if Pos('I.CODIGOCOORDINACIONGRUPOTRABAJO', UpperCase(qGruposAOL.SQL.Text)) = 0 then
    begin
      qGruposAOL.SQL.Delete(qGruposAOL.SQL.Count-1);
      qGruposAOL.SQL.Add('AND I.CODIGOCOORDINACIONGRUPOTRABAJO = '+IntToStr(iCodCoorGT)+' ) B');
    end;

    if Pos('I.CODIGOCOORDINACIONGRUPOTRABAJO', UpperCase(qItinerarios.SQL.Text)) = 0 then
      qItinerarios.SQL.Add('AND I.CODIGOCOORDINACIONGRUPOTRABAJO = '+IntToStr(iCodCoorGT));

    if Pos('I.CODIGOCOORDINACIONGRUPOTRABAJO', UpperCase(qTotalItinerariosDiaL.SQL.Text)) = 0 then
      qTotalItinerariosDiaL.SQL.Add('AND I.CODIGOCOORDINACIONGRUPOTRABAJO = '+IntToStr(iCodCoorGT));

    if Pos('I.CODIGOCOORDINACIONGRUPOTRABAJO', UpperCase(qClientesDiaL.SQL.Text)) = 0 then
      qClientesDiaL.SQL.Add('AND I.CODIGOCOORDINACIONGRUPOTRABAJO = '+IntToStr(iCodCoorGT));
  end;

  if iPeriodo <> -1 then
  begin
    qGruposAOL.ParamByName('CODIGOSEDEOPERATIVA').AsInteger := iSedeOperativa;
    qGruposAOL.ParamByName('CODIGODIAL').AsInteger := iCodigoDial;
    //qGruposAOL.SQL.SaveToFile(GetTemporalPath+'sql_gruposaol_cgt_'+IntToStr(iCodCoorGT)+'.txt');
    qGruposAOL.Open;

    //qItinerarios.SQL.SaveToFile(GetTemporalPath+'sql_itinerarios_'+IntToStr(iCodCoorGT)+'.txt');
    qItinerarios.Open;

    qTotalItinerariosDiaL.ParamByName('CODIGOSEDEOPERATIVA').AsInteger := iSedeOperativa;
    qTotalItinerariosDiaL.ParamByName('CODIGODIAL').AsInteger := iCodigoDial;
    qTotalItinerariosDiaL.Open;

    qClientesDiaL.ParamByName('CODIGOSEDEOPERATIVA').AsInteger := iSedeOperativa;
    qClientesDiaL.ParamByName('CODIGODIAL').AsInteger := iCodigoDial;
    qClientesDiaL.Open;
  end;
end;

procedure TFListaExportacionRutas.qItinerariosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  pBarraItinierarios.Caption := 'Itinerarios ['+IntToStr(qItinerarios.RecordCount)+' items]';
end;

procedure TFListaExportacionRutas.qGruposAOLAfterOpen(DataSet: TDataSet);
begin
  inherited;
  pBarraGA.Caption := 'Grupos de Itinerarios ['+IntToStr(qGruposAOL.RecordCount)+' items]';
end;

procedure TFListaExportacionRutas.qGruposAOLCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qGruposAOL.FieldByName('DISPERSA').AsString = 'N' then
    qGruposAOLTipoGrupoAOL.AsString:= 'CONTIGUO'
  else if qGruposAOL.FieldByName('DISPERSA').AsString = 'S' then
    qGruposAOLTipoGrupoAOL.AsString:= 'DISPERSO'
  else
    qGruposAOLTipoGrupoAOL.AsString:= 'SIN DETERMINAR';
end;

procedure TFListaExportacionRutas.bbExpoGIsClick(Sender: TObject);
var
  qTra, qUpdESTADO_ITI, qInsert, qDelSGC_INFO, qVarios: TQuery;
  slTemp, slItiEje, slItiTer, slItiSinGT, slItiExpo, slItiDesc, slLibrosSinProm, slTemp2, slTemp3: TStringList;
  sAOLnoAprobados, sItiNoExportables, sql, sFechaOra, sTextoPregunta, sCodGI, sTabla, sTablasVacias: String;
  iConta, iContIti, iContItiTerminados, iRegsIns, iTotalRegs, iPerMax, iContaTelemedidos: integer;
  dLat, dLng, Max: Extended;
  sVersionArchivo, sTexto1, sTexto2,sFecha: string;
  iContEnRutaCruzados, iContCOMnoSIGCOM, iContEnRutaNoCOM, iContaCorte: integer;
begin
  inherited;
  qItinerarios.OnCalcFields := nil;
  FormShow(nil);
  iContItiTerminados:=0;
  iContIti:=0;
  iRegsIns:=0;
  sTablasVacias:='';
  iTotalRegs:=0;

  sTabla:= NOM_TBL_180;
  iTotalRegs := GetTotalRegsTablasCOM(sTabla, dtFechaLectura);
  if (iTotalRegs = 0) then
    sTablasVacias:= sTablasVacias+sTabla+Chr(13);

  sTabla:= NOM_TBL_190;
  iTotalRegs := GetTotalRegsTablasCOM(sTabla, dtFechaLectura);
  if (iTotalRegs = 0) then
    sTablasVacias:= sTablasVacias+sTabla+Chr(13);
  {
  sTabla:= 'FPLE200';
  iTotalRegs := GetTotalRegsTablasCOM(sTabla, dtFechaLectura);
  if (iTotalRegs = 0) then
    sTablasVacias:= sTablasVacias+sTabla+Chr(13);
  }
  sTabla:= 'FPCN010';
  iTotalRegs := GetTotalRegsTablasCOM(sTabla, dtFechaLectura);
  if (iTotalRegs = 0) then
    sTablasVacias:= sTablasVacias+sTabla+Chr(13);

  sTabla:= 'FPRE010';
  iTotalRegs := GetTotalRegsTablasCOM(sTabla, dtFechaLectura);
  if (iTotalRegs = 0) then
    sTablasVacias:= sTablasVacias+sTabla+Chr(13);

  sTexto1:='';
  sTexto2:='';
  if not HayInfoLECT_CORTE(dtFechaLectura) then
    sTexto2:= 'No existe información de LECTURA DE CORTE cargada para el dia '+DateToStr(dtFechaLectura)+'.';

  if ((sTablasVacias <> '') or (sTexto2 <> '')) then
  begin
    if (sTablasVacias <> '') then
      sTexto1:= 'No existe información comercial cargada para el dia '+DateToStr(dtFechaLectura)+' en :'+Chr(13)+Chr(13)+sTablasVacias+Chr(13);

    sTextoPregunta:= sTexto1+sTexto2+Chr(13)+Chr(13)+'Si continua con el proceso los clientes se exportarán sin ésta información. Esta seguro de continuar?';

    if Application.MessageBox(PChar(sTextoPregunta),'SigCom',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2) = ID_NO then
    begin
      qItinerarios.OnCalcFields := qItinerariosCalcFields;
      qGruposAOL.First;
      Exit;
    end;
  end;

  sTextoPregunta := 'La exportación puede tardar varios minutos, está seguro de continuar?';
  slTemp:= TStringList.Create;
  slItiEje:= TStringList.Create;
  slItiTer:= TStringList.Create;
  slItiSinGT:= TStringList.Create;
  slItiExpo:= TStringList.Create;
  slItiDesc:= TStringList.Create;

  qGruposAOL.DisableControls;
  qGruposAOL.First;
  while not qGruposAOL.Eof do
  begin
    if not (qGruposAOLCODIGOESTADOGRUPOITINERARIO.AsInteger = 2) then
       slTemp.Add(qGruposAOLCODIGOGRUPOITINERARIO.AsString);
    qGruposAOL.Next;
  end;
  qGruposAOL.First;
  qGruposAOL.EnableControls;

  //VALIDACION 1: Los GI deben estar en estado APROBADO.
  if slTemp.Count > 0 then
  begin
    sAOLnoAprobados:= slTemp.CommaText;
    slTemp.Clear;
    slTemp.Free;
    raise Exception.Create('No se puede exportar la información porque los siguientes Grupos '+
           'de Itinerarios aún no han sido Aprobados:'+Chr(13)+Chr(13)+sAOLnoAprobados);
  end;
  slTemp.Clear;
  slTemp.Free;

  qGruposAOL.First;
  qItinerarios.DisableControls;
  while not qGruposAOL.Eof do
  begin
    qItinerarios.First;
    while not qItinerarios.Eof do
    begin
      inc(iContIti);

      if qItinerariosCODIGOGRUPOTRABAJO.AsString = '' then
        slItiSinGT.Add(qItinerariosCODIGOITINERARIO.AsString);

      if (qItinerariosCODIGOESTADOITINERARIO.AsInteger = 3) then //EXPORTADO
        slItiExpo.Add(qItinerariosCODIGOITINERARIO.AsString);

      if (qItinerariosCODIGOESTADOITINERARIO.AsInteger = 4) then //DESCARGADO
        slItiDesc.Add(qItinerariosCODIGOITINERARIO.AsString);

      if (qItinerariosCODIGOESTADOITINERARIO.AsInteger = 5) then //EN EJECUCION
        slItiEje.Add(qItinerariosCODIGOITINERARIO.AsString);

      if (qItinerariosCODIGOESTADOITINERARIO.AsInteger = 6) then //TERMINADO
      begin
        inc(iContItiTerminados);
        slItiTer.Add(qItinerariosCODIGOITINERARIO.AsString);
      end;
      qItinerarios.Next;
    end;
    qGruposAOL.Next;
  end;
  qItinerarios.First;
  qItinerarios.EnableControls;

  if slItiSinGT.Count > 0 then
  begin
    sItiNoExportables:= slItiSinGT.CommaText;
    slItiSinGT.Clear;
    slItiSinGT.Free;
    raise Exception.Create('No se puede exportar la información porque los siguientes '+
           'Itinerarios no han sido asignados a un Lector:'+Chr(13)+Chr(13)+sItiNoExportables);
  end;
  slItiSinGT.Clear;
  slItiSinGT.Free;

  if slItiEje.Count > 0 then
  begin
    iPerMax:=GetPeriodoMaxExportadoGAOL(slItiEje);
    if iPerMax = iPeriodo then
    begin
      sItiNoExportables:= slItiEje.CommaText;
      slItiEje.Clear;
      slItiEje.Free;
      raise Exception.Create('No se puede exportar la información porque los siguientes '+
             'Itinerarios están en ejecución:'+Chr(13)+Chr(13)+sItiNoExportables);
    end;
  end;
  slItiEje.Clear;
  slItiEje.Free;

  if (slItiTer.Count > 0) and (iContIti <> iContItiTerminados) then
  begin
   iPerMax:=GetPeriodoMaxExportadoGAOL(slItiTer);
    if iPerMax = iPeriodo then
    begin
      sItiNoExportables:= slItiTer.CommaText;
      slItiTer.Clear;
      slItiTer.Free;
      raise Exception.Create('No se puede exportar la información porque los siguientes '+
             'Itinerarios están terminados:'+Chr(13)+Chr(13)+sItiNoExportables);
    end;
  end;
    
  //Si todos los Itinerarios tiene el estado TERMINADO y es el mismo Periodo de Lectura.
  if (slItiTer.Count > 0) and (iContIti = iContItiTerminados) then
  begin
    iPerMax:=GetPeriodoMaxExportadoGAOL(slItiTer);
    if iPerMax = iPeriodo then
    begin
      slItiTer.Clear;
      slItiTer.Free;
      raise Exception.Create('No se puede exportar la información porque los itinerarios'+
           ' ya han sido terminados para el periodo de lectura ['+IntToStr(iPeriodo)+'].');
    end;
  end;
  slItiTer.Clear;
  slItiTer.Free;

  if ((slItiExpo.Count > 0) and (iContIti = slItiExpo.Count)) then
  begin
    iPerMax:=GetPeriodoMaxExportadoGAOL(slItiExpo);
    if iPerMax = iPeriodo then
    begin
      sTextoPregunta:= 'Toda la información de los Itinerarios ya ha sido exportada. '+
                       'Si continua con el proceso se borrará y se exportará nuevamente.'+Chr(13)+Chr(13)+
                       'Esta seguro de continuar?';
    end;
  end;

  if ((slItiDesc.Count > 0) and (iContIti = slItiDesc.Count)) then
  begin
    iPerMax:=GetPeriodoMaxExportadoGAOL(slItiDesc);
    if iPerMax = iPeriodo then
    begin
      sTextoPregunta:= 'Toda la información de los Itinerarios ya ha sido descargada por los dispositivos móviles. '+
                       'Si continua con el proceso se borrará toda la información de los '+
                       'Itinerarios y se exportará nuevamente pero todos los dispositivos móviles conservarán la '+
                       'información anterior hasta sincronizar nuevamente.'+Chr(13)+Chr(13)+
                       'Esta seguro de continuar?';
    end;
  end;

  if ((slItiDesc.Count > 0) and (slItiDesc.Count < iContIti)) then
  begin
    iPerMax:=GetPeriodoMaxExportadoGAOL(slItiDesc);
    if iPerMax = iPeriodo  then
    begin
      sTextoPregunta:= 'La información de algunos Itinerarios ya ha sido descargada por los dispositivos móviles. '+
                       'Si continua con el proceso se borrará toda la información de todos los '+
                       'Itinerarios y se exportará nuevamente pero los dispositivos móviles que ya han descargado '+
                       'conservarán la información anterior hasta sincronizar nuevamente.'+Chr(13)+Chr(13)+
                       'Esta seguro de continuar?';
    end;
  end;

  slItiExpo.Clear;
  slItiExpo.Free;
  slItiDesc.Clear;
  slItiDesc.Free;

  if Application.MessageBox(PChar(sTextoPregunta),'SigCom',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2) = ID_YES then
  begin
    try
      slTemp2:= TStringList.Create;
      slTemp3:= TStringList.Create;
      sVersionArchivo := FileVersionGet('Administrativo.pgi');
      DeshabilitarControles(False);

      qTra:=TQuery.Create(nil);
      qTra.DatabaseName := 'BaseDato';
      qTra.SQL.Add('SELECT * FROM PARAMETRO');
      qTra.Open;
      qTra.Database.StartTransaction;

      qVarios:= TQuery.Create(nil);
      qVarios.DatabaseName := 'BaseDato';
      qInsert:= TQuery.Create(nil);
      qInsert.DatabaseName := 'BaseDato';

      qDelSGC_INFO:= TQuery.Create(nil);
      qDelSGC_INFO.DatabaseName := 'BaseDato';
      qDelSGC_INFO.SQL.Add('DELETE FROM '+NOMTABLAEXPO);
      qDelSGC_INFO.SQL.Add('WHERE CODIGOADMINISTRATIVO = :CIA');
      qDelSGC_INFO.SQL.Add('AND CODIGOGRUPOTRABAJO = :GT');
      qDelSGC_INFO.SQL.Add('AND CODIGODIAL = :DIAL');
      qDelSGC_INFO.SQL.Add('AND PERIODO = :PERIODO');
      qDelSGC_INFO.SQL.Add('AND CODIGOITINERARIO = :CODITI');

      qUpdESTADO_ITI:= TQuery.Create(nil);
      qUpdESTADO_ITI.DatabaseName := 'BaseDato';
      qUpdESTADO_ITI.SQL.Add('UPDATE SGC_ITINERARIO B SET B.CODIGOESTADOITINERARIO = 3');
      qUpdESTADO_ITI.SQL.Add('WHERE EXISTS (SELECT A.CODIGOITINERARIO FROM (');
      qUpdESTADO_ITI.SQL.Add(qItinerarios.SQL.Text);
      qUpdESTADO_ITI.SQL.Add(')A WHERE A.CODIGOITINERARIO = B.CODIGOITINERARIO)');

      qGruposAOL.First;
      fFormaEspere := TfFormaEspere.Create(Application);
      fFormaEspere.ProgressBar1.Max := qTotalItinerariosDiaLTOTALITINERARIOS.AsInteger;
      fFormaEspere.lbMotivo.Caption := 'Exportando Itinerarios...';
      fFormaEspere.Show;
      fFormaEspere.Refresh;

      iConta:= 0;
      while not qGruposAOL.Eof do
      begin
        qItinerarios.First;
        while not qItinerarios.Eof do
        begin
          iContEnRutaCruzados:=0;
          iContCOMnoSIGCOM:=0;
          iContEnRutaNoCOM :=0;
          sCodGI:= qItinerariosCODIGOITINERARIO.AsString;
          inc(iConta);

          fFormaEspere.lbMotivo.Caption := 'Exportando Itinerario: '+sCodGI;
          fFormaEspere.ProgressBar1.Position := iConta;
          fFormaEspere.Refresh;

          //BORRO EXPORTACION SI LA HAY
          qDelSGC_INFO.Close;
          qDelSGC_INFO.ParamByName('CIA').AsString:= qItinerariosCODIGOADMINISTRATIVO.AsString;
          qDelSGC_INFO.ParamByName('GT').AsString:= qItinerariosCODIGOGRUPOTRABAJO.AsString;
          qDelSGC_INFO.ParamByName('DIAL').AsString:= IntToStr(iCodigoDial);
          qDelSGC_INFO.ParamByName('PERIODO').AsString:= IntToStr(iPeriodo);
          qDelSGC_INFO.ParamByName('CODITI').AsString:= sCodGI;
          qDelSGC_INFO.ExecSQL;

          //INSERTO REGISTRO INICIAL PARA ALIMENTAR LA SUPERVISION ONLINE
          sFechaOra:= 'TO_DATE('+QuotedStr(DateToStr(dtFechaLectura))+',''DD/MM/YYYY'')';
          qVarios.Close;
          qVarios.SQL.Clear;
          qVarios.SQL.Add('SELECT * FROM SGC_TOTALESPORITINERARIO');
          qVarios.SQL.Add('WHERE CODIGOITINERARIO = '+sCodGI);
          qVarios.SQL.Add('AND FECHALECTURA = '+sFechaOra);
          qVarios.Open;
          if qVarios.IsEmpty then
          begin
            qVarios.Close;
            qVarios.SQL.Clear;
            qVarios.SQL.Add('INSERT INTO SGC_TOTALESPORITINERARIO (CODIGOITINERARIO, FECHALECTURA)');
            qVarios.SQL.Add('VALUES ('+sCodGI+','+sFechaOra+')');
            qVarios.ExecSQL;
          end;
          qVarios.Close;

          //Insertar info para la movil.
          qInsert.Close;
          qInsert.SQL.Clear;

          if qGruposAOL.FieldByName('DISPERSA').AsString ='S' then
          begin
            qInsert.SQL.Add(Trim(qInsertAltosConsumidores.SQL.Text));
            sql:='';
          sql := StringReplace(qInsert.SQL.Text,':CODIGOADMINISTRATIVO',qItinerariosCODIGOADMINISTRATIVO.AsString,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql, 'SGC_INFOITINERARIO', NOMTABLAEXPO, [rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':CODIGOGRUPOTRABAJO',qItinerariosCODIGOGRUPOTRABAJO.AsString,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':CODIGODIAL',IntToStr(iCodigoDial),[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':PERIODO',IntToStr(iPeriodo),[rfReplaceAll,rfIgnoreCase]);
          sFechaOra:= 'TO_DATE('+QuotedStr(DateToStr(dtFechaLectura))+',''DD/MM/YYYY'')';
          sql := StringReplace(sql,':FECHALECTURA',sFechaOra,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':VERSION_PGI',QuotedStr(sVersionArchivo),[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':CODIGOITINERARIO',sCodGI,[rfReplaceAll,rfIgnoreCase]);
           sql := StringReplace(sql,':CODIGOGRUPOITINERARIO',qGruposAOLCODIGOGRUPOITINERARIO.AsString,[rfReplaceAll,rfIgnoreCase]);
         
          end
          else
          begin
            qInsert.SQL.Add(Trim(InsertInto_qInsert_Info.SQL.Text));
            qInsert.SQL.Add(Trim(SelectPrincipal_qInsert_Info.SQL.Text));
            qInsert.SQL.Add(Trim(From_qInsert_Info.SQL.Text));
          sql:='';
          sql := StringReplace(qInsert.SQL.Text,':CODIGOADMINISTRATIVO',qItinerariosCODIGOADMINISTRATIVO.AsString,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql, 'SGC_INFOITINERARIO', NOMTABLAEXPO, [rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':CODIGOGRUPOTRABAJO',qItinerariosCODIGOGRUPOTRABAJO.AsString,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':CODIGODIAL',IntToStr(iCodigoDial),[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':PERIODO',IntToStr(iPeriodo),[rfReplaceAll,rfIgnoreCase]);
          sFechaOra:= 'TO_DATE('+QuotedStr(DateToStr(dtFechaLectura))+',''DD/MM/YYYY'')';
          sql := StringReplace(sql,':FECHALECTURA',sFechaOra,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':CODIGOGRUPOITINERARIO',qGruposAOLCODIGOGRUPOITINERARIO.AsString,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':CODIGOITINERARIO',sCodGI,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':VERSION_PGI',QuotedStr(sVersionArchivo),[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,'FPLE180',NOM_TBL_180+sEsquemaInterfaz,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,'FPLE190',NOM_TBL_190+sEsquemaInterfaz,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,'EEH_RUTACICLO',NOM_TBL_CAL+sEsquemaInterfaz,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':CADENA_EXP_REG',QuotedStr(CadenaExpReg),[rfReplaceAll,rfIgnoreCase]);
           end;
          qInsert.SQL.Text:=sql;
          qInsert.SQL.SaveToFile(GetTemporalPath+sCodGI+'_EnRutaCruzados.sql');
         qInsert.ExecSQL;
        iContEnRutaCruzados := qInsert.RowsAffected;
        iRegsIns:= iRegsIns + iContEnRutaCruzados;



          if qGruposAOL.FieldByName('DISPERSA').AsString ='S' then

          //  qInsert.SQL.Add(Trim(From_qInsert_Info_GC.SQL.Text)+')')
          else
          begin
            qInsert.Close;
          qInsert.SQL.Clear;
          qInsert.SQL.Add(Trim(Insert_EnRutaSinInfoComercial.SQL.Text));
          qInsert.SQL.Add(Trim(Select_EnRutaSinInfoComercial.SQL.Text));
          qInsert.SQL.Add(Trim(From_EnRutaSinInfoComercial.SQL.Text));
          qInsert.SQL.Add('AND C.CODIGOCLIENTESGD NOT IN (SELECT DISTINCT C.CODIGOCLIENTESGD');
            qInsert.SQL.Add(Trim(From_qInsert_Info.SQL.Text)+')');

          sql:='';
          sql := StringReplace(qInsert.SQL.Text,':CODIGOADMINISTRATIVO',qItinerariosCODIGOADMINISTRATIVO.AsString,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql, 'SGC_INFOITINERARIO', NOMTABLAEXPO, [rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':CODIGOGRUPOTRABAJO',qItinerariosCODIGOGRUPOTRABAJO.AsString,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':CODIGODIAL',IntToStr(iCodigoDial),[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':PERIODO',IntToStr(iPeriodo),[rfReplaceAll,rfIgnoreCase]);
          sFechaOra:= 'TO_DATE('+QuotedStr(DateToStr(dtFechaLectura))+',''DD/MM/YYYY'')';
          sql := StringReplace(sql,':FECHALECTURA',sFechaOra,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':CODIGOGRUPOITINERARIO',qGruposAOLCODIGOGRUPOITINERARIO.AsString,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':CODIGOITINERARIO',sCodGI,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':CODIGOGRUPOAOL',qGruposAOLCODIGOGRUPOAOL.AsString,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':CODIGORUTA',qGruposAOLCODIGORUTA.AsString,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,':VERSION_PGI',QuotedStr(sVersionArchivo),[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,'FPLE180',NOM_TBL_180+sEsquemaInterfaz,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,'FPLE190',NOM_TBL_190+sEsquemaInterfaz,[rfReplaceAll,rfIgnoreCase]);
          sql := StringReplace(sql,'EEH_RUTACICLO',NOM_TBL_CAL+sEsquemaInterfaz,[rfReplaceAll,rfIgnoreCase]);
          qInsert.SQL.Text:=sql;
          qInsert.SQL.SaveToFile(GetTemporalPath+sCodGI+'_EnRutaSinInfoComercial.sql');
          qInsert.ExecSQL;
          iContEnRutaNoCOM:=  qInsert.RowsAffected;
          iRegsIns:= iRegsIns + iContEnRutaNoCOM;
          end;
          ActualizarTotal(sCodGI,sFechaOra,'CLIENTES_SININFOCOM',IntToStr(iContEnRutaNoCOM));
          ActualizarTotal(sCodGI,sFechaOra,'CLIENTES_GEOREF',IntToStr(iContEnRutaNoCOM + iContEnRutaCruzados));
          ActualizarTotal(sCodGI,sFechaOra,'CLIENTES_NOGEOREF',IntToStr(iContCOMnoSIGCOM));
          ActualizarTotal(sCodGI,sFechaOra,'CLIENTES_CONINFOCOM',IntToStr(iContCOMnoSIGCOM + iContEnRutaCruzados));
          ActualizarTotal(sCodGI,sFechaOra,'CLIENTES_EXPORTADOS',IntToStr(iContEnRutaCruzados + iContEnRutaNoCOM + iContCOMnoSIGCOM));

          //ASIGNACION DE AOLPREDIO PARA LOS CLIENTES QUE NO LO TIENEN
          qVarios.Close;
          qVarios.SQL.Clear;
          qVarios.SQL.Add('SELECT MAX(AOLPREDIO) AS MAXIMO FROM '+NOMTABLAEXPO);
          qVarios.SQL.Add('WHERE CODIGOADMINISTRATIVO = :CIA');
          qVarios.SQL.Add('AND CODIGOGRUPOTRABAJO = :GT');
          qVarios.SQL.Add('AND CODIGODIAL = :DIAL');
          qVarios.SQL.Add('AND PERIODO = :PERIODO');
          qVarios.SQL.Add('AND CODIGOITINERARIO = :CODITI');
          qVarios.ParamByName('CIA').AsString:= qItinerariosCODIGOADMINISTRATIVO.AsString;
          qVarios.ParamByName('GT').AsString:= qItinerariosCODIGOGRUPOTRABAJO.AsString;
          qVarios.ParamByName('DIAL').AsString:= IntToStr(iCodigoDial);
          qVarios.ParamByName('PERIODO').AsString:= IntToStr(iPeriodo);
          qVarios.ParamByName('CODITI').AsString:= sCodGI;
          qVarios.Open;
          Max := qVarios.FieldBYName('MAXIMO').AsFloat;

          qVarios.Close;
          qVarios.SQL.Clear;
          qVarios.SQL.Add('UPDATE '+NOMTABLAEXPO+' SET AOLPREDIO = '+FloatToStr(Max)+'+ (ROWNUM*10)');
          qVarios.SQL.Add('WHERE CODIGOADMINISTRATIVO = :CIA');
          qVarios.SQL.Add('AND CODIGOGRUPOTRABAJO = :GT');
          qVarios.SQL.Add('AND CODIGODIAL = :DIAL');
          qVarios.SQL.Add('AND PERIODO = :PERIODO');
          qVarios.SQL.Add('AND CODIGOITINERARIO = :CODITI');
          qVarios.SQL.Add('AND AOLPREDIO IS NULL');
          qVarios.ParamByName('CIA').AsString:= qItinerariosCODIGOADMINISTRATIVO.AsString;
          qVarios.ParamByName('GT').AsString:= qItinerariosCODIGOGRUPOTRABAJO.AsString;
          qVarios.ParamByName('DIAL').AsString:= IntToStr(iCodigoDial);
          qVarios.ParamByName('PERIODO').AsString:= IntToStr(iPeriodo);
          qVarios.ParamByName('CODITI').AsString:= sCodGI;
          qVarios.ExecSQL;

          //ACTUALIZACION DE USUARIO Y FECHA DE EXPORTACION
          qVarios.Close;
          qVarios.SQL.Clear;
          qVarios.SQL.Add('UPDATE '+NOMTABLAEXPO+' SET USUARIOULTIMAEXPORTACION = '+IntToStr(VarCodigoUsuario));
          qVarios.SQL.Add(', FECHAULTIMAEXPORTACION = :FECHALECTURA ');
          qVarios.SQL.Add('WHERE CODIGOADMINISTRATIVO = :CIA');
          qVarios.SQL.Add('AND CODIGOGRUPOTRABAJO = :GT');
          qVarios.SQL.Add('AND CODIGODIAL = :DIAL');
          qVarios.SQL.Add('AND PERIODO = :PERIODO');
          qVarios.SQL.Add('AND CODIGOITINERARIO = :CODITI');
          qVarios.ParamByName('CIA').AsString:= qItinerariosCODIGOADMINISTRATIVO.AsString;
          qVarios.ParamByName('GT').AsString:= qItinerariosCODIGOGRUPOTRABAJO.AsString;
          qVarios.ParamByName('DIAL').AsString:= IntToStr(iCodigoDial);
          qVarios.ParamByName('PERIODO').AsString:= IntToStr(iPeriodo);
          qVarios.ParamByName('CODITI').AsString:= sCodGI;
          qVarios.ParamByName('FECHALECTURA').AsDateTime:= Now;
          qVarios.ExecSQL;
          qVarios.Close;

          qVarios.SQL.Clear;
          qVarios.SQL.Add('UPDATE '+NOMTABLAEXPO+' I');
          qVarios.SQL.Add('SET I.CORTE = ''SI'' ');
          qVarios.SQL.Add('WHERE EXISTS ');
          qVarios.SQL.Add('(');
          qVarios.SQL.Add('SELECT NULL');
          qVarios.SQL.Add('FROM SGC_CLIENTE_CORTE C');
          qVarios.SQL.Add('WHERE I.CLAVE = C.CLAVE');
          qVarios.SQL.Add('AND I.FECHALECTURA = C.FECHA_LECTURA_PROGRAMADA');
          qVarios.SQL.Add('AND I.CODIGOADMINISTRATIVO = :CIA');
          qVarios.SQL.Add('AND I.CODIGOGRUPOTRABAJO = :GT');
          qVarios.SQL.Add('AND I.CODIGODIAL = :DIAL');
          qVarios.SQL.Add('AND I.PERIODO = :PERIODO');
          qVarios.SQL.Add('AND I.CODIGOITINERARIO = :CODITI');
          qVarios.SQL.Add('AND I.FECHALECTURA = '+sFechaOra);
          qVarios.SQL.Add(')');
          qVarios.ParamByName('CIA').AsString:= qItinerariosCODIGOADMINISTRATIVO.AsString;
          qVarios.ParamByName('GT').AsString:= qItinerariosCODIGOGRUPOTRABAJO.AsString;
          qVarios.ParamByName('DIAL').AsString:= IntToStr(iCodigoDial);
          qVarios.ParamByName('PERIODO').AsString:= IntToStr(iPeriodo);
          qVarios.ParamByName('CODITI').AsString:= sCodGI;
          qVarios.ExecSQL;
          iContaCorte:= qVarios.RowsAffected;
          slTemp3.Add(sCodGI+' : '+IntToStr(iContaCorte));
          slTemp3.SaveToFile(GetTemporalPath+'ClientesCortePorItinerario.txt');
          qVarios.Close;

          /// Selecciona aleatoria para auditoria
         sFecha := FormatDateTime('YYYYMMDD',dtFechaLectura);
      spMarcarAuditables.close;
      spMarcarAuditables.ParamByName('FECHALECTURA_VAR').AsString := sFecha;
      spMarcarAuditables.ParamByName('CODIGOITINERARIO_VAR').AsString :=sCodGI;
      spMarcarAuditables.ParamByName('REGISTROS').AsString := ParametroAuditable;
      spMarcarAuditables.Prepare;
      spMarcarAuditables.ExecProc;

          qItinerarios.Next;
        end;

        // Cambiar estado de los Itinerarios a EXPORTADO.
        qUpdESTADO_ITI.Close;
        qUpdESTADO_ITI.ParamByName('CODIGOGRUPOAOL').AsString := qGruposAOLCODIGOGRUPOAOL.AsString;
        qUpdESTADO_ITI.ParamByName('CODIGORUTA').AsString := qGruposAOLCODIGORUTA.AsString;
        qUpdESTADO_ITI.ParamByName('CODIGOGRUPOITINERARIO').AsString := qGruposAOLCODIGOGRUPOITINERARIO.AsString;
        qUpdESTADO_ITI.ExecSQL;
        qGruposAOL.Next;
      end;

      //LLENADO DE ACTIVA, REACTIVA Y DEMANDA SI ES UN TELEMEDIDO
      qVarios.Close;
      qVarios.SQL.Clear;
      sql:='';
      sql := StringReplace(qTelemedidos.SQL.Text, 'SGC_INFOITINERARIO', NOMTABLAEXPO, [rfReplaceAll,rfIgnoreCase]);
      sFechaOra:= 'TO_DATE('+QuotedStr(DateToStr(dtFechaLectura))+',''DD/MM/YYYY'')';
      sql := StringReplace(sql,':FECHALECTURA',sFechaOra,[rfReplaceAll,rfIgnoreCase]);
      qVarios.SQL.Text:=sql;
      qVarios.SQL.SaveToFile(GetTemporalPath+'UPDATE_TELEMEDIDOS.sql');
      qVarios.ExecSQL;
      iContaTelemedidos:= qVarios.RowsAffected;
      slTemp2.Add('Telemedidos Actualizados: '+IntToStr(iContaTelemedidos));
      slTemp2.SaveToFile(GetTemporalPath+'TELEMEDIDOSTOTALES.txt');

      fFormaEspere.Free;
      fFormaEspere:= nil;
      qUpdESTADO_ITI.Close;
      qUpdESTADO_ITI.Free;
      qUpdESTADO_ITI:= nil;
      qInsert.Close;
      qInsert.Free;
      qInsert:=nil;
      qVarios.Close;
      qVarios.Free;
      qVarios:=nil;
      qDelSGC_INFO.Close;
      qDelSGC_INFO.Free;
      qDelSGC_INFO:=nil;
      qGruposAOL.First;
      slTemp2.Free;
      slTemp2:= nil;
      slTemp3.Free;
      slTemp3:= nil;

     qTra.Database.Commit;
     // qTra.Database.Rollback;
      qTra.Close;
      qTra.Free;
      Application.MessageBox(PChar('Proceso terminado exitosamente. Se exportaron '+IntToStr(iRegsIns)+' Clientes.'),'SigCom',MB_ICONINFORMATION);
      DeshabilitarControles(True);
    except
      on e:Exception do
      begin
        qTra.Database.Rollback;
        qTra.Close;
        qTra.Free;
        DeshabilitarControles(True);

        if assigned(fFormaEspere) then
        begin
          fFormaEspere.Free;
          fFormaEspere:= nil;
        end;
        if assigned(qUpdESTADO_ITI) then
        begin
          qUpdESTADO_ITI.Free;
          qUpdESTADO_ITI:= nil;
        end;
        if assigned(qInsert) then
        begin
          qInsert.Free;
          qInsert:= nil;
        end;
        if assigned(qDelSGC_INFO) then
        begin
          qDelSGC_INFO.Free;
          qDelSGC_INFO:= nil;
        end;
        if assigned(qVarios) then
        begin
          qVarios.Free;
          qVarios:= nil;
        end;

        if assigned(slTemp2) then
        begin
          slTemp2.Free;
          slTemp2:= nil;
        end;

        if assigned(slTemp3) then
        begin
          slTemp3.Free;
          slTemp3:= nil;
        end;

        Application.MessageBox(pchar('Ocurrió un error en la exportación de la información del Itinerario ['+sCodGI+'] :'+Chr(13)+Chr(13)+
                                              e.Message+Chr(13)+Chr(13)+'Contacte a soporte.'),'Error',MB_ICONERROR);
      end;
    end;
  end;
  qItinerarios.OnCalcFields := qItinerariosCalcFields;
  qGruposAOL.First;
end;

procedure TFListaExportacionRutas.bbCambiarGTaItiClick(Sender: TObject);
begin
  inherited;

  if qItinerariosCODIGOESTADOITINERARIO.AsInteger = 6 then
    raise Exception.Create('El Itinerario seleccionado no puede ser asignado nuevamente porque esta TERMINADO.');

  fOpcionExpoItinerario:= TfOpcionExpoItinerario.Create(Application);
  with fOpcionExpoItinerario do
  begin
    Periodo := iPeriodo;
    CodigoDial := iCodigoDial;
    CodigoGrupoIti := qItinerariosCODIGOGRUPOITINERARIO.AsInteger;
    CodigoItinerario := qItinerariosCODIGOITINERARIO.AsInteger;
    FechaLectura := DateToStr(dtFechaLectura);

    qGrupoTrabajo.Close;
    if (VarCodigoUsuario <> 0) then
    begin
      qGrupoTrabajo.Filter := 'CODIGOUSUARIO = '+IntToStr(VarCodigoUsuario);
      qGrupoTrabajo.Filtered:=True;
    end;

    qGrupoTrabajo.ParamByName('CIA').AsString:= qItinerariosCODIGOADMINISTRATIVO.AsString;
    qGrupoTrabajo.ParamByName('GT').AsString:= qItinerariosCODIGOGRUPOTRABAJO.AsString;
    qGrupoTrabajo.Open;
    dblcbGT.KeyValue := dblcbGT.ListSource.DataSet.FieldByName(dblcbGT.KeyField).Value;
    if fOpcionExpoItinerario.ShowModal = mrOK then
      FListaExportacionRutas.FormShow(nil);

    fOpcionExpoItinerario.Free;
    fOpcionExpoItinerario:= nil;
  end;
end;

procedure TFListaExportacionRutas.sbVerGIenCartoClick(Sender: TObject);
begin
  inherited;
  MostrarGrupoItinerario(qGruposAOLCODIGOGRUPOAOL.AsString, qGruposAOLCODIGORUTA.AsString, qGruposAOLCODIGOGRUPOITINERARIO.AsString);
end;

procedure TFListaExportacionRutas.RxDBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  ColorCelda: TColor;
begin
  inherited;
  if Column.FieldName = 'COLOR' Then
  begin
    ColorCelda := qItinerariosCOLOR.AsInteger;
    RxDBGrid2.Canvas.Brush.Color:=ColorCelda;
    RxDBGrid2.Canvas.Rectangle(rect.left,rect.top,rect.right,rect.bottom);
  end;
end;

procedure TFListaExportacionRutas.sbRefrescarClick(Sender: TObject);
begin
  inherited;
  FormShow(nil);
end;

procedure TFListaExportacionRutas.sbVerItiEnCartoClick(Sender: TObject);
begin
  inherited;
  MostrarItinerario(qGruposAOLCODIGOGRUPOAOL.AsString,
    qGruposAOLCODIGORUTA.AsString,
    qItinerariosCODIGOITINERARIO.AsString,
    qGruposAOLCODIGOGRUPOITINERARIO.AsString,
    qItinerariosCOLOR.AsString);
end;

function TFListaExportacionRutas.GetTotalRegsTablasCOM(sTabla: string; dtFechaLectura: TDateTime):Integer;
var
  qTotalRegs: TQuery;
begin
  result:=0;
  qTotalRegs:=TQuery.Create(nil);
  qTotalRegs.DatabaseName := 'BaseDato';
  qTotalRegs.SQL.Add('SELECT COUNT(*) AS TOTALREGISTROS FROM '+sTabla+sEsquemaInterfaz);
  qTotalRegs.SQL.Add('WHERE FECHA_LECTURA_PROGRAMADA = :FECHALECTURA');
  qTotalRegs.ParamByName('FECHALECTURA').AsDate := dtFechaLectura;
  qTotalRegs.Open;
  result := qTotalRegs.FieldByName('TOTALREGISTROS').AsInteger;
  qTotalRegs.Close;
  qTotalRegs.Free;
end;

procedure TFListaExportacionRutas.InicializarFilasFA;
begin
  FilaDir:= FilaIniDir;
  FilaAOLPredio:= FilaIniAOLPredio;
  FilaSistema:= FilaIniSistema;
  FilaRuta:= FilaIniRuta;
  FilaAcometida:= FilaIniAcometida;
  FilaFila:= FilaIniFila;
  FilaColumna:= FilaIniColumna;
  FilaNumContador:= FilaIniNumContador;
  FilaMarca:= FilaIniMarca;
  FilaOrden:= FilaIniOrden;
  FilaTipoMedida := FilaIniTipoMedida;
end;

procedure TFListaExportacionRutas.InicializarFilasFC;
begin
  FilaCodImpreso:= FilaIniCodImpreso;
  FilaNomAnomalia:= FilaIniNomAnomalia;
  FilaDesClase:= FilaIniDesClase;
end;

procedure TFListaExportacionRutas.InicializarColumnasFC;
begin
  ColCodImpreso := ColIniCodImpreso;
  ColNomAnomalia:= ColIniNomAnomalia;
  ColDesClase:= ColIniDesClase;
end;

procedure TFListaExportacionRutas.InicializarColumnasFA;
begin
  ColDir:= ColIniDir;
  ColAOLPredio:= ColIniAOLPredio;
  ColSistema:= ColIniSistema;
  ColRuta:= ColIniRuta;
  ColAcometida:= ColIniAcometida;
  ColFila:= ColIniFila;
  ColColumna:= ColIniColumna;
  ColNumContador:= ColIniNumContador;
  ColMarca:= ColIniMarca;
  ColOrden:= ColIniOrden;
  ColTipoMedida := ColIniTipoMedida;
end;

procedure TFListaExportacionRutas.miExcelYMapasClick(Sender: TObject);
var
  qTemp, qTotalRegs, qInsert, qTra, qDel, qAnomalias : TQuery;
  Excel_A, Excel_B, Excel_C, Excel_D, Excel_E : OleVariant;
  sRutaLocal, sRutaLocalFA, sRutaGeneradoFA, sRutaLocalFB, sRutaGeneradoFB: string;
  sRutaLocalFC, sRutaGeneradoFC, sRutaLocalFD, sRutaGeneradoFD, sDirSel : string;
  sRutaLocalFE, sRutaGeneradoFE : string;
  sql, sFechaOra, sCodIti, sTextoQR, sNomQR, sTextoPregunta: string;
  sCLAVE, sDIRECCIONSUSCRIPTOR, sAOLPREDIO, sSISTEMA, sRUTA, sACOMETIDA: string;
  sFILA, sCOLUMNA, sNUMEROCONTADOR, sNOMBREMARCAMEDIDOR, sORDEN, sCODIGOCLIENTESGD: string;
  sCODIGOIMPRESION, sNOMANOMALIA, sDESCLASE, sHOJA : string;
  i, j, iNumPaginas, iContaClientesSec, iContaPagina, iContaClientesPag: integer;
  iTotalClientes, iContaRegsExist, iCODIGOTIPOMEDIDA, iContaRD, iTotalRD: integer;
  iContaItemSec, iNumHojasExcelFB, iNumHojasExcelFE, attrs : integer;
  iContaSerialesSec, iContaSerialesPag, iContaPaginaFE : integer;
  dFechayHoraImpresion : TDatetime;
  bm: TBitmap;
  iAnno, iMes, iDia: Word;
  slContaRD: TStringList;
begin
  inherited;

  sCodIti:= qItinerarios.FieldByName('CODIGOITINERARIO').AsString;

  if qItinerarios.FieldByName('IMPRIMIRPLANILLA').AsString = 'N' then
    raise Exception.Create('El itinerario ['+sCodIti+'] no esta marcado como imprimible.');

  if not qItinerariosCODIGOESTADOITINERARIO.AsInteger in [3,4] then //EXPORTADO
    raise Exception.Create('El itinerario ['+sCodIti+'] debe estar exportado para ser impreso.');
  
  sRutaLocal := ExtractFilePath(ParamStr(0));
  if sRutaLocal[Length(sRutaLocalFA)] <> '\' then
    sRutaLocal := sRutaLocal + '\';

  sRutaLocalFA:=sRutaLocal+'Plantillas\'+NomFormatoA;
  if not FileExists(sRutaLocalFA) then
    raise Exception.Create('El archivo ['+NomFormatoA+'] no existe en el directorio de plantillas del producto.');

  sRutaLocalFB:=sRutaLocal+'Plantillas\'+NomFormatoB;
  if not FileExists(sRutaLocalFB) then
    raise Exception.Create('El archivo ['+NomFormatoB+'] no existe en el directorio de plantillas del producto.');

  sRutaLocalFC:=sRutaLocal+'Plantillas\'+NomFormatoC;
  if not FileExists(sRutaLocalFC) then
    raise Exception.Create('El archivo ['+NomFormatoC+'] no existe en el directorio de plantillas del producto.');

  sRutaLocalFD:= sRutaLocal+'Plantillas\'+NomFormatoD;
  if not FileExists(sRutaLocalFD) then
    raise Exception.Create('El archivo ['+NomFormatoD+'] no existe en el directorio de plantillas del producto.');

  sRutaLocalFE:= sRutaLocal+'Plantillas\'+NomFormatoE;
  if not FileExists(sRutaLocalFE) then
    raise Exception.Create('El archivo ['+NomFormatoE+'] no existe en el directorio de plantillas del producto.');
  {
  sTextoPregunta:='Una vez se hayan generado los formatos del itinerario ['+sCodIti+'] no se podrá '+
                  'desmarcar como imprimible para el periodo de lectura actual.'+
                  chr(13)+chr(13)+'Esta seguro de continuar?' ;
  if Application.MessageBox(PChar(sTextoPregunta),'SigCom',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2) = ID_NO then
    Exit;}

  iContaRegsExist:=0;
  qTemp:=TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';
  qTemp.SQL.Add('SELECT COUNT(*) AS REGISTROS');
  qTemp.SQL.Add('FROM SGC_IMPRESIONITINERARIO');
  qTemp.SQL.Add('WHERE CODIGOADMINISTRATIVO = :CIA');
  qTemp.SQL.Add('AND CODIGOGRUPOTRABAJO = :GT');
  qTemp.SQL.Add('AND CODIGODIAL= :DIAL');
  qTemp.SQL.Add('AND PERIODO = :PERIODO');
  qTemp.SQL.Add('AND CODIGOITINERARIO = :CODITI');
  qTemp.SQL.Add('AND FECHALECTURA = :FECHALECTURA');
  qTemp.ParamByName('CIA').AsString := qItinerariosCODIGOADMINISTRATIVO.AsString;
  qTemp.ParamByName('GT').AsString := qItinerariosCODIGOGRUPOTRABAJO.AsString;
  qTemp.ParamByName('DIAL').AsInteger := iCodigoDial;
  qTemp.ParamByName('PERIODO').AsInteger := iPeriodo;
  qTemp.ParamByName('CODITI').AsString := sCodIti;
  qTemp.ParamByName('FECHALECTURA').AsDate := dtFechaLectura;
  qTemp.Open;
  iContaRegsExist:= qTemp.FieldByName('REGISTROS').AsInteger;
  qTemp.Close;
  qTemp.Free;

  if (iContaRegsExist > 0) then
    if Application.MessageBox(PChar('El itinerario ['+sCodIti+'] ya ha sido impreso. Desea imprimirlo nuevamente?'),'SigCom',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = ID_NO then
      Exit;

  sDirSel := GetTemporalPath;
  if SelectDirectory('Seleccione el directorio donde se generán los archivos a imprimir:', PChar(sRutaLocal), sDirSel) then
  begin
    DecodeDate(dtFechaLectura, iAnno, iMes, iDia);
    sRutaGeneradoFA:= sDirSel+'\'+'FORMATO_A_'+sCodIti+'_'+Format('%.*d',[2, iDia])+Format('%.*d',[2, iMes])+IntToStr(iAnno)+ '.xlsx';
    sRutaGeneradoFB:= ExtractFilePath(sRutaGeneradoFA)+NomFormatoB;
    sRutaGeneradoFC:= ExtractFilePath(sRutaGeneradoFA)+NomFormatoC;
    sRutaGeneradoFD:= ExtractFilePath(sRutaGeneradoFA)+NomFormatoD;
    sRutaGeneradoFE:= sDirSel+'\'+'FORMATO_E_'+sCodIti+'_'+Format('%.*d',[2, iDia])+Format('%.*d',[2, iMes])+IntToStr(iAnno)+ '.xlsx';

    qTemp:=TQuery.Create(nil);
    qTemp.DatabaseName := 'BaseDato';
    qTemp.SQL.Clear;
    qTemp.SQL.Text := Trim(qImprimirItinerario.SQL.Text);

    sql:='';
    sql := StringReplace(qTemp.SQL.Text,':CODIGOADMINISTRATIVO',qItinerariosCODIGOADMINISTRATIVO.AsString,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':CODIGOGRUPOTRABAJO',qItinerariosCODIGOGRUPOTRABAJO.AsString,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':CODIGOITINERARIO',sCodIti,[rfReplaceAll,rfIgnoreCase]);
    sFechaOra:= QuotedStr(DateToStr(dtFechaLectura));
    sql := StringReplace(sql,':FECHALECTURA',sFechaOra,[rfReplaceAll,rfIgnoreCase]);
    qTemp.SQL.Text:=sql;
    //qTemp.SQL.SaveToFile(GetTemporalPath+sCodIti+'_Impresion.sql');
    qTemp.Open;

    if not qTemp.IsEmpty then
    begin
      if CopyFile(PChar(sRutaLocalFA), PChar(sRutaGeneradoFA), True) and
         CopyFile(PChar(sRutaLocalFB), PChar(sRutaGeneradoFB), True) and
         CopyFile(PChar(sRutaLocalFC), PChar(sRutaGeneradoFC), True) and
         CopyFile(PChar(sRutaLocalFD), PChar(sRutaGeneradoFD), True) and
         CopyFile(PChar(sRutaLocalFE), PChar(sRutaGeneradoFE), True) then
      begin
        try
          DeshabilitarControles(False);

          attrs := FileGetAttr(sRutaGeneradoFA);
          if attrs and SysUtils.faReadOnly > 0 then
            FileSetAttr(sRutaGeneradoFA, attrs and not SysUtils.faReadOnly);

          attrs := FileGetAttr(sRutaGeneradoFB);
          if attrs and SysUtils.faReadOnly > 0 then
            FileSetAttr(sRutaGeneradoFB, attrs and not SysUtils.faReadOnly);

          attrs := FileGetAttr(sRutaGeneradoFC);
          if attrs and SysUtils.faReadOnly > 0 then
            FileSetAttr(sRutaGeneradoFC, attrs and not SysUtils.faReadOnly);

          attrs := FileGetAttr(sRutaGeneradoFD);
          if attrs and SysUtils.faReadOnly > 0 then
            FileSetAttr(sRutaGeneradoFD, attrs and not SysUtils.faReadOnly);

          attrs := FileGetAttr(sRutaGeneradoFE);
          if attrs and SysUtils.faReadOnly > 0 then
            FileSetAttr(sRutaGeneradoFE, attrs and not SysUtils.faReadOnly);

          qTotalRegs:=TQuery.Create(nil);
          qTotalRegs.DatabaseName := 'BaseDato';
          qTotalRegs.SQL.Add('SELECT COUNT(*) AS TOTALREGISTROS FROM ('+qTemp.SQL.Text+')');
          qTotalRegs.Open;
          iTotalClientes := qTotalRegs.Fields[0].AsInteger;
          iNumPaginas:= ceil(iTotalClientes/NumClientesPorPagFA);
          qTotalRegs.Close;
          qTotalRegs.Free;

          dFechayHoraImpresion := Now;
          //***************
          //FORMATO A
          //***************
          Excel_A := CreateOLEObject('Excel.Application');
          Excel_A.WorkBooks.Open(sRutaGeneradoFA);

          fFormaEspere := TfFormaEspere.Create(Application);
          fFormaEspere.ProgressBar1.Max := iNumPaginas;
          fFormaEspere.lbMotivo.Caption := 'Generando FORMATO A... (1/4)';
          fFormaEspere.Show;
          fFormaEspere.Refresh;

          for i := 1 to iNumPaginas-1 do
          begin
            fFormaEspere.ProgressBar1.Position := i;
            fFormaEspere.Refresh;
            Excel_A.Sheets[1].Select;
            Excel_A.Sheets[1].Copy(EmptyParam, Excel_A.Sheets[1]);
          end;

          fFormaEspere.lbMotivo.Caption := 'Generando FORMATO A... (2/4)';
          fFormaEspere.ProgressBar1.Position := 0;

          for i:=1 to Excel_A.WorkSheets.Count do
          begin
            fFormaEspere.ProgressBar1.Position := i;
            fFormaEspere.Refresh;

            Excel_A.Sheets[i].Name := 'Hoja'+IntToStr(i);
            Excel_A.Sheets[i].Cells.Item[3,17].Value := DateToStr(dFechayHoraImpresion); //FECHA IMPRESION
            Excel_A.Sheets[i].Cells.Item[1,9].Value := IntToStr(iTotalClientes); //CANTIDAD TOTAL DE CLIENTES
            Excel_A.Sheets[i].Cells.Item[1,17].Value := IntToStr(i); //NUMERO PAGINA
            Excel_A.Sheets[i].Cells.Item[1,22].Value := IntToStr(iNumPaginas); //TOTAL PAGINAS
            Excel_A.Sheets[i].Cells.Item[3,22].Value := sCodIti; //ITINERARIO
          end;

          iContaClientesSec:=0;
          iContaClientesPag:=0;
          iContaPagina:=1;
          InicializarFilasFA;
          InicializarColumnasFA;

          fFormaEspere.ProgressBar1.Max := iTotalClientes;
          fFormaEspere.lbMotivo.Caption := 'Generando FORMATO A... (3/4)';
          fFormaEspere.Refresh;
          j:=0;

          qTra:=TQuery.Create(nil);
          qTra.DatabaseName := 'BaseDato';
          qTra.SQL.Add('SELECT * FROM PARAMETRO');
          qTra.Open;
          qTra.Database.StartTransaction;

          qDel:=TQuery.Create(nil);
          qDel.DatabaseName := 'BaseDato';
          qDel.SQL.Add('DELETE FROM SGC_IMPRESIONITINERARIO');
          qDel.SQL.Add('WHERE CODIGOADMINISTRATIVO = :CIA');
          qDel.SQL.Add('AND CODIGOGRUPOTRABAJO = :GT');
          qDel.SQL.Add('AND CODIGODIAL= :DIAL');
          qDel.SQL.Add('AND PERIODO = :PERIODO');
          qDel.SQL.Add('AND CODIGOITINERARIO = :CODITI');
          qDel.SQL.Add('AND FECHALECTURA = :FECHALECTURA');
          qDel.ParamByName('CIA').AsString := qItinerariosCODIGOADMINISTRATIVO.AsString;
          qDel.ParamByName('GT').AsString := qItinerariosCODIGOGRUPOTRABAJO.AsString;
          qDel.ParamByName('DIAL').AsInteger := iCodigoDial;
          qDel.ParamByName('PERIODO').AsInteger := iPeriodo;
          qDel.ParamByName('CODITI').AsString := sCodIti;
          qDel.ParamByName('FECHALECTURA').AsDate := dtFechaLectura;
          qDel.ExecSQL;

          qInsert:=TQuery.Create(nil);
          qInsert.DatabaseName := 'BaseDato';
          slContaRD:= TStringList.Create;
          slContaRD.Sorted := True;
          iContaRD:=0;

          while not qTemp.Eof do
          begin
            inc(j);
            fFormaEspere.ProgressBar1.Position := j;
            fFormaEspere.Refresh;
            sCLAVE:= qTemp.Fields[0].AsString;
            sDIRECCIONSUSCRIPTOR:= qTemp.Fields[1].AsString;
            sAOLPREDIO:= qTemp.Fields[2].AsString;
            sSISTEMA:= qTemp.Fields[3].AsString;
            sRUTA:= qTemp.Fields[4].AsString;
            sACOMETIDA:= qTemp.Fields[5].AsString;
            sFILA:= qTemp.Fields[6].AsString;
            sCOLUMNA:= qTemp.Fields[7].AsString;
            sNUMEROCONTADOR:= qTemp.Fields[8].AsString;
            sNOMBREMARCAMEDIDOR:= qTemp.Fields[9].AsString;
            sORDEN:= qTemp.Fields[10].AsString;
            iCODIGOTIPOMEDIDA := qTemp.Fields[11].AsInteger;
            sCODIGOCLIENTESGD := qTemp.Fields[12].AsString;
            inc(iContaClientesSec);
            inc(iContaClientesPag);
            Excel_A.Sheets[iContaPagina].Cells.Item[FilaDir, ColDir].Value :=sDIRECCIONSUSCRIPTOR;
            Excel_A.Sheets[iContaPagina].Cells.Item[FilaAOLPredio, ColAOLPredio].Value :=sAOLPREDIO;
            Excel_A.Sheets[iContaPagina].Cells.Item[FilaSistema, ColSistema].Value :=sSISTEMA;
            Excel_A.Sheets[iContaPagina].Cells.Item[FilaRuta, ColRuta].Value :=sRUTA;
            Excel_A.Sheets[iContaPagina].Cells.Item[FilaAcometida, ColAcometida].Value :=sACOMETIDA;
            Excel_A.Sheets[iContaPagina].Cells.Item[FilaFila, ColFila].Value :=sFILA;
            Excel_A.Sheets[iContaPagina].Cells.Item[FilaColumna, ColColumna].Value :=sCOLUMNA;
            Excel_A.Sheets[iContaPagina].Cells.Item[FilaNumContador, ColNumContador].Value :=sNUMEROCONTADOR;
            Excel_A.Sheets[iContaPagina].Cells.Item[FilaMarca, ColMarca].Value :=sNOMBREMARCAMEDIDOR;
            Excel_A.Sheets[iContaPagina].Cells.Item[FilaOrden, ColOrden].Value :=sORDEN;
            if iCODIGOTIPOMEDIDA in [1,2] then
            begin
              inc(iContaRD);
              Excel_A.Sheets[iContaPagina].Cells.Item[FilaTipoMedida, ColTipoMedida].Interior.ColorIndex := 01;
            end;
            if iContaClientesSec < (NumClientesPorPagFA/2) then
            begin
              FilaDir:= FilaDir + NumCeldasAbajo;
              FilaAOLPredio:=FilaAOLPredio + NumCeldasAbajo;
              FilaSistema:=FilaSistema + NumCeldasAbajo;
              FilaRuta:= FilaRuta + NumCeldasAbajo;
              FilaAcometida:=FilaAcometida + NumCeldasAbajo;
              FilaFila:=FilaFila + NumCeldasAbajo;
              FilaColumna:=FilaColumna + NumCeldasAbajo;
              FilaNumContador:= FilaNumContador + NumCeldasAbajo;
              FilaMarca:=FilaMarca + NumCeldasAbajo;
              FilaOrden:= FilaOrden + NumCeldasAbajo;
              FilaTipoMedida := FilaTipoMedida + NumCeldasAbajo;
            end
            else if iContaClientesSec >= (NumClientesPorPagFA/2) then
            begin
              iContaClientesSec:= 0;
              ColDir := ColDir + NumCeldasDerecha;
              ColAOLPredio:= ColAOLPredio + NumCeldasDerecha;
              ColSistema:= ColSistema + NumCeldasDerecha;
              ColRuta:= ColRuta + NumCeldasDerecha;
              ColAcometida:= ColAcometida + NumCeldasDerecha;
              ColFila:= ColFila + NumCeldasDerecha;
              ColColumna:= ColColumna + NumCeldasDerecha;
              ColNumContador := ColNumContador + NumCeldasDerecha;
              ColMarca:= ColMarca + NumCeldasDerecha;
              ColOrden:= ColOrden + NumCeldasDerecha;
              ColTipoMedida := ColTipoMedida + NumCeldasDerecha;
              InicializarFilasFA;
            end;
            qInsert.Close;
            qInsert.SQL.Clear;
            qInsert.SQL.Add('INSERT INTO SGC_IMPRESIONITINERARIO (CODIGOADMINISTRATIVO,');
            qInsert.SQL.Add('CODIGOGRUPOTRABAJO,');
            qInsert.SQL.Add('CODIGODIAL,');
            qInsert.SQL.Add('PERIODO,');
            qInsert.SQL.Add('CODIGOITINERARIO,');
            qInsert.SQL.Add('FECHALECTURA,');
            qInsert.SQL.Add('CLAVE,');
            qInsert.SQL.Add('CODIGOCLIENTESGD,');
            qInsert.SQL.Add('NUMEROPAGINA,');
            qInsert.SQL.Add('POSICIONENPAGINA,');
            qInsert.SQL.Add('CANTIDADDEHOJASIMPRESAS,');
            qInsert.SQL.Add('USUARIOULTIMAIMPRESION,');
            qInsert.SQL.Add('FECHAULTIMAIMPRESION)');
            qInsert.SQL.Add('VALUES ('+qItinerariosCODIGOADMINISTRATIVO.AsString+',');
            qInsert.SQL.Add(qItinerariosCODIGOGRUPOTRABAJO.AsString+',');
            qInsert.SQL.Add(IntToStr(iCodigoDial)+',');
            qInsert.SQL.Add(IntToStr(iPeriodo)+',');
            qInsert.SQL.Add(sCodIti+',');
            qInsert.SQL.Add('TO_DATE('+QuotedStr(DateToStr(dtFechaLectura))+',''DD/MM/YYYY''),');
            qInsert.SQL.Add(sCLAVE+',');
            qInsert.SQL.Add(sCODIGOCLIENTESGD+',');
            qInsert.SQL.Add(IntToStr(iContaPagina)+',');
            qInsert.SQL.Add(IntToStr(iContaClientesPag)+',');
            qInsert.SQL.Add(IntToStr(iNumPaginas)+',');
            qInsert.SQL.Add(IntToStr(VarCodigoUsuario)+',');
            qInsert.SQL.Add('SYSDATE)');
            qInsert.ExecSQL;
            if iContaClientesPag = NumClientesPorPagFA then
            begin
              slContaRD.Add(IntToStr(iContaPagina)+'='+IntToStr(iContaRD));
              inc(iContaPagina);
              iContaClientesPag:= 0;
              iContaClientesSec:= 0;
              iContaRD:= 0;
              InicializarFilasFA;
              InicializarColumnasFA;
            end;

            if iContaPagina = iNumPaginas then
              slContaRD.Add(IntToStr(iContaPagina)+'='+IntToStr(iContaRD));
            qTemp.Next;
          end;

          iTotalRD:=0;
          fFormaEspere.ProgressBar1.Max := iNumPaginas;
          fFormaEspere.lbMotivo.Caption := 'Generando FORMATO A... (4/4)';
          fFormaEspere.ProgressBar1.Position := 0;
          for i:=1 to Excel_A.WorkSheets.Count do
          begin
            iTotalRD:= iTotalRD + StrToInt(slContaRD.Values[IntToStr(i)]);
            fFormaEspere.ProgressBar1.Position := i;
            fFormaEspere.Refresh;
            sTextoQR:= 'A '+IntToStr(i)+' de '+IntToStr(iNumPaginas)+' '+sCodIti+' '+DateToStr(dtFechaLectura)+' '+slContaRD.Values[IntToStr(i)];
            bm:= TBitmap.Create;
            bm.handle:= GenerarQR(sTextoQR,1,3);
            sNomQR:= GetTemporalPath+sCodIti+'_QRPag_'+IntToStr(i)+'.bmp';
            bm.SaveToFile(sNomQR);
            Excel_A.Sheets[i].Shapes.AddPicture(sNomQR, False, True, 740, 3, 45, 45);
            bm.Free;
          end;

          Excel_A.DisplayAlerts := False;
          Excel_A.ActiveWorkBook.SaveAs(sRutaGeneradoFA);
          Excel_A.Workbooks.Close;
          Excel_A := Unassigned;

          //***************
          //FORMATO E
          //***************

          Excel_E := CreateOLEObject('Excel.Application');
          Excel_E.WorkBooks.Open(sRutaGeneradoFE);
          iNumHojasExcelFE := ceil(iTotalClientes/NumItemsPorPagFE);
          fFormaEspere.ProgressBar1.Max := iNumHojasExcelFE;
          fFormaEspere.lbMotivo.Caption := 'Generando FORMATO E... (1/3)';
          fFormaEspere.ProgressBar1.Position := 0;
          fFormaEspere.Refresh;

          for i := 1 to iNumHojasExcelFE-1 do
          begin
            fFormaEspere.ProgressBar1.Position := i;
            fFormaEspere.Refresh;
            Excel_E.Sheets[1].Select;
            Excel_E.Sheets[1].Copy(EmptyParam, Excel_E.Sheets[1]);
          end;

          fFormaEspere.lbMotivo.Caption := 'Generando FORMATO E... (2/3)';
          fFormaEspere.ProgressBar1.Position := 0;
          fFormaEspere.Refresh;

          for i:=1 to Excel_E.WorkSheets.Count do
          begin
            fFormaEspere.ProgressBar1.Position := i;
            fFormaEspere.Refresh;
            Excel_E.Sheets[i].Name := 'Hoja'+IntToStr(i);
            Excel_E.Sheets[i].Cells.Item[3,14].Value := DateToStr(dFechayHoraImpresion); //FECHA IMPRESION
            Excel_E.Sheets[i].Cells.Item[3,9].Value := IntToStr(iTotalClientes); //CANTIDAD TOTAL DE CLIENTES
            Excel_E.Sheets[i].Cells.Item[3,20].Value := sCodIti; //ITINERARIO
          end;

          iContaSerialesSec:=0;
          iContaSerialesPag:=0;
          iContaPaginaFE:=1;
          InicializarFilasFE;
          InicializarColumnasFE;

          qIndice.Close;
          qIndice.SQL.Text := StringReplace(qIndice.SQL.Text,'FPLE180','FPLE180_DIARIA'+sEsquemaInterfaz,[rfReplaceAll,rfIgnoreCase]);
          qIndice.ParamByName('CODIGOITINERARIO').AsString:= sCodIti;
          qIndice.ParamByName('FECHALECTURA').AsDate:= dtFechaLectura;
          qIndice.Open;

          j:=0;
          fFormaEspere.ProgressBar1.Max := iTotalClientes;
          fFormaEspere.lbMotivo.Caption := 'Generando FORMATO E... (3/3)';
          fFormaEspere.Refresh;
          while not qIndice.Eof do
          begin
            inc(j);
            fFormaEspere.ProgressBar1.Position := j;
            fFormaEspere.Refresh;
            sNUMEROCONTADOR:= qIndice.Fields[0].AsString;
            sRUTA:= qIndice.Fields[1].AsString;
            sACOMETIDA:= qIndice.Fields[2].AsString;
            sHOJA:= qIndice.Fields[3].AsString;

            inc(iContaSerialesSec);
            inc(iContaSerialesPag);
            Excel_E.Sheets[iContaPaginaFE].Cells.Item[FilaNumContador, ColNumContador].Value :=sNUMEROCONTADOR;
            Excel_E.Sheets[iContaPaginaFE].Cells.Item[FilaRuta, ColRuta].Value :=sRUTA;
            Excel_E.Sheets[iContaPaginaFE].Cells.Item[FilaAcometida, ColAcometida].Value :=sACOMETIDA;
            Excel_E.Sheets[iContaPaginaFE].Cells.Item[FilaHOJA, ColHOJA].Value :=sHOJA;

            if iContaSerialesSec < (NumItemsPorPagFE/4) then
            begin
              inc(FilaNumContador);
              inc(FilaRuta);
              inc(FilaAcometida);
              inc(FilaHOJA);
            end
            else if iContaSerialesSec >= (NumItemsPorPagFE/4) then
            begin
              iContaSerialesSec:= 0;
              ColNumContador := ColNumContador + 6;
              ColRuta:= ColRuta + 6;
              ColAcometida:= ColAcometida + 6;
              ColHOJA := ColHOJA + 6;
              InicializarFilasFE;
            end;

            if iContaSerialesPag = NumItemsPorPagFE then
            begin
              inc(iContaPaginaFE);
              iContaSerialesPag:= 0;
              iContaSerialesSec:= 0;
              InicializarFilasFE;
              InicializarColumnasFE;
            end;
            qIndice.Next;
          end;

          Excel_E.DisplayAlerts := False;
          Excel_E.ActiveWorkBook.SaveAs(sRutaGeneradoFE);
          Excel_E.Workbooks.Close;
          Excel_E := Unassigned;
          qIndice.Close;

          //***************
          //FORMATO B
          //***************
          fFormaEspere.ProgressBar1.Max := 10;
          fFormaEspere.lbMotivo.Caption := 'Generando FORMATO B... (1/3)';
          fFormaEspere.ProgressBar1.Position := 0;

          Excel_B := CreateOLEObject('Excel.Application');
          Excel_B.WorkBooks.Open(sRutaGeneradoFB);
          sTextoQR:= 'B '+' '+sCodIti+' '+DateToStr(dFechayHoraImpresion)+' '+IntToStr(iTotalRD);
          bm:= TBitmap.Create;
          bm.handle:= GenerarQR(sTextoQR,1,3);
          sNomQR:= GetTemporalPath+sCodIti+'_QRFB.bmp';
          bm.SaveToFile(sNomQR);
          Excel_B.Sheets[1].Shapes.AddPicture(sNomQR, False, True, 750, 47, 45, 45);
          Excel_B.Sheets[1].Shapes.AddPicture(sNomQR, False, True, 345, 47, 45, 45);
          bm.Free;

          if iTotalRD > 0 then
          begin
            iNumHojasExcelFB:= ceil(iTotalRD/NumClientesPorPagFB);
            fFormaEspere.ProgressBar1.Max := iNumHojasExcelFB;
            fFormaEspere.lbMotivo.Caption := 'Generando FORMATO B... (2/3)';
            fFormaEspere.ProgressBar1.Position := 0;
            for i := 1 to iNumHojasExcelFB do
            begin
              fFormaEspere.ProgressBar1.Position := i;
              fFormaEspere.Refresh;
              Excel_B.Sheets[1].Select;
              Excel_B.Sheets[1].Copy(EmptyParam, Excel_B.Sheets[1]);
            end;
          end;

          fFormaEspere.ProgressBar1.Max := Excel_B.WorkSheets.Count;
          fFormaEspere.lbMotivo.Caption := 'Generando FORMATO B... (3/3)';
          fFormaEspere.ProgressBar1.Position := 0;
          for i:=1 to Excel_B.WorkSheets.Count do
          begin
            fFormaEspere.ProgressBar1.Position := i;
            fFormaEspere.Refresh;
            Excel_B.Sheets[i].Name := 'Hoja'+IntToStr(i);
          end;

          Excel_B.DisplayAlerts := False;
          Excel_B.ActiveWorkBook.SaveAs(sRutaGeneradoFB);
          Excel_B.Workbooks.Close;
          Excel_B := Unassigned;

          //***************
          //FORMATO C
          //***************

          Excel_C := CreateOLEObject('Excel.Application');
          Excel_C.WorkBooks.Open(sRutaGeneradoFC);

          qAnomalias:=TQuery.Create(nil);
          qAnomalias.DatabaseName := 'BaseDato';
          qAnomalias.SQL.Add('SELECT LPAD(C.CODIGOIMPRESION,2,''0'') AS CODIGOIMPRESION, A.NOMBRE, C.DESCRIPCION');
          qAnomalias.SQL.Add('FROM SGC_ANOMALIAS A, SGC_CLASES C');
          qAnomalias.SQL.Add('WHERE C.CODIGOANOMALIA = A.CODIGOANOMALIA');
          qAnomalias.SQL.Add('AND C.DESCRIPCION <> '' '' ');
          qAnomalias.SQL.Add('ORDER BY A.NOMBRE');
          qAnomalias.Open;

          fFormaEspere.ProgressBar1.Max := qAnomalias.RecordCount;
          fFormaEspere.lbMotivo.Caption := 'Generando FORMATO C... (1/2)';
          fFormaEspere.ProgressBar1.Position := 0;
          fFormaEspere.Refresh;
          j:=0;
          iContaItemSec:=0;
          InicializarFilasFC;
          InicializarColumnasFC;

          while not qAnomalias.Eof do
          begin
            inc(j);
            inc(iContaItemSec);
            fFormaEspere.ProgressBar1.Position := j;
            fFormaEspere.Refresh;

            sCODIGOIMPRESION:= qAnomalias.Fields[0].AsString;
            sNOMANOMALIA:= qAnomalias.Fields[1].AsString;
            sDESCLASE:= qAnomalias.Fields[2].AsString;

            Excel_C.Sheets[1].Cells.Item[FilaCodImpreso, ColCodImpreso].Value :=sCODIGOIMPRESION;
            Excel_C.Sheets[1].Cells.Item[FilaNomAnomalia, ColNomAnomalia].Value :=sNOMANOMALIA;
            Excel_C.Sheets[1].Cells.Item[FilaDesClase, ColDesClase].Value :=sDESCLASE;

            if iContaItemSec < (NumItemsPorPagFC/2) then
            begin
              inc(FilaCodImpreso);
              inc(FilaNomAnomalia);
              inc(FilaDesClase);
            end
            else if iContaItemSec >= (NumItemsPorPagFC/2) then
            begin
              iContaItemSec:= 0;
              ColCodImpreso := ColCodImpreso+NumCeldasDerechaFC;
              ColNomAnomalia:= ColNomAnomalia+NumCeldasDerechaFC;
              ColDesClase:= ColDesClase+NumCeldasDerechaFC;
              InicializarFilasFC;
            end;
            qAnomalias.Next;
          end;

          fFormaEspere.ProgressBar1.Max := qAnomalias.RecordCount;
          fFormaEspere.lbMotivo.Caption := 'Generando FORMATO C... (2/2)';
          fFormaEspere.ProgressBar1.Position := 0;
          for i:=1 to Excel_C.WorkSheets.Count do
          begin
            fFormaEspere.ProgressBar1.Position := i;
            fFormaEspere.Refresh;

            Excel_C.Sheets[1].Cells.Item[4,7].Value := qItinerariosNOMBREGRUPOTRABAJO.AsString;
            Excel_C.Sheets[1].Cells.Item[4,19].Value := qItinerariosNOMBREGRUPOTRABAJO.AsString;
            Excel_C.Sheets[i].Cells.Item[1,10].Value := DateToStr(dFechayHoraImpresion); //FECHA IMPRESION
            Excel_C.Sheets[i].Cells.Item[1,22].Value := DateToStr(dFechayHoraImpresion); //FECHA IMPRESION
            Excel_C.Sheets[1].Cells.Item[1,7].Value := qItinerariosLOGIN.Asstring;
            Excel_C.Sheets[1].Cells.Item[1,19].Value := qItinerariosLOGIN.Asstring;

            sTextoQR:= 'D '+' '+sCodIti+' '+DateToStr(dFechayHoraImpresion)+' USUARIO:'+qItinerariosLOGIN.Asstring+' NOMBRE:'+qItinerariosNOMBREGRUPOTRABAJO.AsString;
            bm:= TBitmap.Create;
            bm.handle:= GenerarQR(sTextoQR,1,3);
            sNomQR:= GetTemporalPath+sCodIti+'_QRFC.bmp';
            bm.SaveToFile(sNomQR);
            Excel_C.Sheets[1].Shapes.AddPicture(sNomQR, False, True, 5, 3, 45, 45);
            Excel_C.Sheets[1].Shapes.AddPicture(sNomQR, False, True, 380, 3, 45, 45);
            bm.Free;
          end;

          Excel_C.DisplayAlerts := False;
          Excel_C.ActiveWorkBook.SaveAs(sRutaGeneradoFC);
          Excel_C.Workbooks.Close;
          Excel_C := Unassigned;

          //***************
          //FORMATO D
          //***************
          fFormaEspere.ProgressBar1.Max := 2;
          fFormaEspere.lbMotivo.Caption := 'Generando FORMATO D... (1/1)';
          fFormaEspere.ProgressBar1.Position := 0;

          Excel_D := CreateOLEObject('Excel.Application');
          Excel_D.WorkBooks.Open(sRutaGeneradoFD);
          sTextoQR:= 'C';
          bm:= TBitmap.Create;
          bm.handle:= GenerarQR(sTextoQR,1,3);
          sNomQR:= GetTemporalPath+sCodIti+'_QRFD.bmp';
          bm.SaveToFile(sNomQR);
          Excel_D.Sheets[1].Shapes.AddPicture(sNomQR, False, True, 775, 33, 45, 45);
          bm.Free;

          fFormaEspere.ProgressBar1.Position := 1;
          fFormaEspere.Refresh;

          Excel_D.DisplayAlerts := False;
          Excel_D.ActiveWorkBook.SaveAs(sRutaGeneradoFD);
          Excel_D.Workbooks.Close;
          Excel_D := Unassigned;

          fFormaEspere.ProgressBar1.Position := 2;
          fFormaEspere.Refresh;

          slContaRD.Free;
          fFormaEspere.Free;
          fFormaEspere:=nil;
          qInsert.Close;
          qInsert.Free;
          qInsert:=nil;
          qDel.Close;
          qDel.Free;
          qDel:=nil;
          qAnomalias.Close;
          qAnomalias.Free;
          qAnomalias:=nil;
          qTemp.Close;
          qTemp.Free;
          qTemp:= nil;

          qTra.Database.Commit;
          qTra.Close;
          qTra.Free;
          qTra:=nil;

          DeshabilitarControles(True);
          Application.MessageBox(PChar('Proceso terminado exitosamente. A continuación se abrirá la cartografia '+
                                       'para la impresión del mapa.'),'SigCom',MB_ICONINFORMATION);
          ImprimirCartoItinerario();
        except
          on e:Exception do
          begin
            if assigned(qTra) then
            begin
              if qTra.Database.InTransaction then
                qTra.Database.Rollback;
              qTra.Close;
              qTra.Free;
              qTra:=nil;
            end;
            DeshabilitarControles(True);

            if not VarIsEmpty(Excel_A) then
            begin
              Excel_A.DisplayAlerts := False;
              Excel_A.Workbooks.Close;
              Excel_A := Unassigned;
            end;

            if not VarIsEmpty(Excel_B) then
            begin
              Excel_B.DisplayAlerts := False;
              Excel_B.Workbooks.Close;
              Excel_B := Unassigned;
            end;

            if not VarIsEmpty(Excel_C) then
            begin
              Excel_C.DisplayAlerts := False;
              Excel_C.Workbooks.Close;
              Excel_C := Unassigned;
            end;

            if not VarIsEmpty(Excel_D) then
            begin
              Excel_D.DisplayAlerts := False;
              Excel_D.Workbooks.Close;
              Excel_D := Unassigned;
            end;

            if not VarIsEmpty(Excel_E) then
            begin
              Excel_E.DisplayAlerts := False;
              Excel_E.Workbooks.Close;
              Excel_E := Unassigned;
            end;

            if assigned(qInsert) then
            begin
              qInsert.Close;
              qInsert.Free;
              qInsert:=nil;
            end;

            if assigned(qTemp) then
            begin
              qTemp.Close;
              qTemp.Free;
              qTemp:=nil;
            end;

            if assigned(qDel) then
            begin
              qDel.Close;
              qDel.Free;
              qDel:=nil;
            end;

            if assigned(qAnomalias) then
            begin
              qAnomalias.Close;
              qAnomalias.Free;
              qAnomalias:=nil;
            end;

            if assigned(fFormaEspere) then
            begin
              fFormaEspere.Free;
              fFormaEspere:=nil;
            end;

            Application.MessageBox(PChar('Ocurrió un error al generar el archivo: '+Chr(13)+Chr(13)+e.Message+Chr(13)+Chr(13)+'Contacte a soporte.'),'SigCom',MB_ICONERROR);
          end;
        end;
      end
      else
        Application.MessageBox(PChar('No se puede crear el archivo en la ruta especificada.'),'SigCom',MB_ICONERROR);
    end
    else
      Application.MessageBox(PChar('No se encontro información exportada del itinerario.'),'SigCom',MB_ICONERROR);

    if assigned(qTemp) then
    begin
      qTemp.Close;
      qTemp.Free;
      qTemp:=nil;
    end;

  end;
end;

procedure TFListaExportacionRutas.sbBorrarExpoClick(Sender: TObject);
var
  Query : TQuery;
  sTextoPregunta: String;
begin
  inherited;

  sTextoPregunta:='Se van a BORRAR los itinerarios exportados para la fecha ['+ DateToStr(dtFechaLectura)+'].'
  +' En caso de haber sido descargado por algun lector debe comunicarse '
  +'con él y pedirle que cierre sesión e indicarle que vuelva a descargar su itinerario.'+Chr(13)+Chr(13)+'¿Esta seguro de continuar?';

  if Application.MessageBox(PChar(sTextoPregunta),'SigCom',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2) = ID_YES then
  begin
    try
      Query:=TQuery.Create(nil);
      Query.DatabaseName := 'BaseDato';
      Query.SQL.ADD('DELETE  FROM '+NOMTABLAEXPO+' WHERE USUARIOULTIMAEXPORTACION =(SELECT GETCODIGOUSUARIO FROM DUAL) AND FECHALECTURA=TO_DATE('''+DateToStr(dtFechaLectura)+''',''DD/MM/YYYY'') ');
      Query.ExecSQL;

      if Query.RowsAffected >0 THEN
      begin
       Application.MessageBox(PChar('Proceso terminado exitosamente. Se eliminaron '+IntToStr(Query.RowsAffected)+' Clientes.'),'SigCom',MB_ICONINFORMATION);
      end;

    finally
      Query.Free;
    end;
  end;
end;

procedure TFListaExportacionRutas.ImprimirCartoItinerario;
var
  qTemp: TQuery;
  sql, sFechaOra, sNomCapa: string;
begin
  qTemp:=TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';
  qTemp.SQL.Clear;
  qTemp.SQL.Text := Trim(qImprimirItinerario.SQL.Text);

  sql:='';
  sql := StringReplace(qTemp.SQL.Text,':CODIGOADMINISTRATIVO',qItinerariosCODIGOADMINISTRATIVO.AsString,[rfReplaceAll,rfIgnoreCase]);
  sql := StringReplace(sql,':CODIGOGRUPOTRABAJO',qItinerariosCODIGOGRUPOTRABAJO.AsString,[rfReplaceAll,rfIgnoreCase]);
  sql := StringReplace(sql,':CODIGOITINERARIO',qItinerariosCODIGOITINERARIO.AsString,[rfReplaceAll,rfIgnoreCase]);
  sFechaOra:= QuotedStr(DateToStr(dtFechaLectura));
  sql := StringReplace(sql,':FECHALECTURA',sFechaOra,[rfReplaceAll,rfIgnoreCase]);
  qTemp.SQL.Text:=sql;
  qTemp.Open;
  sNomCapa:= '_FiltroAplicado'+qItinerariosCODIGOITINERARIO.AsString;
  MostrarMapa;
  Application.ProcessMessages;
  GetItinerarioCapa(qTemp, 'CLAVE', 'Marcado', 6, clAqua, True, sNomCapa);
  qTemp.Close;
  qTemp.Free;
  ImprimirMapaItinerario(sNomCapa);
end;

procedure TFListaExportacionRutas.sbImprimirItinerarioClick(Sender: TObject);
var
  punto:TPoint;
begin
  inherited;
  punto:=pBarraItinierarios.ClientToScreen(Classes.Point(sbImprimirItinerario.Left, sbImprimirItinerario.Top));
  pmSigComPapel.Popup(punto.x+10, punto.y+10);
end;

procedure TFListaExportacionRutas.miSoloMapasClick(Sender: TObject);
begin
  inherited;
  ImprimirCartoItinerario;
end;

procedure TFListaExportacionRutas.qItinerariosCalcFields(
  DataSet: TDataSet);
var
  qTemp: TQuery;
  sql, sFechaOra, sCodGI, sSubConsulta: string;
begin
  inherited;
  sCodGI:= qItinerariosCODIGOITINERARIO.AsString;
  {
  qTemp:=TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';
  qTemp.SQL.Add('SELECT CLIENTESITINERARIO('+sCodGI+') AS TOTAL FROM DUAL');
  qTemp.Open;
  qItinerariosCantClientesItinerario.AsInteger:= qTemp.FieldByName('TOTAL').AsInteger;
  qTemp.Close;
  qTemp.SQL.Clear;

  qItinerariosCantClientesEnrutadosCruzados.AsInteger:=0;
  qItinerariosCantClientesSOLOComercial.AsInteger :=0;
  qItinerariosCantClientesEnRutaSinInfoCOM.AsInteger:=0;
  qItinerariosCantClientesAExportar.AsInteger:=0;
  qItinerariosCantClientesAliensDiaL.AsInteger:=0;

  if (qItinerariosCODIGOADMINISTRATIVO.AsString <> '') and
     (qItinerariosCODIGOGRUPOTRABAJO.AsString <> '')
  then
  begin
    qTemp.SQL.Add('SELECT COUNT(*) AS TOTALREGISTROS ');
    if qGruposAOL.FieldByName('DISPERSA').AsString ='S' then
      qTemp.SQL.Add(Trim(From_qInsert_Info_GC.SQL.Text))
    else
      qTemp.SQL.Add(Trim(From_qInsert_Info.SQL.Text));

    sql:='';
    sql := StringReplace(qTemp.SQL.Text,':CODIGOADMINISTRATIVO',qItinerariosCODIGOADMINISTRATIVO.AsString,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':CODIGOGRUPOTRABAJO',qItinerariosCODIGOGRUPOTRABAJO.AsString,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':CODIGODIAL',IntToStr(iCodigoDial),[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':PERIODO',IntToStr(iPeriodo),[rfReplaceAll,rfIgnoreCase]);
    sFechaOra:= 'TO_DATE('+QuotedStr(DateToStr(dtFechaLectura))+',''DD/MM/YYYY'')';
    sql := StringReplace(sql,':FECHALECTURA',sFechaOra,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':CODIGOGRUPOITINERARIO',qGruposAOLCODIGOGRUPOITINERARIO.AsString,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':CODIGOITINERARIO',sCodGI,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,'FPLE180','FPLE180_DIARIA'+sEsquemaInterfaz,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,'FPLE190','FPLE190'+sEsquemaInterfaz,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,'EEH_RUTACICLO','INCMS_CALENDARIO'+sEsquemaInterfaz,[rfReplaceAll,rfIgnoreCase]);
    qTemp.SQL.Text:=sql;
    qTemp.Open;
    qItinerariosCantClientesEnrutadosCruzados.AsInteger:= qTemp.FieldByName('TOTALREGISTROS').AsInteger;
    qTemp.Close;

    if qGruposAOL.FieldByName('DISPERSA').AsString ='S' then
      sSubConsulta:= ' ('+Trim(SelectPrincipal_qInsert_Info.SQL.Text)+' '+Trim(From_qInsert_Info_GC.SQL.Text)+') '
    else
      sSubConsulta:= ' ('+Trim(SelectPrincipal_qInsert_Info.SQL.Text)+' '+Trim(From_qInsert_Info.SQL.Text)+') ';

    qTemp.SQL.Clear;
    qTemp.SQL.Add('SELECT COUNT(*) AS TOTALREGISTROS ');
    qTemp.SQL.Add(Trim(From_SoloComercial.SQL.Text));
    sql:='';
    sql := StringReplace(qTemp.SQL.Text, NOMTABLAEXPO, sSubConsulta, [rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':CODIGOADMINISTRATIVO',qItinerariosCODIGOADMINISTRATIVO.AsString,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':CODIGOGRUPOTRABAJO',qItinerariosCODIGOGRUPOTRABAJO.AsString,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':CODIGODIAL',IntToStr(iCodigoDial),[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':PERIODO',IntToStr(iPeriodo),[rfReplaceAll,rfIgnoreCase]);
    sFechaOra:= 'TO_DATE('+QuotedStr(DateToStr(dtFechaLectura))+',''DD/MM/YYYY'')';
    sql := StringReplace(sql,':FECHALECTURA',sFechaOra,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':CODIGOGRUPOITINERARIO',qGruposAOLCODIGOGRUPOITINERARIO.AsString,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':CODIGOITINERARIO',sCodGI,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,'FPLE180','FPLE180_DIARIA'+sEsquemaInterfaz,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,'FPLE190','FPLE190'+sEsquemaInterfaz,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,'EEH_RUTACICLO','INCMS_CALENDARIO'+sEsquemaInterfaz,[rfReplaceAll,rfIgnoreCase]);
    qTemp.SQL.Text:=sql;
    qTemp.Open;
    qItinerariosCantClientesSOLOComercial.AsInteger:= qTemp.FieldByName('TOTALREGISTROS').AsInteger;;
    qTemp.Close;

    qTemp.SQL.Clear;
    qTemp.SQL.Add('SELECT COUNT(*) AS TOTALREGISTROS ');
    qTemp.SQL.Add(Trim(From_EnRutaSinInfoComercial.SQL.Text));
    qTemp.SQL.Add('AND C.CODIGOCLIENTESGD NOT IN (SELECT DISTINCT C.CODIGOCLIENTESGD');
    if qGruposAOL.FieldByName('DISPERSA').AsString ='S' then
      qTemp.SQL.Add(Trim(From_qInsert_Info_GC.SQL.Text)+')')
    else
      qTemp.SQL.Add(Trim(From_qInsert_Info.SQL.Text)+')');

    sql:='';
    sql := StringReplace(qTemp.SQL.Text,':CODIGOADMINISTRATIVO',qItinerariosCODIGOADMINISTRATIVO.AsString,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':CODIGOGRUPOTRABAJO',qItinerariosCODIGOGRUPOTRABAJO.AsString,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':CODIGODIAL',IntToStr(iCodigoDial),[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':PERIODO',IntToStr(iPeriodo),[rfReplaceAll,rfIgnoreCase]);
    sFechaOra:= 'TO_DATE('+QuotedStr(DateToStr(dtFechaLectura))+',''DD/MM/YYYY'')';
    sql := StringReplace(sql,':FECHALECTURA',sFechaOra,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':CODIGOGRUPOITINERARIO',qGruposAOLCODIGOGRUPOITINERARIO.AsString,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':CODIGOITINERARIO',sCodGI,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':CODIGOGRUPOAOL',qGruposAOLCODIGOGRUPOAOL.AsString,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,':CODIGORUTA',qGruposAOLCODIGORUTA.AsString,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,'FPLE180','FPLE180_DIARIA'+sEsquemaInterfaz,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,'FPLE190','FPLE190'+sEsquemaInterfaz,[rfReplaceAll,rfIgnoreCase]);
    sql := StringReplace(sql,'EEH_RUTACICLO','INCMS_CALENDARIO'+sEsquemaInterfaz,[rfReplaceAll,rfIgnoreCase]);
    qTemp.SQL.Text:=sql;
    qTemp.Open;
    qItinerariosCantClientesEnRutaSinInfoCOM.AsInteger := qTemp.FieldByName('TOTALREGISTROS').AsInteger;
    qTemp.Close;
    qTemp.Free;
    qItinerariosCantClientesAExportar.AsInteger:= qItinerariosCantClientesEnrutadosCruzados.AsInteger+
                                                  qItinerariosCantClientesSOLOComercial.AsInteger+
                                                  qItinerariosCantClientesEnRutaSinInfoCOM.AsInteger;

  end;
  slCodsIti.Add(sCodGI);
  slCliPorIti.Add(sCodGI+'='+qItinerariosCantClientesAExportar.AsString);

  qItinerariosCantClientesAliensDiaL.AsInteger:= qItinerariosCantClientesItinerario.AsInteger -
                                                 qItinerariosCantClientesEnrutadosCruzados.AsInteger;
  }
end;

function TFListaExportacionRutas.GetTotalClientesAExp(): Integer;
var
  iContIti: integer;
  i, sum: integer;
begin
  result:=0;
  i:=0;
  iContIti:= qTotalItinerariosDiaLTOTALITINERARIOS.AsInteger;
  if assigned(qItinerarios.OnCalcFields) then
  begin
    fFormaEspere := TfFormaEspere.Create(Application);
    fFormaEspere.ProgressBar1.Max := iContIti;
    fFormaEspere.lbMotivo.Caption := 'Calculando clientes a exportar...';
    fFormaEspere.Show;
    fFormaEspere.Refresh;

    qGruposAOL.First;
    qItinerarios.DisableControls;
    while not qGruposAOL.Eof do
    begin
      qItinerarios.First;
      while not qItinerarios.Eof do
      begin
        fFormaEspere.lbMotivo.Caption := 'Calculando itinerario '+IntToStr(i+1)+' de '+IntToStr(iContIti);
        fFormaEspere.ProgressBar1.Position := i;
        fFormaEspere.Refresh;
        inc(i);
        qItinerarios.Next;
      end;
      Application.ProcessMessages;
      qGruposAOL.Next;
    end;
    qItinerarios.EnableControls;
    fFormaEspere.Free;
    fFormaEspere:= nil;

    sum:=0;
    for i := 0 to slCliPorIti.Count-1 do
    begin
      sum:= sum+StrToInt(slCliPorIti.Values[slCodsIti[i]]);
    end;
    result:= sum;
  end;
end;

procedure TFListaExportacionRutas.sbCalcClientesTotalesAExpClick(
  Sender: TObject);
begin
  inherited;
  if Application.MessageBox(PChar('El conteo de los clientes del DiaL puede tardar varios minutos. Esta seguro de continuar? '),'SigCom',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = ID_YES then
  begin
    DeshabilitarControles(False);
    lblTotalClientesAExp.Caption := IntToStr(GetTotalClientesAExp());
    DeshabilitarControles(True);
  end;
end;

procedure TFListaExportacionRutas.InicializarFilasFE;
begin
  FilaRuta:= FilaIniRutaFE;
  FilaAcometida:= FilaIniAcometidaFE;
  FilaNumContador:= FilaIniNumContadorFE;
  FilaHOJA:= FilaIniHOJA;
end;

procedure TFListaExportacionRutas.InicializarColumnasFE;
begin
  ColRuta:= ColIniRutaFE;
  ColAcometida:= ColIniAcometidaFE;
  ColNumContador:= ColIniNumContadorFE;
  ColHOJA:= ColIniHOJA;
end;

function TFListaExportacionRutas.ActualizarTotal(sCodIti, sFecha, sCampo, sValor: string): Integer;
var
  qTemp: TQuery;
begin
  result:=0;
  qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';
  qTemp.SQL.Clear;
  qTemp.SQL.Add('UPDATE SGC_TOTALESPORITINERARIO');
  qTemp.SQL.Add('SET '+sCampo+' = '+sValor);
  qTemp.SQL.Add('WHERE CODIGOITINERARIO = '+sCodIti);
  qTemp.SQL.Add('AND FECHALECTURA = '+sFecha);
  qTemp.ExecSQL;
  result:= qTemp.RowsAffected;
  qTemp.Close;
  qTemp.Free;
end;

function TFListaExportacionRutas.HayInfoLECT_CORTE(dtFechaLectura: TDateTime): Boolean;
var
  qTemp: TQuery;
begin
  result:=False;
  qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';
  qTemp.SQL.Clear;
  qTemp.SQL.Add('SELECT COUNT(*) AS CONTADOR');
  qTemp.SQL.Add('FROM '+NOM_TBL_180+' F');
  qTemp.SQL.Add('WHERE F.LECT_CORTE <> 0');
  qTemp.SQL.Add('AND F.LECT_CORTE IS NOT NULL');
  qTemp.SQL.Add('AND F.FECHA_LECTURA_PROGRAMADA = :FECHALECTURA');
  qTemp.ParamByName('FECHALECTURA').AsDate := dtFechaLectura;
  qTemp.Open;
  if qTemp.FieldByName('CONTADOR').AsInteger > 0 then
    result:= True;
  qTemp.Close;
  qTemp.Free;
end;


procedure TFListaExportacionRutas.GetParametroAuditables;
var
 qConsultaP : TQuery;
begin
ParametroAuditable := '10';

try

qConsultaP := TQuery.Create(nil);
qConsultaP.DatabaseName := 'BaseDato';

qConsultaP.SQL.clear;
qConsultaP.SQL.Add('SELECT VALOR FROM SGC_PARAMETROS WHERE CODIGOPARAMETRO=40');
qConsultaP.open;

ParametroAuditable := qConsultaP.fieldByName('VALOR').AsString;

finally
 qConsultaP.Free;
end;

end;

end.
