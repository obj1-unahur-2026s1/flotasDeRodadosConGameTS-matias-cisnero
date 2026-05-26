class Corsa {
    var color = "blanco"

    method color() = color
    method capacidad() = 4
    method velocidad() = 150
    method peso() = 1300

    method pintarDe(unColor) {color = unColor}
}

class Kwid {
    var tieneTanqueAdicional

    method color() = "azul"
    method capacidad() = if(tieneTanqueAdicional) 3 else 4
    method velocidad() = if(tieneTanqueAdicional) 110 else 120
    method peso() = 1200 + if(tieneTanqueAdicional) 150 else 0

    method ponerTanqueAdicional() {tieneTanqueAdicional = true}
    method sacarTanqueAdicional() {tieneTanqueAdicional = false}
}

object trafic {
    var interior = comodo
    var motor = pulenta

    method cambiarInterior(unInterior) {interior = unInterior}
    method cambiarMotor(unMotor) {motor = unMotor}

    method color() = "blanco"
    method capacidad() = interior.capacidad()
    method velocidad() = motor.velocidad()
    method peso() = 4000 + interior.peso() + motor.peso()
}

object comodo {
    method capacidad() = 5
    method peso() = 700
}
object popular {
    method capacidad() = 12
    method peso() = 1000
}

object pulenta {
    method peso() = 800
    method velocidad() = 130 
}
object bataton {
    method peso() = 500
    method velocidad() = 80 
}

class AutoEspecial {
    const property color
    const property capacidad
    const property velocidad
    const property peso
}

class Dependencia {
    const flota = []
    const pedidos = []
    const empleados

    method agregarPedido(unPedido) {
        pedidos.add(unPedido)
    }
    method totalPasajerosEnPedidos() {
        return pedidos.sum({ p => p.cantidadDePasajeros() })
    }
    method pedidosQueNoPuedenSerSatisfechos() {
        return pedidos.filter({ p => !self.unPedidoPuedeSerSatisfechoPor(p) })
    }
    method unPedidoPuedeSerSatisfechoPor(unPedido) {
        return flota.any({ a => unPedido.puedeSatisfacerlo(a) })
    }

    method agregarAFlota(rodado) {
        flota.add(rodado)
    }
    method quitarDeFlota(rodado) {
        flota.remove(rodado)
    }
    method pesoTotalFlota() {
        return flota.sum({ r => r.peso() })
    }
    method estaBienEquipado() {
        return flota.size() >= 3 && flota.all({ r => r.velocidad() >= 100 })
    }
    method capacidadTotalEnColor(color) {
        return self.rodadosDelColor(color).sum({ r => r.capacidad() })
    }
    method rodadosDelColor(color) {
        return flota.filter({ r => r.color() == color })
    }
    method colorDelRodadoMasRapido() {
        return self.rodadoMasRapido().color()
    }
    method rodadoMasRapido() {
        return flota.max({ r => r.velocidad() })
    }
    method capacidadFaltante() {
        return empleados - flota.sum({ r => r.capacidad() })
    }
    method esGrande() {
        return empleados >= 40 && flota.size() >= 5
    }
}

class Pedido {
    const distancia
    var property tiempoMaximo
    var property cantidadDePasajeros
    const coloresIncompatibles = #{}

    method agregarColorIncompatible(unColor) {
        coloresIncompatibles.add(unColor)
    }
    method velocidadRequerida() {
        return distancia.div(tiempoMaximo)
    }
    method puedeSatisfacerlo(unAuto) {
        return unAuto.velocidad() >= self.velocidadRequerida()+10
        && unAuto.capacidad() >= cantidadDePasajeros
        && !coloresIncompatibles.contains(unAuto.color())
    }
    method acelarar() {
        tiempoMaximo = (tiempoMaximo - 1).max(0)
    }
    method relajar() {
        tiempoMaximo = tiempoMaximo + 1
    }
}