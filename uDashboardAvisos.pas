unit uDashboardAvisos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Db, Buttons, Grids, DBGrids, DBTables,
  ConsDll, uInformacionOriginal, uInformacionMedidor,
  ComCtrls, TeeProcs, TeEngine, Chart, DBChart, Series, uListaCritica, Math,
  uSeleccionarObservacion, ToolWin, ImgList, RXDBCtrl, DBClient,uBase, Spin,
  ExtDlgs, ToolEdit, UTrCVS, RXLookup, Menus;

type
  TFDashboardAvisos = class(TFBase)
    Label30: TLabel;
    DBText3: TDBText;
    iLista: TImageList;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel29: TPanel;
    timer: TTimer;
    Panel31: TPanel;
    ToolBar1: TToolBar;
    tbFechaReparto: TToolButton;
    tbElementos: TToolButton;
    tbExportar: TToolButton;
    pgConsultas: TPageControl;
    tbCRUD: TTabSheet;
    tbAsignar: TTabSheet;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    dsConsulta: TDataSource;
    DBGrid1: TDBGrid;
    Panel8: TPanel;
    Panel9: TPanel;
    qConsulta: TQuery;
    qConsultaCODIGOCONSULTA: TFloatField;
    qConsultaNOMBRECONSULTA: TMemoField;
    qConsultaNOMBRECATEGORIA: TStringField;
    qConsultaACTIVO: TStringField;
    qConsultaFOTOGRAFIA: TStringField;
    qConsultaNOMBRETIPOCONSULTA: TStringField;
    qTipoConsulta: TQuery;
    dsTipoConsulta: TDataSource;
    qTipoConsultaCODIGOTIPOCONSULTA: TFloatField;
    qTipoConsultaNOMBRETIPOCONSULTA: TStringField;
    qTipoConsultaACTIVO: TStringField;
    dbLookTipo: TDBLookupComboBox;
    Label1: TLabel;
    Panel14: TPanel;
    Label2: TLabel;
    pTituloPre: TPanel;
    Label3: TLabel;
    dbLookupCategoria: TDBLookupComboBox;
    qCategoria: TQuery;
    dsCategoria: TDataSource;
    qCategoriaCODIGOCATEGORIA: TFloatField;
    qCategoriaNOMBRECATEGORIA: TStringField;
    qCategoriaACTIVO: TStringField;
    qCategoriaFECHACREACION: TDateTimeField;
    qCategoriaUSUARIOCREACION: TFloatField;
    qCategoriaFECHAMODIFICACION: TDateTimeField;
    qCategoriaUSUARIOMODIFICACION: TFloatField;
    cbFotografia: TCheckBox;
    cbActivo: TCheckBox;
    pRespuestas: TPanel;
    Panel11: TPanel;
    Label5: TLabel;
    lblCat: TLabel;
    lblConsultaPrevisualizacion: TLabel;
    qConsultaCODIGOTIPOCONSULTA: TFloatField;
    qConsultaCONSULTA: TStringField;
    qConsultaREQUIEREFOTO: TStringField;
    qConsultaESTADO: TStringField;
    Panel10: TPanel;
    ToolBar2: TToolBar;
    tbEliminar: TToolButton;
    tbEditar: TToolButton;
    tbGuardar: TToolButton;
    ImageList1: TImageList;
    tbCrear: TToolButton;
    qConsultaCODIGOCATEGORIA: TFloatField;
    qCantidadRespuestas: TQuery;
    dsCantidadRespuestas: TDataSource;
    qCantidadRespuestasCANTIDAD: TFloatField;
    updConsulta: TUpdateSQL;
    edConsulta: TEdit;
    qRespuesta: TQuery;
    RxDBGrid1: TRxDBGrid;
    qConsultaRespuesta: TQuery;
    dsConsultaRespuesta: TDataSource;
    qConsultaRespuestaRESPUESTA: TStringField;
    qConsultaRespuestaCODIGOCONSULTA: TFloatField;
    qConsultaRespuestaCODIGORESPUESTA: TFloatField;
    qConsultaRespuestaFECHACREACION: TDateTimeField;
    dsRespuesta: TDataSource;
    RxDBGrid2: TRxDBGrid;
    qRespuestaCODIGORESPUESTA: TFloatField;
    qRespuestaNOMBRERESPUESTA: TStringField;
    qInsertRespuesta: TQuery;
    Label6: TLabel;
    Label7: TLabel;
    btnRemover: TBitBtn;
    btnAsignar: TBitBtn;
    Panel12: TPanel;
    Panel13: TPanel;
    DBGrid2: TDBGrid;
    qListadoConsulta: TQuery;
    FloatField1: TFloatField;
    MemoField1: TMemoField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField2: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    FloatField3: TFloatField;
    dsListadoConsulta: TDataSource;
    Panel3: TPanel;
    qElementos: TQuery;
    dsElementos: TDataSource;
    qElementosCODIGOTIPOELEMENTO: TFloatField;
    qElementosNOMBREELEMENTO: TStringField;
    qElementosACTIVO: TStringField;
    Panel15: TPanel;
    dsEditElemento: TDataSource;
    CVS1: TCVS;
    OpenDialog1: TOpenDialog;
    ToolButton1: TToolButton;
    tbCategorias: TToolButton;
    Panel5: TPanel;
    DBGrid3: TDBGrid;
    qConsultaElemento: TQuery;
    dsConsultaElemento: TDataSource;
    qConsultaElementoCODIGOCONSULTA: TFloatField;
    qConsultaElementoNOMBRECONSULTA: TMemoField;
    qConsultaElementoPERIODO: TFloatField;
    qConsultaElementoCONSECUTIVO: TFloatField;
    qConsultaElementoCODIGOELEMENTO: TStringField;
    qConsultaElementoNOMBREELEMENTO: TStringField;
    qConsultaElementoNOMBREESTADOITINERARIO: TStringField;
    qConsultaElementoESTADOCONSULTA: TFloatField;
    Panel16: TPanel;
    Panel17: TPanel;
    ProcCargue: TStoredProc;
    qConsulta2: TQuery;
    dsConsulta2: TDataSource;
    qConsulta2CODIGOCONSULTA: TFloatField;
    qConsulta2NOMBRECONSULTA: TMemoField;
    qConsulta2NOMBRECATEGORIA: TStringField;
    qConsulta2ACTIVO: TStringField;
    qConsulta2FOTOGRAFIA: TStringField;
    qConsulta2NOMBRETIPOCONSULTA: TStringField;
    qConsulta2CODIGOTIPOCONSULTA: TFloatField;
    qConsulta2CODIGOCATEGORIA: TFloatField;
    ProExportacion: TStoredProc;
    Panel18: TPanel;
    btnGuardar: TBitBtn;
    Panel19: TPanel;
    btnCargarArchivo: TBitBtn;
    edNombreGrupo: TEdit;
    lblGrupo: TLabel;
    edCuenta: TEdit;
    Label9: TLabel;
    dbLElementos: TDBLookupComboBox;
    Label4: TLabel;
    btnSeleccionar: TBitBtn;
    Label10: TLabel;
    lblTipoelemento: TLabel;
    lblPeriodo: TLabel;
    lblconsulta: TLabel;
    Label14: TLabel;
    ePeriodo: TEdit;
    SpeedButton2: TSpeedButton;
    Label15: TLabel;
    qConsulta2NOMBRE: TStringField;
    qConsultaElementoNOMBRE: TStringField;
    lblref: TLabel;
    lblReferenciaElemento: TLabel;
    pmEliminar: TPopupMenu;
    EliminarElemento: TMenuItem;
    BitBtn1: TBitBtn;
    sbActualizarCategorias: TSpeedButton;
    PanelAjustable: TPanel;
    sbRespuesta: TScrollBox;
    procedure tbFechaRepartoClick(Sender: TObject);
    procedure tbElementosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qConsultaAfterScroll(DataSet: TDataSet);
    procedure qConsultaCalcFields(DataSet: TDataSet);
    procedure qConsultaAfterOpen(DataSet: TDataSet);
    procedure tbEliminarClick(Sender: TObject);
    procedure tbCrearClick(Sender: TObject);
    procedure tbGuardarClick(Sender: TObject);
    procedure dbLookupCategoriaClick(Sender: TObject);
    procedure btnSeleccionarClick(Sender: TObject);
    procedure btnAsignarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure tbEditarClick(Sender: TObject);
    procedure qTipoConsultaAfterScroll(DataSet: TDataSet);
    procedure qElementosAfterScroll(DataSet: TDataSet);
    procedure btnCargarArchivoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure tbExportarClick(Sender: TObject);
    
    procedure qConsulta2CalcFields(DataSet: TDataSet);
    procedure qConsultaElementoCalcFields(DataSet: TDataSet);
    procedure edCuentaChange(Sender: TObject);
    procedure edNombreGrupoChange(Sender: TObject);
    procedure qConsulta2AfterScroll(DataSet: TDataSet);
    procedure EliminarElementoClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure tbCategoriasClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure sbActualizarCategoriasClick(Sender: TObject);
   



  private
    { Private declarations }

  vFile, destino, aptos, erroneos: TStringList;
  codigoelemento: string;
  public
   procedure GenerarRespuestas;
   function ValidarExportado :Boolean;
   function CantidadRespuestas :string;
   function FileVersionGet( const sgFileName : string ) : string;
   function GenerarCodigoConsulta(Bandera: Boolean): string;
   function GenerarCodigoGrupoCliente(Bandera: Boolean): string;
   function GenerarTabla(var NombreCampo,Codigocampo,Condicion: String):string;
   function LimpiarPrevisualizacion :Boolean;
   function InsertarListaClienteEspecial(grupo,cadena: String):Boolean;
   function InsertarConsultaElemento(elemento: string) :Boolean;
   function TotalImportados(codigo: Integer): integer;
   function GenerarGrupoClientes(Bandera:Boolean): integer;
   procedure LimpiarTablaImportacion;
   function GenerarConsecutivo(Bandera: Boolean): string;
   function GetUsuario(Bandera:Boolean): integer;
   function ValidarExisteRespuesta(Bandera:Boolean):Boolean;
   function ValidarExportadoElementoConsulta(Bandera:Boolean):Boolean;
   function EsNumero(cadena:string): Boolean;


  end;

