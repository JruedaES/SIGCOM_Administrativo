unit uPresupuestoObra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, Db, DBTables, DBCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, Consdll,
  utnNewDbgrid, Buttons, ComCtrls, Mask, Menus, QuickRpt, TParser, uFIMPComunes,
  uFuncionSGD,Digisoft,math;

type
  TfPresupuestoObra = class(TFBase)
    GroupBox1: TGroupBox;
    Label13: TLabel;
    LCodigoPresupuesto: TLabel;
    Label14: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    DBECodigoConsecutivo: TDBEdit;
    DBEditCodAno: TDBEdit;
    EdCodigoPresupuesto: TDBEdit;
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
    dsActividadPresupuestoObra: TDataSource;
    dsActividad: TDataSource;
    dsEstructura: TDataSource;
    dsMaterialPresupuestoObra: TDataSource;
    qPptoMateriales: TQuery;
    dsqPptoMateriales: TDataSource;
    dsMaterial: TDataSource;
    qMateriales: TQuery;
    dsqMateriales: TDataSource;
    qTotalActividad: TQuery;
    dsTotalActividad: TDataSource;
    qListaApoyo: TQuery;
    qBorrarDatos: TQuery;
    Notebook: TNotebook;
    gbUbicacion: TGroupBox;
    Opcionurbano: TDBRadioGroup;
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
    PanelControlCantidades: TPanel;
    DBGridMaterial: TDBGrid;
    Arbol: TTreeView;
    Label9: TLabel;
    DBTGeografico: TDBText;
    sbBuscarCIG: TSpeedButton;
    dbeCIG: TDBEdit;
    qPresupuesto: TQuery;
    qEstadoPresupuesto: TQuery;
    qTipoContrato: TQuery;
    updPresupuesto: TUpdateSQL;
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
    qmaterialpresupuestoobra: TQuery;
    qActividadPresupuestoObra1: TQuery;
    updActividadPresupuestoObra: TUpdateSQL;
    qPresupuestoValorIVA: TFloatField;
    qPresupuestoCostoDirecto: TFloatField;
    qPresupuestoCostoTotal: TFloatField;
    qPresupuestoValorMaterial: TFloatField;
    qPresupuestoValorManoObra: TFloatField;
    qPresupuestoValorEquipo: TFloatField;
    qPresupuestoValorTransporte: TFloatField;
    updActividadPresupuestoObra1: TUpdateSQL;
    updMaterialPresupuestoObra: TUpdateSQL;
    qCia: TQuery;
    dsCia: TDataSource;
    DBGridActividad: TDBGrid;
    qEmpresa: TQuery;
    qUnidad: TQuery;
    dsUnidad: TDataSource;
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
    DBNavigator1: TDBNavigator;
    qActividad: TQuery;
    qActividadCODIGOACTIVIDAD: TStringField;
    qActividadCODIGOESTRUCTURA: TFloatField;
    qActividadMATERIAL: TFloatField;
    qActividadTRANSPORTE: TFloatField;
    qActividadEQUIPO: TFloatField;
    qActividadDESCRIPCION: TMemoField;
    qActividadNombreTipoActividad: TStringField;
    qActividadNombreEstructura: TStringField;
    qPresupuestoCODIGOPRESUPUESTO: TFloatField;
    qPresupuestoNUMEROPRESUPUESTO: TStringField;
    qPresupuestoCODIGOESTADOPRESUPUESTO: TStringField;
    qPresupuestoCODIGOTIPOCONTRATO: TStringField;
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
    qmaterialpresupuestoobraCODIGOPRESUPUESTO: TFloatField;
    qmaterialpresupuestoobraCODIGOMATERIAL: TFloatField;
    qmaterialpresupuestoobraVALORPRESUPUESTADO: TFloatField;
    qPresupuestoAiu: TFloatField;
    qPresupuestoValorAIU: TFloatField;
    qPresupuestoCostoDirectoSinAIU: TFloatField;
    qPresupuestoObra: TQuery;
    dsPresupuestoObra: TDataSource;
    updPresupuestoObra: TUpdateSQL;
    qPresupuestoObraCODIGOPRESUPUESTOOBRA: TFloatField;
    qPresupuestoObraCODIGOPRESUPUESTO: TFloatField;
    qPresupuestoObraCONSECUTIVO: TFloatField;
    qPresupuestoObraFECHAINICIO: TDateTimeField;
    qPresupuestoObraFECHAFIN: TDateTimeField;
    qPresupuestoObraMATERIAL: TFloatField;
    qPresupuestoObraTRANSPORTE: TFloatField;
    qPresupuestoObraEQUIPO: TFloatField;
    qPresupuestoObraMANOOBRA: TFloatField;
    qPresupuestoObraCODIGOMUNICIPIO: TFloatField;
    qPresupuestoObraCODIGOMUNICIPIODIFICULTAD: TFloatField;
    qPresupuestoObraIDPRESUPUESTO: TStringField;
    qPresupuestoObraValorIVA: TFloatField;
    qPresupuestoObraCostoDirecto: TFloatField;
    qPresupuestoObraCostoTotal: TFloatField;
    qPresupuestoNombreEstado: TStringField;
    DBEdit1: TDBEdit;
    DBEdit3: TDBEdit;
    qPresupuestoNombreTipocontrato: TStringField;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    DBNavigator2: TDBNavigator;
    qTipoActividad: TQuery;
    dsTipoactividad: TDataSource;
    qMaterialPresupuestoObraCODIGOMATERIALPRESUPUESTOOBRA: TFloatField;
    qMaterialPresupuestoObraCODIGOPRESUPUESTOOBRA: TFloatField;
    qMaterialPresupuestoObraCODIGOACTIVIDADPRESUPUESTOOBRA: TFloatField;
    qMaterialPresupuestoObraCANTIDADPRESUPUESTADA: TFloatField;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    qMaterialesCODIGOMATERIAL: TFloatField;
    qMaterialesREFERENCIA: TStringField;
    qMaterialesNOMBREMATERIAL: TStringField;
    qMaterialesVALORPRESUPUESTADO: TFloatField;
    qMaterialesCANTIDADSOLICITADA: TFloatField;
    qMaterialesCODIGOUNIDAD: TStringField;
    qMaterialesVALORUNITARIO: TFloatField;
    qMaterialesPESOUNITARIO: TFloatField;
    qMaterialesNOMBREUNIDAD: TStringField;
    qMaterialesPESOPRESUPUESTADO: TFloatField;
    qTotalActividadMATERIALPRESUPUESTADO: TFloatField;
    qTotalActividadTRANSPORTEPRESUPUESTADO: TFloatField;
    qTotalActividadMANOOBRAPRESUPUESTADO: TFloatField;
    qTotalActividadEQUIPOPRESUPUESTADO: TFloatField;
    qMaterialPresupuestoObra1CODIGOMATERIALPRESUPUESTOOBRA: TFloatField;
    qMaterialPresupuestoObra1CODIGOPRESUPUESTO: TFloatField;
    qMaterialPresupuestoObra1CODIGOPRESUPUESTOOBRA: TFloatField;
    qMaterialPresupuestoObra1CODIGOMATERIAL: TFloatField;
    qMaterialPresupuestoObra1CANTIDADPRESUPUESTADA: TFloatField;
    qMaterialPresupuestoObra1VALORPRESUPUESTADO: TFloatField;
    qMaterialPresupuestoObra1CODIGOACTIVIDADPRESUPUESTOOBRA: TFloatField;
    DBText5: TDBText;
    Label6: TLabel;
    Label19: TLabel;
    qPresupuestoObraIndiceDificultad: TFloatField;
    qPresupuestoObraNombreMunicipio: TStringField;
    qPresupuestoObraNombreGeografico: TStringField;
    qPresupuestoNombreGeografico: TStringField;
    qGeografico: TQuery;
    dsGeografico: TDataSource;
    qGeograficoCODIGOGEOGRAFICO: TFloatField;
    qGeograficoNOMBREGEOGRAFICO: TStringField;
    qGeograficoNOMBREMUNICIPIO: TMemoField;
    qGeograficoINDICEDIFICULTAD: TFloatField;
    qPresupuestoObraCODIGOGEOGRAFICO: TFloatField;
    qPresupuestoOBJETO: TBlobField;
    qGeograficoURBANO: TStringField;
    qPresupuestoCODIGOADMINISTRATIVO: TFloatField;
    gbAsignacion: TGroupBox;
    DBText6: TDBText;
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
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEditManoObra: TDBEdit;
    DBEdit7: TDBEdit;
    DBText7: TDBText;
    Bevel1: TBevel;
    Panel1: TPanel;
    qMaterialPresupuestoObra1: TQuery;
    updMaterialPresupuesto1: TUpdateSQL;
    qMaterialPresupuestoObraNOMBREMATERIAL: TStringField;
    qMaterialPresupuestoObraCODIGOUNIDAD: TStringField;
    qMaterialPresupuestoObraVALORUNITARIO: TFloatField;
    qMaterialPresupuestoObra1VALORUNITARIO: TFloatField;
    qMaterialPresupuestoObraVALORUNITARIO1: TFloatField;
    GroupBox3: TGroupBox;
    dbeFechaInicio: TDBEdit;
    dbeFechaFin: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    qActividadPresupuestoObra1CODIGOACTIVIDADPRESUPUESTO: TFloatField;
    qActividadPresupuestoObra1CODIGOACTIVIDAD: TStringField;
    qActividadPresupuestoObra1CODIGOPRESUPUESTO: TFloatField;
    qActividadPresupuestoObra1CODIGOPRESUPUESTOOBRA: TFloatField;
    qActividadPresupuestoObra1CANTIDADPRESUPUESTADA: TFloatField;
    qActividadPresupuestoObra1MATERIAL: TFloatField;
    qActividadPresupuestoObra1TRANSPORTE: TFloatField;
    qActividadPresupuestoObra1EQUIPO: TFloatField;
    qActividadPresupuestoObra1MANOOBRA: TFloatField;
    qPptoMaterialesCODIGOACTIVIDADPRESUPUESTO: TFloatField;
    qPptoMaterialesCODIGOMATERIAL: TFloatField;
    qPptoMaterialesNOMBREMATERIAL: TStringField;
    qPptoMaterialesSUMA: TFloatField;
    qActividadCODIGOTIPOACTIVIDAD: TStringField;
    qActividadMANOOBRA: TFloatField;
    qTipoActividadNOMBRETIPOACTIVIDAD: TStringField;
    qTipoActividadCODIGOTIPOACTIVIDAD: TStringField;
    qTipoPresupuesto: TQuery;
    qTipoPresupuestoCODIGOTIPOPRESUPUESTO: TStringField;
    qTipoPresupuestoNOMBRETIPOPRESUPUESTO: TStringField;
    qTipoPresupuestoMANOOBRA: TStringField;
    qTipoPresupuestoMATERIAL: TStringField;
    qTipoPresupuestoEQUIPO: TStringField;
    qTipoPresupuestoTRANSPORTE: TStringField;
    qTipoPresupuestoFactorMaterial: TIntegerField;
    qTipoPresupuestoFactorManoObra: TIntegerField;
    qTipoPresupuestoFactorTransporte: TIntegerField;
    qTipoPresupuestoFactorEquipo: TIntegerField;
    dsTipoPresupuesto: TDataSource;
    qActividadPresupuestoObra: TQuery;
    qActividadPresupuestoObraNombreTipoPresupuesto: TStringField;
    qActividadPresupuestoObraNombreTipoActividad: TStringField;
    qActividadPresupuestoObraNombreEstructura: TStringField;
    qActividadPresupuestoObraNombreActividadPresupuesto: TStringField;
    qActividadPresupuestoObraCODIGOACTIVIDADPRESUPUESTO: TFloatField;
    qActividadPresupuestoObraCODIGOPRESUPUESTO: TFloatField;
    qActividadPresupuestoObraCODIGOPRESUPUESTOOBRA: TFloatField;
    qActividadPresupuestoObraCODIGOTIPOPRESUPUESTO: TStringField;
    qActividadPresupuestoObraCANTIDADPRESUPUESTADA: TFloatField;
    qActividadPresupuestoObraMATERIAL: TFloatField;
    qActividadPresupuestoObraTRANSPORTE: TFloatField;
    qActividadPresupuestoObraEQUIPO: TFloatField;
    qActividadPresupuestoObraMANOOBRA: TFloatField;
    qActividadPresupuestoObraCODIGOACTIVIDAD: TFloatField;
    procedure BitBtnAceptarClick(Sender: TObject);
    procedure BitBtnCancelarClick(Sender: TObject);
    procedure BBCartografiaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridMaterialEditButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGridMaterialDblClick(Sender: TObject);
    procedure ArbolChange(Sender: TObject; Node: TTreeNode);
    procedure sbBuscarCIGClick(Sender: TObject);
    procedure qActividadPresupuestoObraCalcFields(DataSet: TDataSet);
    procedure qPresupuestoCalcFields(DataSet: TDataSet);
    procedure qPresupuestoFECHAASIGNACIONValidate(Sender: TField);
    procedure qPresupuestoAfterPost(DataSet: TDataSet);
    procedure qPresupuestoAfterDelete(DataSet: TDataSet);
    procedure qActividadPresupuestoObraAfterDelete(DataSet: TDataSet);
    procedure qActividadPresupuestoObraAfterPost(DataSet: TDataSet);
    procedure qmaterialpresupuestoobraAfterPost(DataSet: TDataSet);
    procedure qmaterialpresupuestoobraAfterDelete(DataSet: TDataSet);
    procedure qActividadPresupuestoObra1AfterDelete(DataSet: TDataSet);
    procedure qActividadPresupuestoObra1AfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure qActividadPresupuestoObraAfterCancel(DataSet: TDataSet);
    procedure qPresupuestoAfterCancel(DataSet: TDataSet);
    procedure qmaterialpresupuestoobraAfterCancel(DataSet: TDataSet);
    procedure qPresupuestoObraAfterCancel(DataSet: TDataSet);
    procedure qPresupuestoObraAfterDelete(DataSet: TDataSet);
    procedure qPresupuestoObraAfterPost(DataSet: TDataSet);
    procedure qPresupuestoObraCODIGOGEOGRAFICOValidate(Sender: TField);
    procedure qPresupuestoObraAfterInsert(DataSet: TDataSet);
    procedure DBGridActividadDblClick(Sender: TObject);
    procedure DBGridActividadEditButtonClick(Sender: TObject);
    procedure qActividadPresupuestoObraAfterInsert(DataSet: TDataSet);
    procedure qActividadPresupuestoObra1BeforePost(DataSet: TDataSet);
    procedure qPresupuestoObraCalcFields(DataSet: TDataSet);
    procedure qPresupuestoObraCODIGOGEOGRAFICOChange(Sender: TField);
    procedure qMaterialPresupuestoObraAfterInsert(DataSet: TDataSet);
    procedure qPresupuestoAfterOpen(DataSet: TDataSet);
    procedure qPresupuestoObraAfterOpen(DataSet: TDataSet);
    procedure qMaterialPresupuestoObraBeforePost(DataSet: TDataSet);
    procedure qActividadPresupuestoObraBeforeDelete(DataSet: TDataSet);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure qTipoPresupuestoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    sFecha,CodigoPresupuesto,CodigoPresupuestoObra,EsRetenedor,NombreContratista :String;
    ValorIndice,CodDivision,CodDepartamento,CodPrograma,CodSecuencia,codAno : String;
    ManoObraTotal,MaterialTotal,EquipoTotal,TransporteTotal, IVA, AIU : Real;
    CodigoTipoPresupuesto : Integer;
    TotalIva:real;
    bCancelando,bDatosIncompletos,bFiltrado: boolean;
    procedure ActualizarMaterialDesdePresupuesto;//Coloca los elementos de los materiales de
                                                 //las actividades qmaterialPresupuestoObra
    procedure ActualizarValoresObraDesdeActividad;
    procedure ActualizarValoresMaterial;
    procedure ActualizarValoresObraDesdeMaterial;
    procedure ActualizarValoresPresupuesto;
    procedure GenerarValoresActividad;
    procedure GenerarMaterial;
    Function GetFecha: String;
    function FechaServidor:string;
    function Redondear(Valor: Real; Redondeo: Integer):Real;
  end;
