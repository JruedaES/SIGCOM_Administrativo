{ en esta unidad se crea la intervencion sobre la ODT }

unit uIntervencion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask;

type
  TfIntervencion = class(TForm)
    UpdODTINTERVENCION: TUpdateSQL;
    dsODTIntervencion: TDataSource;
    qODTINTERVENCION: TQuery;
    qODTINTERVENCIONCODIGOODT: TFloatField;
    qODTINTERVENCIONCONSECUTIVO: TFloatField;
    qODTINTERVENCIONCODIGOINTERVENCION: TFloatField;
    updSAF_M_INTERVENCIONES: TUpdateSQL;
    dsSAF_M_INTERVENCIONES: TDataSource;
    qSAF_M_INTERVENCIONES: TQuery;
    qSAF_M_INTERVENCIONESCOD_INTERVENCION: TFloatField;
    qSAF_M_INTERVENCIONESCOD_TIPO_INTERVENCION: TStringField;
    qSAF_M_INTERVENCIONESCOD_ORIGEN: TStringField;
    qSAF_M_INTERVENCIONESCOD_EJECUTOR: TStringField;
    qSAF_M_INTERVENCIONESVIGENCIA: TFloatField;
    qSAF_M_INTERVENCIONESCOD_ZONA: TFloatField;
    qSAF_M_INTERVENCIONESIMPU_PROG_CONVENIO: TStringField;
    qSAF_M_INTERVENCIONESCOD_ACTIVO: TFloatField;
    qSAF_M_INTERVENCIONESFECHA_CREA: TDateTimeField;
    qSAF_M_INTERVENCIONESUSUARIO_CREA: TStringField;
    qSAF_M_INTERVENCIONESFECHA_MOD: TDateTimeField;
    qSAF_M_INTERVENCIONESUSUARIO_MOD: TStringField;
    Panel1: TPanel;
    dbeNegocioSolicitante: TDBEdit;
    dblcProgramaConvenio: TDBLookupComboBox;
    dbeCodTipoIntervencion: TDBEdit;
    dbeTipoIntervencion: TDBEdit;
    dbeCodIntervencion: TDBEdit;
    qPP_TIMPU: TQuery;
    dsPP_TIMPU: TDataSource;
    qPP_TIMPUIMPU_IMPU: TStringField;
    qPP_TIMPUIMPU_DESCRI: TStringField;
    qZona: TQuery;
    qZonaCODIGOZONA: TFloatField;
    qZonaNOMBREZONA: TStringField;
    qZonaCODIGOZONAESSA: TFloatField;
    dsZona: TDataSource;
    dblcbZonas: TDBLookupComboBox;
    dbeZonas: TDBEdit;
    dbeVigencia: TDBEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtnCerrar: TBitBtn;
    Label53: TLabel;
    Label1: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Notebook1: TNotebook;
    Label2: TLabel;
    dbeCodCircuito: TDBEdit;
    dbeCircuito: TDBEdit;
    Label8: TLabel;
    dbeCodigoSubestacion: TDBEdit;
    dbeSubestacion: TDBEdit;
    Label9: TLabel;
    dbeCodigoLinea: TDBEdit;
    dbeLinea: TDBEdit;
    qSAF_M_INTERVENCIONESVALOR_INTERVENCION: TFloatField;
    qSAF_M_EJECUTORES: TQuery;
    qSAF_M_EJECUTORESCOD_ORIGEN: TStringField;
    qSAF_M_EJECUTORESCOD_EJECUTOR: TStringField;
    qSAF_M_EJECUTORESVIGENCIA: TFloatField;
    qSAF_M_EJECUTORESFECHA_INICIO: TDateTimeField;
    qSAF_M_EJECUTORESFECHA_FINAL: TDateTimeField;
    qSAF_M_EJECUTORESVALOR_LIQ_FINAL: TFloatField;
    qSAF_M_EJECUTORESFECHA_CREA: TDateTimeField;
    qSAF_M_EJECUTORESUSUARIO_CREA: TStringField;
    qSAF_M_EJECUTORESFECHA_MOD: TDateTimeField;
    qSAF_M_EJECUTORESUSUARIO_MOD: TStringField;
    dsSAF_M_EJECUTORES: TDataSource;
    updSAF_M_EJECUTORES: TUpdateSQL;
    procedure qSAF_M_INTERVENCIONESAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure qSAF_M_INTERVENCIONESBeforeOpen(DataSet: TDataSet);
    procedure qPP_TIMPUBeforeOpen(DataSet: TDataSet);
    procedure qSAF_M_EJECUTORESBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fIntervencion: TfIntervencion;

implementation

uses uODTUrbanaRural,ufuncionsgd;

{$R *.DFM}

procedure TfIntervencion.qSAF_M_INTERVENCIONESAfterScroll(
  DataSet: TDataSet);
begin
  dblcProgramaConvenio.Hint:= qPP_TIMPUIMPU_DESCRI.asstring;
end;

procedure TfIntervencion.FormShow(Sender: TObject);
begin
qPP_TIMPU.OPEN;
qzona.open;
dblcbZonas.Enabled:= FALSE;
dbeZonas.Enabled:= false;
end;

procedure TfIntervencion.qSAF_M_INTERVENCIONESBeforeOpen(
  DataSet: TDataSet);
