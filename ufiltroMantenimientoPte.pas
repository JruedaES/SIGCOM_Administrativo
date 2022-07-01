unit ufiltroMantenimientoPte;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DBCtrls, Mask, ToolEdit, RXDBCtrl, Db,
  DBTables, Digisoft;

type
  TfFiltroMantenimientoPte = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtnAnularFiltro: TBitBtn;
    bitBFiltrar: TBitBtn;
    qCircuito: TQuery;
    qCircuitoCODIGOCIRCUITO: TStringField;
    qCircuitoCODIGOSUBESTACION: TStringField;
    qCircuitoCODIGONIVELTENSION: TStringField;
    qCircuitoNOMBRECIRCUITO: TStringField;
    qCircuitoCODIGOAPOYO: TFloatField;
    dsCircuito: TDataSource;
    qSubestacion: TQuery;
    qSubestacionCODIGOSUBESTACION: TStringField;
    qSubestacionNOMBRESUBESTACION: TStringField;
    dsSubestacion: TDataSource;
    qElemento: TQuery;
    qElementoCODIGOELEMENTO: TFloatField;
    qElementoCODIGOTIPOELEMENTO: TStringField;
    qElementoCODIGOAMBITO: TFloatField;
    qElementoNOMBRETABLAELEMENTO: TStringField;
    qElementoNUMEROCLAVESELEMENTO: TFloatField;
    qElementoCLAVEELEMENTO1: TStringField;
    qElementoCLAVEELEMENTO2: TStringField;
    qElementoCLAVEELEMENTO3: TStringField;
    qElementoNOMBRETIPOELEMENTO: TStringField;
    qElementoCAMPODESCRIPTIVO: TStringField;
    dsElemento: TDataSource;
    qTipoMtto: TQuery;
    qTipoMttoCODIGOTIPOMANT: TFloatField;
    qTipoMttoNOMBREMANT: TStringField;
    dsTipoMtto: TDataSource;
    qNivelTension: TQuery;
    qNivelTensionCODIGONIVELTENSION: TStringField;
    qNivelTensionTENSION: TFloatField;
    qNivelTensionCOLOR: TFloatField;
    qNivelTensionNIVEL: TStringField;
    dsNivelTension: TDataSource;
    qEstadoMtto: TQuery;
    qEstadoMttoCODIGOESTADOTAREA: TFloatField;
    qEstadoMttoNOMBREESTADO: TStringField;
    dsEstadoMtto: TDataSource;
    tdMTFiltro: tdMemTable;
    tdMTFiltroCodigoSubestacion: TStringField;
    tdMTFiltroCodigoElemento: TIntegerField;
    tdMTFiltroCodigotipomant: TIntegerField;
    tdMTFiltroCodigoNivelTension: TStringField;
    tdMTFiltroCodigoEstadoTarea: TIntegerField;
    tdMTFiltroCodigoCircuito: TStringField;
    dsFiltro: TDataSource;
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
    qmantenimientos2: TQuery;
    qmantenimientos2CODIGOTAREA: TFloatField;
    qmantenimientos2FECHAINICIAL: TDateTimeField;
    qmantenimientos2FECHAFINAL: TDateTimeField;
    qmantenimientos2NOMBRETAREA: TStringField;
    qmantenimientos2CODIGOMANTENIMIENTO: TFloatField;
    qmantenimientos2CODIGOTIPOMANT: TFloatField;
    qmantenimientos2NOMBREMANT: TStringField;
    qTablaElemento: TQuery;
    tdMemTable1: tdMemTable;
    tdMemTable1FechaInicial: TDateField;
    tdMemTable1FechaFinal: TDateField;
    tdMemTable1CodigoElemento: TIntegerField;
    tdMemTable1Clelemento1: TStringField;
    tdMemTable1Clelemento2: TStringField;
    qElementoMantenimiento: TQuery;
    dsElementoMantenimiento: TDataSource;
    dsFechas: TDataSource;
    dsMantenimientos2: TDataSource;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    eDesde: TEdit;
    eHasta: TEdit;
    GroupBox4: TGroupBox;
    Label2: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    lLinea: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    lbTipoMtto: TLabel;
    lbNivelTension: TLabel;
    lbEstadoMtto: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Elemento: TDBLookupComboBox;
    Linea: TDBLookupComboBox;
    cbElemento: TComboBox;
    DBEFechaInicial: TDBEdit;
    DBEFechaFinal: TDBEdit;
    DBLCBTipoMtto: TDBLookupComboBox;
    DBLCBNivelTension: TDBLookupComboBox;
    DBLCBEstadoMtto: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBLCBSubestacion: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    GroupBox5: TGroupBox;
    rbLinea: TRadioButton;
    rbSubestacion: TRadioButton;
    codigo1: TListBox;
    codigo2: TListBox;
    qMantenimientos: TQuery;
    function GetFechaHora: String;
    procedure FormCreate(Sender: TObject);
    procedure bitBFiltrarClick(Sender: TObject);
    procedure DBLCBSubestacionClick(Sender: TObject);
    procedure LineaClick(Sender: TObject);
    procedure rbLineaClick(Sender: TObject);
    procedure rbSubestacionClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ElementoClick(Sender: TObject);
  private
    { Private declarations }
  public
  Fecha: string;
    { Public declarations }
  end;

