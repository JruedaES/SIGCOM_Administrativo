unit uControlResultado;

interface

uses
Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Db, Buttons, Grids, DBGrids, DBTables,
  ConsDll, uInformacionOriginal, uInformacionMedidor,
  ComCtrls, TeeProcs, TeEngine, Chart, DBChart, Series, uListaCritica, Math,
  uSeleccionarObservacion, ToolWin, ImgList, RXDBCtrl, DBClient,uBase, Spin,
  ExtDlgs;

type

    TRespuesta = class (Tobject)
    private
    codigoRespuesta : Integer;
    nombreRespuesta : String;
    cantidad : Double;
    public
    end;

    TfControlResultado = class(TFBase)
    Label30: TLabel;
    DBText3: TDBText;
    pPrincipal: TPanel;
    pOpciones: TPanel;
    pSuperior: TPanel;
    pContenedorInfo: TPanel;
    dsDatosSede: TDataSource;
    iLista: TImageList;
    pElemento: TPanel;
    tbOpciones: TToolBar;
    tbFiltrar: TToolButton;
    tbExportar: TToolButton;
    tbActualizar: TToolButton;
    pActualizacion: TPanel;
    Label1: TLabel;
    cbRefrescar: TCheckBox;
    ToolButton4: TToolButton;
    lElemento: TLabel;
    timer: TTimer;
    edMinutos: TSpinEdit;
    pConsulta: TPanel;
    lConsulta: TLabel;
    pPeriodo: TPanel;
    lPeriodo: TLabel;
    lcbConsulta: TDBLookupComboBox;
    pContenedorGraficas: TPanel;
    pDerecha: TPanel;
    pContenedorTabla: TPanel;
    pGraficaTotal: TPanel;
    qConsulta: TQuery;
    dsConsulta: TDataSource;
    qElemento: TQuery;
    dsElemento: TDataSource;
    Panel18: TPanel;
    Panel1: TPanel;
    ePeriodo: TEdit;
    qConsultaCODIGOCONSULTA: TFloatField;
    qConsultaNOMBRECONSULTA: TMemoField;
    qConsultaNOMBRE: TStringField;
    dsDatosResultado: TDataSource;
    qDatosResultado: TQuery;
    qDatosResultadoPORCENTAJE: TFloatField;
    qDatosResultadoRESPUESTA: TStringField;
    qDatosResultadoNOMBRERESPUESTA: TStringField;
    qDatosResultadoCANTIDAD: TFloatField;
    dsDatosResultadosBarras: TDataSource;
    qRespuestaPregunta: TQuery;
    qRespuestaPreguntaCODIGORESPUESTA: TFloatField;
    qRespuestaPreguntaNOMBRERESPUESTA: TStringField;
    qDatosResultadoBarras: TQuery;
    qDatosResultadoBarrasRESPUESTA: TStringField;
    qDatosResultadoBarrasCODIGOCONSULTA: TFloatField;
    cAvanceGeneralEncuestados: TChart;
    PieSeries3: TPieSeries;
    qGeneralEncuestados: TQuery;
    pTotalEncuestados: TPanel;
    pEncuestados: TPanel;
    Label5: TLabel;
    qGeneralEncuestadosCANTIDAD_SI: TFloatField;
    qGeneralEncuestadosCANTIDAD_NO: TFloatField;
    qGeneralEncuestadosTOTAL: TFloatField;
    qGeneralEncuestadosPORCENTAJE_SI: TFloatField;
    qGeneralEncuestadosPORCENTAJE_NO: TFloatField;
    sbGraficas: TScrollBox;
    RxDBGrid1: TRxDBGrid;
    SpeedButton2: TSpeedButton;
    SavePictureDialog1: TSavePictureDialog;
    qSedeOperativaUnicaRes: TQuery;
    qDialgeoUnicaRes: TQuery;
    qItinerarioUnicaRes: TQuery;
    qGrupoClientesUnicaRes: TQuery;
    qCircuitoUnicaRes: TQuery;
    qSubestacionUnicaRes: TQuery;
    qTodoPaisUnicaRes: TQuery;
    qClienteUnicaRes: TQuery;
    qDialgeoMultipleRes: TQuery;
    qItinerarioMultipleRes: TQuery;
    qSedeOperativaMultipleRes: TQuery;
    qGrupoClientesMultipleRes: TQuery;
    qCircuitoMultipleRes: TQuery;
    qSubestacionMultipleRes: TQuery;
    qTodoPaisMultipleRes: TQuery;
    qClienteMultipleRes: TQuery;
    qSedeOperativaUnicaResPORCENTAJE: TFloatField;
    qSedeOperativaUnicaResRESPUESTA: TStringField;
    qSedeOperativaUnicaResNOMBRERESPUESTA: TStringField;
    qSedeOperativaUnicaResCANTIDAD: TFloatField;
    qDialgeoUnicaResPORCENTAJE: TFloatField;
    qDialgeoUnicaResRESPUESTA: TStringField;
    qDialgeoUnicaResNOMBRERESPUESTA: TStringField;
    qDialgeoUnicaResCANTIDAD: TFloatField;
    qItinerarioUnicaResPORCENTAJE: TFloatField;
    qItinerarioUnicaResRESPUESTA: TStringField;
    qItinerarioUnicaResNOMBRERESPUESTA: TStringField;
    qItinerarioUnicaResCANTIDAD: TFloatField;
    qGrupoClientesUnicaResPORCENTAJE: TFloatField;
    qGrupoClientesUnicaResRESPUESTA: TStringField;
    qGrupoClientesUnicaResNOMBRERESPUESTA: TStringField;
    qGrupoClientesUnicaResCANTIDAD: TFloatField;
    qSubestacionUnicaResPORCENTAJE: TFloatField;
    qSubestacionUnicaResRESPUESTA: TStringField;
    qSubestacionUnicaResNOMBRERESPUESTA: TStringField;
    qSubestacionUnicaResCANTIDAD: TFloatField;
    qCircuitoUnicaResPORCENTAJE: TFloatField;
    qCircuitoUnicaResRESPUESTA: TStringField;
    qCircuitoUnicaResNOMBRERESPUESTA: TStringField;
    qCircuitoUnicaResCANTIDAD: TFloatField;
    qTodoPaisUnicaResPORCENTAJE: TFloatField;
    qTodoPaisUnicaResRESPUESTA: TStringField;
    qTodoPaisUnicaResNOMBRERESPUESTA: TStringField;
    qTodoPaisUnicaResCANTIDAD: TFloatField;
    qClienteUnicaResPORCENTAJE: TFloatField;
    qClienteUnicaResRESPUESTA: TStringField;
    qClienteUnicaResNOMBRERESPUESTA: TStringField;
    qClienteUnicaResCANTIDAD: TFloatField;
    qDialgeoMultipleResRESPUESTA: TStringField;
    qDialgeoMultipleResCODIGOCONSULTA: TFloatField;
    qItinerarioMultipleResRESPUESTA: TStringField;
    qItinerarioMultipleResCODIGOCONSULTA: TFloatField;
    qSedeOperativaMultipleResRESPUESTA: TStringField;
    qSedeOperativaMultipleResCODIGOCONSULTA: TFloatField;
    qGrupoClientesMultipleResRESPUESTA: TStringField;
    qGrupoClientesMultipleResCODIGOCONSULTA: TFloatField;
    qCircuitoMultipleResRESPUESTA: TStringField;
    qCircuitoMultipleResCODIGOCONSULTA: TFloatField;
    qSubestacionMultipleResRESPUESTA: TStringField;
    qSubestacionMultipleResCODIGOCONSULTA: TFloatField;
    qTodoPaisMultipleResRESPUESTA: TStringField;
    qTodoPaisMultipleResCODIGOCONSULTA: TFloatField;
    qClienteMultipleResRESPUESTA: TStringField;
    qClienteMultipleResCODIGOCONSULTA: TFloatField;
    qDatosResultadosTorta: TQuery;
    qElementoELEMENTO: TStringField;
    qElementoCODIGOELEMENTO: TStringField;
    qElementoCODIGOTIPOELEMENTO: TFloatField;
    qDatosResultadosTortaPORCENTAJE: TFloatField;
    qDatosResultadosTortaRESPUESTA: TStringField;
    qDatosResultadosTortaNOMBRERESPUESTA: TStringField;
    qDatosResultadosTortaCANTIDAD: TFloatField;
    lcbElemento: TDBLookupComboBox;
    qDatosResultadoBarra2: TQuery;
    qDatosResultadoBarra2RESPUESTA: TStringField;
    qDatosResultadoBarra2CODIGOCONSULTA: TFloatField;
    cdsDatosBarras: TClientDataSet;
    ttbDetalle: TToolButton;
    ToolButton1: TToolButton;

    procedure FormCreate(Sender: TObject);
    procedure tbFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure timerTimer(Sender: TObject);
    procedure cbRefrescarClick(Sender: TObject);
    procedure edMinutosKeyPress(Sender: TObject; var Key: Char);
    procedure tbActualizarClick(Sender: TObject);
    procedure qConsultaCalcFields(DataSet: TDataSet);
    procedure cAvanceGeneralEncuestadosClickTorta(Sender: TObject);
    procedure cAvanceGeneralEncuestadosClickBarras(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    procedure AssignPanelImageToPicture(Panel: TPanel;FileName  : String);
    function ConsultaResultadosTorta : String;
    function ConsultaResultadosBarra : String;
    procedure qConsultaAfterScroll(DataSet: TDataSet);
    procedure lcbConsultaClick(Sender: TObject);
    procedure cdsDatosBarrasFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);




  private

    procedure FiltrarInformacion;
    //procedure GraficaGeneralEncuestados;
    

  public
    { Public declarations }


  end;

