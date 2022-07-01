unit uValorMedida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Grids, DBGrids, RXDBCtrl, ComCtrls, ExtCtrls, ToolEdit,QuickRpt, Qrctrls,
  Buttons, StdCtrls, Mask, DBCtrls;

type
  TFValorMedida = class(TForm)
    Panel1: TPanel;
    dsFormato: TDataSource;
    qFormato: TQuery;
    Panel3: TPanel;
    Panel6: TPanel;
    Panel5: TPanel;
    bAceptar: TBitBtn;
    bCancelar: TBitBtn;
    qCoordinacion: TQuery;
    dsCoordinacion: TDataSource;
    qCoordinacionCODIGOODTOPERA: TFloatField;
    qCoordinacionNOMBREODTOPERA: TStringField;
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
    Label2: TLabel;
    Label3: TLabel;
    DBLCBValor: TDBLookupComboBox;
    bAgregar: TButton;
    qValores: TQuery;
    dsValores: TDataSource;
    qValoresMedidas: TQuery;
    dsValoresMedidas: TDataSource;
    updValoresMedidas: TUpdateSQL;
    DBLCBMedidas: TDBLookupComboBox;
    Label4: TLabel;
    qTipoValor: TQuery;
    dsTipoValor: TDataSource;
    updMedidas: TUpdateSQL;
    qTipoValorCODIGOTIPOVALOR: TFloatField;
    qTipoValorNOMBRETIPOVALOR: TStringField;
    Memo1: TMemo;
    codigo2: TListBox;
    codigo1: TListBox;
    rbUnico: TRadioButton;
    rbRango: TRadioButton;
    qFormatoCODIGOFORMATOMTTO: TFloatField;
    qFormatoNOMBREFORMATOMTTO: TStringField;
    qFormatoCODIGOCOORDINACION: TFloatField;
    Panel2: TPanel;
    Label6: TLabel;
    Edit4: TEdit;
    Panel4: TPanel;
    lbInicial: TLabel;
    eValorInicial: TEdit;
    lbFinal: TLabel;
    eValorFinal: TEdit;
    lbPaso: TLabel;
    ePaso: TEdit;
    qValoresMedidasCODIGOVALORESMEDIDA: TFloatField;
    qValoresMedidasCODIGOCOLUMNAMEDIDA: TFloatField;
    qValoresMedidasCODIGOVALOR: TFloatField;
    bRango: TButton;
    qMedidasCODIGOCOLUMNAMEDIDA: TFloatField;
    qMedidasCODIGOSECCIONFORMATO: TFloatField;
    qMedidasNOMBRECOLUMNAMEDIDA: TStringField;
    qMedidasCODIGOTIPOCOLUMNAMEDIDA: TStringField;
    qMedidasTIPODATO: TStringField;
    qMedidasCONSECUTIVOMEDIDASECCION: TFloatField;
    qMedidasCODIGOUNIDADMEDIDAMTTO: TFloatField;
    qMedidasCODIGOTIPOVALOR: TFloatField;
    qValoresCODIGOVALOR: TFloatField;
    qValoresCODIGOTIPOVALOR: TFloatField;
    qValoresVALOR: TStringField;
    DBEdit1: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bCancelarClick(Sender: TObject);
    procedure DBLCBCoordinacionClick(Sender: TObject);
    procedure DBLCBFormatoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bAgregarClick(Sender: TObject);
    procedure bAceptarClick(Sender: TObject);
    procedure qCoordinacionCODIGOODTOPERAChange(Sender: TField);
    procedure DBLCBSeccionClick(Sender: TObject);
    procedure DBLCBMedidasClick(Sender: TObject);
    procedure qValoresMedidasAfterDelete(DataSet: TDataSet);
    procedure qValoresMedidasAfterPost(DataSet: TDataSet);
    procedure RegistrarValores;
    procedure MostrarValores;
    procedure rbUnicoClick(Sender: TObject);
    procedure rbRangoClick(Sender: TObject);
    procedure qValoresMedidasBeforePost(DataSet: TDataSet);
    procedure OcultarValores;
    procedure bRangoClick(Sender: TObject);

  private
    { Private declarations }
  public
    bDatosIncompletos, bCancelando: Boolean;
    sqltablaelemento: string;
    columna:integer;
  end;

