unit uCarta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, StdCtrls, Buttons, ExtCtrls, Db, Mask, DBCtrls, DBTables,
  ToolEdit, RXDBCtrl, Grids, DBGrids, Menus, utMenuArbol,interexcel;

type
  TFCarta = class(TFBase)
    PBotones: TPanel;
    BBAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    PPrincipal: TPanel;
    dsCarta: TDataSource;
    qEstadoCarta: TQuery;
    Panel1: TPanel;
    dstCartaEmpleado: TDataSource;
    DBNavigator1: TDBNavigator;
    DBGrid1: TDBGrid;
    Label15: TLabel;
    qEmpleadoCarta: TQuery;
    qCodigoCartaEmpleado: TQuery;
    qEstadoCartaCODIGOESTADOCARTA: TFloatField;
    qEstadoCartaNOMBREESTADOCARTA: TStringField;
    qEmpleadoRecibe: TQuery;
    dsEmpleadoRecibe: TDataSource;
    dsEstadoCarta: TDataSource;
    GroupBox1: TGroupBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Label20: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label16: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label18: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label13: TLabel;
    dbEdReporte: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label21: TLabel;
    Label8: TLabel;
    Label14: TLabel;
    DBDateEdit3: TDBDateEdit;
    DBDateEdit4: TDBDateEdit;
    sbAsignarReporte: TSpeedButton;
    Label22: TLabel;
    qTipoRecepcionCarta: TQuery;
    qTipoEnvioCarta: TQuery;
    dsTipoRecepcionCarta: TDataSource;
    dsTipoEnvioCarta: TDataSource;
    Label17: TLabel;
    DBMemo1: TDBMemo;
    Label19: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    qEstadoReporte: TQuery;
    dsEstadoReporte: TDataSource;
    qEstadoReporteNOMBREESTADOREPORTE: TStringField;
    dsCia: TDataSource;
    dsEmpleadoCIA: TDataSource;
    qEmpleadoCIA: TQuery;
    qCia: TQuery;
    qCiaCODIGOADMINISTRATIVO: TFloatField;
    qCiaNOMBRECATEGORIA: TStringField;
    gbEmpleado: TGroupBox;
    Label23: TLabel;
    Label24: TLabel;
    dblcNombreCIA: TDBLookupComboBox;
    dblcNombreEmpleado: TDBLookupComboBox;
    dbeCia: TDBEdit;
    dbeCodigoEmpleado: TDBEdit;
    qCiaCarta: TQuery;
    qCiaCartaCODIGOADMINISTRATIVO: TFloatField;
    qCiaCartaNOMBRECATEGORIA: TStringField;
    dMenuCIA: TdMenuArbol;
    qCarta: TQuery;
    qCartaCODIGOCARTA: TFloatField;
    qCartaNUMERORADICACIONRECEPCION: TFloatField;
    qCartaNUMERORADICACIONRESPUESTA: TFloatField;
    qCartaCODIGOARCHIVO: TFloatField;
    qCartaNUMEROANEXOS: TFloatField;
    qCartaCODIGOREPORTE: TFloatField;
    qCartaFECHARADICACION: TDateTimeField;
    qCartaFECHARECEPCION: TDateTimeField;
    qCartaFECHAATENCION: TDateTimeField;
    qCartaFECHALIMITEATENCION: TDateTimeField;
    qCartaCODIGOEMPLEADORECIBE: TFloatField;
    qCartaDIRIGIDOCARTASOLICITUD: TStringField;
    qCartaASUNTO: TMemoField;
    qCartaDIRIGIDOCARTARESPUESTA: TStringField;
    qCartaFIRMANTE: TStringField;
    qCartaEMPRESA: TStringField;
    qCartaCODIGOESTADOCARTA: TFloatField;
    qCartaCODIGOTIPORECEPCIONCARTA: TFloatField;
    qCartaCODIGOTIPOENVIOCARTA: TFloatField;
    qCartaPLAZOATENCION: TFloatField;
    updCarta: TUpdateSQL;
    sbEmpleado: TSpeedButton;
    Label25: TLabel;
    DBEdit8: TDBEdit;
    qCartaCODIGOARCHIVORESPUESTA: TFloatField;
    qCartaCAMPOCONTROL: TFloatField;
    Bgenerarcarta: TBitBtn;
    Qhora: TQuery;
    QhoraFECHA: TDateTimeField;
    qCartaEmpleado: TQuery;
    updCartaEmpleado: TUpdateSQL;
    qCartaEmpleadoCODIGOCARTAEMPLEADO: TFloatField;
    qCartaEmpleadoCODIGOCARTA: TFloatField;
    qCartaEmpleadoCODIGOEMPLEADO: TFloatField;
    qCartaEmpleadoFECHAENVIO: TDateTimeField;
    qCartaEmpleadoOBSERVACION: TStringField;
    qCartaEmpleadoCODIGOADMINISTRATIVO: TFloatField;
    qCartaEmpleadoCAMPOCONTROL: TFloatField;
    qCartaEmpleadoempleado: TStringField;
    qCartaEmpleadoDEPENDENCIA: TStringField;
    procedure BBAceptarClick(Sender: TObject);
    procedure bbCancelarClick(Sender: TObject);
    procedure sbAsignarReporteClick(Sender: TObject);
    procedure qCiaCODIGOADMINISTRATIVOChange(Sender: TField);
    procedure dMenuCIASelectID(Sender: tnMenuItem; ID: Integer;
      MenuEstructura: tMenuEs);
    procedure qCartaAfterInsert(DataSet: TDataSet);
    procedure qCartaFECHARECEPCIONChange(Sender: TField);
    procedure qCartaEmpleadoCODIGOADMINISTRATIVOChange(Sender: TField);
    procedure qCartaEmpleadoAfterCancel(DataSet: TDataSet);
    procedure qCartaEmpleadoAfterInsert(DataSet: TDataSet);
    procedure qCartaEmpleadoAfterPost(DataSet: TDataSet);
    procedure qCartaEmpleadoBeforeEdit(DataSet: TDataSet);
    procedure qCartaEmpleadoBeforeInsert(DataSet: TDataSet);
    procedure sbEmpleadoClick(Sender: TObject);
    procedure qCartaAfterPost(DataSet: TDataSet);
    procedure qEmpleadoCartaAfterPost(DataSet: TDataSet);
    procedure qCartaEmpleadoAfterDelete(DataSet: TDataSet);
    procedure qCartaAfterDelete(DataSet: TDataSet);
    procedure InserCartaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BgenerarcartaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qCartaCODIGOREPORTEValidate(Sender: TField);
    procedure DBEdit11KeyPress(Sender: TObject; var Key: Char);
    procedure qCartaEmpleadoBeforePost(DataSet: TDataSet);
    procedure DBGrid1EditButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
   ex:eduexcel;
    Fecha: string;
    sFecha: TDateTime;
    function DesplazarDiasHabiles(Fecha:TDateTime;Dias:Integer):TDateTime;
     function GetFecha(Tipo:Boolean): String;
  end;

