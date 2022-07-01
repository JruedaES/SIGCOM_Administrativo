unit uGaleriaPreliminar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, uThumbs, Buttons, utnToolbar, UEditPaint,
  UPaintVistaApoyo, ToolWin, Series, Registry, Db, DBTables, uFuncionSGD, uVisualizaFotos,
  Psock, NMFtp, FileCtrl, utnZommer, IniFiles, uCriptografia, Menus,UFIMPADMINISTRATIVO;




const
 edLibre    = 0;
 edLineal   = 1;
 edDiagonal = 2;
 edRandom   = 3;

type
  TInfoApoyo = Record
    CodigoApoyo : String;
    PintadoApoyo:String;
    Trafo : String;
    AP : String;
    Interruptor : String;
  end;

  TfGaleriaPreliminar = class(TForm)
    tPerfilVL: TTable;
    tPerfilVLCODIGOPERFILVL: TFloatField;
    tPerfilVLNOMBREPERFILVL: TStringField;
    tPerfilVLCODIGOUSUARIO: TFloatField;
    tPerfilVLDESCRIPCION: TBlobField;
    dsPerfilVL: TDataSource;
    qTramos: TQuery;
    qColorCircuito: TQuery;
    qColorCircuitoCODIGOCIRCUITO: TStringField;
    qColorCircuitoCOLOR: TFloatField;
    qColorCircuitoNOMBRECIRCUITO: TStringField;
    dsqColorCircuito: TDataSource;
    qApoyos: TQuery;
    qNodos: TQuery;
    qElementos: TQuery;
    qPintado: TQuery;
    qFotos: TQuery;
    NMFTP1: TNMFTP;
    ScrollBox1: TScrollBox;
    basefoto: TPanel;
    CoolBar3: TCoolBar;
    Panelfoto: TPanel;
    bi_ScrollBox: Tbi_ScrollBox;
    Image1: TImage;
    StatusBar1: TStatusBar;
    mArriba: TMemo;
    mAbajo: TMemo;
    PopupMenu1: TPopupMenu;
    mmgirarfoto: TMenuItem;
    GirarFotografiahacaDerecha1: TMenuItem;
    Zommer1: TZommer;

    procedure VerFotosApoyo(Codigo: string);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MostrarVistaPreliminar(CodApoyo: string);
    procedure FormShow(Sender: TObject);
    procedure bi_ScrollBoxClick(Sender: TObject);
    procedure bi_ScrollBoxMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mmgirarfotoClick(Sender: TObject);
    procedure GirarFotografiahacaDerecha1Click(Sender: TObject);

  private
    Host, Port, UserID, Password: String;
    bHabilitarFTPS: Boolean;
    FReadFechaLectura: string;
    FWritFechaLectura: string;
    FNombreRuta : String;
    FListZommer : TList;
    procedure CargarValoresPredeterminados;


    { Private declarations }
  public
  CodigoApoyo: String;
  FechaLectura : String;
  TipoDeFoto : String;
  CodigoItinerario :String;
  Periodo : String;
  BanderaReparto: boolean;
  BanderaODT : Boolean;
  BanderaAvisosConsultas : Boolean;
  BanderaTableros :Boolean;
  BanderaIlegales : Boolean;
  Consulta : String;
  function GestionarZommer( x :Integer = 0) : TZommer;
    constructor CreateByParametros(AOwner: TComponent; CodApoyo: String);
  property NombreRuta : String  Read FNombreRuta Write FNombreRuta;
  property ListZommer : TList Read FListZommer Write FListZommer;
    { Public declarations }

  end;


var
  fGaleriaPreliminar: TfGaleriaPreliminar;
  EstiloDibujado  : Integer;
  Disponibilidad,DirectorioFoto,FDirectorioFoto: string;

  PosicionApoyos, ListaTmpApoyos, ListaApoyos, ListaNodos,  ListaTramos,
  ListaElementos, ListaColores, ListaNodosBT, ListaClientes: TStringList;

  LoadNodoMT, LoadNodoBT, LoadTramoMT, LoadTramoBT, LoadTrafoDis,
  LoadInterruptor, LoadCondensador, LoadPararrayoDis,  LoadLamparaAP, LoadCliente,
  LoadDetalleApoyo, LoadExcavacion, GrafoActivo: Boolean;

