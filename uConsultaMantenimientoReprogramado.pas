unit uConsultaMantenimientoReprogramado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, ComCtrls, ExtCtrls, Db, DBTables, Grids,
  DBGrids, RXDBCtrl, Mask, Digisoft,uBase, Menus,comObj;

type
  TfConsultaMantenimientoReprogramado = class(TFbase)
    Panel1: TPanel;
    dsElemento: TDataSource;
    qElemento: TQuery;
    qSubestacion: TQuery;
    dsSubestacion: TDataSource;
    qCaracteristicasElemento: TQuery;
    qTablaElemento: TQuery;
    PanelSuperior: TPanel;
    PanelInferior: TPanel;
    Memo1: TMemo;
    qCircuito: TQuery;
    dsCircuito: TDataSource;
    qMantenimientos: TQuery;
    dsMantenimientos: TDataSource;
    qElementoMantenimiento: TQuery;
    dsElementoMantenimiento: TDataSource;
    codigo1: TListBox;
    codigo3: TListBox;
    codigo2: TListBox;
    codigo4: TListBox;
    sbMantenimiento: TSpeedButton;
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
    Panel3: TPanel;
    PanelListado: TPanel;
    RxDBGMttoReprogramado: TRxDBGrid;
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
    qMantenimientosFECHAINICIALANTERIOR: TDateTimeField;
    qMantenimientosFECHAFINALANTERIOR: TDateTimeField;
    qMantenimientosFECHAINICIALNUEVA: TDateTimeField;
    qMantenimientosFECHAFINALNUEVA: TDateTimeField;
    qMantenimientosMOTIVOREPROGRAMACION: TStringField;
    tdMemTable1FechaInicialAnterior: TDateField;
    tdMemTable1FechaFinalAnterior: TDateField;
    Panel2: TPanel;
    SBSalir: TSpeedButton;
    SBImprimir: TSpeedButton;
    SBBuscar: TSpeedButton;
    SBOrdenar: TSpeedButton;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel1: TBevel;
    sbExportar: TSpeedButton;
    Bevel4: TBevel;
    SpeedButton2: TSpeedButton;
    pmOrdenar: TPopupMenu;
    CodigoMtto: TMenuItem;
    NombreMantenimiento: TMenuItem;
    MotivoReprogramacion: TMenuItem;
    N1: TMenuItem;
    FechaInicialAnterior: TMenuItem;
    FechaFinalAnterior: TMenuItem;
    FechaInicialNueva: TMenuItem;
    N3: TMenuItem;
    FechaFinalNueva: TMenuItem;
    qMantenimientosNOMBREAREAOPERACIONODT: TStringField;
    qMantenimientosFECHAREPROGRAMACION: TDateTimeField;
    Coordinacion: TMenuItem;
    FechaReprogramacion: TMenuItem;
    sbRefrescar: TSpeedButton;
    Bevel5: TBevel;
//    procedure ElementoClick(Sender: TObject);
//    procedure rbSubestacionClick(Sender: TObject);
//    procedure rbLineaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbElementoChange(Sender: TObject);
    procedure RxDBGMttoReprogramadoDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
