unit uBuscarMaterial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Grids, DBGrids, Buttons, ExtCtrls, DB, DBTables,
  Menus, utnZommer;

type
  TfBuscarMaterial = class(TForm)
    Panel1: TPanel;
    BtnInsert: TSpeedButton;
    BtnEdit: TSpeedButton;
    BtnDelete: TSpeedButton;
    DBNavigator1: TDBNavigator;
    BitBtnCerrar: TBitBtn;
    Panel2: TPanel;
    DBGridBuscarMaterial: TDBGrid;
    dsqMaterial: TDataSource;
    qMaterial: TQuery;
    BitBtn2: TBitBtn;
    dsUnidad: TDataSource;
    tUnidad: TTable;
    PopupMenuOrdenar: TPopupMenu;
    Codigo: TMenuItem;
    Descripcion: TMenuItem;
    Valor: TMenuItem;
    BitBtnFiltrar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    BitBtnOrdenar: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Panel4: TPanel;
    Image1: TImage;
    Shape9: TShape;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    DBText1: TDBText;
    DBText2: TDBText;
    Zommer1: TZommer;
    qMaterialCODIGOMATERIAL: TFloatField;
    qMaterialREFERENCIA: TStringField;
    qMaterialNOMBREMATERIAL: TStringField;
    qMaterialCODIGOUNIDAD: TStringField;
    qMaterialNOMBREUNIDAD: TStringField;
    qMaterialVALORUNITARIO: TFloatField;
    qMaterialPESOUNITARIO: TFloatField;
    dblcbMaterial: TDBLookupComboBox;
    procedure BitBtnFiltrar1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure clic(var Msg: TMsg; var Handled: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure BtnInsertClick(Sender: TObject);
    procedure qMaterialBeforeDelete(DataSet: TDataSet);
    procedure qMaterialBeforeEdit(DataSet: TDataSet);
    procedure qMaterialBeforeInsert(DataSet: TDataSet);
    procedure ActualizarListaMaterial;
    procedure BtnDeleteClick(Sender: TObject);
    procedure BtnEditClick(Sender: TObject);
    procedure BitBtnOrdenar1Click(Sender: TObject);
    procedure BitBtnBuscar1Click(Sender: TObject);
    procedure Ordenar(sCriterio: String);
    procedure CodigoClick(Sender: TObject);
    procedure DescripcionClick(Sender: TObject);
    procedure ValorClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure qMaterialAfterScroll(DataSet: TDataSet);
    procedure LimpiarFiltro;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
     Lista, ListaRotulos, ListaDatos, ListaFrom:TStringList;
    { Public declarations }
  end;

var
  fBuscarMaterial: TfBuscarMaterial;
//  ContenidoAct, ContenidoAnt:string;
  ContenidoAct, ContenidoAnt:Integer;
  anterior, actual: TBookmark;
  buf:TKeyboardState;
  sCriterio: string;
function Confirme(Msg: pchar): Boolean;
implementation

uses uFuncionSGD, uBuscaMaterial, uFIMPComunes;

{$R *.DFM}

function Confirme(Msg: pchar): Boolean;
begin
  Result := False;
  if Application.MessageBox(Msg, 'Confirmación', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = MRYES then
     Result := True;
end;

procedure TfBuscarMaterial.Ordenar(sCriterio: String);
begin
  qMaterial.Active := False;
  qMaterial.SQL.Delete(qMaterial.SQL.Count - 1);
  qMaterial.SQL.Add(sCriterio);
  qMaterial.Active := True;
  DBGridBuscarMaterial.SetFocus;
end;

procedure TfBuscarMaterial.BitBtnFiltrar1Click(Sender: TObject);
var FiltroMaterial, Cadena:string;
    Texto:string;
    i:Integer;
begin
  Lista := GetQueryFiltroMaterial(ListaRotulos, ListaDatos, ListaFrom);
  If Lista <> Nil then
   begin
     qMaterial.Close;
     If qMaterial.sql.Count > 8 then LimpiarFiltro;
     Texto:=Lista.Text;
     i:=Pos('M.',Texto);
     while i > 0 do
     begin
       Insert('aterial',Texto,i+1);
       i:=Pos('M.',Texto);
     end;
     i:=Pos('U.',Texto);
     while i > 0 do
     begin
       Insert('nidad',Texto,i+1);
       i:=Pos('U.',Texto);
     end;
     qMaterial.sql.Insert(7,Texto);
     qMaterial.Open;
   end;
end;

procedure TfBuscarMaterial.FormActivate(Sender: TObject);
begin
  anterior:=DBGridBuscarMaterial.DataSource.Dataset.getbookmark;
  actual:=DBGridBuscarMaterial.DataSource.Dataset.getbookmark;
  ContenidoAct:=0;
  ContenidoAnt:=0;
  application.OnMessage:=Clic;
  qMaterial.open;
end;

procedure TfBuscarMaterial.FormShow(Sender: TObject);
begin
  DBGridBuscarMaterial.Setfocus;
end;

procedure TfBuscarMaterial.clic(var Msg: TMsg; var Handled: Boolean);
//  NOTAS:
//  La DBGrid a usarse debe llamarse "DBGridBuscarMaterial"
//
//  La Tabla asociada debe tener el campo "ClavePrincipal"(string)=toda la clave primaria de la tabla
//
//  Debe declararse el preocedimiento:
//  procedure clic(var Msg: TMsg; var Handled: Boolean);
//
//  Requiere las variables globales:
//   ContenidoAct, ContenidoAnt:string;
//   anterior, actual: TBookmark;
//   buf:TKeyboardState;
//
//  Requiere Inicializacion de variables
//   anterior:=DBGridBuscarMaterial.DataSource.Dataset.getbookmark;
//   actual:=DBGridBuscarMaterial.DataSource.Dataset.getbookmark;
//   ContenidoAct:='0';
//   ContenidoAnt:='0';
//   application.OnMessage:=Clic;
//
//  Al destruir la forma:
//   application.OnMessage:=nil;
//
var //StrTem:string;
    StrTem:Integer;
   procedure MarqueUna;
   begin
   GetKeyboardState(buf);
   buf[VK_Shift]:=129;
   SetKeyboardState(buf);
   DBGridBuscarMaterial.perform(WM_KEYDOWN, VK_DOWN, 0);
   buf[VK_Shift]:=0;
   SetKeyboardState(buf);
   end;
begin
  if (Msg.message=WM_LBUTTONUP) and (Msg.hwnd=DBGridBuscarMaterial.handle) then
     begin
     ContenidoAnt:=ContenidoAct;
     ContenidoAct:=DBGridBuscarMaterial.DataSource.Dataset.fieldbyname('CodigoMaterial').AsInteger;
     anterior:=actual;
     actual:=DBGridBuscarMaterial.DataSource.Dataset.getbookmark;
     if (Msg.wParam=MK_SHIFT) then
        begin
        if ContenidoAct<ContenidoAnt then
           begin
           StrTem:=ContenidoAct;
           ContenidoAct:=ContenidoAnt;
           ContenidoAnt:=StrTem;
           DBGridBuscarMaterial.DataSource.Dataset.GotoBookmark(actual);
           end
        else DBGridBuscarMaterial.DataSource.Dataset.GotoBookmark(anterior);
        while not(DBGridBuscarMaterial.DataSource.Dataset.eof) and
          (ContenidoAct<>DBGridBuscarMaterial.DataSource.Dataset.fieldbyname('CodigoMaterial').AsInteger)
          do marqueuna;
        end;
     end;
  Handled:=false;
end;

procedure TfBuscarMaterial.FormDestroy(Sender: TObject);
begin
  Lista.Free;
  ListaRotulos.Free;
  ListaDatos.Free;
  ListaFrom.Free;
  application.OnMessage:=nil;
end;

procedure TfBuscarMaterial.BtnInsertClick(Sender: TObject);
begin
fBuscarMaterial.qMaterialBeforeInsert(qMaterial);
end;

procedure TfBuscarMaterial.qMaterialBeforeDelete(DataSet: TDataSet);
begin
{  if DMOdt.tMaterial.findkey([qMaterial.fieldbyName('CodigoMaterial').asstring]) then
     begin
       try
         DMOdt.tMaterial.Delete;
         ActualizarListaMaterial;
       except
         DMOdt.tMaterial.Cancel;
         Messagedlg('No se puede borrar la ODT.'+chr(13)+'Existen detalles asociados.',mtInformation,[mbOk],0);
       end;
     end;
 }
end;

procedure TfBuscarMaterial.qMaterialBeforeEdit(DataSet: TDataSet);
begin
{  if DMOdt.tMaterial.findkey([qMaterial.fieldbyName('CodigoMaterial').asstring]) then
     begin
       DMOdt.tMaterial.Edit;
       fMaterial := TfMaterial.Create(Application);
       if fMaterial.ShowModal = mrOk then
          ActualizarListaMaterial;
       fMaterial.free;
     end;
 }
end;

procedure TfBuscarMaterial.qMaterialBeforeInsert(DataSet: TDataSet);
begin
{  DMOdt.tMaterial.Insert;
  fMaterial := TfMaterial.Create(Application);
  if fMaterial.ShowModal = mrOk then
     ActualizarListaMaterial;
  fMaterial.free;}
end;

procedure TfBuscarMaterial.ActualizarListaMaterial;
var sCodigo: string;
begin
{  sCodigo := DMOdt.tMaterial.fieldbyName('CodigoMaterial').asstring;
  fBuscarMaterial.qMaterial.Close;
  fBuscarMaterial.qMaterial.Open;
  fBuscarMaterial.qMaterial.locate('CODIGOMATERIAL',sCodigo,[loCaseInsensitive]);}
end;

procedure TfBuscarMaterial.BtnDeleteClick(Sender: TObject);
begin
  if confirme('Desea borrar el Material?') then
      fBuscarMaterial.qMaterialBeforeDelete(qMaterial);
end;

procedure TfBuscarMaterial.BtnEditClick(Sender: TObject);
begin
  fBuscarMaterial.qMaterialBeforeEdit(qMaterial);
end;

procedure TfBuscarMaterial.BitBtnOrdenar1Click(Sender: TObject);
begin
  PopupMenuOrdenar.Popup(Left+BitBtnOrdenar.left+10,Top+BitBtnOrdenar.Top+30);
end;

procedure TfBuscarMaterial.BitBtnBuscar1Click(Sender: TObject);
begin
  FBuscaMaterial := TFBuscaMaterial.Create(Application);
  FBuscaMaterial.dsqMaterial.DataSet := fBuscarMaterial.qMaterial;
  FBuscaMaterial.ShowModal;
  DBGridBuscarMaterial.Setfocus;
  FBuscaMaterial.Free;
end;

procedure TfBuscarMaterial.CodigoClick(Sender: TObject);
begin
  sCriterio := 'ORDER BY CODIGOMATERIAL';
  Descripcion.Checked := False;
  Valor.Checked := False;
  Codigo.Checked := true;
  Ordenar(sCriterio);
end;

procedure TfBuscarMaterial.DescripcionClick(Sender: TObject);
begin
  sCriterio := 'ORDER BY NOMBREMATERIAL';
  Valor.Checked := False;
  Codigo.Checked := False;
  Descripcion.Checked := true;
  Ordenar(sCriterio);
end;

procedure TfBuscarMaterial.ValorClick(Sender: TObject);
begin
  sCriterio := 'ORDER BY VALORUNITARIO';
  Descripcion.Checked := False;
  Codigo.Checked := False;
  Valor.Checked := true;
  Ordenar(sCriterio);
end;

procedure TfBuscarMaterial.Image1Click(Sender: TObject);
begin
 Zommer1.ShowImage(Image1.Picture);
end;

procedure TfBuscarMaterial.qMaterialAfterScroll(DataSet: TDataSet);
Var Referencia : String;
begin
  try
    Referencia := qMaterial.FieldByName('REFERENCIA').AsString;
    Image1.Picture := nil;
    Image1.Picture.LoadFromFile(GetWorkDirectory+'ImagenesMaterial\'+Referencia+'.bmp');
    Zommer1.Caption := qMaterial.FieldByName('NombreMaterial').AsString ;
  except
  end;
end;

procedure TfBuscarMaterial.LimpiarFiltro;
var
 nLineasExtra,i: Byte;
begin
 nLineasExtra := qMaterial.SQL.Count-8;
 if nLineasExtra > 0 then
    for i:=1 to nLineasExtra do
     begin
      qMaterial.SQL.Delete(7);
     end;
end;

procedure TfBuscarMaterial.FormCreate(Sender: TObject);
begin
  ListaRotulos:=TStringList.Create;
  ListaDatos:=TStringList.Create;
  ListaFrom:=TStringList.Create;
end;

procedure TfBuscarMaterial.FormKeyPress(Sender: TObject; var Key: Char);
begin
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

end.
