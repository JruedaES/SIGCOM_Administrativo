ÿ
 TFHISTORIALREPORTES 0ö  TPF0TFHistorialReportesFHistorialReportesLeft÷ Top¬ WidthòHeightBBorderIconsbiSystemMenu CaptionHistorial de ReportesColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style OldCreateOrderPixelsPerInch`
TextHeight TPanelPanel3Left Top WidthâHeight6AlignalTopTabOrder  TSpeedButton	SBFiltrarTagLeftXTopWidth1Height)HintFiltro de Datos en ListaFlat	
Glyph.Data
ò   î   BMî       v   (               x                                     ÀÀÀ   ÿ  ÿ   ÿÿ ÿ   ÿ ÿ ÿÿ  ÿÿÿ   `hh`ffoø`fÿÿf      OnClickSBFiltrarClick  TLabelLabel3Left° TopWidth HeightCaptionAcción Realizada al Reporte  TLabelLabel1LeftTopWidthVHeightCaption
REPORTE : Font.CharsetDEFAULT_CHARSET
Font.ColorclMaroonFont.Heightó	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  	TComboBoxCbBx1Left° TopWidth Height
ItemHeightItems.StringsINGRESO (I)ACTUALIZACION (A)ELIMINACION (E)TODAS TabOrder TextAcciones  TEditEdTCodDesdeLeftÐTop WidthHeightTabOrderVisible  TEditEdtCodHastaLeftÐTopWidthHeightTabOrderVisible   TPanelPanel1Left Topó WidthâHeight)AlignalBottomTabOrder TBitBtn
bbCancelarLeft|TopWidthKHeightCaption&CerrarTabOrder KindbkClose   	TRxDBGrid	RxDBGrid1Left Top6WidthâHeight½ AlignalClient
DataSourcedsHistorialRepOptions	dgEditingdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgConfirmDeletedgCancelOnExitdgMultiSelect ParentShowHintShowHint	TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.HeightõTitleFont.NameMS Sans SerifTitleFont.Style MultiSelect	ColumnsExpanded	FieldNameCLAVE1Font.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Heightõ	Font.NameMS Sans Serif
Font.Style Title.AlignmenttaCenterTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclMaroonTitle.Font.HeightõTitle.Font.NameMS Sans SerifTitle.Font.StylefsBold Visible	 Expanded	FieldNameACCIONTitle.AlignmenttaCenterTitle.CaptionAcciónTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclMaroonTitle.Font.HeightõTitle.Font.NameMS Sans SerifTitle.Font.StylefsBold WidthdVisible	 Expanded	FieldName
ID_USUARIOTitle.AlignmenttaCenterTitle.CaptionUsuarioTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclMaroonTitle.Font.HeightõTitle.Font.NameMS Sans SerifTitle.Font.StylefsBold Width Visible	 Expanded	FieldNameFECHATitle.AlignmenttaCenterTitle.CaptionFechaTitle.Font.CharsetDEFAULT_CHARSETTitle.Font.ColorclMaroonTitle.Font.HeightõTitle.Font.NameMS Sans SerifTitle.Font.StylefsBold Width Visible	    TQueryQHistorialRep
BeforeOpenQHistorialRepBeforeOpenDatabaseNameBaseDatoSQL.Strings6SELECT CLAVE1,ACCION,ID_USUARIO,FECHA FROM USUARIO_LOGWHERE TABLA='REPORTE'  LeftxTopx TFloatFieldQHistorialRepCLAVE1DisplayLabelCódigo	FieldNameCLAVE1OriginUSUARIO_LOG.CLAVE1  TStringFieldQHistorialRepACCION	FieldNameACCIONOriginUSUARIO_LOG.ACCIONSize  TStringFieldQHistorialRepID_USUARIODisplayLabelUSUARIO	FieldName
ID_USUARIOOriginUSUARIO_LOG.ID_USUARIOSize  TDateTimeFieldQHistorialRepFECHA	FieldNameFECHAOriginUSUARIO_LOG.FECHA   TDataSourcedsHistorialRepDataSetQHistorialRepLeftxTopÀ    