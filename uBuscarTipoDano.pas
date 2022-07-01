unit uBuscarTipoDano;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, RXDBCtrl;

type
  TFBuscarTipoDano = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    bbCancelar: TBitBtn;
    bbAceptar: TBitBtn;
    Panel1: TPanel;
    EdNombre: TEdit;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    RxDBGrid1: TRxDBGrid;
    dsTipoDano: TDataSource;
    qTipoDano: TQuery;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBuscarTipoDano: TFBuscarTipoDano;

implementation

{$R *.DFM}

procedure TFBuscarTipoDano.SpeedButton1Click(Sender: TObject);
begin
  if (EdNombre.Text = '') then
  begin
    qTipoDano.Close;
    qTipoDano.SQL.Text:='SELECT * FROM TIPODANO';
    qTipoDano.Open;
  end
  else
  begin
    qTipoDano.Close;
    qTipoDano.SQL.Text:='SELECT * FROM TIPODANO WHERE NOMBRETIPODANO LIKE ''%' + UpperCase(EdNombre.Text) + '%''';
    qTipoDano.Open;
  end;
end;

end.
