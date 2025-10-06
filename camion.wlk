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
		if (not cosas.contains(unaCosa)) self.error(
				"el camion no contiene lo que se quiere descargar"
			)
	}
	
	method esTodoElPesoPar() = cosas.all({ carga => carga.peso().even() })
	
	method hayAlgoConPeso(pesoKG) = cosas.any({ carga => carga.peso() == pesoKG })
	
	method pesoTotal() = tara + self.pesoCargado()
	
	method pesoCargado() = cosas.sum({ n => n.peso() })
	
	method excedidoDePeso() = self.pesoTotal() > pesoMaximoAceptable
	
	method objetoConNivelDePeligrosidad(nivelPeligro) = cosas.find(
		{ carga => carga.nivelPeligrosidad() == nivelPeligro }
	)
	
	method cargasQueSuperenNivel_Peligro(nivelPeligro) {
		return cosas.filter(
			{ carga => carga.nivelPeligrosidad() > nivelPeligro })
	}
	
	method cargasQueSuperanNivelPeligroDe(
		carga
	) = self.cargasQueSuperenNivel_Peligro(carga.nivelPeligrosidad())
	
	method cargasSuperanNivelPeligro_SoloContieneA_(
		nivelP,
		carga
	) = self.cargasQueSuperenNivel_Peligro(nivelP).contains(
		carga
	) and (self.cargasQueSuperenNivel_Peligro(nivelP).size() == 1)
	
	method puedeCircularRuta(
		nivelPeligroMaximo
	) = (!self.excedidoDePeso()) and (!self.algunaCargaSuperaPeligro(
		nivelPeligroMaximo
	))
	
	method algunaCargaSuperaPeligro(nivelPeligro) = cosas.any(
		{ carga => carga.nivelPeligrosidad() > nivelPeligro }
	)
	
	method llevaAlgoQuePesaEntre(min, max) = cosas.any(
		{ carga => (carga.peso() >= min) and (carga.peso() <= max) }
	)
	
	method cargaMasPesada() = cosas.max({ carga => carga.peso() })
	
	method pesoDeTodasLasCargas() = cosas.map({ carga => carga.peso() })
	
	method cantTotalDeBultos() = cosas.sum({ carga => carga.bultoRequerrido() })
	
	method sufrirAccidente() {
		cosas.forEach({ carga => carga.efectoAccidente() })
	}
	
	method transportar(destino, camino) {
		if (camino.cumpleCondiciones(self)) {
			destino.cosas().addAll(cosas)
			cosas.clear()
		}
	}
}