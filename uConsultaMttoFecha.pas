unit uConsultaMttoFecha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, ComCtrls, ExtCtrls, Db, DBTables, Grids,
  DBGrids, RXDBCtrl, Mask, Digisoft,UBase, UtdNavigator, Menus,ComObj,
  ToolEdit;
  //,udSgdListaBase;

type
  TfConsultaMttoFecha = class(TFBase)
//   TfConsultaMttoFecha = class(TFdSgdListaBase)
    PanelPrincipal: TPanel;
    dsElemento: TDataSource;
    qElemento: TQuery;
    qSubestacion: TQuery;
    dsSubestacion: TDataSource;
    qCaracteristicasElemento: TQuery;
    qTablaElemento: TQuery;
    qCircuito: TQuery;
    dsCircuito: TDataSource;
    qMantenimientos: TQuery;
    dsMantenimientos: TDataSource;
    qElementoMantenimiento: TQuery;
    dsElementoMantenimiento: TDataSource;
    qmantenimientos2: TQuery;
    qCircuitoCODIGOCIRCUITO: TStringField;
    qCircuitoCODIGOSUBESTACION: TStringField;
    qCircuitoCODIGONIVELTENSION: TStringField;
    qCircuitoNOMBRECIRCUITO: TStringField;
    qCircuitoCODIGOAPOYO: TFloatField;
    qSubestacionCODIGOSUBESTACION: TStringField;
    qSubestacionNOMBRESUBESTACION: TStringField;
    qElementoCODIGOELEMENTO: TFloatField;
    qElementoCODIGOTIPOELEMENTO: TStringField;
    qElementoCODIGOAMBITO: TFloatField;
    qElementoNOMBRETABLAELEMENTO: TStringField;
    qElementoNUMEROCLAVESELEMENTO: TFloatField;
    qElementoCLAVEELEMENTO1: TStringField;
    qElementoCLAVEELEMENTO2: TStringField;
    qElementoCLAVEELEMENTO3: TStringField;
    qElementoNOMBRETIPOELEMENTO: TStringField;
    qElementoCAMPODESCRIPTIVO: TStringField;
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
    tdMemTable1: tdMemTable;
    tdMemTable1FechaInicial: TDateField;
    tdMemTable1FechaFinal: TDateField;
    dsFechas: TDataSource;
    tdMemTable1CodigoElemento: TIntegerField;
    tdMemTable1Clelemento1: TStringField;
    tdMemTable1Clelemento2: TStringField;
    Panel7: TPanel;
    PanelLista: TPanel;
    PanelListado: TPanel;
    RxDBGConsultaMttoFecha: TRxDBGrid;
    Panel5: TPanel;
    Panel6: TPanel;
    RxDBGrid2: TRxDBGrid;
    Panel4: TPanel;
    sbProgramar: TSpeedButton;
    qSubactividades: TQuery;
    qMantenimientosCODIGOTAREA: TFloatField;
    qMantenimientosFECHAINICIAL: TDateTimeField;
    qMantenimientosFECHAFINAL: TDateTimeField;
    qMantenimientosNOMBRETAREA: TStringField;
    qMantenimientosCODIGOMANTENIMIENTO: TFloatField;
    qMantenimientosCODIGOTIPOMANT: TFloatField;
    qMantenimientosNOMBREMANT: TStringField;
    qmantenimientos2CODIGOTAREA: TFloatField;
    qmantenimientos2FECHAINICIAL: TDateTimeField;
    qmantenimientos2FECHAFINAL: TDateTimeField;
    qmantenimientos2NOMBRETAREA: TStringField;
    qmantenimientos2CODIGOMANTENIMIENTO: TFloatField;
    qmantenimientos2CODIGOTIPOMANT: TFloatField;
    qmantenimientos2NOMBREMANT: TStringField;
    dsSubactividades: TDataSource;
    qSubactividadesCODIGOMANTENIMIENTO: TFloatField;
    qSubactividadesCODIGOACTIVIDADMANTENIMIENTO: TFloatField;
    qSubactividadesNOMBREACTIVIDADMANTENIMIENTO: TStringField;
    dsMantenimientos2: TDataSource;
    Query1: TQuery;
    Memo2: TMemo;
    qMantenimientosNOMBRETIPOELEMENTO: TStringField;
    qMantenimientosNOMBRESUBESTACION: TStringField;
    qMantenimientosTENSION: TFloatField;
    qTipoMtto: TQuery;
    dsTipoMtto: TDataSource;
    qNivelTension: TQuery;
    dsNivelTension: TDataSource;
    qEstadoMtto: TQuery;
    dsEstadoMtto: TDataSource;
    qMantenimientosNOMBREESTADO: TStringField;
    tdMTFiltro: tdMemTable;
    dsFiltro: TDataSource;
    qTipoMttoCODIGOTIPOMANT: TFloatField;
    qTipoMttoNOMBREMANT: TStringField;
    qNivelTensionCODIGONIVELTENSION: TStringField;
    qNivelTensionTENSION: TFloatField;
    qNivelTensionCOLOR: TFloatField;
    qNivelTensionNIVEL: TStringField;
    qEstadoMttoCODIGOESTADOTAREA: TFloatField;
    qEstadoMttoNOMBREESTADO: TStringField;
    tdMTFiltroCodigoSubestacion: TStringField;
    tdMTFiltroCodigoElemento: TIntegerField;
    tdMTFiltroCodigotipomant: TIntegerField;
    tdMTFiltroCodigoNivelTension: TStringField;
    tdMTFiltroCodigoEstadoTarea: TIntegerField;
    tdMTFiltroCodigoCircuito: TStringField;
    qMantenimientoselemento: TStringField;
    qMantenimientosCODIGOELEMENTO: TFloatField;
    qElementoMtto: TQuery;
    qElementoMttoCODIGOELEMENTOMANTENIMIENTO: TFloatField;
    qElementoMttoCLELEMENTO1: TStringField;
    qElementoMttoCLELEMENTO2: TStringField;
    qElementoMttoCODIGOELEMENTO: TFloatField;
    Panel8: TPanel;
    sbRefrescar: TSpeedButton;
    Panel2: TPanel;
    sbtnSalir: TSpeedButton;
    SBImprimir: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SBBuscar: TSpeedButton;
    SBOrdenar: TSpeedButton;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel1: TBevel;
    sbExportar: TSpeedButton;
    dNavigator1: TdNavigator;
    Bevel4: TBevel;
    PanelInferior: TPanel;
    codigo1: TListBox;
    codigo3: TListBox;
    codigo2: TListBox;
    codigo4: TListBox;
    Memo1: TMemo;
    PanelSuperior: TPanel;
    qMantenimientosNOMBREAREAOPERACIONODT: TStringField;
    pmOrdenar: TPopupMenu;
    CodigoMtto: TMenuItem;
    NombreMantenimiento: TMenuItem;
    N1: TMenuItem;
    TipoMantenimiento: TMenuItem;
    FechaInicialMtto: TMenuItem;
    FechaFinalMtto: TMenuItem;
    N3: TMenuItem;
    EstadoMtto: TMenuItem;
    Coordinacion: TMenuItem;
    TipoElemento: TMenuItem;
    Tension: TMenuItem;
    Subestacion: TMenuItem;
