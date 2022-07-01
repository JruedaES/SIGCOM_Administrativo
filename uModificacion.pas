unit uModificacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DBTables, Db, Mask, DBCtrls, Menus,
  utMenuArbol, ComCtrls, ImgList, Grids, DBGrids, RXDBCtrl;

type DatosApoyo = record
     PintadoApoyo:string;
     Accion:string;
     Descripcion:string;
     Direccion:string;
end;

type DatosEstructuras = record
     PintadoApoyo:string;
     Accion:string;
     Nivel:string;
     TipoTension:string;
     Descripcion:string;
end;

type DatosTramos = record
     PintadoApoyoOrigen:string;
     PintadoApoyoDestino:string;
     Accion:string;
     Fases:string;
     Calibre:string;
     Material:string;
end;

type DatosEquipos = record
     PintadoApoyo:string;
     CodigoEquipo:string;
     Accion:string;
     Descripcion:string;
end;

type
  TfModificacion = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    qModificacion: TQuery;
    UpdModificacion: TUpdateSQL;
    dsModificacion: TDataSource;
    qCIA: TQuery;
    dMenuArbol1: TdMenuArbol;
    qTipoModificacion: TQuery;
    dsTipoModificacion: TDataSource;
    qCircuito: TQuery;
    qEstadoModificacion: TQuery;
    pcModificacion: TPageControl;
    tsDatosGenerales: TTabSheet;
    tsDetalles: TTabSheet;
    Label1: TLabel;
    dbeCIA: TDBEdit;
    Label2: TLabel;
    dbeCodigo: TDBEdit;
    Label3: TLabel;
    dbeFecha: TDBEdit;
    sbFecha: TSpeedButton;
    lNombreCIA: TLabel;
    Label5: TLabel;
    dbeDireccion: TDBEdit;
    GroupBox1: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    GroupBox2: TGroupBox;
    dsCircuito: TDataSource;
    DBEdit6: TDBEdit;
    Label8: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label7: TLabel;
    qPropietario: TQuery;
    dsPropietario: TDataSource;
    DBLookupComboBox3: TDBLookupComboBox;
    Label10: TLabel;
    qTipoDistribucion: TQuery;
    dsTipoDistribucion: TDataSource;
    DBLookupComboBox4: TDBLookupComboBox;
    GroupBox4: TGroupBox;
    dbePlanchas: TDBEdit;
    qModificacionCODIGOMODIFICACION: TFloatField;
    qModificacionFECHATERMINACION: TDateTimeField;
    qModificacionCODIGOADMINISTRATIVO: TFloatField;
    qModificacionCODIGOTIPOMODIFICACION: TFloatField;
    qModificacionDIRECCION: TStringField;
    qModificacionCODIGOCIRCUITO1: TStringField;
    qModificacionCODIGOCIRCUITO2: TStringField;
    qModificacionCODIGOTRAFODIS: TFloatField;
    qModificacionPOTENCIA: TFloatField;
    qModificacionCODIGOPROPIETARIO: TStringField;
    qModificacionCODIGOTIPOFASE: TStringField;
    qModificacionCODIGOTIPODISTRIBUCION: TStringField;
    qModificacionCODIGOPLANCHA: TStringField;
    qModificacionCODIGOUSUARIO: TFloatField;
    qModificacionCODIGODILIGENCIO: TFloatField;
    qModificacionCODIGODIGITO: TFloatField;
    qModificacionCODIGOESTADOMODIFICACION: TFloatField;
    GroupBox5: TGroupBox;
    DBMemo1: TDBMemo;
    GroupBox7: TGroupBox;
    sbDigito: TSpeedButton;
    EdDigito: TEdit;
    DBRadioGroup1: TDBRadioGroup;
    qEmpleado: TQuery;
    Label6: TLabel;
    ImageList1: TImageList;
    GroupBox8: TGroupBox;
    RxDBGrid1: TRxDBGrid;
    qApoyos: TQuery;
    dsApoyos: TDataSource;
    Panel4: TPanel;
    Panel5: TPanel;
    DBNavigator1: TDBNavigator;
    UpdApoyos: TUpdateSQL;
    GroupBox9: TGroupBox;
    RxDBGrid2: TRxDBGrid;
    Panel6: TPanel;
    Panel7: TPanel;
    DBNavigator2: TDBNavigator;
    dsEstructuras: TDataSource;
    qEstructuras: TQuery;
    UpdEstructuras: TUpdateSQL;
    GroupBox10: TGroupBox;
    RxDBGrid3: TRxDBGrid;
    qTramos: TQuery;
    dsTramos: TDataSource;
    Panel8: TPanel;
    Panel9: TPanel;
    DBNavigator3: TDBNavigator;
    UpdTramos: TUpdateSQL;
    GroupBox11: TGroupBox;
    RxDBGrid4: TRxDBGrid;
    Panel10: TPanel;
    Panel11: TPanel;
    DBNavigator4: TDBNavigator;
    qEquipos: TQuery;
    dsEquipos: TDataSource;
    UpdEquipos: TUpdateSQL;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    qModificacionFECHASISTEMA: TDateTimeField;
    Label9: TLabel;
    dbeReferencia: TDBEdit;
    qModificacionREFERENCIA: TStringField;
    sbImprimirPlanchas: TSpeedButton;
    sbCopiarApoyo: TSpeedButton;
    sbCopiarEstructura: TSpeedButton;
    sbCopiarTramos: TSpeedButton;
    sbCopiarEquipos: TSpeedButton;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit2: TDBEdit;
    qModificacionCODIGOCIRCUITO3: TStringField;
    qModificacionCODIGOCIRCUITO4: TStringField;
    qModificacionCODIGOCIRCUITO5: TStringField;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBLookupComboBox5: TDBLookupComboBox;
    DBLookupComboBox6: TDBLookupComboBox;
    DBLookupComboBox7: TDBLookupComboBox;
    qModificacionDESCRIPCION: TStringField;
    procedure qModificacionAfterInsert(DataSet: TDataSet);
    procedure qModificacionAfterPost(DataSet: TDataSet);
    procedure sbFechaClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure qModificacionCODIGOADMINISTRATIVOValidate(Sender: TField);
    procedure bbAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qModificacionUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure bbCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dMenuArbol1SelectID(Sender: tnMenuItem; ID: Integer;
      MenuEstructura: tMenuEs);
    procedure FormActivate(Sender: TObject);
    procedure sbDiligencioClick(Sender: TObject);
    procedure sbDigitoClick(Sender: TObject);
    procedure qModificacionCODIGODIGITOValidate(Sender: TField);
    procedure qApoyosAfterInsert(DataSet: TDataSet);
    procedure qApoyosAfterPost(DataSet: TDataSet);
    procedure qApoyosUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qEstructurasAfterInsert(DataSet: TDataSet);
    procedure qEstructurasAfterPost(DataSet: TDataSet);
    procedure qEstructurasUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qTramosAfterInsert(DataSet: TDataSet);
    procedure qTramosAfterPost(DataSet: TDataSet);
    procedure qTramosUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qEquiposAfterInsert(DataSet: TDataSet);
    procedure qEquiposAfterPost(DataSet: TDataSet);
    procedure qEquiposUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure sbImprimirPlanchasClick(Sender: TObject);
    procedure sbCopiarApoyoClick(Sender: TObject);
    procedure sbCopiarEstructuraClick(Sender: TObject);
    procedure sbCopiarTramosClick(Sender: TObject);
    procedure sbCopiarEquiposClick(Sender: TObject);
    procedure qModificacionCODIGOCIRCUITO1Validate(Sender: TField);
    procedure qModificacionCODIGOCIRCUITO2Validate(Sender: TField);
    procedure qModificacionCODIGOCIRCUITO3Validate(Sender: TField);
    procedure qModificacionCODIGOCIRCUITO4Validate(Sender: TField);
    procedure qModificacionCODIGOCIRCUITO5Validate(Sender: TField);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bDatosIncompletos, bCancelando: Boolean;
    Resultado:Boolean;
    Apoyo:DatosApoyo;
    Estructura:DatosEstructuras;
    Tramo:DatosTramos;
    Equipo:DatosEquipos;
  end;