var
  fPresupuestoObra: TfPresupuestoObra;

implementation

uses uSeleccionarTipoPresupuesto, uFormaFecha, uBuscarActividad,
  uBuscarMaterialEnerGis, uInformacionContrato;


{$R *.DFM}

Function TfPresupuestoObra.GetFecha: String;
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

procedure TfPresupuestoObra.ActualizarValoresObraDesdeActividad;
var
    TotalMaterial,TotalEquipo,TotalManoObra,TotalTransporte:Double;
begin
  TotalMaterial:=0;
  TotalEquipo:=0;
  TotalManoObra:=0;
  TotalTransporte:=0;
  qActividadPresupuestoObra.First;
  while Not qActividadPresupuestoObra.Eof do
  begin
    TotalMaterial:=TotalMaterial+qActividadPresupuestoObraCANTIDADPRESUPUESTADA.AsFloat*qActividadPresupuestoObraMATERIAL.AsFloat;
    TotalTransporte:=TotalTransporte+qActividadPresupuestoObraCANTIDADPRESUPUESTADA.AsFloat*qActividadPresupuestoObraTRANSPORTE.AsFloat;
    TotalEquipo:=TotalEquipo+qActividadPresupuestoObraCANTIDADPRESUPUESTADA.AsFloat*qActividadPresupuestoObraEQUIPO.AsFloat;
    TotalManoObra:=TotalManoObra+qActividadPresupuestoObraCANTIDADPRESUPUESTADA.AsFloat*qActividadPresupuestoObraMANOOBRA.AsFloat;
    qActividadPresupuestoObra.Next;
  end;
  qPresupuestoObra.Edit;
  qPresupuestoObraMaterial.AsFloat:=TotalMaterial;
  qPresupuestoObraEquipo.AsFloat:=TotalEquipo;
  qPresupuestoObraManoObra.AsFloat:=TotalManoObra;
  qPresupuestoObraTransporte.AsFloat:=TotalTransporte;
  //ActualizarValoresPresupuesto;  
