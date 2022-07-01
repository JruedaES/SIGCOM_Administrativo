unit uMantenimientosElemento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, StdCtrls, DBCtrls,
  ToolWin, ComCtrls;

type
  TFMantenimientosElemento = class(TForm)
    PanelPrinicipal: TPanel;
    Panel2: TPanel;
    PanelHerramientas: TPanel;
    SBNuevo: TSpeedButton;
    SBEditar: TSpeedButton;
    SBBorrar: TSpeedButton;
    SBFiltros: TSpeedButton;
    SBSalir: TSpeedButton;
    GridMantenimientos: TDBGrid;
    QBancoMantenimiento: TQuery;
    SBancoMantenimiento: TDataSource;
    QNivelTension: TQuery;
    QNivelTensionCODIGONIVELTENSION: TStringField;
    QNivelTensionTENSION: TFloatField;
    QNivelTensionCOLOR: TFloatField;
    QNivelTensionNIVEL: TStringField;
    SNivelTension: TDataSource;
    dsTipoMantenimiento: TDataSource;
    qTipoMantenimiento: TQuery;
    dsAmbito: TDataSource;
    qAmbito: TQuery;
    STipoElemento: TDataSource;
    QTipoElemento: TQuery;
    PanelFiltros: TPanel;
    Label1: TLabel;
    TipoMantenimiento: TDBLookupComboBox;
    Label3: TLabel;
    TipoElemento: TDBLookupComboBox;
    Label4: TLabel;
    Ambito: TDBLookupComboBox;
    UpdateBancoMantenimiento: TUpdateSQL;
    QActividadMantenimiento: TQuery;
    UpdateActividadMantenimiento: TUpdateSQL;
    Panel1: TPanel;
    SBPrimero: TSpeedButton;
    SBSiguiente: TSpeedButton;
    SBAnterior: TSpeedButton;
    SBUltimo: TSpeedButton;
    QBancoMantenimientoCODIGOBANCOMANTENIMIENTO: TFloatField;
    QBancoMantenimientoNOMBREMANTENIMIENTO: TStringField;
    QBancoMantenimientoCODIGONIVELTENSION: TStringField;
    QBancoMantenimientoCODIGOAMBITO: TFloatField;
    QBancoMantenimientoFRECUENCIA: TFloatField;
    QBancoMantenimientoDESCRIPCION: TBlobField;
    QBancoMantenimientoCODIGOTIPOMANT: TFloatField;
    QBancoMantenimientoCODIGODESCRIPTIVO: TStringField;
    QBancoMantenimientoCODIGOELEMENTO: TFloatField;
    QBancoMantenimientoCODIGOAREAOPERACIONODT: TFloatField;
    QBancoMantenimientoNIVELTENSION: TFloatField;
    QBancoMantenimientoTIPOMANT: TStringField;
    QBancoMantenimientoAMBITO: TStringField;
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
    QBancoMantenimientoELEMENTO: TStringField;
    DBNavigator1: TDBNavigator;
    lbSubestacion: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    qSubestacion: TQuery;
    dsSubestacion: TDataSource;
    procedure SBNuevoClick(Sender: TObject);
    procedure SBEditarClick(Sender: TObject);
    procedure SBSalirClick(Sender: TObject);
    procedure SBFiltrosClick(Sender: TObject);
    procedure TipoMantenimientoClick(Sender: TObject);
    procedure TipoElementoClick(Sender: TObject);
    procedure NivelTensionClick(Sender: TObject);
    procedure AmbitoClick(Sender: TObject);
    procedure SBBorrarClick(Sender: TObject);
    procedure SBUltimoClick(Sender: TObject);
    procedure SBPrimeroClick(Sender: TObject);
    procedure SBAnteriorClick(Sender: TObject);
    procedure SBSiguienteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    constructor crear(AOwner: TComponent);
  end;

var
  FMantenimientosElemento: TFMantenimientosElemento;

implementation

uses ubancomantenimiento, ConsDll;

{$R *.DFM}

constructor TFMantenimientosElemento.crear(AOwner: TComponent);
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



procedure TFMantenimientosElemento.SBNuevoClick(Sender: TObject);
var
// BancoMant: Tfbancomantenimiento;
 bandera:boolean;
begin
//showmessage(inttostr(VARCODIGOUSUARIO));
  fbancomantenimiento:= Tfbancomantenimiento.crearnuevobanco(self);
  if fbancomantenimiento.ShowModal = mrOk then
    if not PanelFiltros.Visible then
      begin
        if QBancoMantenimiento.Active then
          QBancoMantenimiento.Close;
        QBancoMantenimiento.Open;
      end
    else
      begin
        bandera:= True;
        if TipoMantenimiento.Text <> '' then
          if TipoMantenimiento.KeyValue <> fbancomantenimiento.CodigoTipoMantenimiento.KeyValue then
            bandera:= false;
        if TipoElemento.Text <> '' then
          if TipoElemento.KeyValue <> fbancomantenimiento.TipoElemento.KeyValue then
            bandera:= false;
