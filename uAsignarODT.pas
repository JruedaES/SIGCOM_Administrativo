unit uAsignarODT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, DbTables, Grids, DBGrids, RXDBCtrl, Db,
  DBCtrls;

type
  TFAsignarODT = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    Label1: TLabel;
    EdNumeroODT: TEdit;
    dbgListaOdtPadre: TRxDBGrid;
    SBBuscar: TSpeedButton;
    qOdt: TQuery;
    dsodt: TDataSource;
    qGrupoTrabajo: TQuery;
    dsGrupoTrabajo: TDataSource;
    lbGT: TLabel;
    dblcbGrupoTrabajo: TDBLookupComboBox;
    qGrupoTrabajoCODIGOGRUPOTRABAJO: TFloatField;
    qGrupoTrabajoNOMBREGRUPOTRABAJO: TStringField;
    qOdtCODIGOODT: TFloatField;
    qOdtNOMBREESTADOODT: TStringField;
    qOdtCODIGOADMINISTRATIVO: TFloatField;
    qOdtFECHAEMISION: TDateTimeField;
    qOdtFECHAAPROBACION: TDateTimeField;
    qOdtFECHAASIGNACION: TDateTimeField;
    qOdtNOMBRELABOR: TStringField;
    qOdtNOMBRETIPOTAREA: TStringField;
    qOdtCODIGOAPROBADO: TFloatField;
    qOdtCODIGOEJECUTOR: TFloatField;
    qOdtCODIGOREVISADO: TFloatField;
    qOdtASOCIARREPORTESDANO: TStringField;
    qOdtCODIGOCOORDINACIONGRUPOTRABAJO: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure bbAceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
    procedure dbgListaOdtPadreDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    CodigoAdministrativo: Double;
    SedeOperativa: string;
    Filtro: string;
  end;

var
  FAsignarODT: TFAsignarODT;

implementation

{$R *.DFM}

procedure TFAsignarODT.FormActivate(Sender: TObject);
var
  defstyle: dWord;
begin
  defstyle := GetWindowLong(EdNumeroODT.Handle, GWL_STYLE);
  SetWindowLong(EdNumeroODT.Handle, GWL_STYLE, defstyle or ES_NUMBER)
end;

procedure TFAsignarODT.bbAceptarClick(Sender: TObject);
var qDatos:TQuery;
begin
  if qOdtCODIGOODT.AsString <> '' then
  begin
    qDatos:=TQuery.Create(Application);
    qDatos.DatabaseName:='BaseDato';

    qDatos.SQL.Text:='SELECT CODIGOESTADOODT FROM ODT WHERE CODIGOODT = ' + qOdtCODIGOODT.AsString;
    qDatos.Open;
    if qDatos.Fields[0].AsString = '6' then
    begin
      qDatos.Free;
      ModalResult:=0;
      raise Exception.Create('Esta Orden de Trabajo se encuentra TERMINADA.' + Chr(13) + 'Por favor verifique.');
    end;

    qDatos.SQL.Text:='SELECT CODIGOESTADOODT FROM ODT WHERE CODIGOODT = ' + qOdtCODIGOODT.AsString;
    qDatos.Open;
    if qDatos.Fields[0].AsString = '7' then
    begin
      qDatos.Free;
      ModalResult:=0;
      raise Exception.Create('Esta Orden de Trabajo se encuentra CANCELADA.' + Chr(13) + 'Por favor verifique.');
    end;

    qDatos.SQL.Text:='SELECT CODIGOODT, CODIGOADMINISTRATIVO FROM ODT WHERE CODIGOODT = ' + qOdtCODIGOODT.AsString;
    qDatos.Open;
    if qDatos.Fields[0].AsString = '' then
    begin
      qDatos.Free;
      ModalResult:=0;
      raise Exception.Create('Este código de Orden de Trabajo no existe.' + Chr(13) + 'Por favor verifique.');
    end;
    if (CodigoAdministrativo <> 0) and
       (qDatos.FieldByName('CODIGOADMINISTRATIVO').AsFloat <> CodigoAdministrativo) then
    begin
      qDatos.Free;
      ModalResult:=0;
      raise Exception.Create('La orden de trabajo ' + EdNumeroODT.Text + ' pertenece a otra dependencia.' +
            Chr(13) + 'No es posible asignarle un reporte de la dependencia ' + FloatToStr(CodigoAdministrativo));
    end;
    qDatos.Free;
  end
  else
  begin
    ModalResult:=0;
    raise Exception.Create('No ha seleccionado una Orden de Trabajo' + Chr(13) + 'Por favor verifique.');
  end;
end;

procedure TFAsignarODT.FormShow(Sender: TObject);
begin
  EdNumeroODT.SetFocus;
  qOdt.Close;
  qOdt.ParamByName('CODIGOADMINISTRATIVO').AsString := floattostr(CodigoAdministrativo);
  qOdt.ParamByName('TEXTO').AsString := '%'+TRIM(EdNumeroODT.text)+'%';
  if Filtro <> '' then
  begin
    qOdt.Filter:= Filtro;
    qOdt.Filtered:=True;
  end;
  qOdt.Open;

  if SedeOperativa <> '' then
  begin
    qGrupoTrabajo.Close;
    qGrupoTrabajo.ParamByName('CODIGOADMINISTRATIVO').AsFloat := CodigoAdministrativo;
    qGrupoTrabajo.ParamByName('SEDEOPERATIVA').AsString := SedeOperativa;
    qGrupoTrabajo.Open;
  end;

end;

procedure TFAsignarODT.FormCreate(Sender: TObject);
begin
  CodigoAdministrativo := 0;
  Filtro:='';
end;

procedure TFAsignarODT.SBBuscarClick(Sender: TObject);
begin
  qOdt.Close;
  qOdt.ParamByName('TEXTO').AsString := '%'+TRIM(EdNumeroODT.text)+'%';
  qOdt.Open;
end;

procedure TFAsignarODT.dbgListaOdtPadreDblClick(Sender: TObject);
begin
  bbAceptarClick(bbAceptar);
  ModalResult:= mrOK;
end;

end.
