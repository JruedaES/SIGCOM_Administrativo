unit uElementosElectricos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, ExtCtrls, Db, Grids, DBGrids, RXDBCtrl, dbTables;

type
  TFElementosElectricos = class(TForm)
    RxDBGrid1: TRxDBGrid;
    dsReporteElemento: TDataSource;
    DBText5: TDBText;
    Panel1: TPanel;
    DBNavigator1: TDBNavigator;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ObtenerApoyo:string;
  end;

var
  FElementosElectricos: TFElementosElectricos;

implementation

uses uReporte, uFIMPComunes;

{$R *.DFM}

procedure TFElementosElectricos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(Application.FindComponent('fReporte') as TForm) then
  fReporte.sbElementosElectricos.Enabled:=True;
  Action:=caHide;
end;

function TFElementosElectricos.ObtenerApoyo: string;
var qDatos:TQuery;
begin
   qDatos:=TQuery.Create(Application);
   qDatos.DatabaseName:='BaseDato';
   Result:='';
   with dsReporteElemento.DataSet do
   case FieldByName('CODIGOTIPOELEMENTO').AsInteger of
      1,2,3,4:Result:=FieldByName('CLAVE1').AsString;
      5:qDatos.SQL.Text:='SELECT CODIGOAPOYO1 FROM TRAMOMT WHERE CODIGOTRAMOMT='+FieldByName('CLAVE1').AsString;
      6:qDatos.SQL.Text:='SELECT CODIGOAPOYO1 FROM TRAMOMT WHERE CODIGOTRAMOBT='+FieldByName('CLAVE1').AsString;
      7:qDatos.SQL.Text:='SELECT CODIGOAPOYO1 FROM INTERRUPTORDIS WHERE CODIGOINTERRUPTORDIS='+FieldByName('CLAVE1').AsString;
      8:qDatos.SQL.Text:='SELECT CODIGOAPOYO1 FROM TRAFODIS WHERE CODIGOTRAFODIS='+FieldByName('CLAVE1').AsString;
      9:qDatos.SQL.Text:='SELECT CODIGOAPOYO FROM CONDENSADOR WHERE CODIGOCONDENSADOR='+FieldByName('CLAVE1').AsString;
     10:qDatos.SQL.Text:='SELECT CODIGOAPOYO FROM ALUMBRADOPUBLICO WHERE CODIGOALUMBRADOPUBLICO='+FieldByName('CLAVE1').AsString;
     12:qDatos.SQL.Text:='SELECT CODIGOAPOYO1 FROM EXCAVACION WHERE CODIGOEXCAVACION='+FieldByName('CLAVE1').AsString;
     15:qDatos.SQL.Text:='SELECT CODIGOAPOYO1 FROM REGULADOR WHERE CODIGOREGULADOR='+FieldByName('CLAVE1').AsString;
     16:qDatos.SQL.Text:='SELECT CODIGOAPOYO FROM PARARRAYODIS WHERE CODIGOPARARRAYODIS='+FieldByName('CLAVE1').AsString;
   end;
   if qDatos.SQL.Text <> '' then
   begin
       qDatos.Open;
       Result:=qDatos.Fields[0].AsString;
   end;
   qDatos.Free;
end;

procedure TFElementosElectricos.RxDBGrid1DblClick(Sender: TObject);
begin
 if dsReporteElemento.DataSet.FieldByName('NOMBRETIPOELEMENTO').AsString <> '' then
 begin
   MostrarMapa;
   BuscarApoyo(ObtenerApoyo,True);
 end;
end;

end.
