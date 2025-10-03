object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10
}

object arenaAGranal {
	var property peso = 0
	
	method nivelPeligrosidad() = 1
	
	method nombre() = "Arena a granel"
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
	
	method nombre() = "Bumblebee"
}

object paqueteDeLadrillos {
	const pesoPorLadrillo = 2
	var property cantLadrillos = 0
	
	method peso() = cantLadrillos * pesoPorLadrillo
	
	method nivelPeligrosidad() = 2
	
	method nombre() = "Paquete de ladrillos"
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
	
	method nombre() = "Batería antiaérea"
}

object residuosRadiactivos {
	var property peso = 0
	
	method nivelPeligrosidad() = 200
	
	method nombre() = "Residuos radiactivos"
}

object contenedorPortuario {
	const pesoVacio = 100
	const property cosasDentro = #{}
	
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
}
