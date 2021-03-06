unit uAuditoriaOdt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uMaestroSimple, DBTables, Db, StdCtrls, Buttons, DBCtrls, Grids, DBGrids,
  RXDBCtrl, ExtCtrls, ComCtrls, Mask;

type
  TfAuditoriaOdt = class(TfMaestroSimple)
    RxDBGrid1: TRxDBGrid;
    Panel4: TPanel;
    qCambios: TQuery;
    dsCambios: TDataSource;
    qDatosCODIGOODTAUDITORIA: TFloatField;
    qDatosCODIGOODT: TFloatField;
    qDatosFECHAABRE: TDateTimeField;
    qDatosCODIGOUSUARIOABRE: TFloatField;
    qDatosCODIGOUSUARIOSOLICITA: TFloatField;
    qDatosMOTIVOS: TStringField;
    qDatosFECHACIERRA: TDateTimeField;
    qDatosCODIGOUSUARIOCIERRA: TFloatField;
    qDatosEstadoodt: TStringField;
    qDatosUsuarioAbre: TStringField;
    qDatosUsuarioCierra: TStringField;
    qDatosUsuarioSolicita: TStringField;
    DBNavigator2: TDBNavigator;
    qDatosCodigoAdministrativo: TFloatField;
    qCambiosCODIGOODTAUDITORIACAMBIO: TFloatField;
    qCambiosCODIGOODTAUDITORIA: TFloatField;
    qCambiosTIPO: TStringField;
    qCambiosTABLA: TStringField;
    qCambiosVALORLLAVE: TFloatField;
    qCambiosCAMPOCAMBIO: TStringField;
    qCambiosCODIGOUSUARIO: TFloatField;
    qCambiosIDSESIONBD: TFloatField;
    qCambiosFECHA: TDateTimeField;
    qCambiosNombreUsuario: TStringField;
    qCambiosAccion: TStringField;
    Panel5: TPanel;
    Label4: TLabel;
    EdMotivos: TDBMemo;
    qCambiosVALORANTERIOR: TStringField;
    qCambiosVALORNUEVO: TStringField;
    procedure qDatosAfterInsert(DataSet: TDataSet);
    procedure qDatosBeforePost(DataSet: TDataSet);
    procedure qDatosMOTIVOSSetText(Sender: TField; const Text: String);
    procedure SBFiltrarClick(Sender: TObject);
    procedure qDatosCalcFields(DataSet: TDataSet);
    procedure RxDBGrid1EditButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qCambiosCalcFields(DataSet: TDataSet);
    procedure qDatosBeforeInsert(DataSet: TDataSet);
    procedure qDatosAfterPost(DataSet: TDataSet);
    procedure EdCodigoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAuditoriaOdt: TfAuditoriaOdt;

implementation

uses USeleccionarOdt, uComunesAdministrativo, ConsDll;

{$R *.DFM}

procedure TfAuditoriaOdt.qDatosAfterInsert(DataSet: TDataSet);
var query:tquery;
codigo:double;
begin
  inherited;
  query:=tquery.create(self);
  Query.DatabaseName:='BaseDato';
  query.SQL.Add('SELECT SQ_ODTAUDITORIA.NEXTVAL FROM DUAL');
  query.Open;
  codigo:=1;
  if (query.Fields[0].AsString<>'') then
    codigo:=query.Fields[0].asfloat;
  qDatosCODIGOODTAUDITORIA.AsFloat:=codigo;
  Query.free;
  codigo:=SeleccionarOdtTerminada;
  if codigo>0 then
    qDatosCODIGOODT.AsFloat:=codigo
  else
    raise Exception.Create('Debe seleccionar una ODT.');
  qDatosFECHAABRE.AsDateTime:= FechaServidor;
  RefrescarVariables;
  qDatosCodigoUsuarioAbre.AsInteger:=VarCodigoUsuario;
end;

procedure TfAuditoriaOdt.qDatosBeforePost(DataSet: TDataSet);
var qActualiza:tquery;
 query:tquery;
begin
  inherited;
  if (qDatosCODIGOODT.AsString='')then
    raise Exception.Create('El c?digo de ODT no puede estar vac?o');
  if (qDatosMOTIVOS.AsString='')then
    raise Exception.Create('Debe ingresar los motivos de la apertura de la ODT.');
  if (qDatosCODIGOUSUARIOSOLICITA.AsString='')then
    raise Exception.Create('Debe ingresar El usuario que solicita la apertura de la ODT.');
  if (qDatosCODIGOUSUARIOSOLICITA.AsString='') then
    raise Exception.Create('Debe ingresar El usuario que realiz? la solicitud de reabrir la ODT.');
  if varcodigousuario>0 then
  begin
    query:=TQuery.Create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT REABRIR FROM ODTPERMISOS');
    query.sql.add('WHERE NOMBRETABLA=''ODT''');
    query.sql.add('AND CODIGOUSUARIO='+qDatosCODIGOUSUARIOABRE.AsString);
    query.sql.add('AND CODIGOADMINISTRATIVO='+qDatosCodigoAdministrativo.AsString);
    query.Open;
    if query.fieldbyname('REABRIR').AsString<>'S' then
      raise Exception.Create('Este usuario no tiene permisos para reabrir ODTs para esta dependencia.');
    query.free;
  end;
  if qDatos.State=dsInsert then
  begin
    qActualiza:=TQuery.Create(self);
    qActualiza.DatabaseName:='BaseDato';
    qActualiza.sql.Add('UPDATE ODT SET CODIGOESTADOODT=2 WHERE CODIGOODT='+qDatosCODIGOODT.AsString);
    qActualiza.ExecSQL;
    qActualiza.free;
  end;

