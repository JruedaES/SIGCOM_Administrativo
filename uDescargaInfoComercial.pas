unit uDescargaInfoComercial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, DBCtrls, Mask, ComCtrls,
  Grids, DBGrids;

type
  TfDescargaInfoComercial = class(TForm)
    Panel1: TPanel;
    qNombreTabla: TQuery;
    dsNombreTabla: TDataSource;
    Panel2: TPanel;
    sdGuardar: TSaveDialog;
    BitBtn1: TBitBtn;
    ProgressBar1: TProgressBar;
    Panel3: TPanel;
    qNombreTablaCODIGOTABLAEXPORTARCOM: TFloatField;
    qNombreTablaNOMBRETABLAEXPORTARCOM: TStringField;
    Panel4: TPanel;
    dbgAvance: TDBGrid;
    qAvance: TQuery;
    dsAvance: TDataSource;
    qAvanceLIBRO: TFloatField;
    qAvanceCLIENTES_ENTRADA: TFloatField;
    qAvanceCLIENTES_LEIDOS: TFloatField;
    qAvance_Avance: TFloatField;
    Panel5: TPanel;
    Label2: TLabel;
    dblcbNombreTabla: TDBLookupComboBox;
    eFecha: TEdit;
    Label21: TLabel;
    sbFecha: TSpeedButton;
    eRutaArchivo: TEdit;
    Label1: TLabel;
    btnVerAvance: TSpeedButton;
    sbGenerarArchivo: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure sbFechaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sbGenerarArchivoClick(Sender: TObject);
    procedure btnVerAvanceClick(Sender: TObject);
  private
    rutaArchivo, fechaInfo: String;
  public
    procedure GeneraArchivoTabla(ruta, fecha: String);
  end;

var
  fDescargaInfoComercial: TfDescargaInfoComercial;

implementation

uses
  uFuncionSGD, uFormaFecha;

{$R *.DFM}

function GetFecha: string;
begin
  FFormaFecha := TFFormaFecha.Create(Application);
  if FFormaFecha.ShowModal = mrOk then
    Result := DatetoStr(FFormaFecha.Date)
  else
    Result := '';
  FFormaFecha.Free;
end;

procedure TfDescargaInfoComercial.FormCreate(Sender: TObject);
begin
  qNombreTabla.Open;
end;

procedure TfDescargaInfoComercial.sbFechaClick(Sender: TObject);
begin
  eFecha.Setfocus;
  sFecha := eFecha.Text;
  eFecha.Text := GetFecha;
end;

procedure TfDescargaInfoComercial.FormShow(Sender: TObject);
begin
  if qNombreTabla.Active then
    qNombreTabla.Close;
  qNombreTabla.Open;
end;

procedure TfDescargaInfoComercial.GeneraArchivoTabla(ruta, fecha: String);
var
  archivo : TextFile;
  linea, SQL, nomTabla, separador : String;
  qDataTabla, qry : TQuery;
