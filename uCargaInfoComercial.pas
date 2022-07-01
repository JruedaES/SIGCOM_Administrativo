unit uCargaInfoComercial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, DBCtrls, Mask, ComCtrls,
  ImgList, ToolWin, Menus, Grids, DBGrids, RXDBCtrl, DBClient,uBase;

type
  TfCargaInfoComercial = class(TFBase)
    Panel1: TPanel;
    OpenDialog1: TOpenDialog;
    qNameTable: TQuery;
    qNameTableNOMBRETABLA: TStringField;
    dsNameTable: TDataSource;
    Panel3: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ttbConsultarInformacion: TToolButton;
    tbCargarLecturas: TToolButton;
    ToolButton4: TToolButton;
    Panel4: TPanel;
    lfecha: TLabel;
    Editfecha: TEdit;
    SpeedButtonFecha: TSpeedButton;
    Label1: TLabel;
    EditArchivo: TEdit;
    Label3: TLabel;
    dblcNameTable: TDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    ttbBorrar: TToolButton;
    ppCargar: TPopupMenu;
    CargarTablaSeleccionada1: TMenuItem;
    CargarFPLE1801: TMenuItem;
    InformacindeFPLE1901: TMenuItem;
    InformacindeFPRE0101: TMenuItem;
    CalendariodeLectura1: TMenuItem;
    ConceptosyCargos1: TMenuItem;
    Tarifas1: TMenuItem;
    InformacindeRegistros1: TMenuItem;
    InformacindeDeudas1: TMenuItem;
    Depende1: TMenuItem;
    UltimainformacineninCMS1: TMenuItem;
    ToolButton1: TToolButton;
    ttExportar: TToolButton;
    ppConsulta: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    cdsListado: TClientDataSet;
    dsLecturas: TDataSource;
    svExportar: TSaveDialog;
    Panel5: TPanel;
    gbTable: TGroupBox;
    rcListadoLecturas: TRxDBGrid;
    ilista: TImageList;
    ppBorrar: TPopupMenu;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    sg_sgc_cargar_fple180_diaria: TStoredProc;
    sp_sgc_cargar_fple190_lect: TStoredProc;
    sp_sgc_cargar_fpre010_lect: TStoredProc;
    sp_sgc_cargar_info_itinerarios_masivo: TStoredProc;
    sp_sgc_cargar_fac_valor_tarifa: TStoredProc;
    sp_sgc_cargar_incms_calendario: TStoredProc;
    sp_sgc_generar_fpre020: TStoredProc;
    Consultardisponibilidaddelainformacion1: TMenuItem;
    Cargartodalainformacin1: TMenuItem;
    sp_sgc_cargar_informacion_comercial: TStoredProc;
    sp_sgc_cargar_FPCN010_LECT: TStoredProc;
    InformacindeREGCICLO1: TMenuItem;
    Anomalias1: TMenuItem;
    Anomalias2: TMenuItem;
    SGC_GENERAR_CONV_ANOMALIA: TStoredProc;
    Anomalias3: TMenuItem;
    InformacindeFPLE180ALTOS1: TMenuItem;
    InformacindeFPLE190ALTOS1: TMenuItem;
    sp_sgc_cargar_fple180_diario_altos: TStoredProc;
    sp_sgc_cargar_fple190_diaria_altos: TStoredProc;
    InformacindeFPLE180ALTOS2: TMenuItem;
    InformacindeFPLE190Altos2: TMenuItem;
    InformacinFPLE180ALTOS1: TMenuItem;
    InformacinFPLE190ALTOS1: TMenuItem;
    procedure BtnAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    function SubirInfoSarta(pNombreTabla, pIdCargue: string): string;
    procedure SpeedButtonFechaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditfechaChange(Sender: TObject);
    function TimeBetween(const ANow, AThen: TDateTime): string;
    procedure btnClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CargarTablaSeleccionada1Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure ttExportarClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem17Click(Sender: TObject);
    procedure MenuItem18Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure CargarFPLE1801Click(Sender: TObject);
    procedure InformacindeFPLE1901Click(Sender: TObject);
    procedure InformacindeFPRE0101Click(Sender: TObject);
    procedure InformacindeDeudas1Click(Sender: TObject);
    procedure InformacindeRegistros1Click(Sender: TObject);
    procedure CalendariodeLectura1Click(Sender: TObject);
    procedure ConceptosyCargos1Click(Sender: TObject);
    procedure Tarifas1Click(Sender: TObject);
    procedure Consultardisponibilidaddelainformacion1Click(Sender: TObject);
    procedure Cargartodalainformacin1Click(Sender: TObject);
    procedure InformacindeREGCICLO1Click(Sender: TObject);
    procedure Anomalias1Click(Sender: TObject);
    procedure Anomalias2Click(Sender: TObject);
    procedure Anomalias3Click(Sender: TObject);
    procedure InformacindeFPLE180ALTOS1Click(Sender: TObject);
    procedure InformacindeFPLE190ALTOS1Click(Sender: TObject);
    procedure InformacindeFPLE180ALTOS2Click(Sender: TObject);
    procedure InformacindeFPLE190Altos2Click(Sender: TObject);
    procedure InformacinFPLE180ALTOS1Click(Sender: TObject);
    procedure InformacinFPLE190ALTOS1Click(Sender: TObject);
  private
    bmodoDebug: Boolean;
    QueryString: String;
    dblink: String;
    procedure GenerarTabla(Tabla: String);
    procedure CargarTabla(Tabla: String; Tipo: Boolean);
    procedure CargarTablaAltos(Tabla: String);
    procedure GenerarTablaExterna(Tabla: String);
    procedure CargarTablaExterna(Tabla: String; Tipo: Boolean);

    procedure BorrarTabla(Tabla: String; Tipo: Boolean);
    procedure BorrarTablaAltos(Tabla : String );
    procedure ConsultarRegistroEnTabla(Tabla : String; Tipo :Boolean);
    procedure ConsultarRegistroEnTablaAltos(Tabla : String );
  public
    { Public declarations }
  end;

var
  fCargaInfoComercial: TfCargaInfoComercial;

implementation

uses
  uFuncionSGD, uFormaFecha, ConsDll;

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

procedure TfCargaInfoComercial.BtnAceptarClick(Sender: TObject);
var
  myArchivo: TextFile;
  texto, tipoFormato, nombreTabla, rutaArchivo, resultadoCargue,
    MensageEstado: string;
  valuesQuery, dato, nombreCampo, sql, idSecuencia: string;
  Inicio, Longitud, numLineaArchivo: integer;
  qCamposTabla, qInsertRegistro, qLog, qIdSecuencia, qTrans: TQuery;
  RecordLogs: TStringlist;
  // Registro de tiempo
  tiempoInicial: TDateTime;
