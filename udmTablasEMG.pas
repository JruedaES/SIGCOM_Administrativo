unit udmTablasEMG;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TdmTablasEMG = class(TDataModule)
    qOdt: TQuery;
    qApoyosEMG: TQuery;
    dsOdt: TDataSource;
    dsApoyoEMG: TDataSource;
    dsNodomtEMG: TDataSource;
    dsNodobtEMG: TDataSource;
    qIncidentalEMG: TQuery;
    dsIncidentalEMG: TDataSource;
    qDetalleEMG: TQuery;
    dsDetalleEMG: TDataSource;
    qTempleteEMG: TQuery;
    dsTempleteEMG: TDataSource;
    qExcavacionEMG: TQuery;
    dsExcavacionEMG: TDataSource;
    qDuctoEMG: TQuery;
    dsDuctoEMG: TDataSource;
    qTramomtEMG: TQuery;
    dsTramomtEMG: TDataSource;
    qTramobtEMG: TQuery;
    dsTramobtEMG: TDataSource;
    qPararrayoDisEMG: TQuery;
    dsPararrayoDisEMG: TDataSource;
    qInterruptorDisEMG: TQuery;
    dsInterruptorDisEMG: TDataSource;
    qTrafoDisEMG: TQuery;
    dsTrafoDisEMG: TDataSource;
    qCondensadorEMG: TQuery;
    dsCondensadorEMG: TDataSource;
    qClienteSgdEMG: TQuery;
    dsClienteSgdEMG: TDataSource;
    qAlumbradoEMG: TQuery;
    dsAlumbradoEMG: TDataSource;
    qApoyo: TQuery;
    dsApoyo: TDataSource;
    qNodoMt: TQuery;
    dsNodoMt: TDataSource;
    qNodobt: TQuery;
    dsNodobt: TDataSource;
    qIncidental: TQuery;
    dsIncidental: TDataSource;
    qDetalle: TQuery;
    dsDetalle: TDataSource;
    qTemplete: TQuery;
    dsTemplete: TDataSource;
    qExcavacion: TQuery;
    dsExcavacion: TDataSource;
    qDucto: TQuery;
    dsDucto: TDataSource;
    qTramoMt: TQuery;
    dsTramoMt: TDataSource;
    qTramoBt: TQuery;
    dsTramoBt: TDataSource;
    qPararrayo: TQuery;
    dsPararrayo: TDataSource;
    qInterruptor: TQuery;
    dsInterruptor: TDataSource;
    qTrafodis: TQuery;
    dsTrafodis: TDataSource;
    qCondensador: TQuery;
    dsCondensador: TDataSource;
    qCliente: TQuery;
    dsCliente: TDataSource;
    qAlumbrado: TQuery;
    dsAlumbrado: TDataSource;
    qTrafodisObsEMG: TQuery;
    dsTrafodisObsEMG: TDataSource;
    qOdtCODIGOASIGNACIONEMG: TFloatField;
    qOdtCODIGOODT: TFloatField;
    qOdtCONSECUTIVO: TFloatField;
    qOdtTIPODATOORIGEN: TStringField;
    qOdtMOTIVOS: TMemoField;
    qOdtFECHAASIGNACION: TDateTimeField;
    qOdtCODIGOADMINISTRATIVO: TFloatField;
    qOdtNOMBREADMINISTRATIVO: TStringField;
    qOdtCODIGOAPROBADO: TFloatField;
    qOdtNOMBREAPROBADO: TStringField;
    qOdtFECHAINICIOTRABAJO: TDateTimeField;
    qOdtFECHAFINTRABAJO: TDateTimeField;
    qOdtOBSERVACION1: TStringField;
    qOdtOBSERVACION2: TStringField;
    qOdtCODIGOEJECUTADO: TFloatField;
    qOdtNOMBREEJECUTADO: TStringField;
    qOdtCODIGOGRUPOTRABAJO: TFloatField;
    qOdtNOMBREGRUPOTRABAJO: TStringField;
    qOdtTIPOEXPORTACION: TStringField;
    qOdtCODIGOESTADOASIGNACION: TFloatField;
    qOdtFECHAPROCESO: TDateTimeField;
    qNodoMTEMG: TQuery;
    qNodobtEMG: TQuery;
  private
    { Private declarations }
  public
    condicion:tstringlist;
    tipoorigen:string;
    condicionadicinal:string;
    procedure FiltrarDatos(codasignacion:double);
    procedure AbrirConsultas;
    procedure CerrarConsultas;
  end;

var
  dmTablasEMG: TdmTablasEMG;

implementation

{$R *.DFM}

procedure TdmTablasEMG.AbrirConsultas;
begin
  qApoyosEMG.Open;
  qNodomtEMG.Open;
  qNodobtEMG.Open;
  qIncidentalEMG.Open;
  qDetalleEMG.Open;
  qTempleteEMG.Open;
  qExcavacionEMG.Open;
  qDuctoEMG.Open;
  qTramomtEMG.Open;
  qTramobtEMG.Open;
  qInterruptorDisEMG.Open;
  qCondensadorEMG.Open;
  qPararrayoDisEMG.Open;
  qTrafoDisEMG.Open;
  qTrafodisObsEMG.Open;
  qClienteSgdEMG.Open;
  qAlumbradoEMG.Open;
end;

procedure TdmTablasEMG.CerrarConsultas;
begin
  qApoyosEMG.Close;
  qNodomtEMG.Close;
  qNodobtEMG.Close;
  qIncidentalEMG.Close;
  qDetalleEMG.Close;
  qTempleteEMG.Close;
  qExcavacionEMG.Close;
  qDuctoEMG.Close;
  qTramomtEMG.Close;
  qTramobtEMG.Close;
  qInterruptorDisEMG.Close;
  qCondensadorEMG.Close;
  qPararrayoDisEMG.Close;
  qTrafoDisEMG.Close;
  qTrafodisObsEMG.Close;
  qClienteSgdEMG.Close;
  qAlumbradoEMG.Close;
end;


procedure TdmTablasEMG.FiltrarDatos(codasignacion: double);
begin
  CerrarConsultas;
  qOdt.close;
  qOdt.ParamByName('CodigoAsignacionEMG').Asfloat:=codasignacion;
  qOdt.Open;
  AbrirConsultas;
end;

end.
 