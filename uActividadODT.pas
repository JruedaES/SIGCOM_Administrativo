unit uActividadODT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, ExtCtrls, StdCtrls, Buttons, Db, Mask, DBCtrls, dbTables;

type
  TfActividadODT = class(TFBase)
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    dsActividadODT: TDataSource;
    dbeNivelTension: TDBEdit;
    dbeOpera: TDBEdit;
    dbeActividad: TDBEdit;
    EdCodigoActividad: TEdit;
    procedure bbAceptarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fActividadODT: TfActividadODT;

implementation

{$R *.DFM}

procedure TfActividadODT.bbAceptarClick(Sender: TObject);
var qDatos:TQuery;
    Cadena : string;
begin
  inherited;
  if (EdCodigoActividad.Text <> '') then
  begin
    Cadena := EdCodigoActividad.Text;
    if Length(Cadena) <> 5 then
    begin
      ModalResult := 0;
      MessageDlg('El código digitado para la actividad de la odt es inválido.',mtError,[mbOk],0);
    end;
    dsActividadODT.DataSet.FieldByName('CODIGONIVELTENSION').AsString := Cadena[1];
    dsActividadODT.DataSet.FieldByName('CODIGOODTOPERA').AsString := Copy(Cadena,2,2);
    dsActividadODT.DataSet.FieldByName('CODIGOODTACTIVIDAD').AsString := Copy(Cadena,4,2);
  end;



  if (dbeNivelTension.Text = '') or (dbeOpera.Text = '') or (dbeActividad.Text = '') then
  begin
    ModalResult:=0;
    MessageDlg('El código digitado para la actividad de la odt es inválido.',mtError,[mbOk],0);
  end
  else
  begin
    qDatos:=TQuery.Create(Application);
    try
      qDatos.DatabaseName:='BaseDato';
      qDatos.SQL.Add('SELECT COUNT(*) FROM ODTACTIVIDAD WHERE CODIGONIVELTENSION = ' + dbeNivelTension.Text);
      qDatos.SQL.Add('AND CODIGOODTOPERA = ' + dbeOpera.Text);
      qDatos.SQL.Add('AND CODIGOODTACTIVIDAD = ' + dbeActividad.Text);
      qDatos.Open;
      if qDatos.Fields[0].AsInteger = 0 then
      begin
        ModalResult:=0;
        MessageDlg('El código digitado (' + dbeNivelTension.Text + dbeOpera.Text + dbeActividad.Text +') para la actividad de la odt no existe.' +
                   Chr(13) + 'Por favor verifiquelo', mtError,[mbOk],0);
      end;
    finally
      qDatos.Free;
    end;
  end;
end;

procedure TfActividadODT.FormCreate(Sender: TObject);
var
  defstyle: dWord;
begin
  inherited;
  //Edit solo numerico
  defstyle := GetWindowLong(EdCodigoActividad.Handle, GWL_STYLE);
  SetWindowLong(EdCodigoActividad.Handle, GWL_STYLE, defstyle or ES_NUMBER)
end;

end.
