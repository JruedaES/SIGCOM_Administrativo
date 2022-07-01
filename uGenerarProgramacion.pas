unit uGenerarProgramacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, Grids, DBGrids, RXDBCtrl, ComCtrls, StdCtrls, Spin, DBCtrls,
  Buttons, ExtCtrls, Menus, Db, DBTables, Digisoft, Mask, ToolEdit,
  QuickRpt;

type
  TFGenerarProgramacion = class(TFBase)
    dsMemFiltro: TDataSource;
    qProgramacion: TQuery;
    dsProgramacion: TDataSource;
    pmMeses: TPopupMenu;
    Enero1: TMenuItem;
    Febrero1: TMenuItem;
    Marzo1: TMenuItem;
    Abril1: TMenuItem;
    Mayo1: TMenuItem;
    Junio1: TMenuItem;
    Julio1: TMenuItem;
    Agosto1: TMenuItem;
    Septiembre1: TMenuItem;
    Octubre1: TMenuItem;
    Noviembre1: TMenuItem;
    Diciembre1: TMenuItem;
    pSuperior: TPanel;
    Bevel2: TBevel;
    sbtGenerarProgramacion: TSpeedButton;
    qCalendarioProgramacion: TQuery;
    dsCalendarioProgramacion: TDataSource;
    qProgramacionEmpleado: TQuery;
    Notebook1: TNotebook;
    Panel2: TPanel;
    HeaderControl1: THeaderControl;
    dbgCalendarioEmpleado: TRxDBGrid;
    Panel1: TPanel;
    HeaderControl2: THeaderControl;
    dbgCalendarioGrupo: TRxDBGrid;
    dsCalendarioProgramacionGrupo: TDataSource;
    qCalendarioProgramacionGrupo: TQuery;
    dsProgramacionGrupoEmpleado: TDataSource;
    qProgramacionGrupo: TQuery;
    sbtImprimirProgramacion: TSpeedButton;
    tdMemFiltro: tdMemTable;
    tdMemFiltrocodigoprogramacion: TIntegerField;
    tdMemFiltronombreprogramacion: TStringField;
    tdMemFiltroFecha: TDateTimeField;
    tdMemFiltroTipoProgramacion: TStringField;
    qProgramacionGrupoEmpleado: TQuery;
    qProgramacionGrupoEmpleadoCODIGOPROGRAMACION: TFloatField;
    qProgramacionGrupoEmpleadoCODIGOADMINISTRATIVO: TFloatField;
    qProgramacionGrupoEmpleadoCODIGOGRUPOTRABAJO: TFloatField;
    qProgramacionGrupoEmpleadoDIADESCANSO: TFloatField;
    qProgramacionGrupoEmpleadoFECHADESCANSO: TDateTimeField;
    qProgramacionGrupoEmpleadoCODIGOEMPLEADO: TFloatField;
    qProgramacionGrupoEmpleadoNOMBREEMPLEADO: TStringField;
    qProgramacionGrupoEmpleadoNOMBREGRUPOTRABAJO: TStringField;
    qEmpleado: TQuery;
    qGrupo: TQuery;
    QRCompositeReport1: TQRCompositeReport;
    tdMemFiltroRotacion: TStringField;
    GroupBox1: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    TitleLabel: TPanel;
    seAgnos: TSpinEdit;
    DBDateEdit1: TDBDateEdit;
    dsProgramacionGrupo: TDataSource;
    qProgramacionGrupoCODIGOPROGRAMACION: TFloatField;
    qProgramacionGrupoCODIGOADMINISTRATIVO: TFloatField;
    qProgramacionGrupoCODIGOGRUPOTRABAJO: TFloatField;
    qProgramacionGrupoDIADESCANSO: TFloatField;
    qProgramacionGrupoFECHADESCANSO: TDateTimeField;
    qProgramacionGrupoNOMBREGRUPOTRABAJO: TStringField;
    Panelinferior: TPanel;
    PanelGrupoEmpleados: TPanel;
    DBGridGrupoEmpleado: TDBGrid;
    DBGridGrupo: TDBGrid;
    Panel5: TPanel;
    Panel8: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    DBGridEmpleado: TDBGrid;
    Panel9: TPanel;
    dsProgramacionEmpleado: TDataSource;
    qProgramacionEmpleadoCODIGOEMPLEADO: TFloatField;
    qProgramacionEmpleadoCODIGOPROGRAMACION: TFloatField;
    qProgramacionEmpleadoDIADESCANSO: TFloatField;
    qProgramacionEmpleadoFECHADESCANSO: TDateTimeField;
    qProgramacionEmpleadoNOMBREEMPLEADO: TStringField;
    qCalendarioProgramacionCODIGOEMPLEADO: TFloatField;
    qCalendarioProgramacionCODIGOPROGRAMACION: TFloatField;
    qCalendarioProgramacionFECHA: TDateTimeField;
    qCalendarioProgramacionD1: TFloatField;
    qCalendarioProgramacionD2: TFloatField;
    qCalendarioProgramacionD3: TFloatField;
    qCalendarioProgramacionD4: TFloatField;
    qCalendarioProgramacionD5: TFloatField;
    qCalendarioProgramacionD6: TFloatField;
    qCalendarioProgramacionD7: TFloatField;
    qCalendarioProgramacionD8: TFloatField;
    qCalendarioProgramacionD9: TFloatField;
    qCalendarioProgramacionD10: TFloatField;
    qCalendarioProgramacionD11: TFloatField;
    qCalendarioProgramacionD12: TFloatField;
    qCalendarioProgramacionD13: TFloatField;
    qCalendarioProgramacionD14: TFloatField;
    qCalendarioProgramacionD15: TFloatField;
    qCalendarioProgramacionD16: TFloatField;
    qCalendarioProgramacionD17: TFloatField;
    qCalendarioProgramacionD18: TFloatField;
    qCalendarioProgramacionD19: TFloatField;
    qCalendarioProgramacionD20: TFloatField;
    qCalendarioProgramacionD21: TFloatField;
    qCalendarioProgramacionD22: TFloatField;
    qCalendarioProgramacionD23: TFloatField;
    qCalendarioProgramacionD24: TFloatField;
    qCalendarioProgramacionD25: TFloatField;
    qCalendarioProgramacionD26: TFloatField;
    qCalendarioProgramacionD27: TFloatField;
    qCalendarioProgramacionD28: TFloatField;
    qCalendarioProgramacionD29: TFloatField;
    qCalendarioProgramacionD30: TFloatField;
    qCalendarioProgramacionD31: TFloatField;
    qCalendarioProgramacionCODIGOESTADOPROGRAMACION: TStringField;
    qCalendarioProgramacionDIADESCANSO: TFloatField;
    qCalendarioProgramacionGrupoCODIGOADMINISTRATIVO: TFloatField;
    qCalendarioProgramacionGrupoCODIGOGRUPOTRABAJO: TFloatField;
    qCalendarioProgramacionGrupoCODIGOPROGRAMACION: TFloatField;
    qCalendarioProgramacionGrupoFECHA: TDateTimeField;
    qCalendarioProgramacionGrupoD1: TFloatField;
    qCalendarioProgramacionGrupoD2: TFloatField;
    qCalendarioProgramacionGrupoD3: TFloatField;
    qCalendarioProgramacionGrupoD4: TFloatField;
    qCalendarioProgramacionGrupoD5: TFloatField;
    qCalendarioProgramacionGrupoD6: TFloatField;
    qCalendarioProgramacionGrupoD7: TFloatField;
    qCalendarioProgramacionGrupoD8: TFloatField;
    qCalendarioProgramacionGrupoD9: TFloatField;
    qCalendarioProgramacionGrupoD10: TFloatField;
    qCalendarioProgramacionGrupoD11: TFloatField;
    qCalendarioProgramacionGrupoD12: TFloatField;
    qCalendarioProgramacionGrupoD13: TFloatField;
    qCalendarioProgramacionGrupoD14: TFloatField;
    qCalendarioProgramacionGrupoD15: TFloatField;
    qCalendarioProgramacionGrupoD16: TFloatField;
    qCalendarioProgramacionGrupoD17: TFloatField;
    qCalendarioProgramacionGrupoD18: TFloatField;
    qCalendarioProgramacionGrupoD19: TFloatField;
    qCalendarioProgramacionGrupoD20: TFloatField;
    qCalendarioProgramacionGrupoD21: TFloatField;
    qCalendarioProgramacionGrupoD22: TFloatField;
    qCalendarioProgramacionGrupoD23: TFloatField;
    qCalendarioProgramacionGrupoD24: TFloatField;
    qCalendarioProgramacionGrupoD25: TFloatField;
    qCalendarioProgramacionGrupoD26: TFloatField;
    qCalendarioProgramacionGrupoD27: TFloatField;
    qCalendarioProgramacionGrupoD28: TFloatField;
    qCalendarioProgramacionGrupoD29: TFloatField;
    qCalendarioProgramacionGrupoD30: TFloatField;
    qCalendarioProgramacionGrupoD31: TFloatField;
    qCalendarioProgramacionGrupoCODIGOESTADOPROGRAMACION: TStringField;
    qCalendarioProgramacionGrupoDIADESCANSO: TFloatField;
    qProgramacionEmpleadoPOSICIONROTACION: TFloatField;
    qCalendarioProgramacionNOMBREEMPLEADO: TStringField;
    qCalendarioProgramacionGrupoNOMBREGRUPOTRABAJO: TStringField;
    qProgramacionCODIGOPROGRAMACION: TFloatField;
    qProgramacionNOMBREPROGRAMACION: TStringField;
    qProgramacionCODIGOTIPOPROGRAMACION: TStringField;
    qProgramacionDIRECCIONROTACION: TFloatField;
    qProgramacionCODIGOTIPOTURNOPROGRAMACION: TFloatField;
    qProgramacionTITULOPROGRAMACION: TStringField;
    qProgramacionNOMBREADMINISTRATIVO: TStringField;
    chbBloquearProgramacion: TCheckBox;
    qOdtPermisos: TQuery;
    tdMemFiltroCodigoAdministrativo: TIntegerField;
    qProgramacionCODIGOADMINISTRATIVO: TFloatField;
    qOdtPermisosCODIGOUSUARIO: TFloatField;
    qOdtPermisosCODIGOADMINISTRATIVO: TFloatField;
    qOdtPermisosREABRIR: TStringField;
    tdMemFiltroREABRIR: TStringField;
    qProgramacionREABRIR: TStringField;
    qProgramacionROTACION: TStringField;
    qProgramacionGrupoPOSICIONROTACION: TFloatField;
    procedure DBDateEdit1Change(Sender: TObject);
    procedure seAgnosChange(Sender: TObject);
    procedure TitleLabelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MesClick(Sender: TObject);
    procedure tdMemFiltroAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure tdMemFiltroCodigoProgramacionChange(Sender: TField);
    procedure HeaderControl1DrawSection(HeaderControl: THeaderControl;
      Section: THeaderSection; const Rect: TRect; Pressed: Boolean);
    procedure tdMemFiltroFechaChange(Sender: TField);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbgCalendarioEmpleadoGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sbtGenerarProgramacionClick(Sender: TObject);
    procedure qProgramacionAfterScroll(DataSet: TDataSet);
    procedure dbgCalendarioGrupoGetCellParams(Sender: TObject;
      Field: TField; AFont: TFont; var Background: TColor;
      Highlight: Boolean);
    procedure qCalendarioProgramacionGrupoAfterPost(DataSet: TDataSet);
    procedure qCalendarioProgramacionAfterOpen(DataSet: TDataSet);
    procedure sbtImprimirProgramacionClick(Sender: TObject);
    procedure QRCompositeReport1AddReports(Sender: TObject);
    procedure qCalendarioProgramacionDiaSetText(Sender: TField;
      const Text: String);
    procedure qCalendarioProgramacionAfterClose(DataSet: TDataSet);
    procedure chbBloquearProgramacionMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
     Year, Month, Day: Word;
     CrearHeader:Boolean;
     ListaFestivos, ListaFinalMes :TStringList;
     CreandoProgramacion: Boolean;
     procedure GenerarDiasMes(Fecha: TDateTime);
     function  DiaDelphi(Dia: Integer): Integer;
     procedure AsignarEstadoProgramacion(Estado:string);
  public
    { Public declarations }
  end;

