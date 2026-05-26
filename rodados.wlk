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

