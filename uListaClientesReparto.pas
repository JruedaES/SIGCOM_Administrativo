unit uListaClientesReparto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, TeEngine, Series, TeeProcs, Chart, ComCtrls,
  ToolWin, RXDBCtrl, Grids, DBGrids, Mask, DBCtrls, ImgList;

type
  TfListaClienteReparto = class(TFdSgdListaBase)
    Panel55: TPanel;
    Panel22: TPanel;
    Label1_1: TLabel;
    GroupBox12: TGroupBox;
    sbFecha: TSpeedButton;
    sbGuardar: TSpeedButton;
    dbEditFecha: TDBEdit;
    DBGrid6: TDBGrid;
    GroupBox1: TGroupBox;
    sbFechaCierre: TSpeedButton;
    sbCerrar: TSpeedButton;
    dbeCerrarFecha: TDBEdit;
    Panel44: TPanel;
    iLista: TImageList;
    ImageList1: TImageList;
    OpenDialog1: TOpenDialog;
    qPendientes: TQuery;
    qPendientesFECHAPROGRAMADA: TDateTimeField;
    qPendientesFECHAREPARTO: TDateTimeField;
    qPendientesCODIGOSEDEOPERATIVA: TFloatField;
    qPendientesCUENTA: TFloatField;
    qPendientesTIPO: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    dsInactivos: TDataSource;
    qInactivos: TQuery;
    qInactivosFECHAPROGRAMADA: TDateTimeField;
    qInactivosFECHAREPARTO: TDateTimeField;
    qInactivosCODIGOSEDEOPERATIVA: TFloatField;
    qInactivosCUENTA: TFloatField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    qActivos: TQuery;
    qActivosFECHAPROGRAMADA: TDateTimeField;
    qActivosFECHAREPARTO: TDateTimeField;
    qActivosCODIGOSEDEOPERATIVA: TFloatField;
    qActivosCUENTA: TFloatField;
    qActivosTIPO: TStringField;
    qActivosNOMBRESEDEOPERATIVA: TStringField;
    qActivosESTADO: TStringField;
    dsActivos: TDataSource;
    qAprobados: TQuery;
    qAprobadosFECHAPROGRAMADA: TDateTimeField;
    qAprobadosFECHAREPARTO: TDateTimeField;
    qAprobadosCODIGOSEDEOPERATIVA: TFloatField;
    qAprobadosCUENTA: TFloatField;
    qAprobadosTIPO: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    dsAprobados: TDataSource;
    qReparto: TQuery;
    DateTimeField5: TDateTimeField;
    DateTimeField6: TDateTimeField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    dsPendientes: TDataSource;
    dsTotal: TDataSource;
    qTotal: TQuery;
    DateTimeField9: TDateTimeField;
    DateTimeField10: TDateTimeField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    dsReparto: TDataSource;
    SaveDialog1_1: TSaveDialog;
    qCiclo: TQuery;
    qCicloFECHA_REPARTO: TDateTimeField;
    qCicloESTADO: TStringField;
    qCicloCODIGOESTADOCICLOREPARTO: TFloatField;
    dsCiclo: TDataSource;
    Panel11: TPanel;
    ToolBar1: TToolBar;
    tbPendientes: TToolButton;
    tbImportar: TToolButton;
    pgClientes: TPageControl;
    Activos: TTabSheet;
    dbgActivos: TRxDBGrid;
    Pendientes: TTabSheet;
    dbgPendientes: TRxDBGrid;
    Aprobados: TTabSheet;
    dbgAprobados: TRxDBGrid;
    Reparto: TTabSheet;
    dbgReparto: TRxDBGrid;
    Inactivo: TTabSheet;
    dbgInactivo: TRxDBGrid;
    tbAprobar: TToolButton;
    tbInactivar: TToolButton;
    tbActivar: TToolButton;
    ToolButton1: TToolButton;
    CheckBox1: TCheckBox;
    ChartTotales: TChart;
    PieSeries4: TPieSeries;
    tbActivar2: TToolButton;
    StoredProc1: TStoredProc;
    qActivosINFOCOMERCIAL: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure LimpiarFiltro;
    procedure sbCerrarClick(Sender: TObject);
    procedure sbFechaCierreClick(Sender: TObject);
    function GetFechaHora: String;
    procedure sbGuardarClick(Sender: TObject);
    procedure sbFechaClick(Sender: TObject);
    procedure tbImportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PendientesShow(Sender: TObject);
    procedure ActivosExit(Sender: TObject);
    procedure PendientesExit(Sender: TObject);
    procedure PendientesHide(Sender: TObject);
    procedure ActivosHide(Sender: TObject);
    procedure AprobadosExit(Sender: TObject);
    procedure AprobadosHide(Sender: TObject);
    procedure RepartoExit(Sender: TObject);
    procedure RepartoHide(Sender: TObject);
    procedure tbAprobarClick(Sender: TObject);
    procedure pgClientesChange(Sender: TObject);
    function CambiarEstadoClientes(query: TQuery; estado: string;
      grid: TRxDBGrid): Boolean;
    procedure tbPendientesClick(Sender: TObject);
    procedure tbActivarClick(Sender: TObject);
    procedure tbInactivarClick(Sender: TObject);
    procedure DBGrid6CellClick(Column: TColumn);
    function ValidarFecha: Boolean;
    function AprobarClientes(cuenta: string; fechalectura: string; Var Cantidad : Integer): Boolean;
    function AprobarUnCliente(cuenta: string; fechalectura: string): Boolean;
    function DevolverClientesAprobados(cuenta: string;
      fechalectura: string): Boolean;
    function DevolverUnClienteAprobados(cuenta: string;
      fechalectura: string): Boolean;
    function ActivarClientesPendientes(cuenta: string;
      fechalectura: string): Integer;
    function ActivarClientesInactivos(cuenta: string;
      fechalectura: string): Integer;
    function PendienteClientesInactivos(cuenta: string;
      fechalectura: string): Integer;
    function PendienteClientesActivos(cuenta: string;
      fechalectura: string): Integer;
    function InactivarClientesActivos(cuenta: string;
      fechalectura: string): Integer;
    function InactivarClientesPendientes(cuenta: string;
      fechalectura: string): Integer;
    procedure dbEditFechaChange(Sender: TObject);
    procedure tbActivar2Click(Sender: TObject);
    procedure dbgActivosTitleClick(Column: TColumn);
    procedure dbgPendientesTitleClick(Column: TColumn);
    procedure dbgAprobadosTitleClick(Column: TColumn);
    procedure dbgRepartoTitleClick(Column: TColumn);
    procedure dbgInactivoTitleClick(Column: TColumn);
    function TotalErroneosImportacion(Bandera: Boolean): integer;
  private
    { Private declarations }
    vFile, destino, aptos, erroneos: TStringList;
    nActivos, nPendientes, nAprobados, nReparto, nInactivos: Integer;
    totalActivos, totalPendientes, totalAprobados, totalReparto,
      totalInactivos: Integer;
    function ConvertirCuenta(CodigoCuenta: Integer): Integer;

  public
    { Public declarations }
    Lista, ListaFrom, ListaRotulo, ListaOrden, ListaDatos: TStringList;
    BanderaFiltro: Boolean;
    procedure GenerarGrafica;
    Procedure Filtrar;
    function Totales(queryTotal: string): Integer;
    function SeleccionarCuentaListado(var Bandera: Boolean): String;
    function SeleccionarCuentaAprobados(var Bandera: Boolean): String;
    function ExistenciaDeCuentaEnFechaLectura (CodigoCuenta, FechaLectura : String): Boolean;
    function InsertarClienteRepartoEspecial(CodigoCuenta, FechaLectura : String): Boolean;
    function ExisteEnMaestroClientes(CodigoCuenta : String): Boolean;
    function ExisteInfoComercial(Fechalectura, Cuenta  : String) : Boolean;
    function InsertarListaClienteEspecial(cadena: String):Boolean;
    function TotalImportados(Bandera: Boolean): integer;
    procedure LimpiarTablaImportacion;

  end;