var
  FGenerarProgramacion: TFGenerarProgramacion;

implementation

uses uQRProgramacionEmpleado, uQRProgramacionGrupo,Qrctrls, uQRProgramacionGrupoEmpleado,
  ConsDll;

{$R *.DFM}

function FormatoFecha(aFecha:TField):string;
begin
  Result:=FormatDateTime('mm/dd/yyyy',aFecha.AsDateTime);
end;

procedure TFGenerarProgramacion.DBDateEdit1Change(Sender: TObject);
var cadena:string;
begin
  try
    cadena := FormatDateTime('  MMMM  "01 de" YYYY ', DBDateEdit1.Date);
    cadena[1] := UpperCase(cadena[1])[1];
    TitleLabel.Caption := cadena; // UpperCase(cadena[1]) + Copy(cadena, 2 length(cadena)-1);
    TitleLabel.Repaint;
    DecodeDate(DBDateEdit1.Date, Year, Month, Day);
    seAgnos.Value := Year;
    GenerarDiasMes(DBDateEdit1.Date);
    dbgCalendarioEmpleado.Repaint;
    dbgCalendarioGrupo.Repaint;
    tdMemFiltroFecha.AsDateTime := DBDateEdit1.Date;
    except
  end;
end;

procedure TFGenerarProgramacion.seAgnosChange(Sender: TObject);
begin
  DecodeDate(DBDateEdit1.Date, Year, Month, Day);
  Year := seAgnos.Value;
  DBDateEdit1.Date := StrToDate(IntToStr(Day) + '/' + IntToStr(Month) + '/' + IntToStr(Year));
end;

procedure TFGenerarProgramacion.TitleLabelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  var Punto: TPoint;
begin
    Punto:=TitleLabel.ClientToScreen(Classes.Point(X + 10, 10));
    pmMeses.Popup(punto.x+10, punto.y);
end;

procedure TFGenerarProgramacion.MesClick(Sender: TObject);
begin
  if DBDateEdit1.Date = 0 then
    DBDateEdit1.Date := Now;
  DecodeDate(DBDateEdit1.Date, Year, Month, Day);
  Month := (Sender as TMenuItem).Tag;
  DBDateEdit1.Date := StrToDate(IntToStr(Day) + '/' + IntToStr(Month) + '/' + IntToStr(Year));
end;

procedure TFGenerarProgramacion.tdMemFiltroAfterInsert(DataSet: TDataSet);
begin
  DecodeDate(Now, Year, Month, Day);
  Day := 1;
  tdMemFiltroFecha.AsDateTime := StrToDate(IntToStr(Day) + '/' + IntToStr(Month) + '/' + IntToStr(Year));
