object ruta9 {
  method cumpleCondiciones(camion) = camion.puedeCircularRuta(20)
}

object caminosVecinales {
  var property pesoMaximoPermitido = 0
  
  method cumpleCondiciones(camion) = camion.pesoTotal() <= pesoMaximoPermitido
}