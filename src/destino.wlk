 class Destino{
 	const personajes = []
 	constructor(_personajes){
 		personajes =_personajes
 	}
 	method antepasadosDe(unPersonaje){
 		return personajes.filter{personaje => personaje.esAntepesadoDe(unPersonaje)}
 	}
 }
 
 