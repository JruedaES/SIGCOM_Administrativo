unit uPreviewQuickReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, ExtCtrls, Buttons, QRPrntr, QuickRpt, Spin, Qrctrls,
  Db, DBTables;

type
  TFPreviewQuickReport = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    sbFirsPage: TSpeedButton;
    sbPreviousPage: TSpeedButton;
    sbNextPage: TSpeedButton;
    sbLastPage: TSpeedButton;
    QRPrev: TQRPreview;
    stBar: TStatusBar;
    Label2: TLabel;
    sbZoomToFit: TSpeedButton;
    ZoomTo100: TSpeedButton;
    sbZoomToWidth: TSpeedButton;
    PrinterSetup: TSpeedButton;
    Print: TSpeedButton;
    sePage: TSpinEdit;
    spZoom: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure QRPrevPageAvailable(Sender: TObject; PageNum: Integer);
    procedure sbFirsPageClick(Sender: TObject);
    procedure sePageChange(Sender: TObject);
    procedure sbNextPageClick(Sender: TObject);
    procedure sbZoomToFitClick(Sender: TObject);
    procedure PrintClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbPreviousPageClick(Sender: TObject);
    procedure Muestra(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    MaxPag: Integer;
  end;

var
  FPreviewQuickReport: TFPreviewQuickReport;

implementation

{$R *.DFM}

procedure TFPreviewQuickReport.FormCreate(Sender: TObject);
begin
  sbFirsPage.Glyph.Handle := LoadBitMap(hInstance, 'QRFIRSTPAGEBITMAP');
end;

procedure TFPreviewQuickReport.QRPrevPageAvailable(Sender: TObject;
  PageNum: Integer);
begin
  sePage.MaxValue := PageNum; //Ajustar el contador y la
  StBar.Panels[0].Text := 'Pag. 1/' + IntToStr(PageNum); //barra de tareas
  //Poner un título
  if QRPrev.QRPrinter.Title = '' then QRPrev.QRPrinter.Title := 'SIN TITULO'; //si no lo tiene ya
  if PageNum = 1 then
    Caption := QRPrev.QRPrinter.Title + ' - 1 pagina'
  else
    Caption := QRPrev.QRPrinter.Title + ' - ' + IntToStr(PageNum) + ' paginas';
  case QRPrev.QRPrinter.Status of //Definir su estado
    mpReady: Caption := Caption + ' LISTO';
    mpBusy: Caption := Caption + ' LEYENDO';
    mpFinished: Caption := Caption + ' TERMINADO';
  end;
  MaxPag := PageNum;
  StBar.Panels[2].Text := 'Nombre : ' + QRPrev.QRPrinter.Title;
end;

procedure TFPreviewQuickReport.sbFirsPageClick(Sender: TObject);
begin
  sePage.Value := 1;
end;

procedure TFPreviewQuickReport.sePageChange(Sender: TObject);
begin
  QRPrev.PageNumber := sePage.Value;
  StBar.Panels[0].Text := 'Pag. ' + IntToStr(sePage.Value) + '/' + IntToStr(MaxPag);
end;

procedure TFPreviewQuickReport.sbNextPageClick(Sender: TObject);
begin
  if sePage.Value < QRPrev.QRPrinter.PageCount then
  begin
    sePage.Value := sePage.Value + 1;
  end;
end;

procedure TFPreviewQuickReport.sbZoomToFitClick(Sender: TObject);
begin
  QRPrev.ZoomToFit;
  spZoom.Value := QRPrev.Zoom;
end;

procedure TFPreviewQuickReport.PrintClick(Sender: TObject);
begin
  QRPrev.QRPrinter.PrinterIndex := 0;
  QRPrev.qrprinter.Print;
end;

procedure TFPreviewQuickReport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  QRPrev.QRPrinter := nil;
  Self.Visible := False;
  Action := caFree;
end;

procedure TFPreviewQuickReport.sbPreviousPageClick(Sender: TObject);
begin
  if sePage.Value > 0 then
  begin
    sePage.Value := sePage.Value - 1;
  end;
end;

procedure TFPreviewQuickReport.Muestra(Sender: TObject);
begin
  QRPrev.QRPrinter := TQRPrinter(Sender); //Mostrar el texto correspondiente
  sePage.Value := QRPrev.QRPrinter.PageNumber; //Inicializar valores
  QRPrev.PageNumber:=sePage.Value;
  sePage.Value := 1;
  sePage.MinValue := 1;
  sePage.MaxValue := QRPrev.QRPrinter.PageCount;
  QRPrev.Zoom := 100;
  ZoomTo100.Down := True;
  spZoom.Value := 100;
  Show;
end;

end.

