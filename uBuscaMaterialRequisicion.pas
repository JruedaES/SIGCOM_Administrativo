unit uBuscaMaterialRequisicion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables, Grids, DBGrids, ExtCtrls, Menus;

type
  TfBuscaMaterialRequisicion = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    BitBtn2: TBitBtn;
    BitBtnCerrar: TBitBtn;
    DBGridBuscarMaterial: TDBGrid;
    qPresMate: TQuery;
    dsPresMate: TDataSource;
    qPresMateCODIGOMATERIAL: TFloatField;
    qPresMateNOMBREMATERIAL: TStringField;
    qPresMateCODIGOUNIDAD: TStringField;
    SpeedButton1: TSpeedButton;
    BitBtnOrdenar: TSpeedButton;
    PopupMenuOrdenar: TPopupMenu;
    Codigo: TMenuItem;
    Descripcion: TMenuItem;
    procedure CodigoClick(Sender: TObject);
    procedure DescripcionClick(Sender: TObject);
    procedure Ordenar(sCriterio: String);
    procedure BitBtnOrdenarClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  fBuscaMaterialRequisicion: TfBuscaMaterialRequisicion;
  sCriterio: string;
implementation

uses uBuscaMaterial, uBuscarMaterial;

{$R *.DFM}

procedure TfBuscaMaterialRequisicion.DescripcionClick(Sender: TObject);
begin
  sCriterio := ' ORDER BY NOMBREMATERIAL';
  Codigo.Checked := False;
  Descripcion.Checked := true;
  Ordenar(sCriterio);
end;


procedure TfBuscaMaterialRequisicion.CodigoClick(Sender: TObject);
begin
  sCriterio := ' ORDER BY CODIGOMATERIAL';
  Descripcion.Checked := False;
  Codigo.Checked := true;
  Ordenar(sCriterio);
end;

procedure TfBuscaMaterialRequisicion.Ordenar(sCriterio: String);
begin
  qpresmate.Active := False;
  qpresmate.SQL.Delete(qpresmate.SQL.Count - 1);
  qpresmate.SQL.Add(sCriterio);
  qpresmate.Active := True;
  DBGridBuscarMaterial.SetFocus;
end;

procedure TfBuscaMaterialRequisicion.BitBtnOrdenarClick(Sender: TObject);
begin
PopupMenuOrdenar.Popup(Left+BitBtnOrdenar.left+10,Top+BitBtnOrdenar.Top+30);
end;

procedure TfBuscaMaterialRequisicion.SpeedButton1Click(Sender: TObject);
begin
  FBuscaMaterial := TFBuscaMaterial.Create(Application);
  FBuscaMaterial.dsqMaterial.DataSet := fBuscaMaterialRequisicion.qpresmate ;
  FBuscaMaterial.ShowModal;
  DBGridBuscarMaterial.Setfocus;
  FBuscaMaterial.Free;
end;

end.
