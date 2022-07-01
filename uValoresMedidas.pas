unit uValoresMedidas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Grids, DBGrids, RXDBCtrl, ComCtrls, ExtCtrls, ToolEdit,QuickRpt, Qrctrls,
  Buttons, StdCtrls, Mask, DBCtrls;

type
  TFValoresMedidas = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label22: TLabel;
    dsFormato: TDataSource;
    qFormato: TQuery;
    qFormatoCODIGOFORMATOMTTO: TFloatField;
    qFormatoNOMBREFORMATOMTTO: TStringField;
    Panel3: TPanel;
    Panel6: TPanel;
    Panel5: TPanel;
    bAceptar: TBitBtn;
    bCancelar: TBitBtn;
    qCoordinacion: TQuery;
    dsCoordinacion: TDataSource;
    qCoordinacionCODIGOODTOPERA: TFloatField;
    qCoordinacionNOMBREODTOPERA: TStringField;
    qFormatoCODIGOCOORDINACION: TFloatField;
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
    dsCaracteristicasElemento: TDataSource;
    GroupBox1: TGroupBox;
    LbCoordinacion: TLabel;
    DBLCBFormato: TDBLookupComboBox;
    DBLCBCoordinacion: TDBLookupComboBox;
    codigo1: TListBox;
    codigo2: TListBox;
    Memo1: TMemo;
    Label9: TLabel;
    DBLCBSeccion: TDBLookupComboBox;
    Label10: TLabel;
    qSecciones: TQuery;
    dsSecciones: TDataSource;
    qSeccionesCODIGOSECCIONFORMATO: TFloatField;
    qSeccionesCODIGOFORMATOMTTO: TFloatField;
    qSeccionesNOMBRESECCIONFORMATO: TStringField;
    qSeccionesCONSECUTIVOSECCIONFORMATO: TFloatField;
    qMedidas: TQuery;
    dsMedidas: TDataSource;
    qMedidasCODIGOCOLUMNAMEDIDA: TFloatField;
    qMedidasNOMBRECOLUMNAMEDIDA: TStringField;
    qMedidasCODIGOTIPOCOLUMNAMEDIDA: TStringField;
    qMedidasTIPODATO: TStringField;
    qMedidasCONSECUTIVOMEDIDASECCION: TFloatField;
    qMedidasCODIGOUNIDADMEDIDAMTTO: TFloatField;
    Label2: TLabel;
    Label3: TLabel;
    DBLCBValor: TDBLookupComboBox;
    bAgregar: TButton;
    qValores: TQuery;
    dsValores: TDataSource;
    qValoresMedidas: TQuery;
    dsValoresMedidas: TDataSource;
    updValoresMedidas: TUpdateSQL;
    qValoresMedidasCODIGOVALORESMEDIDA: TFloatField;
    qValoresMedidasCODIGOCOLUMNAMEDIDA: TFloatField;
    qValoresMedidasCODIGOVALOR: TFloatField;
    qMedidasFORMULA: TBlobField;
    qMedidasVALORES: TStringField;
    qMedidasCODIGOTIPOVALOR: TFloatField;
    DBLCBMedidas: TDBLookupComboBox;
    qMedidasCODIGOSECCIONFORMATO: TFloatField;
    qValoresCODIGOVALOR: TFloatField;
    qValoresVALOR: TStringField;
    qValoresCODIGOTIPOVALOR: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bCancelarClick(Sender: TObject);
    procedure DBLCBCoordinacionClick(Sender: TObject);
    procedure DBLCBFormatoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qValoresMedidasAfterInsert(DataSet: TDataSet);
    procedure bAgregarClick(Sender: TObject);
    procedure bAceptarClick(Sender: TObject);
    procedure qCoordinacionCODIGOODTOPERAChange(Sender: TField);
    procedure qFormatoCODIGOFORMATOMTTOChange(Sender: TField);
    procedure DBLCBSeccionClick(Sender: TObject);
    procedure DBLCBMedidasClick(Sender: TObject);
    procedure qValoresMedidasAfterDelete(DataSet: TDataSet);
    procedure qValoresMedidasAfterPost(DataSet: TDataSet);
//    procedure DBLCBMedidaClick(Sender: TObject);

  private
    { Private declarations }
  public
    bDatosIncompletos, bCancelando: Boolean;
    sqltablaelemento: string;
  end;

var
  FValoresMedidas:TFValoresMedidas;

implementation

uses uFuncionSGD, uQRFormato, uQRLiquidarExtrasRecargos;
{$R *.DFM}

procedure TFValoresMedidas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Close;
end;

