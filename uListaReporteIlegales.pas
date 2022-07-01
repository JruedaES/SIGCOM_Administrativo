unit uListaReporteIlegales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, TeEngine, Series, TeeProcs, Chart, ComCtrls,
  ToolWin, RXDBCtrl,Registry, Grids, DBGrids, Mask, DBCtrls, ImgList;

type
  TfListaReporteIlegales = class(TFdSgdListaBase)
    iLista: TImageList;
    ImageList1: TImageList;
    OpenDialog1: TOpenDialog;
    SaveDialog1_1: TSaveDialog;
    dsCiclo: TDataSource;
    Panel4: TPanel;
    dbgReportes: TRxDBGrid;
    qReportes: TQuery;
    dsReportes: TDataSource;
    qReportesLAT: TStringField;
    qReportesLNG: TStringField;
    qReportesOBSERVACION: TStringField;
    qReportesCODITINERARIO: TStringField;
    qReportesFECHAHORA: TDateTimeField;
    qReportesCONSECUTIVO: TStringField;
    qReportesCLAVEANTERIORLEIDO: TStringField;
    qReportesNOMBREGRUPOTRABAJO: TStringField;
    qReportesCODIGOSEDEOPERATIVA: TFloatField;
    qReportesSEDE: TStringField;
    sbVistaPreliminarVL: TSpeedButton;
    Panel5: TPanel;
    qReportesCODIGOAPOYO: TFloatField;
    qReportesCLAVE: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure LimpiarFiltro;
    function GetFechaHora: String;
    procedure FormCreate(Sender: TObject);
    procedure sbVistaPreliminarVLClick(Sender: TObject);
    procedure SBBuscaElementoCartografiaClick(Sender: TObject);
    procedure qReportesAfterScroll(DataSet: TDataSet);
    procedure sbExportarClick(Sender: TObject);

  private
    { Private declarations }
    vFile, destino, aptos, erroneos: TStringList;


  

  public
    { Public declarations }
    Lista, ListaFrom, ListaRotulo, ListaOrden, ListaDatos: TStringList;
     procedure CargarVistaPreliminar (CodApoyo: string);

    Procedure Filtrar;


  end;

var
  fListaReporteIlegales: TfListaReporteIlegales;

implementation

uses uFormaFecha, uFIMPAdministrativo, uFormaEspere, uGaleriaPreliminar;

{$R *.DFM}

procedure TfListaReporteIlegales.FormShow(Sender: TObject);
begin
  Filtrar;
  dbgReportes.setFocus;
  
end;

procedure TfListaReporteIlegales.SBFiltrarClick(Sender: TObject);
begin
Filtrar;
  
end;


procedure TfListaReporteIlegales.Filtrar;
Var
  CadFrom, s: String;
  Valor: Integer;
begin



  Lista := GetQueryFiltroIlegales(ListaRotulo, ListaDatos, ListaFrom);
  If Lista <> Nil then
  begin
    qReportes.close;
    LimpiarFiltro;
    qReportes.SQL.Insert(23, Lista.text);
    qReportes.open;
  end
end;





procedure TfListaReporteIlegales.LimpiarFiltro;
var
  nLineasExtra, i: byte;
begin
  nLineasExtra := qReportes.SQL.Count - 23;
  if nLineasExtra > 0 then
    for i := 1 to nLineasExtra do
    begin
      qReportes.SQL.delete(23);
    end;
end;





function TfListaReporteIlegales.GetFechaHora: String;
begin
  fFormaFecha := TfFormaFecha.Create(Application);
  fFormaFecha.height := 291;
  if fFormaFecha.ShowModal = mrOk then
    result := DateTimetoStr(fFormaFecha.Date)
  else
    result := sFecha;
  fFormaFecha.Free;
end;







procedure TfListaReporteIlegales.FormCreate(Sender: TObject);
begin
  destino := TStringList.Create;
  vFile := TStringList.Create;
  Lista := TStringList.Create;
  ListaFrom := TStringList.Create;
  ListaRotulo := TStringList.Create;
  ListaDatos := TStringList.Create;
  ListaOrden := TStringList.Create;

end;

procedure TfListaReporteIlegales.sbVistaPreliminarVLClick(Sender: TObject);
var Registro : TRegIniFile;
i: integer;
begin

     IF sbVistaPreliminarVL.Down = true then
     Begin
          if Assigned(fGaleriaPreliminar) then
          begin
          fGaleriaPreliminar := NIL;
          fGaleriaPreliminar.Free;
          end;
     Panel5.visible:= true;
     CargarVistaPreliminar(qReportes.FieldByName('CONSECUTIVO').AsString);
     end
     else  Panel5.visible:= false;
end;

procedure TfListaReporteIlegales.CargarVistaPreliminar(CodApoyo: string);
var
  CodigoApoyo: string;
  i: Integer;
