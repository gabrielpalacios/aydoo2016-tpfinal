require_relative '../model/efecto_cambia_propia_masa'
require_relative '../model/efecto_vida_destructivo'
require_relative '../model/efecto_vida_reducida_al_porcentaje'
require_relative '../model/efecto_nulo'
require_relative '../model/elemento_del_espacio'

class Asteroide < ElementoDelEspacio

  def initialize()
    @masa = 100
    @vida = 100
    @situacion = Hash.new

    @situacion["Nave"] = EfectoCambiaPropiaMasa.new (0.1)
    @situacion["Asteroide"] = EfectoNulo.new (0)
    @situacion["Estrella"] = EfectoNulo.new (0)

    @situacion["Misil"] = EfectoNulo.new (0)
    @situacion["Bomba"] = EfectoNulo.new (0)

  end

  def chocar objetoQueChoca
    #guardo los 2 datos temporales previo al choque
    temporalVida = @vida
    temporalMasa = @masa

    self.calcularEfecto objetoQueChoca, temporalVida, temporalMasa

  end

  def calcularEfecto objetoQueChoca, temporalVidaIzq, temporalMasaIzq

    @situacion[objetoQueChoca.class.name].calcular(self, objetoQueChoca)

  end

end
