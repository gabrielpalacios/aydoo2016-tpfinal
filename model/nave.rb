class Nave


  attr_accessor :masa, :vida


  def initialize()
    @masa = 100
    @vida = 100

  end

  def calcularSiEstaVivo

    tieneVidaMasa = true
    if (@masa <= 0 || @vida <= 0)
      tieneVidaMasa = false
    end
    return tieneVidaMasa
  end

  def chocar objetoQueChoca
    calcularEfecto objetoQueChoca

  end

  def calcularEfecto  objetoQueChoca
    @vida -= 100

  end

end
