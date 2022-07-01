unit uLamparaAPOdt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Db, DBTables;

type
  TfLamparaAPOdt = class(TForm)
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
    qLamparaAPCODIGOAPOYO: TFloatField;
    qLamparaAPCODIGOUSOALUMBRADO: TStringField;
    qLamparaAPR: TStringField;
    qLamparaAPS: TStringField;
    qLamparaAPT: TStringField;
    qLamparaAPN: TStringField;
    qLamparaAPCODIGOESTRUCTURA: TFloatField;
    qLamparaAPCODIGOOBSERVACION: TFloatField;
    qLamparaAPCODIGOACTUAL: TStringField;
    qLamparaAPCODIGOODT: TFloatField;
    qLamparaAPCONSECUTIVO: TFloatField;
    qLamparaAPCODIGOCUENTA: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fLamparaAPOdt: TfLamparaAPOdt;

implementation

{$R *.DFM}

end.
