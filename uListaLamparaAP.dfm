�
 TFLISTALAMPARAAP 0U  TPF0TfListaLamparaApfListaLamparaApLeft� Top� Width�Height_CaptionLista LuminariasColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPixelsPerInch`
TextHeight TDBGridDBGrid1Left Top Width�HeightAlignalClient
DataSourcedsLamparaAPOptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgConfirmDeletedgCancelOnExitdgMultiSelect TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNameCODIGOALUMBRADOPUBLICOTitle.AlignmenttaCenterTitle.Caption	C�digo APVisible	 Expanded	FieldNamePINTADOAPOYOTitle.AlignmenttaCenterTitle.CaptionPintado apoyoWidthVVisible	 Expanded	FieldNameCODIGOAPOYOTitle.AlignmenttaCenterTitle.CaptionC�digo apoyoWidthWVisible	 Expanded	FieldNameCODIGONODOBTTitle.AlignmenttaCenterTitle.CaptionNodo btWidth3Visible	    TPanelPanel1Left TopWidth�Height.AlignalBottomCaptionPanel1TabOrder TPanelPanel4LeftdTopWidth8Height,AlignalRight
BevelOuterbvNoneCaptionPanel4TabOrder  TBitBtn
bbCancelarLeft� TopWidthKHeightCaption	&CancelarTabOrder KindbkCancel  TBitBtn	bbAceptarLeft� TopWidthKHeightCaption&AceptarModalResultTabOrder
Glyph.Data
�  �  BM�      v   (   $            h                      �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  333333333333�33333  334C33333338�33333  33B$3333333�8�3333  34""C33333833�3333  3B""$33333�338�333  4"*""C3338�8�3�333  2"��"C3338�3�333  :*3:"$3338�38�8�33  3�33�"C333�33�3�33  3333:"$3333338�8�3  33333�"C333333�3�3  33333:"$3333338�8�  333333�"C333333�3�  333333:"C3333338�  3333333�#3333333��  3333333:3333333383  333333333333333333  	NumGlyphs    TQuery
qLamparaAPActive	DatabaseNameBaseDatoSQL.Strings4SELECT A.PINTADOAPOYO,AP.CODIGONODOBT,A.CODIGOAPOYO,)AP.CODIGOALUMBRADOPUBLICO,AP.CODIGOACTUAL FROM APOYO A,ALUMBRADOPUBLICO AP"WHERE AP.CODIGOAPOYO=A.CODIGOAPOYO AND A.PINTADOAPOYO=:PINTADOAPOYO Left� Top	ParamDataDataTypeftFloatNamePINTADOAPOYO	ParamType	ptUnknown   TStringFieldqLamparaAPPINTADOAPOYO	FieldNamePINTADOAPOYOOriginAPOYO.PINTADOAPOYOSize  TStringFieldqLamparaAPCODIGONODOBT	FieldNameCODIGONODOBTOriginALUMBRADOPUBLICO.CODIGONODOBTSize  TFloatField qLamparaAPCODIGOALUMBRADOPUBLICO	FieldNameCODIGOALUMBRADOPUBLICOOrigin'ALUMBRADOPUBLICO.CODIGOALUMBRADOPUBLICO  TStringFieldqLamparaAPCODIGOACTUAL	FieldNameCODIGOACTUALOriginALUMBRADOPUBLICO.CODIGOACTUALSize  TFloatFieldqLamparaAPCODIGOAPOYO	FieldNameCODIGOAPOYOOriginAPOYO.CODIGOAPOYO   TDataSourcedsLamparaAPDataSet
qLamparaAPLeft� TopH   