var
  fModificacion: TfModificacion;

implementation

uses uFormaFecha, uBuscarEmpleado, uFormarFechaOliver, uListaModificacion,
  uFIMPComunes, uFiltroEmpleado;

{$R *.DFM}

procedure TfModificacion.qModificacionAfterInsert(DataSet: TDataSet);
var qDatos:TQuery;
begin
  qModificacionFECHATERMINACION.AsDateTime := Int(Now);
  qDatos:=TQuery.Create(Application);
  qDatos.DataBaseName:='BaseDato';
  qDatos.SQL.Text:='SELECT SQ_MODIFICACION.NEXTVAL FROM DUAL';
  qDatos.Open;
  qModificacionCODIGOMODIFICACION.AsInteger := qDatos.Fields[0].AsInteger + 1;
  qModificacionCODIGOUSUARIO.AsInteger:=0;
  qModificacionCODIGOTIPOMODIFICACION.AsInteger:=1;
  qDatos.Close;
  qDatos.SQL.Text:='SELECT SYSDATE FROM DUAL';
  qDatos.Open;
  qModificacionFECHASISTEMA.AsDateTime:=qDatos.Fields[0].AsDateTime;
  qDatos.Free;
end;

procedure TfModificacion.qModificacionAfterPost(DataSet: TDataSet);
begin
  try
  qModificacion.ApplyUpdates;
  qModificacion.CommitUpdates;
  finally
  end;
