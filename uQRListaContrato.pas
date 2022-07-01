unit uQRListaContrato;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uQRBaseVertical, Db, DBTables, Qrctrls, QuickRpt, ExtCtrls;

type
  TFQRListaContrato = class(TFQRBaseVertical)
    QRLabel3: TQRLabel;
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRShape10: TQRShape;
    QRLabel8: TQRLabel;
    QRShape11: TQRShape;
    QRLabel9: TQRLabel;
    QRShape12: TQRShape;
    QRDBText3: TQRDBText;
    QRShape13: TQRShape;
    QRDBText4: TQRDBText;
    QRShape14: TQRShape;
    QRDBText5: TQRDBText;
    QRShape15: TQRShape;
    QRDBText6: TQRDBText;
    QRDBText7: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FQRListaContrato: TFQRListaContrato;

implementation
uses uListaContratoDistribucion;
{$R *.DFM}

end.