//    procedure LineaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
//    procedure SBFiltrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
//    procedure DBLCBSubestacionClick(Sender: TObject);
    procedure qMantenimientosCODIGOTAREAChange(Sender: TField);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SBSalirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CodigoMttoClick(Sender: TObject);
    procedure NombreMantenimientoClick(Sender: TObject);
    procedure SBOrdenarClick(Sender: TObject);
    procedure CoordinacionClick(Sender: TObject);
    procedure FechaInicialAnteriorClick(Sender: TObject);
    procedure FechaFinalAnteriorClick(Sender: TObject);
    procedure FechaInicialNuevaClick(Sender: TObject);
    procedure FechaFinalNuevaClick(Sender: TObject);
    procedure FechaReprogramacionClick(Sender: TObject);
    procedure MotivoReprogramacionClick(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
    procedure sbRefrescarClick(Sender: TObject);
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
//    procedure Elementos(tipoelemento:integer;codsubestacion:string);
    procedure Ordenar(sCriterio:String);
  end;

var
  fConsultaMantenimientoReprogramado: TfConsultaMantenimientoReprogramado;

implementation

uses uMantenimientoMes, UMantenimiento, ufiltroConsultaMttoReprogramado,
  uBusquedaMttoReprogramado, UQRMttoReprogramado;

{$R *.DFM}

constructor TfConsultaMantenimientoReprogramado.BuscarMantenimientos(AOwner:TComponent;fecha_mtto:TDate);
begin
end;
{
procedure TfConsultaMantenimientoReprogramado.ElementoClick(Sender: TObject);
var sqltablaelemento:string;
begin
  if rbLinea.Checked then
  begin
  if lLinea.Enabled = false then
    lLinea.Enabled:= true;
  if Linea.Enabled = false then
    Linea.Enabled:= true;
  end;

  if qCaracteristicasElemento.Active then
    qCaracteristicasElemento.Close;
  qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
  qCaracteristicasElemento.Open;

  if (qElementoCODIGOAMBITO.AsInteger= 1) then
  begin
    if cbElemento.Enabled = false then
      cbElemento.Enabled:= true;
    if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
    begin
      if qTablaElemento.Active then
        qTablaElemento.Close;
      qTablaElemento.SQL.Clear;
      sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                          qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
      qTablaElemento.SQL.Add(sqltablaelemento);
      qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(DBLCBSubestacion.keyvalue);
      qTablaElemento.Open;
      if codigo1.Items.Count >= 1 then
        codigo1.Clear;
      if cbElemento.Items.Count >= 1 then
        cbElemento.Clear;
      if not qTablaElemento.IsEmpty then
        begin
          while not qTablaElemento.Eof do
            begin
             codigo1.Items.Append(qTablaElemento.fields[0].asstring);
             cbElemento.Items.Append(qTablaElemento.fields[1].asstring);
             qTablaElemento.Next;
            end;
        end
      else
        MessageDlg('No se encontraron elementos de ese tipo asociados a la subestación.', mtInformation,[mbOk], 0);
    end
    else
  //    begin
        if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
          begin
            if qTablaElemento.Active then
            qTablaElemento.Close;
            qTablaElemento.SQL.Clear;
            sqltablaelemento:= ' SELECT '+'  '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                               qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
            qTablaElemento.SQL.Add(sqltablaelemento);
            qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(dblcbSubestacion.keyvalue);
            qTablaElemento.Open;
            if codigo1.Items.Count >= 1 then
              codigo1.Clear;
            if cbElemento.Items.Count >= 1 then
              cbElemento.Clear;
            if not qTablaElemento.IsEmpty then
              begin
                while not qTablaElemento.Eof do
                  begin
                    codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                    cbElemento.Items.Append(qTablaElemento.fields[0].asstring);
                    qTablaElemento.Next;
                  end;
              end
            else
              MessageDlg('No se encontraron elementos de ese tipo asociados a la subestación.', mtInformation,[mbOk], 0);
          end
  //    end;
    else if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
      begin
        if qTablaElemento.Active then
        qTablaElemento.Close;
        qTablaElemento.SQL.Clear;
        sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                            qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
        qTablaElemento.SQL.Add(sqltablaelemento);
        qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(DBLCBSubestacion.keyvalue);
        qTablaElemento.Open;
        if codigo1.Items.Count >= 1 then
          codigo1.Clear;
        if codigo2.Items.Count >= 1 then
          codigo2.Clear;
        if cbElemento.Items.Count >= 1 then
          cbElemento.Clear;
        if not qTablaElemento.IsEmpty then
          begin
            while not qTablaElemento.Eof do
              begin
                codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                cbElemento.Items.Append(qTablaElemento.fields[2].asstring);
                qTablaElemento.Next;
              end;
          end
        else
         MessageDlg('No se encontraron elementos de ese tipo asociados a la subestación.', mtInformation,[mbOk], 0);
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
            qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(DBLCBSubestacion.keyvalue);
            qTablaElemento.Open;
            if codigo1.Items.Count >= 1 then
              codigo1.Clear;
            if codigo2.Items.Count >= 1 then
              codigo2.Clear;
            if cbElemento.Items.Count >= 1 then
              cbElemento.Clear;
            if not qTablaElemento.IsEmpty then
              begin
                while not qTablaElemento.Eof do
                  begin
                    codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                    codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                    cbElemento.Items.Append(qTablaElemento.fields[0].asstring + qTablaElemento.Fields[1].asstring);
                    qTablaElemento.Next;
                  end;
              end
            else
              MessageDlg('No se encontraron elementos de ese tipo asociados a la subestación.', mtInformation,[mbOk], 0);
          end;
      end;
  end;
end;  }

{
procedure TfConsultaMantenimientoReprogramado.rbSubestacionClick(Sender: TObject);
begin
  if qCircuito.Active then
    qCircuito.Close;
  if lLinea.Enabled = true then
    lLinea.Enabled:= false;
  if Linea.Enabled = true then
    Linea.Enabled:= false;
  if qElemento.Active then
    qElemento.Close;
  qElemento.ParamByName('CODIGOAMBITO').asinteger:= 1;
  qElemento.Open;
end;     }

{
procedure TfConsultaMantenimientoReprogramado.rbLineaClick(Sender: TObject);
begin
  if qCircuito.Active then
    qCircuito.Close;
  if lLinea.Enabled = false then
    lLinea.Enabled:= true;
  if Linea.Enabled = false then
    Linea.Enabled:= true;
  if qElemento.Active then
    qElemento.Close;
  qElemento.ParamByName('CODIGOAMBITO').asinteger:= 2;
  qElemento.Open;
end;         }

procedure TfConsultaMantenimientoReprogramado.SpeedButton1Click(Sender: TObject);
begin
  close;
end;

procedure TfConsultaMantenimientoReprogramado.FormShow(Sender: TObject);
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

procedure TfConsultaMantenimientoReprogramado.cbElementoChange(Sender: TObject);         //sobra
begin
{  inherited;
    qCaracteristicasElemento.Close;
    qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
    qCaracteristicasElemento.Open;

    if qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1 then
      begin
        tdMemTable1.FieldByName('CODIGOELEMENTO').AsInteger:= qCaracteristicasElemento.fieldbyname('CODIGOELEMENTO').asinteger;
        tdMemTable1.FieldByName('CLELEMENTO1').AsString:=codigo1.Items.Strings[CbElemento.itemindex];
        qMantenimientos.Close;
        qMantenimientos.Open;
        qSubactividades.Close;
        qSubactividades.Open;
      end
    else
      begin
        tdMemTable1.FieldByName('CODIGOELEMENTO').AsInteger:= qCaracteristicasElemento.fieldbyname('CODIGOELEMENTO').asinteger;
        tdMemTable1.FieldByName('CLELEMENTO1').AsString:=codigo1.Items.Strings[CbElemento.itemindex];
        tdMemTable1.FieldByName('CLELEMENTO2').AsString:=codigo2.Items.Strings[CbElemento.itemindex];
        qMantenimientos2.Close;
        qMantenimientos2.Open;
        qSubactividades.Close;
//        qSubactividades.DataSource:=dsMantenimientos2;
        qSubactividades.Open;
      end;        }
end;

procedure TfConsultaMantenimientoReprogramado.RxDBGMttoReprogramadoDblClick(Sender: TObject);
//begin
  {FMantenimiento:=TFMantenimiento.crearnuevo(Self);
  fMantenimiento.edicionMtto:=false;
  FMantenimiento.Show;  }
var
  Qry1,qry3:TQuery;
  Fecha: TDateTime;
  sql_total:String;
  Dia,MesTarea,Year,MesInic:word;

begin
  {FMantenimiento:=TFMantenimiento.crearnuevo(Self);
  fMantenimiento.edicionMtto:=false;
  if FMantenimiento.Showmodal = mrOk then
  begin
    Fecha:= StrtoDateTime(FMantenimiento.dbeFechaInicial.Text);
    Decodedate(Fecha,Year,MesTarea,Dia);
    if MesTarea = MesInic then
    begin
      sql_total:=  ' SELECT T.CODIGOTAREA,M.CODIGOTIPOMANT,M.CODIGOSUBESTACION,M.CODIGOCIRCUITO,BM.CODIGOAMBITO,BM.CODIGOELEMENTO,BM.CODIGOAREAOPERACIONODT,EM.CLELEMENTO1,EM.CLELEMENTO2 FROM PM_TAREA T,'+
                   ' PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE T.CODIGOTAREA = '''+qmantenimientos.fieldbyname('codigotarea').asstring+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND '+
                   ' M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO';
      Qry1:= TQuery.Create(Application);
      Qry1.DatabaseName:='BaseDato';
      Qry1.SQL.Clear;
      Qry1.SQL.Add(sql_total);
      Qry1.Open;
      case totalsuma of
       0: begin
            PunteroDia;
          end;
       //inicio
      20: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) then
              PunteroDia;
          end;
      21: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) then
              PunteroDia;
          end;
      25: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) then
              PunteroDia;
          end;
      60: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) then
              PunteroDia;
          end;
     140: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsInteger) then
              PunteroDia;
          end;
      30: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsInteger) then
              PunteroDia;
          end;
      26: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) then
              PunteroDia;
          end;
      61: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) then
              PunteroDia;
          end;
      166: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsInteger) then
              PunteroDia;
          end;
       71: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsInteger) then
              PunteroDia;
          end;
       65: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) then
              PunteroDia;
          end;
       75: begin
            if (Coordinacion.KeyValue = Qry1.FieldByName('CODIGOAREAOPERACIONODT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsInteger) then
              PunteroDia;
          end;
       //fin
       1: begin
            if (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) then
              PunteroDia;
          end;
       6: begin
            if (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) then
              PunteroDia;
          end;
       16: begin
             if  (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
               PunteroDia;
           end;
       15: begin
             if (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
               PunteroDia;
           end;
       11: begin
             if  (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
               PunteroDia;
           end;
       10: begin
             if (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
               PunteroDia;
           end;
       5: begin
            if (Ambito.KeyValue = Qry1.FieldByName('CODIGOAMBITO').AsInteger) then
              PunteroDia;
          end;
       40:begin
            if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) then
              PunteroDia;
          end;
      120:begin
            if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString)  then
              PunteroDia;
          end;
      130:begin
            if (cbElemento.Visible) and (cbElemento.Text <> '') then
            begin
              qry3:= TQuery.Create(application);
              qry3.DatabaseName:='BaseDato';
              qry3.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
              qry3.FieldByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
              qry3.Open;
              if qry3.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1 then
              begin
                if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) then
                  PunteroDia;
              end
              else
              begin
                if qry3.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2 then
                begin
                  if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) and (codigo2.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO2').asstring) then
                    PunteroDia;
                end;
              end;
            end
            else
            begin
              if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
                PunteroDia;
            end;
           end;
      121:begin
            if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger) then
              PunteroDia;
          end;
      131:begin
            if (cbElemento.Visible) and (cbElemento.Text <> '') then
            begin
              qry3:= TQuery.Create(application);
              qry3.DatabaseName:='BaseDato';
              qry3.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
              qry3.FieldByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
              qry3.Open;
              if qry3.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1 then
              begin
                if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (TipoMantenimiento.keyvalue = Qry1.fieldbyname('CODIGOTIPOMANT').asinteger)  and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) then
                  PunteroDia;
              end
              else
              begin
                if qry3.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2 then
                begin
                  if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (TipoMantenimiento.keyvalue = Qry1.fieldbyname('CODIGOTIPOMANT').asinteger) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) and (codigo2.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO2').asstring) then
                    punterodia;
                end;
              end;
            end
            else
            begin
              if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Circuito.KeyValue = Qry1.FieldByName('CODIGOCIRCUITO').AsString) and (TipoMantenimiento.keyvalue = Qry1.fieldbyname('CODIGOTIPOMANT').asinteger) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) then
                punterodia;
            end;
           end;
        50:begin
             if (cbElemento.Visible) and (cbElemento.Text <> '') then
             begin
               qry3:= TQuery.Create(application);
               qry3.DatabaseName:='BaseDato';
               qry3.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
               qry3.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
               qry3.Open;
               if qry3.FieldByName('NUMEROCLAVES').asinteger = 1 then
               begin
                 if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) then
                   punterodia;
               end
               else
               begin
                 if qry3.FieldByName('NUMEROCLAVES').asinteger = 2 then
                   if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) and (codigo2.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO2').asstring) then
                     punterodia;
               end;
             end
             else
             begin
               if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString)  then
                 punterodia;
             end;
           end;
        41:begin
             if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsInteger)  then
               punterodia;
             end;
        51:begin
             if (cbElemento.Visible) and (cbElemento.Text <> '') then
             begin
               qry3:= TQuery.Create(application);
               qry3.DatabaseName:='BaseDato';
               qry3.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
               qry3.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
               qry3.Open;
               if qry3.FieldByName('NUMEROCLAVES').asinteger = 1 then
               begin
                 if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (TipoMantenimiento.keyvalue = Qry1.fieldbyname('CODIGOTIPOMANT').asinteger) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) then
                   punterodia;
               end
               else
               begin
                 if qry3.FieldByName('NUMEROCLAVES').asinteger = 2 then
                   if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').asinteger) and (codigo1.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO1').asstring) and (codigo2.Items[cbElemento.ItemIndex] = Qry1.FieldByName('CLELEMENTO2').asstring) then
                     punterodia;
               end;
             end
             else
             begin
             if (Subestacion.KeyValue = Qry1.FieldByName('CODIGOSUBESTACION').AsString) and (TipoMantenimiento.KeyValue = Qry1.FieldByName('CODIGOTIPOMANT').AsString) and (Elemento.KeyValue = Qry1.FieldByName('CODIGOELEMENTO').AsString)  then
               punterodia;
             end;
           end;
      end;
    end;
  end;
  Edit1.Text:= FMantenimiento.QTarea.fieldByName('CODIGOTAREA').AsString;
  FMantenimiento.free;}
