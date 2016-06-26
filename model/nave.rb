class Nave

  attr_accessor :masa, :vida

  def initialize()
    @masa = 100
    @vida = 100
    @situacion = Hash.new
    #@situacion["nave"] =  [100 , 0] # vida, masa
    array =  [100 , 0]
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
    #guardo los 2 datos temporales previo al choque
    temporalVida = @vida
    temporalMasa = @masa
    #esto calcula efecto al propio objeto (lado izquiedo)
    self.calcularEfecto objetoQueChoca
    #esto calcula efecto al otro objeto (lado derecho)
    objetoQueChoca.vida = calcularEfectoVidaLadoDerecho objetoQueChoca, temporalVida
    #objetoQueChoca.masa = calcularEfectoMasaLadoDerecho objetoQueChoca, temporalMasa

  end

  def calcularEfecto  objetoQueChoca
    #ok valorVidaMasa = @situacion["Nave"]
    valorVidaMasa = @situacion[objetoQueChoca.class.name]

    @vida -= valorVidaMasa[0]
    @masa -= valorVidaMasa[1]
  end

  def calcularEfectoVidaLadoDerecho (objetoLadoDerecho, temporalVidaIzquierda)
    valorVidaMasa = @situacion["Nave"]

    objetoLadoDerecho.vida -= valorVidaMasa[0]
    objetoLadoDerecho.vida
  end

  # def salidaNombre obj
  #   #aClass = obj.name if obj.type <= Module
  #   #aClass
  #   obj.class.name
  # end

end
