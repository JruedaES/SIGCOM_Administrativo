�
 TFLISTACARTA 0'  TPF0�TFListaCartaFListaCartaLeft� TopfWidth,HeightdCaptionListado de CartasPixelsPerInch`
TextHeight �TPanelPanel1Width � TSpeedButton
sbInsertarLeft~TopWidthHeightHintIngresar Dato en ListaFlat	
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 3333333333�3333�39�3330 373337w39�3330 3��337w9���33337ww333?9���333 7wws333w39�3333 373333w39�3333337s3333?3333333 3333�33w333<333 3337�33w333<�3333����?�<����Ù37wwwww�<����Ù37wwwwsw3333<�3333337s33�333<330 3337337w3333330 3333337w3333333333333333	NumGlyphsOnClicksbInsertarClick  �TSpeedButtonsbEditarPadreLeft� TopWidthHeightHintEditar Dato en ListaFlat	
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� 333     333wwwww333����?���??� 0  � �w�ww?sw7������ws3?33�࿿ ���w�3ws��7�������w�3?��7࿿  �w�3wwss7��������w�?���37�   ��w�wwws?� � �� �ws�w73w730 ���37wss3?�330���  33773�ww33��33s7s730���37�33s3	�� 33ws��w3303   3373wwws3	NumGlyphsOnClicksbEditarPadreClick  �TPanelPanel2Left( �TSpeedButton
SBImprimirVisibleOnClickSBImprimirClick  �TSpeedButton	SBFiltrarVisible  �TSpeedButtonSBBuscarLeftkOnClickSBBuscarClick  �TSpeedButton	SBOrdenarLeft� VisibleOnClickSBOrdenarClick  �TSpeedButtonSBEstadisticaLeftMVisibleOnClickSBEstadisticaClick  �TSpeedButtonSBBuscaElementoCartografiaVisible  �TSpeedButtonSBFiltroCarograficoVisible   �TdNavigatordNavigator1Hints.Strings    �TPanelPanel3Top,Width  �TPanelPFiltroWidth �TLabellFiltroDatosWidth   �TPanelPanel4Left TopMWidthHeight� AlignalBottomTabOrder TLabelLabel1LeftTopWidthHeightAlignalTop	AlignmenttaCenterCaptionTraslados de correspondenciaFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TDBGridDBGrid2LeftTopWidthHeight� AlignalClient
DataSourcedsqPersonalCartaTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNameNOMBREEMPLEADOTitle.AlignmenttaCenterTitle.CaptionEmpleadoWidth� Visible	 Expanded	FieldNameNOMBREADMINISTRATIVOTitle.AlignmenttaCenterTitle.CaptionAdministrativoWidth� Visible	 Expanded	FieldName
FECHAENVIOTitle.AlignmenttaCenterTitle.CaptionFecha de Env�oWidth� Visible	 Expanded	FieldNameOBSERVACIONTitle.AlignmenttaCenterTitle.CaptionObservaci�nWidth�Visible	     �	TRxDBGriddbgListaCartasLeft TopNWidthHeight� AlignalClient
DataSourcedsBaseTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
OnDblClickdbgListaCartasDblClickOnTitleClickdbgListaCartasTitleClickOnMouseMovedbgListaCartasMouseMoveColumnsExpanded	FieldNameCODIGOCARTATitle.AlignmenttaCenterTitle.CaptionC�digoVisible	 Expanded	FieldNameTIPORECEPCIONCARTATitle.CaptionTipo Recepci�nWidthVVisible	 Expanded	FieldNameNUMERORADICACIONRECEPCIONTitle.AlignmenttaCenterTitle.CaptionNo.Recepci�nVisible	 Expanded	FieldNameCODIGOARCHIVOTitle.AlignmenttaCenterTitle.Caption
No.ArchivoVisible	 Expanded	FieldNameDIRIGIDOCARTASOLICITUDTitle.AlignmenttaCenterTitle.CaptionCarta Solicitud dirigida aWidth� Visible	 Expanded	FieldNameFECHARADICACIONTitle.AlignmenttaCenterTitle.CaptionFecha Radicaci�nVisible	 Expanded	FieldNameFECHARECEPCIONTitle.AlignmenttaCenterTitle.CaptionFecha Recepci�nVisible	 Expanded	FieldNameFECHAATENCIONTitle.AlignmenttaCenterTitle.CaptionFecha Atenci�nVisible	 ColorclInfoBkExpanded	FieldNameFECHALIMITEATENCIONTitle.AlignmenttaCenterTitle.CaptionFecha L�mite Atenci�nVisible	 Expanded	FieldNameNOMBREESTADOCARTATitle.AlignmenttaCenterTitle.CaptionEstado CartaWidthxVisible	 Expanded	FieldNameCODIGOREPORTETitle.AlignmenttaCenterTitle.CaptionC�digo ReporteVisible	 Expanded	FieldNameEMPRESATitle.AlignmenttaCenterTitle.CaptionEmpresaWidth� Visible	 Expanded	FieldNameNUMEROANEXOSTitle.AlignmenttaCenterTitle.CaptionCant. AnexosVisible	 Expanded	FieldNameTIPOENVIOCARTATitle.Caption
Tipo Env�oWidth_Visible	 Expanded	FieldNameNUMERORADICACIONRESPUESTATitle.AlignmenttaCenterTitle.CaptionNo.RespuestaVisible	 Expanded	FieldNameDIRIGIDOCARTARESPUESTATitle.AlignmenttaCenterTitle.CaptionCarta Respuesta dirigida aWidth� Visible	    �TDDataSourcedsBaseDataSetqCarta  �TQueryqTotalesActive	SQL.StringsSelect count(*) as TotalBfrom carta c, estadocarta e, tipoenviocarta tc1,tipoenviocarta tc22where e.codigoestadocarta (+)= c.codigoestadocarta8and tc2.codigotipoenviocarta (+)= c.codigotipoenviocarta<and tc1.codigotipoenviocarta (+)= c.codigotiporecepcioncartaOrder by c.fechaRadicacion   TQueryqCartaActive	DatabaseNameBaseDatoSQL.StringszSelect c.*, e.nombreestadocarta,tc1.nombretipoenviocarta as tiporecepcioncarta,tc2.nombretipoenviocarta as tipoenviocarta Bfrom carta c, estadocarta e, tipoenviocarta tc1,tipoenviocarta tc22where e.codigoestadocarta (+)= c.codigoestadocarta8and tc2.codigotipoenviocarta (+)= c.codigotipoenviocarta<and tc1.codigotipoenviocarta (+)= c.codigotiporecepcioncartaOrder by c.codigocarta desc Left8Top�  TFloatFieldqCartaCODIGOCARTA	FieldNameCODIGOCARTA  TFloatFieldqCartaNUMERORADICACIONRECEPCION	FieldNameNUMERORADICACIONRECEPCION  TFloatFieldqCartaNUMERORADICACIONRESPUESTA	FieldNameNUMERORADICACIONRESPUESTA  TFloatFieldqCartaCODIGOARCHIVO	FieldNameCODIGOARCHIVO  TFloatFieldqCartaNUMEROANEXOS	FieldNameNUMEROANEXOS  TFloatFieldqCartaCODIGOREPORTE	FieldNameCODIGOREPORTE  TDateTimeFieldqCartaFECHARADICACION	FieldNameFECHARADICACION  TDateTimeFieldqCartaFECHARECEPCION	FieldNameFECHARECEPCION  TDateTimeFieldqCartaFECHAATENCION	FieldNameFECHAATENCION  TDateTimeFieldqCartaFECHALIMITEATENCION	FieldNameFECHALIMITEATENCION  TFloatFieldqCartaCODIGOEMPLEADORECIBE	FieldNameCODIGOEMPLEADORECIBE  TStringFieldqCartaDIRIGIDOCARTASOLICITUD	FieldNameDIRIGIDOCARTASOLICITUDSize�   
TMemoFieldqCartaASUNTO	FieldNameASUNTOBlobTypeftMemoSize,  TStringFieldqCartaDIRIGIDOCARTARESPUESTA	FieldNameDIRIGIDOCARTARESPUESTASize�   TStringFieldqCartaFIRMANTE	FieldNameFIRMANTESized  TStringFieldqCartaEMPRESA	FieldNameEMPRESASized  TFloatFieldqCartaCODIGOESTADOCARTA	FieldNameCODIGOESTADOCARTA  TFloatFieldqCartaCODIGOTIPORECEPCIONCARTA	FieldNameCODIGOTIPORECEPCIONCARTA  TFloatFieldqCartaCODIGOTIPOENVIOCARTA	FieldNameCODIGOTIPOENVIOCARTA  TFloatFieldqCartaPLAZOATENCION	FieldNamePLAZOATENCION  TStringFieldqCartaNOMBREESTADOCARTA	FieldNameNOMBREESTADOCARTASized  TStringFieldqCartaTIPORECEPCIONCARTA	FieldNameTIPORECEPCIONCARTA  TStringFieldqCartaTIPOENVIOCARTA	FieldNameTIPOENVIOCARTA   TQueryqPersonalCartaActive	DatabaseNameBaseDato
DataSourcedsBaseSQL.StringsNSelect ce.*, e.nombreempleado, e.codigoadministrativo, a.nombreadministrativo 3from cartaempleado ce, empleado e, administrativo a\where e.codigoempleado=ce.codigoempleado and a.codigoadministrativo = e.codigoadministrativoand ce.codigocarta=:codigocartaorder by ce.fechaenvio LeftxTop� 	ParamDataDataTypeftFloatNameCODIGOCARTA	ParamType	ptUnknown   TFloatField!qPersonalCartaCODIGOCARTAEMPLEADO	FieldNameCODIGOCARTAEMPLEADOOrigin$AP_CARTAEMPLEADO.CODIGOCARTAEMPLEADO  TFloatFieldqPersonalCartaCODIGOCARTA	FieldNameCODIGOCARTAOriginAP_CARTAEMPLEADO.CODIGOCARTA  TFloatFieldqPersonalCartaCODIGOEMPLEADO	FieldNameCODIGOEMPLEADOOriginAP_CARTAEMPLEADO.CODIGOEMPLEADO  TDateTimeFieldqPersonalCartaFECHAENVIO	FieldName
FECHAENVIOOriginAP_CARTAEMPLEADO.FECHAENVIODisplayFormatddd dd 'de' mmm yyyy  TStringFieldqPersonalCartaOBSERVACION	FieldNameOBSERVACIONOriginAP_CARTAEMPLEADO.OBSERVACIONSize�   TStringFieldqPersonalCartaNOMBREEMPLEADO	FieldNameNOMBREEMPLEADOOriginEMPLEADO.NOMBREEMPLEADOSize2  TFloatField"qPersonalCartaCODIGOADMINISTRATIVO	FieldNameCODIGOADMINISTRATIVOOriginEMPLEADO.CODIGOADMINISTRATIVO  TStringField"qPersonalCartaNOMBREADMINISTRATIVO	FieldNameNOMBREADMINISTRATIVOOrigin#ADMINISTRATIVO.NOMBREADMINISTRATIVOSize�    TDDataSourcedsqPersonalCartaAutoEditDataSetqPersonalCartaLeft|Top�   
TPopupMenu	PMOrdenarLeft'Top�  	TMenuItemCodigoCaptionC�digo
GroupIndex	RadioItem	  	TMenuItemFechaEmisionCaptionFecha Emision
GroupIndex	RadioItem	  	TMenuItemObjetoCaptionObjeto
GroupIndex	RadioItem	  	TMenuItemN3Caption-
GroupIndex  	TMenuItem
ZonaCiudadCaptionZona y Ciudad
GroupIndex	RadioItem	Visible  	TMenuItemBarrioCaptionBarrio
GroupIndex	RadioItem	Visible  	TMenuItem	DireccionCaption	Direccion
GroupIndex	RadioItem	  	TMenuItemN4Caption-
GroupIndex  	TMenuItem	PrioridadCaption	Prioridad
GroupIndex	RadioItem	  	TMenuItemLaborCaptionLabor
GroupIndex	RadioItem	Visible  	TMenuItemResponsableCaptionResponsable
GroupIndex	RadioItem	Visible  	TMenuItemEstadoCaptionEstado
GroupIndex	RadioItem	  	TMenuItemN1Caption-
GroupIndexVisible  	TMenuItemDivisionSeccionCaptionDivisi�n y Secci�n
GroupIndex	RadioItem	Visible  	TMenuItem	CuadrillaCaption	Cuadrilla
GroupIndex	RadioItem	Visible   TQueryqFechaLimiteAtencionActive	DatabaseNameBaseDatoSQL.Strings1SELECT CODIGOCARTA,FECHALIMITEATENCION FROM CARTA:WHERE (FECHALIMITEATENCION-(SELECT SYSDATE FROM DUAL )<=3)8AND (FECHALIMITEATENCION-(SELECT SYSDATE FROM DUAL )>-1)AND FECHAATENCION IS NULL LeftTop�    