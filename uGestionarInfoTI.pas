unit uGestionarInfoTI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, DBCtrls, Mask, ComCtrls,
  ImgList, ToolWin, ToolEdit, RXDBCtrl, DBClient, Provider, Grids, DBGrids,
  FileCtrl, stdActns, Menus, utnZImage, utnZommer,uBase;

type
  TFGestionarInfoTI = class(TFBase)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ttbConsultarInformacion: TToolButton;
    ToolButton4: TToolButton;
    tbCargarLecturas: TToolButton;
    tbConfigurarTiemposDeEjecucion: TToolButton;
    Panel4: TPanel;
    eFechaLectura: TEdit;
    SpeedButton2: TSpeedButton;
    lfecha: TLabel;
    ToolButton8: TToolButton;
    Panel5: TPanel;
    gbPrinicipal: TGroupBox;
    ZImage1: TZImage;
    Panel6: TPanel;
    pbDescargar: TProgressBar;
    lprogreso: TLabel;
    iLista: TImageList;
    sg_cargar_TI: TStoredProc;
    rcListadoLecturas: TRxDBGrid;
    cbsTablas: TClientDataSet;
    dsLecturas: TDataSource;
    eCodigoItinerario: TEdit;
    ToolButton1: TToolButton;
    tbDeshabilitarConsultas: TToolButton;
    pmOpcionesDeshabilitar: TPopupMenu;
    Label1: TLabel;
    N1Todas1: TMenuItem;
    N2CdigoItinerario1: TMenuItem;
    lcbConsulta: TDBLookupComboBox;
    Consulta: TLabel;
    qConsulta: TQuery;
    qConsultaCODIGOCONSULTA: TFloatField;
    qConsultaNOMBRECONSULTA: TMemoField;
    qConsultaNOMBRE: TStringField;
    PorAvisoConsulta1: TMenuItem;
    dsConsulta: TDataSource;
    Porperiodo1: TMenuItem;
    Porfecha1: TMenuItem;
    PorAvisoConsulta2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure ttbConsultarInformacionClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure tbConfigurarTiemposDeEjecucionClick(Sender: TObject);
    procedure tbCargarLecturasClick(Sender: TObject);
    procedure eCodigoItinerarioKeyPress(Sender: TObject; var Key: Char);
    procedure N2CdigoItinerario1Click(Sender: TObject);
    procedure N1Todas1Click(Sender: TObject);
    procedure qConsultaCalcFields(DataSet: TDataSet);
    procedure PorAvisoConsulta1Click(Sender: TObject);
    procedure PorAvisoConsulta2Click(Sender: TObject);
  private
    function CategoriaTotal: Integer;
    function CategoriaTotalProcesada: Integer;
    function RespuestaTotal: Integer;
    function RespuestaTotalProcesadas: Integer;
    function ConsultaRespuestaTotal: Integer;
    function ConsultaRespuestaTotalProcesada: Integer;
    function ElementoConsultaTotal: Integer;
    function ElementoConsultaTotalProcesado: Integer;
    function INTERFAZTOTAL: Integer;
    function FazConsultaTotal : Integer;
    function EncConsultaTotal: Integer;
    procedure ConsultarRegistrosEnTabla(Tabla , Identificador : String ; Tipo : Boolean);
  end;

var
  FGestionarInfoTI: TFGestionarInfoTI;
  dblink: String;

implementation

uses
  uFuncionSGD, uFormaFecha, ConsDll,
  uFIMPAdministrativo,uProgramarHorarioJob;

{$R *.DFM}

function GetFecha: string;
begin
  FFormaFecha := TFFormaFecha.Create(Application);
  if FFormaFecha.ShowModal = mrOk then
    Result := DatetoStr(FFormaFecha.Date)
  else
    Result := '';
  FFormaFecha.Free;
end;

function GetPeriodo: string;
var
sPeriodo, sFecha : String;
begin
  FFormaFecha := TFFormaFecha.Create(Application);
  if FFormaFecha.ShowModal = mrOk then
   begin
   sPeriodo := FormatDateTime('yyyymm', FFormaFecha.Date);
   Result := sPeriodo;
    end
  else
    Result := '';
  FFormaFecha.Free;
end;

