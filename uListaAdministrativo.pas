unit uListaAdministrativo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls;

type
  TfListaAdministrativo = class(TFdSgdListaBase)
    qListaAdministrativo: TQuery;
    dbgListaAdministrativo: TRxDBGrid;
    qListaAdministrativoCODIGOADMINISTRATIVO: TFloatField;
    qListaAdministrativoNOMBREADMINISTRATIVO: TStringField;
    qListaAdministrativoNOMBRECATEGORIA: TStringField;
    procedure SBFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgListaAdministrativoTitleClick(Column: TColumn);
    procedure dbgListaAdministrativoMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    Lista, ListaFrom: TStringList;
    TeclaShift:Boolean;
    ListaOrden:TStringList;
    procedure Filtrar;
    procedure LimpiarFiltro;    
  end;

var
  fListaAdministrativo: TfListaAdministrativo;

implementation

uses uFIMPComunes;

{$R *.DFM}

procedure TfListaAdministrativo.SBFiltrarClick(Sender: TObject);
begin
  Filtrar;
  inherited;
end;

procedure TfListaAdministrativo.Filtrar;
begin
  Lista := GetQueryFiltroAdministrativo(ListaRotulos, ListaDatos, ListaFrom);
  if Lista <> nil then
  begin
    qListaAdministrativo.Close;
    if qListaAdministrativo.sql.Count > 3 then
      LimpiarFiltro;
    qListaAdministrativo.SQL.Add(Lista.Text);
    qListaAdministrativo.Open;
    if qListaAdministrativo.RecordCount > 0 then
      lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + IntToStr(qListaAdministrativo.RecordCount) + ' Registros Encontrados >>'
    else
      lFiltroDatos.Caption := ' << FILTRO DE DATOS >> ';
  end;
end;

procedure TfListaAdministrativo.LimpiarFiltro;
var
  nLineasExtra, I: Byte;
begin
  nLineasExtra := qListaAdministrativo.SQL.Count - 3;
  if nLineasExtra > 0 then
    for I := 1 to nLineasExtra do
    begin
      qListaAdministrativo.SQL.Delete(3);
    end;
end;

procedure TfListaAdministrativo.FormCreate(Sender: TObject);
begin
  inherited;
  ListaFrom := TStringList.Create;
  ListaOrden := TStringList.Create;  
end;

procedure TfListaAdministrativo.dbgListaAdministrativoTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if qListaAdministrativo.FieldByName(Columna).Lookup  then
    Result := qListaAdministrativo.FieldByName(Columna).KeyFields
  else
    if qListaAdministrativo.FieldByName(Columna).Calculated then
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
  i,j:Integer;
  Encontrado:Boolean;
  Sort:String;
begin

  with dbgListaAdministrativo.DataSource.DataSet do
  begin
    try
      dbgListaAdministrativo.Columns[PreviousColumnIndex].title.Font.Style :=
      dbgListaAdministrativo.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
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

     qListaAdministrativo.SQl.Delete(qListaAdministrativo.SQl.Count - 1);
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
     qListaAdministrativo.Sql.Add(Sort);
     //qListaAdministrativo.Sql.SaveToFile('C:\b.txt');
     qListaAdministrativo.Close;
     qListaAdministrativo.Open;
  end;
end;

procedure TfListaAdministrativo.dbgListaAdministrativoMouseMove(
  Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
begin
  pt:= dbgListaAdministrativo.MouseCoord(x, y);

  if pt.y=0 then
   begin
      dbgListaAdministrativo.Cursor:=crHandPoint;
      if Shift = [ssShift] then
          TeclaShift:=True
      else
          TeclaShift:=False;
    end
  else
    dbgListaAdministrativo.Cursor:=crDefault;
end;

end.
