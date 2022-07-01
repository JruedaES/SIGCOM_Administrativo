library Administrativo;


Uses
  SysUtils,
  Windows,
  graphics,
  dbTables,
  Bde,
  db,
  Classes,
  Forms,
  Dialogs,
  PlugIns,
  Controls,
  ConsDll in '..\..\Comunes\ConsDll.pas',
  UBase in '..\..\Comunes\UBase.pas' {fBase},
  UnBase in '..\..\Comunes\UnBase.pas' {FNBase},
  udSgdListaBase in '..\..\Comunes\udSgdListaBase.pas' {FdSgdListaBase},
  UTabSgdBase in '..\..\Comunes\UTabSgdBase.pas' {fTabSgdBase},
  uFormaFecha in '..\..\Comunes\uFormaFecha.pas' {FFormaFecha},
  uFormaEspere in '..\..\Comunes\uFormaEspere.pas' {fFormaEspere},
  uVisualizaFotos in '..\..\Comunes\uVisualizaFotos.pas' {FVisualizaFotos},
  uQRBase in '..\..\Comunes\uQRBase.pas' {FQRBase},
  uFormaHora in '..\..\Comunes\uFormaHora.pas' {FFormaHora},
  UdSgdBase in '..\..\Comunes\UdSgdBase.pas' {FdSgdBase},
  uFuncionSGD in '..\..\Comunes\uFuncionSGD.pas',
  uUnZip in '..\..\Comunes\uUnZip.pas',
  uElegirEmpleado in 'uElegirEmpleado.pas' {fElegirEmpleado},
  uReporte in 'uReporte.pas' {fReporte},
  uDatosComercial in 'uDatosComercial.pas' {fDatosComercial},
  uInfoElectricoCliente in 'uInfoElectricoCliente.pas' {fInfoElectricoCliente},
  uQRElementoReporte in 'uQRElementoReporte.pas' {fQRElementoReporte},
  uQRReporte in 'uQRReporte.pas' {fQRReporte},
  uBuscarContratosVigentes in 'uBuscarContratosVigentes.pas' {fBuscarContratosVigentes},
  uFiltroContrato in 'uFiltroContrato.pas' {FFiltroContrato},
  uListaStock in 'uListaStock.pas' {fListaStock},
  uStockGrupoTrabajo in 'uStockGrupoTrabajo.pas' {fStockGrupoTrabajo},
  uBuscarMaterial in 'uBuscarMaterial.pas' {fBuscarMaterial},
  uBuscaModificacion in 'uBuscaModificacion.pas' {fBuscaModificacion},
  uInformacionReporte in 'uInformacionReporte.pas' {fInformacionReporte},
  uAdicionarSecuenciaTrabajo in 'uAdicionarSecuenciaTrabajo.pas' {FAdicionarSecuenciaTrabajos},
  uListaReportesODT in 'uListaReportesODT.pas' {fListaReportesODT},
  uEstadisticasBase in 'uEstadisticasBase.pas' {fEstadisticasBase},
  uEstadisticaAdministrativo in 'uEstadisticaAdministrativo.pas' {fEstadisticaAdministrativo},
  uListaODTUrbanaRural in 'uListaODTUrbanaRural.pas' {fListaODTUrbanaRural},
  uODTUrbanaRural in 'uODTUrbanaRural.pas' {FOdtUrbanaRuralMtto},
  uElementosAsociadosODT in 'uElementosAsociadosODT.pas' {fElementosAsociadosODT},
  uCartografiaReportes in 'uCartografiaReportes.pas' {fCartografiaReportes},
  uQRODTUrbanaRural in 'uQRODTUrbanaRural.pas' {fQRODTUrbanaRural},
  uListaModificacion in 'uListaModificacion.pas' {fListaModificacion},
  uModificacion in 'uModificacion.pas' {fModificacion},
  uFormarFechaOliver in 'uFormarFechaOliver.pas' {fFormaFechaOliver},
  uBuscaMaterial in 'uBuscaMaterial.pas' {fBuscaMaterial},
  uQRODTPadreAdc2 in 'uQRODTPadreAdc2.pas' {fQRODTPadreAdc2},
  InterExcel in 'InterExcel.pas',
  Excel_TLB in '..\..\Archivos de programa\Borland\Delphi4\Imports\Excel_TLB.pas',
  Office_TLB in '..\..\Archivos de programa\Borland\Delphi4\Imports\Office_TLB.pas',
  uElementosElectricos in 'uElementosElectricos.pas' {FElementosElectricos},
  uReporteSimilar in 'uReporteSimilar.pas' {FReporteSimilar},
  uArbolBD in 'uArbolBD.pas',
  uAsignarODT in 'uAsignarODT.pas' {FAsignarODT},
  uArbolInterruptores in 'uArbolInterruptores.pas' {FArbolInterruptores},
  uBuscarTipoDano in 'uBuscarTipoDano.pas' {FBuscarTipoDano},
  uODTPadre in 'uODTPadre.pas' {fODTPadre},
  uActividadODT in 'uActividadODT.pas' {fActividadODT},
  uQRListaReportes in 'uQRListaReportes.pas' {FQRListaReportes},
  uQRODTUrbanaRuralAdc in 'uQRODTUrbanaRuralAdc.pas' {fQRODTUrbanaRuralAdc},
  uQRODTPadreAdc in 'uQRODTPadreAdc.pas' {fQRODTPadreAdc},
  uCuentaCobro in 'uCuentaCobro.pas' {fCuentaCobro},
  uQRListaReporteODT in 'uQRListaReporteODT.pas' {fQRListaReporteODT},
  uQRIndicexMoviles in 'uQRIndicexMoviles.pas' {FQRIndicexMoviles},
  uQRListadoReportes in 'uQRListadoReportes.pas' {FQRListadoReportes},
  uQRIndicexResumen in 'uQRIndicexResumen.pas' {FQRIndicexResumen},
  uQRListaOdtHorasExtras in 'uQRListaOdtHorasExtras.pas' {FQRListaODTHorasExtras},
  uQRMaterialesODT in 'uQRMaterialesODT.pas' {FQRMaterialesODT},
  uComunesAdministrativo in 'uComunesAdministrativo.pas',
  uODTDetalleHorasExtras in 'uODTDetalleHorasExtras.pas' {fDetalleHorasExtras},
  uIndiceAreaMetropolitana in 'uIndiceAreaMetropolitana.pas' {fIndiceAreaMetropolitana},
  uCIATraslado in 'uCIATraslado.pas' {fCIATraslado},
  uQRIndicexTotal in 'uQRIndicexTotal.pas' {FQRIndicexTotal},
  uQRListadoContrato in 'uQRListadoContrato.pas' {FQRListadoContrato},
  uPreviewQuickReport in 'uPreviewQuickReport.pas' {FPreviewQuickReport},
  uFiltroGrupo in 'uFiltroGrupo.pas' {FFiltroGrupo},
  uQRProgramacionEmpleado in 'uQRProgramacionEmpleado.pas' {FQRProgramacionEmpleado},
  uQRProgramacionGrupo in 'uQRProgramacionGrupo.pas' {FQRProgramacionGrupo},
  uQRProgramacionGrupoEmpleado in 'uQRProgramacionGrupoEmpleado.pas' {FQRProgramacionGrupoEmpleado},
  uListaElementoODT in 'uListaElementoODT.pas' {FListaElementoODT},
  uGenerarProgramacion in 'uGenerarProgramacion.pas' {FGenerarProgramacion},
  uCrearProgramacion in 'uCrearProgramacion.pas' {FCrearProgramacion},
  uProgramacionEmpleadoGrupo in 'uProgramacionEmpleadoGrupo.pas' {FProgramacionEmpleadoGrupo},
  uEstadisticaOdt in 'uEstadisticaOdt.pas' {FEstadisticaOdt},
  uBuscarReporte in 'uBuscarReporte.pas' {FBuscarReporte},
  uExportarImagen in 'uExportarImagen.pas' {FExportarImagen},
  uListaAdministrativo in 'uListaAdministrativo.pas' {fListaAdministrativo},
  uBuscarStock in 'uBuscarStock.pas' {fBuscarStock},
  uQREstadoActualMovil in 'uQREstadoActualMovil.pas' {fQREstadoActualMovil},
  uQRAuditoriaStockMoviles in 'uQRAuditoriaStockMoviles.pas' {fQRAuditoriaStockMoviles},
  uQRBalanceMaterialDependencia in 'uQRBalanceMaterialDependencia.pas' {fQRBalanceMaterialDependencia},
  uAnticipoViatico in 'uAnticipoViatico.pas' {FAnticipoViatico},
  uAuxilio in 'uAuxilio.pas' {FAuxilio},
  uQRAnticipoViaticos in 'uQRAnticipoViaticos.pas' {FQRAnticipoViaticos},
  uOdtVehiculo in 'uOdtVehiculo.pas' {FOdtVehiculo},
  uQRListaODTViaticos in 'uQRListaODTViaticos.pas' {FQRListaODTViaticos},
  uQRListaODTAuxilios in 'uQRListaODTAuxilios.pas' {FQRListaODTAuxilios},
  uQRAuxilioIndividual in 'uQRAuxilioIndividual.pas' {fQRAuxilioIndividual},
  uQRIndicexMaterialResumen in 'uQRIndicexMaterialResumen.pas' {FQRIndicexMaterialResumen},
  uLiquidarExtrasRecargos in 'uLiquidarExtrasRecargos.pas' {FLiquidarExtrasRecargos},
  uQRLiquidarExtrasRecargos in 'uQRLiquidarExtrasRecargos.pas' {FQRLiquidarExtrasRecargos},
  uRequisicionMateriales in 'uRequisicionMateriales.pas' {fRequisicionMateriales},
  uListaActividadCobro in 'uListaActividadCobro.pas' {fListaActividadCobro},
  uActividadCobro in 'uActividadCobro.pas' {fActividadCobro},
  uFormaBase1 in 'uFormaBase1.pas' {FFormaBase1},
  uFormaBaseDoble1 in 'uFormaBaseDoble1.pas' {FFormaBaseDoble},
  uQRViaticos in 'uQRViaticos.pas' {FQRViaticos},
  uListaGrupoTrabajo in 'uListaGrupoTrabajo.pas' {fListaGrupoTrabajo},
  uQROdtValeMateriales in 'uQROdtValeMateriales.pas' {fQRODTValeMateriales},
  uGrupoTrabajo in 'uGrupoTrabajo.pas' {fGrupoTrabajo},
  uLocalizarEmpleado in 'uLocalizarEmpleado.pas' {fLocalizarEmpleado},
  UQRLiquidarExtras in 'UQRLiquidarExtras.pas' {FQRLiquidarExtras},
  uCarta in 'uCarta.pas' {FCarta},
  uQRODTPadreAtras in 'uQRODTPadreAtras.pas' {fQRODTPadreAtras},
  uQRODTPadreMateriales in 'uQRODTPadreMateriales.pas' {fQRODTPadreMateriales},
  uBuscarContrato in 'uBuscarContrato.pas' {fBuscarContrato},
  uContrato in 'uContrato.pas' {fContrato},
  uEstadisticasContrato in 'uEstadisticasContrato.pas' {fEstadisticasContrato},
  uFirmaContrato in 'uFirmaContrato.pas' {fFirmaContrato},
  uInformacionContrato in 'uInformacionContrato.pas' {FInformacionContrato},
  uCambioAIU in 'uCambioAIU.pas' {fCambioAIU},
  uSeleccionarTipoPresupuesto in 'uSeleccionarTipoPresupuesto.pas' {fSeleccionarTipoPresupuesto},
  uCertificadoEntrega in 'uCertificadoEntrega.pas' {FCertificadoEntrega},
  uQRActaLiquidacion in 'uQRActaLiquidacion.pas' {fQRActaLiquidacion},
  uQRLiquidObra2 in 'uQRLiquidObra2.pas' {fQRLiquidObra2},
  uBuscarMaterialEnerGis in 'uBuscarMaterialEnerGis.pas' {fBuscarMaterialEnergis},
  uListaContratoDistribucion in 'uListaContratoDistribucion.pas' {FListaContratoDistribucion},
  uBuscarEmpleadoContratista in 'uBuscarEmpleadoContratista.pas' {fBuscarEmpleadoContratista},
  uqrPresupuesto in 'uqrPresupuesto.pas' {fqrPresupuesto},
  uQRListadoODT in 'uQRListadoOdt.pas' {FQRListadoODT},
  uBuscarOdt in 'uBuscarOdt.pas' {FBuscarOdt},
  uFiltroVehiculo in 'uFiltroVehiculo.pas' {FFiltroEmpleado},
  uFormatoMantenimiento in 'uFormatoMantenimiento.pas' {FFormatoMantenimiento},
  UCronograma in 'UCronograma.pas' {Fcronograma},
  UTareaMtto in 'UTareaMtto.pas' {FTareaMtto},
  uUnidadMedidaMtto in 'uUnidadMedidaMtto.pas' {FUnidadMedidaMtto},
  ubancomantenimiento in 'ubancomantenimiento.pas' {fbancomantenimiento},
  UMantenimiento in 'UMantenimiento.pas' {FMantenimiento},
  uQRProgramacionMantenimiento in 'uQRProgramacionMantenimiento.pas' {FQRProgramacionMantenimiento},
  UIdTarea in 'UIdTarea.pas',
  UAdministradorTareas in 'UAdministradorTareas.pas',
  UAdminBancoM in 'UAdminBancoM.pas' {FAdminBancoM},
  UFormatoMttoDatos in 'UFormatoMttoDatos.pas' {FFormatoMttoDatos},
  USeccionFormatoDatos in 'USeccionFormatoDatos.pas' {FSeccionFormatoDatos},
  uListaFormatoMantenimiento in 'uListaFormatoMantenimiento.pas' {fListaFormatoMantenimiento},
  uQRAuxilio in 'uQRAuxilio.pas' {fQRAuxilio},
  uValoresMtto in 'uValoresMtto.pas' {FValoresMantenimiento},
  uValorMedida in 'uValorMedida.pas' {FValorMedida},
  uHojaVidaEquipo in 'uHojaVidaEquipo.pas' {fHojaVidaEquipo},
  uHojaVidaEquipoSerial in 'uHojaVidaEquipoSerial.pas' {fHojaVidaEquipoSerial},
  UFormatoMttoImprirmir in 'UFormatoMttoImprirmir.pas' {FFormatoMttoImprimir},
  uMantenimientoODT in 'uMantenimientoODT.pas' {fMantenimientoODT},
  uConsultaMttoFecha in 'uConsultaMttoFecha.pas' {fConsultaMttoFecha},
  UFormatoMttoDatosODT in 'UFormatoMttoDatosODT.pas' {FFormatoMttoDatosODT},
  USeccionFormatoDatosODT in 'USeccionFormatoDatosODT.pas' {FSeccionFormatoDatosODT},
  uQRODTDevoluciones in 'uQRODTDevoluciones.pas' {fQRODTDevoluciones},
  uCantidadesExistentes in 'uCantidadesExistentes.pas' {fCantidadesExistentes},
  uIntervencion in 'uIntervencion.pas' {fIntervencion},
  uQRTraslado in 'uQRTraslado.pas' {fQRTraslado},
  uBodegaAreainvalida in 'uBodegaAreainvalida.pas' {fBodegaAreainvalida},
  uQRRequisicionMateriales in 'uQRRequisicionMateriales.pas' {fQRRequisicionMateriales},
  uConsultaMantenimientoReprogramado in 'uConsultaMantenimientoReprogramado.pas' {fConsultaMantenimientoReprogramado},
  uQRBalanceMaterialMovilesReq in 'uQRBalanceMaterialMovilesReq.pas' {fQRBalanceMaterialMovilesReq},
  uAIUContrato in 'uAIUContrato.pas' {fAIUContrato},
  uAIUPresupuesto in 'uAIUPresupuesto.pas' {fAIUPresupuesto},
  uqrPresupuestoContrato in 'uqrPresupuestoContrato.pas' {fqrPresupuestoContrato},
  uAsignarPresupuesto in 'uAsignarPresupuesto.pas' {fAsignarPresupuesto},
  uActaParcial in 'uActaParcial.pas' {FActaParcial},
  uQRActaParcial in 'uQRActaParcial.pas' {fQRActaParcial},
  uQRMaterialContratoLiquidado in 'uQRMaterialContratoLiquidado.pas' {fQRMaterialContratoLiquidado},
  uQRMaterialContratoPresupuestado in 'uQRMaterialContratoPresupuestado.pas' {fQRMaterialContratoPresupuestado},
  uQRActividadContrato in 'uQRActividadContrato.pas' {fQRActividadesContrato},
  uListaPresupuesto in 'uListaPresupuesto.pas' {FListaPresupuesto},
  uPresupuestoObra in 'uPresupuestoObra.pas' {fPresupuestoObra},
  uPresupuesto in 'uPresupuesto.pas' {fPresupuesto},
  uQRMaterialPresupuesto in 'uQRMaterialPresupuesto.pas' {fQRMaterialPresupuesto},
  uQRActividadPresupuesto in 'uQRActividadPresupuesto.pas' {fQRActividadPresupuesto},
  uQRContratoObra in 'uQRContratoObra.pas' {fqrContratoObra},
  UMantenimientoAnterior in 'UMantenimientoAnterior.pas' {FMantenimientoAnterior},
  uListaRegistrarMantenimientoAnterior in 'uListaRegistrarMantenimientoAnterior.pas' {fListaRegistrarMantenimientoAnterior},
  ufiltroMantenimiento in 'ufiltroMantenimiento.pas' {fFiltroMantenimiento},
  ufiltroMantenimientoAnterior in 'ufiltroMantenimientoAnterior.pas' {fFiltroMantenimientoAnterior},
  uVehiculo in 'uVehiculo.pas' {fVehiculo},
  UClausulaContrato in 'UClausulaContrato.pas' {fClausulaContrato},
  UMinuta in 'UMinuta.pas' {FMinuta},
  uListaCarta in 'uListaCarta.pas' {FListaCarta},
  uQRODTTrabajosAP in 'uQRODTTrabajosAP.pas' {fQRODTTrabajosAP},
  uQRODTHijaAP in 'uQRODTHijaAP.pas' {fQRODTHijaAP},
  uQRODTPadreAtrasAP in 'uQRODTPadreAtrasAP.pas' {fQRODTPadreAtrasAP},
  uLamparaAPOdt in 'uLamparaAPOdt.pas' {fLamparaAPOdt},
  uListaLamparaAP in 'uListaLamparaAP.pas' {fListaLamparaAp},
  uODTGastosComision in 'uODTGastosComision.pas' {FODTGastosComision},
  uQRODTPadre in 'uQRODTPadre.pas' {fQRODTPadre},
  uQRODTPadreAP in 'uQRODTPadreAP.pas' {fQRODTPadreAP},
  ulistareportesasociados in 'ulistareportesasociados.pas' {flistareportesasociados},
  UHistorialReportes in 'uHistorialReportes.pas' {FHistorialReportes},
  ufiltroGenerarOdt in 'ufiltroGenerarOdt.pas' {fFiltroGenerarOdt},
  uBuscarEmpleado in 'uBuscarEmpleado.pas' {fBuscarEmpleado},
  ufiltroConsultaMttoReprogramado in 'ufiltroConsultaMttoReprogramado.pas' {fFiltroConsultaMttoReprogramado},
  ufiltroConsultasMantenimiento in 'ufiltroConsultasMantenimiento.pas' {fFiltroConsultasMantenimiento},
  UQRVisitas in 'UQRVisitas.pas' {FQRVisitas},
  uBuscaMaterialTraslado in 'uBuscaMaterialTraslado.pas' {fBuscaMaterialTraslado},
  uElegirDirectorio in '..\..\Comunes\uElegirDirectorio.pas' {fElegirDirectorio},
  uCapturarCIA in '..\..\Comunes\uCapturarCIA.pas' {fCapturarCIA},
  uCapturarCIG in '..\..\Comunes\uCapturarCIG.pas' {fCapturarCIG},
  uCapturarDireccion in '..\..\Comunes\uCapturarDireccion.pas' {fCapturarDireccion},
  uDescripcionDir in '..\..\Comunes\uDescripcionDir.pas' {fDescripcionDir},
  uQREstadisticasGrafico in '..\..\Comunes\uQREstadisticasGrafico.pas' {fQREstadisticasGrafico},
  uListaReportes in 'uListaReportes.pas' {fListaReportes},
  uListaReporteEstado in 'uListaReporteEstado.pas' {FListaReporteEstado},
  uListaDatos in 'uListaDatos.pas' {fListaDatos},
  uListaClienteSgdOdt in 'uListaClienteSgdOdt.pas' {fListaClienteSgdOdt},
  uSeleccionarGrupoTrabajo in 'uSeleccionarGrupoTrabajo.pas' {fSeleccionarGrupoTrabajo},
  uSeleccionarImpresionCobro in 'uSeleccionarImpresionCobro.pas' {fSeleccionarImpresionCobro},
  uMaestroSimple in 'uMaestroSimple.pas' {fMaestroSimple},
  uAuditoriaOdt in 'uAuditoriaOdt.pas' {fAuditoriaOdt},
  USeleccionarOdt in 'USeleccionarOdt.pas' {fSeleccionarOdt},
  uSeleccionarUsuario in 'uSeleccionarUsuario.pas' {fSeleccionarUsuario},
  uHabilitarPlanillaExtras in 'uHabilitarPlanillaExtras.pas' {fHabilitarPlanillaExtras},
  uListaSimple in 'uListaSimple.pas' {fListaSimple},
  uInformacionOdtHija in 'uInformacionOdtHija.pas' {fInformacionOdtHija},
  uQRBalanceMaterialMovilesODT in 'uQRBalanceMaterialMovilesODT.pas' {fQRBalanceMaterialMovilesODT},
  DecisionCubeBugWorkaround in 'DecisionCubeBugWorkaround.pas',
  uConsultaAuditoria in '..\..\comunes\uConsultaAuditoria.pas' {fConsultaAuditoria},
  uFiltroConsultaAuditoria in '..\..\comunes\uFiltroConsultaAuditoria.pas' {fFiltroConsultaAuditoria},
  uBuscarApoyo in 'uBuscarApoyo.pas' {fBuscarApoyo},
  uContratoObra in 'uContratoObra.pas' {fContratoObra},
  uBuscarTrafoDis in 'uBuscarTrafoDis.pas' {fBuscarTrafoDis},
  uBuscarActividadOdt in 'uBuscarActividadOdt.pas' {fBuscarActividadOdt},
  uListaMovimientosStock in 'uListaMovimientosStock.pas' {fListaMovimientosStock},
  uBuscarEquipo in 'uBuscarEquipo.pas' {fBuscarEquipo},
  uListaGestionInfraestructura in '..\..\comunes\uListaGestionInfraestructura.pas' {fListaGestionInfraestructura},
  udFiltroGestionInfraestructura in '..\..\comunes\udFiltroGestionInfraestructura.pas' {FdFiltroGestionInfraestructura},
  uSeleccionarPlanillaExtras in 'uSeleccionarPlanillaExtras.pas' {fSeleccionarPlanillaExtras},
  uHabilitarImpresionCobros in 'uHabilitarImpresionCobros.pas' {fHabilitarImpresionCobros},
  udmTablasEMG in 'udmTablasEMG.pas' {dmTablasEMG: TDataModule},
  uMaterialesEstructura in 'uMaterialesEstructura.pas' {fMaterialesEstructura},
  Sincronizar_TLB in 'Sincronizar_TLB.pas',
  uSeleccionarSeccionMantenimiento in 'uSeleccionarSeccionMantenimiento.pas',
  uBuscarDatos in 'uBuscarDatos.pas' {fBuscarDatos},
  uSeleccionarFormatoMantenimiento in 'uSeleccionarFormatoMantenimiento.pas' {fSeleccionarFormatoMantenimiento},
  uConsultaResultadosMtto in 'uConsultaResultadosMtto.pas' {fConsultaResultadosMtto},
  uMantenimientosPendientes in 'uMantenimientosPendientes.pas' {fMantenimientosPendientes},
  uBusquedaMttoPte in 'uBusquedaMttoPte.pas' {FBusquedaMttoPte},
  uFiltroMantenimientosPendientes in 'uFiltroMantenimientosPendientes.pas' {fFiltroMantenimientosPendientes},
  ufiltroMantenimientoPte in 'ufiltroMantenimientoPte.pas' {fFiltroMantenimientoPte},
  uBusquedaResultadoMtto in 'uBusquedaResultadoMtto.pas' {FBusquedaResultadoMtto},
  uFIMPComunes in '..\..\comunes\uFIMPComunes.pas',
  uBuscarActividad in 'uBuscarActividad.pas' {fBuscarActividad},
  uMantenimientoMes in 'uMantenimientoMes.pas' {fMantenimientoMes},
  uInterfacesMovil in '..\..\comunes\uInterfacesMovil.pas',
  uAuditoriaOdtHija in 'uAuditoriaOdtHija.pas' {fAuditoriaOdtHija},
  USeleccionarOdtHija in 'USeleccionarOdtHija.pas' {fSeleccionarOdtHija},
  UListaReportesAgrupados in 'UListaReportesAgrupados.pas' {FListaReportesAgrupados},
  uQRODTHija in 'uQRODTHija.pas' {fQRODTHija},
  uQRODTHijaTodas in 'uQRODTHijaTodas.pas' {fQRODTHijaTodas},
  uCriptografia in '..\..\comunes\uCriptografia.pas',
  AES in '..\..\comunes\AES.pas',
  base64 in '..\..\comunes\base64.pas',
  uViatico in 'uViatico.pas' {FViatico},
  uViaticoConciliacion in 'uViaticoConciliacion.pas' {FViaticoConciliacion},
  UqrViaticoConciliacion in 'UqrViaticoConciliacion.pas' {FqrViaticoConciliacion},
  uQrViaticosEstimados in 'uQrViaticosEstimados.pas' {FQrViaticosEstimados},
  UqrODTGastosComision in 'UqrODTGastosComision.pas' {FqrODTGastosComision},
  uCapturarCIAG in '..\..\comunes\uCapturarCIAG.pas' {fCapturarCIAG},
  uFIMPAdministrativo in 'uFIMPAdministrativo.pas',
  ulista_soe_causaevento in '..\..\comunes\ulista_soe_causaevento.pas' {lista_soecausaevento},
  ProcesarAsignaciones in 'ProcesarAsignaciones.pas',
  uSincronizarMovil in '..\..\comunes\uSincronizarMovil.pas',
  uReintegro in 'uReintegro.pas' {fReintegro},
  uBuscarClientes in 'uBuscarClientes.pas' {fBuscarClientes},
  uDescripcionDireccion in 'uDescripcionDireccion.pas' {fDescripcionDireccion},
  uCargaExcelBase in 'uCargaExcelBase.pas' {fCargaExcelBase},
  uBloc in '..\..\comunes\uBloc.pas' {fBloc},
  uTraslado in 'uTraslado.pas' {fTraslado},
  uListaExportacionRutas in 'uListaExportacionRutas.pas' {FListaExportacionRutas},
  uExpoItinerarios in 'uExpoItinerarios.pas' {fExpoItinerarios},
  uOpcionExpoItinerario in 'uOpcionExpoItinerario.pas' {fOpcionExpoItinerario},
  uListaLecturas in 'uListaLecturas.pas' {fListaLecturas},
  uGaleriaPreliminar in 'uGaleriaPreliminar.pas' {fGaleriaPreliminar},
  uListaCritica in 'uListaCritica.pas' {fListaCritica},
  uAnalisisFacturacion in 'uAnalisisFacturacion.pas' {FAnalisisFacturacion},
  uCargaInfoComercial in 'uCargaInfoComercial.pas' {fCargaInfoComercial},
  uAsignacionLectores in 'uAsignacionLectores.pas' {fAsignacionLectores},
  uCambiarLectura in 'uCambiarLectura.pas' {FCambioLectura},
  uDescargaInfoComercial in 'uDescargaInfoComercial.pas' {fDescargaInfoComercial},
  uAsignarAnalistas in 'uAsignarAnalistas.pas' {FAsignarAnalista},
  USeleccionarAnalista in 'USeleccionarAnalista.pas' {fSeleccionarAnalista},
  uListaLecturasGeneral in 'uListaLecturasGeneral.pas' {fListaLecturasGeneral},
  UFiltrarClave in 'UFiltrarClave.pas' {ffiltrarClave},
  uSeleccionarObservacion in 'uSeleccionarObservacion.pas' {fSeleccionarObservacion},
  uInformacionOriginal in 'uInformacionOriginal.pas' {fInformacionOriginal},
  uInformacionMedidor in 'uInformacionMedidor.pas' {fInformacionMedidor},
  uCargarLecturasFTP in 'uCargarLecturasFTP.pas' {fCargarLecturasFTP},
  uGestionarInfoINCMS in 'uGestionarInfoINCMS.pas' {FuGestionarInfoinCMS},
  uAuditoriaSupervisor in 'uAuditoriaSupervisor.pas' {fAuditoriaSupervisor},
  uListaClientesReparto in 'uListaClientesReparto.pas' {fListaClienteReparto},
  uAsignacionInspectorReparto in 'uAsignacionInspectorReparto.pas' {fAsignacionInspectorReparto},
  uListaExportacionReparto in 'uListaExportacionReparto.pas' {FListaExportacionrReparto},
  uSupervisionGeneralR in 'uSupervisionGeneralR.pas' {fSupervisionGeneralR},
  uSupervisionOnlineR in 'uSupervisionOnlineR.pas' {fSupervisionOnlineR},
  uSupervisionODS in 'uSupervisionODS.pas' {fSupervisionODS},
  uListaReporteIlegales in 'uListaReporteIlegales.pas' {fListaReporteIlegales},
  uCargueManualLecturas in 'uCargueManualLecturas.pas' {fCargueManualLecturas},
  uControlLectura in 'uControlLectura.pas' {fControlLectura},
  uControlReparto in 'uControlReparto.pas' {FControlReparto},
  uGestionarInfoTI in 'uGestionarInfoTI.pas' {FGestionarInfoTI},
  uDashboardAvisos in 'uDashboardAvisos.pas' {FDashboardAvisos},
  uProgramarHorarioJob in 'uProgramarHorarioJob.pas' {fuProgramarHorarioJob},
  uControlResultado in 'uControlResultado.pas' {fControlResultado},
  uElementosConsulta in 'uElementosConsulta.pas' {fElementosConsulta};
{$E pgi}
                          

