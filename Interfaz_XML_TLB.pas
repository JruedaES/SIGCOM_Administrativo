unit Interfaz_XML_TLB;

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
// File generated on 08/02/2010 11:09:44 a.m. from Type Library described below.

// ************************************************************************ //
// Type Lib: D:\Progpas\energisessatsao\modulos\administrativo\Interfaz_XML.tlb
// IID\LCID: {30C59F96-7183-416D-8794-533D353FB112}\0
// Helpfile: 
// HelpString: 
// Version:    1.0
// ************************************************************************ //

interface

uses Windows, ActiveX, Classes, Graphics, OleCtrls, StdVCL, 
  mscorlib_TLB, System_TLB;

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:      //
//   Type Libraries     : LIBID_xxxx                                    //
//   CoClasses          : CLASS_xxxx                                    //
//   DISPInterfaces     : DIID_xxxx                                     //
//   Non-DISP interfaces: IID_xxxx                                      //
// *********************************************************************//
const
  LIBID_Interfaz_XML: TGUID = '{30C59F96-7183-416D-8794-533D353FB112}';
  IID_ICl_Exportar_XML: TGUID = '{4A433BCC-8883-34B5-B1B7-A4AA475F1C59}';
  IID__Cl_Exportar_XML: TGUID = '{D3C08DD4-8E64-40CD-BA63-077B3987693C}';
  CLASS_Cl_Exportar_XML: TGUID = '{421D1C8C-057F-41E0-9F8D-7AF1C2F96F93}';
  IID_ICl_Importar_XML: TGUID = '{72AC5E92-A535-35BD-A28A-BD99DB014B66}';
  IID__Cl_Importar_XML: TGUID = '{D3C08DD4-8E64-40CD-BA63-077B3987693B}';
  CLASS_Cl_Importar_XML: TGUID = '{421D1C8C-057F-41E0-9F8D-7AF1C2F96F92}';
  IID__Datos: TGUID = '{6C356844-DADF-3350-8BE9-5B7C51D65CC8}';
  IID__APOYORowChangeEventHandler: TGUID = '{D52E2BF1-EA7B-3FB7-9870-3F44AC39024D}';
  IID__INCIDENTALAPOYORowChangeEventHandler: TGUID = '{E81F7932-70FC-3DEA-805F-51381E51CF8A}';
  IID__NODORowChangeEventHandler: TGUID = '{B7044F6A-265C-3AF8-BBDA-D6A0CFC1D1E2}';
  IID__FOTOAPOYORowChangeEventHandler: TGUID = '{6F26B294-7880-3244-B490-36149EA75D86}';
  IID__EXCAVACIONRowChangeEventHandler: TGUID = '{7FE27B24-4F58-32C4-9692-E9F80FAE3BBB}';
  IID__DUCTOEXCAVACIONRowChangeEventHandler: TGUID = '{40671649-D772-35FA-9612-1ED21CA0127D}';
  IID__DETALLEAPOYORowChangeEventHandler: TGUID = '{C772FCBB-1F21-3C78-81BA-5921868FACE3}';
  IID__DIRECCIONAPOYORowChangeEventHandler: TGUID = '{25A1E553-F99D-3C7D-8DB0-E7E34E3F3073}';
  IID__TRAMORowChangeEventHandler: TGUID = '{48D6A79D-F3D6-3D75-A3A3-E983051BEABD}';
  IID__PARARRAYODISRowChangeEventHandler: TGUID = '{4C331520-A0A0-3A9C-9F3F-7E9A6CDCB2FE}';
  IID__INTERRUPTORDISRowChangeEventHandler: TGUID = '{D5AAEF8E-F9C1-3F3C-9CE5-7A1782984D4D}';
  IID__TRAFODISRowChangeEventHandler: TGUID = '{03BFF98B-4E7A-3C9C-B985-F8AC85B2B612}';
  IID__CONDENSADORRowChangeEventHandler: TGUID = '{D323B9BD-4833-32C4-9105-430FCBD75548}';
  IID__CLIENTESGDRowChangeEventHandler: TGUID = '{F59C1FF7-7476-31B9-8884-07642DFC6F85}';
  IID__ALUMBRADOPUBLICORowChangeEventHandler: TGUID = '{ECF03016-A9C8-3913-8C10-AD3CA2882282}';
  IID__DIRECCIONCLIENTERowChangeEventHandler: TGUID = '{B443E171-6044-379E-9EFD-5EC198EB44CA}';
  IID__FOTOCLIENTERowChangeEventHandler: TGUID = '{1517937A-A748-359A-8724-6B0918612403}';
  IID__PUNTODEMEDIDARowChangeEventHandler: TGUID = '{D18D27D3-FABC-3230-BB8C-1241D6706041}';
  IID__MEDIDORSGDRowChangeEventHandler: TGUID = '{EE458071-5B30-3390-8F3E-D317C3495CF9}';
  IID__INCIDENTALDUCTORowChangeEventHandler: TGUID = '{14E7A246-EE48-3CBB-B71C-0F72639D8674}';
  IID__ODTRowChangeEventHandler: TGUID = '{2EB020FB-0669-3E0E-93F8-625436FF4017}';
  IID__APOYODataTable: TGUID = '{B91AE5CF-0317-3706-BD04-A45AB66B37E8}';
  IID__INCIDENTALAPOYODataTable: TGUID = '{85579AB8-12A3-39C3-98A8-96E5242E829C}';
  IID__NODODataTable: TGUID = '{E463B68C-0B06-3A49-A46A-1D22FD5F0BF4}';
  IID__FOTOAPOYODataTable: TGUID = '{88C3B0B0-AD80-32BE-8C6F-FBFD0E6B8A89}';
  IID__EXCAVACIONDataTable: TGUID = '{5AE63D2B-3D8A-32AA-8B9B-CB04650C98BF}';
  IID__DUCTOEXCAVACIONDataTable: TGUID = '{9677D4DA-6F2F-398B-A517-443189DD4F9E}';
  IID__DETALLEAPOYODataTable: TGUID = '{67B72A88-E232-327B-B1C3-831290B06758}';
  IID__DIRECCIONAPOYODataTable: TGUID = '{6BF6950F-CA2B-3F1A-B83F-49995DD52BB5}';
  IID__TRAMODataTable: TGUID = '{67FB907B-B2D9-3492-9DF2-54EB444AC6CA}';
  IID__PARARRAYODISDataTable: TGUID = '{1417D1AD-44B2-308B-8294-587FD3E91C28}';
  IID__INTERRUPTORDISDataTable: TGUID = '{0A9A0B01-767C-3071-8D0B-4BFE5D9F67A3}';
  IID__TRAFODISDataTable: TGUID = '{3D9D17D2-2DE0-307C-BFCD-E00EEA0D8961}';
  IID__CONDENSADORDataTable: TGUID = '{21747BCC-B3E4-3892-8D80-374230B82BE8}';
  IID__CLIENTESGDDataTable: TGUID = '{D295106A-8615-3D56-AA15-5BD8B5E455D1}';
  IID__ALUMBRADOPUBLICODataTable: TGUID = '{E6981F3F-B051-3045-8827-D8C36986EE24}';
  IID__DIRECCIONCLIENTEDataTable: TGUID = '{FC690AA7-C62D-35F2-8E07-17F7AB43AA6F}';
  IID__FOTOCLIENTEDataTable: TGUID = '{FC47F138-105D-3A27-8974-615C93B4F64A}';
  IID__PUNTODEMEDIDADataTable: TGUID = '{7EDAA8CB-30BB-35A2-AE1D-0DE639AF785F}';
  IID__MEDIDORSGDDataTable: TGUID = '{2C811D65-E624-3271-BC60-BF06B512BD44}';
  IID__INCIDENTALDUCTODataTable: TGUID = '{E7C0C544-3E74-32A2-81B0-5E89DD56EBFE}';
  IID__ODTDataTable: TGUID = '{E9039013-B808-31A8-93E9-20E153BE5ADD}';
  IID__APOYORow: TGUID = '{A979BE5F-1BD6-351E-9E5F-30C1880FA6CF}';
  IID__INCIDENTALAPOYORow: TGUID = '{C1F56E35-9945-36DB-AAD3-876378673172}';
  IID__NODORow: TGUID = '{E63CDF16-2592-3CC8-AC00-316A19A492B7}';
  IID__FOTOAPOYORow: TGUID = '{7D796DEC-A6DA-3C25-A27A-18097897E21C}';
  IID__EXCAVACIONRow: TGUID = '{883FE6B2-C96F-3250-924B-5C00E0B19EA9}';
  IID__DUCTOEXCAVACIONRow: TGUID = '{2EC4A081-0B40-3FD9-8953-82726838D573}';
  IID__DETALLEAPOYORow: TGUID = '{B5C2D28E-CAD1-3702-A52D-4184F52B8CA3}';
  IID__DIRECCIONAPOYORow: TGUID = '{5F0295C8-FD45-3E9E-9FAB-0A8D38154DEF}';
  IID__TRAMORow: TGUID = '{E1F54ABE-C8C1-34EC-BD47-87B1B2A59E60}';
  IID__PARARRAYODISRow: TGUID = '{CB01B455-0481-3C6D-8D5D-9148BCF2C5CC}';
  IID__INTERRUPTORDISRow: TGUID = '{3695EB5D-D812-3B77-A966-E91C551A2437}';
  IID__TRAFODISRow: TGUID = '{C93661D0-6B84-373D-AC3F-CCC2E5EF83DB}';
  IID__CONDENSADORRow: TGUID = '{08115430-2EA0-33A5-B150-DFA84E5099CF}';
  IID__CLIENTESGDRow: TGUID = '{7D6C4E80-7074-326C-AB6C-563B444D6D52}';
  IID__ALUMBRADOPUBLICORow: TGUID = '{A588EC16-B7E6-3CD6-852B-9EBFF3D05B02}';
  IID__DIRECCIONCLIENTERow: TGUID = '{131EB53D-00B0-34F5-8D5E-A79DFD2EDFD4}';
  IID__FOTOCLIENTERow: TGUID = '{67F61040-039A-303E-B010-FD5CF6146862}';
  IID__PUNTODEMEDIDARow: TGUID = '{4FF6B315-970B-3403-9B6A-923483C9AADB}';
  IID__MEDIDORSGDRow: TGUID = '{69A604D7-5717-30AC-BCF1-236642EBB4FC}';
  IID__INCIDENTALDUCTORow: TGUID = '{F965D76B-1C44-31ED-9EE8-5B9062AF5A4C}';
  IID__ODTRow: TGUID = '{2439FCDA-80A6-3B49-AD22-F93ED854CE03}';
  IID__APOYORowChangeEvent: TGUID = '{290C123D-AE37-351B-8283-989CBCEAADEF}';
  IID__INCIDENTALAPOYORowChangeEvent: TGUID = '{5578D8BC-9748-3BE3-B50A-0117FBD36039}';
  IID__NODORowChangeEvent: TGUID = '{8C6DBAB0-771E-3A45-B6E0-D2527F11C624}';
  IID__FOTOAPOYORowChangeEvent: TGUID = '{E04E9928-8DC0-3861-8ACD-38BB8B4BF434}';
  IID__EXCAVACIONRowChangeEvent: TGUID = '{3F256F31-A055-3EBC-9C3D-8F2C8D28DF92}';
  IID__DUCTOEXCAVACIONRowChangeEvent: TGUID = '{84226AD9-2F26-33A6-93E8-99209CD59C37}';
  IID__DETALLEAPOYORowChangeEvent: TGUID = '{7BF7F47B-C317-3603-B2FD-E48E9B56DA5C}';
  IID__DIRECCIONAPOYORowChangeEvent: TGUID = '{F404385C-E261-30D4-9CD6-76BD1564274C}';
  IID__TRAMORowChangeEvent: TGUID = '{E0058366-C496-374C-AAEE-0DC89E99057D}';
  IID__PARARRAYODISRowChangeEvent: TGUID = '{029EDF76-73D2-3B8D-B7A3-6F68BFB45A55}';
  IID__INTERRUPTORDISRowChangeEvent: TGUID = '{590A4DC4-1363-34FA-969F-A9105F1F88D5}';
  IID__TRAFODISRowChangeEvent: TGUID = '{9781BE5B-3D46-3088-87A7-F9EF428D2900}';
  IID__CONDENSADORRowChangeEvent: TGUID = '{61DF0ED0-98E0-3F1D-B727-2FEE1AE6D3AB}';
  IID__CLIENTESGDRowChangeEvent: TGUID = '{DFCCAF50-FE96-3BC3-B63C-B1BE1F5B0FD4}';
  IID__ALUMBRADOPUBLICORowChangeEvent: TGUID = '{AD071BEE-BC0B-3A34-AB62-949177F0389A}';
  IID__DIRECCIONCLIENTERowChangeEvent: TGUID = '{E28860A3-62E7-3319-826D-4C1D8459A808}';
  IID__FOTOCLIENTERowChangeEvent: TGUID = '{2FA30DEB-BE3B-3EF4-9571-402816194DD2}';
  IID__PUNTODEMEDIDARowChangeEvent: TGUID = '{8B66FBA4-AD7E-3BB8-B1FC-FE54A4FFFF54}';
  IID__MEDIDORSGDRowChangeEvent: TGUID = '{10F8FE2F-1E04-3328-8555-B7DB55B84AAA}';
  IID__INCIDENTALDUCTORowChangeEvent: TGUID = '{A734C160-922E-34BA-A856-30E1D39FCD5C}';
  IID__ODTRowChangeEvent: TGUID = '{01FE3F04-03EA-37DA-9D2A-CF558D19C610}';
  CLASS_Datos: TGUID = '{66FA5696-A389-36A2-8A21-BAF51D4DD693}';
  CLASS_APOYORowChangeEventHandler: TGUID = '{66555557-66C0-32C3-B3DD-9CFEA6F90461}';
  CLASS_INCIDENTALAPOYORowChangeEventHandler: TGUID = '{C29084FD-00D3-342A-9C26-DECC94B0BE16}';
  CLASS_NODORowChangeEventHandler: TGUID = '{D4E2B8CA-FD15-3B7C-935B-4862B26CECA4}';
  CLASS_FOTOAPOYORowChangeEventHandler: TGUID = '{59A50F26-BF9D-3BCE-A80B-BDA87F8122CB}';
  CLASS_EXCAVACIONRowChangeEventHandler: TGUID = '{8198D836-4A03-3C4E-9548-7F0048BF2450}';
  CLASS_DUCTOEXCAVACIONRowChangeEventHandler: TGUID = '{3A6BADDA-9255-350A-9B8B-8DFE0CA80BCD}';
  CLASS_DETALLEAPOYORowChangeEventHandler: TGUID = '{978CF434-2829-3408-8894-4E8EED0D5FB3}';
  CLASS_DIRECCIONAPOYORowChangeEventHandler: TGUID = '{BC8415F4-EB3F-3F73-8E4F-10D0B6DD74DC}';
  CLASS_TRAMORowChangeEventHandler: TGUID = '{8D897FFD-FC38-36AE-999C-4D873C14CCD0}';
  CLASS_PARARRAYODISRowChangeEventHandler: TGUID = '{7FC8F5A7-DD8E-38AB-8738-526CC9171B0B}';
  CLASS_INTERRUPTORDISRowChangeEventHandler: TGUID = '{E61F5593-4D4E-369F-93CF-35FA14454A5C}';
  CLASS_TRAFODISRowChangeEventHandler: TGUID = '{B69D8103-8EEF-3C39-8675-8CEF11D47BD4}';
  CLASS_CONDENSADORRowChangeEventHandler: TGUID = '{751DBB2F-D259-3B5E-9E67-19C490CB634F}';
  CLASS_CLIENTESGDRowChangeEventHandler: TGUID = '{93F22464-24F5-314F-8B9F-3A6A3D06FDE7}';
  CLASS_ALUMBRADOPUBLICORowChangeEventHandler: TGUID = '{A93FB0E2-A3FC-3F0E-A960-81C839571B94}';
  CLASS_DIRECCIONCLIENTERowChangeEventHandler: TGUID = '{DF2D9157-53EC-300F-BFC9-0E2519AABB12}';
  CLASS_FOTOCLIENTERowChangeEventHandler: TGUID = '{FAA98EAE-29C6-31FA-99DB-35F0E8B8A819}';
  CLASS_PUNTODEMEDIDARowChangeEventHandler: TGUID = '{3D2B51C9-FC25-385F-838C-21E8271672CE}';
  CLASS_MEDIDORSGDRowChangeEventHandler: TGUID = '{E16BC146-F70F-358A-9C45-8697D45F0636}';
  CLASS_INCIDENTALDUCTORowChangeEventHandler: TGUID = '{813590CE-7E7C-36FE-8EB1-6D6B31046C37}';
  CLASS_ODTRowChangeEventHandler: TGUID = '{AE78D63D-3E72-3594-B4A7-5E3A4B4D791C}';
  CLASS_APOYODataTable: TGUID = '{B2203708-BD87-3BB3-8B83-2E126A9B30E2}';
  CLASS_INCIDENTALAPOYODataTable: TGUID = '{1F5F03A1-F2DD-36F1-97F3-7216FC410595}';
  CLASS_NODODataTable: TGUID = '{E0DC42E1-9446-395A-B510-A70EDB5F0708}';
  CLASS_FOTOAPOYODataTable: TGUID = '{3073236D-C98C-328C-AC05-9656507623B0}';
  CLASS_EXCAVACIONDataTable: TGUID = '{9C4C7BEA-569E-3119-A29C-EB74DB27C425}';
  CLASS_DUCTOEXCAVACIONDataTable: TGUID = '{7F698F94-683F-307C-B79A-835539691A19}';
  CLASS_DETALLEAPOYODataTable: TGUID = '{DBB0A9F6-05A2-3537-ADB1-171184B7AB5E}';
  CLASS_DIRECCIONAPOYODataTable: TGUID = '{5476BF39-756C-323C-A64A-084EB15D431A}';
  CLASS_TRAMODataTable: TGUID = '{706F80DF-2584-3453-AA76-FBCE7A1F0460}';
  CLASS_PARARRAYODISDataTable: TGUID = '{40DECE04-B5D0-34FB-A14C-2F7DBE12E904}';
  CLASS_INTERRUPTORDISDataTable: TGUID = '{A4401888-6A78-390C-B155-D296AA0477AF}';
  CLASS_TRAFODISDataTable: TGUID = '{FEB20D73-FA2E-32C7-9AB3-D80FA4A38650}';
  CLASS_CONDENSADORDataTable: TGUID = '{4084AD7C-4E8B-3178-9A45-6F8CCA9998D4}';
  CLASS_CLIENTESGDDataTable: TGUID = '{159BE55B-4661-3C79-BECF-B787D6C454DD}';
  CLASS_ALUMBRADOPUBLICODataTable: TGUID = '{E1C8CA4F-0DEA-31D8-9ADF-A78625B1B85C}';
  CLASS_DIRECCIONCLIENTEDataTable: TGUID = '{7409A6CD-489C-36F6-8BAF-B68C0DA2F5DD}';
  CLASS_FOTOCLIENTEDataTable: TGUID = '{D9B0B1EF-C270-3B44-8495-0C374A88941C}';
  CLASS_PUNTODEMEDIDADataTable: TGUID = '{1E4BAB06-B8DC-3BEF-8245-A4023AFA5784}';
  CLASS_MEDIDORSGDDataTable: TGUID = '{1E19D0C4-B3B1-35CE-879C-573AF7C4CAED}';
  CLASS_INCIDENTALDUCTODataTable: TGUID = '{880C1ED1-1C65-318E-A3D0-1009A56E6DB2}';
  CLASS_ODTDataTable: TGUID = '{6947DD66-E7B1-36B7-880F-CADE90B0E57D}';
  CLASS_APOYORow: TGUID = '{C4266929-1239-3DE9-8971-86DD6ACDF922}';
  CLASS_INCIDENTALAPOYORow: TGUID = '{4130553A-025C-3C79-BBB0-5CC39C7D3F4F}';
  CLASS_NODORow: TGUID = '{52A2CC94-2303-3468-B0E1-C6E0D9EAC96F}';
  CLASS_FOTOAPOYORow: TGUID = '{1F7AF561-436F-386D-97DB-B0325A6C941D}';
  CLASS_EXCAVACIONRow: TGUID = '{0617C941-1396-3648-AFB6-E86990056596}';
  CLASS_DUCTOEXCAVACIONRow: TGUID = '{F075DDEA-FF9E-3C4C-ADB6-8ACE69CE9B56}';
  CLASS_DETALLEAPOYORow: TGUID = '{D4EDA04D-6A62-3B98-9DD8-A9A88DC6003E}';
  CLASS_DIRECCIONAPOYORow: TGUID = '{E53D86BC-2B2D-3C07-9AEA-3998475D7CF5}';
  CLASS_TRAMORow: TGUID = '{C9437C67-74BD-3147-89D0-FC0DACD3B085}';
  CLASS_PARARRAYODISRow: TGUID = '{D6BAE8E1-B6D8-3CCD-B6F7-F64611B0168C}';
  CLASS_INTERRUPTORDISRow: TGUID = '{9C67AFA9-BA9F-3DEE-AA77-1D522D5963E5}';
  CLASS_TRAFODISRow: TGUID = '{C43D6B05-B7C6-3F8E-A88C-6BAD6D4330FA}';
  CLASS_CONDENSADORRow: TGUID = '{8A1CFF9D-1E19-39AD-A233-96974F03DAD6}';
  CLASS_CLIENTESGDRow: TGUID = '{9F3605CF-55BE-3027-849A-0CF03A9676E8}';
  CLASS_ALUMBRADOPUBLICORow: TGUID = '{051B9E50-A030-3CCC-A8D9-701E2C5CCC99}';
  CLASS_DIRECCIONCLIENTERow: TGUID = '{54485118-4A84-33BF-998B-1DCF51BE993B}';
  CLASS_FOTOCLIENTERow: TGUID = '{0651306C-EE17-39D3-AB46-C0ACB97F6DDB}';
  CLASS_PUNTODEMEDIDARow: TGUID = '{0848ACD8-E152-33D2-8B9C-30EA25CA6D12}';
  CLASS_MEDIDORSGDRow: TGUID = '{250368F3-4084-3B07-B07F-D0E9C5D149F1}';
  CLASS_INCIDENTALDUCTORow: TGUID = '{08B4E412-C139-3856-9EEA-A693078A6DBD}';
  CLASS_ODTRow: TGUID = '{79074315-2020-327F-BDD5-E57E27BEE408}';
  CLASS_APOYORowChangeEvent: TGUID = '{2B1ABD7F-00C3-3C9E-A4FC-89730EB4720C}';
  CLASS_INCIDENTALAPOYORowChangeEvent: TGUID = '{60792856-434C-3F2F-8F99-8B87BC420725}';
  CLASS_NODORowChangeEvent: TGUID = '{8597E3F9-3D4C-34FE-83DC-7B276A4A3E06}';
  CLASS_FOTOAPOYORowChangeEvent: TGUID = '{03962D46-436A-3F72-9F0E-BD4B5D858403}';
  CLASS_EXCAVACIONRowChangeEvent: TGUID = '{1FB62A1E-6CE0-3783-83E4-A60266D75876}';
  CLASS_DUCTOEXCAVACIONRowChangeEvent: TGUID = '{6E61591A-BF0A-38DC-9BC3-AB456C2CAB05}';
  CLASS_DETALLEAPOYORowChangeEvent: TGUID = '{A2495D94-7184-3138-8B06-23BF29973255}';
  CLASS_DIRECCIONAPOYORowChangeEvent: TGUID = '{D9DF8E69-6B8A-370B-8800-9D3D17BD1B72}';
  CLASS_TRAMORowChangeEvent: TGUID = '{CD5227E0-0181-3853-95A1-3C4C12512F91}';
  CLASS_PARARRAYODISRowChangeEvent: TGUID = '{E3EEC38A-30FF-38C3-9D18-0517533FC5A9}';
  CLASS_INTERRUPTORDISRowChangeEvent: TGUID = '{F16060DC-FEB9-38B5-8EE2-40D26B29F87E}';
  CLASS_TRAFODISRowChangeEvent: TGUID = '{9FD90252-CE69-3185-A709-DF98C6EB8881}';
  CLASS_CONDENSADORRowChangeEvent: TGUID = '{96FD52AF-8E54-3FA3-8C98-A9D97DE2DB20}';
  CLASS_CLIENTESGDRowChangeEvent: TGUID = '{78774137-9B15-3E90-9088-F7E36BE76238}';
  CLASS_ALUMBRADOPUBLICORowChangeEvent: TGUID = '{D488693D-2E6C-37EA-B81B-831D1AF22321}';
  CLASS_DIRECCIONCLIENTERowChangeEvent: TGUID = '{0DE4CB64-C0CD-3EFF-BB05-91768462B87E}';
  CLASS_FOTOCLIENTERowChangeEvent: TGUID = '{1611B155-1229-3F74-8B5E-0EAC944EA9F0}';
  CLASS_PUNTODEMEDIDARowChangeEvent: TGUID = '{1AC9A52D-26F4-3767-BAB7-6EC2E6B147B0}';
  CLASS_MEDIDORSGDRowChangeEvent: TGUID = '{5851DE66-C40B-3808-A69B-91062D25FE37}';
  CLASS_INCIDENTALDUCTORowChangeEvent: TGUID = '{DEA8E12A-546A-3BBE-ACE3-C1EB0EE41DC3}';
  CLASS_ODTRowChangeEvent: TGUID = '{9D3D47A2-76D9-3988-811C-34C99B3DBFFA}';
