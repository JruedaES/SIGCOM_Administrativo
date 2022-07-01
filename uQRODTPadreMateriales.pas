//***************************************************************************
//                    Módulo de ODT
//            Impresión de materiales de la ODT Padre
//***************************************************************************

unit uQRODTPadreMateriales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, Qrctrls, Db, DBTables, StdCtrls, ComCtrls;

type
  TfQRODTPadreMateriales = class(TForm)
    tEmpresaLogo: TTable;
    qEmpresa: TQuery;
    QuickRep1: TQuickRep;
    QRBand2: TQRBand;
    QRShape30: TQRShape;
    QRShape31: TQRShape;
    QRShape32: TQRShape;
    QRShape33: TQRShape;
    QRShape35: TQRShape;
    QRShape36: TQRShape;
    QRShape37: TQRShape;
    QRShape38: TQRShape;
    QRShape39: TQRShape;
    QRShape40: TQRShape;
    QRShape41: TQRShape;
    QRShape42: TQRShape;
    qCia: TQuery;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel27: TQRLabel;
    QRShape28: TQRShape;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRShape49: TQRShape;
    QRShape50: TQRShape;
    QRShape53: TQRShape;
    QRShape54: TQRShape;
    QRShape55: TQRShape;
    QRShape56: TQRShape;
    QRShape4: TQRShape;
    QRLabel7: TQRLabel;
    QRShape23: TQRShape;
    QRLabel8: TQRLabel;
    QRShape24: TQRShape;
    QRLabel11: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel41: TQRLabel;
    QRShape62: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape27: TQRShape;
    QRShape29: TQRShape;
    QRShape34: TQRShape;
    QRShape43: TQRShape;
    QRShape45: TQRShape;
    QRShape46: TQRShape;
    QRShape47: TQRShape;
    QRShape48: TQRShape;
    QRShape58: TQRShape;
    QRShape59: TQRShape;
    QRLabel12: TQRLabel;
    QRShape16: TQRShape;
    QRLabel50: TQRLabel;
    qrdbImpresoODT: TQRDBText;
    QRShape10: TQRShape;
    QRShape1: TQRShape;
    QRShape3: TQRShape;
    QRShape17: TQRShape;
    QRShape18: TQRShape;
    QRShape2: TQRShape;
    QRShape19: TQRShape;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRShape20: TQRShape;
    QRLabel5: TQRLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    temp:integer;
    { Public declarations }
  end;

var
  fQRODTPadreMateriales: TfQRODTPadreMateriales;

implementation
uses uODTPadre;

{$R *.DFM}

procedure TfQRODTPadreMateriales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=CaFree;
end;

end.