var
  FDashboardAvisos: TFDashboardAvisos;
  TipoFacturacion, TipoFacturacionReactiva, TipoFacturacionDemanda: Integer;
  Listado,LPanel : TList;
  

implementation

uses uFormaFecha, uFuncionSGD, uODTPadre, uCambiarLectura,
  uGaleriaPreliminar, uFormaEspere, uSupervisionGeneralR,
  uElementosConsulta, uFIMPAdministrativo;

{$R *.DFM}




function GetFecha: string;
var
sPeriodo, sFecha : String;
begin
FFormaFecha := TFFormaFecha.Create(Application);
if FFormaFecha.ShowModal = mrOk then
begin
sPeriodo := FormatDateTime('yyyymm', FFormaFecha.Date);
Result := sPeriodo;
end
else
Result := '';
FFormaFecha.Free;
end;



procedure TFDashboardAvisos.GenerarRespuestas;
var
qry :TQuery;

r : TRadioButton;
c : TCheckBox;
i, ubicacion: Integer;
panel : TPanel;
begin

    if qConsultaCODIGOTIPOCONSULTA.asinteger in  [1,2,3,4] then
begin
IF Listado.Count >0 then
begin

 for i := Listado.count-1 downto 0 do
 begin

   IF  TObject(Listado[i]).ClassName = 'TRadioButton' then
   begin
      TRadioButton(Listado[i]).free;
   end
   else if TObject(Listado[i]).ClassName = 'TCheckBox' then
   begin
   TCheckBox(Listado[i]).free;
   TPanel(LPanel[i]).free;

   end;
 end;
end;
end;
    
    Listado.clear;
    LPanel.clear;
    lblConsultaPrevisualizacion.Align := alTop;
    pTituloPre.Align := alTop;
    qry := TQuery.Create(nil);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Clear;
    qry.SQL.Add('select  distinct r.nombrerespuesta as respuesta from enc_respuesta r, enc_consultarespuesta ');
    qry.SQL.Add('cr where r.codigorespuesta=cr.codigorespuesta and r.activo= ''S'' and cr.codigoconsulta= :codigoconsulta');
    qry.ParamByName('codigoconsulta').asInteger:= qConsultaCODIGOCONSULTA.asInteger;
    qry.open;

    

    if qConsultaCODIGOTIPOCONSULTA.asInteger = 3 then
    begin
   // RadioGroup1.Visible := true;
    while not qry.eof do
    begin

    r := TRadioButton.Create(sbRespuesta);
    r.Parent := sbRespuesta;
    r.Caption := qry.fieldByName('respuesta').asString;
    r.Align := alTop;
    r.Width :=200;
    Listado.add(r);

    qry.next;
    end;

    end
    else if qConsultaCODIGOTIPOCONSULTA.asInteger = 4 then
   // RadioGroup1.Visible := false;
    begin
    while not qry.eof do
    begin
    panel := TPanel.Create(sbRespuesta);
    panel.Parent := sbRespuesta;
    panel.Align :=alTop;
    panel.BevelInner :=bvNone;
    panel.BevelOuter := bvNone;
    panel.Width := 300;
    panel.Height := 23;
    c := TCheckBox.Create(panel);
    c.Parent := panel;

    c.Caption := qry.fieldByName('respuesta').asString;
    c.Width :=200;
    Listado.add(c);
    LPanel.add(panel);
    qry.next;
    end;
    end;

     qry.close;
    qry.free;

