unit uBuscaModificacion;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

const bMensaje : boolean = False;

type
  TfBuscaModificacion = class(TForm)
    TextoBuscado: TEdit;
    OrderCombo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    BuscarBtn: TSpeedButton;
    dsqModificacion: TDataSource;
    procedure OrderComboChange(Sender: TObject);
    procedure TextoBuscadoKeyPress(Sender: TObject; var Key: Char);
    procedure TextoBuscadoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TextoBuscadoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BuscarBtnClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    CampoBuscado: TField;
    NombreCampo : String;
  public
    {  public  }
  end;

var
  fBuscaModificacion: TfBuscaModificacion;

implementation



{$R *.DFM}


procedure TfBuscaModificacion.OrderComboChange(Sender: TObject);
begin
  case OrderCombo.ItemIndex of
   -1: NombreCampo:='';
    0: NombreCampo:='CODIGOMODIFICACION';
    1: NombreCampo:='CODIGODIGITO';
    2: NombreCampo:='REFERENCIA'
  end;
  CampoBuscado := dsqModificacion.Dataset.FieldByName(NombreCampo);
  TextoBuscado.Text := '';
  TextoBuscado.Setfocus;
end;

procedure TfBuscaModificacion.TextoBuscadoKeyPress(Sender: TObject; var Key: Char);
begin
  if Assigned(CampoBuscado) and (Key > ' ') and not(CampoBuscado.IsValidChar(Key)) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
end;

procedure TfBuscaModificacion.TextoBuscadoChange(Sender: TObject);
begin
  BuscarBtn.Enabled := TextoBuscado.Text <> '';
end;

procedure TfBuscaModificacion.FormShow(Sender: TObject);
begin
  OrderComboChange(nil);
end;

procedure TfBuscaModificacion.FormCreate(Sender: TObject);
begin
  OrderCombo.Clear;
  OrderCombo.Items.Add('Código de Modificacion');
  OrderCombo.Items.Add('Cédula Diligenció');
  OrderCombo.Items.Add('Código de ODT');
  OrderCombo.ItemIndex:=0;
end;

procedure TfBuscaModificacion.TextoBuscadoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) and (Shift = [ssCtrl]) then
     BuscarBtnClick(nil);
end;

procedure TfBuscaModificacion.BuscarBtnClick(Sender: TObject);
begin
  if TextoBuscado.Text<>'' then
  if not dsqModificacion.Dataset.Locate(NombreCampo, TextoBuscado.Text,[loCaseInsensitive, loPartialKey]) then
     begin
     if MessageDlg('No se encontró el registro.', mtInformation, [mbOK], 0)= mrOk then
        bMensaje := true;
     end
  else close;
end;

procedure TfBuscaModificacion.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_Return  then
     if bMensaje
        then bMensaje := false
        else BuscarBtnClick(self);
end;

end.