end;

procedure TfConsultaMantenimientoReprogramado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;
{
procedure TfConsultaMantenimientoReprogramado.LineaClick(Sender: TObject);
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
end; }

procedure TfConsultaMantenimientoReprogramado.FormCreate(Sender: TObject);
begin
  tdMemTable1.Open;
  tdMemTable1.Insert;
  tdMTFiltro.Open;
  tdMTFiltro.Insert;
  qMantenimientos.Open;
  qMantenimientos.Open;
  if qMantenimientos.RecordCount > 1 then
    PanelSuperior.Caption := 'CONSULTA DE MANTENIMIENTOS REPROGRAMADOS     << ' + inttostr(qMantenimientos.recordcount)+' Registros Encontrados >>'
  else PanelSuperior.Caption := 'CONSULTA DE MANTENIMIENTOS REPROGRAMADOS     << ' +inttostr(qMantenimientos.recordcount)+' Registro Encontrado >>';


  ListaDireccionCampos:=TStringList.Create;
  ListaDireccionCampos.Add('CODIGOMTTO=-1');
  ListaDireccionCampos.Add('NOMBREMANTENIMIENTO=-1');
  ListaDireccionCampos.Add('COORDINACION=-1');
  ListaDireccionCampos.Add('FECHAREPROGRAMACION=-1');
  ListaDireccionCampos.Add('FECHAINICIALANTERIOR=-1');
  ListaDireccionCampos.Add('FECHAFINALANTERIOR=-1');
  ListaDireccionCampos.Add('FECHAINICIALNUEVA=-1');
  ListaDireccionCampos.Add('FECHAFINALNUEVA=-1');
  ListaDireccionCampos.Add('MOTIVOREPROGRAMACION=-1');
