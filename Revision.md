Informe del Tp Final de Gabriel Palacios en el horario de las 2hs del dia 27/06/2016
-------------------------------------------------------------------------------------

-Observacion01- Hay mucho codigo comentado, lo cual quita claridad.
* Respuesta: Aceptado, deje mucho codigo viejo que utilice en versiones prototipo. Se elimina todo lo innecesario.

-Observacion02- Hay espacios de mas en algunas partes.
Respuesta: Aceptado,, no le aplique el corrector de indentacion y mejora de codigo. Se le aplica el corrector a todos los archivos de codigo fuente.

-Observacion03- No respeta convenciones de ruby en algunos nombres de metodos y variables. Tampoco esta poniendo parentesis cuando pasa argumentos en algunos metodos. 
* Respuesta: Aceptado el hecho de usar camelCase en metodos y variables, que a mi me gusta mas, pero no a la comunidad ruby. Lo cambio en todos los fuentes.
Nota: El uso de parentesis segun vi es opcional en las llamadas a metodos.

-Observacion04- Los clases EfectoVidaFatalidad y EfectoVidaMediaFatalidad no son flexibles, es decir que estan hechos para casos muy particulares. 
Se podrian juntar en una sola clase, ya que ambas actuan de acuerdo a un porcentaje de destruccion que es indicado, en el ejemplo son 100% y 50%. 
Con relacion a esto ultimo, en caso de aceptar la sugerencia, el nombre de la clase deberia ser algo distinto, en donde se aclare que se esta
hablando de una destruccion en cierto porcentaje.
* Respuesta: Aceptado, tiene toda la razon, no me di cuenta cuando las cree. Lo corrigo utilizando el EfectoVidaReducidaAlPorcentaje

-Observacion05- Seria mas apropiado el nombre EfectoNulo por sobre EfectoNoPasaNada.
* Respuesta: Se acepta la mejora del nombre para el efecto.

-Observacion06- A todos los tipo de Efectos se le tiene que pasar un valor por constructor, pero no todos lo usan.
* Respuesta: Se acepta y se borra el constructor de efecto nulo y efecto AumentaPropiaVida

-Observacion07- En los distintos tipos de elementos del espacio, en el metodo calcularEfecto hay 3 variables, de las cuales se usa solo una. 
Ademas las otras dos tienen nombres muy confusos: temporalVidaIzq, temporalMasaIzq. Es dificil interpretar que significan.
* Respuesta: Aceptado, era un vestigio de codigo viejo, del primer prototipo. Se elimina.

-Observacion08- En el metodo chocar de todos los tipos de elementos espaciales, el metodo chocar tiene como parametro ObjetoQueChoca, 
lo que segun lei no seria lo que esta representando. Lo correcto seria objeto_al_que_choca (lo escribo de esta forma, porque es la convencion que se deberia usar)  
* Respuesta: Aceptado, de hecho aproveho para pasar una inspeccion general a las buenas practicas ruby.

-Observacion09- En el metodo calcular(objetoIzquierdo, objetoQueChocaDerecho) los nombres son muy poco claros a la hora de analizar que estan representando.
* Respuesta: 

-Observacion10- Todos los tipo de elementos espaciales tienen el mismo metodo chocar, y el mismo metodo calcularEfecto. Por lo tanto considero que seria mas 
apropiado subirlo a la clase padre para evitar la repeticion del codigo.
* Respuesta: Aceptado, fue postergado hasta ultimo momento, ya fue cambiado.

-Observacion11- El metodo calcularEfecto considero que debe ser privado.
* Respuesta: Rechazado, no puede serlo ya que se llama desde chocar, y debe ser publico para que su visibilidad sea valida, porque se llama desde self.calcularEfecto, donde self es cualquier instancia de objeto del espacio que se cree.

-Observacion12- Deberia haber excepciones para algunos casos, como por ejemplo si se quiere chocar contra un elemento inexistente.
* Respuesta: 

-Observacion13- Un elemento espacial no puede tener menos de 0 de vida. Aunque sufra un choque que la cuenta de negativa, se tiene que igualar a 0. 
En el codigo no se representa eso.
* Respuesta: 

-Observacion14- Los elementos del espacio que esten muertos no pueden interactuar. Falta incorporar eso.
* Respuesta: Aceptado, lo incorporo como validacion al momento de hacer el choque. 

-Observacion15- La solucion de como se sabe que hacer cuando choco a determinado elemento me parece aceptable, debido a que podria extenderse sin tocar lo ya hecho.
Le cambiaria el nombre del Hash de situacion a situacion_de_choque, para que sea mas especifico, ya que tal vez pueda extenderse en un futuro a 
nuevas situaciones que no sean el choque.
La principal desventaja que le veo a esta solucion es que si yo agrego un nuevo tipo de elemento espacial tengo que estar agregandolo en 
cada tipo de elemento para que lo reconozcan, por lo que tendria que tocar todas las clases. Ademas se puede dar la situacion de que uno lo
agregue y otro no, por lo que habria una inconsistencia, porque algunos elementos lo conocerian a ese nuevo elemento y otros no.
* Respuesta: 

