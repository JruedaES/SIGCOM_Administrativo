unit uFormatoMantenimiento;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, Grids, DBGrids, RXDBCtrl, Digisoft, StdCtrls, ExtCtrls,
  Buttons, UtdNavigator, DBCtrls;

type
  TFFormatoMantenimiento = class(TForm)
    Panel3: TPanel;
    dsFormatoMantenimiento: TDDataSource;
    dsEncabezado: TDataSource;
    qSeccion: TQuery;
    dsSeccion: TDataSource;
    qEncabezadoSeccion: TQuery;
    dsEncabezadoSeccion: TDataSource;
    qFormatoMantenimiento: TQuery;
    updFormatoMantenimiento: TUpdateSQL;
    qCopiar: TQuery;
    qFormatoMantenimientoCODIGOFORMATOMTTO: TFloatField;
    qFormatoMantenimientoNOMBREFORMATOMTTO: TStringField;
    updEncabezado: TUpdateSQL;
    UpdSeccion: TUpdateSQL;
    UpdEncabezadoSeccion: TUpdateSQL;
    Panel4: TPanel;
    qColumna: TQuery;
    dsColumna: TDataSource;
    updColumna: TUpdateSQL;
    qSeccionCODIGOSECCIONFORMATO: TFloatField;
    qSeccionCODIGOFORMATOMTTO: TFloatField;
    qSeccionNOMBRESECCIONFORMATO: TStringField;
    qEncabezadoSeccionCODIGOENCABEZADOSECCION: TFloatField;
    qEncabezadoSeccionCODIGOSECCIONFORMATO: TFloatField;
    qEncabezadoSeccionNOMBRECAMPO: TStringField;
    qColumnaCODIGOCOLUMNAMEDIDA: TFloatField;
    qColumnaCODIGOSECCIONFORMATO: TFloatField;
    qColumnaCODIGOTIPOCOLUMNAMEDIDA: TStringField;
    qColumnaTIPODATO: TStringField;
    qColumnaNOMBRECOLUMNAMEDIDA: TStringField;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Panel10: TPanel;
    dbgEncabezado: TRxDBGrid;
    DBNavigator4: TDBNavigator;
    Panel11: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    DBNavigator6: TDBNavigator;
    dbgEncabezadoSeccion: TRxDBGrid;
    dbgSeccion: TRxDBGrid;
    Splitter2: TSplitter;
    qEncabezadoSeccionCodigoFormato: TIntegerField;
    qColumnaCodigoFormato: TIntegerField;
    qSeccionCONSECUTIVOSECCIONFORMATO: TFloatField;
    qEncabezadoSeccionCONSECUTIVOENCABEZADOSECCION: TFloatField;
    qColumnaCONSECUTIVOMEDIDASECCION: TFloatField;
    qEncabezado: TQuery;
    qEncabezadoCODIGOENCABEZADOFORMATO: TFloatField;
    qEncabezadoCODIGOFORMATOMTTO: TFloatField;
    qEncabezadoNOMBRECAMPO: TStringField;
    qEncabezadoCONSECUTIVOFORMATO: TFloatField;
    qEncabezadoSeccionConsecutivoSeccionFormato: TIntegerField;
    qColumnaConsecutivoSeccionFormato: TIntegerField;
    Panel9: TPanel;
    Panel8: TPanel;
    Panel12: TPanel;
    dbgColumna: TRxDBGrid;
    DBNavigator2: TDBNavigator;
    Panel13: TPanel;
    qColumnaCODIGOUNIDADMEDIDAMTTO: TFloatField;
    qTipo: TQuery;
    qColumnaTipoColumnaMedida: TStringField;
    qUnidad: TQuery;
    qColumnaUnidadMedida: TStringField;
    qColumnaFORMULA: TBlobField;
    qColumnaCODIGOTIPOVALOR: TFloatField;
    qTipoValor: TQuery;
    dsTipoValor: TDataSource;
    qTipoValorCODIGOTIPOVALOR: TFloatField;
    qTipoValorNOMBRETIPOVALOR: TStringField;
    qColumnaNombreTipoValor: TStringField;
    Panel14: TPanel;
    Panel15: TPanel;
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    Panel5: TPanel;
    sbCerrar: TSpeedButton;
    Panel16: TPanel;
    dbgFormato: TRxDBGrid;
    dbNavigator1: TdNavigator;
    Splitter3: TSplitter;
    RxDBGrid2: TRxDBGrid;
    qAmbito: TQuery;
    dsAmbito: TDataSource;
    qCoordinacion: TQuery;
    dsCoordinacion: TDataSource;
    qFormatoMantenimientoCODIGOCOORDINACION: TFloatField;
    qCoordinacionCODIGOAREAOPERACIONODT: TFloatField;
    qCoordinacionCODIGOTIPOTRABAJOODT: TFloatField;
    qCoordinacionNOMBREAREAOPERACIONODT: TStringField;
    qCoordinacionCODIGOAMBITO: TFloatField;
    DBNavigator5: TDBNavigator;
    procedure qFormatoMantenimientoAfterPost(DataSet: TDataSet);
    procedure sbCerrarClick(Sender: TObject);
    procedure SBOrdenarClick(Sender: TObject);
    procedure dbgViaticoZonaMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure dbgViaticoZonaTitleClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure qFormatoMantenimientoAfterDelete(DataSet: TDataSet);
    procedure sbCopiarViaticoClick(Sender: TObject);
    procedure sbPegarViaticoClick(Sender: TObject);
    procedure qEncabezadoAfterPost(DataSet: TDataSet);
    procedure qEncabezadoAfterDelete(DataSet: TDataSet);
    procedure qSeccionAfterDelete(DataSet: TDataSet);
    procedure qEncabezadoSeccionAfterDelete(DataSet: TDataSet);
    procedure qColumnaAfterDelete(DataSet: TDataSet);
    procedure qColumnaAfterPost(DataSet: TDataSet);
    procedure qEncabezadoAfterInsert(DataSet: TDataSet);
    procedure qSeccionAfterInsert(DataSet: TDataSet);
    procedure qEncabezadoSeccionAfterInsert(DataSet: TDataSet);
    procedure qColumnaAfterInsert(DataSet: TDataSet);
    procedure qSeccionAfterPost(DataSet: TDataSet);
    procedure qEncabezadoSeccionAfterPost(DataSet: TDataSet);
    procedure qEncabezadoSeccionCalcFields(DataSet: TDataSet);
    procedure qColumnaCalcFields(DataSet: TDataSet);
    procedure qFormatoMantenimientoAfterInsert(DataSet: TDataSet);
  private
  public
    TeclaShift:boolean;
    ListaDatos,ListaOrden,ListaFormatos:TStringList;
    procedure Filtrar(filtro:string);
    procedure LimpiarFiltro;
  end;

