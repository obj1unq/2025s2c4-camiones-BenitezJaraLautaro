object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10

	method bultoRequerrido() {
		return 1
	  
	}

	method efectoAccidente() {
		null
	}
}

object arenaAGranal {
	var property peso = 0
	
	method nivelPeligrosidad() = 1

	method bultoRequerrido() {
		return 1
	  
	}

	method efectoAccidente() {
		peso = peso + 20
	  
	}
	
}

object bumblebee {

	var property estaTransformadoEnAuto = true
	
	method peso() = 800
	
	method nivelPeligrosidad() {
		if (estaTransformadoEnAuto) {
			return 15
		} else {
			return 30
		}
	}
	
	method transformarEnRobot() {
		estaTransformadoEnAuto = false
	}
	
	method transformarEnAuto() {
		estaTransformadoEnAuto = true
	}

	method bultoRequerrido() {
		return 2
	  
	}

	method efectoAccidente() {
		if (estaTransformadoEnAuto) {
			self.transformarEnRobot()
		} else {
			self.transformarEnAuto()
		}
	  
	}
	
}

object paqueteDeLadrillos {
	const pesoPorLadrillo = 2
	var property cantLadrillos = 0
	
	method peso() = cantLadrillos * pesoPorLadrillo
	
	method nivelPeligrosidad() = 2

	method bultoRequerrido() {
		if (cantLadrillos <= 100) {
			return 1
		} else {
			if (cantLadrillos <=300) {
				return 2
			} else {
				return 3
			}
		}
	  
	}

	method efectoAccidente() {
		cantLadrillos = cantLadrillos - 12
		cantLadrillos = 0.max(cantLadrillos)
	  
	}
	
}

object bateriaAntiaerea {
	var property estaConMisiles = false
	
	method peso() {
		if (estaConMisiles) {
			return 300
		} else {
			return 200
		}
	}
	
	method nivelPeligrosidad() {
		if (estaConMisiles) {
			return 100
		} else {
			return 0
		}
	}
	
	method desgargarMisiles() {
		estaConMisiles = false
	}
	
	method cargarMisiles() {
		estaConMisiles = true
	}

	method bultoRequerrido() {
		if(not estaConMisiles) {
			return 1
		} else {
			return 2
		}
	  
	}

	method efectoAccidente() {
		self.desgargarMisiles()
	  
	}
	
}

object residuosRadiactivos {

	var property peso = 0
	
	method nivelPeligrosidad() = 200

	method bultoRequerrido() {
		return 1
	  
	}

	method efectoAccidente() {
		peso = peso + 15
	  
	}
	
}

object contenedorPortuario {
	const pesoVacio = 100
	const property cosasDentro = #{}
	const bultoQueRequiere = 1
	
	method peso() = pesoVacio + cosasDentro.sum({ cosa => cosa.peso() })
	
	method nivelPeligrosidad() {
		if (cosasDentro.isEmpty()) {
			return 0
		} else {
			return self.cargadoMasPeligroso(cosasDentro).nivelPeligrosidad()
			//Si se activa el else ya tengo asegurado que no es vacio
		}
	}

	method cargarObjeto(objeto) {
		cosasDentro.add(objeto)
	}

	method cargadoMasPeligroso(objetosCargados) {
		return cosasDentro.max({ cosas => cosas.nivelPeligrosidad() })
	  
	}

	method bultoRequerrido() {
		//Le sume como atributo para que no sea un magic number 
		return bultoQueRequiere + cosasDentro.sum({ carga => carga.bultoRequerrido() })
	  
	}

	method efectoAccidente() {
		cosasDentro.forEach({ carga => carga.efectoAccidente() })
	  
	}
	
}

object embalajeDeSeguridad {
	var property objetoEnvuelto = null

	method envolverObjeto(objeto) {
		objetoEnvuelto = objeto
	  
	}

	method peso() {
		return objetoEnvuelto.peso()
	  
	}

	method nivelPeligrosidad() {
		return objetoEnvuelto.nivelPeligrosidad()/2
	  
	}

	method bultoRequerrido() {
		return 2
	  
	}

	method efectoAccidente() {
		null
	  
	}
}
