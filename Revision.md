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
* Respuesta: Aceptado, de hecho aprobecho para pasar una inspeccion general a las buenas practicas ruby.

-Observacion09- En el metodo calcular(objetoIzquierdo, objetoQueChocaDerecho) los nombres son muy poco claros a la hora de analizar que estan representando.
* Respuesta: Aceptado. Se hizo refactor de nombres de metodos y objetos.

-Observacion10- Todos los tipo de elementos espaciales tienen el mismo metodo chocar, y el mismo metodo calcularEfecto. Por lo tanto considero que seria mas 
apropiado subirlo a la clase padre para evitar la repeticion del codigo.
* Respuesta: Aceptado, fue postergado hasta ultimo momento, ya fue cambiado.

-Observacion11- El metodo calcularEfecto considero que debe ser privado.
* Respuesta: Rechazado, no puede serlo ya que se llama desde chocar, y debe ser publico para que su visibilidad sea valida, porque se llama desde self.calcularEfecto, donde self es cualquier instancia de objeto del espacio que se cree.

-Observacion12- Deberia haber excepciones para algunos casos, como por ejemplo si se quiere chocar contra un elemento inexistente.
* Respuesta: Aceptado, pero se deja para implementar como prioridad baja.

-Observacion13- Un elemento espacial no puede tener menos de 0 de vida. Aunque sufra un choque que la cuenta de negativa, se tiene que igualar a 0. 
En el codigo no se representa eso.
* Respuesta: Aceptado, se me ocurre reemplazar los attr_accessor de clase ElementoDelEspacio por getter y setter habituales, contemplando el chequeo de negatividad tanto para vida como masa en la misma asignacion. Se crean dos excepciones para ello.

-Observacion14- Los elementos del espacio que esten muertos no pueden interactuar. Falta incorporar eso.
* Respuesta: Aceptado, lo incorporo como validacion al momento de hacer el choque. 

-Observacion15- La solucion de como se sabe que hacer cuando choco a determinado elemento me parece aceptable, debido a que podria extenderse sin tocar lo ya hecho.
Le cambiaria el nombre del Hash de situacion a situacion_de_choque, para que sea mas especifico, ya que tal vez pueda extenderse en un futuro a 
nuevas situaciones que no sean el choque.
La principal desventaja que le veo a esta solucion es que si yo agrego un nuevo tipo de elemento espacial tengo que estar agregandolo en 
cada tipo de elemento para que lo reconozcan, por lo que tendria que tocar todas las clases. Ademas se puede dar la situacion de que uno lo
agregue y otro no, por lo que habria una inconsistencia, porque algunos elementos lo conocerian a ese nuevo elemento y otros no.
* Respuesta: Aceptado, se cambio el nombre. La sugerencia de extension me gusta mucho.
Se ha corroborado que el nuevo metodo en ElementoDelEspacio, agregar_elemento_espacial_junto_a_efecto_posible
sirve y funciona correctamente para este fin. Se hizo la prueba con un nuevo elemento, Supernova.
Lo que se tiene que hacer es (antes de chocar ambos elementos) agregar en tiempo de ejecucion el comportamiento esperado a la clase anterior, por ejemplo:
supernova = Supernova.new (esta nueva clase va a tener que heredar de ElementoDelEspacio y tener su constructor)
asteroide.agregar_elemento_espacial_junto_a_efecto_posible('Supernova',EfectoNulo.new)

##Segunda parte revision de codigo. Martes 28 2:10 horas

##Revisor: Fernando Gainey
##Revisado: Gabriel Palacios

*105 tests. Cobertura: 99.72%

-Observacion 16: Seria mas conveniente trabajar con Exceptions por sobre Errors. Esto es debido a que un Error es para indicar un problema serio del programa.
* Respuesta: Rechazado, no lo cambio ya que recibimos la guia de usar la convencion RSpec
del link https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers/raise-error-matcher
Y para sumar al respecto, me fije tambien en http://www.skorks.com/2009/09/ruby-exceptions-and-exception-handling/
donde se indica como usar las propias excepciones:
"update: Several people have pointed out, in the comments that inheriting from Exception directly is a big no-no when creating custom exceptions. You should instead inherit from StandardError. This is because exceptions that inherit from StandardError deal with application level errors, while if you inherit Exception directly you risk catching errors to do with the environment. Also the convention is to end your exceptions with the word Error rather than exceptions e.g.:
class MyCrazyError < StandardError
end"

