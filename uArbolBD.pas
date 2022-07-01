unit uArbolBD;

interface

uses SysUtils, Classes, dbTables;

type
  TArbolBD = class
    private
    Id:Integer;
    FCodigoCircuito,FTipo:string;
    //Modifica el circuito
    procedure SetCircuito(aValor:string);
    //Modifica el Tipo
    procedure SetTipo(aValor:string);
    //Obtiene el circuito
    function GetCircuito:string;
    //Obtiene el Tipo
    function GetTipo:string;
    public
    constructor Create;overload;
    property Circuito:string Read GetCircuito Write SetCircuito;
    property Tipo:string Read GetTipo Write SetTipo;
    //Elimina todos los nodos del arbol
    procedure EliminarNodos();
    //Crea el arbol con el nodo raiz : araiz
    procedure CrearArbol(aRaiz:string);
    //Inserta un nodo con el nombre especificado
    procedure InsertarNodo(aPaPa,aNodo:String);
    //Cuenta los nodos del arbol
    function  CuantosNodos():Integer;
    //Elimina un no especifico
    procedure EliminaNodo(aNodo:string);
    //Selecciona el SubArbol debajo del nodo y retorna una lista Nombre,Nivel
    function SubArbol(aNodo:string;IncluyeNodo:Boolean=True):TStringList;
    //Retorna todo del arbol
    function TodoElArbol(IncluyeRaiz:Boolean=True):TStringList;
    //Retorna el camino desde la raiz hasta el nodo especificado
    function CaminoNodo(aNodo:string;IncluyeNodo:Boolean=True):TStringList;
    //Elimina todos los nodos que se encuentre por debajo del nodo especificado
    procedure EliminaSubArbol(aNodo:string);
  end;

implementation

{ TArbolBD }

constructor TArbolBD.Create;
begin
  inherited;
  Id:=1;
  FCodigoCircuito:='Oliver';
  FTipo:='TO';
end;

