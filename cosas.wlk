object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaAGranal {
	var property peso = 0

	method nivelPeligrosidad() {
		return 1
	  
	}

	method nombre() {
		return "Arena a granel"
	  
	}
	
}

object bumblebee {
	var property estaTransformadoEnAuto = true
	method peso() {
		return 800
	  
	}

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

	method nombre() {
		return "Bumblebee"
	  
	}
  
}

object paqueteDeLadrillos {
	const pesoPorLadrillo      = 2
	var property cantLadrillos = 0

	method peso() {
		return cantLadrillos * pesoPorLadrillo
	  
	} 

	method nivelPeligrosidad() {
		return 2
	  
	}

	method nombre() {
		return "Paquete de ladrillos"
	  
	}
  
}

object bateriaAntiaerea {
	var property estaConMisiles = false

	method peso() {
		if(estaConMisiles) {
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


	method nombre() {
		return "Batería antiaérea"
	  
	}
  
}

object residuosRadiactivos {
	var property peso = 0

	method nivelPeligrosidad() {
		return 200
	  
	} 

	method nombre() {
		return "Residuos radiactivos"
	  
	}
  
}

object contenedorPortuario {
	const pesoVacio = 100
	const property cosasDentro = #{}

	method peso() {
		return pesoVacio + cosasDentro.sum({ cosa => cosa.peso() })
	}  

	method nivelPeligrosidad() {
		if(cosasDentro.isEmpty()) {
			return 0
		}else{
			return self.laCargaMasPeligrosa(cosasDentro)//Si se activa el else ya tengo asegurado que no es vacio
		}	
	}

	method laCargaMasPeligrosa(cargas) {
		var masPeligroso = cargas.get(0)
		cargas.forEach({ cosa => masPeligroso = masPeligroso.nivelPeligrosidad().max(cosa.nivelPeligrosidad()) })
		return masPeligroso
	  
	}

	method cargarObjetos(objeto) {
		cosasDentro.add(objeto)
	}
  
}


