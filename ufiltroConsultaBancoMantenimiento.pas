unit ufiltroConsultaBancoMantenimiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, ToolEdit, RXDBCtrl, Db,
  DBTables, Digisoft;

type
  TfFiltroConsultaBancoMantenimiento = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtnAnularFiltro: TBitBtn;
    bitBFiltrar: TBitBtn;
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
    qTipoMtto: TQuery;
    qTipoMttoCODIGOTIPOMANT: TFloatField;
    qTipoMttoNOMBREMANT: TStringField;
    dsTipoMtto: TDataSource;
    qNivelTension: TQuery;
    qNivelTensionCODIGONIVELTENSION: TStringField;
    qNivelTensionTENSION: TFloatField;
    qNivelTensionCOLOR: TFloatField;
    qNivelTensionNIVEL: TStringField;
    dsNivelTension: TDataSource;
    tdMTFiltro: tdMemTable;
    tdMTFiltroCodigoSubestacion: TStringField;
    tdMTFiltroCodigoElemento: TIntegerField;
    tdMTFiltroCodigotipomant: TIntegerField;
    tdMTFiltroCodigoNivelTension: TStringField;
    tdMTFiltroCodigoEstadoTarea: TIntegerField;
    tdMTFiltroCodigoCircuito: TStringField;
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
    qmantenimientos2: TQuery;
    qmantenimientos2CODIGOTAREA: TFloatField;
    qmantenimientos2FECHAINICIAL: TDateTimeField;
    qmantenimientos2FECHAFINAL: TDateTimeField;
    qmantenimientos2NOMBRETAREA: TStringField;
    qmantenimientos2CODIGOMANTENIMIENTO: TFloatField;
    qmantenimientos2CODIGOTIPOMANT: TFloatField;
    qmantenimientos2NOMBREMANT: TStringField;
    qTablaElemento: TQuery;
    tdMemTable1: tdMemTable;
    tdMemTable1FechaInicial: TDateField;
    tdMemTable1FechaFinal: TDateField;
    tdMemTable1CodigoElemento: TIntegerField;
    tdMemTable1Clelemento1: TStringField;
    tdMemTable1Clelemento2: TStringField;
    dsFechas: TDataSource;
    dsMantenimientos2: TDataSource;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    eDesde: TEdit;
    eHasta: TEdit;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    lbTipoMtto: TLabel;
    lbNivelTension: TLabel;
    Elemento: TDBLookupComboBox;
    DBLCBTipoMtto: TDBLookupComboBox;
    DBLCBNivelTension: TDBLookupComboBox;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    GroupBox5: TGroupBox;
    rbLinea: TRadioButton;
    rbSubestacion: TRadioButton;
    codigo1: TListBox;
    codigo2: TListBox;
    qMantenimientos: TQuery;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    DBLCBCoordinacion: TDBLookupComboBox;
    qCoordinacion: TQuery;
    dsCoordinacion: TDataSource;
    tdMTFiltroCodigoAreaOperacionOdt: TIntegerField;
    function GetFechaHora: String;
    procedure BitBtnAnularFiltroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bitBFiltrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Fecha: string;
    pendientes:boolean;
    { Public declarations }
  end;

var
  fFiltroConsultaBancoMantenimiento: TfFiltroConsultaBancoMantenimiento;

implementation

uses uFormaFecha, uHojaVidaEquipo;

{$R *.DFM}

function TfFiltroConsultaBancoMantenimiento.GetFechaHora: String;
begin
  fFormaFecha := TfFormaFecha.Create(Application);
  uFormaFecha.sFecha := Fecha;
  fFormaFecha.height:=291;
  if FFormaFecha.ShowModal = mrOk
  then Result := DateTimetoStr(FFormaFecha.Date+FFormaFecha.fTime)
  else Result := sFecha;
  fFormaFecha.Free;
end;

procedure TfFiltroConsultaBancoMantenimiento.BitBtnAnularFiltroClick(
  Sender: TObject);
begin
  qmantenimientos.Close;
end;

procedure TfFiltroConsultaBancoMantenimiento.FormCreate(Sender: TObject);
begin
  rbSubestacion.Checked:= true;
  qElemento.ParamByName('CODIGOAMBITO').AsInteger:=1;
  qElemento.Open;
  qTipoMtto.Open;
  qNivelTension.Open;
  qCaracteristicasElemento.Open;
  qCoordinacion.Open;
  tdMemTable1.Open;
  tdMemTable1.Insert;
  tdMTFiltro.Open;
  tdMTFiltro.Insert;
end;

procedure TfFiltroConsultaBancoMantenimiento.bitBFiltrarClick(Sender: TObject);
begin
  if(rbSubestacion.Checked=true)then
  begin
    qMantenimientos.SQL.Clear;
    qMantenimientos.Close;
    qMantenimientos.SQL.Text:=' select bm.codigodescriptivo,bm.codigobancomantenimiento,bm.nombremantenimiento,'+
                              ' bm.codigoniveltension,bm.codigoambito,bm.codigotipomant,bm.codigoelemento,'+
                              ' bm.codigoareaoperacionodt,bm.frecuencia,a.nombreareaoperacionodt,t.tension,'+
                              ' pa.nombreambito, pe.nombretipoelemento, bm.descripcion'+
                              ' from pm_bancomantenimiento bm, areaoperacionodt a, niveltension t,'+
                              ' pm_ambito pa, pm_elemento pe'+
                              ' where a.codigoareaoperacionodt=bm.codigoareaoperacionodt'+
                              ' and t.codigoniveltension = bm.codigoniveltension'+
                              ' and pa.codigoambito=bm.codigoambito'+
                              ' and pe.codigoelemento=bm.codigoelemento'+
                              ' and bm.codigoambito=1 AND BM.ACTIVO = ''S'' AND A.ACTIVO = ''S''';


    if(eDesde.Text<>'')then
    begin
      qMantenimientos.SQL.Add(' and bm.codigobancomantenimiento>= '''+ eDesde.Text+'''')
    end;

    if(eHasta.Text<>'')then
    begin
      qMantenimientos.SQL.Add(' and bm.codigobancomantenimiento<= '''+ eHasta.Text+'''')
    end;

    if(DBLCBTipoMtto.Text<>'')then
    begin
      qMantenimientos.SQL.Add(' and bm.codigotipomant='''+ vartostr(DBLCBTipoMtto.Keyvalue)+'''');
    end;

    if(DBLCBNivelTension.Text<>'')then
    begin
      qMantenimientos.SQL.Add(' and bm.codigoniveltension='''+ VarToStr(DBLCBNivelTension.Keyvalue)+'''');
    end;

    if(DBLCBCoordinacion.Text<>'')then
    begin
      qMantenimientos.SQL.Add(' and bm.codigoareaoperacionodt='''+ VarToStr(DBLCBCoordinacion.Keyvalue)+'''');
    end;

    if(Elemento.Text<>'')then
    begin
      qMantenimientos.SQL.Add(' and bm.codigoelemento='''+ inttostr(Elemento.Keyvalue)+'''');
    end;

    qMantenimientos.SQL.Add('order by bm.NOMBREMANTENIMIENTO');
  end;
end;

procedure TfFiltroConsultaBancoMantenimiento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  close;
  Action:=cafree;
end;

procedure TfFiltroConsultaBancoMantenimiento.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
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

end.


