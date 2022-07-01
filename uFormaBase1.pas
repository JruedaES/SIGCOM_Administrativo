unit uFormaBase1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, Db, DBTables, Digisoft, DBCtrls, Buttons, Menus, Clipbrd,
  StdCtrls, Mask, Grids, DBGrids, ExtCtrls, UtdUtils, UtdNavigator,
  UtdGrid, ConsDll;

type
  TFFormaBase1 = class(TFBase)
    dSegControl1: TdSegControl;
    Panel1: TPanel;
    Panel2: TPanel;
    dbNavigator1: TdNavigator;
    tTabla: TDTable;
    dsBase: TDDataSource;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    lbTabla: TLabel;
    lbOrden: TLabel;
    sbImprimir: TSpeedButton;
    sbCerrar: TSpeedButton;
    procedure sbCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure tTablaBeforeDelete(DataSet: TDataSet);
    procedure tTablaAfterInsert(DataSet: TDataSet);
    procedure sbImprimirClick(Sender: TObject);
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
  FFormaBase1: TFFormaBase1;

implementation

uses uQRBase, uQRReporteSimple;

{$R *.DFM}


procedure TFFormaBase1.sbCerrarClick(Sender: TObject);
begin
  Close;
end;


procedure TFFormaBase1.Enviar;
Begin
End;

procedure TFFormaBase1.Buscar;
Begin
End;

procedure TFFormaBase1.BuscarSiguiente;
Begin
End;

procedure TFFormaBase1.CopyToClipBoard;
Begin
End;

procedure TFFormaBase1.PasteFromClipBoard;
Begin
End;

procedure TFFormaBase1.Imprimir;
Begin
End;

Procedure TFFormaBase1.BloqueAnterior;
Begin
End;

Procedure TFFormaBase1.BloqueSiguiente;
Begin
End;

Function TFFormaBase1.CanImprimir : Boolean;
Begin
   Result := True;
End;

Function TFFormaBase1.CanCopy : Boolean;
Begin
   Result := False;
End;

Function TFFormaBase1.CanPaste : Boolean;
Begin
  Result := False;
End;

Function TFFormaBase1.CanEnviar : Boolean;
Begin
   Result := False;
End;

Function TFFormaBase1.CanBuscar : Boolean;
Begin
   Result := True;
End;

Function TFFormaBase1.CanBuscarSiguiente : Boolean;
Begin
   Result := True;
End;


procedure TFFormaBase1.FormCreate(Sender: TObject);
begin
  inherited;
  TblBase := tTabla;
  dSegControl1.ProcManager := ProcManager;
  tTabla.Open;
end;

procedure TFFormaBase1.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if DBGrid1.SelectedIndex = 0 then
  begin
    tTabla.IndexFieldNames := 'CODIGO'+lbTabla.Caption;
    lbOrden.Caption := 'Ordenado por Código';
  end;
  if DBGrid1.SelectedIndex = 1 then
  begin
    tTabla.IndexFieldNames := 'NOMBRE'+lbTabla.Caption;
    lbOrden.Caption := 'Ordenado por Nombre';
  end;

end;

procedure TFFormaBase1.tTablaBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  if Application.MessageBox('Desea borrar el registro?', 'Eliminar', mb_YesNo + mb_DefButton2 + mb_IconQuestion) <> mrYes then
     Abort;
end;

procedure TFFormaBase1.tTablaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DBGrid1.SelectedIndex := 0;
end;

procedure TFFormaBase1.sbImprimirClick(Sender: TObject);
begin
  inherited;
  If DBGrid1.FieldCount = 2 then
  begin
    FQRReporteSimple := TFQRReporteSimple.Create(Application);
    FQRReporteSimple.qlOrden.Caption := lbOrden.Caption;
    FQRReporteSimple.QuickReport.DataSet := tTabla;
    FQRReporteSimple.QuickReport.ReportTitle:= Caption;
    FQRReporteSimple.QRDBText1.DataSet := tTabla;
    FQRReporteSimple.QRDBText1.DataField := DBGrid1.Columns[0].FieldName;
    FQRReporteSimple.QRDBText2.DataSet := tTabla;
    FQRReporteSimple.QRDBText2.DataField := DBGrid1.Columns[1].FieldName;
    FQRReporteSimple.Show;
    FQRReporteSimple.QuickReport.Preview;
  end;
end;

end.