//        if NivelTension.Text <> '' then
//          if NivelTension.KeyValue <> fbancomantenimiento.niveltension.KeyValue then
//            bandera:= false;
        if Ambito.Text <> '' then
          if Ambito.KeyValue <> fbancomantenimiento.CodigoAmbito.KeyValue then
            bandera:= false;
        if bandera = True then
          begin
            if QBancoMantenimiento.Active then
              QBancoMantenimiento.Close;
            QBancoMantenimiento.Open;
          end;
      end;
  fbancomantenimiento.Free;

end;

procedure TFMantenimientosElemento.SBEditarClick(Sender: TObject);
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

procedure TFMantenimientosElemento.SBSalirClick(Sender: TObject);
begin
 ModalResult:= mrOk;
end;



procedure TFMantenimientosElemento.SBFiltrosClick(Sender: TObject);
begin
  if not Panelfiltros.Visible then
    begin
      GridMantenimientos.Top:= GridMantenimientos.Top + 76;
      Panelfiltros.Visible:= True;
    end
  else
    begin
      Panelfiltros.Visible:= False;
      if QBancoMantenimiento.Active then
        QBancoMantenimiento.Close;
      QBancoMantenimiento.SQL.Clear;
      QBancoMantenimiento.SQL.Add('select * from pm_bancomantenimiento');
      QBancoMantenimiento.Open;  
      if not GridMantenimientos.Columns[10].visible then
        GridMantenimientos.Columns[10].visible:= True;
      if not GridMantenimientos.Columns[11].visible then
        GridMantenimientos.Columns[11].visible:= True;
      if not GridMantenimientos.Columns[12].visible then
        GridMantenimientos.Columns[12].visible:= True;
      if not GridMantenimientos.Columns[13].visible then
        GridMantenimientos.Columns[13].visible:= True;
      if QBancoMantenimiento.Active then
        QBancoMantenimiento.Open;
      QBancoMantenimiento.Open;
      if TipoMantenimiento.Text<>'' then
        TipoMantenimiento.KeyValue:= 0;
//      if NivelTension.Text <> '' then
//        NivelTension.KeyValue:= '';
      if TipoElemento.Text <> '' then
        TipoElemento.KeyValue:= '';
      if Ambito.Text <> '' then
        Ambito.KeyValue:= 0;
      GridMantenimientos.Top:= GridMantenimientos.Top - 71;
    end;
   {if not Panel5.Visible then
    Panel5.Visible:= True
  else
    Panel5.Visible:= False;}
end;

procedure TFMantenimientosElemento.TipoMantenimientoClick(Sender: TObject);
var sql:String;
begin
  if GridMantenimientos.Columns[11].Visible = True then
    GridMantenimientos.Columns[11].Visible:= False;
  if QBancoMantenimiento.Active then
    QBancoMantenimiento.Close;
  QBancoMantenimiento.SQL.Clear;
  sql:=' select * from pm_bancomantenimiento where codigotipomant= '+VarToStr(TipoMantenimiento.KeyValue);
//  if NivelTension.Text <> '' then
//    sql:= sql+' and codigoniveltension= '+VarToStr(NivelTension.KeyValue);
  if TipoElemento.Text <> '' then
    sql:= sql+' and codigoelemento= '+VarToStr(TipoElemento.KeyValue);
  if Ambito.Text <> '' then
    sql:= sql+' and codigoambito= '+VarToStr(Ambito.KeyValue);
  QBancoMantenimiento.SQL.Add(sql);
  QBancoMantenimiento.Open;
end;

procedure TFMantenimientosElemento.TipoElementoClick(Sender: TObject);
var sql:String;
begin
  if GridMantenimientos.Columns[13].Visible = True then
    GridMantenimientos.Columns[13].Visible:= False;
  if QBancoMantenimiento.Active then
    QBancoMantenimiento.Close;
  QBancoMantenimiento.SQL.Clear;
  sql:=' select * from pm_bancomantenimiento where codigoelemento= '+VarToStr(TipoElemento.KeyValue);
//  if NivelTension.Text <> '' then
//    sql:= sql+' and codigoniveltension= '+VarToStr(NivelTension.KeyValue);
  if TipoMantenimiento.Text <> '' then
    sql:= sql+' and codigotipomant= '+VarToStr(TipoMantenimiento.KeyValue);
  if Ambito.Text <> '' then
    sql:= sql+' and codigoambito= '+VarToStr(Ambito.KeyValue);
  QBancoMantenimiento.SQL.Add(sql);
  QBancoMantenimiento.Open;