var
  FFormatoMantenimiento: TFFormatoMantenimiento;

implementation


{$R *.DFM}


procedure TFFormatoMantenimiento.filtrar(filtro:string);
begin
  qFormatoMantenimiento.Close;
  if qFormatoMantenimiento.sql.Count > 2 then
    LimpiarFiltro;
  qFormatoMantenimiento.SQL.insert(1,filtro);
  qFormatoMantenimiento.Open;
end;

procedure TFFormatoMantenimiento.LimpiarFiltro;
var
  nLineasExtra, I: Byte;
begin
  nLineasExtra := qFormatoMantenimiento.SQL.Count - 2;
  if nLineasExtra > 0 then
    for I := 1 to nLineasExtra do
    begin
      qFormatoMantenimiento.SQL.Delete(1);
    end;
end;

procedure TFFormatoMantenimiento.qFormatoMantenimientoAfterPost(DataSet: TDataSet);
begin
  qFormatoMantenimiento.ApplyUpdates;
  qFormatoMantenimiento.CommitUpdates;
end;


procedure TFFormatoMantenimiento.sbCerrarClick(Sender: TObject);
begin
  close;
end;

procedure TFFormatoMantenimiento.SBOrdenarClick(Sender: TObject);
begin
  qFormatoMantenimiento.close;
  qFormatoMantenimiento.open;
