unit uMantenimientoMes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, StdCtrls, CheckLst, Mask, DBCtrls;



type
  TDatosCorreo2=record
    servidor:string;
    login:string;
    psswd:string;
    Destino:string;
  end;
  TfMantenimientoMes = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ENombreMantenimiento: TEdit;
    EAmbito: TEdit;
    ENivelTension: TEdit;
    ETipoElemento: TEdit;
    EFrecuencia: TEdit;
    ETipoMantenimiento: TEdit;
    clbActividades: TCheckListBox;
    qBancoMantenimiento: TQuery;
    qAmbito: TQuery;
    qNivelTension: TQuery;
    qTipoElemento: TQuery;
    qTarea: TQuery;
    qMantenimiento: TQuery;
    qTipoMantenimiento: TQuery;
    qActividades: TQuery;
    dblcbEstadoTarea: TDBLookupComboBox;
    GroupBox1: TGroupBox;
    ESubestacion: TEdit;
    EElemento: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    dbeUltimo: TDBEdit;
    dbeFechaInicial: TDBEdit;
    dbeFechaFinal: TDBEdit;
    dbeFechaAlarma: TDBEdit;
    sbUltimo: TSpeedButton;
    sbFechaInicial: TSpeedButton;
    sbFechaFinal: TSpeedButton;
    sbFechaAlarma: TSpeedButton;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    qSubestacion: TQuery;
    dsSubestacion: TDataSource;
    qElementoMantenimiento: TQuery;
    qLinea: TQuery;
    dsTarea: TDataSource;
    codigo1: TListBox;
    codigo2: TListBox;
    qCaracteristicasElemento: TQuery;
    qTablaElemento: TQuery;
    lElemento: TLabel;
    qEstadoTarea: TQuery;
    dsEstadoTarea: TDataSource;
    qActividadesProgramadas: TQuery;
    dbeNombreTarea: TDBEdit;
    qTareaCODIGOTAREA: TFloatField;
    qTareaCODIGOUSUARIO: TFloatField;
    qTareaNOMBRETAREA: TStringField;
    qTareaFECHAINICIAL: TDateTimeField;
    qTareaFECHAFINAL: TDateTimeField;
    qTareaCODIGOESTADOTAREA: TFloatField;
    qTareaDESCRIPCION: TBlobField;
    qTareaCODIGOTIPOTAREA: TFloatField;
    qTareaFRECUENCIA: TFloatField;
    qTareaFECHAALARMA: TDateTimeField;
    qTareaCODIGODESC: TStringField;
    qBancoMantenimientoCODIGOBANCOMANTENIMIENTO: TFloatField;
    qBancoMantenimientoCODIGONIVELTENSION: TStringField;
    qBancoMantenimientoCODIGOAMBITO: TFloatField;
    qBancoMantenimientoFRECUENCIA: TFloatField;
    qBancoMantenimientoDESCRIPCION: TBlobField;
    qBancoMantenimientoCODIGOTIPOMANT: TFloatField;
    qBancoMantenimientoCODIGODESCRIPTIVO: TStringField;
    qBancoMantenimientoCODIGOELEMENTO: TFloatField;
    qBancoMantenimientoCODIGOAREAOPERACIONODT: TFloatField;
    dsMantenimiento: TDataSource;
    dsLinea: TDataSource;
    updateMantenimiento: TUpdateSQL;
    updateTarea: TUpdateSQL;
    updateElementoMantenimiento: TUpdateSQL;
    updActividadesProgramadas: TUpdateSQL;
    qActividadesProgramadasCONSECUTIVOACTIVIDAD: TFloatField;
    qActividadesProgramadasCODIGOMANTENIMIENTO: TFloatField;
    qActividadesProgramadasCODIGOACTIVIDADMANTENIMIENTO: TFloatField;
    eRecomendado: TEdit;
    qBancoMantenimientoNOMBREMANTENIMIENTO: TStringField;
    qSubactividadprueba: TQuery;
    clbSubactividadprueba: TCheckListBox;
    lbSp: TListBox;
    Elinea: TEdit;
    Eultimo: TEdit;
    qActividadesCODIGOACTIVIDADMANTENIMIENTO: TFloatField;
    qActividadesCODIGOBANCOMANTENIMIENTO: TFloatField;
    qActividadesCODIGOSUBACTIVIDADAREAODT: TFloatField;
    qActividadesNOMBREACTIVIDADMANTENIMIENTO: TStringField;
    actividades: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lLinea: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    qPruebasprogramadas: TQuery;
    updpruebasprogramadas: TUpdateSQL;
    DBEdit1: TDBEdit;
    GroupBox4: TGroupBox;
    DBMemo1: TDBMemo;
    procedure sbFechaInicialClick(Sender: TObject);
    procedure clbActividadesClickCheck(Sender: TObject);
    procedure qTareaNewRecord(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbFechaFinalClick(Sender: TObject);
    procedure sbFechaAlarmaClick(Sender: TObject);
    procedure qElementoMantenimientoBeforePost(DataSet: TDataSet);
    procedure qTareaBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    function getDatosCorreo:TDatosCorreo2;
  private
    { Private declarations }
  public
    { Public declarations }
    Correo:TDatosCorreo2;
    NActividadesProgramadas: integer;
    FechaInicial,FechaRecomendado:TDateTime;
    sFecha,Fecha:string;
    function GetFecha(Tipo:Boolean): String;
    constructor programar(AOwner:TComponent;codbanco,codmantenimiento:real);
  end;

var
  fMantenimientoMes: TfMantenimientoMes;

implementation

uses uFormaFechaMtto, uMttosPendientes, uFIMPComunes;



{$R *.DFM}


constructor TfMantenimientoMes.programar(AOwner:Tcomponent;codbanco,codmantenimiento:real);
var sqltablaelemento,codsubestacion,codlinea: string;

begin
  inherited create(Owner);
  if qBancoMantenimiento.Active then
    qBancoMantenimiento.Close;
  qBancoMantenimiento.ParamByName('CODIGOBANCOMANTENIMIENTO').asfloat:= codbanco;
  qBancoMantenimiento.Open;
  if qAmbito.Active then
    qAmbito.Close;
  qAmbito.ParamByName('CODIGOAMBITO').asinteger:= qBancoMantenimiento.fieldbyname('CODIGOAMBITO').asinteger;
  qAmbito.Open;
  if qNivelTension.Active then
    qNivelTension.Close;
  qNivelTension.ParamByName('CODIGONIVELTENSION').asstring:= qBancoMantenimiento.fieldbyname('CODIGONIVELTENSION').asstring;
  qNivelTension.Open;
  if qTipoElemento.Active then
    qTipoElemento.Close;
  qTipoElemento.ParamByName('CODIGOELEMENTO').asinteger:= qBancoMantenimiento.fieldbyname('CODIGOELEMENTO').asinteger;
  qTipoElemento.Open;
  if qTipoMantenimiento.Active then
    qTipoMantenimiento.Close;
  qTipoMantenimiento.ParamByName('CODIGOTIPOMANT').asinteger:= qBancoMantenimiento.fieldbyname('CODIGOTIPOMANT').asinteger;
  qTipoMantenimiento.Open;
  ENombreMantenimiento.Text:= qBancoMantenimiento.fieldbyname('NOMBREMANTENIMIENTO').asstring;
  EAmbito.Text:= qAmbito.fieldbyname('NOMBREAMBITO').asstring;
  ENivelTension.Text:= qNivelTension.fieldbyname('TENSION').asstring;
  ETipoElemento.Text:= qTipoElemento.fieldbyname('NOMBRETIPOELEMENTO').asstring;
  EFrecuencia.Text:= qBancoMantenimiento.fieldbyname('FRECUENCIA').asstring;
  ETipoMantenimiento.Text:= qTipoMantenimiento.fieldbyname('NOMBREMANT').asstring;
  if qEstadoTarea.Active then
    qEstadoTarea.Close;
  qEstadoTarea.Open;  
  if qActividades.Active then
    qActividades.close;
  qActividades.ParamByName('CODIGOBANCOMANTENIMIENTO').asfloat:= qBancoMantenimiento.fieldbyname('CODIGOBANCOMANTENIMIENTO').asfloat;
  qActividades.Open;

  if not (qActividades.RecordCount = 0) then
    begin
      if clbActividades.Items.Count > 0 then
        clbActividades.Clear;
      while not qActividades.Eof do
        begin
          clbActividades.Items.Append(qActividades.fieldbyname('NOMBREACTIVIDADMANTENIMIENTO').asstring);
          actividades.Items.Append(qActividades.fieldbyname('CODIGOACTIVIDADMANTENIMIENTO').asstring);
          qActividades.Next;
        end;
    end;
  if qTarea.Active then
    qTarea.Close;
  qTarea.ParamByName('CODIGOTAREA').asfloat:= codmantenimiento;
  qTarea.Open;
  FechaInicial:= qTarea.fieldbyname('FECHAINICIAL').value;
  Eultimo.Text:= FormatDateTime('dd/mm/yyy hh:nn:ss',qTarea.fieldbyname('FECHAINICIAL').AsDateTime);
  if qMantenimiento.Active then
    qMantenimiento.Close;
  qMantenimiento.ParamByName('CODIGOMANTENIMIENTO').asfloat:= codmantenimiento;
  qMantenimiento.Open;
  if qSubestacion.Active then
    qSubestacion.Close;
  qSubestacion.Open;
  codsubestacion:= qMantenimiento.fieldbyname('CODIGOSUBESTACION').asstring;
  if (qBancoMantenimiento.FieldByName('CODIGOAMBITO').asinteger = 2) then
    begin
      if ELinea.Visible = false then
        ELinea.Visible:= true;
      if lLinea.Visible = false then
        lLinea.Visible:= true;
      if qLinea.Active then
        qLinea.Close;
      qLinea.ParamByName('CODIGOSUBESTACION').asstring:= qMantenimiento.fieldbyname('CODIGOSUBESTACION').asstring;
      qLinea.Open;
      codlinea:= qMantenimiento.fieldbyname('CODIGOCIRCUITO').asstring;
      if qElementoMantenimiento.Active then
        qElementoMantenimiento.Close;
      qElementoMantenimiento.ParamByName('CODIGOELEMENTOMANTENIMIENTO').asfloat:= qMantenimiento.fieldbyname('CODIGOMANTENIMIENTO').asfloat;
      qElementoMantenimiento.Open;
      if qCaracteristicasElemento.Active then
        qCaracteristicasElemento.Close;
      qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= qElementoMantenimiento.fieldbyname('CODIGOELEMENTO').asinteger;
      qCaracteristicasElemento.Open;
      if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) then
        begin
          if (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
            begin
              if qTablaElemento.Active then
                qTablaElemento.Close;
              qTablaElemento.SQL.Clear;
              sqltablaelemento:=' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                                  qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO AND'+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+'='+qElementoMantenimiento.fieldbyname('CLELEMENTO1').asstring;
              qTablaElemento.SQL.Add(sqltablaelemento);
              qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= qMantenimiento.fieldbyname('CODIGOCIRCUITO').asstring;
              qTablaElemento.Open;
              Eelemento.Text:= qTablaElemento.Fields[0].asstring;
              lElemento.Caption:= qCaracteristicasElemento.fieldbyname('NOMBRETABLAELEMENTO').asstring;
              codigo1.Items.Append(qElementoMantenimiento.fieldbyname('CLELEMENTO1').asstring);
            end
          else
            begin
              Eelemento.Text:= qCaracteristicasElemento.fieldbyname('CLELELEMENTO1').asstring;
              lElemento.Caption:= qCaracteristicasElemento.fieldbyname('NOMBRETABLAELEMENTO').asstring;
              codigo1.Items.Append(qElementoMantenimiento.fieldbyname('CLELEMENTO1').asstring);
            end;

        end
      else
        begin
         if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) then
           begin
             if (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
               begin
                 if qTablaElemento.Active then
                   qTablaElemento.Close;
                 qTablaElemento.SQL.Clear;
                 sqltablaelemento:=' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                                     qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO AND'+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+'='+qElementoMantenimiento.fieldbyname('CLELEMENTO1').asstring+
                                     'AND'+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+'='+qElementoMantenimiento.fieldbyname('CLELEMENTO2').asstring;
                 qTablaElemento.SQL.Add(sqltablaelemento);
                 qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= qMantenimiento.fieldbyname('CODIGOCIRCUITO').asstring;
                 qTablaElemento.Open;
                 Eelemento.Text:= qTablaElemento.Fields[0].asstring;
                 lElemento.Caption:= qCaracteristicasElemento.fieldbyname('NOMBRETABLAELEMENTO').asstring;
                 codigo1.Items.Append(qElementoMantenimiento.fieldbyname('CLELEMENTO1').asstring);
               end
             else
               begin
                 Eelemento.Text:= qCaracteristicasElemento.fieldbyname('CLELEMENTO1').asstring+qCaracteristicasElemento.fieldbyname('CLELEMENTO2').asstring;
                 lElemento.Caption:= qCaracteristicasElemento.fieldbyname('NOMBRETABLAELEMENTO').asstring;
                 codigo1.Items.Append(qElementoMantenimiento.fieldbyname('CLELEMENTO1').asstring);
                 codigo2.Items.Append(qElementoMantenimiento.fieldbyname('CLELEMENTO2').asstring);
               end;
           end;
        end;
    end
  else
    begin
      if Elinea.Visible = true then
        Elinea.Visible:= false;
      if lLinea.Visible = true then
        lLinea.Visible:= false;  
      if qElementoMantenimiento.Active then
        qElementoMantenimiento.Close;
      qElementoMantenimiento.ParamByName('CODIGOELEMENTOMANTENIMIENTO').asfloat:= qMantenimiento.fieldbyname('CODIGOMANTENIMIENTO').asfloat;
      qElementoMantenimiento.Open;
      if qCaracteristicasElemento.Active then
        qCaracteristicasElemento.Close;
      qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= qElementoMantenimiento.fieldbyname('CODIGOELEMENTO').asinteger;
      qCaracteristicasElemento.Open;
      if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) then
        begin
          if (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
            begin
              if qTablaElemento.Active then
                qTablaElemento.Close;
              qTablaElemento.SQL.Clear;
              sqltablaelemento:=' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                                  qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION AND'+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+'='''+qElementoMantenimiento.fieldbyname('CLELEMENTO1').asstring+''' ';
              qTablaElemento.SQL.Add(sqltablaelemento);
             // fMttosPendientes.Memo1.Lines.Append(sqltablaelemento);
              qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= qMantenimiento.fieldbyname('CODIGOSUBESTACION').asstring;
              qTablaElemento.Open;
              Eelemento.Text:= qTablaElemento.Fields[0].asstring;
              lElemento.Caption:= qCaracteristicasElemento.fieldbyname('NOMBRETABLAELEMENTO').asstring;
              codigo1.Items.Append(qElementoMantenimiento.fieldbyname('CLELEMENTO1').asstring);
            end
          else
            begin
              Eelemento.Text:= qCaracteristicasElemento.fieldbyname('CLELELEMENTO1').asstring;
              lElemento.Caption:= qCaracteristicasElemento.fieldbyname('NOMBRETABLAELEMENTO').asstring;
              codigo1.Items.Append(qElementoMantenimiento.fieldbyname('CLELEMENTO1').asstring);
            end;

        end
      else
        begin
         if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) then
           begin
             if (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
               begin
                 if qTablaElemento.Active then
                   qTablaElemento.Close;
                 qTablaElemento.SQL.Clear;
                 sqltablaelemento:=' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                                     qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION AND'+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+'='+qElementoMantenimiento.fieldbyname('CLELEMENTO1').asstring+
                                     'AND'+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+'='+qElementoMantenimiento.fieldbyname('CLELEMENTO2').asstring;
                 qTablaElemento.SQL.Add(sqltablaelemento);
                 qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= qMantenimiento.fieldbyname('CODIGOSUBESTACION').asstring;
                 qTablaElemento.Open;
                 Eelemento.Text:= qTablaElemento.Fields[0].asstring;
                 lElemento.Caption:= qCaracteristicasElemento.fieldbyname('NOMBRETABLAELEMENTO').asstring;
                 codigo1.Items.Append(qElementoMantenimiento.fieldbyname('CLELEMENTO1').asstring);
               end
             else
               begin
                 Eelemento.Text:= qCaracteristicasElemento.fieldbyname('CLELEMENTO1').asstring+qCaracteristicasElemento.fieldbyname('CLELEMENTO2').asstring;
                 lElemento.Caption:= qCaracteristicasElemento.fieldbyname('NOMBRETABLAELEMENTO').asstring;
                 codigo1.Items.Append(qElementoMantenimiento.fieldbyname('CLELEMENTO1').asstring);
                 codigo2.Items.Append(qElementoMantenimiento.fieldbyname('CLELEMENTO2').asstring);
               end;
           end;
        end;


    end;
  if qActividadesProgramadas.Active then
     qActividadesProgramadas.Close;
  qActividadesProgramadas.Open;
  if qPruebasprogramadas.Active then
    qPruebasProgramadas.Close;
  qPruebasProgramadas.Open;
  qTarea.Append;
  qMantenimiento.Append;
  qElementoMantenimiento.Append;
  qTarea.FieldByName('NOMBRETAREA').asstring:= qBancoMantenimiento.fieldbyname('NOMBREMANTENIMIENTO').asstring;
  qTarea.FieldByName('FRECUENCIA').asinteger:= qBancoMantenimiento.fieldbyname('FRECUENCIA').asinteger;
  qTarea.FieldByName('CODIGODESC').AsString:= qBancoMantenimiento.fieldByName('CODIGODESCRIPTIVO').AsString;
  qTarea.FieldByName('DESCRIPCION').asstring:= qBancoMantenimiento.fieldbyName('DESCRIPCION').asstring;
//  qTarea.FieldByName('FECHAINICIAL').value:= FechaInicial;
  qMantenimiento.FieldByName('CODIGOMANTENIMIENTO').asfloat:= qTarea.fieldbyname('CODIGOTAREA').asfloat;
  qMantenimiento.FieldByName('CODIGOTIPOMANT').asinteger:= qBancoMantenimiento.fieldbyname('CODIGOTIPOMANT').asinteger;
  qMantenimiento.FieldByName('CODIGOBANCOMANTENIMIENTO').asfloat:= qBancoMantenimiento.fieldbyname('CODIGOBANCOMANTENIMIENTO').asfloat;
  qMantenimiento.FieldByName('CODIGOAMBITO').asinteger:= qBancoMantenimiento.fieldbyname('CODIGOAMBITO').asinteger;
  qSubestacion.Locate('codigosubestacion',codsubestacion,[]);
  ESubestacion.Text:= qSubestacion.fieldbyname('NOMBRESUBESTACION').asstring;
  qMantenimiento.FieldByName('CODIGOSUBESTACION').asstring:= codsubestacion;
  if (qBancoMantenimiento.FieldByName('CODIGOAMBITO').asinteger = 2) then
    begin
      qLinea.Locate('codigocircuito',codlinea,[]);
      Elinea.Text:= qLinea.fieldbyname('NOMBRECIRCUITO').asstring;
      qMantenimiento.FieldByName('CODIGOCIRCUITO').asstring:= codlinea;

    end;
  FechaRecomendado:= FechaInicial + qBancoMantenimiento.fieldbyname('FRECUENCIA').asinteger;
  eRecomendado.Text:= formatdatetime('dd/mm/yyyy hh:nn:ss',FechaRecomendado);
//  eRecomendado.Text:= datetostr(FechaRecomendado);





end;

function TfMantenimientoMes.GetFecha(Tipo:Boolean): String;
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


procedure TfMantenimientoMes.sbFechaInicialClick(Sender: TObject);
begin
  dbeFechaInicial.SetFocus;
  sFecha := dbeFechaInicial.Text;
  Fecha := GetFecha(True);
  if Fecha <> '' then dbeFechaInicial.Text := Fecha;
  
end;

procedure TfMantenimientoMes.clbActividadesClickCheck(Sender: TObject);
var i:integer;
begin
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

procedure TfMantenimientoMes.qTareaNewRecord(DataSet: TDataSet);
var qry3:Tquery;
begin
  qry3:= TQuery.Create(Application);
  qry3.DatabaseName:='BaseDato';
  qry3.SQL.Clear;
  qry3.SQL.Add('select numeromant.nextval from dual');
  qry3.Open;
  QTareaCODIGOTAREA.Value:= qry3.Fields[0].AsFloat;
  QTareaCODIGOUSUARIO.Value:= 2;
  qry3.Free;
end;

procedure TfMantenimientoMes.SpeedButton1Click(Sender: TObject);
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
  while (itppal <=  (actividades.Items.Count - 1)) do
    begin
      if (clbActividades.Checked[itppal]) then
        begin
          itsec:= 0;
          if qry1.Active then
            qry1.Close;
          qry1.ParamByName('CODIGOACTIVIDADMANTENIMIENTO').asfloat:= strtofloat(actividades.Items.Strings[itppal]);
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
            itppal:= actividades.Items.Count
          else
            itppal:= itppal + 1;
        end
      else
       // begin
         { if qry1.Active then
            qry1.Close;
          qry1.ParamByName('CODIGOACTIVIDADMANTENIMIENTO').asfloat:= strtofloat(actividades.strings[itppal]);
          qry1.Open;}
          itppal:= itppal + 1;
       //   contador:= contador + qry1.Fields[0].asinteger;
      //  end;

    end;
  if resultado then
    result:= true
  else
    result:= false;

end;

var bandera: boolean;
    i,j,contador: integer;
    qry1:Tquery;
    sqlprueba: string;
    asunto, mensaje, MensajeEstado: string;
    qConsulta:tquery;
begin
    asunto:= 'Creación o modificación de Mantenimiento';
  if NActividades = false then
    MessageDlg('Debe asignar al menos una actividad al mantenimiento', mtInformation,[mbOk], 0)


// if listamantenimientos.Items.Count = 0 then
//   MessageDlg('No hay Mantenimientos Disponibles para agregar.', mtInformation,[mbOk], 0)
 else
   begin
     if NPruebas = false then
       MessageDlg('Para cada actividad seleccionada, debe escoger por lo menos una prueba relacionada', mtInformation,[mbOk], 0)
     else
       begin
         bandera:= true;
         if (dblcbEstadoTarea.Text = '') then
           begin
             application.MessageBox(pchar('Debe asignar un estado de tarea'),'Error en Estado Tarea',mb_iconerror);
             bandera:=false;
             exit;
           end;
         if (dbeFechaInicial.Text <> '') then
           begin
             try
               StrToDateTime(dbeFechaInicial.Text);
             except
               on e:exception do
                 begin
                   application.MessageBox(pchar('Fecha Inicial de Programación Incorrecta'),'Error en Fecha Inicial',mb_iconerror);
                   bandera:=false;
                   exit;
                 end;
             end;
           end
         else
           begin
             application.MessageBox(pchar('Debe asignar una Fecha Inicial de Programación'),'Error en Fecha Inicial',mb_iconerror);
             bandera:=false;
             exit;
           end;


     // FECHA FINAL PROGRAMACION ***********************************************
         if (dbeFechaFinal.text <> '') then
           begin
             try
               StrToDateTime(dbeFechaFinal.Text);
               if (StrToDateTime(dbeFechaFinal.Text)-StrtoDateTime(dbeFechaInicial.Text))<=0 then
                 begin
                   application.MessageBox(pchar('Fecha Final debe ser mayor a Fecha Inicial en Programación'),'Error en Fecha Final Programación',mb_iconerror);
                   bandera:=false;
                   exit;
                 end;
             except
               on e:exception do
                 begin
                   application.MessageBox(pchar('Fecha Final Programación Incorrecta'),'Error en Fecha Final Programación',mb_iconerror);
                   bandera:=false;
                   exit;
                 end;
             end;
           end
         else
           begin
             application.MessageBox(pchar('Debe asignar una Fecha Final de Programación'),'Error en Fecha Final Programación',mb_iconerror);
             bandera:=false;
             exit;
           end;

     // FECHA ALARMA ***********************************************************
         if (dbeFechaAlarma.text <>'') then
           begin
             try
               StrToDateTime(dbeFechaAlarma.Text);
               if (StrToDateTime(dbeFechaInicial.Text)-StrtoDateTime(dbeFechaAlarma.Text))< 0 then
                 begin
                   application.MessageBox(pchar('Fecha Alarma debe ser menor a Fecha Inicial en Programación'),'Error en Fecha Alarma',mb_iconerror);
                   bandera:=false;
                   exit;
                 end;
             except
               on e:exception do
                 begin
                   application.MessageBox(pchar('Fecha Alarma Incorrecta'),'Error en Fecha Alarma',mb_iconerror);
                   bandera:=false;
                   exit;
                 end;
             end;
           end
        else
          dbeFechaAlarma.text:='';
       end;
   end;
 if bandera = true then
   begin
     NActividadesProgramadas:= 1;
     qry1:= Tquery.Create(application);
     qry1.DatabaseName:='BaseDato';
     sqlprueba:= 'select count(sp.codigosubactividadprueba) as ncodigo from subactividadprueba sp,pm_actividadmantenimiento am where'+' '+
                 'am.codigoactividadmantenimiento =:codigoactividadmantenimiento and am.codigosubactividadareaodt = sp.codigosubactividadareaodt';
     qry1.SQL.Append(sqlprueba);
     contador:= 0;
     for i:= 0 to clbActividades.Items.Count - 1 do
       begin
         if clbActividades.Checked[i] then
           begin
             qActividadesProgramadas.Append;
             qActividadesProgramadas.FieldByName('CONSECUTIVOACTIVIDAD').asfloat:= NActividadesProgramadas;
             qActividadesProgramadas.FieldByName('CODIGOMANTENIMIENTO').asfloat:= qTarea.fieldbyname('CODIGOTAREA').asfloat;
             qActividadesProgramadas.FieldByName('CODIGOACTIVIDADMANTENIMIENTO').asfloat:= strtofloat(actividades.Items.Strings[i]);
             if qry1.Active then
               qry1.Close;
             qry1.ParamByName('CODIGOACTIVIDADMANTENIMIENTO').asfloat:= strtofloat(actividades.Items.Strings[i]);
             qry1.Open;
             for j:= 1 to qry1.Fields[0].asinteger do
               begin
                 if clbSubactividadprueba.Checked[contador] then
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
             //end;
           end;
       end;
     try
       qElementoMantenimiento.Post;
       qTarea.Post;
       qMantenimiento.Post;
       mensaje:= 'Se ha creado o modificado el mantenimiento número '+ qtarea.fieldbyname('codigotarea').asstring +' '+qtarea.fieldbyname('nombretarea').asstring+' del Elemento: '+qElementoMantenimiento.fieldbyname('clelemento1').asstring +' de la subestación: '+QSubestacion.fieldbyname('nombresubestacion').asstring +', a realizarse del '+ qtarea.fieldbyname('fechainicial').asstring+'  al ' +qtarea.fieldbyname('fechafinal').asstring;
       qTarea.ApplyUpdates;
       qMantenimiento.ApplyUpdates;
       qElementoMantenimiento.ApplyUpdates;
       qActividadesProgramadas.ApplyUpdates;
       qPruebasprogramadas.ApplyUpdates;
       ModalResult:=mrok;
     except
       on e:exception do
         begin
             //QTarea.Database.Rollback;
            //  QMantenimiento.CancelUpdates;
            //  QTarea.CancelUpdates;
           application.MessageBox(pchar('Error en la grabación de los Datos, verifíquelos e intente de nuevo'),'Error en Grabación',mb_iconerror);
               //  application.MessageBox(pchar(e.message),'Error en la Grabación de los Datos, Verifíquelos e Intente de nuevo',mb_iconerror);
                //  ModalResult:= mrCancel;
           exit;
         end;

     end;
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
      //qconsulta.sql.SaveToFile('c:\correomtto.txt');
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
   end;
end;

procedure TfMantenimientoMes.sbFechaFinalClick(Sender: TObject);
begin
  dbeFechaFinal.SetFocus;
  sFecha := dbeFechaFinal.Text;
  Fecha := GetFecha(True);
  if Fecha <> '' then dbeFechaFinal.Text := Fecha;
end;

procedure TfMantenimientoMes.sbFechaAlarmaClick(Sender: TObject);
begin
  dbeFechaAlarma.SetFocus;
  sFecha := dbeFechaAlarma.Text;
  Fecha := GetFecha(True);
  if Fecha <> '' then dbeFechaAlarma.Text := Fecha;
end;

procedure TfMantenimientoMes.qElementoMantenimientoBeforePost(
  DataSet: TDataSet);
begin
  if (qElementoMantenimiento.State = dsInsert) then
    begin
      qElementoMantenimiento.FieldByName('CODIGOELEMENTOMANTENIMIENTO').asfloat:= QTarea.fieldbyname('CODIGOTAREA').asfloat;
      if qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1 then
        begin

          qElementoMantenimiento.FieldByName('CLELEMENTO1').asstring:= codigo1.Items.Strings[0];
          qElementoMantenimiento.FieldByName('CODIGOELEMENTO').asinteger:= qCaracteristicasElemento.fieldbyname('CODIGOELEMENTO').asinteger;
        end
      else
        begin
          qElementoMantenimiento.FieldByName('CLELEMENTO1').asstring:= codigo1.Items.Strings[0];
          qElementoMantenimiento.FieldByName('CLELEMENTO2').asstring:= codigo2.Items.Strings[0];
          qElementoMantenimiento.FieldByName('CODIGOELEMENTO').asinteger:= qCaracteristicasElemento.fieldbyname('CODIGOELEMENTO').asinteger;
        end;
    end;
end;

procedure TfMantenimientoMes.qTareaBeforePost(DataSet: TDataSet);
begin
  QTarea.FieldByName('CODIGOTIPOTAREA').Value:=1;
  QTareaCODIGOUSUARIO.Value:= 2;
end;

procedure TfMantenimientoMes.FormCreate(Sender: TObject);
begin
Correo:=getDatosCorreo;
end;

function TfMantenimientoMes.getDatosCorreo:TDatosCorreo2;
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

end.
