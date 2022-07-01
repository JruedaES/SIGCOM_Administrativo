unit uReintegro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Grids, DBGrids, RXDBCtrl, StdCtrls, Buttons, DBCtrls, Mask,
  ExtCtrls, ComCtrls;

type
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
    qODT: TQuery;
    qODTCODIGOODT: TFloatField;
    qODTFECHAEMISION: TDateTimeField;
    qODTCODIGOADMINISTRATIVO: TFloatField;
    qODTCODIGOPRIORIDAD: TStringField;
    qODTCODIGOTIPOTAREA: TFloatField;
    qODTCODIGOAPROBADO: TFloatField;
    qODTCODIGOREVISADO: TFloatField;
    qODTCODIGOODTTIPOMANOOBRA: TFloatField;
    qODTCODIGOEJECUTOR: TFloatField;
    qODTCODIGOFIRMANTE: TFloatField;
    qODTEQUIPOENERGIZADO: TStringField;
    qODTFECHAAPROBACION: TDateTimeField;
    qODTFECHAASIGNACION: TDateTimeField;
    qODTIMPUTACIONMATERIAL: TStringField;
    qODTCOSTOMATERIAL: TFloatField;
    qODTCOSTOMANOOBRA: TFloatField;
    qODTCOSTOTRANSPORTE: TFloatField;
    qODTCOSTOEQUIPO: TFloatField;
    qODTCODIGOALMACEN: TStringField;
    qODTCODIGOESTADOODT: TStringField;
    qODTHORARIONORMALDESDE: TDateTimeField;
    qODTHORARIONORMALHASTA: TDateTimeField;
    qODTCODIGOTURNOGRUPO: TFloatField;
    qODTCODIGOLABOR: TStringField;
    qODTMOTIVOS: TMemoField;
    qODTCODIGOZONATRABAJO: TFloatField;
    qODTCODIGOIMPUTACIONMATERIAL: TFloatField;
    qODTSECUENCIA: TStringField;
    qODTCODIGOMUNICIPIO: TFloatField;
    qODTFECHAINICIO: TDateTimeField;
    qODTFECHAFINAL: TDateTimeField;
    qODTCODIGOZONAORIGEN: TFloatField;
    qODTCODIGOCONTRATISTA: TStringField;
    qODTCODIGOAREAINFLUENCIA: TStringField;
    qODTNUMEROCONTRATO: TStringField;
    qODTCODIGOTIPOTURNO: TFloatField;
    qODTCODIGOTURNO: TFloatField;
    qODTCODIGOMODOODT: TFloatField;
    dsODT: TDataSource;
    UpdODT: TUpdateSQL;
    qZona: TQuery;
    qZonaCODIGOZONA: TFloatField;
    qZonaNOMBREZONA: TStringField;
    qZonaCODIGOZONAESSA: TFloatField;
    qZonaCODIGOMUNICIPIOBASE: TFloatField;
    dsZona: TDataSource;
    qODTNOTAS: TMemoField;
    dsMovimiento: TDataSource;
    qMovimiento: TQuery;
    qMovimientoNOMBREMOVIMIENTOPRESUPUESTO: TStringField;
    qMovimientoCODIGOMOVIMIENTOPRESUPUESTO: TStringField;
    Label9: TLabel;
    DBEdit7: TDBEdit;
    dblcMovimiento: TDBLookupComboBox;
    qReintegroMaterialCODIGOMOVIMIENTOPRESUPUESTO: TStringField;
    qReintegroMaterialFECHAREINTEGRO: TDateTimeField;
    //procedure RxDBGrid9EditButtonClick(Sender: TObject);
    procedure dbgMaterialesEditButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
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
    procedure bbAceptarClick(Sender: TObject);
    //procedure qTrasladoMaterialDetalleCalcFields(DataSet: TDataSet);
    //procedure qTrasladoMaterialAfterPost(DataSet: TDataSet);
    //procedure qTrasladoMaterialAfterDelete(DataSet: TDataSet);
  private

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


procedure TfReintegro.dbgMaterialesEditButtonClick(Sender: TObject);
var
i:integer;
//CodigosMateriales: TStringList;
begin
  if ((qReintegroMaterialCIAS_CIAS.asstring = '') or (qReintegroMaterialCOD_ALMACEN.asstring = '') or (qReintegroMaterialCOD_BODEGA.asstring = '')) then
    raise Exception.Create('Debe seleccionar el area, almacen y bodega del reintegro.');
  if qReintegroMaterial.State in[dsInsert] then
    qReintegroMaterial.post;
//Aqui va codigo para agregar materiales.
  fBuscaMaterialTraslado := tfBuscaMaterialTraslado.Create(Application);
  fBuscaMaterialTraslado.qMaterialcuadrilla.ParamByName('codigogrupotrabajo').asfloat:= fOdturbanarural.qodthijacodigogrupotrabajo.AsFloat;
  fBuscaMaterialTraslado.qMaterialcuadrilla.ParamByName('codigoAdministrativo').asfloat:= fOdturbanarural.qodtpadreCODIGOADMINISTRATIVO.asfloat;
  fBuscaMaterialTraslado.qMaterialcuadrilla.open;
  if fBuscaMaterialTraslado.ShowModal = mrOk then
  begin
    if fBuscaMaterialTraslado.DBGridBuscarMaterial.SelectedRows.Count>0 then
    begin
       for i:=0 to fBuscaMaterialTraslado.DBGridBuscarMaterial.SelectedRows.Count-1 do
       begin
         // qTrasladoMaterialDetalle.edit;
          fBuscaMaterialTraslado.qMaterialcuadrilla.BookMark:=fBuscaMaterialTraslado.DBGridBuscarMaterial.SelectedRows.Items[i];
          qReintegroMaterialdetalle.insert;
          qReintegroMaterialdetalleCODIGOReintegro.asinteger:= codigoReintegro;
          qReintegroMaterialdetalleCODIGOMATERIAL.asFloat:= fBuscaMaterialTraslado.qMaterialcuadrillaCODIGOMATERIAL.asfloat;
          qReintegroMaterialdetalleNOMBREMATERIAL.asstring:= fBuscaMaterialTraslado.qMaterialcuadrillaNOMBREMATERIAL.asstring;
          qReintegroMaterialdetalle.post;
       end;
    end;
  end;
  fBuscaMaterialTraslado.free;
end;


procedure TfReintegro.FormShow(Sender: TObject);
begin
{dtpFechaTraslado.datetime:= now; }
end;


procedure TfReintegro.qReintegroMaterialDetalleCODIGOMATERIALValidate(
  Sender: TField);
begin
  qReintegroMaterialDetalle.FieldByName('CODIGOREINTEGRO').asinteger:= codigoreintegro;
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
begin
  qReintegroMaterialDetalle.ApplyUpdates;
  qReintegroMaterialDetalle.CommitUpdates;
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
  qAlmacen.close;
  qAlmacen.open;
  qBodega.close;
  qBodega.open;
end;

procedure TfReintegro.FormCreate(Sender: TObject);
begin
 qzona.close;
  qzona.open;
  qMovimiento.Open;
  qodt.close;
  qodt.open;
end;

procedure TfReintegro.bbAceptarClick(Sender: TObject);
begin
if (dblcMovimiento.Text = '')  then
  raise Exception.Create('Se requiere el tipo de movimiento.')
end;

end.
