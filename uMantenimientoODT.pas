{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}

{$MINSTACKSIZE $00004000}

{$MAXSTACKSIZE $01000000}

{$IMAGEBASE $00400000}

{$APPTYPE GUI}
unit uMantenimientoODT;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ComCtrls, StdCtrls, ExtCtrls, Db, DBTables, Buttons, Grids,
  DBGrids,UBase, RXDBCtrl, Menus;

type
  TfMantenimientoODT = class(TFBase)
//  TfMantenimientoODT = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    qSubestacion: TQuery;
    dsSubestacion: TDataSource;
    qCoordinacion: TQuery;
    dsCoordinacion: TDataSource;
    dsLinea: TDataSource;
    qLinea: TQuery;
    qMantenimientos: TQuery;
    Memo1: TMemo;
    lbCodigodisponible: TListBox;
    lbCodigoagregado: TListBox;
    qODT: TQuery;
    qMantenimientoODT: TQuery;
    updODT: TUpdateSQL;
    updMantenimientoODT: TUpdateSQL;
    dsODTAsignada: TDataSource;
    qMttoAsignado: TQuery;
    qODTAsignadaCODIGOODT: TFloatField;
    qODTAsignadaFECHAEMISION: TDateTimeField;
    qODTAsignadaCODIGOESTADOODT: TStringField;
    qODTAsignadaCODIGOLABOR: TStringField;
    qODTAsignadaCODIGOTIPOTAREA: TFloatField;
    qEstadoODT: TQuery;
    qODTAsignadaestadoodt: TStringField;
    qLabor: TQuery;
    qTipotarea: TQuery;
    qODTAsignadalabor: TStringField;
    qODTAsignadatipotarea: TStringField;
    qMttoAsignadoCODIGOMANTENIMIENTO: TFloatField;
    qMttoAsignadoNOMBRETAREA: TStringField;
    qMttoAsignadoelemento: TStringField;
    qSeodt: TQuery;
    qCoordinacionodt: TQuery;
    dsSeodt: TDataSource;
    dsCoordinacionodt: TDataSource;
    dsMttoAsignado: TDataSource;
    QLineaodt: TQuery;
    updMttoAsignado: TUpdateSQL;
    qMttoAsignadoCODIGOODT: TFloatField;
    qMttoDisponible: TQuery;
    dsMttoDisponible: TDataSource;
    qEstadoTarea: TQuery;
    updEstadoTarea: TUpdateSQL;
    qEstadoTareaCODIGOTAREA: TFloatField;
    qEstadoTareaCODIGOESTADOTAREA: TFloatField;
    qTareaodt: TQuery;
    updTareaodt: TUpdateSQL;
    qTareaodtCODIGOESTADOTAREA: TFloatField;
    qMttoDisponibleCODIGOMANTENIMIENTO: TFloatField;
    qMttoDisponibleNOMBRETAREA: TStringField;
    qTareaodtCODIGOTAREA: TFloatField;
    qModt: TQuery;
    updModt: TUpdateSQL;
    Panel6: TPanel;
    Panel1: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel10: TPanel;
    qODTDia: TQuery;
    DataSource1: TDataSource;
    updODTDia: TUpdateSQL;
    qMantenimientoODTCONSECUTIVO: TFloatField;
    qMantenimientoODTCODIGOMANTENIMIENTO: TFloatField;
    qMantenimientoODTCODIGOODT: TFloatField;
    qODTDiaCODIGOODT: TFloatField;
    qODTDiaCONSECUTIVO: TFloatField;
    qODTDiaIMPRESOODT: TStringField;
    qODTDiaCODIGOGRUPOTRABAJO: TFloatField;
    qODTDiaCODIGOGEOGRAFICO: TFloatField;
    qODTDiaCODIGOTIPOVIA: TFloatField;
    qODTDiaCODIGONOMBREVIA: TFloatField;
    qODTDiaMODIFICADORVIA: TStringField;
    qODTDiaDUPLICADOR: TFloatField;
    qODTDiaMODIFICADORDUPLICADOR: TStringField;
    qODTDiaNUMEROPUERTA: TFloatField;
    qODTDiaCODIGOSUBESTACION: TStringField;
    qODTDiaCODIGOCIRCUITO: TStringField;
    qODTDiaCODIGOTIPOELEMENTO: TStringField;
    qODTDiaCODIGOEQUIPO: TStringField;
    qODTDiaFECHAINICIOTRABAJO: TDateTimeField;
    qODTDiaFECHAFINALTRABAJO: TDateTimeField;
    qODTDiaTIEMPOUTIL: TFloatField;
    qODTDiaHORASHOMBRE: TFloatField;
    qODTDiaCOSTOMATERIAL: TFloatField;
    qODTDiaCOSTOMANOOBRA: TFloatField;
    qODTDiaCOSTOTRANSPORTE: TFloatField;
    qODTDiaCOSTOEQUIPO: TFloatField;
    qODTDiaOBSERVACION3: TStringField;
    qODTDiaCODIGOTIPOPREDIO: TStringField;
    qODTDiaDESCRIPCIONTIPOPREDIO: TStringField;
    qODTDiaGENERAINDICE: TStringField;
    qODTDiaCODIGOTIPOTRABAJOODT: TFloatField;
    qODTDiaCODIGOTIPOACTIVO: TFloatField;
    qODTDiaCODIGOTIPOINTERVENCION: TFloatField;
    qODTDiaCODIGONIVELTENSION: TStringField;
    qODTDiaCODIGOLINEA: TStringField;
    qODTDiaAFECTAACTIVO: TStringField;
    qODTDiaCODIGOODTOPERA: TFloatField;
    qODTDiaCODIGOADMINISTRATIVO: TFloatField;
    qOdtda: TQuery;
    updOdtda: TUpdateSQL;
    qMttoAsignadoCONSECUTIVO: TFloatField;
    qModtCONSECUTIVO: TFloatField;
    qModtCODIGOODT: TFloatField;
    qModtCODIGOMANTENIMIENTO: TFloatField;
    qOdtdaCODIGOODT: TFloatField;
    qOdtdaCONSECUTIVO: TFloatField;
    qOdtdaIMPRESOODT: TStringField;
    qOdtdaCODIGOGRUPOTRABAJO: TFloatField;
    qOdtdaCODIGOGEOGRAFICO: TFloatField;
    qOdtdaCODIGOTIPOVIA: TFloatField;
    qOdtdaCODIGONOMBREVIA: TFloatField;
    qOdtdaMODIFICADORVIA: TStringField;
    qOdtdaDUPLICADOR: TFloatField;
    qOdtdaMODIFICADORDUPLICADOR: TStringField;
    qOdtdaNUMEROPUERTA: TFloatField;
    qOdtdaCODIGOSUBESTACION: TStringField;
    qOdtdaCODIGOCIRCUITO: TStringField;
    qOdtdaCODIGOTIPOELEMENTO: TStringField;
    qOdtdaCODIGOEQUIPO: TStringField;
    qOdtdaFECHAINICIOTRABAJO: TDateTimeField;
    qOdtdaFECHAFINALTRABAJO: TDateTimeField;
    qOdtdaTIEMPOUTIL: TFloatField;
    qOdtdaHORASHOMBRE: TFloatField;
    qOdtdaCOSTOMATERIAL: TFloatField;
    qOdtdaCOSTOMANOOBRA: TFloatField;
    qOdtdaCOSTOTRANSPORTE: TFloatField;
    qOdtdaCOSTOEQUIPO: TFloatField;
    qOdtdaOBSERVACION1: TStringField;
    qOdtdaOBSERVACION2: TStringField;
    qOdtdaOBSERVACION3: TStringField;
    qOdtdaCODIGOTIPOPREDIO: TStringField;
    qOdtdaDESCRIPCIONTIPOPREDIO: TStringField;
    qOdtdaGENERAINDICE: TStringField;
    qOdtdaCODIGOTIPOTRABAJOODT: TFloatField;
    qOdtdaCODIGOTIPOACTIVO: TFloatField;
    qOdtdaCODIGOTIPOINTERVENCION: TFloatField;
    qOdtdaCODIGONIVELTENSION: TStringField;
    qOdtdaCODIGOLINEA: TStringField;
    qOdtdaAFECTAACTIVO: TStringField;
    qOdtdaCODIGOODTOPERA: TFloatField;
    qOdtdaCODIGOADMINISTRATIVO: TFloatField;
    qSubactividadodt: TQuery;
    updSubactividadodt: TUpdateSQL;
    qSubactividadodtCODIGOODTSUBACTIVIDADDATOS: TFloatField;
    qSubactividadodtCODIGOODTACTIVIDADDATOS: TFloatField;
    qSubactividadodtCODIGOSUBACTIVIDADAREANTODT: TFloatField;
    qSubactividadodtCODIGOODT: TFloatField;
    qSubactividadodtCONSECUTIVO: TFloatField;
    qODTAsignada: TQuery;
    DataSource2: TDataSource;
    qMedidaSeguridad: TQuery;
    updMedidaSeguridad: TUpdateSQL;
    qODTCODIGOODT: TFloatField;
    qODTFECHAEMISION: TDateTimeField;
    qODTMOTIVOS: TMemoField;
    qODTCODIGOADMINISTRATIVO: TFloatField;
    qODTCODIGOPRIORIDAD: TStringField;
    qODTCODIGOLABOR: TStringField;
    qODTCODIGOTIPOTAREA: TFloatField;
    qODTCODIGOAPROBADO: TFloatField;
    qODTCODIGOREVISADO: TFloatField;
    qODTCODIGOODTTIPOMANOOBRA: TFloatField;
    qODTCODIGOEJECUTOR: TFloatField;
    qODTCODIGOFIRMANTE: TFloatField;
    qODTEQUIPOENERGIZADO: TStringField;
    qODTFECHAAPROBACION: TDateTimeField;
    qODTFECHAASIGNACION: TDateTimeField;
    qODTIMPUTACIONMATERIAL: TStringField;
    qODTCOSTOMATERIAL: TFloatField;
    qODTCOSTOMANOOBRA: TFloatField;
    qODTCOSTOTRANSPORTE: TFloatField;
    qODTCOSTOEQUIPO: TFloatField;
    qODTCODIGOALMACEN: TStringField;
    qODTCODIGOESTADOODT: TStringField;
    qODTHORARIONORMALDESDE: TDateTimeField;
    qODTHORARIONORMALHASTA: TDateTimeField;
    qODTCODIGOTURNOGRUPO: TFloatField;
    qODTCODIGOZONATRABAJO: TFloatField;
    qODTCODIGOIMPUTACIONMATERIAL: TFloatField;
    qODTSECUENCIA: TStringField;
    qODTCODIGOMUNICIPIO: TFloatField;
    qODTFECHAINICIO: TDateTimeField;
    qODTFECHAFINAL: TDateTimeField;
    qODTCODIGOAREAINFLUENCIA: TStringField;
    qODTCODIGOZONAORIGEN: TFloatField;
    qODTCODIGOCONTRATISTA: TStringField;
    qODTNUMEROCONTRATO: TStringField;
    qTemp: TQuery;
    updTemp: TUpdateSQL;
    qTempCODIGOODT: TFloatField;
    qTempCONSECUTIVO: TFloatField;
    qTempCODIGOMEDIDASEGURIDAD: TFloatField;
    qTempESTADO: TFloatField;
    sbODT: TSpeedButton;
    sbEliminar: TSpeedButton;
    Panel25: TPanel;
    qTipoElemento: TQuery;
    dsTipoElemento: TDataSource;
    qTipoElementoCODIGOELEMENTO: TFloatField;
    qTipoElementoCODIGOTIPOELEMENTO: TStringField;
    qTipoElementoNOMBRETIPOELEMENTO: TStringField;
    qOdtdanombreTipoElemento: TStringField;
    dsOdtda: TDataSource;
    Panel26: TPanel;
    Panel9: TPanel;
    Panel21: TPanel;
    lbAgregados: TListBox;
    qSubactividadodtPROGRAMADA: TStringField;
    qSubactividadodtEJECUTADA: TStringField;
    qODTDiaODTGENERADA: TStringField;
    qElementoMtto: TQuery;
    qElementoMttoCODIGOELEMENTOMANTENIMIENTO: TFloatField;
    qElementoMttoCLELEMENTO1: TStringField;
    qElementoMttoCLELEMENTO2: TStringField;
    qElementoMttoCODIGOELEMENTO: TFloatField;
    Panel27: TPanel;
    sbProgramar: TSpeedButton;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SBImprimir: TSpeedButton;
    SBBuscar: TSpeedButton;
    SBOrdenar: TSpeedButton;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel1: TBevel;
    sbExportar: TSpeedButton;
    Bevel4: TBevel;
    sbFiltrar: TSpeedButton;
    PanelSuperior: TPanel;
    Panel20: TPanel;
    qMantenimientosCODIGOAMBITO: TFloatField;
    qMantenimientosCODIGOAREAOPERACIONODT: TFloatField;
    qMantenimientosNOMBRETAREA: TStringField;
    qMantenimientosCODIGOTAREA: TFloatField;
    qMantenimientosCODIGOTIPOMANT: TFloatField;
    qMantenimientosCODIGOELEMENTO: TFloatField;
    qMantenimientosNOMBREAREAOPERACIONODT: TStringField;
    qMantenimientosCLELEMENTO1: TStringField;
    qMantenimientosCLELEMENTO2: TStringField;
    qMantenimientosNOMBRESUBESTACION: TStringField;
    qODTCODIGOMODOODT: TFloatField;
    Panel5: TPanel;
    sbDescartar: TSpeedButton;
    sbAgregar: TSpeedButton;
    qMantenimientosFECHAINICIAL: TDateTimeField;
    qMantenimientosFECHAFINAL: TDateTimeField;
    dbgListaMantenimientos: TRxDBGrid;
    dsMantenimientos: TDataSource;
    pmOrdenar: TPopupMenu;
    CodigoTarea: TMenuItem;
    NombreTarea: TMenuItem;
    Fechainicial: TMenuItem;
    NombreSubestacion: TMenuItem;
    fechafinal: TMenuItem;
    clElemento1: TMenuItem;
    NOMBREAREAOPERACIONODT: TMenuItem;
    qODTNOTAS: TMemoField;
    qODTDiaOBSERVACION1: TMemoField;
    qODTDiaOBSERVACION2: TMemoField;
    procedure FormShow(Sender: TObject);
    procedure sbAgregarClick(Sender: TObject);
    procedure sbEliminarClick(Sender: TObject);
    procedure sbODTClick(Sender: TObject);
    procedure qMttoAsignadoCalcFields(DataSet: TDataSet);
    procedure FechaodtChange(Sender: TObject);
    procedure dblcbSeClick(Sender: TObject);
    procedure dblcbCoordinacionodtClick(Sender: TObject);
    procedure dblcbLineaodtClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure qMttoAsignadoBeforeDelete(DataSet: TDataSet);
    procedure sbDescartarClick(Sender: TObject);
    procedure qSubactividadodtNewRecord(DataSet: TDataSet);
    procedure qSubactividadodtAfterDelete(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SBSalirClick(Sender: TObject);
    procedure SBFiltrar1Click(Sender: TObject);
    procedure sbFiltrarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SBOrdenarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CodigoTareaClick(Sender: TObject);
    procedure NombreTareaClick(Sender: TObject);
    procedure NombreSubestacionClick(Sender: TObject);
    procedure clElemento1Click(Sender: TObject);
    procedure FechainicialClick(Sender: TObject);
    procedure fechafinalClick(Sender: TObject);
    procedure NOMBREAREAOPERACIONODTClick(Sender: TObject);
  private
    { Private declarations }
    ListaDireccionCampos:TStringList;
  public
    { Public declarations }
    MesActual,YearActual,DiaActual,YearCalendario,MesCalendario,DiaCalendario,Year,Mes,Dia:word;
    Fechaodt1:Tdate;
    Eraseodt:boolean;
    fechaconsulta:string;
    NMantenimientoODT:integer;
    qTemp1:Tquery;
    elemento, codigosagregados, sCriterio:string;
    procedure consultarElemento(codigotipoelemento:string);
    procedure Ordenar(sCriterio:String);
  end;

var
  fMantenimientoODT: TfMantenimientoODT;

implementation

uses ufiltroGenerarOdt, uComunesAdministrativo;

{$R *.DFM}

procedure TfMantenimientoODT.FormShow(Sender: TObject);
begin
  if qSubestacion.Active then
    qSubestacion.Close;
  qSubestacion.Open;
  if qCoordinacion.Active then
    qCoordinacion.Close;
  qCoordinacion.Open;
  NMantenimientoODT:= 1;
end;

procedure TfMantenimientoODT.sbAgregarClick(Sender: TObject);
var i: integer;
begin
    if Length(codigosagregados) > 0 then codigosagregados := codigosagregados + ',';
    if (qMantenimientos.RecordCount >= 1) then
    begin
        if dbgListaMantenimientos.SelectedRows.Count>0 then
        begin
            for i:=0 to dbgListaMantenimientos.SelectedRows.Count-1 do
            begin
              qMantenimientos.BookMark:=dbgListaMantenimientos.SelectedRows.Items[i];
              lbCodigoagregado.Items.Add(qMantenimientosCODIGOTAREA.AsString);
              //lbAgregados.Items.Add(lbDisponibles.Items.Strings[lbDisponibles.itemindex]);
              lbAgregados.Items.Add(qMantenimientos.fieldbyname('CODIGOTAREA').asstring+' '+'--'+' '+  qMantenimientos.fieldbyname('NOMBRETAREA').asstring+' '+'--'+' '+qMantenimientos.FieldByName('NOMBRESUBESTACION').AsString +' '+'--'+' '+elemento+' '+'--'+' '+qMantenimientos.FieldByName('FECHAINICIAL').AsString+' '+'--'+' '+qMantenimientos.FieldByName('FECHAFINAL').AsString);
              if lbAgregados.Items.Count > 0 then
                sbODT.Enabled:= true;
              codigosagregados:= codigosagregados + qMantenimientosCODIGOTAREA.AsString+ ',';
            end;
            Delete(codigosagregados, Length(codigosagregados), 1);
            qmantenimientos.Close;
            qMantenimientos.sql.Clear;
            qmantenimientos.sql.Text:= 'SELECT bm.codigoambito,AM.NOMBREAMBITO, bm.codigoareaoperacionodt, t.nombretarea,t.codigotarea,m.codigotipomant,TM.NOMBREMANT,  bm.codigoelemento,a.nombreareaoperacionodt, '+
                                      '  em.clelemento1,em.clelemento2,sb.nombresubestacion,t.FECHAINICIAL,t.FECHAFINAL '+
                                      '  FROM PM_TAREA t,PM_MANTENIMIENTO m,PM_BANCOMANTENIMIENTO bm,PM_ELEMENTOMANTENIMIENTO em, '+
                                      '  SUBESTACION sb,areaoperacionodt a, pm_ambito am, PM_TIPOMANTENIMIENTO TM '+
                                      '  WHERE t.codigoestadotarea = 4 '+
                                      '  AND t.codigotarea = m.codigomantenimiento '+
                                      '  AND m.codigosubestacion = sb.codigosubestacion '+
                                      '  AND m.codigobancomantenimiento = bm.codigobancomantenimiento '+
                                      '  AND bm.codigoambito = 1 '+
                                      '  AND bm.codigoareaoperacionodt = a.codigoareaoperacionodt '+
                                      '  AND m.codigomantenimiento = em.codigoelementomantenimiento '+
                                      '  AND BM.CODIGOAMBITO = AM.CODIGOAMBITO '+
                                      '  AND M.CODIGOTIPOMANT = TM.CODIGOTIPOMANT ';
            if codigosagregados <>'' then
              qmantenimientos.sql.Text:= qmantenimientos.sql.Text + '  and t.codigotarea not in ('+codigosagregados +')';
            qMantenimientos.open;
        End;
    end
    else
      MessageDlg('Debe seleccionar primero un mantenimiento.', mtInformation,[mbOk], 0);
end;

procedure TfMantenimientoODT.sbEliminarClick(Sender: TObject);
var i: integer;
begin
  {if (lbAgregados.Items.Count >= 1) then
    if (lbAgregados.ItemIndex <> -1) then
      begin
        i:= lbAgregados.ItemIndex;
        lbCodigodisponible.Items.Add(lbCodigoagregado.Items.Strings[lbAgregados.itemindex]);
        lbDisponibles.Items.Add(lbAgregados.Items.Strings[lbAgregados.itemindex]);
        lbAgregados.Items.Delete(lbAgregados.ItemIndex);
        lbCodigoagregado.Items.Delete(i);
        if lbAgregados.Items.Count = 0 then
          sbODT.Enabled:= false;
      end
    else
      MessageDlg('Debe seleccionar primero un mantenimiento.', mtInformation,[mbOk], 0); }
end;

procedure TfMantenimientoODT.sbODTClick(Sender: TObject);
function GenerarImpreso:string;
var i:Integer;
    s1:string;
begin
    Result:='';
    s1:= qODTDia.FieldByName('CODIGOODT').asstring;
    for i:=5 downto Length(s1) do
       Result:='0' + Result;
    Result:=Result + s1 + '-' + inttostr(NMantenimientoODT);
end;

procedure MedidasDeSeguridad(CodigoAdministrativo,CodigoODT,Consecutivo:string);
var qDatos:Tquery;
begin
  qDatos:= TQuery.Create(Application);
  qDatos.DataBaseName  :='BaseDato';
  qDatos.SQL.Text:='SELECT CODIGOMEDIDASEGURIDAD FROM MEDIDASEGURIDAD WHERE '+
                   'CODIGOADMINISTRATIVO = ' + CodigoAdministrativo + ' ORDER BY ORDEN';
  qDatos.Open;
  if qTemp.Active then
      qTemp.Close;
  qTemp.Open;
  while not qDatos.Eof do
  begin
    qTemp.Append;
    qTemp.FieldByName('CODIGOODT').asfloat:= strtofloat(CodigoODT);
    qTemp.FieldByName('CONSECUTIVO').asinteger:= strtoint(Consecutivo);
    qTemp.FieldByName('CODIGOMEDIDASEGURIDAD').asinteger:= qDatos.Fields[0].Asinteger;
    qTemp.FieldByName('ESTADO').asinteger:= 1;
    qTemp.Post;
    qDatos.Next;
  end;
  qDatos.Free;
end;

var
qDatos,qryap,qrycsnt,qObservacion, query, qConsulta:Tquery;
i,tipotarea,iterador:integer;
sqlodt,fechasql,labor,sqlap,sqlcsnt, nombresecuencia:string;
fechaodt:Tdate;
CODIGO_ODT: double;
begin
  try
      if qODT.Active then qODT.Close;
      query:=TQuery.create(self);
      query.DatabaseName :='BaseDato';
      querY.sql.add('SELECT NOMBRESECUENCIA FROM ODT_SECUENCIAZONA WHERE CODIGOZONA=1');
      query.open;
      if query.IsEmpty then
        raise  exception.create('No existe una secuencia definida para esta zona.');
      nombresecuencia:=query.fields[0].AsString;
      query.close;
      query.sql.clear;
      try
        query.sql.add('SELECT '+ NOMBRESECUENCIA+'.NEXTVAL codigo FROM DUAL');
        query.open;
        CODIGO_ODT:=query.fields[0].asfloat;
      except
        showmessage('Error al tratar de generar el código de ODT a partir de la secuencia de la Zona.');
      end;
      query.free;

        qObservacion:=TQuery.Create(Application);
        qObservacion.DatabaseName:='basedato';
        qObservacion.SQL.Text:= ' select m.observacionelemento from pm_mantenimiento m'+
                                ' where codigomantenimiento=:codigomantenimiento'+
                                ' and m.observacionelemento is not null';

        for i:= 0 to lbCodigoagregado.Items.Count -1 do
        begin
          qObservacion.Close;
          qObservacion.ParamByName('codigomantenimiento').asstring:=lbCodigoagregado.Items.Strings[I];
          qObservacion.Open;
          if (qObservacion.fields[0].AsString)<>'' then
          begin
            memo1.Lines.Append(qObservacion.fields[0].AsString);
          end;
        end;
        if(Memo1.Lines.Text='')then
        begin
          for i:= 0 to lbAgregados.Items.Count -1 do
            memo1.Lines.Append(lbAgregados.items.strings[i]);
        end;

        fechaodt:= now;
        fechasql:= datetostr(fechaodt);
        //PASAR LABOR
        if qMantenimientosCODIGOAMBITO.AsInteger=1 then
        begin
          if qMantenimientos.FieldByName('CODIGOTIPOMANT').asinteger = 4 then
            labor:='16'
          else
            labor:='15';
        end;
        //PASAR TIPOTAREA
        if qMantenimientosCODIGOAREAOPERACIONODT.AsInteger=12 then
          tipotarea:= 18;       //prot
        if qMantenimientosCODIGOAREAOPERACIONODT.AsInteger=13 then
          tipotarea:= 19;            //pred
        if qMantenimientosCODIGOAREAOPERACIONODT.AsInteger=14 then
          tipotarea:= 17;                  //sube
        if qMantenimientosCODIGOAREAOPERACIONODT.AsInteger=15 then
          tipotarea:= 20;

               //PASAR LABOR
        {if rbSubestacion.Checked then
          begin
            if qMantenimientos.FieldByName('CODIGOTIPOMANT').asinteger = 4 then
              labor:='16'
            else
              labor:='15';
          end
        else
          begin
            if qMantenimientos.FieldByName('CODIGOTIPOMANT').asinteger = 4 then
              labor:='16'
            else
              labor:='32';
          end;
          }
                   
        sqlodt:= ' insert into odt(codigoodt,codigozonaorigen, fechaemision,motivos,codigoadministrativo,codigoprioridad,codigoestadoodt,codigolabor,codigotipotarea)'+
                 ' values('+floattostr(CODIGO_ODT)+', 1, to_date('''+fechasql+''',''dd/mm/yyyy''),'''+memo1.Text+''',1385,''1'',''1'','''+labor+''','''+inttostr(tipotarea)+''' )';

        if qODT.Active then
          qODT.Close;
        qODT.Open;
        qODT.Append;
        qODT.FieldByName('CODIGOODT').asfloat:= CODIGO_ODT;
        qODT.FieldByName('FECHAEMISION').asstring:= fechasql;
        qODT.FieldByName('MOTIVOS').asstring:= memo1.Text;
        qODT.FieldByName('CODIGOADMINISTRATIVO').asfloat:= 1385;
        qODT.FieldByName('CODIGOPRIORIDAD').asstring:= '1';
        qODT.FieldByName('CODIGOESTADOODT').asstring:= '1';
        qODT.FieldByName('CODIGOLABOR').asstring:= labor;
        qODT.FieldByName('CODIGOTIPOTAREA').asinteger:= tipotarea;
        qODT.FieldByName('CODIGOZONAORIGEN').asinteger:= 1;
        qODT.FieldByName('CODIGOAREAINFLUENCIA').asinteger:= 1;
        qODT.FieldByName('CODIGOMODOODT').asinteger:= 1;
        if qODTDia.Active then
          qODTDia.Close;
        qODTDia.Open;
        if qMantenimientoODT.Active then
          qMantenimientoODT.Close;
        qMantenimientoODT.Open;
        if qSubactividadodt.Active then
          qSubactividadodt.Close;
        qSubactividadodt.Open;
{        sqlap:= 'select am.codigosubactividadareaodt,bm.codigoniveltension from pm_actividadesprogramadas ap,pm_actividadmantenimiento am,pm_bancomantenimiento bm where '+
                'ap.codigomantenimiento =:codigomantenimiento and ap.codigoactividadmantenimiento = am.codigoactividadmantenimiento and am.codigobancomantenimiento = bm.codigobancomantenimiento';
 }
        sqlap:= 'select bm.codigoareaoperacionodt,bm.codigoelemento,am.codigosubactividadareaodt,bm.codigoniveltension from pm_actividadesprogramadas ap,pm_actividadmantenimiento am,pm_bancomantenimiento bm where '+
               'ap.codigomantenimiento =:codigomantenimiento and ap.codigoactividadmantenimiento = am.codigoactividadmantenimiento and am.codigobancomantenimiento = bm.codigobancomantenimiento';

        sqlcsnt:= 'select codigosubactividadareantodt from subactividadareantodt where codigosubactividadareaodt =:codigosubactividadareaodt and codigoniveltension =:codigoniveltension';
        qryap:= Tquery.Create(application);
        qryap.DatabaseName:='BaseDato';
        qryap.SQL.Append(sqlap);
        qrycsnt:= Tquery.Create(application);
        qrycsnt.DatabaseName:='BaseDato';
        qrycsnt.SQL.Append(sqlcsnt);
        qODT.Post;
        qODT.ApplyUpdates;
        qODT.CommitUpdates;
        for i:= 0 to lbAgregados.Items.Count -1 do
          begin
            qODTDia.Insert;
            qODTDia.FieldByName('CONSECUTIVO').asinteger:= NMantenimientoODT;
            qODTDia.FieldByName('CODIGOODT').asfloat:= CODIGO_ODT;
            qODTDia.FieldByName('IMPRESOODT').asstring:= GenerarImpreso;

            qConsulta:=TQuery.create(self);
            qConsulta.DatabaseName:='BaseDato';
            qConsulta.sql.text:= 'select CODIGOAMBITO, CODIGOSUBESTACION From pm_MANTENIMIENTO where CODIGOMANTENIMIENTO = '+lbCodigoagregado.Items.Strings[i]    ;
            qConsulta.open;
            IF qConsulta.Fieldbyname('CODIGOAMBITO').ASINTEGER = 1 THEN
            Begin
              qODTDia.FieldByName('CODIGOTIPOACTIVO').AsFloat:= 1;
              qODTDia.FieldByName('CODIGOTIPOINTERVENCION').AsFloat:= 5;
              qODTDia.FieldByName('CODIGOSUBESTACION').AsString:= qConsulta.Fieldbyname('CODIGOSUBESTACION').AsString;
            End;
            qConsulta.close;
            qConsulta.sql.text:= 'select fechainicial,fechafinal from pm_tarea where codigotarea = '+lbCodigoagregado.Items.Strings[i]    ;
            qConsulta.open;
            qODTDia.FieldByName('FECHAINICIOTRABAJO').AsDatetime:= qConsulta.Fieldbyname('fechainicial').AsDatetime;
            //qODTDia.FieldByName('FECHAFINALTRABAJO').AsDatetime:= qConsulta.Fieldbyname('fechafinal').AsDatetime;
            qConsulta.close;
            qConsulta.free;

            if qryap.Active then
              qryap.Close;
            qryap.ParamByName('CODIGOMANTENIMIENTO').asfloat:= strtofloat(lbCodigoagregado.Items[i]);
            qryap.Open;
            qODTDiaCODIGOODTOPERA.AsInteger:=qryap.Fields[0].AsInteger;
            qODTDia.FieldByName('CODIGOODTOPERA').AsInteger:=qryap.Fields[0].AsInteger;
            qODTDia.FieldByName('CODIGOTIPOTRABAJOODT').AsInteger:=4;
            qODTDia.FieldByName('CODIGONIVELTENSION').AsString:=qryap.Fields[3].AsString;
            qODTDia.FieldByName('CODIGOTIPOELEMENTO').AsInteger:=qryap.Fields[1].AsInteger;
            qODTDiaODTGENERADA.AsString:='SI';

            MedidasDeSeguridad('1385',floattostr(CODIGO_ODT),inttostr(NMantenimientoODT));
            while not qryap.Eof do
              begin
                if qrycsnt.Active then
                  qrycsnt.Close;
                qrycsnt.ParamByName('CODIGONIVELTENSION').asstring:= qryap.fieldbyname('CODIGONIVELTENSION').asstring;
                qrycsnt.ParamByName('CODIGOSUBACTIVIDADAREAODT').asfloat:= qryap.fieldbyname('CODIGOSUBACTIVIDADAREAODT').asfloat;
                qrycsnt.Open;
                qSubactividadodt.Append;
                qSubactividadodt.FieldByName('CODIGOSUBACTIVIDADAREANTODT').asfloat:= qrycsnt.fieldbyname('CODIGOSUBACTIVIDADAREANTODT').asfloat;
                qSubactividadodt.FieldByName('CONSECUTIVO').asinteger:= NMantenimientoODT;
                qSubactividadodt.FieldByName('CODIGOODT').asfloat:= CODIGO_ODT;
//                qSubactividadodt.FieldByName('PROGRAMADA').AsString:='SI';
                qSubactividadodt.Post;
                qryap.Next;
              end;
            qODTDia.Post;
            qMantenimientoODT.Insert;
            qMantenimientoODT.FieldByName('CONSECUTIVO').asfloat:= NMantenimientoODT;
            qMantenimientoODT.FieldByName('CODIGOMANTENIMIENTO').asfloat:= strtofloat(lbCodigoagregado.Items[i]);
            qMantenimientoODT.FieldByName('CODIGOODT').asfloat:= CODIGO_ODT;
            qMantenimientoODT.Post;
            if qTareaodt.Active then
              qTareaodt.Close;
            qTareaodt.ParamByName('CODIGOTAREA').asfloat:= strtofloat(lbCodigoagregado.Items[i]);
            qTareaodt.Open;
            qTareaodt.Edit;
            qTareaodt.FieldByName('CODIGOESTADOTAREA').asinteger:= 1;
            qTareaodt.Post;
            qTareaodt.ApplyUpdates;
            NMantenimientoODT:= NMantenimientoODT + 1;

            qODTDia.ApplyUpdates;
            qMantenimientoODT.ApplyUpdates;
            qSubactividadodt.ApplyUpdates;
            qTemp.ApplyUpdates;

            qODTDia.CommitUpdates;
            qMantenimientoODT.CommitUpdates;
            qSubactividadodt.CommitUpdates;
            qTemp.CommitUpdates;

            AgregarFormatosMantenimientoOdt(qODTDiaCODIGOODT.AsFloat,qODTDiaCONSECUTIVO.AsInteger);
          end;

        for i:= 0 to lbAgregados.Items.Count - 1 do
          begin
            lbAgregados.Items.Delete(0);
            lbCodigoagregado.Items.Delete(i);
          end;

        MessageDlg('Creada la ODT No'+' '+floattostr(CODIGO_ODT),mtInformation,[mbOk], 0);
        sbODT.Enabled:=false;
 {       qDatos.Free;
        qryap.Free;
        qrycsnt.Free;
}        
        except
          on e:exception do
            begin
              qTemp.CancelUpdates;
              qSubactividadodt.CancelUpdates;
              qMantenimientoODT.CancelUpdates;
              qODTDia.CancelUpdates;
              qODT.CancelUpdates;
              qTareaodt.CancelUpdates;
              ShowMessage(e.Message);
            application.MessageBox(pchar('Error en la creación de la ODT'),'Error en Generación',mb_iconerror);
            end;
      end;
  //qDatos.free;
  qryap.free;
  qrycsnt.free;
end;

procedure TfMantenimientoODT.qMttoAsignadoCalcFields(DataSet: TDataSet);
var qry1,qry2:Tquery;
    sqlmtto,sqltabla:string;
begin
  {if qMttoAsignado.FieldByName('CODIGOMANTENIMIENTO').asstring <> '' then
    begin
      qry1:= Tquery.Create(application);
      qry1.DatabaseName:='BaseDato';
      sqlmtto:= ' select em.CLELEMENTO1,em.CLELEMENTO2,e.numeroclaveselemento,e.nombretablaelemento,e.claveelemento1,e.claveelemento2,e.campodescriptivo from'+
                ' pm_mantenimiento m,pm_bancomantenimiento bm,pm_elementomantenimiento em,pm_elemento e where'+
                ' m.codigomantenimiento ='''+qMttoAsignado.fieldbyname('CODIGOMANTENIMIENTO').asstring+''' and'+
                ' m.CODIGOODT ='''+qODTAsignada.fieldbyname('CODIGOODT').asstring+''' and'+
                ' modt.CODIGOMANTENIMIENTO = m.CODIGOMANTENIMIENTO and'+
                ' m.CODIGOMANTENIMIENTO = em.CODIGOELEMENTOMANTENIMIENTO and'+
                ' m.CODIGOBANCOMANTENIMIENTO = bm.CODIGOBANCOMANTENIMIENTO and'+
                ' bm.CODIGOELEMENTO = e.CODIGOELEMENTO';
      qry1.SQL.Append(sqlmtto);
      qry1.Open;
      if (qry1.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
        begin
          if qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1 then
            begin
              sqltabla:= ' SELECT '+' '+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+qry1.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+
                         ' WHERE'+' '+' CODIGOSUBESTACION = '''+vartostr(dblcbSe.keyvalue)+''' '+' AND'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+'='''+qry1.fieldbyname('CLELEMENTO1').asstring+''' ';
              qry2:= Tquery.Create(application);
              qry2.DatabaseName:='BaseDato';
              qry2.SQL.Append(sqltabla);
              qry2.Open;
              qMttoAsignado.FieldByName('ELEMENTO').asstring:= qry1.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+qry2.Fields[0].asstring;
            end
          else
            begin
              if qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2 then
                begin
                  sqltabla:= ' SELECT '+' '+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+qry1.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+
                             ' WHERE '+' '+' CODIGOSUBESTACION = '''+vartostr(dblcbSe.keyvalue)+''' '+'AND'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+'='''+qry1.fieldbyname('CLELEMENTO1').asstring+'''and'+' '+
                               qry1.fieldbyname('CLAVEELEMENTO2').asstring+'='''+qry1.fieldbyname('CLELEMENTO2').asstring+''' ';
                  qry2:= Tquery.Create(application);
                  qry2.DatabaseName:='BaseDato';
                  qry2.SQL.Append(sqltabla);
                  qry2.Open;
                  qMttoAsignado.FieldByName('ELEMENTO').asstring:= qry1.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+qry2.Fields[0].asstring;
                end;
            end;
        end
      else
        begin
          if (qry1.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
            begin
              if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) then
                qMttoAsignado.FieldByName('ELEMENTO').asstring:= qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+qry1.fieldbyname('CLELEMENTO1').asstring
              else
                begin
                  if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) then
                    qMttoAsignado.FieldByName('ELEMENTO').asstring:=qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+qry1.fieldbyname('CLELEMENTO1').asstring+qry1.fieldbyname('CLELEMENTO2').asstring;
                end;
            end;
        end;
    end;
    qry1.free;//nuevos 
    qry2.free;  }
end;

procedure TfMantenimientoODT.FechaodtChange(Sender: TObject);
begin
  {Fechaodt1:= Fechaodt.Date;
  Decodedate(Fechaodt1,YearCalendario,MesCalendario,DiaCalendario);
  if (YearCalendario <> YearActual) or (MesCalendario <> MesActual) then
    begin
      YearActual:= YearCalendario;
      MesActual:= MesCalendario;
      if (rbSe.Checked) and (dblcbCoordinacionodt.Text <> '') and (dblcbSe.Text <> '') then
        dblcbSe.OnClick(dblcbSe);
      if (rbLineaodt.Checked) and (dblcbCoordinacionodt.Text <> '') and (dblcbSe.Text <> '') and ((dblcbLineaodt.Enabled) and (dblcbLineaodt.Text <> '')) then
        dblcbLineaodt.OnClick(dblcbLineaodt);
    end; }
end;

procedure TfMantenimientoODT.dblcbSeClick(Sender: TObject);
begin
 { if rbSe.Checked then
    begin
      if (dblcbCoordinacionodt.Text <> '') then
        begin
          decodedate(Fechaodt1,Year,mes,dia);
          if mes < 10 then
            fechaconsulta:= '0'+inttostr(mes)
          else
            fechaconsulta:= inttostr(mes);
          fechaconsulta:= fechaconsulta + inttostr(Year);
          if qODTAsignada.Active then
            qODTAsignada.Close;
          qODTAsignada.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(dblcbSe.keyvalue);
          qODTAsignada.ParamByName('CODIGOCIRCUITO').asstring:=' ';
          qODTAsignada.ParamByName('FECHA').asstring:= fechaconsulta;
          qODTAsignada.ParamByName('CODIGOAREAOPERACION').asinteger:= dblcbCoordinacionodt.KeyValue;
          qODTAsignada.Open;
          if (qODTAsignada.RecordCount > 0) then
            begin
              if qMttoAsignado.Active then
                qMttoAsignado.Close;
              qMttoAsignado.Open;
              if qMttoDisponible.Active then
                qMttoDisponible.Close;
              qMttoDisponible.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(dblcbSe.keyvalue);
              qMttoDisponible.ParamByName('CODIGOCIRCUITO').asstring:=' ';
              qMttoDisponible.ParamByName('FECHA').asstring:= fechaconsulta;
              qMttoDisponible.ParamByName('CODIGOAREAOPERACION').asinteger:= dblcbCoordinacionodt.KeyValue;
              qMttoDisponible.Open;
            end
          else
            MessageDlg('No existen ODTs que cumplan con los criterios seleccionados.', mtInformation,[mbOk], 0);
        end
      else
        MessageDlg('Debe Escoger primero una Coordinación.', mtInformation,[mbOk], 0);
    end
  else
    if rbLineaodt.Checked then
      begin
        dblcbLineaodt.KeyValue:='';
        if qLineaodt.Active then
          qLineaodt.Close;
        qLineaodt.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(dblcbSe.keyvalue);
        qLineaodt.Open;
      end;}
end;

procedure TfMantenimientoODT.dblcbCoordinacionodtClick(Sender: TObject);
begin
  {if rbSe.Checked then
    begin
      if (dblcbSe.Text <> '') then
        begin
          dblcbSe.KeyValue:='';
          if  qMttoAsignado.Active then
            qMttoAsignado.Close;
          if qODTAsignada.Active then
            qODTAsignada.Close;
        end;
    end
  else
    begin
      if dblcbLineaodt.Text <> '' then
        dblcbLineaodt.KeyValue:='';
      if dblcbSe.Text <> '' then
        dblcbSe.KeyValue:='';
      if  qMttoAsignado.Active then
        qMttoAsignado.Close;
      if qODTAsignada.Active then
        qODTAsignada.Close;
    end;  }
end;

procedure TfMantenimientoODT.dblcbLineaodtClick(Sender: TObject);
var Year,mes,dia:word;
    fechaconsulta:string;
begin

end;

procedure TfMantenimientoODT.TabSheet1Show(Sender: TObject);
var i:integer;
begin
 { if (lbAgregados.Items.Count > 0) and (lbCodigoagregado.Items.Count > 0) then
    for i:=0 to lbAgregados.Items.Count - 1 do
      begin
        lbAgregados.Items.Delete(0);
        lbCodigoagregado.Items.Delete(i);
      end;
  if (lbDisponibles.Items.Count > 0) and (lbCodigodisponible.Items.Count > 0) then
    for i:=0 to lbDisponibles.Items.Count - 1 do
      begin
        lbDisponibles.Items.Delete(0);
        lbCodigodisponible.Items.Delete(i);
      end;
  if sbODT.Enabled then
    sbODT.Enabled:= false;

    qMantenimientos.Close;
  qMantenimientos.Open;
  if lbDisponibles.Items.Count > 0 then
    lbDisponibles.Clear;
  if lbCodigodisponible.Items.Count > 0 then
    lbCodigodisponible.Clear;
  if lbAgregados.Items.Count > 0 then
    lbAgregados.Clear;
  if lbCodigoagregado.Items.Count > 0 then
    lbCodigoagregado.Clear;
  while not qmantenimientos.Eof do
  begin
  //CONSULTAR EL ELEMENTO EN PM_ELEMENTOMANTENIMIENTO Y BUSCAR EL NOMBRE DEL ELEMENTO
    qElementoMtto.Close;
    qElementoMtto.ParamByName('CODIGOELEMENTOMANTENIMIENTO').AsString:=qmantenimientos.fieldbyname('CODIGOTAREA').asstring;
    qElementoMtto.Open;
    consultarelemento(qElementoMttoCODIGOELEMENTO.asstring);
  //      fMantenimientoODT.lbDisponibles.Items.Add(fMantenimientoODT.qMantenimientos.fieldbyname('NOMBRETAREA').asstring+' '+'Subestación'+' '+fMantenimientoODT.qMantenimientos.FieldByName('NOMBRESUBESTACION').AsString);
    lbDisponibles.Items.Add(qMantenimientos.fieldbyname('CODIGOTAREA').asstring+' '+'--'+' '+  qMantenimientos.fieldbyname('NOMBRETAREA').asstring+' '+'--'+' '+qMantenimientos.FieldByName('NOMBRESUBESTACION').AsString +' '+'--'+' '+elemento+' '+'--'+' '+qMantenimientos.FieldByName('FECHAINICIAL').AsString+' '+'--'+' '+qMantenimientos.FieldByName('FECHAFINAL').AsString);
    lbCodigodisponible.Items.Add(qMantenimientos.fieldbyname('CODIGOTAREA').asstring);
    qmantenimientos.Next;
  end;   }
end;

procedure TfMantenimientoODT.qMttoAsignadoBeforeDelete(DataSet: TDataSet);
begin
   if (qMttoAsignado.RecordCount = 1) then
     begin
       Eraseodt:= true;
       MessageDlg('la ODT debe contener al menos 1 mantenimiento asociado.', mtInformation,[mbOk], 0);
       abort;
     end;
end;

procedure TfMantenimientoODT.sbDescartarClick(Sender: TObject);


var qry2,qryap,qrycsnt:Tquery;
    sqlmaximo,sqlap,sqlcsnt:string;
    codigoodt:real;
begin
  {if (qMttoDisponible.FieldByName('CODIGOMANTENIMIENTO').asstring <> '') then
    try
      codigoodt:= qODTAsignada.fieldbyname('CODIGOODT').asfloat;
      if qEstadoTarea.Active then
        qEstadoTarea.Close;
      qEstadoTarea.ParamByName('CODIGOTAREA').asfloat:= qMttoDisponible.FieldByName('CODIGOMANTENIMIENTO').asfloat;
      qEstadoTarea.Open;
      if not ((qEstadoTarea.RecordCount) = 0) then
        begin
          qry2:= Tquery.Create(application);
          qry2.DatabaseName:='BaseDato';
          sqlmaximo:= 'select max(consecutivo) as maximo from pm_mantenimiento where codigoodt ='+qODTAsignada.fieldbyname('CODIGOODT').asstring;
          qry2.SQL.Append(sqlmaximo);
          qry2.Open;
          Decodedate(Fechaodt.date,Year,Mes,Dia);

          sqlap:= 'select am.codigosubactividadareaodt,bm.codigoniveltension from pm_actividadesprogramadas ap,pm_actividadmantenimiento am,pm_bancomantenimiento bm where '+
                  'ap.codigomantenimiento =:codigomantenimiento and ap.codigoactividadmantenimiento = am.codigoactividadmantenimiento and am.codigobancomantenimiento = bm.codigobancomantenimiento';
          sqlcsnt:= 'select codigosubactividadareantodt from subactividadareantodt where codigosubactividadareaodt =:codigosubactividadareaodt and codigoniveltension =:codigoniveltension';
          qryap:= Tquery.Create(application);
          qryap.DatabaseName:='BaseDato';
          qryap.SQL.Append(sqlap);
          qrycsnt:= Tquery.Create(application);
          qrycsnt.DatabaseName:='BaseDato';
          qrycsnt.SQL.Append(sqlcsnt);
          if qryap.Active then
            qryap.Close;
          qryap.ParamByName('CODIGOMANTENIMIENTO').asfloat:=  qMttoDisponible.fieldbyname('CODIGOMANTENIMIENTO').asfloat;
          qryap.Open;
          if qOdtda.Active then
            qOdtda.Close;
          qOdtda.Open;
          qOdtda.Insert;
          qOdtda.FieldByName('CONSECUTIVO').asinteger:= qry2.fieldbyname('MAXIMO').asinteger + 1;
          qOdtda.FieldByName('CODIGOODT').asfloat:= qODTAsignada.fieldbyname('CODIGOODT').asfloat;
          qOdtda.FieldByName('IMPRESOODT').asstring:= GenerarImpreso;
          qOdtda.FieldByName('CODIGOZONAORIGEN').asINTEGER:= 1;

          if qSubactividadodt.Active then
            qSubactividadodt.Close;
          qSubactividadodt.Open;
          MedidasDeSeguridad('1385',qODTAsignada.fieldbyname('CODIGOODT').asstring,inttostr(qry2.fieldbyname('MAXIMO').asinteger + 1));
          while not qryap.Eof do
            begin
              if qrycsnt.Active then
                qrycsnt.Close;
              qrycsnt.ParamByName('CODIGOSUBACTIVIDADAREAODT').asinteger:= qryap.fieldbyname('CODIGOSUBACTIVIDADAREAODT').asinteger;
              qrycsnt.ParamByName('CODIGONIVELTENSION').asstring:= qryap.fieldbyname('CODIGONIVELTENSION').asstring;
              qrycsnt.Open;
              qSubactividadodt.Insert;
              qSubactividadodt.FieldByName('CODIGOSUBACTIVIDADAREANTODT').asfloat:= qrycsnt.fieldbyname('CODIGOSUBACTIVIDADAREANTODT').asfloat;
              qSubactividadodt.FieldByName('CONSECUTIVO').asinteger:= qry2.fieldbyname('MAXIMO').asinteger + 1;
              qSubactividadodt.FieldByName('CODIGOODT').asfloat:= qODTAsignada.fieldbyname('CODIGOODT').asfloat;
//              qSubactividadodt.FieldByName('PROGRAMADA').AsString:='SI';
              qSubactividadodt.Post;
              qryap.Next;
            end;
          qOdtda.Post;
          if qModt.Active then
            qModt.Close;
          qModt.Open;
          qModt.Insert;
          qModt.FieldByName('CONSECUTIVO').asinteger:= qry2.fieldbyname('MAXIMO').asinteger + 1;
          qModt.FieldByName('CODIGOODT').asfloat:= qODTAsignada.fieldbyname('CODIGOODT').asfloat;
          qModt.FieldByName('CODIGOMANTENIMIENTO').asfloat:= qMttoDisponible.fieldbyname('CODIGOMANTENIMIENTO').asfloat;
          qModt.Post;
          qEstadoTarea.Edit;
          qEstadoTarea.FieldByName('CODIGOESTADOTAREA').asinteger:=1;
          qEstadoTarea.Post;
          qOdtda.ApplyUpdates;
          qModt.ApplyUpdates;
          qSubactividadodt.ApplyUpdates;
          qTemp.ApplyUpdates;
          qEstadoTarea.ApplyUpdates;
          if rbSe.Checked then
            begin
              if qMttoDisponible.Active then
                qMttoDisponible.Close;
              if qMttoAsignado.Active then
                qMttoAsignado.Close;
              if qODTAsignada.Active then
                qODTAsignada.Close;
              if mes < 10 then
                fechaconsulta:= '0'+inttostr(mes)
              else
                fechaconsulta:= inttostr(mes);
              fechaconsulta:= fechaconsulta + inttostr(Year);
              qODTAsignada.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(dblcbSe.keyvalue);
              qODTAsignada.ParamByName('CODIGOCIRCUITO').asstring:=' ';
              qODTAsignada.ParamByName('FECHA').asstring:= fechaconsulta;
              qODTAsignada.ParamByName('CODIGOAREAOPERACION').asinteger:= dblcbCoordinacionodt.KeyValue;
              qODTAsignada.Open;
              qMttoAsignado.Open;
              qMttoDisponible.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(dblcbSe.keyvalue);
              qMttoDisponible.ParamByName('CODIGOCIRCUITO').asstring:=' ';
              qMttoDisponible.ParamByName('FECHA').asstring:= fechaconsulta;
              qMttoDisponible.ParamByName('CODIGOAREAOPERACION').asinteger:= dblcbCoordinacionodt.KeyValue;
              qMttoDisponible.Open;
            end
          else
            begin
              if qMttoDisponible.Active then
                qMttoDisponible.Close;
              if mes < 10 then
                fechaconsulta:= '0'+inttostr(mes)
              else
                fechaconsulta:= inttostr(mes);
              fechaconsulta:= fechaconsulta + inttostr(Year);
              qODTAsignada.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(dblcbSe.keyvalue);
              qODTAsignada.ParamByName('CODIGOCIRCUITO').asstring:=vartostr(dblcbLineaodt.keyvalue);
              qODTAsignada.ParamByName('FECHA').asstring:= fechaconsulta;
              qODTAsignada.ParamByName('CODIGOAREAOPERACION').asinteger:= dblcbCoordinacionodt.KeyValue;
              qODTAsignada.Open;
              qMttoAsignado.Open;
              qMttoDisponible.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(dblcbSe.keyvalue);
              qMttoDisponible.ParamByName('CODIGOCIRCUITO').asstring:=vartostr(dblcbLineaodt.keyvalue);
              qMttoDisponible.ParamByName('FECHA').asstring:= fechaconsulta;
              qMttoDisponible.ParamByName('CODIGOAREAOPERACION').asinteger:= dblcbCoordinacionodt.KeyValue;
              qMttoDisponible.Open;
            end;
        end;
    except
      on e:exception do
        begin
          application.MessageBox(pchar('Error borrando el mantenimiento asociado a la ODT No'+' '+floattostr(codigoodt)),'Error en Borrado',mb_iconerror);
          qTemp.CancelUpdates;
          qSubactividadodt.CancelUpdates;
          qModt.CancelUpdates;
          qOdtda.CancelUpdates;
          qEstadoTarea.CancelUpdates;
        end;
    end;
    qry2.free;
    qryap.free;
    qrycsnt.free; }
end;

procedure TfMantenimientoODT.qSubactividadodtNewRecord(DataSet: TDataSet);
var qry3:Tquery;
begin
  qry3:= TQuery.Create(Application);
  qry3.DatabaseName:='BaseDato';
  qry3.SQL.Clear;
  qry3.SQL.Add('select subactividaddatosodt.nextval from dual');
  qry3.Open;
  qSubactividadodt.FieldByName('CODIGOODTSUBACTIVIDADDATOS').asfloat:= qry3.Fields[0].AsFloat;
  qSubactividadodt.FieldByName('PROGRAMADA').AsString:='SI';
  qry3.Free;
end;

procedure TfMantenimientoODT.qSubactividadodtAfterDelete(
  DataSet: TDataSet);
begin
{  qSubactividadodt.ApplyUpdates;
  qSubactividadodt.CommitUpdates;}
end;

procedure TfMantenimientoODT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TfMantenimientoODT.SBSalirClick(Sender: TObject);
begin
  close;
end;

procedure TfMantenimientoODT.SBFiltrar1Click(Sender: TObject);
begin
  fFiltroGenerarOdt:=TfFiltroGenerarOdt.Create(Application);
  fFiltroGenerarOdt.ShowModal;
  fFiltroGenerarOdt.Free;
end;

procedure TfMantenimientoODT.consultarElemento(codigotipoelemento: string);
var qry1,qtablaelemento:tquery;
  sqltablaelemento1:string;
begin
 { qry1:=tquery.Create(Application);
  qry1.DatabaseName:='Basedato';
  qtablaelemento:=TQuery.Create(Application);
  qtablaelemento.DatabaseName:='Basedato';
  qry1.SQL.Add('select * from pm_elemento where codigoelemento=:codigoelemento');
  qry1.ParamByName('CODIGOELEMENTO').AsString:=codigotipoelemento;
  qry1.Open;
  Memo2.Clear;
 //CONSULTAR ELEMENTO
  if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
  begin
    if qTablaElemento.Active then
      qTablaElemento.Close;
    qTablaElemento.SQL.Clear;
    sqltablaelemento1:= ' SELECT'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+','+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM ' + '  '+
                        qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+'  '+'WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+' = '''+qElementoMtto.fieldbyname('CLELEMENTO1').AsString+''' ';
//    fcronograma.Memo1.Lines.Append(sqltablaelemento1);
    qTablaElemento.SQL.Add(sqltablaelemento1);
    qTablaElemento.Open;
    memo2.Lines.Append(qTablaElemento.Fields[1].asstring);
//    CElemento.Items.Append(qTablaElemento.Fields[1].asstring);
//    CElemento.ItemIndex:= 0;
  end
  else
  begin
    if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
    begin
      Memo2.Lines.Append(qElementoMtto.fieldbyname('CLELEMENTO1').asstring);
    end
  end;
  if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
  begin
    if qTablaElemento.Active then
      qTablaElemento.Close;
    qTablaElemento.SQL.Clear;
    sqltablaelemento1:= ' SELECT '+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+','+qry1.fieldbyname('CLAVEELEMENTO2').asstring+','+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                        qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+'WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+' = '''+qElementoMtto.fieldbyname('CLELEMENTO1').asstring+''' '+
                        'and'+qry1.fieldbyname('CLAVEELEMENTO').asstring+' = '''+qElementoMtto.fieldbyname('CLELEMENTO2').asstring+''' ';

    qTablaElemento.SQL.Add(sqltablaelemento1);
    qTablaElemento.Open;
    Memo2.Lines.Append(qTablaElemento.Fields[2].asstring);
  end
  else
  begin
    if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qry1.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
    begin
      sqltablaelemento1:=  ' SELECT '+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+','+qry1.fieldbyname('CLAVEELEMENTO2').asstring+' '+' FROM'+' '+
                           qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+'WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+' =  '''+qElementoMtto.fieldbyname('CLELEMENTO1').asstring+''' '+
                           'and'+qry1.fieldbyname('CLAVEELEMENTO2').asstring+' = '''+qElementoMtto.fieldbyname('CLELEMENTO2').asstring+''' ';
    //  fcronograma.Memo1.Lines.Append(sqltablaelemento1);
      Memo2.Lines.Append(qElementoMtto.fieldbyname('CLELEMENTO1').asstring+qElementoMtto.fieldbyname('CLELEMENTO2').asstring);
    end;
  end;
  elemento:=Memo2.Text;
  qry1.Free;
  qtablaelemento.Free;   }
end;

procedure TfMantenimientoODT.sbFiltrarClick(Sender: TObject);
begin
  fFiltroGenerarOdt:=TfFiltroGenerarOdt.Create(Application);
  fFiltroGenerarOdt.ShowModal;
  if qMantenimientos.RecordCount <> 1 then
    Panel20.Caption := 'MANTENIMIENTOS DISPONIBLES     << ' + inttostr(qMantenimientos.recordcount)+' Registros Encontrados >>'
  else Panel20.Caption := 'MANTENIMIENTOS DISPONIBLES      << ' +inttostr(qMantenimientos.recordcount)+' Registro Encontrado >>';
  fFiltroGenerarOdt.Free;
end;

procedure TfMantenimientoODT.FormDestroy(Sender: TObject);
begin
  qMantenimientos.Free;
  qElementoMtto.Free;
end;

procedure TfMantenimientoODT.SBOrdenarClick(Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel2.ClientToScreen(Classes.Point(SBOrdenar.Left, SBOrdenar.top));
  pmOrdenar.Popup(punto.x-10, punto.y-10);
  {lbDisponibles.Sorted:=true;
  lbCodigodisponible.Sorted:=true; }

end;

procedure TfMantenimientoODT.FormCreate(Sender: TObject);
begin
  ListaDireccionCampos:=TStringList.Create;
  ListaDireccionCampos.Add('CODIGOTAREA=-1');
  ListaDireccionCampos.Add('NOMBRETAREA=-1');
  ListaDireccionCampos.Add('NOMBRESUBESTACION=-1');
  ListaDireccionCampos.Add('CLELEMENTO1=-1');
  ListaDireccionCampos.Add('FECHAINICIAL=-1');
  ListaDireccionCampos.Add('FECHAFINAL=-1');
  ListaDireccionCampos.Add('NOMBREAREAOPERACIONODT=-1');
end;

procedure TfMantenimientoODT.CodigoTareaClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('CODIGOTAREA');
  sCriterio := 'ORDER BY t.CODIGOTAREA DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['CODIGOTAREA']='1') then
    begin
      sCriterio := 'ORDER BY t.CODIGOTAREA ASC';
      ListaDireccionCampos.Values['CODIGOTAREA']:='-1';
    end
    else
      ListaDireccionCampos.Values['CODIGOTAREA']:='1'
  end;
  CODIGOTAREA.Checked := true;
  Ordenar(sCriterio);
  with dbgListaMantenimientos do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosCODIGOTAREA;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfMantenimientoODT.NombreTareaClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('NOMBRETAREA');
  sCriterio := 'ORDER BY t.NOMBRETAREA DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['NOMBRETAREA']='1') then
    begin
      sCriterio := 'ORDER BY t.NOMBRETAREA ASC';
      ListaDireccionCampos.Values['NOMBRETAREA']:='-1';
    end
    else
      ListaDireccionCampos.Values['NOMBRETAREA']:='1'
  end;
  NOMBRETAREA.Checked := true;
  Ordenar(sCriterio);
  with dbgListaMantenimientos do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBRETAREA;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;


procedure TfMantenimientoODT.NombreSubestacionClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('NOMBRESUBESTACION');
  sCriterio := 'ORDER BY SB.NOMBRESUBESTACION DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['NOMBRESUBESTACION']='1') then
    begin
      sCriterio := 'ORDER BY SB.NOMBRESUBESTACION ASC';
      ListaDireccionCampos.Values['NOMBRESUBESTACION']:='-1';
    end
    else
      ListaDireccionCampos.Values['NOMBRESUBESTACION']:='1'
  end;
  NOMBRESUBESTACION.Checked := true;
  Ordenar(sCriterio);
  with dbgListaMantenimientos do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBRESUBESTACION;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;


procedure TfMantenimientoODT.clElemento1Click(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('CLELEMENTO1');
  sCriterio := 'ORDER BY em.CLELEMENTO1 DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['CLELEMENTO1']='1') then
    begin
      sCriterio := 'ORDER BY em.CLELEMENTO1 ASC';
      ListaDireccionCampos.Values['CLELEMENTO1']:='-1';
    end
    else
      ListaDireccionCampos.Values['CLELEMENTO1']:='1'
  end;
  CLELEMENTO1.Checked := true;
  Ordenar(sCriterio);
  with dbgListaMantenimientos do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosCLELEMENTO1;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;


procedure TfMantenimientoODT.FechainicialClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHAINICIAL');
  sCriterio := 'ORDER BY T.FECHAINICIAL DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['FECHAINICIAL']='1') then
    begin
      sCriterio := 'ORDER BY T.FECHAINICIAL ASC';
      ListaDireccionCampos.Values['FECHAINICIAL']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHAINICIAL']:='1'
  end;
  FECHAINICIAL.Checked := true;
  Ordenar(sCriterio);
  with dbgListaMantenimientos do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosFECHAINICIAL;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;


procedure TfMantenimientoODT.fechafinalClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHAFINAL');
  sCriterio := 'ORDER BY T.FECHAFINAL DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['FECHAFINAL']='1') then
    begin
      sCriterio := 'ORDER BY T.FECHAFINAL ASC';
      ListaDireccionCampos.Values['FECHAFINAL']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHAFINAL']:='1'
  end;
  FECHAFINAL.Checked := true;
  Ordenar(sCriterio);
  with dbgListaMantenimientos do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosFECHAFINAL;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;


procedure TfMantenimientoODT.NOMBREAREAOPERACIONODTClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('NOMBREAREAOPERACIONODT');
  sCriterio := 'ORDER BY A.NOMBREAREAOPERACIONODT DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['NOMBREAREAOPERACIONODT']='1') then
    begin
      sCriterio := 'ORDER BY A.NOMBREAREAOPERACIONODT ASC';
      ListaDireccionCampos.Values['NOMBREAREAOPERACIONODT']:='-1';
    end
    else
      ListaDireccionCampos.Values['NOMBREAREAOPERACIONODT']:='1'
  end;
  NOMBREAREAOPERACIONODT.Checked := true;
  Ordenar(sCriterio);
  with dbgListaMantenimientos do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBREAREAOPERACIONODT;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;


procedure TfMantenimientoODT.Ordenar(sCriterio: String);
begin
  qmantenimientos.Close;
  qmantenimientos.SQL.Delete(qmantenimientos.SQL.Count - 1);
  qmantenimientos.SQL.Add(sCriterio);
  qmantenimientos.SQL.savetofile('c:\ordenmtto.txt');
  qmantenimientos.Open;
end;

end.




