unit uConsultaResultadosMtto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Grids, DBGrids, RXDBCtrl, ExtCtrls, Db, DBTables,
  Mask, UtdNavigator, Buttons, interexcel, comObj, Menus;

type
  TfConsultaResultadosMtto = class(TForm)
    pFiltro: TPanel;
    dbgListaResultados: TRxDBGrid;
    Label8: TLabel;
    Label2: TLabel;
    DBLCBSubestacion: TDBLookupComboBox;
    Label6: TLabel;
    DBLCBTipoElemento: TDBLookupComboBox;
    qConsultaResultadoMtto: TQuery;
    dsConsultaResultadoMtto: TDataSource;
    cbSubestacion: TCheckBox;
    cbxElemento: TCheckBox;
    cbTipoElemento: TCheckBox;
    Label18: TLabel;
    sbFechaDesde: TSpeedButton;
    Label1: TLabel;
    sbFechaHasta: TSpeedButton;
    Label3: TLabel;
    DBLCBFormato: TDBLookupComboBox;
    cbFormato: TCheckBox;
    Label5: TLabel;
    DBLCBMedida: TDBLookupComboBox;
    cbMedida: TCheckBox;
    Label4: TLabel;
    DBLCBMantenimiento: TDBLookupComboBox;
    cbManteniemiento: TCheckBox;
    qSubestacion: TQuery;
    qSubestacionCODIGOSUBESTACION: TStringField;
    qSubestacionNOMBRESUBESTACION: TStringField;
    dsSubestacion: TDataSource;
    qTipoElemento: TQuery;
    qTipoElementoCODIGOELEMENTO: TFloatField;
    qTipoElementoCODIGOTIPOELEMENTO: TStringField;
    qTipoElementoCODIGOAMBITO: TFloatField;
    qTipoElementoNOMBRETABLAELEMENTO: TStringField;
    qTipoElementoNUMEROCLAVESELEMENTO: TFloatField;
    qTipoElementoCLAVEELEMENTO1: TStringField;
    qTipoElementoCLAVEELEMENTO2: TStringField;
    qTipoElementoCLAVEELEMENTO3: TStringField;
    qTipoElementoNOMBRETIPOELEMENTO: TStringField;
    qTipoElementoCAMPODESCRIPTIVO: TStringField;
    dsTipoElemento: TDataSource;
    qElemento: TQuery;
    dsElemento: TDataSource;
    qFormato: TQuery;
    dsFormato: TDataSource;
    qMedida: TQuery;
    dsMedida: TDataSource;
    qMantenimiento: TQuery;
    dsMantenimiento: TDataSource;
    qFormatoCODIGOFORMATOMTTO: TFloatField;
    qFormatoNOMBREFORMATOMTTO: TStringField;
    qMantenimientoCODIGOMANTENIMIENTO: TFloatField;
    qMantenimientoCODIGOSUBESTACION: TStringField;
    qMantenimientoOBSERVACIONELEMENTO: TStringField;
    DBLCBAmbito: TDBLookupComboBox;
    Label7: TLabel;
    qCaracteristicasElemento: TQuery;
    qCaracteristicasElementoCODIGOELEMENTO: TFloatField;
    qCaracteristicasElementoCODIGOTIPOELEMENTO: TStringField;
    qCaracteristicasElementoCODIGOAMBITO: TFloatField;
    qCaracteristicasElementoNOMBRETABLAELEMENTO: TStringField;
    qCaracteristicasElementoNUMEROCLAVESELEMENTO: TFloatField;
    qCaracteristicasElementoCLAVEELEMENTO1: TStringField;
    qCaracteristicasElementoCLAVEELEMENTO2: TStringField;
    qCaracteristicasElementoCLAVEELEMENTO3: TStringField;
    qCaracteristicasElementoNOMBRETIPOELEMENTO: TStringField;
    qCaracteristicasElementoCAMPODESCRIPTIVO: TStringField;
    dsCaracteristicasElemento: TDataSource;
    dsTablaElemento: TDataSource;
    qTablaElemento: TQuery;
    Memo1: TMemo;
    codigo1: TListBox;
    codigo2: TListBox;
    cbAmbito: TCheckBox;
    qAmbito: TQuery;
    qAmbitoCODIGOAMBITO: TFloatField;
    qAmbitoNOMBREAMBITO: TStringField;
    dsAmbito: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    SBSalir: TSpeedButton;
    SBImprimir: TSpeedButton;
    SBBuscar: TSpeedButton;
    SBOrdenar: TSpeedButton;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel1: TBevel;
    SBBuscaElementoCartografia: TSpeedButton;
    sbExportar: TSpeedButton;
    sbRefrescar: TSpeedButton;
    dNavigator1: TdNavigator;
    SpeedButton2: TSpeedButton;
    dbeFechaDesde: TEdit;
    dbeFechaHasta: TEdit;
    qConsultaResultadoMttoFormato: TStringField;
    qConsultaResultadoMttoMantenimiento: TStringField;
    qConsultaResultadoMttoFecha: TDateTimeField;
    qConsultaResultadoMttoTipoElemento: TStringField;
    qConsultaResultadoMttoElemento: TStringField;
    qConsultaResultadoMttoMedida: TStringField;
    qConsultaResultadoMttoValor: TStringField;
    qMedidaCODIGOCOLUMNAMEDIDA: TFloatField;
    qMedidaNOMBRECOLUMNAMEDIDA: TStringField;
    DBLCBElemento: TDBLookupComboBox;
    pmOrdenar: TPopupMenu;
    CODIGO: TMenuItem;
    FORMATO: TMenuItem;
    MANTENIMIENTO: TMenuItem;
    FECHAPRUEBA: TMenuItem;
    MenuItem5: TMenuItem;
    SUBESTACION: TMenuItem;
    TIPOELEMENTO: TMenuItem;
    ELEMENTO: TMenuItem;
    MenuItem9: TMenuItem;
    MEDIDA: TMenuItem;
    VALOR: TMenuItem;
    qConsultaResultadoMttoCodigo: TFloatField;
    qConsultaResultadoMttoSubestacion: TStringField;
    procedure DBLCBTipoElementoClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbFechaDesdeClick(Sender: TObject);
    function GetFecha(Tipo:Boolean): String;
    procedure sbFechaHastaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbAmbitoClick(Sender: TObject);
    procedure cbSubestacionClick(Sender: TObject);
    procedure qSubestacionCODIGOSUBESTACIONChange(Sender: TField);
    procedure cbTipoElementoClick(Sender: TObject);
    procedure cbxElementoClick(Sender: TObject);
    procedure qAmbitoCODIGOAMBITOChange(Sender: TField);
    procedure qAmbitoAfterClose(DataSet: TDataSet);
    procedure SBSalirClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
    function FechaServidorCad: string;
    procedure sbRefrescarClick(Sender: TObject);
    procedure cbFormatoClick(Sender: TObject);
    procedure cbMedidaClick(Sender: TObject);
    procedure cbManteniemientoClick(Sender: TObject);
    procedure qTipoElementoCODIGOTIPOELEMENTOChange(Sender: TField);
    procedure qSubestacionAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure SBOrdenarClick(Sender: TObject);
    procedure CODIGOClick(Sender: TObject);
    procedure FORMATOClick(Sender: TObject);
    procedure MANTENIMIENTOClick(Sender: TObject);
    procedure FECHAPRUEBAClick(Sender: TObject);
    procedure SUBESTACIONClick(Sender: TObject);
    procedure TIPOELEMENTOClick(Sender: TObject);
    procedure ELEMENTOClick(Sender: TObject);
    procedure MEDIDAClick(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
  private
    { Private declarations }
    Year, Month, Day, Hour, Min, Sec, MSec: Word;
    sCriterio:string;
    procedure Ordenar(sCriterio: String);

  public
    { Public declarations }
    ListaDatos, ListaDireccionCampos : TStringList;

    sqltablaelemento,sFecha, Fecha, codigoelemento:string;
    Present: TDateTime;
  end;

var
  fConsultaResultadosMtto: TfConsultaResultadosMtto;

implementation

uses uFormaFecha, uBusquedaResultadoMtto;

{$R *.DFM}

procedure TfConsultaResultadosMtto.DBLCBTipoElementoClick(Sender: TObject);
var a,B,c: string;
begin
  {if DBLCBSubestacion.Text='' then
    Raise Exception.Create('Debe seleccionar primero una subestación');

  case DBLCBAmbito.KeyValue of
     1:begin
         if (DBLCBSubestacion.Enabled) and (DBLCBSubestacion.Text <> '') then
           begin
             if cbElemento.Enabled = false then
               cbElemento.Enabled:= true;
             if qCaracteristicasElemento.Active then
               qCaracteristicasElemento.Close;
             qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= DBLCBTipoElemento.keyvalue;
             qCaracteristicasElemento.Open;
             if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
               begin
                 if qTablaElemento.Active then
                   qTablaElemento.Close;
                 qTablaElemento.SQL.Clear;
                 ///*** INICIO ELP 1
                 if qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').AsString ='LINEA'then
                 begin
                   sqltablaelemento:= ' SELECT' +' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM ' + '  '+
                     qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring + ' order by '+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring;
                 end
                 else
                 begin
                 ///****FIN ELP 1
                    sqltablaelemento:= 'SELECT'+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                      qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION ORDER BY '+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring;
                 ///***ELP 2
                 end;
                 ///***FIN ELP 2
                 qTablaElemento.SQL.Add(sqltablaelemento);
                 memo1.Lines.Append(sqltablaelemento);

                 B:=VARTOSTR(DBLCBSubestacion.KEYVALUE);
                 ///*** ELP
                 if(AnsiCompareStr(B,'LN'))<>1 then
                 BEGIN
                   if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString='LINEA' then
                     raise Exception.Create('Debe seleccionar la Subestación Líneas')
                   else
                   begin
                     qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(DBLCBSubestacion.keyvalue);
                 //    a:= qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring;
                    end;
                  END
                  else
                  begin
                    if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString<>'LINEA' then
                      raise Exception.Create('Debe seleccionar una subestación diferente a Líneas');
                  end;
                 qTablaElemento.Open;
                 if codigo1.Items.Count >= 1 then
                   codigo1.Clear;
                 if cbElemento.Items.Count >= 1 then
                   cbElemento.Clear;
                 while not qTablaElemento.Eof do
                   begin
                     codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                     cbElemento.Items.Append(qTablaElemento.fields[1].asstring);
                     qTablaElemento.Next;
                   end;
               end
             else
               begin
                 if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
                   begin
                     if qTablaElemento.Active then
                       qTablaElemento.Close;
                     qTablaElemento.SQL.Clear;
                     ///*** INICIO ELP 3
                     if qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').AsString ='LINEA'then
                     begin
                       sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                         qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring +' order by '+ qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring;
                     end
                     else
                     begin
                     ///***FIN ELP 3
                       sqltablaelemento:= 'SELECT'+'  '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                                        qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION order by '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring;
                       ///*** INICIO ELP 4
                     end;
                    ///*** FIN ELP 4
                     qTablaElemento.SQL.Add(sqltablaelemento);
                    memo1.Lines.Append(sqltablaelemento);
                    ///*** ELP
                    if(AnsiCompareStr(B,'LN'))<>1 then
                    BEGIN
                      if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString='LINEA' then
                        raise Exception.Create('Debe seleccionar la Subestación Líneas')
                      else
                      begin
                        qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(DBLCBSubestacion.keyvalue);
                      end;
                    END
                    else
                    begin
                      if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString<>'LINEA' then
                      raise Exception.Create('Debe seleccionar una subestación diferente a Líneas');
                    end;
                     qTablaElemento.Open;
                     if codigo1.Items.Count >= 1 then
                       codigo1.Clear;
                     if cbElemento.Items.Count >= 1 then
                       cbElemento.Clear;
                     while not qTablaElemento.Eof do
                       begin
                         codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                         cbElemento.Items.Append(qTablaElemento.fields[0].asstring);
                         qTablaElemento.Next;
                       end;
                   end;
               end;
             if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
               begin
                 if qTablaElemento.Active then
                   qTablaElemento.Close;
                 qTablaElemento.SQL.Clear;

                 ///*** INICIO ELP 1
                 if qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').AsString ='LINEA'then
                 begin
                   sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                     qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+ ' order by '+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring ;
                 end
                 else
                 begin
                 ///****FIN ELP 1
                   sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                                    qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION order by '+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring;
                 end;
                 qTablaElemento.SQL.Add(sqltablaelemento);
                 memo1.Lines.Append(sqltablaelemento);
                 ///*** ELP
                 if(AnsiCompareStr(B,'LN'))<>1 then
                 BEGIN
                   if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString='LINEA' then
                     raise Exception.Create('Debe seleccionar la Subestación Líneas')
                   else
                   begin
                     qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(DBLCBSubestacion.keyvalue);
                   end;
                 END
                 else
                 begin
                   if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString<>'LINEA' then
                    raise Exception.Create('Debe seleccionar una subestación diferente a Líneas');
                 end;
                 qTablaElemento.Open;
                 if codigo1.Items.Count >= 1 then
                   codigo1.Clear;
                 if codigo2.Items.Count >= 1 then
                   codigo2.Clear;
                 if cbElemento.Items.Count >= 1 then
                   cbElemento.Clear;

                 while not qTablaElemento.Eof do
                   begin
                     codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                     codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                     cbElemento.Items.Append(qTablaElemento.fields[2].asstring);
                     qTablaElemento.Next;
                   end;
               end
            else
               begin
                 if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
                   begin
                     if qTablaElemento.Active then
                       qTablaElemento.Close;
                     qTablaElemento.SQL.Clear;

                     ///*** INICIO ELP 5
                   if qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').AsString ='LINEA'then
                   begin
                    sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+' '+'FROM'+' '+
                       qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring + 'order by '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring;
                   end
                   else
                   begin
                   ///****FIN ELP 5

                     sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+' '+'FROM'+' '+
                       qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION order by '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring;
                   ///***Inicio ELP 6
                   end;
                   ///****FIN ELP 6
                     qTablaElemento.SQL.Add(sqltablaelemento);
                     memo1.Lines.Append(sqltablaelemento);
                 ///*** ELP
                 if(AnsiCompareStr(B,'LN'))<>1 then
                 BEGIN
                   if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString='LINEA' then
                     raise Exception.Create('Debe seleccionar la Subestación Líneas')
                   else
                   begin
                     qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(DBLCBSubestacion.keyvalue);
                   end;
                 END
                 else
                 begin
                   if qCaracteristicasElemento.FieldByName('NOMBRETIPOELEMENTO').AsString<>'LINEA' then
                    raise Exception.Create('Debe seleccionar una subestación diferente a Líneas');
                 end;
                     qTablaElemento.Open;
                     if codigo1.Items.Count >= 1 then
                       codigo1.Clear;
                     if codigo2.Items.Count >= 1 then
                       codigo2.Clear;
                     if cbElemento.Items.Count >= 1 then
                       cbElemento.Clear;

                     while not qTablaElemento.Eof do
                       begin
                         codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                         codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                         cbElemento.Items.Append(qTablaElemento.fields[0].asstring + qTablaElemento.Fields[1].asstring);
                         qTablaElemento.Next;
                       end;
                   end;
               end;
           end
         else
           begin
             if cbElemento.Enabled then
               cbElemento.Enabled:= false;
           end;
       end;
     2:begin
         if cbElemento.Enabled then
           cbElemento.Enabled:=False;
         {circuito.Enabled:=true;
         if Circuito.Enabled = True then
         begin
           if qcircuito.Active then
             qcircuito.Close;
           qcircuito.ParamByName('codigosubestacion').value:=DBLCBSubestacion.keyvalue;
           qcircuito.open;
         end; }
      {end;
  end; }
end;

procedure TfConsultaResultadosMtto.SpeedButton2Click(Sender: TObject);
var
consultasql: string;
begin
qConsultaResultadoMtto.Close;
qConsultaResultadoMtto.sql.Clear;
consultasql:= 'select fmd.CODIGOFORMATOMTTODATOS as "Codigo",FM.NOMBREFORMATOMTTO as "Formato",M.OBSERVACIONELEMENTO as "Mantenimiento", sfd.fechaprueba as "Fecha",  S.NOMBRESUBESTACION as "Subestacion", PE.NOMBRETIPOELEMENTO as "Tipo Elemento" , '+
              'fmd.CLELEMENTO1 as "Elemento", cm.NOMBRECOLUMNAMEDIDA as "Medida", md.valor as "Valor"  '+
              'from hve_valormedidadetalle md, hve_seccionformatodatos sfd, hve_valormedida vm, hve_columnamedida cm, '+
              'subestacion s, pm_elemento PE, HVE_FORMATOMTTO FM, pm_mantenimiento M, hve_formatomttodatos fmd ';
{if dblcbElemento.Text <> '' then
  consultasql:= consultasql + ' ,'+ qTipoElementoNOMBRETABLAELEMENTO.asstring+ ' xx '; }

consultasql:= consultasql + ' where  sfd.CODIGOSECCIONFORMATODATOS = vm.CODIGOSECCIONFORMATODATOS '+
              'and vm.CODIGOVALORMEDIDA = md.CODIGOVALORMEDIDA '+
              'and md.CODIGOCOLUMNAMEDIDA = cm.CODIGOCOLUMNAMEDIDA '+
              'and fmd.CODIGOFORMATOMTTODATOS = sfd.CODIGOFORMATOMTTODATOS '+
              'and fmd.CODIGOSUBESTACION = S.CODIGOSUBESTACION '+
              'AND FMD.CODIGOTIPOELEMENTO = PE.CODIGOELEMENTO '+
              'AND FMD.CODIGOFORMATOMTTO = FM.CODIGOFORMATOMTTO '+
              'AND M.CODIGOMANTENIMIENTO = FMD.CODIGOMANTENIMIENTO';

if dbeFechaDesde.Text <> '' then
Begin
  consultasql:= consultasql + ' and sfd.fechaprueba >= to_date('''+dbeFechaDesde.Text+''',''dd/mm/yyyy hh24:mi:ss'')';
  //ListaDatos.Add('fechahorasolicituddesde='+dbeFechaDesde.Text);
end;
if dbeFechahasta.Text <> '' then
Begin
  consultasql:= consultasql + ' and sfd.fechaprueba <= to_date('''+dbeFechahasta.Text+''',''dd/mm/yyyy hh24:mi:ss'')';
  //ListaDatos.Add('fechahorasolicitudhasta='+dbeFechahasta.Text);
end;

if DBLCBAmbito.Text <> '' then
  consultasql:= consultasql + ' AND FMD.CODIGOAMBITO ='+ qAmbitoCODIGOAMBITO.asstring;

if DBLCBSubestacion.Text <> '' then
  consultasql:= consultasql + ' AND S.CODIGOSUBESTACION  ='''+ qSubestacionCODIGOSUBESTACION.asstring+'''' ;

if DBLCBTipoElemento.Text <> '' then
  consultasql:= consultasql + ' AND FMD.CODIGOTIPOELEMENTO ='+ qTipoElementoCODIGOELEMENTO.asstring;

if DBLCBElemento.Text <> '' then
Begin
  {if DBLCBSubestacion.Text <> '' then
    consultasql:= consultasql + ' and s.codigodubestacion = xx.codigosubestacion ';}
  consultasql:= consultasql + ' AND ((FMD.CLELEMENTO1 = '''+qElemento.fieldByname(qTipoElementoCLAVEELEMENTO1.asstring).asstring+''') OR (FMD.CLELEMENTO2 = '''+qElemento.fieldByname(qTipoElementoCLAVEELEMENTO1.asstring).asstring+'''))';
End;


if DBLCBFormato.Text <> '' then
  consultasql:= consultasql + ' AND FMD.CODIGOFORMATOMTTO ='+ qFormatoCODIGOFORMATOMTTO.asstring;

if DBLCBMedida.Text <> '' then
  consultasql:= consultasql + ' AND CM.CODIGOCOLUMNAMEDIDA  ='+ qMedidaCODIGOCOLUMNAMEDIDA.asstring;

if DBLCBMantenimiento.Text <> '' then
  consultasql:= consultasql + ' AND M.CODIGOMANTENIMIENTO  ='+ qMantenimientoCODIGOMANTENIMIENTO.asstring;
{
and sfd.CODIGOODT = 20100111301
}

qConsultaResultadoMtto.sql.Text:= consultasql;
qConsultaResultadoMtto.sql.Add(' order by md.codigocolumnamedida, sfd.fechaprueba');
qConsultaResultadoMtto.open;




end;

procedure TfConsultaResultadosMtto.sbFechaDesdeClick(Sender: TObject);
begin
  try
    dbeFechaDesde.Setfocus;
    sFecha := dbeFechaDesde.Text;
    if sFecha = '' then
      sFecha := FechaServidorCad;
    Fecha := GetFecha(False);
    if Fecha <> '' then dbeFechaDesde.Text := Fecha;
  except
  end;

end;

function TfConsultaResultadosMtto.FechaServidorCad: string;
var qFecha: TQuery;
begin
  Result := '';
  qFecha := TQuery.Create(Application);
  qFecha.DatabaseName := 'BaseDato';
  qFecha.SQL.Text := 'SELECT SYSDATE FROM DUAL';
  qFecha.Open;
  Result := qFecha.Fields[0].AsString;
  qFecha.Free;
end;

function TfConsultaResultadosMtto.GetFecha(Tipo:Boolean): String;
begin
  fFormaFecha := TfFormaFecha.Create(Application);
  uFormaFecha.sFecha := sFecha;
  fFormaFecha.height:=291;
  if FFormaFecha.ShowModal = mrOk then
    if Tipo then
       Result := DateTimetoStr(FFormaFecha.Date+FFormaFecha.fTime)
    else
       Result := DateTimetoStr(FFormaFecha.Date)
  else Result := sFecha;
  fFormaFecha.Free;
end;


procedure TfConsultaResultadosMtto.sbFechaHastaClick(Sender: TObject);
begin
  try
    dbeFechaHasta.Setfocus;
    sFecha := dbeFechaHasta.Text;
    if sFecha = '' then
      sFecha := FechaServidorCad;
    Fecha := GetFecha(False);
    if Fecha <> '' then dbeFechaHasta.Text := Fecha;
  except
  end;

end;

procedure TfConsultaResultadosMtto.FormCreate(Sender: TObject);
begin
  ListaDatos := TStringList.Create;
  ListaDireccionCampos:=TStringList.Create;
  ListaDireccionCampos.Add('CODIGO=-1');
  ListaDireccionCampos.Add('FORMATO=-1');
  ListaDireccionCampos.Add('MANTENIMIENTO=-1');
  ListaDireccionCampos.Add('FECHA=-1');
  ListaDireccionCampos.Add('TIPOELEMENTO=-1');
  ListaDireccionCampos.Add('ELEMENTO=-1');
  ListaDireccionCampos.Add('MEDIDA=-1');
  ListaDireccionCampos.Add('VALOR=-1');
end;

procedure TfConsultaResultadosMtto.cbAmbitoClick(Sender: TObject);
begin
if cbAmbito.Checked = true then
  qAmbito.open
Else
  qAmbito.close;
end;

procedure TfConsultaResultadosMtto.cbSubestacionClick(Sender: TObject);
begin
if cbSubestacion.Checked = true then
  qSubestacion.open
Else
Begin
  qSubestacion.close;
  qelemento.close;
  cbxElemento.Checked:= false;
end;
end;


procedure TfConsultaResultadosMtto.qSubestacionCODIGOSUBESTACIONChange(
  Sender: TField);
begin
// Cambia la consulta de los Elementos...
  qelemento.close;
  cbxElemento.Checked:= false;
end;

procedure TfConsultaResultadosMtto.cbTipoElementoClick(Sender: TObject);
begin
if cbTipoElemento.Checked then
Begin
  if DBLCBAmbito.Text <> '' then
  Begin
    qTipoElemento.sql.text:= 'SELECT * FROM PM_ELEMENTO WHERE CODIGOAMBITO = :CODIGOAMBITO ORDER BY NOMBRETIPOELEMENTO';
    qTipoElemento.ParamByName('CODIGOAMBITO').ASinteger:=  qAmbitoCODIGOAMBITO.asinteger;
    qTipoElemento.Open;
    cbxelemento.Enabled:= true;
  end
  else
  Begin
    qTipoElemento.sql.text:= 'SELECT * FROM PM_ELEMENTO ORDER BY NOMBRETIPOELEMENTO';
    qTipoElemento.Open;
    cbxelemento.Enabled:= true;
  End;
end
else
Begin
  qTipoElemento.close;
  qElemento.close;
  cbxElemento.Checked := false;
  cbxelemento.Enabled:= false;;
  //Mostrar todos los elementos....Dependiendo el ambito,  y la subestacion...
end;
End;

procedure TfConsultaResultadosMtto.cbxElementoClick(Sender: TObject);
begin
if cbxElemento.Checked then
Begin
  qelemento.close;
  qelemento.SQL.Clear;
  qelemento.sql.Text:= 'SELECT * FROM '+ qTipoElemento.FieldByName('NOMBRETABLAELEMENTO').asstring;
  If DBLCBSubestacion.Text <> '' then
  Begin
    If qSubestacionNOMBRESUBESTACION.ASSTRING <> 'LINEA' THEN
      qelemento.sql.add(' WHERE CODIGOSUBESTACION = '''+ qSubestacionCODIGOSUBESTACION.AsString +''' ORDER BY '+qTipoElemento.fieldbyname('CAMPODESCRIPTIVO').asstring);
  End;
  DBLCBElemento.listField:= qTipoElementoCLAVEELEMENTO1.AsString;
  DBLCBElemento.keyField:= qTipoElementoCLAVEELEMENTO1.AsString;
  qElemento.open;
end
else
Begin
  qElemento.close;
end;
End;

procedure TfConsultaResultadosMtto.qAmbitoCODIGOAMBITOChange(
  Sender: TField);
begin
qTipoElemento.close;
qTipoElemento.sql.text:= 'SELECT * FROM PM_ELEMENTO WHERE CODIGOAMBITO = '+  qAmbitoCODIGOAMBITO.asstring +' ORDER BY NOMBRETIPOELEMENTO';
if cbTipoElemento.Checked then
  qTipoElemento.open;
end;

procedure TfConsultaResultadosMtto.qAmbitoAfterClose(DataSet: TDataSet);
begin
  qTipoElemento.close;
  qTipoElemento.sql.text:= 'SELECT * FROM PM_ELEMENTO ORDER BY NOMBRETIPOELEMENTO';
  if cbTipoElemento.Checked then
    qTipoElemento.open;
end;

procedure TfConsultaResultadosMtto.SBSalirClick(Sender: TObject);
begin
Close;
end;

procedure TfConsultaResultadosMtto.sbExportarClick(Sender: TObject);
Var
  oXL, oWB: Variant;
  fila: integer;
begin
  Present:= Now;
  DecodeDate(Present, Year, Month, Day);
  DecodeTime(Present, Hour, Min, Sec, MSec);
  oXL := CreateOleObject('Excel.Application');
  oXL.Visible := True;
  oWB := oXL.Workbooks.Add;
  oWB.sheets.add.name:= 'Resultados_Mantenimiento';

  oWB.ActiveSheet.Cells[1,1] := 'Código';
  oWB.ActiveSheet.Cells[1,2] := 'Formato';
  oWB.ActiveSheet.Cells[1,3] := 'Mantenimiento';
  oWB.ActiveSheet.Cells[1,4] := 'Fecha';
  oWB.ActiveSheet.Cells[1,5] := 'Subestación';
  oWB.ActiveSheet.Cells[1,6] := 'Tipo Elemento';
  oWB.ActiveSheet.Cells[1,7] := 'Elemento';
  oWB.ActiveSheet.Cells[1,8] := 'Medida';
  oWB.ActiveSheet.Cells[1,9] := 'Valor';
  qConsultaResultadoMtto.First;
  fila:= 2;
  while not qConsultaResultadoMtto.eof do
  begin
    oWB.ActiveSheet.Cells[fila,1] :=  qConsultaResultadoMtto.FIELDBYNAME('Código').asstring;
    oWB.ActiveSheet.Cells[fila,2] :=  qConsultaResultadoMtto.FIELDBYNAME('Formato').asstring;
    oWB.ActiveSheet.Cells[fila,3] :=  qConsultaResultadoMtto.FIELDBYNAME('Mantenimiento').asstring;
    oWB.ActiveSheet.Cells[fila,4] :=  qConsultaResultadoMtto.FIELDBYNAME('Fecha').asstring;
    oWB.ActiveSheet.Cells[fila,5] :=  qConsultaResultadoMtto.FIELDBYNAME('Subestación').asstring;
    oWB.ActiveSheet.Cells[fila,6]:=  qConsultaResultadoMtto.FIELDBYNAME('Tipo Elemento').asstring;
    oWB.ActiveSheet.Cells[fila,7] :=  qConsultaResultadoMtto.FIELDBYNAME('Elemento').asstring;
    oWB.ActiveSheet.Cells[fila,8] :=  qConsultaResultadoMtto.FIELDBYNAME('Medida').asstring;
    oWB.ActiveSheet.Cells[fila,9]:=  qConsultaResultadoMtto.FIELDBYNAME('Valor').asstring;
    fila:= fila + 1;
    qConsultaResultadoMtto.next;
  end;
  //oWB.SaveAs('C:\EnerGIS4\ConsultaMttosElemento'+'_'+IntToStr(Day)+'_'+ IntToStr(Month)+'_' +IntToStr(Year) + '_'+ IntToStr(Hour)+'y'+IntToStr(Min),null,'','',EmptyParam,EmptyParam,0, EmptyParam, EmptyParam, EmptyParam,EmptyParam,0);

end;

procedure TfConsultaResultadosMtto.sbRefrescarClick(Sender: TObject);
begin
qConsultaResultadoMtto.close;
qConsultaResultadoMtto.open;
end;

procedure TfConsultaResultadosMtto.cbFormatoClick(Sender: TObject);
begin
if cbFormato.Checked then
Begin
  qFormato.open;
end
else
Begin
  qMedida.close;
  cbMedida.Checked := false;
  qFormato.close;
End;
end;

procedure TfConsultaResultadosMtto.cbMedidaClick(Sender: TObject);
begin
if cbmedida.Checked then
Begin
  if  DBLCBFormato.Text <> '' then
  Begin
    qMedida.sql.Text:= 'select CM.CODIGOCOLUMNAMEDIDA, CM.NOMBRECOLUMNAMEDIDA from hve_columnamedida cm, hve_seccionformato sf where '+
                       ' cm.CODIGOSECCIONFORMATO = sf.CODIGOSECCIONFORMATO '+
                       ' AND SF.CODIGOFORMATOMTTO = :CODIGOFORMATOMTTO '+
                       ' AND SF.ACTIVO = ''S'' '+
                       ' AND CM.ACTIVO = ''S''';
    qMedida.ParamByName('CODIGOFORMATOMTTO').asinteger := qFormatoCODIGOFORMATOMTTO.asinteger;
    qMedida.open;
  end
  else
  Begin
    qMedida.sql.Text:= 'select CM.CODIGOCOLUMNAMEDIDA, CM.NOMBRECOLUMNAMEDIDA from hve_columnamedida cm, hve_seccionformato sf where '+
                       ' cm.CODIGOSECCIONFORMATO = sf.CODIGOSECCIONFORMATO '+
                       ' AND SF.ACTIVO = ''S'' '+
                       ' AND CM.ACTIVO = ''S''';
    qMedida.open;
  End;
end
else
Begin
  qMedida.close;
end;
end;

procedure TfConsultaResultadosMtto.cbManteniemientoClick(Sender: TObject);
begin
if cbManteniemiento.Checked = true then
  qMantenimiento.open
else
  qMantenimiento.close;
end;

procedure TfConsultaResultadosMtto.qTipoElementoCODIGOTIPOELEMENTOChange(
  Sender: TField);
begin
//creacion sql de qelemento
qelemento.close;
qelemento.SQL.Clear;
qelemento.sql.Text:= 'SELECT * FROM '+ qTipoElemento.FieldByName('NOMBRETABLAELEMENTO').asstring;
If DBLCBSubestacion.Text <> '' then
Begin
  If qSubestacionNOMBRESUBESTACION.ASSTRING <> 'LINEA' THEN
    qelemento.sql.add(' WHERE CODIGOSUBESTACION = '''+ qSubestacionCODIGOSUBESTACION.AsString +''' ORDER BY '+qTipoElemento.fieldbyname('CAMPODESCRIPTIVO').asstring);
end;
end;

procedure TfConsultaResultadosMtto.qSubestacionAfterScroll(
  DataSet: TDataSet);
begin
if qelemento.IsEmpty then
Begin
  qelemento.close;
  cbxElemento.Checked:= false;
end;
end;

procedure TfConsultaResultadosMtto.FormShow(Sender: TObject);
begin
qAmbito.Locate('codigoambito',1,[]);
DBLCBAmbito.KeyValue:= 1;
DBLCBAmbito.ReadOnly:= true;
cbAmbito.Visible:= false;

end;

procedure TfConsultaResultadosMtto.SBOrdenarClick(Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel2.ClientToScreen(Classes.Point(SBOrdenar.Left, SBOrdenar.top));
  pmOrdenar.Popup(punto.x+10, punto.y+10);
end;

procedure TfConsultaResultadosMtto.CODIGOClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('CODIGO');
  sCriterio := 'ORDER BY fmd.CODIGOFORMATOMTTODATOS DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['CODIGO']='1') then
    begin
      sCriterio := 'ORDER BY fmd.CODIGOFORMATOMTTODATOS ASC';
      ListaDireccionCampos.Values['CODIGO']:='-1';
    end
    else
      ListaDireccionCampos.Values['CODIGO']:='1'
  end;
  Codigo.Checked := true;
  Ordenar(sCriterio);
  with dbgListaResultados do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qConsultaResultadoMttoCodigo;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaResultadosMtto.Ordenar(sCriterio: String);
begin
  qConsultaResultadoMtto.Close;
  qConsultaResultadoMtto.SQL.Delete(qConsultaResultadoMtto.SQL.Count - 1);
  qConsultaResultadoMtto.SQL.Add(sCriterio);
  qConsultaResultadoMtto.Open;
  dbgListaResultados.SetFocus;
end;

procedure TfConsultaResultadosMtto.FORMATOClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FORMATO');
  sCriterio := 'ORDER BY FM.NOMBREFORMATOMTTO DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['FORMATO']='1') then
    begin
      sCriterio := 'ORDER BY FM.NOMBREFORMATOMTTO ASC';
      ListaDireccionCampos.Values['FORMATO']:='-1';
    end
    else
      ListaDireccionCampos.Values['FORMATO']:='1'
  end;
  FORMATO.Checked := true;
  Ordenar(sCriterio);
  with dbgListaResultados do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qConsultaResultadoMttoFORMATO;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaResultadosMtto.MANTENIMIENTOClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('MANTENIMIENTO');
  sCriterio := 'ORDER BY M.OBSERVACIONELEMENTO DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['MANTENIMIENTO']='1') then
    begin
      sCriterio := 'ORDER BY M.OBSERVACIONELEMENTO ASC';
      ListaDireccionCampos.Values['MANTENIMIENTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['MANTENIMIENTO']:='1'
  end;
  MANTENIMIENTO.Checked := true;
  Ordenar(sCriterio);
  with dbgListaResultados do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qConsultaResultadoMttoMANTENIMIENTO;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaResultadosMtto.FECHAPRUEBAClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHAPRUEBA');
  sCriterio := 'ORDER BY sfd.fechaprueba DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['FECHAPRUEBA']='1') then
    begin
      sCriterio := 'ORDER BY sfd.fechaprueba ASC';
      ListaDireccionCampos.Values['FECHAPRUEBA']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHAPRUEBA']:='1'
  end;
  FECHAPRUEBA.Checked := true;
  Ordenar(sCriterio);
  with dbgListaResultados do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qConsultaResultadoMttoFecha;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;

end;

procedure TfConsultaResultadosMtto.SUBESTACIONClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('SUBESTACION');
  sCriterio := 'ORDER BY sfd.fechaprueba DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['SUBESTACION']='1') then
    begin
      sCriterio := 'ORDER BY sfd.fechaprueba ASC';
      ListaDireccionCampos.Values['SUBESTACION']:='-1';
    end
    else
      ListaDireccionCampos.Values['SUBESTACION']:='1'
  end;
  SUBESTACION.Checked := true;
  Ordenar(sCriterio);
  with dbgListaResultados do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qConsultaResultadoMttoSubestacion;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaResultadosMtto.TIPOELEMENTOClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('TIPOELEMENTO');
  sCriterio := 'ORDER BY PE.NOMBRETIPOELEMENTO DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['TIPOELEMENTO']='1') then
    begin
      sCriterio := 'ORDER BY PE.NOMBRETIPOELEMENTO ASC';
      ListaDireccionCampos.Values['TIPOELEMENTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['TIPOELEMENTO']:='1'
  end;
  TIPOELEMENTO.Checked := true;
  Ordenar(sCriterio);
  with dbgListaResultados do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qConsultaResultadoMttoTipoElemento;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaResultadosMtto.ELEMENTOClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('ELEMENTO');
  sCriterio := 'ORDER BY fmd.CLELEMENTO1 DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['ELEMENTO']='1') then
    begin
      sCriterio := 'ORDER BY fmd.CLELEMENTO1 ASC';
      ListaDireccionCampos.Values['ELEMENTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['ELEMENTO']:='1'
  end;
  ELEMENTO.Checked := true;
  Ordenar(sCriterio);
  with dbgListaResultados do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qConsultaResultadoMttoElemento;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaResultadosMtto.MEDIDAClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('MEDIDA');
  sCriterio := 'ORDER BY cm.NOMBRECOLUMNAMEDIDA DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['MEDIDA']='1') then
    begin
      sCriterio := 'ORDER BY cm.NOMBRECOLUMNAMEDIDA ASC';
      ListaDireccionCampos.Values['MEDIDA']:='-1';
    end
    else
      ListaDireccionCampos.Values['MEDIDA']:='1'
  end;
  MEDIDA.Checked := true;
  Ordenar(sCriterio);
  with dbgListaResultados do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style - [fsBold];
    SelectedField:=qConsultaResultadoMttoMedida;
    Columns[Col-1].title.Font.Style :=Columns[Col-1].title.Font.Style + [fsBold];
  end;
end;

procedure TfConsultaResultadosMtto.SBBuscarClick(Sender: TObject);
begin
  FBusquedaResultadoMtto := TFBusquedaResultadoMtto.Create(Application);
  FBusquedaResultadoMtto.dsMtto.DataSet:=qConsultaResultadoMtto;
  FBusquedaResultadoMtto.ShowModal;
  FBusquedaResultadoMtto.Free;
  dbgListaResultados.Setfocus;
end;

end.
