require_relative '../efectos/efecto'

class EfectoVidaReducidaAlPorcentaje < Efecto

  def initialize(valor)
    @valor = (valor / 100.0)
  end

  def calcular(objeto_chocado, objeto_al_que_choca)
    objeto_chocado.vida *= @valor
  end
end