var
  fControlResultado: TfControlResultado;
  TipoFacturacion, TipoFacturacionReactiva, TipoFacturacionDemanda, CodConsulta: Integer;
  Colores: array[0..10] of TColor;
  


implementation

uses uFuncionSGD, uODTPadre, uCambiarLectura, uFormaFecha,
  uGaleriaPreliminar, uFormaEspere, uListaLecturas, uListaLecturasGeneral,
  uExpoItinerarios, uListadoRespuestas;

{$R *.DFM}


function GetFecha: string;
var
sPeriodo, sFecha : String;
begin
  FFormaFecha := TFFormaFecha.Create(Application);
  if FFormaFecha.ShowModal = mrOk then
   begin
   sPeriodo := FormatDateTime('yyyymm', FFormaFecha.Date);
   Result := sPeriodo;
    end
  else
    Result := '';
  FFormaFecha.Free;
end;



//----------------------- Crear Formulario ------------------------------
procedure TfControlResultado.FormCreate(Sender: TObject);
begin
//coloco aquí los colores
Colores[0] := rgb(139, 217, 217);
Colores[1] := rgb(242,116,87);
Colores[2] := rgb(83,130,130);
Colores[3] := rgb(152,201,77);
Colores[4] := rgb(166,95,90);
Colores[5] := rgb(145,188,237);
Colores[6] := rgb(222,203,197);


