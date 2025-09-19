import empresa.*
import mensajeros.*
import vehiculos.*
import paquetes.*
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