import cosas.*

object camion {
	const tara = 1000
	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(unaCosa) {
		self.validarContiene(unaCosa)
		cosas.remove(unaCosa)
	  
	}
	method validarContiene(unaCosa) {
		if (not (cosas.contains(unaCosa))) {
			self.error("el camion no contiene lo que se quiere descargar")
		}
	}
}
