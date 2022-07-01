unit uCantidadesExistentes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, DBTables, Grids, DBGrids, ExtCtrls, Buttons;

type
    SolicitaExistencias = Function(codigoMaterial, nombreMaterial, cias_cias,
    cod_almacen, cantidad, valorpromediounitario: PWideChar;
    Var Mensajes: PWideChar): PWideChar; stdcall;

  TfCantidadesExistentes = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    qAlmacen: TQuery;
    dsAlmacen: TDataSource;
    qGruposTrabajo: TQuery;
    dsGruposTrabajo: TDataSource;
    qAlmacenALMACEN_DESCRI: TStringField;
    qAlmacenBODEGA_DESCRI: TStringField;
    qAlmacenSALDO_CANTIDAD: TFloatField;
    qGruposTrabajoNOMBRECATEGORIA: TStringField;
    qGruposTrabajoNOMBREGRUPOTRABAJO: TStringField;
    qGruposTrabajoCANTIDADACTUAL: TFloatField;
    qGruposTrabajoCANTIDADACTUALDESMANTELADABUEN: TFloatField;
    bbCancelar: TBitBtn;
    LNombreMaterial: TLabel;
    qGruposTrabajoCODIGOADMINISTRATIVO: TFloatField;
    qGruposTrabajoCODIGOGRUPOTRABAJO: TFloatField;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid2: TDBGrid;
    DBGrid1: TDBGrid;
    sgSap: TStringGrid;
    procedure qAlmacenBeforeOpen(DataSet: TDataSet);
    procedure infoSap(codigo: String);
    function Conversion(codigo : String) :String;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCantidadesExistentes: TfCantidadesExistentes;

implementation
uses ufuncionsgd;

{$R *.DFM}

procedure TfCantidadesExistentes.qAlmacenBeforeOpen(DataSet: TDataSet);
begin
qAlmacen.sql.text:= 'SELECT alm.almacen_descri, bod.bodega_descri, (NVL(inv.SALDO_CANTIDAD,0) - NVL(INV.ACUM_CANTI_RESERVA,0)) AS SALDO_CANTIDAD '+
'FROM inv_m_inventario_real'+ DBLink+'  inv, com_s_catalogo'+ DBLink+'  cat, inv_s_bodega'+ DBLink+'  bod, inv_s_almacen'+ DBLink+'  alm '+
'WHERE inv.cod_catalogo = :catalogo '+
'AND inv.cod_almacen = bod.cod_almacen '+
'AND inv.cod_bodega = bod.cod_bodega '+
'AND bod.cod_almacen = alm.COD_ALMACEN '+
'AND inv.cod_catalogo = cat.cod_catalogo '+
'AND (NVL(inv.SALDO_CANTIDAD,0) - NVL(INV.ACUM_CANTI_RESERVA,0))> 0 ';
end;

procedure TfCantidadesExistentes.infoSap(codigo: String);
var
  proc: SolicitaExistencias;
  HandleModulo: Integer;
  codigoMaterial, nombreMaterial, cias_cias, cod_almacen, cantidad,
  valorpromediounitario: PWideChar;
  PRes: PWideChar;
  Men: PWideChar;
  Lista : TStringList;
  Lista1 : TStringList;
  i,j: Integer;
  Cias, Bodega, Cantidades: String;
  tamStringlist : Integer;
begin
  Lista := TStringList.Create;
  Lista1 := TStringList.Create;

  codigoMaterial := PWideChar(WideString(codigo));
  nombreMaterial := PWideChar(WideString(''));
  cias_cias := PWideChar(WideString('1000,2000,3000'));
  cod_almacen := PWideChar(WideString(''));
  cantidad := PWideChar(WideString(''));
  valorpromediounitario := PWideChar(WideString(''));

  HandleModulo := LoadLibrary('SapWebService');
  If HandleModulo <> 0 then
  Begin
    @proc := GetProcAddress(HandleModulo, 'SolicitaExistencias');
    if @proc <> nil then
    Begin
      PRes := proc(codigoMaterial, nombreMaterial, cias_cias, cod_almacen,
        cantidad, valorpromediounitario, Men);

        sgSap.Cells[1,0] := 'Almacen';
        sgSap.Cells[2,0] := 'Bodega';
        sgSap.Cells[3,0] := 'Cantidad';

        Lista.CommaText := String(PRes);
        tamStringlist := 2;
      for i:= 0 to Lista.Count - 1 do
         begin
           Lista1.Clear;
            Lista1.CommaText := Lista[i];

            Cias := Lista1[4];
            Bodega := Lista1[5];
            Cantidades := Lista1[6];

            if (StrToInt(Cantidades) > 0) Then
            Begin
                 tamStringlist := tamStringlist + 1;
                 sgSap.RowCount := tamStringlist;
                 sgSap.Cells[1,i+1] := Conversion(Cias);
                 sgSap.Cells[2,i+1] := Bodega;
                 sgSap.Cells[3,i+1] := Cantidades;
            End;
         end;
    End;
    FreeLibrary(HandleModulo);
    Lista.Free;
    Lista1.Free;
  End;
end;

function TfCantidadesExistentes.Conversion(codigo: String): String;
begin
 if  codigo = '1000' then
 begin
 Result := 'ALMACEN PRINCIPAL- TEGUCIGALPA';
 end;
  if  codigo = '2000' then
 begin
   Result := 'ALMACEN PRINCIPAL- SAN PEDRO SULA';
 end;
  if  codigo = '3000' then
 begin
   Result := 'ALMACEN PRINCIPAL- LA CEIBA';
 end;
end;

end.
