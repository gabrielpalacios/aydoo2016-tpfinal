class ElementoDelEspacioMasaNegativaError < StandardError

  def initialize(msg='Los objetos del espacio no pueden iniciarse con masa negativa.')
    super
  end
end
