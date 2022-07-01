unit uODTDetalleHorasExtras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, DBCtrls, Mask, Db, Buttons, Grids, DBGrids, DBTables,ConsDll;

type
  TFODTDetalleHorasExtras = class(TForm)
    Panel1: TPanel;
    PanelExtras: TPanel;
    Panel3: TPanel;
    bbAceptar: TBitBtn;
    bbCancelar: TBitBtn;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit5: TDBEdit;
    qODTSobreTiempoDetalle: TQuery;
    dsODTSobreTiempoDetalle: TDataSource;
    UpdODTSobreTiempoDetalle: TUpdateSQL;
    Bevel1: TBevel;
    qODTSobreTiempoDetalleCODIGOODT: TFloatField;
    qODTSobreTiempoDetalleCODIGOEMPLEADO: TFloatField;
    qODTSobreTiempoDetalleFECHAHORADESDE: TDateTimeField;
    qODTSobreTiempoDetalleFECHAHORAHASTA: TDateTimeField;
    qODTSobreTiempo: TQuery;
    qODTSobreTiempoCODIGOODT: TFloatField;
    qODTSobreTiempoCODIGOEMPLEADO: TFloatField;
    qODTSobreTiempoOBSERVACION: TStringField;
    qODTSobreTiempoFECHAASIGNACION: TDateTimeField;
    dsODTSobreTiempo: TDataSource;
    qEmpleado2: TQuery;
    qEmpleado2CODIGOEMPLEADO: TFloatField;
    qEmpleado2NOMBREEMPLEADO: TStringField;
    qEmpleado2CODIGOSUELDO: TStringField;
    qEmpleado2SUELDOEMPLEADO: TFloatField;
    UpdODTSobreTiempo: TUpdateSQL;
    DBNavigator1: TDBNavigator;
    dbgHoras: TDBGrid;
    qODTSobreTiempoDetalleCantidad: TFloatField;
    qODTSobreTiempoCODIGOODTSOBRETIEMPO: TFloatField;
    qODTSobreTiempoDetalleCODIGOODTSOBRETIEMPODETALLE: TFloatField;
    qODTSobreTiempoDetalleCODIGOODTSOBRETIEMPO: TFloatField;
    qODTSobreTiempoCANTIDADDIURNA: TFloatField;
    qODTSobreTiempoCANTIDADNOCTURNA: TFloatField;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    qODTSobreTiempoDetalleCANTIDADDIURNA: TFloatField;
    qODTSobreTiempoDetalleCANTIDADNOCTURNA: TFloatField;
    tTempFecha: TTable;
    dsTempFecha: TDataSource;
    qODTSobreTiempoDetalleCONVENCIONAL: TStringField;
    lbAyuda: TLabel;
    qODTSobreTiempoDetalleOBSERVACION: TStringField;
    qTurno: TQuery;
    qODTSobreTiempoDetalleDISPONIBILIDAD: TStringField;
    qDisponibilidad: TQuery;
    qOdt: TQuery;
    qOdtCODIGOODT: TFloatField;
    qOdtFECHAINICIO: TDateTimeField;
    qOdtFECHAFINAL: TDateTimeField;
    qODTSobreTiempoDetalleESTADO: TStringField;
    qTurnoCODIGOTIPOTURNO: TFloatField;
    qTurnoTIPOHORARIO: TStringField;
    qInterseccionOdts: TQuery;
    qTurnoDetalle: TQuery;
    dsTurno: TDataSource;
    qTurnoDetalleFECHADESDE: TDateTimeField;
    qTurnoDetalleFECHAHASTA: TDateTimeField;
    qODTSobreTiempoNombre: TStringField;
    procedure qODTSobreTiempoAfterPost(DataSet: TDataSet);
    procedure qODTSobreTiempoCANTIDADValidate(Sender: TField);
    procedure bbAceptarClick(Sender: TObject);
    procedure bbCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure qODTSobreTiempoDetalleAfterInsert(DataSet: TDataSet);
    procedure qODTSobreTiempoDetalleCalcFields(DataSet: TDataSet);
    procedure dbgHorasEditButtonClick(Sender: TObject);
    procedure qODTSobreTiempoAfterInsert(DataSet: TDataSet);
    procedure qODTSobreTiempoDetalleAfterPost(DataSet: TDataSet);
    procedure qODTSobreTiempoDetalleAfterDelete(DataSet: TDataSet);
    procedure qODTSobreTiempoDetalleFECHAHORAHASTAValidate(Sender: TField);
    procedure qODTSobreTiempoDetalleFECHAHORADESDEValidate(Sender: TField);
    procedure qODTSobreTiempoDetalleBeforePost(DataSet: TDataSet);
    procedure dbgHorasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qODTSobreTiempoDetalleCANTIDADNOCTURNAValidate(
      Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure qODTSobreTiempoDetalleUpdateRecord(DataSet: TDataSet;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qODTSobreTiempoDetalleCANTIDADDIURNAValidate(Sender: TField);
    procedure qODTSobreTiempoUpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure DBEdit5KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qODTSobreTiempoDetalleBeforeDelete(DataSet: TDataSet);
    procedure qODTSobreTiempoDetalleOBSERVACIONChange(Sender: TField);
    procedure qODTSobreTiempoDetalleDISPONIBILIDADValidate(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure qODTSobreTiempoDetalleCONVENCIONALSetText(Sender: TField;
      const Text: String);
    procedure qODTSobreTiempoDetalleDISPONIBILIDADSetText(Sender: TField;
      const Text: String);
    procedure qODTSobreTiempoDetalleCONVENCIONALValidate(Sender: TField);
    procedure qODTSobreTiempoCalcFields(DataSet: TDataSet);
    procedure qODTSobreTiempoDetalleMODIFICADOChange(Sender: TField);
  private
    { Private declarations }
    CodigoBorrado: string;
    ValidarMaximoHorasExtras: boolean;
    function VERIFICARODTPERMISOSEDITAR(PERMISO:string): Boolean;
    function VerificacionFinDeSemanaYFestivos(CodigoEmpleado: String; FechaDesde, FechaHasta, HoraDesde, HoraHasta: TDateTime): Integer;
  public
    { Public declarations }
    bDatosIncompletos, bCancelando: Boolean;
    Fecha,Odts: string;
    Modificado:boolean;
    sFecha: TDateTime;
   function EsFestivo(Dia:TDateTime):boolean;
   function ValidarEsDiurno: Boolean;
   function GetFecha(Tipo:Boolean): String;
   procedure CopiarFechaTemp;
   procedure PartirHorasExtras;
   procedure PartirHorasExtrasMedioDia;
   function ValidarFechaHorasExtras:boolean;
   function ValidarInterseccionHorasExtrasOtraOdt:boolean;
   function ValidarInterseccionHorasExtrasTurno:boolean;
   function ValidarPeriodoLiquidadoNomina:boolean;
  end;
  function InterseccionHoras(Desde1,Hasta1,Desde2,Hasta2:TDateTime):extended;

var
  FODTDetalleHorasExtras: TFODTDetalleHorasExtras;

implementation

uses uFormaFecha,Math, uFuncionSGD, uODTPadre;

{$R *.DFM}

procedure TFODTDetalleHorasExtras.qODTSobreTiempoAfterPost(DataSet: TDataSet);
begin
  qODTSobreTiempo.ApplyUpdates;
  qODTSobreTiempo.CommitUpdates;
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoCANTIDADValidate(
  Sender: TField);
begin
  if Sender.Text <> '' then
  begin
    if Sender.AsInteger < 0 then
      raise Exception.Create('La cantidad en horas extras debe ser mayor que cero.');
  end;
end;

procedure TFODTDetalleHorasExtras.bbAceptarClick(Sender: TObject);
var ValorDiurna,ValorNocturna:integer;
begin
  bDatosIncompletos := False;
  if not (ValidarInterseccionHorasExtrasOtraOdt) then
  begin
    if (Application.MessageBox(pchar('Existen registros erróneos de horas extras. Desea Corregirlos'),pchar('Error'),MB_YESNO)=IDyes) then
    begin
     ModalResult:=0;
     Exit;
    end
    else                 
    begin
    {     ModalResult:=mrCancel;
     Close;
     Exit;     }
      bDatosIncompletos := True;
      ModalResult:=MrCancel;
      Close;
    end;
  end;

  try
     if qODTSobreTiempoDetalle.State in [dsInsert,dsEdit] then
       qODTSobreTiempoDetalle.Post;
     qODTSobreTiempoDetalle.ApplyUpdates;
     qODTSobreTiempoDetalle.CommitUpdates;

     if not(qODTSobreTiempo.State in [dsEdit,dsInsert]) then
       qODTSobreTiempo.Edit;
      qODTSobreTiempoDetalle.First;
      ValorDiurna := 0;
      ValorNocturna := 0;
      while not qODTSobreTiempoDetalle.Eof do
      begin
        ValorDiurna := ValorDiurna + qODTSobreTiempoDetalleCANTIDADDIURNA.AsInteger;
        ValorNocturna := ValorNocturna + qODTSobreTiempoDetalleCANTIDADNOCTURNA.AsInteger;
        qODTSobreTiempoDetalle.Next;
      end;
      if qODTSobreTiempo.State in [dsEdit,dsInsert] then
      begin
        qODTSobreTiempoCANTIDADDIURNA.AsInteger:=ValorDiurna;
        qODTSobreTiempoCANTIDADNOCTURNA.AsInteger:=ValorNocturna;
        qODTSobreTiempo.Post;
      end;
     Close;
     ModalResult:=MrOk;
  except
     bDatosIncompletos := True;
     qODTSobreTiempo.Edit;
     ModalResult:=MrCancel;
     Close;
  end;
end;

procedure TFODTDetalleHorasExtras.bbCancelarClick(Sender: TObject);
begin
  if MessageDlg('Perderá los cambios realizados.Esta seguro de Cancelar?',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    try
     qODTSobreTiempoDetalle.Cancel;
     if qODTSobreTiempoDetalle.UpdatesPending then
       qODTSobreTiempoDetalle.CancelUpdates;

     qODTSobreTiempo.Cancel;
      if qODTSobreTiempo.UpdatesPending then
        qODTSobreTiempo.CancelUpdates;

    finally
      bDatosIncompletos := true;
       bCancelando := true;
      Close;
    end;
  end
  else
  begin
    ModalResult := 0;
    bDatosIncompletos := false;
  end;
end;

procedure TFODTDetalleHorasExtras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 if not bCancelando then
    begin
      if bDatosIncompletos then
       begin
         if MessageDlg('Hay datos incompletos.Desea completar los datos?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
            begin
              ModalResult := 0;
              bDatosIncompletos := false;
              Action:=caNone;
              tTempFecha.close;              
            end
         else
            begin
              qODTSobreTiempoDetalle.Cancel;
              qODTSobreTiempoDetalle.CancelUpdates;
              Action:=caFree;
              tTempFecha.close;
            end;
       end
     else
       if ModalResult <> MrCancel then
       begin
          ModalResult := mrOK;
          Action:=caFree;
          tTempFecha.close;
       end;
     end;
   if ModalResult=2 then
   begin
     try
      qODTSobreTiempoDetalle.Cancel;
      qODTSobreTiempoDetalle.CancelUpdates;
      Action:=caFree;
      tTempFecha.close;
     except
     end;
   end;
end;

procedure TFODTDetalleHorasExtras.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then                              { if it's an enter key }
  Begin
    if not (ActiveControl is TDBGrid) then begin { if not on a TDBGrid }
      Key := #0;                                 { eat enter key }
      Perform(WM_NEXTDLGCTL, 0, 0);              { move to next control }
    end
    else if (ActiveControl is TDBGrid) then      { if it is a TDBGrid }
    begin
      with TDBGrid(ActiveControl) do
      begin
        if Selectedindex < FieldCount - 1 then
        begin
           SelectedIndex := SelectedIndex + 1;
           while not columns[SelectedIndex].visible do
           begin
             SelectedIndex := SelectedIndex + 1;
             if SelectedIndex >= FieldCount - 1 then
                Break;
           end;
        end
        else
        begin
          if DataSource.DataSet <> nil then
             DataSource.DataSet.Append;
          Selectedindex := 0;
        end;
      end;
    end;
  End;
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoDetalleAfterInsert(
  DataSet: TDataSet);
var Query: TQuery;
begin
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('SELECT SQ_SOBRETIEMPODETALLE.NEXTVAL FROM DUAL');
  Query.Open;
  DataSet.FieldByName('CODIGOODTSOBRETIEMPODETALLE').AsInteger := Query.Fields[0].AsInteger;
  Query.Free;
  DataSet.FieldByName('CODIGOODTSOBRETIEMPO').AsString := qODTSobreTiempoCODIGOODTSOBRETIEMPO.AsString;
  DataSet.FieldByName('CODIGOODT').AsString := qODTSobreTiempoCODIGOODT.AsString;
  DataSet.FieldByName('CODIGOEMPLEADO').AsString := qODTSobreTiempoCODIGOEMPLEADO.AsString;
  DataSet.FieldByName('FECHAHORADESDE').AsString := qODTSobreTiempoFECHAASIGNACION.AsString;
  DataSet.FieldByName('FECHAHORAHASTA').AsString := qODTSobreTiempoFECHAASIGNACION.AsString;
  DataSet.FieldByName('OBSERVACION').AsString :=qODTSobreTiempoCODIGOODT.AsString;
  lbAyuda.Caption:='F2 para Aceptar cambios del registro';
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoDetalleCalcFields(
  DataSet: TDataSet);

var Valor:  Integer;
begin
  if (qODTSobreTiempoDetalleFECHAHORADESDE.AsString <> '') and
     (qODTSobreTiempoDetalleFECHAHORAHASTA.AsString <> '') then
  begin
    qODTSobreTiempoDetalleCantidad.AsFloat := Abs(Int(qODTSobreTiempoDetalleFECHAHORADESDE.AsFloat - qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat)*24
    - 24*Frac(Abs(qODTSobreTiempoDetalleFECHAHORADESDE.AsDateTime - qODTSobreTiempoDetalleFECHAHORAHASTA.AsDateTime)));
    valor := Round(qODTSobreTiempoDetalleCantidad.AsFloat);
    qODTSobreTiempoDetalleCantidad.AsFloat := Valor;
  end;
end;

function TFODTDetalleHorasExtras.GetFecha(Tipo:Boolean): String;

function FechaSinSegundos: string;
var Hour, Min, Sec, MSec: Word;
begin
   if sFecha = 0 then
   begin
     DecodeTime(Now, Hour, Min, Sec, MSec);
     Min := 0;
     Sec := 0;
     Result := DateTimeToStr(Int(Now) + EncodeTime(Hour, Min, Sec, MSec));
   end
   else
   begin
     Result := DateTimeToStr(sFecha);
   end;
end;

begin
  fFormaFecha := TfFormaFecha.Create(Application);
  uFormaFecha.sFecha := FechaSinSegundos;
  FFormaFecha.seSegundos.Value := 0;
  FFormaFecha.seSegundos.Enabled := False;
  FFormaFecha.seMinutos.Value := 0;
  FFormaFecha.seMinutos.Enabled := False;
  fFormaFecha.height:=291;
  if FFormaFecha.ShowModal = mrOk then
    if Tipo then
       Result := DateTimetoStr(FFormaFecha.Date+FFormaFecha.fTime)
    else
       Result := DateTimetoStr(FFormaFecha.Date)
  else Result := DateTimeToStr(sFecha);
  fFormaFecha.Free;
end;


procedure TFODTDetalleHorasExtras.dbgHorasEditButtonClick(Sender: TObject);
begin
  if not (qODTSobreTiempoDetalle.State in [dsInsert,dsEdit]) then
    qODTSobreTiempoDetalle.Edit;
  sFecha := dbgHoras.SelectedField.AsDateTime;
  Fecha := GetFecha(True);
  if Fecha <> '' then dbgHoras.SelectedField.AsString := Fecha;
end;




procedure TFODTDetalleHorasExtras.qODTSobreTiempoAfterInsert(
  DataSet: TDataSet);
var Query: TQuery;
begin
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('SELECT SQ_SOBRETIEMPO.NEXTVAL FROM DUAL');
  Query.Open;
  DataSet.FieldByName('CODIGOODTSOBRETIEMPO').AsInteger := Query.Fields[0].AsInteger;
  Query.Free;
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoDetalleAfterPost(
  DataSet: TDataSet);
var ValorDiurna, ValorNocturna: Integer;
    Diferencia: Integer;
    NumHorasDesc : Integer;
    Hora : TDateTime;
begin
  ValidarMaximoHorasExtras:= false;
  qODTSobreTiempoDetalle.ApplyUpdates;
  qODTSobreTiempoDetalle.CommitUpdates;

  Diferencia := Trunc(qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat) - Trunc(qODTSobreTiempoDetalleFECHAHORADESDE.AsFloat);
  if (Diferencia > 0)
  and ((Diferencia <> 1) or (Int(qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat) <> qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat))
     then
    PartirHorasExtras;

  qODTSobreTiempo.Edit;
  qODTSobreTiempoDetalle.First;
  ValorDiurna := 0;
  ValorNocturna := 0;
  while not qODTSobreTiempoDetalle.Eof do
  begin
    ValorDiurna := ValorDiurna + qODTSobreTiempoDetalleCANTIDADDIURNA.AsInteger;
    ValorNocturna := ValorNocturna + qODTSobreTiempoDetalleCANTIDADNOCTURNA.AsInteger;
    qODTSobreTiempoDetalle.Next;
  end;

  Hora:=EncodeTime(12,0,0,0);
  NumHorasDesc:=0;
  NumHorasDesc:=  VerificacionFinDeSemanaYFestivos(qODTSobreTiempoCODIGOEMPLEADO.AsString,
                qODTSobreTiempoDetalleFECHAHORADESDE.AsDateTime, qODTSobreTiempoDetalleFECHAHORAHASTA.AsDateTime, Hora, Hora);

  if NumHorasDesc > 0  then PartirHorasExtrasMedioDia;

  if not(qODTSobreTiempo.State in [dsEdit,dsInsert]) then
    qODTSobreTiempo.Edit;
  qODTSobreTiempoCANTIDADDIURNA.AsInteger := ValorDiurna;
  qODTSobreTiempoCANTIDADNOCTURNA.AsInteger := ValorNocturna;
  qODTSobreTiempo.Post;
  Modificado:=true;
  ValidarMaximoHorasExtras:= true;
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoDetalleAfterDelete(
  DataSet: TDataSet);
var ValorDiurna, ValorNocturna: Integer;
begin
  qODTSobreTiempoDetalle.ApplyUpdates;
  qODTSobreTiempoDetalle.CommitUpdates;

  qODTSobreTiempo.Edit;
  qODTSobreTiempoDetalle.First;
  ValorDiurna := 0;
  ValorNocturna := 0;
  while not qODTSobreTiempoDetalle.Eof do
  begin
    ValorDiurna := ValorDiurna + qODTSobreTiempoDetalleCANTIDADDIURNA.AsInteger;
    ValorNocturna := ValorNocturna + qODTSobreTiempoDetalleCANTIDADNOCTURNA.AsInteger;
    qODTSobreTiempoDetalle.Next;
  end;
  if not(qODTSobreTiempo.State in [dsEdit,dsInsert]) then
    qODTSobreTiempo.Edit;
  qODTSobreTiempoCANTIDADDIURNA.AsInteger := ValorDiurna;
  qODTSobreTiempoCANTIDADNOCTURNA.AsInteger := ValorNocturna;
  qODTSobreTiempo.Post;
end;

function TFODTDetalleHorasExtras.ValidarEsDiurno: Boolean;
function OpuestoEsDiurno(Valor: string): string;
begin
  if Valor = 'D' then
    Result := 'N'
  else
    Result := 'D';
end;

var Query: TQuery;
begin
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('SELECT COUNT(*) FROM ODTSOBRETIEMPO');
  Query.SQL.Add('WHERE CODIGOODT = ' + qODTSobreTiempoCODIGOODT.AsString);
  Query.SQL.Add('AND CODIGOEMPLEADO = ' + qODTSobreTiempoCODIGOEMPLEADO.AsString);
  Query.Open;
  Result := Query.Fields[0].AsInteger > 0;
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoDetalleFECHAHORAHASTAValidate(
  Sender: TField);
begin
  if (Sender.Text <> '') and (qODTSobreTiempoDetalleFECHAHORADESDE.AsFloat <> 0) then
  begin
    if Sender.AsFloat < qODTSobreTiempoDetalleFECHAHORADESDE.AsFloat then
      raise Exception.Create('La fecha hasta no puede ser inferior a la fecha desde.');
  end;
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoDetalleFECHAHORADESDEValidate(
  Sender: TField);
begin
  if (Sender.Text <> '') and (qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat <> 0) then
  begin
    if Sender.AsFloat > qODTSobreTiempoDetalleFECHAHORADESDE.AsFloat then
      raise Exception.Create('La fecha desde no puede ser superior a la fecha hasta.');
  end;
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoDetalleBeforePost(
  DataSet: TDataSet);

function EsDiurna(var aFecha: TDateTime): Boolean;
var Hour, Min, Sec, MSec: Word;
begin
  DecodeTime(aFecha, Hour, Min, Sec, MSec);
  Result := (Hour >= 5) and (Hour < 19);
  Hour := Hour + 1;
  if Hour = 24 then
  begin
    Hour := 0;
    aFecha := aFecha + 1; //dia siguiente
  end;
  aFecha := Int(aFecha) + EncodeTime(Hour, Min, Sec, MSec);
end;

function NoExisteODTHija(var Fecha_Desde, Fecha_Hasta: TDateTime): Integer;
var Query, Query2: tquery;
bandera: boolean;
fechainiciotrabajo,fechafinaltrabajo, fechahastainicial, fechaDesdeinicial : tdatetime;
Begin
  fechahastainicial:=Fecha_Hasta;
  fechaDesdeinicial:=Fecha_Desde;
  Result:= 0;
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.sql.clear;
  Query.SQL.Add('select od.codigoodt, od.consecutivo, od.fechainiciotrabajo, od.fechafinaltrabajo,e.CODIGOEMPLEADO, e.NOMBREEMPLEADO from odtdia od, odtpresmano op, empleado e ');
  Query.SQL.Add('WHERE od.CODIGOODT = ' + qODTSobreTiempoCODIGOODT.AsString);
  Query.SQL.Add('and od.CODIGOODT = op.CODIGOODT');
  Query.SQL.Add('and od.CONSECUTIVO = op.CONSECUTIVO');
  Query.SQL.Add('AND op.CODIGOEMPLEADO = ' + qODTSobreTiempoCODIGOEMPLEADO.AsString);
  Query.SQL.Add('and op.CODIGOEMPLEADO = e.CODIGOEMPLEADO ');
  {Query.SQL.Add('and od.codigoestadoodtdia = 6');
  Query.SQL.Add('and od.revisioncoordinador = ''S''');}
  Query.Open;
  if Query.recordcount > 0 then
  Begin
    Query.close;
    Query.SQL.Add('and od.codigoestadoodtdia = 6');
    Query.Open;
    if Query.recordcount > 0 then
    Begin
      Query.close;
      Query.SQL.Add('and od.revisioncoordinador = ''S''');
      Query.Open;
      if Query.recordcount > 0 then
      Begin
        while DATETIMETOSTR(fechaDesdeinicial) <> DATETIMETOSTR(fechahastainicial) do
        Begin
          Query.first;
          while not Query.eof do
          Begin
            bandera:= false;
            fechainiciotrabajo:= fechaDesdeinicial;
            fechafinaltrabajo:= fechaDesdeinicial +(1/24);
            if ((fechainiciotrabajo >= Query.fieldbyname('fechainiciotrabajo').asdatetime) and (fechafinaltrabajo <= Query.fieldbyname('fechafinaltrabajo').asdatetime)) then
            Begin
              bandera:= true;
              fechaDesdeinicial:= fechaDesdeinicial +(1/24);
              break;
            End
            else
            Begin
               Query.next;
            end;
          End;

          If bandera= false then
          Begin
             Result := 4;
             break;
          end;

        end;
      end
      else
        result:= 3;
    end
    else
      result:= 2;
         //raise Exception.Create('La hora '+datetimetostr(fecha_desde)+' no se encuentra en ninguna ODT hija.');
  end
  else
    result:= 1;
    //raise Exception.Create('No existe ninguna ODT hija terminada y revisada por el Coordinador donde se relacione el empleado.');
End;

var I, ValorDiurna, ValorNocturna, horasAnteriores, HorasActuales, MHE, ResultNoExisteODTHija: Integer;
    Temp, f_i, f_f: TDateTime;
    Query, query2: tquery;
    Horasdiurnasregistro, horanocturnaregistro: string;
    Hora1, Hora2: TDateTime;
begin
  if (qODTSobreTiempoDetalleESTADO.AsString ='PRO')or(qODTSobreTiempoDetalleESTADO.AsString='BLO') then
  begin
    raise Exception.Create('No se pueden modificar estas horas extras porque la planilla ya se encuentra en Proceso de Nómina.');
  end;
  qodt.Close;
  qodt.open;
  if qODTSobreTiempoDetalleOBSERVACION.AsString ='' then
    raise Exception.Create('Debe Ingresar una Observación para la horas extras');
  if qODTSobreTiempoDetalleFECHAHORADESDE.AsDateTime > qODTSobreTiempoDetalleFECHAHORAHASTA.AsDateTime then
    raise Exception.Create('La fecha hasta no puede ser inferior a la fecha desde.');
  if qODTSobreTiempoDetalleFECHAHORADESDE.AsDateTime < qOdtFECHAINICIO .AsDateTime then
    raise Exception.Create('La fecha inicial de la hora extra no puede ser inferior a la fecha inicial de la odt.');
  if qODTSobreTiempoDetalleFECHAHORAHASTA.AsDateTime > qOdtFECHAFINAL.AsDateTime then
    raise Exception.Create('La fecha final de la hora extra no puede ser superior a la fecha final de la odt.');


  //**************Validacion con ODT Hijas********************************************************
  if (qODTSobreTiempoDetalleDISPONIBILIDAD.asstring <> 'S') and (qODTSobreTiempoDetalleCONVENCIONAL.AsString <> 'S')  then
  Begin
    f_i:= qODTSobreTiempoDetalleFECHAHORADESDE.AsDateTime;
    f_f:=  qODTSobreTiempoDetalleFECHAHORAHASTA.AsDateTime;

    ResultNoExisteODTHija:= NoExisteODTHija(f_i,f_f );

    If ResultNoExisteODTHija = 1 then
      raise Exception.Create('No existe ninguna ODT hija donde se relacione el empleado: '+qODTSobreTiempoDetalleCODIGOEMPLEADO.asstring);
    If ResultNoExisteODTHija = 2 then
      raise Exception.Create('No existe ninguna ODT hija terminada donde se relacione el empleado: '+qODTSobreTiempoDetalleCODIGOEMPLEADO.asstring);
    If ResultNoExisteODTHija = 3 then
      raise Exception.Create('No existe ninguna ODT hija terminada y revisada por el Coordinador donde se relacione el empleado: '+qODTSobreTiempoDetalleCODIGOEMPLEADO.asstring);
    If ResultNoExisteODTHija = 4 then
      raise Exception.Create('El rango de fechas '+qODTSobreTiempoDetalleFECHAHORADESDE.Asstring +'-'+ qODTSobreTiempoDetalleFECHAHORAHASTA.AsString+' no concuerda con horas laboradas del empleado '+qODTSobreTiempoDetalleCODIGOEMPLEADO.asstring+' en las ODT Hijas. ');




  end;
  //***********************************************************************************************

  //*******************************  Validacion 48 horas  ********************************************
  IF (((qODTSobreTiempoDetalleCONVENCIONAL.ASSTRING = 'N') or (qODTSobreTiempoDetalleCONVENCIONAL.ASSTRING = '')) AND ((qODTSobreTiempoDetalleDISPONIBILIDAD.ASSTRING = 'N') or (qODTSobreTiempoDetalleDISPONIBILIDAD.ASSTRING = '') ))  THEN
  Begin
    if ValidarMaximoHorasExtras = true then
    Begin
      if qODTSobreTiempoDetalleCANTIDADDIURNA.asstring = '' then
        Horasdiurnasregistro:= '0'
      else
        Horasdiurnasregistro:= qODTSobreTiempoDetalleCANTIDADDIURNA.asString;

      if qODTSobreTiempoDetalleCANTIDADNOCTURNA.asstring = '' then
        horanocturnaregistro:= '0'
      else
        horanocturnaregistro:= qODTSobreTiempoDetalleCANTIDADNOCTURNA.asString;



      Query := TQuery.Create(Application);
      Query.DatabaseName := 'BaseDato';

      Query.sql.clear;
      Query.SQL.Add('select cantidaddiurna,cantidadnocturna from ODTSOBRETIEMPODETALLE where ((convencional <> ''S'') and (disponibilidad <> ''S'')) and CODIGOODTSOBRETIEMPODETALLE = '+ qODTSobreTiempoDetalleCODIGOODTSOBRETIEMPODETALLE.asstring);
      Query.open;
      if Query.recordcount <=0 then
      Begin
        Horasdiurnasregistro := '0';
        horanocturnaregistro := '0';
      End;
      Query.close;


      Query.sql.clear;
      Query.SQL.Add('select sum( nvl(cantidaddiurna,0) + nvl(cantidadnocturna,0)) - '+Horasdiurnasregistro +' - '+ horanocturnaregistro+' as horas from ODTSOBRETIEMPODETALLE');
      Query.SQL.Add('where codigoempleado = ' + qODTSobreTiempoCODIGOEMPLEADO.AsString);
      Query.SQL.Add('and nvl(convencional,''N'') <> ''S'' and nvl(disponibilidad,''N'') <> ''S'' and fechahoradesde >= trunc(to_date('''+FormatDateTime('dd/mm/yyyy',qODTSobreTiempoDetalleFECHAHORADESDE.Asdatetime)+''', ''dd/mm/yyyy''), ''mm'')');
      Query.SQL.Add('and fechahorahasta < trunc(last_day(to_date('''+FormatDateTime('dd/mm/yyyy',qODTSobreTiempoDetalleFECHAHORADESDE.Asdatetime)+''', ''dd/mm/yyyy''))) + 1');
      Query.open;
      HorasAnteriores:= Query.FieldByName('horas').asInteger;
      Query.CLOSE;
      Query.sql.clear;
      Query.SQL.Add('SELECT VALOR FROM PARAMETRO WHERE CODIGOPARAMETRO = ''MHE'' ');
      Query.open;
      MHE:= Query.FieldByName('VALOR').asInteger;

      Query.free;

      Query2 := TQuery.Create(Application);
      Query2.DatabaseName := 'BaseDato';
      Query2.sql.clear;
      Query2.SQL.Add('select (to_date('''+FormatDateTime('dd/mm/yyyy HH:mm:ss',qODTSobreTiempoDetalleFECHAHORAHASTA.Asdatetime)+''', ''dd/mm/yyyy hh24:mi:ss'') - to_date('''+FormatDateTime('dd/mm/yyyy HH:mm:ss',qODTSobreTiempoDetalleFECHAHORADESDE.Asdatetime)+''', ''dd/mm/yyyy hh24:mi:ss'')) * 24 as horas from dual');
      Query2.open;
      HorasActuales:=  Query2.FieldByName('horas').asInteger ;
      Query2.free;
      if (HorasAnteriores + HorasActuales ) > MHE then
      Begin
        if VERIFICARODTPERMISOSEDITAR('SUPERARREGISTROHORASEXTRAS') = false then
          raise Exception.Create('Actualmente el empleado con cedula n° '+qODTSobreTiempoCODIGOEMPLEADO.AsString +' tiene '+ inttostr(HorasAnteriores) +' horas extras y con las '+inttostr(HorasActuales)+' que intenta agregar supera el limite permitido.')
        else
        MessageDlg('Actualmente el empleado con cedula n° '+qODTSobreTiempoCODIGOEMPLEADO.AsString +' tiene '+ inttostr(HorasAnteriores) +' horas extras ' + Chr(13) + 'y con las '+inttostr(HorasActuales)+' que está registrando, superó el limite permitido.', mtWarning, [mbOk], 0);

          //raise Exception.Create('Actualmente el empleado con cedula n° '+qODTSobreTiempoCODIGOEMPLEADO.AsString +' tiene '+ inttostr(HorasAnteriores) +' horas extras y con las '+inttostr(HorasActuales)+' superó el limite permitido.')
      End;
    End;
  End;
  //**************************************************************************************************

    Temp := qODTSobreTiempoDetalleFECHAHORADESDE.AsFloat;
  ValorDiurna := 0;
  ValorNocturna := 0;
  for I:=1 to DataSet.FieldByName('CANTIDAD').AsInteger do
  begin
    if EsDiurna(Temp) then
      Inc(ValorDiurna)
    else
      Inc(ValorNocturna);
  end;
  if (ValorDiurna = 0) and (ValorNocturna = 0) then
  begin
    raise Exception.Create('El valor de la horas extras diurnas y nocturnas no pueden ser iguales a cero.');
  end;

  qODTSobreTiempoDetalleCANTIDADDIURNA.AsInteger := ValorDiurna;
  qODTSobreTiempoDetalleCANTIDADNOCTURNA.AsInteger := ValorNocturna;
  qODTSobreTiempoDetalleCONVENCIONALValidate(qODTSobreTiempoDetalleCONVENCIONAL);
  qODTSobreTiempoDetalleDISPONIBILIDADValidate(qODTSobreTiempoDetalleDISPONIBILIDAD);


  if not tTempFecha.Active then
    tTempFecha.Active := True;
  tTempFecha.First;
  while not tTempFecha.Eof do
  begin
//hacer validacion interseccion horas extras otras odts
    if tTempFecha.FieldByName('CODIGO').AsString <> qODTSobreTiempoDetalleCODIGOODTSOBRETIEMPODETALLE.AsString then
    begin
      if (qODTSobreTiempoDetalleFECHAHORADESDE.AsFloat >= tTempFecha.FieldByName('FECHAHORADESDE').AsFloat) and
         (qODTSobreTiempoDetalleFECHAHORADESDE.AsFloat <  tTempFecha.FieldByName('FECHAHORAHASTA').AsFloat) then
        raise Exception.Create('La fecha introducida ' + qODTSobreTiempoDetalleFECHAHORADESDE.AsString + ' se solapa con el intervalo de fechas : ' + Chr(13)
        + tTempFecha.FieldByName('FECHAHORADESDE').AsString + ' - ' + tTempFecha.FieldByName('FECHAHORAHASTA').AsString );

      if (qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat <= tTempFecha.FieldByName('FECHAHORAHASTA').AsFloat) and
         (qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat >  tTempFecha.FieldByName('FECHAHORADESDE').AsFloat) then
        raise Exception.Create('La fecha introducida ' + qODTSobreTiempoDetalleFECHAHORAHASTA.AsString + ' se solapa con el intervalo de fechas : ' + Chr(13)
        + tTempFecha.FieldByName('FECHAHORADESDE').AsString + ' - ' + tTempFecha.FieldByName('FECHAHORAHASTA').AsString );

      if (qODTSobreTiempoDetalleFECHAHORADESDE.AsFloat < tTempFecha.FieldByName('FECHAHORADESDE').AsFloat) and
         (qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat > tTempFecha.FieldByName('FECHAHORAHASTA').AsFloat) then
        raise Exception.Create('La fecha introducida ' + qODTSobreTiempoDetalleFECHAHORAHASTA.AsString + ' se solapa con el intervalo de fechas : ' + Chr(13)
        + tTempFecha.FieldByName('FECHAHORADESDE').AsString + ' - ' + tTempFecha.FieldByName('FECHAHORAHASTA').AsString );
    end;
     tTempFecha.Next;
  end;
  if not ValidarFechaHorasExtras then
  begin
    raise Exception.Create('La fecha introducida ' + qODTSobreTiempoDetalleFECHAHORADESDE.AsString + ' se solapa con el intervalo de fechas : ' + Chr(13)
     + 'de la odt '+odts);
  end;

  qTurno.Close;
  qTurno.Open;
  qTurnoDetalle.close;
  qTurnoDetalle.open;
  if (qTurnoTIPOHORARIO.AsString<>'T')and not(DayOfWeek(qODTSobreTiempoDetalleFECHAHORADESDE.AsDateTime)in[1,7]) and not(EsFestivo(qODTSobreTiempoDetalleFECHAHORADESDE.AsDateTime)) then
  begin
    qTurnoDetalle.First;
    while not (qTurnoDetalle.Eof) do
    begin
      Hora1 := frac(qODTSobreTiempoDetalleFECHAHORADESDE.AsDateTime+(1/(24*60*3600)))+1;
      Hora2 := frac(qODTSobreTiempoDetalleFECHAHORAHASTA.AsDateTime-(1/(24*60*3600)))+1;
      if (InterseccionHoras(qTurnoDetalleFECHADESDE.AsDateTime,qTurnoDetalleFECHAHASTA.AsDateTime,Hora1,Hora2)>0) then
      begin
        raise Exception.Create('No puede incluir horas Extras en Horario Normal');
        Exit;
      end;
      qTurnoDetalle.Next;
    end;
  end;
  if not ValidarPeriodoLiquidadoNomina then
  begin
    raise Exception.Create('Esta hora extra no puede ser ingresada porque se encuentra dentro de un periodo que ya ha sido procesado por Nómina.');
  end;
end;

procedure TFODTDetalleHorasExtras.dbgHorasKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if  Key = VK_F3 then
  dbgHorasEditButtonClick(nil);
 if  Key = VK_F2 then
  if qODTSobreTiempoDetalle.State in [dsEdit,dsInsert] then
    qODTSobreTiempoDetalle.Post;
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoDetalleCANTIDADDIURNAValidate(
  Sender: TField);
begin
{  if (Sender.Text <> '') then
    if (not VarIsEmpty(Sender.AsVariant)) and (not VarIsEmpty(qODTSobreTiempoDetalleCANTIDADNOCTURNA.AsVariant))  then
      if (Sender.AsInteger = 0) and (qODTSobreTiempoDetalleCANTIDADNOCTURNA.AsInteger = 0) then
        raise Exception.Create('El valor de la horas extras diurnas y nocturnas no pueden ser iguales a cero.');
}
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoDetalleCANTIDADNOCTURNAValidate(
  Sender: TField);
begin
{  if (Sender.Text <> '') then
    if (not VarIsEmpty(Sender.AsVariant)) and (not VarIsEmpty(qODTSobreTiempoDetalleCANTIDADDIURNA.AsVariant))  then
      if (Sender.AsInteger = 0) and (qODTSobreTiempoDetalleCANTIDADDIURNA.AsInteger = 0) then
        raise Exception.Create('El valor de la horas extras diurnas y nocturnas no pueden ser iguales a cero.');
}        
end;

procedure TFODTDetalleHorasExtras.FormCreate(Sender: TObject);
var Tabla: TTable;
begin
  tTempFecha.DatabaseName:=GetTemporalPath;
  Tabla := tTable.Create(Application);
  Tabla.DatabaseName :=GetTemporalPath;
  Tabla.Active := False;
  try
    tabla.DeleteTable;
  except
  end;
  Tabla.TableName := 'TempFecha';
  with Tabla.FieldDefs do
  begin
    Clear;
    Add('CODIGO', ftfloat, 0, True);
    Add('FECHAHORADESDE', ftDateTime, 0, True);
    Add('FECHAHORAHASTA', ftDateTime, 0, True);
  end;
  with Tabla.IndexDefs do
  begin
    Clear;
    Add('', 'CODIGO', [ixPrimary]);
    Add('Idx', 'FECHAHORADESDE;FECHAHORAHASTA', [ixUnique]);
  end;
  Tabla.CreateTable;
  Tabla.Free;
  odts:='';
  ValidarMaximoHorasExtras:= true;
  //VALIDAR SI TIENE DERECHO A TURNO DE DISPONIBLIDAD
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoDetalleUpdateRecord(
  DataSet: TDataSet; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  UpdODTSobreTiempoDetalle.Apply(UpdateKind);
  UpdateAction := uaApplied;
  
   case UpdateKind of
    ukModify:begin
               if tTempFecha.Locate('CODIGO',qODTSobreTiempoDetalleCODIGOODTSOBRETIEMPODETALLE.AsString,[]) then
               begin
                 tTempFecha.Edit;
                 tTempFecha.FieldByName('FECHAHORADESDE').AsString := qODTSobreTiempoDetalleFECHAHORADESDE.AsString;
                 tTempFecha.FieldByName('FECHAHORAHASTA').AsString := qODTSobreTiempoDetalleFECHAHORAHASTA.AsString;
                 tTempFecha.Post;
               end;
             end;
    ukDelete:begin
               if tTempFecha.Locate('CODIGO',CodigoBorrado,[]) then
                 tTempFecha.Delete;
             end;
    ukInsert:begin
               tTempFecha.Insert;
               tTempFecha.FieldByName('CODIGO').AsString := qODTSobreTiempoDetalleCODIGOODTSOBRETIEMPODETALLE.AsString;
               tTempFecha.FieldByName('FECHAHORADESDE').AsString := qODTSobreTiempoDetalleFECHAHORADESDE.AsString;
               tTempFecha.FieldByName('FECHAHORAHASTA').AsString := qODTSobreTiempoDetalleFECHAHORAHASTA.AsString;
               tTempFecha.Post;
             end;
  end;
end;

procedure TFODTDetalleHorasExtras.CopiarFechaTemp;
begin
  qODTSobreTiempoDetalle.First;
  tTempFecha.Active := True;
  while not qODTSobreTiempoDetalle.Eof do
  begin
    tTempFecha.Insert;
    tTempFecha.FieldByName('CODIGO').AsString := qODTSobreTiempoDetalleCODIGOODTSOBRETIEMPODETALLE.AsString;
    tTempFecha.FieldByName('FECHAHORADESDE').AsString := qODTSobreTiempoDetalleFECHAHORADESDE.AsString;
    tTempFecha.FieldByName('FECHAHORAHASTA').AsString := qODTSobreTiempoDetalleFECHAHORAHASTA.AsString;
    tTempFecha.Post;
    qODTSobreTiempoDetalle.Next;
  end;
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoUpdateError(
  DataSet: TDataSet; E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  try
  except
   raise;
  end;
end;

procedure TFODTDetalleHorasExtras.DBEdit5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if  Key = VK_F2 then
  if qODTSobreTiempoDetalle.State in [dsEdit,dsInsert] then
    qODTSobreTiempoDetalle.Post;
end;

procedure TFODTDetalleHorasExtras.PartirHorasExtras;
var TempHasta, TempDesde: Double;
    Dias: Integer;
    TempObservacion:string;
begin
 qODTSobreTiempoDetalle.First;
 while not qODTSobreTiempoDetalle.Eof do
 begin
   Dias := Trunc(qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat) - Trunc(qODTSobreTiempoDetalleFECHAHORADESDE.AsFloat);
   if (Dias > 0)
   and ((Dias <> 1) or (Int(qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat) <> qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat)) then
   begin
      qODTSobreTiempoDetalle.Edit;
      TempHasta := qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat;
      TempDesde := Int(qODTSobreTiempoDetalleFECHAHORADESDE.AsFloat) + 1;
      TempObservacion:=qODTSobreTiempoDetalleOBSERVACION.AsString;
      qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat := Int(qODTSobreTiempoDetalleFECHAHORADESDE.AsFloat) + 1;
      qODTSobreTiempoDetalle.Post;
      if TempDesde <> TempHasta then
      begin
        qODTSobreTiempoDetalle.Insert;
        qODTSobreTiempoDetalleFECHAHORADESDE.AsFloat := TempDesde;
        qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat := TempHasta;
        qODTSobreTiempoDetalleOBSERVACION.AsString := TempObservacion;
        qODTSobreTiempoDetalle.Post;
      end
//      else
//       Break;
   end;
   qODTSobreTiempoDetalle.Next;
 end;
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoDetalleBeforeDelete(
  DataSet: TDataSet);
begin
  CodigoBorrado :=DataSet.FieldByName('CODIGOODTSOBRETIEMPODETALLE').AsString;
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoDetalleOBSERVACIONChange(
  Sender: TField);
begin
  if qODTSobreTiempo.State in [dsEdit,dsInsert] then
    qODTSobreTiempoOBSERVACION.AsString:=qODTSobreTiempoOBSERVACION.AsString+'/'+
    qODTSobreTiempoDetalleOBSERVACION.AsString;
  Modificado:=true;
end;

procedure TFODTDetalleHorasExtras.PartirHorasExtrasMedioDia;
var TempHasta, TempDesde: Double;
    Dias: Integer;
    Hora1,Hora2,Hora3,temp:TDateTime;
    TempObservacion:string;
begin
 qODTSobreTiempoDetalle.First;
 Hora1:=EncodeTime(12,0,0,0);
 Hora2:=EncodeTime(13,0,0,0);
 Hora3:=EncodeTime(14,0,0,0);
 while not qODTSobreTiempoDetalle.Eof do
 begin
   Dias := Trunc(qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat) - Trunc(qODTSobreTiempoDetalleFECHAHORADESDE.AsFloat);
   if (Dias = 0) then
   begin
     temp:=int(qODTSobreTiempoDetalleFECHAHORADESDE.AsDateTime)+Hora2-qODTSobreTiempoDetalleFECHAHORADESDE.AsDateTime;//vuelta por problema de precision
     if (temp>0) then
     begin
        if (InterseccionHoras(Hora1,Hora3,frac(qODTSobreTiempoDetalleFECHAHORADESDE.AsDateTime),frac(qODTSobreTiempoDetalleFECHAHORAHASTA.AsDateTime))*24>1) then
        begin
          qODTSobreTiempoDetalle.Edit;
          TempHasta := qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat;
          TempDesde :=  Trunc(qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat) + Hora3;
          TempObservacion:=qODTSobreTiempoDetalleOBSERVACION.AsString;
          qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat := Trunc(qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat) + Hora2;
          qODTSobreTiempoDetalle.Post;
          if TempDesde <> TempHasta then
          begin
            qODTSobreTiempoDetalle.Insert;
            qODTSobreTiempoDetalleFECHAHORADESDE.AsFloat := TempDesde;
            qODTSobreTiempoDetalleFECHAHORAHASTA.AsFloat := TempHasta;
            qODTSobreTiempoDetalleOBSERVACION.AsString := TempObservacion;
            qODTSobreTiempoDetalle.Post;
          end;
        end;
     end;
   end;
   qODTSobreTiempoDetalle.Next;
 end;
end;
//verifica si dos lapsos de tiempo se intersectan
//y devuelve la cantidad de tiempo de la interseccion
function InterseccionHoras(Desde1,Hasta1,Desde2,Hasta2:TDateTime):extended;
begin
  Result:=(min(Hasta1,Hasta2)-max(Desde1,Desde2));
  if result < 0 then
    result:=0;
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoDetalleDISPONIBILIDADValidate(
  Sender: TField);
begin
  if Sender.AsString='S' then
  begin
  //esto lo quito por los festivos jathinson
    {if not (DayOfWeek(qODTSobreTiempoDetalleFECHAHORADESDE.AsDateTime)  in [1,7] ) then
      raise exception.create('Los turnos de disponibilidad solo se generan en sábado o en domingo');  }
    if qODTSobreTiempoDetalleCONVENCIONAL.AsString='S' then
      raise exception.create('Las horas extras convencionales no pueden ser a su vez turnos de disponibilidad');
    if qODTSobreTiempoDetalleCantidad.AsInteger>8 then
      raise exception.create('El turno de disponibilidad no puede exceder 8 horas');
  end;
end;

procedure TFODTDetalleHorasExtras.FormShow(Sender: TObject);
var query:Tquery;
begin
  query:=TQuery.Create(self);
  query.DatabaseName:='BaseDato';
  query.sql.text:='select codigoestadoodt from odt where codigoodt='+ qODTSobreTiempoCODIGOODT.AsString;
  query.open;
  if query.fieldbyname('codigoestadoodt').AsString='6' then
    bbAceptar.Enabled:=false;
  query.free;
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoDetalleCONVENCIONALSetText(
  Sender: TField; const Text: String);
begin
  sender.AsString:=UpperCase(Text);
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoDetalleDISPONIBILIDADSetText(
  Sender: TField; const Text: String);
begin
  sender.AsString:=UpperCase(Text);
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoDetalleCONVENCIONALValidate(
  Sender: TField);
begin
  if Sender.AsString='S' then
  begin
    if qODTSobreTiempoDetalleCantidad.AsInteger>3 then
      raise exception.create('Las horas extras convencionales no pueden exceder 3 horas');
    if qODTSobreTiempoDetalleDISPONIBILIDAD.AsString='S' then
      raise exception.create('Las horas extras convencionales no pueden ser a su vez turnos de disponibilidad');
  end;
end;

function TFODTDetalleHorasExtras.ValidarFechaHorasExtras: boolean;
var query:tquery;
  FechaInicio,FechaFin:String;
begin
  result:=false;
  odts:='';
  FechaInicio:=FormatDateTime('dd/mm/yyyy hh:nn:ss',qODTSobreTiempoDetalleFECHAHORADESDE.asdatetime);
  FechaFin:=FormatDateTime('dd/mm/yyyy hh:nn:ss',qODTSobreTiempoDetalleFECHAHORAHASTA.asdatetime);
  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  query.sql.Add('SELECT CODIGOODT');
  query.sql.Add('FROM ODTSOBRETIEMPODETALLE A');
  query.sql.Add('WHERE A.CODIGOEMPLEADO='+qODTSobreTiempoDetalleCODIGOEMPLEADO.AsString);
  query.sql.Add('AND A.CODIGOODTSOBRETIEMPODETALLE<>'+qODTSobreTiempoDetalleCODIGOODTSOBRETIEMPODETALLE.AsString);
  query.sql.Add('AND A.CODIGOODTSOBRETIEMPODETALLE<>'+qODTSobreTiempoDetalleCODIGOODTSOBRETIEMPODETALLE.AsString);  
  query.sql.Add('AND (((to_date('''+FechaInicio+''',''dd/mm/yyyy hh24:mi:ss'')>=A.FECHAHORADESDE)');
  query.sql.Add('AND (to_date('''+FechaInicio+''',''dd/mm/yyyy hh24:mi:ss'')<A.FECHAHORAHASTA))');
  query.sql.Add('OR((to_date('''+FechaFin+''',''dd/mm/yyyy hh24:mi:ss'')>A.FECHAHORADESDE )');
  query.sql.Add('AND(to_date('''+FechaFin+''',''dd/mm/yyyy hh24:mi:ss'')<=A.FECHAHORAHASTA))');
  query.sql.Add('OR((to_date('''+FechaInicio+''',''dd/mm/yyyy hh24:mi:ss'')<A.FECHAHORADESDE )');
  query.sql.Add('AND (to_date('''+FechaFin+''',''dd/mm/yyyy hh24:mi:ss'')>A.FECHAHORAHASTA)) )');
  query.open;
  if (query.RecordCount>0) then
  begin
    while not(query.eof)  do
    begin
      odts:=odts+', '+query.fields[0].asstring;
      query.next;
    end;
    odts:=copy(odts,3,length(odts)-2);
  end
  else
    Result:=true;
end;

function TFODTDetalleHorasExtras.ValidarInterseccionHorasExtrasOtraOdt: boolean;
begin
  Result:=true;
  qODTSobreTiempoDetalle.first;
  try
    while not qODTSobreTiempoDetalle.eof do
    begin
      qInterseccionOdts.close;
      qInterseccionOdts.ParamByName('CODIGOEMPLEADO').AsString:=qODTSobreTiempoDetalleCODIGOEMPLEADO.AsString;
      qInterseccionOdts.ParamByName('CODIGOODT').AsString:=qODTSobreTiempoDetalleCODIGOODT.AsString;
      qInterseccionOdts.ParamByName('DESDE').AsDatetime:=qODTSobreTiempoDetalleFECHAHORADESDE.AsDateTime;
      qInterseccionOdts.ParamByName('HASTA').AsDatetime:=qODTSobreTiempoDetalleFECHAHORAHASTA.AsDateTime;
      qInterseccionOdts.open;
      if qInterseccionOdts.RecordCount>0 then
        raise Exception.Create('Existen horas extras que se cruzan con la Odt '+qInterseccionOdts.fieldbyname('codigoodt').AsString);
      qODTSobreTiempoDetalle.next;
    end;
  except
    Result:=false;
  end;
end;

function TFODTDetalleHorasExtras.EsFestivo(Dia: TDateTime): boolean;
var qFestivo:tquery;
begin
  result:=false;
  qFestivo:=TQuery.create(self);
  qFestivo.DatabaseName:='BaseDato';
  qFestivo.sql.Text:='SELECT COUNT(*) FROM FESTIVO WHERE TO_CHAR(FECHAFESTIVO,''DD/MM/YYYY'')='''+FormatDateTime('dd/mm/yyyy',Dia)+'''';
  qFestivo.open;
  if qFestivo.Fields[0].AsInteger>0 then result:=true;
  qfestivo.free;
end;

function TFODTDetalleHorasExtras.ValidarInterseccionHorasExtrasTurno: boolean;
begin

end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoCalcFields(
  DataSet: TDataSet);
begin
  qEmpleado2.close;
  qEmpleado2.open;
  qODTSobreTiempoNombre.AsString:=qEmpleado2NOMBREEMPLEADO.AsString;
  qEmpleado2.close;  
end;

procedure TFODTDetalleHorasExtras.qODTSobreTiempoDetalleMODIFICADOChange(
  Sender: TField);
begin
  Modificado:=true;
end;

function TFODTDetalleHorasExtras.ValidarPeriodoLiquidadoNomina: boolean;
var query:tquery;
begin
  result:=true;
  query:=TQuery.create(nil);
  query.DatabaseName:='BaseDato';
  query.sql.add('select count(*) from planillamesempleado p');
  query.sql.add('where p.fecha=to_date(trunc(:fecha,''mm''))');
  query.sql.add('and p.codigoempleado=:codigoempleado');
  query.sql.add('and p.codigoestadoplanilla=''BLO''');
  query.ParamByName('fecha').AsDateTime:=qODTSobreTiempoDetalleFECHAHORADESDE.AsDateTime;
  query.ParamByName('codigoempleado').AsFloat:=qODTSobreTiempoDetalleCODIGOEMPLEADO.AsFloat;
  query.open;
  if query.fields[0].AsInteger>0 then
    result:=false;
  query.close;
  query.ParamByName('fecha').AsDateTime:=qODTSobreTiempoDetalleFECHAHORAHASTA.AsDateTime;
  query.ParamByName('codigoempleado').AsFloat:=qODTSobreTiempoDetalleCODIGOEMPLEADO.AsFloat;
  query.open;
  if query.fields[0].AsInteger>0 then
    result:=false;
  query.close;
  query.free;
end;

function TFODTDetalleHorasExtras.VERIFICARODTPERMISOSEDITAR(PERMISO:string): Boolean;
var qDatos:TQuery;
begin
  Result:=false;
  ConsDll.RefrescarVariables;
  if VarCodigoUsuario = 0 then //Es Admin ?
  begin
    Result:=true;
    Exit;
  end;
  qDatos:=TQuery.Create(Application);
  try
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Add('SELECT EDITAR FROM ODTPERMISOS WHERE NOMBRETABLA = '''+permiso+'''');
    qDatos.SQL.Add('AND CODIGOUSUARIO = ' + IntToStr(VarCodigoUsuario));
    if fodtpadre.qODTCODIGOADMINISTRATIVO.AsString<>'' then
      qDatos.SQL.Add('AND CODIGOADMINISTRATIVO = ' + fodtpadre.qODTCODIGOADMINISTRATIVO.AsString);
    qDatos.Open;
    if qDatos.Fields[0].AsString = 'S' then
      Result:=true;
  finally
    qDatos.Free;
  end;
end;

function TFODTDetalleHorasExtras.VerificacionFinDeSemanaYFestivos(CodigoEmpleado: String; FechaDesde, FechaHasta, HoraDesde, HoraHasta: TDateTime): Integer;

var
  qry: TQuery;
  FechaAEvaluar, Fecha1, Fecha2, FechaAEvaluar2: TDateTime;
  ContAux: Integer;
  HoraDesde1, MinDesde1, SegDesde1, MsDesde1: Word;
  HoraHasta1, MinHasta1, SegHasta1, MsHasta1: Word;
  HoraDesde2, MinDesde2, SegDesde2, MsDesde2 : Word;
  Hora2, Min2, Seg2, Ms2 : Word;
  a, b: Double;

  function EsDiaFestivoSabadoDomingo(Fecha: TDateTime): Boolean;
  var
   qry: TQuery;
   sFecha, sFechaOrcl :String;
  begin
    result:= False;
    qry:=TQuery.Create(nil);
    qry.DatabaseName:='BaseDato';
    sFecha:= FormatDateTime('dd/mm/yyyy', Fecha);
    sFechaOrcl := 'TO_DATE('''+sFecha+''', ''DD/MM/YYYY'')';
    qry.SQL.Text:= 'SELECT * FROM SIP_FESTIVOS WHERE FECHA = '+sFechaOrcl;
    qry.Open;
    if not qry.IsEmpty then result:= True;
    qry.Close;
    qry.Free;
  end;

begin
  ContAux:=0;
  if CodigoEmpleado <> '' then
  begin
    {qry:=TQuery.Create(nil);
    qry.DatabaseName:='BaseDato';
    qry.SQL.Text:= 'SELECT V.* FROM VIP_EMPLEADOS_TURNOS V '+
                   ' WHERE V.CODIGO= '+CodigoEmpleado;
    qry.Open;
    if not qry.IsEmpty then
    begin }

      FechaAEvaluar:= FechaDesde;
      while FechaAEvaluar <= FechaHasta do
      begin
        if  EsDiaFestivoSabadoDomingo(FechaAEvaluar) then
        begin
          if (qry.FieldByName('EMPRESA').AsInteger <> 3) then //NO ES DE TERMOBARRANCA
          begin
             if (qry.FieldByName('TURNO').AsString <> 'S') then //NO ES POR TURNOS
             begin
               if (qODTSobreTiempoDetalleCantidad.AsInteger >= 8) then //TRABAJÓ 8 HORAS O MÁS
               begin
                 DecodeTime(FechaDesde, HoraDesde1, MinDesde1, SegDesde1, MsDesde1);
                 DecodeTime(FechaHasta, HoraHasta1, MinHasta1, SegHasta1, MsHasta1);
                 DecodeTime(HoraDesde, HoraDesde2, MinDesde2, SegDesde2, MsDesde2);

                 FechaAEvaluar2 := Trunc(FechaDesde)+Frac(EncodeTime(HoraDesde1,0,0,0));
                 while FechaAEvaluar2 <= FechaHasta do
                 begin
                   DecodeTime(FechaAEvaluar2, Hora2, Min2, Seg2, Ms2);
                   a:= StrToFloat(FloatToStr(FechaAEvaluar2));
                   b:= StrToFloat(FloatToStr(FechaHasta));
                   if (Hora2 = HoraDesde2) and (a < b) then
                   begin
                     inc(ContAux); //TRABAJO LA HORA COMPRENDIDA ENTRE LAS 12:00:00 m a las  01:00:00 p.m
                   end;
                   FechaAEvaluar2:= FechaAEvaluar2+(1/24);
                 end;
               end;
             end;
          end;
        end;
        FechaAEvaluar:= int(FechaAEvaluar)+1;
      end;

    {end;
    qry.Close;
    qry.Free;}
  end;
  result:= ContAux;
end;


end.
