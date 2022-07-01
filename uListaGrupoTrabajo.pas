unit uListaGrupoTrabajo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls;

type
  TfListaGrupoTrabajo = class(TFdSgdListaBase)
    qListaGrupoTrabajo: TQuery;
    dbgGrupoTrabajo: TRxDBGrid;
    Panel4: TPanel;
    DBText1: TDBText;
    Label1: TLabel;
    sbInsertar: TSpeedButton;
    sbEditar: TSpeedButton;
    procedure sbInsertarClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure dbgGrupoTrabajoDblClick(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgGrupoTrabajoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgGrupoTrabajoTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    TeclaShift:Boolean;  
    Lista, ListaFrom: TStringList;
    ListaOrden:TStringList;
    procedure Filtrar;
    procedure LimpiarFiltro;    
  end;

var
  fListaGrupoTrabajo: TfListaGrupoTrabajo;

implementation

uses uGrupoTrabajo, uFIMPComunes;

{$R *.DFM}

procedure TfListaGrupoTrabajo.sbInsertarClick(Sender: TObject);
begin
  inherited;
  try
    fGrupoTrabajo:=TfGrupoTrabajo.Create(Application);
    with fGrupoTrabajo do
    begin
       qGrupoTrabajo.Close;
       qGrupoTrabajo.ParamByName('CODIGOADMINISTRATIVO').AsString:='-99999';
       qGrupoTrabajo.ParamByName('CODIGOGRUPOTRABAJO').AsString:='-99999';
       qGrupoTrabajo.Open;
       qGrupoTrabajo.Insert;

    if ShowModal=MrOK then
    begin
       qListaGrupoTrabajo.Close;
       qListaGrupoTrabajo.Open;
       qListaGrupoTrabajo.Locate('CODIGOADMINISTRATIVO;CODIGOGRUPOTRABAJO',
       VarArrayOf([qGrupoTrabajoCODIGOADMINISTRATIVO.AsString,qGrupoTrabajoCODIGOGRUPOTRABAJO.AsString]),[]);
    end;
    end;
  finally
    fGrupoTrabajo.Free;
    fGrupoTrabajo:=nil;
  end;
end;

procedure TfListaGrupoTrabajo.sbEditarClick(Sender: TObject);
begin
  inherited;
    try
    fGrupoTrabajo:=TfGrupoTrabajo.Create(Application);
    with fGrupoTrabajo do
    begin
       qGrupoTrabajo.Close;
       qGrupoTrabajo.ParamByName('CODIGOADMINISTRATIVO').AsString:=
                     qListaGrupoTrabajo.FieldByName('CODIGOADMINISTRATIVO').AsString;
       qGrupoTrabajo.ParamByName('CODIGOGRUPOTRABAJO').AsString:=
                     qListaGrupoTrabajo.FieldByName('CODIGOGRUPOTRABAJO').AsString;
       qGrupoTrabajo.Open;
       qGrupoTrabajo.Edit;
    if ShowModal=MrOK then
    begin
       qListaGrupoTrabajo.Close;
       qListaGrupoTrabajo.Open;
       qListaGrupoTrabajo.Locate('CODIGOADMINISTRATIVO;CODIGOGRUPOTRABAJO',
       VarArrayOf([qGrupoTrabajoCODIGOADMINISTRATIVO.AsString,qGrupoTrabajoCODIGOGRUPOTRABAJO.AsString]),[]);
    end;
    end;
  finally
    fGrupoTrabajo.Free;
    fGrupoTrabajo:=nil;
  end;
end;

procedure TfListaGrupoTrabajo.dbgGrupoTrabajoDblClick(Sender: TObject);
begin
  inherited;
  if qListaGrupoTrabajo.FieldByName('CODIGOADMINISTRATIVO').AsString<>'' then
     sbEditarClick(nil);
end;

procedure TfListaGrupoTrabajo.SBFiltrarClick(Sender: TObject);
begin
  Filtrar;
  inherited;  
end;

procedure TfListaGrupoTrabajo.Filtrar;
var
  CadFrom: String;
begin
  Lista := GetQueryFiltroGrupoTrabajo(ListaRotulos, ListaDatos, ListaFrom);
  if Lista <> nil then
  begin
    qListaGrupoTrabajo.Close;
    if qListaGrupoTrabajo.sql.Count > 6 then
      LimpiarFiltro;
    qListaGrupoTrabajo.SQL.insert(5,Lista.Text);
    qListaGrupoTrabajo.Open;
    if qListaGrupoTrabajo.RecordCount > 0 then
      lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + IntToStr(qListaGrupoTrabajo.RecordCount) + ' Registros Encontrados >>'
    else
      lFiltroDatos.Caption := ' << FILTRO DE DATOS >> ';
  end;
end;

procedure TfListaGrupoTrabajo.LimpiarFiltro;
var
  nLineasExtra, I: Byte;
begin
  nLineasExtra := qListaGrupoTrabajo.SQL.Count - 6;
  if nLineasExtra > 0 then
    for I := 1 to nLineasExtra do
    begin
      qListaGrupoTrabajo.SQL.Delete(5);
    end;
end;

procedure TfListaGrupoTrabajo.FormCreate(Sender: TObject);
begin
  inherited;
  ListaFrom := TStringList.Create;
  ListaOrden := TStringList.Create;
end;

procedure TfListaGrupoTrabajo.dbgGrupoTrabajoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
begin
  pt:= dbgGrupoTrabajo.MouseCoord(x, y);

  if pt.y=0 then
   begin
      dbgGrupoTrabajo.Cursor:=crHandPoint;
      if Shift = [ssShift] then
          TeclaShift:=True
      else
          TeclaShift:=False;
    end
  else
    dbgGrupoTrabajo.Cursor:=crDefault;
end;

procedure TfListaGrupoTrabajo.dbgGrupoTrabajoTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if qListaGrupoTrabajo.FieldByName(Columna).Lookup  then
    Result := qListaGrupoTrabajo.FieldByName(Columna).KeyFields
  else
    if qListaGrupoTrabajo.FieldByName(Columna).Calculated then
    begin
      Result := '1';
      raise exception.create('Imposible ordenar por este campo calculado.');
    end
    else
      Result := Columna;
end;

var
  ListaTemp:TStringList;
  i,j:Integer;
  Encontrado:Boolean;
  Sort:String;
begin
  with dbgGrupoTrabajo.DataSource.DataSet do
  begin
    try
      dbgGrupoTrabajo.Columns[PreviousColumnIndex].title.Font.Style :=
      dbgGrupoTrabajo.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
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

     qListaGrupoTrabajo.SQl.Delete(qListaGrupoTrabajo.SQl.Count - 1);
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

     qListaGrupoTrabajo.Sql.Add(Sort);
     qListaGrupoTrabajo.Close;
     qListaGrupoTrabajo.Open;
  end;
end;

end.
