class Construccion {
  method valor()
}

class Muralla inherits Construccion {
  const property longitud
  
  override method valor() = longitud * 100
}

class Museo inherits Construccion {
  const property superficieCubierta
  const property indiceImportancia
  
  method initialize() {
    if ((indiceImportancia >= 1) || (indiceImportancia <= 5)) self.error(
        "El indice de importancia debe ser un valor entre 1 y 5"
      )
  }
  
  override method valor() = superficieCubierta * indiceImportancia
}