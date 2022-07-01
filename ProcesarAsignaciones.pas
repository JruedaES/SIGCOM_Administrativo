unit ProcesarAsignaciones;


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Mask, DBTables, Db, ExtCtrls, Buttons, ComCtrls,
  ImgList, Menus, utMenuArbol,Grids, DBGrids, RXDBCtrl, RXCtrls, QuickRpt, Qrctrls,
  utdMenuEstruct,Math, Psock, NMFtp, utnZommer, dxDbZipImage, uThumbs, utnToolbar,
  UEditPaint, UPaintVistaApoyo, ToolWin, registry, CheckLst, RXSpin,Series,
  FileCtrl,ComObj, Digisoft, ZipForge, Inifiles, uSincronizarMovil;

  procedure ProcesarAsignacionesPendientes(CodigoODT:Double; var psResumenPro: string; pbMostrarMensajes: Boolean = True; pbMostrarProgreso: Boolean = True);
  function RutaAsignacionMovilU: string;
  function CompletarCadenaIzquierda(s,c: string; n: integer): string;
  function ImportarAsignacionSdfU(codigoodt,consecutivo, codigoasignacionemg: string; var sMensajeError: string): Boolean;
  function MontarInfraestructuraU(codigoodt, consecutivo, codigoasignacionI:string; var sMensajeError: string): Boolean;
  function BorrarAsignacionEMG_I(pCodigoODT, pConsecutivo: string): Boolean;
  function ActualizarReporteYODT(codigoodt, consecutivo, codigoasignacionI:string; var sMensajeError : string): Boolean;
  procedure BorrarRelacionODTReporte(pCodigoODT, pConsecutivo: string);

var
  NombreODT, DirDestino, RutaODTsEscritorio, RutaFullArchivoSFTP: string;
  SincronizarMovil:TSincronizarMovil;

implementation

uses
  uFIMPAdministrativo, udmTablasEMG, uformaespere, uFIMPComunes, uFuncionSGD, uBloc,
  uComunesAdministrativo;

procedure ProcesarAsignacionesPendientes(CodigoODT:Double; var psResumenPro: string; pbMostrarMensajes: Boolean = True; pbMostrarProgreso: Boolean = True);
var
  CodigoAsignacionEMGI, InfraestructuraAutomatica, sCIA_GT : string;
  sAsignacionesInvalidas, sAsignacionesSinMI, sAsignacionesConMI, sAsignacionesConErrores : string;
  qry, query, query2: TQuery;
  Zip: TZipForge;
  bMontoInfra, bActRepyODT, bImportacionExitosa, bImpSDF: Boolean;
  sMensajeError, sMensCompleto, sAsociaReps : String;
  RutaCarpetaDestinoSFTP, sCodigoODT, sConsecutivo, sCIA, sGT, sCodigoAsignacionEMG: string;
