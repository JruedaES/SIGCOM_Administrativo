unit uCrearProgramacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UBase, Menus, Db, DBTables, ToolEdit, RXDBCtrl, Spin, RXSplit, Buttons,
  ExtCtrls, StdCtrls, DBCtrls, Mask, Grids, DBGrids,uComunesAdministrativo;

type
  TFCrearProgramacion = class(TFBase)
    Panel2: TPanel;
    Panel4: TPanel;
    DBGridProgramacion: TDBGrid;
    DBNavigator1: TDBNavigator;
    Panel1: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    dbrgTipoProgramacion: TDBRadioGroup;
    DBEdRotacion: TDBEdit;
    dbrgTipoRotacion: TDBRadioGroup;
    DBLookupComboBox1: TDBLookupComboBox;
    Panel3: TPanel;
    Panel5: TPanel;
    Notebook1: TNotebook;
    Panel6: TPanel;
    Panel9: TPanel;
    sbFiltarEmpleado: TSpeedButton;
    DBGridEmpleado: TRxDBGrid;
    RxSplitter1: TRxSplitter;
    Panel7: TPanel;
    sbAsignarEmpleado: TSpeedButton;
    sbDesasignarEmpleado: TSpeedButton;
    RxSplitter2: TRxSplitter;
    Panel8: TPanel;
    DBGridEmpleadoAsignado: TRxDBGrid;
    DBNavigator2: TDBNavigator;
    Panel10: TPanel;
    qProgramacion: TQuery;
    dsProgramacion: TDataSource;
    qTipoProgramacion: TQuery;
    UpdProgramacion: TUpdateSQL;
    qEmpleado: TQuery;
    dsEmpleado: TDataSource;
    dsProgramacionEmpleado: TDataSource;
    UpdProgramacionEmpleado: TUpdateSQL;
    qTipoTurnoProgramacion: TQuery;
    qDiaSemana: TQuery;
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
    dsDiaSemana: TDataSource;
    qGrupo: TQuery;
    qGrupoCODIGOADMINISTRATIVO: TFloatField;
    qGrupoCODIGOGRUPOTRABAJO: TFloatField;
    qGrupoNOMBREGRUPOTRABAJO: TStringField;
    dsGrupo: TDataSource;
    qHorario: TQuery;
    qHorarioCODIGOHORARIOTRABAJO: TFloatField;
    qHorarioNOMBREHORARIOTRABAJO: TStringField;
    dsHorario: TDataSource;
    qProgramacionGrupo: TQuery;
    qProgramacionGrupoCODIGOADMINISTRATIVO: TFloatField;
    qProgramacionGrupoCODIGOGRUPOTRABAJO: TFloatField;
    qProgramacionGrupoDIADESCANSO: TFloatField;
    qProgramacionGrupoFECHADESCANSO: TDateTimeField;
    dsProgramacionGrupo: TDataSource;
    updProgramacionGrupo: TUpdateSQL;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel14: TPanel;
    SpeedButton3: TSpeedButton;
    DBGridGrupo: TRxDBGrid;
    RxSplitter4: TRxSplitter;
    Panel13: TPanel;
    sbAsignarGrupo: TSpeedButton;
    sbDesasignarGrupo: TSpeedButton;
    qProgramacionGrupoNOMBREGRUPOTRABAJO: TStringField;
    qProgramacionGrupoNombreDias: TStringField;
    qProgramacionEmpleadoGrupo: TQuery;
    dsProgramacionEmpleadoGrupo: TDataSource;
    UpdProgramacionEmpleadoGrupo: TUpdateSQL;
    qProgramacionNombreTipoProgramacion: TStringField;
    qProgramacionNombreTipoTurnoProgramacion: TStringField;
    qProgramacionGrupoCODIGOPROGRAMACION: TFloatField;
    gbProgramacion: TGroupBox;
    Label2: TLabel;
    DBEdNombreProgramacion: TDBEdit;
    DBEdCodigoProgramacion: TDBEdit;
    Label1: TLabel;
    gbDiaDescansoEmpleado: TGroupBox;
    DBLookupComboBox2: TDBLookupComboBox;
    gbFechaProgramacionEmpleado: TGroupBox;
    TitleLabel: TPanel;
    seAgnos: TSpinEdit;
    gbPosicionRotacionEmpleado: TGroupBox;
    cbPosicionRotacion: TComboBox;
    qDiaSemanaCODIGODIA: TFloatField;
    qDiaSemanaNOMBREDIA: TStringField;
    qProgramacionEmpleado: TQuery;
    qProgramacionEmpleadoCODIGOEMPLEADO: TFloatField;
    qProgramacionEmpleadoCODIGOPROGRAMACION: TFloatField;
    qProgramacionEmpleadoDIADESCANSO: TFloatField;
    qProgramacionEmpleadoFECHADESCANSO: TDateTimeField;
    qProgramacionEmpleadoNOMBREEMPLEADO: TStringField;
    qProgramacionEmpleadoPOSICIONROTACION: TFloatField;
    qProgramacionEmpleadoNombreDias: TStringField;
    DBDateEdit1: TDBDateEdit;
    Panel17: TPanel;
    Panel18: TPanel;
    DBGridGrupoEmpleadoAsignado: TRxDBGrid;
    DBNavigator4: TDBNavigator;
    Panel19: TPanel;
    sbEditarEmpleadoGrupo: TSpeedButton;
    GroupBox1: TGroupBox;
    DBLookupComboBox3: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    TitleLabel2: TPanel;
    seAgnos2: TSpinEdit;
    DBDateEdit2: TDBDateEdit;
    Panel16: TPanel;
    DBGridGrupoAsignado: TRxDBGrid;
    dbEdTituloProgramacion: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    dbEdCia: TDBEdit;
    qProgramacionCODIGOPROGRAMACION: TFloatField;
    qProgramacionNOMBREPROGRAMACION: TStringField;
    qProgramacionCODIGOTIPOPROGRAMACION: TStringField;
    qProgramacionROTACION: TStringField;
    qProgramacionDIRECCIONROTACION: TFloatField;
    qProgramacionCODIGOTIPOTURNOPROGRAMACION: TFloatField;
    qProgramacionTITULOPROGRAMACION: TStringField;
    qProgramacionCODIGOADMINISTRATIVO: TFloatField;
    EdPosicionRotacionEmpleado: TDBEdit;
    procedure qProgramacionAfterPost(DataSet: TDataSet);
    procedure qProgramacionAfterInsert(DataSet: TDataSet);
    procedure sbFiltarEmpleadoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbAsignarEmpleadoClick(Sender: TObject);
    procedure qProgramacionEmpleadoAfterOpen(DataSet: TDataSet);
    procedure qProgramacionEmpleadoAfterPost(DataSet: TDataSet);
    procedure DBGridEmpleadoGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sbDesasignarEmpleadoClick(Sender: TObject);
    procedure qProgramacionEmpleadoAfterDelete(DataSet: TDataSet);
    procedure qProgramacionAfterScroll(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure qProgramacionEmpleadoAfterInsert(DataSet: TDataSet);
    procedure TitleLabelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure MesClick(Sender: TObject);
    procedure DBDateEdit1Change(Sender: TObject);
    procedure seAgnosChange(Sender: TObject);
    procedure qProgramacionEmpleadoBeforePost(DataSet: TDataSet);
    procedure qProgramacionAfterOpen(DataSet: TDataSet);
    procedure dbrgTipoProgramacionChange(Sender: TObject);
    procedure sbAsignarGrupoClick(Sender: TObject);
    procedure qProgramacionGrupoAfterPost(DataSet: TDataSet);
    procedure qProgramacionGrupoAfterDelete(DataSet: TDataSet);
    procedure qProgramacionGrupoAfterOpen(DataSet: TDataSet);
    procedure DBGridGrupoGetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure sbDesasignarGrupoClick(Sender: TObject);
    procedure TitleLabel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DBDateEdit2Change(Sender: TObject);
    procedure seAgnos2Change(Sender: TObject);
    procedure qProgramacionGrupoAfterInsert(DataSet: TDataSet);
    procedure qProgramacionEmpleadoGrupoAfterPost(DataSet: TDataSet);
    procedure qProgramacionEmpleadoGrupoAfterDelete(DataSet: TDataSet);
    procedure qProgramacionEmpleadoGrupoAfterInsert(DataSet: TDataSet);
    procedure sbEditarEmpleadoGrupoClick(Sender: TObject);
    procedure DBGridGrupoEmpleadoAsignadoDblClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure qProgramacionCODIGOTIPOPROGRAMACIONValidate(Sender: TField);
    procedure qProgramacionEmpleadoAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure cbPosicionRotacionChange(Sender: TObject);
    procedure EdPosicionRotacionEmpleadoChange(Sender: TObject);
    procedure qProgramacionEmpleadoFECHADESCANSOChange(Sender: TField);
    procedure dbrgTipoRotacionClick(Sender: TObject);
    procedure qProgramacionAfterDelete(DataSet: TDataSet);
    procedure qProgramacionEmpleadoDIADESCANSOChange(Sender: TField);
  private
    { Private declarations }
    Lista, ListaEmpleados, ListaGrupos, ListaFiltroGrupos:TStringList;
    Year, Month, Day: Word;
    function ListaTurnosPosibles(Rotacion:String;Fecha:TDateTime;DiaDescanso:integer):TStringList;
    function ListaTodosLosTurnos(Rotacion:String;Fecha:TDateTime):TStringList;    
    function DiaDelphi(Fecha: TDateTime): Integer;
  public
    procedure LimpiarFiltro;
  end;

var
  FCrearProgramacion: TFCrearProgramacion;

implementation

uses uFiltroEmpleado, uProgramacionEmpleadoGrupo, udFiltrarGrupo;

{$R *.DFM}

procedure TFCrearProgramacion.qProgramacionAfterPost(DataSet: TDataSet);
begin
  qProgramacion.ApplyUpdates;
  qProgramacion.CommitUpdates;
end;

procedure TFCrearProgramacion.qProgramacionAfterInsert(DataSet: TDataSet);
var Query: TQuery;
begin
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('SELECT MAX(CODIGOPROGRAMACION) FROM PROGRAMACION');
  Query.Open;
  DataSet.FieldByName('CODIGOPROGRAMACION').AsInteger := Query.Fields[0].AsInteger + 1;
  DataSet.FieldByName('CODIGOTIPOPROGRAMACION').AsString := 'P';
  DataSet.FieldByName('DIRECCIONROTACION').AsString := '1';
  Query.Free;
  Notebook1.Repaint;
end;

procedure TFCrearProgramacion.sbFiltarEmpleadoClick(Sender: TObject);
var Orden:string;
 i:integer;
begin
 FFiltroEmpleado:=TFFiltroEmpleado.Create(self);
 try
   if FFiltroEmpleado.ShowModal=mrOk then
   begin
     Orden:=qEmpleado.SQL[qEmpleado.SQL.Count - 1];
     LimpiarFiltro;
     qEmpleado.SQL.Delete(qEmpleado.SQL.Count - 1);
     for i:=0 to FFiltroEmpleado.ListaFiltro.Count - 1 do
     begin
        if i =0  then
          qEmpleado.SQL.Add('WHERE '+FFiltroEmpleado.ListaFiltro[i])
        else
          qEmpleado.SQL.Add('AND '+FFiltroEmpleado.ListaFiltro[i]);
     end;
     qEmpleado.SQL.Add(Orden);
     qEmpleado.Close;
     qEmpleado.Open;
   end;
  finally
   FFiltroEmpleado.free;
  end;
end;

procedure TFCrearProgramacion.FormCreate(Sender: TObject);
begin
  inherited;
  Lista := TStringList.Create;
  ListaEmpleados := TStringList.Create;
  ListaEmpleados.Duplicates := dupIgnore;
  ListaEmpleados.Sorted := True;
  ListaGrupos := TStringList.Create;
  ListaGrupos.Duplicates := dupIgnore;
  ListaGrupos.Sorted := True;
  ListaFiltroGrupos := TStringList.Create;
  qProgramacion.Open;
  qProgramacionEmpleado.Open;
  qProgramacionCODIGOTIPOPROGRAMACIONValidate(qProgramacionCODIGOTIPOPROGRAMACION);
  qProgramacionGrupo.Open;
end;

procedure TFCrearProgramacion.FormDestroy(Sender: TObject);
begin
  Lista.Free;
  ListaEmpleados.Free;
  ListaGrupos.Free;
  ListaFiltroGrupos.Free;
  inherited;
end;

procedure TFCrearProgramacion.sbAsignarEmpleadoClick(Sender: TObject);
begin
  if qEmpleado.FieldByName('CODIGOEMPLEADO').AsString <> '' then
  begin
    if ListaEmpleados.IndexOf(qEmpleado.FieldByName('CODIGOEMPLEADO').AsString) < 0 then
    begin
      if not (qProgramacionEmpleado.State in [dsInsert]) then
        qProgramacionEmpleado.Insert;
      qProgramacionEmpleado.FieldByName('CODIGOEMPLEADO').AsString := qEmpleado.FieldByName('CODIGOEMPLEADO').AsString;
      qProgramacionEmpleado.FieldByName('CODIGOPROGRAMACION').AsString := qProgramacionCODIGOPROGRAMACION.AsString;
      qProgramacionEmpleado.Post;
      qProgramacionEmpleado.Close;
      qProgramacionEmpleado.Open;
      ListaEmpleados.Add(qEmpleado.FieldByName('CODIGOEMPLEADO').AsString);
      DBGridEmpleado.Repaint;
    end;
  end;
end;

procedure TFCrearProgramacion.qProgramacionEmpleadoAfterOpen(DataSet: TDataSet);
begin
  ListaEmpleados.Clear;
  DataSet.First;
  while not DataSet.Eof do
  begin
    ListaEmpleados.Add(DataSet.FieldByName('CODIGOEMPLEADO').AsString);
    DataSet.Next;
  end;
end;

procedure TFCrearProgramacion.qProgramacionEmpleadoAfterPost(DataSet: TDataSet);
begin
  qProgramacionEmpleado.ApplyUpdates;
  qProgramacionEmpleado.CommitUpdates;
end;

procedure TFCrearProgramacion.DBGridEmpleadoGetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
  var I: Integer;
      Encontrado: Boolean;
begin
  if Field.FieldName = 'CODIGOEMPLEADO' then
  begin
    Encontrado := False;
    for I:=0 to ListaEmpleados.Count - 1 do
    begin
      if ListaEmpleados[I] = qEmpleado.FieldByName('CODIGOEMPLEADO').AsString then
      begin
       Encontrado := True;
       Break;
      end;
    end;
    if Encontrado then
    begin
     Background := clRed;
     AFont.Color := clWhite;
    end;
 end;
end;

procedure TFCrearProgramacion.sbDesasignarEmpleadoClick(Sender: TObject);
begin
  if qProgramacionEmpleado.FieldByName('CODIGOEMPLEADO').AsString <> '' then
  begin
    try
      ListaEmpleados.Delete(ListaEmpleados.IndexOf(qProgramacionEmpleado.FieldByName('CODIGOEMPLEADO').AsString));
    except
    end;
    qProgramacionEmpleado.Delete;
    DBGridEmpleado.Repaint;
  end;
end;

procedure TFCrearProgramacion.qProgramacionEmpleadoAfterDelete(DataSet: TDataSet);
begin
  qProgramacionEmpleado.ApplyUpdates;
  qProgramacionEmpleado.CommitUpdates;
end;

procedure TFCrearProgramacion.qProgramacionAfterScroll(DataSet: TDataSet);
begin
  if (qProgramacionCODIGOTIPOPROGRAMACION.AsString= 'P') then
  begin
    Notebook1.PageIndex := 1;
    case qProgramacionDIRECCIONROTACION.AsInteger of
      0:
      begin
        DBGridEmpleadoAsignado.Columns[2].Visible:=true;
        gbDiaDescansoEmpleado.Visible:=true;
        DBGridEmpleadoAsignado.Columns[4].Visible:=true;
        gbPosicionRotacionEmpleado.Visible:=true;
      end;
      -1,1:
      begin
        DBGridEmpleadoAsignado.Columns[2].Visible:=true;
        gbDiaDescansoEmpleado.Visible:=true;
        DBGridEmpleadoAsignado.Columns[4].Visible:=false;
        gbPosicionRotacionEmpleado.Visible:=false;
      end;
      2:
      begin
        DBGridEmpleadoAsignado.Columns[2].Visible:=false;
        gbDiaDescansoEmpleado.Visible:=false;
        DBGridEmpleadoAsignado.Columns[4].Visible:=true;
        gbPosicionRotacionEmpleado.Visible:=true;
      end;
    end;
  end
  else
  begin
    Notebook1.PageIndex := 2;
  end;
end;

procedure TFCrearProgramacion.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
     if (ActiveControl is TDBLookupComboBox) then
     begin
       if not (ActiveControl as TDBLookupComboBox).ListVisible then
          Perform(wm_NextDLGCTL, 0, 0);
     end
     else
     begin
       Perform(wm_NextDLGCTL, 0, 0);
       key := #0;
     end
end;

procedure TFCrearProgramacion.qProgramacionEmpleadoAfterInsert(DataSet: TDataSet);
begin
  DecodeDate(Now, Year, Month, Day);
  Day := 1;
  qProgramacionEmpleadoFECHADESCANSO.AsDateTime := StrToDate(IntToStr(Day) + '/' + IntToStr(Month) + '/' + IntToStr(Year));
end;

procedure TFCrearProgramacion.TitleLabelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Punto: TPoint;
begin
 Punto:=TitleLabel.ClientToScreen(Classes.Point(X + 10, 10));
 pmMeses.Popup(punto.x+10, punto.y);
end;

procedure TFCrearProgramacion.MesClick(Sender: TObject);
begin
  case Notebook1.PageIndex of
  1: begin
       qProgramacionEmpleado.Edit;
       if DBDateEdit1.Date = 0 then
         DBDateEdit1.Date := Now;
       DecodeDate(DBDateEdit1.Date, Year, Month, Day);
       Month := (Sender as TMenuItem).Tag;
       DBDateEdit1.Date := StrToDate(IntToStr(Day) + '/' + IntToStr(Month) + '/' + IntToStr(Year));
     end;
  2: begin
       qProgramacionGrupo.Edit;
       if DBDateEdit2.Date = 0 then
        DBDateEdit2.Date := Now;
       DecodeDate(DBDateEdit2.Date, Year, Month, Day);
       Month := (Sender as TMenuItem).Tag;
       DBDateEdit2.Date := StrToDate(IntToStr(Day) + '/' + IntToStr(Month) + '/' + IntToStr(Year));
     end;
  end;
end;

procedure TFCrearProgramacion.DBDateEdit1Change(Sender: TObject);
var cadena:string;
begin
  try
    if DBDateEdit1.Date <> 0 then
    begin
      cadena := FormatDateTime('  MMMM  "01 de" YYYY ', DBDateEdit1.Date);
      cadena[1] := UpperCase(cadena[1])[1];
      TitleLabel.Caption := cadena; // UpperCase(cadena[1]) + Copy(cadena, 2 length(cadena)-1);
      TitleLabel.Repaint;
      DecodeDate(DBDateEdit1.Date, Year, Month, Day);
      seAgnos.Value := Year;
      if (qProgramacionEmpleadoCODIGOPROGRAMACION.AsString <> '') or (DBDateEdit1.Date <> 0) then
      begin
        qProgramacionEmpleado.Edit;
        qProgramacionEmpleadoFECHADESCANSO.AsDateTime := DBDateEdit1.Date;
      end;
    end;
  except
  end;
end;

procedure TFCrearProgramacion.seAgnosChange(Sender: TObject);
begin
  DecodeDate(DBDateEdit1.Date, Year, Month, Day);
  Year := seAgnos.Value;
  DBDateEdit1.Date := StrToDate(IntToStr(Day) + '/' + IntToStr(Month) + '/' + IntToStr(Year));
end;

procedure TFCrearProgramacion.qProgramacionEmpleadoBeforePost(DataSet: TDataSet);
begin
  if qProgramacionEmpleadoCODIGOPROGRAMACION.AsString = '' then
  begin
    qProgramacionEmpleado.Cancel;
    qProgramacionEmpleado.CancelUpdates;
  end;  
  if qProgramacionEmpleadoCODIGOEMPLEADO.AsString = '' then
  begin
    qProgramacionEmpleado.Cancel;
    qProgramacionEmpleado.CancelUpdates;
  end;
end;

procedure TFCrearProgramacion.qProgramacionAfterOpen(DataSet: TDataSet);
begin
  qProgramacionEmpleado.Close;
  qProgramacionEmpleado.Open;
  qProgramacion.Last;
  qProgramacion.First;//para que refresque la fecha de la programación
end;

procedure TFCrearProgramacion.dbrgTipoProgramacionChange(Sender: TObject);
begin
  if dbrgTipoProgramacion.Value = 'P' then
    Notebook1.PageIndex := 1;
  if dbrgTipoProgramacion.Value = 'G' then
    Notebook1.PageIndex := 2;
end;

procedure TFCrearProgramacion.sbAsignarGrupoClick(Sender: TObject);
var Administrativo,Programacion,Grupo: string;
begin
  if qGrupo.FieldByName('CODIGOGRUPOTRABAJO').AsString <> '' then
  begin
    if ListaGrupos.IndexOf(qGrupo.FieldByName('CODIGOADMINISTRATIVO').AsString + '-' +
    qGrupo.FieldByName('CODIGOGRUPOTRABAJO').AsString) < 0 then
    begin
      if not (qProgramacionGrupo.State in [dsInsert]) then
        qProgramacionGrupo.Insert;
      qProgramacionGrupo.FieldByName('CODIGOGRUPOTRABAJO').AsString := qGrupo.FieldByName('CODIGOGRUPOTRABAJO').AsString;
      qProgramacionGrupo.FieldByName('CODIGOADMINISTRATIVO').AsString := qGrupo.FieldByName('CODIGOADMINISTRATIVO').AsString;
      qProgramacionGrupo.FieldByName('CODIGOPROGRAMACION').AsString := qProgramacionCODIGOPROGRAMACION.AsString;
      Programacion := qProgramacionCODIGOPROGRAMACION.AsString;
      Administrativo := qGrupoCODIGOADMINISTRATIVO.AsString;
      Grupo := qGrupoCODIGOGRUPOTRABAJO.AsString;
      qProgramacionGrupo.Post;
      qProgramacionGrupo.Close;
      qProgramacionGrupo.Open;
      ListaGrupos.Add(qGrupo.FieldByName('CODIGOADMINISTRATIVO').AsString + '-' +
      qGrupo.FieldByName('CODIGOGRUPOTRABAJO').AsString);
      qProgramacionGrupo.Locate('CODIGOPROGRAMACION;CODIGOADMINISTRATIVO;CODIGOGRUPOTRABAJO',
      VarArrayOf([Programacion,Administrativo,Grupo]),[]);
      FProgramacionEmpleadoGrupo := TFProgramacionEmpleadoGrupo.Create(Application);
      FProgramacionEmpleadoGrupo.ShowModal;
      FProgramacionEmpleadoGrupo.Free;
      DBGridGrupo.Repaint;
    end;
  end;
end;

procedure TFCrearProgramacion.qProgramacionGrupoAfterPost(DataSet: TDataSet);

function FormatoFecha(aFecha:TField):string;
begin
  Result:=FormatDateTime('mm/dd/yyyy',aFecha.AsDateTime);
end;

var Query: TQuery;
begin
  qProgramacionGrupo.ApplyUpdates;
  qProgramacionGrupo.CommitUpdates;
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('UPDATE PROGRAMACIONEMPLEADO SET DIADESCANSO =:DIADESCANSO, FECHADESCANSO = :FECHADESCANSO');
  Query.SQL.Add('WHERE CODIGOPROGRAMACION =:CODIGOPROGRAMACION');
  Query.SQL.Add('AND CODIGOADMINISTRATIVO =:CODIGOADMINISTRATIVO');
  Query.SQL.Add('AND CODIGOGRUPOTRABAJO =:CODIGOGRUPOTRABAJO');
  with DataSet do
  begin
    Query.ParamByName('DIADESCANSO').AsString := FieldByName('DIADESCANSO').AsString;
    Query.ParamByName('FECHADESCANSO').AsString := FormatoFecha(FieldByName('FECHADESCANSO'));
    Query.ParamByName('CODIGOPROGRAMACION').AsString := FieldByName('CODIGOPROGRAMACION').AsString;
    Query.ParamByName('CODIGOADMINISTRATIVO').AsString := FieldByName('CODIGOADMINISTRATIVO').AsString;
    Query.ParamByName('CODIGOGRUPOTRABAJO').AsString := FieldByName('CODIGOGRUPOTRABAJO').AsString;
  end;
  Query.ExecSQL;
  Query.Free;
end;

procedure TFCrearProgramacion.qProgramacionGrupoAfterDelete(DataSet: TDataSet);
begin
  qProgramacionGrupo.ApplyUpdates;
  qProgramacionGrupo.CommitUpdates;
end;

procedure TFCrearProgramacion.qProgramacionGrupoAfterOpen(DataSet: TDataSet);
begin
  ListaGrupos.Clear;
  DataSet.First;
  while not DataSet.Eof do
  begin
    ListaGrupos.Add(DataSet.FieldByName('CODIGOADMINISTRATIVO').AsString + '-' +
    DataSet.FieldByName('CODIGOGRUPOTRABAJO').AsString);
    DataSet.Next;
  end;
  qProgramacionEmpleadoGrupo.close;
  qProgramacionEmpleadoGrupo.open;
end;

procedure TFCrearProgramacion.DBGridGrupoGetCellParams(Sender: TObject;
  Field: TField; AFont: TFont; var Background: TColor; Highlight: Boolean);
var Encontrado: Boolean;
    I: Integer;
begin
  if Field.FieldName = 'CODIGOGRUPOTRABAJO' then
  begin
    Encontrado := False;
    for I:=0 to ListaGrupos.Count - 1 do
    begin
      if ListaGrupos[I] = qGrupo.FieldByName('CODIGOADMINISTRATIVO').AsString + '-' +
      qGrupo.FieldByName('CODIGOGRUPOTRABAJO').AsString then
      begin
        Encontrado := True;
        Break;
      end;
    end;
   if Encontrado then
    begin
     Background := clRed;
     AFont.Color := clWhite;
    end;
  end;
end;

procedure TFCrearProgramacion.sbDesasignarGrupoClick(Sender: TObject);
begin
  if qProgramacionGrupo.FieldByName('CODIGOGRUPOTRABAJO').AsString <> '' then
  begin
    if qProgramacionEmpleadoGrupo.RecordCount > 0 then
      raise Exception.Create('Para desasignar un grupo de trabajo primero debe eliminar sus empleados asociados.');
    try
      ListaGrupos.Delete(ListaGrupos.IndexOf(qProgramacionGrupo.FieldByName('CODIGOADMINISTRATIVO').AsString + '-' +
      qProgramacionGrupo.FieldByName('CODIGOGRUPOTRABAJO').AsString));
    except
    end;
    qProgramacionGrupo.Delete;
    DBGridGrupo.Repaint;
  end;
end;

procedure TFCrearProgramacion.TitleLabel2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Punto: TPoint;
begin
  Punto:=TitleLabel2.ClientToScreen(Classes.Point(X + 10, 10));
  pmMeses.Popup(punto.x+10, punto.y);
end;

procedure TFCrearProgramacion.DBDateEdit2Change(Sender: TObject);
var cadena:string;
begin
  try
    if DBDateEdit2.Date <> 0 then
    begin
      cadena := FormatDateTime('  MMMM  "01 de" YYYY ', DBDateEdit2.Date);
      cadena[1] := UpperCase(cadena[1])[1];
      TitleLabel2.Caption := cadena; // UpperCase(cadena[1]) + Copy(cadena, 2 length(cadena)-1);
      DecodeDate(DBDateEdit2.Date, Year, Month, Day);
      seAgnos2.Value := Year;
      if (qProgramacionGrupo.State in [dsEdit,dsInsert]) and ((qProgramacionGrupoCODIGOGRUPOTRABAJO.AsString <> '') or (DBDateEdit2.Date <> 0)) then
      begin
        qProgramacionGrupo.Edit;
        qProgramacionGrupoFECHADESCANSO.AsDateTime := DBDateEdit2.Date;
      end;
      TitleLabel2.Repaint;
    end;
    except
  end;
end;

procedure TFCrearProgramacion.seAgnos2Change(Sender: TObject);
begin
  DecodeDate(DBDateEdit2.Date, Year, Month, Day);
  Year := seAgnos2.Value;
  qProgramacionGrupo.Edit;
  DBDateEdit2.Date := StrToDate(IntToStr(Day) + '/' + IntToStr(Month) + '/' + IntToStr(Year));
end;

procedure TFCrearProgramacion.qProgramacionGrupoAfterInsert(DataSet: TDataSet);
begin
  DecodeDate(Now, Year, Month, Day);
  Day := 1;
  qProgramacionGrupoFECHADESCANSO.AsDateTime :=
                                StrToDate(IntToStr(Day) + '/' + IntToStr(Month) + '/' + IntToStr(Year));
end;

procedure TFCrearProgramacion.qProgramacionEmpleadoGrupoAfterPost(
  DataSet: TDataSet);
begin
  qProgramacionEmpleadoGrupo.ApplyUpdates;
  qProgramacionEmpleadoGrupo.CommitUpdates;
end;

procedure TFCrearProgramacion.qProgramacionEmpleadoGrupoAfterDelete(
  DataSet: TDataSet);
begin
  qProgramacionEmpleadoGrupo.ApplyUpdates;
  qProgramacionEmpleadoGrupo.CommitUpdates;
end;

procedure TFCrearProgramacion.qProgramacionEmpleadoGrupoAfterInsert(
  DataSet: TDataSet);
begin
  qProgramacionEmpleadoGrupo.FieldByName('CODIGOPROGRAMACION').AsString := qProgramacionGrupoCODIGOPROGRAMACION.AsString;
  qProgramacionEmpleadoGrupo.FieldByName('CODIGOADMINISTRATIVO').AsString :=qProgramacionGrupoCODIGOADMINISTRATIVO.AsString;
  qProgramacionEmpleadoGrupo.FieldByName('CODIGOGRUPOTRABAJO').AsString := qProgramacionGrupoCODIGOGRUPOTRABAJO.AsString;
  qProgramacionEmpleadoGrupo.FieldByName('DIADESCANSO').AsString := qProgramacionGrupoDIADESCANSO.AsString;
  qProgramacionEmpleadoGrupo.FieldByName('FECHADESCANSO').AsString := qProgramacionGrupoFECHADESCANSO.AsString;
end;

procedure TFCrearProgramacion.sbEditarEmpleadoGrupoClick(Sender: TObject);
begin
  if qProgramacionGrupoCODIGOGRUPOTRABAJO.AsString <> '' then
  begin
    FProgramacionEmpleadoGrupo := TFProgramacionEmpleadoGrupo.Create(Application);
    FProgramacionEmpleadoGrupo.ShowModal;
    FProgramacionEmpleadoGrupo.Free;
  end;
end;

procedure TFCrearProgramacion.DBGridGrupoEmpleadoAsignadoDblClick(Sender: TObject);
begin
 sbEditarEmpleadoGrupoClick(nil);
end;

procedure TFCrearProgramacion.SpeedButton3Click(Sender: TObject);
begin
  FdFiltrarGrupo := TFdFiltrarGrupo.Create(Application);
  FdFiltrarGrupo.FormStyle := fsNormal;
  FdFiltrarGrupo.Query := qGrupo;
  if ListaFiltroGrupos.Count > 0 then
    FdFiltrarGrupo.CargarFiltro(ListaFiltroGrupos);
  FdFiltrarGrupo.ShowModal;
  ListaFiltroGrupos.Assign(FdFiltrarGrupo.ListaDatos);
  FdFiltrarGrupo.Free;
end;

procedure TFCrearProgramacion.qProgramacionCODIGOTIPOPROGRAMACIONValidate(
  Sender: TField);
begin
  if Sender.Text <> '' then
    case Sender.Text[1] of
      'P': Notebook1.PageIndex := 1;
      'G': Notebook1.PageIndex := 2;
    end;
    Notebook1.Repaint;
end;
//Crea lista de turnos posibles para la fechadescanso (primer día mes)
//para esto desplaza la rotación a partir del día de descanso de la semana (1-7)
function TFCrearProgramacion.ListaTurnosPosibles(Rotacion: String;
  Fecha: TDateTime;DiaDescanso:integer): TStringList;
const Dias: array[0..6] of String = ('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo');
var Dia,i,j,pd,pl:integer;
    Cadena:string;
begin
//lo que debo hacer es: si el descanso es tal entonces el lunes es tal.
  pd:=pos('D',Rotacion);//posición descanso
  if pd>0 then
  begin
    pl:=pd+(7-DiaDescanso+1);
    if pl>7 then pl:=pl-7;//posición lunes
    Result:=TStringList.Create;
    Result.Add('');
    Dia:=DiaDelphi(Fecha);
    Rotacion:=copy(rotacion,pl,length(rotacion)-pl+1)+copy(rotacion,1,pl-1);//cambio la rotacion para que empiece desde el lunes
    j:=0;
    for i := 0 to Length(Rotacion)-1 do
    begin
      inc(j);
      if j>7 then j:=j-7;
      if (j = Dia)then
      begin
        if Rotacion[i+1]='D' then Cadena:=' Descanso '
        else Cadena:= ' Turno '+Rotacion[i+1];
        Result.Add(inttostr(i+pl)+'- '+Dias[Dia-1]+Cadena);
      end;
    end;
  end;
end;

function TFCrearProgramacion.DiaDelphi(Fecha: TDateTime): Integer;
begin
  Result := DayOfWeek(Fecha) - 1;
  if Result <= 0 then
    Result := 7;
end;

procedure TFCrearProgramacion.qProgramacionEmpleadoAfterScroll(
  DataSet: TDataSet);
begin
  if qProgramacionDIRECCIONROTACION.AsString<>'' then
  begin
    case qProgramacionDIRECCIONROTACION.AsInteger of
      0:
      begin
        with cbPosicionRotacion do
        begin
          EdPosicionRotacionEmpleado.Text:='';
          Text:='';
          Items.Clear;
          Items.Assign(ListaTurnosPosibles(qProgramacionROTACION.AsString,qProgramacionEmpleadoFECHADESCANSO.AsDateTime,qProgramacionEmpleadoDIADESCANSO.AsInteger));
        end;
        EdPosicionRotacionEmpleado.Text:=qProgramacionEmpleadoPOSICIONROTACION.AsString;
      end;
      2:
      begin
        with cbPosicionRotacion do
        begin
          EdPosicionRotacionEmpleado.Text:='';
          Text:='';
          Items.Clear;
          Items.Assign(ListaTodosLosTurnos(qProgramacionROTACION.AsString,qProgramacionEmpleadoFECHADESCANSO.AsDateTime));
        end;
        EdPosicionRotacionEmpleado.Text:=qProgramacionEmpleadoPOSICIONROTACION.AsString;
      end;
    end;
  end;
end;

procedure TFCrearProgramacion.FormShow(Sender: TObject);
var s:string;
begin
  qProgramacion.close;
  if  EsUsuarioAdmin then
    qProgramacion.Open
  else
  begin
    s:=GetCIASEdicionTablaUsuario('CREARPROGRAMACION');
    qProgramacion.sql.Clear;
    qProgramacion.sql.add('SELECT CODIGOPROGRAMACION,NOMBREPROGRAMACION,');
    qProgramacion.sql.add('CODIGOTIPOPROGRAMACION,ROTACION,DIRECCIONROTACION,');
    qProgramacion.sql.add('CODIGOTIPOTURNOPROGRAMACION,TITULOPROGRAMACION,');
    qProgramacion.sql.add('CODIGOADMINISTRATIVO');
    qProgramacion.sql.add('FROM PROGRAMACION');
    qProgramacion.sql.add('WHERE CODIGOADMINISTRATIVO IN '+s);
    qProgramacion.sql.add('ORDER BY CODIGOPROGRAMACION');
    qProgramacion.open;
  end;
  qProgramacionEmpleado.Open;
  qProgramacionGrupo.Open;
  inherited;
end;

procedure TFCrearProgramacion.cbPosicionRotacionChange(Sender: TObject);
var Cad:String;
begin
  Cad:='';
  if cbPosicionRotacion.ItemIndex>0 then
  begin
    Cad:=cbPosicionRotacion.Items[cbPosicionRotacion.ItemIndex];
    Cad:=Copy(Cad,1,Pos('-',Cad)-1);
  end;
  if not (qProgramacionEmpleado.State in [dsEdit,dsInsert]) then
    qProgramacionEmpleado.Edit;
  qProgramacionEmpleadoPOSICIONROTACION.AsString:=Cad;
  EdPosicionRotacionEmpleado.Text:=Cad;
end;

procedure TFCrearProgramacion.EdPosicionRotacionEmpleadoChange(Sender: TObject);
var i,j:integer;
  Cad,Valor:String;
begin
  inherited;
  if EdPosicionRotacionEmpleado.Text<>'' then
  begin
    Valor:='';
    j:=0;
    for i := 1 to cbPosicionRotacion.Items.Count-1 do
    begin
      Cad:=cbPosicionRotacion.Items[i];
      Cad:=Copy(Cad,1,Pos('-',Cad)-1);
      if EdPosicionRotacionEmpleado.Text=Cad then
      begin
        Valor:=EdPosicionRotacionEmpleado.Text;
        j:=i;
      end;
    end;
    EdPosicionRotacionEmpleado.Text:=Valor;
    cbPosicionRotacion.ItemIndex:=j;
  end
  else
  begin
    cbPosicionRotacion.ItemIndex:=0;
  end;
end;

procedure TFCrearProgramacion.qProgramacionEmpleadoFECHADESCANSOChange(
  Sender: TField);
var Fecha:TDateTime;
begin
  if qProgramacionDIRECCIONROTACION.AsString='0' then
  begin
    with cbPosicionRotacion do
    begin
      EdPosicionRotacionEmpleado.Text:='';
      Text:='';
      Items.Clear;
      Fecha:=qProgramacionEmpleadoFECHADESCANSO.AsDateTime;
      Items.Assign(ListaTurnosPosibles(qProgramacionROTACION.AsString,Fecha,qProgramacionEmpleadoDIADESCANSO.AsInteger));
    end;
    EdPosicionRotacionEmpleado.Text:=qProgramacionEmpleadoPOSICIONROTACION.AsString;
  end;
  cbPosicionRotacion.OnChange(nil);
end;

procedure TFCrearProgramacion.dbrgTipoRotacionClick(Sender: TObject);
begin
  inherited;
  Perform(wm_NextDLGCTL, 0, 0);
  if (qProgramacionCODIGOTIPOPROGRAMACION.AsString= 'P') then
  begin
    case dbrgTipoRotacion.ItemIndex of
      0,1:
      begin
        DBGridEmpleadoAsignado.Columns[2].Visible:=true;
        gbDiaDescansoEmpleado.Visible:=true;
        DBGridEmpleadoAsignado.Columns[4].Visible:=false;
        gbPosicionRotacionEmpleado.Visible:=false;
      end;
      2:
      begin
        DBGridEmpleadoAsignado.Columns[2].Visible:=true;
        gbDiaDescansoEmpleado.Visible:=true;
        DBGridEmpleadoAsignado.Columns[4].Visible:=true;
        gbPosicionRotacionEmpleado.Visible:=true;
      end;
      3:
      begin
        DBGridEmpleadoAsignado.Columns[2].Visible:=false;
        gbDiaDescansoEmpleado.Visible:=false;
        DBGridEmpleadoAsignado.Columns[4].Visible:=true;
        gbPosicionRotacionEmpleado.Visible:=true;
      end;
    end;
  end;
end;

procedure TFCrearProgramacion.qProgramacionAfterDelete(DataSet: TDataSet);
begin
  inherited;
  qProgramacion.ApplyUpdates;
  qProgramacion.CommitUpdates;
end;

procedure TFCrearProgramacion.qProgramacionEmpleadoDIADESCANSOChange(
  Sender: TField);
begin
  inherited;
  if qProgramacionDIRECCIONROTACION.AsString='0' then
  begin
    with cbPosicionRotacion do
    begin
      EdPosicionRotacionEmpleado.Text:='';
      Text:='';
      Items.Clear;
      Items.Assign(ListaTurnosPosibles(qProgramacionROTACION.AsString,qProgramacionEmpleadoFECHADESCANSO.AsDateTime,qProgramacionEmpleadoDIADESCANSO.AsInteger));
    end;
    EdPosicionRotacionEmpleado.Text:=qProgramacionEmpleadoPOSICIONROTACION.AsString;
  end;
  cbPosicionRotacion.OnChange(nil);
end;
//Lista todos los turnos de los rotación para una fecha de programación
function TFCrearProgramacion.ListaTodosLosTurnos(Rotacion: String;
  Fecha: TDateTime): TStringList;
const Dias: array[0..6] of String = ('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo');
var Dia,i:integer;
    Cadena:string;
begin
  Result:=TStringList.Create;
  Result.Add('');
  Dia:=DiaDelphi(Fecha);
  for i := 0 to Length(Rotacion)-1 do
  begin
    if Rotacion[i+1]='D' then Cadena:=' Descanso '
    else Cadena:= ' Turno '+Rotacion[i+1];
    Result.Add(inttostr(i+1)+'- '+Dias[Dia-1]+Cadena);
  end;
end;

procedure TFCrearProgramacion.LimpiarFiltro;
var i,nLineas:Integer;
begin
  nLineas:=qEmpleado.SQL.Count - 3;
  if nLineas > 0 then
    for i:=1 to nLineas do
     qEmpleado.SQL.Delete(2);
end;

end.