begin
qSAF_M_INTERVENCIONES.sql.text:= 'SELECT * FROM '+EsquemaAlmacen+'SAF_M_INTERVENCIONES'+ DBLink+' WHERE COD_INTERVENCION= :CODINTERVENCION';
updSAF_M_INTERVENCIONES.ModifySQL.text:=  'update '+EsquemaAlmacen+'SAF_M_INTERVENCIONES'+ DBLink+'  '+
                                          'set '+
                                          '  COD_INTERVENCION = :COD_INTERVENCION, '+
                                          '  COD_TIPO_INTERVENCION = :COD_TIPO_INTERVENCION, '+
                                          '  COD_ORIGEN = :COD_ORIGEN, '+
                                          '  COD_EJECUTOR = :COD_EJECUTOR, '+
                                          '  VIGENCIA = :VIGENCIA, '+
                                          '  COD_ZONA = :COD_ZONA, '+
                                          '  IMPU_PROG_CONVENIO = :IMPU_PROG_CONVENIO, '+
                                          '  COD_ACTIVO = :COD_ACTIVO, '+
                                          '  FECHA_CREA = :FECHA_CREA, '+
                                          '  USUARIO_CREA = :USUARIO_CREA, '+
                                          '  FECHA_MOD = :FECHA_MOD, '+
                                          '  USUARIO_MOD = :USUARIO_MOD, '+
                                          '  VALOR_INTERVENCION = :VALOR_INTERVENCION '+
                                          'where '+
                                          '  COD_INTERVENCION = :OLD_COD_INTERVENCION ';

updSAF_M_INTERVENCIONES.InsertSQL.text:= 'insert into '+EsquemaAlmacen+'SAF_M_INTERVENCIONES'+ DBLink+'  '+
                                         ' (COD_INTERVENCION, COD_TIPO_INTERVENCION, COD_ORIGEN, COD_EJECUTOR, VIGENCIA, '+
                                         '  COD_ZONA, IMPU_PROG_CONVENIO, COD_ACTIVO, FECHA_CREA, USUARIO_CREA, '+
                                         '  FECHA_MOD, USUARIO_MOD, VALOR_INTERVENCION) '+
                                         ' values '+
                                         '   (:COD_INTERVENCION, :COD_TIPO_INTERVENCION, :COD_ORIGEN, :COD_EJECUTOR, '+
                                         '    :VIGENCIA, :COD_ZONA, :IMPU_PROG_CONVENIO, :COD_ACTIVO, :FECHA_CREA, '+
                                         '    :USUARIO_CREA, :FECHA_MOD, :USUARIO_MOD, :VALOR_INTERVENCION) ';


updSAF_M_INTERVENCIONES.DeleteSQL.text:=  'delete from '+EsquemaAlmacen+'SAF_M_INTERVENCIONES'+ DBLink+'  where   COD_INTERVENCION = :OLD_COD_INTERVENCION ';
end;

procedure TfIntervencion.qPP_TIMPUBeforeOpen(DataSet: TDataSet);
begin
qPP_TIMPU.sql.text:= 'SELECT * FROM PP_TIMPU'+ DBLink+'  WHERE IMPU_ESTADO = ''A'' ORDER BY  IMPU_DESCRI';
end;

procedure TfIntervencion.qSAF_M_EJECUTORESBeforeOpen(DataSet: TDataSet);
begin
qSAF_M_EJECUTORES.SQL.Text:=  'SELECT * FROM '+EsquemaAlmacen+'SAF_M_EJECUTORES'+ DBLink;

updSAF_M_EJECUTORES.ModifySQL.text:=  'update '+EsquemaAlmacen+'SAF_M_EJECUTORES'+ DBLink+'   '+
                                      'set  '+
                                      '  COD_ORIGEN = :COD_ORIGEN, '+
                                      '  COD_EJECUTOR = :COD_EJECUTOR, '+
                                      '  VIGENCIA = :VIGENCIA, '+
                                      '  FECHA_INICIO = :FECHA_INICIO, '+
                                      '  FECHA_FINAL = :FECHA_FINAL, '+
                                      '  VALOR_LIQ_FINAL = :VALOR_LIQ_FINAL, '+
                                      '  FECHA_CREA = :FECHA_CREA, '+
                                      '  USUARIO_CREA = :USUARIO_CREA, '+
                                      '  FECHA_MOD = :FECHA_MOD, '+
                                      '  USUARIO_MOD = :USUARIO_MOD '+
                                      'where '+
                                      '  COD_ORIGEN = :OLD_COD_ORIGEN and '+
                                      '  COD_EJECUTOR = :OLD_COD_EJECUTOR and '+
                                      '  VIGENCIA = :OLD_VIGENCIA ';


updSAF_M_EJECUTORES.InsertSQL.Text:=  'insert into '+EsquemaAlmacen+'SAF_M_EJECUTORES'+ DBLink+'  '+
                                      '  (COD_ORIGEN, COD_EJECUTOR, VIGENCIA, FECHA_INICIO, FECHA_FINAL, VALOR_LIQ_FINAL, '+
                                      '   FECHA_CREA, USUARIO_CREA, FECHA_MOD, USUARIO_MOD) '+
                                      'values '+
                                      '  (:COD_ORIGEN, :COD_EJECUTOR, :VIGENCIA, :FECHA_INICIO, :FECHA_FINAL, '+
                                      '   :VALOR_LIQ_FINAL, :FECHA_CREA, :USUARIO_CREA, :FECHA_MOD, :USUARIO_MOD) ';



updSAF_M_EJECUTORES.DeleteSQL.Text:=  ' delete from '+EsquemaAlmacen+'SAF_M_EJECUTORES'+ DBLink+'  '+
                                              '  where  '+
                                              '    COD_ORIGEN = :OLD_COD_ORIGEN and  '+
                                              '    COD_EJECUTOR = :OLD_COD_EJECUTOR and  '+
                                              '    VIGENCIA = :OLD_VIGENCIA  ';
end;

end.
