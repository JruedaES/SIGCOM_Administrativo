unit uListaSoporte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Buttons, Grids, DBGrids, ExtCtrls, StdCtrls;

type
  TfListaSoporte = class(TForm)
    Panel32: TPanel;
    dbgRequisiciones: TDBGrid;
    Panel33: TPanel;
    sbAgregarSolicitudSoporte: TSpeedButton;
    sbEditarSolicitudSoporte: TSpeedButton;
    sbImprimirSolicitudSoporte: TSpeedButton;
    Panel2: TPanel;
    dsSe_solicitud: TDataSource;
    qSe_Solicitud: TQuery;
    Panel3: TPanel;
    sbEliminarSolicitudSoporte: TSpeedButton;
    SBSalir: TSpeedButton;
    PFiltro: TPanel;
    sDatosFiltro: TShape;
    lFiltroDatos: TLabel;
    mRotulos1: TMemo;
    mPuntos1: TMemo;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    qSe_SolicitudNOMBREESTADOSOLICITUD: TStringField;
    qSe_SolicitudNOMBREAREAFUNCIONAL: TStringField;
    qSe_SolicitudNOMBREUSUARIO: TStringField;
    qSe_SolicitudNOMBREUSUARIO_1: TStringField;
    qSe_SolicitudNOMBREPRIORIDADSOLICITUD: TStringField;
    qSe_SolicitudNOMBRETIPOSOLICITUD: TStringField;
    qSe_SolicitudNOMBREAPLICATIVO: TStringField;
    qSe_SolicitudNOMBRECATEGORIA: TStringField;
    qSe_SolicitudCODIGOSOLICITUD: TFloatField;
    qSe_SolicitudCODIGOCIASOLICITA: TFloatField;
    qSe_SolicitudCODIGOUSUARIOINFORMANTE: TFloatField;
    qSe_SolicitudCODIGOUSUARIOSOLICITA: TFloatField;
    qSe_SolicitudCODIGOUSUARIOSOPORTE: TFloatField;
    qSe_SolicitudFECHAHORASOLICITUD: TDateTimeField;
    qSe_SolicitudCODIGOTIPOSOLICITUD: TFloatField;
    qSe_SolicitudCODIGOPRIORIDADSOLICITUD: TFloatField;
    qSe_SolicitudCODIGOESTADOSOLICITUD: TFloatField;
    qSe_SolicitudNOMBRESOLICITUD: TStringField;
    qSe_SolicitudDESCRIPCIONSOLICITUD: TBlobField;
    qSe_SolicitudTELEFONOCIASOLICITA: TFloatField;
    qSe_SolicitudEXTENSIONCIASOLICITA: TFloatField;
    qSe_SolicitudFECHAINICIALASIGNADA: TDateTimeField;
    qSe_SolicitudFECHAFINALASIGNADA: TDateTimeField;
    qSe_SolicitudFECHAINICIALEJECUTADA: TDateTimeField;
    qSe_SolicitudFECHAFINALEJECUTADA: TDateTimeField;
    qSe_SolicitudCODIGOAPLICATIVO: TFloatField;
    qSe_SolicitudOBSERVACIONES: TStringField;
    qSe_SolicitudFECHAHORAREGISTRO: TDateTimeField;
    qSe_SolicitudCODIGOUSUARIOCREACION: TFloatField;
    qSe_SolicitudCODIGOAREAFUNCIONAL: TFloatField;
    qSe_SolicitudFECHAHORAMODIFICACION: TDateTimeField;
    qSe_SolicitudCODIGOUSUARIOMODIFICACION: TFloatField;
    qSe_SolicitudNOMBREEMPLEADO: TStringField;
    procedure sbAgregarSolicitudSoporteClick(Sender: TObject);
    procedure sbEditarSolicitudSoporteClick(Sender: TObject);
    procedure sbImprimirSolicitudSoporteClick(Sender: TObject);
    procedure sbEliminarSolicitudSoporteClick(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fListaSoporte: TfListaSoporte;

implementation
uses usolicitudsoporte, ufiltroSolicitudSoporte, uQRSolicitudSoporte,ConsDll;
{$R *.DFM}

procedure TfListaSoporte.sbAgregarSolicitudSoporteClick(Sender: TObject);
begin
  fsolicitudsoporte := Tfsolicitudsoporte.Create(Application);
  fsolicitudsoporte.Show;
  qSe_Solicitud.Close;
  qSe_Solicitud.Open;
end;

procedure TfListaSoporte.sbEditarSolicitudSoporteClick(Sender: TObject);
begin
  fsolicitudsoporte := Tfsolicitudsoporte.Create(Application);
  fsolicitudsoporte.qSolicitud.sql.clear;
  fsolicitudsoporte.qSolicitud.sql.Text:= 'SELECT * FROM SE_SOLICITUD '+
                                          'where codigosolicitud = '+ qSe_SolicitudCODIGOSOLICITUD.asstring;
  fsolicitudsoporte.qSolicitud.open;
  fsolicitudsoporte.qSolicitud.Edit;
  fsolicitudsoporte.Show;
  qSe_Solicitud.Close;
  qSe_Solicitud.Open;
end;

procedure TfListaSoporte.sbImprimirSolicitudSoporteClick(Sender: TObject);
begin
  if qSe_SolicitudCODIGOESTADOSOLICITUD.asfloat=4 then
    raise Exception.Create('Esta Solicitud no se puede imprimir porque está cancelada.');
  fQrsolicitudsoporte := TfQrsolicitudsoporte.Create(Application);
  fQRSolicitudSoporte.qSe_Solicitud.Close;
  fQrsolicitudsoporte.qSe_Solicitud.ParamByName('codigosolicitud').AsFloat := qSe_SolicitudCODIGOSOLICITUD.AsFloat;
  fQrsolicitudsoporte.qSe_Solicitud.Open;
  fQrsolicitudsoporte.qrSolicitudSoporte.Preview;
end;

procedure TfListaSoporte.sbEliminarSolicitudSoporteClick(Sender: TObject);
var
qconsulta:tQuery;
begin
  if Application.MessageBox('Esta seguro de Anular este registro? ','Advertencia!', mb_yesNoCancel)=mrYes then
  begin
    qConsulta := TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.SQL.Text := 'UPDATE se_solicitud SET codigoestadosolicitud = 4, codigousuariomodificacion = '+inttostr(VarCodigoUsuario)+', fechahoramodificacion = (SELECT SYSDATE FROM DUAL) where codigosolicitud = '+ qSe_SolicitudCODIGOSOLICITUD.asstring;
    qConsulta.execsql;
    qConsulta.Free;
  end;
end;

procedure TfListaSoporte.SBFiltrarClick(Sender: TObject);
begin
  fFiltroSolicitudSoporte:=TfFiltroSolicitudSoporte.Create(Application);
  fFiltroSolicitudSoporte.ShowModal;
  fFiltroSolicitudSoporte.Free;
end;

procedure TfListaSoporte.SBBuscarClick(Sender: TObject);
begin
//buscar
end;

procedure TfListaSoporte.FormCreate(Sender: TObject);
begin
  qSe_Solicitud.open;
end;

procedure TfListaSoporte.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure TfListaSoporte.SBSalirClick(Sender: TObject);
begin
  close;
end;

end.
