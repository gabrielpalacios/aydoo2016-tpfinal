class CalculadoraDeFactoresPrimos

  def self.calcularFactorPrimo(n)
    n = n.to_i
    vector = []
    p = 2
    if n < 2
      return p
    end

    while n != 1
      while n % p == 0
        vector.push(p)
        n /= p
      end
      p +=1
    end

    return vector
  end

  def calcularFactoresPrimos (n)
    return CalculadoraDeFactoresPrimos.calcularFactorPrimo(n)

  end

end #clase