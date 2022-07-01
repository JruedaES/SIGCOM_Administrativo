unit uInformacionMedidor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Db, Buttons, Grids, DBGrids, DBTables,ConsDll,
  ComCtrls;

type
  TfInformacionMedidor = class(TForm)
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
    Modelo: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    qInformacion: TQuery;
    qTipoFacturacion: TQuery;
    qTipoFacturacionCODIGOTIPOFACTURACION: TFloatField;
    qTipoFacturacionNOMBRETIPOFACTURACION: TStringField;
    qInformacionCLAVE: TStringField;
    qInformacionSERIAL: TStringField;
    qInformacionMODELOMEDIDOR: TStringField;
    qInformacionLECTURAACTIVA: TStringField;
    qInformacionLECTURAREACTIVA: TStringField;
    qInformacionLECTURADEMANDA: TStringField;
    qInformacionCODTMEDIDA: TStringField;
    qInformacionTIPOCLAVE: TStringField;
    qInformacionCODIGOITINERARIO: TFloatField;
    qInformacionFECHA_PROGRAMADA: TDateTimeField;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    dsInformacion: TDataSource;
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
  fInformacionMedidor: TfInformacionMedidor;


implementation

uses uFormaFecha,Math, uFuncionSGD, uODTPadre;

{$R *.DFM}


end.
