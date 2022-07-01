unit uExpoItinerarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Buttons, Db, DBTables, ConsDll;

type
  TfExpoItinerarios = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    meFechaLectura: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label3: TLabel;
    dsSedesOperativas: TDataSource;
    qSedesOperativas: TQuery;
    dsDiaL: TDataSource;
    qDiaL: TQuery;
    qSedesOperativasCODIGOSEDEOPERATIVA: TFloatField;
    qSedesOperativasNOMBRESEDEOPERATIVA: TStringField;
    qSedesOperativasACTIVO: TStringField;
    qSedesOperativasCODIGOTIPOSEDE: TFloatField;
    qSedesOperativasCOLOR: TFloatField;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    qDiaLCODIGODIAL: TFloatField;
    qDiaLNOMBREDIAL: TStringField;
    qDiaLCOLOR: TFloatField;
    Label4: TLabel;
    procedure meFechaLecturaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    bPuedoCerrar: Boolean;
    function EsFechaValida(sFecha: string): Boolean;
  public
    { Public declarations }
  end;

var
  fExpoItinerarios: TfExpoItinerarios;

implementation

{$R *.DFM}

function TfExpoItinerarios.EsFechaValida(sFecha: string): Boolean;
var
  dtFecha: TDateTime;
begin
  result:= True;
  try
    dtFecha:=StrToDate(sFecha);
  except
    result:= False;
  end;
end;

procedure TfExpoItinerarios.meFechaLecturaExit(Sender: TObject);
begin
  if not EsFechaValida(meFechaLectura.Text) then
  begin
    Application.MessageBox('Formato de fecha incorrecto','Atención',MB_OK+MB_ICONERROR);
    meFechaLectura.SetFocus;
  end;
end;

procedure TfExpoItinerarios.FormShow(Sender: TObject);
var
  qry:TQuery;
begin
  RefrescarVariables;
  qSedesOperativas.Open;
  if (VarCodigoUsuario <> 0) then
  begin
    qry:= TQuery.Create(nil);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Add('SELECT CGT.CODIGOSEDEOPERATIVA');
    qry.SQL.Add('FROM COORDINACIONGRUPOTRABAJO CGT, USUARIO U');
    qry.SQL.Add('WHERE CGT.CODIGOUSUARIO = U.CODIGOUSUARIO');
    qry.SQL.Add('AND CGT.ACTIVO = ''S'' ');
    qry.SQL.Add('AND CGT.CODIGOUSUARIO = :CODUSU');
    qry.ParamByName('CODUSU').AsInteger := VarCodigoUsuario;
    qry.Open;
    if not qry.isEmpty then
      DBLookupComboBox1.KeyValue:= qry.Fields[0].AsInteger;
    qry.Close;
    qry.Free;
  end;
  qDiaL.Open;
end;

procedure TfExpoItinerarios.BitBtn1Click(Sender: TObject);
begin
  bPuedoCerrar:= True;
  if DBLookupComboBox1.KeyValue = Null then
  begin
    Application.MessageBox('Debe seleccionar una Sede Operativa','Atención',MB_OK+MB_ICONERROR);
    bPuedoCerrar := False;
  end;

  if not EsFechaValida(meFechaLectura.Text) then
  begin
    Application.MessageBox('Formato de fecha incorrecto','Atención',MB_OK+MB_ICONERROR);
    bPuedoCerrar := False;
  end;

  if DBLookupComboBox2.KeyValue = Null then
  begin
    Application.MessageBox('Debe seleccionar un DiaL','Atención',MB_OK+MB_ICONERROR);
    bPuedoCerrar := False;
  end;
end;

procedure TfExpoItinerarios.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if not bPuedoCerrar then
    CanClose:= False;
end;

procedure TfExpoItinerarios.FormCreate(Sender: TObject);
begin
  bPuedoCerrar:= True;
end;

procedure TfExpoItinerarios.BitBtn2Click(Sender: TObject);
begin
  bPuedoCerrar:= True;
end;

end.
