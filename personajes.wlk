import deLorean.*

class Personaje{
 	var property edad
 	var property altura 
 	var property apellido
 	var elementos = []
 	
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
 
class Destino{
 	const personajes = []
 	method antepasadosDe(unPersonaje){
 		return personajes.filter{personaje => personaje.esAntepesadoDe(unPersonaje)}
 	}
 }
 

 class Elemento{
 	var descripcion
 	var property fecha
 	
 	method esDe(alguien) = false
 	
 	method esMasReciente(unaFecha){
 		return fecha < unaFecha
 	}
 	method problemaCon(alguien){
 		descripcion = "BTTF " + descripcion
 	}
 }
 
 class Documentacion inherits Elemento{
 	var personajes
 
 	override method esDe(alguien){
 		return personajes.contains(alguien)
 	}
 	override method problemaCon(alguien){
 		super(alguien)
 		if(self.esDe(alguien))
 			personajes.remove(alguien)
 	}
 }
 
 class Especial inherits Elemento{
 	var duenio
 
 	override method esDe(alguien){
 		return duenio == alguien
 	}
 }


