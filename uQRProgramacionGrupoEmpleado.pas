unit uQRProgramacionGrupoEmpleado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, DBTables, Db, ExtCtrls, Digisoft, StdCtrls, Mask,
  DBCtrls;

type
  TFQRProgramacionGrupoEmpleado = class(TForm)
    QuickRep: TQuickRep;
    TitleBand1: TQRBand;
    BandGroupHeader: TQRGroup;
    BandGroupFooter: TQRBand;
    QRExprNombreGrupo: TQRExpr;
    QRBand1: TQRBand;
    qrdbNombreEmpleado: TQRDBText;
    qrdbCodigoEmpleado: TQRDBText;
    qGrupoEmpleado: TQuery;
    qGrupoEmpleadoCODIGOPROGRAMACION: TFloatField;
    qGrupoEmpleadoCODIGOADMINISTRATIVO: TFloatField;
    qGrupoEmpleadoCODIGOGRUPOTRABAJO: TFloatField;
    qGrupoEmpleadoFECHA: TDateTimeField;
    qGrupoEmpleadoCODIGOEMPLEADO: TFloatField;
    qGrupoEmpleadoNOMBREEMPLEADO: TStringField;
    qGrupoEmpleadoNOMBREGRUPOTRABAJO: TStringField;
    ChildBand1: TQRChildBand;
    qrdbNombreProgramacion: TQRDBText;
    procedure QuickRepAfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FQRProgramacionGrupoEmpleado: TFQRProgramacionGrupoEmpleado;

implementation

{$R *.DFM}


procedure TFQRProgramacionGrupoEmpleado.QuickRepAfterPreview(
  Sender: TObject);
begin
  Close;
end;

procedure TFQRProgramacionGrupoEmpleado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action:=caFree;
end;

end.