//qElemento.open;
//qConsulta.open;




end;

//----------------------- Botón filtrar ------------------------------
procedure TfControlResultado.tbFiltrarClick(Sender: TObject);
begin

  //CambiarTexto(true);
  FiltrarInformacion;

end;

procedure TfControlResultado.FormShow(Sender: TObject);
begin


//qElemento.close;
//qElemento.open;

qConsulta.close;
qConsulta.open;

end;


procedure TfControlResultado.timerTimer(Sender: TObject);
begin
FiltrarInformacion;
end;


// ----------------------- Filtrar Información ------------------------------
procedure TfControlResultado.FiltrarInformacion;

var
  g: TChart;
  p: TPanel;
  pTitulo : TPanel;
  memo1 : TMemo;
  qryConsulta, qryConsultaNombre: TQuery;
  PieSeries1: TPieSeries;
  BarSeries1: TBarSeries;
  i, j, k, h: Integer;
  EquivalentePor: Double;
  sl: TstringList;
  tl: TList;
  respuesta :TRespuesta;
 


begin
  // Inicialización del TList
  tl := TList.Create;


  //Limpia los elementos creados en el contenedor de las gráficas
  while sbGraficas.ControlCount > 0 do
  sbGraficas.Controls[0].Free;

   PieSeries3.Clear;
   pEncuestados.Caption := '';
   qDatosResultadoBarras.close;
   qDatosResultadoBarra2.close;
   qDatosResultado.close;
   qDatosResultadosTorta.close;
   if not cdsDatosBarras.IsEmpty then
   begin
   cdsDatosBarras.EmptyDataSet;
   end;

   

  // qry para traer código de consultas realizadas para el periodo seleccionado
  qryConsulta := TQuery.Create(nil);
  qryConsulta.DatabaseName := 'BaseDato';
  qryConsulta.SQL.Clear;

  //Periodo
  if (ePeriodo.Text <>'') and (lcbConsulta.Text =  '')  then
     begin
  qryConsulta.SQL.Add('SELECT DISTINCT');
  qryConsulta.SQL.Add('c.codigoconsulta        AS consulta,');
  qryConsulta.SQL.Add('c.codigotipoconsulta    AS codigo,');
  qryConsulta.SQL.Add('c.nombreconsulta        AS nombre');
  qryConsulta.SQL.Add('FROM');
  qryConsulta.SQL.Add('enc_consulta   c,');
  qryConsulta.SQL.Add('enc_resultado  er,');
  qryConsulta.SQL.Add('enc_elementoconsulta e');
  qryConsulta.SQL.Add('WHERE');
  qryConsulta.SQL.Add('c.codigoconsulta = er.codigoconsulta');
  qryConsulta.SQL.Add('and c.codigoconsulta = e.codigoconsulta');
  qryConsulta.SQL.Add('and er.periodo = e.periodo');
  qryConsulta.SQL.Add('AND er.periodo = :periodo');
  qryConsulta.SQL.Add('AND ( c.codigotipoconsulta = ''3''');
  qryConsulta.SQL.Add('OR c.codigotipoconsulta = ''4'' )');
  qryConsulta.SQL.Add('ORDER BY c.codigotipoconsulta');
  qryConsulta.close;
  qryConsulta.ParamByName('PERIODO').asString := ePeriodo.text;
  end

  //Periodo y Consulta
  else if (ePeriodo.Text <> '') and (lcbConsulta.Text <>  '')  then
  begin
  qryConsulta.SQL.Add('SELECT DISTINCT');
  qryConsulta.SQL.Add('c.codigoconsulta        AS consulta,');
  qryConsulta.SQL.Add('c.codigotipoconsulta    AS codigo,');
  qryConsulta.SQL.Add('c.nombreconsulta        AS nombre');
  qryConsulta.SQL.Add('FROM');
  qryConsulta.SQL.Add('enc_consulta   c,');
  qryConsulta.SQL.Add('enc_resultado  er,');
  qryConsulta.SQL.Add('enc_elementoconsulta e');
  qryConsulta.SQL.Add('WHERE');
  qryConsulta.SQL.Add('c.codigoconsulta = er.codigoconsulta');
  qryConsulta.SQL.Add('AND c.codigoconsulta = e.codigoconsulta');
  qryConsulta.SQL.Add('AND c.codigoconsulta = :consulta');
  qryConsulta.SQL.Add('AND er.periodo = :periodo');
  qryConsulta.SQL.Add('AND ( c.codigotipoconsulta = ''3''');
  qryConsulta.SQL.Add('OR c.codigotipoconsulta = ''4'' )');
  qryConsulta.SQL.Add('ORDER BY c.codigotipoconsulta');
  qryConsulta.close;
  qryConsulta.ParamByName('PERIODO').asString := ePeriodo.text;
  qryConsulta.ParamByName('CONSULTA').asString := lcbConsulta.KeyValue;
  end

  //Ningún criterio de Búsqueda
   else
   begin
    Application.MessageBox('Ha ocurrido un error, no existen críterios de búsqueda, por favor ingrese Período, Período y Consulta o Período, Consulta y Elemento ','INFORMACIÓN',MB_ICONINFORMATION);
   exit;
   end;

  qryConsulta.open;


  while not qryConsulta.Eof do
  begin

      // Paneles
      p := TPanel.Create(sbGraficas);
      p.Parent := sbGraficas;
      p.align := AlTop;
      p.Height := 200;
      p.Width := 64;

      //Paneles para títulos de cada gráfica
      pTitulo := TPanel.Create(p);
      pTitulo.Parent := p;
      pTitulo.align := AlTop;
      pTitulo.Color := $00414431;
      pTitulo.Font.Color := clWhite;
      pTitulo.Caption := qryConsulta.FieldbyName('nombre').asString;
      pTitulo.Font.Style := [fsBold];
      pTitulo.BevelOuter := bvRaised;
      pTitulo.BevelInner := bvNone;
      pTitulo.BorderStyle := bsNone;
      pTitulo.Font.Size := 8;
      pTitulo.Height := 17;
      pTitulo.Width := 63;



      // ----------------------- ÚNICA RESPUESTA -----------------------

    if qryConsulta.FieldbyName('codigo').asInteger = 3 then
    begin
      qDatosResultado.close;

      qDatosResultado.sql.clear;
      qDatosResultado.sql.Text := ConsultaResultadosTorta;


      //ShowMessage(lcbElemento.Text);
      //ShowMessage(qDatosResultado.sql.text);

      //Captura de parámetro Elemento cuando lo hay.
      if  lcbElemento.text <> '' then
      qDatosResultado.ParamByName('CODIGOELEMENTO').asString := qElementoCODIGOELEMENTO.asString;


      qDatosResultado.ParamByName('PERIODO').asString := ePeriodo.text;
      qDatosResultado.ParamByName('CONSULTA').asString := qryConsulta.FieldbyName('consulta').asString;
      qDatosResultado.open;


      // Gráficas
      g := TChart.Create(p);
      PieSeries1 := TPieSeries.Create(g);
      g.Parent := p;
      g.align := alClient;
      g.BackWall.Pen.Visible := False;
      g.AxisVisible := false;
      //g.BottomAxis.Automatic := false;
      //g.LeftAxis.Automatic := false;
      //g.RightAxis.Automatic := false;
      //g.TopAxis.Automatic := false;
      g.AutoSize := false;
      g.View3D := false;
      g.AddSeries(PieSeries1);
      g.MarginBottom := 4;
      g.MarginLeft := 3;
      g.MarginRight := 3;
      g.MarginBottom := 4;
      g.Legend.Visible := false;
      i := 1;

      g.tag := qryConsulta.FieldbyName('consulta').AsInteger;

      g.OnClick := cAvanceGeneralEncuestadosClickTorta;


      qDatosResultado.First;
      while not qDatosResultado.Eof do
      begin

        // PieSeries
        PieSeries1.AddPie(qDatosResultadoPORCENTAJE.AsFloat,
          qDatosResultadoNOMBRERESPUESTA.asString, Colores[i]);
        i := (i + 1) mod 10;
        PieSeries1.CustomXRadius := 65;
        PieSeries1.CustomYRadius := 65;
        PieSeries1.Marks.Transparent := True;
        PieSeries1.Marks.Style := smsLabelPercent;
        PieSeries1.Marks.Frame.Visible := false;
        PieSeries1.PiePen.Visible := false;
        PieSeries1.ColorEachPoint := True;
        PieSeries1.UsePatterns := false;
        PieSeries1.Marks.Arrow.Visible := True;
        PieSeries1.Marks.Arrow.Style := psSolid;
        PieSeries1.Marks.Arrow.Color := clBlack;
        PieSeries1.Marks.Clip := False;
      

        qDatosResultado.Next;
      end;
      qDatosResultado.close;

    end

    // ----------------------- MÚLTIPLE RESPUESTA -------------------------------------

    else if qryConsulta.FieldbyName('codigo').asInteger = 4 then
    begin

      // CODIGORESPUESTA Y CODIGOCONSULTA - SPLIT
      qDatosResultadoBarras.close;




       //********************************************************************
       qDatosResultadoBarras.sql.clear;
      qDatosResultadoBarras.sql.Text := ConsultaResultadosBarra;

      // Captura de parámetro ELemento cuando lo hay
      if  lcbElemento.text <> '' then
      qDatosResultadoBarras.ParamByName('CODIGOELEMENTO').asString := qElementoCODIGOELEMENTO.asString;
      //*********************************************************************


      qDatosResultadoBarras.ParamByName('PERIODO').asString := ePeriodo.text;
      qDatosResultadoBarras.ParamByName('CONSULTA').asString := qryConsulta.FieldbyName('consulta').asString;
      qDatosResultadoBarras.open;

      // CODIGORESPUESTA Y NOMBRERESPUESTA
      qRespuestaPregunta.close;
      qRespuestaPregunta.ParamByName('CONSULTA').asString := qryConsulta.FieldbyName('consulta').asString;
      qRespuestaPregunta.open;



      tl.Clear;
      i :=0;

      while not qRespuestaPregunta.Eof do
      begin
        respuesta := TRespuesta.Create;
        respuesta.codigoRespuesta := qRespuestaPreguntaCODIGORESPUESTA.asInteger;
        respuesta.nombreRespuesta := qRespuestaPreguntaNOMBRERESPUESTA.asString;
        respuesta.cantidad := 0;
        tl.Add(respuesta);
        qRespuestaPregunta.Next;
        end;


      // Gráficas
      g := TChart.Create(p);
      BarSeries1 := TBarSeries.Create(g);
      g.Parent := p;
      g.align := alClient;
      g.AddSeries(BarSeries1);
      g.AutoSize := false;
      g.BackWall.Pen.Visible := False;
      g.View3D := false;
      g.AxisVisible := false;
      g.MarginBottom := 4;
      g.MarginLeft := 3;
      g.MarginRight := 3;
      g.MarginBottom := 4;
      g.Legend.Visible := false;

      g.tag := qryConsulta.FieldbyName('consulta').AsInteger;
      g.OnClick := cAvanceGeneralEncuestadosClickBarras;





        while not qDatosResultadoBarras.Eof do
        begin
          sl := TstringList.Create;
          sl.CommaText := qDatosResultadoBarras.FieldbyName('RESPUESTA').asString;

          for j := 0 to tl.Count - 1 do // ES CADA RESPUESTAS
          begin

            for k := 0 to sl.Count - 1 do // SON TODAS LAS RESPUESTAS
            BEGIN

              if TRespuesta(tl[j]).codigoRespuesta = strtoint(sl[k]) then
              begin
                TRespuesta(tl[j]).cantidad := TRespuesta(tl[j]).cantidad + 1;
              end;
            END;

          end;

          qDatosResultadoBarras.Next;
        end;
        for j := 0 to tl.Count - 1 do // ES CADA RESPUESTA
          begin


               cdsDatosBarras.Append;
               cdsDatosBarras.FieldByName('CONSULTA').AsString := qryConsulta.FieldbyName('consulta').asString;
               cdsDatosBarras.FieldByName('CANTIDAD').AsFloat := TRespuesta(tl[j]).cantidad;
               cdsDatosBarras.FieldByName('RESPUESTA').AsInteger := TRespuesta(tl[j]).codigoRespuesta;
               cdsDatosBarras.FieldByName('NOMBRERESPUESTA').AsString := TRespuesta(tl[j]).nombreRespuesta;
               cdsDatosBarras.Post;

        // BarSeries
                BarSeries1.AddBar(TRespuesta(tl[j]).cantidad, TRespuesta(tl[j]).nombreRespuesta, Colores[i]);
                i := (i + 1) mod 10;
                BarSeries1.Marks.Transparent := True;
                BarSeries1.Marks.Style := smsLabelPercent;
                BarSeries1.Marks.Frame.Visible := false;
                BarSeries1.BarPen.Visible := false;
                BarSeries1.ColorEachPoint := True;
                BarSeries1.BarPen.Visible := False;
                BarSeries1.BarWidthPercent := 75;
                BarSeries1.Marks.Arrow.Visible := True;
                BarSeries1.Marks.Arrow.Style := psSolid;
                BarSeries1.Marks.Arrow.Color := clBlack;
                END;

        qDatosResultadoBarras.close;
      end;

      qryConsulta.Next;
    end;
    qryConsulta.close;
    qryConsulta.free;