end;

procedure TfPresupuestoObra.GenerarMaterial;
begin

end;

procedure TfPresupuestoObra.ActualizarMaterialDesdePresupuesto;
begin
  qPptoMateriales.Close;
  qPptoMateriales.ParamByName('CODIGOACTIVIDADPRESUPUESTO').AsString:=qActividadPresupuestoObra.Fieldbyname('CODIGOACTIVIDADPRESUPUESTO').AsString;
  qPptoMateriales.Open;
  qPptoMateriales.First;
  try
    While Not qPptoMateriales.Eof do
    begin
      if qmaterialpresupuestoobra.Locate('CodigoPresupuestoObra;CodigoMaterial',
                                        VarArrayOf([
                                                    CodigoPresupuesto,
                                                    qPptoMaterialesCodigoMaterial.AsString
                                                    ]),
                                                    [loCaseInsensitive])then
      begin
        qmaterialpresupuestoobra.Edit;
        qMaterialPresupuestoObraCANTIDADPRESUPUESTADA.AsFloat :=qMaterialPresupuestoObraCANTIDADPRESUPUESTADA.AsFloat+qPptoMaterialesSUMA.AsFloat;
        qmaterialpresupuestoobra.Post;
      end
      else
      begin
        qmaterialpresupuestoobra.Insert;
        qmaterialpresupuestoobraCODIGOPRESUPUESTO.AsString := qPresupuestoObraCODIGOPRESUPUESTO.AsString;
        qmaterialpresupuestoobraCodigoMaterial.AsString := qPptoMaterialesCodigoMaterial.AsString;
        qMaterialPresupuestoObraCANTIDADPRESUPUESTADA.AsFloat := qPptoMaterialesSUMA.AsFloat;
        qMaterialPresupuestoObraCODIGOACTIVIDADPRESUPUESTOOBRA.AsFloat:=qPptoMaterialesCODIGOACTIVIDADPRESUPUESTO.AsFloat;
        qmaterialpresupuestoobra.Post;
      end;
      qPptoMateriales.Next;
    end;
  except
  end;
  qMaterialPresupuestoObra.Close;
  qMaterialPresupuestoObra.Open;
