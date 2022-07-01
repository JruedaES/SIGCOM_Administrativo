unit uListaPresupuesto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, Grids, DBGrids, UTrCVS, DBTables, Db, Digisoft, StdCtrls,uFIMPComunes,
  ExtCtrls, UtdNavigator, Buttons, Mask, DBCtrls, Menus;

type                                                                                         
  TFListaPresupuesto = class(TFdSgdListaBase)
    qPresupuesto: TQuery;
    sbInsertar: TSpeedButton;
    Panel4: TPanel;
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
    qMaxPresupuesto: TQuery;
    dbgListaPresupuesto: TDBGrid;
    sbEditarCartografia: TSpeedButton;
    qTotalesREGISTROS: TFloatField;
    pmImprimir: TPopupMenu;
    ImprimirPresupuestordeObra1: TMenuItem;
    qPresupuestoCODIGOPRESUPUESTO: TFloatField;
    qPresupuestoNUMEROPRESUPUESTO: TStringField;
    qPresupuestoCODIGOESTADOPRESUPUESTO: TStringField;
    qPresupuestoCODIGOTIPOCONTRATO: TStringField;
    qPresupuestoOBJETO: TBlobField;
    qPresupuestoFECHAPRESUPUESTO: TDateTimeField;
    qPresupuestoFECHAASIGNACION: TDateTimeField;
    qPresupuestoADMINISTRACION: TFloatField;
    qPresupuestoIMPREVISTOS: TFloatField;
    qPresupuestoUTILIDADES: TFloatField;
    qPresupuestoIVA: TFloatField;
    qPresupuestoMATERIAL: TFloatField;
    qPresupuestoTRANSPORTE: TFloatField;
    qPresupuestoEQUIPO: TFloatField;
    qPresupuestoMANOOBRA: TFloatField;
    qPresupuestoSECUENCIA: TFloatField;
    qPresupuestoANO: TStringField;
    qPresupuestoNOMBRETIPOCONTRATO: TStringField;
    qPresupuestoNOMBREESTADOPRESUPUESTO: TStringField;
    qPresupuestoCODIGOGEOGRAFICO: TFloatField;
    qPresupuestoCOSTOTOTAL: TFloatField;
    qPresupuestoNOMBREGEOGRAFICO: TStringField;
    Panel5: TPanel;
    Label1: TLabel;
    DBMemo1: TDBMemo;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Panel6: TPanel;
    sbInsertarObra: TSpeedButton;
    sbEditarObra: TSpeedButton;
    sbEditarObraCartografia: TSpeedButton;
    dNavigator2: TdNavigator;
    DBGrid1: TDBGrid;
    qPresupuestoObra: TQuery;
    dsPresupuestoObra: TDataSource;
    qMaxPresupuestoCODIGOPRESUPUESTO: TFloatField;
    qPresupuestoObraCODIGOPRESUPUESTOOBRA: TFloatField;
    qPresupuestoObraCODIGOPRESUPUESTO: TFloatField;
    qPresupuestoObraCONSECUTIVO: TFloatField;
    qPresupuestoObraFECHAINICIO: TDateTimeField;
    qPresupuestoObraFECHAFIN: TDateTimeField;
    qPresupuestoObraMATERIAL: TFloatField;
    qPresupuestoObraTRANSPORTE: TFloatField;
    qPresupuestoObraEQUIPO: TFloatField;
    qPresupuestoObraMANOOBRA: TFloatField;
    qPresupuestoObraCODIGOMUNICIPIO: TFloatField;
    qPresupuestoObraCODIGOGEOGRAFICO: TFloatField;
    qPresupuestoObraCODIGOMUNICIPIODIFICULTAD: TFloatField;
    qPresupuestoObraNOMBRECATEGORIA: TStringField;
    qPresupuestoObraNOMBREMUNICIPIO: TStringField;
    qPresupuestoObraMUNICIPIO1: TMemoField;
    qPresupuestoObraURBANO: TStringField;
    qPresupuestoObraINDICEDIFICULTAD: TFloatField;
    qPresupuestoObraMunicipio2: TStringField;
    qPresupuestoObraUrbanoCalc: TStringField;
    procedure sbInsertarClick(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
    procedure SBOrdenarClick(Sender: TObject);
    procedure CodigoClick(Sender: TObject);
    procedure FechaEmisionClick(Sender: TObject);
    procedure ObjetoClick(Sender: TObject);
    procedure DireccionClick(Sender: TObject);
    procedure PrioridadClick(Sender: TObject);
    procedure LaborClick(Sender: TObject);
    procedure ResponsableClick(Sender: TObject);
    procedure EstadoClick(Sender: TObject);
    procedure DivisionSeccionClick(Sender: TObject);
    procedure CuadrillaClick(Sender: TObject);
    procedure ApruebaClick(Sender: TObject);
    procedure Ordenar(sCriterio: String);
    procedure sbEditarClick(Sender: TObject);
    procedure SBBuscaElementoCartografiaClick(Sender: TObject);
    procedure sbEditarCartografiaClick(Sender: TObject);
    procedure SBImprimirClick(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbInsertarObraClick(Sender: TObject);
    procedure sbEditarObraClick(Sender: TObject);
    procedure qPresupuestoObraCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Lista,ListaEstadistica,ListaFrom : TStringList;
    procedure Filtrar;
    procedure LimpiarFiltro;
    { Public declarations }
  end;

var
  FListaPresupuesto: TFListaPresupuesto;
  sCriterio : String;


implementation

uses uPresupuesto, uBuscarPResupuesto, uEstadisticasContrato,
  uQRListadoPresupuesto, uPresupuestoObra;

{$R *.DFM}

procedure TFListaPresupuesto.sbInsertarClick(Sender: TObject);
var CodigoPresupuesto : String;
begin
  try
    CodigoPresupuesto := qPresupuesto.fieldByName('CodigoPresupuesto').AsString;
    FPresupuesto:=TFPresupuesto.Create(Application);
    fPresupuesto.Visible := False;
    fPresupuesto.FormStyle := fsNormal;
    if not fPresupuesto.qPresupuesto.Database.InTransaction then
      fPresupuesto.qPresupuesto.Database.StartTransaction;
    fPresupuesto.qPresupuesto.Insert;
    qMaxPresupuesto.Active := False;
    qMaxPresupuesto.Active := True;
    if qMaxPresupuesto.fieldbyname('CodigoPresupuesto').AsString <> '' then
      CodigoPresupuesto := IntToStr(StrToInt(qMaxPresupuesto.fieldbyname('CodigoPresupuesto').AsString)+1)
    else CodigoPresupuesto := '0000001';
    case Length(CodigoPresupuesto) of
      1 : CodigoPresupuesto := '000000'+CodigoPresupuesto;
      2 : CodigoPresupuesto := '00000'+CodigoPresupuesto;
      3 : CodigoPresupuesto := '0000'+CodigoPresupuesto;
      4 : CodigoPresupuesto := '000'+CodigoPresupuesto;
      5 : CodigoPresupuesto := '00'+ CodigoPresupuesto;
      6 : CodigoPresupuesto := '0'+ CodigoPresupuesto;
    end;
  //  fPresupuesto.BBCartografia.Visible := False;
    fPresupuesto.qPresupuesto.FieldByName('CodigoPresupuesto').AsString := CodigoPresupuesto;
    if fPresupuesto.ShowModal = mrOk then
    begin
      if fPresupuesto.qPresupuesto.Database.InTransaction then
      begin
        fPresupuesto.qPresupuesto.Database.Commit;
      end;
      qPresupuesto.Close;
      qPresupuesto.Open;
      qPresupuesto.Locate('CodigoPresupuesto',CodigoPresupuesto,[])
    end
    else
    begin
      if fPresupuesto.qPresupuesto.Database.InTransaction then
      begin
        fPresupuesto.qPresupuesto.Database.Rollback;
      end;
    end;
    qPresupuesto.close;
    qPresupuesto.Open;
  finally
     fPresupuesto.free;
  end;
end;

procedure TFListaPresupuesto.SBBuscarClick(Sender: TObject);
begin
  inherited;
  fBuscarPresupuesto := TfBuscarPresupuesto.Create(Application);
  fBuscarPresupuesto.dsPresupuesto.Dataset := qPresupuesto;
  fBuscarPresupuesto.ShowModal;
  dbgListaPresupuesto.SetFocus;
  fBuscarPresupuesto.Free;
end;

procedure TFListaPresupuesto.SBOrdenarClick(Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel2.ClientToScreen(Classes.Point(SBOrdenar.Left, SBOrdenar.top));
  pmOrdenar.Popup(punto.x+10, punto.y+10);
end;

procedure TFListaPresupuesto.CodigoClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY C.CodigoPresupuesto';
  Codigo.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaPresupuesto.FechaEmisionClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY C.FECHAASIGNACION';
  FechaEmision.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaPresupuesto.ObjetoClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY C.OBJETO';
  Objeto.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaPresupuesto.DireccionClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY C.DIRECCION';
  Direccion.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaPresupuesto.PrioridadClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY P.NOMBREPRIORIDAD';
  Prioridad.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaPresupuesto.LaborClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY L.NOMBRELABOR';
  Labor.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaPresupuesto.ResponsableClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY O.RESPONSABLE';
  Responsable.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaPresupuesto.EstadoClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY E.NOMBREESTADOContrato';
  Estado.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaPresupuesto.DivisionSeccionClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY S.NOMBRESECCION';
  DivisionSeccion.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaPresupuesto.CuadrillaClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY CU.NOMBREJEFE';
  Cuadrilla.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaPresupuesto.ApruebaClick(Sender: TObject);
begin
  inherited;
  sCriterio := 'ORDER BY F.NOMBREFIRMANTE';
  Aprueba.Checked := true;
  Ordenar(sCriterio);
end;

procedure TFListaPresupuesto.Ordenar(sCriterio: String);
begin
  qPresupuesto.Active := False;
  qPresupuesto.SQL.Delete(qPresupuesto.SQL.Count - 1);
  qPresupuesto.SQL.Add(sCriterio);
  qPresupuesto.Active := True;
  dbgListaPresupuesto.SetFocus;
end;

procedure TFListaPresupuesto.sbEditarClick(Sender: TObject);
Var CodigoPresupuesto : String;
begin
  inherited;
  try
    CodigoPresupuesto := qPresupuesto.fieldByName('CodigoPresupuesto').AsString;
    fPresupuesto := TfPresupuesto.Create(Application);
    fPresupuesto.Visible := False;
    fPresupuesto.FormStyle := fsNormal;
    if fPresupuesto.qPresupuesto.Locate('CodigoPresupuesto',CodigoPresupuesto,[])then
    begin
      if not fPresupuesto.qPresupuesto.Database.InTransaction then
        fPresupuesto.qPresupuesto.Database.StartTransaction;
      fPresupuesto.qPresupuesto.edit;
      fPresupuesto.CodigoObra := fPresupuesto.qPresupuesto.fieldByName('CodigoPresupuesto').AsString;
  //    fPresupuesto.BBCartografia.Visible := False;

      if fPresupuesto.ShowModal = mrOk then
      begin
        if fPresupuesto.qPresupuesto.Database.InTransaction then fPresupuesto.qPresupuesto.Database.Commit;
        qPresupuesto.Close;
        qPresupuesto.Open;
        qPresupuesto.Locate('CodigoPresupuesto',CodigoPresupuesto,[])
      end
      else
      begin
        if fPresupuesto.qPresupuesto.Database.InTransaction
           then fPresupuesto.qPresupuesto.Database.Rollback;
      end;
    end;
  finally
    fPresupuesto.Free;
  end;
end;

procedure TFListaPresupuesto.SBBuscaElementoCartografiaClick(Sender: TObject);
begin
  inherited;
 UbicarContrato(qPresupuesto.FieldByName('CodigoPresupuesto').AsInteger,True);
end;

procedure TFListaPresupuesto.sbEditarCartografiaClick(Sender: TObject);
Var CodigoPresupuesto : String;
begin
  inherited;
  CodigoPresupuesto := qPresupuesto.fieldByName('CodigoPresupuesto').AsString;
  fPresupuesto := TfPresupuesto.Create(Application);
  fPresupuesto.BorderStyle := bsToolWindow;
  fPresupuesto.FormStyle := fsStayOnTop;
  fPresupuesto.BBCartografia.Visible := True;
  fPresupuesto.Visible := False;
  if fPresupuesto.qPresupuesto.Locate('CodigoPresupuesto',CodigoPresupuesto,[])
  then
   begin
     if not fPresupuesto.qPresupuesto.Database.InTransaction
     then fPresupuesto.qPresupuesto.Database.StartTransaction;
     fPresupuesto.qPresupuesto.edit;
     fPresupuesto.CodigoObra := fPresupuesto.qPresupuesto.fieldByName('CodigoPresupuesto').AsString;
     fPresupuesto.Show;
     Close;
   end;

end;

procedure TFListaPresupuesto.SBImprimirClick(Sender: TObject);
var i,j:integer;
begin
  try
    FQRListadoPresupuesto := TFQRListadoPresupuesto.Create(Application);
    FQRListadoPresupuesto.ListaDatos.Assign(ListaDatos);
    FQRListadoPresupuesto.ListaRotulos.Assign(ListaRotulos);
    FQRListadoPresupuesto.qPresupuesto.sql.insert(24,'AND C.CODIGOESTADOCONTRATO=1');
    j:=25;
    for i:=19 to qPresupuesto.SQL.Count-2 do
    begin
      FQRListadoPresupuesto.qPresupuesto.SQL.insert(j,qPresupuesto.SQL[i]);
      inc(j);
    end;
    FQRListadoPresupuesto.qPresupuesto.open;
    FQRListadoPresupuesto.QuickRep.Preview;
    Application.ProcessMessages;
  except
    FQRListadoPresupuesto.Free;
  end;
end;

procedure TFListaPresupuesto.SBFiltrarClick(Sender: TObject);
begin
  Filtrar;
  inherited;
end;

procedure TFListaPresupuesto.Filtrar;
begin
  Lista := GetQueryFiltroPresupuesto(ListaRotulos, ListaDatos, ListaFrom);
  If Lista <> Nil then
   begin
     qPresupuesto.Close;
     If qPresupuesto.sql.Count > 9 then LimpiarFiltro;
     qPresupuesto.SQl.Insert(8,Lista.Text);
     qPresupuesto.Open;
     if qPresupuesto.RecordCount>1 then
       lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + inttostr(qPresupuesto.RecordCount)+' Registros Encontrados >>'
     else
       lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + inttostr(qPresupuesto.RecordCount)+' Registro Encontrado >>';
   end;
end;

procedure TFListaPresupuesto.LimpiarFiltro;
var
 nLineasExtra,i: Byte;
begin
 nLineasExtra := qPresupuesto.SQL.Count-9;
 if nLineasExtra > 0 then
    for i:=1 to nLineasExtra do
     begin
      qPresupuesto.SQL.Delete(8);
     end;
end;

procedure TFListaPresupuesto.FormShow(Sender: TObject);
begin
  Filtrar;
  inherited;
end;

procedure TFListaPresupuesto.FormCreate(Sender: TObject);
begin
  dTblBase.Free;
  qPresupuesto.Open;
  qPresupuestoObra.open;
  inherited;
end;


procedure TFListaPresupuesto.sbInsertarObraClick(Sender: TObject);
var qdatos:tquery;
  codigo:integer;
  bm:TBookmark;
begin
  if qPresupuestoCODIGOPRESUPUESTO.AsString<>'' then
  begin
    try
      fPresupuestoObra := TfPresupuestoObra.Create(Application);
      fPresupuestoObra.Visible := False;
      fPresupuestoObra.FormStyle := fsNormal;
      fPresupuestoObra.qPresupuesto.Close;
      fPresupuestoObra.qPresupuesto.sql.Add('WHERE CODIGOPRESUPUESTO='+qPresupuestoCODIGOPRESUPUESTO.AsString);
      fPresupuestoObra.qPresupuesto.Open;
      fPresupuestoObra.qPresupuestoObra.close;
      fPresupuestoObra.qPresupuestoObra.Open;
      if not fPresupuestoObra.qPresupuestoObra.Database.InTransaction then
      fPresupuestoObra.qPresupuestoObra.Database.StartTransaction;
      fPresupuestoObra.qPresupuestoObra.insert;
      qDatos:=TQuery.Create(self);
      qDatos.DatabaseName:='BaseDato';
      qDatos.sql.text:='SELECT MAX(CODIGOPRESUPUESTOOBRA) FROM PRESUPUESTOOBRA';
      qDatos.open;
      codigo:=0;
      if (qdatos.recordcount>0) then codigo:=qdatos.fields[0].AsInteger;
      fPresupuestoObra.qPresupuestoObraCODIGOPRESUPUESTOOBRA.Asinteger:= codigo+1;
      qDatos.close;
      qDatos.sql.clear;
      qDatos.sql.add('SELECT MAX(CONSECUTIVO) FROM PRESUPUESTOOBRA');
      qDatos.sql.add('WHERE CODIGOPRESUPUESTO='+qPresupuestoCODIGOPRESUPUESTO.AsString);
      qdatos.open;
      codigo:=0;
      if (qdatos.recordcount>0) then codigo:=qdatos.fields[0].AsInteger;

     fPresupuestoObra.qPresupuestoObraCONSECUTIVO.Asinteger:=codigo+1;
      fPresupuestoObra.qPresupuestoObra.Post;
      fPresupuestoObra.qPresupuestoObra.edit;
      fPresupuestoObra.qPresupuesto.edit;
      fPresupuestoObra.CodigoPresupuestoObra := fPresupuestoObra.qPresupuestoObraCodigoPresupuestoObra.AsString;
  //    fPresupuestoObra.BBCartografia.Visible := False;
      //     fPresupuesto.Show;
      if fPresupuestoObra.ShowModal = mrOk then
      begin
        if fPresupuestoObra.qPresupuestoObra.Database.InTransaction then fPresupuestoObra.qPresupuestoObra.Database.Commit;
        qPresupuestoObra.Close;
        qPresupuestoObra.Open;
        qPresupuestoObra.Locate('CodigoPresupuestoObra',fPresupuestoObra.qPresupuestoObracodigopresupuestoobra.asstring,[]);
        bm:=qPresupuesto.getbookmark;
        qPresupuesto.close;
        qPresupuesto.open;
        qPresupuesto.GotoBookmark(bm);
      end
      else
      begin
        if fPresupuestoObra.qPresupuestoObra.Database.InTransaction
           then fPresupuestoObra.qPresupuestoObra.Database.Rollback;
      end;
    finally
      fPresupuestoObra.Free;
    end;
    qdatos.free;
  end;
end;

procedure TFListaPresupuesto.sbEditarObraClick(Sender: TObject);
var bm:TBookmark;
begin
  if qPresupuestoCODIGOPRESUPUESTO.AsString<>'' then
  begin
    try
      fPresupuestoObra := TfPresupuestoObra.Create(Application);
      fPresupuestoObra.Visible := False;
      fPresupuestoObra.FormStyle := fsNormal;

      fPresupuestoObra.qPresupuesto.Close;
      fPresupuestoObra.qPresupuesto.sql.Add(' WHERE CODIGOPRESUPUESTO='+qPresupuestoCODIGOPRESUPUESTO.AsString);
      fPresupuestoObra.qPresupuesto.Open;

      fPresupuestoObra.qPresupuestoObra.close;
      fPresupuestoObra.qPresupuestoObra.sql.Add(' WHERE CODIGOPRESUPUESTOOBRA ='+qPresupuestoObraCODIGOPRESUPUESTOOBRA.AsString);
      fPresupuestoObra.qPresupuestoObra.Open;
      if not fPresupuestoObra.qPresupuestoObra.Database.InTransaction then
      fPresupuestoObra.qPresupuestoObra.Database.StartTransaction;

      fPresupuestoObra.qPresupuestoObra.edit;
      fPresupuestoObra.qPresupuesto.edit;

      fPresupuestoObra.CodigoPresupuestoObra := fPresupuestoObra.qPresupuestoObraCodigoPresupuestoObra.AsString;
    //  fPresupuestoObra.BBCartografia.Visible := False;
      //     fPresupuesto.Show;
      if fPresupuestoObra.ShowModal = mrOk then
      begin
        if fPresupuestoObra.qPresupuestoObra.Database.InTransaction then fPresupuestoObra.qPresupuestoObra.Database.Commit;
        qPresupuestoObra.Close;
        qPresupuestoObra.Open;
        qPresupuestoObra.Locate('CodigoPresupuestoObra',fPresupuestoObra.qPresupuestoObracodigopresupuestoobra.asstring,[]);
        bm:=qPresupuesto.getbookmark;
        qPresupuesto.close;
        qPresupuesto.open;
        qPresupuesto.GotoBookmark(bm);
      end
      else
      begin
        if fPresupuestoObra.qPresupuestoObra.Database.InTransaction
           then fPresupuestoObra.qPresupuestoObra.Database.Rollback;
      end;
    finally
      fPresupuestoObra.Free;
    end;
  end;
end;

procedure TFListaPresupuesto.qPresupuestoObraCalcFields(DataSet: TDataSet);
begin
  inherited;
   qPresupuestoObra.FieldByName('Municipio2').AsString:=qPresupuestoObra.FieldByName('Municipio1').AsString;
   if qPresupuestoObra.FieldByName('URBANO').AsString='U' then
     qPresupuestoObra.FieldByName('UrbanoCalc').AsString:='SI';
   if qPresupuestoObra.FieldByName('URBANO').AsString='R' then
     qPresupuestoObra.FieldByName('UrbanoCalc').AsString:='NO';
end;

end.