var
  FCarta: TFCarta;

implementation

uses uListaReportesODT, uBuscarEmpleado, uFiltroEmpleado, uFormaFecha;

{$R *.DFM}

procedure TFCarta.BBAceptarClick(Sender: TObject);
begin
  inherited;
   qCarta.Post;
end;

procedure TFCarta.bbCancelarClick(Sender: TObject);
begin
  inherited;

  qCarta.Cancel;
end;

function TFCarta.DesplazarDiasHabiles(Fecha: TDateTime;
  Dias: Integer): TDateTime;
var Query:TQuery;
    Cont:Integer;
    Encontrado:Boolean;
begin
  Query:=TQuery.Create(self);
  Query.DatabaseName:='BaseDato';
  Query.SQL.Add('SELECT * FROM DIASAGNO WHERE TIPO=''F'' AND DIA>:FECHA');
  Query.SQL.Add('AND DIA<:FECHA2');
  Query.ParamByName('FECHA').AsDateTime:=Fecha;
  Query.ParamByName('FECHA2').AsDateTime:=Fecha+30;
  Query.Open;
  Cont:=0;
  while Cont<Dias do
  begin
    Fecha:=Fecha+1;
    Encontrado:=false;
    if (DayOfWeek(Fecha) <>1) and (DayOfWeek(Fecha) <>7) then
    begin
      Query.First;
      while not Query.Eof do
      begin
        if (Query.FieldbyName('DIA').AsDateTime=Fecha)  then
          Encontrado:=True;
        Query.Next;
      end;
      if not Encontrado then inc(Cont);
    end;
  end;
  Result:=Fecha;
  Query.Free;