end;

procedure TfPresupuestoObra.GenerarValoresActividad;
Var ManoObra,Material,Equipo,Transporte:Real;
begin
  qActividadPresupuestoObra.first;
  qActividadPresupuestoObra1.Open;
  While Not qActividadPresupuestoObra.Eof do
  begin
    if qActividad.Locate('CodigoActividad',qActividadPresupuestoObra.FieldByName('CodigoActividad').AsString,[]) then
    begin
      {qTipoActividad.Close;
      qTipoActividad.ParamByName('CodigoTipoActividad').AsInteger:=qActividadCodigoTipoActividad.asInteger;
      qTipoActividad.Open;
      ManoObra :=   qActividadMANOOBRA.asfloat   * qTipoActividadFactorManoObra.AsFloat;
      Material :=   qActividadMATERIAL.asfloat   * qTipoActividadFactorMaterial.AsFloat;
      Equipo :=     qActividadEquipo.asfloat     * qTipoActividadFactorEquipo.AsFloat;
      Transporte := qActividadTransporte.asfloat * qTipoActividadFactorTransporte.AsFloat;}

      ManoObra :=   qActividadMANOOBRA.asfloat   * {qTipoPresupuestoFactorManoObra.AsFloat}1;
      Material :=   qActividadMATERIAL.asfloat   * {qTipoPresupuestoFactorMaterial.AsFloat}1;
      Equipo :=     qActividadEquipo.asfloat     * {qTipoPresupuestoFactorEquipo.AsFloat}1;
      Transporte := qActividadTransporte.asfloat * {qTipoPresupuestoFactorTransporte.AsFloat}1;
      
      if qActividadPresupuestoObra1.Locate('CODIGOACTIVIDAD;CODIGOPRESUPUESTOOBRA',VarArrayOf([qActividadPresupuestoObraCODIGOACTIVIDAD.AsString,qActividadPresupuestoObraCODIGOPRESUPUESTOOBRA.AsString]),[]) then
      begin
        qActividadPresupuestoObra1.Edit;
        qActividadPresupuestoObra1MATERIAL.asfloat:=Redondear(MATERIAL,2);
        qActividadPresupuestoObra1TRANSPORTE.asfloat:=Redondear(TRANSPORTE*qPresupuestoObraIndiceDificultad.AsFloat,2);
        qActividadPresupuestoObra1EQUIPO.asfloat:=Redondear(EQUIPO*qPresupuestoObraIndiceDificultad.AsFloat,2);
        qActividadPresupuestoObra1MANOOBRA.asfloat:=Redondear(MANOOBRA*qPresupuestoObraIndiceDificultad.AsFloat,2);
        qActividadPresupuestoObra1.Post;
      end;
    end;
    qActividadPresupuestoObra.Next;
  end;
  qActividadPresupuestoObra1.Close;
  qActividadPresupuestoObra.Close;
  qActividadPresupuestoObra.Open;
  qTipoActividad.Close;
end;

procedure TfPresupuestoObra.BitBtnAceptarClick(Sender: TObject);
begin
  inherited;
  bDatosIncompletos := False;
  bCancelando := False;
  try
    qPresupuestoObra.Post;
    ActualizarValoresPresupuesto;
    qPresupuesto.Post;
    ModalResult:=MrOk;
    close;
 Except
    bDatosIncompletos := True;
    ModalResult:=MrCancel;
    Close;
 end;
end;

procedure TfPresupuestoObra.BitBtnCancelarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Perderá los cambios realizados.Esta seguro de Cancelar?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
  begin
    qPresupuesto.Cancel;
    qPresupuestoObra.Cancel;
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

procedure TfPresupuestoObra.BBCartografiaClick(Sender: TObject);
var ListaApoyo,Lista : TStringList;
begin
  bDatosIncompletos := False;
  try
    qPresupuesto.Post;
    qPresupuesto.Edit;
  except
  end;
  if CodigoPresupuesto='' then CodigoPresupuesto:= qPresupuesto.FieldByName('CodigoPresupuesto').AsString;
  FInformacionContrato := TFInformacionContrato.Create(Application);
  FInformacionContrato.Visible := False;
  FInformacionContrato.Caption :='Presupuesto # '+qPresupuesto.FieldByName('idPresupuesto').AsString; //Cambio Octubre
  FInformacionContrato.Top := screen.Height - FInformacionContrato.height;
  FInformacionContrato.Show;
  FInformacionContrato.Mobjeto.text := MObjeto.Text;
  FInformacionContrato.Contrato := CodigoPresupuesto;
  BorderStyle := bsToolWindow;
  FormStyle := fsStayOnTop;
  WindowState := wsMinimized;
  Visible := False;

  Lista := TStringList.create;
  Lista.Add('VarCodigoEstadoInfraestructura='+'2');
  Lista.Add('VarCodigoContrato='+CodigoPresupuesto);
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
   qListaApoyo.ParamByName('Codigo').AsInteger := StrToInt(CodigoPresupuesto);
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
{ try
 except
    bDatosIncompletos := True;
 end;
}end;

