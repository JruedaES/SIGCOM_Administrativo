unit uSeleccionarImpresionCobro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, ExtCtrls, StdCtrls, Buttons, Db, Mask, DBCtrls, dbTables,
  Grids, DBGrids, RXDBCtrl, Digisoft, ComCtrls;

type
  TfSeleccionarImpresionCobro = class(TFBase)
    dsViaticos: TDataSource;
    Panel2: TPanel;
    Panel1: TPanel;
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    Panel3: TPanel;
    SBFiltrar: TSpeedButton;
    Label1: TLabel;
    EdCodigo: TEdit;
    Label2: TLabel;
    EdCodigo2: TEdit;
    Label3: TLabel;
    EdNombre: TEdit;
    qViaticos: TQuery;
    qAuxilios: TQuery;
    dsAuxilios: TDataSource;
    PageControl1: TPageControl;
    tsAuxilios: TTabSheet;
    tsViaticos: TTabSheet;
    dbgActividadOdt: TRxDBGrid;
    RxDBGrid2: TRxDBGrid;
    qViaticosNUMEROIMPRESION: TFloatField;
    qViaticosCODIGOEMPLEADO: TFloatField;
    qViaticosNOMBREEMPLEADO: TStringField;
    qViaticosDESTINO: TStringField;
    qViaticosFECHAIMPRESION: TDateTimeField;
    qViaticosVALOR: TFloatField;
    qAuxiliosNUMEROIMPRESION: TFloatField;
    qAuxiliosCODIGOEMPLEADO: TFloatField;
    qAuxiliosCOBROINDIVIDUAL: TStringField;
    qAuxiliosNOMBREEMPLEADO: TStringField;
    qAuxiliosCANTIDAD: TFloatField;
    qAuxiliosFECHAIMPRESION: TDateTimeField;
    qAuxiliosVALOR: TFloatField;
    qViaticosTIPO: TStringField;
    qViaticosTipoCobro: TStringField;
    qAuxiliosTipoCobro: TStringField;
    qAuxiliosCODIGOODT: TFloatField;
    qViaticosCODIGOODT: TFloatField;
    qAuxiliosESTADO: TStringField;
    qViaticosESTADO: TStringField;
    TabSheet1: TTabSheet;
    RxDBGrid1: TRxDBGrid;
    qAnticipo: TQuery;
    dsAnticipo: TDataSource;
    qAnticipoCODIGOODT: TFloatField;
    qAnticipoNUMEROIMPRESION: TFloatField;
    qAnticipoCODIGOEMPLEADO: TFloatField;
    qAnticipoTIPO: TStringField;
    qAnticipoNOMBREEMPLEADO: TStringField;
    qAnticipoDESTINO: TStringField;
    qAnticipoFECHAIMPRESION: TDateTimeField;
    qAnticipoVALOR: TFloatField;
    qAnticipoESTADO: TStringField;
    qAnticipoTipoCobro: TStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure qViaticosCalcFields(DataSet: TDataSet);
    procedure qAuxiliosCalcFields(DataSet: TDataSet);
    procedure SBFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RxDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure dbgActividadOdtGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure qAnticipoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
  end;

var
  fSeleccionarImpresionCobro: TfSeleccionarImpresionCobro;

implementation

{$R *.DFM}

procedure TfSeleccionarImpresionCobro.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfSeleccionarImpresionCobro.qViaticosCalcFields(DataSet: TDataSet);
begin
  inherited;
  if (qViaticosTIPO.AsString='V') then
    qViaticosTipoCobro.AsString:='Viático'
  else
    qViaticosTipoCobro.AsString:='Anticipo'
end;

procedure TfSeleccionarImpresionCobro.qAuxiliosCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qAuxiliosCOBROINDIVIDUAL.AsString='S' then
    qAuxiliosTipoCobro.AsString:='INDIVIDUAL'
  else
    qAuxiliosTipoCobro.AsString:='GRUPAL';
end;

procedure TfSeleccionarImpresionCobro.SBFiltrarClick(Sender: TObject);
var 
 i:integer;
begin
  qViaticos.close;
  qAuxilios.close;
  for i :=0  to qAuxilios.sql.count-8 do
  begin
    qViaticos.SQL.Delete(5);
    qAuxilios.SQL.Delete(5);
    qAnticipo.SQL.Delete(5);
  end;
  i:=5;
  if EdCodigo.Text <> '' then
  begin
   qViaticos.SQL.Insert(i,'AND A.CODIGOODT LIKE ''%'+EdCodigo.Text+'%''');
   qAuxilios.SQL.Insert(i,'AND A.CODIGOODT LIKE ''%'+EdCodigo.Text+'%''');
   qAnticipo.SQL.Insert(i,'AND A.CODIGOODT LIKE ''%'+EdCodigo.Text+'%''');
   inc(i);
  end;
  if EdCodigo2.Text <> '' then
  begin
     qAuxilios.SQL.Insert(i,'AND A.CODIGOADMINISTRATIVO ='+EdCodigo2.Text);
     qViaticos.SQL.Insert(i,'AND A.CODIGOADMINISTRATIVO ='+EdCodigo2.Text);
     qAnticipo.SQL.Insert(i,'AND A.CODIGOADMINISTRATIVO ='+EdCodigo2.Text);
     inc(i);
  end;
  if EdNombre.Text <> '' then
  begin
    qAuxilios.SQL.Insert(i,'AND E.NOMBREEMPLEADO LIKE ''%'+EdNombre.Text+'%''');
    qViaticos.SQL.Insert(i,'AND E.NOMBREEMPLEADO LIKE ''%'+EdNombre.Text+'%''');
    qAnticipo.SQL.Insert(i,'AND E.NOMBREEMPLEADO LIKE ''%'+EdNombre.Text+'%''');    
  end;
  qAuxilios.Open;
  qViaticos.Open;
  qAnticipo.Open;  
end;

procedure TfSeleccionarImpresionCobro.FormCreate(Sender: TObject);
begin
  inherited;
  qAuxilios.open;
  qViaticos.open;
  qAnticipo.Open;
end;

procedure TfSeleccionarImpresionCobro.RxDBGrid2GetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  inherited;
  if qViaticosESTADO.AsString='PRO' then
  begin
    Background :=clSilver;
  end;
end;

procedure TfSeleccionarImpresionCobro.dbgActividadOdtGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
begin
  inherited;
  if qAuxiliosESTADO.AsString='PRO' then
  begin
    Background :=clSilver;
  end;
end;

procedure TfSeleccionarImpresionCobro.qAnticipoCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if (qAnticipoTIPO.AsString='V') then
    qAnticipoTipoCobro.AsString:='Viático'
  else
    qAnticipoTipoCobro.AsString:='Anticipo'
end;

end.
