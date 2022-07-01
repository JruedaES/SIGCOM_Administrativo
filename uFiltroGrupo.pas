unit uFiltroGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, Mask, DBCtrls, DBClient, DBTables,
  MemTable, Digisoft, Menus, utMenuArbol;

type
  TFFiltroGrupo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsFiltroGrupo: TDataSource;
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
    tdFiltroGrupo: tdMemTable;
    tdFiltroGrupoNOMBRE1: TStringField;
    tdFiltroGrupoNOMBRE2: TStringField;
    tdFiltroGrupoNOMBRE3: TStringField;
    tdFiltroGrupoCODIGOADMINISTRATIVO: TStringField;
    dMenuArbol1: TdMenuArbol;
    tdFiltroGrupoCODIGOGRUPOTRABAJO: TIntegerField;
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
  public
    { Public declarations }
    Query: TQuery;
    ListaDatos: TStringList;
    procedure CargarFiltro(Lista: TStringList);
  end;

var
  FFiltroGrupo: TFFiltroGrupo;

implementation

{$R *.DFM}

procedure TFFiltroGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsStayOnTop then
  begin
    Action:=caNone;
    Hide;
  end;
end;

procedure TFFiltroGrupo.BitBtnAnularFiltroClick(Sender: TObject);
var i:Integer;
begin
 tdFiltroGrupo.Edit;
  for i:=0 to tdFiltroGrupo.FieldCount - 1 do
    tdFiltroGrupo.Fields[0].AsString:='';
  ListaDatos.Clear;
end;

procedure TFFiltroGrupo.BitBtnFiltrarClick(Sender: TObject);
var ListaTemp:TStringList;
    i:Integer;
    Orden:string;
begin
  ListaTemp:=TStringList.Create;
  if tdFiltroGrupo.FieldbyName('NOMBRE1').AsString<>'' then
  begin
   ListaTemp.Add('(NOMBREGRUPOTRABAJO LIKE ''%'+tdFiltroGrupo.FieldbyName('NOMBRE1').AsString+'%'')');
   ListaDatos.Add('NOMBRE1='+tdFiltroGrupo.FieldbyName('NOMBRE1').AsString);
  end;

  if tdFiltroGrupo.FieldbyName('NOMBRE2').AsString<>'' then
  begin
   ListaTemp.Add('(NOMBREGRUPOTRABAJO LIKE ''%'+tdFiltroGrupo.FieldbyName('NOMBRE2').AsString+'%'')');
   ListaDatos.Add('NOMBRE2='+tdFiltroGrupo.FieldbyName('NOMBRE2').AsString);
  end;

  if tdFiltroGrupo.FieldbyName('NOMBRE3').AsString<>'' then
  begin
   ListaTemp.Add('(NOMBREGRUPOTRABAJO LIKE ''%'+tdFiltroGrupo.FieldbyName('NOMBRE3').AsString+'%'')');
   ListaDatos.Add('NOMBRE3='+tdFiltroGrupo.FieldbyName('NOMBRE3').AsString);
  end;

  if tdFiltroGrupo.FieldbyName('CODIGOGRUPOTRABAJO').AsString<>'' then
  begin
   ListaTemp.Add('(CODIGOGRUPOTRABAJO = '+tdFiltroGrupo.FieldbyName('CODIGOGRUPOTRABAJO').AsString+')');
   ListaDatos.Add('CODIGOGRUPOTRABAJO='+tdFiltroGrupo.FieldbyName('CODIGOGRUPOTRABAJO').AsString);
  end;

  if tdFiltroGrupo.FieldbyName('CODIGOADMINISTRATIVO').AsString<>'' then
  begin
   ListaTemp.Add('(CODIGOADMINISTRATIVO = '+tdFiltroGrupo.FieldbyName('CODIGOADMINISTRATIVO').AsString+')');
   ListaDatos.Add('CODIGOADMINISTRATIVO='+tdFiltroGrupo.FieldbyName('CODIGOADMINISTRATIVO').AsString);
  end;
   Query.Close;
   Query.SQL.Clear;
   Query.SQL.Add('SELECT CODIGOADMINISTRATIVO,CODIGOGRUPOTRABAJO,NOMBREGRUPOTRABAJO,CODIGOHORARIOTRABAJO');
   Query.SQL.Add('FROM GRUPOTRABAJO');

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
   Query.Open;
   ListaTemp.Free;
end;

procedure TFFiltroGrupo.dMenuArbol1SelectID(Sender: tnMenuItem;
  ID: Integer; MenuEstructura: tMenuEs);
begin
  tdFiltroGrupo.Edit;
  tdFiltroGrupo.FieldByName('CODIGOADMINISTRATIVO').AsInteger:=ID;
end;

procedure TFFiltroGrupo.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFFiltroGrupo.FormCreate(Sender: TObject);
begin
  Query := TQuery.Create(Application);
  ListaDatos := TStringList.Create;
  ListaDatos.Duplicates := dupIgnore;
  ListaDatos.Sorted := True;
  tdFiltroGrupo.Insert;
end;

procedure TFFiltroGrupo.FormDestroy(Sender: TObject);
begin
  Query := nil;
  Query.Free;
  ListaDatos.Free;
end;

procedure TFFiltroGrupo.CargarFiltro(Lista: TStringList);
var I:Integer;
begin
  for I := 0 to Lista.Count - 1 do
    try
     if Lista[I] <> '' then
     begin
       tdFiltroGrupo.FieldByName(Lista.Names[I]).AsString := Lista.Values[Lista.Names[I]];
     end;
    except
      Continue;
    end; 
end;

end.
