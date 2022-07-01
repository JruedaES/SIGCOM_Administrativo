unit uDatosComercial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, StdCtrls, Mask, DBCtrls, Db, DBTables, Buttons, ExtCtrls, RXCtrls,
  RXDBCtrl;

type
  TfDatosComercial = class(TFBase)
    Panel1: TPanel;
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    Panel2: TPanel;
    qClienteComercial: TQuery;
    dsClienteComercial: TDataSource;
    qClienteComercialCODIGOCLIENTECOM: TStringField;
    qClienteComercialNOMBRESUSCRIPTOR: TStringField;
    qClienteComercialDIRECCIONSUSCRIPTOR: TStringField;
    qClienteComercialTELEFONOSUSCRIPTORSGD: TStringField;
    qClienteComercialCODIGOCICLO: TStringField;
    qClienteComercialESTRATO: TStringField;
    qClienteComercialULTIMOCONSUMO: TFloatField;
    qClienteComercialCODIGOCONTADOR: TStringField;
    qClienteComercialCODIGOFABRICANTE: TStringField;
    qClienteComercialNOSERIE: TStringField;
    qClienteComercialCONSTANTE: TFloatField;
    qClienteComercialTENSIONNOMINAL: TFloatField;
    qClienteComercialCORRIENTENOMINAL: TFloatField;
    qClienteComercialSELLOTAPABORNERA: TStringField;
    qClienteComercialSELLOTAPAPRINCIPAL: TStringField;
    qClienteComercialCRITICA: TFloatField;
    qClienteComercialCONSUMOPROMEDIO: TFloatField;
    qClienteComercialVALORFESC: TFloatField;
    qClienteComercialCODIGOCOMERCIALIZADOR: TStringField;
    qClienteComercialVALORDESC: TFloatField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label17: TLabel;
    DBEdit17: TDBEdit;
    Label18: TLabel;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    DBEdit21: TDBEdit;
    tComercializador: TTable;
    dsComercializador: TDataSource;
    qZona: TQuery;
    dsqZona: TDataSource;
    qCiudad: TQuery;
    dsqCiudad: TDataSource;
    qBarrio: TQuery;
    dsqBarrio: TDataSource;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    qClienteComercialCODIGOCLIENTESGD: TFloatField;
    Panel3: TPanel;
    DBNavigator1: TDBNavigator;
    qClienteComercialNombreComercializador: TStringField;
    DBLookupComboBox1: TDBLookupComboBox;
    Label19: TLabel;
    lbTotal: TLabel;
    qClienteComercialCODIGOAPOYO: TFloatField;
    qClienteComercialPINTADOAPOYO: TStringField;
    DBEdit20: TDBEdit;
    qClienteComercialNOMBRECATEGORIA: TStringField;
    qClienteComercialCODIGOGEOGRAFICO: TFloatField;
    Label22: TLabel;
    DBEdit22: TDBEdit;
    Label23: TLabel;
    DBEdit23: TDBEdit;
    qClienteComercialDirApoyo: TStringField;
    qClienteComercialDirCliente: TStringField;
    procedure qClienteComercialCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure tComercializadorBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fDatosComercial: TfDatosComercial;

implementation

uses uReporte, ufuncionsgd;

{$R *.DFM}

procedure TfDatosComercial.qClienteComercialCalcFields(DataSet: TDataSet);
var query:tquery;
begin
  inherited;
  query:=TQuery.Create(self);
  query.databasename:='BaseDato';
  if (qClienteComercialCODIGOCLIENTESGD.AsString<>'') then
  begin
    query.sql.clear;
    query.sql.add('SELECT DIR_CLIENTE(CODIGOCLIENTESGD) FROM CLIENTESGD');
    query.sql.add('WHERE CODIGOCLIENTESGD='+qClienteComercialCODIGOCLIENTESGD.AsString);
    query.open;
    qClienteComercialDirCliente.AsString:=query.fields[0].AsString;
  end;
  if (qClienteComercialCODIGOAPOYO.AsString<>'') then
  begin
    query.sql.clear;
    query.sql.add('SELECT DIR_APOYO(CODIGOAPOYO) FROM APOYO');
    query.sql.add('WHERE CODIGOAPOYO='+qClienteComercialCODIGOAPOYO.AsString);
    query.open;
    qClienteComercialDirApoyo.AsString:=query.fields[0].AsString;
  end;
  query.close;  
  query.free;
end;

procedure TfDatosComercial.FormCreate(Sender: TObject);
begin
tComercializador.open;
end;

procedure TfDatosComercial.tComercializadorBeforeOpen(DataSet: TDataSet);
begin
  tComercializador.tablename:= EsquemaEnerGis+'COMERCIALIZADOR' ;
end;

end.
