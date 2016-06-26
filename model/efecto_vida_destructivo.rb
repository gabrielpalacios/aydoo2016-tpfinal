
class EfectoVidaDestructivo

  def initialize(valor)
    @valor = valor
  end

  def calcular(objetoIzquierdo, objetoQueChocaDerecho)
    objetoIzquierdo.vida -= @valor
    #esto es para que la nave 2 tmb baje 100!!!!
    objetoQueChocaDerecho.vida -= @valor
  end

end