Var
  OrgApp      : TApplication;
  OrgScreen   : TScreen;
  OrgSession  : TSession;
  OrgSessions : TSessionList;
  dClassDll   : TdClassDll;
{$R *.res}


Function InitApp(aCfgApp : TCfgApplication) : TdClassDll;
Begin

   OrgSession := aCfgApp.Session;
   OrgSessions := aCfgApp.Sessions;

   OrgApp := Application;
   OrgScreen := Screen;

   GetData := aCfgApp.GetData;

   Sessions := aCfgapp.Sessions;
   Session := aCfgApp.Session;


   If aCfgApp.Application <> Nil then
      Application := aCfgApp.Application;

   If aCfgApp.Screen <> Nil then
      Screen      := aCfgApp.Screen;

   ProcManager := aCfgApp.ProcManager;
   ModPlugIns  := aCfgApp.PlugIns;

   Result := dClassDll;

End;


Procedure RestoreApp;
Begin

   Session := OrgSession;
   Sessions := OrgSessions;
   OrgSessions := Nil;
   OrgSession := Nil;

   If OrgApp <> Nil then
   Begin
      Application := OrgApp;
      OrgApp := Nil;
   End;

   If OrgScreen <> Nil then
   Begin
      Screen := OrgScreen;
      OrgScreen := Nil;
   End;

   ProcManager := Nil;
   ModPlugIns  := Nil;

