�
 TFLISTAREPORTESASOCIADOS 03  TPF0TflistareportesasociadosflistareportesasociadosLeft� Top� BorderIcons BorderStylebsDialogCaptionEnerGis....ClientHeightClientWidth)ColorclWindowCtl3DFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 	FormStylefsStayOnTopOldCreateOrderOnClose	FormClosePixelsPerInch`
TextHeight TPaneltitularLeft Top Width)HeightAlignalTop	AlignmenttaLeftJustifyCaptionListado de Reportes AsociadosFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder   TPanelbaseLeft Top� Width)HeightAlignalBottomTabOrder TLabel	lcircuitoLeftTopWidth=HeightCaption
Circuito: Font.CharsetDEFAULT_CHARSET
Font.ColorclRedFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TBitBtnbSalirLeftcTopWidthKHeightAnchorsakRightakBottom TabOrder OnClickbSalirClickKindbkClose  TBitBtnasociarLeft�TopWidthpHeightAnchorsakRightakBottom CaptionAgrupar ReportesTabOrderOnClickasociarClick
Glyph.Data
z  v  BMv      v   (                                       �  �   �� �   � � ��   ���   �  �   �� �   � � ��  ��� UUU     UU_wwwwwUU ����U_w_��WU   ��_wwwUW ����w_���   �wwwW����_���   �wwwW����_�UW ��wu_���  _�ww �wUu�� U��wU   UwwwuU   UUwwwuUU   UUUwwwuUUU   UUUUwwwuUUUU	NumGlyphs   TDBGriddbgReportesAsociadosLeft TopWidth)Height� AlignalClient
DataSourceDlistaReadOnly	TabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
OnDblClickdbgReportesAsociadosDblClickColumnsExpanded	FieldNameReporteTitle.AlignmenttaCenterWidth:Visible	 Expanded	FieldNameCodigoclienteTitle.AlignmenttaCenterVisible	 Expanded	FieldNameClienteTitle.AlignmenttaCenterWidth� Visible	 Expanded	FieldName	DireccionTitle.AlignmenttaCenterWidth� Visible	 Expanded	FieldNameTrafoTitle.AlignmenttaCenterWidth7Visible	 Expanded	FieldNameFECHATitle.AlignmenttaCenterTitle.CaptionFechaWidthmVisible	 Expanded	FieldNameEstadoReporteTitle.AlignmenttaCenterWidth{Visible	    TPanelpInterrupcionLeft Top� Width)HeightKAlignalBottomCaptionpInterrupcionTabOrder TLabelLabel1LeftTopWidth� HeightCaptionInformaci�n de la Interrupci�n  TMemomemoLeftTopWidthHeight-Font.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder    TDataSourceDlistaAutoEditDataSetQlistaLefthTopp  TQueryQlistaActive	DatabaseNameBaseDatoSQL.Strings�select to_char(fechahora,'DD/MM/YYYY HH24:MI:SS') as fecha,t.pintadotrafodis as "Trafo",ci.nombrecircuito as "Circuito",c.codigoclientecom as "Codigocliente",�c.nombresuscriptor as "Cliente",direccionsuscriptor as "Direccion",r.codigoreporte as "Reporte",er.NOMBREESTADOREPORTE as "EstadoReporte"[from clientesgd c,nodobt nb, trafodis t, nodomt nm,reporte r,circuito ci, estadoreporte er,0(SELECT SUBSTR(Hijo.Nombre, 5) as codigotrafodis#FROM TREENODES Papa, TREENODES Hijo&WHERE Hijo.Izquierda >= Papa.Izquierda"AND Hijo.Izquierda <= Papa.Derecha!AND Papa.CodigoCircuito ='03 303'AND Papa.Tipo = 'TF'!AND Hijo.CodigoCircuito ='03 303'AND Hijo.Tipo = 'TF'AND Papa.Nombre = 'SW: 21968') trafoswherec.codigoapoyo=nb.codigoapoyo"and c.codigonodobt=nb.codigonodobt&and nb.codigotrafodis=t.codigotrafodis!and t.codigoapoyo1=nm.codigoapoyo"and t.codigonodomt=nm.codigonodomtand nm.codigocircuito='03 303'*and t.codigotrafodis=trafos.codigotrafodis)and r.codigoclientesgd=c.codigoclientesgd'and nm.codigocircuito=ci.codigocircuitoand r.codigoclasereporte=2"and r.codigoestadoreporte in (1,2)0and r.codigoestadoreporte=er.codigoestadoreporte-order by t.pintadotrafodis,c.nombresuscriptor				       Left8Topp   