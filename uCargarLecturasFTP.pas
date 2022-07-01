unit uCargarLecturasFTP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, DBCtrls, Mask, ComCtrls,
  ImgList, ToolWin, ToolEdit, RXDBCtrl, DBClient, Provider, Grids, DBGrids,
  FileCtrl, stdActns, Menus, utnZImage, utnZommer,uBase;

type
  TfCargarLecturasFTP = class(TFBase)
    odJson: TOpenDialog;
    Panel1: TPanel;
    iLista: TImageList;
    Panel3: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    tbConsultarBackup: TToolButton;
    tbBuscarBackup: TToolButton;
    tbDescargarBackups: TToolButton;
    ToolButton4: TToolButton;
    tbCargarLecturas: TToolButton;
    tbCargarFotos: TToolButton;
    Panel4: TPanel;
    eFechaLectura: TEdit;
    SpeedButton2: TSpeedButton;
    lfecha: TLabel;
    tbBuscarFotos: TToolButton;
    ToolButton8: TToolButton;
    odFotos: TOpenDialog;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    cdsListadoLecturas: TClientDataSet;
    rcListadoLecturas: TRxDBGrid;
    dsLecturas: TDataSource;
    sdDescargarBackups: TSaveDialog;
    dsFotos: TDataSource;
    cdsListadoFotos: TClientDataSet;
    pmListadoLecturas: TPopupMenu;
    mmBorrarRegistro: TMenuItem;
    pmListadoFotos: TPopupMenu;
    mmBorrarListadoFotos: TMenuItem;
    mmBorrarListadoLecutura: TMenuItem;
    mmBorrarListadoTotalFotos: TMenuItem;
    pmBuscarFotos: TPopupMenu;
    mmBuscarImagenes: TMenuItem;
    mmSeleccionarCarpeta: TMenuItem;
    odCarpetas: TOpenDialog;
    ZImage1: TZImage;
    zImagenes: TZommer;
    ppBuscarBackup: TPopupMenu;
    mmSelecionarBackup: TMenuItem;
    mmSelecionarGrupoBackup: TMenuItem;
    Panel6: TPanel;
    pbDescargar: TProgressBar;
    lprogreso: TLabel;
    Panel7: TPanel;
    GroupBox2: TGroupBox;
    rxListadoFotos: TRxDBGrid;
    GroupBox3: TGroupBox;
    iFoto: TImage;
    procedure btnCancelarClick(Sender: TObject);
    procedure SpeedButtonFechaClick(Sender: TObject);
    function TimeBetween(const ANow, AThen: TDateTime): string;
    procedure tbConsultarBackupClick(Sender: TObject);
    procedure tbDescargarBackupsClick(Sender: TObject);
    procedure rxListadoFotosCellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure mmBorrarRegistroClick(Sender: TObject);
    procedure mmBorrarListadoFotosClick(Sender: TObject);
    procedure mmBorrarListadoLecuturaClick(Sender: TObject);
    procedure mmBorrarListadoTotalFotosClick(Sender: TObject);
    procedure mmBuscarImagenesClick(Sender: TObject);
    procedure mmSeleccionarCarpetaClick(Sender: TObject);
    procedure cdsListadoFotosAfterScroll(DataSet: TDataSet);
    procedure iFotoClick(Sender: TObject);
    procedure mmSelecionarBackupClick(Sender: TObject);
    procedure mmSelecionarGrupoBackupClick(Sender: TObject);
    procedure tbCargarLecturasClick(Sender: TObject);
    procedure tbCargarFotosClick(Sender: TObject);
  private
    procedure CargarArchivosBackupCarpeta(DirectorioPadre: String);
    function NroArchivos(const Ruta, Ext: string): Integer;
    function CargarLecturas(Lecturas, CodigoItinerario: String): Integer;
    function ValidarFotografias: Boolean;
    Function CargarFotoBaseDatos(Ruta, FileNameFTP, Clave, CodigoItinerario
      : String): Boolean;
    Function   ValidarClaveItinerarioBD(Clave,CodigoItinerario: String): Boolean;
    procedure ActualizarListadoFotos(Listado : String);
    procedure ActualizarListadoLecturas(Listado : String);
  public
    { Public declarations }
    function RevisarExistenciaEnListado(Listado: TClientDataSet;
      FieldName, FileName: String): Boolean;
    function GetCantidadLecturasCargadas(CodigoItinerario,
      FechaLectura: String): String;
    function GetCantidadLecturasEnItinerario(CodigoItinerario,
      FechaLectura: String): String;
  end;

