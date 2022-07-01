unit uIndiceDificultad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, ExtCtrls,
  DBCtrls, Menus, utMenuArbol;

type
  TFIndiceDificultad = class(TForm)
    Panel2: TPanel;
    dbgTipoDano: TRxDBGrid;
    qIndiceDificultad: TQuery;
    dsIndiceDificultad: TDataSource;
    DBNavigator1: TDBNavigator;
    UpdIndiceDificultad: TUpdateSQL;
    qIndiceDificultadCODIGOMUNICIPIODIFICULTAD: TFloatField;
    qIndiceDificultadCODIGOMUNICIPIO: TFloatField;
    qIndiceDificultadCONSECUTIVO: TFloatField;
    qIndiceDificultadINDICEDIFICULTAD: TFloatField;
    qIndiceDificultadDESCRIPCION: TStringField;
    procedure qIndiceDificultadAfterPost(DataSet: TDataSet);
    procedure qIndiceDificultadUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qIndiceDificultadAfterInsert(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbgTipoDanoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgTipoDanoTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FIndiceDificultad: TFIndiceDificultad;
  TeclaShift:Boolean;
  ListaOrden:TStringList;

implementation

{$R *.DFM}

procedure TFIndiceDificultad.qIndiceDificultadAfterPost(DataSet: TDataSet);
begin
  qTipoDano.ApplyUpdates;
  qTipoDano.CommitUpdates;
end;

procedure TFIndiceDificultad.qIndiceDificultadUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  try
  finally
  end;
end;


procedure TFIndiceDificultad.qIndiceDificultadAfterInsert(DataSet: TDataSet);
var qDatos:TQuery;
begin
  qDatos:=TQuery.Create(Application);
  qDatos.DatabaseName:='BaseDato';
  qDatos.Close;
  qDatos.SQL.Text:='SELECT MAX(CODIGOTIPODANO) FROM TIPODANO';
  qDatos.Open;
  DataSet.FieldByName('CODIGOTIPODANO').AsFloat:=qDatos.Fields[0].AsFloat + 1;
  qDatos.Free;
end;

procedure TFIndiceDificultad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TFIndiceDificultad.dbgTipoDanoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
begin
  pt:= dbgTipoDano.MouseCoord(x, y);

  if pt.y=0 then
   begin
      dbgTipoDano.Cursor:=crHandPoint;
      if Shift = [ssShift] then
          TeclaShift:=True
      else
          TeclaShift:=False;
    end
  else
    dbgTipoDano.Cursor:=crDefault;
end;

procedure TFIndiceDificultad.dbgTipoDanoTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}
var
  ListaTemp:TStringList;
  i,j:Integer;
  Encontrado:Boolean;
  Sort:String;
begin

  with dbgTipoDano.DataSource.DataSet do
  begin
    try
      dbgTipoDano.Columns[PreviousColumnIndex].title.Font.Style :=
      dbgTipoDano.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
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
             if ListaTemp[0]=Column.Field.FieldName then
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
             if ListaTemp[0]=Column.Field.FieldName then
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
           ListaOrden.Add(Column.Field.FieldName+','+'ASC');
        ListaTemp.Free;
     end;

     if (ListaOrden.Count = 0) then
        ListaOrden.Add(Column.Field.FieldName+','+'ASC');

     qTipoDano.SQl.Delete(qTipoDano.SQl.Count - 1);
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

     qTipoDano.Sql.Add(Sort);
     qTipoDano.Close;
     qTipoDano.Open;
  end;
end;

procedure TFIndiceDificultad.FormCreate(Sender: TObject);
begin
  ListaOrden:=TStringList.Create;
end;

procedure TFIndiceDificultad.FormDestroy(Sender: TObject);
begin
  ListaOrden.Free;
end;

end.