Function VisorImagenes(pFileName : WideString) : TObject; stdcall; external 'FormInDLL.dll' name 'VisorImagenes';

implementation

uses uFormaEspere, uFIMPComunes;

{$R *.DFM}

procedure TfGaleriaPreliminar.FormCreate(Sender: TObject);
begin
  PosicionApoyos:= TStringList.Create;
  ListaTmpApoyos:= TStringList.create;
  ListaApoyos:= TStringList.Create;
  ListaNodos:= TStringList.Create;
  ListaTramos:= TStringList.Create;
  ListaElementos:= TStringList.Create;
  ListaColores:= TStringList.Create;
  ListaNodosBT:= TStringList.Create;
  ListaClientes:=TstringList.create;
  BanderaReparto:= false;
  BanderaODT := False;
  BanderaAvisosConsultas := False;
  BanderaTableros := false;
  BanderaIlegales :=False;
  ListZommer := TList.Create;
end;

constructor TfGaleriaPreliminar.CreateByParametros(AOwner: TComponent; CodApoyo: String);
begin
    CodigoApoyo := CodApoyo;
    inherited Create(AOwner);
end;

procedure TfGaleriaPreliminar.MostrarVistaPreliminar(CodApoyo: String);
begin
  if CodApoyo <> '' then
  begin
      VerFotosApoyo(CodigoApoyo);
  end;
end;

procedure TfGaleriaPreliminar.FormShow(Sender: TObject);
begin
  inherited;
  MostrarVistaPreliminar(CodigoApoyo);
end;


procedure TfGaleriaPreliminar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
inherited;
  PosicionApoyos.free;
  ListaTmpApoyos.free;
  ListaApoyos.free;
  ListaNodos.free;
  ListaTramos.free;
  ListaElementos.free;
  ListaColores.free;
  ListaNodosBT.free;
  ListaClientes.free;
  fGaleriaPreliminar.free;
  fGaleriaPreliminar:= nil;
end;

procedure TfGaleriaPreliminar.CargarValoresPredeterminados;
var Registro : TRegIniFile;
    i, CodPerfil : Integer;
begin
  Registro := TRegIniFile.Create('SGD');
  LoadNodoMT       := Registro.ReadBool('VistaLateral','LoadNodoMT',True);
  LoadNodoBT       := Registro.ReadBool('VistaLateral','LoadNodoBT',True);
  LoadTramoMT      := Registro.ReadBool('VistaLateral','LoadTramoMT',True);
  LoadTramoBT      := Registro.ReadBool('VistaLateral','LoadTramoBT',True);
  LoadTrafoDis     := Registro.ReadBool('VistaLateral','LoadTrafoDis',True);
  LoadInterruptor  := Registro.ReadBool('VistaLateral','LoadInterruptor',True);
  LoadCondensador  := Registro.ReadBool('VistaLateral','LoadCondensador',True);
  LoadPararrayoDis := Registro.ReadBool('VistaLateral','LoadPararrayoDis',True);
  LoadLamparaAP    := Registro.ReadBool('VistaLateral','LoadLamparaAP',True);
  LoadCliente      := Registro.ReadBool('VistaLateral','LoadCliente',True);
  LoadDetalleApoyo := Registro.ReadBool('VistaLateral','LoadDetalleApoyo',True);
  LoadExcavacion   := Registro.ReadBool('VistaLateral','LoadExcavacion',True);
  CodPerfil        := StrToInt(Registro.ReadString('VistaLateral','CodigoPerfilVL','0'));
  Registro.Free;

  tPerfilVL.Open;
  tPerfilVL.FindKey([CodPerfil]);

end;



procedure TfGaleriaPreliminar.VerFotosApoyo(Codigo: string);
var cod : string;
    i: integer;
    NombreFoto, Usuario : string;
    qUsuario: TQuery;
    Registro : TRegIniFile;
    ListaFotos: TStringList;
    TipoFoto : TTipoFoto;
    ArcIni : TiniFile;
    HabilitarFTPS, KeyAES: string;

    //**************************


