unit uBuscarMaterialReintegro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Db, DBTables;

type
  TfBuscarMaterialReintegro = class(TForm)
    DBGridBuscarMaterial: TDBGrid;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtnCerrar: TBitBtn;
    qMaterial: TQuery;
    dsMaterial: TDataSource;
    qMaterialCODIGOMATERIAL: TFloatField;
    qMaterialCANTIDADACTUAL: TFloatField;
    qMaterialNOMBREMATERIAL: TStringField;
    qMaterialCANTIDADACTUALDESMANTELADABUEN: TFloatField;
    qMaterialCANTIDADACTUALDESMANTELADAMALA: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBuscarMaterialReintegro: TfBuscarMaterialReintegro;

implementation

{$R *.DFM}

end.
