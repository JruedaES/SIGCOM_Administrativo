unit uListaLamparaAP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Db, DBTables;

type
  TfListaLamparaAp = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    Panel4: TPanel;
    bbCancelar: TBitBtn;
    bbAceptar: TBitBtn;
    qLamparaAP: TQuery;
    dsLamparaAP: TDataSource;
    qLamparaAPPINTADOAPOYO: TStringField;
    qLamparaAPCODIGONODOBT: TStringField;
    qLamparaAPCODIGOALUMBRADOPUBLICO: TFloatField;
    qLamparaAPCODIGOACTUAL: TStringField;
    qLamparaAPCODIGOAPOYO: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fListaLamparaAp: TfListaLamparaAp;

implementation

{$R *.DFM}

end.
