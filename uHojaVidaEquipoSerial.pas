//***************************************************************************
//                       Módulo de HOJA DE VIDA DE EQUIPOS
//      Permite visualizar la hoja de vida del equipo e imprimirla
//
//***************************************************************************
unit uHojaVidaEquipoSerial;

interface

uses
 Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,interexcel,
  UtdNavigator, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls, Mask, RXSplit,
  Menus, MPlayer;

type
  TfHojaVidaEquipoSerial = class(TFdSgdListaBase)
    qSeccionDatos: TQuery;
    dsSeccionDatos: TDataSource;
    Panel5: TPanel;
    Panel6: TPanel;
    dbgListaHijas: TRxDBGrid;
    Panel4: TPanel;
    Panel8: TPanel;
    dbgHojaVidaEquipo: TRxDBGrid;
    RxSplitter1: TRxSplitter;
    pmImprimir: TPopupMenu;
    qSeccionDatosCODIGOSECCIONFORMATODATOS: TFloatField;
    qSeccionDatosCODIGOFORMATOMTTODATOS: TFloatField;
    qSeccionDatosCODIGOSECCIONFORMATO: TFloatField;
    sbRefrescar: TSpeedButton;
    qSeccionDatosNOMBRESECCIONFORMATO: TStringField;
    StoredProc1: TStoredProc;
    Panel7: TPanel;
    Panel9: TPanel;
    qTipoElemento: TQuery;
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
    dsAmbito: TDataSource;
    qAmbito: TQuery;
    qAmbitoCODIGOAMBITO: TFloatField;
    qAmbitoNOMBREAMBITO: TStringField;
    qElemento: TQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    StringField2: TStringField;
    FloatField3: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    dsElemento: TDataSource;
    qSubestacion: TQuery;
    qSubestacionCODIGOSUBESTACION: TStringField;
    qSubestacionNOMBRESUBESTACION: TStringField;
    dsSubestacion: TDataSource;
    dsTipoElemento: TDataSource;
    qFormatoDatos: TQuery;
    dsFormatoDatos: TDataSource;
    QCircuito: TQuery;
    QCircuitoCODIGOCIRCUITO: TStringField;
    QCircuitoNOMBRECIRCUITO: TStringField;
    DSCircuito: TDataSource;
    qTablaElemento: TQuery;
    dsTablaElemento: TDataSource;
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
    Memo1: TMemo;
    codigo1: TListBox;
    codigo2: TListBox;
    qFormatoMtto: TQuery;
    qFormatoMttoCODIGOFORMATOMTTO: TFloatField;
    qFormatoMttoNOMBREFORMATOMTTO: TStringField;
    dsFormatoMtto: TDataSource;
    qSeccionDatosCODIGOODT: TFloatField;
    qSeccionDatosSUBACTIVIDADODT: TFloatField;
    qSeccionDatosESTADOTERMINADO: TStringField;
    qSeccionDatosFECHAREGISTRO: TDateTimeField;
    qSeccionDatosFECHAMODIFICACION: TDateTimeField;
    qSeccionDatosFECHAPRUEBA: TDateTimeField;
    Panel10: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    LabelCodigoCircuito: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    DBLCBSubestacion: TDBLookupComboBox;
    DBLCBAmbito: TDBLookupComboBox;
    Circuito: TDBLookupComboBox;
    DBLCBTipoElemento: TDBLookupComboBox;
    cbElemento: TComboBox;
    qFormatoDatosCODIGOFORMATOMTTODATOS: TFloatField;
    qFormatoDatosCODIGOFORMATOMTTO: TFloatField;
    qFormatoDatosCODIGOADMINISTRATIVO: TFloatField;
    qFormatoDatosCODIGOUSUARIOCREACION: TFloatField;
    qFormatoDatosFECHACREACION: TDateTimeField;
    qFormatoDatosCODIGOUSUARIOMODIFICACION: TFloatField;
    qFormatoDatosFECHAULTIMAMODIFICACION: TDateTimeField;
    qFormatoDatosCODIGOAMBITO: TFloatField;
    qFormatoDatosCODIGOSUBESTACION: TStringField;
    qFormatoDatosCODIGOCOORDINACION: TFloatField;
    qFormatoDatosCODIGOTIPOMTTO: TFloatField;
    qFormatoDatosCODIGOTIPOELEMENTO: TFloatField;
    qFormatoDatosCODIGOELEMENTO: TStringField;
    qFormatoDatosCODIGOCIRCUITO: TStringField;
    qFormatoDatosFECHAPRUEBA: TDateTimeField;
    qFormatoDatosCLELEMENTO1: TStringField;
    qFormatoDatosCLELEMENTO2: TStringField;
    qFormatoDatosCODIGOODT: TFloatField;
    qFormatoDatosCONSECUTIVOODT: TFloatField;
    qFormatoDatosnombreFormatoMtto: TStringField;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    Button1: TButton;
    lbSerial: TLabel;
    eSerial: TEdit;
    btnSerial: TButton;
    qFormatoDatosnombreSubestacion: TStringField;
    qFormatoDatosCODIGOHOJAVIDAEQUIPO: TFloatField;
    qFormatoDatosCODIGOMANTENIMIENTO: TFloatField;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgListaHijasDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure SBImprimirClick(Sender: TObject);
    procedure sbRefrescarClick(Sender: TObject);
    procedure DBLCBTipoElementoClick(Sender: TObject);
    procedure CircuitoClick(Sender: TObject);
    procedure cbElementoChange(Sender: TObject);
    procedure DBLCBAmbitoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LimpiarCombos;
    procedure DBLCBSubestacionClick(Sender: TObject);
    procedure cbElementoClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnSerialClick(Sender: TObject);
    procedure qFormatoDatosCalcFields(DataSet: TDataSet);
    procedure dbgHojaVidaEquipoDblClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);

  private
    Formatos_Excel: eduexcel;
  public

    sqltablaelemento: string;
    sCriterio : String;
    index:Integer;
    Lista,ListaEstadistica,ListaFrom : TStringList;
    sqlmantenimiento: string;
    procedure Filtrar;
    procedure LimpiarFiltro;
  end;
var
  fHojaVidaEquipoSerial: TfHojaVidaEquipoSerial;

implementation

uses UFormatoMttoDatos, uElementosAsociadosODT, uQRListaODTViaticos,
  uQRListaODTAuxilios, USeccionFormatoDatos,
  UQREquipoHV, UFormatoHojaVidaEquipo, UFormatoMttoDatosODT,
  USeccionFormatoDatosODT;

  {$R *.DFM}

procedure TfHojaVidaEquipoSerial.FormDestroy(Sender: TObject);
begin
 ListaFrom.Free;
 ListaEstadistica.Free;
 qFormatoDatos.free;
 qSeccionDatos.free;
 qFormatoMtto.Free;
 //FSeccionFormatoDatos.free;
  inherited;
end;

procedure TfHojaVidaEquipoSerial.FormShow(Sender: TObject);
{var
  Lista:TStrings;
begin
  Lista:=TStringList.Create();
  Lista[0]:='si';
  Lista[1]:='no';
//  Lista:= ['si','no'];
showmessage('show');
dbgHojaVidaEquipo.Columns[1].picklist:= Lista;
}
begin
  Filtrar;
end;

