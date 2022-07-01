unit uReintegro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, DBCtrls, Mask,
  ExtCtrls, ComCtrls;

type
  TDataRecord = array of record
    FieldName: string;
    Value: Variant;
  end;

  TDataSetAccess = class(TDataSet);

  TfReintegro = class(TForm)
    Panel15: TPanel;
    Panel16: TPanel;
    GroupBox15: TGroupBox;
    Panel23: TPanel;
    qReintegroMaterialDetalle: TQuery;
    dsReintegroMaterialDetalle: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator2: TDBNavigator;
    UpdReintegroMaterialDetalle: TUpdateSQL;
    updReintegroMaterial: TUpdateSQL;
    dsReintegroMaterial: TDataSource;
    qReintegroMaterial: TQuery;
    dbgMateriales: TDBGrid;
    bbCancelar: TBitBtn;
    bbAceptar: TBitBtn;
    qReintegroMaterialdetalleInicial: TQuery;
    Label12: TLabel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Label13: TLabel;
    dbeAlmacen: TDBEdit;
    dblcAlmacen: TDBLookupComboBox;
    Label16: TLabel;
    dbeBodega: TDBEdit;
    dblcBodega: TDBLookupComboBox;
    dbeCIAS: TDBEdit;
    dblcCIAS: TDBLookupComboBox;
    qReintegroMaterialDetalleCODIGOREINTEGRO: TFloatField;
    qReintegroMaterialDetalleCODIGOMATERIAL: TFloatField;
    qReintegroMaterialDetalleCANTIDADNUEVAB: TFloatField;
    qReintegroMaterialDetalleCANTIDADNUEVAM: TFloatField;
    qReintegroMaterialDetalleCANTIDADDESMANB: TFloatField;
    qReintegroMaterialDetalleCANTIDADDESMANM: TFloatField;
    qReintegroMaterialDetalleNOMBREMATERIAL: TStringField;
    qReintegroMaterialCODIGOODT: TFloatField;
    qReintegroMaterialCONSECUTIVO: TFloatField;
    qReintegroMaterialCIAS_CIAS: TFloatField;
    qReintegroMaterialCOD_ALMACEN: TStringField;
    qReintegroMaterialCOD_BODEGA: TStringField;
    qReintegroMaterialCODIGOREINTEGRO: TFloatField;
    qReintegroMaterialESTADO: TStringField;
    dsBodega: TDataSource;
    qBodega: TQuery;
    qBodegaCOD_BODEGA: TStringField;
    qBodegaUPPERBODEGA_DESCRI: TStringField;
    dsAlmacen: TDataSource;
    qAlmacen: TQuery;
    qAlmacenCOD_ALMACEN: TStringField;
    qAlmacenUPPERALMACEN_DESCRI: TStringField;
    qAlmacenCIAS_CIAS: TFloatField;
    dsCIAS: TDataSource;
    qCIAS: TQuery;
    qCIASCIAS_CIAS: TFloatField;
    qCIASCIAS_DESCRI: TStringField;
    qReintegroMaterialnombrezona: TStringField;
    qReintegroMaterialdetalleInicialCODIGOREINTEGRO: TFloatField;
    qReintegroMaterialdetalleInicialCODIGOMATERIAL: TFloatField;
    qReintegroMaterialdetalleInicialCANTIDADNUEVAB: TFloatField;
    qReintegroMaterialdetalleInicialCANTIDADNUEVAM: TFloatField;
    qReintegroMaterialdetalleInicialCANTIDADDESMANB: TFloatField;
    qReintegroMaterialdetalleInicialCANTIDADDESMANM: TFloatField;
    qReintegroMaterialdetalleInicialNOMBREMATERIAL: TStringField;
    DBEdit8: TDBEdit;
    dblcbNombreZona: TDBLookupComboBox;
    qReintegroMaterialFECHAREINTEGRO: TDateTimeField;
    Label15: TLabel;
    lblItems: TLabel;
    dsMovimiento: TDataSource;
    qMovimiento: TQuery;
    qMovimientoNOMBREMOVIMIENTOPRESUPUESTO: TStringField;
    qMovimientoCODIGOMOVIMIENTOPRESUPUESTO: TStringField;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    dblcMovimiento: TDBLookupComboBox;
    qReintegroMaterialCODIGOMOVIMIENTOPRESUPUESTO: TStringField;
    //procedure RxDBGrid9EditButtonClick(Sender: TObject);
    procedure dbgMaterialesEditButtonClick(Sender: TObject);
    procedure qReintegroMaterialDetalleCODIGOMATERIALValidate(
      Sender: TField);
    procedure qReintegroMaterialDetalleBeforeEdit(DataSet: TDataSet);
    procedure qReintegroMaterialDetalleAfterScroll(DataSet: TDataSet);
    procedure qReintegroMaterialDetalleAfterPost(DataSet: TDataSet);
    procedure qReintegroMaterialAfterPost(DataSet: TDataSet);
    procedure qReintegroMaterialDetalleCANTIDADNUEVABValidate(
      Sender: TField);
    procedure qReintegroMaterialDetalleCANTIDADNUEVAMValidate(
      Sender: TField);
    procedure qReintegroMaterialDetalleCANTIDADDESMANBValidate(
      Sender: TField);
    procedure qReintegroMaterialDetalleCANTIDADDESMANMValidate(
      Sender: TField);
    procedure qCIASAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure qReintegroMaterialDetalleAfterDelete(DataSet: TDataSet);
    procedure qReintegroMaterialDetalleAfterOpen(DataSet: TDataSet);
    procedure qReintegroMaterialCOD_ALMACENSetText(Sender: TField;
      const Text: String);
    procedure qReintegroMaterialCOD_BODEGASetText(Sender: TField;
      const Text: String);
    procedure qReintegroMaterialAfterInsert(DataSet: TDataSet);
    procedure qReintegroMaterialAfterEdit(DataSet: TDataSet);
    procedure qReintegroMaterialCOD_ALMACENChange(Sender: TField);
    //procedure qTrasladoMaterialDetalleCalcFields(DataSet: TDataSet);
    //procedure qTrasladoMaterialAfterPost(DataSet: TDataSet);
    //procedure qTrasladoMaterialAfterDelete(DataSet: TDataSet);
  private
    FInitRecord, FPostRecord: TDataRecord;
    slListaMateriales: TStringlist;
    procedure LlenarListaMateriales();
    function GetDataRecord(DataSet: TDataSet): TDataRecord;

  public   
    ReintegroanteriornuevoB, ReintegroanteriornuevoM,ReintegroanteriordesmanteladoB, ReintegroanteriordesmanteladoM:DOUBLE;
    codigoReintegro: integer;
    codigoodt:double;
    consecutivo:integer;
    Estado:string;
  end;

