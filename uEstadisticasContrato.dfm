?
 TFESTADISTICASCONTRATO 0?  TPF0?TfEstadisticasContratofEstadisticasContratoCaptionfEstadisticasContratoPixelsPerInch`
TextHeight ?TDecisionGraphDecisionGraph1 
TBarSeriesSeries1ActiveMarks.ArrowLengthMarks.VisibleTitleTemplate: EstadoSeriesColorclRedXValues.DateTimeXValues.NameXXValues.Multiplier       ???XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ???YValues.OrderloNone
IdentifierTemplate: EstadoStyle=  
TBarSeriesSeries2ActiveMarks.ArrowLengthMarks.VisibleTitleTemplate: TipoSeriesColorclRedXValues.DateTimeXValues.NameXXValues.Multiplier       ???XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ???YValues.OrderloNone
IdentifierTemplate: TipoStyle=  
TBarSeriesSeries3ActiveMarks.ArrowLengthMarks.VisibleTitleTemplate: Divisi?nSeriesColorclRedXValues.DateTimeXValues.NameXXValues.Multiplier       ???XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ???YValues.OrderloNone
IdentifierTemplate: Divisi?nStyle=  
TBarSeriesSeries4ActiveMarks.ArrowLengthMarks.VisibleTitleTemplate: Secci?nSeriesColorclRedXValues.DateTimeXValues.NameXXValues.Multiplier       ???XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ???YValues.OrderloNone
IdentifierTemplate: Secci?nStyle=  
TBarSeriesSeries5ActiveMarks.ArrowLengthMarks.VisibleTitleTemplate: NOMBRECONTRATISTASeriesColorclRedXValues.DateTimeXValues.NameXXValues.Multiplier       ???XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ???YValues.OrderloNone
IdentifierTemplate: NOMBRECONTRATISTAStyle=  
TBarSeriesSeries6ActiveMarks.ArrowLengthMarks.VisibleTitleTemplate: NOMBREPROGRAMASeriesColorclRedXValues.DateTimeXValues.NameXXValues.Multiplier       ???XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ???YValues.OrderloNone
IdentifierTemplate: NOMBREPROGRAMAStyle=   ?TDecisionPivotDecisionPivot1 ?TDecisionGridDecisionGrid1
Dimensions	FieldNameEstadoColorclNone	AlignmenttaCenter	Subtotals	 	FieldNameTipoColorclNone	AlignmenttaCenter	Subtotals	 	FieldNameDivisi?nColorclNone	AlignmenttaCenter	Subtotals	 	FieldNameSecci?nColorclNone	AlignmenttaCenter	Subtotals	 	FieldNameNOMBRECONTRATISTAColorclNone	AlignmenttaCenter	Subtotals	 	FieldNameNOMBREPROGRAMAColorclNone	AlignmenttaCenter	Subtotals	 	FieldNameREGISTROColorclNone	AlignmenttaCenter	Subtotals	 ColorclNone	AlignmenttaCenter	Subtotals	     ?TDecisionCubeDecisionCube1DimensionMap
ActiveFlag
diAsNeeded	FieldTypeftFloat	FieldnameREGISTROBaseNameC.CODIGOCONTRATONameREGISTRODerivedFrom?DimensionTypedimCountBinTypebinNone
ValueCount?Active	 
ActiveFlag
diAsNeeded	FieldTypeftString	FieldnameNOMBREESTADOCONTRATOBaseNameE.NOMBREESTADOCONTRATONameEstadoDerivedFrom?DimensionTypedimDimensionBinTypebinNone
ValueCount Active	 
ActiveFlag
diAsNeeded	FieldTypeftString	FieldnameNOMBRETIPOCONTRATOBaseNameT.NOMBRETIPOCONTRATONameTipoDerivedFrom?DimensionTypedimDimensionBinTypebinNone
ValueCount Active	 
ActiveFlag
diAsNeeded	FieldTypeftString	FieldnameNOMBREDIVISIONBaseNameD.NOMBREDIVISIONNameDivisi?nDerivedFrom?DimensionTypedimDimensionBinTypebinNone
ValueCount Active	 
ActiveFlag
diAsNeeded	FieldTypeftString	FieldnameNOMBRESECCIONBaseNameS.NOMBRESECCIONNameSecci?nDerivedFrom?DimensionTypedimDimensionBinTypebinNone
ValueCount Active	 
ActiveFlag
diAsNeeded	FieldTypeftString	FieldnameNOMBRECONTRATISTABaseNameC2.NOMBRECONTRATISTANameContratistaDerivedFrom?DimensionTypedimDimensionBinTypebinNone
ValueCount Active	 
ActiveFlag
diAsNeeded	FieldTypeftString	FieldnameNOMBREPROGRAMABaseNameP.NOMBREPROGRAMANameProgramaDerivedFrom?DimensionTypedimDimensionBinTypebinNone
ValueCount Active	    ?TDecisionQueryDecisionQuery1Active	SQL.Strings5SELECT count (DISTINCT C.CODIGOCONTRATO) as Registro,x E.NOMBREESTADOCONTRATO, T.NOMBRETIPOCONTRATO, D.NOMBREDIVISION, S.NOMBRESECCION, C2.NOMBRECONTRATISTA, P.NOMBREPROGRAMA:FROM CONTRATO C, CIUDAD C1, ZONA Z, DIVISION D, SECCION S,Y CONTRATISTA C2, INTERVENTOR I, AUXILIAR A, PROGRAMA P,  ESTADOCONTRATO E, TIPOCONTRATO TWHEREA(C1.CODIGOZONA = C.CODIGOZONA) AND (C.CODIGOORIGENCONTRATO = 'D')' AND (C1.CODIGOCIUDAD = C.CODIGOCIUDAD)# AND (Z.CODIGOZONA = C1.CODIGOZONA)* AND (D.CODIGODIVISION = C.CODIGODIVISION)* AND (S.CODIGODIVISION = D.CODIGODIVISION)( AND (S.CODIGOSECCION = C.CODIGOSECCION)1 AND (C2.CODIGOCONTRATISTA = C.CODIGOCONTRATISTA)0 AND (I.CODIGOINTERVENTOR = C.CODIGOINTERVENTOR)* AND (A.CODIGODIVISION = C.CODIGODIVISION)( AND (A.CODIGOSECCION = C.CODIGOSECCION)* AND (A.CODIGOAUXILIAR = C.CODIGOAUXILIAR)* AND (P.CODIGODIVISION = C.CODIGODIVISION)( AND (P.CODIGOSECCION = C.CODIGOSECCION)* AND (P.CODIGOPROGRAMA = C.CODIGOPROGRAMA)4 AND (E.CODIGOESTADOCONTRATO=C.CODIGOESTADOCONTRATO)0 AND (T.CODIGOTIPOCONTRATO=C.CODIGOTIPOCONTRATO)?group by E.NOMBREESTADOCONTRATO, T.NOMBRETIPOCONTRATO, D.NOMBREDIVISION, S.NOMBRESECCION, C2.NOMBRECONTRATISTA, P.NOMBREPROGRAMA   ?TDecisionSourceDecisionSource1DimensionCountSummaryCountCurrentSummary 
SparseRows
SparseColsDimensionInfo? ?? ?  ? ????    