unit ubancomantenimiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Buttons, DBCtrls, StdCtrls, Mask, ExtCtrls;

type
  Tfbancomantenimiento = class(TForm)
    PanelCentral: TPanel;
    LabelCodigoTarea: TLabel;
    LabelNombreTarea: TLabel;
    LabelFrecuencia: TLabel;
    DBEditCodigoTarea: TDBEdit;
    DBEditNombreTarea: TDBEdit;
    DBEditFrecuencia: TDBEdit;
    GroupBoxDescripcion: TGroupBox;
    DBMemoDescripcion: TDBMemo;
    PanelInferior: TPanel;
    GroupBoxFechasEjecucion: TGroupBox;
    PanelInferiorFinal: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Dtipoelemento: TDataSource;
    Qtipoelemento: TQuery;
    DSTipoMantenimiento: TDataSource;
    QTipoMantenimiento: TQuery;
    DSAmbito: TDataSource;
    QAmbito: TQuery;
    qAreaOperacion: TQuery;
    dsAreaOperacion: TDataSource;
    LabelTitulo: TLabel;
    LabelCodigoTipoMantenimiento: TLabel;
    CodigoTipoMantenimiento: TDBLookupComboBox;
    Label1: TLabel;
    LabelCodigoAmbito: TLabel;
    CodigoAmbito: TDBLookupComboBox;
    Label2: TLabel;
    niveltension: TDBLookupComboBox;
    bancomantenimiento: TDataSource;
    Qbancomantenimiento: TQuery;
    Ubancomantenimiento: TUpdateSQL;
    Dniveltension: TDataSource;
    Qniveltension: TQuery;
    Panel1: TPanel;
    LabelFechaInicioEjec: TLabel;
    dblcbAreaOperacion: TDBLookupComboBox;
    Panel4: TPanel;
    listaactividadestablecida: TListBox;
    listaactividaddisponible: TListBox;
    Panel2: TPanel;
    Label4: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Label3: TLabel;
    QActividadMantenimiento: TQuery;
    Uactividadmantenimiento: TUpdateSQL;
    DBEdit1: TDBEdit;
    TipoElemento: TDBLookupComboBox;
    qTipoElemento1: TQuery;
    QbancomantenimientoCODIGOBANCOMANTENIMIENTO: TFloatField;
    QbancomantenimientoNOMBREMANTENIMIENTO: TStringField;
    QbancomantenimientoCODIGONIVELTENSION: TStringField;
    QbancomantenimientoCODIGOAMBITO: TFloatField;
    QbancomantenimientoFRECUENCIA: TFloatField;
    QbancomantenimientoDESCRIPCION: TBlobField;
    QbancomantenimientoCODIGOTIPOMANT: TFloatField;
    QbancomantenimientoCODIGODESCRIPTIVO: TStringField;
    QbancomantenimientoCODIGOELEMENTO: TFloatField;
    EtipoElemento1: TEdit;
    actividadareaoperaodt: TDBLookupComboBox;
    Label5: TLabel;
    qActividadAreaODT: TQuery;
    sActividadAreaODT: TDataSource;
    QbancomantenimientoCODIGOAREAOPERACIONODT: TFloatField;
    QActividadMantenimientoCODIGOACTIVIDADMANTENIMIENTO: TFloatField;
    QActividadMantenimientoCODIGOBANCOMANTENIMIENTO: TFloatField;
    QActividadMantenimientoCODIGOSUBACTIVIDADAREAODT: TFloatField;
    QActividadMantenimientoNOMBREACTIVIDADMANTENIMIENTO: TStringField;
    qActividadAreaODTCODIGOACTIVIDADAREAODT: TFloatField;
    qActividadAreaODTCODIGOAREAOPERACIONODT: TFloatField;
    qActividadAreaODTNOMBREACTIVIDADAREAODT: TStringField;
    procedure niveltensionClick(Sender: TObject);
    procedure dblcbAreaOperacionClick(Sender: TObject);
    procedure QbancomantenimientoNewRecord(DataSet: TDataSet);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure QActividadMantenimientoNewRecord(DataSet: TDataSet);
    procedure QActividadMantenimientoBeforePost(DataSet: TDataSet);
    procedure SpeedButton2Click(Sender: TObject);
    procedure QbancomantenimientoAfterDelete(DataSet: TDataSet);
    procedure QbancomantenimientoAfterPost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure CodigoAmbitoClick(Sender: TObject);
    procedure actividadareaoperaodtClick(Sender: TObject);
    

  private
    { Private declarations }
  public
    { Public declarations }
    codigoactividaddisponible,codigooperaestablecida,codigooperadisponible,codigoactividadestablecida,codigoactividadgrabada,operacion,operacion2: TstringList;
    constructor crearnuevobanco(AOwner: TComponent);
    constructor crear (AOwner: TComponent; codigobanco : Real);
    procedure ObtenerActividades();

  end;