var
  fReintegro: TfReintegro;

implementation

uses uBuscaMaterialTraslado, uOdtUrbanaRural;

{$R *.DFM}

procedure TfReintegro.LlenarListaMateriales();
begin
  try
    slListaMateriales.Clear;
    qReintegroMaterialDetalle.DisableControls;
    qReintegroMaterialDetalle.First;
    while not qReintegroMaterialDetalle.EoF do
    begin
     slListaMateriales.Add(qReintegroMaterialDetalleCODIGOMATERIAL.AsString);
     qReintegroMaterialDetalle.Next;
    end;
  finally
    qReintegroMaterialDetalle.First;
    qReintegroMaterialDetalle.EnableControls;
  end;
end;

function TfReintegro.GetDataRecord(DataSet: TDataSet): TDataRecord;
var
  I: Integer;
begin
  Result := nil;
  if Assigned(DataSet) then begin
    SetLength(Result, DataSet.FieldCount);
    for I := 0 to DataSet.FieldCount - 1 do begin
      Result[I].FieldName := DataSet.Fields[I].FieldName;
      Result[I].Value := DataSet.Fields[I].Value;
    end;
  end;
end;

procedure TfReintegro.dbgMaterialesEditButtonClick(Sender: TObject);
var
  i:Integer;
  sCodigoMaterial: string;