end;

procedure TFFormatoMantenimiento.dbgViaticoZonaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
begin
  pt:= dbgFormato.MouseCoord(x, y);

  if pt.y=0 then
   begin
      dbgFormato.Cursor:=crHandPoint;
      if Shift = [ssShift] then
          TeclaShift:=True
      else
          TeclaShift:=False;
    end
  else
    dbgFormato.Cursor:=crDefault;
end;

procedure TFFormatoMantenimiento.dbgViaticoZonaTitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}

function NombreColumna(const Columna: string):string;
begin
  if qFormatoMantenimiento.FieldByName(Columna).Lookup  then
    Result := qFormatoMantenimiento.FieldByName(Columna).KeyFields
  else
    if qFormatoMantenimiento.FieldByName(Columna).Calculated then
    begin
      Result := '1';
      MessageDlg('Imposible ordenar por este campo calculado.' + Chr(13) +
                 'Se ordenara por el primer campo.', mtInformation, [mbOk], 0 );
    end
    else
      Result := Columna;
end;

var
  ListaTemp:TStringList;
  Encontrado:Boolean;
  var i:integer;
  Sort:String;
begin

  with dbgFormato.DataSource.DataSet do
  begin
    try
      dbgFormato.Columns[PreviousColumnIndex].title.Font.Style :=
      dbgFormato.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
    except
    end;
    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];

    Encontrado:=False;
    if PreviousColumnIndex = Column.Index then
       begin
         Encontrado:=True;
         ListaTemp:=TStringList.Create;
         for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
              end;
          end;
          ListaTemp.Free;
        end
    else
      begin
          if (not TeclaShift) then
             ListaOrden.Clear;
      end;

    PreviousColumnIndex := Column.Index;
    if (ListaOrden.Count > 0) and (not Encontrado) then
     begin
        ListaTemp:=TStringList.Create;
        Encontrado:=False;
        for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=NombreColumna(Column.Field.FieldName) then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
                Encontrado:=True;
              end;
          end;
        if (not Encontrado) then
          if NombreColumna(Column.Field.FieldName) <> '' then
            ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');
        ListaTemp.Free;
     end;

     if (ListaOrden.Count = 0) then
       if NombreColumna(Column.Field.FieldName) <> '' then
        ListaOrden.Add(NombreColumna(Column.Field.FieldName)+','+'ASC');

     qFormatoMantenimiento.SQl.Delete(qFormatoMantenimiento.SQl.Count - 1);
     Sort:='Order By ';
     for i:=0 to ListaOrden.Count - 1 do
     begin
       ListaTemp:=TStringList.Create;
       ListaTemp.CommaText:=ListaOrden[i];
       if i <> ListaOrden.Count - 1 then
         Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1] + ','
       else
         Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1];
       ListaTemp.Free;
     end;

     qFormatoMantenimiento.Sql.Add(Sort);
//     qFormatoMantenimiento.Sql.SaveToFile('C:\b.txt');
     qFormatoMantenimiento.Close;
     qFormatoMantenimiento.Open;
  end;
end;

procedure TFFormatoMantenimiento.FormCreate(Sender: TObject);
begin
  ListaDatos := TStringList.Create;
  ListaDatos.Duplicates := dupIgnore;
  ListaDatos.Sorted := True;

  ListaOrden:=TStringList.Create;
  ListaFormatos:=TStringList.Create;
  qAmbito.Open;
  qCoordinacion.Open;
  qFormatoMantenimiento.Open;
  qEncabezado.Open;
  qSeccion.Open;
  qEncabezadoSeccion.Open;
  qColumna.Open;
end;

procedure TFFormatoMantenimiento.qFormatoMantenimientoAfterDelete(DataSet: TDataSet);
begin
  qFormatoMantenimiento.ApplyUpdates;
  qFormatoMantenimiento.CommitUpdates;
end;