procedure TfHojaVidaEquipoSerial.dbgListaHijasDblClick(Sender: TObject);
var qrDatos:tquery;
begin
  if qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString <>'' then
  begin
    FSeccionFormatoDatosODT:=TFSeccionFormatoDatosODT.Create(Application);
    //qFormatosPruebas.Open;

    FSeccionFormatoDatosODT.EFormato.text:=qSeccionDatosNombreSeccionFormato.AsString;
    try
      FSeccionFormatoDatosODT.qSeccionDatos.Close;
      FSeccionFormatoDatosODT.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS='+qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
      FSeccionFormatoDatosODT.qSeccionDatos.Open;

      qrDatos:=TQuery.Create(Application);
      qrDatos.DatabaseName:='BaseDato';
    //  qrDatos.Tag:=99;
      qrDatos.SQL.Add('SELECT NOMBREUSUARIO FROM USUARIO WHERE CODIGOUSUARIO ='+ FSeccionFormatoDatosODT.qSeccionDatosCODIGOUSUARIOCREACION.AsString);
      qrDatos.Open;
      FSeccionFormatoDatosODT.Edit4.text:=qrDatos.Fields[0].AsString;
      qrDatos.SQL.Clear;
      FSeccionFormatoDatosODT.CrearTablaTemporalMedidas;

      FSeccionFormatoDatosODT.CargarTablaTemporalMedidas;
      FSeccionFormatoDatosODT.qSeccionDatos.Edit;
//      FSeccionFormatoDatosODT.qEncabezadoSeccionDatos.Edit;
      FSeccionFormatoDatosODT.TMedidas.Edit;
      FSeccionFormatoDatosODT.ShowModal;
      qSeccionDatos.close;
      qSeccionDatos.open;

    finally
       //FSeccionFormatoDatosODT.Free;
    end;
  end;


{  begin
  inherited;
  FSeccionFormatoDatos:=TFSeccionFormatoDatos.Create(Application);
  try
    FSeccionFormatoDatos.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS = ' + qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
    FSeccionFormatoDatos.qSeccionDatos.Open;
//    FSeccionFormatoDatos.BitBtnImprimir.Enabled:=true;
    FSeccionFormatoDatos.bCancelar.Visible:=false;
    FSeccionFormatoDatos.updFormatoDatos:=nil;
    FSeccionFormatoDatos.updSeccionDatos:=nil;
    FSeccionFormatoDatos.Panel3.Enabled:=false;
    FSeccionFormatoDatos.Panel8.Enabled:=false;
    FSeccionFormatoDatos.DBNavigator1.visible:=false;
    FSeccionFormatoDatos.DBNavigator2.visible:=false;
    FSeccionFormatoDatos.dbgMedidas.ReadOnly:=true;
    FSeccionFormatoDatos.Show;
  finally
  end;  }


end;


{  begin
  inherited;
  FSeccionFormatoDatos:=TFSeccionFormatoDatos.Create(Application);
  try
    FSeccionFormatoDatos.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS = ' + qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
    FSeccionFormatoDatos.qSeccionDatos.Open;
    FSeccionFormatoDatos.BitBtnImprimir.Enabled:=true;
    FSeccionFormatoDatos.bCancelar.Visible:=false;
    FSeccionFormatoDatos.updFormatoDatos:=nil;
    FSeccionFormatoDatos.updSeccionDatos:=nil;
    FSeccionFormatoDatos.Panel3.Enabled:=false;
    FSeccionFormatoDatos.Panel8.Enabled:=false;
    FSeccionFormatoDatos.DBNavigator1.visible:=false;
    FSeccionFormatoDatos.DBNavigator2.visible:=false;
    FSeccionFormatoDatos.RxDBGrid2.ReadOnly:=true;
    FSeccionFormatoDatos.Show;
  finally
  end;
end;
}

procedure TfHojaVidaEquipoSerial.FormCreate(Sender: TObject);
begin
  inherited;
  ListaFrom := TStringList.Create;
  index:=0;
end;

procedure TfHojaVidaEquipoSerial.Filtrar;
begin
end;

procedure TfHojaVidaEquipoSerial.LimpiarFiltro;
var
 nLineasExtra,i: Byte;
begin
 nLineasExtra := qFormatoDatos.SQL.Count-3;
 if nLineasExtra > 0 then
    for i:=1 to nLineasExtra do
     begin
      qFormatoDatos.SQL.Delete(2);
      qTotales.SQL.Delete(2);
     end;
end;

procedure TfHojaVidaEquipoSerial.SBFiltrarClick(Sender: TObject);
begin
  Filtrar;
  inherited;
end;

procedure TfHojaVidaEquipoSerial.SBImprimirClick(Sender: TObject);
begin
  Application.ProcessMessages;
  FQREQUIPOHV:=TFQREQUIPOHV.Create(Application);
  FQREquipoHV.QRLbAmbito.Caption:=DBLCBAmbito.Text;
  FQREquipoHV.QRLbSubestacion.Caption:=DBLCBSubestacion.Text;
  FQREquipoHV.QRLbTipoElemento.Caption:=DBLCBTipoElemento.Text;
  FQREquipoHV.QRLbCircuito.Caption:=Circuito.Text;
  FQREquipoHV.QRLbElemento.Caption:=cbElemento.text;
  FQREquipoHV.QRLbFecha.Caption := DateTimeToStr(Now);

  if FQREQUIPOHV.qFormatoDatos.Active then
    FQREquipoHV.qFormatoDatos.Open;
  FQREquipoHV.qFormatoDatos.SQL.Clear;
  FQREquipoHV.qFormatoDatos.SQL.Append(sqlmantenimiento);
  FQREQUIPOHV.qFormatoDatos.Open;

  FQREquipoHV.qNombreSubactividad.Close;
  FQREquipoHV.qNombreSubactividad.ParamByName('codigosubactividadareaodt').AsInteger:=FQREquipoHV.qSeccionDatosSUBACTIVIDADODT.AsInteger;
  FQREquipoHV.qNombreSubactividad.Open;
  FQREQUIPOHV.QuickRep1.Preview;
{
  if FQREQUIPOHV.qFormatoDatos.Active then
    FQREQUIPOHV.qFormatoDatos.close;
//  FQREQUIPOHV.qFormatoDatos.ParamByName('CODIGOELEMENTO').AsString:= cbElemento.Items[cbElemento.ItemIndex];
//  FQREQUIPOHV.qFormatoDatos.ParamByName('CLELEMENTO1').AsString:=codigo1.Items[cbElemento.ItemIndex];
  FQREQUIPOHV.qFormatoDatos.Open;
  FQREQUIPOHV.QuickRep1.Preview;
}
end;

procedure TfHojaVidaEquipoSerial.sbRefrescarClick(Sender: TObject);
begin
  inherited;
  qFormatoDatos.Close;
  qFormatoDatos.Open;
  qSeccionDatos.close;
  qSeccionDatos.Open;
end;

