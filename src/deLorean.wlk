//import personajes.*

class ExceptionSinElementos inherits Exception {}
 
object deLorean{
 	var property combustible = nafta
 	const pasajeros = [] 

 	method subirPasajero(pasajero){
 		pasajeros.add(pasajero)
 	}
 	method bajarPasajero(pasajero){
 		pasajeros.remove(pasajero)
 	}
 	method viajarA(unDestino,unaFecha){
 		pasajeros.forEach{pasajero => combustible.efecto(pasajero)}
 	}
 	method huboUnProblemaCon(unPersonaje,unaFecha){
 		pasajeros.forEach{pasajero => pasajero.problemaCon(unPersonaje,unaFecha)}
 	}
 }
 

object radiactividad {
 	method efecto(persona){
 		persona.cambiarAltura(-1)
 	}
 }
 
object nafta{
 	method efecto(persona){
 		persona.cambiarEdad( if(persona.esMayor()) -10 else 5)
 	}
 }
 
object electricidad{
 	method efecto(persona){
 		if(persona.noTieneElementos()) 
 			throw new ExceptionSinElementos()
 		persona.perderLoMasAntiguo()
 	}
 }
 
object basura{
 	method efecto(persona){
 		// no hace nada
 	}
 }