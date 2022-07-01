unit UMinuta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Db, DBTables;

type
  TFMinuta = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    dsMinuta: TDataSource;
    qMinuta: TQuery;
    qMinutaCODIGOMINUTA: TFloatField;
    qMinutaNOMBREMINUTA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMinuta: TFMinuta;

implementation

{$R *.DFM}

end.