procedure TfPresupuestoObra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (bCancelando) and (bDatosIncompletos) then // CierroCancelando
  begin
    if qPresupuestoObra.Database.InTransaction then qPresupuestoObra.Database.Rollback;
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
       if qPresupuestoObra.Database.InTransaction then qPresupuestoObra.Database.Rollback;
       Action := caHide;
    end;
  end;
end;


procedure TfPresupuestoObra.DBGridMaterialEditButtonClick(Sender: TObject);
var i:Integer;
    Material:String;
    qValidacionMaterial:TQuery;
begin
try
  fBuscarMaterialEnerGis := TfBuscarMaterialEnergis.Create(Application);
  if fBuscarMaterialEnerGis.ShowModal = mrOk then
  begin
    if fBuscarMaterialEnerGis.DBGridBuscarMaterial.SelectedRows.Count>0 then
    begin
      for i:=0 to fBuscarMaterialEnerGis.DBGridBuscarMaterial.SelectedRows.Count-1 do
      begin
        fBuscarMaterialEnerGis.qMaterial.BookMark:=fBuscarMaterialEnerGis.DBGridBuscarMaterial.SelectedRows.Items[i];
        try

           if (i=0) and (DBGridMaterial.Fields[0].text<>'')
            then qmaterialpresupuestoobra.Edit
            else
            begin
              if qmaterialpresupuestoobra.State in [dsInsert] then
              qmaterialpresupuestoobra.Cancel;
              qmaterialpresupuestoobra.Insert;
            end;
            qValidacionMaterial:=TQuery.Create(nil);
            qValidacionMaterial.DatabaseName:='BaseDato';
            qValidacionMaterial.Close;
            qValidacionMaterial.SQL.Clear;
            qValidacionMaterial.SQL.Add('SELECT * FROM MATERIALPRESUPUESTOOBRA ');
            qValidacionMaterial.SQL.Add('WHERE CODIGOPRESUPUESTO='+qPresupuestoObraCodigopresupuesto.AsString+' AND ');
            qValidacionMaterial.SQL.Add('CODIGOPRESUPUESTOOBRA='+qPresupuestoObraCodigopresupuestoObra.AsString+' AND ');
            qValidacionMaterial.SQL.Add('CODIGOMATERIAL='+fBuscarMaterialEnerGis.qMaterial.fieldbyName('CodigoMaterial').asstring);
            qValidacionMaterial.open;
            if qValidacionMaterial.RecordCount=0 then
              begin
                qmaterialpresupuestoobra.FieldbyName('CodigoMaterial').asstring := fBuscarMaterialEnerGis.qMaterial.fieldbyName('CodigoMaterial').asstring;
                qmaterialpresupuestoobraCANTIDADPRESUPUESTADA.asfloat := qmaterialpresupuestoobraCANTIDADPRESUPUESTADA.asfloat+1;
                qmaterialpresupuestoobra.Post;
                qmaterialpresupuestoobra.Insert;
              end
            else
              Begin
               application.MessageBox('Este Material ya ha sido agregado','Materiales',MB_ICONWARNING);
               qActividadPresupuestoObra.Cancel;
              end;
            qValidacionMaterial.free;
          except
          on E:Exception do
          begin
            qmaterialpresupuestoobra.Cancel;
            qValidacionMaterial.free;
          end;
        end;
      end;

      if qmaterialpresupuestoobra.State in [dsInsert] then
        qmaterialpresupuestoobra.Cancel;
      qmaterialpresupuestoobra.Active := False;
      qmaterialpresupuestoobra.Active := True;
      if (not qmaterialpresupuestoobra.IsEmpty) and (qmaterialpresupuestoobraCODIGOMATERIAL.AsFloat = 0) then
        qmaterialpresupuestoobra.Delete;
    end;
  end;
  Finally;
  fBuscarMaterialEnerGis.Free;
  end;
end;

procedure TfPresupuestoObra.FormActivate(Sender: TObject);
begin
  inherited;
  if CodigoPresupuesto =''
  then CodigoPresupuesto := qPresupuesto.fieldByName('CodigoPresupuesto').AsString;
  Notebook.PageIndex:=0;
  CodigoPresupuesto := qPresupuestoCODIGOPresupuesto.AsString;
  CodigoTipoPresupuesto:=0;
  qActividadPresupuestoObra.Close;
  qActividadPresupuestoObra.Open;
  qmaterialpresupuestoobra.Close;
  qmaterialpresupuestoobra.Open;
end;

procedure TfPresupuestoObra.DBGridMaterialDblClick(Sender: TObject);
begin
  qMaterialPresupuestoObra.Edit;
end;

procedure TfPresupuestoObra.ArbolChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;
  if Node.Text='Información' then
   Notebook.PageIndex:=0
  else if Node.Text='Actividades' then
   Notebook.PageIndex:=1
  else if Node.Text='Materiales' then
   Notebook.PageIndex:=2;
end;

procedure TfPresupuestoObra.sbBuscarCIGClick(Sender: TObject);
var CIG:INTEGER;
begin
  CIG := CapturarCIG;
  if CIG<>0 then qPresupuestoObraCODIGOGEOGRAFICO.AsInteger:=CIG;
end;

procedure TfPresupuestoObra.qActividadPresupuestoObraCalcFields(DataSet: TDataSet);
var qDescripcion:TQuery;

begin
  try
    if qActividadPresupuestoObraCODIGOACTIVIDAD.AsString<>'' then
    begin
      qDescripcion:=TQuery.Create(self);
      qDescripcion.DatabaseName:='BaseDato';
      qDescripcion.sql.Text:='Select descripcion from actividad where codigoactividad='+qActividadPresupuestoObraCODIGOACTIVIDAD.AsString;
      qDescripcion.Open;
      if qDescripcion.Fields[0].asstring<>'' then
      begin
        qActividadPresupuestoObraNombreActividadPresupuesto.AsString:= qDescripcion.Fields[0].asstring;
      end
      else
      begin
        qActividadPresupuestoObraNombreActividadPresupuesto.AsString:=
        qActividadPresupuestoObraNombreTipoPresupuesto.AsString+' '+
        qActividadPresupuestoObraNombreTipoActividad.AsString+' DE '+
        qActividadPresupuestoObraNombreEstructura.AsString;
      end;
      qDescripcion.Free;
    end;
  except
  end;
