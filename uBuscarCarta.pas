unit uBuscarCarta;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TFBuscarCarta = class(TForm)
    TextoBuscado: TEdit;
    OrderCombo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    BuscarBtn: TSpeedButton;
    dsCARTA: TDataSource;
    BuscarBitBtn: TBitBtn;
    procedure OrderComboChange(Sender: TObject);
    procedure TextoBuscadoKeyPress(Sender: TObject; var Key: Char);
    procedure TextoBuscadoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TextoBuscadoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscarBtnClick(Sender: TObject);
  private
    CampoBuscado: TField;
    NombreCampo : String;
  public
    {  public  }
  end;

var
  FBuscarCarta: TFBuscarCarta;

implementation

uses uListaCarta;


{$R *.DFM}


procedure TFBuscarCarta.OrderComboChange(Sender: TObject);
begin
  case OrderCombo.ItemIndex of
   -1: NombreCampo:='';
    0: NombreCampo:='CODIGOCARTA';
    1: NombreCampo:='NUMERORADICACIONRECEPCION';
    2: NombreCampo:='NUMERORADICACIONRESPUESTA';
    3: NombreCampo:='CODIGOARCHIVO';
  end;
  CampoBuscado := dsCARTA.Dataset.FieldByName(NombreCampo);
  TextoBuscado.Text := '';
  TextoBuscado.Setfocus;
end;

procedure TFBuscarCarta.TextoBuscadoKeyPress(Sender: TObject; var Key: Char);
begin
  if Assigned(CampoBuscado) and (Key > ' ') and not(CampoBuscado.IsValidChar(Key)) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
end;

procedure TFBuscarCarta.TextoBuscadoChange(Sender: TObject);
begin
  BuscarBtn.Enabled := TextoBuscado.Text <> '';
end;

procedure TFBuscarCarta.FormShow(Sender: TObject);
begin
  OrderComboChange(nil);
end;

procedure TFBuscarCarta.FormCreate(Sender: TObject);
begin
  OrderCombo.Clear;
  OrderCombo.Items.Add('Código Carta');
  OrderCombo.Items.Add('Radicación Recepción');
  OrderCombo.Items.Add('Radicación Respuesta');
  OrderCombo.Items.Add('Código Archivo');
  OrderCombo.ItemIndex:=0;
end;

procedure TFBuscarCarta.TextoBuscadoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) and (Shift = [ssCtrl]) then
     BuscarBtnClick(nil);
end;

procedure TFBuscarCarta.BuscarBtnClick(Sender: TObject);
begin
  if not dsCARTA.Dataset.Locate(NombreCampo, TextoBuscado.Text,
    [loCaseInsensitive, loPartialKey]) then
      MessageDlg('No se encontró el registro.', mtInformation, [mbOK], 0);
end;

end.
