require_relative '../model/efecto'

class EfectoVidaDestructivo < Efecto

  def initialize(valor)
    @valor = valor
  end

  def calcular(objeto_chocado, objeto_al_que_choca)
    objeto_chocado.vida -= @valor
    if objeto_chocado.vida < 0
      objeto_chocado.vida = 0
    end
  end
end