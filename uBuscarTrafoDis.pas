unit uBuscarTrafoDis;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

const bMensaje : boolean = False;

type
  TfBuscarTrafoDis = class(TForm)
    TextoBuscado: TEdit;
    OrderCombo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    BuscarBtn: TSpeedButton;
    dsTrafoDis: TDataSource;
    qTrafodis: TQuery;
    qTrafodisPINTADOTRAFODIS: TStringField;
    qTrafodisCODIGOTRAFODIS: TFloatField;
    qTrafodisCODIGOAPOYO1: TFloatField;
    qTrafodisCODIGOAPOYO2: TFloatField;
    qTrafodisIDELEMENTOSERIE: TFloatField;
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
  fBuscarTrafoDis: TfBuscarTrafoDis;

implementation


{$R *.DFM}


procedure TfBuscarTrafoDis.OrderComboChange(Sender: TObject);
begin
  case OrderCombo.ItemIndex of
   -1: NombreCampo:='';
    0: NombreCampo:='CODIGOTRAFODIS';
    1: NombreCampo:='CODIGOAPOYO1';
    2: NombreCampo:='CODIGOAPOYO2';
  end;
  CampoBuscado := dsTrafoDis.Dataset.FieldByName(NombreCampo);
  TextoBuscado.Text := '';
  TextoBuscado.Setfocus;
end;

procedure TfBuscarTrafoDis.TextoBuscadoKeyPress(Sender: TObject; var Key: Char);
begin
  if Assigned(CampoBuscado) and (Key > ' ') and not(CampoBuscado.IsValidChar(Key)) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
end;

procedure TfBuscarTrafoDis.TextoBuscadoChange(Sender: TObject);
begin
  BuscarBtn.Enabled := TextoBuscado.Text <> '';
end;

procedure TfBuscarTrafoDis.FormShow(Sender: TObject);
begin
  OrderComboChange(nil);
end;

procedure TfBuscarTrafoDis.FormCreate(Sender: TObject);
begin
  OrderCombo.Clear;
  OrderCombo.Items.Add('Código del Punto MT/BT');
  OrderCombo.Items.Add('Código del Apoyo Origen');
  OrderCombo.Items.Add('Código del Apoyo Destino');
  OrderCombo.ItemIndex:=0;
end;

procedure TfBuscarTrafoDis.TextoBuscadoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) and (Shift = [ssCtrl]) then
     BuscarBtnClick(nil);
end;

procedure TfBuscarTrafoDis.BuscarBtnClick(Sender: TObject);
begin
  if TextoBuscado.Text<>'' then
  begin
     qTrafodis.close;
     case OrderCombo.ItemIndex of
       0:
       begin
         qTrafodis.sql.clear;
         qTrafodis.sql.add('SELECT T.PINTADOTRAFODIS,T.CODIGOTRAFODIS,T.CODIGOAPOYO1,T.CODIGOAPOYO2,T.IDELEMENTOSERIE');
         qTrafodis.sql.add('FROM TRAFODIS T');
         qTrafodis.sql.add('WHERE T.CODIGOTRAFODIS='+TextoBuscado.Text);
         qTrafodis.sql.add('AND PINTADOTRAFODIS IS NOT NULL');
         qTrafodis.sql.add('AND PINTADOTRAFODIS<>''7777777''');
         qTrafodis.Open;
         if qTrafodis.RecordCount=0 then
           showmessage('No se encontró el registro, ó el registro no tiene un pintado válido único')
         else
           ModalResult:=mrOk;
       end;
       1:
       begin
         qTrafodis.sql.clear;
         qTrafodis.sql.add('SELECT T.PINTADOTRAFODIS,T.CODIGOTRAFODIS,T.CODIGOAPOYO1,T.CODIGOAPOYO2,T.IDELEMENTOSERIE');
         qTrafodis.sql.add('FROM TRAFODIS T');
         qTrafodis.sql.add('WHERE T.CODIGOAPOYO1='+TextoBuscado.Text);
         qTrafodis.sql.add('AND PINTADOTRAFODIS IS NOT NULL');
         qTrafodis.sql.add('AND PINTADOTRAFODIS<>''7777777''');
         qTrafodis.Open;
         if qTrafodis.RecordCount<>1 then
           showmessage('No se encontró el registro, ó el registro no tiene un pintado válido único')
         else
           ModalResult:=mrOk;
       end;
       2:
       begin
         qTrafodis.sql.clear;
         qTrafodis.sql.add('SELECT T.PINTADOTRAFODIS,T.CODIGOTRAFODIS,T.CODIGOAPOYO1,T.CODIGOAPOYO2,T.IDELEMENTOSERIE');
         qTrafodis.sql.add('FROM TRAFODIS T');
         qTrafodis.sql.add('WHERE T.CODIGOAPOYO2='+TextoBuscado.Text);
         qTrafodis.sql.add('AND PINTADOTRAFODIS IS NOT NULL');
         qTrafodis.sql.add('AND PINTADOTRAFODIS<>''7777777''');
         qTrafodis.Open;
         if qTrafodis.RecordCount<>1 then
           showmessage('No se encontró el registro, ó el registro no tiene un pintado válido único')
         else
           ModalResult:=mrOk;
       end;
       else
         close;
     end;

  end
  else close;

end;

procedure TfBuscarTrafoDis.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_Return  then
     if bMensaje
        then bMensaje := false
        else BuscarBtnClick(self);
end;

end.
 