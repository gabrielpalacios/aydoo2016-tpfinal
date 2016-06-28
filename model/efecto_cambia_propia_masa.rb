require_relative '../model/efecto'

class EfectoCambiaPropiaMasa < Efecto

  def initialize(valor)
    @valor = valor
  end

  def calcular(objeto_chocado, objeto_al_que_choca)
    objeto_chocado.masa =  objeto_chocado.masa + (objeto_al_que_choca.masa * @valor)

  end

end