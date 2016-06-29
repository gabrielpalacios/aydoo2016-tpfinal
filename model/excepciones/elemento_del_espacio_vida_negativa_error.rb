class ElementoDelEspacioVidaNegativaError < StandardError

  def initialize(msg='Los objetos del espacio no pueden iniciarse con vida negativa.')
    super
  end
end
