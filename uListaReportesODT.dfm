�
 TFLISTAREPORTESODT 0~  TPF0TfListaReportesODTfListaReportesODTLeft� Top� WidthXHeightfCaption%Listado de Reportes sin Asociar a ODTColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPositionpoScreenCenterOnCreate
FormCreatePixelsPerInch`
TextHeight TPanelPanel1Left TopWidthPHeight.AlignalBottomTabOrder  TPanelPanel4LeftTopWidth8Height,AlignalRight
BevelOuterbvNoneCaptionPanel4TabOrder  TBitBtn
bbCancelarLeft� TopWidthKHeightCaption	&CancelarTabOrder KindbkCancel  TBitBtn	bbAceptarLeft� TopWidthKHeightCaption&AceptarModalResultTabOrder
Glyph.Data
�  �  BM�      v   (   $            h                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  333333333333�33333  334C33333338�33333  33B$3333333�8�3333  34""C33333833�3333  3B""$33333�338�333  4"*""C3338�8�3�333  2"��"C3338�3�333  :*3:"$3338�38�8�33  3�33�"C333�33�3�33  3333:"$3333338�8�3  33333�"C333333�3�3  33333:"$3333338�8�  333333�"C333333�3�  333333:"C3333338�  3333333�#3333333��  3333333:3333333383  333333333333333333  	NumGlyphs    TPanelPanel2Left Top WidthPHeightAlignalClientTabOrder 	TRxDBGridDBGrid1LeftTopWidthNHeight� AlignalClient
DataSourceDataSource1OptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgRowSelectdgConfirmDeletedgCancelOnExitdgMultiSelect TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style 
OnDblClickDBGrid1DblClickOnTitleClickDBGrid1TitleClickMultiSelect	OnMouseMoveDBGrid1MouseMoveColumnsColorclInfoBkExpanded	FieldNameCODIGOREPORTETitle.AlignmenttaCenterTitle.CaptionC�digoVisible	 ColorclAquaExpanded	FieldNameCODIGOADMINISTRATIVOTitle.AlignmenttaCenterTitle.CaptionCIAVisible	 Expanded	FieldNameTIPOINFORMANTETitle.AlignmenttaCenterTitle.CaptionTipo InformanteWidth� Visible	 Expanded	FieldNameNOMBREGRUPOTRABAJOTitle.AlignmenttaCenterTitle.CaptionGrupo de TrabajoWidth� Visible	 Expanded	FieldNameNOMBREESTADOREPORTETitle.AlignmenttaCenterTitle.CaptionEstado ReporteWidthdVisible	 Expanded	FieldNameDIRECCIONDANOTitle.AlignmenttaCenterTitle.CaptionDirecci�n Da�oWidth� Visible	 Expanded	FieldNameNOMBRECLASEREPORTETitle.AlignmenttaCenterTitle.CaptionClase ReporteWidthdVisible	 Expanded	FieldNameNOMBRETIPOREPORTETitle.AlignmenttaCenterTitle.CaptionTipo ReporteWidthdVisible	    TDBMemoDBMemo1LeftTop� WidthNHeightKAlignalBottom	DataFieldDESCRIPCION
DataSourceDataSource1TabOrder  TPanelPanel3LeftTop� WidthNHeightAlignalBottom
BevelOuterbvNoneCaptionDescripci�nColorclSilverFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder   TQueryqListaReporteDatabaseNameBaseDatoSQL.Strings>SELECT R.CODIGOREPORTE, TI.NOMBREINFORMANTE AS TIPOINFORMANTE,.R.CODIGOESTADOREPORTE, ER.NOMBREESTADOREPORTE,(R.DIRECCIONDANO, CR.NOMBRECLASEREPORTE, 8TR.NOMBRETIPOREPORTE, R.NOMBREINFORMANTE, R.DESCRIPCION,TR.FECHAHORADICTADO, R.FECHAHORALLEGADA, R.FECHAHORAATENCION, R.CODIGOADMINISTRATIVO,G.NOMBREGRUPOTRABAJO0FROM REPORTE R, INFORMANTE TI, ESTADOREPORTE ER,/CLASEREPORTE CR, TIPOREPORTE TR, GRUPOTRABAJO G4WHERE (R.CODIGOINFORMANTE = TI.CODIGOINFORMANTE) AND2(R.CODIGOESTADOREPORTE=ER.CODIGOESTADOREPORTE) AND2(CR.CODIGOCLASEREPORTE = R.CODIGOCLASEREPORTE) AND0(TR.CODIGOTIPOREPORTE = R.CODIGOTIPOREPORTE) ANDL(R.CODIGOREPORTE NOT IN (SELECT DISTINCT CODIGOREPORTE FROM ODTREPORTE)) AND4(G.CODIGOGRUPOTRABAJO (+)= R.CODIGOGRUPOTRABAJO) AND5(G.CODIGOADMINISTRATIVO (+)= R.CODIGOADMINISTRATIVO) fAND (R.CODIGOADMINISTRATIVO=:CODIGOADMINISTRATIVO) AND (R.CODIGOESTADOREPORTE NOT IN('4','5','8','9'))ORDER BY R.CODIGOREPORTE DESC Left(Top	ParamDataDataTypeftFloatNameCODIGOADMINISTRATIVO	ParamType	ptUnknown   TFloatFieldqListaReporteCODIGOREPORTE	FieldNameCODIGOREPORTEOriginREPORTE.CODIGOREPORTE  TStringFieldqListaReporteTIPOINFORMANTE	FieldNameTIPOINFORMANTEOriginINFORMANTE.NOMBREINFORMANTESize(  TStringField qListaReporteCODIGOESTADOREPORTE	FieldNameCODIGOESTADOREPORTEOriginREPORTE.CODIGOESTADOREPORTESize  TStringField qListaReporteNOMBREESTADOREPORTE	FieldNameNOMBREESTADOREPORTEOrigin!ESTADOREPORTE.NOMBREESTADOREPORTESize  TStringFieldqListaReporteDIRECCIONDANO	FieldNameDIRECCIONDANOOriginREPORTE.DIRECCIONDANOSize(  TStringFieldqListaReporteNOMBRECLASEREPORTE	FieldNameNOMBRECLASEREPORTEOriginCLASEREPORTE.NOMBRECLASEREPORTESize<  TStringFieldqListaReporteNOMBRETIPOREPORTE	FieldNameNOMBRETIPOREPORTEOriginTIPOREPORTE.NOMBRETIPOREPORTESize  TStringFieldqListaReporteNOMBREINFORMANTE	FieldNameNOMBREINFORMANTEOriginREPORTE.NOMBREINFORMANTESize(  TDateTimeFieldqListaReporteFECHAHORADICTADO	FieldNameFECHAHORADICTADOOriginREPORTE.FECHAHORADICTADO  TDateTimeFieldqListaReporteFECHAHORALLEGADA	FieldNameFECHAHORALLEGADAOriginREPORTE.FECHAHORALLEGADA  TDateTimeFieldqListaReporteFECHAHORAATENCION	FieldNameFECHAHORAATENCIONOriginREPORTE.FECHAHORAATENCION  TFloatField!qListaReporteCODIGOADMINISTRATIVO	FieldNameCODIGOADMINISTRATIVOOriginREPORTE.CODIGOADMINISTRATIVO  TStringFieldqListaReporteNOMBREGRUPOTRABAJO	FieldNameNOMBREGRUPOTRABAJOSize  
TMemoFieldqListaReporteDESCRIPCION	FieldNameDESCRIPCIONBlobTypeftMemoSize�   TDataSourceDataSource1DataSetqListaReporteLefthTop    