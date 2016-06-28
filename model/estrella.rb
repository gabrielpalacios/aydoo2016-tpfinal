require_relative '../model/efecto_cambia_propia_masa'
require_relative '../model/efecto_vida_destructivo'
require_relative '../model/efecto_vida_reducida_al_porcentaje'
require_relative '../model/efecto_nulo'
require_relative '../model/elemento_del_espacio'

class Estrella < ElementoDelEspacio

  def initialize()
    @masa = 100
    @vida = 100
    @situacion = Hash.new

    @situacion["Nave"] = EfectoVidaReducidaAlPorcentaje.new (0)
    @situacion["Asteroide"] = EfectoVidaReducidaAlPorcentaje.new (0)
    @situacion["Estrella"] = EfectoVidaReducidaAlPorcentaje.new (0)
    @situacion["Misil"] = EfectoNulo.new
    @situacion["Bomba"] = EfectoVidaReducidaAlPorcentaje.new (0)

  end


end
