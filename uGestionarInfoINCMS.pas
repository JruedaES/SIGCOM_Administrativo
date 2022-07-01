unit uGestionarInfoinCMS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, DBCtrls, Mask, ComCtrls,
  ImgList, ToolWin, ToolEdit, RXDBCtrl, DBClient, Provider, Grids, DBGrids,
  FileCtrl, stdActns, Menus, utnZImage, utnZommer,uBase;

type
  TFuGestionarInfoinCMS = class(TFBase)
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
    cbsTablas: TClientDataSet;
    rcListadoLecturas: TRxDBGrid;
    dsLecturas: TDataSource;
    ZImage1: TZImage;
    Panel6: TPanel;
    pbDescargar: TProgressBar;
    lprogreso: TLabel;
    ppCargarInfo: TPopupMenu;
    mmCargarLecturas: TMenuItem;
    CargarConsumos1: TMenuItem;
    Generarcargos1: TMenuItem;
    Cargarcargosconceptos1: TMenuItem;
    CargarcambiosdeDiaLSumCamRut1: TMenuItem;
    Cargarmedidoresencontrados1: TMenuItem;
    sp_itidcl_principal: TStoredProc;
    sp_sgc_csmo_itindcl_principal: TStoredProc;
    sp_sgc_generar_confacsi: TStoredProc;
    sp_sgc_medec: TStoredProc;
    SP_SUMCAMRUT: TStoredProc;
    sp_generar_cargos: TStoredProc;
    CargarInformacindisponibledelda1: TMenuItem;
    sg_cargar_incms: TStoredProc;
    sp_sgc_CONCEpTOS_ITIDCL: TStoredProc;
    AltosConsumidores1: TMenuItem;
    ClientesMasivos1: TMenuItem;
    CargarLecturas1: TMenuItem;
    SP_sgc_cargar_generalgestionlecturas: TStoredProc;
    iLista: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure ttbConsultarInformacionClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure mmBorrarRegistroClick(Sender: TObject);
    procedure mmBorrarListadoLecuturaClick(Sender: TObject);
    procedure mmCargarLecturasClick(Sender: TObject);
    procedure CargarConsumos1Click(Sender: TObject);
    procedure Cargarcargosconceptos1Click(Sender: TObject);
    procedure CargarcambiosdeDiaLSumCamRut1Click(Sender: TObject);
    procedure Cargarmedidoresencontrados1Click(Sender: TObject);
    procedure Generarcargos1Click(Sender: TObject);
    procedure CargarInformacindisponibledelda1Click(Sender: TObject);
    procedure tbConfigurarTiemposDeEjecucionClick(Sender: TObject);
    procedure CargarLecturas1Click(Sender: TObject);
  private
    function LecturasTotales: Integer;
    function LecturasTotalesProcesadas: Integer;
    function LecturasTotalesProcesadasAltos: Integer;
    function ConsumosTotalesProcesadas: Integer;
    function CargosTotales: Integer;
    function ConceptosTotalesProcesadas: Integer;
    function MedidoresTotales: Integer;
    function ClientesAltosconsumidores: Integer;
    function ClientesEnviadoAltosconsumidores : Integer;
    function MedidoresTotalesProcesados: Integer;
    function ServiciosDirectos: Integer;
    procedure ConsultarRegistrosEnTabla(Tabla , Identificador : String ; Tipo : Boolean);
  end;

var
  FuGestionarInfoinCMS: TFuGestionarInfoinCMS;
  dblink: String;

implementation

uses
  uFuncionSGD, uFormaFecha, ConsDll,
  uFIMPAdministrativo,uModificarHorarioJob;

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

function TFuGestionarInfoinCMS.CargosTotales: Integer;
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
      ('SELECT COUNT(DISTINCT CLAVE) AS CANTIDAD FROM SGC_CARGOFACTURADO WHERE FECHALECTURA='
      + sFechaOrcl + ' ');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;

end;

function TFuGestionarInfoinCMS.ConceptosTotalesProcesadas: Integer;
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
      ('SELECT COUNT(DISTINCT NIS_RAD) AS CANTIDAD FROM CONCEPTOS_ITIDCL_EX@' +
      dblink + ' WHERE F_FACT=' + sFechaOrcl + ' ');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;

end;

function TFuGestionarInfoinCMS.ConsumosTotalesProcesadas: Integer;
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
      ('SELECT COUNT(DISTINCT NIS_RAD) AS CANTIDAD FROM CSMO_ITIDCL_EX@' +
      dblink + ' WHERE F_FACT=' + sFechaOrcl + ' ');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;
end;

procedure TFuGestionarInfoinCMS.FormCreate(Sender: TObject);
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

