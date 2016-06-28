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
    @situacion["Asteroide"] = EfectoNulo.new
    @situacion["Estrella"] = EfectoNulo.new

    @situacion["Misil"] = EfectoNulo.new
    @situacion["Bomba"] = EfectoNulo.new

  end



end