var
  fListaClienteReparto: TfListaClienteReparto;

implementation

uses uFormaFecha, uFIMPAdministrativo, uFormaEspere;

{$R *.DFM}

procedure TfListaClienteReparto.FormShow(Sender: TObject);
begin
  Filtrar;

  dbgActivos.setFocus;
  tbAprobar.Visible := true;
  tbActivar.Visible := false;
  tbInactivar.Visible := true;
  tbPendientes.Visible := true;
end;

procedure TfListaClienteReparto.FormActivate(Sender: TObject);
begin
  dbgActivos.setFocus;

end;

procedure TfListaClienteReparto.SBFiltrarClick(Sender: TObject);
begin
  Filtrar;
  BanderaFiltro := true;
end;

function TfListaClienteReparto.Totales(queryTotal: string): Integer;
var
  qTotal: TQuery;
begin
  qTotal := TQuery.Create(nil);
  if qTotal.active then
    qTotal.close;
  qTotal.DatabaseName := 'BaseDato';
  qTotal.SQL.Clear;
  qTotal.SQL.text := 'SELECT COUNT(*) as cantidad FROM (' + queryTotal + ')';
  qTotal.open;
  result := qTotal.FieldByName('cantidad').AsInteger;
  qTotal.close;
  qTotal.Free;
end;

procedure TfListaClienteReparto.Filtrar;
Var
  CadFrom, s: String;
  Valor: Integer;
begin
  Lista := GetFiltroReparto(ListaRotulo, ListaDatos, ListaFrom);
  If Lista <> Nil then
  begin
    qActivos.close;
    qPendientes.close;
    qAprobados.close;
    qReparto.close;
    qInactivos.close;
    LimpiarFiltro;
    qActivos.SQL.Insert(18, Lista.text);
    qPendientes.SQL.Insert(18, Lista.text);
    qAprobados.SQL.Insert(18, Lista.text);
    qReparto.SQL.Insert(18, Lista.text);
    qInactivos.SQL.Insert(18, Lista.text);
    qActivos.open;
    qPendientes.open;
    qAprobados.open;
    qReparto.open;
    qInactivos.open;
    totalActivos := Totales(qActivos.SQL.text);
    totalPendientes := Totales(qPendientes.SQL.text);
    totalAprobados := Totales(qAprobados.SQL.text);
    totalReparto := Totales(qReparto.SQL.text);
    totalInactivos := Totales(qInactivos.SQL.text);
    GenerarGrafica;
  end
end;

procedure TfListaClienteReparto.GenerarGrafica;
var
  SerieActivos, SeriePendientes, SerieAprobados, SerieReparto, SerieInactivo,
    SerieTotales: TPieSeries;
  RestoActivos, RestoPendientes, RestoAprobados, RestoReparto,
    RestoInactivo: Integer;
    Azul,Morado,Verde,Amarillo,rojo : TColor;
begin
  // --- colores ---
   Azul      := rgb(41,182,246);
   Morado    := rgb(171,71,188);
   Verde     := rgb(156,204,101);
   Amarillo  := rgb(255,238,88);
   rojo      := rgb(239,83,80);


  ChartTotales.RemoveAllSeries;
  SerieTotales := TPieSeries.Create(Self);
  SerieTotales.ParentChart := ChartTotales;
  SerieTotales.Add(totalActivos, 'Activos', Azul);
  SerieTotales.Add(totalPendientes, 'Pendientes', Amarillo);
  SerieTotales.Add(totalAprobados, 'Aprobados', Verde);
  SerieTotales.Add(totalReparto, 'Reparto', Morado);
  SerieTotales.Add(totalInactivos, 'Inactivos', rojo);

end;

function TfListaClienteReparto.SeleccionarCuentaListado
  (var Bandera: Boolean): String;
var
  BM: TBookMark;
  i: Integer;
  ListadoCuentas: TStringList;
begin
  Bandera := false;
  dbgActivos.Datasource.DataSet.DisableControls;

  ListadoCuentas := TStringList.Create;
  ListadoCuentas.Clear;
  qActivos.OnCalcFields := nil;

  if dbgActivos.selectedRows.Count > 0 then
  begin
    for i := 0 to dbgActivos.selectedRows.Count - 1 do
    begin

      qActivos.bookMark := dbgActivos.selectedRows.Items[i];
      ListadoCuentas.Add(qActivos.FieldByName('CUENTA').AsString + ',' +
        qActivos.FieldByName('FECHAPROGRAMADA').AsString);
    end;
    result := ListadoCuentas.CommaText;
    dbgActivos.UnselectAll;
    dbgActivos.Datasource.DataSet.EnableControls;
    Bandera := true;
  end
  else
    Application.MessageBox(Pchar('Se debe seleccionar al menos una cuenta'),
      'Error', MB_ICONERROR + MB_OK);

end;

procedure TfListaClienteReparto.LimpiarFiltro;
var
  nLineasExtra, i: byte;
begin
  nLineasExtra := qActivos.SQL.Count - 18;
  if nLineasExtra > 0 then
    for i := 1 to nLineasExtra do
    begin
      qActivos.SQL.delete(18);
      qPendientes.SQL.delete(18);
      qAprobados.SQL.delete(18);
      qReparto.SQL.delete(18);
      qInactivos.SQL.delete(18);
    end;
end;

procedure TfListaClienteReparto.sbCerrarClick(Sender: TObject);
var
  qUpdate, qBuscar: TQuery;
