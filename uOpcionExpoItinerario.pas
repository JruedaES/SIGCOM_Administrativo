unit uOpcionExpoItinerario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, Db, DBTables;

type
  TfOpcionExpoItinerario = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    qGrupoTrabajo: TQuery;
    qGrupoTrabajoCODIGOADMINISTRATIVO: TFloatField;
    qGrupoTrabajoCODIGOGRUPOTRABAJO: TFloatField;
    qGrupoTrabajoNOMBREGRUPOTRABAJO: TStringField;
    dsGrupoTrabajo: TDataSource;
    GroupBox1: TGroupBox;
    DBEdit2: TDBEdit;
    dblcbGT: TDBLookupComboBox;
    rgOpciones: TRadioGroup;
    edCodCliente: TEdit;
    qGrupoTrabajoCODIGOUSUARIO: TFloatField;
    dbeCIA: TDBEdit;
    qGrupoTrabajoNOMBREADMINISTRATIVO: TStringField;
    qGrupoTrabajoNOMBRECATEGORIA: TStringField;
    lbCIA: TLabel;
    procedure rgOpcionesClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edCodClienteKeyPress(Sender: TObject; var Key: Char);
    procedure qGrupoTrabajoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    bPuedoCerrar: Boolean;
  public
    { Public declarations }
    Periodo, CodigoDial, CodigoGrupoIti, CodigoItinerario: Integer;
    FechaLectura: string;
  end;

var
  fOpcionExpoItinerario: TfOpcionExpoItinerario;

implementation

uses uFormaEspere;

{$R *.DFM}

procedure TfOpcionExpoItinerario.rgOpcionesClick(Sender: TObject);
begin
  if rgOpciones.ItemIndex = 2 then
    edCodCliente.Enabled := True
  else
    edCodCliente.Enabled := False;
end;

procedure TfOpcionExpoItinerario.BitBtn1Click(Sender: TObject);
var
  qTra, qTemp, qUpdGT: TQuery;
  iNumCliExpo, iCodEstado: integer;
