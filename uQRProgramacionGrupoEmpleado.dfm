?
 TFQRPROGRAMACIONGRUPOEMPLEADO 0?  TPF0TFQRProgramacionGrupoEmpleadoFQRProgramacionGrupoEmpleadoLeftTop? Width?Height?HorzScrollBar.Position? CaptionFQRProgramacionGrupoEmpleadoColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameMS Sans Serif
Font.Style OldCreateOrderScaledOnClose	FormClosePixelsPerInch`
TextHeight 	TQuickRepQuickRepLeft?TopWidth Height0Frame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAfterPreviewQuickRepAfterPreviewDataSetqGrupoEmpleadoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameArial
Font.Style Functions.Strings
PAGENUMBERCOLUMNNUMBERREPORTTITLE Functions.DATA00'' OptionsFirstPageHeaderLastPageFooter Page.ColumnsPage.OrientationpoLandscapePage.PaperSizeLetterPage.Values       ?@      ??
@       ?@      ??
@       ?@       ?@           PrinterSettings.CopiesPrinterSettings.DuplexPrinterSettings.FirstPage PrinterSettings.LastPage PrinterSettings.OutputBinAutoPrintIfEmpty	
SnapToGrid	UnitsMMZoomd TQRBand
TitleBand1Left&Top&Width?HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values????????@???????
@ BandTyperbTitle  TQRGroupBandGroupHeaderLeft&TopOWidth?HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameArial
Font.StylefsBold ForceNewColumnForceNewPage
ParentFontSize.Values????????@???????
@ 
Expression!qGrupoEmpleado.CODIGOGRUPOTRABAJO
FooterBandBandGroupFooterMasterQuickRepReprintOnNewPage TQRExprQRExprNombreGrupoLeftQTopWidth1HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values????????@UUUUUU??@UUUUUUU?@????????@ 	AlignmenttaCenterAlignToBand	AutoSizeAutoStretchFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameArial
Font.StylefsBold ColorclWhite
ParentFontResetAfterPrintTransparentWordWrap	
Expression!qGrupoEmpleado.NOMBREGRUPOTRABAJOFontSize	   TQRBandBandGroupFooterLeft&ToptWidth?HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values       ?@???????
@ BandTyperbGroupFooter  TQRBandQRBand1Left&TopcWidth?HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightAlignToBottomColorclWhiteForceNewColumnForceNewPageSize.Values????????@???????
@ BandTyperbDetail 	TQRDBTextqrdbNombreEmpleadoLeft?TopWidth HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values????????@??????:?	@UUUUUUU? @      ??@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetqGrupoEmpleado	DataFieldNOMBREEMPLEADOFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize  	TQRDBTextqrdbCodigoEmpleadoLeftQTopWidthLHeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.Values????????@UUUUUU??@UUUUUUU? @UUUUUU?@ 	AlignmenttaLeftJustifyAlignToBandAutoSizeAutoStretchColorclWhiteDataSetqGrupoEmpleado	DataFieldCODIGOEMPLEADOFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameArial
Font.Style 
ParentFontTransparentWordWrap	FontSize   TQRChildBand
ChildBand1Left&Top:Width?HeightFrame.ColorclBlackFrame.DrawTop	Frame.DrawBottom	Frame.DrawLeft	Frame.DrawRight	AlignToBottomColorclSilverForceNewColumnForceNewPageSize.Values     @?@???????
@ 
ParentBand
TitleBand1 	TQRDBTextqrdbNombreProgramacionLeftQTopWidth1HeightFrame.ColorclBlackFrame.DrawTopFrame.DrawBottomFrame.DrawLeftFrame.DrawRightSize.ValuesUUUUUU?@UUUUUU??@UUUUUUU? @????????@ 	AlignmenttaCenterAlignToBand	AutoSizeAutoStretchColorclSilver	DataFieldNOMBREPROGRAMACIONFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameArial
Font.StylefsBold MaskMMMM     -      YYYY
ParentFontTransparentWordWrap	FontSize    TQueryqGrupoEmpleadoDatabaseNameBaseDatoSQL.Strings4SELECT T.CODIGOPROGRAMACION,T.CODIGOADMINISTRATIVO, 2 T.CODIGOGRUPOTRABAJO, T.FECHA, PE.CODIGOEMPLEADO,( E.NOMBREEMPLEADO, G.NOMBREGRUPOTRABAJO )FROM PROGRAMACIONEMPLEADO PE, EMPLEADO E,. GRUPOTRABAJO G,CALENDARIOPROGRAMACIONGRUPO T, PROGRAMACION P /WHERE P.CODIGOPROGRAMACION=T.CODIGOPROGRAMACION.AND P.CODIGOPROGRAMACION=PE.CODIGOPROGRAMACION4AND G.CODIGOADMINISTRATIVO = T.CODIGOADMINISTRATIVO /AND G.CODIGOGRUPOTRABAJO = T.CODIGOGRUPOTRABAJO/AND T.CODIGOGRUPOTRABAJO= PE.CODIGOGRUPOTRABAJO)AND E.CODIGOEMPLEADO = PE.CODIGOEMPLEADO AND T.FECHA=:FECHA,AND T.CODIGOPROGRAMACION=:CODIGOPROGRAMACION0ORDER BY CODIGOADMINISTRATIVO,CODIGOGRUPOTRABAJO Left>Top	ParamDataDataType
ftDateTimeNameFecha	ParamType	ptUnknown DataType	ftUnknownNameCODIGOPROGRAMACION	ParamType	ptUnknown   TFloatField qGrupoEmpleadoCODIGOPROGRAMACION	FieldNameCODIGOPROGRAMACIONOrigin.CALENDARIOPROGRAMACIONGRUPO.CODIGOPROGRAMACION  TFloatField"qGrupoEmpleadoCODIGOADMINISTRATIVO	FieldNameCODIGOADMINISTRATIVOOrigin0CALENDARIOPROGRAMACIONGRUPO.CODIGOADMINISTRATIVO  TFloatField qGrupoEmpleadoCODIGOGRUPOTRABAJO	FieldNameCODIGOGRUPOTRABAJOOrigin.CALENDARIOPROGRAMACIONGRUPO.CODIGOGRUPOTRABAJO  TDateTimeFieldqGrupoEmpleadoFECHA	FieldNameFECHAOrigin!CALENDARIOPROGRAMACIONGRUPO.FECHA  TFloatFieldqGrupoEmpleadoCODIGOEMPLEADO	FieldNameCODIGOEMPLEADOOrigin#PROGRAMACIONEMPLEADO.CODIGOEMPLEADO  TStringFieldqGrupoEmpleadoNOMBREEMPLEADO	FieldNameNOMBREEMPLEADOOriginEMPLEADO.NOMBREEMPLEADOSize2  TStringField qGrupoEmpleadoNOMBREGRUPOTRABAJO	FieldNameNOMBREGRUPOTRABAJOOriginGRUPOTRABAJO.NOMBREGRUPOTRABAJOSize    