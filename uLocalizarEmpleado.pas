unit uLocalizarEmpleado;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons;

type
  TfLocalizarEmpleado = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    BuscarBtn: TSpeedButton;
    TextoBuscado: TEdit;
    OrderCombo: TComboBox;
    BuscarBitBtn: TBitBtn;
    dsEmpleado: TDataSource;
    procedure OrderComboChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BuscarBtnClick(Sender: TObject);
    procedure TextoBuscadoChange(Sender: TObject);
    procedure TextoBuscadoKeyPress(Sender: TObject; var Key: Char);
    procedure TextoBuscadoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    CampoBuscado: TField;
    NombreCampo : String;
  public
    { Public declarations }
  end;

var
  fLocalizarEmpleado: TfLocalizarEmpleado;

implementation

{$R *.DFM}

procedure TfLocalizarEmpleado.OrderComboChange(Sender: TObject);
begin
  case OrderCombo.ItemIndex of
   -1: NombreCampo:='';
    0: NombreCampo:='CODIGOEMPLEADO';
    1: NombreCampo:='NOMBREEMPLEADO';
    2: NombreCampo:='CODIGOADMINISTRATIVO';
  end;
  CampoBuscado := dsEmpleado.Dataset.FieldByName(NombreCampo);
  TextoBuscado.Text := '';
  TextoBuscado.Setfocus;
end;

procedure TfLocalizarEmpleado.FormCreate(Sender: TObject);
begin
  OrderCombo.Clear;
  OrderCombo.Items.Add('Código Empleado');
  OrderCombo.Items.Add('Nombre Empleado');
  OrderCombo.Items.Add('Código Administrativo');
  OrderCombo.ItemIndex:=0;
end;

procedure TfLocalizarEmpleado.FormShow(Sender: TObject);
begin
  OrderComboChange(nil);
end;

procedure TfLocalizarEmpleado.BuscarBtnClick(Sender: TObject);
begin
  if not dsEmpleado.Dataset.Locate(NombreCampo, TextoBuscado.Text,
    [loCaseInsensitive, loPartialKey]) then
      MessageDlg('No se encontró el registro.', mtInformation, [mbOK], 0);
end;

procedure TfLocalizarEmpleado.TextoBuscadoChange(Sender: TObject);
begin
  BuscarBtn.Enabled := TextoBuscado.Text <> '';
end;

procedure TfLocalizarEmpleado.TextoBuscadoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Assigned(CampoBuscado) and (Key > ' ') and not(CampoBuscado.IsValidChar(Key)) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
end;

procedure TfLocalizarEmpleado.TextoBuscadoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (key = 13) and (Shift = [ssCtrl]) then
     BuscarBtnClick(nil);
end;

end.
