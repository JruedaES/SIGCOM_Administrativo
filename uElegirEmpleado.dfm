ÿ
 TFELEGIREMPLEADO 0a  TPF0TfElegirEmpleadofElegirEmpleadoLeftæ Top´ WidthaHeight¾CaptionElegir Empleado...Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style OldCreateOrderOnClose	FormCloseOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TPanelPanel1Left TopfWidthYHeight=AlignalBottomTabOrder  TLabelLbRegistrosLeftTopWidthHeightFont.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Heightó	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TPanelPanel4LeftTopWidth?Height;AlignalRight
BevelOuterbvNoneTabOrder  TBitBtnBitBtn1LeftPTopWidthKHeightCaption&AceptarTabOrder KindbkOK  TBitBtnBitBtn2LeftØ TopWidthKHeightCaption	&CancelarTabOrderKindbkCancel    TPanelPanel2Left Top WidthYHeight&AlignalTopTabOrder TLabelLabel4LeftTopWidth%HeightCaptionNombre  TLabelLabel5Left¨ TopWidthHeightCaption&&Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightð	Font.NameMS Sans Serif
Font.Style 
ParentFont  TLabelLabel6LeftMTopWidth!HeightCaptionCédulaOnMouseDownLabel6MouseDown  TBitBtnBitBtnFiltrarLeftTopWidth#HeightTabOrder OnClickBitBtnFiltrarClick
Glyph.Data
ò   î   BMî       v   (               x                                     ÀÀÀ   ÿ  ÿ   ÿÿ ÿ   ÿ ÿ ÿÿ  ÿÿÿ   `hh`ffoø`fÿÿf        TBitBtnBitBtnAnularFiltroLeft'TopWidth#HeightTabOrderOnClickBitBtnAnularFiltroClick
Glyph.Data
ò   î   BMî       v   (               x                                     ÀÀÀ   ÿ  ÿ   ÿÿ ÿ   ÿ ÿ ÿÿ  ÿÿÿ   `ii	øÿ    	  TEdit	EdNombre1Left3TopWidthsHeightCharCaseecUpperCaseTabOrder  TEdit	EdNombre2Left¶ TopWidthsHeightCharCaseecUpperCaseTabOrder  TEditEdCedulaLeftvTopWidthsHeightCharCaseecUpperCaseTabOrder   TPanelPanel3Left Top&WidthYHeightÿ AlignalClientTabOrder 	TRxDBGrid	RxDBGrid1LeftTopWidthWHeightý AlignalClient
DataSource
dsEmpleadoFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgRowSelectdgConfirmDeletedgCancelOnExitdgMultiSelect 
ParentFontTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.HeightõTitleFont.NameMS Sans SerifTitleFont.Style OnTitleClickRxDBGrid1TitleClickMultiSelect	OnMouseMoveRxDBGrid1MouseMoveColumnsColorclAquaExpanded	FieldNameCODIGOEMPLEADOTitle.AlignmenttaCenterTitle.CaptionCódigoTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclBlackTitle.Font.HeightõTitle.Font.NameMS Sans SerifTitle.Font.Style Visible	 Expanded	FieldNameNOMBREEMPLEADOTitle.AlignmenttaCenterTitle.CaptionNombre EmpleadoWidthVisible	 Expanded	FieldNameCODIGOSUELDOTitle.AlignmenttaCenterTitle.CaptionCódigo SueldoWidthZVisible	 Expanded	FieldNameSUELDOTitle.AlignmenttaCenterTitle.CaptionSueldoWidthPVisible	     TPanelPanel5Left Top%WidthYHeightAAlignalBottomTabOrder TLabelLabel1LeftTopWidth;HeightCaption	DIRECCIONFocusControlDBEdit1  TLabelLabel2LeftTopWidth)HeightCaptionBARRIOFocusControlDBEdit2  TLabelLabel3LeftçTopWidth9HeightCaptionTELEFONOFocusControlDBEdit3  TDBEditDBEdit1LeftTopWidthô HeightColorclSilver	DataField	DIRECCION
DataSource
dsEmpleadoEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Heightõ	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder   TDBEditDBEdit2LeftTopWidth¸ HeightColorclSilver	DataFieldBARRIO
DataSource
dsEmpleadoEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Heightõ	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder  TDBEditDBEdit3LeftçTopWidth^HeightColorclSilver	DataFieldTELEFONO
DataSource
dsEmpleadoEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Heightõ	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder   TQuery	qEmpleadoActive	DatabaseNameBaseDatoSQL.Strings7SELECT E.CODIGOEMPLEADO, E.NOMBREEMPLEADO, E.DIRECCION,.E.BARRIO, E.TELEFONO, E.CODIGOSUELDO, S.SUELDOFROM EMPLEADO E, SUELDO S'WHERE (E.CODIGOSUELDO = S.CODIGOSUELDO)AND E.ESTADO = 'AC' LeftTopP TFloatFieldqEmpleadoCODIGOEMPLEADO	FieldNameCODIGOEMPLEADOOriginEMPLEADO.CODIGOEMPLEADO  TStringFieldqEmpleadoNOMBREEMPLEADO	FieldNameNOMBREEMPLEADOOriginEMPLEADO.NOMBREEMPLEADOSize2  TStringFieldqEmpleadoDIRECCION	FieldName	DIRECCIONOriginEMPLEADO.DIRECCIONSize(  TStringFieldqEmpleadoBARRIO	FieldNameBARRIOOriginEMPLEADO.BARRIOSize  TStringFieldqEmpleadoTELEFONO	FieldNameTELEFONOOriginEMPLEADO.TELEFONOSize  TStringFieldqEmpleadoCODIGOSUELDO	FieldNameCODIGOSUELDOOriginEMPLEADO.CODIGOSUELDOSize  TFloatFieldqEmpleadoSUELDO	FieldNameSUELDOOriginSUELDO.SUELDODisplayFormat$ #,##0   TDataSource
dsEmpleadoDataSet	qEmpleadoLeftTop    