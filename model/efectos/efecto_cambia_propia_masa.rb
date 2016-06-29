require_relative '../efectos/efecto'

class EfectoCambiaPropiaMasa < Efecto

  def initialize(valor)
    @valor = valor
  end

  def calcular(objeto_chocado, objeto_al_que_choca)
    objeto_chocado.masa =  objeto_chocado.masa + (objeto_al_que_choca.masa * @valor)
    if objeto_chocado.masa < 0
      objeto_chocado.masa = 0
    end
  end
end