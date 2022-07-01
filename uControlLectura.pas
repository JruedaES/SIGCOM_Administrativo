unit uControlLectura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Db, Buttons, Grids, DBGrids, DBTables,
  ConsDll, uInformacionOriginal, uInformacionMedidor,
  ComCtrls, TeeProcs, TeEngine, Chart, DBChart, Series, uListaCritica, Math,
  uSeleccionarObservacion, ToolWin, ImgList, RXDBCtrl, DBClient,uBase, Spin,
  ExtDlgs;

type
  TfControlLectura = class(TFBase)
    Label30: TLabel;
    DBText3: TDBText;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    qSedeOperativa: TQuery;
    qSedeOperativaCODIGOSEDEOPERATIVA: TFloatField;
    qSedeOperativaNOMBRESEDEOPERATIVA: TStringField;
    qSedeOperativaCODIGOTIPOSEDE: TFloatField;
    dsSedeOperativa: TDataSource;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    cAvanceGeneralLecturas: TChart;
    PieSeries3: TPieSeries;
    Panel14: TPanel;
    Panel15: TPanel;
    cCharAvancePorSede: TChart;
    HorizBarSeries1: THorizBarSeries;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    RxDBGrid1: TRxDBGrid;
    qDatosSede: TQuery;
    dsDatosSede: TDataSource;
    Panel24: TPanel;
    Panel25: TPanel;
    cAvanceGeneralFacturacion: TChart;
    PieSeries1: TPieSeries;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Chart6: TChart;
    BarSeries1: TBarSeries;
    Panel29: TPanel;
    Panel30: TPanel;
    pTiempoPromedioMinutos: TPanel;
    Label5: TLabel;
    pCuentasPendientesGeneral: TPanel;
    Label6: TLabel;
    Panel33: TPanel;
    pCuentasLeidasGeneral: TPanel;
    Label7: TLabel;
    Panel35: TPanel;
    qDatosSedeCODIGOSEDEOPERATIVA: TFloatField;
    qDatosSedeNOMBRESEDEOPERATIVA: TStringField;
    qDatosSedeCANTIDAD_SI: TFloatField;
    qDatosSedeCANTIDAD_NO: TFloatField;
    qDatosSedeTOTAL: TFloatField;
    Series1: THorizBarSeries;
    qDatosSedeTOTAL_SI: TFloatField;
    Panel10: TPanel;
    pCuentasSinAnomalia: TPanel;
    Label4: TLabel;
    Panel21: TPanel;
    pCuentasAnomalias: TPanel;
    Label3: TLabel;
    Panel23: TPanel;
    qAvanceGeneral: TQuery;
    dsAvanceGeneral: TDataSource;
    qAvanceGeneralPORCENTAJE_NO: TFloatField;
    qAvanceGeneralPORCENTAJE_SI: TFloatField;
    qAvanceGeneralCANTIDAD_SI: TFloatField;
    qAvanceGeneralCANTIDAD_NO: TFloatField;
    qAvanceAnomaliaFacturacion: TQuery;
    dsAvanceAnomaliaFacturacion: TDataSource;
    qAvanceAnomaliaFacturacionCANTIDAD_NO: TFloatField;
    qAvanceAnomaliaFacturacionCANTIDAD_SI: TFloatField;
    qAvanceAnomaliaFacturacionTOTAL: TFloatField;
    qAvanceAnomaliaFacturacionPORCENTAJE_NO: TFloatField;
    qAvanceAnomaliaFacturacionPORCENTAJE_SI: TFloatField;
    qTopCincoAnomalias: TQuery;
    qTopCincoAnomaliasCODIGOANOMALIA: TStringField;
    qTopCincoAnomaliasDESCRIPCION: TStringField;
    qTopCincoAnomaliasCANTIDAD: TFloatField;
    iLista: TImageList;
    qPromedioEnMinutos: TQuery;
    Panel6: TPanel;
    eFechaLectura: TEdit;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    sbFechaReparto: TToolButton;
    BitBtnFiltrar: TToolButton;
    ToolButton2: TToolButton;
    ToolButton1: TToolButton;
    SpeedButton6: TToolButton;
    Panel7: TPanel;
    Label1: TLabel;
    cbRefrescar: TCheckBox;
    ToolButton4: TToolButton;
    Label2: TLabel;
    timer: TTimer;
    edMinutos: TSpinEdit;
    SavePictureDialog1: TSavePictureDialog;
    procedure sbFechaRepartoClick(Sender: TObject);
    function GetFechaHora: String;
    procedure FormCreate(Sender: TObject);
    procedure BitBtnFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure eSedeOperativaKeyPress(Sender: TObject; var Key: Char);
    procedure ToolButton2Click(Sender: TObject);
    procedure timerTimer(Sender: TObject);
    procedure cbRefrescarClick(Sender: TObject);
    procedure edMinutosKeyPress(Sender: TObject; var Key: Char);
    procedure SpeedButton6Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);


  private
    Procedure GraficaAvancePorSede;
    Procedure GraficaAvanceGeneral;
    Procedure GraficaAnomaliasFacturacion;
    Procedure GraficasTopCincoAnomalias;
    procedure FiltrarInformacion;
    procedure FiltrarInformacionItinerario;
    procedure CambiarTexto(ConSedeOperativa : Boolean);
    // Para sede opertiva //
    procedure GraficaAvancePorSedeItinerario;
    procedure AssignPanelImageToPicture(Panel : TPanel; FileName : String);

  public
    { Public declarations }


  end;

