unit uModificarHorarioJob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, DBCtrls, Mask, ComCtrls,
  RXClock, DBClient, Grids, DBGrids, RXDBCtrl, Menus;

type
  TfuModificarHorarioJob = class(TForm)
    Panel1: TPanel;
    BtnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    sp_cambiar_horario: TStoredProc;
    cbsTime: TClientDataSet;
    dsTime: TDataSource;
    ppm: TPopupMenu;
    mmBorrar: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Horario: TGroupBox;
    dtp_hora: TDateTimePicker;
    BitBtn1: TBitBtn;
    bbQuitar: TBitBtn;
    rcListadoLecturas: TRxDBGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    GroupBox1: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    rxListadosAltosConsumidores: TRxDBGrid;
    cbdTimeAltos: TClientDataSet;
    dsTimeAltos: TDataSource;
    sp_sgc_cambiar_horario_job_altos: TStoredProc;
    ppmAltos: TPopupMenu;
    BorrarHorario1: TMenuItem;
    procedure BtnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btagregarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbQuitarClick(Sender: TObject);
    procedure mmBorrarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BorrarHorario1Click(Sender: TObject);
  private
    procedure CargarInformacion(Horas: String);
    procedure CargarInformacionAltos(Horas : String );
   function RevisarExistenciaEnListado(Listado: TClientDataSet;
      FieldName, FileName: String): Boolean;
   function GetHorarios : String;
  function GetHorariosAltos : String;
  public
    { Public declarations }
  end;

var
  fuModificarHorarioJob: TfuModificarHorarioJob;
  sHorarios, HorariosOriginal: String;

implementation

uses
  uFuncionSGD, ConsDll;

{$R *.DFM}

procedure TfuModificarHorarioJob.BtnAceptarClick(Sender: TObject);
var
  sTextoPregunta: String;
begin

