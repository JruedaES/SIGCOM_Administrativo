?
 TFESTADISTICAADMINISTRATIVO 0?  TPF0?TfEstadisticaAdministrativofEstadisticaAdministrativoLeft? Top? CaptionfEstadisticaAdministrativoPixelsPerInch`
TextHeight ?TDecisionGraphDecisionGraph1 
TBarSeriesSeries1ActiveMarks.ArrowLengthMarks.VisibleTitleTemplate: CODIGOSUELDOSeriesColorclRedXValues.DateTimeXValues.NameXXValues.Multiplier       ???XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ???YValues.OrderloNone
IdentifierTemplate: CODIGOSUELDOStyle=  
TBarSeriesSeries2ActiveMarks.ArrowLengthMarks.VisibleTitleTemplate: TIPOSUELDOSeriesColorclRedXValues.DateTimeXValues.NameXXValues.Multiplier       ???XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ???YValues.OrderloNone
IdentifierTemplate: TIPOSUELDOStyle=  
TBarSeriesSeries3ActiveMarks.ArrowLengthMarks.VisibleTitleTemplate: SUELDOSeriesColorclRedXValues.DateTimeXValues.NameXXValues.Multiplier       ???XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ???YValues.OrderloNone
IdentifierTemplate: SUELDOStyle=  
TBarSeries ActiveMarks.ArrowLengthMarks.Visible	SeriesColorclGreenXValues.DateTimeXValues.NameXXValues.Multiplier       ???XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ???YValues.OrderloNone
Identifier::CODIGOSUELDO+TIPOSUELDOStyle  
TBarSeriesSeries5ActiveMarks.ArrowLengthMarks.VisibleTitleNPSeriesColorclRedXValues.DateTimeXValues.NameXXValues.Multiplier       ???XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ???YValues.OrderloNone
IdentifierNPStyle(  
TBarSeriesSeries6ActiveMarks.ArrowLengthMarks.VisibleTitlePFSeriesColorclGreenXValues.DateTimeXValues.NameXXValues.Multiplier       ???XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ???YValues.OrderloNone
IdentifierPFStyle(  
TBarSeriesSeries7ActiveMarks.ArrowLengthMarks.VisibleTitleSISeriesColorclYellowXValues.DateTimeXValues.NameXXValues.Multiplier       ???XValues.OrderloAscendingYValues.DateTimeYValues.NameBarYValues.Multiplier       ???YValues.OrderloNone
IdentifierSIStyle(   ?TDecisionPivotDecisionPivot1 ?TDecisionGridDecisionGrid1
Dimensions	FieldNameCODIGOSUELDOColorclNone	AlignmenttaCenter	Subtotals	 	FieldName
TIPOSUELDOColorclNone	AlignmenttaCenter	Subtotals	 	FieldNameSUELDOColorclNone	AlignmenttaCenter	Subtotals	 	FieldNameTOTALColorclNone	AlignmenttaCenter	Subtotals	 	FieldNameSUMAColorclNone	AlignmenttaCenter	Subtotals	     ?TDecisionCubeDecisionCube1DataSetqEstadisticaDimensionMap
ActiveFlag
diAsNeeded	FieldTypeftString	FieldnameCODIGOSUELDOBaseNameE.CODIGOSUELDONameCODIGOSUELDODerivedFrom?DimensionTypedimDimensionBinTypebinNone
ValueCount	Active	 
ActiveFlag
diAsNeeded	FieldTypeftString	Fieldname
TIPOSUELDOBaseNameE.TIPOSUELDOName
TIPOSUELDODerivedFrom?DimensionTypedimDimensionBinTypebinNone
ValueCountActive	 
ActiveFlag
diAsNeeded	FieldTypeftFloat	FieldnameSUELDOBaseNameS.SUELDONameSUELDODerivedFrom?DimensionTypedimDimensionBinTypebinNone
ValueCount	Active	 
ActiveFlag
diAsNeeded	FieldTypeftFloat	FieldnameTOTALBaseNameE.CODIGOEMPLEADONameTOTALDerivedFrom?DimensionTypedimCountBinTypebinNone
ValueCount?Active	 
ActiveFlag
diAsNeeded	FieldTypeftFloat	FieldnameSUMABaseNameS.SUELDONameSUMADerivedFrom?DimensionTypedimSumBinTypebinNone
ValueCount?Active	    ?TDecisionQueryDecisionQuery1SQL.StringsSSELECT Empleado.CODIGOSUELDO, Empleado.TIPOSUELDO, Sueldo.SUELDO, count(*) as TotalDFROM EMPLEADO Empleado, SUELDO Sueldo, ADMINISTRATIVO Administrativo5WHERE   (Empleado.CODIGOSUELDO = Sueldo.CODIGOSUELDO)1   AND  (Empleado.TIPOSUELDO = Sueldo.TIPOSUELDO)M   AND  (Administrativo.CODIGOADMINISTRATIVO = Empleado.CODIGOADMINISTRATIVO)1   AND  (Administrativo.CODIGOADMINISTRATIVO > 0)5   AND  (Administrativo.CODIGOARBOL LIKE '001016%')  BGROUP BY Empleado.CODIGOSUELDO, Empleado.TIPOSUELDO, Sueldo.SUELDO   ?TDecisionSourceDecisionSource1DimensionCountSummaryCountCurrentSummary 
SparseRows
SparseColsDimensionInfo  ?   ?    TQueryqEstadisticaDatabaseNameBaseDatoSQL.StringsZSELECT E.CODIGOSUELDO, E.TIPOSUELDO, S.SUELDO, COUNT(*) AS TOTAL, SUM(SUELDO) AS SUMA FROM&EMPLEADO E, ADMINISTRATIVO A, SUELDO S7WHERE (E.CODIGOADMINISTRATIVO = A.CODIGOADMINISTRATIVO)#AND (S.CODIGOSUELDO=E.CODIGOSUELDO)!AND (S.TIPOSUELDO = E.TIPOSUELDO) Left0Top   