˙
 TFLAMPARAAPODT 0ğ  TPF0TfLamparaAPOdtfLamparaAPOdtLeftTop Width÷Height_CaptionLuminarias asociadasColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightġ	Font.NameMS Sans Serif
Font.Style OldCreateOrderPixelsPerInch`
TextHeight TDBGridDBGrid1Left Top WidthïHeightAlignalClient
DataSourcedsLamparaAPOptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgConfirmDeletedgCancelOnExitdgMultiSelect TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.HeightġTitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNameCODIGOALUMBRADOPUBLICOTitle.AlignmenttaCenterVisible	 Expanded	FieldNamePINTADOAPOYOTitle.AlignmenttaCenterVisible	 Expanded	FieldNameCODIGOAPOYOTitle.AlignmenttaCenterVisible	 Expanded	FieldNameCODIGONODOBTTitle.AlignmenttaCenterVisible	    TPanelPanel1Left TopWidthïHeight.AlignalBottomCaptionPanel1TabOrder TPanelPanel4Leftĥ TopWidth8Height,AlignalRight
BevelOuterbvNoneCaptionPanel4TabOrder  TBitBtn
bbCancelarLeftà TopWidthKHeightCaption	&CancelarTabOrder KindbkCancel  TBitBtn	bbAceptarLeft TopWidthKHeightCaption&AceptarModalResultTabOrder
Glyph.Data
â  Ŝ  BMŜ      v   (   $            h                                   ÀÀÀ    ˙  ˙   ˙˙ ˙   ˙ ˙ ˙˙  ˙˙˙ 333333333333333333  333333333333ó33333  334C3333333833333  33B$33333338ó3333  34""C333338333333  3B""$33333338ó333  4"*""C3338ó8ó3333  2"£˘"C3338ó3333  :*3:"$3338ĝ38ó8ó33  3£33˘"C33333333  3333:"$3333338ó8ó3  33333˘"C33333333  33333:"$3333338ó8ó  333333˘"C3333333  333333:"C3333338ó  3333333˘#3333333  3333333:3333333383  333333333333333333  	NumGlyphs    TQuery
qLamparaAPDatabaseNameBaseDatoSQL.Strings@SELECT A.PINTADOAPOYO,AP.CODIGONODOBT,AP.CODIGOALUMBRADOPUBLICO,UAP.CODIGOAPOYO,AP.CODIGOUSOALUMBRADO,AP.R,AP.S,AP.T,AP.N,OA.CODIGOODT,OA.CONSECUTIVO,VAP.CODIGOESTRUCTURA,AP.CODIGOOBSERVACION,AP.CODIGO_CUENTA CODIGOCUENTA,AP.CODIGOACTUAL,FROM APOYO A,ALUMBRADOPUBLICO AP,ODTAPOYO OA$WHERE OA.PINTADOAPOYO=A.PINTADOAPOYO AND AP.CODIGOAPOYO=A.CODIGOAPOYOAND OA.PINTADOAPOYO<>00AND OA.CODIGOODT=:CODIGOODTAND OA.CONSECUTIVO=:CONSECUTIVO$AND AP.CODIGOALUMBRADOPUBLICO NOT IN*(SELECT DISTINCT AP.CODIGOALUMBRADOPUBLICO9FROM APOYO A,ALUMBRADOPUBLICO AP,ODTAPOYO OA,AP_EVENTO EA$WHERE OA.PINTADOAPOYO=A.PINTADOAPOYO AND AP.CODIGOAPOYO=A.CODIGOAPOYOAND OA.CODIGOODT=:CODIGOODTAND OA.CONSECUTIVO=:CONSECUTIVO7AND EA.CODIGOALUMBRADOPUBLICO=AP.CODIGOALUMBRADOPUBLICOAND EA.CODIGOODT=:CODIGOODT AND EA.CONSECUTIVO=:CONSECUTIVO),ORDER BY OA.PINTADOAPOYO,AP.CODIGONODOBT ASC Left Top	ParamDataDataTypeftFloatName	CODIGOODT	ParamType	ptUnknown DataType	ftIntegerNameCONSECUTIVO	ParamType	ptUnknown DataTypeftFloatName	CODIGOODT	ParamType	ptUnknown DataType	ftIntegerNameCONSECUTIVO	ParamType	ptUnknown DataTypeftFloatName	CODIGOODT	ParamType	ptUnknown DataType	ftIntegerNameCONSECUTIVO	ParamType	ptUnknown   TStringFieldqLamparaAPPINTADOAPOYO	FieldNamePINTADOAPOYOOriginAPOYO.PINTADOAPOYOSize  TStringFieldqLamparaAPCODIGONODOBT	FieldNameCODIGONODOBTOriginALUMBRADOPUBLICO.CODIGONODOBTSize  TFloatField qLamparaAPCODIGOALUMBRADOPUBLICO	FieldNameCODIGOALUMBRADOPUBLICOOrigin'ALUMBRADOPUBLICO.CODIGOALUMBRADOPUBLICO  TFloatFieldqLamparaAPCODIGOAPOYO	FieldNameCODIGOAPOYOOriginALUMBRADOPUBLICO.CODIGOAPOYO  TStringFieldqLamparaAPCODIGOUSOALUMBRADO	FieldNameCODIGOUSOALUMBRADOOrigin#ALUMBRADOPUBLICO.CODIGOUSOALUMBRADOSize  TStringFieldqLamparaAPR	FieldNameROriginALUMBRADOPUBLICO.RSize  TStringFieldqLamparaAPS	FieldNameSOriginALUMBRADOPUBLICO.SSize  TStringFieldqLamparaAPT	FieldNameTOriginALUMBRADOPUBLICO.TSize  TStringFieldqLamparaAPN	FieldNameNOriginALUMBRADOPUBLICO.NSize  TFloatFieldqLamparaAPCODIGOESTRUCTURA	FieldNameCODIGOESTRUCTURAOrigin!ALUMBRADOPUBLICO.CODIGOESTRUCTURA  TFloatFieldqLamparaAPCODIGOOBSERVACION	FieldNameCODIGOOBSERVACIONOrigin"ALUMBRADOPUBLICO.CODIGOOBSERVACION  TStringFieldqLamparaAPCODIGOACTUAL	FieldNameCODIGOACTUALSize  TFloatFieldqLamparaAPCODIGOODT	FieldName	CODIGOODT  TFloatFieldqLamparaAPCONSECUTIVO	FieldNameCONSECUTIVO  TFloatFieldqLamparaAPCODIGOCUENTA	FieldNameCODIGOCUENTA   TDataSourcedsLamparaAPDataSet
qLamparaAPLeft TopH   