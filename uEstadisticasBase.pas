unit uEstadisticasBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  TeEngine, Series, ExtCtrls, TeeProcs, Chart, mxgraph, Grids, mxgrid,
  mxpivsrc, mxDB, Db, DBTables, mxtables, mxstore, StdCtrls, Printers,
  Buttons, utnToolbar, EditChar, Menus, Spin;

type
  TfEstadisticasBase = class(TForm)
    DecisionCube1: TDecisionCube;
    DecisionSource1: TDecisionSource;
    Splitter1: TSplitter;
    ToolPanel1: TToolPanel;
    sbSalir: TSpeedButton;
    sbDatos: TSpeedButton;
    sbEditar: TSpeedButton;
    Shape1: TShape;
    Shape2: TShape;
    DecisionGraph1: TDecisionGraph;
    sb3D: TSpeedButton;
    sbLeyenda: TSpeedButton;
    sbImprimir: TSpeedButton;
    sbExportar: TSpeedButton;
    pmImprimir: TPopupMenu;
    SaveDialog1: TSaveDialog;
    ImprimirGrfico1: TMenuItem;
    ImprimirReporte1: TMenuItem;
    N1: TMenuItem;
    pOpcionesReporte: TPanel;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    SpinEdit1: TSpinEdit;
    Bevel1: TBevel;
    BBAceptar: TBitBtn;
    BBCancelar: TBitBtn;
    pmExportar: TPopupMenu;
    Datos1: TMenuItem;
    Grfico1: TMenuItem;
    PanelFiltro: TPanel;
    Splitter2: TSplitter;
    pIzq: TPanel;
    MemoRotulos1: TMemo;
    MemoPuntos1: TMemo;
    MemoDatos1: TMemo;
    pDer: TPanel;
    MemoDatos2: TMemo;
    MemoPuntos2: TMemo;
    MemoRotulos2: TMemo;
    Panel4: TPanel;
    sbVerFiltro: TSpeedButton;
    DecisionPivot1: TDecisionPivot;
    DecisionGrid1: TDecisionGrid;
    qEstadistica: TQuery;
    DecisionQuery1: TDecisionQuery;
    procedure sbEditarClick(Sender: TObject);
    procedure sbDatosClick(Sender: TObject);
    procedure sbSalirClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sb3DClick(Sender: TObject);
    procedure sbLeyendaClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure ImprimirGrfico1Click(Sender: TObject);
    procedure ImprimirReporte1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DecisionSource1SummaryChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure BBAceptarClick(Sender: TObject);
    procedure BBCancelarClick(Sender: TObject);
    procedure Datos1Click(Sender: TObject);
    procedure Grfico1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbVerFiltroClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
//    procedure SpeedButton2Click(Sender: TObject);
  private
    fLastWidth: integer;
    procedure UpdateCaption;
    property LastWidth:integer read fLastWidth write fLastWidth;
  public
    pivot_summary: string;
    ListaRotulos, ListaDatos : TStringList;
    { Public declarations }
  end;

var
  fEstadisticasBase: TfEstadisticasBase;

implementation

uses uQREstadisticasGrafico, uqrEstadisticaBase;



{$R *.DFM}

procedure TfEstadisticasBase.UpdateCaption;
begin
  with DecisionCube1 do
   begin
     DecisionGraph1.Title.Text.Clear;
     DecisionGraph1.Title.Text.Add(GetSummaryName(CurrentSummary));
   end;
//    self.Caption := Application.Title + ' - ' + GetSummaryName(CurrentSummary);
end;

procedure TfEstadisticasBase.sbEditarClick(Sender: TObject);
begin
  EditChart(Self,DecisionGraph1);
end;

procedure TfEstadisticasBase.sbDatosClick(Sender: TObject);
begin
  DecisionPivot1.visible:=sbDatos.Down;
end;

procedure TfEstadisticasBase.sbSalirClick(Sender: TObject);
begin
 close;
