class EfectoVidaReducidaAlPorcentaje

  def initialize(valor)
    @valor = (valor / 100.0)
  end

  def calcular(objetoIzquierdo, objetoQueChocaDerecho)
    objetoIzquierdo.vida *= @valor
    objetoQueChocaDerecho.vida *= @valor
  end

end