begin
  KeyAES := GetClaveAES();
  DirectorioFoto  := 'C:\TEMP\fotos\';



  qUsuario := TQuery.Create(Application);
  qUsuario.DatabaseName := 'BaseDato';
  qUsuario.SQL.Add('SELECT USER FROM DUAL');
  qUsuario.Open;
  Usuario := qUsuario.Fields[0].AsString;
  qUsuario.Close;
  qUsuario.Free;

 // if (UpperCase(Usuario) = 'INVENTARIO') OR (UpperCase(Usuario) = 'ENERGIS')then
  begin
  if BanderaODT then
  begin
  qFotos.Close;
    qFotos.SQL.Clear;
    qFotos.SQL.Add('SELECT DISTINCT NOMBREFOTO,RUTA_FOTO FROM SIGCOM_FOTO WHERE clave=:codigogestion and codigoitinerario=:codigogestion');
    qFotos.SQL.Add('and TO_DATE(TO_CHAR(fechalectura,''DD/MM/YYYY''),''DD/MM/YYYY'')=TO_DATE(:FECHALECTURA,''DD/MM/YYYY'') and tipofoto IN ('+TipoDeFoto+') ');
    qFotos.ParamByName('FECHALECTURA').AsString := FechaLectura;
    qFotos.ParamByName('codigogestion').AsString := Codigo;
  end
  else
  begin
  if BanderaTableros then
  begin
  qFotos.Close;
    qFotos.SQL.Clear;
    qFotos.SQL.Add('SELECT DISTINCT NOMBREFOTO,RUTA_FOTO FROM SIGCOM_FOTO WHERE clave=:codigogestion and codigoitinerario=:CodigoItinerario');
    qFotos.SQL.Add('and TO_DATE(TO_CHAR(fechalectura,''DD/MM/YYYY''),''DD/MM/YYYY'')=TO_DATE(:FECHALECTURA,''DD/MM/YYYY'') and tipofoto IN ('+TipoDeFoto+') ');
    qFotos.ParamByName('FECHALECTURA').AsString := FechaLectura;
    qFotos.ParamByName('codigogestion').AsString := Codigo;
    qFotos.ParamByName('CodigoItinerario').AsString :=CodigoItinerario;
  end
  else
  begin
  if BanderaIlegales then
  begin
  qFotos.Close;
    qFotos.SQL.Clear;
    qFotos.SQL.Add('SELECT DISTINCT NOMBREFOTO,RUTA_FOTO FROM SIGCOM_FOTO S,sigcom_reportarconexion R ');
    qFotos.SQL.Add('WHERE R.CONSECUTIVO=S.CLAVE AND S.FECHALECTURA=r.FECHAHORA AND S.TIPOFOTO='+TipoDeFoto+' ');
    qFotos.SQL.Add('AND S.CLAVE='+quotedStr(Codigo)+' AND S.FECHALECTURA=TO_DATE(:FECHALECTURA,''DD/MM/YYYY'')  ');
    qFotos.ParamByName('FECHALECTURA').AsString := FechaLectura;
  end
  else
  begin

    if BanderaAvisosConsultas then
  begin
    qFotos.Close;
    qFotos.SQL.Clear;
    qFotos.SQL.Add('SELECT DISTINCT NOMBREFOTO,RUTA_FOTO FROM SIGCOM_FOTO S ');
    qFotos.SQL.Add('WHERE  S.TIPOFOTO='+TipoDeFoto+' AND NOMBREFOTO LIKE '+Consulta+'||''_%'' ');
    qFotos.SQL.Add('AND S.CLAVE='+quotedStr(Codigo)+' AND TO_CHAR(S.FECHALECTURA,''YYYYMM'')=:PERIODO  ');
    qFotos.ParamByName('PERIODO').AsString := Periodo;
  end
  else
  begin

  if BanderaReparto then
  begin
  qFotos.Close;
    qFotos.SQL.Clear;
    qFotos.SQL.Add('SELECT DISTINCT NOMBREFOTO,RUTA_FOTO FROM SIGCOM_FOTO S,REP_REPARTO R ');
    qFotos.SQL.Add('WHERE R.CODIGOCUENTA=S.CLAVE AND S.FECHALECTURA=r.fecha_programada_reparto AND S.TIPOFOTO='+TipoDeFoto+' ');
    qFotos.SQL.Add('AND S.CLAVE='+quotedStr(Codigo)+' AND S.FECHALECTURA=TO_DATE(:FECHALECTURA,''DD/MM/YYYY'')  ');
    qFotos.ParamByName('FECHALECTURA').AsString := FechaLectura;
  end
  else
  begin
    qFotos.Close;
    qFotos.SQL.Clear;
    qFotos.SQL.Add('SELECT DISTINCT NOMBREFOTO,RUTA_FOTO FROM SIGCOM_FOTO S,SIGCOM_LECTURA L ');
    qFotos.SQL.Add('WHERE L.CLAVE=S.CLAVE AND S.FECHALECTURA=L.FECHA_PROGRAMADA AND S.TIPOFOTO in ('+TipoDeFoto+') ');
    qFotos.SQL.Add('AND S.CLAVE='+quotedStr(Codigo)+' AND S.FECHALECTURA=TO_DATE(:FECHALECTURA,''DD/MM/YYYY'')  ');
    qFotos.ParamByName('FECHALECTURA').AsString := FechaLectura;
  end
    end;
  end;
   end;
   end;
  end;
  try
    qFotos.Open;
  except
  on e: exception do
   begin


    if BanderaODT then
  begin
  qFotos.Close;
    qFotos.SQL.Clear;
    qFotos.SQL.Add('SELECT DISTINCT NOMBREFOTO,RUTA_FOTO FROM SIGCOM_FOTO WHERE clave=:codigogestion and codigoitinerario=:codigogestion');
    qFotos.SQL.Add('and TO_DATE(TO_CHAR(fechalectura,''DD/MM/YYYY''),''DD/MM/YYYY'')=TO_DATE(:FECHALECTURA,''DD/MM/YYYY'') and tipofoto  IN ('+TipoDeFoto+') ');
    qFotos.ParamByName('FECHALECTURA').AsString := FechaLectura;
    qFotos.ParamByName('codigogestion').AsString := Codigo;
  end
  else
  begin
  if BanderaTableros then
  begin
  qFotos.Close;
    qFotos.SQL.Clear;
    qFotos.SQL.Add('SELECT DISTINCT NOMBREFOTO,RUTA_FOTO FROM SIGCOM_FOTO WHERE clave=:codigogestion and codigoitinerario=:CodigoItinerario');
    qFotos.SQL.Add('and TO_DATE(TO_CHAR(fechalectura,''DD/MM/YYYY''),''DD/MM/YYYY'')=TO_DATE(:FECHALECTURA,''DD/MM/YYYY'') and tipofoto  IN ('+TipoDeFoto+') ');
    qFotos.ParamByName('FECHALECTURA').AsString := FechaLectura;
    qFotos.ParamByName('codigogestion').AsString := Codigo;
    qFotos.ParamByName('CodigoItinerario').AsString :=CodigoItinerario;

  end
  else
  begin
  if BanderaIlegales then
  begin
  qFotos.Close;
    qFotos.SQL.Clear;
    qFotos.SQL.Add('SELECT DISTINCT NOMBREFOTO,RUTA_FOTO FROM SIGCOM_FOTO S,sigcom_reportarconexion R ');
    qFotos.SQL.Add('WHERE R.CONSECUTIVO=S.CLAVE AND S.FECHALECTURA=r.FECHAHORA AND S.TIPOFOTO='+TipoDeFoto+' ');
    qFotos.SQL.Add('AND S.CLAVE='+quotedStr(Codigo)+' AND S.FECHALECTURA=TO_DATE(:FECHALECTURA,''DD/MM/YYYY'')  ');
    qFotos.ParamByName('FECHALECTURA').AsString := FechaLectura;
  end
  else
  begin
   if BanderaReparto then
  begin
  qFotos.Close;
    qFotos.SQL.Clear;
    qFotos.SQL.Add('SELECT DISTINCT NOMBREFOTO,RUTA_FOTO FROM SIGCOM_FOTO S,REP_REPARTO R ');
    qFotos.SQL.Add('WHERE R.CODIGOCUENTA=S.CLAVE AND S.FECHALECTURA=r.fecha_programada_reparto AND S.TIPOFOTO='+TipoDeFoto+' ');
    qFotos.SQL.Add('AND S.CLAVE='+quotedStr(Codigo)+' AND S.FECHALECTURA=TO_DATE(:FECHALECTURA,''DD/MM/YYYY'')  ');
    qFotos.ParamByName('FECHALECTURA').AsString := FechaLectura;
  end
  else
  begin

     if BanderaAvisosConsultas then
  begin
  qFotos.Close;
    qFotos.SQL.Clear;
    qFotos.SQL.Add('SELECT DISTINCT NOMBREFOTO,RUTA_FOTO FROM SIGCOM_FOTO S ');
    qFotos.SQL.Add('WHERE  S.TIPOFOTO='+TipoDeFoto+' AND NOMBREFOTO LIKE '+Consulta+'||''_%'' ');
    qFotos.SQL.Add('AND S.CLAVE='+quotedStr(Codigo)+' AND TO_CHAR(S.FECHALECTURA,''YYYYMM'')=:PERIODO  ');
    qFotos.ParamByName('PERIODO').AsString := Periodo;
  end
  else
    qFotos.Close;
    qFotos.SQL.Clear;
    qFotos.SQL.Add('SELECT DISTINCT NOMBREFOTO,RUTA_FOTO FROM SIGCOM_FOTO S,SIGCOM_LECTURA L ');
    qFotos.SQL.Add('WHERE L.CLAVE=S.CLAVE AND S.FECHALECTURA=L.FECHA_PROGRAMADA AND S.TIPOFOTO in ('+TipoDeFoto+')');
    qFotos.SQL.Add('AND S.CLAVE='+quotedStr(Codigo)+' AND S.FECHALECTURA=TO_DATE(:FECHALECTURA,''DD/MM/YYYY'') ');
    qFotos.ParamByName('FECHALECTURA').AsString := FechaLectura;
  end


   end;
  end;
  end;
   end;
   end;
    try
     qFotos.Open;
    except
    on e: exception do
    begin
   ShowMessage('Al Buscar en Base de Datos Error : '+e.Message);
    end;
     end;

      ListaFotos := TStringList.Create;

      Registro := TRegIniFile.Create('ENERGIS');

      ArcIni := TiniFile.Create(ExtractFilePath(Application.ExeName)+'energis.ini');

      try

         HabilitarFTPS:= arcini.ReadString('FTP','FTPS','NO');
      except
          on e:exception do
            begin
              HabilitarFTPS := 'NO';
              Application.MessageBox(pchar('Problemas al leer el archivo Energis.ini.'+chr(13)+'Contacte a soporte'),'Error',MB_ICONERROR);
            end;
        end;



    fFormaEspere := TfFormaEspere.Create(Application);
          fFormaEspere.ProgressBar1.Max := 3;
          fFormaEspere.lbMotivo.Caption := 'Descargando Fotos...';
          fFormaEspere.Show;
          fFormaEspere.Refresh;
          fFormaEspere.ProgressBar1.Position := 1;
          fFormaEspere.Refresh;


    while not qFotos.Eof do
    begin
       NombreFoto := GetTemporalPath + qFotos.FieldByName('NOMBREFOTO').AsString;

       DescargarArchivoFTP(qFotos.FieldByName('RUTA_FOTO').AsString+ qFotos.FieldByName('NOMBREFOTO').AsString,NombreFoto,false);
       ListaFotos.Add(NombreFoto);
       bi_ScrollBox.Add(NombreFoto);
       bi_ScrollBox.GetListaThumb(i).Add('ID=' + qFotos.FieldByName('RUTA_FOTO').AsString);
       bi_ScrollBox.GetListaThumb(i).Add('FOTO=' + ExtractFileName(NombreFoto));
       fFormaEspere.ProgressBar1.Position := 2;
       fFormaEspere.Refresh;
       Inc(i);
      qFotos.Next;
    end;

     fFormaEspere.free;
 //  if bi_ScrollBox.ThumbNo >= 0 then
 //   begin
