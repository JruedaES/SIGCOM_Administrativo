unit uQRListaReportes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uQRBase, Db, DBTables, Qrctrls, QuickRpt, ExtCtrls;

type
  TFQRListaReportes = class(TFQRBase)
    QRShape8: TQRShape;
    QRShape9: TQRShape;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRShape10: TQRShape;
    QRShape11: TQRShape;
    QRLabel6: TQRLabel;
    QRDBText4: TQRDBText;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel7: TQRLabel;
    QRDBText5: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FQRListaReportes: TFQRListaReportes;

implementation

{$R *.DFM}

end.
