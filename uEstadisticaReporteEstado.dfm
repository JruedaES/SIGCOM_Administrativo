�
 TFESTADISTICAREPORTEESTADO 0}
  TPF0�TfEstadisticaReporteEstadofEstadisticaReporteEstadoLeft�Top�WidthHeight�Caption"Estad�sticas de Estado de ReportesPixelsPerInch`
TextHeight �	TSplitter	Splitter1HeightW  �
TToolPanel
ToolPanel1Width   �TDecisionGraphDecisionGraph1WidthpHeightW  �TPanelPanelFiltroWidth  �TPanelpDerWidth� �TMemo
MemoDatos2Width   �TPanelPanel4Width�   �TDecisionPivotDecisionPivot1HeightW �TDecisionGridDecisionGrid1Height4
DimensionsColorclNone	AlignmenttaCenter	Subtotals	 ColorclNone	AlignmenttaCenter	Subtotals	 ColorclNone	AlignmenttaCenter	Subtotals	 ColorclNone	AlignmenttaCenter	Subtotals	 ColorclNone	AlignmenttaCenter	Subtotals	 ColorclNone	AlignmenttaCenter	Subtotals	 DisplayNameAve of ItemsTotalColorclNone	AlignmenttaCenter	Subtotals	     �TDecisionCubeDecisionCube1DimensionMap
ActiveFlag
diAsNeeded	FieldTypeftFloat	Fieldname	REGISTROSName	REGISTROSDerivedFrom�DimensionTypedimSumBinTypebinNone
ValueCount�Active	 
ActiveFlag
diAsNeeded	FieldTypeftString	FieldnameNOMBREESTADOREPORTENameEstadoDerivedFrom�DimensionTypedimDimensionBinTypebinNone
ValueCount�Active	 
ActiveFlag
diAsNeeded	FieldTypeftString	FieldnameNOMBRETIPOREPORTENameTipoDerivedFrom�DimensionTypedimDimensionBinTypebinNone
ValueCount�Active	 
ActiveFlag
diAsNeeded	FieldTypeftString	FieldnameNOMBREINFORMANTEName
InformanteDerivedFrom�DimensionTypedimDimensionBinTypebinNone
ValueCount�Active	    �TDecisionQueryDecisionQuery1Active	SQL.Strings^SELECT COUNT(*) AS Registros, ER.nombreestadoreporte, TR.nombretiporeporte, I.nombreinformante�FROM REPORTE R, INFORMANTE I, ADMINISTRATIVO A, TIPOREPORTE TR, CLASEREPORTE CR, ESTADOREPORTE ER, SUBESTACION S, CIRCUITO C, ADMINISTRATIVO AD, GRUPOTRABAJO GTeWHERE (R.CODIGOINFORMANTE = I.CODIGOINFORMANTE) AND (A.CODIGOADMINISTRATIVO = R.CODIGOADMINISTRATIVO)�AND (TR.CODIGOTIPOREPORTE = R.CODIGOTIPOREPORTE) AND (CR.CODIGOCLASEREPORTE = R.CODIGOCLASEREPORTE) AND (R.CODIGOADMINISTRATIVO='57')gAND (ER.CODIGOESTADOREPORTE = R.CODIGOESTADOREPORTE) AND (S.CODIGOSUBESTACION (+)= R.CODIGOSUBESTACION)�AND (C.CODIGOCIRCUITO (+)= R.CODIGOCIRCUITO) AND (AD.CODIGOADMINISTRATIVO (+)= R.CIAINFORMANTE) AND (GT.CODIGOGRUPOTRABAJO (+) = R.CODIGOGRUPOTRABAJO) AND (GT.CODIGOADMINISTRATIVO (+) = R.CODIGOADMINISTRATIVO)IGROUP BY ER.nombreestadoreporte, TR.nombretiporeporte, I.nombreinformante    �TDecisionSourceDecisionSource1DimensionCountSummaryCountCurrentSummary 
SparseRows
SparseColsDimensionInfo� �� �  � ����    