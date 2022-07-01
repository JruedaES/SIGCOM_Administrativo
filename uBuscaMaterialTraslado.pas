unit uBuscaMaterialTraslado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfBuscaMaterialTraslado = class(TForm)
    Panel2: TPanel;
    DBGridBuscarMaterial: TDBGrid;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtnCerrar: TBitBtn;
    qMaterialcuadrilla: TQuery;
    dsMaterialcuadrilla: TDataSource;
    qMaterialcuadrillaCODIGOMATERIAL: TFloatField;
    qMaterialcuadrillaCANTIDADACTUAL: TFloatField;
    qMaterialcuadrillaNOMBREMATERIAL: TStringField;
    qMaterialcuadrillaCANTIDADACTUALDESMANTELADABUEN: TFloatField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  fBuscaMaterialTraslado: TfBuscaMaterialTraslado;

implementation

{$R *.DFM}

procedure TfBuscaMaterialTraslado.FormCreate(Sender: TObject);
begin
//Aqui codigo para que salga por defecto los materiales de la odthija.  
end;

end.
 