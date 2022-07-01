unit uBuscarEmpleadoContratista;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, RXDBCtrl, Db, DBTables, Buttons, StdCtrls,
  Menus, Digisoft, AppEvent;

type
  TDockSide   = ( dsNone, dsLeft, dsRight, dsTop, dsBottom );
type
  TfBuscarEmpleadoContratista = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    dbgEmpleadoContratista: TRxDBGrid;
    SBFiltrar: TSpeedButton;
    pmOrdenar: TPopupMenu;
    Cedula1: TMenuItem;
    Nombre1: TMenuItem;
    CIA1: TMenuItem;
    Panel4: TPanel;
    bbCancelar: TBitBtn;
    bbAceptar: TBitBtn;
    tdMTApoyo: tdMemTable;
    tdMTApoyoNombreFiltro: TStringField;
    tdMTApoyoNombreZona: TStringField;
    tdMTApoyoNombreCiudad: TStringField;
    tdMTApoyoNombreBarrio: TStringField;
    tdMTApoyoNombreEstadoInfraestructura: TStringField;
    tdMTApoyoCODIGOAPOYO: TFloatField;
    tdMTApoyoCODIGOTIPOAPOYO: TStringField;
    tdMTApoyoCODIGOPLANCHA: TStringField;
    tdMTApoyoCODIGOZONA: TStringField;
    tdMTApoyoCODIGOCIUDAD: TStringField;
    tdMTApoyoCODIGOBARRIO: TStringField;
    tdMTApoyoDIRECCION: TStringField;
    tdMTApoyoTELEFONO: TStringField;
    tdMTApoyoTVCABLE: TStringField;
    tdMTApoyoPARABOLICA: TStringField;
    tdMTApoyoFibraOptica: TStringField;
    tdMTApoyoCODIGOESTRUCTURA: TFloatField;
    tdMTApoyoCODIGOESTADOINFRAESTRUCTURA: TStringField;
    tdMTApoyoFechaFiltro: TDateTimeField;
    tdMTApoyoApoyoDesde: TFloatField;
    tdMTApoyoApoyoHasta: TFloatField;
    tdMTApoyoListaApoyo: TStringField;
    tdMTApoyoNombreTipoApoyo: TStringField;
    tdMTApoyoCodigoArbol: TStringField;
    tdMTApoyoNombreEstructura: TStringField;
    tdMTApoyoNormalizada: TStringField;
    tdMTApoyoCodigoObservacion: TFloatField;
    tdMTApoyoNombreObservacion: TStringField;
    tdMTApoyoNombreEstructuraBase: TStringField;
    tdMTApoyoCODIGOCONTRATO: TStringField;
    tdMTApoyoCodigoPrioridadAveria: TStringField;
    tdMTApoyoCodigoPropietario: TStringField;
    tdMTApoyoNombrePropietario: TStringField;
    tdMTApoyoIdAlimentador: TStringField;
    tdMTApoyoIdElementoSerie: TStringField;
    tdMTApoyoCodigoNodoDesde: TIntegerField;
    tdMTApoyoCodigoNodoHasta: TIntegerField;
    tdMTApoyoCodigoSubestacion: TStringField;
    tdMTApoyoNOMBREPRIORIDADAVERIA: TStringField;
    tdMTApoyoCodigoCircuito: TStringField;
    tdMTApoyoNombreSubestacion: TStringField;
    tdMTApoyoNombreCircuito: TStringField;
    tdMTApoyoCodigoTipoIncidental: TStringField;
    tdMTApoyoNombreTipoIncidental: TStringField;
    AppEvents1: TAppEvents;
    dsEmpleadoContratista: TDataSource;
    qEmpleadoContratista: TQuery;
    procedure dbgEmpleadoContratistaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure dbgEmpleadoContratistaTitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBFiltrarClick(Sender: TObject);
    procedure Enviar(xx,aForm: TForm);
    procedure LimpiarFiltro;
    procedure dbgEmpleadoContratistaGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FDockSide: TDockSide;
  public
    { Public declarations }
    sCriterio : String;
    TeclaShift:Boolean;
    ListaOrden:TStringList;
    LeftClientB,TopClientB: integer;
    LeftClientR,TopClientR: integer;
    LeftClientT,TopClientT: integer;
    LeftClientL,TopClientL: integer;
    ListaEmpleados: TStringList;
    property DockSide: TDockSide read FDockSide write FDockSide;
    procedure filtrar(VerFiltro:boolean=true);
  end;

var
  fBuscarEmpleadoContratista: TfBuscarEmpleadoContratista;
implementation

uses uFiltroEmpleado;

{$R *.DFM}

procedure TfBuscarEmpleadoContratista.dbgEmpleadoContratistaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
begin
  pt:= dbgEmpleadoContratista.MouseCoord(x, y);

  if pt.y=0 then
   begin
      dbgEmpleadoContratista.Cursor:=crHandPoint;
      if Shift = [ssShift] then
          TeclaShift:=True
      else
          TeclaShift:=False;
    end
  else
    dbgEmpleadoContratista.Cursor :=crDefault;