begin
  if ((qReintegroMaterialCIAS_CIAS.AsString = '') or (qReintegroMaterialCOD_ALMACEN.AsString = '') or (qReintegroMaterialCOD_BODEGA.AsString = '') or (dblcMovimiento.Text = '') ) then
    raise Exception.Create('Debe seleccionar la Zona, Almacén, Bodega y Movimiento del Reintegro.');

  if qReintegroMaterial.State in[dsInsert, dsEdit] then
    qReintegroMaterial.Post;

  //Aqui va codigo para agregar materiales.
  fBuscaMaterialTraslado := tfBuscaMaterialTraslado.Create(Application);
  fBuscaMaterialTraslado.qMaterialcuadrilla.ParamByName('CODIGOGRUPOTRABAJO').AsFloat:= fODTUrbanaRural.qODTHijaCODIGOGRUPOTRABAJO.AsFloat;
  fBuscaMaterialTraslado.qMaterialcuadrilla.ParamByName('CODIGOADMINISTRATIVO').AsFloat:= fODTUrbanaRural.qODTPadreCODIGOADMINISTRATIVO.AsFloat;
  fBuscaMaterialTraslado.qMaterialcuadrilla.Open;

  if fBuscaMaterialTraslado.ShowModal = mrOk then
  begin
    if fBuscaMaterialTraslado.DBGridBuscarMaterial.SelectedRows.Count>0 then
    begin
      for i:=0 to fBuscaMaterialTraslado.DBGridBuscarMaterial.SelectedRows.Count-1 do
      begin
        fBuscaMaterialTraslado.qMaterialcuadrilla.BookMark:=fBuscaMaterialTraslado.DBGridBuscarMaterial.SelectedRows.Items[i];
        sCodigoMaterial:= fBuscaMaterialTraslado.qMaterialCuadrillaCODIGOMATERIAL.AsString;

        if slListaMateriales.IndexOf(sCodigoMaterial) = -1 then
        begin
          if not (qReintegroMaterialDetalle.State in [dsInsert]) then
            qReintegroMaterialdetalle.Insert;
          qReintegroMaterialdetalleCODIGOREINTEGRO.AsInteger:= codigoReintegro;
          qReintegroMaterialdetalleCODIGOMATERIAL.AsFloat:= fBuscaMaterialTraslado.qMaterialcuadrillaCODIGOMATERIAL.asfloat;
          qReintegroMaterialdetalleNOMBREMATERIAL.AsString:= fBuscaMaterialTraslado.qMaterialcuadrillaNOMBREMATERIAL.asstring;
          qReintegroMaterialdetalle.Post;
        end
        else
          Application.MessageBox(PChar('El Material ['+sCodigoMaterial+'] ya se encuentra en la Lista.'),'EnerGis',MB_ICONERROR+MB_OK);
      end;
    end;
  end;
  fBuscaMaterialTraslado.Free;
end;


procedure TfReintegro.qReintegroMaterialDetalleCODIGOMATERIALValidate(
  Sender: TField);
var
  qConsulta: TQuery;
  sCodigoMaterial: string;
