unit uStockGrupoTrabajo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus, utMenuArbol, Db, DBTables, DBCtrls,
  Mask, Grids, DBGrids, RXDBCtrl;

type
  TfStockGrupoTrabajo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    bbCancelar: TBitBtn;
    bbAceptar: TBitBtn;
    qStockGrupoTrabajo: TQuery;
    qStockGrupoTrabajoCODIGOADMINISTRATIVO: TFloatField;
    qStockGrupoTrabajoCODIGOGRUPOTRABAJO: TFloatField;
    qStockGrupoTrabajoCODIGOMATERIAL: TFloatField;
    qStockGrupoTrabajoCANTIDADMINIMA: TFloatField;
    qStockGrupoTrabajoCANTIDADACTUAL: TFloatField;
    dsStockGrupoTrabajo: TDataSource;
    qGrupoTrabajo: TQuery;
    dsGrupoTrabajo: TDataSource;
    dMenuArbol1: TdMenuArbol;
    qCIA: TQuery;
    Label2: TLabel;
    Label3: TLabel;
    lNombreCIA: TLabel;
    dbeCIA: TDBEdit;
    dblcbGrupoTrabajo: TDBLookupComboBox;
    Label1: TLabel;
    dbeCodigoMaterial: TDBEdit;
    Label4: TLabel;
    dbeCantidadMinima: TDBEdit;
    Label5: TLabel;
    dbeCantidadActual: TDBEdit;
    UpdStock: TUpdateSQL;
    qStockGrupoTrabajoCANTIDADINICIAL: TFloatField;
    sbBuscarMaterial: TSpeedButton;
    dblcbNombreMaterial: TDBLookupComboBox;
    qMaterial: TQuery;
    dsMaterial: TDataSource;
    qStockGrupoTrabajoFECHAULTIMOINVENTARIO: TDateTimeField;
    qStockGrupoTrabajoCANTIDADACTUALDESMANTELADABUEN: TFloatField;
    qStockGrupoTrabajoCANTIDADACTUALDESMANTELADAMALA: TFloatField;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    procedure qStockGrupoTrabajoCODIGOADMINISTRATIVOValidate(
      Sender: TField);
    procedure FormActivate(Sender: TObject);
    procedure qStockGrupoTrabajoAfterPost(DataSet: TDataSet);
    procedure bbAceptarClick(Sender: TObject);
    procedure bbCancelarClick(Sender: TObject);
    procedure qStockGrupoTrabajoAfterInsert(DataSet: TDataSet);
    procedure sbBuscarMaterialClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
//    procedure qStockGrupoTrabajoAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fStockGrupoTrabajo: TfStockGrupoTrabajo;

implementation

uses uBuscarMaterial;

{$R *.DFM}

procedure TfStockGrupoTrabajo.qStockGrupoTrabajoCODIGOADMINISTRATIVOValidate(
  Sender: TField);
begin
 if Sender.Text <> '' then
  begin
    qCIA.Close;
    qCIA.Params[0].AsString:=Sender.Text;
    qCIA.Open;
    if qCIA.RecordCount > 0 then
    begin
      lNombreCIA.Caption:=qCIA.Fields[0].AsString;
      qGrupoTrabajo.Close;
      qGrupoTrabajo.Params[0].AsString:=Sender.Text;
      qGrupoTrabajo.Open;
    end
    else
      raise Exception.Create('Este Código Administrativo No Existe.')
  end;
end;

procedure TfStockGrupoTrabajo.FormActivate(Sender: TObject);
begin
   if qStockGrupoTrabajoCODIGOADMINISTRATIVO.AsString <> '' then
     qStockGrupoTrabajoCODIGOADMINISTRATIVOValidate(qStockGrupoTrabajoCODIGOADMINISTRATIVO);
end;

procedure TfStockGrupoTrabajo.qStockGrupoTrabajoAfterPost(
  DataSet: TDataSet);
begin
  try
    qStockGrupoTrabajo.ApplyUpdates;
    qStockGrupoTrabajo.CommitUpdates;
  except
    MessageDlg('Error para actualizar el registro.', mtWarning, [mbOk], 0);
  end;
end;

procedure TfStockGrupoTrabajo.bbAceptarClick(Sender: TObject);
begin
  qStockGrupoTrabajoCANTIDADINICIAL.AsFloat := dbeCantidadActual.Field.AsFloat;
  qStockGrupoTrabajo.Post;
end;

procedure TfStockGrupoTrabajo.bbCancelarClick(Sender: TObject);
begin
  qStockGrupoTrabajo.Cancel;
  qStockGrupoTrabajo.CancelUpdates;
end;

procedure TfStockGrupoTrabajo.qStockGrupoTrabajoAfterInsert(
  DataSet: TDataSet);
begin
  qStockGrupoTrabajoCANTIDADMINIMA.AsFloat := 0;
end;

procedure TfStockGrupoTrabajo.sbBuscarMaterialClick(Sender: TObject);
begin
  fBuscarMaterial:=TfBuscarMaterial.Create(Application);
  if fBuscarMaterial.ShowModal = mrOk then
    if fBuscarMaterial.DBGridBuscarMaterial.SelectedRows.Count>0 then
      qStockGrupoTrabajoCODIGOMATERIAL.AsString:=fBuscarMaterial.qMaterial.fieldbyName('CODIGOMATERIAL').AsString;

  fBuscarMaterial.Free;
end;

procedure TfStockGrupoTrabajo.FormShow(Sender: TObject);
begin
  dbeCodigoMaterial.SetFocus;
end;

{procedure TfStockGrupoTrabajo.qStockGrupoTrabajoAfterEdit(
  DataSet: TDataSet);
begin
  qStockGrupoTrabajoCODIGOADMINISTRATIVO.AsFloat := dbeCIA.Field.AsFloat;
  qStockGrupoTrabajoCODIGOGRUPOTRABAJO.AsFloat := dblcbGrupoTrabajo.Field.AsFloat;
  qStockGrupoTrabajoCODIGOMATERIAL.AsFloat := dbeCodigoMaterial.Field.AsFloat;
  qStockGrupoTrabajoCANTIDADMINIMA.AsFloat := 0;
end;}

end.
 