End;


//***************************************************************************
//
//       LISTADOS ADMINISTRATIVO
//
//***************************************************************************

//***************************************************************************
//       Lista de ODTs
//       para la inserción y edición de órdenes de trabajo
//***************************************************************************
Function ListaODTUrbanaRural:TObject;
Begin
  SetEsquemaAlmacen;
  SetEsquemaContratos;
  SetEsquemaContable;
  SetDBLINKMATERIALES;
  SetDBLINKDEPENDENCIAS;
  setdblink;
  fListaODTUrbanaRural:=TfListaODTUrbanaRural.CreateByParametros(Application,nil);
  fListaODTUrbanaRural.Show;
  Result:=fListaODTUrbanaRural;
End;
//***************************************************************************
//       Crear ODTs
//***************************************************************************
Function CrearOdt:TObject;
 var qDatos:TQuery;
 codigo:double;
 Datos:TStringList;
begin
  setdblink;
  SetEsquemaContratos;
  codigo:=0;
  fODTPadre:=TfODTPadre.Create(Application);
  try
    fODTPadre.qODT.Close;
    fODTPadre.qODT.Open;
    if not fODTPadre.qODT.Database.InTransaction then
       fODTPadre.qODT.Database.StartTransaction;
    fODTPadre.qODT.Close;
    fODTPadre.qODT.SQL.Text:='SELECT * FROM ODT WHERE CODIGOODT = -1';
    fODTPadre.qODT.Open;
    fODTPAdre.qODT.Insert;
    fODTPadre.EstadoOdt1:= false;
    qDatos:=TQuery.Create(Application);
    fODTPadre.pSuperior.Enabled:=true;
    fODTPadre.Arbol.Enabled:=false;
    fODTPadre.Notebook.Enabled:=false;
    if fODTPadre.ShowModal=mrOK then
    begin
       codigo:=fODTPadre.qODTCODIGOODT.AsFloat;
       fODTPadre.qODT.Database.Commit;
    end
    else
       fODTPadre.qODT.Database.Rollback;
    qDatos.Free;
  except
    on e:exception do
    begin
      showmessage(e.message);
      if fODTPadre.qODT.Database.InTransaction then
        fODTPadre.qODT.Database.Rollback;
    end;
  end;
  fODTPadre.Free;
  if (codigo>0) then
  begin
    Datos:=TStringList.Create;
    Datos.add('CodigoDesde='+FloatToStr(codigo));
    Datos.add('CodigoHasta='+FloatToStr(codigo));
    Datos.add('cfg_VisualizarFiltro=N');
    fListaODTUrbanaRural:=TfListaODTUrbanaRural.CreateByParametros(Application,Datos);
    fListaODTUrbanaRural.VerFiltro:=false;
    with fListaODTUrbanaRural do
    begin
      fListaODTUrbanaRural.Show;
      fListaODTUrbanaRural.VerFiltro:=true;
    end;
    Result:=fListaODTUrbanaRural;
  end;
