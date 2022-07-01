unit UAdminBancoM;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, StdCtrls, DBCtrls,
  ToolWin, ComCtrls;

type
  TFAdminBancoM = class(TForm)
    PanelPrinicipal: TPanel;
    Panel2: TPanel;
    PanelHerramientas: TPanel;
    SBNuevo: TSpeedButton;
    SBEditar: TSpeedButton;
    SBBorrar: TSpeedButton;
    SBSalir: TSpeedButton;
    QBancoMantenimiento: TQuery;
    SBancoMantenimiento: TDataSource;
    QNivelTension: TQuery;
    QNivelTensionCODIGONIVELTENSION: TStringField;
    QNivelTensionTENSION: TFloatField;
    QNivelTensionCOLOR: TFloatField;
    QNivelTensionNIVEL: TStringField;
    SNivelTension: TDataSource;
    STipoMantenimiento: TDataSource;
    QTipoMantenimiento: TQuery;
    SAmbito: TDataSource;
    QAmbito: TQuery;
    STipoElemento: TDataSource;
    QTipoElemento: TQuery;
    PanelFiltros: TPanel;
    UpdateBancoMantenimiento: TUpdateSQL;
    QActividadMantenimiento: TQuery;
    UpdateActividadMantenimiento: TUpdateSQL;
    panelSuperior: TPanel;
    SBPrimero: TSpeedButton;
    SBSiguiente: TSpeedButton;
    SBAnterior: TSpeedButton;
    SBUltimo: TSpeedButton;
    QTipoElementoCODIGOELEMENTO: TFloatField;
    QTipoElementoCODIGOTIPOELEMENTO: TStringField;
    QTipoElementoCODIGOAMBITO: TFloatField;
    QTipoElementoNOMBRETABLAELEMENTO: TStringField;
    QTipoElementoNUMEROCLAVESELEMENTO: TFloatField;
    QTipoElementoCLAVEELEMENTO1: TStringField;
    QTipoElementoCLAVEELEMENTO2: TStringField;
    QTipoElementoCLAVEELEMENTO3: TStringField;
    QTipoElementoNOMBRETIPOELEMENTO: TStringField;
    QTipoElementoCAMPODESCRIPTIVO: TStringField;
    Panel1: TPanel;
    GridMantenimientos: TDBGrid;
    DBNavigator1: TDBNavigator;
    QBancoMantenimientoCODIGOBANCOMANTENIMIENTO: TFloatField;
    QBancoMantenimientoNOMBREMANTENIMIENTO: TStringField;
    QBancoMantenimientoFRECUENCIA: TFloatField;
    QBancoMantenimientoNOMBREAREAOPERACIONODT: TStringField;
    QBancoMantenimientoTENSION: TFloatField;
    QBancoMantenimientoNOMBREAMBITO: TStringField;
    QBancoMantenimientoNOMBRETIPOELEMENTO: TStringField;
    SpeedButton2: TSpeedButton;
    procedure SBNuevoClick(Sender: TObject);
    procedure SBEditarClick(Sender: TObject);
    procedure SBSalirClick(Sender: TObject);
    procedure SBFiltrosClick(Sender: TObject);
    procedure SBBorrarClick(Sender: TObject);
    procedure SBUltimoClick(Sender: TObject);
    procedure SBPrimeroClick(Sender: TObject);
    procedure SBAnteriorClick(Sender: TObject);
    procedure SBSiguienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    constructor crear(AOwner: TComponent);
  end;

var
  FAdminBancoM: TFAdminBancoM;

implementation

uses ubancomantenimiento, ConsDll, ufiltroConsultaBancoMantenimiento;

{$R *.DFM}

constructor TFAdminBancoM.crear(AOwner: TComponent);
begin
  inherited Create(Owner);
 { if  QAmbito.active then
    QAmbito.close;
  QAmbito.open;
  if  QTipoelemento.active then
    QTipoelemento.close;
  QTipoelemento.open;
  if  QTipoMantenimiento.active then
    QTipoMantenimiento.close;
  QTipoMantenimiento.open;
  if  QNivelTension.active then
    QNivelTension.close;
  QNivelTension.open;
  if QBancoMantenimiento.Active then
    QBancoMantenimiento.Close;
  QBancoMantenimiento.Open;

  }
end;



procedure TFAdminBancoM.SBNuevoClick(Sender: TObject);
var
// BancoMant: Tfbancomantenimiento;
 bandera:boolean;
begin
//showmessage(inttostr(VARCODIGOUSUARIO));
  fbancomantenimiento:= Tfbancomantenimiento.crearnuevobanco(self);
  if fbancomantenimiento.ShowModal = mrOk then
  fbancomantenimiento.Free;

end;

procedure TFAdminBancoM.SBEditarClick(Sender: TObject);
// var BancoMantenimiento: Tfbancomantenimiento;
begin
  if QBancoMantenimiento.FieldByName('CODIGOBANCOMANTENIMIENTO').AsString <> '' then
    begin
      fbancomantenimiento:= Tfbancomantenimiento.crear(nil,QBancoMantenimiento.FieldByName('CODIGOBANCOMANTENIMIENTO').AsFloat);
      fbancomantenimiento.ShowModal;
      fbancomantenimiento.Free;
    end
  else
    MessageDlg('Debe seleccionar un Mantenimiento', mtInformation,[mbOk], 0);

end;

procedure TFAdminBancoM.SBSalirClick(Sender: TObject);
begin
 ModalResult:= mrOk;
end;



