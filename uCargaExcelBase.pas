unit uCargaExcelBase;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, DBTables, DB,  Grids, DBGrids, Mask, DBCtrls,
  Buttons;

type
  TfCargaExcelBase = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    btnElegirArchivo: TButton;
    OpenDialog1: TOpenDialog;
    qConsulta: TQuery;
    qValidacion: TQuery;
    BtnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure btnElegirArchivoClick(Sender: TObject);
    procedure ButtonAceptarClick(Sender: TObject);
    procedure ButtonCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCargaExcelBase: TfCargaExcelBase;

implementation

uses ComObj, uFuncionSGD;

{$R *.DFM}

procedure TfCargaExcelBase.btnElegirArchivoClick(Sender: TObject);
begin
if OpenDialog1.Execute then
  Edit1.Text:= opendialog1.filename;
end;

procedure TfCargaExcelBase.ButtonAceptarClick(Sender: TObject);
var
  Excel: Variant;
  j: Integer;
  WorkBook, WorkSheet: Variant;
  Ruta, CodigoExcel, MensageEstado: String;
  RecordSuccess, RecordFail, RecordLogs: TStringlist;
begin
  Excel := CreateOleObject('Excel.Application');
  Excel.Workbooks.Open(OpenDialog1.FileName);
  Excel.Workbooks[1].worksheets[1].Activate;
  WorkBook := Excel.ActiveWorkBook;
  WorkSheet := WorkBook.ActiveSheet;

  RecordFail := TStringlist.Create;
  RecordSuccess := TStringlist.Create;
  RecordLogs := TStringlist.Create;
  RecordFail.Add(
    'Por favor eliminar los siguientes registros existentes en Base de Datos.');
  try
    try
      {
        j:= 1;
        // Validacion todos los campos
        while WorkSheet.cells.item[j+1,1].Text <> '' do
        begin
        qValidacion.Close;
        qValidacion.SQL.Add('SELECT C.ID_AGUAS');
        qValidacion.SQL.Add('FROM ADB_CLIENTES C');
        qValidacion.SQL.Add('WHERE ID_AGUAS ='+''+WorkSheet.cells.item[j+1,1].Text+'');
        qValidacion.Open;
        if (not qValidacion.IsEmpty) then
        begin
        RecordFail.Add(''+WorkSheet.cells.item[j+1,1].Text+'');
        end;
        RecordSuccess.Add(''+WorkSheet.cells.item[j+1,1].Text+'');
        qValidacion.SQL.Clear;
        j:= j+1;
        end;
        RecordFail.SaveToFile(GetTemporalPath+'ClientesDuplicados.txt'); }
      if RecordFail.Count > 1 then
      begin
        ShowMessage(
          'Error en validación, por favor corrija el Excel e intentelo nuevamente' +
            #10 + 'ver log: ' + GetTemporalPath + 'sqlClientesDuplicados.txt');
      end
      else
      begin
        // Carga
        j := 1;
        while WorkSheet.cells.item[j + 1, 1].Text <> '' do
        Begin
          qConsulta.close;
          qConsulta.SQL.Clear;
          // Inserta nuevos registros
          qConsulta.SQL.Add('INSERT INTO SIGCOM_CONVEXCEL');
          qConsulta.SQL.Add(
            '(OFICINA,CODIGOCUENTA, PROVINCIA, MUNICIPIO, BARRIO, NUMEROPUERTA, REFERENCIA, NOMBRES, SERIAL,CODIGOOTCOMERCIAL, CODIGOTIPOGESTION)');
          qConsulta.SQL.Add('VALUES (');
          
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,1].Text+''''+')'+',');  //cod_unicom - NO SIRVE - Numero de Identificación de la Sede Operativa	
  qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,2].Text+''''+')'+',');  //nombre_unicom - FINCA(OFICINA) - SEDE OPERATIVA	
  qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,3].Text+''''+')'+',');  //nis_rad - GESTION(CODIGOCUENTA) - Numero de identificación del suministro (antigua clave)	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,4].Text+''''+')'+',');  //secuencial_nis - NO SABEMOS - Complemento identificación suministro	
  qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,5].Text+''''+')'+',');  //departamento - FINCA (PROVINCIA) - Dato Callejero	
  qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,6].Text+''''+')'+',');  //municipio - FINCA(MUNICIPIO) - Dato Callejero	
  qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,7].Text+''''+')'+',');  //localidad - FINCA(BARRIO) - Dato Callejero	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,8].Text+''''+')'+',');  //nom_calle -  - Dato Callejero	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,9].Text+''''+')'+',');  //duplicador - NO SABEMOS - Dato Callejero	
  qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,10].Text+''''+')'+',');  //num_puerta - FINCA(NUMEROPUERTA) - Dato Callejero	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,11].Text+''''+')'+',');  //cgv -  - Dato Callejero	
  qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,12].Text+''''+')'+',');  //ref_dir - FINCA(REFERENCIA) - Dato Callejero	
  qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,13].Text+''''+')'+',');  //nombre - SUMINISTRO(NOMBRES) - 	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,14].Text+''''+')'+',');  //tipo_suministro - SUMINISTRO(IRREGULARIDAD) - Indica caracteristica del suministro (Normal: Tiene Medidor,  Consumo fijo: Se le factura por estimación)	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,15].Text+''''+')'+',');  //csmo_fijo -  - Valor del consumo a facturar mes a mes cuando el tipo de suministro es consumo fijo.	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,16].Text+''''+')'+',');  //fecha_ultima_fact -  - Datos factura	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,17].Text+''''+')'+',');  //ultimo_csmo_fact -  - Datos factura	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,18].Text+''''+')'+',');  //ultimo_csmo_punta_fact -  - Datos factura	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,19].Text+''''+')'+',');  //ultimo_csmo_valle_fact -  - Datos factura	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,20].Text+''''+')'+',');  //ultimo_csmo_llano_fact -  - Datos factura	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,21].Text+''''+')'+',');  //ultimo_csmo_react_fact -  - Datos factura	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,22].Text+''''+')'+',');  //ultimo_pot_fact -  - Datos factura	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,23].Text+''''+')'+',');  //ultimo_pot_punta_fact -  - Datos factura	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,24].Text+''''+')'+',');  //ultimo_pot_valle_fact -  - Datos factura	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,25].Text+''''+')'+',');  //ultimo_pot_llano_fact -  - Datos factura	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,26].Text+''''+')'+',');  //indicador_de_fact -  - Datos factura	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,27].Text+''''+')'+',');  //desc_tar -  - TARIFA	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,28].Text+''''+')'+',');  //estado_suministro -  - Otros estados: Suspendido por impago. Baja.	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,29].Text+''''+')'+',');  //ruta -  - Datos Callejero	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,30].Text+''''+')'+',');  //num_itim -  - Datos Callejero	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,31].Text+''''+')'+',');  //aol_fin -  - Datos Callejero	
  qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,32].Text+''''+')'+',');  //num_aparato - MEDIDOR(SERIAL) - Número de medidor	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,33].Text+''''+')'+',');  //tipo_aparato - MEDIDOR (TIPOMEDIDA) - Tipo de Medición	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,34].Text+''''+')'+',');  //marca_aparato - MEDIDOR(MODELOMEDIDOR) - Marca de Medidor	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,35].Text+''''+')'+',');  //deuda_energia -  - Total deuda	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,36].Text+''''+')'+',');  //imp_acordados -  - Total deuda en acuerdo de pago	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,37].Text+''''+')'+',');  //cant_recibos -  - Cantidad de factuuras pendientes por pagar	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,38].Text+''''+')'+',');  //cant_acordados -  - Cantidad de facturas en acuerdo de pago	
  qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,39].Text+''''+')'+',');  //os_gen_camp - GESTION(CODIGOOTCOMERCIAL) - Numero de Orden de Servicio	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,40].Text+''''+')'+',');  //estado_os -  - Estado de la Orden de Servicio	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,41].Text+''''+')'+',');  //num_campania -  - Consecutivo de la campaña creada en el InCMS para gestinar las ordenes de Servicio	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,42].Text+''''+')'+',');  //Ind_Anomalia -  - 	
//qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,43].Text+''''+')'+',');  //Observaciones  -  - 	
  qConsulta.SQL.Add('TRIM('+''''+WorkSheet.cells.item[j+1,44].Text+''''+')');      //CODIGOTIPOGESTION -  - 


          qConsulta.SQL.Add(')');

          qConsulta.ExecSQL;
          // Guarda cada query ejecutado en un Log, probar con diferentes cantidades de datos
          RecordLogs.Add(IntToStr(j) + ' Consulta');
          RecordLogs.Add(qConsulta.SQL.GetText);
          qConsulta.SQL.Clear;
          j := j + 1;
        end;
        MensageEstado := 'Se han Insertado ' + IntToStr(j - 1)
          + ' Registros exitosamente';
        // RecordSuccess.SaveToFile(GetTemporalPath+'CodigosInsertados.txt');
        RecordLogs.Add(MensageEstado);
        RecordLogs.SaveToFile(GetTemporalPath + 'sqlLogClientesInsertados.txt');
        ShowMessage(MensageEstado);

      end;
    except
      on E: Exception do
        ShowMessage(
          'Ocurrio un error, por favor verifique el archivo e intente cargar de nuevo, Erro: ' +
            E.ClassName + ' error raised, with message : ' + E.Message);
    end;
  finally
    RecordFail.Free;
    RecordSuccess.Free;
    RecordLogs.Free;
    Excel.Workbooks.close;
    // Excel.Free; //No funciona
    Excel.Quit;
    Excel := Unassigned;
  end;
end;



procedure TfCargaExcelBase.ButtonCancelarClick(Sender: TObject);
begin
fCargaExcelBase.Close;
end;

end.