//      FVisualizaFotos.Visible := True;
//      FVisualizaFotos.Show;
//    end
//    else FVisualizaFotos.Close;


  //Desconectarse..............................
    if bHabilitarFTPS then DisconnectFTP()
    else NMFTP1.Disconnect;

    for i:=0 to ListaFotos.Count - 1 do
      if FileExists(ListaFotos[i]) then
        DeleteFile(ListaFotos[i]);

    if FileExists(DirectorioFoto) then
      DeleteFile(DirectorioFoto);
    ListaFotos.Free;


end;

procedure TfGaleriaPreliminar.bi_ScrollBoxClick(Sender: TObject);
var Grafico:TPicture;
    qUsuario: TQuery;
    Usuario: String;
    TipoFoto : TTipoFoto;
    bCambioDir: Boolean;
    nombrefoto : String;
begin
  TipoFoto := tfApoyos;
  if Sender is Tbi_Image then
  begin
    if bHabilitarFTPS then
    begin
       try
          fFormaEspere := TfFormaEspere.Create(Application);
          fFormaEspere.ProgressBar1.Max := 3;
          fFormaEspere.lbMotivo.Caption := 'Descargando...';
          fFormaEspere.Show;
          fFormaEspere.Refresh;
          fFormaEspere.ProgressBar1.Position := 1;
          fFormaEspere.Refresh;

          if ConnectFTP(Host, Port, UserID, Password) then
          begin
            StatusBar1.Panels[0].Text := 'Conectado.';
            qUsuario := TQuery.Create(Application);
            qUsuario.DatabaseName := 'BaseDato';
            qUsuario.SQL.Add('SELECT USER FROM DUAL');
            qUsuario.Open;
            Usuario := qUsuario.Fields[0].AsString;
            qUsuario.Close;
            qUsuario.Free;


            fFormaEspere.ProgressBar1.Position := 2;
            fFormaEspere.Refresh;
            if bCambioDir then
            begin
              if DownloadFileFTP((Tbi_Image(Sender).Parent as Tbi_Thumb).Lista.Values['FOTO'],DirectorioFoto + 'Temp.jpg', True) then
              begin

                fFormaEspere.ProgressBar1.Position := 3;
                fFormaEspere.Refresh;
                Grafico:=TPicture.Create;

                Grafico.LoadFromFile(DirectorioFoto + 'Temp1.jpg');

              //  GestionarZommer(1).ShowImage(Grafico);
            //    ListZommer.Add(GestionarZommer(0));
                Grafico.Free;

              VisorImagenes(DirectorioFoto + 'Temp1.jpg');
              end;
            end;
            DisconnectFTP();
            StatusBar1.Refresh;
          end
          else StatusBar1.Panels[0].Text := 'Desconectado.';
          fFormaEspere.Free;
       except
          on E:Exception do
          begin
            ShowMessage('Mensaje Error: '+E.Message);
            StatusBar1.Panels[0].Text := 'Desconectado.';
          end;  
       end;
    end
    else
    begin
        try
        bi_ScrollBox.SelectedThumb.Color := clRed;
        NombreRuta :=  bi_ScrollBox.SelectedThumb.Lista.Values['FOTO'];

        if FileExists(GetTemporalPath+(Tbi_Image(Sender).Parent as Tbi_Thumb).Lista.Values['FOTO']) then
        begin
          Grafico:=TPicture.Create;
          Grafico.LoadFromFile(GetTemporalPath+(Tbi_Image(Sender).Parent as Tbi_Thumb).Lista.Values['FOTO']);//+'volteada.jpg');
        ///  GestionarZommer(1).ShowImage(Grafico);
          Grafico.Free;

              VisorImagenes(GetTemporalPath+(Tbi_Image(Sender).Parent as Tbi_Thumb).Lista.Values['FOTO']);
          StatusBar1.Refresh;
       end
       else
       begin
       DescargarArchivoFTP((Tbi_Image(Sender).Parent as Tbi_Thumb).Lista.Values['ID']+(Tbi_Image(Sender).Parent as Tbi_Thumb).Lista.Values['FOTO'],GetTemporalPath+(Tbi_Image(Sender).Parent as Tbi_Thumb).Lista.Values['FOTO'],false);
        Grafico:=TPicture.Create;
          nombrefoto := GetTemporalPath+(Tbi_Image(Sender).Parent as Tbi_Thumb).Lista.Values['FOTO'];//+'volteada.jpg';
          Grafico.LoadFromFile(nombrefoto);
         // GestionarZommer(1).ShowImage(Grafico);
          Grafico.Free;

             VisorImagenes(GetTemporalPath+(Tbi_Image(Sender).Parent as Tbi_Thumb).Lista.Values['FOTO']);
          StatusBar1.Refresh;
       end;
        except
          on E:Exception do
          begin
            ShowMessage('Mensaje Error 2 : '+E.Message);
            StatusBar1.Panels[0].Text := 'Desconectado.';
          end;
        end;
    end;
  end;
