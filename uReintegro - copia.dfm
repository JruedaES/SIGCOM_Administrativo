�
 TFREINTEGRO 0�T  TPF0TfReintegro
fReintegroLeft� TopUBorderIconsbiSystemMenu BorderStylebsDialogCaption	ReintegroClientHeight�ClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TPanelPanel15Left Top Width�Height�AlignalClientCaptionPanel15TabOrder  TPanelPanel16LeftTopWidth�HeightPAlignalTopTabOrder  	TGroupBox
GroupBox15LeftTopWidth�HeightIAlignalTopCaptionOrigenTabOrder  TLabelLabel12LeftTopWidthHeightCaptionZona  TLabelLabel13LeftTopWidth)HeightCaptionAlmacen  TLabelLabel16LeftTopWidth%HeightCaptionBodega  TLabelLabel9Left�TopWidth6HeightCaption
Movimiento  TDBEditDBEdit2Left�TopWidthHeight	DataField	CIAS_CIAS
DataSourcedsReintegroMaterialReadOnly	TabOrder   TDBEditDBEdit1Left�TopWidth� Height	DataField
nombrezona
DataSourcedsReintegroMaterialTabOrder  TDBEdit
dbeAlmacenLeftTop&WidthHeight	DataFieldCOD_ALMACEN
DataSourcedsReintegroMaterialTabOrder  TDBLookupComboBoxdblcAlmacenLeft%Top&Width� Height	DataFieldCOD_ALMACEN
DataSourcedsReintegroMaterialKeyFieldCOD_ALMACEN	ListFieldUPPER(ALMACEN_DESCRI)
ListSource	dsAlmacenTabOrder  TDBEdit	dbeBodegaLeftTop&WidthHeight	DataField
COD_BODEGA
DataSourcedsReintegroMaterialTabOrder  TDBLookupComboBox
dblcBodegaLeft!Top&Width� Height	DataField
COD_BODEGA
DataSourcedsReintegroMaterialKeyField
COD_BODEGA	ListFieldUPPER(BODEGA_DESCRI)
ListSourcedsBodegaTabOrder  TDBEditdbeCIASLeftTopgWidthHeight	DataField	CIAS_CIASTabOrderVisible  TDBLookupComboBoxdblcCIASLeft*TopgWidth� Height	DataFieldCIAS_CIAS_INVENKeyField	CIAS_CIAS	ListFieldCIAS_DESCRITabOrderVisible  TDBEditDBEdit8TagLeftTop&Width.Height	DataFieldCODIGOZONAORIGEN
DataSourcedsODTTabOrder  TDBLookupComboBoxdblcbNombreZonaTagLeft<Top&Width� Height	DataFieldCODIGOZONAORIGEN
DataSourcedsODTKeyField
CODIGOZONA	ListField
NOMBREZONA
ListSourcedsZonaTabOrder	  TDBEditDBEdit7Left�Top&Width-Height	DataFieldCODIGOMOVIMIENTOPRESUPUESTO
DataSourcedsReintegroMaterialTabOrder
  TDBLookupComboBoxdblcMovimientoLeft8Top&Width� Height	DataFieldCODIGOMOVIMIENTOPRESUPUESTO
