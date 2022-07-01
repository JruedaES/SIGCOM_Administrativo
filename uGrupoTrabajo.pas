unit uGrupoTrabajo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Menus, utMenuArbol, Db, Mask, DBCtrls,
  DBTables;

type
  TfGrupoTrabajo = class(TForm)
    qGrupoTrabajo: TQuery;
    qGrupoTrabajoCODIGOADMINISTRATIVO: TFloatField;
    qGrupoTrabajoCODIGOGRUPOTRABAJO: TFloatField;
    dsGrupoTrabajo: TDataSource;
    dMenuArbol1: TdMenuArbol;
    qCIA: TQuery;
    qHorario: TQuery;
    qGrupoTrabajoNOMBREHORARIOTRABAJO: TStringField;
    UpdSQLGrupoTrabajo: TUpdateSQL;
    qGrupoTrabajoNOMBREGRUPOTRABAJO: TStringField;
    Panel2: TPanel;
    Label1: TLabel;
    lNombreCIA: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    dbeCIA: TDBEdit;
    dbeCodigoGrupo: TDBEdit;
    dbeNombreGrupo: TDBEdit;
    dblcbHorario: TDBLookupComboBox;
    Panel1: TPanel;
    Panel3: TPanel;
    bbCancelar: TBitBtn;
    bbAceptar: TBitBtn;
    qGrupoTrabajoCODIGOTIPOTURNO: TFloatField;
    qGrupoTrabajoCODIGOCONTRATISTA: TStringField;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    qGrupoTrabajoCODIGOVEHICULO: TStringField;
    SpeedButton2: TSpeedButton;
    DBCheckBox1: TDBCheckBox;
    qGrupoTrabajoACTIVO: TStringField;
    qCoordinadorCuadrilla: TQuery;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    dsCoordinadorCuadrilla: TDataSource;
    qCoordinadorCuadrillaCODIGOCOORDINACIONGRUPOTRABAJO: TFloatField;
    qCoordinadorCuadrillaNOMBRECOORDINACIONGRUPOTRABAJO: TStringField;
    qGrupoTrabajoCODIGOCOORDINACIONGRUPOTRABAJO: TFloatField;
    qSedeOperativa: TQuery;
    dsSedeOperativa: TDataSource;
    qSedeOperativaCODIGOSEDEOPERATIVA: TFloatField;
    qSedeOperativaNOMBRESEDEOPERATIVA: TStringField;
    qSedeOperativaACTIVO: TStringField;
    lSedeOperativa: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    qGrupoTrabajoCODIGOSEDEOPERATIVA: TFloatField;
    GroupBox1: TGroupBox;
    DBEdit2: TDBEdit;
    Label7: TLabel;
    DBEdit3: TDBEdit;
    Label8: TLabel;
    qGrupoTrabajoLOGIN: TStringField;
    qGrupoTrabajoPASSWORD: TStringField;
    Label9: TLabel;
    Label10: TLabel;
    procedure qGrupoTrabajoCODIGOADMINISTRATIVOValidate(Sender: TField);
    procedure dMenuArbol1SelectID(Sender: tnMenuItem; ID: Integer;
      MenuEstructura: tMenuEs);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbAceptarClick(Sender: TObject);
    procedure bbCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qGrupoTrabajoAfterPost(DataSet: TDataSet);
    procedure qGrupoTrabajoCODIGOADMINISTRATIVOChange(Sender: TField);
    procedure qGrupoTrabajoCODIGOVEHICULOValidate(Sender: TField);
    procedure qGrupoTrabajoCODIGOGRUPOTRABAJOValidate(Sender: TField);
    procedure SpeedButton2Click(Sender: TObject);
    procedure qGrupoTrabajoLOGINValidate(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    MensajeError:string;
    bDatosIncompletos, bCancelando: Boolean;
  end;

var
  fGrupoTrabajo: TfGrupoTrabajo;

implementation

uses uFuncionSGD;
              
{$R *.DFM}

procedure TfGrupoTrabajo.qGrupoTrabajoCODIGOADMINISTRATIVOValidate(
  Sender: TField);
begin
  if Sender.Text <> '' then
  begin
    qCIA.Close;
    qCIA.Params[0].AsString:=Sender.Text;
    qCIA.Open;
    if qCIA.RecordCount > 0 then
      lNombreCIA.Caption:=qCIA.Fields[0].AsString
    else
      raise Exception.Create('Este Código Administrativo No Existe.')
  end;
end;

procedure TfGrupoTrabajo.dMenuArbol1SelectID(Sender: tnMenuItem;
  ID: Integer; MenuEstructura: tMenuEs);
begin
  dsGrupoTrabajo.DataSet.FieldByName('CODIGOADMINISTRATIVO').AsInteger:=ID;
//  lNombreCIA.Caption:=Copy(Sender.Caption,1,Pos(':',Sender.Caption)-1);
end;

procedure TfGrupoTrabajo.FormKeyPress(Sender: TObject; var Key: Char);
begin
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

procedure TfGrupoTrabajo.FormActivate(Sender: TObject);
begin
if qGrupoTrabajoCODIGOADMINISTRATIVO.AsString <> '' then
     qGrupoTrabajoCODIGOADMINISTRATIVOValidate(qGrupoTrabajoCODIGOADMINISTRATIVO);
end;

procedure TfGrupoTrabajo.FormCreate(Sender: TObject);
begin
   bCancelando := false;
  Mensajeerror:='';   
end;

procedure TfGrupoTrabajo.bbAceptarClick(Sender: TObject);
begin
bDatosIncompletos := False;
  try
     qGrupoTrabajo.Post;
     if qGrupoTrabajo.UpdatesPending then
        qGrupoTrabajo.ApplyUpdates;
     Close;
     ModalResult:=MrOk;
  except
    on e:exception do
    begin
      Mensajeerror:=e.message;
      bDatosIncompletos := True;
      qGrupoTrabajo.Edit;
      ModalResult:=MrCancel;
      Close;
    end;
  end;
end;

procedure TfGrupoTrabajo.bbCancelarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Perderá los cambios realizados.Esta seguro de Cancelar?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
     begin
      try
         qGrupoTrabajo.Cancel;
         if qGrupoTrabajo.UpdatesPending then
          qGrupoTrabajo.CancelUpdates;
       finally
         bDatosIncompletos := true;
         bCancelando := true;
         Close;
       end;
     end
  else
     begin
        ModalResult := 0;
        bDatosIncompletos := false;
        dbeCIA.SetFocus;
     end;

end;

procedure TfGrupoTrabajo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if not bCancelando then
    begin
      if bDatosIncompletos then
       begin
         if Mensajeerror<>'' then ShowMessage(Mensajeerror);
         if Application.MessageBox(PChar('Hay datos incompletos.Desea completar los datos?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
            begin
              ModalResult := 0;
              bDatosIncompletos := false;
              dbeCIA.SetFocus;
              Action:=caNone;
            end
         else
            begin
              qGrupoTrabajo.Cancel;
              qGrupoTrabajo.CancelUpdates;
              Action:=caFree;
            end;
       end
     else
       if ModalResult <> MrCancel then
       begin
          ModalResult := mrOK;
          Action:=caFree;
       end;
     end;
   if ModalResult=2 then
   begin
     try
      qGrupoTrabajo.Cancel;
      qGrupoTrabajo.CancelUpdates;
      Action:=caFree;
     except
     end;
   end;
end;

procedure TfGrupoTrabajo.qGrupoTrabajoAfterPost(DataSet: TDataSet);
begin
   qGrupoTrabajo.ApplyUpdates;
   qGrupoTrabajo.CommitUpdates;
end;

procedure TfGrupoTrabajo.qGrupoTrabajoCODIGOADMINISTRATIVOChange(
  Sender: TField);
var query:tquery;
  cod:integer;
  i:integer;
begin
  if (Sender.AsString<>'') then
  begin
    qCIA.close;
    qCIA.ParamByName('CODIGOADMINISTRATIVO').AsString:=Sender.AsString;
    qCIA.sql.insert(3,'AND ESTADO=''A''');
    qCIA.open;
    i:=qCIA.recordcount;
    qCIA.sql.delete(3);
    if (i=0) then
      raise Exception.Create('Este Código Administrativo pertenece a un Área Inactiva.');

    query:=TQuery.Create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT MAX(CODIGOGRUPOTRABAJO) FROM GRUPOTRABAJO');
    query.sql.add('WHERE (CODIGOADMINISTRATIVO ='+Sender.AsString+')');
    query.open;
    cod:=query.Fields[0].AsInteger;
    inc(cod);
    qGrupoTrabajoCODIGOGRUPOTRABAJO.AsInteger:=cod;
    query.close;
    query.free;
  end;
end;

procedure TfGrupoTrabajo.qGrupoTrabajoCODIGOVEHICULOValidate(
  Sender: TField);
var query:tquery;
  cod:integer;
begin
  if (Sender.AsString<>'')then
  begin
    query:=TQuery.Create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT COUNT(*) FROM VEHICULO');
    query.sql.add('WHERE (CODIGOVEHICULO ='''+Sender.AsString+''')');
    query.open;
    cod:=query.Fields[0].AsInteger;
    query.close;
    query.free;
    if cod=0 then raise
      Exception.Create('Esta placa de vehículo no existe en el maestro de vehículos, por favor verifique.');
  end;
end;

procedure TfGrupoTrabajo.qGrupoTrabajoCODIGOGRUPOTRABAJOValidate(
  Sender: TField);
var query:tquery;
cod:integer;
begin
  if (Sender.AsString<>'')and (qGrupoTrabajoCODIGOADMINISTRATIVO.AsString<>'') then
  begin
    query:=TQuery.Create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT COUNT(*) FROM GRUPOTRABAJO');
    query.sql.add('WHERE (CODIGOADMINISTRATIVO ='+qGrupoTrabajoCODIGOADMINISTRATIVO.AsString+')');
    query.sql.add('AND (CODIGOGRUPOTRABAJO ='+Sender.AsString+')');
    query.open;
    cod:=query.Fields[0].AsInteger;
    query.close;
    query.free;
    if cod>0 then raise
      Exception.Create('Este código de grupo de trabajo ya existe para la dependencia, debe ingresar otro código.');
  end;
end;

procedure TfGrupoTrabajo.SpeedButton2Click(Sender: TObject);
var CIA:INTEGER;
begin
  CIA := CapturarCIA(true);
  if CIA<>0 then qGrupoTrabajoCODIGOADMINISTRATIVO.AsInteger:=CIA;
end;

procedure TfGrupoTrabajo.qGrupoTrabajoLOGINValidate(Sender: TField);
var
Query : Tquery;
 begin
  try
  Query := TQuery.Create(Self);
  Query.DatabaseName := 'BaseDato';

  Query.SQL.Add('SELECT * FROM GRUPOTRABAJO WHERE LOGIN='''+TRIM(UpperCase(qGrupoTrabajoLOGIN.AsString))+'''  ');
  Query.Open;
  if Query.IsEmpty then
  else
    raise exception.Create('El login de Usuario ya Existe, Intente con otro.');

  except
  on e : exception do
   begin
 ShowMessage(e.message);
   end;

end;
Query.Free;
end;

end.
