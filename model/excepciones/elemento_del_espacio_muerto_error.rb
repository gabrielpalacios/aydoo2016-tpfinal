class ElementoDelEspacioMuertoError < StandardError

  def initialize(msg='Los objetos del espacio que esten muertos no pueden participar en ningun choque.')
    super
  end
end