End;
//***************************************************************************
//       Lista de ODTs en auditoria
//       de cambios en viaticos, y auxilios despues de terminadas
//***************************************************************************
Function AuditoriaOdt:TObject;
Begin
  setdblink;
  fAuditoriaOdt:=TfAuditoriaOdt.Create(Application);
  fAuditoriaOdt.Show;
  Result:=fAuditoriaOdt;
End;

Function DescargaInfoComercial : TObject;
Begin
 fDescargaInfoComercial:=TfDescargaInfoComercial.Create(Application);
 fDescargaInfoComercial.Show;
 Result := fDescargaInfoComercial;
End;

Function CargueManualLectura : TObject;
Begin
 fCargueManualLecturas:=TfCargueManualLecturas.Create(Application);
 fCargueManualLecturas.Show;
 Result := fCargueManualLecturas;
End;

Function CargarLecturasFTP : TObject;
Begin
 fCargarLecturasFTP:=TfCargarLecturasFTP.Create(Application);
 fCargarLecturasFTP.Show;
 Result := fCargarLecturasFTP;
End;

Function CargarInfoLecturas : TObject;
Begin
 FuGestionarInfoinCMS:=TFuGestionarInfoinCMS.Create(Application);
 FuGestionarInfoinCMS.Show;
 Result := FuGestionarInfoinCMS;
End;


//***************************************************************************
//       Lista de ODTs Hijas en auditoria
//       Despues de pasar al grupo sire.
//***************************************************************************
Function AuditoriaOdtHija:TObject;
Begin
  setdblink;
  fAuditoriaOdtHija:=TfAuditoriaOdtHija.Create(Application);
  fAuditoriaOdtHija.Show;
  Result:=fAuditoriaOdtHija;
End;

//***************************************************************************
//       Rehabilitar impresiones de Viaticos y auxilios
//       ya impresos
//***************************************************************************
Function RehabilitarCobros:TObject;
Begin
  setdblink;
  fHabilitarImpresionCobros:=TfHabilitarImpresionCobros.Create(Application);
  fHabilitarImpresionCobros.Show;
  Result:=fHabilitarImpresionCobros;
End;
//***************************************************************************
//       Reabrir Liquidación Horas extras
//***************************************************************************
Function ReabrirPlanillaExtras:TObject;
Begin
  setdblink;
  fHabilitarPlanillaExtras:=tfHabilitarPlanillaExtras.Create(Application);
  fHabilitarPlanillaExtras.Show;
  Result:=fHabilitarPlanillaExtras;
End;
//***************************************************************************
//       Listado de contratos
//***************************************************************************
Function ListaContratoDistribucion : TObject;
Begin
  FListaContratoDistribucion :=  TFListaContratoDistribucion.CreateByParametros(Application,nil);
  FListaContratoDistribucion.Show;
  Result := FListaContratoDistribucion;
End;

Function Lectores : TObject;
Begin
 fAsignacionLectores:=TfAsignacionLectores.Create(Application);
 fAsignacionLectores.Show;
 Result := fAsignacionLectores;
End;

Function ListaDeCritica : TObject;
Begin
  fListaCritica := TfListaCritica.CreateByParametros(Application,nil);
  fListaCritica.Show;
  Result := fListaCritica;
End;

Function InspectorDeReparto : TObject;
Begin
  fAsignacionInspectorReparto := TfAsignacionInspectorReparto.Create(Application);
  fAsignacionInspectorReparto.Show;
  Result := fAsignacionInspectorReparto;
End;

Function ListaDeLecturas : TObject;
Begin
  fListaLecturas := TfListaLecturas.CreateByParametros(Application,nil);
  fListaLecturas.Show;
  Result := fListaLecturas;
End;

Function ListaDeLecturasGeneral : TObject;
Begin
  fListaLecturasGeneral := TfListaLecturasGeneral.CreateByParametros(Application,nil);
  fListaLecturasGeneral.Show;
  Result := fListaLecturasGeneral;
End;
/////////////////////////////////////////////////////////////////////////////
//
//           APLICATIVOS ADMINISTRATIVOS
//
////////////////////////////////////////////////////////////////////////////
//***************************************************************************
//       Aplicativo para crear programaciones mensuales
//               por empleados y/o grupos
// 1 registro  guarda los parámetros que permiten generar las programaciones
//***************************************************************************
Function CrearProgramaciones:TObject;
Begin
  FCrearProgramacion:=TFCrearProgramacion.Create(Application);
  FCrearProgramacion.Show;
  Result := FCrearProgramacion;
End;
//***************************************************************************
//       Aplicativo para generar programaciones mensuales
//            por empleados y/o grupos por mes
//                    (1 registro por mes)
//***************************************************************************
Function GenerarProgramacion:TObject;
Begin
  setdblink;
  FGenerarProgramacion := TFGenerarProgramacion.Create(Application);
  FGenerarProgramacion.Show;
  Result := FGenerarProgramacion;
End;
//***************************************************************************
//       Aplicativo para liquidación de horas extras y recargos
//         por empleado por mes
//        (1 registro por día)
//***************************************************************************
Function LiquidarExtrasRecargos:TObject;
Begin
  setdblink;
  FLiquidarExtrasRecargos := tFLiquidarExtrasRecargos.Create(Application);
  FLiquidarExtrasRecargos.Show;
  Result := FLiquidarExtrasRecargos;
End;
//***************************************************************************
//       Listado para registrar y editar cartas
//***************************************************************************
Function ListaCarta:TObject;
Begin
  FListaCarta:=TFListaCarta.CreateByParametros(Application,nil);
  FListaCarta.Show;
  Result:=FListaCarta;
End;
//***************************************************************************
//       Ingresa un nuevo reporte
//***************************************************************************
Function NuevoReporte:TObject;
Begin
 try
  fReporte:=TfReporte.Create(Application);
  fReporte.ModoInsercion := True;
  fReporte.qReporte.Active:=False;
  fReporte.qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE=-99';
  FReporte.bbtnAuditoria.visible:=false;
  FReporte.SpeedButton10.visible:=false;
  Freporte.sbGestionarOdt.visible := False;
  fReporte.qReporte.Active:=True;
  fReporte.qReporte.Insert;
  fReporte.tsFechas.TabVisible:=FALSE;
  fReporte.Show;
 finally
 end;
  Result:=fReporte;