begin
  if (dblcNameTable.Text = '') or (Editfecha.Text = '') or
    (EditArchivo.Text = '') then
  begin
    raise exception.Create('Algún campo se encuentra vacío.');
  end;

  // Validar que exista archivo seleccionado.
  if not FileExists(EditArchivo.Text) then
  begin
    raise exception.Create('El archivo no existe en la ruta específicada.');
  end;

  rutaArchivo := OpenDialog1.FileName;
  nombreTabla := extractfilename(rutaArchivo);

  // Validar el nombre del archivo con la interfaz

  if Ansipos(UpperCase(trim(dblcNameTable.Text)), UpperCase(trim(nombreTabla)
    )) = 0 then
    raise exception.Create
      ('El archivo seleccionado no corresponde con el archivo cargado.');

  // Id log cargue
  qIdSecuencia := TQuery.Create(Application);
  qIdSecuencia.DatabaseName := 'BaseDato';
  qIdSecuencia.sql.Text :=
    'SELECT SQ_ID_CARGUE_INFO_COMERCIAL.NEXTVAL AS SECUENCIA FROM DUAL';
  qIdSecuencia.open;
  idSecuencia := qIdSecuencia.FieldByName('SECUENCIA').AsString;

  // Variable código Usuario traer de ConsDll
  ConsDll.RefrescarVariables;

  // idSecuencia := '3';
  Inicio := 0;
  numLineaArchivo := 0;
  valuesQuery := '';

  qLog := TQuery.Create(Application);
  qLog.DatabaseName := 'BaseDato';

  qTrans := TQuery.Create(Application);
  qTrans.DatabaseName := 'BaseDato';

  try
    tiempoInicial := Now;

    // Registro de evento
    sql := 'INSERT INTO LOG_CARGUE_INFO_COMERCIAL (ID_CARGUE_INFO_COMERCIAL, CODIGOUSUARIO) VALUES ('
      + idSecuencia + ',' + IntToStr(VarCodigoUsuario) + ')';
    qLog.sql.Text := sql;
    qLog.ExecSQL;
    qLog.sql.Clear;

    // Iniciar Transacción
    qTrans.sql.Clear;
    qTrans.sql.Text := 'SELECT SYSDATE FROM DUAL';
    qTrans.open;
    qTrans.Database.StartTransaction;

    // Subir Info
    resultadoCargue := SubirInfoSarta(dblcNameTable.Text, idSecuencia);

    if resultadoCargue = 'Error_base_datos' then
    begin
      if qTrans.Database.InTransaction then
        qTrans.Database.Rollback;
    end
    else
    begin
      if qTrans.Database.InTransaction then
        qTrans.Database.Commit;
      // Actualizar Estado registro de evento.
      sql := 'UPDATE LOG_CARGUE_INFO_COMERCIAL C SET C.ESTADO_CARGUE = ''EXITOSO'' WHERE C.ID_CARGUE_INFO_COMERCIAL = '
        + idSecuencia;
      qLog.sql.Text := sql;
      qLog.ExecSQL;
      qLog.sql.Clear;

      MensageEstado := 'Se han Insertado ' + resultadoCargue +
        ' Registros exitosamente en: ' + TimeBetween(tiempoInicial, Now) +
        ' segundos';
      ShowMessage(MensageEstado);
    end;

    EditArchivo.Text := '';
    // liberar el archivo del OpenDialog1

  finally
    qLog.Free;
    qIdSecuencia.Free;
    qTrans.Free;
  end;
end;

procedure TfCargaInfoComercial.FormCreate(Sender: TObject);
var
  qry: TQuery;
begin
  TRY

    Try
      qry := TQuery.Create(Application);
      qry.DatabaseName := 'BaseDato';
      qry.sql.Add('SELECT VALOR FROM PARAMETRO WHERE CODIGOPARAMETRO=''INC'' ');
      qry.open;
      dblink := qry.FieldByName('VALOR').AsString;

    Except
      dblink := 'EXTPRO';
    End;

  finally
    qry.Free;
  end;

end;

procedure TfCargaInfoComercial.btnCancelarClick(Sender: TObject);
begin
  fCargaInfoComercial.Close;
end;

function TfCargaInfoComercial.SubirInfoSarta(pNombreTabla,
  pIdCargue: string): string;
var
  myArchivo: TextFile;
  texto, tipoFormato, nombreTabla, MensageEstado: string;
  valuesQuery, dato, nombreCampo, sqlInsert, idSecuencia, msgFalla,
    sFechaOrcl: string;
  Inicio, Longitud, numLineaArchivo, totalLineasArchivo: integer;
  qCamposTabla, qInsertRegistro, qDebugRegistro, qLog, qry: TQuery;
  RecordLogs, informacionArchivo: TStringlist;
begin
  if bmodoDebug then
    ShowMessage('Subir info de ' + OpenDialog1.FileName);

  // Contar Registros
  informacionArchivo := TStringlist.Create;
  informacionArchivo.LoadFromFile(OpenDialog1.FileName);
  totalLineasArchivo := informacionArchivo.Count;
  informacionArchivo.Free;

  AssignFile(myArchivo, OpenDialog1.FileName);
  Reset(myArchivo);

  qCamposTabla := TQuery.Create(Application);
  qCamposTabla.DatabaseName := 'BaseDato';
  qInsertRegistro := TQuery.Create(Application);
  qInsertRegistro.DatabaseName := 'BaseDato';
  qDebugRegistro := TQuery.Create(Application);
  qDebugRegistro.DatabaseName := 'BaseDato';
  qry := TQuery.Create(Application);
  qry.DatabaseName := 'BaseDato';
  RecordLogs := TStringlist.Create;
  // Inicializar
  Inicio := 0;
  valuesQuery := '';
  numLineaArchivo := 0;

  try
    try
      qry.Close;
      qry.sql.Clear;
      qry.sql.Text := 'ALTER SESSION SET NLS_NUMERIC_CHARACTERS=''.,''';
      qry.ExecSQL;

      qCamposTabla.sql.Text := 'SELECT C.NOMBRECAMPO, C.TAMANOCAMPO' +
        '    FROM INFORMACION_TABLAS_CARGUE C, ALL_TAB_COLUMNS TC' +
        '   WHERE     1 = 1' + '         AND C.NOMBRECAMPO = TC.COLUMN_NAME' +
        '         AND OWNER = ''SIGCOM''' +
        '  AND C.NOMBRETABLA = TC.TABLE_NAME  AND NOMBRETABLA = ' +
        QuotedStr(pNombreTabla) + ' ORDER BY COLUMN_ID';

      qCamposTabla.open;

      sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(Editfecha.Text));

      while not Eof(myArchivo) do
      begin
        numLineaArchivo := numLineaArchivo + 1;
        Readln(myArchivo, texto);
        if bmodoDebug then
          ShowMessage(texto);

        // Armar consulta
        qInsertRegistro.Close;
        qInsertRegistro.sql.Clear;
        qInsertRegistro.sql.Add('Insert Into ' + pNombreTabla + ' VALUES ( ');

        qCamposTabla.First;
        // Importar todos los campos de la tabla
        while not qCamposTabla.Eof do
        begin
          Longitud := qCamposTabla.FieldByName('TAMANOCAMPO').AsInteger;
          nombreCampo := qCamposTabla.FieldByName('NOMBRECAMPO').AsString;
          if bmodoDebug then
            ShowMessage('Inicio: ' + IntToStr(Inicio) + ', Longitud: (' +
              IntToStr(Longitud) + ')');
          dato := copy(texto, Inicio, Longitud);
          if Inicio = 0 then
            Inicio := 1;
          Inicio := Inicio + Longitud;
          valuesQuery := valuesQuery + 'TRIM(' + QuotedStr(dato) + '), ';
          if bmodoDebug then
            ShowMessage('Nombre Campo: ' + nombreCampo + ' dato: ' + dato);
          qCamposTabla.Next;
        end;

        sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';

        valuesQuery := valuesQuery + sFechaOrcl + ', ' + pIdCargue + ')';
        if bmodoDebug then
          ShowMessage(valuesQuery);

        qInsertRegistro.sql.Add(valuesQuery);
        // Insert
        qInsertRegistro.ExecSQL;
        Application.ProcessMessages;
        // Inicializar
        Inicio := 0;
        valuesQuery := '';
      end;
      Result := IntToStr(numLineaArchivo);
    except
      // Mostrar error de base de dato
      on E: exception do
      begin

        MensageEstado := 'Ocurrio un error en la línea ' +
          IntToStr(numLineaArchivo) +
          ', por favor verifique el archivo e intente cargar de nuevo, Error: '
          + chr(13) + E.ClassName + ' error raised, with message : ' + chr(13) +
          E.Message;
        ShowMessage(MensageEstado);
        RecordLogs.Add('// Error en la línea ' + IntToStr(numLineaArchivo));
        RecordLogs.Add(MensageEstado);
        RecordLogs.Add(qInsertRegistro.sql.GetText);
        // RecordLogs.Add(qDebugRegistro.sql.GetText);
        RecordLogs.SaveToFile(GetTemporalPath + 'sqlLog' + pNombreTabla
          + '.txt');
        Result := 'Error_base_datos';
      end;
    end;
  finally
    begin
      qCamposTabla.Free;
      qInsertRegistro.Free;
      RecordLogs.Free;
      qry.Free;
    end;
  end;
