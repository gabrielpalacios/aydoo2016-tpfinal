
class EfectoPropiaVida

  def initialize(valor)
    @valor = valor
  end

  def calcular(objetoIzquierdo, objetoQueChocaDerecho)
    objetoIzquierdo.vida += objetoQueChocaDerecho.vida
    #esto es para que la nave 2 tmb baje 100!!!!
    #objetoQueChocaDerecho.vida -= @valor
  end

end