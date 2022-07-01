unit uFiltroContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, Mask, DBCtrls, DBClient, DBTables,
  MemTable, Digisoft, Menus, utMenuArbol;

type
  TFFiltroContrato = class(TForm)
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    dsFiltroContrato: TDataSource;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtnAnularFiltro: TBitBtn;
    BitBtnFiltrar: TBitBtn;
    tdFiltroContrato: tdMemTable;
    dMenuArbol1: TdMenuArbol;
    DBLookupComboBox1: TDBLookupComboBox;
    Label9: TLabel;
    dbeCIG: TDBEdit;
    DBTGeografico: TDBText;
    sbBuscarCIG: TSpeedButton;
    Opcionurbano: TDBRadioGroup;
    tdFiltroContratoURBANO: TStringField;
    tdFiltroContratoCIG: TFloatField;
    tdFiltroContratoCODIGOINTERVENTOR: TIntegerField;
    qGeografico: TQuery;
    dsGeografico: TDataSource;
    qEmpleado: TQuery;
    dsEmpleado: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtnAnularFiltroClick(Sender: TObject);
    procedure BitBtnFiltrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbBuscarCIGClick(Sender: TObject);
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
  FFiltroContrato: TFFiltroContrato;

implementation

uses uBuscarEmpleado, uFuncionSGD;

{$R *.DFM}

procedure TFFiltroContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FormStyle = fsStayOnTop then
  begin
    Action:=caNone;
    Hide;
  end;
end;

procedure TFFiltroContrato.BitBtnAnularFiltroClick(Sender: TObject);
var i:Integer;
begin
 tdFiltroContrato.Edit;
  for i:=0 to tdFiltroContrato.FieldCount - 1 do
    tdFiltroContrato.Fields[i].AsString:='';
  ListaDatos.Clear;
end;

procedure TFFiltroContrato.BitBtnFiltrarClick(Sender: TObject);
var ListaTemp:TStringList;
    i:Integer;
    Orden:string;
begin
 ListaTemp:=TStringList.Create;
 if tdFiltroContrato.FieldbyName('URBANO').AsString<>'' then
 begin
   if tdFiltroContratoURBANO.AsString='S' then
   begin
     ListaTemp.Add('URBANO = S');
     ListaDatos.Add('URBANO = '+ tdFiltroContratoURBANO.AsString);
   end
   else
   begin
     ListaTemp.Add('URBANO <> S');
     ListaDatos.Add('URBANO <> S ');
   end;
 end;

 if tdFiltroContrato.FieldbyName('CIG').AsString<>'' then
 begin
   ListaTemp.Add('CODIGOGEOGRAFICO ='+ tdFiltroContratoCIG.AsString  );
   ListaDatos.Add('CIG = '+ qGeografico.FieldByName('NOMBREGEOGRAFICO').AsString);
 end;

 if tdFiltroContrato.FieldbyName('CODIGOINTERVENTOR').AsString<>'' then
 begin
   ListaTemp.Add('CODIGOINTERVENTOR ='+ tdFiltroContratoCODIGOINTERVENTOR.AsString);
   ListaDatos.Add('INTERVENTOR ='+ qEmpleado.FieldbyName('NOMBREEMPLEADO').AsString);
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

procedure TFFiltroContrato.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFFiltroContrato.FormCreate(Sender: TObject);
begin
  Query := TQuery.Create(Application);
  ListaDatos := TStringList.Create;
  ListaDatos.Duplicates := dupIgnore;
  ListaDatos.Sorted := True;
  tdFiltroContrato.Insert;
end;

procedure TFFiltroContrato.FormDestroy(Sender: TObject);
begin
  Query := nil;
  Query.Free;
  ListaDatos.Free;
end;

procedure TFFiltroContrato.LimpiarFiltro;
var i,nLineas:Integer;
begin
  nLineas:=Query.SQL.Count - 4;
  if nLineas > 0 then
    for i:=1 to nLineas do
       Query.SQL.Delete(3);
end;

procedure TFFiltroContrato.CargarFiltro(Lista: TStringList);
var I:Integer;
begin
  for I := 0 to Lista.Count - 1 do
    try
     if Lista[I] <> '' then
     begin
       tdFiltroContrato.FieldByName(Lista.Names[I]).AsString := Lista.Values[Lista.Names[I]];
     end;
    except
      Continue;
    end;
end;

procedure TFFiltroContrato.sbBuscarCIGClick(Sender: TObject);
VAR CIG:INTEGER;
  qGeograficoIndice :TQuery;
begin
  CIG := CapturarCIG;
  if CIG<>0 then tdFiltroContratoCIG.AsInteger:=CIG;
end;


end.