End;
//***************************************************************************
//       Listado de reportes
//***************************************************************************
Function ListadoReporte:TObject;
Begin
  fListaReportes:=TfListaReportes.CreateByParametros(Application,nil);
  fListaReportes.Show;
  Result:=fListaReportes;
End;
//***************************************************************************
//       Listado de reportes
//***************************************************************************
Function ListadoReporteEstado:TObject;
Begin
  FListaReporteEstado:=TFListaReporteEstado.CreateByParametros(Application,nil);
  FListaReporteEstado.Show;
  Result:=FListaReporteEstado;
End;

//***************************************************************************
//      Listado de grupos de trabajo
//      permite ingresar y editar grupos de trabajo
//      necesario para el módulo odt
//***************************************************************************
Function ListaGrupoTrabajo:TObject;
Begin
  fListaGrupoTrabajo:=TfListaGrupoTrabajo.CreateByParametros(Application,nil);
  fListaGrupoTrabajo.Show;
  Result:=fListaGrupoTrabajo;
End;
//***************************************************************************
//       lista del Stock de materiales de grupos de trabajo
//***************************************************************************
Function StockGrupoTrabajo:TObject;
Begin
  fListaStock:=TfListaStock.CreateByParametros(Application,nil);
  fListaStock.Show;
  Result:=fListaStock;
End;
//***************************************************************************
//       Abrir formulario para cargar archivo Excel
//***************************************************************************
Function CargaExcelBase : TObject;
Begin
 fCargaExcelBase:=TfCargaExcelBase.Create(Application);
 fCargaExcelBase.Show;
 Result := fCargaExcelBase;
End;



//***************************************************************************
//       Abrir formulario para cargar información comercial a travéz de archivos planos
//***************************************************************************
Function CargaInfoComercial : TObject;
Begin
 fCargaInfoComercial:=TfCargaInfoComercial.Create(Application);
 fCargaInfoComercial.Show;
 Result := fCargaInfoComercial;
End;

Function MaterialesStockGrupoTrabajo:TObject;
Begin

  fListaMovimientosStock:=TfListaMovimientosStock.Create(Application);
  fListaMovimientosStock.Show;
  Result:=fListaMovimientosStock;
End;


//***************************************************************************
//
//     PRESUPUESTOS Y CONTRATOS
//
//***************************************************************************

//***************************************************************************
//       Listado de Presupuestos
//***************************************************************************
Function ListaPresupuesto : TObject;
Begin
  FListaPresupuesto :=  TFListaPresupuesto.CreateByParametros(Application,nil);
  FListaPresupuesto.Show;
  Result := FListaPresupuesto;
End;
//*********Otros
Function SetPosReporte(X,Y:Double):Boolean;
Begin
  try
   Result:=False;
   if Assigned(Application.FindComponent('fReporte') as TForm) then
   begin
     if (fReporte.qReporte.State in [dsInsert]) then
     begin
       fReporte.qReporte.FieldByName('X').AsFloat:=X;
       fReporte.qReporte.FieldByName('Y').AsFloat:=Y;
       fReporte.UbicadoEnCartografia:=True;
       Result:=True;
     end;
     if (fReporte.qReporte.State in [dsEdit]) then
     begin
       if not BuscarReporte(fReporte.qReporteCODIGOREPORTE.AsInteger,False) then
       begin
         fReporte.qReporte.FieldByName('X').AsFloat:=X;
         fReporte.qReporte.FieldByName('Y').AsFloat:=Y;
         fReporte.UbicadoEnCartografia:=True;
         Result:=True;
       end;
     end;
   end;
  finally
//    Result:=False;
  end;
End;

//***************************************************************************
//      Lista plana de dependencias administrativa -solo consulta-
//***************************************************************************
Function ListaAdministrativo:TObject;
Begin
  fListaAdministrativo:=TfListaAdministrativo.CreateByParametros(Application,nil);
  fListaAdministrativo.Show;
  Result:=fListaAdministrativo;
End;

Procedure VerOdtHija(CodigoOdt:Double;Consecutivo: Integer);
begin
  fODTUrbanaRural := TfODTUrbanaRural.Create(Application);
  try
    fODTUrbanaRural.bbAceptar.Enabled := False;
    fODTUrbanaRural.qODTPadre.Close;
    fODTUrbanaRural.qODTPadre.SQL.Add('WHERE CODIGOODT = '+ FloatToStr(CodigoOdt));
    fODTUrbanaRural.qODTPadre.Open;
    fODTUrbanaRural.qODTHija.Close;
    fODTUrbanaRural.qODTHija.SQL.Add('WHERE CODIGOODT = '+ FloatToStr(CodigoOdt));
    fODTUrbanaRural.qODTHija.SQL.Add('AND CONSECUTIVO = '+ IntToStr(Consecutivo));
    fODTUrbanaRural.qODTHija.Open;
    fODTUrbanaRural.qODTPadre.Edit;
    fODTUrbanaRural.qODTHija.Edit;
    fODtUrbanaRural.ShowModal;
  finally
    fODtUrbanaRural.Free;
  end;
end;



Procedure SetTipoElemento(Tipo:Integer;Clave1,Clave2:string;CodigoEstructura:Integer);
var TipoElemento:string;
Begin
  if Assigned(Application.FindComponent('fReporte') as TForm) then
  begin
    if fReporte.qReporte.FieldByName('CODIGOREPORTE').AsString='' then
    begin
       fReporte.qReporteElemento.Cancel;
       fReporte.qReporteElemento.CancelUpdates;
       raise Exception.Create('Para Asignar Elementos al Reporte, Este Primero Debe Ser Guardado.');
    end;
     fReporte.qReporteElemento.Insert;
     case Tipo of
       1 :TipoElemento:='01';  //Apoyo
       2 :TipoElemento:='02';  //NodoMT
       3 :TipoElemento:='03';  //NodoBT
       4 :TipoElemento:='05';  //TramoMT
       5 :TipoElemento:='06';  //TramoBT
       6 :TipoElemento:='08';  //Trafodis
       7 :TipoElemento:='07';  //Interruptordis
       8 :TipoElemento:='09';  //Condensador
       9 :TipoElemento:='16';  //Pararrayo
       10:TipoElemento:='10'; //LamparaAP
       11:TipoElemento:='04'; //DetalleApoyo
       12:TipoElemento:='11'; //Cliente
       13:TipoElemento:='12'; //Excavacion
     else
       TipoElemento:='01';  //Apoyo
     end;
     fReporte.qReporteElemento.FieldByName('CODIGOREPORTE').AsString:=fReporte.qReporteCODIGOREPORTE.AsString;
     fReporte.qReporteElemento.FieldByName('CODIGOTIPOELEMENTO').AsString:=TipoElemento;
     if fReporte.qReporteElemento.FieldByName('CODIGOTIPOELEMENTO').AsString<>'' then
     begin
        fReporte.qReporteElemento.FieldByName('CLAVE1').AsString:=Clave1;
        fReporte.qReporteElemento.FieldByName('CLAVE2').AsString:=Clave2;
        fReporte.qReporteElemento.FieldByName('CODIGOESTRUCTURA').AsInteger:=CodigoEstructura;
     end;
     fReporte.qReporteElemento.Post;
  end;

End;

//Inserta un elemento en la tabla ODTELEMENTO
procedure ODTElemento(CodigoODT,Consecutivo:string;Tipo:Integer;Clave1,Clave2:string;CodigoEstructura:Integer);
var TipoElemento:string;
    Query, qCodigo: TQuery;
    Codigo: Integer;
begin
  Query   := TQuery.Create(Application);
  qCodigo := TQuery.Create(Application);
  Query.DatabaseName := 'BaseDato';
  qCodigo.DatabaseName := 'BaseDato';
  qCodigo.SQL.Text := 'SELECT SQ_ODTELEMENTO.NEXTVAL FROM DUAL';
  qCodigo.Open;
  Codigo := qCodigo.Fields[0].AsInteger;
  qCodigo.Free;
  Query.SQL.Text := 'SELECT * FROM ODTELEMENTO WHERE CODIGOODTELEMENTO = -1';
  Query.RequestLive := True;
  Query.Open;
  case Tipo of
    1 :TipoElemento:='01';  //Apoyo
    2 :TipoElemento:='02';  //NodoMT
    3 :TipoElemento:='03';  //NodoBT
    4 :TipoElemento:='05';  //TramoMT
    5 :TipoElemento:='06';  //TramoBT
    6 :TipoElemento:='08';  //Trafodis
    7 :TipoElemento:='07';  //Interruptordis
    8 :TipoElemento:='09';  //Condensador
    9 :TipoElemento:='16';  //Pararrayo
    10:TipoElemento:='10'; //LamparaAP
    11:TipoElemento:='04'; //DetalleApoyo
    12:TipoElemento:='11'; //Cliente
    13:TipoElemento:='12'; //Excavacion
    else
    TipoElemento:='01';  //Apoyo
  end;
  Query.Insert;
  Query.FieldByName('CODIGOODTELEMENTO').AsInteger := Codigo;
  Query.FieldByName('CODIGOODT').AsString          := CodigoODT;
  Query.FieldByName('CONSECUTIVO').AsString        := Consecutivo;
  Query.FieldByName('CODIGOTIPOELEMENTO').AsString := TipoElemento;
  Query.FieldByName('CLAVE1').AsString             := Clave1;
  Query.FieldByName('CLAVE2').AsString             := Clave2;
  Query.FieldByName('CODIGOESTRUCTURA').AsInteger  := CodigoEstructura;
  try
    Query.Post;
  finally
    Query.Free;
  end;
end;

//Retorna los tramos de un interruptor
Function TramosInterruptor(Circuito,Interruptor:string):TStringList;
var Arbol:TArbolBD;
    Lista:TStringList;
    i,j:Integer;
    s:string;
begin
  Result:=TStringList.Create;
  Lista:=TStringList.Create;
  Arbol:=TArbolBD.Create;
  Arbol.Circuito:=Circuito;
  Arbol.Tipo:='TF';
  Lista.Assign(Arbol.SubArbol('SW: '+ Interruptor));
  for i:=0 to Lista.Count - 1 do
  begin
    if Pos('TR:',Lista[i]) > 0 then
    begin
       j:=Pos('*',Lista[i]);
       s:=Copy(Lista[i],1,j-1);
       Delete(s,1,4);
       Result.Add(s);
    end;
  end;
  Lista.Free;
  Arbol.Free;