begin
  bPuedoCerrar:= True;
  iNumCliExpo:=0;

  if dblcbGT.KeyValue = Null then
  begin
    bPuedoCerrar := False;
    raise Exception.Create('Debe seleccionar el nuevo Lector');
  end;

  if rgOpciones.ItemIndex = -1 then
  begin
    bPuedoCerrar := False;
    raise Exception.Create('Debe seleccionar una opción de exportación');
  end;

  if rgOpciones.ItemIndex = 2 then
  begin
    if Trim(edCodCliente.Text) = '' then
    begin
      bPuedoCerrar := False;
      raise Exception.Create('Debe digitar la clave del Cliente');
    end;
  end;

  if Application.MessageBox('La asignación y exportación puede tardar varios minutos, está seguro de continuar?','SigCom',MB_YESNO+MB_ICONWARNING+MB_DEFBUTTON2) = ID_YES then
  begin
    try
      qTra:=TQuery.Create(nil);
      qTra.DatabaseName := 'BaseDato';
      qTra.SQL.Add('SELECT * FROM PARAMETRO');
      qTra.Open;
      qTra.Database.StartTransaction;

      qTemp:= TQuery.Create(nil);
      qTemp.DatabaseName := 'BaseDato';

      if rgOpciones.ItemIndex = 0 then
      begin
        qTemp.SQL.Add('UPDATE SGC_INFOITINERARIO SET CODIGOADMINISTRATIVO = '+qGrupoTrabajoCODIGOADMINISTRATIVO.AsString);
        qTemp.SQL.Add(', CODIGOGRUPOTRABAJO = '+qGrupoTrabajoCODIGOGRUPOTRABAJO.AsString);
        qTemp.SQL.Add('WHERE PERIODO = :PERIODO');
        qTemp.SQL.Add('AND CODIGODIAL = :CODIGODIAL');
        qTemp.SQL.Add('AND CODIGOITINERARIO = :CODIGOITINERARIO');
      end
      else if rgOpciones.ItemIndex = 1 then
      begin
        qTemp.SQL.Add('UPDATE SGC_INFOITINERARIO M');
        qTemp.SQL.Add('SET M.CODIGOADMINISTRATIVO = '+qGrupoTrabajoCODIGOADMINISTRATIVO.AsString);
        qTemp.SQL.Add(', M.CODIGOGRUPOTRABAJO = '+qGrupoTrabajoCODIGOGRUPOTRABAJO.AsString);
        qTemp.SQL.Add('WHERE NOT EXISTS');
        qTemp.SQL.Add('          (SELECT *');
        qTemp.SQL.Add('             FROM SIGCOM_LECTURA L');
        qTemp.SQL.Add('            WHERE L.CODIGOITINERARIO = M.CODIGOITINERARIO');
        qTemp.SQL.Add('                  AND L.CLAVE = M.CLAVE');
        qTemp.SQL.Add('                  AND L.CODIGOITINERARIO = :CODIGOITINERARIO');
        qTemp.SQL.Add('                  AND TO_CHAR (L.FECHALECTURAPROGRAMADA, ''DD/MM/YYYY'') = '+QuotedStr(FechaLectura)+')');
        qTemp.SQL.Add('AND M.CODIGODIAL = :CODIGODIAL');
        qTemp.SQL.Add('AND M.PERIODO = :PERIODO');
        qTemp.SQL.Add('AND M.CODIGOITINERARIO = :CODIGOITINERARIO');
      end
      else if rgOpciones.ItemIndex = 2 then
      begin
        qTemp.SQL.Add('UPDATE SGC_INFOITINERARIO M');
        qTemp.SQL.Add('SET M.CODIGOADMINISTRATIVO = '+qGrupoTrabajoCODIGOADMINISTRATIVO.AsString);
        qTemp.SQL.Add(', M.CODIGOGRUPOTRABAJO = '+qGrupoTrabajoCODIGOGRUPOTRABAJO.AsString);
        qTemp.SQL.Add('WHERE EXISTS');
        qTemp.SQL.Add('    (SELECT *');
        qTemp.SQL.Add('       FROM SGC_INFOITINERARIO B');
        qTemp.SQL.Add('       WHERE    M.CODIGOITINERARIO = B.CODIGOITINERARIO');
        qTemp.SQL.Add('            AND M.CODIGODIAL = B.CODIGODIAL');
        qTemp.SQL.Add('            AND M.PERIODO = B.PERIODO');
        qTemp.SQL.Add('            AND M.AOLPREDIO > B.AOLPREDIO');
        qTemp.SQL.Add('            AND M.CODIGOITINERARIO = :CODIGOITINERARIO');
        qTemp.SQL.Add('           AND M.CODIGODIAL = :CODIGODIAL');
        qTemp.SQL.Add('            AND M.PERIODO = :PERIODO');
        qTemp.SQL.Add('            AND B.CLAVE = :CLAVE)');
        qTemp.ParamByName('CLAVE').AsString := Trim(edCodCliente.Text);
      end;

      qTemp.ParamByName('PERIODO').AsInteger := Periodo;
      qTemp.ParamByName('CODIGODIAL').AsInteger := CodigoDial;
      qTemp.ParamByName('CODIGOITINERARIO').AsInteger := CodigoItinerario;
      qTemp.ExecSQL;
      iNumCliExpo:=qTemp.RowsAffected;

      qUpdGT:= TQuery.Create(nil);
      qUpdGT.DatabaseName := 'BaseDato';
      qUpdGT.SQL.Add('UPDATE SGC_ITINERARIO SET CODIGOADMINISTRATIVO = '+qGrupoTrabajoCODIGOADMINISTRATIVO.AsString);
      qUpdGT.SQL.Add(', CODIGOGRUPOTRABAJO = '+qGrupoTrabajoCODIGOGRUPOTRABAJO.AsString);
      qUpdGT.SQL.Add('WHERE CODIGOITINERARIO = '+IntToStr(CodigoItinerario));
      qUpdGT.ExecSQL;

      qTemp.Close;
      qTemp.Free;
      qTemp:= nil;
      qUpdGT.Close;
      qUpdGT.Free;
      qUpdGT:= nil;
      qTra.Database.Commit;
      qTra.Close;
      qTra.Free;
      Application.MessageBox(pchar('Proceso terminado exitosamente. Se exportaron '+IntToStr(iNumCliExpo)+' Clientes.'),'SigCom',MB_ICONINFORMATION);
    except
      on e:Exception do
      begin
        qTra.Database.Rollback;
        qTra.Free;
        if assigned(fFormaEspere) then
        begin
          fFormaEspere.Free;
          fFormaEspere:= nil;
        end;
        if assigned(qTemp) then
        begin
          qTemp.Free;
          qTemp:= nil;
        end;
        if assigned(qUpdGT) then
        begin
          qUpdGT.Free;
          qUpdGT:= nil;
        end;
        Application.MessageBox(pchar('Ocurrió un error en la exportación de la información:'+Chr(13)+Chr(13)+
                                              e.Message+Chr(13)+Chr(13)+'Contacte a soporte'),'Error',MB_ICONERROR);
      end;
    end;
  end;
end;

procedure TfOpcionExpoItinerario.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not bPuedoCerrar then
    CanClose:= False;
end;

procedure TfOpcionExpoItinerario.FormCreate(Sender: TObject);
begin
  bPuedoCerrar:= True;
end;

procedure TfOpcionExpoItinerario.BitBtn2Click(Sender: TObject);
begin
  bPuedoCerrar:= True;
end;

procedure TfOpcionExpoItinerario.FormShow(Sender: TObject);
begin
  Caption:= 'Cambiar Lector del Itinerario: '+IntToStr(CodigoItinerario);
end;

procedure TfOpcionExpoItinerario.edCodClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in ['0'..'9',#7,#8]) then
    key:=#0;
end;

procedure TfOpcionExpoItinerario.qGrupoTrabajoAfterScroll(
  DataSet: TDataSet);
begin
  lbCIA.Caption:=qGrupoTrabajoNOMBREADMINISTRATIVO.AsString;
end;

end.
