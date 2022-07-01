unit uCuentaCobro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, Mask, DBCtrls, ExtCtrls, Grids, DBGrids, Db, DBTables, uFuncionSGD;

type
  TfCuentaCobro = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    DBGridActividad: TDBGrid;
    DBGridMaterial: TDBGrid;
    qODTCobro: TQuery;
    dsODTCobro: TDataSource;
    qDetalleActividad: TQuery;
    qDetalleMaterial: TQuery;
    dsDetalleActividad: TDataSource;
    dsDetalleMaterial: TDataSource;
    qODTCobroCODIGOODT: TFloatField;
    qODTCobroCONSECUTIVO: TFloatField;
    qODTCobroCONSECUTIVOCOBRO: TFloatField;
    qODTCobroNUMEROCUENTA: TFloatField;
    qODTCobroNUMEROMEDIDOR: TFloatField;
    qODTCobroNOMBREUSUARIO: TStringField;
    qODTCobroCODIGOTIPOVIA: TFloatField;
    qODTCobroCODIGONOMBREVIA: TFloatField;
    qODTCobroMODIFICADORVIA: TStringField;
    qODTCobroDUPLICADOR: TFloatField;
    qODTCobroMODIFICADORDUPLICADOR: TStringField;
    qODTCobroNUMEROPUERTA: TFloatField;
    qODTCobroCODIGOTIPOVERTICAL: TFloatField;
    qODTCobroVERTICAL: TStringField;
    qODTCobroCODIGOTIPOINTERIOR: TFloatField;
    qODTCobroPISO: TStringField;
    qODTCobroINTERIOR: TStringField;
    qODTCobroCODIGOTIPOPREDIO: TStringField;
    qODTCobroDESCRIPCIONTIPOPREDIO: TStringField;
    qODTCobroDireccionCalculada: TStringField;
    UpdODTCobro: TUpdateSQL;
    UpdDetalleActividad: TUpdateSQL;
    qDetalleActividadCODIGOODT: TFloatField;
    qDetalleActividadCONSECUTIVO: TFloatField;
    qDetalleActividadCONSECUTIVOCOBRO: TFloatField;
    qDetalleActividadCODIGOADMINISTRATIVO: TFloatField;
    qDetalleActividadCODIGOODTACTIVIDADCOBRO: TFloatField;
    qODTActividadCobro: TQuery;
    qDetalleActividadESNORMAL: TStringField;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    qODTCobroCODIGOGEOGRAFICO: TFloatField;
    UpdDetalleMaterial: TUpdateSQL;
    qDetalleMaterialCODIGOODT: TFloatField;
    qDetalleMaterialCONSECUTIVO: TFloatField;
    qDetalleMaterialCONSECUTIVOCOBRO: TFloatField;
    qDetalleMaterialCODIGOMATERIAL: TFloatField;
    qDetalleMaterialCANTIDAD: TFloatField;
    qDetalleMaterialVALORMATERIAL: TFloatField;
    qMaterialEssa: TQuery;
    qDetalleMaterialNombreMaterial: TStringField;
    qODTCobroOBSERVACION: TStringField;
    qODTCobroCEDULAUSUARIO: TStringField;
    qODTCobroNUMEROVALE: TStringField;
    qReporte: TQuery;
    qReporteCIGDANO: TFloatField;
    qReporteCODIGOTIPOVIA: TFloatField;
    qReporteCODIGONOMBREVIA: TFloatField;
    qReporteMODIFICADORVIA: TStringField;
    qReporteDUPLICADOR: TFloatField;
    qReporteMODIFICADORDUPLICADOR: TStringField;
    qReporteNUMEROPUERTA: TFloatField;
    qReporteCODIGOTIPOPREDIO: TStringField;
    qReporteDESCRIPCIONTIPOPREDIO: TStringField;
    qReporteDireccionCalculada: TStringField;
    qODTActividadCobroCODIGOADMINISTRATIVO: TFloatField;
    qODTActividadCobroCODIGOODTACTIVIDADCOBRO: TFloatField;
    qODTActividadCobroNOMBREODTACTIVIDADCOBRO: TStringField;
    qODTActividadCobroVALORNORMAL: TFloatField;
    qODTActividadCobroVALORFESTIVO: TFloatField;
    qDetalleActividadValorParcial: TFloatField;
    qDetalleActividadNombreActividad: TStringField;
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    qODTActividadCobroCODIGOLIQUIDACION: TFloatField;
    qDetalleActividadCODIGOLIQUIDACION: TFloatField;
    qDetalleActividadPROCESADO: TStringField;
    qReporteCODIGOCLIENTECOM: TFloatField;
    qReporteCODIGOCONTADOR: TStringField;
    qReporteNOMBREINFORMANTE: TStringField;
    Panel1: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    btCargarDatosCliente: TBitBtn;
    Label7: TLabel;
    dbeObservacion: TDBEdit;
    DBNavigator1: TDBNavigator;
    GroupBox2: TGroupBox;
    Label10: TLabel;
    SpeedButton1: TSpeedButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbeDireccion: TDBEdit;
    dbeCuenta: TDBEdit;
    dbeMedidor: TDBEdit;
    dbeNombre: TDBEdit;
    dbeCedula: TDBEdit;
    dbeFactura: TDBEdit;
    qDetalleMaterialValorUnitario: TFloatField;
    procedure qODTCobroCalcFields(DataSet: TDataSet);
    procedure qODTCobroAfterPost(DataSet: TDataSet);
    procedure qODTCobroAfterDelete(DataSet: TDataSet);
    procedure qDetalleActividadAfterPost(DataSet: TDataSet);
    procedure qDetalleActividadAfterDelete(DataSet: TDataSet);
    procedure qDetalleActividadAfterInsert(DataSet: TDataSet);
    procedure qODTCobroAfterInsert(DataSet: TDataSet);
    procedure qODTCobroBeforeDelete(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure qDetalleActividadCalcFields(DataSet: TDataSet);
    procedure qDetalleMaterialAfterDelete(DataSet: TDataSet);
    procedure qDetalleMaterialAfterPost(DataSet: TDataSet);
    procedure qDetalleMaterialAfterInsert(DataSet: TDataSet);
    procedure DBGridMaterialEditButtonClick(Sender: TObject);
    procedure btCargarDatosClienteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qReporteCalcFields(DataSet: TDataSet);
    procedure qODTCobroAfterScroll(DataSet: TDataSet);
    procedure qDetalleActividadBeforeDelete(DataSet: TDataSet);
    procedure qODTCobroBeforeEdit(DataSet: TDataSet);
    procedure qDetalleActividadAfterEdit(DataSet: TDataSet);
    procedure qDetalleActividadBeforeEdit(DataSet: TDataSet);
    procedure qODTCobroBeforePost(DataSet: TDataSet);
    procedure qDetalleMaterialCANTIDADValidate(Sender: TField);
    procedure qODTCobroCEDULAUSUARIOValidate(Sender: TField);
    procedure qODTCobroNUMEROCUENTAValidate(Sender: TField);
    procedure qODTCobroNUMEROMEDIDORValidate(Sender: TField);
    procedure qDetalleActividadCODIGOODTACTIVIDADCOBROValidate(
      Sender: TField);
    procedure qDetalleMaterialCODIGOMATERIALValidate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoAdministrativo,CodigoOdt,Consecutivo:string;
    Direccion : Array[1..9] of String;
    procedure GrabarDireccion(q:TQuery);
    function CalcularDireccion:string;
  end;
var
  fCuentaCobro: TfCuentaCobro;

implementation

uses uBuscarMaterial;

{$R *.DFM}

procedure TfCuentaCobro.GrabarDireccion(q:TQuery);
begin
  direccion[1]:=q.fieldbyname('CODIGOGEOGRAFICO').AsString;
  direccion[2]:=q.fieldbyname('CODIGOTIPOVIA').AsString;
  direccion[3]:=q.fieldbyname('CODIGONOMBREVIA').AsString;
  direccion[4]:=q.fieldbyname('MODIFICADORVIA').AsString;
  direccion[5]:=q.fieldbyname('DUPLICADOR').AsString;
  direccion[6]:=q.fieldbyname('MODIFICADORDUPLICADOR').AsString;
  direccion[7]:=q.fieldbyname('NUMEROPUERTA').AsString;
  direccion[8]:=q.fieldbyname('CODIGOTIPOPREDIO').AsString;
  direccion[9]:=q.fieldbyname('DESCRIPCIONTIPOPREDIO').AsString;
end;

procedure TfCuentaCobro.qODTCobroCalcFields(DataSet: TDataSet);
var qDatos:TQuery;
    Direccion:string;
begin
  Direccion:='';
  qDatos:=TQuery.Create(Application);
  qDatos.DatabaseName:='BaseDato';
  if DataSet.FieldByName('CODIGOTIPOVIA').AsString <> '' then
  begin
    qDatos.Close;
    qDatos.SQL.Text:='SELECT ABREVIATURA FROM DIR_TIPOVIA WHERE CODIGOTIPOVIA = ' +
                     DataSet.FieldByName('CODIGOTIPOVIA').AsString;
    qDatos.Open;
    Direccion:=Direccion + qDatos.Fields[0].AsString;
  end;
  if DataSet.FieldByName('CODIGONOMBREVIA').AsString <> '' then
  begin
    qDatos.Close;
    qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                     DataSet.FieldByName('CODIGONOMBREVIA').AsString;
    qDatos.Open;
    Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
  end;
  Direccion:=Direccion + DataSet.FieldByName('MODIFICADORVIA').AsString;

  if DataSet.FieldByName('DUPLICADOR').AsString <> '' then
  begin
    qDatos.Close;
    qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                     DataSet.FieldByName('DUPLICADOR').AsString;
    qDatos.Open;
    Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
  end;
  Direccion:=Direccion + DataSet.FieldByName('MODIFICADORDUPLICADOR').AsString +
             ' ' + DataSet.FieldByName('NUMEROPUERTA').AsString;

  DataSet.FieldByName('DIRECCIONCALCULADA').AsString:=Trim(Direccion);

end;

procedure TfCuentaCobro.qODTCobroAfterPost(DataSet: TDataSet);
begin
  qODTCobro.ApplyUpdates;
  qODTCobro.CommitUpdates;
  DBNavigator2.Enabled:= true;
  DBNavigator3.Enabled:= true;
end;

procedure TfCuentaCobro.qODTCobroAfterDelete(DataSet: TDataSet);
begin
  qODTCobro.ApplyUpdates;
  qODTCobro.CommitUpdates;
end;

procedure TfCuentaCobro.qDetalleActividadAfterPost(DataSet: TDataSet);
begin
  qDetalleActividad.ApplyUpdates;
  qDetalleActividad.CommitUpdates;
end;

procedure TfCuentaCobro.qDetalleActividadAfterDelete(DataSet: TDataSet);
begin
  qDetalleActividad.ApplyUpdates;
  qDetalleActividad.CommitUpdates;
end;

procedure TfCuentaCobro.qDetalleActividadAfterInsert(DataSet: TDataSet);
begin
  if qODTCobroCONSECUTIVOCOBRO.AsString <> '' then
  begin
    DataSet.FieldByName('CODIGOODT').AsString:=qODTCobroCODIGOODT.AsString;
    DataSet.FieldByName('CONSECUTIVO').AsString:=qODTCobroCONSECUTIVO.AsString;
    DataSet.FieldByName('CONSECUTIVOCOBRO').AsString:=qODTCobroCONSECUTIVOCOBRO.AsString;
    DataSet.FieldByName('CODIGOADMINISTRATIVO').AsString:= CodigoAdministrativo;
    DataSet.FieldByName('ESNORMAL').AsString:='S';
  end
  else
    raise Exception.Create('Debe primero adicionar una cuenta de cobro, ' + chr(13) +
                          'para luego agregar actividades y/o materiales.');
end;

procedure TfCuentaCobro.qODTCobroAfterInsert(DataSet: TDataSet);
var qConsecutivo:TQuery;
begin
  qConsecutivo:=TQuery.Create(nil);
  qConsecutivo.DatabaseName := 'BaseDato';
  qConsecutivo.sql.add('SELECT MAX(CONSECUTIVOCOBRO) AS MAXCONSECUTIVO FROM ODTCOBRO');
  qConsecutivo.sql.add('WHERE CODIGOODT = '+CodigoODT);
  qConsecutivo.sql.add('AND CONSECUTIVO = '+Consecutivo);
  qConsecutivo.Open;

  DataSet.FieldByName('CODIGOODT').AsString := CodigoODT;
  DataSet.FieldByName('CONSECUTIVO').AsString := Consecutivo;
  DataSet.FieldByName('CONSECUTIVOCOBRO').AsString := IntToStr(qConsecutivo.FieldByName('MAXCONSECUTIVO').asinteger+1);
  DataSet.FieldByName('CODIGOGEOGRAFICO').AsString := direccion[1];
  DataSet.fieldbyname('CODIGOTIPOVIA').AsString := direccion[2];
  DataSet.fieldbyname('CODIGONOMBREVIA').AsString := direccion[3];
  DataSet.fieldbyname('MODIFICADORVIA').AsString := direccion[4];
  DataSet.fieldbyname('DUPLICADOR').AsString := direccion[5];
  DataSet.fieldbyname('MODIFICADORDUPLICADOR').AsString := direccion[6];
  DataSet.fieldbyname('NUMEROPUERTA').AsString := direccion[7];
  DataSet.fieldbyname('CODIGOTIPOPREDIO').AsString := direccion[8];
  DataSet.fieldbyname('DESCRIPCIONTIPOPREDIO').AsString := direccion[9];

  qConsecutivo.Close;
  qConsecutivo.free;
end;

procedure TfCuentaCobro.qODTCobroBeforeDelete(DataSet: TDataSet);
begin
  if qDetalleActividad.RecordCount >0 then
  begin
    Application.MessageBox(Pchar('No se puede borrar!'+chr(13)+'Existen actividades asociadas'), 'Error', MB_ICONERROR+MB_OK);
    abort;
  end;
  if qDetalleMaterial.RecordCount >0 then
  begin
    Application.MessageBox(Pchar('No se puede borrar!'+chr(13)+'Existen materiales asociadas'), 'Error', MB_ICONERROR+MB_OK);
    abort;
  end;
end;

procedure TfCuentaCobro.SpeedButton1Click(Sender: TObject);
begin
  CapturarDireccion(qODTCobro, dbeDireccion);
end;

procedure TfCuentaCobro.qDetalleActividadCalcFields(DataSet: TDataSet);
var qDatos:TQuery;
    Entro:Boolean;
begin
  Entro:=False;
  qDatos:=TQuery.Create(Application);
  qDatos.DatabaseName:='BaseDato';
  try
    if (DataSet.FieldByName('ESNORMAL').AsString='S') and
       (DataSet.FieldByName('CODIGOADMINISTRATIVO').AsString <> '') and
       (DataSet.FieldByName('CODIGOODTACTIVIDADCOBRO').AsString <> '') then
    begin
      qDatos.SQL.Text:='SELECT VALORNORMAL FROM ODTACTIVIDADCOBRO '
                     + 'WHERE CODIGOADMINISTRATIVO = ' + DataSet.FieldByName('CODIGOADMINISTRATIVO').AsString
                     + ' AND CODIGOODTACTIVIDADCOBRO = ' + DataSet.FieldByName('CODIGOODTACTIVIDADCOBRO').AsString;
      Entro:=True;
    end;
    if (DataSet.FieldByName('ESNORMAL').AsString='N') and
       (DataSet.FieldByName('CODIGOADMINISTRATIVO').AsString <> '') and
       (DataSet.FieldByName('CODIGOODTACTIVIDADCOBRO').AsString <> '') then
    begin
      qDatos.SQL.Text:='SELECT VALORFESTIVO FROM ODTACTIVIDADCOBRO '
                     + 'WHERE CODIGOADMINISTRATIVO = ' + DataSet.FieldByName('CODIGOADMINISTRATIVO').AsString
                     + ' AND CODIGOODTACTIVIDADCOBRO = ' + DataSet.FieldByName('CODIGOODTACTIVIDADCOBRO').AsString;
      Entro:=True;
    end;
    if Entro then
    begin
      qDatos.Open;
      DataSet.FieldByName('ValorParcial').AsCurrency:=qDatos.Fields[0].AsCurrency;
    end;
  finally
    qDatos.Free;
  end;  
end;

procedure TfCuentaCobro.qDetalleMaterialAfterDelete(DataSet: TDataSet);
begin
  qDetalleMaterial.ApplyUpdates;
  qDetalleMaterial.CommitUpdates;
end;

procedure TfCuentaCobro.qDetalleMaterialAfterPost(DataSet: TDataSet);
begin
  qDetalleMaterial.ApplyUpdates;
  qDetalleMaterial.CommitUpdates;
end;

procedure TfCuentaCobro.qDetalleMaterialAfterInsert(DataSet: TDataSet);
begin
  if qODTCobroCONSECUTIVOCOBRO.AsString <> '' then
  begin
    DataSet.FieldByName('CODIGOODT').AsString:=qODTCobroCODIGOODT.AsString;
    DataSet.FieldByName('CONSECUTIVO').AsString:=qODTCobroCONSECUTIVO.AsString;
    DataSet.FieldByName('CONSECUTIVOCOBRO').AsString:=qODTCobroCONSECUTIVOCOBRO.AsString;
  end
  else
    raise Exception.Create('Debe primero adicionar una cuenta de cobro, ' + chr(13) +
                          'para luego agregar actividades y/o materiales.');
end;

procedure TfCuentaCobro.DBGridMaterialEditButtonClick(Sender: TObject);
var i:integer;
begin
try
  fBuscarMaterial := tfBuscarMaterial.Create(Application);
    if fBuscarMaterial.ShowModal = mrOk then
    begin
      if fBuscarMaterial.DBGridBuscarMaterial.SelectedRows.Count>0 then
      begin
        for i:=0 to fBuscarMaterial.DBGridBuscarMaterial.SelectedRows.Count-1 do
        begin
          fBuscarMaterial.qMaterial.BookMark:=fBuscarMaterial.DBGridBuscarMaterial.SelectedRows.Items[i];
          try
            if (i=0) and (DBGridMaterial.Fields[0].text<>'')
            then qDetalleMaterial.Edit
            else
            begin
              if qDetalleMaterial.State in [dsInsert] then
              qDetalleMaterial.Cancel;
              qDetalleMaterial.Insert;
            end;
            qDetalleMaterial.FieldbyName('CodigoMaterial').asstring := fBuscarMaterial.qMaterial.fieldbyName('CodigoMaterial').asstring;
            //qDetalleMaterial.FieldbyName('ValorUnitario').asFloat := fBuscarMaterial.qMaterial.fieldbyName('ValorUnitario').asfloat;
            qDetalleMaterial.Post;
            qDetalleMaterial.Insert;
          except
          on E:Exception do
          begin
            qDetalleMaterial.Cancel;
          end;
        end;
      end;
      if qDetalleMaterial.State in [dsInsert] then
        qDetalleMaterial.Cancel;
      qDetalleMaterial.Active := False;
      qDetalleMaterial.Active := True;
      if (not qDetalleMaterial.IsEmpty) and (qDetalleMaterialCODIGOMATERIAL.AsFloat = 0) then
        qDetalleMaterial.Delete;
    end;
  end;
finally
  fBuscarMaterial.free;
  end;
end;

procedure TfCuentaCobro.btCargarDatosClienteClick(Sender: TObject);
begin
  qReporte.Close;
  qReporte.Open;
  qODTCobroCODIGOGEOGRAFICO.AsString:=qReporteCIGDANO.AsString;
  qODTCobroCODIGOTIPOVIA.AsString:=qReporteCODIGOTIPOVIA.AsString;
  qODTCobroCODIGONOMBREVIA.AsString:=qReporteCODIGONOMBREVIA.AsString;
  qODTCobroMODIFICADORVIA.AsString:=qReporteMODIFICADORVIA.AsString;
  qODTCobroDUPLICADOR.AsString:=qReporteDUPLICADOR.AsString;
  qODTCobroMODIFICADORDUPLICADOR.AsString:=qReporteMODIFICADORDUPLICADOR.AsString;
  qODTCobroNUMEROPUERTA.AsString:=qReporteNUMEROPUERTA.AsString;
  qODTCobroCODIGOTIPOPREDIO.AsString:=qReporteCODIGOTIPOPREDIO.AsString;
  qODTCobroDESCRIPCIONTIPOPREDIO.AsString:=qReporteDESCRIPCIONTIPOPREDIO.AsString;
  if qReporteCODIGOCLIENTECOM.Asstring <> '' then qODTCobroNUMEROCUENTA.AsFloat:= qReporteCODIGOCLIENTECOM.AsFloat;
  if qReporteCODIGOCONTADOR.asString   <> '' then qODTCobroNUMEROMEDIDOR.asfloat:= qReporteCODIGOCONTADOR.asfloat;
end;

function TfCuentaCobro.CalcularDireccion: string;
//var qDatos:TQuery;
//    Direccion:string;
begin
{  Direccion:='';
  qDatos:=TQuery.Create(Application);
  qDatos.DatabaseName:='BaseDato';
  if q.FieldByName('CODIGOTIPOVIA').AsString <> '' then
  begin
    qDatos.Close;
    qDatos.SQL.Text:='SELECT ABREVIATURA FROM DIR_TIPOVIA WHERE CODIGOTIPOVIA = ' +
                     dsReporte.DataSet.FieldByName('CODIGOTIPOVIA').AsString;
    qDatos.Open;
    Direccion:=Direccion + qDatos.Fields[0].AsString;
  end;
  if q.FieldByName('CODIGONOMBREVIA').AsString <> '' then
  begin
    qDatos.Close;
    qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                     dsReporte.DataSet.FieldByName('CODIGONOMBREVIA').AsString;
    qDatos.Open;
    Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
  end;
  Direccion:=Direccion + dsReporte.DataSet.FieldByName('MODIFICADORVIA').AsString;

  if q.FieldByName('DUPLICADOR').AsString <> '' then
  begin
    qDatos.Close;
    qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                     dsReporte.DataSet.FieldByName('DUPLICADOR').AsString;
    qDatos.Open;
    Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
  end;
  Direccion:=Direccion + dsReporte.DataSet.FieldByName('MODIFICADORDUPLICADOR').AsString +
             ' ' + dsReporte.DataSet.FieldByName('NUMEROPUERTA').AsString;

  Direccion:=Direccion + ' ' + dsReporte.DataSet.FieldByName('CODIGOTIPOPREDIO').AsString + ' ' +
             dsReporte.DataSet.FieldByName('DESCRIPCIONTIPOPREDIO').AsString;
  DataSet.FieldByName('DIRECCIONCALCULADA').AsString:=TrimLeft(Direccion);
  qDatos.Free;}
end;

procedure TfCuentaCobro.FormShow(Sender: TObject);
begin
  if qODTCobro.State in [dsEdit,dsInsert] then
  begin
    qReporte.Close;
    qReporte.Open;
    if qReporte.RecordCount>0 then
      btCargarDatosCliente.Enabled:=true;
  end
  else
    btCargarDatosCliente.Enabled:=False;

  qODTActividadCobro.Close;
  qODTActividadCobro.Open;
  qMaterialEssa.close;
  qMaterialEssa.Open;
  qDetalleActividad.close;
  qDetalleActividad.Open;
  qDetalleMaterial.Close;
  qDetalleMaterial.Open;
  if qODTCobro.RecordCount >0 then
  Begin
    DBNavigator2.Enabled:= true;
    DBNavigator3.Enabled:= true;
  End;
end;

procedure TfCuentaCobro.qReporteCalcFields(DataSet: TDataSet);
//var qDatos:TQuery;
//    Direccion:string;
begin
{  DataSet. FieldByName('COSTOTOTALODT').AsFloat:=qODTHijaCOSTOMATERIAL.AsFloat + qODTHijaCOSTOTRANSPORTE.AsFloat +
                            qODTHijaCOSTOEQUIPO.AsFloat   + qODTHijaCOSTOMANOOBRA.AsFloat;

  Direccion:='';
  qDatos:=TQuery.Create(Application);
  qDatos.DatabaseName:='BaseDato';
  if DataSet.FieldByName('CODIGOTIPOVIA').AsString <> '' then
  begin
    qDatos.Close;
    qDatos.SQL.Text:='SELECT ABREVIATURA FROM DIR_TIPOVIA WHERE CODIGOTIPOVIA = ' +
                     DataSet.FieldByName('CODIGOTIPOVIA').AsString;
    qDatos.Open;
    Direccion:=Direccion + qDatos.Fields[0].AsString;
  end;
  if DataSet.FieldByName('CODIGONOMBREVIA').AsString <> '' then
  begin
    qDatos.Close;
    qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                     DataSet.FieldByName('CODIGONOMBREVIA').AsString;
    qDatos.Open;
    Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
  end;
  Direccion:=Direccion + DataSet.FieldByName('MODIFICADORVIA').AsString;

  if DataSet.FieldByName('DUPLICADOR').AsString <> '' then
  begin
    qDatos.Close;
    qDatos.SQL.Text:='SELECT NOMBRENOMBREVIA FROM DIR_NOMBREVIA WHERE CODIGONOMBREVIA = ' +
                     DataSet.FieldByName('DUPLICADOR').AsString;
    qDatos.Open;
    Direccion:=Direccion + ' ' + qDatos.Fields[0].AsString;
  end;
  Direccion:=Direccion + DataSet.FieldByName('MODIFICADORDUPLICADOR').AsString +
             ' ' + DataSet.FieldByName('NUMEROPUERTA').AsString;

  Direccion:=Direccion + ' ' + DataSet.FieldByName('CODIGOTIPOPREDIO').AsString + ' ' +
             DataSet.FieldByName('DESCRIPCIONTIPOPREDIO').AsString;
  DataSet.FieldByName('DIRECCIONCALCULADA').AsString:=TrimLeft(Direccion);
  qDatos.Free;}
end;

procedure TfCuentaCobro.qODTCobroAfterScroll(DataSet: TDataSet);
begin
  if qODTCobro.State in [dsEdit,dsInsert] then
  begin
    qReporte.Close;
    qReporte.Open;
    if qReporte.RecordCount>0 then
      btCargarDatosCliente.Enabled:=true
  end
  else
    btCargarDatosCliente.Enabled:=False;
end;

procedure TfCuentaCobro.qDetalleActividadBeforeDelete(DataSet: TDataSet);
begin
if qDetalleActividadPROCESADO.asstring = 'S' then
  raise Exception.Create('Esta actividad no se puede eliminar pues ya fue procesada.')
end;

procedure TfCuentaCobro.qODTCobroBeforeEdit(DataSet: TDataSet);
var qConsulta2: tquery;
begin
qConsulta2 := TQuery.Create(Application);
qConsulta2.DatabaseName := 'BaseDato';
qConsulta2.SQL.Add(' SELECT * FROM odtcobrodetalleactividad');
qConsulta2.SQL.Add('  WHERE CODIGOODT= '+QODTCOBROCODIGOODT.ASSTRING);
qConsulta2.SQL.Add('  AND CONSECUTIVO = '+QODTCOBROCONSECUTIVO.ASSTRING);
qConsulta2.SQL.Add('  AND CONSECUTIVOCOBRO = '+QODTCOBROCONSECUTIVOCOBRO.ASSTRING);
qConsulta2.SQL.Add('  AND PROCESADO = ''S''');
qConsulta2.Open;

if qconsulta2.RecordCount >0 then
Begin
  qconsulta2.free;
  raise Exception.Create('La información de esta cuenta de cobro no se puede modificar pues existen actividades que ya fueron procesadas.');
end;
qconsulta2.free;
end;

procedure TfCuentaCobro.qDetalleActividadAfterEdit(DataSet: TDataSet);
begin
if qDetalleActividadPROCESADO.asstring = 'S' then
  raise Exception.Create('Esta actividad no se puede eliminar pues ya fue procesada.')
end;

procedure TfCuentaCobro.qDetalleActividadBeforeEdit(DataSet: TDataSet);
begin
if qDetalleActividadPROCESADO.asstring = 'S' then
  raise Exception.Create('Esta actividad no se puede Editar pues ya fue procesada.')
end;

procedure TfCuentaCobro.qODTCobroBeforePost(DataSet: TDataSet);
begin
//+++++++++VALIDACION DE TODOS LOS CAMPOS++++++++++
if ((dbeDireccion.text = '') or (dbeCuenta.text = '') or (dbeMedidor.text = '') or (dbeNombre.text = '') or (dbeCedula.text = '') or (dbeFactura.text = '')or (dbeFactura.text = '') or (dbeObservacion.text = '')) then
  raise Exception.Create('Toda la Informacion es necesaria, por favor digitela.');

end;

procedure TfCuentaCobro.qDetalleMaterialCANTIDADValidate(Sender: TField);
begin
if  qDetalleMaterialCantidad.asFloat > 0 then
  qDetalleMaterialValorMaterial.asFloat := qDetalleMaterialCantidad.asFloat * qDetalleMaterialValorUnitario.asFloat;
end;

procedure TfCuentaCobro.qODTCobroCEDULAUSUARIOValidate(Sender: TField);
var
i: integer;
begin
  // garantizar que el valor sea numerico.
  if  sender.Text <> '' then
  Begin
    try
    i:=  strtoint(sender.Text)
    except
          raise Exception.Create('Este valor no es numerico, no debe tener puntos ni comas');
    End;
  End;
end;



procedure TfCuentaCobro.qODTCobroNUMEROCUENTAValidate(Sender: TField);
var
qconsulta:tquery;
SinError: boolean;
begin
SinError:= false;
//Aqui se valida la informacion enttre el numero de cuenta y el medidor...
if  qODTCobroNUMEROCUENTA.AsString <> '' then
Begin

  qConsulta := TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.sql.text:= 'SELECT * FROM suscriptor'+dblink+'  WHERE tarifa = 615  AND codigo_cuenta = '+qODTCobroNUMEROCUENTA.asstring;
  qConsulta.open;
  if qconsulta.RecordCount > 0 then
  Begin
    qconsulta.free;
    raise Exception.Create('El número de Cuenta no puede ser de Alumbrado Público.');
  End;
  qConsulta.close;
  qConsulta.sql.text:= 'select numero_contador, codigo_propietario  from conta'+dblink+' where codigo_propietario = '+qODTCobroNUMEROCUENTA.asstring;
  qConsulta.open;
  if qconsulta.RecordCount = 0 then
  Begin
    qconsulta.free;
    raise Exception.Create('El número de Cuenta digitado no existe.');
  End;

  if qODTCobroNUMEROMEDIDOR.asstring <> '' then
  Begin
    qConsulta.first;
    while not qconsulta.Eof do
    Begin
      if qconsulta.FieldByName('numero_contador').asinteger = qODTCobroNUMEROMEDIDOR.asinteger then
      Begin
         SinError:= true;
      end;
      qconsulta.next;
    end;
    if SinError = false then
    Begin
      qconsulta.free;
      raise Exception.Create('La información del número de cuenta no concuerda con la del número de medidor del usuario.');
    end;
  end;
  qconsulta.free;

End;
end;




procedure TfCuentaCobro.qODTCobroNUMEROMEDIDORValidate(Sender: TField);
var
qconsulta:tquery;
SinError: boolean;
begin
SinError:= false;
//Aqui se valida la informacion enttre el numero de cuenta y el medidor...
If qODTCobroNUMEROMEDIDOR.AsString <> '' then
Begin
  qConsulta := TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.sql.text:= 'select numero_contador, codigo_propietario  from conta'+dblink+' where numero_contador = '+qODTCobroNUMEROMEDIDOR.asstring;
  qConsulta.open;
  if qconsulta.RecordCount = 0 then
  Begin
    qconsulta.free;
    raise Exception.Create('El número de contador digitado no existe.');
  End;
  if qODTCobroNUMEROCUENTA.asstring <> '' then
  Begin
    qConsulta.first;
    while not qconsulta.Eof do
    Begin
      if qconsulta.FieldByName('codigo_propietario').asinteger = qODTCobroNUMEROCUENTA.asinteger then
      Begin
        SinError:= true;
      end;
      qconsulta.Next;
    end;
    if SinError = false then
    Begin
        qconsulta.free;
        raise Exception.Create('La información del número de medidor no concuerda con la del numero de cuenta del usuario.');
    end;
  end;
  qconsulta.free;
End;
end;

procedure TfCuentaCobro.qDetalleActividadCODIGOODTACTIVIDADCOBROValidate(
  Sender: TField);
var
  qConsulta: tquery;
begin
  qConsulta := TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.sql.text:= 'Select activo from odtactividadcobro where CODIGOODTACTIVIDADCOBRO = '+qDetalleActividadCODIGOODTACTIVIDADCOBRO.asstring +' and codigoadministrativo ='+ codigoadministrativo;
  qConsulta.open;
  if qconsulta.fieldbyname('activo').asstring <> 'S' then
  Begin
    qconsulta.free;
    raise Exception.Create('La actividad seleccionada no existe o no se encuentra activa.');
  End;
  qconsulta.free;
end;

procedure TfCuentaCobro.qDetalleMaterialCODIGOMATERIALValidate(
  Sender: TField);
var
  qConsulta: tquery;
begin
  qConsulta := TQuery.Create(Application);
  qConsulta.DatabaseName := 'BaseDato';
  qConsulta.sql.text:= 'Select activo from MATERIALESSA where CODIGOMATERIAL = '+qDetalleMaterialCODIGOMATERIAL.asstring ;
  qConsulta.open;
  if qconsulta.fieldbyname('activo').asstring <> 'S' then
  Begin
    qconsulta.free;
    raise Exception.Create('El material seleccionado no existe o no se encuentra activo.');
  End;
  qconsulta.free;
end;

end.