type

// *********************************************************************//
// Forward declaration of interfaces defined in Type Library            //
// *********************************************************************//
  ICl_Exportar_XML = interface;
  ICl_Exportar_XMLDisp = dispinterface;
  _Cl_Exportar_XML = interface;
  _Cl_Exportar_XMLDisp = dispinterface;
  ICl_Importar_XML = interface;
  ICl_Importar_XMLDisp = dispinterface;
  _Cl_Importar_XML = interface;
  _Cl_Importar_XMLDisp = dispinterface;
  _Datos = interface;
  _DatosDisp = dispinterface;
  _APOYORowChangeEventHandler = interface;
  _APOYORowChangeEventHandlerDisp = dispinterface;
  _INCIDENTALAPOYORowChangeEventHandler = interface;
  _INCIDENTALAPOYORowChangeEventHandlerDisp = dispinterface;
  _NODORowChangeEventHandler = interface;
  _NODORowChangeEventHandlerDisp = dispinterface;
  _FOTOAPOYORowChangeEventHandler = interface;
  _FOTOAPOYORowChangeEventHandlerDisp = dispinterface;
  _EXCAVACIONRowChangeEventHandler = interface;
  _EXCAVACIONRowChangeEventHandlerDisp = dispinterface;
  _DUCTOEXCAVACIONRowChangeEventHandler = interface;
  _DUCTOEXCAVACIONRowChangeEventHandlerDisp = dispinterface;
  _DETALLEAPOYORowChangeEventHandler = interface;
  _DETALLEAPOYORowChangeEventHandlerDisp = dispinterface;
  _DIRECCIONAPOYORowChangeEventHandler = interface;
  _DIRECCIONAPOYORowChangeEventHandlerDisp = dispinterface;
  _TRAMORowChangeEventHandler = interface;
  _TRAMORowChangeEventHandlerDisp = dispinterface;
  _PARARRAYODISRowChangeEventHandler = interface;
  _PARARRAYODISRowChangeEventHandlerDisp = dispinterface;
  _INTERRUPTORDISRowChangeEventHandler = interface;
  _INTERRUPTORDISRowChangeEventHandlerDisp = dispinterface;
  _TRAFODISRowChangeEventHandler = interface;
  _TRAFODISRowChangeEventHandlerDisp = dispinterface;
  _CONDENSADORRowChangeEventHandler = interface;
  _CONDENSADORRowChangeEventHandlerDisp = dispinterface;
  _CLIENTESGDRowChangeEventHandler = interface;
  _CLIENTESGDRowChangeEventHandlerDisp = dispinterface;
  _ALUMBRADOPUBLICORowChangeEventHandler = interface;
  _ALUMBRADOPUBLICORowChangeEventHandlerDisp = dispinterface;
  _DIRECCIONCLIENTERowChangeEventHandler = interface;
  _DIRECCIONCLIENTERowChangeEventHandlerDisp = dispinterface;
  _FOTOCLIENTERowChangeEventHandler = interface;
  _FOTOCLIENTERowChangeEventHandlerDisp = dispinterface;
  _PUNTODEMEDIDARowChangeEventHandler = interface;
  _PUNTODEMEDIDARowChangeEventHandlerDisp = dispinterface;
  _MEDIDORSGDRowChangeEventHandler = interface;
  _MEDIDORSGDRowChangeEventHandlerDisp = dispinterface;
  _INCIDENTALDUCTORowChangeEventHandler = interface;
  _INCIDENTALDUCTORowChangeEventHandlerDisp = dispinterface;
  _ODTRowChangeEventHandler = interface;
  _ODTRowChangeEventHandlerDisp = dispinterface;
  _APOYODataTable = interface;
  _APOYODataTableDisp = dispinterface;
  _INCIDENTALAPOYODataTable = interface;
  _INCIDENTALAPOYODataTableDisp = dispinterface;
  _NODODataTable = interface;
  _NODODataTableDisp = dispinterface;
  _FOTOAPOYODataTable = interface;
  _FOTOAPOYODataTableDisp = dispinterface;
  _EXCAVACIONDataTable = interface;
  _EXCAVACIONDataTableDisp = dispinterface;
  _DUCTOEXCAVACIONDataTable = interface;
  _DUCTOEXCAVACIONDataTableDisp = dispinterface;
  _DETALLEAPOYODataTable = interface;
  _DETALLEAPOYODataTableDisp = dispinterface;
  _DIRECCIONAPOYODataTable = interface;
  _DIRECCIONAPOYODataTableDisp = dispinterface;
  _TRAMODataTable = interface;
  _TRAMODataTableDisp = dispinterface;
  _PARARRAYODISDataTable = interface;
  _PARARRAYODISDataTableDisp = dispinterface;
  _INTERRUPTORDISDataTable = interface;
  _INTERRUPTORDISDataTableDisp = dispinterface;
  _TRAFODISDataTable = interface;
  _TRAFODISDataTableDisp = dispinterface;
  _CONDENSADORDataTable = interface;
  _CONDENSADORDataTableDisp = dispinterface;
  _CLIENTESGDDataTable = interface;
  _CLIENTESGDDataTableDisp = dispinterface;
  _ALUMBRADOPUBLICODataTable = interface;
  _ALUMBRADOPUBLICODataTableDisp = dispinterface;
  _DIRECCIONCLIENTEDataTable = interface;
  _DIRECCIONCLIENTEDataTableDisp = dispinterface;
  _FOTOCLIENTEDataTable = interface;
  _FOTOCLIENTEDataTableDisp = dispinterface;
  _PUNTODEMEDIDADataTable = interface;
  _PUNTODEMEDIDADataTableDisp = dispinterface;
  _MEDIDORSGDDataTable = interface;
  _MEDIDORSGDDataTableDisp = dispinterface;
  _INCIDENTALDUCTODataTable = interface;
  _INCIDENTALDUCTODataTableDisp = dispinterface;
  _ODTDataTable = interface;
  _ODTDataTableDisp = dispinterface;
  _APOYORow = interface;
  _APOYORowDisp = dispinterface;
  _INCIDENTALAPOYORow = interface;
  _INCIDENTALAPOYORowDisp = dispinterface;
  _NODORow = interface;
  _NODORowDisp = dispinterface;
  _FOTOAPOYORow = interface;
  _FOTOAPOYORowDisp = dispinterface;
  _EXCAVACIONRow = interface;
  _EXCAVACIONRowDisp = dispinterface;
  _DUCTOEXCAVACIONRow = interface;
  _DUCTOEXCAVACIONRowDisp = dispinterface;
  _DETALLEAPOYORow = interface;
  _DETALLEAPOYORowDisp = dispinterface;
  _DIRECCIONAPOYORow = interface;
  _DIRECCIONAPOYORowDisp = dispinterface;
  _TRAMORow = interface;
  _TRAMORowDisp = dispinterface;
  _PARARRAYODISRow = interface;
  _PARARRAYODISRowDisp = dispinterface;
  _INTERRUPTORDISRow = interface;
  _INTERRUPTORDISRowDisp = dispinterface;
  _TRAFODISRow = interface;
  _TRAFODISRowDisp = dispinterface;
  _CONDENSADORRow = interface;
  _CONDENSADORRowDisp = dispinterface;
  _CLIENTESGDRow = interface;
  _CLIENTESGDRowDisp = dispinterface;
  _ALUMBRADOPUBLICORow = interface;
  _ALUMBRADOPUBLICORowDisp = dispinterface;
  _DIRECCIONCLIENTERow = interface;
  _DIRECCIONCLIENTERowDisp = dispinterface;
  _FOTOCLIENTERow = interface;
  _FOTOCLIENTERowDisp = dispinterface;
  _PUNTODEMEDIDARow = interface;
  _PUNTODEMEDIDARowDisp = dispinterface;
  _MEDIDORSGDRow = interface;
  _MEDIDORSGDRowDisp = dispinterface;
  _INCIDENTALDUCTORow = interface;
  _INCIDENTALDUCTORowDisp = dispinterface;
  _ODTRow = interface;
  _ODTRowDisp = dispinterface;
  _APOYORowChangeEvent = interface;
  _APOYORowChangeEventDisp = dispinterface;
  _INCIDENTALAPOYORowChangeEvent = interface;
  _INCIDENTALAPOYORowChangeEventDisp = dispinterface;
  _NODORowChangeEvent = interface;
  _NODORowChangeEventDisp = dispinterface;
  _FOTOAPOYORowChangeEvent = interface;
  _FOTOAPOYORowChangeEventDisp = dispinterface;
  _EXCAVACIONRowChangeEvent = interface;
  _EXCAVACIONRowChangeEventDisp = dispinterface;
  _DUCTOEXCAVACIONRowChangeEvent = interface;
  _DUCTOEXCAVACIONRowChangeEventDisp = dispinterface;
  _DETALLEAPOYORowChangeEvent = interface;
  _DETALLEAPOYORowChangeEventDisp = dispinterface;
  _DIRECCIONAPOYORowChangeEvent = interface;
  _DIRECCIONAPOYORowChangeEventDisp = dispinterface;
  _TRAMORowChangeEvent = interface;
  _TRAMORowChangeEventDisp = dispinterface;
  _PARARRAYODISRowChangeEvent = interface;
  _PARARRAYODISRowChangeEventDisp = dispinterface;
  _INTERRUPTORDISRowChangeEvent = interface;
  _INTERRUPTORDISRowChangeEventDisp = dispinterface;
  _TRAFODISRowChangeEvent = interface;
  _TRAFODISRowChangeEventDisp = dispinterface;
  _CONDENSADORRowChangeEvent = interface;
  _CONDENSADORRowChangeEventDisp = dispinterface;
  _CLIENTESGDRowChangeEvent = interface;
  _CLIENTESGDRowChangeEventDisp = dispinterface;
  _ALUMBRADOPUBLICORowChangeEvent = interface;
  _ALUMBRADOPUBLICORowChangeEventDisp = dispinterface;
  _DIRECCIONCLIENTERowChangeEvent = interface;
  _DIRECCIONCLIENTERowChangeEventDisp = dispinterface;
  _FOTOCLIENTERowChangeEvent = interface;
  _FOTOCLIENTERowChangeEventDisp = dispinterface;
  _PUNTODEMEDIDARowChangeEvent = interface;
  _PUNTODEMEDIDARowChangeEventDisp = dispinterface;
  _MEDIDORSGDRowChangeEvent = interface;
  _MEDIDORSGDRowChangeEventDisp = dispinterface;
  _INCIDENTALDUCTORowChangeEvent = interface;
  _INCIDENTALDUCTORowChangeEventDisp = dispinterface;
  _ODTRowChangeEvent = interface;
  _ODTRowChangeEventDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                     //