end;

procedure TfEstadisticasBase.FormResize(Sender: TObject);
begin
  try
    DecisionPivot1.width:=Round(DecisionPivot1.width*ClientWidth/LastWidth);
    LastWidth:=ClientWidth;
    pIzq.Width:=ClientWidth div 2;
  except  
  end;
end;

procedure TfEstadisticasBase.FormShow(Sender: TObject);
begin
  LastWidth:=ClientWidth;
end;

procedure TfEstadisticasBase.sb3DClick(Sender: TObject);
begin
 DecisionGraph1.View3D:=sb3D.Down;
end;

procedure TfEstadisticasBase.sbLeyendaClick(Sender: TObject);
begin
 DecisionGraph1.Legend.Visible:=sbLeyenda.Down;
end;

procedure TfEstadisticasBase.sbImprimirClick(Sender: TObject);
var punto:TPoint;
begin
 punto:=ToolPanel1.ClientToScreen(Classes.Point(sbImprimir.Left, sbImprimir.top));
 pmImprimir.Popup(punto.x+10, punto.y+10);
end;

procedure TfEstadisticasBase.sbExportarClick(Sender: TObject);
var punto:TPoint;
begin
 punto:=ToolPanel1.ClientToScreen(Classes.Point(sbExportar.Left, sbExportar.top));
 pmExportar.Popup(punto.x+10, punto.y+10);
end;

procedure TfEstadisticasBase.ImprimirGrfico1Click(Sender: TObject);
var
 rAlto:real;
begin
  fQREstadisticasGrafico := TfQREstadisticasGrafico.Create(Application);
//  DecisionGraph1.Color:=clWhite;
  DecisionGraph1.SaveToMetafileEnh(ExtractFilePath(paramStr(0))+'temp.emf');
//  DecisionGraph1.Color:=clBtnFace;
  fQREstadisticasGrafico.qriGrafico.Picture.LoadFromFile(ExtractFilePath(paramStr(0))+'temp.emf');
  rAlto:=DecisionGraph1.Height/DecisionGraph1.Width;
  with fQREstadisticasGrafico do
  begin
  QuickReport.ReportTitle := self.Caption;
{  if rAlto>=1
   then
     begin
     QuickReport.Page.Orientation:=poPortrait;
     QRShape1.Width:=430;
     QRShape5.Width:=430;
     TitleBand1.Height:=522;
     qriGrafico.Height:=400;
     qriGrafico.Width :=380;
     qriGrafico.Left  :=25;
     qriGrafico.Top   :=100;
     end
   else
     begin
     QuickReport.Page.Orientation:=poLandScape;
     QRShape1.Width:=577;
     QRShape5.Width:=577;
     TitleBand1.Height:=380;
     qriGrafico.Height:=295;
     qriGrafico.Width :=430;
     qriGrafico.Left  :=75;
     qriGrafico.Top   :=80;
     end;
}  QuickReport.Show;
  QuickReport.Preview;
  end;
end;

procedure TfEstadisticasBase.ImprimirReporte1Click(Sender: TObject);
begin
  fqrEstadisticaBase:=TfqrEstadisticaBase.Create(Application);
  fqrEstadisticaBase.pfEstadisticasBase^ := (self as TfEstadisticasBase);
  with fqrEstadisticaBase do
  begin
    QuickReport.ReportTitle := self.Caption;
    CreateLabels;
    QuickReport.Show;
    QuickReport.Preview;
  end;
//  pOpcionesReporte.Show;
end;

procedure TfEstadisticasBase.FormCreate(Sender: TObject);
begin
  ListaRotulos := TStringList.Create;
  ListaDatos := TStringList.Create;
  with DecisionGrid1 do
  begin
    SpinEdit1.Value := DefaultColWidth;
    pivot_summary := Cells[-1,RowCount-FixedRows-1];
  end;
end;

