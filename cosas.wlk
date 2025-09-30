object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object arenaAGranal {
	var property peso = 0

	method peligrosidad() {
		return 1
	  
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


  
}

object bateriaAntiaerea {
	var property estaConMisiles = true

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
  
}

object residuosRadiactivos {
	var property peso = 0

	method peligrosidad() {
		return 200
	  
	} 
  
}


