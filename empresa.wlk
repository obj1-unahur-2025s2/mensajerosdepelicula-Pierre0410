import destinos.*
import mensajeros.*
import vehiculos.*
import paquetes.*

object probar{
    method ejecutar1(){
        empresa.contratarEmpleado(neo)
        empresa.contratarEmpleado(roberto)
        empresa.enviarPaquete(paquete)
    }
}
object empresa{
    const property empleados = []
    const property paquetesPendientes = []
    var  recaudado = 0
    method contratarEmpleado(unEmpleado){
        empleados.add(unEmpleado)
    }
    method despedirEmpleado(unEmpleado){
        empleados.remove(unEmpleado)
    }
    method despedirTodosLosEmpleados(){
        empleados.clear()
    }
    method mensajeriaEsGrande(){
        return empleados.size() > 2
    }
    method puedeSerEntregadoPorElPrimerMensajero(){
        return paquete.puedeSerEntregado(empleados.first())
    }
    method pesoDelUltimoMensajero(){
        return empleados.last().peso()
    }
    method algunEmpleadoPuedeEntregarElPaquete(unPaquete){
        return empleados.any({unEmpleado => unPaquete.puedeSerEntregado(unEmpleado)})
    }
    method todosLosEmpleadosQuePuedenEntregarElPaquete(unPaquete){
        return empleados.filter({unEmpleado => unPaquete.puedeSerEntregado(unEmpleado)})
    }
    method mensajeriaTieneSobrepeso(){
        return (empleados.sum({unEmpleado => unEmpleado.peso()}) / empleados.size()) > 500
    }
    method enviarPaquete(unPaquete){
        if(self.algunEmpleadoPuedeEntregarElPaquete(unPaquete)){
            // falta implementar un metodo de envio con un parametro del primer mensajero que pueda enviarlo
            recaudado = recaudado + unPaquete.precioFinal()
        }else{
            paquetesPendientes.add(unPaquete)

        }
    }
    method facturacionTotalDeLaEmpresa(){
        return recaudado
    }
    method enviarTodosLosPaquetes(unaListaDePaquetes){
        unaListaDePaquetes.forEach({unPaquete => self.enviarPaquete(unPaquete)})
    }
    method enviarPaquetePendienteMasCaroSiHay(){
        const masCaro = self.paqueteMasCaro()
        if (!paquetesPendientes.isEmpty()){
            self.enviarPaquete(masCaro)
            paquetesPendientes.remove(masCaro)
        }
    }
    method paqueteMasCaro(){
        return paquetesPendientes.max({unPaquete => unPaquete.precioFinal()})
    }
}