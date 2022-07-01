unit uInformacionOdtHija;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,Dbtables, Db, Mask, DBCtrls;

type
  TfInformacionOdtHija = class(TForm)
    qOdt: TQuery;
    dsOdt: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit2: TDBEdit;
    DBMemo1: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
  public
    codigoodt:double;
    consecutivo:integer;
    Constructor CreateByParametros(AOwner: TComponent; aCodigoOdt : double;aConsecutivo:integer);    
  end;

var
  fInformacionOdtHija: TfInformacionOdtHija;

implementation

uses uODTUrbanaRural, uListaStock;

{$R *.DFM}

constructor TfInformacionOdtHija.CreateByParametros(AOwner: TComponent;
  aCodigoOdt: double; aConsecutivo: integer);
begin
  codigoodt:=aCodigoOdt;
  consecutivo:=aConsecutivo;
  inherited create(AOwner);
end;

procedure TfInformacionOdtHija.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
  inherited;
  try
    if Assigned(Application.FindComponent('FOdtUrbanaRural') as TForm) then
    begin
      if FOdtUrbanaRural.BanderaStock=true then
        FOdtUrbanaRural.ActualizarStock;
      FOdtUrbanaRural.Visible := True;
      FOdtUrbanaRural.WindowState := wsNormal;
    end;
  except
    on e:exception do
    begin
      showmessage(e.message);
    end;
  end;
  Application.ProcessMessages;
end;

procedure TfInformacionOdtHija.FormShow(Sender: TObject);
begin
  qOdt.close;
  qodt.ParamByName('codigoodt').AsFloat:=codigoodt;
  qOdt.ParamByName('consecutivo').AsInteger:=consecutivo;
  qOdt.open;
  inherited;
end;

end.
