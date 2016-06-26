
class EfectoVidaMediaFatalidad

  def initialize(valor)
    @valor = valor
  end

  def calcular(objetoIzquierdo, objetoQueChocaDerecho)
    objetoIzquierdo.vida *= 0.5
    #esto es para que la nave 2 tmb baje 100!!!!
    objetoQueChocaDerecho.vida *= 0.5
  end

end