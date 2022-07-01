unit uValoresMtto;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Grids, DBGrids, RXDBCtrl, Digisoft, StdCtrls, ExtCtrls,
  Buttons, UtdNavigator, DBCtrls;

type
  TFValoresMantenimiento = class(TForm)
    Panel1: TPanel;
    dbNavigator1: TdNavigator;
    Panel5: TPanel;
    SBFiltrar: TSpeedButton;
    SBOrdenar: TSpeedButton;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Panel3: TPanel;
    dsValorMantenimiento: TDDataSource;
    qValorMantenimiento: TQuery;
    updValorMantenimiento: TUpdateSQL;
    sbCerrar: TSpeedButton;
    dbgValorMantenimiento: TRxDBGrid;
    qCopiar: TQuery;
    Query1: TQuery;
    Query2: TQuery;
    Query3: TQuery;
    Query4: TQuery;
    qValorMantenimientoCODIGOVALOR: TFloatField;
    qValorMantenimientoCODIGOTIPOVALOR: TFloatField;
    qValorMantenimientoVALOR: TStringField;
    qTipoValor: TQuery;
    qTipoValorCODIGOTIPOVALOR: TFloatField;
    qTipoValorNOMBRETIPOVALOR: TStringField;
    qValorMantenimientoTipoValor: TStringField;
    procedure qValorMantenimientoAfterPost(DataSet: TDataSet);
    procedure sbCerrarClick(Sender: TObject);
    procedure SBOrdenarClick(Sender: TObject);
    procedure dbgViaticoZonaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgViaticoZonaTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure qValorMantenimientoAfterDelete(DataSet: TDataSet);
    procedure sbCopiarViaticoClick(Sender: TObject);
    procedure sbPegarViaticoClick(Sender: TObject);
    procedure qValorMantenimientoAfterInsert(DataSet: TDataSet);
  private
  public
    TeclaShift:boolean;
    ListaDatos,ListaOrden,ListaFormatos:TStringList;
    procedure Filtrar(filtro:string);
    procedure LimpiarFiltro;
  end;

var
  FValoresMantenimiento: TFValoresMantenimiento;

implementation


{$R *.DFM}


procedure TFValoresMantenimiento.filtrar(filtro:string);
begin
  qValorMantenimiento.Close;
  if qValorMantenimiento.sql.Count > 2 then
    LimpiarFiltro;
  qValorMantenimiento.SQL.insert(1,filtro);
  qValorMantenimiento.Open;
end;

procedure TFValoresMantenimiento.LimpiarFiltro;
var
  nLineasExtra, I: Byte;
begin
  nLineasExtra := qValorMantenimiento.SQL.Count - 2;
  if nLineasExtra > 0 then
    for I := 1 to nLineasExtra do
    begin
      qValorMantenimiento.SQL.Delete(1);
    end;
end;

procedure TFValoresMantenimiento.qValorMantenimientoAfterPost(DataSet: TDataSet);
begin
  qValorMantenimiento.ApplyUpdates;
  qValorMantenimiento.CommitUpdates;
end;


procedure TFValoresMantenimiento.sbCerrarClick(Sender: TObject);
begin
  close;
end;

procedure TFValoresMantenimiento.SBOrdenarClick(Sender: TObject);
begin
  qValorMantenimiento.close;
  qValorMantenimiento.open;
end;

procedure TFValoresMantenimiento.dbgViaticoZonaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
begin
  pt:= dbgValorMantenimiento.MouseCoord(x, y);

  if pt.y=0 then
   begin
      dbgValorMantenimiento.Cursor:=crHandPoint;
      if Shift = [ssShift] then
          TeclaShift:=True
      else
          TeclaShift:=False;
    end
  else
    dbgValorMantenimiento.Cursor:=crDefault;
end;

procedure TFValoresMantenimiento.dbgViaticoZonaTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if qValorMantenimiento.FieldByName(Columna).Lookup  then
    Result := qValorMantenimiento.FieldByName(Columna).KeyFields
  else
    if qValorMantenimiento.FieldByName(Columna).Calculated then
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
  Encontrado:Boolean;
  var i:integer;
  Sort:String;
begin

  with dbgValorMantenimiento.DataSource.DataSet do
  begin
    try
      dbgValorMantenimiento.Columns[PreviousColumnIndex].title.Font.Style :=
      dbgValorMantenimiento.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
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

     qValorMantenimiento.SQl.Delete(qValorMantenimiento.SQl.Count - 1);
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

     qValorMantenimiento.Sql.Add(Sort);
     qValorMantenimiento.Close;
     qValorMantenimiento.Open;
  end;
end;

procedure TFValoresMantenimiento.FormCreate(Sender: TObject);
begin
  ListaDatos := TStringList.Create;
  ListaDatos.Duplicates := dupIgnore;
  ListaDatos.Sorted := True;

  ListaOrden:=TStringList.Create;
  ListaFormatos:=TStringList.Create;
  qValorMantenimiento.Open;
end;

procedure TFValoresMantenimiento.qValorMantenimientoAfterDelete(DataSet: TDataSet);
begin
  qValorMantenimiento.ApplyUpdates;
  qValorMantenimiento.CommitUpdates;
end;

procedure TFValoresMantenimiento.sbCopiarViaticoClick(Sender: TObject);
var bm:tbookmark;
begin
  ListaFormatos.Clear;
  bm:=qValorMantenimiento.GetBookmark;
  qValorMantenimiento.First;
  while not(qValorMantenimiento.Eof) do
  begin
    ListaFormatos.Add(qValorMantenimientoCODIGOVALOR.AsString);
    qValorMantenimiento.Next;
  end;
  qValorMantenimiento.GotoBookmark(bm);
end;

procedure TFValoresMantenimiento.sbPegarViaticoClick(Sender: TObject);
var   I:Integer;
begin
  try
    for i := 0 to ListaFormatos.Count-1 do
    begin
      qCopiar.Close;
      qCopiar.ParamByName('CODIGOFORMATOMTTO').AsString:=ListaFormatos[i];
      qCopiar.Open;
      if qCopiar.RecordCount>0 then
      begin
      end;
    end;
  except
  end;
end;

procedure TFValoresMantenimiento.qValorMantenimientoAfterInsert(
  DataSet: TDataSet);
var query:tquery;
begin
  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  query.sql.text:='Select max(CODIGOVALOR)from hve_valores';
  query.open;
  DataSet.FieldByName('CODIGOVALOR').AsInteger:= query.Fields[0].asInteger+1;
  query.Free;
end;

end.

