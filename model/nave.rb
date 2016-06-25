class Nave

  attr_accessor :masa, :vida

  def initialize()
    @masa = 100
    @vida = 100
    @situacion = Hash.new
    #@situacion["nave"] =  [100 , 0] # vida, masa
    array =  [100 , 0]
    @situacion["nave"] = array
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
    valorVidaMasa = @situacion["nave"]
    @vida -= valorVidaMasa[0]

  end

end
