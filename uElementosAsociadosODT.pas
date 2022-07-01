unit uElementosAsociadosODT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, RXDBCtrl, ExtCtrls, StdCtrls, DBCtrls,
  Buttons, ToolWin, ComCtrls, Menus;

type
  TfElementosAsociadosODT = class(TForm)
    Panel1: TPanel;
    qElementos: TQuery;
    dsElementos: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    SBFiltroCarografico: TSpeedButton;
    SBBuscaElementoCartografia: TSpeedButton;
    sbVistaLateral: TSpeedButton;
    pmVistaLateral: TPopupMenu;
    ElementoSeleccionado1: TMenuItem;
    TodoslosElementos1: TMenuItem;
    tElementos: TTable;
    RxDBGrid2: TRxDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBBuscaElementoCartografiaClick(Sender: TObject);
    procedure SBFiltroCarograficoClick(Sender: TObject);
    procedure sbVistaLateralClick(Sender: TObject);
    procedure ElementoSeleccionado1Click(Sender: TObject);
    procedure TodoslosElementos1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    ListaTablas: TStringList;
    ListaKey: TStringList;
  public
    { Public declarations }
    FCodigoODT: Double;
    FConsecutivo: Integer;
    function ObtenerApoyo:string;
    procedure CrearTabla;
    procedure LlenarTabla(CodigoOdt:Double; Consecutivo:Integer);
  end;

var
  fElementosAsociadosODT: TfElementosAsociadosODT;

implementation

uses uFIMPComunes, uFuncionSGD;

{$R *.DFM}

procedure TfElementosAsociadosODT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
end;

function TfElementosAsociadosODT.ObtenerApoyo: string;
var qDatos:TQuery;

begin
 Result := '';
 if tElementos.FieldByName('CODIGOAPOYO').AsString <> '' then
   Result := tElementos.FieldByName('CODIGOAPOYO').AsString;

 
{   qDatos:=TQuery.Create(Application);
   qDatos.DatabaseName:='BaseDato';
   Result:='';
   case qElementos.FieldByName('CODIGOTIPOELEMENTO').AsInteger of
      1,2,3,4:Result:=qElementos.FieldByName('CLAVE1').AsString;
      5:qDatos.SQL.Text:='SELECT CODIGOAPOYO1 FROM TRAMOMT WHERE CODIGOTRAMOMT='+qElementos.FieldByName('CLAVE1').AsString;
      6:qDatos.SQL.Text:='SELECT CODIGOAPOYO1 FROM TRAMOMT WHERE CODIGOTRAMOBT='+qElementos.FieldByName('CLAVE1').AsString;
      7:qDatos.SQL.Text:='SELECT CODIGOAPOYO1 FROM INTERRUPTORDIS WHERE CODIGOINTERRUPTORDIS='+qElementos.FieldByName('CLAVE1').AsString;
      8:qDatos.SQL.Text:='SELECT CODIGOAPOYO1 FROM TRAFODIS WHERE CODIGOTRAFODIS='+qElementos.FieldByName('CLAVE1').AsString;
      9:qDatos.SQL.Text:='SELECT CODIGOAPOYO FROM CONDENSADOR WHERE CODIGOCONDENSADOR='+qElementos.FieldByName('CLAVE1').AsString;
     10:qDatos.SQL.Text:='SELECT CODIGOAPOYO FROM ALUMBRADOPUBLICO WHERE CODIGOALUMBRADOPUBLICO='+qElementos.FieldByName('CLAVE1').AsString;
     12:qDatos.SQL.Text:='SELECT CODIGOAPOYO1 FROM EXCAVACION WHERE CODIGOEXCAVACION='+qElementos.FieldByName('CLAVE1').AsString;
     15:qDatos.SQL.Text:='SELECT CODIGOAPOYO1 FROM REGULADOR WHERE CODIGOREGULADOR='+qElementos.FieldByName('CLAVE1').AsString;
     16:qDatos.SQL.Text:='SELECT CODIGOAPOYO FROM PARARRAYODIS WHERE CODIGOPARARRAYODIS='+qElementos.FieldByName('CLAVE1').AsString;
   end;
   if qDatos.SQL.Text <> '' then
   begin
       qDatos.Open;
       Result:=qDatos.Fields[0].AsString;
   end;
   qDatos.Free;}