Begin
  sAsignacionesInvalidas:= '';
  sAsignacionesSinMI := '';
  sAsignacionesConMI := '';
  sAsignacionesConErrores:='';
  sMensajeError:='';
  sMensCompleto:='';
  sAsociaReps:='';
  sCIA_GT:='';
  bMontoInfra:= False;
  bActRepyODT:= False;
  bImportacionExitosa:=False;

  query:=TQuery.Create(nil);
  query.DatabaseName:='BaseDato';
  query.SQL.Text:= 'SELECT VALOR FROM PARAMETRO WHERE CODIGOPARAMETRO=''IPM''';
  query.Open;
  Host_SFTP := query.FieldByName('VALOR').AsString;
  query.Close;
  query.Free;
  Zip:= TZipForge.Create(nil);

  if ConectarA_SFTP(Host_SFTP, Port_SFTP, UserID_SFTP, Password_SFTP, True, pbMostrarProgreso) then
  begin
    dmTablasEMG:=TdmTablasEMG.Create(nil);

    //CONSULTO SI EN LA ODT PADRE ESTA MARCADO EL CHECKBOX "Asocia Reporte Daños"
    Query2:=TQuery.Create(nil);
    Query2.DatabaseName:='BaseDato';
    Query2.Sql.Add('SELECT NVL(O.ASOCIARREPORTESDANO, ''F'') ');
    Query2.Sql.Add('FROM ODT O');
    Query2.Sql.Add('WHERE O.CODIGOODT = '+FloatToStr(CodigoODT));
    Query2.Open;
    sAsociaReps:= Query2.Fields[0].AsString;
    Query2.Close;
    Query2.Free;

    qry:=TQuery.Create(nil);
    qry.DatabaseName:='BaseDato';
    if sAsociaReps = 'T' then
    begin
      qry.Sql.Clear;
      qry.Sql.Add('SELECT OA.CODIGOODT, OA.CONSECUTIVO, O.CODIGOADMINISTRATIVO,');
      qry.Sql.Add('OA.CODIGOGRUPOTRABAJO, OA.CODIGOASIGNACIONEMG');
      qry.Sql.Add('FROM EMG_ODTASIGNACION OA, ODT O, ODTREPORTE ORT, REPORTE R, ESTADOREPORTE ER');
      qry.Sql.Add('WHERE OA.CODIGOODT= O.CODIGOODT');
      qry.Sql.Add('AND R.CODIGOREPORTE = ORT.CODIGOREPORTE');
      qry.Sql.Add('AND R.CODIGOESTADOREPORTE = ER.CODIGOESTADOREPORTE');
      qry.Sql.Add('AND OA.CODIGOODT = ORT.CODIGOODT');
      qry.Sql.Add('AND OA.CONSECUTIVO = ORT.CONSECUTIVO');
      qry.Sql.Add('AND (OA.CODIGOODT, OA.CONSECUTIVO) NOT IN (SELECT B.CODIGOODT, B.CONSECUTIVO');
      qry.Sql.Add('FROM  EMG_ODTASIGNACION B');
      qry.Sql.Add('WHERE OA.CODIGOODT = B.CODIGOODT');
      qry.Sql.Add('AND B.TIPODATOORIGEN = ''I'') ');
      qry.Sql.Add('AND OA.CODIGOESTADOASIGNACION = 1');
      qry.Sql.Add('AND R.CODIGOESTADOREPORTE NOT IN (4,5)');
      qry.Sql.Add('AND O.CODIGOODT = :CodigoODT');
      qry.Sql.Add('ORDER BY OA.CONSECUTIVO');
      qry.ParamByName('CodigoODT').AsFloat:= CodigoODT;
    end
    else
    begin
      qry.Sql.Clear;
      qry.Sql.Add('SELECT OA.CODIGOODT, OA.CONSECUTIVO, O.CODIGOADMINISTRATIVO,');
      qry.Sql.Add('OA.CODIGOGRUPOTRABAJO, OA.CODIGOASIGNACIONEMG');
      qry.Sql.Add('FROM EMG_ODTASIGNACION OA, ODT O');
      qry.Sql.Add('WHERE O.CODIGOODT = '+ FloatToStr(CodigoODT));
      qry.Sql.Add('AND OA.CODIGOESTADOASIGNACION = 1');
      qry.Sql.Add('AND (OA.CODIGOODT, OA.CONSECUTIVO) NOT IN (SELECT B.CODIGOODT, B.CONSECUTIVO');
      qry.Sql.Add('FROM  EMG_ODTASIGNACION B');
      qry.Sql.Add('WHERE OA.CODIGOODT = B.CODIGOODT');
      qry.Sql.Add('AND B.TIPODATOORIGEN = ''I'') ');
      qry.Sql.Add('AND OA.CODIGOODT= O.CODIGOODT');
      qry.Sql.Add('ORDER BY OA.CONSECUTIVO');
    end;

    qry.Open;
    if not qry.IsEmpty then
    begin
      qry.First;
      while (not qry.Eof) do
      begin
        bImportacionExitosa:= False;

        sCodigoODT:= qry.FieldByName('CODIGOODT').AsString;
        sConsecutivo:= qry.FieldByName('CONSECUTIVO').AsString;
        sCIA:= qry.FieldByName('CODIGOADMINISTRATIVO').AsString;
        sGT:= qry.FieldByName('CODIGOGRUPOTRABAJO').AsString;
        sCodigoAsignacionEMG:= qry.FieldByName('CODIGOASIGNACIONEMG').AsString;

        RutaODTsEscritorio := RutaAsignacionMovilU;
        NombreODT := 'ODT'+sCodigoODT+'_'+CompletarCadenaIzquierda(sConsecutivo,'0',2);
        DirDestino:= RutaODTsEscritorio;
        RutaFullArchivoSFTP:= DirRaiz_SFTP+sCIA+'\'+sGT+'\'+CarpetaImportadas+'\'+NombreODT+'.zip';

        if BajarArchivo_SFTP(RutaFullArchivoSFTP, DirDestino, False, False, pbMostrarProgreso) then
        begin
          With Zip do
          begin
            FileName := RutaODTsEscritorio+'\'+NombreODT+'.zip';
            OpenArchive( fmOpenRead );
            BaseDir := RutaODTsEscritorio+'\';
            TempDir := RutaODTsEscritorio+'\';
            ExtractFiles( '*.*' );
            CloseArchive;
          end;
          BuscarYRenombrarSDF(RutaODTsEscritorio+'\'+NombreODT+'\');

          bImpSDF:= ImportarAsignacionSDFU(sCodigoODT, sConsecutivo, sCodigoAsignacionEMG, sMensajeError);

          if bImpSDF then
          begin
            Query2:=TQuery.Create(nil);
            Query2.DatabaseName:='BaseDato';
            Query2.Sql.Add('SELECT CODIGOASIGNACIONEMG FROM EMG_ODTASIGNACION');
            Query2.Sql.Add('WHERE CODIGOODT='+sCodigoODT);
            Query2.Sql.Add('AND CONSECUTIVO='+sConsecutivo);
            Query2.Sql.Add('AND TIPODATOORIGEN=''I''');
            Query2.Open;
            CodigoAsignacionEMGI:= Query2.FieldByName('CODIGOASIGNACIONEMG').AsString;
            Query2.Close;
            Query2.SQL.Clear;
            Query2.Sql.Add('SELECT CERRARODT FROM EMG_REPORTEASIGNACION');
            Query2.Sql.Add('WHERE CODIGOASIGNACIONEMG='+CodigoAsignacionEMGI);
            Query2.Open;
            InfraestructuraAutomatica:= Query2.FieldByName('CERRARODT').AsString;
            Query2.Close;
            Query2.Free;

            if sAsociaReps = 'T' then
            begin
              SincronizarMovil:=TSincronizarMovil.Crear(StrToFloat(sCodigoODT),StrToFloat(sConsecutivo));
              if InfraestructuraAutomatica = '1' then
              begin
                bMontoInfra := MontarInfraestructuraU(sCodigoODT, sConsecutivo, CodigoAsignacionEMGI, sMensajeError);
                if bMontoInfra then
                begin
                  sAsignacionesConMI:= sAsignacionesConMI+NombreODT+Chr(13);
                  //Si el Reporte fue actualizado a estado PENDIENTE borro la relacion ODT - REPORTE para que pueda ser asignado nuevamente.
                  BorrarRelacionODTReporte(sCodigoODT, sConsecutivo);
                  bImportacionExitosa:= True;
                end
                else
                begin
                  BorrarAsignacionEMG_I(sCodigoODT, sConsecutivo);
                  if sMensajeError <> '' then
                    sAsignacionesConErrores:= sAsignacionesConErrores+NombreODT+': '+sMensajeError+Chr(13)+Chr(13)
                  else
                    sAsignacionesConErrores:= sAsignacionesConErrores+NombreODT+': Error desconocido.'+Chr(13)+Chr(13);
                end;
              end
              else
              begin
                bActRepyODT := ActualizarReporteYODT(sCodigoODT, sConsecutivo, CodigoAsignacionEMGI, sMensajeError);
                if bActRepyODT then
                begin
                  bImportacionExitosa:= True;
                  sAsignacionesSinMI:= sAsignacionesSinMI+NombreODT+Chr(13);
                end
                else
                begin
                  if sMensajeError <> '' then
                    sAsignacionesConErrores:= sAsignacionesConErrores+NombreODT+': '+sMensajeError+Chr(13)+Chr(13)
                  else
                    sAsignacionesConErrores:= sAsignacionesConErrores+NombreODT+': Error desconocido.'+Chr(13)+Chr(13);
                end;
              end;
            end
            else
            begin
              bImportacionExitosa:= True;
              sAsignacionesSinMI:= sAsignacionesSinMI+NombreODT+Chr(13);
            end;
          end
          else
          begin
            if sMensajeError <> '' then
              sAsignacionesConErrores:= sAsignacionesConErrores+NombreODT+': '+sMensajeError+Chr(13)+Chr(13)
            else
              sAsignacionesConErrores:= sAsignacionesConErrores+NombreODT+': Error desconocido.'+Chr(13)+Chr(13);
          end;
        end
        else
        begin
          sCIA_GT:= 'CIA: '+sCIA+' - GT: '+sGT;
          sAsignacionesInvalidas:= sAsignacionesInvalidas+NombreODT+': Falta cargar desde la móvil ('+sCIA_GT+')'+Chr(13);
        end;

        if bImportacionExitosa then
        begin
          //Mover ambos .zip a reciclaje en el SFTP.
          try
            if FileExists(RutaODTsEscritorio+'\'+NombreODT+'.zip') then
            begin
              RutaCarpetaDestinoSFTP:= DirRaiz_SFTP+'Reciclaje\'+CarpetaImportadas+'\';
              //Subo el .zip de Importacion a Reciclaje
              if SubirArchivo_SFTP(RutaODTsEscritorio+'\'+NombreODT+'.zip', RutaCarpetaDestinoSFTP, True, False, pbMostrarProgreso) then
              begin
                //Borro el .zip de Importacion de la carpeta de EnerGis.
                DeleteFile(PChar(RutaODTsEscritorio+'\'+NombreODT+'.zip'));
                RutaFullArchivoSFTP:= DirRaiz_SFTP+sCIA+'\'+sGT+'\'+CarpetaImportadas+'\'+NombreODT+'.zip';
                //Borro el .zip de Importacion en el SFTP
                if BorrarArchivo_SFTP(RutaFullArchivoSFTP, False) then
                begin
                  RutaFullArchivoSFTP:= DirRaiz_SFTP+sCIA+'\'+sGT+'\'+CarpetaExportadas+'\'+NombreODT+'.zip';
                  //Bajo el .zip de Exportacion
                  if BajarArchivo_SFTP(RutaFullArchivoSFTP, DirDestino, False, False, pbMostrarProgreso) then
                  begin
                    RutaCarpetaDestinoSFTP:= DirRaiz_SFTP+'Reciclaje\'+CarpetaExportadas+'\';
                    //Subo el .zip de Exportacion a Reciclaje
                    if SubirArchivo_SFTP(RutaODTsEscritorio+'\'+NombreODT+'.zip', RutaCarpetaDestinoSFTP, True, False, pbMostrarProgreso) then
                    begin
                      //Borro el .zip de Exportacion de la carpeta de EnerGis.
                      DeleteFile(PChar(RutaODTsEscritorio+'\'+NombreODT+'.zip'));
                      RutaFullArchivoSFTP:= DirRaiz_SFTP+sCIA+'\'+sGT+'\'+CarpetaExportadas+'\'+NombreODT+'.zip';
                      //Borro el .zip de Exportacion en el SFTP
                      if BorrarArchivo_SFTP(RutaFullArchivoSFTP, False) then
                      begin
                        if InfraestructuraAutomatica = '1' then
                          sAsignacionesConMI:= Trim(sAsignacionesConMI)+' - Reciclada'+Chr(13)
                        else
                          sAsignacionesSinMI:= Trim(sAsignacionesSinMI)+' - Reciclada'+Chr(13);
                      end;
                    end;
                  end;
                end;
              end;
            end;
          except
            if InfraestructuraAutomatica = '1' then
              sAsignacionesConMI:= Trim(sAsignacionesConMI)+' - NO Reciclada'+Chr(13)
            else
              sAsignacionesSinMI:= Trim(sAsignacionesSinMI)+' - NO Reciclada'+Chr(13);
          end;
        end;

        qry.Next;
      end;

      if sAsignacionesInvalidas <> '' then
        sAsignacionesInvalidas:='Asignaciones Sin Procesar: '+Chr(13)+sAsignacionesInvalidas;

      if sAsignacionesSinMI <> '' then
        sAsignacionesSinMI:='Asignaciones Procesadas SIN cierre de ODT Hija: '+Chr(13)+sAsignacionesSinMI;

      if sAsignacionesConMI <> '' then
        sAsignacionesConMI:='Asignaciones Procesadas CON cierre de ODT HIja: '+Chr(13)+sAsignacionesConMI;

      sMensCompleto:= Trim(sAsignacionesInvalidas+Chr(13)+sAsignacionesSinMI+Chr(13)+sAsignacionesConMI);

      if sMensCompleto <> '' then
        psResumenPro:= psResumenPro+Chr(13)+Chr(13)+'RESUMEN DEL PROCESO ODT ['+FloatToStr(CodigoODT)+'] : '+Chr(13)+sMensCompleto;

      if sAsignacionesConErrores <> '' then
        psResumenPro:= psResumenPro+Chr(13)+Chr(13)+'Asignaciones CON Errores (Contacte a Soporte): '+Chr(13)+sAsignacionesConErrores;
    end
    else
      psResumenPro:= psResumenPro+Chr(13)+Chr(13)+'RESUMEN DEL PROCESO ODT ['+FloatToStr(CodigoODT)+'] : No hay reportes pendientes por procesar.';

    qry.Close;
    qry.Free;
    dmTablasEMG.Free;
  end
  else
    psResumenPro:= psResumenPro+Chr(13)+Chr(13)+'No se pudo conectar al servidor SFTP: '+Host_SFTP+chr(13)+chr(13)+'Proceso Abortado.';
  Zip.Free;

  if pbMostrarMensajes then
  begin
    fBloc:= TfBloc.Create(Application);
    fBloc.Memo1.Lines.Text:=psResumenPro;
    fBloc.ShowModal;
    fBloc.Free;
  end;
End;

function RutaAsignacionMovilU: string;
begin
  result := ExtractFilePath(ParamStr(0));
  if result[Length(result)] <> '\' then
     result := result + '\';
  result:=result+'Datos EnerGis Movil';
end;

function CompletarCadenaIzquierda(s,c: string; n: integer): string;
var i:integer;
begin
  result:=s;
  if (length(s)<n) then
  begin
    i:=n-length(s);
    c:=copy(c,1,i);
    result:=c+result;
    result:=CompletarCadenaIzquierda(result,c,n);
  end;
end;

function ImportarAsignacionSdfU(codigoodt, consecutivo, codigoasignacionemg: string; var sMensajeError: string): Boolean;
var
  query:TQuery;
  Servidor,Usuario,ClaveUsuario,esquema,asignacion:string;
  ruta,carpeta:string;
  bImportarSM: Boolean;
  Tamano: Word;
begin
  try
    Result:= True;
    bImportarSM:= False;
    Tamano := 255;

    query:=TQuery.Create(nil);
    query.DatabaseName:='BaseDato';
    query.sql.Text:='SELECT * FROM tipoapoyo';
    query.Open;

    ruta := RutaAsignacionMovilU;
    carpeta := NombreODT;
    Servidor:=query.Database.Params.Values['SERVER NAME'];
    Usuario:=query.Database.Params.Values['USER NAME'];
    ClaveUsuario:=query.Database.Params.Values['PASSWORD'];

    query.Close;
    query.sql.Clear;
    query.sql.Text:='SELECT sys_context(''USERENV'', ''CURRENT_SCHEMA'') FROM dual';
    query.Open;
    esquema:=query.Fields[0].AsString;
    query.Close;
    query.sql.Clear;
    query.sql.Text:='SELECT SQ_CODIGOASIGNACIONEMG.NEXTVAL FROM DUAL';
    query.Open;
    asignacion:=query.Fields[0].AsString;
    query.Close;

    SetLength(sMensajeError, Tamano);
    bImportarSM:= ImportarSM(ruta+'\'+carpeta+'\',
                             Servidor,
                             Usuario,
                             ClaveUsuario,
                             Esquema,
                             CODIGOODT,
                             CONSECUTIVO,
                             Asignacion,
                             PChar(sMensajeError),
                             Tamano);

    Application.ProcessMessages;
    if bImportarSM then
    begin
      Query.sql.Clear;
      Query.sql.Add('UPDATE EMG_ODTASIGNACION');
      Query.sql.Add('SET CODIGOESTADOASIGNACION=2');
      Query.sql.Add('WHERE CODIGOODT='+CODIGOODT);
      Query.sql.Add('AND CONSECUTIVO='+CONSECUTIVO);
      Query.ExecSQL;
      Query.Close;
      Query.sql.Clear;
      Query.sql.Add('UPDATE EMG_ODTASIGNACION');
      Query.sql.Add('SET FECHAPROCESO=SYSDATE');
      Query.sql.Add('WHERE CODIGOODT='+CODIGOODT);
      Query.sql.Add('AND CONSECUTIVO='+CONSECUTIVO);
      Query.sql.Add('AND TIPODATOORIGEN=''I''');
      Query.ExecSQL;
      Query.Close;
      dmTablasEMG.FiltrarDatos(strtofloat (asignacion));
    end
    else
    begin
      Result:= False;
      SetLength(sMensajeError, Tamano);
      sMensajeError:= 'Error en IESDF.dll - '+sMensajeError;
    end;
    Query.Free;
  except
    on e: Exception do
    begin
      result:= False;
      if sMensajeError = '' then
        sMensajeError:= e.Message;
    end;
  end;
end;

function MontarInfraestructuraU(codigoodt, consecutivo, codigoasignacionI:string; var sMensajeError : string) : Boolean;
var
  qry:TQuery;
  sql:string;
  pr_gestionar_observacion: TStoredProc;
  Fespere: TfFormaEspere;
begin
  try
    result:= True;
    qry:=TQuery.Create(nil);
    qry.Databasename:='BaseDato';
    qry.Sql.Clear;
    sql:='UPDATE EMG_ODTASIGNACION  SET CODIGOESTADOASIGNACION= 10 WHERE CODIGOASIGNACIONEMG = '+codigoasignacionI;
    qry.Sql.Add(sql);
    qry.ExecSQL;
    qry.Close;
    qry.Free;

    fEspere := TfFormaEspere.Create(Application);
    fEspere.ProgressBar1.Max := 3;

    fEspere.lbMotivo.Caption := 'Borrando Infraestructura...';
    fEspere.Show;
    fEspere.ProgressBar1.Position := 1;
    fEspere.Refresh;
    application.ProcessMessages;
    IniciarSesionGestionOdtHija(strtofloat(codigoodt),strtofloat(consecutivo));
    SincronizarMovil.BorrarInfraestructura;

    fEspere.lbMotivo.Caption := 'Insertando Infraestructura...';
    fEspere.ProgressBar1.Position := 2;
    fEspere.Refresh;
    application.ProcessMessages;
    SincronizarMovil.InsertarInfraestructura;

    fEspere.lbMotivo.Caption := 'Actualizando Infraestructura...';
    fEspere.ProgressBar1.Position := 3;
    fEspere.Refresh;
    application.ProcessMessages;
    SincronizarMovil.ActalizarInfraestructura;
    fEspere.ProgressBar1.Position := 4;
    fEspere.Refresh;
    SincronizarMovil.DesbloquearInfraestructura;
    application.ProcessMessages;

    pr_gestionar_observacion     := TStoredProc.Create(nil);
    pr_gestionar_observacion.DatabaseName := 'BaseDato';
    pr_gestionar_observacion.StoredProcName :='PR_GESTIONAR_OBSERVACION';
    pr_gestionar_observacion.ExecProc;
    pr_gestionar_observacion.free;

    TerminarSesionGestionOdtHija(strtofloat(codigoodt),strtofloat(consecutivo));
    fEspere.Close;
    fEspere.Free;
  except
    on e: Exception do
    begin
      result:= False;
      fEspere.Free;
      sMensajeError:= e.Message;
    end;
  end;
end;

function BorrarAsignacionEMG_I(pCodigoODT, pConsecutivo: string): Boolean;
var
  query:TQuery;
  sl,listatablas:TStringList;
  asignacion:Double;
  i:integer;
  sCodigoODT, sConsecutivo: string;
begin
  sCodigoODT:= pCodigoODT;
  sConsecutivo:= pConsecutivo;
  query:=TQuery.Create(nil);
  query.DatabaseName:='BaseDato';
  query.Close;
  query.sql.Clear;
  query.sql.Add('UPDATE EMG_ODTASIGNACION SET CODIGOESTADOASIGNACION = 1');
  query.sql.Add('WHERE CODIGOODT = '+sCodigoODT);
  query.sql.Add('AND CONSECUTIVO ='+sConsecutivo);
  query.sql.Add('AND TIPODATOORIGEN=''E'' ');
  query.ExecSQL;
  query.Close;
  query.SQL.Clear;
  query.Sql.Add('SELECT CODIGOASIGNACIONEMG FROM EMG_ODTASIGNACION');
  query.Sql.Add('WHERE CODIGOODT='+sCodigoODT);
  query.Sql.Add('AND CONSECUTIVO='+sConsecutivo);
  query.Sql.Add('AND TIPODATOORIGEN=''I'' ');
  query.Open;

  asignacion:=0;
  if query.Fields[0].AsString <> '' then
  begin
    asignacion:=query.Fields[0].AsFloat;
    query.Close;
    query.sql.Clear;
    query.sql.Add('UPDATE APOYO A SET ENREVISIONMOVIL=0');
    query.sql.Add('WHERE EXISTS');
    query.sql.Add('(SELECT NULL FROM EMG_APOYO E');
    query.sql.Add('WHERE CODIGOASIGNACIONEMG='+FloatToStr(asignacion));
    query.sql.Add('AND A.CODIGOAPOYO=E.CODIGOAPOYO)');
    query.ExecSQL;
    query.Close;

    sl:=TStringList.Create;
    sl.Add('WHERE CODIGOASIGNACIONEMG='+ FloatToStr(asignacion));

    listatablas:=TStringList.create;
    ListaTablas.Add('EMG_ODTASIGNACION');
    ListaTablas.Add('EMG_APOYO');
    ListaTablas.Add('EMG_NODOMT');
    ListaTablas.Add('EMG_NODOBT');
    ListaTablas.Add('EMG_INTERRUPTORDIS');
    ListaTablas.Add('EMG_PARARRAYODIS');
    ListaTablas.Add('EMG_CONDENSADOR');
    ListaTablas.Add('EMG_FOTOAPOYO');
    ListaTablas.Add('EMG_DIRECCIONAPOYO');
    ListaTablas.Add('EMG_DETALLEAPOYO');
    ListaTablas.Add('EMG_TEMPLETEPOSTE');
    ListaTablas.Add('EMG_INCIDENTALAPOYO');
    ListaTablas.Add('EMG_EXCAVACION');
    ListaTablas.Add('EMG_DUCTOEXCAVACION');
    ListaTablas.Add('EMG_TRAFODIS');
    ListaTablas.Add('EMG_TRAFODISOBSERVACION');
    ListaTablas.Add('EMG_TRAMOMT');
    ListaTablas.Add('EMG_TRAMOBT');
    ListaTablas.Add('EMG_STOCKGRUPOTRABAJO');
    ListaTablas.Add('EMG_ODTPRESMATE');
    ListaTablas.Add('EMG_ALUMBRADOPUBLICO');
    //ListaTablas.Add('EMG_SENALINCIDENTAL');
    //ListaTablas.Add('EMG_clientesgd_inventario');
    //ListaTablas.Add('EMG_SENALINCIDENTALOBSERVACION');
    ListaTablas.Add('EMG_CLIENTESGD');
    ListaTablas.Add('EMG_FOTOCLIENTE');
    ListaTablas.Add('EMG_CLIENTEOBSERVACION');
    ListaTablas.Add('EMG_DIRECCIONCLIENTESGD');
    ListaTablas.Add('EMG_MATERIALENCAMPO');
    ListaTablas.Add('EMG_ELEMENTOSELIMINADOS');

    for i:= listatablas.count -1 downto 0 do
    begin
      query.Close;
      query.sql.clear;
      query.sql.add('DELETE FROM '+listatablas[i]);
      query.sql.Add(sl.text);
      query.ExecSQL;
    end;
  end;

  query.Close;
  query.Free;
end;

function ActualizarReporteYODT(codigoodt, consecutivo, codigoasignacionI:string; var sMensajeError : string) : Boolean;
var
  qry:TQuery;
  sql:string;
  pr_gestionar_observacion: TStoredProc;
  Fespere: TfFormaEspere;
begin
  try
    result:= True;
    qry:=TQuery.Create(nil);
    qry.Databasename:='BaseDato';
    qry.Sql.Clear;
    sql:='UPDATE EMG_ODTASIGNACION  SET CODIGOESTADOASIGNACION= 2 WHERE CODIGOASIGNACIONEMG = '+codigoasignacionI;
    qry.Sql.Add(sql);
    qry.ExecSQL;
    qry.Close;
    qry.Free;

    fEspere := TfFormaEspere.Create(nil);
    fEspere.ProgressBar1.Max := 5;

    fEspere.lbMotivo.Caption := 'Actualizando el Reporte y la ODT...';
    fEspere.Show;
    fEspere.ProgressBar1.Position := 1;
    fEspere.Refresh;
    application.ProcessMessages;
    IniciarSesionGestionOdtHija(strtofloat(codigoodt),strtofloat(consecutivo));

    fEspere.ProgressBar1.Position := 2;
    fEspere.Refresh;
    application.ProcessMessages;
    SincronizarMovil.ActualizarSOLOReporteYODT;
    fEspere.ProgressBar1.Position := 3;
    fEspere.Refresh;
    application.ProcessMessages;

    pr_gestionar_observacion     := TStoredProc.Create(nil);
    pr_gestionar_observacion.DatabaseName := 'BaseDato';
    pr_gestionar_observacion.StoredProcName :='PR_GESTIONAR_OBSERVACION';
    pr_gestionar_observacion.ExecProc;
    pr_gestionar_observacion.free;

    fEspere.ProgressBar1.Position := 5;
    fEspere.Refresh;
    application.ProcessMessages;

    TerminarSesionGestionOdtHija(strtofloat(codigoodt),strtofloat(consecutivo));
    fEspere.Close;
    fEspere.Free;
  except
    on e: Exception do
    begin
      result:= False;
      fEspere.Free;
      sMensajeError:= e.Message;
    end;
  end;
end;

procedure BorrarRelacionODTReporte(pCodigoODT, pConsecutivo: string);
var
  Query2: TQuery;
begin
  Query2:=TQuery.Create(nil);
  Query2.DatabaseName:='BaseDato';
  Query2.Sql.Add('DELETE FROM ODTREPORTE O');
  Query2.Sql.Add('WHERE EXISTS');
  Query2.Sql.Add('(SELECT O.CONSECUTIVO, O.CODIGOREPORTE, ER.COLOR, ER.NOMBREESTADOREPORTE');
  Query2.Sql.Add('FROM  REPORTE R, ESTADOREPORTE ER');
  Query2.Sql.Add('WHERE R.CODIGOREPORTE = O.CODIGOREPORTE');
  Query2.Sql.Add('AND R.CODIGOESTADOREPORTE = ER.CODIGOESTADOREPORTE');
  Query2.Sql.Add('AND O.CODIGOODT= :CODIGOODT');
  Query2.Sql.Add('AND O.CONSECUTIVO= :CONSECUTIVO');
  Query2.Sql.Add('AND R.CODIGOESTADOREPORTE = 1 )');
  Query2.ParamByName('CODIGOODT').AsString:= pCodigoODT;
  Query2.ParamByName('CONSECUTIVO').AsString:= pConsecutivo;
  Query2.ExecSQL;
  Query2.Close;
  Query2.Free;
end;


end.