end;






procedure TFDashboardAvisos.tbFechaRepartoClick(Sender: TObject);
begin
pgConsultas.ActivePage := tbCRUD;
end;

procedure TFDashboardAvisos.tbElementosClick(Sender: TObject);
begin
pgConsultas.ActivePage := tbAsignar;
qElementos.open;
qConsulta2.close;
 qConsulta2.open;
 qConsultaElemento.open;

end;

procedure TFDashboardAvisos.FormShow(Sender: TObject);
var
page : integer;
begin
Listado := TList.Create();
LPanel := TList.Create();

for page := 0 to pgConsultas.PageCount - 1 do
begin
pgConsultas.Pages[page].TabVisible := false;
end;
pgConsultas.ActivePage := tbCRUD;

qConsulta.open;
qRespuesta.OPEN;



end;



procedure TFDashboardAvisos.qConsultaAfterScroll(DataSet: TDataSet);
var
respuesta :string;

begin
qConsultaRespuesta.close;
qConsultaRespuesta.ParamByName('CODIGOCONSULTA').AsString := qConsultaCODIGOCONSULTA.AsString;
qConsultaRespuesta.open;
if (qTipoConsultaCODIGOTIPOCONSULTA.AsString ='3') or (qTipoConsultaCODIGOTIPOCONSULTA.AsString ='4') then
begin
btnAsignar.enabled :=true;
btnRemover.enabled :=true;
end;

edConsulta.text := qConsultaCONSULTA.asString;
lblConsultaPrevisualizacion.Caption := 'Descripción consulta: '+ qConsultaCONSULTA.asstring;
lblConsultaPrevisualizacion.Height :=40;
lblCat.Caption := 'Categoria: '+qConsultaNOMBRECATEGORIA.AsString;
qCategoria.open;
qTipoConsulta.open;
 GenerarRespuestas;

if qConsultaACTIVO.asstring ='S' THEN
begin
cbActivo.Checked := true;
end
else
begin
cbActivo.Checked := false;
end;
if qConsultaFOTOGRAFIA.asstring ='S' THEN
begin
cbFotografia.Checked :=true;
end
else
begin
cbFotografia.Checked :=false;
end;
end;

procedure TFDashboardAvisos.qConsultaCalcFields(DataSet: TDataSet);
begin
qConsultaCONSULTA.AsString := qConsultaNOMBRECONSULTA.asstring;
if qConsultaACTIVO.asstring ='S' THEN
begin
qConsultaESTADO.AsString := 'SI';
cbActivo.Checked := true;
end
else if qConsultaACTIVO.asstring ='N' THEN
begin
qConsultaESTADO.AsString := 'NO';
cbActivo.Checked := false;
end;
if qConsultaFOTOGRAFIA.asstring ='S' THEN
begin
qConsultaREQUIEREFOTO.AsString := 'SI';
cbFotografia.Checked :=true;
end
else if qConsultaFOTOGRAFIA.asstring ='N' THEN
begin
qConsultaREQUIEREFOTO.AsString := 'NO';
cbFotografia.Checked :=false;
end ;



end;

procedure TFDashboardAvisos.qConsultaAfterOpen(DataSet: TDataSet);
begin
lblConsultaPrevisualizacion.Caption := 'Descripción consulta: '+ qConsultaCONSULTA.asstring;
//GenerarRespuestas;
if qConsultaACTIVO.asstring ='S' THEN
begin
cbActivo.Checked := true;
end
else
begin
cbActivo.Checked := false;
end;
if qConsultaFOTOGRAFIA.asstring ='S' THEN
begin
cbFotografia.Checked :=true;
end
else
begin
cbFotografia.Checked :=false;
end;
end;

procedure TFDashboardAvisos.tbEliminarClick(Sender: TObject);
var
qry,qry1 : TQuery;
bm1: TBookmark;
begin
if Application.MessageBox
          (pchar('¿Está seguro que desea eliminar la consulta actual?'), 'Confirmar', MB_ICONQUESTION + MB_YESNO
          + MB_DEFBUTTON2) = IDYES then
 begin
 if ValidarExportado then
 begin
 qry := TQuery.Create(nil);
 qry.DataBaseName := 'BaseDato';
 qry.sql.Add('DELETE FROM ENC_CONSULTARESPUESTA  e WHERE CODIGOCONSULTA=:CODIGOCONSULTA');
 qry.ParamByName('CODIGOCONSULTA').AsString := qConsultaCODIGOCONSULTA.asString;
 qry.ExecSQL;


 qry1 := TQuery.Create(nil);
 qry1.DataBaseName := 'BaseDato';
 qry1.sql.Add('DELETE FROM ENC_CONSULTA WHERE CODIGOCONSULTA=:CODIGOCONSULTA');
 qry1.ParamByName('CODIGOCONSULTA').AsString := qConsultaCODIGOCONSULTA.asString;
 qry1.ExecSQL;

    if qry1.RowsAffected >0 then
                 begin
                 Application.MessageBox(Pchar('Se ha eliminado la consulta'),
                 Pchar('Información'), MB_OK + MB_ICONINFORMATION);
                 
                  qConsulta.close;
                  qConsulta.open;

                 end
                 else
                 begin
                 Application.MessageBox
                 ('No fue posible eliminar la consulta, por favor intente nuevamente',
                 'Error', MB_ICONERROR + MB_OK);
                 end;



 end
 else
 begin
 //mensaje de que ya esta exportado
 Application.MessageBox
        ('No es posible, ya que la consulta se ha exportado al menos una vez.',
        'Error', MB_ICONERROR + MB_OK);
 end;
 end;

end;

function TFDashboardAvisos.ValidarExportado: Boolean;
var
qry : TQuery;
begin
 result :=false;
 qry := TQuery.Create(nil);
 qry.DataBaseName := 'BaseDato';
 qry.sql.Add('SELECT count(*) as CANTIDAD FROM enc_totalesporconsulta WHERE CODIGOCONSULTA = :CODIGOCONSULTA ');
 qry.sql.Add('and codigoconsulta not in (select codigoconsulta from  enc_elementoconsulta where estadoconsulta in (1,2))');
 qry.ParamByName('CODIGOCONSULTA').AsString := qConsultaCODIGOCONSULTA.asString;
 qry.open;
    if qry.FieldByName('CANTIDAD').AsInteger >0 then
    begin
    result := false;
    end
    else
    begin
    result :=true;
    end;
