unit udFiltrarEmpleado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, Mask, DBCtrls, DBClient, DBTables,
  MemTable, Digisoft, Menus, utMenuArbol;

type
  TFdFiltrarEmpleado = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtnAnularFiltro: TBitBtn;
    BitBtnFiltrar: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    tdFiltroEmpleado: tdMemTable;
    tdFiltroEmpleadoNOMBRE1: TStringField;
    tdFiltroEmpleadoNOMBRE2: TStringField;
    tdFiltroEmpleadoNOMBRE3: TStringField;
    tdFiltroEmpleadoCODIGOEMPLEADO: TFloatField;
    tdFiltroEmpleadoCODIGOADMINISTRATIVO: TStringField;
    dMenuArbol1: TdMenuArbol;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnAnularFiltroClick(Sender: TObject);
    procedure BitBtnFiltrarClick(Sender: TObject);
    procedure dMenuArbol1SelectID(Sender: tnMenuItem; ID: Integer;
      MenuEstructura: tMenuEs);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure LimpiarFiltro;
  public
    { Public declarations }
    Query: TQuery;
    ListaDatos: TStringList;
    procedure CargarFiltro(Lista: TStringList);
  end;

var
  FdFiltrarEmpleado: TFdFiltrarEmpleado;

implementation

uses uBuscarEmpleado;

{$R *.DFM}

procedure TFdFiltrarEmpleado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsStayOnTop then
  begin
    Action:=caNone;
    Hide;
  end;
end;

procedure TFdFiltrarEmpleado.BitBtnAnularFiltroClick(Sender: TObject);
var i:Integer;
begin
 tdFiltroEmpleado.Edit;
  for i:=0 to tdFiltroEmpleado.FieldCount - 1 do
    tdFiltroEmpleado.Fields[0].AsString:='';
  ListaDatos.Clear;  
end;

procedure TFdFiltrarEmpleado.BitBtnFiltrarClick(Sender: TObject);
var ListaTemp:TStringList;
    i:Integer;
    Orden:string;
begin
 ListaTemp:=TStringList.Create;
 if tdFiltroEmpleado.FieldbyName('NOMBRE1').AsString<>'' then
 begin
   ListaTemp.Add('(NOMBREEMPLEADO LIKE ''%'+tdFiltroEmpleado.FieldbyName('NOMBRE1').AsString+'%'')');
   ListaDatos.Add('NOMBRE1='+tdFiltroEmpleado.FieldbyName('NOMBRE1').AsString);
 end;

 if tdFiltroEmpleado.FieldbyName('NOMBRE2').AsString<>'' then
 begin
   ListaTemp.Add('(NOMBREEMPLEADO LIKE ''%'+tdFiltroEmpleado.FieldbyName('NOMBRE2').AsString+'%'')');
   ListaDatos.Add('NOMBRE2='+tdFiltroEmpleado.FieldbyName('NOMBRE2').AsString);
 end;

 if tdFiltroEmpleado.FieldbyName('NOMBRE3').AsString<>'' then
 begin
   ListaTemp.Add('(NOMBREEMPLEADO LIKE ''%'+tdFiltroEmpleado.FieldbyName('NOMBRE3').AsString+'%'')');
   ListaDatos.Add('NOMBRE3='+tdFiltroEmpleado.FieldbyName('NOMBRE3').AsString);
 end;

 if tdFiltroEmpleado.FieldbyName('CODIGOEMPLEADO').AsString<>'' then
 begin
   ListaTemp.Add('(CODIGOEMPLEADO = '+tdFiltroEmpleado.FieldbyName('CODIGOEMPLEADO').AsString+')');
   ListaDatos.Add('CODIGOEMPLEADO='+tdFiltroEmpleado.FieldbyName('CODIGOEMPLEADO').AsString);
 end;

 if tdFiltroEmpleado.FieldbyName('CODIGOADMINISTRATIVO').AsString<>'' then
 begin
   ListaTemp.Add('(CODIGOADMINISTRATIVO = '+tdFiltroEmpleado.FieldbyName('CODIGOADMINISTRATIVO').AsString+')');
   ListaDatos.Add('CODIGOADMINISTRATIVO='+tdFiltroEmpleado.FieldbyName('CODIGOADMINISTRATIVO').AsString);
 end;

   Orden:=Query.SQL[Query.SQL.Count - 1];


   LimpiarFiltro;
   Query.SQL.Delete(Query.SQL.Count - 1);


   if ListaTemp.Count = 1 then
     Query.SQL.Add('WHERE ' + ListaTemp[0])
   else
   begin
     Query.SQL.Add('WHERE');
     for i:=0 to ListaTemp.Count - 1 do
      if i <> ListaTemp.Count - 1 then
        Query.SQL.Add(ListaTemp[i] + ' AND')
      else
        Query.SQL.Add(ListaTemp[i]);
   end;

   Query.SQl.Add(Orden);
   Query.Close;
   Query.Open;
   ListaTemp.Free;
end;

procedure TFdFiltrarEmpleado.dMenuArbol1SelectID(Sender: tnMenuItem;
  ID: Integer; MenuEstructura: tMenuEs);
begin
  tdFiltroEmpleado.Edit;
  tdFiltroEmpleado.FieldByName('CODIGOADMINISTRATIVO').AsInteger:=ID;
end;

procedure TFdFiltrarEmpleado.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFdFiltrarEmpleado.FormCreate(Sender: TObject);
begin
  Query := TQuery.Create(Application);
  ListaDatos := TStringList.Create;
  ListaDatos.Duplicates := dupIgnore;
  ListaDatos.Sorted := True;
  tdFiltroEmpleado.Insert;
end;

procedure TFdFiltrarEmpleado.FormDestroy(Sender: TObject);
begin
  Query := nil;
  Query.Free;
  ListaDatos.Free;
end;

procedure TFdFiltrarEmpleado.LimpiarFiltro;
var i,nLineas:Integer;
begin
  nLineas:=Query.SQL.Count - 4;
  if nLineas > 0 then
    for i:=1 to nLineas do
       Query.SQL.Delete(3);
end;

procedure TFdFiltrarEmpleado.CargarFiltro(Lista: TStringList);
var I:Integer;
begin
  for I := 0 to Lista.Count - 1 do
    try
     if Lista[I] <> '' then
     begin
       tdFiltroEmpleado.FieldByName(Lista.Names[I]).AsString := Lista.Values[Lista.Names[I]];
     end;  
    except
      Continue;
    end; 
end;

end.
