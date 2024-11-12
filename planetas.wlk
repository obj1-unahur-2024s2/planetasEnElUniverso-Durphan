class Planeta {
  const property habitantes
  const property construcciones
  
  method delegacionDiplomatica() = if (self.habitantesDestacados().contains(
                                       self.habitanteConMasRecursos()
                                     )) self.habitantesDestacados()
                                   else
                                     self.habitantesDestacados() + self.habitanteConMasRecursos()
  
  method habitantesDestacados() = habitantes.filter(
    { habitante => habitante.esDestacado() }
  )
  
  method habitanteConMasRecursos() = habitantes.max(
    { habitante => habitante.recurso() }
  )
  
  method esValioso() = construcciones.sum(
    { construccion => construccion.valor() }
  ) < 100
}