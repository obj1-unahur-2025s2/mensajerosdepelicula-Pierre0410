import empresa.*
import destinos.*
import vehiculos.*
import paquetes.*

object roberto{
    var property vehiculo = bicicleta
    var pesoRoberto = 0

    method peso(){ return pesoRoberto + vehiculo.peso()}
    method cambiarPeso(unPeso) { pesoRoberto = unPeso }
    method puedeLlamar(){ return false }
    method cambiarVehiculo(nuevoVehiculo) { vehiculo = nuevoVehiculo }
}

object chuckNorris{
    method peso(){ return 80 }
    method puedeLlamar(){ return true }
    
}
object neo{
    var tieneCredito = true

    method peso(){ return 0 }
    method puedeLlamar(){ return tieneCredito}
    method cambiarEstadoDeCredito(unCredito) { tieneCredito = unCredito }
    method verEstadoDeCredito() { return tieneCredito }
}

object mensajeroSecreto{
    var pesoMensajero = 0
    var transporte = camion
    var credito = true

    method peso(){ return pesoMensajero + transporte.peso() }
    method cambiarPeso(unPeso) { pesoMensajero = unPeso }
    method cambiarTransporte(nuevoTransporte) { transporte = nuevoTransporte }
    method puedeLlamar(){ 
        return credito
    }
    method cambiarCredito(unCredito) { credito = unCredito }
}