end;

procedure TFGenerarProgramacion.FormShow(Sender: TObject);
const Dias: array[0..7] of Char = ('D','L','M','M','J','V','S','D');

var I: Integer;
begin
  inherited;
  tdMemFiltro.Open;
  tdMemFiltro.Insert;
  HeaderControl1.Sections[0].Text := 'Dias Calendario';
  HeaderControl1.Sections[0].Width := dbgCalendarioEmpleado.Columns[0].Width +
                                      dbgCalendarioEmpleado.Columns[1].Width + 16;
  HeaderControl1.Sections[0].MinWidth := HeaderControl1.Sections[0].Width;
  HeaderControl1.Sections[0].Style := hsText;
  HeaderControl1.Sections[0].AllowClick := False;
  for I:=2 to dbgCalendarioEmpleado.Columns.Count - 1 do
  begin
    dbgCalendarioEmpleado.Columns[i].Width := 22;
    dbgCalendarioEmpleado.Columns[i].Title.Caption := IntToStr(i-1);
    dbgCalendarioEmpleado.Columns[i].Title.Alignment := taCenter;

    HeaderControl1.Sections[i-1].Text := Dias[(I-1) mod 7];
    HeaderControl1.Sections[i-1].Width := 23;
    HeaderControl1.Sections[i-1].MinWidth := 23;
    HeaderControl1.Sections[i-1].Style := hsOwnerDraw;
    HeaderControl1.Sections[i-1].AllowClick := False;
  end;

  HeaderControl2.Sections[0].Text := 'Dias Calendario';
  HeaderControl2.Sections[0].Width := dbgCalendarioGrupo.Columns[0].Width +
                                      dbgCalendarioGrupo.Columns[1].Width + 16;
  HeaderControl2.Sections[0].MinWidth := HeaderControl2.Sections[0].Width;
  HeaderControl2.Sections[0].Style := hsText;
  HeaderControl2.Sections[0].AllowClick := False;
  for I:=2 to dbgCalendarioGrupo.Columns.Count - 1 do
  begin
    dbgCalendarioGrupo.Columns[i].Width := 22;
    dbgCalendarioGrupo.Columns[i].Title.Caption := IntToStr(i-1);
    dbgCalendarioGrupo.Columns[i].Title.Alignment := taCenter;

    HeaderControl2.Sections[i-1].Text := Dias[(I-1) mod 7];
    HeaderControl2.Sections[i-1].Width := 23;
    HeaderControl2.Sections[i-1].MinWidth := 23;
    HeaderControl2.Sections[i-1].Style := hsOwnerDraw;
    HeaderControl2.Sections[i-1].AllowClick := False;
  end;

  CrearHeader := True;
  DBDateEdit1Change(nil);
  qProgramacionAfterScroll(qProgramacion);
  sbtGenerarProgramacion.Enabled := False;
  chbBloquearProgramacion.Enabled := False;
  sbtImprimirProgramacion.Enabled:=False;
end;

procedure TFGenerarProgramacion.tdMemFiltroCodigoProgramacionChange(
  Sender: TField);
begin
  if (Sender.Text <> '') and (tdMemFiltroFecha.AsString <> '') then
  begin
    if UpperCase(tdMemFiltroTipoProgramacion.AsString) = 'P' then
    begin
      qProgramacionEmpleado.Close;
      qProgramacionEmpleado.Open;
      qCalendarioProgramacion.Close;
      qCalendarioProgramacion.Open;
      dbgCalendarioEmpleado.Repaint;
    end
    else
    begin
      qProgramacionGrupo.Close;
      qProgramacionGrupo.Open;
      qProgramacionGrupoEmpleado.Close;
      qProgramacionGrupoEmpleado.Open;
      qCalendarioProgramacionGrupo.Close;
      qCalendarioProgramacionGrupo.Open;
      dbgCalendarioGrupo.Repaint;
    end;
  end;
end;

procedure TFGenerarProgramacion.GenerarDiasMes(Fecha: TDateTime);
const Dias:array[1..7] of string=('D','L','M','M','J','V','S');
var I: Integer;
    Query: TQuery;
    Texto: string;
begin
  ListaFestivos.Clear;
  ListaFinalMes.Clear;
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
//  Query.SQL.Text := 'SELECT COUNT(*) FROM SIP_FESTIVOS WHERE UPPER(DESCRIPCION) LIKE ''%FESTIVO%'' AND FECHA = :FECHA';
  Query.SQL.Text := 'SELECT COUNT(*) FROM FESTIVO WHERE FECHAFESTIVO = :FECHA';
  for I:=1 to 31 do
  begin
    Query.Close;
    Query.Params[0].AsDateTime := Fecha;
    Query.Open;
    Texto := Dias[DayOfWeek(Fecha)];
    if Query.Fields[0].AsInteger > 0 then
      ListaFestivos.Add(IntToStr(HeaderControl1.Sections[I].Index));
    if Texto = 'D' then
      ListaFestivos.Add(IntToStr(HeaderControl1.Sections[I].Index));
    HeaderControl1.Sections[I].Text :=  Texto;
    HeaderControl2.Sections[I].Text :=  Texto;
    Fecha := Fecha + 1;
    try
      DecodeDate(tdMemFiltroFecha.AsDateTime,Year, Month, Day);
      Day := I;
      EncodeDate(Year,Month,Day);
    except
      ListaFinalMes.Add(IntToStr(HeaderControl1.Sections[I].Index));
    end;
  end;
  Query.Free;
end;

procedure TFGenerarProgramacion.HeaderControl1DrawSection(
  HeaderControl: THeaderControl; Section: THeaderSection;
  const Rect: TRect; Pressed: Boolean);
var I: Integer;
    Encontrado: Boolean;
begin
  with HeaderControl.Canvas do
  begin
    Encontrado := False;
    for I := 0 to ListaFestivos.Count - 1 do
      if ListaFestivos[I] = IntToStr(Section.Index) then
      begin
        Encontrado := True;
        Break;
      end;
    if Encontrado then
      Font.Color := clRed;
    TextOut(Rect.Left + Font.Size, Rect.Top + 2, Section.Text)
  end;
end;

procedure TFGenerarProgramacion.tdMemFiltroFechaChange(Sender: TField);
begin
  if (Sender.Text <> '') then
  begin
    GenerarDiasMes(Sender.AsDateTime);
    if (tdMemFiltrocodigoprogramacion.AsString <> '') then
    begin
      if UpperCase(tdMemFiltroTipoProgramacion.AsString) = 'P' then
      begin
        qCalendarioProgramacion.Close;
        qCalendarioProgramacion.Open;
        dbgCalendarioEmpleado.Repaint;
      end
      else
      begin
        qCalendarioProgramacionGrupo.Close;
        qCalendarioProgramacionGrupo.Open;
        dbgCalendarioGrupo.Repaint;
      end;
    end;
  end;
end;

