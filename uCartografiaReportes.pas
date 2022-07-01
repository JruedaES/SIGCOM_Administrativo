unit uCartografiaReportes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ExtCtrls, DBCtrls, ComCtrls;

type
  TfCartografiaReportes = class(TForm)
    dbNAvigator: TDBNavigator;
    dsBusqueda: TDataSource;
    StatusBar1: TStatusBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCartografiaReportes: TfCartografiaReportes;

implementation

{$R *.DFM}

procedure TfCartografiaReportes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfCartografiaReportes.FormShow(Sender: TObject);
begin
  Caption:='Reportes Asociados';
end;

end.
 