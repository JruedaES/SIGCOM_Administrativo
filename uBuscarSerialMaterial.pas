unit uBuscarSerialMaterial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Buttons, Grids, DBGrids, ExtCtrls;

type
  TfBuscarSerialMaterial = class(TForm)
    Panel2: TPanel;
    DBGridBuscarSerial: TDBGrid;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtnCerrar: TBitBtn;
    qSerialCuadrilla: TQuery;
    dsSerialCuadrilla: TDataSource;
    qSerialCuadrillaSERIAL: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  fBuscarSerialMaterial: TfBuscarSerialMaterial;

implementation

{$R *.DFM}

procedure TfBuscarSerialMaterial.FormCreate(Sender: TObject);
begin
//Aqui codigo para que salga por defecto los materiales de la odthija.  
end;

end.
 