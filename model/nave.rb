class Nave

  attr_accessor :masa, :vida

  def initialize()
    @masa = 100
    @vida = 100
    @situacion = Hash.new
    #@situacion["nave"] =  [100 , 0] # vida, masa
    array =  [100 , 0]
    #ok @situacion["Nave"] = array
    @situacion["Nave"] = array

  end

  def calcularSiEstaVivo

    tieneVidaMasa = true
    if (@masa <= 0 || @vida <= 0)
      tieneVidaMasa = false
    end
    return tieneVidaMasa
  end

  def chocar objetoQueChoca
    self.calcularEfecto objetoQueChoca

  end

  def calcularEfecto  objetoQueChoca
    #ok valorVidaMasa = @situacion["Nave"]
    valorVidaMasa = @situacion[objetoQueChoca.class.name]

    @vida -= valorVidaMasa[0]
    @masa -= valorVidaMasa[1]
  end

  # def salidaNombre obj
  #   #aClass = obj.name if obj.type <= Module
  #   #aClass
  #   obj.class.name
  # end

end