end;

procedure TfElementosAsociadosODT.SBBuscaElementoCartografiaClick(
  Sender: TObject);
begin
   MostrarMapa;
   BuscarApoyo(ObtenerApoyo,True);
end;

procedure TfElementosAsociadosODT.SBFiltroCarograficoClick(
  Sender: TObject);
var Lista:TStringList;
    s:string; 
begin
   Lista:=TStringList.Create;
   Lista.Sorted:=True;
   Lista.Duplicates:=dupIgnore;

   qElementos.First;
   while not qElementos.Eof do
   begin
     s:=ObtenerApoyo;
     if s <> '' then
       Lista.Add(s);
     qElementos.Next;
   end;
   MostrarMapa;
   MarcarApoyos(Lista);
   Lista.Free;
end;

procedure TfElementosAsociadosODT.sbVistaLateralClick(Sender: TObject);
var punto:TPoint;
begin
 punto:=Panel3.ClientToScreen(Classes.Point(sbVistaLateral.Left, sbVistaLateral.top));
 pmVistaLateral.Popup(punto.x+10, punto.y+10);
end;

procedure TfElementosAsociadosODT.ElementoSeleccionado1Click(
  Sender: TObject);
var Lista:TStringList;
    qDatos:TQuery;
    s:string;
begin
  Lista:=TStringList.Create;
  qDatos:=TQuery.Create(Application);
  qDatos.DataBaseName:='BaseDato';
  s:=ObtenerApoyo;
  if s <> '' then
  begin
    qDatos.SQL.Text:='SELECT CODIGOAPOYO, X, Y FROM APOYO WHERE CODIGOAPOYO = '+s;
    qDatos.Open;
    QueryToList(qDatos,Lista,11);
    MostrarVistaLateralApoyos(Lista);
  end;
   qDatos.Free;
   Lista.Free;
end;

procedure TfElementosAsociadosODT.TodoslosElementos1Click(Sender: TObject);
var Lista:TStringList;
    qDatos:TQuery;
    s:string;
    I:Integer;
begin
   Lista:=TStringList.Create;
   qElementos.First;
   while not qElementos.Eof do
   begin
     s:=ObtenerApoyo;
     if s <> '' then
     Lista.Add(s);
     qElementos.Next;
   end;
   qDatos:=TQuery.Create(Application);
   qDatos.DataBaseName:='BaseDato';
   s:='(';
   for i:=0 to Lista.Count - 1 do
   begin
      if (i <> (Lista.Count - 1)) then
        s:=s + Lista[i]+','
      else
        s:=s + Lista[i]+')';
   end;
   qDatos.SQL.Text:='SELECT CODIGOAPOYO, X, Y FROM APOYO WHERE CODIGOAPOYO IN '+s;
   try
   qDatos.Open;
   Lista.Clear;
   QueryToList(qDatos,Lista,11);
   MostrarVistaLateralApoyos(Lista);
   except
     qDatos.Free;
     Lista.Free;
   end;
end;

procedure TfElementosAsociadosODT.CrearTabla;
var Tabla: TTable;
begin
  Tabla := TTable.Create(nil);
  with Tabla do
  begin
    DatabaseName := 'Temp';
    TableType := ttParadox;
    TableName := 'TempOdtElementos';
    with FieldDefs do
    begin
      Clear;
      Add('CODIGOAPOYO', ftFloat, 0, True);
      Add('ELEMENTO', ftString, 30, False);
      Add('ID1', ftFloat, 0, False);
      Add('ID2', ftString, 2, False);
    end;
    CreateTable;
  end;
  Tabla.Free;
end;