var
  FValorMedida:TFValorMedida;

implementation

uses uFuncionSGD, uQRFormato, uQRLiquidarExtrasRecargos;
{$R *.DFM}

procedure TFValorMedida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Close;
end;

procedure TFValorMedida.bCancelarClick(Sender: TObject);
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

procedure TFValorMedida.DBLCBCoordinacionClick(Sender: TObject);
begin
if qFormato.Active then
   qFormato.Close;
  qFormato.ParamByName('CODIGOCOORDINACION').asinteger:= DBLCBCoordinacion.KeyValue;
  qFormato.Open;
end;

procedure TFValorMedida.DBLCBFormatoClick(Sender: TObject);
begin
if qSecciones.Active then
   qSecciones.Close;
  qSecciones.ParamByName('CODIGOFORMATOMTTO').asinteger:= DBLCBFormato.KeyValue;
  qSecciones.Open;
end;

procedure TFValorMedida.FormCreate(Sender: TObject);
begin
  qCoordinacion.Close;
  qCoordinacion.Open;
end;

procedure TFValorMedida.bAgregarClick(Sender: TObject);
var qDatos,query:TQuery;
begin
  RegistrarValores;
  try
    if ((qValoresMedidasCODIGOCOLUMNAMEDIDA.AsString <>'') and (qMedidasCODIGOTIPOVALOR.AsString <>'') and (qValoresMedidasCODIGOVALOR.AsString<>''))then
      qValoresMedidas.Post;
    if qValoresMedidas.UpdatesPending then
      qValoresMedidas.ApplyUpdates;
      ShowMessage('Las medida ha sido asociada satisfactoriamente');
  except
    on E:Exception do
    begin
      ShowMessage(E.Message);
      qValoresMedidas.Edit;
    end;
  end;
//  DBLCBMedidas.KeyValue:=0;
end;

procedure TFValorMedida.bAceptarClick(Sender: TObject);
begin
  close;
end;

procedure TFValorMedida.qCoordinacionCODIGOODTOPERAChange(
  Sender: TField);
begin
  if qFormato.Active then
   qFormato.Close;
  qFormato.ParamByName('CODIGOCOORDINACION').asinteger:= DBLCBCoordinacion.KeyValue;
  qFormato.Open;
end;

procedure TFValorMedida.DBLCBSeccionClick(Sender: TObject);
begin
if qMedidas.Active then
  qMedidas.Close;
  qMedidas.ParamByName('CODIGOSECCIONFORMATO').asinteger:= DBLCBSeccion.KeyValue;
  qMedidas.Open;
  qValoresMedidas.Close;
  qValoresMedidas.Open;
end;

procedure TFValorMedida.DBLCBMedidasClick(Sender: TObject);
begin
  columna:=DBLCBMedidas.KeyValue;
  if qTipoValor.Active then
   qTipoValor.Close;
  if qValores.Active then
   qValores.Close;

  if qMedidasCODIGOTIPOVALOR.AsString<>'' then
  begin
    qTipoValor.ParamByName('CODIGOTIPOVALOR').AsInteger:=qMedidasCODIGOTIPOVALOR.AsInteger;
    qValores.ParamByName('CODIGOTIPOVALOR').AsInteger:=qMedidasCODIGOTIPOVALOR.AsInteger;
    qTipoValor.Open;
    qValores.Open;
//   Para llenar por rangos - falta implementarlo
    if (qTipoValorCODIGOTIPOVALOR.AsInteger=4 ) or (qTipoValorCODIGOTIPOVALOR.AsInteger=6)then
    begin
      MostrarValores;
    end
    else
    begin
      OcultarValores;
    end;
  end
  else
  begin
    qTipoValor.ParamByName('CODIGOTIPOVALOR').AsInteger:=1; // Muestra la opción NINGUNO
    ShowMessage('No existen valores asociados a esta medida');
  end;
end;

procedure TfValorMedida.mostrarValores;
begin
  rbUnico.Visible:=true;
  rbRango.Visible:=true;
  rbUnico.top:=157;
  rbRango.Top:=157;
  DBLCBValor.Visible:=false;