end;

procedure TfGaleriaPreliminar.bi_ScrollBoxMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  TRY
  StatusBar1.Panels[1].Text := '';
  if Sender is Tbi_Image then
    StatusBar1.Panels[1].Text := (Tbi_Image(Sender).Parent as Tbi_Thumb).Lista.Values['FOTO']
  else
    StatusBar1.Panels[1].Text := '';
  Except
  on e : Exception do
  begin
  showmessage('Error al cargar : '+e.Message);
  end;
  end;
end;

procedure TfGaleriaPreliminar.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:= False;
end;

procedure TfGaleriaPreliminar.mmgirarfotoClick(Sender: TObject);
VAR
Grafico : TPicture;
begin
 IF NombreRuta <> EmptyStr THEN
begin
RotarImagen(GetTemporalPath+NombreRuta,GetTemporalPath+NombreRuta,(-1)*(90));
   Grafico:=TPicture.Create;
   Grafico.LoadFromFile(GetTemporalPath+NombreRuta);
  // GestionarZommer(1).ShowImage(Grafico);
   //ListZommer.Add(GestionarZommer(0));
   Grafico.Free;
end
else
 Application.MessageBox(PChar('Se debe seleccionar una imagen para poder usar esta funcionalidad.'),
      'Atención', MB_ICONERROR);

