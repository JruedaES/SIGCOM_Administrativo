unit uBuscarClientes;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

const bMensaje : boolean = False;

type
  TfBuscarClientes = class(TForm)
    TextoBuscado: TEdit;
    OrderCombo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    BuscarBtn: TSpeedButton;
    dsClientes: TDataSource;
    qClientes: TQuery;
    qClientesCODIGOCLIENTESGD: TFloatField;
    qClientesCODIGOCUENTA: TFloatField;
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
  fBuscarClientes: TfBuscarClientes;

implementation




{$R *.DFM}


procedure TfBuscarClientes.OrderComboChange(Sender: TObject);
begin
  case OrderCombo.ItemIndex of
   -1: NombreCampo:='';
    0: NombreCampo:='CODIGOCLIENTESGD';
    1: NombreCampo:='CODIGOCLIENTECOM';
  end;
  CampoBuscado := dsClientes.Dataset.FieldByName(NombreCampo);
  TextoBuscado.Text := '';
  TextoBuscado.Setfocus;
end;

procedure TfBuscarClientes.TextoBuscadoKeyPress(Sender: TObject; var Key: Char);
begin
  if Assigned(CampoBuscado) and (Key > ' ') and not(CampoBuscado.IsValidChar(Key)) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
end;

procedure TfBuscarClientes.TextoBuscadoChange(Sender: TObject);
begin
  BuscarBtn.Enabled := TextoBuscado.Text <> '';
end;

procedure TfBuscarClientes.FormShow(Sender: TObject);
begin
  OrderComboChange(nil);
end;

procedure TfBuscarClientes.FormCreate(Sender: TObject);
begin
  OrderCombo.Clear;
  OrderCombo.Items.Add('Código del Cliente SGD');
  OrderCombo.Items.Add('Código del Cliente SGC');
  OrderCombo.ItemIndex:=0;
end;

procedure TfBuscarClientes.TextoBuscadoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) and (Shift = [ssCtrl]) then
     BuscarBtnClick(nil);
end;

procedure TfBuscarClientes.BuscarBtnClick(Sender: TObject);
begin
  if TextoBuscado.Text<>'' then
  begin
     qClientes.close;
     case OrderCombo.ItemIndex of
       0:
       begin
         qClientes.sql.clear;
         qClientes.sql.add('SELECT A.CODIGOCLIENTESGD, A.CODIGOCUENTA');
         qClientes.sql.add('FROM CLIENTESGD A');
         qClientes.sql.add('WHERE A.CODIGOCLIENTESGD='+TextoBuscado.Text);
         qClientes.Open;
         if qClientes.RecordCount=0 then
           showmessage('No se encontró el registro.')
         else
           ModalResult:=mrOk;
       end;
       1:
       begin
         qClientes.sql.clear;
         qClientes.sql.add('SELECT CODIGOCLIENTESGD, CODIGOCUENTA');
         qClientes.sql.add('FROM CLIENTESGD A');
         qClientes.sql.add('WHERE A.CODIGOCUENTA ='''+TextoBuscado.Text+'''');
         qClientes.Open;
         if qClientes.RecordCount=0 then
           showmessage('No se encontró el registro.')
         else
           ModalResult:=mrOk;
       end;
       else
         close;
     end;

  end
  else close;



end;

procedure TfBuscarClientes.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_Return  then
     if bMensaje
        then bMensaje := false
        else BuscarBtnClick(self);
end;

end.
 