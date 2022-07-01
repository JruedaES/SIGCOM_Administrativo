unit Sincronizar_TLB;

// ************************************************************************ //
// WARNING                                                                  //
// -------                                                                  //
// The types declared in this file were generated from data read from a     //
// Type Library. If this type library is explicitly or indirectly (via      //
// another type library referring to this type library) re-imported, or the //
// 'Refresh' command of the Type Library Editor activated while editing the //
// Type Library, the contents of this file will be regenerated and all      //
// manual modifications will be lost.                                       //
// ************************************************************************ //

// PASTLWTR : $Revision:   1.11.1.75  $
// File generated on 02/09/2010 09:22:05 a.m. from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\Progpas\energistsao\modulos\administrativo_essa version Modificada\Sincronizar.tlb
// IID\LCID: {0E94B2B8-F636-4B64-8053-18DD4DD12833}\0
// Helpfile: 
// HelpString: 
// Version:    1.0
// ************************************************************************ //

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL, 
  mscorlib_TLB;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:      //
//   Type Libraries     : LIBID_xxxx                                    //
//   CoClasses          : CLASS_xxxx                                    //
//   DISPInterfaces     : DIID_xxxx                                     //
//   Non-DISP interfaces: IID_xxxx                                      //
// *********************************************************************//
const
  LIBID_Sincronizar: TGUID = '{0E94B2B8-F636-4B64-8053-18DD4DD12833}';
  IID_ComSincronizarInterface: TGUID = '{EAA4976A-45C3-4BC5-BC0B-E474F4C3C83F}';
  DIID_ComSincronizarEvents: TGUID = '{7BD20046-DF8C-44A6-8F6B-687FAA26FA71}';
  CLASS_ComSincronizar: TGUID = '{0D53A3E8-E51A-49C7-944E-E72A2064F938}';
type

// *********************************************************************//
// Forward declaration of interfaces defined in Type Library            //
// *********************************************************************//
  ComSincronizarInterface = interface;
  ComSincronizarInterfaceDisp = dispinterface;
  ComSincronizarEvents = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to its Default Interface)            //
// *********************************************************************//
  ComSincronizar = ComSincronizarInterface;


// *********************************************************************//
// Interface: ComSincronizarInterface
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EAA4976A-45C3-4BC5-BC0B-E474F4C3C83F}
// *********************************************************************//
  ComSincronizarInterface = interface(IDispatch)
    ['{EAA4976A-45C3-4BC5-BC0B-E474F4C3C83F}']
    function ExportarAsignaci_n(const Carpeta_PC: WideString; const Carpeta_ODT: WideString): WordBool; safecall;
    function ImportarAsignaci_n(const Carpeta_PC: WideString; const Carpeta_ODT: WideString): WordBool; safecall;
    function Conectar_Dispositivo: WordBool; safecall;
    function PruebaLibreria: WordBool; safecall;
    function Verificar_Conexi_n: WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  ComSincronizarInterfaceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EAA4976A-45C3-4BC5-BC0B-E474F4C3C83F}
// *********************************************************************//
  ComSincronizarInterfaceDisp = dispinterface
    ['{EAA4976A-45C3-4BC5-BC0B-E474F4C3C83F}']
    function ExportarAsignaci_n(const Carpeta_PC: WideString; const Carpeta_ODT: WideString): WordBool; dispid 1;
    function ImportarAsignaci_n(const Carpeta_PC: WideString; const Carpeta_ODT: WideString): WordBool; dispid 2;
    function Conectar_Dispositivo: WordBool; dispid 3;
    function PruebaLibreria: WordBool; dispid 4;
    function Verificar_Conexi_n: WordBool; dispid 5;
  end;

// *********************************************************************//
// DispIntf:  ComSincronizarEvents
// Flags:     (4096) Dispatchable
// GUID:      {7BD20046-DF8C-44A6-8F6B-687FAA26FA71}
// *********************************************************************//
  ComSincronizarEvents = dispinterface
    ['{7BD20046-DF8C-44A6-8F6B-687FAA26FA71}']
  end;

  CoComSincronizar = class
    class function Create: ComSincronizarInterface;
    class function CreateRemote(const MachineName: string): ComSincronizarInterface;
  end;

implementation

uses ComObj;

class function CoComSincronizar.Create: ComSincronizarInterface;
begin
  Result := CreateComObject(CLASS_ComSincronizar) as ComSincronizarInterface;
end;

class function CoComSincronizar.CreateRemote(const MachineName: string): ComSincronizarInterface;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ComSincronizar) as ComSincronizarInterface;
end;

end.