procedure TFAdminBancoM.SBFiltrosClick(Sender: TObject);
begin
  fFiltroConsultaBancoMantenimiento:=TfFiltroConsultaBancoMantenimiento.Create(Application);
  fFiltroConsultaBancoMantenimiento.ShowModal;
  QBancoMantenimiento.SQL.Clear;
  QBancoMantenimiento.Close;
  QBancoMantenimiento.sql.text:=fFiltroConsultaBancoMantenimiento.qmantenimientos.sql.text;
  QBancoMantenimiento.Open;
  if QBancoMantenimiento.RecordCount <> 1 then
    PanelSuperior.Caption := 'MANTENIMIENTOS << ' + inttostr(QBancoMantenimiento.recordcount)+' Registros Encontrados >>'
  else PanelSuperior.Caption := 'MANTENIMIENTOS << ' +inttostr(QBancoMantenimiento.recordcount)+' Registro Encontrado >>';
  fFiltroConsultaBancoMantenimiento.Free;
end;

procedure TFAdminBancoM.SBBorrarClick(Sender: TObject);
begin
  if QBancoMantenimiento.FieldByName('CODIGOBANCOMANTENIMIENTO').AsString = '' then
    MessageDlg('Debe seleccionar un Mantenimiento', mtInformation,[mbOk], 0)
  else
    if MessageDlg('Desea eliminar de forma permanente el mantenimiento?',mtWarning,[mbOk,mbCancel],0) = mrOk then
      begin
        if QActividadMantenimiento.Active then
          QActividadMantenimiento.Close;
        QActividadMantenimiento.ParamByName('codigobanco').AsFloat:= QBancoMantenimiento.fieldbyName('CODIGOBANCOMANTENIMIENTO').AsFloat;
        QActividadMantenimiento.Open;
        QBancoMantenimiento.Edit;
        try
          while not QActividadMantenimiento.Eof do
            QActividadMantenimiento.Delete;
          QBancoMantenimiento.Delete;
          QActividadMantenimiento.ApplyUpdates;
          QBancoMantenimiento.ApplyUpdates;

        except
          on e:exception do
            begin
              QBancoMantenimiento.CancelUpdates;
              QActividadMantenimiento.CancelUpdates;
              application.MessageBox(pchar('Error en la eliminación de los Datos'),'Error en Borrado',mb_iconerror);
              exit;
            end;
        end;

      end;
end;

procedure TFAdminBancoM.SBUltimoClick(Sender: TObject);
begin
  DBNavigator1.BtnClick(nbLast);
  SBPrimero.Enabled:= DBNavigator1.Controls[0].Enabled;
  SBAnterior.Enabled:= DBNavigator1.Controls[1].Enabled;
  SBSiguiente.Enabled:= DBNavigator1.Controls[2].Enabled;
  SBUltimo.Enabled:= DBNavigator1.Controls[3].Enabled;

end;

procedure TFAdminBancoM.SBPrimeroClick(Sender: TObject);
begin
  DBNavigator1.BtnClick(nbFirst);
  SBPrimero.Enabled:= DBNavigator1.Controls[0].Enabled;
  SBAnterior.Enabled:= DBNavigator1.Controls[1].Enabled;
  SBSiguiente.Enabled:= DBNavigator1.Controls[2].Enabled;
  SBUltimo.Enabled:= DBNavigator1.Controls[3].Enabled;
end;

procedure TFAdminBancoM.SBAnteriorClick(Sender: TObject);
begin
  DBNavigator1.BtnClick(nbPrior);
  SBPrimero.Enabled:= DBNavigator1.Controls[0].Enabled;
  SBAnterior.Enabled:= DBNavigator1.Controls[1].Enabled;
  SBSiguiente.Enabled:= DBNavigator1.Controls[2].Enabled;
  SBUltimo.Enabled:= DBNavigator1.Controls[3].Enabled;
end;

procedure TFAdminBancoM.SBSiguienteClick(Sender: TObject);
begin
  DBNavigator1.BtnClick(nbNext);
  SBPrimero.Enabled:= DBNavigator1.Controls[0].Enabled;
  SBAnterior.Enabled:= DBNavigator1.Controls[1].Enabled;
  SBSiguiente.Enabled:= DBNavigator1.Controls[2].Enabled;
  SBUltimo.Enabled:= DBNavigator1.Controls[3].Enabled;
end;

procedure TFAdminBancoM.FormCreate(Sender: TObject);
begin
  PanelFiltros.Visible:= False;
  GridMantenimientos.Top:= GridMantenimientos.Top - 71;
   if  QAmbito.active then
    QAmbito.close;
  QAmbito.open;
  if  QTipoelemento.active then
    QTipoelemento.close;
  QTipoelemento.open;
  if  QTipoMantenimiento.active then
    QTipoMantenimiento.close;
  QTipoMantenimiento.open;
  if  QNivelTension.active then
    QNivelTension.close;
  QNivelTension.open;
  if QBancoMantenimiento.Active then
    QBancoMantenimiento.Close;
  QBancoMantenimiento.Open;
end;

procedure TFAdminBancoM.SpeedButton2Click(Sender: TObject);
begin
  fFiltroConsultaBancoMantenimiento:=TfFiltroConsultaBancoMantenimiento.Create(Application);
  fFiltroConsultaBancoMantenimiento.ShowModal;
  QBancoMantenimiento.SQL.Clear;
  QBancoMantenimiento.Close;
  QBancoMantenimiento.sql.text:=fFiltroConsultaBancoMantenimiento.qmantenimientos.sql.text;
  QBancoMantenimiento.Open;
  if QBancoMantenimiento.RecordCount <> 1 then
    PanelSuperior.Caption := 'MANTENIMIENTOS << ' + inttostr(QBancoMantenimiento.recordcount)+' Registros Encontrados >>'
  else PanelSuperior.Caption := 'MANTENIMIENTOS << ' +inttostr(QBancoMantenimiento.recordcount)+' Registro Encontrado >>';
  fFiltroConsultaBancoMantenimiento.Free;
end;

end.