//  bRango.Visible:=true;
  bAgregar.Visible:=false;
end;
procedure TfValorMedida.OcultarValores;
begin
  rbUnico.Visible:=false;
  rbRango.Visible:=false;
  DBLCBValor.Visible:=true;
  DBLCBValor.left:=78;
  DBLCBValor.Top:=157;
//  bAgregar.Left:=260;
  bAgregar.Left:=360;
//  bAgregar.Left:=461;
  bAgregar.Top:=160;
  panel4.visible:=false;
  bRango.Visible:=False;
  bAgregar.Visible:=true;
end;

procedure TFValorMedida.qValoresMedidasAfterDelete(DataSet: TDataSet);
begin
  qValoresMedidas.ApplyUpdates;
  qValoresMedidas.CommitUpdates;
end;

procedure TFValorMedida.qValoresMedidasAfterPost(DataSet: TDataSet);
begin
  qValoresMedidas.ApplyUpdates;
  qValoresMedidas.CommitUpdates;
end;

procedure TfValorMedida.RegistrarValores;
var
  qDatos:TQuery;
begin
  if (qValoresVALOR.AsString <> '') then
  /////////***********
  begin
    if ((qValoresMedidasCODIGOCOLUMNAMEDIDA.AsString <>'') and (qMedidasCODIGOTIPOVALOR.AsString <>'') and (qValoresMedidasCODIGOVALOR.AsString<>''))then
    begin
      /////********
      qDatos:=TQuery.Create(Application);
      qDatos.DatabaseName:='BaseDato';
      qDatos.SQL.Add('SELECT * FROM HVE_VALORESMEDIDA WHERE CODIGOCOLUMNAMEDIDA='+ inttostr(columna));
//      qDatos.SQL.Add('SELECT * FROM HVE_VALORESMEDIDA WHERE CODIGOCOLUMNAMEDIDA='+ qValoresMedidasCODIGOCOLUMNAMEDIDA.AsString);
      qDatos.SQL.Add('AND CODIGOVALOR='+qValoresMedidasCODIGOVALOR.AsString);
      qDatos.Open;
      if(qDatos.RecordCount <> 0)then
      begin
        raise Exception.Create('Este valor ya está asociado a la medida');
      end
      else
      begin
        if(qDatos.RecordCount = 0)then
 /////////************
        qValoresMedidas.Insert;
        qdatos.SQL.Clear;
      end;//agregué
    end;
  end
  else
    raise Exception.Create('No existen valores asociados a esta medida');
end;

procedure TFValorMedida.rbUnicoClick(Sender: TObject);
begin
  bAgregar.visible:= true;
  DBLCBValor.Visible:=true;
  DBLCBValor.Left:=232;
//  DBLCBValor.Left:=260;
  bAgregar.left:=200;
//  bAgregar.left:=260;
  bAgregar.Top:=190;
  Panel4.Visible:=false;
  bAgregar.Visible:=true;
  bRango.Visible:=false;
  DBLCBValor.Width:=204;
end;

procedure TFValorMedida.rbRangoClick(Sender: TObject);
begin
  Panel4.Visible:=true;
  Panel4.Top:=184;
  bAgregar.Visible:=false;
  bRango.Visible:=true;
{  bAgregar.Left:=245;
  bAgregar.Top:=240; }
  DBLCBValor.Visible:=false;
end;

procedure TFValorMedida.qValoresMedidasBeforePost(DataSet: TDataSet);
var query:tquery;
qDatos:TQuery;
begin
  qDatos:=TQuery.Create(self);
  qDatos.DatabaseName:='BaseDato';
  qDatos.sql.text:='SELECT SQ_HVEVALORESMEDIDAS.NEXTVAL FROM DUAL';
  qDatos.Open;
  qValoresMedidasCODIGOVALORESMEDIDA.AsString:=qDatos.Fields[0].AsString;
//  qValoresMedidasCODIGOCOLUMNAMEDIDA.AsInteger:=DBLCBMedidas.KeyValue;    //Para los otros
  qValoresMedidasCODIGOCOLUMNAMEDIDA.AsInteger:=columna;
  qDatos.Close;
  qDatos.Free;
