unit uAuditoriaSupervisor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, RXDBCtrl, Db, DBTables, ExtCtrls, Buttons, UTrCVS,
  StdCtrls;

type
  TfAuditoriaSupervisor = class(TForm)
    qAuditoria: TQuery;
    dsAuditoria: TDataSource;
    RxDBGridAuditoria: TRxDBGrid;
    qAuditoriaCLAVE: TStringField;
    qAuditoriaLECTURAACTIVALECTOR: TStringField;
    qAuditoriaLECTURAREACTIVALECTOR: TStringField;
    qAuditoriaLECTURADEMANDALECTOR: TStringField;
    qAuditoriaLECTURAACTIVASUPER: TFloatField;
    qAuditoriaLECTURAREACTIVASUPER: TFloatField;
    qAuditoriaLECTURADEMANDASUPER: TFloatField;
    qAuditoriaFACTURO: TStringField;
    qAuditoriaENTREGALECTURA: TStringField;
    qAuditoriaFECHAAUDITORIA: TDateTimeField;
    qAuditoriaFECHACARGUE: TDateTimeField;
    qAuditoriaxSuperv: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    StringField5: TStringField;
    StringField6: TStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    dsAuditoriaxSuperv: TDataSource;
    SaveDialog1: TSaveDialog;
    CVS1: TCVS;
    Panel2: TPanel;
    Panel3: TPanel;
    sbExportar: TSpeedButton;
    SBSalir: TSpeedButton;
    sbVistaPreliminarVL: TSpeedButton;
    Panel1: TPanel;
    qAuditoriaPERIODO: TStringField;
    lFechaLectura: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    LblItinerario: TLabel;
    Panel4: TPanel;
    procedure FormShow(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBSalirClick(Sender: TObject);
    procedure sbVistaPreliminarVLClick(Sender: TObject);
    procedure CargarVistaPreliminar(CodApoyo: string);
    procedure qAuditoriaAfterScroll(DataSet: TDataSet);
    procedure qAuditoriaxSupervAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
   origen: Integer;
   fecha: String;
   itinerario: String;
  end;

var
  fAuditoriaSupervisor: TfAuditoriaSupervisor;

implementation

uses uGaleriaPreliminar;

{$R *.DFM}

procedure TfAuditoriaSupervisor.FormShow(Sender: TObject);
begin
  lFechaLectura.Caption :=fecha;
  LblItinerario.Caption :=itinerario;
if origen >1 then
   begin
     qAuditoriaxSuperv.close;
     qAuditoriaxSuperv.ParamByName('USUARIO').AsInteger := origen;
     qAuditoriaxSuperv.ParamByName('FECHAAUDITAR').AsString:= fecha;
     qAuditoriaxSuperv.ParamByName('CODIGOITINERARIO').AsString:= itinerario;
     RxDBGridAuditoria.DataSource := dsAuditoriaxSuperv;
     qAuditoriaxSuperv.open;
     Panel2.Caption := '<< AUDITORIA PARA ' +
    IntToStr(qAuditoriaxSuperv.RecordCount) + ' Registros  >> ';
   end
else
    begin
    qAuditoria.close;
    qAuditoria.ParamByName('FECHAAUDITAR').AsString:= fecha;
    qAuditoria.ParamByName('CODIGOITINERARIO').AsString:= itinerario;
    RxDBGridAuditoria.DataSource := dsAuditoria;
    qAuditoria.open;
    Panel2.Caption := '<< AUDITORIA PARA ' +
    IntToStr(qAuditoria.RecordCount) + ' Registros  >> ';
    end
end;

procedure TfAuditoriaSupervisor.sbExportarClick(Sender: TObject);
begin
   if SaveDialog1.Execute then
      begin
      if origen>1 then
         begin
           dsAuditoriaxSuperv.DataSet.DisableControls;
           CVS1.DataSet:= dsAuditoriaxSuperv.DataSet;
           CVS1.FileNameText := SaveDialog1.FileName;
           CVS1.TableExport;
           dsAuditoriaxSuperv.DataSet.EnableControls;
         end
      else
         begin
           dsAuditoria.DataSet.DisableControls;
           CVS1.DataSet:= dsAuditoria.DataSet;
           CVS1.FileNameText := SaveDialog1.FileName;
           CVS1.TableExport;
           dsAuditoria.DataSet.EnableControls;
         end
      end
   else
     begin
     ShowMessage('Se ha cancelado la operación');
     end;
end;

procedure TfAuditoriaSupervisor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
qAuditoria.Close;
qAuditoriaxSuperv.close;
if Assigned(fGaleriaPreliminar) then
  begin
    fGaleriaPreliminar.Free;
    fGaleriaPreliminar := nil;
  end;
end;

procedure TfAuditoriaSupervisor.SBSalirClick(Sender: TObject);
begin
if qAuditoria.Active then qAuditoria.Close;
if qAuditoriaxSuperv.Active then qAuditoriaxSuperv.close;
close;
end;

procedure TfAuditoriaSupervisor.sbVistaPreliminarVLClick(Sender: TObject);
var
  CodigoApoyo: string;
  i: integer;
begin
IF sbVistaPreliminarVL.Down = true then
  Begin
       if origen>1 then
         begin
          Panel1.Visible := true;
          CargarVistaPreliminar(qAuditoriaxSuperv.fieldByName('CLAVE').AsString);
         end
       else
         begin
         Panel1.Visible := true;
         CargarVistaPreliminar(qAuditoria.fieldByName('CLAVE').AsString);
         end
  end
else
    Panel1.Visible := False;
end;
procedure TfAuditoriaSupervisor.CargarVistaPreliminar(CodApoyo: string);
var
  CodigoApoyo: string;
  i: integer;
begin
  if origen>1 then
  begin
       CodigoApoyo := qAuditoriaxSuperv.fieldByName('CLAVE').AsString;
  end
  else
  begin
       CodigoApoyo := qAuditoria.fieldByName('CLAVE').AsString;
  end;
  if CodigoApoyo <> '' then
  begin
    fGaleriaPreliminar := TfGaleriaPreliminar.CreateByparametros(Application,CodigoApoyo);
    fGaleriaPreliminar.FechaLectura := lFechaLectura.Caption;
    fGaleriaPreliminar.TipoDeFoto := '22';
    fGaleriaPreliminar.ManualDock(Panel1);
    fGaleriaPreliminar.Show;
  end;
end;
procedure TfAuditoriaSupervisor.qAuditoriaAfterScroll(DataSet: TDataSet);
begin
IF Panel1.Visible THEN
  BEGIN
    fGaleriaPreliminar := NIL;
    fGaleriaPreliminar.Free;
    CargarVistaPreliminar(qAuditoria.fieldByName('CLAVE').AsString);
  end;
end;

procedure TfAuditoriaSupervisor.qAuditoriaxSupervAfterScroll(
  DataSet: TDataSet);
begin
IF Panel1.Visible THEN
  BEGIN
    fGaleriaPreliminar := NIL;
    fGaleriaPreliminar.Free;
    CargarVistaPreliminar(qAuditoriaxSuperv.fieldByName('CLAVE').AsString);
  end;
end;

end.
