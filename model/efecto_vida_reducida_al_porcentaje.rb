class EfectoVidaReducidaAlPorcentaje

  def initialize(valor)
    @valor = (valor / 100.0)
  end

  def calcular(objeto_chocado, objeto_al_que_choca)
    objeto_chocado.vida *= @valor
    objeto_al_que_choca.vida *= @valor
  end

end