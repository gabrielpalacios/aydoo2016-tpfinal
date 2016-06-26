
class EfectoVidaFatalidad

  def initialize(valor)
    @valor = valor
  end

  def calcular(objetoIzquierdo, objetoQueChocaDerecho)
    objetoIzquierdo.vida = 0
    #esto es para que la nave 2 tmb baje 100!!!!
    objetoQueChocaDerecho.vida = 0
  end

end