var
  fFiltroMantenimientoPte: TfFiltroMantenimientoPte;

implementation

uses uFormaFecha, uHojaVidaEquipo;

{$R *.DFM}

function TfFiltroMantenimientoPte.GetFechaHora: String;
begin
  fFormaFecha := TfFormaFecha.Create(Application);
  uFormaFecha.sFecha := Fecha;
  fFormaFecha.height:=291;
  if FFormaFecha.ShowModal = mrOk
  then Result := DateTimetoStr(FFormaFecha.Date+FFormaFecha.fTime)
  else Result := sFecha;
  fFormaFecha.Free;
end;

procedure TfFiltroMantenimientoPte.FormCreate(Sender: TObject);
begin
  rbSubestacion.Checked:= true;
  qCircuito.Open;
  qTipoMtto.Open;
  qSubestacion.Open;
  qNivelTension.Open;
  qCaracteristicasElemento.Open;
  qElemento.Open;
  qEstadoMtto.Open;
  qElementoMantenimiento.Open;
  tdMemTable1.Open;
  tdMemTable1.Insert;
  tdMTFiltro.Open;
  tdMTFiltro.Insert;
end;

procedure TfFiltroMantenimientoPte.bitBFiltrarClick(Sender: TObject);
begin
  if(rbSubestacion.Checked=true)then
  begin
    qMantenimientos.SQL.Clear;
    qMantenimientos.Close;

    qMantenimientos.SQL.Text:= 'SELECT   t.codigotarea,t.nombretarea, m.fechafinejec, m.codigosubestacion,s.NOMBRESUBESTACION, m.codigocircuito,c.NOMBRECIRCUITO, '+
                                     ' m.codigobancomantenimiento,bm.NOMBREMANTENIMIENTO, Bm.codigoambito, a.NOMBREAMBITO, em.codigoelemento, E.NOMBRETIPOELEMENTO, '+
                                     ' em.clelemento1 '+
                                     ' FROM pm_tarea t, pm_mantenimiento m, pm_elementomantenimiento em, subestacion s, circuito c, pm_bancomantenimiento bm, pm_ambito a, PM_ELEMENTO	E '+
                                     ' WHERE s.codigosubestacion = m.CODIGOSUBESTACION AND  em.codigoelementomantenimiento = m.codigomantenimiento '+
                                     ' AND m.CODIGOBANCOMANTENIMIENTO = bm.CODIGOBANCOMANTENIMIENTO AND Bm.CODIGOAMBITO = a.CODIGOAMBITO(+) AND EM.CODIGOELEMENTO =  E.CODIGOELEMENTO '+
                                     ' AND m.codigomantenimiento = t.codigotarea AND m.CODIGOCIRCUITO = c.CODIGOCIRCUITO(+) '+
                                     ' AND m.FECHAFINEJEC + t.frecuencia BETWEEN  TO_DATE(''01/''|| :mes ||''/''|| :ano ,''dd/mm/yyyy'') AND TO_DATE(''30''||''/''|| :mes ||''/''|| :ano ,''dd/mm/yyyy'') '+
                                     ' AND t.codigotarea IN ( '+
                                     ' SELECT ultimo '+
                                     ' FROM (SELECT   em.clelemento1, m.codigobancomantenimiento, '+
                                     ' MAX (t.codigotarea) AS ultimo '+
                                     ' FROM pm_tarea t, '+
                                     ' pm_mantenimiento m, '+
                                     ' pm_elementomantenimiento em '+
                                     ' WHERE em.codigoelementomantenimiento = '+
                                     ' m.codigomantenimiento '+
                                     ' AND m.codigomantenimiento = t.codigotarea '+
                                     ' GROUP BY em.clelemento1, m.codigobancomantenimiento)) '+
                                     ' AND m.fechafinejec IS NOT NULL ';

    if(eDesde.Text<>'')then
    begin
      qMantenimientos.SQL.Add(' and t.codigotarea>= '''+ eDesde.Text+'''')
    end;

    if(eHasta.Text<>'')then
    begin
      qMantenimientos.SQL.Add(' and t.codigotarea<= '''+ eHasta.Text+'''')
    end;

    if(DBEFechaInicial.Text<>'')then
    begin
      qMantenimientos.SQL.Add(' and (m.fechafinejec)>= to_date('''+DBEFechaInicial.Text+''',''dd/mm/yyyy'')');
    end;

    if(DBEFechaFinal.Text<>'')then
    begin
      qMantenimientos.SQL.Add(' and (m.fechafinejec)<= to_date('''+DBEFechaFinal.Text+''',''dd/mm/yyyy'')');
    end;

    if(DBLCBSubestacion.Text<>'')then
    begin
      qMantenimientos.SQL.Add(' and m.codigosubestacion='''+ DBLCBSubestacion.Keyvalue+'''');
    end;

    if(DBLCBTipoMtto.Text<>'')then
    begin
      qMantenimientos.SQL.Add(' and bm.codigotipomant='''+ vartostr(DBLCBTipoMtto.Keyvalue)+'''');
    end;

    if(DBLCBNivelTension.Text<>'')then
    begin
      qMantenimientos.SQL.Add(' and bm.codigoniveltension='''+ VarToStr(DBLCBNivelTension.Keyvalue)+'''');
    end;

{
    if(DBLCBEstadoMtto.Text<>'')then
    begin
      qMantenimientos.SQL.Add(' and t.codigoestadotarea='''+ vartostr(DBLCBEstadoMtto.keyvalue)+'''');
    end;           }

    if(Elemento.Text<>'')then
    begin
      qMantenimientos.SQL.Add(' and em.codigoelemento='''+ inttostr(Elemento.Keyvalue)+'''');
    end;

    if(cbElemento.Text<>'')then
    begin
      qCaracteristicasElemento.Close;
      qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
      qCaracteristicasElemento.Open;

      if qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1 then
      begin
        qMantenimientos.SQL.Add(' and t.codigotarea in(select codigoelementomantenimiento');
        qMantenimientos.SQL.Add(' from pm_elementomantenimiento where codigoelemento='''+inttostr(elemento.KeyValue)+'''');
        qMantenimientos.SQL.Add(' and clelemento1='''+ codigo1.Items.Strings[CbElemento.itemindex]+''')');
      end
      else
      begin
        qMantenimientos.SQL.Add(' and t.codigotarea in(select codigoelementomantenimiento');
        qMantenimientos.SQL.Add(' from pm_elementomantenimiento where codigoelemento='''+inttostr(elemento.KeyValue)+'''');
        qMantenimientos.SQL.Add(' and clelemento1='''+ codigo1.Items.Strings[CbElemento.itemindex]+'''');
        qMantenimientos.SQL.Add(' and clelemento2='''+ codigo2.Items.Strings[CbElemento.itemindex]+''')');
      end;
    end;
    
//  end;

   { if (DBLCBSubestacion.Text='')then
    begin
      Application.MessageBox('Debe seleccionar una subestación','Error',Mb_Iconerror);
      ModalResult:=0;
      Exit;
    end;

    if (Elemento.Text='')then
    begin
      Application.MessageBox('Debe seleccionar un tipo de elemento','Error',Mb_Iconerror);
      ModalResult:=0;
      Exit;
    end;

    if (cbElemento.Text='')then
    begin
      Application.MessageBox('Debe seleccionar un elemento','Error',Mb_Iconerror);
      ModalResult:=0;
      Exit;
    end; }
  end;
end;

procedure TfFiltroMantenimientoPte.DBLCBSubestacionClick(Sender: TObject);
begin
  if DBLCBSubestacion.Text<>'' then
  begin
    if rbSubestacion.Checked then
    begin
      if Elemento.Enabled = false then
        Elemento.Enabled:= true
      else
      begin
        if (Elemento.Text <> '') then
        begin
          Elemento.KeyValue:= 0;
          if cbElemento.Items.Count > 1 then
            cbElemento.Clear;
        end;
      end;
    end
    else
    begin
      if qCircuito.Active then
        qCircuito.Close;
      qCircuito.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(DBLCBSubestacion.keyvalue);
      qCircuito.Open;
      if Elemento.Enabled = false then
        Elemento.Enabled:= true
      else
      begin
        if(Elemento.Text <> '') then
        begin
          Elemento.KeyValue:= 0;
          if cbElemento.Items.Count > 1 then
            cbElemento.Clear;
        end;
      end;
    end;
  end;
end;

procedure TfFiltroMantenimientoPte.LineaClick(Sender: TObject);
var sqltablaelemento:string;
begin
  inherited;
  if cbElemento.Enabled = false then
    cbElemento.Enabled:= true;

  if QCircuito.Active then
    QCircuito.Close;
  if(qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
  begin
    if qTablaElemento.Active then
       qTablaElemento.Close;
    qTablaElemento.SQL.Clear;
    sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                        qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO=:CODIGOCIRCUITO';
    qTablaElemento.SQL.Add(sqltablaelemento);
  end
  else if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
  begin
    if qTablaElemento.Active then
      qTablaElemento.Close;
    qTablaElemento.SQL.Clear;
    sqltablaelemento:= ' SELECT '+'  '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                        qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
    qTablaElemento.SQL.Add(sqltablaelemento);
  end
  ELSE if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
  begin
    if qTablaElemento.Active then
     qTablaElemento.Close;
    qTablaElemento.SQL.Clear;
    sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                      qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
    qTablaElemento.SQL.Add(sqltablaelemento);
  end
  else
  begin
    if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring ='') then
    BEGIN
      if qTablaElemento.Active then
        qTablaElemento.Close;
      qTablaElemento.SQL.Clear;
      sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+' '+'FROM'+' '+
                        qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOCIRCUITO =:CODIGOCIRCUITO';
      qTablaElemento.SQL.Add(sqltablaelemento);
    END;
  end;

  if qTablaElemento.Active then
   qTablaElemento.Close;
  qTablaElemento.ParamByName('CODIGOCIRCUITO').asstring:= vartostr(Linea.KeyValue);
  qTablaElemento.Open;

  if qTablaElemento.RecordCount > 0 then
  begin
    if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
    begin
      if codigo1.Items.Count >= 1 then
        codigo1.Clear;
      if CbElemento.Items.Count >= 1 then
        CbElemento.Clear;
      while not qTablaElemento.Eof do
      begin
        codigo1.Items.Append(qTablaElemento.fields[0].asstring);
        CbElemento.Items.Append(qTablaElemento.fields[1].asstring);
        qTablaElemento.Next;
      end;
    end
    else if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
    begin
      if codigo1.Items.Count >= 1 then
        codigo1.Clear;
      if CbElemento.Items.Count >= 1 then
        CbElemento.Clear;

      while not qTablaElemento.Eof do
        begin
          codigo1.Items.Append(qTablaElemento.fields[0].asstring);
          CbElemento.Items.Append(qTablaElemento.fields[0].asstring);
          qTablaElemento.Next;
        end;
    end
    else if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
    begin
      if codigo1.Items.Count >= 1 then
        codigo1.Clear;
      if codigo2.Items.Count >= 1 then
        codigo2.Clear;
      if CbElemento.Items.Count >= 1 then
        CbElemento.Clear;

      while not qTablaElemento.Eof do
        begin
          codigo1.Items.Append(qTablaElemento.fields[0].asstring);
          codigo2.Items.Append(qTablaElemento.fields[1].asstring);
          CbElemento.Items.Append(qTablaElemento.fields[2].asstring);
          qTablaElemento.Next;
        end;
    end
    else
    begin
      if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
      BEGIN
        if codigo1.Items.Count >= 1 then
          codigo1.Clear;
        if codigo2.Items.Count >= 1 then
          codigo2.Clear;
        if CbElemento.Items.Count >= 1 then
          CbElemento.Clear;

        while not qTablaElemento.Eof do
        begin
          codigo1.Items.Append(qTablaElemento.fields[0].asstring);
          codigo2.Items.Append(qTablaElemento.fields[1].asstring);
          CbElemento.Items.Append(qTablaElemento.fields[0].asstring + qTablaElemento.Fields[1].asstring);
          qTablaElemento.Next;
        end;
      END;
    end;
  end
else
  MessageDlg('No se encontraron elementos de ese tipo asociados con la línea.', mtInformation,[mbOk], 0);
end;

procedure TfFiltroMantenimientoPte.rbLineaClick(Sender: TObject);
begin
  if qCircuito.Active then
    qCircuito.Close;
  if lLinea.Enabled = false then
    lLinea.Enabled:= true;
  if Linea.Enabled = false then
    Linea.Enabled:= true;
  if qElemento.Active then
    qElemento.Close;
  qElemento.ParamByName('CODIGOAMBITO').asinteger:= 2;
  qElemento.Open;
end;

procedure TfFiltroMantenimientoPte.rbSubestacionClick(Sender: TObject);
begin
  if qCircuito.Active then
    qCircuito.Close;
  if lLinea.Enabled = true then
    lLinea.Enabled:= false;
  if Linea.Enabled = true then
    Linea.Enabled:= false;
  if qElemento.Active then
    qElemento.Close;
  qElemento.ParamByName('CODIGOAMBITO').asinteger:= 1;
  qElemento.Open;
end;

procedure TfFiltroMantenimientoPte.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Action:=cafree;
end;

procedure TfFiltroMantenimientoPte.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
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

procedure TfFiltroMantenimientoPte.ElementoClick(Sender: TObject);
var sqltablaelemento:string;
begin
  if rbLinea.Checked then
  begin
  if lLinea.Enabled = false then
    lLinea.Enabled:= true;
  if Linea.Enabled = false then
    Linea.Enabled:= true;
  end;

  if qCaracteristicasElemento.Active then
    qCaracteristicasElemento.Close;
  qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
  qCaracteristicasElemento.Open;

  if (qElementoCODIGOAMBITO.AsInteger= 1) then
  begin
    if cbElemento.Enabled = false then
      cbElemento.Enabled:= true;
    if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
    begin
      if qTablaElemento.Active then
        qTablaElemento.Close;
      qTablaElemento.SQL.Clear;
      sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                          qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
      qTablaElemento.SQL.Add(sqltablaelemento);
      qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(DBLCBSubestacion.keyvalue);
      qTablaElemento.Open;
      if codigo1.Items.Count >= 1 then
        codigo1.Clear;
      if cbElemento.Items.Count >= 1 then
        cbElemento.Clear;
      if not qTablaElemento.IsEmpty then
        begin
          while not qTablaElemento.Eof do
            begin
             codigo1.Items.Append(qTablaElemento.fields[0].asstring);
             cbElemento.Items.Append(qTablaElemento.fields[1].asstring);
             qTablaElemento.Next;
            end;
        end
      else
        MessageDlg('No se encontraron elementos de ese tipo asociados a la subestación.', mtInformation,[mbOk], 0);
    end
    else
  //    begin
        if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
          begin
            if qTablaElemento.Active then
            qTablaElemento.Close;
            qTablaElemento.SQL.Clear;
            sqltablaelemento:= ' SELECT '+'  '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                               qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
            qTablaElemento.SQL.Add(sqltablaelemento);
            qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(dblcbSubestacion.keyvalue);
            qTablaElemento.Open;
            if codigo1.Items.Count >= 1 then
              codigo1.Clear;
            if cbElemento.Items.Count >= 1 then
              cbElemento.Clear;
            if not qTablaElemento.IsEmpty then
              begin
                while not qTablaElemento.Eof do
                  begin
                    codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                    cbElemento.Items.Append(qTablaElemento.fields[0].asstring);
                    qTablaElemento.Next;
                  end;
              end
            else
              MessageDlg('No se encontraron elementos de ese tipo asociados a la subestación.', mtInformation,[mbOk], 0);
          end
  //    end;
    else if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
      begin
        if qTablaElemento.Active then
        qTablaElemento.Close;
        qTablaElemento.SQL.Clear;
        sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                            qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
        qTablaElemento.SQL.Add(sqltablaelemento);
        qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(DBLCBSubestacion.keyvalue);
        qTablaElemento.Open;
        if codigo1.Items.Count >= 1 then
          codigo1.Clear;
        if codigo2.Items.Count >= 1 then
          codigo2.Clear;
        if cbElemento.Items.Count >= 1 then
          cbElemento.Clear;
        if not qTablaElemento.IsEmpty then
          begin
            while not qTablaElemento.Eof do
              begin
                codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                cbElemento.Items.Append(qTablaElemento.fields[2].asstring);
                qTablaElemento.Next;
              end;
          end
        else
         MessageDlg('No se encontraron elementos de ese tipo asociados a la subestación.', mtInformation,[mbOk], 0);
      end
    else
      begin
        if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
          begin
            if qTablaElemento.Active then
              qTablaElemento.Close;
            qTablaElemento.SQL.Clear;
            sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+' '+'FROM'+' '+
                               qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
            qTablaElemento.SQL.Add(sqltablaelemento);
            qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(DBLCBSubestacion.keyvalue);
            qTablaElemento.Open;
            if codigo1.Items.Count >= 1 then
              codigo1.Clear;
            if codigo2.Items.Count >= 1 then
              codigo2.Clear;
            if cbElemento.Items.Count >= 1 then
              cbElemento.Clear;
            if not qTablaElemento.IsEmpty then
              begin
                while not qTablaElemento.Eof do
                  begin
                    codigo1.Items.Append(qTablaElemento.fields[0].asstring);
                    codigo2.Items.Append(qTablaElemento.fields[1].asstring);
                    cbElemento.Items.Append(qTablaElemento.fields[0].asstring + qTablaElemento.Fields[1].asstring);
                    qTablaElemento.Next;
                  end;
              end
            else
              MessageDlg('No se encontraron elementos de ese tipo asociados a la subestación.', mtInformation,[mbOk], 0);
          end;
      end;
  end;
end;

end.