end;
procedure TFCarta.sbAsignarReporteClick(Sender: TObject);
begin
  try
   fListaReportesODT:=TfListaReportesODT.Create(Application);
   fListaReportesODT.qListaReporte.Close;
   fListaReportesODT.qListaReporte.SQL.Delete(15);
   fListaReportesODT.qListaReporte.Open;
   fListaReportesODT.bbAceptar.Visible:=True;
   fListaReportesODT.bbCancelar.Visible:=True;
   if fListaReportesODT.ShowModal=mrOK then
   begin
     if fListaReportesODT.DBGrid1.SelectedRows.Count > 0 then
       qCartaCODIGOREPORTE.AsString:=fListaReportesODT.qListaReporteCODIGOREPORTE.AsString;
   end;
  finally
    fListaReportesODT.Free;
  end;

end;

procedure TFCarta.qCiaCODIGOADMINISTRATIVOChange(Sender: TField);
begin
  inherited;
  dbeCodigoEmpleado.Text:='';
end;

procedure TFCarta.dMenuCIASelectID(Sender: tnMenuItem; ID: Integer;
  MenuEstructura: tMenuEs);
begin
  inherited;
  qCartaEmpleado.FieldByName('CODIGOADMINISTRATIVO').AsInteger:=ID;
end;

procedure TFCarta.qCartaAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qCartaPLAZOATENCION.AsString:='15';
end;

procedure TFCarta.qCartaFECHARECEPCIONChange(Sender: TField);
begin
  inherited;
  try
    if (qCartaPLAZOATENCION.AsString<>'') and (qCartaFECHARECEPCION.AsString<>'') then
    begin
      if not (qCarta.State in [dsEdit,dsInsert]) then
        qCarta.Edit;
      qCartaFECHALIMITEATENCION.AsDateTime:=DesplazarDiasHabiles(qCartaFECHARECEPCION.AsDateTime,qCartaPLAZOATENCION.AsInteger);
    end;
  except
  end;
end;

procedure TFCarta.qCartaEmpleadoCODIGOADMINISTRATIVOChange(
  Sender: TField);
begin
  inherited;
  dbeCodigoEmpleado.Text:='';
end;

procedure TFCarta.qCartaEmpleadoAfterCancel(DataSet: TDataSet);
begin
  inherited;
  gbEmpleado.Visible:=false;
end;

procedure TFCarta.qCartaEmpleadoAfterInsert(DataSet: TDataSet);
var Codigo:Integer;
begin
  inherited;
  qCodigoCartaEmpleado.Close;
  qCodigoCartaEmpleado.Open;
  Codigo:=1;
  if qCodigoCartaEmpleado.FieldByName('CODIGO').AsString<>'' then
    Codigo:=qCodigoCartaEmpleado.FieldByName('CODIGO').AsInteger+1;
  DataSet.FieldByName('CODIGOCARTA').AsInteger:=qCartaCODIGOCARTA.AsInteger;
  DataSet.FieldByName('CODIGOCARTAEMPLEADO').AsInteger:=Codigo;
  DataSet.FieldByName('CODIGOADMINISTRATIVO').AsInteger:=69;
  dbeCodigoEmpleado.Text:='';
end;

procedure TFCarta.qCartaEmpleadoAfterPost(DataSet: TDataSet);
begin
  qCartaEmpleado.ApplyUpdates;
  qCartaEmpleado.CommitUpdates;
  gbEmpleado.Visible:=false;
end;

procedure TFCarta.qCartaEmpleadoBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  gbEmpleado.Visible:=true;
end;