end;

procedure TfAuditoriaOdt.qDatosMOTIVOSSetText(Sender: TField;
  const Text: String);
begin
  inherited;
  sender.AsString:=UpperCase(Text);
end;

procedure TfAuditoriaOdt.SBFiltrarClick(Sender: TObject);
var  i:integer;
begin
  qDatos.close;
  for i :=0  to qDatos.sql.count-4 do
  begin
    qDatos.SQL.Delete(3);
  end;
  i:=2;
  if EdCodigo.Text <> '' then
  begin
   qDatos.SQL.Insert(i,'AND A.CODIGOODT LIKE ''%'+EdCodigo.Text+'%''');
   inc(i);
  end;
  if EdCodigo2.Text <> '' then
  begin
     qDatos.SQL.Insert(i,'AND O.CODIGOADMINISTRATIVO ='+EdCodigo2.Text);
     inc(i);
  end;
  if EdNombre.Text <> '' then
  begin
    qDatos.SQL.Insert(i,'AND A.MOTIVOS LIKE ''%'+EdNombre.Text+'%''');
  end;
  qDatos.Open;
end;

procedure TfAuditoriaOdt.qDatosCalcFields(DataSet: TDataSet);
var query:tquery;
begin
  inherited;
  query:=TQuery.Create(self);
  query.DatabaseName:='BaseDato';
  if qDatosCODIGOODT.AsString<>'' then
  begin
    query.sql.add('select e.nombreestadoodt,o.codigoadministrativo from estadoodt e,odt o');
    query.sql.add('where o.codigoestadoodt=e.codigoestadoodt and o.codigoodt='+qDatosCODIGOODT.AsString);
    query.open;
    qDatosEstadoOdt.AsString:=query.Fieldbyname('nombreestadoodt').AsString;
    qDatosCodigoAdministrativo.AsFloat:=query.Fieldbyname('codigoadministrativo').Asfloat;
  end;
  if qDatosCODIGOUSUARIOABRE.AsString<>'' then
  begin
    query.sql.clear;
    query.sql.add('select u.nombreusuario from usuario u');
    query.sql.add('where u.codigousuario='+qDatosCODIGOUSUARIOABRE.AsString);
    query.open;
    qDatosUsuarioAbre.AsString:=query.Fields[0].AsString;
  end;
  if qDatosCodigoUsuarioSolicita.AsString<>'' then
  begin
    query.sql.clear;
    query.sql.add('select u.nombreusuario from usuario u');
    query.sql.add('where u.codigousuario='+qDatosCodigoUsuarioSolicita.AsString);
    query.open;
    qDatosUsuarioSolicita.AsString:=query.Fields[0].AsString;
  end;
  if qDatosCodigoUsuarioCierra.AsString<>'' then
  begin
    query.sql.clear;
    query.sql.add('select u.nombreusuario from usuario u');
    query.sql.add('where u.codigousuario='+qDatosCodigoUsuarioCierra.AsString);
    query.open;
    qDatosUsuarioCierra.AsString:=query.Fields[0].AsString;
  end;
  query.free;
end;

procedure TfAuditoriaOdt.RxDBGrid1EditButtonClick(Sender: TObject);
var codigo:double;
begin
  inherited;
  if (qDatos.State =dsInsert) then
  begin
      codigo:=SeleccionarUsuario;
    if codigo>0 then
      qDatosCODIGOUSUARIOSOLICITA.AsFloat:=codigo
    else
      raise Exception.Create('Debe seleccionar el usuario que solicita realizar Reabrir la ODT.');
    qDatosCalcFields(qdatos);
  end
  else
    raise exception.create('El registro no es editable');
end;

procedure TfAuditoriaOdt.FormCreate(Sender: TObject);
begin
  inherited;
  qDatos.open;
  qCambios.open;
end;

procedure TfAuditoriaOdt.qCambiosCalcFields(DataSet: TDataSet);
var query:tquery;
begin
  query:=TQuery.Create(self);
  query.DatabaseName:='BaseDato';
  if qCambiosCODIGOUSUARIO.AsString<>'' then
  begin
    query.sql.clear;
    query.sql.add('select u.nombreusuario from usuario u');
    query.sql.add('where u.codigousuario='+qCambiosCODIGOUSUARIO.AsString);
    query.open;
    qCambiosNombreUsuario.AsString:=query.Fields[0].AsString;
  end;
  case qCambiosTIPO.AsString[1]  of
    'A':qCambiosAccion.AsString:='Actualizaci?n' ;
    'I':qCambiosAccion.AsString:='Inserci?n' ;
    'E':qCambiosAccion.AsString:='Eliminaci?n' ;
  end;
  query.free;
end;

procedure TfAuditoriaOdt.qDatosBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  EdMotivos.Enabled:=true;
end;

procedure TfAuditoriaOdt.qDatosAfterPost(DataSet: TDataSet);
begin
  inherited;
  EdMotivos.Enabled:=false;
end;

procedure TfAuditoriaOdt.EdCodigoKeyPress(Sender: TObject; var Key: Char);
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
      then raise exception.create('Este campo debe ser num?rico');
      Application.ProcessMessages;
  end;
end;

end.