procedure TFGenerarProgramacion.FormCreate(Sender: TObject);
var cad:string;
begin
  inherited;
  ListaFestivos := TStringList.Create;
  ListaFestivos.Duplicates := dupIgnore;
  ListaFestivos.Sorted := True;
  ListaFinalMes := TStringList.Create;
  ListaFinalMes.Duplicates := dupIgnore;
  ListaFinalMes.Sorted := True;
  CreandoProgramacion := False;
  try
    ConsDll.RefrescarVariables;
  except
    Exit;
  end;
  qOdtPermisos.Close;
  qOdtPermisos.ParamByName('CODIGOUSUARIO').AsInteger:=VarCodigoUsuario;
  qOdtPermisos.Open;
  qProgramacion.Close;
  qOdtPermisos.First;
  cad:='';
  if qOdtPermisos.RecordCount>0 then
  begin
    qProgramacion.Sql.Add('AND P.CODIGOADMINISTRATIVO IN');
    while not qOdtPermisos.Eof do
    begin
      cad:=Cad+ qOdtPermisos.fieldbyname('CODIGOADMINISTRATIVO').AsString+',';
      qOdtPermisos.Next;
    end;
    cad:='('+copy(cad,1,length(cad)-1)+')';
    qProgramacion.Sql.Add(cad);
  end
  else
  Begin
    qProgramacion.Sql.Add('AND P.CODIGOADMINISTRATIVO IN (0)');
  End;

  qProgramacion.Sql.Add('ORDER BY NOMBREPROGRAMACION');
  qProgramacion.Open;
end;

procedure TFGenerarProgramacion.FormDestroy(Sender: TObject);
begin
  ListaFestivos.Free;
  ListaFinalMes.Free;
  if FQRProgramacionGrupo<>nil then
  begin
    FQRProgramacionGrupo.Free;
    FQRProgramacionGrupo:=nil;
  end;
  if FQRProgramacionGrupoEmpleado<>nil then
  begin
    FQRProgramacionGrupoEmpleado.Free;
    FQRProgramacionGrupoEmpleado:=nil;
  end;
  inherited;
end;

procedure TFGenerarProgramacion.dbgCalendarioEmpleadoGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var I: Integer;
    Encontrado: Boolean;
begin
  inherited;
  Encontrado := False;
  for I := 0 to ListaFestivos.Count - 1 do
    if Field.FieldName = dbgCalendarioEmpleado.Columns[StrToInt(ListaFestivos[I]) + 1].Field.FullName then
    begin
      Encontrado := True;
      Break;
    end;
    if Encontrado then
      Background := clRed;

    Encontrado := False;
    for I := 0 to ListaFinalMes.Count - 1 do
     if Field.FieldName = dbgCalendarioEmpleado.Columns[StrToInt(ListaFinalMes[I]) + 1].Field.FullName then
      begin
        Encontrado := True;
        Break;
      end;
    if Encontrado then
      Background := clBlack;

    if Field.AsString = '0' then
      Background := clBlue;

end;

