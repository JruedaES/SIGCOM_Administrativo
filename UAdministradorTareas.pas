
unit UAdministradorTareas;

interface

uses
    Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBGrids,
    DBTables, DBCtrls, Grids, StdCtrls, Calendar, Buttons, ComCtrls, ExtCtrls, UMantenimiento,
    UIdTarea;

type
    PunteroLista=^Estructura;
    Estructura=Record
    Dia:Integer;
    Panel:TPanel;
    Tarea:TIdTarea;
end;
type
  TParametros = array[0..6] of String;

type
    TAdministradorTareas = class (TObject)
  private

  public
        CrearIdTarea:TIdTarea;
        PunteroPanel:PunteroLista;
        Mantenimiento: TFMantenimiento;
        sql_AdministradorTareas,Year_Month:String;
        constructor CrearAdministrador();
        destructor DestruirAdministrador();
        procedure DefinirConsultaAdministrador(ParametrosConsulta: TParametros);
        procedure CrearMantenimiento();
        procedure CrearActividades(Mes_Agno:String; Var ListaPanel:TList;valores: TParametros);
  end;

implementation
uses uCronograma;
{ TAdministradorTareas }
//******************************************************************************
constructor TAdministradorTareas.CrearAdministrador();
begin
  inherited Create;
end;
//******************************************************************************

procedure TAdministradorTareas.DefinirConsultaAdministrador(ParametrosConsulta: TParametros);
var acumulado:Integer;
    qry1: TQuery;
