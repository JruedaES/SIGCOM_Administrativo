unit uProgramacionEmpleadoGrupo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls, Db, ExtCtrls, Grids, DBGrids, RXDBCtrl, dbTables;

type
  TFProgramacionEmpleadoGrupo = class(TForm)
    dsProgramacion: TDataSource;
    Label1: TLabel;
    dbeCodigoProgramacion: TDBEdit;
    dbeNombreProgramacion: TDBEdit;
    Label2: TLabel;
    dsGrupo: TDataSource;
    dbeCodigoGrupo: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    dbeNombreGrupo: TDBEdit;
    RxDBGrid1: TRxDBGrid;
    DBNavigator1: TDBNavigator;
    Panel18: TPanel;
    dsProgramacionEmpleado: TDataSource;
    procedure RxDBGrid1EditButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FProgramacionEmpleadoGrupo: TFProgramacionEmpleadoGrupo;

implementation

uses uCrearProgramacion, uBuscarEmpleado, uFiltroEmpleado;

{$R *.DFM}

procedure TFProgramacionEmpleadoGrupo.RxDBGrid1EditButtonClick(
  Sender: TObject);
var I,J:Integer;
    Query : TQuery;
    Encontrado: Boolean;
begin
  fBuscarEmpleado:=TfBuscarEmpleado.Create(Application);
  Query := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  Query.SQL.Add('SELECT CODIGOEMPLEADO FROM PROGRAMACIONEMPLEADO');
  Query.SQL.Add('WHERE CODIGOPROGRAMACION = ' + dbeCodigoProgramacion.Text);
  Query.Open;
  while not Query.Eof do
  begin
    fBuscarEmpleado.ListaEmpleados.Add(Query.FieldByName('CODIGOEMPLEADO').AsString);
    Query.Next;
  end;
  if FCrearProgramacion.qProgramacionGrupoCODIGOADMINISTRATIVO.AsString <> '' then
  begin
    FFiltroEmpleado.tdFiltroEmpleado.Edit;
    FFiltroEmpleado.tdFiltroEmpleadoCODIGOADMINISTRATIVO.AsString:=
                                             FCrearProgramacion.qProgramacionGrupoCODIGOADMINISTRATIVO.AsString;
    FFiltroEmpleado.BitBtnFiltrarClick(nil);
  end;

  try
  if fBuscarEmpleado.ShowModal=MrOK then
  begin
     if fBuscarEmpleado.DBGrid1.SelectedRows.Count > 0
        then
         begin
           for i:=0 to fBuscarEmpleado.DBGrid1.SelectedRows.Count-1 do
             begin
               fBuscarEmpleado.qListaEmpleado.BookMark:=fBuscarEmpleado.DBGrid1.SelectedRows.Items[i];
               try
               if (RxDBGrid1.Fields[0].Text<>'')
                then FCrearProgramacion.qProgramacionEmpleadoGrupo.Edit
                else
                begin
                   if FCrearProgramacion.qProgramacionEmpleadoGrupo.State in [dsInsert] then
                      FCrearProgramacion.qProgramacionEmpleadoGrupo.Cancel;
                   FCrearProgramacion.qProgramacionEmpleadoGrupo.Insert;
                end;
               Encontrado := False;
               for J:=0 to fBuscarEmpleado.ListaEmpleados.Count - 1 do
               begin
                 if fBuscarEmpleado.ListaEmpleados[J] = fBuscarEmpleado.qListaEmpleado.FieldByName('CODIGOEMPLEADO').asstring then
                 begin
                   Encontrado := True;
                   Break;
                 end;  
               end;
               if not Encontrado then
               begin
                 FCrearProgramacion.qProgramacionEmpleadoGrupo.FieldByName('CODIGOEMPLEADO').asstring := fBuscarEmpleado.qListaEmpleado.fieldByName('CODIGOEMPLEADO').asstring;
                 FCrearProgramacion.qProgramacionEmpleadoGrupo.Post;
               end
               else
                 FCrearProgramacion.qProgramacionEmpleadoGrupo.Cancel;

                 FCrearProgramacion.qProgramacionEmpleadoGrupo.Insert;
               finally
               end;
           end;
           if FCrearProgramacion.qProgramacionEmpleadoGrupo.State in [dsInsert] then FCrearProgramacion.qProgramacionEmpleadoGrupo.Cancel;
           FCrearProgramacion.qProgramacionEmpleadoGrupo.Close;
           FCrearProgramacion.qProgramacionEmpleadoGrupo.Open;
           if (not FCrearProgramacion.qProgramacionEmpleadoGrupo.IsEmpty) and (FCrearProgramacion.qProgramacionEmpleadoGrupo.FieldByName('CODIGOEMPLEADO').AsString = '') then
              FCrearProgramacion.qProgramacionEmpleadoGrupo.Delete;
        end;
  end;
  finally
    fBuscarEmpleado.Free;
  end;
end;

end.
