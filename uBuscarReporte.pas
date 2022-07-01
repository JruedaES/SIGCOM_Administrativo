unit uBuscarReporte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons, Mask, ToolEdit, RXDBCtrl, DBTables, Digisoft;

type
  TFBuscarReporte = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BuscarBtn: TSpeedButton;
    TextoBuscado: TEdit;
    OrderCombo: TComboBox;
    BuscarBitBtn: TBitBtn;
    dsReporte: TDataSource;
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
  FBuscarReporte: TFBuscarReporte;

implementation

uses uFormaFecha;

{$R *.DFM}

{ TFBuscarReporte }


procedure TFBuscarReporte.OrderComboChange(Sender: TObject);
begin
  case OrderCombo.ItemIndex of
   -1: NombreCampo:='';
    0: NombreCampo:='CODIGOREPORTE';
    1: NombreCampo:='CODIGOADMINISTRATIVO';
    2: NombreCampo:='CIGDANO';
    3: NombreCampo:='FECHAHORA';
    4: NombreCampo:='FECHAHORADICTADO';
    5: NombreCampo:='FECHAHORALLEGADA';
    6: NombreCampo:='FECHAHORAATENCION';
  end;
  CampoBuscado := dsReporte.Dataset.FieldByName(NombreCampo);
    TextoBuscado.Text := '';
  if OrderCombo.ItemIndex>2 then
  begin
    TextoBuscado.Width:=140;
  end
  else
  begin
    TextoBuscado.Width:=166;
    TextoBuscado.Setfocus;
  end;
end;

procedure TFBuscarReporte.TextoBuscadoKeyPress(Sender: TObject;
  var Key: Char);
const CaracteresValidos: array[0..14] of char=('0','1','2','3','4','5','6','7','8','9','/',#13,#8,' ',':');
begin
  if Assigned(CampoBuscado) and (Key > ' ') and not(CampoBuscado.IsValidChar(Key)) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
end;

procedure TFBuscarReporte.FormShow(Sender: TObject);
begin
  OrderComboChange(nil);
end;

procedure TFBuscarReporte.FormCreate(Sender: TObject);
begin
  OrderCombo.Clear;
  OrderCombo.Items.Add('Código del Reporte');
  OrderCombo.Items.Add('Código de la Dependencia');
  OrderCombo.Items.Add('Código geográfico del daño');
  OrderCombo.Items.Add('Fecha de Registro');
  OrderCombo.Items.Add('Fecha de Dictado');
  OrderCombo.Items.Add('Fecha de Llegada');
  OrderCombo.Items.Add('Fecha de Atención');
  OrderCombo.ItemIndex:=0;
end;

procedure TFBuscarReporte.TextoBuscadoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) and (Shift = [ssCtrl]) then
     BuscarBtnClick(nil);
end;

procedure TFBuscarReporte.BuscarBtnClick(Sender: TObject);
begin
  Application.ProcessMessages;
  if not dsReporte.Dataset.Locate(NombreCampo, TextoBuscado.Text,
    [loCaseInsensitive, loPartialKey]) then
      MessageDlg('No se encontró el registro.', mtInformation, [mbOK], 0);
  Application.ProcessMessages;      
end;

procedure TFBuscarReporte.TextoBuscadoChange(Sender: TObject);
begin
  BuscarBtn.Enabled := TextoBuscado.Text <> '';
end;


procedure TFBuscarReporte.sbFechaClick(Sender: TObject);
begin
  sFecha := TextoBuscado.Text;
  Fecha := GetFecha(True);
  if Fecha <> '' then TextoBuscado.Text := Fecha;
  TextoBuscado.Setfocus;
end;


function TFBuscarReporte.GetFecha(Tipo: Boolean): String;
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
