unit uBuscarEquipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons, ExtCtrls, DB, DBTables,
  Menus, utnZommer, RXDBCtrl;

type
  TfBuscarEquipo = class(TForm)
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtnCerrar: TBitBtn;
    Panel2: TPanel;
    dsEquipo: TDataSource;
    qEquipo: TQuery;
    BitBtn2: TBitBtn;
    PopupMenuOrdenar: TPopupMenu;
    Codigo: TMenuItem;
    Descripcion: TMenuItem;
    Valor: TMenuItem;
    BitBtnFiltrar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    dbgEquipo: TRxDBGrid;
    qEquipoCODIGOEQUIPO: TFloatField;
    qEquipoNOMBREEQUIPO: TStringField;
    qEquipoVALORHORA: TFloatField;
    updEquipo: TUpdateSQL;
    qCodigo: TQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ActualizarListaMaterial;
    procedure LimpiarFiltro;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbgEquipoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgEquipoTitleClick(Column: TColumn);
    procedure qEquipoAfterPost(DataSet: TDataSet);
    procedure qEquipoAfterDelete(DataSet: TDataSet);
    procedure qEquipoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    TeclaShift:Boolean;
    ListaOrden:TStringList;
    Lista, ListaRotulos, ListaDatos, ListaFrom:TStringList;
    { Public declarations }
  end;

var
  fBuscarEquipo: TfBuscarEquipo;
//  ContenidoAct, ContenidoAnt:string;
  ContenidoAct, ContenidoAnt:Integer;
  anterior, actual: TBookmark;
  buf:TKeyboardState;
  sCriterio: string;
function Confirme(Msg: pchar): Boolean;
implementation

uses uFuncionSGD, uBuscaMaterial, uFIMPComunes;

{$R *.DFM}

function Confirme(Msg: pchar): Boolean;
begin
  Result := False;
  if Application.MessageBox(Msg, 'Confirmación', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = MRYES then
     Result := True;
end;

procedure TfBuscarEquipo.FormActivate(Sender: TObject);
begin
  qEquipo.open;
end;


procedure TfBuscarEquipo.FormDestroy(Sender: TObject);
begin
  Lista.Free;
  ListaRotulos.Free;
  ListaDatos.Free;
  ListaFrom.Free;
  application.OnMessage:=nil;
end;

procedure TfBuscarEquipo.ActualizarListaMaterial;
var sCodigo: string;
begin
{  sCodigo := DMOdt.tMaterial.fieldbyName('CodigoMaterial').asstring;
  fBuscarMaterial.qMaterial.Close;
  fBuscarMaterial.qMaterial.Open;
  fBuscarMaterial.qMaterial.locate('CODIGOMATERIAL',sCodigo,[loCaseInsensitive]);}
end;

procedure TfBuscarEquipo.LimpiarFiltro;
var
 nLineasExtra,i: Byte;
begin
 nLineasExtra := qEquipo.SQL.Count-1;
 if nLineasExtra > 0 then
    for i:=1 to nLineasExtra do
     begin
      qEquipo.SQL.Delete(2);
     end;
end;

procedure TfBuscarEquipo.FormCreate(Sender: TObject);
begin
  ListaRotulos:=TStringList.Create;
  ListaDatos:=TStringList.Create;
  ListaFrom:=TStringList.Create;
  ListaOrden:=TStringList.Create;
end;

procedure TfBuscarEquipo.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfBuscarEquipo.dbgEquipoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
begin
  pt:= dbgEquipo.MouseCoord(x, y);

  if pt.y=0 then
   begin
      dbgEquipo.Cursor:=crHandPoint;
      if Shift = [ssShift] then
          TeclaShift:=True
      else
          TeclaShift:=False;
    end
  else
    dbgEquipo.Cursor:=crDefault;
end;

procedure TfBuscarEquipo.dbgEquipoTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if qEquipo.FieldByName(Columna).Lookup  then
    Result := qEquipo.FieldByName(Columna).KeyFields
  else
    if qEquipo.FieldByName(Columna).Calculated then
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
  with dbgEquipo.DataSource.DataSet do
  begin
    try
      dbgEquipo.Columns[PreviousColumnIndex].title.Font.Style :=
      dbgEquipo.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
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
          if (not TeclaShift)   then
          Begin
             ListaOrden.Text:= '';
          end;
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
     qEquipo.SQl.Delete(qEquipo.SQl.Count - 1);
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
     qEquipo.Sql.Add(Sort);
     qEquipo.Close;
     qEquipo.Open;
  end;
end;

procedure TfBuscarEquipo.qEquipoAfterPost(DataSet: TDataSet);
begin
  qEquipo.ApplyUpdates;
  qEquipo.CommitUpdates;
end;

procedure TfBuscarEquipo.qEquipoAfterDelete(DataSet: TDataSet);
begin
  qEquipo.ApplyUpdates;
  qEquipo.CommitUpdates;
end;

procedure TfBuscarEquipo.qEquipoAfterInsert(DataSet: TDataSet);
var codigo:integer;
begin
  qCodigo.close;
  qCodigo.open;
  codigo:=0;
  if qCodigo.fields[0].Asstring<>'' then
    codigo:=qCodigo.fields[0].AsInteger;
  inc(codigo);
  dataset.fieldbyname('CODIGOEQUIPO').AsInteger:=codigo;  
end;

end.