var
  fControlLectura: TfControlLectura;
  TipoFacturacion, TipoFacturacionReactiva, TipoFacturacionDemanda: Integer;

implementation

uses uFormaFecha, uFuncionSGD, uODTPadre, uCambiarLectura,
  uGaleriaPreliminar, uFormaEspere, uListaLecturas, uListaLecturasGeneral,
  uExpoItinerarios;

{$R *.DFM}


procedure TfControlLectura.sbFechaRepartoClick(Sender: TObject);
begin
sFecha := '';
  sFecha := GetFechaHora;
  if sFecha <> '' then
    eFechaLectura.text := sFecha;
end;

function TfControlLectura.GetFechaHora: String;
begin
  fFormaFecha := TfFormaFecha.Create(Application);
  fFormaFecha.height := 291;
  if fFormaFecha.ShowModal = mrOk then
    result := DateTimetoStr(fFormaFecha.Date)
  else
    result := sFecha;
  fFormaFecha.Free;
end;



procedure TfControlLectura.FormCreate(Sender: TObject);
begin
qSedeOperativa.open;
end;

procedure TfControlLectura.BitBtnFiltrarClick(Sender: TObject);
begin

  CambiarTexto(true);
  FiltrarInformacion;

end;

procedure TfControlLectura.FiltrarInformacionItinerario;
begin

end;

procedure TfControlLectura.GraficaAvancePorSedeItinerario;
begin

end;


procedure TfControlLectura.GraficaAvancePorSede;
var
  Color,Color2: Tcolor;
  i : Integer;
begin

  Color := rgb(139,217,217);
   Color2:= rgb(242,116,87);
   i := 100;
   HorizBarSeries1.CLEAR;
   Series1.Clear;

   qDatosSede.Last;
  while not qDatosSede.Bof do
  begin
   HorizBarSeries1.AddXY(100,i,qDatosSedeNOMBRESEDEOPERATIVA.AsString+ ' - '+qDatosSedeTOTAL_SI.AsSTring+' %' ,Color2);
   Series1.AddXY(qDatosSedeTOTAL_SI.AsFloat,i,qDatosSedeNOMBRESEDEOPERATIVA.AsString,Color);
  i := i+100;
    qDatosSede.Prior;
  end;


end;

procedure TfControlLectura.GraficaAvanceGeneral;
var
  Color,Color2: Tcolor;
begin
   Color := rgb(139,217,217);
   Color2:= rgb(242,116,87);
   qAvanceGeneral.Close;
   qAvanceGeneral.ParamByName('FECHAPROGRAMADA').AsString :=  eFechaLectura.Text;
   qAvanceGeneral.open;
   PieSeries3.Clear;

   PieSeries3.AddPie(qAvanceGeneralPORCENTAJE_NO.AsFloat,'Pendientes',Color2);
   PieSeries3.AddPie(qAvanceGeneralPORCENTAJE_SI.AsFloat,'Leidas',Color);
   pCuentasPendientesGeneral.Caption := qAvanceGeneralCANTIDAD_NO.AsString;
   pCuentasLeidasGeneral.Caption :=   qAvanceGeneralCANTIDAD_SI.AsString;
end;

procedure TfControlLectura.GraficaAnomaliasFacturacion;
var
  Color,Color2: Tcolor;
begin
   Color := rgb(139,217,217);
   Color2:= rgb(242,116,87);
   qAvanceAnomaliaFacturacion.Close;
   qAvanceAnomaliaFacturacion.ParamByName('FECHAPROGRAMADA').AsString :=  eFechaLectura.Text;
   qAvanceAnomaliaFacturacion.open;
   PieSeries1.Clear;

   PieSeries1.AddPie(qAvanceAnomaliaFacturacionPORCENTAJE_NO.AsFloat,'Sin Anomalia',Color);
   PieSeries1.AddPie(qAvanceAnomaliaFacturacionPORCENTAJE_SI.AsFloat,'Con Anomalia',Color2);
   pCuentasSinAnomalia.Caption := qAvanceAnomaliaFacturacionCANTIDAD_NO.AsString;
   pCuentasAnomalias.Caption :=   qAvanceAnomaliaFacturacionCANTIDAD_SI.AsString;