end;

function TFDashboardAvisos.CantidadRespuestas: string;
var
qry :TQuery;
begin
 qry := TQuery.Create(nil);
 qry.DataBaseName := 'BaseDato';
 qry.sql.Add('SELECT  count(*) AS CANTIDAD FROM ENC_RESPUESTA R , enc_consultarespuesta cr');
qry.sql.Add('WHERE R.codigorespuesta= cr.codigorespuesta  ');
qry.sql.Add('and cr.codigoconsulta= :codigoconsulta');
 qry.ParamByName('CODIGOCONSULTA').AsString := qConsultaCODIGOCONSULTA.asString;
 qry.open;
 result := qry.fieldByName('CANTIDAD').asstring;
end;
procedure TFDashboardAvisos.tbCrearClick(Sender: TObject);
begin

if tbCrear.down = false then
begin

edConsulta.readOnly :=false;
cbActivo.enabled := true;
cbFotografia.enabled := true;
edConsulta.text := '';

LimpiarPrevisualizacion;

cbActivo.checked := false;
cbFotografia.checked := false;
dbLookTipo.enabled := true;
dbLookupCategoria.enabled := true;

tbCrear.down := true;
DBGrid1.enabled :=false;
qconsulta.Insert;
end;
end;

procedure TFDashboardAvisos.tbGuardarClick(Sender: TObject);
var
qry, qry1 : TQuery;
CodigoConsulta : String;
begin
edConsulta.readOnly :=true;
cbActivo.enabled := true;
cbFotografia.enabled := true;
 if tbCrear.down =true then
 begin
 //hacer si esta agregando
 if (dbLookTipo.text <>'' ) and (dbLookupCategoria.text <>'') and (edconsulta.text <>'') then
 begin
 CodigoConsulta := GenerarCodigoConsulta(true);
  qry := TQuery.Create(nil);
  qry.DatabaseName := 'BaseDato';
  qry.SQL.Clear;
  qry.SQL.Add('Insert into enc_consulta(CODIGOCONSULTA,NOMBRECONSULTA,CODIGOCATEGORIA,ACTIVO,FOTOGRAFIA,CODIGOTIPOCONSULTA) ');
  qry.SQL.Add('values (:CODIGOCONSULTA,:NOMBRECONSULTA,:CODIGOCATEGORIA,:ACTIVO,:FOTOGRAFIA,:CODIGOTIPOCONSULTA)');

  qry.ParamByName('CODIGOCONSULTA').AsString := CodigoConsulta;
  qry.ParamByName('NOMBRECONSULTA').AsString := edconsulta.text;
  qry.ParamByName('CODIGOCATEGORIA').AsString :=  dbLookupCategoria.KeyValue;
  if cbActivo.checked = true then
  begin
  qry.ParamByName('ACTIVO').AsString :='S';
  end
  else
  begin
  qry.ParamByName('ACTIVO').AsString :='N';
  end;
  if cbFotografia.checked = true then
  begin
  qry.ParamByName('FOTOGRAFIA').AsString :='S';
  end
  else
  begin
  qry.ParamByName('FOTOGRAFIA').AsString :='N';
  end;
  qry.ParamByName('CODIGOTIPOCONSULTA').AsString := qTipoconsultaCODIGOTIPOCONSULTA.AsString ;
  qry.execSQL;

   if qry.RowsAffected >0 then
   begin
   Application.MessageBox(Pchar('Se ha creado la consulta satisfactoriamente'),
                 Pchar('Información'), MB_OK + MB_ICONINFORMATION);
   qconsulta.close;
   qconsulta.open;
   qConsulta.last;

   end
   else
   begin
   Application.MessageBox
        ('No es posible crear la consulta, verifique la información',
        'Error', MB_ICONERROR + MB_OK);

   end;
  CodigoConsulta:='';

 tbCrear.down := false;
 DBGrid1.enabled :=true;


 end
 else   //campos vacios
 begin
 edConsulta.readOnly :=FALSE;
 Application.MessageBox
        ('No es posible guardar la consulta, ya que hace falta información',
        'Error', MB_ICONERROR + MB_OK);
 end;
 end
 else if tbEditar.Down =true then
 begin

 // hacer si esta editando

  if (dbLookTipo.text <>'' ) and (dbLookupCategoria.text <>'') and (edconsulta.text <>'') and (ValidarExportado= true) then
 begin

  qry := TQuery.Create(nil);
  qry.DatabaseName := 'BaseDato';
  qry.SQL.Clear;
  qry.SQL.Add('update ENC_CONSULTA set NOMBRECONSULTA = :NOMBRECONSULTA, CODIGOCATEGORIA = :CODIGOCATEGORIA,');
  qry.SQL.Add(' ACTIVO = :ACTIVO, FOTOGRAFIA = :FOTOGRAFIA,CODIGOTIPOCONSULTA = :CODIGOTIPOCONSULTA where CODIGOCONSULTA = :OLD_CODIGOCONSULTA');
  qry.ParamByName('OLD_CODIGOCONSULTA').AsString := qConsultaCODIGOCONSULTA.AsString;
  qry.ParamByName('NOMBRECONSULTA').AsString := edconsulta.text;
  qry.ParamByName('CODIGOCATEGORIA').AsString :=  dbLookupCategoria.KeyValue;
  if cbActivo.checked = true then
  begin
  qry.ParamByName('ACTIVO').AsString :='S';
  end
  else
  begin
  qry.ParamByName('ACTIVO').AsString :='N';
  end;
  if cbFotografia.checked = true then
  begin
  qry.ParamByName('FOTOGRAFIA').AsString :='S';
  end
  else
  begin
  qry.ParamByName('FOTOGRAFIA').AsString :='N';
  end;
  qry.ParamByName('CODIGOTIPOCONSULTA').AsString := qTipoconsultaCODIGOTIPOCONSULTA.AsString ;
  qry.execSQL;

   if qry.RowsAffected >0 then
   begin
   Application.MessageBox(Pchar('Se ha editado la consulta satisfactoriamente'),
                 Pchar('Información'), MB_OK + MB_ICONINFORMATION);
   qconsulta.close;
   qconsulta.open;
   qConsulta.last;

   end
   else
   begin
   Application.MessageBox
        ('No es posible editar la consulta, verifique la información',
        'Error', MB_ICONERROR + MB_OK);
   end;

 end
 else   //campos vacios
 begin
 Application.MessageBox
        ('No es posible guardar la consulta, ya que hace falta información o ya se encuentra exportado.',
        'Error', MB_ICONERROR + MB_OK);
 end;
 tbEditar.down := false;
 DBGrid1.enabled :=true;
 end;
