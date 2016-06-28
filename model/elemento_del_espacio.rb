require_relative '../model/elemento_del_espacio_muerto_error'

class ElementoDelEspacio

  attr_accessor :masa, :vida

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

    if !self.calcularSiEstaVivo || !objetoQueChoca.calcularSiEstaVivo
      fail ElementoDelEspacioMuertoError.new
    end

    self.calcularEfecto objetoQueChoca, temporalVida, temporalMasa

  end


  def calcularEfecto objetoQueChoca, temporalVidaIzq, temporalMasaIzq

    @situacion_de_choque[objetoQueChoca.class.name].calcular(self, objetoQueChoca)

  end

end