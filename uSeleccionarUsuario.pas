unit uSeleccionarUsuario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uListaSimple, Db, DBTables, StdCtrls, Buttons, Grids, DBGrids, RXDBCtrl,
  ExtCtrls;

type
  TfSeleccionarUsuario = class(TfListaSimple)
    qDatosCODIGOUSUARIO: TFloatField;
    qDatosLOGINUSUARIO: TStringField;
    qDatosNOMBREUSUARIO: TStringField;
    procedure SBFiltrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fSeleccionarUsuario: TfSeleccionarUsuario;

implementation

{$R *.DFM}

procedure TfSeleccionarUsuario.SBFiltrarClick(Sender: TObject);
var
 i:integer;
begin
  qDatos.close;
  for i :=0  to qDatos.sql.count-2 do
  begin
    qDatos.SQL.Delete(1);
  end;
  i:=1;
  if EdCodigo.Text <> '' then
  begin
   qDatos.SQL.Insert(i,'WHERE CODIGOUSUARIO = '+EdCodigo.Text);
   inc(i);
  end;
  if EdCodigo2.Text <> '' then
  begin
    if i>1 then
     qDatos.SQL.Insert(i,'AND LOGINUSUARIO LIKE ''%'+EdCodigo2.Text+'%''')
    else
     qDatos.SQL.Insert(i,'WHERE LOGINUSUARIO LIKE ''%'+EdCodigo2.Text+'%''');
   inc(i);
  end;
  if EdNombre.Text <> '' then
  begin
    if i>1 then
     qDatos.SQL.Insert(i,'AND NOMBREUSUARIO LIKE ''%'+EdNombre.Text+'%''')
    else
     qDatos.SQL.Insert(i,'WHERE NOMBREUSUARIO LIKE ''%'+EdNombre.Text+'%''');
    inc(i);
  end;
  qDatos.Open;
end;

end.
