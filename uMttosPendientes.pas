unit uMttosPendientes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, ComCtrls, ExtCtrls, Db, DBTables;

type
  TfMttosPendientes = class(TForm)
    Panel1: TPanel;
    dsElemento: TDataSource;
    qElemento: TQuery;
    qSubestacion: TQuery;
    dsSubestacion: TDataSource;
    qCaracteristicasElemento: TQuery;
    qTablaElemento: TQuery;
    qMantenimientoElemento: TQuery;
    PanelSuperior: TPanel;
    Panel4: TPanel;
    sbProgramar: TSpeedButton;
    sbMantenimiento: TSpeedButton;
    codigo4: TListBox;
    codigo1: TListBox;
    codigo2: TListBox;
    codigo3: TListBox;
    Panel2: TPanel;
    PanelSCentral: TPanel;
    GroupBox2: TGroupBox;
    Subestacion: TDBLookupComboBox;
    Elemento: TDBLookupComboBox;
    Linea: TDBLookupComboBox;
    cbElemento: TComboBox;
    GroupBox1: TGroupBox;
    rbSubestacion: TRadioButton;
    rbLinea: TRadioButton;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    lLinea: TLabel;
    Memo1: TMemo;
    PanelInfCentral: TPanel;
    Label5: TLabel;
    PanelCentral: TPanel;
    lbMantenimientos: TListBox;
    SpeedButton1: TSpeedButton;
    qCircuito: TQuery;
    dsCircuito: TDataSource;
    procedure ElementoClick(Sender: TObject);
    procedure SubestacionClick(Sender: TObject);
    procedure cbElementoClick(Sender: TObject);
    procedure sbProgramarClick(Sender: TObject);
    procedure rbSubestacionClick(Sender: TObject);
    procedure rbLineaClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    fechaelemento:Tdate;
    constructor BuscarMantenimientos(AOwner:Tcomponent;fecha_mtto:TDate);
//    procedure Elementos(tipoelemento:integer;codsubestacion:string);
  end;

var
  fMttosPendientes: TfMttosPendientes;

implementation

uses uMantenimientoMes;

{$R *.DFM}


constructor TfMttosPendientes.BuscarMantenimientos(AOwner:TComponent;fecha_mtto:TDate);
begin
  inherited create(owner);
  fechaelemento:= fecha_mtto;
  if qElemento.Active then
    qElemento.Close;
  qElemento.Open;
  if qSubestacion.Active then
    qSubestacion.Close;
  qSubestacion.Open;

end;