begin
  sql_AdministradorTareas:='';
  acumulado:= StrToInt(ParametrosConsulta[0]);
  case acumulado of
    0:begin
        sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA, BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T, PM_MANTENIMIENTO M, PM_BANCOMANTENIMIENTO BM'+
                                 ' WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+ Year_Month+''' '+
                                 ' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO ORDER BY FECHAINICIAL,HORA ';
      end;
    /////////// INICIO NUEVO
    20:begin
         sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                                 ' WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+ Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND BM.CODIGOAREAOPERACIONODT= '''+parametrosconsulta[6]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                 ' ORDER BY FECHAINICIAL,HORA ';
       end;
    21:begin
         sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                                 ' WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+ Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND BM.CODIGOAREAOPERACIONODT= '''+parametrosconsulta[6]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                 ' AND M.CODIGOTIPOMANT= '''+parametrosconsulta[1]+''' '+
                                 ' ORDER BY FECHAINICIAL,HORA ';
       end;
     25:begin
          sql_AdministradorTareas:= 'SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                                    ' WHERE TO_CHAR(FECHAINICIAL,''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                                    ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                    ' AND BM.CODIGOAREAOPERACIONODT= '''+parametrosconsulta[6]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                    ' AND BM.CODIGOAMBITO = '''+parametrosconsulta[2]+''' ORDER BY FECHAINICIAL ';
        end;

     60:begin
          sql_AdministradorTareas:= 'SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                                    ' WHERE TO_CHAR(FECHAINICIAL,''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                                    ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                    ' AND BM.CODIGOAREAOPERACIONODT= '''+parametrosconsulta[6]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                    ' AND M.CODIGOSUBESTACION= '''+parametrosconsulta[4]+''' '+
                                    ' ORDER BY FECHAINICIAL ';
        end;
     30:begin
          sql_AdministradorTareas:= 'SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                                    ' WHERE TO_CHAR(FECHAINICIAL,''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                                    ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                    ' AND BM.CODIGOAREAOPERACIONODT= '''+parametrosconsulta[6]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                    ' AND M.CODIGOSUBESTACION= '''+parametrosconsulta[4]+''' '+
                                    ' BM.CODIGOELEMENTO = '''+parametrosconsulta[3]+''' '+
                                    ' ORDER BY FECHAINICIAL ';
        end;
     26:begin
          sql_AdministradorTareas:= 'SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                                    ' WHERE TO_CHAR(FECHAINICIAL,''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                                    ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                    ' AND BM.CODIGOAREAOPERACIONODT= '''+parametrosconsulta[6]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                    ' AND M.CODIGOTIPOMANT= '''+parametrosconsulta[1]+''' '+
                                    ' AND BM.CODIGOAMBITO = '''+parametrosconsulta[2]+''' ORDER BY FECHAINICIAL ';
        end;
      61:begin //era 66
           sql_AdministradorTareas:= 'SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                                    ' WHERE TO_CHAR(FECHAINICIAL,''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                                    ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                    ' AND BM.CODIGOAREAOPERACIONODT= '''+parametrosconsulta[6]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                    ' AND M.CODIGOTIPOMANT= '''+parametrosconsulta[1]+''' '+
                                    ' AND M.CODIGOSUBESTACION= '''+parametrosconsulta[4]+''' '+
                                    ' AND BM.CODIGOAMBITO = '''+parametrosconsulta[2]+''' ORDER BY FECHAINICIAL ';
        end;
     65:begin
          sql_AdministradorTareas:= 'SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                                    ' WHERE TO_CHAR(FECHAINICIAL,''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                                    ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                    ' AND BM.CODIGOAREAOPERACIONODT= '''+parametrosconsulta[6]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                    ' AND M.CODIGOSUBESTACION= '''+parametrosconsulta[4]+''' '+
                                    ' AND BM.CODIGOAMBITO = '''+parametrosconsulta[2]+''' ORDER BY FECHAINICIAL ';
        end;
     71:begin    //era 76
          sql_AdministradorTareas:= 'SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                                    ' WHERE TO_CHAR(FECHAINICIAL,''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                                    ' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                    ' AND BM.CODIGOAREAOPERACIONODT= '''+parametrosconsulta[6]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                    ' AND M.CODIGOSUBESTACION= '''+parametrosconsulta[4]+''' '+
                                    ' AND M.CODIGOTIPOMANT= '''+parametrosconsulta[1]+''' '+
                                    ' AND BM.CODIGOAMBITO = '''+parametrosconsulta[2]+''' ORDER BY FECHAINICIAL ';
        end;
     75:begin
          if Fcronograma.cbElemento.Text <> '' then
          begin
            qry1:= TQuery.Create(application);
            qry1.DatabaseName:= 'BaseDato';
            qry1.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
            qry1.ParamByName('CODIGOELEMENTO').asinteger:= Fcronograma.Elemento.KeyValue;
            qry1.Open;
            if qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1 then
            begin
              sql_AdministradorTareas:=' SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                                       ' WHERE TO_CHAR(FECHAINICIAL,''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                                       ' AND BM.CODIGOAREAOPERACIONODT= '''+parametrosconsulta[6]+''' '+
                                       ' AND M.CODIGOSUBESTACION = '''+parametrosconsulta[4]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                                       ' BM.CODIGOELEMENTO = '''+parametrosconsulta[3]+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND M.CODIGOTIPOMANT = '''+parametrosconsulta[1]+''' AND '+
                                       ' BM.CODIGOAMBITO = '''+parametrosconsulta[2]+''' '+
                                       ' EM.CLELEMENTO1 = '''+Fcronograma.codigo1.Items[Fcronograma.cbElemento.itemindex]+''' ORDER BY FECHAINICIAL ';
            end
            else
            begin
              if qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2 then
              begin
                sql_AdministradorTareas:=' SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                                         ' WHERE TO_CHAR(FECHAINICIAL,''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                                         ' AND M.CODIGOSUBESTACION = '''+parametrosconsulta[4]+''' AND M.CODIGOTIPOMANT = '''+parametrosconsulta[1]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                                         ' BM.CODIGOELEMENTO = '''+parametrosconsulta[3]+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO '+
                                         ' BM.CODIGOAMBITO = '''+parametrosconsulta[2]+''' '+
                                         ' AND BM.CODIGOAREAOPERACIONODT= '''+parametrosconsulta[6]+''' '+
                                         ' AND EM.CLELEMENTO1 = '''+Fcronograma.codigo1.Items[Fcronograma.cbElemento.itemindex]+''' AND EM.CLELEMENTO2 = '''+Fcronograma.codigo2.Items[Fcronograma.cbElemento.itemindex]+'''   ORDER BY FECHAINICIAL ';
              end;
            end;
          end
          else
          begin
            sql_AdministradorTareas:= ' SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                                      ' WHERE TO_CHAR(FECHAINICIAL,''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO ' +
                                      ' AND M.CODIGOSUBESTACION = '''+parametrosconsulta[4]+''' AND '+
                                      ' BM.CODIGOAMBITO = '''+parametrosconsulta[2]+''' '+
                                      ' AND BM.CODIGOAREAOPERACIONODT= '''+parametrosconsulta[6]+''' '+
                                      ' M.CODIGOTIPOMANT = '''+parametrosconsulta[1]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND BM.CODIGOELEMENTO = '''+parametrosconsulta[3]+''' ORDER BY FECHAINICIAL ';
          end;
        end;
    35:begin
         sql_AdministradorTareas:=' SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                                  ' WHERE TO_CHAR(FECHAINICIAL,''MMYYYY'')= '''+Year_Month+''' AND PM_TAREA.CODIGOTAREA = PM_MANTENIMIENTO.CODIGOMANTENIMIENTO ' +
                                  ' BM.CODIGOAMBITO = '''+parametrosconsulta[2]+''' '+
                                  ' AND BM.CODIGOAREAOPERACIONODT= '''+parametrosconsulta[6]+''' '+
                                  ' AND PM_MANTENIMIENTO.CODIGOBANCOMANTENIMIENTO = PM_BANCOMANTENIMIENTO.CODIGOBANCOMANTENIMIENTO AND PM_BANCOMANTENIMIENTO.CODIGOELEMENTO = '''+parametrosconsulta[3]+''' ORDER BY FECHAINICIAL ';
       end;
    ////////// FIN NUEVO
    1:begin
        sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T, PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                                 ' WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+ Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOTIPOMANT= '''+parametrosconsulta[1]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                 ' ORDER BY FECHAINICIAL,HORA ';
      end;

    6:begin
        sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                                  ' WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOTIPOMANT= '''+parametrosconsulta[1]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                  ' AND BM.CODIGOAMBITO = '''+parametrosconsulta[2]+''' ORDER BY FECHAINICIAL,HORA ';
      end;
   16:begin
        sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM'+
                                 ' WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOTIPOMANT= '''+parametrosconsulta[1]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                 ' AND BM.CODIGOAMBITO= '''+parametrosconsulta[2]+'''AND PM_BANCOMANTENIMIENTO.codigoelemento= '''+parametrosconsulta[3]+''' ORDER BY FECHAINICIAL,HORA ';

      end;
    5:begin
        sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                                 ' WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+
                                   Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                                 ' BM.CODIGOAMBITO= '''+parametrosconsulta[2]+''' ORDER BY FECHAINICIAL,HORA ';
      end;
   15:begin
        sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                                  ' WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+
                                    Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                  ' AND BM.CODIGOAMBITO= '''+parametrosconsulta[2]+'''AND BM.codigoelemento='''+parametrosconsulta[3]+''' ORDER BY FECHAINICIAL,HORA ';
        end;
   11:begin
        sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                                  ' WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+
                                    Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOTIPOMANT= '''+parametrosconsulta[1]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                                  ' BM.codigoelemento = '''+parametrosconsulta[3]+''' ORDER BY FECHAINICIAL,HORA ';
      end;
    10:begin
         sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                                    ' WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+
                                      Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                                    ' BM.codigoelemento = '''+parametrosconsulta[3]+''' ORDER BY FECHAINICIAL,HORA ';
       end;
     120:begin
           sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                                     ' WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+
                                       Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+parametrosconsulta[4]+''' AND M.CODIGOCIRCUITO = '''+parametrosconsulta[5]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO ORDER BY FECHAINICIAL,HORA ';

         end;
     130:begin
           if (FCronograma.cbElemento.Text <> '') then
           begin
              qry1:= TQuery.Create(application);
              qry1.DatabaseName:= 'BaseDato';
              qry1.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
              qry1.ParamByName('CODIGOELEMENTO').asinteger:=  FCronograma.Elemento.KeyValue;
              qry1.Open;
              if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) then
              //showmessage('consulta con elemento');
                sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,'+
                                         'PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+parametrosconsulta[4]+''' AND M.CODIGOCIRCUITO = '''+parametrosconsulta[5]+'''AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                         ' AND BM.codigoelemento= '''+parametrosconsulta[3]+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND EM.CLELEMENTO1 = '''+FCronograma.codigo1.Items[FCronograma.cbElemento.itemindex]+'''  ORDER BY FECHAINICIAL,HORA '
              else
                begin
                  if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) then
                    sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,'+
                                         'PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+parametrosconsulta[4]+''' AND M.CODIGOCIRCUITO = '''+parametrosconsulta[5]+'''AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                         ' AND BM.codigoelemento= '''+parametrosconsulta[3]+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND EM.CLELEMENTO1 = '''+FCronograma.codigo1.Items[FCronograma.cbElemento.itemindex]+''' AND EM.CLELEMENTO2 = '''+FCronograma.codigo2.Items[FCronograma.cbElemento.itemindex]+''' ORDER BY FECHAINICIAL,HORA ';
                end;
            end
          else
            begin
              sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,'+
                                       'BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+
                                        Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION= '''+parametrosconsulta[4]+''' AND M.CODIGOCIRCUITO= '''+parametrosconsulta[5]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO AND '+
                                       ' BM.codigoelemento= '''+parametrosconsulta[3]+''' ORDER BY FECHAINICIAL,HORA ';
            end;
         end;
     121:begin
           sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                                    ' WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+
                                      Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOTIPOMANT= '''+parametrosconsulta[1]+''' AND M.CODIGOSUBESTACION= '''+parametrosconsulta[4]+''' AND M.CODIGOCIRCUITO = '''+parametrosconsulta[5]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO ORDER BY FECHAINICIAL,HORA ';
         end;
     131:begin
           if (FCronograma.cbElemento.Text <> '') then
            begin
              qry1:= TQuery.Create(application);
              qry1.DatabaseName:= 'BaseDato';
              qry1.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
              qry1.ParamByName('CODIGOELEMENTO').asinteger:=  FCronograma.Elemento.KeyValue;
              qry1.Open;
              if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) then
              //showmessage('consulta con elemento');
                sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,'+
                                         'PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND '+
                                         'M.CODIGOSUBESTACION = '''+parametrosconsulta[4]+''' AND M.CODIGOCIRCUITO = '''+parametrosconsulta[5]+'''AND '+
                                         'M.CODIGOTIPOMANT= '''+parametrosconsulta[1]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                         'AND BM.codigoelemento= '''+parametrosconsulta[3]+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND EM.CLELEMENTO1 = '''+FCronograma.codigo1.Items[FCronograma.cbElemento.itemindex]+'''  ORDER BY FECHAINICIAL,HORA '
              else
                begin
                  if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) then
                    sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,'+
                                             'PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+parametrosconsulta[4]+''' AND M.CODIGOCIRCUITO = '''+parametrosconsulta[5]+'''AND '+
                                             'M.CODIGOTIPOMANT= '''+parametrosconsulta[1]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                             'AND BM.codigoelemento= '''+parametrosconsulta[3]+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND EM.CLELEMENTO1 = '''+FCronograma.codigo1.Items[FCronograma.cbElemento.itemindex]+''' AND EM.CLELEMENTO2 = '''+FCronograma.codigo2.Items[FCronograma.cbElemento.itemindex]+''' ORDER BY FECHAINICIAL,HORA ';
                end;
            end
           else
           begin
             //showmessage('consulta sin elemento');
             sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,'+
                                     'BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+
                                      Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOTIPOMANT= '''+parametrosconsulta[1]+'''AND M.CODIGOSUBESTACION= '''+parametrosconsulta[4]+''' AND M.CODIGOCIRCUITO= '''+parametrosconsulta[5]+''' AND M.CODIGOBANCOMANTENIMIENTO = M.CODIGOBANCOMANTENIMIENTO '+
                                     ' AND BM.codigoelemento= '''+parametrosconsulta[3]+''' ORDER BY FECHAINICIAL,HORA ';
           end;
         end;
     40:begin
          sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM '+
                                   'WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+
                                    Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+parametrosconsulta[4]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO ORDER BY FECHAINICIAL,HORA ';
        end;
     50:begin
          if (FCronograma.cbElemento.Text <> '') then
          begin
            qry1:= TQuery.Create(application);
            qry1.DatabaseName:= 'BaseDato';
            qry1.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
            qry1.ParamByName('CODIGOELEMENTO').asinteger:=  FCronograma.Elemento.KeyValue;
            qry1.Open;
            if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) then
            //showmessage('consulta con elemento');
              sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,'+
                                       'PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+parametrosconsulta[4]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                       ' AND BM.codigoelemento= '''+parametrosconsulta[3]+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND EM.CLELEMENTO1 = '''+FCronograma.codigo1.Items[FCronograma.cbElemento.itemindex]+'''  ORDER BY FECHAINICIAL,HORA '
            else
            begin
              if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) then
                sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,'+
                                     'PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+parametrosconsulta[4]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                     ' AND BM.codigoelemento= '''+parametrosconsulta[3]+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND EM.CLELEMENTO1 = '''+FCronograma.codigo1.Items[FCronograma.cbElemento.itemindex]+''' AND EM.CLELEMENTO2 = '''+FCronograma.codigo2.Items[FCronograma.cbElemento.itemindex]+''' ORDER BY FECHAINICIAL,HORA ';
            end;
          end
          else
          begin
            sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,'+
                                   'PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+parametrosconsulta[4]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                   ' AND BM.codigoelemento= '''+parametrosconsulta[3]+''' ORDER BY FECHAINICIAL,HORA ';
          end;
        end;
     41:begin
          sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,'+
                                    'PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+
                                     Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOTIPOMANT= '''+parametrosconsulta[1]+'''AND M.CODIGOSUBESTACION= '''+parametrosconsulta[4]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO ORDER BY FECHAINICIAL,HORA ';
        end;
     51:begin
          if (FCronograma.cbElemento.Text <> '') then
          begin
            qry1:= TQuery.Create(application);
            qry1.DatabaseName:= 'BaseDato';
            qry1.SQL.Append('select * from pm_elemento where codigoelemento =:codigoelemento');
            qry1.ParamByName('CODIGOELEMENTO').asinteger:=  FCronograma.Elemento.KeyValue;
            qry1.Open;
            if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) then
              //showmessage('consulta con elemento');
                sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,'+
                                         'PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+parametrosconsulta[4]+''' AND '+
                                         'M.CODIGOTIPOMANT= '''+parametrosconsulta[1]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                         'AND BM.codigoelemento= '''+parametrosconsulta[3]+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND EM.CLELEMENTO1 = '''+FCronograma.codigo1.Items[FCronograma.cbElemento.itemindex]+'''  ORDER BY FECHAINICIAL,HORA '
            else
            begin
              if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) then
                 sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,'+
                                          'PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+parametrosconsulta[4]+''' AND '+
                                          'M.CODIGOTIPOMANT= '''+parametrosconsulta[1]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                         ' AND BM.codigoelemento= '''+parametrosconsulta[3]+''' AND M.CODIGOMANTENIMIENTO = EM.CODIGOELEMENTOMANTENIMIENTO AND EM.CLELEMENTO1 = '''+FCronograma.codigo1.Items[FCronograma.cbElemento.itemindex]+''' AND EM.CLELEMENTO2 = '''+FCronograma.codigo2.Items[FCronograma.cbElemento.itemindex]+''' ORDER BY FECHAINICIAL,HORA ';
            end;
          end
          else
          begin
            sql_AdministradorTareas:='SELECT T.CODIGOTAREA,T.CODIGODESC,T.NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA,BM.CODIGOAREAOPERACIONODT FROM PM_TAREA T,'+
                                     'PM_MANTENIMIENTO M,PM_BANCOMANTENIMIENTO BM,PM_ELEMENTOMANTENIMIENTO EM WHERE TO_CHAR(FECHAINICIAL, ''MMYYYY'')= '''+Year_Month+''' AND T.CODIGOTAREA = M.CODIGOMANTENIMIENTO AND M.CODIGOSUBESTACION = '''+parametrosconsulta[4]+''' AND '+
                                     'M.CODIGOTIPOMANT= '''+parametrosconsulta[1]+''' AND M.CODIGOBANCOMANTENIMIENTO = BM.CODIGOBANCOMANTENIMIENTO '+
                                     ' AND BM.codigoelemento= '''+parametrosconsulta[3]+''' ORDER BY FECHAINICIAL,HORA ';
          end;
        end;
    end;
end;

procedure TAdministradorTareas.CrearActividades(Mes_Agno:String; Var ListaPanel:TList;valores: TParametros);
var
   Sql,NombreTarea,HoraTarea:String;
   Qry:TQuery;
   CodTarea:Real;
   FilaPanel,DiaTemp,ContadorFilas,odtopera:Integer;
begin
    // FilaPanel:=0;
     Year_Month:= Mes_Agno;
     DefinirConsultaAdministrador(valores);
     Qry:=TQuery.Create(Application);
     Qry.DatabaseName:='BaseDato';
     Qry.Sql.Clear;
     Sql:='SELECT CODIGOTAREA,NOMBRETAREA,TO_CHAR(FECHAINICIAL, ''DD'') AS DIA,TO_CHAR(FECHAINICIAL, ''HH24'') AS HORA FROM PM_TAREA WHERE TO_CHAR(FECHAINICIAL,''MMYYYY'')= '''+Mes_Agno+''' ORDER BY FECHAINICIAL,HORA ';
     //Qry.Sql.Add(Sql);
     Qry.SQL.Add(sql_AdministradorTareas);
     Qry.Open;
     If not Qry.IsEmpty then
      begin
        FilaPanel:= 0;
        DiaTemp:=Qry.FieldByName('DIA').AsInteger;
        New(PunteroPanel);
        PunteroPanel:= ListaPanel.Items[DiaTemp-1];
       end;

     while not Qry.Eof do
     Begin
       if DiaTemp = Qry.FieldByName('DIA').AsInteger then
       begin
         CodTarea:=Qry.FieldByName('CODIGOTAREA').AsFloat;
         NombreTarea:=Qry.FieldByName('NOMBRETAREA').AsString;
         HoraTarea:=Qry.FieldByName('HORA').AsString;
         odtopera:= Qry.fieldbyname('CODIGOAREAOPERACIONODT').asinteger;
         CrearIdTarea:=TIdTarea.Crear(PunteroPanel^.Panel,FilaPanel,odtopera,CodTarea,NombreTarea,HoraTarea);
         FilaPanel:=FilaPanel+1;
       end
       else
       begin
         //ListaPanel.Items[DiaTemp-1]:= PunteroPanel;
         DiaTemp:= Qry.FieldByName('DIA').AsInteger;
         CodTarea:=Qry.FieldByName('CODIGOTAREA').AsFloat;
         NombreTarea:=Qry.FieldByName('NOMBRETAREA').AsString;
         HoraTarea:=Qry.FieldByName('HORA').AsString;
         odtopera:= Qry.fieldbyname('CODIGOAREAOPERACIONODT').asinteger;
         PunteroPanel:= ListaPanel.Items[DiaTemp-1];
         FilaPanel:= 0;
         CrearIdTarea:=TIdTarea.Crear(PunteroPanel^.Panel,FilaPanel,odtopera,CodTarea,NombreTarea,HoraTarea);
         FilaPanel:= FilaPanel+1;
        end;
       Qry.Next;
      end;
     Qry.Close;
end;
//******************************************************************************
procedure TAdministradorTareas.CrearMantenimiento;
begin
     Mantenimiento:=TFMantenimiento.Create(nil);
     Mantenimiento.Show;
end;
//******************************************************************************
destructor TAdministradorTareas.DestruirAdministrador;
begin
end;
//******************************************************************************
end.
