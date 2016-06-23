require 'rspec'
require_relative '../model/calculadora_de_factores_primos'

describe 'CalculadoraDeFactoresPrimos' do

  it 'testFactorizacionNumero_90' do
    objeto = CalculadoraDeFactoresPrimos.new
    vectorEsperado = [2, 3, 3, 5]
    expect(objeto.calcularFactoresPrimos(90)).to eq vectorEsperado
  end

  it 'testFactorizacionNumero_90bis' do
    objeto = CalculadoraDeFactoresPrimos.calcularFactorPrimo(90)
    vectorEsperado = [2, 3, 3, 5]
    expect(objeto).to eq vectorEsperado
  end

  it 'testFactorizacionNumero_360' do
    objeto = CalculadoraDeFactoresPrimos.new
    vectorEsperado = [2, 2, 2, 3, 3, 5]
    expect(objeto.calcularFactoresPrimos(360)).to eq vectorEsperado
  end


  it 'testFactorizacionNumero_2' do
    objeto = CalculadoraDeFactoresPrimos.new
    vectorEsperado = [2]
    expect(objeto.calcularFactoresPrimos(2)).to eq vectorEsperado
  end

  it 'testFactorizacionNumero_-1dara2' do
    objeto = CalculadoraDeFactoresPrimos.new
    vectorEsperado = 2
    expect(objeto.calcularFactoresPrimos(-1)).to eq vectorEsperado
  end
end