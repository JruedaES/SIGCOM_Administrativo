unit UdFiltroViaticozona;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, DBCtrls, StdCtrls, Mask, Buttons, Db, DBTables, Digisoft,
  ToolEdit, RXDBCtrl;

type
  TfdFiltroviaticoZona = class(TForm)
    Panel1: TPanel;
    DBEdit1: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    bitBFiltrar: TBitBtn;
    bitBAnularFiltro: TBitBtn;
    qZonaOrigen: TQuery;
    qZonaDestino: TQuery;
    tdMemTable1: tdMemTable;
    DSTdMemTable1: TDataSource;
    tdMemTable1CODIZONAORIGEN: TIntegerField;
    tdMemTable1CODIGOZONADESTINO: TIntegerField;
    tdMemTable1VIGENCIADESDE: TDateField;
    tdMemTable1VIGENCIAHASTA: TDateField;
    dsZonaOrigen: TDataSource;
    dsZonaDestino: TDataSource;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    procedure bitBFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Swhere:string;
  end;

var
  fdFiltroviaticoZona: TfdFiltroviaticoZona;

implementation

{$R *.DFM}

procedure TfdFiltroviaticoZona.bitBFiltrarClick(Sender: TObject);
begin
  sWhere := '';
  with tdMemTable1 do
  begin
    if FieldByName('CODIGOZONAORIGEN').AsString <> '' then
    begin
      sWhere := sWhere + ' WHERE CODIGOZONAORIGEN = ' + FieldByName('CODIGOZONAORIGEN').AsString ;
    end;
    if FieldByName('CODIGOZONADESTINO').AsString <> '' then
    begin
      if swhere='' then  swhere:=swhere + ' WHERE ' else  swhere:=swhere + ' AND ';
      sWhere := sWhere + '  CODIGOZONADESTINO = ' + FieldByName('CODIGOZONADESTINO').AsString;
    end;
    if FieldByName('VIGENCIADESDE').AsString <> '' then
    begin
      if swhere='' then  swhere:=swhere + ' WHERE ' else  swhere:=swhere + ' AND ';
      sWhere := sWhere + ' VIGENCIADESDE >= ' +  ' TO_DATE( '' '+ FieldByName('VIGENCIADESDE').AsString + ' '' , ''dd/mm/yyyy'')';
    end;
    if FieldByName('VIGENCIAHASTA').AsString <> '' then
    begin
      if swhere='' then  swhere:=swhere + ' WHERE ' else  swhere:=swhere + ' AND ';
      sWhere := sWhere + ' VIGENCIAHASTA >= ' +  ' TO_DATE( '' '+ FieldByName('VIGENCIAHASTA').AsString + ' '' , ''dd/mm/yyyy'')';
    end;
  end;
end;

procedure TfdFiltroviaticoZona.FormCreate(Sender: TObject);
begin
  qZonaOrigen.Open;
  qZonaDestino.Open;
  tdMemTable1.Open;
  tdMemTable1.Insert;
end;

end.
