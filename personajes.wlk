import deLorean.*

class Personaje {
	var property edad
	var property altura
	var property apellido
	const elementos = []
	
	method esMayor() = edad > 50
	
	method tiene(elemento) = elementos.contains(elemento)
	
	method tieneElementoPropio() = elementos.any({ e => e.esDe(self) })
	
	method cambiarAltura(cant) {
		altura += cant
	}
	
	method cambiarEdad(cant) {
		edad += cant
	}
	
	method elementoMasAntiguo() = elementos.min({ e => e.fecha() })
	
	method perderLoMasAntiguo() {
		elementos.remove({ self.elementoMasAntiguo() })
	}
	
	method noTieneElementos() = elementos.isEmpty()
	
	method esAntepesadoDe(
		alguien
	) = (apellido == alguien.apellido()) && alguien.esMayor()
	
	method problemaCon(unPersonaje, unaFecha) {
		elementos.filter({ e => e.esMasReciente(unaFecha) }).forEach(
			{ e => e.problemaCon(unPersonaje) }
		)
	}
}

class Destino {
	const personajes = []
	
	method antepasadosDe(unPersonaje) = personajes.filter(
		{ personaje => personaje.esAntepesadoDe(unPersonaje) }
	)
}

class Elemento {
	var descripcion
	var property fecha
	
	method esDe(alguien) = false
	
	method esMasReciente(unaFecha) = fecha < unaFecha
	
	method problemaCon(alguien) {
		descripcion = "BTTF " + descripcion
	}
}

class Documentacion inherits Elemento {
	const personajes
	
	override method esDe(alguien) = personajes.contains(alguien)
	
	override method problemaCon(alguien) {
		super(alguien)
		if (self.esDe(alguien)) personajes.remove(alguien)
	}
}

class Especial inherits Elemento {
	const duenio
	
	override method esDe(alguien) = duenio == alguien
}