end;

procedure TfBuscarEmpleadoContratista.FormCreate(Sender: TObject);
begin
  ListaOrden:=TStringList.Create;
  ListaEmpleados := TStringList.Create;
  FFiltroEmpleado:=TFFiltroEmpleado.Create(self);
end;

procedure TfBuscarEmpleadoContratista.dbgEmpleadoContratistaTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}
var
  ListaTemp:TStringList;
  i,j:Integer;
  Encontrado:Boolean;
  Sort:String;
begin

  with dbgEmpleadoContratista.DataSource.DataSet do
  begin
    try
      dbgEmpleadoContratista.Columns[PreviousColumnIndex].title.Font.Style :=
      dbgEmpleadoContratista.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
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

     qEmpleadoContratista.SQl.Delete(qEmpleadoContratista.SQl.Count - 1);
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

     qEmpleadoContratista.Sql.Add(Sort);
     qEmpleadoContratista.Close;
     qEmpleadoContratista.Open;
  end;

end;

procedure TfBuscarEmpleadoContratista.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 ListaOrden.Free;
end;

procedure TfBuscarEmpleadoContratista.SBFiltrarClick(Sender: TObject);
begin
  FFiltroEmpleado.LimpiarFiltro;
  filtrar;
end;


procedure TfBuscarEmpleadoContratista.Enviar(xx,aForm: TForm);
var
  d,l,t: integer;
begin

  d:=50;
  l:=aForm.left;
  t:=aForm.top;
  if      (abs(t-TopClientB) < d) and (abs(l-LeftClientB) < d) then DockSide:=dsBottom
  else if (abs(t-TopClientR) < d) and (abs(l-LeftClientR) < d) then DockSide:=dsRight
  else if (abs(t-TopClientT) < d) and (abs(l-LeftClientT) < d) then DockSide:=dsTop
  else if (abs(t-TopClientL) < d) and (abs(l-LeftClientL) < d) then DockSide:=dsLeft
  else DockSide:=dsNone;

  LeftClientB := xx.Left;
  TopClientB  := xx.Top+xx.Height;

  LeftClientR := xx.Left+xx.Width;
  TopClientR  := xx.Top;

  LeftClientT := xx.Left;
  TopClientT  := xx.Top-aForm.Height;

  LeftClientL := xx.Left-aForm.Width;
  TopClientL  := xx.Top;

  with aForm do
  case DockSide of
    dsBottom:  begin
                 if Left <> LeftClientB then Left := LeftClientB;
                 if Top  <> TopClientB  then Top  := TopClientB;
              end;
    dsRight:  begin
                 if Left <> LeftClientR then Left := LeftClientR;
                 if Top  <> TopClientR  then Top  := TopClientR;
              end;
    dsTop:    begin
                 if Left <> LeftClientT then Left := LeftClientT;
                 if Top  <> TopClientT  then Top  := TopClientT;
              end;
    dsLeft:   begin
                 if Left <> LeftClientL then Left := LeftClientL;
                 if Top  <> TopClientL  then Top  := TopClientL;
              end;
  end;
end;

procedure TfBuscarEmpleadoContratista.LimpiarFiltro;
var i,nLineas:Integer;
begin
  nLineas:=qEmpleadoContratista.SQL.Count - 3;
  if nLineas > 0 then
    for i:=1 to nLineas do
       qEmpleadoContratista.SQL.Delete(2);
end;

procedure TfBuscarEmpleadoContratista.dbgEmpleadoContratistaGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var Encontrado: Boolean;
    I: Integer;  
begin
   Encontrado := False;
   for I:=0 to ListaEmpleados.Count - 1 do
     if ListaEmpleados[I] = qEmpleadoContratista.FieldByName('CODIGOEMPLEADO').AsString then
     begin
       Encontrado := True;
       Break;
     end;
   if Encontrado then
   begin
     Background := clRed;
     AFont.Color := clWhite;
   end;
end;

procedure TfBuscarEmpleadoContratista.FormDestroy(Sender: TObject);
begin
  ListaEmpleados.Free;
  FFiltroEmpleado.free;
end;

procedure TfBuscarEmpleadoContratista.filtrar(VerFiltro: boolean);
var Orden:string;
 i:integer;
begin
  if VerFiltro then
     if FFiltroEmpleado.ShowModal<>mrOk then
       Exit;
  qEmpleadoContratista.Close;
  Orden:=qEmpleadoContratista.SQL[qEmpleadoContratista.SQL.Count - 1];
  LimpiarFiltro;
  qEmpleadoContratista.SQL.Delete(qEmpleadoContratista.SQL.Count - 1);
  for i:=0 to FFiltroEmpleado.ListaFiltro.Count - 1 do
  begin
     qEmpleadoContratista.SQL.Add('AND '+FFiltroEmpleado.ListaFiltro[i]);
  end;
  qEmpleadoContratista.SQL.Add(Orden);
  qEmpleadoContratista.Open;
end;

end.
 