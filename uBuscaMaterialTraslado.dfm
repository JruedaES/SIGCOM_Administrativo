�
 TFBUSCAMATERIALTRASLADO 0�  TPF0TfBuscaMaterialTrasladofBuscaMaterialTrasladoLeftgTop*WidthgHeight(BorderIconsbiSystemMenu CaptionBuscar MaterialColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderOnCreate
FormCreatePixelsPerInch`
TextHeight TPanelPanel2Left Top WidthWHeight� AlignalClientTabOrder  TDBGridDBGridBuscarMaterialLeftTopWidthUHeight� AlignalClient
DataSourcedsMaterialcuadrillaOptionsdgTitlesdgIndicatordgColumnResize
dgColLines
dgRowLinesdgTabsdgRowSelectdgConfirmDeletedgCancelOnExitdgMultiSelect TabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style ColumnsExpanded	FieldNameCODIGOMATERIALTitle.CaptionC�digoVisible	 Expanded	FieldNameNOMBREMATERIALTitle.AlignmenttaCenterTitle.CaptionNombreWidth%Visible	 Expanded	FieldNameCANTIDADACTUALTitle.CaptionCantidad NuevaVisible	 Expanded	FieldNameCANTIDADACTUALDESMANTELADABUENTitle.CaptionCantidad DesmanteladaVisible	     TPanelPanel1Left Top� WidthWHeight"AlignalBottomTabOrder TBitBtnBitBtn2Left�TopWidthOHeightAnchorsakRightakBottom Caption&AsignarDefault	ModalResultTabOrder 
Glyph.Data
�  �  BM�      6  (   $            �                      �  �   �� �   � � ��  ��� ��� �ʦ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ��� ��� ���   �  �   �� �   � � ��  ��� �����������������������������������������������������������������������������	NumGlyphs  TBitBtnBitBtnCerrarLeftTopWidthOHeightAnchorsakRightakBottom Cancel	Caption&CerrarModalResultTabOrder
Glyph.Data
�  �  BM�      6  (   $            �                      �  �   �� �   � � ��  ��� ��� �ʦ                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 ��� ��� ���   �  �   �� �   � � ��  ��� ������������������������  ����������������������  ������������������� ��������������� ������������� �������������� ������������� �������������� ������������� �������������� ������������� �������������� �����������������������������������      ������� ���� ��������      ��������	NumGlyphs   TQueryqMaterialcuadrillaCachedUpdates	DatabaseNameBaseDatoSQL.StringsLselect s.codigomaterial, s.cantidadactual, s.cantidadactualdesmanteladabuen,*m.nombrematerial from stockgrupotrabajo s,MATERIALESSA m.where s.codigogrupotrabajo=:Codigogrupotrabajo2and s.codigoadministrativo= :CodigoAdministrativo 'and s.codigomaterial = m.codigomaterialorder by codigomaterial LeftTop� 	ParamDataDataTypeftFloatNameCodigogrupotrabajo	ParamType	ptUnknown DataTypeftFloatNameCodigoAdministrativo	ParamType	ptUnknown   TFloatField qMaterialcuadrillaCODIGOMATERIAL	FieldNameCODIGOMATERIALOrigin STOCKGRUPOTRABAJO.CODIGOMATERIAL  TFloatField qMaterialcuadrillaCANTIDADACTUAL	FieldNameCANTIDADACTUALOrigin STOCKGRUPOTRABAJO.CANTIDADACTUAL  TStringField qMaterialcuadrillaNOMBREMATERIAL	FieldNameNOMBREMATERIALOriginMATERIALESSA.NOMBREMATERIALSized  TFloatField0qMaterialcuadrillaCANTIDADACTUALDESMANTELADABUEN	FieldNameCANTIDADACTUALDESMANTELADABUENOrigin0STOCKGRUPOTRABAJO.CANTIDADACTUALDESMANTELADABUEN   TDataSourcedsMaterialcuadrillaDataSetqMaterialcuadrillaLeft}Top�    