import destinos.*
import mensajeros.*
import vehiculos.*
import empresa.*
object paquete{
  var estaPago = true
  var destino = puenteDeBrooklyn
  var mensajero = neo

  
  method puedeSerEntregado(unMensajero){
      return destino.puedePasar(unMensajero) && estaPago
  }
  method precioFinal(){
      return 50
  }
  method cambiarPago(unPago) {
      estaPago = unPago
  }
  method estadoDePago(){
      return estaPago
  }
  method cambiarMensajero(unMensajero) {
      mensajero = unMensajero
  }
  method verMensajero() {
      return mensajero
  }
  method cambiarMensajeroDestinoYPago(unMensajero, unDestino, unPago) {
      self.cambiarMensajero(unMensajero)
      self.cambiarDestino(unDestino)
      self.cambiarPago(unPago)
  }
  method cambiarDestino(unDestino) {
      destino = unDestino
  }
  method verDestino() {
      return destino
  }
}

object paquetito{
  method puedeSerEntregado(unMensajero){
      return true
  }
  method precioFinal(){
      return 0
  }
}

object paquetonViajero{
  const destinos = []
  var pagado = 0

  method puedeSerEntregado(unMensajero){
      return (pagado >= self.precioFinal()) && destinos.all({destino => destino.puedePasar(unMensajero)})
  }
  method precioFinal(){
      return destinos.size() * 100
  }
  method pagoParcial(unPago){
      pagado = pagado + unPago
  }
  method agregarDestino(unDestino){
      destinos.add(unDestino)
  }
}
object paqueteGigante{
  const paquetes = []
  method puedeSerEntregado(unMensajero){
      return paquetes.all({unPaquete => unPaquete.puedeSerEntregado(unMensajero)})
  }
  method precioFinal(){
      return paquetes.sum({unPaquete => unPaquete.precioFinal()}) - (paquetes.size() * 10)
  }
  method agregarPaquete(unPaquete){
      paquetes.add(unPaquete)
  }
  
}

/*
object paquete {
  var property estaPago = true 
  var mensajero = neo
  var property destino = puenteDeBrooklyn

  method setMensajero(unMensajero) {
    mensajero = unMensajero
  }

  method puedeSerEntregado(unMensajero) {
    return destino.puedePasar(unMensajero) && estaPago
  }
}

object paquetito {
    method puedeSerEntregado(unMensajero) {
      return true
    }
}

object paquetonViajero {
  const property destinos = []
  var pagado = 0

    method precioFinal() {
      return destinos.size() * 100 + 50
    }

    method pagoParcial(unPago) {
      pagado = pagado + unPago
    }

    method puedeSerEntregado(unMensajero) {
      return (self.precioFinal() == pagado) && destinos.all({destino => destino.puedePasar(unMensajero)})
    }
}

// destinos

object puenteDeBrooklyn {
  method puedePasar(unMensajero) {
    return unMensajero.peso() <= 1000 
  }
}

object matrix {
  method puedePasar(unMensajero) {
    return unMensajero.puedeLlamar()
  }
}

//mensajeros

object roberto {
  var peso = 0
  var transporte = camion

  method transporte(unTransporte){
    transporte = unTransporte
  }
  method setPeso(unPeso) {
    peso = unPeso
  }
  method peso() = transporte.peso() + peso
  method puedeLlamar() = false
}

object chuckNorris {
  method peso() = 80
  method puedeLlamar() = true
}

object neo {
  var credito = false
  method setCredito(unCredito) {
    credito = unCredito
  }
  method peso() = 0
  method puedeLlamar() = self.tieneCredito()
  method tieneCredito() = true //cuando tiene credito
}

//transporte
object bicicleta {
  method peso() = 5
}

object camion {
  var property cantidadDeAcoplados = 0
  method peso() = cantidadDeAcoplados * 1000
}

object empresa {
    var recaudado = 0
    const mensajeros = #{}
    method contratarMensajero(unMensajero) {
        mensajeros.add(unMensajero)
    }
    method despedirMensajero(unMensajero) {
        mensajeros.remove(unMensajero)
    }
    method despedirATodosLosMensajeros() {
        mensajeros.removeAll(mensajeros)  
    }
    method laMensajeriaEsGrande() {
        return mensajeros.size() > 1
    }
    method paquetePuedeSerEntregadoPorElPrimerMensajero(unaColeccion) {
        const lista = unaColeccion.asList()
        return paquete.puedeSerEntregado(lista.first())
    }
    method pesoUltimoMensajero(unaColeccion) {
        const lista = unaColeccion.asList()
        return lista.last().peso()
    }

    method puedeSerEntregado(unPaquete) {
        mensajeros.any({paquete => paquete.puedeSerEntregado()})
    }

    method todosLosMensajerosPuedenLlevarElPaquete(unPaquete) {
        return mensajeros.filter { mensajero => unPaquete.puedeSerEntregado(mensajero)}
    }

}*/