end;


// ----------------------- Refrescar Información ------------------------------
procedure TfControlResultado.cbRefrescarClick(Sender: TObject);
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

// ----------------------- Validación Segundos Actualización Automática ------------------------------
procedure TfControlResultado.edMinutosKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not(Key in ['0' .. '9', Char(VK_BACK), Char(VK_DELETE)]) then
    Key := #0;
end;

// ----------------------- Actualizar Información ------------------------------
procedure TfControlResultado.tbActualizarClick(Sender: TObject);
begin
FiltrarInformacion;
end;

// ----------------------- Calculo de caracteres del campo nombre ------------------------------
procedure TfControlResultado.qConsultaCalcFields(DataSet: TDataSet);
begin
qConsultaNOMBRE.AsString := qConsultaNOMBRECONSULTA.AsString;
end;


// ----------------------- Gráfica General de Encuestados y Tablas de Información Torta ------------------------------
procedure TfControlResultado.cAvanceGeneralEncuestadosClickTorta(Sender: TObject);
var
  Color,Color2: Tcolor;
begin

     if ttbDetalle.Down = True then
     begin
     fListadoRespuestas := TfListadoRespuestas.Create(Application, ePeriodo.text, inttostr(TChart(Sender).tag));
     fListadoRespuestas.Show;
     end;

     Color := rgb(139,217,217);
     Color2:= rgb(242,116,87);


    // ENCUESTADO, NO ENCUESTADOS Y TOTAL
      qGeneralEncuestados.close;
      qGeneralEncuestados.ParamByName('CONSULTA').asString := inttostr(TChart(Sender).tag);
      qGeneralEncuestados.ParamByName('PERIODO').asString := ePeriodo.text;
      qGeneralEncuestados.open;

   PieSeries3.Clear;
   PieSeries3.AddPie(qGeneralEncuestadosPORCENTAJE_SI.AsFloat,'Encuestados',Color);
   PieSeries3.AddPie(qGeneralEncuestadosPORCENTAJE_NO.AsFloat,'No Encuestados',Color2);
   pEncuestados.Caption := qGeneralEncuestadosTOTAL.AsString + ' / ' + qGeneralEncuestadosCANTIDAD_SI.AsString;


   qDatosResultado.close;
   qDatosResultado.ParamByName('CONSULTA').asString := inttostr(TChart(Sender).tag);
   qDatosResultado.Open;

   dsDatosResultado.DataSet := qDatosResultado;

