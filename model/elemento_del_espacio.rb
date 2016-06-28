require_relative '../model/elemento_del_espacio_muerto_error'
require_relative '../model/elemento_del_espacio_masa_negativa_error'
require_relative '../model/elemento_del_espacio_vida_negativa_error'

class ElementoDelEspacio

  attr_accessor :situacion_de_choque

  def masa
    @masa
  end

  def masa=(valor)
    if valor >= 0
      @masa = valor
    else
      fail ElementoDelEspacioMasaNegativaError.new
    end
  end

  def vida
    @vida
  end

  def vida=(valor)
    if valor >= 0
      @vida = valor
    else
      fail ElementoDelEspacioVidaNegativaError.new
    end
  end

  def calcular_si_esta_vivo

    tiene_vida_masa = true
    if @masa <= 0 || @vida <= 0
      tiene_vida_masa = false
    end
    tiene_vida_masa
  end


  def chocar(objeto_al_que_choca)
    # guardo los 2 datos temporales previo al choque
    temporal_vida = @vida
    temporal_masa = @masa

    if !self.calcular_si_esta_vivo || !objeto_al_que_choca.calcular_si_esta_vivo
      fail ElementoDelEspacioMuertoError.new
    end

    objeto_temporal_pre_choque = (self.class).new
    objeto_temporal_pre_choque.vida = temporal_vida
    objeto_temporal_pre_choque.masa = temporal_masa
    @situacion_de_choque[objeto_al_que_choca.class.name].calcular(self, objeto_al_que_choca)
    objeto_al_que_choca.calcular_efecto(objeto_temporal_pre_choque)

  end


  def calcular_efecto(objeto_al_que_choca)

    @situacion_de_choque[objeto_al_que_choca.class.name].calcular(self, objeto_al_que_choca)

  end

  def agregar_elemento_espacial_y_efecto_posible(nombre_elemento_del_espacio, efecto_posible)
    if !@situacion_de_choque.include? nombre_elemento_del_espacio
      @situacion_de_choque[nombre_elemento_del_espacio] = efecto_posible
    end
  end

  def eliminar_elemento_espacial_y_efecto_posible(nombre_elemento_del_espacio)
    if @situacion_de_choque.include? nombre_elemento_del_espacio
      @situacion_de_choque.delete(nombre_elemento_del_espacio)
    end
  end

end