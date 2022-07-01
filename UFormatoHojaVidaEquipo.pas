unit UFormatoHojaVidaEquipo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Grids, DBGrids, RXDBCtrl, ComCtrls, ExtCtrls, ToolEdit,
  Buttons, StdCtrls, Mask, DBCtrls,ConsDll;

type
  TFFormatoHojaVidaEquipo = class(TForm)
    Panel1: TPanel;
    Label22: TLabel;
    dsFormato: TDataSource;
    qFormato: TQuery;
    qFormatoCODIGOFORMATOMTTO: TFloatField;
    qFormatoNOMBREFORMATOMTTO: TStringField;
    Panel3: TPanel;
    qCIA: TQuery;
    Panel6: TPanel;
    Panel5: TPanel;
    bAceptar: TBitBtn;
    bCancelar: TBitBtn;
    qAmbito: TQuery;
    dsAmbito: TDataSource;
    qSubestacion: TQuery;
    dsSubestacion: TDataSource;
    qTipoElemento: TQuery;
    dsTipoElemento: TDataSource;
    qSubestacionCODIGOSUBESTACION: TStringField;
    qSubestacionNOMBRESUBESTACION: TStringField;
    qTipoElementoCODIGOELEMENTO: TFloatField;
    qTipoElementoCODIGOTIPOELEMENTO: TStringField;
    qTipoElementoCODIGOAMBITO: TFloatField;
    qTipoElementoNOMBRETABLAELEMENTO: TStringField;
    qTipoElementoNUMEROCLAVESELEMENTO: TFloatField;
    qTipoElementoCLAVEELEMENTO1: TStringField;
    qTipoElementoCLAVEELEMENTO2: TStringField;
    qTipoElementoCLAVEELEMENTO3: TStringField;
    qTipoElementoNOMBRETIPOELEMENTO: TStringField;
    qTipoElementoCAMPODESCRIPTIVO: TStringField;
    qAmbitoCODIGOAMBITO: TFloatField;
    qAmbitoNOMBREAMBITO: TStringField;
    qFormatoCODIGOCOORDINACION: TFloatField;
    QCircuito: TQuery;
    DSCircuito: TDataSource;
    qCaracteristicasElemento: TQuery;
    qCaracteristicasElementoCODIGOELEMENTO: TFloatField;
    qCaracteristicasElementoCODIGOTIPOELEMENTO: TStringField;
    qCaracteristicasElementoCODIGOAMBITO: TFloatField;
    qCaracteristicasElementoNOMBRETABLAELEMENTO: TStringField;
    qCaracteristicasElementoNUMEROCLAVESELEMENTO: TFloatField;
    qCaracteristicasElementoCLAVEELEMENTO1: TStringField;
    qCaracteristicasElementoCLAVEELEMENTO2: TStringField;
    qCaracteristicasElementoCLAVEELEMENTO3: TStringField;
    qCaracteristicasElementoNOMBRETIPOELEMENTO: TStringField;
    qCaracteristicasElementoCAMPODESCRIPTIVO: TStringField;
    qTablaElemento: TQuery;
    QCircuitoCODIGOCIRCUITO: TStringField;
    QCircuitoNOMBRECIRCUITO: TStringField;
    dsTablaElemento: TDataSource;
    dsCaracteristicasElemento: TDataSource;
    Panel8: TPanel;
    GroupBox3: TGroupBox;
    gbPuntoUbicacion: TGroupBox;
    LbAmbito: TLabel;
    DBLCBAmbito: TDBLookupComboBox;
    Label6: TLabel;
    DBLCBTipoElemento: TDBLookupComboBox;
    gpDescripcion: TGroupBox;
    Label11: TLabel;
    gbTaller: TGroupBox;
    Label13: TLabel;
    Label16: TLabel;
    Label14: TLabel;
    DBMDireccionTaller: TDBMemo;
    DBMUbicacion: TDBMemo;
    DBMDescripcion: TDBMemo;
    Label15: TLabel;
    DBMHojaVidaEquipo: TDBMemo;
    qHojaVidaEquipo: TQuery;
    dsHojaVidaEquipo: TDataSource;
    updHojaVidaEquipo: TUpdateSQL;
    qFabricante: TQuery;
    dsFabricante: TDataSource;
    qEstadoEquipo: TQuery;
    dsEstadoEquipo: TDataSource;
    Query1: TQuery;
    DataSource1: TDataSource;
    qHojaVidaEquipoCODIGOHOJAVIDAEQUIPO: TFloatField;
    qHojaVidaEquipoSERIAL: TFloatField;
    qHojaVidaEquipoCODIGOTIPOELEMENTO: TFloatField;
    qHojaVidaEquipoCODIGOELEMENTO: TStringField;
    qHojaVidaEquipoANOFABRICACION: TFloatField;
    qHojaVidaEquipoCODIGOFABRICANTE: TStringField;
    qHojaVidaEquipoFECHAINSTALACION: TDateTimeField;
    qHojaVidaEquipoFECHARETIRO: TDateTimeField;
    qHojaVidaEquipoCODIGOESTADOEQUIPO: TFloatField;
    qHojaVidaEquipoCODIGOUSUARIOCREACION: TFloatField;
    qHojaVidaEquipoFECHAREGISTRO: TDateTimeField;
    qHojaVidaEquipoCODIGOUSUARIOMODIFICACION: TFloatField;
    qHojaVidaEquipoFECHAULTIMAMODIFICACION: TDateTimeField;
    qHojaVidaEquipoDESCRIPCIONEQUIPO: TStringField;
    qHojaVidaEquipoUBICACION: TStringField;
    qHojaVidaEquipoOBSERVACIONES: TStringField;
    qHojaVidaEquipoCODIGOAMBITO: TFloatField;
    qHojaVidaEquipoCODIGOCIRCUITO: TStringField;
    qNombreTaller: TQuery;
    dsNombreTaller: TDataSource;
    DBLCBNombreTaller: TDBLookupComboBox;
    qHojaVidaEquipoCODIGOTALLER: TFloatField;
    qHojaVidaEquipoCODIGOADMINISTRATIVO: TFloatField;
    qHojaVidaEquipoCODIGOSUBESTACION: TStringField;
    qHojaVidaEquiponombreUsuarioRegistro: TStringField;
    lbSerial: TLabel;
    Label4: TLabel;
    Label9: TLabel;
    Label5: TLabel;
    sbFechaInstalacion: TSpeedButton;
    Label1: TLabel;
    sbFechaRetiro: TSpeedButton;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    DBLCBEstadoEquipo: TDBLookupComboBox;
    DBEAnoFabricacion: TDBEdit;
    DBEFechaInstalacion: TDBEdit;
    DBEFechaRetiro: TDBEdit;
    DBLCBFabricante: TDBLookupComboBox;
    LbSubestacion: TLabel;
    LabelCodigoCircuito: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    DBLCBSubestacion: TDBLookupComboBox;
    Circuito: TDBLookupComboBox;
    cbElemento: TComboBox;
    DBEUbicacion: TDBEdit;
    GroupBox1: TGroupBox;
    lbCIA: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LbFecha: TLabel;
    Label7: TLabel;
    dbeCIA: TDBEdit;
    DBFechaCreacion: TDBEdit;
    dbUsuario: TDBEdit;
    DBEFechaModificacion: TDBEdit;
    procedure qFormatoDatosAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure qFormatoDatosCalcFields(DataSet: TDataSet);
    procedure qFormatoDatosCODIGOFORMATOMTTOChange(Sender: TField);
    procedure qEncabezadoDatosAfterPost(DataSet: TDataSet);
    procedure qEncabezadoDatosAfterDelete(DataSet: TDataSet);
    procedure qEncabezadoDatosAfterInsert(DataSet: TDataSet);
    procedure qEncabezadoDatosCalcFields(DataSet: TDataSet);
    procedure qFormatoDatosCODIGOADMINISTRATIVOValidate(Sender: TField);
    procedure qFormatoDatosAfterPost(DataSet: TDataSet);
    procedure qFormatoDatosAfterDelete(DataSet: TDataSet);
    procedure bAceptarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bCancelarClick(Sender: TObject);
    procedure qAmbitoAfterDelete(DataSet: TDataSet);
    procedure qAmbitoAfterPost(DataSet: TDataSet);
    procedure cbElementoChange(Sender: TObject);
    procedure qFormatoDatosCODIGOAMBITOValidate(Sender: TField);
    procedure qFormatoDatosCODIGOCOORDINACIONValidate(Sender: TField);
    procedure qFormatoDatosCODIGOTIPOELEMENTOValidate(Sender: TField);
    procedure qFormatoDatosCODIGOCIRCUITOValidate(Sender: TField);
    procedure qFormatoDatosBeforePost(DataSet: TDataSet);
    procedure qFormatoDatosCODIGOUSUARIOCREACIONValidate(Sender: TField);
    procedure qHojaVidaEquipoAfterDelete(DataSet: TDataSet);
    procedure qHojaVidaEquipoAfterPost(DataSet: TDataSet);
    procedure qHojaVidaEquipoCODIGOAMBITOChange(Sender: TField);
    procedure sbFechaInstalacionClick(Sender: TObject);
    procedure DBEFechaInstalacionKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbFechaRetiroClick(Sender: TObject);
    procedure DBEFechaRetiroKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qHojaVidaEquipoCODIGOESTADOEQUIPOChange(Sender: TField);
    procedure qHojaVidaEquipoAfterInsert(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    bDatosIncompletos, bCancelando: Boolean;
    sqltablaelemento: string;
    sFecha, Fecha:string;
    function GetFecha(Tipo:Boolean): String;

  end;

var
  FFormatoHojaVidaEquipo:TFFormatoHojaVidaEquipo;

implementation

uses uFuncionSGD, uFormaFecha;
{$R *.DFM}
procedure TFFormatoHojaVidaEquipo.qFormatoDatosAfterInsert(DataSet: TDataSet);
var qDatos:TQuery;
begin
{  qDatos:=TQuery.Create(self);
  qDatos.DatabaseName:='BaseDato';
  qDatos.sql.text:='SELECT SQ_HVEFORMATO.NEXTVAL FROM DUAL';
  qDatos.Open;
  qFormatoDatosCODIGOFORMATOMTTODATOS.AsString:=qDatos.Fields[0].AsString;
  qFormatoDatosFECHACREACION.AsString:= DateTimeToStr(Now);
  qDatos.SQL.Clear;
  qDatos.close;
  qDatos.sql.text:='SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+ inttostr(VarCodigoUsuario);
  qDatos.open;
  qFormatoDatosNombreUsuarioCreacion.asstring:=qDatos.fields[0].asstring;
  qDatos.Free;
  qFormato.Close;
  qFormato.Open;
}
end;

procedure TFFormatoHojaVidaEquipo.FormShow(Sender: TObject);
begin
  qAmbito.Open;
  qTipoElemento.Open;
  qSubestacion.Open;
  QCircuito.Open;
  qCaracteristicasElemento.Open;
  qNombreTaller.Open;
  qHojaVidaEquipo.Open;
  qFabricante.Open;
  qEstadoEquipo.Open;
  qCIA.Open;

//  qFormato.Open;

//  qEncabezado.Open;
//  qFormatoDatos.Open;
//  qEncabezadoDatos.open;
{  qFormatoDatosCODIGOADMINISTRATIVOValidate(qFormatoDatosCODIGOADMINISTRATIVO);
  qFormatoDatosCODIGOAMBITOValidate(qFormatoDatosCODIGOAMBITO);
  qFormatoDatosCODIGOCOORDINACIONValidate(qFormatoDatosCODIGOCOORDINACION);
  qFormatoDatosCODIGOTIPOELEMENTOValidate(qFormatoDatosCODIGOTIPOELEMENTO);
  qFormatoDatosCODIGOCIRCUITOValidate(qFormatoDatosCODIGOCIRCUITO);
  qFormatoDatosCODIGOUSUARIOCREACIONValidate(qFormatoDatosCODIGOUSUARIOCREACION);
  }
end;

procedure TFFormatoHojaVidaEquipo.qFormatoDatosCalcFields(DataSet: TDataSet);
var qusuario:tquery;
begin
{  qusuario:=TQuery.create(application);
  qusuario.databasename:='BaseDato';

  if qFormatoDatosCODIGOUSUARIOCREACION.AsString<>'' then
  begin
    qusuario.Close;
    qusuario.sql.text:='SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+qFormatoDatosCODIGOUSUARIOCREACION.AsString;
    qusuario.open;
    qFormatoDatosNombreUsuarioCreacion.asstring:=qusuario.fields[0].asstring;
    DbUsuario.Text:= qusuario.Fields[0].AsString;
  end;

  if qFormatoDatosCODIGOUSUARIOMODIFICACION.AsString<>'' then
  begin
    qusuario.close;
    qusuario.sql.text:='SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+qFormatoDatosCODIGOUSUARIOMODIFICACION.AsString;
    qusuario.open;
    qFormatoDatosNombreUsuarioModificacion.asstring:=qusuario.fields[0].asstring;
  end;
  qusuario.free;
}
end;

procedure TFFormatoHojaVidaEquipo.qFormatoDatosCODIGOFORMATOMTTOChange(
  Sender: TField);
var qEliminarEncabezados:tquery;
begin
{  if qFormatoDatosCODIGOFORMATOMTTO.AsString<>'' then
  begin
    qEliminarEncabezados:=TQuery.Create(Application);
    qEliminarEncabezados.DatabaseName:='BaseDato';
    qEliminarEncabezados.sql.text:='DELETE FROM HVE_ENCABEZADOFORMATODATOS WHERE CODIGOFORMATOMTTODATOS='+qFormatoDatosCODIGOFORMATOMTTODATOS.AsString;
    qEliminarEncabezados.ExecSQL;
    qEliminarEncabezados.free;
    qEncabezadoDatos.close;
    qEncabezadoDatos.open;
    qEncabezado.close;
    qEncabezado.open;

    while (not qEncabezado.eof) do
    begin
      qEncabezadoDatos.Insert;
      qEncabezadoDatosCODIGOFORMATOMTTODATOS.AsString:=qFormatoDatosCODIGOFORMATOMTTODATOS.AsString;
      qEncabezadoDatosCODIGOENCABEZADOFORMATO.AsString:=qEncabezadoCODIGOENCABEZADOFORMATO.AsString;
      qEncabezadoDatos.Post;
      qEncabezado.next;
    end;
  end;
  qEncabezadoDatos.close;
  qEncabezadoDatos.open;
}
end;

procedure TFFormatoHojaVidaEquipo.qEncabezadoDatosAfterPost(DataSet: TDataSet);
begin
{  qEncabezadoDatos.ApplyUpdates;
  qEncabezadoDatos.CommitUpdates;
}
end;

procedure TFFormatoHojaVidaEquipo.qEncabezadoDatosAfterDelete(
  DataSet: TDataSet);
begin
{  qEncabezadoDatos.ApplyUpdates;
  qEncabezadoDatos.CommitUpdates;
}
end;

procedure TFFormatoHojaVidaEquipo.qEncabezadoDatosAfterInsert(
  DataSet: TDataSet);
var query:tquery;
begin
{  query:=TQuery.create(Application);
  query.DatabaseName:='BaseDato';
  query.sql.text:='SELECT SQ_HVEENCABEZADO.NEXTVAL FROM DUAL';
  query.open;
  DataSet.fieldbyname('CODIGOENCABEZADOFORMATODATOS').asstring:=query.Fields[0].Asstring;
  query.close;
  query.free;
}
end;

procedure TFFormatoHojaVidaEquipo.qEncabezadoDatosCalcFields(DataSet: TDataSet);
var query:tquery;
begin
{  if qEncabezadoDatosCODIGOENCABEZADOFORMATO.AsString<>'' then
  begin
    query:=TQuery.create(Application);
    query.DatabaseName:='BaseDato';
    query.sql.text:='SELECT NOMBRECAMPO FROM HVE_ENCABEZADOFORMATO WHERE CODIGOENCABEZADOFORMATO ='+qEncabezadoDatosCODIGOENCABEZADOFORMATO.AsString;
    query.open;
    qEncabezadoDatosNombreCampo.AsString:=query.Fields[0].AsString;
    query.free;
  end;
}
end;

procedure TFFormatoHojaVidaEquipo.qFormatoDatosCODIGOADMINISTRATIVOValidate(
  Sender: TField);
begin
{ if Sender.Text <> '' then
  begin
    qCIA.Close;
    qCIA.Params[0].AsString:=Sender.Text;
    qCIA.Open;
    if qCIA.RecordCount > 0 then
    begin
      lbCIA.Caption:=qCIA.Fields[0].AsString;
    end
    else
      raise Exception.Create('Este Código Administrativo No Existe.');
  end;
  }
end;

procedure TFFormatoHojaVidaEquipo.qFormatoDatosAfterPost(DataSet: TDataSet);
begin
{
  qFormatoDatos.ApplyUpdates;
  qFormatoDatos.CommitUpdates;
}
end;

procedure TFFormatoHojaVidaEquipo.qFormatoDatosAfterDelete(DataSet: TDataSet);
begin
{
  qFormatoDatos.ApplyUpdates;
  qFormatoDatos.CommitUpdates;
}
end;

procedure TFFormatoHojaVidaEquipo.bAceptarClick(Sender: TObject);
begin
{  if updFormatoDatos = nil then
  begin
  Close;
  ModalResult:=MrOk;
  end
  else
}
//  qHojaVidaEquipo.Insert;
  begin
    bDatosIncompletos := False;
  try
    qHojaVidaEquipo.post;
    if qHojaVidaEquipo.UpdatesPending then
      qHojaVidaEquipo.ApplyUpdates;
    Close;
    ModalResult:=MrOk;
  except
    on E:Exception do
    begin
      ShowMessage(E.Message);
      bDatosIncompletos := True;
      qHojaVidaEquipo.Edit;
      ModalResult:=MrCancel;
      Close;
    end;
  end;
  end;

/////////////*****************
{
if updFormatoDatos = nil then
begin
  Close;
  ModalResult:=MrOk;
end
else
begin
    bDatosIncompletos := False;
  try
    qEncabezadoDatos.Close;
    qFormatoDatos.post;
    if qFormatoDatos.UpdatesPending then
      qFormatoDatos.ApplyUpdates;
    qEncabezadoDatos.Open;
    Close;
    ModalResult:=MrOk;
  except
    on E:Exception do
    begin
      ShowMessage(E.Message);
      bDatosIncompletos := True;
      qFormatoDatos.Edit;
      ModalResult:=MrCancel;
      qEncabezadoDatos.Open;
      Close;
    end;
  end;
end;
}
end;

procedure TFFormatoHojaVidaEquipo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
{  if not bCancelando then
  begin
    if bDatosIncompletos then
    begin
      if Application.MessageBox(PChar('Hay datos incompletos.Desea completar los datos?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
      begin
        ModalResult := 0;
        bDatosIncompletos := false;
        Action:=caNone;
      end
      else
      begin
//        qFormatoDatos.Cancel;
//        qFormatoDatos.CancelUpdates;

        Action:=caHide;
      end;
    end
    else
      if ModalResult <> MrCancel then
      begin
        ModalResult := mrOK;
        Action:=caHide;
      end;
    end;
    if ModalResult=2 then
    begin
      try
//        qFormatoDatos.Cancel;
//        qFormatoDatos.CancelUpdates;
        Action:=caHide;
      except
      end;
    end;
    }
end;

procedure TFFormatoHojaVidaEquipo.bCancelarClick(Sender: TObject);
begin
{if updFormatoDatos = nil then
begin
  ModalResult:=MrCancel;
  Close;
end
else
begin
  if Application.MessageBox(PChar('Perderá los cambios realizados.Esta seguro de Cancelar?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
  begin
    try
      qFormatoDatos.Cancel;
      if qFormatoDatos.UpdatesPending then
        qFormatoDatos.CancelUpdates;
    finally
      bDatosIncompletos := True;
      bCancelando := True;
      Close;
    end;
  end
  else
  begin
    ModalResult := 0;
    bDatosIncompletos := False;
  end;
end;
}
end;

procedure TFFormatoHojaVidaEquipo.qAmbitoAfterDelete(DataSet: TDataSet);
begin
{  qAmbito.ApplyUpdates;
  qAmbito.CommitUpdates;
  }
end;

procedure TFFormatoHojaVidaEquipo.qAmbitoAfterPost(DataSet: TDataSet);
begin
{
  qAmbito.ApplyUpdates;
  qAmbito.CommitUpdates;
  }
end;

procedure TFFormatoHojaVidaEquipo.cbElementoChange(Sender: TObject);
begin
{    qFormatoDatos.FieldByName('CODIGOELEMENTO').asString:= cbElemento.text;
}
end;

procedure TFFormatoHojaVidaEquipo.qFormatoDatosCODIGOAMBITOValidate(
  Sender: TField);
begin
{  if qtipoelemento.Active then
      qtipoelemento.Close;
   qtipoelemento.ParamByName('CODIGOAMBITO').asinteger:= qFormatoDatosCODIGOAMBITO.AsInteger;
  qtipoelemento.Open;
  }
end;

procedure TFFormatoHojaVidaEquipo.qFormatoDatosCODIGOCOORDINACIONValidate(
  Sender: TField);
begin
{
  if qFormato.Active then
   qFormato.Close;
  qFormato.ParamByName('CODIGOCOORDINACION').asinteger:= qFormatoDatosCODIGOCOORDINACION.AsInteger;
  qFormato.Open;
  }
end;

procedure TFFormatoHojaVidaEquipo.qFormatoDatosCODIGOTIPOELEMENTOValidate(
  Sender: TField);
begin
{  case qFormatoDatosCODIGOAMBITO.AsInteger of
     1:begin
         if qFormatoDatosCODIGOELEMENTO.AsString <>'' then
         begin
           cbElemento.Text:=qFormatoDatosCODIGOELEMENTO.AsString;
         end;
         if (DBLCBSubestacion.Visible) and (DBLCBSubestacion.Text <> '') then
           begin
             if cbElemento.Visible = false then
               cbElemento.Visible:= true;
             if qCaracteristicasElemento.Active then
               qCaracteristicasElemento.Close;
             qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= qFormatoDatosCODIGOTIPOELEMENTO.AsInteger;
             qCaracteristicasElemento.Open;
             if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
               begin
                 if qTablaElemento.Active then
                   qTablaElemento.Close;
                 qTablaElemento.SQL.Clear;
                 sqltablaelemento:= 'SELECT'+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                                    qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
                 qTablaElemento.SQL.Add(sqltablaelemento);
                 memo1.Lines.Append(sqltablaelemento);
                 qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= qFormatoDatosCODIGOSUBESTACION.AsString;
                 qTablaElemento.Open;
                 if codigo1.Items.Count >= 1 then
                   codigo1.Clear;
                 if cbElemento.Items.Count >= 1 then
                   cbElemento.Clear;

                 while not qTablaElemento.Eof do
                   begin
                     codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                     cbElemento.Items.Append(qTablaElemento.fields[1].asstring);
                     qTablaElemento.Next;
                   end;
               end
             else
               begin
                 if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
                   begin
                     if qTablaElemento.Active then
                       qTablaElemento.Close;
                     qTablaElemento.SQL.Clear;
                     sqltablaelemento:= 'SELECT'+'  '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                                        qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
                     qTablaElemento.SQL.Add(sqltablaelemento);
                   memo1.Lines.Append(sqltablaelemento);
                     qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:=qFormatoDatosCODIGOSUBESTACION.AsString;
                     qTablaElemento.Open;
                     if codigo1.Items.Count >= 1 then
                       codigo1.Clear;
                     if cbElemento.Items.Count >= 1 then
                       cbElemento.Clear;

                     while not qTablaElemento.Eof do
                       begin
                         codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                         cbElemento.Items.Append(qTablaElemento.fields[0].asstring);
                         qTablaElemento.Next;
                       end;
                   end;
               end;
             if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
               begin
                 if qTablaElemento.Active then
                   qTablaElemento.Close;
                 qTablaElemento.SQL.Clear;
                 sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                                    qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
                 qTablaElemento.SQL.Add(sqltablaelemento);
                 memo1.Lines.Append(sqltablaelemento);
                 qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:=qFormatoDatosCODIGOSUBESTACION.AsString;
                 qTablaElemento.Open;
                 if codigo1.Items.Count >= 1 then
                   codigo1.Clear;
                 if codigo2.Items.Count >= 1 then
                   codigo2.Clear;
                 if cbElemento.Items.Count >= 1 then
                   cbElemento.Clear;

                 while not qTablaElemento.Eof do
                   begin
                     codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                     codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                     cbElemento.Items.Append(qTablaElemento.fields[2].asstring);
                     qTablaElemento.Next;
                   end;
               end
             else
               begin
                 if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
                   begin
                     if qTablaElemento.Active then
                       qTablaElemento.Close;
                     qTablaElemento.SQL.Clear;
                     sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+' '+'FROM'+' '+
                                        qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
                     qTablaElemento.SQL.Add(sqltablaelemento);
                     memo1.Lines.Append(sqltablaelemento);
                     qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:=qFormatoDatosCODIGOSUBESTACION.AsString;
                     qTablaElemento.Open;
                     if codigo1.Items.Count >= 1 then
                       codigo1.Clear;
                     if codigo2.Items.Count >= 1 then
                       codigo2.Clear;
                     if cbElemento.Items.Count >= 1 then
                       cbElemento.Clear;

                     while not qTablaElemento.Eof do
                       begin
                         codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                         codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                         cbElemento.Items.Append(qTablaElemento.fields[0].asstring + qTablaElemento.Fields[1].asstring);
                        qTablaElemento.Next;
                       end;
                   end;
               end;
           end
         else
           begin
             if cbElemento.Visible then
               cbElemento.Visible:= false;
           end;
       end;
     2:begin
          if cbElemento.Visible then
               cbElemento.Visible:= false;
         LabelCodigoCircuito.Visible:=true;
         circuito.visible:=true;

         if qFormatoDatosCODIGOELEMENTO.AsString <>'' then
         begin
           cbElemento.Text:=qFormatoDatosCODIGOELEMENTO.AsString;
         end;

         if Circuito.Visible = True then
           begin
           if qcircuito.Active then
             qcircuito.Close;
            qcircuito.ParamByName('codigosubestacion').AsString  :=qFormatoDatosCODIGOSUBESTACION.AsString;
           qcircuito.open;
           end;
        end;
   end;
   }
end;

procedure TFFormatoHojaVidaEquipo.qFormatoDatosCODIGOCIRCUITOValidate(
  Sender: TField);
begin
{  If (qFormatoDatosCODIGOAMBITO.AsInteger=2)then
  begin
        if (Circuito.Visible) and (Circuito.Text <> '') then
        begin
             if cbElemento.Visible = false then
               cbElemento.Visible:= true;
             if qCaracteristicasElemento.Active then
               qCaracteristicasElemento.Close;
             qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= qFormatoDatosCODIGOTIPOELEMENTO.AsInteger;
             qCaracteristicasElemento.Open;
             if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
               begin
                 if qTablaElemento.Active then
                   qTablaElemento.Close;
                 qTablaElemento.SQL.Clear;
                 sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                                    qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
                 qTablaElemento.SQL.Add(sqltablaelemento);
                memo1.Lines.Append(sqltablaelemento);
                 qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= qFormatoDatosCODIGOCIRCUITO.AsString;
                 qTablaElemento.Open;
                 if codigo1.Items.Count >= 1 then
                   codigo1.Clear;
                 if cbElemento.Items.Count >= 1 then
                   cbElemento.Clear;

                 while not qTablaElemento.Eof do
                   begin
                     codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                     cbElemento.Items.Append(qTablaElemento.fields[1].asstring);
                     qTablaElemento.Next;
                   end;
               end
             else
               begin
                 if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
                   begin
                     if qTablaElemento.Active then
                       qTablaElemento.Close;
                     qTablaElemento.SQL.Clear;
                     sqltablaelemento:= ' SELECT '+'  '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                                        qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
                     qTablaElemento.SQL.Add(sqltablaelemento);
                 memo1.Lines.Append(sqltablaelemento);
                     qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= qFormatoDatosCODIGOCIRCUITO.AsString;
                     qTablaElemento.Open;
                     if codigo1.Items.Count >= 1 then
                       codigo1.Clear;
                     if cbElemento.Items.Count >= 1 then
                       cbElemento.Clear;

                     while not qTablaElemento.Eof do
                       begin
                         codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                         cbElemento.Items.Append(qTablaElemento.fields[0].asstring);
                         qTablaElemento.Next;
                       end;
                   end;
               end;
             if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
             begin
               if qTablaElemento.Active then
                 qTablaElemento.Close;
               qTablaElemento.SQL.Clear;
               sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                                  qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
               qTablaElemento.SQL.Add(sqltablaelemento);
           memo1.Lines.Append(sqltablaelemento);
               qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:=qFormatoDatosCODIGOCIRCUITO.AsString;
               qTablaElemento.Open;
               if codigo1.Items.Count >= 1 then
                 codigo1.Clear;
               if codigo2.Items.Count >= 1 then
                 codigo2.Clear;
               if cbElemento.Items.Count >= 1 then
                 cbElemento.Clear;

               while not qTablaElemento.Eof do
                 begin
                   codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                   codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                   cbElemento.Items.Append(qTablaElemento.fields[2].asstring);
                   qTablaElemento.Next;
                 end;
               end
             else
             begin
               if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring ='') then
                 begin
                 if qTablaElemento.Active then
                   qTablaElemento.Close;
                 qTablaElemento.SQL.Clear;
                 sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+' '+'FROM'+' '+
                                    qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
                 qTablaElemento.SQL.Add(sqltablaelemento);
            memo1.Lines.Append(sqltablaelemento);
                 qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= qFormatoDatosCODIGOCIRCUITO.AsString;
                 qTablaElemento.Open;
                 if codigo1.Items.Count >= 1 then
                   codigo1.Clear;
                 if codigo2.Items.Count >= 1 then
                   codigo2.Clear;
                 if cbElemento.Items.Count >= 1 then
                   cbElemento.Clear;

                 while not qTablaElemento.Eof do
                   begin
                     codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                     codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                     cbElemento.Items.Append(qTablaElemento.fields[0].asstring + qTablaElemento.Fields[1].asstring);
                     qTablaElemento.Next;
                   end;
                 end;
               end;
           end
        else
          begin
            if cbElemento.Visible then
              cbElemento.Visible:= false;
          end;
  end;
  }
end;

procedure TFFormatoHojaVidaEquipo.qFormatoDatosBeforePost(DataSet: TDataSet);
begin
{  qFormatoDatosFECHAULTIMAMODIFICACION.AsString:=DateTimeToStr(Now);
}
end;

procedure TFFormatoHojaVidaEquipo.qFormatoDatosCODIGOUSUARIOCREACIONValidate(
  Sender: TField);
var qusuario:tquery;
begin
{ RefrescarVariables;
  qusuario:=TQuery.create(application);
  qusuario.databasename:='BaseDato';

  if qFormatoDatosCODIGOUSUARIOCREACION.AsString ='' then
   begin
      if qusuario.Active then
        qusuario.Close;
      qusuario.sql.text:='SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+ inttostr(varcodigousuario);
      qusuario.Open;
      DbUsuario.Text:= qusuario.Fields[0].AsString;
   end;
   qusuario.Free;
   }
end;

procedure TFFormatoHojaVidaEquipo.qHojaVidaEquipoAfterDelete(
  DataSet: TDataSet);
begin
  qHojaVidaEquipo.ApplyUpdates;
  qHojaVidaEquipo.CommitUpdates;
end;

procedure TFFormatoHojaVidaEquipo.qHojaVidaEquipoAfterPost(
  DataSet: TDataSet);
begin
  qHojaVidaEquipo.ApplyUpdates;
  qHojaVidaEquipo.CommitUpdates;
end;

procedure TFFormatoHojaVidaEquipo.qHojaVidaEquipoCODIGOAMBITOChange(
  Sender: TField);
begin
  qTipoElemento.Close;
  qTipoElemento.ParamByName('CODIGOAMBITO').AsInteger:=Sender.AsInteger;
  qTipoElemento.Open;
end;

procedure TFFormatoHojaVidaEquipo.sbFechaInstalacionClick(Sender: TObject);
begin
  DBEFechaInstalacion.Setfocus;
  sFecha := DBEFechaInstalacion.Text;
  Fecha := GetFecha(False);
  if Fecha <> '' then DBEFechaInstalacion.Text := Fecha;
end;

function TFFormatoHojaVidaEquipo.GetFecha(Tipo:Boolean): String;
begin
  fFormaFecha := TfFormaFecha.Create(Application);
  uFormaFecha.sFecha := sFecha;
  fFormaFecha.height:=291;
  if FFormaFecha.ShowModal = mrOk then
    if Tipo then
       Result := DateTimetoStr(FFormaFecha.Date+FFormaFecha.fTime)
    else
       Result := DateTimetoStr(FFormaFecha.Date)
  else Result := sFecha;
  fFormaFecha.Free;
end;

procedure TFFormatoHojaVidaEquipo.DBEFechaInstalacionKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F3 : sbFechaInstalacionClick(nil);
  end;
end;

procedure TFFormatoHojaVidaEquipo.sbFechaRetiroClick(Sender: TObject);
begin
 DBEFechaInstalacion.Setfocus;
  sFecha := DBEFechaRetiro.Text;
  Fecha := GetFecha(False);
  if Fecha <> '' then DBEFechaRetiro.Text := Fecha;
end;

procedure TFFormatoHojaVidaEquipo.DBEFechaRetiroKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  case Key of
    VK_F3 : sbFechaRetiroClick(nil);
  end;
end;

procedure TFFormatoHojaVidaEquipo.qHojaVidaEquipoCODIGOESTADOEQUIPOChange(
  Sender: TField);
begin
  if(Sender.AsInteger=1) then
  begin
    gbPuntoUbicacion.BringToFront;
    gbTaller.SendToBack;
  end
  else
  begin
    gbTaller.BringToFront;
    gbPuntoUbicacion.SendToBack;
  end
end;

procedure TFFormatoHojaVidaEquipo.qHojaVidaEquipoAfterInsert(
  DataSet: TDataSet);
var qDatos:TQuery;
begin
  qDatos:=TQuery.Create(self);
  qDatos.DatabaseName:='BaseDato';
  qDatos.sql.text:='SELECT MAX(CODIGOHOJAVIDAEQUIPO) FROM HVE_HOJAVIDAEQUIPO';
  qDatos.Open;
  qHojaVidaEquipoCODIGOHOJAVIDAEQUIPO.AsInteger:=qDatos.Fields[0].AsInteger+1;
  qHojaVidaEquipoFECHAREGISTRO.AsString:=DateTimeToStr(Now);
  qDatos.SQL.Clear;
  qDatos.close;
  qDatos.sql.text:='SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO='+ inttostr(VarCodigoUsuario);
  qDatos.open;
  qHojaVidaEquiponombreUsuarioRegistro.AsString:=qDatos.Fields[0].AsString;
  qDatos.Free;
end;

procedure TFFormatoHojaVidaEquipo.FormCreate(Sender: TObject);
begin
  qAmbito.Open;
  qTipoElemento.Open;
  qSubestacion.Open;
  QCircuito.Open;
  qFabricante.Open;
  qEstadoEquipo.Open;
  qNombreTaller.Open;
  qHojaVidaEquipo.Open;
  
end;

end.

