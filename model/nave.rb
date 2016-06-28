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
    @situacion["Estrella"] = EfectoAumentaPropiaVida.new
    @situacion["Misil"] = EfectoVidaDestructivo.new (80)
    @situacion["Bomba"] = EfectoVidaDestructivo.new (50)

  end

end