begin
  nomTabla:= UpperCase(qNombreTablaNOMBRETABLAEXPORTARCOM.AsString);
  separador:= ' ';
  if nomTabla = 'FPLE182' then
    SQL:= 'SELECT DISTINCT TO_CHAR(TO_NUMBER (TRUNC(F.M_CODIGO_CITY), ''999''),''FM000'')'+
                '||TO_CHAR(TO_NUMBER (TRUNC(F.M_CODIGO_RUTA), ''999''),''FM000'')'+
                '||TO_CHAR(TO_NUMBER (TRUNC(F.M_CODIGO_ACOMET), ''999''),''FM000'') ||'''+separador+'''|| '+
                ' TO_CHAR(TO_NUMBER (TRUNC(L.CLAVE), ''9999999''),''FM0000000'') ||'''+separador+'''|| '+
                ' ''00000'' ||'''+separador+'''|| '+
                ' ''00000'' ||'''+separador+'''|| '+
                ' TO_CHAR(TO_NUMBER (TRUNC(NVL(L.LECTURAACTUAL,''0'')), ''99999''),''FM00000'') ||'''+separador+'''|| '+
                ' TO_CHAR(TO_NUMBER (TRUNC(L.TIPO_FACTURA), ''9''),''FM0'') ||'''+separador+'''|| '+
                ' TRIM(NVL (TO_CHAR ( TO_NUMBER (TO_NUMBER(POTENCIA), ''99D999'', '' NLS_NUMERIC_CHARACTERS = ''''.,''),''00.000''),''00.000'')) ||'''+separador+'''|| '+
                ' LPAD(TRUNC(TO_NUMBER(NVL(L.LECTURAREACTIVA,''0''))),5,0) ||'''+separador+'''|| '+
                ' CASE '+
                ' WHEN TRUNC(L.FECHALECTURA) BETWEEN TRUNC(L.FECHA_PROGRAMADA-3) AND TRUNC(L.FECHA_PROGRAMADA+3) THEN TO_CHAR (L.FECHALECTURA, ''DDMMYY'') '+
                ' ELSE TO_CHAR (L.FECHA_PROGRAMADA, ''DDMMYY'') END FILA '+
           ' FROM SIGCOM_LECTURA L, FPLE180 F '+
          ' WHERE L.CLAVE = TO_CHAR(F.M_CLAVE_PRIMARIA) '+
            ' AND L.FECHA_PROGRAMADA = TO_DATE('''+fecha+''',''DD/MM/YYYY'') '+
            ' AND F.FECHA_LECTURA_PROGRAMADA = L.FECHA_PROGRAMADA '+
            ' AND L.ESTADOLECTURA=4 '+
          ' ORDER BY 1 '
  else
    if nomTabla = 'FPLE080' then
      SQL:= 'SELECT DISTINCT LPAD (R.LIBRO, 6, 0) ||'''+separador+'''|| '+
                  ' (SELECT ''2'' ESTADOLIBRO FROM DUAL) ||'''+separador+'''|| '+
                  ' SUBSTR(R.PERIODO,3,4) FILA '+
             ' FROM FPLE180 F, SIGCOM_LECTURA L, SGC_INFOITINERARIO I, EEH_RUTACICLO R '+
            ' WHERE TO_CHAR(F.M_CLAVE_PRIMARIA) = L.CLAVE '+
              ' AND F.FECHA_LECTURA_PROGRAMADA = TO_DATE('''+fecha+''',''DD/MM/YYYY'') '+
              ' AND L.FECHA_PROGRAMADA = F.FECHA_LECTURA_PROGRAMADA '+
              ' AND L.ESTADOLECTURA=4 '+
              ' AND F.M_CODIGO_CITY * 1000 + F.M_CODIGO_RUTA = R.LIBRO'+
              ' AND I.CLAVE = F.M_CLAVE_PRIMARIA '+
              ' AND I.FECHALECTURA = F.FECHA_LECTURA_PROGRAMADA '+
              ' AND R.PERIODO = I.PERIODO '+
              //' AND R.FECHALECTURA = TO_DATE('''+fecha+''',''DD/MM/YYYY'') '+   //Pueden 
            ' ORDER BY 1';
  //  ShowMessage(SQL);

  // Asegurar juego de caracteres numéricos, punto como decimal
  qry := TQuery.Create(nil);
  qry.DatabaseName := 'BaseDato';
  qry.close;
  qry.sql.clear;
  qry.sql.Text := 'ALTER SESSION SET NLS_NUMERIC_CHARACTERS=''.,''';
  qry.ExecSQL;
  qry.close;
  qry.Free;


  qDataTabla := TQuery.Create(nil);
  qDataTabla.DatabaseName := 'BaseDato';
  qDataTabla.SQL.Text:= SQL;
  qDataTabla.Open;
  if not qDataTabla.IsEmpty then
    begin
      AssignFile(archivo,ruta);
      Rewrite(archivo);
      ProgressBar1.Visible:= True;
      ProgressBar1.Min:= 0;
      ProgressBar1.Max:= qDataTabla.RecordCount;
      ProgressBar1.Step:= 1;
      ProgressBar1.Position:= 0;
      qDataTabla.First;
      Application.ProcessMessages;
      while not qDataTabla.Eof do
        begin
          linea:= qDataTabla.Fields[0].AsString;
          writeln(archivo,linea);
          qDataTabla.Next;
          Application.ProcessMessages;
          ProgressBar1.StepIt;
        end;
      closeFile(archivo);
      Application.MessageBox(PChar('Archivo generado con éxito'),'Atención',MB_ICONINFORMATION);
      ProgressBar1.Visible:= False;
    end
  else
  Application.MessageBox(PChar('No existen datos para generar el archivo'),'Atención',MB_ICONWARNING);
  qDataTabla.Close;
  qDataTabla.Free;
end;

procedure TfDescargaInfoComercial.sbGenerarArchivoClick(Sender: TObject);
begin
  if eFecha.Text <> '' then
    fechaInfo:= FormatDateTime('dd/mm/yyyy', StrToDate(eFecha.Text))
  else
    raise Exception.Create('Debe ingresar una fecha para generar el archivo seleccionado');
  if sdGuardar.Execute then
    begin
      rutaArchivo:= sdGuardar.FileName;
      eRutaArchivo.Text:= rutaArchivo;
      GeneraArchivoTabla(rutaArchivo,fechaInfo);
    end;
end;

procedure TfDescargaInfoComercial.btnVerAvanceClick(Sender: TObject);
begin
  if eFecha.Text <> '' then
    fechaInfo:= FormatDateTime('dd/mm/yyyy', StrToDate(eFecha.Text))
  else
    raise Exception.Create('Debe ingresar una fecha para generar el archivo seleccionado');

  fDescargaInfoComercial.Height := 216 + 238;

  if qAvance.Active then
    qAvance.Close;
  qAvance.ParamByName('pFECHA_LECTURA_PROGRAMADA').AsString := fechaInfo;
  qAvance.Open;
  
end;

end.