end;

procedure TfConsultaMantenimientoReprogramado.FormKeyPress(Sender: TObject; var Key: Char);
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

{
procedure TfConsultaMantenimientoReprogramado.DBLCBSubestacionClick(Sender: TObject);
begin
  if DBLCBSubestacion.Text<>'' then
  begin
    if rbSubestacion.Checked then
      begin
        if Elemento.Enabled = false then
          Elemento.Enabled:= true
        else
          begin
            if (Elemento.Text <> '') then
              begin
                Elemento.KeyValue:= 0;
                if cbElemento.Items.Count > 1 then
                  cbElemento.Clear;
              end;
          end;
      end
    else
      begin
        if qCircuito.Active then
          qCircuito.Close;
        qCircuito.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(DBLCBSubestacion.keyvalue);
        qCircuito.Open;
        if Elemento.Enabled = false then
          Elemento.Enabled:= true
        else
          begin
            if(Elemento.Text <> '') then
              begin
                Elemento.KeyValue:= 0;
                if cbElemento.Items.Count > 1 then
                  cbElemento.Clear;
              end;
          end;
      end;
  end;
end;       }


procedure TfConsultaMantenimientoReprogramado.qMantenimientosCODIGOTAREAChange(
  Sender: TField);
begin
  if qSubactividades.Active then
    qSubactividades.Close;
  qSubactividades.ParamByName('CODIGOMANTENIMIENTO').AsString:=Sender.AsString;
  qSubactividades.Open;
