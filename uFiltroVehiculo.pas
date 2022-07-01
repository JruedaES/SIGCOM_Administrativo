unit uFiltroVehiculo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, Menus, utMenuArbol, Db,
  DBTables, Digisoft;

type
  TFFiltroVehiculo = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtnAnularFiltro: TBitBtn;
    BitBtnFiltrar: TBitBtn;
    DataSource1: TDataSource;
    tdFiltroVehiculo: tdMemTable;
    dMenuArbol1: TdMenuArbol;
    qPropietario: TQuery;
    Label2: TLabel;
    Label3: TLabel;
    qTipoVehiculo: TQuery;
    tdFiltroVehiculocodigovehiculo: TStringField;
    tdFiltroVehiculoCodigoTipoVehiculo: TIntegerField;
    tdFiltroVehiculoCodigoPropietario: TIntegerField;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    dsPropietario: TDataSource;
    dsTipoVehiculo: TDataSource;
    procedure BitBtnFiltrarClick(Sender: TObject);
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
  FFiltroVehiculo: TFFiltroVehiculo;

implementation

{$R *.DFM}

procedure TFFiltroVehiculo.BitBtnFiltrarClick(Sender: TObject);
begin
  if tdFiltroVehiculo.FieldbyName('CODIGOVEHICULO').AsString<>'' then
    ListaFiltro.Add('(CODIGOVEHICULO LIKE ''%'+tdFiltroVehiculo.FieldbyName('CODIGOVEHICULO').AsString+'%'')');
  if tdFiltroVehiculo.FieldbyName('CODIGOTIPOVEHICULO').AsString<>'' then
    ListaFiltro.Add('(CODIGOTIPOVEHICULO = '+tdFiltroVehiculo.FieldbyName('CODIGOTIPOVEHICULO').AsString+')');
  if tdFiltroVehiculo.FieldbyName('CODIGOPROPIETARIO').AsString<>'' then
    ListaFiltro.Add('(CODIGOPROPIETARIO = '+tdFiltroVehiculo.FieldbyName('CODIGOPROPIETARIO').AsString+')');
end;

procedure TFFiltroVehiculo.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TFFiltroVehiculo.CargarFiltro(Lista: TStringList);
var I:Integer;
begin
  for I := 0 to Lista.Count - 1 do
    try
     if Lista[I] <> '' then
     begin
       tdFiltroVehiculo.FieldByName(Lista.Names[I]).AsString := Lista.Values[Lista.Names[I]];
     end;
    except
      Continue;
    end;

end;

procedure TFFiltroVehiculo.BitBtnAnularFiltroClick(Sender: TObject);
var i:Integer;
begin
  for i:=0 to tdFiltroVehiculo.FieldCount - 1 do
    tdFiltroVehiculo.Fields[0].AsString:='';

end;

procedure TFFiltroVehiculo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caHide;
end;

procedure TFFiltroVehiculo.FormDestroy(Sender: TObject);
begin
 ListaFiltro.Free;
end;

procedure TFFiltroVehiculo.FormCreate(Sender: TObject);
begin
  ListaFiltro:=TStringList.Create;
  ListaDatos := TStringList.Create;
  ListaDatos.Duplicates := dupIgnore;
  ListaDatos.Sorted := True;
  tdFiltroVehiculo.Open;
  tdFiltroVehiculo.Insert;
  FiltroAdicional:='';  
end;

procedure TFFiltroVehiculo.LimpiarFiltro;
begin
  ListaDatos.Clear;
  ListaFiltro.Clear;
  tdFiltroVehiculo.close;
  tdFiltroVehiculo.Open;
  tdFiltroVehiculo.Insert;
end;

end.
