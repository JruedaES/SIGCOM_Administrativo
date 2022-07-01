unit uFiltroMantenimientosPendientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Db, DBTables, Digisoft;

type
  TfFiltroMantenimientosPendientes = class(TForm)
    qCircuito: TQuery;
    qCircuitoCODIGOCIRCUITO: TStringField;
    qCircuitoCODIGOSUBESTACION: TStringField;
    qCircuitoCODIGONIVELTENSION: TStringField;
    qCircuitoNOMBRECIRCUITO: TStringField;
    qCircuitoCODIGOAPOYO: TFloatField;
    dsCircuito: TDataSource;
    qSubestacion: TQuery;
    qSubestacionCODIGOSUBESTACION: TStringField;
    qSubestacionNOMBRESUBESTACION: TStringField;
    dsSubestacion: TDataSource;
    qElemento: TQuery;
    qElementoCODIGOELEMENTO: TFloatField;
    qElementoCODIGOTIPOELEMENTO: TStringField;
    qElementoCODIGOAMBITO: TFloatField;
    qElementoNOMBRETABLAELEMENTO: TStringField;
    qElementoNUMEROCLAVESELEMENTO: TFloatField;
    qElementoCLAVEELEMENTO1: TStringField;
    qElementoCLAVEELEMENTO2: TStringField;
    qElementoCLAVEELEMENTO3: TStringField;
    qElementoNOMBRETIPOELEMENTO: TStringField;
    qElementoCAMPODESCRIPTIVO: TStringField;
    dsElemento: TDataSource;
    dsEstadoMtto: TDataSource;
    qEstadoMtto: TQuery;
    qEstadoMttoCODIGOESTADOTAREA: TFloatField;
    qEstadoMttoNOMBREESTADO: TStringField;
    dsNivelTension: TDataSource;
    qNivelTension: TQuery;
    qNivelTensionCODIGONIVELTENSION: TStringField;
    qNivelTensionTENSION: TFloatField;
    qNivelTensionCOLOR: TFloatField;
    qNivelTensionNIVEL: TStringField;
    dsTipoMtto: TDataSource;
    qTipoMtto: TQuery;
    qTipoMttoCODIGOTIPOMANT: TFloatField;
    qTipoMttoNOMBREMANT: TStringField;
    tdMTFiltro: tdMemTable;
    tdMTFiltroCodigoSubestacion: TStringField;
    tdMTFiltroCodigoElemento: TIntegerField;
    tdMTFiltroCodigotipomant: TIntegerField;
    tdMTFiltroCodigoNivelTension: TStringField;
    tdMTFiltroCodigoEstadoTarea: TIntegerField;
    tdMTFiltroCodigoCircuito: TStringField;
    tdMTFiltroCodigoAreaOperacionOdt: TIntegerField;
    qmantenimientos2: TQuery;
    qmantenimientos2CODIGOTAREA: TFloatField;
    qmantenimientos2FECHAINICIAL: TDateTimeField;
    qmantenimientos2FECHAFINAL: TDateTimeField;
    qmantenimientos2NOMBRETAREA: TStringField;
    qmantenimientos2CODIGOMANTENIMIENTO: TFloatField;
    qmantenimientos2CODIGOTIPOMANT: TFloatField;
    qmantenimientos2NOMBREMANT: TStringField;
    dsMantenimientos2: TDataSource;
    dsFiltro: TDataSource;
    qCaracteristicasElemento: TQuery;
    qCaracteristicasElementoCODIGOELEMENTO: TFloatField;
    qCaracteristicasElementoCODIGOTIPOELEMENTO: TStringField;
    qCaracteristicasElementoCODIGOAMBITO: TFloatField;
    qCaracteristicasElementoNOMBRETABLAELEMENTO: TStringField;
    qCaracteristicasElementoNUMEROCLAVESELEMENTO: TFloatField;
    qCaracteristicasElementoCLAVEELEMENTO1: TStringField;
    qCaracteristicasElementoCLAVEELEMENTO2: TStringField;
    qCaracteristicasElementoCLAVEELEMENTO3: TStringField;
    qCaracteristicasElementoNOMBRETIPOELEMENTO: TStringField;
    qCaracteristicasElementoCAMPODESCRIPTIVO: TStringField;
    tdMemTable1: tdMemTable;
    tdMemTable1FechaInicial: TDateField;
    tdMemTable1FechaFinal: TDateField;
    tdMemTable1CodigoElemento: TIntegerField;
    tdMemTable1Clelemento1: TStringField;
    tdMemTable1Clelemento2: TStringField;
    dsFechas: TDataSource;
    qTablaElemento: TQuery;
    qElementoMantenimiento: TQuery;
    qCoordinacion: TQuery;
    dsCoordinacion: TDataSource;
    dsElementoMantenimiento: TDataSource;
    qMantenimientos: TQuery;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    eDesde: TEdit;
    eHasta: TEdit;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lLinea: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    lbTipoMtto: TLabel;
    lbNivelTension: TLabel;
    lbEstadoMtto: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label3: TLabel;
    Elemento: TDBLookupComboBox;
    Linea: TDBLookupComboBox;
    cbElemento: TComboBox;
    DBEFechaInicial: TDBEdit;
    DBEFechaFinal: TDBEdit;
    DBLCBTipoMtto: TDBLookupComboBox;
    DBLCBNivelTension: TDBLookupComboBox;
    DBLCBEstadoMtto: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEEstadoMtto: TDBEdit;
    DBLCBSubestacion: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLCBCoordinacion: TDBLookupComboBox;
    GroupBox5: TGroupBox;
    rbLinea: TRadioButton;
    rbSubestacion: TRadioButton;
    codigo1: TListBox;
    codigo2: TListBox;
    Panel2: TPanel;
    BitBtnAnularFiltro: TBitBtn;
    bitBFiltrar: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFiltroMantenimientosPendientes: TfFiltroMantenimientosPendientes;

implementation

{$R *.DFM}

end.
