unit uHabilitarPlanillaExtras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uMaestroSimple, DBTables, Db, StdCtrls, Buttons, DBCtrls, Grids, DBGrids,
  RXDBCtrl, ExtCtrls, ComCtrls, Mask;

type
  TfHabilitarPlanillaExtras = class(TfMaestroSimple)
    qDatosUsuarioHabilita: TStringField;
    qDatosUsuariosolicita: TStringField;
    qDatosNombreEmpleado: TStringField;
    qDatosCodigoAdministrativo: TFloatField;
    Panel4: TPanel;
    Label4: TLabel;
    EdMotivos: TDBMemo;
    qDatosCODIGOHABILITARPLANILLAEXTRAS: TFloatField;
    qDatosCODIGOEMPLEADO: TFloatField;
    qDatosFECHAPLANILLA: TDateTimeField;
    qDatosFECHA: TDateTimeField;
    qDatosCODIGOUSUARIOREALIZA: TFloatField;
    qDatosCODIGOUSUARIOSOLICITA: TFloatField;
    qDatosMOTIVOS: TStringField;
    SpeedButton1: TSpeedButton;
    qDatosEstadoPlanilla: TStringField;
    qDatosFinMes: TDateField;
    procedure SBFiltrarClick(Sender: TObject);
    procedure qDatosCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure qDatosAfterInsert(DataSet: TDataSet);
    procedure qDatosMOTIVOSSetText(Sender: TField; const Text: String);
    procedure dbgActividadOdtEditButtonClick(Sender: TObject);
    procedure qDatosBeforePost(DataSet: TDataSet);
    procedure qDatosAfterPost(DataSet: TDataSet);
    procedure qDatosBeforeInsert(DataSet: TDataSet);
    function ValidarRegistroProcesadoPorNomina(codemp:double;fecha:tdatetime):boolean;
    procedure SpeedButton1Click(Sender: TObject);
    procedure EdCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure EdCodigo2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public

  end;

var
  fHabilitarPlanillaExtras: TfHabilitarPlanillaExtras;

implementation

uses uComunesAdministrativo, ConsDll, uFuncionSGD;

{$R *.DFM}

procedure TfHabilitarPlanillaExtras.SBFiltrarClick(Sender: TObject);
var 
 i:integer;
begin
  qDatos.close;
  for i :=0  to qDatos.sql.count-5 do
  begin
    qDatos.SQL.Delete(3);
  end;
  i:=3;
  if EdCodigo.Text <> '' then
  begin
   qDatos.SQL.Insert(i,'WHERE H.CODIGOEMPLEADO= '+EdCodigo.Text);
   inc(i);
  end;
  if EdCodigo2.Text <> '' then
  begin
    if i=3 then
      qDatos.SQL.Insert(i,'WHERE EXISTS (SELECT NULL FROM EMPLEADO E WHERE E.CODIGOEMPLEADO=H.CODIGOEMPLEADO AND E.CODIGOADMINISTRATIVO='+EdCodigo2.Text+')')
    else
      qDatos.SQL.Insert(i,'AND EXISTS (SELECT NULL FROM EMPLEADO E WHERE E.CODIGOEMPLEADO=H.CODIGOEMPLEADO AND E.CODIGOADMINISTRATIVO='+EdCodigo2.Text+')');
     inc(i);
  end;
  if EdNombre.Text <> '' then
  begin
    if i=3 then
      qDatos.SQL.Insert(i,'WHERE H.MOTIVOS LIKE ''%'+EdNombre.Text+'%''')
    else
      qDatos.SQL.Insert(i,'AND H.MOTIVOS LIKE ''%'+EdNombre.Text+'%''')
  end;
  qDatos.Open;
end;

procedure TfHabilitarPlanillaExtras.qDatosCalcFields(DataSet: TDataSet);
var query:tquery;
    Year, Month, Day: Word;
