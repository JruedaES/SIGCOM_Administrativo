unit uInformacionOriginal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Db, Buttons, Grids, DBGrids, DBTables,ConsDll,
  ComCtrls;

type
  TfInformacionOriginal = class(TForm)
    PageControl1: TPageControl;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    eLectura: TEdit;
    eConsumo: TEdit;
    GroupBox2: TGroupBox;
    eLecturaReactiva: TEdit;
    GroupBox3: TGroupBox;
    eLecturaDemanda: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox4: TGroupBox;
    Label5: TLabel;
    Label25: TLabel;
    Label6: TLabel;
    qTipoFacturacion: TQuery;
    qTipoFacturacionCODIGOTIPOFACTURACION: TFloatField;
    qTipoFacturacionNOMBRETIPOFACTURACION: TStringField;
    Label19: TLabel;
    ldesviacion: TLabel;
    Label20: TLabel;
    eConsumoReactiva: TEdit;
    Label22: TLabel;
    eConsumoDemanda: TEdit;
    Label23: TLabel;
    Label27: TLabel;
    Label21: TLabel;
    LdesviacionReactiva: TLabel;
    Label26: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    lDesviacionDemanda: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    CodigoBorrado: string;
    ValidarMaximoHorasExtras: boolean;

  public
    { Public declarations }
    bCancelando: Boolean;
    bDatosIncompletos : boolean;
    Fecha,Odts: string;
    Modificado:boolean;
    sFecha: TDateTime;
  end;

var
  fInformacionOriginal: TfInformacionOriginal;


implementation

uses uFormaFecha,Math, uFuncionSGD, uODTPadre;

{$R *.DFM}


procedure TfInformacionOriginal.FormShow(Sender: TObject);
begin
Label6.Caption :=  qTipoFacturacionNOMBRETIPOFACTURACION.AsString;
end;

end.