end;

//**************************************************************************
//                      MÓDULO HOJA VIDA EQUIPOS
//***************************************************************************

//***************************************************************************
//                      INGRESAR DATOS
//***************************************************************************
//               Listado formatos mantenimiento
//***************************************************************************
Function ListaFormatoDatos:TObject;
Begin
  fListaFormatoMantenimiento:=TfListaFormatoMantenimiento.Create(Application);
  fListaFormatoMantenimiento.Show;
  Result:=fListaFormatoMantenimiento;
End;

//***************************************************************************
//                     LISTADO MTTOS ANTERIORES
//***************************************************************************
//               Registrar pruebas de mantenimientos Anteriores
//***************************************************************************
Function ListaRegistrarMantenimientos:TObject;
Begin
  fListaRegistrarMantenimientoAnterior:=TfListaRegistrarMantenimientoAnterior.Create(Application);
  fListaRegistrarMantenimientoAnterior.Show;
  Result:=fListaRegistrarMantenimientoAnterior;
End;

//***************************************************************************
//              Consultar Registro de Mantenimientos por Elemento
//***************************************************************************
Function HojaVidaEquipo:TObject;
Begin
  FHojaVidaEquipo:=TfHojaVidaEquipo.Create(Application);
  FHojaVidaEquipo.Show;
  Result:=fHojaVidaEquipo;
End;

//***************************************************************************
//              Consultar Registro de Mantenimientos por Serial del Elemento
//***************************************************************************
Function HojaVidaEquipoSerial:TObject;
Begin
  fHojaVidaEquipoSerial:=TfHojaVidaEquipoSerial.Create(Application);
  fHojaVidaEquipoSerial.Show;
  Result:=fHojaVidaEquipoSerial;
End;

//***************************************************************************
//              Generar Formatos en Blanco para Impresión
//***************************************************************************
Function GenerarFormatoVacio:TObject;
Begin
  FFormatoMttoImprimir:=TFFormatoMttoImprimir.create(Application);
  FFormatoMttoImprimir.Show;
  Result:=FFormatoMttoImprimir;
End;


//***************************************************************************
//              Consultar de Resultados de los Mantenimientos
//***************************************************************************
Function ConsultaResultados:TObject;
Begin
  fConsultaResultadosMtto:=TfConsultaResultadosMtto.Create(Application);
  fConsultaResultadosMtto.Show;
  Result:=fConsultaResultadosMtto;
End;


//****************************************************************************
//                           Cronograma
//****************************************************************************
Function Cronograma:TObject;
Begin
  FCronograma:=TFCronograma.Create(Application);
  FCronograma.Show;
  Result:=Fcronograma;
End;

//***************************************************************************
//                    Aplicativo de Mantenimientos - Banco de Mantenimientos
//***************************************************************************
Function BancoMantenimientos:TObject;
Begin
  FAdminBancoM:=TFAdminBancoM.Create(Application);
//  FAdminBancoM:=TFAdminBancoM.crear(self);
  FAdminBancoM.ShowModal;
  FAdminBancoM.Free;
  Result:=nil;
End;

//*******************************************************************************************
//                           Generar ODT para Mantenimientos
//*******************************************************************************************
Function ODTMantenimientos:TObject;
Begin
  fMantenimientoODT:= TfMantenimientoODT.Create(application);
  fMantenimientoODT.Show;
  Result:=fMantenimientoODT;
End;

//*******************************************************************************************
//                          Consultar Mantenimientos Programados a un Elemento por Fecha
//*******************************************************************************************

Function ConsultarMttosElemento:TObject;
Begin
  FConsultaMttoFecha:=TFConsultaMttoFecha.Create(Application);
  FConsultaMttoFecha.Show;
  Result:=FConsultaMttoFecha;
End;

//*******************************************************************************************
//                          Consultar Mantenimientos Reprogramados en un Rango de Fechas
//*******************************************************************************************

Function ConsultarMttoReprogramado:TObject;
Begin
  FConsultaMantenimientoReprogramado:=TFConsultaMantenimientoReprogramado.Create(Application);
  FConsultaMantenimientoReprogramado.Show;
  Result:=FConsultaMantenimientoReprogramado;
End;
//************* Funciones Exportadas **********************************************************

Function VerReporte(CodigoReporte:Integer):Boolean;
begin
  try
    if not (Assigned(Application.FindComponent('fReporte') as TForm)) then
    begin
      fReporte:=TfReporte.Create(Application);
    end;
    fReporte.qReporte.Active:=False;
    fReporte.qReporte.SQL.Text:='SELECT * FROM REPORTE WHERE CODIGOREPORTE='+ inttostr(CodigoReporte);
    fReporte.qReporte.Active:=True;
    fReporte.qReporte.Edit;
    fReporte.Show;
    result:=true;
  except
    result:=false;
  end;
end;

Function ListaGestionInfraestructura:TObject;
Begin
  fListaGestionInfraestructura:=tfListaGestionInfraestructura.CreateByParametros(Application,nil);
  fListaGestionInfraestructura.Show;
  Result:=fListaGestionInfraestructura;
End;

Function ElementoFallaReporte(TipoObjeto,Llave1Elemeto,Llave2Elemento:String):Boolean;
begin
  result:=false;
  if assigned(freporte) then
  begin
    freporte.TipoObjetoEvento:=TipoObjeto;
    freporte.ecodigofalla.text:=Llave1Elemeto;
    freporte.enodofalla.text:=Llave2Elemento;
    result:=True;
  end;
end;

{Function ProcesarAsignaciones:TObject;
Begin
  ProcesarAsignacionesPendientes;
End; }

Function ListaExportacionItinerarios:TObject;
var
  slTemp, slTemp2: TStringList;
Begin
  fExpoItinerarios:= TfExpoItinerarios.Create(Application);
  if fExpoItinerarios.ShowModal = mrOK then
  begin
    slTemp:= TStringList.Create;
    slTemp.Add('SEDE_OPERATIVA='+fExpoItinerarios.qSedesOperativasCODIGOSEDEOPERATIVA.AsString);
    slTemp.Add('DIAL='+fExpoItinerarios.qDiaLCODIGODIAL.AsString);
    slTemp.Add('FECHA_LECTURA='+fExpoItinerarios.meFechaLectura.Text);

    slTemp2:= TStringList.Create;
    slTemp2.Add('Sede Operativa');
    slTemp2.Add('DiaL');
    slTemp2.Add('Fecha de Lectura');

    fListaExportacionRutas:=TFListaExportacionRutas.CreateByParametros(Application,slTemp);
    fListaExportacionRutas.ListaRotulos.Assign(slTemp2);
    fListaExportacionRutas.AjusteFiltro;
    fListaExportacionRutas.Show;
    Result:=FListaExportacionRutas;
  end;
  fExpoItinerarios.Free;
  fExpoItinerarios:=nil;
End;

Function ListaExportacionItinerariosReparto:TObject;
var
  slTemp, slTemp2: TStringList;
  qQuery: TQuery;
Begin
  fExpoItinerarios:= TfExpoItinerarios.Create(Application);
  fExpoItinerarios.Caption := 'Exportación de Itinerarios de Reparto';
  fExpoItinerarios.Label3.Visible :=False;
  fExpoItinerarios.DBLookupComboBox2.Visible := False;
  fExpoItinerarios.DBLookupComboBox2.KeyValue := 1;
  fExpoItinerarios.Label2.Caption :=  'Fecha de Reparto:' ;
  if NOT ProcManager.CanProcExecute
    ('_Exportar Itinerarios de Reparto') then
begin

 try
   qQuery := TQuery.Create(nil);
   qQuery.DatabaseName := 'BaseDato';

   qQuery.SQL.Clear;
   qQuery.SQL.Add('SELECT CODIGOSEDEOPERATIVA FROM COORDINACIONGRUPOTRABAJO WHERE CODIGOUSUARIO=GETCODIGOUSUARIO ');
   qQuery.Open;

   if  qQuery.RecordCount = 0 then
   begin
    fExpoItinerarios.DBLookupComboBox1.Enabled := False;
    fExpoItinerarios.BitBtn1.Enabled := False;
    fExpoItinerarios.meFechaLectura.Enabled := False;
   end
   else
   fExpoItinerarios.DBLookupComboBox1.Enabled := False;


finally
  qQuery.Free;
end;

end;

  if fExpoItinerarios.ShowModal = mrOK then
  begin
    slTemp:= TStringList.Create;
    slTemp.Add('SEDE_OPERATIVA='+fExpoItinerarios.qSedesOperativasCODIGOSEDEOPERATIVA.AsString);
    slTemp.Add('FECHA_REPARTO='+fExpoItinerarios.meFechaLectura.Text);

    slTemp2:= TStringList.Create;
    slTemp2.Add('Sede Operativa');
    slTemp2.Add('Fecha de Reparto');

    FListaExportacionrReparto:=TFListaExportacionrReparto.CreateByParametros(Application,slTemp);
    FListaExportacionrReparto.ListaRotulos.Assign(slTemp2);
    FListaExportacionrReparto.Show;
    Result:=FListaExportacionRutas;
  end;
  fExpoItinerarios.Free;
  fExpoItinerarios:=nil;
End;

Function ClientesReparto : TObject;
Begin
 fListaClienteReparto :=TfListaClienteReparto.Create(Application);
  fListaClienteReparto.Show;
 Result := fListaClienteReparto;
 End;
Function SupervisionGeneralReparto : TObject;
begin
fSupervisionGeneralR := TfSupervisionGeneralR.CreateByParametros(Application,nil);
fSupervisionGeneralR.show;
Result := fSupervisionGeneralR;
end;
Function SupervisionOnlineReparto : TObject;
begin
fSupervisionOnlineR := TfSupervisionOnlineR.Create(Application);
fSupervisionOnlineR.show;
Result := fSupervisionOnlineR;
end;
Function ControlLecturas : TObject;
begin
fControlLectura := TfControlLectura.Create(Application);
fControlLectura.show;
Result := fControlLectura;
end;
Function ControlReparto : TObject;
begin
FControlReparto := TFControlReparto.Create(Application);
FControlReparto.show;
Result := FControlReparto;
end;