end;


procedure TfPresupuestoObra.qPresupuestoCalcFields(DataSet: TDataSet);
var
  IVA,AIU,Material,ManoObra,Equipo,Transporte,Utilidades,Administracion,Imprevistos,
  ValorTotal,Suma,SumaAIU,SumaIVA:Double;
  query:tquery;  
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
    query:=TQuery.Create(self);
    query.DatabaseName:='BaseDato';
    query.sql.text:='SELECT NOMBREGEOGRAFICO FROM GEOGRAFICO WHERE CODIGOGEOGRAFICO='+qPresupuestoCODIGOGEOGRAFICO.AsString;
    query.open;
    qPresupuestoNombreGeografico.AsString:=query.fields[0].AsString;
    query.free;
  end;
end;

procedure TfPresupuestoObra.qPresupuestoFECHAASIGNACIONValidate(Sender: TField);
begin
  inherited;
  if qPresupuestoFECHAPresupuesto.AsDateTime=0
  then raise Exception.Create('La Fecha de Presupuesto no debe estar en blanco.')
  else if Sender.AsDateTime < qPresupuestoFECHAPresupuesto.AsDateTime
    then raise Exception.Create('LA Fecha de Asignación de Obra debe ser mayor que la Fecha de Presupuesto.');
end;

procedure TfPresupuestoObra.qPresupuestoAfterPost(DataSet: TDataSet);
begin
  inherited;
  qPresupuesto.ApplyUpdates;
  qPresupuesto.CommitUpdates;
end;

procedure TfPresupuestoObra.qPresupuestoAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qPresupuesto.ApplyUpdates;
  qPresupuesto.CommitUpdates;
end;

procedure TfPresupuestoObra.qActividadPresupuestoObraAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qActividadPresupuestoObra.ApplyUpdates;
  qActividadPresupuestoObra.CommitUpdates;
  ActualizarValoresObraDesdeActividad;
  ActualizarValoresObraDesdeMaterial;
  ActualizarValoresPresupuesto;
  qMaterialPresupuestoObra.close;
  qMaterialPresupuestoObra.Open;

  qPresupuesto.Close;
  qPresupuesto.Open;
end;

procedure TfPresupuestoObra.qActividadPresupuestoObraAfterPost(DataSet: TDataSet);
begin
  inherited;
  qActividadPresupuestoObra.ApplyUpdates;
  qActividadPresupuestoObra.CommitUpdates;
  GenerarValoresActividad;
  ActualizarValoresObraDesdeActividad;
  ActualizarMaterialDesdePresupuesto;
end;

procedure TfPresupuestoObra.qmaterialpresupuestoobraAfterPost(DataSet: TDataSet);
begin
  qmaterialpresupuestoobra.ApplyUpdates;
  qmaterialpresupuestoobra.CommitUpdates;
  ActualizarValoresObraDesdeMaterial;
end;

procedure TfPresupuestoObra.qmaterialpresupuestoobraAfterDelete(DataSet: TDataSet);
begin
  qmaterialpresupuestoobra.ApplyUpdates;
  qmaterialpresupuestoobra.CommitUpdates;
  ActualizarValoresObraDesdeMaterial;
  ActualizarValoresPresupuesto;
end;

procedure TfPresupuestoObra.qActividadPresupuestoObra1AfterDelete(DataSet: TDataSet);
begin
  qActividadPresupuestoObra1.ApplyUpdates;
  qActividadPresupuestoObra1.CommitUpdates;
end;

procedure TfPresupuestoObra.qActividadPresupuestoObra1AfterPost(DataSet: TDataSet);
begin
  qActividadPresupuestoObra1.ApplyUpdates;
  qActividadPresupuestoObra1.CommitUpdates;
end;

procedure TfPresupuestoObra.FormCreate(Sender: TObject);
begin
  qEstadoPresupuesto.Open;
  qTipoContrato.Open;
  qGeografico.Open;
  qEmpresa.Open;
  qPresupuesto.Open;
  qActividadPresupuestoObra.Open;
  qMaterialPresupuestoObra.Open;

  qPresupuestoobra.Open;
  qEstructura.Open;
  //qTipoActividad.Open;
  qUnidad.Open;
  qActividad.Open;
  inherited;
end;



function TfPresupuestoObra.FechaServidor: string;
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

procedure TfPresupuestoObra.qActividadPresupuestoObraAfterCancel(DataSet: TDataSet);
begin
  inherited;
  qActividadPresupuestoObra.CancelUpdates;
end;

procedure TfPresupuestoObra.qPresupuestoAfterCancel(DataSet: TDataSet);
begin
  inherited;
  qPresupuesto.CancelUpdates;
end;

procedure TfPresupuestoObra.qmaterialpresupuestoobraAfterCancel(DataSet: TDataSet);
begin
  inherited;
  qmaterialpresupuestoobra.CancelUpdates;
end;

procedure TfPresupuestoObra.qPresupuestoObraAfterCancel(DataSet: TDataSet);
begin
  inherited;
  qPresupuestoObra.CancelUpdates;
end;

procedure TfPresupuestoObra.qPresupuestoObraAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qPresupuestoObra.ApplyUpdates;
  qPresupuestoObra.CommitUpdates;
end;

procedure TfPresupuestoObra.qPresupuestoObraAfterPost(DataSet: TDataSet);
begin
  inherited;
  qPresupuestoObra.ApplyUpdates;
  qPresupuestoObra.CommitUpdates;
end;

procedure TfPresupuestoObra.qPresupuestoObraCODIGOGEOGRAFICOValidate(
  Sender: TField);
