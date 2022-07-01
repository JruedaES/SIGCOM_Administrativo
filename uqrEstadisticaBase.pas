unit uqrEstadisticaBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  uQRBase, Qrctrls, quickrpt, ExtCtrls, uEstadisticasBase, StdCtrls,
  DBCtrls, Db, DBTables;

type
  TfqrEstadisticaBase = class(TfQRBase)
    qrlCubeSummary: TQRLabel;
    ChildBand1: TQRChildBand;
    procedure QuickReportNeedData(Sender: TObject; var MoreData: Boolean);
    Procedure CreateLabels;
    Procedure FreeLabels;
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QuickReportBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    RowCounter,
    MaxCols: integer;
    ColumnLabels: array[0..29] of TQRLabel;
    DataLabels: array[0..29] of TQRLabel;
    SafeToRun : boolean;
    pfEstadisticasBase : ^TfEstadisticasBase;
  end;

var
  fqrEstadisticaBase: TfqrEstadisticaBase;

implementation

{$R *.DFM}

procedure TfqrEstadisticaBase.QuickReportNeedData(Sender: TObject;
  var MoreData: Boolean);
var
  nIdx: integer;
begin
  MoreData := SafeToRun;

  if MoreData then
    with pfEstadisticasBase^.DecisionGrid1 do
    begin
      MoreData := Cells[-FixedCols+1, RowCounter] <> '[Error]';
      nIdx := 0;

      while nIdx < MaxCols do
      begin
        with DataLabels[nIdx] do
        begin
          AutoSize:=False;
          AutoStretch:=true;
          WordWrap:=False;

          Caption := Cells[nIdx-FixedCols+1, RowCounter];//pase 2
          Color := clWhite;
          Font.Size:=8;
          if Caption = 'Sum' then
           begin
            Caption := 'Total';
            Color := $00D8D8D8;
           end;
           if nIdx = MaxCols-1 then
            begin
             Color := $00D8D8D8;
             Font.Style := [fsBold];
            end;
          if (RowCounter > 0) and (RowCounter = (RowCount -3)) then
            Color := clSilver;
        end;
        Inc(nIdx);
      end;
      Inc(RowCounter);
    end;
end;

procedure TfqrEstadisticaBase.FormDestroy(Sender: TObject);
begin
  inherited;
  dispose(pfEstadisticasBase);
end;

procedure TfqrEstadisticaBase.FormCreate(Sender: TObject);
begin
  inherited;
  SafeToRun := false;
  new(pfEstadisticasBase);
end;

procedure TfqrEstadisticaBase.CreateLabels;
var
  LabelWidth,
  n,nIdx: integer;
begin
  if (QuickReport.Bands.HasDetail) and (QuickReport.Bands.HasColumnHeader) then
  begin
    try
     with pfEstadisticasBase^.DecisionCube1 do qrlCubeSummary.Caption := GetSummaryName(CurrentSummary);
    except
      MessageDlg('Please do not diable the Title band', mtWarning, [mbOK], 0);
    end;

    with pfEstadisticasBase^.DecisionGrid1 do
    begin
      MaxCols := ColCount - 1;
      n:= FixedCols-1;

      if MaxCols > 29 then MaxCols := 29;

      if pfEstadisticasBase^.RadioGroup1.ItemIndex = 0
      then LabelWidth := (QuickReport.Bands.ColumnHeaderBand.Width div MaxCols)
      else LabelWidth := pfEstadisticasBase^.SpinEdit1.Value;//

      nIdx := 0;

      while nIdx < MaxCols do
      begin
        ColumnLabels[nIdx] := TQRLabel.Create(Self);
        with ColumnLabels[nIdx] do
        begin
          Font.Style := [fsBold];
          Color := clSilver;
          alignment := taCenter;

          AutoSize:=False;
          AutoStretch:=True;
          WordWrap:=False;

          Parent := QuickReport.Bands.ColumnHeaderBand;
          Height := Parent.Height;  //
          AlignToBand := False;
          Top := 0;
          Autosize := false;
          Width := LabelWidth;        //

          Caption := Cells[nIdx-n, -1];         // pase 1
          if (Caption ='Sum') or (Caption ='')
          then
           begin
            Caption := 'Total';
            Color := $00D8D8D8;
           end;

          if (nIdx = 1) and (Caption = '')
          then Caption := pfEstadisticasBase^.pivot_summary;

          if nIdx = 0 then Left := 0
          else Left := ColumnLabels[nIdx-1].Left + ColumnLabels[nIdx-1].Width; //

          Frame.Color := clBlack;
          Frame.Width := 1;
          Frame.DrawTop := True;
          Frame.DrawBottom := True;
          Frame.DrawLeft := True;
          Frame.DrawRight := True;
//          Transparent := True;

        end;

        DataLabels[nIdx] := TQRLabel.Create(Self);
        with DataLabels[nIdx] do
        begin
          AutoSize:=False;
          AutoStretch:=False;
          WordWrap:=False;

          if nIdx =0 then
          begin
            alignment := taCenter;//taLeftJustify;
//            Color := clSilver;
//            Font.Style := [fsBold];
          end
          else alignment := taCenter;//taRightJustify;

          if ((RowCount - FixedRows) > 1) and (nIdx = (MaxCols-1))
          then
           begin
            Color := $00D8D8D8;
//            Color := clSilver;
            Font.Style := [fsBold];
            Font.Size:=8;
           end;


          if FixedRows = 2
          then Color := clWhite;


          Parent := QuickReport.Bands.DetailBand;
          Height := Parent.Height;//
          AlignToBand := False;
          Top := 0;
          Autosize := false;

{          Frame.Color := clBlack;
          Frame.Width := 1;
          Frame.DrawTop := True;
          Frame.DrawBottom := True;
          Frame.DrawLeft := True;
          Frame.DrawRight := True;}
//          Transparent := True;

          Left := ColumnLabels[nIdx].Left;
          Width := ColumnLabels[nIdx].Width; //
        end;
        Inc(nIdx);
      end;

      if ColumnLabels[MaxCols -1].Caption = '[Error]' then
      begin
        for nIdx := 0 to MaxCols-1 do
          ColumnLabels[nIdx].Caption := Cells[nIdx-2, -1];
      end;

    end;
//    QRShape6.Width := MaxCols * (LabelWidth+2) ;//
    QRShape6.Enabled := False;
    QRShape2.Enabled := False;
    ColumnHeaderBand1.Height := QRShape2.Height;
    DetailBand1.Height := QRShape6.Height;
    SafeToRun := True;
  end;
end;

procedure TfqrEstadisticaBase.FreeLabels;
var
  nIdx: integer;
begin
  SafeToRun := false;
  for nIdx := 0 to 19 do
  begin
    if ColumnLabels[nIdx] <> nil then
    begin
      ColumnLabels[nIdx].Free;
      ColumnLabels[nIdx] := nil;
    end;
    if DataLabels[nIdx] <> nil then
    begin
      DataLabels[nIdx].Free;
      DataLabels[nIdx] := nil;
    end;
  end;
end;

procedure TfqrEstadisticaBase.QuickReportBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
  inherited;
  QuickReport.ReportTitle := pfEstadisticasBase^.Caption;
  RowCounter := 0;
end;

procedure TfqrEstadisticaBase.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeLabels;
  Action := caFree;
end;

end.
