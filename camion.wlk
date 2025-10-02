import cosas.*

object camion {
	const tara = 1000
	const property cosas = #{}
	const pesoMaximoAceptable = 2500
		
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
	method pesoTotal() {
		return tara + self.pesoCargado()
	  
	}

	method pesoCargado() {
		return cosas.sum( { n => n.peso() } )
	  
	}

	method excedidoDePeso() {
		return self.pesoTotal() >  pesoMaximoAceptable
	  
	}


	method objetoConNivelDePeligrosidad(nivelPeligro) {
		self.validarCargaConPeligrosidad(nivelPeligro)
		return cosas.find({ carga => carga.nivelPeligrosidad() == nivelPeligro })
	  
	}
	method validarCargaConPeligrosidad(peligro) {
		if(not (cosas.any({ carga => carga.nivelPeligrosidad() == peligro }))) {
			self.error("no hay carga con este nivel de peligro")
		}
	  
	}


	method cargasQueSuperenNivel_Peligro(nivelPeligro) {
		const superanNivel = cosas.filter( { carga => carga.nivelPeligrosidad() > nivelPeligro } )
		return superanNivel
	}

	method cargasQueSuperanNivelPeligroDe(carga) {
		return self.cargasQueSuperenNivel_Peligro(carga.nivelPeligrosidad())
	  
	}


	method puedeCircularRuta(nivelPeligroMaximo) {
		return !self.excedidoDePeso() and !self.algunaCargaSuperaPeligro(nivelPeligroMaximo)
	  
	}
	method algunaCargaSuperaPeligro(nivelPeligro) {
		return cosas.any({ carga => carga.nivelPeligrosidad() > nivelPeligro })
	  
	}


}