begin
  query:=TQuery.create(Self);
  query.DatabaseName:='BaseDato';
  if qDatosCODIGOEMPLEADO.AsString<>'' then
  begin
    query.sql.clear;
    query.sql.Add('select e.nombreempleado,e.codigoadministrativo from empleado e');
    query.sql.add('where e.codigoempleado='+qDatosCODIGOEMPLEADO.AsString);
    query.open;
    qDatosNombreEmpleado.asstring:=query.fieldbyname('Nombreempleado').asstring;
    qDatosCodigoAdministrativo.AsFloat:=query.fieldbyname('codigoadministrativo').AsFloat;
  end;
  if qDatosCODIGOUSUARIOREALIZA.AsString<>'' then
  begin
    query.sql.clear;
    query.sql.add('select u.nombreusuario from usuario u');
    query.sql.add('where u.codigousuario='+qDatosCODIGOUSUARIOREALIZA.AsString);
    query.open;
    qDatosUsuarioHabilita.AsString:=query.Fields[0].AsString;
  end;
  if qDatosCodigoUsuarioSolicita.AsString<>'' then
  begin
    query.sql.clear;
    query.sql.add('select u.nombreusuario from usuario u');
    query.sql.add('where u.codigousuario='+qDatosCodigoUsuarioSolicita.AsString);
    query.open;
    qDatosUsuarioSolicita.AsString:=query.Fields[0].AsString;
  end;
  if qDatosCODIGOEMPLEADO.AsString<>'' then
  begin
    query.sql.clear;
    query.sql.add('select decode(p.codigoestadoplanilla,''BLO'',''TERMINADA'',''LIQUIDADA'') from planillamesempleado p');
    query.sql.add('where p.codigoempleado=:codigoempleado');
    query.sql.add('and p.fecha=:fecha');
    query.ParamByName('CODIGOEMPLEADO').AsFloat:= qDatosCODIGOEMPLEADO.AsFloat;
    query.ParamByName('FECHA').AsDateTime:= qDatosFECHAPLANILLA.AsDateTime;
    query.open;
    qDatosEstadoPlanilla.AsString:=query.Fields[0].AsString;
  end;
  query.free;

    DecodeDate(qDatosFECHAPLANILLA.AsDateTime, Year, Month, Day);

    if Month<12 then inc(Month)
    else
    begin
      inc(Year);
      Month:=1;
    end;
    qDatosFINMES.AsDateTime:=EncodeDate(Year, Month, Day)-1;
end;

procedure TfHabilitarPlanillaExtras.FormCreate(Sender: TObject);
begin
  inherited;
  qDatos.open;

end;

procedure TfHabilitarPlanillaExtras.qDatosAfterInsert(DataSet: TDataSet);
var query:tquery;
  codigoemp:double;
  fechaplanilla:TDateTime;
begin
  inherited;
  SeleccionarPlanillaExtras(codigoemp,fechaplanilla);
  query:=TQuery.Create(self);
  query.databasename:='BaseDato';
  if (codigoemp>0)and (fechaplanilla>0) then
  begin
    qDatosCODIGOEMPLEADO.AsFloat:=codigoemp;
    qDatosFECHAPLANILLA.AsDateTime:=fechaplanilla;
    query.sql.clear;
    query.sql.add('SELECT CODIGOADMINISTRATIVO FROM EMPLEADO WHERE CODIGOEMPLEADO='+qDatosCODIGOEMPLEADO.AsString);
    query.open;
    qDatosCodigoAdministrativo.Asfloat:=query.fieldbyname('CODIGOADMINISTRATIVO').asfloat;
  end
  else
    raise Exception.Create('Debe seleccionar una planilla para reabrir.');
  if not(ValidarRegistroProcesadoPorNomina(qDatosCODIGOEMPLEADO.AsFloat,qDatosFECHAPLANILLA.AsDateTime)) then
    raise exception.create('No se puede habilitar esta planilla puesto que ya ha sido procesado por Nómina.');
  qDatosFECHA.AsDateTime:= FechaServidor;
  RefrescarVariables;
  qDatosCODIGOUSUARIOREALIZA.AsInteger:=VarCodigoUsuario;
  query.free;
end;

procedure TfHabilitarPlanillaExtras.qDatosMOTIVOSSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  sender.AsString:=UpperCase(Text);
end;

procedure TfHabilitarPlanillaExtras.dbgActividadOdtEditButtonClick(
  Sender: TObject);