procedure TfEstadisticasBase.DecisionSource1SummaryChange(Sender: TObject);
begin
  UpdateCaption;
end;


procedure TfEstadisticasBase.RadioGroup1Click(Sender: TObject);
begin
  SpinEdit1.Enabled := RadioGroup1.ItemIndex = 1;
end;

procedure TfEstadisticasBase.BBAceptarClick(Sender: TObject);
begin
  pOpcionesReporte.Hide;
  fqrEstadisticaBase:=TfqrEstadisticaBase.Create(Application);
  fqrEstadisticaBase.pfEstadisticasBase^ := (self as TfEstadisticasBase);
  with fqrEstadisticaBase do
  begin
    QuickReport.ReportTitle := self.Caption;
    CreateLabels;
    QuickReport.Show;
    QuickReport.Preview;
  end;
end;

procedure TfEstadisticasBase.BBCancelarClick(Sender: TObject);
begin
 pOpcionesReporte.Hide;
end;

procedure TfEstadisticasBase.Datos1Click(Sender: TObject);
var i,j:integer;
    Lista, Linea : TStringList;
begin
  if not(SaveDialog1.execute) then exit;
  Try
  Lista:=TStringList.Create;
  Linea:=TStringList.Create;
  for i:=-(DecisionGrid1.FixedRows) to (DecisionGrid1.RowCount-DecisionGrid1.FixedRows-1) do
    begin
    Linea.Clear;
    for j:=-(DecisionGrid1.FixedCols) to (DecisionGrid1.ColCount-DecisionGrid1.FixedCols-1)
        do Linea.Add(DecisionGrid1.Cells[j,i]);
    Lista.add(Linea.CommaText);
    end;
  Lista.SaveToFile(SaveDialog1.FileName);
  finally
  Lista.Free;
  Linea.Free;
  end;
end;

procedure TfEstadisticasBase.Grfico1Click(Sender: TObject);
begin
   DecisionGraph1.CopyToClipBoardMetafile(True);
end;

procedure TfEstadisticasBase.FormDestroy(Sender: TObject);
begin
  ListaRotulos.Free;
  ListaDatos.Free;
end;

procedure TfEstadisticasBase.sbVerFiltroClick(Sender: TObject);
begin
  if PanelFiltro.Height > 0
  then PanelFiltro.Height := 0
  else FormActivate(nil);
end;

procedure TfEstadisticasBase.FormActivate(Sender: TObject);
var i, n, m, alto : integer;
begin
   MemoRotulos1.Lines.Clear;
   MemoRotulos2.Lines.Clear;
   MemoDatos1.Lines.Clear;
   MemoDatos2.Lines.Clear;
   MemoPuntos1.Lines.Clear;
   MemoPuntos2.Lines.Clear;

   n := (ListaDatos.Count div 2);
   m := (ListaDatos.Count mod 2);
   for i:=0 to n+m-1 do
   begin
     MemoRotulos1.Lines.Add(ListaRotulos[i]);
     MemoDatos1.Lines.Add(ListaDatos[i]);
     MemoPuntos1.Lines.Add(':');
   end;
   for i:=n+m to ListaDatos.Count-1 do
   begin
     MemoRotulos2.Lines.Add(ListaRotulos[i]);
     MemoDatos2.Lines.Add(ListaDatos[i]);
     MemoPuntos2.Lines.Add(':');
   end;
   PanelFiltro.Height := 21+(18*(n+m));
   FormResize(nil);
end;

{procedure TfEstadisticasBase.SpeedButton2Click(Sender: TObject);
var i,j : integer;
begin
 for i := DecisionGraph1.SeriesCount-1 downto  0 do
    if DecisionGraph1.Series[i].Active then
    begin
       for j:=1 to DecisionGraph1.Series[i].Count-1 do
          DecisionGraph1.Series[j].ValueColor[j] := clBlue;
    end;
end;
 }
end.
