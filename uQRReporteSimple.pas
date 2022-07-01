unit uQRReporteSimple;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uQRBase, Db, DBTables, Qrctrls, QuickRpt, ExtCtrls;

type
  TFQRReporteSimple = class(TFQRBase)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FQRReporteSimple: TFQRReporteSimple;

implementation

{$R *.DFM}

end.