procedure TArbolBD.CrearArbol(aRaiz: string);
var qDatos:TQuery;
begin
  //EliminarNodos();
  qDatos:=TQuery.Create(nil);
  qDatos.DatabaseName:='BaseDato';
  qDatos.Close;
  qDatos.SQL.Clear;
  qDatos.SQL.Add('Insert Into TreeNodes(CodigoCircuito,Tipo,Nombre,Papa_Id,Izquierda,Derecha,Nivel)');
  qDatos.SQL.Add('Values('''+Circuito+''','''+Tipo+''','''+aRaiz+ ''',0,1,2,0)' );

  qDatos.ExecSQL;
  qDatos.Free;
end;


procedure TArbolBD.EliminarNodos;
var qDatos:TQuery;
begin
  qDatos:=TQuery.Create(nil);
  qDatos.DatabaseName:='BaseDato';
  qDatos.SQL.Text:='Delete From TreeNodes';
  qDatos.ExecSQL;
  Id:=1;
  qDatos.Free;
end;

procedure TArbolBD.InsertarNodo(aPaPa, aNodo: String);
var Papa_Id, Papa_Izquierda, Papa_Derecha, Papa_Nivel,
    Nodo_Izquierda, Nodo_Derecha, Nodo_Count:Integer;
    qDatos:TQuery;
begin
  Papa_Id        := 0;
  Papa_Izquierda := 0;
  Papa_Derecha   := 0;
  Papa_Nivel     := 0;
  Nodo_Izquierda := 0;
  Nodo_Derecha   := 0;
  Nodo_Count     := 0;


  Nodo_Count:=CuantosNodos();
  qDatos:=TQuery.Create(nil);
  qDatos.DatabaseName:='BaseDato';
  qDatos.SQL.Add('Select Id, Izquierda, Derecha, Nivel From TreeNodes');
  qDatos.SQL.Add('Where Nombre = '''+aPapa+'''');
  qDatos.SQL.Add('And CodigoCircuito = '''+Circuito+'''');
  qDatos.SQL.Add('And Tipo = '''+Tipo+'''');
  qDatos.Open;
  if qDatos.RecordCount > 0 then
  begin
    Papa_Id        :=qDatos.FieldByName('Id').AsInteger;
    Papa_Izquierda :=qDatos.FieldByName('Izquierda').AsInteger;
    Papa_Derecha   :=qDatos.FieldByName('Derecha').AsInteger;
    Papa_Nivel     :=qDatos.FieldByName('Nivel').AsInteger;
  end
  else
    raise Exception.Create('Error al Insertar el Nodo '+ aNodo + Chr(13)
                          +'El Papa ' + aPapa + ' No Existe');

  //Actualiza la Derecha de todos los nodos del arbol
  qDatos.Close;
  qDatos.SQL.Clear;
  qDatos.SQL.Add('Update TreeNodes Set Derecha = Derecha + 2');
  qDatos.SQL.Add('Where Derecha >= ' + IntToStr(Papa_Derecha));
  qDatos.SQL.Add('And Derecha <= '+ IntToStr(Nodo_Count*2));
  qDatos.SQL.Add('And CodigoCircuito = '''+Circuito+'''');
  qDatos.SQL.Add('And Tipo = '''+Tipo+'''');
  qDatos.ExecSQL;

  //Actualiza la Izquierda de todos los nodos del arbol
  qDatos.Close;
  qDatos.SQL.Clear;
  qDatos.SQL.Add('Update TreeNodes Set Izquierda = Izquierda + 2');
  qDatos.SQL.Add('Where Izquierda > ' + IntToStr(Papa_Derecha));
  qDatos.SQL.Add('And Izquierda < '+ IntToStr((Nodo_Count + 1)*2));
  qDatos.SQL.Add('And CodigoCircuito = '''+Circuito+'''');
  qDatos.SQL.Add('And Tipo = '''+Tipo+'''');
  qDatos.ExecSQL;

  //Inserta el Nodo
  Inc(Id);
  Nodo_Izquierda:=Papa_Derecha;
  Nodo_Derecha:=Nodo_Izquierda + 1;
  qDatos.Close;
  qDatos.SQL.Clear;
  qDatos.SQL.Add('Insert Into TreeNodes (CodigoCircuito,Tipo,Nombre,Papa_Id,Izquierda,Derecha,Nivel) Values');
  qDatos.SQL.Add('('''+ Circuito + ''',''' + Tipo +''','''+ aNodo+''',' +IntToStr(Papa_Id)+','+IntToStr(Nodo_Izquierda)+','+IntToStr(Nodo_Derecha)+','+IntToStr(Papa_Nivel+1)+')');
  qDatos.ExecSQL;

  qDatos.Free;
end;

function TArbolBD.CuantosNodos: Integer;
var qDatos:TQuery;
begin
  qDatos:=TQuery.Create(nil);
  qDatos.DatabaseName:='BaseDato';
  qDatos.SQL.Add('Select Derecha From TreeNodes Where Izquierda = 1');
  qDatos.SQL.Add('And CodigoCircuito = '''+Circuito+'''');
  qDatos.SQL.Add('And Tipo = '''+Tipo+'''');
  qDatos.Open;
  if qDatos.Fields[0].AsString <> '' then
    Result:=qDatos.Fields[0].AsInteger div 2
  else
    Result:=0;

  qDatos.Free;
  qDatos:=nil;    
end;

procedure TArbolBD.EliminaNodo(aNodo: string);
var Nodo_Id, Nodo_Izquierda, Nodo_Derecha, Nodo_Count, SubNodos_Count:Integer;
    qDatos:TQuery;
    EsNodoHoja:Boolean;
begin
  Nodo_Id        := 0;
  Nodo_Izquierda := 0;
  Nodo_Derecha   := 0;
  Nodo_Count     := 0;
  SubNodos_Count := 0;
  EsNodoHoja     := False;
  qDatos:=TQuery.Create(nil);
  qDatos.DatabaseName:='BaseDato';

  Nodo_Count:=CuantosNodos();
  qDatos.SQL.Add('Select Id, Izquierda, Derecha From TreeNodes Where Nombre = '''+ aNodo + '''');
  qDatos.SQL.Add('And CodigoCircuito = '''+Circuito+'''');
  qDatos.SQL.Add('And Tipo = '''+Tipo+'''');
  qDatos.Open;
  if qDatos.RecordCount > 0 then
  begin
    Nodo_Id        := qDatos.FieldByName('Id').AsInteger;
    Nodo_Izquierda := qDatos.FieldByName('Izquierda').AsInteger;
    Nodo_Derecha   := qDatos.FieldByName('Derecha').AsInteger;
    if (Nodo_Derecha - Nodo_Izquierda) = 1 then
      EsNodoHoja:=True;

    SubNodos_Count:=(Nodo_Derecha - Nodo_Izquierda - 1) div 2;
    //Si no es hoja no se puede borrar o toca implementar una llamada recursiva.
    if not EsNodoHoja then
    begin
    end;
  end
  else
    raise Exception.Create('Error al Eliminar El Nodo ' + aNodo + '. Este No Existe');

  //Actualiza la Izquierda de todos los nodos del arbol  
  qDatos.Close;
  qDatos.SQL.Clear;
  qDatos.SQL.Add('Update TreeNodes Set Izquierda = Izquierda - 2');
  qDatos.SQL.Add('Where Izquierda > ' + IntToStr(Nodo_Derecha));
  qDatos.SQl.Add('And Izquierda < ' + IntToStr((Nodo_Count*2) + 1 ));
  qDatos.SQL.Add('And CodigoCircuito = '''+Circuito+'''');
  qDatos.SQL.Add('And Tipo = '''+Tipo+'''');
  qDatos.ExecSQL;

  //Actualiza la Derecha de todos los nodos del arbol
  qDatos.Close;
  qDatos.SQL.Clear;
  qDatos.SQL.Add('Update TreeNodes Set Derecha = Derecha - 2');
  qDatos.SQL.Add('Where Derecha >= ' + IntToStr(Nodo_Derecha));
  qDatos.SQL.Add('And Derecha <= ' + IntToStr(Nodo_Count * 2));
  qDatos.SQL.Add('And CodigoCircuito = '''+Circuito+'''');
  qDatos.SQL.Add('And Tipo = '''+Tipo+'''');
  qDatos.ExecSQL;

  //Elimina el Nodo
  qDatos.Close;
  qDatos.SQL.Clear;
  qDatos.SQL.Add('Delete From TreeNodes Where Nombre = ''' + aNodo + '''');
  qDatos.SQL.Add('And CodigoCircuito = '''+Circuito+'''');
  qDatos.SQL.Add('And Tipo = '''+Tipo+'''');
  qDatos.ExecSQL;

  qDatos.Free;
  qDatos:=nil;

end;

function TArbolBD.SubArbol(aNodo: string;IncluyeNodo:Boolean): TStringList;
var qDatos:TQuery;
begin
  Result:=TStringList.Create;
  qDatos:=TQuery.Create(nil);
  qDatos.DatabaseName:='BaseDato';
  qDatos.SQL.Add('Select Hijo.Nombre, Hijo.Nivel From TreeNodes Papa, TreeNodes Hijo');
  qDatos.SQL.Add('Where Hijo.Izquierda >= Papa.Izquierda');
  qDatos.SQL.Add('And Hijo.Izquierda <= Papa.Derecha');
  qDatos.SQL.Add('And Papa.CodigoCircuito = '''+Circuito+'''');
  qDatos.SQL.Add('And Papa.Tipo = '''+Tipo+'''');
  qDatos.SQL.Add('And Hijo.CodigoCircuito = '''+Circuito+'''');
  qDatos.SQL.Add('And Hijo.Tipo = '''+Tipo+'''');
  if not IncluyeNodo then
    qDatos.SQL.Add('And Papa.Nombre <> Hijo.Nombre');

  qDatos.SQL.Add('And Papa.Nombre = ''' + aNodo + '''');
  qDatos.SQL.Add('Order by Hijo.Izquierda');
  //qDatos.SQL.SaveToFile('C:\b.txt');
  qDatos.Open;
  while not qDatos.Eof do
  begin
    Result.Add(qDatos.Fields[0].AsString + '*' + qDatos.Fields[1].AsString );
    qDatos.Next;
  end;
  qDatos.Free;
end;

function TArbolBD.CaminoNodo(aNodo: string;IncluyeNodo:Boolean): TStringList;
var qDatos:TQuery;
begin
  Result:=TStringList.Create;
  qDatos:=TQuery.Create(nil);
  qDatos.DatabaseName:='BaseDato';
  qDatos.SQL.Add('Select Papa.Nombre From');
  qDatos.SQL.Add('TreeNodes Papa, TreeNodes Nodo');
  qDatos.SQL.Add('Where Papa.Izquierda <= Nodo.Derecha');
  qDatos.SQL.Add('And Papa.Derecha >= Nodo.Izquierda');
  qDatos.SQL.Add('And Nodo.CodigoCircuito = '''+Circuito+'''');
  qDatos.SQL.Add('And Nodo.Tipo = '''+Tipo+'''');
  qDatos.SQL.Add('And Papa.CodigoCircuito = '''+Circuito+'''');
  qDatos.SQL.Add('And Papa.Tipo = '''+Tipo+'''');
  if not IncluyeNodo then
    qDatos.SQL.Add('And Papa.Nombre <> Nodo.Nombre');

  qDatos.SQL.Add('And Nodo.Nombre = ''' + aNodo + '''');
  qDatos.SQL.Add('Order by Papa.Izquierda desc');

  qDatos.Open;
  while not qDatos.Eof do
  begin
    Result.Add(qDatos.Fields[0].AsString);
    qDatos.Next;
  end;
  qDatos.Free;  
end;

function TArbolBD.TodoElArbol(IncluyeRaiz: Boolean): TStringList;
var qDatos:TQuery;
begin
  Result:=TStringList.Create;
  qDatos:=TQuery.Create(nil);
  qDatos.DatabaseName:='BaseDato';
  qDatos.SQL.Text:='Select Nombre From TreeNodes Where Nivel=0';
  qDatos.SQL.Add('And CodigoCircuito = '''+Circuito+'''');
  qDatos.SQL.Add('And Tipo = '''+Tipo+'''');
  qDatos.Open;
  Result.Assign(SubArbol(qDatos.Fields[0].AsString,IncluyeRaiz));
  qDatos.Free;
end;

procedure TArbolBD.EliminaSubArbol(aNodo: string);
var Papa_Izquierda, Papa_Derecha, Nodo_Count, SubNodos_Count:Integer;
    qDatos:TQuery;
begin
  Papa_Izquierda := 0;
  Papa_Derecha   := 0;
  Nodo_Count     := 0;
  SubNodos_Count := 0;
  qDatos:=TQuery.Create(nil);
  qDatos.DatabaseName:='BaseDato';
  Nodo_Count:=CuantosNodos;

  qDatos.SQL.Add('Select Izquierda, Derecha From TreeNodes ');
  qDatos.SQL.Add('Where Nombre = '''+aNodo+'''');
  qDatos.SQL.Add('And CodigoCircuito = '''+Circuito+'''');
  qDatos.SQL.Add('And Tipo = '''+Tipo+'''');
  qDatos.Open;
  Papa_Izquierda:=qDatos.FieldByName('Izquierda').AsInteger;
  Papa_Derecha:=qDatos.FieldByName('Derecha').AsInteger;
  SubNodos_Count:=(Papa_Derecha  - Papa_Izquierda) div 2;

  //Elimina todos los nodos
  qDatos.Close;
  qDatos.SQL.Clear;
  qDatos.SQL.Add('Delete From TreeNodes Where');
  qDatos.SQL.Add('Izquierda > ' + IntToStr(Papa_Izquierda));
  qDatos.SQL.Add('And Derecha < ' + IntToStr(Papa_Derecha));
  qDatos.SQL.Add('And CodigoCircuito = '''+Circuito+'''');
  qDatos.SQL.Add('And Tipo = '''+Tipo+'''');
  qDatos.ExecSQL;

  //Actualiza la izquierda de los nodos
  qDatos.Close;
  qDatos.SQL.Clear;
  qDatos.SQL.Add('Update TreeNodes Set Izquierda = Izquierda - ' + IntToStr(SubNodos_Count*2));
  qDatos.SQL.Add('Where Izquierda > ' + IntToStr(Papa_Izquierda));
  qDatos.SQL.Add('And Izquierda < ' + IntToStr(Nodo_Count*2));
  qDatos.SQL.Add('And CodigoCircuito = '''+Circuito+'''');
  qDatos.SQL.Add('And Tipo = '''+Tipo+'''');
  qDatos.ExecSQL;

  //Actualiza la derecha de los nodos
  qDatos.Close;
  qDatos.SQL.Clear;
  qDatos.SQL.Add('Update TreeNodes Set Derecha = Derecha - ' + IntToStr(SubNodos_Count*2));
  qDatos.SQL.Add('Where Derecha >= ' + IntToStr(Papa_Izquierda));
  qDatos.SQL.Add('And Izquierda <= ' + IntToStr(Nodo_Count*2));
  qDatos.SQL.Add('And CodigoCircuito = '''+Circuito+'''');
  qDatos.SQL.Add('And Tipo = '''+Tipo+'''');
  qDatos.ExecSQL;

  qDatos.Free;
  
end;

procedure TArbolBD.SetCircuito(aValor: string);
begin
  if aValor <> FCodigoCircuito then
    FCodigoCircuito:=aValor;
end;

procedure TArbolBD.SetTipo(aValor: string);
begin
  if aValor <> FTipo then
    FTipo:=aValor;
end;

function TArbolBD.GetCircuito: string;
begin
  Result:=FCodigoCircuito;
end;

function TArbolBD.GetTipo: string;
begin
  Result:=FTipo;
end;

end.
