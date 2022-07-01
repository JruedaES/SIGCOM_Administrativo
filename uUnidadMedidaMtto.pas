unit uUnidadMedidaMtto;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Grids, DBGrids, RXDBCtrl, Digisoft, StdCtrls, ExtCtrls,
  Buttons, UtdNavigator, DBCtrls;

type
  TFUnidadMedidaMtto = class(TForm)
    Panel1: TPanel;
    dbNavigator1: TdNavigator;
    Panel5: TPanel;
    SBFiltrar: TSpeedButton;
    SBOrdenar: TSpeedButton;
    Bevel2: TBevel;
    Bevel3: TBevel;
    sbExportar: TSpeedButton;
    Panel3: TPanel;
    dsUnidadMedidaMtto: TDDataSource;
    qUnidadMedidaMtto: TQuery;
    updUnidadMedidaMtto: TUpdateSQL;
    sbCerrar: TSpeedButton;
    sbCopiarViatico: TSpeedButton;
    sbPegarViatico: TSpeedButton;
    dbgUnidad: TRxDBGrid;
    qCopiar: TQuery;
    Query1: TQuery;
    Query2: TQuery;
    Query3: TQuery;
    Query4: TQuery;
    qUnidadMedidaMttoNOMBREUNIDADMEDIDAMTTO: TStringField;
    qUnidadMedidaMttoCODIGOUNIDADMEDIDAMTTO: TFloatField;
    procedure qUnidadMedidaMttoAfterPost(DataSet: TDataSet);
    procedure sbCerrarClick(Sender: TObject);
    procedure SBOrdenarClick(Sender: TObject);
    procedure dbgViaticoZonaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgViaticoZonaTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure qUnidadMedidaMttoAfterDelete(DataSet: TDataSet);
    procedure sbCopiarViaticoClick(Sender: TObject);
    procedure sbPegarViaticoClick(Sender: TObject);
    procedure qUnidadMedidaMttoAfterInsert(DataSet: TDataSet);
  private
  public
    TeclaShift:boolean;
    ListaDatos,ListaOrden,ListaFormatos:TStringList;
    procedure Filtrar(filtro:string);
    procedure LimpiarFiltro;
  end;

var
  FUnidadMedidaMtto: TFUnidadMedidaMtto;

implementation


{$R *.DFM}


procedure TFUnidadMedidaMtto.filtrar(filtro:string);
begin
  qUnidadMedidaMtto.Close;
  if qUnidadMedidaMtto.sql.Count > 2 then
    LimpiarFiltro;
  qUnidadMedidaMtto.SQL.insert(1,filtro);
  qUnidadMedidaMtto.Open;
end;

procedure TFUnidadMedidaMtto.LimpiarFiltro;
var
  nLineasExtra, I: Byte;
begin
  nLineasExtra := qUnidadMedidaMtto.SQL.Count - 2;
  if nLineasExtra > 0 then
    for I := 1 to nLineasExtra do
    begin
      qUnidadMedidaMtto.SQL.Delete(1);
    end;
end;

procedure TFUnidadMedidaMtto.qUnidadMedidaMttoAfterPost(DataSet: TDataSet);
begin
  qUnidadMedidaMtto.ApplyUpdates;
  qUnidadMedidaMtto.CommitUpdates;
end;


procedure TFUnidadMedidaMtto.sbCerrarClick(Sender: TObject);
begin
  close;
end;

procedure TFUnidadMedidaMtto.SBOrdenarClick(Sender: TObject);
begin
  qUnidadMedidaMtto.close;
  qUnidadMedidaMtto.open;
end;

procedure TFUnidadMedidaMtto.dbgViaticoZonaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
begin
  pt:= dbgUnidad.MouseCoord(x, y);

  if pt.y=0 then
   begin
      dbgUnidad.Cursor:=crHandPoint;
      if Shift = [ssShift] then
          TeclaShift:=True
      else
          TeclaShift:=False;
    end
  else
    dbgUnidad.Cursor:=crDefault;
end;

procedure TFUnidadMedidaMtto.dbgViaticoZonaTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if qUnidadMedidaMtto.FieldByName(Columna).Lookup  then
    Result := qUnidadMedidaMtto.FieldByName(Columna).KeyFields
  else
    if qUnidadMedidaMtto.FieldByName(Columna).Calculated then
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

  with dbgUnidad.DataSource.DataSet do
  begin
    try
      dbgUnidad.Columns[PreviousColumnIndex].title.Font.Style :=
      dbgUnidad.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
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

     qUnidadMedidaMtto.SQl.Delete(qUnidadMedidaMtto.SQl.Count - 1);
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

     qUnidadMedidaMtto.Sql.Add(Sort);
     qUnidadMedidaMtto.Close;
     qUnidadMedidaMtto.Open;
  end;
end;

procedure TFUnidadMedidaMtto.FormCreate(Sender: TObject);
begin
  ListaDatos := TStringList.Create;
  ListaDatos.Duplicates := dupIgnore;
  ListaDatos.Sorted := True;

  ListaOrden:=TStringList.Create;
  ListaFormatos:=TStringList.Create;
  qUnidadMedidaMtto.Open;
end;

procedure TFUnidadMedidaMtto.qUnidadMedidaMttoAfterDelete(DataSet: TDataSet);
begin
  qUnidadMedidaMtto.ApplyUpdates;
  qUnidadMedidaMtto.CommitUpdates;
end;

procedure TFUnidadMedidaMtto.sbCopiarViaticoClick(Sender: TObject);
var bm:tbookmark;
begin
  ListaFormatos.Clear;
  bm:=qUnidadMedidaMtto.GetBookmark;
  qUnidadMedidaMtto.First;
  while not(qUnidadMedidaMtto.Eof) do
  begin
    ListaFormatos.Add(qUnidadMedidaMttoCODIGOUNIDADMEDIDAMTTO.AsString);
    qUnidadMedidaMtto.Next;
  end;
  qUnidadMedidaMtto.GotoBookmark(bm);
end;

procedure TFUnidadMedidaMtto.sbPegarViaticoClick(Sender: TObject);
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

procedure TFUnidadMedidaMtto.qUnidadMedidaMttoAfterInsert(
  DataSet: TDataSet);
var query:tquery;
begin
  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  query.sql.text:='Select max(CODIGOUNIDADMEDIDAMTTO)from hve_unidadmedidamtto';
  query.open;
  DataSet.FieldByName('CODIGOUNIDADMEDIDAMTTO').AsInteger:= query.Fields[0].asInteger+1;
  query.Free;
end;




end.

