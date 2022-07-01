
unit UMantenimiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, DBTables, DBCtrls, StdCtrls, Mask, ExtCtrls, Buttons,UTareaMtto,
  CheckLst, Grids, DBGrids, ConsDll;

type
  TDatosCorreo=record
    servidor:string;
    login:string;
    psswd:string;
    Destino:string;
  end;
  TFMantenimiento = class(TFTareaMtto)
    DSMantenimiento: TDataSource;
    UpdateMantenimiento: TUpdateSQL;
    QAmbito: TQuery;
    DSAmbito: TDataSource;
    QTipoMantenimiento: TQuery;
    DSTipoMantenimiento: TDataSource;
    QSubestacion: TQuery;
    DSSubestacion: TDataSource;
    QCircuito: TQuery;
    DSCircuito: TDataSource;
    DSTipoElemento: TDataSource;
    QTipoElemento: TQuery;
    DSNivelTension: TDataSource;
    QNivelTension: TQuery;
    QBancoMantenimientos: TQuery;
    QBms: TQuery;
    Subestacion: TDBLookupComboBox;
    Circuito: TDBLookupComboBox;
    GroupBoxFechasEjecucion: TGroupBox;
    LabelFechaInicioEjec: TLabel;
    LabelFechaFinEjec: TLabel;
    LabelFechaHoraEjecucion: TLabel;
    MEFechaInicioEjec: TMaskEdit;
    MEFechaFinEjec: TMaskEdit;
    GroupBox1: TGroupBox;
    SBProgramar: TSpeedButton;
    SBMantenimiento: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CodigoNivelTension: TDBLookupComboBox;
    CodigoTipoMant: TDBLookupComboBox;
    CodigoAmbito: TDBLookupComboBox;
    CodigoTipoElemento: TDBLookupComboBox;
    QMantenimiento: TQuery;
    QMantenimientoCODIGOTIPOMANT: TFloatField;
    QMantenimientoFECHAINICIOEJEC: TDateTimeField;
    QMantenimientoFECHAFINEJEC: TDateTimeField;
    QMantenimientoCODIGOSUBESTACION: TStringField;
    QMantenimientoCODIGOCIRCUITO: TStringField;
    QMantenimientoCODIGOBANCOMANTENIMIENTO: TFloatField;
    ECodigoElemento: TDBEdit;
    GroupBox2: TGroupBox;
    LabelCodigoSubestacion: TLabel;
    LabelCodigoCircuito: TLabel;
    Label6: TLabel;
    Query1: TQuery;
    QTareaCODIGOTAREA: TFloatField;
    QTareaCODIGOUSUARIO: TFloatField;
    QTareaNOMBRETAREA: TStringField;
    QTareaFECHAINICIAL: TDateTimeField;
    QTareaFECHAFINAL: TDateTimeField;
    QTareaCODIGOESTADOTAREA: TFloatField;
    QTareaDESCRIPCION: TBlobField;
    QTareaCODIGOTIPOTAREA: TFloatField;
    QTareaFRECUENCIA: TFloatField;
    QTareaFECHAALARMA: TDateTimeField;
    QTareaCODIGODESC: TStringField;
    QTipoMantenimientoCODIGOTIPOMANT: TFloatField;
    QTipoMantenimientoNOMBREMANT: TStringField;
    ETipoElemento: TEdit;
    qCaracteristicasElemento: TQuery;
    qTablaElemento: TQuery;
    sTablaElemento: TDataSource;
    qNodoMT: TQuery;
    sNodoMT: TDataSource;
    CElemento: TComboBox;
    Memo1: TMemo;
    qElementoMantenimiento: TQuery;
    updateElementomantenimiento: TUpdateSQL;
    QBancoMantenimientosCODIGOBANCOMANTENIMIENTO: TFloatField;
    QBancoMantenimientosNOMBREMANTENIMIENTO: TStringField;
    QBancoMantenimientosCODIGONIVELTENSION: TStringField;
    QBancoMantenimientosCODIGOAMBITO: TFloatField;
    QBancoMantenimientosFRECUENCIA: TFloatField;
    QBancoMantenimientosDESCRIPCION: TBlobField;
    QBancoMantenimientosCODIGOTIPOMANT: TFloatField;
    QBancoMantenimientosCODIGODESCRIPTIVO: TStringField;
    QBancoMantenimientosCODIGOAREAOPERACIONODT: TFloatField;
    Memo2: TMemo;
    clbActividades: TCheckListBox;
    dbgMantenimientos: TDBGrid;
    DSBancoMantenimientos: TDataSource;
    DSActividades: TDataSource;
    qActividades: TQuery;
    SBConsulta: TSpeedButton;
    qActividadesCODIGOACTIVIDADMANTENIMIENTO: TFloatField;
    qActividadesCODIGOBANCOMANTENIMIENTO: TFloatField;
    qActividadesCODIGOSUBACTIVIDADAREAODT: TFloatField;
    qActividadesNOMBREACTIVIDADMANTENIMIENTO: TStringField;
    qActividadesProgramadas: TQuery;
    DSActividadesProgramadas: TDataSource;
    UActividadesProgramadas: TUpdateSQL;
    qActividadesProgramadasCONSECUTIVOACTIVIDAD: TFloatField;
    qActividadesProgramadasCODIGOMANTENIMIENTO: TFloatField;
    qActividadesProgramadasCODIGOACTIVIDADMANTENIMIENTO: TFloatField;
    Label7: TLabel;
    clbSubactividadprueba: TCheckListBox;
    qSubactividadprueba: TQuery;
    qPruebasprogramadas: TQuery;
    updpruebaspr: TUpdateSQL;
    Label8: TLabel;
    QBancoMantenimientosCODIGOELEMENTO: TFloatField;
    qPruebasprogramadasCONSECUTIVOACTIVIDAD: TFloatField;
    qPruebasprogramadasCODIGOMANTENIMIENTO: TFloatField;
    qPruebasprogramadasCODIGOSUBACTIVIDADPRUEBA: TFloatField;
    Label9: TLabel;
    Label10: TLabel;
    sbFechaInicial: TSpeedButton;
    sbFechaFinal: TSpeedButton;
    sbFechaAlarma: TSpeedButton;
    dbeFechaInicial: TDBEdit;
    dbeFechaFinal: TDBEdit;
    dbeFechaAlarma: TDBEdit;
    dbmObservacion: TDBMemo;
    Label11: TLabel;
    QMantenimientoOBSERVACIONELEMENTO: TStringField;
    QMantenimientoCODIGOMANTENIMIENTO: TFloatField;
    QMantenimientoCODIGOAMBITO: TFloatField;
    QMantenimientonombresubestacion: TStringField;
    qmttoReprogramado: TQuery;
    qmttoReprogramadoCODIGOMANTENIMIENTO: TFloatField;
    qmttoReprogramadoCODIGOUSUARIO: TFloatField;
    qmttoReprogramadoFECHAINICIALANTERIOR: TDateTimeField;
    qmttoReprogramadoFECHAFINALANTERIOR: TDateTimeField;
    qmttoReprogramadoFECHAALARMAANTERIOR: TDateTimeField;
    qmttoReprogramadoFECHAINICIALNUEVA: TDateTimeField;
    qmttoReprogramadoFECHAFINALNUEVA: TDateTimeField;
    qmttoReprogramadoFECHAALARMANUEVA: TDateTimeField;
    qmttoReprogramadoCODIGOMTTOREPROGRAMADO: TFloatField;
    dsMttoReprogramado: TDataSource;
    updMttoReprogramado: TUpdateSQL;
    Edit1: TEdit;
    QMantenimientoCODIGOHOJAVIDAEQUIPO: TFloatField;
    qHojaVidaEquipo: TQuery;
    dsHojaVidaEquipo: TDataSource;
    qHojaVidaEquipoCODIGOHOJAVIDAEQUIPO: TFloatField;
    Query2: TQuery;
    lbSp: TListBox;
    listamantenimientos: TListBox;
    codigo2: TListBox;
    codigo1: TListBox;
    ECodigoBancoMantenimiento: TDBEdit;
    NombreMantenimiento: TEdit;
    SBEliminarActividades: TSpeedButton;
    SBIncluirActividades: TSpeedButton;
    ECodElemento: TEdit;
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure QMantenimientoBeforePost(DataSet: TDataSet);
    procedure QMantenimientoAfterPost(DataSet: TDataSet);
    procedure ConsultarMantenimiento(CodMantenimiento:Real);
    procedure CodigoAmbitoClick(Sender: TObject);
    procedure SubestacionClick(Sender: TObject);
    procedure CodigoTipoMantClick(Sender: TObject);
    procedure CodigoTipoElementoClick(Sender: TObject);
    procedure CodigoNivelTensionClick(Sender: TObject);
    procedure listamantenimientosDblClick(Sender: TObject);
    procedure QTareaNewRecord(DataSet: TDataSet);
    procedure SBProgramarClick(Sender: TObject);
    procedure SBMantenimientoClick(Sender: TObject);
    procedure QTareaBeforePost(DataSet: TDataSet);
    procedure CircuitoClick(Sender: TObject);
    procedure qElementoMantenimientoBeforePost(DataSet: TDataSet);
    procedure QBancoMantenimientosAfterScroll(DataSet: TDataSet);
    procedure qActividadesProgramadasNewRecord(DataSet: TDataSet);
    procedure SBConsultaClick(Sender: TObject);
    procedure SBIncluirActividadesClick(Sender: TObject);
    procedure SBEliminarActividadesClick(Sender: TObject);
    procedure sbFechaInicialClick(Sender: TObject);
    procedure dbgMantenimientosEnter(Sender: TObject);
    procedure dbgMantenimientosExit(Sender: TObject);
    procedure clbActividadesClickCheck(Sender: TObject);
    procedure sbFechaFinalClick(Sender: TObject);
    procedure sbFechaAlarmaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qmttoReprogramadoAfterDelete(DataSet: TDataSet);
    procedure qmttoReprogramadoAfterPost(DataSet: TDataSet);
    procedure bbAceptarClick(Sender: TObject);
    procedure bbCancelarClick(Sender: TObject);
    function getDatosCorreo:TDatosCorreo;
    procedure Button1Click(Sender: TObject);
    
  private
    { Private declarations }
  public
        Correo:TDatosCorreo;
        Codigo:Real;
        sFecha,Fecha,fechaini,fechafin,fechaalarma:String;
        edicionMtto:boolean;
        NActividadesProgramadas,FormaEdicion: integer;
        agregomantenimiento,realizarscroll, listadomttos:boolean;
        codigobancomantenimiento,codigotipom,codigotipoa,codigotipoe,codigont,actividades: TStringList;
        codigosubestacionactual : string;
        function GetFecha(Tipo:Boolean): String;
        constructor crearnuevo(AOwner: TComponent);
        constructor editar(AOwner: TComponent; codigomantenimiento: real;forma:integer);

    { Public declarations }
  end;

var
   FMantenimiento: TFMantenimiento;
implementation

uses UCronograma, uFormaFecha, uFormaFechaMtto, uMantenimientoReprogramado,
  ufiltroConsultaBancoMantenimiento, uFIMPComunes;
{$R *.DFM}
//******************************************************************************