begin
  // if(qCiclo.active) then
  // qCiclo.close;

  if dbeCerrarFecha.text <> '' then
  begin
    qUpdate := TQuery.Create(nil);
    qBuscar := TQuery.Create(nil);
    qBuscar.DatabaseName := 'BaseDato';
    qBuscar.SQL.Clear;
    qBuscar.SQL.text := 'SELECT fecha_programada_reparto from rep_cicloreparto '
      + 'where fecha_programada_reparto= to_date(:fechareparto,''DD/MM/YYYY'') ';
    qBuscar.ParamByName('fechareparto').AsString := dbeCerrarFecha.text;
    if (qBuscar.active) then
      qBuscar.close;
    qBuscar.open;

    if not qBuscar.IsEmpty then
    begin
      if (qBuscar.active) then
        qBuscar.close;
      qBuscar.open;
      qCiclo.Locate('FECHA_REPARTO', (qCicloFECHA_REPARTO.AsString), []);
      if (qCicloCODIGOESTADOCICLOREPARTO.AsInteger = 1) then
      begin
        qUpdate.DatabaseName := 'BaseDato';
        qUpdate.SQL.Clear;
        qUpdate.SQL.Add
          ('update rep_cicloreparto  set codigoestadocicloreparto=2 WHERE FECHA_PROGRAMADA_REPARTO =to_date('''
          + dbeCerrarFecha.text + ''',''DD/MM/YYYY'') ');
        qUpdate.execSQL;
        qCiclo.close;
        qCiclo.open;
        Application.MessageBox(Pchar('El ciclo se ha cerrado correctamente'),
          Pchar('Información'), MB_OK + MB_ICONINFORMATION);
      end
      else
      begin
        Application.MessageBox(Pchar('El ciclo ya se encontraba cerrado '),
          Pchar('Información'), MB_OK + MB_ICONINFORMATION);
      end
    end
    else
    begin
      Application.MessageBox(Pchar('La fecha de reparto ingresada no existe'),
        Pchar('Información'), MB_OK + MB_ICONERROR);
      qCiclo.close;
      qCiclo.open;
    end;
  end
  else
  begin
    Application.MessageBox(Pchar('No se ha ingresado una fecha de reparto'),
      Pchar('Información'), MB_OK + MB_ICONERROR);
    qCiclo.close;
    qCiclo.open;
  end;

end;

procedure TfListaClienteReparto.sbFechaCierreClick(Sender: TObject);
begin
  sFecha := '';
  sFecha := GetFechaHora;
  if sFecha <> '' then
    dbeCerrarFecha.text := sFecha;

  qCiclo.Locate('FECHA_REPARTO', (dbeCerrarFecha.text), []);
end;

function TfListaClienteReparto.GetFechaHora: String;
begin
  fFormaFecha := TfFormaFecha.Create(Application);
  fFormaFecha.height := 291;
  if fFormaFecha.ShowModal = mrOk then
    result := DateTimetoStr(fFormaFecha.Date)
  else
    result := sFecha;
  fFormaFecha.Free;
end;

procedure TfListaClienteReparto.sbGuardarClick(Sender: TObject);
var
  qGuardar, qBuscar: TQuery;
begin
  if (qCiclo.active) then
    qCiclo.close;

  if dbEditFecha.text <> '' then
  begin
    qGuardar := TQuery.Create(nil);
    qBuscar := TQuery.Create(nil);
    qBuscar.DatabaseName := 'BaseDato';
    qBuscar.SQL.Clear;
    qBuscar.SQL.text := 'SELECT fecha_programada_reparto from rep_cicloreparto '
      + 'where fecha_programada_reparto= to_date(:fechareparto,''DD/MM/YYYY'') ';
    qBuscar.ParamByName('fechareparto').AsString := dbEditFecha.text;
    if (qBuscar.active) then
      qBuscar.close;
    qBuscar.open;
    if not qBuscar.IsEmpty then
    begin
      Application.MessageBox(Pchar('La fecha de reparto ingresada ya existe'),
        Pchar('Información'), MB_OK + MB_ICONERROR);
      dbEditFecha.Clear;
      qCiclo.close;
      qCiclo.open;
    end
    else
    begin
      if ValidarFecha = true then
      begin
        qGuardar.DatabaseName := 'BaseDato';
        qGuardar.SQL.Clear;
        qGuardar.SQL.Add
          ('insert into rep_cicloreparto (fecha_programada_reparto,codigoestadocicloreparto) VALUES (TO_DATE('''
          + dbEditFecha.text + ''',''DD/MM/YYYY''),1)');
        qGuardar.execSQL;
        qCiclo.close;
        qCiclo.open;
        Application.MessageBox(Pchar('Se ha creado una nueva fecha de reparto : ['+dbEditFecha.text+']'),
          Pchar('Información'), MB_OK + MB_ICONINFORMATION);
        dbEditFecha.Clear;
      end
    end;
  end
  else
  begin
    Application.MessageBox(Pchar('No se ha ingresado una fecha de reparto'),
      Pchar('Información'), MB_OK + MB_ICONERROR);
    qCiclo.close;
    qCiclo.open;
  end;
end;

procedure TfListaClienteReparto.sbFechaClick(Sender: TObject);
begin
  sFecha := '';
  sFecha := GetFechaHora;
  if sFecha <> '' then
    dbEditFecha.text := sFecha;
end;

procedure TfListaClienteReparto.tbImportarClick(Sender: TObject);
var
  cadena, cuenta, fechalectura,TextoError: string;
  i, j, total, apta, error: Integer;
  bandera: boolean;
begin
  if OpenDialog1.Execute then
  begin

    try
      vFile.LoadFromFile(OpenDialog1.FileName);

      total := vFile.Count;
      error := 0;
      apta:= 0;
       LimpiarTablaImportacion;
      if vfile.count >0 then
      begin
      for i := 0 to vFile.Count - 1 do
      begin
      cadena :=StringReplace(vFile[i],'"','',[rfReplaceAll]);
     // ShowMessage(inttostr(LENGTH(cadena)));
    if (length(trim(cadena))<=18) and (length(trim(cadena))>=15)  then bandera:=InsertarListaClienteEspecial(trim(cadena));
      end;
      fFormaEspere := TfFormaEspere.Create(Application);
fFormaEspere.ProgressBar1.Max := 2;
fFormaEspere.lbMotivo.Caption := 'Recargando información...';
fFormaEspere.Show;
fFormaEspere.Refresh;
fFormaEspere.ProgressBar1.Position := 1;
fFormaEspere.Refresh;

  StoredProc1.Prepare;
   StoredProc1.ExecProc;
fFormaEspere.lbMotivo.Caption := 'Importando datos...';
fFormaEspere.ProgressBar1.Position := 2;
fFormaEspere.Refresh;


fFormaEspere.Free;


      apta := TotalImportados(true);
      error := TotalErroneosImportacion(true)
      end
      else Application.MessageBox(Pchar('El archivo se encuentra vacío '), Pchar('Información'), MB_OK + MB_ICONINFORMATION);
    finally

    if error>0 then
    TextoError := ' y '+InttoStr(error)+' ya se encuentran para la fecha de lectura o no esta registrada en el maestro de Clientes.'
    else
    TextoError := ' ';

      Application.MessageBox(Pchar('Se han cargado ' + inttostr(apta) +
        ' Cuentas especiales'+TextoError), Pchar('Información'), MB_OK + MB_ICONINFORMATION);
    end;
     LimpiarTablaImportacion;
  end;

end;

procedure TfListaClienteReparto.FormCreate(Sender: TObject);
begin
  destino := TStringList.Create;
  vFile := TStringList.Create;
  qCiclo.open;
  Lista := TStringList.Create;
  ListaFrom := TStringList.Create;
  ListaRotulo := TStringList.Create;
  ListaDatos := TStringList.Create;
  ListaOrden := TStringList.Create;
  BanderaFiltro := false;
end;

procedure TfListaClienteReparto.PendientesShow(Sender: TObject);
begin
  qPendientes.close;
  qPendientes.open;
end;

procedure TfListaClienteReparto.ActivosExit(Sender: TObject);
begin
  qActivos.close;

end;

procedure TfListaClienteReparto.PendientesExit(Sender: TObject);
begin
  qPendientes.close;
end;

procedure TfListaClienteReparto.PendientesHide(Sender: TObject);
begin
  qPendientes.close;
end;

procedure TfListaClienteReparto.ActivosHide(Sender: TObject);
begin
  qActivos.close;
end;

procedure TfListaClienteReparto.AprobadosExit(Sender: TObject);
begin
  qAprobados.close;
end;

procedure TfListaClienteReparto.AprobadosHide(Sender: TObject);
begin
  qAprobados.close;
end;

procedure TfListaClienteReparto.RepartoExit(Sender: TObject);
begin
  qReparto.close;
end;

procedure TfListaClienteReparto.RepartoHide(Sender: TObject);
begin
  qReparto.close;
end;

procedure TfListaClienteReparto.tbAprobarClick(Sender: TObject);
var
  Listacuentas, registro: TStringList;
  Bandera: Boolean;
  i,CuentasAfectadas: Integer;
  cuenta, fechalectura, cadena, TextoModificado: string;
begin
 CuentasAfectadas := 0;
if Application.MessageBox
        (Pchar('Esta seguro que desea aprobar las cuentas seleccionadas para la fecha: '+dbEditFecha.text+' '),
        'Confirmación', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
begin
  if qCicloESTADO.AsString = 'ABIERTO' then
  begin

    if not CheckBox1.Checked then
    begin
      Listacuentas := TStringList.Create;
      Listacuentas.CommaText := SeleccionarCuentaListado(Bandera);
      for i := 0 to Listacuentas.Count - 1 do
      begin
        cadena := Listacuentas.Strings[i];
        registro := TStringList.Create;
        ExtractStrings([','], [], Pchar(cadena), registro);
        cuenta := registro.Strings[0];
        fechalectura := registro.Strings[1];
       IF AprobarUnCliente(cuenta, fechalectura) THEN
       CuentasAfectadas := CuentasAfectadas+1;

      end;
    end
    else
    begin
      AprobarClientes(qActivosCUENTA.AsString,
        qActivosFECHAPROGRAMADA.AsString,CuentasAfectadas);

    end;
    TextoModificado := qActivos.SQL[18];

    qActivos.SQL[9] := ' rep_clientesreparto r, ';
    qActivos.OnCalcFields := nil;
    qActivos.close;
    qActivos.open;
    qAprobados.close;
    qAprobados.open;
    totalActivos := Totales(qActivos.SQL.text);
    totalPendientes := Totales(qPendientes.SQL.text);
    totalAprobados := Totales(qAprobados.SQL.text);
    totalReparto := Totales(qReparto.SQL.text);
    totalInactivos := Totales(qInactivos.SQL.text);
    GenerarGrafica;
    Application.MessageBox
      (Pchar('Se han aprobado '+IntToStr(CuentasAfectadas)+' clientes para proceso de reparto'),
      Pchar('Información'), MB_OK + MB_ICONINFORMATION);
  end
  else
  begin
    Application.MessageBox
      (Pchar('Fecha de reparto errónea, Asegúrese de haber seleccionado una fecha de reparto Abierta  '),
      Pchar('Información'), MB_OK + MB_ICONERROR);
  end;
  end
      else
      begin
        raise Exception.Create('Operación cancelada');
      end;
end;

procedure TfListaClienteReparto.pgClientesChange(Sender: TObject);
begin
  if pgClientes.ActivePage = Activos then
  begin
    qActivos.close;
    qActivos.open;
    tbAprobar.Visible := true;
    tbActivar.Visible := false;
    tbInactivar.Visible := true;
    tbPendientes.Visible := true;
    tbImportar.Visible := true;
    CheckBox1.Checked := false;
  end
  else if pgClientes.ActivePage = Pendientes then
  begin
    qPendientes.close;
    qPendientes.open;
    tbAprobar.Visible := false;
    tbActivar.Visible := true;
    tbInactivar.Visible := true;
    tbPendientes.Visible := false;
    tbImportar.Visible := false;
    CheckBox1.Checked := false;
  end
  else if pgClientes.ActivePage = Aprobados then
  begin
    qAprobados.close;
    qAprobados.open;
    tbAprobar.Visible := false;
    tbActivar.Visible := false;
    tbInactivar.Visible := false;
    tbPendientes.Visible := false;
    tbImportar.Visible := false;
    CheckBox1.Checked := false;
    // tbActivar2.Visible:=true;
  end
  else if pgClientes.ActivePage = Reparto then
  begin
    qReparto.close;
    qReparto.open;
    tbAprobar.Visible := false;
    tbActivar.Visible := false;
    tbInactivar.Visible := false;
    tbPendientes.Visible := false;
    tbImportar.Visible := false;
    CheckBox1.Checked := false;
  end
  else if pgClientes.ActivePage = Inactivo then
  begin
    qInactivos.close;
    qInactivos.open;
    tbAprobar.Visible := false;
    tbActivar.Visible := true;
    tbInactivar.Visible := false;
    tbPendientes.Visible := true;
    tbImportar.Visible := false;
    CheckBox1.Checked := false;
  end
end;

function TfListaClienteReparto.CambiarEstadoClientes(query: TQuery;
  estado: string; grid: TRxDBGrid): Boolean;
var
  ListadoCuentas, registro, Listacuentas: TStringList;
  i, j, canti: Integer;
  cuenta, fechalectura, cadena: string;
  qUpdate: TQuery;
  BM: TBookMark;
begin
    grid.Datasource.DataSet.DisableControls;
    ListadoCuentas := TStringList.Create;
    Listacuentas := TStringList.Create;
    canti := 0;
    ListadoCuentas.Clear;
    if query = qActivos then
      query.OnCalcFields := nil;
    qUpdate := TQuery.Create(nil);
    qUpdate.DatabaseName := 'BaseDato';
  if (grid.selectedRows.Count > 0)  and (not CheckBox1.Checked ) then
    begin
      for i := 0 to grid.selectedRows.Count - 1 do
      begin
        query.bookMark := grid.selectedRows.Items[i];
        ListadoCuentas.Add(query.FieldByName('CUENTA').AsString + ',' +
          query.FieldByName('FECHAPROGRAMADA').AsString);
        canti := canti + 1;
      end;
      result := true;
      grid.UnselectAll;
      grid.Datasource.DataSet.EnableControls;
      if Application.MessageBox
        (Pchar('Esta seguro que desea cambiar el estado de la(s) cuenta(s) seleccionadas '),
        'Confirmación', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
      begin
        for j := 0 to ListadoCuentas.Count - 1 do
        begin
          cadena := ListadoCuentas.Strings[j];
          registro := TStringList.Create;
          ExtractStrings([','], [], Pchar(cadena), registro);
          cuenta := registro.Strings[0];
          fechalectura := registro.Strings[1];
          if estado = 'pendiente' then
          begin
            qUpdate.SQL.Add
              ('update rep_clientesreparto  set codigoestadoclientereparto=2 WHERE CODIGOCUENTA='
              + cuenta + ' AND FECHA_PROGRAMADA =to_date(''' + fechalectura +
              ''',''DD/MM/YYYY'')');
          end
          else if estado = 'activo' then
          begin
            qUpdate.SQL.Add
              ('update rep_clientesreparto  set codigoestadoclientereparto=1 WHERE CODIGOCUENTA='
              + cuenta + ' AND FECHA_PROGRAMADA =to_date(''' + fechalectura +
              ''',''DD/MM/YYYY'')');
          end
          else if estado = 'inactivo' then
          begin
            qUpdate.SQL.Add
              ('update rep_clientesreparto  set codigoestadoclientereparto=5 WHERE CODIGOCUENTA='
              + cuenta + ' AND FECHA_PROGRAMADA =to_date(''' + fechalectura +
              ''',''DD/MM/YYYY'')');
          end;
          qUpdate.execSQL;
        qUpdate.SQL.Clear;
        registro.Free;
        end;
        
        query.close;
        query.open;
      end
      else
      begin
        raise Exception.Create('Operación cancelada');
      end;
    end
    else if (estado = 'activo') and (pgClientes.ActivePage = Pendientes) then
    begin
     canti:= ActivarClientesPendientes(qPendientesCUENTA.AsString,
        qPendientesFECHAPROGRAMADA.AsString);
    end
    else if (estado = 'activo') and (pgClientes.ActivePage = Inactivo) then
    begin
    canti:=  ActivarClientesInactivos(qInactivosCUENTA.AsString,
        qInactivosFECHAPROGRAMADA.AsString);
    end
    else if (estado = 'pendiente') and (pgClientes.ActivePage = Inactivo) then
    begin
     canti:= PendienteClientesInactivos(qInactivosCUENTA.AsString,
        qInactivosFECHAPROGRAMADA.AsString);
    end
    else if (estado = 'pendiente') and (pgClientes.ActivePage = Activos) then
    begin
     canti:= PendienteClientesActivos(qActivosCUENTA.AsString,
        qActivosFECHAPROGRAMADA.AsString);
    end
    else if (estado = 'inactivo') and (pgClientes.ActivePage = Activos) then
    begin
      canti:=InactivarClientesActivos(qActivosCUENTA.AsString,
        qActivosFECHAPROGRAMADA.AsString);
    end
    else if (estado = 'inactivo') and (pgClientes.ActivePage = Pendientes) then
    begin
     canti:= InactivarClientesPendientes(qPendientesCUENTA.AsString,
        qPendientesFECHAPROGRAMADA.AsString);
    end
    else
    begin
    Application.MessageBox(Pchar('Se debe seleccionar al menos una cuenta.'),
      'Error', MB_ICONERROR + MB_OK);
    end;

    qPendientes.close;
    qPendientes.open;
    qInactivos.close;
    qInactivos.open;
    qActivos.OnCalcFields := NIL;
    qActivos.close;
    qActivos.open;
    totalActivos := Totales(qActivos.SQL.text);
    totalPendientes := Totales(qPendientes.SQL.text);
    totalAprobados := Totales(qAprobados.SQL.text);
    totalReparto := Totales(qReparto.SQL.text);
    totalInactivos := Totales(qInactivos.SQL.text);
    Application.MessageBox(Pchar('Se han modificado el estado a : ' + IntToStr(canti) +
      ' cuentas'), 'Información', MB_OK + MB_ICONINFORMATION);
    GenerarGrafica;
   // if query = qActivos then
    //  query.OnCalcFields := qActivosCalcFields;

end;

procedure TfListaClienteReparto.tbPendientesClick(Sender: TObject);
var
  estado: Boolean;
begin
  inherited;
  if pgClientes.ActivePage = Inactivo then
  begin
    estado := CambiarEstadoClientes(qInactivos, 'pendiente', dbgInactivo);
    dbgInactivo.Refresh;
  end
  else if pgClientes.ActivePage = Activos then
  begin
    estado := CambiarEstadoClientes(qActivos, 'pendiente', dbgActivos);
    dbgActivos.Refresh;
  end;
  { if estado=true then
    begin
    Application.MessageBox(Pchar('Las cuentas seleccionadas ahora se encuentran Pendientes'), 'Información', MB_OK+MB_ICONINFORMATION);
    end }

end;

procedure TfListaClienteReparto.tbActivarClick(Sender: TObject);
var
  estado: Boolean;
begin
  inherited;
  if pgClientes.ActivePage = Inactivo then
  begin
    estado := CambiarEstadoClientes(qInactivos, 'activo', dbgInactivo);
    dbgInactivo.Refresh;
  end
  else if pgClientes.ActivePage = Pendientes then
  begin
    estado := CambiarEstadoClientes(qPendientes, 'activo', dbgPendientes);
    dbgPendientes.Refresh;
  end;

end;

procedure TfListaClienteReparto.tbInactivarClick(Sender: TObject);
var
  estado: Boolean;
begin
  inherited;
  if pgClientes.ActivePage = Activos then
  begin
    estado := CambiarEstadoClientes(qActivos, 'inactivo', dbgActivos);
    dbgInactivo.Refresh;
  end
  else if pgClientes.ActivePage = Pendientes then
  begin
    estado := CambiarEstadoClientes(qPendientes, 'inactivo', dbgPendientes);
    dbgPendientes.Refresh;
  end;
end;

procedure TfListaClienteReparto.DBGrid6CellClick(Column: TColumn);
begin
  inherited;
  dbeCerrarFecha.text := qCicloFECHA_REPARTO.AsString;
end;

function TfListaClienteReparto.ValidarFecha: Boolean;
var
  qry: TQuery;
  diferencia: Integer;
begin
  inherited;
  if dbEditFecha.text <> '' then
  begin
    qry := TQuery.Create(nil);
    diferencia := 0;
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Clear;
    qry.SQL.Add('SELECT EXTRACT (YEAR FROM TO_DATE(''' + dbEditFecha.text +
      ''',''DD/MM/YYYY'')) AS SELECCIONADO,');
    qry.SQL.Add
      ('EXTRACT(YEAR FROM SYSDATE) AS ACTUAL, (TRUNC(SYSDATE) - TO_DATE(''' +
      dbEditFecha.text + ''',''DD/MM/YYYY'')) AS DIF FROM DUAL');
    qry.open;
    diferencia := qry.FieldByName('DIF').AsInteger;
    if diferencia > 0 then
    begin
      Application.MessageBox(Pchar('La Fecha de reparto  ['+dbEditFecha.text+'] no es valida'), 'Error',
        MB_OK + MB_ICONERROR);
      dbEditFecha.OnChange := nil;
      dbEditFecha.Clear;
      dbEditFecha.OnChange := dbEditFechaChange;

    end;
    result := true;
  end;

end;

function TfListaClienteReparto.AprobarClientes(cuenta: string;
  fechalectura: string; var Cantidad : Integer): Boolean;
var
  qUpdate: TQuery;
  TextoModificado: String;
  TextoEspecial: String;
begin
  TextoEspecial :=
    '  AND ( to_char(to_date(r.fecha_programada_reparto, ''DD/MM/YYYY''), ''MM/YYYY'') <> to_char(TO_DATE('''
    + qCicloFECHA_REPARTO.AsString +
    ''', ''DD/MM/YYYY''), ''MM/YYYY'') OR r.fecha_programada_reparto IS NULL )';
  TextoModificado := qActivos.SQL[18];
  TextoModificado := StringReplace(TextoModificado, 's.', 'r.',
    [rfReplaceAll, rfIgnoreCase]);
  qActivos.SQL[18] := ' ';
  qActivos.SQL[18] := TextoModificado + ' ' + TextoEspecial;
  qActivos.SQL[9] := ' ';

  qUpdate := TQuery.Create(nil);
  qUpdate.DatabaseName := 'BaseDato';

  qUpdate.SQL.Clear;
  qUpdate.SQL.Add
    ('update rep_clientesreparto r  set r.codigoestadoclientereparto=3, ');
  qUpdate.SQL.Add(' r.FECHA_PROGRAMADA_REPARTO =to_date(''' +
    qCicloFECHA_REPARTO.AsString + ''',''DD/MM/YYYY'') ');
  qUpdate.SQL.Add(' WHERE  exists (');
  qUpdate.SQL.Add(qActivos.text + ')');

 try
 qUpdate.execSQL;
 Cantidad :=qUpdate.RowsAffected;
 finally
 
  qUpdate.Close;
  qUpdate.Free;
 end;


end;

function TfListaClienteReparto.AprobarUnCliente(cuenta,
  fechalectura: string): Boolean;
var
  qUpdate: TQuery;
begin
  Result := False;
TRY

  qUpdate := TQuery.Create(nil);
  qUpdate.DatabaseName := 'BaseDato';

  qUpdate.SQL.Clear;
  qUpdate.SQL.Add
    ('update rep_clientesreparto r  set r.codigoestadoclientereparto=3, ');
  qUpdate.SQL.Add(' r.FECHA_PROGRAMADA_REPARTO =to_date(''' +
    qCicloFECHA_REPARTO.AsString + ''',''DD/MM/YYYY'')  ');
  qUpdate.SQL.Add(' WHERE CODIGOCUENTA= ' + cuenta +
    ' AND FECHA_PROGRAMADA=to_date(''' + fechalectura + ''',''DD/MM/YYYY'') ');
  qUpdate.SQL.Add(' AND CODIGOCUENTA  ');
  qUpdate.SQL.Add('  NOT IN (     ');
  qUpdate.SQL.Add('          SELECT     ');
  qUpdate.SQL.Add('              CODIGOCUENTA     ');
  qUpdate.SQL.Add('           FROM     ');
  qUpdate.SQL.Add('              REP_CLIENTESREPARTO   ');
  qUpdate.SQL.Add('          WHERE      ');
  qUpdate.SQL.Add('              CODIGOCUENTA =  ' + cuenta + '  ');
  qUpdate.SQL.Add
    ('              AND TO_CHAR(TO_DATE(TO_CHAR(FECHA_PROGRAMADA_REPARTO,''DD/MM/YYYY''),''DD/MM/YYYY''), ''MM/YYYY'') = TO_CHAR(TO_DATE('''
    + qCicloFECHA_REPARTO.AsString + ''',''DD/MM/YYYY''), ''MM/YYYY'') )');
  qUpdate.execSQL;

  IF qUpdate.RowsAffected>0 then
  Result := True;

 FINALLY

 qUpdate.fREE;
 END;

end;

procedure TfListaClienteReparto.dbEditFechaChange(Sender: TObject);
begin
  inherited;
  ValidarFecha;
end;

function TfListaClienteReparto.DevolverClientesAprobados(cuenta,
  fechalectura: string): Boolean;
var
  qUpdate: TQuery;
  TextoModificado: String;
begin
  TextoModificado := qActivos.SQL[18];
  TextoModificado := StringReplace(TextoModificado, 's.', 'r.',
    [rfReplaceAll, rfIgnoreCase]);
  qAprobados.SQL[18] := ' ';
  qAprobados.SQL[18] := TextoModificado;
  qAprobados.SQL[9] := ' ';
  qUpdate := TQuery.Create(nil);
  qUpdate.DatabaseName := 'BaseDato';
  qUpdate.SQL.Clear;
  qUpdate.SQL.Add
    ('update rep_clientesreparto r  set r.codigoestadoclientereparto=1, ');
  qUpdate.SQL.Add(' r.FECHA_PROGRAMADA_REPARTO = null ');
  qUpdate.SQL.Add(' WHERE  exists (');
  qUpdate.SQL.Add(qActivos.text + ')');
  qUpdate.execSQL;

end;

function TfListaClienteReparto.DevolverUnClienteAprobados(cuenta,
  fechalectura: string): Boolean;
var
  qUpdate: TQuery;
begin
  qUpdate := TQuery.Create(nil);
  qUpdate.DatabaseName := 'BaseDato';
  qUpdate.SQL.Clear;
  qUpdate.SQL.Add
    ('update rep_clientesreparto r  set r.codigoestadoclientereparto=3, ');
  qUpdate.SQL.Add(' r.FECHA_PROGRAMADA_REPARTO =to_date(''' +
    qCicloFECHA_REPARTO.AsString + ''',''DD/MM/YYYY'') WHERE CODIGOCUENTA= ' +
    cuenta + ' AND FECHA_PROGRAMADA=to_date(''' + fechalectura +
    ''',''DD/MM/YYYY'')');
  qUpdate.execSQL;

end;

procedure TfListaClienteReparto.tbActivar2Click(Sender: TObject);
var
  Listacuentas, registro: TStringList;
  Bandera: Boolean;
  i: Integer;
  cuenta, fechalectura, cadena, TextoModificado: string;
begin
  {if not CheckBox1.Checked then
  begin
    Listacuentas := TStringList.Create;
    Listacuentas.CommaText := SeleccionarCuentaAprobados(Bandera);
    for i := 0 to Listacuentas.Count - 1 do
    begin
      cadena := Listacuentas.Strings[i];
      registro := TStringList.Create;
      ExtractStrings([','], [], Pchar(cadena), registro);
      cuenta := registro.Strings[0];
      fechalectura := registro.Strings[1];
      DevolverUnClienteAprobados(cuenta, fechalectura);
    end;
  end
  else
  begin
    DevolverClientesAprobados(qAprobadosCUENTA.AsString,
      qAprobadosFECHAPROGRAMADA.AsString);
  end;
  TextoModificado := qActivos.SQL[18];
  qActivos.SQL[9] := ' rep_clientesreparto r, ';
  qActivos.OnCalcFields := nil;
  qActivos.close;
  qActivos.open;
  qActivos.OnCalcFields := qActivosCalcFields;
  qAprobados.close;
  qAprobados.open;
  totalActivos := Totales(qActivos.SQL.text);
  totalPendientes := Totales(qPendientes.SQL.text);
  totalAprobados := Totales(qAprobados.SQL.text);
  totalReparto := Totales(qReparto.SQL.text);
  totalInactivos := Totales(qInactivos.SQL.text);
  GenerarGrafica;
  Application.MessageBox(Pchar('Se han activado los clientes'),
    Pchar('Información'), MB_OK + MB_ICONINFORMATION); }
end;

function TfListaClienteReparto.SeleccionarCuentaAprobados
  (var Bandera: Boolean): String;
var
  BM: TBookMark;
  i: Integer;
  ListadoCuentas: TStringList;
begin
  Bandera := false;
  dbgAprobados.Datasource.DataSet.DisableControls;

  ListadoCuentas := TStringList.Create;
  ListadoCuentas.Clear;

  if dbgAprobados.selectedRows.Count > 0 then
  begin
    for i := 0 to dbgAprobados.selectedRows.Count - 1 do
    begin

      qAprobados.bookMark := dbgAprobados.selectedRows.Items[i];
      ListadoCuentas.Add(qAprobados.FieldByName('CUENTA').AsString + ',' +
        qAprobados.FieldByName('FECHAPROGRAMADA').AsString);
    end;
    result := ListadoCuentas.CommaText;
    dbgAprobados.UnselectAll;
    dbgAprobados.Datasource.DataSet.EnableControls;
    Bandera := true;
  end
  else
    Application.MessageBox(Pchar('Se debe seleccionar al menos una cuenta'),
      'Error', MB_ICONERROR + MB_OK);

end;

function TfListaClienteReparto.ActivarClientesPendientes(cuenta,
  fechalectura: string): Integer;
var
  qUpdate: TQuery;
  TextoModificado: String;
begin
if Application.MessageBox
        (Pchar('Esta seguro que desea cambiar el estado de la(s) cuenta(s) seleccionadas '),
        'Confirmación', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
      begin
  TextoModificado := qPendientes.SQL[18];
  TextoModificado := StringReplace(TextoModificado, 's.', 'r.',
    [rfReplaceAll, rfIgnoreCase]);
  qPendientes.SQL[18] := ' ';
  qPendientes.SQL[18] := TextoModificado;
  qPendientes.SQL[9] := ' ';
  qUpdate := TQuery.Create(nil);
  qUpdate.DatabaseName := 'BaseDato';
  qUpdate.SQL.Clear;
  qUpdate.SQL.Add
    ('update rep_clientesreparto r  set r.codigoestadoclientereparto=1 ');
  qUpdate.SQL.Add(' WHERE  exists (');
  qUpdate.SQL.Add(qPendientes.text + ')');
  qUpdate.execSQL;
  TextoModificado := qActivos.SQL[18];

    qPendientes.SQL[9] := ' rep_clientesreparto r, ';
   dbgPendientes.Refresh;
   Result :=qUpdate.RowsAffected;
   end
   else
      begin
        raise Exception.Create('Operación cancelada');
      end;
end;

function TfListaClienteReparto.ActivarClientesInactivos(cuenta,
  fechalectura: string): Integer;
var
  qUpdate: TQuery;
  TextoModificado: String;
begin
if Application.MessageBox
        (Pchar('Esta seguro que desea cambiar el estado de la(s) cuenta(s) seleccionadas '),
        'Confirmación', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
      begin
  TextoModificado := qInactivos.SQL[18];
  TextoModificado := StringReplace(TextoModificado, 's.', 'r.',
    [rfReplaceAll, rfIgnoreCase]);
  qInactivos.SQL[18] := ' ';
  qInactivos.SQL[18] := TextoModificado;
  qInactivos.SQL[9] := ' ';
  qUpdate := TQuery.Create(nil);
  qUpdate.DatabaseName := 'BaseDato';
  qUpdate.SQL.Clear;
  qUpdate.SQL.Add
    ('update rep_clientesreparto r  set r.codigoestadoclientereparto=1 ');
  qUpdate.SQL.Add(' WHERE  exists (');
  qUpdate.SQL.Add(qInactivos.text + ')');
  qUpdate.execSQL;
  TextoModificado := qInactivos.SQL[18];

    qInactivos.SQL[9] := ' rep_clientesreparto r, ';
    dbgInactivo.Refresh;
    Result :=qUpdate.RowsAffected;
    end
   else
      begin
        raise Exception.Create('Operación cancelada');
      end;
end;

function TfListaClienteReparto.PendienteClientesActivos(cuenta,
  fechalectura: string): Integer;
var
  qUpdate: TQuery;
  TextoModificado: String;
begin
if Application.MessageBox
        (Pchar('Esta seguro que desea cambiar el estado de la(s) cuenta(s) seleccionadas '),
        'Confirmación', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
 begin
  TextoModificado := qActivos.SQL[18];
  TextoModificado := StringReplace(TextoModificado, 's.', 'r.',
    [rfReplaceAll, rfIgnoreCase]);
  qActivos.SQL[18] := ' ';
  qActivos.SQL[18] := TextoModificado;
  qActivos.SQL[9] := ' ';
  qUpdate := TQuery.Create(nil);
  qUpdate.DatabaseName := 'BaseDato';
  qUpdate.SQL.Clear;
  qUpdate.SQL.Add
    ('update rep_clientesreparto r  set r.codigoestadoclientereparto=2 ');
  qUpdate.SQL.Add(' WHERE  exists (');
  qUpdate.SQL.Add(qActivos.text + ')');
  qUpdate.execSQL;
  TextoModificado := qActivos.SQL[18];
  qActivos.SQL[9] := ' rep_clientesreparto r, ';
  dbgActivos.Refresh;
  Result :=qUpdate.RowsAffected;
 end
   else
      begin
        raise Exception.Create('Operación cancelada');
      end;
end;

function TfListaClienteReparto.PendienteClientesInactivos(cuenta,
  fechalectura: string): Integer;
var
  qUpdate: TQuery;
  TextoModificado: String;
begin
if Application.MessageBox
        (Pchar('Esta seguro que desea cambiar el estado de la(s) cuenta(s) seleccionadas '),
        'Confirmación', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
 begin
  TextoModificado := qInactivos.SQL[18];
  TextoModificado := StringReplace(TextoModificado, 's.', 'r.',
    [rfReplaceAll, rfIgnoreCase]);
  qInactivos.SQL[18] := ' ';
  qInactivos.SQL[18] := TextoModificado;
  qInactivos.SQL[9] := ' ';
  qUpdate := TQuery.Create(nil);
  qUpdate.DatabaseName := 'BaseDato';
  qUpdate.SQL.Clear;
  qUpdate.SQL.Add
    ('update rep_clientesreparto r  set r.codigoestadoclientereparto=2 ');
  qUpdate.SQL.Add(' WHERE  exists (');
  qUpdate.SQL.Add(qInactivos.text + ')');
  qUpdate.execSQL;
  TextoModificado := qInactivos.SQL[18];
  qInactivos.SQL[9] := ' rep_clientesreparto r, ';
  dbgInactivo.Refresh;
  Result :=qUpdate.RowsAffected;
   end
   else
      begin
        raise Exception.Create('Operación cancelada');
      end;
end;

function TfListaClienteReparto.InactivarClientesActivos(cuenta,
  fechalectura: string): Integer;
var
  qUpdate: TQuery;
  TextoModificado: String;
begin
if Application.MessageBox
        (Pchar('Esta seguro que desea cambiar el estado de la(s) cuenta(s) seleccionadas '),
        'Confirmación', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
 begin
  TextoModificado := qActivos.SQL[18];
  TextoModificado := StringReplace(TextoModificado, 's.', 'r.',
    [rfReplaceAll, rfIgnoreCase]);
  qActivos.SQL[18] := ' ';
  qActivos.SQL[18] := TextoModificado;
  qActivos.SQL[9] := ' ';
  qUpdate := TQuery.Create(nil);
  qUpdate.DatabaseName := 'BaseDato';
  qUpdate.SQL.Clear;
  qUpdate.SQL.Add
    ('update rep_clientesreparto r  set r.codigoestadoclientereparto=5 ');
  qUpdate.SQL.Add(' WHERE  exists (');
  qUpdate.SQL.Add(qActivos.text + ')');
  qUpdate.execSQL;
  TextoModificado := qActivos.SQL[18];
  qActivos.SQL[9] := ' rep_clientesreparto r, ';
  dbgActivos.Refresh;
  Result :=qUpdate.RowsAffected;
  end
   else
      begin
        raise Exception.Create('Operación cancelada');
      end;
end;

function TfListaClienteReparto.InactivarClientesPendientes(cuenta,
  fechalectura: string): Integer;
var
  qUpdate: TQuery;
  TextoModificado: String;
begin
if Application.MessageBox
        (Pchar('Esta seguro que desea cambiar el estado de la(s) cuenta(s) seleccionadas '),
        'Confirmación', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
 begin
  TextoModificado := qPendientes.SQL[18];
  TextoModificado := StringReplace(TextoModificado, 's.', 'r.',
    [rfReplaceAll, rfIgnoreCase]);
  qPendientes.SQL[18] := ' ';
  qPendientes.SQL[18] := TextoModificado;
  qPendientes.SQL[9] := ' ';
  qUpdate := TQuery.Create(nil);
  qUpdate.DatabaseName := 'BaseDato';
  qUpdate.SQL.Clear;
  qUpdate.SQL.Add
    ('update rep_clientesreparto r  set r.codigoestadoclientereparto=5 ');
  qUpdate.SQL.Add(' WHERE  exists (');
  qUpdate.SQL.Add(qPendientes.text + ')');
  qUpdate.execSQL;
  TextoModificado := qPendientes.SQL[18];
  qPendientes.SQL[9] := ' rep_clientesreparto r, ';
  dbgPendientes.Refresh;
  Result :=qUpdate.RowsAffected;
   end
   else
      begin
        raise Exception.Create('Operación cancelada');
      end;
end;

procedure TfListaClienteReparto.dbgActivosTitleClick(Column: TColumn);
var
  Nombre: String;
begin
  if Column.Field.FieldKind = fkData then
  begin
    Nombre := 'qActivos';

    qActivos.close;
    qActivos.SQL.Strings[18] := ' ORDER BY ' + Column.Field.FieldName + ' ' +
      ListaOrden.Values[Nombre + Column.Field.FieldName] + ' ';
    qActivos.open;

    if ListaOrden.Values[Nombre + Column.Field.FieldName] = 'DESC' then
      ListaOrden.Values[Nombre + Column.Field.FieldName] := 'ASC'
    else
      ListaOrden.Values[Nombre + Column.Field.FieldName] := 'DESC';
  end;

end;

procedure TfListaClienteReparto.dbgPendientesTitleClick(Column: TColumn);
var
  Nombre: String;
begin
  if Column.Field.FieldKind = fkData then
  begin
    Nombre := 'qPendientes';

    qPendientes.close;
    qPendientes.SQL.Strings[18] := ' ORDER BY ' + Column.Field.FieldName + ' ' +
      ListaOrden.Values[Nombre + Column.Field.FieldName] + ' ';
    qPendientes.open;

    if ListaOrden.Values[Nombre + Column.Field.FieldName] = 'DESC' then
      ListaOrden.Values[Nombre + Column.Field.FieldName] := 'ASC'
    else
      ListaOrden.Values[Nombre + Column.Field.FieldName] := 'DESC';
  end;

end;

procedure TfListaClienteReparto.dbgAprobadosTitleClick(Column: TColumn);
var
  Nombre: String;
begin
  if Column.Field.FieldKind = fkData then
  begin
    Nombre := 'qAprobados';

    qAprobados.close;
    qAprobados.SQL.Strings[18] := ' ORDER BY ' + Column.Field.FieldName + ' ' +
      ListaOrden.Values[Nombre + Column.Field.FieldName] + ' ';
    qAprobados.open;

    if ListaOrden.Values[Nombre + Column.Field.FieldName] = 'DESC' then
      ListaOrden.Values[Nombre + Column.Field.FieldName] := 'ASC'
    else
      ListaOrden.Values[Nombre + Column.Field.FieldName] := 'DESC';
  end;
end;

procedure TfListaClienteReparto.dbgRepartoTitleClick(Column: TColumn);
var
  Nombre: String;
begin
  if Column.Field.FieldKind = fkData then
  begin
    Nombre := 'qReparto';

    qReparto.close;
    qReparto.SQL.Strings[18] := ' ORDER BY ' + Column.Field.FieldName + ' ' +
      ListaOrden.Values[Nombre + Column.Field.FieldName] + ' ';
    qReparto.open;

    if ListaOrden.Values[Nombre + Column.Field.FieldName] = 'DESC' then
      ListaOrden.Values[Nombre + Column.Field.FieldName] := 'ASC'
    else
      ListaOrden.Values[Nombre + Column.Field.FieldName] := 'DESC';
  end;
end;

procedure TfListaClienteReparto.dbgInactivoTitleClick(Column: TColumn);
var
  Nombre: String;
begin
  if Column.Field.FieldKind = fkData then
  begin
    Nombre := 'qInactivos';

    qInactivos.close;
    qInactivos.SQL.Strings[18] := ' ORDER BY ' + Column.Field.FieldName + ' ' +
      ListaOrden.Values[Nombre + Column.Field.FieldName] + ' ';
    qInactivos.open;

    if ListaOrden.Values[Nombre + Column.Field.FieldName] = 'DESC' then
      ListaOrden.Values[Nombre + Column.Field.FieldName] := 'ASC'
    else
      ListaOrden.Values[Nombre + Column.Field.FieldName] := 'DESC';
  end;
end;

function TfListaClienteReparto.ConvertirCuenta(CodigoCuenta: Integer): Integer;
begin
  IF CodigoCuenta < 1000000 THEN
    result := CodigoCuenta + 3000000
  ELSE
    result := CodigoCuenta;
end;

function TfListaClienteReparto.ExistenciaDeCuentaEnFechaLectura(
  CodigoCuenta, FechaLectura: String): Boolean;
  var
    qry1 : TQuery;
begin
Result :=False;
try
    qry1 := TQuery.Create(nil);
    qry1.DatabaseName := 'BaseDato';

    qry1.SQL.Clear;
    qry1.SQL.Add('SELECT count(*) as cantidad FROM rep_clientesreparto');
    qry1.SQL.Add(' WHERE codigocuenta =:cuenta  ');
    qry1.SQL.Add('  AND  to_char(to_date(fecha_programada_reparto, ''DD/MM/YYYY''), ''MM/YYYY'')= to_char(TO_DATE('''+ TRIM(FechaLectura) + ''', ''DD/MM/YYYY''), ''MM/YYYY'') ');
    qry1.ParamByName('cuenta').AsString :=IntToStr(ConvertirCuenta(StrToInt(trim(CodigoCuenta))));
    qry1.open;

   if  qry1.FieldByName('Cantidad').AsInteger>0 then
   Result := True;
 finally
   qry1.Free;
 end;

end;

function TfListaClienteReparto.InsertarClienteRepartoEspecial(CodigoCuenta,
  FechaLectura: String): Boolean;
  var
   qInsert : TQuery;
begin
   Result := False;
try
                 qInsert := TQuery.Create(nil);
                qInsert.DatabaseName := 'BaseDato';

                qInsert.SQL.Clear;
                qInsert.SQL.Add('   INSERT INTO rep_clientesreparto (      ');
                qInsert.SQL.Add('   fecha_programada,  ');
                qInsert.SQL.Add('   codigocuenta,      ');
                qInsert.SQL.Add('   codigoestadoclientereparto,   ');
                qInsert.SQL.Add('   codigotipoclientereparto,         ');
                qInsert.SQL.Add('   codigosedeoperativa,    ');
                qInsert.SQL.Add('   fecha_programada_reparto,   ');
                qInsert.SQL.Add('   codigoapoyo     ');
                qInsert.SQL.Add('   )  ');
                qInsert.SQL.Add('   select trunc(TO_DATE(''' + trim(FechaLectura) +
                  ''', ''dd/mm/yyyy'')),' +
                  IntToStr(ConvertirCuenta(StrToInt(trim(CodigoCuenta)))) +
                  ',1,2,g.codigosedeoperativa,null,a.codigoapoyo from clientesgd c,apoyo a , c_grupoaol g ');
                qInsert.SQL.Add('where sgc_fun_convertir_clave(c.codigo_cuenta)=' +
                  IntToStr(ConvertirCuenta(StrToInt(trim(CodigoCuenta)))) + '        ');
                qInsert.SQL.Add
                  ('and g.codigogrupoaol=a.grupoaol and a.codigoapoyo=c.codigoapoyo and c.codigo_cuenta>='
                  + IntToStr(ConvertirCuenta(StrToInt(trim(CodigoCuenta)))) + '  ');

              qInsert.ExecSQL;

              if qInsert.RowsAffected > 0 then
              Result := True;

 Except

  Result := False;

 end;


 end;

function TfListaClienteReparto.ExisteEnMaestroClientes(
  CodigoCuenta: String): Boolean;
  var
    qry : TQuery;
    cuenta: Integer;

begin
Result := False;
   // SHOWMESSAGE(CodigoCuenta);
    try
    qry := TQuery.Create(nil);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Clear;
    cuenta:= ConvertirCuenta(StrToInt(TRIM(CodigoCuenta)));
   // SHOWMESSAGE(inttostr(cuenta));
    qry.SQL.Add('SELECT count(*) as cantidad FROM CLIENTESGD');
    qry.SQL.Add('WHERE sgc_fun_convertir_clave(codigo_cuenta) = :cuenta AND  codigo_cuenta<=:cuenta ');
    qry.ParamByName('cuenta').asInteger:=cuenta;
    qry.open;

    if qry.fieldByName('cantidad').AsInteger >0 then
    result := TRue;

   finally
   qry.Free;
   end;
end;

function TfListaClienteReparto.ExisteInfoComercial(Fechalectura,
  Cuenta: String): Boolean;
var
  qBuscar: TQuery;
  TextoEspecial : String;
begin
Result := False;
  inherited;
  try
    qBuscar := TQuery.Create(nil);
    qBuscar.DatabaseName := 'BaseDato';


  //    TextoEspecial :=
    //'to_date(fecha_lectura_programada,''DD/MM/YYYY HH24:MI '' )= to_date('''+Fechalectura +''',''DD/MM/YYYY HH24:MI'') AND clave ='+Cuenta+'';

    qBuscar.SQL.Clear;
    qBuscar.SQL.Add('SELECT COUNT(*) as cantidad FROM rep_informacioncomercial  ');
    qBuscar.SQL.Add(' WHERE TO_DATE(to_char(fecha_lectura_programada,''DD/MM/YYYY HH24:MI''),''DD/MM/YYYY HH24:MI'')= to_date('''+Fechalectura +''',''DD/MM/YYYY HH24:MI'') AND clave ='+Cuenta+'');
   // qBuscar.SQL.Add(TextoEspecial);
    qBuscar.open;
    if qBuscar.FieldByName('cantidad').asinteger <> 0 then
      Result := True;


  finally
    qBuscar.Free;
  end;

end;

function TfListaClienteReparto.InsertarListaClienteEspecial(
  cadena: String): Boolean;
var
  qry: TQuery;
begin
Result := False;
  inherited;
  try
    qry := TQuery.Create(nil);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Clear;
    qry.SQL.Add('INSERT INTO REP_TEMPORAL_CLIENTESREPARTO (CADENA) VALUES ('''+cadena+''')');
    qry.execSQL;
    result:=true;

  finally
  qry.free;
  end;
end;

function TfListaClienteReparto.TotalImportados(Bandera: Boolean): integer;
  var qry: tquery;

begin
result:=0;
    try
    qry := TQuery.Create(nil);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Clear;
    qry.SQL.Add('SELECT COUNT(*) as cantidad FROM REP_TEMPORAL_CLIENTESREPARTO WHERE VALIDACION=1 ');
    qry.open;
    result :=qry.FieldByName('cantidad').asInteger;
    finally
  qry.free;
  end;
end;

function TfListaClienteReparto.TotalErroneosImportacion(
  Bandera: Boolean): integer;
var qry: tquery;
begin
result:=0;
    try
    qry := TQuery.Create(nil);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Clear;
    qry.SQL.Add('SELECT COUNT(*) as cantidad FROM REP_TEMPORAL_CLIENTESREPARTO WHERE VALIDACION<>1 ');
    qry.open;
    result := qry.Fieldbyname('cantidad').asInteger;
    finally
  qry.free;
  end;
end;

procedure TfListaClienteReparto.LimpiarTablaImportacion;
var qry: tquery;
begin

    try
    qry := TQuery.Create(nil);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Clear;
    qry.SQL.Add('DELETE  FROM REP_TEMPORAL_CLIENTESREPARTO WHERE CADENA IS NOT NULL ');
    qry.execSQL;
 
    finally
  qry.free;
  end;
end;

end.