function TFuGestionarInfoinCMS.LecturasTotales: Integer;
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
      ('SELECT COUNT(*) AS CANTIDAD FROM SIGCOM_LECTURA WHERE FECHA_PROGRAMADA='
      + sFechaOrcl + ' ');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;

end;

function TFuGestionarInfoinCMS.LecturasTotalesProcesadas: Integer;
var
  qry: TQuery;
  sFechaOrcl, sFecha: String;
begin
  TRY
    sFecha := FormatDateTime('yyyymmdd', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''YYYYMMDD'')';

    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Add('SELECT COUNT( DISTINCT NIF) AS CANTIDAD FROM ITIDCL_EX@' +
      dblink + ' WHERE F_LREAL=' + sFechaOrcl + ' ');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;

end;

function TFuGestionarInfoinCMS.MedidoresTotales: Integer;
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
      ('SELECT COUNT(*) AS CANTIDAD FROM sigcom_medidornocoincide WHERE FECHA_PROGRAMADA='
      + sFechaOrcl + ' ');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;

end;

function TFuGestionarInfoinCMS.MedidoresTotalesProcesados: Integer;
var
  qry: TQuery;
  sFechaOrcl, sFecha: String;
begin
  TRY
    sFecha := FormatDateTime('yyyymmdd', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''YYYYMMDD'')';

    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM medec_ex@' + dblink +
      ' WHERE FECHALECTURA=' + sFechaOrcl + ' ');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;

end;