end;

procedure TfGaleriaPreliminar.GirarFotografiahacaDerecha1Click(
  Sender: TObject);
VAR
Grafico : TPicture;
begin
IF NombreRuta <> EmptyStr THEN
begin
RotarImagen(GetTemporalPath+NombreRuta,GetTemporalPath+NombreRuta,(1)*(90));
   Grafico:=TPicture.Create;
   Grafico.LoadFromFile(GetTemporalPath+NombreRuta);
   //GestionarZommer(1).ShowImage(Grafico);
   //ListZommer.Add(GestionarZommer(0));
   Grafico.Free;
end
else
 Application.MessageBox(PChar('Se debe seleccionar una imagen para poder usar esta funcionalidad.'),
      'Atención', MB_ICONERROR);

end;

function  TfGaleriaPreliminar.GestionarZommer (x : Integer = 0) : TZommer;
var
Z : TZommer;
i : integer;
begin
try

if ListZommer.Count > 0 then
begin
 for i := 0 to ListZommer.Count-1 do
 begin
 TZommer(ListZommer.Items[i]).DestroyComponents;

 end;
 ListZommer.Clear;
  Z := TZommer.Create(self);
 ListZommer.Add(z);
 Result := Z;
end
else
begin
 Z := TZommer.Create(self);
 ListZommer.Add(z);
 Result := Z;
end;



except
  on E: Exception  do
begin
   ShowMessage(e.Message);
end;
end;
end;
end.