procedure TFValoresMedidas.bCancelarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Desea Cancelar la Operación?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
  begin
    try
      qValoresMedidas.Cancel;
      if qValoresMedidas.UpdatesPending then
        qValoresMedidas.CancelUpdates;
    finally
      Close;
    end;
  end
  else
  begin
    ModalResult := 0;
  end;
end;

procedure TFValoresMedidas.DBLCBCoordinacionClick(Sender: TObject);
begin
if qFormato.Active then
   qFormato.Close;
  qFormato.ParamByName('CODIGOCOORDINACION').asinteger:= DBLCBCoordinacion.KeyValue;
  qFormato.Open;
end;

procedure TFValoresMedidas.DBLCBFormatoClick(Sender: TObject);
begin
if qSecciones.Active then
   qSecciones.Close;
  qSecciones.ParamByName('CODIGOFORMATOMTTO').asinteger:= DBLCBFormato.KeyValue;
  qSecciones.Open;
end;

procedure TFValoresMedidas.FormCreate(Sender: TObject);
begin
  qCoordinacion.Close;
  qCoordinacion.Open;
  qValoresMedidas.Close;
  qValoresMedidas.Open;
end;

procedure TFValoresMedidas.qValoresMedidasAfterInsert(DataSet: TDataSet);
var qDatos:TQuery;
query:Tquery;
begin
end;

procedure TFValoresMedidas.bAgregarClick(Sender: TObject);
////////
var qDatos,query:TQuery;
begin
  showmessage('entra a agregar 2');
////////
  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  query.sql.text:='Select max(CODIGOVALORESMEDIDA)from hve_valoresmedida';
  query.Open;
  qValoresMedidasCODIGOVALORESMEDIDA.ASINTEGER:=query.fields[0].asinteger+1;
  query.close;
  query.sql.clear;
  query.Free;

{showmessage('1');
  qDatos:=TQuery.Create(self);
  qDatos.DatabaseName:='BaseDato';
  qDatos.sql.text:='SELECT SQ_HVEVALORESMEDIDAS.NEXTVAL FROM DUAL';
  qDatos.Open;
  qValoresMedidasCODIGOVALORESMEDIDA.AsString:=qDatos.Fields[0].AsString;

  showmessage(qDatos.Fields[0].AsString);
  //  DataSet.FieldByName('CODIGOCOLUMNAMEDIDA').AsString:= qMedidasCODIGOCOLUMNAMEDIDA.AsString;
  //  DataSet.FieldByName('CODIGOVALOR').AsString:= qValoresCODIGOVALOR.AsString;
  qDatos.Free;
  qFormato.Close;
  qFormato.Open;
  ///////
}
  try
  qValoresMedidas.Insert;
  showmessage('despues del insert 1');
    qValoresMedidas.Post;
    if qValoresMedidas.UpdatesPending then
      qValoresMedidas.ApplyUpdates;
  except
    on E:Exception do
    begin
      ShowMessage(E.Message);
      qValoresMedidas.Edit;
    end;
  end;
end;

procedure TFValoresMedidas.bAceptarClick(Sender: TObject);
begin
  close;
end;

procedure TFValoresMedidas.qCoordinacionCODIGOODTOPERAChange(
  Sender: TField);
begin
  qFormato.Close;
  qFormato.Open;
end;

procedure TFValoresMedidas.qFormatoCODIGOFORMATOMTTOChange(Sender: TField);
begin
  qSecciones.Close;
  qSecciones.Open;
end;

procedure TFValoresMedidas.DBLCBSeccionClick(Sender: TObject);
begin
if qMedidas.Active then
  qMedidas.Open;
  qMedidas.ParamByName('CODIGOSECCIONFORMATO').asinteger:= DBLCBSeccion.KeyValue;
  qMedidas.Open;

end;

procedure TFValoresMedidas.DBLCBMedidasClick(Sender: TObject);
begin
if qValores.Active then
  qValores.Close;
  qValores.ParamByName('CODIGOTIPOVALOR').AsInteger:= qMedidasCODIGOTIPOVALOR.AsInteger;
  qValores.Open;
end;

procedure TFValoresMedidas.qValoresMedidasAfterDelete(DataSet: TDataSet);
begin
  qValoresMedidas.ApplyUpdates;
  qValoresMedidas.CommitUpdates;
end;

procedure TFValoresMedidas.qValoresMedidasAfterPost(DataSet: TDataSet);
begin
  qValoresMedidas.ApplyUpdates;
  qValoresMedidas.CommitUpdates;
end;

end.

