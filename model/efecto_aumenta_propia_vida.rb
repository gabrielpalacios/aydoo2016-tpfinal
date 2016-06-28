
class EfectoAumentaPropiaVida

  def initialize(valor)
    @valor = valor
  end

  def calcular(objetoIzquierdo, objetoQueChocaDerecho)
    objetoIzquierdo.vida += objetoQueChocaDerecho.vida
  end

end