end;

procedure TfConsultaMantenimientoReprogramado.SpeedButton2Click(
  Sender: TObject);
begin
  fFiltroConsultaMttoReprogramado:=TfFiltroConsultaMttoReprogramado.Create(Application);
  fFiltroConsultaMttoReprogramado.ShowModal;
  qMantenimientos.SQL.Clear;
  qMantenimientos.Close;
  qMantenimientos.sql.text:=fFiltroConsultaMttoReprogramado.qmantenimientos.sql.text;
  qMantenimientos.Open;
  qSubactividades.Close;
  qSubactividades.Open;
  if qMantenimientos.RecordCount <> 1 then
    PanelSuperior.Caption := 'CONSULTA DE MANTENIMIENTOS REPROGRAMADOS     << ' + inttostr(qMantenimientos.recordcount)+' Registros Encontrados >>'
  else PanelSuperior.Caption := 'CONSULTA DE MANTENIMIENTOS REPROGRAMADOS     << ' +inttostr(qMantenimientos.recordcount)+' Registro Encontrado >>';
  fFiltroConsultaMttoReprogramado.Free;
end;

procedure TfConsultaMantenimientoReprogramado.SBSalirClick(
  Sender: TObject);
begin
  close;
end;

procedure TfConsultaMantenimientoReprogramado.FormDestroy(Sender: TObject);
begin
  qMantenimientos.Free;