begin
  if ((qReintegroMaterialCIAS_CIAS.AsString = '') or (qReintegroMaterialCOD_ALMACEN.AsString = '') or (qReintegroMaterialCOD_BODEGA.AsString = '') or (dblcMovimiento.Text = '') ) then
    raise Exception.Create('Debe seleccionar la Zona, Almacén, Bodega y Movimiento del Reintegro.');

  if qReintegroMaterial.State in [dsInsert, dsEdit] then
    qReintegroMaterial.Post;

  qReintegroMaterialDetalle.FieldByName('CODIGOREINTEGRO').AsInteger:= CodigoReintegro;

  if Sender.Text <> '' then
  begin
    sCodigoMaterial:= Sender.Text;
    if qReintegroMaterialDetalle.State in [dsInsert, dsEdit] then
    begin
      if slListaMateriales.IndexOf(sCodigoMaterial) = -1 then
      begin
        qConsulta := TQuery.Create(nil);
        qConsulta.DatabaseName := 'BaseDato';
        qConsulta.SQL.Add('SELECT M.NOMBREMATERIAL FROM STOCKGRUPOTRABAJO S, MATERIALESSA M');
        qConsulta.SQL.Add('WHERE S.CODIGOGRUPOTRABAJO=:CODIGOGRUPOTRABAJO');
        qConsulta.SQL.Add('AND S.CODIGOADMINISTRATIVO= :CODIGOADMINISTRATIVO');
        qConsulta.SQL.Add('AND S.CODIGOMATERIAL = M.CODIGOMATERIAL');
        qConsulta.SQL.Add('AND M.CODIGOMATERIAL = :CODIGOMATERIAL');
        qConsulta.ParamByName('CODIGOGRUPOTRABAJO').AsString:= fODTUrbanaRural.qODTHijaCODIGOGRUPOTRABAJO.AsString;
        qConsulta.ParamByName('CODIGOADMINISTRATIVO').AsString:= fODTUrbanaRural.qODTPadreCODIGOADMINISTRATIVO.AsString;
        qConsulta.ParamByName('CODIGOMATERIAL').AsString:= sCodigoMaterial;
        qConsulta.Open;
        if not qConsulta.IsEmpty then
        begin
          qReintegroMaterialDetalleNOMBREMATERIAL.Clear;
          qReintegroMaterialDetalleNOMBREMATERIAL.AsString:= qConsulta.FieldByName('NOMBREMATERIAL').AsString
        end
        else
        begin
          qConsulta.Close;
          qConsulta.Free;
          raise Exception.Create('El Material ['+sCodigoMaterial+'] no está asignado al Grupo de Trabajo de la ODT Hija.');
        end;
        qConsulta.Close;
        qConsulta.Free;
      end
      else
        raise Exception.Create('El Material ['+sCodigoMaterial+'] ya se encuentra en la Lista.');
    end;
  end;
end;

procedure TfReintegro.qReintegroMaterialDetalleBeforeEdit(DataSet: TDataSet);
begin
  {Reintegroanteriornuevob:=   qReintegroMaterialDetalleCANTIDADNUEVAB.asfloat;
  Reintegroanteriornuevom:=   qReintegroMaterialDetalleCANTIDADNUEVAM.asfloat;
  Reintegroanteriordesmanteladob:=   qReintegroMaterialDetalleCANTIDADDESMANB.asfloat;
  Reintegroanteriordesmanteladom:=   qReintegroMaterialDetalleCANTIDADDESMANM.asfloat;   }
end;


procedure TfReintegro.qReintegroMaterialDetalleAfterScroll(
  DataSet: TDataSet);
begin
  {Reintegroanteriornuevob:=   qReintegroMaterialDetalleCANTIDADNUEVAB.asfloat;
  Reintegroanteriornuevom:=   qReintegroMaterialDetalleCANTIDADNUEVAM.asfloat;
  Reintegroanteriordesmanteladob:=   qReintegroMaterialDetalleCANTIDADDESMANB.asfloat;
  Reintegroanteriordesmanteladom:=   qReintegroMaterialDetalleCANTIDADDESMANM.asfloat; }
end;

procedure TfReintegro.qReintegroMaterialDetalleAfterPost(DataSet: TDataSet);
var
  bm: TBookMark;
begin
  bm:=qReintegroMaterialDetalle.GetBookmark;
  qReintegroMaterialDetalle.DisableControls;
  qReintegroMaterialDetalle.ApplyUpdates;
  qReintegroMaterialDetalle.CommitUpdates;
  LlenarListaMateriales;
  qReintegroMaterialDetalle.GotoBookmark(bm);
  qReintegroMaterialDetalle.EnableControls;
  lblItems.Caption := IntToStr(slListaMateriales.Count);
end;

procedure TfReintegro.qReintegroMaterialAfterPost(DataSet: TDataSet);
begin
  qReintegroMaterial.ApplyUpdates;
  qReintegroMaterial.CommitUpdates;