end;

procedure TfControlLectura.GraficasTopCincoAnomalias;
var
  Color,Color2: Tcolor;
  i,j,Cantidad : Integer;
begin
    qTopCincoAnomalias.Close;
    qTopCincoAnomalias.ParamByName('FECHAPROGRAMADA').AsString :=  eFechaLectura.Text;
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
  BarSeries1.AddXY(i,qTopCincoAnomaliasCANTIDAD.AsInteger,qTopCincoAnomaliasDESCRIPCION.aSsTRING,Color);
  end;

  i := i+100;
  j := j +1;
    qTopCincoAnomalias.next;
  end;

end;

procedure TfControlLectura.FormShow(Sender: TObject);
begin
qSedeOperativa.close;
qSedeOperativa.open;
eFechaLectura.Text := DateToStr(trunc(Date));
end;

procedure TfControlLectura.eSedeOperativaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', Char(VK_BACK), Char(VK_DELETE)]) then
    Key := #0;
end;

procedure TfControlLectura.ToolButton2Click(Sender: TObject);
VAR
  slTemp, slTemp2: TStringList;
begin
  slTemp:= TStringList.Create;
  slTemp2:= TStringList.Create;


    if not (Trim(eFechaLectura.Text) = EmptyStr) then
    begin
    slTemp.Add('Periodo='+eFechaLectura.Text);
    slTemp2.Add('Fecha Programada');
    end;


  fListaLecturasGeneral := TfListaLecturasGeneral.CreateByParametros(Application,slTemp);
  fListaLecturasGeneral.ListaRotulos.Assign(slTemp2);
  fListaLecturasGeneral.Show;
end;

procedure TfControlLectura.timerTimer(Sender: TObject);
begin
FiltrarInformacion;
end;

procedure TfControlLectura.FiltrarInformacion;
begin

   qDatosSede.close;
   qDatosSede.ParamByName('FECHAPROGRAMADA').AsString :=  eFechaLectura.Text;
   qDatosSede.open;

   fFormaEspere := TfFormaEspere.Create(Application);
   fFormaEspere.ProgressBar1.Max := 100;
   fFormaEspere.lbMotivo.Caption := 'Cargando...';
   fFormaEspere.Show;
   fFormaEspere.Refresh;


   if not qDatosSede.IsEmpty THEN
   begin
   GraficaAvanceGeneral;
      fFormaEspere.ProgressBar1.Position := 40;
   fFormaEspere.Refresh;
   GraficaAvancePorSede;
         fFormaEspere.ProgressBar1.Position := 60;
   fFormaEspere.Refresh;
   GraficaAnomaliasFacturacion;
         fFormaEspere.ProgressBar1.Position := 70;
   fFormaEspere.Refresh;
   GraficasTopCincoAnomalias;

   qPromedioEnMinutos.close;
   qPromedioEnMinutos.ParamByName('FECHAPROGRAMADA').AsString :=  eFechaLectura.Text;
   qPromedioEnMinutos.open;
   pTiempoPromedioMinutos.Caption := qPromedioEnMinutos.FieldByName('TIEMPO_EN_MINUTOS').AsString + ' Cuentas/Min';
   end;

   fFormaEspere.ProgressBar1.Position := 100;
   fFormaEspere.Refresh;
   fFormaEspere.Free;


end;

procedure TfControlLectura.cbRefrescarClick(Sender: TObject);
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

procedure TfControlLectura.edMinutosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', Char(VK_BACK), Char(VK_DELETE)]) then
    Key := #0;
end;

procedure TfControlLectura.SpeedButton6Click(Sender: TObject);
begin
FiltrarInformacion;
end;

procedure TfControlLectura.CambiarTexto(ConSedeOperativa: Boolean);
begin
 if ConSedeOperativa then
 begin
   Panel18.Caption := 'Avance por Sede Operativa';
   Panel16.Caption := 'Avance General de Lecturas Por Sede Operativa';
   Panel14.Caption := 'Avance General de Lecturas';
   Panel26.Caption := 'Cuentas Con Anomalia de Facturación';
   Panel28.Caption := 'Top de Anomalias de Lectura';
   Panel30.Caption := 'Tiempo Promedio de Lectura';
 end;
 
end;

procedure TfControlLectura.AssignPanelImageToPicture(Panel: TPanel;FileName  : String);
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


procedure TfControlLectura.ToolButton1Click(Sender: TObject);
begin
if SavePictureDialog1.Execute  then
AssignPanelImageToPicture(panel4,SavePictureDialog1.FileName);
end;

end.
