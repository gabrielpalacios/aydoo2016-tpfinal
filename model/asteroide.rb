require_relative '../model/efecto_cambia_propia_masa'
require_relative '../model/efecto_vida_destructivo'
require_relative '../model/efecto_vida_fatalidad'
require_relative '../model/efecto_no_pasa_nada'
require_relative '../model/elemento_del_espacio'


class Asteroide < ElementoDelEspacio

  #attr_accessor :masa, :vida

  def initialize()
    @masa = 100
    @vida = 100
    @situacion = Hash.new
    #@situacion["nave"] =  [100 , 0] # vida, masa
    #array =  [0 , 0]
    #@situacion["Asteroide"] = array
    #@situacion["Nave"] = [0 , -0.1]

    @situacion["Nave"] = EfectoCambiaPropiaMasa.new (0.1)
    @situacion["Asteroide"] = EfectoNoPasaNada.new (0)
    @situacion["Estrella"] = EfectoNoPasaNada.new (0)

    @situacion["Misil"] = EfectoNoPasaNada.new (0)
    @situacion["Bomba"] = EfectoNoPasaNada.new (0)

  end

  # def calcularSiEstaVivo
  #
  #   tieneVidaMasa = true
  #   if (@masa <= 0 || @vida <= 0)
  #     tieneVidaMasa = false
  #   end
  #   return tieneVidaMasa
  # end

  def chocar objetoQueChoca
    #guardo los 2 datos temporales previo al choque
    temporalVida = @vida
    temporalMasa = @masa

    self.calcularEfecto objetoQueChoca, temporalVida , temporalMasa

  end

  def calcularEfecto  objetoQueChoca, temporalVidaIzq , temporalMasaIzq

    @situacion[objetoQueChoca.class.name].calcular(self, objetoQueChoca)

=begin
    #ok valorVidaMasa = @situacion["Nave"]

    #esto calcula efecto al propio objeto (lado izquiedo)
    valorVidaMasaIzq = @situacion[objetoQueChoca.class.name]

    if (valorVidaMasaIzq[0] < 0) # los negativos son porcentaje de incremento
      @vida *= valorVidaMasaIzq[0]
    else
      @vida -= valorVidaMasaIzq[0]
    end

    if (valorVidaMasaIzq[1] < 0)  # los negativos son porcentaje de incremento
      #en el caso de Asteroide-Nave, la masa del asteroide (izq) se incrementa en 10%
      @masa =  @masa + objetoQueChoca.masa  * -valorVidaMasaIzq[1]
    else
      @masa -= valorVidaMasaIzq[1]
    end

#ver...

    copiaAsteroide = Asteroide.new
    copiaAsteroide.vida = temporalVidaIzq
    copiaAsteroide.masa = temporalMasaIzq

    #es recursivo
    #objetoQueChoca.chocar copiaAsteroide  #es un objeto nave, le puedo pedir q le choque el SELF (asteroide)

    valorVidaMasaDer = @situacion["Asteroide"]
    objetoQueChoca.vida -= valorVidaMasaDer[0]
    objetoQueChoca.masa -= valorVidaMasaDer[1]

    #esto calcula efecto al otro objeto (lado derecho), (puede q haya q chocarlo invertido)
#comment            valorVidaMasaDer = @situacion["Asteroide"]
#comment            objetoQueChoca.vida -= valorVidaMasaDer[0]
#comment                objetoQueChoca.masa -= valorVidaMasaDer[1]

=end
  end

  # def calcularEfectoVidaLadoDerecho (objetoLadoDerecho, temporalVidaIzquierda)
  #   valorVidaMasa = @situacion["Nave"]
  #
  #   objetoLadoDerecho.vida -= valorVidaMasa[0]
  #   objetoLadoDerecho.vida
  # end

  # def salidaNombre obj
  #   #aClass = obj.name if obj.type <= Module
  #   #aClass
  #   obj.class.name
  # end

end
