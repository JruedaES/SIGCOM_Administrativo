unit uIndiceAreaMetropolitana;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, UtdNavigator, ExtCtrls, Buttons, RXSplit, Grids, DBGrids, RXDBCtrl,
  Db, DBTables, ComCtrls, StdCtrls, Mask, DBCtrls, TeEngine, Series,
  TeeProcs, Chart, DBChart, Menus, UTrCVS, Digisoft;

type
  TfIndiceAreaMetropolitana = class(TFBase)
    Panel1: TPanel;
    Panel2: TPanel;
    SBSalir: TSpeedButton;
    SBImprimir: TSpeedButton;
    SBBuscar: TSpeedButton;
    SBOrdenar: TSpeedButton;
    Bevel2: TBevel;
    SBEstadistica: TSpeedButton;
    Bevel3: TBevel;
    Bevel1: TBevel;
    sbExportar: TSpeedButton;
    dNavigator1: TdNavigator;
    pSuperior: TPanel;
    dsIndice: TDataSource;
    qTotales: TQuery;
    qTotalesPROMEDIODICTADO: TFloatField;
    qTotalesPROMEDIOLLEGADA: TFloatField;
    qTotalesPROMEDIOATENCION: TFloatField;
    qTotalesPROMEDIOTOTAL: TFloatField;
    qTotalesPromedio1: TStringField;
    qTotalesPromedio2: TStringField;
    qTotalesPromedio3: TStringField;
    qTotalesPromedio4: TStringField;
    dsTotales: TDataSource;
    qIndice: TQuery;
    qIndiceCODIGOREPORTE: TFloatField;
    qIndiceCODIGOADMINISTRATIVO: TFloatField;
    qIndiceCODIGOGRUPOTRABAJO: TFloatField;
    qIndiceFECHAHORA: TDateTimeField;
    qIndiceFECHAHORADICTADO: TDateTimeField;
    qIndiceFECHAHORALLEGADA: TDateTimeField;
    qIndiceFECHAHORAATENCION: TDateTimeField;
    qIndiceNOMBREGRUPOTRABAJO: TStringField;
    qIndiceTiempoDictado: TStringField;
    qIndiceTiempoLlegada: TStringField;
    qIndiceTiempoAtencion: TStringField;
    qIndiceTiempoTotal: TStringField;
    UpdIndice: TUpdateSQL;
    qRegistros: TQuery;
    qTotalesMINDICTADO: TFloatField;
    qTotalesMAXDICTADO: TFloatField;
    qTotalesMINLLEGADA: TFloatField;
    qTotalesMAXLLEGADA: TFloatField;
    qTotalesMINATENCION: TFloatField;
    qTotalesMAXATENCION: TFloatField;
    qTotalesMINTOTAL: TFloatField;
    qTotalesMAXTOTAL: TFloatField;
    qTotalesMin1: TStringField;
    qTotalesMin2: TStringField;
    qTotalesMin3: TStringField;
    qTotalesMin4: TStringField;
    qTotalesMax1: TStringField;
    qTotalesMax2: TStringField;
    qTotalesMax3: TStringField;
    qTotalesMax4: TStringField;
    PageControl1: TPageControl;
    tsListadoReportes: TTabSheet;
    tsResumenMoviles: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    pSuperior2: TPanel;
    RxSplitter1: TRxSplitter;
    pInferior2: TPanel;
    pIzquierdoSuperior: TPanel;
    RxSplitter2: TRxSplitter;
    qGruposTrabajo: TQuery;
    qTiemposGrupo: TQuery;
    qTiemposGrupoNOMBREGRUPOTRABAJO: TStringField;
    qTiemposGrupoPROMEDIODICTADO: TFloatField;
    qTiemposGrupoPROMEDIOLLEGADA: TFloatField;
    qTiemposGrupoPROMEDIOATENCION: TFloatField;
    qTiemposGrupoPROMEDIOTOTAL: TFloatField;
    qTiemposGrupoMINDICTADO: TFloatField;
    qTiemposGrupoMAXDICTADO: TFloatField;
    qTiemposGrupoMINLLEGADA: TFloatField;
    qTiemposGrupoMAXLLEGADA: TFloatField;
    qTiemposGrupoMINATENCION: TFloatField;
    qTiemposGrupoMAXATENCION: TFloatField;
    qTiemposGrupoMINTOTAL: TFloatField;
    qTiemposGrupoMAXTOTAL: TFloatField;
    qTiemposGrupoPromedio1: TStringField;
    dsTiemposGrupo: TDataSource;
    DBGrid1: TDBGrid;
    qTiemposGrupoPromedio2: TStringField;
    qTiemposGrupoPromedio3: TStringField;
    qTiemposGrupoPromedio4: TStringField;
    qTiemposGrupoMin1: TStringField;
    qTiemposGrupoMin2: TStringField;
    qTiemposGrupoMin3: TStringField;
    qTiemposGrupoMin4: TStringField;
    qTiemposGrupoMax1: TStringField;
    qTiemposGrupoMax2: TStringField;
    qTiemposGrupoMax3: TStringField;
    qTiemposGrupoMax4: TStringField;
    qReporte: TQuery;
    qReporteDireccionCalculada: TStringField;
    qReporteTELEFONO: TStringField;
    qReporteNOMBREINFORMANTE: TStringField;
    qODTDia: TQuery;
    qIndiceCODIGOODT: TFloatField;
    qODTDiaIMPRESOODT: TStringField;
    qODTDiaOBSERVACION1: TStringField;
    qTraslado: TQuery;
    qTrasladoCODIGOADMINISTRATIVO: TFloatField;
    qTrasladoNOMBRECATEGORIA: TStringField;
    qIndiceCIGDANO: TFloatField;
    qIndiceCODIGOSUBESTACION: TStringField;
    qIndiceCODIGOCIRCUITO: TStringField;
    qCIG: TQuery;
    qCIGNIVEL: TFloatField;
    qCIGCIUDAD: TStringField;
    qCIGBARRIO: TStringField;
    qDir_Reporte: TQuery;
    tsListadoMateriales: TTabSheet;
    qMaterialResumen: TQuery;
    dsMaterialResumen: TDataSource;
    dbgridListaMateriales: TRxDBGrid;
    qNombreMaterial: TQuery;
    qNombreMaterialCODIGOMATERIAL: TFloatField;
    qNombreMaterialNOMBREMATERIAL: TStringField;
    qNombreMaterialCODIGOUNIDAD: TStringField;
    qNombreMaterialVALORUNITARIO: TFloatField;
    qMaterialResumenCODIGOMATERIAL: TFloatField;
    qMaterialResumenSUMCANTIDADSOLICITADA: TFloatField;
    qMaterialResumenSUMCANTIDADCONSUMIDA: TFloatField;
    qMaterialResumenSUMCANTIDADENTREGADA: TFloatField;
    qMaterialResumenSUMCANTIDADREINTEGRADABUENA: TFloatField;
    qMaterialResumenSUMCANTIDADREINTEGRADAMALA: TFloatField;
    qMaterialResumenSUMCANTIDADRETIRADABUENA: TFloatField;
    qMaterialResumenSUMCANTIDADRETIRADAMALA: TFloatField;
    qMaterialResumenNombreMaterial: TStringField;
    qMaterialResumenNombreUnidad: TStringField;
    qTiemposGrupoSUMADICTADO: TFloatField;
    qTiemposGrupoSUMALLEGADA: TFloatField;
    qTiemposGrupoSUMAATENCION: TFloatField;
    qTiemposGrupoSUMATOTAL: TFloatField;
    qTotalesSUMADICTADO: TFloatField;
    qTotalesSUMALLEGADA: TFloatField;
    qTotalesSUMAATENCION: TFloatField;
    qTotalesSUMATOTAL: TFloatField;
    qTotalesSuma1: TStringField;
    qTotalesSuma2: TStringField;
    qTotalesSuma3: TStringField;
    qTotalesSuma4: TStringField;
    qODTs: TQuery;
    qGruposTrabajoNOMBREGRUPOTRABAJO: TStringField;
    qGruposTrabajoTOTALREPORTES: TFloatField;
    qGruposTrabajoTOTALODTS: TFloatField;
    DBChartOdts: TDBChart;
    BarSeries1: TBarSeries;
    RxSplitter3: TRxSplitter;
    DBChartReportes: TDBChart;
    BarSeries2: TBarSeries;
    qTiemposGruposuma1: TStringField;
    qTiemposGruposuma2: TStringField;
    qTiemposGruposuma3: TStringField;
    qTiemposGruposuma4: TStringField;
    qODTsTOTALODTS: TFloatField;
    OpenDialog1: TOpenDialog;
    tsResumenReportesAtendidos: TTabSheet;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    pmExportarListadoReportes: TPopupMenu;
    MenuItem2: TMenuItem;
    DBChartTiempos: TDBChart;
    Series1: TBarSeries;
    pmExportarListadoMateriales: TPopupMenu;
    ExportarArchivoTexto: TMenuItem;
    CVS1: TCVS;
    SaveDialog1: TSaveDialog;
    pmExportarResumenMoviles: TPopupMenu;
    ExportarResumenMovilesExcel: TMenuItem;
    ExportarImgenes1: TMenuItem;
    pmExportarResumenTiempos: TPopupMenu;
    ExportarResumenTiemposExcel: TMenuItem;
    ExportarImagenes: TMenuItem;
    qReporteDESCRIPCION: TMemoField;
    Panel4: TPanel;
    GroupBox3: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    dsGrupoTrabajo: TDataSource;
    qGrupoTrabajo: TQuery;
    BitBtnFiltrar: TBitBtn;
    BitBtnAnularFiltro: TBitBtn;
    qCIA: TQuery;
    dsCIA: TDataSource;
    qCIACODIGOADMINISTRATIVO: TFloatField;
    qCIANOMBRECATEGORIA: TStringField;
    qGrupoTrabajoCODIGOADMINISTRATIVO: TFloatField;
    qGrupoTrabajoCODIGOGRUPOTRABAJO: TFloatField;
    qGrupoTrabajoNOMBREGRUPOTRABAJO: TStringField;
    DBEdit14: TDBEdit;
    Query1: TQuery;
    DataSource1: TDataSource;
    tcia: tdMemTable;
    tciaCodigoAdministrativo: TIntegerField;
    dstcia: TDDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit13: TDBEdit;
    tciaCodigoGrupoTrabajo: TFloatField;
    DBLookupComboBox2: TDBLookupComboBox;
    procedure SBSalirClick(Sender: TObject);
    procedure qTotalesCalcFields(DataSet: TDataSet);
    procedure qIndiceCalcFields(DataSet: TDataSet);
    procedure RxDBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RxDBGrid1TitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure qIndiceAfterDelete(DataSet: TDataSet);
    procedure qRegistrosAfterOpen(DataSet: TDataSet);
    procedure qTiemposGrupoCalcFields(DataSet: TDataSet);
    procedure SBImprimirClick(Sender: TObject);
    procedure tsListadoReportesShow(Sender: TObject);
    procedure tsResumenMovilesShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ListadoCompletoExcel1Click(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
    procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sbExportarClick(Sender: TObject);
    procedure ExportarArchivoTextoClick(Sender: TObject);
    procedure ExportarResumenExcelClick(Sender: TObject);
    procedure ExportarResumenMovilesExcelClick(Sender: TObject);
    procedure ExportarImagenesClick(Sender: TObject);
    procedure ExportarImgenes1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtnFiltrarClick(Sender: TObject);
  private
    { Private declarations }
    ListaReportes, ListaODT: TStringList;
  public
    { Public declarations }
    sCriterio : String;
    TeclaShift:Boolean;
    ListaOrden, ListaRotulos, ListaDatos :TStringList;
    function FormatoImprimir(Valor : Double):string;
    procedure ReportesRepetidos;
  end;

var
  fIndiceAreaMetropolitana: TfIndiceAreaMetropolitana;
  TiempoFinal : Double;
implementation

uses uReporte, InterExcel, uFuncionSGD, uQRIndicexMoviles, uQRIndicexTotal,
  uQRIndicexResumen, uQRIndicexMaterialResumen, uExportarImagen;

{$R *.DFM}

procedure TfIndiceAreaMetropolitana.SBSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfIndiceAreaMetropolitana.qTotalesCalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
  TiempoFinal := FieldByName('PROMEDIODICTADO').AsFloat;
  FieldByName('Promedio1').AsString := FormatoImprimir(TiempoFinal);

  TiempoFinal := FieldByName('PROMEDIOLLEGADA').AsFloat;
  FieldByName('Promedio2').AsString := FormatoImprimir(TiempoFinal);

  TiempoFinal := FieldByName('PROMEDIOATENCION').AsFloat;
  FieldByName('Promedio3').AsString := FormatoImprimir(TiempoFinal);

  TiempoFinal := FieldByName('PROMEDIOTOTAL').AsFloat;
  FieldByName('Promedio4').AsString := FormatoImprimir(TiempoFinal);

  FieldByName('Suma1').AsString := FormatoImprimir(FieldByName('SUMADICTADO').AsFloat);
  FieldByName('Suma2').AsString := FormatoImprimir(FieldByName('SUMALLEGADA').AsFloat);
  FieldByName('Suma3').AsString := FormatoImprimir(FieldByName('SUMAATENCION').AsFloat);
  FieldByName('Suma4').AsString := FormatoImprimir(FieldByName('SUMATOTAL').AsFloat);

  TiempoFinal := FieldByName('MINDICTADO').AsFloat;
  FieldByName('Min1').AsString := FormatoImprimir(TiempoFinal);

  TiempoFinal := FieldByName('MAXDICTADO').AsFloat;
  FieldByName('Max1').AsString := FormatoImprimir(TiempoFinal);

  TiempoFinal := FieldByName('MINLLEGADA').AsFloat;
  FieldByName('Min2').AsString := FormatoImprimir(TiempoFinal);

  TiempoFinal := FieldByName('MAXLLEGADA').AsFloat;
  FieldByName('Max2').AsString := FormatoImprimir(TiempoFinal);

  TiempoFinal := FieldByName('MINATENCION').AsFloat;
  FieldByName('Min3').AsString := FormatoImprimir(TiempoFinal);

  TiempoFinal := FieldByName('MAXATENCION').AsFloat;
  FieldByName('Max3').AsString := FormatoImprimir(TiempoFinal);

  TiempoFinal := FieldByName('MINTOTAL').AsFloat;
  FieldByName('Min4').AsString := FormatoImprimir(TiempoFinal);

  TiempoFinal := FieldByName('MAXTOTAL').AsFloat;
  FieldByName('Max4').AsString := FormatoImprimir(TiempoFinal);
  end;

end;

procedure TfIndiceAreaMetropolitana.qIndiceCalcFields(DataSet: TDataSet);
begin
  with DataSet do
  begin
    TiempoFinal := (FieldByName('FECHAHORADICTADO').AsFloat) -
                                           (FieldByName('FECHAHORA').AsFloat);
    FieldByName('TiempoDictado').AsString := FormatoImprimir(TiempoFinal);

    TiempoFinal := (FieldByName('FECHAHORALLEGADA').AsFloat) -
                                           (FieldByName('FECHAHORADICTADO').AsFloat);
    FieldByName('TiempoLlegada').AsString := FormatoImprimir(TiempoFinal);

    TiempoFinal := (FieldByName('FECHAHORAATENCION').AsFloat) -
                                           (FieldByName('FECHAHORALLEGADA').AsFloat);
    FieldByName('TiempoAtencion').AsString := FormatoImprimir(TiempoFinal);

    TiempoFinal := (FieldByName('FECHAHORAATENCION').AsFloat) -
                                           (FieldByName('FECHAHORA').AsFloat);
    FieldByName('TiempoTotal').AsString := FormatoImprimir(TiempoFinal);
  end;
end;

procedure TfIndiceAreaMetropolitana.RxDBGrid1MouseMove(Sender: TObject;
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

procedure TfIndiceAreaMetropolitana.RxDBGrid1TitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if Pos('Tiempo',Columna) > 0 then
  begin
    if UpperCase(Columna) = 'TIEMPODICTADO' then
      Result := '(FECHAHORADICTADO-FECHAHORA)'
    else
      if UpperCase(Columna) = 'TIEMPOLLEGADA' then
        Result := '(FECHAHORALLEGADA-FECHAHORADICTADO)'
      else
        if UpperCase(Columna) = 'TIEMPOATENCION' then
          Result := '(FECHAHORAATENCION-FECHAHORALLEGADA)'
        else
          Result := '(FECHAHORAATENCION-FECHAHORA)';
  end
  else
    Result := Columna; 
end;

var
  ListaTemp:TStringList;
  i:Integer;
  Encontrado:Boolean;
  Sort:String;
begin

  with RxDBGrid1.DataSource.DataSet do
  begin
    try
      RxDBGrid1.Columns[PreviousColumnIndex].title.Font.Style :=
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
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
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
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
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
           ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');
        ListaTemp.Free;
     end;

     if (ListaOrden.Count = 0) then
        ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');

     qIndice.SQl.Delete(qIndice.SQl.Count - 1);
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

     qIndice.Sql.Add(Sort);
     //qIndice.Sql.SaveToFile('C:\a.txt');
     qIndice.Close;
     qIndice.Open;
  end;

end;

procedure TfIndiceAreaMetropolitana.FormCreate(Sender: TObject);
begin
  inherited;
  ListaOrden:=TStringList.Create;
  ListaRotulos := TStringList.Create;
  ListaDatos := TStringList.Create;
  ListaReportes := TStringList.Create;
  ListaReportes.Duplicates := dupIgnore;
  ListaReportes.Sorted := True;
  ListaODT := TStringList.Create;
  ListaODT.Duplicates := dupIgnore;
  ListaODT.Sorted := True;
end;

procedure TfIndiceAreaMetropolitana.FormDestroy(Sender: TObject);
begin
  ListaOrden.Free;
  ListaRotulos.Free;
  ListaDatos.Free;
  ListaReportes.Free;
  ListaODT.Free;
  inherited;
end;

procedure TfIndiceAreaMetropolitana.RxDBGrid1DblClick(Sender: TObject);
begin
  if qIndiceCODIGOREPORTE.AsString <> '' then
  begin
    if not (Assigned(Application.FindComponent('fReporte') as TForm)) then
      fReporte:=TfReporte.Create(Application);
    fReporte.qReporte.Active:=False;
    fReporte.qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE='+
                                qIndiceCODIGOREPORTE.AsString;
    fReporte.qReporte.Active:=True;
    fReporte.qReporte.Edit;
    fReporte.Show;
  end;

end;

procedure TfIndiceAreaMetropolitana.qIndiceAfterDelete(DataSet: TDataSet);
begin
  qIndice.ApplyUpdates;
  qIndice.CommitUpdates;
  qTotales.Close;
  qTotales.Open;
  qRegistros.Close;
  qRegistros.Open;
  qODTs.Close;
  qODTs.Open;
  if qTiemposGrupo.Active then
  begin
    qTiemposGrupo.Active := False;
    qTiemposGrupo.Active := True;
  end;
  if qGruposTrabajo.Active then
  begin
    qGruposTrabajo.Active := False;
    qGruposTrabajo.Active := True;
  end;
  if qMaterialResumen.Active then
  begin
    qMaterialResumen.Active := False;
    qMaterialResumen.Active := True;
  end;
end;

procedure TfIndiceAreaMetropolitana.qRegistrosAfterOpen(DataSet: TDataSet);
begin
  inherited;
  Panel1.Caption := qRegistros.Fields[0].AsString + ' REGISTROS PROCESADOS';
end;

function TfIndiceAreaMetropolitana.FormatoImprimir(Valor: Double): string;
begin
  Result := FloatToStr(Int(Valor * 24 * 60)) + ' min ' + FormatDateTime('ss' + '" seg"',Frac(Valor));
end;

procedure TfIndiceAreaMetropolitana.qTiemposGrupoCalcFields(
  DataSet: TDataSet);
begin
  with DataSet do
  begin
    TiempoFinal := FieldByName('PROMEDIODICTADO').AsFloat;
    FieldByName('Promedio1').AsString := FormatoImprimir(TiempoFinal);

    TiempoFinal := FieldByName('PROMEDIOLLEGADA').AsFloat;
    FieldByName('Promedio2').AsString := FormatoImprimir(TiempoFinal);

    TiempoFinal := FieldByName('PROMEDIOATENCION').AsFloat;
    FieldByName('Promedio3').AsString := FormatoImprimir(TiempoFinal);

    TiempoFinal := FieldByName('PROMEDIOTOTAL').AsFloat;
    FieldByName('Promedio4').AsString := FormatoImprimir(TiempoFinal);


    TiempoFinal := FieldByName('SUMADICTADO').AsFloat;
    FieldByName('suma1').AsString := FormatoImprimir(TiempoFinal);

    TiempoFinal := FieldByName('SUMALLEGADA').AsFloat;
    FieldByName('suma2').AsString := FormatoImprimir(TiempoFinal);

    TiempoFinal := FieldByName('SUMAATENCION').AsFloat;
    FieldByName('suma3').AsString := FormatoImprimir(TiempoFinal);

    TiempoFinal := FieldByName('SUMATOTAL').AsFloat;
    FieldByName('suma4').AsString := FormatoImprimir(TiempoFinal);

    TiempoFinal := FieldByName('MINDICTADO').AsFloat;
    FieldByName('Min1').AsString := FormatoImprimir(TiempoFinal);

    TiempoFinal := FieldByName('MAXDICTADO').AsFloat;
    FieldByName('Max1').AsString := FormatoImprimir(TiempoFinal);

    TiempoFinal := FieldByName('MINLLEGADA').AsFloat;
    FieldByName('Min2').AsString := FormatoImprimir(TiempoFinal);

    TiempoFinal := FieldByName('MAXLLEGADA').AsFloat;
    FieldByName('Max2').AsString := FormatoImprimir(TiempoFinal);

    TiempoFinal := FieldByName('MINATENCION').AsFloat;
    FieldByName('Min3').AsString := FormatoImprimir(TiempoFinal);

    TiempoFinal := FieldByName('MAXATENCION').AsFloat;
    FieldByName('Max3').AsString := FormatoImprimir(TiempoFinal);

    TiempoFinal := FieldByName('MINTOTAL').AsFloat;
    FieldByName('Min4').AsString := FormatoImprimir(TiempoFinal);


  end;
end;

procedure TfIndiceAreaMetropolitana.SBImprimirClick(Sender: TObject);
var Punto:TPoint;
begin
  if PageControl1.ActivePage = tsResumenMoviles then
  begin
    FQRIndicexMoviles := TFQRIndicexMoviles.Create(Application);
    FQRIndicexMoviles.ListaRotulos.Assign(ListaRotulos);
    FQRIndicexMoviles.ListaDatos.Assign(ListaDatos);
    with FQRIndicexMoviles do
    begin
      with SeriesReportes do
      begin
        DataSource := qGruposTrabajo;
        XLabelsSource := 'NOMBREGRUPOTRABAJO';
        YValues.ValueSource := 'TOTALREPORTES';
      end;
      with SeriesODTs do
      begin
        DataSource := qGruposTrabajo;
        XLabelsSource := 'NOMBREGRUPOTRABAJO';
        YValues.ValueSource := 'TOTALODTS';
      end;
      qrTitulo.Caption         := UpperCase(Self.Caption);
      QuickRep.DataSet         := qTiemposGrupo;
      qrdbGrupotrabajo.DataSet := qTiemposGrupo;
      qrdbSumaDictado.DataSet  := qTiemposGrupo;
      qrdbSumaLlegada.DataSet  := qTiemposGrupo;
      qrdbSumaAtencion.DataSet := qTiemposGrupo;
      qrdbSumaTotal.DataSet    := qTiemposGrupo;

      qrdbGrupotrabajo.DataField:='NOMBREGRUPOTRABAJO';
      qrdbSumaDictado.DataField :='suma1';
      qrdbSumaLlegada.DataField :='suma2';
      qrdbSumaAtencion.DataField:='suma3';
      qrdbSumaTotal.DataField   :='suma4';

      qrdbGrupotrabajo.DataSet    := qTiemposGrupo;
      qrdbPromediodictado.DataSet := qTiemposGrupo;
      qrdbPromedioLlegada.DataSet := qTiemposGrupo;
      qrdbPromedioAtencion.DataSet:= qTiemposGrupo;
      qrdbPromedioTotal.DataSet   := qTiemposGrupo;

      qrdbTotalReportes.DataSet   := qRegistros;
      qrdbTotalODTs.DataSet       := qODTs;
      QuickRep.Preview;
    end;
  end;
  if PageControl1.ActivePage = tsListadoReportes then
  begin
    FQRIndicexTotal := TFQRIndicexTotal.Create(Application);
    FQRIndicexTotal.ListaRotulos.Assign(ListaRotulos);
    FQRIndicexTotal.ListaDatos.Assign(ListaDatos);
    with FQRIndicexTotal do
    begin
      qrTitulo.Caption := UpperCase(Self.Caption);
      qReporte.Close;
      qReporte.Open;
      qODTDia.Close;
      qODTDia.Open;
      qCIG.Close;
      qCIG.Open;
      qDir_Reporte.Close;
      qDir_Reporte.Open;
      qTraslado.Close;
      qTraslado.Open;
      QuickRep.DataSet := qIndice;
      qrdbCodigoReporte.DataSet := qIndice;
      qrdbFechaRegistro.DataSet := qIndice;
      qrdbHoraRegistro.DataSet  := qIndice;
      qrdbFechaDictado.DataSet  := qIndice;
      qrdbHoraDictado.DataSet   := qIndice;
      qrdbTelefono.DataSet      := qReporte;
      qrdbTrabajoRealizado.DataSet := qODTDia;
      qrdbTrabajoRealizar.DataSet := qReporte;
      qrdbDireccion.DataSet     := qDir_Reporte;
      qrdbBarrio.DataSet        := qCIG;
      qrdbCiudad.DataSet        := qCIG;
      qrdbSolicitante.DataSet   := qReporte;
      qrdbCodigoODT.DataSet     := qODTDia;
      qrdbFechaInicio.DataSet   := qIndice;
      qrdbHoraInicio.DataSet    := qIndice;
      qrdbFechaFin.DataSet      := qIndice;
      qrdbHoraFin.DataSet       := qIndice;
      qrdbMovilODT.DataSet      := qIndice;
      QuickRep.Page.LeftMargin  := 30;
      QuickRep.Preview;
    end;
  end;
  if PageControl1.ActivePage = tsResumenReportesAtendidos then
  begin
    FQRIndicexResumen := TFQRIndicexResumen.Create(Application);
    FQRIndicexResumen.ListaRotulos.Assign(ListaRotulos);
    FQRIndicexResumen.ListaDatos.Assign(ListaDatos);
    with FQRIndicexResumen do
    begin
      qrTitulo.Caption := UpperCase(Self.Caption);
      Series1.AddBar(qTotalesPROMEDIODICTADO.AsFloat * 24 * 60, 'Promedio' + TeeLineSeparator +'Dictado', clTeeColor);
      Series1.AddBar(qTotalesPROMEDIOLLEGADA.AsFloat * 24 * 60 , 'Promedio' + TeeLineSeparator + 'Llegada', clTeeColor);
      Series1.AddBar(qTotalesPROMEDIOATENCION.AsFloat * 24 * 60, 'Promedio' + TeeLineSeparator + 'Atención', clTeeColor);
      Series1.AddBar(qTotalesPROMEDIOTOTAL.AsFloat * 24 * 60, 'Promedio' +  TeeLineSeparator + 'Total', clTeeColor);
      qrdbPromediodictado.DataSet  := qTotales;
      qrdbPromedioLlegada.DataSet  := qTotales;
      qrdbPromedioAtencion.DataSet := qTotales;
      qrdbPromedioTotal.DataSet    := qTotales;
      qrdbSumaDictado.DataSet      := qTotales;
      qrdbSumaLlegada.DataSet      := qTotales;
      qrdbSumaAtencion.DataSet     := qTotales;
      qrdbSumaTotal.DataSet        := qTotales;
      qrdbTotalODTs.DataSet        := qODTs;
      qrdbTotalReportes.DataSet    := qRegistros;
      QuickRep.Preview;
    end;
  end;
  if PageControl1.ActivePage = tsListadoMateriales then
  begin
    FQRIndicexMaterialResumen := TFQRIndicexMaterialResumen.Create(Application);
    FQRIndicexMaterialResumen.ListaRotulos.Assign(ListaRotulos);
    FQRIndicexMaterialResumen.ListaDatos.Assign(ListaDatos);
    with FQRIndicexMaterialResumen do
    begin
      qrTitulo.Caption                       := UpperCase(Self.Caption);
      QuickRep.DataSet                       := qMaterialResumen;
      qrdbCodigo.DataSet                     := qMaterialResumen;
      qrdbNombreMaterial.DataSet             := qMaterialResumen;
      qrdbNombreUnidad.DataSet               := qMaterialResumen;
      qrdbCantidadSolicitada.DataSet         := qMaterialResumen;
      qrdbCantidadEntregada.DataSet          := qMaterialResumen;
      qrdbCantidadConsumida.DataSet          := qMaterialResumen;
      qrdbCantidadReintegradaMala.DataSet    := qMaterialResumen;
      qrdbCantidadReintegradaBuena.DataSet   := qMaterialResumen;
      qrdbCantidadRetiradaBuena.DataSet      := qMaterialResumen;
      qrdbCantidadRetiradaMala.DataSet       := qMaterialResumen;
      QuickRep.Preview;
    end;
  end;
end;

procedure TfIndiceAreaMetropolitana.tsListadoReportesShow(Sender: TObject);
begin
  inherited;
  if not qMaterialResumen.Active then
    qMaterialResumen.Active := True;
end;

procedure TfIndiceAreaMetropolitana.tsResumenMovilesShow(Sender: TObject);
begin
  if not qTiemposGrupo.Active then
    qTiemposGrupo.Active := True;
  if not qGruposTrabajo.Active then
    qGruposTrabajo.Active := True;
end;

procedure TfIndiceAreaMetropolitana.FormShow(Sender: TObject);
begin
  inherited;
  qTotales.close;
  qTotales.open;  
  PageControl1.ActivePage:=tsListadoReportes;
  dbcharttiempos.AutoRefresh:= true;
  DBChartReportes.AutoRefresh:= true;
  DBChartOdts.AutoRefresh:= true;
  Series1.Clear;
  Series1.AddBar(qTotalesPROMEDIODICTADO.AsFloat * 24 * 60, 'Promedio' + TeeLineSeparator +'Dictado', clTeeColor);
  Series1.AddBar(qTotalesPROMEDIOLLEGADA.AsFloat * 24 * 60 , 'Promedio' + TeeLineSeparator + 'Llegada', clTeeColor);
  Series1.AddBar(qTotalesPROMEDIOATENCION.AsFloat * 24 * 60, 'Promedio' + TeeLineSeparator + 'Atención', clTeeColor);
  Series1.AddBar(qTotalesPROMEDIOTOTAL.AsFloat * 24 * 60, 'Promedio' +  TeeLineSeparator + 'Total', clTeeColor);
  tCIA.open;
  qCIA.open;
  qgrupotrabajo.open;
  tcia.Insert;
  pagecontrol1.Pages[3].Visible := false;
end;

procedure TfIndiceAreaMetropolitana.ListadoCompletoExcel1Click(
  Sender: TObject);
var Ex: EduExcel;
    Fila: Integer;
    Path: string;
begin
  Path := ExtractFilePath(ParamStr(0));
  if Path[Length(Path)] <> '\' then
    Path := Path + '\';
  path:=Path + 'Plantillas\';
  Ex := EduExcel.Create;
  Ex.AsignarPlantilla(Path + 'PlantillaODT.xls');
  Ex.HojaActiva('Hoja1');
  Ex.Visible(True);
  qIndice.First;
  Fila := 2;
  if not qDir_Reporte.Active then
    qDir_Reporte.Active := True;
  if not qODTDia.Active then
    qODTDia.Active := True;
  if not qCIG.Active then
    qCIG.Active := True;
  if not qReporte.Active then
    qReporte.Active := True;
  while not qIndice.Eof do
  begin
    Ex.Asignar(Fila,1,qIndiceCODIGOREPORTE.AsString);
    Ex.Asignar(Fila,2,FormatDateTime('dd/mm/yyyy',qIndiceFECHAHORA.AsDateTime));
    Ex.Asignar(Fila,3,FormatDateTime('hh:nn:ss',qIndiceFECHAHORA.AsDateTime));
    Ex.Asignar(Fila,4,FormatDateTime('dd/mm/yyyy',qIndiceFECHAHORADICTADO.AsDateTime));
    Ex.Asignar(Fila,5,FormatDateTime('hh:nn:ss',qIndiceFECHAHORADICTADO.AsDateTime));
    Ex.Asignar(Fila,6,Format('%8.2f',[(qIndiceFECHAHORADICTADO.AsFloat - qIndiceFECHAHORA.asFloat)*24*60]));//minutos
    Ex.Asignar(Fila,7,qReporteTELEFONO.AsString);
    Ex.Asignar(Fila,8,qDir_Reporte.fieldbyname('DIRECCION').AsString);
    Ex.Asignar(Fila,9,qReporteDESCRIPCION.AsString);
    Ex.Asignar(Fila,10,qODTDiaOBSERVACION1.AsString);
    Ex.Asignar(Fila,11,qReporteNOMBREINFORMANTE.AsString);
    Ex.Asignar(Fila,12,qODTDiaIMPRESOODT.AsString);
    Ex.Asignar(Fila,13,qCIGBARRIO.AsString);
    Ex.Asignar(Fila,14,qCIGCIUDAD.AsString);
    Ex.Asignar(Fila,15,FormatDateTime('dd/mm/yyyy',qIndiceFECHAHORALLEGADA.AsDateTime));
    Ex.Asignar(Fila,16,FormatDateTime('hh:nn:ss',qIndiceFECHAHORALLEGADA.AsDateTime));
    Ex.Asignar(Fila,17,Format('%8.2f',[(qIndiceFECHAHORALLEGADA.AsFloat - qIndiceFECHAHORADICTADO.asFloat)*24*60]));
    Ex.Asignar(Fila,18,FormatDateTime('dd/mm/yyyy',qIndiceFECHAHORAATENCION.AsDateTime));
    Ex.Asignar(Fila,19,FormatDateTime('hh:nn:ss',qIndiceFECHAHORAATENCION.AsDateTime));
    Ex.Asignar(Fila,20,Format('%8.2f',[(qIndiceFECHAHORAATENCION.AsFloat - qIndiceFECHAHORALLEGADA.asFloat)*24*60]));
    Ex.Asignar(Fila,21,qIndiceNOMBREGRUPOTRABAJO.AsString);
    qIndice.Next;
    Inc(Fila);
  end;
  Ex.Asignar(Fila + 1 ,1,'Total Reportes Atendidos: ' + qODTsTOTALODTS.AsString);
  Ex.Asignar(Fila + 2 ,1,'Total ODT Ejecutadas: ' + qRegistros.FieldByName('TOTALREPORTES').AsString);
  Ex.Terminar;
  Ex.Free;
end;

procedure TfIndiceAreaMetropolitana.SBBuscarClick(Sender: TObject);
var s: String;
begin
  S := '';
  S:=InputBox('Código del reporte','','');
  if S <> '' then
    qIndice.Locate('CODIGOREPORTE',S,[]);
end;

procedure TfIndiceAreaMetropolitana.Panel2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Lista: TStringList;
    i: Integer;
begin
  inherited;
  if (ssCtrl in Shift) and (Button in [mbRight]) then
  begin
    if OpenDialog1.Execute then
    begin
      if OpenDialog1.FileName  <> '' then
      begin
        Lista := TStringList.Create;
        Lista.LoadFromFile(OpenDialog1.FileName);
        for i:=0 to Lista.Count - 1 do
          if Trim(Lista[i]) <> '' then
          begin
            qIndice.Locate('CODIGOREPORTE',Lista[i],[]);
            Application.ProcessMessages;
            qIndice.Delete;
          end;
        Lista.Free;  
      end;
    end;
  end;
end;

procedure TfIndiceAreaMetropolitana.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfIndiceAreaMetropolitana.ReportesRepetidos;
var Query: TQuery;
begin
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('SELECT CODIGOREPORTE FROM (');
  Query.SQL.Add('SELECT CODIGOREPORTE, COUNT(*) AS TOTAL ');
  Query.SQL.Add('FROM ESTADISTICAREPORTE GROUP BY CODIGOREPORTE)');
  Query.SQL.Add('WHERE TOTAL > 1');
  Query.Open;
  ListaReportes.Clear;
  Query.First;
  while not Query.Eof do
  begin
    ListaReportes.Add(Query.FieldByName('CODIGOREPORTE').AsString);
    Query.Next;
  end;
  Query.Close;
  Query.SQL.Clear;
  Query.SQL.Add('SELECT CODIGOODT FROM (');
  Query.SQL.Add('SELECT CODIGOODT,NOMBREGRUPOTRABAJO FROM ESTADISTICAREPORTE');
  Query.SQL.Add('GROUP BY CODIGOODT, NOMBREGRUPOTRABAJO)');
  Query.SQL.Add('GROUP BY CODIGOODT');
  Query.SQL.Add('HAVING COUNT(*) > 1');
  Query.Open;
  ListaODT.Clear;
  Query.First;
  while not Query.Eof do
  begin
    ListaODT.Add(Query.FieldByName('CODIGOODT').AsString);
    Query.Next;
  end;
  Query.Free;
end;

procedure TfIndiceAreaMetropolitana.RxDBGrid1GetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var Encontrado: Boolean;
    I: Integer;  
begin
   Encontrado := False;
   for I:=0 to ListaReportes.Count - 1 do
     if ListaReportes[I] = qIndice.FieldByName('CODIGOREPORTE').AsString then
     begin
       Encontrado := True;
       Break;
     end;
   if Encontrado then
   begin
     Background := clRed;
     AFont.Color := clWhite;
   end;

   Encontrado := False;
   for I:=0 to ListaODT.Count - 1 do
     if ListaODT[I] = qIndice.FieldByName('CODIGOODT').AsString then
     begin
       Encontrado := True;
       Break;
     end;
   if Encontrado then
   begin
     Background := clYellow;
     AFont.Color := clBlack;
   end;

end;

procedure TfIndiceAreaMetropolitana.sbExportarClick(Sender: TObject);
var Punto:TPoint;
begin
  if PageControl1.ActivePage = tsListadoReportes then
  begin
    Punto:=Panel2.ClientToScreen(Classes.Point(sbExportar.Left, sbExportar.top));
    pmExportarListadoReportes.Popup(punto.x+10, punto.y+10);
  end;
  if PageControl1.ActivePage = tsListadoMateriales then
  begin
    Punto:=Panel2.ClientToScreen(Classes.Point(sbExportar.Left, sbExportar.top));
    pmExportarListadoMateriales.Popup(punto.x+10, punto.y+10);
  end;
  if PageControl1.ActivePage = tsResumenReportesAtendidos then
  begin
    Punto:=Panel2.ClientToScreen(Classes.Point(sbExportar.Left, sbExportar.top));
    pmExportarResumenTiempos.Popup(punto.x+10, punto.y+10);
  end;
  if PageControl1.ActivePage = tsResumenMoviles then
  begin
    Punto:=Panel2.ClientToScreen(Classes.Point(sbExportar.Left, sbExportar.top));
    pmExportarResumenMoviles.Popup(punto.x+10, punto.y+10);
  end;
end;

procedure TfIndiceAreaMetropolitana.ExportarArchivoTextoClick(
  Sender: TObject);
begin
  SaveDialog1.Title:='Exportar Listado de Materiales a';
  SaveDialog1.Filter:='Archivo Texto|*.txt';
  if SaveDialog1.Execute then
  begin
     dsMaterialResumen.DataSet.DisableControls;
     CVS1.DataSet := dsMaterialResumen.DataSet;
     CVS1.FileNameText := SaveDialog1.FileName;
     CVS1.TableExport;
     dsMaterialResumen.DataSet.EnableControls;
  end;
end;

procedure TfIndiceAreaMetropolitana.ExportarResumenExcelClick(
  Sender: TObject);
var Ex: EduExcel;
    Fila,i,n,m: Integer;
    Path,Cadena: string;
begin
  Path := ExtractFilePath(ParamStr(0));
  if Path[Length(Path)] <> '\' then
    Path := Path + '\';
  path:=Path + 'Plantillas\';
  Ex := EduExcel.Create;
  Ex.AsignarPlantilla(Path + 'PlantillaTiempos.xls');
  Ex.HojaActiva('Hoja1');
  Ex.Visible(True);
  Fila := 5;
  n := (ListaDatos.Count div 2);
  m := (ListaDatos.Count mod 2);
  for i:=0 to n+m-1 do
  begin
    Ex.Asignar(Fila,1,ListaRotulos[i]+' :');
    Cadena := ListaDatos[i];
    Delete(Cadena,1,Pos('=',Cadena));
    Ex.Asignar(Fila,2,Cadena);

    if (i+n+m)<ListaDatos.Count then
    begin
      Ex.Asignar(Fila,3,ListaRotulos[i+n+m]+' :');
      Cadena := ListaDatos[i+n+m];
      Delete(Cadena,1,Pos('=',Cadena));
      Ex.Asignar(Fila,4,Cadena);
      Inc(Fila);
    end;
  end;
  Inc(Fila);
  Ex.Asignar(Fila,2,'TIEMPO DICTADO(Min)');
  Ex.Asignar(Fila,3,'TIEMPO LLEGADA(Min)');
  Ex.Asignar(Fila,4,'TIEMPO ATENCIÓN(Min)');
  Ex.Asignar(Fila,5,'TIEMPO TOTAL(Min)');
  Inc(Fila);
  Ex.Asignar(Fila,1,'Promedios');
  Ex.Asignar(Fila,2,Format('%8.2f',[qTotalesPROMEDIODICTADO.AsFloat*24*60]));
  Ex.Asignar(Fila,3,Format('%8.2f',[qTotalesPROMEDIOLLEGADA.AsFloat*24*60]));
  Ex.Asignar(Fila,4,Format('%8.2f',[qTotalesPROMEDIOATENCION.AsFloat*24*60]));
  Ex.Asignar(Fila,5,Format('%8.2f',[qTotalesPROMEDIOTOTAL.AsFloat*24*60]));
  Inc(Fila);
  Inc(Fila);
  Ex.Asignar(Fila,1,'TOTAL REPORTES ATENDIDOS');
  Ex.Asignar(Fila,3,qRegistros.fieldbyname('TotalReportes').AsString);
  Inc(Fila);
  Ex.Asignar(Fila,1,'TOTAL ÓRDENES EJECUTADAS');
  Ex.Asignar(Fila,3,qODTsTOTALODTS.AsString);
  Ex.Terminar;
  Ex.Free;
end;

procedure TfIndiceAreaMetropolitana.ExportarResumenMovilesExcelClick(
  Sender: TObject);
var Ex: EduExcel;
    Fila,i,n,m: Integer;
    Path,Cadena: string;
begin
  Path := ExtractFilePath(ParamStr(0));
  if Path[Length(Path)] <> '\' then
    Path := Path + '\';
  path:=Path + 'Plantillas\';
  Ex := EduExcel.Create;
  Ex.AsignarPlantilla(Path + 'PlantillaMoviles.xls');
  Ex.HojaActiva('Hoja1');
  Ex.Visible(True);
  qTiemposGrupo.First;
  Fila := 7;
  while not qTiemposGrupo.Eof do
  begin
    Ex.Asignar(Fila,1,qTiemposGrupoNOMBREGRUPOTRABAJO.AsString);
    Ex.Asignar(Fila,2,Format('%8.2f',[qTiemposGrupoSUMADICTADO.asFloat*24*60]));//minutos
    Ex.Asignar(Fila,3,Format('%8.2f',[qTiemposGrupoMINDICTADO.asFloat*24*60]));//minutos
    Ex.Asignar(Fila,4,Format('%8.2f',[qTiemposGrupoMAXDICTADO.asFloat*24*60]));//minutos
    Ex.Asignar(Fila,5,Format('%8.2f',[qTiemposGrupoPROMEDIODICTADO.asFloat*24*60]));//minutos
    Ex.Asignar(Fila,6,Format('%8.2f',[qTiemposGrupoSUMALLEGADA.asFloat*24*60]));//minutos
    Ex.Asignar(Fila,7,Format('%8.2f',[qTiemposGrupoMINLLEGADA.asFloat*24*60]));//minutos
    Ex.Asignar(Fila,8,Format('%8.2f',[qTiemposGrupoMAXLLEGADA.asFloat*24*60]));//minutos
    Ex.Asignar(Fila,9,Format('%8.2f',[qTiemposGrupoPROMEDIOLLEGADA.asFloat*24*60]));//minutos
    Ex.Asignar(Fila,10,Format('%8.2f',[qTiemposGrupoSUMAATENCION.asFloat*24*60]));//minutos
    Ex.Asignar(Fila,11,Format('%8.2f',[qTiemposGrupoMINATENCION.asFloat*24*60]));//minutos
    Ex.Asignar(Fila,12,Format('%8.2f',[qTiemposGrupoMAXATENCION.asFloat*24*60]));//minutos
    Ex.Asignar(Fila,13,Format('%8.2f',[qTiemposGrupoPROMEDIOATENCION.asFloat*24*60]));//minutos
    Ex.Asignar(Fila,14,Format('%8.2f',[qTiemposGrupoSUMATOTAL.asFloat*24*60]));//minutos
    Ex.Asignar(Fila,15,Format('%8.2f',[qTiemposGrupoMINTOTAL.asFloat*24*60]));//minutos
    Ex.Asignar(Fila,16,Format('%8.2f',[qTiemposGrupoMAXTOTAL.asFloat*24*60]));//minutos
    Ex.Asignar(Fila,17,Format('%8.2f',[qTiemposGrupoPROMEDIOTOTAL.asFloat*24*60]));//minutos
    qTiemposGrupo.Next;
    Inc(Fila);
  end;
  Ex.Asignar(Fila + 1 ,1,'Total Reportes Atendidos: ' + qODTsTOTALODTS.AsString);
  Ex.Asignar(Fila + 2 ,1,'Total ODT Ejecutadas: ' + qRegistros.FieldByName('TOTALREPORTES').AsString);
  Ex.Terminar;
  Ex.Free;
end;

procedure TfIndiceAreaMetropolitana.ExportarImagenesClick(Sender: TObject);
begin
  FExportarImagen:=TFExportarImagen.Create(Application);
  if FExportarImagen.ShowModal=mrOK then
  begin
    SaveDialog1.FileName:='Consolidado Tiempos';
    SaveDialog1.Title:='Exportar Imagen de Reportes Atendidos por Grupo a';
    case FExportarImagen.rgExportarImagen.ItemIndex of
      0: SaveDialog1.Filter:='Archivo mapa de bits|*.bmp';
      1: SaveDialog1.Filter:='Archivo Windows MetaFile|*.wmf';
      2: SaveDialog1.Filter:='Archivo Enhanced MetaFile|*.emf';
      else Exit;
    end;
    if SaveDialog1.Execute then
    begin
      DBChartTiempos.SaveToBitmapFile(SaveDialog1.FileName);
    end;
  end;
  FExportarImagen.Free;
end;

procedure TfIndiceAreaMetropolitana.ExportarImgenes1Click(Sender: TObject);
begin
  FExportarImagen:=TFExportarImagen.Create(Application);
  if FExportarImagen.ShowModal=mrOK then
  begin
    SaveDialog1.FileName:='Reportes Atendidos por Grupo de Trabajo';
    SaveDialog1.Title:='Exportar Imagen de Reportes Atendidos por Grupo a';
    case FExportarImagen.rgExportarImagen.ItemIndex of
      0: SaveDialog1.Filter:='Archivo mapa de bits|*.bmp';
      1: SaveDialog1.Filter:='Archivo Windows MetaFile|*.wmf';
      2: SaveDialog1.Filter:='Archivo Enhanced MetaFile|*.emf';
      else Exit;
    end;
    if SaveDialog1.Execute then
    begin
      DBChartReportes.SaveToBitmapFile(SaveDialog1.FileName);
    end;
    SaveDialog1.FileName:='Odts Ejecutadas por Grupo de Trabajo';
    SaveDialog1.Title:='Exportar Imagen de Odts ejecutadas por Grupo a';
    if SaveDialog1.Execute then
    begin
      DBChartOdts.SaveToBitmapFile(SaveDialog1.FileName);
    end;
  end;
  FExportarImagen.Free;
end;

procedure TfIndiceAreaMetropolitana.SpeedButton1Click(Sender: TObject);
var CIA:INTEGER;
begin
{  CIA := CapturarCIA;
  if CIA<>0 then qciaCodigoAdministrativo.AsInteger:=CIA; }
end;

procedure TfIndiceAreaMetropolitana.BitBtnFiltrarClick(Sender: TObject);
begin
qindice.close;
//qindice.SQL.SAVETOFILE('C:\indice.TXT');
qindice.SQL[0]:= ' SELECT * FROM ESTADISTICAREPORTE WHERE CODIGOREPORTE > 0 ';
if tciacodigoadministrativo.asstring <> '' then
  qindice.SQL[0]:= qindice.SQL[0] + ' AND CODIGOADMINISTRATIVO = '+ tciacodigoadministrativo.asstring ;

if tciacodigogrupotrabajo.asstring <> '' then
  qindice.SQL[0]:= qindice.SQL[0] + ' AND CODIGOGRUPOTRABAJO = '+ tciacodigogrupotrabajo.asstring ;

//qindice.SQL[0]:= qindice.SQL[0] + ' ORDER BY CODIGOODT';
//qindice.SQL.SAVETOFILE('C:\ASASASAS.TXT');

qindice.open;

qTotales.Close;
qTotales.sql.text:= 'SELECT AVG(FECHAHORADICTADO - FECHAHORA) AS PROMEDIODICTADO, '+
' AVG(FECHAHORALLEGADA - FECHAHORADICTADO) AS PROMEDIOLLEGADA, '+
' AVG(FECHAHORAATENCION - FECHAHORALLEGADA) AS PROMEDIOATENCION, '+
' AVG(FECHAHORAATENCION - FECHAHORA) AS PROMEDIOTOTAL, '+
' SUM(FECHAHORADICTADO - FECHAHORA) SUMADICTADO, '+
' SUM(FECHAHORALLEGADA - FECHAHORADICTADO) SUMALLEGADA, '+
' SUM(FECHAHORAATENCION - FECHAHORALLEGADA) SUMAATENCION, '+
' SUM(FECHAHORAATENCION - FECHAHORA) SUMATOTAL, '+
' MIN(FECHAHORADICTADO - FECHAHORA) AS MINDICTADO,  '+
' MAX(FECHAHORADICTADO - FECHAHORA) AS MAXDICTADO, '+
' MIN(FECHAHORALLEGADA - FECHAHORADICTADO) AS MINLLEGADA, '+
' MAX(FECHAHORALLEGADA - FECHAHORADICTADO) AS MAXLLEGADA, '+
' MIN(FECHAHORAATENCION - FECHAHORALLEGADA) AS MINATENCION, '+
' MAX(FECHAHORAATENCION - FECHAHORALLEGADA) AS MAXATENCION, '+
' MIN(FECHAHORAATENCION - FECHAHORA) AS MINTOTAL, '+
' MAX(FECHAHORAATENCION - FECHAHORA) AS MAXTOTAL '+
' FROM ESTADISTICAREPORTE WHERE CODIGOREPORTE > 0';
if tciacodigoadministrativo.asstring <> '' then
  qTotales.sql.Add(' AND CODIGOADMINISTRATIVO = '+ tciacodigoadministrativo.asstring );

if tciacodigogrupotrabajo.asstring <> '' then
  qTotales.sql.Add(' AND CODIGOGRUPOTRABAJO = '+ tciacodigogrupotrabajo.asstring );

qTotales.open;

  Series1.Clear;
  Series1.AddBar(qTotalesPROMEDIODICTADO.AsFloat * 24 * 60, 'Promedio' + TeeLineSeparator +'Dictado', clTeeColor);
  Series1.AddBar(qTotalesPROMEDIOLLEGADA.AsFloat * 24 * 60 , 'Promedio' + TeeLineSeparator + 'Llegada', clTeeColor);
  Series1.AddBar(qTotalesPROMEDIOATENCION.AsFloat * 24 * 60, 'Promedio' + TeeLineSeparator + 'Atención', clTeeColor);
  Series1.AddBar(qTotalesPROMEDIOTOTAL.AsFloat * 24 * 60, 'Promedio' +  TeeLineSeparator + 'Total', clTeeColor);
  DBChartTiempos.Refresh;

qtiemposgrupo.Close;
qtiemposgrupo.sql.Text:= 'SELECT NOMBREGRUPOTRABAJO, '+
' AVG(  FECHAHORADICTADO - FECHAHORA  ) PROMEDIODICTADO, '+
' AVG(  FECHAHORALLEGADA - FECHAHORADICTADO  ) PROMEDIOLLEGADA, '+
' AVG(  FECHAHORAATENCION - FECHAHORALLEGADA  ) PROMEDIOATENCION, '+
' AVG(  FECHAHORAATENCION - FECHAHORA) PROMEDIOTOTAL, '+
' SUM(  FECHAHORADICTADO - FECHAHORA  ) SUMADICTADO, '+
' SUM(  FECHAHORALLEGADA - FECHAHORADICTADO  ) SUMALLEGADA, '+
' SUM(  FECHAHORAATENCION - FECHAHORALLEGADA  ) SUMAATENCION, '+
' SUM(  FECHAHORAATENCION - FECHAHORA) SUMATOTAL, '+
' MIN(  FECHAHORADICTADO - FECHAHORA  ) MINDICTADO, '+
' MAX(  FECHAHORADICTADO - FECHAHORA  ) MAXDICTADO, '+
' MIN(  FECHAHORALLEGADA - FECHAHORADICTADO  ) MINLLEGADA, '+
' MAX(  FECHAHORALLEGADA - FECHAHORADICTADO  ) MAXLLEGADA, '+
' MIN(  FECHAHORAATENCION - FECHAHORALLEGADA  ) MINATENCION, '+
' MAX(  FECHAHORAATENCION - FECHAHORALLEGADA  ) MAXATENCION, '+
' MIN(  FECHAHORAATENCION - FECHAHORADICTADO  ) MINTOTAL, '+
' MAX(  FECHAHORAATENCION - FECHAHORADICTADO  ) MAXTOTAL '+
' FROM  ESTADISTICAREPORTE  WHERE CODIGOREPORTE > 0';
if tciacodigoadministrativo.asstring <> '' then
  qtiemposgrupo.sql.Add(' AND CODIGOADMINISTRATIVO = '+ tciacodigoadministrativo.asstring );

if tciacodigogrupotrabajo.asstring <> '' then
  qtiemposgrupo.sql.Add(' AND CODIGOGRUPOTRABAJO = '+ tciacodigogrupotrabajo.asstring );

qtiemposgrupo.sql.add(' GROUP BY NOMBREGRUPOTRABAJO');
qtiemposgrupo.open;



qgrupostrabajo.Close;
qgrupostrabajo.sql.Text:= ' SELECT NOMBREGRUPOTRABAJO, COUNT(*) AS TOTALREPORTES, COUNT(DISTINCT CODIGOODT) AS TOTALODTS '+
' FROM  ESTADISTICAREPORTE  WHERE CODIGOREPORTE > 0';

if tciacodigoadministrativo.asstring <> '' then
  qgrupostrabajo.sql.Add(' AND CODIGOADMINISTRATIVO = '+ tciacodigoadministrativo.asstring );

if tciacodigogrupotrabajo.asstring <> '' then
  qgrupostrabajo.sql.Add(' AND CODIGOGRUPOTRABAJO = '+ tciacodigogrupotrabajo.asstring );

qgrupostrabajo.sql.add('GROUP BY NOMBREGRUPOTRABAJO');
qgrupostrabajo.open;

DBChartReportes.Refresh;

DBChartOdts.Refresh;
end;

end.
