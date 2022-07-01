//***************************************************************************
//                       Módulo Lecturas
//                    Listado de Lecturas
//***************************************************************************
unit uSupervisionGeneralR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls, Mask, RXSplit,
  Menus, MPlayer, ImgList,Registry,ComCtrls,Math, Spin, uAuditoriaSupervisor,
  ToolWin;

type
  TfSupervisionGeneralR = class(TFdSgdListaBase)
    dsListaPadre: TDataSource;
    dsListaLectura: TDataSource;
    Panel5: TPanel;
    dbgListaHijas: TRxDBGrid;
    RxSplitter1: TRxSplitter;
    pmImprimir: TPopupMenu;
    MaterialesConsumidos: TMenuItem;
    ListadodeHorasExtras1: TMenuItem;
    ListadodeOdts1: TMenuItem;
    pmOrdenar: TPopupMenu;
    ListadodeViticosCausados1: TMenuItem;
    ListadodeAuxiliosCausados1: TMenuItem;
    qMaterialesODT: TQuery;
    qMaterialesODTCODIGOMATERIAL: TFloatField;
    qMaterialesODTNombreMaterial: TStringField;
    qMaterialesODTNombreUnidad: TStringField;
    pmExportar: TPopupMenu;
    ExportarListaOdtPadres1: TMenuItem;
    qMaterialesODTCANTIDADSOLICITADA: TFloatField;
    qMaterialesODTCANTIDADCONSUMIDA: TFloatField;
    qMaterialesODTCANTIDADENTREGADA: TFloatField;
    qMaterialesODTCANTIDADREINTEGRADABUENA: TFloatField;
    qMaterialesODTCANTIDADREINTEGRADAMALA: TFloatField;
    qMaterialesODTCANTIDADRETIRADABUENA: TFloatField;
    qMaterialesODTCANTIDADRETIRADAMALA: TFloatField;
    pmImprimirHija: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    AolFinca1: TMenuItem;
    Itinerario1: TMenuItem;
    FechaLectura1: TMenuItem;
    Panel4: TPanel;
    CodigodeCuenta1: TMenuItem;
    Panel8: TPanel;
    RxDBGrid1: TRxDBGrid;
    RxSplitter2: TRxSplitter;
    qprincipal: TQuery;
    dsprincipal: TDataSource;
    qClases: TQuery;
    qClasesCODIGOCLASE: TStringField;
    qClasesCODIGOANOMALIA: TStringField;
    qClasesDESCRIPCION: TStringField;
    qClasesTIPO: TStringField;
    qClasesREQUIERE_LECTURA: TStringField;
    qClasesFACTURABLE: TStringField;
    qClasesPROMEDIABLE: TStringField;
    qClasesFOTOGRAFIA: TStringField;
    qClasesOBSERVACION: TStringField;
    qClasesMARCACION: TStringField;
    qClasesUSUARIOCREACION: TFloatField;
    qClasesFECHACREACION: TDateTimeField;
    qClasesUSUARIOMODIFICACION: TFloatField;
    qClasesFECHAMODIFICACION: TDateTimeField;
    qClasesESTADO: TStringField;
    qClasesPARAMETRIZACION: TStringField;
    qUpdateLectura: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    FloatField1: TFloatField;
    DateTimeField1: TDateTimeField;
    FloatField2: TFloatField;
    DateTimeField2: TDateTimeField;
    StringField11: TStringField;
    StringField12: TStringField;
    Panel9: TPanel;
    Panel11: TPanel;
    lDetalleSuministros: TLabel;
    qTotal : TQuery;
    Label1: TLabel;
    Splitter1: TSplitter;
    sbRefrescar: TSpeedButton;
    sbVistaPreliminarVL: TSpeedButton;
    lFechaLectura: TLabel;
    qSupervisor: TQuery;
    qSupervisorCODIGOCOORDINACIONGRUPOTRABAJO: TFloatField;
    qSupervisorNOMBRECOORDINACIONGRUPOTRABAJO: TStringField;
    qSupervisorACTIVO: TStringField;
    qSupervisorCODIGOUSUARIO: TFloatField;
    qSupervisorCODIGOSEDEOPERATIVA: TFloatField;
    qSupervisorCODIGOSEDEOPERATIVA_1: TFloatField;
    qSupervisorNOMBRESEDEOPERATIVA: TStringField;
    qSupervisorACTIVO_1: TStringField;
    qSupervisorCODIGOTIPOSEDE: TFloatField;
    qSupervisorCOLOR: TFloatField;
    pmCerrarItinerario: TPopupMenu;
    Ce1: TMenuItem;
    sbSegundos: TSpinEdit;
    Panel14: TPanel;
    Timer1: TTimer;
    sbRecargar: TSpeedButton;
    sbExportar1: TSpeedButton;
    sbExportar3: TSpeedButton;
    pmExportar2: TPopupMenu;
    MenuItem3: TMenuItem;
    SpinEdit1: TSpinEdit;
    Label19: TLabel;
    qListalectura: TQuery;
    dsToExport: TDDataSource;
    SpeedButton1: TSpeedButton;
    qprincipalLOGIN: TStringField;
    qprincipalNOMBRESEDEOPERATIVA: TStringField;
    qprincipalCOLOR: TFloatField;
    qprincipalCODIGOITINERARIO: TFloatField;
    qprincipalNOMBREESTADOITINERARIO: TStringField;
    qprincipalNOMBREGRUPOTRABAJO: TStringField;
    qprincipalCODIGOESTADOITINERARIO: TFloatField;
    qprincipalFECHAPRIMERAREPARTO: TDateTimeField;
    qprincipalFECHAULTIMOREPARTO: TDateTimeField;
    qprincipalTOTALREPARTIDOS: TFloatField;
    qListalecturaCODIGOCUENTA: TFloatField;
    qListalecturaDIRECCIONSUSCRIPTOR: TMemoField;
    qListalecturaFECHA_PROGRAMADA_REPARTO: TDateTimeField;
    qListalecturaNOMBRE: TStringField;
    qListalecturaDIRECCION: TStringField;
    qListalecturaNOMBRESUSCRIPTOR: TStringField;
    qprincipalFECHAREPARTO: TDateTimeField;
    qprincipalCANTIDAD: TFloatField;
    qprincipalPORCENTAJEAVANCE: TStringField;
    qListalecturaFECHAENTREGA: TDateTimeField;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    qprincipalCLIENTESDEVUELTOS: TFloatField;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure SBImprimirClick(Sender: TObject);
    procedure SBOrdenarClick(Sender: TObject);
    procedure sbRefrescarClick(Sender: TObject);
    procedure ExportarListaOdtPadres1Click(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SBBuscaElementoCartografiaClick(Sender: TObject);
    procedure AolFinca1Click(Sender: TObject);
    procedure Itinerario1Click(Sender: TObject);
    procedure FechaLectura1Click(Sender: TObject);
    procedure sbVistaPreliminarVLClick(Sender: TObject);
  {  procedure sbFiltroHijasClick(Sender: TObject);  }
     procedure CargarVistaPreliminar (CodApoyo: string);
    procedure CodigodeCuenta1Click(Sender: TObject);
    procedure qprincipalCalcFields(DataSet: TDataSet);
    procedure qListaLecturaAfterOpen(DataSet: TDataSet);
    procedure RxDBGrid1GetCellProps(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor);
    procedure Ce1Click(Sender: TObject);
    procedure sbRecargarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qprincipalAfterScroll(DataSet: TDataSet);
    procedure sbExportar3Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure qprincipalAfterOpen(DataSet: TDataSet);
    procedure sbAuditoriaClick(Sender: TObject);
    procedure qListalecturaCalcFields(DataSet: TDataSet);
    procedure RxDBGrid1TitleClick(Column: TColumn);
    procedure dbgListaHijasTitleClick(Column: TColumn);
    procedure qListalecturaAfterScroll(DataSet: TDataSet);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
    gSLLista, gSLListaRotulos, gSLListaDatos, gSLListaFrom : TStringList;
    ListaDireccionCampos:TStringList;
    function ExisteTransaccionActual:boolean;
    function ValorFacturaNoCorresponde(Consumo,ValorFacturado,CodigoTarifa,Ciclo : String) : Boolean;
    function AnomaliaNoCorresponde(Anomalia, Facturo, TipoFactura, ConsumoActual : String) : Boolean;
    function AnomaliaDiasFueraLiminte(FechaLectura , FechaAnterior : String) : Boolean;
    function AnomliaPorPromedio(Anomalia : String) : Boolean;
    function AnomaliaConsumoCero(LecuturaAnterior : String; LecuturaActual  : String): Boolean;
    function AnomaliaPorDesviacionDeConsumo(TipoTarifa : String) : Boolean;

    function ValidarListadoItinerarios : Boolean;
    function InactivarClienteDelItinerarioExportado (CodigoItinerario : String; var clientesExportados : String) : Boolean;
    function ActualizarListadoDeTotalesPorItinerario (CodigoItinerario, ClientesExportado : String): Boolean;
    procedure ActualizarEstadoClientesListado(CodigoItinerario : String);
    function consultarEstadoItinerario (CodigoItinerario : String ) : Boolean;
    function ValidarEstadoItinerarioGeneral : Boolean;

  public
    { Public declarations }
    sCriterio : String;
    Lista,ListaEstadistica,ListaFrom,ListaOrden : TStringList;
    VerFiltro:boolean;
    GrupodeTrabajo:integer;
    procedure Filtrar;
    function PeriodoAnterior: String;
    procedure LimpiarFiltro;
    function FormatoFecha(aFecha:TField):string;
    function PromediarLectura: String;
    Procedure HabilitarBotones( Bandera : Boolean);
    Procedure CargaInfoLecturas ;
  end;
var
  fSupervisionGeneralR: TfSupervisionGeneralR;


implementation

uses uODTUrbanaRural, uElementosAsociadosODT, uCartografiaReportes,
  uFIMPComunes, uODTPadre, uQRIndicexMaterialResumen, uQRListaODTHorasExtras,
  uComunesAdministrativo, uQRListadoODT, uBuscarOdt, uEstadisticaOdt,
  uQRListaODTViaticos, uQRListaODTAuxilios, DecisionCubeBugWorkaround,
  ConsDll, uFuncionSGD, uQRODTHija, uQRODTHijaTodas, uBuscarOdtHija,
  uFIMPAdministrativo,uVistaPreliminarVL, uGaleriaPreliminar,
  uAnalisisFacturacion, uFormaEspere,UFiltrarclave;


{$R *.DFM}



function TfSupervisionGeneralR.PromediarLectura: String;
var
  Pivote, Numero, i, NumElementos, Cuenta: Integer;
  Promedio, Sumatoria, Desviacion, LimiteSup, LimiteInf: Double;
  Lista, ListaActivos, ListaActivos2, ListaActivos3: TStringList;
  Anterior: Integer;
  Query : TQuery;
  sp:TStoredProc;
begin
{  Anterior := StrToInt(PeriodoAnterior);
  Lista := TStringList.Create;
  ListaActivos := TStringList.Create;
  ListaActivos2 := TStringList.Create;
  ListaActivos3 := TStringList.Create;

  Pivote := (Anterior - 6);
  Lista.Clear;
  NumElementos := 0;
  Sumatoria := 0;
  Cuenta := 0;
  Promedio := 0;


  if Pivote >= 0 then
  begin
    Lista.Add(IntToStr(Anterior));
    Lista.Add(IntToStr(Anterior - 1));
    Lista.Add(IntToStr(Anterior - 2));
    Lista.Add(IntToStr(Anterior - 3));
    Lista.Add(IntToStr(Anterior - 4));
    Lista.Add(IntToStr(Anterior - 5));
  end
  else
  begin
    Numero := Pivote + 12;

    while (Numero) < 12 do
    begin
      Lista.Add(IntToStr(Numero + 1));
      Numero := Numero + 1;
    end;

    for i := 1 to (Pivote + 6) do
    begin
      Lista.Add(IntToStr(i));
    end;

  end;

 // ShowMessage(Lista.CommaText);

  for i := 0 to Lista.Count - 1 do
  begin
    if qListaLectura.FieldByName('CONSUMO' + Lista[i]).AsFloat > 0 then
    begin
      NumElementos := NumElementos + 1;
      Promedio := Promedio + qListaLectura.FieldByName
        ('CONSUMO' + Lista[i]).AsFloat;
    end;
  end;

  try
    Promedio := Promedio / ( NumElementos);
  // ShowMessage('Promedio : '+FloatToStr(Promedio));
    for i := 0 to Lista.Count - 1 do
    begin
      if qListaLectura.FieldByName('CONSUMO' + Lista[i]).AsFloat > 0 then
      begin
        Sumatoria := Sumatoria +
          Power(qListaLectura.FieldByName('CONSUMO' + Lista[i]).AsFloat -
          Promedio, 2);
      //    showmessage('Sumatoria :'+FloatToStr(Sumatoria));
      end;
    end;
    // showmessage('Sumatoria :'+FloatToStr(Sumatoria) +' Elementos : '+ IntToStr(Lista.Count - 1));
    //showmessage('Valor interno :'+FloatToStr(Sumatoria/(Lista.Count - 1)));
    Desviacion := Sqrt(Sumatoria/( NumElementos - 1));

  // ShowMessage('Desviacion : '+FloatToStr(Desviacion));
    // Primera iteracion

   // LimiteSup := (Desviacion * 1.5) + Promedio;
   // LimiteInf := (Desviacion * 1.5) - Promedio;

     LimiteSup := (Desviacion * 1.5);
    LimiteInf := (Desviacion * 1.5);
    ListaActivos.Clear;

 //   ShowMessage('sueprior :'+ FloatToStr(LimiteSup) +' inferior'+ FloatToStr(LimiteInf));

    for i := 0 to Lista.Count - 1 do
    begin
      if qListaLectura.FieldByName('CONSUMO' + Lista[i]).AsFloat > 0 then
      begin

        if (Abs(qListaLectura.FieldByName('CONSUMO' + Lista[i]).AsFloat-Promedio) > LimiteSup)
        then
        begin
          Cuenta := Cuenta + 1;
        end
        else
        begin
          ListaActivos.Add(qListaLectura.FieldByName('CONSUMO' + Lista[i])
            .AsString);
        end;

      end;

    end;
  // SHOWMESSAGE('activos '+ ListaActivos.CommaText);
    // segunda iteracion
    if Cuenta > 0 then
    begin
      NumElementos := 0;
      Promedio := 0;
      Sumatoria := 0;
      Cuenta := 0;

      for i := 0 to ListaActivos.Count - 1 do
      begin
        if StrToFloat(ListaActivos[i]) > 0 then
        begin
          NumElementos := NumElementos + 1;
          Promedio := Promedio + StrToFloat(ListaActivos[i]);
        end;
      end;

      Promedio := Promedio / NumElementos;
    //   SHOWMESSAGE('Promedio 2 '+ FloatToStr(Promedio));
      for i := 0 to ListaActivos.Count - 1 do
      begin
        if StrToFloat(ListaActivos[i]) > 0 then
        begin
          Sumatoria := Sumatoria + Power(StrToFloat(ListaActivos[i]) -
            Promedio, 2);
        end;
      end;

     Desviacion := Sqrt(Sumatoria / (NumElementos - 1));

    // ShowMessage('Desviacion : '+FloatToStr(Desviacion));

      LimiteSup := (Desviacion * 1.75);
      LimiteInf := (Desviacion * 1.75);
      ListaActivos2.Clear;

      for i := 0 to ListaActivos.Count - 1 do
      begin

        if (Abs(StrToFloat(ListaActivos[i])-Promedio) > LimiteSup)  then
        begin
          Cuenta := Cuenta + 1;
        end
        else
        begin
          ListaActivos2.Add(ListaActivos[i]);
        end;
      end;

      // tercera Iteracion
      if Cuenta > 0 then
      begin
        NumElementos := 0;
        Sumatoria := 0;
        Promedio := 0;
        Cuenta := 0;

        for i := 0 to ListaActivos2.Count - 1 do
        begin
          if StrToFloat(ListaActivos2[i]) > 0 then
          begin
            NumElementos := NumElementos + 1;
            Promedio := Promedio + StrToFloat(ListaActivos2[i]);
          end;
        end;
        
        Promedio := Promedio / NumElementos;

        for i := 0 to ListaActivos2.Count - 1 do
        begin
          if StrToFloat(ListaActivos2[i]) > 0 then
          begin
            Sumatoria := Sumatoria + Power(StrToFloat(ListaActivos2[i]) -
              Promedio, 2);
          end;
        end;

        Desviacion := Sqrt(Sumatoria / ( NumElementos - 1));

        LimiteSup := (Desviacion * 2);
        LimiteInf := (Desviacion * 2);
        ListaActivos3.Clear;

        for i := 0 to ListaActivos2.Count - 1 do
        begin

          if (Abs(StrToFloat(ListaActivos2[i])-Promedio) > LimiteSup) then
          begin
            Cuenta := Cuenta + 1;
          end                                   
          else
          begin
            ListaActivos3.Add(ListaActivos2[i]);
          end;
        end;

        if Cuenta > 0 then
        begin

          for i := 0 to ListaActivos3.Count - 1 do
          begin
            if StrToFloat(ListaActivos3[i]) > 0 then
            begin
              NumElementos := NumElementos + 1;
              Promedio := Promedio + StrToFloat(ListaActivos3[i]);
            end;
          end;
          Promedio := Promedio / NumElementos;

          Result := FloatToStr(Promedio);

        end
        else
          Result := FloatToStr(Promedio);

      end
      else
        Result := FloatToStr(Promedio);

    end
    else
      Result := FloatToStr(Promedio);

  except
    On E: Exception do
    Result := '0';
  end;   }

end;

function TfSupervisionGeneralR.PeriodoAnterior: String;
var
 Dia,Mes,Ano : Word;
begin
DecodeDate(qListaLectura.FieldByName('FECHA_PROGRAMADA').AsDateTime,Ano,Mes,Dia);
if Mes = 1 then
Result := IntToStr(12)
else
Result := IntToStr(Mes-1);

end;

function TfSupervisionGeneralR.FormatoFecha(aFecha:TField):string;
begin
  Result:=FormatDateTime('mm/dd/yyyy hh:mm:ss',aFecha.AsDateTime);
end;

procedure TfSupervisionGeneralR.FormDestroy(Sender: TObject);
begin
  ListaFrom.Free;
  ListaEstadistica.Free;
  gSLLista.Free;
  gSLListaRotulos.Free;
  gSLListaDatos.Free;
  gSLListaFrom.Free;

    if  Assigned(fVistaPreliminarVL) then
  begin
    fVistaPreliminarVL.free;
    fVistaPreliminarVL:= nil;
  end;
  inherited;
end;

procedure TfSupervisionGeneralR.FormShow(Sender: TObject);
begin
 { inherited;
  ListadodeHorasExtras1.visible:=not(ProcManager.CanProcExecute('_Ocultar Odt Extras'))or (varcodigousuario=0);
  ListadodeViticosCausados1.visible:=not(ProcManager.CanProcExecute('_Ocultar Odt Viaticos/Auxilios'))or (varcodigousuario=0);
  ListadodeAuxiliosCausados1.visible:=not(ProcManager.CanProcExecute('_Ocultar Odt Viaticos/Auxilios'))or (varcodigousuario=0);   }
  Filtrar;
  WindowState:= wsMaximized;
  IF qprincipal.Active THEN
  lFiltroDatos.Caption := '<< FILTRO DE DATOS '+ IntToStr(qprincipal.RecordCount)+' Registros  >> ';
end;

procedure TfSupervisionGeneralR.FormCreate(Sender: TObject);
begin
  inherited;
  ListaFrom := TStringList.Create;
  ListaEstadistica := TStringList.Create;
  ListaDatos := TStringList.Create;
  ListaRotulos := TStringList.Create;
  ListaOrden := TStringList.Create;
 { ListaDireccionCampos:=TStringList.Create;
  ListaDireccionCampos.Add('CODIGOODT=-1');
  ListaDireccionCampos.Add('CODIGOADMINISTRATIVO=-1');
  ListaDireccionCampos.Add('FECHAEMISION=-1');
  ListaDireccionCampos.Add('FECHAAPROBACION=-1');
  ListaDireccionCampos.Add('FECHAASIGNACION=-1');
  ListaDireccionCampos.Add('CODIGOESTADOODT=-1');
  ListaDireccionCampos.Add('CODIGOLABOR=-1');
  ListaDireccionCampos.Add('CODIGOPRIORIDAD=-1');
  ListaDireccionCampos.Add('CODIGOTIPOTAREA=-1');       }

  {qprincipal.Open;  }
 { qListaLectura.Open;}
 { qGrupoTrabajo.Open;  }

  Panel3.Visible:= False;
  gSLLista := TStringList.Create;
  gSLListaRotulos := TStringList.Create;
  gSLListaDatos := TStringList.Create;
  gSLListaFrom := TStringList.Create;
end;

procedure TfSupervisionGeneralR.Filtrar;
Var CadFrom,s : String;
Valor : Integer;
begin
  Lista := GetQueryFiltroRepartoGeneral(ListaRotulos, ListaDatos, ListaFrom);
  If Lista <> Nil then
  begin
    qprincipal.close;

  LimpiarFiltro;
  qprincipal.SQl.Strings[34]:=Lista.Text;
//    qprincipal.SQL.SaveToFile('C:\Users\DESJORGE\Desktop\qprincipal.TXT');
    qprincipal.Open;


  qListalectura.close;
  qListalectura.open;

 //  CargaInfoLecturas;

  end;
end;

procedure TfSupervisionGeneralR.LimpiarFiltro;
begin
 qprincipal.SQL.strings[34]:= '';
end;

procedure TfSupervisionGeneralR.SBFiltrarClick(Sender: TObject);
begin
  Filtrar;
  inherited;
end;                               

procedure TfSupervisionGeneralR.SBImprimirClick(Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel2.ClientToScreen(Classes.Point(sbImprimir.Left, sbImprimir.top));
  pmImprimir.Popup(punto.x+10, punto.y+10);
end;


procedure TfSupervisionGeneralR.SBOrdenarClick(Sender: TObject);
var punto:TPoint;
begin
 punto:=Panel2.ClientToScreen(Classes.Point(SBOrdenar.Left, SBOrdenar.top));
 pmOrdenar.Popup(punto.x+10, punto.y+10);
end;






//************Despliega el formulario Buscar ODT
procedure TfSupervisionGeneralR.sbRefrescarClick(Sender: TObject);
var
Marca,Marca2 : TBookmark;
begin
  inherited;

  Marca :=  qprincipal.GetBookmark;

  qprincipal.Close;
  qprincipal.Open;
  qprincipal.GotoBookmark(Marca);
  Marca2 :=  qListaLectura.GetBookmark;
  qListaLectura.Close;
  qListaLectura.Open;
end;

procedure TfSupervisionGeneralR.ExportarListaOdtPadres1Click(
  Sender: TObject);
  var
  Query : Tquery;
  Lista1,Lista2 : TStringList;
begin
  inherited;
sbVistaPreliminarVL.Down := False;
Panel4.visible:= false;
fFormaEspere := TfFormaEspere.Create(Application);
fFormaEspere.ProgressBar1.Max := qprincipal.RecordCount;
fFormaEspere.lbMotivo.Caption := 'Generando Archivo...';
fFormaEspere.Show;
fFormaEspere.Refresh;
fFormaEspere.ProgressBar1.Position := 1;
fFormaEspere.Refresh;

  Lista1 := TStringList.Create;
     Lista2 := TStringList.Create;
     qprincipal.AfterScroll := NIL;
     //qprincipal.OnCalcFields := NIL;
     qprincipal.DisableControls;
     qListalectura.DisableControls;


     Lista2.Clear;
     qprincipal.First;

     fFormaEspere.lbMotivo.Caption := 'Recopilando información...';
     fFormaEspere.ProgressBar1.Position := 3;
     fFormaEspere.Refresh;
     Lista1.Clear;
     Lista1.Add('Sede Operativa');
     Lista1.Add('Codigo Itinerario');
     Lista1.Add('Repartidor');
     Lista1.Add('Cantidad Clientes');
     Lista1.Add('Porcentaje de Avance');
     Lista1.Add('Hora Primera Entrega');
     Lista1.Add('Hora Ultima Entrega');
     Lista1.Add('Estado Itinerario');
     Lista2.add(Lista1.CommaText);


     while not qprincipal.Eof do
     begin
     Lista1.Clear;
     Lista1.Add(qprincipal.fieldByName('NOMBRESEDEOPERATIVA').AsString);
     Lista1.Add(qprincipal.fieldByName('CODIGOITINERARIO').AsString);
     Lista1.Add(qprincipal.fieldByName('NOMBREGRUPOTRABAJO').AsString);
     Lista1.Add(qprincipal.fieldByName('CANTIDAD').AsString);
     Lista1.Add(qprincipal.fieldByName('PORCENTAJEAVANCE').AsString);
     Lista1.Add(qprincipal.fieldByName('FECHAPRIMERAREPARTO').AsString);
     Lista1.Add(qprincipal.fieldByName('FECHAULTIMOREPARTO').AsString);
     Lista1.Add(qprincipal.fieldByName('NOMBREESTADOITINERARIO').AsString);
     Lista2.add(Lista1.CommaText);

fFormaEspere.lbMotivo.Caption := 'Generando datos...';
fFormaEspere.ProgressBar1.Position := fFormaEspere.ProgressBar1.Position+1;
fFormaEspere.Refresh;

     qprincipal.Next;
     end;
     fFormaEspere.free;




  if SaveDialog1.Execute then
  begin
  Lista2.SaveToFile(SaveDialog1.FileName);
  end;
  qprincipal.EnableControls;
  qListalectura.EnableControls;
   qprincipal.AfterScroll := qprincipalAfterScroll;
  // qprincipal.OnCalcFields :=qprincipalCalcFields;
  Lista1.Free;
  Lista2.Free;
end;

procedure TfSupervisionGeneralR.sbExportarClick(Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel2.ClientToScreen(Classes.Point(sbExportar1.Left, sbExportar1.top));
  pmExportar.Popup(punto.x+10, punto.y+10);
end;

function TfSupervisionGeneralR.ExisteTransaccionActual: boolean;
begin

end;

procedure TfSupervisionGeneralR.SpeedButton2Click(Sender: TObject);
var punto:TPoint;
begin
end;


procedure TfSupervisionGeneralR.SBBuscaElementoCartografiaClick(Sender: TObject);
var
  Query, Query2,Query3,qQueryLeido,qQueryExportado: TQuery;
begin
  inherited;

  try
      Query3 := TQuery.Create(nil);
      Query3.DatabaseName := 'BaseDato';
      Query3.SQL.add('SELECT g.codigoruta,g.codigogrupoitinerario,i.color,g.codigogrupoaol FROM SGC_ITINERARIO i, SGC_GRUPOITINERARIO g WHERE CODIGOITINERARIO='+qprincipal.fieldByName
      ('CODIGOITINERARIO').AsString+' and G.CODIGOGRUPOITINERARIO=I.CODIGOGRUPOITINERARIO ');
      Query3.Open;


      qQueryLeido := TQuery.Create(nil);
      qQueryLeido.DatabaseName := 'BaseDato';

      qQueryLeido.SQL.add('SELECT   A.CODIGOAPOYO,A.X AS X,A.Y AS Y,''M'' as Marcado, '''' AS TEXTO FROM SIGCOM_LECTURA S , CLIENTESGD C , APOYO A ');
      qQueryLeido.SQL.add('WHERE S.FECHA_PROGRAMADA=TO_DATE('+QuotedStr(qprincipal.fieldByName('FECHALECTURA').AsString)+',''DD/MM/YYYY'') ');
      qQueryLeido.SQL.add('AND S.CODIGOITINERARIO='+qprincipal.fieldByName('CODIGOITINERARIO').AsString+'        ');
      qQueryLeido.SQL.add('AND sgc_fun_convertir_clave(C.CODIGO_CUENTA)=S.CLAVE  AND A.CODIGOAPOYO=C.CODIGOAPOYO     ');
      qQueryLeido.SQL.add('ORDER BY S.FECHALECTURA');
      qQueryLeido.Open;

      qQueryExportado := TQuery.Create(nil);
      qQueryExportado.DatabaseName := 'BaseDato';

      qQueryExportado.SQL.add('SELECT  DISTINCT A.CODIGOAPOYO,A.X,A.Y,''M'' as Marcado, '''' AS TEXTO ');
      qQueryExportado.SQL.add('FROM SGC_INFOITINERARIO S , CLIENTESGD C , APOYO A  ');
      qQueryExportado.SQL.add('WHERE FECHALECTURA=TO_DATE('+QuotedStr(qprincipal.fieldByName('FECHALECTURA').AsString)+',''DD/MM/YYYY'')  ');
      qQueryExportado.SQL.add('AND CODIGOITINERARIO='+qprincipal.fieldByName('CODIGOITINERARIO').AsString+'    AND A.CODIGOAPOYO=C.CODIGOAPOYO ');
      qQueryExportado.SQL.add('AND sgc_fun_convertir_clave(C.CODIGO_CUENTA)=S.CLAVE  ');
      qQueryExportado.Open;


    Query2 := TQuery.Create(nil);
    Query2.DatabaseName := 'BaseDato';
    Query2.SQl.Add('SELECT CODIGOAPOYO FROM CLIENTESGD WHERE sgc_fun_convertir_clave(CODIGO_CUENTA)=''' +
      qListaLectura.fieldByName('CLAVE').AsString + ''' ');
    Query2.Open;

    if not Query2.IsEmpty then
    begin
        FiltroCapaTemporal(qQueryExportado, 'CODIGOAPOYO', 'Marcado', 1,2,clGray,false,'Itinerario Exportado');
        FiltroCapaTemporal(qQueryLeido, 'CODIGOAPOYO', 'Marcado', 1,2,clLime,true,'Itinerario Leido');
        BuscarApoyo(Query2.fieldByName('CODIGOAPOYO').AsString, False);
        qQueryLeido.close;
        qQueryLeido.open;
        MostrarRuta(qQueryLeido);
    end;

  finally
    Query2.Free;
    Query3.Free;
    qQueryExportado.Free;
    qQueryLeido.Free;
  end;
end;

procedure TfSupervisionGeneralR.AolFinca1Click(Sender: TObject);
begin
  inherited;
qListaLectura.close;
qListaLectura.SQL.Delete(9);
qListaLectura.SQL.Insert(9,'ORDER BY AOLFINCA');
qListaLectura.open;
end;

procedure TfSupervisionGeneralR.Itinerario1Click(Sender: TObject);
begin
  inherited;
qListaLectura.close;
qListaLectura.SQL.Delete(9);
qListaLectura.SQL.Insert(9,'ORDER BY I.CODIGOITINERARIO');
qListaLectura.open;
end;

procedure TfSupervisionGeneralR.FechaLectura1Click(Sender: TObject);
begin
  inherited;
qListaLectura.close;
qListaLectura.SQL.Delete(9);
qListaLectura.SQL.Insert(9,'ORDER BY FECHALECTURA');
qListaLectura.open;
end;

procedure TfSupervisionGeneralR.sbVistaPreliminarVLClick(Sender: TObject);
var Registro : TRegIniFile;
i: integer;
begin

IF sbVistaPreliminarVL.Down = true then
Begin
 if Assigned(fGaleriaPreliminar) then
 begin
  fGaleriaPreliminar := NIL;
fGaleriaPreliminar.Free;
end;
  Panel4.visible:= true;
  CargarVistaPreliminar(qListaLectura.FieldByName('CODIGOCUENTA').AsString);


end
else  Panel4.visible:= false;
end;

procedure TfSupervisionGeneralR.CargarVistaPreliminar(CodApoyo: string);
var
  CodigoApoyo: string;
  i: Integer;
begin

       CodigoApoyo:= qListaLectura.FieldByName('CODIGOCUENTA').AsString;
       if  CodigoApoyo <> '' then
       begin
           if  not Assigned(fGaleriaPreliminar) then
           begin
             fGaleriaPreliminar:= TfGaleriaPreliminar.CreateByparametros(Application, CodigoApoyo);
             fGaleriaPreliminar.BanderaReparto:= TRUE;
             fGaleriaPreliminar.CoolBar3.Bands[0].Text := 'Fotos Reparto';

             fGaleriaPreliminar.TipoDeFoto := '23';
           fGaleriaPreliminar.FechaLectura := lFechaLectura.Caption;
           end
           else
           begin
             fGaleriaPreliminar.Align :=alClient;
             fGaleriaPreliminar.FechaLectura := lFechaLectura.Caption;
             fGaleriaPreliminar.TipoDeFoto := '23';
            fGaleriaPreliminar.MostrarVistaPreliminar(CodigoApoyo);
           end;

           fGaleriaPreliminar.ManualDock(Panel4);
           fGaleriaPreliminar.Show;
           fGaleriaPreliminar.Zommer1.Caption := 'Foto de Reparto ';
       end;
 {   end; }
end;

procedure TfSupervisionGeneralR.CodigodeCuenta1Click(Sender: TObject);
begin
  inherited;
qListaLectura.close;
qListaLectura.SQL.Delete(9);
qListaLectura.SQL.Insert(9,'ORDER BY CLAVE');
qListaLectura.open;
end;

procedure TfSupervisionGeneralR.qprincipalCalcFields(DataSet: TDataSet);
var
Cantidad : Integer;
begin
  inherited;
try

  qprincipalPORCENTAJEAVANCE.AsString :=
      FloatToStr( ((qprincipalTOTALREPARTIDOS.AsInteger+
      qprincipalCLIENTESDEVUELTOS.AsInteger) * 100) / qprincipalCANTIDAD.AsInteger);


 Except
qprincipalPORCENTAJEAVANCE.AsString := '0';
 end;
end;

function TfSupervisionGeneralR.AnomaliaConsumoCero(LecuturaAnterior : String; LecuturaActual  : String): Boolean;
begin
try
 if StrToFloat(LecuturaAnterior) = StrToFloat(LecuturaActual) then
  Result := True
  else
  Result := False;

finally

end;

end;

function TfSupervisionGeneralR.AnomaliaDiasFueraLiminte(FechaLectura,
  FechaAnterior: String): Boolean;
  var
  Dias : Double;
begin

  if  (FechaLectura <> '') and  (FechaAnterior <> '') then
  begin
   FechaAnterior := Copy(FechaAnterior,5,2)+'/'+Copy(FechaAnterior,3,2)+'/'+'20'+copy(FechaAnterior,1,2);

    Dias :=  StrToDateTime(FechaLectura) - StrToDateTime(FechaAnterior);
  if  (Dias <= 32)  and ( Dias >= 28) then
  Result := False
  else
  Result := True;
  
  end;
end;

function TfSupervisionGeneralR.AnomaliaNoCorresponde(Anomalia, Facturo, TipoFactura, ConsumoActual : String): Boolean;
var
 Query : TQuery;
 Consumo : Double;
begin

Result := True;
try
  Consumo := StrToFloat(ConsumoActual);
  Query:=TQuery.create(nil);
  Query.DatabaseName:='BaseDato';

  Query.close;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT * FROM SGC_CLASES WHERE CODIGOCLASE= '''+Anomalia+'''  ');
  Query.Open;

  if (Consumo=0) and (Query.FieldByName('REQUIERE_LECTURA').AsString = 'SI') THEN
  Result:= False;



  if (TipoFactura='2') and (Query.FieldByName('PROMEDIABLE').AsString = 'NO')  then
  Result :=False;



  if  (Query.FieldByName('FACTURABLE').AsString = 'NO') and (Facturo='SI')  then
  Result :=False;



  if  (Query.FieldByName('FACTURABLE').AsString = 'SI') and (Facturo='NO')  then
  Result :=False;




 finally
  Query.Free;
 end;
end;


function TfSupervisionGeneralR.AnomliaPorPromedio(Anomalia : String): Boolean;
var
     Query : TQuery;
begin
     Result := False;
     try

     Query:=TQuery.create(nil);
     Query.DatabaseName:='BaseDato';

     Query.close;
     Query.SQL.Add(' SELECT PROMEDIABLE FROM SGC_CLASES WHERE CODIGOCLASE=:CODIGO ');
     Query.ParamByName('CODIGO').AsString := Anomalia;
     Query.open;

     IF NOT Query.IsEmpty then

     begin
     if Query.FieldByName('PROMEDIABLE').AsString = 'SI' then
     begin

     if StrToFloat(PromediarLectura)  = qListaLectura.FieldByName('CONSUMOACTUAL').AsFloat then
     Result := True
     else
     Result := False;

     end;

     end;

     Except
     on E : Exception do
    { ShowMessage('Ha ocurrido un error, Comunicate con Soporte Tecnico. '+ E.Message + ' Promedio :' + PromediarLectura + ' Valor : '+ Query.FieldByName('PROMEDIABLE').AsString );
      }



     end;
     Query.Free;


end;

function TfSupervisionGeneralR.ValorFacturaNoCorresponde(
  Consumo ,ValorFacturado ,CodigoTarifa, Ciclo: String): Boolean;
var
 Query : TQuery;
 Limite : Integer;
 Valor1 : Double;
 Valor2 : Double;
begin
try
 Ciclo :=  Copy(Ciclo,3,4);
  Result := True;

  Query:=TQuery.create(nil);
  Query.DatabaseName:='BaseDato';

  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT * FROM FAC_VALOR_TARIFA ');
  Query.SQL.Add(' WHERE FVT_TARIFA=:CODIGOTARIFA ');
  Query.SQL.Add(' AND FVT_CICLO = :CICLO ORDER BY FVT_COD_SECTOR');

  Query.ParamByName('CODIGOTARIFA').AsString :=  CodigoTarifa;
  Query.ParamByName('CICLO').AsString :=  Ciclo;

  Query.Open;

  if not   Query.IsEmpty then
  begin

  Limite :=  Query.FieldByName('FVT_LIMITE').AsInteger;

  if (CodigoTarifa = '101') or (CodigoTarifa = '102') then
  begin
  Query.First;
  Valor1 := Query.FieldByName('FVT_VALOR').AsFloat;
  Query.Next;
  Valor2 := Query.FieldByName('FVT_VALOR').AsFloat;

          if (StrToFloat(Consumo) - Limite) >= 0 then
          begin

          if FloatToStr((Limite*Valor1)+((StrToFloat(Consumo) - Limite)*Valor2)) = Consumo  then
          Result := True
          else
          Result := False;
          end
          else
          begin

          try
         if ValorFacturado =  FloatToStr(StrToFloat(Consumo)*Valor1) then
         Result  := True
         else
         Result := False;

         except
        // ShowMessage('No se logro realizar la validación del valor facturado');
         Result := False;
         end;
         end;


  end
  else
  begin

    try
         if ValorFacturado = FloatToStr(Query.FieldByName('FTV_VALOR').AsInteger * StrToFloat(Consumo)) then
         Result  := True
         else
         Result := False;

         except
        // ShowMessage('No se logro realizar la validación del valor facturado');
         Result := False;
         end;

  end;

  end;

 finally
 Query.Free;
end;

end;

procedure TfSupervisionGeneralR.qListaLecturaAfterOpen(DataSet: TDataSet);
begin
  inherited;
  lDetalleSuministros.Caption := ' Detalle : Clientes repartidos en  Itinerario '+qprincipalTOTALREPARTIDOS.AsString;
  lFechaLectura.Caption := qListalecturaFECHA_PROGRAMADA_REPARTO.asstring;
end;

function TfSupervisionGeneralR.AnomaliaPorDesviacionDeConsumo(TipoTarifa : String): Boolean;
var
 qSelect,qUpdate,Query  : TQuery;
 Tipo : String;
 Grande, Pequeno : Extended;
begin


end;

procedure TfSupervisionGeneralR.RxDBGrid1GetCellProps(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor);
begin
  inherited;
 if Field.Text = 'EXPORTADO' then
 begin
  Background := clAqua;
 end;

  if Field.Text = 'DESCARGADO' then
 begin
  Background := clYellow;
 end;

   if Field.Text = 'EN EJECUCIÓN' then
 begin
  Background := clLime;
 end;

    if Field.Text = 'TERMINADO' then
 begin
  Background := clRed;
 end;
end;

procedure TfSupervisionGeneralR.Ce1Click(Sender: TObject);
var
qUpdate : TQuery;
buttonSelected : Integer;
Book : TBookmark;
begin
  inherited;
 buttonSelected := messagedlg('Esta seguro que desea CERRAR el itinerario : ' +qprincipalCODIGOITINERARIO.AsString ,mtConfirmation,
                              [mbOK,mbCancel], 0);

if  buttonSelected = 1 then
begin
     try

        qUpdate:=TQuery.create(nil);
        qUpdate.DatabaseName:='BaseDato';

        Book := qprincipal.GetBookmark;

        qUpdate.sql.add('UPDATE SGC_ITINERARIO SET CODIGOESTADOITINERARIO=''7'' WHERE CODIGOITINERARIO='+qprincipalCODIGOITINERARIO.AsString+' ');
        qUpdate.ExecSQL;

    if    qUpdate.RowsAffected >0 then
    begin
     messagedlg('Se ha cambiado el estado al itinerario : '+qprincipalCODIGOITINERARIO.AsString,mtInformation,
                              [mbOK ], 0);

    qprincipal.Close;
    qprincipal.Open;
    qprincipal.GotoBookmark(Book);
    end;
         Except
         on E : Exception do
         begin
         messagedlg('No ha sido posible cambiar el estado del itinerario.',mtError,
                              [mbOK ], 0);
          qUpdate.Free;
          end;

    end;
  qUpdate.Free;
 end;
end;

procedure TfSupervisionGeneralR.sbRecargarClick(Sender: TObject);
begin
  inherited;
if sbRecargar.Down then
begin
sbVistaPreliminarVL.Down := False;
Panel4.visible:= false;
Timer1.Enabled := True;
Timer1.Interval := (sbSegundos.Value)*1000;
sbSegundos.Enabled := False;
HabilitarBotones(False);
end
else
begin
sbSegundos.Enabled := True;
Timer1.Enabled := False;
HabilitarBotones(True);
end;
end;

procedure TfSupervisionGeneralR.Timer1Timer(Sender: TObject);
begin
  inherited;
IF sbRecargar.Down then
 begin
  fFormaEspere := TfFormaEspere.Create(Application);
  fFormaEspere.ProgressBar1.Max := 4;
  fFormaEspere.lbMotivo.Caption := 'Recargando Información...';
  fFormaEspere.Show;
  fFormaEspere.Refresh;
  fFormaEspere.ProgressBar1.Position := 1;
  fFormaEspere.Refresh;
  sbRefrescarClick(Sender);
  fFormaEspere.lbMotivo.Caption := 'Terminando...';
  fFormaEspere.ProgressBar1.Position := 4;
  fFormaEspere.Refresh;
  fFormaEspere.Free;

 end
else
begin
Timer1.Enabled := False;
sbSegundos.Enabled := True;
HabilitarBotones(True);
end;
end;

procedure TfSupervisionGeneralR.HabilitarBotones(Bandera: Boolean);
begin
sbRefrescar.Enabled := Bandera;
SBFiltrar.Enabled := Bandera;
SBBuscaElementoCartografia.Enabled := Bandera;
SBSalir.Enabled := Bandera;
sbVistaPreliminarVL.enabled:= Bandera;
ToolButton1.enabled:= Bandera;
sbExportar1.enabled:=Bandera;
end;

procedure TfSupervisionGeneralR.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  fGaleriaPreliminar := NIL;
fGaleriaPreliminar.Free;
end;

procedure TfSupervisionGeneralR.qprincipalAfterScroll(DataSet: TDataSet);
begin
  inherited;
//CargaInfoLecturas;
end;

procedure TfSupervisionGeneralR.sbExportar3Click(Sender: TObject);
var punto:TPoint;
begin
  inherited;
  punto:=Panel11.ClientToScreen(Classes.Point(sbExportar3.Left, sbExportar3.top));
  pmExportar2.Popup(punto.x+10, punto.y+10);
end;

procedure TfSupervisionGeneralR.MenuItem3Click(Sender: TObject);
var
  qTEmp: TQuery;
begin
  inherited;
  sbVistaPreliminarVL.Down := False;
  Panel4.visible:= false;
  qTemp:= TQuery.Create(nil);
  qTemp.Databasename := 'BaseDato';
  qTemp.SQL.AddStrings(qListalectura.SQL);
  qTemp.ParamByName('codigoitinerario').AsString := qprincipalCODIGOITINERARIO.AsString;
  qTemp.Open;

  if SaveDialog1.Execute then
  begin
    //dsListaLectura.DataSet.DisableControls;
    //qListalecturaDIRECCION.Value := '';
    CVS1.DataSet := qTemp;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
    //dsListaLectura.DataSet.EnableControls;
  end;
  qTemp.Close;
  qTemp.Free;
end;

procedure TfSupervisionGeneralR.SpeedButton1Click(Sender: TObject);
var
filtro: TffiltrarClave;
begin
  inherited;
  filtro := TffiltrarClave.Create(Self);
  filtro.GroupBox1.Caption := 'Codigo de cuenta';
  if filtro.ShowModal = mrOk then
  begin

   IF not qListaLectura.IsEmpty then
  begin
   qListaLectura.Locate('CODIGOCUENTA',filtro.Edit1.Text,[loCaseInsensitive]);
   dbgListaHijas.SetFocus;
   end;

  end;
end;

procedure TfSupervisionGeneralR.qprincipalAfterOpen(DataSet: TDataSet);
begin
  inherited;
//CargaInfoLecturas;

end;

procedure TfSupervisionGeneralR.CargaInfoLecturas;
begin

IF not qprincipal.IsEmpty then
  begin

qListaLectura.close;
qListaLectura.SQl.Clear;
qListaLectura.SQl.Add('SELECT S.CODIGOLECTURA,');
qListaLectura.SQl.Add('       S.CLAVE,');
qListaLectura.SQl.Add('         S.LECTURAACTUAL,');
qListaLectura.SQl.Add('         S.CONSUMOACTUAL,');
qListaLectura.SQl.Add('         S.CODIGOANOMALIA,');
qListaLectura.SQl.Add('         S.FECHALECTURA,');
qListaLectura.SQl.Add('         S.FECHALLEGADA,');
qListaLectura.SQl.Add('         S.FECHASALIDA,');
qListaLectura.SQl.Add('         INF.CODUBICACION,');
qListaLectura.SQl.Add('         INF.TARIFA,');
qListaLectura.SQl.Add('         S.CODIGOANOMALIACONSUMOACT,');
qListaLectura.SQl.Add('         INF.NOMBRESUSCRIPTOR,');
qListaLectura.SQl.Add('         CS.DESCRIPCION AS NOMBREANOMALIA');
qListaLectura.SQl.Add('    FROM SIGCOM_LECTURA S,');
qListaLectura.SQl.Add('         SGC_CLASES CS,');
qListaLectura.SQl.Add('         SGC_INFOITINERARIO INF');
qListaLectura.SQl.Add('   WHERE S.CLAVE = INF.CLAVE');
qListaLectura.SQl.Add('         AND S.CODIGOITINERARIO = INF.CODIGOITINERARIO');
qListaLectura.SQl.Add('         AND S.CODIGOITINERARIO = ' +
    qprincipalCODIGOITINERARIO.AsString + ' ');
qListaLectura.SQl.Add('         AND INF.CODIGOITINERARIO = S.CODIGOITINERARIO');
qListaLectura.SQl.Add('         AND INF.FECHALECTURA = TO_DATE (''' +
    lFechaLectura.Caption + ''', ''DD/MM/YYYY'') ');
qListaLectura.SQl.Add('       AND INF.FECHALECTURA = S.FECHA_PROGRAMADA');
qListaLectura.SQl.Add('       AND CS.CODIGOCLASE = S.CODIGOANOMALIA');
qListaLectura.SQl.Add('       AND S.CODIGOADMINISTRATIVO1 = INF.CODIGOADMINISTRATIVO ');
qListaLectura.SQl.Add('       AND S.CODIGOGRUPOTRABAJO1 = INF.CODIGOGRUPOTRABAJO ');
qListaLectura.SQl.Add('ORDER BY S.FECHALECTURA DESC');
 qListaLectura.Open;


  lDetalleSuministros.Caption := ' Suministros leidos en  Itinerario '+ IntToStr(qListaLectura.RecordCount);
   end;
end;

procedure TfSupervisionGeneralR.sbAuditoriaClick(Sender: TObject);
var
fAuditoriaSupervisor: TfAuditoriaSupervisor;
begin
  inherited;

end;

procedure TfSupervisionGeneralR.qListalecturaCalcFields(DataSet: TDataSet);
begin
  inherited;
 qListalecturaDIRECCION.AsString := qListalecturaDIRECCIONSUSCRIPTOR.asstring;
end;

procedure TfSupervisionGeneralR.RxDBGrid1TitleClick(Column: TColumn);
var
Nombre : String;
begin
  if Column.Field.FieldKind   = fkData then
  begin
  Nombre := 'qprincipal';

    qprincipal.close;
    qprincipal.SQL.Strings[46] := ' ORDER BY '+Column.Field.FieldName+' '+ListaOrden.Values[Nombre+Column.Field.FieldName]+' ';
    qprincipal.open;

  if ListaOrden.Values[Nombre+Column.Field.FieldName] = 'DESC' then
  ListaOrden.Values[Nombre+Column.Field.FieldName] := 'ASC'
  else
  ListaOrden.Values[Nombre+Column.Field.FieldName] := 'DESC';
 end;

end;

procedure TfSupervisionGeneralR.dbgListaHijasTitleClick(Column: TColumn);
var
Nombre : String;
begin
  if Column.Field.FieldKind   = fkData then
  begin
  Nombre := 'qListaLectura';

    qListaLectura.close;
    qListaLectura.SQL.Strings[15] := ' ORDER BY '+Column.Field.FieldName+' '+ListaOrden.Values[Nombre+Column.Field.FieldName]+' ';
    qListaLectura.open;

  if ListaOrden.Values[Nombre+Column.Field.FieldName] = 'DESC' then
  ListaOrden.Values[Nombre+Column.Field.FieldName] := 'ASC'
  else
  ListaOrden.Values[Nombre+Column.Field.FieldName] := 'DESC';
 end;


end;

procedure TfSupervisionGeneralR.qListalecturaAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
 IF  Panel4.visible THEN
 BEGIN
 fGaleriaPreliminar := NIL;
fGaleriaPreliminar.Free;
  CargarVistaPreliminar(qListaLectura.FieldByName('CODIGOCUENTA').AsString);
end;
end;

procedure TfSupervisionGeneralR.ToolButton1Click(Sender: TObject);
var
Cantidad : String;
begin
  inherited;

  if ValidarListadoItinerarios then
  begin
  if ValidarEstadoItinerarioGeneral then
  begin
   if Application.MessageBox
    (PChar('¿ Esta seguro que desea retornar al listado de reparto las cuentas de los itinerarios que estan en estado TERMINADO y que no fueron procesadas en campo?'+ char(13)+'Esta acción es irreversible, los clientes tendran que realizar todo el proceso de reparto nuevamente.'+char(13)+'Los clientes los encontrara en la pestaña (pendientes).'),
    'Confirmación', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
   begin

    qprincipal.First;
    while not qprincipal.Eof do
    begin
    Cantidad := '0';
    if (qprincipalCANTIDAD.AsInteger-qprincipalTOTALREPARTIDOS.AsInteger)>0 then
    if ConsultarEstadoItinerario(qprincipalCODIGOITINERARIO.AsString) then
    if InactivarClienteDelItinerarioExportado(qprincipalCODIGOITINERARIO.AsString,Cantidad) then
    if ActualizarListadoDeTotalesPorItinerario(qprincipalCODIGOITINERARIO.AsString,Cantidad) then
       ActualizarEstadoClientesListado(qprincipalCODIGOITINERARIO.AsString);

    qprincipal.Next;
    end;
    qprincipal.First;
      Application.MessageBox(PChar('El proceso ha terminado. En el listado principal en CLIENTES DEVUELTOS aparecera la cantidad de clientes que se procesaron. '),
          'Información', MB_OK + MB_ICONINFORMATION+ MB_DEFBUTTON2);
     sbRefrescarClick(Sender);

   end
   else
   Application.MessageBox(PChar('No ha sido posible realizar el proceso, ningun itinerario ha terminado, Intente nuevamente cuando al menos uno esté en ESTADO terminado. '),
          'Información', MB_OK + MB_ICONEXCLAMATION+ MB_DEFBUTTON2);

   end;
  end;

end;


function TfSupervisionGeneralR.ValidarListadoItinerarios: Boolean;
begin
  Result := False;

 if qprincipal.Active then
 begin
  IF qprincipal.RecordCount > 0 then
   Result := True
  else
  Application.MessageBox(PChar('El filtro utilizado retorna ningun itinerario por lo tanto no es posible realizar la acción, realice otro filtro e intente nuevamente.'),
          'Error', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
 end
 else
  Application.MessageBox(PChar('No hay itinerarios en el listado, realice otro filtro e intente nuevamente.'),
          'Error', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);

end;

function TfSupervisionGeneralR.InactivarClienteDelItinerarioExportado(
  CodigoItinerario: String; var clientesExportados : String): Boolean;
var
  qTemp,qTemp1: TQuery;
begin
  result:=False;
  clientesExportados := '0';

  qTemp := TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';

  qTemp1:= TQuery.Create(nil);
  qTemp1.DatabaseName := 'BaseDato';

  qTemp1.SQL.Clear;
  qTemp1.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM REP_EXPORTACION  WHERE CODIGOITINERARIO=:CODIGOITINERARIO AND REPARTIDO=''NO''  ');
  qTemp1.ParamByName('CODIGOITINERARIO').AsString := CodigoItinerario;
  qTemp1.open;

  if qTemp1.FieldByName('CANTIDAD').AsInteger >0 then
  begin


  qTemp.Close;
  qTemp.SQL.Clear;
  qTemp.SQL.Add('UPDATE  REP_EXPORTACION SET ACTIVO=''N'' WHERE CODIGOITINERARIO=:CODIGOITINERARIO AND REPARTIDO=''NO'' AND ACTIVO=''S''  ');
  qTemp.ParamByName('CODIGOITINERARIO').AsString := CodigoItinerario;

  qTemp.ExecSQL;

  if qTemp.RowsAffected > 0 then
  begin
  Result := True;
  clientesExportados := IntToStr(qTemp.RowsAffected);
  end;

  end
  else
  begin
    Result := True;
   clientesExportados := qTemp1.FieldByName('CANTIDAD').AsString;
  end;

  qTemp.Close;
  qTemp.Free;
  qTemp1.close;
  qTemp1.Free;
end;

function TfSupervisionGeneralR.ActualizarListadoDeTotalesPorItinerario(
  CodigoItinerario, ClientesExportado: String): Boolean;
var
  qTemp: TQuery;
begin
  result:=False;

  qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';



  qTemp.SQL.Clear;
  qTemp.SQL.Add('UPDATE REP_TOTALESPORITINERARIO SET CLIENTESDEVUELTOS=:CLIENTES  WHERE CODIGOITINERARIO=:CODIGOITINERARIO  ');
  qTemp.ParamByName('CODIGOITINERARIO').AsString := CodigoItinerario;
  qTemp.ParamByName('CLIENTES').AsString := ClientesExportado;
  qTemp.ExecSQL;

  if qTemp.RowsAffected > 0 then
  begin
  Result := True;
  end;


  qTemp.Close;
  qTemp.Free;

end;

procedure TfSupervisionGeneralR.ActualizarEstadoClientesListado(
  CodigoItinerario: String);
var
  qTemp: TQuery;

begin

 qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';



qTemp.SQL.Clear;
qTemp.SQL.Add('UPDATE REP_CLIENTESREPARTO C      ');
qTemp.SQL.Add('SET  ');
qTemp.SQL.Add('    CODIGOESTADOCLIENTEREPARTO = 2,  ');
qTemp.SQL.Add('    FECHA_PROGRAMADA_REPARTO = NULL   ');
qTemp.SQL.Add('WHERE  ');
qTemp.SQL.Add('    EXISTS (    ');
qTemp.SQL.Add('        SELECT    ');
qTemp.SQL.Add('            NULL  ');
qTemp.SQL.Add('        FROM    ');
qTemp.SQL.Add('            REP_EXPORTACION R    ');
qTemp.SQL.Add('        WHERE      ');
qTemp.SQL.Add('            ACTIVO = ''N'' AND R.REPARTIDO=''NO''   ');
qTemp.SQL.Add('            AND CODIGOITINERARIO = :CODIGOITINERARIO  ');
qTemp.SQL.Add('            AND C.CODIGOCUENTA = R.CODIGOCUENTA   ');
qTemp.SQL.Add('            AND C.FECHA_PROGRAMADA_REPARTO = R.FECHAPROGRAMADAREPARTO )    ');
  qTemp.ParamByName('CODIGOITINERARIO').AsString := CodigoItinerario;
  qTemp.ExecSQL;

end;

function TfSupervisionGeneralR.consultarEstadoItinerario(
  CodigoItinerario: String): Boolean;
var
  qTemp: TQuery;
begin
  result:=False;

  qTemp:= TQuery.Create(nil);
  qTemp.DatabaseName := 'BaseDato';



  qTemp.SQL.Clear;
  qTemp.SQL.Add('SELECT COUNT(*) AS CANTIDAD FROM REP_ITINERARIO WHERE CODIGOITINERARIO=:CODIGOITINERARIO AND CODIGOESTADOITINERARIO=6');
  qTemp.ParamByName('CODIGOITINERARIO').AsString := CodigoItinerario;
  qTemp.open;

  if qTemp.FieldByName('CANTIDAD').asInteger > 0 then
  begin
  Result := True;
  end;


  qTemp.Close;
  qTemp.Free;

end;

function TfSupervisionGeneralR.ValidarEstadoItinerarioGeneral: Boolean;
begin
result:=false;
qprincipal.First;
    while not qprincipal.Eof do
    begin

    if ConsultarEstadoItinerario(qprincipalCODIGOITINERARIO.AsString) then
    result:=true;


    qprincipal.Next;
    end;



end;

end.
