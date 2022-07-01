unit uRegistrarMtto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
  TfRegistrarMtto = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure IngresarDatos(Lista:TStringList);virtual;
  end;

type
  TActualizarMtto = class(TFRegistrarMtto)
  private
  public
    constructor Actualizar();
    procedure IngresarDatos(Lista:TStringList);override;

end;

var
  fRegistrarMtto: TfRegistrarMtto;
  fActualizarMtto: TActualizarMtto;
  L:TStringList;
  Mantenimiento: TFRegistrarMtto;

implementation

{$R *.DFM}

  constructor TActualizarMtto.Actualizar();
  begin
  Mantenimiento:= TFRegistrarMtto.Create(Application);
//   TActualizarMtto.Mantenimiento.IngresarDatos(L);
 end;

 procedure TFRegistrarMtto.IngresarDatos(Lista:TStringList);
 begin
   showmessage('Registrar - Ingresar Datos');
 end;

 procedure TActualizarMtto.IngresarDatos(Lista:TStringList);
 begin
//   inherited IngresarDatos(Lista);
  Mantenimiento:= TFRegistrarMtto.Create(Application);
   showmessage('Actualizar - Ingresar Datos');
 end;


procedure TfRegistrarMtto.FormCreate(Sender: TObject);
begin
  Mantenimiento.IngresarDatos(L);
end;

end.
