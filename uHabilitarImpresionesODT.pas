unit uHabilitarImpresionesODT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uMaestroSimple, DBTables, Db, StdCtrls, Buttons, DBCtrls, Grids, DBGrids,
  RXDBCtrl, ExtCtrls, ComCtrls, Mask;

type
  TfHabilitarImpresionCobros = class(TfMaestroSimple)
    qDatosCODIGOODTHABILITARIMPRESION: TFloatField;
    qDatosNUMEROIMPRESION: TFloatField;
    qDatosFECHA: TDateTimeField;
    qDatosCODIGOUSUARIOREALIZA: TFloatField;
    qDatosCODIGOUSUARIOSOLICITA: TFloatField;
    qDatosMOTIVOS: TStringField;
    qDatosFECHAIMPRESION: TDateTimeField;
    qDatosCODIGOODT: TFloatField;
    qDatosVALOR: TFloatField;
    qDatosTipoCobro: TStringField;
    qDatosUsuarioHabilita: TStringField;
    qDatosUsuariosolicita: TStringField;
    qDatosNombreEmpleado: TStringField;
    qDatosCodigoAdministrativo: TFloatField;
    qDatosCODIGOEMPLEADO: TFloatField;
    qDatosCODIGOS: TStringField;
    Panel4: TPanel;
    Label4: TLabel;
    EdMotivos: TDBMemo;
    procedure SBFiltrarClick(Sender: TObject);
    procedure qDatosCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure qDatosAfterInsert(DataSet: TDataSet);
    procedure qDatosMOTIVOSSetText(Sender: TField; const Text: String);
    procedure dbgActividadOdtEditButtonClick(Sender: TObject);
    procedure qDatosBeforePost(DataSet: TDataSet);
    procedure qDatosAfterPost(DataSet: TDataSet);
    procedure qDatosBeforeInsert(DataSet: TDataSet);
    function ValidarRegistroProcesadoPorNomina(numeroimpresion:string):boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fHabilitarImpresionCobros: TfHabilitarImpresionCobros;

implementation

uses uComunesAdministrativo, ConsDll;

{$R *.DFM}

procedure TfHabilitarImpresionCobros.SBFiltrarClick(Sender: TObject);
var 
 i:integer;
begin
  qDatos.close;
  for i :=0  to qDatos.sql.count-6 do
  begin
    qDatos.SQL.Delete(4);
  end;
  i:=4;
  if EdCodigo.Text <> '' then
  begin
   qDatos.SQL.Insert(i,'AND O.CODIGOODT LIKE ''%'+EdCodigo.Text+'%''');
   inc(i);
  end;
  if EdCodigo2.Text <> '' then
  begin
     qDatos.SQL.Insert(i,'AND O.CODIGOADMINISTRATIVO ='+EdCodigo2.Text);
     inc(i);
  end;
  if EdNombre.Text <> '' then
  begin
    qDatos.SQL.Insert(i,'AND H.MOTIVOS LIKE ''%'+EdNombre.Text+'%''');
  end;
  qDatos.Open;
end;

