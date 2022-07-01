unit uListaExportacionReparto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls, ConsDll, ComObj,
  OleCtnrs, Math, FileCtrl, Menus, ImgList, ComCtrls, ToolWin;

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

  TFListaExportacionrReparto = class(TFdSgdListaBase)
    pBase: TPanel;
    pSuperior: TPanel;
    pBarraGA: TPanel;
    dsListadoItinerarios: TDataSource;
    dsItinerarios: TDataSource;
    qListadoIinerarios: TQuery;
    qItinerarios: TQuery;
    Panel4: TPanel;
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
    qItinerariosCODIGOESTADOITINERARIO: TFloatField;
    qItinerariosITEM: TFloatField;
    From_qInsert_Info: TQuery;
    SelectPrincipal_qInsert_Info: TQuery;
    Select_EnRutaSinInfoComercial: TQuery;
    From_qInsert_Info_GC: TQuery;
    Insert_SoloComercial: TQuery;
    qClientesAlertantes: TQuery;
    qItinerariosIMPRIMIRPLANILLA: TStringField;
    qImprimirItinerario: TQuery;
    qItinerariosLOGIN: TStringField;
    pmSigComPapel: TPopupMenu;
    miExcelYMapas: TMenuItem;
    miSoloMapas: TMenuItem;
    InsertInto_qInsert_Info: TQuery;
    qItinerariosCantClientesEnrutadosCruzados: TIntegerField;
    qItinerariosCantClientesSOLOComercial: TIntegerField;
    Select_SoloComercial: TQuery;
    From_SoloComercial: TQuery;
    qItinerariosCantClientesAExportar: TIntegerField;
    Insert_EnRutaSinInfoComercial: TQuery;
    From_EnRutaSinInfoComercial: TQuery;
    qItinerariosCantClientesEnRutaSinInfoCOM: TIntegerField;
    qItinerariosCantClientesAliensDiaL: TIntegerField;
    qItinerariosCantClientesItinerario: TIntegerField;
    qIndice: TQuery;
    qLibrosSinPromedio: TQuery;
    qTelemedidos: TQuery;
    qMarcarRegistrosAuditables: TQuery;
    spMarcarAuditables: TStoredProc;
    ilMenuPrincipal: TImageList;
    qListadoIinerariosNOMBRESEDEOPERATIVA: TStringField;
    qListadoIinerariosCOLOR: TFloatField;
    qListadoIinerariosCODIGOITINERARIO: TFloatField;
    qListadoIinerariosNOMBREESTADOITINERARIO: TStringField;
    qListadoIinerariosNOMBREGRUPOTRABAJO: TStringField;
    qListadoIinerariosCODIGOESTADOITINERARIO: TFloatField;
    qListadoIinerariosCANTIDAD: TFloatField;
    DBGrid1: TDBGrid;
    qListadoIinerariosLOGIN: TStringField;
    qInsertReparto: TQuery;
    qListadoIinerariosExportados: TStringField;
    qListadoIinerariosInfoComercial: TStringField;
    Panel5: TPanel;
    ToolBar1: TToolBar;
    tbExportar: TToolButton;
    sbVerGIenCarto: TToolButton;
    sbBorrarExpo: TToolButton;
    ToolButton1: TToolButton;
    tbDevolver: TToolButton;
    sbRefrescar: TSpeedButton;
    qListadoIinerariosClientesNoExportados: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbCambiarGTaItiClick(Sender: TObject);
    procedure sbVerGIenCartoClick(Sender: TObject);
    procedure RxDBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure sbRefrescarClick(Sender: TObject);
    procedure sbImprimirItinerarioClick(Sender: TObject);
    procedure sbBorrarExpoClick(Sender: TObject);
    procedure miExcelYMapasClick(Sender: TObject);
    procedure miSoloMapasClick(Sender: TObject);
    procedure qItinerariosCalcFields(DataSet: TDataSet);
    procedure sbCalcClientesTotalesAExpClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure tbExportar123Click(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure qListadoIinerariosCalcFields(DataSet: TDataSet);
    procedure tbDevolverClick(Sender: TObject);

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
    CodigoSedeOperativa , FechaReparto : String;
  function Exportar(var clientesExportados : String) : Boolean;
  function BorrarExportacion(var clientesExportados : String): Boolean;
  function CambiarEstadoItinerario(CodigoEstadoItinerario : String): Boolean;
  function ExistenciaDeExportacion : Boolean;
  function ClientesExportadosPorItinerario(CodigoItinerario : String): Integer;
  function ClientesConInfoComercial(CodigoItinerario: String): Integer;
  function ClientesInfoClientesCantidad(var Clientes : Integer; var ClientesComercial : Integer) :Boolean;
  function CambiarEstadoClientes: Boolean;
  Procedure RecargarListados;
  function ValidarDatosExportacion : Boolean;
  FUNCTION consultarEstadoItinerario(CodigoItinerario: String): Boolean;
  FUNCTION ValidarListadoItinerarios: Boolean;
  function RemoverClientesParaExportacion(CodigoItinerario : String) : Boolean;
  function revisarApoyo(CodigoCuenta ,CodigoApoyo , FechaLectura : String) : Boolean;
  function RemoverFechaReparto(CodigoCuenta,FechaLectura : String): Boolean;
  Procedure CrearTotalesPorItinerario(CodigoItinerario : String);
  function GenerarTotales : Boolean;
  end;

var
  FListaExportacionrReparto: TFListaExportacionrReparto;


implementation

uses uFormaEspere, uOpcionExpoItinerario, uFIMPAdministrativo, uFuncionSGD;

{$R *.DFM}

function TFListaExportacionrReparto.FileVersionGet( const sgFileName : string ) : string;
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

function TFListaExportacionrReparto.GetPeriodoMaxExportadoGAOL (slCodsItis: TStringlist): Integer;
begin

end;

procedure TFListaExportacionrReparto.DeshabilitarControles(pValor: Boolean);
begin

end;

procedure TFListaExportacionrReparto.FormCreate(Sender: TObject);
var
  qTemp: TQuery;
begin
  inherited;
  sEsquemaInterfaz:= '';

  slCliPorIti:= TStringlist.Create;
  slCliPorIti.Sorted := True;
  slCodsIti:= TStringlist.Create;
  slCodsIti.Sorted := True;

    CodigoSedeOperativa := ListaDatos.Values['SEDE_OPERATIVA'];
    FechaReparto := ListaDatos.Values['FECHA_REPARTO'];
     qTemp:= TQuery.Create(nil);
    qTemp.DatabaseName := 'BaseDato';

  qTemp.Close;
  qTemp.SQL.Clear;
  qTemp.SQL.Add('SELECT DISTINCT FECHA_PROGRAMADA_REPARTO FROM REP_CICLOREPARTO');
  qTemp.SQL.Add(' WHERE TO_CHAR(FECHA_PROGRAMADA_REPARTO,''DD/MM/YYYY'') = :FECHALECTURA');
  qTemp.ParamByName('FECHALECTURA').AsString := FechaReparto;
  qTemp.Open;
  if not qTemp.isEmpty then
    iPeriodo:= 0
  else
  begin
    iPeriodo:= -1;
    DeshabilitarControles(False);
    Application.MessageBox(PChar('No existe un Ciclo de Reparto para la Fecha digitada.'),'SigCom',MB_ICONWARNING);
  end;

  qTemp.Close;
  qTemp.SQL.Clear;
  qTemp.SQL.Add('SELECT NOMBRESEDEOPERATIVA FROM SEDEOPERATIVA');
  qTemp.SQL.Add('WHERE CODIGOSEDEOPERATIVA = '+CodigoSedeOperativa);
  qTemp.Open;
  sNombreSO:= qTemp.FieldByName('NOMBRESEDEOPERATIVA').AsString;
  qTemp.Close;
  qTemp.Free;

  RecargarListados;

end;

procedure TFListaExportacionrReparto.FormShow(Sender: TObject);
var
 qTemp: TQuery;
begin
  inherited;
  RefrescarVariables;
  qListadoIinerarios.Close;

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
   end;
   RecargarListados;
end;


procedure TFListaExportacionrReparto.tbExportar123Click(Sender: TObject);
var
  qQuery: TQuery;
  CantidadClientes, valor, Mensaje: string;
  Clientes, ClientesInfo: Integer;
begin
  inherited;

  qQuery := TQuery.Create(nil);
  qQuery.DatabaseName := 'BaseDato';

  qQuery.SQL.Clear;
  qQuery.SQL.Add
    ('SELECT COUNT(*) AS CANTIDAD FROM REP_INFORMACIONCOMERCIAL WHERE to_char(FECHA_LECTURA_PROGRAMADA,''DD/MM/YYYY'')=:FECHAPROGRAMADA');
  qQuery.ParamByName('FECHAPROGRAMADA').AsString := FechaReparto;
  qQuery.open;

  if ClientesInfoClientesCantidad(Clientes, ClientesInfo) then
    Mensaje := 'La cantidad de clientes a exportar es : ' +
      IntToStr(ClientesInfo) + char(13)+' ¿Esta seguro que desea continuar?'
  else
    Mensaje := 'La cantidad de clientes a exportar es  :  ' + IntToStr(Clientes)
      + ' y clientes con información comercial ' + IntToStr(ClientesInfo) +
      ' , No son iguales, algunos clientes NO se exportaran '+char(13)+'¿Esta seguro que desea continuar?';

  if Application.MessageBox(PChar(Mensaje), 'SigCom', MB_YESNO + MB_ICONWARNING
    + MB_DEFBUTTON2) = ID_YES then
  begin

    qQuery.close;
    qQuery.SQL.Clear;
    qQuery.SQL.Add
      ('SELECT count(*) as CANTIDAD FROM REP_ITINERARIO WHERE CODIGOSEDEOPERATIVA=:CODIGOSEDEOPERATIVA AND to_char(FECHAPROGRAMADAREPARTO,''DD/MM/YYYY'')=:FECHAPROGRAMADA AND CODIGOESTADOITINERARIO<>2');
    qQuery.ParamByName('FECHAPROGRAMADA').AsString := FechaReparto;
    qQuery.ParamByName('CODIGOSEDEOPERATIVA').AsString := CodigoSedeOperativa;
    qQuery.open;

    if qQuery.FieldByName('CANTIDAD').AsInteger = 0 then
    begin

      if Application.MessageBox
        (PChar('La exportación puede tardar, ¿Desea Continuar?'), 'SigCom',
        MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = ID_YES then
      begin

        if not ExistenciaDeExportacion then
        begin

          if  Exportar(CantidadClientes) AND  CambiarEstadoItinerario('3') and GenerarTotales  then
          begin
            Application.MessageBox(PChar('Se han exportado ' + CantidadClientes
              + ' Clientes para Reparto. '), 'SigCom', MB_ICONINFORMATION);
          RecargarListados;
          end
          else
            Application.MessageBox
              (PChar('No ha sido posible realizar la exportación de los itinerarios, intente nuevamente.'),
              'SigCom', MB_ICONERROR);

        end
        else
        begin

          if Application.MessageBox
            (PChar('Ya existe una exportación para la fecha de reparto : ' +
            FechaReparto + ' Y Sede Operativa : ' + sNombreSO +
            ', ¿Esta seguro que desea volver a exportar, se perdera el avance y todos los inspectores deben volver a descargar los itinerarios en los dispositivos moviles?'),
            'SigCom', MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = ID_YES then
          begin

            IF BorrarExportacion(valor) then
            begin
              if Exportar(CantidadClientes)  AND  CambiarEstadoItinerario('3')  then
                Application.MessageBox
                  (PChar('Se han exportado ' + CantidadClientes +
                  ' Clientes para Reparto. '), 'SigCom', MB_ICONINFORMATION)
              else
                Application.MessageBox
                  (PChar('No ha sido posible realizar la exportación de los itinerarios, intente nuevamente.'),
                  'SigCom', MB_ICONERROR);

            end;

          end;

        end;

      end;

    end
    else
      Application.MessageBox
        (PChar('Todos los itinerarios deben estar en ESTADO asignado para poder realizar la exportación, Asigne los itinerarios a sus repectivos inspectores o Borre la Exportación e intente nuevamente.'),
        'SigCom', MB_ICONERROR);

  end;
end;

procedure TFListaExportacionrReparto.bbCambiarGTaItiClick(Sender: TObject);
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
      FListaExportacionrReparto.FormShow(nil);

    fOpcionExpoItinerario.Free;
    fOpcionExpoItinerario:= nil;
  end;
end;

procedure TFListaExportacionrReparto.sbVerGIenCartoClick(Sender: TObject);
begin
  inherited;
if ValidarDatosExportacion then
MostrarGrupoItinerarioReparto(FechaReparto,CodigoSedeOperativa);
end;

procedure TFListaExportacionrReparto.RxDBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  ColorCelda: TColor;
begin
  inherited;
  if Column.FieldName = 'COLOR' Then
  begin
    ColorCelda := qItinerariosCOLOR.AsInteger;
  {  RxDBGrid2.Canvas.Brush.Color:=ColorCelda;
    RxDBGrid2.Canvas.Rectangle(rect.left,rect.top,rect.right,rect.bottom); }
  end;
end;

procedure TFListaExportacionrReparto.sbRefrescarClick(Sender: TObject);
begin
  inherited;
  FormShow(nil);
end;

function TFListaExportacionrReparto.GetTotalRegsTablasCOM(sTabla: string; dtFechaLectura: TDateTime):Integer;
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

procedure TFListaExportacionrReparto.InicializarFilasFA;
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

procedure TFListaExportacionrReparto.InicializarFilasFC;
begin
  FilaCodImpreso:= FilaIniCodImpreso;
  FilaNomAnomalia:= FilaIniNomAnomalia;
  FilaDesClase:= FilaIniDesClase;
end;

procedure TFListaExportacionrReparto.InicializarColumnasFC;
begin
  ColCodImpreso := ColIniCodImpreso;
  ColNomAnomalia:= ColIniNomAnomalia;
  ColDesClase:= ColIniDesClase;
end;

procedure TFListaExportacionrReparto.InicializarColumnasFA;
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

procedure TFListaExportacionrReparto.miExcelYMapasClick(Sender: TObject);
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

procedure TFListaExportacionrReparto.sbBorrarExpoClick(Sender: TObject);
var
  sTextoPregunta,CantidadClientes: String;
begin
  inherited;
 if ValidarDatosExportacion then
 begin
  sTextoPregunta:='Se van a BORRAR los itinerarios exportados para la fecha ['+ FechaReparto+'].'
  +' En caso de haber sido descargado por algun lector debe comunicarse '
  +'con él y pedirle que cierre sesión e indicarle que vuelva a descargar su itinerario.'+Chr(13)+Chr(13)+'¿Esta seguro de continuar?';

  if Application.MessageBox(PChar(sTextoPregunta),'SigCom',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2) = ID_YES then
  begin
      if CambiarEstadoItinerario('2') AND BorrarExportacion(CantidadClientes) THEN
      begin
       Application.MessageBox(PChar('Proceso terminado exitosamente. Se eliminaron '+CantidadClientes+' Clientes.'),'SigCom',MB_ICONINFORMATION);
      RecargarListados;
      end;
 end;
  end;
end;

procedure TFListaExportacionrReparto.ImprimirCartoItinerario;
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

procedure TFListaExportacionrReparto.sbImprimirItinerarioClick(Sender: TObject);
var
  punto:TPoint;
begin
  inherited;
 // punto:=pBarraItinierarios.ClientToScreen(Classes.Point(sbImprimirItinerario.Left, sbImprimirItinerario.Top));
 // pmSigComPapel.Popup(punto.x+10, punto.y+10);
end;

procedure TFListaExportacionrReparto.miSoloMapasClick(Sender: TObject);
begin
  inherited;
  ImprimirCartoItinerario;
end;

procedure TFListaExportacionrReparto.qItinerariosCalcFields(
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

function TFListaExportacionrReparto.GetTotalClientesAExp(): Integer;
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

    //qGruposAOL.First;
    qItinerarios.DisableControls;
    while not qListadoIinerarios.Eof do
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
      qListadoIinerarios.Next;
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

procedure TFListaExportacionrReparto.sbCalcClientesTotalesAExpClick(
  Sender: TObject);
begin
  inherited;
  if Application.MessageBox(PChar('El conteo de los clientes del DiaL puede tardar varios minutos. Esta seguro de continuar? '),'SigCom',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2) = ID_YES then
  begin
    DeshabilitarControles(False);
   // lblTotalClientesAExp.Caption := IntToStr(GetTotalClientesAExp());
    DeshabilitarControles(True);
  end;
end;

procedure TFListaExportacionrReparto.InicializarFilasFE;
begin
  FilaRuta:= FilaIniRutaFE;
  FilaAcometida:= FilaIniAcometidaFE;
  FilaNumContador:= FilaIniNumContadorFE;
  FilaHOJA:= FilaIniHOJA;
end;

procedure TFListaExportacionrReparto.InicializarColumnasFE;
begin
  ColRuta:= ColIniRutaFE;
  ColAcometida:= ColIniAcometidaFE;
  ColNumContador:= ColIniNumContadorFE;
  ColHOJA:= ColIniHOJA;
end;

function TFListaExportacionrReparto.ActualizarTotal(sCodIti, sFecha, sCampo, sValor: string): Integer;
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

function TFListaExportacionrReparto.HayInfoLECT_CORTE(dtFechaLectura: TDateTime): Boolean;
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


procedure TFListaExportacionrReparto.GetParametroAuditables;
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





procedure TFListaExportacionrReparto.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
 if Column.Index = 0 then
 begin
 TDBGrid(Sender).Canvas.Brush.Color:=qListadoIinerariosCOLOR.AsInteger;
 TDBGrid(Sender).Canvas.Rectangle(rect.left,rect.top,rect.right,rect.bottom);
 end;
end;

procedure TFListaExportacionrReparto.tbExportarClick(Sender: TObject);
begin
  inherited;

 if ValidarDatosExportacion then
  tbExportar123Click(Sender);

end;

function TFListaExportacionrReparto.Exportar(var clientesExportados : String): Boolean;
begin
  Result := False;
  qInsertReparto.close;
  clientesExportados := '0';
  qInsertReparto.ParamByName('CODIGOPGI').AsString := FileVersionGet('Administrativo.pgi');
  qInsertReparto.ParamByName('CODIGOSEDE').AsString :=  CodigoSedeOperativa;
  qInsertReparto.ParamByName('FECHAREPARTO').AsString := FechaReparto;
  qInsertReparto.ExecSQL;

  if qInsertReparto.RowsAffected > 0 then
  begin
  Result := True;
  clientesExportados := IntToStr(qInsertReparto.RowsAffected);
  end;

end;

function TFListaExportacionrReparto.BorrarExportacion(
  var clientesExportados: String): Boolean;
var
  qTemp,qTemp1: TQuery;
begin
  result:=False;
  clientesExportados := '0';
  
  TRY

  qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';

  qTemp1:= TQuery.Create(nil);
  qTemp1.DatabaseName := 'BaseDato';

  qTemp1.SQL.Clear;
  qTemp1.SQL.Add('DELETE  FROM REP_TOTALESPORITINERARIO WHERE CODIGOITINERARIO IN (SELECT DISTINCT CODIGOITINERARIO FROM REP_EXPORTACION WHERE TO_CHAR(FECHAPROGRAMADAREPARTO,''DD/MM/YYYY'')=:FECHAREPARTO AND ');
  qTemp1.SQL.Add('USUARIOULTIMAEXPORTACION=GETCODIGOUSUARIO AND CODIGOSEDEOPERATIVA=:CODIGOSEDEOPERATIVA ) ');
  qTemp1.ParamByName('CODIGOSEDEOPERATIVA').AsString := CodigoSedeOperativa;
  qTemp1.ParamByName('FECHAREPARTO').AsString := FechaReparto;
  qTemp1.ExecSQL;

  qTemp.SQL.Clear;
  qTemp.SQL.Add('DELETE FROM REP_EXPORTACION WHERE TO_CHAR(FECHAPROGRAMADAREPARTO,''DD/MM/YYYY'')=:FECHAREPARTO AND USUARIOULTIMAEXPORTACION=GETCODIGOUSUARIO AND CODIGOSEDEOPERATIVA=:CODIGOSEDEOPERATIVA');
  qTemp.ParamByName('CODIGOSEDEOPERATIVA').AsString := CodigoSedeOperativa;
  qTemp.ParamByName('FECHAREPARTO').AsString := FechaReparto;
  qTemp.ExecSQL;

  if qTemp.RowsAffected > 0 then
  begin
  Result := True;
  clientesExportados := IntToStr(qTemp.RowsAffected);
  end
  else
  Application.MessageBox(PChar('No ha sido posible realizar el borrado de la EXPORTACIÓN, No hay cliente para borrar.'),'SigCom', MB_ICONINFORMATION);


 finally

  qTemp.Close;
  qTemp.Free;
  qTemp1.close;
  qTemp1.Free;
 end;

end;

function TFListaExportacionrReparto.ExistenciaDeExportacion: Boolean;
var
  qTemp: TQuery;
begin
  result:=False;
  qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';
  qTemp.SQL.Clear;
  qTemp.SQL.Add('SELECT COUNT(*) AS CANTIDAD  FROM REP_EXPORTACION WHERE TO_CHAR(FECHAPROGRAMADAREPARTO,''DD/MM/YYYY'')=:FECHAREPARTO AND CODIGOSEDEOPERATIVA=:CODIGOSEDE');
  qTemp.ParamByName('FECHAREPARTO').AsString := FechaReparto;
  qTemp.ParamByName('CODIGOSEDE').AsString:= CodigoSedeOperativa;

  qTemp.open;

  if qTemp.FieldByName('CANTIDAD').AsInteger > 0 then
  begin
  Result := True;
  end;

  qTemp.Close;
  qTemp.Free;

end;

function TFListaExportacionrReparto.ClientesExportadosPorItinerario(
  CodigoItinerario: String): Integer;
var
  qTemp: TQuery;
begin
  result:=0;
  qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';
  qTemp.SQL.Clear;
  qTemp.SQL.Add('SELECT COUNT(*) AS CANTIDAD  FROM REP_EXPORTACION WHERE TO_CHAR(FECHAPROGRAMADAREPARTO,''DD/MM/YYYY'')=:FECHAREPARTO AND CODIGOITINERARIO=:CODIGOITINERARIO');
  qTemp.ParamByName('FECHAREPARTO').AsString := FechaReparto;
  qTemp.ParamByName('CODIGOITINERARIO').AsString :=  CodigoItinerario;
  qTemp.open;

  if qTemp.FieldByName('CANTIDAD').AsInteger > 0 then
  begin
  Result := qTemp.FieldByName('CANTIDAD').AsInteger;
  end;

  qTemp.Close;
  qTemp.Free;


end;

procedure TFListaExportacionrReparto.qListadoIinerariosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
qListadoIinerariosExportados.AsInteger := ClientesExportadosPorItinerario(qListadoIinerariosCODIGOITINERARIO.AsString);
qListadoIinerariosInfoComercial.AsInteger :=  ClientesConInfoComercial(qListadoIinerariosCODIGOITINERARIO.AsString);
qListadoIinerariosClientesNoExportados.AsInteger :=qListadoIinerariosCANTIDAD.AsInteger - qListadoIinerariosExportados.AsInteger;
end;

function TFListaExportacionrReparto.CambiarEstadoClientes: Boolean;
begin

end;

function TFListaExportacionrReparto.ClientesConInfoComercial(
  CodigoItinerario: String): Integer;
var
  qTemp: TQuery;
begin
  result:=0;
  qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';
  qTemp.SQL.Clear;
  qTemp.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM REP_RUTAITINERARIO RI ,REP_CLIENTESREPARTO RE ,REP_INFORMACIONCOMERCIAL IC ');
  qTemp.SQL.Add('WHERE CODIGOITINERARIO=:CODIGOITINERARIO   ');
  qTemp.SQL.Add('AND RE.CODIGOAPOYO=RI.CODIGOAPOYO AND to_char(RE.FECHA_PROGRAMADA_REPARTO,''DD/MM/YYYY'') =:FECHAREPARTO ');
  qTemp.SQL.Add('AND IC.CLAVE=RE.CODIGOCUENTA AND RE.FECHA_PROGRAMADA=IC.FECHA_LECTURA_PROGRAMADA');
  qTemp.ParamByName('FECHAREPARTO').AsString := FechaReparto;
  qTemp.ParamByName('CODIGOITINERARIO').AsString :=  CodigoItinerario;
  qTemp.open;

  if qTemp.FieldByName('CANTIDAD').AsInteger > 0 then
  begin
  Result := qTemp.FieldByName('CANTIDAD').AsInteger;
  end;

  qTemp.Close;
  qTemp.Free;



end;

function TFListaExportacionrReparto.ClientesInfoClientesCantidad(var Clientes,
  ClientesComercial: Integer): Boolean;
begin

Result := True;
qListadoIinerarios.First;
Clientes := 0;
ClientesComercial := 0;


while not  qListadoIinerarios.Eof  do
begin
 Clientes := Clientes + qListadoIinerariosCANTIDAD.AsInteger;
 ClientesComercial := ClientesComercial +qListadoIinerariosInfoComercial.AsInteger;

if not (Clientes = ClientesComercial) then
Result := False;


qListadoIinerarios.Next;
end;


end;


procedure TFListaExportacionrReparto.RecargarListados;
begin
qListadoIinerarios.Close;
qListadoIinerarios.ParamByName('CODIGOSEDE').AsString := CodigoSedeOperativa;
qListadoIinerarios.ParamByName('FECHAREPARTO').AsString := FechaReparto;
qListadoIinerarios.open;

end;

function TFListaExportacionrReparto.CambiarEstadoItinerario(CodigoEstadoItinerario : String): Boolean;
var
  qTemp: TQuery;
  ListadoP : TStringList;
begin
  result:=False;

  qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';
  ListadoP := TStringList.Create;


  qTemp.SQL.Clear;
  qTemp.SQL.Add('SELECT DISTINCT CODIGOITINERARIO FROM REP_EXPORTACION  WHERE TO_CHAR(FECHAPROGRAMADAREPARTO,''DD/MM/YYYY'')=:FECHAREPARTO  AND CODIGOSEDEOPERATIVA=:CODIGOSEDE ');
  qTemp.ParamByName('FECHAREPARTO').AsString := FechaReparto;
  qTemp.ParamByName('CODIGOSEDE').AsString:= CodigoSedeOperativa;
  qTemp.open;

  ListadoP.Clear;

  while not qTemp.Eof do
  Begin
  ListadoP.Add(qTemp.FieldByName('CODIGOITINERARIO').AsString);
  qTemp.Next;
  end;

  if ListadoP.Count>0 then
  begin
  qTemp.close;
  qTemp.SQL.clear;
  qTemp.SQL.Add('UPDATE REP_ITINERARIO SET CODIGOESTADOITINERARIO='+CodigoEstadoItinerario+' WHERE CODIGOITINERARIO IN ('+ListadoP.CommaText+')  ');
  qTemp.ExecSQL;

  if qTemp.RowsAffected > 0 then
  begin
  Result :=True;
  end;

  end
  else
  Result :=True;

  qTemp.Close;
  qTemp.Free;
  ListadoP.Free;

end;

function TFListaExportacionrReparto.ValidarDatosExportacion: Boolean;
begin
 Result := False;
 if qListadoIinerarios.Active then
 begin

 if qListadoIinerarios.RecordCount >0 then
 begin
 Result := True;
 end
 else
 Application.MessageBox(PChar('No hay información para realizar la acción, se debe realizar otro filtro, intente nuevamente.'),'SigCom',MB_ICONERROR);

 end
 else
 Application.MessageBox(PChar('No hay información para realizar la acción, se debe realizar otro filtro, intente nuevamente.'),'SigCom',MB_ICONERROR);

end;

procedure TFListaExportacionrReparto.tbDevolverClick(Sender: TObject);
var
Cantidad : String;
begin
  inherited;

  if ValidarListadoItinerarios then
  begin

   if Application.MessageBox
    (PChar('¿ Esta seguro que desea retornar al listado de reparto las cuentas de los itinerarios que no se EXPORTARON ?'+ char(13)+'Esta acción es irreversible, los clientes tendran que realizar todo el proceso de reparto nuevamente.'+char(13)+'Los clientes los encontrara en la pestaña (pendientes).'),
    'Confirmación', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
   begin

    qListadoIinerarios.First;
    while not qListadoIinerarios.Eof do
    begin

    if qListadoIinerariosClientesNoExportados.AsInteger >0 then
    if ConsultarEstadoItinerario(qListadoIinerariosCODIGOITINERARIO.AsString) then
    RemoverClientesParaExportacion(qListadoIinerariosCODIGOITINERARIO.AsString);

    qListadoIinerarios.Next;
    end;
      RecargarListados;
      Application.MessageBox(PChar('El proceso ha terminado. En el listado principal en la columna CLIENTES NO EXPORTADOS debe pasar a 0 para todos los itinerarios.'),
          'Información', MB_OK + MB_ICONINFORMATION+ MB_DEFBUTTON2);



   end;
  end;

end;

function TFListaExportacionrReparto.ValidarListadoItinerarios: Boolean;
begin
  Result := False;

 if qListadoIinerarios.Active then
 begin
  IF qListadoIinerarios.RecordCount > 0 then
   Result := True
  else
  Application.MessageBox(PChar('El filtro utilizado retorna ningun itinerario por lo tanto no es posible realizar la acción, realice otro filtro e intente nuevamente.'),
          'Error', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
 end
 else
  Application.MessageBox(PChar('No hay itinerarios en el listado, realice otro filtro e intente nuevamente.'),
          'Error', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);

end;


function TFListaExportacionrReparto.consultarEstadoItinerario(
  CodigoItinerario: String): Boolean;
var
  qTemp: TQuery;
begin
  result:=False;

  qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';



  qTemp.SQL.Clear;
  qTemp.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM REP_ITINERARIO WHERE CODIGOITINERARIO='+CodigoItinerario+' AND CODIGOESTADOITINERARIO=3');
  qTemp.open;

  if qTemp.FieldByName('CANTIDAD').asInteger > 0 then
  begin
  Result := True;
  end;


  qTemp.Close;
  qTemp.Free;

end;

function TFListaExportacionrReparto.RemoverClientesParaExportacion(
  CodigoItinerario: String): Boolean;
var
  qTemp: TQuery;
begin
  result:=False;

  qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';

  qTemp.SQL.Clear;
  qTemp.SQL.Add('SELECT  CR.CODIGOCUENTA,CR.CODIGOAPOYO,RI.OLCLIENTE,trunc(CR.FECHA_PROGRAMADA_REPARTO) AS FECHA_PROGRAMADA_REPARTO FROM REP_CLIENTESREPARTO CR, REP_RUTAITINERARIO RI, REP_ITINERARIO I');
  qTemp.SQL.Add('WHERE');
  qTemp.SQL.Add('RI.CODIGOAPOYO=CR.CODIGOAPOYO  ');
  qTemp.SQL.Add('AND CR.FECHA_PROGRAMADA_REPARTO=I.FECHAPROGRAMADAREPARTO  ');
  qTemp.SQL.Add('AND RI.CODIGOITINERARIO=I.CODIGOITINERARIO  ');
  qTemp.SQL.Add('AND I.FECHAPROGRAMADAREPARTO=CR.FECHA_PROGRAMADA_REPARTO');
  qTemp.SQL.Add('AND I.CODIGOITINERARIO=:codigoitinerario ');
  qTemp.SQL.Add('MINUS   ');
  qTemp.SQL.Add('SELECT CODIGOCUENTA,CODIGOAPOYO,OLCLIENTE,trunc(FECHAPROGRAMADAREPARTO) AS FECHA_PROGRAMADA_REPARTO FROM REP_EXPORTACION WHERE CODIGOITINERARIO=:codigoitinerario ');
  qTemp.ParamByName('CODIGOITINERARIO').AsString := CodigoItinerario;
  qTemp.open;

  qTemp.First;
  while not qTemp.Eof do
  begin
    if  revisarApoyo(qTemp.FieldByName('CODIGOCUENTA').AsString,qTemp.FieldByName('CODIGOAPOYO').AsString,qTemp.FieldByName('FECHA_PROGRAMADA_REPARTO').AsString) then
     RemoverFechaReparto(qTemp.FieldByName('CODIGOCUENTA').AsString,qTemp.FieldByName('FECHA_PROGRAMADA_REPARTO').AsString);


      qTemp.Next;
  end;

  qTemp.Close;
  qTemp.Free;


end;

function TFListaExportacionrReparto.revisarApoyo(CodigoCuenta,CodigoApoyo,
  FechaLectura: String): Boolean;
var
  qSql: TQuery;
begin
  Result := false;
  
  qSql:= TQuery.Create(nil);
  qSql.DatabaseName := 'BaseDato';
  qSql.SQL.Clear;
  qSql.SQL.Add('UPDATE REP_CLIENTESREPARTO SET CODIGOAPOYO=(SELECT CODIGOAPOYO FROM CLIENTESGD WHERE SGC_FUN_CONVERTIR_CLAVE(CODIGOCUENTA)='+CodigoCuenta+' AND CODIGOESTADOINFRAESTRUCTURA=1) WHERE CODIGOCUENTA='+CodigoCuenta+' AND to_char(FECHA_PROGRAMADA_REPARTO,''DD/MM/YYYY'')='''+FechaLectura+''' ');
  qSql.ExecSQL;

  if qSql.RowsAffected>0 then
  Result := True;


  qSql.Close;
  qSql.Free;


end;

function TFListaExportacionrReparto.RemoverFechaReparto(CodigoCuenta,
  FechaLectura: String): Boolean;
var
  qSql: TQuery;
begin
  Result:=False;

  qSql:= TQuery.Create(nil);
  qSql.DatabaseName := 'BaseDato';

  qSql.SQL.Clear;
  qSql.SQl.Add('UPDATE REP_CLIENTESREPARTO SET CODIGOESTADOCLIENTEREPARTO=2,FECHA_PROGRAMADA_REPARTO=NULL WHERE CODIGOCUENTA='+CodigoCuenta+' AND to_char(FECHA_PROGRAMADA_REPARTO,''DD/MM/YYYY'')='''+FechaLectura+''' ');
  qSql.ExecSQL;

  IF qSql.RowsAffected>0 THEN
  Result := True;

  qSql.Close;
  qSql.Free;

end;

procedure TFListaExportacionrReparto.CrearTotalesPorItinerario(
  CodigoItinerario: String);
var
  qSql: TQuery;
begin

  try
  qSql:= TQuery.Create(nil);
  qSql.DatabaseName := 'BaseDato';

  qSql.SQL.Clear;
  qSql.SQl.Add('INSERT INTO REP_TOTALESPORITINERARIO(CODIGOITINERARIO, FECHAREPARTO, CLIENTESREPARTO, FECHAPRIMERAREPARTO, FECHAULTIMOREPARTO, CLIENTESDEVUELTOS)  ');
  qSql.SQl.Add('VALUES('+CodigoItinerario+',TO_DATE('''+FechaReparto+''',''DD/MM/YYYY''),0,NULL,NULL,0) ');
  qSql.ExecSQL;

  finally
  qSql.Close;
  qSql.Free;
  end;

end;

function TFListaExportacionrReparto.GenerarTotales: Boolean;
var
  qTemp: TQuery;
begin
  result:=False;
  try
  qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';


  qTemp.SQL.Clear;
  qTemp.SQL.Add('SELECT DISTINCT CODIGOITINERARIO FROM REP_EXPORTACION  WHERE TO_CHAR(FECHAPROGRAMADAREPARTO,''DD/MM/YYYY'')=:FECHAREPARTO AND USUARIOULTIMAEXPORTACION=GETCODIGOUSUARIO  ');
  qTemp.ParamByName('FECHAREPARTO').AsString := FechaReparto;
  qTemp.open;



  while not qTemp.Eof do
  Begin
  CrearTotalesPorItinerario(qTemp.fieldbyName('CODIGOITINERARIO').AsString);
  Result := True;
  qTemp.Next;
  end;


  finally
  qTemp.Close;
  qTemp.Free;
  end;

end;

end.
