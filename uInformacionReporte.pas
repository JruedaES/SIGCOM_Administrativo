unit uInformacionReporte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, Mask, DBCtrls, AppEvent;
  
type
 TDockSide   = ( dsNone, dsLeft, dsRight, dsTop, dsBottom );

type
  TfInformacionReporte = class(TForm)
    Label10: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dsInformacion: TDataSource;
    dbeNodoFisico: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    DBEdit3: TDBEdit;
    AppEvents1: TAppEvents;
    Label2: TLabel;
    DBEdit4: TDBEdit;
    Label3: TLabel;
    DBEdit5: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AppEvents1Idle(Sender: TObject; var Done: Boolean);
  private
    { Private declarations }
    FDockSide: TDockSide;
  public
    { Public declarations }
    LeftClientB,TopClientB: integer;
    LeftClientR,TopClientR: integer;
    LeftClientT,TopClientT: integer;
    LeftClientL,TopClientL: integer;
    procedure Enviar(xx,aForm: TForm);
    property DockSide: TDockSide read FDockSide write FDockSide;
  end;

var
  fInformacionReporte: TfInformacionReporte;

implementation

uses uReporte, uInfoElectricoCliente, uArbolInterruptores;

{$R *.DFM}

procedure TfInformacionReporte.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fReporte.Show; 
  Action:=caFree;
end;

procedure TfInformacionReporte.Enviar(xx,aForm: TForm);
var   d,l,t: integer;
begin
try
 if Assigned(Application.FindComponent(aForm.Name) as TForm) and (aForm.Visible = True) then
 begin
    d:=50;
    l:=aForm.left;
    t:=aForm.top;
    if      (abs(t-TopClientB) < d) and (abs(l-LeftClientB) < d) then DockSide:=dsBottom
    else if (abs(t-TopClientR) < d) and (abs(l-LeftClientR) < d) then DockSide:=dsRight
    else if (abs(t-TopClientT) < d) and (abs(l-LeftClientT) < d) then DockSide:=dsTop
    else if (abs(t-TopClientL) < d) and (abs(l-LeftClientL) < d) then DockSide:=dsLeft
    else DockSide:=dsNone;

    LeftClientB := xx.Left;
    TopClientB  := xx.Top+xx.Height;


    LeftClientR := xx.Left+xx.Width;
    TopClientR  := xx.Top;

    LeftClientT := xx.Left;
    TopClientT  := xx.Top-aForm.Height;

    LeftClientL := xx.Left-aForm.Width;
    TopClientL  := xx.Top;

    with aForm do
    case DockSide of
      dsBottom:  begin
                   if Left <> LeftClientB then Left := LeftClientB;
                   if Top  <> TopClientB  then Top  := TopClientB;
                end;
      dsRight:  begin
                   if Left <> LeftClientR then Left := LeftClientR;
                   if Top  <> TopClientR  then Top  := TopClientR;
                end;
      dsTop:    begin
                   if Left <> LeftClientT then Left := LeftClientT;
                   if Top  <> TopClientT  then Top  := TopClientT;
                end;
      dsLeft:   begin
                   if Left <> LeftClientL then Left := LeftClientL;
                   if Top  <> TopClientL  then Top  := TopClientL;
                end;
    end;
 end;
finally
end; 
end;

procedure TfInformacionReporte.AppEvents1Idle(Sender: TObject;
  var Done: Boolean);
begin
  if fInfoElectricoCliente.Visible then
    Enviar(self,fInfoElectricoCliente);
  Application.ProcessMessages;
  if fArbolInterruptores.Visible then
    Enviar(self,fArbolInterruptores);
end;

end.
