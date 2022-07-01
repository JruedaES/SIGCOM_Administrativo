unit uBuscarActividad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons, ExtCtrls, DB, DBTables,
  Menus, utnZommer, RXDBCtrl;

type
  TfBuscarActividad = class(TForm)
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    BitBtnCerrar: TBitBtn;
    Panel2: TPanel;
    BBAsignar: TBitBtn;
    dsUnidad: TDataSource;
    tUnidad: TTable;
    Bevel1: TBevel;
    sbFiltrar: TSpeedButton;
    sbBuscar: TSpeedButton;
    Bevel2: TBevel;
    Panel4: TPanel;
    Shape1: TShape;
    Image1: TImage;
    Label7: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label14: TLabel;
    DBText6: TDBText;
    DBText7: TDBText;
    DBText13: TDBText;
    DBText14: TDBText;
    Label15: TLabel;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape8: TShape;
    Shape13: TShape;
    Panel5: TPanel;
    Shape2: TShape;
    Label6: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Shape6: TShape;
    Shape7: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText9: TDBText;
    DBText12: TDBText;
    Label18: TLabel;
    Shape12: TShape;
    qActividad: TQuery;
    qActividadMATERIAL: TFloatField;
    qActividadMANOOBRA: TFloatField;
    qActividadTRANSPORTE: TFloatField;
    qActividadEQUIPO: TFloatField;
    qActividadNombreActividad: TStringField;
    qActividadNOMBREESTRUCTURA: TStringField;
    qActividadNOMBRETIPOACTIVIDAD: TStringField;
    qActividadCODIGOTIPOACTIVIDAD: TStringField;
    qActividadNOMBREUSO: TStringField;
    qActividadNOMBREUNIDAD: TStringField;
    qActividadVALORTOTAL: TFloatField;
    dsqActividad: TDataSource;
    Zommer1: TZommer;
    qActividadCODIGOUSO: TStringField;
    qActividadCODIGOESTRUCTURA: TFloatField;
    qActividadREFERENCIA: TStringField;
    qActividadCODIGOUNIDAD: TStringField;
    qActividadNombre: TStringField;
    qActividadDESCRIPCION: TMemoField;
    dbGridActividad: TRxDBGrid;
    lFiltroDatos: TLabel;
    qActividadCODIGOACTIVIDAD: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure clic(var Msg: TMsg; var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure sbFiltrarClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure qActividadAfterScroll(DataSet: TDataSet);
    procedure qActividadCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dbGridActividadTitleClick(Column: TColumn);
    procedure dbGridActividadMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);

  private
    Lista,ListaFrom : TStringList;
    TeclaShift:Boolean;      
    procedure Filtrar;
    procedure Limpiarfiltro;
  public
    ListaRotulos, ListaDatos : TStringList;
    ListaOrden:TStringList;
  end;

var
  fBuscarActividad: TfBuscarActividad;
//  ContenidoAct, ContenidoAnt:string;
    ContenidoAct, ContenidoAnt:Integer;
  anterior, actual: TBookmark;
  buf:TKeyboardState;
    sCriterio: string;
function Confirme(Msg: pchar): Boolean;
implementation

uses uFuncionSGD, uFIMPComunes;

{$R *.DFM}