end;

procedure TfReintegro.qReintegroMaterialDetalleCANTIDADNUEVABValidate(
  Sender: TField);
var
qconsulta:Tquery;
begin
  if (qReintegroMaterialDetalleCANTIDADNUEVAB.asstring = '') then  qReintegroMaterialDetalleCANTIDADNUEVAB.asfloat:= 0;
  if qReintegroMaterialDetalleCANTIDADNUEVAB.asfloat < 0 then  raise Exception.Create('La cantidad debe ser positiva.');
  qConsulta := TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.SQL.Add('select cantidadactual from stockgrupotrabajo where codigogrupotrabajo= '+ fOdturbanarural.qodthijaCODIGOGRUPOTRABAJO.asstring );
  qConsulta.SQL.Add('and codigoadministrativo= '+fOdturbanarural.qodtpadreCODIGOADMINISTRATIVO.asstring);
  qConsulta.SQL.Add('and codigomaterial = '+qReintegroMaterialDetalleCODIGOMATERIAL.asstring);
  qConsulta.Open;
  if qReintegroMaterialDetalleCANTIDADNUEVAB.asFloat + qReintegroMaterialDetalleCANTIDADNUEVAM.asFloat > qConsulta.Fields[0].AsFloat  then
  begin
    qConsulta.Free;
    qReintegroMaterialDetalleCANTIDADNUEVAB.asFloat:= 0;
    raise Exception.Create('La cantidad disponible de este material es menor a la solicitada para Reintegrar.')
  end
  else
  begin
    if qReintegroMaterialDetalleCANTIDADDESMANB.asstring = '' then qReintegroMaterialDetalleCANTIDADDESMANB.asfloat:= 0;
    if qReintegroMaterialDetalleCANTIDADNUEVAM.asstring = '' then qReintegroMaterialDetalleCANTIDADNUEVAM.asFloat:= 0;
    if qReintegroMaterialDetalleCANTIDADDESMANM.asstring = '' then qReintegroMaterialDetalleCANTIDADDESMANM.asfloat:= 0;
    qConsulta.Free;
  end;
    //ReintegroanteriornuevoB:=   qReintegroMaterialDetalleCANTIDADNUEVAB.asfloat;
end;

procedure TfReintegro.qReintegroMaterialDetalleCANTIDADNUEVAMValidate(
  Sender: TField);
var
qconsulta:Tquery;
begin
  if (qReintegroMaterialDetalleCANTIDADNUEVAM.asstring = '') then  qReintegroMaterialDetalleCANTIDADNUEVAM.asfloat:= 0;
  if qReintegroMaterialDetalleCANTIDADNUEVAM.asfloat < 0 then  raise Exception.Create('La cantidad debe ser positiva.');
  qConsulta := TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.SQL.Add('select cantidadactual from stockgrupotrabajo where codigogrupotrabajo= '+ fOdturbanarural.qodthijaCODIGOGRUPOTRABAJO.asstring );
  qConsulta.SQL.Add('and codigoadministrativo= '+fOdturbanarural.qodtpadreCODIGOADMINISTRATIVO.asstring);
  qConsulta.SQL.Add('and codigomaterial = '+qReintegroMaterialDetalleCODIGOMATERIAL.asstring);
  qConsulta.Open;
  if qReintegroMaterialDetalleCANTIDADNUEVAM.asFloat +qReintegroMaterialDetalleCANTIDADNUEVAB.asFloat > qConsulta.Fields[0].AsFloat then
  begin
    qConsulta.Free;
    qReintegroMaterialDetalleCANTIDADNUEVAM.asFloat:= 0;
    raise Exception.Create('La cantidad disponible de este material es menor a la solicitada para Reintegrar.')
  end
  else
  begin
    if qReintegroMaterialDetalleCANTIDADDESMANB.asstring = '' then qReintegroMaterialDetalleCANTIDADDESMANB.asfloat:= 0;
    if qReintegroMaterialDetalleCANTIDADNUEVAB.asstring = '' then qReintegroMaterialDetalleCANTIDADNUEVAB.asFloat:= 0;
    if qReintegroMaterialDetalleCANTIDADDESMANM.asstring = '' then qReintegroMaterialDetalleCANTIDADDESMANM.asfloat:= 0;
    qConsulta.Free;
  end;
    //ReintegroanteriornuevoM:=   qReintegroMaterialDetalleCANTIDADNUEVAM.asfloat;
