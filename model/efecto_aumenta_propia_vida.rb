require_relative '../model/efecto'

class EfectoAumentaPropiaVida < Efecto

  def calcular(objeto_chocado, objeto_al_que_choca)
    objeto_chocado.vida += objeto_al_que_choca.vida
  end

end