end;

procedure TfModificacion.sbFechaClick(Sender: TObject);
begin
 fFormaFechaOliver:=TfFormaFechaOliver.Create(Application);
 if fFormaFechaOliver.ShowModal=mrOK then
     qModificacionFECHATERMINACION.AsDateTime:=fFormaFechaOliver.MonthCalendar1.Date;
 fFormaFechaOliver.Free;

end;


procedure TfModificacion.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfModificacion.qModificacionCODIGOADMINISTRATIVOValidate(
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

procedure TfModificacion.bbAceptarClick(Sender: TObject);
begin
bDatosIncompletos := False;
  try
     qModificacion.Post;
     if qModificacion.UpdatesPending then
        qModificacion.ApplyUpdates;
     Close;
     ModalResult:=MrOk;
  except
   on E:Exception do
   begin
     //ShowMessage(E.Message);
     bDatosIncompletos := True;
     qModificacion.Edit;
     ModalResult:=MrCancel;
     Close;
   end;  
  end;
end;

procedure TfModificacion.FormCreate(Sender: TObject);
begin
  bCancelando := False;
  Resultado   := False;
end;

procedure TfModificacion.qModificacionUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  try
  finally
  end;
end;

procedure TfModificacion.bbCancelarClick(Sender: TObject);
begin
  fModificacion.SendToBack;
  if Application.MessageBox(PChar('Perderá los cambios realizados.Esta seguro de Cancelar?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
     begin
      try
         qModificacion.Cancel;
         if qModificacion.UpdatesPending then
          qModificacion.CancelUpdates;
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
        //dbeCIA.SetFocus;
     end;
end;

procedure TfModificacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not bCancelando then
    begin
      if bDatosIncompletos then
       begin
         fModificacion.SendToBack;
         if Application.MessageBox(PChar('Hay datos incompletos.Desea completar los datos?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
            begin
              ModalResult := 0;
              bDatosIncompletos := false;
              //dbeCIA.SetFocus;
              Action:=caNone;
            end
         else
            begin
              qModificacion.Cancel;
              qModificacion.CancelUpdates;
              if qModificacion.Database.InTransaction then
                 qModificacion.Database.Rollback;
              Action:=caFree;
            end;
       end
     else
       if ModalResult <> MrCancel then
       begin
          ModalResult := mrOK;
          if qModificacion.Database.InTransaction then
                 qModificacion.Database.Commit;
          Action:=caFree;
          if Assigned(Application.FindComponent('fListaModificacion') as TForm) then
          begin
            fListaModificacion.qListaModificacion.Close;
            fListaModificacion.qListaModificacion.Open;
            fListaModificacion.qListaModificacion.Locate('CODIGOMODIFICACION',qModificacionCODIGOMODIFICACION.AsString,[]);
          end;
       end;
     end;
   if ModalResult=2 then
   begin
     try
      qModificacion.Cancel;
      qModificacion.CancelUpdates;
      if qModificacion.Database.InTransaction then
         qModificacion.Database.Rollback;
      Action:=caFree;
     except
     end;
   end;
end;

procedure TfModificacion.dMenuArbol1SelectID(Sender: tnMenuItem;
  ID: Integer; MenuEstructura: tMenuEs);
begin
  qModificacionCODIGOADMINISTRATIVO.AsInteger := ID;
end;

procedure TfModificacion.FormActivate(Sender: TObject);
begin
  if not qModificacionCODIGOADMINISTRATIVO.IsNull then
     qModificacionCODIGOADMINISTRATIVOValidate(qModificacionCODIGOADMINISTRATIVO);
  if not qModificacionCODIGODIGITO.IsNull then
     qModificacionCODIGODIGITOValidate(qModificacionCODIGODIGITO);
  qApoyos.Close;
  qApoyos.Open;
  qEstructuras.Close;
  qEstructuras.Open;
  qTramos.Close;
  qTramos.Open;
  qEquipos.Close;
  qEquipos.Open;
  pcModificacion.ActivePage:=tsDatosGenerales;
end;

procedure TfModificacion.sbDiligencioClick(Sender: TObject);
begin
fBuscarEmpleado:=TfBuscarEmpleado.Create(Application);
 try
  if fBuscarEmpleado.ShowModal=MrOK then
  begin
    qModificacionCODIGODILIGENCIO.AsString:=fBuscarEmpleado.qListaEmpleado.FieldByName('CODIGOEMPLEADO').AsString;
  end;
 finally
   fBuscarEmpleado.Free;
   fBuscarEmpleado:=nil;
 end;
end;

procedure TfModificacion.sbDigitoClick(Sender: TObject);
begin
fBuscarEmpleado:=TfBuscarEmpleado.Create(Application);
 try
  if dbeCIA.Text <> '' then
  begin
    FFiltroEmpleado.tdFiltroEmpleado.Edit;
    FFiltroEmpleado.tdFiltroEmpleadoCODIGOADMINISTRATIVO.AsString:=dbeCIA.Text;
    FFiltroEmpleado.BitBtnFiltrarClick(nil);
  end;
  if fBuscarEmpleado.ShowModal=MrOK then
  begin
    qModificacionCODIGODIGITO.AsString:=fBuscarEmpleado.qListaEmpleado.FieldByName('CODIGOEMPLEADO').AsString;
  end;
 finally
   fBuscarEmpleado.Free;
   fBuscarEmpleado:=nil;
 end;
end;

procedure TfModificacion.qModificacionCODIGODIGITOValidate(Sender: TField);
begin
if Sender.Text <> '' then
  begin
    qEmpleado.Close;
    qEmpleado.Params[0].AsString:=Sender.Text;
    qEmpleado.Open;
    if qEmpleado.RecordCount > 0 then
      EdDigito.Text:=qEmpleado.Fields[0].AsString
    else
      raise Exception.Create('Este Empleado No Existe.')
  end;
end;

procedure TfModificacion.qApoyosAfterInsert(DataSet: TDataSet);
var qDatos:TQuery;
begin
   qDatos:=TQuery.Create(Application);
   qDatos.DataBaseName:='BaseDato';
   qDatos.SQL.Text:='SELECT SQ_MODIFICACIONAPOYO.NEXTVAL FROM DUAL ';
   qDatos.Open;
   DataSet.FieldByName('CODIGOMODIFICACIONAPOYO').AsString:=qDatos.Fields[0].AsString;
   DataSet.FieldByName('CODIGOMODIFICACION').AsString:=qModificacionCODIGOMODIFICACION.AsString;
   if sbCopiarApoyo.Down = True then
   begin
     DataSet.FieldByName('PINTADOAPOYO').AsString:=Apoyo.PintadoApoyo;
     DataSet.FieldByName('ACCION').AsString      :=Apoyo.Accion;
     DataSet.FieldByName('DESCRIPCION').AsString :=Apoyo.Descripcion;
     DataSet.FieldByName('DIRECCION').AsString   :=Apoyo.Direccion;
   end;
   qDatos.Free;
end;

procedure TfModificacion.qApoyosAfterPost(DataSet: TDataSet);
begin
  try
     qApoyos.ApplyUpdates;
     qApoyos.CommitUpdates;
  finally
  end;
end;

procedure TfModificacion.qApoyosUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
var s:string;  
begin
 case UpdateKind of
   ukModify: s:='Modificar';
   ukInsert: s:='Insertar';
   ukDelete: s:='Eliminar';
 end;
 MessageDlg('Error al '+ s + ' un Apoyo, Por Favor Revise Los Datos.',mtError,[mbOK],0);
end;

procedure TfModificacion.qEstructurasAfterInsert(DataSet: TDataSet);
var qDatos:TQuery;
begin
   qDatos:=TQuery.Create(Application);
   qDatos.DataBaseName:='BaseDato';
   qDatos.SQL.Text:='SELECT SQ_MODIFICACIONESTRUCTURA.NEXTVAL FROM DUAL ';
   qDatos.Open;
   DataSet.FieldByName('CODIGOMODIFICACIONESTRUCTURA').AsString:=qDatos.Fields[0].AsString;
   DataSet.FieldByName('CODIGOMODIFICACION').AsString:=qModificacionCODIGOMODIFICACION.AsString;
   if sbCopiarEstructura.Down = True then
   begin
      DataSet.FieldByName('PINTADOAPOYO').AsString :=Estructura.PintadoApoyo;
      DataSet.FieldByName('ACCION').AsString       :=Estructura.Accion;
      DataSet.FieldByName('NIVELAPOYO').AsString   :=Estructura.Nivel;
      DataSet.FieldByName('TIPOTENSION').AsString  :=Estructura.TipoTension;
      DataSet.FieldByName('DESCRIPCION').AsString  :=Estructura.Descripcion;
   end;
   qDatos.Free;
end;

procedure TfModificacion.qEstructurasAfterPost(DataSet: TDataSet);
begin
  try
    qEstructuras.ApplyUpdates;
    qEstructuras.CommitUpdates;
  finally
  end;
end;

procedure TfModificacion.qEstructurasUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
var s:string;
begin
    case UpdateKind of
      ukModify: s:='Modificar';
      ukInsert: s:='Insertar';
    end;
    MessageDlg('Error al ' + s + ' una Estructura, Por Favor Revise Los Datos.',mtError,[mbOk],0);
end;

procedure TfModificacion.qTramosAfterInsert(DataSet: TDataSet);
var qDatos:TQuery;
begin
   qDatos:=TQuery.Create(Application);
   qDatos.DataBaseName:='BaseDato';
   qDatos.SQL.Text:='SELECT SQ_MODIFICACIONTRAMO.NEXTVAL FROM DUAL ';
   qDatos.Open;
   DataSet.FieldByName('CODIGOMODIFICACIONTRAMO').AsString:=qDatos.Fields[0].AsString;
   DataSet.FieldByName('CODIGOMODIFICACION').AsString:=qModificacionCODIGOMODIFICACION.AsString;
   if sbCopiarTramos.Down = True then
   begin
     DataSet.FieldByName('PINTADOAPOYOORIGEN').AsString :=Tramo.PintadoApoyoOrigen;
     DataSet.FieldByName('PINTADOAPOYODESTINO').AsString:=Tramo.PintadoApoyoDestino;
     DataSet.FieldByName('ACCION').AsString             :=Tramo.Accion;
     DataSet.FieldByName('FASES').AsString              :=Tramo.Fases;
     DataSet.FieldByName('CALIBRE').AsString            :=Tramo.Calibre;
     DataSet.FieldByName('MATERIAL').AsString           :=Tramo.Material;
   end;
   qDatos.Free;
end;

procedure TfModificacion.qTramosAfterPost(DataSet: TDataSet);
begin
  try
    qTramos.ApplyUpdates;
    qTramos.CommitUpdates;
  finally
  end;
end;

procedure TfModificacion.qTramosUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
var s:string;  
begin
    case UpdateKind of
      ukModify: s:='Modificar';
      ukInsert: s:='Insertar';
    end;
    MessageDlg('Error al ' + s + ' un Tramo, Por Favor Revise Los Datos.',mtError,[mbOk],0);
end;

procedure TfModificacion.qEquiposAfterInsert(DataSet: TDataSet);
var qDatos:TQuery;
begin
   qDatos:=TQuery.Create(Application);
   qDatos.DataBaseName:='BaseDato';
   qDatos.SQL.Text:='SELECT SQ_MODIFICACIONEQUIPO.NEXTVAL FROM DUAL ';
   qDatos.Open;
   DataSet.FieldByName('CODIGOMODIFICACIONEQUIPO').AsString:=qDatos.Fields[0].AsString;
   DataSet.FieldByName('CODIGOMODIFICACION').AsString:=qModificacionCODIGOMODIFICACION.AsString;
   if sbCopiarEquipos.Down = True then
   begin
     DataSet.FieldByName('PINTADOAPOYO').AsString :=Equipo.PintadoApoyo;
     DataSet.FieldByName('CODIGOEQUIPO').AsString :=Equipo.CodigoEquipo;
     DataSet.FieldByName('ACCION').AsString       :=Equipo.Accion;
     DataSet.FieldByName('DESCRIPCION').AsString  :=Equipo.Descripcion;
   end;
   qDatos.Free;
end;

procedure TfModificacion.qEquiposAfterPost(DataSet: TDataSet);
begin
  try
    qEquipos.ApplyUpdates;
    qEquipos.CommitUpdates;
  finally
  end;
end;

procedure TfModificacion.qEquiposUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
var s:string;   
begin
    case UpdateKind of
      ukModify: s:='Modificar';
      ukInsert: s:='Insertar';
    end;
    MessageDlg('Error al ' + s + ' un Equipo, Por Favor Revise Los Datos.',mtError,[mbOk],0);
end;

procedure TfModificacion.RxDBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
If Key = #13 Then Begin
 If HiWord(GetKeyState(VK_SHIFT)) <> 0 then begin
  with (Sender as TDBGrid) do
  if selectedindex > 0 then
   selectedindex := selectedindex - 1
  else begin
   DataSource.DataSet.Prior;
   selectedindex := fieldcount - 1;
  end;
 end else begin
  with (Sender as TDBGrid) do
  if selectedindex < (fieldcount - 1) then
   selectedindex := selectedindex + 1
  else begin
   DataSource.DataSet.Next;
   selectedindex := 0;
  end;
end;
Key := #0
end;
end;
procedure TfModificacion.sbImprimirPlanchasClick(Sender: TObject);
var ListaTemp:TStringList;
begin
  if dbePlanchas.Text <> '' then
  begin
  fModificacion.SendToBack;
  if  MessageDlg('Desea Imprimir las Siguientes Planchas: '+dbePlanchas.Text,mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    if not Assigned(Application.FindComponent('fPlancha') as TForm) then
    begin
     fModificacion.SendToBack;
     MessageDlg('Debe Abrir la Cartografía Para Imprimir Las Planchas.',mtError,[mbOk],0);
     Exit;
    end;
     ListaTemp:=TStringList.Create;
     ListaTemp.CommaText:=Trim(dbePlanchas.Text);
     ImprimirListaPlancha(ListaTemp,1,'ODT: ' + dbeReferencia.Text);
     ListaTemp.Free;
  end;
  end
  else
  begin
    fModificacion.SendToBack;
    MessageDlg('Debe Digitar Por Lo Menos Una Plancha.',mtError,[mbOk],0);
  end;  
end;

procedure TfModificacion.sbCopiarApoyoClick(Sender: TObject);
begin
  if sbCopiarApoyo.Down = True then
  begin
     Apoyo.PintadoApoyo:=qApoyos.FieldByName('PINTADOAPOYO').AsString;
     Apoyo.Accion      :=qApoyos.FieldByName('ACCION').AsString;
     Apoyo.Descripcion :=qApoyos.FieldByName('DESCRIPCION').AsString;
     Apoyo.Direccion   :=qApoyos.FieldByName('DIRECCION').AsString;
  end;
end;

procedure TfModificacion.sbCopiarEstructuraClick(Sender: TObject);
begin
  if sbCopiarEstructura.Down = True then
  begin
     Estructura.PintadoApoyo:=qEstructuras.FieldByName('PINTADOAPOYO').AsString;
     Estructura.Accion      :=qEstructuras.FieldByName('ACCION').AsString;
     Estructura.Nivel       :=qEstructuras.FieldByName('NIVELAPOYO').AsString;
     Estructura.TipoTension :=qEstructuras.FieldByName('TIPOTENSION').AsString;
     Estructura.Descripcion :=qEstructuras.FieldByName('DESCRIPCION').AsString;
  end;
end;

procedure TfModificacion.sbCopiarTramosClick(Sender: TObject);
begin
  if sbCopiarTramos.Down = True then
  begin
    Tramo.PintadoApoyoOrigen :=qTramos.FieldByName('PINTADOAPOYOORIGEN').AsString;
    Tramo.PintadoApoyoDestino:=qTramos.FieldByName('PINTADOAPOYODESTINO').AsString;
    Tramo.Accion             :=qTramos.FieldByName('ACCION').AsString;                                                      
    Tramo.Fases              :=qTramos.FieldByName('FASES').AsString;
    Tramo.Calibre            :=qTramos.FieldByName('CALIBRE').AsString;
    Tramo.Material           :=qTramos.FieldByName('MATERIAL').AsString;
  end;
end;

procedure TfModificacion.sbCopiarEquiposClick(Sender: TObject);
begin
  if sbCopiarEquipos.Down = True then
  begin
    Equipo.PintadoApoyo:=qEquipos.FieldByName('PINTADOAPOYO').AsString;
    Equipo.CodigoEquipo:=qEquipos.FieldByName('CODIGOEQUIPO').AsString;
    Equipo.Accion      :=qEquipos.FieldByName('ACCION').AsString;
    Equipo.Descripcion :=qEquipos.FieldByName('DESCRIPCION').AsString;
  end;
end;



procedure TfModificacion.qModificacionCODIGOCIRCUITO1Validate(
  Sender: TField);
begin
  if Sender.Text <> '' then
    if (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO2').AsString) or
       (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO3').AsString) or
       (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO4').AsString) or
       (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO5').AsString) then
       raise Exception.Create('El Circuito: ' + Sender.Text + ' Esta Repetido. Por Favor Revise Los Datos.');
end;

procedure TfModificacion.qModificacionCODIGOCIRCUITO2Validate(
  Sender: TField);
begin
if Sender.Text <> '' then
    if (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO1').AsString) or
       (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO3').AsString) or
       (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO4').AsString) or
       (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO5').AsString) then
       raise Exception.Create('El Circuito: ' + Sender.Text + ' Esta Repetido. Por Favor Revise Los Datos.');
end;

procedure TfModificacion.qModificacionCODIGOCIRCUITO3Validate(
  Sender: TField);
begin
if Sender.Text <> '' then
    if (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO1').AsString) or
       (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO2').AsString) or
       (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO4').AsString) or
       (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO5').AsString) then
       raise Exception.Create('El Circuito: ' + Sender.Text + ' Esta Repetido. Por Favor Revise Los Datos.');
end;

procedure TfModificacion.qModificacionCODIGOCIRCUITO4Validate(
  Sender: TField);
begin
if Sender.Text <> '' then
    if (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO1').AsString) or
       (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO2').AsString) or
       (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO3').AsString) or
       (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO5').AsString) then
       raise Exception.Create('El Circuito: ' + Sender.Text + ' Esta Repetido. Por Favor Revise Los Datos.');
end;

procedure TfModificacion.qModificacionCODIGOCIRCUITO5Validate(
  Sender: TField);
begin
if Sender.Text <> '' then
    if (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO1').AsString) or
       (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO2').AsString) or
       (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO3').AsString) or
       (Sender.Text = qModificacion.FieldByName('CODIGOCIRCUITO4').AsString) then
       raise Exception.Create('El Circuito: ' + Sender.Text + ' Esta Repetido. Por Favor Revise Los Datos.');
end;

procedure TfModificacion.FormDestroy(Sender: TObject);
begin
 Self := nil;
end;

end.