end;

procedure TfConsultaMantenimientoReprogramado.CodigoMttoClick(
  Sender: TObject);
var Posicion:Integer;
begin
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
  with RxDBGMttoReprogramado do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosCODIGOMANTENIMIENTO;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaMantenimientoReprogramado.SBOrdenarClick(
  Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel2.ClientToScreen(Classes.Point(SBOrdenar.Left, SBOrdenar.top));
  pmOrdenar.Popup(punto.x+10, punto.y+10);
end;

procedure TfConsultaMantenimientoReprogramado.NombreMantenimientoClick(
  Sender: TObject);
var Posicion:Integer;
begin
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
  with RxDBGMttoReprogramado do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBRETAREA;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaMantenimientoReprogramado.Ordenar(sCriterio: String);
begin
  qMantenimientos.Close;
  qMantenimientos.SQL.Delete(qMantenimientos.SQL.Count - 1);
  qMantenimientos.SQL.Add(sCriterio);
  qMantenimientos.Open;
  RxDBGMttoReprogramado.SetFocus
end;

procedure TfConsultaMantenimientoReprogramado.CoordinacionClick(
  Sender: TObject);
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
  with RxDBGMttoReprogramado do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBREAREAOPERACIONODT;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaMantenimientoReprogramado.FechaInicialAnteriorClick(
  Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHAINICIALANTERIOR');
  sCriterio := 'ORDER BY MR.fechainicialanterior DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['FECHAINICIALANTERIOR']='1' then
    begin
      sCriterio := 'ORDER BY mr.fechainicialanterior ASC';
      ListaDireccionCampos.Values['FECHAINICIALANTERIOR']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHAINICIALANTERIOR']:='1'
  end;
  FechaInicialAnterior.Checked := true;
  Ordenar(sCriterio);
  with RxDBGMttoReprogramado do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosFECHAINICIALANTERIOR;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaMantenimientoReprogramado.FechaFinalAnteriorClick(
  Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHAFINALANTERIOR');
  sCriterio := 'ORDER BY MR.FECHAFINALANTERIOR DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['FECHAFINALANTERIOR']='1' then
    begin
      sCriterio := 'ORDER BY mr.FECHAFINALANTERIOR ASC';
      ListaDireccionCampos.Values['FECHAFINALANTERIOR']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHAFINALANTERIOR']:='1'
  end;
  FECHAFINALANTERIOR.Checked := true;
  Ordenar(sCriterio);
  with RxDBGMttoReprogramado do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosFECHAFINALANTERIOR;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaMantenimientoReprogramado.FechaInicialNuevaClick(
  Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHAINICIALNUEVA');
  sCriterio := 'ORDER BY MR.FECHAINICIALNUEVA DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['FECHAINICIALNUEVA']='1' then
    begin
      sCriterio := 'ORDER BY mr.FECHAINICIALNUEVA ASC';
      ListaDireccionCampos.Values['FECHAINICIALNUEVA']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHAINICIALNUEVA']:='1'
  end;
  FECHAINICIALNUEVA.Checked := true;
  Ordenar(sCriterio);
  with RxDBGMttoReprogramado do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosFECHAINICIALNUEVA;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaMantenimientoReprogramado.FechaFinalNuevaClick(
  Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHAFINALNUEVA');
  sCriterio := 'ORDER BY MR.FECHAFINALNUEVA DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['FECHAFINALNUEVA']='1' then
    begin
      sCriterio := 'ORDER BY mr.FECHAFINALNUEVA ASC';
      ListaDireccionCampos.Values['FECHAFINALNUEVA']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHAFINALNUEVA']:='1'
  end;
  FECHAFINALNUEVA.Checked := true;
  Ordenar(sCriterio);
  with RxDBGMttoReprogramado do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosFECHAFINALNUEVA;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaMantenimientoReprogramado.FechaReprogramacionClick(
  Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHAREPROGRAMACION');
  sCriterio := 'ORDER BY MR.FECHAREPROGRAMACION DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['FECHAREPROGRAMACION']='1' then
    begin
      sCriterio := 'ORDER BY mr.FECHAREPROGRAMACION ASC';
      ListaDireccionCampos.Values['FECHAREPROGRAMACION']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHAREPROGRAMACION']:='1'
  end;
  FECHAREPROGRAMACION.Checked := true;
  Ordenar(sCriterio);
  with RxDBGMttoReprogramado do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosFECHAREPROGRAMACION;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaMantenimientoReprogramado.MotivoReprogramacionClick(
  Sender: TObject);
var Posicion:Integer;
begin
  Posicion:=ListaDireccionCampos.IndexOfName('MOTIVOREPROGRAMACION');
  sCriterio := 'ORDER BY MR.MOTIVOREPROGRAMACION DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['MOTIVOREPROGRAMACION']='1') then
    begin
      sCriterio := 'ORDER BY MR.MOTIVOREPROGRAMACION ASC';
      ListaDireccionCampos.Values['MOTIVOREPROGRAMACION']:='-1';
    end
    else
      ListaDireccionCampos.Values['MOTIVOREPROGRAMACION']:='1'
  end;
  MotivoReprogramacion.Checked := true;
  Ordenar(sCriterio);
  with RxDBGMttoReprogramado do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosMOTIVOREPROGRAMACION;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;     

procedure TfConsultaMantenimientoReprogramado.SBBuscarClick(
  Sender: TObject);
begin
  FBusquedaMttoReprogramado := TFBusquedaMttoReprogramado.Create(Application);
  FBusquedaMttoReprogramado.dsMtto.DataSet:=qMantenimientos;
  FBusquedaMttoReprogramado.ShowModal;
  FBusquedaMttoReprogramado.Free;
  RxDBGMttoReprogramado.Setfocus;
end;

procedure TfConsultaMantenimientoReprogramado.sbRefrescarClick(
  Sender: TObject);
begin
  qMantenimientos.Close;
  qMantenimientos.Open;
  qSubactividades.Close;
  qSubactividades.Open;
end;

procedure TfConsultaMantenimientoReprogramado.sbExportarClick(
  Sender: TObject);
Var
  oXL, oWB: Variant;
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
  oWB.ActiveSheet.Cells[1,3] := 'COORDINACION';
  oWB.ActiveSheet.Cells[1,4] := 'FECHA REPROGRAMACION';
  oWB.ActiveSheet.Cells[1,5] := 'FECHA INICIAL ANTERIOR';
  oWB.ActiveSheet.Cells[1,6] := 'ECHA FINAL ANTERIOR';
  oWB.ActiveSheet.Cells[1,7] := 'FECHA INICIAL NUEVA';
  oWB.ActiveSheet.Cells[1,8] := 'FECHA FINAL NUEVA';
  oWB.ActiveSheet.Cells[1,9] := 'MOTIVO DE REPROGRAMACION';
  qMantenimientos.First;
  fila:= 2;
  while not qMantenimientos.eof do
  begin
    oWB.ActiveSheet.Cells[fila,1] :=  qMantenimientos.FIELDBYNAME('CODIGOMANTENIMIENTO').asstring;
    oWB.ActiveSheet.Cells[fila,2] :=  qMantenimientos.FIELDBYNAME('NOMBRETAREA').asstring;
    oWB.ActiveSheet.Cells[fila,3] :=  qMantenimientos.FIELDBYNAME('NOMBREAREAOPERACIONODT').asstring;
    oWB.ActiveSheet.Cells[fila,4] :=  qMantenimientos.FIELDBYNAME('FECHAREPROGRAMACION').asstring;
    oWB.ActiveSheet.Cells[fila,5] :=  qMantenimientos.FIELDBYNAME('FECHAINICIALANTERIOR').asstring;
    oWB.ActiveSheet.Cells[fila,6] :=  qMantenimientos.FIELDBYNAME('FECHAFINALANTERIOR').asstring;
    oWB.ActiveSheet.Cells[fila,7] :=  qMantenimientos.FIELDBYNAME('FECHAINICIALNUEVA').asstring;
    oWB.ActiveSheet.Cells[fila,8] :=  qMantenimientos.FIELDBYNAME('FECHAINICIALNUEVA').asstring;
    oWB.ActiveSheet.Cells[fila,9] :=  qMantenimientos.FIELDBYNAME('MOTIVOREPROGRAMACION').asstring;
    fila:= fila + 1;
    qMantenimientos.next;
  end;
  oWB.SaveAs('C:\EnerGIS4\ConsultaMttosReprogramados'+'_'+IntToStr(Day)+'_'+ IntToStr(Month)+'_' +IntToStr(Year) + '_'+ IntToStr(Hour)+'y'+IntToStr(Min),null,'','',EmptyParam,EmptyParam,0, EmptyParam, EmptyParam, EmptyParam,EmptyParam,0);
end;

procedure TfConsultaMantenimientoReprogramado.SBImprimirClick(
  Sender: TObject);
begin
Application.ProcessMessages;
  fQRMttoReprogramado:=TfQRMttoReprogramado.create(Application);
  fQRMttoReprogramado.qMttoReprogramado.SQL.Clear;
  fQRMttoReprogramado.qMttoReprogramado.Close;
  fQRMttoReprogramado.qMttoReprogramado.SQL.Text:=qMantenimientos.SQL.Text;
  fQRMttoReprogramado.qMttoReprogramado.Open;
  FQRMttoReprogramado.qEmpresa.Open;
//  fQRMttoReprogramado.QRDBText7.Caption :=CBELEMENTO.TEXT;
  //FECHA IMPRESIÓN
  fQRMttoReprogramado.QRLBFecha.Caption := DateTimeToStr(Now);
  fQRMttoReprogramado.QuickRep1.Preview;
end;

end.



