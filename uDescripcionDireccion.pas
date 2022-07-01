unit uDescripcionDireccion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Db, StdCtrls, DBCtrls, Buttons;

type
  TfDescripcionDireccion = class(TForm)
    dsExterno: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CargarDataSet(ds : TDataSEt);
  end;

var
  fDescripcionDireccion: TfDescripcionDireccion;

implementation

procedure TfDescripcionDireccion.CargarDataSet(ds : TDataSEt);
begin
  dsExterno.DataSet := ds;
end;

{$R *.DFM}


end.
