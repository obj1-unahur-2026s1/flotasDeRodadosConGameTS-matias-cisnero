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
    method velocidad() = motor.capacidad()
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

class AutosEspeciales {
    
}