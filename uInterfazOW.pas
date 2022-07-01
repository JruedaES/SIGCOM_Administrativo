unit uInterfazOW;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBTables, Db, uFuncionSGD;


type
  TfInterfazOW = class(TForm)
    Panel5: TPanel;
    sbClientesnocreados: TSpeedButton;
    BitBtn2: TBitBtn;
    dbdot_ow: TDBGrid;
    dbgClineteEnergis: TDBGrid;
    Panel4: TPanel;
    qOT_OW: TQuery;
    dsOT_OW: TDataSource;
    qODT_OT: TQuery;
    dsODT_OT: TDataSource;
    updODT_OT: TUpdateSQL;
    qODT_OTCODIGO_OT: TFloatField;
    BitBtn1: TBitBtn;
    textobuscado: TEdit;
    SBBuscar: TSpeedButton;
    qODT_OTCODIGOODT: TFloatField;
    qODT_OTCONSECUTIVO: TFloatField;
    qODT_OTMATERIALRELACIONADO: TStringField;
    BitBtn3: TBitBtn;
    Label1: TLabel;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SBBuscarClick(Sender: TObject);
    procedure sbClientesnocreadosClick(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure qODT_OTAfterPost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure qOT_OWBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
    dblinkOW: string;
    TABLA_MATERIALESOT :String;
    TABLA_MATERIALES  :String;
    TABLA_COMPRA  :String;
    TABLA_OT :String;

  public
    { Public declarations }
    codigoodt: double;
    consecutivo : integer
  end;

var
  fInterfazOW: TfInterfazOW;

implementation

{$R *.DFM}

procedure TfInterfazOW.BitBtn2Click(Sender: TObject);
var
i: integer;
qConsulta: Tquery;
Cliente: integer;
begin
if dbdot_ow.SelectedRows.Count>0 then
  begin
    for i:=0 to dbdot_ow.SelectedRows.Count-1 do
    begin
      qOT_OW.BookMark:=dbdot_ow.SelectedRows.Items[i];
      IF qOT_OW.fieldbyname('ESTADO').asinteger = 99 THEN
      Begin
        qODT_OT.open;
        qODT_OT.Insert;
        qODT_OT.fieldbyname('CODIGOODT').asFLOAT:= CODIGOODT;
        qODT_OT.fieldbyname('CONSECUTIVO').asINTEGER:= CONSECUTIVO;
        qODT_OTCODIGO_OT.AsInteger:= qOT_OW.fieldbyname('CODIGO_OT').asinteger;
        qODT_OT.fieldbyname('MATERIALRELACIONADO').AsString:= 'N';
        qODT_OT.Post;
      end
      else
        Showmessage('La OT número: '+qOT_OW.fieldbyname('CODIGO_OT').asString+'  no se encuentra en estado terminada y por tal motivo, no quedará asociada.');
    end;
    qOT_OW.Close;
    qOT_OW.OPEN;
  end;
end;


procedure TfInterfazOW.BitBtn1Click(Sender: TObject);
var
qConsulta: tquery;
begin
  if MessageDlg('Se eliminaran las cantidades de material asociadas a esta OT. Desea Eliminar la asociación de la OT: '+qODT_OTcodigo_ot.asstring+' de la ODT Hija: '+qODT_OT.fieldbyname('codigoodt').asstring+'-'+qODT_OT.fieldbyname('consecutivo').asstring +'? ',mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    //Eliminacion del material de la OT asociada.
    qConsulta := TQuery.Create(Application);
    qConsulta.DatabaseName := 'BaseDato';
    qConsulta.sql.text:= 'update odtpresmate op set CANTIDADCONSUMIDA = CANTIDADCONSUMIDA - '+
                         ' (select sum(a.cantidad) * -1 from '+TABLA_MATERIALESOT+' A, OW_ODTOT B, materialessa M where a.codigo_ot = b.CODIGO_OT '+
                         //' and b.CODIGOODT = op.codigoodt and b.consecutivo = op.consecutivo and a.codigo_material = m.codigomaterialow and m.CODIGOMATERIAL = op.codigomaterial) '+
                         ' and b.CODIGOODT = op.codigoodt and b.consecutivo = op.consecutivo and case when a.CODIGO_MATERIAL = 1000186 then 10 '+
                         ' when a.CODIGO_MATERIAL = 1000188 then 70 else a.CODIGO_MATERIAL end = m.codigomaterialow and m.CODIGOMATERIAL = op.codigomaterial and b.codigo_ot = '+qODT_OTcodigo_ot.asstring+') '+
                         ' where codigoodt = '+floattostr(codigoodt)+ '  and consecutivo = '+ inttostr(consecutivo) +
                         ' and op.codigomaterial in (select codigomaterial from materialessa where codigomaterialow in (Select codigo_material from '+TABLA_MATERIALESOT+' where codigo_ot = '+ qODT_OTcodigo_ot.asstring+'))';
    //qConsulta.sql.savetofile('c:\updateodtpresmate.txt');
    qConsulta.ExecSQL;

    qConsulta.sql.text:= 'delete from OW_ODTOT where codigo_ot = '+ qODT_OTCODIGO_OT.asstring +' and codigoodt = '+floattostr(codigoodt)+ '  and consecutivo = '+ inttostr(consecutivo);
    //qConsulta.sql.savetofile('c:\deleteOW_ODTOT.txt');
    qConsulta.ExecSQL;
    qConsulta.Free;

    {qODT_OT.edit;
    qODT_OT.Delete;
    qODT_OT.Post; }
    qODT_OT.close;
    qODT_OT.open;
    qOT_OW.close;
    qOT_OW.open;
  end;
end;

procedure TfInterfazOW.SBBuscarClick(Sender: TObject);
begin
  if TextoBuscado.Text<> '' then
  if not dsot_ow.Dataset.Locate('Codigo_ot', TextoBuscado.Text,[loCaseInsensitive, loPartialKey]) then
     begin
     {if MessageDlg('No se encontró el registro.', mtInformation, [mbOK], 0)= mrOk then
        bMensaje := true;}
       Showmessage('No se encontró el registro.');
     end;
  end;

procedure TfInterfazOW.sbClientesnocreadosClick(Sender: TObject);
begin
qOT_OW.Close;
qOT_OW.parambyname('CODIGO_DOCUMENTO_EXTERNO').asstring:= '%'+floattostr(codigoodt)+'-'+inttostr(consecutivo)+'%';
qOT_OW.OPEN;
end;

procedure TfInterfazOW.BitBtn3Click(Sender: TObject);
var
qconsulta,qconsulta2, qconsulta3, qconsulta4, qConsulta5:tquery;
CUENTA, materialmaximo:INTEGER;
CodigoMaterialEnerGis: string;
 begin
//iNSERTAR VALORES EN LA TABLA ODTPRESMATE
qConsulta := TQuery.Create(Application);
qConsulta.DatabaseName := 'BaseDato';
qConsulta2 := TQuery.Create(Application);
qConsulta2.DatabaseName := 'BaseDato';
qConsulta3 := TQuery.Create(Application);
qConsulta3.DatabaseName := 'BaseDato';
qConsulta4 := TQuery.Create(Application);
qConsulta4.DatabaseName := 'BaseDato';
qODT_OT.FIRST;
While not qODT_OT.eof do
Begin
  if qODT_OT.fieldbyname('MATERIALRELACIONADO').ASSTRING <> 'S' then
  Begin
    qConsulta.SQL.Add('SELECT case when CODIGO_MATERIAL = 1000186 then 10 when CODIGO_MATERIAL = 1000188 then 70 else CODIGO_MATERIAL end as Codigo_material, sum(cantidad) * -1 as MATERIAL_CONSUMIDO FROM '+TABLA_MATERIALESOT+' WHERE CODIGO_OT =  '+ qODT_OTCODIGO_OT.ASSTRING +
                      ' group by CODIGO_MATERIAL ');
    qConsulta.OPEN;
    qconsulta.first;
    While not qconsulta.eof do
    Begin
      //*************CAPTURAR CODIGO DE ENERGIS..*************************+
      qConsulta4.sql.clear;
      qConsulta4.SQL.Add('SELECT CODIGOMATERIAL FROM MATERIALESSA WHERE CODIGOMATERIALOW = '+qConsulta.fieldbyname('codigo_material').asstring);
      //qConsulta4.sql.savetofile('c:\2.txt');
      qConsulta4.OPEN;
      If qConsulta4.fieldbyname('CODIGOMATERIAL').asString = '' then
      Begin
        qConsulta5 := TQuery.Create(Application);
        qConsulta5.DatabaseName := 'BaseDato';
        qconsulta5.sql.Add ('select max(codigomaterial) + 1 as maximo from materialessa');
        qconsulta5.open;
        materialmaximo:=  qconsulta5.FieldByName('maximo').asinteger;
        qconsulta5.Close;
        qconsulta5.sql.clear;
        qconsulta5.sql.Add ('INSERT INTO MATERIALESSA (CODIGOMATERIAL, NOMBREMATERIAL, CODIGOUNIDAD, VALORUNITARIO, CODIGOMATERIALESSA, TIPO) '+
                         ' select DISTINCT '+inttostr(materialmaximo) +' AS CODIGOMATERIAL, SUBSTR(m.DESCRIPCION,0,100) AS NOMBREMATERIAL, SUBSTR(m.UNIDAD,0,2) AS CODIGOUNIDAD, '+
                         ' p.VALOR_ULTIMA_COMPRA AS VALORUNITARIO, m.CODIGO_MATERIAL AS CODIGOMATERIALOW, NULL AS TIPO '+
                         ' from '+TABLA_MATERIALES+' M, '+TABLA_COMPRA+' P  '+
                         ' WHERE M.CODIGO_MATERIAL = P.CODIGO_MATERIAL(+) '+
                         ' and m.CODIGO_MATERIAL = '+ qConsulta.fieldbyname('codigo_material').asstring +
                         ' AND m.CODIGO_MATERIAL NOT IN (SELECT NVL(CODIGOMATERIALOW,0) FROM MATERIALESSA )');
        //qConsulta5.sql.savetofile('c:\3.txt');

        qconsulta5.ExecSQL;
        qConsulta5.free;
        CodigoMaterialEnerGis:=  INTTOSTR(materialmaximo);
      End
      ELSE
        CodigoMaterialEnerGis:= qConsulta4.fieldbyname('CODIGOMATERIAL').asString;
      qConsulta4.close;
     //**************FIN CAPTURAR CODIGO DE ENERGIS..********************+

      qConsulta2.SQL.Add('SELECT COUNT(*)  AS CUENTA FROM ODTPRESMATE '+
                      ' WHERE CODIGOODT = '+qODT_OT.fieldbyname('CODIGOODT').ASSTRING +' AND CONSECUTIVO = '+qODT_OT.fieldbyname('CONSECUTIVO').ASSTRING +
                      ' AND CODIGOMATERIAL = '+CodigoMaterialEnerGis);

      //qConsulta2.sql.savetofile('c:\4.txt');
      qConsulta2.OPEN;
      CUENTA:= qConsulta2.FIELDBYNAME('CUENTA').ASINTEGER;
      IF CUENTA > 0 THEN
        qConsulta3.SQL.Add('UPDATE ODTPRESMATE SET CANTIDADCONSUMIDA = CANTIDADCONSUMIDA +'+qConsulta.fieldbyname('MATERIAL_CONSUMIDO').asstring +
                           ' WHERE CODIGOODT = '+qODT_OT.fieldbyname('CODIGOODT').ASSTRING +' AND CONSECUTIVO = '+qODT_OT.fieldbyname('CONSECUTIVO').ASSTRING +
                           ' AND CODIGOMATERIAL = '+CodigoMaterialEnerGis)
      ELSE
        qConsulta3.SQL.Add('INSERT INTO ODTPRESMATE (CODIGOODT, CONSECUTIVO, CODIGOMATERIAL, CANTIDADCONSUMIDA)  '+
                           ' VALUES('+qODT_OT.fieldbyname('CODIGOODT').ASSTRING +','+qODT_OT.fieldbyname('CONSECUTIVO').ASSTRING +','+CodigoMaterialEnerGis+','+qConsulta.fieldbyname('MATERIAL_CONSUMIDO').asstring+')');
      //qConsulta3.sql.savetofile('c:\5.txt');
      qConsulta3.ExecSQL;
      qconsulta.next;

      qConsulta3.sql.clear;
      qConsulta2.Close;
      qConsulta2.sql.clear;
    End;
    qconsulta.close;
    qConsulta.sql.clear;
  End;
  qODT_OT.next;
End;
qODT_OT.first;
While not qODT_OT.eof do
Begin
  qODT_OT.Edit;
  qODT_OT.fieldbyname('MATERIALRELACIONADO').ASSTRING:= 'S';
  qODT_OT.post;
  qODT_OT.next;
End;
qConsulta4.free;
qConsulta3.free;
qConsulta2.free;
qConsulta.free;
Showmessage('Los materiales de la OT numero: '+qODT_OTcodigo_ot.asstring+' han sido asociados a la ODT Hija: '+qODT_OT.fieldbyname('codigoodt').asstring+'-'+qODT_OT.fieldbyname('consecutivo').asstring);
end;

procedure TfInterfazOW.qODT_OTAfterPost(DataSet: TDataSet);
begin
  qODT_OT.ApplyUpdates;
  qODT_OT.CommitUpdates;
end;

procedure TfInterfazOW.FormCreate(Sender: TObject);
begin
//dblinkOW := '@DESA_APP_OW'

  {TABLA_MATERIALESOT = 'V4111A@DESA_APP_OW';
  TABLA_MATERIALES = 'V4101A@DESA_APP_OW';
  TABLA_COMPRA = 'V4101B@DESA_APP_OW'; }

  TABLA_MATERIALESOT := 'V4111A'+ DBLINKMATERIALES;
  TABLA_MATERIALES := 'V4101A'+ DBLINKMATERIALES;
  TABLA_COMPRA := 'V4101B'+ DBLINKMATERIALES;
  TABLA_OT :=  'V4801A'+ DBLINKMATERIALES;

end;

procedure TfInterfazOW.qOT_OWBeforeOpen(DataSet: TDataSet);
begin
qOT_OW.SQL.Text:=  'SELECT DISTINCT OT.CODIGO_OT, OT.DESCRIPCION, ESTADO, DESC_ESTADO  FROM '+TABLA_OT+' OT '+
                   ' WHERE NOT EXISTS ( '+
                   ' SELECT *  FROM inventario.OW_ODTOT OD WHERE OD.CODIGO_OT = OT.CODIGO_OT) '+
                   ' AND ESTADO <> ''98'' '+
                   ' and CODIGO_DOCUMENTO_EXTERNO LIKE :CODIGO_DOCUMENTO_EXTERNO ';

end;

end.
