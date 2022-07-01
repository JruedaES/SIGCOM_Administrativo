unit uBusquedaMtto;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TFBusquedaMtto = class(TForm)
    TextoBuscado: TEdit;
    OrderCombo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    BuscarBtn: TSpeedButton;
    dsMtto: TDataSource;
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
  FBusquedaMtto: TFBusquedaMtto;

implementation

uses uFormaFecha;

//uses uListaOdt;


{$R *.DFM}


procedure TFBusquedaMtto.OrderComboChange(Sender: TObject);
begin
  case OrderCombo.ItemIndex of
   -1: NombreCampo:='';
    0: NombreCampo:='CODIGOMANTENIMIENTO';
    1: NombreCampo:='NOMBRETAREA';
    2: NombreCampo:='NOMBREMANT';
    3: NombreCampo:='FECHAINICIAL';
    4: NombreCampo:='FECHAFINAL';
    5: NombreCampo:='NOMBREESTADO';
    6: NombreCampo:='TENSION';
    7: NombreCampo:='NOMBRESUBESTACION';
//   3: NombreCampo:='NOMBREAREAOPERACIONODT';
//  7: NombreCampo:='NOMBRETIPOELEMENTO';
//   10: NombreCampo:='elemento';
  end;
  CampoBuscado := dsMtto.Dataset.FieldByName(NombreCampo);
  TextoBuscado.Text := '';
  if ((OrderCombo.ItemIndex>2) AND (OrderCombo.ItemIndex <5)) then
//  if OrderCombo.ItemIndex>4 then
  begin
    TextoBuscado.Width:=140;
  end
  else
  begin
    TextoBuscado.Width:=166;
    TextoBuscado.Setfocus;
  end;
end;

procedure TFBusquedaMtto.TextoBuscadoKeyPress(Sender: TObject; var Key: Char);
const CaracteresValidos: array[0..12] of char=('0','1','2','3','4','5','6','7','8','9','/',#13,#8);
begin
  if Assigned(CampoBuscado) and (Key > ' ') and not(CampoBuscado.IsValidChar(Key)) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
end;

procedure TFBusquedaMtto.sbFechaClick(Sender: TObject);
begin
  sFecha := TextoBuscado.Text;
  Fecha := GetFecha(True);
  if Fecha <> '' then TextoBuscado.Text := Fecha;
  TextoBuscado.Setfocus;
end;

procedure TFBusquedaMtto.FormShow(Sender: TObject);
begin
  OrderComboChange(nil);
end;

procedure TFBusquedaMtto.FormCreate(Sender: TObject);
begin
  OrderCombo.Clear;
  OrderCombo.Items.Add('Código de Mantenimiento');
  OrderCombo.Items.Add('Nombre de Mantenimiento');
  OrderCombo.Items.Add('Tipo de Mantenimiento');
  OrderCombo.Items.Add('Fecha Inicial de Mtto');
  OrderCombo.Items.Add('Fecha Final de Mtto');
  OrderCombo.Items.Add('Estado de Mantenimiento');
  OrderCombo.Items.Add('Tensión');
  OrderCombo.Items.Add('Subestación');
//  OrderCombo.Items.Add('Coordinación');
//  OrderCombo.Items.Add('Tipo de Elemento');
//  OrderCombo.Items.Add('Elemento');
  OrderCombo.ItemIndex:=0;
end;

procedure TFBusquedaMtto.TextoBuscadoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) and (Shift = [ssCtrl]) then
     BuscarBtnClick(nil);
end;

procedure TFBusquedaMtto.BuscarBtnClick(Sender: TObject);
begin
  Application.ProcessMessages;
  if not dsMtto.Dataset.Locate(NombreCampo, TextoBuscado.Text,
    [loCaseInsensitive, loPartialKey]) then
      MessageDlg('No se encontró el registro.', mtInformation, [mbOK], 0);
  Application.ProcessMessages;
end;


procedure TFBusquedaMtto.TextoBuscadoChange(Sender: TObject);
begin
  BuscarBtn.Enabled := TextoBuscado.Text <> '';
end;

function TFBusquedaMtto.GetFecha(Tipo: Boolean): String;
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
 