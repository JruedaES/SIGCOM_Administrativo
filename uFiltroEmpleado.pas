unit uFiltroEmpleado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Menus, utMenuArbol, Db,
  DBTables, Digisoft;

type
  TFFiltroEmpleado = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtnAnularFiltro: TBitBtn;
    BitBtnFiltrar: TBitBtn;
    DataSource1: TDataSource;
    tdFiltroEmpleado: tdMemTable;
    tdFiltroEmpleadoNOMBRE1: TStringField;
    tdFiltroEmpleadoNOMBRE2: TStringField;
    tdFiltroEmpleadoNOMBRE3: TStringField;
    tdFiltroEmpleadoCODIGOEMPLEADO: TFloatField;
    tdFiltroEmpleadoCODIGOADMINISTRATIVO: TStringField;
    dMenuArbol1: TdMenuArbol;
    procedure BitBtnFiltrarClick(Sender: TObject);
    procedure dMenuArbol1SelectID(Sender: tnMenuItem; ID: Integer;
      MenuEstructura: tMenuEs);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BitBtnAnularFiltroClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    FiltroAdicional:string;
    ListaDatos:TStringList;
    ListaFiltro:TStringList;
    procedure CargarFiltro(Lista: TStringList);
    procedure LimpiarFiltro;
  end;

var
  FFiltroEmpleado: TFFiltroEmpleado;

implementation

{$R *.DFM}

procedure TFFiltroEmpleado.BitBtnFiltrarClick(Sender: TObject);
begin
  if tdFiltroEmpleado.FieldbyName('NOMBRE1').AsString<>'' then
    ListaFiltro.Add('(NOMBREEMPLEADO LIKE ''%'+tdFiltroEmpleado.FieldbyName('NOMBRE1').AsString+'%'')');
  if tdFiltroEmpleado.FieldbyName('NOMBRE2').AsString<>'' then
    ListaFiltro.Add('(NOMBREEMPLEADO LIKE ''%'+tdFiltroEmpleado.FieldbyName('NOMBRE2').AsString+'%'')');
  if tdFiltroEmpleado.FieldbyName('NOMBRE3').AsString<>'' then
    ListaFiltro.Add('(NOMBREEMPLEADO LIKE ''%'+tdFiltroEmpleado.FieldbyName('NOMBRE3').AsString+'%'')');
  if tdFiltroEmpleado.FieldbyName('CODIGOEMPLEADO').AsString<>'' then
    ListaFiltro.Add('(CODIGOEMPLEADO = '+tdFiltroEmpleado.FieldbyName('CODIGOEMPLEADO').AsString+')');

  if tdFiltroEmpleado.FieldbyName('CODIGOADMINISTRATIVO').AsString<>'' then
  begin
    ListaFiltro.Add('(CODIGOADMINISTRATIVO = '+tdFiltroEmpleado.FieldbyName('CODIGOADMINISTRATIVO').AsString+')');
  end;
  ListaFiltro.Add('((estado IN (''AC'',''LC'')) OR (estado IS NULL))');
  if FiltroAdicional<>'' then
    ListaFiltro.Add(FiltroAdicional);
end;

procedure TFFiltroEmpleado.dMenuArbol1SelectID(Sender: tnMenuItem;
  ID: Integer; MenuEstructura: tMenuEs);
begin
  tdFiltroEmpleado.Edit;
  tdFiltroEmpleado.FieldByName('CODIGOADMINISTRATIVO').AsInteger:=ID;
end;

procedure TFFiltroEmpleado.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFFiltroEmpleado.CargarFiltro(Lista: TStringList);
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

procedure TFFiltroEmpleado.BitBtnAnularFiltroClick(Sender: TObject);
var i:Integer;
begin
  for i:=0 to tdFiltroEmpleado.FieldCount - 1 do
    tdFiltroEmpleado.Fields[0].AsString:='';

end;

procedure TFFiltroEmpleado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caHide;
end;

procedure TFFiltroEmpleado.FormDestroy(Sender: TObject);
begin
 ListaFiltro.Free;
end;

procedure TFFiltroEmpleado.FormCreate(Sender: TObject);
begin
  ListaFiltro:=TStringList.Create;
  ListaDatos := TStringList.Create;
  ListaDatos.Duplicates := dupIgnore;
  ListaDatos.Sorted := True;
  tdFiltroEmpleado.Open;
  tdFiltroEmpleado.Insert;
  FiltroAdicional:='';  
end;

procedure TFFiltroEmpleado.LimpiarFiltro;
begin
  ListaDatos.Clear;
  ListaFiltro.Clear;
  tdFiltroEmpleado.close;
  tdFiltroEmpleado.Open;
  tdFiltroEmpleado.Insert;
end;

end.
