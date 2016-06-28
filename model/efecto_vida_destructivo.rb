
class EfectoVidaDestructivo

  def initialize(valor)
    @valor = valor
  end

  def calcular(objetoIzquierdo, objetoQueChocaDerecho)
    objetoIzquierdo.vida -= @valor
    objetoQueChocaDerecho.vida -= @valor
  end

end