procedure TFFormatoMantenimiento.sbCopiarViaticoClick(Sender: TObject);
var bm:tbookmark;
begin
  ListaFormatos.Clear;
  bm:=qFormatoMantenimiento.GetBookmark;
  qFormatoMantenimiento.First;
  while not(qFormatoMantenimiento.Eof) do
  begin
    ListaFormatos.Add(qFormatoMantenimientoCODIGOFORMATOMTTO.AsString);
    qFormatoMantenimiento.Next;
  end;
  qFormatoMantenimiento.GotoBookmark(bm);
end;

procedure TFFormatoMantenimiento.sbPegarViaticoClick(Sender: TObject);
var   I:Integer;
begin
  try
    for i := 0 to ListaFormatos.Count-1 do
    begin
      qCopiar.Close;
      qCopiar.ParamByName('CODIGOFORMATOMTTO').AsString:=ListaFormatos[i];
      qCopiar.Open;
      if qCopiar.RecordCount>0 then
      begin
      end;
    end;
  except
  end;
end;

procedure TFFormatoMantenimiento.qEncabezadoAfterPost(DataSet: TDataSet);
begin
  qEncabezado.ApplyUpdates;
  qEncabezado.CommitUpdates;
end;

procedure TFFormatoMantenimiento.qEncabezadoAfterDelete(DataSet: TDataSet);
begin
  qEncabezado.ApplyUpdates;
  qEncabezado.CommitUpdates;
end;

procedure TFFormatoMantenimiento.qSeccionAfterDelete(DataSet: TDataSet);
begin
  qSeccion.ApplyUpdates;
  qSeccion.CommitUpdates;
end;

procedure TFFormatoMantenimiento.qEncabezadoSeccionAfterDelete(
  DataSet: TDataSet);
begin
  qEncabezadoSeccion.ApplyUpdates;
  qEncabezadoSeccion.CommitUpdates;
end;

procedure TFFormatoMantenimiento.qColumnaAfterDelete(DataSet: TDataSet);
begin
  qColumna.ApplyUpdates;
  qColumna.CommitUpdates;
end;

procedure TFFormatoMantenimiento.qColumnaAfterPost(DataSet: TDataSet);
begin
  qColumna.ApplyUpdates;
  qColumna.CommitUpdates;
end;

//Encabezado Formato
procedure TFFormatoMantenimiento.qEncabezadoAfterInsert(DataSet: TDataSet);
var query:tquery;
begin
  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  query.sql.text:='Select max(CODIGOENCABEZADOFORMATO)from hve_encabezadoformato';
  query.Open;
  dataset.fieldbyname('CODIGOENCABEZADOFORMATO').ASINTEGER:=query.fields[0].asinteger+1;
  query.sql.clear;
  query.sql.ADD('Select max(CONSECUTIVOFORMATO)FROM hve_encabezadoformato');
  query.sql.ADD('where codigoformatomtto='+qFormatoMantenimientoCODIGOFORMATOMTTO.asString);
  query.Open;
  DataSet.FieldByName('CODIGOFORMATOMTTO').AsString:= qFormatoMantenimientoCODIGOFORMATOMTTO.AsString;
  DataSet.FieldByName('CONSECUTIVOFORMATO').AsInteger:=query.Fields[0].AsInteger+1;
  query.close;
  query.Free;
end;

//Seccion Formato
procedure TFFormatoMantenimiento.qSeccionAfterInsert(DataSet: TDataSet);
var query:tquery;
begin
  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  query.sql.text:='Select max(CODIGOSECCIONFORMATO)from hve_seccionformato';
  query.Open;
  dataset.fieldbyname('CODIGOSECCIONFORMATO').ASINTEGER:=query.fields[0].asinteger+1;
  query.close;
  query.sql.clear;
  query.sql.ADD('Select max(CONSECUTIVOSECCIONFORMATO)FROM hve_seccionformato');
  query.sql.ADD('where codigoformatomtto='+qFormatoMantenimientoCODIGOFORMATOMTTO.asString);
  query.Open;
  DataSet.FieldByName('CODIGOFORMATOMTTO').AsString:= qFormatoMantenimientoCODIGOFORMATOMTTO.AsString;
  DataSet.FieldByName('CONSECUTIVOSECCIONFORMATO').AsInteger:=query.Fields[0].AsInteger+1;
  query.close;
  query.Free;
