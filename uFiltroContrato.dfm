˙
 TFFILTROCONTRATO 0ò  TPF0TFFiltroContratoFFiltroContratoLeftËTopĜ BorderStylebsToolWindowCaptionFiltro ContratosClientHeightż ClientWidth2Color	clBtnFaceFont.CharsetANSI_CHARSET
Font.ColorclWindowTextFont.Heightġ	Font.NameTahoma
Font.Style 	FormStylefsStayOnTopOldCreateOrderOnClose	FormCloseOnCreate
FormCreate	OnDestroyFormDestroy
OnKeyPressFormKeyPressPixelsPerInch`
TextHeight TPanelPanel1Left Top Width2HeightĦ AlignalClientTabOrder  TLabelLabel9LeftTopAWidthHeightCaptionCIG  TDBTextDBTGeograficoLeftXTop;WidthÍ Height:ColorclSilver	DataFieldNombreGeografico
DataSourcedsGeograficoFont.CharsetANSI_CHARSET
Font.ColorclNavyFont.Heightô	Font.NameTahoma
Font.StylefsBold ParentColor
ParentFontWordWrap	  TSpeedButtonsbBuscarCIGLeftTop[WidthDHeightHint
Editar CIGCaptionCIGFlat	Font.CharsetANSI_CHARSET
Font.ColorclNavyFont.Heightġ	Font.NameTahoma
Font.StylefsBold 	NumGlyphs
ParentFontParentShowHintShowHint	OnClicksbBuscarCIGClick  TDBEditDBEdit1LeftTopWidth9HeightCharCaseecUpperCase	DataFieldCODIGOINTERVENTOR
DataSourcedsFiltroContratoTabOrder 
OnKeyPressFormKeyPress  TDBLookupComboBoxDBLookupComboBox1LeftPTop~WidthÑ Height	DataFieldCODIGOINTERVENTOR
DataSourcedsFiltroContratoKeyFieldCODIGOEMPLEADO	ListFieldNOMBREEMPLEADO
ListSource
dsEmpleadoTabOrder  TDBEditdbeCIGLeft(Top>Width)Height	DataFieldCODIGOGEOGRAFICO
DataSourcedsFiltroContratoTabOrder  TDBRadioGroupOpcionurbanoLeftTopWidthHeight-CaptionOpcion urbanoColumns	DataFieldURBANO
DataSourcedsFiltroContratoItems.Strings&Urbano&Rural TabOrderValues.StringsSN    TPanelPanel2Left TopĦ Width2HeightAlignalBottomTabOrder TPanelPanel3LeftxTopWidthı HeightAlignalRight
BevelOuterbvNoneTabOrder  TBitBtnBitBtnAnularFiltroLeft TopWidthHeightModalResultTabOrder OnClickBitBtnAnularFiltroClick
Glyph.Data
ò   î   BMî       v   (               x                                     ÀÀÀ   ˙  ˙   ˙˙ ˙   ˙ ˙ ˙˙  ˙˙˙   `ii	ĝ˙    	  TBitBtnBitBtnFiltrarLeft TopWidthHeightModalResultTabOrderOnClickBitBtnFiltrarClick
Glyph.Data
ò   î   BMî       v   (               x                                     ÀÀÀ   ˙  ˙   ˙˙ ˙   ˙ ˙ ˙˙  ˙˙˙   `hh`ffoĝ`f˙˙f          TDataSourcedsFiltroContratoDataSettdFiltroContratoLeftTop;  
tdMemTabletdFiltroContrato	FieldDefsNameNOMBRE1DataTypeftStringSize NameNOMBRE2DataTypeftStringSize NameNOMBRE3DataTypeftStringSize NameCODIGOEMPLEADODataTypeftFloat NameCODIGOADMINISTRATIVODataTypeftStringSize  	StoreDefs		TableNameEmpleadoTempLeftTop
 TStringFieldtdFiltroContratoURBANO	FieldNameURBANOSize  TFloatFieldtdFiltroContratoCIG	FieldNameCIG  TIntegerField!tdFiltroContratoCODIGOINTERVENTOR	FieldNameCODIGOINTERVENTOR   TdMenuArboldMenuArbol1	OwnerDraw	DatabaseNameBaseDato	TableNameAdministrativo
TableTitleMetadataAdministrativoFiltroInicial(Nivel = 3)FieldsTableNamerCODIGO=CODIGOARBOL, ID=CODIGOADMINISTRATIVO, CODIGONIVEL=NOMBRECATEGORIA, NOMBRE=NOMBREADMINISTRATIVO, NIVEL=NIVELFieldsTableTitlegIDNIVEL=CODIGONIVEL, NIVEL=NIVELADMINISTRATIVO, CAMPO=CAMPOADMINISTRATIVO, DESCRIPCION=DESCRIPCIONCAMPOLeftDTop  TQueryqGeograficoDatabaseNameBaseDato
DataSourcedsFiltroContratoSQL.Stringsselect nombregeografico where codigogeografico=:cig LeftTop	ParamDataDataTypeftFloatNameCIG	ParamType	ptUnknown    TDataSourcedsGeograficoDataSetqGeograficoLeftTop;  TQuery	qEmpleadoDatabaseNameBaseDato
DataSourcedsFiltroContratoSQL.Strings%select nombreempleado, codigoempleadofrom empleado0where codigoadministrativo=:codigoadministrativo1AND ((estado IN ('AC','LC')) OR (estado IS NULL)) LeftÑTop
	ParamDataDataType	ftUnknownNamecodigoadministrativo	ParamType	ptUnknown    TDataSource
dsEmpleadoDataSet	qEmpleadoLeftÒTop;   