//    procedure ElementoClick(Sender: TObject);
//    procedure rbSubestacionClick(Sender: TObject);
//    procedure rbLineaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RxDBGConsultaMttoFechaDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure LineaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
//    procedure SBFiltrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
//    procedure DBLCBSubestacionClick(Sender: TObject);
    procedure qMantenimientosCalcFields(DataSet: TDataSet);
    procedure consultarElemento(codigotipoelemento:string);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbtnSalirClick(Sender: TObject);
    procedure SBOrdenarClick(Sender: TObject);
    procedure CodigoMttoClick(Sender: TObject);
    procedure NombreMantenimientoClick(Sender: TObject);
    procedure TipoMantenimientoClick(Sender: TObject);
    procedure CoordinacionClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FechaInicialMttoClick(Sender: TObject);
    procedure FechaFinalMttoClick(Sender: TObject);
    procedure EstadoMttoClick(Sender: TObject);
    procedure TipoElementoClick(Sender: TObject);
    procedure TensionClick(Sender: TObject);
    procedure SubestacionClick(Sender: TObject);
{    procedure ElementoClick(Sender: TObject);}
    procedure sbRefrescarClick(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure SBImprimirClick(Sender: TObject);

  private
    { Private declarations }
    ListaDireccionCampos:TStringList;
    Year, Month, Day, Hour, Min, Sec, MSec: Word;
    Present: TDateTime;
  public
    { Public declarations }
    sCriterio : String;
    fechaelemento:Tdate;
    constructor BuscarMantenimientos(AOwner:Tcomponent;fecha_mtto:TDate);
    procedure Ordenar(sCriterio:String);
  end;

var
  fConsultaMttoFecha: TfConsultaMttoFecha;

implementation

uses uMantenimientoMes, UMantenimiento, ufiltroConsultasMantenimiento,
  uBusquedaMtto, UQRMttosFecha;

{$R *.DFM}

constructor TfConsultaMttoFecha.BuscarMantenimientos(AOwner:TComponent;fecha_mtto:TDate);
begin
end;

procedure TfConsultaMttoFecha.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TfConsultaMttoFecha.FormShow(Sender: TObject);
begin
  qTipoMtto.Open;
  qSubestacion.Open;
  qElemento.Open;
  qNivelTension.Open;
  qCircuito.Open;
  qElementoMantenimiento.Open;
  qSubactividades.Open;
  qEstadoMtto.Open;
end;

procedure TfConsultaMttoFecha.RxDBGConsultaMttoFechaDblClick(Sender: TObject);
begin
//  FMantenimiento:=TFMantenimiento.crearnuevo(Self);
end;

procedure TfConsultaMttoFecha.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;
 {
procedure TfConsultaMttoFecha.LineaClick(Sender: TObject);
var sqltablaelemento:string;
begin
  inherited;
 if cbElemento.Enabled = false then
    cbElemento.Enabled:= true;

  if QCircuito.Active then
    QCircuito.Close;
  if(qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
  begin
    if qTablaElemento.Active then
       qTablaElemento.Close;
    qTablaElemento.SQL.Clear;
    sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                        qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO=:CODIGOCIRCUITO';
    qTablaElemento.SQL.Add(sqltablaelemento);
  end
  else if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
  begin
    if qTablaElemento.Active then
      qTablaElemento.Close;
    qTablaElemento.SQL.Clear;
    sqltablaelemento:= ' SELECT '+'  '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                        qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
    qTablaElemento.SQL.Add(sqltablaelemento);
  end
  ELSE if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
  begin
    if qTablaElemento.Active then
     qTablaElemento.Close;
    qTablaElemento.SQL.Clear;
    sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                      qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
    qTablaElemento.SQL.Add(sqltablaelemento);
  end
  else
  begin
    if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring ='') then
    BEGIN
      if qTablaElemento.Active then
        qTablaElemento.Close;
      qTablaElemento.SQL.Clear;
      sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+' '+'FROM'+' '+
                        qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
      qTablaElemento.SQL.Add(sqltablaelemento);
    END;
  end;

  if qTablaElemento.Active then
   qTablaElemento.Close;
  qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= vartostr(Linea.KeyValue);
  qTablaElemento.Open;

  if qTablaElemento.RecordCount > 0 then
  begin
    if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
    begin
      if codigo1.Items.Count >= 1 then
        codigo1.Clear;
      if CbElemento.Items.Count >= 1 then
        CbElemento.Clear;
      while not qTablaElemento.Eof do
      begin
        codigo1.Items.Append(qTablaElemento.fields[0].asstring);
        CbElemento.Items.Append(qTablaElemento.fields[1].asstring);
        qTablaElemento.Next;
      end;
    end
    else if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
    begin
      if codigo1.Items.Count >= 1 then
        codigo1.Clear;
      if CbElemento.Items.Count >= 1 then
        CbElemento.Clear;

      while not qTablaElemento.Eof do
        begin
          codigo1.Items.Append(qTablaElemento.fields[0].asstring);
          CbElemento.Items.Append(qTablaElemento.fields[0].asstring);
          qTablaElemento.Next;
        end;
    end
    else if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
    begin
      if codigo1.Items.Count >= 1 then
        codigo1.Clear;
      if codigo2.Items.Count >= 1 then
        codigo2.Clear;
      if CbElemento.Items.Count >= 1 then
        CbElemento.Clear;

      while not qTablaElemento.Eof do
        begin
          codigo1.Items.Append(qTablaElemento.fields[0].asstring);
          codigo2.Items.Append(qTablaElemento.fields[1].asstring);
          CbElemento.Items.Append(qTablaElemento.fields[2].asstring);
          qTablaElemento.Next;
        end;
    end
    else
    begin
      if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
      BEGIN
        if codigo1.Items.Count >= 1 then
          codigo1.Clear;
        if codigo2.Items.Count >= 1 then
          codigo2.Clear;
        if CbElemento.Items.Count >= 1 then
          CbElemento.Clear;

        while not qTablaElemento.Eof do
        begin
          codigo1.Items.Append(qTablaElemento.fields[0].asstring);
          codigo2.Items.Append(qTablaElemento.fields[1].asstring);
          CbElemento.Items.Append(qTablaElemento.fields[0].asstring + qTablaElemento.Fields[1].asstring);
          qTablaElemento.Next;
        end;
      END;
    end;
  end
else
  MessageDlg('No se encontraron elementos de ese tipo asociados con la línea.', mtInformation,[mbOk], 0);
end;     }

procedure TfConsultaMttoFecha.FormCreate(Sender: TObject);
begin
  tdMemTable1.Open;
  tdMemTable1.Insert;
  tdMTFiltro.Open;
  tdMTFiltro.Insert;
  qMantenimientos.Open;
  if qMantenimientos.RecordCount > 1 then
    PanelSuperior.Caption := 'CONSULTA DE MANTENIMIENTOS     << ' + inttostr(qMantenimientos.recordcount)+' Registros Encontrados >>'
  else PanelSuperior.Caption := 'CONSULTA DE MANTENIMIENTOS     << ' +inttostr(qMantenimientos.recordcount)+' Registro Encontrado >>';

  ListaDireccionCampos:=TStringList.Create;
  ListaDireccionCampos.Add('CODIGOMTTO=-1');
  ListaDireccionCampos.Add('NOMBREMANTENIMIENTO=-1');
  ListaDireccionCampos.Add('TIPOMANTENIMIENTO=-1');
  ListaDireccionCampos.Add('COORDINACION=-1');
  ListaDireccionCampos.Add('FECHAINICIALMTTO=-1');
  ListaDireccionCampos.Add('FECHAFINALMTTO=-1');
  ListaDireccionCampos.Add('ESTADOMTTO=-1');
  ListaDireccionCampos.Add('TIPOELEMENTO=-1');
  ListaDireccionCampos.Add('TENSION=-1');
  ListaDireccionCampos.Add('SUBESTACION=-1');
  ListaDireccionCampos.Add('ELEMENTO=-1');
end;

procedure TfConsultaMttoFecha.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if (Key = #13) then
     if (ActiveControl is TDBLookupComboBox) then
     begin
       if not (ActiveControl as TDBLookupComboBox).ListVisible then
          Perform(wm_NextDLGCTL, 0, 0);
     end
     else
     begin
       Perform(wm_NextDLGCTL, 0, 0);
       key := #0;
     end
end;

procedure TfConsultaMttoFecha.qMantenimientosCalcFields(DataSet: TDataSet);
begin
  qElementoMtto.Close;
  qElementoMtto.ParamByName('CODIGOELEMENTOMANTENIMIENTO').AsString:=qmantenimientos.fieldbyname('CODIGOTAREA').asstring;
  qElementoMtto.Open;
  consultarelemento(qElementoMttoCODIGOELEMENTO.asstring);
  qMantenimientoselemento.AsString:=Memo2.Text;
end;

procedure TfConsultaMttoFecha.consultarElemento(codigotipoelemento:string);
var qry1,qtablaelemento:tquery;
  sqltablaelemento1:string;
begin
  qry1:=tquery.Create(Application);
  qry1.DatabaseName:='Basedato';
  qtablaelemento:=TQuery.Create(Application);
  qtablaelemento.DatabaseName:='Basedato';
  qry1.SQL.Add('select * from pm_elemento where codigoelemento=:codigoelemento');
  qry1.ParamByName('CODIGOELEMENTO').AsString:=codigotipoelemento;
  qry1.Open;
  Memo2.Clear;
 //CONSULTAR ELEMENTO
  if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
  begin
    if qTablaElemento.Active then
      qTablaElemento.Close;
    qTablaElemento.SQL.Clear;
    sqltablaelemento1:= ' SELECT'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+','+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM ' + '  '+
                        qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+'  '+'WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+' = '''+qElementoMtto.fieldbyname('CLELEMENTO1').AsString+''' ';
    qTablaElemento.SQL.Add(sqltablaelemento1);
    qTablaElemento.Open;
    memo2.Lines.Append(qTablaElemento.Fields[1].asstring);
  end
  else
  begin
    if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
    begin
      Memo2.Lines.Append(qElementoMtto.fieldbyname('CLELEMENTO1').asstring);
    end
  end;
  if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
  begin
    if qTablaElemento.Active then
      qTablaElemento.Close;
    qTablaElemento.SQL.Clear;
    sqltablaelemento1:= ' SELECT '+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+','+qry1.fieldbyname('CLAVEELEMENTO2').asstring+','+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                        qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+'WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+' = '''+qElementoMtto.fieldbyname('CLELEMENTO1').asstring+''' '+
                        'and'+qry1.fieldbyname('CLAVEELEMENTO').asstring+' = '''+qElementoMtto.fieldbyname('CLELEMENTO2').asstring+''' ';

    qTablaElemento.SQL.Add(sqltablaelemento1);
    qTablaElemento.Open;
    Memo2.Lines.Append(qTablaElemento.Fields[2].asstring);
  end
  else
  begin
    if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
    begin
      sqltablaelemento1:=  ' SELECT '+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+','+qry1.fieldbyname('CLAVEELEMENTO2').asstring+' '+' FROM'+' '+
                           qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+'WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+' =  '''+qElementoMtto.fieldbyname('CLELEMENTO1').asstring+''' '+
                           'and'+qry1.fieldbyname('CLAVEELEMENTO2').asstring+' = '''+qElementoMtto.fieldbyname('CLELEMENTO2').asstring+''' ';
      Memo2.Lines.Append(qElementoMtto.fieldbyname('CLELEMENTO1').asstring+qElementoMtto.fieldbyname('CLELEMENTO2').asstring);
    end;
  end;
  qry1.Free;
  qtablaelemento.Free;
//  elemento:=Memo2.Text;         
end;

procedure TfConsultaMttoFecha.SpeedButton2Click(Sender: TObject);
begin
  fFiltroConsultasMantenimiento:=TfFiltroConsultasMantenimiento.Create(Application);
  fFiltroConsultasMantenimiento.filtrado := false;
  fFiltroConsultasMantenimiento.DBLCBEstadoMtto.ReadOnly:=False;
  fFiltroConsultasMantenimiento.ShowModal;
  If fFiltroConsultasMantenimiento.filtrado then
  Begin
    qMantenimientos.SQL.Clear;
    qMantenimientos.Close;
    qMantenimientos.sql.text:=fFiltroConsultasMantenimiento.qmantenimientos.sql.text;
    qMantenimientos.Open;
    qSubactividades.Close;
    qSubactividades.Open;
    if qMantenimientos.RecordCount <> 1 then
      PanelSuperior.Caption := 'CONSULTA DE MANTENIMIENTOS     << ' + inttostr(qMantenimientos.recordcount)+' Registros Encontrados >>'
    else PanelSuperior.Caption := 'CONSULTA DE MANTENIMIENTOS     << ' +inttostr(qMantenimientos.recordcount)+' Registro Encontrado >>';
  end;
  fFiltroConsultasMantenimiento.Free;
end;

procedure TfConsultaMttoFecha.sbtnSalirClick(Sender: TObject);
begin
  close;
end;

procedure TfConsultaMttoFecha.SBOrdenarClick(Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel2.ClientToScreen(Classes.Point(SBOrdenar.Left, SBOrdenar.top));
  pmOrdenar.Popup(punto.x+10, punto.y+10);
end;

//ORDENAR
procedure TfConsultaMttoFecha.Ordenar(sCriterio: String);
begin
  qMantenimientos.Close;
  qMantenimientos.SQL.Delete(qMantenimientos.SQL.Count - 1);
  qMantenimientos.SQL.Add(sCriterio);
  qMantenimientos.Open;
  RxDBGConsultaMttoFecha.SetFocus;
end;

//CODIGO MANTENIMIENTO 
procedure TfConsultaMttoFecha.CodigoMttoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('CODIGOMTTO');
  sCriterio := 'ORDER BY t.codigotarea DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['CODIGOMTTO']='1') then
    begin
      sCriterio := 'ORDER BY t.codigotarea ASC';
      ListaDireccionCampos.Values['CODIGOMTTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['CODIGOMTTO']:='1'
  end;
  CodigoMtto.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMttoFecha do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosCODIGOMANTENIMIENTO;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

//NOMBRE MANTENIMIENTO
procedure TfConsultaMttoFecha.NombreMantenimientoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('NOMBREMANTENIMIENTO');
  sCriterio := 'ORDER BY T.NOMBRETAREA DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['NOMBREMANTENIMIENTO']='1') then
    begin
      sCriterio := 'ORDER BY T.NOMBRETAREA ASC';
      ListaDireccionCampos.Values['NOMBREMANTENIMIENTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['NOMBREMANTENIMIENTO']:='1'
  end;
  NombreMantenimiento.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMttoFecha do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBRETAREA;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

// TIPO MANTENIMIENTO 
procedure TfConsultaMttoFecha.TipoMantenimientoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('TIPOMANTENIMIENTO');
  sCriterio := 'ORDER BY TM.NOMBREMANT DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['TIPOMANTENIMIENTO']='1' then
    begin
      sCriterio := 'ORDER BY TM.NOMBREMANT ASC';
      ListaDireccionCampos.Values['TIPOMANTENIMIENTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['TIPOMANTENIMIENTO']:='1'
  end;
  TipoMantenimiento.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMttoFecha do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBREMANT;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

// COORDINACION
procedure TfConsultaMttoFecha.CoordinacionClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('COORDINACION');
  sCriterio := 'ORDER BY a.nombreareaoperacionodt DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['COORDINACION']='1' then
    begin
      sCriterio := 'ORDER BY a.nombreareaoperacionodt ASC';
      ListaDireccionCampos.Values['COORDINACION']:='-1';
    end
    else
      ListaDireccionCampos.Values['COORDINACION']:='1'
  end;
  Coordinacion.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMttoFecha do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBREAREAOPERACIONODT;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

// FECHA INICIAL
procedure TfConsultaMttoFecha.FechaInicialMttoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHAINICIALMTTO');
  sCriterio := 'ORDER BY t.fechainicial DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['FECHAINICIALMTTO']='1' then
    begin
      sCriterio := 'ORDER BY t.fechainicial ASC';
      ListaDireccionCampos.Values['FECHAINICIALMTTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHAINICIALMTTO']:='1'
  end;
  FechaInicialMtto.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMttoFecha do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosFECHAINICIAL;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

// FECHA FINAL
procedure TfConsultaMttoFecha.FechaFinalMttoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHAFINALMTTO');
  sCriterio := 'ORDER BY t.fechafinal DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['FECHAFINALMTTO']='1' then
    begin
      sCriterio := 'ORDER BY t.fechafinal ASC';
      ListaDireccionCampos.Values['FECHAFINALMTTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHAFINALMTTO']:='1'
  end;
  FechaFinalMtto.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMttoFecha do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosFECHAFINAL;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaMttoFecha.EstadoMttoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('ESTADOMTTO');
  sCriterio := 'ORDER BY et.NombreEstado DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['ESTADOMTTO']='1' then
    begin
      sCriterio := 'ORDER BY et.NombreEstado ASC';
      ListaDireccionCampos.Values['ESTADOMTTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['ESTADOMTTO']:='1'
  end;
  EstadoMtto.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMttoFecha do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBREESTADO;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaMttoFecha.TipoElementoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('TIPOELEMENTO');
  sCriterio := 'ORDER BY e.nombretipoelemento DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['TIPOELEMENTO']='1' then
    begin
      sCriterio := 'ORDER BY e.nombretipoelemento ASC';
      ListaDireccionCampos.Values['TIPOELEMENTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['TIPOELEMENTO']:='1'
  end;
  TipoElemento.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMttoFecha do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBRETIPOELEMENTO;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaMttoFecha.TensionClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('TENSION');
  sCriterio := 'ORDER BY nt.tension DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['TENSION']='1' then
    begin
      sCriterio := 'ORDER BY nt.tension ASC';
      ListaDireccionCampos.Values['TENSION']:='-1';
    end
    else
      ListaDireccionCampos.Values['TENSION']:='1'
  end;
  Tension.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMttoFecha do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosTENSION;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaMttoFecha.SubestacionClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('SUBESTACION');
  sCriterio := 'ORDER BY s.nombresubestacion DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['SUBESTACION']='1' then
    begin
      sCriterio := 'ORDER BY s.nombresubestacion ASC';
      ListaDireccionCampos.Values['SUBESTACION']:='-1';
    end
    else
      ListaDireccionCampos.Values['SUBESTACION']:='1'
  end;
  Subestacion.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMttoFecha do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBRESUBESTACION;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;
{
procedure TfConsultaMttoFecha.ElementoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('SUBESTACION');
  sCriterio := 'ORDER BY bm.codigoelemento DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['SUBESTACION']='1' then
    begin
      sCriterio := 'ORDER BY bm.codigoelemento ASC';
      ListaDireccionCampos.Values['SUBESTACION']:='-1';
    end
    else
      ListaDireccionCampos.Values['SUBESTACION']:='1'
  end;
  Elemento.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMttoFecha do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosCODIGOELEMENTO;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;    }

procedure TfConsultaMttoFecha.sbRefrescarClick(Sender: TObject);
begin
  qMantenimientos.Close;
  qMantenimientos.Open;
  qSubactividades.Close;
  qSubactividades.Open;
end;

procedure TfConsultaMttoFecha.FormDestroy(Sender: TObject);
begin
  qMantenimientos.Free;
  qElementoMtto.Free;
  qMantenimientoselemento.Free;
end;

procedure TfConsultaMttoFecha.SBBuscarClick(Sender: TObject);
begin
  inherited;
  FBusquedaMtto := TFBusquedaMtto.Create(Application);
  FBusquedaMtto.dsMtto.DataSet:=qMantenimientos;
  FBusquedaMtto.ShowModal;
  FBusquedaMtto.Free;
  RxDBGConsultaMttoFecha.Setfocus;
end;

procedure TfConsultaMttoFecha.sbExportarClick(Sender: TObject);
Var
  oXL, oWB, oSheet, oRng, VArray, Adem, Tgrl, Tctr, Grip, Aenc : Variant;
  i,j,contador: integer;
  qConsulta: TQuery;
  Agente, Tipo, Planta, Codigo, contrato: string;
  librocreado:boolean;
  Dia, Mes, Ano: word;
  fila: integer;
begin
  Present:= Now;
  DecodeDate(Present, Year, Month, Day);
  DecodeTime(Present, Hour, Min, Sec, MSec);
  oXL := CreateOleObject('Excel.Application');
  oXL.Visible := True;
  oWB := oXL.Workbooks.Add;
  oWB.sheets.add.name:= 'Mantenimientos';
  oWB.ActiveSheet.Cells[1,1] := 'CODIGO MTTO';
  oWB.ActiveSheet.Cells[1,2] := 'NOMBRE MANTENIMIENTO';
  oWB.ActiveSheet.Cells[1,3] := 'TIPO MTTO';
  oWB.ActiveSheet.Cells[1,4] := 'FECHA INICIAL';
  oWB.ActiveSheet.Cells[1,5] := 'FECHA FINAL';
  oWB.ActiveSheet.Cells[1,6] := 'COORDINACION';
  oWB.ActiveSheet.Cells[1,7] := 'ESTADO';
  oWB.ActiveSheet.Cells[1,8] := 'TIPO ELEMENTO';
  oWB.ActiveSheet.Cells[1,9] := 'TENSION';
  oWB.ActiveSheet.Cells[1,10] := 'SUBESTACION';
  oWB.ActiveSheet.Cells[1,11] := 'ELEMENTO';
  qMantenimientos.First;
  fila:= 2;
  while not qMantenimientos.eof do
  begin
    oWB.ActiveSheet.Cells[fila,1] :=  qMantenimientos.FIELDBYNAME('CODIGOMANTENIMIENTO').asstring;
    oWB.ActiveSheet.Cells[fila,2] :=  qMantenimientos.FIELDBYNAME('NOMBRETAREA').asstring;
    oWB.ActiveSheet.Cells[fila,3] :=  qMantenimientos.FIELDBYNAME('NOMBREMANT').asstring;
    oWB.ActiveSheet.Cells[fila,4] :=  qMantenimientos.FIELDBYNAME('FECHAINICIAL').asstring;
    oWB.ActiveSheet.Cells[fila,5] :=  qMantenimientos.FIELDBYNAME('FECHAFINAL').asstring;
    oWB.ActiveSheet.Cells[fila,6] :=  qMantenimientos.FIELDBYNAME('NOMBREAREAOPERACIONODT').asstring;
    oWB.ActiveSheet.Cells[fila,7] :=  qMantenimientos.FIELDBYNAME('NOMBREESTADO').asstring;
    oWB.ActiveSheet.Cells[fila,8] :=  qMantenimientos.FIELDBYNAME('NOMBRETIPOELEMENTO').asstring;
    oWB.ActiveSheet.Cells[fila,9] :=  qMantenimientos.FIELDBYNAME('TENSION').asstring;
    oWB.ActiveSheet.Cells[fila,10]:=  qMantenimientos.FIELDBYNAME('NOMBRESUBESTACION').asstring;
    oWB.ActiveSheet.Cells[fila,11]:=  qMantenimientos.FIELDBYNAME('ELEMENTO').asstring;
    fila:= fila + 1;
    qMantenimientos.next;
  end;
  oWB.SaveAs('C:\EnerGIS4\ConsultasMtto'+'_'+IntToStr(Day)+'_'+ IntToStr(Month)+'_' +IntToStr(Year) + '_'+ IntToStr(Hour)+'y'+IntToStr(Min),null,'','',EmptyParam,EmptyParam,0, EmptyParam, EmptyParam, EmptyParam,EmptyParam,0);
end;

procedure TfConsultaMttoFecha.SBImprimirClick(Sender: TObject);
begin
  Application.ProcessMessages;
  fQRMttosFecha:=TFQRMttosFecha.create(Application);
  FQRMttosFecha.qMttoReprogramado.SQL.Clear;
  FQRMttosFecha.qMttoReprogramado.Close;
  FQRMttosFecha.qMttoReprogramado.SQL.Text:=qMantenimientos.SQL.Text;
  FQRMttosFecha.qMttoReprogramado.Open;
  FQRMttosFecha.qEmpresa.Open;
//  fQRMttoReprogramado.QRDBText7.Caption :=CBELEMENTO.TEXT;
  //FECHA IMPRESIÓN
  FQRMttosFecha.QRLBFecha.Caption := DateTimeToStr(Now);
  FQRMttosFecha.QuickRep1.Preview;
end;

end.



