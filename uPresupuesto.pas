unit uPresupuesto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, Db, DBTables, DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, Consdll,
  utnNewDbgrid, Buttons, ComCtrls, Mask, Menus, QuickRpt, TParser, uFIMPComunes,
  uFuncionSGD,Digisoft;

type
  TfPresupuesto = class(TFBase)
    GroupBox1: TGroupBox;
    Label13: TLabel;
    LCodigoContrato: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label58: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DBECodigoConsecutivo: TDBEdit;
    DBEditCodAno: TDBEdit;
    EdNumeroPresupuesto: TDBEdit;
    DBLCBTipoContrato: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    PanelBotones: TPanel;
    BitBtnAceptar: TBitBtn;
    BitBtnCancelar: TBitBtn;
    BitBtnImprimir: TBitBtn;
    BBCartografia: TBitBtn;
    dsPresupuesto: TDataSource;
    MObjeto: TDBMemo;
    dsEstadoContrato: TDataSource;
    dsTipoContrato: TDataSource;
    dsActividad: TDataSource;
    dsTipoActividad: TDataSource;
    dsEstructura: TDataSource;
    PopupMenuActividades: TPopupMenu;
    AdicionarActividades1: TMenuItem;
    BorrarActividades1: TMenuItem;
    dsMaterial: TDataSource;
    pmImprimirPresupuesto: TPopupMenu;
    PresupuestoObra: TMenuItem;
    ActividadesdelaObra1: TMenuItem;
    MaterialesdelaObra1: TMenuItem;
    QRCompositeReport3: TQRCompositeReport;
    dsFirma: TDataSource;
    DParser1: TDParser;
    qListaApoyo: TQuery;
    Arbol: TTreeView;
    qGeografico: TQuery;
    qPresupuesto: TQuery;
    qEstadoPresupuesto: TQuery;
    qTipoContrato: TQuery;
    updPresupuesto: TUpdateSQL;
    qFirma: TQuery;
    qTipoActividad: TQuery;
    qEstructura: TQuery;
    qMaterial: TQuery;
    qMaterialCODIGOMATERIAL: TFloatField;
    qMaterialNOMBREMATERIAL: TStringField;
    qMaterialCODIGOUNIDAD: TStringField;
    qMaterialVALORUNITARIO: TFloatField;
    qMaterialPESOUNITARIO: TFloatField;
    qMaterialREFERENCIA: TStringField;
    qMaterialPOTENCIA: TFloatField;
    qMaterialNombreUnidad: TStringField;
    qPresupuestoValorIVA: TFloatField;
    qPresupuestoCostoDirecto: TFloatField;
    qPresupuestoCostoTotal: TFloatField;
    qPresupuestoValorMaterial: TFloatField;
    qPresupuestoValorManoObra: TFloatField;
    qPresupuestoValorEquipo: TFloatField;
    qPresupuestoValorTransporte: TFloatField;
    qDivision: TQuery;
    dsDivision: TDataSource;
    qZona: TQuery;
    dsZona: TDataSource;
    qEmpresa: TQuery;
    bbFirmas: TBitBtn;
    qEmpresaCODIGOEMPRESA: TStringField;
    qEmpresaNOMBREEMPRESA: TStringField;
    qEmpresaNOMBREABREVIADO: TStringField;
    qEmpresaNITEMPRESA: TStringField;
    qEmpresaCIUDAD: TStringField;
    qEmpresaREPRESENTANTELEGAL: TStringField;
    qEmpresaLICENCIA: TStringField;
    qEmpresaDIRECCION: TStringField;
    qEmpresaTELEFONOS: TStringField;
    qEmpresaEMAIL: TStringField;
    qEmpresaMISIONEMPRESA: TBlobField;
    qEmpresaCODIGOZONA: TStringField;
    qEmpresaCODIGOCIUDAD: TStringField;
    qEmpresaCODIGOBARRIO: TStringField;
    qActividad: TQuery;
    qActividadCODIGOACTIVIDAD: TStringField;
    qActividadCODIGOESTRUCTURA: TFloatField;
    qActividadMATERIAL: TFloatField;
    qActividadMANOOBRA: TFloatField;
    qActividadTRANSPORTE: TFloatField;
    qActividadEQUIPO: TFloatField;
    qActividadDESCRIPCION: TMemoField;
    qActividadNombreTipoActividad: TStringField;
    qActividadNombreEstructura: TStringField;
    qPresupuestoCODIGOPRESUPUESTO: TFloatField;
    qPresupuestoNUMEROPRESUPUESTO: TStringField;
    qPresupuestoCODIGOESTADOPRESUPUESTO: TStringField;
    qPresupuestoCODIGOTIPOCONTRATO: TStringField;
    qPresupuestoOBJETO: TBlobField;
    qPresupuestoFECHAPRESUPUESTO: TDateTimeField;
    qPresupuestoFECHAASIGNACION: TDateTimeField;
    qPresupuestoADMINISTRACION: TFloatField;
    qPresupuestoIMPREVISTOS: TFloatField;
    qPresupuestoUTILIDADES: TFloatField;
    qPresupuestoIVA: TFloatField;
    qPresupuestoMATERIAL: TFloatField;
    qPresupuestoTRANSPORTE: TFloatField;
    qPresupuestoEQUIPO: TFloatField;
    qPresupuestoMANOOBRA: TFloatField;
    qPresupuestoSECUENCIA: TFloatField;
    qPresupuestoANO: TStringField;
    qPresupuestoCODIGOGEOGRAFICO: TFloatField;
    qPresupuestoAiu: TFloatField;
    qPresupuestoValorAIU: TFloatField;
    qPresupuestoCostoDirectoSinAIU: TFloatField;
    Notebook: TNotebook;
    gbUbicacion: TGroupBox;
    Label9: TLabel;
    DBTGeografico: TDBText;
    sbBuscarCIG: TSpeedButton;
    Opcionurbano: TDBRadioGroup;
    dbeCIG: TDBEdit;
    gbAsignacion: TGroupBox;
    Label34: TLabel;
    dblcbDivision: TDBLookupComboBox;
    Panel3: TPanel;
    SCuadradoActividad: TShape;
    Label33: TLabel;
    Label40: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    SVerticalActivida1: TShape;
    SVerticalActivida2: TShape;
    SVerticalActivida3: TShape;
    SLineaVActividad1: TShape;
    SHorizontalActividad1: TShape;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    DBText9: TDBText;
    SHorizontalActividad2: TShape;
    Label48: TLabel;
    DBText1: TDBText;
    Label47: TLabel;
    Shape1: TShape;
    IEstructura: TImage;
    DBMemo2: TDBMemo;
    DBGridActividad: TDBGrid;
    PanelVales: TPanel;
    GroupBox3: TGroupBox;
    Label39: TLabel;
    SBActualizaValoresMaterial: TSpeedButton;
    DBEdit16: TDBEdit;
    DBGridMaterial: TDBGrid;
    qActividadPresupuesto: TQuery;
    qActividadPresupuestoNombreTipoActividad: TStringField;
    qActividadPresupuestoNombreEstructura: TStringField;
    qActividadPresupuestoNombreActividadPresupuesto: TStringField;
    qActividadPresupuestoCODIGOACTIVIDADPRESUPUESTO: TFloatField;
    qActividadPresupuestoCODIGOACTIVIDAD: TStringField;
    qActividadPresupuestoCODIGOPRESUPUESTO: TFloatField;
    qActividadPresupuestoCODIGOPRESUPUESTOOBRA: TFloatField;
    qActividadPresupuestoCANTIDADPRESUPUESTADA: TFloatField;
    qActividadPresupuestoMATERIAL: TFloatField;
    qActividadPresupuestoTRANSPORTE: TFloatField;
    qActividadPresupuestoEQUIPO: TFloatField;
    qActividadPresupuestoMANOOBRA: TFloatField;
    dsActividadPresupuesto: TDataSource;
    updActividadPresupuesto: TUpdateSQL;
    qMaterialPresupuesto: TQuery;
    qMaterialPresupuestoNombreMaterial: TStringField;
    qMaterialPresupuestoNombreUnidad: TStringField;
    qMaterialPresupuestoCODIGOPRESUPUESTO: TFloatField;
    qMaterialPresupuestoCODIGOMATERIAL: TFloatField;
    qMaterialPresupuestoVALORPRESUPUESTADO: TFloatField;
    qMaterialPresupuestoCODIGOMATERIALPRESUPUESTOOBRA: TFloatField;
    qMaterialPresupuestoCODIGOPRESUPUESTOOBRA: TFloatField;
    qMaterialPresupuestoCODIGOACTIVIDADPRESUPUESTOOBRA: TFloatField;
    dsMaterialPresupuesto: TDataSource;
    updMaterialPresupuesto: TUpdateSQL;
    qMaterialPresupuestoCANTIDADPRESUPUESTADA: TFloatField;
    qTipoContratoCODIGOTIPOCONTRATO: TStringField;
    qTipoContratoNOMBRETIPOCONTRATO: TStringField;
    qTipoContratoIVAADMINISTRACION: TStringField;
    qTipoContratoIVAIMPREVISTOS: TStringField;
    qTipoContratoIVAUTILIDAD: TStringField;
    qrcPresupuesto: TQRCompositeReport;
    qMaterialPresupuestoCONSECUTIVO: TFloatField;
    qActividadPresupuestoCONSECUTIVO: TFloatField;
    qPresupuestoNombreGeografico: TStringField;
    qGeograficoCODIGOGEOGRAFICO: TFloatField;
    qGeograficoNOMBREGEOGRAFICO: TStringField;
    qGeograficoNOMBREMUNICIPIO: TMemoField;
    qGeograficoINDICEDIFICULTAD: TFloatField;
    DBEdit1: TDBEdit;
    qPresupuestoNombreEstadoPresupuesto: TStringField;
    dsGeografico: TDataSource;
    qGeograficoURBANO: TStringField;
    qPresupuestoCODIGOADMINISTRATIVO: TFloatField;
    gbProgramacion: TGroupBox;
    Label15: TLabel;
    SpeedButtonFechaAsignacion: TSpeedButton;
    Label55: TLabel;
    SpeedButtonFechaPresupuesto: TSpeedButton;
    DBEditFechaAsignacion: TDBEdit;
    DBEditFechaPresupuesto: TDBEdit;
    gbCostos: TGroupBox;
    Label53: TLabel;
    Label64: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label91: TLabel;
    Label93: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEditManoObra: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit2: TDBEdit;
    GroupBox4: TGroupBox;
    Label68: TLabel;
    Label70: TLabel;
    ButtonModifAIU: TButton;
    DBEditAIU: TDBEdit;
    DBEdit1IVA: TDBEdit;
    qUnidad: TQuery;
    dsUnidad: TDataSource;
    qActividadCODIGOTIPOACTIVIDAD: TStringField;
    procedure ButtonModifAIUClick(Sender: TObject);
    procedure SpeedButtonFechaPresupuestoClick(Sender: TObject);
    procedure SpeedButtonFechaAsignacionClick(Sender: TObject);
    procedure BitBtnImprimirClick(Sender: TObject);
    procedure AdicionarActividades1Click(Sender: TObject);
    procedure CertificadodeEntrega1Click(Sender: TObject);
    procedure BitBtnAceptarClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure BBCartografiaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PresupuestoObraClick(Sender: TObject);
    procedure ActividadesdelaObra1Click(Sender: TObject);
    procedure MaterialesdelaObra1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure QRCompositeReport3AddReports(Sender: TObject);
    procedure DBGridMaterialDblClick(Sender: TObject);
    procedure ArbolChange(Sender: TObject; Node: TTreeNode);
    procedure sbBuscarCIGClick(Sender: TObject);
    procedure qActividadPresupuestoCalcFields(DataSet: TDataSet);
    procedure qPresupuestoCalcFields(DataSet: TDataSet);
    procedure qPresupuestoCODIGOCONTRATOChange(Sender: TField);
    procedure qPresupuestoFECHAASIGNACIONValidate(Sender: TField);
    procedure qPresupuestoAfterPost(DataSet: TDataSet);
    procedure qPresupuestoAfterDelete(DataSet: TDataSet);
    procedure qActividadPresupuestoAfterDelete(DataSet: TDataSet);
    procedure qActividadPresupuestoAfterPost(DataSet: TDataSet);
    procedure qMaterialPresupuestoAfterPost(DataSet: TDataSet);
    procedure qMaterialPresupuestoAfterDelete(DataSet: TDataSet);
    procedure qPresupuestoSECUENCIAChange(Sender: TField);
    procedure qPresupuestoNUMEROPRESUPUESTOValidate(Sender: TField);
    procedure qPresupuestoANOValidate(Sender: TField);
    procedure qPresupuestoSECUENCIAValidate(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure qPresupuestoAfterInsert(DataSet: TDataSet);
    procedure qActividadPresupuestoAfterCancel(DataSet: TDataSet);
    procedure qPresupuestoAfterCancel(DataSet: TDataSet);
    procedure qMaterialPresupuestoAfterCancel(DataSet: TDataSet);
    procedure bbFirmasClick(Sender: TObject);
    procedure qrcPresupuestoAddReports(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SBActualizaValoresMaterialClick(Sender: TObject);
    procedure qPresupuestoCODIGOGEOGRAFICOChange(Sender: TField);
  private
    procedure ActualizarValoresPresupuesto;
  public
    sFecha,CodigoObra,EsRetenedor,NombreContratista :String;
    ValorIndice,CodDivision,CodDepartamento,CodPrograma,CodSecuencia,codAno : String;
    ManoObraTotal,MaterialTotal,EquipoTotal,TransporteTotal,FactorDificultad, IVA, AIU : Real;
    CodigoTipoPresupuesto : Integer;
    TotalIva:real;
    bCancelando,bDatosIncompletos,bFiltrado: boolean;
    NombreFirmante:array[0..3]of string;
    CargoFirmante:array[0..3]of string;
    procedure ActualizarMaterialDesdePresupuesto;
    procedure GenerarNumeroContrato;
    Function GetFecha: String;
    function FechaServidor:string;
  end;

var
  fPresupuesto: TfPresupuesto;

implementation

uses uSeleccionarTipoPresupuesto, uFormaFecha, uBuscarActividad,
  uCertificadoEntrega, uInformacionContrato, uActaLiquidacion, uResolucion,
  uQRLiquidObra2, uQRActividadPresupuesto,uQRMaterialPresupuesto,
  uBuscarMaterialEnerGis, uFirmaPresupuesto, uqrPresupuesto,
  uAIUPresupuesto;

  //  uListaMantenimientos, uListaReportes;

{$R *.DFM}

Function TfPresupuesto.GetFecha: String;
begin
  FFormaFecha := TFFormaFecha.Create(Application);//
  if FFormaFecha.ShowModal = mrOk then
  begin
   Result := DatetoStr(FFormaFecha.Date);
  end
  else
     Result := '';
  FFormaFecha.Free;//
end;

procedure TfPresupuesto.ActualizarMaterialDesdePresupuesto;
Var NumeroVale : String;
begin
  {qPptoMateriales.Close;
  qPptoMateriales.Open;
  qPptoMateriales.First;
  try
    While Not qPptoMateriales.Eof do
    begin
      if qMaterialPresupuesto.Locate('CodigoContrato;NumeroVale;CodigoMaterial',
                                        VarArrayOf([
                                                    CodigoObra,
                                                    NumeroVale,
                                                    qPptoMateriales.FieldByName('CodigoMaterial').AsString
                                                    ]),
                                                    [loCaseInsensitive])then
      begin
        qMaterialPresupuesto.Edit;
        qMaterialPresupuesto.FieldByName('CantidadSolicitada').AsFloat := qPptoMateriales.FieldByName('Sum').AsFloat;
        qMaterialPresupuesto.Post;
      end
      else
      begin
        qMaterialPresupuesto.Append;
        qMaterialPresupuesto.FieldByName('CodigoContrato').AsString := CodigoObra;
        qMaterialPresupuesto.FieldByName('CodigoMaterial').AsString := qPptoMateriales.FieldByName('CodigoMaterial').AsString;
        qMaterialPresupuesto.FieldByName('NumeroVale').AsString := NumeroVale;
        qMaterialPresupuesto.FieldByName('CantidadSolicitada').AsFloat := qPptoMateriales.FieldByName('Sum').AsFloat;
        qMaterialPresupuesto.Post;
      end;
      qPptoMateriales.Next;
    end;
  except
  end;  }
end;

procedure TfPresupuesto.ButtonModifAIUClick(Sender: TObject);
var
  myerrorstring:string;
begin
 try
  fAIUPresupuesto := TfAIUPresupuesto.Create(Application);
  fAIUPresupuesto.Showmodal;
  fAIUPresupuesto.Free;
 except
    MyErrorString := 'ErrorCode: ' + IntToStr(Error) + #13#10;
    Application.Messagebox(Pchar('Ocurrio un error en el Sistema'),Pchar('Información'),MB_ICONASTERISK+MB_OK)
 end;
end;

procedure TfPresupuesto.SpeedButtonFechaPresupuestoClick(Sender: TObject);
begin
  inherited;
  DBEditFechaPresupuesto.Setfocus;
  sFecha := DBEditFechaPresupuesto.Text;
  qPresupuesto.fieldbyName('FECHAPRESUPUESTO').asstring := GetFecha;
end;

procedure TfPresupuesto.SpeedButtonFechaAsignacionClick(Sender: TObject);
begin
  inherited;
  DBEditFechaAsignacion.Setfocus;
  sFecha := DBEditFechaAsignacion.Text;
  qPresupuesto.fieldbyName('FECHAASIGNACION').asstring := GetFecha;
end;

procedure TfPresupuesto.BitBtnImprimirClick(Sender: TObject);
var punto:TPoint;
begin
 punto:=PanelBotones.ClientToScreen(Classes.Point(BitBtnImprimir.Left, BitBtnImprimir.top));
 PmImprimirPresupuesto.Popup(punto.x+10, punto.y+10)
end;

procedure TfPresupuesto.AdicionarActividades1Click(Sender: TObject);
var i:Integer;
begin
  fBuscarActividad := TfBuscarActividad.Create(Application);
  if fBuscarActividad.ShowModal = mrOk then
  begin
  if fBuscarActividad.DBGridActividad.SelectedRows.Count>0  then
  begin
    if qPresupuesto.State in [dsEdit,dsInsert] then
      qPresupuesto.Post;
    qActividadPresupuesto.open;
    for i:=0 to fBuscarActividad.DBGridActividad.SelectedRows.Count-1 do
    begin
      fBuscarActividad.qActividad.BookMark:=fBuscarActividad.DBGridActividad.SelectedRows.Items[i];
      try
       qActividadPresupuesto.Append;
       qActividadPresupuesto.fieldbyName('CODIGOPRESUPUESTO').asstring := qPresupuestoCODIGOPRESUPUESTO.AsString;
       qActividadPresupuesto.fieldbyName('CODIGOACTIVIDAD').asstring := fBuscarActividad.qActividad.fieldbyName('CODIGOACTIVIDAD').asstring;
       qActividadPresupuesto.fieldbyName('CANTIDADPRESUPUESTADA').asfloat := 1;
       qActividadPresupuesto.fieldbyName(('CodigoTipoPRESUPUESTO')).AsInteger :=CodigoTipoPresupuesto;
       qActividadPresupuestoCalcFields(qActividadPresupuesto);
       qActividadPresupuesto.Post;
      except
          ShowMessage('La Actividad ya esta asignada al Contrato.');
          qActividadPresupuesto.Cancel;
      end;
    end;
    qPresupuesto.Edit;
  end;
  fBuscarActividad.qActividad.Active:=True;
  DBGridActividad.SelectedIndex := 0;
  end;
  fBuscarActividad.Free;
end;

procedure TfPresupuesto.CertificadodeEntrega1Click(Sender: TObject);
var i:integer;
begin
  try
    qPresupuesto.Post;
    for i:=0 to 3 do
    begin
      NombreFirmante[i]:='';
      CargoFirmante[i]:='';
    end;
    qFirma.Close;
    qFirma.ParamByName('CodigoDocumento').AsString:='ENT';
    qFirma.Open;
    i:=0;
    while not (qFirma.Eof) and (i<4) do
    begin
      NombreFirmante[i]:=qFirma.fieldbyname('NombreEmpleado').AsString;
      CargoFirmante[i]:=qFirma.fieldbyname('NombreCargo').AsString;
      qFirma.Next;
      inc(i);
    end;

    FCertificadoEntrega := TFCertificadoEntrega.Create(self);
    for i:=0 to 3 do
    begin
      FCertificadoEntrega.NombreFirmante[i] := NombreFirmante[i];
      FCertificadoEntrega.CargoFirmante[i] := CargoFirmante[i];
    end;
    FCertificadoEntrega.Show;
  except
    FCertificadoEntrega.Free;
  end;
  qPresupuesto.Edit;
end;

procedure TfPresupuesto.BitBtnAceptarClick(Sender: TObject);
begin
  inherited;
  bDatosIncompletos := False;
  bCancelando := False;
  try
    qPresupuesto.Post;
    ModalResult:=MrOk;
    close;
 Except
    bDatosIncompletos := True;
    ModalResult:=MrCancel;
    Close;
 end;
end;

procedure TfPresupuesto.BitBtnCancelarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Perderá los cambios realizados.Esta seguro de Cancelar?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
  begin
    qPresupuesto.Cancel;
    bDatosIncompletos := true;
    bCancelando := true;
    close;
  end
  else
  begin
    ModalResult := 0;
    bDatosIncompletos := false;
  end;
end;

procedure TfPresupuesto.BBCartografiaClick(Sender: TObject);
var ListaApoyo,Lista : TStringList;
begin
  bDatosIncompletos := False;
  try
    qPresupuesto.Post;
    qPresupuesto.Edit;
  except
  end;
  if CodigoObra='' then CodigoObra:= qPresupuesto.FieldByName('CODIGOCONTRATO').AsString;
  FInformacionContrato := TFInformacionContrato.Create(Application);
  FInformacionContrato.Visible := False;
  FInformacionContrato.Caption :='Contrato # '+qPresupuesto.FieldByName('NUMEROCONTRATO').AsString; //Cambio Octubre
  FInformacionContrato.Top := screen.Height - FInformacionContrato.height;
  FInformacionContrato.Show;
  FInformacionContrato.Mobjeto.text := MObjeto.Text;
  FInformacionContrato.Contrato := CodigoObra;
  BorderStyle := bsToolWindow;
  FormStyle := fsStayOnTop;
  WindowState := wsMinimized;
  Visible := False;

  Lista := TStringList.create;
  Lista.Add('VarCodigoEstadoInfraestructura='+'2');
  Lista.Add('VarCodigoContrato='+CodigoObra);
  Lista.Add('VarCodigoGrupoInventario='+'01');
  Lista.Add('VarCodigoCuadrillaInventario='+'01');
  Lista.Add('VarCodigoUsuarioDirector='+'0');
  Lista.Add('VarCodigoUsuarioOficial='+'0');
  Lista.Add('VarCodigoUsuarioAuxiliar='+'0');
  Lista.Add('VarCodigoUsuarioControlCalidad='+'0');
  Lista.Add('VarCodigoEstadoControlCalidad='+'1');
  Lista.Add('VarFechaInventario='+DateTimetoStr(Date));
  Lista.Add('VarFechaControlCalidad='+'0');
  GetData('SET',Lista);
  Lista.Free;
  RefrescarVariables;

//  UbicarContrato(StrToInt(CodigoObra),False);
// UbicarContrato(CODIGO CONTRATO ,SI QUIERE REALIZAR ZOOM O NO);
   qListaApoyo.Close;
   qListaApoyo.ParamByName('Codigo').AsInteger := StrToInt(CodigoObra);
   qListaApoyo.Open;
   qListaApoyo.First;
   if qListaApoyo.FieldByName('CodigoApoyo').AsString <> '' then
   begin
     ListaApoyo := TStringList.create;
     ListaApoyo.Clear;
     While not qListaApoyo.eof do
     begin
       if qListaApoyo.FieldByName('CodigoApoyo').AsString <> ''
       then  ListaApoyo.Add(qListaApoyo.FieldByName('CodigoApoyo').AsString+','+FormatFloat('00.00',qListaApoyo.FieldByName('X').asfloat)+','+FormatFloat('00.00',qListaApoyo.FieldByName('Y').asfloat));
       qListaApoyo.Next;
     end;
     MostrarVistaLateralApoyos(ListaApoyo);
     ListaApoyo.Free;
   end;
end;

procedure TfPresupuesto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (bCancelando) and (bDatosIncompletos) then // CierroCancelando
  begin
    if qPresupuesto.Database.InTransaction then qPresupuesto.Database.Rollback;
     Action := caHide;
  end;
  if (not bDatosIncompletos) and (not bCancelando)  then //CierroGuardo;
  begin
    ModalResult := mrOk;
    Action := caHide;
  end;
  if (not bCancelando) and (bDatosIncompletos) then
  begin //Preguntar SiDesea completar datos
    if Application.MessageBox(PChar('Hay datos incompletos.Desea completar los datos?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes     then
    begin
        bDatosIncompletos := false;
        ModalResult := 0;
        Action := caNone;
    end
    else
    begin
       if qPresupuesto.Database.InTransaction then qPresupuesto.Database.Rollback;
       Action := caHide;
    end;
  end;
end;


procedure TfPresupuesto.PresupuestoObraClick(Sender: TObject);
Var i : Integer;
begin
  try
    if fqrPresupuesto<>nil then
    begin
      fqrPresupuesto.free;
      fqrPresupuesto:=nil;
    end;
    fQRPresupuesto:=TfQRPresupuesto.Create(Application);
    fQRPresupuesto.qPresupuesto.Close;
    fQRPresupuesto.qPresupuesto.DataSource:=dsPresupuesto;
    fQRPresupuesto.qPresupuesto.Open;
    fQRPresupuesto.qActividadPresupuesto.close;
    fQRPresupuesto.qActividadPresupuesto.open;
    fQRPresupuesto.qMaterialPresupuesto.close;
    fQRPresupuesto.qMaterialPresupuesto.open;
    fQRPresupuesto.qrActividad.ReportTitle := 'Presupuesto de Obra # '+qPresupuestoCodigoPresupuesto.AsString;

    for i:=0 to 3 do
    begin
      NombreFirmante[i]:='';
      CargoFirmante[i]:='';
    end;
    qFirma.Close;
    qFirma.ParamByName('CodigoDocumento').Asstring:='PTO';
    qFirma.Open;
    i:=0;
    while not (qFirma.Eof) and (i<4) do
    begin
      if qFirma.fieldbyname('NombreEmpleado').AsString<>'' then
        NombreFirmante[i]:=qFirma.fieldbyname('NombreEmpleado').AsString;
      if qFirma.fieldbyname('NombreCargo').AsString<>'' then
        CargoFirmante[i]:=qFirma.fieldbyname('NombreCargo').AsString;
      qFirma.Next;
      inc(i);
    end;
    fQRPresupuesto.QRLabelNombrefirmante1.Caption := NombreFirmante[0];
    fQRPresupuesto.QRLabelCargoFirmante1.Caption := CargoFirmante[0];
    fQRPresupuesto.QRLabelNombrefirmante2.Caption := NombreFirmante[1];
    fQRPresupuesto.QRLabelCargoFirmante2.Caption := CargoFirmante[1];
    fQRPresupuesto.QRLabelNombrefirmante3.Caption := NombreFirmante[2];
    fQRPresupuesto.QRLabelCargoFirmante3.Caption := CargoFirmante[2];
    qrcPresupuesto.Preview;
  except
    on e:exception do
    begin
      ShowMessage(e.Message);
      fqrPresupuesto.free;
    end;
  end;
end;

procedure TfPresupuesto.ActividadesdelaObra1Click(Sender: TObject);
begin
  try
    fQRActividadPresupuesto:=TfQRActividadPresupuesto.Create(Application);
    fQRActividadPresupuesto.QuickReport.ReportTitle := 'Actividades Presupuestadas.  '+qPresupuestoNUMEROPRESUPUESTO.AsString;
    fQRActividadPresupuesto.qActividadPresupuesto.close;
    fQRActividadPresupuesto.qActividadPresupuesto.DataSource:=dsPresupuesto;
    fQRActividadPresupuesto.qActividadPresupuesto.open;
    fQRActividadPresupuesto.QuickReport.Preview;
  except
    on e:exception do
    begin
      showmessage(E.Message);
      fQRActividadPresupuesto.free;
    end;
  end;
end;

procedure TfPresupuesto.MaterialesdelaObra1Click(Sender: TObject);
begin
 try
    fQRMaterialPresupuesto:=TfQRMaterialPresupuesto.Create(Application);
    fQRMaterialPresupuesto.qMaterialPresupuesto.close;
    fQRMaterialPresupuesto.qMaterialPresupuesto.DataSource:=dsPresupuesto;
    fQRMaterialPresupuesto.qMaterialPresupuesto.open;
    fQRMaterialPresupuesto.QuickReport.ReportTitle := 'Materiales Presupuestados.'+qPresupuestoNUMEROPRESUPUESTO.AsString;
    fQRMaterialPresupuesto.QuickReport.Preview;
  except
    on e:exception do
    begin
      showmessage(e.message);
      fQRMaterialPresupuesto.free;
    end;
  end;
end;


procedure TfPresupuesto.FormActivate(Sender: TObject);
begin
  inherited;
  if CodigoObra =''
  then CodigoObra := qPresupuesto.fieldByName('CodigoPresupuesto').AsString;
  Notebook.PageIndex:=0;
  CodigoObra := qPresupuestoCODIGOPresupuesto.AsString;
  CodigoTipoPresupuesto:=0;
  qActividadPresupuesto.Close;
  qActividadPresupuesto.Open;
  qMaterialPresupuesto.Close;
  qMaterialPresupuesto.Open;
end;

procedure TfPresupuesto.QRCompositeReport3AddReports(Sender: TObject);
begin
  with QRCompositeReport3 do
  begin
     Reports.Add(fQRLiquidObra2.QuickReport);
  end;
end;

procedure TfPresupuesto.DBGridMaterialDblClick(Sender: TObject);
begin
  dsMaterialPresupuesto.DataSet.Edit;
end;

procedure TfPresupuesto.ArbolChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  if Node.Text='Información' then
   Notebook.PageIndex:=0
  else if Node.Text='Actividades' then
   Notebook.PageIndex:=1
  else if Node.Text='Materiales' then
   Notebook.PageIndex:=2;
end;

procedure TfPresupuesto.sbBuscarCIGClick(Sender: TObject);
var CIG:INTEGER;
begin
  CIG := CapturarCIG;
  if CIG<>0 then dsPresupuesto.DataSet.FieldByName('CODIGOGEOGRAFICO').AsInteger:=CIG;
end;

procedure TfPresupuesto.qActividadPresupuestoCalcFields(DataSet: TDataSet);
var qDescripcion:TQuery;
begin
  qDescripcion:=TQuery.Create(self);
  qDescripcion.DatabaseName:='BaseDato';

  if qActividadPresupuestoCODIGOACTIVIDAD.AsString<>'' then
  begin
    qDescripcion.sql.clear;
    qDescripcion.sql.add('SELECT ta.nombretipoactividad||''  ''||e.nombreestructura nombreactividad');
    qDescripcion.sql.add('FROM tipoactividad ta,actividad a,estructura e');
    qDescripcion.sql.add('WHERE ta.codigotipoactividad=a.codigotipoactividad');
    qDescripcion.sql.add('AND e.codigoestructura=a.codigoestructura');
    qDescripcion.sql.add('and a.codigoactividad='+qActividadPresupuestoCODIGOACTIVIDAD.AsString);
    qDescripcion.open;
    qActividadPresupuestoNombreActividadPresupuesto.AsString:=qDescripcion.fields[0].AsString;
  end;
  {if qActividadPresupuestoCODIGOTIPOPRESUPUESTO.AsString<>'' then
  begin
    qDescripcion.sql.clear;
    qDescripcion.sql.add('select nombretipopresupuesto from tipopresupuesto');
    qDescripcion.sql.add('where codigotipopresupuesto='+qActividadPresupuestoCODIGOTIPOPRESUPUESTO.AsString);
    qDescripcion.open;
    qActividadPresupuestoNombreTipoPresupuesto.AsString:=qDescripcion.fields[0].AsString;
  end;       }
  qDescripcion.Free;
end;


procedure TfPresupuesto.qPresupuestoCalcFields(DataSet: TDataSet);
var
  IVA,AIU,Material,ManoObra,Equipo,Transporte,Utilidades,Administracion,Imprevistos,
  ValorTotal,Suma,SumaAIU,SumaIVA:Double;
begin
  qPresupuesto.FieldByName('AIU').AsFloat:=qPresupuesto.FieldByName('ADMINISTRACION').AsFloat+ qPresupuesto.FieldByName('IMPREVISTOS').ASFloat+qPresupuesto.FieldByName('UTILIDADES').AsFloat;
  AIU := qPresupuesto.FieldByName('AIU').AsFloat/100;
  IVA := qPresupuesto.FieldByName('IVA').AsFloat/100;
  Material := qPresupuesto.FieldByName('MATERIAL').AsFloat;
  ManoObra := qPresupuesto.FieldByName('MANOOBRA').ASFloat;
  Transporte := qPresupuesto.FieldByName('TRANSPORTE').AsFloat;
  Equipo := qPresupuesto.FieldByName('EQUIPO').AsFloat;
  Utilidades := qPresupuesto.FieldByName('UTILIDADES').AsFloat/100;
  Administracion := qPresupuesto.FieldByName('ADMINISTRACION').AsFloat/100;
  Imprevistos := qPresupuesto.FieldByName('IMPREVISTOS').AsFloat/100;
  Suma:= Material+ManoObra+ Transporte+ Equipo ;
  SumaAIU := Suma*AIU;
  SumaIVA:=0;
  if qTipoContrato.FieldByName('IVAUTILIDAD').AsString='S' then
  SumaIVA := (Suma*Utilidades)*IVA;
  if qTipoContrato.FieldByName('IVAADMINISTRACION').AsString='S' then
  SumaIVA := SumaIVA+(Suma*Administracion)*IVA;
  if qTipoContrato.FieldByName('IVAIMPREVISTOS').AsString='S' then
  SumaIVA := SumaIVA+(Suma*Imprevistos)*IVA;
  ValorTotal := Suma +SumaAIU+SumaIVA;
  qPresupuesto.FieldByName('ValorIVA').AsFloat := SumaIVA;
  qPresupuesto.FieldByName('ValorAIU').AsFloat := SumaAIU;
  qPresupuesto.FieldByName('COSTODIRECTOSINAIU').AsFloat := SUMA;
  qPresupuesto.FieldByName('COSTODIRECTO').AsFloat := SUMA+SUMAAIU;
  qPresupuesto.FieldByName('COSTOTOTAL').AsFloat:= ValorTotal;
  qPresupuesto.FieldByName('ValorMaterial').AsFloat:= Material*(1+AIU);
  qPresupuesto.FieldByName('ValorManoObra').AsFloat:= MANOOBRA*(1+AIU);
  qPresupuesto.FieldByName('ValorEquipo').AsFloat:= EQUIPO*(1+AIU);
  qPresupuesto.FieldByName('ValorTransporte').AsFloat:= TRANSPORTE*(1+AIU);
  if qPresupuestoCODIGOGEOGRAFICO.AsString<>'' then
  begin
    qGeografico.close;
    qGeografico.parambyname('CODIGOGEOGRAFICO').asstring:=qPresupuestoCODIGOGEOGRAFICO.AsString;
    qGeografico.open;
    qPresupuestoNombreGeografico.AsString:=qGeografico.fieldbyname('NombreGeografico').AsString;
  end;
end;

procedure TfPresupuesto.qPresupuestoCODIGOCONTRATOChange(Sender: TField);
begin
  inherited;
  CodigoObra:=Sender.AsString;
end;

procedure TfPresupuesto.qPresupuestoFECHAASIGNACIONValidate(Sender: TField);
begin
  inherited;
  if qPresupuestoFECHAPresupuesto.AsDateTime=0
  then raise Exception.Create('La Fecha de Presupuesto no debe estar en blanco.')
  else if Sender.AsDateTime < qPresupuestoFECHAPresupuesto.AsDateTime
    then raise Exception.Create('La Fecha de Asignación de Obra debe ser mayor que la Fecha de Presupuesto.');
end;

procedure TfPresupuesto.qPresupuestoAfterPost(DataSet: TDataSet);
begin
  inherited;
  qPresupuesto.ApplyUpdates;
  qPresupuesto.CommitUpdates;
end;

procedure TfPresupuesto.qPresupuestoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qPresupuesto.ApplyUpdates;
  qPresupuesto.CommitUpdates;
end;

procedure TfPresupuesto.qActividadPresupuestoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qActividadPresupuesto.ApplyUpdates;
  qActividadPresupuesto.CommitUpdates;
end;

procedure TfPresupuesto.qActividadPresupuestoAfterPost(DataSet: TDataSet);
begin
  inherited;
  qActividadPresupuesto.ApplyUpdates;
  qActividadPresupuesto.CommitUpdates;
end;

procedure TfPresupuesto.qMaterialPresupuestoAfterPost(DataSet: TDataSet);
begin
  qMaterialPresupuesto.ApplyUpdates;
  qMaterialPresupuesto.CommitUpdates;
end;

procedure TfPresupuesto.qMaterialPresupuestoAfterDelete(DataSet: TDataSet);
begin
  qMaterialPresupuesto.ApplyUpdates;
  qMaterialPresupuesto.CommitUpdates;
end;

procedure TfPresupuesto.qPresupuestoSECUENCIAChange(Sender: TField);
begin
end;
// Genera el número del contrato a partir de los campos
// division,departamento,programa,secuencia,año
procedure TfPresupuesto.GenerarNumeroContrato;
function RellenoCeros(s:string;n:integer):string;
var i:integer;
begin
  result:=s;
  for i:=1 to length(s)-n do
    result:='0'+result;
end;
begin
//
end;

procedure TfPresupuesto.qPresupuestoNUMEROPRESUPUESTOValidate(Sender: TField);
begin
  inherited;
  CodSecuencia:=Sender.AsString;
  GenerarNumeroContrato;
end;

procedure TfPresupuesto.qPresupuestoANOValidate(Sender: TField);
begin
  inherited;
  codano:=Sender.AsString;
//  GenerarNumeroContrato;
end;

procedure TfPresupuesto.qPresupuestoSECUENCIAValidate(Sender: TField);
begin
  inherited;
  CodSecuencia:=Sender.AsString;
//  GenerarNumeroContrato;
end;


procedure TfPresupuesto.FormCreate(Sender: TObject);
begin
  qEstadoPresupuesto.Open;
  qTipoContrato.Open;
  qDivision.Open;
 //qDepartamento.Open;
  qZona.Open;
  qGeografico.Open;
  qEmpresa.Open;
  qPresupuesto.Open;
  qActividad.Open;
  qUnidad.Open;
  qEstructura.Open;
  qTipoActividad.Open;
 //qTipoPresupuesto.Open;
  qMaterial.Open;
  inherited;
end;

procedure TfPresupuesto.qPresupuestoAfterInsert(DataSet: TDataSet);
var Dia,mes,ano:word;
begin
  inherited;
  qPresupuestoNUMEROPRESUPUESTO.AsInteger:=0;
  qPresupuestoSECUENCIA.AsInteger:=0;
  DecodeDate(strtodatetime(FechaServidor),ano,mes,dia);
  qPresupuestoANO.AsInteger:=ano;
  qPresupuestoCODIGOESTADOPRESUPUESTO.AsString:='1';
end;

function TfPresupuesto.FechaServidor: string;
var qFecha: TQuery;
begin
  Result := '';
  qFecha := TQuery.Create(Application);
  qFecha.DatabaseName := 'BaseDato';
  qFecha.SQL.Text := 'SELECT SYSDATE FROM DUAL';
  qFecha.Open;
  Result := qFecha.Fields[0].AsString;
  qFecha.Free;
end;

procedure TfPresupuesto.qActividadPresupuestoAfterCancel(DataSet: TDataSet);
begin
  inherited;
  qActividadPresupuesto.CancelUpdates;
end;

procedure TfPresupuesto.qPresupuestoAfterCancel(DataSet: TDataSet);
begin
  inherited;
  qPresupuesto.CancelUpdates;
end;

procedure TfPresupuesto.qMaterialPresupuestoAfterCancel(DataSet: TDataSet);
begin
  inherited;
  qMaterialPresupuesto.CancelUpdates;
end;


procedure TfPresupuesto.bbFirmasClick(Sender: TObject);
begin
  try
    qPresupuesto.Post;
  except
    on E:Exception  do
    begin
      Application.MessageBox('Debe llenar los Datos del contrato  Antes de Ingresar Firmas','Error',MB_OK);
      qPresupuesto.Edit;
      exit;
    end;
  end;      
  fFirmaPresupuesto:=TfFirmaPresupuesto.Create(Application);
  fFirmaPresupuesto.qEmpleado.DataSource:=dsPresupuesto;
  fFirmaPresupuesto.qEmpleado.open;
  fFirmaPresupuesto.qFirma.DataSource:=dsPresupuesto;
  fFirmaPresupuesto.qFirma.Open;
  fFirmaPresupuesto.ShowModal;
  fFirmaPresupuesto.free;
  qPresupuesto.Edit;
end;


procedure TfPresupuesto.qrcPresupuestoAddReports(Sender: TObject);
begin
  inherited;
  qrcPresupuesto.Reports.Clear;
  qrcPresupuesto.Reports.Add(fqrPresupuesto.qractividad);
 // qrcPresupuesto.Reports.Add(fqrPresupuesto.qrMaterial);
  qrcPresupuesto.Reports.Add(fqrPresupuesto.qrResumen);
end;

procedure TfPresupuesto.FormDestroy(Sender: TObject);
begin
  inherited;
    if fqrPresupuesto<>nil then
    begin
      fqrPresupuesto.free;
      fqrPresupuesto:=nil;
    end;
end;

procedure TfPresupuesto.SBActualizaValoresMaterialClick(Sender: TObject);
begin
  inherited;
  ActualizarValoresPresupuesto;
end;

procedure TfPresupuesto.ActualizarValoresPresupuesto;
var
   TotalMaterial,TotalEquipo,TotalManoObra,TotalTransporte:Double;
   query:tquery;
begin
  TotalMaterial:=0;
  TotalEquipo:=0;
  TotalManoObra:=0;
  TotalTransporte:=0;
  query:=TQuery.create(self);
  query.DatabaseName:='BaseDato';
  query.sql.Add('SELECT CODIGOPRESUPUESTOOBRA,MATERIAL,TRANSPORTE,EQUIPO,MANOOBRA ');
  query.sql.Add('FROM PRESUPUESTOOBRA WHERE CODIGOPRESUPUESTO='+qPresupuestoCODIGOPRESUPUESTO.asstring);
  query.open;
  while Not query.Eof do
  begin
    TotalMaterial:=TotalMaterial+ query.fieldbyname('MATERIAL').AsFloat;
    TotalTransporte:=TotalTransporte+query.fieldbyname('TRANSPORTE').AsFloat;
    TotalEquipo:=TotalEquipo+query.fieldbyname('EQUIPO').AsFloat;
    TotalManoObra:=TotalManoObra+query.fieldbyname('MANOOBRA').AsFloat;
    query.Next;
  end;
  if not (qPresupuesto.state in [dsEdit,dsInsert]) then
    qPresupuesto.Edit;
  qPresupuestoMaterial.AsFloat:=TotalMaterial;
  qPresupuestoEquipo.AsFloat:=TotalEquipo;
  qPresupuestoManoObra.AsFloat:=TotalManoObra;
  qPresupuestoTransporte.AsFloat:=TotalTransporte;
  qPresupuesto.Post;
  qPresupuesto.Edit;
  query.free;
end;

procedure TfPresupuesto.qPresupuestoCODIGOGEOGRAFICOChange(Sender: TField);
begin
  inherited;
  qGeografico.close;
  qGeografico.open;
end;

end.