var qDatos:tquery;
codigoarbol1,codigoarbol2:string;
begin
  if (sender.AsString<>'') then
  begin
    qDatos:=TQuery.Create(self);
    if (qPresupuestoCODIGOGEOGRAFICO.AsString<>'') then
    begin
      qDatos.DatabaseName:='BaseDato';
      qDatos.sql.add('SELECT CODIGOARBOL FROM GEOGRAFICO');
      qDatos.sql.add('WHERE CODIGOGEOGRAFICO='+qPresupuestoCODIGOGEOGRAFICO.AsString);
      qDatos.open;
      codigoarbol1:=qDatos.fields[0].AsString;
      qDatos.close;
      qDatos.sql.clear;
      qDatos.sql.add('SELECT CODIGOARBOL FROM GEOGRAFICO');
      qDatos.sql.add('WHERE CODIGOGEOGRAFICO='+Sender.AsString);
      qDatos.open;
      codigoarbol2:=qDatos.fields[0].AsString;
      if length(codigoarbol2)>=Length(codigoarbol2) then
        codigoarbol2:=copy(codigoarbol2,1,length(codigoarbol1));
      if codigoarbol1<>codigoarbol2 then
       raise Exception.Create('La ubicación de la obra debe estar dentro de '+ qPresupuestonombregeografico.AsString);
    end
    else
      raise Exception.Create('Debe ingresar primero el código CIG del presupuesto');
    qDatos.free;
  end;
end;

procedure TfPresupuestoObra.qPresupuestoObraAfterInsert(DataSet: TDataSet);
begin
  inherited;
  qPresupuestoObraCODIGOPRESUPUESTO.AsString:=qPresupuestoCODIGOPRESUPUESTO.AsString;
end;

procedure TfPresupuestoObra.DBGridActividadDblClick(Sender: TObject);
begin
  inherited;
   qActividadPresupuestoObra.Edit;
end;

procedure TfPresupuestoObra.DBGridActividadEditButtonClick(
  Sender: TObject);
