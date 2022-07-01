unit uBusquedaResultadoMtto;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TFBusquedaResultadoMtto = class(TForm)
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
  FBusquedaResultadoMtto: TFBusquedaResultadoMtto;

implementation

uses uFormaFecha;

//uses uListaOdt;


{$R *.DFM}


procedure TFBusquedaResultadoMtto.OrderComboChange(Sender: TObject);
begin
  case OrderCombo.ItemIndex of
   -1: NombreCampo:='';
    0: NombreCampo:='CODIGO';
    1: NombreCampo:='FORMATO';
    2: NombreCampo:='MANTENIMIENTO';
    3: NombreCampo:='FECHA';
    4: NombreCampo:='TIPOELEMENTO';
    5: NombreCampo:='ELEMENTO';
    6: NombreCampo:='MEDIDA';
    7: NombreCampo:='VALOR';
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

procedure TFBusquedaResultadoMtto.TextoBuscadoKeyPress(Sender: TObject; var Key: Char);
const CaracteresValidos: array[0..12] of char=('0','1','2','3','4','5','6','7','8','9','/',#13,#8);
begin
  if Assigned(CampoBuscado) and (Key > ' ') and not(CampoBuscado.IsValidChar(Key)) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
end;

procedure TFBusquedaResultadoMtto.sbFechaClick(Sender: TObject);
begin
  sFecha := TextoBuscado.Text;
  Fecha := GetFecha(True);
  if Fecha <> '' then TextoBuscado.Text := Fecha;
  TextoBuscado.Setfocus;
end;

procedure TFBusquedaResultadoMtto.FormShow(Sender: TObject);
begin
  OrderComboChange(nil);
end;

procedure TFBusquedaResultadoMtto.FormCreate(Sender: TObject);
begin

  OrderCombo.Clear;
  OrderCombo.Items.Add('Código');
  OrderCombo.Items.Add('Formato');
  OrderCombo.Items.Add('Mantenimiento');
  OrderCombo.Items.Add('Fecha');
  OrderCombo.Items.Add('Tipo Elemento');
  OrderCombo.Items.Add('Elemento');
  OrderCombo.Items.Add('Medida');
  OrderCombo.Items.Add('Valor');
//  OrderCombo.Items.Add('Coordinación');
//  OrderCombo.Items.Add('Tipo de Elemento');
//  OrderCombo.Items.Add('Elemento');
  OrderCombo.ItemIndex:=0;
end;

procedure TFBusquedaResultadoMtto.TextoBuscadoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) and (Shift = [ssCtrl]) then
     BuscarBtnClick(nil);
end;

procedure TFBusquedaResultadoMtto.BuscarBtnClick(Sender: TObject);
begin
  Application.ProcessMessages;
  if not dsMtto.Dataset.Locate(NombreCampo, TextoBuscado.Text,
    [loCaseInsensitive, loPartialKey]) then
      MessageDlg('No se encontró el registro.', mtInformation, [mbOK], 0);
  Application.ProcessMessages;
end;


procedure TFBusquedaResultadoMtto.TextoBuscadoChange(Sender: TObject);
begin
  BuscarBtn.Enabled := TextoBuscado.Text <> '';
end;

function TFBusquedaResultadoMtto.GetFecha(Tipo: Boolean): String;
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
 