unit uFormarFechaOliver;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ExtCtrls, StdCtrls, Buttons;

type
  TfFormaFechaOliver = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    MonthCalendar1: TMonthCalendar;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fFormaFechaOliver: TfFormaFechaOliver;

implementation

{$R *.DFM}

procedure TfFormaFechaOliver.SpeedButton1Click(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfFormaFechaOliver.SpeedButton2Click(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
