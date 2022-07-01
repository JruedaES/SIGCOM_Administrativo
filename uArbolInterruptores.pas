unit uArbolInterruptores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, Db, DBTables, ImgList, Buttons, StdCtrls, DBCtrls,
  ExtCtrls;

type
  TFArbolInterruptores = class(TForm)
    TreeView: TTreeView;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    sbBuscarCartografia: TSpeedButton;
    Panel1: TPanel;
    DBText1: TDBText;
    qDireccion: TQuery;
    dsDireccion: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoCircuito:string;
    procedure GenererarArbol;

  end;

var
  FArbolInterruptores: TFArbolInterruptores;

implementation

uses uFIMPComunes;

{$R *.DFM}

procedure TFArbolInterruptores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caHide;
end;

procedure TFArbolInterruptores.GenererarArbol;
var qDatos, qCamino:TQuery;
    Nodo:TTreeNode;
    i,j:Integer;
    s:string;
begin
  TreeView.Items.Clear;
  qDatos:=Tquery.Create(Application);
  qDatos.DatabaseName:='BaseDato';
  qDatos.SQL.Add('SELECT ID, NOMBRE FROM TREENODES WHERE CODIGOCIRCUITO = ''' + CodigoCircuito + ''' AND TIPO = ''TF''');
  qDatos.SQL.Add('AND (NOMBRE LIKE ''SW%'' OR NOMBRE LIKE ''TF:%'') ORDER BY IZQUIERDA');
  qDatos.Open;
  qCamino:=TQuery.Create(Application);
  qCamino.DatabaseName:='BaseDato';
  qCamino.SQL.Add('SELECT PAPA.NOMBRE FROM TREENODES PAPA, TREENODES NODO WHERE');
  qCamino.SQL.Add('(PAPA.IZQUIERDA <= NODO.DERECHA) AND');
  qCamino.SQL.Add('(PAPA.DERECHA >= NODO.IZQUIERDA) AND');
  qCamino.SQL.Add('(NODO.CODIGOCIRCUITO = ''' + CodigoCircuito + ''') AND');
  qCamino.SQL.Add('(NODO.TIPO = ''TF'') AND');
  qCamino.SQL.Add('(PAPA.CODIGOCIRCUITO = ''' + CodigoCircuito + ''') AND');
  qCamino.SQL.Add('(PAPA.TIPO = ''TF'') AND');
  qCamino.SQL.Add('(NODO.ID = :ID) AND');
  qCamino.SQL.Add('(PAPA.NIVEL <= NODO.NIVEL) AND');
  qCamino.SQL.Add('(PAPA.NIVEL <> 0) AND');
  qCamino.SQL.Add('(PAPA.NOMBRE LIKE ''SW%'' OR  PAPA.NOMBRE LIKE ''TF%'') AND');
  qCamino.SQL.Add('(PAPA.NOMBRE <> NODO.NOMBRE)');
  qCamino.SQL.Add('ORDER BY PAPA.IZQUIERDA DESC');
  i:=0;
  while not qDatos.Eof do
  begin
    if i <> 0 then
    begin
      qCamino.Close;
      qCamino.Params[0].AsString:=qDatos.FieldByName('ID').AsString;
      qCamino.Open;
      for j:=0 to TreeView.Items.Count - 1 do
        if TreeView.Items[j].Text = qCamino.Fields[0].AsString then
          begin
            Nodo:=TreeView.Items[j];
            Nodo:=TreeView.Items.AddChild(Nodo,qDatos.FieldByName('NOMBRE').AsString);
            if Pos('SW',Nodo.Text) > 0 then
              Nodo.ImageIndex:=0
            else
              Nodo.ImageIndex:=1;
            Nodo.SelectedIndex:=Nodo.ImageIndex;
            Break;
          end;
    end
    else
    begin
      Nodo:=TreeView.Items.Add(nil,qDatos.FieldByName('NOMBRE').AsString);
      Nodo.ImageIndex:=0;
    end;  

    Inc(i);  
    qDatos.Next;
  end;
  for j:=0 to TreeView.Items.Count - 1 do
  begin
    Nodo:=TreeView.Items[j];
    s:=Nodo.Text;
    System.Delete(s,1,4);
    Nodo.Text:=s;
  end;
end;

procedure TFArbolInterruptores.TreeViewChange(Sender: TObject;
  Node: TTreeNode);
var qApoyo:TQuery;  
begin

    qApoyo:=TQuery.Create(Application);
    qApoyo.DatabaseName:='BaseDato';
    qApoyo.SQL.Add('SELECT CODIGOAPOYO1 FROM ');
    if Node.SelectedIndex = 0 then
      qApoyo.SQL.Add('INTERRUPTORDIS WHERE CODIGOINTERRUPTORDIS = ' + Node.Text)
    else
      qApoyo.SQL.Add('TRAFODIS WHERE CODIGOTRAFODIS = ' + Node.Text);

    qApoyo.Open;
    if (sbBuscarCartografia.Down) and (qApoyo.Fields[0].AsString <> '') then
      BuscarApoyo(qApoyo.Fields[0].AsString,True);

    qDireccion.Close;
    qDireccion.Params[0].AsString:=qApoyo.Fields[0].AsString;
    qDireccion.Open;
    qApoyo.Free;

end;

end.