procedure TfHabilitarImpresionCobros.qDatosCalcFields(DataSet: TDataSet);
var query:tquery;
begin
  inherited;
  if (qDatosNUMEROIMPRESION.AsString<>'') then
  begin
    query:=TQuery.Create(self);
    query.DatabaseName:='BaseDato';
    query.sql.Add('select NUMEROIMPRESION, TIPO, FECHA, CODIGOODT, VALOR  from odtimpresion');
    query.sql.Add('where numeroimpresion='+qDatosNUMEROIMPRESION.AsString);
    query.open;
    qDatosFECHAIMPRESION.AsDateTime:=query.FieldByName('FECHA').AsDateTime;
    qDatosCODIGOODT.AsFloat:= query.FieldByName('CODIGOODT').AsFloat;
    qDatosVALOR.AsFloat:= query.FieldByName('VALOR').AsFloat;
    if (query.FieldByName('TIPO').AsString='A') then
      qDatosTipoCobro.AsString:='AUXILIO'
    else
    begin
      if (query.FieldByName('TIPO').AsString='V') then
      begin
        qDatosTipoCobro.AsString:='VIATICO';
      end
      else
      if (query.FieldByName('TIPO').AsString='N') then
      begin
        qDatosTipoCobro.AsString:='ANTICIPO';
      end;
    end;
    if qDatosCODIGOEMPLEADO.AsString<>'' then
    begin
      query.sql.clear;
      query.sql.Add('select e.nombreempleado from empleado e');
      query.sql.add('where e.codigoempleado='+qDatosCodigoEmpleado.AsString);
      query.open;
      qDatosNombreEmpleado.asstring:=query.fieldbyname('Nombreempleado').asstring;
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
    query.sql.clear;
    query.sql.Add('SELECT CODIGOADMINISTRATIVO FROM ODT WHERE CODIGOODT='+qDatosCODIGOODT.AsString);
    query.Open;
    qDatosCodigoAdministrativo.AsFloat:=query.fieldbyname('CODIGOADMINISTRATIVO').AsFloat;
    query.free;
  end;
end;

procedure TfHabilitarImpresionCobros.FormCreate(Sender: TObject);
begin
  inherited;
  qDatos.open;
end;

procedure TfHabilitarImpresionCobros.qDatosAfterInsert(DataSet: TDataSet);
var query:tquery;
codigo:double;
cadena:string;
begin
  inherited;
  query:=tquery.create(self);
  Query.DatabaseName:='BaseDato';
  query.SQL.Add('SELECT sq_odthabilitarimpresion.NEXTVAL FROM DUAL');
  query.Open;
  codigo:=1;
  if (query.Fields[0].AsString<>'') then
    codigo:=query.Fields[0].asfloat;
  qDatosCODIGOODTHABILITARIMPRESION.AsFloat:=codigo;
  codigo:=SeleccionarImpresion;
  if codigo>0 then
    qDatosNUMEROIMPRESION.AsFloat:=codigo
  else
    raise Exception.Create('Debe seleccionar una impresion para rehabilitar.');
  if not(ValidarRegistroProcesadoPorNomina(qDatosNUMEROIMPRESION.Asstring)) then
    raise exception.create('No se puede habilitar la impresión de este cobro puesto que ya ha sido procesado por Nómina.');
  qDatosFECHA.AsDateTime:= FechaServidor;
  RefrescarVariables;
  qDatosCODIGOUSUARIOREALIZA.AsInteger:=VarCodigoUsuario;
  query.sql.clear;
  query.sql.add('select i.numeroimpresion,ev.codigoempleado');
  query.sql.add('from odtimpresion i,odtviatico v,empleado ev');
  query.sql.add('where i.numeroimpresion=v.numeroimpresion');
  query.sql.add('and v.codigoempleado=ev.codigoempleado');
  query.sql.add('and i.numeroimpresion=:numeroimpresion');
  query.sql.add('union');
  query.sql.add('select distinct i.numeroimpresion,ea.codigoempleado');
  query.sql.add('from odtauxilio a,empleado ea,odtimpresion i');
  query.sql.add('where i.numeroimpresion=a.numeroimpresion ');
  query.sql.add('and a.codigoempleado=ea.codigoempleado');
  query.sql.add('and i.numeroimpresion=:numeroimpresion ');
  query.sql.add('and((a.cobroindividual=''S'')or(a.responsablecobro=''S'')) ');
  query.ParamByName('numeroimpresion').AsString:=qDatosNUMEROIMPRESION.AsString;
  query.open;
  qDatosCodigoEmpleado.AsFloat:=query.fieldbyname('codigoempleado').AsFloat;
  query.sql.clear;
  query.sql.add('select v.codigoviatico codigo');
  query.sql.add('from odtimpresion i,odtviatico v,empleado ev');
  query.sql.add('where i.numeroimpresion=v.numeroimpresion');
  query.sql.add('and v.codigoempleado=ev.codigoempleado');
  query.sql.add('and i.numeroimpresion=:numeroimpresion');
  query.sql.add('union');
  query.sql.add('select a.codigoauxilio codigo ');
  query.sql.add('from odtauxilio a,empleado ea,odtimpresion i');
  query.sql.add('where i.numeroimpresion=a.numeroimpresion ');
  query.sql.add('and a.codigoempleado=ea.codigoempleado');
  query.sql.add('and i.numeroimpresion=:numeroimpresion');
  query.ParamByName('numeroimpresion').AsString:=qDatosNUMEROIMPRESION.AsString;
  query.open;
  cadena:='';
  while not query.eof do
  begin
    cadena:=cadena+query.fieldbyname('codigo').AsString+', ';
    query.next;
  end;
  cadena:=copy(cadena,1,length(cadena)-2);
  qDatoscodigos.AsString:=cadena;
