unit UFiltrarclave;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uListaSimple, Db, DBTables, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl,
  ExtCtrls;

type
  TffiltrarClave = class(TfListaSimple)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    procedure SBFiltrarClick(Sender: TObject);
    procedure dbgDatosTitleClick(Column: TColumn);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ffiltrarClave: TffiltrarClave;

implementation

{$R *.DFM}

procedure TffiltrarClave.SBFiltrarClick(Sender: TObject);
var
 i:integer;
begin
end;

procedure TffiltrarClave.dbgDatosTitleClick(Column: TColumn);
begin
 //
end;

procedure TffiltrarClave.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
 if not (key in ['0'..'9','.',#8]) then
    begin
      key:=#0;
      Application.MessageBox(PChar('Debe escribir solamente numeros'), 'Error',
      MB_OK + MB_ICONERROR + MB_DEFBUTTON2)
    end
end;

end.