// (NOTE: Here we map each CoClass to its Default Interface)            //
// *********************************************************************//
  Cl_Exportar_XML = _Cl_Exportar_XML;
  Cl_Importar_XML = _Cl_Importar_XML;
  Datos = _Datos;
  APOYORowChangeEventHandler = _APOYORowChangeEventHandler;
  INCIDENTALAPOYORowChangeEventHandler = _INCIDENTALAPOYORowChangeEventHandler;
  NODORowChangeEventHandler = _NODORowChangeEventHandler;
  FOTOAPOYORowChangeEventHandler = _FOTOAPOYORowChangeEventHandler;
  EXCAVACIONRowChangeEventHandler = _EXCAVACIONRowChangeEventHandler;
  DUCTOEXCAVACIONRowChangeEventHandler = _DUCTOEXCAVACIONRowChangeEventHandler;
  DETALLEAPOYORowChangeEventHandler = _DETALLEAPOYORowChangeEventHandler;
  DIRECCIONAPOYORowChangeEventHandler = _DIRECCIONAPOYORowChangeEventHandler;
  TRAMORowChangeEventHandler = _TRAMORowChangeEventHandler;
  PARARRAYODISRowChangeEventHandler = _PARARRAYODISRowChangeEventHandler;
  INTERRUPTORDISRowChangeEventHandler = _INTERRUPTORDISRowChangeEventHandler;
  TRAFODISRowChangeEventHandler = _TRAFODISRowChangeEventHandler;
  CONDENSADORRowChangeEventHandler = _CONDENSADORRowChangeEventHandler;
  CLIENTESGDRowChangeEventHandler = _CLIENTESGDRowChangeEventHandler;
  ALUMBRADOPUBLICORowChangeEventHandler = _ALUMBRADOPUBLICORowChangeEventHandler;
  DIRECCIONCLIENTERowChangeEventHandler = _DIRECCIONCLIENTERowChangeEventHandler;
  FOTOCLIENTERowChangeEventHandler = _FOTOCLIENTERowChangeEventHandler;
  PUNTODEMEDIDARowChangeEventHandler = _PUNTODEMEDIDARowChangeEventHandler;
  MEDIDORSGDRowChangeEventHandler = _MEDIDORSGDRowChangeEventHandler;
  INCIDENTALDUCTORowChangeEventHandler = _INCIDENTALDUCTORowChangeEventHandler;
  ODTRowChangeEventHandler = _ODTRowChangeEventHandler;
  APOYODataTable = _APOYODataTable;
  INCIDENTALAPOYODataTable = _INCIDENTALAPOYODataTable;
  NODODataTable = _NODODataTable;
  FOTOAPOYODataTable = _FOTOAPOYODataTable;
  EXCAVACIONDataTable = _EXCAVACIONDataTable;
  DUCTOEXCAVACIONDataTable = _DUCTOEXCAVACIONDataTable;
  DETALLEAPOYODataTable = _DETALLEAPOYODataTable;
  DIRECCIONAPOYODataTable = _DIRECCIONAPOYODataTable;
  TRAMODataTable = _TRAMODataTable;
  PARARRAYODISDataTable = _PARARRAYODISDataTable;
  INTERRUPTORDISDataTable = _INTERRUPTORDISDataTable;
  TRAFODISDataTable = _TRAFODISDataTable;
  CONDENSADORDataTable = _CONDENSADORDataTable;
  CLIENTESGDDataTable = _CLIENTESGDDataTable;
  ALUMBRADOPUBLICODataTable = _ALUMBRADOPUBLICODataTable;
  DIRECCIONCLIENTEDataTable = _DIRECCIONCLIENTEDataTable;
  FOTOCLIENTEDataTable = _FOTOCLIENTEDataTable;
  PUNTODEMEDIDADataTable = _PUNTODEMEDIDADataTable;
  MEDIDORSGDDataTable = _MEDIDORSGDDataTable;
  INCIDENTALDUCTODataTable = _INCIDENTALDUCTODataTable;
  ODTDataTable = _ODTDataTable;
  APOYORow = _APOYORow;
  INCIDENTALAPOYORow = _INCIDENTALAPOYORow;
  NODORow = _NODORow;
  FOTOAPOYORow = _FOTOAPOYORow;
  EXCAVACIONRow = _EXCAVACIONRow;
  DUCTOEXCAVACIONRow = _DUCTOEXCAVACIONRow;
  DETALLEAPOYORow = _DETALLEAPOYORow;
  DIRECCIONAPOYORow = _DIRECCIONAPOYORow;
  TRAMORow = _TRAMORow;
  PARARRAYODISRow = _PARARRAYODISRow;
  INTERRUPTORDISRow = _INTERRUPTORDISRow;
  TRAFODISRow = _TRAFODISRow;
  CONDENSADORRow = _CONDENSADORRow;
  CLIENTESGDRow = _CLIENTESGDRow;
  ALUMBRADOPUBLICORow = _ALUMBRADOPUBLICORow;
  DIRECCIONCLIENTERow = _DIRECCIONCLIENTERow;
  FOTOCLIENTERow = _FOTOCLIENTERow;
  PUNTODEMEDIDARow = _PUNTODEMEDIDARow;
  MEDIDORSGDRow = _MEDIDORSGDRow;
  INCIDENTALDUCTORow = _INCIDENTALDUCTORow;
  ODTRow = _ODTRow;
  APOYORowChangeEvent = _APOYORowChangeEvent;
  INCIDENTALAPOYORowChangeEvent = _INCIDENTALAPOYORowChangeEvent;
  NODORowChangeEvent = _NODORowChangeEvent;
  FOTOAPOYORowChangeEvent = _FOTOAPOYORowChangeEvent;
  EXCAVACIONRowChangeEvent = _EXCAVACIONRowChangeEvent;
  DUCTOEXCAVACIONRowChangeEvent = _DUCTOEXCAVACIONRowChangeEvent;
  DETALLEAPOYORowChangeEvent = _DETALLEAPOYORowChangeEvent;
  DIRECCIONAPOYORowChangeEvent = _DIRECCIONAPOYORowChangeEvent;
  TRAMORowChangeEvent = _TRAMORowChangeEvent;
  PARARRAYODISRowChangeEvent = _PARARRAYODISRowChangeEvent;
  INTERRUPTORDISRowChangeEvent = _INTERRUPTORDISRowChangeEvent;
  TRAFODISRowChangeEvent = _TRAFODISRowChangeEvent;
  CONDENSADORRowChangeEvent = _CONDENSADORRowChangeEvent;
  CLIENTESGDRowChangeEvent = _CLIENTESGDRowChangeEvent;
  ALUMBRADOPUBLICORowChangeEvent = _ALUMBRADOPUBLICORowChangeEvent;
  DIRECCIONCLIENTERowChangeEvent = _DIRECCIONCLIENTERowChangeEvent;
  FOTOCLIENTERowChangeEvent = _FOTOCLIENTERowChangeEvent;
  PUNTODEMEDIDARowChangeEvent = _PUNTODEMEDIDARowChangeEvent;
  MEDIDORSGDRowChangeEvent = _MEDIDORSGDRowChangeEvent;
  INCIDENTALDUCTORowChangeEvent = _INCIDENTALDUCTORowChangeEvent;
  ODTRowChangeEvent = _ODTRowChangeEvent;


// *********************************************************************//
// Interface: ICl_Exportar_XML
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4A433BCC-8883-34B5-B1B7-A4AA475F1C59}
// *********************************************************************//
  ICl_Exportar_XML = interface(IDispatch)
    ['{4A433BCC-8883-34B5-B1B7-A4AA475F1C59}']
    procedure Exportar(const Directorio: WideString; const Servidor: WideString; 
                       const Usuario: WideString; const Contrase_a: WideString; 
                       const CodigoODT: WideString; const CodigoODTHija: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  ICl_Exportar_XMLDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4A433BCC-8883-34B5-B1B7-A4AA475F1C59}
