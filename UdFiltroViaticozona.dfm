ÿ
 TFDFILTROVIATICOZONA 0¥  TPF0TfdFiltroviaticoZonafdFiltroviaticoZonaLeftZTopú WidthHeightâ CaptionFiltro Viático ZonasColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style OldCreateOrderOnCreate
FormCreatePixelsPerInch`
TextHeight TPanelPanel1Left Top WidthyHeight¢ AlignalClientTabOrder  TLabelLabel1LeftTopWidth;HeightCaptionZona Origen  TLabelLabel2LeftTop=Width@HeightCaptionZona Destino  TLabelLabel3LeftTopZWidthlHeightCaptionFecha Vigencia Desde  TLabelLabel4LeftTopwWidthiHeightCaptionFecha Vigencia Hasta  TDBEditDBEdit1LeftaTopWidthAHeight	DataFieldCODIGOZONAORIGEN
DataSourceDSTdMemTable1TabOrder   TDBLookupComboBoxDBLookupComboBox1Left§ TopWidthÇ Height	DataFieldCODIGOZONAORIGEN
DataSourceDSTdMemTable1KeyField
CODIGOZONA	ListField
NOMBREZONA
ListSourcedsZonaOrigenTabOrder  TDBEditDBEdit2LeftaTop;WidthAHeight	DataFieldCODIGOZONADESTINO
DataSourceDSTdMemTable1TabOrder  TDBLookupComboBoxDBLookupComboBox2Left§ Top;WidthÇ Height	DataFieldCODIGOZONADESTINO
DataSourceDSTdMemTable1KeyField
CODIGOZONA	ListField
NOMBREZONA
ListSourcedsZonaDestinoTabOrder  TDBDateEditDBDateEdit1Left¨ TopYWidthÅ Height	DataFieldVIGENCIADESDE
DataSourceDSTdMemTable1	NumGlyphsTabOrder  TDBDateEditDBDateEdit2Left¨ TopsWidthÅ Height	DataFieldVIGENCIAHASTA
DataSourceDSTdMemTable1	NumGlyphsTabOrder   TPanelPanel2Left Top¢ WidthyHeightAlignalBottomTabOrder TPanelPanel3LeftTopWidtheHeightAlignalRight
BevelOuterbvNoneTabOrder  TBitBtnbitBFiltrarLeft
TopWidthHeightModalResultTabOrder OnClickbitBFiltrarClick
Glyph.Data
ò   î   BMî       v   (               x                                     ÀÀÀ   ÿ  ÿ   ÿÿ ÿ   ÿ ÿ ÿÿ  ÿÿÿ   `hh`ffoø`fÿÿf        TBitBtnbitBAnularFiltroLeft*TopWidthHeightModalResultTabOrder
Glyph.Data
ò   î   BMî       v   (               x                                     ÀÀÀ   ÿ  ÿ   ÿÿ ÿ   ÿ ÿ ÿÿ  ÿÿÿ   `ii	øÿ    	    TQueryqZonaOrigenDatabaseNameBaseDatoSQL.Strings*select codigozona,nombrezona from zonaessa LeftTop   TQueryqZonaDestinoDatabaseNameBaseDatoSQL.Strings*select codigozona,nombrezona from zonaessa LeftTopX  
tdMemTabletdMemTable1	FieldDefsNameCODIGOADMINISTRATIVODataTypeftFloat NameCANTIDADDataTypeftFloat NameNOMBRECATEGORIADataTypeftStringSizeP NameCODIGOODTHASTADataTypeftFloat NameFECHAEMISIONDESDEDataType
ftDateTime NameFECHAEMISIONHASTADataType
ftDateTime NameCODIGOODTDESDEDataTypeftFloat  	StoreDefs	Left0Top  TIntegerFieldtdMemTable1CODIZONAORIGEN	FieldNameCODIGOZONAORIGEN  TIntegerFieldtdMemTable1CODIGOZONADESTINO	FieldNameCODIGOZONADESTINO  
TDateFieldtdMemTable1VIGENCIADESDE	FieldNameVIGENCIADESDE  
TDateFieldtdMemTable1VIGENCIAHASTA	FieldNameVIGENCIAHASTA   TDataSourceDSTdMemTable1DataSettdMemTable1Left Top   TDataSourcedsZonaOrigenDataSetqZonaOrigenLeftØTop   TDataSourcedsZonaDestinoDataSetqZonaDestinoLeftØTopX   