var i:Integer;
qValidacionActividad:TQuery;
begin
try
  fBuscarActividad := TfBuscarActividad.Create(Application);
  if fBuscarActividad.ShowModal = mrOk then
  begin
    if fBuscarActividad.DBGridActividad.SelectedRows.Count>0 then
    begin
      for i:=0 to fBuscarActividad.DBGridActividad.SelectedRows.Count-1 do
      begin
        fBuscarActividad.qActividad.BookMark:=fBuscarActividad.DBGridActividad.SelectedRows.Items[i];
        try
           if (i=0) and (DBGridActividad.Fields[0].text<>'')
            then qActividadPresupuestoObra.Edit
            else
            begin
              if qActividadPresupuestoObra.State in [dsInsert] then
              qActividadPresupuestoObra.Cancel;
              qActividadPresupuestoObra.Insert;
            end;
            qValidacionActividad:=TQuery.Create(nil);
            qValidacionActividad.DatabaseName:='BaseDato';
            qValidacionActividad.Close;
            qValidacionActividad.SQL.Clear;
            qValidacionActividad.SQL.Add('SELECT * FROM ACTIVIDADPRESUPUESTOOBRA ');
            qValidacionActividad.SQL.Add('WHERE CODIGOPRESUPUESTO='+qPresupuestoObraCodigopresupuesto.AsString+' AND ');
            qValidacionActividad.SQL.Add('CODIGOPRESUPUESTOOBRA='+qPresupuestoObraCodigopresupuestoObra.AsString+' AND ');
            qValidacionActividad.SQL.Add('CODIGOACTIVIDAD='''+fBuscarActividad.qActividadCODIGOACTIVIDAD.asstring+'''');
            qValidacionActividad.open;
            if qValidacionActividad.RecordCount=0 then
              begin
                qActividadPresupuestoObra.fieldbyName('CODIGOACTIVIDAD').asstring := fBuscarActividad.qActividadCODIGOACTIVIDAD.asstring;
                qActividadPresupuestoObra.fieldbyName('CANTIDADPRESUPUESTADA').asfloat := 1;
                qActividadPresupuestoObra.fieldbyName('CodigoTipoPRESUPUESTO').AsInteger :=CodigoTipoPresupuesto;
                qActividadPresupuestoObra.Post;
                qActividadPresupuestoObra.Insert;
              end
            else
              Begin
               application.MessageBox('Esta Actividad ya ha sido agregada','Actividades',MB_ICONWARNING);
               qActividadPresupuestoObra.Cancel;
              end;
            qValidacionActividad.free;

          except
          on E:Exception do
          begin
            qActividadPresupuestoObra.Cancel;
            qValidacionActividad.free;
          end;
        end; 
      end;

      if qActividadPresupuestoObra.State in [dsInsert] then
        qActividadPresupuestoObra.Cancel;
      qActividadPresupuestoObra.Active := False;
      qActividadPresupuestoObra.Active := True;
      if (not qActividadPresupuestoObra.IsEmpty) and (qActividadPresupuestoObraCODIGOACTIVIDAD.AsFloat = 0) then
        qActividadPresupuestoObra.Delete;
    end;
  end;
  Finally;
    fBuscarActividad.Free;
  end;
end;

procedure TfPresupuestoObra.qActividadPresupuestoObraAfterInsert(
  DataSet: TDataSet);
var query:tquery;
codigo:integer;
begin
  query:=TQuery.create(self);
  query.databasename:='BaseDato';
  query.sql.text:='SELECT MAX(CODIGOACTIVIDADPRESUPUESTO) FROM ACTIVIDADPRESUPUESTOOBRA';
  query.open;
  codigo:=1;
  if query.fields[0].AsString<>'' then codigo:=query.fields[0].asinteger+1;
  qActividadPresupuestoObraCODIGOACTIVIDADPRESUPUESTO.asinteger :=codigo ;
  qActividadPresupuestoObra.fieldbyName('CODIGOPRESUPUESTO').asstring := qPresupuestoCODIGOPRESUPUESTO.AsString;
  qActividadPresupuestoObra.fieldbyName('CODIGOPRESUPUESTOOBRA').asstring := qPresupuestoObraCODIGOPRESUPUESTOOBRA.AsString;
  query.free;
end;

procedure TfPresupuestoObra.ActualizarValoresObraDesdeMaterial;
var totalpres:double;
begin
  qMaterialPresupuestoObra1.close;
  qMaterialPresupuestoObra1.open;
  qMaterialPresupuestoObra1.First;
  Totalpres := 0;
  while Not qMaterialPresupuestoObra1.Eof do
  begin
    Totalpres:=Totalpres+(qMaterialPresupuestoObra1CANTIDADPRESUPUESTADA.AsFloat*qMaterialPresupuestoObra1VALORUNITARIO.AsFloat);
    qMaterialPresupuestoObra1.Next;
  end;

  qPresupuestoObraMATERIAL.AsFloat:=TotalPres;

  if length(qPresupuestoObraEquipo.AsString)=0 then
    qPresupuestoObraEquipo.AsFloat:=0;
  if length(qPresupuestoObraManoObra.AsString)=0 then
    qPresupuestoObraManoObra.AsFloat:=0;
  if length(qPresupuestoObraTransporte.AsString)=0 then
    qPresupuestoObraTransporte.AsFloat:=0;
  qMaterialPresupuestoObra.close;
  qMaterialPresupuestoObra.open;

end;

procedure TfPresupuestoObra.ActualizarValoresPresupuesto;
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

procedure TfPresupuestoObra.qActividadPresupuestoObra1BeforePost(
  DataSet: TDataSet);
begin
  if qActividadPresupuestoObraCODIGOACTIVIDAD.AsString='' then
    DataSet.cancel;
end;


procedure TfPresupuestoObra.qPresupuestoObraCalcFields(DataSet: TDataSet);
begin
  qGeografico.close;
  qGeografico.parambyname('CODIGOGEOGRAFICO').asstring:=qPresupuestoObraCODIGOGEOGRAFICO.AsString;
  qGeografico.open;
  qPresupuestoObraNombreGeografico.AsString:=qGeografico.fieldbyname('NombreGeografico').AsString;
  qPresupuestoObraNombreMunicipio.AsString:=qGeografico.fieldbyname('NombreMunicipio').AsString;
  qPresupuestoObraIndiceDificultad.AsString:=qGeografico.fieldbyname('IndiceDificultad').AsString;
  qPresupuestoObraCostoTotal.AsFloat:=qPresupuestoObraMaterial.AsFloat+qPresupuestoObraEquipo.AsFloat+
                                      qPresupuestoObraTransporte.AsFloat+qPresupuestoObraManoObra.AsFloat;
end;

procedure TfPresupuestoObra.qPresupuestoObraCODIGOGEOGRAFICOChange(
  Sender: TField);
begin
  inherited;
  qGeografico.close;
  qGeografico.open;
end;

procedure TfPresupuestoObra.qMaterialPresupuestoObraAfterInsert(
  DataSet: TDataSet);
var query:tquery;
codigo:integer;
begin                     
  query:=TQuery.create(self);
  query.databasename:='BaseDato';
  query.sql.text:='SELECT MAX(CODIGOMATERIALPRESUPUESTOOBRA) FROM MATERIALPRESUPUESTOOBRA';
  query.open;
  codigo:=1;
  if query.fields[0].AsString<>'' then codigo:=query.fields[0].asinteger+1;
  qMaterialPresupuestoObraCODIGOMATERIALPRESUPUESTOOBRA.AsInteger:=Codigo;
  query.free;
  qMaterialPresupuestoObraCODIGOPRESUPUESTOOBRA.asstring := qPresupuestoObraCODIGOPRESUPUESTOOBRA.AsString;
  qMaterialPresupuestoObraCODIGOPRESUPUESTO.AsString := qPresupuestoObraCODIGOPRESUPUESTO.AsString;
end;

procedure TfPresupuestoObra.qPresupuestoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  qCia.close;
  qCia.open;
end;

procedure TfPresupuestoObra.qPresupuestoObraAfterOpen(DataSet: TDataSet);
begin
  qActividadPresupuestoObra.open;
  qMaterialPresupuestoObra.open;
end;

procedure TfPresupuestoObra.qMaterialPresupuestoObraBeforePost(
  DataSet: TDataSet);
begin
try
  IF qmaterialpresupuestoobraCODIGOMATERIAL.AsString <>'' then
  begin
    qMaterial.close;
    qMaterial.Filter:=' CODIGOMATERIAL='+qmaterialpresupuestoobraCODIGOMATERIAL.AsString;
    qMaterial.open;
    qMaterialPresupuestoObraVALORUNITARIO.AsFloat:=qMaterialVALORUNITARIO.AsFloat;
  end;
  ActualizarValoresMaterial;
  except
  end;
end;

procedure TfPresupuestoObra.ActualizarValoresMaterial;
begin
  qMaterialPresupuestoObraVALORPRESUPUESTADO.AsFloat:=qMaterialPresupuestoObraVALORUNITARIO.AsFloat*
    qMaterialPresupuestoObraCANTIDADPRESUPUESTADA.AsFloat;
end;

procedure TfPresupuestoObra.qActividadPresupuestoObraBeforeDelete(
  DataSet: TDataSet);
var
qry:Tquery;
begin
  inherited;
  qry:=Tquery.Create(nil);
  qry.DatabaseName:='BaseDato';
  qry.SQL.Clear;
  qry.SQL.Add('DELETE FROM MATERIALPRESUPUESTOOBRA WHERE CODIGOACTIVIDADPRESUPUESTOOBRA=');
  qry.SQL.Add(qActividadPresupuestoObraCODIGOACTIVIDADPRESUPUESTO.AsString);
  qry.ExecSQL;
  qry.Free;

end;

procedure TfPresupuestoObra.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dbeFechaInicio.SetFocus;
  sFecha := dbeFechaInicio.Text;
  qPresupuestoObra.fieldbyName('FECHAINICIO').asstring := GetFecha;
end;

procedure TfPresupuestoObra.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  dbeFechaFin.SetFocus;
  sFecha := dbeFechaFin.Text;
  qPresupuestoObra.fieldbyName('FECHAFIN').asstring := GetFecha;
end;
function TfPresupuestoObra.Redondear(Valor: Real; Redondeo: Integer):Real;
begin 
Redondear := Trunc(Valor * Power(10, Redondeo)) / Power(10,Redondeo);
end;
procedure TfPresupuestoObra.qTipoPresupuestoCalcFields(DataSet: TDataSet);
begin
  inherited;
 { if qTipoPresupuestoMANOOBRA.AsString='S' then qTipoPresupuestoFactorManoObra.Asinteger:=1
  else qTipoPresupuestoFactorManoObra.Asinteger:=0;
  if qTipoPresupuestoMATERIAL.AsString='S' then qTipoPresupuestoFactorMaterial.Asinteger:=1
  else qTipoPresupuestoMaterial.Asinteger:=0;
  if qTipoPresupuestoEQUIPO.AsString='S' then qTipoPresupuestoFactorEquipo.Asinteger:=1
  else qTipoPresupuestoFactorEquipo.Asinteger:=0;
  if qTipoPresupuestoTRANSPORTE.AsString='S' then qTipoPresupuestoFactorTransporte.Asinteger:=1
  else qTipoPresupuestoFactorTransporte.Asinteger:=0;    }
end;

end.