Function GestionarInfoTI : TObject;
begin
FGestionarInfoTI := TFGestionarInfoTI.Create(Application);
FGestionarInfoTI.show;
Result := FGestionarInfoTI;
end;
Function DashboardAvisos : TObject;
begin
FDashboardAvisos := TFDashboardAvisos.Create(Application);
FDashboardAvisos.show;
Result := FDashboardAvisos;
end;

Function DashboardResultados : TObject;
begin
FControlResultado := TFControlResultado.Create(Application);
FControlResultado.show;
Result := FControlResultado;
end;

Function SupervisionOnlineODS : TObject;
begin
fSupervisionODS := TfSupervisionODS.Create(Application);
fSupervisionODS.show;
Result := fSupervisionODS;
end;
Function listadoReporteIlegales : TObject;
begin
fListaReporteIlegales := TfListaReporteIlegales.Create(Application);
fListaReporteIlegales.show;
Result := fListaReporteIlegales;
end;
procedure GetFiltroReparto(ListaExterna : TStringList); export;
Begin
fListaClienteReparto:=TfListaClienteReparto.Create(Application);
fListaClienteReparto.Show;
end;
procedure GetFiltroSupervisionODS(ListaExterna : TStringList); export;
Begin
fSupervisionODS:=TfSupervisionODS.Create(Application);
fSupervisionODS.Show;
end;
procedure GetQueryFiltroIlegales(ListaExterna : TStringList); export;
Begin
fListaReporteIlegales:=TfListaReporteIlegales.Create(Application);
fListaReporteIlegales.Show;
end;


function VerCalendario(): TObject;
var
  qry: TQuery;
  sEsquema,sUsuario,sContrasena,sServidor:String;
begin
  qry:=TQuery.Create(nil);
  qry.DatabaseName:='BaseDato';
  qry.SQL.Clear;
  qry.SQL.Text:='SELECT SYS_CONTEXT(''USERENV'', ''CURRENT_SCHEMA'')  FROM DUAL';
  qry.Open;
  sEsquema:=qry.Fields[0].AsString;
  sUsuario:=qry.Database.Params.Values['USER NAME'];
  sContrasena:=qry.Database.Params.Values['PASSWORD'];
  sServidor:=qry.Database.Params.Values['SERVER NAME'];
  qry.Close;
  qry.Free;
  VerCalendarioLecturas(sUsuario,sContrasena,sServidor,sEsquema);
End;


exports
  InitApp, RestoreApp, SetPosReporte,
   SetTipoElemento,
   TramosInterruptor,
    ODTElemento,
  VerOdtHija,
   VerReporte,
   ElementoFallaReporte;
var query:tquery;
Begin
  dClassDll := TdClassDll.Create;
  dClassDll.Version := 0.1;
  dClassDll.AddFuncion('&Gestión Comercial',        // Caption del Menú o Proceso
          'Servicio Administrativo y de Atención al Cliente', // Hint
          '',                                         // Extensiones de archivos asociados si los hay
          '',                                         // Nombre del Objeto del Menu Papa si lo hay
          'SGDAdministrativo1',                       // Nombre del Objeto de Menú, vacio para procesos
          '',                                         // Nombre de la imagen bitmap asociada, debe estár en el res del dll
          Nil);                                       // Puntero a la función que se ejecuta Nil para procesos
    //  dClassDll.AddFuncion( 'Lectura y Facturación','Facturación','','SGDAdministrativo1','SGDLecturas','BMPLECTURAS', Nil);
        dClassDll.AddFuncion( 'Exportación de Itinerarios','Exportación de Itinerarios','','SGDAdministrativo1','SGDExporIti','BMPEXPOITINERARIOS', ListaExportacionItinerarios);

     //   dClassDll.AddFuncion( 'Calendario de Lecturas','Calendario de Lecturas','','SGDAdministrativo1','SGDCalnLect','BMPCALENDARIO', VerCalendario);
    //       dClassDll.AddFuncion( 'Descargue de Información Comercial','Generación de Archivos de Información Comercial','','SGDAdministrativo1','SGDDescargaInfoComercial','BMPDESCARGAINFOCOMERCIAL', DescargaInfoComercial);
      dClassDll.AddFuncion( 'Reportes','Reportes','','SGDAdministrativo1','SGDReporte','BMPREPORTE', Nil);
        dClassDll.AddFuncion( 'Nuevo Reporte','Nuevo Reporte de Daños','','SGDReporte','SGDNuevoReporte','BMPNUEVOREPORTE', NuevoReporte);
         dClassDll.AddFuncion( 'Listado de Reportes','Listado de Reportes','','SGDReporte','SGDListadoReporte','BMPLISTAREPORTES', ListadoReporte);
          dClassDll.AddFuncion( 'Supervisión Online ODS','Supervisión Online ODS','','SGDReporte','SGDSupervisionODT','BMPREGISTRARMTTO', SupervisionOnlineODS);
           dClassDll.AddFuncion( 'Stock de Materiales','','Stock de Materiales','SGDReporte','SGDGrupoTrabajo3','BMPSTOCKMATERIALES', StockGrupoTrabajo);
        dClassDll.AddFuncion( 'Movimientos Stock de Materiales','','Movimientos Stock de Materiales','SGDReporte','SGDGrupoTrabajo4','BMPSTOCKMATERIALES', MaterialesStockGrupoTrabajo);

  //      dClassDll.AddFuncion( 'Listado de Reportes Estado','Listado de Reportes Estado','','SGDReporte','SGDListadoReporte2','BMPLISTAREPORTEESTADO', ListadoReporteEstado);
        dClassDll.AddFuncion( 'Cargue OS Comercial','Cargue OS Comercial','','SGDReporte','SGDListadoReporte3','ListadoReporte', CargaExcelBase);
      dClassDll.AddFuncion( 'Ordenes de Trabajo','Ordenes de Trabajo','','SGDAdministrativo1','SGDODT','BMPLISTAREPORTES', Nil);
   //     dClassDll.AddFuncion( 'Crear ODT','Crear ODT','','SGDODT','SGDODTNueva','BMPCREARODT', CrearOdt);
        dClassDll.AddFuncion( 'Listado de ODT','Listado de ODT','','SGDODT','SGDODTListado','BMPLISTAREPORTES', ListaODTUrbanaRural);

       // dClassDll.AddFuncion( 'Listado de Cambios de Infraestructura','','Listado de Cambios de Infraestructura','SGDODT','SGDODTInfraestructura','BMPLISTAINFRAESTRUCTURA',ListaGestionInfraestructura);
      //  dClassDll.AddFuncion( 'Reabrir a ODTs','Reabrir a ODTs','','SGDODT','SGDODTAuditoria','BMPREGISTRARMTTO', AuditoriaOdt);
    //    dClassDll.AddFuncion( 'Reabrir a ODTs Hijas','Reabrir a ODTs Hijas','','SGDODT','SGDODTHijaAuditoria','BMPREGISTRARMTTO', AuditoriaOdthija);
      //  dClassDll.AddFuncion( 'Rehabilitar Cobros','Rehabilitar Cobros Viáticos y Auxilios','','SGDODT','SGDODTRehabilitaCobros','BMPIMPRESIONCOBRO', RehabilitarCobros);
        //dClassDll.AddFuncion( 'Procesar Asignaciones','Procesar Asignaciones Pendientes','','SGDODT','SGDODTProcesarAsignaciones','BMPIMPRESIONCOBRO', ProcesarAsignaciones);

      //dClassDll.AddFuncion( 'Contratos','Contratos','','SGDAdministrativo1','SGDContrato','BMPCONTRATO', Nil);
        dClassDll.AddFuncion( 'Listado de Contratos','Listado de Contratos','','SGDContrato','SGDContrato1','BMPCONTRATO', ListaContratoDistribucion);
      dClassDll.AddFuncion( 'Lectores','','Lectores','SGDAdministrativo1','SGDGrupoTrabajo1','BMPGRUPOTRABAJO', Nil);
        dClassDll.AddFuncion( 'Lectores','','Lectores','SGDGrupoTrabajo1','SGDGrupoTrabajo2','BMPGRUPOTRABAJO', ListaGrupoTrabajo);
         dClassDll.AddFuncion( 'Asignación De Lectores','Asignación De Lectores','','SGDGrupoTrabajo1','SGDAsignarGrupoTrabajo','BMPLECTURAS', Lectores);
        //Interfaz OW

  //    dClassDll.AddFuncion( 'Programación de Turnos','','Lectores','SGDAdministrativo1','SGDProgramaciones1','BMPPROGRAMACION',Nil);
        dClassDll.AddFuncion( 'Crear Programaciones','','Crear Programaciones','SGDProgramaciones1','SGDProgramaciones2','BMPPROGRAMACION', CrearProgramaciones);
        dClassDll.AddFuncion( 'Generar Programaciones','','Generar Programaciones','SGDProgramaciones1','SGDProgramaciones3','BMPGENERARPROGRAMACION', GenerarProgramacion);
    //  dClassDll.AddFuncion( 'Horas Extras','','Horas Extras','SGDAdministrativo1','SGDHorasExtras1','BMPEXTRAS',Nil);
        dClassDll.AddFuncion( 'Liquidar Extras y Recargos','','Liquidar Extras y Recargos','SGDHorasExtras1','SGDHorasExtra2','BMPEXTRAS', LiquidarExtrasRecargos);
        dClassDll.AddFuncion( 'Reabrir Planilla Extras y Recargos','Reabrir Planilla Extras y Recargos','','SGDHorasExtras1','SGDODTReabrirExtras','BMPREGISTRARMTTO', ReabrirPlanillaExtras);
      //dClassDll.AddFuncion( 'Gestión de Cartas','','Registro Carta','SGDAdministrativo1','SGDcarta','BMPCARTA', Nil);
        dClassDll.AddFuncion( 'Listado de Cartas','Listado de Cartas','','SGDcarta','SGDListadoCarta','BMPCARTA', ListaCarta);

   //CargaInfoCOmercial
      dClassDll.AddFuncion( 'Cargue de Información Comercial','Cargue de Información Comercial','','SGDAdministrativo1','SGDCargueInfoComercial','BMPCARGAINFOCOMERCIAL', CargaInfoComercial);

     dClassDll.AddFuncion( 'Cargue de Backups y Fotos','Cargue de Backups y Fotos','','SGDAdministrativo1','SGDCargueLecturasFTP','BMPPRESUPUESTO', CargarLecturasFTP);
      dClassDll.AddFuncion( 'Gestión de Información de Lectura','Gestión de Información de Lectura','','SGDAdministrativo1','SGDCargueInfoLecturas','BMPREGISTROEVENTO', CargarInfoLecturas);
      dClassDll.AddFuncion( 'Cargue Manual de Lecturas','Cargue Manual de Lecturas','','SGDAdministrativo1','SGDCargueManualLectura','BMPREGISTROEVENTO', CargueManualLectura);

        // critica
        dClassDll.AddFuncion( 'Supervisión  y Crítica','','Facturación Critica','SGDAdministrativo1','SGDCritica1','BMPPROGRAMACION',Nil);
        dClassDll.AddFuncion( 'Supervisión Online','','Critica','SGDCritica1','SGDHCritica1','BMPREGISTRARMTTO', ListaDeLecturas);
        dClassDll.AddFuncion( 'Crítica de Lecturas','','CriticaFacturacion','SGDCritica1','SGDHCritica2','BMPPROGRAMACION', ListaDeCritica);
        dClassDll.AddFuncion( 'Supervisión General','','Supervision General','SGDCritica1','SGDHCritica3','BMPREGISTRARMTTO', ListaDeLecturasGeneral);
         dClassDll.AddFuncion( 'Control General de Lecturas','','Control General de Lecturas','SGDCritica1','SGDHCritica4','BMPREGISTRARMTTO', ControlLecturas);

      //reparto
      dClassDll.AddFuncion( 'Reparto','','Listado de clientes de reparto','SGDAdministrativo1','SGDReparto','BMPPROGRAMACION',Nil);
      dClassDll.AddFuncion( 'Clientes de Reparto','','Clientes para reparto de facturas','SGDReparto','','BMPPROGRAMACION',ClientesReparto);
      dClassDll.AddFuncion( 'Asignación de inspectores de Reparto','','Asignación de inspectores de Reparto','SGDReparto','SGDReparto1','BMPLECTURAS',InspectorDeReparto);
      dClassDll.AddFuncion( 'Exportación de itinerario de Reparto','','Exportación de itinerario de Reparto','SGDReparto','SGDReparto2','BMPEXPOITINERARIOS',ListaExportacionItinerariosReparto);
      dClassDll.AddFuncion( 'Supervisión General de Reparto','','Supervisión General de Reparto','SGDReparto','SGDReparto3','BMPREGISTRARMTTO',SupervisionGeneralReparto);
      dClassDll.AddFuncion( 'Supervisión Online de Reparto','','Supervisión Online de Reparto','SGDReparto','SGDReparto4','BMPREGISTRARMTTO',SupervisionOnlineReparto);
      dClassDll.AddFuncion( 'Control de Reparto','','Control de Reparto','SGDReparto','SGDReparto5','BMPREGISTRARMTTO',ControlReparto);
       // dClassDll.AddFuncion( 'Reabrir Planilla Extras y Recargos','Reabrir Planilla Extras y Recargos','','SGDHorasExtras1','SGDODTReabrirExtras','BMPREGISTRARMTTO', ReabrirPlanillaExtras);
      //dClassDll.AddFuncion( 'Gestión de Cartas','','Registro Carta','SGDAdministrativo1','SGDcarta','BMPCARTA', Nil);
       // dClassDll.AddFuncion( 'Listado de Cartas','Listado de Cartas','','SGDcarta','SGDListadoCarta','BMPCARTA', ListaCarta);
       ///---------avisos y consultas-------------------
       dClassDll.AddFuncion( 'Avisos y Consultas','','Avisos y Consultas','SGDAdministrativo1','SGDAvisosyConsultas','BMPPROGRAMACION',Nil);
       dClassDll.AddFuncion( 'Gestionar información de Interfaz ','','Gestionar información de Interfaz ','SGDAvisosyConsultas','SGDAvisosyConsultas1','BMPPROGRAMACION', GestionarInfoTI);
        dClassDll.AddFuncion( 'Dashboard de Avisos y Consultas','','Dashboard de Avisos y Consultas ','SGDAvisosyConsultas','SGDAvisosyConsultas2','BMPREGISTRARMTTO', DashboardAvisos);
        dClassDll.AddFuncion( 'Dashboard de Resultados','','Dashboard de Resultados ','SGDAvisosyConsultas','SGDAvisosyConsultas3','BMPREGISTRARMTTO', DashboardResultados);
       ///------------------------------------------------

       dClassDll.AddFuncion( 'Reporte de Conexiones ilegales','',' Reporte de ilegales','SGDAdministrativo1','SGDIlegales','BMPPROGRAMACION',Nil);
       dClassDll.AddFuncion( 'Listado de reporte de Conexiones ilegales','','Listado de reporte de Conexiones ilegales','SGDIlegales','SGDIlegales1','BMPREGISTRARMTTO',listadoReporteIlegales);



