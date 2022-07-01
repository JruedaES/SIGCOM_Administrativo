unit uFormaBaseDoble1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, Db, DBTables, Digisoft, DBCtrls, Buttons, Menus, Clipbrd,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, UtdUtils, UtdNavigator,
  UtdGrid, ConsDll, ComCtrls;

type
  TFFormaBaseDoble = class(TFBase)
    dSegControl1: TdSegControl;
    Panel1: TPanel;
    Panel2: TPanel;
    dbNDatos: TdNavigator;
    tTabla: TDTable;
    dsBase: TDDataSource;
    Panel3: TPanel;
    Panel4: TPanel;
    lbTabla: TLabel;
    lbOrden: TLabel;
    sbImprimir: TSpeedButton;
    sbCerrar: TSpeedButton;
    PCDatos: TPageControl;
    Maestro: TTabSheet;
    Detalle: TTabSheet;
    DBGMaestro: TDBGrid;
    DBGDetalle: TDBGrid;
    dsDetalle: TDDataSource;
    tDetalle: TDTable;
    Panel5: TPanel;
    LDetalle: TLabel;
    LDato: TLabel;
    procedure sbCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGMaestroDblClick(Sender: TObject);
    procedure tTablaBeforeDelete(DataSet: TDataSet);
    procedure tTablaBeforePost(DataSet: TDataSet);
    procedure tTablaAfterInsert(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure PCDatosChange(Sender: TObject);
  private
    { Private declarations }
  Protected
  public
    Procedure Enviar; Override;
    Procedure Buscar; Override;
    Procedure BuscarSiguiente; Override;
    Procedure CopyToClipBoard; Override;
    Procedure PasteFromClipBoard; Override;
    Procedure Imprimir; Override;
    Procedure BloqueAnterior; Override;
    Procedure BloqueSiguiente; Override;
    Function CanPaste    : Boolean; Override;
    Function CanImprimir : Boolean; Override;
    Function CanCopy     : Boolean; Override;
    Function CanEnviar   : Boolean; Override;
    Function CanBuscar   : Boolean; Override;
    Function CanBuscarSiguiente : Boolean; Override;
  end;

var
  FFormaBaseDoble: TFFormaBaseDoble;

implementation

{$R *.DFM}


procedure TFFormaBaseDoble.sbCerrarClick(Sender: TObject);
begin
  Close;
end;


procedure TFFormaBaseDoble.Enviar;
Begin
End;

procedure TFFormaBaseDoble.Buscar;
Begin
End;

procedure TFFormaBaseDoble.BuscarSiguiente;
Begin
End;

procedure TFFormaBaseDoble.CopyToClipBoard;
Begin
End;

procedure TFFormaBaseDoble.PasteFromClipBoard;
Begin
End;

procedure TFFormaBaseDoble.Imprimir;
Begin
End;

Procedure TFFormaBaseDoble.BloqueAnterior;
Begin
End;

Procedure TFFormaBaseDoble.BloqueSiguiente;
Begin
End;

Function TFFormaBaseDoble.CanImprimir : Boolean;
Begin
   Result := True;
End;

Function TFFormaBaseDoble.CanCopy : Boolean;
Begin
   Result := False;
End;

Function TFFormaBaseDoble.CanPaste : Boolean;
Begin
  Result := False;
End;

Function TFFormaBaseDoble.CanEnviar : Boolean;
Begin
   Result := False;
End;

Function TFFormaBaseDoble.CanBuscar : Boolean;
Begin
   Result := True;
End;

Function TFFormaBaseDoble.CanBuscarSiguiente : Boolean;
Begin
   Result := True;
End;


procedure TFFormaBaseDoble.FormCreate(Sender: TObject);
begin
  inherited;
  TblBase := tTabla;
  dSegControl1.ProcManager := ProcManager;
  tTabla.Open;
end;

procedure TFFormaBaseDoble.DBGMaestroDblClick(Sender: TObject);
begin
  inherited;
  if DBGMaestro.SelectedIndex = 0 then
  begin
    tTabla.IndexFieldNames := 'CODIGO'+lbTabla.Caption;
    lbOrden.Caption := 'Ordenado por Código';
  end;
  if DBGDetalle.SelectedIndex = 1 then
  begin
    tTabla.IndexFieldNames := 'NOMBRE'+lbTabla.Caption;
    lbOrden.Caption := 'Ordenado por Nombre';
  end;

end;

procedure TFFormaBaseDoble.tTablaBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if Application.MessageBox('Desea borrar el registro?', 'Eliminar', mb_YesNo + mb_DefButton2 + mb_IconQuestion) <> mrYes then
     Abort;

end;

procedure TFFormaBaseDoble.tTablaBeforePost(DataSet: TDataSet);
begin
  inherited;
//  tTabla.Refresh;
end;

procedure TFFormaBaseDoble.tTablaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DBGMaestro.SelectedIndex := 0;
end;

procedure TFFormaBaseDoble.FormActivate(Sender: TObject);
begin
  inherited;
  LDetalle.Caption := 'Tabla: '+tDetalle.TableName;
  PCDatos.ActivePage:=Maestro;
  tTabla.Open;
  tDetalle.Open;
end;

procedure TFFormaBaseDoble.PCDatosChange(Sender: TObject);
begin
  If PCDatos.ActivePage=Detalle
  then dbNDatos.DataSource:=dsDetalle
  else dbNDatos.DataSource:=dsbase;
end;

end.
