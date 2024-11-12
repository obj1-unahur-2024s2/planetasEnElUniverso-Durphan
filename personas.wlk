import regiones.*

class Persona {
  var monedas = 20
  var edad
  
  method recursos() = monedas
  
  method esDestacado() = ((edad <= 18) || (edad >= 65)) || (self.recursos() < 30)
  
  method ganarMonedas(cantidad) {
    monedas += cantidad
  }
  
  method gastarMonedas(cantidad) {
    monedas = 0.max(monedas - cantidad)
  }
  
  method cumplirAnios() {
    edad += 1
  }
}

class Productor inherits Persona {
  const property tecnicas
  
  override method recursos() = monedas * tecnicas.size()
  
  override method esDestacado() = super() || (tecnicas.size() > 5)
  
  method realizarTecnicaDurante(tecnica, tiempo) {
    if (tecnicas.contains(tecnica)) self.ganarMonedas(3 * tiempo)
    else self.gastarMonedas(1)
  }
  
  method aprenderTecnica(tecnica) {
    tecnicas.add(tecnica)
  }
  
  method trabajarEnPlanetaDurante(planetaATrabajar, tiempo) {
    if (planetaATrabajar.habitantes().contains(self))
      self.realizarTecnicaDurante(tecnicas.last(), tiempo)
    else self.error(
        "No se puede trabajar en un planeta donde no se es habitante"
      )
  }
}

class Constructor inherits Persona {
  var cantidadConstruccionesRealizadas
  const regionDondeVive
  const property inteligencia
  
  override method recursos() = monedas + (10 * cantidadConstruccionesRealizadas)
  
  override method esDestacado() = cantidadConstruccionesRealizadas < 5
  
  method trabajarEnPlanetaDurante(planeta, tiempo) {
    cantidadConstruccionesRealizadas += 1
    self.gastarMonedas(5)
    planeta.construcciones().add(regionDondeVive.construccion(tiempo, self))
  }
}