// *********************************************************************//
  ICl_Exportar_XMLDisp = dispinterface
    ['{4A433BCC-8883-34B5-B1B7-A4AA475F1C59}']
    procedure Exportar(const Directorio: WideString; const Servidor: WideString; 
                       const Usuario: WideString; const Contrase_a: WideString; 
                       const CodigoODT: WideString; const CodigoODTHija: WideString); dispid 1610743808;
  end;

// *********************************************************************//
// Interface: _Cl_Exportar_XML
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D3C08DD4-8E64-40CD-BA63-077B3987693C}
// *********************************************************************//
  _Cl_Exportar_XML = interface(IDispatch)
    ['{D3C08DD4-8E64-40CD-BA63-077B3987693C}']
    procedure Exportar(const Directorio: WideString; const Servidor: WideString; 
                       const Usuario: WideString; const Contrase_a: WideString; 
                       const CodigoODT: WideString; const CodigoODTHija: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  _Cl_Exportar_XMLDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D3C08DD4-8E64-40CD-BA63-077B3987693C}
// *********************************************************************//
  _Cl_Exportar_XMLDisp = dispinterface
    ['{D3C08DD4-8E64-40CD-BA63-077B3987693C}']
    procedure Exportar(const Directorio: WideString; const Servidor: WideString; 
                       const Usuario: WideString; const Contrase_a: WideString; 
                       const CodigoODT: WideString; const CodigoODTHija: WideString); dispid 1;
  end;

// *********************************************************************//
// Interface: ICl_Importar_XML
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {72AC5E92-A535-35BD-A28A-BD99DB014B66}
// *********************************************************************//
  ICl_Importar_XML = interface(IDispatch)
    ['{72AC5E92-A535-35BD-A28A-BD99DB014B66}']
    procedure Importar(const Directorio: WideString; const Servidor: WideString; 
                       const Usuario: WideString; const Contrase_a: WideString; 
                       const CodigoODT: WideString; const CodigoODTHija: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  ICl_Importar_XMLDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {72AC5E92-A535-35BD-A28A-BD99DB014B66}
// *********************************************************************//
  ICl_Importar_XMLDisp = dispinterface
    ['{72AC5E92-A535-35BD-A28A-BD99DB014B66}']
    procedure Importar(const Directorio: WideString; const Servidor: WideString; 
                       const Usuario: WideString; const Contrase_a: WideString; 
                       const CodigoODT: WideString; const CodigoODTHija: WideString); dispid 1610743808;
  end;

// *********************************************************************//
// Interface: _Cl_Importar_XML
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D3C08DD4-8E64-40CD-BA63-077B3987693B}
// *********************************************************************//
  _Cl_Importar_XML = interface(IDispatch)
    ['{D3C08DD4-8E64-40CD-BA63-077B3987693B}']
    procedure Importar(const Directorio: WideString; const Servidor: WideString; 
                       const Usuario: WideString; const Contrase_a: WideString; 
                       const CodigoODT: WideString; const CodigoODTHija: WideString); safecall;
  end;

// *********************************************************************//
// DispIntf:  _Cl_Importar_XMLDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {D3C08DD4-8E64-40CD-BA63-077B3987693B}
// *********************************************************************//
  _Cl_Importar_XMLDisp = dispinterface
    ['{D3C08DD4-8E64-40CD-BA63-077B3987693B}']
    procedure Importar(const Directorio: WideString; const Servidor: WideString; 
                       const Usuario: WideString; const Contrase_a: WideString; 
                       const CodigoODT: WideString; const CodigoODTHija: WideString); dispid 1;
  end;

// *********************************************************************//
// Interface: _Datos
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {6C356844-DADF-3350-8BE9-5B7C51D65CC8}
// *********************************************************************//
  _Datos = interface(IDispatch)
    ['{6C356844-DADF-3350-8BE9-5B7C51D65CC8}']
  end;

// *********************************************************************//
// DispIntf:  _DatosDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {6C356844-DADF-3350-8BE9-5B7C51D65CC8}
// *********************************************************************//
  _DatosDisp = dispinterface
    ['{6C356844-DADF-3350-8BE9-5B7C51D65CC8}']
  end;

// *********************************************************************//
// Interface: _APOYORowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D52E2BF1-EA7B-3FB7-9870-3F44AC39024D}
// *********************************************************************//
  _APOYORowChangeEventHandler = interface(IDispatch)
    ['{D52E2BF1-EA7B-3FB7-9870-3F44AC39024D}']
  end;

// *********************************************************************//
// DispIntf:  _APOYORowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D52E2BF1-EA7B-3FB7-9870-3F44AC39024D}
// *********************************************************************//
  _APOYORowChangeEventHandlerDisp = dispinterface
    ['{D52E2BF1-EA7B-3FB7-9870-3F44AC39024D}']
  end;

// *********************************************************************//
// Interface: _INCIDENTALAPOYORowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E81F7932-70FC-3DEA-805F-51381E51CF8A}
// *********************************************************************//
  _INCIDENTALAPOYORowChangeEventHandler = interface(IDispatch)
    ['{E81F7932-70FC-3DEA-805F-51381E51CF8A}']
  end;

// *********************************************************************//
// DispIntf:  _INCIDENTALAPOYORowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E81F7932-70FC-3DEA-805F-51381E51CF8A}
// *********************************************************************//
  _INCIDENTALAPOYORowChangeEventHandlerDisp = dispinterface
    ['{E81F7932-70FC-3DEA-805F-51381E51CF8A}']
  end;

// *********************************************************************//
// Interface: _NODORowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {B7044F6A-265C-3AF8-BBDA-D6A0CFC1D1E2}
// *********************************************************************//
  _NODORowChangeEventHandler = interface(IDispatch)
    ['{B7044F6A-265C-3AF8-BBDA-D6A0CFC1D1E2}']
  end;

// *********************************************************************//
// DispIntf:  _NODORowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {B7044F6A-265C-3AF8-BBDA-D6A0CFC1D1E2}
// *********************************************************************//
  _NODORowChangeEventHandlerDisp = dispinterface
    ['{B7044F6A-265C-3AF8-BBDA-D6A0CFC1D1E2}']
  end;

// *********************************************************************//
// Interface: _FOTOAPOYORowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {6F26B294-7880-3244-B490-36149EA75D86}
// *********************************************************************//
  _FOTOAPOYORowChangeEventHandler = interface(IDispatch)
    ['{6F26B294-7880-3244-B490-36149EA75D86}']
  end;

// *********************************************************************//
// DispIntf:  _FOTOAPOYORowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {6F26B294-7880-3244-B490-36149EA75D86}
// *********************************************************************//
  _FOTOAPOYORowChangeEventHandlerDisp = dispinterface
    ['{6F26B294-7880-3244-B490-36149EA75D86}']
  end;

// *********************************************************************//
// Interface: _EXCAVACIONRowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7FE27B24-4F58-32C4-9692-E9F80FAE3BBB}
// *********************************************************************//
  _EXCAVACIONRowChangeEventHandler = interface(IDispatch)
    ['{7FE27B24-4F58-32C4-9692-E9F80FAE3BBB}']
  end;

// *********************************************************************//
// DispIntf:  _EXCAVACIONRowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7FE27B24-4F58-32C4-9692-E9F80FAE3BBB}
// *********************************************************************//
  _EXCAVACIONRowChangeEventHandlerDisp = dispinterface
    ['{7FE27B24-4F58-32C4-9692-E9F80FAE3BBB}']
  end;

// *********************************************************************//
// Interface: _DUCTOEXCAVACIONRowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {40671649-D772-35FA-9612-1ED21CA0127D}
// *********************************************************************//
  _DUCTOEXCAVACIONRowChangeEventHandler = interface(IDispatch)
    ['{40671649-D772-35FA-9612-1ED21CA0127D}']
  end;

// *********************************************************************//
// DispIntf:  _DUCTOEXCAVACIONRowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {40671649-D772-35FA-9612-1ED21CA0127D}
// *********************************************************************//
  _DUCTOEXCAVACIONRowChangeEventHandlerDisp = dispinterface
    ['{40671649-D772-35FA-9612-1ED21CA0127D}']
  end;

// *********************************************************************//
// Interface: _DETALLEAPOYORowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C772FCBB-1F21-3C78-81BA-5921868FACE3}
// *********************************************************************//
  _DETALLEAPOYORowChangeEventHandler = interface(IDispatch)
    ['{C772FCBB-1F21-3C78-81BA-5921868FACE3}']
  end;

// *********************************************************************//
// DispIntf:  _DETALLEAPOYORowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C772FCBB-1F21-3C78-81BA-5921868FACE3}
// *********************************************************************//
  _DETALLEAPOYORowChangeEventHandlerDisp = dispinterface
    ['{C772FCBB-1F21-3C78-81BA-5921868FACE3}']
  end;

// *********************************************************************//
// Interface: _DIRECCIONAPOYORowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {25A1E553-F99D-3C7D-8DB0-E7E34E3F3073}
// *********************************************************************//
  _DIRECCIONAPOYORowChangeEventHandler = interface(IDispatch)
    ['{25A1E553-F99D-3C7D-8DB0-E7E34E3F3073}']
  end;

// *********************************************************************//
// DispIntf:  _DIRECCIONAPOYORowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {25A1E553-F99D-3C7D-8DB0-E7E34E3F3073}
// *********************************************************************//
  _DIRECCIONAPOYORowChangeEventHandlerDisp = dispinterface
    ['{25A1E553-F99D-3C7D-8DB0-E7E34E3F3073}']
  end;

// *********************************************************************//
// Interface: _TRAMORowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {48D6A79D-F3D6-3D75-A3A3-E983051BEABD}
// *********************************************************************//
  _TRAMORowChangeEventHandler = interface(IDispatch)
    ['{48D6A79D-F3D6-3D75-A3A3-E983051BEABD}']
  end;

// *********************************************************************//
// DispIntf:  _TRAMORowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {48D6A79D-F3D6-3D75-A3A3-E983051BEABD}
// *********************************************************************//
  _TRAMORowChangeEventHandlerDisp = dispinterface
    ['{48D6A79D-F3D6-3D75-A3A3-E983051BEABD}']
  end;

// *********************************************************************//
// Interface: _PARARRAYODISRowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {4C331520-A0A0-3A9C-9F3F-7E9A6CDCB2FE}
// *********************************************************************//
  _PARARRAYODISRowChangeEventHandler = interface(IDispatch)
    ['{4C331520-A0A0-3A9C-9F3F-7E9A6CDCB2FE}']
  end;

// *********************************************************************//
// DispIntf:  _PARARRAYODISRowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {4C331520-A0A0-3A9C-9F3F-7E9A6CDCB2FE}
// *********************************************************************//
  _PARARRAYODISRowChangeEventHandlerDisp = dispinterface
    ['{4C331520-A0A0-3A9C-9F3F-7E9A6CDCB2FE}']
  end;

// *********************************************************************//
// Interface: _INTERRUPTORDISRowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D5AAEF8E-F9C1-3F3C-9CE5-7A1782984D4D}
// *********************************************************************//
  _INTERRUPTORDISRowChangeEventHandler = interface(IDispatch)
    ['{D5AAEF8E-F9C1-3F3C-9CE5-7A1782984D4D}']
  end;

// *********************************************************************//
// DispIntf:  _INTERRUPTORDISRowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D5AAEF8E-F9C1-3F3C-9CE5-7A1782984D4D}
// *********************************************************************//
  _INTERRUPTORDISRowChangeEventHandlerDisp = dispinterface
    ['{D5AAEF8E-F9C1-3F3C-9CE5-7A1782984D4D}']
  end;

// *********************************************************************//
// Interface: _TRAFODISRowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {03BFF98B-4E7A-3C9C-B985-F8AC85B2B612}
// *********************************************************************//
  _TRAFODISRowChangeEventHandler = interface(IDispatch)
    ['{03BFF98B-4E7A-3C9C-B985-F8AC85B2B612}']
  end;

// *********************************************************************//
// DispIntf:  _TRAFODISRowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {03BFF98B-4E7A-3C9C-B985-F8AC85B2B612}
// *********************************************************************//
  _TRAFODISRowChangeEventHandlerDisp = dispinterface
    ['{03BFF98B-4E7A-3C9C-B985-F8AC85B2B612}']
  end;

// *********************************************************************//
// Interface: _CONDENSADORRowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D323B9BD-4833-32C4-9105-430FCBD75548}
// *********************************************************************//
  _CONDENSADORRowChangeEventHandler = interface(IDispatch)
    ['{D323B9BD-4833-32C4-9105-430FCBD75548}']
  end;

// *********************************************************************//
// DispIntf:  _CONDENSADORRowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D323B9BD-4833-32C4-9105-430FCBD75548}
// *********************************************************************//
  _CONDENSADORRowChangeEventHandlerDisp = dispinterface
    ['{D323B9BD-4833-32C4-9105-430FCBD75548}']
  end;

// *********************************************************************//
// Interface: _CLIENTESGDRowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F59C1FF7-7476-31B9-8884-07642DFC6F85}
// *********************************************************************//
  _CLIENTESGDRowChangeEventHandler = interface(IDispatch)
    ['{F59C1FF7-7476-31B9-8884-07642DFC6F85}']
  end;

// *********************************************************************//
// DispIntf:  _CLIENTESGDRowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F59C1FF7-7476-31B9-8884-07642DFC6F85}
// *********************************************************************//
  _CLIENTESGDRowChangeEventHandlerDisp = dispinterface
    ['{F59C1FF7-7476-31B9-8884-07642DFC6F85}']
  end;

// *********************************************************************//
// Interface: _ALUMBRADOPUBLICORowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {ECF03016-A9C8-3913-8C10-AD3CA2882282}
// *********************************************************************//
  _ALUMBRADOPUBLICORowChangeEventHandler = interface(IDispatch)
    ['{ECF03016-A9C8-3913-8C10-AD3CA2882282}']
  end;

// *********************************************************************//
// DispIntf:  _ALUMBRADOPUBLICORowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {ECF03016-A9C8-3913-8C10-AD3CA2882282}
// *********************************************************************//
  _ALUMBRADOPUBLICORowChangeEventHandlerDisp = dispinterface
    ['{ECF03016-A9C8-3913-8C10-AD3CA2882282}']
  end;

// *********************************************************************//
// Interface: _DIRECCIONCLIENTERowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {B443E171-6044-379E-9EFD-5EC198EB44CA}
// *********************************************************************//
  _DIRECCIONCLIENTERowChangeEventHandler = interface(IDispatch)
    ['{B443E171-6044-379E-9EFD-5EC198EB44CA}']
  end;

