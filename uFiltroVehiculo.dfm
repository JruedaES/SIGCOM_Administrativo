ÿ
 TFFILTROVEHICULO 0  TPF0TFFiltroVehiculoFFiltroVehiculoLeftTopÖ WidthÔ HeightÝ BorderStylebsSizeToolWinCaptionFiltro VehiculoColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Heightõ	Font.NameMS Sans Serif
Font.Style OldCreateOrderPositionpoDesktopCenterOnClose	FormCloseOnCreate
FormCreate	OnDestroyFormDestroy
OnKeyPressFormKeyPressPixelsPerInch`
TextHeight TPanelPanel1Left Top WidthÌ Height AlignalClientTabOrder  TLabelLabel1LeftTopWidthGHeightCaptionPlaca Vehiculo  TLabelLabel2LeftTop6WidthCHeightCaptionTipo Vehículo  TLabelLabel3LeftTopjWidth2HeightCaptionPropietario  TDBEditDBEdit1LeftTopWidth¸ HeightCharCaseecUpperCase	DataFieldcodigovehiculo
DataSourceDataSource1TabOrder 
OnKeyPressFormKeyPress  TDBLookupComboBoxDBLookupComboBox1LeftTopGWidth¶ Height	DataFieldCodigoTipoVehiculo
DataSourceDataSource1KeyFieldCODIGOTIPOVEHICULO	ListFieldNOMBRETIPOVEHICULO
ListSourcedsTipoVehiculoTabOrder  TDBLookupComboBoxDBLookupComboBox2LeftTop Width¶ Height	DataFieldCodigoPropietario
DataSourceDataSource1KeyFieldCODIGOPROPIETARIO	ListFieldNOMBREPROPIETARIO
ListSourcedsPropietarioTabOrder   TPanelPanel2Left Top WidthÌ HeightAlignalBottomCaptionPanel2TabOrder TPanelPanel3LeftTopWidth¹ HeightAlignalRight
BevelOuterbvNoneTabOrder  TBitBtnBitBtnAnularFiltroLeft TopWidthHeightModalResultTabOrder OnClickBitBtnAnularFiltroClick
Glyph.Data
ò   î   BMî       v   (               x                                     ÀÀÀ   ÿ  ÿ   ÿÿ ÿ   ÿ ÿ ÿÿ  ÿÿÿ   `ii	øÿ    	  TBitBtnBitBtnFiltrarLeft TopWidthHeightModalResultTabOrderOnClickBitBtnFiltrarClick
Glyph.Data
ò   î   BMî       v   (               x                                     ÀÀÀ   ÿ  ÿ   ÿÿ ÿ   ÿ ÿ ÿÿ  ÿÿÿ   `hh`ffoø`fÿÿf          TDataSourceDataSource1DataSettdFiltroVehiculoLeftðTop   
tdMemTabletdFiltroVehiculo	FieldDefsNameNOMBRE1DataTypeftStringSize NameNOMBRE2DataTypeftStringSize NameNOMBRE3DataTypeftStringSize NameCODIGOEMPLEADODataTypeftFloat NameCODIGOADMINISTRATIVODataTypeftStringSize  	StoreDefs		TableNameEmpleadoTempLeftðTop` TStringFieldtdFiltroVehiculocodigovehiculo	FieldNamecodigovehiculoSize
  TIntegerField"tdFiltroVehiculoCodigoTipoVehiculo	FieldNameCodigoTipoVehiculo  TIntegerField!tdFiltroVehiculoCodigoPropietario	FieldNameCodigoPropietario   TdMenuArboldMenuArbol1	OwnerDraw	DatabaseNameBaseDato	TableNameAdministrativo
TableTitleMetadataAdministrativoFiltroInicial(Nivel = 1)FieldsTableNamerCODIGO=CODIGOARBOL, ID=CODIGOADMINISTRATIVO, CODIGONIVEL=NOMBRECATEGORIA, NOMBRE=NOMBREADMINISTRATIVO, NIVEL=NIVELFieldsTableTitlegIDNIVEL=CODIGONIVEL, NIVEL=NIVELADMINISTRATIVO, CAMPO=CAMPOADMINISTRATIVO, DESCRIPCION=DESCRIPCIONCAMPOLeftUTop   TQueryqPropietarioActive	DatabaseNameBaseDatoSQL.Stringsselect * from propietario LeftPTopØ   TQueryqTipoVehiculoActive	DatabaseNameBaseDatoSQL.Stringsselect * from tipovehiculo Leftð Toph  TDataSourcedsPropietarioDataSetqPropietarioLeftPTop  TDataSourcedsTipoVehiculoDataSetqTipoVehiculoLeftð Top    