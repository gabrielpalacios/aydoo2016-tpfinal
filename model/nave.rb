require_relative '../model/efecto_cambia_propia_masa'
require_relative '../model/efecto_vida_destructivo'
require_relative '../model/efecto_aumenta_propia_vida'
require_relative '../model/elemento_del_espacio'


class Nave < ElementoDelEspacio

  def initialize()
    @masa = 100
    @vida = 100
    @situacion = Hash.new

    @situacion["Nave"] = EfectoVidaDestructivo.new (100)
    @situacion["Asteroide"] = EfectoCambiaPropiaMasa.new (-0.5)
    @situacion["Estrella"] = EfectoAumentaPropiaVida.new (0)
    @situacion["Misil"] = EfectoVidaDestructivo.new (80)
    @situacion["Bomba"] = EfectoVidaDestructivo.new (50)

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
