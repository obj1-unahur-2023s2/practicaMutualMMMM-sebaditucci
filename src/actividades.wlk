import socios.*
import libros.*

class Viaje {
	const idiomasUsados = []
	method agregarIdioma(idioma) { idiomasUsados.add(idioma) }
	method idiomasUsados() = idiomasUsados
	method implicaEsfuerzo() 
	method sirveParaBroncearse()
	method cantDias()
	method esInteresante() = idiomasUsados.size() > 1
	method esRecomendadaPara(socio) = self.esInteresante() and socio.leAtrae(self) and socio.actividadesRealizadas().notContains(self)
}

class ViajeDePlaya inherits Viaje {
	var largoDePlaya
	override method cantDias() = largoDePlaya / 500
	override method implicaEsfuerzo() = largoDePlaya > 1200
	override method sirveParaBroncearse() = true
}

class ExcursionACiudad inherits Viaje {
	var cantidadAtracciones
	override method cantDias() = cantidadAtracciones / 2
	override method implicaEsfuerzo() = cantidadAtracciones >= 5 and cantidadAtracciones <= 8
	override method sirveParaBroncearse() = false
	override method esInteresante() = super() or cantidadAtracciones == 5
}

class ExcursionACiudadTropical inherits ExcursionACiudad {
	override method cantDias() = super() + 1
	override method sirveParaBroncearse() = true
}

class SalidaDeTrekking inherits Viaje {
	var kilometrosDeSenderos
	var diasDeSolPorAnio
	override method cantDias() = kilometrosDeSenderos / 50
	override method implicaEsfuerzo() = kilometrosDeSenderos > 80 
	override method sirveParaBroncearse() = diasDeSolPorAnio > 200 or (diasDeSolPorAnio >= 100 and diasDeSolPorAnio <= 200 and kilometrosDeSenderos > 120)
	override method esInteresante() = super() and diasDeSolPorAnio > 140
}

class ClaseDeGimnasia {
	method idiomasUsados() = "español"
	method cantDias() = 1
	method implicaEsfuerzo() = true
	method sirveParaBroncearse() = false
	method esRecomendadaPara(socio) = socio.edad() >= 20 and socio.edad() <= 30
}


class TallerLiterario {
	const libros = []
	method aniadirLibro(libro) { libros.add(libro) }
	method libros() = libros
	method idiomasUsados() = libros.map({l => l.idioma()}) 
	method cantDias() = libros.size() + 1
	method sonDelMismoAutor(autor) = libros.all({l => l.autor() == autor})
	method implicaEsfuerzo() = libros.any({l => l.cantPags() > 500}) or (libros.all({l => self.sonDelMismoAutor(l.autor())}) and libros.size() > 1)
	method sirveParaBroncearse() = false
	method esRecomendadoPara(socio) = socio.idiomasHablados().size() > 1
}