procedure TFCarta.qCartaEmpleadoBeforeInsert(DataSet: TDataSet);
begin
  inherited;
  gbEmpleado.Visible:=true;
end;

procedure TFCarta.sbEmpleadoClick(Sender: TObject);
begin
 fBuscarEmpleado:=TfBuscarEmpleado.Create(Application);
 try
    FFiltroEmpleado.tdFiltroEmpleado.Edit;
    FFiltroEmpleado.tdFiltroEmpleadoCODIGOADMINISTRATIVO.AsString:='69';
    FFiltroEmpleado.BitBtnFiltrarClick(nil);
    if fBuscarEmpleado.ShowModal=MrOK then
    begin
      qCartaDIRIGIDOCARTASOLICITUD.AsString:=fBuscarEmpleado.qListaEmpleado.FieldByName('NOMBREEMPLEADO').AsString;
    end;
 finally
   fBuscarEmpleado.Free;
   fBuscarEmpleado:=nil;
 end;
end;

procedure TFCarta.qCartaAfterPost(DataSet: TDataSet);
begin
  inherited;
  qCarta.ApplyUpdates;
  qCarta.CommitUpdates;
end;

procedure TFCarta.qEmpleadoCartaAfterPost(DataSet: TDataSet);
begin
  inherited;
  qCartaEmpleado.ApplyUpdates;
  qCartaEmpleado.CommitUpdates;
end;

procedure TFCarta.qCartaEmpleadoAfterDelete(DataSet: TDataSet);
begin
  qCartaEmpleado.ApplyUpdates;
  qCartaEmpleado.CommitUpdates;
end;

procedure TFCarta.qCartaAfterDelete(DataSet: TDataSet);
begin
  qCarta.ApplyUpdates;
  qCarta.CommitUpdates;
end;

procedure TFCarta.InserCartaClick(Sender: TObject);
 var qDatos:TQuery;

begin
  inherited;
{  try
   qDatos:=TQuery.Create(Application);
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Text:='SELECT CODIGOCONTROLCARTA.nextval as  Codigo FROM dual';
    qDatos.Open;
    qCARTA.FieldByName('CAMPOCONTROL').Value:=  qDatos.Fields[0].AsInteger;

    qCARTA.Post;
          qCartaEmpleado.Open;
    qCartaEmpleado.Close;
    qCartaEmpleado.ParamByName('CODIGOCARTA').AsInteger:=-1;
    qCartaEmpleado.Open;
    qCartaEmpleado.Append;
    qCartaEmpleado.FieldByName('CAMPOCONTROL').AsInteger:=qDatos.Fields[0].AsInteger;

    DBEdit1.Visible :=true;
    BBAceptar.Visible:= true;
    Bgenerarcarta.Visible:= true;
     qCARTA.Close;
     qcarta.SQL.Delete(1);
     qcarta.sql.add('  WHERE CAMPOCONTROL = '+qDatos.Fields[0].Asstring);
     qCARTA.Open;
     qDatos.Free;
     qCARTA.Edit;
     InserCarta.Visible:=false;
     DBNavigator1.Visible:= true;
    except
    on e:exception do
      begin
      application.MessageBox(pchar(e.message),'Error',mb_iconerror);
      end;
  end;         }


{   if not qCARTA.Database.InTransaction then
       qCARTA.Database.StartTransaction;

        qDatos:=TQuery.Create(Application);
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Text:='SELECT CODIGOCONTROLCARTA.nextval as  Codigo FROM dual';
    qDatos.Open;

      qCARTA.Close;
    qCARTA.ParamByName('CODIGOCARTA').AsInteger:=-1;
    qCARTA.Open;
    qCARTA.Append;
    qCARTA.FieldByName('CODIGOCARTA').AsInteger:=qDatos.Fields[0].AsInteger+1;
    qDatos
    qCARTA.Post;
    qCARTA.Database.Commit;
    BBAceptar.Visible:= true;
    DBEdit1.Visible:= true;
    qDatos.Free;
    qCARTA.Edit;    }

end;

