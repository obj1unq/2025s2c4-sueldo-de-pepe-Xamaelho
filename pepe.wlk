object pepe {
	var property categoria = cadete
    var property bonoResultado = bonoPorPorcentaje
    var property bonoPresentismo = bonoPresentismoNormal
    var property diasAusente = 0

    method neto() = categoria.neto()
    method sueldo() = self.neto() + bonoResultado.bono(self) + bonoPresentismo.bono(self, diasAusente)
    
    method categoria(nuevaCat) {
        categoria = nuevaCat
    }
    method bonoResultado(nuevoBono) {
      bonoResultado = nuevoBono
    }
    method bonoPresentismo(nuevoBono) {
      bonoPresentismo = nuevoBono
    }
    method diasAusente(cantidad) {
      diasAusente = cantidad
    }
}
// ############################ BONOS DE PRESENTISMO ##########################
object bonoPresentismoNormal {
    method bono(empleado, diasAusente) {
        var bono = 0
        if (diasAusente == 0) {
            bono = 2000
        } else if (diasAusente == 1) {
            bono = 1000
        }
        return bono 
    }
}
object bonoPresentismoAjuste {
    method bono(empleado, diasAusente) {
        var bono = 0
        if (diasAusente == 0) {
            bono = 100
        }
        return bono
    }
}
object bonoPresentismoDemagogico {
    method bono(empleado, diasAusente) {
        var bono = 0
        if (empleado.neto() < 18000) {
            bono = 500
        } else {
            bono = 300
        }
        return bono
    }
}
object bonoPresentismoNulo {
    method bono(empleado, diasAusente) = 0
}
// ####################### BONOS POR RESULTADOS ##############################
object bonoPorPorcentaje {
    method bono(empleado) = empleado.neto() * 0.1
}
object bonoPorMontoFijo {
    method bono(empleado) = 800
}
object bonoResultadoNulo {
    method bono(empleado) = 0
}
// ############################### CATEGORIAS #################################
object gerente {
    method neto() = 15000
}
object cadete {
    method neto() = 20000
}
