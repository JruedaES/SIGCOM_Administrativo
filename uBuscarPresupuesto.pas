unit uBuscarPresupuesto;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

const bMensaje : boolean = False;

type
  TfBuscarPresupuesto = class(TForm)
    TextoBuscado: TEdit;
    OrderCombo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    dsPresupuesto: TDataSource;
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
  fBuscarPresupuesto: TfBuscarPresupuesto;

implementation



{$R *.DFM}

procedure TfBuscarPresupuesto.Entrar;
begin
  OrderCombo.Items.Clear;
  OrderCombo.Items.Add('CodigoPresupuesto');
  OrderCombo.Items.Add('NombreEstadoPresupuesto');
  OrderCombo.Items.Add('Objeto');
  OrderCombo.ItemIndex := 0;
  TextoBuscado.Text := '';
  {Llamar al procedimiento OnChange del ComboBox}
//OrderComboChange(CodigoContrato);
end;

procedure TfBuscarPresupuesto.OrderComboChange(Sender: TObject);
begin
  CampoBuscado := dsPresupuesto.Dataset.FieldByName(OrderCombo.Text);
  TextoBuscado.Text := '';
  TextoBuscado.SetFocus;
end;

procedure TfBuscarPresupuesto.TextoBuscadoKeyPress(Sender: TObject; var Key: Char);
begin
  if Assigned(CampoBuscado) and (Key > ' ') and not(CampoBuscado.IsValidChar(Key)) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
end;

procedure TfBuscarPresupuesto.TextoBuscadoChange(Sender: TObject);
begin
  BuscarBtn.Enabled := TextoBuscado.Text <> '';
end;

procedure TfBuscarPresupuesto.BuscarBtnClick(Sender: TObject);
begin
  if TextoBuscado.text='' then exit;
  if not dsPresupuesto.Dataset.Locate(OrderCombo.Text, TextoBuscado.Text,
    [loCaseInsensitive, loPartialKey]) then
      begin
      Application.MessageBox(Pchar('No se encontró el registro.'),
            Pchar('Información'),
            MB_ICONINFORMATION);
      ModalResult:=mrNone;
      end;
end;

procedure TfBuscarPresupuesto.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TfBuscarPresupuesto.FormShow(Sender: TObject);
begin
  Entrar;
end;

procedure TfBuscarPresupuesto.BitBtn1Click(Sender: TObject);
begin
  BuscarBtnClick(Self);
end;

procedure TfBuscarPresupuesto.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_Return  then
     if bMensaje
        then bMensaje := false
        else BuscarBtnClick(self);
end;

end.