procedure TFCarta.FormCreate(Sender: TObject);
begin
  inherited;

 if qCartaEmpleado.Active then
   qCartaEmpleado.close;
  qCartaEmpleado.Open;
   if qEstadoCarta.Active then
   qEstadoCarta.close;
  qEstadoCarta.Open;
   if qEmpleadoCarta.Active then
   qEmpleadoCarta.close;
  qEmpleadoCarta.Open;
 {  if not qCARTA.Active then
   begin
    qCARTA.ParamByName('CODIGOCARTA').AsInteger:=-1;
    qCARTA.Open;
    qCARTA.Append;
    qCARTA.FieldByName('CODIGOCARTA').AsInteger:=-1;  }
end;

procedure TFCarta.BgenerarcartaClick(Sender: TObject);
begin
  inherited;
  QHORA.open;
  ex:= eduexcel.Create;
  ex.AsignarPlantilla('C:\EnerGIS4\carta.xls'  );
  ex.HojaActiva('carta');
  ex.Visible(true);
  Ex.Asignar(5,3,qhora.FieldByName('fecha').AsString);
  ex.Asignar(7,3,qcarta.fieldbyname('FIRMANTE').AsString);
 // end;

  ex.Terminar;
  ex.Free;
end;

procedure TFCarta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
 Action:=caFree;
end;

procedure TFCarta.qCartaCODIGOREPORTEValidate(Sender: TField);
var query:tquery;
begin
  if (Sender.Asstring<>'') then
  begin
    query:=TQuery.create(self);
    query.DatabaseName:='BaseDato';
    query.sql.add('SELECT COUNT(*) FROM REPORTE WHERE CODIGOREPORTE='+Sender.AsString);
    query.open;
    if (query.fields[0].AsInteger=0) then
      raise exception.create('Este código de reporte no existe.');
    query.free;
  end;
  qEstadoReporte.close;
  qEstadoReporte.open;
end;

procedure TFCarta.DBEdit11KeyPress(Sender: TObject; var Key: Char);
begin
  if (key in ['0','1','2','3','4','5','6','7','8','9'])  then
    raise Exception.create('No se admiten caracteres numéricos.');
end;

procedure TFCarta.qCartaEmpleadoBeforePost(DataSet: TDataSet);
begin
  inherited;
  if qCartaEmpleadoFECHAENVIO.AsString='' then
    raise Exception.create('Debe ingresar la fecha de envío');
  if qCartaEmpleadoOBSERVACION.AsString='' then
    raise Exception.create('Debe ingresar la observación');
end;

procedure TFCarta.DBGrid1EditButtonClick(Sender: TObject);
begin
  inherited;
  sFecha := qCartaEmpleadoFECHAENVIO.AsDateTime;
  Fecha := GetFecha(false);
  if Fecha <> '' then qCartaEmpleadoFECHAENVIO.AsString := Fecha;
end;

function TFCarta.GetFecha(Tipo: Boolean): String;
function FechaSinSegundos: string;
var Hour, Min, Sec, MSec: Word;
begin
   if sFecha = 0 then
   begin
     DecodeTime(Now, Hour, Min, Sec, MSec);
     Min := 0;
     Sec := 0;
     Result := DateTimeToStr(Int(Now) + EncodeTime(Hour, Min, Sec, MSec));
   end
   else
   begin
     Result := DateTimeToStr(sFecha);
   end;
end;

begin
  fFormaFecha := TfFormaFecha.Create(Application);
  uFormaFecha.sFecha := FechaSinSegundos;
  FFormaFecha.seSegundos.Value := 0;
  FFormaFecha.seSegundos.Enabled := False;
  FFormaFecha.seMinutos.Value := 0;
  FFormaFecha.seMinutos.Enabled := False;
  fFormaFecha.height:=291;
  if FFormaFecha.ShowModal = mrOk then
    if Tipo then
       Result := DateTimetoStr(FFormaFecha.Date+FFormaFecha.fTime)
    else
       Result := DateTimetoStr(FFormaFecha.Date)
  else Result := DateTimeToStr(sFecha);
  fFormaFecha.Free;

end;

end.

