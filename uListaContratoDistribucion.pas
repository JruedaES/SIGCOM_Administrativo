unit uListaContratoDistribucion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, Grids, DBGrids, UTrCVS, DBTables, Db, Digisoft, StdCtrls,uFIMPComunes,
  ExtCtrls, UtdNavigator, Buttons, Mask, DBCtrls, Menus;

type                                                                                         
  TFListaContratoDistribucion = class(TFdSgdListaBase)
    qContrato: TQuery;
    sbInsertar: TSpeedButton;
    v: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Bevel4: TBevel;
    Bevel5: TBevel;
    Label16: TLabel;
    Bevel6: TBevel;
    DBMemo1: TDBMemo;
    DBEdit3: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit15: TDBEdit;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    Label15: TLabel;
    DBEdit14: TDBEdit;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    Bevel7: TBevel;
    Label22: TLabel;
    DBEdit21: TDBEdit;
    PMOrdenar: TPopupMenu;
    Codigo: TMenuItem;
    FechaEmision: TMenuItem;
    Objeto: TMenuItem;
    N3: TMenuItem;
    ZonaCiudad: TMenuItem;
    Barrio: TMenuItem;
    Direccion: TMenuItem;
    N4: TMenuItem;
    Prioridad: TMenuItem;
    Labor: TMenuItem;
    Responsable: TMenuItem;
    Estado: TMenuItem;
    N1: TMenuItem;
    DivisionSeccion: TMenuItem;
    Cuadrilla: TMenuItem;
    Aprueba: TMenuItem;
    sbEditar: TSpeedButton;
    qMaxContrato: TQuery;
    dsqMaxContrato: TDataSource;
    dbgListaContrato: TDBGrid;
    qObjeto: TQuery;
    dsqObjeto: TDDataSource;
    Label23: TLabel;
    Bevel8: TBevel;
    DBEdit22: TDBEdit;
    Label24: TLabel;
    Bevel9: TBevel;
    DBEdit23: TDBEdit;
    SpeedButton1: TSpeedButton;
    qTotalesREGISTROS: TFloatField;
    DBText1: TDBText;
    qContratoCODIGOCONTRATO: TFloatField;
    qContratoCODIGOCONTRATISTA: TStringField;
    qContratoFECHAASIGNACION: TDateTimeField;
    qContratoCOSTOTOTAL: TFloatField;
    qContratoFECHAINICIO: TDateTimeField;
    qContratoFECHAENTREGA: TDateTimeField;
    qContratoFECHACERTIFICADO: TDateTimeField;
    qContratoINDICE: TFloatField;
    qContratoUBI_URBANO: TStringField;
    qContratoCOSTOS: TFloatField;
    qContratoNOMBREESTADOCONTRATO: TStringField;
    qContratoNOMBRETIPOCONTRATO: TStringField;
    qContratoFECHALIQUIDACION: TDateTimeField;
    qContratoNOMBREGEOGRAFICO: TStringField;
    qContratoNOMBRECONTRATISTA: TStringField;
    qContratoNOMBREINTERVENTOR: TStringField;
    qContratoCODIGOINTERVENTOR: TFloatField;
    qContratoNUMEROCONTRATO: TStringField;
    pmImprimir: TPopupMenu;
    ImprimirContratos1: TMenuItem;
    ImprimirPresupuestordeObra1: TMenuItem;
    Panel6: TPanel;
    sbInsertarObra: TSpeedButton;
    sbEditarObra: TSpeedButton;
    sbEditarObraCartografia: TSpeedButton;
    dNavigator2: TdNavigator;
    DBGrid1: TDBGrid;
    qContratoObra: TQuery;
    dsContratoObra: TDataSource;
    qContratoMATERIALPRESUPUESTADO: TFloatField;
    qContratoTRANSPORTEPRESUPUESTADO: TFloatField;
    qContratoEQUIPOPRESUPUESTADO: TFloatField;
    qContratoMANOOBRAPRESUPUESTADO: TFloatField;
    DBText2: TDBText;
    qContratoNOMBREADMINISTRATIVO: TStringField;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    qContratoREPRESENTANTECONTRATISTA: TStringField;
    qContratoObraCODIGOCONTRATOOBRA: TFloatField;
    qContratoObraCODIGOCONTRATO: TFloatField;
    qContratoObraCONSECUTIVO: TFloatField;
    qContratoObraFECHAINICIO: TDateTimeField;
    qContratoObraFECHAFIN: TDateTimeField;
    qContratoObraMATERIALPRESUPUESTADO: TFloatField;
    qContratoObraTRANSPORTEPRESUPUESTADO: TFloatField;
    qContratoObraEQUIPOPRESUPUESTADO: TFloatField;
    qContratoObraMANOOBRAPRESUPUESTADO: TFloatField;
    qContratoObraCODIGOMUNICIPIO: TFloatField;
    qContratoObraCODIGOGEOGRAFICO: TFloatField;
    qContratoObraCODIGOMUNICIPIODIFICULTAD: TFloatField;
    qContratoObraMATERIALEJECUTADO: TFloatField;
    qContratoObraMANOOBRAEJECUTADO: TFloatField;
    qContratoObraEQUIPOEJECUTADO: TFloatField;
    qContratoObraTRANSPORTEEJECUTADO: TFloatField;
    qContratoObraVALORMATERIALSOLICITADO: TFloatField;
    qContratoObraVALORMATERIALENTREGADO: TFloatField;
    qContratoObraVALORMATERIALCONSUMIDO: TFloatField;
    qContratoObraVALORMATERIALREINTEGRADO: TFloatField;
    qContratoObraNOMBRECATEGORIA: TStringField;
    qContratoObraINDICEDIFICULTAD: TFloatField;
    qContratoObraURBANO: TStringField;
    procedure sbInsertarClick(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
    procedure SBOrdenarClick(Sender: TObject);
    procedure CodigoClick(Sender: TObject);
    procedure DireccionClick(Sender: TObject);
    procedure LaborClick(Sender: TObject);
    procedure ResponsableClick(Sender: TObject);
    procedure EstadoClick(Sender: TObject);
    procedure DivisionSeccionClick(Sender: TObject);
    procedure CuadrillaClick(Sender: TObject);
    procedure ApruebaClick(Sender: TObject);
    procedure Ordenar(sCriterio: String);
    procedure sbEditarClick(Sender: TObject);
    procedure SBBuscaElementoCartografiaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SBImprimirClick(Sender: TObject);
    procedure SBEstadisticaClick(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ImprimirContratos1Click(Sender: TObject);
    procedure ImprimirPresupuestordeObra1Click(Sender: TObject);
    procedure sbInsertarObraClick(Sender: TObject);
    procedure sbEditarObraClick(Sender: TObject);
    procedure qContratoAfterOpen(DataSet: TDataSet);
    procedure FechaEmisionClick(Sender: TObject);
  private
    { Private declarations }
  public
    Lista,ListaEstadistica,ListaFrom : TStringList;
    procedure Filtrar;
    procedure LimpiarFiltro;
    { Public declarations }
  end;

var
  FListaContratoDistribucion: TFListaContratoDistribucion;
  sCriterio : String;


implementation

uses uContrato, uBuscarContrato, uQRListaContrato, uEstadisticasContrato,
  uQRListadoContrato, uContratoObra;

{$R *.DFM}

procedure TFListaContratoDistribucion.sbInsertarClick(Sender: TObject);
var CodigoContrato : String;
begin
  try
    CodigoContrato := qContrato.fieldByName('CodigoContrato').AsString;
    FContrato:=TFContrato.Create(Application);
    fContrato.Visible := False;
    fContrato.FormStyle := fsNormal;
    if not FContrato.qContrato.Database.InTransaction then
      FContrato.qContrato.Database.StartTransaction;
    fContrato.qContrato.close;
    fContrato.qContrato.ParamByName('CodigoContrato').AsString:='-1';
    fContrato.qContrato.open;
    FContrato.qContrato.Insert;
    FContrato.CodigoObra:=FContrato.qContrato.fieldByName('CodigoContrato').AsString;    
    qMaxContrato.Active := False;
    qMaxContrato.Active := True;
    if qMaxContrato.fieldbyname('CodigoContrato').AsString <> '' then
      CodigoContrato := IntToStr(StrToInt(qMaxContrato.fieldbyname('CodigoContrato').AsString)+1)
    else CodigoContrato := '0000001';
    case Length(CodigoContrato) of
      1 : CodigoContrato := '000000'+CodigoContrato;
      2 : CodigoContrato := '00000'+CodigoContrato;
      3 : CodigoContrato := '0000'+CodigoContrato;
      4 : CodigoContrato := '000'+CodigoContrato;
      5 : CodigoContrato := '00'+ CodigoContrato;
      6 : CodigoContrato := '0'+ CodigoContrato;
    end;
    FContrato.BBCartografia.Visible := False;
    FContrato.qContrato.FieldByName('CodigoContrato').AsString := CodigoContrato;
    if fContrato.ShowModal = mrOk then
    begin
      if FContrato.qContrato.Database.InTransaction then
      begin
        FContrato.qContrato.Database.Commit;
      end;
      qContrato.Close;
      qContrato.Open;
      qContrato.Locate('CODIGOContrato',CODIGOContrato,[])
    end
    else
    begin
      if FContrato.qContrato.Database.InTransaction then
      begin
        FContrato.qContrato.Database.Rollback;
      end;
    end;
    qContrato.close;
    qContrato.Open;
  finally
     fContrato.free;
  end;
end;

procedure TFListaContratoDistribucion.SBBuscarClick(Sender: TObject);
begin
  inherited;
  fBuscarContrato := TfBuscarContrato.Create(Application);
  fBuscarContrato.dsContrato.Dataset := qContrato;
  fBuscarContrato.ShowModal;
  dbgListaContrato.SetFocus;
  fBuscarContrato.Free;
end;

procedure TFListaContratoDistribucion.SBOrdenarClick(Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel2.ClientToScreen(Classes.Point(SBOrdenar.Left, SBOrdenar.top));
  pmOrdenar.Popup(punto.x+10, punto.y+10);
end;

procedure TFListaContratoDistribucion.CodigoClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY C.CODIGOContrato';
  Codigo.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaContratoDistribucion.DireccionClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY C.DIRECCION';
  Direccion.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaContratoDistribucion.LaborClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY L.NOMBRELABOR';
  Labor.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaContratoDistribucion.ResponsableClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY O.RESPONSABLE';
  Responsable.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaContratoDistribucion.EstadoClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY EC.NOMBREESTADOContrato';
  Estado.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaContratoDistribucion.DivisionSeccionClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY S.NOMBRESECCION';
  DivisionSeccion.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaContratoDistribucion.CuadrillaClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY CU.NOMBREJEFE';
  Cuadrilla.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaContratoDistribucion.ApruebaClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY F.NOMBREFIRMANTE';
  Aprueba.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaContratoDistribucion.Ordenar(sCriterio: String);
begin
  qContrato.Active := False;
  qContrato.SQL.Delete(qContrato.SQL.Count - 1);
  qContrato.SQL.Add(sCriterio);
  qContrato.Active := True;
  dbgListaContrato.SetFocus;
end;

procedure TFListaContratoDistribucion.sbEditarClick(Sender: TObject);
Var CodigoContrato : String;
begin
  inherited;
  try
    CodigoContrato := qContrato.fieldByName('CodigoContrato').AsString;
    fContrato := TFContrato.Create(Application);
    fContrato.qContrato.close;
    fContrato.qContrato.ParamByName('CodigoContrato').AsString:=CodigoContrato;
    fContrato.qContrato.open;
    fContrato.Visible := False;
    fContrato.FormStyle := fsNormal;
    if not FContrato.qContrato.Database.InTransaction then
      FContrato.qContrato.Database.StartTransaction;
    FContrato.qContrato.edit;
    FContrato.CodigoObra := FContrato.qContrato.fieldByName('CodigoContrato').AsString;
    FContrato.BBCartografia.Visible := False;

    if fContrato.ShowModal = mrOk then
    begin
      if FContrato.qContrato.Database.InTransaction then FContrato.qContrato.Database.Commit;
      qContrato.Close;
      qContrato.Open;
      qContrato.Locate('CODIGOContrato',CODIGOContrato,[]);
      qContratoObra.close;
      qContratoObra.open;
    end
    else
    begin
      if FContrato.qContrato.Database.InTransaction
         then FContrato.qContrato.Database.Rollback;
    end;
  finally
    FContrato.Free;
  end;
end;

procedure TFListaContratoDistribucion.SBBuscaElementoCartografiaClick(Sender: TObject);
begin
  inherited;
 UbicarContrato(qContrato.FieldByName('CodigoContrato').AsInteger,True);
end;

procedure TFListaContratoDistribucion.FormActivate(Sender: TObject);
begin
  inherited;
//  qContrato.Close;qContrato.Open;
end;

procedure TFListaContratoDistribucion.SpeedButton1Click(Sender: TObject);
Var CodigoContrato : String;
begin
  inherited;
  CodigoContrato := qContrato.fieldByName('CodigoContrato').AsString;
  fContrato := TFContrato.Create(Application);
  FContrato.BorderStyle := bsToolWindow;
  FContrato.FormStyle := fsStayOnTop;
  FContrato.BBCartografia.Visible := True;
  fContrato.Visible := False;
  if FContrato.qContrato.Locate('CODIGOContrato',CodigoContrato,[])
  then
   begin
     if not FContrato.qContrato.Database.InTransaction
     then FContrato.qContrato.Database.StartTransaction;
     FContrato.qContrato.edit;
     FContrato.CodigoObra := FContrato.qContrato.fieldByName('CodigoContrato').AsString;
     FContrato.Show;
     Close;

{     if fContrato.ShowModal = mrOk then
      begin
        if FContrato.qContrato.Database.InTransaction then FContrato.qContrato.Database.Commit;
        qContrato.Close;
        qContrato.Open;
        qContrato.Locate('CODIGOContrato',CODIGOContrato,[])
      end
      else
       begin
         if FContrato.qContrato.Database.InTransaction
         then FContrato.qContrato.Database.Rollback;
       end;
}   end;
//  FContrato.Free;

end;

procedure TFListaContratoDistribucion.SBImprimirClick(Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel2.ClientToScreen(Classes.Point(sbImprimir.Left, sbImprimir.top));
  pmImprimir.Popup(punto.x+10, punto.y+10);
end;

procedure TFListaContratoDistribucion.SBEstadisticaClick(Sender: TObject);
//Var i:integer;
begin
{  fEstadisticasContrato := TfEstadisticasContrato.Create(Application);
  try
  fEstadisticasContrato.DecisionQuery1.close;
  fEstadisticasContrato.DecisionQuery1.SQL.Clear;
  fEstadisticasContrato.DecisionQuery1.SQL.Add('SELECT count(*) as Registros, EO.NOMBREESTADOODT, P.NOMBREPRIORIDAD, L.NOMBRELABOR');
  For i:=8 to qContrato.SQL.Count-2 do fEstadisticasContrato.DecisionQuery1.SQL.Add(qContrato.SQL[i]);
  fEstadisticasContrato.DecisionQuery1.SQL.Add('group by EO.NOMBREESTADOODT, P.NOMBREPRIORIDAD, L.NOMBRELABOR');
  fEstadisticasContrato.DecisionQuery1.Open;
  fEstadisticasContrato.ShowModal;
  except
    ShowMessage('Datos insuficientes para realizar la Estadística');
  end;
  fEstadisticasContrato.Free;}
end;

procedure TFListaContratoDistribucion.SBFiltrarClick(Sender: TObject);
begin
  Filtrar;
  inherited;
end;

procedure TFListaContratoDistribucion.Filtrar;
begin
  Lista := GetQueryFiltroContrato(ListaRotulos, ListaDatos, ListaFrom);
  If Lista <> Nil then
   begin
     qContrato.Close;
     If qContrato.sql.Count > 18 then LimpiarFiltro;
     qContrato.SQl.Insert(17,Lista.Text);
     qContrato.Open;
     if qContrato.RecordCount>1 then
       lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + inttostr(qContrato.RecordCount)+' Registros Encontrados >>'
     else
       lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + inttostr(qContrato.RecordCount)+' Registro Encontrado >>';
   end;
end;

procedure TFListaContratoDistribucion.LimpiarFiltro;
var
 nLineasExtra,i: Byte;
begin
 nLineasExtra := qContrato.SQL.Count-18;
 if nLineasExtra > 0 then
    for i:=1 to nLineasExtra do
     begin
      qContrato.SQL.Delete(17);
     end;
end;

procedure TFListaContratoDistribucion.FormShow(Sender: TObject);
begin
  WindowState:=wsMaximized;
  Filtrar;
  inherited;
end;

procedure TFListaContratoDistribucion.FormCreate(Sender: TObject);
begin
  dTblBase.Free;
  qContrato.Open;
  qContratoObra.Open;
  inherited;
end;

procedure TFListaContratoDistribucion.ImprimirContratos1Click(
  Sender: TObject);
var i,j:integer;
begin
  try
    FQRListadoContrato := TFQRListadoContrato.Create(Application);
    FQRListadoContrato.ListaDatos.Assign(ListaDatos);
    FQRListadoContrato.ListaRotulos.Assign(ListaRotulos);
    FQRListadoContrato.qcontrato.sql.insert(24,'AND C.CODIGOESTADOCONTRATO>1');
    j:=25;
    for i:=19 to qContrato.SQL.Count-2 do
    begin
      FQRListadoContrato.qContrato.SQL.insert(j,qContrato.SQL[i]);
      inc(j);
    end;
    FQRListadoContrato.qcontrato.open;
    FQRListadoContrato.QuickRep.Preview;
    Application.ProcessMessages;
  except
    FQRListadoContrato.Free;
  end;
end;

procedure TFListaContratoDistribucion.ImprimirPresupuestordeObra1Click(
  Sender: TObject);
var i,j:integer;
begin
  try
    FQRListadoContrato := TFQRListadoContrato.Create(Application);
    FQRListadoContrato.ListaDatos.Assign(ListaDatos);
    FQRListadoContrato.ListaRotulos.Assign(ListaRotulos);
    FQRListadoContrato.qcontrato.sql.insert(24,'AND C.CODIGOESTADOCONTRATO=1');
    j:=25;
    for i:=19 to qContrato.SQL.Count-2 do
    begin
      FQRListadoContrato.qContrato.SQL.insert(j,qContrato.SQL[i]);
      inc(j);
    end;
    FQRListadoContrato.qcontrato.open;
    FQRListadoContrato.QuickRep.Preview;
    Application.ProcessMessages;
  except
    FQRListadoContrato.Free;
  end;
end;

procedure TFListaContratoDistribucion.sbInsertarObraClick(Sender: TObject);
var qdatos:tquery;
  codigo:integer;
  bm:TBookmark;
begin
  if qContratoCODIGOCONTRATO.AsString<>'' then
  begin
    try
      fContratoObra := TfContratoObra.Create(Application);
      fContratoObra.qContrato.Close;
      fContratoObra.qContrato.sql.Add('WHERE CODIGOCONTRATO='+qContratoCODIGOContraTO.AsString);
      fContratoObra.qContrato.Open;
      fContratoObra.qContratoObra.close;
      fContratoObra.qContratoObra.Open;
      if not fContratoObra.qContratoObra.Database.InTransaction then
      fContratoObra.qContratoObra.Database.StartTransaction;
      fContratoObra.qContratoObra.insert;
      qDatos:=TQuery.Create(self);
      qDatos.DatabaseName:='BaseDato';
      qDatos.sql.text:='SELECT MAX(CODIGOCONTRATOOBRA) FROM CONTRATOOBRA';
      qDatos.open;
      codigo:=0;
      if (qdatos.recordcount>0) then codigo:=qdatos.fields[0].AsInteger;
      fContratoObra.qContratoObraCODIGOContraTOOBRA.Asinteger:= codigo+1;
      qDatos.close;
      qDatos.sql.clear;
      qDatos.sql.add('SELECT MAX(CONSECUTIVO) FROM CONTRATOOBRA');
      qDatos.sql.add('WHERE CODIGOCONTRATO='+qContratoCODIGOContraTO.AsString);
      qdatos.open;
      codigo:=0;
      if (qdatos.recordcount>0) then codigo:=qdatos.fields[0].AsInteger;
      fContratoObra.qContratoObraCONSECUTIVO.Asinteger:=codigo+1;
      fContratoObra.qContratoObra.Post;
      fContratoObra.qContratoObra.edit;
      fContratoObra.qContrato.edit;
      fContratoObra.CodigoContratoObra := fContratoObra.qContratoObraCodigoContratoObra.AsString;
      fContratoObra.Show;
    except
      fContratoObra.Free;
    end;
    qdatos.free;
  end;
end;

procedure TFListaContratoDistribucion.sbEditarObraClick(Sender: TObject);
var bm:tbookmark;
begin
  if (qContratoCODIGOCONTRATO.AsString<>'') then
  begin
    try
      fContratoObra := TfContratoObra.Create(Application);
      fContratoObra.qContrato.sql.Add('WHERE CODIGOCONTRATO='+qContratoCODIGOContraTO.AsString);
      fContratoObra.qContrato.Open;
      fContratoObra.qContratoObra.close;
      fContratoObra.qContratoObra.sql.Add('WHERE CODIGOCONTRATOOBRA='+qContratoObra.fieldbyname('CODIGOCONTRATOOBRA').AsString);
      fContratoObra.qContratoObra.Open;
      if not fContratoObra.qContrato.Database.InTransaction then
      fContratoObra.qContrato.Database.StartTransaction;
      fContratoObra.qContratoObra.edit;
      fContratoObra.qContrato.edit;
      fContratoObra.CodigoContratoObra := fContratoObra.qContratoObraCodigoContratoObra.AsString;
//      fContratoObra.BBCartografia.Visible := False;
      fContratoObra.Show;
    except
      fContratoObra.Free;
    end;
  end;
end;

procedure TFListaContratoDistribucion.qContratoAfterOpen(
  DataSet: TDataSet);
begin
  qObjeto.close;
  qObjeto.Open;
end;

procedure TFListaContratoDistribucion.FechaEmisionClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY C.FECHAASIGNACION';
  Codigo.Checked := true;
  Ordenar(sCriterio);
end;

end.
  