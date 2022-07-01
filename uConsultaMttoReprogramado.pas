unit uConsultaMttoReprogramado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, ComCtrls, ExtCtrls, Db, DBTables, Grids,
  DBGrids, RXDBCtrl, Mask, Digisoft, udSgdListaBase;

type
  TfConsultaMttoReprogramado = class(TForm)
//    TfConsultaMttoReprogramado = class(TFdSgdListaBase)
    dsElemento: TDataSource;
    qElemento: TQuery;
    qSubestacion: TQuery;
    dsSubestacion: TDataSource;
    qCaracteristicasElemento: TQuery;
    qTablaElemento: TQuery;
    qCircuito: TQuery;
    dsCircuito: TDataSource;
    qMantenimientos: TQuery;
    dsMantenimientos: TDataSource;
    qElementoMantenimiento: TQuery;
    dsElementoMantenimiento: TDataSource;
    qmantenimientos2: TQuery;
    qCircuitoCODIGOCIRCUITO: TStringField;
    qCircuitoCODIGOSUBESTACION: TStringField;
    qCircuitoCODIGONIVELTENSION: TStringField;
    qCircuitoNOMBRECIRCUITO: TStringField;
    qCircuitoCODIGOAPOYO: TFloatField;
    qSubestacionCODIGOSUBESTACION: TStringField;
    qSubestacionNOMBRESUBESTACION: TStringField;
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
    qmantenimientos2CODIGOTAREA: TFloatField;
    qmantenimientos2FECHAINICIAL: TDateTimeField;
    qmantenimientos2FECHAFINAL: TDateTimeField;
    qmantenimientos2CODIGOBANCOMANTENIMIENTO: TFloatField;
    qmantenimientos2CODIGOMANTENIMIENTO: TFloatField;
    qmantenimientos2NOMBREMANTENIMIENTO: TStringField;
    qmantenimientos2CODIGOTIPOMANT: TFloatField;
    qmantenimientos2CODIGOACTIVIDADMANTENIMIENTO: TFloatField;
    qmantenimientos2NOMBREACTIVIDADMANTENIMIENTO: TStringField;
    qmantenimientos2NOMBREMANT: TStringField;
    qMantenimientosCODIGOTAREA: TFloatField;
    qMantenimientosNOMBRETAREA: TStringField;
    qMantenimientosFECHAINICIALANTERIOR: TDateTimeField;
    qMantenimientosFECHAFINALANTERIOR: TDateTimeField;
    qMantenimientosFECHAINICIALNUEVA: TDateTimeField;
    qMantenimientosFECHAFINALNUEVA: TDateTimeField;
    qMantenimientosMOTIVOREPROGRAMACION: TStringField;
    tdMemTable1: tdMemTable;
    tdMemTable1FechaInicial: TDateField;
    tdMemTable1FechaFinal: TDateField;
    dsFechas: TDataSource;
    panelTotal: TPanel;
    PanelMedio: TPanel;
    sbProgramar: TSpeedButton;
    PanelSCentral: TPanel;
    GroupBox2: TGroupBox;
    FechaInicial: TLabel;
    FechaFinal: TLabel;
    fechaini: TLabel;
    fechafin: TLabel;
    Consultar: TBitBtn;
    DBEFechaInicial: TDBEdit;
    DBEFechaFinal: TDBEdit;
    PanelInfCentral: TPanel;
    PanelCentral: TPanel;
    RxDBGrid1: TRxDBGrid;
    PanelSuperior: TPanel;
    Panel2: TPanel;
    sbMantenimiento: TSpeedButton;
    SpeedButton1: TSpeedButton;
    Memo1: TMemo;
    codigo1: TListBox;
    codigo3: TListBox;
    codigo2: TListBox;
    codigo4: TListBox;
    procedure SalirClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ConsultarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    fechaelemento:Tdate;
    constructor BuscarMantenimientos(AOwner:Tcomponent;fecha_mtto:TDate);
  end;

var
  fConsultaMttoReprogramado: TfConsultaMttoReprogramado;

implementation

uses uMantenimientoMes, UMantenimiento;

{$R *.DFM}


constructor TfConsultaMttoReprogramado.BuscarMantenimientos(AOwner:TComponent;fecha_mtto:TDate);
begin
ShowMessage('BuscarMantenimientos');
end;

procedure TfConsultaMttoReprogramado.SalirClick(Sender: TObject);
begin
  close;
end;

procedure TfConsultaMttoReprogramado.RxDBGrid1DblClick(Sender: TObject);
begin
  FMantenimiento:=TFMantenimiento.crearnuevo(Self);
end;

procedure TfConsultaMttoReprogramado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

procedure TfConsultaMttoReprogramado.ConsultarClick(Sender: TObject);
begin
  qMantenimientos.Close;
  qMantenimientos.Open;
end;

procedure TfConsultaMttoReprogramado.FormCreate(Sender: TObject);
begin
  tdMemTable1.Open;
  tdMemTable1.Insert;
end;

end.


