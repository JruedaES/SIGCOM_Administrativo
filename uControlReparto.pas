unit uControlReparto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Db, Buttons, Grids, DBGrids, DBTables,
  ConsDll, uInformacionOriginal, uInformacionMedidor,
  ComCtrls, TeeProcs, TeEngine, Chart, DBChart, Series, uListaCritica, Math,
  uSeleccionarObservacion, ToolWin, ImgList, RXDBCtrl, DBClient,uBase, Spin,
  ExtDlgs;

type
  TFControlReparto = class(TFBase)
    Label30: TLabel;
    DBText3: TDBText;
    iLista: TImageList;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel11: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    qSede: TQuery;
    dsSede: TDataSource;
    Panel28: TPanel;
    Panel12: TPanel;
    DBGrid1: TDBGrid;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel29: TPanel;
    Panel10: TPanel;
    Panel13: TPanel;
    qAvanceGeneral: TQuery;
    dsAvanceGeneral: TDataSource;
    qAvanceMasivos: TQuery;
    dsAvanceMasivos: TDataSource;
    qAvanceAltos: TQuery;
    dsAvanceAltos: TDataSource;
    dsAvanceFacturas: TDataSource;
    qSedeCODIGOSEDEOPERATIVA: TStringField;
    qSedeNOMBRESEDEOPERATIVA: TStringField;
    qSedeCANTIDAD_SI: TFloatField;
    qSedeCANTIDAD_NO: TFloatField;
    qSedeTOTAL: TFloatField;
    qSedeTOTAL_SI: TFloatField;
    qTiempoReparto: TQuery;
    dsTiempoReparto: TDataSource;
    qTiempoRepartoTIEMPO: TFloatField;
    Panel24: TPanel;
    Label1: TLabel;
    cbRefrescar: TCheckBox;
    edMinutos: TSpinEdit;
    cCharAvancePorSede: TChart;
    HorizBarSeries1: THorizBarSeries;
    HorizBarSeries2: THorizBarSeries;
    cAvanceGeneralLecturas: TChart;
    PieSeries3: TPieSeries;
    qAvanceGeneralCANTIDAD_SI: TFloatField;
    qAvanceGeneralCANTIDAD_NO: TFloatField;
    qAvanceGeneralTOTAL: TFloatField;
    qAvanceGeneralPORCENTAJE_NO: TFloatField;
    qAvanceGeneralPORCENTAJE_SI: TFloatField;
    qAvanceFacturas: TQuery;
    qAvanceFacturasTOTAL_SI: TFloatField;
    qAvanceFacturasTOTAL_NO: TFloatField;
    qAvanceFacturasTOTAL: TFloatField;
    qAvanceAltosCANTIDAD_SI: TFloatField;
    qAvanceAltosCANTIDAD_NO: TFloatField;
    qAvanceAltosTOTAL: TFloatField;
    qAvanceMasivosCANTIDAD_SI: TFloatField;
    qAvanceMasivosCANTIDAD_NO: TFloatField;
    qAvanceMasivosTOTAL: TFloatField;
    qAvanceAltosPORCENTAJE_NO: TFloatField;
    qAvanceAltosPORCENTAJE_SI: TFloatField;
    qAvanceMasivosPORCENTAJE_NO: TFloatField;
    qAvanceMasivosPORCENTAJE_SI: TFloatField;
    qTopCincoAnomalias: TQuery;
    dsTopCincoAnomalias: TDataSource;
    qTopCincoAnomaliasCODIGOANOMALIAREPARTO: TFloatField;
    qTopCincoAnomaliasNOMBRE: TStringField;
    qTopCincoAnomaliasCANTIDAD: TFloatField;
    SavePictureDialog1: TSavePictureDialog;
    timer: TTimer;
    Panel27: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    pFacturasEntregadas: TPanel;
    Panel20: TPanel;
    Panel23: TPanel;
    pNoEntregadas: TPanel;
    Panel16: TPanel;
    Panel26: TPanel;
    pMinutos: TPanel;
    Label3: TLabel;
    Panel17: TPanel;
    Panel18: TPanel;
    Chart6: TChart;
    BarSeries1: TBarSeries;
    Panel8: TPanel;
    Panel9: TPanel;
    Chart1: TChart;
    PieSeries1: TPieSeries;
    Panel6: TPanel;
    Panel7: TPanel;
    Chart2: TChart;
    PieSeries2: TPieSeries;
    Panel19: TPanel;
    Panel25: TPanel;
    pPendientesAltos: TPanel;
    pTotalAltos: TPanel;
    pTotalMasivos: TPanel;
    pPendientesMasivos: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel30: TPanel;
    eFechaReparto: TEdit;
    Label2: TLabel;
    Panel31: TPanel;
    ToolBar1: TToolBar;
    tbFechaReparto: TToolButton;
    ToolButton3: TToolButton;
    tbFiltrar: TToolButton;
    tbSupervision: TToolButton;
    tbExportar: TToolButton;
    tbActualizar: TToolButton;
    function GetFechaHora: String;
    procedure tbSupervisionClick(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure tbFiltrarClick(Sender: TObject);
    procedure tbFechaRepartoClick(Sender: TObject);
    procedure cbRefrescarClick(Sender: TObject);
    procedure timerTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tbActualizarClick(Sender: TObject);
    procedure eFechaRepartoClick(Sender: TObject);


  private
    { Private declarations }

  public
   procedure Filtrar;
   procedure GraficaAvanceGeneral ;
   procedure GraficaAvancePorSede;
   procedure GraficaAvanceAltos;
   procedure GraficaAvanceMasivos;
   procedure GraficasTopCincoAnomalias;
   procedure GenerarTiempos;
   procedure AssignPanelImageToPicture(Panel: TPanel;FileName  : String);
  end;

var
  FControlReparto: TFControlReparto;
  TipoFacturacion, TipoFacturacionReactiva, TipoFacturacionDemanda: Integer;

implementation

uses uFormaFecha, uFuncionSGD, uODTPadre, uCambiarLectura,
  uGaleriaPreliminar, uFormaEspere, uSupervisionGeneralR;

{$R *.DFM}




function TFControlReparto.GetFechaHora: String;
begin
  fFormaFecha := TfFormaFecha.Create(Application);
  fFormaFecha.height := 291;
  if fFormaFecha.ShowModal = mrOk then
    result := DateTimetoStr(fFormaFecha.Date)
  else
    result := sFecha;
  fFormaFecha.Free;
end;



procedure TFControlReparto.Filtrar;
begin
qSede.close;
 qSede.ParamByName('fechareparto').AsString := eFechaReparto.Text;
 qSede.open;
fFormaEspere := TfFormaEspere.Create(Application);
   fFormaEspere.ProgressBar1.Max := 100;
   fFormaEspere.lbMotivo.Caption := 'Cargando...';
   fFormaEspere.Show;
   fFormaEspere.Refresh;


   if not qSede.IsEmpty THEN
   begin
 GraficaAvanceGeneral;
 fFormaEspere.ProgressBar1.Position := 40;
 fFormaEspere.Refresh;
 GraficaAvancePorSede;
  fFormaEspere.ProgressBar1.Position := 60;
   fFormaEspere.Refresh;
 GraficaAvanceAltos;
 GraficaAvanceMasivos;
  fFormaEspere.ProgressBar1.Position := 70;
   fFormaEspere.Refresh;
 GraficasTopCincoAnomalias;
 GenerarTiempos;
 end;
  fFormaEspere.ProgressBar1.Position := 100;
   fFormaEspere.Refresh;
   fFormaEspere.Free;
 end;

procedure TFControlReparto.GraficaAvanceGeneral;
var
  Color,Color2: Tcolor;
begin
   Color := rgb(139,217,217);
   Color2:= rgb(242,116,87);
   qAvanceGeneral.Close;
   qAvanceGeneral.ParamByName('FECHAREPARTO').AsString :=  eFechaReparto.Text;
   qAvanceGeneral.open;
   PieSeries3.Clear;

   PieSeries3.AddPie(qAvanceGeneralPORCENTAJE_NO.AsFloat,'Pendientes',Color2);
   PieSeries3.AddPie(qAvanceGeneralPORCENTAJE_SI.AsFloat,'Repartidas',Color);
  // pCuentasPendientesGeneral.Caption := qAvanceGeneralCANTIDAD_NO.AsString;
  // pCuentasLeidasGeneral.Caption :=   qAvanceGeneralCANTIDAD_SI.AsString;
end;
procedure TFControlReparto.GraficaAvanceMasivos;
var
  Color,Color2: Tcolor;
begin
   Color := rgb(139,217,217);
   Color2:= rgb(242,116,87);
   qAvanceMasivos.Close;
   qAvanceMasivos.ParamByName('FECHAREPARTO').AsString :=  eFechaReparto.Text;
   qAvanceMasivos.open;
   PieSeries1.Clear;

   PieSeries1.AddPie(qAvanceMasivosPORCENTAJE_NO.AsFloat,'Pendientes',Color2);
   PieSeries1.AddPie(qAvanceMasivosPORCENTAJE_SI.AsFloat,'Repartidas',Color);
   pTotalMasivos.Caption := qAvanceMasivosCANTIDAD_SI.AsString;
   pPendientesMasivos.Caption :=   qAvanceMasivosCANTIDAD_NO.AsString;
end;
procedure TFControlReparto.GraficaAvanceAltos;
var
  Color,Color2: Tcolor;
begin
   Color := rgb(139,217,217);
   Color2:= rgb(242,116,87);
   qAvanceAltos.Close;
   qAvanceAltos.ParamByName('FECHAREPARTO').AsString :=  eFechaReparto.Text;
   qAvanceAltos.open;
   PieSeries2.Clear;

   PieSeries2.AddPie(qAvanceAltosPORCENTAJE_NO.AsFloat,'Pendientes',Color2);
   PieSeries2.AddPie(qAvanceAltosPORCENTAJE_SI.AsFloat,'Repartidas',Color);
   if  qAvanceAltosCANTIDAD_SI.AsString <> '' then
   begin
   pTotalAltos.Caption := qAvanceAltosCANTIDAD_SI.AsString;
   end
   else  pTotalAltos.Caption := '0';
   if  qAvanceAltosCANTIDAD_NO.AsString <> '' then
   begin
   pPendientesAltos.Caption :=   qAvanceAltosCANTIDAD_NO.AsString;
   end
   else  pPendientesAltos.Caption := '0';
end;
procedure TFControlReparto.GraficaAvancePorSede;
var
  Color,Color2: Tcolor;
  i : Integer;
begin

  Color := rgb(139,217,217);
   Color2:= rgb(242,116,87);
   i := 100;
   HorizBarSeries1.CLEAR;
   HorizBarSeries2.Clear;

   qSede.Last;
  while not qSede.Bof do
  begin
   HorizBarSeries1.AddXY(100,i,qSedeNOMBRESEDEOPERATIVA.AsString+ ' - '+qSedeTOTAL_SI.AsSTring+' %' ,Color2);
   HorizBarSeries2.AddXY(qSedeTOTAL_SI.AsFloat,i,qSedeNOMBRESEDEOPERATIVA.AsString,Color);
  i := i+100;
    qSede.Prior;
  end;


end;
procedure TfControlReparto.GraficasTopCincoAnomalias;
var
  Color,Color2: Tcolor;
  i,j,Cantidad : Integer;
begin
    qTopCincoAnomalias.Close;
    qTopCincoAnomalias.ParamByName('FECHAREPARTO').AsString :=  eFechaReparto.Text;
    qTopCincoAnomalias.open;
   Color := rgb(139,217,217);
   Color2:= rgb(242,116,87);
   i := 100;
   j := 1;
   Cantidad := 0;
   BarSeries1.Clear;

  while not qTopCincoAnomalias.Eof do
  begin

  if j < 8 then
  begin
  BarSeries1.AddXY(i,qTopCincoAnomaliasCANTIDAD.AsInteger,qTopCincoAnomaliasNOMBRE.aSsTRING,Color);
  end;

  i := i+100;
  j := j +1;
    qTopCincoAnomalias.next;
  end;

end;

procedure TFControlReparto.GenerarTiempos;
begin
qAvanceFacturas.close;
qAvanceFacturas.ParamByName('fechareparto').AsString := eFechaReparto.text;
 qAvanceFacturas.open;
 pFacturasEntregadas.Caption := qAvanceFacturas.fieldbyname('TOTAL_SI').AsString;
 pNoEntregadas.caption := qAvanceFacturas.fieldbyname('TOTAL_NO').AsString;
  qTiempoReparto.close;
 qTiempoReparto.ParamByName('fechareparto').AsString := eFechaReparto.text;
 qTiempoReparto.open;
 pMinutos.Caption := qTiempoReparto.fieldbyname('tiempo').asstring + ' Min/Entrega';

end;
procedure TFControlReparto.tbSupervisionClick(Sender: TObject);
VAR
  slTemp, slTemp2: TStringList;
begin
  slTemp:= TStringList.Create;
  slTemp2:= TStringList.Create;


    if not (Trim(eFechaReparto.Text) = EmptyStr) then
    begin

    slTemp.Add('FECHA_PROGRAMADA_REPARTO='+eFechaReparto.Text);

    slTemp2.Add('Fecha de Reparto');
    end;


  fSupervisionGeneralR := TfSupervisionGeneralR.CreateByParametros(Application,slTemp);
  
  fSupervisionGeneralR.ListaRotulos.Assign(slTemp2);
  fSupervisionGeneralR.Show;

end;

procedure TFControlReparto.tbExportarClick(Sender: TObject);
begin
if SavePictureDialog1.Execute  then
AssignPanelImageToPicture(panel1,SavePictureDialog1.FileName);
end;
procedure TFControlReparto.AssignPanelImageToPicture(Panel: TPanel;FileName  : String);
var
 B : TBitmap;
 Image1 : Timage;
begin
 B := TBitmap.Create;
 Image1 := TImage.Create(nil);
 try
   B.Width := Panel.Width;
   B.Height := Panel.Height;
   B.Canvas.Lock;
   Panel.PaintTo(B.Canvas.Handle,0,0);
   B.Canvas.Unlock;
   Image1.Picture.Assign(B);
   Image1.Picture.SaveToFile(FileName);
  finally
    B.Free;
  end;
end;
procedure TFControlReparto.tbFiltrarClick(Sender: TObject);
begin
if eFechaReparto.Text <> '' then
begin
Filtrar;
end
else
begin
Application.MessageBox
      (Pchar('No se seleccionó una fecha de reparto, Asegúrese de haber seleccionado una fecha de reparto '),
      Pchar('Información'), MB_OK + MB_ICONERROR);
end
end;

procedure TFControlReparto.tbFechaRepartoClick(Sender: TObject);
begin
sFecha := '';
  sFecha := GetFechaHora;
  if sFecha <> '' then
    eFechaReparto.text := sFecha;
end;

procedure TFControlReparto.cbRefrescarClick(Sender: TObject);
begin
try
 StrToInT(edMinutos.Text);

 if NOT cbRefrescar.Checked then
timer.Enabled := False
else
begin
timer.Enabled := True;
timer.Interval := StrToInT(edMinutos.Text)*1000 ;
end;

except
 raise Exception.CreateFmt('El tiempo definidio no es valido, ingrese otro e intente nuevamente', [name]);
 cbRefrescar.Checked := False;
end;
end;

procedure TFControlReparto.timerTimer(Sender: TObject);
begin
 Filtrar;
end;

procedure TFControlReparto.FormShow(Sender: TObject);
begin
eFechaReparto.Text := DateToStr(trunc(Date));
end;

procedure TFControlReparto.tbActualizarClick(Sender: TObject);
begin
Filtrar;
end;

procedure TFControlReparto.eFechaRepartoClick(Sender: TObject);
begin
tbFechaRepartoClick(Sender);
end;

end.



