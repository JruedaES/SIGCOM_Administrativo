unit uListaReportesODT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl, Db, DBTables,
  DBCtrls;

type
  TfListaReportesODT = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    qListaReporte: TQuery;
    DataSource1: TDataSource;
    DBGrid1: TRxDBGrid;
    Panel4: TPanel;
    bbCancelar: TBitBtn;
    bbAceptar: TBitBtn;
    qListaReporteCODIGOREPORTE: TFloatField;
    qListaReporteTIPOINFORMANTE: TStringField;
    qListaReporteCODIGOESTADOREPORTE: TStringField;
    qListaReporteNOMBREESTADOREPORTE: TStringField;
    qListaReporteDIRECCIONDANO: TStringField;
    qListaReporteNOMBRECLASEREPORTE: TStringField;
    qListaReporteNOMBRETIPOREPORTE: TStringField;
    qListaReporteNOMBREINFORMANTE: TStringField;
    qListaReporteFECHAHORADICTADO: TDateTimeField;
    qListaReporteFECHAHORALLEGADA: TDateTimeField;
    qListaReporteFECHAHORAATENCION: TDateTimeField;
    qListaReporteCODIGOADMINISTRATIVO: TFloatField;
    qListaReporteNOMBREGRUPOTRABAJO: TStringField;
    DBMemo1: TDBMemo;
    Panel3: TPanel;
    qListaReporteDESCRIPCION: TMemoField;
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TeclaShift:Boolean;
    ListaOrden:TStringList;
  end;

var
  fListaReportesODT: TfListaReportesODT;

implementation

uses uReporte;

{$R *.DFM}

procedure TfListaReportesODT.DBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
begin
  pt:= DBGrid1.MouseCoord(x, y);

  if pt.y=0 then
   begin
      DBGrid1.Cursor:=crHandPoint;
      if Shift = [ssShift] then
          TeclaShift:=True
      else
          TeclaShift:=False;
    end
  else
    DBGrid1.Cursor:=crDefault;

end;

procedure TfListaReportesODT.FormCreate(Sender: TObject);
begin
  ListaOrden:=TStringList.Create;
end;

procedure TfListaReportesODT.DBGrid1TitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}
var
  ListaTemp:TStringList;
  i:Integer;
  Encontrado:Boolean;
  Sort:String;
begin

  with DBGrid1.DataSource.DataSet do
  begin
    try
      DBGrid1.Columns[PreviousColumnIndex].title.Font.Style :=
      DBGrid1.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
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

     qListaReporte.SQl.Delete(qListaReporte.SQl.Count - 1);
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

     qListaReporte.Sql.Add(Sort);
     qListaReporte.Close;
     qListaReporte.Open;
  end;


end;

procedure TfListaReportesODT.DBGrid1DblClick(Sender: TObject);
begin
 if not (Assigned(Application.FindComponent('fReporte') as TForm)) then
  fReporte:=TfReporte.Create(Application);
  fReporte.qReporte.Active:=False;
  fReporte.qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE='+
                              qListaReporteCODIGOREPORTE.AsString;
  fReporte.qReporte.Active:=True;
  fReporte.qReporte.Edit;
  fReporte.FormStyle:=fsNormal;
  fReporte.ShowModal;
  fReporte.Free;
end;

end.
