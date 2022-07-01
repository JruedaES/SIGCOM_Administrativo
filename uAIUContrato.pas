unit uAIUContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, UBase, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons;

type
  TfAIUContrato = class(TFBase)
    Panel1: TPanel;
    GroupBoxFactores: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fAIUContrato: TfAIUContrato;

implementation
USES uContrato;
{$R *.DFM}

end.
