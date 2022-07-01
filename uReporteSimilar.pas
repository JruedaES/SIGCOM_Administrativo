unit uReporteSimilar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeEngine, Series, TeeProcs, Chart, DBChart, StdCtrls, Buttons, Grids,
  DBGrids, ExtCtrls, Db, DBTables;

type
  TFReporteSimilar = class(TForm)
    Panel4: TPanel;
    lTitulo: TLabel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Label24: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsDatos: TDataSource;
    Query1: TQuery;
    DataSource1: TDataSource;
    Query2: TQuery;
    Query2CODIGOREPORTE: TFloatField;
    Query2FECHAHORA: TDateTimeField;
    Query2NOMBREINFORMANTE: TStringField;
    Query2FECHAHORADICTADO: TDateTimeField;
    Query2FECHAHORALLEGADA: TDateTimeField;
    Query2FECHAHORAATENCION: TDateTimeField;
    DBChart1: TDBChart;
    Series1: THorizBarSeries;
    Series2: THorizBarSeries;
    Series3: THorizBarSeries;
    Query1CODIGOREPORTE: TFloatField;
    Query1FECHAHORA: TDateTimeField;
    Query1FECHAHORADICTADO: TDateTimeField;
    Query1FECHAHORALLEGADA: TDateTimeField;
    Query1FECHAHORAATENCION: TDateTimeField;
    Query2DIRECCIONDANO: TStringField;
    Query2PINTADOAPOYO: TStringField;
    Query2TELEFONO: TStringField;
    procedure Query2AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReporteSimilar: TFReporteSimilar;

implementation

{$R *.DFM}

procedure TFReporteSimilar.Query2AfterScroll(DataSet: TDataSet);
begin
  Query1.Close;
  Query1.Open;
end;

end.
