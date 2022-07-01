unit uSeleccionarPlanillaExtras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, ExtCtrls, StdCtrls, Buttons, Db, Mask, DBCtrls, dbTables,
  Grids, DBGrids, RXDBCtrl, Digisoft, ComCtrls;

type
  TfSeleccionarPlanillaExtras = class(TFBase)
    Panel2: TPanel;
    Panel1: TPanel;
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    Panel3: TPanel;
    SBFiltrar: TSpeedButton;
    Label1: TLabel;
    EdCodigo: TEdit;
    EdCodigo2: TEdit;
    Label3: TLabel;
    EdNombre: TEdit;
    qPlanilla: TQuery;
    dsPlanilla: TDataSource;
    dbgDatos: TRxDBGrid;
    SpeedButton1: TSpeedButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure SBFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbgDatosMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgDatosTitleClick(Column: TColumn);
  private
    { Private declarations }
  public
    ListaOrden :tstringlist;
    TeclaShift:Boolean;
  end;

var
  fSeleccionarPlanillaExtras: TfSeleccionarPlanillaExtras;

implementation

uses uComunesAdministrativo, uFuncionSGD;

{$R *.DFM}

procedure TfSeleccionarPlanillaExtras.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfSeleccionarPlanillaExtras.SBFiltrarClick(Sender: TObject);
var
 i:integer;
begin
  qPlanilla.close;
  for i :=0  to qPlanilla.sql.count-16 do
  begin
    qPlanilla.SQL.Delete(5);
  end;
  i:=5;
  if EdCodigo.Text <> '' then
  begin
   qPlanilla.SQL.Insert(i,'AND E.CODIGOEMPLEADO= '+EdCodigo.Text);
   inc(i);
  end;
  if EdCodigo2.Text <> '' then
  begin
     qPlanilla.SQL.Insert(i,'AND E.CODIGOADMINISTRATIVO ='+EdCodigo2.Text);
     inc(i);
  end;
  if EdNombre.Text <> '' then
  begin
    qPlanilla.SQL.Insert(i,'AND E.NOMBREEMPLEADO LIKE ''%'+EdNombre.Text+'%''');
  end;
  qPlanilla.Open;
end;

procedure TfSeleccionarPlanillaExtras.FormCreate(Sender: TObject);
begin
  qPlanilla.open;
  ListaOrden :=tstringlist.create;
end;

procedure TfSeleccionarPlanillaExtras.SpeedButton1Click(Sender: TObject);
var cia:double;
begin
  cia:= CapturarCIA;
  if cia>0 then EdCodigo2.Text:=floattostr(cia);
end;

procedure TfSeleccionarPlanillaExtras.dbgDatosMouseMove(Sender: TObject;
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

procedure TfSeleccionarPlanillaExtras.dbgDatosTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if qPlanilla.FieldByName(Columna).Lookup  then
    Result := qPlanilla.FieldByName(Columna).KeyFields
  else
    if qPlanilla.FieldByName(Columna).Calculated then
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

  with dbgDatos.DataSource.DataSet do
  begin
    try
      dbgDatos.Columns[PreviousColumnIndex].title.Font.Style :=
      dbgDatos.Columns[PreviousColumnIndex].title.Font.Style - [fsUnderline];
    except
    end;
    Column.title.Font.Style :=
    Column.title.Font.Style + [fsUnderline];

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

     qPlanilla.SQl.Delete(qPlanilla.SQl.Count - 1);
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

     qPlanilla.Sql.Add(Sort);
     qPlanilla.Close;
     qPlanilla.Open;
  end;
end;

end.
