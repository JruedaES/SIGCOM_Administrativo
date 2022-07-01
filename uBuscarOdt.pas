unit uBuscarOdt;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TFBuscarOdt = class(TForm)
    TextoBuscado: TEdit;
    OrderCombo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    BuscarBtn: TSpeedButton;
    dsOdt: TDataSource;
    BuscarBitBtn: TBitBtn;
    sbFecha: TSpeedButton;
    procedure OrderComboChange(Sender: TObject);
    procedure TextoBuscadoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TextoBuscadoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscarBtnClick(Sender: TObject);
    procedure TextoBuscadoChange(Sender: TObject);
    procedure sbFechaClick(Sender: TObject);
  private
    CampoBuscado: TField;
    NombreCampo : String;
  public
    sFecha, Fecha:string;
    function GetFecha(Tipo:Boolean): String;    
  end;

var
  FBuscarOdt: TFBuscarOdt;

implementation

uses uFormaFecha;

//uses uListaOdt;


{$R *.DFM}


procedure TFBuscarOdt.OrderComboChange(Sender: TObject);
begin
  case OrderCombo.ItemIndex of
   -1: NombreCampo:='';
    0: NombreCampo:='CODIGOODT';
    1: NombreCampo:='CODIGOADMINISTRATIVO';
    2: NombreCampo:='CODIGOAPROBADO';
    3: NombreCampo:='CODIGOEJECUTOR';
    4: NombreCampo:='CODIGOREVISADO';
    5: NombreCampo:='FECHAEMISION';
    6: NombreCampo:='FECHAAPROBACION';
    7: NombreCampo:='FECHAASIGNACION';
  end;
  CampoBuscado := dsOdt.Dataset.FieldByName(NombreCampo);
  TextoBuscado.Text := '';
  if OrderCombo.ItemIndex>4 then
  begin
    TextoBuscado.Width:=140;
  end
  else
  begin
    TextoBuscado.Width:=166;
    TextoBuscado.Setfocus;
  end;
end;

procedure TFBuscarOdt.TextoBuscadoKeyPress(Sender: TObject; var Key: Char);
const CaracteresValidos: array[0..12] of char=('0','1','2','3','4','5','6','7','8','9','/',#13,#8);
begin
  if Assigned(CampoBuscado) and (Key > ' ') and not(CampoBuscado.IsValidChar(Key)) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
end;

procedure TFBuscarOdt.sbFechaClick(Sender: TObject);
begin
  sFecha := TextoBuscado.Text;
  Fecha := GetFecha(True);
  if Fecha <> '' then TextoBuscado.Text := Fecha;
  TextoBuscado.Setfocus;
end;

procedure TFBuscarOdt.FormShow(Sender: TObject);
begin
  OrderComboChange(nil);
end;

procedure TFBuscarOdt.FormCreate(Sender: TObject);
begin
  OrderCombo.Clear;
  OrderCombo.Items.Add('Código de la ODT');
  OrderCombo.Items.Add('Código de la Dependencia');
  OrderCombo.Items.Add('Aprobado por');
  OrderCombo.Items.Add('Ejecutado por');
  OrderCombo.Items.Add('Revisado por');
  OrderCombo.Items.Add('Fecha de Emisión');
  OrderCombo.Items.Add('Fecha de Aprobación');
  OrderCombo.Items.Add('Fecha de Asignación');
  OrderCombo.ItemIndex:=0;
  TextoBuscado.Width:=166;
end;

procedure TFBuscarOdt.TextoBuscadoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) and (Shift = [ssCtrl]) then
     BuscarBtnClick(nil);
end;

procedure TFBuscarOdt.BuscarBtnClick(Sender: TObject);
begin
  Application.ProcessMessages;
  if not dsOdt.Dataset.Locate(NombreCampo, TextoBuscado.Text,
    [loCaseInsensitive, loPartialKey]) then
      MessageDlg('No se encontró el registro.', mtInformation, [mbOK], 0);
  Application.ProcessMessages;
end;


procedure TFBuscarOdt.TextoBuscadoChange(Sender: TObject);
begin
  BuscarBtn.Enabled := TextoBuscado.Text <> '';
end;

function TFBuscarOdt.GetFecha(Tipo: Boolean): String;
begin
  fFormaFecha := TfFormaFecha.Create(Application);
  uFormaFecha.sFecha := sFecha;
  fFormaFecha.height:=291;
  if FFormaFecha.ShowModal = mrOk then
    if Tipo then
       Result := DateTimetoStr(FFormaFecha.Date+FFormaFecha.fTime)
    else
       Result := DateTimetoStr(FFormaFecha.Date)
  else Result := sFecha;
  fFormaFecha.Free;
end;


end.
 