end;

procedure TFMantenimientosElemento.NivelTensionClick(Sender: TObject);
var sql:String;
begin
  if GridMantenimientos.Columns[10].Visible = True then
    GridMantenimientos.Columns[10].Visible:= False;
  if QBancoMantenimiento.Active then
    QBancoMantenimiento.Close;
  QBancoMantenimiento.SQL.Clear;
//  sql:=' select * from pm_bancomantenimiento where codigoniveltension= '+VarToStr(NivelTension.KeyValue);
  if TipoMantenimiento.Text <> '' then
    sql:= sql+' and codigotipomant= '+VarToStr(TipoMantenimiento.KeyValue);
  if TipoElemento.Text <> '' then
    sql:= sql+' and codigoelemento= '+VarToStr(TipoElemento.KeyValue);
  if Ambito.Text <> '' then
    sql:= sql+' and codigoambito= '+VarToStr(Ambito.KeyValue);
  QBancoMantenimiento.SQL.Add(sql);
  QBancoMantenimiento.Open;
end;

procedure TFMantenimientosElemento.AmbitoClick(Sender: TObject);
var sql:String;
begin
  if QTipoElemento.Active then
    QTipoElemento.Close;
  QTipoElemento.ParamByName('CODIGOAMBITO').AsInteger:= Ambito.KeyValue;
  QTipoElemento.Open;
  if GridMantenimientos.Columns[12].Visible = True then
    GridMantenimientos.Columns[12].Visible:= False;
  if QBancoMantenimiento.Active then
    QBancoMantenimiento.Close;
  QBancoMantenimiento.SQL.Clear;
  sql:=' select * from pm_bancomantenimiento where codigoambito= '+VarToStr(Ambito.KeyValue);
//  if NivelTension.Text <> '' then
//    sql:= sql+' and codigoniveltension= '+VarToStr(NivelTension.KeyValue);
  if TipoElemento.Text <> '' then
    sql:= sql+' and codigoelemento= '+VarToStr(TipoElemento.KeyValue);
  if TipoMantenimiento.Text <> '' then
    sql:= sql+' and codigotipomant= '+VarToStr(TipoMantenimiento.KeyValue);
  QBancoMantenimiento.SQL.Add(sql);
  QBancoMantenimiento.Open;
end;

procedure TFMantenimientosElemento.SBBorrarClick(Sender: TObject);
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

procedure TFMantenimientosElemento.SBUltimoClick(Sender: TObject);
begin
  DBNavigator1.BtnClick(nbLast);
  SBPrimero.Enabled:= DBNavigator1.Controls[0].Enabled;
  SBAnterior.Enabled:= DBNavigator1.Controls[1].Enabled;
  SBSiguiente.Enabled:= DBNavigator1.Controls[2].Enabled;
  SBUltimo.Enabled:= DBNavigator1.Controls[3].Enabled;

end;

procedure TFMantenimientosElemento.SBPrimeroClick(Sender: TObject);
begin
  DBNavigator1.BtnClick(nbFirst);
  SBPrimero.Enabled:= DBNavigator1.Controls[0].Enabled;
  SBAnterior.Enabled:= DBNavigator1.Controls[1].Enabled;
  SBSiguiente.Enabled:= DBNavigator1.Controls[2].Enabled;
  SBUltimo.Enabled:= DBNavigator1.Controls[3].Enabled;
end;

procedure TFMantenimientosElemento.SBAnteriorClick(Sender: TObject);
begin
  DBNavigator1.BtnClick(nbPrior);
  SBPrimero.Enabled:= DBNavigator1.Controls[0].Enabled;
  SBAnterior.Enabled:= DBNavigator1.Controls[1].Enabled;
  SBSiguiente.Enabled:= DBNavigator1.Controls[2].Enabled;
  SBUltimo.Enabled:= DBNavigator1.Controls[3].Enabled;
end;

procedure TFMantenimientosElemento.SBSiguienteClick(Sender: TObject);
begin
  DBNavigator1.BtnClick(nbNext);
  SBPrimero.Enabled:= DBNavigator1.Controls[0].Enabled;
  SBAnterior.Enabled:= DBNavigator1.Controls[1].Enabled;
  SBSiguiente.Enabled:= DBNavigator1.Controls[2].Enabled;
  SBUltimo.Enabled:= DBNavigator1.Controls[3].Enabled;
end;

procedure TFMantenimientosElemento.FormCreate(Sender: TObject);
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

end.
