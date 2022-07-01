unit ulistareportesasociados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,uFuncionsgd,
  StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, Db, DBTables,ureporte,uListaReportes;

type                                                            
  Tflistareportesasociados = class(TForm)
    titular: TPanel;
    base: TPanel;
    bSalir: TBitBtn;
    dbgReportesAsociados: TDBGrid;
    Dlista: TDataSource;
    Qlista: TQuery;
    asociar: TBitBtn;
    pInterrupcion: TPanel;
    Label1: TLabel;
    memo: TMemo;
    lcircuito: TLabel;
    procedure dbgReportesAsociadosDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure asociarClick(Sender: TObject);
    procedure bSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    codigoreporte,codevento: string;
    constructor crear(AOwner: TComponent;titulo,sql,codreporte: string; poderagrupar: boolean);
    constructor crearconevento(AOwner: TComponent;titulo,sql,lineaevento,codreporte: string; poderagrupar: boolean);
    Procedure ReporteAReporte();
    Procedure GenerarColorReporte();
    Procedure Circuito(codCircuito:string);
  end;

var
  flistareportesasociados: Tflistareportesasociados;

implementation

{$R *.DFM}

{ Tflistareportesasociados }

constructor Tflistareportesasociados.crear(AOwner: TComponent;titulo,sql,codreporte: string; poderagrupar: boolean);
begin
   inherited Create(Owner);
   codigoreporte:= codreporte;
   if Qlista.Active then
    Qlista.close;
   Qlista.sql.clear;
   Qlista.sql.add(sql);
   Qlista.Open;
   lcircuito.Caption:='Circuito: '+Qlista.fieldbyname('Circuito').AsString;
   titular.Caption:=titulo;
   asociar.Visible:=poderagrupar;
   codevento:='';
end;

constructor Tflistareportesasociados.crearconevento(AOwner: TComponent;titulo,sql,lineaevento,codreporte: string; poderagrupar: boolean);
begin
   inherited Create(Owner);
   codigoreporte:= codreporte;
   if Qlista.Active then
    Qlista.close;
   Qlista.sql.clear;
   Qlista.sql.add(sql);
   Qlista.Open;
   lcircuito.Caption:='Circuito: '+Qlista.fieldbyname('Circuito').AsString;
   titular.Caption:=titulo;
   memo.visible:=true;
   memo.Lines.Add(lineaevento);
   asociar.Visible:=poderagrupar;
   codevento:='';
   bSalir.Visible:=False;
end;

procedure Tflistareportesasociados.dbgReportesAsociadosDblClick(Sender: TObject);
var
 my_reporte: TfReporte;
begin
 if  Qlista.fieldbyname('Reporte').AsString <> '' then
  begin
    my_reporte:=TfReporte.Create(Application);
    my_reporte.qReporte.Active:=False;
    my_reporte.qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE='+
                                Qlista.fieldbyname('Reporte').AsString;
    my_reporte.qReporte.Active:=True;
    my_reporte.qReporte.Edit;
    my_reporte.bbAceptar.Enabled:=false;
    my_reporte.ShowModal;
    if my_reporte <> nil then
      my_reporte.free;
  end;
end;

procedure Tflistareportesasociados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Tflistareportesasociados.ReporteAReporte;
var
   sql,linea: string;
   //qry: Tquery;
   SortcodReporte:array of Integer;
   i,j,temp,longArray:Integer;
begin
  linea:='';
  if not Qlista.IsEmpty then
  begin
    longArray:=Qlista.recordcount+1;
    Setlength(SortcodReporte,longArray);
    SortcodReporte[0]:=strtoint(codigoreporte);
    linea:=Qlista.fieldbyname('Reporte').AsString;
    SortcodReporte[1]:=strtoint(linea);
    i:=2;
    Qlista.next;
    while not qlista.eof do
    begin
      linea:=linea+','+Qlista.fieldbyname('Reporte').AsString;
      SortcodReporte[i]:=strtoint(Qlista.fieldbyname('Reporte').AsString);
      Qlista.next;
      i:=i+1;
    end;
    for i:=0 to longArray-2 do
      for j:=i+1 to longArray-1 do
      begin
        if SortcodReporte[i]> SortcodReporte[j] then
        begin
          temp:=SortcodReporte[j];
          SortcodReporte[j]:=SortcodReporte[i];
          SortcodReporte[i]:=temp;
        end;
      end;
    codigoreporte:=inttostr(SortcodReporte[0]);
    Linea:='';
    linea:=inttostr(SortcodReporte[1]);
    for j:=2 to length(SortcodReporte)-1 do
      linea:=linea+','+inttostr(SortcodReporte[j]);
    GenerarColorReporte();
    AgruparReportes(codigoreporte,linea);
    ActualizarReportesHijos(codigoreporte);
  end;
end;

procedure Tflistareportesasociados.asociarClick(Sender: TObject);
begin
  QLista.First;
  ReporteAReporte;
  Application.MessageBox('Los reportes han sido agrupados.',PChar('Reportes Agrupados'),MB_ICONINFORMATION);
  close;
end;

Procedure Tflistareportesasociados.GenerarColorReporte();
var
  sql: string;
  qry: Tquery;
  colorreporte:tcolor;
begin
  if codigoreporte <> '' then
  begin
    randomize;
    qry:=TQuery.create(self);
    qry.databasename:='BaseDato';
    qry.sql.clear;
    colorreporte:=RGB(random(128)+128,random(128)+128,128);
//    sql:='update reporte set colorcelda='+FloatToStr(Random(16711935))+' where codigoreporte='+codigoreporte;
    sql:='update reporte set colorcelda='+FloatToStr(colorreporte)+' where codigoreporte='+codigoreporte;
    qry.sql.add(sql);
    qry.ExecSQL;
    qry.free;
  end;
end;

procedure Tflistareportesasociados.bSalirClick(Sender: TObject);
begin
  Close;
end;

procedure Tflistareportesasociados.Circuito(codCircuito: string);
var
 sql:string;
 qry:Tquery;
begin
  sql:='Select nombrecircuito from circuito where codigocircuito='''+codCircuito+'''';
  if CodCircuito<>'' then
  begin
    qry:=Tquery.Create(Application);
    qry.DatabaseName:='BaseDato';
    qry.SQL.Text:=sql;
    qry.open;
    if not qry.IsEmpty then
      lcircuito.Caption:='Circuito: '+qry.fields[0].AsString;
    qry.close;
    qry.free;
  end;
end;

end.