procedure TfHojaVidaEquipoSerial.DBLCBTipoElementoClick(Sender: TObject);
var a,B,c: string;
begin
  inherited;
  if DBLCBSubestacion.Text='' then
    Raise Exception.Create('Debe seleccionar primero una subestación');

  case DBLCBAmbito.KeyValue of
     1:begin
         if (DBLCBSubestacion.Enabled) and (DBLCBSubestacion.Text <> '') then
           begin
             if cbElemento.Enabled = false then
               cbElemento.Enabled:= true;
             if qCaracteristicasElemento.Active then
               qCaracteristicasElemento.Close;
             qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= DBLCBTipoElemento.keyvalue;
             qCaracteristicasElemento.Open;
             if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
               begin
                 if qTablaElemento.Active then
                   qTablaElemento.Close;
                 qTablaElemento.SQL.Clear;
                 ///*** INICIO ELP 1
                 if qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').AsString ='LINEA'then
                 begin
                   sqltablaelemento:= ' SELECT' +' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM ' + '  '+
                     qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring + ' order by '+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring;
                 end
                 else
                 begin
                 ///****FIN ELP 1
                    sqltablaelemento:= 'SELECT'+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                      qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION ORDER BY '+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring;
                 ///***ELP 2
                 end;
                 ///***FIN ELP 2
                 qTablaElemento.SQL.Add(sqltablaelemento);
                 memo1.Lines.Append(sqltablaelemento);

                 B:=VARTOSTR(DBLCBSubestacion.KEYVALUE);
                 ///*** ELP
                 if(AnsiCompareStr(B,'LN'))<>1 then
                 BEGIN
                   if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString='LINEA' then
                     raise Exception.Create('Debe seleccionar la Subestación Líneas')
                   else
                   begin
                     qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(DBLCBSubestacion.keyvalue);
                 //    a:= qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring;
                    end;
                  END
                  else
                  begin
                    if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString<>'LINEA' then
                      raise Exception.Create('Debe seleccionar una subestación diferente a Líneas');
                  end;
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
                     ///*** INICIO ELP 3
                     if qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').AsString ='LINEA'then
                     begin
                       sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                         qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring +' order by '+ qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring;
                     end
                     else
                     begin
                     ///***FIN ELP 3
                       sqltablaelemento:= 'SELECT'+'  '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                                        qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION order by '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring;
                       ///*** INICIO ELP 4
                     end;
                    ///*** FIN ELP 4
                     qTablaElemento.SQL.Add(sqltablaelemento);
                    memo1.Lines.Append(sqltablaelemento);
                    ///*** ELP
                    if(AnsiCompareStr(B,'LN'))<>1 then
                    BEGIN
                      if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString='LINEA' then
                        raise Exception.Create('Debe seleccionar la Subestación Líneas')
                      else
                      begin
                        qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(DBLCBSubestacion.keyvalue);
                      end;
                    END
                    else
                    begin
                      if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString<>'LINEA' then
                      raise Exception.Create('Debe seleccionar una subestación diferente a Líneas');
                    end;
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

                 ///*** INICIO ELP 1
                 if qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').AsString ='LINEA'then
                 begin
                   sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                     qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+ ' order by '+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring ;
                 end
                 else
                 begin
                 ///****FIN ELP 1
                   sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                                    qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION order by '+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring;
                 end;
                 qTablaElemento.SQL.Add(sqltablaelemento);
                 memo1.Lines.Append(sqltablaelemento);
                 ///*** ELP
                 if(AnsiCompareStr(B,'LN'))<>1 then
                 BEGIN
                   if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString='LINEA' then
                     raise Exception.Create('Debe seleccionar la Subestación Líneas')
                   else
                   begin
                     qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(DBLCBSubestacion.keyvalue);
                   end;
                 END
                 else
                 begin
                   if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString<>'LINEA' then
                    raise Exception.Create('Debe seleccionar una subestación diferente a Líneas');
                 end;
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

                     ///*** INICIO ELP 5
                   if qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').AsString ='LINEA'then
                   begin
                    sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+' '+'FROM'+' '+
                       qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring + 'order by '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring;
                   end
                   else
                   begin
                   ///****FIN ELP 5

                     sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+' '+'FROM'+' '+
                       qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION order by '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring;
                   ///***Inicio ELP 6
                   end;
                   ///****FIN ELP 6
                     qTablaElemento.SQL.Add(sqltablaelemento);
                     memo1.Lines.Append(sqltablaelemento);
                 ///*** ELP
                 if(AnsiCompareStr(B,'LN'))<>1 then
                 BEGIN
                   if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString='LINEA' then
                     raise Exception.Create('Debe seleccionar la Subestación Líneas')
                   else
                   begin
                     qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(DBLCBSubestacion.keyvalue);
                   end;
                 END
                 else
                 begin
                   if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString<>'LINEA' then
                    raise Exception.Create('Debe seleccionar una subestación diferente a Líneas');
                 end;
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
             if cbElemento.Enabled then
               cbElemento.Enabled:= false;
           end;
       end;
     2:begin
         if cbElemento.Enabled then
           cbElemento.Enabled:=False;
         circuito.Enabled:=true;
         if Circuito.Enabled = True then
         begin
           if qcircuito.Active then
             qcircuito.Close;
           qcircuito.ParamByName('codigosubestacion').value:=DBLCBSubestacion.keyvalue;
           qcircuito.open;
         end;
       end;
  end;
end;

procedure TfHojaVidaEquipoSerial.CircuitoClick(Sender: TObject);
begin
  If (DBLCBAmbito.KeyValue=2)then
  begin
    if (Circuito.Enabled) and (Circuito.Text <> '') then
    begin
     if cbElemento.Enabled = false then
       cbElemento.Enabled:= true;
     if qCaracteristicasElemento.Active then
       qCaracteristicasElemento.Close;
     qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= DBLCBTipoElemento.KeyValue;
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
         qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= Circuito.keyvalue;
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
       qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:=Circuito.keyvalue;
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
         qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= Circuito.KeyValue;
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
      if cbElemento.Enabled then
        cbElemento.Enabled:= false;
    end;
  end;
end;

procedure TfHojaVidaEquipoSerial.cbElementoChange(Sender: TObject);
begin
  inherited;
  if qFormatoDatos.Active then
    qFormatoDatos.close;
  qFormatoDatos.Open;
end;

procedure TfHojaVidaEquipoSerial.DBLCBAmbitoClick(Sender: TObject);
begin
  inherited;
  if qtipoelemento.Active then
    qtipoelemento.Close;
  qtipoelemento.ParamByName('CODIGOAMBITO').asinteger:= DBLCBAmbito.KeyValue;
  qtipoelemento.Open;
end;

procedure tfHojaVidaEquipoSerial.LimpiarCombos;
begin
 { DBLCBSubestacion.text:='';
  DBLCBTipoElemento.text:='';
  Circuito.text:='';
  cbElemento:='';
 }
end;

procedure TfHojaVidaEquipoSerial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;
procedure TfHojaVidaEquipoSerial.DBLCBSubestacionClick(Sender: TObject);
begin
  inherited;
  if DBLCBAmbito.Text=''then
    raise Exception.Create('Debe seleccionar un ámbito');
end;