end;

procedure TfHabilitarImpresionCobros.qDatosMOTIVOSSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  sender.AsString:=UpperCase(Text);
end;

procedure TfHabilitarImpresionCobros.dbgActividadOdtEditButtonClick(
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

procedure TfHabilitarImpresionCobros.qDatosBeforePost(DataSet: TDataSet);
var query,qactualiza:tquery;
begin
  inherited;
  if (qDatosCODIGOUSUARIOSOLICITA.AsString='') then
    raise Exception.Create('Debe ingresar El usuario que realizó la solicitud de rehabilitar la impresión.');
  if (qDatosMOTIVOS.AsString='') then
    raise Exception.Create('Debe ingresar el motivo de la solicitud de rehabilitar la impresión.');
  query:=TQuery.Create(self);
  query.DatabaseName:='BaseDato';
  query.sql.add('SELECT REABRIR FROM ODTPERMISOS');
  query.sql.add('WHERE NOMBRETABLA=''ODTIMPRESION''');
  query.sql.add('AND CODIGOADMINISTRATIVO='+qDatosCodigoAdministrativo.AsString);  
  query.sql.add('AND CODIGOUSUARIO='+qDatosCODIGOUSUARIOREALIZA.AsString);
  query.Open;
  if varcodigousuario>0 then
  begin
    if query.fieldbyname('REABRIR').AsString<>'S' then
      raise Exception.Create('Este usuario no tiene permisos para realizar la rehabilitación de impresiones para esta dependencia.');
    query.free;
  end;
  qactualiza:=TQuery.create(self);
  qactualiza.databasename:='BaseDato';
  if qDatosTipoCobro.AsString='AUXILIO' then
  begin
    qactualiza.sql.add('UPDATE ODTAUXILIO SET NUMEROIMPRESION='''',IMPRESO='''' WHERE NUMEROIMPRESION='+qDatosNUMEROIMPRESION.AsString);
  end
  else
  begin
    if qDatosTipoCobro.AsString='ANTICIPO' then
      qactualiza.sql.add('UPDATE ODTVIATICO SET NUMEROIMPRESION='''',IMPRESOANTICIPO='''' WHERE NUMEROIMPRESION='+qDatosNUMEROIMPRESION.AsString)
    else
      qactualiza.sql.add('UPDATE ODTVIATICO SET NUMEROIMPRESION='''',IMPRESOVIATICO='''' WHERE NUMEROIMPRESION='+qDatosNUMEROIMPRESION.AsString);
  end;
  qactualiza.ExecSQL; 
  qactualiza.free;
end;

procedure TfHabilitarImpresionCobros.qDatosAfterPost(DataSet: TDataSet);
begin
  inherited;
  EdMotivos.enabled:=false;
end;

procedure TfHabilitarImpresionCobros.qDatosBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  EdMotivos.enabled:=true;

end;

function TfHabilitarImpresionCobros.ValidarRegistroProcesadoPorNomina(
  numeroimpresion: string): boolean;
var query:tquery;
begin
  result:=true;
  query:=TQuery.create(self);
  query.DatabaseName:='BaseDato';
  query.sql.Add('select tipo from odtimpresion');
  query.sql.Add('where numeroimpresion='+numeroimpresion);
  query.open;
  if (query.fieldbyname('tipo').asstring='N') then
  begin
    query.sql.clear;
    query.sql.Add('select v.codigoviatico,v.codigoodt');
    query.sql.Add('from odtimpresion i,odtviatico v,odtcontabilidadmanoobra oc,sc_tmvco mc');
    query.sql.Add('WHERE mc.mvco_cias = oc.cias');
    query.sql.Add('AND mc.mvco_tpco = oc.tpco');
    query.sql.Add('AND mc.mvco_fecmov = oc.fecmov ');
    query.sql.Add('AND mc.mvco_nrocom = oc.nrocom');
    query.sql.Add('AND mc.mvco_tasa = oc.consecutivomovimiento');
    query.sql.Add('and i.numeroimpresion=v.numeroimpresion');
    query.sql.Add('and i.numeroimpresion='+numeroimpresion);
    query.sql.Add('and oc.tipo=''N''');
    query.sql.Add('and oc.codigoodt= v.codigoodt ');
    query.sql.Add('and oc.codigo= v.codigoviatico ');
    query.open;
    if (query.RecordCount>0)then
      result:=false;
  end
  else
  begin
    if (query.fieldbyname('tipo').asstring='V') then
    begin
      query.sql.clear;
      query.sql.Add('select v.codigoviatico,v.codigoodt');
      query.sql.Add('from odtimpresion i,odtviatico v,odtcontabilidadmanoobra oc,sc_tmvco mc');
      query.sql.Add('WHERE mc.mvco_cias = oc.cias');
      query.sql.Add('AND mc.mvco_tpco = oc.tpco');
      query.sql.Add('AND mc.mvco_fecmov = oc.fecmov ');
      query.sql.Add('AND mc.mvco_nrocom = oc.nrocom');
      query.sql.Add('AND mc.mvco_tasa = oc.consecutivomovimiento');
      query.sql.Add('and i.numeroimpresion=v.numeroimpresion');
      query.sql.Add('and i.numeroimpresion='+numeroimpresion);
      query.sql.Add('and oc.tipo=''V''');
      query.sql.Add('and oc.codigoodt= v.codigoodt ');
      query.sql.Add('and oc.codigo= v.codigoviatico ');
      query.open;
      if (query.RecordCount>0)then
        result:=false;
    end
    else
    begin
      query.sql.clear;
      query.sql.Add('select v.codigoauxilio,v.codigoodt');
      query.sql.Add('from odtimpresion i,odtauxilio v,odtcontabilidadmanoobra oc,sc_tmvco mc');
      query.sql.Add('WHERE mc.mvco_cias = oc.cias');
      query.sql.Add('AND mc.mvco_tpco = oc.tpco');
      query.sql.Add('AND mc.mvco_fecmov = oc.fecmov ');
      query.sql.Add('AND mc.mvco_nrocom = oc.nrocom');
      query.sql.Add('AND mc.mvco_tasa = oc.consecutivomovimiento');
      query.sql.Add('and i.numeroimpresion=v.numeroimpresion');
      query.sql.Add('and i.numeroimpresion='+numeroimpresion);
      query.sql.Add('and oc.tipo=''A''');
      query.sql.Add('and oc.codigoodt= v.codigoodt ');
      query.sql.Add('and oc.codigo= v.codigoauxilio ');
      query.open;
      if (query.RecordCount>0)then
        result:=false;
    end;
  end;
end;

end.