function TFGestionarInfoTI.ConsultaRespuestaTotal: Integer;
var
  qry: TQuery;
  sFechaOrcl, sFecha: String;
begin
  TRY
    sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';

    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Add
      ('SELECT COUNT(*) AS CANTIDAD FROM enc_faz_consultarespuesta');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;

end;

function TFGestionarInfoTI.ConsultaRespuestaTotalProcesada: Integer;
var
  qry: TQuery;
  sFechaOrcl, sFecha: String;
begin
  TRY
    sFecha := FormatDateTime('yyyymmdd', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''YYYYMMDD'')';

    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Add
      ('SELECT COUNT(*) AS CANTIDAD FROM ENC_CONSULTARESPUESTA');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;

end;

function TFGestionarInfoTI.RespuestaTotalProcesadas: Integer;
var
  qry: TQuery;
  sFechaOrcl, sFecha: String;
begin
  TRY
    sFecha := FormatDateTime('yyyymmdd', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''YYYYMMDD'')';

    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Add
      ('SELECT COUNT(*) AS CANTIDAD FROM ENC_RESPUESTA');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;
end;

procedure TFGestionarInfoTI.FormCreate(Sender: TObject);
var
  qry: TQuery;
begin
  TRY

    Try
      qry := TQuery.Create(Application);
      qry.DatabaseName := 'BaseDato';
      qry.SQL.Add('SELECT VALOR FROM PARAMETRO WHERE CODIGOPARAMETRO=''INC'' ');
      qry.Open;
      dblink := qry.fieldbyname('VALOR').AsString;

    Except
      dblink := 'EXTPRO';
    End;

  finally
    qry.Free;
  end;

end;

function TFGestionarInfoTI.CategoriaTotal: Integer;
var
  qry: TQuery;
  sFechaOrcl, sFecha: String;
begin
  TRY
    sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';

    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Add
      ('SELECT COUNT(*) AS CANTIDAD FROM ENC_FAZ_CATEGORIA');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;

end;
//-----------------------------------------------------------------------
//-------Ejemplo funcion para Total Consultas de Interfaz--------------------
function TFGestionarInfoTI.CategoriaTotalProcesada: Integer;
var
  qry: TQuery;
  sFechaOrcl, sFecha: String;
begin
  TRY
    sFecha := FormatDateTime('yyyymmdd', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''YYYYMMDD'')';

    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM ENC_CATEGORIA');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;

end;

function TFGestionarInfoTI.ElementoConsultaTotal: Integer;
var
  qry: TQuery;
  sFechaOrcl, sFecha: String;
begin
  TRY
    sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';

    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Add
      ('SELECT COUNT(*) AS CANTIDAD FROM ENC_FAZ_ELEMENTOCONSULTA');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;

end;

function TFGestionarInfoTI.ElementoConsultaTotalProcesado: Integer;
var
  qry: TQuery;
  sFechaOrcl, sFecha: String;
begin
  TRY
    sFecha := FormatDateTime('yyyymmdd', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''YYYYMMDD'')';

    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM ENC_ELEMENTOCONSULTA');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;