function TfMantenimiento.GetFecha(Tipo:Boolean): String;
begin
  fFormaFechaMtto := TfFormaFechaMtto.Create(Application);
  uFormaFechaMtto.sFecha := sFecha;
  fFormaFechaMtto.height:=291;
  if FFormaFechaMtto.ShowModal = mrOk then
    if Tipo then
       Result := DateTimetoStr(FFormaFechaMtto.Date+FFormaFechaMtto.fTime)
    else
       Result := DateTimetoStr(FFormaFechaMtto.Date)
  else Result := sFecha;
  fFormaFechaMtto.Free;
end;

procedure TFMantenimiento.FormCreate(Sender: TObject);
begin
     inherited;
     if QTipoMantenimiento.Active then
        QTipoMantenimiento.Close;
     QTipoMantenimiento.Open;
     if QEstado.Active then
        QEstado.Close;
     QEstado.Open;
     if QAmbito.Active then
        QAmbito.Close;
     QAmbito.Open;
     if QSubestacion.Active then
        QSubestacion.Close;
     QSubestacion.Open;
     if QCircuito.Active then
        QCircuito.Close;
     QCircuito.Open;
     if QTipoElemento.Active then
        QTipoElemento.Close;
     QTipoElemento.Open;
     if QNivelTension.Active then
        QNivelTension.Close;
     QNivelTension.Open;
     Correo:=getDatosCorreo;
end;
//******************************************************************************
procedure TFMantenimiento.QMantenimientoBeforePost(DataSet: TDataSet);
var Qry:TQuery;
    Sql:String;
    elemento:string;
begin
  inherited;
  {if MEFechaInicioEjec.text<>'  /  /       :  ' then
    QMantenimiento.FieldByName('FECHAINICIOEJEC').value:= StrToDateTime(MEFechaInicioEjec.Text)
  else
    QMantenimiento.FieldByName('FECHAINICIOEJEC').value := Null;
  if MEFechaFinEjec.text<>'  /  /       :  ' then
    QMantenimiento.FieldByName('FECHAFINEJEC').value:= StrToDateTime(MEFechaFinEjec.Text)
  else
    QMantenimiento.FieldByName('FECHAFINEJEC').value:= Null;}
  elemento:=CElemento.Text;
  QMantenimiento.FieldByName('CODIGOMANTENIMIENTO').Value:=QTarea.FieldByName('CODIGOTAREA').Value;
  qHojaVidaEquipo.Close;
  qHojaVidaEquipo.ParamByName('CODIGOTIPOELEMENTO').AsInteger:=QBancoMantenimientosCODIGOELEMENTO.AsInteger;
  qHojaVidaEquipo.ParamByName('CODIGOELEMENTO').AsString:=Elemento;
  qHojaVidaEquipo.Open;
  QMantenimientoCODIGOHOJAVIDAEQUIPO.AsFloat:=qHojaVidaEquipoCODIGOHOJAVIDAEQUIPO.AsFloat;
end;
//******************************************************************************
procedure TFMantenimiento.QMantenimientoAfterPost(DataSet: TDataSet);
begin
  inherited;
end;
//******************************************************************************

//******************************************************************************

//******************************************************************************
procedure TFMantenimiento.ConsultarMantenimiento(CodMantenimiento:Real);
var
   Sql,Sql2,Sql3:String;
   Qry,Qry2,Qry3:TQuery;
   Cod_Mantenimiento:string;
begin
     inherited;
     if not QMantenimiento.FieldByName('FECHAINICIOEJEC').IsNull then
       MEFechaInicioEjec.Text:=FormatDateTime('dd/mm/yyyy hh:nn',Qmantenimiento.FieldByName('FECHAINICIOEJEC').AsDateTime);
     if not QMantenimiento.FieldByName('FECHAFINEJEC').IsNull then
       MEFechaFinEjec.Text:=FormatDateTime('dd/mm/yyyy hh:nn',Qmantenimiento.FieldByName('FECHAFINEJEC').AsDateTime);
     if CodigoAmbito.KeyValue=2 then
        begin
             subestacion.Visible:=true;
             labelcodigosubestacion.Visible:=true;
             if QCircuito.Active then
               QCircuito.Close;
             QCircuito.ParamByName('CODIGOSUBESTACION').AsString:= VarToStr(subestacion.KeyValue);
             QCircuito.Open;
             circuito.KeyValue:= QMantenimiento.fieldByName('CODIGOCIRCUITO').AsString;
             if (circuito.Visible = False) and (labelcodigocircuito.Visible = False)  then
               begin
                 circuito.Visible:=true;
                 labelcodigocircuito.Visible:=true;
               end;
        end;
      if CodigoAmbito.KeyValue=1 then
        begin
          if (circuito.Visible) and (labelcodigocircuito.Visible) then
            begin
              circuito.Visible:= False;
              labelcodigocircuito.Visible:= False;
            end;
        end;
end;
//******************************************************************************
procedure TFMantenimiento.CodigoAmbitoClick(Sender: TObject);
begin
  inherited;
  codigobancomantenimiento:= TStringList.Create;
  codigotipom:= TStringList.Create;
  codigont:= TStringlist.Create;
  codigotipoe:= TStringList.Create;
  codigotipoa:= TStringList.Create;
  realizarscroll:= false;
  if QBancoMantenimientos.Active then
  QBancoMantenimientos.Close;
  QBancoMantenimientos.SQL.Clear;
  QBancoMantenimientos.SQL.add(' select * from pm_bancomantenimiento where ' +
                       ' ACTIVO = ''S'' AND COdigoambito='+VarToStr(CodigoAmbito.keyvalue));
  if CodigoTipoElemento.Enabled = false then
   CodigoTipoElemento.Enabled:= true;
  if QTipoElemento.Active then
   QTipoElemento.Close;
  QTipoElemento.ParamByName('CODIGOAMBITO').AsInteger:= CodigoAmbito.KeyValue;
  QTipoElemento.Open;
  if CodigoTipoElemento.Text <> '' then
  QBancoMantenimientos.SQL.add(' and codigoelemento='+VarToStr(CodigoTipoElemento.keyvalue));
  if CodigoTipoMant.Text <> '' then
  QBancoMantenimientos.SQL.add(' and codigotipomant='+VarToStr(CodigoTipoMant.keyvalue));
  if CodigoNivelTension.Text <> '' then
  QBancoMantenimientos.SQL.add(' and codigoniveltension='+VarToStr(CodigoNivelTension.keyvalue));
  QBancoMantenimientos.Open;
  codigobancomantenimiento.Clear;
  listamantenimientos.Clear;
  codigotipom.clear;
  codigont.Clear;
  codigotipoe.Clear;
  codigotipoa.Clear;

  if clbActividades.Items.Count > 1 then
    clbActividades.Clear;

  if qActividades.Active then
    qActividades.Close;
  qActividades.ParamByName('CODIGOBANCOMANTENIMIENTO').asfloat:= QBancoMantenimientos.fieldbyname('CODIGOBANCOMANTENIMIENTO').asfloat;
  qActividades.Open;
  if not qActividades.IsEmpty then
    begin
      actividades.Clear;
      while not qActividades.Eof do
        begin
          clbActividades.Items.Append(qActividades.fieldbyname('NOMBREACTIVIDADMANTENIMIENTO').asstring);
          actividades.Append(qActividades.fieldbyname('CODIGOACTIVIDADMANTENIMIENTO').asstring);
          qActividades.Next;
        end;
    end;
end;
//******************************************************************************
procedure TFMantenimiento.SubestacionClick(Sender: TObject);
var a,B,c: string;
begin
  inherited;
  if Circuito.Visible = True then
    begin
      if qcircuito.Active then
        qcircuito.Close;
      qcircuito.ParamByName('codigosubestacion').value:=subestacion.keyvalue;
      qcircuito.open;
    end
  else
    begin
      memo1.Lines.Append(qtablaelemento.Text);

      if qTablaElemento.Active then
        qTablaElemento.Close;
    B:=VARTOSTR(Subestacion.KEYVALUE);
    ///*** ELP
    if(AnsiCompareStr(B,'LN'))<>1 then
    BEGIN
      if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString='LINEA' then
        raise Exception.Create('Debe seleccionar la Subestación Líneas')
      else
      begin
        qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(Subestacion.keyvalue);
        a:= qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring;
      end;
    END
    else
    begin
      if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString<>'LINEA' then
        raise Exception.Create('Debe seleccionar una subestación diferente a Líneas');
    end;
{    ELSE
       ShowMessage('es linea');
 }
    ///*** ELP
      qTablaElemento.Open;
      if (qTablaElemento.RecordCount > 0) then
        begin
          if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'')then
            begin
              if codigo1.Items.Count >= 1 then
                codigo1.Clear;
              if CElemento.Items.Count >= 1 then
                CElemento.Clear;

              while not qTablaElemento.Eof do
                begin
                  codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                  CElemento.Items.Append(qTablaElemento.fields[1].asstring);
                  qTablaElemento.Next;
                end;
            end
          else
            begin
              if codigo1.Items.Count >= 1 then
                codigo1.Clear;
              if CElemento.Items.Count >= 1 then
                CElemento.Clear;
              while not qTablaElemento.Eof do
                begin
                  codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                  CElemento.Items.Append(qTablaElemento.fields[0].asstring);
                  qTablaElemento.Next;
                end;
            end;
        end
      else
        MessageDlg('No se encontraron elementos de ese tipo asociados con la subestación.', mtInformation,[mbOk], 0);
    end;
end;

constructor TFMantenimiento.crearnuevo(AOwner: TComponent);
begin
   inherited Create(Owner);
   FormaEdicion:= 0;
   edicionMtto:=false;
   realizarscroll:= true;
   codigobancomantenimiento:= TStringList.Create;
   codigotipom:= TStringList.Create;
   codigont:= TStringList.Create;
   codigotipoe:= TStringList.Create;
   codigotipoa:= TStringList.Create;

   if QEstado.Active then
    QEstado.Close;
   QEstado.Open;

   if QTipoMantenimiento.Active then
    QTipoMantenimiento.Close;
   QTipoMantenimiento.Open;

   if QAmbito.Active then
    QAmbito.Close;
   QAmbito.Open;
   if QSubestacion.Active then
    QSubestacion.Close;
   QSubestacion.Open;

   if QCircuito.Active then
    QCircuito.Close;
   QCircuito.Open;

   if QTipoElemento.Active then
    QTipoElemento.Close;
   QTipoElemento.Open;
   if QNivelTension.Active then
    QNivelTension.Close;
   QNivelTension.Open;

   if qSubactividadprueba.Active then
     qSubactividadprueba.Close;
   qSubactividadprueba.Open;
   if qPruebasprogramadas.Active then
     qPruebasprogramadas.Close;
   qPruebasprogramadas.Open;

   if QMantenimiento.Active then
     QMantenimiento.Close;
   QMantenimiento.Open;

   if QTarea.Active then
     QTarea.Close;
   QTarea.Open;

   if qElementoMantenimiento.Active then
     qElementoMantenimiento.Close;
   qElementoMantenimiento.Open;

   if qActividadesProgramadas.Active then
     qActividadesProgramadas.Close;
   qActividadesProgramadas.Open;

   try
   QTarea.Append;
   except
   end;

   QMantenimiento.Append;
   qElementoMantenimiento.Append;
   if QBancoMantenimientos.Active then
     QBancoMantenimientos.Close;
   QBancoMantenimientos.Open;
   qbancomantenimientos.AfterScroll:= QBancoMantenimientosAfterScroll;
   codigobancomantenimiento.Clear;
   listamantenimientos.Clear;
   codigotipom.clear;
   codigont.Clear;
   codigotipoe.Clear;
   codigotipoa.Clear;

   while not QBancoMantenimientos.eof do
   begin
     codigobancomantenimiento.add(QBancoMantenimientos.fieldByName('CODIGOBANCOMANTENIMIENTO').AsString);
     listamantenimientos.Items.Add(QBancoMantenimientos.fieldByName('NOMBREMANTENIMIENTO').AsString);
     QBancoMantenimientos.next;
   end;
   QBancoMantenimientos.First;

   if (eTipoElemento.Visible=true)then
   begin
     ETipoElemento.visible:=false;
     CodigoTipoElemento.Visible:=true;
   end;

   if CodigoEstado.Enabled = False then
    CodigoEstado.Enabled:= True;
   if CodigoTipoMant.Enabled = False then
    CodigoTipoMant.Enabled:= True;
   if CodigoTipoElemento.Enabled = true then
     CodigoTipoElemento.Enabled:= false;
   if CodigoAmbito.Enabled = False then
    CodigoAmbito.Enabled:= True;
   if CodigoNivelTension.Enabled = False then
    CodigoNivelTension.Enabled:= True;
   if SBProgramar.Enabled = False then
    SBProgramar.Enabled:= True;
   if SBMantenimiento.Enabled = False then
    SBMantenimiento.Enabled:= True;
   if sbFechaInicial.Enabled = false then
     sbFechaInicial.Enabled:= true;
   if sbFechaFinal.Enabled = false then
     sbFechaFinal.Enabled:= true;
   if sbFechaAlarma.Enabled = false then
     sbFechaAlarma.Enabled:= true;
   if ECodigoBancoMantenimiento.ReadOnly = True then
    ECodigoBancoMantenimiento.ReadOnly:= False;
   if Subestacion.Enabled = True then
     Subestacion.Enabled:= False;
   if Circuito.Enabled = False then
    Circuito.Enabled:= True;
   if memo2.Visible = true then
     memo2.Visible:= false;
   if SBConsulta.Visible = false then
     SBConsulta.visible:= true;
   NActividadesProgramadas:= 1;
   CElemento.Clear;
