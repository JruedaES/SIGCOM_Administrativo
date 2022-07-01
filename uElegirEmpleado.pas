unit uElegirEmpleado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, RXDBCtrl, Db, DBTables,
  Mask, DBCtrls;

type
  TfElegirEmpleado = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    RxDBGrid1: TRxDBGrid;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qEmpleado: TQuery;
    dsEmpleado: TDataSource;
    qEmpleadoCODIGOEMPLEADO: TFloatField;
    qEmpleadoNOMBREEMPLEADO: TStringField;
    qEmpleadoDIRECCION: TStringField;
    qEmpleadoBARRIO: TStringField;
    qEmpleadoTELEFONO: TStringField;
    qEmpleadoCODIGOSUELDO: TStringField;
    qEmpleadoSUELDO: TFloatField;
    Panel5: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    BitBtnFiltrar: TBitBtn;
    BitBtnAnularFiltro: TBitBtn;
    Label4: TLabel;
    EdNombre1: TEdit;
    Label5: TLabel;
    EdNombre2: TEdit;
    EdCedula: TEdit;
    Label6: TLabel;
    LbRegistros: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtnFiltrarClick(Sender: TObject);
    procedure LimpiarFiltro;
    procedure BitBtnAnularFiltroClick(Sender: TObject);
    procedure RxDBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RxDBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 type
   THackDBGrid = class (TRxDBGrid);
var
  fElegirEmpleado: TfElegirEmpleado;
  TeclaShift:Boolean;
  ListaOrden:TStringList;
implementation

{$R *.DFM}

procedure TfElegirEmpleado.FormShow(Sender: TObject);
begin
  BitBtnFiltrarClick(nil);
end;

procedure TfElegirEmpleado.BitBtnFiltrarClick(Sender: TObject);
begin
   qEmpleado.Active := False;
   LimpiarFiltro;

   if EdNombre1.Text <> '' then
      qEmpleado.SQL.Insert(4,'AND (E.NOMBREEMPLEADO LIKE ''%'+EdNombre1.Text+'%'')');
   if EdNombre2.Text <> '' then
      qEmpleado.SQL.Insert(4,'AND (E.NOMBREEMPLEADO LIKE ''%'+EdNombre2.Text+'%'')');
   if EdCedula.Text<> '' then
      qEmpleado.SQL.Insert(4,'AND (E.CODIGOEMPLEADO = ' + EdCedula.Text + ')');

   qEmpleado.Active := True;
   LbRegistros.Caption:=IntToStr(qEmpleado.RecordCount)+' Empleados';
end;

procedure TfElegirEmpleado.LimpiarFiltro;
var
  i, nLineas:Short;
  Orden:String;
begin
  nLineas:=qEmpleado.SQL.Count - 1;
  Orden:=qEmpleado.SQL[nLineas];
  for i:=nLineas downto 4 do
    qEmpleado.SQL.Delete(i);
  qEmpleado.SQL.Add(Orden);  
end;

procedure TfElegirEmpleado.BitBtnAnularFiltroClick(Sender: TObject);
begin
  qEmpleado.Active := False;
  LimpiarFiltro;
  EdNombre1.Clear;
  EdNombre2.Clear;
  EdCedula.Clear;
  qEmpleado.Active := True;
//  lbTabla.Caption:=IntToStr(qMaterial.RecordCount)+' Materiales';
end;

procedure TfElegirEmpleado.RxDBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
begin
  pt:= RxDBGrid1.MouseCoord(x, y);

  if pt.y=0 then
   begin
      RxDBGrid1.Cursor:=crHandPoint;
      if Shift = [ssShift] then
          TeclaShift:=True
      else
          TeclaShift:=False;
    end
  else
    RxDBGrid1.Cursor:=crDefault;
end;

procedure TfElegirEmpleado.Label6MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
   Forma:TForm;
   Memo:TMemo;
   i:Integer;
   S:String;
begin
 if Shift = [ssShift,ssLeft] then
 begin
    Forma:=TForm.Create(Application);
    Forma.Position:=poScreenCenter;
    Forma.BorderStyle:=bsToolWindow;
    Forma.Width:=200;
    Forma.Height:=200;
    Memo:=TMemo.Create(Forma);
    Memo.Parent:=Forma;
    Memo.Top:=0;
    Memo.Left:=0;
    Memo.Align:=alClient;
    Forma.ShowModal;
    qEmpleado.Active := False;
    LimpiarFiltro;
    S:='';
    for i:=0 to Memo.Lines.Count - 1 do
    begin
      if Memo.Lines[i]<>'' then
         if i=Memo.Lines.Count - 1 then
            S:=S + Memo.Lines[i]
         else
            S:=S + Memo.Lines[i]+',';
    end;
    if Trim(S)<>'' then
       qEmpleado.SQL.Insert(4,'AND (E.CODIGOEMPLEADO IN ('+S+'))');
    Forma.Free;
    Forma:=nil;
    qEmpleado.Active := True;
    LbRegistros.Caption:=IntToStr(qEmpleado.RecordCount)+' Empleados';
 end;
end;

procedure TfElegirEmpleado.RxDBGrid1TitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}
var
  ListaTemp:TStringList;
  i,j:Integer;
  Encontrado:Boolean;
  Sort:String;
begin

  with RxDBGrid1.DataSource.DataSet do
  begin
    try
      RXDBGrid1.Columns[PreviousColumnIndex].title.Font.Style :=
      RxDBGrid1.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
    except
    end;
    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];

    Encontrado:=False;
    if PreviousColumnIndex = Column.Index then
       begin
         Encontrado:=True;
         ListaTemp:=TStringList.Create;
         for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=Column.Field.FieldName then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
              end;
          end;
          ListaTemp.Free;
        end
    else
      begin
          if (not TeclaShift) then
             ListaOrden.Clear;
      end;

    PreviousColumnIndex := Column.Index;
    if (ListaOrden.Count > 0) and (not Encontrado) then
     begin
        ListaTemp:=TStringList.Create;
        Encontrado:=False;
        for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=Column.Field.FieldName then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
                Encontrado:=True;
              end;
          end;
        if (not Encontrado) then
           ListaOrden.Add(Column.Field.FieldName+','+'ASC');
        ListaTemp.Free;
     end;

     if (ListaOrden.Count = 0) then
        ListaOrden.Add(Column.Field.FieldName+','+'ASC');

     qEmpleado.SQl.Delete(qEmpleado.SQl.Count - 1);
     Sort:='Order By ';
     for i:=0 to ListaOrden.Count - 1 do
       begin
          ListaTemp:=TStringList.Create;
          ListaTemp.CommaText:=ListaOrden[i];
          if i <> ListaOrden.Count - 1 then
             Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1] + ','
          else
             Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1];
          ListaTemp.Free;
       end;

     qEmpleado.Sql.Add(Sort);
     qEmpleado.Close;
     qEmpleado.Open;
  end;
end;

procedure TfElegirEmpleado.FormCreate(Sender: TObject);
begin
  ListaOrden:=TStringList.Create;
end;

procedure TfElegirEmpleado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ListaOrden.Free;
end;

end.
