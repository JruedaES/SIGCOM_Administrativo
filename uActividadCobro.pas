unit uActividadCobro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons, Menus, utMenuArbol, Db, Mask, DBCtrls,
  DBTables;

type
  TfActividadCobro = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    bbCancelar: TBitBtn;
    bbAceptar: TBitBtn;
    qActividadCobro: TQuery;
    Label1: TLabel;
    dbeCIA: TDBEdit;
    dsActividadCobro: TDataSource;
    lNombreCIA: TLabel;
    qCIA: TQuery;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    UpdSQLActividadCobro: TUpdateSQL;
    qActividadCobroCODIGOADMINISTRATIVO: TFloatField;
    qActividadCobroCODIGOODTACTIVIDADCOBRO: TFloatField;
    qActividadCobroNOMBREODTACTIVIDADCOBRO: TStringField;
    qActividadCobroVALORNORMAL: TFloatField;
    qActividadCobroVALORFESTIVO: TFloatField;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    qCodigo: TQuery;
    Label5: TLabel;
    Label6: TLabel;
    procedure qActividadCobroCODIGOADMINISTRATIVOValidate(Sender: TField);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbAceptarClick(Sender: TObject);
    procedure qActividadCobroUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure bbCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qActividadCobroAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    bDatosIncompletos, bCancelando: Boolean;
  end;

var
  fActividadCobro: TfActividadCobro;

implementation
              
{$R *.DFM}

procedure TfActividadCobro.qActividadCobroCODIGOADMINISTRATIVOValidate(
  Sender: TField);
begin
  if Sender.Text <> '' then
  begin
    qCIA.Close;
    qCIA.Params[0].AsString:=Sender.Text;
    qCIA.Open;
    if qCIA.RecordCount > 0 then
      lNombreCIA.Caption:=qCIA.Fields[0].AsString
    else
      raise Exception.Create('Este Código Administrativo No Existe.')  
  end;
end;

procedure TfActividadCobro.FormKeyPress(Sender: TObject; var Key: Char);
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

procedure TfActividadCobro.FormActivate(Sender: TObject);
begin
if qActividadCobroCODIGOADMINISTRATIVO.AsString <> '' then
     qActividadCobroCODIGOADMINISTRATIVOValidate(qActividadCobroCODIGOADMINISTRATIVO);
end;

procedure TfActividadCobro.FormCreate(Sender: TObject);
begin
   bCancelando := false;
end;

procedure TfActividadCobro.bbAceptarClick(Sender: TObject);
begin
bDatosIncompletos := False;
  try
     qActividadCobro.Post;
     if qActividadCobro.UpdatesPending then
        qActividadCobro.ApplyUpdates;
     Close;
     ModalResult:=MrOk;
  except
     bDatosIncompletos := True;
     qActividadCobro.Edit;
     ModalResult:=MrCancel;
     Close;
  end;
end;

procedure TfActividadCobro.qActividadCobroUpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  try
  finally
  end;
end;

procedure TfActividadCobro.bbCancelarClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Perderá los cambios realizados.Esta seguro de Cancelar?'),PChar('Confirmación'),MB_ICONQUESTION+MB_YESNO)=idYes then
     begin
      try
         qActividadCobro.Cancel;
         if qActividadCobro.UpdatesPending then
          qActividadCobro.CancelUpdates;
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
        dbeCIA.SetFocus;
     end;

end;

procedure TfActividadCobro.FormClose(Sender: TObject;
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
              dbeCIA.SetFocus;
              Action:=caNone;
            end
         else
            begin
              qActividadCobro.Cancel;
              qActividadCobro.CancelUpdates;
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
      qActividadCobro.Cancel;
      qActividadCobro.CancelUpdates;
      Action:=caFree;
     except
     end;
   end;
end;

procedure TfActividadCobro.qActividadCobroAfterInsert(DataSet: TDataSet);
begin
  qCodigo.Close;
  qCodigo.Open;
  DataSet.FieldByName('CODIGOODTACTIVIDADCOBRO').AsInteger:=qCodigo.Fields[0].AsInteger+1;    
end;

end.