end;

constructor TFMantenimiento.editar(AOwner: TComponent;
  codigomantenimiento: real;forma:integer);
var qry1,qry2,qry3,qry4:Tquery;
     dsElemento:TDataSource;
     sqltablaelemento1,sqlprueba:string;
begin
   inherited Create(Owner);
   FormaEdicion:= forma;
   codigobancomantenimiento:= TStringList.Create;
   codigotipom:= TStringList.Create;
   codigont:= TStringlist.Create;
   codigotipoe:= TStringList.Create;
   codigotipoa:= TStringList.Create;
   if QTarea.Active then
      QTarea.Close;
   QTarea.ParamByName('codigo').AsFloat:=codigomantenimiento;
   QTarea.Open;
   QTarea.Edit;
   if QMantenimiento.Active then
     QMantenimiento.Close;
   QMantenimiento.ParamByName('codmantenimiento').AsFloat:=codigomantenimiento;
   QMantenimiento.Open;
   QMantenimiento.Edit;

   if qElementoMantenimiento.Active then
     qElementoMantenimiento.Close;
   qElementoMantenimiento.ParamByName('CODIGOELEMENTOMANTENIMIENTO').asfloat:= codigomantenimiento;
   qElementoMantenimiento.Open;
   qElementoMantenimiento.Edit;

   if qActividadesProgramadas.Active then
     qActividadesProgramadas.Close;
   qActividadesProgramadas.Open;
   qActividadesProgramadas.Edit;

   if CodigoEstado.Enabled = True then
     CodigoEstado.Enabled:= False;
   if CodigoTipoMant.Enabled = True then
     CodigoTipoMant.Enabled:= False;
   if CodigoTipoElemento.Enabled = True then
     CodigoTipoElemento.Enabled:= False;
   if CodigoAmbito.Enabled = True then
     CodigoAmbito.Enabled:= False;
   if CodigoNivelTension.Enabled = True then
     CodigoNivelTension.Enabled:= False;
   if SBProgramar.Enabled = True then
     SBProgramar.Enabled:= False;
   if SBMantenimiento.Enabled = True then
     SBMantenimiento.Enabled:= False;
   if ECodigoBancoMantenimiento.ReadOnly = False then
     ECodigoBancoMantenimiento.ReadOnly:= True;
   if Subestacion.Enabled = True then
     Subestacion.Enabled:= False;
   if Circuito.Enabled = True then
     Circuito.Enabled:= False;
   if SBProgramar.ShowHint = True then
     SBProgramar.ShowHint:= False;
   if SBMantenimiento.ShowHint = True then
     SBMantenimiento.ShowHint:= False;
   if (forma = 1) then
     begin
       if sbFechaInicial.Enabled = false then
         sbFechaInicial.Enabled:= true;
       if sbFechaFinal.Enabled = false then
         sbFechaFinal.Enabled:= true;
       if sbFechaAlarma.Enabled = false then
         sbFechaAlarma.Enabled:= true;
       if MEFechaInicial.Enabled = false then
         MEFechaInicial.Enabled:= true;
       if MEFechaFinal.Enabled = false then
         MEFechaFinal.Enabled:= true;
       if MEFechaAlarma.Enabled = false then
         MEFechaAlarma.Enabled:= true;
     end
   else
     begin
       if sbFechaInicial.Enabled = true then
         sbFechaInicial.Enabled:= false;
       if sbFechaFinal.Enabled = true then
         sbFechaFinal.Enabled:= false;
       if sbFechaAlarma.Enabled = true then
         sbFechaAlarma.Enabled:= false;
       if MEFechaInicial.Enabled = true then
         MEFechaInicial.Enabled:= false;
       if MEFechaFinal.Enabled = true then
         MEFechaFinal.Enabled:= false;
       if MEFechaAlarma.Enabled = True then
         MEFechaAlarma.Enabled:= False;
       if MEFechaInicioEjec.Enabled = True then
         MEFechaInicioEjec.Enabled:= False;
       if MEFechaFinEjec.Enabled = True then
         MEFechaFinEjec.Enabled:= False;
     end;
   if CElemento.Visible = true then
     CElemento.Visible:= false;
   if SBConsulta.Visible = true then
     SBConsulta.visible:= false;
   clbactividades.Clear;
   CElemento.Clear;
   Memo2.Clear;
   if Memo2.Visible = false then
     Memo2.Visible:= true;
   if QBancoMantenimientos.Active then
     QBancoMantenimientos.Close;
   QBancoMantenimientos.SQL.Clear;
  // QBancoMantenimientos.SQL.Add('select * from pm_bancomantenimiento where codigobancomantenimiento=' + QMantenimiento.FieldByName('CODIGOBANCOMANTENIMIENTO').AsString);
   QBancoMantenimientos.SQL.Text:=' select bm.codigobancomantenimiento,bm.nombremantenimiento,bm.codigoniveltension,'+
                                  ' bm.codigoambito,bm.codigotipomant,bm.codigoelemento,bm.codigoareaoperacionodt,'+
                                  ' bm.frecuencia,a.nombreareaoperacionodt,t.tension, pa.nombreambito,pe.nombretipoelemento,'+
                                  ' bm.descripcion,bm.codigodescriptivo from pm_bancomantenimiento bm, areaoperacionodt a,'+
                                  ' niveltension t, pm_ambito pa, pm_elemento pe'+
                                  ' where bm.activo = ''S'' and a.activo = ''S'' and a.codigoareaoperacionodt=bm.codigoareaoperacionodt'+
                                  ' and t.codigoniveltension = bm.codigoniveltension'+
                                  ' and pa.codigoambito=bm.codigoambito'+
                                  ' and pe.codigoelemento=bm.codigoelemento'+
                                  ' and codigobancomantenimiento=' + QMantenimiento.FieldByName('CODIGOBANCOMANTENIMIENTO').AsString+
                                  ' order by bm.codigobancomantenimiento';
   QBancoMantenimientos.Open;
   qry4:= Tquery.Create(application);
   qry4.DatabaseName:='BaseDato';
   sqlprueba:= 'select pp.codigosubactividadprueba,sf.nombreseccionformato from pm_pruebasprogramadas pp,hve_seccionformato sf,subactividadprueba sp where'+' '+
               ' sf.activo = ''S'' and pp.codigomantenimiento =:codigomantenimiento and pp.codigosubactividadprueba = sp.codigosubactividadprueba and sp.codigoseccionformato = sf.codigoseccionformato';
   qry4.SQL.Clear;
   qry4.SQL.Append(sqlprueba);
   qry4.ParamByName('CODIGOMANTENIMIENTO').asfloat:= codigomantenimiento;
   qry4.Open;
   if clbSubactividadprueba.Items.Count > 0 then
     clbSubactividadprueba.Clear;
   while not qry4.Eof do
     begin
       clbSubactividadprueba.Items.Append(qry4.fieldbyname('NOMBRESECCIONFORMATO').asstring);
       qry4.Next;
     end;
   if clbSubactividadprueba.Enabled = true then
     clbSubactividadprueba.Enabled:= false;
   qry2:= TQuery.Create(application);
   qry2.DatabaseName:='BaseDato';
   qry2.SQL.Clear;
   qry2.SQL.Append('select * from pm_actividadesprogramadas where codigomantenimiento =:codigomantenimiento');
   qry2.ParamByName('CODIGOMANTENIMIENTO').asfloat:= codigomantenimiento;
   qry2.Open;

   qry3:= TQuery.Create(application);
   qry3.DatabaseName:='BaseDato';
   qry3.SQL.Clear;
   qry3.SQL.Append('select * from pm_actividadmantenimiento where codigoactividadmantenimiento =:codigoactividadmantenimiento');
   clbactividades.Clear;
   while not qry2.Eof do
     begin

       if qry3.Active then
         qry3.Close;
       qry3.ParamByName('CODIGOACTIVIDADMANTENIMIENTO').asfloat:= qry2.fieldbyname('codigoactividadmantenimiento').asfloat;
       qry3.Open;
       clbactividades.Items.Append(qry3.fieldbyname('NOMBREACTIVIDADMANTENIMIENTO').asstring);
       qry2.Next;
     end;
   if clbactividades.Enabled = true then
     clbactividades.Enabled:= false;
   CodigoTipoMant.KeyValue:= QBancoMantenimientos.fieldByName('CODIGOTIPOMANT').AsInteger;
   qry1:= TQuery.Create(Application);
   qry1.DatabaseName:='BaseDato';
   qry1.SQL.Clear;
   qbancomantenimientos.AfterScroll:= nil;
   qry1.SQL.Add('select * from pm_elemento where codigoelemento=:codigoelemento');
   qry1.ParamByName('CODIGOELEMENTO').AsInteger:=QBancoMantenimientos.fieldbyName('CODIGOELEMENTO').AsInteger;
   qry1.Open;
   eTipoElemento.text:=qry1.fieldbyname('NOMBRETIPOELEMENTO').asString;
  if (eTipoElemento.Visible=false)then
   begin
    ETipoElemento.visible:=true;
    CodigoTipoElemento.Visible:=false;
   end;
   dsElemento:= TDataSource.Create(application);
   dsElemento.DataSet:= qry1;
   label6.Caption:= qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring;

    //CONSULTAR ELEMENTO
   if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
     begin
       if qTablaElemento.Active then
         qTablaElemento.Close;
       qTablaElemento.SQL.Clear;
       sqltablaelemento1:= ' SELECT'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+','+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM ' + '  '+
                            qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+'  '+'WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+' = '''+qElementoMantenimiento.fieldbyname('CLELEMENTO1').AsString+''' '+
                            ' ORDER BY '+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring ;
       fcronograma.Memo1.Lines.Append(sqltablaelemento1);
       qTablaElemento.SQL.Add(sqltablaelemento1);
       qTablaElemento.Open;
       memo2.Lines.Append(qTablaElemento.Fields[1].asstring);
       CElemento.Items.Append(qTablaElemento.Fields[1].asstring);
       CElemento.ItemIndex:= 0;
     end
   else
     begin
       if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
         begin
           Memo2.Lines.Append(qElementoMantenimiento.fieldbyname('CLELEMENTO1').asstring);
         end
     end;
   if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
     begin
       if qTablaElemento.Active then
         qTablaElemento.Close;
       qTablaElemento.SQL.Clear;
       sqltablaelemento1:= ' SELECT '+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+','+qry1.fieldbyname('CLAVEELEMENTO2').asstring+','+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                             qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+'WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+' = '''+qElementoMantenimiento.fieldbyname('CLELEMENTO1').asstring+''' '+
                             'and'+qry1.fieldbyname('CLAVEELEMENTO').asstring+' = '''+qElementoMantenimiento.fieldbyname('CLELEMENTO2').asstring+''' '+
                             ' ORDER BY '+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring ;
       qTablaElemento.SQL.Add(sqltablaelemento1);
       qTablaElemento.Open;
       Memo2.Lines.Append(qTablaElemento.Fields[2].asstring);
     end
   else
     begin
       sqltablaelemento1:=  ' SELECT '+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+','+qry1.fieldbyname('CLAVEELEMENTO2').asstring+' '+' FROM'+' '+
                             qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+'WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+' =  '''+qElementoMantenimiento.fieldbyname('CLELEMENTO1').asstring+''' '+
                             'and'+qry1.fieldbyname('CLAVEELEMENTO2').asstring+' = '''+qElementoMantenimiento.fieldbyname('CLELEMENTO2').asstring+''' '+
                             ' ORDER BY '+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring ;

       fcronograma.Memo1.Lines.Append(sqltablaelemento1);
       Memo2.Lines.Append(qElementoMantenimiento.fieldbyname('CLELEMENTO1').asstring+qElementoMantenimiento.fieldbyname('CLELEMENTO2').asstring);
     end;
   CodigoAmbito.KeyValue:= QBancoMantenimientos.fieldByName('CODIGOAMBITO').AsInteger;
   CodigoNivelTension.KeyValue:= QBancoMantenimientos.fieldByName('CODIGONIVELTENSION').AsInteger;
   NombreMantenimiento.Text:= QBancoMantenimientos.fieldByName('NOMBREMANTENIMIENTO').AsString;
   dbgMantenimientos.OnDblClick:= nil;
   dbgMantenimientos.OnEnter:=nil;
   dbgMantenimientos.OnExit:=nil;
   ConsultarMantenimiento(codigomantenimiento);
end;

procedure TFMantenimiento.CodigoTipoMantClick(Sender: TObject);
begin
  inherited;
  realizarscroll:= false;
  codigobancomantenimiento:= TStringList.Create;
  codigotipom:= TStringList.Create;
  codigont:= TStringlist.Create;
  codigotipoe:= TStringList.Create;
  codigotipoa:= TStringList.Create;
  if QBancoMantenimientos.Active then
    QBancoMantenimientos.Close;
  QBancoMantenimientos.SQL.Clear;
  QBancoMantenimientos.SQL.add(' select * from pm_bancomantenimiento where ' +
                        'activo = ''S'' ans codigotipomant='+VarToStr(CodigoTipoMant.keyvalue));
  if CodigoAmbito.Text <> '' then
    QBancoMantenimientos.SQL.add(' and codigoambito='+VarToStr(CodigoAmbito.keyvalue));
  if CodigoTipoElemento.Text <> '' then
    QBancoMantenimientos.SQL.add(' and codigoelemento='+VarToStr(CodigoTipoElemento.keyvalue));
  if CodigoNivelTension.Text <> '' then
    QBancoMantenimientos.SQL.add(' and codigoniveltension='+VarToStr(CodigoNivelTension.keyvalue));
  QBancoMantenimientos.Open;
  codigobancomantenimiento.Clear;
  listamantenimientos.Clear;
  codigotipom.clear;
  codigont.Clear;
  codigotipoe.Clear;
  codigotipoa.Clear;

  if clbActividades.Items.Count > 1 then
    clbActividades.Clear;

  if qActividades.Active then
    qActividades.Close;
  qActividades.ParamByName('CODIGOBANCOMANTENIMIENTO').asfloat:= QBancoMantenimientos.fieldbyname('CODIGOBANCOMANTENIMIENTO').asfloat;
  qActividades.Open;
  if not qActividades.IsEmpty then
    begin
      actividades.Clear;
      while not qActividades.Eof do
        begin
          clbActividades.Items.Append(qActividades.fieldbyname('NOMBREACTIVIDADMANTENIMIENTO').asstring);
          actividades.Append(qActividades.fieldbyname('CODIGOACTIVIDADMANTENIMIENTO').asstring);
          qActividades.Next;
        end;
    end;
end;

procedure TFMantenimiento.CodigoTipoElementoClick(Sender: TObject);
begin
  inherited;
  realizarscroll:= false;
  codigobancomantenimiento:= TStringList.Create;
  codigotipom:= TStringList.Create;
  codigont:= TStringlist.Create;
  codigotipoe:= TStringList.Create;
  codigotipoa:= TStringList.Create;


  if QBancoMantenimientos.Active then
    QBancoMantenimientos.Close;
  QBancoMantenimientos.SQL.Clear;
  QBancoMantenimientos.SQL.add(' select * from pm_bancomantenimiento where ' +
                        ' activo = ''S'' and codigoelemento='+VarToStr(CodigoTipoElemento.keyvalue));

  if CodigoAmbito.Text <> '' then
    QBancoMantenimientos.SQL.add(' and codigoambito='+VarToStr(CodigoAmbito.keyvalue));
  if CodigoTipoMant.Text <> '' then
    QBancoMantenimientos.SQL.add(' and codigotipomant='+VarToStr(CodigoTipoMant.keyvalue));
  if CodigoNivelTension.Text <> '' then
    QBancoMantenimientos.SQL.add(' and codigoniveltension='+VarToStr(CodigoNivelTension.keyvalue));
  QBancoMantenimientos.Open;
  codigobancomantenimiento.Clear;
  listamantenimientos.Clear;
  codigotipom.clear;
  codigont.Clear;
  codigotipoe.Clear;
  codigotipoa.Clear;

 if clbActividades.Items.Count > 1 then
   clbActividades.Clear;

 if qActividades.Active then
   qActividades.Close;
 qActividades.ParamByName('CODIGOBANCOMANTENIMIENTO').asfloat:= QBancoMantenimientos.fieldbyname('CODIGOBANCOMANTENIMIENTO').asfloat;
 qActividades.Open;
 if not qActividades.IsEmpty then
   begin
     actividades.Clear;
     while not qActividades.Eof do
     begin
       clbActividades.Items.Append(qActividades.fieldbyname('NOMBREACTIVIDADMANTENIMIENTO').asstring);
       actividades.Append(qActividades.fieldbyname('CODIGOACTIVIDADMANTENIMIENTO').asstring);
       qActividades.Next;
     end;
   end;
end;

procedure TFMantenimiento.CodigoNivelTensionClick(Sender: TObject);
begin
  inherited;
  realizarscroll:= false;
  codigobancomantenimiento:= TStringList.Create;
  codigotipom:= TStringList.Create;
  codigont:= TStringlist.Create;
  codigotipoe:= TStringList.Create;
  codigotipoa:= TStringList.Create;

  if QBancoMantenimientos.Active then
    QBancoMantenimientos.Close;
  QBancoMantenimientos.SQL.Clear;
  QBancoMantenimientos.SQL.add(' select * from pm_bancomantenimiento where ' +
                        ' activo = ''S'' and codigoniveltension='+VarToStr(CodigoNivelTension.keyvalue));
  if CodigoAmbito.Text <> '' then
    QBancoMantenimientos.SQL.add(' and codigoambito='+VarToStr(CodigoAmbito.keyvalue));
  if CodigoTipoMant.Text <> '' then
    QBancoMantenimientos.SQL.add(' and codigotipomant='+VarToStr(CodigoTipoMant.keyvalue));
  if CodigoTipoElemento.Text <> '' then
    QBancoMantenimientos.SQL.add(' and codigoelemento='+VarToStr(CodigoTipoElemento.keyvalue));
  QBancoMantenimientos.Open;
  codigobancomantenimiento.Clear;
  listamantenimientos.Clear;
  codigotipom.clear;
  codigont.Clear;
  codigotipoe.Clear;
  codigotipoa.Clear;

  if clbActividades.Items.Count > 1 then
    clbActividades.Clear;
  if qActividades.Active then
    qActividades.Close;
  qActividades.ParamByName('CODIGOBANCOMANTENIMIENTO').asfloat:= QBancoMantenimientos.fieldbyname('CODIGOBANCOMANTENIMIENTO').asfloat;
  qActividades.Open;
  if not qActividades.IsEmpty then
  begin
    actividades.Clear;
    while not qActividades.Eof do
    begin
      clbActividades.Items.Append(qActividades.fieldbyname('NOMBREACTIVIDADMANTENIMIENTO').asstring);
      actividades.Append(qActividades.fieldbyname('CODIGOACTIVIDADMANTENIMIENTO').asstring);
      qActividades.Next;
    end;
  end;
end;

procedure TFMantenimiento.listamantenimientosDblClick(Sender: TObject);
var a:integer;
begin
  inherited;
  if listamantenimientos.Items.Count = 0 then
    MessageDlg('No hay Mantenimientos Disponibles para agregar.', mtInformation,[mbOk], 0)
  else
    begin
      if listamantenimientos.SelCount = 0 then
        MessageDlg('No hay Mantenimientos Disponibles para agregar.', mtInformation,[mbOk], 0)
      else
        begin
          a:= listamantenimientos.ItemIndex;
          QBancoMantenimientos.Locate('codigobancomantenimiento',strtofloat(codigobancomantenimiento.Strings[a]),[]);
          QMantenimientoCODIGOTIPOMANT.Value:= QBancoMantenimientosCODIGOTIPOMANT.Value;
          QMantenimientoCODIGOBANCOMANTENIMIENTO.Value:= QBancoMantenimientosCODIGOBANCOMANTENIMIENTO.Value;
          QTarea.FieldByName('NOMBRETAREA').Value:= QBancoMantenimientos.fieldbyName('NOMBREMANTENIMIENTO').Value;
          QTarea.FieldByName('FRECUENCIA').Value:= QBancoMantenimientos.fieldbyName('FRECUENCIA').Value;
          QTarea.FieldByName('DESCRIPCION').Value:= QBancoMantenimientos.fieldbyName('DESCRIPCION').Value;
          QTarea.FieldByName('CODIGODESCRIPTIVO').AsString:= QBancoMantenimientos.fieldByName('CODIGODESCRIPTIVO').AsString;
          NombreMantenimiento.Text:= QBancoMantenimientos.fieldbyName('NOMBREMANTENIMIENTO').AsString;
          if QBancoMantenimientosCODIGOAMBITO.Value = 2 then
            if circuito.Visible = false then
              begin
                LabelCodigoCircuito.Visible:= true;
                circuito.Visible:= True;
              end
            else
              if circuito.Visible = true then
                begin
                  LabelCodigoCircuito.Visible:= false;
                  circuito.Visible:= false;
                end;
        end;
    end;
end;

procedure TFMantenimiento.QTareaNewRecord(DataSet: TDataSet);
var qry3:Tquery;
begin
  inherited;
 qry3:= TQuery.Create(Application);
 qry3.DatabaseName:='BaseDato';
 qry3.SQL.Clear;
 qry3.SQL.Add('select numeromant.nextval from dual');
 qry3.Open;
 QTareaCODIGOTAREA.Value:= qry3.Fields[0].AsFloat;
 QTareaCODIGOUSUARIO.Value:= 2;
 Fcronograma.Edit2.Text:= qry3.Fields[0].AsString;
 qry3.Free;
end;

procedure TFMantenimiento.SBProgramarClick(Sender: TObject);
function NActividades:boolean;
var i,b: integer;
begin
  b:= 0;
  for i:= 0 to clbActividades.Items.Count - 1 do
    if clbActividades.Checked[i] then
      begin
        b:= 1;
        break;
      end;
  if b = 1 then
    result:= true
  else
    result:= false;
end;

function NPruebas:boolean;
var qry1:Tquery;
    sqlprueba:string;
    resultado:boolean;
       i,itppal,itsec,contador,Nveces:integer;
begin
  resultado:= false;
  contador:= 0;
  itppal:= 0;
  itsec:= 0;
  qry1:= Tquery.Create(application);
  qry1.DatabaseName:='BaseDato';
  sqlprueba:= ' select count(sp.codigosubactividadprueba) as nprueba from subactividadprueba sp,pm_actividadmantenimiento am where'+
              ' am.codigoactividadmantenimiento =:codigoactividadmantenimiento and am.codigosubactividadareaodt = sp.CODIGOSUBACTIVIDADAREAODT';
  qry1.SQL.Append(sqlprueba);
  while (itppal <=  (actividades.Count - 1)) do
    begin
      if (clbActividades.Checked[itppal]) then
        begin
          itsec:= 0;
          if qry1.Active then
            qry1.Close;
          qry1.ParamByName('CODIGOACTIVIDADMANTENIMIENTO').asfloat:= strtofloat(actividades.strings[itppal]);
          qry1.Open;
          while (itsec <= (qry1.Fields[0].asinteger - 1)) do
            begin
              if (clbSubactividadprueba.Checked[contador]) then
                begin
                  contador:= (qry1.Fields[0].asinteger - itsec);
                  itsec:= qry1.Fields[0].asinteger;
                  resultado:= true;
                end
              else
                begin
                  contador:= contador + 1;
                  itsec:= itsec + 1;
                end;

            end;
          if resultado = false then
            itppal:= actividades.Count
          else
            itppal:= itppal + 1;
        end
      else
        itppal:= itppal + 1;
    end;
  if resultado then
    result:= true
  else
    result:= false;
end;

var i:integer;
    c:real;
    sqltablaelemento:string;
begin
 inherited;
 if NActividades = false then
   MessageDlg('Debe asignar al menos una actividad al mantenimiento', mtInformation,[mbOk], 0)
 else
 begin
   if NPruebas = false then
     MessageDlg('Para cada actividad seleccionada, debe escoger por lo menos una prueba relacionada', mtInformation,[mbOk], 0)
   else
   begin
     QMantenimientoCODIGOTIPOMANT.Value:= QBancoMantenimientosCODIGOTIPOMANT.Value;
     QMantenimientoCODIGOBANCOMANTENIMIENTO.Value:= QBancoMantenimientosCODIGOBANCOMANTENIMIENTO.Value;
     QMantenimientocodigoambito.value:=  QBancoMantenimientoscodigoambito.value;
     QTarea.FieldByName('NOMBRETAREA').Value:= QBancoMantenimientos.fieldbyName('NOMBREMANTENIMIENTO').Value;
     QTarea.FieldByName('FRECUENCIA').Value:= QBancoMantenimientos.fieldbyName('FRECUENCIA').Value;
     QTarea.FieldByName('DESCRIPCION').Value:= QBancoMantenimientos.fieldbyName('DESCRIPCION').Value;
     QTarea.FieldByName('CODIGODESC').AsString:= QBancoMantenimientos.fieldByName('CODIGODESCRIPTIVO').AsString;
     NombreMantenimiento.Text:= QBancoMantenimientos.fieldbyName('NOMBREMANTENIMIENTO').AsString;

     if Subestacion.Enabled = False then
       Subestacion.Enabled:= true;

     if qCaracteristicasElemento.Active then
       qCaracteristicasElemento.Close;
     qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= QBancoMantenimientos.fieldbyName('CODIGOELEMENTO').AsInteger;
     qCaracteristicasElemento.Open;
     if CElemento.Items.Count >= 1 then
       CElemento.Clear;
     if codigo1.Items.Count >= 1 then
       codigo1.Clear;
     if codigo2.Items.Count >= 1 then
       codigo2.Clear;

     if QBancoMantenimientos.FieldByName('CODIGOAMBITO').asinteger = 2 then
     begin
       if QCircuito.Active then
         QCircuito.Close;
       if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
       begin
         if qTablaElemento.Active then
           qTablaElemento.Close;
         qTablaElemento.SQL.Clear;
         sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                            qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO'+
                            ' ORDER BY '+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring ;
         qTablaElemento.SQL.Add(sqltablaelemento);
       end
       else
       begin
         if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
         begin
           if qTablaElemento.Active then
             qTablaElemento.Close;
           qTablaElemento.SQL.Clear;
           sqltablaelemento:= ' SELECT '+'  '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                              qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO'+
                              ' ORDER BY '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring ;
           qTablaElemento.SQL.Add(sqltablaelemento);
         end;
       end;
       if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
       begin
         if qTablaElemento.Active then
           qTablaElemento.Close;
         qTablaElemento.SQL.Clear;
         sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                            qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO'+
                            ' ORDER BY '+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring ;
         qTablaElemento.SQL.Add(sqltablaelemento);
       end
       else
       begin
         if qTablaElemento.Active then
           qTablaElemento.Close;
         qTablaElemento.SQL.Clear;
         sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+' '+'FROM'+' '+
                            qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO'+
                            ' ORDER BY '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring ;
         qTablaElemento.SQL.Add(sqltablaelemento);
       end;
       if Subestacion.Text<> '' then
         Subestacion.KeyValue:='';
       if circuito.Visible = false then
       begin
         LabelCodigoCircuito.Visible:= true;
         circuito.Visible:= True;
       end
       else
       begin
         if (Circuito.Visible) and (Circuito.Text<>'') then
           Circuito.KeyValue:='';
       end;
       label6.Caption:= qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring;
     end
     else//otro ambito
     begin
       if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'')then
       begin
         if qTablaElemento.Active then
           qTablaElemento.Close;
         qTablaElemento.SQL.Clear;
         ///*** INICIO ELP 1
         if qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').AsString ='LINEA'then
         begin
           sqltablaelemento:= ' SELECT' +' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM ' + '  '+
           qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring;
         end
         else
         begin
         ///****FIN ELP 1
           sqltablaelemento:= ' SELECT' +' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM ' + '  '+
                              qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+ '  '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION'+
                              ' ORDER BY '+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring ;
         ///***ELP 2
         end;
         ///***FIN ELP 2
         qTablaElemento.SQL.Add(sqltablaelemento);
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
                                qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+
                                ' ORDER BY '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring ;
           end
           else
           begin
           ///***FIN ELP 3
             sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                                qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION'+
                                ' ORDER BY '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring ;
          ///*** INICIO ELP 4
           end;
          ///*** FIN ELP 4
           qTablaElemento.SQL.Add(sqltablaelemento);
         end;
       end;
       if circuito.Visible = true then
       begin
         LabelCodigoCircuito.Visible:= false;
         circuito.Visible:= false;
       end;
       if Subestacion.Text<>'' then
         Subestacion.KeyValue:='';
       label6.Caption:= qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring;
     end;
   end;
 end;
end;

procedure TFMantenimiento.SBMantenimientoClick(Sender: TObject);
begin
  inherited;
 if ECodigoBancoMantenimiento.Text <> '' then
  begin
    if QBancoMantenimientos.Active then
      QBancoMantenimientos.Close;
    QBancoMantenimientos.SQL.Clear;
    QBancoMantenimientos.SQL.add(' select * from pm_bancomantenimiento where activo = ''S'' and codigodescriptivo= '+ECodigoBancoMantenimiento.Text);
    QBancoMantenimientos.Open;
    if Not QBancoMantenimientos.IsEmpty then
      begin
        listamantenimientos.Clear;
        codigobancomantenimiento.Clear;
        listamantenimientos.Items.Add(QBancoMantenimientos.fieldByName('NOMBREMANTENIMIENTO').AsString);
        codigobancomantenimiento.Add(QBancoMantenimientos.fieldByName('CODIGOBANCOMANTENIMIENTO').AsString);
      end
    else
      MessageDlg('No Existe ningún Mantenimiento con ese Código.', mtInformation,[mbOk], 0);
  end;
end;

procedure TFMantenimiento.QTareaBeforePost(DataSet: TDataSet);
begin
  QTarea.FieldByName('CODIGOTIPOTAREA').Value:=1;
  if edicionMtto=true then
  begin
    if (QTareaFECHAINICIAL.AsString <> fechaini) or (QTareaFECHAFINAL.AsString <> fechafin)then
    begin
      FMantenimientoreprogramado:= TfMantenimientoReprogramado.Create(Application);
      fMantenimientoReprogramado.emantenimiento.Text:=QBancoMantenimientosNOMBREMANTENIMIENTO.AsString;
      fMantenimientoReprogramado.qMantenimientoReprogramado.Close;
      fMantenimientoReprogramado.codigomtto:=QTareaCODIGOTAREA.AsInteger;
      fMantenimientoReprogramado.qMantenimientoReprogramado.ParamByName('CODIGOMANTENIMIENTO').AsFloat:=QTareaCODIGOTAREA.AsFloat;
      fMantenimientoReprogramado.qMantenimientoReprogramado.Open;
      fMantenimientoReprogramado.ShowModal;
      qmttoReprogramado.close;
      qmttoReprogramado.ParamByName('CODIGOMANTENIMIENTO').asinteger:=QTareaCODIGOTAREA.AsInteger;
      qmttoReprogramado.ParamByName('CODIGOMTTOREPROGRAMADO').AsInteger:=fMantenimientoReprogramado.qMantenimientoReprogramadoCODIGOMTTOREPROGRAMADO.AsInteger;
      qmttoReprogramado.Open;
      qmttoReprogramado.Edit;
      qmttoReprogramadoFECHAINICIALANTERIOR.AsString:=fechaini;
      qmttoReprogramadoFECHAFINALANTERIOR.AsString:=fechafin;
      qmttoReprogramadoFECHAALARMAANTERIOR.AsString:=fechaalarma;
      qmttoReprogramadoFECHAINICIALNUEVA.AsString:=QTareaFECHAINICIAL.AsString;
      qmttoReprogramadoFECHAFINALNUEVA.AsString:=QTareaFECHAFINAL.AsString;
      qmttoReprogramadoFECHAALARMANUEVA.AsString:=QTareaFECHAALARMA.AsString;
      qmttoReprogramado.Post;
      fMantenimientoReprogramado.Free;
    end;
  end
  else
  begin
  end;
end;

procedure TFMantenimiento.CircuitoClick(Sender: TObject);
begin
  inherited;
  if qTablaElemento.Active then
    qTablaElemento.Close;
  qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= vartostr(Circuito.KeyValue);
  qTablaElemento.Open;

  if qTablaElemento.RecordCount > 0 then
    begin
      if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
        begin
          if codigo1.Items.Count >= 1 then
            codigo1.Clear;
          if CElemento.Items.Count >= 1 then
            CElemento.Clear;

          while not qTablaElemento.Eof do
            begin
              codigo1.Items.Append(qTablaElemento.fields[0].asstring);
              CElemento.Items.Append(qTablaElemento.fields[1].asstring);
              qTablaElemento.Next;
            end;
        end
      else
        begin
          if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
            begin
              if codigo1.Items.Count >= 1 then
                codigo1.Clear;
              if CElemento.Items.Count >= 1 then
                CElemento.Clear;

              while not qTablaElemento.Eof do
                begin
                  codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                  CElemento.Items.Append(qTablaElemento.fields[0].asstring);
                  qTablaElemento.Next;
                end;
            end;
        end;
      if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
        begin
          if codigo1.Items.Count >= 1 then
            codigo1.Clear;
          if codigo2.Items.Count >= 1 then
            codigo2.Clear;
          if CElemento.Items.Count >= 1 then
            CElemento.Clear;

          while not qTablaElemento.Eof do
            begin
              codigo1.Items.Append(qTablaElemento.fields[0].asstring);
              codigo2.Items.Append(qTablaElemento.fields[1].asstring);
              CElemento.Items.Append(qTablaElemento.fields[2].asstring);
              qTablaElemento.Next;
            end;
        end
      else
        begin
          if codigo1.Items.Count >= 1 then
            codigo1.Clear;
          if codigo2.Items.Count >= 1 then
            codigo2.Clear;
          if CElemento.Items.Count >= 1 then
            CElemento.Clear;

          while not qTablaElemento.Eof do
            begin
              codigo1.Items.Append(qTablaElemento.fields[0].asstring);
              codigo2.Items.Append(qTablaElemento.fields[1].asstring);
              CElemento.Items.Append(qTablaElemento.fields[0].asstring + qTablaElemento.Fields[1].asstring);
              qTablaElemento.Next;
           end;
        end;
    end
  else
    MessageDlg('No se encontraron elementos de ese tipo asociados con la línea.', mtInformation,[mbOk], 0);
end;

procedure TFMantenimiento.qElementoMantenimientoBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if qElementoMantenimiento.State = dsInsert then
    begin
      qElementoMantenimiento.FieldByName('CODIGOELEMENTOMANTENIMIENTO').asfloat:= QTarea.fieldbyname('CODIGOTAREA').asfloat;
      if qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1 then
        begin
          qElementoMantenimiento.FieldByName('CLELEMENTO1').asstring:= codigo1.Items.Strings[CElemento.itemindex];
          qElementoMantenimiento.FieldByName('CODIGOELEMENTO').asinteger:= qCaracteristicasElemento.fieldbyname('CODIGOELEMENTO').asinteger;
        end
      else
        begin
          qElementoMantenimiento.FieldByName('CLELEMENTO1').asstring:= codigo1.Items.Strings[CElemento.itemindex];
          qElementoMantenimiento.FieldByName('CLELEMENTO2').asstring:= codigo2.Items.Strings[CElemento.itemindex];
          qElementoMantenimiento.FieldByName('CODIGOELEMENTO').asinteger:= qCaracteristicasElemento.fieldbyname('CODIGOELEMENTO').asinteger;
        end;
    end;
end;

procedure TFMantenimiento.QBancoMantenimientosAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if realizarscroll = true then
    begin
      actividades:= Tstringlist.Create;
      if clbActividades.Items.Count > 0 then
        clbActividades.Clear;
      if clbSubactividadprueba.Items.Count > 0 then
        clbSubactividadprueba.Clear;
      if lbSp.Items.Count > 0 then
        lbSp.Clear;
      CodigoTipoMant.KeyValue:= QBancoMantenimientos.fieldbyname('CODIGOTIPOMANT').asinteger;
      CodigoNivelTension.KeyValue:= QBancoMantenimientos.fieldbyname('CODIGONIVELTENSION').asstring;
      CodigoAmbito.KeyValue:= QBancoMantenimientos.fieldbyname('CODIGOAMBITO').asinteger;

      if QTipoElemento.Active then
        QTipoElemento.Close;
      QTipoElemento.ParamByName('CODIGOAMBITO').AsInteger:= CodigoAmbito.KeyValue;
      QTipoElemento.Open;
      CodigoTipoElemento.KeyValue:= QBancoMantenimientos.fieldbyname('CODIGOELEMENTO').asinteger;

      if qActividades.Active then
        qActividades.Close;
      qActividades.ParamByName('CODIGOBANCOMANTENIMIENTO').asfloat:= QBancoMantenimientos.fieldbyname('CODIGOBANCOMANTENIMIENTO').asfloat;
      qActividades.Open;
      if not qActividades.IsEmpty then
      begin
        actividades.Clear;
        while not qActividades.Eof do
        begin
          clbActividades.Items.Append(qActividades.fieldbyname('NOMBREACTIVIDADMANTENIMIENTO').asstring);
          actividades.Append(qActividades.fieldbyname('CODIGOACTIVIDADMANTENIMIENTO').asstring);
          {if qSubactividadprueba.Active then
            qSubactividadprueba.Close;
          qSubactividadprueba.ParamByName('CODIGOSUBACTIVIDADAREAODT').asinteger:= qActividades.fieldbyname('CODIGOSUBACTIVIDADAREAODT').asinteger;
          qSubactividadprueba.Open;
          while not qSubactividadprueba.Eof do
            begin
              lbSp.Items.Append(qSubactividadprueba.fieldbyname('CODIGOSUBACTIVIDADPRUEBA').asstring);
              clbSubactividadprueba.Items.Append(qSubactividadprueba.fieldbyname('NOMBRESECCIONFORMATO').asstring);
              qSubactividadprueba.Next;
            end;}
         // clbSubactividadprueba.Items.Append('  ');
          qActividades.Next;
        end;
      end;
    end;
end;

procedure TFMantenimiento.qActividadesProgramadasNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  qActividadesProgramadas.FieldByName('CONSECUTIVOACTIVIDAD').asfloat:= NActividadesProgramadas;
  NActividadesProgramadas:= NActividadesProgramadas + 1;
end;

procedure TFMantenimiento.SBConsultaClick(Sender: TObject);
begin
  inherited;
  //*** inicio
  fFiltroConsultaBancoMantenimiento:=TfFiltroConsultaBancoMantenimiento.Create(Application);
  fFiltroConsultaBancoMantenimiento.qmantenimientos.sql.text:= QBancoMantenimientos.sql.text; 
  fFiltroConsultaBancoMantenimiento.ShowModal;
  QBancoMantenimientos.SQL.Clear;
  QBancoMantenimientos.Close;
  QBancoMantenimientos.sql.text:=fFiltroConsultaBancoMantenimiento.qmantenimientos.sql.text;
  QBancoMantenimientos.Open;
  fFiltroConsultaBancoMantenimiento.Free;
  //***fin
  if clbActividades.Items.Count > 1 then
    clbActividades.Clear;
  if CodigoTipoElemento.Enabled = true then
    CodigoTipoElemento.Enabled:= false;
  
  if qActividades.Active then
    qActividades.Close;
  qActividades.ParamByName('CODIGOBANCOMANTENIMIENTO').asfloat:= QBancoMantenimientos.fieldbyname('CODIGOBANCOMANTENIMIENTO').asfloat;
  qActividades.Open;
  if not qActividades.IsEmpty then
    begin
      actividades.Clear;
      while not qActividades.Eof do
        begin
          clbActividades.Items.Append(qActividades.fieldbyname('NOMBREACTIVIDADMANTENIMIENTO').asstring);
          actividades.Append(qActividades.fieldbyname('CODIGOACTIVIDADMANTENIMIENTO').asstring);
          qActividades.Next;
        end;
    end;
  if Subestacion.Enabled = true then
    Subestacion.Enabled:= false;
  if CElemento.Items.Count >= 1 then
    CElemento.Clear;
  if CodigoTipoMant.Text <> '' then
    CodigoTipoMant.keyvalue:= 0;
  if CodigoTipoElemento.Text <> '' then
    CodigoTipoElemento  .keyvalue:= 0;
  if CodigoAmbito.Text <> '' then
    CodigoAmbito.keyvalue:= 0;
  if CodigoNivelTension.Text <> '' then
    CodigoNivelTension.keyvalue:= 0;
end;

procedure TFMantenimiento.SBIncluirActividadesClick(Sender: TObject);
var i:integer;
begin
  inherited;
  for i:= 0 to clbactividades.Items.Count - 1 do
    if not clbactividades.Checked[i] then
      clbactividades.Checked[i]:= true;
end;

procedure TFMantenimiento.SBEliminarActividadesClick(Sender: TObject);
var i:integer;
begin
  inherited;
  for i:= 0 to clbactividades.Items.Count - 1 do
    if clbactividades.Checked[i] then
      clbactividades.Checked[i]:= false;
end;

procedure TFMantenimiento.sbFechaInicialClick(Sender: TObject);
begin
  inherited;
  dbeFechaInicial.SetFocus;
  sFecha := dbeFechaInicial.Text;
  Fecha := GetFecha(True);
  if Fecha <> '' then dbeFechaInicial.Text := Fecha;
end;

procedure TFMantenimiento.dbgMantenimientosEnter(Sender: TObject);
begin
  inherited;
  realizarscroll:= true;
  if clbActividades.Items.Count > 1 then
    clbActividades.Clear;
  CodigoTipoMant.KeyValue:= QBancoMantenimientos.fieldbyname('CODIGOTIPOMANT').asinteger;
  CodigoNivelTension.KeyValue:= QBancoMantenimientos.fieldbyname('CODIGONIVELTENSION').asstring;
  CodigoAmbito.KeyValue:= QBancoMantenimientos.fieldbyname('CODIGOAMBITO').asinteger;

  if QTipoElemento.Active then
    QTipoElemento.Close;
  QTipoElemento.ParamByName('CODIGOAMBITO').AsInteger:= CodigoAmbito.KeyValue;
  QTipoElemento.Open;
  CodigoTipoElemento.KeyValue:= QBancoMantenimientos.fieldbyname('CODIGOELEMENTO').asinteger;

  if qActividades.Active then
    qActividades.Close;
  qActividades.ParamByName('CODIGOBANCOMANTENIMIENTO').asfloat:= QBancoMantenimientos.fieldbyname('CODIGOBANCOMANTENIMIENTO').asfloat;
  qActividades.Open;
  if not qActividades.IsEmpty then
    begin
      actividades.Clear;
      while not qActividades.Eof do
        begin
          clbActividades.Items.Append(qActividades.fieldbyname('NOMBREACTIVIDADMANTENIMIENTO').asstring);
          actividades.Append(qActividades.fieldbyname('CODIGOACTIVIDADMANTENIMIENTO').asstring);
          qActividades.Next;
        end;
    end;
end;

procedure TFMantenimiento.dbgMantenimientosExit(Sender: TObject);
begin
  inherited;
  realizarscroll:= false;
end;

procedure TFMantenimiento.clbActividadesClickCheck(Sender: TObject);
var i,j:integer;
begin
  inherited;
  if clbSubactividadprueba.Items.Count > 0 then
    clbSubactividadprueba.Clear;
  if lbSp.Items.Count > 0 then
    lbSp.Clear;
  qActividades.First;
  for i:= 0 to clbActividades.Items.Count - 1 do
    begin
      if clbActividades.Checked[i] then
        begin
          if qSubactividadprueba.Active then
            qSubactividadprueba.Close;
          qSubactividadprueba.ParamByName('CODIGOSUBACTIVIDADAREAODT').asinteger:= qActividades.fieldbyname('CODIGOSUBACTIVIDADAREAODT').asinteger;
          qSubactividadprueba.Open;
          while not qSubactividadprueba.Eof do
            begin
              lbSp.Items.Append(qSubactividadprueba.fieldbyname('CODIGOSUBACTIVIDADPRUEBA').asstring);
              clbSubactividadprueba.Items.Append(qSubactividadprueba.fieldbyname('NOMBRESECCIONFORMATO').asstring);
              qSubactividadprueba.Next;
            end;
        end;
      qActividades.Next;
    end;
end;

procedure TFMantenimiento.sbFechaFinalClick(Sender: TObject);
begin
  inherited;
  dbeFechaFinal.SetFocus;
  sFecha := dbeFechaFinal.Text;
  Fecha := GetFecha(True);
  if Fecha <> '' then dbeFechaFinal.Text := Fecha;
end;

procedure TFMantenimiento.sbFechaAlarmaClick(Sender: TObject);
begin
  inherited;
  dbeFechaAlarma.SetFocus;
  sFecha := dbeFechaAlarma.Text;
  Fecha := GetFecha(True);
  if Fecha <> '' then dbeFechaAlarma.Text := Fecha;
end;

procedure TFMantenimiento.FormShow(Sender: TObject);
begin
  inherited;
  if edicionMtto=true then
  begin
    fechaini:=QTareaFECHAINICIAL.AsString;
    fechafin:=QTareaFECHAFINAL.AsString;
    fechaalarma:=QTareaFECHAALARMA.AsString;
  end;
end;

procedure TFMantenimiento.qmttoReprogramadoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qmttoReprogramado.ApplyUpdates;
  qmttoReprogramado.CommitUpdates;
end;

procedure TFMantenimiento.qmttoReprogramadoAfterPost(DataSet: TDataSet);
begin
  inherited;
  qmttoReprogramado.ApplyUpdates;
  qmttoReprogramado.CommitUpdates;
end;

procedure TFMantenimiento.bbAceptarClick(Sender: TObject);
var
   qry1, qconsulta:Tquery;
   i,j,contador:integer;
   Bandera:boolean;
   sqlprueba, asunto, mensaje, MensajeEstado:string;
begin
  Bandera:=true;
  asunto:= 'Creación o modificación de Mantenimiento';

 { if QTarea.State = dsEdit then
  begin
    showmessage('1');
    if (FormaEdicion = 1) then
    begin }


  // FECHA ALARMA ***********************************************************
  if (dbeFechaAlarma.text <>'') then
  begin
    if (QTareaFECHAALARMA.AsString<>'')then
    begin
      if(StrToDateTime(dbeFechaAlarma.text)<>StrToDateTime(QTareaFECHAALARMA.AsString))then
      begin
        try
          StrToDateTime(dbeFechaAlarma.Text);
          if(StrToDateTime(dbeFechaAlarma.Text)-(now))<=0 then
          begin
            raise Exception.Create('Fecha Alarma debe ser mayor a Fecha Actual');
            {Application.MessageBox(pchar('Fecha Alarma debe ser mayor a Fecha Actual'),'Error en Fecha Alarma',mb_iconerror);
            Bandera:=False;
            exit; }
          end
          else
          begin
            if (StrToDateTime(dbeFechaInicial.Text)-StrtoDateTime(dbeFechaAlarma.Text))<= 0 then
            begin
              raise Exception.Create('Fecha Alarma debe ser menor a Fecha Inicial en Programación');
              {application.MessageBox(pchar('Fecha Alarma debe ser menor a Fecha Inicial en Programación'),'Error en Fecha Alarma',mb_iconerror);
              bandera:=false;
              exit;}
            end;
          end;
        except
          on e:exception do
          begin
            raise Exception.Create('Fecha Alarma Incorrecta');
            {application.MessageBox(pchar('Fecha Alarma Incorrecta'),'Error en Fecha Alarma',mb_iconerror);
            bandera:=false;
            exit;}
          end;
        end;
      end;
    end
    else
    begin
      try
        StrToDateTime(dbeFechaAlarma.Text);
        if(StrToDateTime(dbeFechaAlarma.Text)-(now))<=0 then
        begin
          raise Exception.Create('Fecha Alarma debe ser mayor a Fecha Actual');
          {Application.MessageBox(pchar('Fecha Alarma debe ser mayor a Fecha Actual'),'Error en Fecha Alarma',mb_iconerror);
          Bandera:=False;
          exit;}
        end
        else
        begin
          if (StrToDateTime(dbeFechaInicial.Text)-StrtoDateTime(dbeFechaAlarma.Text))<= 0 then
          begin
            raise Exception.Create('Fecha Alarma debe ser menor a Fecha Inicial en Programación');
            {application.MessageBox(pchar('Fecha Alarma debe ser menor a Fecha Inicial en Programación'),'Error en Fecha Alarma',mb_iconerror);
            bandera:=false;
            exit;  }
          end;
        end;
      except
        on e:exception do
        begin
          raise Exception.Create('Fecha Alarma Incorrecta');
          {application.MessageBox(pchar('Fecha Alarma Incorrecta'),'Error en Fecha Alarma',mb_iconerror);
          bandera:=false;
          exit; }
        end;
      end;
    end;
  end
  else
  Begin
    dbeFechaAlarma.text:='';
  end;

  // FECHA INICIAL PROGRAMACION ***********************************************
  if (dbeFechaInicial.Text <> '') then
  begin
    if(StrToDateTime(dbeFechaInicial.text)<>StrToDateTime(QTareaFECHAINICIAL.AsString))then
    begin
      try
        StrToDateTime(dbeFechaInicial.Text);
        if (StrToDateTime(dbeFechaInicial.Text)-(now))<=0 then
        begin
          raise Exception.Create('Fecha Inicial de Programación debe ser mayor a la Fecha Actual');
          {application.MessageBox(pchar('Fecha Inicial de Programación debe ser mayor a la Fecha Actual'),'Error en Fecha Inicial de Programación',mb_iconerror);
          bandera:=false;
          exit;}
        end;
      except
        on e:exception do
        begin
          raise Exception.Create('Fecha Inicial de Programación Incorrecta');
          {application.MessageBox(pchar('Fecha Inicial de Programación Incorrecta'),'Error en Fecha Inicial',mb_iconerror);
          bandera:=false;
          exit;}
        end;
      end;
    end;
  end
  else
  begin
    raise Exception.Create('Debe asignar una Fecha Inicial de Programación');
    {application.MessageBox(pchar('Debe asignar una Fecha Inicial de Programación'),'Error en Fecha Inicial',mb_iconerror);
    bandera:=false;
    exit;}
  end;

  // FECHA FINAL PROGRAMACION ***********************************************
  if (dbeFechaFinal.text <> '') then
  begin
    if(StrToDateTime(dbeFechaInicial.text)<>StrToDateTime(QTareaFECHAINICIAL.AsString))then
    begin
      try
        if (StrToDateTime(dbeFechaFinal.Text)-StrtoDateTime(dbeFechaInicial.Text))<=0 then
        begin
          raise Exception.Create('Fecha Final debe ser mayor a Fecha Inicial en Programación');
          {application.MessageBox(pchar('Fecha Final debe ser mayor a Fecha Inicial en Programación'),'Error en Fecha Final Programación',mb_iconerror);
          bandera:=false;
          exit;}
        end;
      except
        on e:exception do
        begin
          raise Exception.Create('Fecha Final Programación Incorrecta');
          {application.MessageBox(pchar('Fecha Final Programación Incorrecta'),'Error en Fecha Final Programación',mb_iconerror);
          bandera:=false;
          exit; }
        end;
      end;
    end;
  end
  else
  begin
    raise Exception.Create('Debe asignar una Fecha Final de Programación');
    {application.MessageBox(pchar('Debe asignar una Fecha Final de Programación'),'Error en Fecha Final Programación',mb_iconerror);
    bandera:=false;
    exit;}
  end;

  //CODIGO DE MANTENIMIENTO  ***********************************************
  if QMantenimiento.FieldByName('CODIGOBANCOMANTENIMIENTO').AsString='' then
  begin
    raise Exception.Create('Debe agregar un Mantenimiento');
    {Application.MessageBox(pchar('Debe agregar un Mantenimiento'),'Error en Mantenimiento',mb_iconerror);
    bandera:=false;
    exit;}
  end;
  //ESTADO DE LA TAREA   **************************************************
  if CodigoEstado.Text='' then
  begin
    raise Exception.Create('Debe escoger un Estado de Tarea');
    {Application.MessageBox(pchar('Debe escoger un Estado de Tarea'),'Error en Código de Estado',mb_iconerror);
    bandera:=false;
    exit;}
  end;

  // FECHA ALARMA ***********************************************************
  if (dbeFechaAlarma.text <>'') then
  begin
    if(StrToDateTime(dbeFechaAlarma.text)<>StrToDateTime(QTareaFECHAALARMA.AsString))then
    begin
      try
        StrToDateTime(dbeFechaAlarma.Text);
        if (StrToDateTime(dbeFechaAlarma.Text)-(now))<=0 then
        begin
          raise Exception.Create('Fecha Alarma debe ser mayor a Fecha Actual');
          {application.MessageBox(pchar('Fecha Alarma debe ser mayor a Fecha Actual'),'Error en Fecha Alarma',mb_iconerror);
          bandera:=false;
          exit;}
        end
        else
        begin
          if (StrToDateTime(dbeFechaInicial.Text)-StrtoDateTime(dbeFechaAlarma.Text))< 0 then
          begin
            raise Exception.Create('Fecha Alarma debe ser menor a Fecha Inicial en Programación');
            {application.MessageBox(pchar('Fecha Alarma debe ser menor a Fecha Inicial en Programación'),'Error en Fecha Alarma',mb_iconerror);
            bandera:=false;
            exit;}
          end;
        end;
      except
        on e:exception do
        begin
          raise Exception.Create('Fecha Alarma Incorrecta');
          {application.MessageBox(pchar('Fecha Alarma Incorrecta'),'Error en Fecha Alarma',mb_iconerror);
          bandera:=false;
          exit; }
        end;
      end;
    end;
  end
  else
  Begin
    dbeFechaAlarma.text:='';
  End;

  // FECHA INICIAL  ***********************************************************
  if (dbeFechaInicial.Text <> '') then
  begin
    if(StrToDateTime(dbeFechaInicial.text)<>StrToDateTime(QTareaFECHAINICIAL.AsString))then
    begin
      try
        StrToDateTime(dbeFechaInicial.Text);
        if (StrToDateTime(dbeFechaInicial.Text)-(now))<=0 then
        begin
          raise Exception.Create('Fecha Inicial de Programación debe ser mayor a la Fecha Actual');
          {application.MessageBox(pchar('Fecha Inicial de Programación debe ser mayor a la Fecha Actual'),'Error en Fecha Inicial de Programación',mb_iconerror);
          bandera:=false;
          exit;}
        end;
      except
        on e:exception do
        begin
          raise Exception.Create('Fecha Inicial de Programación Incorrecta');
          {application.MessageBox(pchar('Fecha Inicial de Programación Incorrecta'),'Error en Fecha Inicial',mb_iconerror);
          bandera:=false;
          exit; }
        end;
      end;
    end;
  end
  else
  begin
    raise Exception.Create('Debe asignar una Fecha Inicial de Programación');
    {application.MessageBox(pchar('Debe asignar una Fecha Inicial de Programación'),'Error en Fecha Inicial',mb_iconerror);
    bandera:=false;
    exit;}
  end;

 // FECHA FINAL PROGRAMACION ***********************************************
  if (dbeFechaFinal.text <> '') then
  begin
    if(StrToDateTime(dbeFechaInicial.text)<>StrToDateTime(QTareaFECHAINICIAL.AsString))then
    begin
      try
        StrToDateTime(dbeFechaFinal.Text);
        if (StrToDateTime(dbeFechaFinal.Text)-StrtoDateTime(dbeFechaInicial.Text))<=0 then
        begin
          raise Exception.Create('Fecha Final debe ser mayor a Fecha Inicial en Programación');
          {application.MessageBox(pchar('Fecha Final debe ser mayor a Fecha Inicial en Programación'),'Error en Fecha Final Programación',mb_iconerror);
          bandera:=false;
          exit;  }
        end;
      except
        on e:exception do
        begin
          raise Exception.Create('Fecha Final Programación Incorrecta');
         { application.MessageBox(pchar('Fecha Final Programación Incorrecta'),'Error en Fecha Final Programación',mb_iconerror);
          bandera:=false;
          exit;}
        end;
      end;
    end;
  end
  else
  begin
    raise Exception.Create('Debe asignar una Fecha Final de Programación');
   { application.MessageBox(pchar('Debe asignar una Fecha Final de Programación'),'Error en Fecha Final Programación',mb_iconerror);
    bandera:=false;
    exit;}
  end;

  //******************* fin validación fechas
  if CElemento.Text='' then
  begin
     raise Exception.Create('Debe asociar un elemento al mantenimiento');
     {Application.MessageBox(pchar('Debe asociar un elemento al mantenimiento'),'Error en Elemento',mb_iconerror);
     bandera:=false;
     exit;  }
  end;
 // SUBESTACION ************************************************************
  if Subestacion.Text='' then
  begin
    raise Exception.Create('Debe escoger una Subestacion');
   { Application.MessageBox(pchar('Debe escoger una Subestacion'),'Error en Subestacion',mb_iconerror);
    bandera:=false;
    exit;}
  end;
  // CIRCUITO ***************************************************************
  if QBancoMantenimientosCODIGOAMBITO.Value = 2 then
  begin
    if Circuito.Text='' then
    begin
      raise Exception.Create('Debe escoger una Línea');
      {Application.MessageBox(pchar('Debe escoger una Línea'),'Error en Circuito',mb_iconerror);
      bandera:=false;
      exit;}
    end;
  end;


  // end;

{
    if bandera = false then
    Begin
      raise Exception.Create('Falta información');
    end
    else
    begin }


  if qTarea.State = dsInsert then
  begin
    qry1:= Tquery.Create(application);
    qry1.DatabaseName:='BaseDato';
    contador:= 0;
    sqlprueba:= 'select count(sp.codigosubactividadprueba) as ncodigo from subactividadprueba sp,pm_actividadmantenimiento am where'+' '+
                'am.codigoactividadmantenimiento =:codigoactividadmantenimiento and am.codigosubactividadareaodt = sp.codigosubactividadareaodt';
    if qry1.Active then
      qry1.Close;
    qry1.SQL.Clear;
    qry1.SQL.Append(sqlprueba);
    for i:= 0 to  (clbActividades.Items.Count - 1) do
    begin
      if clbactividades.Checked[i] then
      begin
        qActividadesProgramadas.Append;
        qActividadesProgramadas.FieldByName('CONSECUTIVOACTIVIDAD').asfloat:= NActividadesProgramadas;
        qActividadesProgramadas.FieldByName('CODIGOMANTENIMIENTO').asfloat:= qTarea.fieldbyname('CODIGOTAREA').asfloat;
        qActividadesProgramadas.FieldByName('CODIGOACTIVIDADMANTENIMIENTO').asfloat:= strtofloat(actividades.strings[i]);
        if qry1.Active then
          qry1.Close;
        qry1.ParamByName('CODIGOACTIVIDADMANTENIMIENTO').asfloat:= strtofloat(actividades.strings[i]);
        qry1.Open;
        for j:= 1 to  (qry1.Fields[0].asinteger) do
        begin
          if (clbSubactividadprueba.Checked[contador]) then
          begin
            qPruebasprogramadas.Append;
            qPruebasprogramadas.FieldByName('CONSECUTIVOACTIVIDAD').asfloat:= NActividadesProgramadas;
            qPruebasprogramadas.FieldByName('CODIGOMANTENIMIENTO').asfloat:= qTarea.fieldbyname('CODIGOTAREA').asfloat;
            qPruebasprogramadas.FieldByName('CODIGOSUBACTIVIDADPRUEBA').asfloat:= strtofloat(lbSp.items.strings[contador]);
            qPruebasprogramadas.Post;
            contador:= contador + 1;
          end
          else
            contador:= contador + 1;
        end;
        qActividadesProgramadas.Post;
      end;
    end;
    try

      qElementoMantenimiento.Post;
      QMantenimiento.Post;
      mensaje:= 'Se ha creado o modificado el mantenimiento número '+ qtarea.fieldbyname('codigotarea').asstring +' '+qtarea.fieldbyname('nombretarea').asstring+' del Elemento: '+qElementoMantenimiento.fieldbyname('clelemento1').asstring +' de la subestación: '+QSubestacion.fieldbyname('nombresubestacion').asstring +', a realizarse del '+ qtarea.fieldbyname('fechainicial').asstring+'  al ' +qtarea.fieldbyname('fechafinal').asstring;
      QTarea.Post;
      QTarea.ApplyUpdates;
      QMantenimiento.ApplyUpdates;
      qElementoMantenimiento.ApplyUpdates;
      qActividadesProgramadas.ApplyUpdates;
      qPruebasprogramadas.ApplyUpdates;
    except
      on e:exception do
      begin
        ShowMessage(e.Message);
//        application.MessageBox(pchar('Error en la grabación de los Datos, verifíquelos e intente de nuevo'),'Error en Grabación',mb_iconerror);
        exit;
      end;
    end;
  end
  else
  begin
    //try

      qActividadesProgramadas.Post;
      qElementoMantenimiento.Post;
      QMantenimiento.Post; // Tarea.Post;
      mensaje:= 'Se ha creado o modificado el mantenimiento número '+ qtarea.fieldbyname('codigotarea').asstring +' '+qtarea.fieldbyname('nombretarea').asstring+' del Elemento: '+qElementoMantenimiento.fieldbyname('clelemento1').asstring +' de la subestación: '+QSubestacion.fieldbyname('nombresubestacion').asstring +', a realizarse del '+ qtarea.fieldbyname('fechainicial').asstring+'  al ' +qtarea.fieldbyname('fechafinal').asstring;
      QTarea.Post;
      QTarea.ApplyUpdates;
      QMantenimiento.ApplyUpdates;
      qElementoMantenimiento.ApplyUpdates;
      qActividadesProgramadas.ApplyUpdates;
    {except
      on e:exception do
      begin
        ShowMessage(e.Message);
        //application.MessageBox(pchar('Error en la grabación de los Datos, verifíquelos e intente de nuevo'),'Error en Grabación',mb_iconerror);
        exit;
      end;
    end;}
  end;

  {
  try
    qconsulta:= TQuery.Create(Application);
    qconsulta.DatabaseName:='BaseDato';
    qconsulta.SQL.Clear;
    qconsulta.SQL.Add('SELECT U.CORREOELECTRONICO FROM '+
                      'PM_MANTENIMIENTO M, PM_BANCOMANTENIMIENTO BM, PM_ENCARGADOMMTTO EM, USUARIO U '+
                      'WHERE M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                      'AND BM.CODIGOAREAOPERACIONODT = EM.CODIGOAREAOPERACIONODT '+
                      'AND EM.CODIGOUSUARIO = U.CODIGOUSUARIO '+
                      'AND M.CODIGOMANTENIMIENTO = :CODIGOMANTENIMIENTO ');
    qconsulta.parambyname('CODIGOMANTENIMIENTO').asinteger := QMantenimiento.fieldbyname('codigomantenimiento').asinteger;
    qconsulta.Open;

    correo.destino:= qconsulta.fieldbyname('correoelectronico').asstring;
    qconsulta.free;

    EnviarCorreo(pchar(correo.servidor),pchar(correo.login),pchar(correo.psswd),pchar('Correo Mantenimientos Programados'),
    pchar(asunto),pchar(mensaje),pchar(correo.destino),'','');
    showmessage('Se ha enviado correo a '+correo.destino);
  except
    MensajeEstado:= 'El correo no pudo ser enviado. ';
    beep;
  end;
     }
  FMantenimiento.ModalResult:=mrok;
end;


procedure TFMantenimiento.bbCancelarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Desea Cancelar la operación?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
    QMantenimiento.CancelUpdates;
    QTarea.CancelUpdates;
    ModalResult:= mrCancel;
   end;
end;

function TFMantenimiento.getDatosCorreo:TDatosCorreo;
var query:tquery;
begin
  query:=TQuery.create(self);
  query.DatabaseName:='BaseDato';
  query.sql.add('SELECT VALOR FROM PARAMETRO WHERE CODIGOPARAMETRO=''SMT''');
  query.open;
  Result.servidor:=query.fieldbyname('VALOR').AsString;

  query.sql.clear;
  query.sql.add('SELECT VALOR FROM PARAMETRO WHERE CODIGOPARAMETRO=''MTO''');
  query.open;
  Result.login:=query.fieldbyname('VALOR').AsString;

  query.sql.clear;
  query.sql.add('SELECT VALOR FROM PARAMETRO WHERE CODIGOPARAMETRO=''PMT''');
  query.open;
  Result.psswd:=query.fieldbyname('VALOR').AsString;

  {query.sql.clear;
  query.sql.add('SELECT VALOR FROM PARAMETRO WHERE CODIGOPARAMETRO=''MRV''');
  query.open;
  Result.Destino:=query.fieldbyname('VALOR').AsString;
  query.close;
  query.free;}
end;

procedure TFMantenimiento.Button1Click(Sender: TObject);
var
s:string;
begin
  if Subestacion.Text='' then
   begin
     application.ProcessMessages;
     application.MessageBox('Debe seleccionar una Subestación','Error', MB_ICONERROR);
     exit;
   end;
  s:='';
  s:=Subestacion.keyvalue;
   while Length(s)<3 do s := s+' ';
  codigosubestacionactual:=s;
  Abrirsubestacion(s);
end;

end.