end;

procedure TfCargaInfoComercial.SpeedButtonFechaClick(Sender: TObject);
begin
  Editfecha.Setfocus;
  sFecha := Editfecha.Text;
  Editfecha.Text := GetFecha;
end;

procedure TfCargaInfoComercial.FormShow(Sender: TObject);
begin
  qNameTable.Close;
  qNameTable.open;
end;

procedure TfCargaInfoComercial.EditfechaChange(Sender: TObject);
var
  FechaMod, FechaAct: string;
begin
  FechaMod := Editfecha.Text;
  if FechaMod < DatetoStr(Now) then
  begin
    raise exception.Create('La Fecha ingresada no es válida.');
  end;

end;

function TfCargaInfoComercial.TimeBetween(const ANow, AThen: TDateTime): string;
var
  horaLimite, tiempoTotal: string;
  tiempoTemp: TDateTime;
begin
  tiempoTemp := AThen - ANow;
  horaLimite := FormatDateTime('hh', tiempoTemp);
  if StrToInt(horaLimite) < 12 then
    tiempoTotal := FormatDateTime('nn:ss', tiempoTemp)
  else
    tiempoTotal := FormatDateTime('hh:nn:ss', tiempoTemp);

  Result := tiempoTotal;
end;

procedure TfCargaInfoComercial.btnClick(Sender: TObject);
var
  qry: TQuery;