var
  fbancomantenimiento: Tfbancomantenimiento;

implementation

uses ConsDll;

{$R *.DFM}

{ Tfbancomantenimiento }

constructor Tfbancomantenimiento.crearnuevobanco(AOwner: TComponent);
var
 a: integer;
 qry1: Tquery;
begin
//showmessage('entra crear nuevo banco');
 inherited Create(Owner);
 codigoactividaddisponible:= TstringList.create;
 codigooperadisponible:= TStringList.Create;
 codigooperaestablecida:= TstringList.create;
 codigoactividadestablecida:= TstringList.create;

 if  QAmbito.active then
  QAmbito.close;
 QAmbito.open;
 if  Qtipoelemento.active then
  Qtipoelemento.close;
 Qtipoelemento.open;
 if  QTipoMantenimiento.active then
  QTipoMantenimiento.close;
 QTipoMantenimiento.open;
 if  Qniveltension.active then
  Qniveltension.close;
 Qniveltension.open;
 if  qAreaOperacion.Active then
  qAreaOperacion.Close;
 qAreaOperacion.Open;
 Qniveltension.open;
 if  Qbancomantenimiento.active then
  Qbancomantenimiento.close;
// Qbancomantenimiento.ParamByName('codigo').asfloat:=codigobanco;
 Qbancomantenimiento.open;
 if QActividadMantenimiento.Active then
  QActividadMantenimiento.Close;
 QActividadMantenimiento.Open;
 Qbancomantenimiento.Append;
 qry1:= TQuery.Create(Application);
 qry1.DatabaseName:='BaseDato';
 qry1.SQL.Clear;
 qry1.SQL.Add('select numeromant.nextval from dual');
 qry1.Open;
 a:= qry1.Fields[0].asInteger;
 //DBEditCodigoTarea.Text:= inttostr(a);

 
 
 //DBEditCodigoTarea.Text:= qry1.Fields[0].asstring;

 {Cod_Mantenimiento:=(FloatToStr(CodMantenimiento));
     Qry:=TQuery.Create(Application);
     Qry.DatabaseName:='BaseDato';
     Qry.Sql.Clear;
     Sql:='SELECT CODIGOMANTENIMIENTO,CODIGOTIPOMANT,TO_CHAR(FECHAINICIOEJEC,''DD/MM/YYYY   HH24:MI'') AS FECHAINICIOEJ ,TO_CHAR(FECHAFINEJEC,''DD/MM/YYYY   HH24:MI'') AS FECHAFINEJ,CODIGOAMBITO,CODIGOSUBESTACION, '+
          'CODIGOCIRCUITO FROM PM_MANTENIMIENTO WHERE CODIGOMANTENIMIENTO = '''+Cod_Mantenimiento+'''';
     Qry.Sql.Add(Sql);
     Qry.Open;}


end;


constructor Tfbancomantenimiento.crear(AOwner: TComponent;
  codigobanco: Real);
var qry1,qry2,qry3,qry4:TQuery;
     sql1,sql2,sql4:String;

begin
   inherited Create(Owner);
   codigoactividaddisponible:= TstringList.create;
   codigooperadisponible:= TStringList.Create;
   codigooperaestablecida:= TstringList.create;
   codigoactividadestablecida:= TstringList.create;
   if  QAmbito.active then
     QAmbito.close;
   QAmbito.open;
   if  Qtipoelemento.active then
     Qtipoelemento.close;
   Qtipoelemento.open;
   if  QTipoMantenimiento.active then
     QTipoMantenimiento.close;
   QTipoMantenimiento.open;
   if  Qniveltension.active then
     Qniveltension.close;
   Qniveltension.open;
   if  Qbancomantenimiento.active then
     Qbancomantenimiento.close;
   Qbancomantenimiento.ParamByName('codigo').asfloat:=codigobanco;
   Qbancomantenimiento.open;
   if qAreaOperacion.Active then
     qAreaOperacion.Close;
   qAreaOperacion.Open;
   Qbancomantenimiento.Edit;
   if DBEditCodigoTarea.ReadOnly = False then
     DBEditCodigoTarea.ReadOnly:= True;

//   if DBEditNombreTarea.ReadOnly = False then
//     DBEditNombreTarea.ReadOnly:= True;
   if DBEditNombreTarea.ReadOnly = true then
     DBEditNombreTarea.ReadOnly:= false;

//   if DBEditFrecuencia.ReadOnly = False then
//     DBEditFrecuencia.ReadOnly:= True;
   if CodigoTipoMantenimiento.Enabled = True then
     CodigoTipoMantenimiento.Enabled:= False;
   if CodigoAmbito.Enabled = True then
     CodigoAmbito.Enabled:= False;
   if niveltension.Enabled = True then
     niveltension.Enabled:= False;
   if TipoElemento.Enabled = True then
     TipoElemento.Enabled:= False;

{   if DBMemoDescripcion.ReadOnly = False then
     DBMemoDescripcion.ReadOnly:= True;}

   if DBMemoDescripcion.ReadOnly = True then
     DBMemoDescripcion.ReadOnly:= False;


   if dblcbAreaOperacion.Enabled = True then
     dblcbAreaOperacion.Enabled:= False;
   if actividadareaoperaodt.Enabled = true then
     actividadareaoperaodt.Enabled:= false;
   qry1:= TQuery.Create(self);
   qry1.DatabaseName:='BaseDato';
   sql1:=' select * from pm_actividadmantenimiento where pm_actividadmantenimiento.codigobancomantenimiento='+FloattoStr(codigobanco);
   qry1.SQL.Clear;
   qry1.SQL.Add(sql1);
   qry1.Open;
   dblcbAreaOperacion.KeyValue:= Qbancomantenimiento.fieldbyname('CODIGOAREAOPERACIONODT').asinteger;
   if qActividadAreaODT.Active then
     qActividadAreaODT.Close;
   qActividadAreaODT.ParamByName('CODIGOAREAOPERACIONODT').asinteger:= dblcbAreaOperacion.KeyValue;
   qActividadAreaODT.Open;

//   ODTOPERA.KeyValue:= qry1.fieldByName('CODIGOODTOPERA').AsInteger;
//   sql2:=' select * from odtactividad where codigoodtopera='+VarToStr(ODTOPERA.KeyValue)+' and codigoniveltension='+VarToStr(niveltension.KeyValue);
   sql2:=' select * from subactividadareaodt where codigosubactividadareaodt=:codigosubactividadareaodt';
   qry2:= TQuery.Create(self);
   qry2.DatabaseName:='BaseDato';
   qry2.SQL.Add(sql2);

   qry2.ParamByName('CODIGOSUBACTIVIDADAREAODT').asinteger:= qry1.fieldbyname('CODIGOSUBACTIVIDADAREAODT').asinteger;
   qry2.Open;
   actividadareaoperaodt.KeyValue:= qry2.fieldbyname('CODIGOACTIVIDADAREAODT').asinteger;
   if qry2.Active then
     qry2.Close;
   qry2.SQL.Clear;
   sql2:= ' select saodt.codigosubactividadareaodt,saodt.nombresubactividadareaodt from '+
          ' subactividadareaodt saodt,subactividadareantodt santodt where saodt.codigoactividadareaodt = '''+vartostr(actividadareaoperaodt.KeyValue)+''' and '+
          ' saodt.CODIGOSUBACTIVIDADAREAODT = santodt.CODIGOSUBACTIVIDADAREAODT and santodt.CODIGONIVELTENSION = '''+Qbancomantenimiento.fieldbyname('CODIGONIVELTENSION').asstring+''' ';

//   sql2:='select * from subactividadareaodt where codigoactividadareaodt=:codigoactividadareaodt';
   qry2.SQL.Append(sql2);
//   qry2.ParamByName('CODIGOACTIVIDADAREAODT').asinteger:= actividadareaoperaodt.KeyValue;
   qry2.Open;


   while not qry2.Eof do
     begin
       if not qry1.Locate('codigosubactividadareaodt',qry2.FieldByName('CODIGOSUBACTIVIDADAREAODT').asinteger,[]) then
         begin
           codigooperadisponible.Add(qry2.FieldByName('CODIGOSUBACTIVIDADAREAODT').asstring);
           listaactividaddisponible.Items.Add(qry2.FieldByName('NOMBRESUBACTIVIDADAREAODT').AsString);
         end;
       qry2.Next;
     end;
   qry1.First;
   while not qry1.eof do
     begin
       codigooperaestablecida.add(qry1.FieldByName('CODIGOSUBACTIVIDADAREAODT').asstring);
       listaactividadestablecida.Items.Add(qry1.FieldByName('NOMBREACTIVIDADMANTENIMIENTO').asstring);
       qry1.next;
     end;
   //////////
   qry3:= TQuery.Create(Application);
   qry3.DatabaseName:='BaseDato';
   qry3.SQL.Clear;
   qry3.SQL.Add('select * from pm_elemento where codigoelemento =:codigoelemento');
   qry3.ParamByName('CODIGOELEMENTO').AsInteger:=QBancoMantenimiento.fieldbyName('CODIGOELEMENTO').AsInteger;
   qry3.Open;
   eTipoElemento1.text:=qry3.fieldbyname('NOMBRETIPOELEMENTO').asString;
   if (eTipoElemento1.Visible=false)then
   begin
     ETipoElemento1.visible:=true;
     TipoElemento.Visible:=false;
   end;
end;

procedure Tfbancomantenimiento.ObtenerActividades;
var
qry: Tquery;
sql: string;
begin
 qry:= Tquery.create(self);
 qry.databasename:='BaseDato';
// if VarToStr(niveltension.KeyValue) <> '' then
 sql:= ' select saodt.codigosubactividadareaodt,saodt.nombresubactividadareaodt from '+
       ' subactividadareaodt saodt,subactividadareantodt santodt where '+
       ' saodt.codigoactividadareaodt = '''+vartostr(actividadareaoperaodt.KeyValue)+''' and '+
       ' saodt.CODIGOSUBACTIVIDADAREAODT = santodt.CODIGOSUBACTIVIDADAREAODT and santodt.CODIGONIVELTENSION = '''+vartostr(niveltension.keyvalue)+''' ';
// sql:='select codigosubactividadareaodt,nombresubactividadareaodt from subactividadareaodt where codigoactividadareaodt='+vartostr(actividadareaoperaodt.KeyValue);
 qry.SQL.Clear;
// sql:='select CODIGOODTOPERA, CODIGOODTACTIVIDAD, NOMBREODTACTIVIDAD from odtactividad  where ' +
//       'codigoniveltension='+VarToStr(niveltension.keyvalue)+' and codigoodtopera='+VarToStr(ODTOPERA.KeyValue);
{ else
  sql:='select CODIGOODTOPERA, CODIGOODTACTIVIDAD, NOMBREODTACTIVIDAD from odtactividad  where ' +
       ' codigoodtopera='+VarToStr(ODTOPERA.KeyValue);}
 qry.sql.add(sql);
 qry.Open;
 codigooperaestablecida.Clear;
 codigoactividadestablecida.Clear;
 listaactividadestablecida.Clear;
 codigooperadisponible.Clear;
 codigoactividaddisponible.Clear;
 listaactividaddisponible.Clear;
 while not qry.eof do
  begin
    codigooperadisponible.Add(qry.fieldbyname('CODIGOSUBACTIVIDADAREAODT').asstring);
    listaactividaddisponible.Items.Add(qry.fieldbyname('NOMBRESUBACTIVIDADAREAODT').asstring);
    qry.next;
  end;
end;

procedure Tfbancomantenimiento.niveltensionClick(Sender: TObject);
begin
  if  qAreaOperacion.active then
     qAreaOperacion.close;
   qAreaOperacion.open;
end;

procedure Tfbancomantenimiento.dblcbAreaOperacionClick(Sender: TObject);
begin
  if qActividadAreaODT.Active then
    qActividadAreaODT.Close;
  qActividadAreaODT.ParamByName('CODIGOAREAOPERACIONODT').asinteger:= dblcbAreaOperacion.KeyValue;
  qActividadAreaODT.Open;

 {if niveltension.Text='' then
   begin
     Application.MessageBox(pchar('Debe escoger un nivel de tensión'),'Error en Actividades disponibles',mb_iconerror);
     exit;
   end
 else
   ObtenerActividades;}
end;

procedure Tfbancomantenimiento.QbancomantenimientoNewRecord(
  DataSet: TDataSet);
var
 qry3:TQuery;
begin
 qry3:= TQuery.Create(Application);
 qry3.DatabaseName:='BaseDato';
 qry3.SQL.Clear;
 qry3.SQL.Add('select numeromant.nextval from dual');
 qry3.Open;
 QbancomantenimientoCODIGOBANCOMANTENIMIENTO.Value:= qry3.Fields[0].asfloat;
 QbancomantenimientoCODIGODESCRIPTIVO.AsString:= 'elemento';
end;

procedure Tfbancomantenimiento.SpeedButton3Click(Sender: TObject);
var
i:Integer;

begin
 if dblcbAreaOperacion.Enabled = True then
   dblcbAreaOperacion.Enabled:= False;
 if (listaactividaddisponible.ItemIndex <> -1) then
   begin
     i:= listaactividaddisponible.ItemIndex;

     listaactividadestablecida.Items.Add(listaactividaddisponible.Items.Strings[listaactividaddisponible.itemindex]);
// codigoactividadestablecida.Add(codigoactividaddisponible.Strings[i]);
     codigooperaestablecida.Add(codigooperadisponible.Strings[i]);
     listaactividaddisponible.Items.Delete(listaactividaddisponible.ItemIndex);
// codigoactividaddisponible.Delete(i);
     codigooperadisponible.Delete(i);
   end;

end;

procedure Tfbancomantenimiento.SpeedButton5Click(Sender: TObject);
var
 i: integer;
begin
 if (listaactividadestablecida.ItemIndex <> -1 ) then
   begin
     i:= listaactividadestablecida.ItemIndex;
     listaactividaddisponible.Items.Add(listaactividadestablecida.Items.Strings[listaactividadestablecida.itemindex]);
// codigoactividaddisponible.Add(codigoactividadestablecida.Strings[i]);
     codigooperadisponible.Add(codigooperaestablecida.Strings[i]);
     listaactividadestablecida.Items.Delete(listaactividadestablecida.ItemIndex);
// codigoactividadestablecida.Delete(i);
     codigooperaestablecida.Delete(i);
   end;

end;

procedure Tfbancomantenimiento.SpeedButton1Click(Sender: TObject);
var Bandera,f: Boolean;
          fc,i,x,y:integer;
          temp1,temp2:string;
begin
 Bandera:=true;
 if Qbancomantenimiento.State = dsEdit then
   begin
     if listaactividadestablecida.Items.Count=0 then
      begin
        Application.MessageBox(pchar('Debe asociar al mantenimiento al menos una actividad'),'Error en Actividades',mb_iconerror);
        Bandera:=false;
        exit;
      end;

   end
 else
   begin

 //CODIGO DESCRIPTIVO MANTENIMIENTO   ************************************************
     {if DBEditCodigoTarea.Text='' then
       begin
         Application.MessageBox(pchar('Debe Asignar un Identificador al mantenimiento'),'Error en Identificador',mb_iconerror);
         Bandera:=false;
         exit;
       end;}
 // NOMBRE MANTENIMIENTO  ************************************************************
     if DBEditNombreTarea.Text ='' then
       begin
         Application.MessageBox(pchar('Debe digitar un nombre de mantenimiento'),'Error en Nombre',mb_iconerror);
         Bandera:=false;
         exit;
       end;
     // FRECUENCIA MANTENIMIENTO ***********************************************************

     if (QbancomantenimientoCODIGOTIPOMANT.AsInteger=1 ) or (QbancomantenimientoCODIGOTIPOMANT.asInteger=2) then
     begin
       if(QbancomantenimientoFRECUENCIA.AsString='')then
       begin
         Application.MessageBox(pchar('Debe digitar una frecuencia (en días)'),'Error en Frecuencia',mb_iconerror);
//         Bandera:=false;
         ModalResult:=0;
         exit;
       end
       else
       begin
         try
           StrToInt(DBEditFrecuencia.Text);
           fc:= strtoint(DBEditFrecuencia.text);
           if ((fc <= 0) or (fc > 365)) then
           begin
             Application.MessageBox(pchar('El valor de la frecuencia debe estar entre 1 y 1000 (días)'),'Error en Frecuencia',mb_iconerror);
             ModalResult:=0;
             exit;
           end;
         except
           on e:exception do
           begin
             application.MessageBox(pchar('Frecuencia Asignada Incorrecta'),'Error en Frecuencia',mb_iconerror);
//             bandera:=false;
             ModalResult:=0;
             exit;
           end;
         end;
       end;
     end;

     // TIPO MANTENIMIENTO ***********************************************************
     if CodigoTipoMantenimiento.Text='' then
        begin
             Application.MessageBox(pchar('Debe escoger un tipo de mantenimiento'),'Error en Tipo mantenimiento',mb_iconerror);
             Bandera:=false;
             exit;
        end;
      //NIVEL DE TENSION
     if niveltension.Text='' then
        begin
         Application.MessageBox(pchar('Debe escoger un nivel de tensión'),'Error en Nivel de Tensión',mb_iconerror);
         Bandera:=false;
         exit;
        end;
     // CODIGO AMBITO ****************************************************
     if CodigoAmbito.Text='' then
        begin
             Application.MessageBox(pchar('Debe escoger un Ambito'),'Error en Ambito',mb_iconerror);
             Bandera:=false;
             exit;
        end;
     // TIPO DE ELEMENTO *************************************************************
     if TipoElemento.Text='' then
        begin
             Application.MessageBox(pchar('Debe escoger un tipo de elemento'),'Error en Tipo de elemento',mb_iconerror);
             Bandera:=false;
             exit;
        end;
     // DESCRIPCION MANTENIMIENTO **********************************************
     if DBMemoDescripcion.Text='' then
        begin
             Application.MessageBox(pchar('Debe digitar una descripción'),'Error en Descripción',mb_iconerror);
             Bandera:=false;
             exit;
        end;

     if listaactividadestablecida.Items.Count=0 then
      begin
        Application.MessageBox(pchar('Debe asignar al menos una actividad'),'Error en Actividades',mb_iconerror);
        Bandera:=false;
        exit;
      end;
   end;
    if Bandera=true then
       begin
         if Qbancomantenimiento.State = dsEdit then
           begin
             codigoactividadgrabada:= TStringList.Create;
             operacion:= TStringList.Create;
             x:= 0;
             if QActividadMantenimiento.Active then
               QActividadMantenimiento.Close;
             QActividadMantenimiento.ParamByName('codigo').AsFloat:= Qbancomantenimiento.fieldbyName('codigobancomantenimiento').AsFloat;
             QActividadMantenimiento.Open;
             while not QActividadMantenimiento.Eof do
               begin
                 //codigoactividadgrabada.Add(QActividadMantenimiento.FieldByName('codigoodtactividad').AsString);
                 codigoactividadgrabada.Add(QActividadMantenimiento.fieldbyname('CODIGOSUBACTIVIDADAREAODT').asstring);
                 QActividadMantenimiento.Next;
               end;
             for y:= 0 to codigoactividadgrabada.Count -1 do
               begin
                 x:= 0;
                 f:= false;
                 if codigooperaestablecida.Count > 0 then
                   begin
                     while x <= codigooperaestablecida.Count - 1  do
                       begin
                         temp1:= codigooperaestablecida.Strings[x];
                         temp2:= codigoactividadgrabada.Strings[y];
                         if StrtoInt(temp1) = strtoint(temp2) then
                         //if codigoactividadestablecida.Strings[x] = codigoactividadgrabada.Strings[y] then
                           begin
                             f:= True;
                             codigooperaestablecida.Delete(x);
                             listaactividadestablecida.Items.Delete(x);
                             x:= codigooperaestablecida.Count + 1;
                           end
                         else
                           x:= x + 1;
                       end;
                   end;
                 if f = True then
                   operacion.Add('1')
                 else
                   operacion.Add('2');
               end;
             try
               for y:= 0 to codigoactividadgrabada.Count - 1 do
                 begin
                   if operacion.Strings[y] = '2' then
                     begin
                       QActividadMantenimiento.Locate('codigosubactividadareaodt',codigoactividadgrabada.Strings[y],[]);
                       QActividadMantenimiento.Delete;
//                     QBancoMantenimientos.Locate('codigobancomantenimiento',strtofloat(codigobancomantenimiento.Strings[i]),[]);
                     end;
                 end;
               if codigooperaestablecida.Count > 0 then
                 begin
                   for x:= 0 to codigooperaestablecida.Count -1 do
                     begin
                      // temp2:= codigoactividadestablecida.Strings[x];
                       QActividadMantenimiento.Append;
                       QActividadMantenimientoCODIGOBANCOMANTENIMIENTO.Value:= QbancomantenimientoCODIGOBANCOMANTENIMIENTO.Value;
                     //  QActividadMantenimientoCODIGONIVELTENSION.Value:= niveltension.keyvalue;
                     //  QActividadMantenimientoCODIGOODTOPERA.Value:= ODTOPERA.KeyValue;
                     //  QActividadMantenimientoCODIGOODTACTIVIDAD.Value:= StrtoInt(codigoactividadestablecida.Strings[x]);
                       QActividadMantenimiento.FieldByName('CODIGOSUBACTIVIDADAREAODT').asinteger:= strtoint(codigooperaestablecida.strings[x]);
                       QActividadMantenimiento.FieldByName('NOMBREACTIVIDADMANTENIMIENTO').asstring:= listaactividadestablecida.Items.Strings[x];
                       QActividadMantenimiento.Post;
                     end;
                 end;
               Qbancomantenimiento.Post;

               Qbancomantenimiento.ApplyUpdates;
               QActividadMantenimiento.ApplyUpdates;
               modalresult:= mrok;
               except
                 on e:exception do
                   begin
                     application.MessageBox(pchar('Error en la grabación de los Datos, verifíquelos e intente de nuevo'),'Error en Grabación',mb_iconerror);
                     exit;
                   end;
             end;
           end
         else
           begin

             try
            // Qbancomantenimiento.Post;
            //QMantenimiento.Post;
            //QActividadMantenimiento.Database.StartTransaction;

               for i:= 0 to listaactividadestablecida.Items.Count-1 do
                 begin
                   QActividadMantenimiento.Append;
                   QActividadMantenimientoCODIGOBANCOMANTENIMIENTO.Value:= QbancomantenimientoCODIGOBANCOMANTENIMIENTO.Value;
                   //QActividadMantenimientoCODIGONIVELTENSION.Value:= niveltension.keyvalue;
                  // QActividadMantenimientoCODIGOODTOPERA.Value:= ODTOPERA.KeyValue;
                  // QActividadMantenimientoCODIGOODTACTIVIDAD.Value:= StrtoInt(codigoactividadestablecida.Strings[i]);
                   QActividadMantenimiento.FieldByName('CODIGOSUBACTIVIDADAREAODT').asstring:= codigooperaestablecida.Strings[i];
                   QActividadMantenimiento.fieldbyname('NOMBREACTIVIDADMANTENIMIENTO').asstring:= listaactividadestablecida.Items.Strings[i];
                   QActividadMantenimiento.Post;

                 end;

               Qbancomantenimiento.Post;
               
               Qbancomantenimiento.ApplyUpdates;
               QActividadMantenimiento.ApplyUpdates;
               modalresult:= mrok;

           // QMantenimiento.Database.Commit;
            //QActividadMantenimiento.Database.Commit;
           // modalresult:=mrok;
             except
               on e:exception do
                 begin
            //QTarea.Database.Rollback;
           // QActividadMantenimiento.CancelUpdates;
           // Qbancomantenimiento.CancelUpdates;
                   application.MessageBox(pchar('Error en la grabación de los Datos, verifíquelos e intente de nuevo'),'Error en Grabación',mb_iconerror);
           // application.MessageBox(pchar(e.message),'Error',mb_iconerror);
          //  modalresult:= mrcancel;
                   exit;
                 end;
             end;

        {Qbancomantenimiento.Post;
        Qbancomantenimiento.ApplyUpdates;
        QActividadMantenimiento.ApplyUpdates;
        modalresult:= mrok;}
           end;
       end;
end;

procedure Tfbancomantenimiento.QActividadMantenimientoNewRecord(
  DataSet: TDataSet);
var qry4:Tquery;
begin
 qry4:= TQuery.Create(Application);
 qry4.DatabaseName:='BaseDato';
 qry4.SQL.Clear;
 qry4.SQL.Add('select numeroactividad.nextval from dual');
 qry4.Open;
 QActividadMantenimiento.FieldByName('CODIGOACTIVIDADMANTENIMIENTO').asfloat:= qry4.Fields[0].AsFloat;
end;

procedure Tfbancomantenimiento.QActividadMantenimientoBeforePost(
  DataSet: TDataSet);
begin
 //QActividadMantenimientoCODIGOBANCOMANTENIMIENTO.Value:= QbancomantenimientoCODIGOBANCOMANTENIMIENTO.Value;
 
end;

procedure Tfbancomantenimiento.SpeedButton2Click(Sender: TObject);
begin
  if MessageDlg('Desea Cancelar la operación?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    ModalResult:= mrCancel;
end;

procedure Tfbancomantenimiento.QbancomantenimientoAfterDelete(
  DataSet: TDataSet);
begin
    { qBancoMantenimiento.ApplyUpdates;
     qBancoMantenimiento.CommitUpdates;}
end;

procedure Tfbancomantenimiento.QbancomantenimientoAfterPost(
  DataSet: TDataSet);
begin
    { qBancoMantenimiento.ApplyUpdates;
     qBancoMantenimiento.CommitUpdates;}
end;

procedure Tfbancomantenimiento.FormShow(Sender: TObject);
begin
    // qOdtOpera.ParamByName('CODIGOUSUARIO').asInteger:= VARCODIGOUSUARIO;
end;

procedure Tfbancomantenimiento.CodigoAmbitoClick(Sender: TObject);
begin
  if qtipoelemento.Active then
    qtipoelemento.Close;
  qtipoelemento.ParamByName('CODIGOAMBITO').asinteger:= codigoambito.KeyValue;
  qtipoelemento.Open;
 {
  if(CodigoAmbito.KeyValue=1)then
  begin
   TipoElementoSub.Visible:=true;
   TipoElemento.Visible:=false;
 {
  //   qTipoElementoSub.close;
   // qTipoElementoSub.Open;
   Tipoelemento.ListSource:=dsTipoElementoSub;
   TipoElemento.KeyField:= 'CodigoTipoElementoSub';
   TipoElemento.ListField:='nombreTipoElementoSub';
}
{  end
 else if(CodigoAmbito.KeyValue=2)then
  begin
//   qtipoelemento.close;
//   qtipoelemento.open;
   TipoElemento.Visible:=true;
   TipoElementoSub.Visible:=false;
 {  Tipoelemento.ListSource:=dTipoElemento;
   TipoElemento.KeyField:='CodigoTipoElemento';
   TipoElemento.ListField:='nombreTipoElemento';
 }
//  end}
end;



procedure Tfbancomantenimiento.actividadareaoperaodtClick(Sender: TObject);
begin
  if niveltension.Text='' then
   begin
     Application.MessageBox(pchar('Debe asignar primero un nivel de tensión'),'Error en Actividades disponibles',mb_iconerror);
     exit;
   end
 else
   ObtenerActividades;
end;

end.
