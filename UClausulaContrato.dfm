�
 TFCLAUSULACONTRATO 0A  TPF0TfClausulaContratofClausulaContratoLeft� Top� Width�Height� CaptionCl�usulas ContratoColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrderPositionpoDesktopCenterPixelsPerInch`
TextHeight TDBGriddbgClausulasLeft Top WidthiHeight� AlignalLeft
DataSource
dsClausulaTabOrder TitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.Style Columns	AlignmenttaCenterExpanded	FieldNameCONSECUTIVOTitle.CaptionConsecutivoWidthBVisible	    TDBNavigatorDBNavigator1Left Top� Width�Height
DataSource
dsClausulaVisibleButtonsnbFirstnbPriornbNextnbLastnbInsertnbDeletenbEditnbPostnbCancel AlignalBottomTabOrder  TPanelPanel1LeftiTop WidthrHeight� AlignalClientCaptionPanel1TabOrder TPanelPanel2LeftTopWidthpHeight&AlignalTop
BevelOuterbvNoneTabOrder  TLabelLabel1LeftTop
WidthHeightCaptionT�tulo  TDBEditDBEdit1Left1TopWidth5Height	DataFieldTITULO
DataSource
dsClausulaTabOrder    	TGroupBox	GroupBox1LeftTop'WidthpHeight� AlignalClientCaption TextoTabOrder TDBMemodbTextoClausulaLeftTopWidthlHeight� AlignalClient	DataFieldTEXTO
DataSource
dsClausulaTabOrder     TQuery	qClausulaCachedUpdates	AfterInsertqClausulaAfterInsert	AfterPostqClausulaAfterPostAfterDeleteqClausulaAfterDeleteDatabaseNameBaseDatoSQL.Strings-SELECT CODIGOCLAUSULACONTRATO,CODIGOCONTRATO,CONSECUTIVO,TEXTO,TITULOFROM CLAUSULACONTRATO$WHERE CODIGOCONTRATO=:CODIGOCONTRATO UpdateObjectupdClausulaLeft� Top� 	ParamDataDataType	ftUnknownNameCODIGOCONTRATO	ParamType	ptUnknown    TDataSource
dsClausulaDataSet	qClausulaLeft� Top�   
TUpdateSQLupdClausulaModifySQL.Stringsupdate CLAUSULACONTRATOset3  CODIGOCLAUSULACONTRATO = :CODIGOCLAUSULACONTRATO,#  CODIGOCONTRATO = :CODIGOCONTRATO,  CONSECUTIVO = :CONSECUTIVO,  TEXTO = :TEXTO,  TITULO = :TITULOwhere6  CODIGOCLAUSULACONTRATO = :OLD_CODIGOCLAUSULACONTRATO InsertSQL.Stringsinsert into CLAUSULACONTRATOF  (CODIGOCLAUSULACONTRATO, CODIGOCONTRATO, CONSECUTIVO, TEXTO, TITULO)valuesK  (:CODIGOCLAUSULACONTRATO, :CODIGOCONTRATO, :CONSECUTIVO, :TEXTO, :TITULO) DeleteSQL.Stringsdelete from CLAUSULACONTRATOwhere6  CODIGOCLAUSULACONTRATO = :OLD_CODIGOCLAUSULACONTRATO Left(Top�   TQueryqCodigoDatabaseNameBaseDatoSQL.Strings8Select max(codigoclausulacontrato) from clausulacontrato Left� Top�   TQueryqConsecutivoDatabaseNameBaseDatoSQL.Strings-Select max(consecutivo) from clausulacontrato$where codigocontrato=:codigocontrato Left� Top 	ParamDataDataType	ftUnknownNamecodigocontrato	ParamType	ptUnknown     