end;
///-------------------------------------------------------------------------
//---------------------Botón Consulta------------------------------------------------------
procedure TFGestionarInfoTI.ttbConsultarInformacionClick(Sender: TObject);
begin

   IF TRIM(eFechaLectura.Text) <> '' THEN
  begin

    if not cbsTablas.IsEmpty then
    begin
      cbsTablas.EmptyDataSet;
      cbsTablas.Close;
    end;
    cbsTablas.Open;
    cbsTablas.Append;

   cbsTablas.Append;
    cbsTablas.fieldbyname('ITEM').AsString := 'Interfaz';
    cbsTablas.fieldbyname('SIGCOM').AsString := 'ENC_INTERFAZ';
    cbsTablas.fieldbyname('CANTIDADSIGCOM').AsInteger :=INTERFAZTOTAL;
    cbsTablas.Post;

	cbsTablas.Append;
    cbsTablas.fieldbyname('ITEM').AsString := 'Categoría';
    cbsTablas.fieldbyname('SIGCOM').AsString := 'ENC_FAZ_CATEGORIA';
    cbsTablas.fieldbyname('CANTIDADSIGCOM').AsInteger := CategoriaTotal;
    cbsTablas.fieldbyname('INCMS').AsString := 'ENC_CATEGORIA';
    cbsTablas.fieldbyname('CANTIDADINCMS').AsInteger := CategoriaTotalProcesada;
    cbsTablas.Post;

    cbsTablas.Append;
    cbsTablas.fieldbyname('ITEM').AsString := 'Respuesta';
    cbsTablas.fieldbyname('SIGCOM').AsString := 'ENC_FAZ_RESPUESTA';
    cbsTablas.fieldbyname('CANTIDADSIGCOM').AsInteger := RespuestaTotal;
    cbsTablas.fieldbyname('INCMS').AsString := 'ENC_RESPUESTA';
    cbsTablas.fieldbyname('CANTIDADINCMS').AsInteger := RespuestaTotalProcesadas;
    cbsTablas.Post;

    cbsTablas.Append;
    cbsTablas.fieldbyname('ITEM').AsString := 'Consulta';
    cbsTablas.fieldbyname('SIGCOM').AsString := 'ENC_FAZ_CONSULTA';
    cbsTablas.fieldbyname('CANTIDADSIGCOM').AsInteger := FazConsultaTotal;
    cbsTablas.fieldbyname('INCMS').AsString := 'ENC_CONSULTA';
    cbsTablas.fieldbyname('CANTIDADINCMS').AsInteger := EncConsultaTotal;
    cbsTablas.Post;

    cbsTablas.Append;
    cbsTablas.fieldbyname('ITEM').AsString := 'Consulta Respuesta';
    cbsTablas.fieldbyname('SIGCOM').AsString := 'ENC_FAZ_CONSULTARESPUESTA';
    cbsTablas.fieldbyname('CANTIDADSIGCOM').AsInteger := ConsultaRespuestaTotal;
    cbsTablas.fieldbyname('INCMS').AsString := 'ENC_CONSULTARESPUESTA';
    cbsTablas.fieldbyname('CANTIDADINCMS').AsInteger := ConsultaRespuestaTotalProcesada;
    cbsTablas.Post;


    cbsTablas.Append;
    cbsTablas.fieldbyname('ITEM').AsString := 'Elemento Consulta';
    cbsTablas.fieldbyname('SIGCOM').AsString := 'ENC_FAZ_ELEMENTOCONSULTA';
    cbsTablas.fieldbyname('CANTIDADSIGCOM').AsInteger := ElementoConsultaTotal;
    cbsTablas.fieldbyname('INCMS').AsString := 'ENC_ELEMENTOCONSULTA';
    cbsTablas.fieldbyname('CANTIDADINCMS').AsInteger := ElementoConsultaTotalProcesado;
    //cbsTablas.fieldbyname('NOPROCESO').AsInteger := 0;
    cbsTablas.Post;

    rcListadoLecturas.DataSource := dsLecturas;
    end
  else
    Application.MessageBox(PChar('Se debe ingresar un fecha valida!'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);

end;
//---------------------------------------------------------------------------------------
procedure TFGestionarInfoTI.SpeedButton2Click(Sender: TObject);
var
 sFechaOrcl, sFecha, sPeriodo: String;
begin
  sFecha := eFechaLectura.Text;
  eFechaLectura.Text := GetFecha;


if eFechaLectura.Text <> '' then
begin
   lcbConsulta.Enabled := true;
   lcbConsulta.Color := clWindow;
   sPeriodo := FormatDateTime('yyyymm', StrToDate(eFechaLectura.Text));
   qConsulta.Close;
   qConsulta.ParamByName('PERIODO').asString := sPeriodo;
   qConsulta.open;
end;

end;

function TFGestionarInfoTI.EncConsultaTotal: Integer;
var
  qry: TQuery;
  sFechaOrcl, sFecha: String;
begin
  TRY
    sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';

    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM ENC_CONSULTA');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;

end;

procedure TFGestionarInfoTI.tbConfigurarTiemposDeEjecucionClick(
  Sender: TObject);
  VAR
fuProgramarHorarioJob: TfuProgramarHorarioJob;
begin
if  ProcManager.CanProcExecute('_Horarios inCMS') then
begin
fuProgramarHorarioJob :=   TfuProgramarHorarioJob.cREATE(APPLICATION);
fuProgramarHorarioJob.ShowModal;
end
else
Application.MessageBox(PChar('Usted no tiene los permisos suficientes para acceder a este formulario, contacte a soporte tecnico. !'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

end;

procedure TFGestionarInfoTI.ConsultarRegistrosEnTabla(Tabla, Identificador : String; Tipo: Boolean);
var
  qvr: TQuery;
  sFecha, sFechaOrcl, variable: String;
  List: TStrings;
  i: integer;
begin
    try
      qvr := TQuery.Create(Application);
      qvr.DatabaseName := 'BaseDato';

      if Tipo then
      begin
        sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(eFechaLectura.Text));
        sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';
        variable := ' AND '+Identificador+' =' + sFechaOrcl + ' '
      end
      else
        variable := ' ';

        qvr.sql.Add('SELECT COUNT(*) AS CANTIDAD FROM  ' + Tabla + '@'+dblink+' WHERE 1=1 ' + variable + ' ');
        qvr.Open;

       Application.MessageBox(PChar('Hay ' +qvr.fieldByName('CANTIDAD').AsString +' registros en la tabla '+Tabla+' ' ),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

    finally
      qvr.Free;
    end;

end;

function TFGestionarInfoTI.RespuestaTotal: Integer;
var
  qry: TQuery;
  sFechaOrcl, sFecha: String;
begin
  TRY
    sFecha := FormatDateTime('yyyymmdd', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''YYYYMMDD'')';

    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM ENC_FAZ_RESPUESTA');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;


end;

function TFGestionarInfoTI.INTERFAZTOTAL: Integer;
var
  qry: TQuery;
  sFechaOrcl, sFecha: String;
begin
  TRY
    sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';

    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Add
      ('SELECT COUNT(*) AS CANTIDAD FROM ENC_INTERFAZ');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;


end;

function TFGestionarInfoTI.FazConsultaTotal: Integer;
var
  qry: TQuery;
  sFechaOrcl, sFecha: String;
begin
  TRY
    sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';

    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM ENC_FAZ_CONSULTA');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;

end;
///----------------BOTON CARGAR----------------------------------------
procedure TFGestionarInfoTI.tbCargarLecturasClick(Sender: TObject);
var
  sp: TStoredProc;
  sFechaOrcl, sFecha: String;
begin
  IF TRIM(eFechaLectura.Text) <> '' THEN
  begin
    try
      sFecha := FormatDateTime('DDMMYYYY', StrToDate(eFechaLectura.Text));
      cbsTablas.EmptyDataSet;
      sg_cargar_TI.Close;
      sg_cargar_TI.ParamByName('FECHA_PROGRAMADA').AsString := sFecha;

      sg_cargar_TI.Prepare;
      sg_cargar_TI.ExecProc;
         Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);



      {Application.MessageBox(PChar('Hay ' +IntToStr(LecturasTotalesProcesadas) +' consultas de interfaz ' ),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);}

      ttbConsultarInformacionClick(Sender);
    except
      on e: EDBEngineError do
      begin
        Application.MessageBox(PChar('Se ha presentado un error ' + e.Message),
          'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
      end;

    end;
  end
  else
    Application.MessageBox(PChar('Se debe ingresar un fecha valida!'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);

end;

procedure TFGestionarInfoTI.eCodigoItinerarioKeyPress(Sender: TObject; var Key: Char);
begin
if ( StrScan('0123456789'+chr(7)+chr(8), Key) = nil ) then  Key := #0;
end;
//------------------------Deshabilitar por código itinerario------------------------------------------------
procedure TFGestionarInfoTI.N2CdigoItinerario1Click(Sender: TObject);
var
  qry: TQuery;
  sFechaOrcl, sFecha, sPeriodo, sMensaje, sTextoPregunta: String;
begin
  //eCodigoItinerario.Enabled := True;

  IF TRIM(eFechaLectura.Text) <> '' THEN
  begin

       sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';
    sPeriodo := 'TO_CHAR(TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY''), ''YYYYMM'')';

    if   StrToDate(eFechaLectura.Text) < DATE then
    Application.MessageBox(PChar('La fecha ingresada no es válida, ingrese una fecha mayor o igual al día de hoy!'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2)

    else if eCodigoItinerario.text = '' then
     begin
       Application.MessageBox(PChar('Caja de texto vacía, Se debe ingresar un Código itinerario!'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
     end
     
    else if eCodigoItinerario.text <> '' then
    begin
      sTextoPregunta :=
    '¿Está seguro de deshabilitar las consultas para este itinerario? '
    + chr(13) + 'El proceso tendrá consecuencias inmediatas.';
  if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
  begin

    try
    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.Close;
    qry.SQL.Text := 'update enc_exportacion set habilitado = ''NO'' where periodo = '+ sPeriodo +' and codigocuenta in (select clave from sgc_infoitinerario where fechalectura = '+ sFechaOrcl + ' and leido = ''NO'' and codigoitinerario = ' + eCodigoItinerario.text +') and habilitado = ''SI'' and encuestado = ''NO''';
    qry.ExecSQL;
    if qry.RowsAffected > 0 then
    Application.MessageBox(PChar('Se realizó el proceso exitosamente, se afectaron::'+' '+ IntToStr(qry.RowsAffected) +' ' +'registros'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2)
      else
    Application.MessageBox(PChar('No se ha deshabilitado ninguna consulta, ingrese nuevos datos e intente nuevamente'),
      'Información', MB_OK + MB_ICONWARNING + MB_DEFBUTTON2);


    finally
    qry.Free;
    end;
    end;

  //except
     //on e: EDBEngineError do
     // begin
       // Application.MessageBox(PChar('Se ha presentado un error ' + e.Message),
         // 'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
      //end;

   end;
  end
  else
    Application.MessageBox(PChar('Se debe ingresar un fecha valida!'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);

end;
//----------------------Deshabilitar Todas las consultas--------------------------------------------------------
procedure TFGestionarInfoTI.N1Todas1Click(Sender: TObject);
var
  qry: TQuery;
  sFechaOrcl, sFecha, sPeriodo, sTextoPregunta: String;
begin
  IF TRIM(eFechaLectura.Text) <> '' THEN
  begin
      sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';
    sPeriodo := 'TO_CHAR(TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY''), ''YYYYMM'')';

    if   StrToDate(eFechaLectura.Text) < DATE then
    begin
     Application.MessageBox(PChar('La fecha ingresada no es válida, ingrese una fecha mayor o igual al día de hoy!'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
      end
    else if   StrToDate(eFechaLectura.Text) >= DATE then
    BEGIN
      sTextoPregunta :=
    '¿Está seguro de deshabilitar todas las consultas? '
    + chr(13) + 'El proceso tendrá consecuencias inmediatas.';

  if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
  begin
    try
    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.Close;
    qry.SQL.Text := 'update enc_exportacion set habilitado = ''NO'' where periodo = '+ sPeriodo +' and codigocuenta in (select clave from sgc_infoitinerario where fechalectura = '+ sFechaOrcl + ' and leido = ''NO'') and habilitado = ''SI'' and encuestado = ''NO''';
    qry.ExecSQL;

    if qry.RowsAffected > 0 then
    Application.MessageBox(PChar('Se realizó el proceso exitosamente, se afectaron:'+' '+ IntToStr(qry.RowsAffected) +' ' +'registros'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2)
      else
    Application.MessageBox(PChar('No se ha deshabilitado ninguna consulta, no están disponibles o las cuentas ya están leidas, ingrese nuevos datos e intente nuevamente'),
      'Información', MB_OK + MB_ICONWARNING + MB_DEFBUTTON2)
    finally
    qry.Free;
    end;
    end;
    END;
  end
  else
    Application.MessageBox(PChar('Se debe ingresar un fecha valida!'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
end;

procedure TFGestionarInfoTI.qConsultaCalcFields(DataSet: TDataSet);
begin
qConsultaNOMBRE.AsString := qConsultaNOMBRECONSULTA.AsString;
end;
//----------------------------Deshabilitar por consulta------------------------------------------------------
procedure TFGestionarInfoTI.PorAvisoConsulta1Click(Sender: TObject);
var
  qry: TQuery;
  sFechaOrcl, sFecha, sPeriodo, sTextoPregunta: String;
begin
  IF TRIM(eFechaLectura.Text) <> '' THEN
  begin
      sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';
    sPeriodo := 'TO_CHAR(TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY''), ''YYYYMM'')';

    if   StrToDate(eFechaLectura.Text)  < DATE then
    begin
     Application.MessageBox(PChar('La fecha ingresada no es válida, ingrese una fecha mayor o igual al día de hoy!'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
      end
    else if   StrToDate(eFechaLectura.Text)  >= DATE then
    BEGIN

     if lcbConsulta.Text = '' then
     begin
     Application.MessageBox(PChar('Se debe seleccionar una consulta o un aviso'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2)
     end

     else if lcbConsulta.Text <> '' then
     begin
      sTextoPregunta :=
    '¿Está seguro de deshabilitar esta consulta o aviso: ['+qConsultaNOMBRECONSULTA.asstring +'] para la fecha : ['+sFecha+']? '
    + chr(13) + 'El proceso tendrá consecuencias inmediatas.';

  if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
  begin
    try
    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.Close;
    qry.SQL.Text := 'update enc_exportacion set habilitado = ''NO'' where periodo = '+ sPeriodo +' and codigocuenta in (select clave from sgc_infoitinerario where fechalectura = '+ sFechaOrcl + ' and leido = ''NO'') and codigoconsulta = '+ qConsultaCODIGOCONSULTA.asstring +' and habilitado = ''SI'' and encuestado = ''NO''';
    qry.ExecSQL;

    if qry.RowsAffected > 0 then
    Application.MessageBox(PChar('Se realizó el proceso exitosamente, se afectaron:'+' '+ IntToStr(qry.RowsAffected) +' ' +'registros'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2)
      else
    Application.MessageBox(PChar('No se ha deshabilitado ninguna consulta ni aviso, no están disponibles o las cuentas ya están leídas, ingrese nuevos datos e intente nuevamente'),
      'Información', MB_OK + MB_ICONWARNING + MB_DEFBUTTON2)
    finally
    qry.Free;
    end;
    end;
    end;
    END;
  end
  else
    Application.MessageBox(PChar('Se debe ingresar un fecha valida!'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);

end;
//----------------------------------------------------------------------------------
procedure TFGestionarInfoTI.PorAvisoConsulta2Click(Sender: TObject);
var
  qry: TQuery;
  sFechaOrcl, sFecha, sPeriodo, sTextoPregunta: String;
begin
  IF TRIM(eFechaLectura.Text) <> '' THEN
  begin
      sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';
    sPeriodo := 'TO_CHAR(TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY''), ''YYYYMM'')';

    if   StrToDate(eFechaLectura.Text)  <   DATE then
    begin
     Application.MessageBox(PChar('La fecha ingresada no es válida, ingrese una fecha mayor o igual al día de hoy!'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
      end
    else if   StrToDate(eFechaLectura.Text) >= DATE then
    BEGIN
    if lcbConsulta.Text = '' then
     begin
     Application.MessageBox(PChar('Se debe seleccionar una consulta o un aviso'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2)
     end

     else if lcbConsulta.Text <> '' then
     begin
      sTextoPregunta :=
    '¿Está seguro de deshabilitar esta consulta o aviso: ['+qConsultaNOMBRECONSULTA.asstring +'] para el periodo: ['+ FormatDateTime('yyyymm', StrToDate(eFechaLectura.Text)) +']? '
    + chr(13) + 'El proceso tendrá consecuencias inmediatas.';

  if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
  begin
    try
    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.Close;
    qry.SQL.Text := 'update enc_exportacion set habilitado = ''NO'' where periodo = '+ sPeriodo +' and codigoconsulta = '+ qConsultaCODIGOCONSULTA.asstring +' and habilitado = ''SI'' and encuestado = ''NO''';
    qry.ExecSQL;

    if qry.RowsAffected > 0 then
    Application.MessageBox(PChar('Se realizó el proceso exitosamente, se afectaron:'+' '+ IntToStr(qry.RowsAffected) +' ' +'registros'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2)
      else
    Application.MessageBox(PChar('No se ha deshabilitado ninguna consulta ni aviso, no están disponibles o las cuentas ya están leídas, ingrese nuevos datos e intente nuevamente'),
      'Información', MB_OK + MB_ICONWARNING + MB_DEFBUTTON2)
    finally
    qry.Free;
    end;
    end;
    end;
    END;
  end
  else
    Application.MessageBox(PChar('Se debe ingresar un fecha valida!'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
end;

end.