if (cbsTime.RecordCount >0) and (cbdTimeAltos.RecordCount >0) then
begin
  sTextoPregunta :=
    '¿ Esta Seguro que desea cambiar la hora del envio automatico de la información de lecturas? '
    + chr(13) + ' El proceso tendra consecuencias inmediatas.';

  if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
  begin

    try
      sp_cambiar_horario.Close;
      sp_cambiar_horario.ParamByName('HORARIOS').AsString := GetHorarios;
      sp_cambiar_horario.Prepare;
      sp_cambiar_horario.ExecProc;

      sp_sgc_cambiar_horario_job_altos.Close;
      sp_sgc_cambiar_horario_job_altos.ParamByName('HORARIOS').AsString := GetHorariosAltos;
      sp_sgc_cambiar_horario_job_altos.Prepare;
      sp_sgc_cambiar_horario_job_altos.ExecProc;

      Application.MessageBox(PChar('El proceso ha finalizado exitosamente!'),
        'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

      Self.close;


      
    except
      on e: EDBEngineError do
      begin
        Application.MessageBox(PChar('Se ha presentado un error ' + e.Message),
          'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
      end;

    end;
  end;

  end
  else
   Application.MessageBox(PChar('Se debe dejar al menos un(1) horario para la generación de la información a inCMS o de Altos Consumidores.'),
          'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
end;

procedure TfuModificarHorarioJob.btnCancelarClick(Sender: TObject);
begin
Self.Close;
end;

procedure TfuModificarHorarioJob.btagregarClick(Sender: TObject);
var
  myDate: TDateTime;
  formattedDate: string;
begin
  myDate := dtp_hora.Time;

  DateTimeToString(formattedDate, 't', myDate);
  DateTimeToString(formattedDate, 'hh:nn ampm', myDate);

  if RevisarExistenciaEnListado(cbsTime, 'HORA', formattedDate) then
  begin

    cbsTime.Open;
    cbsTime.Append;

    cbsTime.fieldbyname('HORA').AsString := formattedDate;
    cbsTime.Post;

    rcListadoLecturas.DataSource := dsTime;
  end
  else
    Application.MessageBox
      (PChar('El horario ya ha sido registrado, intente con uno diferente!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);

end;

procedure TfuModificarHorarioJob.FormCreate(Sender: TObject);
var
  qry,qry1: TQuery;
  Listado: TStringList;
begin
  TRY
    Listado := TStringList.Create;

    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Add
      ('SELECT REPEAT_INTERVAL FROM ALL_SCHEDULER_JOBS WHERE JOB_NAME=''CARGAR_INCMS'' ');
    qry.Open;

    HorariosOriginal := StringReplace(qry.fieldbyname('REPEAT_INTERVAL')
      .AsString, ',', '.', [rfReplaceAll, rfIgnoreCase]);

    HorariosOriginal := StringReplace(HorariosOriginal, ';', ',',
      [rfReplaceAll, rfIgnoreCase]);

    Listado.CommaText := HorariosOriginal;

    CargarInformacion(Listado.Values['BYTIME']);

     qry1 := TQuery.Create(Application);
    qry1.DatabaseName := 'BaseDato';
    qry1.SQL.Add
      ('SELECT REPEAT_INTERVAL FROM ALL_SCHEDULER_JOBS WHERE JOB_NAME=''JOB_SGC_CARGAR_TI_ALTOS'' ');
    qry1.Open;


       HorariosOriginal := StringReplace(qry1.fieldbyname('REPEAT_INTERVAL')
      .AsString, ',', '.', [rfReplaceAll, rfIgnoreCase]);

    HorariosOriginal := StringReplace(HorariosOriginal, ';', ',',
      [rfReplaceAll, rfIgnoreCase]);

    Listado.CommaText := HorariosOriginal;

    CargarInformacionAltos(Listado.Values['BYTIME']);


  finally
    qry.Free;
    qry1.Free;
  end;
end;

procedure TfuModificarHorarioJob.CargarInformacion(Horas: String);
var
  Lista: TStringList;
  i: Integer;
  formattedDate: string;
  Target: String;
begin

  Horas := StringReplace(Horas, '.', ',', [rfReplaceAll, rfIgnoreCase]);

  Lista := TStringList.Create;
  Lista.CommaText := Horas;
  for i := 0 to Lista.Count - 1 do
  begin

    cbsTime.Open;
    cbsTime.Append;

    Target := copy(Lista[i], 1, 2) + ':' + copy(Lista[i], 3, 2) + ':' +
      copy(Lista[i], 5, 2);

    // ShortTimeFormat := 'hh nn ss';
    // DateTimeToString(formattedDate, 't', );

    DateTimeToString(formattedDate, 'hh:nn ampm', StrToTime(Target));

    cbsTime.fieldbyname('HORA').AsString := formattedDate;
    cbsTime.Post;

    rcListadoLecturas.DataSource := dsTime;
  end;

end;

function TfuModificarHorarioJob.RevisarExistenciaEnListado
  (Listado: TClientDataSet; FieldName, FileName: String): Boolean;
begin
  Result := True;
  if Listado.RecordCount > 0 then
  begin
    Listado.First;
    while not Listado.Eof do
    begin

      if Listado.fieldbyname(FieldName).AsString = FileName then
      Begin
        Result := False;
      end;

      Listado.Next;
    end;

  end;

end;


procedure TfuModificarHorarioJob.bbQuitarClick(Sender: TObject);
var
  myDate: TDateTime;
  formattedDate: string;
  sTextoPregunta: String;
begin

  sTextoPregunta :=
    '¿ Esta Seguro que desea borrar el horario seleccionado? ';

  if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
  begin

  myDate := dtp_hora.Time;

  DateTimeToString(formattedDate, 't', myDate);
  DateTimeToString(formattedDate, 'hh:nn ampm', myDate);

  if  NOT RevisarExistenciaEnListado(cbsTime, 'HORA', formattedDate) then
  begin
   cbsTime.Locate('HORA',formattedDate,[]);
   cbsTime.Delete;

    rcListadoLecturas.DataSource := dsTime;
  end
  else
    Application.MessageBox
      (PChar('El horario no existe por lo cual no sera eliminado, intente con uno diferente!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
 end;


end;

function TfuModificarHorarioJob.GetHorarios: String;
var
L : TStringList;
  formattedDate: string;
begin
L := TStringList.Create;
cbsTime.First;

while not cbsTime.Eof do
begin
ShortTimeFormat := 'hhnnss';
   DateTimeToString(formattedDate, 'hhnnss', StrToTime(cbsTime.fieldByName('HORA').AsString));
   L.Add(formattedDate);
   cbsTime.Next;
end;
L.Sort;
Result :=  L.CommaText;

end;

procedure TfuModificarHorarioJob.mmBorrarClick(Sender: TObject);
var
  sTextoPregunta: String;
begin
  sTextoPregunta :=
    '¿ Esta Seguro que desea borrar el horario seleccionado? ';

  if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
  begin
cbsTime.Delete;
   end;
end;

procedure TfuModificarHorarioJob.Button1Click(Sender: TObject);
begin
ShowMessage(GetHorarios);
end;

procedure TfuModificarHorarioJob.CargarInformacionAltos(Horas: String);
var
  Lista: TStringList;
  i: Integer;
  formattedDate: string;
  Target: String;
begin

  Horas := StringReplace(Horas, '.', ',', [rfReplaceAll, rfIgnoreCase]);

  Lista := TStringList.Create;
  Lista.CommaText := Horas;
  for i := 0 to Lista.Count - 1 do
  begin

    cbdTimeAltos.Open;
    cbdTimeAltos.Append;

    Target := copy(Lista[i], 1, 2) + ':' + copy(Lista[i], 3, 2) + ':' +
      copy(Lista[i], 5, 2);

    // ShortTimeFormat := 'hh nn ss';
    // DateTimeToString(formattedDate, 't', );

    DateTimeToString(formattedDate, 'hh:nn ampm', StrToTime(Target));

    cbdTimeAltos.fieldbyname('HORA').AsString := formattedDate;
    cbdTimeAltos.Post;

    rxListadosAltosConsumidores.DataSource := dsTimeAltos;
  end;

end;

procedure TfuModificarHorarioJob.BitBtn2Click(Sender: TObject);
var
  myDate: TDateTime;
  formattedDate: string;
begin
  myDate := DateTimePicker1.Time;

  DateTimeToString(formattedDate, 't', myDate);
  DateTimeToString(formattedDate, 'hh:nn ampm', myDate);

  if RevisarExistenciaEnListado(cbdTimeAltos, 'HORA', formattedDate) then
  begin

    cbdTimeAltos.Open;
    cbdTimeAltos.Append;

    cbdTimeAltos.fieldbyname('HORA').AsString := formattedDate;
    cbdTimeAltos.Post;

    rxListadosAltosConsumidores.DataSource := dsTimeAltos;
  end
  else
    Application.MessageBox
      (PChar('El horario ya ha sido registrado, intente con uno diferente!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);


end;

procedure TfuModificarHorarioJob.BitBtn3Click(Sender: TObject);
var
  myDate: TDateTime;
  formattedDate: string;
  sTextoPregunta: String;
begin

  sTextoPregunta :=
    '¿ Esta Seguro que desea borrar el horario seleccionado? ';

  if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
  begin

  myDate := DateTimePicker1.Time;

  DateTimeToString(formattedDate, 't', myDate);
  DateTimeToString(formattedDate, 'hh:nn ampm', myDate);

  if  NOT RevisarExistenciaEnListado(cbdTimeAltos, 'HORA', formattedDate) then
  begin
   cbdTimeAltos.Locate('HORA',formattedDate,[]);
   cbdTimeAltos.Delete;

    rxListadosAltosConsumidores.DataSource := dsTimeAltos;
  end
  else
    Application.MessageBox
      (PChar('El horario no existe por lo cual no sera eliminado, intente con uno diferente!'),
      'Información', MB_OK + MB_ICONINFORMATION + MB_DEFBUTTON2);
 end;
end;

function TfuModificarHorarioJob.GetHorariosAltos: String;
var
L : TStringList;
  formattedDate: string;
begin
L := TStringList.Create;
cbdTimeAltos.First;

while not cbdTimeAltos.Eof do
begin
ShortTimeFormat := 'hhnnss';
   DateTimeToString(formattedDate, 'hhnnss', StrToTime(cbdTimeAltos.fieldByName('HORA').AsString));
   L.Add(formattedDate);
   cbdTimeAltos.Next;
end;
L.Sort;
Result :=  L.CommaText;
end;

procedure TfuModificarHorarioJob.BorrarHorario1Click(Sender: TObject);
var
  sTextoPregunta: String;
begin
  sTextoPregunta :=
    '¿ Esta Seguro que desea borrar el horario seleccionado? ';

  if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
  begin
cbdTimeAltos.Delete;
   end;

end;

end.
