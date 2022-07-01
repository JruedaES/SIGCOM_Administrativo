unit uProgramarHorarioJob;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, DBCtrls, Mask, ComCtrls,
  RXClock, DBClient, Grids, DBGrids, RXDBCtrl, Menus;

type
  TfuProgramarHorarioJob = class(TForm)
    Panel1: TPanel;
    BtnAceptar: TBitBtn;
    btnCancelar: TBitBtn;
    ppm: TPopupMenu;
    mmBorrar: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Horario: TGroupBox;
    dtp_hora: TDateTimePicker;
    BitBtn1: TBitBtn;
    bbQuitar: TBitBtn;
    cbsTime: TClientDataSet;
    dsTime: TDataSource;
    spCAMBIAR_HORARIO_JOB: TStoredProc;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    rcListadoLecturas: TRxDBGrid;
    procedure BtnAceptarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btagregarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbQuitarClick(Sender: TObject);
    procedure mmBorrarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
  fuProgramarHorarioJob: TfuProgramarHorarioJob;
  sHorarios, HorariosOriginal: String;

implementation

uses
  uFuncionSGD, ConsDll;

{$R *.DFM}

procedure TfuProgramarHorarioJob.BtnAceptarClick(Sender: TObject);
var
  sTextoPregunta: String;
begin

if cbsTime.RecordCount >0 then
begin
  sTextoPregunta :=
    '¿ Esta Seguro que desea cambiar la hora del envio automatico de la información? '
    + chr(13) + ' El proceso tendra consecuencias inmediatas.';

  if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
  begin

    try
      spCAMBIAR_HORARIO_JOB.Close;
      spCAMBIAR_HORARIO_JOB.ParamByName('HORARIOS').AsString := GetHorarios;
      spCAMBIAR_HORARIO_JOB.Prepare;
      spCAMBIAR_HORARIO_JOB.ExecProc;

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
   Application.MessageBox(PChar('Se debe dejar al menos un(1) horario para la generación de la información.'),
          'Información', MB_OK + MB_ICONERROR + MB_DEFBUTTON2);
end;

procedure TfuProgramarHorarioJob.btnCancelarClick(Sender: TObject);
begin
Self.Close;
end;

procedure TfuProgramarHorarioJob.btagregarClick(Sender: TObject);
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

procedure TfuProgramarHorarioJob.FormCreate(Sender: TObject);
var
  qry,qry1: TQuery;
  Listado: TStringList;
begin
  TRY
    Listado := TStringList.Create;

    qry := TQuery.Create(Application);
    qry.DatabaseName := 'BaseDato';
    qry.SQL.Add
      ('SELECT REPEAT_INTERVAL FROM ALL_SCHEDULER_JOBS WHERE JOB_NAME=''JOB_CARGAR_INFORMACION_TI'' ');
    qry.Open;

    HorariosOriginal := StringReplace(qry.fieldbyname('REPEAT_INTERVAL')
      .AsString, ',', '.', [rfReplaceAll, rfIgnoreCase]);

    HorariosOriginal := StringReplace(HorariosOriginal, ';', ',',
      [rfReplaceAll, rfIgnoreCase]);

    Listado.CommaText := HorariosOriginal;

    CargarInformacion(Listado.Values['BYTIME']);
  finally
    qry.Free;
  end;
end;

procedure TfuProgramarHorarioJob.CargarInformacion(Horas: String);
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

     //shortTimeFormat := 'hh nn ss';
     //DateTimeToString(formattedDate, 't', );

    DateTimeToString(formattedDate, 'hh:nn ampm', StrToTime(Target));

    cbsTime.fieldbyname('HORA').AsString := formattedDate;
    cbsTime.Post;

    rcListadoLecturas.DataSource := dsTime;
  end;

end;

function TfuProgramarHorarioJob.RevisarExistenciaEnListado
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


procedure TfuProgramarHorarioJob.bbQuitarClick(Sender: TObject);
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

function TfuProgramarHorarioJob.GetHorarios: String;
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

procedure TfuProgramarHorarioJob.mmBorrarClick(Sender: TObject);
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

procedure TfuProgramarHorarioJob.Button1Click(Sender: TObject);
begin
ShowMessage(GetHorarios);
end;

procedure TfuProgramarHorarioJob.CargarInformacionAltos(Horas: String);
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

    //cbdTimeAltos.Open;
   // cbdTimeAltos.Append;

    Target := copy(Lista[i], 1, 2) + ':' + copy(Lista[i], 3, 2) + ':' +
      copy(Lista[i], 5, 2);

    // ShortTimeFormat := 'hh nn ss';
    // DateTimeToString(formattedDate, 't', );

    DateTimeToString(formattedDate, 'hh:nn ampm', StrToTime(Target));

    //cbdTimeAltos.fieldbyname('HORA').AsString := formattedDate;
    //cbdTimeAltos.Post;
    //rxListadosAltosConsumidores.DataSource := dsTimeAltos;
end;

end;

function TfuProgramarHorarioJob.GetHorariosAltos: String;
var
L : TStringList;
  formattedDate: string;
begin
L := TStringList.Create;
//cbdTimeAltos.First;

{while not cbdTimeAltos.Eof do
begin
ShortTimeFormat := 'hhnnss';
   DateTimeToString(formattedDate, 'hhnnss', StrToTime(cbdTimeAltos.fieldByName('HORA').AsString));
   L.Add(formattedDate);
   cbdTimeAltos.Next;
end; }
L.Sort;
Result :=  L.CommaText;
end;

procedure TfuProgramarHorarioJob.BorrarHorario1Click(Sender: TObject);
var
  sTextoPregunta: String;
begin
  sTextoPregunta :=
    '¿ Esta Seguro que desea borrar el horario seleccionado? ';

  if Application.MessageBox(PChar(sTextoPregunta), 'Confirmación',
    MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
  begin
//cbdTimeAltos.Delete;
   end;

end;

end.
