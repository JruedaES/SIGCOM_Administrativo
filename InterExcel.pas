unit InterExcel;

interface

uses
   EXCEL_TLB, ComObj, windows, sysutils;


type
   EduExcel = class(TObject)
   public
          ArchivoPlantilla:string;
	  xla : _Application;
	  xlw : _Workbook;
          xls : _WorkSheet;
          LCID : integer;
          constructor Create;
          procedure AsignarPlantilla(Arch:string);
          procedure Visible(activo: Boolean);
          procedure Salvar(Arch:string);
          procedure Terminar;
          procedure Asignar(Fila,Columna:Integer;Valor:string);overload;
          procedure Asignar(Celda,Valor:string);overload;
          function  Obtener(Fila,Columna:Integer):string;overload;
          function  Obtener(Celda:string):string;overload;
          procedure HojaActiva(NombreHoja:string);
end;



implementation

{ EduExcel }

procedure EduExcel.AsignarPlantilla(Arch: string);
begin
xlw := xla.Workbooks.Add(Arch, LCID);
ArchivoPlantilla:=Arch;
end;

constructor EduExcel.Create;
begin
    xla:=Excel_TLB.CoApplication_.Create;
    LCID := GetUserDefaultLCID;
end;

procedure EduExcel.Salvar(Arch: string);
begin

xlw.SaveAs( Arch,
            xlWorkbookNormal,
            '',
            '',
            False,
            False,
            xlNoChange,
            xlLocalSessionChanges,
            true,
            0,
            0,
            LCID);

end;

procedure EduExcel.Visible(activo: Boolean);
begin
       xla.Visible[LCID] := activo;
end;

procedure EduExcel.Terminar;
begin
       xla.Quit;
end;


procedure EduExcel.Asignar(Fila, Columna: Integer; valor:string);
begin
   xla.Cells.Item[Fila, Columna].Value :=valor
end;

procedure EduExcel.Asignar(Celda, Valor: string);
begin
   xla.Range[Celda, Celda].Value2 := Valor;
end;

procedure EduExcel.HojaActiva(NombreHoja: string);
begin
       xls:=xlw.Worksheets.Item[NombreHoja] as _WorkSheet;
       xls.Activate(LCid);
end;


function EduExcel.Obtener(Fila, Columna: Integer): string;
begin
   Result:=xla.Cells.Item[Fila, Columna].Value;
end;

function EduExcel.Obtener(Celda: string): string;
begin
    Result:=xla.Range[Celda, Celda].Value2;
end;

end.



