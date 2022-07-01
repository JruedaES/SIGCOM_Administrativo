unit UTareaMtto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons;

type
  TFTareaMtto = class(TForm)
    PanelCentral: TPanel;
    LabelCodigoTarea: TLabel;
    ECodigoTarea: TDBEdit;
    LabelNombreTarea: TLabel;
    ENombreTarea: TDBEdit;
    LabelCodigoEstadoTarea: TLabel;
    LabelFrecuencia: TLabel;
    EFrecuencia: TDBEdit;
    PanelSuperior: TPanel;
    PanelInferior: TPanel;
    LabelTitulo: TLabel;
    UpdateTarea: TUpdateSQL;
    DSTarea: TDataSource;
    GroupBoxFechas: TGroupBox;
    LabelFechaInicial: TLabel;
    LabelFechaFinal: TLabel;
    LabelFechaAlarma: TLabel;
    LabelFechaHora: TLabel;
    GroupBoxDescripcion: TGroupBox;
    MDescripcion: TDBMemo;
    MEFechaFinal: TMaskEdit;
    MEFechaAlarma: TMaskEdit;
    PanelInferiorFinal: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    CodigoEstado: TDBLookupComboBox;
    QEstado: TQuery;
    DSEstado: TDataSource;
    MEFechaInicial: TMaskEdit;
    QTarea: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure QTareaAfterPost(DataSet: TDataSet);
    procedure QTareaBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   FTareaMtto: TFTareaMtto;

implementation

{$R *.DFM}
//******************************************************************************
procedure TFTareaMtto.FormCreate(Sender: TObject);
begin
     {if QTarea.Active=True then
        begin
        QTarea.Close;
        end;
        //////////////////
     QTarea.Open;}
end;
//******************************************************************************
procedure TFTareaMtto.QTareaAfterPost(DataSet: TDataSet);
begin
     QTarea.ApplyUpdates;
     QTarea.CommitUpdates;
end;
//******************************************************************************
procedure TFTareaMtto.QTareaBeforePost(DataSet: TDataSet);
begin
     QTarea.FieldByName('FECHAINICIAL').AsDateTime:=StrToDateTime(MEFechaInicial.Text);
     QTarea.FieldByName('FECHAFINAL').AsDateTime:=StrToDateTime(MEFechaFinal.Text);
     if MEFechaAlarma.Text<> '  /  /         :  ' then
      QTarea.FieldByName('FECHAALARMA').AsDateTime:=StrToDateTime(MEFechaAlarma.Text)
     Else
      QTarea.FieldByName('FECHAALARMA').value:=Null;
     //QTarea.FieldByName('CODIGOTIPOTAREA').Value:=1;
     //QTarea.FieldByName('CODIGOUSUARIO').Value:=1;
end;
//******************************************************************************
end.