end;

procedure TFValorMedida.bRangoClick(Sender: TObject);
var
  vectorValores,vectorCodigoValor: array of integer;
  rango,vinicial,vfinal,paso,i,j,k,cont,totalvalores,valores,consecutivo,codigoValor:integer;
  valor:String;
  query1,query2,query3:TQuery;

begin
  vinicial:= strtoint(eValorInicial.Text);
  vfinal:= strtoint(eValorFinal.Text);
  paso:= strtoint(ePaso.Text);
  cont:=0;

  if (vinicial=vfinal)then
  begin
    totalvalores:=1;
  end
  else
  begin
    totalvalores:=round((vfinal-vinicial)/paso) + 1;
  end;

  SetLength(vectorValores,totalvalores);
  SetLength(vectorCodigoValor,totalvalores);
  vectorValores[0]:= vinicial ;
  valores:= vinicial;

  for j:=1 to (totalvalores)-1 do
  begin
    valores:= valores + paso;
    vectorValores[j]:= valores;
    valor:='';
  end;
  for k:=0 to Length(vectorValores) - 1 do
  begin
    query1:=TQuery.Create(Application);
    query1.DatabaseName:='BaseDato';
    query1.SQL.Add('SELECT CODIGOVALOR,VALOR FROM HVE_VALORES');
    query1.SQL.Add('WHERE CODIGOTIPOVALOR='+ qMedidasCODIGOTIPOVALOR.AsString);
    query1.SQL.Add('AND VALOR=''' + inttostr(vectorValores[k])+ '''');
    query1.Open;

    if query1.RecordCount=0 then
    begin
      query2:=TQuery.Create(Application);
      query2.DatabaseName:='BaseDato';
      query2.sql.text:='Select max(CODIGOVALOR)from hve_valores';
      query2.open;
      consecutivo:=query2.Fields[0].asInteger + 1;
      query2.Sql.Clear;
      query2.Close;
      query2.SQL.add('INSERT INTO HVE_VALORES VALUES('+ inttostr(consecutivo) + ',' +(qmedidasCODIGOTIPOVALOR.AsString)+','+ inttostr(vectorValores[k])+')');
      query2.ExecSQL;
      vectorCodigoValor[k]:= consecutivo;
      valor:=inttostr(VectorValores[k]);
    end
    else
    begin
      vectorCodigoValor[k]:=query1.Fields[0].AsInteger; //Codigo Valor
      valor:=query1.Fields[1].AsString ; // Valor
    end;
    codigoValor:=vectorCodigoValor[k];
    query3:=TQuery.Create(Application);
    query3.DatabaseName:='BaseDato';
    query3.SQL.Add('SELECT * FROM HVE_VALORESMEDIDA WHERE CODIGOCOLUMNAMEDIDA='+ inttostr(columna));
    query3.SQL.Add('AND CODIGOVALOR='+ inttostr(codigoValor));
    query3.Open;

    if(query3.RecordCount = 0)then
    begin
        qValoresMedidasCODIGOVALOR.AsInteger:=vectorCodigoValor[k];
        qValoresMedidas.Insert;
        query3.SQL.Clear;
    end
    else
    begin
      if (totalvalores=1)then
        raise Exception.Create('El valor' + valor + 'ya está asociado a esta medida')
      else
      begin
       if (totalvalores)>1 then
       begin
         ShowMessage('El valor' + valor + 'ya está asociado a esta medida');
         inc(cont)
       end;
      end;
    end;
  end;
  try
    if ((qValoresMedidasCODIGOCOLUMNAMEDIDA.AsString <>'') and (Valor <>'') and (qValoresMedidasCODIGOVALOR.AsString <>''))then
      qValoresMedidas.Post;
    if qValoresMedidas.UpdatesPending then
      qValoresMedidas.ApplyUpdates;
      eValorInicial.Text:='';
      eValorFinal.Text:='';
      epaso.Text:='';
      if (cont<>totalvalores)then
      begin
        ShowMessage('Las medidas han sido asociadas satisfactoriamente');
      end;
  except
    on E:Exception do
    begin
      ShowMessage(E.Message);
      qValoresMedidas.Edit;
    end;
  end;
end;
end.