var codigo:double;
begin
  inherited;
  if (qDatos.State =dsInsert) then
  begin  codigo:=SeleccionarUsuario;
    if codigo>0 then
      qDatosCODIGOUSUARIOSOLICITA.AsFloat:=codigo
    else
      raise Exception.Create('Debe seleccionar el usuario que solicita realizar Reabrir la ODT.');
    qDatosCalcFields(qdatos);
  end
  else
    raise exception.create('El registro no es editable');    
end;

procedure TfHabilitarPlanillaExtras.qDatosBeforePost(DataSet: TDataSet);
var query,qactualiza:tquery;
begin
  inherited;
  if (qDatosCODIGOUSUARIOSOLICITA.AsString='') then
    raise Exception.Create('Debe ingresar El usuario que realizó la solicitud de rehabilitar la impresión.');
  if (qDatosMOTIVOS.AsString='') then
    raise Exception.Create('Debe ingresar el motivo de la solicitud de rehabilitar la impresión.');
  query:=TQuery.Create(self);
  query.DatabaseName:='BaseDato';
  if (qDatosCodigoAdministrativo.AsString<>'')then
  begin
    query.sql.add('SELECT COUNT(*) FROM ODTPERMISOS');
    query.sql.add('WHERE NOMBRETABLA=''ABRIRPLANILLAMESEMPLEADO''');
    query.sql.add('AND CODIGOADMINISTRATIVO='+qDatosCodigoAdministrativo.AsString);
    query.sql.add('AND CODIGOUSUARIO='+qDatosCODIGOUSUARIOREALIZA.AsString);
    query.sql.add('AND REABRIR=''S''');
    query.Open;
  end;

  if varcodigousuario>0 then
  begin
    if query.fields[0].Asinteger =0 then
    begin
      raise Exception.Create('Este usuario no tiene Permisos para Reabrir  Planillas  '+char(13)+'de liquidación de Extras y Recargos para esta dependencia.');
    end;
  end;
  qactualiza:=TQuery.create(self);
  qactualiza.databasename:='BaseDato';
  
  qactualiza.sql.add('UPDATE PLANILLAMESEMPLEADO P SET P.CODIGOESTADOPLANILLA=''LIQ'' ');
  qactualiza.sql.add('WHERE P.CODIGOEMPLEADO=:CODIGOEMPLEADO');
  qactualiza.sql.add('AND P.FECHA=:FECHA');
  qactualiza.ParamByName('CODIGOEMPLEADO').AsFloat:= qDatosCODIGOEMPLEADO.AsFloat;
  qactualiza.ParamByName('FECHA').AsDateTime:= qDatosFECHAPLANILLA.AsDateTime;
  qactualiza.ExecSQL;


  Query.SQL.Clear;
  Query.SQL.Add('UPDATE PLANILLATURNOEMPLEADO SET CODIGOESTADOPLANILLA = ''LIQ'' ');
  Query.SQL.Add('WHERE CODIGOEMPLEADO = ' + qDatosCODIGOEMPLEADO.AsString);
  Query.SQL.Add('AND FECHA = TO_DATE(''' + FormatDateTime('MM/DD/YYYY',qDatosFECHAPLANILLA.AsDateTime) + ''',''MM/DD/YYYY'')');
  Query.ExecSQL;

  Query.SQL.Clear;
  Query.SQL.Add('UPDATE TURNOEMPLEADO SET CODIGOESTADO =  ''LIQ'' ');
  Query.SQL.Add('WHERE CODIGOEMPLEADO = ' + qDatosCODIGOEMPLEADO.AsString);
  Query.SQL.Add('AND FECHA >= TO_DATE(''' + FormatDateTime('MM/DD/YYYY',qDatosFECHAPLANILLA.AsDateTime) + ''',''MM/DD/YYYY'')');
  Query.SQL.Add('AND FECHA <= TO_DATE(''' + FormatDateTime('MM/DD/YYYY',qDatosFinMes.AsDateTime) + ''',''MM/DD/YYYY'')');
  Query.ExecSQL;

  Query.SQL.Clear;
  Query.SQL.Add('UPDATE ODTSOBRETIEMPODETALLE SET ESTADO =  ''LIQ'' ');
  Query.SQL.Add('WHERE CODIGOEMPLEADO = ' + qDatosCODIGOEMPLEADO.AsString);
  Query.SQL.Add('AND FECHAHORAHASTA >= TO_DATE(''' + FormatDateTime('MM/DD/YYYY',qDatosFECHAPLANILLA.AsDateTime) + ''',''MM/DD/YYYY'')');
  Query.SQL.Add('AND FECHAHORAHASTA <= TO_DATE(''' + FormatDateTime('MM/DD/YYYY',qDatosFinMes.AsDateTime) + ''',''MM/DD/YYYY'')');
  Query.ExecSQL;

  qactualiza.sql.clear;
  qactualiza.sql.add('DELETE FROM SIP_EXTRA_TIEMPO S');
  qactualiza.sql.add('WHERE S.CODIGO=:CODIGOEMPLEADO');
  qactualiza.sql.add('AND S.ANO_SBT=TO_NUMBER(TO_CHAR(:FECHA,''YYYY''))');
  qactualiza.sql.add('AND S.MES_SBT=TO_NUMBER(TO_CHAR(:FECHA,''MM''))');
  qactualiza.sql.add('AND S.NOMINA_SIRH IS NULL ');
  qactualiza.ParamByName('CODIGOEMPLEADO').AsFloat:= qDatosCODIGOEMPLEADO.AsFloat;
  qactualiza.ParamByName('FECHA').AsDateTime:= qDatosFECHAPLANILLA.AsDateTime;
  qactualiza.ExecSQL;
  qactualiza.free;
  query.free;
end;

procedure TfHabilitarPlanillaExtras.qDatosAfterPost(DataSet: TDataSet);
begin
  inherited;
  EdMotivos.enabled:=false;
end;

procedure TfHabilitarPlanillaExtras.qDatosBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  EdMotivos.enabled:=true;
end;

function TfHabilitarPlanillaExtras.ValidarRegistroProcesadoPorNomina(
  codemp:double;fecha:tdatetime): boolean;
var query:tquery;
begin
  result:=true;
  query:=TQuery.create(self);
  query.DatabaseName:='BaseDato';
  query.sql.clear;
  query.sql.add('select COUNT(*) from planillamesempleado P');
  query.sql.add('where codigoestadoplanilla=''BLO''');
  query.sql.add('AND EXISTS');
  query.sql.add('(');
  query.sql.add('SELECT NULL FROM SIP_EXTRA_TIEMPO S');
  query.sql.add('WHERE P.CODIGOEMPLEADO=S.CODIGO');
  query.sql.add('AND S.ANO_SBT=TO_NUMBER(TO_CHAR(P.FECHA,''YYYY''))');
  query.sql.add('AND S.MES_SBT=TO_NUMBER(TO_CHAR(P.FECHA,''MM''))');
  query.sql.add('AND S.NOMINA_SIRH IS NOT NULL )');
  query.sql.add('AND P.CODIGOEMPLEADO=:CODIGOEMPLEADO');
  query.sql.add('AND P.FECHA=:FECHA');
  query.ParamByName('CODIGOEMPLEADO').AsFloat:= codemp;
  query.ParamByName('FECHA').AsDateTime:= fecha;
  query.open;
  if query.fields[0].AsFloat>0 then
    result:=false;
end;

procedure TfHabilitarPlanillaExtras.SpeedButton1Click(Sender: TObject);
var cia:double;
begin
  cia:= CapturarCIA;
  if cia>0 then EdCodigo2.Text:=floattostr(cia);
end;

procedure TfHabilitarPlanillaExtras.EdCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
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
  end
  else
  begin
    if not ((key  in ['1','2','3','4','5','6','7','8','9','0']) or (Key = #8))
      then raise exception.create('Este campo debe ser numérico');
      Application.ProcessMessages;
  end;
end;

procedure TfHabilitarPlanillaExtras.EdCodigo2KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #13) then
  begin
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
  end
  else
  begin
    if not ((key  in ['1','2','3','4','5','6','7','8','9','0']) or (Key = #8))
      then raise exception.create('Este campo debe ser numérico');
      Application.ProcessMessages;
  end;
end;

end.
  