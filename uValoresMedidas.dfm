�
 TFVALORESMEDIDAS 07,  TPF0TFValoresMedidasFValoresMedidasLeft� Top=WidthgHeight�CaptionValores de MedidasColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderScaledOnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight TPanelPanel1Left Top Width_Height� AlignalTopTabOrder  TLabelLabel1Left� TopWidthCHeightCaptionDependencia:  TLabelLabel22Left�TopXWidthHHeightCaptionFecha Registro  TPanelPanel3LeftTopWidth]Height(AlignalTopCaptionDatos B�sicosColor,�� Font.CharsetDEFAULT_CHARSET
Font.ColorclWhiteFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder    TPanelPanel6Left TophWidth_Height)AlignalBottomTabOrder TPanelPanel5Left�TopWidth� Height'AlignalRight
BevelOuterbvNoneTabOrder  TBitBtnbAceptarLeftTopWidthKHeightCaption&AceptarModalResultTabOrder OnClickbAceptarClick
Glyph.Data
�  �  BM�      v   (   $            h                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  333333333333�33333  334C33333338�33333  33B$3333333�8�3333  34""C33333833�3333  3B""$33333�338�333  4"*""C3338�8�3�333  2"��"C3338�3�333  :*3:"$3338�38�8�33  3�33�"C333�33�3�33  3333:"$3333338�8�3  33333�"C333333�3�3  33333:"$3333338�8�  333333�"C333333�3�  333333:"C3333338�  3333333�#3333333��  3333333:3333333383  333333333333333333  	NumGlyphs  TBitBtn	bCancelarLeftuTopWidthKHeightCaption	&CancelarTabOrderOnClickbCancelarClickKindbkCancel    	TGroupBox	GroupBox1LeftTop8Width1Height� TabOrder TLabelLbCoordinacionLeftTopWidth?HeightCaptionCoordinaci�nFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabelLabel9Left
TopLWidth'HeightCaptionSecci�nFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabelLabel10LeftTop3Width'HeightCaptionFormatoFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style 
ParentFont  TLabelLabel2LeftTophWidth#HeightCaptionMedida  TLabelLabel3Left+TophWidthHeightCaptionValor  TDBLookupComboBoxDBLCBFormatoLeftNTop,Width�HeightColor��� Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style KeyFieldCODIGOFORMATOMTTO	ListFieldNOMBREFORMATOMTTO
ListSource	dsFormato
ParentFontTabOrder OnClickDBLCBFormatoClick  TDBLookupComboBoxDBLCBCoordinacionLeftNTopWidth� HeightFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style KeyFieldCODIGOODTOPERA	ListFieldNOMBREODTOPERA
ListSourcedsCoordinacion
ParentFontTabOrderOnClickDBLCBCoordinacionClick  TListBoxcodigo1Left�TopWidthQHeight&
ItemHeightTabOrderVisible  TListBoxcodigo2Left8TopWidthYHeight'
ItemHeightTabOrderVisible  TMemoMemo1Left@TopHWidth� HeightYLines.StringsMemo1 TabOrderVisible  TDBLookupComboBoxDBLCBSeccionLeftNTopIWidth�HeightColor��� Font.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style KeyFieldCODIGOSECCIONFORMATO	ListFieldNOMBRESECCIONFORMATO
ListSourcedsSecciones
ParentFontTabOrderOnClickDBLCBSeccionClick  TDBLookupComboBox
DBLCBValorLeftPTopfWidth� HeightColor��� 	DataFieldCODIGOVALOR
DataSourcedsValoresMedidasFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style KeyFieldCODIGOVALOR	ListFieldVALOR
ListSource	dsValores
ParentFontTabOrder  TButtonbAgregarLeft�Top� WidthKHeightCaptionAgregarTabOrderOnClickbAgregarClick  TDBLookupComboBoxDBLCBMedidasLeftNTopfWidth� HeightColor��� 	DataFieldCODIGOCOLUMNAMEDIDA
DataSourcedsValoresMedidasFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameArial
Font.Style KeyFieldCODIGOCOLUMNAMEDIDA	ListFieldNOMBRECOLUMNAMEDIDA
ListSource	dsMedidas
ParentFontTabOrderOnClickDBLCBMedidasClick   TDataSource	dsFormatoDataSetqFormatoLeftPTopH  TQueryqFormatoCachedUpdates	DatabaseNameBaseDatoSQL.Strings SELECT * FROM HVE_FORMATOMTTO FM/WHERE FM.CODIGOCOORDINACION=:CODIGOCOORDINACION LeftSTop	ParamDataDataType	ftIntegerNameCODIGOCOORDINACION	ParamType	ptUnknown   TFloatFieldqFormatoCODIGOFORMATOMTTO	FieldNameCODIGOFORMATOMTTOOrigin!HVE_FORMATOMTTO.CODIGOFORMATOMTTOOnChangeqFormatoCODIGOFORMATOMTTOChange  TStringFieldqFormatoNOMBREFORMATOMTTO	FieldNameNOMBREFORMATOMTTOOrigin!HVE_FORMATOMTTO.NOMBREFORMATOMTTOSizeP  TFloatFieldqFormatoCODIGOCOORDINACION	FieldNameCODIGOCOORDINACIONOrigin"HVE_FORMATOMTTO.CODIGOCOORDINACION   TQueryqCoordinacionCachedUpdates	DatabaseNameBaseDatoSQL.Strings3SELECT CODIGOODTOPERA, NOMBREODTOPERA FROM ODTOPERAWHERE CODIGOADMINISTRATIVO=58 LeftTop TFloatFieldqCoordinacionCODIGOODTOPERA	FieldNameCODIGOODTOPERAOriginODTOPERA.CODIGOODTOPERAOnChange!qCoordinacionCODIGOODTOPERAChange  TStringFieldqCoordinacionNOMBREODTOPERA	FieldNameNOMBREODTOPERAOriginODTOPERA.NOMBREODTOPERASize   TDataSourcedsCoordinacionAutoEditDataSetqCoordinacionLeftTopH  TQueryqCaracteristicasElementoActive	CachedUpdates	DatabaseNameBaseDatoSQL.Strings?select * from pm_elemento where codigoelemento =:codigoelemento LeftPTopJ	ParamDataDataType	ftIntegerNamecodigoelemento	ParamType	ptUnknown   TFloatField&qCaracteristicasElementoCODIGOELEMENTO	FieldNameCODIGOELEMENTOOriginPM_ELEMENTO.CODIGOELEMENTO  TStringField*qCaracteristicasElementoCODIGOTIPOELEMENTO	FieldNameCODIGOTIPOELEMENTOOriginPM_ELEMENTO.CODIGOTIPOELEMENTOSize  TFloatField$qCaracteristicasElementoCODIGOAMBITO	FieldNameCODIGOAMBITOOriginPM_ELEMENTO.CODIGOAMBITO  TStringField+qCaracteristicasElementoNOMBRETABLAELEMENTO	FieldNameNOMBRETABLAELEMENTOOriginPM_ELEMENTO.NOMBRETABLAELEMENTOSize  TFloatField,qCaracteristicasElementoNUMEROCLAVESELEMENTO	FieldNameNUMEROCLAVESELEMENTOOrigin PM_ELEMENTO.NUMEROCLAVESELEMENTO  TStringField&qCaracteristicasElementoCLAVEELEMENTO1	FieldNameCLAVEELEMENTO1OriginPM_ELEMENTO.CLAVEELEMENTO1Size  TStringField&qCaracteristicasElementoCLAVEELEMENTO2	FieldNameCLAVEELEMENTO2OriginPM_ELEMENTO.CLAVEELEMENTO2Size  TStringField&qCaracteristicasElementoCLAVEELEMENTO3	FieldNameCLAVEELEMENTO3OriginPM_ELEMENTO.CLAVEELEMENTO3Size  TStringField*qCaracteristicasElementoNOMBRETIPOELEMENTO	FieldNameNOMBRETIPOELEMENTOOriginPM_ELEMENTO.NOMBRETIPOELEMENTOSizeP  TStringField(qCaracteristicasElementoCAMPODESCRIPTIVO	FieldNameCAMPODESCRIPTIVOOriginPM_ELEMENTO.CAMPODESCRIPTIVOSizeP   TDataSourcedsCaracteristicasElementoDataSetqCaracteristicasElementoLeftPTop5  TQuery
qSeccionesCachedUpdates	DatabaseNameBaseDato
DataSource	dsFormatoSQL.Strings$SELECT * FROM HVE_SECCIONFORMATO SF -WHERE SF.CODIGOFORMATOMTTO=:CODIGOFORMATOMTTO Left� Top	ParamDataDataTypeftFloatNameCODIGOFORMATOMTTO	ParamType	ptUnknown   TFloatFieldqSeccionesCODIGOSECCIONFORMATO	FieldNameCODIGOSECCIONFORMATOOrigin'HVE_SECCIONFORMATO.CODIGOSECCIONFORMATO  TFloatFieldqSeccionesCODIGOFORMATOMTTO	FieldNameCODIGOFORMATOMTTOOrigin$HVE_SECCIONFORMATO.CODIGOFORMATOMTTO  TStringFieldqSeccionesNOMBRESECCIONFORMATO	FieldNameNOMBRESECCIONFORMATOOrigin'HVE_SECCIONFORMATO.NOMBRESECCIONFORMATOSizeP  TFloatField#qSeccionesCONSECUTIVOSECCIONFORMATO	FieldNameCONSECUTIVOSECCIONFORMATOOrigin,HVE_SECCIONFORMATO.CONSECUTIVOSECCIONFORMATO   TDataSourcedsSeccionesDataSet
qSeccionesLeft� TopH  TQueryqMedidasCachedUpdates	DatabaseNameBaseDato
DataSourcedsSeccionesSQL.StringsSELECT * FROM HVE_COLUMNAMEDIDA0WHERE CODIGOSECCIONFORMATO=:CODIGOSECCIONFORMATO Left� Top	ParamDataDataTypeftFloatNameCODIGOSECCIONFORMATO	ParamType	ptUnknown   TFloatFieldqMedidasCODIGOCOLUMNAMEDIDA	FieldNameCODIGOCOLUMNAMEDIDAOrigin%HVE_COLUMNAMEDIDA.CODIGOCOLUMNAMEDIDA  TStringFieldqMedidasNOMBRECOLUMNAMEDIDA	FieldNameNOMBRECOLUMNAMEDIDAOrigin%HVE_COLUMNAMEDIDA.NOMBRECOLUMNAMEDIDASizeP  TStringFieldqMedidasCODIGOTIPOCOLUMNAMEDIDA	FieldNameCODIGOTIPOCOLUMNAMEDIDAOrigin)HVE_COLUMNAMEDIDA.CODIGOTIPOCOLUMNAMEDIDASize  TStringFieldqMedidasTIPODATO	FieldNameTIPODATOOriginHVE_COLUMNAMEDIDA.TIPODATOSize  TFloatField qMedidasCONSECUTIVOMEDIDASECCION	FieldNameCONSECUTIVOMEDIDASECCIONOrigin*HVE_COLUMNAMEDIDA.CONSECUTIVOMEDIDASECCION  TFloatFieldqMedidasCODIGOUNIDADMEDIDAMTTO	FieldNameCODIGOUNIDADMEDIDAMTTOOrigin(HVE_COLUMNAMEDIDA.CODIGOUNIDADMEDIDAMTTO  
TBlobFieldqMedidasFORMULA	FieldNameFORMULAOriginHVE_COLUMNAMEDIDA.FORMULABlobTypeftBlobSize  TStringFieldqMedidasVALORES	FieldNameVALORESOriginHVE_COLUMNAMEDIDA.VALORESSize  TFloatFieldqMedidasCODIGOTIPOVALOR	FieldNameCODIGOTIPOVALOROrigin!HVE_COLUMNAMEDIDA.CODIGOTIPOVALOR  TFloatFieldqMedidasCODIGOSECCIONFORMATO	FieldNameCODIGOSECCIONFORMATOOrigin&HVE_COLUMNAMEDIDA.CODIGOSECCIONFORMATO   TDataSource	dsMedidasDataSetqMedidasLeft� TopH  TQueryqValoresCachedUpdates	DatabaseNameBaseDato
DataSource	dsMedidasSQL.StringsSELECT * FROM HVE_VALORES&WHERE CODIGOTIPOVALOR=:CODIGOTIPOVALOR Left� Top	ParamDataDataType	ftIntegerNameCODIGOTIPOVALOR	ParamType	ptUnknown   TFloatFieldqValoresCODIGOVALOR	FieldNameCODIGOVALOROriginHVE_VALORES.CODIGOVALOR  TStringFieldqValoresVALOR	FieldNameVALOROriginHVE_VALORES.VALORSize2  TFloatFieldqValoresCODIGOTIPOVALOR	FieldNameCODIGOTIPOVALOROriginHVE_VALORES.CODIGOTIPOVALOR   TDataSource	dsValoresDataSetqValoresLeft� TopH  TQueryqValoresMedidasCachedUpdates	AfterInsertqValoresMedidasAfterInsert	AfterPostqValoresMedidasAfterPostAfterDeleteqValoresMedidasAfterDeleteDatabaseNameBaseDatoSQL.StringsSelect * from hve_valoresmedidawhere codigovaloresmedida=-1 UpdateObjectupdValoresMedidasLeftTopx TFloatField"qValoresMedidasCODIGOVALORESMEDIDA	FieldNameCODIGOVALORESMEDIDAOrigin%HVE_VALORESMEDIDA.CODIGOVALORESMEDIDA  TFloatField"qValoresMedidasCODIGOCOLUMNAMEDIDA	FieldNameCODIGOCOLUMNAMEDIDAOrigin%HVE_VALORESMEDIDA.CODIGOCOLUMNAMEDIDA  TFloatFieldqValoresMedidasCODIGOVALOR	FieldNameCODIGOVALOROriginHVE_VALORESMEDIDA.CODIGOVALOR   TDataSourcedsValoresMedidasDataSetqValoresMedidasLeftTop�  
TUpdateSQLupdValoresMedidasModifySQL.Stringsupdate hve_valoresmedidaset-  CODIGOVALORESMEDIDA = :CODIGOVALORESMEDIDA,-  CODIGOCOLUMNAMEDIDA = :CODIGOCOLUMNAMEDIDA,  CODIGOVALOR = :CODIGOVALORwhere0  CODIGOVALORESMEDIDA = :OLD_CODIGOVALORESMEDIDA InsertSQL.Stringsinsert into hve_valoresmedida9  (CODIGOVALORESMEDIDA, CODIGOCOLUMNAMEDIDA, CODIGOVALOR)values<  (:CODIGOVALORESMEDIDA, :CODIGOCOLUMNAMEDIDA, :CODIGOVALOR) DeleteSQL.Stringsdelete from hve_valoresmedidawhere0  CODIGOVALORESMEDIDA = :OLD_CODIGOVALORESMEDIDA LeftTop�   