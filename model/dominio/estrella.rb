require_relative '../efectos/efecto_cambia_propia_masa'
require_relative '../efectos/efecto_vida_destructivo'
require_relative '../efectos/efecto_vida_reducida_al_porcentaje'
require_relative '../efectos/efecto_nulo'
require_relative '../dominio/elemento_del_espacio'

class Estrella < ElementoDelEspacio

  def initialize
    @masa = 100
    @vida = 100
    @situacion_de_choque = Hash.new

    @situacion_de_choque['Nave'] = EfectoVidaReducidaAlPorcentaje.new (0)
    @situacion_de_choque['Asteroide'] = EfectoVidaReducidaAlPorcentaje.new (0)
    @situacion_de_choque['Estrella'] = EfectoVidaReducidaAlPorcentaje.new (0)
    @situacion_de_choque['Misil'] = EfectoNulo.new
    @situacion_de_choque['Bomba'] = EfectoVidaReducidaAlPorcentaje.new (0)
  end
end