end;

// ----------------------- Gráfica General de Encuestados y Tablas de Información Barras ------------------------------
procedure TfControlResultado.cAvanceGeneralEncuestadosClickBarras(Sender: TObject);
var
  Color,Color2: Tcolor;
begin

     if ttbDetalle.Down = True then
     begin
     fListadoRespuestas := TfListadoRespuestas.Create(Application,ePeriodo.text, inttostr(TChart(Sender).tag));
     fListadoRespuestas.Show;
     end;


     Color := rgb(139,217,217);
     Color2:= rgb(242,116,87);


    // ENCUESTADO, NO ENCUESTADOS Y TOTAL
      qGeneralEncuestados.close;
      qGeneralEncuestados.ParamByName('CONSULTA').asString := inttostr(TChart(Sender).tag);
      qGeneralEncuestados.ParamByName('PERIODO').asString := ePeriodo.text;
      qGeneralEncuestados.open;

   PieSeries3.Clear;
   PieSeries3.AddPie(qGeneralEncuestadosPORCENTAJE_SI.AsFloat,'Encuestados',Color);
   PieSeries3.AddPie(qGeneralEncuestadosPORCENTAJE_NO.AsFloat,'No Encuestados',Color2);
   pEncuestados.Caption := qGeneralEncuestadosTOTAL.AsString;

   CodConsulta := TChart(Sender).tag;
   cdsDatosBarras.Filtered := False;
   cdsDatosBarras.Filtered := True;
   dsDatosResultado.DataSet := cdsDatosBarras;