DataSourcedsReintegroMaterialKeyFieldCODIGOMOVIMIENTOPRESUPUESTO	ListFieldNOMBREMOVIMIENTOPRESUPUESTO
ListSourcedsMovimientoParentShowHintShowHint	TabOrder    TPanelPanel23LeftTop�Width�Height!AlignalBottomTabOrder TBitBtn
bbCancelarLeftGTopWidthKHeightCaption	&CancelarModalResultTabOrder 
Glyph.Data
�  �  BM�      v   (   $            h                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  33�33333333?333333  39�33�3333��33?33  3939�338�3?��3  39��338�8��3�3  33�338�3��38�  339�333�3833�3  333�33338�33?�3  3331�33333�33833  3339�333338�3�33  333��33333833�33  33933333�33�33  33����333838�8�3  33�39333�3��3�3  33933�333��38�8�  33333393338�33���  3333333333333338�3  333333333333333333  	NumGlyphs  TBitBtn	bbAceptarLeft�TopWidthKHeightCaption&AceptarModalResultTabOrderOnClickbbAceptarClick
Glyph.Data
�  �  BM�      v   (   $            h                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  333333333333�33333  334C33333338�33333  33B$3333333�8�3333  34""C33333833�3333  3B""$33333�338�333  4"*""C3338�8�3�333  2"��"C3338�3�333  :*3:"$3338�38�8�33  3�33�"C333�33�3�33  3333:"$3333338�8�3  33333�"C333333�3�3  33333:"$3333338�8�  333333�"C333333�3�  333333:"C3333338�  3333333�#3333333��  3333333:3333333383  333333333333333333  	NumGlyphs   TPanelPanel1LeftTopQWidth�HeightCAlignalClientTabOrder TPanelPanel2LeftTop+Width�HeightAlignalBottomTabOrder  TDBNavigatorDBNavigator2LeftTopWidth�Height
DataSourcedsReintegroMaterialDetalleVisibleButtonsnbPriornbNextnbInsertnbDeletenbEditnbCancel AlignalClientFlat	Hints.StringsPrimeroAnterior	SiguienteUltimoInsertarEliminarEditarAplicarCancelar	Refrescar ParentShowHintShowHint	TabOrder    TDBGriddbgMaterialesLeftTopWidth�Height*AlignalClient
DataSourcedsReintegroMaterialDetalleTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style OnEditButtonClickdbgMaterialesEditButtonClickColumnsExpanded	FieldNameCODIGOREINTEGROTitle.Caption	ReintegroWidth=Visible	 ButtonStylecbsEllipsisExpanded	FieldNameCODIGOMATERIALTitle.CaptionCod_MaterialWidthJVisible	 Expanded	FieldNameNOMBREMATERIALTitle.CaptionNombre MaterialWidthEVisible	 Expanded	FieldNameCANTIDADNUEVABTitle.CaptionNueva BuenaWidth[Visible	 Expanded	FieldNameCANTIDADNUEVAMTitle.Caption
Nueva MalaWidthbVisible	 Expanded	FieldNameCANTIDADDESMANBTitle.CaptionDesman. BuenaWidth_Visible	 Expanded	FieldNameCANTIDADDESMANMTitle.CaptionDesman. MalaWidth_Visible	      TQueryqReintegroMaterialDetalleCachedUpdates	
BeforeEdit#qReintegroMaterialDetalleBeforeEdit	AfterPost"qReintegroMaterialDetalleAfterPostAfterScroll$qReintegroMaterialDetalleAfterScrollDatabaseNameBaseDatoSQL.Strings�select R.CODIGOREINTEGRO,  R.codigomaterial, R.CANTIDADNUEVAB, R.CANTIDADNUEVAM, R.CANTIDADDESMANB , R.CANTIDADDESMANM, m.nombrematerial  )from ODTREINTEGRODETALLE R,MATERIALESSA m)where R.codigomaterial = m.codigomaterial&and CODIGOREINTEGRO = :CODIGOREINTEGRO  UpdateObjectUpdReintegroMaterialDetalleLeft@Topn	ParamDataDataTypeftFloatNameCODIGOREINTEGRO	ParamType	ptUnknown   TFloatField(qReintegroMaterialDetalleCODIGOREINTEGRO	FieldNameCODIGOREINTEGROOrigin#ODTREINTEGRODETALLE.CODIGOREINTEGRO  TFloatField'qReintegroMaterialDetalleCODIGOMATERIAL	FieldNameCODIGOMATERIALOrigin"ODTREINTEGRODETALLE.CODIGOMATERIAL  TFloatField'qReintegroMaterialDetalleCANTIDADNUEVAB	FieldNameCANTIDADNUEVABOrigin"ODTREINTEGRODETALLE.CANTIDADNUEVAB
OnValidate/qReintegroMaterialDetalleCANTIDADNUEVABValidate  TFloatField'qReintegroMaterialDetalleCANTIDADNUEVAM	FieldNameCANTIDADNUEVAMOrigin"ODTREINTEGRODETALLE.CANTIDADNUEVAM
OnValidate/qReintegroMaterialDetalleCANTIDADNUEVAMValidate  TFloatField(qReintegroMaterialDetalleCANTIDADDESMANB	FieldNameCANTIDADDESMANBOrigin#ODTREINTEGRODETALLE.CANTIDADDESMANB
OnValidate0qReintegroMaterialDetalleCANTIDADDESMANBValidate  TFloatField(qReintegroMaterialDetalleCANTIDADDESMANM	FieldNameCANTIDADDESMANMOrigin#ODTREINTEGRODETALLE.CANTIDADDESMANM
OnValidate0qReintegroMaterialDetalleCANTIDADDESMANMValidate  TStringField'qReintegroMaterialDetalleNOMBREMATERIAL	FieldNameNOMBREMATERIALOriginMATERIALESSA.NOMBREMATERIALSized   TDataSourcedsReintegroMaterialDetalleDataSetqReintegroMaterialDetalleLeft8Top;  
TUpdateSQLUpdReintegroMaterialDetalleModifySQL.Stringsupdate ODTREINTEGRODETALLEset%  CODIGOREINTEGRO = :CODIGOREINTEGRO,#  CODIGOMATERIAL = :CODIGOMATERIAL,#  CANTIDADNUEVAB = :CANTIDADNUEVAB,#  CANTIDADNUEVAM = :CANTIDADNUEVAM,%  CANTIDADDESMANB = :CANTIDADDESMANB,$  CANTIDADDESMANM = :CANTIDADDESMANMwhere,  CODIGOREINTEGRO = :OLD_CODIGOREINTEGRO and&  CODIGOMATERIAL = :OLD_CODIGOMATERIAL InsertSQL.Stringsinsert into ODTREINTEGRODETALLEU  (CODIGOREINTEGRO, CODIGOMATERIAL, CANTIDADNUEVAB, CANTIDADNUEVAM, CANTIDADDESMANB,    CANTIDADDESMANM)valuesH  (:CODIGOREINTEGRO, :CODIGOMATERIAL, :CANTIDADNUEVAB, :CANTIDADNUEVAM, &   :CANTIDADDESMANB, :CANTIDADDESMANM) DeleteSQL.Stringsdelete from ODTREINTEGRODETALLEwhere,  CODIGOREINTEGRO = :OLD_CODIGOREINTEGRO and&  CODIGOMATERIAL = :OLD_CODIGOMATERIAL Left2Top  
TUpdateSQLupdReintegroMaterialModifySQL.Stringsupdate ODTREINTEGROset  CODIGOODT = :CODIGOODT,  CONSECUTIVO = :CONSECUTIVO,  CIAS_CIAS = :CIAS_CIAS,  COD_ALMACEN = :COD_ALMACEN,  COD_BODEGA = :COD_BODEGA,%  CODIGOREINTEGRO = :CODIGOREINTEGRO,  ESTADO = :ESTADO,#  FECHAREINTEGRO = :FECHAREINTEGRO,<  CODIGOMOVIMIENTOPRESUPUESTO = :CODIGOMOVIMIENTOPRESUPUESTOwhere(  CODIGOREINTEGRO = :OLD_CODIGOREINTEGRO InsertSQL.Stringsinsert into ODTREINTEGROP  (CODIGOODT, CONSECUTIVO, CIAS_CIAS, COD_ALMACEN, COD_BODEGA, CODIGOREINTEGRO, 7   ESTADO, FECHAREINTEGRO, CODIGOMOVIMIENTOPRESUPUESTO)valuesV  (:CODIGOODT, :CONSECUTIVO, :CIAS_CIAS, :COD_ALMACEN, :COD_BODEGA, :CODIGOREINTEGRO, :   :ESTADO, :FECHAREINTEGRO, :CODIGOMOVIMIENTOPRESUPUESTO) DeleteSQL.Stringsdelete from ODTREINTEGROwhere(  CODIGOREINTEGRO = :OLD_CODIGOREINTEGRO Left�Topo  TDataSourcedsReintegroMaterialDataSetqReintegroMaterialLeft�Top�   TQueryqReintegroMaterialCachedUpdates		AfterPostqReintegroMaterialAfterPostDatabaseNameBaseDatoSQL.StringsSELECT * FROM ODTREINTEGRO(WHERE CODIGOREINTEGRO = :CODIGOREINTEGRO UpdateObjectupdReintegroMaterialLeft�Top� 	ParamDataDataTypeftFloatNameCODIGOREINTEGRO	ParamType	ptUnknown   TFloatFieldqReintegroMaterialCODIGOODT	FieldName	CODIGOODTOriginODTREINTEGRO.CODIGOODT  TFloatFieldqReintegroMaterialCONSECUTIVO	FieldNameCONSECUTIVOOriginODTREINTEGRO.CONSECUTIVO  TFloatFieldqReintegroMaterialCIAS_CIAS	FieldName	CIAS_CIASOriginODTREINTEGRO.CIAS_CIAS  TStringFieldqReintegroMaterialCOD_ALMACEN	FieldNameCOD_ALMACENOriginODTREINTEGRO.COD_ALMACENSize  TStringFieldqReintegroMaterialCOD_BODEGA	FieldName
COD_BODEGAOriginODTREINTEGRO.COD_BODEGASize  TFloatField!qReintegroMaterialCODIGOREINTEGRO	FieldNameCODIGOREINTEGROOriginODTREINTEGRO.CODIGOREINTEGRO  TStringFieldqReintegroMaterialESTADO	FieldNameESTADOOriginODTREINTEGRO.ESTADOSize  TStringFieldqReintegroMaterialnombrezona	FieldKindfkLookup	FieldName
nombrezonaLookupDataSetqCIASLookupKeyFields	CIAS_CIASLookupResultFieldCIAS_DESCRI	KeyFields	CIAS_CIASSize(Lookup	  TStringField-qReintegroMaterialCODIGOMOVIMIENTOPRESUPUESTO	FieldNameCODIGOMOVIMIENTOPRESUPUESTOOrigin(ODTREINTEGRO.CODIGOMOVIMIENTOPRESUPUESTOSize  TDateTimeField qReintegroMaterialFECHAREINTEGRO	FieldNameFECHAREINTEGROOriginODTREINTEGRO.FECHAREINTEGRO   TQuery qReintegroMaterialdetalleInicialCachedUpdates	DatabaseNameBaseDatoSQL.Strings�select R.CODIGOREINTEGRO,  R.codigomaterial, R.CANTIDADNUEVAB, R.CANTIDADNUEVAM, R.CANTIDADDESMANB , R.CANTIDADDESMANM, m.nombrematerial  )from ODTREINTEGRODETALLE R,MATERIALESSA m)where R.codigomaterial = m.codigomaterial&and CODIGOREINTEGRO = :CODIGOREINTEGRO Left�Top� 	ParamDataDataTypeftFloatNameCODIGOREINTEGRO	ParamType	ptUnknown   TFloatField/qReintegroMaterialdetalleInicialCODIGOREINTEGRO	FieldNameCODIGOREINTEGROOrigin#ODTREINTEGRODETALLE.CODIGOREINTEGRO  TFloatField.qReintegroMaterialdetalleInicialCODIGOMATERIAL	FieldNameCODIGOMATERIALOrigin"ODTREINTEGRODETALLE.CODIGOMATERIAL  TFloatField.qReintegroMaterialdetalleInicialCANTIDADNUEVAB	FieldNameCANTIDADNUEVABOrigin"ODTREINTEGRODETALLE.CANTIDADNUEVAB  TFloatField.qReintegroMaterialdetalleInicialCANTIDADNUEVAM	FieldNameCANTIDADNUEVAMOrigin"ODTREINTEGRODETALLE.CANTIDADNUEVAM  TFloatField/qReintegroMaterialdetalleInicialCANTIDADDESMANB	FieldNameCANTIDADDESMANBOrigin#ODTREINTEGRODETALLE.CANTIDADDESMANB  TFloatField/qReintegroMaterialdetalleInicialCANTIDADDESMANM	FieldNameCANTIDADDESMANMOrigin#ODTREINTEGRODETALLE.CANTIDADDESMANM  TStringField.qReintegroMaterialdetalleInicialNOMBREMATERIAL	FieldNameNOMBREMATERIALOriginMATERIALESSA.NOMBREMATERIALSized   TDataSourcedsBodegaDataSetqBodegaLeft� Top�   TQueryqBodegaDatabaseNameBaseDato
DataSource	dsAlmacenSQL.StringsWSELECT COD_BODEGA, UPPER(BODEGA_DESCRI) FROM INV_S_BODEGA WHERE CIAS_CIAS = :CIAS_CIAS 4AND COD_ALMACEN = :COD_ALMACEN AND ESTADO = 'ACTIVO'ORDER BY BODEGA_DESCRI Left� Top-	ParamDataDataTypeftFloatName	CIAS_CIAS	ParamType	ptUnknown DataTypeftStringNameCOD_ALMACEN	ParamType	ptUnknown   TStringFieldqBodegaCOD_BODEGA	FieldName
COD_BODEGASize  TStringFieldqBodegaUPPERBODEGA_DESCRI	FieldNameUPPER(BODEGA_DESCRI)Size<   TDataSource	dsAlmacenDataSetqAlmacenLeft� Top�   TQueryqAlmacenDatabaseNameBaseDato
DataSourcedsCIASSQL.Strings4SELECT COD_ALMACEN, UPPER(ALMACEN_DESCRI) ,CIAS_CIASFROM INV_S_ALMACENWHERE CIAS_CIAS = :CIAS_CIASAND ESTADO = 'ACTIVO'ORDER BY ALMACEN_DESCRI Left� Top-	ParamDataDataTypeftFloatName	CIAS_CIAS	ParamType	ptUnknown   TStringFieldqAlmacenCOD_ALMACEN	FieldNameCOD_ALMACENOriginINV_S_ALMACEN.COD_ALMACENSize  TStringFieldqAlmacenUPPERALMACEN_DESCRI	FieldNameUPPER(ALMACEN_DESCRI)OriginINV_S_ALMACEN.ALMACEN_DESCRISize<  TFloatFieldqAlmacenCIAS_CIAS	FieldName	CIAS_CIASOriginINV_S_ALMACEN.CIAS_CIAS   TDataSourcedsCIASDataSetqCIASLeftgTop�   TQueryqCIAS	AfterOpenqCIASAfterOpenDatabaseNameBaseDatoSQL.StringsSELECT CIAS_CIAS, CIAS_DESCRIFROM GE_TCIASWHERE CIAS_CIAS=:CIAS_CIAS LeftgTop-	ParamDataDataType	ftUnknownName	CIAS_CIAS	ParamType	ptUnknown   TFloatFieldqCIASCIAS_CIAS	FieldName	CIAS_CIASOriginGE_TCIAS.CIAS_CIAS  TStringFieldqCIASCIAS_DESCRI	FieldNameCIAS_DESCRIOriginGE_TCIAS.CIAS_DESCRISize(   TQueryqODTCachedUpdates	DatabaseNameBaseDatoSQL.StringsSELECT * FROM ODT UpdateObjectUpdODTLeftTop, TFloatFieldqODTCODIGOODT	FieldName	CODIGOODTOriginODT.CODIGOODT  TDateTimeFieldqODTFECHAEMISION	FieldNameFECHAEMISIONOriginODT.FECHAEMISIONDisplayFormatmmmm dd 'de' yyyy  TFloatFieldqODTCODIGOADMINISTRATIVO	FieldNameCODIGOADMINISTRATIVOOriginODT.CODIGOADMINISTRATIVO  TStringFieldqODTCODIGOPRIORIDAD	FieldNameCODIGOPRIORIDADOriginODT.CODIGOPRIORIDADSize  TFloatFieldqODTCODIGOTIPOTAREA	AlignmenttaLeftJustify	FieldNameCODIGOTIPOTAREAOriginODT.CODIGOTIPOTAREA  TFloatFieldqODTCODIGOAPROBADO	FieldNameCODIGOAPROBADOOriginODT.CODIGOAPROBADO  TFloatFieldqODTCODIGOREVISADO	FieldNameCODIGOREVISADOOriginODT.CODIGOREVISADO  TFloatFieldqODTCODIGOODTTIPOMANOOBRA	FieldNameCODIGOODTTIPOMANOOBRAOriginODT.CODIGOODTTIPOMANOOBRA  TFloatFieldqODTCODIGOEJECUTOR	FieldNameCODIGOEJECUTOROriginODT.CODIGOEJECUTOR  TFloatFieldqODTCODIGOFIRMANTE	FieldNameCODIGOFIRMANTEOriginODT.CODIGOFIRMANTE  TStringFieldqODTEQUIPOENERGIZADO	FieldNameEQUIPOENERGIZADOOriginODT.EQUIPOENERGIZADOSize  TDateTimeFieldqODTFECHAAPROBACION	FieldNameFECHAAPROBACIONOriginODT.FECHAAPROBACIONDisplayFormatmmmm dd 'de' yyyy  TDateTimeFieldqODTFECHAASIGNACION	FieldNameFECHAASIGNACIONOriginODT.FECHAASIGNACIONDisplayFormatmmmm dd 'de' yyyy hh:mm am/pm  TStringFieldqODTIMPUTACIONMATERIAL	FieldNameIMPUTACIONMATERIALOriginODT.IMPUTACIONMATERIAL  TFloatFieldqODTCOSTOMATERIAL	FieldNameCOSTOMATERIALOriginODT.COSTOMATERIAL  TFloatFieldqODTCOSTOMANOOBRA	FieldNameCOSTOMANOOBRAOriginODT.COSTOMANOOBRA  TFloatFieldqODTCOSTOTRANSPORTE	FieldNameCOSTOTRANSPORTEOriginODT.COSTOTRANSPORTE  TFloatFieldqODTCOSTOEQUIPO	FieldNameCOSTOEQUIPOOriginODT.COSTOEQUIPO  TStringFieldqODTCODIGOALMACEN	FieldNameCODIGOALMACENOriginODT.CODIGOALMACENSize  TStringFieldqODTCODIGOESTADOODT	FieldNameCODIGOESTADOODTOriginODT.CODIGOESTADOODTSize  TDateTimeFieldqODTHORARIONORMALDESDE	FieldNameHORARIONORMALDESDEOriginODT.HORARIONORMALDESDEDisplayFormatmmmm dd 'de' yyyy hh:mm am/pm  TDateTimeFieldqODTHORARIONORMALHASTA	FieldNameHORARIONORMALHASTAOriginODT.HORARIONORMALHASTADisplayFormatmmmm dd 'de' yyyy hh:mm am/pm  TFloatFieldqODTCODIGOTURNOGRUPO	FieldNameCODIGOTURNOGRUPOOriginODT.CODIGOTURNOGRUPO  TStringFieldqODTCODIGOLABOR	FieldNameCODIGOLABOROriginODT.CODIGOLABORSize  
TMemoFieldqODTMOTIVOS	FieldNameMOTIVOSOriginODT.MOTIVOSBlobTypeftMemoSize�  TFloatFieldqODTCODIGOZONATRABAJO	FieldNameCODIGOZONATRABAJOOriginODT.CODIGOZONATRABAJO  TFloatFieldqODTCODIGOIMPUTACIONMATERIAL	FieldNameCODIGOIMPUTACIONMATERIALOriginODT.CODIGOIMPUTACIONMATERIAL  TStringFieldqODTSECUENCIA	FieldName	SECUENCIAOriginODT.SECUENCIASize�   TFloatFieldqODTCODIGOMUNICIPIO	FieldNameCODIGOMUNICIPIOOriginODT.CODIGOMUNICIPIO  TDateTimeFieldqODTFECHAINICIO	FieldNameFECHAINICIOOriginODT.FECHAINICIO  TFloatFieldqODTCODIGOZONAORIGEN	FieldNameCODIGOZONAORIGENOriginODT.CODIGOZONAORIGEN  TDateTimeFieldqODTFECHAFINAL	FieldName
FECHAFINALOriginODT.FECHAFINAL  TStringFieldqODTCODIGOCONTRATISTA	FieldNameCODIGOCONTRATISTAOriginODT.CODIGOCONTRATISTASize  TStringFieldqODTCODIGOAREAINFLUENCIA	FieldNameCODIGOAREAINFLUENCIAOriginODT.CODIGOAREAINFLUENCIASize  TStringFieldqODTNUMEROCONTRATO	FieldNameNUMEROCONTRATOOriginODT.NUMEROCONTRATOSize  TFloatFieldqODTCODIGOTIPOTURNO	FieldNameCODIGOTIPOTURNOOriginODT.CODIGOTIPOTURNO  TFloatFieldqODTCODIGOTURNO	FieldNameCODIGOTURNOOriginODT.CODIGOTURNO  TFloatFieldqODTCODIGOMODOODT	FieldNameCODIGOMODOODTOriginODT.CODIGOMODOODT  
TMemoField	qODTNOTAS	FieldNameNOTASOrigin	ODT.NOTASBlobTypeftMemoSize�   TDataSourcedsODTDataSetqODTLeftTop�   
TUpdateSQLUpdODTModifySQL.Strings
update ODTset  CODIGOODT = :CODIGOODT,  FECHAEMISION = :FECHAEMISION,  MOTIVOS = :MOTIVOS,/  CODIGOADMINISTRATIVO = :CODIGOADMINISTRATIVO,%  CODIGOPRIORIDAD = :CODIGOPRIORIDAD,  CODIGOLABOR = :CODIGOLABOR,%  CODIGOTIPOTAREA = :CODIGOTIPOTAREA,#  CODIGOAPROBADO = :CODIGOAPROBADO,#  CODIGOREVISADO = :CODIGOREVISADO,1  CODIGOODTTIPOMANOOBRA = :CODIGOODTTIPOMANOOBRA,#  CODIGOEJECUTOR = :CODIGOEJECUTOR,#  CODIGOFIRMANTE = :CODIGOFIRMANTE,'  EQUIPOENERGIZADO = :EQUIPOENERGIZADO,%  FECHAAPROBACION = :FECHAAPROBACION,%  FECHAASIGNACION = :FECHAASIGNACION,+  IMPUTACIONMATERIAL = :IMPUTACIONMATERIAL,!  COSTOMATERIAL = :COSTOMATERIAL,!  COSTOMANOOBRA = :COSTOMANOOBRA,%  COSTOTRANSPORTE = :COSTOTRANSPORTE,  COSTOEQUIPO = :COSTOEQUIPO,!  CODIGOALMACEN = :CODIGOALMACEN,%  CODIGOESTADOODT = :CODIGOESTADOODT,+  HORARIONORMALDESDE = :HORARIONORMALDESDE,+  HORARIONORMALHASTA = :HORARIONORMALHASTA,'  CODIGOTURNOGRUPO = :CODIGOTURNOGRUPO,)  CODIGOZONATRABAJO = :CODIGOZONATRABAJO,7  CODIGOIMPUTACIONMATERIAL = :CODIGOIMPUTACIONMATERIAL,  NOTAS = :NOTAS,  SECUENCIA = :SECUENCIA,%  CODIGOMUNICIPIO = :CODIGOMUNICIPIO,  FECHAINICIO = :FECHAINICIO,  FECHAFINAL = :FECHAFINAL,/  CODIGOAREAINFLUENCIA = :CODIGOAREAINFLUENCIA,'  CODIGOZONAORIGEN = :CODIGOZONAORIGEN,)  CODIGOCONTRATISTA = :CODIGOCONTRATISTA,%  CODIGOTIPOTURNO = :CODIGOTIPOTURNO,  CODIGOTURNO = :CODIGOTURNO,#  NUMEROCONTRATO = :NUMEROCONTRATO,   CODIGOMODOODT = :CODIGOMODOODTwhere  CODIGOODT = :OLD_CODIGOODT InsertSQL.Stringsinsert into ODTL  (CODIGOODT, FECHAEMISION, MOTIVOS, CODIGOADMINISTRATIVO, CODIGOPRIORIDAD, X   CODIGOLABOR, CODIGOTIPOTAREA, CODIGOAPROBADO, CODIGOREVISADO, CODIGOODTTIPOMANOOBRA, W   CODIGOEJECUTOR, CODIGOFIRMANTE, EQUIPOENERGIZADO, FECHAAPROBACION, FECHAASIGNACION, S   IMPUTACIONMATERIAL, COSTOMATERIAL, COSTOMANOOBRA, COSTOTRANSPORTE, COSTOEQUIPO, K   CODIGOALMACEN, CODIGOESTADOODT, HORARIONORMALDESDE, HORARIONORMALHASTA, I   CODIGOTURNOGRUPO, CODIGOZONATRABAJO, CODIGOIMPUTACIONMATERIAL, NOTAS, N   SECUENCIA, CODIGOMUNICIPIO, FECHAINICIO, FECHAFINAL, CODIGOAREAINFLUENCIA, V   CODIGOZONAORIGEN, CODIGOCONTRATISTA, CODIGOTIPOTURNO, CODIGOTURNO, NUMEROCONTRATO,    CODIGOMODOODT)valuesQ  (:CODIGOODT, :FECHAEMISION, :MOTIVOS, :CODIGOADMINISTRATIVO, :CODIGOPRIORIDAD, ]   :CODIGOLABOR, :CODIGOTIPOTAREA, :CODIGOAPROBADO, :CODIGOREVISADO, :CODIGOODTTIPOMANOOBRA, J   :CODIGOEJECUTOR, :CODIGOFIRMANTE, :EQUIPOENERGIZADO, :FECHAAPROBACION, J   :FECHAASIGNACION, :IMPUTACIONMATERIAL, :COSTOMATERIAL, :COSTOMANOOBRA, Z   :COSTOTRANSPORTE, :COSTOEQUIPO, :CODIGOALMACEN, :CODIGOESTADOODT, :HORARIONORMALDESDE, Z   :HORARIONORMALHASTA, :CODIGOTURNOGRUPO, :CODIGOZONATRABAJO, :CODIGOIMPUTACIONMATERIAL, [   :NOTAS, :SECUENCIA, :CODIGOMUNICIPIO, :FECHAINICIO, :FECHAFINAL, :CODIGOAREAINFLUENCIA, J   :CODIGOZONAORIGEN, :CODIGOCONTRATISTA, :CODIGOTIPOTURNO, :CODIGOTURNO, #   :NUMEROCONTRATO, :CODIGOMODOODT) DeleteSQL.Stringsdelete from ODTwhere  CODIGOODT = :OLD_CODIGOODT LeftTopZ  TQueryqZonaDatabaseNameBaseDatoSQL.StringsSELECT * FROM ZONAESSAORDER BY codigozona LeftgTop� TFloatFieldqZonaCODIGOZONA	FieldName
CODIGOZONAOriginAP_ZONA.CODIGOZONA  TStringFieldqZonaNOMBREZONA	FieldName
NOMBREZONAOriginAP_ZONA.NOMBREZONASize�   TFloatFieldqZonaCODIGOZONAESSA	FieldNameCODIGOZONAESSAOriginZONAESSA.CODIGOZONAESSA  TFloatFieldqZonaCODIGOMUNICIPIOBASE	FieldNameCODIGOMUNICIPIOBASEOriginZONAESSA.CODIGOMUNICIPIOBASE   TDataSourcedsZonaDataSetqZonaLefthTop  TDataSourcedsMovimientoDataSetqMovimientoLeft�Top�   TQueryqMovimientoDatabaseNamebasedatoSQL.Strings[SELECT CODIGOMOVIMIENTOPRESUPUESTO,  NOMBREMOVIMIENTOPRESUPUESTO FROM MOVIMIENTOPRESUPUESTO
ORDER BY 2 Left�Top�  TStringField&qMovimientoNOMBREMOVIMIENTOPRESUPUESTO	FieldNameNOMBREMOVIMIENTOPRESUPUESTOOrigin1MOVIMIENTOPRESUPUESTO.NOMBREMOVIMIENTOPRESUPUESTOSize2  TStringField&qMovimientoCODIGOMOVIMIENTOPRESUPUESTO	FieldNameCODIGOMOVIMIENTOPRESUPUESTOOrigin1MOVIMIENTOPRESUPUESTO.CODIGOMOVIMIENTOPRESUPUESTOSize    