begin

       CodigoApoyo:= qReportes.FieldByName('CONSECUTIVO').AsString;
       if  CodigoApoyo <> '' then
       begin
           if  not Assigned(fGaleriaPreliminar) then
           begin
             fGaleriaPreliminar:= TfGaleriaPreliminar.CreateByparametros(Application, CodigoApoyo);
             fGaleriaPreliminar.BanderaIlegales:= TRUE;
             fGaleriaPreliminar.CoolBar3.Bands[0].Text := 'Fotos de Ilegales';
           fGaleriaPreliminar.TipoDeFoto := '16';
           fGaleriaPreliminar.FechaLectura := qReportes.FieldByName('FECHAHORA').AsString;
           end
           else
           begin
             fGaleriaPreliminar.Align :=alClient;
             fGaleriaPreliminar.FechaLectura := qReportes.FieldByName('FECHAHORA').AsString;
             fGaleriaPreliminar.TipoDeFoto := '16';
            fGaleriaPreliminar.MostrarVistaPreliminar(CodigoApoyo);
           end;

           fGaleriaPreliminar.ManualDock(Panel5);
           fGaleriaPreliminar.Show;
           fGaleriaPreliminar.Zommer1.Caption := 'Foto de Ilegales';

       end;
end;

procedure TfListaReporteIlegales.SBBuscaElementoCartografiaClick(
  Sender: TObject);
begin
if not qReportes.fieldByName('CLAVEANTERIORLEIDO').IsNull  then
BuscarApoyo(qReportes.fieldByName('CODIGOAPOYO').AsString, true)
else Application.MessageBox(PChar('Este reporte no contiene la información suficiente para realizar la operación'),PChar('Error'),MB_OK+MB_ICONERROR);
end;

procedure TfListaReporteIlegales.qReportesAfterScroll(DataSet: TDataSet);
begin
  inherited;
IF  Panel5.visible THEN
 BEGIN
 fGaleriaPreliminar := NIL;
fGaleriaPreliminar.Free;
  CargarVistaPreliminar(qReportes.FieldByName('CONSECUTIVO').AsString);
end;
end;

procedure TfListaReporteIlegales.sbExportarClick(Sender: TObject);
var
  Lista1,Lista2 : TStringList;
begin
sbVistaPreliminarVL.Down := False;
Panel5.visible:= false;

fFormaEspere := TfFormaEspere.Create(Application);
fFormaEspere.ProgressBar1.Max := 100;
fFormaEspere.lbMotivo.Caption := 'Generando Archivo...';
fFormaEspere.Show;
fFormaEspere.Refresh;
fFormaEspere.ProgressBar1.Position := 1;
fFormaEspere.Refresh;

     Lista1 := TStringList.Create;
     Lista2 := TStringList.Create;


     Lista2.Clear;
     qReportes.First;
     fFormaEspere.lbMotivo.Caption := 'Recopilando información...';
     fFormaEspere.ProgressBar1.Position := 3;
     fFormaEspere.Refresh;
     Lista1.Clear;
     Lista1.Add('Nis Rad');
     Lista1.Add('Clave');
     Lista1.Add('Codigo Itinerario');
     Lista1.Add('Fecha de Cargue');
     Lista1.Add('Inspector de Lectura');
     Lista1.Add('Sede Operativa');
     Lista1.Add('Observación');
     Lista1.Add('Latitud');
     Lista1.Add('Longitud');
     Lista2.add(Lista1.CommaText);


     while not qReportes.Eof do
     begin
     Lista1.Clear;
     Lista1.Add(qReportes.fieldByName('CLAVEANTERIORLEIDO').AsString);
     Lista1.Add(qReportes.fieldByName('CLAVE').AsString);
     Lista1.Add(qReportes.fieldByName('CODITINERARIO').AsString);
     Lista1.Add(qReportes.fieldByName('FECHAHORA').AsString);
     Lista1.Add(qReportes.fieldByName('NOMBREGRUPOTRABAJO').AsString);
     Lista1.Add(qReportes.fieldByName('SEDE').AsString);
     Lista1.Add(qReportes.fieldByName('OBSERVACION').AsString);
     Lista1.Add(qReportes.fieldByName('LAT').AsString);
     Lista1.Add(qReportes.fieldByName('LNG').AsString);
     Lista2.add(Lista1.CommaText);

fFormaEspere.lbMotivo.Caption := 'Generando datos...';
fFormaEspere.ProgressBar1.Position := fFormaEspere.ProgressBar1.Position+1;
fFormaEspere.Refresh;

     qReportes.Next;
     end;
     fFormaEspere.free;




  if SaveDialog1.Execute then
  begin
  Lista2.SaveToFile(SaveDialog1.FileName);
  end;
  qReportes.EnableControls;
  Lista1.Free;
  Lista2.Free;

end;

end.
