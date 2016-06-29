# aydoo2016-tpfinal

Repositorio de Gabriel Palacios para el trabajo práctico final


Decisiones:

* Se crearon las clases de modelado en subcarpetas dominio, efectos y excepciones.

* Se contemplaron las excepciones de ElementoDelEspacioMuertoError, ElementoDelEspacioVidaNegativaError y ElementoDelEspacioMasaNegativaError

* Los tests cumplen con una cobertura del 96%.

* Cada ElementoDelEspacio (siendo heredados de esta clase) debe llenar una coleccion de efectos para cada Elemento.
Opte por utilizar un Hash de Ruby.
Para cada uno de estos objetos hijo, se carga el contenido del Hash en el constructor de cada uno, o a posteriori mediante el metodo agregar_elemento_espacial_junto_a_efecto_posible, con el fin de establecer la relacion del hash, entre elementos del espacio y sus efectos asociados. 
El objetivo es que para cada combinacion de choque de elementos, sea conocida su reaccion, por cada elemento del espacio.

* Se respecta el principio OPEN/CLOSE para agregar nuevos efectos, nuevos elementos del espacio, y nuevas relaciones entre los elementos y su efecto tras el choque.
Existe un metodo en ElementoDelEspacio, agregar_elemento_espacial_junto_a_efecto_posible
que sirve y funciona correctamente para este fin. Se hizo la prueba con un nuevo elemento, Supernova.
Lo que se tiene que hacer es (antes de chocar ambos elementos) agregar en tiempo de ejecucion el comportamiento esperado a la clase anterior, por ejemplo:
supernova = Supernova.new (esta nueva clase va a tener que heredar de ElementoDelEspacio y tener su constructor)
asteroide.agregar_elemento_espacial_junto_a_efecto_posible('Supernova',EfectoNulo.new)

* Se crea una clase 'EfectoNulo' que no tiene ningun comportamiento. Solo existe para hacer mas claro el codigo.

* Las clases hijas de ElementoDelEspacio no tienen metodos, solo tienen el constructor. Parece que le falta algo, pero no veo la necesidad de agregar nada, ya que solo utilizo el constructor para pre cargar todos los efectos conocidos de choques, que es lo minimo necesario. Y tambien un valor por defecto de vida y masa a 100 unidades.
