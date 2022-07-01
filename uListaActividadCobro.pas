unit uListaActividadCobro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls;

type
  TfListaActividadCobro = class(TFdSgdListaBase)
    qListaActividadCobro: TQuery;
    RxDBGrid1: TRxDBGrid;
    Panel4: TPanel;
    DBText1: TDBText;
    Label1: TLabel;
    sbInsertar: TSpeedButton;
    sbEditar: TSpeedButton;
    qListaActividadCobroCODIGOADMINISTRATIVO: TFloatField;
    qListaActividadCobroNOMBREADMINISTRATIVO: TStringField;
    qListaActividadCobroCODIGOODTACTIVIDADCOBRO: TFloatField;
    qListaActividadCobroNOMBREODTACTIVIDADCOBRO: TStringField;
    qListaActividadCobroVALORNORMAL: TFloatField;
    qListaActividadCobroVALORFESTIVO: TFloatField;
    qTotalesTOTAL: TFloatField;
    procedure sbInsertarClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure RxDBGrid1DblClick(Sender: TObject);
    procedure SBFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    Lista,ListaFrom : TStringList;
    procedure LimpiarFiltro;      
    procedure Filtrar;
  end;

var
  fListaActividadCobro: TfListaActividadCobro;

implementation

uses uActividadCobro, uFIMPComunes;

{$R *.DFM}

procedure TfListaActividadCobro.sbInsertarClick(Sender: TObject);
begin
  inherited;
  try
    fActividadCobro:=TfActividadCobro.Create(Application);
    with fActividadCobro do
    begin
       qActividadCobro.Close;
       qActividadCobro.ParamByName('CODIGOADMINISTRATIVO').AsString:='-99999';
       qActividadCobro.ParamByName('CODIGOODTACTIVIDADCOBRO').AsString:='-99999';
       qActividadCobro.Open;
       qActividadCobro.Insert;
    if ShowModal=MrOK then
    begin
       qListaActividadCobro.Close;
       qListaActividadCobro.Open;
       qListaActividadCobro.Locate('CODIGOADMINISTRATIVO;CODIGOODTACTIVIDADCOBRO',
       VarArrayOf([qActividadCobroCODIGOADMINISTRATIVO.AsString,qActividadCobroCODIGOODTACTIVIDADCOBRO.AsString]),[]);
    end;
    end;
  finally
    fActividadCobro.Free;
    fActividadCobro:=nil;
  end;
end;

procedure TfListaActividadCobro.sbEditarClick(Sender: TObject);
begin
  inherited;
    try
    fActividadCobro:=TfActividadCobro.Create(Application);
    with fActividadCobro do
    begin
       qActividadCobro.Close;
       qActividadCobro.ParamByName('CODIGOADMINISTRATIVO').AsString:=
                     qListaActividadCobro.FieldByName('CODIGOADMINISTRATIVO').AsString;
       qActividadCobro.ParamByName('CODIGOODTACTIVIDADCOBRO').AsString:=
                     qListaActividadCobro.FieldByName('CODIGOODTACTIVIDADCOBRO').AsString;
       qActividadCobro.Open;
       qActividadCobro.Edit;
    if ShowModal=MrOK then
    begin
       qListaActividadCobro.Close;
       qListaActividadCobro.Open;
       qListaActividadCobro.Locate('CODIGOADMINISTRATIVO',qActividadCobroCODIGOADMINISTRATIVO.AsString,[]);
    end;
    end;
  finally
    fActividadCobro.Free;
    fActividadCobro:=nil;
  end;
end;

procedure TfListaActividadCobro.RxDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if qListaActividadCobro.FieldByName('CODIGOADMINISTRATIVO').AsString<>'' then
     sbEditarClick(nil);
end;

procedure TfListaActividadCobro.SBFiltrarClick(Sender: TObject);
begin
  Filtrar;
  inherited;  
end;

procedure TfListaActividadCobro.Filtrar;
Var CadFrom : String;
begin
  Lista := GetQueryFiltroActividadCobro(ListaRotulos, ListaDatos, ListaFrom);
  If Lista <> Nil then
   begin
     qListaActividadCobro.Close;
     If qListaActividadCobro.sql.Count > 4 then LimpiarFiltro;
     qListaActividadCobro.SQl.Insert(4,Lista.Text);qTotales.sql.Insert(4,Lista.Text);
     CadFrom := 'FROM ODTACTIVIDADCOBRO O, ADMINISTRATIVO A';
     if ListaFrom.Count > 0 then
        CadFrom := CadFrom + ',' + ListaFrom.Text;
     qListaActividadCobro.SQL[2]:= CadFrom;
     qTotales.SQL[2]:=CadFrom;
     qListaActividadCobro.Open;
     qTotales.Open;
     if qTotales.fieldByName('Total').AsInteger > 1
     then lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + qTotales.fieldByName('Total').AsString+' Registros Encontrados >>'
     else lFiltroDatos.Caption := ' << FILTRO DE DATOS >>    << ' + qTotales.fieldByName('Total').AsString+' Registro Encontrado >>';
   end;
end;

procedure TfListaActividadCobro.FormCreate(Sender: TObject);
begin
  inherited;
  ListaFrom := TStringList.Create;
end;

procedure TfListaActividadCobro.LimpiarFiltro;
var  nLineasExtra,i: Byte;
begin
  nLineasExtra := qListaActividadCobro.SQL.Count-4;
  if nLineasExtra > 0 then
  begin
    for i:=1 to nLineasExtra do
    begin
      qListaActividadCobro.SQL.Delete(4);
      qTotales.SQL.Delete(4);
    end;
  end;
end;

procedure TfListaActividadCobro.FormShow(Sender: TObject);
begin
  inherited;
  qListaActividadCobro.Open;
  AjusteFiltro;
end;

end.