begin
  if (dblcNameTable.Text = '') or (Editfecha.Text = '') then
  begin
    raise exception.Create('Algún campo se encuentra vacío.');
  end;

  if Application.MessageBox
    (PChar('¿ Esta seguro que desea borrar la información de la tabla  : ' +
    dblcNameTable.Text + ' para la fecha : ' + Editfecha.Text + ' ?'),
    'Confirmación', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
  begin
    try
      qry := TQuery.Create(Application);
      qry.DatabaseName := 'BaseDato';
      qry.sql.Add('DELETE ' + dblcNameTable.Text +
        ' WHERE FECHA_LECTURA_PROGRAMADA=TO_DATE(''' + Editfecha.Text +
        ''', ''DD/MM/YYYY'') ');
      qry.ExecSQL;

      if qry.RowsAffected > 0 then
      begin
        Application.MessageBox
          (PChar('Se han eliminado : ' + IntToStr(qry.RowsAffected) +
          ' registros de la tabla : ' + dblcNameTable.Text + ' '),
          'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
      end
      ELSE
        Application.MessageBox(PChar('No se ha eliminado ningun registro.'),
          'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

    finally
      qry.Free;
    end;

  end;

end;

procedure TfCargaInfoComercial.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    EditArchivo.Text := OpenDialog1.FileName;
end;

procedure TfCargaInfoComercial.CargarTablaSeleccionada1Click(Sender: TObject);
var
  myArchivo: TextFile;
  texto, tipoFormato, nombreTabla, rutaArchivo, resultadoCargue,
    MensageEstado: string;
  valuesQuery, dato, nombreCampo, sql, idSecuencia: string;
  Inicio, Longitud, numLineaArchivo: integer;
  qCamposTabla, qInsertRegistro, qLog, qIdSecuencia, qTrans: TQuery;
  RecordLogs: TStringlist;
  // Registro de tiempo
  tiempoInicial: TDateTime;
begin
  if (dblcNameTable.Text = '') or (Editfecha.Text = '') or
    (EditArchivo.Text = '') then
  begin
    raise exception.Create('Algún campo se encuentra vacío.');
  end;

  // Validar que exista archivo seleccionado.
  if not FileExists(EditArchivo.Text) then
  begin
    raise exception.Create('El archivo no existe en la ruta específicada.');
  end;

  rutaArchivo := OpenDialog1.FileName;
  nombreTabla := extractfilename(rutaArchivo);

  // Validar el nombre del archivo con la interfaz

  if Ansipos(UpperCase(trim(dblcNameTable.Text)), UpperCase(trim(nombreTabla)
    )) = 0 then
    raise exception.Create
      ('El archivo seleccionado no corresponde con el archivo cargado.');

  // Id log cargue
  qIdSecuencia := TQuery.Create(Application);
  qIdSecuencia.DatabaseName := 'BaseDato';
  qIdSecuencia.sql.Text :=
    'SELECT SQ_ID_CARGUE_INFO_COMERCIAL.NEXTVAL AS SECUENCIA FROM DUAL';
  qIdSecuencia.open;
  idSecuencia := qIdSecuencia.FieldByName('SECUENCIA').AsString;

  // Variable código Usuario traer de ConsDll
  ConsDll.RefrescarVariables;

  // idSecuencia := '3';
  Inicio := 0;
  numLineaArchivo := 0;
  valuesQuery := '';

  qLog := TQuery.Create(Application);
  qLog.DatabaseName := 'BaseDato';

  qTrans := TQuery.Create(Application);
  qTrans.DatabaseName := 'BaseDato';

  try
    tiempoInicial := Now;

    // Registro de evento
    sql := 'INSERT INTO LOG_CARGUE_INFO_COMERCIAL (ID_CARGUE_INFO_COMERCIAL, CODIGOUSUARIO) VALUES ('
      + idSecuencia + ',' + IntToStr(VarCodigoUsuario) + ')';
    qLog.sql.Text := sql;
    qLog.ExecSQL;
    qLog.sql.Clear;

    // Iniciar Transacción
    qTrans.sql.Clear;
    qTrans.sql.Text := 'SELECT SYSDATE FROM DUAL';
    qTrans.open;
    qTrans.Database.StartTransaction;

    // Subir Info
    resultadoCargue := SubirInfoSarta(dblcNameTable.Text, idSecuencia);

    if resultadoCargue = 'Error_base_datos' then
    begin
      if qTrans.Database.InTransaction then
        qTrans.Database.Rollback;
    end
    else
    begin
      if qTrans.Database.InTransaction then
        qTrans.Database.Commit;
      // Actualizar Estado registro de evento.
      sql := 'UPDATE LOG_CARGUE_INFO_COMERCIAL C SET C.ESTADO_CARGUE = ''EXITOSO'' WHERE C.ID_CARGUE_INFO_COMERCIAL = '
        + idSecuencia;
      qLog.sql.Text := sql;
      qLog.ExecSQL;
      qLog.sql.Clear;

      MensageEstado := 'Se han Insertado ' + resultadoCargue +
        ' Registros exitosamente en: ' + TimeBetween(tiempoInicial, Now) +
        ' segundos';
      ShowMessage(MensageEstado);
    end;

    EditArchivo.Text := '';
    // liberar el archivo del OpenDialog1

  finally
    qLog.Free;
    qIdSecuencia.Free;
    qTrans.Free;
  end;

end;

procedure TfCargaInfoComercial.MenuItem3Click(Sender: TObject);
begin
  GenerarTabla('FPLE180_DIARIA');
  CargarTabla('FPLE180_DIARIA', True);
  gbTable.Caption := 'Información de Activa';
end;

procedure TfCargaInfoComercial.GenerarTabla(Tabla: String);
var
  qvr: TQuery;
  typeColumn: TFieldType;
  Size: integer;
  Name: String;
begin

  if cdsListado.FieldDefs.Count > 0 then
  begin
    cdsListado.Close;
    cdsListado.FieldDefs.Clear;
  end;

  try
    qvr := TQuery.Create(Application);
    qvr.DatabaseName := 'BaseDato';

    qvr.Close;
    qvr.sql.Add
      (' SELECT DISTINCT COLUMN_NAME,DATA_TYPE,DATA_LENGTH FROM ALL_TAB_COLUMNS WHERE TABLE_NAME='''
      + Tabla + ''' AND OWNER=''SIGCOM'' ORDER BY 1 ');
    qvr.open;

    while not qvr.Eof do
    begin

      if qvr.FieldByName('DATA_TYPE').AsString = 'VARCHAR2' then
      begin
        typeColumn := ftString;
        Size := qvr.FieldByName('DATA_LENGTH').AsInteger;
      end
      else if qvr.FieldByName('DATA_TYPE').AsString = 'DATE' then
      begin
        typeColumn := ftString;
        Size := 20;
      end
      else if qvr.FieldByName('DATA_TYPE').AsString = 'NUMBER' then
      begin
        typeColumn := ftFloat;
        Size := 0;
      end
      else if qvr.FieldByName('DATA_TYPE').AsString = 'FLOAT' then
      begin
        typeColumn := ftFloat;
          Size := 0;
      end
      else if qvr.FieldByName('DATA_TYPE').AsString = 'CHAR' then
      begin
        typeColumn := ftString;
          Size := qvr.FieldByName('DATA_LENGTH').AsInteger;
      end
      else
      begin
        typeColumn := ftString;
           Size := qvr.FieldByName('DATA_LENGTH').AsInteger;
      end;

      cdsListado.FieldDefs.Add(qvr.FieldByName('COLUMN_NAME').AsString,
        typeColumn, Size, False);
      qvr.Next;
    end;

    cdsListado.CreateDataSet;
  finally
    qvr.Free;
  end;
end;

procedure TfCargaInfoComercial.CargarTabla(Tabla: String; Tipo: Boolean);
var
  qvr: TQuery;
  sFecha, sFechaOrcl, variable: String;
  List: TStrings;
  i: integer;
begin
  IF (trim(Editfecha.Text) <> '') OR not Tipo THEN
  begin

    try
      qvr := TQuery.Create(Application);
      qvr.DatabaseName := 'BaseDato';

      if Tipo then
      begin
        sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(Editfecha.Text));
        sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';
        variable := ' AND FECHA_LECTURA_PROGRAMADA=' + sFechaOrcl + ' '
      end
      else
        variable := ' ';

      QueryString := 'SELECT * FROM ' + Tabla + ' WHERE 1=1 ' + variable;
      qvr.sql.Add('SELECT * FROM ' + Tabla + ' WHERE 1=1 ' + variable +
        ' AND  rownum > 0 AND rownum <= 1000  ');
      qvr.open;

      if qvr.RecordCount > 0 then
      begin
        WHILE NOT qvr.Eof do
        begin
          cdsListado.Append;

          for i := 0 to cdsListado.FieldDefs.Count - 1 do
          begin

            if qvr.FieldByName(cdsListado.FieldDefs.Items[i].Name).AsString <> ''
            then
              cdsListado.FieldByName(cdsListado.FieldDefs.Items[i].Name)
                .AsString :=
                qvr.FieldByName(cdsListado.FieldDefs.Items[i].Name).AsString;
          end;

          cdsListado.Post;
          qvr.Next;
        end;
        rcListadoLecturas.DataSource := dsLecturas;
      end
      else
        Application.MessageBox(PChar('No hay información disponible!'),
          'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

    finally
      qvr.Free;
    end;

  end
  else
  Application.MessageBox(PChar('No es posible realizar el proceso, se debe ingresar un fecha valida.'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
end;

procedure TfCargaInfoComercial.ttExportarClick(Sender: TObject);
var
  qvr: TQuery;
  Fila, Documento: TStringlist;
  i: integer;
begin
  if not  cdsListado.IsEmpty   then
  begin

    svExportar.Filter := 'CSV archivos (*.csv)|*.csv';
    if svExportar.Execute then
    begin

      Documento := TStringlist.Create;
      Fila := TStringlist.Create;
      try
        qvr := TQuery.Create(Application);
        qvr.DatabaseName := 'BaseDato';
        qvr.sql.Add(QueryString);
        qvr.open;

        Fila.Clear;
        for i := 0 to cdsListado.FieldDefs.Count - 1 do
        begin

          Fila.Add(cdsListado.FieldDefs.Items[i].Name);

        end;

        Documento.Add(Fila.CommaText);
        WHILE NOT qvr.Eof do
        begin
          Fila.Clear;
          for i := 0 to cdsListado.FieldDefs.Count - 1 do
          begin

            Fila.Add(qvr.FieldByName(cdsListado.FieldDefs.Items[i].Name)
              .AsString);

          end;

          Documento.Add(Fila.CommaText);
          qvr.Next;
        end;
        Documento.SaveToFile(svExportar.FileName);
        Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
          'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
      finally
        qvr.Free;
        Documento.Free;
        Fila.Free;
      end;

    end;
  end
  else
    Application.MessageBox
      (PChar('Debe haber al menos un registro en la grilla!'), 'Información',
      MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

end;

procedure TfCargaInfoComercial.MenuItem4Click(Sender: TObject);
begin
  GenerarTabla('FPLE190_LECT');
  CargarTabla('FPLE190_LECT', True);
  gbTable.Caption := 'Cuentas con reactiva/demanda';
end;

procedure TfCargaInfoComercial.MenuItem5Click(Sender: TObject);
begin
  GenerarTabla('FPRE010');
  CargarTabla('FPRE010', True);
  gbTable.Caption := 'Cargos por cuenta ';
end;

procedure TfCargaInfoComercial.MenuItem6Click(Sender: TObject);
begin
  GenerarTabla('FPCN010');
  CargarTabla('FPCN010', TRUE);
  gbTable.Caption := 'Deudas';
end;

procedure TfCargaInfoComercial.MenuItem7Click(Sender: TObject);
begin
  GenerarTabla('INFO_ITINERARIO_MASIVOS');
  CargarTabla('INFO_ITINERARIO_MASIVOS', True);
  gbTable.Caption := 'Registro de las cuentas para inCMS';
end;

procedure TfCargaInfoComercial.MenuItem9Click(Sender: TObject);
begin
  GenerarTabla('INCMS_CALENDARIO');
  CargarTabla('INCMS_CALENDARIO', False);
  gbTable.Caption := 'Calendario de Lectura';
end;

procedure TfCargaInfoComercial.MenuItem10Click(Sender: TObject);
begin
  GenerarTabla('SGC_FPRE020');
  CargarTabla('SGC_FPRE020', False);
  gbTable.Caption := 'Cargos y Conceptos';
end;

procedure TfCargaInfoComercial.MenuItem11Click(Sender: TObject);
begin
  GenerarTabla('FAC_VALOR_TARIFA');
  CargarTabla('FAC_VALOR_TARIFA', False);
  gbTable.Caption := 'Tarifas';
end;

procedure TfCargaInfoComercial.MenuItem2Click(Sender: TObject);
begin
  IF trim(dblcNameTable.Text) <> '' then
  begin

    GenerarTabla(dblcNameTable.Text);
    CargarTabla(dblcNameTable.Text, True);
    gbTable.Caption := 'Registro de la tabla : ' + dblcNameTable.Text;

  end
  else
    Application.MessageBox(PChar('Se debe seleccionar una opción valida!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

end;

procedure TfCargaInfoComercial.BorrarTabla(Tabla: String; Tipo: Boolean);
var
  qvr: TQuery;
  sFecha, sFechaOrcl, variable, sTextoPregunta: String;
  List: TStrings;
  i: integer;
begin
  IF (trim(Editfecha.Text) <> '') OR not Tipo THEN
  begin

    try
      qvr := TQuery.Create(Application);
      qvr.DatabaseName := 'BaseDato';

      if Tipo then
      begin
        sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(Editfecha.Text));
        sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';
        variable := ' AND FECHA_LECTURA_PROGRAMADA=' + sFechaOrcl + ' '
      end
      else
        variable := ' ';

      sTextoPregunta := '¿ Esta seguro que desea borrar la información de ' +
        Tabla + ' ? ';

      if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
        MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
      begin

        qvr.sql.Add('DELETE FROM  ' + Tabla + ' WHERE 1=1 ' + variable + ' ');
        qvr.ExecSQL;

        IF qvr.RowsAffected > 0 then
        begin
          Application.MessageBox
            (PChar('Se ha Eliminado ' + IntToStr(qvr.RowsAffected) +
            ' registros!'), 'Información', MB_OK + MB_ICONINFORMATION +
            MB_DEFBUTTON2);
        end;

      end;

    finally
      qvr.Free;
    end;

  end
  else
    Application.MessageBox(PChar('No es posible realizar el proceso, se debe ingresar un fecha valida.'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
end;

procedure TfCargaInfoComercial.MenuItem13Click(Sender: TObject);
begin

  IF trim(dblcNameTable.Text) <> '' then
  begin

    BorrarTabla(dblcNameTable.Text, True);
    cdsListado.Close;
  end
  else
    Application.MessageBox(PChar('Se debe seleccionar una opción valida!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

end;

procedure TfCargaInfoComercial.MenuItem14Click(Sender: TObject);
begin
  BorrarTabla('FPLE180_DIARIA', True);
   cdsListado.Close;
end;

procedure TfCargaInfoComercial.MenuItem15Click(Sender: TObject);
begin
  BorrarTabla('FPLE190_LECT', True);
   cdsListado.Close;
end;

procedure TfCargaInfoComercial.MenuItem16Click(Sender: TObject);
begin
  BorrarTabla('FPRE010', True);
   cdsListado.Close;
end;

procedure TfCargaInfoComercial.MenuItem17Click(Sender: TObject);
begin
  BorrarTabla('FPCN010', True);
   cdsListado.Close;
end;

procedure TfCargaInfoComercial.MenuItem18Click(Sender: TObject);
begin
  BorrarTabla('INFO_ITINERARIO_MASIVOS', True);
   cdsListado.Close;
end;

procedure TfCargaInfoComercial.MenuItem20Click(Sender: TObject);
begin
  BorrarTabla('INCMS_CALENDARIO', False);
   cdsListado.Close;
end;

procedure TfCargaInfoComercial.MenuItem21Click(Sender: TObject);
begin
  BorrarTabla('SGC_FPRE020', False);
   cdsListado.Close;
end;

procedure TfCargaInfoComercial.MenuItem22Click(Sender: TObject);
begin
  BorrarTabla('FAC_VALOR_TARIFA', False);
   cdsListado.Close;
end;

procedure TfCargaInfoComercial.CargarFPLE1801Click(Sender: TObject);
var
  sp: TStoredProc;
  sFechaOrcl, sFecha: String;
begin
  IF trim(Editfecha.Text) <> '' THEN
  begin
    try
      sFecha := FormatDateTime('YYYYMMDD', StrToDate(Editfecha.Text));

      sg_sgc_cargar_fple180_diaria.Close;
           sg_sgc_cargar_fple180_diaria.ParamByName('fechalectura_var')
        .AsString := sFecha;
      sg_sgc_cargar_fple180_diaria.Prepare;
      sg_sgc_cargar_fple180_diaria.ExecProc;
      Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

     ConsultarRegistroEnTabla('FPLE180_DIARIA',TRUE);

    except
      on E: EDBEngineError do
      begin
        Application.MessageBox(PChar('Se ha presentado un error ' + E.Message),
          'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
      end;

    end;
  end
  else
  Application.MessageBox(PChar('No es posible realizar el proceso, se debe ingresar un fecha valida.'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);

end;

procedure TfCargaInfoComercial.InformacindeFPLE1901Click(Sender: TObject);
var
  sp: TStoredProc;
  sFechaOrcl, sFecha: String;
begin
  IF trim(Editfecha.Text) <> '' THEN
  begin
    try
      sFecha := FormatDateTime('YYYYMMDD', StrToDate(Editfecha.Text));

      sp_sgc_cargar_fple190_lect.Close;
                      sp_sgc_cargar_fple190_lect.ParamByName('fechalectura_var')
        .AsString := sFecha;
      sp_sgc_cargar_fple190_lect.Prepare;
      sp_sgc_cargar_fple190_lect.ExecProc;
      Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

      ConsultarRegistroEnTabla('FPLE190_LECT',TRUE);
    except
      on E: EDBEngineError do
      begin
        Application.MessageBox(PChar('Se ha presentado un error ' + E.Message),
          'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
      end;

    end;
  end
  else
  Application.MessageBox(PChar('No es posible realizar el proceso, se debe ingresar un fecha valida.'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);

end;

procedure TfCargaInfoComercial.InformacindeFPRE0101Click(Sender: TObject);
var
  sp: TStoredProc;
  sFechaOrcl, sFecha: String;
begin
  IF trim(Editfecha.Text) <> '' THEN
  begin
    try
      sFecha := FormatDateTime('YYYYMMDD', StrToDate(Editfecha.Text));

      sp_sgc_cargar_fpre010_lect.Close;
              sp_sgc_cargar_fpre010_lect.ParamByName('fechalectura_var')
        .AsString := sFecha;

      sp_sgc_cargar_fpre010_lect.Prepare;
      sp_sgc_cargar_fpre010_lect.ExecProc;
      Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

          ConsultarRegistroEnTabla('FPRE010',TRUE);
    except
      on E: EDBEngineError do
      begin
        Application.MessageBox(PChar('Se ha presentado un error ' + E.Message),
          'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
      end;

    end;
  end
  else
  Application.MessageBox(PChar('No es posible realizar el proceso, se debe ingresar un fecha valida.'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);

end;

procedure TfCargaInfoComercial.InformacindeDeudas1Click(Sender: TObject);
var
  sp: TStoredProc;
  sFechaOrcl, sFecha: String;
begin
  IF trim(Editfecha.Text) <> '' THEN
  begin
    try
      sFecha := FormatDateTime('YYYYMMDD', StrToDate(Editfecha.Text));

      sp_sgc_cargar_FPCN010_LECT.Close;
      sp_sgc_cargar_FPCN010_LECT.ParamByName('FECHALECTURA_VAR').AsString := sFecha;

      sp_sgc_cargar_FPCN010_LECT.Prepare;
      sp_sgc_cargar_FPCN010_LECT.ExecProc;
      Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

          ConsultarRegistroEnTabla('FPCN010',TRUE);
    except
      on E: EDBEngineError do
      begin
        Application.MessageBox(PChar('Se ha presentado un error ' + E.Message),
          'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
      end;

    end;
  end
  else
   Application.MessageBox(PChar('No es posible realizar el proceso, se debe ingresar un fecha valida.'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);

end;

procedure TfCargaInfoComercial.InformacindeRegistros1Click(Sender: TObject);
var
  sp: TStoredProc;
  sFechaOrcl, sFecha: String;
begin
  IF trim(Editfecha.Text) <> '' THEN
  begin
    try
      sFecha := FormatDateTime('YYYYMMDD', StrToDate(Editfecha.Text));

      sp_sgc_cargar_info_itinerarios_masivo.Close;
      sp_sgc_cargar_info_itinerarios_masivo.ParamByName('FECHALECTURA_VAR')
        .AsString := sFecha;

      sp_sgc_cargar_info_itinerarios_masivo.Prepare;
      sp_sgc_cargar_info_itinerarios_masivo.ExecProc;
      Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);


      ConsultarRegistroEnTabla('INFO_ITINERARIO_MASIVOS',TRUE);
    except
      on E: EDBEngineError do
      begin
        Application.MessageBox(PChar('Se ha presentado un error ' + E.Message),
          'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
      end;

    end;
  end
  else
  Application.MessageBox(PChar('No es posible realizar el proceso, se debe ingresar un fecha valida.'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);

end;

procedure TfCargaInfoComercial.CalendariodeLectura1Click(Sender: TObject);
begin

  try

    sp_sgc_cargar_incms_calendario.Close;

    sp_sgc_cargar_incms_calendario.Prepare;
    sp_sgc_cargar_incms_calendario.ExecProc;
    Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

    ConsultarRegistroEnTabla('INCMS_CALENDARIO',FALSE);
  except
    on E: EDBEngineError do
    begin
      Application.MessageBox(PChar('Se ha presentado un error ' + E.Message),
        'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
    end;

  end;
end;

procedure TfCargaInfoComercial.ConceptosyCargos1Click(Sender: TObject);
begin
  try
    sp_sgc_generar_fpre020.Close;

    sp_sgc_generar_fpre020.Prepare;
    sp_sgc_generar_fpre020.ExecProc;
    Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

      ConsultarRegistroEnTabla('SGC_FPRE020',FALSE);
  except
    on E: EDBEngineError do
    begin
      Application.MessageBox(PChar('Se ha presentado un error ' + E.Message),
        'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
    end;

  end;
end;

procedure TfCargaInfoComercial.Tarifas1Click(Sender: TObject);
begin
  try

    sp_sgc_cargar_fac_valor_tarifa.Close;

    sp_sgc_cargar_fac_valor_tarifa.Prepare;
    sp_sgc_cargar_fac_valor_tarifa.ExecProc;
    Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

    ConsultarRegistroEnTabla('FAC_VALOR_TARIFA',FALSE);
  except
    on E: EDBEngineError do
    begin
      Application.MessageBox(PChar('Se ha presentado un error ' + E.Message),
        'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
    end;

  end;
end;

procedure TfCargaInfoComercial.Consultardisponibilidaddelainformacion1Click
  (Sender: TObject);
var
  qry: TQuery;
  sFechaOrcl, sFecha: String;
begin

  IF trim(Editfecha.Text) <> '' THEN
  begin
    TRY
      sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(Editfecha.Text));
      sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';

      qry := TQuery.Create(Application);
      qry.DatabaseName := 'BaseDato';
      qry.sql.Add('SELECT  count(*) as CANTIDAD FROM REGCICLO@' + dblink +
        ' WHERE FECHALECTURA=' + sFechaOrcl + ' ');
      qry.open;

      IF qry.FieldByName('CANTIDAD').AsInteger > 0 then
        Application.MessageBox
          (PChar('Ya hay información disponible para la fecha seleccionada, es posible proceder con el cargue, es probable que ya se encuentre cargada en SigCom!'),
          'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2)
      else
        Application.MessageBox
          (PChar('No hay información disponible para la fecha seleccionada!'),
          'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2)

    finally
      qry.Free;
    end;
  end
  else
  Application.MessageBox(PChar('No es posible realizar el proceso, se debe ingresar un fecha valida.'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);

end;

procedure TfCargaInfoComercial.Cargartodalainformacin1Click(
  Sender: TObject);
begin
     try
      sp_sgc_cargar_informacion_comercial.Close;
      sp_sgc_cargar_informacion_comercial.Prepare;
      sp_sgc_cargar_informacion_comercial.ExecProc;
      Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);



    except
      on E: EDBEngineError do
      begin
        Application.MessageBox(PChar('Se ha presentado un error ' + E.Message),
          'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
      end;

    end;
end;

procedure TfCargaInfoComercial.ConsultarRegistroEnTabla(Tabla: String;
  Tipo: Boolean);
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
        sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(Editfecha.Text));
        sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';
        variable := ' AND FECHA_LECTURA_PROGRAMADA=' + sFechaOrcl + ' '
      end
      else
        variable := ' ';

        qvr.sql.Add('SELECT COUNT(*) AS CANTIDAD FROM  ' + Tabla + ' WHERE 1=1 ' + variable + ' ');
        qvr.Open;

       Application.MessageBox(PChar('Hay ' +qvr.fieldByName('CANTIDAD').AsString +' registros en la tabla '+Tabla+' ' ),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

    finally
      qvr.Free;
    end;

end;

procedure TfCargaInfoComercial.InformacindeREGCICLO1Click(Sender: TObject);
begin
  GenerarTablaExterna('REGCICLO');
  CargarTablaExterna('REGCICLO', True);
  gbTable.Caption := 'Registro de cargue de información';
end;

procedure TfCargaInfoComercial.CargarTablaExterna(Tabla: String;
  Tipo: Boolean);
var
  qvr: TQuery;
  sFecha, sFechaOrcl, variable: String;
  List: TStrings;
  i: integer;
begin
  IF (trim(Editfecha.Text) <> '') OR not Tipo THEN
  begin

    try
      qvr := TQuery.Create(Application);
      qvr.DatabaseName := 'BaseDato';

      if Tipo then
      begin
        sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(Editfecha.Text));
        sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';
        variable := ' AND FECHALECTURA=' + sFechaOrcl + ' '
      end
      else
        variable := ' ';

      QueryString := 'SELECT * FROM ' + Tabla + '@'+dblink+' WHERE 1=1 ' + variable;
      qvr.sql.Add('SELECT * FROM ' + Tabla + '@'+dblink+' WHERE 1=1 ' + variable +
        ' AND  rownum > 0 AND rownum <= 1000  ');
      qvr.open;

      if qvr.RecordCount > 0 then
      begin
        WHILE NOT qvr.Eof do
        begin
          cdsListado.Append;

          for i := 0 to cdsListado.FieldDefs.Count - 1 do
          begin

            if qvr.FieldByName(cdsListado.FieldDefs.Items[i].Name).AsString <> ''
            then
              cdsListado.FieldByName(cdsListado.FieldDefs.Items[i].Name)
                .AsString :=
                qvr.FieldByName(cdsListado.FieldDefs.Items[i].Name).AsString;
          end;

          cdsListado.Post;
          qvr.Next;
        end;
        rcListadoLecturas.DataSource := dsLecturas;
      end
      else
        Application.MessageBox(PChar('No ha información disponible!'),
          'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

    finally
      qvr.Free;
    end;

  end
  else
  Application.MessageBox(PChar('No es posible realizar el proceso, se debe ingresar un fecha valida.'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);

end;

procedure TfCargaInfoComercial.GenerarTablaExterna(Tabla: String);
var
  qvr: TQuery;
  typeColumn: TFieldType;
  Size: integer;
  Name: String;
begin

  if cdsListado.FieldDefs.Count > 0 then
  begin
    cdsListado.Close;
    cdsListado.FieldDefs.Clear;
  end;

  try
    qvr := TQuery.Create(Application);
    qvr.DatabaseName := 'BaseDato';

    qvr.Close;
    qvr.sql.Add
      (' SELECT DISTINCT COLUMN_NAME,DATA_TYPE,DATA_LENGTH FROM ALL_TAB_COLUMNS@ '+dblink+' WHERE TABLE_NAME='''
      + Tabla + ''' AND OWNER=''GCDEXT01'' ORDER BY 1 ');
    qvr.open;

    while not qvr.Eof do
    begin

      if qvr.FieldByName('DATA_TYPE').AsString = 'VARCHAR2' then
      begin
        typeColumn := ftString;
        Size := qvr.FieldByName('DATA_LENGTH').AsInteger;
      end
      else if qvr.FieldByName('DATA_TYPE').AsString = 'DATE' then
      begin
        typeColumn := ftString;
          Size := 20;
      end
      else if qvr.FieldByName('DATA_TYPE').AsString = 'NUMBER' then
      begin
        typeColumn := ftFloat;
        Size := 0;
      end
      else if qvr.FieldByName('DATA_TYPE').AsString = 'FLOAT' then
      begin
        typeColumn := ftFloat;
          Size := qvr.FieldByName('DATA_LENGTH').AsInteger;
      end
      else if qvr.FieldByName('DATA_TYPE').AsString = 'CHAR' then
      begin
        typeColumn := ftString;
          Size := qvr.FieldByName('DATA_LENGTH').AsInteger;
      end
      else
      begin
        typeColumn := ftString;
           Size := qvr.FieldByName('DATA_LENGTH').AsInteger;
      end;

      cdsListado.FieldDefs.Add(qvr.FieldByName('COLUMN_NAME').AsString,
        typeColumn, Size, False);
      qvr.Next;
    end;

    cdsListado.CreateDataSet;
  finally
    qvr.Free;
  end;

end;

procedure TfCargaInfoComercial.Anomalias1Click(Sender: TObject);
begin
  GenerarTabla('SGC_CONV_ANOMALIA');
  CargarTabla('SGC_CONV_ANOMALIA', False);
  gbTable.Caption := 'Anomalias';
end;

procedure TfCargaInfoComercial.Anomalias2Click(Sender: TObject);
begin
  try

    SGC_GENERAR_CONV_ANOMALIA.Close;

    SGC_GENERAR_CONV_ANOMALIA.Prepare;
    SGC_GENERAR_CONV_ANOMALIA.ExecProc;
    Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

    ConsultarRegistroEnTabla('SGC_CONV_ANOMALIA',FALSE);
  except
    on E: EDBEngineError do
    begin
      Application.MessageBox(PChar('Se ha presentado un error ' + E.Message),
        'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
    end;

  end;

end;

procedure TfCargaInfoComercial.Anomalias3Click(Sender: TObject);
begin
  BorrarTabla('SGC_CONV_ANOMALIA', False);
   cdsListado.Close;
end;

procedure TfCargaInfoComercial.InformacindeFPLE180ALTOS1Click(
  Sender: TObject);
var
  sp: TStoredProc;
  sFechaOrcl, sFecha: String;
begin
  IF trim(Editfecha.Text) <> '' THEN
  begin
    try
      sFecha := FormatDateTime('YYYYMMDD', StrToDate(Editfecha.Text));

      sp_sgc_cargar_fple180_diario_altos.Close;
           sp_sgc_cargar_fple180_diario_altos.ParamByName('FECHALECTURA_VAR')
        .AsString := sFecha;
      sp_sgc_cargar_fple180_diario_altos.Prepare;
      sp_sgc_cargar_fple180_diario_altos.ExecProc;


      Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

     ConsultarRegistroEnTablaAltos('FPLE180_DIARIA_ALTOS');

    except
      on E: EDBEngineError do
      begin
        Application.MessageBox(PChar('Se ha presentado un error ' + E.Message),
          'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
      end;

    end;
  end
  else
    Application.MessageBox(PChar('No es posible realizar el proceso, se debe ingresar un fecha valida.'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);


end;

procedure TfCargaInfoComercial.InformacindeFPLE190ALTOS1Click(
  Sender: TObject);
var
  sp: TStoredProc;
  sFechaOrcl, sFecha: String;
begin
  IF trim(Editfecha.Text) <> '' THEN
  begin
    try
      sFecha := FormatDateTime('YYYYMMDD', StrToDate(Editfecha.Text));

      sp_sgc_cargar_fple190_diaria_altos.Close;
           sp_sgc_cargar_fple190_diaria_altos.ParamByName('FECHALECTURA_VAR')
        .AsString := sFecha;
      sp_sgc_cargar_fple190_diaria_altos.Prepare;
      sp_sgc_cargar_fple190_diaria_altos.ExecProc;
      Application.MessageBox(PChar('El proceso ha finalizado exitosamente.'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

     ConsultarRegistroEnTabla('FPLE190_DIARIA_ALTOS',TRUE);

    except
      on E: EDBEngineError do
      begin
        Application.MessageBox(PChar('Se ha presentado un error ' + E.Message),
          'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
      end;

    end;
  end
  else
  Application.MessageBox(PChar('No es posible realizar el proceso, se debe ingresar un fecha valida.'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);


end;

procedure TfCargaInfoComercial.InformacindeFPLE180ALTOS2Click(
  Sender: TObject);
begin
  GenerarTabla('FPLE180_DIARIA_ALTOS');
  CargarTablaAltos('FPLE180_DIARIA_ALTOS');
  gbTable.Caption := 'Información de Activa';
end;

procedure TfCargaInfoComercial.InformacindeFPLE190Altos2Click(
  Sender: TObject);
begin
  GenerarTabla('FPLE190_DIARIA_ALTOS');
  CargarTabla('FPLE190_DIARIA_ALTOS',TRUE);
  gbTable.Caption := 'Información de Activa';
end;

procedure TfCargaInfoComercial.InformacinFPLE180ALTOS1Click(
  Sender: TObject);
begin
  BorrarTablaAltos('FPLE180_DIARIA_ALTOS');
   cdsListado.Close;
end;

procedure TfCargaInfoComercial.InformacinFPLE190ALTOS1Click(
  Sender: TObject);
begin
  BorrarTabla('FPLE190_DIARIA_ALTOS', True);
   cdsListado.Close;
end;

procedure TfCargaInfoComercial.CargarTablaAltos(Tabla: String);
var
  qvr: TQuery;
  sFecha, sFechaOrcl, variable: String;
  List: TStrings;
  i: integer;
begin
  IF (trim(Editfecha.Text) <> '')  THEN
  begin

    try
      qvr := TQuery.Create(Application);
      qvr.DatabaseName := 'BaseDato';


        sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(Editfecha.Text));
        sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';
        variable := ' AND FECHA_PROGRAMADA=' + sFechaOrcl + ' ';


      QueryString := 'SELECT * FROM ' + Tabla + ' WHERE 1=1 ' + variable;
      qvr.sql.Add('SELECT * FROM ' + Tabla + ' WHERE 1=1 ' + variable +
        ' AND  rownum > 0 AND rownum <= 1000  ');
      qvr.open;

      if qvr.RecordCount > 0 then
      begin
        WHILE NOT qvr.Eof do
        begin
          cdsListado.Append;

          for i := 0 to cdsListado.FieldDefs.Count - 1 do
          begin

            if qvr.FieldByName(cdsListado.FieldDefs.Items[i].Name).AsString <> ''
            then
              cdsListado.FieldByName(cdsListado.FieldDefs.Items[i].Name)
                .AsString :=
                qvr.FieldByName(cdsListado.FieldDefs.Items[i].Name).AsString;
          end;

          cdsListado.Post;
          qvr.Next;
        end;
        rcListadoLecturas.DataSource := dsLecturas;
      end
      else
        Application.MessageBox(PChar('No hay información disponible!'),
          'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

    finally
      qvr.Free;
    end;

  end
  else
  Application.MessageBox(PChar('No es posible realizar el proceso, se debe ingresar un fecha valida.'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);

end;

procedure TfCargaInfoComercial.BorrarTablaAltos(Tabla: String);
var
  qvr: TQuery;
  sFecha, sFechaOrcl, variable, sTextoPregunta: String;
  List: TStrings;
  i: integer;
begin
  IF (trim(Editfecha.Text) <> '')  THEN
  begin

    try
      qvr := TQuery.Create(Application);
      qvr.DatabaseName := 'BaseDato';


        sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(Editfecha.Text));
        sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';
        variable := ' AND FECHA_PROGRAMADA=' + sFechaOrcl + ' ';

      sTextoPregunta := '¿ Esta seguro que desea borrar la información de ' +
        Tabla + ' ? ';

      if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
        MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
      begin

        qvr.sql.Add('DELETE FROM  ' + Tabla + ' WHERE 1=1 ' + variable + ' ');
        qvr.ExecSQL;

        IF qvr.RowsAffected > 0 then
        begin
          Application.MessageBox
            (PChar('Se ha Eliminado ' + IntToStr(qvr.RowsAffected) +
            ' registros!'), 'Información', MB_OK + MB_ICONINFORMATION +
            MB_DEFBUTTON2);
        end;

      end;

    finally
      qvr.Free;
    end;

  end
  else
    Application.MessageBox(PChar('No es posible realizar el proceso, se debe ingresar un fecha valida.'),
      'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);

end;

procedure TfCargaInfoComercial.ConsultarRegistroEnTablaAltos(
  Tabla: String);
  var
  qvr: TQuery;
  sFecha, sFechaOrcl, variable: String;
  List: TStrings;
  i: integer;
begin

    try
      qvr := TQuery.Create(Application);
      qvr.DatabaseName := 'BaseDato';

        sFecha := FormatDateTime('dd/mm/yyyy', StrToDate(Editfecha.Text));
        sFechaOrcl := 'TO_DATE(''' + sFecha + ''', ''DD/MM/YYYY'')';
        variable := ' AND FECHA_PROGRAMADA=' + sFechaOrcl + ' ';

        qvr.sql.Add('SELECT COUNT(*) AS CANTIDAD FROM  ' + Tabla + ' WHERE 1=1 ' + variable + ' ');
        qvr.Open;

       Application.MessageBox(PChar('Hay ' +qvr.fieldByName('CANTIDAD').AsString +' registros en la tabla '+Tabla+' ' ),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

    finally
      qvr.Free;
    end;

end;

end.