// *********************************************************************//
// DispIntf:  _DIRECCIONCLIENTERowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {B443E171-6044-379E-9EFD-5EC198EB44CA}
// *********************************************************************//
  _DIRECCIONCLIENTERowChangeEventHandlerDisp = dispinterface
    ['{B443E171-6044-379E-9EFD-5EC198EB44CA}']
  end;

// *********************************************************************//
// Interface: _FOTOCLIENTERowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {1517937A-A748-359A-8724-6B0918612403}
// *********************************************************************//
  _FOTOCLIENTERowChangeEventHandler = interface(IDispatch)
    ['{1517937A-A748-359A-8724-6B0918612403}']
  end;

// *********************************************************************//
// DispIntf:  _FOTOCLIENTERowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {1517937A-A748-359A-8724-6B0918612403}
// *********************************************************************//
  _FOTOCLIENTERowChangeEventHandlerDisp = dispinterface
    ['{1517937A-A748-359A-8724-6B0918612403}']
  end;

// *********************************************************************//
// Interface: _PUNTODEMEDIDARowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D18D27D3-FABC-3230-BB8C-1241D6706041}
// *********************************************************************//
  _PUNTODEMEDIDARowChangeEventHandler = interface(IDispatch)
    ['{D18D27D3-FABC-3230-BB8C-1241D6706041}']
  end;

// *********************************************************************//
// DispIntf:  _PUNTODEMEDIDARowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D18D27D3-FABC-3230-BB8C-1241D6706041}
// *********************************************************************//
  _PUNTODEMEDIDARowChangeEventHandlerDisp = dispinterface
    ['{D18D27D3-FABC-3230-BB8C-1241D6706041}']
  end;

// *********************************************************************//
// Interface: _MEDIDORSGDRowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {EE458071-5B30-3390-8F3E-D317C3495CF9}
// *********************************************************************//
  _MEDIDORSGDRowChangeEventHandler = interface(IDispatch)
    ['{EE458071-5B30-3390-8F3E-D317C3495CF9}']
  end;

// *********************************************************************//
// DispIntf:  _MEDIDORSGDRowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {EE458071-5B30-3390-8F3E-D317C3495CF9}
// *********************************************************************//
  _MEDIDORSGDRowChangeEventHandlerDisp = dispinterface
    ['{EE458071-5B30-3390-8F3E-D317C3495CF9}']
  end;

// *********************************************************************//
// Interface: _INCIDENTALDUCTORowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {14E7A246-EE48-3CBB-B71C-0F72639D8674}
// *********************************************************************//
  _INCIDENTALDUCTORowChangeEventHandler = interface(IDispatch)
    ['{14E7A246-EE48-3CBB-B71C-0F72639D8674}']
  end;

// *********************************************************************//
// DispIntf:  _INCIDENTALDUCTORowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {14E7A246-EE48-3CBB-B71C-0F72639D8674}
// *********************************************************************//
  _INCIDENTALDUCTORowChangeEventHandlerDisp = dispinterface
    ['{14E7A246-EE48-3CBB-B71C-0F72639D8674}']
  end;

// *********************************************************************//
// Interface: _ODTRowChangeEventHandler
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2EB020FB-0669-3E0E-93F8-625436FF4017}
// *********************************************************************//
  _ODTRowChangeEventHandler = interface(IDispatch)
    ['{2EB020FB-0669-3E0E-93F8-625436FF4017}']
  end;

// *********************************************************************//
// DispIntf:  _ODTRowChangeEventHandlerDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2EB020FB-0669-3E0E-93F8-625436FF4017}
// *********************************************************************//
  _ODTRowChangeEventHandlerDisp = dispinterface
    ['{2EB020FB-0669-3E0E-93F8-625436FF4017}']
  end;

// *********************************************************************//
// Interface: _APOYODataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {B91AE5CF-0317-3706-BD04-A45AB66B37E8}
// *********************************************************************//
  _APOYODataTable = interface(IDispatch)
    ['{B91AE5CF-0317-3706-BD04-A45AB66B37E8}']
  end;

// *********************************************************************//
// DispIntf:  _APOYODataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {B91AE5CF-0317-3706-BD04-A45AB66B37E8}
// *********************************************************************//
  _APOYODataTableDisp = dispinterface
    ['{B91AE5CF-0317-3706-BD04-A45AB66B37E8}']
  end;

// *********************************************************************//
// Interface: _INCIDENTALAPOYODataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {85579AB8-12A3-39C3-98A8-96E5242E829C}
// *********************************************************************//
  _INCIDENTALAPOYODataTable = interface(IDispatch)
    ['{85579AB8-12A3-39C3-98A8-96E5242E829C}']
  end;

// *********************************************************************//
// DispIntf:  _INCIDENTALAPOYODataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {85579AB8-12A3-39C3-98A8-96E5242E829C}
// *********************************************************************//
  _INCIDENTALAPOYODataTableDisp = dispinterface
    ['{85579AB8-12A3-39C3-98A8-96E5242E829C}']
  end;

// *********************************************************************//
// Interface: _NODODataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E463B68C-0B06-3A49-A46A-1D22FD5F0BF4}
// *********************************************************************//
  _NODODataTable = interface(IDispatch)
    ['{E463B68C-0B06-3A49-A46A-1D22FD5F0BF4}']
  end;

// *********************************************************************//
// DispIntf:  _NODODataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E463B68C-0B06-3A49-A46A-1D22FD5F0BF4}
// *********************************************************************//
  _NODODataTableDisp = dispinterface
    ['{E463B68C-0B06-3A49-A46A-1D22FD5F0BF4}']
  end;

// *********************************************************************//
// Interface: _FOTOAPOYODataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {88C3B0B0-AD80-32BE-8C6F-FBFD0E6B8A89}
// *********************************************************************//
  _FOTOAPOYODataTable = interface(IDispatch)
    ['{88C3B0B0-AD80-32BE-8C6F-FBFD0E6B8A89}']
  end;

// *********************************************************************//
// DispIntf:  _FOTOAPOYODataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {88C3B0B0-AD80-32BE-8C6F-FBFD0E6B8A89}
// *********************************************************************//
  _FOTOAPOYODataTableDisp = dispinterface
    ['{88C3B0B0-AD80-32BE-8C6F-FBFD0E6B8A89}']
  end;

// *********************************************************************//
// Interface: _EXCAVACIONDataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {5AE63D2B-3D8A-32AA-8B9B-CB04650C98BF}
// *********************************************************************//
  _EXCAVACIONDataTable = interface(IDispatch)
    ['{5AE63D2B-3D8A-32AA-8B9B-CB04650C98BF}']
  end;

// *********************************************************************//
// DispIntf:  _EXCAVACIONDataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {5AE63D2B-3D8A-32AA-8B9B-CB04650C98BF}
// *********************************************************************//
  _EXCAVACIONDataTableDisp = dispinterface
    ['{5AE63D2B-3D8A-32AA-8B9B-CB04650C98BF}']
  end;

// *********************************************************************//
// Interface: _DUCTOEXCAVACIONDataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {9677D4DA-6F2F-398B-A517-443189DD4F9E}
// *********************************************************************//
  _DUCTOEXCAVACIONDataTable = interface(IDispatch)
    ['{9677D4DA-6F2F-398B-A517-443189DD4F9E}']
  end;

// *********************************************************************//
// DispIntf:  _DUCTOEXCAVACIONDataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {9677D4DA-6F2F-398B-A517-443189DD4F9E}
// *********************************************************************//
  _DUCTOEXCAVACIONDataTableDisp = dispinterface
    ['{9677D4DA-6F2F-398B-A517-443189DD4F9E}']
  end;

// *********************************************************************//
// Interface: _DETALLEAPOYODataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {67B72A88-E232-327B-B1C3-831290B06758}
// *********************************************************************//
  _DETALLEAPOYODataTable = interface(IDispatch)
    ['{67B72A88-E232-327B-B1C3-831290B06758}']
  end;

// *********************************************************************//
// DispIntf:  _DETALLEAPOYODataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {67B72A88-E232-327B-B1C3-831290B06758}
// *********************************************************************//
  _DETALLEAPOYODataTableDisp = dispinterface
    ['{67B72A88-E232-327B-B1C3-831290B06758}']
  end;

// *********************************************************************//
// Interface: _DIRECCIONAPOYODataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {6BF6950F-CA2B-3F1A-B83F-49995DD52BB5}
// *********************************************************************//
  _DIRECCIONAPOYODataTable = interface(IDispatch)
    ['{6BF6950F-CA2B-3F1A-B83F-49995DD52BB5}']
  end;

// *********************************************************************//
// DispIntf:  _DIRECCIONAPOYODataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {6BF6950F-CA2B-3F1A-B83F-49995DD52BB5}
// *********************************************************************//
  _DIRECCIONAPOYODataTableDisp = dispinterface
    ['{6BF6950F-CA2B-3F1A-B83F-49995DD52BB5}']
  end;

// *********************************************************************//
// Interface: _TRAMODataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {67FB907B-B2D9-3492-9DF2-54EB444AC6CA}
// *********************************************************************//
  _TRAMODataTable = interface(IDispatch)
    ['{67FB907B-B2D9-3492-9DF2-54EB444AC6CA}']
  end;

// *********************************************************************//
// DispIntf:  _TRAMODataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {67FB907B-B2D9-3492-9DF2-54EB444AC6CA}
// *********************************************************************//
  _TRAMODataTableDisp = dispinterface
    ['{67FB907B-B2D9-3492-9DF2-54EB444AC6CA}']
  end;

// *********************************************************************//
// Interface: _PARARRAYODISDataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {1417D1AD-44B2-308B-8294-587FD3E91C28}
// *********************************************************************//
  _PARARRAYODISDataTable = interface(IDispatch)
    ['{1417D1AD-44B2-308B-8294-587FD3E91C28}']
  end;

// *********************************************************************//
// DispIntf:  _PARARRAYODISDataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {1417D1AD-44B2-308B-8294-587FD3E91C28}
// *********************************************************************//
  _PARARRAYODISDataTableDisp = dispinterface
    ['{1417D1AD-44B2-308B-8294-587FD3E91C28}']
  end;

// *********************************************************************//
// Interface: _INTERRUPTORDISDataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {0A9A0B01-767C-3071-8D0B-4BFE5D9F67A3}
// *********************************************************************//
  _INTERRUPTORDISDataTable = interface(IDispatch)
    ['{0A9A0B01-767C-3071-8D0B-4BFE5D9F67A3}']
  end;

// *********************************************************************//
// DispIntf:  _INTERRUPTORDISDataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {0A9A0B01-767C-3071-8D0B-4BFE5D9F67A3}
// *********************************************************************//
  _INTERRUPTORDISDataTableDisp = dispinterface
    ['{0A9A0B01-767C-3071-8D0B-4BFE5D9F67A3}']
  end;

// *********************************************************************//
// Interface: _TRAFODISDataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3D9D17D2-2DE0-307C-BFCD-E00EEA0D8961}
// *********************************************************************//
  _TRAFODISDataTable = interface(IDispatch)
    ['{3D9D17D2-2DE0-307C-BFCD-E00EEA0D8961}']
  end;

// *********************************************************************//
// DispIntf:  _TRAFODISDataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3D9D17D2-2DE0-307C-BFCD-E00EEA0D8961}
// *********************************************************************//
  _TRAFODISDataTableDisp = dispinterface
    ['{3D9D17D2-2DE0-307C-BFCD-E00EEA0D8961}']
  end;

// *********************************************************************//
// Interface: _CONDENSADORDataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {21747BCC-B3E4-3892-8D80-374230B82BE8}
// *********************************************************************//
  _CONDENSADORDataTable = interface(IDispatch)
    ['{21747BCC-B3E4-3892-8D80-374230B82BE8}']
  end;

// *********************************************************************//
// DispIntf:  _CONDENSADORDataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {21747BCC-B3E4-3892-8D80-374230B82BE8}
// *********************************************************************//
  _CONDENSADORDataTableDisp = dispinterface
    ['{21747BCC-B3E4-3892-8D80-374230B82BE8}']
  end;

// *********************************************************************//
// Interface: _CLIENTESGDDataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D295106A-8615-3D56-AA15-5BD8B5E455D1}
// *********************************************************************//
  _CLIENTESGDDataTable = interface(IDispatch)
    ['{D295106A-8615-3D56-AA15-5BD8B5E455D1}']
  end;

// *********************************************************************//
// DispIntf:  _CLIENTESGDDataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {D295106A-8615-3D56-AA15-5BD8B5E455D1}
// *********************************************************************//
  _CLIENTESGDDataTableDisp = dispinterface
    ['{D295106A-8615-3D56-AA15-5BD8B5E455D1}']
  end;

// *********************************************************************//
// Interface: _ALUMBRADOPUBLICODataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E6981F3F-B051-3045-8827-D8C36986EE24}
// *********************************************************************//
  _ALUMBRADOPUBLICODataTable = interface(IDispatch)
    ['{E6981F3F-B051-3045-8827-D8C36986EE24}']
  end;

// *********************************************************************//
// DispIntf:  _ALUMBRADOPUBLICODataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E6981F3F-B051-3045-8827-D8C36986EE24}
// *********************************************************************//
  _ALUMBRADOPUBLICODataTableDisp = dispinterface
    ['{E6981F3F-B051-3045-8827-D8C36986EE24}']
  end;

// *********************************************************************//
// Interface: _DIRECCIONCLIENTEDataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {FC690AA7-C62D-35F2-8E07-17F7AB43AA6F}
// *********************************************************************//
  _DIRECCIONCLIENTEDataTable = interface(IDispatch)
    ['{FC690AA7-C62D-35F2-8E07-17F7AB43AA6F}']
  end;

// *********************************************************************//
// DispIntf:  _DIRECCIONCLIENTEDataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {FC690AA7-C62D-35F2-8E07-17F7AB43AA6F}
// *********************************************************************//
  _DIRECCIONCLIENTEDataTableDisp = dispinterface
    ['{FC690AA7-C62D-35F2-8E07-17F7AB43AA6F}']
  end;

// *********************************************************************//
// Interface: _FOTOCLIENTEDataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {FC47F138-105D-3A27-8974-615C93B4F64A}
// *********************************************************************//
  _FOTOCLIENTEDataTable = interface(IDispatch)
    ['{FC47F138-105D-3A27-8974-615C93B4F64A}']
  end;

// *********************************************************************//
// DispIntf:  _FOTOCLIENTEDataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {FC47F138-105D-3A27-8974-615C93B4F64A}
// *********************************************************************//
  _FOTOCLIENTEDataTableDisp = dispinterface
    ['{FC47F138-105D-3A27-8974-615C93B4F64A}']
  end;

