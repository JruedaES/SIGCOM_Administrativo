unit uElementosConsulta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, StdCtrls, ImgList, ComCtrls, ToolWin, DBTables, ExtCtrls, Grids,
  DBGrids, RXDBCtrl, Buttons;

type
  TfElementosConsulta = class(TForm)
    RxDBGrid1: TRxDBGrid;
    Panel1: TPanel;
    qPrincipal: TQuery;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    tbBuscar: TToolButton;
    ilGeneral: TImageList;
    eBuscar: TEdit;
    dsPrincipal: TDataSource;
    lbuscar: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    BitBtn1: TBitBtn;
    BitBtn31: TBitBtn;
    procedure tbBuscarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn31Click(Sender: TObject);
    procedure RxDBGrid1TitleClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
   FCampoCodigo : String;
   FCampoNombre : String;
   FTabla : String;
   FTitulo : String;
   FMensajeValidacion : String;
   FCodigoCampo: String;
   Fwhere : String;
   ListaOrden : TStringList;
  public
  Codigo : String;
  Nombre : String;
 procedure CambiarQuery;
 function bValidarCampoVacio : Boolean;
 property sCampoCodigo : String Read FCodigoCampo Write FCodigoCampo;
 property sCampoNombre : String Read FCampoNombre Write FCampoNombre;
 property sTabla : String Read FTabla Write FTabla;
 Constructor Create(AOwner: TComponent); overload;
 Constructor Create(AOwner: TComponent ;pTitulo, pTabla , pCampoCodigo, pCampoNombre : String; pWhere : String = '' ); overload;
  end;

var
  fElementosConsulta: TfElementosConsulta;

implementation

{$R *.DFM}

{ TfElementosConsulta }

function TfElementosConsulta.bValidarCampoVacio: Boolean;
begin
Result := False;
FMensajeValidacion := 'Se ha producido un error, el campo de busqueda no puede estar vacio, ingrese otro dato e intente nuevamente';
if  Trim(eBuscar.Text) <> EmptyStr then
Result := True;
end;

procedure TfElementosConsulta.CambiarQuery;
var
  typeColumn: TFieldType;
  Size: integer;
  qvr : TQuery;
begin

     qPrincipal.close;
     qPrincipal.SQL.Strings[1] := 'TO_CHAR('+FCampoCodigo+')' + ' as CODIGO,';
     qPrincipal.SQL.Strings[2] := 'TO_CHAR('+FCampoNombre+')' + ' as NOMBRE';
     qPrincipal.SQL.Strings[4] := FTabla;
     qPrincipal.SQL.Strings[7] := 'AND '+  FWhere;

     qPrincipal.FieldDefs.Clear;
     
    qvr := TQuery.Create(Application);
    qvr.DatabaseName := 'BaseDato';

    qvr.Close;
    qvr.sql.Add
      (' SELECT DISTINCT COLUMN_NAME,DATA_TYPE,DATA_LENGTH FROM ALL_TAB_COLUMNS WHERE TABLE_NAME='''
      + FTabla + '''  AND COLUMN_NAME IN ('+ QuotedStr(FCampoCodigo)+','+QuotedStr(FCampoNombre)+')  ORDER BY 1 ');
    qvr.open;

    while not qvr.Eof do
    begin

      if qvr.FieldByName('DATA_TYPE').AsString = 'VARCHAR2' then
      begin
        typeColumn := ftString;
        Size := qvr.FieldByName('DATA_LENGTH').AsInteger;
      end
      else if qvr.FieldByName('DATA_TYPE').AsString = 'DATE' then
      begin
        typeColumn := ftString;
        Size := 20;
      end
      else if qvr.FieldByName('DATA_TYPE').AsString = 'NUMBER' then
      begin
        typeColumn := ftFloat;
        Size := 0;
      end
      else if qvr.FieldByName('DATA_TYPE').AsString = 'FLOAT' then
      begin
        typeColumn := ftFloat;
          Size := 0;
      end
      else if qvr.FieldByName('DATA_TYPE').AsString = 'CHAR' then
      begin
        typeColumn := ftString;
          Size := qvr.FieldByName('DATA_LENGTH').AsInteger;
      end
      else
      begin
        typeColumn := ftString;
           Size := qvr.FieldByName('DATA_LENGTH').AsInteger;
      end;

      qPrincipal.FieldDefs.Add(qvr.FieldByName('COLUMN_NAME').AsString,
        typeColumn, Size, False);
      qvr.Next;
    end;
   

qPrincipal.open;
end;

constructor TfElementosConsulta.Create(AOwner: TComponent; pTitulo, pTabla,
  pCampoCodigo, pCampoNombre: String ; pWhere : String = '');
begin
  inherited Create(AOwner);
  FTitulo := 'Listado de ' +pTitulo;
  fTabla := pTabla;
  fCampoCodigo := pCampoCodigo;
  FCampoNombre := pCampoNombre;
  FWhere := pWhere;
  CambiarQuery;
end;

constructor TfElementosConsulta.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;


procedure TfElementosConsulta.tbBuscarClick(Sender: TObject);
begin
if bValidarCampoVacio then
begin
qPrincipal.close;
qPrincipal.SQL.Strings[6] := 'AND '+ FCampoCodigo +' LIKE  '+QuotedStr('%' +eBuscar.Text+ '%')+' ';
qPrincipal.open;
end
else
   Application.MessageBox(pchar(FMensajeValidacion),'Error',MB_ICONERROR);

end;

procedure TfElementosConsulta.BitBtn1Click(Sender: TObject);
begin
Codigo := qPrincipal.FieldByName('CODIGO').AsString;
Nombre := qPrincipal.FieldByName('NOMBRE').AsString;
ModalResult := mrOk;
end;

procedure TfElementosConsulta.BitBtn31Click(Sender: TObject);
begin
ModalResult := mrCancel;
end;

procedure TfElementosConsulta.RxDBGrid1TitleClick(Column: TColumn);
var
Nombre : String;
begin
  if Column.Field.FieldKind   = fkData then
  begin
  Nombre := 'qPrincipal';

    qPrincipal.close;
    qPrincipal.SQL.Strings[8] := ' ORDER BY '+Column.Field.FieldName+' '+ListaOrden.Values[Nombre+Column.Field.FieldName]+' ';
    qPrincipal.open;

  if ListaOrden.Values[Nombre+Column.Field.FieldName] = 'DESC' then
  ListaOrden.Values[Nombre+Column.Field.FieldName] := 'ASC'
  else
  ListaOrden.Values[Nombre+Column.Field.FieldName] := 'DESC';
 end;
end;

procedure TfElementosConsulta.FormShow(Sender: TObject);
begin
   ListaOrden := TStringList.Create;
end;

end.
