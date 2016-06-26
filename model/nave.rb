class Nave

  attr_accessor :masa, :vida

  def initialize()
    @masa = 100
    @vida = 100
    @situacion = Hash.new
    #@situacion["nave"] =  [100 , 0] # vida, masa
    array =  [100 , 0]
    @situacion["Nave"] = array
    @situacion["Asteroide"] = [0 , -0.5]

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

    self.calcularEfecto objetoQueChoca, temporalVida , temporalMasa

  end

  def calcularEfecto  objetoQueChoca, temporalVidaIzq , temporalMasaIzq
    #ok valorVidaMasa = @situacion["Nave"]

    #caso nave-asteroide, la masa de la nave, tiene q bajar el valor de 50% de masa asteroide
    #esto calcula efecto al propio objeto (lado izquiedo)
    #ejemplo caso nave-asteroide
    valorVidaMasaIzq = @situacion[objetoQueChoca.class.name]


    if (valorVidaMasaIzq[0] < 0) # los negativos son porcentaje de incremento
      @vida *= valorVidaMasaIzq[0]
    else
      @vida -= valorVidaMasaIzq[0]
    end

    if (valorVidaMasaIzq[1] < 0)  # los negativos son porcentaje de incremento
      @masa =  @masa +  objetoQueChoca.masa * valorVidaMasaIzq[1]
    else
      @masa -= valorVidaMasaIzq[1]
    end




    #anterior
    #@vida -= valorVidaMasaIzq[0]
    #@masa -= valorVidaMasaIzq[1]





    #esto calcula efecto al otro objeto (lado derecho)
    valorVidaMasaDer = @situacion["Nave"]
    objetoQueChoca.vida -= valorVidaMasaDer[0]
    objetoQueChoca.masa -= valorVidaMasaDer[1]

  end

  # def calcularEfectoVidaLadoDerecho (objetoLadoDerecho, temporalVidaIzquierda)
  #   valorVidaMasa = @situacion["Nave"]
  #
  #   objetoLadoDerecho.vida -= valorVidaMasa[0]
  #   objetoLadoDerecho.vida
  # end

  # def salidaNombre obj
  #   #aClass = obj.name if obj.type <= Module
  #   #aClass
  #   obj.class.name
  # end

end