// *********************************************************************//
// Interface: _PUNTODEMEDIDADataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7EDAA8CB-30BB-35A2-AE1D-0DE639AF785F}
// *********************************************************************//
  _PUNTODEMEDIDADataTable = interface(IDispatch)
    ['{7EDAA8CB-30BB-35A2-AE1D-0DE639AF785F}']
  end;

// *********************************************************************//
// DispIntf:  _PUNTODEMEDIDADataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7EDAA8CB-30BB-35A2-AE1D-0DE639AF785F}
// *********************************************************************//
  _PUNTODEMEDIDADataTableDisp = dispinterface
    ['{7EDAA8CB-30BB-35A2-AE1D-0DE639AF785F}']
  end;

// *********************************************************************//
// Interface: _MEDIDORSGDDataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2C811D65-E624-3271-BC60-BF06B512BD44}
// *********************************************************************//
  _MEDIDORSGDDataTable = interface(IDispatch)
    ['{2C811D65-E624-3271-BC60-BF06B512BD44}']
  end;

// *********************************************************************//
// DispIntf:  _MEDIDORSGDDataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2C811D65-E624-3271-BC60-BF06B512BD44}
// *********************************************************************//
  _MEDIDORSGDDataTableDisp = dispinterface
    ['{2C811D65-E624-3271-BC60-BF06B512BD44}']
  end;

// *********************************************************************//
// Interface: _INCIDENTALDUCTODataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E7C0C544-3E74-32A2-81B0-5E89DD56EBFE}
// *********************************************************************//
  _INCIDENTALDUCTODataTable = interface(IDispatch)
    ['{E7C0C544-3E74-32A2-81B0-5E89DD56EBFE}']
  end;

// *********************************************************************//
// DispIntf:  _INCIDENTALDUCTODataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E7C0C544-3E74-32A2-81B0-5E89DD56EBFE}
// *********************************************************************//
  _INCIDENTALDUCTODataTableDisp = dispinterface
    ['{E7C0C544-3E74-32A2-81B0-5E89DD56EBFE}']
  end;

// *********************************************************************//
// Interface: _ODTDataTable
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E9039013-B808-31A8-93E9-20E153BE5ADD}
// *********************************************************************//
  _ODTDataTable = interface(IDispatch)
    ['{E9039013-B808-31A8-93E9-20E153BE5ADD}']
  end;

// *********************************************************************//
// DispIntf:  _ODTDataTableDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E9039013-B808-31A8-93E9-20E153BE5ADD}
// *********************************************************************//
  _ODTDataTableDisp = dispinterface
    ['{E9039013-B808-31A8-93E9-20E153BE5ADD}']
  end;

// *********************************************************************//
// Interface: _APOYORow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {A979BE5F-1BD6-351E-9E5F-30C1880FA6CF}
// *********************************************************************//
  _APOYORow = interface(IDispatch)
    ['{A979BE5F-1BD6-351E-9E5F-30C1880FA6CF}']
  end;

// *********************************************************************//
// DispIntf:  _APOYORowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {A979BE5F-1BD6-351E-9E5F-30C1880FA6CF}
// *********************************************************************//
  _APOYORowDisp = dispinterface
    ['{A979BE5F-1BD6-351E-9E5F-30C1880FA6CF}']
  end;

// *********************************************************************//
// Interface: _INCIDENTALAPOYORow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C1F56E35-9945-36DB-AAD3-876378673172}
// *********************************************************************//
  _INCIDENTALAPOYORow = interface(IDispatch)
    ['{C1F56E35-9945-36DB-AAD3-876378673172}']
  end;

// *********************************************************************//
// DispIntf:  _INCIDENTALAPOYORowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C1F56E35-9945-36DB-AAD3-876378673172}
// *********************************************************************//
  _INCIDENTALAPOYORowDisp = dispinterface
    ['{C1F56E35-9945-36DB-AAD3-876378673172}']
  end;

// *********************************************************************//
// Interface: _NODORow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E63CDF16-2592-3CC8-AC00-316A19A492B7}
// *********************************************************************//
  _NODORow = interface(IDispatch)
    ['{E63CDF16-2592-3CC8-AC00-316A19A492B7}']
  end;

// *********************************************************************//
// DispIntf:  _NODORowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E63CDF16-2592-3CC8-AC00-316A19A492B7}
// *********************************************************************//
  _NODORowDisp = dispinterface
    ['{E63CDF16-2592-3CC8-AC00-316A19A492B7}']
  end;

// *********************************************************************//
// Interface: _FOTOAPOYORow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7D796DEC-A6DA-3C25-A27A-18097897E21C}
// *********************************************************************//
  _FOTOAPOYORow = interface(IDispatch)
    ['{7D796DEC-A6DA-3C25-A27A-18097897E21C}']
  end;

// *********************************************************************//
// DispIntf:  _FOTOAPOYORowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7D796DEC-A6DA-3C25-A27A-18097897E21C}
// *********************************************************************//
  _FOTOAPOYORowDisp = dispinterface
    ['{7D796DEC-A6DA-3C25-A27A-18097897E21C}']
  end;

// *********************************************************************//
// Interface: _EXCAVACIONRow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {883FE6B2-C96F-3250-924B-5C00E0B19EA9}
// *********************************************************************//
  _EXCAVACIONRow = interface(IDispatch)
    ['{883FE6B2-C96F-3250-924B-5C00E0B19EA9}']
  end;

// *********************************************************************//
// DispIntf:  _EXCAVACIONRowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {883FE6B2-C96F-3250-924B-5C00E0B19EA9}
// *********************************************************************//
  _EXCAVACIONRowDisp = dispinterface
    ['{883FE6B2-C96F-3250-924B-5C00E0B19EA9}']
  end;

// *********************************************************************//
// Interface: _DUCTOEXCAVACIONRow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2EC4A081-0B40-3FD9-8953-82726838D573}
// *********************************************************************//
  _DUCTOEXCAVACIONRow = interface(IDispatch)
    ['{2EC4A081-0B40-3FD9-8953-82726838D573}']
  end;

// *********************************************************************//
// DispIntf:  _DUCTOEXCAVACIONRowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2EC4A081-0B40-3FD9-8953-82726838D573}
// *********************************************************************//
  _DUCTOEXCAVACIONRowDisp = dispinterface
    ['{2EC4A081-0B40-3FD9-8953-82726838D573}']
  end;

// *********************************************************************//
// Interface: _DETALLEAPOYORow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {B5C2D28E-CAD1-3702-A52D-4184F52B8CA3}
// *********************************************************************//
  _DETALLEAPOYORow = interface(IDispatch)
    ['{B5C2D28E-CAD1-3702-A52D-4184F52B8CA3}']
  end;

// *********************************************************************//
// DispIntf:  _DETALLEAPOYORowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {B5C2D28E-CAD1-3702-A52D-4184F52B8CA3}
// *********************************************************************//
  _DETALLEAPOYORowDisp = dispinterface
    ['{B5C2D28E-CAD1-3702-A52D-4184F52B8CA3}']
  end;

// *********************************************************************//
// Interface: _DIRECCIONAPOYORow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {5F0295C8-FD45-3E9E-9FAB-0A8D38154DEF}
// *********************************************************************//
  _DIRECCIONAPOYORow = interface(IDispatch)
    ['{5F0295C8-FD45-3E9E-9FAB-0A8D38154DEF}']
  end;

// *********************************************************************//
// DispIntf:  _DIRECCIONAPOYORowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {5F0295C8-FD45-3E9E-9FAB-0A8D38154DEF}
// *********************************************************************//
  _DIRECCIONAPOYORowDisp = dispinterface
    ['{5F0295C8-FD45-3E9E-9FAB-0A8D38154DEF}']
  end;

// *********************************************************************//
// Interface: _TRAMORow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E1F54ABE-C8C1-34EC-BD47-87B1B2A59E60}
// *********************************************************************//
  _TRAMORow = interface(IDispatch)
    ['{E1F54ABE-C8C1-34EC-BD47-87B1B2A59E60}']
  end;

// *********************************************************************//
// DispIntf:  _TRAMORowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E1F54ABE-C8C1-34EC-BD47-87B1B2A59E60}
// *********************************************************************//
  _TRAMORowDisp = dispinterface
    ['{E1F54ABE-C8C1-34EC-BD47-87B1B2A59E60}']
  end;

// *********************************************************************//
// Interface: _PARARRAYODISRow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {CB01B455-0481-3C6D-8D5D-9148BCF2C5CC}
// *********************************************************************//
  _PARARRAYODISRow = interface(IDispatch)
    ['{CB01B455-0481-3C6D-8D5D-9148BCF2C5CC}']
  end;

// *********************************************************************//
// DispIntf:  _PARARRAYODISRowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {CB01B455-0481-3C6D-8D5D-9148BCF2C5CC}
// *********************************************************************//
  _PARARRAYODISRowDisp = dispinterface
    ['{CB01B455-0481-3C6D-8D5D-9148BCF2C5CC}']
  end;

// *********************************************************************//
// Interface: _INTERRUPTORDISRow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3695EB5D-D812-3B77-A966-E91C551A2437}
// *********************************************************************//
  _INTERRUPTORDISRow = interface(IDispatch)
    ['{3695EB5D-D812-3B77-A966-E91C551A2437}']
  end;

// *********************************************************************//
// DispIntf:  _INTERRUPTORDISRowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3695EB5D-D812-3B77-A966-E91C551A2437}
// *********************************************************************//
  _INTERRUPTORDISRowDisp = dispinterface
    ['{3695EB5D-D812-3B77-A966-E91C551A2437}']
  end;

// *********************************************************************//
// Interface: _TRAFODISRow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C93661D0-6B84-373D-AC3F-CCC2E5EF83DB}
// *********************************************************************//
  _TRAFODISRow = interface(IDispatch)
    ['{C93661D0-6B84-373D-AC3F-CCC2E5EF83DB}']
  end;

// *********************************************************************//
// DispIntf:  _TRAFODISRowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {C93661D0-6B84-373D-AC3F-CCC2E5EF83DB}
// *********************************************************************//
  _TRAFODISRowDisp = dispinterface
    ['{C93661D0-6B84-373D-AC3F-CCC2E5EF83DB}']
  end;

// *********************************************************************//
// Interface: _CONDENSADORRow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {08115430-2EA0-33A5-B150-DFA84E5099CF}
// *********************************************************************//
  _CONDENSADORRow = interface(IDispatch)
    ['{08115430-2EA0-33A5-B150-DFA84E5099CF}']
  end;

// *********************************************************************//
// DispIntf:  _CONDENSADORRowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {08115430-2EA0-33A5-B150-DFA84E5099CF}
// *********************************************************************//
  _CONDENSADORRowDisp = dispinterface
    ['{08115430-2EA0-33A5-B150-DFA84E5099CF}']
  end;

// *********************************************************************//
// Interface: _CLIENTESGDRow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7D6C4E80-7074-326C-AB6C-563B444D6D52}
// *********************************************************************//
  _CLIENTESGDRow = interface(IDispatch)
    ['{7D6C4E80-7074-326C-AB6C-563B444D6D52}']
  end;

// *********************************************************************//
// DispIntf:  _CLIENTESGDRowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7D6C4E80-7074-326C-AB6C-563B444D6D52}
// *********************************************************************//
  _CLIENTESGDRowDisp = dispinterface
    ['{7D6C4E80-7074-326C-AB6C-563B444D6D52}']
  end;

// *********************************************************************//
// Interface: _ALUMBRADOPUBLICORow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {A588EC16-B7E6-3CD6-852B-9EBFF3D05B02}
// *********************************************************************//
  _ALUMBRADOPUBLICORow = interface(IDispatch)
    ['{A588EC16-B7E6-3CD6-852B-9EBFF3D05B02}']
  end;

// *********************************************************************//
// DispIntf:  _ALUMBRADOPUBLICORowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {A588EC16-B7E6-3CD6-852B-9EBFF3D05B02}
// *********************************************************************//
  _ALUMBRADOPUBLICORowDisp = dispinterface
    ['{A588EC16-B7E6-3CD6-852B-9EBFF3D05B02}']
  end;

// *********************************************************************//
// Interface: _DIRECCIONCLIENTERow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {131EB53D-00B0-34F5-8D5E-A79DFD2EDFD4}
// *********************************************************************//
  _DIRECCIONCLIENTERow = interface(IDispatch)
    ['{131EB53D-00B0-34F5-8D5E-A79DFD2EDFD4}']
  end;

// *********************************************************************//
// DispIntf:  _DIRECCIONCLIENTERowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {131EB53D-00B0-34F5-8D5E-A79DFD2EDFD4}
// *********************************************************************//
  _DIRECCIONCLIENTERowDisp = dispinterface
    ['{131EB53D-00B0-34F5-8D5E-A79DFD2EDFD4}']
  end;

// *********************************************************************//
// Interface: _FOTOCLIENTERow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {67F61040-039A-303E-B010-FD5CF6146862}
// *********************************************************************//
  _FOTOCLIENTERow = interface(IDispatch)
    ['{67F61040-039A-303E-B010-FD5CF6146862}']
  end;

// *********************************************************************//
// DispIntf:  _FOTOCLIENTERowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {67F61040-039A-303E-B010-FD5CF6146862}
// *********************************************************************//
  _FOTOCLIENTERowDisp = dispinterface
    ['{67F61040-039A-303E-B010-FD5CF6146862}']
  end;

// *********************************************************************//
// Interface: _PUNTODEMEDIDARow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {4FF6B315-970B-3403-9B6A-923483C9AADB}
// *********************************************************************//
  _PUNTODEMEDIDARow = interface(IDispatch)
    ['{4FF6B315-970B-3403-9B6A-923483C9AADB}']
  end;

// *********************************************************************//
// DispIntf:  _PUNTODEMEDIDARowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {4FF6B315-970B-3403-9B6A-923483C9AADB}
// *********************************************************************//
  _PUNTODEMEDIDARowDisp = dispinterface
    ['{4FF6B315-970B-3403-9B6A-923483C9AADB}']
  end;

// *********************************************************************//
// Interface: _MEDIDORSGDRow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {69A604D7-5717-30AC-BCF1-236642EBB4FC}
// *********************************************************************//
  _MEDIDORSGDRow = interface(IDispatch)
    ['{69A604D7-5717-30AC-BCF1-236642EBB4FC}']
  end;

// *********************************************************************//
// DispIntf:  _MEDIDORSGDRowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {69A604D7-5717-30AC-BCF1-236642EBB4FC}
// *********************************************************************//
  _MEDIDORSGDRowDisp = dispinterface
    ['{69A604D7-5717-30AC-BCF1-236642EBB4FC}']
  end;