var
  fCargarLecturasFTP: TfCargarLecturasFTP;
  ListadoDeLecturas, ListadoItinerarios, LogGenerar: TStringList;
  Dia, Mes, Anio: Word;

implementation

uses
  uFuncionSGD, uFormaFecha, ConsDll, uCargaInfoComercial,
  uFIMPAdministrativo;

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

procedure TfCargarLecturasFTP.btnCancelarClick(Sender: TObject);
begin
  fCargaInfoComercial.Close;
end;

procedure TfCargarLecturasFTP.SpeedButtonFechaClick(Sender: TObject);
begin
  eFechaLectura.Setfocus;
  sFecha := eFechaLectura.Text;
  eFechaLectura.Text := GetFecha;
end;

function TfCargarLecturasFTP.TimeBetween(const ANow, AThen: TDateTime): string;
var
  horaLimite, tiempoTotal: string;
  tiempoTemp: TDateTime;
begin
  tiempoTemp := AThen - ANow;
  horaLimite := Formatdatetime('hh', tiempoTemp);
  if StrToInt(horaLimite) < 12 then
    tiempoTotal := Formatdatetime('nn:ss', tiempoTemp)
  else
    tiempoTotal := Formatdatetime('hh:nn:ss', tiempoTemp);

  Result := tiempoTotal;
end;

procedure TfCargarLecturasFTP.tbConsultarBackupClick(Sender: TObject);
var
  Fecha: TDate;