procedure TFuGestionarInfoinCMS.ttbConsultarInformacionClick(Sender: TObject);
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

    cbsTablas.fieldbyname('ITEM').AsString := 'Lecturas';
    cbsTablas.fieldbyname('SIGCOM').AsString := 'SigCom Lectura';
    cbsTablas.fieldbyname('CANTIDADSIGCOM').AsInteger := LecturasTotales;
    cbsTablas.fieldbyname('INCMS').AsString := 'Itidcl';
    cbsTablas.fieldbyname('CANTIDADINCMS').AsInteger :=
      LecturasTotalesProcesadas;
    cbsTablas.fieldbyname('NOPROCESO').AsInteger := ServiciosDirectos;
    cbsTablas.Post;

    cbsTablas.Append;
    cbsTablas.fieldbyname('ITEM').AsString := 'Consumos';
    cbsTablas.fieldbyname('SIGCOM').AsString := 'SigCom Lectura';
    cbsTablas.fieldbyname('CANTIDADSIGCOM').AsInteger := LecturasTotales;
    cbsTablas.fieldbyname('INCMS').AsString := 'Csmo_Itidcl';
    cbsTablas.fieldbyname('CANTIDADINCMS').AsInteger :=
      ConsumosTotalesProcesadas;
    cbsTablas.fieldbyname('NOPROCESO').AsInteger := 0;
    cbsTablas.Post;

    cbsTablas.Append;
    cbsTablas.fieldbyname('ITEM').AsString := 'Cargos';
    cbsTablas.fieldbyname('SIGCOM').AsString := 'Cargos Facturados';
    cbsTablas.fieldbyname('CANTIDADSIGCOM').AsInteger := CargosTotales;
    cbsTablas.fieldbyname('INCMS').AsString := 'Conceptos_itidcl';
    cbsTablas.fieldbyname('CANTIDADINCMS').AsInteger :=
      ConceptosTotalesProcesadas;
    cbsTablas.fieldbyname('NOPROCESO').AsInteger := 0;
    cbsTablas.Post;

    cbsTablas.Append;
    cbsTablas.fieldbyname('ITEM').AsString := 'Medidor Encontrado';
    cbsTablas.fieldbyname('SIGCOM').AsString := 'Medidor Encontrado';
    cbsTablas.fieldbyname('CANTIDADSIGCOM').AsInteger := MedidoresTotales;
    cbsTablas.fieldbyname('INCMS').AsString := 'Medec';
    cbsTablas.fieldbyname('CANTIDADINCMS').AsInteger :=
      MedidoresTotalesProcesados;
    cbsTablas.fieldbyname('NOPROCESO').AsInteger := 0;
    cbsTablas.Post;

      cbsTablas.Append;
    cbsTablas.fieldbyname('ITEM').AsString := 'Lectura Altos Consumidores';
    cbsTablas.fieldbyname('SIGCOM').AsString := 'Lectura Altos Consumidores';
    cbsTablas.fieldbyname('CANTIDADSIGCOM').AsInteger :=ClientesAltosconsumidores;
    cbsTablas.fieldbyname('INCMS').AsString := 'General Gestion Lecturas';
    cbsTablas.fieldbyname('CANTIDADINCMS').AsInteger :=ClientesEnviadoAltosconsumidores;
    cbsTablas.fieldbyname('NOPROCESO').AsInteger := 0;
    cbsTablas.Post;

    rcListadoLecturas.DataSource := dsLecturas;

  end
  else
    Application.MessageBox(PChar('Se debe ingresar un fecha valida!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
end;

procedure TFuGestionarInfoinCMS.SpeedButton2Click(Sender: TObject);
begin
  sFecha := eFechaLectura.Text;
  eFechaLectura.Text := GetFecha;
end;

function TFuGestionarInfoinCMS.ServiciosDirectos: Integer;
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
      ('SELECT COUNT(*) AS CANTIDAD FROM SGC_INFOITINERARIO WHERE  FECHALECTURA='
      + sFechaOrcl + '  AND CLAVE  NOT IN (SELECT NIF FROM INFO_ITINERARIO_MASIVOS  WHERE  FECHA_LECTURA_PROGRAMADA='+sFechaOrcl+') ');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;

end;

procedure TFuGestionarInfoinCMS.mmBorrarRegistroClick(Sender: TObject);
begin
  cbsTablas.Delete;
end;

procedure TFuGestionarInfoinCMS.mmBorrarListadoLecuturaClick(Sender: TObject);
begin
  cbsTablas.EmptyDataSet;
end;

procedure TFuGestionarInfoinCMS.mmCargarLecturasClick(Sender: TObject);
var
  sp: TStoredProc;
  sFechaOrcl, sFecha: String;
begin
  IF TRIM(eFechaLectura.Text) <> '' THEN
  begin
    try
      sFecha := FormatDateTime('YYYYMMDD', StrToDate(eFechaLectura.Text));


      sp_itidcl_principal.Close;
      sp_itidcl_principal.ParamByName('FECHALECTURA_VAR').AsString := sFecha;

      sp_itidcl_principal.Prepare;
      sp_itidcl_principal.ExecProc;
         Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);




      Application.MessageBox(PChar('Hay ' +IntToStr(LecturasTotalesProcesadas) +' cuentas procesadas ' ),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

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

procedure TFuGestionarInfoinCMS.CargarConsumos1Click(Sender: TObject);
var
  sFechaOrcl, sFecha: String;
begin
  IF TRIM(eFechaLectura.Text) <> '' THEN
  begin
    try
      sFecha := FormatDateTime('YYYYMMDD', StrToDate(eFechaLectura.Text));
      sp_sgc_csmo_itindcl_principal.Close;
      sp_sgc_csmo_itindcl_principal.ParamByName('FECHALECTURA_VAR').AsString := sFecha;

      sp_sgc_csmo_itindcl_principal.Prepare;
      sp_sgc_csmo_itindcl_principal.ExecProc;
      
         Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

          Application.MessageBox(PChar('Hay ' +IntToStr(ConsumosTotalesProcesadas) +' cuentas procesadas ' ),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);


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

procedure TFuGestionarInfoinCMS.Cargarcargosconceptos1Click(Sender: TObject);
var
  sp: TStoredProc;
  sFechaOrcl, sFecha: String;
begin
  IF TRIM(eFechaLectura.Text) <> '' THEN
  begin
    try
      sFecha := FormatDateTime('YYYYMMDD', StrToDate(eFechaLectura.Text));
      sp_sgc_generar_confacsi.Close;
      sp_sgc_generar_confacsi.ParamByName('FECHALECTURA_VAR').AsString := sFecha;

      sp_sgc_generar_confacsi.Prepare;
      sp_sgc_generar_confacsi.ExecProc;




       sp_sgc_CONCEpTOS_ITIDCL.Close;
      sp_sgc_CONCEpTOS_ITIDCL.ParamByName('FECHALECTURA_VAR').AsString := sFecha;

      sp_sgc_CONCEpTOS_ITIDCL.Prepare;
      sp_sgc_CONCEpTOS_ITIDCL.ExecProc;

         Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

           Application.MessageBox(PChar('Hay ' +IntToStr(ConceptosTotalesProcesadas) +' cuentas procesadas ' ),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
        
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

procedure TFuGestionarInfoinCMS.CargarcambiosdeDiaLSumCamRut1Click
  (Sender: TObject);
var
  sFechaOrcl, sFecha: String;
begin

  try


    SP_SUMCAMRUT.Close;

    SP_SUMCAMRUT.Prepare;
    SP_SUMCAMRUT.ExecProc;
       Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
  except
    on e: EDBEngineError do
    begin
      Application.MessageBox(PChar('Se ha presentado un error ' + e.Message),
        'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
    end;

  end;
end;

procedure TFuGestionarInfoinCMS.Cargarmedidoresencontrados1Click
  (Sender: TObject);
var
  sFechaOrcl, sFecha: String;
begin
  IF TRIM(eFechaLectura.Text) <> '' THEN
  begin
    try
      sFecha := FormatDateTime('YYYYMMDD', StrToDate(eFechaLectura.Text));
      sp_sgc_medec.Close;
      sp_sgc_medec.ParamByName('FECHALECTURA_VAR').AsString := sFecha;

      sp_sgc_medec.Prepare;
      sp_sgc_medec.ExecProc;
          Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
      
              ConsultarRegistrosEnTabla('MEDEC_EX','FECHALECTURA',TRUE);
              ttbConsultarInformacionClick(Sender);
    except
      on e: EDBEngineError do
      begin
        Application.MessageBox(PChar('Se ha presentado un error ' + e.Message),
          'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
      end;

    end;
  end
  else
    Application.MessageBox(PChar('Se debe ingresar un fecha valida!'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
end;

procedure TFuGestionarInfoinCMS.Generarcargos1Click(Sender: TObject);
begin
  IF TRIM(eFechaLectura.Text) <> '' THEN
  begin
    try

      sp_generar_cargos.Close;
      sp_generar_cargos.Prepare;
      sp_generar_cargos.ExecProc;
          Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
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

procedure TFuGestionarInfoinCMS.CargarInformacindisponibledelda1Click(
  Sender: TObject);
var
  sTextoPregunta: String;
begin
    sTextoPregunta :=
        '¿ Esta Seguro que desea generar toda la información para el día de HOY? '
        + chr(13) +
        ' El proceso tardara aproximadamente 30 minutos.';

      if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
        MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
      begin

  try

      sg_cargar_incms.Close;
      sg_cargar_incms.Prepare;
      sg_cargar_incms.ExecProc;
          Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
         ttbConsultarInformacionClick(Sender);
    except
      on e: EDBEngineError do
      begin
        Application.MessageBox(PChar('Se ha presentado un error ' + e.Message),
          'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
      end;


    end;
    end;
end;

procedure TFuGestionarInfoinCMS.tbConfigurarTiemposDeEjecucionClick(
  Sender: TObject);
  VAR
fuModificarHorarioJob: TfuModificarHorarioJob;
begin
if  ProcManager.CanProcExecute('_Horarios inCMS') then
begin
fuModificarHorarioJob :=   TfuModificarHorarioJob.cREATE(APPLICATION);
fuModificarHorarioJob.ShowModal;
end
else
Application.MessageBox(PChar('Usted no tiene los permisos suficientes para acceder a este formulario, contacte a soporte tecnico. !'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

end;

procedure TFuGestionarInfoinCMS.ConsultarRegistrosEnTabla(Tabla, Identificador : String; Tipo: Boolean);
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

procedure TFuGestionarInfoinCMS.CargarLecturas1Click(Sender: TObject);
var
  sp: TStoredProc;
  sFechaOrcl, sFecha: String;
begin
  IF TRIM(eFechaLectura.Text) <> '' THEN
  begin
    try
      sFecha := FormatDateTime('YYYYMMDD', StrToDate(eFechaLectura.Text));


      SP_sgc_cargar_generalgestionlecturas.Close;
      SP_sgc_cargar_generalgestionlecturas.ParamByName('FECHALECTURA_VAR').AsString := sFecha;

      SP_sgc_cargar_generalgestionlecturas.Prepare;
      SP_sgc_cargar_generalgestionlecturas.ExecProc;
         Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);




      Application.MessageBox(PChar('Hay ' +IntToStr(LecturasTotalesProcesadasAltos) +' cuentas procesadas ' ),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

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

function TFuGestionarInfoinCMS.LecturasTotalesProcesadasAltos: Integer;
var
  qry: TQuery;
  sFechaOrcl, sFecha: String;
begin
  TRY
    sFecha := FormatDateTime('yyyymmdd', StrToDate(eFechaLectura.Text));
    sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''YYYYMMDD'')';

    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM DATOS390.GENERALGESTIONLECTURAS WHERE  "fechaCalendario" =' + sFechaOrcl + ' ');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;


end;

function TFuGestionarInfoinCMS.ClientesAltosconsumidores: Integer;
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
      ('SELECT COUNT(*) AS CANTIDAD FROM sigcom_lectura s , sgc_infoitinerario i WHERE FECHA_PROGRAMADA='
      + sFechaOrcl + ' and i.fechalectura=s.fecha_programada and i.clave=s.clave and i.INDUSTRIAL_AUTORIZA=''SI'' ');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;


end;

function TFuGestionarInfoinCMS.ClientesEnviadoAltosconsumidores: Integer;
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
      ('SELECT COUNT(*) AS CANTIDAD FROM sigcom_lectura s , sgc_infoitinerario i WHERE FECHA_PROGRAMADA='
      + sFechaOrcl + ' and i.fechalectura=s.fecha_programada and i.clave=s.clave and i.INDUSTRIAL_AUTORIZA=''SI'' AND s.procesado_incms=''SI'' ');
    qry.Open;
    Result := qry.fieldbyname('CANTIDAD').AsInteger;

  finally
    qry.Free;
  end;

end;

end.
