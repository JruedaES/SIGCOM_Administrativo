?
 TFINFORMACIONODTHIJA 0?  TPF0TfInformacionOdtHijafInformacionOdtHijaLeft]Top? BorderIconsbiSystemMenu BorderStylebsToolWindowCaptionInformacion OdtClientHeighttClientWidth? Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height?	Font.NameMS Sans Serif
Font.Style 	FormStylefsStayOnTopOldCreateOrderOnClose	FormCloseOnShowFormShowPixelsPerInch`
TextHeight TLabelLabel1Left
TopWidth#HeightCaptionODT :Font.CharsetDEFAULT_CHARSET
Font.ColorclTealFont.Height?	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TLabelLabel7LeftTop"WidthGHeightCaptionTipo Tarea :Font.CharsetDEFAULT_CHARSET
Font.ColorclTealFont.Height?	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TDBEditDBEdit1Left/TopWidth? Height	DataFieldCODIGO
DataSourcedsOdtTabOrder   TDBEditDBEdit2LeftPTop Width? Height	DataFieldNOMBRETIPOTAREA
DataSourcedsOdtTabOrder  TDBMemoDBMemo1Left
Top8Width? Height7	DataFieldMOTIVOS
DataSourcedsOdtTabOrder  TQueryqOdtActive	DatabaseNameBaseDatoSQL.StringsVselect o.codigoodt || '-'|| od.consecutivo as codigo,t.descripcion,tt.nombretipotarea,1od.codigotipotrabajoodt,o.motivos,od.observacion12from odt o,odtdia od,tipotrabajoodt t,tipotarea ttwhere od.codigoodt=o.codigoodt5and t.codigotipotrabajoodt(+)=od.codigotipotrabajoodt+and tt.codigotipotarea(+)=o.codigotipotareaand od.codigoodt=:codigoodtand od.consecutivo=:consecutivo Left? Top	ParamDataDataTypeftFloatName	codigoodt	ParamType	ptUnknown DataType	ftIntegerNameconsecutivo	ParamType	ptUnknown    TDataSourcedsOdtDataSetqOdtLeft? Top   