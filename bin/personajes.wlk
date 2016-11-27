class Personaje{
 	var edad
 	var altura 
 	var elementos = []
 	var apellido
 	constructor(_edad,_altura,_elementos,_apellido){
 		edad =_edad
 		altura = _altura
 		elementos = _elementos
 		apellido = _apellido
 	}
 	method apellido() = apellido
 	method altura() = altura
 	method edad() = edad
 	method esMayor(){
 		return edad > 50
 	}
 	method tiene(elemento){
 		return elementos.contains(elemento)
 	}
 	method tieneElementoPropio(){
 		return elementos.any{e => e.esDe(self)}
 	}
 	method cambiarAltura(cant){
 		altura += cant
 	}
 	method cambiarEdad(cant){
 		edad += cant	
 	}
 	method elementoMasAntiguo(){
 		return elementos.min{e => e.fecha()}
 	}
 	method perderLoMasAntiguo(){
 		elementos.remove{self.elementoMasAntiguo()}
 	}

 	method noTieneElementos(){
 		return elementos.isEmpty()
 	}
 
 	method esAntepesadoDe(alguien){
 		return apellido == alguien.apellido() && alguien.esMayor()
 	}
 	method problemaCon(unPersonaje,unaFecha){
 		elementos.filter{e => e.esMasReciente(unaFecha)}.forEach{e => e.problemaCon(unPersonaje)}
 	}
 }
 




