unit uBuscarActividadOdt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, ExtCtrls, Db, DBCtrls,
  DBTables;

type
  TfBuscarActividadOdt = class(TForm)
    Panel2: TPanel;
    SBFiltrar: TSpeedButton;
    Panel1: TPanel;
    Panel4: TPanel;
    bbCancelar: TBitBtn;
    bbAceptar: TBitBtn;
    dbgActividad: TRxDBGrid;
    EdNombre: TEdit;
    qOdtOpera: TQuery;
    qNivelTension: TQuery;
    qOdtActividad: TQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dsOdtActividad: TDataSource;
    dsOdtOpera: TDataSource;
    dsNivelTension: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    qOdtActividadCODIGOODTOPERA: TFloatField;
    qOdtActividadNOMBREODTOPERA: TStringField;
    qOdtActividadCODIGONIVELTENSION: TFloatField;
    qOdtActividadTENSION: TStringField;
    qOdtActividadCODIGOODTACTIVIDAD: TFloatField;
    qOdtActividadNOMBREODTACTIVIDAD: TStringField;
    qOdtActividadCOSTOACTIVIDAD: TFloatField;
    procedure SBFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fBuscarActividadOdt: TfBuscarActividadOdt;

implementation

{$R *.DFM}

procedure TfBuscarActividadOdt.SBFiltrarClick(Sender: TObject);
var  i:integer;
begin
  qOdtActividad.close;
  for i :=0  to qOdtActividad.sql.count-6 do
  begin
    qOdtActividad.SQL.Delete(5);
  end;
  i:=5;
  if (qOdtOpera.fieldbyname('CODIGOODTOPERA').AsString<> '-1') then
  begin
   qOdtActividad.SQL.Insert(i,'AND A.CODIGOODTOPERA = '+qOdtOpera.fieldbyname('CODIGOODTOPERA').AsString);
   inc(i);
  end;

  if (qNivelTension.fieldbyname('CODIGONIVELTENSION').AsString<> '') then
  begin
    qOdtActividad.SQL.Insert(i,'AND A.CODIGONIVELTENSION = '''+qNivelTension.fieldbyname('CODIGONIVELTENSION').AsString+'''');
    inc(i);
  end;

  if EdNombre.Text <> '' then
  begin
    qOdtActividad.SQL.Insert(i,'AND A.NOMBREODTACTIVIDAD LIKE ''%'+EdNombre.Text+'%''');
  end;
  qOdtActividad.open;
end;

procedure TfBuscarActividadOdt.FormCreate(Sender: TObject);
begin
  qOdtActividad.close;
  qOdtActividad.open;
  qOdtOpera.close;
  qOdtOpera.open;
  qNivelTension.close;
  qNivelTension.open;
end;

end.