procedure TfHojaVidaEquipoSerial.cbElementoClick(Sender: TObject);
var qry1,qry2,qry3: Tquery;
begin
  inherited;
  qry1:= Tquery.Create(application);
  qry1.DatabaseName:='BaseDato';
  qry1.SQL.Append('select numeroclaveselemento from pm_elemento where codigoelemento =:codigoelemento');
  qry1.ParamByName('CODIGOELEMENTO').asinteger:= DBLCBTipoElemento.KeyValue;
  qry1.Open;

  if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) then
  begin
    sqlmantenimiento:= ' select * from hve_formatomttodatos fmd where '+
                       ' fmd.clelemento1 = '''+codigo1.Items[cbElemento.ItemIndex]+'''';
  end
  else
  begin
    if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) then
    begin
      sqlmantenimiento:= ' select * from hve_formatomttodatos fmd where '+
                          ' fmd.clelemento1 = '''+codigo1.Items[cbElemento.ItemIndex]+''' and fmd.clelemento2 = '''+codigo2.Items[cbElemento.itemindex]+'''';
    end;
  end;
  qFormatoDatos.SQL.Clear;
  qFormatoDatos.SQL.Append(sqlmantenimiento);
  qFormatoDatos.Open;
end;

procedure TfHojaVidaEquipoSerial.BitBtn2Click(Sender: TObject);
var
i,m,j:integer;
Nombrearchivo: string;
UltimaRuta:string;
observaciones:string;
archivo:string;
Present: TDateTime;
Year, Month, Day, Hour, Min, Sec, MSec: Word;
begin
 //*********************************Formato de Subestaciones****************************************

Present:= Now;
DecodeDate(Present, Year, Month, Day);
DecodeTime(Present, Hour, Min, Sec, MSec);
Formatos_Excel:= eduexcel.Create;

IF qFormatoDatosCODIGOFORMATOMTTO.ASINTEGER = 6 THEN
Begin
  Formatos_Excel.AsignarPlantilla('C:\Energis4\FormatoSubestacion.xls');
  Formatos_Excel.HojaActiva('Protocolo entrega de equipos');
  Formatos_Excel.Visible(FALSE);
  qSeccionDatos.first;
  while not qSeccionDatos.eof do
  Begin
    FSeccionFormatoDatos:=TFSeccionFormatoDatos.Create(Application);
    //try
    FSeccionFormatoDatos.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS = ' + qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
    FSeccionFormatoDatos.qSeccionDatos.Open;
//    FSeccionFormatoDatos.BitBtnImprimir.Enabled:=true;
    FSeccionFormatoDatos.bCancelar.Visible:=false;
    FSeccionFormatoDatos.updFormatoDatos:=nil;
    FSeccionFormatoDatos.updSeccionDatos:=nil;
    FSeccionFormatoDatos.Panel3.Enabled:=false;
    FSeccionFormatoDatos.Panel8.Enabled:=false;
    FSeccionFormatoDatos.DBNavigator1.visible:=false;
    FSeccionFormatoDatos.DBNavigator2.visible:=false;
    FSeccionFormatoDatos.dbgMedidas.ReadOnly:=true;


    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('D8',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',86,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('D9',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',116,[loCaseInsensitive])THEN
    Formatos_Excel.Asignar('G8',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',47,[loCaseInsensitive])THEN
    Formatos_Excel.Asignar('G9',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);

    //ESTADO OPERATIVO
    iF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',3,[loCaseInsensitive]) THEN
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring= 'FUNCIONAMIENTO NORMAL' THEN
        Formatos_Excel.Asignar('C14',Formatos_Excel.Obtener('C14')+'  '+'X');
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring= 'PENDIENTE REPARACION' THEN
        Formatos_Excel.Asignar('E14',Formatos_Excel.Obtener('E14')+'  '+'X');
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring= 'FUERA DE SERVICIO' THEN
        Formatos_Excel.Asignar('F14',Formatos_Excel.Obtener('F14')+'  '+'X');
    end;

    //CONDICIONES INICIALES
    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',111,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
    Formatos_Excel.Asignar('C17',Formatos_Excel.Obtener('C17')+'                       '+'X')
    ELSE
    Formatos_Excel.Asignar('C17',Formatos_Excel.Obtener('C17')+'                             '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',298,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'NORMAL' THEN
    Formatos_Excel.Asignar('C18',Formatos_Excel.Obtener('C18')+'         '+'X')
    ELSE
    Formatos_Excel.Asignar('C18',Formatos_Excel.Obtener('C18')+'               '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',299,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'SI' THEN
    Formatos_Excel.Asignar('C19',Formatos_Excel.Obtener('C19')+'     '+'X')
    ELSE
    Formatos_Excel.Asignar('C19',Formatos_Excel.Obtener('C19')+'           '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',300,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
    Formatos_Excel.Asignar('C20',Formatos_Excel.Obtener('C20')+'                    '+'X')
    ELSE
    Formatos_Excel.Asignar('C20',Formatos_Excel.Obtener('C20')+'                          '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',301,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
    Formatos_Excel.Asignar('E17',Formatos_Excel.Obtener('E17')+'           '+'X')
    ELSE
    Formatos_Excel.Asignar('E17',Formatos_Excel.Obtener('E17')+'                    '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',302,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
    Formatos_Excel.Asignar('E18',Formatos_Excel.Obtener('E18')+'                      '+'X')
    ELSE
    Formatos_Excel.Asignar('E18',Formatos_Excel.Obtener('E18')+'                               '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',303,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
    Formatos_Excel.Asignar('E19',Formatos_Excel.Obtener('E19')+'                '+'X')
    ELSE
    Formatos_Excel.Asignar('E19',Formatos_Excel.Obtener('E19')+'                         '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',304,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
    Formatos_Excel.Asignar('E20',Formatos_Excel.Obtener('E20')+'     '+'X')
    ELSE
    Formatos_Excel.Asignar('E20',Formatos_Excel.Obtener('E20')+'              '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',305,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'NORMAL' THEN
    Formatos_Excel.Asignar('F17',Formatos_Excel.Obtener('F17')+'                  '+'X')
    ELSE
    Formatos_Excel.Asignar('F17',Formatos_Excel.Obtener('F17')+'                          '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',306,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'NORMAL' THEN
    Formatos_Excel.Asignar('F18',Formatos_Excel.Obtener('F18')+'          '+'X')
    ELSE
    Formatos_Excel.Asignar('F18',Formatos_Excel.Obtener('F18')+'                  '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',307,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
    Formatos_Excel.Asignar('F19',Formatos_Excel.Obtener('F19')+'       '+'X')
    ELSE
    Formatos_Excel.Asignar('F19',Formatos_Excel.Obtener('F19')+'               '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',308,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
    Formatos_Excel.Asignar('F20',Formatos_Excel.Obtener('F20')+'              '+'X')
    ELSE
    Formatos_Excel.Asignar('F20',Formatos_Excel.Obtener('F20')+'                      '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',310,[loCaseInsensitive]);
    Formatos_Excel.Asignar('H17','VALOR:'+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',309,[loCaseInsensitive]);
    Formatos_Excel.Asignar('C22',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);


    //TRABAJOS REALIZADOS
    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',311,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'INSPECCION' THEN
      Formatos_Excel.Asignar('C27',Formatos_Excel.Obtener('C27')+'  '+'X');

    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'MANTENIMIENTO' THEN
      Formatos_Excel.Asignar('E27',Formatos_Excel.Obtener('E27')+'  '+'X');

    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'REPARACION' THEN
      Formatos_Excel.Asignar('F27',Formatos_Excel.Obtener('F27')+'  '+'X');

    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'MONTAJE' THEN
      Formatos_Excel.Asignar('H27',Formatos_Excel.Obtener('H27')+'  '+'X');


    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',98,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('C29',Formatos_Excel.Obtener('C29')+'              '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',285,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('C30',Formatos_Excel.Obtener('C30')+'        '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',99,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('C31',Formatos_Excel.Obtener('C31')+' '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',104,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('C32',Formatos_Excel.Obtener('C32')+'    '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',102,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('E29',Formatos_Excel.Obtener('E29')+'                  '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',109,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('E30',Formatos_Excel.Obtener('E30')+'                 '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',113,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('E31',Formatos_Excel.Obtener('E31')+'           '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',282,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('E32',Formatos_Excel.Obtener('E32')+'           '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',107,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('F29',Formatos_Excel.Obtener('F29')+'            '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',283,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('F30',Formatos_Excel.Obtener('F30')+'     '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',284,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('F31',Formatos_Excel.Obtener('F31')+'           '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',103,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('F32',Formatos_Excel.Obtener('F32')+'                 '+'X');

  //  RESISTENCIA CONTACTOS
    //Formatos_Excel.Asignar('H29',Formatos_Excel.Obtener('F32')+'');
    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',286,[loCaseInsensitive]);
    Formatos_Excel.Asignar('D35',Formatos_Excel.Obtener('D35')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',290,[loCaseInsensitive]);
    Formatos_Excel.Asignar('D36',Formatos_Excel.Obtener('D36')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',287,[loCaseInsensitive]);
    Formatos_Excel.Asignar('E35',Formatos_Excel.Obtener('E35')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',291,[loCaseInsensitive]);
    Formatos_Excel.Asignar('E36',Formatos_Excel.Obtener('E36')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',288,[loCaseInsensitive]);
    Formatos_Excel.Asignar('F35',Formatos_Excel.Obtener('F35')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',292,[loCaseInsensitive]);
    Formatos_Excel.Asignar('F36',Formatos_Excel.Obtener('F36')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',289,[loCaseInsensitive]);
    Formatos_Excel.Asignar('H35',Formatos_Excel.Obtener('H35')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',293,[loCaseInsensitive]);
    Formatos_Excel.Asignar('H36',Formatos_Excel.Obtener('H36')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

     //ESTADO FINAL DE LOS EQUIPOS
    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',271,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'OPERACION NORMAL' THEN
    Formatos_Excel.Asignar('C44',Formatos_Excel.Obtener('C44')+'  X');
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'PENDIENTE REPARACION' THEN
    Formatos_Excel.Asignar('E44',Formatos_Excel.Obtener('E44')+'  X');
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'FUERA DE SERVICIO' THEN
    Formatos_Excel.Asignar('F44',Formatos_Excel.Obtener('F44')+'  X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',297,[loCaseInsensitive]);
    Formatos_Excel.Asignar('C46',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    qSeccionDatos.NEXT;
    FSeccionFormatoDatos.free;
  //finally
  //END;
  End;


 //************************COMUNES*****************************************
  //*************************************************************************
  {WorkBook := oXL.ActiveWorkBook ;
  WorkSheet := WorkBook.ActiveSheet;}


  archivo:= 'C:\energis4\Formato_'+ IntToStr(Day) + '_' + IntToStr(Month) + '_' + IntToStr(Year) + ' '+ IntToStr(Hour)+ 'y' + IntToStr(Min)+ '.XLS';
  Formatos_Excel.Salvar(archivo);
  Formatos_Excel.Visible(true);
  Formatos_Excel.Terminar;
  Formatos_Excel.Free;

end;
end;

procedure TfHojaVidaEquipoSerial.BitBtn1Click(Sender: TObject);
var
i,m,j:integer;
Nombrearchivo, ComentariosHistoricos: string;
UltimaRuta:string;
observaciones:string;
archivo:string;
Present: TDateTime;
Year, Month, Day, Hour, Min, Sec, MSec: Word;
begin
 //*********************************Formato de Subestaciones****************************************

Present:= Now;
DecodeDate(Present, Year, Month, Day);
DecodeTime(Present, Hour, Min, Sec, MSec);
Formatos_Excel:= eduexcel.Create;

IF qFormatoDatosCODIGOFORMATOMTTO.ASINTEGER = 6 THEN
Begin
  Formatos_Excel.AsignarPlantilla('C:\Energis4\FormatoSubestacion.xls');
  Formatos_Excel.HojaActiva('Protocolo entrega de equipos');
  Formatos_Excel.Visible(FALSE);
  qSeccionDatos.first;
  while not qSeccionDatos.eof do
  Begin
    FSeccionFormatoDatos:=TFSeccionFormatoDatos.Create(Application);
    //try
    FSeccionFormatoDatos.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS = ' + qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
    FSeccionFormatoDatos.qSeccionDatos.Open;
//    FSeccionFormatoDatos.BitBtnImprimir.Enabled:=true;
    FSeccionFormatoDatos.bCancelar.Visible:=false;
    FSeccionFormatoDatos.updFormatoDatos:=nil;
    FSeccionFormatoDatos.updSeccionDatos:=nil;
    FSeccionFormatoDatos.Panel3.Enabled:=false;
    FSeccionFormatoDatos.Panel8.Enabled:=false;
    FSeccionFormatoDatos.DBNavigator1.visible:=false;
    FSeccionFormatoDatos.DBNavigator2.visible:=false;
    FSeccionFormatoDatos.dbgMedidas.ReadOnly:=true;


    {IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('D8',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',86,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('D9',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',116,[loCaseInsensitive])THEN
    Formatos_Excel.Asignar('G8',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',47,[loCaseInsensitive])THEN
    Formatos_Excel.Asignar('G9',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);}

    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',45,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('D8',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',336,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('D9',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',337,[loCaseInsensitive])THEN
    Formatos_Excel.Asignar('G8',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',338,[loCaseInsensitive])THEN
    Formatos_Excel.Asignar('G9',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    //ESTADO OPERATIVO
    iF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',3,[loCaseInsensitive]) THEN
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring= 'FUNCIONAMIENTO NORMAL' THEN
        Formatos_Excel.Asignar('C14',Formatos_Excel.Obtener('C14')+'  '+'X');
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring= 'PENDIENTE REPARACION' THEN
        Formatos_Excel.Asignar('E14',Formatos_Excel.Obtener('E14')+'  '+'X');
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring= 'FUERA DE SERVICIO' THEN
        Formatos_Excel.Asignar('F14',Formatos_Excel.Obtener('F14')+'  '+'X');
    end;

    //CONDICIONES INICIALES
    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',111,[loCaseInsensitive]) THEN
    BEGIN
      iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('C17',Formatos_Excel.Obtener('C17')+'                       '+'X')
      ELSE
        Formatos_Excel.Asignar('C17',Formatos_Excel.Obtener('C17')+'                             '+'X');
    END;
    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',298,[loCaseInsensitive]) THEN
    BEGIN
      iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'NORMAL' THEN
      Formatos_Excel.Asignar('C18',Formatos_Excel.Obtener('C18')+'         '+'X')
      ELSE
      Formatos_Excel.Asignar('C18',Formatos_Excel.Obtener('C18')+'              '+'X');
    END;
    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',299,[loCaseInsensitive]) THEN
    Begin
      iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'SI' THEN
      Formatos_Excel.Asignar('C19',Formatos_Excel.Obtener('C19')+'     '+'X')
      ELSE
      Formatos_Excel.Asignar('C19',Formatos_Excel.Obtener('C19')+'           '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',300,[loCaseInsensitive]) then
    Begin
      iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
      Formatos_Excel.Asignar('C20',Formatos_Excel.Obtener('C20')+'                    '+'X')
      ELSE
      Formatos_Excel.Asignar('C20',Formatos_Excel.Obtener('C20')+'                          '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',301,[loCaseInsensitive]) then
    Begin
      iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
      Formatos_Excel.Asignar('E17',Formatos_Excel.Obtener('E17')+'           '+'X')
      ELSE
      Formatos_Excel.Asignar('E17',Formatos_Excel.Obtener('E17')+'                    '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',302,[loCaseInsensitive]) then
    Begin
      iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
      Formatos_Excel.Asignar('E18',Formatos_Excel.Obtener('E18')+'                      '+'X')
      ELSE
      Formatos_Excel.Asignar('E18',Formatos_Excel.Obtener('E18')+'                               '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',303,[loCaseInsensitive]) then
    Begin
      iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
      Formatos_Excel.Asignar('E19',Formatos_Excel.Obtener('E19')+'                '+'X')
      ELSE
      Formatos_Excel.Asignar('E19',Formatos_Excel.Obtener('E19')+'                         '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',304,[loCaseInsensitive]) then
    Begin
      iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
      Formatos_Excel.Asignar('E20',Formatos_Excel.Obtener('E20')+'     '+'X')
      ELSE
      Formatos_Excel.Asignar('E20',Formatos_Excel.Obtener('E20')+'              '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',305,[loCaseInsensitive]) then
    begin
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'NORMAL' THEN
    Formatos_Excel.Asignar('F17',Formatos_Excel.Obtener('F17')+'                  '+'X')
    ELSE
    Formatos_Excel.Asignar('F17',Formatos_Excel.Obtener('F17')+'                          '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',306,[loCaseInsensitive]) then
    begin
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'NORMAL' THEN
    Formatos_Excel.Asignar('F18',Formatos_Excel.Obtener('F18')+'          '+'X')
    ELSE
    Formatos_Excel.Asignar('F18',Formatos_Excel.Obtener('F18')+'                  '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',307,[loCaseInsensitive]) then
    Begin
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
    Formatos_Excel.Asignar('F19',Formatos_Excel.Obtener('F19')+'       '+'X')
    ELSE
    Formatos_Excel.Asignar('F19',Formatos_Excel.Obtener('F19')+'               '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',308,[loCaseInsensitive]) then
    begin
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
    Formatos_Excel.Asignar('F20',Formatos_Excel.Obtener('F20')+'              '+'X')
    ELSE
    Formatos_Excel.Asignar('F20',Formatos_Excel.Obtener('F20')+'                      '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',310,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('H17','VALOR:'+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',309,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('C22',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    //TRABAJOS REALIZADOS
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',311,[loCaseInsensitive]) then
    Begin
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'INSPECCION' THEN
      Formatos_Excel.Asignar('C27',Formatos_Excel.Obtener('C27')+'  '+'X');

    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'MANTENIMIENTO' THEN
      Formatos_Excel.Asignar('E27',Formatos_Excel.Obtener('E27')+'  '+'X');

    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'REPARACION' THEN
      Formatos_Excel.Asignar('F27',Formatos_Excel.Obtener('F27')+'  '+'X');

    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'MONTAJE' THEN
      Formatos_Excel.Asignar('H27',Formatos_Excel.Obtener('H27')+'  '+'X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',98,[loCaseInsensitive]) then
    Begin
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('C29',Formatos_Excel.Obtener('C29')+'              '+'X');
    end;

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',285,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('C30',Formatos_Excel.Obtener('C30')+'        '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',99,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('C31',Formatos_Excel.Obtener('C31')+' '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',104,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('C32',Formatos_Excel.Obtener('C32')+'    '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',102,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('E29',Formatos_Excel.Obtener('E29')+'                  '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',109,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('E30',Formatos_Excel.Obtener('E30')+'                 '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',113,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('E31',Formatos_Excel.Obtener('E31')+'           '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',282,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('E32',Formatos_Excel.Obtener('E32')+'           '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',107,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('F29',Formatos_Excel.Obtener('F29')+'            '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',283,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('F30',Formatos_Excel.Obtener('F30')+'     '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',284,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('F31',Formatos_Excel.Obtener('F31')+'           '+'X');

    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',103,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'SI' THEN
    Formatos_Excel.Asignar('F32',Formatos_Excel.Obtener('F32')+'                 '+'X');


    //  RESISTENCIA CONTACTOS
    //Formatos_Excel.Asignar('H29',Formatos_Excel.Obtener('F32')+'');
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',286,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('D35',Formatos_Excel.Obtener('D35')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',290,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('D36',Formatos_Excel.Obtener('D36')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',287,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('E35',Formatos_Excel.Obtener('E35')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',291,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('E36',Formatos_Excel.Obtener('E36')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',288,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('F35',Formatos_Excel.Obtener('F35')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',292,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('F36',Formatos_Excel.Obtener('F36')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',289,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('H35',Formatos_Excel.Obtener('H35')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',293,[loCaseInsensitive]) then
    Formatos_Excel.Asignar('H36',Formatos_Excel.Obtener('H36')+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

     //ESTADO FINAL DE LOS EQUIPOS
    FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',271,[loCaseInsensitive]);
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'OPERACION NORMAL' THEN
    Formatos_Excel.Asignar('C44',Formatos_Excel.Obtener('C44')+'  X');
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'PENDIENTE REPARACION' THEN
    Formatos_Excel.Asignar('E44',Formatos_Excel.Obtener('E44')+'  X');
    iF FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.AsSTRING  = 'FUERA DE SERVICIO' THEN
    Formatos_Excel.Asignar('F44',Formatos_Excel.Obtener('F44')+'  X');

    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',297,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('C46',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',339,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('C52',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    IF FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',340,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('C54',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    qSeccionDatos.NEXT;
    FSeccionFormatoDatos.free;

  End;

end;

  //*********************************************Formato de Aceites**********************************************************
IF qFormatoDatosCODIGOFORMATOMTTO.ASINTEGER = 2 THEN
Begin
  Formatos_Excel.AsignarPlantilla('C:\Energis4\FormatoAceites.xls');
  Formatos_Excel.HojaActiva('Fisicoquimicos');
  Formatos_Excel.Visible(FALSE);
  qSeccionDatos.first;
  while not qSeccionDatos.eof do
  Begin
    FSeccionFormatoDatos:=TFSeccionFormatoDatos.Create(Application);
    //try
    SHOWMESSAGE(qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString);
    FSeccionFormatoDatos.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS = ' + qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
    FSeccionFormatoDatos.qSeccionDatos.Open;
//    FSeccionFormatoDatos.BitBtnImprimir.Enabled:=true;
    FSeccionFormatoDatos.bCancelar.Visible:=false;
    FSeccionFormatoDatos.updFormatoDatos:=nil;
    FSeccionFormatoDatos.updSeccionDatos:=nil;
    FSeccionFormatoDatos.Panel3.Enabled:=false;
    FSeccionFormatoDatos.Panel8.Enabled:=false;
    FSeccionFormatoDatos.DBNavigator1.visible:=false;
    FSeccionFormatoDatos.DBNavigator2.visible:=false;
    FSeccionFormatoDatos.dbgMedidas.ReadOnly:=true;


      //*********Encabezado***************

    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',13,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('D5',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',116,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('D6',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',117,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('D7',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',17,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('D8',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',119,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('I5',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',120,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('I6',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',121,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('I7',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',122,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('I8',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',150,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('D32',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    {IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('M14',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('C33',Formatos_Excel.Obtener('C33')+'');
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('G32',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('K32',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('C37',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('L37',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring); }


    //***********************ANALISIS CROMATOGRAFICO/***************************
    Formatos_Excel.HojaActiva('CROMATOGRAFIA');
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('C53',{PROFESIONAL ASISTENTE}FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('K53',{COORDINADOR}FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('I34',{CUADRO ANALISIS CROMATOGRAFICO ARRIBA}FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',45,[loCaseInsensitive]) THEN
      Formatos_Excel.Asignar('I37',{CUADRO ANALISIS CROMATOGRAFICO ABAJO}FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    qsecciondatos.Next;
  end;

  qFormatoDatos.last;
  i:= 0;
  while not qFormatoDatos.bof do
  Begin
    If qFormatoDatosCODIGOFORMATOMTTO.asinteger= 2 then
    Begin
      FSeccionFormatoDatos:=TFSeccionFormatoDatos.Create(Application);
      //try
      SHOWMESSAGE(qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString);
      FSeccionFormatoDatos.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS = ' + qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
      FSeccionFormatoDatos.qSeccionDatos.Open;
//      FSeccionFormatoDatos.BitBtnImprimir.Enabled:=true;
      FSeccionFormatoDatos.bCancelar.Visible:=false;
      FSeccionFormatoDatos.updFormatoDatos:=nil;
      FSeccionFormatoDatos.updSeccionDatos:=nil;
      FSeccionFormatoDatos.Panel3.Enabled:=false;
      FSeccionFormatoDatos.Panel8.Enabled:=false;
      FSeccionFormatoDatos.DBNavigator1.visible:=false;
      FSeccionFormatoDatos.DBNavigator2.visible:=false;
      FSeccionFormatoDatos.dbgMedidas.ReadOnly:=true;

      //*************cuadro Analisis Cromatografico****************************
      Formatos_Excel.HojaActiva('CROMATOGRAFIA');
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',62,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,12,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {Fecha de analisis}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',63,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,14,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{CO2 DIOXIDO DE CARBONO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',64,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,15,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{CH4 METANO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',65,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,16,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{CO MONOXIDO DE CARBONO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',66,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,17,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{C2H2 ACETILENO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',67,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,18,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{C2H4 ETILENO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',68,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,19,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{C2H6 ETANO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',69,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,20,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{C3H6  PROPILENO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',70,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,21,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{C3H8 PROPANO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',71,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,22,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{H2 HIDROGENO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',72,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,23,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{O2 OXIGENO}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',73,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,24,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{H2O en Papel}

      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',314,[loCaseInsensitive]) then
        ComentariosHistoricos:= ComentariosHistoricos + FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring;

      Formatos_Excel.Asignar(5+i,24,Comentarioshistoricos);{Comentarios Historicos}

      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',315,[loCaseInsensitive]) then
        Formatos_Excel.Asignar('I37',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{Diagnostico}

  //*************cuadro Analisis FisicoQuimico****************************
      Formatos_Excel.HojaActiva('Fisicoquimicos');
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',288,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,12,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);  {Fecha de analisis}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',49,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,14,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {Temperatura de aceite Inferior}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',51,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,15,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);{Multiplicador Meyers}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',52,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,16,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);   {Color D1500}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',53,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,17,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {Gravedad Especifica}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',54,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,18,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);  {Viscocidad Comparativa}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',55,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,19,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {Examen Visual}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',56,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,20,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);   {Contenido de humedad}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',57,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,21,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {Tension Interfacial}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',58,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,22,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);  {Rigides Dielectrica}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',59,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,23,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {Indice de Acides}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',60,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,24,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {H2O en Papel}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',61,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,25,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {Calidad del Aceite}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',312,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,26,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring); {% saturacion relativa}
      if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',81,[loCaseInsensitive]) then
        Formatos_Excel.Asignar(5+i,27,FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);   {Factor de Ptencia}

      FSeccionFormatoDatos.free;
    End;
    i:=i+1;
    qFormatoDatos.prior;
  end;
end;

  IF qFormatoDatosCODIGOFORMATOMTTO.ASINTEGER = 11 THEN
Begin
  Formatos_Excel.AsignarPlantilla('C:\Energis4\Formatomantenimietolineas.xls');
  Formatos_Excel.HojaActiva('Hoja1');
  Formatos_Excel.Visible(FALSE);
  qSeccionDatos.first;
  while not qSeccionDatos.eof do
  Begin
    FSeccionFormatoDatos:=TFSeccionFormatoDatos.Create(Application);
    //try
    SHOWMESSAGE(qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString);
    FSeccionFormatoDatos.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS = ' + qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
    FSeccionFormatoDatos.qSeccionDatos.Open;
//    FSeccionFormatoDatos.BitBtnImprimir.Enabled:=true;
    FSeccionFormatoDatos.bCancelar.Visible:=false;
    FSeccionFormatoDatos.updFormatoDatos:=nil;
    FSeccionFormatoDatos.updSeccionDatos:=nil;
    FSeccionFormatoDatos.Panel3.Enabled:=false;
    FSeccionFormatoDatos.Panel8.Enabled:=false;
    FSeccionFormatoDatos.DBNavigator1.visible:=false;
    FSeccionFormatoDatos.DBNavigator2.visible:=false;
    FSeccionFormatoDatos.dbgMedidas.ReadOnly:=true;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',211,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E7','X')
      ELSE
        Formatos_Excel.Asignar('G7','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',317,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('H7','Linea'+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',319,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E8','X')
      ELSE
        Formatos_Excel.Asignar('G8','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',318,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('H8','Linea'+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',320,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D9',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);



    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',212,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E10','X')
      ELSE
        Formatos_Excel.Asignar('G10','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',321,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D11','Linea'+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);



    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',213,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E12','X')
      ELSE
        Formatos_Excel.Asignar('G12','X');
    end;

    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',214,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E14','X')
      ELSE
        Formatos_Excel.Asignar('G14','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',322,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D15','Linea'+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    //VANO
        if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',215,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E16','X')
      ELSE
        Formatos_Excel.Asignar('G16','X');
    end;
    Formatos_Excel.Asignar('H16','Linea ');
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',325,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('H16',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    Formatos_Excel.Asignar('H16',' Y ');
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',327,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('H16',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);


    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',324,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E17','X')
      ELSE
        Formatos_Excel.Asignar('G17','X');
    end;
    Formatos_Excel.Asignar('H17','Linea ');
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',326,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('H17',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    Formatos_Excel.Asignar('H17',' Y ');
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',328,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('H17',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    //VANO OBSERVACION
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',329,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D18',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);

    //pODA eSTRUCTURA
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',218,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E19','X')
      ELSE
        Formatos_Excel.Asignar('G19','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',323,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D20','Linea'+FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);



    //PODA CAMINO DE ACCESO
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',219,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E21','X')
      ELSE
        Formatos_Excel.Asignar('G21','X');
    end;


    //lIMPIEZA CANAL DE DESAGUE
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',220,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E23','X')
      ELSE
        Formatos_Excel.Asignar('G23','X');
    end;

    //pODA VANO
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',221,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E25','X')
      ELSE
        Formatos_Excel.Asignar('G25','X');
    end;
    Formatos_Excel.Asignar('H25','Linea ');
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',222,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('H25',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    Formatos_Excel.Asignar('H25',' Y ');
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',223,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('H25',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',330,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D26',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    //PUESTA A TIERRA
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',224,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E27','X')
      ELSE
        Formatos_Excel.Asignar('G27','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',332,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D28',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    //MEDIDA DE TIERRA
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',225,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D29',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    //PROBLEMAS ESTRUCTURA
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',226,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E30','X')
      ELSE
        Formatos_Excel.Asignar('G30','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',333,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D31',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    //PROBLEMAS DESLIZAMIENTOS
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',227,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E32','X')
      ELSE
        Formatos_Excel.Asignar('G32','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',334,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D33',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    //PUNTOS CALIENTES
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',228,[loCaseInsensitive]) then
    Begin
      if FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring = 'BUENO' THEN
        Formatos_Excel.Asignar('E34','X')
      ELSE
        Formatos_Excel.Asignar('G34','X');
    end;
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',335,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D35',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    //OBSERVACIONES
    if FSECCIONFORMATODATOS.qValorMedidaDetalle.Locate('codigocolumnamedida',229,[loCaseInsensitive]) then
       Formatos_Excel.Asignar('D36',FSECCIONFORMATODATOS.qValorMedidaDetalleVALOR.asstring);
    //RESPONSABLE
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',105,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('E41',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    //FECHA
    IF FSECCIONFORMATODATOS.QENCABEZADODATOS.Locate('CODIGOENCABEZADOFORMATO',91,[loCaseInsensitive]) THEN
    Formatos_Excel.Asignar('E43',FSECCIONFORMATODATOS.QENCABEZADODATOSvalorencabezadoformato.asstring);
    qSeccionDatos.NEXT;
  END;
END;
                //************************COMUNES*****************************************
  //*************************************************************************
  {WorkBook := oXL.ActiveWorkBook ;
  WorkSheet := WorkBook.ActiveSheet;}


  archivo:= 'C:\energis4\Formato_'+ IntToStr(Day) + '_' + IntToStr(Month) + '_' + IntToStr(Year) + ' '+ IntToStr(Hour)+ 'y' + IntToStr(Min)+ '.XLS';
  Formatos_Excel.Salvar(archivo);
  Formatos_Excel.Visible(true);
  Formatos_Excel.Terminar;
  Formatos_Excel.Free;
  Showmessage('El Formato a sido exportado a Excel, vaya a la carpeta c:\energis4 e imprimalo.');
end;

procedure TfHojaVidaEquipoSerial.Button1Click(Sender: TObject);
begin
  inherited;
  FFormatoHojaVidaEquipo:=TFFormatoHojaVidaEquipo.Create(Application);
  FformatoHojaVidaEquipo.Show;
  try
{    ShowMessage('115');
    if not FFormatoHojaVidaEquipo.qHojaVidaEquipo.Database.InTransaction then
      ShowMessage('1165');
      FFormatoHojaVidaEquipo.qHojaVidaEquipo.Database.StartTransaction;
       ShowMessage('116');
 }
 {   FFormatoHojaVidaEquipo.qHojaVidaEquipo.Open;
    FFormatoHojaVidaEquipo.qHojaVidaEquipo.Insert;
    FFormatoHojaVidaEquipo.qHojaVidaEquipo.Post;
    FFormatoHojaVidaEquipo.qHojaVidaEquipo.Edit;
  }
{    if FFormatoHojaVidaEquipo.ShowModal=MROK then
    begin
      FFormatoHojaVidaEquipo.qHojaVidaEquipo.Database.Commit;
    end
    else
    begin
      FFormatoHojaVidaEquipo.qHojaVidaEquipo.Database.Rollback;
    end;
    }
  finally
//    FFormatoHojaVidaEquipo.Free;
  end;

{    FSeccionFormatoDatos.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS = ' + qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
    FSeccionFormatoDatos.qSeccionDatos.Open;
    FSeccionFormatoDatos.BitBtnImprimir.Enabled:=true;
    FSeccionFormatoDatos.bCancelar.Visible:=false;
    FSeccionFormatoDatos.updFormatoDatos:=nil;
    FSeccionFormatoDatos.updSeccionDatos:=nil;
    FSeccionFormatoDatos.Panel3.Enabled:=false;
    FSeccionFormatoDatos.Panel8.Enabled:=false;
    FSeccionFormatoDatos.DBNavigator1.visible:=false;
    FSeccionFormatoDatos.DBNavigator2.visible:=false;
    FSeccionFormatoDatos.RxDBGrid2.ReadOnly:=true;
    FSeccionFormatoDatos.Show;}
  end;

procedure TfHojaVidaEquipoSerial.btnSerialClick(Sender: TObject);
var qry1,qry2,qry3: Tquery;
begin
  inherited;
  qry1:= Tquery.Create(application);
  qry1.DatabaseName:='BaseDato';
  qry1.SQL.Add('select codigohojavidaequipo from hve_hojavidaequipo where codigotipoelemento=:codigotipoelemento');
  qry1.SQL.Add('and serial=' + eserial.text);
  qry1.ParamByName('CODIGOTIPOELEMENTO').asinteger:= DBLCBTipoElemento.KeyValue;
  qry1.Open;
  sqlmantenimiento:= ' select * from hve_formatomttodatos where codigohojavidaequipo='+ qry1.Fields[0].AsString;
  qFormatoDatos.SQL.Clear;
  qFormatoDatos.SQL.Append(sqlmantenimiento);
  qFormatoDatos.Open;
end;

procedure TfHojaVidaEquipoSerial.qFormatoDatosCalcFields(
  DataSet: TDataSet);
  var query1:TQuery;
begin
  inherited;
  query1:=TQuery.Create(Application);
  query1.DatabaseName:='Basedato';
  query1.Close;
  query1.SQL.Add('SELECT NOMBRESUBESTACION FROM SUBESTACION WHERE CODIGOSUBESTACION='''+ qFormatoDatosCODIGOSUBESTACION.AsString+'''');
  query1.Open;
  qFormatoDatosnombreSubestacion.AsString:=query1.Fields[0].AsString;
end;

procedure TfHojaVidaEquipoSerial.dbgHojaVidaEquipoDblClick(
  Sender: TObject);
begin
  if qFormatoDatosCODIGOFORMATOMTTODATOS.AsString <>'' then
  begin
    FFormatoMttoDatosODT:=TFFormatoMttoDatosODT.Create(Application);
    FFormatoMttoDatosODT.mttoanterior:=false;
    //qFormatosPruebas.Open;
    if FFormatoMttoDatosODT.qMantenimientoDatos.Active then
      FFormatoMttoDatosODT.qMantenimientoDatos.close;
    FFormatoMttoDatosODT.qMantenimientoDatos.ParamByName('CODIGOMANTENIMIENTO').AsFloat:= qFormatoDatosCODIGOMANTENIMIENTO.AsFloat;
    FFormatoMttoDatosODT.qMantenimientoDatos.Open;
      ////  ELEMENTO
    if FFormatoMttoDatosODT.qPmelemento.Active then
      FFormatoMttoDatosODT.qPmelemento.Close;
    FFormatoMttoDatosODT.qPmelemento.ParamByName('CODIGOELEMENTOMANTENIMIENTO').AsFloat:= qFormatoDatosCODIGOMANTENIMIENTO.AsFloat;
    FFormatoMttoDatosODT.qPmelemento.Open;

    FFormatoMttoDatosODT.CODIGOFORMATOMANTENIMIENTO  := qFormatodatosCODIGOFORMATOMTTO.Asstring;

    try
      FFormatoMttoDatosODT.qFormatoDatos.Close;
      FFormatoMttoDatosODT.qFormatoDatos.SQL.Text:='SELECT * FROM HVE_FORMATOMTTODATOS WHERE CODIGOFORMATOMTTODATOS = ' + qFormatoDatosCODIGOFORMATOMTTODATOS.AsString;
      FFormatoMttoDatosODT.qFormatoDatos.Open;
      FFormatoMttoDatosODT.qFormatoDatos.Edit;

      if FFormatoMttoDatosODT.ShowModal=MrOK then
      begin
        qFormatoDatos.close;
        qFormatoDatos.open;
      end
    finally
      FFormatoMttoDatosODT.Free;
    end;
  end

end;

procedure TfHojaVidaEquipoSerial.sbExportarClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    CVS1.DataSet := qFormatoDatos;
    CVS1.FileNameText := SaveDialog1.FileName;
    CVS1.TableExport;
  end;
end;


procedure TfHojaVidaEquipoSerial.SpeedButton1Click(Sender: TObject);
begin
  FFormatoHojaVidaEquipo:=TFFormatoHojaVidaEquipo.Create(Application);
  FformatoHojaVidaEquipo.Show;
  try
{    ShowMessage('115');
    if not FFormatoHojaVidaEquipo.qHojaVidaEquipo.Database.InTransaction then
      ShowMessage('1165');
      FFormatoHojaVidaEquipo.qHojaVidaEquipo.Database.StartTransaction;
       ShowMessage('116');
 }
 {   FFormatoHojaVidaEquipo.qHojaVidaEquipo.Open;
    FFormatoHojaVidaEquipo.qHojaVidaEquipo.Insert;
    FFormatoHojaVidaEquipo.qHojaVidaEquipo.Post;
    FFormatoHojaVidaEquipo.qHojaVidaEquipo.Edit;
  }
{    if FFormatoHojaVidaEquipo.ShowModal=MROK then
    begin
      FFormatoHojaVidaEquipo.qHojaVidaEquipo.Database.Commit;
    end
    else
    begin
      FFormatoHojaVidaEquipo.qHojaVidaEquipo.Database.Rollback;
    end;
    }
  finally
//    FFormatoHojaVidaEquipo.Free;
  end;

{    FSeccionFormatoDatos.qSeccionDatos.SQL.Text:='SELECT * FROM HVE_SECCIONFORMATODATOS WHERE CODIGOSECCIONFORMATODATOS = ' + qSeccionDatosCODIGOSECCIONFORMATODATOS.AsString;
    FSeccionFormatoDatos.qSeccionDatos.Open;
    FSeccionFormatoDatos.BitBtnImprimir.Enabled:=true;
    FSeccionFormatoDatos.bCancelar.Visible:=false;
    FSeccionFormatoDatos.updFormatoDatos:=nil;
    FSeccionFormatoDatos.updSeccionDatos:=nil;
    FSeccionFormatoDatos.Panel3.Enabled:=false;
    FSeccionFormatoDatos.Panel8.Enabled:=false;
    FSeccionFormatoDatos.DBNavigator1.visible:=false;
    FSeccionFormatoDatos.DBNavigator2.visible:=false;
    FSeccionFormatoDatos.RxDBGrid2.ReadOnly:=true;
    FSeccionFormatoDatos.Show;}
end;

end.
