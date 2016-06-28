require_relative '../model/elemento_del_espacio_muerto_error'

class ElementoDelEspacio

  attr_accessor :masa, :vida

  def calcular_si_esta_vivo

    tiene_vida_masa = true
    if @masa <= 0 || @vida <= 0
      tiene_vida_masa = false
    end
    tiene_vida_masa
  end


  def chocar(objeto_al_que_choca)
    # #guardo los 2 datos temporales previo al choque
    # temporalVida = @vida
    # temporalMasa = @masa

    if !self.calcular_si_esta_vivo || !objeto_al_que_choca.calcular_si_esta_vivo
      fail ElementoDelEspacioMuertoError.new
    end

    self.calcular_efecto objeto_al_que_choca
    #self.calcular_efecto objeto_al_que_choca, temporalVida, temporalMasa

  end


  def calcular_efecto(objeto_al_que_choca)

    @situacion_de_choque[objeto_al_que_choca.class.name].calcular(self, objeto_al_que_choca)

  end

end