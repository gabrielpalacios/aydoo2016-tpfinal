require_relative '../efectos/efecto_cambia_propia_masa'
require_relative '../efectos/efecto_vida_destructivo'
require_relative '../efectos/efecto_vida_reducida_al_porcentaje'
require_relative '../efectos/efecto_nulo'
require_relative '../dominio/elemento_del_espacio'

class Misil < ElementoDelEspacio

  def initialize
    @masa = 100
    @vida = 100
    @situacion_de_choque = Hash.new

    @situacion_de_choque['Nave'] = EfectoVidaDestructivo.new (100)
    @situacion_de_choque['Asteroide'] = EfectoNulo.new
    @situacion_de_choque['Estrella'] = EfectoNulo.new
    @situacion_de_choque['Misil'] = EfectoVidaDestructivo.new (100)
    @situacion_de_choque['Bomba'] = EfectoNulo.new
  end
end