// *********************************************************************//
// Interface: _INCIDENTALDUCTORow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F965D76B-1C44-31ED-9EE8-5B9062AF5A4C}
// *********************************************************************//
  _INCIDENTALDUCTORow = interface(IDispatch)
    ['{F965D76B-1C44-31ED-9EE8-5B9062AF5A4C}']
  end;

// *********************************************************************//
// DispIntf:  _INCIDENTALDUCTORowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F965D76B-1C44-31ED-9EE8-5B9062AF5A4C}
// *********************************************************************//
  _INCIDENTALDUCTORowDisp = dispinterface
    ['{F965D76B-1C44-31ED-9EE8-5B9062AF5A4C}']
  end;

// *********************************************************************//
// Interface: _ODTRow
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2439FCDA-80A6-3B49-AD22-F93ED854CE03}
// *********************************************************************//
  _ODTRow = interface(IDispatch)
    ['{2439FCDA-80A6-3B49-AD22-F93ED854CE03}']
  end;

// *********************************************************************//
// DispIntf:  _ODTRowDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2439FCDA-80A6-3B49-AD22-F93ED854CE03}
// *********************************************************************//
  _ODTRowDisp = dispinterface
    ['{2439FCDA-80A6-3B49-AD22-F93ED854CE03}']
  end;

// *********************************************************************//
// Interface: _APOYORowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {290C123D-AE37-351B-8283-989CBCEAADEF}
// *********************************************************************//
  _APOYORowChangeEvent = interface(IDispatch)
    ['{290C123D-AE37-351B-8283-989CBCEAADEF}']
  end;

// *********************************************************************//
// DispIntf:  _APOYORowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {290C123D-AE37-351B-8283-989CBCEAADEF}
// *********************************************************************//
  _APOYORowChangeEventDisp = dispinterface
    ['{290C123D-AE37-351B-8283-989CBCEAADEF}']
  end;

// *********************************************************************//
// Interface: _INCIDENTALAPOYORowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {5578D8BC-9748-3BE3-B50A-0117FBD36039}
// *********************************************************************//
  _INCIDENTALAPOYORowChangeEvent = interface(IDispatch)
    ['{5578D8BC-9748-3BE3-B50A-0117FBD36039}']
  end;

// *********************************************************************//
// DispIntf:  _INCIDENTALAPOYORowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {5578D8BC-9748-3BE3-B50A-0117FBD36039}
// *********************************************************************//
  _INCIDENTALAPOYORowChangeEventDisp = dispinterface
    ['{5578D8BC-9748-3BE3-B50A-0117FBD36039}']
  end;

// *********************************************************************//
// Interface: _NODORowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {8C6DBAB0-771E-3A45-B6E0-D2527F11C624}
// *********************************************************************//
  _NODORowChangeEvent = interface(IDispatch)
    ['{8C6DBAB0-771E-3A45-B6E0-D2527F11C624}']
  end;

// *********************************************************************//
// DispIntf:  _NODORowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {8C6DBAB0-771E-3A45-B6E0-D2527F11C624}
// *********************************************************************//
  _NODORowChangeEventDisp = dispinterface
    ['{8C6DBAB0-771E-3A45-B6E0-D2527F11C624}']
  end;

// *********************************************************************//
// Interface: _FOTOAPOYORowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E04E9928-8DC0-3861-8ACD-38BB8B4BF434}
// *********************************************************************//
  _FOTOAPOYORowChangeEvent = interface(IDispatch)
    ['{E04E9928-8DC0-3861-8ACD-38BB8B4BF434}']
  end;

// *********************************************************************//
// DispIntf:  _FOTOAPOYORowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E04E9928-8DC0-3861-8ACD-38BB8B4BF434}
// *********************************************************************//
  _FOTOAPOYORowChangeEventDisp = dispinterface
    ['{E04E9928-8DC0-3861-8ACD-38BB8B4BF434}']
  end;

// *********************************************************************//
// Interface: _EXCAVACIONRowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3F256F31-A055-3EBC-9C3D-8F2C8D28DF92}
// *********************************************************************//
  _EXCAVACIONRowChangeEvent = interface(IDispatch)
    ['{3F256F31-A055-3EBC-9C3D-8F2C8D28DF92}']
  end;

// *********************************************************************//
// DispIntf:  _EXCAVACIONRowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {3F256F31-A055-3EBC-9C3D-8F2C8D28DF92}
// *********************************************************************//
  _EXCAVACIONRowChangeEventDisp = dispinterface
    ['{3F256F31-A055-3EBC-9C3D-8F2C8D28DF92}']
  end;

// *********************************************************************//
// Interface: _DUCTOEXCAVACIONRowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {84226AD9-2F26-33A6-93E8-99209CD59C37}
// *********************************************************************//
  _DUCTOEXCAVACIONRowChangeEvent = interface(IDispatch)
    ['{84226AD9-2F26-33A6-93E8-99209CD59C37}']
  end;

// *********************************************************************//
// DispIntf:  _DUCTOEXCAVACIONRowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {84226AD9-2F26-33A6-93E8-99209CD59C37}
// *********************************************************************//
  _DUCTOEXCAVACIONRowChangeEventDisp = dispinterface
    ['{84226AD9-2F26-33A6-93E8-99209CD59C37}']
  end;

// *********************************************************************//
// Interface: _DETALLEAPOYORowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7BF7F47B-C317-3603-B2FD-E48E9B56DA5C}
// *********************************************************************//
  _DETALLEAPOYORowChangeEvent = interface(IDispatch)
    ['{7BF7F47B-C317-3603-B2FD-E48E9B56DA5C}']
  end;

// *********************************************************************//
// DispIntf:  _DETALLEAPOYORowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {7BF7F47B-C317-3603-B2FD-E48E9B56DA5C}
// *********************************************************************//
  _DETALLEAPOYORowChangeEventDisp = dispinterface
    ['{7BF7F47B-C317-3603-B2FD-E48E9B56DA5C}']
  end;

// *********************************************************************//
// Interface: _DIRECCIONAPOYORowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F404385C-E261-30D4-9CD6-76BD1564274C}
// *********************************************************************//
  _DIRECCIONAPOYORowChangeEvent = interface(IDispatch)
    ['{F404385C-E261-30D4-9CD6-76BD1564274C}']
  end;

// *********************************************************************//
// DispIntf:  _DIRECCIONAPOYORowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {F404385C-E261-30D4-9CD6-76BD1564274C}
// *********************************************************************//
  _DIRECCIONAPOYORowChangeEventDisp = dispinterface
    ['{F404385C-E261-30D4-9CD6-76BD1564274C}']
  end;

// *********************************************************************//
// Interface: _TRAMORowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E0058366-C496-374C-AAEE-0DC89E99057D}
// *********************************************************************//
  _TRAMORowChangeEvent = interface(IDispatch)
    ['{E0058366-C496-374C-AAEE-0DC89E99057D}']
  end;

// *********************************************************************//
// DispIntf:  _TRAMORowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E0058366-C496-374C-AAEE-0DC89E99057D}
// *********************************************************************//
  _TRAMORowChangeEventDisp = dispinterface
    ['{E0058366-C496-374C-AAEE-0DC89E99057D}']
  end;

// *********************************************************************//
// Interface: _PARARRAYODISRowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {029EDF76-73D2-3B8D-B7A3-6F68BFB45A55}
// *********************************************************************//
  _PARARRAYODISRowChangeEvent = interface(IDispatch)
    ['{029EDF76-73D2-3B8D-B7A3-6F68BFB45A55}']
  end;

// *********************************************************************//
// DispIntf:  _PARARRAYODISRowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {029EDF76-73D2-3B8D-B7A3-6F68BFB45A55}
// *********************************************************************//
  _PARARRAYODISRowChangeEventDisp = dispinterface
    ['{029EDF76-73D2-3B8D-B7A3-6F68BFB45A55}']
  end;

// *********************************************************************//
// Interface: _INTERRUPTORDISRowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {590A4DC4-1363-34FA-969F-A9105F1F88D5}
// *********************************************************************//
  _INTERRUPTORDISRowChangeEvent = interface(IDispatch)
    ['{590A4DC4-1363-34FA-969F-A9105F1F88D5}']
  end;

// *********************************************************************//
// DispIntf:  _INTERRUPTORDISRowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {590A4DC4-1363-34FA-969F-A9105F1F88D5}
// *********************************************************************//
  _INTERRUPTORDISRowChangeEventDisp = dispinterface
    ['{590A4DC4-1363-34FA-969F-A9105F1F88D5}']
  end;

// *********************************************************************//
// Interface: _TRAFODISRowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {9781BE5B-3D46-3088-87A7-F9EF428D2900}
// *********************************************************************//
  _TRAFODISRowChangeEvent = interface(IDispatch)
    ['{9781BE5B-3D46-3088-87A7-F9EF428D2900}']
  end;

// *********************************************************************//
// DispIntf:  _TRAFODISRowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {9781BE5B-3D46-3088-87A7-F9EF428D2900}
// *********************************************************************//
  _TRAFODISRowChangeEventDisp = dispinterface
    ['{9781BE5B-3D46-3088-87A7-F9EF428D2900}']
  end;

// *********************************************************************//
// Interface: _CONDENSADORRowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {61DF0ED0-98E0-3F1D-B727-2FEE1AE6D3AB}
// *********************************************************************//
  _CONDENSADORRowChangeEvent = interface(IDispatch)
    ['{61DF0ED0-98E0-3F1D-B727-2FEE1AE6D3AB}']
  end;

// *********************************************************************//
// DispIntf:  _CONDENSADORRowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {61DF0ED0-98E0-3F1D-B727-2FEE1AE6D3AB}
// *********************************************************************//
  _CONDENSADORRowChangeEventDisp = dispinterface
    ['{61DF0ED0-98E0-3F1D-B727-2FEE1AE6D3AB}']
  end;

// *********************************************************************//
// Interface: _CLIENTESGDRowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {DFCCAF50-FE96-3BC3-B63C-B1BE1F5B0FD4}
// *********************************************************************//
  _CLIENTESGDRowChangeEvent = interface(IDispatch)
    ['{DFCCAF50-FE96-3BC3-B63C-B1BE1F5B0FD4}']
  end;

// *********************************************************************//
// DispIntf:  _CLIENTESGDRowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {DFCCAF50-FE96-3BC3-B63C-B1BE1F5B0FD4}
// *********************************************************************//
  _CLIENTESGDRowChangeEventDisp = dispinterface
    ['{DFCCAF50-FE96-3BC3-B63C-B1BE1F5B0FD4}']
  end;

// *********************************************************************//
// Interface: _ALUMBRADOPUBLICORowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AD071BEE-BC0B-3A34-AB62-949177F0389A}
// *********************************************************************//
  _ALUMBRADOPUBLICORowChangeEvent = interface(IDispatch)
    ['{AD071BEE-BC0B-3A34-AB62-949177F0389A}']
  end;

// *********************************************************************//
// DispIntf:  _ALUMBRADOPUBLICORowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {AD071BEE-BC0B-3A34-AB62-949177F0389A}
// *********************************************************************//
  _ALUMBRADOPUBLICORowChangeEventDisp = dispinterface
    ['{AD071BEE-BC0B-3A34-AB62-949177F0389A}']
  end;

// *********************************************************************//
// Interface: _DIRECCIONCLIENTERowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E28860A3-62E7-3319-826D-4C1D8459A808}
// *********************************************************************//
  _DIRECCIONCLIENTERowChangeEvent = interface(IDispatch)
    ['{E28860A3-62E7-3319-826D-4C1D8459A808}']
  end;

// *********************************************************************//
// DispIntf:  _DIRECCIONCLIENTERowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {E28860A3-62E7-3319-826D-4C1D8459A808}
// *********************************************************************//
  _DIRECCIONCLIENTERowChangeEventDisp = dispinterface
    ['{E28860A3-62E7-3319-826D-4C1D8459A808}']
  end;

// *********************************************************************//
// Interface: _FOTOCLIENTERowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2FA30DEB-BE3B-3EF4-9571-402816194DD2}
// *********************************************************************//
  _FOTOCLIENTERowChangeEvent = interface(IDispatch)
    ['{2FA30DEB-BE3B-3EF4-9571-402816194DD2}']
  end;

// *********************************************************************//
// DispIntf:  _FOTOCLIENTERowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {2FA30DEB-BE3B-3EF4-9571-402816194DD2}
// *********************************************************************//
  _FOTOCLIENTERowChangeEventDisp = dispinterface
    ['{2FA30DEB-BE3B-3EF4-9571-402816194DD2}']
  end;

// *********************************************************************//
// Interface: _PUNTODEMEDIDARowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {8B66FBA4-AD7E-3BB8-B1FC-FE54A4FFFF54}
// *********************************************************************//
  _PUNTODEMEDIDARowChangeEvent = interface(IDispatch)
    ['{8B66FBA4-AD7E-3BB8-B1FC-FE54A4FFFF54}']
  end;

// *********************************************************************//
// DispIntf:  _PUNTODEMEDIDARowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {8B66FBA4-AD7E-3BB8-B1FC-FE54A4FFFF54}
// *********************************************************************//
  _PUNTODEMEDIDARowChangeEventDisp = dispinterface
    ['{8B66FBA4-AD7E-3BB8-B1FC-FE54A4FFFF54}']
  end;

// *********************************************************************//
// Interface: _MEDIDORSGDRowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {10F8FE2F-1E04-3328-8555-B7DB55B84AAA}
// *********************************************************************//
  _MEDIDORSGDRowChangeEvent = interface(IDispatch)
    ['{10F8FE2F-1E04-3328-8555-B7DB55B84AAA}']
  end;

// *********************************************************************//
// DispIntf:  _MEDIDORSGDRowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {10F8FE2F-1E04-3328-8555-B7DB55B84AAA}
// *********************************************************************//
  _MEDIDORSGDRowChangeEventDisp = dispinterface
    ['{10F8FE2F-1E04-3328-8555-B7DB55B84AAA}']
  end;

// *********************************************************************//
// Interface: _INCIDENTALDUCTORowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {A734C160-922E-34BA-A856-30E1D39FCD5C}
// *********************************************************************//
  _INCIDENTALDUCTORowChangeEvent = interface(IDispatch)
    ['{A734C160-922E-34BA-A856-30E1D39FCD5C}']
  end;

// *********************************************************************//
// DispIntf:  _INCIDENTALDUCTORowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {A734C160-922E-34BA-A856-30E1D39FCD5C}
// *********************************************************************//
  _INCIDENTALDUCTORowChangeEventDisp = dispinterface
    ['{A734C160-922E-34BA-A856-30E1D39FCD5C}']
  end;