end;

//Encabezado Seccion
procedure TFFormatoMantenimiento.qEncabezadoSeccionAfterInsert(DataSet: TDataSet);
var query:tquery;
begin
  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  query.sql.text:='Select max(CODIGOENCABEZADOSECCION)from hve_encabezadoseccion';
  query.Open;
  dataset.fieldbyname('CODIGOENCABEZADOSECCION').ASINTEGER:=query.fields[0].asinteger+1;
  DataSet.FieldByName('CODIGOSECCIONFORMATO').AsString:=qSeccionCODIGOSECCIONFORMATO.AsString;
  query.close;
  query.sql.clear;
  query.sql.add('Select max(CONSECUTIVOENCABEZADOSECCION)from hve_encabezadoseccion');
  query.sql.ADD('Where codigoSeccionFormato='+qSeccionCODIGOSECCIONFORMATO.asString);
  query.Open;
  DataSet.FieldByName('CONSECUTIVOENCABEZADOSECCION').AsInteger:=query.FieldS[0].AsInteger+1;
  query.Free;
end;

//Columna
procedure TFFormatoMantenimiento.qColumnaAfterInsert(DataSet: TDataSet);
var query:tquery;
begin
  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  query.sql.text:='Select max(CODIGOCOLUMNAMEDIDA)from hve_columnamedida';
  query.Open;
  dataset.fieldbyname('CODIGOCOLUMNAMEDIDA').ASINTEGER:=query.fields[0].asinteger+1;
  DataSet.FieldByName('CODIGOSECCIONFORMATO').AsString:=qSeccionCODIGOSECCIONFORMATO.AsString;
  query.close;
  query.sql.clear;
  query.sql.add('Select max(CONSECUTIVOMEDIDASECCION)from hve_columnamedida');
  query.sql.ADD('Where codigoSeccionFormato='+qSeccionCODIGOSECCIONFORMATO.asString);
  query.Open;
  DataSet.FieldByName('CONSECUTIVOMEDIDASECCION').AsInteger:=query.FieldS[0].AsInteger+1;
  query.Free;
end;

procedure TFFormatoMantenimiento.qSeccionAfterPost(DataSet: TDataSet);
begin
  qSeccion.ApplyUpdates;
  qSeccion.CommitUpdates;
end;

procedure TFFormatoMantenimiento.qEncabezadoSeccionAfterPost(
  DataSet: TDataSet);
begin
  qEncabezadoSeccion.ApplyUpdates;
  qEncabezadoSeccion.CommitUpdates;
end;

procedure TFFormatoMantenimiento.qEncabezadoSeccionCalcFields(
  DataSet: TDataSet);
begin
  qEncabezadoSeccionCodigoFormato.AsString:=qSeccionCODIGOFORMATOMTTO.AsString;
  qEncabezadoSeccionConsecutivoSeccionFormato.AsString:=qSeccionCONSECUTIVOSECCIONFORMATO.AsString;
end;

procedure TFFormatoMantenimiento.qColumnaCalcFields(DataSet: TDataSet);
begin
  qColumnaCodigoFormato.AsString:=qSeccionCODIGOFORMATOMTTO.AsString;
  qColumnaConsecutivoSeccionFormato.AsString:=qSeccionCONSECUTIVOSECCIONFORMATO.AsString;
end;

procedure TFFormatoMantenimiento.qFormatoMantenimientoAfterInsert(
  DataSet: TDataSet);
var query:tquery;
begin
  query:=TQuery.Create(Application);
  query.DatabaseName:='BaseDato';
  query.sql.Text:='Select max(CODIGOFORMATOMTTO) from hve_formatomtto';
  query.open;
  DataSet.FieldByName('CODIGOFORMATOMTTO').AsInteger:=query.Fields[0].asInteger+1;
  qFormatoMantenimientoCODIGOCOORDINACION.AsString:=qCoordinacionCODIGOAREAOPERACIONODT.AsString;
  query.close;
  query.Free;
end;

end.

