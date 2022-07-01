unit uGenerarFormatosMtto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, Grids, DBGrids, RXDBCtrl, ComCtrls, StdCtrls, Spin, DBCtrls,
  Buttons, ExtCtrls, Menus, Db, DBTables, Digisoft, Mask, ToolEdit,
  QuickRpt, Tabs, Tabnotbk, ActnList;

type
  TFGenerarFormatosMtto = class(TFBase)
    pmMeses: TPopupMenu;
    pSuperior: TPanel;
    Bevel2: TBevel;
    chbBloquearProgramacion: TCheckBox;
    btnGenerarFormato: TButton;
    GroupBox1: TGroupBox;
    DBLCBFormato: TDBLookupComboBox;
    qFormato: TQuery;
    DataSource1: TDataSource;
    UpdateSQL1: TUpdateSQL;
    qFormatoCODIGOFORMATOMTTO: TFloatField;
    qFormatoNOMBREFORMATOMTTO: TStringField;
    qEncabezadoFormato: TQuery;
    EncabezadoFormato: TDataSource;
    UpdateSQL2: TUpdateSQL;
    DBText1: TDBText;
    DBText2: TDBText;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    Query1: TQuery;
    DataSource2: TDataSource;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    ActionList1: TActionList;
    TabControl1: TTabControl;
    PageControl1: TPageControl;
    Header1: THeader;
    TabbedNotebook1: TTabbedNotebook;
    TabSet1: TTabSet;
    TabControl2: TTabControl;
    TabControl3: TTabControl;
    ListBox1: TListBox;
    Button1: TButton;
    DBText3: TDBText;
    Label2: TLabel;
   // label5:tlabel;

    procedure FormDestroy(Sender: TObject);
    procedure btnGenerarFormatoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
     ListaEncabezadoFormato:TStringList;

  public
    { Public declarations }
  end;

var
  FGenerarFormatosMtto: TFGenerarFormatosMtto;

implementation

uses uQRProgramacionEmpleado, uQRProgramacionGrupo,Qrctrls, uQRProgramacionGrupoEmpleado,
  ConsDll;

{$R *.DFM}


procedure TFGenerarFormatosMtto.btnGenerarFormatoClick(Sender: TObject);
var
  NombreFormato:String;
  Prueba:String;
  Codigo,i: Integer;
  Query:TQuery;
//  DataSet:TDataSet;
//  DataSource:TDataSource;
  ListaEncabezado:TStringlist;

//  dbGrid2:Tdbgrid;
begin
  inherited;
//  DBGRID2.visible:=true;

  ListaEncabezado := TStringList.Create;
  NombreFormato:= DBLCBFormato.keyvalue;
  showmessage(NOMBREFORMATO);
  showmessage('ENTRA');
  Query:= TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';

  ListaEncabezado.Capacity:=3;
  Codigo:= Query.SQL.Add('SELECT CODIGOFORMATOMTTO');
  Query.SQL.Add('FROM HVE_FORMATOMTTO');
  Query.SQL.Add('WHERE NOMBREFORMATOMTTO = '''+NombreFormato+'''');
  Query.ExecSQL;
  Query.close;
  QUERY.SQL.Clear;

  Query.SQL.Add('SELECT E.NOMBRECAMPO,E.CODIGOFORMATOMTTO');
  Query.SQL.Add('FROM HVE_ENCABEZADOFORMATO E,HVE_FORMATOMTTO F');
  Query.SQL.Add('WHERE E.CODIGOFORMATOMTTO=F.CODIGOFORMATOMTTO');
  Query.SQL.Add('AND F.CODIGOFORMATOMTTO = '''+inttostr(codigo)+'''');
  Query.ExecSQL;

  while not query.Eof do
  begin
//  EtiquetaEncabezado:TLabel;
//  EtiquetaEncabezado:= TLabel.Create;

  end

  //Selecciona el numero de secciones por formato y genera las pestañas
  //Selecciona las columnnas para cada seccion de la tabla de datos



//  DataSource1.Dataset:= query.fieldbyname('NOMBRECAMPO').AsString;
//  DataSet.FieldByName('nombrecampo').AsInteger:=query.Fields[0].asInteger+1;

//  showmessage(query.fields[0].AsString);
//  showmessage(inttostr(ListaEncabezado.Count));
//  for i:=0 to 1 do
  //begin
//    ListaEncabezado.add(query.fields[0].AsString);
//  end;
//      showmessage(inttostr(ListaEncabezado.Count));
{  while not Query.Eof do
  begin
  ListaEncabezado.add(query.fields[i].AsString);
//  ListaEncabezado.add(query.fieldbyName('NOMBRECAMPO').AsString);
  // dbGrid1.Columns.items[i]:=Query.fieldByName('NOMBRECAMPO').AsString;
  inc(i);
  Query.next;
  end;
 }
//  showmessage('Lista');
//  showmessage(inttostr(ListaEncabezado.Count));
{  for i:=1 to ListaEncabezado.Count do
  begin
    showmessage(ListaEncabezado[i]);
  }
//    inc(i);
  end;

{   while not Qry.Eof do
                   begin
                     PunteroTemporal^.Panel.Height:= PunteroTemporal^.Panel.Height + 16;
                     CodigoTarea:= Qry.FieldByName('CODIGOTAREA').AsFloat;
                    // NombreTarea:= Qry.FieldByName('NOMBRETAREA').AsString;
                      NombreTarea:= Qry.FieldByName('CODIGODESC').AsString;
                     HoraTarea:= Qry.FieldByName('HORA').AsString;
                     odtopera:= Qry.fieldByName('CODIGOODTOPERA').AsInteger;
                     GenerarPanelActividad:= TIdTarea.Crear(PunteroTemporal^.Panel,FilaPanel,odtopera,CodigoTarea,NombreTarea,HoraTarea);
                     FilaPanel:= FilaPanel + 1;
                     Qry.Next;
                   end;
                 Qry.Close;

 }




{  Query.SQL.ADD('SELECT NOMBRECAMPO FROM HVE_ENCABEZADOFORMATO');
  Query.SQL.ADD('WHERE CODIGOFORMATOMTTO =' + ('SELECT CODIGOFORMATOMTTO FROM HVE_FORMATOMTTO'));
  Query.SQL.ADD('WHERE NOMBREFORMATOMTTO='''+Prueba+'''');
}
//  Query.ExecSQL;
//  Query.Free;
//end;


procedure TFGenerarFormatosMtto.FormDestroy(Sender: TObject);
begin
  ListaEncabezadoFormato.Free;
end;
procedure TFGenerarFormatosMtto.Button1Click(Sender: TObject);
var
DBText3: TDBText;
label4:tlabel;
DBText4:TDBText;
begin
  inherited;
    label4:=tlabel.create(Application);
    label4.enabled:=true;
    label4.Left:=130;
    label4.Top:=88;
    label4.Width:=60;
    label4.Height:=25;
    label4.Caption:='LABEL';
    {dbtext4 :=dbtext4.create(Application);
    dbtext4.enabled:=true;
    dbtext4.Left:=130;
    dbtext4.Top:=88;
    dbtext4.Width:=60;
    dbtext4.Height:=25;
   }




end;

end.

