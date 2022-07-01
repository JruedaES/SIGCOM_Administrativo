unit uMaterialesEstructura;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ExtCtrls, Grids, DBGrids, RXDBCtrl, utnZommer, StdCtrls,
  Buttons;

type
  TfMaterialesEstructura = class(TForm)
    DBGridBuscarMaterial: TRxDBGrid;
    Image1: TImage;
    qMaterialesEstructura: TQuery;
    qMaterialesEstructuraNOMBREMATERIAL: TStringField;
    qMaterialesEstructuraCANTIDAD: TFloatField;
    qMaterialesEstructuraCODIGOUNIDAD: TStringField;
    DataSource1: TDataSource;
    qMaterialesEstructuraREFERENCIA: TStringField;
    Zommer1: TZommer;
    qMaterialesEstructuraCODIGOMATERIAL: TFloatField;
    qMaterialesEstructuraPRECIO: TFloatField;
    qMaterialesEstructuraPESO: TFloatField;
    Panel1: TPanel;
    Bevel2: TBevel;
    BitBtnCerrar: TBitBtn;
    BitBtn2: TBitBtn;
    qMaterialesEstructuraCodigoMaterialEssa: TFloatField;
    procedure qMaterialesEstructuraAfterScroll(DataSet: TDataSet);
    procedure Image1Click(Sender: TObject);
    procedure qMaterialesEstructuraCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
     // carlos fpd
  end;

var
  fMaterialesEstructura: TfMaterialesEstructura;

implementation

uses uFuncionSGD;

{$R *.DFM}

procedure TfMaterialesEstructura.qMaterialesEstructuraAfterScroll(DataSet: TDataSet);
begin
  try
    Image1.Picture := nil;
    Image1.Picture.LoadFromFile(GetWorkDirectory+'ImagenesMaterial\'+qMaterialesEstructura.FieldByName('Referencia').AsString+'.bmp');
    Zommer1.Caption := qMaterialesEstructura.FieldByName('NombreMaterial').AsString;
  except
    Image1.Picture := nil;
  end;
end;

procedure TfMaterialesEstructura.Image1Click(Sender: TObject);
begin
 try
   Zommer1.ShowImage(Image1.Picture);
 except
 end;

end;

procedure TfMaterialesEstructura.qMaterialesEstructuraCalcFields(
  DataSet: TDataSet);
var query:tquery;
begin
  query:=TQuery.create(self);
  query.DatabaseName:='BaseDato';
  query.sql.add('SELECT CODIGOMATERIAL FROM MATERIALESSA WHERE CODIGOMATERIALESTRUCTURA='+qMaterialesEstructuraCODIGOMATERIAL.AsString);
  query.Open;
  qMaterialesEstructuraCodigoMaterialEssa.AsString:=query.fields[0].AsString;
  query.free;
end;

end.
