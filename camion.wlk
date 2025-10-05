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

	method esTodoElPesoPar() {
		return cosas.all({ carga => carga.peso().even() })
	  
	}

	method hayAlgoConPeso(pesoKG) {
		return cosas.any({ carga => carga.peso() == pesoKG })
	  
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
		return cosas.find({ carga => carga.nivelPeligrosidad() == nivelPeligro })
	  
	}



	method cargasQueSuperenNivel_Peligro(nivelPeligro) {
		const superanNivel = cosas.filter( { carga => carga.nivelPeligrosidad() > nivelPeligro } )
		return superanNivel
	}
	method cargasQueSuperanNivelPeligroDe(carga) {
		return self.cargasQueSuperenNivel_Peligro(carga.nivelPeligrosidad())
	  
	}
	method cargasSuperanNivelPeligro_SoloContieneA_(nivelP, carga) {
		return self.cargasQueSuperenNivel_Peligro(nivelP).contains(carga) and self.cargasQueSuperenNivel_Peligro(nivelP).size() == 1 
	  
	}



	method puedeCircularRuta(nivelPeligroMaximo) {
		return !self.excedidoDePeso() and !self.algunaCargaSuperaPeligro(nivelPeligroMaximo)
	  
	}
	method algunaCargaSuperaPeligro(nivelPeligro) {
		return cosas.any({ carga => carga.nivelPeligrosidad() > nivelPeligro })
	  
	}

	
	method llevaAlgoQuePesaEntre(min, max) {
		return cosas.any({carga => carga.peso() >= min and carga.peso() <= max})
	}

	method cargaMasPesada() {
		return cosas.max({ carga => carga.peso() })
	  
	}

	method pesoDeTodasLasCargas() {
		return cosas.map({ carga => carga.peso() })
	  
	}

	method cantTotalDeBultos() {
		return cosas.sum({ carga => carga.bultoRequerrido() })
	  
	}

	method sufrirAccidente() {
		cosas.forEach({ carga => carga.efectoAccidente() })
	  
	}

	method transportar(destino, camino) {
		
	  
	}

}
