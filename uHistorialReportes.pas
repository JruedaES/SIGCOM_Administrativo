unit UHistorialReportes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, RXDBCtrl, Db,
  DBTables;

type
  TFHistorialReportes = class(TForm)
    Panel3: TPanel;
    SBFiltrar: TSpeedButton;
    Panel1: TPanel;
    bbCancelar: TBitBtn;
    RxDBGrid1: TRxDBGrid;
    QHistorialRep: TQuery;
    QHistorialRepID_USUARIO: TStringField;
    QHistorialRepACCION: TStringField;
    QHistorialRepFECHA: TDateTimeField;
    QHistorialRepCLAVE1: TFloatField;
    dsHistorialRep: TDataSource;
    CbBx1: TComboBox;
    Label3: TLabel;
    Label1: TLabel;
    EdTCodDesde: TEdit;
    EdtCodHasta: TEdit;
    procedure SBFiltrarClick(Sender: TObject);
    procedure QHistorialRepBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Iniciar(CodReporte:String);
  end;

var
  FHistorialReportes: TFHistorialReportes;
implementation

{$R *.DFM}

procedure TFHistorialReportes.SBFiltrarClick(Sender: TObject);
var
CadenaSql:String;
OpcionAccion:integer;
begin
  if (length(Edtcoddesde.Text)>0) then
    begin
      CadenaSql:='';
      qHistorialRep.Close;
      CadenaSql:='CLAVE1>='+Edtcoddesde.text;
      IF (length(EdtcodHasta.Text)>0) then
        CadenaSql:=CadenaSql+' AND CLAVE1<='+EdtcodHasta.text;
      OpcionAccion:=cbBx1.itemindex;
      case OpcionAccion of
       0:CadenaSql:=CadenaSql+' AND ACCION='+'''I''';
       1:CadenaSql:=CadenaSql+' AND ACCION='+'''A''';
       2:CadenaSql:=CadenaSql+' AND ACCION='+'''E''';
      END;
      qHistorialRep.Filter:=CadenaSql;
      qHistorialRep.Filtered:=True;
      qHistorialRep.Open;
    end
  else
    begin
      qHistorialRep.Close;
      OpcionAccion:=cbBx1.itemindex;
      case OpcionAccion of
       0:CadenaSql:=CadenaSql+'ACCION='+'''I''';
       1:CadenaSql:=CadenaSql+'ACCION='+'''A''';
       2:CadenaSql:=CadenaSql+'ACCION='+'''E''';
      END;
      qHistorialRep.Filter:=CadenaSql;
      qHistorialRep.Filtered:=True;
      qHistorialRep.Open;
    end;
end;
Procedure TFHistorialReportes.Iniciar(CodReporte:String);
Begin
 Edtcoddesde.Text:=CodReporte;
 EdtcodHasta.Text:=CodReporte;
 label1.Caption:='REPORTE :'+CodReporte;
 SBFiltrarClick(self);
end;
procedure TFHistorialReportes.QHistorialRepBeforeOpen(DataSet: TDataSet);
begin
  //QHistorialRep.sql.SaveToFile('c:\historial.txt');
end;

end.
