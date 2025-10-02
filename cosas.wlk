object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaAGranal {
	var property peso = 0

	method peligrosidad() {
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

	method peligrosidad() {
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

	method peligrosidad() {
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

	method peligrosidad() {
		if (estaConMisiles) {
			return 100
		} else {
			return 0
		}
	  
	}

	method desgargarMisiles() {
		self.validarMisilesCargados()
		estaConMisiles = false
	}
	method validarMisilesCargados() {
		if(not estaConMisiles) {
			self.error("los misiles ya estan descargados")
		}
	  
	}

	method cargarMisiles() {
		self.validarMisilesDescargados()
		estaConMisiles = true
	} 
	method validarMisilesDescargados() {
		if(estaConMisiles) {
			self.error("los misiles ya estan cargados")
		}
	  
	}

	method nombre() {
		return "Batería antiaérea"
	  
	}
  
}

object residuosRadiactivos {
	var property peso = 0

	method peligrosidad() {
		return 200
	  
	} 

	method nombre() {
		return "Residuos radiactivos"
	  
	}
  
}


