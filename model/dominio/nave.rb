require_relative '../efectos/efecto_cambia_propia_masa'
require_relative '../efectos/efecto_vida_destructivo'
require_relative '../efectos/efecto_aumenta_propia_vida'
require_relative '../dominio/elemento_del_espacio'

class Nave < ElementoDelEspacio

  def initialize
    @masa = 100
    @vida = 100
    @situacion_de_choque = Hash.new

    @situacion_de_choque['Nave'] = EfectoVidaDestructivo.new (100)
    @situacion_de_choque['Asteroide'] = EfectoCambiaPropiaMasa.new (-0.5)
    @situacion_de_choque['Estrella'] = EfectoAumentaPropiaVida.new
    @situacion_de_choque['Misil'] = EfectoVidaDestructivo.new (80)
    @situacion_de_choque['Bomba'] = EfectoVidaDestructivo.new (50)
  end
end