procedure TFGenerarProgramacion.sbtGenerarProgramacionClick(Sender: TObject);
//Elimina los empleados actuales de la programación
procedure EliminarEmpleados;
var Query: TQuery;
begin
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('DELETE FROM CALENDARIOPROGRAMACION');
  Query.SQL.Add('WHERE CODIGOPROGRAMACION = ' + tdMemFiltrocodigoprogramacion.AsString);
  Query.SQL.Add('AND FECHA = TO_DATE(''' + FormatoFecha(tdMemFiltroFecha) + ''',''MM/DD/YYYY'')');
  Query.ExecSQL;
  Query.Free;
end;

//Elimina los grupos actuales de la programación
procedure EliminarGrupos;
var Query: TQuery;
begin
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('DELETE FROM CALENDARIOPROGRAMACIONGRUPO');
  Query.SQL.Add('WHERE CODIGOPROGRAMACION = ' + tdMemFiltrocodigoprogramacion.AsString);
  Query.SQL.Add('AND FECHA = TO_DATE(''' + FormatoFecha(tdMemFiltroFecha) + ''',''MM/DD/YYYY'')');
  Query.ExecSQL;
  Query.Free;
end;

function DiaDescansoActual(DiaDescanso: Integer; FechaDescanso: TDateTime; DireccionRotacion: Integer): Integer;
var Agno1, Agno2, Mes1, Mes2, I, Limite: Integer;
//    Query: TQuery;
begin
  Result := DiaDescanso;
  DecodeDate(tdMemFiltroFecha.AsDateTime, Year, Month, Day);
  Agno1 := Year;
  Mes1  := Month;
  DecodeDate(FechaDescanso, Year, Month, Day);
  Agno2 := Year;
  Mes2  := Month;
  Limite := (Agno1 - Agno2)*12 + (Mes1 - Mes2);
  if Limite<0 then
  begin
    DireccionRotacion:=-DireccionRotacion;
    Limite:=-Limite;
  end;

  for I:=1 to Limite do
  begin
    Result := Result + DireccionRotacion;
    if (Result >= 8) then Result:=1;
    if (Result <= 0) then Result:=7;
  end;
end;

//Inserta los empleados pertenecientes a la programación seleccionada
procedure InsertarEmpleados;
begin
  qCalendarioProgramacion.Close;
  qCalendarioProgramacion.Open;
  qProgramacionEmpleado.Close;
  qProgramacionEmpleado.Open;
  if qProgramacionEmpleado.Fields[0].AsString = '' then
    raise Exception.Create('Esta programación no tiene ningún empleado. Por favor revise los datos.');
  while not qProgramacionEmpleado.Eof do
  begin
    if qCalendarioProgramacion.State in [dsInsert] then
      qCalendarioProgramacion.Cancel;
    qCalendarioProgramacion.Insert;
    qCalendarioProgramacionCODIGOEMPLEADO.AsString := qProgramacionEmpleadoCODIGOEMPLEADO.AsString;
    qCalendarioProgramacionFECHA.AsString := tdMemFiltroFecha.AsString;
    qCalendarioProgramacionCODIGOProgramacion.AsString := tdMemFiltrocodigoprogramacion.AsString;
    qCalendarioProgramacion.Post;
    qProgramacionEmpleado.Next;
  end;
  qProgramacionEmpleado.Close;
  qProgramacionEmpleado.Open;
end;

//Inserta los grupos pertenecientes a la programación seleccionada
procedure InsertarGrupos;
begin
  qProgramacionGrupo.Close;
  qProgramacionGrupo.Open;
  if qProgramacionGrupo.Fields[0].AsString = '' then
    raise Exception.Create('Esta programación no tiene ningún grupo de trabajo. Por favor revise los datos.');
  while not qProgramacionGrupo.Eof do
  begin
    qCalendarioProgramacionGrupo.Insert;
    qCalendarioProgramacionGrupoCODIGOADMINISTRATIVO.AsString := qProgramacionGrupoCODIGOADMINISTRATIVO.AsString;
    qCalendarioProgramacionGrupoCODIGOGRUPOTRABAJO.AsString := qProgramacionGrupoCODIGOGRUPOTRABAJO.AsString;
    qCalendarioProgramacionGrupoFECHA.AsString := tdMemFiltroFecha.AsString;
    qCalendarioProgramacionGrupoCODIGOPROGRAMACION.AsString := tdMemFiltrocodigoprogramacion.AsString;
    qCalendarioProgramacionGrupo.Post;
    qProgramacionGrupo.Next;
  end;
  qProgramacionGrupo.Close;
  qProgramacionGrupo.Open;
end;

function DiaProgramacion(Dia: String): string;
begin
  if Dia = 'D' then
    Result := '0'
  else
    Result := Dia;
end;

//Generar la programación de los turnos   para un empleado
procedure GenerarProgramacionEmpleado;
var DireccionRotacion,PosicionRotacion: Integer;
    I,J,K,L,DiaActual, DiaDescanso, MaximoDia, UltimoDescanso: Integer;
    Rotacion,RotacionEmpleado: string;
    FechaDescanso,FechaActual:TDateTime;
begin
  if (qProgramacionDIRECCIONROTACION.Asstring<>'') and
   (qProgramacionROTACION.AsString<>'') then
  begin
    DireccionRotacion := qProgramacionDIRECCIONROTACION.AsInteger;
    Rotacion          := qProgramacionROTACION.AsString;
    qCalendarioProgramacion.Close;
    qCalendarioProgramacion.Open;
    qProgramacionEmpleado.Close;
    qProgramacionEmpleado.Open;
    qProgramacionEmpleado.First;
    qCalendarioProgramacion.First;
    while not qProgramacionEmpleado.Eof do
    begin
//      try
        PosicionRotacion:=0;
        if (qProgramacionEmpleadoPOSICIONROTACION.AsString<>'') and (DireccionRotacion in [0,2])then
        begin
          PosicionRotacion  := qProgramacionEmpleadoPOSICIONROTACION.AsInteger;
        end;
        DiaDescanso := DiaDescansoActual(qProgramacionEmpleado.FieldByName('DIADESCANSO').AsInteger,
                       qProgramacionEmpleado.FieldByName('FECHADESCANSO').AsDateTime,
                       DireccionRotacion);
        FechaDescanso:=qProgramacionEmpleadoFECHADESCANSO.AsDateTime;
        if not qCalendarioProgramacion.Locate('CODIGOEMPLEADO',qProgramacionEmpleadoCODIGOEMPLEADO.AsString,[]) then
        begin
          Application.MessageBox(pchar('No se encuentra el empleado '+qProgramacionEmpleadoNOMBREEMPLEADO.asstring),'error',MB_OK);
          break;
        end;
        qCalendarioProgramacion.Edit;
        qCalendarioProgramacionDIADESCANSO.AsInteger := DiaDescanso;
        MaximoDia := 31;
        for I := 0 to ListaFinalMes.Count - 1 do
        begin
          if MaximoDia > (StrToInt(ListaFinalMes[I]) - 1) then
            MaximoDia := StrToInt(ListaFinalMes[I]) - 1;
        end;
        UltimoDescanso:=MaximoDia;
        DecodeDate(tdMemFiltroFecha.AsDateTime,Year,Month,Day);
        if DireccionRotacion<>2 then
        begin
          L:=1;
          for I := 1 to MaximoDia do
          begin
            FechaActual:=EncodeDate(Year,Month,I);
            if DiaDescanso = DiaDelphi(DayOfWeek(FechaActual)) then
            begin
              J := Length(Rotacion);
              if PosicionRotacion>0 then
              begin
                K:= trunc(FechaActual) - trunc(FechaDescanso);
                L:=K mod J;
                K:=PosicionRotacion + L ;
                if K>J then K:=K-J;
                if K<=0 then K:=K+J;
                L:=K+1;
                if L>J then L:=L-J;
                if L<0 then L:=L+J;
                J:=K;
              end;
              DiaActual := I;
              UltimoDescanso := I;
              while (J > 0) and (DiaActual > 0) do
              begin
                qCalendarioProgramacion.FieldByName('D'+IntToStr(DiaActual)).AsString := DiaProgramacion(Rotacion[J]);
                DiaActual := DiaActual - 1;
                J := J - 1;
              end;
            end;
          end;
          J:=L;

          for DiaActual := UltimoDescanso + 1 to MaximoDia do
          begin
            qCalendarioProgramacion.FieldByName('D'+IntToStr(DiaActual)).AsString := DiaProgramacion(Rotacion[J]);
            Inc(J);
            if J > Length(Rotacion) then
              break;
          end;
        end
        else
        begin
        //Actualizar posicion rotacion a la fecha actual
          J := Length(Rotacion);
          FechaActual:=EncodeDate(Year,Month,1);
          K:= trunc(FechaActual) - trunc(FechaDescanso);
          L:=K mod J;
          K:=PosicionRotacion + L ;

          if K>J then K:=K-J;
          if K<=0 then K:=K+J;
//          showmessage(inttostr(j)+','+datetimetostr(fechaactual)+','+datetimetostr(fechadescanso)+','+inttostr(posicionrotacion)+','+inttostr(k));
          PosicionRotacion:=k;
        //cambiar posicion rotación y agregar lo que falta
          RotacionEmpleado:=copy(rotacion,PosicionRotacion,length(rotacion)-PosicionRotacion+1)
            +copy(rotacion,1,PosicionRotacion-1);
          RotacionEmpleado:=RotacionEmpleado +copy(RotacionEmpleado,1,MaximoDia-length(rotacion));//cambio la rotacion para que empiece desde la posicion rotación
          for i := 1 to MaximoDia do
          begin
            qCalendarioProgramacion.FieldByName('D'+IntToStr(i)).AsString := DiaProgramacion(RotacionEmpleado[i]);
          end;
        end;
        qCalendarioProgramacionCODIGOESTADOPROGRAMACION.AsString := 'GEN';
        qCalendarioProgramacion.Post;
        qCalendarioProgramacion.Next;
        qProgramacionEmpleado.Next;
//      except
//        break;
//      end;
    end;
  end;
end;

// genera la programación de turnos a grupos de trabajo
procedure GenerarProgramacionGrupo;
var DireccionRotacion,PosicionRotacion: Integer;
    I,J,K,L,DiaActual, DiaDescanso, MaximoDia, UltimoDescanso: Integer;
    Rotacion,RotacionEmpleado: string;
    FechaDescanso,FechaActual:TDateTime;
begin
  if (qProgramacionDIRECCIONROTACION.Asstring<>'') and
   (qProgramacionROTACION.AsString<>'') then
  begin
    DireccionRotacion := qProgramacionDIRECCIONROTACION.AsInteger;
    Rotacion          := qProgramacionROTACION.AsString;
    qCalendarioProgramacionGrupo.Close;
    qCalendarioProgramacionGrupo.Open;
    qProgramacionGrupo.Close;
    qProgramacionGrupo.Open;
    qProgramacionGrupo.First;
//    qCalendarioProgramacionGrupo.First;
    while not qProgramacionGrupo.Eof do
    begin
// cambios -inicio
      PosicionRotacion:=0;
      if (qProgramacionGrupoPOSICIONROTACION.AsString<>'') and (DireccionRotacion in [0,2])then
      begin
        PosicionRotacion  := qProgramacionGrupoPOSICIONROTACION.AsInteger;
      end;
// cambios -fin
      DiaDescanso := DiaDescansoActual(qProgramacionGrupo.FieldByName('DIADESCANSO').AsInteger,
                     qProgramacionGrupo.FieldByName('FECHADESCANSO').AsDateTime,
                     DireccionRotacion);
      FechaDescanso:=qProgramacionGrupoFECHADESCANSO.AsDateTime;

      if qCalendarioProgramacionGrupo.Locate('CODIGOADMINISTRATIVO;CODIGOGRUPOTRABAJO',VARARRAYOF(
      [qProgramacionGrupoCODIGOADMINISTRATIVO.AsString, qProgramacionGrupoCODIGOGRUPOTRABAJO.AsString]),[]) then
      begin
        qCalendarioProgramacionGrupo.Edit;
        qCalendarioProgramacionGrupoDIADESCANSO.AsInteger := DiaDescanso;
        MaximoDia := 31;
        for I := 0 to ListaFinalMes.Count - 1 do
        begin
          if MaximoDia > (StrToInt(ListaFinalMes[I]) - 1) then
            MaximoDia := StrToInt(ListaFinalMes[I]) - 1;
        end;
        UltimoDescanso:=MaximoDia;
        DecodeDate(tdMemFiltroFecha.AsDateTime,Year,Month,Day);
        if DireccionRotacion<>2 then
        begin
          L:=1;
          for I := 1 to MaximoDia do
          begin
            FechaActual:=EncodeDate(Year,Month,I);
            if DiaDescanso = DiaDelphi(DayOfWeek(FechaActual)) then
            begin
              J := Length(Rotacion);
              if PosicionRotacion>0 then
              begin
                K:= trunc(FechaActual) - trunc(FechaDescanso);
                L:=K mod J;
                K:=PosicionRotacion + L ;
                if K>J then K:=K-J;
                if K<=0 then K:=K+J;
                L:=K+1;
                if L>J then L:=L-J;
                if L<0 then L:=L+J;
                J:=K;
              end;
              DiaActual := I;
              UltimoDescanso := I;
              while (J > 0) and (DiaActual > 0) do
              begin
                qCalendarioProgramacionGrupo.FieldByName('D'+IntToStr(DiaActual)).AsString := DiaProgramacion(Rotacion[J]);
                DiaActual := DiaActual - 1;
                J := J - 1;
              end;
            end;
          end;
          J:=L;

          for DiaActual := UltimoDescanso + 1 to MaximoDia do
          begin
            qCalendarioProgramacionGrupo.FieldByName('D'+IntToStr(DiaActual)).AsString := DiaProgramacion(Rotacion[J]);
            Inc(J);
            if J > Length(Rotacion) then
              break;
          end;
        end
        else
        begin
        //Actualizar posicion rotacion a la fecha actual
          J := Length(Rotacion);
          FechaActual:=EncodeDate(Year,Month,1);
          K:= trunc(FechaActual) - trunc(FechaDescanso);
          L:=K mod J;
          K:=PosicionRotacion + L ;

          if K>J then K:=K-J;
          if K<=0 then K:=K+J;
  //          showmessage(inttostr(j)+','+datetimetostr(fechaactual)+','+datetimetostr(fechadescanso)+','+inttostr(posicionrotacion)+','+inttostr(k));
          PosicionRotacion:=k;
        //cambiar posicion rotación y agregar lo que falta
          RotacionEmpleado:=copy(rotacion,PosicionRotacion,length(rotacion)-PosicionRotacion+1)
            +copy(rotacion,1,PosicionRotacion-1);
          RotacionEmpleado:=RotacionEmpleado +copy(RotacionEmpleado,1,MaximoDia-length(rotacion));//cambio la rotacion para que empiece desde la posicion rotación
          for i := 1 to MaximoDia do
          begin
            qCalendarioProgramacionGrupo.FieldByName('D'+IntToStr(i)).AsString := DiaProgramacion(RotacionEmpleado[i]);
          end;
        end;
        qCalendarioProgramacionGrupoCODIGOESTADOPROGRAMACION.AsString := 'GEN';
        qCalendarioProgramacionGrupo.Post;
        qProgramacionGrupo.Next;
      end
      else
      begin
        showmessage('No se encontró el grupo de trabajo '+qProgramacionGrupoNOMBREGRUPOTRABAJO.AsString);
      end;
    end;
  end
  else
  begin
    Application.MessageBox(PChar('La programación debe tener definidos Los campos Rotación'+
    char(13)+'y Dirección de Rotación para ser generada'),'Advertencia!',MB_OK+MB_ICONWARNING);
  end;
end;

begin
  if (tdMemFiltroFecha.AsString <> '') and (tdMemFiltrocodigoprogramacion.AsString <> '') then
  begin
    case Notebook1.PageIndex of
      0:
      begin
        if UpperCase(qProgramacionCODIGOTIPOPROGRAMACION.AsString)='P' then
        begin
          EliminarEmpleados;
          InsertarEmpleados;
          GenerarProgramacionEmpleado;
          qCalendarioProgramacion.Close;
          qCalendarioProgramacion.Open;
        end;
      end;
      1:
      begin
        if UpperCase(qProgramacionCODIGOTIPOPROGRAMACION.AsString)='G' then
        begin
          CreandoProgramacion := True;
          EliminarGrupos;
          InsertarGrupos;
          GenerarProgramacionGrupo;
          qProgramacionEmpleado.Close;
          qProgramacionEmpleado.Open;
          EliminarEmpleados;
          InsertarEmpleados;
          GenerarProgramacionEmpleado;
          qCalendarioProgramacion.Close;
          CreandoProgramacion := False; 
          qCalendarioProgramacionGrupo.Close;
          qCalendarioProgramacionGrupo.Open;
        end;
      end;
    end;
    AsignarEstadoProgramacion('GEN');
  end;
end;

procedure TFGenerarProgramacion.qProgramacionAfterScroll(DataSet: TDataSet);
begin
  if (qProgramacionCODIGOTIPOPROGRAMACION.AsString= 'P') then
    Notebook1.PageIndex := 0
  else
    Notebook1.PageIndex := 1;
end;

procedure TFGenerarProgramacion.dbgCalendarioGrupoGetCellParams(
  Sender: TObject; Field: TField; AFont: TFont; var Background: TColor;
  Highlight: Boolean);
var I: Integer;
    Encontrado: Boolean;
begin
  inherited;
  Encontrado := False;
  for I := 0 to ListaFestivos.Count - 1 do
    if Field.FieldName = dbgCalendarioGrupo.Columns[StrToInt(ListaFestivos[I]) + 1].Field.FullName then
    begin
      Encontrado := True;
      Break;
    end;
    if Encontrado then
      Background := clRed;

    Encontrado := False;
    for I := 0 to ListaFinalMes.Count - 1 do
     if Field.FieldName = dbgCalendarioGrupo.Columns[StrToInt(ListaFinalMes[I]) + 1].Field.FullName then
      begin
        Encontrado := True;
        Break;
      end;
    if Encontrado then
      Background := clBlack;

    if Field.AsString = '0' then
      Background := clBlue;

end;
function TFGenerarProgramacion.DiaDelphi(Dia: Integer): Integer;
begin
  Result := Dia - 1;
  if Result <= 0 then
    Result := 7;
end;

procedure TFGenerarProgramacion.qCalendarioProgramacionGrupoAfterPost(
  DataSet: TDataSet);
  var Query: TQuery;
      I: Integer;
begin
  inherited;
  if not CreandoProgramacion then
  begin
    Query := TQuery.Create(Application);
    Query.DatabaseName := 'BaseDato';
    Query.SQL.Add('UPDATE CALENDARIOPROGRAMACION CP SET D1 =:D1, D2=:D2, D3=:D3, D4=:D4, D5=:D5,');
    Query.SQL.Add('D6=:D6, D7=:D7, D8=:D8, D9=:D9, D10=:D10, D11=:D11, D12=:D12, D13=:D13, D14=:D14,');
    Query.SQL.Add('D15=:D15, D16=:D16, D17=:D17, D18=:D18, D19=:D19, D20=:D20, D21=:D21, D22=:D22,');
    Query.SQL.Add('D23=:D23, D24=:D24, D25=:D25, D26=:D26, D27=:D27, D28=:D28, D29=:D29, D30=:D30,');
    Query.SQL.Add('D31=:D31, CODIGOESTADOPROGRAMACION=:CODIGOESTADOPROGRAMACION');
    Query.SQL.Add('WHERE CP.CODIGOEMPLEADO IN ( SELECT CODIGOEMPLEADO FROM PROGRAMACIONEMPLEADO PE');
    Query.SQL.Add('WHERE PE.CODIGOPROGRAMACION = CP.CODIGOPROGRAMACION');
    Query.SQL.Add('AND PE.CODIGOADMINISTRATIVO = :CODIGOADMINISTRATIVO');
    Query.SQL.Add('AND PE.CODIGOGRUPOTRABAJO =:CODIGOGRUPOTRABAJO )');
    Query.SQL.Add('AND CP.CODIGOPROGRAMACION =:CODIGOPROGRAMACION');
    Query.SQL.Add('AND CP.FECHA =:FECHA');
    with DataSet do
    begin
      for I:=1 to 31 do
        Query.ParamByName('D'+IntToStr(I)).AsString := FieldByName('D'+IntToStr(I)).AsString;

      Query.ParamByName('FECHA').AsString := FormatoFecha(FieldByName('FECHA'));
      Query.ParamByName('CODIGOPROGRAMACION').AsString := FieldByName('CODIGOPROGRAMACION').AsString;
      Query.ParamByName('CODIGOADMINISTRATIVO').AsString := FieldByName('CODIGOADMINISTRATIVO').AsString;
      Query.ParamByName('CODIGOGRUPOTRABAJO').AsString := FieldByName('CODIGOGRUPOTRABAJO').AsString;
      Query.ParamByName('CODIGOESTADOPROGRAMACION').AsString := FieldByName('CODIGOESTADOPROGRAMACION').AsString;
    end;
    Query.ExecSQL;
    Query.Free;
  end;
end;


procedure TFGenerarProgramacion.qCalendarioProgramacionAfterOpen(
  DataSet: TDataSet);
begin
  if DataSet.RecordCount>0 then
  begin
    sbtImprimirProgramacion.Enabled:=True;
    if (DataSet.FieldByName('CODIGOESTADOPROGRAMACION').AsString = 'BLO') then
    begin
      chbBloquearProgramacion.Checked:=True;
      if (VarCodigoUsuario=0 )or (tdMemFiltroREABRIR.AsString='S') then
      begin
        chbBloquearProgramacion.Enabled:=True;
        sbtGenerarProgramacion.Enabled := True;
        dbgCalendarioEmpleado.ReadOnly := False;
      end
      else
      begin
        chbBloquearProgramacion.Enabled:=False;
        sbtGenerarProgramacion.Enabled := False;
        dbgCalendarioEmpleado.ReadOnly := True;
      end;
    end
    else
    begin
      chbBloquearProgramacion.Checked:=False;
      chbBloquearProgramacion.Enabled:=True;
      sbtGenerarProgramacion.Enabled := True;
      dbgCalendarioEmpleado.ReadOnly := False;
    end;
  end
  else
  begin
    sbtGenerarProgramacion.Enabled := True;
  end;
end;

procedure TFGenerarProgramacion.sbtImprimirProgramacionClick(Sender: TObject);
procedure AjustarQRLabel(var qrLabel:TQRLabel);
begin
  qrLabel.AutoSize := False;
  qrLabel.WordWrap := False;
  qrLabel.Height := 16;
  qrLabel.Font.Size := 7;
  qrLabel.Font.Name := 'Arial';
  qrLabel.Alignment:= taLeftJustify;
end;
var i:Integer;
    Ctl: TControl;
    qrdbDia: TQRDBText;
    qrlDia:tqrLabel;
    qDatos:TQuery;
    qrLabel:TQRLabel;
begin
  if (tdMemFiltroFecha.AsString <> '') and (tdMemFiltrocodigoprogramacion.AsString <> '') then
  begin
    qDatos:=TQuery.Create(Application);
    qDatos.DatabaseName:='BaseDato';
    qDatos.SQL.Add('SELECT ''TURNO ''||TO_CHAR(CODIGOTURNO)||'' ''||');
    qDatos.SQL.Add('TO_CHAR(FECHADESDE,''HH24'')||''-''||TO_CHAR(FECHAHASTA,''HH24'') ');
    qDatos.SQL.Add('AS TURNO FROM TIPOTURNODETALLE');
    qDatos.SQL.Add('WHERE CODIGOTIPOTURNO='+qProgramacionCODIGOTIPOTURNOPROGRAMACION.asstring);
    qDatos.SQL.Add('AND CODIGOTURNO>0');
    qDatos.Open;
    case Notebook1.PageIndex of
      0:
      begin
        qCalendarioProgramacion.Close;
        qCalendarioProgramacion.Open;
        FQRProgramacionEmpleado:=TFQRProgramacionEmpleado.Create(Application);
        with FQRProgramacionEmpleado do
        begin
          Caption:=Self.Caption;
          qrTitulo.Caption:=qProgramacionTITULOPROGRAMACION.AsString;
          qrdbCia.DataSet:=qProgramacion;
          QuickRep.DataSet := qCalendarioProgramacion;
          qrdbFechaProgramacion.DataSet := tdMemFiltro;
          qrdbNombreProgramacion.DataSet := tdMemFiltro;
          qrdbNombreEmpleado.DataSet:= qCalendarioProgramacion;
          //turnos
          i:=0;
          while not qDatos.Eof do
          begin
            qrLabel := TQRLabel.Create(BandaTitulo);
            AjustarQRLabel(qrLabel);
            qrLabel.Top := 43 + I*25;
            qrLabel.Left := 753;
            qrLabel.Width := 80;
            qrLabel.Parent := BandaTitulo;
            qrLabel.Caption := qDatos.FieldByName('TURNO').AsString;
            Inc(I);
            if I > 5 then Break;
            qDatos.Next;
          end;
          qDatos.Free;
          with DetailBand1 do
          begin
            for i:=0 to ControlCount -1 do
            begin
              Ctl:=Controls[i];
              if not (Ctl is TQRDBText) then continue;
              if ((Ctl.Tag >0)and (Ctl.Tag <32)) then
              begin
                qrdbDia:=Ctl as TQRDBText;
                qrdbDia.DataSet:= qCalendarioProgramacion;
                if (ListaFestivos.IndexOf(inttostr(qrdbDia.tag))>=0) then
                  qrdbDia.Color:=clred;
                if (ListaFinalMes.IndexOf(inttostr(qrdbDia.tag))>=0) then
                  qrdbDia.Color:=clWhite;
              end;
            end;
          end;
          with ColumnHeaderBand1 do
          begin
            for i:=0 to ControlCount -1 do
            begin
              Ctl:=Controls[i];
              if not(Ctl is TQRLabel) then continue;
              if ((Ctl.Tag >0)and (Ctl.Tag <63)) then
              begin
                qrlDia:=Ctl as TQRLabel;
                if qrlDia.Tag<32 then
                begin
                  qrlDia.Caption:=HeaderControl1.Sections[qrlDia.Tag].Text;
                  if ListaFestivos.IndexOf(inttostr(qrlDia.tag))>=0 then
                    qrlDia.Color:=clred;
                  if ListaFinalMes.IndexOf(inttostr(qrlDia.tag))>=0 then
                  begin
                    qrlDia.Color:=clWhite;
                    qrlDia.Caption:='';
                  end;
                end
                else
                begin
                  if ListaFestivos.IndexOf(inttostr(qrlDia.tag-31))>=0then
                    qrlDia.Color:=clred;
                  if ListaFinalMes.IndexOf(inttostr(qrlDia.tag-31))>=0 then
                  begin
                    qrlDia.Color:=clWhite;
                    qrlDia.Caption:='';
                  end;
                end;
              end;
            end;
          end;
          try
            QuickRep.Preview;
          except
          end;
        end;
      end;
      1:
      begin
        qCalendarioProgramacionGrupo.Close;
        qCalendarioProgramacionGrupo.Open;
        if FQRProgramacionGrupo<>nil then
        begin
          FQRProgramacionGrupo.Free;
          FQRProgramacionGrupo:=nil;
        end;
        FQRProgramacionGrupo:=TFQRProgramacionGrupo.Create(Application);
        with FQRProgramacionGrupo do
        begin
          Caption:=Self.Caption;
          qrTitulo.Caption:=qProgramacionTITULOPROGRAMACION.AsString;
          qrdbCia.DataSet:=qProgramacion;
          QuickRep.DataSet := qCalendarioProgramacionGrupo;
          qrdbFechaProgramacion.DataSet := tdMemFiltro;
          qrdbNombreProgramacion.DataSet := tdMemFiltro;
          qrdbNombreGrupo.DataSet:= qCalendarioProgramacionGrupo;
          //turnos
          i:=0;
          while not qDatos.Eof do
          begin
            qrLabel := TQRLabel.Create(BandaTitulo);
            AjustarQRLabel(qrLabel);
            qrLabel.Top := 43 + I*25;
            qrLabel.Left := 753;
            qrLabel.Width := 80;
            qrLabel.Parent := BandaTitulo;
            qrLabel.Caption := qDatos.FieldByName('TURNO').AsString;
            Inc(I);
            if I > 5 then Break;
            qDatos.Next;
          end;
          qDatos.Free;
          with DetailBand1 do
          begin
            for i:=0 to ControlCount -1 do
            begin
              Ctl:=Controls[i];
              if not (Ctl is TQRDBText) then continue;
              if ((Ctl.Tag >0)and (Ctl.Tag <32)) then
              begin
                qrdbDia:=Ctl as TQRDBText;
                qrdbDia.DataSet:= qCalendarioProgramacionGrupo;
                if (ListaFestivos.IndexOf(inttostr(qrdbDia.tag))>=0) then
                  qrdbDia.Color:=clred;
                if (ListaFinalMes.IndexOf(inttostr(qrdbDia.tag))>=0) then
                  qrdbDia.Color:=clWhite;
              end;
            end;
          end;
          with ColumnHeaderBand1 do
          begin
            for i:=0 to ControlCount -1 do
            begin
              Ctl:=Controls[i];
              if not(Ctl is TQRLabel) then continue;
              if ((Ctl.Tag >0)and (Ctl.Tag <63)) then
              begin
                qrlDia:=Ctl as TQRLabel;
                if qrlDia.Tag<32 then
                begin
                  qrlDia.Caption:=HeaderControl1.Sections[qrlDia.Tag].Text;
                  if (ListaFestivos.IndexOf(inttostr(qrlDia.tag))>=0)then
                    qrlDia.Color:=clred;
                  if (ListaFinalMes.IndexOf(inttostr(qrlDia.tag))>=0)then
                  begin
                    qrlDia.Color:=clWhite;
                    qrlDia.Caption:='';
                  end;
                end
                else
                begin
                  if ListaFestivos.IndexOf(inttostr(qrlDia.tag-31))>=0 then
                    qrlDia.Color:=clred;
                  if ListaFinalMes.IndexOf(inttostr(qrlDia.tag-31))>=0 then
                  begin
                    qrlDia.Color:=clWhite;
                    qrlDia.Caption:='';
                  end;
                end;
              end;
            end;
          end;
        end;
        if FQRProgramacionGrupoEmpleado<>nil then
        begin
          FQRProgramacionGrupoEmpleado.Free;
          FQRProgramacionGrupoEmpleado:=nil;
        end;
        FQRProgramacionGrupoEmpleado:=TFQRProgramacionGrupoEmpleado.Create(Application);
        with FQRProgramacionGrupoEmpleado do
        begin
          Caption:=Self.Caption;
          qGrupoEmpleado.DataSource:=dsMemFiltro;
          qrdbNombreProgramacion.DataSet:=tdMemFiltro;
          qGrupoEmpleado.Close;
          qGrupoEmpleado.Open;
        end;
        try
          QRCompositeReport1.Prepare;
          QRCompositeReport1.Preview;
        finally
        end;
      end;
    end;
  end;
end;

procedure TFGenerarProgramacion.QRCompositeReport1AddReports(Sender: TObject);
begin
  try
    with QRCompositeReport1.Reports do
    begin
      Clear;
      Add(FQRProgramacionGrupo.QuickRep);
      Add(FQRProgramacionGrupoEmpleado.QuickRep);
    end;
  except
  end;
end;

procedure TFGenerarProgramacion.qCalendarioProgramacionDiaSetText(
  Sender: TField; const Text: String);
var valor:string;
begin
  Valor:=Sender.Text;
  if Text <> '' then
  begin
    if length(Text)=1 then
    begin
      if ((pos(Text,tdMemFiltroRotacion.AsString)>0) or (Text[1]='0')) then
        Valor:=Text;
    end;
  end
  else Valor:='';
  Sender.AsString:=Valor;
end;

procedure TFGenerarProgramacion.qCalendarioProgramacionAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  sbtGenerarProgramacion.Enabled := False;
  chbBloquearProgramacion.Enabled := False;
  chbBloquearProgramacion.Checked := False;
  sbtImprimirProgramacion.Enabled:=False;
end;

procedure TFGenerarProgramacion.AsignarEstadoProgramacion(Estado: string);
var Query:TQuery;
begin
  Query := TQuery.Create(Application);
  try
    Query.DatabaseName := 'BaseDato';
    Query.SQL.Add('UPDATE CALENDARIOPROGRAMACION SET CODIGOESTADOPROGRAMACION = '''+Estado+'''');
    Query.SQL.Add('WHERE CODIGOPROGRAMACION = ' + tdMemFiltrocodigoprogramacion.AsString);
    Query.SQL.Add('AND FECHA = TO_DATE(''' + FormatoFecha(tdMemFiltroFecha) + ''',''MM/DD/YYYY'')');
    Query.ExecSQL;
    Query.SQL.Clear;
    Query.SQL.Add('UPDATE CALENDARIOPROGRAMACIONGRUPO SET CODIGOESTADOPROGRAMACION = '''+Estado+'''');
    Query.SQL.Add('WHERE CODIGOPROGRAMACION = ' + tdMemFiltrocodigoprogramacion.AsString);
    Query.SQL.Add('AND FECHA = TO_DATE(''' + FormatoFecha(tdMemFiltroFecha) + ''',''MM/DD/YYYY'')');
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

procedure TFGenerarProgramacion.chbBloquearProgramacionMouseUp(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var cad:string;
begin
  case Notebook1.PageIndex of
    0:
    begin
      if qCalendarioProgramacionCODIGOESTADOPROGRAMACION.AsString='BLO' then
      begin
        cad:='GEN';
      end
      else
      begin
        cad:='BLO';
      end;
      qCalendarioProgramacion.Close;
      AsignarEstadoProgramacion(cad);
      qCalendarioProgramacion.Open;
    end;
    1:
    begin
      if qCalendarioProgramacionGrupoCODIGOESTADOPROGRAMACION.AsString='BLO' then
      begin
        cad:='GEN';
      end
      else
      begin
        cad:='BLO';
      end;
      qCalendarioProgramacionGrupo.Close;
      AsignarEstadoProgramacion(cad);
      qCalendarioProgramacionGrupo.Open;
    end;
  end;
end;

end.
 