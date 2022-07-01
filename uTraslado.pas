unit uTraslado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, DBCtrls, Mask,
  ExtCtrls, ComCtrls, UtdNavigator;

type
  TDataRecord = array of record
    FieldName: string;
    Value: Variant;
  end;

  TDataSetAccess = class(TDataSet);

  TfTraslado = class(TForm)
    Panel15: TPanel;
    Panel16: TPanel;
    GroupBox15: TGroupBox;
    Label88: TLabel;
    Label96: TLabel;
    GroupBox16: TGroupBox;
    Label89: TLabel;
    Label97: TLabel;
    Panel23: TPanel;
    qTrasladoMaterialDetalle: TQuery;
    dsTrasladoMaterialDetalle: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    DBNavigator2: TDBNavigator;
    UpdTrasladoMaterialDetalle: TUpdateSQL;
    qTrasladoMaterialDetalleCODIGOTRASLADO: TFloatField;
    qTrasladoMaterialDetalleCODIGOMATERIAL: TFloatField;
    qTrasladoMaterialDetalleCANTIDAD: TFloatField;
    qAdministrativoOrigen: TQuery;
    dsAdministrativoOrigen: TDataSource;
    qAdministrativoOrigenCODIGOADMINISTRATIVO: TFloatField;
    qAdministrativoOrigenCODIGOARBOL: TStringField;
    qAdministrativoOrigenORDEN: TFloatField;
    qAdministrativoOrigenNOMBRECATEGORIA: TStringField;
    qAdministrativoOrigenNOMBREADMINISTRATIVO: TStringField;
    qAdministrativoOrigenNIVEL: TFloatField;
    qAdministrativoOrigenNORMAL: TStringField;
    qAdministrativoOrigenREFERENCIA: TStringField;
    qAdministrativoOrigenCODIGOCENTROCOSTO: TFloatField;
    qAdministrativoOrigenCODIGOAREARESPONSABILIDAD: TFloatField;
    qAdministrativoOrigenABREVIATURA: TStringField;
    qAdministrativoOrigenCODIGOZONA: TFloatField;
    qAdministrativoOrigenCODIGOVIGENCIAADMINISTRATIVO: TFloatField;
    updTrasladoMaterial: TUpdateSQL;
    dsTrasladoMaterial: TDataSource;
    qTrasladoMaterial: TQuery;
    qTrasladoMaterialCODIGOTRASLADO: TFloatField;
    qTrasladoMaterialCODIGOADMINISTRATIVOORIGEN: TFloatField;
    qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN: TFloatField;
    qTrasladoMaterialCODIGOADMINISTRATIVODESTINO: TFloatField;
    qTrasladoMaterialCODIGOGRUPOTRABAJODESTINO: TFloatField;
    qTrasladoMaterialFECHATRASLADO: TDateTimeField;
    qAdministrativoDestino: TQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    FloatField3: TFloatField;
    StringField4: TStringField;
    StringField5: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    StringField6: TStringField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    dsAdministrativoDestino: TDataSource;
    qGrupoOrigen: TQuery;
    dsGrupoOrigen: TDataSource;
    qGrupoOrigenCODIGOADMINISTRATIVO: TFloatField;
    qGrupoOrigenCODIGOGRUPOTRABAJO: TFloatField;
    qGrupoOrigenNOMBREGRUPOTRABAJO: TStringField;
    qGrupoOrigenCODIGOHORARIOTRABAJO: TFloatField;
    qGrupoOrigenCODIGOCONTRATISTA: TStringField;
    dsGrupoDestino: TDataSource;
    qGrupoDestino: TQuery;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    StringField7: TStringField;
    FloatField10: TFloatField;
    StringField8: TStringField;
    dbgMateriales: TDBGrid;
    dbeAdministrativoOrigen: TDBEdit;
    dblcbAdministrativoOrigen: TDBLookupComboBox;
    dbeGrupoOrigen: TDBEdit;
    dblcbGrupoOrigen: TDBLookupComboBox;
    dbeAdministrativoDestino: TDBEdit;
    dblcbAdministrativodestino: TDBLookupComboBox;
    dblcbGrupoDestino: TDBLookupComboBox;
    dbeGrupoDestino: TDBEdit;
    qTrasladoMaterialCODIGOODT: TFloatField;
    qTrasladoMaterialCONSECUTIVO: TFloatField;
    qTrasladoMaterialDetalleCODIGOODT: TFloatField;
    qTrasladoMaterialDetalleCONSECUTIVO: TFloatField;
    qTrasladoMaterialDetalleNOMBREMATERIAL: TStringField;
    Label1: TLabel;
    dtpFechaTraslado: TDateTimePicker;
    qTrasladoMaterialDetalleCANTIDADDESMANTELADA: TFloatField;
    bbCancelar: TBitBtn;
    bbAceptar: TBitBtn;
    qTrasladoMaterialdetalleInicial: TQuery;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    StringField9: TStringField;
    FloatField16: TFloatField;
    Label22: TLabel;
    SpeedButton1: TSpeedButton;
    dbeCIA: TDBEdit;
    Label2: TLabel;
    SpeedButton2: TSpeedButton;
    DBEdit1: TDBEdit;
    DBText1: TDBText;
    DBText2: TDBText;
    qTrasladoMaterialnombreadministrativoorigen: TStringField;
    qTrasladoMaterialnombreadministrativodestino: TStringField;
    qSerial: TQuery;
    qSerialCOD_CATALOGO: TFloatField;
    qSerialSERIAL: TStringField;
    qSerialESTADO: TStringField;
    dsSerial: TDataSource;
    usqlSerial: TUpdateSQL;
    Panel3: TPanel;
    dbgSerial: TRxDBGrid;
    dbnSerial: TdNavigator;
    qSerialCODIGOTRASLADO: TFloatField;
    qAlmSerial: TQuery;
    qAlmSerialCODIGOMATERIAL: TFloatField;
    qAlmSerialSERIAL: TStringField;
    qAlmSerialCIAS_CIAS: TFloatField;
    qAlmSerialCOD_ALMACEN: TStringField;
    qAlmSerialCOD_BODEGA: TStringField;
    qAlmSerialCODIGOADMINISTRATIVO: TFloatField;
    qAlmSerialCODIGOGRUPOTRABAJO: TFloatField;
    qAlmSerialCODIGOCOMPRA: TFloatField;
    qAlmSerialCODIGOTIPOELEMENTO: TStringField;
    qAlmSerialCODIGOAPOYO: TFloatField;
    qAlmSerialCODIGOELEMENTO: TFloatField;
    qAlmSerialACTIVO: TStringField;
    qAlmSerialCODIGOSERIALTERCERO: TFloatField;
    qAlmSerialESTADO: TStringField;
    qAlmSerialCODIGOEMPLEADO: TFloatField;
    qAlmSerialCODIGOESTADOSERIAL: TFloatField;
    UpdAlmSerial: TUpdateSQL;
    Label15: TLabel;
    lblItems: TLabel;
    Splitter1: TSplitter;
    Label3: TLabel;
    DBMemoObservacion: TDBMemo;
    qTrasladoMaterialOBSERVACION: TMemoField;
    //procedure RxDBGrid9EditButtonClick(Sender: TObject);
    procedure dbgMaterialesEditButtonClick(Sender: TObject);
    procedure qTrasladoMaterialDetalleCANTIDADValidate(Sender: TField);
    procedure qTrasladoMaterialDetalleCANTIDADDESMANTELADAValidate(
      Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure qTrasladoMaterialDetalleCODIGOMATERIALValidate(
      Sender: TField);
    procedure qTrasladoMaterialDetalleBeforeEdit(DataSet: TDataSet);
    procedure qTrasladoMaterialCODIGOGRUPOTRABAJOORIGENValidate(
      Sender: TField);
    procedure qTrasladoMaterialCODIGOGRUPOTRABAJODESTINOValidate(
      Sender: TField);
    procedure qTrasladoMaterialDetalleAfterScroll(DataSet: TDataSet);
    procedure qTrasladoMaterialDetalleAfterPost(DataSet: TDataSet);
    procedure qTrasladoMaterialAfterPost(DataSet: TDataSet);
    procedure dbgSerialEditButtonClick(Sender: TObject);
    procedure qSerialAfterPost(DataSet: TDataSet);
    procedure bbCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qAlmSerialAfterPost(DataSet: TDataSet);
    procedure qSerialBeforeDelete(DataSet: TDataSet);
    procedure bbAceptarClick(Sender: TObject);
    procedure qTrasladoMaterialDetalleBeforeDelete(DataSet: TDataSet);
    procedure qSerialAfterDelete(DataSet: TDataSet);
    procedure qTrasladoMaterialAfterDelete(DataSet: TDataSet);
    procedure qTrasladoMaterialDetalleAfterDelete(DataSet: TDataSet);
    procedure qTrasladoMaterialDetalleBeforePost(DataSet: TDataSet);
    procedure qTrasladoMaterialDetalleAfterOpen(DataSet: TDataSet);
    procedure qTrasladoMaterialBeforePost(DataSet: TDataSet);
    procedure qTrasladoMaterialCODIGOGRUPOTRABAJOORIGENSetText(
      Sender: TField; const Text: String);
    procedure qTrasladoMaterialAfterInsert(DataSet: TDataSet);
    procedure qTrasladoMaterialAfterEdit(DataSet: TDataSet);
    procedure qTrasladoMaterialCODIGOGRUPOTRABAJOORIGENChange(
      Sender: TField);
    procedure qTrasladoMaterialCODIGOADMINISTRATIVOORIGENSetText(
      Sender: TField; const Text: String);
    //procedure qTrasladoMaterialDetalleCalcFields(DataSet: TDataSet);
    //procedure qTrasladoMaterialAfterPost(DataSet: TDataSet);
    //procedure qTrasladoMaterialAfterDelete(DataSet: TDataSet);
  private
    FInitRecord, FPostRecord: TDataRecord;
    slListaMateriales: TStringlist;
    procedure LlenarListaMateriales();
    function GetDataRecord(DataSet: TDataSet): TDataRecord;

  public
    Trasladoanteriornuevo, Trasladoanteriordesmantelado:DOUBLE;
    codigotraslado,codigotrasladoCreacion: integer;
    codigoodt:double;
    consecutivo:integer;
    Function Serializado:boolean;
  end;

var
  fTraslado: TfTraslado;

implementation

uses uBuscaMaterialTraslado, uOdturbanarural, uBuscarSerialMaterial;

{$R *.DFM}

procedure TfTraslado.LlenarListaMateriales();
begin
  try
    slListaMateriales.Clear;
    qTrasladoMaterialDetalle.DisableControls;
    qTrasladoMaterialDetalle.First;
    while not qTrasladoMaterialDetalle.EoF do
    begin
     slListaMateriales.Add(qTrasladoMaterialDetalleCODIGOMATERIAL.AsString);
     qTrasladoMaterialDetalle.Next;
    end;
  finally
    qTrasladoMaterialDetalle.First;
    qTrasladoMaterialDetalle.EnableControls;
  end;
end;

function TfTraslado.GetDataRecord(DataSet: TDataSet): TDataRecord;
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

procedure TfTraslado.dbgMaterialesEditButtonClick(Sender: TObject);
var
  i:Integer;
  sCodigoMaterial: string;
begin
  if qTrasladoMaterial.State in [dsInsert, dsEdit] then
    qTrasladoMaterial.Post;

  //Aqui va codigo para agregar materiales.
  fBuscaMaterialTraslado := tfBuscaMaterialTraslado.Create(Application);
  fBuscaMaterialTraslado.qMaterialcuadrilla.ParamByName('CODIGOGRUPOTRABAJO').AsFloat:= qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsFloat;
  fBuscaMaterialTraslado.qMaterialcuadrilla.ParamByName('CODIGOADMINISTRATIVO').AsFloat:= qTrasladoMaterialCODIGOADMINISTRATIVOORIGEN.AsFloat;
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
          if not (qTrasladoMaterialDetalle.State in [dsInsert]) then
            qTrasladoMaterialdetalle.Insert;
          qTrasladoMaterialDetalleCODIGOTRASLADO.asinteger:= codigotraslado;
          qTrasladoMaterialdetalleCODIGOMATERIAL.asFloat:= fBuscaMaterialTraslado.qMaterialcuadrillaCODIGOMATERIAL.asfloat;
          qTrasladoMaterialDetalleNOMBREMATERIAL.asstring:= fBuscaMaterialTraslado.qMaterialcuadrillaNOMBREMATERIAL.asstring;
          qTrasladoMaterialDetalleCODIGOODT.asfloat:= CODIGOODT;
          qTrasladoMaterialDetalleconsecutivo.asinteger:= Consecutivo;
          qTrasladoMaterialdetalle.Post;
        end
        else
          Application.MessageBox(PChar('El Material ['+sCodigoMaterial+'] ya se encuentra en la Lista.'),'EnerGis',MB_ICONERROR+MB_OK);
        //German 20160211
        qSerial.Close;
        qSerial.Open;
      end;
    end;
  end;
  fBuscaMaterialTraslado.Free;
end;

procedure TfTraslado.qTrasladoMaterialDetalleCANTIDADValidate(
  Sender: TField);
var
  qConsulta:TQuery;
begin
  if (qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsString = '') then
   raise Exception.Create('Debe seleccionar el Grupo de Trabajo Origen');

  if (qTrasladoMaterialDetalleCANTIDAD.AsString = '') then
    qTrasladoMaterialDetalleCANTIDAD.AsFloat:= 0;

  if qTrasladoMaterialDetalleCANTIDAD.AsFloat < 0 then
    raise Exception.Create('La cantidad debe ser positiva.');

  qConsulta := TQuery.Create(nil);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.SQL.Add('SELECT CANTIDADACTUAL FROM STOCKGRUPOTRABAJO');
  qConsulta.SQL.Add('WHERE CODIGOGRUPOTRABAJO= '+ qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsString);
  qConsulta.SQL.Add('AND CODIGOADMINISTRATIVO= '+qTrasladoMaterialCODIGOADMINISTRATIVOORIGEN.AsString);
  qConsulta.SQL.Add('AND CODIGOMATERIAL = '+qTrasladoMaterialDetalleCODIGOMATERIAL.AsString);
  qConsulta.Open;

  if qTrasladoMaterialDetalleCANTIDAD.asFloat > qConsulta.Fields[0].AsFloat + Trasladoanteriornuevo then
  begin
    qConsulta.Close;
    qConsulta.Free;
    raise Exception.Create('La cantidad disponible de este material es menor a la solicitada para trasladar.')
  end
  else
  begin
    if qTrasladoMaterialDetalleCANTIDADdesmantelada.AsString = '' then
      qTrasladoMaterialDetalleCANTIDADdesmantelada.AsFloat:= 0;
    qConsulta.Close;
    qConsulta.Free;
  end;
end;


procedure TfTraslado.qTrasladoMaterialDetalleCANTIDADDESMANTELADAValidate(
  Sender: TField);
var
  qConsulta:TQuery;
begin
  if (qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsString = '') then
    raise Exception.Create('Debe seleccionar el Grupo de Trabajo Origen');

  if (qTrasladoMaterialDetalleCANTIDADDESMANTELADA.AsString = '') then
    qTrasladoMaterialDetalleCANTIDADDESMANTELADA.asfloat:= 0;

  if qTrasladoMaterialDetalleCANTIDADDESMANTELADA.AsFloat < 0 then
    raise Exception.Create('La cantidad debe ser positiva.');

  qConsulta := TQuery.Create(nil);

  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.SQL.Add('SELECT CANTIDADACTUALDESMANTELADABUEN FROM STOCKGRUPOTRABAJO');
  qConsulta.SQL.Add('WHERE CODIGOGRUPOTRABAJO= '+ qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsString);
  qConsulta.SQL.Add('AND CODIGOADMINISTRATIVO= '+qTrasladoMaterialCODIGOADMINISTRATIVOORIGEN.AsString);
  qConsulta.SQL.Add('AND CODIGOMATERIAL = '+qTrasladoMaterialDetalleCODIGOMATERIAL.AsString);
  qConsulta.Open;

  if qTrasladoMaterialDetalleCANTIDADDESMANTELADA.asFloat > qConsulta.Fields[0].AsFloat + Trasladoanteriordesmantelado then
  begin
    qConsulta.Close;
    qConsulta.Free;
    raise Exception.Create('La cantidad disponible de este material desmantelado es menor a la solicitada para trasladar.')
  end
  else
  begin
    if qTrasladoMaterialDetalleCANTIDAD.AsString = '' then
      qTrasladoMaterialDetalleCANTIDAD.AsFloat:= 0;
    qConsulta.Close;
    qConsulta.Free;
  end;
end;

procedure TfTraslado.FormShow(Sender: TObject);
begin
  dtpFechaTraslado.datetime:= now;
end;

procedure TfTraslado.qTrasladoMaterialDetalleCODIGOMATERIALValidate(
  Sender: TField);
var
  qconsulta: TQuery;
  sCodigoMaterial: string;
begin
  if (qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsString='') then
    raise Exception.Create('Debe seleccionar el Grupo de Trabajo Origen');

  if qTrasladoMaterial.State in [dsInsert, dsEdit] then
    qTrasladoMaterial.Post;

  qTrasladoMaterialDetalle.FieldByName('CODIGOTRASLADO').AsInteger:= codigotraslado;
  qTrasladoMaterialDetalle.FieldByName('CODIGOODT').AsFloat:= CODIGOODT;
  qTrasladoMaterialDetalle.FieldByName('CONSECUTIVO').AsInteger:= Consecutivo;

  if Sender.Text <> '' then
  begin
    sCodigoMaterial:= Sender.Text;
    if qTrasladoMaterialDetalle.State in [dsInsert, dsEdit] then
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
        qConsulta.ParamByName('CODIGOGRUPOTRABAJO').AsFloat:= qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsFloat;
        qConsulta.ParamByName('CODIGOADMINISTRATIVO').AsFloat:= qTrasladoMaterialCODIGOADMINISTRATIVOORIGEN.AsFloat;
        qConsulta.ParamByName('CODIGOMATERIAL').AsString:= sCodigoMaterial;
        qConsulta.Open;
        if not qConsulta.IsEmpty then
        begin
          qTrasladoMaterialDetalleNOMBREMATERIAL.Clear;
          qTrasladoMaterialDetalleNOMBREMATERIAL.AsString:= qConsulta.FieldByName('NOMBREMATERIAL').AsString
        end
        else
        begin
          qConsulta.Close;
          qConsulta.Free;
          raise Exception.Create('El Material ['+sCodigoMaterial+'] no esta asignado al Grupo de Trabajo Origen.');
        end;
        qConsulta.Close;
        qConsulta.Free;
      end
      else
        raise Exception.Create('El Material ['+sCodigoMaterial+'] ya se encuentra en la Lista.');
    end;
  end;
end;

procedure TfTraslado.qTrasladoMaterialDetalleBeforeEdit(DataSet: TDataSet);
begin
  Trasladoanteriornuevo:= qTrasladoMaterialDetalleCANTIDAD.AsFloat;
  Trasladoanteriordesmantelado:= qTrasladoMaterialDetalleCANTIDADDESMANTELADA.AsFloat;
end;


procedure TfTraslado.qTrasladoMaterialCODIGOGRUPOTRABAJOORIGENValidate(
  Sender: TField);
begin
  if qTrasladoMaterialCODIGOGRUPOTRABAJODESTINO.AsString <> '' then
  begin
    if qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsString = qTrasladoMaterialCODIGOGRUPOTRABAJODESTINO.AsString then
      raise Exception.Create('El Grupo de Trabajo Origen no puede ser igual al Grupo de Trabajo Destino');

    if ((qTrasladoMaterialCODIGOGRUPOTRABAJODESTINO.asstring <> fOdturbanarural.qODTHijaCODIGOGRUPOTRABAJO.asstring)
         and  (qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.asstring <> fOdturbanarural.qODTHijaCODIGOGRUPOTRABAJO.asstring)) then
    raise Exception.Create('El Grupo de Trabajo Origen o Destino debe ser el Grupo de Trabajo de la ODT Hija.');
  end;
end;

procedure TfTraslado.qTrasladoMaterialCODIGOGRUPOTRABAJODESTINOValidate(
  Sender: TField);
begin
  if qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.asstring <> '' then
  begin
    if qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsString = qTrasladoMaterialCODIGOGRUPOTRABAJODESTINO.AsString then
        raise Exception.Create('El Grupo de Trabajo Destino no puede ser igual al Grupo de Trabajo Origen');

    if ((qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.asstring <> fOdturbanarural.qODTHijaCODIGOGRUPOTRABAJO.asstring)
         and  (qTrasladoMaterialCODIGOGRUPOTRABAJODESTINO.asstring <> fOdturbanarural.qODTHijaCODIGOGRUPOTRABAJO.asstring)) then
    raise Exception.Create('El Grupo de Trabajo Origen o Destino debe ser el Grupo de Trabajo de la ODT Hija.');
  end;
end;

procedure TfTraslado.qTrasladoMaterialDetalleAfterScroll(
  DataSet: TDataSet);
begin
  Trasladoanteriornuevo:= qTrasladoMaterialDetalleCANTIDAD.AsFloat;
  Trasladoanteriordesmantelado:= qTrasladoMaterialDetalleCANTIDADDESMANTELADA.AsFloat;
end;

procedure TfTraslado.qTrasladoMaterialDetalleAfterPost(DataSet: TDataSet);
var
  bm: TBookMark;
begin
  bm:=qTrasladoMaterialDetalle.GetBookmark;
  qTrasladoMaterialDetalle.DisableControls;
  qTrasladoMaterialDetalle.ApplyUpdates;
  qTrasladoMaterialDetalle.CommitUpdates;
  LlenarListaMateriales;
  qTrasladoMaterialDetalle.GotoBookmark(bm);
  qTrasladoMaterialDetalle.EnableControls;
  lblItems.Caption := IntToStr(slListaMateriales.Count);
end;

procedure TfTraslado.qTrasladoMaterialAfterPost(DataSet: TDataSet);
begin
  qTrasladoMaterial.ApplyUpdates;
  qTrasladoMaterial.CommitUpdates;
end;

//c8310 20160218
procedure TfTraslado.dbgSerialEditButtonClick(Sender: TObject);
var
i,Materiales,SerialesSeleccionados,SerialesqSerial:integer;
//CodigosMateriales: TStringList;
begin
 (* if ((qTrasladoMaterialCIAS_CIAS.asstring = '') or (qTrasladoMaterialCOD_ALMACEN.asstring = '') or (qTrasladoMaterialCOD_BODEGA.asstring = '')) then
    raise Exception.Create('Debe seleccionar el area, almacen y bodega del Traslado.');*)
  if qTrasladoMaterial.State in[dsInsert] then
    qTrasladoMaterial.post;
  //Pasar parámetros de busqueda a formulario fBuscarSerialMaterial
  fBuscarSerialMaterial := tfBuscarSerialMaterial.Create(Application);
  //  fBuscarSerialMaterial.qSerialcuadrilla.ParamByName('codigoGrupoTrabajo').asfloat:= fOdturbanarural.qodthijacodigogrupotrabajo.AsFloat; //Grupo de trabajo ODT Destino
  //  fBuscarSerialMaterial.qSerialcuadrilla.ParamByName('codigoAdministrativo').asfloat:= fOdturbanarural.qodtpadreCODIGOADMINISTRATIVO.asfloat; //codigo Adminsitrativo ODT Destino
  fBuscarSerialMaterial.qSerialcuadrilla.ParamByName('codigoGrupoTrabajo').asfloat:= qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsFloat; //Código ODT Origen
  fBuscarSerialMaterial.qSerialcuadrilla.ParamByName('codigoAdministrativo').asfloat:= qTrasladoMaterialCODIGOADMINISTRATIVOORIGEN.AsFloat;
  fBuscarSerialMaterial.qSerialcuadrilla.ParamByName('codigoMaterial').asfloat:= qTrasladoMaterialdetalleCODIGOMATERIAL.AsFloat;
  fBuscarSerialMaterial.qSerialcuadrilla.open;

  //Validaciones iniciales.
  //Seriales en el query qSerial
  SerialesqSerial:=qSerial.RecordCount;
  //Materiales Traslado
  Materiales:=qTrasladoMaterialDetalleCANTIDAD.AsInteger+qTrasladoMaterialDetalleCANTIDADDESMANTELADA.AsInteger;

  if(Materiales<=0) then raise Exception.Create('Por favor primero indique la cantidad de materiales');
  if(SerialesqSerial<Materiales) then
  begin
  if fBuscarSerialMaterial.ShowModal = mrOk then
  begin
    if fBuscarSerialMaterial.DBGridBuscarSerial.SelectedRows.Count>0 then
    begin
   //Registrar seriales en ALM_SerialMaterial
    qAlmSerial.Close;
    qAlmSerial.Open;

      //Seriales Seleccionados
      SerialesSeleccionados:=fBuscarSerialMaterial.DBGridBuscarSerial.SelectedRows.Count+SerialesqSerial;

     if(SerialesSeleccionados=Materiales) then
     begin
       for i:=0 to fBuscarSerialMaterial.DBGridBuscarSerial.SelectedRows.Count-1 do
       begin
          fBuscarSerialMaterial.qSerialcuadrilla.BookMark:=fBuscarSerialMaterial.DBGridBuscarSerial.SelectedRows.Items[i];
          //Registro de movimiento en COM_TRASLADOSERIAL
          qSerial.insert;
          qSerialCODIGOTRASLADO.AsFloat:=codigotraslado;
          qSerialCOD_CATALOGO.AsFloat:=qTrasladoMaterialdetalleCODIGOMATERIAL.AsFloat;
          qSerialSERIAL.AsString:=fBuscarSerialMaterial.qSerialCuadrillaSERIAL.AsString;
          qSerial.post;
          //Registro de moviemento en ALM_SERIALMATERIAL del destino
          qAlmSerial.Edit;
          qAlmSerialCODIGOMATERIAL.AsFloat:=qTrasladoMaterialdetalleCODIGOMATERIAL.AsFloat;
          qAlmSerialSERIAL.AsString:=fBuscarSerialMaterial.qSerialCuadrillaSERIAL.AsString;
          qAlmSerialCODIGOADMINISTRATIVO.AsFloat:=qTrasladoMaterialCODIGOADMINISTRATIVODESTINO.AsFloat;
          qAlmSerialCODIGOGRUPOTRABAJO.AsFloat:=qTrasladoMaterialCODIGOGRUPOTRABAJODESTINO.AsFloat;
          //qAlmSerialCODIGOADMINISTRATIVO.AsFloat:=qTrasladoMaterialCODIGOADMINISTRATIVOORIGEN.AsFloat;
          //qAlmSerialCODIGOGRUPOTRABAJO.AsFloat:=qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsFloat;
          qAlmSerial.Post;
       end;
     end
     else showmessage('La cantidad de seriales seleccionados es diferente a la cantidad de materiales indicados');
    end;
  end;
  fBuscarSerialMaterial.free;
  end else showmessage('Hay más seriales que cantidad de materiales');
end;

procedure TfTraslado.qSerialAfterPost(DataSet: TDataSet);
begin
  qSerial.ApplyUpdates;
  qSerial.CommitUpdates;
end;

//German C8310 20160215
procedure TfTraslado.bbCancelarClick(Sender: TObject);
var
 i,j:integer;
 qConsulta:TQuery;
begin
      (*
      qTrasladoMaterialDetalle.First;
      for i:=0 to qTrasladoMaterialDetalle.RecordCount-1 do
      begin
       //revertir cambios en tabla Alm_SerialMaterial
       qSerial.First;
       for j:=0 to qSerial.RecordCount-1 do
           begin
           qAlmSerial.Close;
           qAlmSerial.Open;
           qAlmSerial.Edit;
           qAlmSerialCODIGOMATERIAL.AsFloat:=qTrasladoMaterialdetalleCODIGOMATERIAL.AsFloat;
           qAlmSerialSERIAL.AsString:=qSerialSERIAL.AsString;
           qAlmSerialCODIGOADMINISTRATIVO.AsFloat:=qTrasladoMaterialCODIGOADMINISTRATIVOORIGEN.AsFloat;
           qAlmSerialCODIGOGRUPOTRABAJO.AsFloat:=qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsFloat;
           qAlmSerial.Post;
           qSerial.Next;
           end;
      qTrasladoMaterialDetalle.Next;
      end;

      //Eliminar cambios en COM_TRASLADOSERIAL
      if (not qSerial.IsEmpty) then
      begin
      qConsulta := TQuery.Create(Application);
      qConsulta.DatabaseName := 'BaseDato';
      qConsulta.SQL.Add('delete from COM_trasladoSerial where CODIGOTRASLADO = ' + qTrasladoMaterialDetalleCODIGOTRASLADO.AsString);
      qConsulta.execsql;
      qConsulta.Free;
      end;

      //Eliminar cambios en TRASLADOMATERIALDETALLE
      if (not qTrasladoMaterialDetalle.IsEmpty) then
      begin
      qConsulta := TQuery.Create(Application);
      qConsulta.DatabaseName := 'BaseDato';
      qConsulta.SQL.Add('delete from TRASLADOMATERIALDETALLE where CODIGOTRASLADO = ' + qTrasladoMaterialCODIGOTRASLADO.AsString);
      qConsulta.execsql;
      qConsulta.Free;

      qSerial.ApplyUpdates;
      qSerial.CommitUpdates;

      qTrasladoMaterialDetalle.ApplyUpdates;
      qTrasladoMaterialDetalle.CommitUpdates;
      end;

     // fOdturbanarural.qTraslados.Cancel;
     (* qTrasladoMaterial.Edit;
      qTrasladoMaterial.
      qTrasladoMaterial.Delete;
      qTrasladoMaterial.Post;
      *)

      (*
      qTrasladoMaterialDetalle.Edit;
      qTrasladoMaterialDetalle.Delete;
      qTrasladoMaterialDetalle.Post;
      *)
      //if qTrasladoMaterialDetalle.IsEmpty then fOdturbanarural.qTraslados.Delete;


      // c8310 German 20160220
      if qAlmSerial.State in [dsInsert, dsEdit] then
      begin
         qAlmSerial.ApplyUpdates;
         qAlmSerial.CommitUpdates;
      end;

      if qSerial.State in [dsInsert, dsEdit] then
      begin
         qSerial.ApplyUpdates;
         qSerial.CommitUpdates;
      end;
      
 ModalResult:=mrCancel;
end;

procedure TfTraslado.FormCreate(Sender: TObject);
begin
  slListaMateriales:= TStringlist.Create;
  slListaMateriales.Sorted := True;
  //German C8310 20160215
  qSerial.Close;
  qSerial.Open;
end;

//German C8310 20160216
procedure TfTraslado.qAlmSerialAfterPost(DataSet: TDataSet);
begin
   qAlmSerial.ApplyUpdates;
   qAlmSerial.CommitUpdates;
end;

//German C8310 20160217
procedure TfTraslado.qSerialBeforeDelete(DataSet: TDataSet);
begin
     //Cancelar movimiento de moviemento en ALM_SERIALMATERIAL del destino
     qAlmSerial.Close;
     qAlmSerial.Open;
     qAlmSerial.Edit;
     qAlmSerialCODIGOMATERIAL.AsFloat:=qTrasladoMaterialdetalleCODIGOMATERIAL.AsFloat;
     qAlmSerialSERIAL.AsString:=qSerialSERIAL.AsString;
     qAlmSerialCODIGOADMINISTRATIVO.AsFloat:=qTrasladoMaterialCODIGOADMINISTRATIVOORIGEN.AsFloat;
     qAlmSerialCODIGOGRUPOTRABAJO.AsFloat:=qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsFloat;
     qAlmSerial.Post;
end;

//German C8310 20160217 
procedure TfTraslado.bbAceptarClick(Sender: TObject);
var
   i,Materiales,SerialesqSerial:integer;
begin
  qTrasladoMaterialDetalle.First;
  for i:=0 to qTrasladoMaterialDetalle.RecordCount-1 do
  begin
    if (serializado) then
    begin
      //Seriales en el query qSerial
      SerialesqSerial:=qSerial.RecordCount;
      //Seriales trasladados
      Materiales:=qTrasladoMaterialDetalleCANTIDAD.AsInteger+qTrasladoMaterialDetalleCANTIDADDESMANTELADA.AsInteger;
      if (SerialesqSerial<>Materiales) then
        raise Exception.Create('El número de  materiales ('+IntToStr(Materiales)+ ') difiere al número de seriales ('+IntToStr(SerialesqSerial)+').');
    end;
    qTrasladoMaterialDetalle.Next;
  end;

  if (Application.MessageBox('El traslado se registrará. ¿Está seguro de continuar?',
                                 PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO+MB_DEFBUTTON2)=idNo) then
  begin
    ModalResult:=0;
    Exit;
  end;

  // cc 9255 jorge rueda
  if qTrasladoMaterial.State in [dsEdit] then
    qTrasladoMaterial.Post;

  // c8310 German 20160220
  if qAlmSerial.State in [dsInsert, dsEdit] then
  begin
     qAlmSerial.ApplyUpdates;
     qAlmSerial.CommitUpdates;
  end;

  if qSerial.State in [dsInsert, dsEdit] then
  begin
     qSerial.ApplyUpdates;
     qSerial.CommitUpdates;
  end;
  ModalResult:=mrOK;
end;

//cc8310 - German - 20160220
procedure TfTraslado.qTrasladoMaterialDetalleBeforeDelete(
  DataSet: TDataSet);
  var
  qconsulta:tquery;
  i:integer;
begin

          //cc8310 - German - 20160218
          //Deshacer Registro de moviemento en ALM_SERIALMATERIAL del destino
          qSerial.First;
          for i:=0 to qSerial.RecordCount-1 do
          Begin
          qAlmSerial.Edit;
          qAlmSerialCODIGOMATERIAL.AsFloat:=qTrasladoMaterialdetalleCODIGOMATERIAL.AsFloat;
          qAlmSerialSERIAL.AsString:=qSerialSERIAL.AsString;
          //qAlmSerialCODIGOADMINISTRATIVO.AsFloat:=qTrasladoMaterialCODIGOADMINISTRATIVODESTINO.AsFloat;
          //qAlmSerialCODIGOGRUPOTRABAJO.AsFloat:=qTrasladoMaterialCODIGOGRUPOTRABAJODESTINO.AsFloat;
          qAlmSerialCODIGOADMINISTRATIVO.AsFloat:=qTrasladoMaterialCODIGOADMINISTRATIVOORIGEN.AsFloat;
          qAlmSerialCODIGOGRUPOTRABAJO.AsFloat:=qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsFloat;
          qAlmSerial.Post;
          qSerial.Next;
          end;

      //cc8310 - German - 20160218
      //Eliminar cada uno de los seriales registrados en COM_TRASLADOSerial
      qConsulta := TQuery.Create(Application);
      qConsulta.DatabaseName := 'BaseDato';
      qConsulta.SQL.Add('delete from COM_trasladoSerial where CODIGOTRASLADO = ' + qTrasladoMaterialDetalleCODIGOTRASLADO.AsString);
      qConsulta.SQL.Add('and cod_catalogo= ' + qTrasladoMaterialDetalleCODIGOMATERIAL.AsString);
      qConsulta.execsql;
      qConsulta.Free;

      //c8310 German 20160220
      if qAlmSerial.State in [dsInsert, dsEdit] then
      begin
      qAlmSerial.ApplyUpdates;
      qAlmSerial.CommitUpdates;
      end;

end;

//cc8310 - German - 20160222
procedure TfTraslado.qSerialAfterDelete(DataSet: TDataSet);
begin
   if qSerial.UpdatesPending then
   begin
   qSerial.ApplyUpdates;
   qSerial.CommitUpdates;
   end;

   if qAlmSerial.UpdatesPending then
   begin
   qAlmSerial.ApplyUpdates;
   qAlmSerial.CommitUpdates;
   end;
end;

//cc8310 - German - 20160222
procedure TfTraslado.qTrasladoMaterialAfterDelete(DataSet: TDataSet);
begin
(*
  if qTrasladoMaterial
  qTrasladoMaterial.ApplyUpdates;
  qTrasladoMaterial.CommitUpdates; *)
end;

//cc8310- German - 20160223
function TfTraslado.Serializado: boolean;
var
  sql:string;
  qry:tquery;
begin
  Result:=False;
  sql:='Select * from materialessa where codigomaterial='+qTrasladoMaterialDetalleCODIGOMATERIAL.AsString+
        ' and serializable=''S''';
  qry:=Tquery.Create(Application);
  qry.DatabaseName:='BaseDato';
  qry.sql.text:=sql;
  qry.open;

  if not qry.IsEmpty then
    Result:=True;

  qry.close;
  qry.free;
end;

procedure TfTraslado.qTrasladoMaterialDetalleAfterDelete(
  DataSet: TDataSet);
begin
  qTrasladoMaterialDetalle.ApplyUpdates;
  qTrasladoMaterialDetalle.CommitUpdates;
  LlenarListaMateriales;
  lblItems.Caption := IntToStr(slListaMateriales.Count);
end;

procedure TfTraslado.qTrasladoMaterialDetalleAfterOpen(DataSet: TDataSet);
begin
  LlenarListaMateriales;
  lblItems.Caption := IntToStr(slListaMateriales.Count);
end;

procedure TfTraslado.qTrasladoMaterialDetalleBeforePost(DataSet: TDataSet);
begin
  if (qTrasladoMaterialDetalleCODIGOMATERIAL.AsString='') then
    raise Exception.Create('Debe ingresar el Material');
end;

procedure TfTraslado.qTrasladoMaterialBeforePost(DataSet: TDataSet);
begin
  if (qTrasladoMaterialCODIGOGRUPOTRABAJOORIGEN.AsString='') then
    raise Exception.Create('Debe seleccionar el Grupo de Trabajo Origen');
    
  if qTrasladoMaterial.State in [dsInsert, dsEdit] then
    qTrasladoMaterialFECHATRASLADO.AsDateTime:= Now;
end;

procedure TfTraslado.qTrasladoMaterialCODIGOGRUPOTRABAJOORIGENSetText(
  Sender: TField; const Text: String);
begin
  if (qTrasladoMaterialDetalle.RecordCount > 0) and (Sender.AsString <> Text) then
    raise Exception.Create('No puede cambiar el Grupo de Trabajo porque existen materiales en la Lista.');
  Sender.AsString:= Text;
end;

procedure TfTraslado.qTrasladoMaterialAfterInsert(DataSet: TDataSet);
begin
  TDataSetAccess(qTrasladoMaterial).SetModified(False);
  FInitRecord := GetDataRecord(qTrasladoMaterial);
end;

procedure TfTraslado.qTrasladoMaterialAfterEdit(DataSet: TDataSet);
begin
  TDataSetAccess(qTrasladoMaterial).SetModified(False);
  FInitRecord := GetDataRecord(qTrasladoMaterial);
end;

procedure TfTraslado.qTrasladoMaterialCODIGOGRUPOTRABAJOORIGENChange(
  Sender: TField);
var
  i: integer;
  sMensaje: string;
begin
  if (Sender.FieldName = 'CODIGOGRUPOTRABAJOORIGEN') or (Sender.FieldName = 'CODIGOGRUPOTRABAJODESTINO') then
    sMensaje:= 'el Grupo de Trabajo'
  else if (Sender.FieldName = 'CODIGOADMINISTRATIVOORIGEN') or (Sender.FieldName = 'CODIGOADMINISTRATIVODESTINO') then
    sMensaje:= 'la CIA';

  if qTrasladoMaterial.Modified then
  begin
    FPostRecord := GetDataRecord(qTrasladoMaterial);
    if qTrasladoMaterialDetalle.Active then
    begin
      for i := 0 to Length(FPostRecord) - 1 do
      begin
        if (FPostRecord[i].Value <> FInitRecord[I].Value) and
           (FPostRecord[i].FieldName = Sender.FieldName) and
           (qTrasladoMaterialDetalle.RecordCount > 0)
        then
        begin
          qTrasladoMaterial.Cancel;
          raise Exception.Create('No puede cambiar '+sMensaje+' porque existen materiales en la Lista.');
        end;
      end;
    end;
  end;
end;

procedure TfTraslado.qTrasladoMaterialCODIGOADMINISTRATIVOORIGENSetText(
  Sender: TField; const Text: String);
begin
  if (qTrasladoMaterialDetalle.RecordCount > 0) and (Sender.AsString <> Text) then
    raise Exception.Create('No puede cambiar la CIA porque existen materiales en la Lista.');
  Sender.AsString:= Text;
end;

end.

