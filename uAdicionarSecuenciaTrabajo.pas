unit uAdicionarSecuenciaTrabajo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids,DB, DBCtrls, DBTables, ExtCtrls;

type
  TFAdicionarSecuenciaTrabajos = class(TForm)
    DBGrid1: TDBGrid;
    tSecuencia: TTable;
    dsSecuenciaTrabajo: TDataSource;
    tTrabajo: TTable;
    DSTrabajo: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    bbAdicionar: TBitBtn;
    bbSalir: TBitBtn;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBLookupComboBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAdicionarSecuenciaTrabajos: TFAdicionarSecuenciaTrabajos;
  ContenidoAct, ContenidoAnt:string;
  anterior, actual: TBookmark;
  buf:TKeyboardState;

implementation

{$R *.DFM}

procedure TFAdicionarSecuenciaTrabajos.FormActivate(Sender: TObject);
begin
   tSecuencia.Active:=False;
end;

procedure TFAdicionarSecuenciaTrabajos.FormDestroy(Sender: TObject);
begin
  application.OnMessage:=nil;
end;

procedure TFAdicionarSecuenciaTrabajos.DBLookupComboBox1Click(
  Sender: TObject);
begin
 tSecuencia.Active:=False;
 tSecuencia.Filtered:=False;
 tSecuencia.Filter:='CodigoTrabajo='''+tTrabajo.FieldByName('CodigoTrabajo').AsString+'''';
 tSecuencia.Filtered:=True;
 tSecuencia.Active:=True;
end;

end.
