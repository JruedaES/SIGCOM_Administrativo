?
 TFMANTENIMIENTOREPROGRAMADO 0"  TPF0TfMantenimientoReprogramadofMantenimientoReprogramadoLeft? Top? Width?Height? AnchorsakLeftakTopakBottom Caption'Motivo Reprogramaci?n de MantenimientosColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameMS Sans Serif
Font.Style OldCreateOrderOnShowFormShowPixelsPerInch`
TextHeight TPanelPanel2Left Top Width?HeightAlignalTop
BevelInnerbvRaised
BevelOuterbvNoneCaption'Motivo Reprogramaci?n de MantenimientosFont.CharsetDEFAULT_CHARSET
Font.ColorclBlackFont.Height?	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder  TPanelPanelPrinicipalLeft TopWidth?Height? AlignalTopTabOrder  TPanelPanelFiltrosLeftTopWidth?Height0AlignalTop
BevelOuterbvNoneTabOrder   	TGroupBox	GroupBox1LeftTopWidth?HeightyColor	clBtnFaceParentColorTabOrder TLabelLabel1LeftTopWidthEHeightCaptionMantenimiento  TLabelLabel2LeftTop@Width HeightCaptionMotivo  TEditeMantenimientoLeftTTopWidtheHeightTabOrder TexteMantenimiento  TDBEdit	dbeMotivoLeftTTop8WidtheHeight	DataFieldMOTIVOREPROGRAMACION
DataSourcedsMantenimientoReprogramadoTabOrder   TPanelPanelHerramientasLeftTop? Width?HeightAlignalBottom
BevelInnerbvRaised
BevelOuterbvNoneTabOrder TSpeedButtonSpeedButton1Left'TopWidthOHeightCaptionACEPTARFlat	Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height?	Font.NameTahoma
Font.StylefsBold 
Glyph.Data
z  v  BMv      v   (                                       ?  ?   ?? ?   ? ? ??   ???   ?  ?   ?? ?   ? ? ??  ??? UUUUUUUUUUUUUUUUUUUUUUUUUUU?UUUUUUYUUUUUUW?UUUUU??UUUUUUww?UUUUU??UUUUUUww?UUUUY??UUUUWwwUUUU???UUUUwww?UUW???UUUWwuww?UUyUY?UUUwuUWw?UUUUUY?UUUUUWwUUUUUU?UUUUUUw?UUUUUY?UUUUUUWw?UUUUUUyUUUUUUw?UUUUUW?UUUUUUWw?UUUUUUY?UUUUUUWwUUUUUUUUUUUUUUUU	NumGlyphs
ParentFontOnClickSpeedButton1Click  TSpeedButtonSpeedButton2Left?TopWidthOHeightCaptionCANCELARFlat	Font.CharsetANSI_CHARSET
Font.ColorclBlackFont.Height?	Font.NameTahoma
Font.StylefsBold 
Glyph.Data
z  v  BMv      v   (                                       ?  ?   ?? ?   ? ? ??   ???   ?  ?   ?? ?   ? ? ??  ??? 33333333333???33339??33333?ww??339????3337w37w?33?333??33w?337?9??339?37w?33w?99?333?37?w?337??3??339?w?w?37?39?339?w?7w?37?33??39?w?3w?7?339?39?w?37w?7?333??9?w?33w?s9?339?937??37w??9?333??37s?33ww33??339?33w????s339????3337w37w33339??333337ww333	NumGlyphs
ParentFont    TQueryqMantenimientoReprogramadoCachedUpdates	AfterInsert%qMantenimientoReprogramadoAfterInsert	AfterPost#qMantenimientoReprogramadoAfterPostAfterDelete%qMantenimientoReprogramadoAfterDeleteDatabaseNameBaseDatoSQL.StringsIselect  codigomttoreprogramado,codigomantenimiento, motivoreprogramacion,fechareprogramacion !from pm_mantenimientoreprogramado.where codigomantenimiento=:codigomantenimiento UpdateObjectupdMantenimientoReprogramadoLeft@Top!	ParamDataDataTypeftFloatNamecodigomantenimiento	ParamType	ptUnknown   TFloatField-qMantenimientoReprogramadoCODIGOMANTENIMIENTO	FieldNameCODIGOMANTENIMIENTOOrigin0PM_MANTENIMIENTOREPROGRAMADO.CODIGOMANTENIMIENTO  TStringField.qMantenimientoReprogramadoMOTIVOREPROGRAMACION	FieldNameMOTIVOREPROGRAMACIONOrigin1PM_MANTENIMIENTOREPROGRAMADO.MOTIVOREPROGRAMACIONSize?   TFloatField0qMantenimientoReprogramadoCODIGOMTTOREPROGRAMADO	FieldNameCODIGOMTTOREPROGRAMADOOrigin3PM_MANTENIMIENTOREPROGRAMADO.CODIGOMTTOREPROGRAMADO  TDateTimeField-qMantenimientoReprogramadoFECHAREPROGRAMACION	FieldNameFECHAREPROGRAMACIONOrigin0PM_MANTENIMIENTOREPROGRAMADO.FECHAREPROGRAMACION   TDataSourcedsMantenimientoReprogramadoDataSetqMantenimientoReprogramadoLeft?TopA  
TUpdateSQLupdMantenimientoReprogramadoModifySQL.Strings#update pm_mantenimientoreprogramadoset3  CODIGOMTTOREPROGRAMADO = :CODIGOMTTOREPROGRAMADO,-  CODIGOMANTENIMIENTO = :CODIGOMANTENIMIENTO,/  MOTIVOREPROGRAMACION = :MOTIVOREPROGRAMACION,,  FECHAREPROGRAMACION = :FECHAREPROGRAMACIONwhere6  CODIGOMTTOREPROGRAMADO = :OLD_CODIGOMTTOREPROGRAMADO InsertSQL.Strings(insert into pm_mantenimientoreprogramadoZ  (CODIGOMTTOREPROGRAMADO, CODIGOMANTENIMIENTO, MOTIVOREPROGRAMACION, FECHAREPROGRAMACION)valuesI  (:CODIGOMTTOREPROGRAMADO, :CODIGOMANTENIMIENTO, :MOTIVOREPROGRAMACION,    :FECHAREPROGRAMACION) DeleteSQL.Strings(delete from pm_mantenimientoreprogramadowhere6  CODIGOMTTOREPROGRAMADO = :OLD_CODIGOMTTOREPROGRAMADO Left@Topq   