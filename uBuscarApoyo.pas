unit uBuscarApoyo;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

const bMensaje : boolean = False;

type
  TfBuscarApoyo = class(TForm)
    TextoBuscado: TEdit;
    OrderCombo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    BuscarBtn: TSpeedButton;
    dsApoyo: TDataSource;
    qApoyo: TQuery;
    qApoyoPINTADOAPOYO: TStringField;
    qApoyoCODIGOAPOYO: TFloatField;
    procedure OrderComboChange(Sender: TObject);
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
  fBuscarApoyo: TfBuscarApoyo;

implementation


{$R *.DFM}


procedure TfBuscarApoyo.OrderComboChange(Sender: TObject);
begin
  case OrderCombo.ItemIndex of
   -1: NombreCampo:='';
    0: NombreCampo:='CODIGOAPOYO';
    1: NombreCampo:='CODIGOACTUAL';
  end;
  TextoBuscado.Text := '';
  TextoBuscado.Setfocus;
end;

procedure TfBuscarApoyo.TextoBuscadoChange(Sender: TObject);
begin
  BuscarBtn.Enabled := TextoBuscado.Text <> '';
end;

procedure TfBuscarApoyo.FormShow(Sender: TObject);
begin
  OrderComboChange(nil);
end;

procedure TfBuscarApoyo.FormCreate(Sender: TObject);
begin
  ModalResult:=mrCancel;
  OrderCombo.Clear;
  OrderCombo.Items.Add('Código del Apoyo');
  OrderCombo.Items.Add('Código físico de la luminaria.');
  OrderCombo.ItemIndex:=0;
end;

procedure TfBuscarApoyo.TextoBuscadoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) and (Shift = [ssCtrl]) then
     BuscarBtnClick(nil);
end;

procedure TfBuscarApoyo.BuscarBtnClick(Sender: TObject);
begin
  if TextoBuscado.Text<>'' then
  begin
     qApoyo.close;
     case OrderCombo.ItemIndex of
       0:
       begin
         qApoyo.sql.clear;
         qApoyo.sql.add('SELECT A.PINTADOAPOYO,A.CODIGOAPOYO');
         qApoyo.sql.add('FROM APOYO A');
         qApoyo.sql.add('WHERE A.CODIGOAPOYO='+TextoBuscado.Text);
         qApoyo.Open;
         if qApoyo.RecordCount=0 then
           showmessage('No se encontró el registro.')
         else
           ModalResult:=mrOk;
       end;
       1:
       begin
         qApoyo.sql.clear;
         qApoyo.sql.add('SELECT A.PINTADOAPOYO,A.CODIGOAPOYO,AP.CODIGOACTUAL');
         qApoyo.sql.add('FROM APOYO A,ALUMBRADOPUBLICO AP');
         qApoyo.sql.add('WHERE A.CODIGOAPOYO=AP.CODIGOAPOYO');
         qApoyo.sql.add('AND UPPER(AP.CODIGOACTUAL)='''+TextoBuscado.Text+'''');
         qApoyo.Open;
         if qApoyo.RecordCount=0 then
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

procedure TfBuscarApoyo.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = vk_Return  then
     if bMensaje
        then bMensaje := false
        else BuscarBtnClick(self);
end;

end.
 