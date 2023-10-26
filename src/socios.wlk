import actividades.*

class Socio {
	const actividadesRealizadas = []
	const idiomasHablados = []
	var property maximoDeActividades
	var property edad
	method registrarActividad(actividad) { 
		if (actividadesRealizadas.size() < maximoDeActividades) { actividadesRealizadas.add(actividad) }
		else { self.error("Maximo de actividades excedido") }
	}
	method idiomasHablados() = idiomasHablados
	method actividadesRealizadas() = actividadesRealizadas
	method esAdoradorDelSol() = actividadesRealizadas.all({a => a.sirveParaBroncearse()})
	method actividadesEsforzadas() = actividadesRealizadas.filter({a => a.implicaEsfuerzo()})
	method leAtrae(actividad)
}

class SocioTranquilo inherits Socio { override method leAtrae(actividad) = actividad.cantDias() >= 4 }

class SocioCoherente inherits Socio { 
	override method leAtrae(actividad) = if (self.esAdoradorDelSol()) actividad.sirveParaBroncearse() else actividad.implicaEsfuerzo()
}

class SocioRelajado inherits Socio { 
	override method leAtrae(actividad) = idiomasHablados.any({i => actividad.idiomasUsados().contains(i)})
}