//**********************************REGISTRO HOJA DE VIDA DE EQUIPOS
      //dClassDll.AddFuncion( 'Hoja Vida Equipos','Registrar Hoja Vida Equipos','','SGDAdministrativo1','SGDHojaVidaEquipos2','BMPREGISTRARMTTO', Nil);
      //dClassDll.AddFuncion( 'Registrar Mantenimiento','Registrar Mantenimiento','','SGDHojaVidaEquipos2','SGDRegistrarMantenimiento','BMPREGISTRARMTTO', ListaFormatoDatos);
      dClassDll.AddFuncion( 'Resultados Mantenimiento','Resultados Mantenimiento','','SGDHojaVidaEquipos2','SGDHojaVidaEquipos','BMPHOJAVIDAEQUIPO', HojaVidaEquipo);
      dClassDll.AddFuncion( 'Generar Formatos de Campo','Generar Formatos de Campo','','SGDHojaVidaEquipos2','SGDGenerarFormatosCampo','BMPHOJAVIDAEQUIPO', GenerarFormatoVacio);
      dClassDll.AddFuncion( 'Hoja de Vida Equipos','Hoja de Vida Equipos','','SGDHojaVidaEquipos2','SGDHojaVidaEquiposSerial','BMPHOJAVIDAEQUIPO', HojaVidaEquipoSerial);
      dClassDll.AddFuncion( 'Consulta de Resultados','Consulta de Resultados','','SGDHojaVidaEquipos2','SGDConsultaResultados','BMPHOJAVIDAEQUIPO', ConsultaResultados);


//********************************** REGISTRO PROGRAMACION DE MANTENIMIENTOS
      //dClassDll.AddFuncion( 'Mantenimiento Equipos','Mantenimiento Equipos','','SGDAdministrativo1','SGDMantenimiento','BMPPROGRAMACIONMTTO', Nil);
      dClassDll.AddFuncion( 'Programacion Mantenimientos','Programacion Mantenimientos','','SGDMantenimiento','SGDProgramacionMantenimiento','BMPPROGRAMACIONMTTO', Cronograma);
      dClassDll.AddFuncion( 'Generar ODT ','Generar ODT','','SGDMantenimiento','SGDGenerarODT','BMPPROGRAMACIONMTTO', ODTMantenimientos);
      //dClassDll.AddFuncion( 'Mantenimientos Anteriores ','Mantenimientos Anteriores','','SGDMantenimiento','SGDMantenimientoAnterior','BMPPROGRAMACIONMTTO', nil);
      //dClassDll.AddFuncion( 'Registrar Mantenimientos Anteriores ','Registrar Mantenimientos Anteriores','','SGDMantenimientoAnterior','SGDRegistrarMantenimientoAnterior','BMPPROGRAMACIONMTTO', ListaRegistrarMantenimientos);
      dClassDll.AddFuncion( 'Consultar Mantenimientos ','Consultar Mantenimientos','','SGDMantenimiento','SGDConsultarMantenimiento','BMPPROGRAMACIONMTTO', ConsultarMttosElemento);
      dClassDll.AddFuncion( 'Consultar Mantenimientos Reprogramados','Consultar Mantenimientos Reprogramados','','SGDMantenimiento','SGDConsultarMantenimientoReprogramado','BMPPROGRAMACIONMTTO', ConsultarMttoReprogramado);
//********************************** FIN MANTENIMIENTOS ****************************************//

//Procesos

//  dClassDll.AddFuncion('_Reliquidar Extras y Recargos', 'Permiso para Reliquidar', '', 'SGDMaestros2', '_procReliquidar', '', Nil);
    dClassDll.AddFuncion('_Ocultar Odt Extras', 'Permiso Extras', '', 'SGDODT', '_ProcOcultar_OdtExtra', '', Nil);
    dClassDll.AddFuncion('_Ocultar Odt Viaticos/Auxilios', 'Permiso viáticos y auxilios', '', 'SGDODT', '_ProcOcultar_OdtViaticoAuxilio', '', Nil);
    dClassDll.AddFuncion('_Ocultar Odt Almacen', 'Permiso Extras', '', 'SGDODT', '_ProcOcultar_OdtAlmacen', '', Nil);
    dClassDll.AddFuncion('_Aprobar ODT hija CIRE', 'Aprobar ODT hija CIRE', '', 'SGDODT', '_ProcAprobar_CIRE','', nil);
    dClassDll.AddFuncion('_Bloquear edicion de reportes', 'Bloquear edición de Reportes de Daños', '', 'SGDReporte', '_proc1','', nil);
    dClassDll.AddFuncion('_Permitir editar reportes reparados', 'Permitir editar reportes en estado REPARADO', '', 'SGDReporte', '_proc2','', nil);
    dClassDll.AddFuncion('_Permitir Asignar Analistas', 'Asignar analistas para el proceso de crítica', '', 'SGDAdministrativo1', '_proc3','', nil);
    dClassDll.AddFuncion('_Director Critica', 'Director para el proceso de crítica', '', 'SGDAdministrativo1', '_proc2','', nil);
    dClassDll.AddFuncion('_Horarios inCMS', 'Horarios de generación de cargue de información de lecturas a inCMS', '', 'SGDAdministrativo1', '_proc2','', nil);
    dClassDll.AddFuncion('_Asignar Inspectores de Reparto', 'Asignar Inspectores de Reparto', '', 'SGDAdministrativo1', '_proc10','', nil);
    dClassDll.AddFuncion('_Exportar Itinerarios de Reparto', 'Exportar itinerarios de Reparto', '', 'SGDAdministrativo1', '_proc11','', nil);


    end.



