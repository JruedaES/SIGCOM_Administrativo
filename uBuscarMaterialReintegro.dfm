�
 TFBUSCARMATERIALREINTEGRO 0�  TPF0TfBuscarMaterialReintegrofBuscarMaterialReintegroLeftPTop� WidthtHeightCaptionMaterial ReintegroColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPixelsPerInch`
TextHeight TDBGridDBGridBuscarMaterialLeft Top WidthlHeight� AlignalClient
DataSource
dsMaterialOptionsdgTitlesdgIndicator
dgColLines
dgRowLinesdgTabsdgRowSelectdgConfirmDeletedgCancelOnExitdgMultiSelect TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNameCODIGOMATERIALTitle.CaptionCodigoWidthIVisible	 Expanded	FieldNameNOMBREMATERIALTitle.CaptionNombreWidth� Visible	 Expanded	FieldNameCANTIDADACTUALTitle.CaptionCantidad NuevaVisible	 Expanded	FieldNameCANTIDADACTUALDESMANTELADABUENTitle.CaptionDesmantelada BuenaVisible	 Expanded	FieldNameCANTIDADACTUALDESMANTELADAMALATitle.CaptionDesmantelada MalaVisible	    TPanelPanel1Left Top� WidthlHeight"AlignalBottomTabOrder TBitBtnBitBtn2Left�TopWidthOHeightCaption&AsignarDefault	ModalResultTabOrder 
Glyph.Data
�  �  BM�      6  (   $            �                      �  �   �� �   � � ��  ��� ��� �ʦ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ��� ��� ���   �  �   �� �   � � ��  ��� �����������������������������������������������������������������������������	NumGlyphs  TBitBtnBitBtnCerrarLeft	TopWidthOHeightCancel	Caption&CerrarModalResultTabOrder
Glyph.Data
�  �  BM�      6  (   $            �                      �  �   �� �   � � ��  ��� ��� �ʦ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ��� ��� ���   �  �   �� �   � � ��  ��� ������������������������  ����������������������  ������������������� ��������������� ������������� �������������� ������������� �������������� ������������� �������������� ������������� �������������� �����������������������������������      ������� ���� ��������      ��������	NumGlyphs   TQuery	qMaterialCachedUpdates	DatabaseNameBaseDatoSQL.Stringsnselect s.codigomaterial, s.cantidadactual, s.cantidadactualdesmanteladabuen, s.cantidadactualdesmanteladamala,*m.nombrematerial from stockgrupotrabajo s,INVENTARIO.MATERIALESSA m.where s.codigogrupotrabajo=:Codigogrupotrabajo2and s.codigoadministrativo= :CodigoAdministrativo 'and s.codigomaterial = m.codigomaterial LeftTop� 	ParamDataDataTypeftFloatNameCodigogrupotrabajo	ParamType	ptUnknown DataTypeftFloatNameCodigoAdministrativo	ParamType	ptUnknown   TFloatFieldqMaterialCODIGOMATERIAL	FieldNameCODIGOMATERIALOrigin STOCKGRUPOTRABAJO.CODIGOMATERIAL  TFloatFieldqMaterialCANTIDADACTUAL	FieldNameCANTIDADACTUALOrigin STOCKGRUPOTRABAJO.CANTIDADACTUAL  TStringFieldqMaterialNOMBREMATERIAL	FieldNameNOMBREMATERIALOriginMATERIALESSA.NOMBREMATERIALSized  TFloatField'qMaterialCANTIDADACTUALDESMANTELADABUEN	FieldNameCANTIDADACTUALDESMANTELADABUENOrigin0STOCKGRUPOTRABAJO.CANTIDADACTUALDESMANTELADABUEN  TFloatField'qMaterialCANTIDADACTUALDESMANTELADAMALA	FieldNameCANTIDADACTUALDESMANTELADAMALAOrigin0STOCKGRUPOTRABAJO.CANTIDADACTUALDESMANTELADAMALA   TDataSource
dsMaterialDataSet	qMaterialLeft}Top�    