procedure TfMttosPendientes.ElementoClick(Sender: TObject);
var sqltablaelemento:string;
begin
  if cbElemento.Enabled = false then
    cbElemento.Enabled:= true;
  if qCaracteristicasElemento.Active then
    qCaracteristicasElemento.Close;
  qCaracteristicasElemento.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
  qCaracteristicasElemento.Open;
  if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <>'') then
    begin
      if qTablaElemento.Active then
        qTablaElemento.Close;
      qTablaElemento.SQL.Clear;
      sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+
                          qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
      qTablaElemento.SQL.Add(sqltablaelemento);
      qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(Subestacion.keyvalue);
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
    begin
      if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
        begin
          if qTablaElemento.Active then
          qTablaElemento.Close;
          qTablaElemento.SQL.Clear;
          sqltablaelemento:= ' SELECT '+'  '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+' '+'FROM'+' '+
                             qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
          qTablaElemento.SQL.Add(sqltablaelemento);
          qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(Subestacion.keyvalue);
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
        end;
    end;
  if (qCaracteristicasElemento.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) and (qCaracteristicasElemento.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
    begin
      if qTablaElemento.Active then
      qTablaElemento.Close;
      qTablaElemento.SQL.Clear;
      sqltablaelemento:= ' SELECT '+' '+qCaracteristicasElemento.fieldbyname('CLAVEELEMENTO1').asstring+','+QCaracteristicasElemento.fieldbyname('CLAVEELEMENTO2').asstring+','+qCaracteristicasElemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+' FROM'+' '+
                          qCaracteristicasElemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+'WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION';
      qTablaElemento.SQL.Add(sqltablaelemento);
      qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(Subestacion.keyvalue);
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
          qTablaElemento.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(Subestacion.keyvalue);
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

  if qMantenimientoElemento.Active then
    qMantenimientoElemento.Close;
  qMantenimientoElemento.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
  qMantenimientoElemento.Open;

end;

procedure TfMttosPendientes.SubestacionClick(Sender: TObject);
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
      qCircuito.ParamByName('CODIGOSUBESTACION').asstring:= vartostr(subestacion.keyvalue);
      qCircuito.Open;
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
    end;
end;

procedure TfMttosPendientes.cbElementoClick(Sender: TObject);
var qry1,qry2,qry3: Tquery;
    sqlmantenimiento,sqltarea: string;
    rangofecha:Tdate;
    year1,year2,mes1,mes2,dia1,dia2:word;
begin
  //proceso
  if qMantenimientoElemento.Active then
    qMantenimientoElemento.Close;
  qMantenimientoElemento.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
  qMantenimientoElemento.Open;
  if not (qMantenimientoElemento.IsEmpty) then
    begin
      qry1:= Tquery.Create(application);
      qry1.DatabaseName:='BaseDato';
      qry1.SQL.Append('select numeroclaveselemento from pm_elemento where codigoelemento =:codigoelemento');
      qry1.ParamByName('CODIGOELEMENTO').asinteger:= Elemento.KeyValue;
      qry1.Open;
      qry2:= Tquery.Create(application);
      qry2.DatabaseName:='BaseDato';
      qry3:= Tquery.Create(application);
      qry3.DatabaseName:='BaseDato';
      while not qMantenimientoElemento.Eof do
        begin
          if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) then
            begin
              sqlmantenimiento:= ' select max(t.fechainicial) as fechaultimo from pm_tarea t,pm_mantenimiento m,pm_elementomantenimiento em where '+
                                 ' em.clelemento1 = '''+codigo1.Items[cbElemento.ItemIndex]+''' and '+
                                 ' em.codigoelementomantenimiento = m.codigomantenimiento and m.codigobancomantenimiento = '+qMantenimientoElemento.FieldByName('CODIGOBANCOMANTENIMIENTO').asstring+' and '+
                                 ' m.codigomantenimiento = t.codigotarea ';
                            //   ' group by fechainicial,codigotarea';
                    sqltarea:=   ' select max(t.codigotarea) as ultimo from pm_tarea t,pm_mantenimiento m,pm_elementomantenimiento em where '+
                                 ' em.clelemento1 = '''+codigo1.Items[cbElemento.ItemIndex]+''' and '+
                                 ' em.codigoelementomantenimiento = m.codigomantenimiento and '+
                                 ' m.codigobancomantenimiento = '+qMantenimientoElemento.FieldByName('CODIGOBANCOMANTENIMIENTO').asstring+' and '+
                                 ' m.codigomantenimiento = t.codigotarea ';
            end

            {sqlmantenimiento-17-02-2007:= ' select max(fechainicial) as fechaultimo,t.codigotarea from pm_tarea t,pm_mantenimiento m,pm_elementomantenimiento em where '+
                               ' em.clelemento1 = '''+codigo1.Items[cbElemento.ItemIndex]+''' and '+
                               ' em.codigoelementomantenimiento = m.codigomantenimiento and m.codigobancomantenimiento = '+qMantenimientoElemento.FieldByName('CODIGOBANCOMANTENIMIENTO').asstring+' and '+
                               ' m.codigomantenimiento = t.codigotarea'+
                               ' group by fechainicial,codigotarea'}
            {sqlmantenimiento:= ' select max(fechainicial) as fechaultimo,t.codigotarea from pm_tarea t,pm_mantenimiento m,pm_elementomantenimiento em where '+
                               ' em.clelemento1 = '''+codigo1.Items[cbElemento.ItemIndex]+''' and '+
                               ' em.codigoelementomantenimiento = m.codigomantenimiento and m.codigobancomantenimiento = '+qMantenimientoElemento.FieldByName('CODIGOBANCOMANTENIMIENTO').asstring+' and '+
                               ' m.codigomantenimiento = t.codigotarea'}
            {sqlmantenimiento:= ' select max(to_date(fechainicial,''ddmmyyyy'')) as fechaultimo from pm_tarea t,pm_mantenimiento m,pm_elementomantenimiento em where '+
                               ' em.clelemento1 = '''+codigo1.Items[cbElemento.ItemIndex]+''' and '+
                               ' em.codigoelementomantenimiento = m.codigomantenimiento and m.codigobancomantenimiento = '+qMantenimientoElemento.FieldByName('CODIGOBANCOMANTENIMIENTO').asstring+' and '+
                               ' m.codigomantenimiento = t.codigotarea'}
          else
            begin
              if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) then
                begin
                  sqlmantenimiento:= ' select max(fechainicial) as fechaultimo from pm_tarea t,pm_mantenimiento m,pm_elementomantenimiento em where '+
                                     ' em.clelemento1 = '''+codigo1.Items[cbElemento.ItemIndex]+''' and em.clelemento2 = '''+codigo2.Items[cbElemento.itemindex]+''' and '  +
                                     ' em.codigoelementomantenimiento = m.codigomantenimiento and m.codigobancomantenimiento = '''+qMantenimientoElemento.FieldByName('CODIGOBANCOMANTENIMIENTO').asstring+''' and '+
                                     ' m.codigomantenimiento = t.codigotarea';
                                 //  ' group by fechainicial,codigotarea';
                        sqltarea:=   ' select max(t.codigotarea) as ultimo, from pm_tarea t,pm_mantenimiento m,pm_elementomantenimiento em where '+
                                     ' em.clelemento1 = '''+codigo1.Items[cbElemento.ItemIndex]+''' and em.clelemento2 = '''+codigo2.Items[cbElemento.itemindex]+''' and '  +
                                     ' em.codigoelementomantenimiento = m.codigomantenimiento and m.codigobancomantenimiento = '''+qMantenimientoElemento.FieldByName('CODIGOBANCOMANTENIMIENTO').asstring+''' and '+
                                     ' m.codigomantenimiento = t.codigotarea';
                end;

            end;
          qry2.SQL.Clear;
          qry2.SQL.Append(sqlmantenimiento);
          qry2.Open;
          qry3.SQL.Clear;
          qry3.SQL.Append(sqltarea);
          qry3.Open;
          if (qry2.fieldbyname('FECHAULTIMO').asstring <> '') then
          //if not (qry2.RecordCount = 0) then
          //if not qry2.IsEmpty then
            begin
              //rangofecha:= qry2.fieldbyname('FECHAULTIMO').asinteger + qMantenimientoElemento.fieldbyname('FRECUENCIA').asinteger;
             // rangofecha:= qry2.fieldbyname('FECHAULTIMO').value + qMantenimientoElemento.fieldbyname('FRECUENCIA').asinteger;
              rangofecha:= qry2.fieldbyname('FECHAULTIMO').value + qMantenimientoElemento.fieldbyname('FRECUENCIA').value;
              decodedate(rangofecha,year1,mes1,dia1);
              decodedate(fechaelemento,year2,mes2,dia2);
              if (year1 = year2) and (mes1 = mes2) then
                begin
                  codigo4.Items.Append(qry3.fieldbyname('ULTIMO').asstring);
                  codigo3.Items.Append(qMantenimientoElemento.fieldbyname('CODIGOBANCOMANTENIMIENTO').asstring);
                  lbMantenimientos.Items.Append(qMantenimientoElemento.fieldbyname('NOMBREMANTENIMIENTO').asstring);
                end;
            end;
          qMantenimientoElemento.Next;

        end;
      if (lbMantenimientos.Items.Count = 0) then
        MessageDlg('No existen mantenimientos que programar para el elemento', mtInformation,[mbOk], 0)
      else
        begin
          if (sbProgramar.Enabled = false) and (sbMantenimiento.Enabled = false) then
            begin
              sbProgramar.Enabled:= true;
              sbMantenimiento.Enabled:= true;
            end;
        end;

    end
  else
    MessageDlg('No hay mantenimientos creados para el tipo de elemento seleccionado', mtInformation,[mbOk], 0);
end;

procedure TfMttosPendientes.sbProgramarClick(Sender: TObject);
begin
  if (lbMantenimientos.Items.Count >= 1) then
    if (lbMantenimientos.ItemIndex = -1) then
      MessageDlg('Debe seleccionar un mantenimiento.', mtInformation,[mbOk], 0)
    else
      begin
        fMantenimientoMes:= TfMantenimientoMes.programar(self,strtofloat(codigo3.Items[lbMantenimientos.ItemIndex]),strtofloat(codigo4.Items[lbMantenimientos.ItemIndex]));
        if fMantenimientoMes.ShowModal = mrOk then
          lbMantenimientos.Items.Delete(lbMantenimientos.itemindex);
        if lbMantenimientos.Items.Count = 0 then
          if sbProgramar.Enabled = true then
            sbProgramar.Enabled:= false;
        fMantenimientoMes.Free;
      end;

end;

procedure TfMttosPendientes.rbSubestacionClick(Sender: TObject);
begin
  if qCircuito.Active then
    qCircuito.Close;
  if lLinea.Enabled = true then
    lLinea.Enabled:= false;
  if Linea.Enabled = true then
    Linea.Enabled:= false;
  if lbMantenimientos.Items.Count > 0 then
    lbMantenimientos.Clear;
  if qElemento.Active then
    qElemento.Close;
  qElemento.ParamByName('CODIGOAMBITO').asinteger:= 1;
  qElemento.Open;

end;

procedure TfMttosPendientes.rbLineaClick(Sender: TObject);
begin
  if qCircuito.Active then
    qCircuito.Close;
  if lLinea.Enabled = false then
    lLinea.Enabled:= true;
  if Linea.Enabled = false then
    Linea.Enabled:= true;
  if lbMantenimientos.Items.Count > 0 then
    lbMantenimientos.Clear;
  if qElemento.Active then
    qElemento.Close;
  qElemento.ParamByName('CODIGOAMBITO').asinteger:= 2;
  qElemento.Open;
end;

procedure TfMttosPendientes.SpeedButton1Click(Sender: TObject);
begin
  fMttosPendientes.ModalResult:= mrOk;
end;

procedure TfMttosPendientes.FormShow(Sender: TObject);
begin
  rbSubestacion.Checked:= true;
end;

end.
