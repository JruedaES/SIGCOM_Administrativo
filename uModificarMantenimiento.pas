unit uModificarMantenimiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ExtCtrls, ComCtrls, StdCtrls, Buttons, DBCtrls, Db,
  DBTables, Mask, Digisoft, UtdNavigator, Menus, RXDBCtrl,comObj;

type
  TfModificarMantenimiento = class(TForm)
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    Label1: TLabel;
    PanelSuperior: TPanel;
    Panel1: TPanel;
    sbProgramar: TSpeedButton;
    Panel8: TPanel;
    Panel9: TPanel;
    SBSalir: TSpeedButton;
    SBImprimir: TSpeedButton;
    bFiltrar: TSpeedButton;
    SBBuscar: TSpeedButton;
    SBOrdenar: TSpeedButton;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel1: TBevel;
    sbExportar: TSpeedButton;
    Bevel4: TBevel;
    qMantenimientos: TQuery;
    qMantenimientosCODIGOTAREA: TFloatField;
    qMantenimientosFECHAINICIAL: TDateTimeField;
    qMantenimientosFECHAFINAL: TDateTimeField;
    qMantenimientosNOMBRETAREA: TStringField;
    qMantenimientosCODIGOMANTENIMIENTO: TFloatField;
    qMantenimientosCODIGOTIPOMANT: TFloatField;
    qMantenimientosNOMBREMANT: TStringField;
    qMantenimientosNOMBRETIPOELEMENTO: TStringField;
    qMantenimientosNOMBRESUBESTACION: TStringField;
    qMantenimientosTENSION: TFloatField;
    qMantenimientosNOMBREESTADO: TStringField;
    qMantenimientoselemento: TStringField;
    qMantenimientosCODIGOELEMENTO: TFloatField;
    dsMantenimientos: TDataSource;
    qMantenimientosNOMBREAREAOPERACIONODT: TStringField;
    qElementoMtto: TQuery;
    qElementoMttoCODIGOELEMENTOMANTENIMIENTO: TFloatField;
    qElementoMttoCLELEMENTO1: TStringField;
    qElementoMttoCLELEMENTO2: TStringField;
    qElementoMttoCODIGOELEMENTO: TFloatField;
    pmOrdenar: TPopupMenu;
    CodigoMtto: TMenuItem;
    NombreMantenimiento: TMenuItem;
    TipoMantenimiento: TMenuItem;
    Coordinacion: TMenuItem;
    N1: TMenuItem;
    FechaInicialMtto: TMenuItem;
    FechaFinalMtto: TMenuItem;
    N3: TMenuItem;
    TipoElemento: TMenuItem;
    Tension: TMenuItem;
    Subestacion: TMenuItem;
    RxDBGConsultaMtto: TRxDBGrid;
    Memo2: TMemo;
    sbRefrescar: TSpeedButton;
    Bevel5: TBevel;
    procedure FormShow(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure qMantenimientos11CalcFields(DataSet: TDataSet);
//    procedure Button1Click(Sender: TObject);
    procedure SBSalirClick(Sender: TObject);
    procedure bFiltrarClick(Sender: TObject);
    procedure qMantenimientosCalcFields(DataSet: TDataSet);
    procedure SBOrdenarClick(Sender: TObject);
    procedure CodigoMttoClick(Sender: TObject);
    procedure NombreMantenimientoClick(Sender: TObject);
    procedure RxDBGConsultaMttoDblClick(Sender: TObject);
    procedure TipoMantenimientoClick(Sender: TObject);
    procedure CoordinacionClick(Sender: TObject);
    procedure FechaInicialMttoClick(Sender: TObject);
    procedure FechaFinalMttoClick(Sender: TObject);
{    procedure EstadoMttoClick(Sender: TObject);}
    procedure TipoElementoClick(Sender: TObject);
    procedure TensionClick(Sender: TObject);
    procedure SubestacionClick(Sender: TObject);
{    procedure ElementoClick(Sender: TObject);}
    procedure sbRefrescarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
    procedure sbExportarClick(Sender: TObject);
  private
    { Private declarations }
    ListaDireccionCampos:TStringList;
    Year, Month, Day, Hour, Min, Sec, MSec: Word;
    Present: TDateTime;
  public
    { Public declarations }
    sCriterio : String;
    fechaelemento:Tdate;
    sqlmantenimiento,FechaConsulta:string;
    FechaCalendario:TDate;
    DiaActual,MesActual,YearActual:word;
    procedure consultarelemento(codigotipoelemento:string);
    procedure Ordenar(sCriterio:String);
  end;

var
  fModificarMantenimiento: TfModificarMantenimiento;

implementation

uses UMantenimiento, ufiltroConsultasMantenimiento, uBusquedaMtto;

{$R *.DFM}

{
procedure TfModificarMantenimiento.CalendarioChange(Sender: TObject);
var DiaCalendario,MesCalendario,YearCalendario:word;
begin
  if qMantenimiento.Active then
      qMantenimiento.Close;
  qMantenimiento.SQL.Clear;
  sqlmantenimiento:= ' select t.codigotarea,t.FECHAINICIAL,t.NOMBRETAREA,m.codigosubestacion,m.codigocircuito,bm.codigoambito,tm.nombremant,ab.nombreambito,em.CLELEMENTO1,em.CLELEMENTO2 '+
                       ' from pm_tarea t,pm_mantenimiento m,pm_bancomantenimiento bm,pm_elementomantenimiento em,pm_tipomantenimiento tm,pm_ambito ab '+
                       ' where to_char(t.fechainicial,''dd/mm/yyyy'')=to_char(:fechaProgramacion,''dd/mm/yyyy'') and t.codigoestadotarea = 4 and t.codigotarea = m.codigomantenimiento and '+
                       ' m.codigotipomant = tm.CODIGOTIPOMANT and m.CODIGOBANCOMANTENIMIENTO = bm.CODIGOBANCOMANTENIMIENTO and '+
                       ' em.CODIGOELEMENTOMANTENIMIENTO = m.CODIGOMANTENIMIENTO and bm.CODIGOAMBITO = ab.CODIGOAMBITO ';

  if  (cbAmbito.Checked) and (Ambito.Text <> '') then
    begin
      case Ambito.KeyValue of
        1:begin
            if (Subestacion.Text <> '') then
              begin
                if (cbElemento.Checked) and (Elemento.Text <> '') then
                  sqlmantenimiento:= sqlmantenimiento + ' and m.codigosubestacion = '''+vartostr(Subestacion.keyvalue)+''' and bm.codigoelemento = '''+vartostr(Elemento.KeyValue)+''' '
                else
                  sqlmantenimiento:= sqlmantenimiento + ' and m.codigosubestacion = '''+vartostr(Subestacion.keyvalue)+''' ';
              end
            else
              sqlmantenimiento:= sqlmantenimiento + ' and bm.codigoambito = '''+vartostr(Ambito.keyvalue)+''' ';

          end;
        2:begin
            if (Circuito.Text <> '') then
              begin
                if (cbElemento.Checked) and (Elemento.Text <> '') then
                  sqlmantenimiento:= sqlmantenimiento + ' and m.codigocircuito = '''+vartostr(circuito.keyvalue)+''' and bm.codigoelemento = '''+vartostr(Elemento.KeyValue)+''' '
                else
                  sqlmantenimiento:= sqlmantenimiento + ' and m.codigocircuito = '''+vartostr(circuito.keyvalue)+''' ';
              end
            else
              sqlmantenimiento:= sqlmantenimiento + ' and m.codigocircuito = '''+vartostr(Subestacion.keyvalue)+''' ';
          end;
      end;
    end;
  if (TipoMantenimiento.Text <> '') then
    sqlmantenimiento:= sqlmantenimiento + ' and m.codigotipomant = '''+vartostr(TipoMantenimiento.keyvalue)+''' ';
  qMantenimiento.SQL.Append(sqlmantenimiento);
  qMantenimiento.Open;
end;       }

{
procedure TfModificarMantenimiento.ElementoClick(Sender: TObject);
begin
  if qMantenimiento.Active then
    qMantenimiento.Close;
  qMantenimiento.SQL.Clear;
  sqlmantenimiento:= ' select t.codigotarea,t.FECHAINICIAL,t.NOMBRETAREA,m.codigosubestacion,m.codigocircuito,bm.codigoambito,tm.nombremant,ab.nombreambito,em.CLELEMENTO1,em.CLELEMENTO2 '+
                         ' from pm_tarea t,pm_mantenimiento m,pm_bancomantenimiento bm,pm_elementomantenimiento em,pm_tipomantenimiento tm,pm_ambito ab '+
                         ' where to_char(t.fechainicial,''dd/mm/yyyy'')=to_char(:fechaProgramacion,''dd/mm/yyyy'') and t.codigoestadotarea = 4 and t.codigotarea = m.codigomantenimiento and '+
                         ' m.codigotipomant = tm.CODIGOTIPOMANT and m.CODIGOBANCOMANTENIMIENTO = bm.CODIGOBANCOMANTENIMIENTO and '+
                         ' em.CODIGOELEMENTOMANTENIMIENTO = m.CODIGOMANTENIMIENTO and bm.CODIGOAMBITO = ab.CODIGOAMBITO ';

  sqlmantenimiento:=  sqlmantenimiento + ' and bm.codigoelemento = '''+vartostr(Elemento.keyvalue)+''' ';
  case Ambito.KeyValue of
    1:begin
        if (Subestacion.Text <> '') then
          sqlmantenimiento:= sqlmantenimiento + ' and m.codigosubestacion = '''+vartostr(Subestacion.keyvalue)+''' '
        else
          sqlmantenimiento:= sqlmantenimiento + ' and bm.codigoambito = '''+vartostr(Ambito.keyvalue)+''' ';
      end;
    2:begin
        if (Circuito.Text <> '') then
          sqlmantenimiento:= sqlmantenimiento + ' and m.codigocircuito = '''+vartostr(Circuito.KeyValue)+''' '
        else
          sqlmantenimiento:= sqlmantenimiento + ' and bm.codigoambito = '''+vartostr(Ambito.keyvalue)+''' ';
      end;
  end;
  if (TipoMantenimiento.Text <> '') then
    sqlmantenimiento:= sqlmantenimiento + ' and m.codigotipomant = '''+vartostr(TipoMantenimiento.keyvalue)+''' ';
  qMantenimiento.SQL.Append(sqlmantenimiento);
  qMantenimiento.Open;
end;           }

{
procedure TfModificarMantenimiento.TipoMantenimientoClick(Sender: TObject);
begin
  sqlmantenimiento:= ' select t.codigotarea,t.FECHAINICIAL,t.NOMBRETAREA,m.codigosubestacion,m.codigocircuito,bm.codigoambito,tm.nombremant,ab.nombreambito,em.CLELEMENTO1,em.CLELEMENTO2 '+
                         ' from pm_tarea t,pm_mantenimiento m,pm_bancomantenimiento bm,pm_elementomantenimiento em,pm_tipomantenimiento tm,pm_ambito ab '+
                         ' where to_char(t.fechainicial,''dd/mm/yyyy'')=to_char(:fechaProgramacion,''dd/mm/yyyy'') and t.codigoestadotarea = 4 and t.codigotarea = m.codigomantenimiento and '+
                         ' m.codigotipomant = tm.CODIGOTIPOMANT and m.CODIGOBANCOMANTENIMIENTO = bm.CODIGOBANCOMANTENIMIENTO and '+
                         ' em.CODIGOELEMENTOMANTENIMIENTO = m.CODIGOMANTENIMIENTO and bm.CODIGOAMBITO = ab.CODIGOAMBITO ';
  if qMantenimiento.Active then
    qMantenimiento.Close;
  qMantenimiento.SQL.Clear;
  sqlmantenimiento:= sqlmantenimiento + ' and m.codigotipomant = '''+vartostr(TipoMantenimiento.keyvalue)+''' ';
  if  (cbAmbito.Checked) and (Ambito.Text <> '') then
    begin
      case Ambito.KeyValue of
         1:begin
             if (Subestacion.Text <> '') then
               begin
                 if (cbElemento.Checked) and (Elemento.Text <> '') then
                   sqlmantenimiento:= sqlmantenimiento + ' and m.codigosubestacion = '''+vartostr(Subestacion.keyvalue)+''' and bm.codigoelemento = '''+vartostr(Elemento.KeyValue)+''' '
                 else
                    sqlmantenimiento:= sqlmantenimiento + ' and m.codigosubestacion = '''+vartostr(Subestacion.keyvalue)+''' ';
               end
              else
                sqlmantenimiento:= sqlmantenimiento + ' and bm.codigoambito = '''+vartostr(Ambito.keyvalue)+''' ';
           end;
         2:begin
             if (Circuito.Text <> '') then
               begin
                 if (cbElemento.Checked) and (Elemento.Text <> '') then
                   sqlmantenimiento:= sqlmantenimiento + ' and m.codigocircuito = '''+vartostr(circuito.keyvalue)+''' and bm.codigoelemento = '''+vartostr(Elemento.KeyValue)+''' '
                 else
                   sqlmantenimiento:= sqlmantenimiento + ' and m.codigocircuito = '''+vartostr(circuito.keyvalue)+''' ';
               end
             else
               sqlmantenimiento:= sqlmantenimiento + ' and bm.codigoambito = '''+vartostr(Ambito.keyvalue)+''' ';
           end;
      end;
    end;
  qMantenimiento.SQL.Append(sqlmantenimiento);
  qMantenimiento.Open;
end;      }

{
procedure TfModificarMantenimiento.AmbitoClick(Sender: TObject);
begin
  if qMantenimiento.Active then
    qMantenimiento.Close;
  qMantenimiento.SQL.Clear;
  sqlmantenimiento:= ' select t.codigotarea,t.FECHAINICIAL,t.NOMBRETAREA,m.codigosubestacion,m.codigocircuito,bm.codigoambito,tm.nombremant,ab.nombreambito,em.CLELEMENTO1,em.CLELEMENTO2 '+
                     ' from pm_tarea t,pm_mantenimiento m,pm_bancomantenimiento bm,pm_elementomantenimiento em,pm_tipomantenimiento tm,pm_ambito ab '+
                     ' where to_char(t.fechainicial,''dd/mm/yyyy'')=to_char(:fechaProgramacion,''dd/mm/yyyy'') and  t.CODIGOESTADOTAREA = 4 and t.codigotarea = m.codigomantenimiento and '+
                     ' m.codigotipomant = tm.CODIGOTIPOMANT and m.CODIGOBANCOMANTENIMIENTO = bm.CODIGOBANCOMANTENIMIENTO and '+
                     ' em.CODIGOELEMENTOMANTENIMIENTO = m.CODIGOMANTENIMIENTO and bm.CODIGOAMBITO = ab.CODIGOAMBITO ';
  sqlmantenimiento:= sqlmantenimiento + ' and bm.codigoambito = '''+vartostr(Ambito.keyvalue)+''' ';
  case Ambito.KeyValue of
    1:begin
        if not (cbElemento.Enabled) then
          cbElemento.Enabled:= true;
        if qSubestacion.Active then
          qSubestacion.Close;
        qSubestacion.Open;
        if qElemento.Active then
          qElemento.Close;
        qElemento.ParamByName('CODIGOAMBITO').asinteger:= Ambito.KeyValue;
        qElemento.Open;
        Elemento.KeyValue:= 0;
        if (Subestacion.Visible) and (Subestacion.Text <> '') then
          Subestacion.KeyValue:='';
        if (ContenedorAmbito.Height = PLugar.Height + (PanelAmbito.Height + 5)) or (ContenedorAmbito.Height = (PLugar.Height + (PanelAmbito.Height + 5)) + (PanelSubestacion.Height + 5) + (PanelCircuito.Height + 5)) then
          begin
            if PanelSubestacion.Visible = false then
              PanelSubestacion.Visible:= true;
            if Subestacion.Visible = false then
              Subestacion.Visible:= true;
            if PanelCircuito.Visible = true then
              PanelCircuito.Visible:= false;
            if (Circuito.Visible) then
              begin
                qCircuito.Close;
                Circuito.KeyValue:='';
                Circuito.Visible:= false;
              end;
            ContenedorAmbito.Height:= (PLugar.Height + (PanelAmbito.Height + 5)) + (PanelSubestacion.Height + 5)
          end;
      end;
    2:begin
        if not (cbElemento.Enabled) then
          cbElemento.Enabled:= true;
        if qSubestacion.Active then
          qSubestacion.Close;
        qSubestacion.Open;
        if qElemento.Active then
          qElemento.Close;
        qElemento.ParamByName('CODIGOAMBITO').asinteger:= Ambito.KeyValue;
        qElemento.Open;
        Elemento.KeyValue:= 0;
        if (Subestacion.Visible) and (Subestacion.Text <> '') then
          Subestacion.KeyValue:='';
        if (Circuito.Visible) and (Circuito.Text <> '')  then
          begin
            qCircuito.Close;
            Circuito.KeyValue:='';
            Circuito.Visible:= false;
          end;
        if (ContenedorAmbito.Height = PLugar.Height + (PanelAmbito.Height + 5)) or (ContenedorAmbito.Height = (PLugar.Height + (PanelAmbito.Height + 5)) + (PanelSubestacion.Height + 5)) then
          begin
            if PanelSubestacion.Visible = false then
              PanelSubestacion.Visible:= true;
            if Subestacion.Visible = false then
              begin
                Subestacion.Visible:= true;
                Subestacion.KeyValue:= true;
              end;
            if PanelCircuito.Visible = false then
              PanelCircuito.Visible:= true;
            if Circuito.Visible = false then
              begin
                Circuito.Visible:= true;
                Circuito.KeyValue:='';
              end;
            ContenedorAmbito.Height:= (PLugar.Height + (PanelAmbito.Height + 5)) + ((PanelSubestacion.Height + 5) + (PanelCircuito.Height + 5));
          end;
      end;
  end;
  if (cbTipoMantenimiento.Checked) and (TipoMantenimiento.Text <> '')  then
    sqlmantenimiento:= sqlmantenimiento + ' and bm.codigotipomant = '''+vartostr(TipoMantenimiento.keyvalue)+''' ';
  if MesActual < 10 then
    FechaConsulta:= '0'+ inttostr(MesActual)
  else
    FechaConsulta:= inttostr(MesActual);
  FechaConsulta:= FechaConsulta + inttostr(YearActual);
  qMantenimiento.SQL.Append(sqlmantenimiento);
  qMantenimiento.Open;
end;   }

{
procedure TfModificarMantenimiento.cbFechaClick(Sender: TObject);
begin
  PFecha.Visible:= cbFecha.Checked;
  DBEFecha.Visible:=cbFecha.Checked;
  ContenedorFecha.Height:= PFecha.Height + (PanelFecha.Height + 5);
  if (cbFecha.Checked = false) then
  begin
    ContenedorFecha.Height:= (PanelFecha.Height + 2);
    DBEFecha.Visible:= False;
    PFecha.Visible:= false;
  end;
end;  }

{
procedure TfModificarMantenimiento.cbElementoClick(Sender: TObject);
begin
  Elemento.Enabled:=true;
  PElemento.Visible:= cbElemento.Checked;
  Elemento.Visible:= cbElemento.Checked;
  Elemento.KeyValue:= 0;
  ContenedorElemento.Height:= PElemento.Height + (PanelElemento.Height + 5);
  if (cbElemento.Checked = false) then
  begin
    PElemento.Visible:= false;
    Elemento.Visible:= false;
    ContenedorElemento.Height:= (PanelElemento.Height + 2);
    if qMantenimiento.Active then
      qMantenimiento.Close;
    qMantenimiento.SQL.Clear;
    sqlmantenimiento:= ' select t.codigotarea,t.FECHAINICIAL,t.NOMBRETAREA,m.codigosubestacion,m.codigocircuito,'+
                       ' bm.codigoambito,tm.nombremant,ab.nombreambito,em.CLELEMENTO1,em.CLELEMENTO2'+
                       ' from pm_tarea t,pm_mantenimiento m,pm_bancomantenimiento bm,pm_elementomantenimiento em,'+
                       ' pm_tipomantenimiento tm,pm_ambito ab where to_char(t.fechainicial,''dd/mm/yyyy'')=to_char(:fechaProgramacion,''dd/mm/yyyy'') and'+
                       ' t.codigoestadotarea = 4 and t.codigotarea = m.codigomantenimiento and'+
                       ' m.codigotipomant = tm.CODIGOTIPOMANT and m.CODIGOBANCOMANTENIMIENTO = bm.CODIGOBANCOMANTENIMIENTO'+
                       ' and em.CODIGOELEMENTOMANTENIMIENTO = m.CODIGOMANTENIMIENTO and'+
                       ' bm.CODIGOAMBITO = ab.CODIGOAMBITO';

    if (cbAmbito.Checked) and (Ambito.Text <> '') then
      begin
        case (Ambito.KeyValue) of
          1:begin
              if (Subestacion.Text <> '') then
                sqlmantenimiento:= sqlmantenimiento + ' and m.codigosubestacion = '''+vartostr(Subestacion.keyvalue)+''' '
              else
                sqlmantenimiento:= sqlmantenimiento + ' and bm.codigoambito = '''+vartostr(Ambito.keyvalue)+''' ';
            end;
          2:begin
              if (Circuito.Text <> '')  then
                sqlmantenimiento:= sqlmantenimiento + ' and m.codigocircuito = '''+vartostr(Circuito.keyvalue)+''' '
              else
                sqlmantenimiento:= sqlmantenimiento + ' and bm.codigoambito = '''+vartostr(Ambito.keyvalue)+''' ';
            end;
        end;
      end;
    if (cbTipoMantenimiento.Checked) and (TipoMantenimiento.Text <> '') then
      sqlmantenimiento:= sqlmantenimiento + ' and m.codigotipomant = '''+vartostr(TipoMantenimiento.keyvalue)+''' ';
    qMantenimiento.SQL.Append(sqlmantenimiento);
    qMantenimiento.Open;
  end;
end;       }

{
procedure TfModificarMantenimiento.cbTipoMantenimientoClick(
  Sender: TObject);
begin
  PTipoMantenimiento.Visible:= cbTipoMantenimiento.Checked;
  TipoMantenimiento.Visible:= cbTipoMantenimiento.Checked;
  ContenedorTipoMantenimiento.Height:= PTipoMantenimiento.Height + (PanelTipoMantenimiento.Height + 5);
  TipoMantenimiento.KeyValue:=0;
  if (cbTipoMantenimiento.Checked = false) then
  begin
    PTipoMantenimiento.Visible:= false;
    TipoMantenimiento.visible:= false;
    ContenedorTipoMantenimiento.Height:= PanelTipoMantenimiento.Height + 2;
    if qMantenimiento.Active then
      qMantenimiento.Close;
    qMantenimiento.SQL.Clear;
    sqlmantenimiento:= ' select t.codigotarea,t.FECHAINICIAL,t.NOMBRETAREA,m.codigosubestacion,m.codigocircuito,'+
                       ' bm.codigoambito,tm.nombremant,ab.nombreambito,em.CLELEMENTO1,em.CLELEMENTO2'+
                       ' from pm_tarea t,pm_mantenimiento m,pm_bancomantenimiento bm,pm_elementomantenimiento em,'+
                       ' pm_tipomantenimiento tm,pm_ambito ab where to_char(t.fechainicial,''dd/mm/yyyy'')=to_char(:fechaProgramacion,''dd/mm/yyyy'') and'+
                       ' t.codigoestadotarea = 4 and t.codigotarea = m.codigomantenimiento and'+
                       ' m.codigotipomant = tm.CODIGOTIPOMANT and m.CODIGOBANCOMANTENIMIENTO = bm.CODIGOBANCOMANTENIMIENTO'+
                       ' and em.CODIGOELEMENTOMANTENIMIENTO = m.CODIGOMANTENIMIENTO and'+
                       ' bm.CODIGOAMBITO = ab.CODIGOAMBITO';

    if (cbAmbito.Checked) and (Ambito.Text <> '' ) then
      begin
        if (cbElemento.Checked) and (Elemento.Text <> '') then
          sqlmantenimiento:= sqlmantenimiento + ' and bm.codigoelemento = '''+vartostr(Elemento.keyvalue)+''' ';
        case (Ambito.KeyValue) of
          1:begin
              if (Subestacion.Text <> '')  then
                sqlmantenimiento:= sqlmantenimiento + ' and m.codigosubestacion = '''+vartostr(Subestacion.KeyValue)+''' '
              else
                sqlmantenimiento:= sqlmantenimiento + ' and bm.codigoambito = '''+vartostr(Ambito.keyvalue)+''' ';
            end;
          2:begin
              if (Circuito.Text <> '')  then
                sqlmantenimiento:= sqlmantenimiento + ' and m.codigocircuito = '''+vartostr(Circuito.KeyValue)+''' '
              else
                sqlmantenimiento:= sqlmantenimiento + ' and bm.codigoambito = '''+vartostr(Ambito.keyvalue)+''' ';
            end;
        end;
      end;
    qMantenimiento.SQL.Append(sqlmantenimiento);
    qMantenimiento.Open;
  end;
end;     }

{
procedure TfModificarMantenimiento.cbAmbitoClick(Sender: TObject);
begin
  PLugar.Visible:= cbAmbito.Checked;
  Ambito.Visible:= cbAmbito.Checked;
  Ambito.KeyValue:=0;
  ContenedorAmbito.Height:= PLugar.Height + (PanelAmbito.Height + 5);
  if (cbAmbito.Checked = false) then
    begin
      PLugar.Visible:= false;
      Ambito.Visible:= false;
      ContenedorAmbito.Height:= (PanelTipoMantenimiento.Height + 2);
      if cbElemento.Checked then
        cbElemento.Checked:= false;
      if cbElemento.Enabled then
        cbElemento.Enabled:= false;
      if qMantenimiento.Active then
        qMantenimiento.Close;
      qMantenimiento.SQL.Clear;
      sqlmantenimiento:= ' select t.codigotarea,t.FECHAINICIAL,t.NOMBRETAREA,m.codigosubestacion,m.codigocircuito,'+
                         ' bm.codigoambito,tm.nombremant,ab.nombreambito,em.CLELEMENTO1,em.CLELEMENTO2'+
                         ' from pm_tarea t,pm_mantenimiento m,pm_bancomantenimiento bm,pm_elementomantenimiento em,'+
                         ' pm_tipomantenimiento tm,pm_ambito ab where to_char(t.fechainicial,''dd/mm/yyyy'')=to_char(:fechaProgramacion,''dd/mm/yyyy'') and'+
                         ' t.codigoestadotarea = 4 and t.codigotarea = m.codigomantenimiento and'+
                         ' m.codigotipomant = tm.CODIGOTIPOMANT and m.CODIGOBANCOMANTENIMIENTO = bm.CODIGOBANCOMANTENIMIENTO'+
                         ' and em.CODIGOELEMENTOMANTENIMIENTO = m.CODIGOMANTENIMIENTO and'+
                         ' bm.CODIGOAMBITO = ab.CODIGOAMBITO';
      if (cbTipoMantenimiento.Checked) and (TipoMantenimiento.Text <> '') then
        sqlmantenimiento:= sqlmantenimiento + ' and bm.codigotipomant = '''+vartostr(TipoMantenimiento.keyvalue)+''' ';
      qMantenimiento.SQL.Append(sqlmantenimiento);
      qMantenimiento.Open;
    end;
end;       }

{
procedure TfModificarMantenimiento.SubestacionClick(Sender: TObject);
begin
  if qMantenimiento.Active then
    qMantenimiento.Close;
  qMantenimiento.SQL.Clear;
  sqlmantenimiento:= ' select t.codigotarea,t.FECHAINICIAL,t.NOMBRETAREA,m.codigosubestacion,m.codigocircuito,'+
                         ' bm.codigoambito,tm.nombremant,ab.nombreambito,em.CLELEMENTO1,em.CLELEMENTO2'+
                         ' from pm_tarea t,pm_mantenimiento m,pm_bancomantenimiento bm,pm_elementomantenimiento em,'+
                         ' pm_tipomantenimiento tm,pm_ambito ab where to_char(t.fechainicial,''dd/mm/yyyy'')=to_char(:fechaProgramacion,''dd/mm/yyyy'') and'+
                         ' t.codigoestadotarea = 4 and t.codigotarea = m.codigomantenimiento and'+
                         ' m.codigotipomant = tm.CODIGOTIPOMANT and m.CODIGOBANCOMANTENIMIENTO = bm.CODIGOBANCOMANTENIMIENTO'+
                         ' and em.CODIGOELEMENTOMANTENIMIENTO = m.CODIGOMANTENIMIENTO and'+
                         ' bm.CODIGOAMBITO = ab.CODIGOAMBITO';
  case (Ambito.KeyValue) of
    1:begin
        sqlmantenimiento:= sqlmantenimiento + ' and m.codigosubestacion = '''+vartostr(Subestacion.keyvalue)+''' ';
        if (cbTipoMantenimiento.Checked) and (TipoMantenimiento.Text <> '') then
          sqlmantenimiento:= sqlmantenimiento + ' and m.codigotipomant = '''+vartostr(TipoMantenimiento.keyvalue)+''' ';
        if (cbElemento.Checked) and (Elemento.Text <> '') then
          sqlmantenimiento:= sqlmantenimiento + ' and bm.codigoelemento = '''+vartostr(Elemento.keyvalue)+''' ';
        qMantenimiento.SQL.Append(sqlmantenimiento);
        qMantenimiento.Open;
      end;
    2:begin
        if qCircuito.Active then
          qCircuito.Close;
        qCircuito.ParamByName('CODIGOSUBESTACION').asstring:= Subestacion.keyvalue;
        qCircuito.Open;
      end;
  end;
end;     }

procedure TfModificarMantenimiento.FormShow(Sender: TObject);
begin
//  tdMemTable1.Open;
//  tdMemTable1.Insert;
{  if qElemento.Active then
    qElemento.Close;
  if qCircuito.Active then
    qCircuito.Close;
  if qTipoMantenimiento.Active then
    qTipoMantenimiento.Close;
  qTipoMantenimiento.Open;
  }
{  if cbElemento.Enabled then
    cbElemento.Enabled:= false;}
{  if qSubestacion.Active then
    qSubestacion.Close;
  qSubestacion.Open;
  if qAmbito.Active then
    qAmbito.Close;
  qAmbito.Open;}
end;

{
procedure TfModificarMantenimiento.CircuitoClick(Sender: TObject);
begin
  if qMantenimiento.Active then
    qMantenimiento.Close;
  qMantenimiento.SQL.Clear;
  sqlmantenimiento:= ' select t.codigotarea,t.FECHAINICIAL,t.NOMBRETAREA,m.codigosubestacion,m.codigocircuito,'+
                         ' bm.codigoambito,tm.nombremant,ab.nombreambito,em.CLELEMENTO1,em.CLELEMENTO2'+
                         ' from pm_tarea t,pm_mantenimiento m,pm_bancomantenimiento bm,pm_elementomantenimiento em,'+
                         ' pm_tipomantenimiento tm,pm_ambito ab where to_char(t.fechainicial,''dd/mm/yyyy'')=to_char(:fechaProgramacion,''dd/mm/yyyy'') and'+
                         ' t.codigoestadotarea = 4 and t.codigotarea = m.codigomantenimiento and'+
                         ' m.codigotipomant = tm.CODIGOTIPOMANT and m.CODIGOBANCOMANTENIMIENTO = bm.CODIGOBANCOMANTENIMIENTO'+
                         ' and em.CODIGOELEMENTOMANTENIMIENTO = m.CODIGOMANTENIMIENTO and'+
                         ' bm.CODIGOAMBITO = ab.CODIGOAMBITO';

  sqlmantenimiento:= sqlmantenimiento + ' and m.codigocircuito = '''+vartostr(Circuito.keyvalue)+''' ';
  if (cbTipoMantenimiento.Checked) and (TipoMantenimiento.Text <> '') then
    sqlmantenimiento:= sqlmantenimiento + ' and m.codigotipomant = '''+vartostr(TipoMantenimiento.keyvalue)+''' ';
  if (cbElemento.Checked) and (Elemento.Text <> '') then
    sqlmantenimiento:= sqlmantenimiento + ' and bm.codigoelemento = '''+vartostr(Elemento.keyvalue)+''' ';
  qMantenimiento.SQL.Append(sqlmantenimiento);
  qMantenimiento.Open;
end;   }

procedure TfModificarMantenimiento.RxDBGConsultaMttoDblClick(Sender: TObject);
begin
  if (qMantenimientos.FieldByName('CODIGOTAREA').asstring <> '') then
  begin
    FMantenimiento:= TFMantenimiento.editar(nil,qMantenimientos.fieldbyname('CODIGOTAREA').asfloat,1);
    FMantenimiento.edicionMtto:=true;
    FMantenimiento.ShowModal;
    FMantenimiento.Free;
  end;
end;

procedure TfModificarMantenimiento.SpeedButton5Click(Sender: TObject);
begin
  fModificarMantenimiento.ModalResult:= mrOk;
end;

procedure TfModificarMantenimiento.qMantenimientos11CalcFields(
  DataSet: TDataSet);
var qry1,qry2,qrycto,qrysub:Tquery;
    sqlmtto,sqltabla:string;  
begin
  if (qMantenimientos.FieldByName('CODIGOTAREA').asstring <> '') then
    begin
      qry1:= Tquery.Create(application);
      qry1.DatabaseName:='BaseDato';
      sqlmtto:= ' select em.CLELEMENTO1,em.CLELEMENTO2,e.numeroclaveselemento,e.nombretablaelemento,e.claveelemento1,e.claveelemento2,e.campodescriptivo from '+
                ' pm_mantenimiento m,pm_bancomantenimiento bm,pm_elementomantenimiento em,pm_elemento e where m.codigomantenimiento = '''+qMantenimientos.fieldbyname('CODIGOTAREA').asstring+''' and '+
                ' m.CODIGOMANTENIMIENTO = em.CODIGOELEMENTOMANTENIMIENTO and m.CODIGOBANCOMANTENIMIENTO = bm.CODIGOBANCOMANTENIMIENTO and bm.CODIGOELEMENTO = e.CODIGOELEMENTO ';
      qry1.SQL.Append(sqlmtto);
      qry1.Open;
      if (qry1.FieldByName('CAMPODESCRIPTIVO').asstring <> '') then
        begin
          if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) then
            begin
              sqltabla:= ' SELECT '+' '+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+qry1.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+
                         ' WHERE'+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+'='''+qry1.fieldbyname('CLELEMENTO1').asstring+''' ';
              qry2:= Tquery.Create(application);
              qry2.DatabaseName:='BaseDato';
              qry2.SQL.Append(sqltabla);
              qry2.Open;
              qMantenimientos.FieldByName('ELEMENTO').asstring:= qry1.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+qry2.Fields[0].asstring;
            end
          else
            begin
              if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) then
                begin
                  sqltabla:= ' SELECT '+' '+qry1.fieldbyname('CAMPODESCRIPTIVO').asstring+' '+'FROM'+' '+qry1.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+
                             ' WHERE '+' '+qry1.fieldbyname('CLAVEELEMENTO1').asstring+'='''+qry1.fieldbyname('CLELEMENTO1').asstring+'''and'+' '+
                               qry1.fieldbyname('CLAVEELEMENTO2').asstring+'='''+qry1.fieldbyname('CLELEMENTO2').asstring+''' ';
                  qry2:= Tquery.Create(application);
                  qry2.DatabaseName:='BaseDato';
                  qry2.SQL.Append(sqltabla);
                  qry2.Open;
                  qMantenimientos.FieldByName('ELEMENTO').asstring:= qry1.FieldByName('NOMBRETABLAELEMENTO').asstring+' '+qry2.Fields[0].asstring;
                end;
            end;
        end
      else
        begin
          if (qry1.FieldByName('CAMPODESCRIPTIVO').asstring = '') then
            begin
              if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 1) then
                qMantenimientos.FieldByName('ELEMENTO').asstring:= qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+qry1.fieldbyname('CLELEMENTO1').asstring
              else
                begin
                  if (qry1.FieldByName('NUMEROCLAVESELEMENTO').asinteger = 2) then
                    qMantenimientos.FieldByName('ELEMENTO').asstring:= qry1.fieldbyname('NOMBRETABLAELEMENTO').asstring+' '+qry1.fieldbyname('CLELEMENTO1').asstring+qry1.fieldbyname('CLELEMENTO2').asstring;
                end;
            end;
        end;
    end;
    if (qMantenimientos.FieldByName('CODIGOAMBITO').asinteger = 1) then
        begin
          qrysub:= Tquery.Create(application);
          qrysub.DatabaseName:='BaseDato';
          qrysub.SQL.Append('select nombresubestacion from subestacion where codigosubestacion =:codigosubestacion');
          qrysub.ParamByName('CODIGOSUBESTACION').asstring:= qMantenimientos.fieldbyname('CODIGOSUBESTACION').asstring;
          qrysub.Open;
          qMantenimientos.FieldByName('LUGAR').asstring:= qrysub.fieldbyname('NOMBRESUBESTACION').asstring;
        end
      else
        begin
          qrycto:= Tquery.Create(application);
          qrycto.DatabaseName:='BaseDato';
          qrycto.SQL.Append('select nombrecircuito from circuito where codigocircuito =:codigocircuito');
          qrycto.ParamByName('CODIGOCIRCUITO').asstring:= qMantenimientos.fieldbyname('CODIGOCIRCUITO').asstring;
          qrycto.Open;
          qMantenimientos.FieldByName('LUGAR').asstring:= qrycto.fieldbyname('NOMBRECIRCUITO').asstring;
        end;
      qry1.Free;
      qry2.Free;
      qrysub.Free;
      qrycto.Free;
end;

{
procedure TfModificarMantenimiento.Button1Click(Sender: TObject);
begin
  if qMantenimiento.Active then
    qMantenimiento.Close;
  qMantenimiento.SQL.Clear;
  sqlmantenimiento:= ' select t.codigotarea,t.FECHAINICIAL,t.NOMBRETAREA,m.codigosubestacion,m.codigocircuito,'+
                     ' bm.codigoambito,tm.nombremant,ab.nombreambito,em.CLELEMENTO1,em.CLELEMENTO2'+
                     ' from pm_tarea t,pm_mantenimiento m,pm_bancomantenimiento bm,pm_elementomantenimiento em,'+
                     ' pm_tipomantenimiento tm,pm_ambito ab where to_char(t.fechainicial,''dd/mm/yyyy'')=to_char(:fechaProgramacion,''dd/mm/yyyy'') and'+
                     ' t.codigoestadotarea = 4 and t.codigotarea = m.codigomantenimiento and'+
                     ' m.codigotipomant = tm.CODIGOTIPOMANT and m.CODIGOBANCOMANTENIMIENTO = bm.CODIGOBANCOMANTENIMIENTO'+
                     ' and em.CODIGOELEMENTOMANTENIMIENTO = m.CODIGOMANTENIMIENTO and'+
                     ' bm.CODIGOAMBITO = ab.CODIGOAMBITO';

  if (cbAmbito.Checked) and (Ambito.Text <> '' ) then
    begin
      if (cbElemento.Checked) and (Elemento.Text <> '') then
        sqlmantenimiento:= sqlmantenimiento + ' and bm.codigoelemento = '''+vartostr(Elemento.keyvalue)+''' ';
      case (Ambito.KeyValue) of
        1:begin
            if (Subestacion.Text <> '')  then
              sqlmantenimiento:= sqlmantenimiento + ' and m.codigosubestacion = '''+vartostr(Subestacion.KeyValue)+''' '
            else
              sqlmantenimiento:= sqlmantenimiento + ' and bm.codigoambito = '''+vartostr(Ambito.keyvalue)+''' ';
          end;
        2:begin
            if (Circuito.Text <> '')  then
              sqlmantenimiento:= sqlmantenimiento + ' and m.codigocircuito = '''+vartostr(Circuito.KeyValue)+''' '
            else
              sqlmantenimiento:= sqlmantenimiento + ' and bm.codigoambito = '''+vartostr(Ambito.keyvalue)+''' ';
          end;
      end;
    end;
  if (cbTipoMantenimiento.Checked) and (TipoMantenimiento.Text <> '') then
    sqlmantenimiento:= sqlmantenimiento + ' and bm.codigotipomant = '''+vartostr(TipoMantenimiento.keyvalue)+''' ';
  qMantenimiento.SQL.Append(sqlmantenimiento);
  qMantenimiento.Open;
end;         }

procedure TfModificarMantenimiento.SBSalirClick(Sender: TObject);
begin
  fModificarMantenimiento.ModalResult:= mrOk;
end;

procedure TfModificarMantenimiento.bFiltrarClick(Sender: TObject);
begin
  fFiltroConsultasMantenimiento:=TfFiltroConsultasMantenimiento.Create(Application);
  fFiltroConsultasMantenimiento.DBLCBEstadoMtto.KeyValue:=4;
  fFiltroConsultasMantenimiento.DBEEstadoMtto.Text:='4';
  fFiltroConsultasMantenimiento.DBLCBEstadoMtto.ReadOnly:=TRUE;
  fFiltroConsultasMantenimiento.DBEEstadoMtto.ReadOnly:=TRUE;
  fFiltroConsultasMantenimiento.ShowModal;
  if fFiltroConsultasMantenimiento.qmantenimientos.sql.Text='' then
  begin
    qMantenimientos.Close;
    qMantenimientos.Open;
  end
  else
  begin
    qMantenimientos.SQL.Clear;
    qMantenimientos.Close;
    qMantenimientos.sql.text:=fFiltroConsultasMantenimiento.qmantenimientos.sql.text;
    qMantenimientos.Open;
  end;

  if qMantenimientos.RecordCount <> 1 then
    PanelSuperior.Caption := 'CONSULTA DE MANTENIMIENTOS     << ' + inttostr(qMantenimientos.recordcount)+' Registros Encontrados >>'
  else PanelSuperior.Caption := 'CONSULTA DE MANTENIMIENTOS     << ' +inttostr(qMantenimientos.recordcount)+' Registro Encontrado >>';

  fFiltroConsultasMantenimiento.Free;
end;

procedure TfModificarMantenimiento.qMantenimientosCalcFields(
  DataSet: TDataSet);
begin
  qElementoMtto.Close;
  qElementoMtto.ParamByName('CODIGOELEMENTOMANTENIMIENTO').AsString:=qmantenimientos.fieldbyname('CODIGOTAREA').asstring;
  qElementoMtto.Open;
  consultarelemento(qElementoMttoCODIGOELEMENTO.asstring);
  qMantenimientoselemento.AsString:=Memo2.Text;
end;

procedure TfModificarMantenimiento.consultarelemento(codigotipoelemento: string);
var qry1,qtablaelemento:tquery;
  sqltablaelemento1:string;
begin
  qry1:=tquery.Create(Application);
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
    qTablaElemento.SQL.Add(sqltablaelemento1);
    qTablaElemento.Open;
    memo2.Lines.Append(qTablaElemento.Fields[1].asstring);
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
      Memo2.Lines.Append(qElementoMtto.fieldbyname('CLELEMENTO1').asstring+qElementoMtto.fieldbyname('CLELEMENTO2').asstring);
    end;
  end;
//  elemento:=Memo2.Text;
  qry1.Free;
  qtablaelemento.Free;
end;

//ORDENAR
procedure TfModificarMantenimiento.Ordenar(sCriterio: String);
begin
  qMantenimientos.Close;
  qMantenimientos.SQL.Delete(qMantenimientos.SQL.Count - 1);
  qMantenimientos.SQL.Add(sCriterio);
  qMantenimientos.Open;
  RxDBGConsultaMtto.SetFocus;
end;
{
//CODIGO MANTENIMIENTO 
procedure TfModificarMantenimiento.CodigoMttoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('CODIGOMTTO');
  sCriterio := 'ORDER BY t.codigotarea DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['CODIGOMTTO']='1') then
    begin
      sCriterio := 'ORDER BY t.codigotarea ASC';
      ListaDireccionCampos.Values['CODIGOMTTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['CODIGOMTTO']:='1'
  end;
  CodigoMtto.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMtto do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosCODIGOMANTENIMIENTO;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;   }

{
procedure TfModificarMantenimiento.ElementoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('ELEMENTO');
  sCriterio := 'ORDER BY elemento DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['ELEMENTO']='1' then
    begin
      sCriterio := 'ORDER BY elemento ASC';
      ListaDireccionCampos.Values['ELEMENTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['ELEMENTO']:='1'
  end;
  Elemento.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMtto do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosELEMENTO;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;     }

procedure TfModificarMantenimiento.SBOrdenarClick(Sender: TObject);
var punto:TPoint;
begin
  punto:=Panel9.ClientToScreen(Classes.Point(SBOrdenar.Left, SBOrdenar.top));
  pmOrdenar.Popup(punto.x-10, punto.y-10);
end;

procedure TfModificarMantenimiento.CodigoMttoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('CODIGOMTTO');
  sCriterio := 'ORDER BY t.codigotarea DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['CODIGOMTTO']='1') then
    begin
      sCriterio := 'ORDER BY t.codigotarea ASC';
      ListaDireccionCampos.Values['CODIGOMTTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['CODIGOMTTO']:='1'
  end;
  CodigoMtto.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMtto do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosCODIGOMANTENIMIENTO;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfModificarMantenimiento.NombreMantenimientoClick(
  Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('NOMBREMANTENIMIENTO');
  sCriterio := 'ORDER BY T.NOMBRETAREA DESC';
  if Posicion<>-1 then
  begin
    if (ListaDireccionCampos.Values['NOMBREMANTENIMIENTO']='1') then
    begin
      sCriterio := 'ORDER BY T.NOMBRETAREA ASC';
      ListaDireccionCampos.Values['NOMBREMANTENIMIENTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['NOMBREMANTENIMIENTO']:='1'
  end;
  NombreMantenimiento.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMtto do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBRETAREA;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfModificarMantenimiento.TipoMantenimientoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('TIPOMANTENIMIENTO');
  sCriterio := 'ORDER BY TM.NOMBREMANT DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['TIPOMANTENIMIENTO']='1' then
    begin
      sCriterio := 'ORDER BY TM.NOMBREMANT ASC';
      ListaDireccionCampos.Values['TIPOMANTENIMIENTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['TIPOMANTENIMIENTO']:='1'
  end;
  TipoMantenimiento.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMtto do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBREMANT;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfModificarMantenimiento.CoordinacionClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('COORDINACION');
  sCriterio := 'ORDER BY a.nombreareaoperacionodt DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['COORDINACION']='1' then
    begin
      sCriterio := 'ORDER BY a.nombreareaoperacionodt ASC';
      ListaDireccionCampos.Values['COORDINACION']:='-1';
    end
    else
      ListaDireccionCampos.Values['COORDINACION']:='1'
  end;
  Coordinacion.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMtto do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBREAREAOPERACIONODT;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfModificarMantenimiento.FechaInicialMttoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHAINICIALMTTO');
  sCriterio := 'ORDER BY t.fechainicial DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['FECHAINICIALMTTO']='1' then
    begin
      sCriterio := 'ORDER BY t.fechainicial ASC';
      ListaDireccionCampos.Values['FECHAINICIALMTTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHAINICIALMTTO']:='1'
  end;
  FechaInicialMtto.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMtto do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosFECHAINICIAL;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfModificarMantenimiento.FechaFinalMttoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('FECHAFINALMTTO');
  sCriterio := 'ORDER BY t.fechafinal DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['FECHAFINALMTTO']='1' then
    begin
      sCriterio := 'ORDER BY t.fechafinal ASC';
      ListaDireccionCampos.Values['FECHAFINALMTTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['FECHAFINALMTTO']:='1'
  end;
  FechaFinalMtto.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMtto do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosFECHAFINAL;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;
{
procedure TfModificarMantenimiento.EstadoMttoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('ESTADOMTTO');
  sCriterio := 'ORDER BY et.NombreEstado DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['ESTADOMTTO']='1' then
    begin
      sCriterio := 'ORDER BY et.NombreEstado ASC';
      ListaDireccionCampos.Values['ESTADOMTTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['ESTADOMTTO']:='1'
  end;
  EstadoMtto.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMtto do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBREESTADO;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;     }

procedure TfModificarMantenimiento.TipoElementoClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('TIPOELEMENTO');
  sCriterio := 'ORDER BY e.nombretipoelemento DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['TIPOELEMENTO']='1' then
    begin
      sCriterio := 'ORDER BY e.nombretipoelemento ASC';
      ListaDireccionCampos.Values['TIPOELEMENTO']:='-1';
    end
    else
      ListaDireccionCampos.Values['TIPOELEMENTO']:='1'
  end;
  TipoElemento.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMtto do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBRETIPOELEMENTO;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfModificarMantenimiento.TensionClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('TENSION');
  sCriterio := 'ORDER BY nt.tension DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['TENSION']='1' then
    begin
      sCriterio := 'ORDER BY nt.tension ASC';
      ListaDireccionCampos.Values['TENSION']:='-1';
    end
    else
      ListaDireccionCampos.Values['TENSION']:='1'
  end;
  Tension.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMtto do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosTENSION;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfModificarMantenimiento.SubestacionClick(Sender: TObject);
Var Posicion:Integer;
begin
  inherited;
  Posicion:=ListaDireccionCampos.IndexOfName('SUBESTACION');
  sCriterio := 'ORDER BY s.nombresubestacion DESC';
  if Posicion<>-1 then
  begin
    if ListaDireccionCampos.Values['SUBESTACION']='1' then
    begin
      sCriterio := 'ORDER BY s.nombresubestacion ASC';
      ListaDireccionCampos.Values['SUBESTACION']:='-1';
    end
    else
      ListaDireccionCampos.Values['SUBESTACION']:='1'
  end;
  Subestacion.Checked := true;
  Ordenar(sCriterio);
  with RxDBGConsultaMtto do
  begin
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style - [fsBold];
    SelectedField:=qMantenimientosNOMBRESUBESTACION;
    Columns[Col-1].title.Font.Style :=Columns[Col].title.Font.Style + [fsBold];
  end;
end;

procedure TfModificarMantenimiento.sbRefrescarClick(Sender: TObject);
begin
  qMantenimientos.Close;
  qMantenimientos.Open;
end;

procedure TfModificarMantenimiento.FormDestroy(Sender: TObject);
begin
  qMantenimientos.Free;
  qElementoMtto.Free;
  qMantenimientoselemento.Free;
end;

procedure TfModificarMantenimiento.FormCreate(Sender: TObject);
begin
  qMantenimientos.Close;
  qMantenimientos.Open;
  ListaDireccionCampos:=TStringList.Create;
  ListaDireccionCampos.Add('CODIGOMTTO=-1');
  ListaDireccionCampos.Add('NOMBREMANTENIMIENTO=-1');
  ListaDireccionCampos.Add('TIPOMANTENIMIENTO=-1');
  ListaDireccionCampos.Add('COORDINACION=-1');
  ListaDireccionCampos.Add('FECHAINICIALMTTO=-1');
  ListaDireccionCampos.Add('FECHAFINALMTTO=-1');
  ListaDireccionCampos.Add('ESTADOMTTO=-1');
  ListaDireccionCampos.Add('TIPOELEMENTO=-1');
  ListaDireccionCampos.Add('TENSION=-1');
  ListaDireccionCampos.Add('SUBESTACION=-1');
  ListaDireccionCampos.Add('ELEMENTO=-1');
end;

procedure TfModificarMantenimiento.SBBuscarClick(Sender: TObject);
begin
  inherited;
  FBusquedaMtto := TFBusquedaMtto.Create(Application);
  FBusquedaMtto.dsMtto.DataSet:=qMantenimientos;
  FBusquedaMtto.ShowModal;
  FBusquedaMtto.Free;
  RxDBGConsultaMtto.Setfocus;
end;

procedure TfModificarMantenimiento.sbExportarClick(Sender: TObject);
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
  oWB.sheets.add.name:= 'Mantenimientos';
  oWB.ActiveSheet.Cells[1,1] := 'CODIGO MTTO';
  oWB.ActiveSheet.Cells[1,2] := 'NOMBRE MANTENIMIENTO';
  oWB.ActiveSheet.Cells[1,3] := 'FECHA INICIAL';
  oWB.ActiveSheet.Cells[1,4] := 'FECHA FINAL';
  oWB.ActiveSheet.Cells[1,5] := 'TIPO MTTO';
  oWB.ActiveSheet.Cells[1,6] := 'COORDINACION';
  oWB.ActiveSheet.Cells[1,7] := 'TENSION';
  oWB.ActiveSheet.Cells[1,8] := 'SUBESTACION';
  oWB.ActiveSheet.Cells[1,9] := 'TIPO ELEMENTO';
  oWB.ActiveSheet.Cells[1,10] := 'ELEMENTO';
  qMantenimientos.First;
  fila:= 2;
  while not qMantenimientos.eof do
  begin
    oWB.ActiveSheet.Cells[fila,1] :=  qMantenimientos.FIELDBYNAME('CODIGOMANTENIMIENTO').asstring;
    oWB.ActiveSheet.Cells[fila,2] :=  qMantenimientos.FIELDBYNAME('NOMBRETAREA').asstring;
    oWB.ActiveSheet.Cells[fila,3] :=  qMantenimientos.FIELDBYNAME('FECHAINICIAL').asstring;
    oWB.ActiveSheet.Cells[fila,4] :=  qMantenimientos.FIELDBYNAME('FECHAFINAL').asstring;
    oWB.ActiveSheet.Cells[fila,5] :=  qMantenimientos.FIELDBYNAME('NOMBREMANT').asstring;
    oWB.ActiveSheet.Cells[fila,6] :=  qMantenimientos.FIELDBYNAME('NOMBREAREAOPERACIONODT').asstring;
    oWB.ActiveSheet.Cells[fila,7] :=  qMantenimientos.FIELDBYNAME('TENSION').asstring;
    oWB.ActiveSheet.Cells[fila,8]:=  qMantenimientos.FIELDBYNAME('NOMBRESUBESTACION').asstring;
    oWB.ActiveSheet.Cells[fila,9] :=  qMantenimientos.FIELDBYNAME('NOMBRETIPOELEMENTO').asstring;
    oWB.ActiveSheet.Cells[fila,10]:=  qMantenimientos.FIELDBYNAME('ELEMENTO').asstring;
    fila:= fila + 1;
    qMantenimientos.next;
  end;
  oWB.SaveAs('C:\EnerGIS4\ConsultaMttosProgramados'+'_'+IntToStr(Day)+'_'+ IntToStr(Month)+'_' +IntToStr(Year) + '_'+ IntToStr(Hour)+'y'+IntToStr(Min),null,'','',EmptyParam,EmptyParam,0, EmptyParam, EmptyParam, EmptyParam,EmptyParam,0);
end;

end.
