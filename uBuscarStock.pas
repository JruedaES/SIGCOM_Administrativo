unit uBuscarStock;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, Buttons;

type
  TfBuscarStock = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btnBuscar: TSpeedButton;
    eTextoBuscado: TEdit;
    cmbCriterios: TComboBox;
    bitBuscar: TBitBtn;
    dsStock: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure cmbCriteriosChange(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure eTextoBuscadoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eTextoBuscadoChange(Sender: TObject);
  private
    { Private declarations }
    NombreCampo: String;
    CampoBuscado: TField;
  public
    { Public declarations }
  end;

var
  fBuscarStock: TfBuscarStock;

implementation

{$R *.DFM}

procedure TfBuscarStock.FormCreate(Sender: TObject);
begin
  cmbCriterios.Clear;
  cmbCriterios.Items.Add('Código de la dependencia');
  cmbCriterios.Items.Add('Código del grupo');
  cmbCriterios.Items.Add('Nombre del grupo');
  cmbCriterios.Items.Add('Horario del grupo');
  cmbCriterios.ItemIndex := 0;
  NombreCampo := 'CODIGOADMINISTRATIVO';
end;

procedure TfBuscarStock.cmbCriteriosChange(Sender: TObject);
begin
  case cmbCriterios.ItemIndex of
    0: NombreCampo := 'CODIGOADMINISTRATIVO';
    1: NombreCampo := 'CODIGOGRUPOTRABAJO';
    2: NombreCampo := 'NOMBREGRUPOTRABAJO';
    3: NombreCampo := 'NOMBREHORARIOTRABAJO';
  end;
  CampoBuscado := dsStock.Dataset.FieldByName(NombreCampo);
  eTextoBuscado.Text := '';
end;

procedure TfBuscarStock.btnBuscarClick(Sender: TObject);
begin
  Application.ProcessMessages;
  if not dsStock.Dataset.Locate(NombreCampo, eTextoBuscado.Text, [loCaseInsensitive, loPartialKey]) then
    MessageDlg('No se encontró el registro.', mtWarning, [mbOK], 0);
  Application.ProcessMessages;
end;

procedure TfBuscarStock.eTextoBuscadoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key = 13) and (Shift = [ssCtrl]) then
    btnBuscarClick(nil);
end;

procedure TfBuscarStock.eTextoBuscadoChange(Sender: TObject);
begin
  btnBuscar.Enabled := eTextoBuscado.Text <> '';
end;

end.
