unit uListaCarta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, Db, Grids, DBGrids, UTrCVS, DBTables, Digisoft, StdCtrls,
  ExtCtrls, UtdNavigator, Buttons, Menus, RXDBCtrl,Qrctrls;

type
  TFListaCarta = class(TFdSgdListaBase)
    Panel4: TPanel;
    qCarta: TQuery;
    qPersonalCarta: TQuery;
    Label1: TLabel;
    DBGrid2: TDBGrid;
    dsqPersonalCarta: TDDataSource;
    qPersonalCartaCODIGOCARTAEMPLEADO: TFloatField;
    qPersonalCartaCODIGOCARTA: TFloatField;
    qPersonalCartaCODIGOEMPLEADO: TFloatField;
    qPersonalCartaFECHAENVIO: TDateTimeField;
    qPersonalCartaOBSERVACION: TStringField;
    qPersonalCartaNOMBREEMPLEADO: TStringField;
    qPersonalCartaCODIGOADMINISTRATIVO: TFloatField;
    qPersonalCartaNOMBREADMINISTRATIVO: TStringField;
    sbInsertar: TSpeedButton;
    sbEditarPadre: TSpeedButton;
    PMOrdenar: TPopupMenu;
    Codigo: TMenuItem;
    FechaEmision: TMenuItem;
    Objeto: TMenuItem;
    N3: TMenuItem;
    ZonaCiudad: TMenuItem;
    Barrio: TMenuItem;
    Direccion: TMenuItem;
    N4: TMenuItem;
    Prioridad: TMenuItem;
    Labor: TMenuItem;
    Responsable: TMenuItem;
    Estado: TMenuItem;
    N1: TMenuItem;
    DivisionSeccion: TMenuItem;
    Cuadrilla: TMenuItem;
    dbgListaCartas: TRxDBGrid;
    qFechaLimiteAtencion: TQuery;
    qCartaCODIGOCARTA: TFloatField;
    qCartaNUMERORADICACIONRECEPCION: TFloatField;
    qCartaNUMERORADICACIONRESPUESTA: TFloatField;
    qCartaCODIGOARCHIVO: TFloatField;
    qCartaNUMEROANEXOS: TFloatField;
    qCartaCODIGOREPORTE: TFloatField;
    qCartaFECHARADICACION: TDateTimeField;
    qCartaFECHARECEPCION: TDateTimeField;
    qCartaFECHAATENCION: TDateTimeField;
    qCartaFECHALIMITEATENCION: TDateTimeField;
    qCartaCODIGOEMPLEADORECIBE: TFloatField;
    qCartaDIRIGIDOCARTASOLICITUD: TStringField;
    qCartaASUNTO: TMemoField;
    qCartaDIRIGIDOCARTARESPUESTA: TStringField;
    qCartaFIRMANTE: TStringField;
    qCartaEMPRESA: TStringField;
    qCartaCODIGOESTADOCARTA: TFloatField;
    qCartaCODIGOTIPORECEPCIONCARTA: TFloatField;
    qCartaCODIGOTIPOENVIOCARTA: TFloatField;
    qCartaPLAZOATENCION: TFloatField;
    qCartaNOMBREESTADOCARTA: TStringField;
    qCartaTIPORECEPCIONCARTA: TStringField;
    qCartaTIPOENVIOCARTA: TStringField;
    procedure sbInsertarClick(Sender: TObject);
    procedure sbEditarPadreClick(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
    procedure SBOrdenarClick(Sender: TObject);
    procedure SBEstadisticaClick(Sender: TObject);
    procedure SBImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgListaCartasDblClick(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgListaCartasMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure dbgListaCartasTitleClick(Column: TColumn);
    procedure FormDestroy(Sender: TObject);
  private
  public
    TeclaShift:Boolean;
    ListaOrden:TStringList;
    Lista,ListaFrom : TStringList;
    procedure Filtrar;
    procedure LimpiarFiltro;
  end;

var
  FListaCarta: TFListaCarta;

implementation

uses uBuscarCarta, uEstadisticasCarta, uQRListadoCARTA, uFIMPComunes, uCarta;

{$R *.DFM}

procedure TFListaCarta.sbInsertarClick(Sender: TObject);
 var qDatos:TQuery;
begin
  FCarta:=TFCarta.Create(Application);
  try
   if not FCarta.qCARTA.Database.InTransaction then
       FCarta.qCARTA.Database.StartTransaction;
    FCarta.qCARTA.Insert;
    qDatos:=TQuery.Create(Application);
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Text:='SELECT Max(CODIGOCARTA) as Codigo FROM CARTA';
    qDatos.Open;
    FCarta.qCARTA.FieldByName('CODIGOCARTA').AsInteger:=qDatos.Fields[0].AsInteger+1;
    FCarta.qCARTA.Post;
    FCarta.qCARTA.Edit;
    if FCarta.ShowModal=mrOK then
    begin
       FCarta.qCARTA.Database.Commit;
       qCarta.Close;
       qCarta.Open;
       qCarta.Locate('CODIGOCARTA',(FCarta.qCARTACODIGOCARTA.AsInteger),[])
    end
    else
       FCarta.qCARTA.Database.Rollback;
  finally
    FCarta.Free;
  end;
end;

procedure TFListaCarta.sbEditarPadreClick(Sender: TObject);
Var CodigoCarta:Integer;
begin
  CodigoCarta := qCartaCODIGOCARTA.AsInteger;
  FCarta:=TFCarta.Create(Application);
  try
    FCarta.qCARTA.Close;
    FCarta.qCARTA.ParamByName('CODIGOCARTA').AsInteger:=qCartaCODIGOCARTA.AsInteger;
    FCarta.qCARTA.Open;
    FCarta.qCARTA.Edit; 
    if not FCarta.qCARTA.Database.InTransaction then
       FCarta.qCARTA.Database.StartTransaction;
    if FCarta.ShowModal=mrOK then
    begin
       FCarta.qCARTA.Database.Commit;
       qCarta.Close;
       qCarta.Open;
       qCarta.Locate('CODIGOCARTA',CodigoCarta,[])
    end
    else
       FCarta.qCARTA.Database.Rollback;
  finally
    FCarta.Free;
  end;
end;

procedure TFListaCarta.SBBuscarClick(Sender: TObject);
begin
  fBuscarCARTA := TfBuscarCARTA.Create(Application);
  fBuscarCARTA.dsCARTA.DataSet := qCARTA;
  fBuscarCARTA.ShowModal;
  fBuscarCARTA.Free;
end;

procedure TFListaCarta.SBOrdenarClick(Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel2.ClientToScreen(Classes.Point(SBOrdenar.Left, SBOrdenar.top));
  pmOrdenar.Popup(punto.x+10, punto.y+10);
end;

procedure TFListaCarta.SBEstadisticaClick(Sender: TObject);
Var i:integer;
begin
  fEstadisticasCarta := TfEstadisticasCarta.Create(Application);
  try
  fEstadisticasCarta.DecisionQuery1.close;
  fEstadisticasCarta.DecisionQuery1.SQL.Clear;
  fEstadisticasCarta.DecisionQuery1.SQL.Add('SELECT count(*) as Registros, E.NOMBREESTADOCARTA, C.FECHARADICACION , C.FECHARECEPCION, C.FECHAATENCION ');
  For i:=1 to qCarta.SQL.Count-2 do fEstadisticasCarta.DecisionQuery1.SQL.Add(qCarta.SQL[i]);
  fEstadisticasCarta.DecisionQuery1.SQL.Add('group by E.NOMBREESTADOCARTA, C.FECHARADICACION, C.FECHARECEPCION, C.FECHAATENCION');
  fEstadisticasCarta.DecisionQuery1.Open;
  fEstadisticasCarta.ShowModal;
  except
    ShowMessage('Datos insuficientes para realizar la Estadística');
  end;
  fEstadisticasCarta.Free;

end;

procedure TFListaCarta.SBImprimirClick(Sender: TObject);
begin
  qCarta.Close;
  qCarta.Open;
  FQRListadoCarta:=TFQRListadoCarta.Create(Application);
  try
    FQRListadoCarta.QuickRep.DataSet:=qCarta;
    FQRListadoCarta.dsCarta.DataSet:=qCarta;
    FQRListadoCarta.QuickRep.Preview;
  except
    FQRListadoCarta.Free;
  end;
end;

procedure TFListaCarta.FormShow(Sender: TObject);
var Mensaje:string;
begin
  qCarta.Open;
  qFechaLimiteAtencion.Close;
  qFechaLimiteAtencion.Open;
  if qFechaLimiteAtencion.RecordCount>0 then
  begin
    if qFechaLimiteAtencion.RecordCount>1 then
    begin
      Mensaje:='Las Cartas con códigos de archivo ';
      while not qFechaLimiteAtencion.Eof do
      begin
        Mensaje:=Mensaje+ qFechaLimiteAtencion.fieldbyname('CODIGOCARTA').AsString+', ';
        qFechaLimiteAtencion.Next;
      end;
      Mensaje:=Copy(Mensaje,1,length(Mensaje)-2)+ ' Están cercanas a la fecha Límite de atención';
    end
    else
    begin
      Mensaje:='La Carta con código de archivo ' + qFechaLimiteAtencion.fieldbyname('CODIGOCARTA').AsString
               + ' Está cercana a la fecha Límite de atención';
    end;
    Application.MessageBox(PChar(Mensaje),PChar('Información'),MB_ICONEXCLAMATION+MB_OK);
  end;
end;

procedure TFListaCarta.dbgListaCartasDblClick(Sender: TObject);
begin
  inherited;
  sbEditarPadreClick(nil);
end;

procedure TFListaCarta.SBFiltrarClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TFListaCarta.Filtrar;
Var CadFrom : String;
begin
  Lista := GetQueryFiltroCarta(ListaRotulos, ListaDatos, ListaFrom);
  If Lista <> Nil then
   begin
     qCarta.Close;
     If qCarta.sql.Count > 5 then LimpiarFiltro;
     qCarta.SQl.Insert(5,Lista.Text);
     CadFrom := 'from carta c, estadocarta e, tipoenviocarta tc1,tipoenviocarta tc2';
     qCarta.SQL[1]:= CadFrom;
     qCarta.Open;
     if qCarta.RecordCount > 1
     then lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + inttostr(qcarta.recordcount) +' Registros Encontrados >>'
     else lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + inttostr(qcarta.recordcount)+' Registro Encontrado >>';
   end;
end;

procedure TFListaCarta.LimpiarFiltro;
var
  nLineasExtra,i: Byte;
begin
  nLineasExtra := qCarta.SQL.Count-6;
  if nLineasExtra > 0 then
  begin
    for i:=1 to nLineasExtra do
    begin
      qCarta.SQL.Delete(5);
      qCarta.SQL.Delete(5);
    end;
  end;
end;

procedure TFListaCarta.FormCreate(Sender: TObject);
begin
  inherited;
  ListaFrom := TStringList.Create;
  ListaOrden := TStringList.Create;  
end;

procedure TFListaCarta.dbgListaCartasMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
begin
  pt:= dbgListaCartas.MouseCoord(x, y);

  if pt.y=0 then
   begin
      dbgListaCartas.Cursor:=crHandPoint;
      if Shift = [ssShift] then
          TeclaShift:=True
      else
          TeclaShift:=False;
    end
  else
    dbgListaCartas.Cursor:=crDefault;
end;

procedure TFListaCarta.dbgListaCartasTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if qCarta.FieldByName(Columna).Lookup  then
    Result := qCarta.FieldByName(Columna).KeyFields
  else
    if qCarta.FieldByName(Columna).Calculated then
    begin
      Result := '1';
      MessageDlg('Imposible ordenar por este campo calculado.' + Chr(13) +
                 'Se ordenara por el primer campo.', mtInformation, [mbOk], 0 );
    end
    else
      Result := Columna;
end;

var
  ListaTemp:TStringList;
  i:Integer;
  Encontrado:Boolean;
  Sort:String;
begin

  with dbgListaCartas.DataSource.DataSet do
  begin
    try
      dbgListaCartas.Columns[PreviousColumnIndex].title.Font.Style :=
      dbgListaCartas.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
    except
    end;
    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];
    Encontrado:=False;
    if PreviousColumnIndex = Column.Index then
       begin
         Encontrado:=True;
         ListaTemp:=TStringList.Create;
         for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
              end;
          end;
          ListaTemp.Free;
        end
    else
      begin
          if (not TeclaShift) then
             ListaOrden.Clear;
      end;

    PreviousColumnIndex := Column.Index;
    if (ListaOrden.Count > 0) and (not Encontrado) then
     begin
        ListaTemp:=TStringList.Create;
        Encontrado:=False;
        for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
                Encontrado:=True;
              end;
          end;
        if (not Encontrado) then
          if NombreColumna(Column.Field.FieldName) <> '' then
            ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');
        ListaTemp.Free;
     end;

     if (ListaOrden.Count = 0) then
       if NombreColumna(Column.Field.FieldName) <> '' then
        ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');

     qCarta.SQl.Delete(qCarta.SQl.Count - 1);
     Sort:='Order By ';
     for i:=0 to ListaOrden.Count - 1 do
     begin
       ListaTemp:=TStringList.Create;
       ListaTemp.CommaText:=ListaOrden[i];
       if i <> ListaOrden.Count - 1 then
         Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1] + ','
       else
         Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1];
       ListaTemp.Free;
     end;
     qCarta.Sql.Add(Sort);
     qCarta.Close;
     qCarta.Open;
  end;
end;

procedure TFListaCarta.FormDestroy(Sender: TObject);
begin
  inherited;
  ListaOrden.Free;
  ListaFrom.Free;
end;

end.
 