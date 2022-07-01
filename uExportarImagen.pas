unit uExportarImagen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons;

type
  TFExportarImagen = class(TForm)
    rgExportarImagen: TRadioGroup;
    pInferior: TPanel;
    bbCancelar: TBitBtn;
    bbAceptar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FExportarImagen: TFExportarImagen;

implementation

{$R *.DFM}

end.