-Observacion 17: Los distintos tipo de ObjetoEspacial no tienen metodos, solo tienen el constructor.
* Respuesta: Aceptado, pero por mas que intente, no veo la necesidad de agregar nada, ya que solo utilizo el constructor para pre cargar todos los efectos conocidos de choques, por ahora solo eso es necesario.

-Observacion 18: Las clases estan sueltas en una unica carpeta. Se podrian agrupar segun algun criterio para facilitar su comprension.
* Respuesta: Aceptado, se crean subcarpetas de dominio, efectos y excepciones

-Observacion 19: En ElementoDelEspacio podria usarse el attr_reader en vida y masa, en vez de escribir un metodo para obtenerlos.
* Respuesta: Rechazado, de hecho lo tenia antes y lo deje de usar para poder agregar la validacion de carga tanto de vida como de masa en el setter de cada uno.

-Observacion 20: En el metodo chocar de ElementoEspacial cuando guardas la vida temporal y la masa temporal, y lo igualas a @vida y @masa, puede que tengas un problema. Esto es porque cuando en Ruby haces la operacion del igual (=) lo que hace es que apuntes a la direccion de memoria en la que esta lo del lado derecho de la igualdad, por lo que si la @vida o @masa cambian su valor, tambien lo van a hacer la vida y masa temporal. Entonces para esos casos me fue util el .clone. En codigo seria: temporal_vida = @vida.clone
* Respuesta: Rechazado, no se permite el clonado de este atributo, sale "TypeError: can't clone Fixnum"
Lo que significa que Ruby no soporta el clonado o duplicado de variables tipo numerico y boolean.

-Observacion 21: Los metodos agregar_elemento_espacial_y_efecto_posible y eliminar_elemento_espacial_y_efecto_posible tienen smell, ya que a priori dan a entender que tienen mas de una responsabilidad. Aunque viendo en mayor detalle el metodo tiene una sola responsabilidad. Lo que causa ese smell es el nombre. Yo le cambiaria el "y" por algo como "junto_a" por ejemplo.
* Respuesta: Aceptada la sugerencia, es mas claro ahora, se realizo el cambio de nombre.

-Observacion 22: Cada vez que se ejecuta el metodo chocar, se crea un nuevo objeto: "objeto_temporal_pre_choque = (self.class).new" lo cual no me parece correcto por un tema de memoria.
* Respuesta: Rechazado, por una decision de diseno, necesito que no solo guarde los atributos del objeto antes del choque, sino que tambien necesito su tipo de objeto, ya que se tiene que adaptar el metodo chocar, a el choque de cualquier tipo de objeto. Ese objeto temporal es necesario para poder comparar la variacion de sus atributos (originales) que tiene al chocar.

-Observacion 23: Observaciones del diagrama de clases:
		-En todos los efectos cuando se pone en el parametro objeto_chocado o objeto_al_que_choca se lo señala como int cuando son 			ElementoDelEspacio (ver que se repite en otras partes tambien). Esos nombres son incorrectos, ya que objeto_chocado y 			objeto_al_que_choca significan lo mismo.
		-En los efectos que se usa el initialize para recibir algun dato deberia estar indicado en el diagrama su uso.
		-En el efecto EfectoCambiaPropiaMasa el valor deberia ser un float, ya que en el codigo se usa de esa forma. 
		-Falta el atributo situacion_de_choque
		-Aclaracion: a pesar de que ruby es un lenguaje en el que no se aclaran los tipos, y que estos haya que ponerlos debido a que 			el astah te obliga a poner cosas pertenecientes a los lenguajes tipados, pienso entonces que en el tipo que te obliga a poner 			el astah se indique que tipo de clase es el que esperamos que este en ese lugar. 
* Respuesta: Aceptadas y corregidas las observaciones.
