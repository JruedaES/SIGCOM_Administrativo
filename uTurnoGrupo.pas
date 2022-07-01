unit uTurnoGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, DBCtrls, Db, Mask, DBTables,
  Grids, DBGrids, RXDBCtrl;

type
  TfTurnoGrupo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    bbCancelar: TBitBtn;
    bbAceptar: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    qTurno: TQuery;
    qTurnoCODIGOTURNOGRUPO: TFloatField;
    qTurnoCODIGOHORARIOTRABAJO: TFloatField;
    qHorarioTrabajo: TQuery;
    qTurnoNOMBREHORARIOTRABAJO: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dsTurno: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    qDetalleTurno: TQuery;
    qDetalleTurnoCODIGOTURNOGRUPO: TFloatField;
    qDetalleTurnoJORNADA: TFloatField;
    qDetalleTurnoHORAINICIO: TDateTimeField;
    qDetalleTurnoHORAFIN: TDateTimeField;
    DataSource1: TDataSource;
    UpdSQLTurno: TUpdateSQL;
    UpdSQLDetalleTurno: TUpdateSQL;
    RxDBGrid1: TRxDBGrid;
    DBNavigator1: TDBNavigator;
    qTurnoNOMBRETURNO: TStringField;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure qTurnoUpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qDetalleTurnoUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure bbAceptarClick(Sender: TObject);
    procedure bbCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure qDetalleTurnoAfterInsert(DataSet: TDataSet);
    procedure qDetalleTurnoAfterPost(DataSet: TDataSet);
    procedure qDetalleTurnoAfterDelete(DataSet: TDataSet);
    procedure qTurnoAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
   bDatosIncompletos, bCancelando: Boolean;
  end;

var
  fTurnoGrupo: TfTurnoGrupo;

implementation

{$R *.DFM}

procedure TfTurnoGrupo.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if (Key = #13) then
     if (ActiveControl is TDBLookupComboBox) then
     begin
       if not (ActiveControl as TDBLookupComboBox).ListVisible then
          Perform(wm_NextDLGCTL, 0, 0);
     end
     else
     begin
       Perform(wm_NextDLGCTL, 0, 0);
       key := #0;
     end
end;

procedure TfTurnoGrupo.FormCreate(Sender: TObject);
begin
  bCancelando := false;
end;

procedure TfTurnoGrupo.qTurnoUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  try
  finally
  end;
end;

procedure TfTurnoGrupo.qDetalleTurnoUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  try
  finally
  end;
end;

procedure TfTurnoGrupo.bbAceptarClick(Sender: TObject);
begin
bDatosIncompletos := False;
  try
     qTurno.Post;
     if qTurno.UpdatesPending then
        qTurno.ApplyUpdates;

     if qDetalleTurno.UpdatesPending then
        qDetalleTurno.ApplyUpdates;
     Close;
     ModalResult:=MrOk;
  except
     bDatosIncompletos := True;
     qTurno.Edit;
     ModalResult:=MrCancel;
     Close;
  end;
end;

procedure TfTurnoGrupo.bbCancelarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Perderá los cambios realizados.Esta seguro de Cancelar?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
     begin
      try
         qTurno.Cancel;
         if qTurno.UpdatesPending then
            qTurno.CancelUpdates;

         qDetalleTurno.Cancel;
         if qDetalleTurno.UpdatesPending then
        qDetalleTurno.CancelUpdates;
       finally
         bDatosIncompletos := true;
         bCancelando := true;
         Close;
       end;
     end
  else
     begin
        ModalResult := 0;
        bDatosIncompletos := false;
     end;
end;

procedure TfTurnoGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if not bCancelando then
    begin
      if bDatosIncompletos then
       begin
         if Application.MessageBox(PChar('Hay datos incompletos.Desea completar los datos?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
            begin
              ModalResult := 0;
              bDatosIncompletos := false;
              Action:=caNone;
            end
         else
            begin
              qTurno.Cancel;
              qTurno.CancelUpdates;

              qDetalleTurno.Cancel;
              qDetalleTurno.CancelUpdates;
              Action:=caFree;
            end;
       end
     else
       if ModalResult <> MrCancel then
       begin
          ModalResult := mrOK;
          Action:=caFree;
       end;
     end;
   if ModalResult=2 then
   begin
     try
      qTurno.Cancel;
      qTurno.CancelUpdates;
      qDetalleTurno.Cancel;
      qDetalleTurno.CancelUpdates;
      Action:=caFree;
     except
     end;
   end;
end;

procedure TfTurnoGrupo.RxDBGrid1DblClick(Sender: TObject);
begin
  qDetalleTurno.Edit;
end;

procedure TfTurnoGrupo.qDetalleTurnoAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('CODIGOTURNOGRUPO').AsString:=qTurno.FieldByName('CODIGOTURNOGRUPO').AsString;
end;

procedure TfTurnoGrupo.qDetalleTurnoAfterPost(DataSet: TDataSet);
begin
   try
     qDetalleTurno.ApplyUpdates;
     qDetalleTurno.CommitUpdates;
   except
     qDetalleTurno.CancelUpdates;
   end;

end;

procedure TfTurnoGrupo.qDetalleTurnoAfterDelete(DataSet: TDataSet);
begin
   try
     qDetalleTurno.ApplyUpdates;
     qDetalleTurno.CommitUpdates;
   except
     qDetalleTurno.CancelUpdates;
   end;
end;

procedure TfTurnoGrupo.qTurnoAfterInsert(DataSet: TDataSet);
var qDatos:TQuery;
begin
  qDatos:=TQuery.Create(Application);
  qDatos.DatabaseName:='BaseDato';
  qDatos.SQL.Text:='SELECT MAX(CODIGOTURNOGRUPO) FROM TURNOGRUPO';
  qDatos.Open;
  qTurnoCODIGOTURNOGRUPO.AsInteger:=qDatos.Fields[0].AsInteger + 1;
  qDatos.Free;
end;

end.
