unit uInfoElectricoCliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, dbtables, DBCtrls, Mask;

type
  TfInfoElectricoCliente = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    dblcbSubestacion: TDBLookupComboBox;
    dblcbCircuito: TDBLookupComboBox;
    dbeSubestacion: TDBEdit;
    dbeCircuito: TDBEdit;
    dbeTrafoDis: TDBEdit;
    dbeApoyo: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    dbeInterruptor: TDBEdit;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fInfoElectricoCliente: TfInfoElectricoCliente;

implementation

uses uReporte, uFIMPComunes, uFuncionSGD, uArbolInterruptores;

{$R *.DFM}

procedure TfInfoElectricoCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Assigned(Application.FindComponent('fReporte') as TForm) then
   fReporte.sbInfoElectrica.Enabled:=True;
  Action:=caHide;
end;

procedure TfInfoElectricoCliente.SpeedButton1Click(Sender: TObject);
var Query1:TQuery;
    Lista:TStringList;
begin
  if dbeTrafodis.Text <> '' then
  begin
    Lista:=TStringList.Create;
    Query1 := TQuery.Create(Application);
    Query1.DatabaseName := 'BaseDato';
    Query1.SQL.Add('SELECT DISTINCT A.CODIGOAPOYO, A.X, A.Y');
    Query1.SQL.Add('FROM NODOBT N, APOYO A');
    Query1.SQL.Add('WHERE N.CODIGOAPOYO = A.CODIGOAPOYO AND N.CODIGOTRAFODIS = '+dbeTrafodis.Text);
    Query1.Open;
    if Query1.RecordCount > 0 then
      QueryToList(Query1,Lista,11);

    Query1.Free;
    MostrarVistaLateralApoyos(Lista);
    Lista.Free;
  end;
end;

procedure TfInfoElectricoCliente.SpeedButton2Click(Sender: TObject);
begin
 if dbeTrafodis.Text <> '' then
   BuscarLineasTrafo([dbeTrafodis.Text],1);
end;

procedure TfInfoElectricoCliente.SpeedButton3Click(Sender: TObject);
var Lista:TStringList;
begin
  if dbeApoyo.Text <> '' then
  begin
    Lista:=TStringList.Create;
    Lista.Add(dbeApoyo.Text + ',0,0');
    MostrarVistaLateralApoyos(Lista);
    Lista.Free;
  end;
end;

procedure TfInfoElectricoCliente.SpeedButton4Click(Sender: TObject);
begin
  if dbeApoyo.Text<>'' then
    BuscarApoyo(dbeApoyo.Text,True);
end;

procedure TfInfoElectricoCliente.SpeedButton6Click(Sender: TObject);
var qDatos:TQuery;
begin
  if dbeInterruptor.Text<>'' then
  begin
    qDatos:=TQuery.Create(Application);
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Add('SELECT CODIGOAPOYO1 FROM INTERRUPTORDIS WHERE');
    qDatos.SQL.Add('CODIGOINTERRUPTORDIS = '+ dbeInterruptor.Text);
    qDatos.Open;
    BuscarApoyo(qDatos.Fields[0].AsString,True);
    qDatos.Free;
  end;
end;

procedure TfInfoElectricoCliente.SpeedButton5Click(Sender: TObject);
var qDatos:TQuery;
    Lista:TStringList;
begin
  if dbeInterruptor.Text<>'' then
  begin
    qDatos:=TQuery.Create(Application);
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Add('SELECT CODIGOAPOYO1 FROM INTERRUPTORDIS WHERE');
    qDatos.SQL.Add('CODIGOINTERRUPTORDIS = '+ dbeInterruptor.Text);
    qDatos.Open;
    Lista:=TStringList.Create;
    Lista.Add(qDatos.Fields[0].AsString + ',0,0');
    MostrarVistaLateralApoyos(Lista);
    Lista.Free;
    qDatos.Free;
  end;
end;

procedure TfInfoElectricoCliente.SpeedButton7Click(Sender: TObject);
var qDatos:TQuery;
    i:Integer;
begin
  if dbeCircuito.Text <> '' then
  begin
    FArbolInterruptores.CodigoCircuito:=dbeCircuito.Text;
    FArbolInterruptores.GenererarArbol;
    if dbeTrafodis.Text <> '' then
    for i:=0 to FArbolInterruptores.TreeView.Items.Count - 1 do
      if FArbolInterruptores.TreeView.Items[i].Text = dbeTrafodis.Text then
      begin
        FArbolInterruptores.TreeView.Items[i].Selected:=True;
        Break;
      end;  
    FArbolInterruptores.Show;
  end;
end;

end.
