import construcciones.*

class Region {
  method construccion(horas, constructor)
}

object montania inherits Region {
  override method construccion(horas, constructor) = new Muralla(
    longitud = horas / 2
  )
}

object costa inherits Region {
  override method construccion(horas, constructor) = new Museo(
    superficieCubierta = horas,
    indiceImportancia = 1
  )
}

object llanura inherits Region {
  override method construccion(
    horas,
    constructor
  ) = if (constructor.esDestacado()) {
    new Museo(
      superficieCubierta = horas,
      indiceImportancia = constructor.recursos() / 10
    )
  } else {
    new Muralla(longitud = horas / 2)
  }
}

object isla inherits Region {
  override method construccion(
    horas,
    constructor
  ) = if (constructor.inteligencia() > 5) {
    new Muralla(longitud = horas / 2)
  } else {
    new Museo(superficieCubierta = horas, indiceImportancia = 1)
  }
}