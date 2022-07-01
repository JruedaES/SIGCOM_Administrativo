unit uBuscarContrato;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

const bMensaje : boolean = False;

type
  TfBuscarContrato = class(TForm)
    TextoBuscado: TEdit;
    OrderCombo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    dsContrato: TDataSource;
    BuscarBtn: TBitBtn;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BuscarBtnClick(Sender: TObject);
    procedure OrderComboChange(Sender: TObject);
    procedure TextoBuscadoKeyPress(Sender: TObject; var Key: Char);
    procedure TextoBuscadoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    CampoBuscado: TField;
  public
    procedure Entrar;
  end;

var
  fBuscarContrato: TfBuscarContrato;

implementation



{$R *.DFM}

procedure TfBuscarContrato.Entrar;
begin
  OrderCombo.Items.Clear;
  OrderCombo.Items.Add('CodigoContrato');
  OrderCombo.Items.Add('NombreEstadoContrato');
  OrderCombo.Items.Add('Objeto');
  OrderCombo.ItemIndex := 0;
  TextoBuscado.Text := '';
  {Llamar al procedimiento OnChange del ComboBox}
//OrderComboChange(CodigoContrato);
end;

procedure TfBuscarContrato.OrderComboChange(Sender: TObject);
begin
  CampoBuscado := dsContrato.Dataset.FieldByName(OrderCombo.Text);
  TextoBuscado.Text := '';
  TextoBuscado.SetFocus;
end;

procedure TfBuscarContrato.TextoBuscadoKeyPress(Sender: TObject; var Key: Char);
begin
  if Assigned(CampoBuscado) and (Key > ' ') and not(CampoBuscado.IsValidChar(Key)) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
end;

procedure TfBuscarContrato.TextoBuscadoChange(Sender: TObject);
begin
  BuscarBtn.Enabled := TextoBuscado.Text <> '';
end;

procedure TfBuscarContrato.BuscarBtnClick(Sender: TObject);
begin
  if TextoBuscado.text='' then exit;
  if not dsContrato.Dataset.Locate(OrderCombo.Text, TextoBuscado.Text,
    [loCaseInsensitive, loPartialKey]) then
      begin
      Application.MessageBox(Pchar('No se encontró el registro.'),
            Pchar('Información'),
            MB_ICONINFORMATION);
      ModalResult:=mrNone;
      end;
end;

procedure TfBuscarContrato.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfBuscarContrato.FormShow(Sender: TObject);
begin
  Entrar;
end;

procedure TfBuscarContrato.BitBtn1Click(Sender: TObject);
begin
  BuscarBtnClick(Self);
end;

procedure TfBuscarContrato.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_Return  then
     if bMensaje
        then bMensaje := false
        else BuscarBtnClick(self);
end;

end.
