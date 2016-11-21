class ExceptionSinElementos inherits Exception {}


object radiactividad{
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