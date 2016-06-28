require_relative '../model/efecto_cambia_propia_masa'
require_relative '../model/efecto_vida_destructivo'
require_relative '../model/efecto_vida_reducida_al_porcentaje'
require_relative '../model/efecto_nulo'
require_relative '../model/elemento_del_espacio'

class Bomba < ElementoDelEspacio

  def initialize()
    @masa = 100
    @vida = 100
    @situacion = Hash.new

    @situacion["Nave"] = EfectoVidaDestructivo.new(100)
    @situacion["Asteroide"] = EfectoVidaReducidaAlPorcentaje.new(0)
    @situacion["Estrella"] = EfectoVidaDestructivo.new(100)
    @situacion["Misil"] = EfectoVidaReducidaAlPorcentaje.new(50)
    @situacion["Bomba"] = EfectoVidaDestructivo.new(100)

  end


end
