unit uCIATraslado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Menus, utMenuArbol, dbTables;

type
  TfCIATraslado = class(TForm)
    edCIA: TEdit;
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    dMenuArbol1: TdMenuArbol;
    procedure FormCreate(Sender: TObject);
    procedure dMenuArbol1SelectID(Sender: tnMenuItem; ID: Integer;
      MenuEstructura: tMenuEs);
    procedure bbAceptarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCIATraslado: TfCIATraslado;

implementation

{$R *.DFM}

procedure TfCIATraslado.FormCreate(Sender: TObject);
var defstyle: dWord;
begin
  defstyle := GetWindowLong(edCIA.Handle, GWL_STYLE);
  SetWindowLong(edCIA.Handle, GWL_STYLE, defstyle or ES_NUMBER)
end;

procedure TfCIATraslado.dMenuArbol1SelectID(Sender: tnMenuItem;
  ID: Integer; MenuEstructura: tMenuEs);
begin
  edCIA.Hint := MenuEstructura.Nombre;
  edCIA.ShowHint := True;
  edCIA.Text := IntToStr(ID);
end;

procedure TfCIATraslado.bbAceptarClick(Sender: TObject);
var qDatos: TQuery;
begin
  if edCIA.Text <> '' then
  begin
    qDatos := TQuery.Create(nil);
    qDatos.DatabaseName := 'BaseDato';
    qDatos.SQL.Text := 'SELECT COUNT(*) FROM ADMINISTRATIVO WHERE CODIGOADMINISTRATIVO = ' + edCIA.Text;
    qDatos.Open;
    if qDatos.Fields[0].AsInteger = 0 then
    begin
      ModalResult := 0;
      MessageDlg('Debe escribir un código válido de dependencia.',mtError,[mbOk],0);
    end;
    qDatos.Free;
  end
  else
  begin
    ModalResult := 0;
    MessageDlg('Debe escribir un código válido de dependencia.',mtError,[mbOk],0);
  end;
end;

end.