end;



procedure TfControlResultado.SpeedButton2Click(Sender: TObject);
var
  sPeriodo, sFecha: String;
begin
sFecha := ePeriodo.Text;
ePeriodo.Text := GetFecha;
//lcbConsulta.Text := '';
//lcbElemento.Text := '';


if ePeriodo.Text <> '' then
begin
pConsulta.Enabled := true;
qConsulta.Close;
qConsulta.ParamByName('PERIODO').asString := ePeriodo.text;
qConsulta.open;
end;
end;



procedure TfControlResultado.AssignPanelImageToPicture(Panel: TPanel;FileName  : String);
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

procedure TfControlResultado.tbExportarClick(Sender: TObject);
begin
if SavePictureDialog1.Execute  then
AssignPanelImageToPicture(pContenedorInfo,SavePictureDialog1.FileName);
end;

function TfControlResultado.ConsultaResultadosTorta: String;
begin

     result:= qDatosResultadosTorta.sql.Text;

     if lcbElemento.text <> '' then
     begin
         if qElementoCODIGOTIPOELEMENTO.asInteger = 3 then
         result := qSedeOperativaUnicaRes.sql.Text
     else if qElementoCODIGOTIPOELEMENTO.asInteger = 4 then
         result := qDialgeoUnicaRes.sql.Text
     else if qElementoCODIGOTIPOELEMENTO.asInteger = 5 then
         result := qItinerarioUnicaRes.sql.Text
     else if qElementoCODIGOTIPOELEMENTO.asInteger = 6 then
         result := qSubestacionUnicaRes.sql.Text
     else if qElementoCODIGOTIPOELEMENTO.asInteger = 7 then
         result := qCircuitoUnicaRes.sql.Text
     else if qElementoCODIGOTIPOELEMENTO.asInteger = 22 then
         result := qGrupoClientesUnicaRes.sql.Text
     else if qElementoCODIGOTIPOELEMENTO.asInteger = 2 then
         result := qTodoPaisUnicaRes.sql.Text
     else if qElementoCODIGOTIPOELEMENTO.asInteger = 23 then
         result := qClienteUnicaRes.sql.Text
     end;

