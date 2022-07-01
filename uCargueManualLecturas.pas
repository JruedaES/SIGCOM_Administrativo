unit uCargueManualLecturas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, DBCtrls, Mask, ComCtrls,
  ImgList, ToolWin, ToolEdit, RXDBCtrl, DBClient, Provider, Grids, DBGrids,
  FileCtrl, stdActns, Menus, utnZImage, utnZommer, uBase;

type
  TfCargueManualLecturas = class(TFBase)
    odJson: TOpenDialog;
    Panel1: TPanel;
    iLista: TImageList;
    Panel3: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    tbConsultarBackup: TToolButton;
    ToolButton4: TToolButton;
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
    tbNuevaLectura: TToolButton;
    tbEditar: TToolButton;
    pRemovible: TPanel;
    eCuenta: TEdit;
    Label1: TLabel;
    Panel8: TPanel;
    BitBtn1: TBitBtn;
    BitBtn31: TBitBtn;
    gbprincipal: TGroupBox;
    GroupBox4: TGroupBox;
    eMedidorLectura: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    eCuentaLectura: TEdit;
    Label7: TLabel;
    eCodigoDial: TEdit;
    sbFecha: TSpeedButton;
    eFechaProgramadaLectura: TEdit;
    Label8: TLabel;
    sbFiltrarCuenta: TSpeedButton;
    Label10: TLabel;
    eNombreLectura: TEdit;
    Label11: TLabel;
    eSedeOperativa: TEdit;
    Label12: TLabel;
    eCodigoItinerario: TEdit;
    Label13: TLabel;
    eCodigoSuplementario: TEdit;
    Panel9: TPanel;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    mObservacion: TMemo;
    gbLecturas: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    eLecturaActiva: TEdit;
    eLecturaReactiva: TEdit;
    eLecturaDemanda: TEdit;
    Label14: TLabel;
    eDireccionLectura: TEdit;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    iFoto: TImage;
    Panel10: TPanel;
    SBFiltrar: TSpeedButton;
    qListadoLecturas: TQuery;
    dsListadoLecturas: TDataSource;
    qListadoLecturasCLAVE: TStringField;
    qListadoLecturasFECHA_PROGRAMADA: TDateTimeField;
    qListadoLecturasNOMBRESUSCRIPTOR: TStringField;
    qListadoLecturasLECTURAACTUAL: TStringField;
    qListadoLecturasCODIGOITINERARIO: TFloatField;
    qListadoLecturasIN_RUTA: TFloatField;
    qListadoLecturasIN_ITINERARIO: TFloatField;
    qListadoLecturasFECHALECTURA: TDateTimeField;
    qListadoLecturasPROCESADO_INCMS: TStringField;
    qListadoLecturasNOMBRESEDEOPERATIVA: TStringField;
    qInsertLectura: TQuery;
    qUpdateLectura: TQuery;
    Splitter1: TSplitter;
    ToolButton1: TToolButton;
    qUpdateLecturaActiva: TQuery;
    qUpdateLecturaReactiva: TQuery;
    Label15: TLabel;
    eMarcamodelo: TEdit;
    Label16: TLabel;
    eNombreModelo: TEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure SpeedButtonFechaClick(Sender: TObject);
    function TimeBetween(const ANow, AThen: TDateTime): string;
    procedure tbConsultarBackupClick(Sender: TObject);
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
    procedure tbCargarLecturasClick(Sender: TObject);
    procedure tbCargarFotosClick(Sender: TObject);
    procedure tbEditarClick(Sender: TObject);
    procedure sbFechaClick(Sender: TObject);
    procedure tbNuevaLecturaClick(Sender: TObject);
    procedure eCuentaKeyPress(Sender: TObject; var Key: Char);
    procedure eCuentaExit(Sender: TObject);
    procedure eFechaLecturaClick(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qListadoLecturasAfterScroll(DataSet: TDataSet);
    procedure qListadoLecturasCalcFields(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure sbFiltrarCuentaClick(Sender: TObject);
    procedure eLecturaActivaKeyPress(Sender: TObject; var Key: Char);
    procedure eLecturaReactivaKeyPress(Sender: TObject; var Key: Char);
    procedure eLecturaDemandaKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn31Click(Sender: TObject);
  private
    fFecha: TDate;
    fCuenta: String;
    FAnomalia: String;
    FModo: Boolean;
    FIntento: Integer;
    FCodigoAdministrativo: Integer;
    FCodigoGrupoTrabajo: Integer;
    FLibro: Double;
    FCodigoItinerario: Double;
    FLecturaActiva: Double;
    FLecturaReactiva: Double;
    FCodigoSuplementario: Integer;
    FPromedioActiva: Double;
    FPromedioReactiva: Double;
    FDireccion: String;
    FNombreCliente: String;
    FNumeroMedidor: String;
    FCodigoTarifa: Integer;
    FConsumoActiva: Integer;
    FConsumoReactiva: Integer;
    FSedeOperativa: Integer;
    FCodigoDial: Integer;
    FNumeroAgujas: Double;
    FPotencia: Double;
    FUltimaLecturaActiva: Double;
    FUltimaLecturaReactiva: Double;
    FMultiplicador: Double;
    FLecturaParcialActiva: Double;
    FLecturaParcialReactiva: Double;
    FBanderaHabilitarIngreso : Boolean;
    FNombreMedidor : String;
    FMarcaMedidor : String;

    procedure CargarArchivosBackupCarpeta(DirectorioPadre: String);
    function NroArchivos(const Ruta, Ext: string): Integer;
    function CargarLecturas(Lecturas, CodigoItinerario: String): Integer;
    function ValidarFotografias: Boolean;
    Function CargarFotoBaseDatos(Ruta, FileNameFTP, Clave,
      CodigoItinerario: String): Boolean;
    Function ValidarClaveItinerarioBD(Clave, CodigoItinerario: String): Boolean;
    procedure ActualizarListadoFotos(Listado: String);
    procedure ActualizarListadoLecturas(Listado: String);

    /// CARGUE MANUAL DE LECTURAS

    Function DisponibilidadSuministro(CodigoCuenta, FechaLectura: String): Boolean;
    Function DispobilidadDeLectura(CodigoCuenta,FechaLectura: String): Boolean;
    Function ExistenciaDeCuenta(CodigoCuenta: String): Boolean;
    Function GetAnomalia: String;
    Procedure CargarDatosLectura(CodigoCuenta, aFechaLectura: String);
    Procedure ModoFormulario;
    Procedure CargarDatosClienteEnFormulario;
    Procedure BorrarListadoDeFotosLEctura;
    Procedure BorrarDatosClienteFormulario;
    Procedure HabilitarCajasDeTexto;
    procedure CargarVistaPreliminar(CodApoyo: string);
    function NombreSedeOperativa(CodigoSede: Integer): String;
    function InsertarLectura: Boolean;
    function UpdateLectura: Boolean;
    Function DatosSuministro: Boolean;
    Function DatosSuministroEdicion : Boolean;
    Function VailidarClaveFecha: Boolean;
    Function ValidarLecturas: Boolean;
    Function ValidaPreCargueCuenta( CodigoCuenta : String ; FechaLectura : String ) : Boolean;
  public
    { Public declarations }
    function RevisarExistenciaEnListado(Listado: TClientDataSet;
      FieldName, FileName: String): Boolean;
    function GetCantidadLecturasCargadas(CodigoItinerario, FechaLectura: String)
      : String;
    function GetCantidadLecturasEnItinerario
      (CodigoItinerario, FechaLectura: String): String;

    Function CalcularConsumo(LecturaAnterior, LecturaActual, Agujas: Double)
      : Integer;
    Function Medidor(Agujas: Double): Integer;
    Function DesviacionDeConsumo: Boolean;
    Function DesviacionActiva: Boolean;
    Function DesviacionReactiva: Boolean;
    /// CARGUE MANUAL DE LECTURAS

    Property Fecha: TDate Read fFecha;
    Property Cuenta: String Read fCuenta;
    Property Anomalia: String Read FAnomalia;
    Property Modo: Boolean Read FModo;
    Property Intento: Integer Read FIntento;
    Property CodigoAdministrativo: Integer Read FCodigoAdministrativo;
    Property CodigoGrupoTrabajo: Integer Read FCodigoGrupoTrabajo;
    Property Libro: Double Read FLibro;
    Property CodigoItinerario: Double Read FCodigoItinerario;
    Property LecturaActiva: Double Read FLecturaActiva;
    Property LecturaReactiva: Double Read FLecturaReactiva;
    Property UltimaLecturaActiva: Double Read FUltimaLecturaActiva;
    Property UltimaLecturaReactiva: Double Read FUltimaLecturaReactiva;
    Property LecturaPotencia: Double Read FPotencia;
    Property CodigoSuplementario: Integer Read FCodigoSuplementario;
    Property Direccion: String Read FDireccion;
    Property NombreCliente: String Read FNombreCliente;
    Property CodigoSedeOperativa: Integer Read FSedeOperativa;
    Property CodigoDial: Integer Read FCodigoDial;
    Property PromedioActiva: Double Read FPromedioActiva;
    Property PromedioReactiva: Double Read FPromedioReactiva;
    Property NumeroMedidor: String Read FNumeroMedidor;
    Property CodigoTarfia: Integer Read FCodigoTarifa;
    Property ConsumoActiva: Integer Read FConsumoActiva;
    Property ConsumoReactiva: Integer Read FConsumoReactiva;
    Property NumeroAgujas: Double Read FNumeroAgujas;
    Property Multiplicador: Double Read FMultiplicador;
    Property LecturaParcialActiva: Double Read FLecturaParcialActiva;
    Property BanderaHabilitarIngreso : Boolean Read FBanderaHabilitarIngreso;
    Property NombreMedidor : String Read  FNombreMedidor;
    Property MarcaMedidor : String Read  FMarcaMedidor;
  end;

var
  fCargueManualLecturas: TfCargueManualLecturas;
  ListadoDeLecturas, ListadoItinerarios, LogGenerar: TStringList;
  Dia, Mes, Anio: Word;

implementation

uses
  uFuncionSGD, uFormaFecha, ConsDll, uCargaInfoComercial,
  uFIMPAdministrativo, uGaleriaPreliminar;
{$R *.DFM}

function GetFecha: string;
begin
  FFormaFecha := TFFormaFecha.Create(Application);
  if FFormaFecha.ShowModal = mrOk then
  begin
    Result := DatetoStr(FFormaFecha.Date);
  end
  else
    Result := '';
  FFormaFecha.Free;
end;

procedure TfCargueManualLecturas.btnCancelarClick(Sender: TObject);
begin
  fCargaInfoComercial.Close;
end;

procedure TfCargueManualLecturas.SpeedButtonFechaClick(Sender: TObject);
begin
  sFecha := eFechaLectura.Text;
  eFechaLectura.Text := GetFecha;
  try
    fFecha := StrToDate(eFechaLectura.Text);
  except

  end;

end;

function TfCargueManualLecturas.TimeBetween(const ANow, AThen: TDateTime)
  : string;
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

procedure TfCargueManualLecturas.tbConsultarBackupClick(Sender: TObject);
begin
if  ValidaPreCargueCuenta(trim(eCuenta.Text),DateToStr(Trunc(NOW))) then
          Application.MessageBox(PChar(
              'El número de cuenta ESTA disponible para CARGUE MANUAL DE LECTURA.')
              , 'Información', MB_OK + MB_ICONINFORMATION);

end;

procedure TfCargueManualLecturas.rxListadoFotosCellClick(Column: TColumn);
begin
  iFoto.Picture.LoadFromFile(cdsListadoFotos.FieldByName('RUTAFOTO').AsString);
  iFoto.Hint := cdsListadoFotos.FieldByName('RUTAFOTO').AsString;

end;

procedure TfCargueManualLecturas.FormCreate(Sender: TObject);
begin
  cdsListadoFotos.CreateDataSet;
  cdsListadoLecturas.CreateDataSet;
  ListadoDeLecturas := TStringList.Create;
  ListadoItinerarios := TStringList.Create;
  LogGenerar := TStringList.Create;
    FLecturaParcialActiva := 0;
    FLecturaParcialReactiva := 0;
end;

procedure TfCargueManualLecturas.mmBorrarRegistroClick(Sender: TObject);
begin
  cdsListadoLecturas.Delete;
  GroupBox1.Caption := 'Listado de Backups  : Archivos : ' + IntToStr
    (cdsListadoLecturas.RecordCount) + ' ';
end;

procedure TfCargueManualLecturas.mmBorrarListadoFotosClick(Sender: TObject);
begin
  ListadoDeLecturas.Insert(cdsListadoLecturas.FieldByName('POSICION')
      .AsInteger, '');
  cdsListadoFotos.Delete;
  iFoto.Picture := NIL;
end;

procedure TfCargueManualLecturas.mmBorrarListadoLecuturaClick(Sender: TObject);
begin
  cdsListadoLecturas.EmptyDataSet;
  GroupBox1.Caption := 'Listado de Backups ';
end;

procedure TfCargueManualLecturas.mmBorrarListadoTotalFotosClick
  (Sender: TObject);
begin

  BorrarListadoDeFotosLEctura;
end;

procedure TfCargueManualLecturas.mmBuscarImagenesClick(Sender: TObject);
var
  pos: Integer;
begin
  if FBanderaHabilitarIngreso then
  begin
  odFotos.Filter := 'JPG archivos (*.jpg)|*.jpg'; // 'Imagenes |*.jpg';
  if odFotos.Execute then
  begin
    if FileExists(odFotos.FileName) then
    begin

      if RevisarExistenciaEnListado(cdsListadoFotos, 'Nombre', ExtractFileName
          (odFotos.FileName)) then
      begin

        if not cdsListadoFotos.IsEmpty then
        begin
          cdsListadoFotos.Close;
        end;

        cdsListadoFotos.Open;
        cdsListadoFotos.Append;

        cdsListadoFotos.FieldByName('Nombre').AsString := ExtractFileName
          (odFotos.FileName);
        cdsListadoFotos.FieldByName('RUTAFOTO').AsString := odFotos.FileName;
        cdsListadoFotos.FieldByName('ITINERARIO').AsString := eCodigoItinerario.Text;
        cdsListadoFotos.FieldByName('CARGADA').AsString := 'NO';
        cdsListadoFotos.FieldByName('CLAVE').AsString := eCuentaLectura.Text;

        cdsListadoFotos.Post;
        rxListadoFotos.DataSource := dsFotos;
      end;
    end;
  end;

  end
    else
   Application.MessageBox(PChar('No se ha filtrado ninguna cuenta, ingrese una, FILTRE e intente nuevamente.'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

end;

procedure TfCargueManualLecturas.mmSeleccionarCarpetaClick(Sender: TObject);
var
  sr: TSearchRec;
  Archivos: TStringList;
  DirectorioPadre: String;
begin
   if FBanderaHabilitarIngreso then
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
              cdsListadoFotos.FieldByName('ITINERARIO').AsString := eCodigoItinerario.Text;
              cdsListadoFotos.FieldByName('CARGADA').AsString := 'NO';
              cdsListadoFotos.FieldByName('CLAVE').AsString := eCuentaLectura.Text;
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

  end
  else
   Application.MessageBox(PChar('No se ha filtrado ninguna cuenta, ingrese una, FILTRE e intente nuevamente.'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
end;

procedure TfCargueManualLecturas.cdsListadoFotosAfterScroll(DataSet: TDataSet);
begin
  iFoto.Picture.LoadFromFile(cdsListadoFotos.FieldByName('RUTAFOTO').AsString);
  iFoto.Hint := cdsListadoFotos.FieldByName('RUTAFOTO').AsString;
end;

function TfCargueManualLecturas.RevisarExistenciaEnListado
  (Listado: TClientDataSet; FieldName, FileName: String): Boolean;
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

procedure TfCargueManualLecturas.iFotoClick(Sender: TObject);
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

function TfCargueManualLecturas.GetCantidadLecturasCargadas
  (CodigoItinerario, FechaLectura: String): String;
var
  qSelect: TQuery;
begin

  try
    qSelect := TQuery.Create(nil);
    qSelect.DatabaseName := 'BaseDato';
    qSelect.SQL.Add(
      'SELECT COUNT(*) AS CANTIDAD FROM SIGCOM_LECTURA WHERE CODIGOITINERARIO ='
        + CodigoItinerario + ' AND ');
    qSelect.SQL.Add('FECHA_PROGRAMADA=TO_DATE(' + QuotedStr(FechaLectura)
        + ',''DD/MM/YYYY'') ');
    qSelect.Open;
    Result := qSelect.FieldByName('CANTIDAD').AsString;
  finally
    qSelect.Free;
  end;

end;

function TfCargueManualLecturas.GetCantidadLecturasEnItinerario
  (CodigoItinerario, FechaLectura: String): String;
var
  qSelect: TQuery;
begin

  try
    qSelect := TQuery.Create(nil);
    qSelect.DatabaseName := 'BaseDato';
    qSelect.SQL.Add(
      'SELECT COUNT(*) AS CANTIDAD FROM SGC_INFOITINERARIO WHERE CODIGOITINERARIO ='
        + CodigoItinerario + ' AND ');
    qSelect.SQL.Add('FECHALECTURA=TO_DATE(' + QuotedStr(FechaLectura)
        + ',''DD/MM/YYYY'') ');
    qSelect.Open;
    Result := qSelect.FieldByName('CANTIDAD').AsString;
  finally
    qSelect.Free;
  end;

end;

procedure TfCargueManualLecturas.CargarArchivosBackupCarpeta
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
      if (sr.Attr and faDirectory = 0) or (sr.Name <> '.') and
        (sr.Name <> '..') then
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
            cdsListadoLecturas.FieldByName('Registros').AsString := IntToStr
              (Lecturas.Count);
            cdsListadoLecturas.FieldByName('POSICION').AsString := IntToStr
              (ListadoDeLecturas.Count - 1);
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
            Application.MessageBox
              (PChar('El archivo : ' + sr.Name + ' ' + MensajeError),
              'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
          end;

        end;
      end;
    until FindNext(sr) <> 0;
    FindClose(sr);
  rcListadoLecturas.DataSource := dsLecturas;

  GroupBox1.Caption := 'Listado de Backups  : Archivos : ' + IntToStr
    (cdsListadoLecturas.RecordCount) + ' ';

  Application.MessageBox(PChar(
      'Se han cargado los archivos en el listado de Backups!'), 'Información',
    MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
  cdsListadoLecturas.First;
end;

function TfCargueManualLecturas.NroArchivos(const Ruta, Ext: string): Integer;
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

procedure TfCargueManualLecturas.tbCargarLecturasClick(Sender: TObject);
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

function TfCargueManualLecturas.CargarLecturas
  (Lecturas, CodigoItinerario: String): Integer;
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
          LogGenerar.Add
            ('CodigoItinerario : ' + CodigoItinerario + ' : ' + e.Message +
              ' Codigo : ' + IntToStr(e.Errors[0].ErrorCode))
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

procedure TfCargueManualLecturas.tbCargarFotosClick(Sender: TObject);
var
  RutaFTP: String;
  Foto: String;
  Fecha: TDateTime;
  ListadoFotos: TStringList;
begin
  if FBanderaHabilitarIngreso then
  begin
    Fecha := StrToDate(eFechaProgramadaLectura.Text);
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
            RutaFTP := '/FotosSigcom/' + IntToStr(Anio) + '/' + Format
              (Format('%%.%dd', [2]), [Mes]) + '/' + Format
              (Format('%%.%dd', [2]), [Dia]) + '/' + cdsListadoFotos.FieldByName
              ('ITINERARIO').AsString + '/' + cdsListadoFotos.FieldByName
              ('CLAVE').AsString + '/';

            try
              Foto := UpLoadFotos(cdsListadoFotos.FieldByName('RUTAFOTO')
                  .AsString, RutaFTP);
            Except
              Application.MessageBox(PChar(
                  'Ha ocurrido un error al intentar cargar las fotos, reivise las credenciales (el usuario debe tener permisos de escritura) o contacte a soporte tecnico.'), 'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
              EXIT;
            end;

            if Foto <> '' then
              if CargarFotoBaseDatos(RutaFTP, Foto, cdsListadoFotos.FieldByName
                  ('CLAVE').AsString, cdsListadoFotos.FieldByName('ITINERARIO')
                  .AsString) then
                ListadoFotos.Values[cdsListadoFotos.FieldByName('RUTAFOTO')
                  .AsString] := 'SI';

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
      Application.MessageBox(PChar(
          'Alguno de los registros no tiene la información suficiente o valida para cargarse al sistema, revise código de cuenta o código itinerario.'), 'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
     end
    else
   Application.MessageBox(PChar('No se ha filtrado ninguna cuenta, ingrese una, FILTRE e intente nuevamente.'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

   if FModo then
   begin
    FIntento := 0;
    BorrarDatosClienteFormulario;
    FBanderaHabilitarIngreso := False;
     BorrarListadoDeFotosLEctura;
   end;

end;

function TfCargueManualLecturas.ValidarFotografias: Boolean;
begin
  if cdsListadoFotos.RecordCount > 0 THEN
  begin
    cdsListadoFotos.First;
    Result := True;
    while not cdsListadoFotos.Eof do
    begin

      IF NOT(trim(cdsListadoFotos.FieldByName('ITINERARIO').AsString) <> '')
        then
        Result := False;

      IF NOT(trim(cdsListadoFotos.FieldByName('CLAVE').AsString) <> '') then
        Result := False;

      { if Result = True then
        if ValidarClaveItinerarioBD(cdsListadoFotos.FieldByName('CLAVE').AsString,cdsListadoFotos.FieldByName('ITINERARIO').AsString) then
        Result := True
        else
        Result := false; }

      cdsListadoFotos.Next;
    end;

  end;
end;

function TfCargueManualLecturas.CargarFotoBaseDatos(Ruta, FileNameFTP, Clave,
  CodigoItinerario: String): Boolean;
var
  q: TQuery;
  FechaL: String;
  Fecha: TDateTime;
begin
  Fecha := StrToDate(eFechaProgramadaLectura.Text);
  DecodeDate(Fecha, Anio, Mes, Dia);

  Result := False;
  FechaL := Format(Format('%%.%dd', [2]), [Dia]) + '/' + Format
    (Format('%%.%dd', [2]), [Mes]) + '/' + IntToStr(Anio);
  try
    q := TQuery.Create(nil);
    q.DatabaseName := 'BaseDato';

    q.SQL.Add('INSERT INTO SIGCOM_FOTO');
    q.SQL.Add(
      '(CLAVE,NOMBREFOTO,TIPOFOTO,RUTA_FOTO,CODIGOITINERARIO,FECHALECTURA,');
    q.SQL.Add('TIPOCLAVE,FECHA_GUARDADO,CALIDAD)');
    q.SQL.Add('values (' + Clave + ',' + QuotedStr(FileNameFTP)
        + ',''15'',' + QuotedStr(Ruta) + ',' + CodigoItinerario + ' ');
    q.SQL.Add(',to_date(' + QuotedStr(FechaL) +
        ',''dd/mm/yyyy''),''1'',SYSDATE,null)');
    q.ExecSQL;

    if q.RowsAffected > 0 then
      Result := True;

  finally
    q.Free;
  end;
end;

function TfCargueManualLecturas.ValidarClaveItinerarioBD
  (Clave, CodigoItinerario: String): Boolean;
var
  q: TQuery;
  Fecha: String;
begin
  Result := False;
  Fecha := Format(Format('%%.%dd', [2]), [Dia]) + '/' + Format
    (Format('%%.%dd', [2]), [Mes]) + '/' + IntToStr(Anio) + '/';
  try
    q := TQuery.Create(nil);
    q.DatabaseName := 'BaseDato';
    q.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM ');
    q.SQL.Add('SGC_INFOITINERARIO WHERE CLAVE=' + Clave +
        ' AND CODIGOITINERARIO=' + CodigoItinerario +
        ' AND FECHALECTURA= to_date(' + QuotedStr(Fecha) + ',''dd/mm/yyyy'')');
    q.Open;

    if q.FieldByName('CANTIDAD').AsInteger > 0 then
      Result := True;

  finally
    q.Free;
  end;
end;

procedure TfCargueManualLecturas.ActualizarListadoFotos(Listado: String);
var
  ListadoF: TStringList;
  i: Integer;
begin
  ListadoF := TStringList.Create;
  ListadoF.CommaText := Listado;

  cdsListadoFotos.First;
  WHILE NOT cdsListadoFotos.Eof do
  begin
    cdsListadoFotos.Edit;
    if ListadoF.Values[cdsListadoFotos.FieldByName('RUTAFOTO').AsString]
      <> '' then
      cdsListadoFotos.FieldByName('CARGADA').AsString := 'SI';
    cdsListadoFotos.Post;

    cdsListadoFotos.Next;
  end;

end;

procedure TfCargueManualLecturas.ActualizarListadoLecturas(Listado: String);
var
  ListadoF: TStringList;
  i: Integer;
begin
  ListadoF := TStringList.Create;
  ListadoF.CommaText := Listado;

  cdsListadoLecturas.First;
  WHILE NOT cdsListadoLecturas.Eof do
  begin
    cdsListadoLecturas.Edit;
    if ListadoF.Values[cdsListadoLecturas.FieldByName('ITINERARIO').AsString]
      <> '' then
      cdsListadoLecturas.FieldByName('Cargadas').AsString := ListadoF.Values
        [cdsListadoLecturas.FieldByName('ITINERARIO').AsString];
    cdsListadoLecturas.Post;

    cdsListadoLecturas.Next;
  end;

end;

procedure TfCargueManualLecturas.tbEditarClick(Sender: TObject);
begin

  IF qListadoLecturas.IsEmpty then
  begin
    Application.MessageBox(PChar(
        'El Listado no contiene REGISTROS, MODIFIQUE la fecha o el numero de cuenta e intente nuevamente.'), 'Información', MB_OK + MB_ICONWARNING);
  end
  else
  begin
    if pRemovible.Visible THEN
    begin
      FBanderaHabilitarIngreso := False;
      pRemovible.Visible := False;
      if Assigned(fGaleriaPreliminar) then
      begin
      fGaleriaPreliminar.Free;
      fGaleriaPreliminar := nil;
      end;
    end
    else
    begin
      FModo := False;
      ModoFormulario;
      CargarDatosLectura(qListadoLecturasCLAVE.AsString,
        qListadoLecturasFECHA_PROGRAMADA.AsString);
        pRemovible.Visible := True;
        HabilitarCajasDeTexto;
              FBanderaHabilitarIngreso := True;
        CargarVistaPreliminar(qListadoLecturas.fieldByName('CLAVE').AsString);
       DatosSuministroEdicion;
    end;
  end;

end;

procedure TfCargueManualLecturas.sbFechaClick(Sender: TObject);
begin
  sFecha := eFechaProgramadaLectura.Text;
  eFechaProgramadaLectura.Text := GetFecha;
  try
    fFecha := StrToDate(eFechaProgramadaLectura.Text);
  except

  end;

end;

procedure TfCargueManualLecturas.tbNuevaLecturaClick(Sender: TObject);
begin
  if pRemovible.Visible THEN
    pRemovible.Visible := False
  else
  begin
    pRemovible.Visible := True;
    FModo := True;
    ModoFormulario;
    BorrarDatosClienteFormulario;
    BorrarListadoDeFotosLEctura;
       if Assigned(fGaleriaPreliminar) then
       begin
       fGaleriaPreliminar.Free;
       fGaleriaPreliminar := nil;
       end;


  end;

end;

function TfCargueManualLecturas.DisponibilidadSuministro(CodigoCuenta, FechaLectura: String)
  : Boolean;
var
  qQuery: TQuery;
begin
  try
    Result := True;

    qQuery := TQuery.Create(nil);
    qQuery.DatabaseName := 'BaseDato';

    qQuery.SQL.Add(
      'SELECT COUNT(*) AS CANTIDAD FROM sigcom_lectura WHERE TO_CHAR(fecha_programada,''YYYYMM'')=TO_CHAR(To_date('+QuotedStr(FechaLectura)+',''DD/MM/YYYY''),''YYYYMM'') ');
    qQuery.SQL.Add('AND CLAVE=SGC_FUN_CONVERTIR_CLAVE(:CODIGOCUENTA)');
    qQuery.ParamByName('CODIGOCUENTA').AsString := CodigoCuenta;
    qQuery.Open;

    if qQuery.FieldByName('CANTIDAD').AsInteger > 0 then
      Result := False;

  finally
    qQuery.Free;
  end;
end;

function TfCargueManualLecturas.DispobilidadDeLectura(CodigoCuenta, FechaLectura: String) : Boolean;
var
  qQuery, qSelect: TQuery;
  Dial: Integer;
begin

  try
    Result := True;

    qQuery := TQuery.Create(nil);
    qQuery.DatabaseName := 'BaseDato';

    qSelect := TQuery.Create(nil);
    qSelect.DatabaseName := 'BaseDato';

    qQuery.SQL.Add(
      'SELECT GP.CODIGODIAL AS CODIGODIAL FROM CLIENTESGD C, APOYO A, C_GRUPOAOL GP ');
    qQuery.SQL.Add('WHERE C.CODIGOESTADOINFRAESTRUCTURA=1');
    qQuery.SQL.Add('AND A.CODIGOAPOYO = C.CODIGOAPOYO');
    qQuery.SQL.Add(
      'AND SGC_FUN_CONVERTIR_CLAVE(C.CODIGO_CUENTA)=:CODIGOCUENTA  ');
    qQuery.SQL.Add('AND GP.CODIGOGRUPOAOL = A.GRUPOAOL');
    qQuery.ParamByName('CODIGOCUENTA').AsString := CodigoCuenta;
    qQuery.Open;

    Dial := qQuery.FieldByName('CODIGODIAL').AsInteger;

    if Dial <> 1 then
    Dial := Dial-1;


    qSelect.SQL.Add(
      'SELECT COUNT(*) AS CANTIDAD FROM INCMS_CALENDARIO WHERE  CICLO<:CODIGODIAL AND PERIODO=TO_CHAR(to_date('+QuotedStr(FechaLectura)+',''DD/MM/YYYY''),''YYYYMM'') AND NOT (ESTADO_ITINERARIO =''Tratado con Lect Pendientes'' ');
    qSelect.SQL.Add('OR ESTADO_ITINERARIO=''Enviado'')');
    qSelect.ParamByName('CODIGODIAL').AsInteger := Dial;
    qSelect.Open;

    if qSelect.FieldByName('CANTIDAD').AsInteger > 0 then
      Result := False;

  finally
    qQuery.Free;
    qSelect.Free;
  end;

end;

function TfCargueManualLecturas.ExistenciaDeCuenta(CodigoCuenta: String)
  : Boolean;
var
  qQuery: TQuery;
begin
  try
    Result := False;

    qQuery := TQuery.Create(nil);
    qQuery.DatabaseName := 'BaseDato';

    qQuery.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM CLIENTESGD WHERE  ');
    qQuery.SQL.Add(
      'SGC_FUN_CONVERTIR_CLAVE(CODIGO_CUENTA)=:CODIGOCUENTA AND CODIGOESTADOINFRAESTRUCTURA=1 ');
    qQuery.ParamByName('CODIGOCUENTA').AsString := CodigoCuenta;
    qQuery.Open;

    if qQuery.FieldByName('CANTIDAD').AsInteger > 0 then
      Result := True;

  finally
    qQuery.Free;
  end;

end;

procedure TfCargueManualLecturas.eCuentaKeyPress
  (Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', Char(VK_BACK), Char(VK_DELETE)]) then
    Key := #0;
end;

procedure TfCargueManualLecturas.eCuentaExit(Sender: TObject);
begin
  fCuenta := eCuenta.Text;
end;

procedure TfCargueManualLecturas.eFechaLecturaClick(Sender: TObject);
begin
  SpeedButtonFechaClick(Sender);
end;

function TfCargueManualLecturas.GetAnomalia: String;
var
  qQuery: TQuery;
begin
  try

    qQuery := TQuery.Create(nil);
    qQuery.DatabaseName := 'BaseDato';

    qQuery.SQL.Add('SELECT VALOR FROM SGC_PARAMETROS WHERE CODIGOPARAMETRO=50');
    qQuery.Open;

    if not qQuery.IsEmpty then
      Result := qQuery.FieldByName('VALOR').AsString
    else
    Begin
      raise exception.Create(
        'No existe el PARAMETRO para las anomalias manuales, debe tener el codigo 50, creelo e intente nuevamente.');
    end;

  finally
    qQuery.Free;
  end;

end;

procedure TfCargueManualLecturas.SBFiltrarClick(Sender: TObject);
begin

pRemovible.Visible := False;
  qListadoLecturas.Close;
  qListadoLecturas.SQL.Delete(27);

  if not(trim(eCuenta.Text) = EmptyStr) and not
    (trim(eFechaLectura.Text) = EmptyStr) then
  begin

    if ExistenciaDeCuenta(eCuenta.Text) then
    begin
      qListadoLecturas.SQL.Insert(27,
        ' AND S.CLAVE=SGC_FUN_CONVERTIR_CLAVE(:CODIGOCUENTA) AND S.FECHA_PROGRAMADA=TO_DATE('
          + QuotedStr(eFechaLectura.Text) + ',''DD/MM/YYYY'') ');
      qListadoLecturas.ParamByName('CODIGOCUENTA').AsString := eCuenta.Text;
      qListadoLecturas.ParamByName('CODIGOANOMALIA').AsString := Anomalia;
      qListadoLecturas.Open;
    end
    else
      Application.MessageBox(PChar(
          'El número de cuenta NO EXISTE, ingrese un NúMERO DE CUENTA valido e intente nuevamente.'), 'Error', MB_OK + MB_ICONERROR);

  end
  else if not(trim(eCuenta.Text) = EmptyStr) then
  begin

    if ExistenciaDeCuenta(eCuenta.Text) then
    begin
      qListadoLecturas.SQL.Insert(27,
        ' AND S.CLAVE=SGC_FUN_CONVERTIR_CLAVE(:CODIGOCUENTA) ');
      qListadoLecturas.ParamByName('CODIGOCUENTA').AsString := eCuenta.Text;
      qListadoLecturas.ParamByName('CODIGOANOMALIA').AsString := Anomalia;
      qListadoLecturas.Open;
    end
    else
      Application.MessageBox(PChar(
          'El número de cuenta NO EXISTE, ingrese un NúMERO DE CUENTA valido e intente nuevamente.'), 'Error', MB_OK + MB_ICONERROR);

  end
  else if not(trim(eFechaLectura.Text) = EmptyStr) then
  begin
    qListadoLecturas.SQL.Insert(27,
      ' AND S.FECHA_PROGRAMADA=TO_DATE(' + QuotedStr(eFechaLectura.Text)
        + ',''DD/MM/YYYY'') ');
    qListadoLecturas.ParamByName('CODIGOANOMALIA').AsString := Anomalia;
    qListadoLecturas.Open;

  end;

  IF qListadoLecturas.IsEmpty then
    Application.MessageBox(PChar(
        'El filtro que realizo no tiene resultados, MODIFIQUE la fecha o el numero de cuenta e intente nuevamente.'), 'Información', MB_OK + MB_ICONWARNING);
end;

procedure TfCargueManualLecturas.FormShow(Sender: TObject);
begin
  FAnomalia := GetAnomalia;
end;

procedure TfCargueManualLecturas.CargarDatosLectura
  (CodigoCuenta, aFechaLectura: String);
var
  qQuery: TQuery;
begin
  try

    qQuery := TQuery.Create(nil);
    qQuery.DatabaseName := 'BaseDato';

    qQuery.SQL.Add(
      'SELECT S.CLAVE,NVL(s.LECTURAACTUAL,'''') AS LECTURAACTUAL,NVL(S.LECTURAREACTIVA,'''') AS LECTURAREACTIVA,NVL(S.POTENCIA,'''') AS POTENCIA, ');
    qQuery.SQL.Add(
      'S.OBSERVACIONES,I.NUMEROCONTADOR,I.FECHALECTURA,I.M_CODIGO_LECTURA,I.NOMBRESUSCRIPTOR,I.DIRECCIONSUCRIPTOR,I.IN_RUTA,I.CODIGOITINERARIO,I.CODIGODIAL,i.CODIGOMARCAMEDIDOR,i.NOMBREMARCAMEDIDOR ');
    qQuery.SQL.Add(
      ' FROM SIGCOM_LECTURA S, SGC_INFOITINERARIO I WHERE S.CLAVE=I.CLAVE AND S.FECHA_PROGRAMADA=I.FECHALECTURA AND S.CLAVE=:CODIGOCUENTA AND FECHA_PROGRAMADA=TO_DATE(' + QuotedStr(aFechaLectura) + ',''DD/MM/YYYY'')');
    qQuery.ParamByName('CODIGOCUENTA').AsString := CodigoCuenta;
    qQuery.Open;

    if not qQuery.IsEmpty then
    begin

      eCuentaLectura.Text := qQuery.FieldByName('CLAVE').AsString;
      eMedidorLectura.Text := qQuery.FieldByName('NUMEROCONTADOR').AsString;
      eFechaProgramadaLectura.Text := qQuery.FieldByName('FECHALECTURA')
        .AsString;
      eCodigoSuplementario.Text := qQuery.FieldByName('M_CODIGO_LECTURA')
        .AsString;
      eSedeOperativa.Text := NombreSedeOperativa
        (qQuery.FieldByName('IN_RUTA').AsInteger);
      eNombreLectura.Text := qQuery.FieldByName('NOMBRESUSCRIPTOR').AsString;
      eDireccionLectura.Text := qQuery.FieldByName('DIRECCIONSUCRIPTOR')
        .AsString;
      eCodigoItinerario.Text := qQuery.FieldByName('CODIGOITINERARIO').AsString;
      eCodigoDial.Text := qQuery.FieldByName('CODIGODIAL').AsString;
      mObservacion.Text := qQuery.FieldByName('OBSERVACIONES').AsString;
      eLecturaActiva.Text := qQuery.FieldByName('LECTURAACTUAL').AsString;
      eLecturaReactiva.Text := qQuery.FieldByName('LECTURAREACTIVA').AsString;
      eLecturaDemanda.Text := qQuery.FieldByName('POTENCIA').AsString;
      eMarcamodelo.Text :=  qQuery.FieldByName('CODIGOMARCAMEDIDOR').AsString;
      eNombreModelo.Text := qQuery.FieldByName('NOMBREMARCAMEDIDOR').AsString;
    end;

  finally
    qQuery.Free;
  end;
end;

procedure TfCargueManualLecturas.ModoFormulario;
begin
  eCuentaLectura.Enabled := FModo;
  sbFiltrarCuenta.Enabled := FModo;
  sbFecha.Enabled := FModo;

end;

procedure TfCargueManualLecturas.qListadoLecturasAfterScroll(DataSet: TDataSet);
begin
  if (pRemovible.Visible) AND NOT(Fmodo) THEN
  begin
    FModo := False;
    ModoFormulario;
    CargarDatosLectura(qListadoLecturasCLAVE.AsString,
      qListadoLecturasFECHA_PROGRAMADA.AsString);
       HabilitarCajasDeTexto;
   DatosSuministroEdicion;
  if Assigned(fGaleriaPreliminar) then
  begin
    fGaleriaPreliminar.Free;
    fGaleriaPreliminar := nil;
  end;
 CargarVistaPreliminar(qListadoLecturas.fieldByName('CLAVE').AsString);
 BorrarListadoDeFotosLEctura;
  end;
end;

function TfCargueManualLecturas.NombreSedeOperativa(CodigoSede: Integer)
  : String;
var
  qQuery: TQuery;
begin
  try

    qQuery := TQuery.Create(nil);
    qQuery.DatabaseName := 'BaseDato';

    qQuery.SQL.Add(
      'SELECT NOMBRESEDEOPERATIVA FROM SEDEOPERATIVA WHERE CODIGOSEDEOPERATIVA= '
        + IntToStr(CodigoSede) + ' ');
    qQuery.Open;

    if not qQuery.IsEmpty then
      Result := qQuery.FieldByName('NOMBRESEDEOPERATIVA').AsString

        finally qQuery.Free;
  end;

end;

procedure TfCargueManualLecturas.qListadoLecturasCalcFields(DataSet: TDataSet);
begin
  qListadoLecturasNOMBRESEDEOPERATIVA.AsString := NombreSedeOperativa
    (qListadoLecturasIN_RUTA.AsInteger);
end;

procedure TfCargueManualLecturas.BitBtn1Click(Sender: TObject);
var
  sTextoPregunta: String;
begin

  if ValidarLecturas then
  begin

    sTextoPregunta :=
      '¿ Esta seguro que desea insertar/modificar la información de la cuenta [' +
      eCuentaLectura.Text + '] con fecha programada lectura [' +
      eFechaProgramadaLectura.Text + '].';

    if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
      MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
    begin


      if DesviacionDeConsumo then
      begin

        if FModo then
        begin
        if DatosSuministro then
        begin

        if FBanderaHabilitarIngreso then
        begin
          if InsertarLectura then
          begin
            Application.MessageBox(Pchar('Se han INSERTADO la lectura de la cuenta ['+eCuentaLectura.text+'] exitosamente,la cuenta pasara al sistema comercial una vez se realice el proceso de cargue en la hora programada.'),
              'Información', MB_ICONINFORMATION + MB_OK);

            if Application.MessageBox(PChar('Desea ingresar las FOTOS de la cuenta que se acaba de INSERTAR ['+eCuentaLectura.text+'] '), 'Confirmación',
             MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
          begin

           FIntento := 0;
           FBanderaHabilitarIngreso := True;
           end
          else
           begin
             FIntento := 0;
            BorrarDatosClienteFormulario;
            FBanderaHabilitarIngreso := False;
            BorrarListadoDeFotosLEctura;

            end;


          end
          else
            Application.MessageBox(Pchar(
              'Se ha producido un error, NO se ha INSERTADO la lectura de la cuenta ['+eCuentaLectura.text+'], ingrese otros datos e intente nuevamente.'), 'Error', MB_ICONERROR + MB_OK);

         end
         else
            Application.MessageBox(Pchar(
              'Se ha producido un error, NO se ha INSERTADO la lectura de la cuenta ['+eCuentaLectura.text+'], se debe filtrar la información primero para poder realizar el proceso, hagalo e intente nuevamente.'), 'Error', MB_ICONERROR + MB_OK);

         end
         else
             Application.MessageBox(
        'No hay información que permita realizar el cargue de la lectura, La cuenta ya fue leida o la cuenta para la fecha seleccionada no esta diponible, ingrese otros datos e intente nuevamente.', 'Información', MB_ICONEXCLAMATION + MB_OK);


        end
        else
        begin

          if UpdateLectura then
          begin
            Application.MessageBox
              (PChar('Se han MODIFICADO exitosamente la lectura de la cuenta ['+eCuentaLectura.text+'].'), 'Información',
              MB_ICONINFORMATION + MB_OK);
               FIntento := 0;
          end
          else
            Application.MessageBox(
              'Se ha producido un error, No se ha MODIFICADO la lectura, ingrese otros datos e intente nuevamente.', 'Error', MB_ICONERROR + MB_OK);

        end;

      end
      else
        Application.MessageBox(PChar(
            'Información Importante!'+char(13)+'La lectura que esta intentando ingresar genera un DESVIACIÓN DE CONSUMO por lo tanto se debe confirmar, [' + IntToStr(3 - FIntento) + '] faltantes.'+char(13)+'De click en Aceptar .'), 'Advertencia', MB_ICONWARNING + MB_OK);



    end;

  end;

end;

function TfCargueManualLecturas.InsertarLectura: Boolean;
begin
  Result := False;

  qInsertLectura.Close;
  qInsertLectura.ParamByName('CLAVE').AsString := eCuentaLectura.Text;
  qInsertLectura.ParamByName('LECTURAACTIVA').AsFloat := FLecturaActiva;
  qInsertLectura.ParamByName('CONSUMOCALCULADO').AsInteger := FConsumoActiva;
  qInsertLectura.ParamByName('OBSERVACION').AsString := mObservacion.Text;
  qInsertLectura.ParamByName('ANOMALIAMANUAL').AsString := FAnomalia;
  qInsertLectura.ParamByName('LECTURAREACTIVA').AsFloat := FLecturaReactiva;
  qInsertLectura.ParamByName('POTENCIA').AsFloat := FPotencia;
  qInsertLectura.ParamByName('LIBRO').AsFloat := FLibro;
  qInsertLectura.ParamByName('CODIGOITINERARIO').AsFloat := FCodigoItinerario;
  qInsertLectura.ParamByName('CODIGOTIPOMEDIDA').AsInteger := 0;
  qInsertLectura.ParamByName('FECHALECTURA').AsString :=
    eFechaProgramadaLectura.Text;
  qInsertLectura.ParamByName('CODIGOADMINISTRATIVO').AsInteger :=
    FCodigoAdministrativo;
  qInsertLectura.ParamByName('CODIGOGRUPOTRABAJO').AsInteger :=
    FCodigoGrupoTrabajo;
  qInsertLectura.ParamByName('CONSUMOREACTIVA').AsInteger := FConsumoReactiva;
  qInsertLectura.ParamByName('CODIGOSUPLEMENTARIO').AsInteger :=
    FCodigoSuplementario;
  qInsertLectura.ExecSQL;

  if qInsertLectura.RowsAffected > 0 then
    Result := True;
end;

function TfCargueManualLecturas.DatosSuministro: Boolean;
var
  qQuery: TQuery;
begin
  try
    Result := False;

    qQuery := TQuery.Create(nil);
    qQuery.DatabaseName := 'BaseDato';

    qQuery.SQL.Add('SELECT CODIGOADMINISTRATIVO,');
    qQuery.SQL.Add('CODIGOGRUPOTRABAJO,');
    qQuery.SQL.Add('FECHALECTURA,');
    qQuery.SQL.Add('LIBRO,');
    qQuery.SQL.Add('CLAVE,');
    qQuery.SQL.Add('CODIGOITINERARIO,');
    qQuery.SQL.Add('NUMEROAGUJAS,');
    qQuery.SQL.Add('ULTIMALECTURA,');
    qQuery.SQL.Add('S_LECTUR_ACTUAL_R,');
    qQuery.SQL.Add('FACTORMULTIPLICADOR,');
    qQuery.SQL.Add('NUMEROCONTADOR,');
    qQuery.SQL.Add('CODIGOITINERARIO,');
    qQuery.SQL.Add('CODIGOTIPOMEDIDA,');
    qQuery.SQL.Add('X,');
    qQuery.SQL.Add('Y,');
    qQuery.SQL.Add('NOMBRESUSCRIPTOR, ');
    qQuery.SQL.Add('DIRECCIONSUCRIPTOR,');
    qQuery.SQL.Add('IN_RUTA, ');
    qQuery.SQL.Add('CODIGODIAL, ');
    qQuery.SQL.Add('PROMEDIOACTIVA, ');
    qQuery.SQL.Add('PROMEDIOREACTIVA, ');
    qQuery.SQL.Add('TARIFA, ');
    qQuery.SQL.Add('CODIGOMARCAMEDIDOR, ');
    qQuery.SQL.Add('NOMBREMARCAMEDIDOR ');
    qQuery.SQL.Add('FROM SGC_INFOITINERARIO I');
    qQuery.SQL.Add('WHERE I.FECHALECTURA = TO_DATE(' + QuotedStr
        (eFechaProgramadaLectura.Text) + ',''DD/MM/YYYY'') ');
    qQuery.SQL.Add('AND I.CLAVE = ' + eCuentaLectura.Text + '  ');
    qQuery.SQL.Add('AND NOT EXISTS (SELECT null FROM SIGCOM_LECTURA S WHERE S.CLAVE=I.CLAVE ');
    qQuery.SQL.Add('AND S.FECHA_PROGRAMADA = I.FECHALECTURA )');

    qQuery.Open;
    if not qQuery.IsEmpty then
    begin
      FCodigoAdministrativo := qQuery.FieldByName('CODIGOADMINISTRATIVO')
        .AsInteger;
      FCodigoGrupoTrabajo := qQuery.FieldByName('CODIGOGRUPOTRABAJO').AsInteger;
      FLibro := qQuery.FieldByName('LIBRO').AsInteger;
      FCodigoItinerario := qQuery.FieldByName('CODIGOITINERARIO').AsInteger;
      FCodigoSuplementario := qQuery.FieldByName('CODIGOTIPOMEDIDA').AsInteger;
      FNombreCliente := qQuery.FieldByName('NOMBRESUSCRIPTOR').AsString;
      FDireccion := qQuery.FieldByName('DIRECCIONSUCRIPTOR').AsString;
      FSedeOperativa := qQuery.FieldByName('IN_RUTA').AsInteger;
      FCodigoDial := qQuery.FieldByName('CODIGODIAL').AsInteger;
      FUltimaLecturaActiva := qQuery.FieldByName('ULTIMALECTURA').AsInteger;
      FUltimaLecturaReactiva := qQuery.FieldByName('S_LECTUR_ACTUAL_R')
        .AsInteger;
      FPromedioActiva := qQuery.FieldByName('PROMEDIOACTIVA').AsInteger;
      FPromedioReactiva := qQuery.FieldByName('PROMEDIOREACTIVA').AsInteger;
      FNumeroMedidor := qQuery.FieldByName('NUMEROCONTADOR').AsString;
      FCodigoTarifa := qQuery.FieldByName('TARIFA').AsInteger;
      FNumeroAgujas := qQuery.FieldByName('NUMEROAGUJAS').AsFloat;
      FMultiplicador := qQuery.FieldByName('FACTORMULTIPLICADOR').AsFloat;
      FNombreMedidor := qQuery.FieldByName('NOMBREMARCAMEDIDOR').AsString;
      FMarcaMedidor :=  qQuery.FieldByName('CODIGOMARCAMEDIDOR').AsString;
      Result := True;
    end;

  finally
    qQuery.Free;
  end;

end;

procedure TfCargueManualLecturas.sbFiltrarCuentaClick(Sender: TObject);
begin
  if VailidarClaveFecha then
  begin
  if  ValidaPreCargueCuenta(trim(eCuentaLectura.Text),eFechaProgramadaLectura.Text) then
  begin
    if DatosSuministro then
    begin
      FIntento := 0;
      CargarDatosClienteEnFormulario;
      HabilitarCajasDeTexto;
      FBanderaHabilitarIngreso := True;
    end
    else
      Application.MessageBox(
        'No hay información que permita realizar el cargue de la lectura, La cuenta ya fue leida o la cuenta para la fecha seleccionada no esta diponible, ingrese otros datos e intente nuevamente.', 'Información', MB_ICONEXCLAMATION + MB_OK);
   end;
  end;
end;

function TfCargueManualLecturas.VailidarClaveFecha: Boolean;
begin
  Result := False;
  IF (trim(eCuentaLectura.Text) <> '') and
    (trim(eFechaProgramadaLectura.Text) <> '') then
  begin
    Result := True;
  end
  else if NOT(trim(eCuentaLectura.Text) <> '') then
  begin
    Application.MessageBox(
      'Se ha producido un error, El numero de cuenta no es valido, escriba una e intente nuevamente ', 'Error', MB_ICONERROR + MB_OK);
    eCuentaLectura.Setfocus;
  end
  else
  begin
    Application.MessageBox(
      'Se ha producido un error, No se ha seleccionado una fecha, seleccionela e intente nuevamante', 'Error', MB_ICONERROR + MB_OK);
  end;
end;

procedure TfCargueManualLecturas.CargarDatosClienteEnFormulario;
begin
  eMedidorLectura.Text := NumeroMedidor;
  eCodigoSuplementario.Text := IntToStr(CodigoSuplementario);
  eSedeOperativa.Text := NombreSedeOperativa(CodigoSedeOperativa);
  eNombreLectura.Text := FNombreCliente;
  eDireccionLectura.Text := FDireccion;
  eCodigoItinerario.Text := FloatToStr(FCodigoItinerario);
  eCodigoDial.Text := IntToStr(FCodigoDial);
  eMarcamodelo.Text := FMarcaMedidor;
  eNombreModelo.Text := FNombreMedidor;

end;

procedure TfCargueManualLecturas.BorrarDatosClienteFormulario;
begin
  eMedidorLectura.Text := '';
  eCodigoSuplementario.Text := '';
  eSedeOperativa.Text := '';
  eNombreLectura.Text := '';
  eDireccionLectura.Text := '';
  eCodigoItinerario.Text := '';
  eCodigoDial.Text := '';
  eLecturaActiva.Text := '';
  eLecturaReactiva.Text := '';
  eLecturaDemanda.Text := '';
  mObservacion.Lines.Text := '';
  eMarcamodelo.Text := '';
  eNombreModelo.Text := '';
end;

function TfCargueManualLecturas.CalcularConsumo
  (LecturaAnterior, LecturaActual, Agujas: Double): Integer;
begin
  Result := TRUNC(LecturaActual - LecturaAnterior);
  IF Result < 0 then
    Result := TRUNC((Medidor(Agujas) - LecturaAnterior) + LecturaActual);
end;

function TfCargueManualLecturas.Medidor(Agujas: Double): Integer;
begin
  if Agujas = 3 then
    Result := 1000
  else if Agujas = 4 then
    Result := 10000
  else if Agujas = 5 then
    Result := 100000
  else if Agujas = 6 then
    Result := 10000000
  else if Agujas = 7 then
    Result := 100000000
  else
    Result := 100000;
end;

function TfCargueManualLecturas.DesviacionDeConsumo: Boolean;
begin
  Result := True;

  if FLecturaParcialActiva = 0 then
    FLecturaParcialActiva := FLecturaActiva;

  if not(FLecturaParcialActiva = FLecturaActiva) then
  begin
    FIntento := 0;
    FLecturaParcialActiva := 0;
  end;

  if FCodigoSuplementario = 0 then
  begin

    FConsumoActiva := TRUNC
      (CalcularConsumo(FUltimaLecturaActiva, FLecturaActiva, FNumeroAgujas)
        * FMultiplicador);

    if DesviacionActiva then
    begin

      FIntento := FIntento + 1;
      Result := False;
      eLecturaActiva.Text := '';

      if FIntento > 2 then
        Result := True;

    end;

  end
  else
  begin

  if FLecturaParcialReactiva = 0 then
  FLecturaParcialReactiva := FLecturaReactiva;

  if not(FLecturaParcialReactiva = FLecturaReactiva) then
  begin
    FIntento := 0;
    FLecturaParcialReactiva := 0;
  end;


    FConsumoActiva := TRUNC
      (CalcularConsumo(FUltimaLecturaActiva, FLecturaActiva, FNumeroAgujas)
        * FMultiplicador);
    FConsumoReactiva := TRUNC(CalcularConsumo(FUltimaLecturaReactiva,
        FLecturaReactiva, FNumeroAgujas) * FMultiplicador);

    if DesviacionActiva or DesviacionReactiva then
    begin
      FIntento := FIntento + 1;
      Result := False;

      eLecturaActiva.Text := '';
      eLecturaReactiva.Text := '';

      if FIntento > 2 then
        Result := True;

    end;

  end;

end;

function TfCargueManualLecturas.DesviacionActiva: Boolean;
var
  qQuery: TQuery;
begin
  Result := False;
  try

    qQuery := TQuery.Create(nil);
    qQuery.DatabaseName := 'BaseDato';

    qQuery.SQL.Add(
      'SELECT DECODE(regexp_substr(sgc_desviacionconsumo(:PROMEDIO,:TARIFA,:CONSUMO),''[^,]+'',1,2),''TRUE'',1,0) AS DESVIACIONACTIVA FROM dual ');
    qQuery.ParamByName('PROMEDIO').AsFloat := FPromedioActiva;
    qQuery.ParamByName('TARIFA').AsInteger := FCodigoTarifa;
    qQuery.ParamByName('CONSUMO').AsInteger := FConsumoActiva;
    qQuery.Open;

    if not qQuery.IsEmpty then
    begin

      if qQuery.FieldByName('DESVIACIONACTIVA').AsInteger = 1 then
        Result := True;

    end;

  finally
    qQuery.Free;
  end;
end;

function TfCargueManualLecturas.DesviacionReactiva: Boolean;
var
  qQuery: TQuery;
begin
  Result := False;
  try

    qQuery := TQuery.Create(nil);
    qQuery.DatabaseName := 'BaseDato';

    qQuery.SQL.Add(
      'SELECT DECODE(regexp_substr(sgc_desviacionconsumoavanzado(:PROMEDIO,:TARIFA,:CONSUMO,1),''[^,]+'',1,2),''TRUE'',1,0) AS DESVIACIONREACTIVA FROM dual ');
    qQuery.ParamByName('PROMEDIO').AsFloat := FPromedioReactiva;
    qQuery.ParamByName('TARIFA').AsInteger := FCodigoTarifa;
    qQuery.ParamByName('CONSUMO').AsInteger := FConsumoReactiva;
    qQuery.Open;

    if not qQuery.IsEmpty then
    begin

      if qQuery.FieldByName('DESVIACIONREACTIVA').AsInteger = 1 then
        Result := True;

    end;

  finally
    qQuery.Free;
  end;

end;

procedure TfCargueManualLecturas.eLecturaActivaKeyPress
  (Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', Char(VK_BACK), Char(VK_DELETE)]) then
    Key := #0;
end;

procedure TfCargueManualLecturas.eLecturaReactivaKeyPress
  (Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', Char(VK_BACK), Char(VK_DELETE)]) then
    Key := #0;
end;

procedure TfCargueManualLecturas.eLecturaDemandaKeyPress
  (Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', Char(VK_BACK), Char(VK_DELETE)]) then
    Key := #0;
end;

function TfCargueManualLecturas.ValidarLecturas: Boolean;
begin
  Result := False;

  if FCodigoSuplementario = 0 then
  begin
    if not(trim(eLecturaActiva.Text) = EmptyStr) then
    begin
      FLecturaActiva := StrToFloat(eLecturaActiva.Text);
      Result := True
    end
    else
      Application.MessageBox(
        'No ha ingresado una lectura de ENERGIA ACTIVA valida, ingresela e intente nuevamente.', 'Advertencia', MB_ICONWARNING + MB_OK);

  end
  else if    FCodigoSuplementario = 1 then
  begin
    if not(trim(eLecturaActiva.Text) = EmptyStr) then
  begin
    FLecturaActiva := StrToFloat(eLecturaActiva.Text);
    if not(trim(eLecturaReactiva.Text) = EmptyStr) then
    begin
      Result := True;
      FLecturaReactiva := StrToFloat(eLecturaReactiva.Text);
    end
    else
      Application.MessageBox(
        'No ha ingresado una lectura de ENERGIA REACTIVA valida, ingresela e intente nuevamente.', 'Advertencia', MB_ICONWARNING + MB_OK);

  end
  else
    Application.MessageBox(
      'No ha ingresado una lectura de ENERGIA ACTIVA valida, ingresela e intente nuevamente.', 'Advertencia', MB_ICONWARNING + MB_OK);

  end
  else
  begin

      if not(trim(eLecturaActiva.Text) = EmptyStr) then
  begin
    FLecturaActiva := StrToFloat(eLecturaActiva.Text);
    if not(trim(eLecturaReactiva.Text) = EmptyStr) then
    begin
      FLecturaReactiva := StrToFloat(eLecturaReactiva.Text);
     if not(trim(eLecturaDemanda.Text) = EmptyStr) then
    begin
      FPotencia := StrToFloat(eLecturaDemanda.Text);
      Result := True;

    end
    else
      Application.MessageBox(
        'No ha ingresado una lectura de DEMANDA valida, ingresela e intente nuevamente.', 'Advertencia', MB_ICONWARNING + MB_OK);

    end
    else
      Application.MessageBox(
        ' No ha ingresado una lectura de ENERGIA REACTIVA valida, ingresela e intente nuevamente.', 'Advertencia', MB_ICONWARNING + MB_OK);

  end
  else
    Application.MessageBox(
      'No ha ingresado una lectura de ENERGIA ACTIVA valida, ingresela e intente nuevamente.', 'Advertencia', MB_ICONWARNING + MB_OK);



  end;


      IF (trim(mObservacion.Lines.Text) = EmptyStr ) then
      begin
      Result := False;
      Application.MessageBox(
      'No ha ingresado una OBSERVACIÓN valida, ingresela e intente nuevamente.', 'Advertencia', MB_ICONWARNING+ MB_OK);

      end;



end;

procedure TfCargueManualLecturas.BitBtn31Click(Sender: TObject);
begin
  pRemovible.Visible := False;
  BorrarDatosClienteFormulario;
  FBanderaHabilitarIngreso := False;
BorrarListadoDeFotosLEctura
end;

function TfCargueManualLecturas.UpdateLectura: Boolean;
begin
  Result := False;
  if FCodigoSuplementario = 0 then
  begin
  qUpdateLecturaActiva.Close;
  qUpdateLecturaActiva.ParamByName('CLAVE').AsString := eCuentaLectura.Text;
  qUpdateLecturaActiva.ParamByName('FECHALECTURA').AsString :=eFechaProgramadaLectura.Text;
  qUpdateLecturaActiva.ParamByName('LECTURAACTUAL').AsFloat := FLecturaActiva;
  qUpdateLecturaActiva.ParamByName('CONSUMOACTIVA').AsInteger := FConsumoActiva;
  qUpdateLecturaActiva.ParamByName('OBSERVACIONES').AsString := mObservacion.Text;
  qUpdateLecturaActiva.ExecSQL;

  if qUpdateLecturaActiva.RowsAffected > 0 then
    Result := True;
  end
  else if FCodigoSuplementario = 1 then
  begin

  qUpdateLecturaReactiva.Close;
  qUpdateLecturaReactiva.ParamByName('CLAVE').AsString := eCuentaLectura.Text;
  qUpdateLecturaReactiva.ParamByName('FECHALECTURA').AsString :=eFechaProgramadaLectura.Text;
  qUpdateLecturaReactiva.ParamByName('LECTURAACTUAL').AsFloat := FLecturaActiva;
  qUpdateLecturaReactiva.ParamByName('CONSUMOACTIVA').AsInteger := FConsumoActiva;
  qUpdateLecturaReactiva.ParamByName('OBSERVACIONES').AsString := mObservacion.Text;
  qUpdateLecturaReactiva.ParamByName('LECTURAREACTIVA').AsFloat := FLecturaReactiva;
  qUpdateLecturaReactiva.ParamByName('CONSUMOREACTIVA').AsInteger := FConsumoReactiva;
  qUpdateLecturaReactiva.ExecSQL;
    if qUpdateLecturaReactiva.RowsAffected > 0 then
    Result := True;
  end
  else
  begin
  qUpdateLectura.Close;
  qUpdateLectura.ParamByName('CLAVE').AsString := eCuentaLectura.Text;
  qUpdateLectura.ParamByName('FECHALECTURA').AsString :=eFechaProgramadaLectura.Text;
  qUpdateLectura.ParamByName('LECTURAACTUAL').AsFloat := FLecturaActiva;
  qUpdateLectura.ParamByName('CONSUMOACTIVA').AsInteger := FConsumoActiva;
  qUpdateLectura.ParamByName('OBSERVACIONES').AsString := mObservacion.Text;
  qUpdateLectura.ParamByName('LECTURAREACTIVA').AsFloat := FLecturaReactiva;
  qUpdateLectura.ParamByName('CONSUMOREACTIVA').AsInteger := FConsumoReactiva;
  qUpdateLectura.ParamByName('DEMANDA').AsFloat := FPotencia;
  qUpdateLectura.ExecSQL;

  if qUpdateLectura.RowsAffected > 0 then
    Result := True;

  end;
end;

procedure TfCargueManualLecturas.HabilitarCajasDeTexto;
begin
if FCodigoSuplementario = 0 then
begin

eLecturaReactiva.Enabled := False;
eLecturaReactiva.Color := clInactiveCaption;

eLecturaDemanda.Enabled := False;
eLecturaDemanda.Color := clInactiveCaption;
end
else if FCodigoSuplementario = 1 then
begin

eLecturaReactiva.Enabled := True;
eLecturaReactiva.Color := clWindow;

eLecturaDemanda.Enabled := False;
eLecturaDemanda.Color := clInactiveCaption;
end
else
begin
 eLecturaReactiva.Enabled := True;
eLecturaReactiva.Color := clWindow;

eLecturaDemanda.Enabled := True;
eLecturaDemanda.Color := clWindow
;
end;

end;


procedure TfCargueManualLecturas.CargarVistaPreliminar(CodApoyo: string);
var
  CodigoApoyo: string;
  i: integer;
begin
  CodigoApoyo := qListadoLecturas.fieldByName('CLAVE').AsString;
  if CodigoApoyo <> '' then
  begin
    fGaleriaPreliminar := TfGaleriaPreliminar.CreateByparametros(Application,
      CodigoApoyo);
    fGaleriaPreliminar.FechaLectura := eFechaProgramadaLectura.text;
    fGaleriaPreliminar.TipoDeFoto := '15';
    fGaleriaPreliminar.ManualDock(Panel10);
    fGaleriaPreliminar.Show;
  end;

end;

procedure TfCargueManualLecturas.BorrarListadoDeFotosLEctura;
begin
  cdsListadoFotos.EmptyDataSet;
  ListadoDeLecturas.Clear;
   iFoto.Picture := nil;
end;

function TfCargueManualLecturas.DatosSuministroEdicion: Boolean;
var
  qQuery: TQuery;
begin
  try
    Result := False;

    qQuery := TQuery.Create(nil);
    qQuery.DatabaseName := 'BaseDato';

    qQuery.SQL.Add('SELECT CODIGOADMINISTRATIVO,');
    qQuery.SQL.Add('CODIGOGRUPOTRABAJO,');
    qQuery.SQL.Add('FECHALECTURA,');
    qQuery.SQL.Add('LIBRO,');
    qQuery.SQL.Add('CLAVE,');
    qQuery.SQL.Add('CODIGOITINERARIO,');
    qQuery.SQL.Add('NUMEROAGUJAS,');
    qQuery.SQL.Add('ULTIMALECTURA,');
    qQuery.SQL.Add('S_LECTUR_ACTUAL_R,');
    qQuery.SQL.Add('FACTORMULTIPLICADOR,');
    qQuery.SQL.Add('NUMEROCONTADOR,');
    qQuery.SQL.Add('CODIGOITINERARIO,');
    qQuery.SQL.Add('CODIGOTIPOMEDIDA,');
    qQuery.SQL.Add('X,');
    qQuery.SQL.Add('Y,');
    qQuery.SQL.Add('NOMBRESUSCRIPTOR, ');
    qQuery.SQL.Add('DIRECCIONSUCRIPTOR,');
    qQuery.SQL.Add('IN_RUTA, ');
    qQuery.SQL.Add('CODIGODIAL, ');
    qQuery.SQL.Add('PROMEDIOACTIVA, ');
    qQuery.SQL.Add('PROMEDIOREACTIVA, ');
    qQuery.SQL.Add('TARIFA, ');
    qQuery.SQL.Add('NOMBREMARCAMEDIDOR, ');
    qQuery.SQL.Add('CODIGOMARCAMEDIDOR ');
    qQuery.SQL.Add('FROM SGC_INFOITINERARIO I');
    qQuery.SQL.Add('WHERE I.FECHALECTURA = TO_DATE(' + QuotedStr
        (qListadoLecturasFECHA_PROGRAMADA.AsString) + ',''DD/MM/YYYY'') ');
    qQuery.SQL.Add('AND I.CLAVE = ' + qListadoLecturasCLAVE.AsString + '  ');

    qQuery.Open;
    if not qQuery.IsEmpty then
    begin
      FCodigoAdministrativo := qQuery.FieldByName('CODIGOADMINISTRATIVO')
        .AsInteger;
      FCodigoGrupoTrabajo := qQuery.FieldByName('CODIGOGRUPOTRABAJO').AsInteger;
      FLibro := qQuery.FieldByName('LIBRO').AsInteger;
      FCodigoItinerario := qQuery.FieldByName('CODIGOITINERARIO').AsInteger;
      FCodigoSuplementario := qQuery.FieldByName('CODIGOTIPOMEDIDA').AsInteger;
      FNombreCliente := qQuery.FieldByName('NOMBRESUSCRIPTOR').AsString;
      FDireccion := qQuery.FieldByName('DIRECCIONSUCRIPTOR').AsString;
      FSedeOperativa := qQuery.FieldByName('IN_RUTA').AsInteger;
      FCodigoDial := qQuery.FieldByName('CODIGODIAL').AsInteger;
      FUltimaLecturaActiva := qQuery.FieldByName('ULTIMALECTURA').AsInteger;
      FUltimaLecturaReactiva := qQuery.FieldByName('S_LECTUR_ACTUAL_R')
        .AsInteger;
      FPromedioActiva := qQuery.FieldByName('PROMEDIOACTIVA').AsInteger;
      FPromedioReactiva := qQuery.FieldByName('PROMEDIOREACTIVA').AsInteger;
      FNumeroMedidor := qQuery.FieldByName('NUMEROCONTADOR').AsString;
      FCodigoTarifa := qQuery.FieldByName('TARIFA').AsInteger;
      FNumeroAgujas := qQuery.FieldByName('NUMEROAGUJAS').AsFloat;
      FMultiplicador := qQuery.FieldByName('FACTORMULTIPLICADOR').AsFloat;
      FNombreMedidor := qQuery.FieldByName('NOMBREMARCAMEDIDOR').AsString;
      FMarcaMedidor :=  qQuery.FieldByName('CODIGOMARCAMEDIDOR').AsString;
      Result := True;
    end;

  finally
    qQuery.Free;
  end;
end;

function TfCargueManualLecturas.ValidaPreCargueCuenta(CodigoCuenta,
  FechaLectura: String): Boolean;
begin
Result := True;
 if not(trim(CodigoCuenta) = EmptyStr) then
  begin

    if ExistenciaDeCuenta(CodigoCuenta) then
    begin
      if DisponibilidadSuministro(CodigoCuenta,FechaLectura) then
      begin
        if DispobilidadDeLectura(CodigoCuenta,FechaLectura) then
        begin
        Result := True;
        end
        else
        begin
          Application.MessageBox(PChar(
              'El número de cuenta NO esta disponible para CARGUE MANUAL DE LECTURA ya que el DIAL de lectura aún no esta disponible.'), 'Advertencia', MB_OK + MB_ICONWARNING)  ;
        Result := False;
        end;
      end
      else
      begin
        Application.MessageBox(PChar(
            'El número de cuenta NO esta disponible para CARGUE MANUAL DE LECTURA ya que fue ingresada anteriormente.'), 'Advertencia', MB_OK + MB_ICONWARNING);
      Result := False;
      end;
    end
    else
    begin
      Application.MessageBox(PChar(
          'El número de cuenta NO EXISTE, ingrese un NúMERO DE CUENTA valido e intente nuevamente.'), 'Advertencia', MB_OK + MB_ICONWARNING);
    Result := False;
    end;
  end
  else
  begin
    Application.MessageBox(PChar(
        'El número de cuenta NO es valido, ingrese un NúMERO valido e intente nuevamente.')
        , 'Advertencia', MB_OK + MB_ICONWARNING) ;
  Result := False;
  end;
 end;

end.
