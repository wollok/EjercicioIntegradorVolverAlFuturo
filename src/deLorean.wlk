import combustibles.*
 
object deLorean{
 	var combustible = nafta
 	var pasajeros = []
 	method combustible(_combustible){
 		combustible = _combustible
 	}
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