end;

procedure TfReintegro.qReintegroMaterialDetalleCANTIDADDESMANBValidate(
  Sender: TField);
var
qconsulta:Tquery;
begin
  if (qReintegroMaterialDetalleCANTIDADDESMANB.asstring = '') then  qReintegroMaterialDetalleCANTIDADDESMANB.asfloat:= 0;
  if qReintegroMaterialDetalleCANTIDADDESMANB.asfloat < 0 then  raise Exception.Create('La cantidad debe ser positiva.');
  qConsulta := TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.SQL.Add('select CANTIDADACTUALDESMANTELADABUEN from stockgrupotrabajo where codigogrupotrabajo= '+ fOdturbanarural.qodthijaCODIGOGRUPOTRABAJO.asstring );
  qConsulta.SQL.Add('and codigoadministrativo= '+fOdturbanarural.qodtpadreCODIGOADMINISTRATIVO.asstring);
  qConsulta.SQL.Add('and codigomaterial = '+qReintegroMaterialDetalleCODIGOMATERIAL.asstring);
  qConsulta.Open;
  if qReintegroMaterialDetalleCANTIDADDESMANB.asFloat  > qConsulta.Fields[0].AsFloat then
  begin
    qConsulta.Free;
    qReintegroMaterialDetalleCANTIDADDESMANB.asFloat:= 0;
    raise Exception.Create('La cantidad disponible de este material es menor a la solicitada para Reintegrar.')
  end
  else
  begin
    if qReintegroMaterialDetalleCANTIDADNUEVAM.asstring = '' then qReintegroMaterialDetalleCANTIDADNUEVAM.asfloat:= 0;
    if qReintegroMaterialDetalleCANTIDADNUEVAB.asstring = '' then qReintegroMaterialDetalleCANTIDADNUEVAB.asFloat:= 0;
    if qReintegroMaterialDetalleCANTIDADDESMANM.asstring = '' then qReintegroMaterialDetalleCANTIDADDESMANM.asfloat:= 0;
    qConsulta.Free;
  end;
    //ReintegroanteriordesmanteladoB:=   qReintegroMaterialDetalleCANTIDADDESMANB.asfloat;
end;

procedure TfReintegro.qReintegroMaterialDetalleCANTIDADDESMANMValidate(
  Sender: TField);
var
qconsulta:Tquery;
begin
  if (qReintegroMaterialDetalleCANTIDADDESMANM.asstring = '') then  qReintegroMaterialDetalleCANTIDADDESMANM.asfloat:= 0;
  if qReintegroMaterialDetalleCANTIDADDESMANM.asfloat < 0 then  raise Exception.Create('La cantidad debe ser positiva.');
  qConsulta := TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.SQL.Add('select CANTIDADACTUALDESMANTELADAMALA from stockgrupotrabajo where codigogrupotrabajo= '+ fOdturbanarural.qodthijaCODIGOGRUPOTRABAJO.asstring );
  qConsulta.SQL.Add('and codigoadministrativo= '+fOdturbanarural.qodtpadreCODIGOADMINISTRATIVO.asstring);
  qConsulta.SQL.Add('and codigomaterial = '+qReintegroMaterialDetalleCODIGOMATERIAL.asstring);
  qConsulta.Open;
  if qReintegroMaterialDetalleCANTIDADDESMANM.asFloat  > qConsulta.Fields[0].AsFloat  then
  begin
    qConsulta.Free;
    qReintegroMaterialDetalleCANTIDADDESMANM.asFloat:= 0;
    raise Exception.Create('La cantidad disponible de este material es menor a la solicitada para Reintegrar.')
  end
  else
  begin
    if qReintegroMaterialDetalleCANTIDADNUEVAM.asstring = '' then qReintegroMaterialDetalleCANTIDADNUEVAM.asfloat:= 0;
    if qReintegroMaterialDetalleCANTIDADNUEVAB.asstring = '' then qReintegroMaterialDetalleCANTIDADNUEVAB.asFloat:= 0;
    if qReintegroMaterialDetalleCANTIDADDESMANB.asstring = '' then qReintegroMaterialDetalleCANTIDADDESMANB.asfloat:= 0;
    qConsulta.Free;
  end;
    //ReintegroanteriordesmanteladoM:=   qReintegroMaterialDetalleCANTIDADDESMANM.asfloat;
