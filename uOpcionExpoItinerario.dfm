?
 TFOPCIONEXPOITINERARIO 0?  TPF0TfOpcionExpoItinerariofOpcionExpoItinerarioLeft?Top? BorderIconsbiSystemMenu BorderStylebsSingleCaptionCambiar Lector del ItinerarioClientHeightClientWidth?Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameMS Sans Serif
Font.Style OldCreateOrderOnCloseQueryFormCloseQueryOnCreate
FormCreateOnShowFormShowPixelsPerInch`
TextHeight TPanelPanel1Left Top? Width?Height)AlignalBottom
BevelOuterbvSpaceTabOrder  TBitBtnBitBtn1Left? TopWidth? HeightAnchorsakRightakBottom CaptionAsignar y ExportarTabOrder OnClickBitBtn1ClickKindbkOK  TBitBtnBitBtn2LeftTopWidthZHeightAnchorsakRightakBottom CaptionCancelarTabOrderOnClickBitBtn2ClickKindbkCancel   TPanelPanel2Left Top Width?Height? AlignalClient
BevelOuterbvNoneTabOrder 	TGroupBox	GroupBox1LeftTopWidthqHeightyCaptionNuevo LectorTabOrder  TLabellbCIALeft;Top1Width,Height@AutoSizeCaptionlbCIAColorclSilverFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height?	Font.NameMS Sans Serif
Font.Style ParentColor
ParentFontWordWrap	  TDBEditDBEdit2Left
TopWidth)Height	DataFieldCODIGOGRUPOTRABAJO
DataSourcedsGrupoTrabajoTabOrder   TDBLookupComboBoxdblcbGTLeft:TopWidth/HeightKeyFieldCODIGOGRUPOTRABAJO	ListFieldNOMBREGRUPOTRABAJO
ListSourcedsGrupoTrabajoTabOrder  TDBEditdbeCIATagLeft
Top0Width)HeightColorclSilver	DataFieldCODIGOADMINISTRATIVO
DataSourcedsGrupoTrabajoFont.CharsetDEFAULT_CHARSET
Font.ColorclNavyFont.Height?	Font.NameMS Sans Serif
Font.Style 
ParentFontReadOnly	TabOrder   TRadioGroup
rgOpcionesLeftTop? WidthqHeight[CaptionOpciones de Exportaci?nItems.StringsEl Itinerario totalEl Itinerario faltante#El Itinerario a partir del Cliente: TabOrderOnClickrgOpcionesClick  TEditedCodClienteLeft? Top? Width? HeightEnabledTabOrder
OnKeyPressedCodClienteKeyPress   TQueryqGrupoTrabajoAfterScrollqGrupoTrabajoAfterScrollDatabaseNameBaseDatoSQL.Strings(SELECT DISTINCT GT.CODIGOADMINISTRATIVO,A.NOMBREADMINISTRATIVO,A.NOMBRECATEGORIA,GT.CODIGOGRUPOTRABAJO, GT.NOMBREGRUPOTRABAJO, CGT.CODIGOUSUARIODFROM GRUPOTRABAJO GT, COORDINACIONGRUPOTRABAJO CGT, ADMINISTRATIVO ALWHERE GT.CODIGOCOORDINACIONGRUPOTRABAJO = CGT.CODIGOCOORDINACIONGRUPOTRABAJO4AND GT.CODIGOADMINISTRATIVO = A.CODIGOADMINISTRATIVOJAND NOT ((GT.CODIGOADMINISTRATIVO= :CIA) AND (GT.CODIGOGRUPOTRABAJO= :GT))AND GT.ACTIVO = 'S'ORDER BY GT.NOMBREGRUPOTRABAJO Left?Top? 	ParamDataDataTypeftFloatNameCIA	ParamTypeptInput DataTypeftFloatNameGT	ParamTypeptInput   TFloatFieldqGrupoTrabajoCODIGOGRUPOTRABAJO	FieldNameCODIGOGRUPOTRABAJOOriginGRUPOTRABAJO.CODIGOGRUPOTRABAJO  TFloatField!qGrupoTrabajoCODIGOADMINISTRATIVO	FieldNameCODIGOADMINISTRATIVOOrigin!GRUPOTRABAJO.CODIGOADMINISTRATIVO  TStringFieldqGrupoTrabajoNOMBREGRUPOTRABAJO	FieldNameNOMBREGRUPOTRABAJOOriginGRUPOTRABAJO.NOMBREGRUPOTRABAJOSize  TFloatFieldqGrupoTrabajoCODIGOUSUARIO	FieldNameCODIGOUSUARIOOrigin&COORDINACIONGRUPOTRABAJO.CODIGOUSUARIO  TStringField!qGrupoTrabajoNOMBREADMINISTRATIVO	FieldNameNOMBREADMINISTRATIVOOrigin#ADMINISTRATIVO.NOMBREADMINISTRATIVOSize?   TStringFieldqGrupoTrabajoNOMBRECATEGORIA	FieldNameNOMBRECATEGORIAOriginADMINISTRATIVO.NOMBRECATEGORIASizeP   TDataSourcedsGrupoTrabajoDataSetqGrupoTrabajoLeft?Topa   