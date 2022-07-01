unit uListaModificacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  udSgdListaBase, UTrCVS, DBTables, Db, Digisoft, StdCtrls, ExtCtrls,
  UtdNavigator, Buttons, Grids, DBGrids, RXDBCtrl, DBCtrls;

type
  TfListaModificacion = class(TFdSgdListaBase)
    qListaModificacion: TQuery;
    Panel4: TPanel;
    RxDBGrid1: TRxDBGrid;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    DBText2: TDBText;
    sbInsertar: TSpeedButton;
    sbEditar: TSpeedButton;
    qListaModificacionCODIGOMODIFICACION: TFloatField;
    qListaModificacionFECHATERMINACION: TDateTimeField;
    qListaModificacionCODIGOADMINISTRATIVO: TFloatField;
    qListaModificacionNOMBREADMINISTRATIVO: TStringField;
    qListaModificacionDIRECCION: TStringField;
    qListaModificacionNOMBRETIPOMODIFICACION: TStringField;
    qListaModificacionCODIGOCIRCUITO1: TStringField;
    qListaModificacionCODIGOCIRCUITO2: TStringField;
    qListaModificacionCODIGOTRAFODIS: TFloatField;
    qListaModificacionCODIGOPLANCHA: TStringField;
    qListaModificacionCODIGODIGITO: TFloatField;
    qListaModificacionCODIGODILIGENCIO: TFloatField;
    qListaModificacionPOTENCIA: TFloatField;
    qListaModificacionCODIGOTIPOFASE: TStringField;
    qListaModificacionCODIGOTIPODISTRIBUCION: TStringField;
    qListaModificacionNOMBREDIGITO: TStringField;
    qListaModificacionREFERENCIA: TStringField;
    qListaModificacionDESCRIPCION: TStringField;
    sbTraerAlFrente: TSpeedButton;
    procedure sbInsertarClick(Sender: TObject);
    procedure sbEditarClick(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
    procedure RxDBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBGrid1TitleClick(Column: TColumn);
    procedure sbTraerAlFrenteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    sCriterio : String;
    TeclaShift:Boolean;
    ListaOrden:TStringList;
  end;

var
  fListaModificacion: TfListaModificacion;

implementation

uses uModificacion, uBuscaModificacion;

{$R *.DFM}

procedure TfListaModificacion.sbInsertarClick(Sender: TObject);
begin
if (not Assigned(Application.FindComponent('fModificacion') as TForm)) then
begin
    fModificacion:=TfModificacion.Create(Application);
    with fModificacion do
    begin
       qModificacion.Close;
       qModificacion.ParamByName('CODIGOMODIFICACION').AsString:='-99999';
       qModificacion.Open;
       if not qModificacion.Database.InTransaction then
          qModificacion.Database.StartTransaction;
       qModificacion.Insert;
      Show;
    end;
end;
end;

procedure TfListaModificacion.sbEditarClick(Sender: TObject);
begin
if (qListaModificacionCODIGOMODIFICACION.AsString<>'') and (not Assigned(Application.FindComponent('fModificacion') as TForm)) then
begin
    fModificacion:=TfModificacion.Create(Application);
    with fModificacion do
    begin
       qModificacion.Close;
       qModificacion.ParamByName('CODIGOMODIFICACION').AsString:=qListaModificacionCODIGOMODIFICACION.AsString;
       qModificacion.Open;
       if not qModificacion.Database.InTransaction then
          qModificacion.Database.StartTransaction;
       //dbeFecha.Enabled :=False;
       //sbFecha.Enabled  :=False;
       dbeCIA.Enabled   :=False;
       sbDigito.Enabled :=False;
       qModificacion.Edit;
       Show;
    end;
end;    
end;

procedure TfListaModificacion.SBBuscarClick(Sender: TObject);
begin
  fBuscaModificacion:=TfBuscaModificacion.Create(Application);
  fBuscaModificacion.dsqModificacion.DataSet:=qListaModificacion;
  fBuscaModificacion.ShowModal;
  fBuscaModificacion.Free;
  RxDBGrid1.SetFocus;
end;

procedure TfListaModificacion.RxDBGrid1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TGridcoord;
begin
  pt:= RxDBGrid1.MouseCoord(x, y);

  if pt.y=0 then
   begin
      RxDBGrid1.Cursor:=crHandPoint;
      if Shift = [ssShift] then
          TeclaShift:=True
      else
          TeclaShift:=False;
    end
  else
    RxDBGrid1.Cursor:=crDefault;
end;

procedure TfListaModificacion.FormCreate(Sender: TObject);
begin
  inherited;
  ListaOrden:=TStringList.Create;
end;

procedure TfListaModificacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ListaOrden.Free;
  inherited;
end;

procedure TfListaModificacion.RxDBGrid1TitleClick(Column: TColumn);
{$J+}
 const PreviousColumnIndex : integer = -1;
{$J-}
var
  ListaTemp:TStringList;
  i,j:Integer;
  Encontrado:Boolean;
  Sort:String;
begin

  with RxDBGrid1.DataSource.DataSet do
  begin
    try
      RxDBGrid1.Columns[PreviousColumnIndex].title.Font.Style :=
      RxDBGrid1.Columns[PreviousColumnIndex].title.Font.Style - [fsBold];
    except
    end;
    Column.title.Font.Style :=
    Column.title.Font.Style + [fsBold];

    Encontrado:=False;
    if PreviousColumnIndex = Column.Index then
       begin
         Encontrado:=True;
         ListaTemp:=TStringList.Create;
         for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=Column.Field.FieldName then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
              end;
          end;
          ListaTemp.Free;
        end
    else
      begin
          if (not TeclaShift) then
             ListaOrden.Clear;
      end;

    PreviousColumnIndex := Column.Index;
    if (ListaOrden.Count > 0) and (not Encontrado) then
     begin
        ListaTemp:=TStringList.Create;
        Encontrado:=False;
        for i:=0 to ListaOrden.Count - 1 do
          begin
             ListaTemp.CommaText :=ListaOrden[i];
             if ListaTemp[0]=Column.Field.FieldName then
              begin
                if ListaTemp[1]='ASC' then
                   ListaTemp[1]:='DESC'
                else
                   ListaTemp[1]:='ASC';
                ListaOrden[i]:=ListaTemp[0]+','+ListaTemp[1];
                Encontrado:=True;
              end;
          end;
        if (not Encontrado) then
           ListaOrden.Add(Column.Field.FieldName+','+'ASC');
        ListaTemp.Free;
     end;

     if (ListaOrden.Count = 0) then
        ListaOrden.Add(Column.Field.FieldName+','+'ASC');

     qListaModificacion.SQl.Delete(qListaModificacion.SQl.Count - 1);
     Sort:='Order By ';
     for i:=0 to ListaOrden.Count - 1 do
       begin
          ListaTemp:=TStringList.Create;
          ListaTemp.CommaText:=ListaOrden[i];
          if i <> ListaOrden.Count - 1 then
             Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1] + ','
          else
             Sort:=Sort + ListaTemp[0] + ' ' + ListaTemp[1];
          ListaTemp.Free;
       end;

     qListaModificacion.Sql.Add(Sort);
     qListaModificacion.Close;
     qListaModificacion.Open;
  end;

end;

procedure TfListaModificacion.sbTraerAlFrenteClick(Sender: TObject);
begin
  inherited;
  if Assigned(Application.FindComponent('fModificacion') as TForm) then
  begin
    (Application.FindComponent('fModificacion') as TForm).BringToFront;
    (Application.FindComponent('fModificacion') as TForm).WindowState := wsNormal;
  end;
end;

end.