begin
  IF TRIM(eFechaLectura.Text) <> '' THEN
  begin
    Fecha := StrToDate(eFechaLectura.Text);
    DecodeDate(Fecha, Anio, Mes, Dia);

    ListadoItinerarios.CommaText := GetItinerariosConBackup
      ('/BackupsItinerarios/' + IntToStr(Anio) + '/' + Format(Format('%%.%dd',
      [2]), [Mes]) + '/' + Format(Format('%%.%dd', [2]), [Dia]) + '/');

    if ListadoItinerarios.Count > 0 then
      Application.MessageBox
        (PChar('Existen ' + IntToStr(ListadoItinerarios.Count) +
        ' Backups en el FTP '), 'Información', MB_OK + MB_ICONINFORMATION +
        MB_DEFBUTTON2)
    else
      Application.MessageBox
        (PChar('No hay Backups de Itinerarios para ese día!'), 'Información',
        MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

  end
  else
    Application.MessageBox(PChar('Se debe ingresar un fecha valida!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

end;

procedure TfCargarLecturasFTP.tbDescargarBackupsClick(Sender: TObject);
var
  i, J: Integer;
  Archivo: String;
  ListadoArchivos, Log: TStringList;
begin

  if ListadoItinerarios.Count > 0 then
  else
  begin
    tbConsultarBackupClick(Sender);
  end;

  if ListadoItinerarios.Count > 0 then
  begin
  sdDescargarBackups.FileName := 'Log.txt';
  sdDescargarBackups.Filter := 'Texto archivos (*.tx)|*.TXT';
  sdDescargarBackups.Execute;

  if FileExists(sdDescargarBackups.FileName) then
  begin
    ListadoArchivos := TStringList.Create;
    Log := TStringList.Create;

    lprogreso.Visible := True;
    pbDescargar.Visible := True;
    pbDescargar.Max := ListadoItinerarios.Count;
    pbDescargar.Position := 0;

    Application.MessageBox(PChar('Ha iniciado la descarga de los Backups!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

    Log.LoadFromFile(sdDescargarBackups.FileName);

    for i := 0 to ListadoItinerarios.Count - 1 do
    begin
      ListadoArchivos.Clear;
      ListadoArchivos.CommaText := GetArchivosItinerariosConBackup
        ('/BackupsItinerarios/' + IntToStr(Anio) + '/' + Format(Format('%%.%dd',
        [2]), [Mes]) + '/' + Format(Format('%%.%dd', [2]), [Dia]) + '/' +
        ListadoItinerarios[i] + '/');

      for J := 0 to ListadoArchivos.Count - 1 do
      begin
        DescargarArchivoFTP('/BackupsItinerarios/' + IntToStr(Anio) + '/' +
          Format(Format('%%.%dd', [2]), [Mes]) + '/' + Format(Format('%%.%dd',
          [2]), [Dia]) + '/' + ListadoItinerarios[i] + '/' + ListadoArchivos[J],
          ExtractFilePath(sdDescargarBackups.FileName) + ListadoArchivos
          [J], False);

        pbDescargar.Position := i;

        Log.Add(IntToStr(i) + '. Se ha a descargado el archivo : ' +
          ListadoArchivos[J] + ' Fecha : ' + DatetoStr(Now))

      end;

    end;
    Log.SaveToFile(sdDescargarBackups.FileName);

    Application.MessageBox(PChar('Ha terminado la descarga de los Backups!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

    lprogreso.Visible := False;
    pbDescargar.Visible := False;
    CargarArchivosBackupCarpeta(ExtractFilePath(sdDescargarBackups.FileName));

    end
    else
    Application.MessageBox(PChar('No se ha seleccionado un archivo valido!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
  end;

end;

procedure TfCargarLecturasFTP.rxListadoFotosCellClick(Column: TColumn);
begin
  iFoto.Picture.LoadFromFile(cdsListadoFotos.FieldByName('RUTAFOTO').AsString);
  iFoto.Hint := cdsListadoFotos.FieldByName('RUTAFOTO').AsString;
end;

procedure TfCargarLecturasFTP.FormCreate(Sender: TObject);
begin
  cdsListadoFotos.CreateDataSet;
  cdsListadoLecturas.CreateDataSet;
  ListadoDeLecturas := TStringList.Create;
  ListadoItinerarios := TStringList.Create;
  LogGenerar := TStringList.Create;
end;

procedure TfCargarLecturasFTP.mmBorrarRegistroClick(Sender: TObject);
begin
  cdsListadoLecturas.Delete;
  GroupBox1.Caption := 'Listado de Backups  : Archivos : ' +
    IntToStr(cdsListadoLecturas.RecordCount) + ' ';
end;

procedure TfCargarLecturasFTP.mmBorrarListadoFotosClick(Sender: TObject);
begin
  ListadoDeLecturas.Insert(cdsListadoLecturas.FieldByName('POSICION')
    .AsInteger, '');
  cdsListadoFotos.Delete;
end;

procedure TfCargarLecturasFTP.mmBorrarListadoLecuturaClick(Sender: TObject);
begin
  cdsListadoLecturas.EmptyDataSet;
  GroupBox1.Caption := 'Listado de Backups ';
end;

procedure TfCargarLecturasFTP.mmBorrarListadoTotalFotosClick(Sender: TObject);
begin
  cdsListadoFotos.EmptyDataSet;
  ListadoDeLecturas.Clear;
end;

procedure TfCargarLecturasFTP.mmBuscarImagenesClick(Sender: TObject);
var
  pos: Integer;
begin
  odFotos.Filter := 'JPG archivos (*.jpg)|*.jpg'; // 'Imagenes |*.jpg';
  if odFotos.Execute then
  begin
    if FileExists(odFotos.FileName) then
    begin

      if RevisarExistenciaEnListado(cdsListadoFotos, 'Nombre',
        ExtractFileName(odFotos.FileName)) then
      begin

        if not cdsListadoFotos.IsEmpty then
        begin
          cdsListadoFotos.Close;
        end;

        cdsListadoFotos.Open;
        cdsListadoFotos.Append;

        cdsListadoFotos.FieldByName('Nombre').AsString :=
          ExtractFileName(odFotos.FileName);
        cdsListadoFotos.FieldByName('RUTAFOTO').AsString := odFotos.FileName;
        cdsListadoFotos.FieldByName('ITINERARIO').AsString := '';
        cdsListadoFotos.FieldByName('CARGADA').AsString := 'NO';
        cdsListadoFotos.FieldByName('CLAVE').AsString := '';

        cdsListadoFotos.Post;
        rxListadoFotos.DataSource := dsFotos;
      end;
    end;
  end;

end;

procedure TfCargarLecturasFTP.mmSeleccionarCarpetaClick(Sender: TObject);
var
  sr: TSearchRec;
  Archivos: TStringList;
  DirectorioPadre: String;
begin
  odCarpetas.Filter := 'JPG archivos (*.jpg)|*.jpg';
  if odCarpetas.Execute then
  begin

    if directoryexists(ExtractFilePath(odCarpetas.FileName)) then
    begin
      DirectorioPadre := ExtractFilePath(odCarpetas.FileName);
      Archivos := TStringList.Create;

      if FindFirst(DirectorioPadre + '*.jpg', faAnyFile, sr) = 0 then
        repeat
          if (sr.Attr and faDirectory = 0) or (sr.Name <> '.') and
            (sr.Name <> '..') then
          begin

            if RevisarExistenciaEnListado(cdsListadoFotos, 'Nombre', sr.Name)
            then
            begin
              if not cdsListadoFotos.IsEmpty then
              begin
                cdsListadoFotos.Close;
              end;

              cdsListadoFotos.Open;
              cdsListadoFotos.Append;

              cdsListadoFotos.FieldByName('Nombre').AsString := sr.Name;
              cdsListadoFotos.FieldByName('RUTAFOTO').AsString :=
                DirectorioPadre + sr.Name;
              cdsListadoFotos.FieldByName('ITINERARIO').AsString := '';
              cdsListadoFotos.FieldByName('CARGADA').AsString := 'NO';
              cdsListadoFotos.FieldByName('CLAVE').AsString := '';
              cdsListadoFotos.Post;

              Archivos.Add(DirectorioPadre + sr.Name);
            end;
          end;
        until FindNext(sr) <> 0;
      FindClose(sr);
      rxListadoFotos.DataSource := dsFotos;
    end
    else
      raise exception.Create('El directorio seleccionado  no existe.');
  end;
end;

procedure TfCargarLecturasFTP.cdsListadoFotosAfterScroll(DataSet: TDataSet);
begin
  iFoto.Picture.LoadFromFile(cdsListadoFotos.FieldByName('RUTAFOTO').AsString);
  iFoto.Hint := cdsListadoFotos.FieldByName('RUTAFOTO').AsString;
end;

function TfCargarLecturasFTP.RevisarExistenciaEnListado(Listado: TClientDataSet;
  FieldName, FileName: String): Boolean;
begin
  Result := True;
  if Listado.RecordCount > 0 then
  begin
    Listado.First;
    while not Listado.Eof do
    begin

      if Listado.FieldByName(FieldName).AsString = FileName then
      Begin
        Result := False;
      end;

      Listado.Next;
    end;

  end;

end;

procedure TfCargarLecturasFTP.iFotoClick(Sender: TObject);
var
  Foto: TPicture;
begin
  if not cdsListadoFotos.IsEmpty then
  begin
    Foto := TPicture.Create;
    Foto.LoadFromFile(cdsListadoFotos.FieldByName('RUTAFOTO').AsString);
    zImagenes.ShowModal := True;
    zImagenes.ShowImage(Foto);

  end;
end;

procedure TfCargarLecturasFTP.mmSelecionarBackupClick(Sender: TObject);
var
  CodigoItinerario, FechaLectura, MensajeError: String;
  Flag: Boolean;
  Lecturas: TStringList;
begin

  odJson.Filter := 'JSON archivos (*.json)|*.JSON';
  if odJson.Execute then
  begin

    if FileExists(odJson.FileName) then
    begin

      if RevisarExistenciaEnListado(cdsListadoLecturas, 'Nombre',
        ExtractFileName(odJson.FileName)) then
      begin
        Lecturas := TStringList.Create;

        Lecturas.CommaText := GetInformacionBackupLecturas(odJson.FileName,
          CodigoItinerario, FechaLectura, MensajeError, Flag);

        ListadoDeLecturas.Add(Lecturas.CommaText);
        IF Flag then
        begin

          if not cdsListadoLecturas.IsEmpty then
          begin
            cdsListadoLecturas.Close;
          end;

          cdsListadoLecturas.Open;
          cdsListadoLecturas.Append;

          cdsListadoLecturas.FieldByName('Nombre').AsString :=
            ExtractFileName(odJson.FileName);
          cdsListadoLecturas.FieldByName('Registros').AsString :=
            IntToStr(Lecturas.Count);
          cdsListadoLecturas.FieldByName('POSICION').AsString :=
            IntToStr(ListadoDeLecturas.Count - 1);
          cdsListadoLecturas.FieldByName('Cargadas').AsString := '0';
          cdsListadoLecturas.FieldByName('LECTURAS').AsString :=
            Lecturas.CommaText;
          cdsListadoLecturas.FieldByName('ITINERARIO').AsString :=
            CodigoItinerario;
          cdsListadoLecturas.FieldByName('LECTURASBD').AsString :=
            GetCantidadLecturasCargadas(CodigoItinerario, FechaLectura);
          cdsListadoLecturas.FieldByName('SUMINISTROS').AsString :=
            GetCantidadLecturasEnItinerario(CodigoItinerario, FechaLectura);

          cdsListadoLecturas.Post;
          rcListadoLecturas.DataSource := dsLecturas;
          cdsListadoLecturas.First;
          GroupBox1.Caption := 'Listado de Backups  : Archivos : ' +
            IntToStr(cdsListadoLecturas.RecordCount) + ' ';
        end
        else
          raise exception.Create(MensajeError);

      end;
    end;
  end;
end;

function TfCargarLecturasFTP.GetCantidadLecturasCargadas(CodigoItinerario,
  FechaLectura: String): String;
var
  qSelect: TQuery;
begin

  try
    qSelect := TQuery.Create(nil);
    qSelect.DatabaseName := 'BaseDato';
    qSelect.SQL.Add
      ('SELECT COUNT(*) AS CANTIDAD FROM SIGCOM_LECTURA WHERE CODIGOITINERARIO ='
      + CodigoItinerario + ' AND ');
    qSelect.SQL.Add('FECHA_PROGRAMADA=TO_DATE(' + QuotedStr(FechaLectura) +
      ',''DD/MM/YYYY'') ');
    qSelect.Open;
    Result := qSelect.FieldByName('CANTIDAD').AsString;
  finally
    qSelect.Free;
  end;

end;

function TfCargarLecturasFTP.GetCantidadLecturasEnItinerario(CodigoItinerario,
  FechaLectura: String): String;
var
  qSelect: TQuery;
begin

  try
    qSelect := TQuery.Create(nil);
    qSelect.DatabaseName := 'BaseDato';
    qSelect.SQL.Add
      ('SELECT COUNT(*) AS CANTIDAD FROM SGC_INFOITINERARIO WHERE CODIGOITINERARIO ='
      + CodigoItinerario + ' AND ');
    qSelect.SQL.Add('FECHALECTURA=TO_DATE(' + QuotedStr(FechaLectura) +
      ',''DD/MM/YYYY'') ');
    qSelect.Open;
    Result := qSelect.FieldByName('CANTIDAD').AsString;
  finally
    qSelect.Free;
  end;

end;

procedure TfCargarLecturasFTP.mmSelecionarGrupoBackupClick(Sender: TObject);
begin
  odCarpetas.Filter := 'JSON archivos (*.json)|*.JSON';
  if odCarpetas.Execute then
  begin
    if directoryexists(ExtractFilePath(odCarpetas.FileName)) then
    begin
      CargarArchivosBackupCarpeta(ExtractFilePath(odCarpetas.FileName));
    end
    else
      raise exception.Create('El directorio seleccionado  NO existe.');
  end;
end;

procedure TfCargarLecturasFTP.CargarArchivosBackupCarpeta
  (DirectorioPadre: String);
var
  sr: TSearchRec;
  CodigoItinerario, FechaLectura, MensajeError: String;
  Flag: Boolean;
  Lecturas: TStringList;
begin
  Lecturas := TStringList.Create;

  if FindFirst(DirectorioPadre + '*.json', faAnyFile, sr) = 0 then
    repeat
      if (sr.Attr and faDirectory = 0) or (sr.Name <> '.') and (sr.Name <> '..')
      then
      begin

        if RevisarExistenciaEnListado(cdsListadoLecturas, 'Nombre', sr.Name)
        then
        begin
          Lecturas.CommaText := GetInformacionBackupLecturas
            (DirectorioPadre + sr.Name, CodigoItinerario, FechaLectura,
            MensajeError, Flag);

          ListadoDeLecturas.Add(Lecturas.CommaText);
          if Flag then
          begin
            if not cdsListadoLecturas.IsEmpty then
            begin
              cdsListadoLecturas.Close;
            end;

            cdsListadoLecturas.Open;
            cdsListadoLecturas.Append;
            cdsListadoLecturas.FieldByName('Nombre').AsString := sr.Name;
            cdsListadoLecturas.FieldByName('Registros').AsString :=
              IntToStr(Lecturas.Count);
            cdsListadoLecturas.FieldByName('POSICION').AsString :=
              IntToStr(ListadoDeLecturas.Count - 1);
            cdsListadoLecturas.FieldByName('Cargadas').AsString := '0';
            cdsListadoLecturas.FieldByName('ITINERARIO').AsString :=
              CodigoItinerario;
            cdsListadoLecturas.FieldByName('LECTURAS').AsString :=
              Lecturas.CommaText;
            cdsListadoLecturas.FieldByName('LECTURASBD').AsString :=
              GetCantidadLecturasCargadas(CodigoItinerario, FechaLectura);
            cdsListadoLecturas.FieldByName('SUMINISTROS').AsString :=
              GetCantidadLecturasEnItinerario(CodigoItinerario, FechaLectura);

            cdsListadoLecturas.Post;
          end
          else
          begin
            rcListadoLecturas.DataSource := dsLecturas;
            Application.MessageBox(PChar('El archivo : ' + sr.Name + ' ' +
              MensajeError), 'Información', MB_OK + MB_ICONINFORMATION +
              MB_DEFBUTTON2);
          end;

        end;
      end;
    until FindNext(sr) <> 0;
  FindClose(sr);
  rcListadoLecturas.DataSource := dsLecturas;

  GroupBox1.Caption := 'Listado de Backups  : Archivos : ' +
    IntToStr(cdsListadoLecturas.RecordCount) + ' ';

  Application.MessageBox
    (PChar('Se han cargado los archivos en el listado de Backups!'),
    'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
  cdsListadoLecturas.First;
end;

function TfCargarLecturasFTP.NroArchivos(const Ruta, Ext: string): Integer;
var
  SRec: TSearchRec;
  Attr, re: Integer;
begin
  Result := 0;
  re := FindFirst(Ruta + '*.' + Ext + ' *', faAnyFile, SRec);
  while re = 0 do
  begin
    Inc(Result);
    re := FindNext(SRec);
  end;
end;

procedure TfCargarLecturasFTP.tbCargarLecturasClick(Sender: TObject);
var
  Itinerarios: TStringList;
begin

  IF cdsListadoLecturas.RecordCount > 0 THEN
  begin
    cdsListadoLecturas.First;
    Itinerarios := TStringList.Create;
    while not cdsListadoLecturas.Eof do
    begin
      Itinerarios.Values[cdsListadoLecturas.FieldByName('ITINERARIO').AsString]
        := IntToStr(CargarLecturas(cdsListadoLecturas.FieldByName('LECTURAS')
        .AsString, cdsListadoLecturas.FieldByName('ITINERARIO').AsString));

      cdsListadoLecturas.Next;
    end;
    LogGenerar.SaveToFile(GetTemporalPath + '/log_cargue_lecturas.txt');

          ActualizarListadoLecturas(Itinerarios.CommaText);
      Application.MessageBox(PChar('Se han cargado las lecturas al sistema!'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

  end
  else
    Application.MessageBox(PChar('No hay lecturas para cargar al sistema!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

end;

function TfCargarLecturasFTP.CargarLecturas(Lecturas, CodigoItinerario
  : String): Integer;
var
  q: TQuery;
  L: TStringList;
  i: Integer;
  CodigoCuenta: String;
  numero: Integer;
begin
  L := TStringList.Create;

  L.CommaText := Lecturas;
  numero := 0;

  for i := 0 to L.Count - 1 do
  begin
    try
      q := TQuery.Create(nil);
      q.DatabaseName := 'BaseDato';
      q.SQL.Add('alter session set NLS_NUMERIC_CHARACTERS =''.,'' ');
      q.ExecSQL;

      q.SQL.Clear;
      q.SQL.Add(L[i]);

      LogGenerar.Add('CodigoItinerario : ' + CodigoItinerario + '  : SQL :' +
        q.SQL.Text);
      q.ExecSQL;

      LogGenerar.Add('CodigoItinerario : ' + CodigoItinerario +
        '  Cuenta Cargada');
      Inc(numero);
    except
      on e: EDBEngineError do
      begin
        if not(e.Errors[0].ErrorCode = 9729) or (e.Errors[0].ErrorCode = 13059)
        then
          LogGenerar.Add('CodigoItinerario : ' + CodigoItinerario + ' : ' +
            e.Message + ' Codigo : ' + IntToStr(e.Errors[0].ErrorCode))
        else
        Begin
          if e.Errors[0].ErrorCode = 9729 then
            LogGenerar.Add('CodigoItinerario : ' + CodigoItinerario +
              '  : La cuenta ya esta REGISTRADA')
          else
            LogGenerar.Add('CodigoItinerario : ' + CodigoItinerario +
              '  Numero no Valido');
        end;
      end;
    end;
    Result := numero;
  end;

end;

procedure TfCargarLecturasFTP.tbCargarFotosClick(Sender: TObject);
var
  RutaFTP: String;
  Foto: String;
  Fecha : TDateTime;
  ListadoFotos : TStringList;
begin
  IF TRIM(eFechaLectura.Text) <> '' THEN
  begin
  
    Fecha := StrToDate(eFechaLectura.Text);
    DecodeDate(Fecha, Anio, Mes, Dia);
  if ValidarFotografias then
  begin
    if cdsListadoFotos.RecordCount > 0 THEN
    begin
    cdsListadoFotos.First;
      ListadoFotos := TStringList.Create;
      While not cdsListadoFotos.Eof do
      begin

      IF cdsListadoFotos.FieldByName('CARGADA').AsString = 'NO' then
      begin
        RutaFTP := '/FotosSigcom/' + IntToStr(Anio) + '/' +
          Format(Format('%%.%dd', [2]), [Mes]) + '/' +
          Format(Format('%%.%dd', [2]), [Dia]) + '/' +
          cdsListadoFotos.FieldByName('ITINERARIO').AsString + '/' +
          cdsListadoFotos.FieldByName('CLAVE').AsString + '/';

          try
        Foto := UpLoadFotos(cdsListadoFotos.FieldByName('RUTAFOTO')
          .AsString, RutaFTP);
         Except
            Application.MessageBox(PChar('Ha ocurrido un error al intentar cargar las fotos, reivise las credenciales (el usuario debe tener permisos de escritura) o contacte a soporte tecnico.'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
          EXIT;
         end;


        if Foto <> '' then
        if  CargarFotoBaseDatos(RutaFTP, Foto,
            cdsListadoFotos.FieldByName('CLAVE').AsString,
            cdsListadoFotos.FieldByName('ITINERARIO').AsString) then
         ListadoFotos.Values[cdsListadoFotos.fieldbyName('RUTAFOTO').AsString] := 'SI';

        end;

        cdsListadoFotos.Next;
      end;

      ActualizarListadoFotos(ListadoFotos.CommaText);
      Application.MessageBox(PChar('Se han cargado las fotos al sistema!'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

    end
    else
      Application.MessageBox(PChar('No hay Fotos para cargar al sistema!'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
  end
  else
    Application.MessageBox
      (PChar('Alguno de los registros no tiene la información suficiente o valida para cargarse al sistema, revise código de cuenta o código itinerario.'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
 end
 else
  Application.MessageBox
      (PChar('Se debe ingresar un fecha valida!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);


end;

function TfCargarLecturasFTP.ValidarFotografias: Boolean;
begin
  if cdsListadoFotos.RecordCount > 0 THEN
  begin
    cdsListadoFotos.First;
    Result := True;
    while not cdsListadoFotos.Eof do
    begin

      IF  NOT (TRIM(cdsListadoFotos.FieldByName('ITINERARIO').AsString) <> '') then
        Result := False;

      IF NOT (TRIM(cdsListadoFotos.FieldByName('CLAVE').AsString) <> '') then
        Result := False;

 { if Result = True then
  if ValidarClaveItinerarioBD(cdsListadoFotos.FieldByName('CLAVE').AsString,cdsListadoFotos.FieldByName('ITINERARIO').AsString) then
       Result := True
       else
       Result := false;  }

      cdsListadoFotos.Next;
    end;

  end;
end;

function TfCargarLecturasFTP.CargarFotoBaseDatos(Ruta, FileNameFTP, Clave,
  CodigoItinerario: String): Boolean;
var
  q: TQuery;
  FechaL: String;
  Fecha : TdateTime;
begin
    Fecha := StrToDate(eFechaLectura.Text);
    DecodeDate(Fecha, Anio, Mes, Dia);

  Result := False;
  FechaL := Format(Format('%%.%dd', [2]), [Dia]) + '/' +
    Format(Format('%%.%dd', [2]), [Mes]) + '/' + IntToStr(Anio);
  try
    q := TQuery.Create(nil);
    q.DatabaseName := 'BaseDato';

    q.SQL.Add('INSERT INTO SIGCOM_FOTO');
    q.SQL.Add(
      '(CLAVE,NOMBREFOTO,TIPOFOTO,RUTA_FOTO,CODIGOITINERARIO,FECHALECTURA,');
    q.SQL.Add('TIPOCLAVE,FECHA_GUARDADO,CALIDAD)');
    q.SQL.Add('values (' + Clave + ',' +QuotedStr(FileNameFTP)+ ',''15'',' +QuotedStr(Ruta)+ ',' +
      CodigoItinerario + ' ');
    q.SQL.Add(',to_date(' + QuotedStr(FechaL) +
      ',''dd/mm/yyyy''),''1'',SYSDATE,null)');
    q.ExecSQL;

    if q.RowsAffected > 0 then
      Result := True;

  finally
    q.Free;
  end;
end;


function TfCargarLecturasFTP.ValidarClaveItinerarioBD(Clave,
  CodigoItinerario: String): Boolean;
var
  q: TQuery;
  Fecha: String;
begin
  Result := False;
  Fecha := Format(Format('%%.%dd', [2]), [Dia]) + '/' +
    Format(Format('%%.%dd', [2]), [Mes]) + '/' + IntToStr(Anio) + '/';
  try
    q := TQuery.Create(nil);
    q.DatabaseName := 'BaseDato';
    q.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM ');
    q.SQL.Add('SGC_INFOITINERARIO WHERE CLAVE='+Clave+' AND CODIGOITINERARIO='+CodigoItinerario+' AND FECHALECTURA= to_date(' + QuotedStr(Fecha) +',''dd/mm/yyyy'')');
    q.open;

    if q.FieldByName('CANTIDAD').AsInteger > 0 then
      Result := True;

  finally
    q.Free;
  end;
end;

procedure TfCargarLecturasFTP.ActualizarListadoFotos(Listado: String);
var
ListadoF : TStringList;
i : Integer;
begin
ListadoF := TStringList.Create;
ListadoF.CommaText := Listado;



cdsListadoFotos.First;
WHILE NOT cdsListadoFotos.Eof do
begin
cdsListadoFotos.Edit;
  if ListadoF.Values[CdsListadoFotos.FieldByName('RUTAFOTO').AsString]  <> '' then
   CdsListadoFotos.FieldByName('CARGADA').AsString  := 'SI';
cdsListadoFotos.Post;

 cdsListadoFotos.Next;
end;

end;

procedure TfCargarLecturasFTP.ActualizarListadoLecturas(Listado: String);
var
ListadoF : TStringList;
i : Integer;
begin
ListadoF := TStringList.Create;
ListadoF.CommaText := Listado;

cdsListadoLecturas.First;
WHILE NOT cdsListadoLecturas.Eof do
begin
cdsListadoLecturas.Edit;
  if ListadoF.Values[cdsListadoLecturas.FieldByName('ITINERARIO').AsString]  <> '' then
   cdsListadoLecturas.FieldByName('Cargadas').AsString  := ListadoF.Values[cdsListadoLecturas.FieldByName('ITINERARIO').AsString];
cdsListadoLecturas.Post;

 cdsListadoLecturas.Next;
end;


end;

end.