function Confirme(Msg: pchar): Boolean;
begin
  Result := False;
  if Application.MessageBox(Msg, 'Confirmación', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = MRYES then
     Result := True;
end;


procedure TfBuscarActividad.FormActivate(Sender: TObject);
begin
  anterior:=dbGridActividad.DataSource.Dataset.getbookmark;
  actual:=dbGridActividad.DataSource.Dataset.getbookmark;
  ContenidoAct:=0;
  ContenidoAnt:=0;
  application.OnMessage:=Clic;
  qActividad.open;
end;

procedure TfBuscarActividad.FormShow(Sender: TObject);
begin
  dbGridActividad.Setfocus;
  Filtrar;
end;

procedure TfBuscarActividad.clic(var Msg: TMsg; var Handled: Boolean);
var //StrTem:string;
    StrTem:Integer;
   procedure MarqueUna;
   begin
   GetKeyboardState(buf);
   buf[VK_Shift]:=129;
   SetKeyboardState(buf);
   dbGridActividad.perform(WM_KEYDOWN, VK_DOWN, 0);
   buf[VK_Shift]:=0;
   SetKeyboardState(buf);
   end;
begin
  if (Msg.message=WM_LBUTTONUP) and (Msg.hwnd=DBGridActividad.handle) then
     begin
     ContenidoAnt:=ContenidoAct;
     ContenidoAct:=DBGridActividad.DataSource.Dataset.fieldbyname('CodigoActividad').AsInteger;
     anterior:=actual;
     actual:=DBGridActividad.DataSource.Dataset.getbookmark;
     if (Msg.wParam=MK_SHIFT) then
        begin
        if ContenidoAct<ContenidoAnt then
           begin
           StrTem:=ContenidoAct;
           ContenidoAct:=ContenidoAnt;
           ContenidoAnt:=StrTem;
           DBGridActividad.DataSource.Dataset.GotoBookmark(actual);
           end
        else DBGridActividad.DataSource.Dataset.GotoBookmark(anterior);
        while not(DBGridActividad.DataSource.Dataset.eof) and
          (ContenidoAct<>DBGridActividad.DataSource.Dataset.fieldbyname('CodigoActividad').AsInteger)
          do marqueuna;
        end;
     end;
  Handled:=false;
end;

procedure TfBuscarActividad.FormDestroy(Sender: TObject);
begin
  application.OnMessage:=nil;
end;

procedure TfBuscarActividad.sbFiltrarClick(Sender: TObject);
begin
  Filtrar;
end;


procedure TfBuscarActividad.Image1Click(Sender: TObject);
begin
 Zommer1.ShowImage(Image1.Picture);
end;

procedure TfBuscarActividad.qActividadAfterScroll(DataSet: TDataSet);
begin
  try
    Image1.Picture := nil;
    Image1.Picture.LoadFromFile(GetWorkDirectory+'ImagenesEstructura\'+qActividad.FieldByName('REFERENCIA').AsString+'.bmp');
    Zommer1.Caption := qActividad.FieldByName('NombreEstructura').AsString;
  except
  end;
end;

procedure TfBuscarActividad.qActividadCalcFields(DataSet: TDataSet);
begin
   if qActividadDESCRIPCION.asstring='' then
   begin
     qActividad.FieldByName('NombreActividad').AsString := qActividad.FieldByName('NombreTipoActividad').AsString+
     ' de '+qActividad.FieldByName('NombreEstructura').AsString;   end
   else
     qActividad.FieldByName('NombreActividad').AsString := qActividadDESCRIPCION.asstring;
end;

procedure TfBuscarActividad.Filtrar;
begin
  Lista := GetQueryFiltroActividad(ListaRotulos, ListaDatos, ListaFrom);
  If Lista <> Nil then
   begin
     qActividad.Close;
     If qActividad.sql.Count > 7 then LimpiarFiltro;
     qActividad.SQl.Insert(6,Lista.Text);
     //qActividad.SQL.SaveToFile('C:\sqlListaActividad.txt');
     qActividad.Open;
     if qActividad.Recordcount = 1 then
       lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + '1  Registro Encontrado >>'
     else
       lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + inttostr(qActividad.Recordcount)+' Registros Encontrados >>'

   end;
end;

procedure TfBuscarActividad.FormCreate(Sender: TObject);
begin
  ListaFrom := TStringList.Create;
  ListaOrden := TStringList.Create;
  ListaDatos:=TStringList.Create;
  ListaRotulos:=TStringList.Create;
end;

procedure TfBuscarActividad.LimpiarFiltro;
var
 nLineasExtra,i: Byte;
begin
 nLineasExtra := qActividad.SQL.Count-7;
 if nLineasExtra > 0 then
    for i:=1 to nLineasExtra do
     begin
      qActividad.SQL.Delete(6);
     end;
end;

procedure TfBuscarActividad.dbGridActividadTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if qActividad.FieldByName(Columna).Lookup  then
    Result := qActividad.FieldByName(Columna).KeyFields
  else
    if qActividad.FieldByName(Columna).Calculated then
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

  with DBGridActividad.DataSource.DataSet do
  begin
    try
      DBGridActividad.Columns[PreviousColumnIndex].title.Font.Style :=
      DBGridActividad.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
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

     qActividad.SQl.Delete(qActividad.SQl.Count - 1);
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

     qActividad.Sql.Add(Sort);
     //qActividad.Sql.SaveToFile('C:\b.txt');
     qActividad.Close;
     qActividad.Open;
  end;
end;

procedure TfBuscarActividad.dbGridActividadMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
begin
  pt:= dbGridActividad.MouseCoord(x, y);

  if pt.y=0 then
   begin
      dbGridActividad.Cursor:=crHandPoint;
      if Shift = [ssShift] then
          TeclaShift:=True
      else
          TeclaShift:=False;
    end
  else
    dbGridActividad.Cursor:=crDefault;

end;

end.