end;

procedure TFDashboardAvisos.dbLookupCategoriaClick(Sender: TObject);
begin
if tbCrear.Down =true then
begin


end;
end;
function TFDashboardAvisos.GenerarCodigoConsulta(Bandera: Boolean): string;
var
Qry :TQuery;
begin
Qry := TQuery.Create(nil);
Qry.DataBaseName := 'BaseDato';
Qry.sql.Add('select (MAX(codigoconsulta)+1) as codigoconsulta from enc_consulta');
Qry.open;
result := Qry.FieldByName('codigoconsulta').asstring;
end;

procedure TFDashboardAvisos.btnSeleccionarClick(Sender: TObject);
var
tabla,nombre,codigo,condicion: string;
begin
nombre :='';
 tabla := GenerarTabla(nombre,codigo,condicion);

fElementosConsulta:=TfElementosConsulta.Create(Application,qElementosNOMBREELEMENTO.AsString,tabla,codigo,nombre,condicion);
fElementosConsulta.ShowModal;

IF fElementosConsulta.ModalResult = mrOK then
begin


lblReferenciaElemento.Caption :=fElementosConsulta.codigo;
fElementosConsulta.Free;
end;
end;

procedure TFDashboardAvisos.btnAsignarClick(Sender: TObject);
begin
 if qConsultaCODIGOTIPOCONSULTA.asinteger in  [3,4] then
