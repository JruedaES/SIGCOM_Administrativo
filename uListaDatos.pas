unit uListaDatos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, ExtCtrls, StdCtrls, Buttons, Db, Mask, DBCtrls, dbTables,
  Grids, DBGrids, RXDBCtrl, Digisoft;

type                                                              
  TfListaDatos = class(TFBase)
    dsDatos: TDataSource;
    Panel2: TPanel;
    Panel1: TPanel;
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    dbgDatos: TRxDBGrid;
    qDatos: TQuery;
    Panel3: TPanel;
    SBFiltrar: TSpeedButton;
    Label1: TLabel;
    EdCodigo: TEdit;
    Label2: TLabel;
    EdCodigo2: TEdit;
    Label3: TLabel;
    EdNombre: TEdit;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure dbgDatosTitleClick(Column: TColumn);
    procedure FormDestroy(Sender: TObject);
    procedure dbgDatosMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
  public
    TeclaShift:Boolean;
    ListaOrden:TStringList;
  end;

var
  fListaDatos: TfListaDatos;

implementation

{$R *.DFM}

procedure TfListaDatos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    if (ActiveControl is TDBLookupComboBox) then
    begin
     if not (ActiveControl as TDBLookupComboBox).ListVisible then
        Perform(wm_NextDLGCTL, 0, 0);
    end
    else
    begin
     Perform(wm_NextDLGCTL, 0, 0);
     key := #0;
    end
end;

procedure TfListaDatos.FormCreate(Sender: TObject);
begin
  inherited;
  qDatos.open;
  ListaOrden := TStringList.Create;
end;

procedure TfListaDatos.dbgDatosTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if qDatos.FieldByName(Columna).Lookup  then
    Result := qDatos.FieldByName(Columna).KeyFields
  else
    if qDatos.FieldByName(Columna).Calculated then
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

  with dbgDatos.DataSource.DataSet do
  begin
    try
      dbgDatos.Columns[PreviousColumnIndex].title.Font.Style :=
      dbgDatos.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
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

     qDatos.SQl.Delete(qDatos.SQl.Count - 1);
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

     qDatos.Sql.Add(Sort);
     qDatos.Close;
     qDatos.Open;
  end;
end;

procedure TfListaDatos.FormDestroy(Sender: TObject);
begin
  inherited;
  ListaOrden.free;
end;

procedure TfListaDatos.dbgDatosMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
begin
  pt:= dbgDatos.MouseCoord(x, y);

  if pt.y=0 then
   begin
      dbgDatos.Cursor:=crHandPoint;
      if Shift = [ssShift] then
          TeclaShift:=True
      else
          TeclaShift:=False;
    end
  else
    dbgDatos.Cursor:=crDefault;
end;

end.
