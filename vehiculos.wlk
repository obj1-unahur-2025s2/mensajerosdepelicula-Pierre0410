import empresa.*
import mensajeros.*
import destinos.*

object bicicleta {
  method peso() {
    return 5
  }
  
}

object camion{
    var cantidadDeAcoplado = 0
    method peso() {
        return 500 * cantidadDeAcoplado
    }
    method cambiarAcoplados(unaCantidad){
        cantidadDeAcoplado += unaCantidad
    }
    
}