end;

procedure TfControlResultado.qConsultaAfterScroll(DataSet: TDataSet);
begin
qElemento.close;
qElemento.ParamByName('PERIODO').asString := ePeriodo.text;
qElemento.ParamByName('CONSULTA').asString := qConsultaCODIGOCONSULTA.asString;
qElemento.open;
end;


procedure TfControlResultado.lcbConsultaClick(Sender: TObject);
begin
   pElemento.Enabled := True;
end;

function TfControlResultado.ConsultaResultadosBarra: String;
begin

  result:= qDatosResultadoBarra2.sql.Text;

     if lcbElemento.text <> '' then
     begin
         if qElementoCODIGOTIPOELEMENTO.asInteger = 4 then
         result := qDialgeoMultipleRes.sql.Text
     else if qElementoCODIGOTIPOELEMENTO.asInteger = 5 then
         result := qItinerarioMultipleRes.sql.Text
     else if qElementoCODIGOTIPOELEMENTO.asInteger = 3 then
         result := qSedeOperativaMultipleRes.sql.Text
     else if qElementoCODIGOTIPOELEMENTO.asInteger = 22 then
         result := qGrupoClientesMultipleRes.sql.Text
     else if qElementoCODIGOTIPOELEMENTO.asInteger = 7 then
         result := qCircuitoMultipleRes.sql.Text
     else if qElementoCODIGOTIPOELEMENTO.asInteger = 6 then
         result := qSubestacionMultipleRes.sql.Text
     else if qElementoCODIGOTIPOELEMENTO.asInteger = 2 then
         result := qTodoPaisMultipleRes.sql.Text
     else if qElementoCODIGOTIPOELEMENTO.asInteger = 23 then
         result := qClienteMultipleRes.sql.Text
     end;

end;

procedure TfControlResultado.cdsDatosBarrasFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
      accept := cdsDatosBarras.FieldByName('CONSULTA').AsInteger = CodConsulta;

end;

end.
