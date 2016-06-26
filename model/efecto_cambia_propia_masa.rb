
class EfectoCambiaPropiaMasa

  def initialize(valor)
    @valor = valor
  end

  def calcular(objetoIzquierdo, objetoQueChocaDerecho)
    objetoIzquierdo.masa =  objetoIzquierdo.masa + (objetoQueChocaDerecho.masa * @valor)

  end

end