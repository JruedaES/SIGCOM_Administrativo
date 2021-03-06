unit uBuscarOdtHija;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, DBTables, DB, StdCtrls, ExtCtrls, Grids, DBGrids, Buttons;

type
  TFBuscarOdtHija = class(TForm)
    TextoBuscado: TEdit;
    OrderCombo: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    BuscarBtn: TSpeedButton;
    dsOdt: TDataSource;
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
  private
    CampoBuscado: TField;
    NombreCampo : String;
  public
  end;

var
  FBuscarOdtHija: TFBuscarOdtHija;

implementation

uses uFormaFecha;

//uses uListaOdt;


{$R *.DFM}


procedure TFBuscarOdtHija.OrderComboChange(Sender: TObject);
begin
  case OrderCombo.ItemIndex of
   -1: NombreCampo:='';
    0: NombreCampo:='CONSECUTIVO';
  end;

 if not OrderCombo.ItemIndex=1 then
begin
  CampoBuscado := dsOdt.Dataset.FieldByName(NombreCampo);
  TextoBuscado.Text := '';
  if OrderCombo.ItemIndex>4 then
  begin
    TextoBuscado.Width:=140;
  end
  else
  begin
    TextoBuscado.Width:=166;
    TextoBuscado.Setfocus;
  end;
  END;

end;

procedure TFBuscarOdtHija.TextoBuscadoKeyPress(Sender: TObject; var Key: Char);
const CaracteresValidos: array[0..12] of char=('0','1','2','3','4','5','6','7','8','9','/',#13,#8);
begin
  if Assigned(CampoBuscado) and (Key > ' ') and not(CampoBuscado.IsValidChar(Key)) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
end;

procedure TFBuscarOdtHija.FormShow(Sender: TObject);
begin
  OrderComboChange(nil);
end;

procedure TFBuscarOdtHija.FormCreate(Sender: TObject);
begin
  OrderCombo.Clear;
  OrderCombo.Items.Add('Consecutivo');
  OrderCombo.ItemIndex:=0;
    OrderCombo.Items.Add('Requisicion');
  OrderCombo.ItemIndex:=1;
  TextoBuscado.Width:=166;
end;

procedure TFBuscarOdtHija.TextoBuscadoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) and (Shift = [ssCtrl]) then
     BuscarBtnClick(nil);
end;

procedure TFBuscarOdtHija.BuscarBtnClick(Sender: TObject);
VAR
qDatos:TQuery;
begin
  Application.ProcessMessages;

  IF(OrderCombo.ItemIndex=1) THEN
  BEGIN
    qDatos:=TQuery.Create(Application);
      qDatos.DataBaseName  :='BaseDato';

       qDatos.SQL.Text:=   'SELECT CONSECUTIVO from ODTREQUISICION  where CODIGOODT='+dsOdt.DataSet.fieldbyname('CODIGOODT').Asstring+' AND CODIGOREQUISICION='+TextoBuscado.Text+' ';
       qDatos.open;
        NombreCampo := 'CONSECUTIVO';
         if not (qdatos.fieldbyname('CONSECUTIVO').AsString='') then
       begin
         if not dsOdt.Dataset.Locate(NombreCampo,qdatos.fieldbyname('CONSECUTIVO').AsString,
    [loCaseInsensitive, loPartialKey]) then
      MessageDlg('No se encontr? el registro.', mtInformation, [mbOK], 0);
    END
    ELSE
     MessageDlg('No se encontr? el registro.', mtInformation, [mbOK], 0);
  END
  ELSE
  BEGIN
          if not dsOdt.Dataset.Locate(NombreCampo, TextoBuscado.Text,
    [loCaseInsensitive, loPartialKey]) then
      MessageDlg('No se encontr? el registro.', mtInformation, [mbOK], 0);
  END;






  Application.ProcessMessages;
end;

procedure TFBuscarOdtHija.TextoBuscadoChange(Sender: TObject);
begin
  BuscarBtn.Enabled := TextoBuscado.Text <> '';
end;

end.




