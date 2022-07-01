unit uQRCalendarioMantenimiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  QuickRpt, Qrctrls, ExtCtrls, Db, DBTables, StdCtrls;


const
   meses: array[0..11] of string = ('Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre');



type
    PunteroListaReporte=^EstructuraReporte;

    EstructuraReporte=Record
    Dia:Integer;
    qrrtMantenimiento:TQRMemo;
    qrrtNumeroDia:TQRMemo;

    {EstructuraReporte=Record
    Dia:Integer;
    qrrtMantenimiento:TQRRichText;
    qrrtNumeroDia:TQRRichText;}
    
end;


type
  TFQRCalendarioMantenimiento = class(TForm)
    QuickRep1: TQuickRep;
    Query1: TQuery;
    QRBand1: TQRBand;
    qrlDomingo: TQRLabel;
    qrlYear: TQRLabel;
    qrlMes: TQRLabel;
    QRLabel2: TQRLabel;
    qrlLunes: TQRLabel;
    qrlmartes: TQRLabel;
    qrlmiercoles: TQRLabel;
    qrljueves: TQRLabel;
    qrlviernes: TQRLabel;
    qrlsabado: TQRLabel;
    QRLabel1: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    procedure QuickRep1AfterPreview(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    DiasMes,DiaInicial,DiaCalendario,iterador: Integer;
    PunteroLista,TempPunteroListaSub,TempPunteroListaCto: PunteroListaReporte;
    ListaEstructuraReporte:TList;
    memocalendario:TQRMemo;

    qrrtMantenimientoReporte,qrrtNumeroDiaReporte:TQRMemo;
    MYReporte,FestivoReporte:string;
//    qrrtMantenimientoReporte,qrrtNumeroDiaReporte:TQRRichText;
    constructor GenerarCalendario(AOwner:TComponent; Mes_Year:String;NDias,LugarDia:Integer);
//    procedure GenerarDiasReporte(DSemanaReporte,NFilaReporte,DiaActual:Integer);
    procedure GenerarDiasReporte(DSemanaReporte,NFilaReporte:Integer);
    procedure SubestacionDiaReporte(DiaConsultaSub:String);
    procedure CircuitoDiaReporte(DiaConsultaCto:String);
  end;

var
  FQRCalendarioMantenimiento: TFQRCalendarioMantenimiento;

implementation

uses UCronograma;

{$R *.DFM}


procedure TFQRCalendarioMantenimiento.GenerarDiasReporte(DSemanaReporte,NFilaReporte:Integer);
function EsFestivo(FechaFestivo: string):Boolean;
var qryfestivo:Tquery;
begin
  qryfestivo:= TQuery.Create(application);
  qryfestivo.DatabaseName:='BaseDato';
  qryfestivo.SQL.Text:= 'SELECT * FROM SIP_FESTIVOS WHERE UPPER(DESCRIPCION) LIKE ''%FESTIVO%'' AND TO_CHAR(FECHA,''DDMMYYYY'') = :FECHA';
  qryfestivo.ParamByName('FECHA').asstring:= FechaFestivo;
  qryfestivo.Open;
  if qryfestivo.IsEmpty then
    result:= False
  else result:= true;

end;
begin
  qrrtMantenimientoReporte:= TQRMemo.Create(QRBand1);
  qrrtMantenimientoReporte.Parent:= QRBand1;
  qrrtMantenimientoReporte.Font.Style:= [fsBold];
  qrrtMantenimientoReporte.AutoSize:= False;
  qrrtMantenimientoReporte.AutoStretch:= false;
  qrrtMantenimientoReporte.Height:=112;
  {qrrtMantenimientoReporte:= TQRRichText.Create(QRBand1);
  qrrtMantenimientoReporte.Parent:= QRBand1;
  qrrtMantenimientoReporte.Height:=112;}

//  'SELECT COUNT(*) FROM SIP_FESTIVOS@SIC WHERE UPPER(DESCRIPCION) LIKE ''%FESTIVO%'' AND FECHA = :FECHA'
  qrrtMantenimientoReporte.Top:= 76 + ((qrrtMantenimientoReporte.Height * NFilaReporte) - qrrtMantenimientoReporte.Height);
//  qrrtMantenimientoReporte.Top:= 115 + ((qrrtMantenimientoReporte.Height * NFilaReporte) - qrrtMantenimientoReporte.Height);
  qrrtMantenimientoReporte.Width:= 142;
//  qrrtMantenimientoReporte.Width:= 148;
//  qrrtMantenimientoReporte.Left:= 40 + ((qrrtMantenimientoReporte.Width * DSemanaReporte) - qrrtMantenimientoReporte.Width);
  qrrtMantenimientoReporte.Left:= 2 + ((qrrtMantenimientoReporte.Width * DSemanaReporte) - qrrtMantenimientoReporte.Width);
//  qrrtMantenimientoReporte.Font.Size:= 5;
  qrrtMantenimientoReporte.Font.Size:=7;
  ///////
      qrrtMantenimientoReporte.Alignment:=taLeftJustify;
///////
  qrrtMantenimientoReporte.Frame.DrawTop:= true;
  qrrtMantenimientoReporte.Frame.DrawBottom:= true;
  qrrtMantenimientoReporte.Frame.DrawLeft:= true;
  qrrtMantenimientoReporte.Frame.DrawRight:= true;
  if DSemanaReporte = 7 then
    qrrtMantenimientoReporte.Color:= $00AAFDAE;
  if (iterador >= DiaInicial) and (iterador <= (DiasMes+DiaInicial)-1) then
    begin
      if DiaCalendario <= 9 then
        FestivoReporte:= '0'+inttostr(DiaCalendario)+MYReporte
      else FestivoReporte:= inttostr(DiaCalendario)+MYReporte;
      if EsFestivo(FestivoReporte) then
        qrrtMantenimientoReporte.Color:= $00AAFDAE;
        qrrtMantenimientoReporte.Lines.Append(''+inttostr(DiaCalendario));
        DiaCalendario:= DiaCalendario + 1;
    {  qrrtMantenimientoReporte.Lines.Append('                                                                    '+inttostr(DiaCalendario));
      DiaCalendario:= DiaCalendario + 1;
     } New(PunteroLista);
      PunteroLista^.qrrtMantenimiento:= qrrtMantenimientoReporte;
      ListaEstructuraReporte.Add(PunteroLista);
    end;
  {qrrtNumeroDiaReporte:= TQRRichText.Create(QRBand1);
  qrrtNumeroDiaReporte.Parent:= QRBand1;
  qrrtNumeroDiaReporte.Height:= 14;
  qrrtNumeroDiaReporte.Top:= 81 + ((qrrtNumeroDiaReporte.Height * NFilaReporte) - qrrtNumeroDiaReporte.Height);
  qrrtNumeroDiaReporte.Width:= 148;
  qrrtNumeroDiaReporte.Left:= 40 + ((qrrtNumeroDiaReporte.Width * DSemanaReporte) - qrrtMantenimientoReporte.Width);
  qrrtNumeroDiaReporte.Alignment:= taRightJustify;
  qrrtNumeroDiaReporte.Font.Size:= 10;
  qrrtNumeroDiaReporte.Lines.Append(inttostr(DiaActual));}
  {New(PunteroLista);
  PunteroLista^.Dia:= DiaActual;
  PunteroLista^.qrrtMantenimiento:= qrrtMantenimientoReporte;

  ListaEstructuraReporte.Add(PunteroLista);}

end;


procedure TFQRCalendarioMantenimiento.SubestacionDiaReporte(DiaConsultaSub:String);
function NombreElemento(codmantenimiento:real):string;
var sqlelemento,sqltabla,cadena:string;
    qry1,qrytabla:Tquery;
begin
  sqlelemento:= 'select bm.codigoelemento,em.clelemento1,clelemento2,e.claveelemento1,e.claveelemento2,e.nombretablaelemento,e.campodescriptivo,e.numeroclaveselemento '+
                'from pm_mantenimiento m,pm_bancomantenimiento bm,pm_elementomantenimiento em,pm_elemento e '+
                'where m.codigomantenimiento =:codigomantenimiento and m.codigobancomantenimiento = bm.codigobancomantenimiento and '+
                'bm.codigoelemento = e.codigoelemento and m.codigomantenimiento = em.codigoelementomantenimiento';
  qry1:= Tquery.Create(application);
  qry1.DatabaseName:='BaseDato';
  qry1.SQL.Append(sqlelemento);
  qry1.ParamByName('CODIGOMANTENIMIENTO').asfloat:= codmantenimiento;
  qry1.Open;
  if (qry1.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
    begin
      if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) then
        begin
          sqltabla:= ' SELECT '+' '+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+qry1.fieldByName('NOMBRETABLAELEMENTO').asstring+' '+
                     ' WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+'='''+qry1.fieldbyname('CLELEMENTO1').asstring+''' ';
                      {sqltabla:= ' SELECT '+' '+qryelemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+qryelemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+
                                 ' WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION AND'+qryelemento.fieldbyname('CLAVEELEMENTO1').asstring+'='+qMantenimientos.fieldbyname('CLELEMENTO1').asstring;}
          qrytabla:= Tquery.Create(application);
          qrytabla.DatabaseName:='BaseDato';
          qrytabla.SQL.Append(sqltabla);
          qrytabla.Open;

                   //  lbDisponibles.Items.Append(qMantenimientos.fieldbyname('NOMBRETAREA').asstring+' '+qrytabla.fields[0].asstring+' '+'Subestacion'+' '+qMantenimientos.fieldbyname('NOMBRESUBESTACION').asstring);
          result:= qrytabla.fields[0].asstring;
        end
      else
        begin
          if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) then
            begin
              sqltabla:= ' SELECT '+' '+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+qry1.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+
                         ' WHERE '+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+'='''+qry1.fieldbyname('CLELEMENTO1').asstring+''' and '+' '+
                           qry1.fieldbyname('CLAVEELEMENTO2').asstring+'='''+qry1.fieldbyname('CLELEMENTO2').asstring+''' ';
                          {sqltabla:= ' SELECT '+' '+qryelemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+qryelemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+
                                     ' WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION AND'+qryelemento.fieldbyname('CLAVEELEMENTO1').asstring+'='+qMantenimientos.fieldbyname('CLELEMENTO1').asstring+'and'+
                                       qryelemento.fieldbyname('CLAVEELEMENTO2').asstring+'='+qMantenimientos.fieldbyname('CLELEMENTO2').asstring;}
              qrytabla:= Tquery.Create(application);
              qrytabla.DatabaseName:='BaseDato';
              qrytabla.SQL.Append(sqltabla);
              qrytabla.Open;
              result:= qrytabla.fields[0].asstring;
            end;
        end;
    end
  else
    begin
      if (qry1.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
        begin
          if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) then
            result:= qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+qry1.fieldbyname('CLELEMENTO1').asstring
          else
            begin
              if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) then
                result:= qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+qry1.fieldbyname('CLELEMENTO1').asstring+qry1.fieldbyname('CLELEMENTO2').asstring;
            end;
        end;
    end;
  qry1.Free;



end;

procedure Actividades(codmantenimiento: real);
var qryactividades:Tquery;
    sqlactividades: string;
begin
  sqlactividades:= ' select am.NOMBREACTIVIDADMANTENIMIENTO from pm_actividadesprogramadas ap,pm_actividadmantenimiento am '+
                   ' where ap.CODIGOMANTENIMIENTO =:codigomantenimiento and ap.CODIGOACTIVIDADMANTENIMIENTO = am.CODIGOACTIVIDADMANTENIMIENTO ';
  qryactividades:= Tquery.Create(application);
  qryactividades.DatabaseName:='BaseDato';
  qryactividades.SQL.Append(sqlactividades);
  qryactividades.ParamByName('CODIGOMANTENIMIENTO').asfloat:= codmantenimiento;
  qryactividades.Open;
  if (qryactividades.RecordCount > 0) then
    begin
      while not (qryactividades.Eof) do
       begin
          TempPunteroListaSub^.qrrtMantenimiento.Lines.Append(AnsiLowerCase(qryactividades.fieldbyname('NOMBREACTIVIDADMANTENIMIENTO').asstring));
          qryactividades.Next;
        end;
    end;
  qryactividades.Close;
  qryactividades.Free;
end;



var qrysubdia,qrysub: TQuery;
    sqlsubdia,sqlsub,TempCodSub:string;
begin

    sqlsubdia:= ' SELECT M.CODIGOSUBESTACION,T.NOMBRETAREA,M.CODIGOMANTENIMIENTO FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                ' WHERE TO_CHAR(FECHAINICIAL, ''DDMMYYYY'') =:FECHATAREA AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND '+
                ' M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOAMBITO = 1 '+
                ' ORDER BY CODIGOSUBESTACION ';
   {sqlsubdia12-02-2007:= ' SELECT M.CODIGOSUBESTACION,T.NOMBRETAREA FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
              ' WHERE TO_CHAR(FECHAINICIAL, ''DDMMYYYY'') =:FECHATAREA AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND '+
              ' M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOAMBITO = 1 '+
              ' ORDER BY CODIGOSUBESTACION ';}
   {sqlsubdia:= ' SELECT M.CODIGOSUBESTACION,T.NOMBRETAREA FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
              ' WHERE TO_CHAR(FECHAINICIAL, ''DDMMYYYY'') =:FECHATAREA AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND '+
              ' M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOAMBITO = 1 '+
              ' GROUP BY CODIGOSUBESTACION,NOMBRETAREA ';}
  {sqlsubdia:= ' SELECT AM.CODIGOODTOPERA,M.CODIGOSUBESTACION,T.NOMBRETAREA FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ACTIVIDADMANTENIMIENTO AM '+
              ' WHERE TO_CHAR(FECHAINICIAL, ''DDMMYYYY'') =:FECHATAREA AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND '+
              ' M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND M.CODIGOBANCOMANTENIMIENTO = AM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOAMBITO = 1 '+
              ' GROUP BY CODIGOODTOPERA,CODIGOSUBESTACION,NOMBRETAREA ';}
  qrysubdia:= TQuery.Create(application);
  qrysubdia.DatabaseName:='BaseDato';
  qrysubdia.Sql.Clear;
  qrysubdia.SQL.Add(sqlsubdia);
  qrysubdia.ParamByName('FECHATAREA').AsString:= DiaConsultaSub;
  qrysubdia.Open;
  if not qrysubdia.IsEmpty then
    begin
      TempCodSub:= qrysubdia.fieldByName('CODIGOSUBESTACION').AsString;
      sqlsub:= ' SELECT SB.NOMBRESUBESTACION FROM SUBESTACION SB WHERE SB.CODIGOSUBESTACION =:CODIGOSUBESTACION ';
      qrysub:= TQuery.Create(application);
      qrysub.DatabaseName:='BaseDato';
      qrysub.SQL.Clear;
      qrysub.SQL.Add(sqlsub);
      qrysub.ParamByName('CODIGOSUBESTACION').AsString:= TempCodSub;
      qrysub.Open;

     // $000000B3

      TempPunteroListaSub^.qrrtMantenimiento.Lines.Append(AnsiUpperCase(qrysub.fieldByName('NOMBRESUBESTACION').asstring));
      while not qrysubdia.Eof do
        begin
          if (TempCodSub = qrysubdia.FieldByName('CODIGOSUBESTACION').AsString) then
            begin
              TempPunteroListaSub^.qrrtMantenimiento.Lines.Append(AnsiLowerCase(qrysubdia.fieldbyName('NOMBRETAREA').AsString+' '+NombreElemento(qrysubdia.fieldbyname('CODIGOMANTENIMIENTO').asfloat)));
              Actividades(qrysubdia.fieldbyname('CODIGOMANTENIMIENTO').asfloat);
            end
          else
            begin
              TempCodSub:= qrysubdia.fieldByName('CODIGOSUBESTACION').AsString;
              if qrysub.Active then
                qrysub.Close;
              qrysub.ParamByName('CODIGOSUBESTACION').AsString:= TempCodSub;
              qrysub.Open;
              TempPunteroListaSub^.qrrtMantenimiento.Lines.Append('      ');
              TempPunteroListaSub^.qrrtMantenimiento.Lines.Append(AnsiUpperCase(qrysub.fieldByName('NOMBRESUBESTACION').asstring));
              TempPunteroListaSub^.qrrtMantenimiento.Lines.Append(AnsiLowerCase(qrysubdia.fieldbyName('NOMBRETAREA').AsString+' '+NombreElemento(qrysubdia.fieldbyname('CODIGOMANTENIMIENTO').asfloat)));
              Actividades(qrysubdia.fieldbyname('CODIGOMANTENIMIENTO').asfloat);
             // TempPunteroListaSub^.qrrtMantenimiento.Lines.Append(AnsiLowerCase(qrysubdia.fieldbyName('NOMBRETAREA').AsString));
            end;
          qrysubdia.Next;
        end;
    end;
  qrysubdia.Free;


end;

procedure  TFQRCalendarioMantenimiento.CircuitoDiaReporte(DiaConsultaCto:String);
function NombreElemento(codmantenimiento:real):string;
var sqlelemento,sqltabla,cadena:string;
    qry1,qrytabla:Tquery;
begin
  sqlelemento:= 'select bm.codigoelemento,em.clelemento1,clelemento2,e.claveelemento1,e.claveelemento2,e.nombretablaelemento,e.campodescriptivo,e.numeroclaveselemento '+
                'from pm_mantenimiento m,pm_bancomantenimiento bm,pm_elementomantenimiento em,pm_elemento e '+
                'where m.codigomantenimiento =:codigomantenimiento and m.codigobancomantenimiento = bm.codigobancomantenimiento and '+
                'bm.codigoelemento = e.codigoelemento and m.codigomantenimiento = em.codigoelementomantenimiento';
  qry1:= Tquery.Create(application);
  qry1.DatabaseName:='BaseDato';
  qry1.SQL.Append(sqlelemento);
  qry1.ParamByName('CODIGOMANTENIMIENTO').asfloat:= codmantenimiento;
  qry1.Open;
  if (qry1.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
    begin
      if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) then
        begin
          sqltabla:= ' SELECT '+' '+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+qry1.fieldByName('NOMBRETABLAELEMENTO').asstring+' '+
                     ' WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+'='''+qry1.fieldbyname('CLELEMENTO1').asstring+''' ';
                      {sqltabla:= ' SELECT '+' '+qryelemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+qryelemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+
                                 ' WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION AND'+qryelemento.fieldbyname('CLAVEELEMENTO1').asstring+'='+qMantenimientos.fieldbyname('CLELEMENTO1').asstring;}
          qrytabla:= Tquery.Create(application);
          qrytabla.DatabaseName:='BaseDato';
          qrytabla.SQL.Append(sqltabla);
          qrytabla.Open;

                   //  lbDisponibles.Items.Append(qMantenimientos.fieldbyname('NOMBRETAREA').asstring+' '+qrytabla.fields[0].asstring+' '+'Subestacion'+' '+qMantenimientos.fieldbyname('NOMBRESUBESTACION').asstring);
          result:= qrytabla.fields[0].asstring;
        end
      else
        begin
          if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) then
            begin
              sqltabla:= ' SELECT '+' '+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+qry1.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+
                         ' WHERE '+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+'='''+qry1.fieldbyname('CLELEMENTO1').asstring+''' and '+' '+
                           qry1.fieldbyname('CLAVEELEMENTO2').asstring+'='''+qry1.fieldbyname('CLELEMENTO2').asstring+''' ';
                          {sqltabla:= ' SELECT '+' '+qryelemento.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+qryelemento.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+
                                     ' WHERE CODIGOSUBESTACION =:CODIGOSUBESTACION AND'+qryelemento.fieldbyname('CLAVEELEMENTO1').asstring+'='+qMantenimientos.fieldbyname('CLELEMENTO1').asstring+'and'+
                                       qryelemento.fieldbyname('CLAVEELEMENTO2').asstring+'='+qMantenimientos.fieldbyname('CLELEMENTO2').asstring;}
              qrytabla:= Tquery.Create(application);
              qrytabla.DatabaseName:='BaseDato';
              qrytabla.SQL.Append(sqltabla);
              qrytabla.Open;
              result:= qrytabla.fields[0].asstring;
            end;
        end;
    end
  else
    begin
      if (qry1.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
        begin
          if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) then
            result:= qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+qry1.fieldbyname('CLELEMENTO1').asstring
          else
            begin
              if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) then
                result:= qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+qry1.fieldbyname('CLELEMENTO1').asstring+qry1.fieldbyname('CLELEMENTO2').asstring;
            end;
        end;
    end;
  qry1.Free;



end;

var qryctodia,qrycto:TQuery;
    sqlctodia,sqlcto,TempCodCto:String;
begin
  sqlctodia:=   ' SELECT M.CODIGOCIRCUITO,T.NOMBRETAREA,M.CODIGOMANTENIMIENTO FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL, ''DDMMYYYY'') =:FECHATAREA AND '+
                ' T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                ' BM.CODIGOAMBITO = 2 '+
                ' ORDER BY CODIGOCIRCUITO ';
    {sqlctodia12-02-2007:= ' SELECT M.CODIGOCIRCUITO,T.NOMBRETAREA FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL, ''DDMMYYYY'') =:FECHATAREA AND '+
                ' T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                ' BM.CODIGOAMBITO = 2 '+
                ' ORDER BY CODIGOCIRCUITO ';}
   {sqlctodia:= ' SELECT M.CODIGOCIRCUITO,T.NOMBRETAREA FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL, ''DDMMYYYY'') =:FECHATAREA AND '+
              ' T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
              ' BM.CODIGOAMBITO = 2 '+
              ' GROUP BY CODIGOCIRCUITO,NOMBRETAREA ';}
  {sqlctodia:= ' SELECT AM.CODIGOODTOPERA,M.CODIGOCIRCUITO,T.NOMBRETAREA FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ACTIVIDADMANTENIMIENTO AM WHERE TO_CHAR(FECHAINICIAL, ''DDMMYYYY'') =:FECHATAREA AND '+
              ' T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOBANCOMANTENIMIENTO = AM.CODIGOBANCOMANTENIMIENTO AND '+
              ' BM.CODIGOAMBITO = 2 '+
              ' GROUP BY CODIGOODTOPERA,CODIGOCIRCUITO,NOMBRETAREA ';}
  qryctodia:= TQuery.Create(application);
  qryctodia.DatabaseName:='BaseDato';
  qryctodia.Sql.Clear;
  qryctodia.SQL.Add(sqlctodia);
  qryctodia.ParamByName('FECHATAREA').AsString:= DiaConsultaCto;
  qryctodia.Open;
  if not qryctodia.IsEmpty then
    begin
      TempCodCto:= qryctodia.fieldByName('CODIGOCIRCUITO').AsString;
      sqlcto:= ' SELECT C.NOMBRECIRCUITO FROM CIRCUITO C WHERE C.CODIGOCIRCUITO =:CODIGOCIRCUITO ';
      qrycto:= TQuery.Create(application);
      qrycto.DatabaseName:='BaseDato';
      qrycto.SQL.Clear;
      qrycto.SQL.Add(sqlcto);
      qrycto.ParamByName('CODIGOCIRCUITO').AsString:= TempCodCto;
      qrycto.Open;
      TempPunteroListaCto^.qrrtMantenimiento.Lines.Append(AnsiLowerCase(qrycto.FieldByName('NOMBRECIRCUITO').AsString));
      while not qryctodia.Eof do
        begin
          if TempCodCto = qryctodia.FieldByName('CODIGOCIRCUITO').AsString then
            TempPunteroListaCto^.qrrtMantenimiento.Lines.Append(AnsiLowerCase(qryctodia.FieldByName('NOMBRETAREA').AsString+' '+NombreElemento(qryctodia.fieldbyname('CODIGOMANTENIMIENTO').asfloat)))
          else
            begin
              TempCodCto:= qryctodia.fieldByName('CODIGOCIRCUITO').AsString;
              if qrycto.Active then
                qrycto.Close;
              qrycto.ParamByName('CODIGOCIRCUITO').AsString:= TempCodCto;
              qrycto.Open;
              TempPunteroListaCto^.qrrtMantenimiento.Lines.Append('         ');
              TempPunteroListaCto^.qrrtMantenimiento.Lines.Append(AnsiLowerCase(qrycto.fieldByName('NOMBRECIRCUITO').asstring));
              TempPunteroListaCto^.qrrtMantenimiento.Lines.Append(AnsiLowerCase(qryctodia.FieldByName('NOMBRETAREA').AsString+' '+NombreElemento(qryctodia.fieldbyname('CODIGOMANTENIMIENTO').asfloat)));
             // TempPunteroListaCto^.qrrtMantenimiento.Lines.Append(AnsiLowerCase(qryctodia.FieldByName('NOMBRETAREA').AsString));
            end;
          qryctodia.Next;

        end;

    end;
  qryctodia.Free;

end;


constructor TFQRCalendarioMantenimiento.GenerarCalendario(AOwner:TComponent;Mes_Year:String;NDias,LugarDia:Integer);
var DiaSemana,NFila,DiaTempSubestacion,DiaTempCircuito,I:Integer;
    MesLabel,YearLabel,DiaLabel:word;
    DateLabels:TDate;
    sql1,DiaConsulta: String;
    qry1: TQuery;


begin
  inherited create(Owner);
  ListaEstructuraReporte:= TList.Create;
  MYReporte:= Mes_Year;
  DiaCalendario:= 1;
  NFila:= 1;
  DiasMes:= NDias;
  DiaInicial:= LugarDia;
  DiaSemana:= 1;
  iterador:=1;
  DateLabels:= FCronograma.Calendario.Date;
  Decodedate(DateLabels,YearLabel,MesLabel,DiaLabel);
  qrlMes.Caption:= meses[MesLabel-1];
  qrlYear.Caption:= inttostr(YearLabel);
//  DiaSemana:= LugarDia;

  {while iterador <= NDias do
    begin
      GenerarDiasReporte(DiaSemana,NFila,iterador);
      iterador:= iterador+1;
      DiaSemana:=DiaSemana+1;
      if (DiaSemana=8) then
        begin
          DiaSemana:=1;
          NFila:=NFila+1;
        end;
    end;}


   for I:= 1 to 42 do
     begin
       GenerarDiasReporte(DiaSemana,NFila);
       iterador:= iterador + 1;
       DiaSemana:=DiaSemana+1;
       if (DiaSemana=8) then
         begin
           DiaSemana:=1;
           NFila:=NFila+1;
         end;
     end;


   sql1:= ' SELECT T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA FROM PM_TAREA T, PM_MANTENIMIENTO M, PM_BANCOMANTENIMIENTO BM '+
          '  WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+Mes_Year+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
          '  ORDER BY DIA,HORA ';
  {sql1:= ' SELECT T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,AM.CODIGOODTOPERA FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ACTIVIDADMANTENIMIENTO AM WHERE TO_CHAR(FECHAINICIAL,''MMYYYY'')= '''+Mes_Year+''' AND '+
        ' PM_TAREA.CODIGOTAREA = PM_MANTENIMIENTO.CODIGOMANTENIMIENTO AND PM_MANTENIMIENTO.CODIGOBANCOMANTENIMIENTO = PM_BANCOMANTENIMIENTO.CODIGOBANCOMANTENIMIENTO AND ' +
        ' PM_BANCOMANTENIMIENTO.CODIGOBANCOMANTENIMIENTO = PM_ACTIVIDADMANTENIMIENTO.CODIGOBANCOMANTENIMIENTO ORDER BY FECHAINICIAL ';}


  qry1:= TQuery.Create(application);
  qry1.DatabaseName:='BaseDato';
  qry1.Sql.Clear;
  qry1.SQL.Add(sql1);
  qry1.Open;

  if not qry1.IsEmpty then
    begin
      new(TempPunteroListaSub);
      new(TempPunteroListaCto);
      DiaTempSubestacion:= qry1.fieldbyName('DIA').AsInteger;
      if DiaTempSubestacion <= 9 then
        DiaConsulta:= '0'+InttoStr(DiaTempSubestacion)+Mes_Year
      else
        DiaConsulta:= InttoStr(DiaTempSubestacion)+Mes_Year;
      
      
      
      TempPunteroListaSub:= ListaEstructuraReporte.Items[DiaTempSubestacion - 1];
      SubestacionDiaReporte(DiaConsulta);
      while not qry1.Eof do
        begin
          if DiaTempSubestacion <> qry1.FieldByName('DIA').AsInteger then
            begin
              DiaTempSubestacion:= qry1.fieldbyName('DIA').AsInteger;
              if DiaTempSubestacion <= 9 then
                DiaConsulta:= '0'+InttoStr(DiaTempSubestacion)+Mes_Year
              else
                DiaConsulta:= InttoStr(DiaTempSubestacion)+Mes_Year;
              TempPunteroListaSub:= ListaEstructuraReporte.Items[DiaTempSubestacion - 1];
              SubestacionDiaReporte(DiaConsulta);

            end;
          qry1.Next;
        end;

      qry1.First;
      DiaTempCircuito:= qry1.fieldbyName('DIA').AsInteger;
      if DiaTempCircuito <= 9 then
        DiaConsulta:= '0'+InttoStr(DiaTempCircuito)+Mes_Year
      else
        DiaConsulta:= InttoStr(DiaTempCircuito)+Mes_Year;
      TempPunteroListaCto:= ListaEstructuraReporte.Items[DiaTempCircuito - 1];
      CircuitoDiaReporte(DiaConsulta);
      while not qry1.Eof do
        begin
          if DiaTempCircuito <> qry1.FieldByName('DIA').AsInteger then
            begin
              DiaTempCircuito:= qry1.fieldbyName('DIA').AsInteger;
              if DiaTempCircuito <= 9 then
                DiaConsulta:= '0'+InttoStr(DiaTempCircuito)+Mes_Year
              else
                DiaConsulta:= InttoStr(DiaTempCircuito)+Mes_Year;
              TempPunteroListaCto:= ListaEstructuraReporte.Items[DiaTempCircuito - 1];
              CircuitoDiaReporte(DiaConsulta);

            end;
          qry1.Next;
        end;

    end;
  qry1.Free;



end;


procedure TFQRCalendarioMantenimiento.QuickRep1AfterPreview(
  Sender: TObject);
begin
  close;
end;

procedure TFQRCalendarioMantenimiento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=cafree;
end;

end.
 