end;

procedure TfReintegro.qCIASAfterOpen(DataSet: TDataSet);
begin
  qAlmacen.Close;
  qAlmacen.Open;
  qBodega.Close;
  qBodega.Open;
end;

procedure TfReintegro.FormCreate(Sender: TObject);
begin
  slListaMateriales:= TStringlist.Create;
  slListaMateriales.Sorted := True;
  qMovimiento.open;
end;

procedure TfReintegro.qReintegroMaterialDetalleAfterDelete(
  DataSet: TDataSet);
begin
  qReintegroMaterialDetalle.ApplyUpdates;
  qReintegroMaterialDetalle.CommitUpdates;
  LlenarListaMateriales;
  lblItems.Caption := IntToStr(slListaMateriales.Count);
end;

procedure TfReintegro.qReintegroMaterialDetalleAfterOpen(
  DataSet: TDataSet);
begin
  LlenarListaMateriales;
  lblItems.Caption := IntToStr(slListaMateriales.Count);
end;

procedure TfReintegro.qReintegroMaterialCOD_ALMACENSetText(Sender: TField;
  const Text: String);
begin
  if (qReintegroMaterialDetalle.RecordCount > 0) and (Sender.AsString <> Text) then
    raise Exception.Create('No puede cambiar el Almacén porque existen materiales en la Lista.');
  Sender.AsString:= Text;
end;

procedure TfReintegro.qReintegroMaterialCOD_BODEGASetText(Sender: TField;
  const Text: String);
begin
  if (qReintegroMaterialDetalle.RecordCount > 0) and (Sender.AsString <> Text) then
    raise Exception.Create('No puede cambiar la Bodega porque existen materiales en la Lista.');
  Sender.AsString:= Text;
end;

procedure TfReintegro.qReintegroMaterialAfterInsert(DataSet: TDataSet);
begin
  TDataSetAccess(qReintegroMaterial).SetModified(False);
  FInitRecord := GetDataRecord(qReintegroMaterial);
end;

procedure TfReintegro.qReintegroMaterialAfterEdit(DataSet: TDataSet);
begin
  TDataSetAccess(qReintegroMaterial).SetModified(False);
  FInitRecord := GetDataRecord(qReintegroMaterial);
end;

procedure TfReintegro.qReintegroMaterialCOD_ALMACENChange(Sender: TField);
var
  i: integer;
  sMensaje: string;
begin
  if (Sender.FieldName = 'COD_ALMACEN') then
    sMensaje:= 'el Almacén'
  else if (Sender.FieldName = 'COD_BODEGA') then
    sMensaje:= 'la Bodega';

  if qReintegroMaterial.Modified then
  begin
    FPostRecord := GetDataRecord(qReintegroMaterial);
    if qReintegroMaterialDetalle.Active then
    begin
      for i := 0 to Length(FPostRecord) - 1 do
      begin
        if (FPostRecord[i].Value <> FInitRecord[I].Value) and
           (FPostRecord[i].FieldName = Sender.FieldName) and
           (qReintegroMaterialDetalle.RecordCount > 0)
        then
        begin
          qReintegroMaterial.Cancel;
          raise Exception.Create('No puede cambiar '+sMensaje+' porque existen materiales en la Lista.');
        end;
      end;
    end;
  end;
end;

end.