procedure TfElementosAsociadosODT.FormCreate(Sender: TObject);
begin
  ListaTablas := TStringList.Create;
  ListaKey    := TStringList.Create;
  ListaTablas.Add('H_APOYO');
  ListaTablas.Add('H_NODOMT');
  ListaTablas.Add('H_NODOBT');
  ListaTablas.Add('H_TRAFODIS');
  ListaTablas.Add('H_INTERRUPTORDIS');
  ListaTablas.Add('H_PARARRAYODIS');
  ListaTablas.Add('H_CONDENSADOR');
  ListaTablas.Add('H_DETALLEAPOYO');
  CrearTabla;
  tElementos.TableName := 'TempOdtElementos';
  tElementos.Open;
end;

procedure TfElementosAsociadosODT.FormDestroy(Sender: TObject);
begin
  ListaTablas.Free;
  ListaKey.Free;
end;

procedure TfElementosAsociadosODT.LlenarTabla(CodigoOdt: Double;
  Consecutivo: Integer);
var QDatos, qTemp: TQuery;
    I, J: Integer;
    qBorrar: TQuery;
begin
  qBorrar := TQuery.Create(Application);
  qBorrar.DatabaseName := 'Temp';
  qBorrar.SQL.Text := 'DELETE FROM TempOdtElementos';
  try
    qBorrar.ExecSQL;
  finally
    qBorrar.Free;
  end;
  QDatos := TQuery.Create(Application);
  QDatos.DatabaseName := 'BaseDato';
  for I:=0 to ListaTablas.Count - 1 do
  begin
    QDatos.Close;
    QDatos.SQL.Clear;
    QDatos.SQL.Add('SELECT H_CODIGOAPOYO1,');
    qTemp := TQuery.Create(nil);
    qTemp.DatabaseName := 'BaseDato';
    with qTemp.SQL do
    begin
      Add('SELECT UCC.COLUMN_NAME');
      Add('FROM USER_CONS_COLUMNS UCC, USER_CONSTRAINTS UC');
      Add('WHERE UCC.CONSTRAINT_NAME = UC.CONSTRAINT_NAME');
      Add('AND UCC.TABLE_NAME = ''' + Copy(ListaTablas[I],3,Length(ListaTablas[I])) + '''');
      Add('AND UC.CONSTRAINT_TYPE = ''P''');
    end;
    qTemp.Open;
    while not qTemp.Eof do
    begin
      QDatos.SQL.Add(qTemp.Fields[0].AsString);
      qTemp.Next;
      if not qTemp.Eof then
        QDatos.SQl.Add(',');
    end;
    qTemp.Close;
    QDatos.SQL.Add('FROM ' + ListaTablas[I]);
    QDatos.SQL.Add('WHERE H_CODIGOODT = ' + FloatToStr(FCodigoODT));
    QDatos.SQL.Add('AND H_CONSECUTIVO = ' + IntToStr(FConsecutivo));
    QDatos.Open;
    qTemp.SQL.Clear;
    qTemp.SQL.Add('SELECT NOMBRE FROM H_TABLA WHERE');
    qTemp.SQL.Add('H_TABLA = ''' + ListaTablas[I] + '''');
    qTemp.Open;
    if QDatos.RecordCount > 0 then
    begin
      tElementos.Insert;
      tElementos.FieldByName('CODIGOAPOYO').AsString := QDatos.FieldByName('H_CODIGOAPOYO1').AsString;
      tElementos.FieldByName('ELEMENTO').AsString := qTemp.Fields[0].AsString;
      for J:=1 to QDatos.FieldCount - 1 do
       tElementos.FieldByName('ID' + IntToStr(J)).AsString := QDatos.Fields[J].AsString;
      tElementos.Post;
    end;  
    qTemp.Free;
  end;
  QDatos.Free;
end;

procedure TfElementosAsociadosODT.FormShow(Sender: TObject);
begin
 LlenarTabla(FCodigoODT,FConsecutivo);
end;

end.
  