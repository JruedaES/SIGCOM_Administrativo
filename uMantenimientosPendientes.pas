unit uMantenimientosPendientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, Db, DBTables, ExtCtrls, Buttons, StdCtrls, comObj,
  Menus;
  {
  Grids, DBGrids, ExtCtrls, ComCtrls, StdCtrls, Buttons, DBCtrls, Db,
  DBTables, Mask, Digisoft, UtdNavigator, Menus, RXDBCtrl,comObj;  }

type
  TfMantenimientosPendientes = class(TForm)
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    PanelSuperior: TPanel;
    Panel1: TPanel;
    Panel8: TPanel;
    sbRefrescar: TSpeedButton;
    Panel9: TPanel;
    SBSalir: TSpeedButton;
    SBImprimir: TSpeedButton;
    bFiltrar: TSpeedButton;
    SBBuscar: TSpeedButton;
    SBOrdenar: TSpeedButton;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel1: TBevel;
    sbExportar: TSpeedButton;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Panel2: TPanel;
    qMantenimientosPendientes: TQuery;
    dsMantenimientosPendientes: TDataSource;
    sbProgramar: TSpeedButton;
    pmOrdenar: TPopupMenu;
    CodigoMtto: TMenuItem;
    Fecha: TMenuItem;
    Circuito: TMenuItem;
    ambito: TMenuItem;
    TipoElemento: TMenuItem;
    Elemento: TMenuItem;
    Subestacion: TMenuItem;
    RxDBGMantenimientosPendientes: TRxDBGrid;
    qMantenimientosPendientesCODIGOTAREA: TFloatField;
    qMantenimientosPendientesNOMBRETAREA: TStringField;
    qMantenimientosPendientesFECHAFINEJEC: TDateTimeField;
    qMantenimientosPendientesNOMBRESUBESTACION: TStringField;
    qMantenimientosPendientesNOMBRECIRCUITO: TStringField;
    qMantenimientosPendientesNOMBREMANTENIMIENTO: TStringField;
    qMantenimientosPendientesNOMBREAMBITO: TStringField;
    qMantenimientosPendientesNOMBRETIPOELEMENTO: TStringField;
    qMantenimientosPendientesCLELEMENTO1: TStringField;
    NombreMantenimiento: TMenuItem;
    qMantenimientosPendientesCODIGOBANCOMANTENIMIENTO: TFloatField;
    qMantenimientosPendientesCODIGOSUBESTACION: TStringField;
    qMantenimientosPendientesCODIGOCIRCUITO: TStringField;
    qMantenimientosPendientesCODIGOAMBITO: TFloatField;
    qMantenimientosPendientesCODIGOELEMENTO: TFloatField;
    procedure sbExportarClick(Sender: TObject);
    procedure SBOrdenarClick(Sender: TObject);
    procedure CodigoMttoClick(Sender: TObject);
    procedure sbProgramarClick(Sender: TObject);
    procedure qMantenimientosPendientesAfterOpen(DataSet: TDataSet);
    procedure sbRefrescarClick(Sender: TObject);
    procedure FechaClick(Sender: TObject);
    procedure SBSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NombreMantenimientoClick(Sender: TObject);
    procedure ambitoClick(Sender: TObject);
    procedure SubestacionClick(Sender: TObject);
    procedure CircuitoClick(Sender: TObject);
    procedure TipoElementoClick(Sender: TObject);
    procedure ElementoClick(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
    procedure bFiltrarClick(Sender: TObject);
  private
    ListaDireccionCampos:TStringList;
    Year, Month, Day, Hour, Min, Sec, MSec: Word;
    Present: TDateTime;
    mes, ano: integer;
  public
    procedure Ordenar(sCriterio:String);
    constructor BuscarMantenimientos(AOwner:Tcomponent;fecha_mtto:TDate);
    { Public declarations }
  end;

var
  fMantenimientosPendientes: TfMantenimientosPendientes;

implementation
uses uMantenimientoMes, uBuscarMaterial, uBusquedaMtto, uBusquedaMttoPte,
  ufiltroMantenimientoPte, ufiltroMantenimiento;

{$R *.DFM}

constructor TfMantenimientosPendientes.BuscarMantenimientos(AOwner:TComponent;fecha_mtto:TDate);
var Year1,Month1,Day1:word;
begin
  inherited create(owner);
  DecodeDate(fecha_mtto,Year1,Month1,Day1);
  mes:= Month1;
  ano:= Year1;
  {if qElemento.Active then
    qElemento.Close;
  qElemento.Open;
  if qSubestacion.Active then
    qSubestacion.Close;
  qSubestacion.Open;  }

end;



procedure TfMantenimientosPendientes.sbExportarClick(Sender: TObject);
Var
  oXL, oWB: Variant;
  fila: integer;
begin
  // OJO ARREGLAR SEGUN EL QUERY QMANTENIMIENTOS PENDIENTES......

  Present:= Now;
  DecodeDate(Present, Year, Month, Day);
  DecodeTime(Present, Hour, Min, Sec, MSec);
  oXL := CreateOleObject('Excel.Application');
  oXL.Visible := True;
  oWB := oXL.Workbooks.Add;
  oWB.sheets.add.name:= 'Mantenimientos';
  oWB.ActiveSheet.Cells[1,1] := 'CODIGO MTTO';
  oWB.ActiveSheet.Cells[1,2] := 'NOMBRE TAREA';
  oWB.ActiveSheet.Cells[1,3] := 'FECHA ULTIMO';
  oWB.ActiveSheet.Cells[1,4] := 'AMBITO';
  oWB.ActiveSheet.Cells[1,5] := 'SUBESTACION';
  oWB.ActiveSheet.Cells[1,6] := 'CIRCUITO';
  oWB.ActiveSheet.Cells[1,7] := 'BCO MANTENIMIENTO';
  oWB.ActiveSheet.Cells[1,8] := 'TIPO ELEMENTO';
  oWB.ActiveSheet.Cells[1,9] := 'ELEMENTO';
  qMantenimientosPendientes.First;
  fila:= 2;
  while not qMantenimientosPendientes.eof do
  begin
    oWB.ActiveSheet.Cells[fila,1] :=  qMantenimientosPendientes.FIELDBYNAME('codigotarea').asstring;
    oWB.ActiveSheet.Cells[fila,2] :=  qMantenimientosPendientes.FIELDBYNAME('nombretarea').asstring;
    oWB.ActiveSheet.Cells[fila,3] :=  qMantenimientosPendientes.FIELDBYNAME('FECHAFINEJEC').asstring;
    oWB.ActiveSheet.Cells[fila,4] :=  qMantenimientosPendientes.FIELDBYNAME('NOMBREAMBITO').asstring;
    oWB.ActiveSheet.Cells[fila,5] :=  qMantenimientosPendientes.FIELDBYNAME('NOMBRESUBESTACION').asstring;
    oWB.ActiveSheet.Cells[fila,6] :=  qMantenimientosPendientes.FIELDBYNAME('NOMBREcircuito').asstring;
    oWB.ActiveSheet.Cells[fila,7] :=  qMantenimientosPendientes.FIELDBYNAME('NOMBREMantenimiento').asstring;
    oWB.ActiveSheet.Cells[fila,8] :=  qMantenimientosPendientes.FIELDBYNAME('NOMBRETIPOelemento').asstring;
    oWB.ActiveSheet.Cells[fila,9] :=  qMantenimientosPendientes.FIELDBYNAME('clelemento1').asstring;
    fila:= fila + 1;
    qMantenimientosPendientes.next;
  end;
  oWB.SaveAs('C:\EnerGIS4\ConsultaMttosProgramados'+'_'+IntToStr(Day)+'_'+ IntToStr(Month)+'_' +IntToStr(Year) + '_'+ IntToStr(Hour)+'y'+IntToStr(Min),null,'','',EmptyParam,EmptyParam,0, EmptyParam, EmptyParam, EmptyParam,EmptyParam,0);
end;

procedure TfMantenimientosPendientes.SBOrdenarClick(Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel9.ClientToScreen(Classes.Point(SBOrdenar.Left, SBOrdenar.top));
  pmOrdenar.Popup(punto.x-10, punto.y-10);
end;

procedure TfMantenimientosPendientes.CodigoMttoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('CODIGOMTTO');
  sCriterio := 'ORDER BY t.codigotarea DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['CODIGOMTTO']='1') then
    begin
      sCriterio := 'ORDER BY t.codigotarea ASC';
      ListaDireccionCampos.Values['CODIGOMTTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['CODIGOMTTO']:='1'
  end;
  CodigoMtto.Checked := true;
  Ordenar(sCriterio);
  with RxDBGMantenimientosPendientes do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosPendientesCODIGOTAREA;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfMantenimientosPendientes.sbProgramarClick(Sender: TObject);
begin
  if qmantenimientosPendientes.Recordcount>0 then
  begin
        fMantenimientoMes:= TfMantenimientoMes.programar(self,qmantenimientospendientes.FIELDBYNAME('codigobancomantenimiento').asfloat,qmantenimientospendientes.FIELDBYNAME('codigotarea').ASFLOAT);
        if fMantenimientoMes.ShowModal = mrOk then
        Begin
          qmantenimientospendientes.close;
          qmantenimientospendientes.open;
        End;
        fMantenimientoMes.Free;
  end;
end;

procedure TfMantenimientosPendientes.Ordenar(sCriterio: String);
begin
  qmantenimientospendientes.Close;
  qmantenimientospendientes.SQL.Delete(qmantenimientospendientes.SQL.Count - 1);
  qmantenimientospendientes.SQL.Add(sCriterio);
  qmantenimientospendientes.Open;
end;

procedure TfMantenimientosPendientes.qMantenimientosPendientesAfterOpen(
  DataSet: TDataSet);
begin
if qmantenimientospendientes.recordcount = 0 then
  sbProgramar.Enabled:= false
else
  sbProgramar.Enabled:= true;
end;

procedure TfMantenimientosPendientes.sbRefrescarClick(Sender: TObject);
begin
  qMantenimientosPendientes.Close;
  qMantenimientosPendientes.Open;
end;

procedure TfMantenimientosPendientes.FechaClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHA');
  sCriterio := 'ORDER BY m.FECHAFINEJEC DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['FECHA']='1') then
    begin
      sCriterio := 'ORDER BY m.FECHAFINEJEC ASC';
      ListaDireccionCampos.Values['FECHA']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHA']:='1'
  end;
  FECHA.Checked := true;
  Ordenar(sCriterio);
  with RxDBGMantenimientosPendientes do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosPendientesFECHAFINEJEC;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfMantenimientosPendientes.SBSalirClick(Sender: TObject);
begin
  fMantenimientosPendientes.ModalResult:= mrOk;
end;

procedure TfMantenimientosPendientes.FormCreate(Sender: TObject);
var
qconsulta:tquery;
diasmes:string;
begin
qconsulta:= TQuery.Create(Application);
qconsulta.DatabaseName:='BaseDato';
qconsulta.SQL.Add('select to_char(last_day(to_date('''+inttostr(mes)+'/'+inttostr(ano)+''',''mm/yyyy'')), ''DD'') as diasmes from dual');
qconsulta.Open;
diasmes:= qconsulta.fieldbyname('diasmes').asstring;
qconsulta.close;
qconsulta.free;
qMantenimientosPendientes.sql.text:= 'SELECT   t.codigotarea,t.nombretarea, m.fechafinejec, m.codigosubestacion,s.NOMBRESUBESTACION, m.codigocircuito,c.NOMBRECIRCUITO, '+
                                     ' m.codigobancomantenimiento,bm.NOMBREMANTENIMIENTO, Bm.codigoambito, a.NOMBREAMBITO, em.codigoelemento, E.NOMBRETIPOELEMENTO, '+
                                     ' em.clelemento1 '+
                                     ' FROM pm_tarea t, pm_mantenimiento m, pm_elementomantenimiento em, subestacion s, circuito c, pm_bancomantenimiento bm, pm_ambito a, PM_ELEMENTO	E '+
                                     ' WHERE s.codigosubestacion = m.CODIGOSUBESTACION AND  em.codigoelementomantenimiento = m.codigomantenimiento '+
                                     ' AND m.CODIGOBANCOMANTENIMIENTO = bm.CODIGOBANCOMANTENIMIENTO AND Bm.CODIGOAMBITO = a.CODIGOAMBITO(+) AND EM.CODIGOELEMENTO =  E.CODIGOELEMENTO '+
                                     ' AND m.codigomantenimiento = t.codigotarea AND m.CODIGOCIRCUITO = c.CODIGOCIRCUITO(+) '+
                                     ' AND m.FECHAFINEJEC + t.frecuencia BETWEEN  TO_DATE(''01/''|| :mes ||''/''|| :ano ,''dd/mm/yyyy'') AND TO_DATE('''+diasmes +'''||''/''|| :mes ||''/''|| :ano ,''dd/mm/yyyy'') '+
                                     ' AND t.codigotarea IN ( '+
                                     ' SELECT ultimo '+
                                     ' FROM (SELECT   em.clelemento1, m.codigobancomantenimiento, '+
                                     ' MAX (t.codigotarea) AS ultimo '+
                                     ' FROM pm_tarea t, '+
                                     ' pm_mantenimiento m, '+
                                     ' pm_elementomantenimiento em '+
                                     ' WHERE em.codigoelementomantenimiento = '+
                                     ' m.codigomantenimiento '+
                                     ' AND m.codigomantenimiento = t.codigotarea '+
                                     ' GROUP BY em.clelemento1, m.codigobancomantenimiento)) '+
                                     ' AND m.fechafinejec IS NOT NULL ';
qMantenimientosPendientes.sql.ADD(' ORDER BY t.codigotarea ');
qMantenimientosPendientes.ParamByName('mes').asinteger:= mes;
qMantenimientosPendientes.ParamByName('ano').asinteger:= ano;
//qMantenimientosPendientes.sql.SaveToFile('d:\borrar\mtopendientesmes.txt');
qMantenimientosPendientes.open;


  ListaDireccionCampos:=TStringList.Create;
  ListaDireccionCampos.Add('CODIGOMTTO=-1');
  ListaDireccionCampos.Add('NOMBREMANTENIMIENTO=-1');
  ListaDireccionCampos.Add('FECHA=-1');
  ListaDireccionCampos.Add('AMBITO=-1');
  ListaDireccionCampos.Add('SUBESTACION=-1');
  ListaDireccionCampos.Add('CIRCUITO=-1');
  ListaDireccionCampos.Add('TIPOELEMENTO=-1');
  ListaDireccionCampos.Add('ELEMENTO=-1');


end;

procedure TfMantenimientosPendientes.NombreMantenimientoClick(
  Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('NOMBREMANTENIMIENTO');
  sCriterio := 'ORDER BY t.nombretarea DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['NOMBREMANTENIMIENTO']='1') then
    begin
      sCriterio := 'ORDER BY t.nombretarea ASC';
      ListaDireccionCampos.Values['NOMBREMANTENIMIENTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['NOMBREMANTENIMIENTO']:='1'
  end;
  NOMBREMANTENIMIENTO.Checked := true;
  Ordenar(sCriterio);
  with RxDBGMantenimientosPendientes do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosPendientesnombretarea;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfMantenimientosPendientes.ambitoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('AMBITO');
  sCriterio := 'ORDER BY a.NOMBREAMBITO DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['AMBITO']='1') then
    begin
      sCriterio := 'ORDER BY a.NOMBREAMBITO ASC';
      ListaDireccionCampos.Values['AMBITO']:='-1';
    end
    else
      ListaDireccionCampos.Values['AMBITO']:='1'
  end;
  AMBITO.Checked := true;
  Ordenar(sCriterio);
  with RxDBGMantenimientosPendientes do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosPendientesNOMBREAMBITO;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfMantenimientosPendientes.SubestacionClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('SUBESTACION');
  sCriterio := 'ORDER BY S.NOMBRESUBESTACION DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['SUBESTACION']='1') then
    begin
      sCriterio := 'ORDER BY S.NOMBRESUBESTACION ASC';
      ListaDireccionCampos.Values['SUBESTACION']:='-1';
    end
    else
      ListaDireccionCampos.Values['SUBESTACION']:='1'
  end;
  SUBESTACION.Checked := true;
  Ordenar(sCriterio);
  with RxDBGMantenimientosPendientes do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosPendientesNOMBRESUBESTACION;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfMantenimientosPendientes.CircuitoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('CIRCUITO');
  sCriterio := 'ORDER BY C.NOMBRECIRCUITO DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['CIRCUITO']='1') then
    begin
      sCriterio := 'ORDER BY C.NOMBRECIRCUITO ASC';
      ListaDireccionCampos.Values['CIRCUITO']:='-1';
    end
    else
      ListaDireccionCampos.Values['CIRCUITO']:='1'
  end;
  CIRCUITO.Checked := true;
  Ordenar(sCriterio);
  with RxDBGMantenimientosPendientes do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosPendientesNOMBRECIRCUITO;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfMantenimientosPendientes.TipoElementoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('TIPOELEMENTO');
  sCriterio := 'ORDER BY E.NOMBRETIPOELEMENTO DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['TIPOELEMENTO']='1') then
    begin
      sCriterio := 'ORDER BY E.NOMBRETIPOELEMENTO ASC';
      ListaDireccionCampos.Values['TIPOELEMENTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['TIPOELEMENTO']:='1'
  end;
  TIPOELEMENTO.Checked := true;
  Ordenar(sCriterio);
  with RxDBGMantenimientosPendientes do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosPendientesNOMBRETIPOELEMENTO;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfMantenimientosPendientes.ElementoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('ELEMENTO');
  sCriterio := 'ORDER BY em.clelemento1 DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['ELEMENTO']='1') then
    begin
      sCriterio := 'ORDER BY em.clelemento1 ASC';
      ListaDireccionCampos.Values['ELEMENTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['ELEMENTO']:='1'
  end;
  ELEMENTO.Checked := true;
  Ordenar(sCriterio);
  with RxDBGMantenimientosPendientes do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosPendientesclelemento1;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfMantenimientosPendientes.SBBuscarClick(Sender: TObject);
begin
  FBusquedaMttoPte := TFBusquedaMttoPte.Create(Application);
  FBusquedaMttoPte.dsMtto.DataSet:=qMantenimientosPendientes;
  FBusquedaMttoPte.ShowModal;
  FBusquedaMttoPte.Free;
  RxDBGMantenimientosPendientes.Setfocus;
end;

procedure TfMantenimientosPendientes.bFiltrarClick(Sender: TObject);
begin
  fFiltroMantenimientoPte:=TfFiltroMantenimientoPte.Create(Application);
  if fFiltroMantenimientoPte.ShowModal=mrOK then
  Begin
    fFiltroMantenimientoPte.DBLCBEstadoMtto.KeyValue:=2;
    qMantenimientosPendientes.SQL.Clear;
    qMantenimientosPendientes.Close;
    qMantenimientosPendientes.sql.text:=fFiltroMantenimientoPte.qmantenimientos.sql.text;
    qmantenimientospendientes.SQL.Add(sCriterio);
    qMantenimientosPendientes.ParamByName('mes').asinteger:= mes;
    qMantenimientosPendientes.ParamByName('ano').asinteger:= ano; 
    qMantenimientosPendientes.Open;
    if qMantenimientosPendientes.RecordCount <> 1 then
      PanelSuperior.Caption := 'MANTENIMIENTOS REALIZADOS     << ' + inttostr(qMantenimientosPendientes.recordcount)+' Registros Encontrados >>'
    else PanelSuperior.Caption := 'MANTENIMIENTOS REALIZADOS     << ' +inttostr(qMantenimientosPendientes.recordcount)+' Registro Encontrado >>';
  end;
  fFiltroMantenimientoPte.Free;
end;

end.