// *********************************************************************//
// Interface: _ODTRowChangeEvent
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {01FE3F04-03EA-37DA-9D2A-CF558D19C610}
// *********************************************************************//
  _ODTRowChangeEvent = interface(IDispatch)
    ['{01FE3F04-03EA-37DA-9D2A-CF558D19C610}']
  end;

// *********************************************************************//
// DispIntf:  _ODTRowChangeEventDisp
// Flags:     (4432) Hidden Dual OleAutomation Dispatchable
// GUID:      {01FE3F04-03EA-37DA-9D2A-CF558D19C610}
// *********************************************************************//
  _ODTRowChangeEventDisp = dispinterface
    ['{01FE3F04-03EA-37DA-9D2A-CF558D19C610}']
  end;

  CoCl_Exportar_XML = class
    class function Create: _Cl_Exportar_XML;
    class function CreateRemote(const MachineName: string): _Cl_Exportar_XML;
  end;

  CoCl_Importar_XML = class
    class function Create: _Cl_Importar_XML;
    class function CreateRemote(const MachineName: string): _Cl_Importar_XML;
  end;

  CoDatos = class
    class function Create: _Datos;
    class function CreateRemote(const MachineName: string): _Datos;
  end;

  CoAPOYODataTable = class
    class function Create: _APOYODataTable;
    class function CreateRemote(const MachineName: string): _APOYODataTable;
  end;

  CoINCIDENTALAPOYODataTable = class
    class function Create: _INCIDENTALAPOYODataTable;
    class function CreateRemote(const MachineName: string): _INCIDENTALAPOYODataTable;
  end;

  CoNODODataTable = class
    class function Create: _NODODataTable;
    class function CreateRemote(const MachineName: string): _NODODataTable;
  end;

  CoFOTOAPOYODataTable = class
    class function Create: _FOTOAPOYODataTable;
    class function CreateRemote(const MachineName: string): _FOTOAPOYODataTable;
  end;

  CoEXCAVACIONDataTable = class
    class function Create: _EXCAVACIONDataTable;
    class function CreateRemote(const MachineName: string): _EXCAVACIONDataTable;
  end;

  CoDUCTOEXCAVACIONDataTable = class
    class function Create: _DUCTOEXCAVACIONDataTable;
    class function CreateRemote(const MachineName: string): _DUCTOEXCAVACIONDataTable;
  end;

  CoDETALLEAPOYODataTable = class
    class function Create: _DETALLEAPOYODataTable;
    class function CreateRemote(const MachineName: string): _DETALLEAPOYODataTable;
  end;

  CoDIRECCIONAPOYODataTable = class
    class function Create: _DIRECCIONAPOYODataTable;
    class function CreateRemote(const MachineName: string): _DIRECCIONAPOYODataTable;
  end;

  CoTRAMODataTable = class
    class function Create: _TRAMODataTable;
    class function CreateRemote(const MachineName: string): _TRAMODataTable;
  end;

  CoPARARRAYODISDataTable = class
    class function Create: _PARARRAYODISDataTable;
    class function CreateRemote(const MachineName: string): _PARARRAYODISDataTable;
  end;

  CoINTERRUPTORDISDataTable = class
    class function Create: _INTERRUPTORDISDataTable;
    class function CreateRemote(const MachineName: string): _INTERRUPTORDISDataTable;
  end;

  CoTRAFODISDataTable = class
    class function Create: _TRAFODISDataTable;
    class function CreateRemote(const MachineName: string): _TRAFODISDataTable;
  end;

  CoCONDENSADORDataTable = class
    class function Create: _CONDENSADORDataTable;
    class function CreateRemote(const MachineName: string): _CONDENSADORDataTable;
  end;

  CoCLIENTESGDDataTable = class
    class function Create: _CLIENTESGDDataTable;
    class function CreateRemote(const MachineName: string): _CLIENTESGDDataTable;
  end;

  CoALUMBRADOPUBLICODataTable = class
    class function Create: _ALUMBRADOPUBLICODataTable;
    class function CreateRemote(const MachineName: string): _ALUMBRADOPUBLICODataTable;
  end;

  CoDIRECCIONCLIENTEDataTable = class
    class function Create: _DIRECCIONCLIENTEDataTable;
    class function CreateRemote(const MachineName: string): _DIRECCIONCLIENTEDataTable;
  end;

  CoFOTOCLIENTEDataTable = class
    class function Create: _FOTOCLIENTEDataTable;
    class function CreateRemote(const MachineName: string): _FOTOCLIENTEDataTable;
  end;

  CoPUNTODEMEDIDADataTable = class
    class function Create: _PUNTODEMEDIDADataTable;
    class function CreateRemote(const MachineName: string): _PUNTODEMEDIDADataTable;
  end;

  CoMEDIDORSGDDataTable = class
    class function Create: _MEDIDORSGDDataTable;
    class function CreateRemote(const MachineName: string): _MEDIDORSGDDataTable;
  end;

  CoINCIDENTALDUCTODataTable = class
    class function Create: _INCIDENTALDUCTODataTable;
    class function CreateRemote(const MachineName: string): _INCIDENTALDUCTODataTable;
  end;

  CoODTDataTable = class
    class function Create: _ODTDataTable;
    class function CreateRemote(const MachineName: string): _ODTDataTable;
  end;

implementation

uses ComObj;

class function CoCl_Exportar_XML.Create: _Cl_Exportar_XML;
begin
  Result := CreateComObject(CLASS_Cl_Exportar_XML) as _Cl_Exportar_XML;
end;

class function CoCl_Exportar_XML.CreateRemote(const MachineName: string): _Cl_Exportar_XML;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Cl_Exportar_XML) as _Cl_Exportar_XML;
end;

class function CoCl_Importar_XML.Create: _Cl_Importar_XML;
begin
  Result := CreateComObject(CLASS_Cl_Importar_XML) as _Cl_Importar_XML;
end;

class function CoCl_Importar_XML.CreateRemote(const MachineName: string): _Cl_Importar_XML;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Cl_Importar_XML) as _Cl_Importar_XML;
end;

class function CoDatos.Create: _Datos;
begin
  Result := CreateComObject(CLASS_Datos) as _Datos;
end;

class function CoDatos.CreateRemote(const MachineName: string): _Datos;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Datos) as _Datos;
end;

class function CoAPOYODataTable.Create: _APOYODataTable;
begin
  Result := CreateComObject(CLASS_APOYODataTable) as _APOYODataTable;
end;

class function CoAPOYODataTable.CreateRemote(const MachineName: string): _APOYODataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_APOYODataTable) as _APOYODataTable;
end;

class function CoINCIDENTALAPOYODataTable.Create: _INCIDENTALAPOYODataTable;
begin
  Result := CreateComObject(CLASS_INCIDENTALAPOYODataTable) as _INCIDENTALAPOYODataTable;
end;

class function CoINCIDENTALAPOYODataTable.CreateRemote(const MachineName: string): _INCIDENTALAPOYODataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_INCIDENTALAPOYODataTable) as _INCIDENTALAPOYODataTable;
end;

class function CoNODODataTable.Create: _NODODataTable;
begin
  Result := CreateComObject(CLASS_NODODataTable) as _NODODataTable;
end;

class function CoNODODataTable.CreateRemote(const MachineName: string): _NODODataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_NODODataTable) as _NODODataTable;
end;

class function CoFOTOAPOYODataTable.Create: _FOTOAPOYODataTable;
begin
  Result := CreateComObject(CLASS_FOTOAPOYODataTable) as _FOTOAPOYODataTable;
end;

class function CoFOTOAPOYODataTable.CreateRemote(const MachineName: string): _FOTOAPOYODataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FOTOAPOYODataTable) as _FOTOAPOYODataTable;
end;

class function CoEXCAVACIONDataTable.Create: _EXCAVACIONDataTable;
begin
  Result := CreateComObject(CLASS_EXCAVACIONDataTable) as _EXCAVACIONDataTable;
end;

class function CoEXCAVACIONDataTable.CreateRemote(const MachineName: string): _EXCAVACIONDataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_EXCAVACIONDataTable) as _EXCAVACIONDataTable;
end;

class function CoDUCTOEXCAVACIONDataTable.Create: _DUCTOEXCAVACIONDataTable;
begin
  Result := CreateComObject(CLASS_DUCTOEXCAVACIONDataTable) as _DUCTOEXCAVACIONDataTable;
end;

class function CoDUCTOEXCAVACIONDataTable.CreateRemote(const MachineName: string): _DUCTOEXCAVACIONDataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DUCTOEXCAVACIONDataTable) as _DUCTOEXCAVACIONDataTable;
end;

class function CoDETALLEAPOYODataTable.Create: _DETALLEAPOYODataTable;
begin
  Result := CreateComObject(CLASS_DETALLEAPOYODataTable) as _DETALLEAPOYODataTable;
end;

class function CoDETALLEAPOYODataTable.CreateRemote(const MachineName: string): _DETALLEAPOYODataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DETALLEAPOYODataTable) as _DETALLEAPOYODataTable;
end;

class function CoDIRECCIONAPOYODataTable.Create: _DIRECCIONAPOYODataTable;
begin
  Result := CreateComObject(CLASS_DIRECCIONAPOYODataTable) as _DIRECCIONAPOYODataTable;
end;

class function CoDIRECCIONAPOYODataTable.CreateRemote(const MachineName: string): _DIRECCIONAPOYODataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DIRECCIONAPOYODataTable) as _DIRECCIONAPOYODataTable;
end;

class function CoTRAMODataTable.Create: _TRAMODataTable;
begin
  Result := CreateComObject(CLASS_TRAMODataTable) as _TRAMODataTable;
end;

class function CoTRAMODataTable.CreateRemote(const MachineName: string): _TRAMODataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TRAMODataTable) as _TRAMODataTable;
end;

class function CoPARARRAYODISDataTable.Create: _PARARRAYODISDataTable;
begin
  Result := CreateComObject(CLASS_PARARRAYODISDataTable) as _PARARRAYODISDataTable;
end;

class function CoPARARRAYODISDataTable.CreateRemote(const MachineName: string): _PARARRAYODISDataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PARARRAYODISDataTable) as _PARARRAYODISDataTable;
end;

class function CoINTERRUPTORDISDataTable.Create: _INTERRUPTORDISDataTable;
begin
  Result := CreateComObject(CLASS_INTERRUPTORDISDataTable) as _INTERRUPTORDISDataTable;
end;

class function CoINTERRUPTORDISDataTable.CreateRemote(const MachineName: string): _INTERRUPTORDISDataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_INTERRUPTORDISDataTable) as _INTERRUPTORDISDataTable;
end;

class function CoTRAFODISDataTable.Create: _TRAFODISDataTable;
begin
  Result := CreateComObject(CLASS_TRAFODISDataTable) as _TRAFODISDataTable;
end;

class function CoTRAFODISDataTable.CreateRemote(const MachineName: string): _TRAFODISDataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_TRAFODISDataTable) as _TRAFODISDataTable;
end;

class function CoCONDENSADORDataTable.Create: _CONDENSADORDataTable;
begin
  Result := CreateComObject(CLASS_CONDENSADORDataTable) as _CONDENSADORDataTable;
end;

class function CoCONDENSADORDataTable.CreateRemote(const MachineName: string): _CONDENSADORDataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CONDENSADORDataTable) as _CONDENSADORDataTable;
end;

class function CoCLIENTESGDDataTable.Create: _CLIENTESGDDataTable;
begin
  Result := CreateComObject(CLASS_CLIENTESGDDataTable) as _CLIENTESGDDataTable;
end;

class function CoCLIENTESGDDataTable.CreateRemote(const MachineName: string): _CLIENTESGDDataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_CLIENTESGDDataTable) as _CLIENTESGDDataTable;
end;

class function CoALUMBRADOPUBLICODataTable.Create: _ALUMBRADOPUBLICODataTable;
begin
  Result := CreateComObject(CLASS_ALUMBRADOPUBLICODataTable) as _ALUMBRADOPUBLICODataTable;
end;

class function CoALUMBRADOPUBLICODataTable.CreateRemote(const MachineName: string): _ALUMBRADOPUBLICODataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ALUMBRADOPUBLICODataTable) as _ALUMBRADOPUBLICODataTable;
end;

class function CoDIRECCIONCLIENTEDataTable.Create: _DIRECCIONCLIENTEDataTable;
begin
  Result := CreateComObject(CLASS_DIRECCIONCLIENTEDataTable) as _DIRECCIONCLIENTEDataTable;
end;

class function CoDIRECCIONCLIENTEDataTable.CreateRemote(const MachineName: string): _DIRECCIONCLIENTEDataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_DIRECCIONCLIENTEDataTable) as _DIRECCIONCLIENTEDataTable;
end;

class function CoFOTOCLIENTEDataTable.Create: _FOTOCLIENTEDataTable;
begin
  Result := CreateComObject(CLASS_FOTOCLIENTEDataTable) as _FOTOCLIENTEDataTable;
end;

class function CoFOTOCLIENTEDataTable.CreateRemote(const MachineName: string): _FOTOCLIENTEDataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_FOTOCLIENTEDataTable) as _FOTOCLIENTEDataTable;
end;

class function CoPUNTODEMEDIDADataTable.Create: _PUNTODEMEDIDADataTable;
begin
  Result := CreateComObject(CLASS_PUNTODEMEDIDADataTable) as _PUNTODEMEDIDADataTable;
end;

class function CoPUNTODEMEDIDADataTable.CreateRemote(const MachineName: string): _PUNTODEMEDIDADataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_PUNTODEMEDIDADataTable) as _PUNTODEMEDIDADataTable;
end;

class function CoMEDIDORSGDDataTable.Create: _MEDIDORSGDDataTable;
begin
  Result := CreateComObject(CLASS_MEDIDORSGDDataTable) as _MEDIDORSGDDataTable;
end;

class function CoMEDIDORSGDDataTable.CreateRemote(const MachineName: string): _MEDIDORSGDDataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_MEDIDORSGDDataTable) as _MEDIDORSGDDataTable;
end;

class function CoINCIDENTALDUCTODataTable.Create: _INCIDENTALDUCTODataTable;
begin
  Result := CreateComObject(CLASS_INCIDENTALDUCTODataTable) as _INCIDENTALDUCTODataTable;
end;

class function CoINCIDENTALDUCTODataTable.CreateRemote(const MachineName: string): _INCIDENTALDUCTODataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_INCIDENTALDUCTODataTable) as _INCIDENTALDUCTODataTable;
end;

class function CoODTDataTable.Create: _ODTDataTable;
begin
  Result := CreateComObject(CLASS_ODTDataTable) as _ODTDataTable;
end;

class function CoODTDataTable.CreateRemote(const MachineName: string): _ODTDataTable;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_ODTDataTable) as _ODTDataTable;
end;

end.