begin
qCantidadRespuestas.open;
if ValidarExisteRespuesta(true) then
begin
if ValidarExportado then
begin
if Application.MessageBox
        (Pchar('¿Está seguro que desea asignar la respuesta seleccionada a la consulta actual? '),
        'Confirmación', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
begin

     qInsertRespuesta.CLOSE;
     qInsertRespuesta.paramByName('CODIGOCONSULTA').AsString := qConsultaCodigoConsulta.AsString;
     qInsertRespuesta.paramByName('CODIGORESPUESTA').AsString := qRespuestaCodigoRespuesta.AsString;
     qInsertRespuesta.ExecSQL;

     if qInsertRespuesta.rowsAffected >0 then
     begin
     Application.MessageBox(Pchar('Se ha asignado la respuesta: ['+qRespuestaNOMBRERESPUESTA.AsString+']'),
          Pchar('Información'), MB_OK + MB_ICONINFORMATION);
     qConsultaRespuesta.close;
     qConsultaRespuesta.open;
     Generarrespuestas;
     end
     else
     begin
     Application.MessageBox
        ('No es posible Asignar la respuesta , ya que hace falta información',
        'Error', MB_ICONERROR + MB_OK);
     end;

end;
end;
end //ya se ha viculado
else
begin
Application.MessageBox
        ('No es posible Asignar una respuesta ya asignada',
        'Error', MB_ICONERROR + MB_OK);
end;
qCantidadRespuestas.close;
end    //otro tipo
else
begin
Application.MessageBox
        ('No es posible Asignar la respuesta , verifique el tipo de consulta',
        'Error', MB_ICONERROR + MB_OK);
end;


end;

procedure TFDashboardAvisos.btnRemoverClick(Sender: TObject);
var
qry :TQuery;
begin
if ValidarExportado then
begin
if Application.MessageBox
        (Pchar('¿Está seguro que desea remover la respuesta seleccionada de la consulta actual? '),
        'Confirmación', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
begin
     if ValidarExportado then
     begin
     qry := TQuery.Create(nil);
     qry.DataBaseName := 'BaseDato';
     qry.sql.Add('DELETE FROM ENC_CONSULTARESPUESTA  e WHERE CODIGOCONSULTA=:CODIGOCONSULTA and CODIGORESPUESTA=:CODIGORESPUESTA');
     qry.ParamByName('CODIGOCONSULTA').AsString := qConsultarespuestaCODIGOCONSULTA.asString;
     qry.ParamByName('CODIGORESPUESTA').AsString := qConsultarespuestaCODIGORESPUESTA.asString;
     qry.ExecSQL;

                 if qry.RowsAffected >0 then
                 begin
                 Application.MessageBox(Pchar('Se ha removido la respuesta seleccionada de la consulta'),
                 Pchar('Información'), MB_OK + MB_ICONINFORMATION);
                 qConsultaRespuesta.close;
                 qConsultaRespuesta.open;
                 end
                 else
                 begin
                 Application.MessageBox
                 ('No fue posible remover la respuesta, por favor intente nuevamente',
                 'Error', MB_ICONERROR + MB_OK);
                 end;
     end;
end;
end;
end;

function TFDashboardAvisos.LimpiarPrevisualizacion: Boolean;
var
i: integer;
begin
for i := Listado.count-1 downto 0 do
 begin

   IF  TObject(Listado[i]).ClassName = 'TRadioButton' then
   begin
      TRadioButton(Listado[i]).free;
   end
   else if TObject(Listado[i]).ClassName = 'TCheckBox' then
   begin
   TCheckBox(Listado[i]).free;
   TPanel(LPanel[i]).free;

   end;
 end;
end;

procedure TFDashboardAvisos.tbEditarClick(Sender: TObject);
begin
if tbEditar.down = false then
begin

cbActivo.enabled := true;
cbFotografia.enabled := true;
dbLookTipo.enabled := true;
dbLookupCategoria.enabled := true;

edConsulta.readOnly :=false;
tbEditar.down := true;
DBGrid1.enabled :=false;
qconsulta.Edit;
end;
end;

procedure TFDashboardAvisos.qTipoConsultaAfterScroll(DataSet: TDataSet);
begin
if qTipoConsultaCODIGOTIPOCONSULTA.AsString = '1' then
begin
cbFotografia.enabled := false;
end
else
begin
cbFotografia.enabled := true;
end;


end;

procedure TFDashboardAvisos.qElementosAfterScroll(DataSet: TDataSet);
var
tabla,nombre: string;
qry: TQuery;
begin

lblTipoelemento.Caption := 'Tipo de elemento: '+qElementosNOMBREELEMENTO.AsString;
if qELEMENTOSCODIGOTIPOELEMENTO.AsString = '2' then
begin
edNombreGrupo.color := clInactiveCaption;
edNombreGrupo.enabled := false ;
btnSeleccionar.enabled :=false;
btnCargarArchivo.enabled := false;
edCuenta.color := clInactiveCaption;
edCuenta.enabled := false;
lblGrupo.Font.Style := [];
lblReferenciaElemento.Caption := 'Referencia: ' +'TODO EL PAIS';

end
else if qELEMENTOSCODIGOTIPOELEMENTO.AsString = '22' then
begin
edCuenta.color := clInactiveCaption;
edCuenta.enabled := false;
edNombreGrupo.color := clWindow;
edNombreGrupo.enabled := true ;
lblGrupo.Font.Style := [fsBold];
btnCargarArchivo.enabled := true;
btnSeleccionar.enabled := true;
lblReferenciaElemento.Caption := '';
end
else if qELEMENTOSCODIGOTIPOELEMENTO.AsString = '23' then
begin
edCuenta.color := clWindow;
edCuenta.enabled := true;
edNombreGrupo.color := clInactiveCaption;
btnCargarArchivo.enabled := false;
btnSeleccionar.enabled := false;
edNombreGrupo.enabled := false ;
lblReferenciaElemento.Caption := '';
lblGrupo.Font.Style := [];
end
else
begin
btnSeleccionar.enabled :=true;
edCuenta.color := clInactiveCaption;
edCuenta.enabled := false;
edNombreGrupo.color := clInactiveCaption;
edNombreGrupo.enabled := false ;
lblReferenciaElemento.Caption := '';
lblGrupo.Font.Style := [];
end;


end;

function TFDashboardAvisos.GenerarTabla(var NombreCampo,Codigocampo,Condicion: String): string;
begin

if qELEMENTOSCODIGOTIPOELEMENTO.AsString = '3' then
begin
Codigocampo := 'CODIGOSEDEOPERATIVA';
NombreCampo :='NOMBRESEDEOPERATIVA';
Condicion := ' ACTIVO = ''S''';
result := 'SEDEOPERATIVA';

end
else if qELEMENTOSCODIGOTIPOELEMENTO.AsString = '4' then
begin
NombreCampo :='codigogrupoaol';
Codigocampo := 'codigogrupoaol';
result := 'c_grupoaol';
Condicion := ' 1=1';
end
else if qELEMENTOSCODIGOTIPOELEMENTO.AsString = '5' then
begin
NombreCampo :='codigoitinerario';
Codigocampo :='codigoitinerario';
result := 'sgc_itinerario';
Condicion := ' 1=1';
end
else if qELEMENTOSCODIGOTIPOELEMENTO.AsString = '6' then
begin
NombreCampo :='nombresubestacion';
Codigocampo :='CODIGOSUBESTACION';
result := 'subestacion';
Condicion := ' 1=1';
end
else if qELEMENTOSCODIGOTIPOELEMENTO.AsString = '7' then
begin
Codigocampo := 'codigocircuito';
NombreCampo :='NOMBRECIRCUITO'; 
result := 'circuito';
Condicion := ' 1=1';
end
else if qELEMENTOSCODIGOTIPOELEMENTO.AsString = '22' then
begin
NombreCampo :='DESCRIPCION';
Codigocampo := 'CODIGOGRUPOCLIENTE';
result := 'ENC_GRUPOCLIENTE';
Condicion := ' 1=1';
end;


end;

procedure TFDashboardAvisos.btnCargarArchivoClick(Sender: TObject);
var
  cadena, grupo, fechalectura,TextoError: string;
  i, j, total, apta, error: Integer;
  bandera: boolean;
begin
if edNombreGrupo.text <> '' then
begin
  if OpenDialog1.Execute then
  begin

    try
      vFile.LoadFromFile(OpenDialog1.FileName);
      grupo :=inttostr(GenerarGrupoClientes(true));
      LimpiarTablaImportacion;
      total := vFile.Count;
      error := 0;
      apta:= 0;

      if vfile.count >0 then
      begin
      for i := 0 to vFile.Count - 1 do
      begin

      cadena :=StringReplace(vFile[i],'"','',[rfReplaceAll]);
      if EsNumero(cadena)= true then
    begin

    if (length(trim(cadena))=7)   then bandera:=InsertarListaClienteEspecial(grupo,trim(cadena));
      end;
      end;
      fFormaEspere := TfFormaEspere.Create(Application);
      fFormaEspere.ProgressBar1.Max := 2;
      fFormaEspere.lbMotivo.Caption := 'Recargando información...';
      fFormaEspere.Show;
      fFormaEspere.Refresh;
      fFormaEspere.ProgressBar1.Position := 1;
      fFormaEspere.Refresh;
      ProcCargue.prepare;
      ProcCargue.ParamByName('CODIGOGRUPOCLIENTE').AsInteger :=strtoint(grupo);
      ProcCargue.ExecProc;
      fFormaEspere.lbMotivo.Caption := 'Importando datos...';
      fFormaEspere.ProgressBar1.Position := 2;
      fFormaEspere.Refresh;


      fFormaEspere.Free;
      apta := TotalImportados(strtoint(grupo));
      end
      else Application.MessageBox(Pchar('El archivo se encuentra vacío '), Pchar('Información'), MB_OK + MB_ICONINFORMATION);
    finally
    lblReferenciaElemento.caption := grupo;
      Application.MessageBox(Pchar('Se ha creado el grupo: '+edNombreGrupo.text+' y se han cargado ' + inttostr(apta) +
        ' Cuentas '), Pchar('Información'), MB_OK + MB_ICONINFORMATION);
    end;
    LimpiarTablaImportacion;
  end;
end
else
begin
Application.MessageBox(Pchar('Por favor ingrese el nombre del grupo '), Pchar('Información'), MB_OK + MB_ICONINFORMATION);
end;

end;

function TFDashboardAvisos.InsertarListaClienteEspecial(grupo,cadena: String): Boolean;
var
  qry: TQuery;
begin
Result := False;
  inherited;
  try
    qry := TQuery.Create(nil);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Clear;
    qry.SQL.Add('INSERT INTO ENC_TEMPORAL_CLIENTESCONSULTA (CADENA,CODIGOGRUPOCLIENTE) values('+cadena+','+grupo+')');
    qry.execSQL;
    result:=true;

  finally
  qry.free;
  end;
end;

procedure TFDashboardAvisos.FormCreate(Sender: TObject);
begin
  inherited;
vFile := TStringList.Create;

end;

function TFDashboardAvisos.GenerarGrupoClientes(Bandera: Boolean): integer;
var
qry :TQuery;
codigo : string;
begin
inherited;
  try
    codigo :=GenerarCodigoGrupoCliente(true);
    qry := TQuery.Create(nil);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Clear;
    qry.SQL.Add('INSERT INTO ENC_GRUPOCLIENTE (CODIGOGRUPOCLIENTE,DESCRIPCION,FECHACREACION,USUARIO) VALUES ('+codigo+','''+edNombreGrupo.text+''',sysdate,GETCODIGOUSUARIO)');
    qry.execSQL;
    result:=strtoint(codigo);

  finally
  qry.free;
  end;
end;

function TFDashboardAvisos.GenerarCodigoGrupoCliente(Bandera: Boolean): string;
var
Qry :TQuery;
begin
Qry := TQuery.Create(nil);
Qry.DataBaseName := 'BaseDato';
Qry.sql.Add('select (MAX(CODIGOGRUPOCLIENTE)+1) as CODIGOGRUPOCLIENTE from ENC_GRUPOCLIENTE');
Qry.open;
result := Qry.FieldByName('CODIGOGRUPOCLIENTE').asstring;
end;


function TFDashboardAvisos.TotalImportados(codigo: Integer): integer;
var
Qry :TQuery;
begin
Qry := TQuery.Create(nil);
Qry.DataBaseName := 'BaseDato';
Qry.sql.Add('select count(*) as cantidad from enc_cliente where codigogrupocliente=:codigo');
Qry.ParamByName('codigo').Asstring := inttostr(codigo);
Qry.open;
result := Qry.FieldByName('cantidad').asInteger;
end;

procedure TFDashboardAvisos.btnGuardarClick(Sender: TObject);
begin

if  (ePeriodo.text <> '') and (lblReferenciaElemento.caption <> '') then
begin

if qELEMENTOSCODIGOTIPOELEMENTO.AsString = '2' then
   begin
   //todo el pais
   InsertarConsultaElemento('1');
   end
else if qELEMENTOSCODIGOTIPOELEMENTO.AsString = '22' then
   begin
   InsertarConsultaElemento(lblReferenciaElemento.caption);
   //grupo clientes
   end
else if qELEMENTOSCODIGOTIPOELEMENTO.AsString = '23' then
   begin
   //solo
   if EsNumero(edcuenta.text)=true then
   begin
   InsertarConsultaElemento(edcuenta.text);
   end
   else
   begin
    Application.MessageBox
                 ('No fue posible asignar la cuenta, verifique la cuenta. ' ,'Error', MB_ICONERROR + MB_OK);
   end;
      end
      else
      begin
      InsertarConsultaElemento(lblReferenciaElemento.caption);
      end;
 qconsultaelemento.close;
 qconsultaelemento.open;     
 end
 else
 begin
Application.MessageBox
                 ('No fue posible Guardar, verifique los elementos.',
                 'Error', MB_ICONERROR + MB_OK);
 end;
end;

procedure TFDashboardAvisos.LimpiarTablaImportacion;
var qry: tquery;
begin

    try
    qry := TQuery.Create(nil);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Clear;
    qry.SQL.Add('DELETE  FROM ENC_TEMPORAL_CLIENTESCONSULTA WHERE CADENA IS NOT NULL ');
    qry.execSQL;
 
    finally
  qry.free;
  end;
end;

procedure TFDashboardAvisos.SpeedButton2Click(Sender: TObject);
var
  sPeriodo, sFecha: String;
begin
sFecha := ePeriodo.Text;
ePeriodo.Text := GetFecha;

lblPeriodo.caption := 'Periodo: '+ ePeriodo.Text;
end;

function TFDashboardAvisos.InsertarConsultaElemento(elemento: string): Boolean;
var
qry :TQuery;
begin
inherited;
  try
    qry := TQuery.Create(nil);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Clear;
    qry.SQL.Add('INSERT INTO enc_elementoconsulta (CODIGOCONSULTA,PERIODO,CONSECUTIVO,CODIGOELEMENTO,CODIGOTIPOELEMENTO,FECHACREACION,ESTADOCONSULTA) ');
    qry.SQL.Add('VALUES ('+qConsulta2CODIGOCONSULTA.AsString+','+ePeriodo.text+','+GenerarConsecutivo(true)+','+QuotedStr(elemento)+','+qElementosCODIGOTIPOELEMENTO.AsString+',sysdate,1)');
    qry.execSQL;
    result:=true;
    Application.MessageBox(Pchar('Se ha guardado con éxito. '), Pchar('Información'), MB_OK + MB_ICONINFORMATION);

  finally
  qry.free;
  end;
end;

procedure TFDashboardAvisos.tbExportarClick(Sender: TObject);
var
qry :TQuery;
begin
inherited;
  if Application.MessageBox
        (Pchar('¿Está seguro que desea exportar la consulta seleccionada? '),
        'Confirmación', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = mrYes then
begin

  try

    qry := TQuery.Create(nil);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Clear;
    qry.SQL.Add('UPDATE enc_elementoconsulta set estadoconsulta=2 WHERE codigoconsulta='+qConsultaElementoCODIGOCONSULTA.AsString+' and');
    qry.SQL.Add('periodo= '+qConsultaElementoPERIODO.AsString+'AND estadoconsulta=1');
    qry.execSQL;

    fFormaEspere := TfFormaEspere.Create(Application);
      fFormaEspere.ProgressBar1.Max := 2;
      fFormaEspere.lbMotivo.Caption := 'Recargando información...';
      fFormaEspere.Show;
      fFormaEspere.Refresh;
      fFormaEspere.ProgressBar1.Position := 1;
      fFormaEspere.Refresh;
      ProExportacion.prepare;
      ProExportacion.ParamByName('var_codigousuario').asInteger :=GetUsuario(true);
      ProExportacion.ParamByName('var_pgi').AsString :=FileVersionGet('Administrativo.pgi');

      ProExportacion.ExecProc;
      fFormaEspere.lbMotivo.Caption := 'Importando datos...';
      fFormaEspere.ProgressBar1.Position := 2;
      fFormaEspere.Refresh;

      fFormaEspere.Free;

       qConsultaElemento.close;
       qConsultaElemento.open;

       Application.MessageBox(Pchar('La exportación ha finalizado con éxito. '), Pchar('Información'), MB_OK + MB_ICONINFORMATION);

  finally
  qry.free;
  end;
end;

end;

function TFDashboardAvisos.FileVersionGet( const sgFileName : string ) : string;
var infoSize: DWORD;
var verBuf:   pointer;
var verSize:  UINT;
var wnd:      UINT;
var FixedFileInfo : PVSFixedFileInfo;
begin
  infoSize := GetFileVersioninfoSize(PChar(sgFileName), wnd);

  result := '';

  if infoSize <> 0 then
  begin
    GetMem(verBuf, infoSize);
    try
      if GetFileVersionInfo(PChar(sgFileName), wnd, infoSize, verBuf) then
      begin
        VerQueryValue(verBuf, '\', Pointer(FixedFileInfo), verSize);

        result := IntToStr(FixedFileInfo.dwFileVersionMS div $10000) + '.' +
                  IntToStr(FixedFileInfo.dwFileVersionMS and $0FFFF) + '.' +
                  IntToStr(FixedFileInfo.dwFileVersionLS div $10000) + '.' +
                  IntToStr(FixedFileInfo.dwFileVersionLS and $0FFFF);
      end;
    finally
      FreeMem(verBuf);
    end;
  end;
end;

function TFDashboardAvisos.GenerarConsecutivo(Bandera: Boolean): string;
var
Qry :TQuery;
begin
Qry := TQuery.Create(nil);
Qry.DataBaseName := 'BaseDato';
Qry.sql.Add('select decode((MAX(consecutivo)+1),null,1,(MAX(consecutivo)+1)) as consecutivo from enc_elementoconsulta where CODIGOCONSULTA= '+qConsulta2CODIGOCONSULTA.AsString +' and PERIODO='+ ePeriodo.text+'');
Qry.open;
result := Qry.FieldByName('consecutivo').asstring;

end;

function TFDashboardAvisos.GetUsuario(Bandera: Boolean): integer;
var
Qry :TQuery;
begin
Qry := TQuery.Create(nil);
Qry.DataBaseName := 'BaseDato';
Qry.sql.Add('select getcodigousuario as usuario from dual ');
Qry.open;
result := Qry.FieldByName('usuario').asInteger;
end;



procedure TFDashboardAvisos.qConsulta2CalcFields(DataSet: TDataSet);
begin
qConsulta2NOMBRE.AsString := qconsulta2NOMBRECONSULTA.AsString;
end;

procedure TFDashboardAvisos.qConsultaElementoCalcFields(DataSet: TDataSet);
begin
qConsultaElementoNOMBRE.AsString := qConsultaElementoNOMBRECONSULTA.asstring;

end;

procedure TFDashboardAvisos.edCuentaChange(Sender: TObject);
begin
lblReferenciaElemento.caption := 'Referencia: ' +edCuenta.text;
end;

procedure TFDashboardAvisos.edNombreGrupoChange(Sender: TObject);
begin
lblReferenciaElemento.caption := edNombreGrupo.text;
btnCargarArchivo.enabled :=true;

end;

procedure TFDashboardAvisos.qConsulta2AfterScroll(DataSet: TDataSet);
begin
lblconsulta.caption := 'Consulta: '+qConsulta2NOMBRE.AsString; 
end;

function TFDashboardAvisos.ValidarExisteRespuesta(
  Bandera: Boolean): Boolean;
var
Qry :TQuery;
begin
result :=true;
Qry := TQuery.Create(nil);
Qry.DataBaseName := 'BaseDato';
Qry.sql.Add('select count(*) AS CANTIDAD from ENC_CONSULTARESPUESTA WHERE CODIGOCONSULTA=:CODIGOCONSULTA AND CODIGORESPUESTA=:CODIGORESPUESTA ');
Qry.ParamByName('CODIGOCONSULTA').Asstring := qConsultaCodigoConsulta.AsString;
Qry.ParamByName('CODIGORESPUESTA').Asstring :=  qRespuestaCodigoRespuesta.AsString;
Qry.open;

if qry.fieldByName('cantidad').AsInteger >0 then
    result := false;


end;

function TFDashboardAvisos.ValidarExportadoElementoConsulta(
  Bandera: Boolean): Boolean;
var
Qry :TQuery;
begin
result :=false;
Qry := TQuery.Create(nil);
Qry.DataBaseName := 'BaseDato';
Qry.sql.Add('select count(*) AS CANTIDAD from ENC_ELEMENTOCONSULTA WHERE CODIGOCONSULTA=:CODIGOCONSULTA AND PERIODO=:PERIODO AND CONSECUTIVO=:CONSECUTIVO AND ESTADOCONSULTA=3  ');
Qry.ParamByName('CODIGOCONSULTA').Asstring := qConsultaElementoCodigoConsulta.AsString;
Qry.ParamByName('PERIODO').Asstring :=  qConsultaElementoPERIODO.AsString;
Qry.ParamByName('CONSECUTIVO').Asstring := qConsultaElementoCONSECUTIVO.AsString;
Qry.open;
if qry.fieldByName('cantidad').AsInteger >0 then
    result := true;
end;

procedure TFDashboardAvisos.EliminarElementoClick(Sender: TObject);
var
qry: TQuery;
begin
  inherited;
if ValidarExportadoElementoConsulta(true) then
begin
Application.MessageBox(Pchar('la consulta y el elemento ya se encuentran exportados '), Pchar('Información'), MB_OK + MB_ICONINFORMATION);
end
else
begin
qry := TQuery.Create(nil);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Clear;
    qry.SQL.Add('DELETE  FROM ENC_ELEMENTOCONSULTA WHERE CODIGOCONSULTA=:CODIGOCONSULTA AND PERIODO=:PERIODO AND CONSECUTIVO=:CONSECUTIVO ');
    qry.ParamByName('CODIGOCONSULTA').Asstring := qConsultaElementoCodigoConsulta.AsString;
    qry.ParamByName('PERIODO').Asstring :=  qConsultaElementoPERIODO.AsString;
    qry.ParamByName('CONSECUTIVO').Asstring := qConsultaElementoCONSECUTIVO.AsString;
    qry.execSQL;
    Application.MessageBox(Pchar('La consulta se ha eliminado. '), Pchar('Información'), MB_OK + MB_ICONINFORMATION);
    qConsultaelemento.close;
    qconsultaelemento.open;

end;
end;

function TFDashboardAvisos.EsNumero(cadena: string): Boolean;
begin
Result := True;
  try
    StrToInt(cadena);
  except
    Result := False;
  end;
end;

procedure TFDashboardAvisos.ToolButton1Click(Sender: TObject);
begin
AbrirMaestroRespuestas;
end;

procedure TFDashboardAvisos.tbCategoriasClick(Sender: TObject);
begin
AbrirMaestroCategorias;
end;

procedure TFDashboardAvisos.BitBtn1Click(Sender: TObject);
begin
qRespuesta.close;
qRespuesta.open;
end;

procedure TFDashboardAvisos.sbActualizarCategoriasClick(Sender: TObject);
begin
qCategoria.close;
qCategoria.open;
end;

end.



