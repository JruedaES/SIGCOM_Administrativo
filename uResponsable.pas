unit uResponsable;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, ExtCtrls, Db, DBTables, DBCtrls;

type
  TfResponsable = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    RxDBGrid1: TRxDBGrid;
    dsResponsable: TDataSource;
    qResponsable: TQuery;
    qResponsableCODIGOTIPORESPONSABLE: TFloatField;
    qResponsableCODIGOADMINISTRATIVO: TFloatField;
    qResponsableCODIGOEMPLEADO: TFloatField;
    qNombreTipoResponsable: TQuery;
    qResponsableNOMBRETIPORESPONSABLE: TStringField;
    UpSQLResponsable: TUpdateSQL;
    DBNavigator1: TDBNavigator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fResponsable: TfResponsable;

implementation

{$R *.DFM}

end.
